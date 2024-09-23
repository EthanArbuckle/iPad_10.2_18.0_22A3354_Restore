@implementation PKPaymentBackgroundRegisterCredentialRecord

- (PKPaymentBackgroundRegisterCredentialRecord)initWithCredentialIdentifier:(id)a3
{
  id v5;
  PKPaymentBackgroundRegisterCredentialRecord *v6;
  PKPaymentBackgroundRegisterCredentialRecord *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentBackgroundRegisterCredentialRecord;
  v6 = -[PKPaymentBackgroundRegisterCredentialRecord init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    -[PKPaymentBackgroundDownloadRecord setTaskType:](v6, "setTaskType:", 5);
    objc_storeStrong((id *)&v7->_credentialIdentifier, a3);
  }

  return v7;
}

- (PKPaymentBackgroundRegisterCredentialRecord)initWithCoder:(id)a3
{
  id v4;
  PKPaymentBackgroundRegisterCredentialRecord *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentBackgroundRegisterCredentialRecord;
  v5 = -[PKPaymentBackgroundDownloadRecord initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("credentialIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentBackgroundRegisterCredentialRecord setCredentialIdentifier:](v5, "setCredentialIdentifier:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("responseData"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentBackgroundRegisterCredentialRecord setResponseData:](v5, "setResponseData:", v7);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPaymentBackgroundRegisterCredentialRecord;
  v4 = a3;
  -[PKPaymentBackgroundDownloadRecord encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_credentialIdentifier, CFSTR("credentialIdentifier"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_responseData, CFSTR("responseData"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)credentialIdentifier
{
  return self->_credentialIdentifier;
}

- (void)setCredentialIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSData)responseData
{
  return self->_responseData;
}

- (void)setResponseData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseData, 0);
  objc_storeStrong((id *)&self->_credentialIdentifier, 0);
}

@end
