@implementation MIBUCertHelper

+ (BOOL)SUCertPresent
{
  void *v2;
  unsigned int v3;
  NSObject *v4;
  BOOL v5;
  _UNKNOWN **v6;
  id v7;
  __int128 v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unsigned __int8 v14;
  NSObject *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  uint64_t v23;
  _BYTE v24[128];

  if (os_variant_has_internal_content("com.apple.inboxupdaterd")
    && (v2 = (void *)objc_claimAutoreleasedReturnValue(+[MIBUTestPreferences sharedInstance](MIBUTestPreferences, "sharedInstance")),
        v3 = objc_msgSend(v2, "factorySUCertExist"),
        v2,
        v3))
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100055E30);
    v4 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Overriding factory SU certificate existence to YES", buf, 2u);
    }
    return 1;
  }
  else
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = off_100068520;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    if (v7)
    {
      v9 = v7;
      v10 = *(_QWORD *)v19;
      v5 = 1;
      *(_QWORD *)&v8 = 138543362;
      v17 = v8;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v6);
          v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager", v17, (_QWORD)v18));
          v14 = objc_msgSend(v13, "fileExistsAtPath:", v12);

          if ((v14 & 1) == 0)
          {
            if (qword_100068958 != -1)
              dispatch_once(&qword_100068958, &stru_100055E50);
            v15 = qword_100068950;
            v5 = 0;
            if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v17;
              v23 = v12;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Certificate file %{public}@ does not exist", buf, 0xCu);
              v5 = 0;
            }
          }
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      }
      while (v9);
    }
    else
    {
      v5 = 1;
    }

  }
  return v5;
}

+ (void)readSUIdentityWithCompletion:(id)a3
{
  void (**v4)(id, void *, void *, id);
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  NSObject *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  __CFString *v25;

  v4 = (void (**)(id, void *, void *, id))a3;
  if (os_variant_has_internal_content("com.apple.inboxupdaterd"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MIBUTestPreferences sharedInstance](MIBUTestPreferences, "sharedInstance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "factorySUCertPath"));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[MIBUTestPreferences sharedInstance](MIBUTestPreferences, "sharedInstance"));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "factorySUCertPath"));

      if (qword_100068958 != -1)
        dispatch_once(&qword_100068958, &stru_100055E70);
      v9 = qword_100068950;
      if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v25 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Overriding SU certificate path to %{public}@", buf, 0xCu);
      }
    }
    else
    {
      v8 = CFSTR("/private/var/hardware/factory/su/su0-cert.der");
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MIBUTestPreferences sharedInstance](MIBUTestPreferences, "sharedInstance"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "factorySUKeyPath"));

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[MIBUTestPreferences sharedInstance](MIBUTestPreferences, "sharedInstance"));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "factorySUKeyPath"));

      if (qword_100068958 != -1)
        dispatch_once(&qword_100068958, &stru_100055E90);
      v14 = qword_100068950;
      if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v25 = v10;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Overriding SU key path to %{public}@", buf, 0xCu);
      }
    }
    else
    {
      v10 = CFSTR("/private/var/hardware/factory/su/su0-key.der");
    }
  }
  else
  {
    v10 = CFSTR("/private/var/hardware/factory/su/su0-key.der");
    v8 = CFSTR("/private/var/hardware/factory/su/su0-cert.der");
  }
  v23 = 0;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_getCertDataFromPath:error:", v8, &v23));
  v16 = v23;
  if (v16)
  {
    v20 = v16;
    v19 = 0;
    v17 = 0;
  }
  else
  {
    v22 = 0;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_parseDERCertificates:error:", v15, &v22));
    v18 = v22;
    if (v18)
    {
      v20 = v18;
      v19 = 0;
    }
    else
    {
      v21 = 0;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_getCertDataFromPath:error:", v10, &v21));
      v20 = v21;
    }
  }
  v4[2](v4, v17, v19, v20);

}

+ (void)trustCertificatesWithCompletion:(id)a3
{
  void (**v4)(id, NSMutableArray *, NSMutableArray *, id);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  NSMutableArray *v27;
  void *v28;
  __CFString *v29;
  void (**v30)(id, NSMutableArray *, NSMutableArray *, id);
  NSMutableArray *v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  uint64_t v40;

  v4 = (void (**)(id, NSMutableArray *, NSMutableArray *, id))a3;
  if (!os_variant_has_internal_content("com.apple.inboxupdaterd"))
  {
    v10 = 0;
    v11 = 0;
    v31 = 0;
    v8 = 0;
    v12 = CFSTR("retail-wifi-cert.apple.com");
    goto LABEL_31;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MIBUTestPreferences sharedInstance](MIBUTestPreferences, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "iseTrustCertPaths"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MIBUTestPreferences sharedInstance](MIBUTestPreferences, "sharedInstance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "iseTrustCertPaths"));

    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100055EB0);
    v9 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v40 = (uint64_t)v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Overriding ISE trust certificate paths to: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    v8 = 0;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MIBUTestPreferences sharedInstance](MIBUTestPreferences, "sharedInstance"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "iseTrustCertName"));

  if (!v14)
  {
    v12 = CFSTR("retail-wifi-cert.apple.com");
    if (!v8)
      goto LABEL_27;
    goto LABEL_16;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MIBUTestPreferences sharedInstance](MIBUTestPreferences, "sharedInstance"));
  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "iseTrustCertName"));

  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_100055ED0);
  v17 = qword_100068950;
  if (!os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (__CFString *)v16;
    if (!v8)
      goto LABEL_27;
    goto LABEL_16;
  }
  *(_DWORD *)buf = 138543362;
  v40 = v16;
  v12 = (__CFString *)v16;
  _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Overriding ISE trust certificate name to: %{public}@", buf, 0xCu);
  if (v8)
  {
LABEL_16:
    v29 = v12;
    v30 = v4;
    v31 = objc_opt_new(NSMutableArray);
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v28 = v8;
    v18 = v8;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v19)
    {
      v20 = v19;
      v11 = 0;
      v10 = 0;
      v21 = *(_QWORD *)v35;
      while (2)
      {
        v22 = 0;
        v23 = v11;
        v24 = v10;
        do
        {
          if (*(_QWORD *)v35 != v21)
            objc_enumerationMutation(v18);
          v25 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)v22);
          v33 = 0;
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_getCertDataFromPath:error:", v25, &v33, v28));
          v26 = v33;

          if (v26)
          {
            v11 = v23;
LABEL_34:
            v8 = v18;

            v27 = 0;
            v12 = v29;
            v4 = v30;
            goto LABEL_32;
          }
          v32 = 0;
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_parseDERCertificates:error:", v10, &v32));
          v26 = v32;

          if (v26)
            goto LABEL_34;
          -[NSMutableArray addObjectsFromArray:](v31, "addObjectsFromArray:", v11);
          v22 = (char *)v22 + 1;
          v23 = v11;
          v24 = v10;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        if (v20)
          continue;
        break;
      }
    }
    else
    {
      v11 = 0;
      v10 = 0;
    }

    v12 = v29;
    v4 = v30;
    v8 = v28;
    if (!v29)
      goto LABEL_28;
LABEL_31:
    v27 = objc_opt_new(NSMutableArray);
    -[NSMutableArray addObject:](v27, "addObject:", v12);
    v26 = 0;
    goto LABEL_32;
  }
LABEL_27:
  v31 = 0;
  v11 = 0;
  v10 = 0;
  if (v12)
    goto LABEL_31;
LABEL_28:
  v26 = 0;
  v27 = 0;
LABEL_32:
  v4[2](v4, v31, v27, v26);

}

+ (__SecKey)suCertKeyFromData:(id)a3 isSEPKey:(BOOL)a4 error:(id *)a5
{
  const __CFData *v7;
  NSObject *v8;
  const __CFDictionary *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __SecKey *v14;
  id v15;
  const __CFDictionary *v16;
  NSObject *v17;
  SecAccessControlRef v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  uint8_t buf[16];
  CFErrorRef error;
  _QWORD v34[4];
  _QWORD v35[4];
  _QWORD v36[2];
  _QWORD v37[2];

  v7 = (const __CFData *)a3;
  error = 0;
  if (!os_variant_has_internal_content("com.apple.inboxupdaterd") || a4)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100055F10);
    v17 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Factory SU key is SEP key", buf, 2u);
    }
    v18 = SecAccessControlCreateWithFlags(0, kSecAttrAccessibleAlwaysThisDeviceOnlyPrivate, 0x40000000uLL, &error);
    if (v18)
    {
      v34[0] = kSecAttrIsPermanent;
      v34[1] = kSecAttrTokenID;
      v35[0] = &__kCFBooleanFalse;
      v35[1] = kSecAttrTokenIDAppleKeyStore;
      v34[2] = kSecAttrTokenOID;
      v34[3] = kSecAttrAccessControl;
      v35[2] = v7;
      v35[3] = v18;
      v16 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v35, v34, 4));
      v14 = SecKeyCreateWithData((CFDataRef)+[NSData data](NSData, "data"), v16, &error);
      if (v14)
      {
        v15 = 0;
      }
      else
      {
        v29 = 0;
        sub_10000D680(&v29, 50331648, error, CFSTR("Failed to convert RK data blob."), v23, v24, v25, v26, v28);
        v15 = v29;
      }
    }
    else
    {
      v30 = 0;
      sub_10000D680(&v30, 0x1000000, error, CFSTR("Failed to create access control."), v19, v20, v21, v22, v28);
      v15 = v30;
      v16 = 0;
      v14 = 0;
    }
  }
  else
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100055EF0);
    v8 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Factory SU key is not SEP key", buf, 2u);
    }
    v36[0] = kSecAttrType;
    v36[1] = kSecAttrKeyClass;
    v37[0] = kSecAttrKeyTypeRSA;
    v37[1] = kSecAttrKeyClassPrivate;
    v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v37, v36, 2));
    v14 = SecKeyCreateWithData(v7, v9, &error);
    if (!v14 || error)
    {
      v31 = 0;
      sub_10000D680(&v31, 50331648, error, CFSTR("Failed to create SecKeyRef with data"), v10, v11, v12, v13, v28);
      v15 = v31;
    }
    else
    {
      v15 = 0;
    }

    v16 = 0;
  }
  if (a5)
    *a5 = objc_retainAutorelease(v15);

  return v14;
}

+ (id)certificatesFromData:(id)a3 error:(id *)a4
{
  id v5;
  NSMutableArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  SecCertificateRef v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  SecCertificateRef v16;
  uint64_t v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v5 = a3;
  v6 = objc_opt_new(NSMutableArray);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v7);
        v11 = SecCertificateCreateWithData(0, *(CFDataRef *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i));
        if (!v11)
        {
          v19 = 0;
          sub_10000D680(&v19, 50331648, 0, CFSTR("Failed to create certificate from data."), v12, v13, v14, v15, v18);
          v8 = v19;
          goto LABEL_11;
        }
        v16 = v11;
        -[NSMutableArray addObject:](v6, "addObject:", v11);

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  if (a4)
    *a4 = objc_retainAutorelease(v8);

  return v6;
}

+ (void)deleteSUCert:(id *)a3
{
  NSObject *v3;
  _UNKNOWN **v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  unsigned __int8 v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  id v31;
  _BYTE v32[128];

  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_100055F30);
  v3 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Deleting SU Certificate ...", buf, 2u);
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v4 = off_100068520;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v25;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v12 = objc_msgSend(v11, "fileExistsAtPath:", v10);

        if ((v12 & 1) != 0)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
          v23 = v7;
          v14 = objc_msgSend(v13, "removeItemAtPath:error:", v10, &v23);
          v15 = v23;

          if ((v14 & 1) == 0)
          {
            if (qword_100068958 != -1)
              dispatch_once(&qword_100068958, &stru_100055F70);
            v16 = qword_100068950;
            if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v29 = v10;
              v30 = 2114;
              v31 = v15;
              _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to delete %{public}@ with error: %{public}@", buf, 0x16u);
            }
            sub_10000D680(a3, 50331650, v15, CFSTR("Failed to delete %@"), v17, v18, v19, v20, v10);
          }
          v7 = v15;
        }
        else
        {
          if (qword_100068958 != -1)
            dispatch_once(&qword_100068958, &stru_100055F50);
          v21 = qword_100068950;
          if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v29 = v10;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Certificate file %{public}@ does not exist, skip deletion...", buf, 0xCu);
          }
        }
        v9 = (char *)v9 + 1;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

}

+ (id)_getCertDataFromPath:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v7 = objc_msgSend(v6, "fileExistsAtPath:", v5);

  if ((v7 & 1) == 0)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100055F90);
    v10 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003BC10((uint64_t)v5, v10, v11, v12, v13, v14, v15, v16);
    sub_10000D680(a4, 50331649, 0, CFSTR("%@ does not exist"), v13, v14, v15, v16, (uint64_t)v5);
    goto LABEL_14;
  }
  v8 = objc_msgSend(objc_alloc((Class)NSData), "initWithContentsOfFile:", v5);
  if (!v8)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100055FB0);
    v17 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003BBA8((uint64_t)v5, v17, v18, v19, v20, v21, v22, v23);
    sub_10000D680(a4, 50331648, 0, CFSTR("Failed to load %@"), v20, v21, v22, v23, (uint64_t)v5);
LABEL_14:
    v8 = 0;
  }

  return v8;
}

+ (id)_parseDERCertificates:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  id v13;
  uint64_t v14;
  int v15;
  id v16;
  unint64_t v18;
  _OWORD v19[3];

  memset(v19, 0, sizeof(v19));
  v18 = 0;
  v5 = objc_retainAutorelease(a3);
  v6 = objc_msgSend(v5, "bytes");
  v7 = CTParseCertificateSet((unint64_t)v6, (unint64_t)objc_msgSend(v5, "length") + (_QWORD)v6, v19, 3, &v18);
  if ((_DWORD)v7)
    v12 = 1;
  else
    v12 = v18 == 0;
  if (v12)
  {
    sub_10000D680(a4, 50331648, 0, CFSTR("Failed to parse certificate set: 0x%08x"), v8, v9, v10, v11, v7);
    v13 = 0;
  }
  else
  {
    v13 = objc_alloc_init((Class)NSMutableArray);
    if (v13 && v18)
    {
      v14 = 0;
      v15 = 0;
      do
      {
        v16 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", *(_QWORD *)&v19[v14], *((_QWORD *)&v19[v14] + 1));
        objc_msgSend(v13, "setObject:atIndexedSubscript:", v16, v14);

        v14 = ++v15;
      }
      while (v18 > v15);
    }
  }

  return v13;
}

@end
