@implementation SOSAuthKitHelpers

- (SOSAuthKitHelpers)initWithActiveMIDS:(id)a3
{
  id v5;
  SOSAuthKitHelpers *v6;
  NSSet *v7;
  NSSet *v8;
  NSSet *v9;
  NSSet *machineIDs;
  NSSet *v11;
  NSSet *serialNumbers;
  NSSet *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSSet *v23;
  NSSet *v24;
  NSSet *v25;
  SOSAuthKitHelpers *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];

  v5 = a3;
  v32.receiver = self;
  v32.super_class = (Class)SOSAuthKitHelpers;
  v6 = -[SOSAuthKitHelpers init](&v32, "init");
  if (v6)
  {
    v7 = (NSSet *)objc_alloc_init((Class)NSMutableSet);
    v8 = (NSSet *)objc_alloc_init((Class)NSMutableSet);
    v9 = (NSSet *)objc_alloc_init((Class)NSSet);
    machineIDs = v6->_machineIDs;
    v6->_machineIDs = v9;

    v11 = (NSSet *)objc_alloc_init((Class)NSSet);
    serialNumbers = v6->_serialNumbers;
    v6->_serialNumbers = v11;

    if (!v5)
    {

      v26 = 0;
      goto LABEL_17;
    }
    objc_storeStrong((id *)&v6->_midList, a3);
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v13 = v6->_midList;
    v14 = -[NSSet countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v29 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "machineID", (_QWORD)v28));

          if (v19)
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "machineID"));
            -[NSSet addObject:](v7, "addObject:", v20);

          }
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "serialNumber"));

          if (v21)
          {
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "serialNumber"));
            -[NSSet addObject:](v8, "addObject:", v22);

          }
        }
        v15 = -[NSSet countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v15);
    }

    v23 = v6->_machineIDs;
    v6->_machineIDs = v7;
    v24 = v7;

    v25 = v6->_serialNumbers;
    v6->_serialNumbers = v8;

  }
  v26 = v6;
LABEL_17:

  return v26;
}

- (BOOL)midIsValidInList:(id)a3
{
  if (a3)
    return -[NSSet containsObject:](self->_machineIDs, "containsObject:");
  else
    return 1;
}

- (BOOL)serialIsValidInList:(id)a3
{
  if (a3)
    return -[NSSet containsObject:](self->_serialNumbers, "containsObject:");
  else
    return 1;
}

- (BOOL)isUseful
{
  return -[NSSet count](self->_machineIDs, "count") != 0;
}

- (NSSet)midList
{
  return self->_midList;
}

- (void)setMidList:(id)a3
{
  objc_storeStrong((id *)&self->_midList, a3);
}

- (NSSet)machineIDs
{
  return self->_machineIDs;
}

- (void)setMachineIDs:(id)a3
{
  objc_storeStrong((id *)&self->_machineIDs, a3);
}

- (NSSet)serialNumbers
{
  return self->_serialNumbers;
}

- (void)setSerialNumbers:(id)a3
{
  objc_storeStrong((id *)&self->_serialNumbers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialNumbers, 0);
  objc_storeStrong((id *)&self->_machineIDs, 0);
  objc_storeStrong((id *)&self->_midList, 0);
}

+ (id)machineID
{
  const void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  const void *v10;
  NSObject *v11;
  _BOOL4 v12;
  const void *v13;
  NSObject *v14;
  const void *v15;
  const void *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  id v21;
  uint8_t buf[4];
  NSObject *v23;

  v2 = sub_10000EF14("sosauthkit");
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Entering machineID", buf, 2u);
  }

  if (objc_opt_class(AKAnisetteProvisioningController) && objc_opt_class(AKAnisetteData))
  {
    v4 = (void *)objc_opt_new(AKAnisetteProvisioningController);
    v5 = v4;
    if (!v4)
    {
      v15 = sub_10000EF14("sosauthkit");
      v6 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "can't get controller", buf, 2u);
      }
      v7 = 0;
      v9 = 0;
      goto LABEL_23;
    }
    v21 = 0;
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "anisetteDataWithError:", &v21));
    v7 = v21;
    if (v6)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject machineID](v6, "machineID"));
      v9 = objc_msgSend(v8, "copy");

      v10 = sub_10000EF14("sosauthkit");
      v11 = objc_claimAutoreleasedReturnValue(v10);
      v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      if (v9)
      {
        if (v12)
        {
          *(_DWORD *)buf = 138412290;
          v23 = v9;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "machineID is %@", buf, 0xCu);
        }
        goto LABEL_22;
      }
      if (v12)
      {
        *(_WORD *)buf = 0;
        v17 = "Failed to get machineID";
        v18 = v11;
        v19 = 2;
        goto LABEL_20;
      }
    }
    else
    {
      v16 = sub_10000EF14("sosauthkit");
      v11 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v7;
        v17 = "can't get mID: %@";
        v18 = v11;
        v19 = 12;
LABEL_20:
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
      }
    }
    v9 = 0;
LABEL_22:

LABEL_23:
    v14 = v9;

    goto LABEL_24;
  }
  v13 = sub_10000EF14("sosauthkit");
  v7 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "AKAnisette not available", buf, 2u);
  }
  v14 = 0;
LABEL_24:

  return v14;
}

+ (void)activeMIDs:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  const void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const void *v18;
  NSObject *v19;
  CFErrorDomain v20;
  const __CFString **v21;
  NSErrorUserInfoKey *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[16];
  NSErrorUserInfoKey v27;
  const __CFString *v28;
  uint64_t v29;
  NSErrorUserInfoKey v30;
  const __CFString *v31;
  NSErrorUserInfoKey v32;
  const __CFString *v33;
  NSErrorUserInfoKey v34;
  const __CFString *v35;

  v3 = a3;
  if (objc_opt_class(ACAccount) && objc_opt_class(AKDeviceListRequestContext))
  {
    v4 = objc_opt_class(AKAppleIDAuthenticationController);
    v5 = AKServiceNameiCloud;
    if (v4 && AKServiceNameiCloud != 0)
    {
      v11 = sub_1001F2CB0();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      v9 = (void *)v12;
      if (v12)
      {
        v13 = objc_opt_new(AKDeviceListRequestContext);
        if (v13)
        {
          v10 = (void *)v13;
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "aa_altDSID"));
          objc_msgSend(v10, "setAltDSID:", v14);

          v29 = v5;
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v29, 1));
          objc_msgSend(v10, "setServices:", v15);

          v16 = (void *)objc_opt_new(AKAppleIDAuthenticationController);
          if (v16)
          {
            v24[0] = _NSConcreteStackBlock;
            v24[1] = 3221225472;
            v24[2] = sub_1001F2EAC;
            v24[3] = &unk_1002EC830;
            v25 = v3;
            objc_msgSend(v16, "deviceListWithContext:completion:", v10, v24);
            v17 = v25;
          }
          else
          {
            v27 = NSLocalizedDescriptionKey;
            v28 = CFSTR("can't get authController");
            v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));
            v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kCFErrorDomainOSStatus, -50, v17));
            (*((void (**)(id, _QWORD, void *))v3 + 2))(v3, 0, v23);

          }
          goto LABEL_23;
        }
        v20 = kCFErrorDomainOSStatus;
        v30 = NSLocalizedDescriptionKey;
        v31 = CFSTR("can't get AKDeviceListRequestContextClass");
        v21 = &v31;
        v22 = &v30;
      }
      else
      {
        v18 = sub_10000EF14("sosauthkit");
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "can't get account", buf, 2u);
        }

        v20 = kCFErrorDomainOSStatus;
        v32 = NSLocalizedDescriptionKey;
        v33 = CFSTR("no primary account");
        v21 = &v33;
        v22 = &v32;
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v22, 1));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v20, -50, v10));
      (*((void (**)(id, _QWORD, void *))v3 + 2))(v3, 0, v16);
LABEL_23:

      goto LABEL_11;
    }
  }
  v7 = sub_10000EF14("sosauthkit");
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "ACAccount not available", buf, 2u);
  }

  v34 = NSLocalizedDescriptionKey;
  v35 = CFSTR("AuthKit/AppleAccount not available");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kCFErrorDomainOSStatus, -50, v9));
  (*((void (**)(id, _QWORD, void *))v3 + 2))(v3, 0, v10);
LABEL_11:

}

+ (BOOL)peerinfoHasMID:(id)a3
{
  uint64_t PeerInfo;

  PeerInfo = SOSFullPeerInfoGetPeerInfo(objc_msgSend(a3, "fullPeerInfo"));
  if (PeerInfo)
    return SOSPeerInfoV2DictionaryHasString(PeerInfo, sMachineIDKey);
  else
    return 1;
}

+ (BOOL)updateMIDInPeerInfo:(id)a3
{
  id v3;
  void *v4;
  char v5;
  const void *v6;
  NSObject *v7;
  CFTypeRef v8;
  _QWORD v10[4];
  id v11;
  CFTypeRef cf;
  uint8_t buf[4];
  CFTypeRef v14;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SOSAuthKitHelpers machineID](SOSAuthKitHelpers, "machineID"));
  if (v4)
  {
    cf = 0;
    sub_1001E6A88(v3, sMachineIDKey, (uint64_t)v4, &cf);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1001F2DBC;
    v10[3] = &unk_1002EC858;
    v11 = v4;
    v5 = sub_1001D9488(v3, (uint64_t)CFSTR("Add Machine ID"), (uint64_t)&cf, v10);
    if ((v5 & 1) == 0)
    {
      v6 = sub_10000EF14("sosauthkit");
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v14 = cf;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Failed to record MID in PeerInfo: %@", buf, 0xCu);
      }

    }
    v8 = cf;
    if (cf)
    {
      cf = 0;
      CFRelease(v8);
    }

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

+ (BOOL)accountIsCDPCapable
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  BOOL v6;
  const void *v7;
  const void *v8;
  void *v9;
  NSObject *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  BOOL v14;
  const void *v15;
  NSObject *v16;
  const __CFString *v17;
  const void *v18;
  NSObject *v19;
  void *v20;
  const void *v21;
  NSObject *v22;
  const char *v23;
  int v25;
  unint64_t v26;
  __int16 v27;
  unint64_t v28;
  __int16 v29;
  const __CFString *v30;

  if (objc_opt_class(ACAccount) && objc_opt_class(AKAccountManager))
  {
    v2 = sub_1001F2CB0();
    v3 = objc_claimAutoreleasedReturnValue(v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](AKAccountManager, "sharedInstance"));
    v5 = v4;
    if (v4)
      v6 = v3 == 0;
    else
      v6 = 1;
    if (v6)
    {
      v7 = sub_10000EF14("sosauthkit");
      v10 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v25) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Failed to get manager", (uint8_t *)&v25, 2u);
      }
      v14 = 0;
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "altDSIDForAccount:", v3));
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "authKitAccountWithAltDSID:", v9));

      v11 = (unint64_t)objc_msgSend(v5, "securityLevelForAccount:", v10);
      v12 = v11;
      v13 = v11 & 0xFFFFFFFFFFFFFFFELL;
      v14 = (v11 & 0xFFFFFFFFFFFFFFFELL) == 4;
      if ((v11 & 0xFFFFFFFFFFFFFFFELL) == 4)
        goto LABEL_18;
      v15 = sub_10000EF14("sosauthkit");
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v25 = 134217984;
        v26 = v12;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Security level is %lu", (uint8_t *)&v25, 0xCu);
      }

      if (v12 <= 5)
LABEL_18:
        v17 = *(&off_1002EC878 + v12);
      else
        v17 = CFSTR("oh no please file a radar to Security | iCloud Keychain security level");
      v18 = sub_10000EF14("sosauthkit");
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "altDSIDForAccount:", v3));
        v25 = 138412802;
        v26 = (unint64_t)v20;
        v27 = 2048;
        v28 = v12;
        v29 = 2112;
        v30 = v17;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Security level for altDSID %@ is %lu.  Account type: %@", (uint8_t *)&v25, 0x20u);

      }
      v21 = sub_10000EF14("sosauthkit");
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = "isn't";
        if (v13 == 4)
          v23 = "is";
        v25 = 136315138;
        v26 = (unint64_t)v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Account %s CDP Capable", (uint8_t *)&v25, 0xCu);
      }

    }
  }
  else
  {
    v8 = sub_10000EF14("sosauthkit");
    v3 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v25) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "ACAccount not available", (uint8_t *)&v25, 2u);
    }
    v14 = 0;
  }

  return v14;
}

@end
