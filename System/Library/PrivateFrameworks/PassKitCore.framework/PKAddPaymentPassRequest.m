@implementation PKAddPaymentPassRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAddPaymentPassRequest)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKAddPaymentPassRequest;
  return -[PKAddPaymentPassRequest init](&v3, sel_init);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKAddPaymentPassRequest;
  -[PKAddPaymentPassRequest dealloc](&v2, sel_dealloc);
}

- (PKAddPaymentPassRequest)initWithCoder:(id)a3
{
  id v4;
  PKAddPaymentPassRequest *v5;
  uint64_t v6;
  NSData *encryptedPassData;
  uint64_t v8;
  NSData *activationData;
  uint64_t v10;
  NSData *ephemeralPublicKey;
  uint64_t v12;
  NSData *wrappedKey;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKAddPaymentPassRequest;
  v5 = -[PKAddPaymentPassRequest init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("encryptedPassData"));
    v6 = objc_claimAutoreleasedReturnValue();
    encryptedPassData = v5->_encryptedPassData;
    v5->_encryptedPassData = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activationData"));
    v8 = objc_claimAutoreleasedReturnValue();
    activationData = v5->_activationData;
    v5->_activationData = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ephemeralPublicKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    ephemeralPublicKey = v5->_ephemeralPublicKey;
    v5->_ephemeralPublicKey = (NSData *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("wrappedKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    wrappedKey = v5->_wrappedKey;
    v5->_wrappedKey = (NSData *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *encryptedPassData;
  id v5;

  encryptedPassData = self->_encryptedPassData;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", encryptedPassData, CFSTR("encryptedPassData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_activationData, CFSTR("activationData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ephemeralPublicKey, CFSTR("ephemeralPublicKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_wrappedKey, CFSTR("wrappedKey"));

}

- (BOOL)_hasRequiredThirdPartyFields:(BOOL)a3
{
  void (**v4)(void *, BOOL, const __CFString *);
  uint64_t v5;
  char v6;
  _QWORD aBlock[6];
  BOOL v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 1;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__PKAddPaymentPassRequest__hasRequiredThirdPartyFields___block_invoke;
  aBlock[3] = &unk_1E2AD4018;
  v9 = a3;
  aBlock[4] = self;
  aBlock[5] = &v10;
  v4 = (void (**)(void *, BOOL, const __CFString *))_Block_copy(aBlock);
  v4[2](v4, self->_encryptedPassData != 0, CFSTR("encryptedPassData missing"));
  v4[2](v4, self->_activationData != 0, CFSTR("activationData missing"));
  if (self->_ephemeralPublicKey)
    v5 = 1;
  else
    v5 = -[NSString isEqualToString:](self->_encryptionVersion, "isEqualToString:", CFSTR("EV_ECC_v2")) ^ 1;
  v4[2](v4, v5, CFSTR("ephemeralPublicKey missing"));
  v6 = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return v6;
}

void __56__PKAddPaymentPassRequest__hasRequiredThirdPartyFields___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v6 + 24))
  {
    if ((a2 & 1) == 0)
    {
      *(_BYTE *)(v6 + 24) = 0;
      if (*(_BYTE *)(a1 + 48))
      {
        PKLogFacilityTypeGetObject(0);
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          v8 = *(_QWORD *)(a1 + 32);
          v9 = 134218242;
          v10 = v8;
          v11 = 2114;
          v12 = v5;
          _os_log_error_impl(&dword_18FC92000, v7, OS_LOG_TYPE_ERROR, "PKAddPaymentPassRequest (%p): %{public}@", (uint8_t *)&v9, 0x16u);
        }

      }
    }
  }

}

- (BOOL)_hasRequiredFields:(BOOL)a3
{
  PKAddPaymentPassRequest *v4;
  void (**v5)(void *, BOOL, const __CFString *);
  _QWORD aBlock[6];
  BOOL v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;

  v4 = self;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v12 = -[PKAddPaymentPassRequest _hasRequiredThirdPartyFields:](self, "_hasRequiredThirdPartyFields:");
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__PKAddPaymentPassRequest__hasRequiredFields___block_invoke;
  aBlock[3] = &unk_1E2AD4018;
  v8 = a3;
  aBlock[4] = v4;
  aBlock[5] = &v9;
  v5 = (void (**)(void *, BOOL, const __CFString *))_Block_copy(aBlock);
  v5[2](v5, v4->_encryptionVersion != 0, CFSTR("encryptionVersion missing"));
  v5[2](v5, v4->_issuerIdentifier != 0, CFSTR("teamID missing"));
  v5[2](v5, v4->_hostApplicationIdentifier != 0, CFSTR("applicationIdentifier missing"));
  v5[2](v5, v4->_hostApplicationVersion != 0, CFSTR("bundleVersion missing"));
  v5[2](v5, v4->_publicKeyHash != 0, CFSTR("precondition failed"));
  LOBYTE(v4) = *((_BYTE *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return (char)v4;
}

void __46__PKAddPaymentPassRequest__hasRequiredFields___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v6 + 24))
  {
    if ((a2 & 1) == 0)
    {
      *(_BYTE *)(v6 + 24) = 0;
      if (*(_BYTE *)(a1 + 48))
      {
        PKLogFacilityTypeGetObject(0);
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          v8 = *(_QWORD *)(a1 + 32);
          v9 = 134218242;
          v10 = v8;
          v11 = 2114;
          v12 = v5;
          _os_log_error_impl(&dword_18FC92000, v7, OS_LOG_TYPE_ERROR, "PKAddPaymentPassRequest (%p): %{public}@", (uint8_t *)&v9, 0x16u);
        }

      }
    }
  }

}

- (NSData)encryptedPassData
{
  return self->_encryptedPassData;
}

- (void)setEncryptedPassData:(NSData *)encryptedPassData
{
  objc_setProperty_nonatomic_copy(self, a2, encryptedPassData, 8);
}

- (NSData)activationData
{
  return self->_activationData;
}

- (void)setActivationData:(NSData *)activationData
{
  objc_setProperty_nonatomic_copy(self, a2, activationData, 16);
}

- (NSData)ephemeralPublicKey
{
  return self->_ephemeralPublicKey;
}

- (void)setEphemeralPublicKey:(NSData *)ephemeralPublicKey
{
  objc_setProperty_nonatomic_copy(self, a2, ephemeralPublicKey, 24);
}

- (NSData)wrappedKey
{
  return self->_wrappedKey;
}

- (void)setWrappedKey:(NSData *)wrappedKey
{
  objc_setProperty_nonatomic_copy(self, a2, wrappedKey, 32);
}

- (NSString)encryptionVersion
{
  return self->_encryptionVersion;
}

- (void)setEncryptionVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSData)publicKeyHash
{
  return self->_publicKeyHash;
}

- (void)setPublicKeyHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)issuerIdentifier
{
  return self->_issuerIdentifier;
}

- (void)setIssuerIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSData)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)hostApplicationIdentifier
{
  return self->_hostApplicationIdentifier;
}

- (void)setHostApplicationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)hostApplicationVersion
{
  return self->_hostApplicationVersion;
}

- (void)setHostApplicationVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSData)FPInfo
{
  return self->_FPInfo;
}

- (void)setFPInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_FPInfo, 0);
  objc_storeStrong((id *)&self->_hostApplicationVersion, 0);
  objc_storeStrong((id *)&self->_hostApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_issuerIdentifier, 0);
  objc_storeStrong((id *)&self->_publicKeyHash, 0);
  objc_storeStrong((id *)&self->_encryptionVersion, 0);
  objc_storeStrong((id *)&self->_wrappedKey, 0);
  objc_storeStrong((id *)&self->_ephemeralPublicKey, 0);
  objc_storeStrong((id *)&self->_activationData, 0);
  objc_storeStrong((id *)&self->_encryptedPassData, 0);
}

@end
