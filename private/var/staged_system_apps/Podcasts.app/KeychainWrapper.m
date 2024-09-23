@implementation KeychainWrapper

- (KeychainWrapper)init
{
  KeychainWrapper *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *genericPasswordQuery;
  void *v5;
  OSStatus v6;
  void *v7;
  void *v8;
  CFTypeRef result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)KeychainWrapper;
  v2 = -[KeychainWrapper init](&v11, "init");
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    genericPasswordQuery = v2->genericPasswordQuery;
    v2->genericPasswordQuery = v3;

    -[NSMutableDictionary setObject:forKey:](v2->genericPasswordQuery, "setObject:forKey:", kSecClassGenericPassword, kSecClass);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", "com.apple.podcasts.accountId", 28));
    -[NSMutableDictionary setObject:forKey:](v2->genericPasswordQuery, "setObject:forKey:", v5, kSecAttrGeneric);
    -[NSMutableDictionary setObject:forKey:](v2->genericPasswordQuery, "setObject:forKey:", kSecMatchLimitOne, kSecMatchLimit);
    -[NSMutableDictionary setObject:forKey:](v2->genericPasswordQuery, "setObject:forKey:", kCFBooleanTrue, kSecAttrSynchronizable);
    -[NSMutableDictionary setObject:forKey:](v2->genericPasswordQuery, "setObject:forKey:", kCFBooleanTrue, kSecReturnAttributes);
    result = 0;
    v6 = SecItemCopyMatching((CFDictionaryRef)v2->genericPasswordQuery, &result);
    if (v6 == -25300)
    {
      -[KeychainWrapper resetKeychainItem](v2, "resetKeychainItem");
    }
    else if (!v6)
    {
      v7 = (void *)result;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[KeychainWrapper secItemFormatToDictionary:](v2, "secItemFormatToDictionary:", result));
      -[KeychainWrapper setKeychainData:](v2, "setKeychainData:", v8);

LABEL_8:
      return v2;
    }
    if (result)
      CFRelease(result);
    goto LABEL_8;
  }
  return v2;
}

- (void)mySetObject:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (v8)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->keychainData, "objectForKey:", v6));
    if ((objc_msgSend(v7, "isEqual:", v8) & 1) == 0)
    {
      -[NSMutableDictionary setObject:forKey:](self->keychainData, "setObject:forKey:", v8, v6);
      -[KeychainWrapper writeToKeychain](self, "writeToKeychain");
    }

  }
}

- (id)myObjectForKey:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->keychainData, "objectForKey:", a3);
}

- (void)setPersonId:(id)a3
{
  if (a3)
  {
    -[KeychainWrapper mySetObject:forKey:](self, "mySetObject:forKey:");
  }
  else
  {
    -[KeychainWrapper resetKeychainItem](self, "resetKeychainItem");
    -[KeychainWrapper writeToKeychain](self, "writeToKeychain");
  }
}

- (NSString)personId
{
  return (NSString *)-[KeychainWrapper myObjectForKey:](self, "myObjectForKey:", kSecValueData);
}

- (void)resetKeychainItem
{
  const __CFDictionary *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;

  if (self->keychainData)
  {
    v3 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(-[KeychainWrapper dictionaryToSecItemFormat:](self, "dictionaryToSecItemFormat:"));
    v4 = SecItemDelete(v3);
    v5 = v4;
    v6 = _MTLogCategoryCloudSync(v4);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 134217984;
      v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "problem deleting current keychain item (%li).", (uint8_t *)&v8, 0xCu);
    }

  }
  else
  {
    v3 = (const __CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    -[KeychainWrapper setKeychainData:](self, "setKeychainData:", v3);
  }

  -[NSMutableDictionary setObject:forKey:](self->keychainData, "setObject:forKey:", CFSTR("Podcasts Account Identity"), kSecAttrLabel);
  -[NSMutableDictionary setObject:forKey:](self->keychainData, "setObject:forKey:", CFSTR("Podcasts Account Identity"), kSecAttrDescription);
  -[NSMutableDictionary setObject:forKey:](self->keychainData, "setObject:forKey:", CFSTR("accountId"), kSecAttrAccount);
  -[NSMutableDictionary setObject:forKey:](self->keychainData, "setObject:forKey:", CFSTR("com.apple.podcasts"), kSecAttrService);
  -[NSMutableDictionary setObject:forKey:](self->keychainData, "setObject:forKey:", &stru_1004C6D40, kSecValueData);
  -[NSMutableDictionary setObject:forKey:](self->keychainData, "setObject:forKey:", kCFBooleanTrue, kSecAttrSynchronizable);
  -[NSMutableDictionary setObject:forKey:](self->keychainData, "setObject:forKey:", kCFBooleanTrue, kSecAttrIsInvisible);
}

- (id)dictionaryToSecItemFormat:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", "com.apple.podcasts.accountId", 28));
  objc_msgSend(v4, "setObject:forKey:", v5, kSecAttrGeneric);
  objc_msgSend(v4, "setObject:forKey:", kSecClassGenericPassword, kSecClass);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", kSecValueData));

  v7 = &stru_1004C6D40;
  if (v6)
    v7 = v6;
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString dataUsingEncoding:](v8, "dataUsingEncoding:", 4));
  objc_msgSend(v4, "setObject:forKey:", v9, kSecValueData);

  return v4;
}

- (id)secItemFormatToDictionary:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  CFTypeRef result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", a3));
  objc_msgSend(v3, "setObject:forKey:", kCFBooleanTrue, kSecReturnData);
  objc_msgSend(v3, "setObject:forKey:", kSecClassGenericPassword, kSecClass);
  result = 0;
  if (SecItemCopyMatching((CFDictionaryRef)v3, &result))
  {
    if (result)
      CFRelease(result);
  }
  else
  {
    objc_msgSend(v3, "removeObjectForKey:", kSecReturnData);
    v4 = objc_alloc((Class)NSString);
    v5 = objc_retainAutorelease((id)result);
    v6 = objc_msgSend(v5, "bytes");
    v7 = objc_msgSend(v4, "initWithBytes:length:encoding:", v6, objc_msgSend((id)result, "length"), 4);

    objc_msgSend(v3, "setObject:forKey:", v7, kSecValueData);
  }
  return v3;
}

- (void)writeToKeychain
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint8_t buf[16];
  uint8_t v15[8];
  CFTypeRef result;

  result = 0;
  NSLog(CFSTR("genericPasswordQuery: %@"), a2, self->genericPasswordQuery);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KeychainWrapper dictionaryToSecItemFormat:](self, "dictionaryToSecItemFormat:", self->keychainData));
  NSLog(CFSTR("secItemFormat: %@"), v3);

  if (SecItemCopyMatching((CFDictionaryRef)self->genericPasswordQuery, &result))
  {
    v4 = SecItemAdd((CFDictionaryRef)-[KeychainWrapper dictionaryToSecItemFormat:](self, "dictionaryToSecItemFormat:", self->keychainData), 0);
    if ((_DWORD)v4)
    {
      v5 = _MTLogCategoryDefault(v4);
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Couldn't add the Keychain Item.", buf, 2u);
      }

    }
    if (result)
      CFRelease(result);
  }
  else
  {
    v7 = (void *)result;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", result));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->genericPasswordQuery, "objectForKey:", kSecClass));
    objc_msgSend(v8, "setObject:forKey:", v9, kSecClass);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[KeychainWrapper dictionaryToSecItemFormat:](self, "dictionaryToSecItemFormat:", self->keychainData));
    objc_msgSend(v10, "removeObjectForKey:", kSecClass);
    v11 = SecItemUpdate((CFDictionaryRef)v8, (CFDictionaryRef)v10);
    if ((_DWORD)v11)
    {
      v12 = _MTLogCategoryDefault(v11);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Couldn't update the Keychain Item.", v15, 2u);
      }

    }
  }
}

- (NSMutableDictionary)keychainData
{
  return self->keychainData;
}

- (void)setKeychainData:(id)a3
{
  objc_storeStrong((id *)&self->keychainData, a3);
}

- (NSMutableDictionary)genericPasswordQuery
{
  return self->genericPasswordQuery;
}

- (void)setGenericPasswordQuery:(id)a3
{
  objc_storeStrong((id *)&self->genericPasswordQuery, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->genericPasswordQuery, 0);
  objc_storeStrong((id *)&self->keychainData, 0);
}

@end
