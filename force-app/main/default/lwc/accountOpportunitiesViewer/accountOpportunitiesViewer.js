import { LightningElement, api, wire, track } from 'lwc';
import getOpportunities from '@salesforce/apex/AccountOpportunitiesController.getOpportunities';
import { refreshApex } from '@salesforce/apex';

export default class AccountOpportunitiesViewer extends LightningElement {
    @api recordId;
    @track opportunities = []; // Liste des opportunités récupérées
    @track error = {};
    @track showError = false; // ajout d'une propriété pour afficher ou non l'erreur
    wiredOpportunities // ajout d'une propriété pour stocker le résultat de l'appel Apex
    
    columns = [
        { label: 'Nom Opportunité', fieldName: 'Name', type: 'text' },
        { label: 'Montant', fieldName: 'Amount', type: 'currency' },
        { label: 'Date de Clôture', fieldName: 'CloseDate', type: 'date' },
        { label: 'Phase', fieldName: 'StageName', type: 'text' }
    ];

    // Colonnes définies pour le tableau des opportunités
    @wire(getOpportunities, { accountId: '$recordId' }) //error inversion recordId avec accountId
    wiredOpportunities({ error, data }) {
        if (data) {
            // Récupération des opportunités via un appel Apex
            this.opportunities = data;
            this.showError = false; // Réinitialiser l'affichage de l'erreur
        } else if (error) {
            // En cas d'erreur, stockez-la pour un affichage
            this.error = error;
            this.opportunities = undefined;
            this.showError = true; // Activer l'affichage de l'erreur
        }
    }

    // ajout d'une fonction de rafraichissement
    handleRafraichir() {
        return refreshApex(this.wiredOpportunities);
    }

}