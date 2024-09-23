@implementation OTAuthKitActualAdapter

- (BOOL)accountIsCDPCapableByAltDSID:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  BOOL v8;
  const __CFString *v9;
  const void *v10;
  const void *v11;
  NSObject *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  unint64_t v18;
  __int16 v19;
  const __CFString *v20;

  v3 = a3;
  if (objc_opt_class(ACAccount) && objc_opt_class(AKAccountManager))
  {
    v4 = objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](AKAccountManager, "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject authKitAccountWithAltDSID:](v4, "authKitAccountWithAltDSID:", v3));
    v6 = (unint64_t)-[NSObject securityLevelForAccount:](v4, "securityLevelForAccount:", v5);
    v7 = v6;
    v8 = (v6 & 0xFFFFFFFFFFFFFFFELL) == 4;
    if (v6 > 5)
      v9 = CFSTR("oh no please file a radar to Security | iCloud Keychain security level");
    else
      v9 = *(&off_1002DF618 + v6);
    v11 = sub_10000EF14("authkit");
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject altDSIDForAccount:](v4, "altDSIDForAccount:", v5));
      v15 = 138412802;
      v16 = v13;
      v17 = 2048;
      v18 = v7;
      v19 = 2112;
      v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Security level for altDSID %@ is %lu.  Account type: %@", (uint8_t *)&v15, 0x20u);

    }
  }
  else
  {
    v10 = sub_10000EF14("authkit");
    v4 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "AuthKit not available", (uint8_t *)&v15, 2u);
    }
    v8 = 0;
  }

  return v8;
}

- (BOOL)accountIsDemoAccountByAltDSID:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  const void *v8;
  NSObject *v9;
  int v11;
  id v12;
  __int16 v13;
  unsigned int v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](AKAccountManager, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "authKitAccountWithAltDSID:", v4));
  v7 = objc_msgSend(v5, "demoAccountForAccount:", v6);
  v8 = sub_10000EF14("authkit");
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412546;
    v12 = v4;
    v13 = 1024;
    v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Account with altDSID %@ is a demo account: %{BOOL}d", (uint8_t *)&v11, 0x12u);
  }

  return v7;
}

- (id)machineID:(id)a3 flowID:(id)a4 deviceSessionID:(id)a5 canSendMetrics:(BOOL)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  AAFAnalyticsEventSecurity *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  const void *v19;
  NSObject *v20;
  _BOOL4 v21;
  id v22;
  const void *v23;
  NSObject *v24;
  void *v25;
  const void *v26;
  NSObject *v27;
  void *v28;
  uint64_t v30;
  id v31;
  uint8_t buf[4];
  id v33;

  v11 = a5;
  v12 = a4;
  v13 = a3;
  LOBYTE(v30) = a6;
  v14 = -[AAFAnalyticsEventSecurity initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:]([AAFAnalyticsEventSecurity alloc], "initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:", 0, v13, v12, v11, CFSTR("com.apple.security.fetchMachineID"), 0, v30, &off_10030AF70);

  if (objc_opt_class(AKAnisetteProvisioningController) && objc_opt_class(AKAnisetteData))
  {
    v15 = objc_alloc_init((Class)AKAnisetteProvisioningController);
    v31 = 0;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "anisetteDataWithError:", &v31));
    v17 = v31;
    if (v16)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "machineID"));
      v19 = sub_10000EF14("authkit");
      v20 = objc_claimAutoreleasedReturnValue(v19);
      v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
      if (v18)
      {
        if (v21)
        {
          *(_DWORD *)buf = 138412290;
          v33 = v18;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "fetched current machine ID as: %@", buf, 0xCu);
        }

        +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", v14, 1, 0);
        v22 = v18;
      }
      else
      {
        if (v21)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Anisette data does not have machineID", buf, 2u);
        }

        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("com.apple.security.octagon"), 46, CFSTR("Anisette data does not have machineID")));
        if (a7)
        {
          +[SecABC triggerAutoBugCaptureWithType:subType:](SecABC, "triggerAutoBugCaptureWithType:subType:", CFSTR("AuthKit"), CFSTR("missingMID"));
          *a7 = objc_retainAutorelease(v28);
        }
        +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", v14, 0, v28);

      }
    }
    else
    {
      v26 = sub_10000EF14("authkit");
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v33 = v17;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Unable to fetch data: %@", buf, 0xCu);
      }

      if (a7)
        *a7 = objc_retainAutorelease(v17);
      +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", v14, 0, v17);
      v18 = 0;
    }

  }
  else
  {
    v23 = sub_10000EF14("authkit");
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "AKAnisette not available", buf, 2u);
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("com.apple.security.octagon"), 50, CFSTR("AKAnisette not available")));
    v15 = v25;
    if (a7)
      *a7 = objc_retainAutorelease(v25);
    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:](SecurityAnalyticsReporterRTC, "sendMetricWithEvent:success:error:", v14, 0, v15);
    v18 = 0;
  }

  return v18;
}

- (void)fetchCurrentDeviceListByAltDSID:(id)a3 flowID:(id)a4 deviceSessionID:(id)a5 reply:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  const void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  uint8_t buf[16];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (objc_opt_class(AKDeviceListRequestContext)
    && objc_opt_class(AKAppleIDAuthenticationController))
  {
    v13 = objc_alloc_init((Class)AKDeviceListRequestContext);
    if (v13)
    {
      v14 = v13;
      objc_msgSend(v13, "setAltDSID:", v9);
      objc_msgSend(v14, "setType:", 3);
      v15 = objc_alloc_init((Class)AKAppleIDAuthenticationController);
      if (v15)
      {
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_10012B9E4;
        v22[3] = &unk_1002DF5B8;
        v23 = v9;
        v24 = v10;
        v25 = v11;
        v26 = v12;
        objc_msgSend(v15, "deviceListWithContext:completion:", v14, v22);

      }
      else
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("com.apple.security.octagon"), 45, CFSTR("can't get authController")));
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSAnalytics logger](CKKSAnalytics, "logger"));
        objc_msgSend(v21, "logUnrecoverableError:forEvent:withAttributes:", v20, CFSTR("OctagonEventAuthKitDeviceList"), 0);

        (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, void *))v12 + 2))(v12, 0, 0, 0, 0, 0, 0, 0, 0, v20);
      }

    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("com.apple.security.octagon"), 43, CFSTR("can't get AKDeviceListRequestContextClass")));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSAnalytics logger](CKKSAnalytics, "logger"));
      objc_msgSend(v19, "logUnrecoverableError:forEvent:withAttributes:", v18, CFSTR("OctagonEventAuthKitDeviceList"), 0);

      (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, void *))v12 + 2))(v12, 0, 0, 0, 0, 0, 0, 0, 0, v18);
      v14 = 0;
    }
  }
  else
  {
    v16 = sub_10000EF14("authkit");
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "AuthKit not available", buf, 2u);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("com.apple.security.octagon"), 50, CFSTR("AKAnisette not available")));
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, void *))v12 + 2))(v12, 0, 0, 0, 0, 0, 0, 0, 0, v14);
  }

}

- (void)registerNotification:(id)a3
{
  id v4;
  void *v5;
  CKKSListenerCollection *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTAuthKitActualAdapter notifiers](self, "notifiers"));

  if (!v5)
  {
    v6 = -[CKKSListenerCollection initWithName:]([CKKSListenerCollection alloc], "initWithName:", CFSTR("otauthkitadapter-notifiers"));
    -[OTAuthKitActualAdapter setNotifiers:](self, "setNotifiers:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "addObserver:selector:name:object:", self, "notifyAKDeviceList:", AKDeviceListChangedNotification, 0);

  }
  v8 = (id)objc_claimAutoreleasedReturnValue(-[OTAuthKitActualAdapter notifiers](self, "notifiers"));
  objc_msgSend(v8, "registerListener:", v4);

}

- (void)notifyAKDeviceList:(id)a3
{
  id v4;
  void *v5;
  const void *v6;
  NSObject *v7;
  uint8_t v8[16];

  v4 = a3;
  if (objc_opt_class(AKDeviceListDeltaMessagePayload))
  {
    if (v4)
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    else
      v5 = 0;
    -[OTAuthKitActualAdapter deliverAKDeviceListDeltaMessagePayload:](self, "deliverAKDeviceListDeltaMessagePayload:", v5);

  }
  else
  {
    v6 = sub_10000EF14("authkit");
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "AuthKit not available; dropping device list notification",
        v8,
        2u);
    }

  }
}

- (void)deliverAKDeviceListDeltaMessagePayload:(id)a3
{
  const void *v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = sub_10000EF14("authkit");
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "received notifyAKDeviceListDeltaMessagePayload", v7, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTAuthKitActualAdapter notifiers](self, "notifiers"));
  objc_msgSend(v6, "iterateListeners:", &stru_1002DF5F8);

}

- (OTAuthKitAdapterNotifier)notifiers
{
  return (OTAuthKitAdapterNotifier *)objc_getProperty(self, a2, 8, 1);
}

- (void)setNotifiers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifiers, 0);
}

@end
