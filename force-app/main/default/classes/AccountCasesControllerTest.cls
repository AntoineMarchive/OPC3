@IsTest
private class  AccountCasesControllerTest {
    static final String sub = 'Test Case Subject';
    
    @TestSetup
    static void setup(){
        Account testAccount = TestDataFactory.createTestAccount();
       TestDataFactory.createTestCase(testAccount.Id, sub);
    }

    @IsTest
    static void testGetCases() {
        Account testAccount =[SELECT Id FROM Account LIMIT 1];
        Test.startTest();
        List<case> results = AccountCasesController.findCasesBySubject(testAccount.Id,  sub);
        Test.stopTest();
        Assert.areEqual(1, results.size(), 'Should return one case');

    }
}