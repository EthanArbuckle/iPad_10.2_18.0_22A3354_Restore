@implementation MSDKeychainManager

+ (id)sharedInstance
{
  if (qword_1001753E0 != -1)
    dispatch_once(&qword_1001753E0, &stru_10013EEF8);
  return (id)qword_1001753D8;
}

- (MSDKeychainManager)init
{
  MSDKeychainManager *v2;
  id v3;
  MSDKeychainManager *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSDKeychainManager;
  v2 = -[MSDKeychainManager init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init((Class)NSMutableDictionary);
    -[MSDKeychainManager setCache:](v2, "setCache:", v3);

    v4 = v2;
  }

  return v2;
}

- (BOOL)saveItem:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  MSDKeychainManager *v8;
  void *v9;
  OSStatus v10;
  void *v11;
  BOOL v12;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  NSObject *v23;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDKeychainManager createSearchDictionaryForKey:](v8, "createSearchDictionaryForKey:", v7));
  if (!objc_msgSend(v9, "count"))
  {
    v14 = sub_1000604F0();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_1000C1B34((uint64_t)v7, v15, v16, v17, v18, v19, v20, v21);

    goto LABEL_13;
  }
  objc_msgSend(v9, "setObject:forKey:", v6, kSecValueData);
  v10 = SecItemAdd((CFDictionaryRef)v9, 0);
  if (v10 == -25299)
  {
    objc_msgSend(v9, "removeObjectForKey:", kSecValueData);
    v10 = -[MSDKeychainManager updateItemForAttributes:withData:](v8, "updateItemForAttributes:withData:", v9, v6);
  }
  if (v10)
  {
    v22 = sub_1000604F0();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      sub_1000C1B9C();

LABEL_13:
    v12 = 0;
    goto LABEL_6;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDKeychainManager cache](v8, "cache"));
  objc_msgSend(v11, "setValue:forKey:", v6, v7);

  v12 = 1;
LABEL_6:

  objc_sync_exit(v8);
  return v12;
}

- (id)getItemForKey:(id)a3
{
  uint64_t v3;
  id v5;
  MSDKeychainManager *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  CFTypeRef result;

  v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  result = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDKeychainManager cache](v6, "cache"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v5));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDKeychainManager cache](v6, "cache"));
    v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v5));

    v10 = 1;
    goto LABEL_7;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDKeychainManager createSearchDictionaryForKey:](v6, "createSearchDictionaryForKey:", v5));
  if (!objc_msgSend(v11, "count"))
  {
    v15 = sub_1000604F0();
    v12 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1000C1BFC(v12, v16, v17, v18, v19, v20, v21, v22);
    goto LABEL_15;
  }
  objc_msgSend(v11, "setObject:forKey:", kCFBooleanTrue, kSecReturnData);
  v3 = SecItemCopyMatching((CFDictionaryRef)v11, &result);
  if ((_DWORD)v3)
  {
    v23 = sub_1000604F0();
    v12 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1000C1C2C();
LABEL_15:
    v10 = 4;
    goto LABEL_6;
  }
  v3 = (uint64_t)result;
  v12 = objc_claimAutoreleasedReturnValue(-[MSDKeychainManager cache](v6, "cache"));
  -[NSObject setValue:forKey:](v12, "setValue:forKey:", v3, v5);
  v10 = 1;
LABEL_6:

LABEL_7:
  objc_sync_exit(v6);

  if (v10 == 4)
    v13 = 0;
  else
    v13 = (void *)v3;

  return v13;
}

- (BOOL)deleteItemForKey:(id)a3
{
  id v4;
  MSDKeychainManager *v5;
  void *v6;
  void *v7;
  BOOL v8;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDKeychainManager createSearchDictionaryForKey:](v5, "createSearchDictionaryForKey:", v4));
  if (!objc_msgSend(v6, "count"))
  {
    v10 = sub_1000604F0();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1000C1BFC(v11, v12, v13, v14, v15, v16, v17, v18);
    goto LABEL_9;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDKeychainManager cache](v5, "cache"));
  objc_msgSend(v7, "removeObjectForKey:", v4);

  if (SecItemDelete((CFDictionaryRef)v6))
  {
    v19 = sub_1000604F0();
    v11 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1000C1C8C();
LABEL_9:

    v8 = 0;
    goto LABEL_4;
  }
  v8 = 1;
LABEL_4:

  objc_sync_exit(v5);
  return v8;
}

- (BOOL)saveItem:(id)a3 forKey:(id)a4 withAttributes:(id)a5
{
  id v8;
  id v9;
  id v10;
  MSDKeychainManager *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  uint64_t v17;
  void *v18;
  OSStatus v19;
  BOOL v20;
  id v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  objc_sync_enter(v11);
  v31 = v9;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDKeychainManager createSearchDictionaryForKey:](v11, "createSearchDictionaryForKey:", v9));
  if (!objc_msgSend(v12, "count"))
  {
    v22 = sub_1000604F0();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      sub_1000C1B34((uint64_t)v9, v23, v24, v25, v26, v27, v28, v29);
    goto LABEL_18;
  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v13 = v10;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v15)
          objc_enumerationMutation(v13);
        v17 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", v17));
        objc_msgSend(v12, "setObject:forKey:", v18, v17);

      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v14);
  }

  objc_msgSend(v12, "setObject:forKey:", v8, kSecValueData);
  v19 = SecItemAdd((CFDictionaryRef)v12, 0);
  if (v19 == -25299)
  {
    objc_msgSend(v12, "removeObjectForKey:", kSecValueData);
    v19 = -[MSDKeychainManager updateItemForAttributes:withData:](v11, "updateItemForAttributes:withData:", v12, v8);
  }
  if (v19)
  {
    v30 = sub_1000604F0();
    v23 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      sub_1000C1B9C();
LABEL_18:

    v20 = 0;
    goto LABEL_13;
  }
  v20 = 1;
LABEL_13:

  objc_sync_exit(v11);
  return v20;
}

- (id)getAllItemsForKey:(id)a3 withAttributes:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  MSDKeychainManager *v7;
  void *v8;
  void *v9;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  CFTypeRef result;

  v4 = a4;
  v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  result = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDKeychainManager createSearchDictionaryForKey:](v7, "createSearchDictionaryForKey:", v6));
  if (!objc_msgSend(v8, "count"))
  {
    v11 = sub_1000604F0();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1000C1BFC(v12, v13, v14, v15, v16, v17, v18, v19);

    goto LABEL_13;
  }
  if (v4)
    objc_msgSend(v8, "setObject:forKey:", kCFBooleanTrue, kSecReturnAttributes);
  objc_msgSend(v8, "setObject:forKey:", kSecMatchLimitAll, kSecMatchLimit);
  objc_msgSend(v8, "setObject:forKey:", kCFBooleanTrue, kSecReturnData);
  if (SecItemCopyMatching((CFDictionaryRef)v8, &result))
  {
    v20 = sub_1000604F0();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_1000C1CEC();

LABEL_13:
    v9 = 0;
    goto LABEL_6;
  }
  v9 = (void *)result;
LABEL_6:

  objc_sync_exit(v7);
  return v9;
}

- (int)updateItemForAttributes:(id)a3 withData:(id)a4
{
  const __CFDictionary *v5;
  const __CFDictionary *v6;
  OSStatus v7;

  v5 = (const __CFDictionary *)a3;
  v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", a4, kSecValueData));
  v7 = SecItemUpdate(v5, v6);

  return v7;
}

- (id)createSearchDictionaryForKey:(id)a3
{
  __CFString *v3;
  id v4;
  const CFStringRef *v5;
  CFStringRef v6;
  CFStringRef v7;
  void *v8;
  id v10;
  NSObject *v11;
  uint8_t v12[16];

  v3 = (__CFString *)a3;
  v4 = objc_alloc_init((Class)NSMutableDictionary);
  if (-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("com.apple.mobilestoredemo.wifi.key")))
  {
    objc_msgSend(v4, "setObject:forKey:", kSecClassKey, kSecClass);
    objc_msgSend(v4, "setObject:forKey:", kSecAttrKeyClassSymmetric, kSecAttrKeyClass);
    v5 = &kSecAttrApplicationLabel;
LABEL_9:
    v6 = *v5;
    v8 = v4;
    v7 = v3;
    goto LABEL_10;
  }
  if (-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("com.apple.mobilestoredemo.keychainItemID")))
  {
    objc_msgSend(v4, "setObject:forKey:", kSecClassGenericPassword, kSecClass);
    objc_msgSend(v4, "setObject:forKey:", v3, kSecAttrService);
    v6 = kSecAttrAccount;
    v7 = CFSTR("UDID");
LABEL_5:
    v8 = v4;
LABEL_10:
    objc_msgSend(v8, "setObject:forKey:", v7, v6);
    goto LABEL_11;
  }
  if ((-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("com.apple.mobilestoredemo.keychainUserCredID")) & 1) != 0|| -[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("com.apple.mobilestoredemo.keychainAdminCredID")))
  {
    objc_msgSend(v4, "setObject:forKey:", kSecClassGenericPassword, kSecClass);
    v5 = &kSecAttrService;
    goto LABEL_9;
  }
  if (-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("com.appl.mobilestoredemo.bluetooth.")))
  {
    objc_msgSend(v4, "setObject:forKey:", CFSTR("com.apple.bluetooth"), kSecAttrAccessGroup);
    v7 = kSecClassGenericPassword;
    v6 = kSecClass;
    goto LABEL_5;
  }
  v10 = sub_1000604F0();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Recieved invalid subject from caller.", v12, 2u);
  }

LABEL_11:
  return v4;
}

- (NSMutableDictionary)cache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
