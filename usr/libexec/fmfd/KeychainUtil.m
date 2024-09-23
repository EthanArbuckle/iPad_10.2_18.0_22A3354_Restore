@implementation KeychainUtil

+ (int)keychainItemForService:(id)a3 withUsername:(id)a4 returningItem:(id *)a5
{
  id v8;
  id v9;
  __CFDictionary *Mutable;
  OSStatus v11;
  CFTypeRef v12;
  BOOL v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  id v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  NSObject *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  NSObject *v40;
  id v41;
  id v42;
  NSObject *v43;
  id v44;
  id v46;
  CFTypeRef result;
  _QWORD v48[3];
  uint8_t buf[4];
  id v50;
  __int16 v51;
  id v52;
  __int16 v53;
  CFTypeRef v54;
  __int16 v55;
  id v56;

  v8 = a3;
  v9 = a4;
  objc_msgSend(a1, "hideKeychainUI");
  if (a5)
    *a5 = 0;
  if (objc_msgSend(v8, "length") && objc_msgSend(v9, "length"))
  {
    Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, 0, 0);
    CFDictionaryAddValue(Mutable, kSecClass, kSecClassGenericPassword);
    CFDictionaryAddValue(Mutable, kSecAttrAccount, v9);
    CFDictionaryAddValue(Mutable, kSecAttrService, v8);
    CFDictionaryAddValue(Mutable, kSecAttrAccessGroup, CFSTR("fmfd_keychain_group"));
    CFDictionaryAddValue(Mutable, kSecReturnData, kCFBooleanTrue);
    result = 0;
    v11 = SecItemCopyMatching(Mutable, &result);
    v12 = result;
    if (v11)
      v13 = 1;
    else
      v13 = result == 0;
    if (v13)
    {
      if (v11)
      {
        if (v11 == -25300)
        {
          v14 = sub_100011D0C();
          v15 = objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            sub_100064404(v15, v16, v17, v18, v19, v20, v21, v22);
        }
        else
        {
          v44 = sub_100011D0C();
          v15 = objc_claimAutoreleasedReturnValue(v44);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            v50 = v8;
            v51 = 2112;
            v52 = v9;
            v53 = 2048;
            v54 = (CFTypeRef)v11;
            _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "SecItemCopyMatching failed for service %@ & user %@ with result: %ld", buf, 0x20u);
          }
        }

      }
    }
    else
    {
      if (a5)
      {
        v23 = objc_alloc((Class)NSKeyedUnarchiver);
        v46 = 0;
        v24 = objc_msgSend(v23, "initForReadingFromData:error:", result, &v46);
        v25 = v46;
        if (v25)
        {
          v26 = sub_100011D0C();
          v27 = objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            sub_10006439C((uint64_t)v25, v27, v28, v29, v30, v31, v32, v33);

        }
        objc_msgSend(v24, "setRequiresSecureCoding:", 1);
        v34 = sub_100011D0C();
        v35 = objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          v36 = *a5;
          *(_DWORD *)buf = 138413058;
          v50 = v8;
          v51 = 2112;
          v52 = v9;
          v53 = 2112;
          v54 = result;
          v55 = 2112;
          v56 = v36;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Unarchiver before decoding service:%@, username:%@, returnData:%@(decoded:%@)", buf, 0x2Au);
        }

        v48[0] = objc_opt_class(NSDictionary);
        v48[1] = objc_opt_class(NSDate);
        v48[2] = objc_opt_class(NSString);
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v48, 3));
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v37));
        *a5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "decodeObjectOfClasses:forKey:", v38, CFSTR("fmfd_keychain_data_key")));

        v39 = sub_100011D0C();
        v40 = objc_claimAutoreleasedReturnValue(v39);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          v41 = *a5;
          *(_DWORD *)buf = 138413058;
          v50 = v8;
          v51 = 2112;
          v52 = v9;
          v53 = 2112;
          v54 = result;
          v55 = 2112;
          v56 = v41;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Unarchiver after decoding service:%@, username:%@, returnData:%@(decoded:%@)", buf, 0x2Au);
        }

        if (!*a5)
        {
          v42 = sub_100011D0C();
          v43 = objc_claimAutoreleasedReturnValue(v42);
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v50 = v8;
            v51 = 2112;
            v52 = v9;
            _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Unarchiver was not able to decode existing data, cleaning up any existing data from keychain for service: %@, username: %@", buf, 0x16u);
          }

          +[KeychainUtil removeKeychainItemForService:withUsername:](KeychainUtil, "removeKeychainItemForService:withUsername:", v8, v9);
        }

        v12 = result;
      }
      CFRelease(v12);
    }
    CFRelease(Mutable);
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(a1, "restoreKeychainUI");

  return v11;
}

+ (void)setKeychainItemForService:(id)a3 withUsername:(id)a4 value:(id)a5 accessibility:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  __CFDictionary *Mutable;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  const void **v23;
  id v24;
  id v25;
  id v26;
  OSStatus v27;
  id v28;
  NSObject *v29;
  OSStatus v30;
  OSStatus v31;
  id v32;
  NSObject *v33;
  CFTypeRef v34;
  id v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  __int16 v42;
  void *v43;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(a1, "hideKeychainUI");
  v13 = objc_msgSend(v10, "length");
  if (!v12 || !v13 || !objc_msgSend(v11, "length"))
    goto LABEL_30;
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, 0, 0);
  CFDictionaryAddValue(Mutable, kSecClass, kSecClassGenericPassword);
  CFDictionaryAddValue(Mutable, kSecAttrAccount, v11);
  CFDictionaryAddValue(Mutable, kSecAttrService, v10);
  CFDictionaryAddValue(Mutable, kSecAttrAccessGroup, CFSTR("fmfd_keychain_group"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](NSMutableData, "data"));
  v16 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initForWritingWithMutableData:", v15);
  v17 = sub_100011D0C();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v37 = v10;
    v38 = 2112;
    v39 = v11;
    v40 = 2112;
    v41 = v12;
    v42 = 2112;
    v43 = v15;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Archiver before encoding service:%@, username:%@, value:%@(encoded value:%@)", buf, 0x2Au);
  }

  objc_msgSend(v16, "setRequiresSecureCoding:", 1);
  objc_msgSend(v16, "encodeObject:forKey:", v12, CFSTR("fmfd_keychain_data_key"));
  objc_msgSend(v16, "finishEncoding");
  v19 = sub_100011D0C();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v37 = v10;
    v38 = 2112;
    v39 = v11;
    v40 = 2112;
    v41 = v12;
    v42 = 2112;
    v43 = v15;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Archiver after encoding service:%@, username:%@, value:%@(encoded value:%@)", buf, 0x2Au);
  }

  CFDictionaryAddValue(Mutable, kSecValueData, v15);
  switch(a6)
  {
    case 4:
      v25 = sub_100011D0C();
      v22 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v37 = v10;
        v38 = 2112;
        v39 = v11;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Setting AOSAccessibleAlways keychain item for service: %@ and account: %@", buf, 0x16u);
      }
      v23 = (const void **)&kSecAttrAccessibleAlwaysPrivate;
      goto LABEL_20;
    case 3:
      v24 = sub_100011D0C();
      v22 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v37 = v10;
        v38 = 2112;
        v39 = v11;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Setting AOSAccessibleAfterFirstUnlock keychain item for service: %@ and account: %@", buf, 0x16u);
      }
      v23 = (const void **)&kSecAttrAccessibleAfterFirstUnlock;
      goto LABEL_20;
    case 2:
      v21 = sub_100011D0C();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v37 = v10;
        v38 = 2112;
        v39 = v11;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Setting AOSAccessibleWhenUnlocked keychain item for service: %@ and account: %@", buf, 0x16u);
      }
      v23 = (const void **)&kSecAttrAccessibleWhenUnlocked;
LABEL_20:

      CFDictionaryAddValue(Mutable, kSecAttrAccessible, *v23);
      break;
  }
  v35 = 0;
  +[KeychainUtil keychainItemForService:withUsername:returningItem:](KeychainUtil, "keychainItemForService:withUsername:returningItem:", v10, v11, &v35);
  v26 = v35;
  if (v26)
  {
    v27 = SecItemDelete(Mutable);
    v28 = sub_100011D0C();
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v37 = v10;
      v38 = 2048;
      v39 = (id)v27;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Removed existing keychain item for service %@ with result: %ld", buf, 0x16u);
    }

  }
  v34 = 0;
  v30 = SecItemAdd(Mutable, &v34);
  if (v30)
  {
    v31 = v30;
    v32 = sub_100011D0C();
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v37 = v10;
      v38 = 2112;
      v39 = v11;
      v40 = 2048;
      v41 = (id)v31;
      _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "SecItemAdd failed for service %@ & user %@ with result: %ld", buf, 0x20u);
    }

  }
  CFRelease(Mutable);

LABEL_30:
  objc_msgSend(a1, "restoreKeychainUI");

}

+ (void)removeKeychainItemForService:(id)a3 withUsername:(id)a4
{
  id v6;
  id v7;
  __CFDictionary *Mutable;
  OSStatus v9;
  OSStatus v11;
  id v12;
  NSObject *v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  uint64_t v19;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "hideKeychainUI");
  if (objc_msgSend(v6, "length") && objc_msgSend(v7, "length"))
  {
    Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, 0, 0);
    CFDictionaryAddValue(Mutable, kSecClass, kSecClassGenericPassword);
    CFDictionaryAddValue(Mutable, kSecAttrAccount, v7);
    CFDictionaryAddValue(Mutable, kSecAttrService, v6);
    CFDictionaryAddValue(Mutable, kSecAttrAccessGroup, CFSTR("fmfd_keychain_group"));
    v9 = SecItemDelete(Mutable);
    if (v9 != -25300 && v9 != 0)
    {
      v11 = v9;
      v12 = sub_100011D0C();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = 138412802;
        v15 = v6;
        v16 = 2112;
        v17 = v7;
        v18 = 2048;
        v19 = v11;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "SecItemDelete failed for service %@ & user %@ with result: %ld", (uint8_t *)&v14, 0x20u);
      }

    }
    CFRelease(Mutable);
  }
  objc_msgSend(a1, "restoreKeychainUI");

}

@end
