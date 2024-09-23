@implementation MFAccountHealer

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100141EBC;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005AA028 != -1)
    dispatch_once(&qword_1005AA028, block);
  return (OS_os_log *)(id)qword_1005AA020;
}

- (MFAccountHealer)initWithAccount:(id)a3 networkController:(id)a4 error:(id)a5
{
  id v9;
  id v10;
  id v11;
  MFAccountHealer *v12;
  MFAccountHealer *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MFAccountHealer;
  v12 = -[MFAccountHealer init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_account, a3);
    objc_storeStrong((id *)&v13->_error, a5);
    objc_storeStrong((id *)&v13->_networkController, a4);
  }

  return v13;
}

- (void)healSilentlyWithCompletion:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void ***v18;
  void *v19;
  void *v20;
  void **v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, int);
  void *v24;
  MFAccountHealer *v25;
  id v26;
  uint8_t buf[4];
  void *v28;

  v5 = a3;
  if (pthread_main_np())
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFAccountHealer.m"), 40, CFSTR("Current thread is main"));

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFAccountHealer error](self, "error"));
  v7 = objc_msgSend(v6, "code");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFAccountHealer account](self, "account"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "baseAccount"));
  v10 = objc_msgSend(v9, "hasPasswordCredential");

  if ((v10 & 1) == 0
    && (v11 = (void *)objc_claimAutoreleasedReturnValue(-[MFAccountHealer networkController](self, "networkController")),
        v12 = objc_msgSend(v11, "isDataAvailable"),
        v11,
        v12)
    && (v7 == (id)1055 || v7 == (id)1032))
  {
    v14 = MFLogGeneral(v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MFAccountHealer account](self, "account"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "ef_publicDescription"));
      *(_DWORD *)buf = 138543362;
      v28 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Attempting renewal of credentials for account: %{public}@", buf, 0xCu);

    }
    v21 = _NSConcreteStackBlock;
    v22 = 3221225472;
    v23 = sub_1001422A4;
    v24 = &unk_10051D7E0;
    v25 = self;
    v26 = v5;
    v18 = objc_retainBlock(&v21);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MFAccountHealer error](self, "error", v21, v22, v23, v24, v25));
    -[MFAccountHealer _renewCredentialsWithError:completionHandler:](self, "_renewCredentialsWithError:completionHandler:", v19, v18);

  }
  else
  {
    (*((void (**)(id, _QWORD))v5 + 2))(v5, 0);
  }

}

- (void)healFromAlternateAccountWithCompletion:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  MFAccountHealer *v13;
  id v14;
  id v15;

  v5 = a3;
  if (pthread_main_np() != 1)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFAccountHealer.m"), 64, CFSTR("Current thread must be main"));

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFAccountHealer _alternateAccount](self, "_alternateAccount"));
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc((Class)MFAccountValidator), "initWithPerformsValidationInBackground:", 0);
    objc_msgSend(v7, "validateAccount:useSSL:", v6, objc_msgSend(v6, "usesSSL"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler globalAsyncScheduler](EFScheduler, "globalAsyncScheduler"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1001425A4;
    v11[3] = &unk_10051E640;
    v9 = v7;
    v12 = v9;
    v13 = self;
    v14 = v6;
    v15 = v5;
    objc_msgSend(v8, "performBlock:", v11);

  }
  else
  {
    (*((void (**)(id, _QWORD))v5 + 2))(v5, 0);
  }

}

- (BOOL)shouldHealFromAlternateAccount
{
  void *v3;
  uint64_t v4;
  int isKindOfClass;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  unsigned __int8 v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  BOOL v22;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  void *v30;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFAccountHealer account](self, "account"));
  v4 = objc_opt_class(MailAccount);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFAccountHealer account](self, "account"));
  v7 = objc_opt_class(DeliveryAccount);
  v8 = objc_opt_isKindOfClass(v6, v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFAccountHealer account](self, "account"));
  v10 = objc_msgSend(v9, "isManaged");

  v12 = 0;
  if ((v10 & 1) == 0 && ((isKindOfClass | v8) & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MFAccountHealer account](self, "account"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MFAccountHealer error](self, "error"));
    v12 = objc_msgSend(v13, "shouldFetchACEDBInfoForError:", v14);

  }
  v15 = MFLogGeneral(v11);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MFAccountHealer error](self, "error"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "ef_publicDescription"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v12));
    v27 = 138543618;
    v28 = v25;
    v29 = 2112;
    v30 = v26;
    _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Error for error we use to determind to heal with another account or not: %{public}@, should heal? %@", (uint8_t *)&v27, 0x16u);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MFAccountHealer account](self, "account"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MFAccountHealer _lastTimeConnectToACEDBForAccount:](self, "_lastTimeConnectToACEDBForAccount:", v17));

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v20 = objc_msgSend(objc_alloc((Class)NSCalendar), "initWithCalendarIdentifier:", NSCalendarIdentifierGregorian);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "components:fromDate:toDate:options:", 48, v18, v19, 0));
    v22 = (uint64_t)objc_msgSend(v21, "day") > 0 || (uint64_t)objc_msgSend(v21, "hour") > 24;

  }
  else
  {
    v22 = 1;
  }

  return v22 & v12;
}

- (id)_alternateAccount
{
  void *v3;
  uint64_t v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v18;
  id v19;
  __int16 v20;
  unsigned int v21;
  __int16 v22;
  unsigned int v23;

  if (!-[MFAccountHealer shouldHealFromAlternateAccount](self, "shouldHealFromAlternateAccount"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFAccountHealer account](self, "account"));
  v4 = objc_opt_class(MailAccount);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFAccountHealer account](self, "account"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFAccountHealer _fetchServerFromACEDB:forIncomingServer:](self, "_fetchServerFromACEDB:forIncomingServer:", v6, isKindOfClass & 1));

  if (v7
    && (v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFAccountHealer account](self, "account")),
        v9 = -[MFAccountHealer _shouldHealAccount:withNewAccount:](self, "_shouldHealAccount:withNewAccount:", v8, v7),
        v8,
        v9))
  {
    v10 = objc_claimAutoreleasedReturnValue(+[MFAccountHealer log](MFAccountHealer, "log"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "hostname"));
      v18 = 138412802;
      v19 = v11;
      v20 = 1024;
      v21 = objc_msgSend(v7, "portNumber");
      v22 = 1024;
      v23 = objc_msgSend(v7, "usesSSL");
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Informations we got back from Ace DB: %@, %i, %i", (uint8_t *)&v18, 0x18u);

    }
    v12 = v7;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MFAccountHealer account](self, "account"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "username"));
    objc_msgSend(v12, "setUsername:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MFAccountHealer account](self, "account"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "password"));
    objc_msgSend(v12, "setPassword:", v16);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)_shouldHealAccount:(id)a3 withNewAccount:(id)a4
{
  id v5;
  id v6;
  unsigned int v7;
  unsigned int v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  id v14;
  BOOL v15;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "usesSSL");
  if (v7 == objc_msgSend(v6, "usesSSL")
    && (v8 = objc_msgSend(v5, "portNumber"), v8 == objc_msgSend(v6, "portNumber")))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hostname"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "hostname"));
    v11 = objc_msgSend(v9, "caseInsensitiveCompare:", v10) != 0;

  }
  else
  {
    v11 = 1;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "type"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "type"));
  v14 = objc_msgSend(v12, "caseInsensitiveCompare:", v13);

  if (v14)
    v15 = v11;
  else
    v15 = 0;

  return v15;
}

- (id)_fetchServerFromACEDB:(id)a3 forIncomingServer:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  int v11;
  id *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v18;
  id v19;
  id v20;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  v19 = 0;
  v20 = 0;
  v18 = 0;
  if (v4)
  {
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstEmailAddress"));
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFAccountHealer _getMailAccountFromDeliveryAccount:](self, "_getMailAccountFromDeliveryAccount:", v6));
    v10 = v9;
    if (v9)
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstEmailAddress"));
    else
      v8 = &stru_100531B00;

  }
  if (-[__CFString length](v8, "length"))
    v11 = AccountConfigurationServiceCopyAccountsForEmailAddress(v8, &v20, &v19, &v18);
  else
    v11 = 0;
  v12 = &v19;
  if (v4)
    v12 = &v20;
  v13 = *v12;
  v14 = v13;
  if (v11 == 2)
    v15 = v13;
  else
    v15 = 0;
  v16 = v15;

  return v16;
}

- (id)_getMailAccountFromDeliveryAccount:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MailAccount activeAccounts](MailAccount, "activeAccounts"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10014343C;
  v8[3] = &unk_100520508;
  v5 = v3;
  v9 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ef_firstObjectPassingTest:", v8));

  return v6;
}

- (id)_lastTimeConnectToACEDBForAccount:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "accountPropertyForKey:", MFHealAccountDateLastFetched));
  objc_msgSend(v3, "doubleValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:"));

  return v4;
}

- (void)_overwriteAccount:(id)a3 withAlternateAccount:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = a4;
  objc_msgSend(v9, "setUsesSSL:", objc_msgSend(v5, "usesSSL"));
  objc_msgSend(v9, "setPortNumber:", objc_msgSend(v5, "portNumber"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hostname"));
  objc_msgSend(v9, "setHostname:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v7, "timeIntervalSince1970");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v9, "setValueInAccountProperties:forKey:", v8, MFHealAccountDateLastFetched);

  objc_msgSend(v9, "savePersistentAccount");
}

- (void)_renewCredentialsWithError:(id)a3 completionHandler:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFAccountHealer account](self, "account"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10014373C;
  v9[3] = &unk_100520530;
  v8 = v5;
  v10 = v8;
  objc_msgSend(v7, "renewCredentialsWithOptions:completion:", v6, v9);

}

- (MFAccount)account
{
  return self->_account;
}

- (MFAccount)alternateAccount
{
  return self->_alternateAccount;
}

- (MFError)error
{
  return self->_error;
}

- (MFNetworkController)networkController
{
  return self->_networkController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkController, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_alternateAccount, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
