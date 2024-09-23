@implementation FMFAddressBook

+ (id)sharedAddressBook
{
  if (qword_1000B3718 != -1)
    dispatch_once(&qword_1000B3718, &stru_100099D08);
  return (id)qword_1000B3710;
}

- (BOOL)abPrefersNickname
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactsUserDefaults sharedDefaults](CNContactsUserDefaults, "sharedDefaults"));
  v3 = objc_msgSend(v2, "shortNameFormatPrefersNicknames");

  return v3;
}

- (void)contactStoreDidChange
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("ContactStoreDidChange"), 0);

}

- (void)addressBookPreferencesDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = sub_100011D0C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "addressBookPreferencesDidChange!", v6, 2u);
  }

  -[FMFAddressBook resetABPreferencesCachesInSession](self, "resetABPreferencesCachesInSession");
}

- (void)resetABPreferencesCachesInSession
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  FMFAddressBook *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[8];
  _BYTE v19[128];

  v3 = sub_100011D0C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Resetting cached abPreferences in session", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMFXPCSessionManager sharedInstance](FMFXPCSessionManager, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "clientSessions"));
  v7 = objc_msgSend(v6, "copy");

  v8 = self;
  objc_sync_enter(v8);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v12), "clientProxy", (_QWORD)v14));
        objc_msgSend(v13, "abPreferencesDidChange");

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v10);
  }

  objc_sync_exit(v8);
}

- (void)resetABCachesInSession
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  FMFAddressBook *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[8];
  _BYTE v19[128];

  v3 = sub_100011D0C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Resetting cached address book in session", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMFXPCSessionManager sharedInstance](FMFXPCSessionManager, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "clientSessions"));
  v7 = objc_msgSend(v6, "copy");

  v8 = self;
  objc_sync_enter(v8);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v12), "clientProxy", (_QWORD)v14));
        objc_msgSend(v13, "abDidChange");

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v10);
  }

  objc_sync_exit(v8);
}

- (void)addressBookDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = sub_100011D0C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "addressBookDidChange!", v6, 2u);
  }

  -[FMFAddressBook resetABCachesInSession](self, "resetABCachesInSession");
}

- (id)prettyGivenNameForHandle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMFContactUtility sharedInstance](FMFContactUtility, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactFormatter descriptorForRequiredKeysForStyle:](CNContactFormatter, "descriptorForRequiredKeysForStyle:", 0));
  v11 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getContactForHandle:keysToFetch:", v3, v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMFContactUtility sharedInstance](FMFContactUtility, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "shortDisplayNameForContact:andHandle:", v7, v3));

  return v9;
}

- (id)prettyNameForHandle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMFContactUtility sharedInstance](FMFContactUtility, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactFormatter descriptorForRequiredKeysForStyle:](CNContactFormatter, "descriptorForRequiredKeysForStyle:", 0));
  v11 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getContactForHandle:keysToFetch:", v3, v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMFContactUtility sharedInstance](FMFContactUtility, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "displayNameForContact:andHandle:", v7, v3));

  return v9;
}

- (void)setAbPrefersNickname:(BOOL)a3
{
  self->_abPrefersNickname = a3;
}

@end
