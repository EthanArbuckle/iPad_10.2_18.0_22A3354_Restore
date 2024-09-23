@implementation PSPhotosPickerOptionsController

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PSPhotosPickerOptionsController;
  -[PSListController viewDidLoad](&v2, sel_viewDidLoad);
}

- (void)setSpecifier:(id)a3
{
  id v4;
  NSString *v5;
  NSString *clientIdentifier;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PSPhotosPickerOptionsController;
  v4 = a3;
  -[PSListController setSpecifier:](&v7, sel_setSpecifier_, v4);
  objc_msgSend(v4, "propertyForKey:", CFSTR("appBundleID"), v7.receiver, v7.super_class);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  clientIdentifier = self->_clientIdentifier;
  self->_clientIdentifier = v5;

}

- (id)specifiers
{
  PSPhotosPickerOptionsController *v2;
  void *v3;
  void *v4;
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
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSArray *specifiers;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->super._specifiers)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    PS_LocalizedStringForSystemPolicy(CFSTR("PHOTOS_PICKER_OPTIONS_METADATA_TITLE"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PSSpecifier groupSpecifierWithName:](PSSpecifier, "groupSpecifierWithName:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setIdentifier:", CFSTR("metadataGroupID"));
    objc_msgSend(v5, "setProperty:forKey:", CFSTR("metadataGroupID"), CFSTR("id"));
    objc_msgSend(v3, "addObject:", v5);
    PS_LocalizedStringForSystemPolicy(CFSTR("PHOTOS_PICKER_OPTIONS_METADATA_LOCATION"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v6, v2, sel__setMetadataSetting_specifier_, sel__metadataSetting_, 0, 6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setProperty:forKey:", CFSTR("pickerShouldStripLocation"), CFSTR("pickerOptionsPropertyKey"));
    objc_msgSend(v3, "addObject:", v7);
    PS_LocalizedStringForSystemPolicy(CFSTR("PHOTOS_PICKER_OPTIONS_METADATA_CAPTION"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v8, v2, sel__setMetadataSetting_specifier_, sel__metadataSetting_, 0, 6, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setProperty:forKey:", CFSTR("pickerShouldStripCaption"), CFSTR("pickerOptionsPropertyKey"));
    objc_msgSend(v3, "addObject:", v9);
    PS_LocalizedStringForSystemPolicy(CFSTR("PHOTOS_PICKER_OPTIONS_FORMAT_TITLE"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[PSSpecifier groupSpecifierWithName:](PSSpecifier, "groupSpecifierWithName:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setIdentifier:", CFSTR("formatGroupID"));
    objc_msgSend(v11, "setProperty:forKey:", CFSTR("formatGroupID"), CFSTR("id"));
    objc_msgSend(v11, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("isRadioGroup"));
    PS_LocalizedStringForSystemPolicy(CFSTR("PHOTOS_PICKER_OPTIONS_FORMAT_FOOTER"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setProperty:forKey:", v12, CFSTR("footerText"));

    objc_msgSend(v3, "addObject:", v11);
    PS_LocalizedStringForSystemPolicy(CFSTR("PHOTOS_PICKER_OPTIONS_FORMAT_AUTOMATIC"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v13, v2, 0, 0, 0, 3, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setIdentifier:", CFSTR("PhotosPickerFormatOptionAutomatic"));
    objc_msgSend(v14, "setProperty:forKey:", &unk_1E4A92EC8, CFSTR("pickerFormatOptionPropertyKey"));
    objc_msgSend(v3, "addObject:", v14);
    PS_LocalizedStringForSystemPolicy(CFSTR("PHOTOS_PICKER_OPTIONS_FORMAT_CURRENT"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v15, v2, 0, 0, 0, 3, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "setIdentifier:", CFSTR("PhotosPickerFormatOptionCurrent"));
    objc_msgSend(v16, "setProperty:forKey:", &unk_1E4A92EE0, CFSTR("pickerFormatOptionPropertyKey"));
    objc_msgSend(v3, "addObject:", v16);
    PS_LocalizedStringForSystemPolicy(CFSTR("PHOTOS_PICKER_OPTIONS_FORMAT_COMPATIBLE"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v17, v2, 0, 0, 0, 3, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "setIdentifier:", CFSTR("PhotosPickerFormatOptionCompatible"));
    objc_msgSend(v18, "setProperty:forKey:", &unk_1E4A92EF8, CFSTR("pickerFormatOptionPropertyKey"));
    objc_msgSend(v3, "addObject:", v18);
    v19 = -[PSPhotosPickerOptionsController _formatSetting](v2, "_formatSetting");
    v20 = v14;
    if (v19)
    {
      v20 = v16;
      if (v19 != 1)
      {
        if (v19 != 2)
        {
LABEL_7:
          v21 = objc_msgSend(v3, "copy");
          specifiers = v2->super._specifiers;
          v2->super._specifiers = (NSArray *)v21;

          goto LABEL_8;
        }
        v20 = v18;
      }
    }
    objc_msgSend(v11, "setProperty:forKey:", v20, CFSTR("radioGroupCheckedSpecifier"));
    goto LABEL_7;
  }
LABEL_8:
  objc_sync_exit(v2);

  return v2->super._specifiers;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  id v15;

  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  v7 = -[PSListController indexForIndexPath:](self, "indexForIndexPath:", v6);

  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[PSListController specifierAtIndex:](self, "specifierAtIndex:", v7);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PhotosPickerFormatOptionAutomatic")) & 1) == 0)
    {
      objc_msgSend(v15, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v9, "isEqualToString:", CFSTR("PhotosPickerFormatOptionCurrent")))
      {
        objc_msgSend(v15, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("PhotosPickerFormatOptionCompatible"));

        if ((v14 & 1) == 0)
          goto LABEL_7;
        goto LABEL_6;
      }

    }
LABEL_6:
    objc_msgSend(v15, "propertyForKey:", CFSTR("pickerFormatOptionPropertyKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "unsignedIntegerValue");

    -[PSPhotosPickerOptionsController _setFormatSetting:](self, "_setFormatSetting:", v11);
    -[PSListController specifierForID:](self, "specifierForID:", CFSTR("formatGroupID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setProperty:forKey:", v15, CFSTR("radioGroupCheckedSpecifier"));
    -[PSListController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v12, 1);

LABEL_7:
  }
}

- (void)_setMetadataSetting:(id)a3 specifier:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;

  v6 = (objc_class *)MEMORY[0x1E0C99EA0];
  v7 = a4;
  v8 = a3;
  v22 = (id)objc_msgSend([v6 alloc], "initWithSuiteName:", CFSTR("com.apple.photos.picker"));
  objc_msgSend(v22, "dictionaryForKey:", CFSTR("metadata"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = (void *)MEMORY[0x1E0C9AA70];
  if (!v9)
    v9 = (void *)MEMORY[0x1E0C9AA70];
  v12 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v12, "objectForKeyedSubscript:", self->_clientIdentifier);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
    v13 = v11;
  v15 = (void *)objc_msgSend(v13, "mutableCopy");

  objc_msgSend(v7, "propertyForKey:", CFSTR("pickerOptionsPropertyKey"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x1E0CB37E8];
  v18 = objc_msgSend(v8, "BOOLValue");

  objc_msgSend(v17, "numberWithInt:", v18 ^ 1u);
  v19 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v19, v16);

  objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, self->_clientIdentifier);
  objc_msgSend(v22, "setObject:forKey:", v12, CFSTR("metadata"));
  -[PSViewController parentController](self, "parentController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  LOBYTE(v19) = objc_opt_isKindOfClass();

  if ((v19 & 1) != 0)
  {
    -[PSViewController parentController](self, "parentController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "reloadSpecifiers");

  }
}

- (id)_metadataSetting:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;

  v4 = (objc_class *)MEMORY[0x1E0C99EA0];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithSuiteName:", CFSTR("com.apple.photos.picker"));
  objc_msgSend(v6, "dictionaryForKey:", CFSTR("metadata"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", self->_clientIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "propertyForKey:", CFSTR("pickerOptionsPropertyKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11 ^ 1u);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)_setFormatSetting:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.photos.picker"));
  objc_msgSend(v9, "dictionaryForKey:", CFSTR("format"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = (void *)MEMORY[0x1E0C9AA70];
  v7 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, self->_clientIdentifier);

  objc_msgSend(v9, "setObject:forKey:", v7, CFSTR("format"));
}

- (unint64_t)_formatSetting
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.photos.picker"));
  objc_msgSend(v3, "dictionaryForKey:", CFSTR("format"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", self->_clientIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  if (v6 >= 3)
    v7 = 0;
  else
    v7 = v6;

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

@end
