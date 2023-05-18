/*
 * Class Name: AccountDefaultContactTest
 * Description:This class is used as a test class for Flow 'Account Default Contact Creation flow'
*/
@isTest
public class AccountDefaultContactTest 
{
    //This Test method is used for creation if account and contact should be created related to it
	@isTest
    public static void accountCreationTest()
    {
        Account acc=new Account();
        acc.name='test asy';
        acc.Type='Customer - Direct';
        acc.Active1__c=true;
        acc.Account_Activation_Summary__c='test summery';
        acc.Phone='8765432123';
        acc.Company_Email__c='test@gmail.com';
        insert acc;
        List<Contact> con=[Select id,AccountId from Contact where AccountId=:acc.id];
        System.assert(con.size()>0);
    }
    //This Test method is used for creation but at that time that account is not activated so no contact is created 
    //but when account is updated to activate contact sholud be created.
    @isTest
    public static void accountUpdationTest()
    {
        Account acc=new Account();
        acc.name='test asy2';
        acc.Type='Customer - Direct';
        acc.Account_Activation_Summary__c='test summery';
        acc.Phone='8765432123';
        acc.Company_Email__c='test@gmail.com';
        insert acc;
        List<Contact> con=[Select id,AccountId from Contact where AccountId=:acc.id];
        System.assert(con.size()==0);// no contact created
        acc.Active1__c=true;
        acc.Account_Activation_Summary__c='test summery';
        update acc;
        List<Contact> con2=[Select id,AccountId from Contact where AccountId=:acc.id];
        System.assert(con2.size()>0);//contact created
    }
}