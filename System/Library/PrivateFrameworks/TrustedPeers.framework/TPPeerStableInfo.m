@implementation TPPeerStableInfo

- (TPPeerStableInfo)initWithClock:(unint64_t)a3 frozenPolicyVersion:(id)a4 flexiblePolicyVersion:(id)a5 policySecrets:(id)a6 syncUserControllableViews:(int)a7 secureElementIdentity:(id)a8 walrusSetting:(id)a9 webAccess:(id)a10 deviceName:(id)a11 serialNumber:(id)a12 osVersion:(id)a13 signingKeyPair:(id)a14 recoverySigningPubKey:(id)a15 recoveryEncryptionPubKey:(id)a16 isInheritedAccount:(BOOL)a17 error:(id *)a18
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  TPPBPeerStableInfo *v27;
  void *v28;
  void *v29;
  void *v30;
  TPPBPeerStableInfo *v31;
  void *v32;
  TPPeerStableInfo *v33;
  id v36;
  void *context;
  id v38;
  id v39;
  id v40;
  id v41;
  id v44;
  _QWORD v45[4];
  TPPBPeerStableInfo *v46;

  v44 = a4;
  v21 = a5;
  v22 = a6;
  v40 = a8;
  v39 = a9;
  v38 = a10;
  v23 = a11;
  v36 = a12;
  v24 = a13;
  v41 = a14;
  v25 = a15;
  v26 = a16;
  context = (void *)MEMORY[0x1DF0E9908]();
  v27 = objc_alloc_init(TPPBPeerStableInfo);
  -[TPPBPeerStableInfo setClock:](v27, "setClock:", a3);
  -[TPPBPeerStableInfo setFrozenPolicyVersion:](v27, "setFrozenPolicyVersion:", objc_msgSend(v44, "versionNumber"));
  objc_msgSend(v44, "policyHash");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPPBPeerStableInfo setFrozenPolicyHash:](v27, "setFrozenPolicyHash:", v28);

  -[TPPBPeerStableInfo setFlexiblePolicyVersion:](v27, "setFlexiblePolicyVersion:", objc_msgSend(v21, "versionNumber"));
  objc_msgSend(v21, "policyHash");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPPBPeerStableInfo setFlexiblePolicyHash:](v27, "setFlexiblePolicyHash:", v29);

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v22, "count"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPPBPeerStableInfo setPolicySecrets:](v27, "setPolicySecrets:", v30);

  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __283__TPPeerStableInfo_initWithClock_frozenPolicyVersion_flexiblePolicyVersion_policySecrets_syncUserControllableViews_secureElementIdentity_walrusSetting_webAccess_deviceName_serialNumber_osVersion_signingKeyPair_recoverySigningPubKey_recoveryEncryptionPubKey_isInheritedAccount_error___block_invoke;
  v45[3] = &unk_1EA8BF628;
  v46 = v27;
  v31 = v27;
  objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", v45);
  -[TPPBPeerStableInfo setDeviceName:](v31, "setDeviceName:", v23);
  -[TPPBPeerStableInfo setUserControllableViewStatus:](v31, "setUserControllableViewStatus:", a7);
  -[TPPBPeerStableInfo setSerialNumber:](v31, "setSerialNumber:", v36);
  -[TPPBPeerStableInfo setOsVersion:](v31, "setOsVersion:", v24);
  -[TPPBPeerStableInfo setRecoveryEncryptionPublicKey:](v31, "setRecoveryEncryptionPublicKey:", v26);
  -[TPPBPeerStableInfo setRecoverySigningPublicKey:](v31, "setRecoverySigningPublicKey:", v25);
  -[TPPBPeerStableInfo setSecureElementIdentity:](v31, "setSecureElementIdentity:", v40);
  -[TPPBPeerStableInfo setWalrus:](v31, "setWalrus:", v39);
  -[TPPBPeerStableInfo setWebAccess:](v31, "setWebAccess:", v38);
  -[TPPBPeerStableInfo setIsInheritedAccount:](v31, "setIsInheritedAccount:", a17);
  -[TPPBPeerStableInfo data](v31, "data");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(context);
  v33 = -[TPPeerStableInfo initWithData:signingKeyPair:error:](self, "initWithData:signingKeyPair:error:", v32, v41, a18);

  return v33;
}

- (TPPeerStableInfo)initWithData:(id)a3 sig:(id)a4
{
  id v6;
  id v7;
  void *v8;
  TPPBPeerStableInfo *v9;
  TPPeerStableInfo *v10;
  TPTypedSignedData *v11;
  TPTypedSignedData *tsd;
  TPPeerStableInfo *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1DF0E9908]();
  v9 = -[TPPBPeerStableInfo initWithData:]([TPPBPeerStableInfo alloc], "initWithData:", v6);

  objc_autoreleasePoolPop(v8);
  if (v9)
  {
    v15.receiver = self;
    v15.super_class = (Class)TPPeerStableInfo;
    v10 = -[TPPeerStableInfo init](&v15, sel_init);
    if (v10)
    {
      v11 = -[TPTypedSignedData initWithData:sig:signatureTypeName:]([TPTypedSignedData alloc], "initWithData:sig:signatureTypeName:", v6, v7, CFSTR("TPPB.PeerStableInfo"));
      tsd = v10->_tsd;
      v10->_tsd = v11;

    }
    self = v10;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (TPPeerStableInfo)initWithData:(id)a3 signingKeyPair:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  TPTypedSignedData *v10;
  TPPeerStableInfo *v11;
  TPPeerStableInfo *v12;
  TPPeerStableInfo *v13;
  objc_super v15;

  v8 = a4;
  v9 = a3;
  v10 = -[TPTypedSignedData initWithData:key:signatureTypeName:error:]([TPTypedSignedData alloc], "initWithData:key:signatureTypeName:error:", v9, v8, CFSTR("TPPB.PeerStableInfo"), a5);

  if (v10)
  {
    v15.receiver = self;
    v15.super_class = (Class)TPPeerStableInfo;
    v11 = -[TPPeerStableInfo init](&v15, sel_init);
    v12 = v11;
    if (v11)
      objc_storeStrong((id *)&v11->_tsd, v10);
    self = v12;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)pb
{
  TPPBPeerStableInfo *v3;
  void *v4;
  TPPBPeerStableInfo *v5;

  v3 = [TPPBPeerStableInfo alloc];
  -[TPPeerStableInfo data](self, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[TPPBPeerStableInfo initWithData:](v3, "initWithData:", v4);

  return v5;
}

- (unint64_t)clock
{
  void *v3;
  void *v4;
  unint64_t v5;

  v3 = (void *)MEMORY[0x1DF0E9908](self, a2);
  -[TPPeerStableInfo pb](self, "pb");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "clock");

  objc_autoreleasePoolPop(v3);
  return v5;
}

- (TPPolicyVersion)frozenPolicyVersion
{
  void *v3;
  void *v4;
  TPPolicyVersion *v5;
  uint64_t v6;
  void *v7;
  TPPolicyVersion *v8;

  v3 = (void *)MEMORY[0x1DF0E9908](self, a2);
  -[TPPeerStableInfo pb](self, "pb");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [TPPolicyVersion alloc];
  v6 = objc_msgSend(v4, "frozenPolicyVersion");
  objc_msgSend(v4, "frozenPolicyHash");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[TPPolicyVersion initWithVersion:hash:](v5, "initWithVersion:hash:", v6, v7);

  objc_autoreleasePoolPop(v3);
  return v8;
}

- (TPPolicyVersion)flexiblePolicyVersion
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1DF0E9908](self, a2);
  -[TPPeerStableInfo pb](self, "pb");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[TPPeerStableInfo flexiblePolicyVersionFromPb:](TPPeerStableInfo, "flexiblePolicyVersionFromPb:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return (TPPolicyVersion *)v5;
}

- (NSDictionary)policySecrets
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1DF0E9908](self, a2);
  -[TPPeerStableInfo pb](self, "pb");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[TPPeerStableInfo policySecretsFromPb:](TPPeerStableInfo, "policySecretsFromPb:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return (NSDictionary *)v5;
}

- (NSString)deviceName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1DF0E9908](self, a2);
  -[TPPeerStableInfo pb](self, "pb");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pbToNullable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return (NSString *)v6;
}

- (NSString)serialNumber
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1DF0E9908](self, a2);
  -[TPPeerStableInfo pb](self, "pb");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serialNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pbToNullable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return (NSString *)v6;
}

- (NSString)osVersion
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1DF0E9908](self, a2);
  -[TPPeerStableInfo pb](self, "pb");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "osVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return (NSString *)v5;
}

- (NSData)recoverySigningPublicKey
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1DF0E9908](self, a2);
  -[TPPeerStableInfo pb](self, "pb");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recoverySigningPublicKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pbToNullable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return (NSData *)v6;
}

- (NSData)recoveryEncryptionPublicKey
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1DF0E9908](self, a2);
  -[TPPeerStableInfo pb](self, "pb");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recoveryEncryptionPublicKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pbToNullable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return (NSData *)v6;
}

- (int)syncUserControllableViews
{
  void *v3;
  void *v4;
  int v5;

  v3 = (void *)MEMORY[0x1DF0E9908](self, a2);
  -[TPPeerStableInfo pb](self, "pb");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userControllableViewStatus");

  objc_autoreleasePoolPop(v3);
  return v5;
}

- (TPPBSecureElementIdentity)secureElementIdentity
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1DF0E9908](self, a2);
  -[TPPeerStableInfo pb](self, "pb");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "secureElementIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return (TPPBSecureElementIdentity *)v5;
}

- (TPPBPeerStableInfoSetting)walrusSetting
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1DF0E9908](self, a2);
  -[TPPeerStableInfo pb](self, "pb");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "walrus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return (TPPBPeerStableInfoSetting *)v5;
}

- (TPPBPeerStableInfoSetting)webAccess
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1DF0E9908](self, a2);
  -[TPPeerStableInfo pb](self, "pb");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "webAccess");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return (TPPBPeerStableInfoSetting *)v5;
}

- (BOOL)isInheritedAccount
{
  void *v3;
  void *v4;
  char v5;

  v3 = (void *)MEMORY[0x1DF0E9908](self, a2);
  -[TPPeerStableInfo pb](self, "pb");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isInheritedAccount");

  objc_autoreleasePoolPop(v3);
  return v5;
}

- (BOOL)checkSignatureWithKey:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[TPPeerStableInfo tsd](self, "tsd");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "checkSignatureWithKey:", v4);

  return v6;
}

- (BOOL)isEqualToPeerStableInfo:(id)a3
{
  TPPeerStableInfo *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (TPPeerStableInfo *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    -[TPPeerStableInfo data](self, "data");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPPeerStableInfo data](v4, "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToData:", v6))
    {
      -[TPPeerStableInfo sig](self, "sig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[TPPeerStableInfo sig](v4, "sig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToData:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1DF0E9908](self, a2);
  -[TPPeerStableInfo pb](self, "pb");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1DF0E9908](self, a2);
  -[TPPeerStableInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return v5;
}

- (NSData)data
{
  void *v2;
  void *v3;

  -[TPPeerStableInfo tsd](self, "tsd");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (NSData)sig
{
  void *v2;
  void *v3;

  -[TPPeerStableInfo tsd](self, "tsd");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)bestPolicyVersion
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[TPPeerStableInfo flexiblePolicyVersion](self, "flexiblePolicyVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[TPPeerStableInfo frozenPolicyVersion](self, "frozenPolicyVersion");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  TPPeerStableInfo *v4;
  BOOL v5;

  v4 = (TPPeerStableInfo *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[TPPeerStableInfo isEqualToPeerStableInfo:](self, "isEqualToPeerStableInfo:", v4);
  }

  return v5;
}

- (TPTypedSignedData)tsd
{
  return self->_tsd;
}

- (void)setTsd:(id)a3
{
  objc_storeStrong((id *)&self->_tsd, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tsd, 0);
}

void __283__TPPeerStableInfo_initWithClock_frozenPolicyVersion_flexiblePolicyVersion_policySecrets_syncUserControllableViews_secureElementIdentity_walrusSetting_webAccess_deviceName_serialNumber_osVersion_signingKeyPair_recoverySigningPubKey_recoveryEncryptionPubKey_isInheritedAccount_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  TPPBPolicySecret *v8;

  v5 = a3;
  v6 = a2;
  v8 = objc_alloc_init(TPPBPolicySecret);
  -[TPPBPolicySecret setName:](v8, "setName:", v6);

  -[TPPBPolicySecret setSecret:](v8, "setSecret:", v5);
  objc_msgSend(*(id *)(a1 + 32), "policySecrets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v8);

}

+ (id)flexiblePolicyVersionFromPb:(id)a3
{
  id v3;
  void *v4;
  TPPolicyVersion *v5;
  uint64_t v6;
  void *v7;
  TPPolicyVersion *v8;

  v3 = a3;
  objc_msgSend(v3, "flexiblePolicyHash");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length") || objc_msgSend(v3, "flexiblePolicyVersion"))
  {
    v5 = [TPPolicyVersion alloc];
    v6 = objc_msgSend(v3, "flexiblePolicyVersion");
    objc_msgSend(v3, "flexiblePolicyHash");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[TPPolicyVersion initWithVersion:hash:](v5, "initWithVersion:hash:", v6, v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)policySecretsFromPb:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "policySecrets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E08];
    objc_msgSend(v3, "policySecrets");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v3, "policySecrets", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v14, "secret");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "name");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, v16);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
