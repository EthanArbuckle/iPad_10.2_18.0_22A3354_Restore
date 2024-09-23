@implementation CCDEnrollmentProvisionallyEnrollRequest

- (int64_t)requestType
{
  return 0;
}

- (id)enrollmentURLString
{
  return +[CCDFeatures depProvisionalEnrollmentURLStringWithURLString:](CCDFeatures, "depProvisionalEnrollmentURLStringWithURLString:", CFSTR("https://deviceenrollment.apple.com/v2/enroll"));
}

- (id)requestPayload
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  int v11;
  CCDEnrollmentProvisionallyEnrollRequest *v12;

  v3 = (void *)objc_opt_new(CCDProvisionalEnrollmentRequestPayload, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CCDEnrollmentProvisionallyEnrollRequest nonce](self, "nonce"));

  if (v4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CCDEnrollmentProvisionallyEnrollRequest nonce](self, "nonce"));
    objc_msgSend(v3, "setNonce:", v8);

  }
  else
  {
    v9 = *(NSObject **)(DEPLogObjects(v5, v6, v7) + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = self;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Nonce is NOT provided in %@. Request will probably fail.", (uint8_t *)&v11, 0xCu);
    }
  }
  return v3;
}

- (NSString)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
  objc_storeStrong((id *)&self->_nonce, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonce, 0);
}

@end
