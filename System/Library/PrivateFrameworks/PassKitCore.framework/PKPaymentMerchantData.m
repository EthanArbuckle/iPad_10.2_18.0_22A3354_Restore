@implementation PKPaymentMerchantData

- (PKPaymentMerchantData)initWithMerchantIdentifier:(id)a3 applicationData:(id)a4 merchantSession:(id)a5
{
  id v8;
  id v9;
  id v10;
  PKPaymentMerchantData *v11;
  uint64_t v12;
  NSString *merchantIdentifier;
  uint64_t v14;
  NSData *applicationData;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PKPaymentMerchantData;
  v11 = -[PKPaymentMerchantData init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    merchantIdentifier = v11->_merchantIdentifier;
    v11->_merchantIdentifier = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    applicationData = v11->_applicationData;
    v11->_applicationData = (NSData *)v14;

    objc_storeStrong((id *)&v11->_merchantSession, a5);
  }

  return v11;
}

- (PKPaymentMerchantData)init
{
  return -[PKPaymentMerchantData initWithMerchantIdentifier:applicationData:merchantSession:](self, "initWithMerchantIdentifier:applicationData:merchantSession:", 0, 0, 0);
}

- (id)encode
{
  void *v3;
  NSData *applicationData;
  void *v5;
  PKPaymentMerchantSession *merchantSession;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  applicationData = self->_applicationData;
  if (applicationData)
  {
    -[NSData SHA256Hash](applicationData, "SHA256Hash");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendData:", v5);

  }
  merchantSession = self->_merchantSession;
  if (merchantSession)
  {
    -[PKPaymentMerchantSession merchantIdentifier](merchantSession, "merchantIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pk_decodeHexadecimal");
  }
  else
  {
    -[NSString dataUsingEncoding:](self->_merchantIdentifier, "dataUsingEncoding:", 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "SHA256Hash");
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendData:", v8);

  objc_msgSend(v3, "SHA256Hash");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)merchantIdentifier
{
  return self->_merchantIdentifier;
}

- (NSData)applicationData
{
  return self->_applicationData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationData, 0);
  objc_storeStrong((id *)&self->_merchantIdentifier, 0);
  objc_storeStrong((id *)&self->_merchantSession, 0);
}

@end
