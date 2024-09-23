@implementation PKVirtualCardEncryptionFields

- (PKVirtualCardEncryptionFields)initWithCertificates:(id)a3
{
  id v4;
  PKVirtualCardEncryptionFields *v5;
  uint64_t v6;
  NSArray *certificates;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKVirtualCardEncryptionFields;
  v5 = -[PKVirtualCardEncryptionFields init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    certificates = v5->_certificates;
    v5->_certificates = (NSArray *)v6;

    objc_storeStrong((id *)&v5->_encryptionVersion, CFSTR("EV_ECC_v1"));
    v5->_lock._os_unfair_lock_opaque = 0;
  }

  return v5;
}

- (PKVirtualCardEncryptionFields)init
{
  return -[PKVirtualCardEncryptionFields initWithCertificates:](self, "initWithCertificates:", 0);
}

- (void)prepareCertificateWithQueue:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  PKLogFacilityTypeGetObject(0xEuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Getting persistent BAA certificate for web request", buf, 2u);
  }

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__PKVirtualCardEncryptionFields_prepareCertificateWithQueue_completion___block_invoke;
  v10[3] = &unk_1E2ACF2F0;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  PKPersistentBAACertificateAndKey(0, v6, v10);

}

void __72__PKVirtualCardEncryptionFields_prepareCertificateWithQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "count"))
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), a2);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
  }
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(void))(v4 + 16))();

}

- (void)prepareOneTimeCertificateWithQueue:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  PKLogFacilityTypeGetObject(0xEuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FC92000, v8, OS_LOG_TYPE_DEFAULT, "Getting one time BAA certificate for web request", buf, 2u);
  }

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __79__PKVirtualCardEncryptionFields_prepareOneTimeCertificateWithQueue_completion___block_invoke;
  v10[3] = &unk_1E2ACF2F0;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  PKGenerateOneTimeBAACertificate(0, v6, v10);

}

void __79__PKVirtualCardEncryptionFields_prepareOneTimeCertificateWithQueue_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(void);
  uint64_t v12;
  id v13;

  v13 = a2;
  v8 = a4;
  v9 = objc_msgSend(v13, "count");
  if (!v8 && a3 && v9)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), a2);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
    v10 = *(_QWORD *)(a1 + 40);
    if (v10)
    {
      v11 = *(void (**)(void))(v10 + 16);
LABEL_8:
      v11();
    }
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 40);
    if (v12)
    {
      v11 = *(void (**)(void))(v12 + 16);
      goto LABEL_8;
    }
  }

}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *encryptionVersion;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  if (-[NSArray count](self->_certificates, "count"))
  {
    -[NSArray pk_arrayByApplyingBlock:](self->_certificates, "pk_arrayByApplyingBlock:", &__block_literal_global_329);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("certificates"));

  }
  os_unfair_lock_unlock(&self->_lock);
  encryptionVersion = self->_encryptionVersion;
  if (encryptionVersion)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", encryptionVersion, CFSTR("encryptionVersion"));
  v6 = (void *)objc_msgSend(v3, "copy");

  return v6;
}

uint64_t __57__PKVirtualCardEncryptionFields_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "base64EncodedStringWithOptions:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptionVersion, 0);
  objc_storeStrong((id *)&self->_certificates, 0);
}

@end
