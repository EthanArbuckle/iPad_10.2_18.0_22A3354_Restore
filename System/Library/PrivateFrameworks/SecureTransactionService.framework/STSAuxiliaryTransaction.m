@implementation STSAuxiliaryTransaction

- (STSAuxiliaryTransaction)initWithCredential:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  STSAuxiliaryTransaction *v9;
  STSAuxiliaryTransaction *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)STSAuxiliaryTransaction;
  v9 = -[STSAuxiliaryTransaction init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_credential, a3);
    objc_storeStrong((id *)&v10->_error, a4);
  }

  return v10;
}

- (BOOL)didSucceed
{
  return self->_error == 0;
}

- (STSAuxiliaryTransaction)initWithCoder:(id)a3
{
  id v4;
  STSAuxiliaryTransaction *v5;
  uint64_t v6;
  STSAuxiliaryCredential *credential;
  uint64_t v8;
  NSError *error;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STSAuxiliaryTransaction;
  v5 = -[STSAuxiliaryTransaction init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("STSAuxiliaryTransactionKeyCredential"));
    v6 = objc_claimAutoreleasedReturnValue();
    credential = v5->_credential;
    v5->_credential = (STSAuxiliaryCredential *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("STSAuxiliaryTransactionKeyError"));
    v8 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  STSAuxiliaryCredential *credential;
  id v5;

  credential = self->_credential;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", credential, CFSTR("STSAuxiliaryTransactionKeyCredential"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_error, CFSTR("STSAuxiliaryTransactionKeyError"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (STSAuxiliaryCredential)credential
{
  return self->_credential;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_credential, 0);
}

@end
