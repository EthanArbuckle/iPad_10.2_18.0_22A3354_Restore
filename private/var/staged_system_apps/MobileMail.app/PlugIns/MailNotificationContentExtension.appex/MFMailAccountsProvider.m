@implementation MFMailAccountsProvider

- (MFMailAccountsProvider)init
{
  MFMailAccountsProvider *v2;
  MFMailAccountsProvider *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MFMailAccountsProvider;
  v2 = -[MFMailAccountsProvider init](&v5, "init");
  v3 = v2;
  if (v2)
    -[MFMailAccountsProvider _registerNotifications](v2, "_registerNotifications");
  return v3;
}

- (BOOL)hasActiveAccounts
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailAccountsProvider displayedAccounts](self, "displayedAccounts"));
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (NSArray)receivingAddresses
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailAccountsProvider mailAccounts](self, "mailAccounts"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "ef_map:", &stru_100038D78));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ef_flatten"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ef_filter:", EFIsNotNull));

  return (NSArray *)v5;
}

- (id)reloadWithMailAccounts:(id)a3 currentFocus:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  MFMailAccountsProvider *v10;
  id v11;
  id v12;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100010678;
  v9[3] = &unk_100038E08;
  v10 = self;
  v11 = a3;
  v12 = a4;
  v5 = v12;
  v6 = v11;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailAccountsProvider _executeChange:](v10, "_executeChange:", v9));

  return v7;
}

- (id)legacyMailAccountForObjectID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "representedObjectID"));
  v6 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailAccountsProvider mailAccounts](self, "mailAccounts"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000109D8;
    v10[3] = &unk_100038DA0;
    v11 = v5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ef_firstObjectPassingTest:", v10));

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_accountsOrderDidChange:(id)a3
{
  -[MFMailAccountsProvider setOrderedAccounts:](self, "setOrderedAccounts:", 0);
}

- (id)_executeChange:(id)a3
{
  void (**v5)(_QWORD);
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  char *v11;
  id v12;
  id v13;
  char *v14;
  void *v15;
  void *v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  char *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  char *v25;

  v5 = (void (**)(_QWORD))a3;
  if (!v5)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFMailAccountsProvider.m"), 122, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("changeBlock"));

  }
  v6 = -[MFMailAccountsProviderState initFromProvider:]([MFMailAccountsProviderState alloc], "initFromProvider:", self);
  v5[2](v5);
  v7 = -[MFMailAccountsProviderState initFromProvider:]([MFMailAccountsProviderState alloc], "initFromProvider:", self);
  v8 = MFLogGeneral(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = objc_msgSend(v7, "numberOfActiveAccounts");
    v11 = (char *)objc_msgSend(v7, "numberOfActiveAccounts");
    v12 = objc_msgSend(v7, "numberOfInactiveAccounts");
    v13 = objc_msgSend(v6, "numberOfActiveAccounts");
    v14 = (char *)objc_msgSend(v6, "numberOfActiveAccounts");
    *(_DWORD *)buf = 134218752;
    v19 = v10;
    v20 = 2048;
    v21 = &v11[(_QWORD)v12];
    v22 = 2048;
    v23 = v13;
    v24 = 2048;
    v25 = &v14[(_QWORD)objc_msgSend(v6, "numberOfInactiveAccounts")];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "After reloading accounts: %lu/%lu active mail accounts (previously %lu/%lu)", buf, 0x2Au);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[EFPair pairWithFirst:second:](EFPair, "pairWithFirst:second:", v6, v7));
  return v15;
}

- (id)_activeNonLocalAccountsWithMailAccounts:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v14 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v14;
  v6 = 0;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    v9 = kAccountDataclassMail;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v10);
        v12 = objc_opt_class(LocalAccount);
        if ((objc_opt_isKindOfClass(v11, v12) & 1) == 0)
        {
          if (objc_msgSend(v11, "isEnabledForDataclass:", v9))
            objc_msgSend(v4, "addObject:", v11);
          else
            ++v6;
        }
        v10 = (char *)v10 + 1;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  -[MFMailAccountsProvider setNumberOfActiveAccounts:](self, "setNumberOfActiveAccounts:", objc_msgSend(v4, "count"));
  -[MFMailAccountsProvider setNumberOfInactiveAccounts:](self, "setNumberOfInactiveAccounts:", v6);

  return v4;
}

- (id)_displayedAccountsIdentifiers
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailAccountsProvider displayedAccounts](self, "displayedAccounts"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "ef_compactMap:", &stru_100038E48));
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
  v6 = v5;

  return v6;
}

- (id)_focusedAccountsIdentifiers
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailAccountsProvider focusedAccounts](self, "focusedAccounts"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "ef_compactMap:", &stru_100038E68));

  return v3;
}

- (BOOL)isDisplayingMultipleAccounts
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailAccountsProvider displayedAccounts](self, "displayedAccounts"));
  v3 = (unint64_t)objc_msgSend(v2, "count") > 1;

  return v3;
}

- (NSArray)orderedAccounts
{
  NSArray *orderedAccounts;
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSArray *v9;
  NSArray *v10;
  void *v12;

  if (pthread_main_np() != 1)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFMailAccountsProvider.m"), 175, CFSTR("Current thread must be main"));

  }
  orderedAccounts = self->_orderedAccounts;
  if (!orderedAccounts)
  {
    v5 = objc_alloc((Class)NSMutableArray);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailAccountsProvider displayedAccounts](self, "displayedAccounts"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allObjects"));
    v8 = objc_msgSend(v5, "initWithArray:", v7);

    v9 = (NSArray *)objc_msgSend(v8, "copy");
    v10 = self->_orderedAccounts;
    self->_orderedAccounts = v9;

    orderedAccounts = self->_orderedAccounts;
  }
  return orderedAccounts;
}

- (NSSet)autofetchAccounts
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFMailAccountsProvider displayedAccounts](self, "displayedAccounts"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "ef_filter:", &stru_100038E88));

  return (NSSet *)v3;
}

- (NSArray)mailAccounts
{
  return self->_mailAccounts;
}

- (void)setMailAccounts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSSet)displayedAccounts
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDisplayedAccounts:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void)setOrderedAccounts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSSet)focusedAccounts
{
  return self->_focusedAccounts;
}

- (void)setFocusedAccounts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)numberOfActiveAccounts
{
  return self->_numberOfActiveAccounts;
}

- (void)setNumberOfActiveAccounts:(unint64_t)a3
{
  self->_numberOfActiveAccounts = a3;
}

- (unint64_t)numberOfInactiveAccounts
{
  return self->_numberOfInactiveAccounts;
}

- (void)setNumberOfInactiveAccounts:(unint64_t)a3
{
  self->_numberOfInactiveAccounts = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusedAccounts, 0);
  objc_storeStrong((id *)&self->_orderedAccounts, 0);
  objc_storeStrong((id *)&self->_displayedAccounts, 0);
  objc_storeStrong((id *)&self->_mailAccounts, 0);
}

@end
