@implementation TransparencyAccount

+ (id)createAuthkitSession
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "bundleIdentifier"));

  v4 = objc_msgSend(objc_alloc((Class)AKAppleIDSession), "initWithIdentifier:", v3);
  return v4;
}

- (TransparencyAccount)init
{
  TransparencyAccount *v2;
  id v3;
  TransparencyAccount *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TransparencyAccount;
  v2 = -[TransparencyAccount init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init((Class)ACAccountStore);
    -[TransparencyAccount setStore:](v2, "setStore:", v3);

    -[TransparencyAccount setAccountsdRetryTimeout:](v2, "setAccountsdRetryTimeout:", 30.0);
    v4 = v2;
  }

  return v2;
}

- (unint64_t)accountLevel:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](AKAccountManager, "sharedInstance"));
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "altDSIDForAccount:", v3));
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "authKitAccountWithAltDSID:", v6));
      if (v7)
        v8 = objc_msgSend(v5, "securityLevelForAccount:", v7);
      else
        v8 = 0;

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return (unint64_t)v8;
}

+ (BOOL)isAccountsErrorRetryable:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
    if (objc_msgSend(v5, "isEqualToString:", NSCocoaErrorDomain))
      v6 = objc_msgSend(v4, "code") == (id)4097 || objc_msgSend(v4, "code") == (id)4099;
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)fetchAccountsRetryingWithTimeout:(double)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  int v12;
  NSObject *v13;
  void *v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  id *v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  id *v24;
  id v25;
  uint8_t buf[4];
  _BYTE v27[14];
  __int16 v28;
  void *v29;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dateByAddingTimeInterval:", a3));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyAccount store](self, "store"));
  v25 = 0;
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "aa_appleAccountsWithError:", &v25));
  v11 = v25;

  if (v10)
  {
    v12 = 0;
LABEL_3:
    if (qword_1002A7B58 != -1)
      dispatch_once(&qword_1002A7B58, &stru_10024BF68);
    v13 = qword_1002A7B60;
    if (os_log_type_enabled((os_log_t)qword_1002A7B60, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v27 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "TransparencyAccount found accounts after (%d) attempts", buf, 8u);
    }
    v10 = v10;
  }
  else
  {
    v24 = a4;
    v12 = 0;
    while (1)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      v16 = objc_msgSend(v8, "compare:", v15);

      if (v16 == (id)-1)
        break;
      if (v12 == 5 || !objc_msgSend((id)objc_opt_class(self, v17), "isAccountsErrorRetryable:", v11))
      {
        v20 = v24;
        if (qword_1002A7B58 != -1)
          dispatch_once(&qword_1002A7B58, &stru_10024BFC8);
        v21 = qword_1002A7B60;
        if (os_log_type_enabled((os_log_t)qword_1002A7B60, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v27 = v11;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "TransparencyAccount: Can't talk with accountsd: %@", buf, 0xCu);
        }
        if (v24)
        {
          v22 = objc_retainAutorelease(v11);
LABEL_31:
          *v20 = v22;
          goto LABEL_8;
        }
        goto LABEL_8;
      }
      if (qword_1002A7B58 != -1)
        dispatch_once(&qword_1002A7B58, &stru_10024BFA8);
      v18 = qword_1002A7B60;
      if (os_log_type_enabled((os_log_t)qword_1002A7B60, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v27 = v12;
        *(_WORD *)&v27[4] = 2112;
        *(_QWORD *)&v27[6] = v11;
        v28 = 2112;
        v29 = v8;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "TransparencyAccount retrying accountsd XPC, (%d, %@) timeout: %@", buf, 0x1Cu);
      }
      ++v12;

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyAccount store](self, "store"));
      v25 = 0;
      v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "aa_appleAccountsWithError:", &v25));
      v11 = v25;

      if (v10)
        goto LABEL_3;
    }
    if (qword_1002A7B58 != -1)
      dispatch_once(&qword_1002A7B58, &stru_10024BF88);
    v20 = v24;
    v23 = qword_1002A7B60;
    if (os_log_type_enabled((os_log_t)qword_1002A7B60, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v27 = v12;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "TransparencyAccount timed out, retry try: %d", buf, 8u);
    }
    if (v24)
    {
      v22 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", kTransparencyErrorAccount, -394, v11, CFSTR("Account framework timeout")));
      goto LABEL_31;
    }
  }
LABEL_8:

  return v10;
}

- (id)primaryAccount:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  id v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  uint8_t buf[4];
  id v27;
  _BYTE v28[128];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyAccount store](self, "store"));
  if (v5)
  {
    -[TransparencyAccount accountsdRetryTimeout](self, "accountsdRetryTimeout");
    v25 = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyAccount fetchAccountsRetryingWithTimeout:error:](self, "fetchAccountsRetryingWithTimeout:error:", &v25));
    v7 = v25;
    v8 = v7;
    if (v6)
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v9 = v6;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v22;
        v13 = AAAccountClassPrimary;
LABEL_5:
        v14 = 0;
        while (1)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v9);
          v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v14);
          if ((objc_msgSend(v15, "aa_isAccountClass:", v13, (_QWORD)v21) & 1) != 0)
            break;
          if (v11 == (id)++v14)
          {
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
            if (v11)
              goto LABEL_5;
            goto LABEL_11;
          }
        }
        v17 = v15;

        if (v17)
          goto LABEL_29;
      }
      else
      {
LABEL_11:

      }
      if (qword_1002A7B58 != -1)
        dispatch_once(&qword_1002A7B58, &stru_10024C008);
      v18 = qword_1002A7B60;
      if (os_log_type_enabled((os_log_t)qword_1002A7B60, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v9;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "No primary AppleAccount found: %@", buf, 0xCu);
      }
      if (a3)
      {
        v19 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:underlyingError:description:](TransparencyError, "errorWithDomain:code:underlyingError:description:", kTransparencyErrorAccount, -117, v8, CFSTR("No primary AppleAccount found")));
LABEL_27:
        v17 = 0;
        *a3 = v19;
LABEL_29:

        goto LABEL_30;
      }
    }
    else if (a3)
    {
      v19 = objc_retainAutorelease(v7);
      goto LABEL_27;
    }
    v17 = 0;
    goto LABEL_29;
  }
  if (qword_1002A7B58 != -1)
    dispatch_once(&qword_1002A7B58, &stru_10024BFE8);
  v16 = qword_1002A7B60;
  if (os_log_type_enabled((os_log_t)qword_1002A7B60, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "No ACAccountStore found", buf, 2u);
  }
  v17 = 0;
  if (a3)
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorAccount, -116, CFSTR("No account store found")));
LABEL_30:

  return v17;
}

- (id)cloudKitAccount:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "childAccountsWithAccountTypeIdentifier:", ACAccountTypeIdentifierCloudKit));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));

  return v4;
}

+ (id)sharedManager
{
  if (qword_1002A7B70 != -1)
    dispatch_once(&qword_1002A7B70, &stru_10024C028);
  return (id)qword_1002A7B68;
}

+ (id)sharedAccountStore
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAccount sharedManager](TransparencyAccount, "sharedManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "store"));

  return v3;
}

+ (void)startMetrics:(id)a3 idsAccountTracker:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  double v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];

  v5 = a3;
  v6 = a4;
  if (qword_1002A7B58 != -1)
    dispatch_once(&qword_1002A7B58, &stru_10024C048);
  v7 = qword_1002A7B60;
  if (os_log_type_enabled((os_log_t)qword_1002A7B60, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "TransparencyAccount startMetrics", buf, 2u);
  }
  v8 = SFAnalyticsSamplerIntervalOncePerReport;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001986DC;
  v10[3] = &unk_10024C090;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v5, "addMultiSamplerForName:withTimeInterval:block:", CFSTR("TransparencyAccountMultiSampler"), v10, v8);

}

+ (int64_t)accountLevelErrorCodeForLevel:(id)a3
{
  char *v3;

  v3 = (char *)objc_msgSend(a3, "unsignedIntegerValue");
  if ((unint64_t)(v3 - 1) >= 5)
    return -153;
  else
    return -153 - (_QWORD)v3;
}

+ (id)createAuthToken:(id)a3 authToken:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init((Class)NSMutableString);
  objc_msgSend(v7, "appendString:", v6);

  objc_msgSend(v7, "appendString:", CFSTR(":"));
  objc_msgSend(v7, "appendString:", v5);

  v8 = objc_alloc_init((Class)NSMutableString);
  objc_msgSend(v8, "appendString:", CFSTR("X-MobileMe-AuthToken "));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dataUsingEncoding:", 4));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "base64EncodedStringWithOptions:", 0));
  objc_msgSend(v8, "appendString:", v10);

  return v8;
}

+ (unint64_t)accountLevel:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAccount sharedManager](TransparencyAccount, "sharedManager"));
  v5 = objc_msgSend(v4, "accountLevel:", v3);

  return (unint64_t)v5;
}

+ (BOOL)eligibleForOptIn
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAccount primaryAccount:](TransparencyAccount, "primaryAccount:", 0));
  if (v2)
    v3 = (id)+[TransparencyAccount accountLevel:](TransparencyAccount, "accountLevel:", v2) == (id)4;
  else
    v3 = 0;

  return v3;
}

- (BOOL)eligibleForOptIn:(id)a3
{
  return (id)+[TransparencyAccount accountLevel:](TransparencyAccount, "accountLevel:", a3) == (id)4;
}

- (int64_t)ktAccountStatus:(id)a3 idsAccountsTracker:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int64_t v16;
  int v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  id v25;
  uint8_t buf[4];
  id v27;

  v8 = a3;
  v9 = a4;
  if (v8)
  {
LABEL_4:
    v12 = -[TransparencyAccount accountLevel:](self, "accountLevel:", v8);
    if (v12 == 4)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "aa_personID"));
      if (v13)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyAccount cloudKitAccount:](self, "cloudKitAccount:", v8));
        if (v14)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "messagesStatus"));

          if (v15)
          {
            if ((objc_msgSend(v9, "haveIDSAccount:", v13) & 1) != 0)
            {
              v16 = 0;
            }
            else
            {
              if (qword_1002A7B58 != -1)
                dispatch_once(&qword_1002A7B58, &stru_10024C150);
              v23 = qword_1002A7B60;
              if (os_log_type_enabled((os_log_t)qword_1002A7B60, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "TransparencyAccount ids and CK doesn't match", buf, 2u);
              }
              v16 = 5;
            }
          }
          else
          {
            if (qword_1002A7B58 != -1)
              dispatch_once(&qword_1002A7B58, &stru_10024C130);
            v22 = qword_1002A7B60;
            if (os_log_type_enabled((os_log_t)qword_1002A7B60, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "TransparencyAccount no IDS account", buf, 2u);
            }
            v16 = 4;
          }
        }
        else
        {
          if (qword_1002A7B58 != -1)
            dispatch_once(&qword_1002A7B58, &stru_10024C110);
          v21 = qword_1002A7B60;
          if (os_log_type_enabled((os_log_t)qword_1002A7B60, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v27 = v8;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "TransparencyAccount no cloudkit account: %@", buf, 0xCu);
          }
          v16 = 3;
        }

      }
      else
      {
        if (qword_1002A7B58 != -1)
          dispatch_once(&qword_1002A7B58, &stru_10024C0F0);
        v19 = qword_1002A7B60;
        if (os_log_type_enabled((os_log_t)qword_1002A7B60, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v27 = v8;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "TransparencyAccount no account dsid: %@", buf, 0xCu);
        }
        v16 = 2;
      }

    }
    else
    {
      v17 = v12;
      if (qword_1002A7B58 != -1)
        dispatch_once(&qword_1002A7B58, &stru_10024C0D0);
      v18 = qword_1002A7B60;
      if (os_log_type_enabled((os_log_t)qword_1002A7B60, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v27) = v17;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "TransparencyAccount level not HSA2: %d", buf, 8u);
      }
      v16 = 2;
    }
    goto LABEL_44;
  }
  v25 = 0;
  v10 = objc_claimAutoreleasedReturnValue(-[TransparencyAccount primaryAccount:](self, "primaryAccount:", &v25));
  v11 = v25;
  v8 = v11;
  if (v10)
  {

    v8 = (id)v10;
    goto LABEL_4;
  }
  if (qword_1002A7B58 != -1)
    dispatch_once(&qword_1002A7B58, &stru_10024C0B0);
  v20 = qword_1002A7B60;
  if (os_log_type_enabled((os_log_t)qword_1002A7B60, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v8;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "TransparencyAccount no default: %@", buf, 0xCu);
  }
  if (a5)
  {
    v8 = objc_retainAutorelease(v8);
    *a5 = v8;
  }
  v16 = 1;
LABEL_44:

  return v16;
}

+ (id)primaryAccount:(id *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "primaryAccount:", a3));

  return v5;
}

+ (id)cloudKitAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cloudKitAccount:", v4));

  return v6;
}

+ (id)authToken:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  int64_t v29;
  void *v30;
  void *v31;
  uint64_t v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAccount primaryAccount:](TransparencyAccount, "primaryAccount:"));
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "credential"));
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "aa_personID"));
      if (v7)
      {
        v8 = +[TransparencyAccount accountLevel:](TransparencyAccount, "accountLevel:", v5);
        if (qword_1002A7B58 != -1)
          dispatch_once(&qword_1002A7B58, &stru_10024C1B0);
        v9 = (void *)qword_1002A7B60;
        if (os_log_type_enabled((os_log_t)qword_1002A7B60, OS_LOG_TYPE_INFO))
        {
          v10 = v9;
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v8));
          *(_DWORD *)buf = 138412290;
          v35 = v11;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Obtaining credential from account of security level %@", buf, 0xCu);

        }
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "credentialItemForKey:", ACKeyTransparencyTokenKey));
        if (v12)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAccount createAuthToken:authToken:](TransparencyAccount, "createAuthToken:authToken:", v7, v12));
          if (qword_1002A7B58 != -1)
            dispatch_once(&qword_1002A7B58, &stru_10024C1F0);
          v14 = qword_1002A7B60;
          if (os_log_type_enabled((os_log_t)qword_1002A7B60, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v35 = v13;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Authorization token: %@", buf, 0xCu);
          }
        }
        else
        {
          if (qword_1002A7B58 != -1)
            dispatch_once(&qword_1002A7B58, &stru_10024C1D0);
          v24 = (void *)qword_1002A7B60;
          if (os_log_type_enabled((os_log_t)qword_1002A7B60, OS_LOG_TYPE_ERROR))
          {
            v25 = v24;
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "username"));
            v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v8));
            *(_DWORD *)buf = 138412802;
            v35 = v26;
            v36 = 2112;
            v37 = v27;
            v38 = 2112;
            v39 = v7;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Account %@ of level %@ does not have KeyTransparencyToken(%@)", buf, 0x20u);

          }
          if (a3)
          {
            v33 = kTransparencyErrorAccount;
            v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v8));
            v29 = +[TransparencyAccount accountLevelErrorCodeForLevel:](TransparencyAccount, "accountLevelErrorCodeForLevel:", v28);
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "username"));
            v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v8));
            *a3 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", v33, v29, CFSTR("Account %@ of level %@ does not have KeyTransparencyToken(%@)"), v30, v31, v7));

          }
          v13 = 0;
        }
      }
      else
      {
        if (qword_1002A7B58 != -1)
          dispatch_once(&qword_1002A7B58, &stru_10024C190);
        v20 = (void *)qword_1002A7B60;
        if (os_log_type_enabled((os_log_t)qword_1002A7B60, OS_LOG_TYPE_ERROR))
        {
          v21 = v20;
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "username"));
          *(_DWORD *)buf = 138412546;
          v35 = v22;
          v36 = 2112;
          v37 = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Account %@ does not have personId(%@)", buf, 0x16u);

        }
        if (!a3)
        {
          v13 = 0;
          goto LABEL_34;
        }
        v23 = kTransparencyErrorAccount;
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "username"));
        v13 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", v23, -152, CFSTR("Account %@ does not have personId(%@)"), v12, 0));
      }

    }
    else
    {
      if (qword_1002A7B58 != -1)
        dispatch_once(&qword_1002A7B58, &stru_10024C170);
      v15 = (void *)qword_1002A7B60;
      if (os_log_type_enabled((os_log_t)qword_1002A7B60, OS_LOG_TYPE_ERROR))
      {
        v16 = v15;
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "username"));
        *(_DWORD *)buf = 138412290;
        v35 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Account %@ missing credentials", buf, 0xCu);

      }
      if (!a3)
      {
        v13 = 0;
        goto LABEL_35;
      }
      v18 = kTransparencyErrorAccount;
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "username"));
      v19 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", v18, -118, CFSTR("Account %@ missing credentials"), v7));
      v13 = 0;
      *a3 = v19;
    }
LABEL_34:

LABEL_35:
    goto LABEL_36;
  }
  v13 = 0;
LABEL_36:

  return v13;
}

+ (BOOL)initiateCredentialRenewal:(id *)a3 completionHandler:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD v11[4];
  id v12;
  uint8_t buf[8];
  _QWORD v14[2];
  _QWORD v15[2];

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAccount primaryAccount:](TransparencyAccount, "primaryAccount:", a3));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAccount sharedAccountStore](TransparencyAccount, "sharedAccountStore"));
    v14[0] = kACRenewCredentialsShouldAvoidUIKey;
    v14[1] = kACRenewCredentialsShouldForceKey;
    v15[0] = &__kCFBooleanTrue;
    v15[1] = &__kCFBooleanFalse;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 2));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100199A34;
    v11[3] = &unk_10024C298;
    v12 = v5;
    objc_msgSend(v7, "renewCredentialsForAccount:options:completion:", v6, v8, v11);

  }
  else
  {
    if (qword_1002A7B58 != -1)
      dispatch_once(&qword_1002A7B58, &stru_10024C210);
    v9 = qword_1002A7B60;
    if (os_log_type_enabled((os_log_t)qword_1002A7B60, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Unable to renew credentials -- no primary account", buf, 2u);
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorAccount, -117, CFSTR("Account credential renewal failed -- no account")));
    (*((void (**)(id, void *))v5 + 2))(v5, v7);
  }

  return v6 != 0;
}

- (ACAccountStore)store
{
  return (ACAccountStore *)objc_getProperty(self, a2, 8, 1);
}

- (void)setStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (double)accountsdRetryTimeout
{
  return self->_accountsdRetryTimeout;
}

- (void)setAccountsdRetryTimeout:(double)a3
{
  self->_accountsdRetryTimeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
}

@end
