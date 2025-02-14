@IsTest
private class CaseSelectorTest {
    private static final String TEST_SUBJECT = 'Test Case Subject';
    @TestSetup
    static void setup() {
        // Création d'un compte de test
        Account testAccount = TestDataFactory.createTestAccount();
        // Création d'un cas associé à ce compte
        TestDataFactory.createTestCase(testAccount.Id, TEST_SUBJECT);
    }

    
    @IsTest
    static void testfindCasesBySubject() {
        // Récupération du compte de test
        Account testAccount = [SELECT Id FROM Account LIMIT 1];
        // Lancer le test
        Test.startTest();
        List<Case> results = CaseSelector.findCasesBySubject(testAccount.Id, TEST_SUBJECT);
        
        Test.stopTest();
        Assert.areNotEqual(0, results.size(), 'Should return at least one Case');
    }
}