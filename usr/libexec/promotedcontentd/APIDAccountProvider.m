@implementation APIDAccountProvider

+ (void)fetchGenderAndAgeData:(BOOL)a3 completionHandler:(id)a4
{
  void (**v4)(id, id);
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _BYTE *v25;
  _BYTE *v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  id v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  uint64_t v34;
  NSObject *v35;
  id v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  uint8_t buf[4];
  const __CFString *v47;
  __int16 v48;
  NSObject *v49;

  v4 = (void (**)(id, id))a4;
  v5 = objc_claimAutoreleasedReturnValue(+[APIDAccountProvider segmentData](APIDAccountProvider, "segmentData"));
  v6 = (void *)v5;
  v7 = CFSTR("nil");
  if (v5)
    v7 = (__CFString *)v5;
  v8 = v7;
  v9 = APLogForCategory(36);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138477827;
    v47 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Fetching segmentData.  segmentData = %{private}@", buf, 0xCu);
  }

  if (!v6)
  {
    v17 = 0;
    v18 = 0;
    v19 = -1;
    goto LABEL_45;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dataUsingEncoding:", 4));
  v45 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v11, 0, &v45));
  v13 = v45;

  v14 = v13;
  if (v13)
  {
    v15 = APLogForCategory(36);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "segmentData is not in JSON format. Unable to parse segmentData.", buf, 2u);
    }
    v17 = 0;
    v18 = 0;
    v19 = -1;
    goto LABEL_44;
  }
  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("it")));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", CFSTR("dm")));
  v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("13")));
  v43 = (void *)v20;
  if (v20)
  {
    v21 = (void *)v20;
    v22 = v12;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar calendarWithIdentifier:](NSCalendar, "calendarWithIdentifier:", NSCalendarIdentifierGregorian));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v41 = v23;
    v25 = objc_msgSend(v23, "component:fromDate:", 4, v24);

    v26 = objc_msgSend(v21, "integerValue");
    v19 = v25 - v26;
    if (v26)
    {
      v12 = v22;
      if ((uint64_t)v19 > 17)
      {
        if (v19 > 0x18)
        {
          if (v19 > 0x22)
          {
            if (v19 > 0x2C)
            {
              if (v19 > 0x36)
              {
                if (v19 > 0x40)
                  v27 = 10016;
                else
                  v27 = 10015;
              }
              else
              {
                v27 = 10014;
              }
            }
            else
            {
              v27 = 10013;
            }
          }
          else
          {
            v27 = 10012;
          }
        }
        else
        {
          v27 = 10011;
        }
      }
      else
      {
        v27 = 10010;
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v27));
    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 0));
      v12 = v22;
    }

  }
  else
  {
    v17 = 0;
    v19 = -1;
  }
  v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("18")));
  v29 = v28;
  if (v28)
  {
    v42 = v12;
    v30 = -[NSObject integerValue](v28, "integerValue");
    v31 = APLogForCategory(36);
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138478083;
      v47 = CFSTR("18");
      v48 = 2117;
      v49 = v29;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "userProvidedGenderString %{private}@ = %{sensitive}@", buf, 0x16u);
    }

    if (v30 == (id)1)
    {
      v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("17")));
      v34 = APLogForCategory(36);
      v35 = objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138478083;
        v47 = CFSTR("17");
        v48 = 2117;
        v49 = v33;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "genderGroupString %{private}@ = %{sensitive}@", buf, 0x16u);
      }

      if (v33)
      {
        v36 = objc_alloc_init((Class)NSNumberFormatter);
        objc_msgSend(v36, "setNumberStyle:", 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "numberFromString:", v33));

LABEL_42:
        v14 = 0;

        v12 = v42;
        goto LABEL_43;
      }
    }
    else
    {
      v37 = APLogForCategory(36);
      v33 = objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "Gender is not inferred and so we cannot provide gender to News", buf, 2u);
      }
    }
    v18 = 0;
    goto LABEL_42;
  }
  v18 = 0;
  v14 = 0;
LABEL_43:

LABEL_44:
LABEL_45:
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v38, "setValue:forKey:", v18, CFSTR("gender"));
  objc_msgSend(v38, "setValue:forKey:", v17, CFSTR("ageGroup"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v19));
  objc_msgSend(v38, "setValue:forKey:", v39, CFSTR("age"));

  v40 = objc_msgSend(v38, "copy");
  if (v4)
    v4[2](v4, v40);

}

+ (id)privateUserAccount
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "idAccount"));

  return v3;
}

+ (id)segmentData
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "accountSettings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "IDAccountsRecord"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("segmentData")));
  return v5;
}

+ (id)sharedInstance
{
  if (qword_1002695F8 != -1)
    dispatch_once(&qword_1002695F8, &stru_100213FF8);
  return (id)qword_1002695F0;
}

- (APIDAccountsSettings)accountSettings
{
  return (APIDAccountsSettings *)objc_getProperty(self, a2, 8, 1);
}

- (APIDAccount)idAccount
{
  return (APIDAccount *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIdAccount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BOOL)_loadIDAccounts
{
  APIDAccountsSettings *v3;
  APIDAccountsSettings *accountSettings;
  APIDAccountsSettings *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  APIDAccount *v20;
  uint64_t v22;
  NSObject *v23;
  id v24;
  uint64_t v25;
  uint8_t buf[4];
  void *v27;

  v3 = (APIDAccountsSettings *)objc_claimAutoreleasedReturnValue(+[APIDAccountsSettings settings](APIDAccountsSettings, "settings"));
  accountSettings = self->_accountSettings;
  self->_accountSettings = v3;

  v5 = self->_accountSettings;
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[APIDAccountsSettings IDAccountsRecord](self->_accountSettings, "IDAccountsRecord"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[APIDAccountsSettings storefront](self->_accountSettings, "storefront"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[APIDAccountsSettings monthlyIDResetCount](self->_accountSettings, "monthlyIDResetCount"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[APIDAccountsDefaultsSettings settings](APIDAccountsDefaultsSettings, "settings"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "storefrontOverride"));

    if (!+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall")|| !v10)
    {
LABEL_19:
      v20 = -[APIDAccount initWithIDAccountsRecord:storefront:monthlyIDResetCount:]([APIDAccount alloc], "initWithIDAccountsRecord:storefront:monthlyIDResetCount:", v6, v7, v8);
      -[APIDAccountProvider setIdAccount:](self, "setIdAccount:", v20);

      goto LABEL_20;
    }
    if ((unint64_t)objc_msgSend(v10, "length") < 6)
    {
      v15 = APLogForCategory(17);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Using override without modelnumber", buf, 2u);
      }

      v13 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v10, CFSTR("-1,30")));
    }
    else
    {
      if ((unint64_t)objc_msgSend(v10, "length") < 7)
      {
        if ((unint64_t)objc_msgSend(v7, "length") < 7)
          goto LABEL_16;
        v22 = APLogForCategory(17);
        v23 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Merging the storefronts into a new value.", buf, 2u);
        }

        v24 = v10;
        v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "substringFromIndex:", 6));
        v17 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v24, v25));

        v7 = (void *)v25;
LABEL_15:

        v7 = (void *)v17;
LABEL_16:
        v18 = APLogForCategory(17);
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138739971;
          v27 = v7;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "StorefrontOverridden as = %{sensitive}@", buf, 0xCu);
        }

        goto LABEL_19;
      }
      v11 = APLogForCategory(17);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Use the large specific full value for Override", buf, 2u);
      }

      v13 = v10;
    }
    v17 = (uint64_t)v13;
    goto LABEL_15;
  }
  v14 = APLogForCategory(17);
  v6 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Error reading from settings module.", buf, 2u);
  }
LABEL_20:

  return v5 != 0;
}

+ (id)userAccount
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "idAccount"));

  return v3;
}

- (APIDAccountProvider)init
{
  APIDAccountProvider *v2;
  APIDAccountProvider *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id accountChangedNotificationObject;
  APIDAccountProvider *v8;
  _QWORD v10[4];
  id v11;
  id location;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)APIDAccountProvider;
  v2 = -[APIDAccountProvider init](&v13, "init");
  v3 = v2;
  if (v2)
  {
    if (!-[APIDAccountProvider _loadIDAccounts](v2, "_loadIDAccounts"))
    {
      v8 = 0;
      goto LABEL_6;
    }
    objc_initWeak(&location, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
    v5 = kAPAccountChangedNotification;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000032E8;
    v10[3] = &unk_100213E80;
    objc_copyWeak(&v11, &location);
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "addObserverForName:object:queue:usingBlock:", v5, CFSTR("com.apple.AdLib"), 0, v10));
    accountChangedNotificationObject = v3->_accountChangedNotificationObject;
    v3->_accountChangedNotificationObject = (id)v6;

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  v8 = v3;
LABEL_6:

  return v8;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self->_accountChangedNotificationObject);

  v4.receiver = self;
  v4.super_class = (Class)APIDAccountProvider;
  -[APIDAccountProvider dealloc](&v4, "dealloc");
}

- (void)setAccountSettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (id)accountChangedNotificationObject
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setAccountChangedNotificationObject:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idAccount, 0);
  objc_storeStrong(&self->_accountChangedNotificationObject, 0);
  objc_storeStrong((id *)&self->_accountSettings, 0);
}

@end
