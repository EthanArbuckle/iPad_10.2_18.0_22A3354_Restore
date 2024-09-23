@implementation CKKSKeychainBackedKey

- (CKKSKeychainBackedKey)initWithWrappedAESKey:(id)a3 uuid:(id)a4 parentKeyUUID:(id)a5 keyclass:(id)a6 zoneID:(id)a7
{
  return -[CKKSKeychainBackedKey initWithAESKey:wrappedAESKey:uuid:parentKeyUUID:keyclass:zoneID:](self, "initWithAESKey:wrappedAESKey:uuid:parentKeyUUID:keyclass:zoneID:", 0, a3, a4, a5, a6, a7);
}

- (CKKSKeychainBackedKey)initWithAESKey:(id)a3 wrappedAESKey:(id)a4 uuid:(id)a5 parentKeyUUID:(id)a6 keyclass:(id)a7 zoneID:(id)a8
{
  id v15;
  id v16;
  id v17;
  CKKSKeychainBackedKey *v18;
  CKKSKeychainBackedKey *v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)CKKSKeychainBackedKey;
  v18 = -[CKKSKeychainBackedKey init](&v24, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_uuid, a5);
    objc_storeStrong((id *)&v19->_parentKeyUUID, a6);
    objc_storeStrong((id *)&v19->_zoneID, a8);
    objc_storeStrong((id *)&v19->_wrappedkey, a4);
    objc_storeStrong((id *)&v19->_keyclass, a7);
    objc_storeStrong((id *)&v19->_aessivkey, a3);
  }

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CKKSKeychainBackedKey *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CKKSKeychainBackedKey *v12;

  v4 = +[CKKSKeychainBackedKey allocWithZone:](CKKSKeychainBackedKey, "allocWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey aessivkey](self, "aessivkey"));
  v6 = objc_msgSend(v5, "copy");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey wrappedkey](self, "wrappedkey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey uuid](self, "uuid"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey parentKeyUUID](self, "parentKeyUUID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey keyclass](self, "keyclass"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey zoneID](self, "zoneID"));
  v12 = -[CKKSKeychainBackedKey initWithAESKey:wrappedAESKey:uuid:parentKeyUUID:keyclass:zoneID:](v4, "initWithAESKey:wrappedAESKey:uuid:parentKeyUUID:keyclass:zoneID:", v6, v7, v8, v9, v10, v11);

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  void *v17;
  void *v18;
  void *v19;

  v4 = a3;
  v5 = objc_opt_class(CKKSKeychainBackedKey);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey uuid](self, "uuid"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uuid"));
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey parentKeyUUID](self, "parentKeyUUID"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "parentKeyUUID"));
      if (objc_msgSend(v9, "isEqual:", v10))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey zoneID](self, "zoneID"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "zoneID"));
        if (objc_msgSend(v11, "isEqual:", v12))
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey wrappedkey](self, "wrappedkey"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "wrappedkey"));
          if (objc_msgSend(v13, "isEqual:"))
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey keyclass](self, "keyclass"));
            v18 = v13;
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "keyclass"));
            v15 = objc_msgSend(v17, "isEqual:", v14);

            v13 = v18;
          }
          else
          {
            v15 = 0;
          }

        }
        else
        {
          v15 = 0;
        }

      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)wrapsSelf
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey uuid](self, "uuid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey parentKeyUUID](self, "parentKeyUUID"));
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

- (BOOL)wrapUnder:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  id v16;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey aessivkey](self, "aessivkey"));
  v14 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "wrapAESKey:error:", v7, &v14));
  v9 = v14;

  if (v8)
  {
    -[CKKSKeychainBackedKey setWrappedkey:](self, "setWrappedkey:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uuid"));
    -[CKKSKeychainBackedKey setParentKeyUUID:](self, "setParentKeyUUID:", v10);

  }
  else
  {
    v11 = sub_10000BDF4(CFSTR("ckkskey"), 0);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "couldn't wrap key: %@", buf, 0xCu);
    }

    if (a4)
      *a4 = objc_retainAutorelease(v9);
  }

  return v8 != 0;
}

- (BOOL)unwrapSelfWithAESKey:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  CKKSAESSIVKey *v8;
  CKKSAESSIVKey *aessivkey;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey wrappedkey](self, "wrappedkey"));
  v8 = (CKKSAESSIVKey *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "unwrapAESKey:error:", v7, a4));

  aessivkey = self->_aessivkey;
  self->_aessivkey = v8;

  return self->_aessivkey != 0;
}

- (id)ensureKeyLoadedFromKeychain:(id *)a3
{
  void *v5;
  void *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey aessivkey](self, "aessivkey"));

  if (v5 || -[CKKSKeychainBackedKey loadKeyMaterialFromKeychain:](self, "loadKeyMaterialFromKeychain:", a3))
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey aessivkey](self, "aessivkey"));
  else
    v6 = 0;
  return v6;
}

- (BOOL)trySelfWrappedKeyCandidate:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  uint64_t v13;
  void *v14;

  v6 = a3;
  if (-[CKKSKeychainBackedKey wrapsSelf](self, "wrapsSelf"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey wrappedkey](self, "wrappedkey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "unwrapAESKey:error:", v7, a4));

    if (v8 && objc_msgSend(v8, "isEqual:", v6))
    {
      objc_storeStrong((id *)&self->_aessivkey, v8);
      v9 = 1;
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    if (a4)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ is not self-wrapped"), self, NSLocalizedDescriptionKey));
      v14 = v10;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("CKKSErrorDomain"), 18, v11));

    }
    v9 = 0;
  }

  return v9;
}

- (id)wrapAESKey:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey ensureKeyLoadedFromKeychain:](self, "ensureKeyLoadedFromKeychain:", a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "wrapAESKey:error:", v6, a4));

  return v8;
}

- (id)unwrapAESKey:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey ensureKeyLoadedFromKeychain:](self, "ensureKeyLoadedFromKeychain:", a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "unwrapAESKey:error:", v6, a4));

  return v8;
}

- (id)encryptData:(id)a3 authenticatedData:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey ensureKeyLoadedFromKeychain:](self, "ensureKeyLoadedFromKeychain:", a5));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "encryptData:authenticatedData:error:", v9, v8, a5));

  return v11;
}

- (id)decryptData:(id)a3 authenticatedData:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey ensureKeyLoadedFromKeychain:](self, "ensureKeyLoadedFromKeychain:", a5));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "decryptData:authenticatedData:error:", v9, v8, a5));

  return v11;
}

- (BOOL)saveKeyMaterialToKeychain:(id *)a3
{
  return -[CKKSKeychainBackedKey saveKeyMaterialToKeychain:error:](self, "saveKeyMaterialToKeychain:error:", 1, a3);
}

- (BOOL)saveKeyMaterialToKeychain:(BOOL)a3 error:(id *)a4
{
  _BOOL4 v5;
  void *v7;
  id v8;
  char *v9;
  _QWORD *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  unsigned int v22;
  CFStringRef v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  unsigned int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  BOOL v42;
  _BOOL4 v44;
  void *v45;
  id v46;
  id v47;
  _QWORD v48[10];
  _QWORD v49[10];
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[10];
  _QWORD v53[10];

  v5 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey ensureKeyLoadedFromKeychain:](self, "ensureKeyLoadedFromKeychain:", a4));

  if (!v7)
    return 0;
  v44 = v5;
  v8 = objc_alloc((Class)NSData);
  v9 = (char *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey aessivkey](self, "aessivkey"));
  v10 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey aessivkey](self, "aessivkey"));
  v11 = objc_msgSend(v8, "initWithBytes:length:", v9 + 8, v10[11]);
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "base64EncodedDataWithOptions:", 0));

  v52[0] = kSecClass;
  v52[1] = kSecAttrAccessible;
  v53[0] = kSecClassInternetPassword;
  v53[1] = kSecAttrAccessibleWhenUnlocked;
  v52[2] = kSecUseDataProtectionKeychain;
  v52[3] = kSecAttrAccessGroup;
  v53[2] = &__kCFBooleanTrue;
  v53[3] = CFSTR("com.apple.security.ckks");
  v52[4] = kSecAttrDescription;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey keyclass](self, "keyclass"));
  v53[4] = v13;
  v52[5] = kSecAttrServer;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey zoneID](self, "zoneID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "zoneName"));
  v53[5] = v15;
  v52[6] = kSecAttrAccount;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey uuid](self, "uuid"));
  v53[6] = v16;
  v52[7] = kSecAttrPath;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey parentKeyUUID](self, "parentKeyUUID"));
  v53[7] = v17;
  v53[8] = &__kCFBooleanTrue;
  v52[8] = kSecAttrIsInvisible;
  v52[9] = kSecValueData;
  v45 = (void *)v12;
  v53[9] = v12;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v53, v52, 10));
  v19 = objc_msgSend(v18, "mutableCopy");

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey keyclass](self, "keyclass"));
  LODWORD(v18) = objc_msgSend(v20, "isEqualToString:", CFSTR("tlk"));

  if ((_DWORD)v18)
  {
    objc_msgSend(v19, "setObject:forKeyedSubscript:", kSecAttrViewHintPCSMasterKey, kSecAttrSyncViewHint);
    objc_msgSend(v19, "setObject:forKeyedSubscript:", kCFBooleanTrue, kSecAttrSynchronizable);
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey keyclass](self, "keyclass"));
  v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("classC"));

  if (v22)
    v23 = kSecAttrAccessibleAfterFirstUnlock;
  else
    v23 = kSecAttrAccessibleWhenUnlocked;
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v23, kSecAttrAccessible);
  v47 = 0;
  v24 = +[CKKSKeychainBackedKey setKeyMaterialInKeychain:error:](CKKSKeychainBackedKey, "setKeyMaterialInKeychain:error:", v19, &v47);
  v25 = v47;
  v26 = v25;
  if (a4 && v25)
  {
    v27 = objc_msgSend(v25, "code");
    v50[0] = NSLocalizedDescriptionKey;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Couldn't save %@ to keychain: %d"), self, objc_msgSend(v26, "code")));
    v50[1] = NSUnderlyingErrorKey;
    v51[0] = v28;
    v51[1] = v26;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v51, v50, 2));
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("securityd"), v27, v29));

  }
  if (v44)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey keyclass](self, "keyclass"));
    v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("tlk"));

    if (v31)
    {
      v48[0] = kSecClass;
      v48[1] = kSecAttrAccessible;
      v49[0] = kSecClassInternetPassword;
      v49[1] = kSecAttrAccessibleWhenUnlocked;
      v48[2] = kSecUseDataProtectionKeychain;
      v48[3] = kSecAttrAccessGroup;
      v49[2] = &__kCFBooleanTrue;
      v49[3] = CFSTR("com.apple.security.ckks");
      v48[4] = kSecAttrDescription;
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey keyclass](self, "keyclass"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "stringByAppendingString:", CFSTR("-nonsync")));
      v49[4] = v33;
      v48[5] = kSecAttrServer;
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey zoneID](self, "zoneID"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "zoneName"));
      v49[5] = v35;
      v48[6] = kSecAttrAccount;
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey uuid](self, "uuid"));
      v49[6] = v36;
      v48[7] = kSecAttrPath;
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey parentKeyUUID](self, "parentKeyUUID"));
      v49[7] = v37;
      v49[8] = &__kCFBooleanTrue;
      v48[8] = kSecAttrIsInvisible;
      v48[9] = kSecValueData;
      v49[9] = v45;
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v49, v48, 10));
      v39 = objc_msgSend(v38, "mutableCopy");

      objc_msgSend(v39, "setObject:forKeyedSubscript:", kCFBooleanFalse, kSecAttrSynchronizable);
      v46 = v26;
      v40 = +[CKKSKeychainBackedKey setKeyMaterialInKeychain:error:](CKKSKeychainBackedKey, "setKeyMaterialInKeychain:error:", v39, &v46);
      v41 = v46;

      v19 = v39;
      v26 = v41;
    }
  }
  v42 = v26 == 0;

  return v42;
}

- (BOOL)loadKeyMaterialFromKeychain:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  CKKSAESSIVKey *v9;
  id v10;
  CKKSAESSIVKey *v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  BOOL v19;
  id v20;
  NSObject *v21;
  id v23;
  char v24;
  uint8_t buf[4];
  CKKSKeychainBackedKey *v26;
  __int16 v27;
  id v28;

  v24 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSKeychainBackedKey fetchKeyMaterialItemFromKeychain:resave:error:](CKKSKeychainBackedKey, "fetchKeyMaterialItemFromKeychain:resave:error:", self, &v24, a3));
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", kSecValueData));
    v8 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithBase64EncodedData:options:", v7, 0);
    if (v8)
    {
      v9 = [CKKSAESSIVKey alloc];
      v10 = objc_retainAutorelease(v8);
      v11 = -[CKKSAESSIVKey initWithBytes:len:](v9, "initWithBytes:len:", objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"));
      v12 = objc_retainAutorelease(v10);
      memset_s(objc_msgSend(v12, "mutableBytes"), (rsize_t)objc_msgSend(v12, "length"), 0, (rsize_t)objc_msgSend(v12, "length"));
      -[CKKSKeychainBackedKey setAessivkey:](self, "setAessivkey:", v11);
      if (v24)
      {
        v13 = sub_10000BDF4(CFSTR("ckkskey"), 0);
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v26 = self;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Resaving %@ as per request", buf, 0xCu);
        }

        v23 = 0;
        -[CKKSKeychainBackedKey saveKeyMaterialToKeychain:](self, "saveKeyMaterialToKeychain:", &v23);
        v15 = v23;
        if (v15)
        {
          v16 = sub_10000BDF4(CFSTR("ckkskey"), 0);
          v17 = objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v26 = self;
            v27 = 2112;
            v28 = v15;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Resaving %@ failed: %@", buf, 0x16u);
          }

        }
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey aessivkey](self, "aessivkey"));
      v19 = v18 != 0;

    }
    else
    {
      v20 = sub_10000BDF4(CFSTR("ckkskey"), 0);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v26 = self;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Unable to unbase64 key: %@", buf, 0xCu);
      }

      if (!a3)
      {
        v19 = 0;
        goto LABEL_18;
      }
      v11 = (CKKSAESSIVKey *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("unable to unbase64 key: %@"), self));
      v19 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("CKKSErrorDomain"), 36, v11));
    }

LABEL_18:
    goto LABEL_19;
  }
  v19 = 0;
LABEL_19:

  return v19;
}

- (BOOL)deleteKeyMaterialFromKeychain:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  void *v15;
  NSErrorUserInfoKey v17;
  void *v18;
  _QWORD v19[7];
  _QWORD v20[7];

  v19[0] = kSecClass;
  v19[1] = kSecUseDataProtectionKeychain;
  v20[0] = kSecClassInternetPassword;
  v20[1] = &__kCFBooleanTrue;
  v20[2] = CFSTR("com.apple.security.ckks");
  v19[2] = kSecAttrAccessGroup;
  v19[3] = kSecAttrDescription;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey keyclass](self, "keyclass"));
  v20[3] = v5;
  v19[4] = kSecAttrAccount;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey uuid](self, "uuid"));
  v20[4] = v6;
  v19[5] = kSecAttrServer;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey zoneID](self, "zoneID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "zoneName"));
  v19[6] = kSecReturnData;
  v20[5] = v8;
  v20[6] = &__kCFBooleanTrue;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 7));
  v10 = objc_msgSend(v9, "mutableCopy");

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey keyclass](self, "keyclass"));
  LODWORD(v6) = objc_msgSend(v11, "isEqualToString:", CFSTR("tlk"));

  if ((_DWORD)v6)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", kCFBooleanTrue, kSecAttrSynchronizable);
  v12 = SecItemDelete((CFDictionaryRef)v10);
  v13 = v12;
  if (a3 && (_DWORD)v12)
  {
    v17 = NSLocalizedDescriptionKey;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Couldn't delete %@ from keychain: %d"), self, v12));
    v18 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("securityd"), v13, v15));

  }
  return v13 == 0;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey zoneID](self, "zoneID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "zoneName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey uuid](self, "uuid"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey keyclass](self, "keyclass"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@(%@): %@ (%@)>"), v5, v7, v8, v9));

  return v10;
}

- (id)serializeAsProtobuf:(id *)a3
{
  void *v4;
  CKKSSerializedKey *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  char *v11;
  _QWORD *v12;
  id v13;
  void *v14;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey ensureKeyLoadedFromKeychain:](self, "ensureKeyLoadedFromKeychain:", a3));

  if (v4)
  {
    v5 = objc_alloc_init(CKKSSerializedKey);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey uuid](self, "uuid"));
    -[CKKSSerializedKey setUuid:](v5, "setUuid:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey zoneID](self, "zoneID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "zoneName"));
    -[CKKSSerializedKey setZoneName:](v5, "setZoneName:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey keyclass](self, "keyclass"));
    -[CKKSSerializedKey setKeyclass:](v5, "setKeyclass:", v9);

    v10 = objc_alloc((Class)NSData);
    v11 = (char *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey aessivkey](self, "aessivkey"));
    v12 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey aessivkey](self, "aessivkey"));
    v13 = objc_msgSend(v10, "initWithBytes:length:", v11 + 8, v12[11]);
    -[CKKSSerializedKey setKey:](v5, "setKey:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSerializedKey data](v5, "data"));
  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey uuid](self, "uuid"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("uuid"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey parentKeyUUID](self, "parentKeyUUID"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("parentKeyUUID"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey keyclass](self, "keyclass"));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("keyclass"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey zoneID](self, "zoneID"));
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("zoneID"));

  v9 = (id)objc_claimAutoreleasedReturnValue(-[CKKSKeychainBackedKey wrappedkey](self, "wrappedkey"));
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("wrappedkey"));

}

- (CKKSKeychainBackedKey)initWithCoder:(id)a3
{
  id v4;
  CKKSKeychainBackedKey *v5;
  id v6;
  uint64_t v7;
  NSString *uuid;
  id v9;
  uint64_t v10;
  NSString *parentKeyUUID;
  id v12;
  uint64_t v13;
  SecCKKSKeyClass *keyclass;
  id v15;
  uint64_t v16;
  CKRecordZoneID *zoneID;
  id v18;
  uint64_t v19;
  CKKSWrappedAESSIVKey *wrappedkey;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CKKSKeychainBackedKey;
  v5 = -[CKKSKeychainBackedKey init](&v22, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("uuid"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v7;

    v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("parentKeyUUID"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    parentKeyUUID = v5->_parentKeyUUID;
    v5->_parentKeyUUID = (NSString *)v10;

    v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("keyclass"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    keyclass = v5->_keyclass;
    v5->_keyclass = (SecCKKSKeyClass *)v13;

    v15 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(CKRecordZoneID), CFSTR("zoneID"));
    v16 = objc_claimAutoreleasedReturnValue(v15);
    zoneID = v5->_zoneID;
    v5->_zoneID = (CKRecordZoneID *)v16;

    v18 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(CKKSWrappedAESSIVKey), CFSTR("wrappedkey"));
    v19 = objc_claimAutoreleasedReturnValue(v18);
    wrappedkey = v5->_wrappedkey;
    v5->_wrappedkey = (CKKSWrappedAESSIVKey *)v19;

  }
  return v5;
}

- (NSString)uuid
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUuid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)parentKeyUUID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setParentKeyUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (SecCKKSKeyClass)keyclass
{
  return (SecCKKSKeyClass *)objc_getProperty(self, a2, 24, 1);
}

- (void)setKeyclass:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (CKRecordZoneID)zoneID
{
  return (CKRecordZoneID *)objc_getProperty(self, a2, 32, 1);
}

- (void)setZoneID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (CKKSWrappedAESSIVKey)wrappedkey
{
  return (CKKSWrappedAESSIVKey *)objc_getProperty(self, a2, 40, 1);
}

- (void)setWrappedkey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (CKKSAESSIVKey)aessivkey
{
  return (CKKSAESSIVKey *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAessivkey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aessivkey, 0);
  objc_storeStrong((id *)&self->_wrappedkey, 0);
  objc_storeStrong((id *)&self->_zoneID, 0);
  objc_storeStrong((id *)&self->_keyclass, 0);
  objc_storeStrong((id *)&self->_parentKeyUUID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

+ (id)randomKeyWrappedByParent:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "keyclass"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "randomKeyWrappedByParent:keyclass:error:", v6, v7, a4));

  return v8;
}

+ (id)randomKeyWrappedByParent:(id)a3 keyclass:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  CKKSKeychainBackedKey *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CKKSKeychainBackedKey *v16;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSAESSIVKey randomKey:](CKKSAESSIVKey, "randomKey:", a5));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "wrapAESKey:error:", v9, a5));
    if (v10)
    {
      v11 = [CKKSKeychainBackedKey alloc];
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUIDString"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uuid"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "zoneID"));
      v16 = -[CKKSKeychainBackedKey initWithAESKey:wrappedAESKey:uuid:parentKeyUUID:keyclass:zoneID:](v11, "initWithAESKey:wrappedAESKey:uuid:parentKeyUUID:keyclass:zoneID:", v9, v10, v13, v14, v8, v15);

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)randomKeyWrappedBySelf:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSAESSIVKey randomKey:](CKKSAESSIVKey, "randomKey:", a4));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "keyWrappedBySelf:uuid:keyclass:zoneID:error:", v7, v9, CFSTR("tlk"), v6, a4));

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)keyWrappedBySelf:(id)a3 uuid:(id)a4 keyclass:(id)a5 zoneID:(id)a6 error:(id *)a7
{
  return objc_msgSend(a1, "key:wrappedByKey:uuid:parentKeyUUID:keyclass:zoneID:error:", a3, a3, a4, a4, a5, a6, a7);
}

+ (id)key:(id)a3 wrappedByKey:(id)a4 uuid:(id)a5 parentKeyUUID:(id)a6 keyclass:(id)a7 zoneID:(id)a8 error:(id *)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  CKKSKeychainBackedKey *v21;
  id v22;
  NSObject *v23;
  id v25;
  uint8_t buf[4];
  id v27;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v25 = 0;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "wrapAESKey:error:", v14, &v25));
  v20 = v25;
  if (v19)
  {
    v21 = -[CKKSKeychainBackedKey initWithAESKey:wrappedAESKey:uuid:parentKeyUUID:keyclass:zoneID:]([CKKSKeychainBackedKey alloc], "initWithAESKey:wrappedAESKey:uuid:parentKeyUUID:keyclass:zoneID:", v14, v19, v15, v16, v17, v18);
  }
  else
  {
    v22 = sub_10000BDF4(CFSTR("ckkskey"), 0);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v20;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "couldn't wrap key: %@", buf, 0xCu);
    }

    v21 = 0;
    if (a9)
      *a9 = objc_retainAutorelease(v20);
  }

  return v21;
}

+ (id)setKeyMaterialInKeychain:(id)a3 error:(id *)a4
{
  const __CFDictionary *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  CFTypeRef result;

  v5 = (const __CFDictionary *)a3;
  result = 0;
  v6 = SecItemAdd(v5, &result);
  if ((_DWORD)v6 == -25299)
  {
    v7 = objc_alloc_init((Class)NSMutableDictionary);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", kSecClass));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, kSecClass);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", kSecAttrSynchronizable));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, kSecAttrSynchronizable);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", kSecAttrSyncViewHint));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, kSecAttrSyncViewHint);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", kSecAttrAccessGroup));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, kSecAttrAccessGroup);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", kSecAttrAccount));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, kSecAttrAccount);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", kSecAttrServer));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, kSecAttrServer);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", kSecAttrPath));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, kSecAttrPath);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", kSecUseDataProtectionKeychain));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, kSecUseDataProtectionKeychain);

    v16 = -[__CFDictionary mutableCopy](v5, "mutableCopy");
    objc_msgSend(v16, "setObject:forKeyedSubscript:", 0, kSecClass);
    v17 = SecItemUpdate((CFDictionaryRef)v7, (CFDictionaryRef)v16);
    if ((_DWORD)v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SecItemUpdate: %d"), v17));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("securityd"), (int)v17, v18));

    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    LODWORD(v17) = v6;
    v20 = (int)v6;
    v7 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SecItemAdd: %d"), v6));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("securityd"), v20, v7));
  }

  v21 = (void *)result;
  if ((_DWORD)v17)
  {
    if (result)
    {
      result = 0;
      CFRelease(v21);
    }
    v21 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v19);
  }

  return v21;
}

+ (id)queryKeyMaterialInKeychain:(id)a3 error:(id *)a4
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  CFTypeRef result;
  NSErrorUserInfoKey v12;
  void *v13;

  result = 0;
  v5 = SecItemCopyMatching((CFDictionaryRef)a3, &result);
  v6 = (void *)result;
  if ((_DWORD)v5)
  {
    if (result)
    {
      result = 0;
      CFRelease(v6);
    }
    if (a4)
    {
      v7 = (int)v5;
      v12 = NSLocalizedDescriptionKey;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SecItemCopyMatching: %d"), v5));
      v13 = v8;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("securityd"), v7, v9));

    }
    v6 = 0;
  }
  return v6;
}

+ (id)fetchKeyMaterialItemFromKeychain:(id)a3 resave:(BOOL *)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id *v20;
  id *v21;
  id v22;
  id v23;
  id *v24;
  void *v26;
  unsigned int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id *v34;
  void *v35;
  unsigned int v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  id *v45;
  uint64_t v46;
  id v47;
  NSObject *v48;
  void *v49;
  const char *v50;
  id *v51;
  id v52;
  void *v53;
  _QWORD *v54;
  _QWORD *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id *v61;
  void *v63;
  void *v64;
  id v65;
  id v66;
  id v67;
  _QWORD v68[2];
  _QWORD v69[2];
  _QWORD v70[9];
  _QWORD v71[9];
  _QWORD v72[2];
  _QWORD v73[2];
  uint8_t buf[4];
  void *v75;
  _QWORD v76[10];
  _QWORD v77[10];
  _QWORD v78[2];
  _QWORD v79[2];
  _QWORD v80[9];
  _QWORD v81[9];

  v7 = a3;
  v80[0] = kSecClass;
  v80[1] = kSecUseDataProtectionKeychain;
  v81[0] = kSecClassInternetPassword;
  v81[1] = &__kCFBooleanTrue;
  v81[2] = CFSTR("com.apple.security.ckks");
  v80[2] = kSecAttrAccessGroup;
  v80[3] = kSecAttrDescription;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "keyclass"));
  v81[3] = v8;
  v80[4] = kSecAttrAccount;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uuid"));
  v81[4] = v9;
  v80[5] = kSecAttrServer;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "zoneID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "zoneName"));
  v81[5] = v11;
  v80[6] = kSecAttrPath;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "parentKeyUUID"));
  v81[6] = v12;
  v81[7] = &__kCFBooleanTrue;
  v80[7] = kSecReturnAttributes;
  v80[8] = kSecReturnData;
  v81[8] = &__kCFBooleanTrue;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v81, v80, 9));
  v14 = objc_msgSend(v13, "mutableCopy");

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "keyclass"));
  LODWORD(v10) = objc_msgSend(v15, "isEqualToString:", CFSTR("tlk"));

  if ((_DWORD)v10)
    objc_msgSend(v14, "setObject:forKeyedSubscript:", kCFBooleanTrue, kSecAttrSynchronizable);
  v67 = 0;
  v16 = a1;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "queryKeyMaterialInKeychain:error:", v14, &v67));
  v18 = v67;
  v19 = v18;
  if (v17)
  {
    v20 = v17;
    v21 = v20;
    v22 = v14;
    v23 = v19;
LABEL_5:
    v24 = v20;
    goto LABEL_6;
  }
  if (!v18 || objc_msgSend(v18, "code") == (id)-25300)
  {
    v61 = a5;

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "keyclass"));
    v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("tlk"));

    if (v27)
    {
      v76[0] = kSecClass;
      v76[1] = kSecUseDataProtectionKeychain;
      v77[0] = kSecClassInternetPassword;
      v77[1] = &__kCFBooleanTrue;
      v77[2] = CFSTR("com.apple.security.ckks");
      v76[2] = kSecAttrAccessGroup;
      v76[3] = kSecAttrDescription;
      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "keyclass"));
      v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "stringByAppendingString:", CFSTR("-piggy")));
      v77[3] = v59;
      v77[4] = kSecAttrSynchronizableAny;
      v76[4] = kSecAttrSynchronizable;
      v76[5] = kSecAttrAccount;
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uuid"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-piggy"), v28));
      v77[5] = v29;
      v76[6] = kSecAttrServer;
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "zoneID"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "zoneName"));
      v77[6] = v31;
      v77[7] = &__kCFBooleanTrue;
      v76[7] = kSecReturnAttributes;
      v76[8] = kSecReturnData;
      v76[9] = kSecMatchLimit;
      v77[8] = &__kCFBooleanTrue;
      v77[9] = kSecMatchLimitOne;
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v77, v76, 10));
      v22 = objc_msgSend(v32, "mutableCopy");

      v16 = a1;
      v66 = 0;
      v24 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "queryKeyMaterialInKeychain:error:", v22, &v66));
      v33 = v66;
      if (!v33)
      {
        v47 = sub_10000BDF4(CFSTR("ckkskey"), 0);
        v48 = objc_claimAutoreleasedReturnValue(v47);
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uuid"));
          *(_DWORD *)buf = 138412290;
          v75 = v49;
          v50 = "loaded a piggy TLK (%@)";
LABEL_31:
          _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, v50, buf, 0xCu);

        }
LABEL_32:

        if (a4)
          *a4 = 1;
        v20 = v24;
        v21 = v20;
        v23 = 0;
        goto LABEL_5;
      }
      v23 = v33;
      if (objc_msgSend(v33, "code") != (id)-25300)
      {
        if (v61)
        {
          v51 = v61;
          v52 = objc_msgSend(v23, "code");
          v72[0] = NSLocalizedDescriptionKey;
          v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Couldn't load %@ from keychain: %d"), v7, objc_msgSend(v23, "code")));
          v72[1] = NSUnderlyingErrorKey;
          v73[0] = v53;
          v73[1] = v23;
          v54 = v73;
          v55 = v72;
LABEL_37:
          v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v54, v55, 2));
          *v51 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("securityd"), v52, v57));

        }
LABEL_38:
        v21 = 0;
        goto LABEL_6;
      }
      v14 = v22;
      v34 = v24;
    }
    else
    {
      v23 = 0;
      v34 = 0;
    }

    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "keyclass"));
    v36 = objc_msgSend(v35, "isEqualToString:", CFSTR("tlk"));

    if (!v36)
    {
      v23 = 0;
      v22 = v14;
      goto LABEL_22;
    }
    v70[0] = kSecClass;
    v70[1] = kSecUseDataProtectionKeychain;
    v71[0] = kSecClassInternetPassword;
    v71[1] = &__kCFBooleanTrue;
    v71[2] = CFSTR("com.apple.security.ckks");
    v70[2] = kSecAttrAccessGroup;
    v70[3] = kSecAttrDescription;
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "keyclass"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "stringByAppendingString:", CFSTR("-nonsync")));
    v71[3] = v37;
    v70[4] = kSecAttrServer;
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "zoneID"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "zoneName"));
    v71[4] = v39;
    v70[5] = kSecAttrAccount;
    v64 = v16;
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uuid"));
    v71[5] = v40;
    v71[6] = &__kCFBooleanTrue;
    v70[6] = kSecReturnAttributes;
    v70[7] = kSecReturnData;
    v70[8] = kSecAttrSynchronizable;
    v71[7] = &__kCFBooleanTrue;
    v71[8] = &__kCFBooleanFalse;
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v71, v70, 9));
    v22 = objc_msgSend(v41, "mutableCopy");

    v65 = 0;
    v24 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "queryKeyMaterialInKeychain:error:", v22, &v65));
    v23 = v65;

    if (v23)
    {
      if (objc_msgSend(v23, "code") == (id)-25300)
      {
        v34 = v24;
LABEL_22:
        if (v61)
        {
          v45 = v34;
          if (v19)
            v46 = (uint64_t)objc_msgSend(v19, "code");
          else
            v46 = -50;
          v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Couldn't load %@ from keychain: %d"), v7, objc_msgSend(v19, "code")));
          *v61 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:underlying:](NSError, "errorWithDomain:code:description:underlying:", CFSTR("securityd"), v46, v58, v19));

          v34 = v45;
        }
        v20 = v34;
        v21 = v20;
        goto LABEL_5;
      }
      if (v61)
      {
        v51 = v61;
        v52 = objc_msgSend(v23, "code");
        v68[0] = NSLocalizedDescriptionKey;
        v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Couldn't load %@ from keychain: %d"), v7, objc_msgSend(v23, "code")));
        v68[1] = NSUnderlyingErrorKey;
        v69[0] = v53;
        v69[1] = v23;
        v54 = v69;
        v55 = v68;
        goto LABEL_37;
      }
      goto LABEL_38;
    }
    v56 = sub_10000BDF4(CFSTR("ckkskey"), 0);
    v48 = objc_claimAutoreleasedReturnValue(v56);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uuid"));
      *(_DWORD *)buf = 138412290;
      v75 = v49;
      v50 = "loaded a stashed TLK (%@)";
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  v21 = a5;
  if (a5)
  {
    v42 = objc_msgSend(v19, "code");
    v78[0] = NSLocalizedDescriptionKey;
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Couldn't load %@ from keychain: %d"), v7, objc_msgSend(v19, "code")));
    v78[1] = NSUnderlyingErrorKey;
    v79[0] = v43;
    v79[1] = v19;
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v79, v78, 2));
    *v21 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("securityd"), v42, v44));

    v21 = 0;
  }
  v24 = 0;
  v22 = v14;
  v23 = v19;
LABEL_6:

  return v21;
}

+ (id)loadFromProtobuf:(id)a3 error:(id *)a4
{
  id v5;
  CKKSSerializedKey *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  CKKSAESSIVKey *v14;
  id v15;
  id v16;
  void *v17;
  CKKSAESSIVKey *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;

  v5 = a3;
  v6 = -[CKKSSerializedKey initWithData:]([CKKSSerializedKey alloc], "initWithData:", v5);

  if (!v6)
    goto LABEL_9;
  v7 = objc_claimAutoreleasedReturnValue(-[CKKSSerializedKey uuid](v6, "uuid"));
  if (!v7)
    goto LABEL_9;
  v8 = (void *)v7;
  v9 = objc_claimAutoreleasedReturnValue(-[CKKSSerializedKey zoneName](v6, "zoneName"));
  if (!v9)
  {
LABEL_8:

    goto LABEL_9;
  }
  v10 = (void *)v9;
  v11 = objc_claimAutoreleasedReturnValue(-[CKKSSerializedKey keyclass](v6, "keyclass"));
  if (!v11)
  {

    goto LABEL_8;
  }
  v12 = (void *)v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSerializedKey key](v6, "key"));

  if (v13)
  {
    v14 = [CKKSAESSIVKey alloc];
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[CKKSSerializedKey key](v6, "key")));
    v16 = objc_msgSend(v15, "bytes");
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSerializedKey key](v6, "key"));
    v18 = -[CKKSAESSIVKey initWithBytes:len:](v14, "initWithBytes:len:", v16, objc_msgSend(v17, "length"));

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSerializedKey uuid](v6, "uuid"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSerializedKey keyclass](v6, "keyclass"));
    v21 = objc_alloc((Class)CKRecordZoneID);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSSerializedKey zoneName](v6, "zoneName"));
    v23 = objc_msgSend(v21, "initWithZoneName:ownerName:", v22, CKCurrentUserDefaultName);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSKeychainBackedKey keyWrappedBySelf:uuid:keyclass:zoneID:error:](CKKSKeychainBackedKey, "keyWrappedBySelf:uuid:keyclass:zoneID:error:", v18, v19, v20, v23, a4));

    goto LABEL_11;
  }
LABEL_9:
  v24 = 0;
  if (a4)
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("CKKSErrorDomain"), 21, CFSTR("Data failed to parse as a CKKSSerializedKey")));
LABEL_11:

  return v24;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
