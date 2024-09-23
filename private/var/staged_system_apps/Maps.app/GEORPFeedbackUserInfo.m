@implementation GEORPFeedbackUserInfo

+ (id)userCredentialsForContactBackEmailAddress:(id)a3 userEnteredEmailAddress:(id)a4 pushToken:(id)a5
{
  id v6;
  id v7;
  id v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init((Class)GEORPFeedbackUserInfo);
  objc_msgSend(v8, "setUserEmail:", v7);

  objc_msgSend(v8, "setPreferredEmail:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[GEORPUserCredentials _credentialsForPrimaryICloudAccount](GEORPUserCredentials, "_credentialsForPrimaryICloudAccount"));
  objc_msgSend(v8, "setUserCredentials:", v9);

  return v8;
}

@end
