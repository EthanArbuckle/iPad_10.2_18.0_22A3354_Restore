@implementation MBKeychain

+ (id)passwordItemsForService:(id)a3 account:(id)a4 limit:(unint64_t)a5 error:(id *)a6
{
  id v10;
  const CFStringRef *v11;
  NSNumber *v12;
  uint64_t v13;
  NSMutableArray *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  CFTypeRef result;
  _BYTE v26[128];

  v10 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(v10, "setObject:forKeyedSubscript:", kSecClassGenericPassword, kSecClass);
  if (a3)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", a3, kSecAttrService);
  if (a4)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", a4, kSecAttrAccount);
  if (a5 == 1)
  {
    v11 = &kSecMatchLimitOne;
    goto LABEL_9;
  }
  if (!a5)
  {
    v11 = &kSecMatchLimitAll;
LABEL_9:
    v12 = (NSNumber *)*v11;
    goto LABEL_11;
  }
  v12 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a5);
LABEL_11:
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, kSecMatchLimit);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kSecReturnData);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kSecReturnAttributes);
  result = 0;
  v13 = SecItemCopyMatching((CFDictionaryRef)v10, &result);
  if ((_DWORD)v13 == -25300)
    return &__NSArray0__struct;
  if ((_DWORD)v13)
  {
    v14 = 0;
    if (a6)
      *a6 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("SecItemCopyMatching error: %d"), v13);
  }
  else
  {
    v14 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend((id)result, "count"));
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v15 = (void *)result;
    v16 = objc_msgSend((id)result, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v18)
            objc_enumerationMutation(v15);
          -[NSMutableArray addObject:](v14, "addObject:", +[MBKeychainItem keychainItemWithAttributes:](MBKeychainItem, "keychainItemWithAttributes:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i)));
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v17);
    }
  }
  return v14;
}

+ (id)allPasswordItemsForService:(id)a3 error:(id *)a4
{
  return +[MBKeychain passwordItemsForService:account:limit:error:](MBKeychain, "passwordItemsForService:account:limit:error:", a3, 0, 0, a4);
}

+ (id)allPasswordItemsForServices:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v6 = +[NSMutableArray array](NSMutableArray, "array");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(a3);
        v11 = +[MBKeychain allPasswordItemsForService:error:](MBKeychain, "allPasswordItemsForService:error:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), a4);
        if (!v11)
          return 0;
        objc_msgSend(v6, "addObjectsFromArray:", v11);
      }
      v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
        continue;
      break;
    }
  }
  return v6;
}

+ (BOOL)addPasswordItem:(id)a3 error:(id *)a4
{
  uint64_t v6;
  NSDictionary *v7;
  uint64_t v8;
  BOOL result;
  MBError *v10;
  MBError *v11;
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[3];
  _QWORD v15[3];
  _QWORD v16[7];
  _QWORD v17[7];

  v17[0] = kSecClassGenericPassword;
  v16[0] = kSecClass;
  v16[1] = kSecAttrService;
  v17[1] = objc_msgSend(a3, "serviceName");
  v16[2] = kSecAttrAccount;
  v17[2] = objc_msgSend(a3, "accountName");
  v16[3] = kSecAttrAccessGroup;
  v17[3] = objc_msgSend(a3, "accessGroupName");
  v16[4] = kSecAttrAccessible;
  v17[4] = objc_msgSend(a3, "accessibilityType");
  v16[5] = kSecValueData;
  v16[6] = kSecReturnData;
  v17[5] = objc_msgSend(a3, "valueData");
  v17[6] = &__kCFBooleanFalse;
  v6 = SecItemAdd((CFDictionaryRef)+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 7), 0);
  if (!(_DWORD)v6)
    return 1;
  if ((_DWORD)v6 == -25299)
  {
    v15[0] = kSecClassGenericPassword;
    v14[0] = kSecClass;
    v14[1] = kSecAttrService;
    v15[1] = objc_msgSend(a3, "serviceName");
    v14[2] = kSecAttrAccount;
    v15[2] = objc_msgSend(a3, "accountName");
    v7 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
    v12[0] = kSecAttrAccessible;
    v12[1] = kSecValueData;
    v13[0] = objc_msgSend(a3, "accessibilityType");
    v13[1] = objc_msgSend(a3, "valueData");
    v8 = SecItemUpdate((CFDictionaryRef)v7, (CFDictionaryRef)+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 2));
    result = (_DWORD)v8 == 0;
    if (a4 && (_DWORD)v8)
    {
      v10 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("SecItemUpdate error: %d"), v8);
LABEL_9:
      v11 = v10;
      result = 0;
      *a4 = v11;
    }
  }
  else
  {
    if (a4)
    {
      v10 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("SecItemAdd error: %d"), v6);
      goto LABEL_9;
    }
    return 0;
  }
  return result;
}

+ (BOOL)addAllPasswordItems:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v8)
        objc_enumerationMutation(a3);
      v10 = +[MBKeychain addPasswordItem:error:](MBKeychain, "addPasswordItem:error:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), a4);
      if (!v10)
        break;
      if (v7 == (id)++v9)
      {
        v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    LOBYTE(v10) = 1;
  }
  return v10;
}

@end
