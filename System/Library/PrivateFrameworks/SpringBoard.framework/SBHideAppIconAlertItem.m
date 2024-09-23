@implementation SBHideAppIconAlertItem

- (SBHideAppIconAlertItem)initWithIcon:(id)a3 location:(id)a4
{
  id v8;
  id v9;
  SBHideAppIconAlertItem *v10;
  SBHideAppIconAlertItem *v11;
  uint64_t v12;
  NSString *iconLocation;
  void *v15;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  if ((objc_msgSend(v8, "isApplicationIcon") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBHideAppIconAlertItem.m"), 19, CFSTR("icon must be an applicationIcon : icon=%@"), v8);

  }
  v16.receiver = self;
  v16.super_class = (Class)SBHideAppIconAlertItem;
  v10 = -[SBAlertItem init](&v16, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_icon, a3);
    v12 = objc_msgSend(v9, "copy");
    iconLocation = v11->_iconLocation;
    v11->_iconLocation = (NSString *)v12;

  }
  return v11;
}

- (void)didActivate
{
  uint64_t v3;
  NSString *iconLocation;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)SBHideAppIconAlertItem;
  -[SBAlertItem didActivate](&v9, sel_didActivate);
  v3 = *MEMORY[0x1E0DABD00];
  v10[0] = *MEMORY[0x1E0DABD08];
  v10[1] = v3;
  iconLocation = self->_iconLocation;
  v11[0] = &unk_1E91D2420;
  v11[1] = iconLocation;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0DA9D78];
  v7 = v5;
  objc_msgSend(v6, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "emitEvent:withPayload:", 18, v7);

}

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  void *v5;
  void *v6;
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
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  _QWORD v24[5];
  id v25;

  -[SBAlertItem alertController](self, "alertController", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHideAppIconAlertItem icon](self, "icon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("REMOVE_FROM_HOME_SCREEN_ALERT_TITLE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v11);

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("REMOVE_FROM_HOME_SCREEN_ALERT_MESSAGE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMessage:", v13);

  v14 = (void *)MEMORY[0x1E0CEA2E0];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("REMOVE_FROM_HOME_SCREEN"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __62__SBHideAppIconAlertItem_configure_requirePasscodeForActions___block_invoke;
  v24[3] = &unk_1E8E9DC88;
  v24[4] = self;
  v25 = v6;
  v18 = v6;
  objc_msgSend(v14, "actionWithTitle:style:handler:", v16, 0, v24);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addAction:", v19);
  v20 = (void *)MEMORY[0x1E0CEA2E0];
  -[SBIcon uninstallAlertCancelTitle](self->_icon, "uninstallAlertCancelTitle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v17;
  v23[1] = 3221225472;
  v23[2] = __62__SBHideAppIconAlertItem_configure_requirePasscodeForActions___block_invoke_25;
  v23[3] = &unk_1E8E9DCB0;
  v23[4] = self;
  objc_msgSend(v20, "actionWithTitle:style:handler:", v21, 1, v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v22);

  objc_msgSend(v5, "setPreferredAction:", v19);
}

void __62__SBHideAppIconAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "deactivateForButton");
  v8 = *MEMORY[0x1E0DABD10];
  v9[0] = &unk_1E91D2438;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0DA9D78];
  v4 = v2;
  objc_msgSend(v3, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "emitEvent:withPayload:", 19, v4);

  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "iconManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addIconToIgnoredList:options:completion:", *(_QWORD *)(a1 + 40), 1, 0);

}

void __62__SBHideAppIconAlertItem_configure_requirePasscodeForActions___block_invoke_25(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "deactivateForButton");
  v5 = *MEMORY[0x1E0DABD10];
  v6[0] = &unk_1E91D2450;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0DA9D78];
  v3 = v1;
  objc_msgSend(v2, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "emitEvent:withPayload:", 19, v3);

}

- (BOOL)shouldShowInLockScreen
{
  return 1;
}

- (BOOL)dismissOnLock
{
  return 1;
}

- (BOOL)forcesModalAlertAppearance
{
  return 1;
}

- (SBIcon)icon
{
  return self->_icon;
}

- (NSString)iconLocation
{
  return self->_iconLocation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconLocation, 0);
  objc_storeStrong((id *)&self->_icon, 0);
}

@end
