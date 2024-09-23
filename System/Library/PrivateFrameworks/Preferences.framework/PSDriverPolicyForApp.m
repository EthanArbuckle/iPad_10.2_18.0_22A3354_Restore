@implementation PSDriverPolicyForApp

- (PSDriverPolicyForApp)initWithBundleIdentifier:(id)a3
{
  id v4;
  PSDriverPolicyForApp *v5;
  PSDriverPolicyForApp *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PSDriverPolicyForApp;
  v5 = -[PSDriverPolicyForApp init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    -[PSDriverPolicyForApp setBundleIdentifier:](v5, "setBundleIdentifier:", v4);
    objc_msgSend(getDriverManagerClass(), "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:", v6);

    objc_msgSend(getDriverManagerClass(), "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "refresh");

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(getDriverManagerClass(), "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PSDriverPolicyForApp;
  -[PSDriverPolicyForApp dealloc](&v4, sel_dealloc);
}

- (id)valueForSpecifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "driverIsApproved"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setValue:(id)a3 forSpecifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;

  v6 = a3;
  objc_msgSend(a4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && (objc_msgSend(v7, "updatePending") & 1) == 0)
  {
    if (objc_msgSend(v8, "driverIsApproved"))
    {
      objc_msgSend(getDriverManagerClass(), "sharedManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setDriverState:approved:", v8, objc_msgSend(v6, "BOOLValue"));

    }
    else if (objc_msgSend(v6, "BOOLValue"))
    {
      v10 = (void *)MEMORY[0x1E0CEA2E8];
      v11 = (void *)MEMORY[0x1E0CB3940];
      PS_LocalizedStringForDriverPolicy(CFSTR("CONFIRMATION_DIALOG_TITLE"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "displayName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "usageText");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "alertControllerWithTitle:message:preferredStyle:", v14, v15, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = (void *)MEMORY[0x1E0CEA2E0];
      PS_LocalizedStringForDriverPolicy(CFSTR("CONFIRMATION_DIALOG_ENABLE_BUTTON"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __46__PSDriverPolicyForApp_setValue_forSpecifier___block_invoke;
      v24[3] = &unk_1E4A65568;
      v25 = v8;
      v26 = v6;
      objc_msgSend(v17, "actionWithTitle:style:handler:", v18, 0, v24);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "addAction:", v19);
      v20 = (void *)MEMORY[0x1E0CEA2E0];
      PS_LocalizedStringForDriverPolicy(CFSTR("CONFIRMATION_DIALOG_CANCEL_BUTTON"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "actionWithTitle:style:handler:", v21, 1, &__block_literal_global_28);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "addAction:", v22);
      -[PSDriverPolicyForApp delegate](self, "delegate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "showController:animate:", v16, 1);

    }
  }

}

void __46__PSDriverPolicyForApp_setValue_forSpecifier___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(getDriverManagerClass(), "sharedManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDriverState:approved:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "BOOLValue"));

}

- (id)specifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getDriverManagerClass(), "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSDriverPolicyForApp bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "driverApprovalStatesForThirdPartyApp:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    PS_LocalizedStringForDriverPolicy(CFSTR("FORM_TITLE"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PSSpecifier groupSpecifierWithID:name:](PSSpecifier, "groupSpecifierWithID:name:", CFSTR("DRIVERS_GROUP"), v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v7;
    objc_msgSend(v20, "addObject:", v7);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v19 = v5;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v13, "displayName");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v14, self, sel_setValue_forSpecifier_, sel_valueForSpecifier_, 0, 6, 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "setUserInfo:", v13);
          objc_msgSend(v20, "addObject:", v15);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v10);
    }

    PS_LocalizedStringForDriverPolicy(CFSTR("FORM_DESCRIPTION"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setProperty:forKey:", v16, CFSTR("footerText"));

    v5 = v19;
  }

  return v20;
}

- (void)approvalStateDidChange:(BOOL)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__PSDriverPolicyForApp_approvalStateDidChange___block_invoke;
  block[3] = &unk_1E4A654F0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __47__PSDriverPolicyForApp_approvalStateDidChange___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadSpecifiers");

}

- (PSDriverPolicyForAppDelegate)delegate
{
  return (PSDriverPolicyForAppDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
