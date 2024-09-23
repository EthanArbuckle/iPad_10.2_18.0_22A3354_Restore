@implementation SBRemoveWidgetAlertItem

- (SBRemoveWidgetAlertItem)initWithWidget:(id)a3 inIcon:(id)a4 location:(id)a5 iconManager:(id)a6
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  SBRemoveWidgetAlertItem *v17;
  SBRemoveWidgetAlertItem *v18;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = v15;
  if (v13)
  {
    if (v15)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBRemoveWidgetAlertItem.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("icon"));

    if (v16)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBRemoveWidgetAlertItem.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("iconManager"));

LABEL_3:
  if ((objc_msgSend(v13, "isWidgetIcon") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBRemoveWidgetAlertItem.m"), 31, CFSTR("icon must be a widgetIcon: icon = %@"), v13);

  }
  v23.receiver = self;
  v23.super_class = (Class)SBRemoveWidgetAlertItem;
  v17 = -[SBAlertItem init](&v23, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_widget, a3);
    objc_storeStrong((id *)&v18->_icon, a4);
    objc_storeStrong((id *)&v18->_iconLocation, a5);
    objc_storeWeak((id *)&v18->_iconManager, v16);
  }

  return v18;
}

- (SBRemoveWidgetAlertItem)initWithWidgetIcon:(id)a3 location:(id)a4 iconManager:(id)a5
{
  return -[SBRemoveWidgetAlertItem initWithWidget:inIcon:location:iconManager:](self, "initWithWidget:inIcon:location:iconManager:", 0, a3, a4, a5);
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
  v9.super_class = (Class)SBRemoveWidgetAlertItem;
  -[SBAlertItem didActivate](&v9, sel_didActivate);
  v3 = *MEMORY[0x1E0DABD00];
  v10[0] = *MEMORY[0x1E0DABD08];
  v10[1] = v3;
  iconLocation = self->_iconLocation;
  v11[0] = &unk_1E91D1E20;
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
  SBLeafIconDataSource *widget;
  uint64_t v7;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  _QWORD v25[5];

  -[SBAlertItem alertController](self, "alertController", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  widget = self->_widget;
  if (widget)
    goto LABEL_2;
  if (-[SBWidgetIcon isWidgetStackIcon](self->_icon, "isWidgetStackIcon"))
  {
    SBHBundle();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("REMOVE_WIDGET_TITLE_REMOVE_STACK"), &stru_1E8EC7EC0, CFSTR("SpringBoardHome"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTitle:", v23);

    SBHBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("REMOVE_WIDGET_BODY_REMOVE_STACK"), &stru_1E8EC7EC0, CFSTR("SpringBoardHome"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMessage:", v13);
    goto LABEL_4;
  }
  widget = self->_widget;
  if (widget)
  {
LABEL_2:
    -[SBLeafIconDataSource icon:displayNameForLocation:](widget, "icon:displayNameForLocation:", self->_icon, *MEMORY[0x1E0DAA9E0]);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SBWidgetIcon displayName](self->_icon, "displayName");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
  v9 = (void *)MEMORY[0x1E0CB3940];
  SBHBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("REMOVE_WIDGET_TITLE_REMOVE_WITH_NAME"), &stru_1E8EC7EC0, CFSTR("SpringBoardHome"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v12);

  SBHBundle();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("REMOVE_WIDGET_BODY_REMOVE_DATA"), &stru_1E8EC7EC0, CFSTR("SpringBoardHome"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMessage:", v14);

LABEL_4:
  SBHBundle();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("REMOVE_WIDGET_BUTTON_REMOVE"), &stru_1E8EC7EC0, CFSTR("SpringBoardHome"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __63__SBRemoveWidgetAlertItem_configure_requirePasscodeForActions___block_invoke;
  v25[3] = &unk_1E8E9DCB0;
  v25[4] = self;
  objc_msgSend(MEMORY[0x1E0CEA2E0], "actionWithTitle:style:handler:", v16, 2, v25);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v18);
  v19 = (void *)MEMORY[0x1E0CEA2E0];
  -[SBWidgetIcon uninstallAlertCancelTitle](self->_icon, "uninstallAlertCancelTitle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v17;
  v24[1] = 3221225472;
  v24[2] = __63__SBRemoveWidgetAlertItem_configure_requirePasscodeForActions___block_invoke_33;
  v24[3] = &unk_1E8E9DCB0;
  v24[4] = self;
  objc_msgSend(v19, "actionWithTitle:style:handler:", v20, 1, v24);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v21);

  objc_msgSend(v5, "setPreferredAction:", v18);
}

void __63__SBRemoveWidgetAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "deactivateForButton");
  v10 = *MEMORY[0x1E0DABD10];
  v11[0] = &unk_1E91D1E38;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0DA9D78];
  v4 = v2;
  objc_msgSend(v3, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "emitEvent:withPayload:", 19, v4);

  objc_msgSend(*(id *)(a1 + 32), "iconManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(v8 + 112);
  if (v9)
    objc_msgSend(v6, "removeWidget:fromStack:", v9, *(_QWORD *)(v8 + 120));
  else
    objc_msgSend(v6, "uninstallIcon:", *(_QWORD *)(v8 + 120));

}

void __63__SBRemoveWidgetAlertItem_configure_requirePasscodeForActions___block_invoke_33(uint64_t a1)
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
  v6[0] = &unk_1E91D1E50;
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

- (SBLeafIconDataSource)widget
{
  return self->_widget;
}

- (void)setWidget:(id)a3
{
  objc_storeStrong((id *)&self->_widget, a3);
}

- (SBWidgetIcon)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (NSString)iconLocation
{
  return self->_iconLocation;
}

- (void)setIconLocation:(id)a3
{
  objc_storeStrong((id *)&self->_iconLocation, a3);
}

- (SBHIconManager)iconManager
{
  return (SBHIconManager *)objc_loadWeakRetained((id *)&self->_iconManager);
}

- (void)setIconManager:(id)a3
{
  objc_storeWeak((id *)&self->_iconManager, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_iconManager);
  objc_storeStrong((id *)&self->_iconLocation, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_widget, 0);
}

@end
