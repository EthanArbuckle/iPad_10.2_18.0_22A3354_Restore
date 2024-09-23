@implementation PKPeerPaymentQuoteCertificatesResponse

- (PKPeerPaymentQuoteCertificatesResponse)initWithData:(id)a3
{
  PKPeerPaymentQuoteCertificatesResponse *v3;
  PKPeerPaymentQuoteCertificatesResponse *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *encryptionCertificates;
  uint64_t v16;
  NSString *encryptionVersion;
  objc_class *v18;
  objc_class *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v26.receiver = self;
  v26.super_class = (Class)PKPeerPaymentQuoteCertificatesResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v26, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    -[PKWebServiceResponse JSONObject](v3, "JSONObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      -[NSObject PKArrayContaining:forKey:](v6, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("encryptionCertificates"), 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v23;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v23 != v11)
              objc_enumerationMutation(v8);
            v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v12), 0);
            objc_msgSend(v7, "safelyAddObject:", v13);

            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
        }
        while (v10);
      }

      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v7);
      v14 = objc_claimAutoreleasedReturnValue();
      encryptionCertificates = v4->_encryptionCertificates;
      v4->_encryptionCertificates = (NSArray *)v14;

      -[NSObject PKStringForKey:](v6, "PKStringForKey:", CFSTR("encryptionVersion"));
      v16 = objc_claimAutoreleasedReturnValue();
      encryptionVersion = v4->_encryptionVersion;
      v4->_encryptionVersion = (NSString *)v16;

    }
    else
    {
      PKLogFacilityTypeGetObject(0xBuLL);
      v6 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
LABEL_14:

        return v4;
      }
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v7;
      v29 = 2114;
      v30 = v20;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);

    }
    goto LABEL_14;
  }
  return v4;
}

- (NSArray)encryptionCertificates
{
  return self->_encryptionCertificates;
}

- (NSString)encryptionVersion
{
  return self->_encryptionVersion;
}

- (BOOL)devSigned
{
  return self->_devSigned;
}

- (void)setDevSigned:(BOOL)a3
{
  self->_devSigned = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptionVersion, 0);
  objc_storeStrong((id *)&self->_encryptionCertificates, 0);
}

@end
