@implementation STSVASCredential

+ (id)vasCredentialWithMerchantId:(id)a3 data:(id)a4 mobileToken:(id)a5 userInterventionRequired:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  id v11;
  STSVASCredential *v12;

  v6 = a6;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = -[STSVASCredential initWithMerchantId:data:mobileToken:userInterventionRequired:]([STSVASCredential alloc], "initWithMerchantId:data:mobileToken:userInterventionRequired:", v11, v10, v9, v6);

  return v12;
}

- (STSVASCredential)initWithMerchantId:(id)a3 data:(id)a4 mobileToken:(id)a5 userInterventionRequired:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  STSVASCredential *v14;
  STSVASCredential *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)STSVASCredential;
  v14 = -[STSAuxiliaryCredential initWithType:](&v17, sel_initWithType_, 1);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_merchantId, a3);
    objc_storeStrong((id *)&v15->_data, a4);
    objc_storeStrong((id *)&v15->_mobileToken, a5);
    v15->_userInterventionRequired = a6;
  }

  return v15;
}

- (STSVASCredential)initWithCoder:(id)a3
{
  id v4;
  STSVASCredential *v5;
  uint64_t v6;
  NSData *merchantId;
  uint64_t v8;
  NSData *data;
  uint64_t v10;
  NSData *mobileToken;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STSVASCredential;
  v5 = -[STSAuxiliaryCredential initWithType:](&v13, sel_initWithType_, 1);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("STSVASCredentialKeyMerchantId"));
    v6 = objc_claimAutoreleasedReturnValue();
    merchantId = v5->_merchantId;
    v5->_merchantId = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("STSVASCredentialKeyData"));
    v8 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("STSVASCredentialKeyMobileToken"));
    v10 = objc_claimAutoreleasedReturnValue();
    mobileToken = v5->_mobileToken;
    v5->_mobileToken = (NSData *)v10;

    v5->_userInterventionRequired = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("STSVASCredentialKeyUserInterventionRequired"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STSVASCredential;
  v4 = a3;
  -[STSAuxiliaryCredential encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_merchantId, CFSTR("STSVASCredentialKeyMerchantId"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_data, CFSTR("STSVASCredentialKeyData"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_mobileToken, CFSTR("STSVASCredentialKeyMobileToken"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_userInterventionRequired, CFSTR("STSVASCredentialKeyUserInterventionRequired"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)merchantId
{
  return self->_merchantId;
}

- (void)setMerchantId:(id)a3
{
  objc_storeStrong((id *)&self->_merchantId, a3);
}

- (BOOL)userInterventionRequired
{
  return self->_userInterventionRequired;
}

- (void)setUserInterventionRequired:(BOOL)a3
{
  self->_userInterventionRequired = a3;
}

- (NSData)mobileToken
{
  return self->_mobileToken;
}

- (void)setMobileToken:(id)a3
{
  objc_storeStrong((id *)&self->_mobileToken, a3);
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_mobileToken, 0);
  objc_storeStrong((id *)&self->_merchantId, 0);
}

@end
