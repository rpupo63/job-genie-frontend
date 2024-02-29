class BaseAPI {
  static String api = "https://api.karpedemi.com";
  Uri userPath = Uri.parse('$api/me');
  Uri loginPath = Uri.parse('$api/login');
  Uri authPath = Uri.parse("$api/auth");
  Uri logoutPath = Uri.parse("$api/logout");
  Uri signupPath = Uri.parse("$api/signup");
  Uri completionStatus = Uri.parse("$api/medication-taken");
  Uri signaturePath = Uri.parse("$api/signature");
  Uri pillsPath = Uri.parse("$api/pills");
  Uri questionnairePath = Uri.parse("$api/questionnaire");
  Uri savingsPath = Uri.parse("$api/savings");
  Uri waitlistPath = Uri.parse("$api/savings");
  // more routes
  Map<String, String> headers = {
    "Content-Type": "application/json; charset=UTF-8"
  };
}
