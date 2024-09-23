@implementation PKPaymentSetupAssistantCoreCredential

- (PKPaymentSetupAssistantCoreCredential)initWithPaymentCredential:(id)a3
{
  id v5;
  PKPaymentSetupAssistantCoreCredential *v6;
  uint64_t v7;
  NSString *title;
  uint64_t v9;
  NSString *subtitle;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  NSString *uniqueIdentifier;
  void *v15;
  uint64_t v16;
  NSString *v17;
  id v18;
  uint64_t v19;
  NSString *v20;
  objc_class *v22;
  objc_super v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKPaymentSetupAssistantCoreCredential;
  v6 = -[PKPaymentSetupAssistantCoreCredential init](&v23, sel_init);
  if (!v6)
    goto LABEL_16;
  objc_msgSend(v5, "longDescription");
  v7 = objc_claimAutoreleasedReturnValue();
  title = v6->_title;
  v6->_title = (NSString *)v7;

  objc_msgSend(v5, "detailDescriptionWithEnvironment:", 1);
  v9 = objc_claimAutoreleasedReturnValue();
  subtitle = v6->_subtitle;
  v6->_subtitle = (NSString *)v9;

  objc_storeStrong((id *)&v6->_credential, a3);
  if (objc_msgSend(v5, "isRemoteCredential"))
  {
    objc_msgSend(v5, "remoteCredential");
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v12 = v11;
    -[NSObject serialNumber](v11, "serialNumber");
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    uniqueIdentifier = v6->_uniqueIdentifier;
    v6->_uniqueIdentifier = (NSString *)v13;

    goto LABEL_14;
  }
  if (objc_msgSend(v5, "isLocalPassCredential"))
  {
    objc_msgSend(v5, "localPassCredential");
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (objc_msgSend(v5, "isAccountCredential"))
  {
    objc_msgSend(v5, "accountCredential");
    v12 = objc_claimAutoreleasedReturnValue();
    -[NSObject account](v12, "account");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "accountIdentifier");
    v16 = objc_claimAutoreleasedReturnValue();
LABEL_12:
    v17 = v6->_uniqueIdentifier;
    v6->_uniqueIdentifier = (NSString *)v16;

LABEL_13:
    goto LABEL_14;
  }
  if (objc_msgSend(v5, "isPeerPaymentCredential"))
  {
    objc_msgSend(v5, "peerPaymentCredential");
    v12 = objc_claimAutoreleasedReturnValue();
    -[NSObject account](v12, "account");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "identifier");
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if (objc_msgSend(v5, "isSafariCredential"))
  {
    objc_msgSend(v5, "safariCredential");
    v12 = objc_claimAutoreleasedReturnValue();
    -[NSObject longDescription](v12, "longDescription");
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  PKLogFacilityTypeGetObject(0x28uLL);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v25 = v15;
    v26 = 2112;
    v27 = v5;
    _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "%@: Error - Initialized with payment credential of unsupported type: %@", buf, 0x16u);
    goto LABEL_13;
  }
LABEL_14:

  if (!v6->_uniqueIdentifier)
  {
    v18 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v18, "UUIDString");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v6->_uniqueIdentifier;
    v6->_uniqueIdentifier = (NSString *)v19;

  }
LABEL_16:

  return v6;
}

- (PKPaymentSetupAssistantCoreCredential)initWithPaymentPass:(id)a3
{
  id v4;
  PKPaymentLocalPassCredential *v5;
  PKPaymentSetupAssistantCoreCredential *v6;

  v4 = a3;
  v5 = -[PKPaymentLocalPassCredential initWithPaymentPass:]([PKPaymentLocalPassCredential alloc], "initWithPaymentPass:", v4);

  v6 = -[PKPaymentSetupAssistantCoreCredential initWithPaymentCredential:](self, "initWithPaymentCredential:", v5);
  return v6;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; title: '%@', subtitle: '%@', uniqueID: '%@'>"),
    v5,
    self,
    self->_title,
    self->_subtitle,
    self->_uniqueIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (PKPaymentCredential)credential
{
  return self->_credential;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credential, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
