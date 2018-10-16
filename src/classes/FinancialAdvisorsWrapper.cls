public class FinancialAdvisorsWrapper {

	public List<Financial_Advisor> Accounts;

	public class Customers {
		public String FirstName;
		public String LastName;
		public String Email;
		public String Phone;
		public String Address;
		public String CustomerNumber;
	}

	public class Financial_Advisor {
		public String AccountNumber;
		public String AccountName;
		public String AccountStatus;
		public String AsOfDate;
		public List<Customers> Customers;
	}

	
	public static List<FinancialAdvisorsWrapper> parse(String json) {
		return (List<FinancialAdvisorsWrapper>) System.JSON.deserialize(json,
		 List<FinancialAdvisorsWrapper>.class);
	}
}