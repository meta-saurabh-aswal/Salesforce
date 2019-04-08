public class School
{
    //To return all the students of a class with classId argument.
    public static Map<String, List<Student__c>> studentMap(String classId)
    {
        Map<String, List<Student__c>> result = new Map<String, List<Student__c>>();
        List<Student__c> studentList = new List<Student__c>([SELECT Name FROM Student__c WHERE Class__r.Name = :classId]);
        result.put(classId, studentList);
        return result;
    }

    //To calculate working days between two dates (Saturday & Sunday are non-working days).
    public static void workingDays()
    {
        Datetime date1 = Datetime.newInstance(2019, 03, 08);
        Datetime date2 = Datetime.newInstance(2019, 04, 08);
        
        //To use the daysBetween() method.
        Date d1 = Date.newInstance(date1.year(), date1.month(), date1.day());
        Date d2 = Date.newInstance(date2.year(), date2.month(), date2.day());
        
        //current day of date1 is already skipped by daysBetween() method.
        Integer daysBw = d1.daysBetween(d2) -1;			// -1 to remove the current day of date2.
        Integer daysLeft = Math.Mod(daysBw, 7);
        
        //To adject the date to removed current date1 & date2 days.
        date1.addDays(1);
        date2.addDays(-1);
        
        //To find the current date for counting.
        Datetime currentDate = date1.addDays(daysBw - daysLeft);
        Integer count = 0;
               
        for(Integer i = 1; i<=daysLeft; i++)
        {
            Datetime itr = date1.addDays(i);
            
            if(!(itr.format('EEEE').equalsIgnoreCase('Sunday') || itr.format('EEEE').equalsIgnoreCase('Saturday')))
            {
                count++;
            }
        }
		
        Integer workDays = ((Integer) daysBw/7)*5 + count;
        
        System.debug('Working days : '+workdays);
    }
    
    //To display all sObjects.
    public static void allSObjects()
    {
        Map<String, Schema.SObjectType> allSObj = Schema.getGlobalDescribe();
		
        for(String key: allSObj.keySet())
            System.debug(key);
	}
}