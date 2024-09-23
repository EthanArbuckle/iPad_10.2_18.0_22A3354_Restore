@implementation _SFKeychainManager

+ (id)defaultManager
{
  if (defaultManager_onceToken != -1)
    dispatch_once(&defaultManager_onceToken, &__block_literal_global);
  return (id)defaultManager_defaultManager;
}

+ (id)defaultOverCommitManager
{
  if (defaultOverCommitManager_onceToken != -1)
    dispatch_once(&defaultOverCommitManager_onceToken, &__block_literal_global_35);
  return (id)defaultOverCommitManager_defaultOverCommitManager;
}

- (id)initManager
{
  _SFKeychainManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *keychainManagerQueue;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_SFKeychainManager;
  v2 = -[_SFKeychainManager init](&v7, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("SFKeychainManager Queue", 0);
    keychainManagerQueue = v2->_keychainManagerQueue;
    v2->_keychainManagerQueue = (OS_dispatch_queue *)v3;

    dispatch_get_global_queue(0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFKeychainManager setKeychainReplyQueue:](v2, "setKeychainReplyQueue:", v5);

  }
  return v2;
}

- (id)initOverCommitManager
{
  _SFKeychainManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *keychainManagerQueue;
  uint64_t v6;
  OS_dispatch_queue *keychainReplyQueue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_SFKeychainManager;
  v2 = -[_SFKeychainManager init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_overcommit();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("SFKeychainManager over commit Queue", v3);
    keychainManagerQueue = v2->_keychainManagerQueue;
    v2->_keychainManagerQueue = (OS_dispatch_queue *)v4;

    dispatch_get_global_queue(0, 2uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    keychainReplyQueue = v2->_keychainReplyQueue;
    v2->_keychainReplyQueue = (OS_dispatch_queue *)v6;

  }
  return v2;
}

- (id)_symmetricKeyAttributesForIdentifier:(id)a3 accessPolicy:(id)a4 key:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v9 = *MEMORY[0x1E0CD6A90];
  v16[0] = *MEMORY[0x1E0CD6C98];
  v16[1] = v9;
  v17[0] = *MEMORY[0x1E0CD6CC0];
  v17[1] = a3;
  v16[2] = *MEMORY[0x1E0CD6AA0];
  v17[2] = *MEMORY[0x1E0C9AE50];
  v10 = (void *)MEMORY[0x1E0C99D80];
  v11 = a3;
  objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(v12, "mutableCopy");
  if (v8)
  {
    objc_msgSend(v8, "keyData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0CD70D8]);

  }
  if (v7)
    objc_msgSend(v13, "addEntriesFromDictionary:", objc_msgSend(v7, "secAccessibilityAttributes"));

  return v13;
}

- (void)setKey:(id)a3 forIdentifier:(id)a4 accessPolicy:(id)a5 resultHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[_SFKeychainManager keychainReplyQueue](self, "keychainReplyQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70___SFKeychainManager_setKey_forIdentifier_accessPolicy_resultHandler___block_invoke;
  block[3] = &unk_1E6F12F38;
  block[4] = self;
  v20 = v11;
  v21 = v12;
  v22 = v10;
  v23 = v13;
  v15 = v13;
  v16 = v10;
  v17 = v12;
  v18 = v11;
  dispatch_async(v14, block);

}

- (__CFDictionary)_commonKeyAttributesForIdentityIdentifier:(id)a3 accessPolicy:(id)a4 key:(id)a5
{
  id v7;
  id v8;
  id v9;
  __CFDictionary *Mutable;
  void *v11;
  const void *v12;
  void *v13;

  v7 = a4;
  v8 = a5;
  v9 = a3;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6C98], (const void *)*MEMORY[0x1E0CD6CC0]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6A90], v9);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6900], v9);

  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6AA0], (const void *)*MEMORY[0x1E0C9AE50]);
  if (v7)
  {
    objc_msgSend(v7, "accessGroup");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = (const void *)*MEMORY[0x1E0CD6898];
      objc_msgSend(v7, "accessGroup");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      CFDictionaryAddValue(Mutable, v12, v13);

    }
    -[__CFDictionary addEntriesFromDictionary:](Mutable, "addEntriesFromDictionary:", objc_msgSend(v7, "secAccessibilityAttributes"));
  }
  if (v8)
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD70E8], (const void *)objc_msgSend(v8, "_secKey"));
  CFAutorelease(Mutable);

  return Mutable;
}

- (__CFDictionary)_privateKeyAttributesForIdentityIdentifier:(id)a3 accessPolicy:(id)a4 key:(id)a5
{
  __CFDictionary *v5;

  v5 = -[_SFKeychainManager _commonKeyAttributesForIdentityIdentifier:accessPolicy:key:](self, "_commonKeyAttributesForIdentityIdentifier:accessPolicy:key:", a3, a4, a5);
  CFDictionaryAddValue(v5, (const void *)*MEMORY[0x1E0CD69F8], (const void *)*MEMORY[0x1E0CD6A00]);
  return v5;
}

- (__CFDictionary)_publicKeyAttributesForIdentityIdentifier:(id)a3 accessPolicy:(id)a4 key:(id)a5
{
  __CFDictionary *v5;

  v5 = -[_SFKeychainManager _commonKeyAttributesForIdentityIdentifier:accessPolicy:key:](self, "_commonKeyAttributesForIdentityIdentifier:accessPolicy:key:", a3, a4, a5);
  CFDictionaryAddValue(v5, (const void *)*MEMORY[0x1E0CD69F8], (const void *)*MEMORY[0x1E0CD6A10]);
  return v5;
}

- (__CFDictionary)_certificateAttributesForIdentityIdentifier:(id)a3 accessPolicy:(id)a4
{
  id v5;
  id v6;
  __CFDictionary *Mutable;

  v5 = a4;
  v6 = a3;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6C98], (const void *)*MEMORY[0x1E0CD6CA0]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6A90], v6);

  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6AA0], (const void *)*MEMORY[0x1E0C9AE50]);
  if (v5)
    -[__CFDictionary addEntriesFromDictionary:](Mutable, "addEntriesFromDictionary:", objc_msgSend(v5, "secAccessibilityAttributes"));
  CFAutorelease(Mutable);

  return Mutable;
}

- (int)generateAttributesForIdentityAndAddToKeychain:(id)a3 forIdentifier:(id)a4 accessPolicy:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  __CFDictionary *v13;
  const __CFDictionary *v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "keyPair");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v10, "keyPair");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = -[_SFKeychainManager _privateKeyAttributesForIdentityIdentifier:accessPolicy:key:](self, "_privateKeyAttributesForIdentityIdentifier:accessPolicy:key:", v9, v8, v12);
  }
  else
  {
    objc_msgSend(v10, "publicKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = -[_SFKeychainManager _publicKeyAttributesForIdentityIdentifier:accessPolicy:key:](self, "_publicKeyAttributesForIdentityIdentifier:accessPolicy:key:", v9, v8, v12);
  }
  v14 = v13;

  return SecItemAdd(v14, 0);
}

- (BOOL)setIdentity:(id)a3 forIdentifier:(id)a4 accessPolicy:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  char v18;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy_;
  v30 = __Block_byref_object_dispose_;
  v31 = 0;
  -[_SFKeychainManager keychainReplyQueue](self, "keychainReplyQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __67___SFKeychainManager_setIdentity_forIdentifier_accessPolicy_error___block_invoke;
  v20[3] = &unk_1E6F12F60;
  v20[4] = self;
  v14 = v10;
  v21 = v14;
  v15 = v11;
  v22 = v15;
  v16 = v12;
  v23 = v16;
  v24 = &v32;
  v25 = &v26;
  dispatch_sync(v13, v20);

  if (a6)
  {
    v17 = (void *)v27[5];
    if (v17)
      *a6 = objc_retainAutorelease(v17);
  }
  v18 = *((_BYTE *)v33 + 24);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  return v18;
}

- (void)setIdentity:(id)a3 forIdentifier:(id)a4 accessPolicy:(id)a5 resultHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[_SFKeychainManager keychainReplyQueue](self, "keychainReplyQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75___SFKeychainManager_setIdentity_forIdentifier_accessPolicy_resultHandler___block_invoke;
  block[3] = &unk_1E6F12F38;
  block[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_async(v14, block);

}

- (void)keyForIdentifier:(id)a3 specifier:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[_SFKeychainManager keychainReplyQueue](self, "keychainReplyQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __63___SFKeychainManager_keyForIdentifier_specifier_resultHandler___block_invoke;
  v15[3] = &unk_1E6F12FB0;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (id)foundPrivateKey:(__SecKey *)a3 certificate:(id)a4
{
  id v5;
  const __CFDictionary *v6;
  void *v7;
  __objc2_class **v8;
  void *v9;
  _SFIdentity *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = SecKeyCopyAttributes(a3);
  CFDictionaryGetValue(v6, (const void *)*MEMORY[0x1E0CD6A38]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CD6A40]) & 1) != 0)
  {
    v8 = off_1E6F128B8;
  }
  else
  {
    if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CD6A70]) & 1) == 0)
    {
      CFRelease(a3);
      CFRelease(v6);
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v15 = CFSTR("SFKeychainErrorKeyType");
      v16[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("SFKeychainErrorDomain"), 1, v13);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      +[_SFKeychainFetchResult fetchResultWithError:](_SFKeychainIdentityFetchResult, "fetchResultWithError:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    v8 = off_1E6F127E0;
  }
  v9 = (void *)objc_msgSend(objc_alloc(*v8), "initWithSecKey:", a3);
  CFRelease(a3);
  CFRelease(v6);
  v10 = -[_SFIdentity initWithKeyPair:certificate:]([_SFIdentity alloc], "initWithKeyPair:certificate:", v9, v5);
  +[_SFKeychainFetchResult fetchResultWithValue:](_SFKeychainIdentityFetchResult, "fetchResultWithValue:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v11;
}

- (__SecKey)findPrivateKeyWithIdentifier:(id)a3 certificate:(id *)a4 result:(int *)a5
{
  id v8;
  __CFDictionary *v9;
  const void *v10;
  const void *v11;
  _SFCertificate *v12;
  __CFDictionary *v13;
  __SecKey *v14;
  __SecKey *v16;
  CFTypeRef result;

  v8 = a3;
  v9 = -[_SFKeychainManager _certificateAttributesForIdentityIdentifier:accessPolicy:](self, "_certificateAttributesForIdentityIdentifier:accessPolicy:", v8, 0);
  v10 = (const void *)*MEMORY[0x1E0CD7028];
  v11 = (const void *)*MEMORY[0x1E0C9AE50];
  CFDictionaryAddValue(v9, (const void *)*MEMORY[0x1E0CD7028], (const void *)*MEMORY[0x1E0C9AE50]);
  result = 0;
  *a5 = SecItemCopyMatching(v9, &result);
  if (result)
  {
    v12 = [_SFCertificate alloc];
    *a4 = -[_SFCertificate initWithSecCertificate:](v12, "initWithSecCertificate:", result);
    CFRelease(result);
  }
  v13 = -[_SFKeychainManager _privateKeyAttributesForIdentityIdentifier:accessPolicy:key:](self, "_privateKeyAttributesForIdentityIdentifier:accessPolicy:key:", v8, 0, 0, 0);
  CFDictionaryAddValue(v13, v10, v11);
  *a5 = SecItemCopyMatching(v13, (CFTypeRef *)&v16);
  v14 = v16;

  return v14;
}

- (id)publicKeyLookupWithIdentifier:(id)a3 certificate:(id)a4 result:(int)a5
{
  id v8;
  id v9;
  __CFDictionary *v10;
  const void *v11;
  const void *v12;
  OSStatus v13;
  __CFDictionary *v14;
  OSStatus v15;
  const __CFDictionary *v16;
  void *v17;
  __objc2_class *v18;
  void *v19;
  id v20;
  void *v21;
  _SFIdentity *v22;
  void *v23;
  void *v24;
  SecKeyRef key;
  const __CFString *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  key = 0;
  v10 = -[_SFKeychainManager _publicKeyAttributesForIdentityIdentifier:accessPolicy:key:](self, "_publicKeyAttributesForIdentityIdentifier:accessPolicy:key:", v8, 0, 0);
  v11 = (const void *)*MEMORY[0x1E0CD7028];
  v12 = (const void *)*MEMORY[0x1E0C9AE50];
  CFDictionaryAddValue(v10, (const void *)*MEMORY[0x1E0CD7028], (const void *)*MEMORY[0x1E0C9AE50]);
  v13 = SecItemCopyMatching(v10, (CFTypeRef *)&key);
  if (v13 != -25300)
    a5 = v13;
  if (key)
  {
    v14 = -[_SFKeychainManager _publicKeyAttributesForIdentityIdentifier:accessPolicy:key:](self, "_publicKeyAttributesForIdentityIdentifier:accessPolicy:key:", v8, 0, 0);
    CFDictionaryAddValue(v14, v11, v12);
    v15 = SecItemCopyMatching(v14, (CFTypeRef *)&key);
    if (v15 != -25300)
      a5 = v15;
    if (key)
    {
      v16 = SecKeyCopyAttributes(key);
      CFDictionaryGetValue(v16, (const void *)*MEMORY[0x1E0CD6A38]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0CD6A40]))
      {
        v18 = _SFECPublicKey;
      }
      else
      {
        if (!objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0CD6A70]))
        {
          CFRelease(key);
          CFRelease(v16);
          v23 = (void *)MEMORY[0x1E0CB35C8];
          v27 = CFSTR("SFKeychainErrorKeyType");
          v28[0] = v17;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("SFKeychainErrorDomain"), 1, v24);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          +[_SFKeychainFetchResult fetchResultWithError:](_SFKeychainIdentityFetchResult, "fetchResultWithError:", v21);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_14;
        }
        v18 = SFRSAPublicKey;
      }
      v20 = [v18 alloc];
      v21 = (void *)objc_msgSend(v20, "initWithSecKey:", key);
      CFRelease(key);
      CFRelease(v16);
      v22 = -[_SFIdentity initWithPublicKey:certificate:]([_SFIdentity alloc], "initWithPublicKey:certificate:", v21, v9);
      +[_SFKeychainFetchResult fetchResultWithValue:](_SFKeychainIdentityFetchResult, "fetchResultWithValue:", v22);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
      goto LABEL_15;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], a5, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[_SFKeychainFetchResult fetchResultWithError:](_SFKeychainIdentityFetchResult, "fetchResultWithError:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return v19;
}

- (id)identityForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  -[_SFKeychainManager keychainManagerQueue](self, "keychainManagerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44___SFKeychainManager_identityForIdentifier___block_invoke;
  block[3] = &unk_1E6F12FD8;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)identityForIdentifier:(id)a3 resultHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[_SFKeychainManager keychainManagerQueue](self, "keychainManagerQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58___SFKeychainManager_identityForIdentifier_resultHandler___block_invoke;
  block[3] = &unk_1E6F13028;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)removeItemWithIdentifier:(id)a3 resultHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  _SFKeychainManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[_SFKeychainManager keychainReplyQueue](self, "keychainReplyQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61___SFKeychainManager_removeItemWithIdentifier_resultHandler___block_invoke;
  block[3] = &unk_1E6F13078;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (OS_dispatch_queue)keychainManagerQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)setKeychainManagerQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (OS_dispatch_queue)keychainReplyQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setKeychainReplyQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keychainReplyQueue, 0);
  objc_storeStrong((id *)&self->_keychainManagerQueue, 0);
}

@end
