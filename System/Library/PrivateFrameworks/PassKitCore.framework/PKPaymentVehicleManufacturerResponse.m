@implementation PKPaymentVehicleManufacturerResponse

- (PKPaymentVehicleManufacturerResponse)initWithData:(id)a3
{
  PKPaymentVehicleManufacturerResponse *v3;
  PKPaymentVehicleManufacturerResponse *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSString *encryptionScheme;
  uint64_t v9;
  NSString *ephemeralPublicKey;
  uint64_t v11;
  NSString *publicKeyHash;
  NSObject *v13;
  uint64_t v14;
  NSData *encryptedData;
  objc_class *v16;
  void *v17;
  void *v18;
  id v19;
  objc_super v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)PKPaymentVehicleManufacturerResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v21, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    -[PKWebServiceResponse JSONObject](v3, "JSONObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "PKDictionaryForKey:", CFSTR("oemData"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "PKStringForKey:", CFSTR("version"));
      v7 = objc_claimAutoreleasedReturnValue();
      encryptionScheme = v4->_encryptionScheme;
      v4->_encryptionScheme = (NSString *)v7;

      objc_msgSend(v6, "PKStringForKey:", CFSTR("ephemeralPublicKey"));
      v9 = objc_claimAutoreleasedReturnValue();
      ephemeralPublicKey = v4->_ephemeralPublicKey;
      v4->_ephemeralPublicKey = (NSString *)v9;

      objc_msgSend(v6, "PKStringForKey:", CFSTR("publicKeyHash"));
      v11 = objc_claimAutoreleasedReturnValue();
      publicKeyHash = v4->_publicKeyHash;
      v4->_publicKeyHash = (NSString *)v11;

      objc_msgSend(v6, "PKStringForKey:", CFSTR("data"));
      v13 = objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v13, 1);
        encryptedData = v4->_encryptedData;
        v4->_encryptedData = (NSData *)v14;

      }
    }
    else
    {
      PKLogFacilityTypeGetObject(6uLL);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v23 = v17;
        v24 = 2112;
        v25 = v18;
        v19 = v18;
        _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Malformed response: expected dictionary and received %{public}@ inside %@", buf, 0x16u);

      }
      v6 = v4;
      v4 = 0;
    }

  }
  return v4;
}

- (PKPaymentVehicleManufacturerResponse)initWithEncryptionScheme:(id)a3 ephemeralPublicKey:(id)a4 publicKeyHash:(id)a5 encryptedData:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  PKPaymentVehicleManufacturerResponse *v14;
  uint64_t v15;
  NSString *encryptionScheme;
  uint64_t v17;
  NSString *ephemeralPublicKey;
  uint64_t v19;
  NSString *publicKeyHash;
  uint64_t v21;
  NSData *encryptedData;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)PKPaymentVehicleManufacturerResponse;
  v14 = -[PKPaymentVehicleManufacturerResponse init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    encryptionScheme = v14->_encryptionScheme;
    v14->_encryptionScheme = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    ephemeralPublicKey = v14->_ephemeralPublicKey;
    v14->_ephemeralPublicKey = (NSString *)v17;

    v19 = objc_msgSend(v12, "copy");
    publicKeyHash = v14->_publicKeyHash;
    v14->_publicKeyHash = (NSString *)v19;

    v21 = objc_msgSend(v13, "copy");
    encryptedData = v14->_encryptedData;
    v14->_encryptedData = (NSData *)v21;

  }
  return v14;
}

- (NSString)encryptionScheme
{
  return self->_encryptionScheme;
}

- (NSString)ephemeralPublicKey
{
  return self->_ephemeralPublicKey;
}

- (NSString)publicKeyHash
{
  return self->_publicKeyHash;
}

- (NSData)encryptedData
{
  return self->_encryptedData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptedData, 0);
  objc_storeStrong((id *)&self->_publicKeyHash, 0);
  objc_storeStrong((id *)&self->_ephemeralPublicKey, 0);
  objc_storeStrong((id *)&self->_encryptionScheme, 0);
}

@end
