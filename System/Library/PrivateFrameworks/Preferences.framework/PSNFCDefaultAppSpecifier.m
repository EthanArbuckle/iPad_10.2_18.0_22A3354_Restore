@implementation PSNFCDefaultAppSpecifier

- (PSNFCDefaultAppSpecifier)initWithBundleID:(id)a3 delegate:(id)a4 onChange:(id)a5
{
  id v8;
  id v9;
  id v10;
  PSNFCDefaultAppSpecifier *v11;
  uint64_t v12;
  SESNFCAppSettingsContext *context;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v36.receiver = self;
  v36.super_class = (Class)PSNFCDefaultAppSpecifier;
  v11 = -[PSSpecifier init](&v36, sel_init);
  if (v11)
  {
    v31 = v8;
    objc_msgSend(MEMORY[0x1E0D89660], "contextWithBundleId:onChange:", v8, v10);
    v12 = objc_claimAutoreleasedReturnValue();
    context = v11->_context;
    v11->_context = (SESNFCAppSettingsContext *)v12;

    v30 = v9;
    -[PSNFCDefaultAppSpecifier setDelegate:](v11, "setDelegate:", v9);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("DEFAULT_CONTACTLESS_APP_TITLE"), &stru_1E4A69238, CFSTR("ContactlessAndCredentialSettings_Localizable"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier setName:](v11, "setName:", v15);

    objc_storeWeak(&v11->super.target, v11);
    v11->super.getter = sel_defaultNFCApp_;
    v11->super.setter = sel_setDefaultNFCApp_specifier_;
    v11->super.detailControllerClass = (Class)objc_opt_class();
    v11->super.cellType = 2;
    v11->super.editPaneClass = 0;
    v16 = (void *)objc_opt_new();
    v17 = (void *)objc_opt_new();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    -[PSNFCDefaultAppSpecifier context](v11, "context");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "defaultAppCandidates");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v33 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v24, "bundleId");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v25);

          objc_msgSend(v24, "localizedDisplayName");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v26);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v21);
    }

    -[PSSpecifier setValues:titles:](v11, "setValues:titles:", v17, v16);
    -[PSSpecifier setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("PSListItemsValuesAreAppIDsKey"));
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("DEFAULT_CONTACTLESS_APP_FOOTER"), &stru_1E4A69238, CFSTR("ContactlessAndCredentialSettings_Localizable"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v28, CFSTR("staticTextMessage"));

    -[PSSpecifier setIdentifier:](v11, "setIdentifier:", CFSTR("DEFAULT_CONTACTLESS_APP_FOOTER"));
    v9 = v30;
    v8 = v31;
  }

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[SESNFCAppSettingsContext invalidate](self->_context, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PSNFCDefaultAppSpecifier;
  -[PSNFCDefaultAppSpecifier dealloc](&v3, sel_dealloc);
}

- (id)defaultNFCApp:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[PSNFCDefaultAppSpecifier context](self, "context", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getDefaultNFCApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setDefaultNFCApp:(id)a3 specifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
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
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  id v31;
  _QWORD v32[5];
  id v33;

  v5 = a3;
  -[PSNFCDefaultAppSpecifier context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getDefaultNFCApplication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "isEqual:", v8);

  if ((v9 & 1) == 0)
  {
    -[PSSpecifier objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("PSListItemsControllerSpecifierKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "nonretainedObjectValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[PSNFCDefaultAppSpecifier context](self, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "alertMessageForDefaultAppChangeTo:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = (void *)MEMORY[0x1E0CEA2E8];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("CHANGE_DEFAULT_CONTACTLESS_APP_ALERT_TITLE"), &stru_1E4A69238, CFSTR("ContactlessAndCredentialSettings_Localizable"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "alertControllerWithTitle:message:preferredStyle:", v16, v13, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = (void *)MEMORY[0x1E0CEA2E0];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("CANCEL_BUTTON"), &stru_1E4A69238, CFSTR("ContactlessAndCredentialSettings_Localizable"));
      v20 = v11;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __55__PSNFCDefaultAppSpecifier_setDefaultNFCApp_specifier___block_invoke;
      v32[3] = &unk_1E4A65568;
      v32[4] = self;
      v22 = v20;
      v33 = v22;
      objc_msgSend(v18, "actionWithTitle:style:handler:", v21, 1, v32);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "addAction:", v23);
      v24 = (void *)MEMORY[0x1E0CEA2E0];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("CONTINUE_BUTTON"), &stru_1E4A69238, CFSTR("ContactlessAndCredentialSettings_Localizable"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __55__PSNFCDefaultAppSpecifier_setDefaultNFCApp_specifier___block_invoke_2;
      v29[3] = &unk_1E4A66D48;
      v29[4] = self;
      v30 = v5;
      v31 = v22;
      objc_msgSend(v24, "actionWithTitle:style:handler:", v26, 0, v29);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "addAction:", v27);
      -[PSNFCDefaultAppSpecifier delegate](self, "delegate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "showController:animate:", v17, 1);

      v11 = v20;
    }
    else
    {
      -[SESNFCAppSettingsContext setDefaultNFCApplication:](self->_context, "setDefaultNFCApplication:", v5);
    }

  }
}

uint64_t __55__PSNFCDefaultAppSpecifier_setDefaultNFCApp_specifier___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadSpecifiers");

  return objc_msgSend(*(id *)(a1 + 40), "reloadSpecifiers");
}

uint64_t __55__PSNFCDefaultAppSpecifier_setDefaultNFCApp_specifier___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDefaultNFCApplication:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadSpecifiers");

  return objc_msgSend(*(id *)(a1 + 48), "reloadSpecifiers");
}

- (SESNFCAppSettingsContext)context
{
  return self->_context;
}

- (PSSystemPolicyForAppDelegate)delegate
{
  return (PSSystemPolicyForAppDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
