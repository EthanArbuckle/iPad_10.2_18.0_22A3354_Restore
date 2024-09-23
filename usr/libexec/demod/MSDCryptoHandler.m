@implementation MSDCryptoHandler

+ (id)sharedInstance
{
  if (qword_1001755C8 != -1)
    dispatch_once(&qword_1001755C8, &stru_10013FCC0);
  return (id)qword_1001755C0;
}

- (void)createSecretKeyIfNeeded
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  unsigned __int8 v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  uint8_t v11[16];

  v3 = -[MSDCryptoHandler copySecretKeyFromKeychain](self, "copySecretKeyFromKeychain");

  if (!v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(-[MSDCryptoHandler generateRandomBytesWithFixedLength](self, "generateRandomBytesWithFixedLength"));
    if (v4)
    {
      v5 = v4;
      v6 = -[MSDCryptoHandler saveSecretKeyInKeychain:](self, "saveSecretKeyInKeychain:", v4);
      v7 = sub_1000604F0();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      v9 = v8;
      if ((v6 & 1) != 0)
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v11 = 0;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Secret key for encryption is created.", v11, 2u);
        }
      }
      else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        sub_1000CAC40();
      }

    }
    else
    {
      v10 = sub_1000604F0();
      v5 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        sub_1000CAC14();
    }

  }
}

- (void)deleteSecretKey
{
  id v3;
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = -[MSDCryptoHandler copySecretKeyFromKeychain](self, "copySecretKeyFromKeychain");

  if (v3 && -[MSDCryptoHandler deleteSecretKeyInKeychain](self, "deleteSecretKeyInKeychain"))
  {
    v4 = sub_1000604F0();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Secret key for encryption is deleted.", v6, 2u);
    }

  }
}

- (id)performCryptoWithSecretKeyOnData:(id)a3 isDecipher:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  char *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  CCCryptorStatus v24;
  id v25;
  NSObject *v26;
  id v27;
  NSObject *v28;
  void *v29;
  int v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  const char *v36;
  id v37;
  id v39;
  id v40;
  void *v41;
  CCOperation op;
  id v43;
  id v44;
  size_t v45;
  uint8_t buf[4];
  size_t v47;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  v45 = 0;
  op = v4;
  if (v4)
  {
    v8 = (char *)objc_msgSend(v6, "length") - 32;
    v9 = objc_retainAutorelease(v7);
    v44 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(v9, "bytes"), 32, 0));
    v10 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", (char *)objc_msgSend(objc_retainAutorelease(v9), "bytes") + 32, v8, 0));
  }
  else
  {
    v44 = (id)objc_claimAutoreleasedReturnValue(-[MSDCryptoHandler generateRandomBytesWithFixedLength](self, "generateRandomBytesWithFixedLength"));
    v10 = v7;
  }
  v11 = v10;
  if (!v10)
  {
    v39 = sub_1000604F0();
    v28 = objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      sub_1000CAC6C();
    goto LABEL_35;
  }
  if (!v44)
  {
    v40 = sub_1000604F0();
    v28 = objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      sub_1000CAC98();
LABEL_35:
    v23 = 0;
    v29 = 0;
    v43 = 0;
    goto LABEL_29;
  }
  v43 = -[MSDCryptoHandler copySecretKeyFromKeychain](self, "copySecretKeyFromKeychain");
  if (!v43)
  {
    v23 = 0;
    v29 = 0;
    v43 = 0;
    goto LABEL_30;
  }
  v41 = v7;
  v12 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithLength:", (char *)objc_msgSend(v11, "length") + 32);
  if (v12)
  {
    v13 = v12;
    while (1)
    {
      v14 = objc_retainAutorelease(v43);
      v15 = objc_msgSend(v14, "bytes");
      v16 = objc_msgSend(v14, "length");
      v17 = objc_retainAutorelease(v44);
      v18 = objc_msgSend(v17, "bytes");
      v19 = v11;
      v20 = objc_retainAutorelease(v11);
      v21 = objc_msgSend(v20, "bytes");
      v22 = objc_msgSend(v20, "length");
      v23 = objc_retainAutorelease(v13);
      v24 = CCCrypt(op, 0, 1u, v15, (size_t)v16, v18, v21, (size_t)v22, objc_msgSend(v23, "mutableBytes"), (size_t)objc_msgSend(v23, "length"), &v45);
      if (v24 != -4301)
        break;
      v25 = sub_1000604F0();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v47 = v45;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Output data buffer too small. Retry with larger buffer = %tu bytes.", buf, 0xCu);
      }

      v13 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithLength:", v45);
      v11 = v19;
      if (!v13)
        goto LABEL_13;
    }
    v30 = v24;
    if (v24)
    {
      v32 = sub_1000604F0();
      v28 = objc_claimAutoreleasedReturnValue(v32);
      v11 = v19;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        sub_1000CACF0(op, v30, v28);
      v29 = 0;
    }
    else
    {
      v11 = v19;
      if ((op & 1) != 0)
      {
        v31 = objc_msgSend(objc_retainAutorelease(v23), "mutableBytes");
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithBytes:length:](NSMutableData, "dataWithBytes:length:", v31, v45));
      }
      else
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithData:](NSMutableData, "dataWithData:", v17));
        v33 = objc_msgSend(objc_retainAutorelease(v23), "mutableBytes");
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v33, v45));
        objc_msgSend(v29, "appendData:", v34);

      }
      v35 = sub_1000604F0();
      v28 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v36 = "encrypted";
        if (op)
          v36 = "decrypted";
        *(_DWORD *)buf = 136446210;
        v47 = (size_t)v36;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Input data is %{public}s.", buf, 0xCu);
      }
    }
    v43 = v14;
  }
  else
  {
LABEL_13:
    v27 = sub_1000604F0();
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      sub_1000CACC4();
    v23 = 0;
    v29 = 0;
  }
  v7 = v41;
LABEL_29:

LABEL_30:
  v37 = v29;

  return v37;
}

- (id)generateRandomBytesWithFixedLength
{
  _OWORD *v2;
  _OWORD *v3;
  uint64_t v4;
  uint64_t v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v2 = malloc_type_malloc(0x20uLL, 0x1CA8049AuLL);
  if (v2)
  {
    v3 = v2;
    *v2 = 0u;
    v2[1] = 0u;
    v4 = SecRandomCopyBytes(kSecRandomDefault, 0x20uLL, v2);
    if ((_DWORD)v4)
    {
      v6 = v4;
      v7 = sub_1000604F0();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_1000CAD8C(v6, v8, v9, v10, v11, v12, v13, v14);

      v2 = 0;
    }
    else
    {
      v2 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytesNoCopy:length:freeWhenDone:", v3, 32, 1);
    }
  }
  return v2;
}

- (BOOL)saveSecretKeyInKeychain:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t v17[16];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDKeychainManager sharedInstance](MSDKeychainManager, "sharedInstance"));
  v5 = objc_msgSend(v4, "saveItem:forKey:", v3, CFSTR("com.apple.mobilestoredemo.wifi.key"));

  v6 = sub_1000604F0();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if ((v5 & 1) != 0)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Secret key saved in keychain.", v17, 2u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    sub_1000CADF0(v8, v10, v11, v12, v13, v14, v15, v16);
  }

  return v5;
}

- (id)copySecretKeyFromKeychain
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDKeychainManager sharedInstance](MSDKeychainManager, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "getItemForKey:", CFSTR("com.apple.mobilestoredemo.wifi.key")));

  return v3;
}

- (BOOL)deleteSecretKeyInKeychain
{
  void *v2;
  unsigned __int8 v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDKeychainManager sharedInstance](MSDKeychainManager, "sharedInstance"));
  v3 = objc_msgSend(v2, "deleteItemForKey:", CFSTR("com.apple.mobilestoredemo.wifi.key"));

  v4 = sub_1000604F0();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if ((v3 & 1) != 0)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Secret key deleted in keychain.", v15, 2u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    sub_1000CAE58(v6, v8, v9, v10, v11, v12, v13, v14);
  }

  return v3;
}

@end
