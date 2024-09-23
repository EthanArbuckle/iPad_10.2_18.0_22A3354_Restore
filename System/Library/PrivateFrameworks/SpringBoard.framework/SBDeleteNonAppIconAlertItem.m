@implementation SBDeleteNonAppIconAlertItem

- (SBDeleteNonAppIconAlertItem)initWithIcon:(id)a3 location:(id)a4
{
  id v8;
  id v9;
  SBDeleteNonAppIconAlertItem *v10;
  SBDeleteNonAppIconAlertItem *v11;
  uint64_t v12;
  NSString *iconLocation;
  void *v15;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "isApplicationIcon"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDeleteNonAppIconAlertItem.m"), 23, CFSTR("icon must not be an applicationIcon : icon=%@"), v8);

  }
  v16.receiver = self;
  v16.super_class = (Class)SBDeleteNonAppIconAlertItem;
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
  v9.super_class = (Class)SBDeleteNonAppIconAlertItem;
  -[SBAlertItem didActivate](&v9, sel_didActivate);
  v3 = *MEMORY[0x1E0DABD00];
  v10[0] = *MEMORY[0x1E0DABD08];
  v10[1] = v3;
  iconLocation = self->_iconLocation;
  v11[0] = &unk_1E91D08C0;
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
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD v27[5];

  -[SBAlertItem alertController](self, "alertController", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIcon uninstallAlertTitle](self->_icon, "uninstallAlertTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v6);

  -[SBIcon uninstallAlertBody](self->_icon, "uninstallAlertBody");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMessage:", v7);

  v8 = (void *)MEMORY[0x1E0CEA2E0];
  -[SBIcon uninstallAlertConfirmTitle](self->_icon, "uninstallAlertConfirmTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __67__SBDeleteNonAppIconAlertItem_configure_requirePasscodeForActions___block_invoke;
  v27[3] = &unk_1E8E9DCB0;
  v27[4] = self;
  objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 2, v27);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addAction:", v10);
  -[SBDeleteNonAppIconAlertItem icon](self, "icon");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "isBookmarkIcon"))
  {
LABEL_5:

    goto LABEL_6;
  }
  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDeleteNonAppIconAlertItem icon](self, "icon");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDeleteNonAppIconAlertItem iconLocation](self, "iconLocation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v12, "isHideSupportedForIcon:inLocation:", v13, v14);

  if (v15)
  {
    -[SBDeleteNonAppIconAlertItem icon](self, "icon");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bookmark");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "webClip");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v11, "isAppClip") & 1) == 0)
    {
      v18 = (void *)MEMORY[0x1E0CEA2E0];
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("REMOVE_FROM_HOME_SCREEN"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __67__SBDeleteNonAppIconAlertItem_configure_requirePasscodeForActions___block_invoke_24;
      v26[3] = &unk_1E8E9DCB0;
      v26[4] = self;
      objc_msgSend(v18, "actionWithTitle:style:handler:", v20, 0, v26);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addAction:", v21);

    }
    goto LABEL_5;
  }
LABEL_6:
  v22 = (void *)MEMORY[0x1E0CEA2E0];
  -[SBIcon uninstallAlertCancelTitle](self->_icon, "uninstallAlertCancelTitle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __67__SBDeleteNonAppIconAlertItem_configure_requirePasscodeForActions___block_invoke_26;
  v25[3] = &unk_1E8E9DCB0;
  v25[4] = self;
  objc_msgSend(v22, "actionWithTitle:style:handler:", v23, 1, v25);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v24);

  objc_msgSend(v5, "setPreferredAction:", v10);
}

void __67__SBDeleteNonAppIconAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
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
  v9[0] = &unk_1E91D08D8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0DA9D78];
  v4 = v2;
  objc_msgSend(v3, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "emitEvent:withPayload:", 19, v4);

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "isApplicationIcon"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "setUninstalledByUser:", 1);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "cancelDownload");
  }
  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "iconManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uninstallIcon:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112));

}

void __67__SBDeleteNonAppIconAlertItem_configure_requirePasscodeForActions___block_invoke_24(uint64_t a1)
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
  v9[0] = &unk_1E91D08F0;
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
  objc_msgSend(v7, "addIconToIgnoredList:options:completion:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112), 1, 0);

}

void __67__SBDeleteNonAppIconAlertItem_configure_requirePasscodeForActions___block_invoke_26(uint64_t a1)
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
  v6[0] = &unk_1E91D0908;
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
