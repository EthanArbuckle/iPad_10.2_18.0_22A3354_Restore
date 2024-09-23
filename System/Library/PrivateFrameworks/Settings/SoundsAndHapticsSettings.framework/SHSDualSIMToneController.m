@implementation SHSDualSIMToneController

- (SHSDualSIMToneController)init
{
  SHSDualSIMToneController *v2;
  SHSDualSIMToneController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SHSDualSIMToneController;
  v2 = -[SHSToneController init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SHSDualSIMToneController setIsDefaultSIMLineController:](v2, "setIsDefaultSIMLineController:", 0);
  return v3;
}

- (void)setSpecifier:(id)a3
{
  id v4;
  __CFString *v5;
  NSObject *v6;
  char *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  char *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  NSObject *v17;
  SHSDualSIMToneTitleView *v18;
  SHSDualSIMToneTitleView *titleView;
  SHSDualSIMToneTitleView *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  __CFString *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "propertyForKey:", CFSTR("accountIdentifier"));
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  SHSLogForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v32 = "-[SHSDualSIMToneController setSpecifier:]";
    v33 = 2112;
    v34 = v5;
    _os_log_impl(&dword_228D17000, v6, OS_LOG_TYPE_DEFAULT, "%s with topic: %@", buf, 0x16u);
  }

  if (v5)
  {
    -[SHSDualSIMToneController setTopic:](self, "setTopic:", v5);
    objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75CE8]);
    v7 = (char *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      SHSLogForCategory(0);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v7;
        _os_log_impl(&dword_228D17000, v8, OS_LOG_TYPE_DEFAULT, "SHSDualSIMToneController context:%@", buf, 0xCu);
      }

      objc_msgSend(v7, "userDefaultVoice");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "BOOLValue");

      if (v10)
        -[SHSDualSIMToneController setIsDefaultSIMLineController:](self, "setIsDefaultSIMLineController:", 1);
      -[SHSDualSIMToneController titleView](self, "titleView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        objc_msgSend(v7, "label");
        v12 = (char *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "propertyForKey:", CFSTR("contextShortLabel"));
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)v13;
        v15 = &stru_24F198178;
        if (v13)
          v15 = (__CFString *)v13;
        v16 = v15;

        SHSLogForCategory(0);
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v32 = v12;
          v33 = 2112;
          v34 = v16;
          _os_log_impl(&dword_228D17000, v17, OS_LOG_TYPE_DEFAULT, "SHSDualSIMToneController creating titleView with simLabel: %@, simShortLabel: %@", buf, 0x16u);
        }

        if (v12)
        {
          v18 = objc_alloc_init(SHSDualSIMToneTitleView);
          titleView = self->_titleView;
          self->_titleView = v18;

          -[SHSDualSIMToneTitleView updateContentsWithTitle:badgeText:](self->_titleView, "updateContentsWithTitle:badgeText:", v12, v16);
        }

      }
      v20 = self->_titleView;
      -[SHSDualSIMToneController navigationItem](self, "navigationItem");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setTitleView:", v20);

    }
  }
  v30.receiver = self;
  v30.super_class = (Class)SHSDualSIMToneController;
  -[SHSToneController setSpecifier:](&v30, sel_setSpecifier_, v4);
  -[SHSToneController tonePickerViewController](self, "tonePickerViewController");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    v24 = -[SHSDualSIMToneController isDefaultSIMLineController](self, "isDefaultSIMLineController");

    if (v24)
    {
      objc_msgSend(v4, "propertyForKey:", CFSTR("alertType"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        v26 = TLAlertTypeFromString();
        -[SHSToneController tonePickerViewController](self, "tonePickerViewController");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setTopic:", 0);

        -[SHSToneController _defaultToneIdentifierForTonePickerWithAlertType:topic:](self, "_defaultToneIdentifierForTonePickerWithAlertType:topic:", v26, 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[SHSToneController tonePickerViewController](self, "tonePickerViewController");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setDefaultToneIdentifier:", v28);

      }
    }
  }

}

- (void)_updateReloadSpecifierInParentController
{
  id v2;

  -[SHSDualSIMToneController parentController](self, "parentController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v2, "reloadSpecifiers");

}

- (void)tonePickerViewController:(id)a3 selectedToneWithIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  const char *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  SHSLogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 136315394;
    v20 = "-[SHSDualSIMToneController tonePickerViewController:selectedToneWithIdentifier:]";
    v21 = 2112;
    v22 = v7;
    _os_log_impl(&dword_228D17000, v8, OS_LOG_TYPE_DEFAULT, "%s selectedToneWithIdentifier:%@", (uint8_t *)&v19, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BEB8CC8], "sharedToneManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "alertType");
  -[SHSDualSIMToneController topic](self, "topic");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCurrentToneIdentifier:forAlertType:topic:", v7, v10, v11);

  LODWORD(v11) = -[SHSDualSIMToneController isDefaultSIMLineController](self, "isDefaultSIMLineController");
  objc_msgSend(MEMORY[0x24BEB8CC8], "sharedToneManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v6, "alertType");
  if ((_DWORD)v11)
  {
    objc_msgSend(v12, "setCurrentToneIdentifier:forAlertType:topic:", v7, v13, 0);
  }
  else
  {
    -[SHSDualSIMToneController topic](self, "topic");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "currentToneIdentifierForAlertType:topic:", v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEB8CC8], "sharedToneManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v6, "alertType");
    -[SHSDualSIMToneController topic](self, "topic");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setCurrentToneIdentifier:forAlertType:topic:", v15, v17, v18);

    v12 = (void *)v15;
  }

  -[SHSDualSIMToneController _updateReloadSpecifierInParentController](self, "_updateReloadSpecifierInParentController");
}

- (void)vibrationPickerViewController:(id)a3 selectedVibrationWithIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  const char *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  SHSLogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 136315394;
    v20 = "-[SHSDualSIMToneController vibrationPickerViewController:selectedVibrationWithIdentifier:]";
    v21 = 2112;
    v22 = v7;
    _os_log_impl(&dword_228D17000, v8, OS_LOG_TYPE_DEFAULT, "%s selectedToneWithIdentifier:%@", (uint8_t *)&v19, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BEB8CD8], "sharedVibrationManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "alertType");
  -[SHSDualSIMToneController topic](self, "topic");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCurrentVibrationIdentifier:forAlertType:topic:", v7, v10, v11);

  LODWORD(v11) = -[SHSDualSIMToneController isDefaultSIMLineController](self, "isDefaultSIMLineController");
  objc_msgSend(MEMORY[0x24BEB8CD8], "sharedVibrationManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v6, "alertType");
  if ((_DWORD)v11)
  {
    objc_msgSend(v12, "setCurrentVibrationIdentifier:forAlertType:topic:", v7, v13, 0);
  }
  else
  {
    -[SHSDualSIMToneController topic](self, "topic");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "currentVibrationIdentifierForAlertType:topic:", v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEB8CD8], "sharedVibrationManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v6, "alertType");
    -[SHSDualSIMToneController topic](self, "topic");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setCurrentVibrationIdentifier:forAlertType:topic:", v15, v17, v18);

    v12 = (void *)v15;
  }

  -[SHSDualSIMToneController _updateReloadSpecifierInParentController](self, "_updateReloadSpecifierInParentController");
}

- (id)_defaultVibrationIdentifierForVibrationPickerWithAlertType:(int64_t)a3 topic:(id)a4
{
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = -[SHSDualSIMToneController isDefaultSIMLineController](self, "isDefaultSIMLineController", a3, a4);
  objc_msgSend(MEMORY[0x24BEB8CD8], "sharedVibrationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
    objc_msgSend(v6, "defaultVibrationIdentifierForAlertType:", a3);
  else
    objc_msgSend(v6, "currentVibrationIdentifierForAlertType:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)topic
{
  return self->_topic;
}

- (void)setTopic:(id)a3
{
  objc_storeStrong((id *)&self->_topic, a3);
}

- (SHSDualSIMToneTitleView)titleView
{
  return self->_titleView;
}

- (void)setTitleView:(id)a3
{
  objc_storeStrong((id *)&self->_titleView, a3);
}

- (BOOL)isDefaultSIMLineController
{
  return self->_isDefaultSIMLineController;
}

- (void)setIsDefaultSIMLineController:(BOOL)a3
{
  self->_isDefaultSIMLineController = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_topic, 0);
}

@end
