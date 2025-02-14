public with sharing class CaseSelector {
      /**
     * Méthode pour récupérer les cas d'un compte avec un filtre optionnel sur le sujet.
     * @param accountId : ID de l'Account pour lequel on récupère les cas.
     * @param subject : Filtre optionnel sur le champ "Subject".
     * @return Liste des cas correspondant aux critères.
     */
    public static List<Case> findCasesBySubject(Id accountId, String subject) {
        String query = 'SELECT Id, CaseNumber, AccountId, Subject, Status, CreatedDate, Owner.Name FROM Case WHERE AccountId = :accountId ';
       
        // Ajouter un filtre sur le sujet si spécifié
        if (String.isNotBlank(subject)) {
            subject=  '%'+subject+'%';
            query += ' AND Subject  LIKE :subject';
           
        }

        // Exécuter la requête et retourner les résultats
        return Database.query(query);
    }
    
}