@implementation STSISO18013CredRequest

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STSISO18013CredRequest;
  v4 = a3;
  -[STSCredentialRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_requestByNamespace, CFSTR("requestByNamespace"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_authACL, CFSTR("authACL"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_docType, CFSTR("docType"));

}

- (STSISO18013CredRequest)initWithCoder:(id)a3
{
  id v4;
  STSISO18013CredRequest *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSDictionary *requestByNamespace;
  uint64_t v13;
  NSData *authACL;
  uint64_t v15;
  NSString *docType;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)STSISO18013CredRequest;
  v5 = -[STSCredentialRequest initWithCoder:](&v18, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("requestByNamespace"));
    v11 = objc_claimAutoreleasedReturnValue();
    requestByNamespace = v5->_requestByNamespace;
    v5->_requestByNamespace = (NSDictionary *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("authACL"));
    v13 = objc_claimAutoreleasedReturnValue();
    authACL = v5->_authACL;
    v5->_authACL = (NSData *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("docType"));
    v15 = objc_claimAutoreleasedReturnValue();
    docType = v5->_docType;
    v5->_docType = (NSString *)v15;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_docType, 0);
  objc_storeStrong((id *)&self->_readerAuthInfo, 0);
  objc_storeStrong((id *)&self->_authACL, 0);
  objc_storeStrong((id *)&self->_requestByNamespace, 0);
}

@end
