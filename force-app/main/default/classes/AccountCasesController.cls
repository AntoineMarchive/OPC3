public with sharing class AccountCasesController {

    @AuraEnabled
    public static list<Case> findCasesBySubject(string accountId, string subjectSearchTerm) {
// system de debug via apex//
system.debug('accountId: ' + accountId);
system.debug('subjectSearchTerm: ' + subjectSearchTerm);

List<Case> results = new List<Case>();
      if (accountId == null || subjectSearchTerm == null) {
          

      }  
      else {
        // recupération des données//                                        //filtre pour recuperer seulement accountId et subject//
        results = [SELECT Id, Subject, AccountId, Status, Priority FROM Case WHERE AccountId = :accountId AND Subject like :subjectSearchTerm];
      }

      return results;
      // ou bien : return [SELECT Id, Subject, AccountId FROM Case WHERE AccountId = :accountId AND Subject = :subject];//
    }


}