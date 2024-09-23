@implementation SHSDualSIMListController

- (void)reloadSpecifiers
{
  _BOOL8 v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = -[SHSDualSIMListController hasDifferentTones](self, "hasDifferentTones");
  v8.receiver = self;
  v8.super_class = (Class)SHSDualSIMListController;
  -[SHSDualSIMListController reloadSpecifiers](&v8, sel_reloadSpecifiers);
  SHSLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SHSDualSIMListController hasDifferentTones](self, "hasDifferentTones"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v10 = "-[SHSDualSIMListController reloadSpecifiers]";
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_228D17000, v4, OS_LOG_TYPE_DEFAULT, "%s self.hasDifferentTones: %@ differentTonesBeforeUpdate: %@", buf, 0x20u);

  }
  if (v3 != -[SHSDualSIMListController hasDifferentTones](self, "hasDifferentTones"))
  {
    -[SHSDualSIMListController alertType](self, "alertType");
    NSStringFromTLAlertType();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[SHSAnalytics trackingDualSIMToneValueChanged:didSelectDifferentTones:](SHSAnalytics, "trackingDualSIMToneValueChanged:didSelectDifferentTones:", v7, -[SHSDualSIMListController hasDifferentTones](self, "hasDifferentTones"));

  }
}

- (void)setSpecifier:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SHSDualSIMListController;
  v4 = a3;
  -[SHSDualSIMListController setSpecifier:](&v6, sel_setSpecifier_, v4);
  objc_msgSend(v4, "propertyForKey:", CFSTR("alertType"), v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[SHSDualSIMListController setAlertType:](self, "setAlertType:", TLAlertTypeFromString());

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  objc_super v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v15.receiver = self;
  v15.super_class = (Class)SHSDualSIMListController;
  -[SHSDualSIMListController viewDidAppear:](&v15, sel_viewDidAppear_, a3);
  v4 = (void *)MEMORY[0x24BDBCF48];
  v5 = (void *)MEMORY[0x24BDD17C8];
  -[SHSDualSIMListController specifier](self, "specifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("settings-navigation://com.apple.Settings.Sounds/%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLWithString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BDD19B8];
  -[SHSDualSIMListController specifier](self, "specifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "shs_localizedPathComponentForTonePickerSpecifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDD19B8], "shs_rootPaneComponent");
    v13 = objc_claimAutoreleasedReturnValue();
    v16[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSDualSIMListController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.graphic-icon.sound"), v12, v14, v9);

  }
  else
  {
    SHSLogForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SHSDualSIMListController viewDidAppear:].cold.1(self, v13);
  }

}

- (id)specifiers
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  objc_class *v18;
  void *v19;
  uint64_t v21;
  id obj;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]);
  if (!v3)
  {
    v21 = (int)*MEMORY[0x24BE756E0];
    v26 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    +[SHSDualSIMToneHelper fetchCTSubscriptionsInUse](SHSDualSIMToneHelper, "fetchCTSubscriptionsInUse");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    SHSLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v33 = "-[SHSDualSIMListController specifiers]";
      v34 = 2112;
      v35 = v4;
      _os_log_impl(&dword_228D17000, v5, OS_LOG_TYPE_DEFAULT, "%s fetchCTSubscriptionsInUse returned contexts: %@", buf, 0x16u);
    }

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = v4;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v6)
    {
      v7 = v6;
      v25 = *(_QWORD *)v28;
      v24 = *MEMORY[0x24BE75CE8];
      v23 = *MEMORY[0x24BE75948];
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v28 != v25)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v9, "label");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "labelID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v10, self, 0, sel_detailTextForToneWithSpecifier_, objc_opt_class(), 2, 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setProperty:forKey:", v9, v24);
          -[SHSDualSIMListController alertType](self, "alertType");
          NSStringFromTLAlertType();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setProperty:forKey:", v13, CFSTR("alertType"));

          objc_msgSend(v12, "setProperty:forKey:", objc_opt_class(), v23);
          +[SHSDualSIMToneHelper fetchShortLabelForContext:](SHSDualSIMToneHelper, "fetchShortLabelForContext:", v9);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setProperty:forKey:", v14, CFSTR("contextShortLabel"));

          if (v11)
          {
            objc_msgSend(CFSTR("TLAlertTopicIncomingCall"), "stringByAppendingString:", v11);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setProperty:forKey:", v15, CFSTR("accountIdentifier"));

          }
          objc_msgSend(v9, "userDefaultVoice");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "BOOLValue");

          if (v17)
            objc_msgSend(v26, "insertObject:atIndex:", v12, 0);
          else
            objc_msgSend(v26, "addObject:", v12);

        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v7);
    }

    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v26);
    v18 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v19 = *(Class *)((char *)&self->super.super.super.super.super.isa + v21);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v21) = v18;

    -[SHSDualSIMListController updateDifferentTonesState](self, "updateDifferentTonesState");
    v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v21);
  }
  return v3;
}

- (id)detailTextForToneWithSpecifier:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a3;
  objc_msgSend(v3, "propertyForKey:", CFSTR("alertType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = TLAlertTypeFromString();

  objc_msgSend(v3, "propertyForKey:", CFSTR("accountIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEB8CC8], "sharedToneManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentToneIdentifierForAlertType:topic:", v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEB8CC8], "sharedToneManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCurrentToneIdentifier:forAlertType:topic:", v8, v5, v6);

  if ((PSGetCapabilityBoolAnswer() & 1) == 0 && PSGetCapabilityBoolAnswer())
  {
    objc_msgSend(MEMORY[0x24BEB8CD8], "sharedVibrationManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currentVibrationIdentifierForAlertType:topic:", v5, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEB8CD8], "sharedVibrationManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCurrentVibrationIdentifier:forAlertType:topic:", v11, v5, v6);

    if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BEB8DD0])
      && !objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BEB8DD8]))
    {
      SHS_LocalizedStringForSounds(CFSTR("VIBRATE_ONLY"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
        goto LABEL_7;
    }
    else
    {

    }
  }
  objc_msgSend(MEMORY[0x24BEB8CC8], "sharedToneManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "nameForToneIdentifier:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v14;
}

- (void)updateDifferentTonesState
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = (int)*MEMORY[0x24BE756E0];
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v3), "objectAtIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSDualSIMListController detailTextForToneWithSpecifier:](self, "detailTextForToneWithSpecifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v3), "objectAtIndex:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSDualSIMListController detailTextForToneWithSpecifier:](self, "detailTextForToneWithSpecifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  -[SHSDualSIMListController setHasDifferentTones:](self, "setHasDifferentTones:", v8 ^ 1u);
  SHSLogForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SHSDualSIMListController hasDifferentTones](self, "hasDifferentTones"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136315394;
    v12 = "-[SHSDualSIMListController updateDifferentTonesState]";
    v13 = 2112;
    v14 = v10;
    _os_log_impl(&dword_228D17000, v9, OS_LOG_TYPE_DEFAULT, "%s self.hasDifferentTones: %@", (uint8_t *)&v11, 0x16u);

  }
}

- (int64_t)alertType
{
  return self->_alertType;
}

- (void)setAlertType:(int64_t)a3
{
  self->_alertType = a3;
}

- (BOOL)hasDifferentTones
{
  return self->_hasDifferentTones;
}

- (void)setHasDifferentTones:(BOOL)a3
{
  self->_hasDifferentTones = a3;
}

- (void)viewDidAppear:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  const char *v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "specifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 136315394;
  v5 = "-[SHSDualSIMListController viewDidAppear:]";
  v6 = 2112;
  v7 = v3;
  _os_log_error_impl(&dword_228D17000, a2, OS_LOG_TYPE_ERROR, "%s shs_localizedPathComponentForTonePickerSpecifier returned nil for specifier: %@", (uint8_t *)&v4, 0x16u);

}

@end
