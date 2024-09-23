@implementation CCDEnrollmentUploadPushTokenRequest

- (int64_t)requestType
{
  return 4;
}

- (id)enrollmentURLString
{
  return +[CCDFeatures deviceRegisterURLStringWithURLString:](CCDFeatures, "deviceRegisterURLStringWithURLString:", CFSTR("https://iprofiles.apple.com/deviceRegister"));
}

- (id)requestPayload
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_new(CCDUploadPushTokenRequestPayload, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CCDEnrollmentUploadPushTokenRequest pushToken](self, "pushToken"));
  objc_msgSend(v3, "setPushToken:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CCDEnrollmentUploadPushTokenRequest pushTopic](self, "pushTopic"));
  objc_msgSend(v3, "setPushTopic:", v5);

  return v3;
}

- (NSString)pushTopic
{
  return self->_pushTopic;
}

- (void)setPushTopic:(id)a3
{
  objc_storeStrong((id *)&self->_pushTopic, a3);
}

- (NSData)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
  objc_storeStrong((id *)&self->_pushToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_pushTopic, 0);
}

@end
