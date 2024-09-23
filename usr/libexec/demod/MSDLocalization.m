@implementation MSDLocalization

+ (id)sharedInstance
{
  if (qword_100175478 != -1)
    dispatch_once(&qword_100175478, &stru_10013F248);
  return (id)qword_100175470;
}

- (MSDLocalization)init
{
  MSDLocalization *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSDictionary *v7;
  void *v8;
  void *v9;
  NSDictionary *v10;
  NSDictionary *localizationTable;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  MSDLocalization *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)MSDLocalization;
  v2 = -[MSDLocalization init](&v23, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", CFSTR("/Applications/StoreDemoViewService.app")));
    v4 = v3;
    if (v3)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizations"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale preferredLanguages](NSLocale, "preferredLanguages"));
      v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSBundle preferredLocalizationsFromArray:forPreferences:](NSBundle, "preferredLocalizationsFromArray:forPreferences:", v5, v6));

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", 0));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pathForResource:ofType:inDirectory:forLocalization:", CFSTR("Localizable"), CFSTR("strings"), CFSTR("."), v8));

      v10 = (NSDictionary *)objc_msgSend(objc_alloc((Class)NSDictionary), "initWithContentsOfFile:", v9);
      localizationTable = v2->_localizationTable;
      v2->_localizationTable = v10;

    }
    else
    {
      v12 = sub_1000604F0();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_1000C4520(v13, v14, v15, v16, v17, v18, v19, v20);

      v7 = v2->_localizationTable;
      v2->_localizationTable = 0;
    }

    v21 = v2;
  }

  return v2;
}

- (id)localizedStringWithKey:(id)a3 defaultString:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  int v17;
  id v18;
  __int16 v19;
  void *v20;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDLocalization localizationTable](self, "localizationTable"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDLocalization localizationTable](self, "localizationTable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v6));

    v11 = v10;
    if (!v10)
    {
      v12 = sub_1000604F0();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale preferredLanguages](NSLocale, "preferredLanguages"));
        v17 = 138543618;
        v18 = v6;
        v19 = 2114;
        v20 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Localization lookup failed for key %{public}@, preferred languages %{public}@", (uint8_t *)&v17, 0x16u);

      }
      v11 = v7;
    }
    v15 = v11;

  }
  else
  {
    v15 = v7;
  }

  return v15;
}

+ (id)getLocalizedOwnershipWarnings:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;

  v3 = a3;
  v4 = sub_1000604F0();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "+[MSDLocalization getLocalizedOwnershipWarnings:]";
    v14 = 2114;
    v15 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s - ownershipWarningFlag:  %{public}@", buf, 0x16u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100077E34;
  block[3] = &unk_10013D868;
  v11 = v3;
  v6 = qword_100175488;
  v7 = v3;
  if (v6 != -1)
    dispatch_once(&qword_100175488, block);
  v8 = (id)qword_100175480;

  return v8;
}

+ (void)fillInMissingLocales:(id)a3 withOwnershipWarningMsg:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v5 = a3;
  v6 = a4;
  if (qword_100175498 != -1)
    dispatch_once(&qword_100175498, &stru_10013F268);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = (id)qword_100175490;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v12, (_QWORD)v14));

        if (!v13)
          objc_msgSend(v5, "setObject:forKey:", v6, v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

}

+ (BOOL)getWarningKeys:(id *)a3 andPlaceHolderWarnings:(id *)a4 forOwnershipWarningFlag:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  BOOL v11;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;

  v7 = a5;
  *a3 = 0;
  *a4 = 0;
  v8 = (void *)MGGetStringAnswer(CFSTR("DeviceClass"));
  v9 = v8;
  if (!v8)
  {
    v13 = sub_1000604F0();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1000C4710(v14, v15, v16, v17, v18, v19, v20, v21);
    goto LABEL_19;
  }
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("iPhone")) & 1) == 0
    && (objc_msgSend(v9, "isEqualToString:", CFSTR("iPad")) & 1) == 0
    && (objc_msgSend(v9, "isEqualToString:", CFSTR("iPod")) & 1) == 0
    && (objc_msgSend(v9, "isEqualToString:", CFSTR("Watch")) & 1) == 0)
  {
    v23 = sub_1000604F0();
    v14 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1000C47EC();
    goto LABEL_19;
  }
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("2")) & 1) == 0
    && (objc_msgSend(v7, "isEqualToString:", CFSTR("1")) & 1) == 0)
  {
    v22 = sub_1000604F0();
    v14 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1000C4780();
LABEL_19:

    v11 = 0;
    goto LABEL_12;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("2")))
    v10 = +[MSDLocalization getChannelWarningKeys:andPlaceHolderWarnings:forDeviceClass:](MSDLocalization, "getChannelWarningKeys:andPlaceHolderWarnings:forDeviceClass:", a3, a4, v9);
  else
    v10 = +[MSDLocalization getRetailWarningKeys:andPlaceHolderWarnings:forDeviceClass:](MSDLocalization, "getRetailWarningKeys:andPlaceHolderWarnings:forDeviceClass:", a3, a4, v9);
  v11 = v10;
LABEL_12:

  return v11;
}

+ (BOOL)getChannelWarningKeys:(id *)a3 andPlaceHolderWarnings:(id *)a4 forDeviceClass:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;

  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v9 = kMMSDPropertyClaimTitleKey;
  objc_msgSend(v8, "setObject:forKey:", CFSTR("PropertyClaimTitle_Channel"), kMMSDPropertyClaimTitleKey);
  v10 = kMMSDPropertyClaimLinkKey;
  objc_msgSend(v8, "setObject:forKey:", CFSTR("PropertyClaimLink_Channel"), kMMSDPropertyClaimLinkKey);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v11, "setObject:forKey:", CFSTR("Property of Apple Authorized Reseller"), v9);
  objc_msgSend(v11, "setObject:forKey:", &stru_100141020, v10);
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("iPhone")))
  {
    v12 = kMMSDPropertyClaimBodyKey;
    objc_msgSend(v8, "setObject:forKey:", CFSTR("PropertyClaimBody_iPhone_Channel"), kMMSDPropertyClaimBodyKey);
    v13 = CFSTR("This iPhone cannot be used and is not for sale.");
LABEL_9:
    objc_msgSend(v11, "setObject:forKey:", v13, v12);
    goto LABEL_10;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("iPad")))
  {
    v12 = kMMSDPropertyClaimBodyKey;
    objc_msgSend(v8, "setObject:forKey:", CFSTR("PropertyClaimBody_iPad_Channel"), kMMSDPropertyClaimBodyKey);
    v13 = CFSTR("This iPad cannot be used and is not for sale.");
    goto LABEL_9;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("iPod")))
  {
    v12 = kMMSDPropertyClaimBodyKey;
    objc_msgSend(v8, "setObject:forKey:", CFSTR("PropertyClaimBody_iPod_Channel"), kMMSDPropertyClaimBodyKey);
    v13 = CFSTR("This iPod cannot be used and is not for sale.");
    goto LABEL_9;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("Watch")))
  {
    v12 = kMMSDPropertyClaimBodyKey;
    objc_msgSend(v8, "setObject:forKey:", CFSTR("PropertyClaimBody_AppleWatch_Channel"), kMMSDPropertyClaimBodyKey);
    v13 = CFSTR("This Apple Watch cannot be used and is not for sale.");
    goto LABEL_9;
  }
LABEL_10:
  *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v8));
  *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v11));

  return 1;
}

+ (BOOL)getRetailWarningKeys:(id *)a3 andPlaceHolderWarnings:(id *)a4 forDeviceClass:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;

  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v9 = kMMSDPropertyClaimTitleKey;
  objc_msgSend(v8, "setObject:forKey:", CFSTR("PropertyClaimTitle_Retail"), kMMSDPropertyClaimTitleKey);
  v10 = kMMSDPropertyClaimLinkKey;
  objc_msgSend(v8, "setObject:forKey:", CFSTR("PropertyClaimLink_Retail"), kMMSDPropertyClaimLinkKey);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v11, "setObject:forKey:", CFSTR("Property of Apple"), v9);
  objc_msgSend(v11, "setObject:forKey:", CFSTR("apple.com/retail"), v10);
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("iPhone")))
  {
    v12 = kMMSDPropertyClaimBodyKey;
    objc_msgSend(v8, "setObject:forKey:", CFSTR("PropertyClaimBody_iPhone_Retail"), kMMSDPropertyClaimBodyKey);
    v13 = CFSTR("This iPhone cannot be used and is not for sale.  Return it to a nearby Apple retail location.");
LABEL_9:
    objc_msgSend(v11, "setObject:forKey:", v13, v12);
    goto LABEL_10;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("iPad")))
  {
    v12 = kMMSDPropertyClaimBodyKey;
    objc_msgSend(v8, "setObject:forKey:", CFSTR("PropertyClaimBody_iPad_Retail"), kMMSDPropertyClaimBodyKey);
    v13 = CFSTR("This iPad cannot be used and is not for sale.  Return it to a nearby Apple retail location.");
    goto LABEL_9;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("iPod")))
  {
    v12 = kMMSDPropertyClaimBodyKey;
    objc_msgSend(v8, "setObject:forKey:", CFSTR("PropertyClaimBody_iPod_Retail"), kMMSDPropertyClaimBodyKey);
    v13 = CFSTR("This iPod cannot be used and is not for sale.  Return it to a nearby Apple retail location.");
    goto LABEL_9;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("Watch")))
  {
    v12 = kMMSDPropertyClaimBodyKey;
    objc_msgSend(v8, "setObject:forKey:", CFSTR("PropertyClaimBody_AppleWatch_Retail"), kMMSDPropertyClaimBodyKey);
    v13 = CFSTR("This Apple Watch cannot be used and is not for sale.  Return it to a nearby Apple retail location.");
    goto LABEL_9;
  }
LABEL_10:
  *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v8));
  *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v11));

  return 1;
}

- (NSDictionary)localizationTable
{
  return self->_localizationTable;
}

- (void)setLocalizationTable:(id)a3
{
  objc_storeStrong((id *)&self->_localizationTable, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizationTable, 0);
}

@end
