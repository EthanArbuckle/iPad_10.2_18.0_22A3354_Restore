@implementation TPSBundleController

- (TPSBundleController)initWithParentListController:(id)a3
{
  id v4;
  TPSBundleController *v5;
  TPSTelephonyController *v6;
  TPSTelephonyController *telephonyController;
  void *v8;
  uint64_t v9;
  CTXPCServiceSubscriptionContext *subscriptionContext;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TPSBundleController;
  v5 = -[TPSBundleController initWithParentListController:](&v12, sel_initWithParentListController_, v4);
  if (v5)
  {
    v6 = objc_alloc_init(TPSTelephonyController);
    telephonyController = v5->_telephonyController;
    v5->_telephonyController = v6;

    objc_msgSend(v4, "specifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[TPSBundleController subscriptionContextForSpecifier:](v5, "subscriptionContextForSpecifier:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
      subscriptionContext = v5->_subscriptionContext;
      v5->_subscriptionContext = (CTXPCServiceSubscriptionContext *)v9;

    }
  }

  return v5;
}

- (BOOL)isHidden
{
  void *v2;
  BOOL v3;

  -[TPSBundleController supportedSubscriptions](self, "supportedSubscriptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

- (BOOL)isSubscriptionListHidden
{
  void *v2;
  BOOL v3;

  -[TPSBundleController subscriptionContext](self, "subscriptionContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (PSListController)parentListController
{
  return (PSListController *)objc_autoreleaseReturnValue(objc_loadWeakRetained((id *)((char *)&self->super.super.isa
                                                                                    + (int)*MEMORY[0x1E0D80560])));
}

- (NSOrderedSet)subscriptions
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v3 = -[TPSBundleController supportsDisabledSubscriptions](self, "supportsDisabledSubscriptions");
  -[TPSBundleController telephonyController](self, "telephonyController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "subscriptions");
  else
    objc_msgSend(v4, "activeSubscriptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[TPSBundleController subscriptionContext](self, "subscriptionContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(v7, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "predicateWithFormat:", CFSTR("uuid == %@"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "filteredOrderedSetUsingPredicate:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v12;
  }

  return (NSOrderedSet *)v6;
}

- (id)specifiersWithSpecifier:(id)a3
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id obj;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (-[TPSBundleController isHidden](self, "isHidden", a3))
    return 0;
  -[TPSBundleController specifiers](self, "specifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[TPSBundleController isSubscriptionListHidden](self, "isSubscriptionListHidden"))
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v29;
      v10 = *MEMORY[0x1E0D80930];
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v29 != v9)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          -[TPSBundleController subscriptionContext](self, "subscriptionContext");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setProperty:forKey:", v13, v10);

          -[TPSBundleController supportedSubscriptions](self, "supportedSubscriptions");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setProperty:forKey:", v14, CFSTR("TPSSpecifierSubscriptionsKey"));

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      }
      while (v8);
    }
    v15 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v15 = v5;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    obj = v15;
    if (v16)
    {
      v17 = v16;
      v27 = *(_QWORD *)v33;
      do
      {
        v18 = 0;
        v19 = v15;
        do
        {
          if (*(_QWORD *)v33 != v27)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v18);
          v21 = (void *)MEMORY[0x1E0D804E8];
          objc_msgSend(v20, "name");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v22, 0, 0, 0, objc_opt_class(), 2, 0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v23, "setProperty:forKey:", objc_msgSend(v20, "detailControllerClass"), CFSTR("TPSSpecifierSubscriptionDetailControllerKey"));
          -[TPSBundleController supportedSubscriptions](self, "supportedSubscriptions");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setProperty:forKey:", v24, CFSTR("TPSSpecifierSubscriptionsKey"));

          objc_msgSend(v20, "identifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setIdentifier:", v25);

          objc_msgSend(v6, "addObject:", v23);
          v15 = (id)objc_msgSend(v6, "copy");

          ++v18;
          v19 = v15;
        }
        while (v17 != v18);
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v17);
    }

  }
  return v15;
}

- (id)subscriptionContextForSpecifier:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  objc_msgSend(a3, "tps_subscriptionContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[TPSPreferences sharedInstance](TPSPreferences, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "showSubscriptionList");

    if ((v6 & 1) != 0)
    {
      v4 = 0;
    }
    else
    {
      -[TPSBundleController supportedSubscriptions](self, "supportedSubscriptions");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "count") == 1
        && (v8 = objc_msgSend(v7, "count"),
            -[TPSBundleController subscriptions](self, "subscriptions"),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            v10 = objc_msgSend(v9, "count"),
            v9,
            v8 == v10))
      {
        objc_msgSend(v7, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "context");
        v4 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v4 = 0;
      }

    }
  }
  return v4;
}

- (void)telephonyController:(id)a3 didChangeActiveSubscriptions:(id)a4
{
  NSObject *v4;
  uint8_t v5[16];

  TPSLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DB4B7000, v4, OS_LOG_TYPE_DEFAULT, "Active subscriptions have changed.", v5, 2u);
  }

}

- (void)telephonyController:(id)a3 didChangeSubscriptions:(id)a4
{
  NSObject *v4;
  uint8_t v5[16];

  TPSLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DB4B7000, v4, OS_LOG_TYPE_DEFAULT, "Subscriptions have changed.", v5, 2u);
  }

}

- (TPSTelephonyController)telephonyController
{
  return self->_telephonyController;
}

- (CTXPCServiceSubscriptionContext)subscriptionContext
{
  return self->_subscriptionContext;
}

- (void)setSubscriptionContext:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionContext, a3);
}

- (BOOL)supportsDisabledSubscriptions
{
  return self->_supportsDisabledSubscriptions;
}

- (NSArray)specifiers
{
  return self->_specifiers;
}

- (void)setSpecifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_storeStrong((id *)&self->_subscriptionContext, 0);
  objc_storeStrong((id *)&self->_telephonyController, 0);
}

@end
