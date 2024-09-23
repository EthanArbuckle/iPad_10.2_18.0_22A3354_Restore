@implementation PKAccountPaymentFundingDetails

- (PKAccountPaymentFundingDetails)initWithDictionary:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKAccountPaymentFundingDetails;
  return -[PKAccountPaymentFundingDetails init](&v4, sel_init, a3);
}

- (id)jsonString
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[PKAccountPaymentFundingDetails jsonDictionaryRepresentation](self, "jsonDictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 2, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;

  if (v5)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v5;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Error forming json dictionary for CloudKit with error: %@", buf, 0xCu);
    }

    v7 = 0;
  }
  else
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v4, 4);
  }

  return v7;
}

- (id)jsonDictionaryRepresentation
{
  return -[PKAccountPaymentFundingDetails jsonDictionaryRepresentationWithCertificatesResponse:](self, "jsonDictionaryRepresentationWithCertificatesResponse:", 0);
}

- (id)jsonDictionaryRepresentationWithCertificatesResponse:(id)a3
{
  id v4;
  void *v5;
  NSData *v6;
  NSData *v7;
  NSData *encryptedData;
  NSData *publicKeyHash;
  void *v10;
  void *v11;
  void *v12;
  id v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_encryptedData)
    goto LABEL_3;
  v14 = 0;
  -[PKAccountPaymentFundingDetails _encryptedDataWithCertificatesResponse:publicKeyHash:](self, "_encryptedDataWithCertificatesResponse:publicKeyHash:", v4, &v14);
  v6 = (NSData *)objc_claimAutoreleasedReturnValue();
  v7 = (NSData *)v14;
  encryptedData = self->_encryptedData;
  self->_encryptedData = v6;

  publicKeyHash = self->_publicKeyHash;
  self->_publicKeyHash = v7;

  if (self->_encryptedData)
  {
LABEL_3:
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", self->_encryptedData, 4);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("data"));
    -[NSData hexEncoding](self->_publicKeyHash, "hexEncoding");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("publicKeyHash"));

    objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("EV_ECC_v1-ASN.1"), CFSTR("encryptionVersion"));
  }
  v12 = (void *)objc_msgSend(v5, "copy");

  return v12;
}

- (id)fundingDetailsUnencryptedDictionary
{
  return 0;
}

- (id)hashComponentWithCertificatesResponse:(id)a3
{
  id v4;
  NSData *encryptedData;
  NSData *v6;
  NSData *v7;
  NSData *v8;
  NSData *publicKeyHash;
  void *v10;
  void *v11;
  id v13;

  v4 = a3;
  encryptedData = self->_encryptedData;
  if (encryptedData)
    goto LABEL_3;
  v13 = 0;
  -[PKAccountPaymentFundingDetails _encryptedDataWithCertificatesResponse:publicKeyHash:](self, "_encryptedDataWithCertificatesResponse:publicKeyHash:", v4, &v13);
  v6 = (NSData *)objc_claimAutoreleasedReturnValue();
  v7 = (NSData *)v13;
  v8 = self->_encryptedData;
  self->_encryptedData = v6;

  publicKeyHash = self->_publicKeyHash;
  self->_publicKeyHash = v7;

  encryptedData = self->_encryptedData;
  if (encryptedData)
  {
LABEL_3:
    -[NSData SHA256Hash](encryptedData, "SHA256Hash");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "base64EncodedStringWithOptions:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_encryptedDataWithCertificatesResponse:(id)a3 publicKeyHash:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PKAccountPaymentFundingDetails fundingDetailsUnencryptedDictionary](self, "fundingDetailsUnencryptedDictionary");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = 0;
  if (!v6 || !v7)
    goto LABEL_14;
  objc_msgSend(v6, "encryptionVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("EV_ECC_v1-ASN.1")) & 1) == 0)
  {

    goto LABEL_13;
  }
  v11 = objc_msgSend(v8, "count");

  if (!v11)
  {
LABEL_13:
    v9 = 0;
    goto LABEL_14;
  }
  +[PKPaymentWebService sharedService](PKPaymentWebService, "sharedService");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "devSigned");

  if (v14)
  {
    PKLogFacilityTypeGetObject(0xEuLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      v22 = v8;
      _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "Encrypting data for schedulePayment request: %{private}@", buf, 0xCu);
    }

  }
  v20 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v8, 1, &v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v20;
  if (!v16)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Could not create data for %@: %@"), objc_opt_class(), v17);
  objc_msgSend(v6, "encryptionCertificates");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  PKFeatureEncryptDataWithCertChain(v16, v18, a4, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicKeyHash, 0);
  objc_storeStrong((id *)&self->_encryptedData, 0);
}

@end
