@implementation PSAccessoryInfoController

- (PSAccessoryInfoController)init
{
  PSAccessoryInfoController *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PSAccessoryInfoController;
  result = -[PSListController init](&v3, sel_init);
  if (result)
    result->_useAsHeader = 0;
  return result;
}

- (PSAccessoryInfoController)initWithDevice:(id)a3 session:(id)a4
{
  id v7;
  id v8;
  void *v9;
  PSAccessoryInfoController *v10;
  PSAccessoryInfoController *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  v10 = 0;
  if (v7 && v8)
  {
    v13.receiver = self;
    v13.super_class = (Class)PSAccessoryInfoController;
    v11 = -[PSListController init](&v13, sel_init);
    objc_storeStrong((id *)&v11->_session, a4);
    objc_storeStrong((id *)&v11->_device, a3);
    v11->_useAsHeader = 1;
    self = v11;
    v10 = self;
  }

  return v10;
}

- (CGSize)preferredContentSize
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  +[PSAccessoryInfoHeaderCell headerHeight](PSAccessoryInfoHeaderCell, "headerHeight");
  v4 = v3 + 0.0 + 44.0 + 20.0;
  -[DADevice appAccessInfoMap](self->_device, "appAccessInfoMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 + (double)(unint64_t)(44 * objc_msgSend(v5, "count"));

  if (self->_useAsHeader)
    v7 = v6 + 150.0;
  else
    v7 = v6 + 150.0 + 20.0 + 44.0;
  -[PSAccessoryInfoController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;

  v11 = v10;
  v12 = v7;
  result.height = v12;
  result.width = v11;
  return result;
}

- (id)specifiers
{
  NSArray *specifiers;
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
  NSArray *v16;
  NSArray *v17;
  NSArray *v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  specifiers = self->super._specifiers;
  if (specifiers)
    return specifiers;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSAccessoryInfoController specifiersForHeader](self, "specifiersForHeader");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v6);

  PS_LocalizedStringForAccessories(CFSTR("ACCESSORY_APP_ACCESS_HEADER"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v7, self, 0, 0, 0, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setIdentifier:", CFSTR("appAccess"));
  PS_LocalizedStringForAccessories(CFSTR("ACCESSORY_APP_ACCESS_FOOTER"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("footerText"));

  objc_msgSend(v5, "addObject:", v8);
  -[DADevice appAccessInfoMap](self->_device, "appAccessInfoMap");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSAccessoryInfoController specifiersForApps:](self, "specifiersForApps:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v11);

  if (!self->_useAsHeader)
  {
    +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, self, 0, 0, 0, 0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setIdentifier:", CFSTR("manage"));
    PS_LocalizedStringForAccessories(CFSTR("ACCESSORY_FORGET_DEVICE"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v13, self, 0, 0, 0, 13, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setButtonAction:", sel_forgetDevice_);
    v19[0] = v12;
    v19[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v15);

  }
  v16 = (NSArray *)objc_msgSend(v5, "copy");
  v17 = self->super._specifiers;
  self->super._specifiers = v16;

  v18 = self->super._specifiers;
  return v18;
}

- (id)specifiersForHeader
{
  DADevice *device;
  DADevice *v4;
  DADevice *v5;
  DASession *v6;
  DASession *session;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  device = self->_device;
  if (!device)
  {
    -[PSSpecifier propertyForKey:](self->super.super._specifier, "propertyForKey:", CFSTR("device"));
    v4 = (DADevice *)objc_claimAutoreleasedReturnValue();
    v5 = self->_device;
    self->_device = v4;

    -[PSSpecifier propertyForKey:](self->super.super._specifier, "propertyForKey:", CFSTR("session"));
    v6 = (DASession *)objc_claimAutoreleasedReturnValue();
    session = self->_session;
    self->_session = v6;

    device = self->_device;
  }
  -[DADevice discoveryConfiguration](device, "discoveryConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSListController setTitle:](self, "setTitle:", v9);

  +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_1E4A69238, self, 0, 0, 0, -1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setUserInfo:", self->_device);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_opt_class(), CFSTR("cellClass"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("enabled"));
  v13[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)specifiersForApps:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  id obj;
  uint64_t v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = v3;
  objc_msgSend(v3, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v15 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v7, 1, 0);
        objc_msgSend(v8, "localizedName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v9, self, sel_setAppAllowed_specifier_, sel_isAppAllowed_, 0, 6, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setProperty:forKey:", v11, CFSTR("useLazyIcons"));

        objc_msgSend(v10, "setProperty:forKey:", v7, CFSTR("appIDForLazyIcon"));
        objc_msgSend(v10, "setProperty:forKey:", v7, CFSTR("PSAccessoryAccessApplicationKey"));
        objc_msgSend(v17, "addObject:", v10);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v5);
  }

  return v17;
}

- (void)setAppAllowed:(id)a3 specifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v6 = a3;
  objc_msgSend(a4, "propertyForKey:", CFSTR("PSAccessoryAccessApplicationKey"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[DADevice appAccessInfoMap](self->_device, "appAccessInfoMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v7) = objc_msgSend(v6, "BOOLValue");
  if ((_DWORD)v7)
    v9 = 25;
  else
    v9 = 28;
  objc_msgSend(v8, "setState:", v9);
  -[DASession setDeviceAppAccessInfo:device:completionHandler:](self->_session, "setDeviceAppAccessInfo:device:completionHandler:", v8, self->_device, &__block_literal_global_10);

}

- (id)isAppAllowed:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;

  objc_msgSend(a3, "propertyForKey:", CFSTR("PSAccessoryAccessApplicationKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DADevice appAccessInfoMap](self->_device, "appAccessInfoMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend(v6, "state") == 20 || objc_msgSend(v6, "state") == 25;
  objc_msgSend(v7, "numberWithInt:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)forgetDevice:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CEA2E0];
  PS_LocalizedStringForAccessories(CFSTR("ACCESSORY_FORGET_DEVICE_CONFIRM"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __42__PSAccessoryInfoController_forgetDevice___block_invoke;
  v11[3] = &unk_1E4A65BF8;
  v11[4] = self;
  objc_msgSend(v5, "actionWithTitle:style:handler:", v6, 2, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CEA2E0];
  PS_LocalizedStringForAccessories(CFSTR("ACCESSORY_FORGET_DEVICE_CANCEL"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addAction:", v7);
  objc_msgSend(v4, "addAction:", v10);
  -[PSAccessoryInfoController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

}

void __42__PSAccessoryInfoController_forgetDevice___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1384), "appAccessInfoMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setState:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1376), "setDeviceAppAccessInfo:device:completionHandler:", v6, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1384), &__block_literal_global_33);
  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "popViewControllerAnimated:", 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerCell, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
