@implementation SDActivityEncryptionManager

+ (id)sharedEncryptionManager
{
  if (qword_1007C6A80 != -1)
    dispatch_once(&qword_1007C6A80, &stru_100718FF0);
  return (id)qword_1007C6A78;
}

- (SDActivityEncryptionManager)init
{
  SDActivityEncryptionManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *deviceIdentifierToDecryptionKey;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SDActivityEncryptionManager;
  v2 = -[SDActivityEncryptionManager init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableDictionary);
    deviceIdentifierToDecryptionKey = v2->_deviceIdentifierToDecryptionKey;
    v2->_deviceIdentifierToDecryptionKey = v3;

    v2->_shouldRefreshWrappingKey = 1;
    -[SDActivityEncryptionManager addObservers](v2, "addObservers");
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[SDActivityEncryptionManager removeObservers](self, "removeObservers");
  v3.receiver = self;
  v3.super_class = (Class)SDActivityEncryptionManager;
  -[SDActivityEncryptionManager dealloc](&v3, "dealloc");
}

- (NSString)state
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  id v6;
  id v7;
  const __CFString *v8;
  const __CFString *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;

  v26 = 0;
  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  NSAppendPrintF(&v26, "%@\n", v5);
  v6 = v26;

  v25 = v6;
  NSAppendPrintF(&v25, "-------------\n");
  v7 = v25;

  v24 = v7;
  v8 = CFSTR("YES");
  if (self->_wrappingKey)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  if (!self->_shouldRefreshWrappingKey)
    v8 = CFSTR("NO");
  NSAppendPrintF(&v24, "Has Wrapping Key: %@, Should Refresh: %@\n", v9, v8);
  v10 = v24;

  v23 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityEncryptionManager allKeys](self, "allKeys"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("@unionOfObjects.%@"), kSecAttrLabel));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "valueForKeyPath:", v12));
  v14 = SFCompactStringFromCollection(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  NSAppendPrintF(&v23, "Keychain Items: %@\n", v15);
  v16 = v23;

  v22 = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityEncryptionManager encryptionKey](self, "encryptionKey"));
  NSAppendPrintF(&v22, "Encryption Key: %@\n", v17);
  v18 = v22;

  v21 = v18;
  NSAppendPrintF(&v21, "Device Identifier To Decryption Key: %@\n", self->_deviceIdentifierToDecryptionKey);
  v19 = v21;

  return (NSString *)v19;
}

- (void)addObservers
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "resetStateRequested:", CFSTR("com.apple.sharingd.ResetState"), 0);

}

- (void)removeObservers
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)generateNewEncryptionKey
{
  SDActivityEncryptionKey *v3;
  SDActivityEncryptionKey *encryptionKey;
  uint64_t *p_encryptionKey;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;

  v3 = +[SDActivityEncryptionKey newEncryptionKey](SDActivityEncryptionKey, "newEncryptionKey");
  p_encryptionKey = (uint64_t *)&self->_encryptionKey;
  encryptionKey = self->_encryptionKey;
  self->_encryptionKey = v3;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityEncryptionManager unwrappedDataRepresentationForKey:](self, "unwrappedDataRepresentationForKey:", self->_encryptionKey));
  -[SDActivityEncryptionManager saveEncryptionKeyDataRepresentation:](self, "saveEncryptionKeyDataRepresentation:", v6);

  v9 = handoff_log(v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    sub_1001648D8(p_encryptionKey, v10);

}

- (SDActivityEncryptionKey)encryptionKey
{
  SDActivityEncryptionKey *encryptionKey;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unsigned __int16 v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  void *v14;
  SDActivityEncryptionKey *v15;
  SDActivityEncryptionKey *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  objc_class *v23;
  NSString *v24;
  void *v25;
  SDActivityEncryptionKey *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v36;
  uint64_t v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  int v43;
  __int16 v44;
  SDActivityEncryptionKey *v45;

  encryptionKey = self->_encryptionKey;
  if (!encryptionKey)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityEncryptionManager loadEncryptionKeyDataRepresentation](self, "loadEncryptionKeyDataRepresentation"));
    if (v4)
    {
      v36 = 0;
      v37 = 0;
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v4, 1, &v37, &v36));
      v6 = v36;
      v8 = v6;
      if (v5)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lastUsedCounter")));
        v10 = (unsigned __int16)objc_msgSend(v9, "integerValue");

        v13 = v10;
        if (v10 > 0xFF90u)
        {
          v34 = handoff_log(v11, v12);
          v21 = objc_claimAutoreleasedReturnValue(v34);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Did not load advertising encryption key from keychain as the bumped last used counter exceeds max value", buf, 2u);
          }
        }
        else
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v10 + 110));
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("lastUsedCounter"));

          v15 = -[SDActivityKey initWithDictRepresentation:]([SDActivityEncryptionKey alloc], "initWithDictRepresentation:", v5);
          v16 = self->_encryptionKey;
          self->_encryptionKey = v15;

          v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityEncryptionManager unwrappedDataRepresentationForKey:](self, "unwrappedDataRepresentationForKey:", self->_encryptionKey));
          -[SDActivityEncryptionManager saveEncryptionKeyDataRepresentation:](self, "saveEncryptionKeyDataRepresentation:", v17);

          v20 = handoff_log(v18, v19);
          v21 = objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            v23 = (objc_class *)objc_opt_class(self, v22);
            v24 = NSStringFromClass(v23);
            v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
            v26 = self->_encryptionKey;
            *(_DWORD *)buf = 138413058;
            v39 = v25;
            v40 = 1024;
            v41 = v13;
            v42 = 1024;
            v43 = 110;
            v44 = 2112;
            v45 = v26;
            _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "%@: Loaded advertising encryption key and bumped last used counter from %d by %d, then persisted key to keychain %@", buf, 0x22u);

          }
        }
      }
      else
      {
        v27 = handoff_log(v6, v7);
        v21 = objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          sub_10016494C((uint64_t)v8, v21, v28, v29, v30, v31, v32, v33);
      }

    }
    if (!self->_encryptionKey)
      -[SDActivityEncryptionManager generateNewEncryptionKey](self, "generateNewEncryptionKey");

    encryptionKey = self->_encryptionKey;
  }
  return encryptionKey;
}

- (void)bumpEncryptionKeyCounterValue
{
  uint32_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;

  v3 = arc4random();
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityEncryptionManager encryptionKey](self, "encryptionKey"));
  v5 = v3 + objc_msgSend(v4, "lastUsedCounter") - 31 * (v3 / 0x1F) + 20;

  v8 = handoff_log(v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v5 > 0xFFFE)
  {
    if (v10)
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Generating new advertising encryption key as the bumped value of the old one exceeds max value", (uint8_t *)&v13, 2u);
    }

    -[SDActivityEncryptionManager generateNewEncryptionKey](self, "generateNewEncryptionKey");
  }
  else
  {
    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityEncryptionManager encryptionKey](self, "encryptionKey"));
      v13 = 134218240;
      v14 = objc_msgSend(v11, "lastUsedCounter");
      v15 = 2048;
      v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Bumped advertising encryption key counter value from %ld to %ld", (uint8_t *)&v13, 0x16u);

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityEncryptionManager encryptionKey](self, "encryptionKey"));
    objc_msgSend(v12, "setLastUsedCounter:", (unsigned __int16)v5);

  }
}

- (void)getTagAndCounterWhileEncryptingBytesInPlace:(unsigned __int8)a3[10] forAdvertisementWithVersion:(unsigned __int8)a4 handler:(id)a5
{
  uint64_t v5;
  void (**v8)(id, id, _WORD *, id);
  void *v9;
  void *v10;
  unsigned __int8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  __int16 v27;

  v5 = a4;
  v8 = (void (**)(id, id, _WORD *, id))a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityEncryptionManager encryptionKey](self, "encryptionKey"));
  objc_msgSend(v9, "prepareForNewEncryptionRequest");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityEncryptionManager encryptionKey](self, "encryptionKey"));
  v11 = objc_msgSend(v10, "isValidKey");

  if ((v11 & 1) == 0)
  {
    v14 = handoff_log(v12, v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_100164A58(self, v15);

    -[SDActivityEncryptionManager generateNewEncryptionKey](self, "generateNewEncryptionKey");
  }
  v27 = 0;
  v16 = objc_claimAutoreleasedReturnValue(-[SDActivityEncryptionManager encryptionKey](self, "encryptionKey"));
  v17 = objc_msgSend((id)v16, "getTagWhileEncryptingBytesInPlace:counterValue:forAdvertisementWithVersion:", a3, &v27, v5);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityEncryptionManager encryptionKey](self, "encryptionKey"));
  LODWORD(v16) = objc_msgSend(v18, "lastUsedCounter") + 10;

  HIDWORD(v19) = -1030792151 * v16;
  LODWORD(v19) = -1030792151 * v16;
  if ((v19 >> 2) <= 0x28F5C28)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityEncryptionManager encryptionKey](self, "encryptionKey"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityEncryptionManager unwrappedDataRepresentationForKey:](self, "unwrappedDataRepresentationForKey:", v20));
    -[SDActivityEncryptionManager saveEncryptionKeyDataRepresentation:](self, "saveEncryptionKeyDataRepresentation:", v21);

    v24 = handoff_log(v22, v23);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      sub_1001649B0(self, v25);

  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityEncryptionManager encryptionKey](self, "encryptionKey"));
  v8[2](v8, v17, &v27, objc_msgSend(v26, "lastUsedCounter"));

}

- (void)setDecryptionKey:(id)a3 forDeviceIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  uint64_t v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_deviceIdentifierToDecryptionKey, "objectForKeyedSubscript:", v7));
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateCreated"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dateCreated"));
      objc_msgSend(v9, "timeIntervalSinceDate:", v10);
      v12 = (uint64_t)(v11 / 3600.0);

    }
    else
    {
      v12 = 0;
    }
    sub_1000C09E0(v8 != 0, objc_msgSend(v8, "lastUsedCounter"), objc_msgSend(v6, "lastUsedCounter"), v12);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_deviceIdentifierToDecryptionKey, "setObject:forKeyedSubscript:", v6, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityEncryptionManager unwrappedDataRepresentationForKey:](self, "unwrappedDataRepresentationForKey:", v6));
    v14 = -[SDActivityEncryptionManager saveDecryptionKeyDataRepresentation:forDeviceIdentifier:](self, "saveDecryptionKeyDataRepresentation:forDeviceIdentifier:", v13, v7);

    v17 = handoff_log(v15, v16);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    v19 = v18;
    if (v14)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        sub_100164B00();
    }
    else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      sub_100164B60();
    }

  }
}

- (id)decryptionKeyForDeviceIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_deviceIdentifierToDecryptionKey, "objectForKeyedSubscript:", v4));
  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityEncryptionManager loadDecryptionKeyDataRepresentationForDeviceIdentifier:](self, "loadDecryptionKeyDataRepresentationForDeviceIdentifier:", v4));
    v5 = -[SDActivityEncryptionManager newDecryptionKeyFromDataRepresentation:](self, "newDecryptionKeyFromDataRepresentation:", v6);

    if (v5)
    {
      v9 = handoff_log(v7, v8);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        sub_100164BC0();

      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_deviceIdentifierToDecryptionKey, "setObject:forKeyedSubscript:", v5, v4);
    }
  }

  return v5;
}

- (id)cachedDecryptionKeyForDeviceIdentifier:(id)a3
{
  return -[NSMutableDictionary objectForKeyedSubscript:](self->_deviceIdentifierToDecryptionKey, "objectForKeyedSubscript:", a3);
}

- (NSData)dataRepresentationForCurrentEncryptionKey
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  _QWORD *v13;
  size_t v14;
  char *v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v29;
  id v30;
  uint8_t buf[8];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityEncryptionManager encryptionKey](self, "encryptionKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dictRepresentation"));
  v5 = objc_msgSend(v4, "mutableCopy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("keyData")));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityEncryptionManager loadWrappingKeyData](self, "loadWrappingKeyData"));
    v8 = objc_msgSend(v7, "length");
    v10 = handoff_log(v8, v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v12)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Converting key to wrapped key", buf, 2u);
      }

      v13 = (_QWORD *)ccaes_ecb_encrypt_mode();
      v14 = (*v13 + 15) & 0xFFFFFFFFFFFFFFF0;
      v15 = (char *)&v29 - v14;
      bzero((char *)&v29 - v14, v14);
      ccecb_init(v13, v15, objc_msgSend(v7, "length"), objc_msgSend(objc_retainAutorelease(v7), "bytes"));
      v16 = ccwrap_wrapped_size(objc_msgSend(v6, "length"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", v16));
      objc_msgSend(v17, "setLength:", v16);
      *(_QWORD *)buf = v16;
      v18 = objc_msgSend(v6, "length");
      v19 = objc_msgSend(objc_retainAutorelease(v6), "bytes");
      v20 = objc_retainAutorelease(v17);
      ccwrap_auth_encrypt(v13, v15, v18, v19, buf, objc_msgSend(v20, "mutableBytes"));
      v21 = objc_msgSend(v20, "copy");
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v21, CFSTR("keyData"));

      objc_msgSend(v5, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("isWrappedKey"));
    }
    else
    {
      if (v12)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Not wrapping key as wrapping key is unavailable", buf, 2u);
      }

      objc_msgSend(v5, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("isWrappedKey"));
    }
    v30 = 0;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v5, 200, 0, &v30));
    v23 = v30;
    v25 = v23;
    if (!v22)
    {
      v26 = handoff_log(v23, v24);
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        sub_100164C20();

    }
  }
  else
  {
    v22 = 0;
  }

  return (NSData *)v22;
}

- (id)unwrappedDataRepresentationForKey:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dictRepresentation"));
  v4 = objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("isWrappedKey"));
  v12 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v4, 200, 0, &v12));
  v6 = v12;
  v8 = v6;
  if (!v5)
  {
    v9 = handoff_log(v6, v7);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_100164C20();

  }
  return v5;
}

- (id)newDecryptionKeyFromDataRepresentation:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned int v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  _QWORD *v19;
  size_t v20;
  char *v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  id v26;
  NSObject *v27;
  id v28;
  id v29;
  SDActivityDecryptionKey *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD v54[2];
  uint8_t buf[8];
  id v56;
  uint64_t v57;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v56 = 0;
    v57 = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v3, 1, &v57, &v56));
    v5 = v56;
    v7 = v5;
    if (v4)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isWrappedKey")));
      v9 = objc_msgSend(v8, "BOOLValue");

      if (!v9)
      {
LABEL_9:
        v30 = -[SDActivityKey initWithDictRepresentation:]([SDActivityDecryptionKey alloc], "initWithDictRepresentation:", v4);
LABEL_20:

        goto LABEL_21;
      }
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("keyData")));
      if (-[NSObject length](v10, "length"))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDActivityEncryptionManager sharedEncryptionManager](SDActivityEncryptionManager, "sharedEncryptionManager"));
        v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "loadWrappingKeyData"));

        v14 = -[NSObject length](v13, "length");
        v16 = handoff_log(v14, v15);
        v17 = objc_claimAutoreleasedReturnValue(v16);
        v18 = v17;
        if (v14)
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Converting wrapped key to key", buf, 2u);
          }

          v19 = (_QWORD *)ccaes_ecb_decrypt_mode();
          v54[1] = v54;
          v20 = (*v19 + 15) & 0xFFFFFFFFFFFFFFF0;
          v21 = (char *)v54 - v20;
          bzero((char *)v54 - v20, v20);
          v22 = -[NSObject length](v13, "length");
          v23 = objc_retainAutorelease(v13);
          ccecb_init(v19, v21, v22, -[NSObject bytes](v23, "bytes"));
          v24 = ccwrap_unwrapped_size(-[NSObject length](v10, "length"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", v24));
          objc_msgSend(v25, "setLength:", v24);
          *(_QWORD *)buf = v24;
          v26 = -[NSObject length](v10, "length");
          v27 = objc_retainAutorelease(v10);
          v28 = -[NSObject bytes](v27, "bytes");
          v29 = objc_retainAutorelease(v25);
          ccwrap_auth_decrypt(v19, v21, v26, v28, buf, objc_msgSend(v29, "mutableBytes"));
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v29, CFSTR("keyData"));

          goto LABEL_9;
        }
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          sub_100164D14(v18, v46, v47, v48, v49, v50, v51, v52);

      }
      else
      {
        v38 = handoff_log(0, v11);
        v13 = objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          sub_100164CE4(v13, v39, v40, v41, v42, v43, v44, v45);
      }

    }
    else
    {
      v31 = handoff_log(v5, v6);
      v10 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_100164C80((uint64_t)v7, v10, v32, v33, v34, v35, v36, v37);
    }

    v30 = 0;
    goto LABEL_20;
  }
  v30 = 0;
LABEL_21:

  return v30;
}

- (BOOL)deleteAllEncryptionAndDecryptionKeys
{
  SDActivityEncryptionManager *v2;
  uint64_t v3;
  NSObject *v4;
  NSData *wrappingKey;
  SDActivityEncryptionKey *encryptionKey;
  OSStatus v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  char v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint8_t v17[16];

  v2 = self;
  self->_shouldRefreshWrappingKey = 1;
  if (self->_wrappingKey
    || self->_encryptionKey
    || (self = (SDActivityEncryptionManager *)-[NSMutableDictionary count](self->_deviceIdentifierToDecryptionKey, "count")) != 0)
  {
    v3 = handoff_log(self, a2);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Successfully cleared in-memory key caches", v17, 2u);
    }

    wrappingKey = v2->_wrappingKey;
    v2->_wrappingKey = 0;

    encryptionKey = v2->_encryptionKey;
    v2->_encryptionKey = 0;

    -[NSMutableDictionary removeAllObjects](v2->_deviceIdentifierToDecryptionKey, "removeAllObjects");
  }
  v7 = SecItemDelete((CFDictionaryRef)-[SDActivityEncryptionManager baseDictEncryptionKey](v2, "baseDictEncryptionKey"));
  v8 = SecItemDelete((CFDictionaryRef)-[SDActivityEncryptionManager baseDictDecryptionKeyForDeviceIdentifier:](v2, "baseDictDecryptionKeyForDeviceIdentifier:", 0));
  if (v7)
    v10 = v7 == -25300;
  else
    v10 = 1;
  v11 = v10;
  if ((_DWORD)v8)
    v12 = (_DWORD)v8 == -25300;
  else
    v12 = 1;
  v13 = v12;
  v14 = handoff_log(v8, v9);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    sub_100164D44(v11, v13, v15);

  return v11 & v13;
}

- (id)allKeys
{
  NSMutableArray *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  id v40;
  uint64_t v41;
  void *i;
  void *v43;
  void *v44;
  id v46;
  id v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  CFTypeRef cf;
  CFTypeRef result;
  uint8_t v55[128];
  uint8_t buf[8];

  v3 = objc_opt_new(NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityEncryptionManager baseDict](self, "baseDict"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kSecReturnAttributes);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", kSecMatchLimitAll, kSecMatchLimit);
  v5 = objc_msgSend(v4, "mutableCopy");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityEncryptionManager baseDictWrappingKey](self, "baseDictWrappingKey"));
  objc_msgSend(v5, "addEntriesFromDictionary:", v6);

  result = 0;
  v7 = SecItemCopyMatching((CFDictionaryRef)v5, &result);
  if ((_DWORD)v7)
  {
    v9 = v7;
    v10 = handoff_log(v7, v8);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "SecItemCopyMatching wrappingKeyQuery failed with error %d", buf, 8u);
    }

  }
  else
  {
    -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", result);
    CFRelease(result);
  }
  v12 = objc_msgSend(v4, "mutableCopy");
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityEncryptionManager baseDictEncryptionKey](self, "baseDictEncryptionKey"));
  objc_msgSend(v12, "addEntriesFromDictionary:", v13);

  *(_QWORD *)buf = 0;
  v14 = SecItemCopyMatching((CFDictionaryRef)v12, (CFTypeRef *)buf);
  if ((_DWORD)v14)
  {
    v16 = v14;
    v17 = handoff_log(v14, v15);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_100164E38(v16, v18, v19, v20, v21, v22, v23, v24);

  }
  else
  {
    -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", *(_QWORD *)buf);
    CFRelease(*(CFTypeRef *)buf);
  }
  v25 = objc_msgSend(v4, "mutableCopy");
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityEncryptionManager baseDictDecryptionKeyForDeviceIdentifier:](self, "baseDictDecryptionKeyForDeviceIdentifier:", 0));
  objc_msgSend(v25, "addEntriesFromDictionary:", v26);

  cf = 0;
  v27 = SecItemCopyMatching((CFDictionaryRef)v25, &cf);
  if ((_DWORD)v27)
  {
    v29 = v27;
    v30 = handoff_log(v27, v28);
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      sub_100164DD4(v29, v31, v32, v33, v34, v35, v36, v37);

  }
  else
  {
    v46 = v12;
    v47 = v5;
    v48 = v4;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v38 = (id)cf;
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v40; i = (char *)i + 1)
        {
          if (*(_QWORD *)v50 != v41)
            objc_enumerationMutation(v38);
          v43 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i);
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKeyedSubscript:", kSecAttrAccount));
          if (objc_msgSend(v44, "hasPrefix:", CFSTR("handoff-decryption-key")))
            -[NSMutableArray addObject:](v3, "addObject:", v43);

        }
        v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
      }
      while (v40);
    }

    CFRelease(cf);
    v5 = v47;
    v4 = v48;
    v12 = v46;
  }

  return v3;
}

- (id)loadWrappingKeyData
{
  NSData *wrappingKey;
  NSData **p_wrappingKey;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint8_t *v12;
  NSData *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int16 v18;
  __int16 v19;

  -[SDActivityEncryptionManager testWrappingKeychainItem](self, "testWrappingKeychainItem");
  if (self->_shouldRefreshWrappingKey)
  {
    self->_shouldRefreshWrappingKey = 0;
    p_wrappingKey = &self->_wrappingKey;
    wrappingKey = self->_wrappingKey;
    self->_wrappingKey = 0;

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityEncryptionManager baseDictWrappingKey](self, "baseDictWrappingKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityEncryptionManager loadKeyDataRepresentationWithBaseDict:](self, "loadKeyDataRepresentationWithBaseDict:", v5));

    if (objc_msgSend(v6, "length") == (id)32)
    {
      objc_storeStrong((id *)&self->_wrappingKey, v6);
      v9 = handoff_log(v7, v8);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 0;
        v11 = "Loaded wrapping key from keychain";
        v12 = (uint8_t *)&v19;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v11, v12, 2u);
      }
    }
    else
    {
      v13 = *p_wrappingKey;
      *p_wrappingKey = 0;

      v16 = handoff_log(v14, v15);
      v10 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 0;
        v11 = "No wrapping key found in keychain";
        v12 = (uint8_t *)&v18;
        goto LABEL_7;
      }
    }

  }
  return self->_wrappingKey;
}

- (id)loadKeyDataRepresentationWithBaseDict:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CFTypeRef result;

  v3 = a3;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kSecReturnData);
  result = 0;
  v4 = SecItemCopyMatching((CFDictionaryRef)v3, &result);

  if (!(_DWORD)v4)
    return (id)(id)result;
  v7 = handoff_log(v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    sub_100164E9C(v4, v8, v9, v10, v11, v12, v13, v14);

  return 0;
}

- (BOOL)saveKeyDataRepresentation:(id)a3 withBaseDict:(id)a4
{
  id v5;
  id v6;
  BOOL v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  _DWORD v25[2];
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  CFStringRef v30;
  id v31;

  v5 = a4;
  v30 = kSecValueData;
  v31 = a3;
  v6 = a3;
  v7 = 1;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1));

  v9 = objc_msgSend(v8, "mutableCopy");
  objc_msgSend(v9, "setObject:forKeyedSubscript:", kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly, kSecAttrAccessible);
  v10 = objc_msgSend(v5, "mutableCopy");
  objc_msgSend(v10, "addEntriesFromDictionary:", v9);
  if (SecItemAdd((CFDictionaryRef)v10, 0))
  {
    v11 = SecItemUpdate((CFDictionaryRef)v5, (CFDictionaryRef)v9);
    if (!(_DWORD)v11)
      goto LABEL_13;
    v13 = v11;
    v14 = handoff_log(v11, v12);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v25[0] = 67109634;
      v25[1] = v13;
      v26 = 2112;
      v27 = v5;
      v28 = 2112;
      v29 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to update keychain item with error %d for query %@ attributesToUpdate %@", (uint8_t *)v25, 0x1Cu);
    }

    objc_msgSend(v10, "removeObjectForKey:", kSecAttrAccessible);
    v16 = SecItemDelete((CFDictionaryRef)v10);
    if ((_DWORD)v16)
    {
      v18 = handoff_log(v16, v17);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        sub_100164F60();

    }
    objc_msgSend(v10, "setObject:forKeyedSubscript:", kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly, kSecAttrAccessible);
    v20 = SecItemAdd((CFDictionaryRef)v10, 0);
    if ((_DWORD)v20)
    {
      v22 = handoff_log(v20, v21);
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        sub_100164F00();

      v7 = 0;
    }
    else
    {
LABEL_13:
      v7 = 1;
    }
  }

  return v7;
}

- (id)loadEncryptionKeyDataRepresentation
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityEncryptionManager baseDictEncryptionKey](self, "baseDictEncryptionKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityEncryptionManager loadKeyDataRepresentationWithBaseDict:](self, "loadKeyDataRepresentationWithBaseDict:", v3));

  return v4;
}

- (BOOL)saveEncryptionKeyDataRepresentation:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityEncryptionManager baseDictEncryptionKey](self, "baseDictEncryptionKey"));
  LOBYTE(self) = -[SDActivityEncryptionManager saveKeyDataRepresentation:withBaseDict:](self, "saveKeyDataRepresentation:withBaseDict:", v4, v5);

  return (char)self;
}

- (id)loadDecryptionKeyDataRepresentationForDeviceIdentifier:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityEncryptionManager baseDictDecryptionKeyForDeviceIdentifier:](self, "baseDictDecryptionKeyForDeviceIdentifier:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityEncryptionManager loadKeyDataRepresentationWithBaseDict:](self, "loadKeyDataRepresentationWithBaseDict:", v4));

  return v5;
}

- (BOOL)saveDecryptionKeyDataRepresentation:(id)a3 forDeviceIdentifier:(id)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityEncryptionManager baseDictDecryptionKeyForDeviceIdentifier:](self, "baseDictDecryptionKeyForDeviceIdentifier:", a4));
  LOBYTE(self) = -[SDActivityEncryptionManager saveKeyDataRepresentation:withBaseDict:](self, "saveKeyDataRepresentation:withBaseDict:", v6, v7);

  return (char)self;
}

- (id)baseDict
{
  NSMutableDictionary *v2;

  v2 = objc_opt_new(NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", kSecClassGenericPassword, kSecClass);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", CFSTR("com.apple.continuity.encryption"), kSecAttrService);
  return v2;
}

- (id)baseDictWrappingKey
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityEncryptionManager baseDict](self, "baseDict"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("com.apple.continuity.encryption"), kSecAttrAccessGroup);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("handoff-wrapping-key"), kSecAttrAccount);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", kSecAttrAccount));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, kSecAttrLabel);

  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("Handoff Wrapping Key"), kSecAttrDescription);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kSecAttrSynchronizable);
  return v2;
}

- (id)baseDictEncryptionKey
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityEncryptionManager baseDict](self, "baseDict"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("com.apple.continuity.encryption"), kSecAttrAccessGroup);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("handoff-own-encryption-key"), kSecAttrAccount);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", kSecAttrAccount));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, kSecAttrLabel);

  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("Handoff Encryption Key"), kSecAttrDescription);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, kSecAttrSynchronizable);
  return v2;
}

- (id)baseDictDecryptionKeyForDeviceIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityEncryptionManager baseDict](self, "baseDict"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("com.apple.continuity.encryption"), kSecAttrAccessGroup);
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), CFSTR("handoff-decryption-key"), v4));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, kSecAttrAccount);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", kSecAttrAccount));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, kSecAttrLabel);

  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("Handoff Decryption Key"), kSecAttrDescription);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, kSecAttrSynchronizable);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappingKey, 0);
  objc_storeStrong((id *)&self->_encryptionKey, 0);
  objc_storeStrong((id *)&self->_deviceIdentifierToDecryptionKey, 0);
}

@end
