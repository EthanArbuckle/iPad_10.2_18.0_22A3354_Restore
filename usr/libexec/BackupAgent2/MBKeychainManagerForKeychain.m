@implementation MBKeychainManagerForKeychain

+ (id)fetchValueForServiceName:(id)a3 accountName:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  const __CFDictionary *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  id v15;
  MBError *v16;
  uint64_t v18;
  CFTypeRef result;
  uint8_t buf[4];
  const __CFDictionary *v21;
  _QWORD v22[4];
  _QWORD v23[4];

  v7 = a3;
  v8 = a4;
  result = 0;
  v22[0] = kSecClass;
  v22[1] = kSecAttrService;
  v23[0] = kSecClassGenericPassword;
  v23[1] = v7;
  v22[2] = kSecAttrAccount;
  v22[3] = kSecReturnData;
  v23[2] = v8;
  v23[3] = &__kCFBooleanTrue;
  v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, v22, 4));
  v11 = MBGetDefaultLog(v9, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v21 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Calling SecItemCopyMatching with query: %{public}@", buf, 0xCu);
    _MBLog(CFSTR("DEFAULT"), "Calling SecItemCopyMatching with query: %{public}@", v9);
  }

  v13 = SecItemCopyMatching(v9, &result);
  if ((_DWORD)v13 || !result)
  {
    if ((_DWORD)v13 == -25308)
    {
      if (a5)
      {
        v16 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 208, CFSTR("Cannot fetch %@:%@ from keychain while device is locked"), v7, v8, v18);
        goto LABEL_14;
      }
    }
    else if ((_DWORD)v13 == -25300)
    {
      if (a5)
      {
        v16 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 4, CFSTR("%@:%@ not found in keychain"), v7, v8, v18);
LABEL_14:
        v15 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue(v16);
        goto LABEL_16;
      }
    }
    else if (a5)
    {
      v16 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("Error copying %@:%@ from keychain (%d)"), v7, v8, v13);
      goto LABEL_14;
    }
    v15 = 0;
    goto LABEL_16;
  }
  v14 = objc_alloc((Class)NSString);
  v15 = objc_msgSend(v14, "initWithData:encoding:", result, 4);
  CFRelease(result);
LABEL_16:

  return v15;
}

+ (id)fetchLocalBackupPassword:(id *)a3
{
  return objc_msgSend(a1, "fetchValueForServiceName:accountName:error:", CFSTR("BackupAgent"), CFSTR("BackupPassword"), a3);
}

+ (id)fetchKeybagSecretForUUID:(id)a3 error:(id *)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fetchValueForServiceName:accountName:error:", CFSTR("BackupKeybagSecret"), a3, a4));
  if (v4)
    v5 = objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", v4, 0);
  else
    v5 = 0;

  return v5;
}

+ (BOOL)addValue:(id)a3 forServiceName:(id)a4 accountName:(id)a5 withAccessibility:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  const __CFDictionary *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  int v21;
  MBError *v22;
  uint64_t v24;
  uint8_t buf[4];
  const __CFDictionary *v26;
  _QWORD v27[6];
  _QWORD v28[6];

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v27[0] = kSecClass;
  v27[1] = kSecAttrService;
  v28[0] = kSecClassGenericPassword;
  v28[1] = v11;
  v27[2] = kSecAttrAccount;
  v27[3] = kSecAttrAccessible;
  v28[2] = v12;
  v28[3] = v13;
  v28[4] = &__kCFBooleanFalse;
  v27[4] = kSecReturnData;
  v27[5] = kSecValueData;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dataUsingEncoding:", 4));
  v28[5] = v14;
  v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 6));

  v18 = MBGetDefaultLog(v16, v17);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v26 = v15;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Calling SecItemAdd with query: %{public}@", buf, 0xCu);
    _MBLog(CFSTR("DEFAULT"), "Calling SecItemAdd with query: %{public}@", v15);
  }

  v20 = SecItemAdd(v15, 0);
  v21 = v20;
  if ((_DWORD)v20)
  {
    if ((_DWORD)v20 == -25308)
    {
      if (a7)
      {
        v22 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 208, CFSTR("Cannot add %@:%@ while device is locked"), v11, v12, v24);
LABEL_9:
        *a7 = (id)objc_claimAutoreleasedReturnValue(v22);
      }
    }
    else if (a7)
    {
      v22 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("Error adding %@:%@ to keychain (%d)"), v11, v12, v20);
      goto LABEL_9;
    }
  }

  return v21 == 0;
}

+ (BOOL)addLocalBackupPassword:(id)a3 error:(id *)a4
{
  return objc_msgSend(a1, "addValue:forServiceName:accountName:withAccessibility:error:", a3, CFSTR("BackupAgent"), CFSTR("BackupPassword"), kSecAttrAccessibleWhenUnlockedThisDeviceOnly, a4);
}

+ (BOOL)addKeybagSecret:(id)a3 forUUID:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;

  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "base64EncodedStringWithOptions:", 0));
  LOBYTE(a5) = objc_msgSend(a1, "addValue:forServiceName:accountName:withAccessibility:error:", v9, CFSTR("BackupKeybagSecret"), v8, kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly, a5);

  return (char)a5;
}

+ (BOOL)updateValue:(id)a3 forServiceName:(id)a4 accountName:(id)a5 withAccessibility:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  const __CFDictionary *v15;
  void *v16;
  const __CFDictionary *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  int v23;
  MBError *v24;
  uint64_t v26;
  uint8_t buf[4];
  const __CFDictionary *v28;
  __int16 v29;
  const __CFDictionary *v30;
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[4];
  _QWORD v34[4];

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v33[0] = kSecClass;
  v33[1] = kSecAttrService;
  v34[0] = kSecClassGenericPassword;
  v34[1] = v11;
  v33[2] = kSecAttrAccount;
  v33[3] = kSecReturnData;
  v34[2] = v12;
  v34[3] = &__kCFBooleanFalse;
  v14 = a3;
  v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v34, v33, 4));
  v31[0] = kSecValueData;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dataUsingEncoding:", 4));

  v31[1] = kSecAttrAccessible;
  v32[0] = v16;
  v32[1] = v13;
  v17 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v32, v31, 2));

  v20 = MBGetDefaultLog(v18, v19);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v28 = v15;
    v29 = 2114;
    v30 = v17;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Calling SecItemUpdate with query:%{public}@ attributes:%{public}@", buf, 0x16u);
    _MBLog(CFSTR("DEFAULT"), "Calling SecItemUpdate with query:%{public}@ attributes:%{public}@", v15, v17);
  }

  v22 = SecItemUpdate(v15, v17);
  v23 = v22;
  if ((_DWORD)v22)
  {
    if ((_DWORD)v22 == -25308)
    {
      if (a7)
      {
        v24 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 208, CFSTR("Cannot update %@:%@ while device is locked"), v11, v12, v26);
LABEL_9:
        *a7 = (id)objc_claimAutoreleasedReturnValue(v24);
      }
    }
    else if (a7)
    {
      v24 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("Error updating %@:%@ in keychain (%d)"), v11, v12, v22);
      goto LABEL_9;
    }
  }

  return v23 == 0;
}

+ (BOOL)updateLocalBackupPassword:(id)a3 error:(id *)a4
{
  return objc_msgSend(a1, "updateValue:forServiceName:accountName:withAccessibility:error:", a3, CFSTR("BackupAgent"), CFSTR("BackupPassword"), kSecAttrAccessibleWhenUnlockedThisDeviceOnly, a4);
}

+ (BOOL)updateKeybagSecret:(id)a3 forUUID:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;

  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "base64EncodedStringWithOptions:", 0));
  LOBYTE(a5) = objc_msgSend(a1, "updateValue:forServiceName:accountName:withAccessibility:error:", v9, CFSTR("BackupKeybagSecret"), v8, kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly, a5);

  return (char)a5;
}

+ (BOOL)removeValueWithServiceName:(id)a3 accountName:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  const __CFDictionary *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  MBError *v15;
  uint64_t v17;
  uint8_t buf[4];
  const __CFDictionary *v19;
  _QWORD v20[4];
  _QWORD v21[4];

  v7 = a3;
  v8 = a4;
  v20[0] = kSecClass;
  v20[1] = kSecAttrService;
  v21[0] = kSecClassGenericPassword;
  v21[1] = v7;
  v20[2] = kSecAttrAccount;
  v20[3] = kSecReturnData;
  v21[2] = v8;
  v21[3] = &__kCFBooleanFalse;
  v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 4));
  v11 = MBGetDefaultLog(v9, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Calling SecItemDelete with query:%{public}@", buf, 0xCu);
    _MBLog(CFSTR("DEFAULT"), "Calling SecItemDelete with query:%{public}@", v9);
  }

  v13 = SecItemDelete(v9);
  v14 = v13;
  if ((_DWORD)v13)
  {
    if ((_DWORD)v13 == -25308)
    {
      if (a5)
      {
        v15 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 208, CFSTR("Cannot remove %@:%@ while device is locked"), v7, v8, v17);
LABEL_9:
        *a5 = (id)objc_claimAutoreleasedReturnValue(v15);
      }
    }
    else if (a5)
    {
      v15 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("Error removing %@:%@ from keychain (%d)"), v7, v8, v13);
      goto LABEL_9;
    }
  }

  return v14 == 0;
}

+ (BOOL)removeValueWithServiceName:(id)a3 error:(id *)a4
{
  id v5;
  const __CFDictionary *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  MBError *v12;
  uint64_t v14;
  uint8_t buf[4];
  const __CFDictionary *v16;
  _QWORD v17[3];
  _QWORD v18[3];

  v5 = a3;
  v17[0] = kSecClass;
  v17[1] = kSecAttrService;
  v18[0] = kSecClassGenericPassword;
  v18[1] = v5;
  v17[2] = kSecReturnData;
  v18[2] = &__kCFBooleanFalse;
  v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 3));
  v8 = MBGetDefaultLog(v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Calling SecItemDelete without accountName for query:%{public}@", buf, 0xCu);
    _MBLog(CFSTR("DEFAULT"), "Calling SecItemDelete without accountName for query:%{public}@", v6);
  }

  v10 = SecItemDelete(v6);
  v11 = v10;
  if ((_DWORD)v10)
  {
    if ((_DWORD)v10 == -25308)
    {
      if (a4)
      {
        v12 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 208, CFSTR("Cannot remove %@ while device is locked"), v5, v14);
LABEL_9:
        *a4 = (id)objc_claimAutoreleasedReturnValue(v12);
      }
    }
    else if (a4)
    {
      v12 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, CFSTR("Error removing %@ from keychain (%d)"), v5, v10);
      goto LABEL_9;
    }
  }

  return v11 == 0;
}

+ (BOOL)removeLocalBackupPassword:(id *)a3
{
  return objc_msgSend(a1, "removeValueWithServiceName:accountName:error:", CFSTR("BackupAgent"), CFSTR("BackupPassword"), a3);
}

+ (BOOL)removeKeybagSecretsWithError:(id *)a3
{
  return objc_msgSend(a1, "removeValueWithServiceName:error:", CFSTR("BackupKeybagSecret"), a3);
}

+ (BOOL)removeKeybagSecretForUUID:(id)a3 error:(id *)a4
{
  return objc_msgSend(a1, "removeValueWithServiceName:accountName:error:", CFSTR("BackupKeybagSecret"), a3, a4);
}

@end
