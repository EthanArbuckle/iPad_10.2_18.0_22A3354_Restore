@implementation SBDataPlanAccountAlertItem

- (SBDataPlanAccountAlertItem)initWithAccountURL:(id)a3
{
  id v4;
  SBDataPlanAccountAlertItem *v5;
  SBDataPlanAccountAlertItem *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBDataPlanAccountAlertItem;
  v5 = -[SBAlertItem init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[SBDataPlanAccountAlertItem setAccountURL:](v5, "setAccountURL:", v4);

  return v6;
}

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[5];

  -[SBAlertItem alertController](self, "alertController", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a3)
  {
    v7 = (void *)MEMORY[0x1E0CEA2E0];
    objc_msgSend((id)objc_opt_class(), "laterButtonTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __66__SBDataPlanAccountAlertItem_configure_requirePasscodeForActions___block_invoke;
    v15[3] = &unk_1E8E9DCB0;
    v15[4] = self;
    objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 0, v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addAction:", v10);

    v11 = (void *)MEMORY[0x1E0CEA2E0];
    objc_msgSend((id)objc_opt_class(), "nowButtonTitle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __66__SBDataPlanAccountAlertItem_configure_requirePasscodeForActions___block_invoke_2;
    v14[3] = &unk_1E8E9DCB0;
    v14[4] = self;
    objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 0, v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addAction:", v13);

  }
}

uint64_t __66__SBDataPlanAccountAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "deactivateForButton");
  return objc_msgSend(*(id *)(a1 + 32), "notNow");
}

uint64_t __66__SBDataPlanAccountAlertItem_configure_requirePasscodeForActions___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "deactivateForButton");
  return objc_msgSend(*(id *)(a1 + 32), "takeAction");
}

- (void)takeAction
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  SBDataPlanAccountAlertItem *v8;

  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataActivationApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __40__SBDataPlanAccountAlertItem_takeAction__block_invoke;
    v6[3] = &unk_1E8EA0260;
    v7 = v4;
    v8 = self;
    objc_msgSend(v5, "requestTransitionWithBuilder:", v6);

  }
}

void __40__SBDataPlanAccountAlertItem_takeAction__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v3 = a2;
  objc_msgSend(v3, "setSource:", 0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__SBDataPlanAccountAlertItem_takeAction__block_invoke_2;
  v6[3] = &unk_1E8E9ECA8;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v3, "modifyApplicationContext:", v6);

}

void __40__SBDataPlanAccountAlertItem_takeAction__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  SBDeviceApplicationSceneEntity *v5;

  v3 = a2;
  v5 = -[SBDeviceApplicationSceneEntity initWithApplicationForMainDisplay:]([SBDeviceApplicationSceneEntity alloc], "initWithApplicationForMainDisplay:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "accountURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWorkspaceEntity setObject:forActivationSetting:](v5, "setObject:forActivationSetting:", v4, 5);

  objc_msgSend(v3, "setBackground:", 1);
  objc_msgSend(v3, "setEntity:forLayoutRole:", v5, 1);

}

+ (id)laterButtonTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("DATA_PLAN_LATER"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)nowButtonTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("DATA_PLAN_NOW"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSURL)accountURL
{
  return self->_accountURL;
}

- (void)setAccountURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountURL, 0);
}

@end
