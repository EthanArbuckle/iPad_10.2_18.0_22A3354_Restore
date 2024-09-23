@implementation SSShortcutResultBuilder

+ (id)bundleId
{
  return CFSTR("com.apple.shortcuts");
}

+ (BOOL)supportsResult:(id)a3
{
  id v4;
  char v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___SSShortcutResultBuilder;
  if ((objc_msgSendSuper2(&v9, sel_supportsResult_, v4) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v4, "resultBundleId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "bundleId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isEqualToString:", v7);

  }
  return v5;
}

- (SSShortcutResultBuilder)initWithResult:(id)a3
{
  id v4;
  SSShortcutResultBuilder *v5;
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
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)SSShortcutResultBuilder;
  v5 = -[SSResultBuilder initWithResult:](&v32, sel_initWithResult_, v4);
  if (v5)
  {
    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA5F90], objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6058], objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSShortcutResultBuilder setIsBackgroundRunnable:](v5, "setIsBackgroundRunnable:", objc_msgSend(v7, "BOOLValue"));

    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v6;
    else
      v9 = 0;
    -[SSShortcutResultBuilder setAlternateNames:](v5, "setAlternateNames:", v9);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6158], objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSShortcutResultBuilder setName:](v5, "setName:", v10);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6150], objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSShortcutResultBuilder setNumberOfActionsString:](v5, "setNumberOfActionsString:", v11);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6730], objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSShortcutResultBuilder setPunchoutLabel:](v5, "setPunchoutLabel:", v12);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6838], objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSShortcutResultBuilder setSettingsPreference:](v5, "setSettingsPreference:", v13);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6830], objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSShortcutResultBuilder setActionIdentifier:](v5, "setActionIdentifier:", v14);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6198], objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSShortcutResultBuilder setDomainIdentifier:](v5, "setDomainIdentifier:", v15);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6878], objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSShortcutResultBuilder setLnPropertyIdentifier:](v5, "setLnPropertyIdentifier:", v16);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6880], objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSShortcutResultBuilder setPrimaryPhrase:](v5, "setPrimaryPhrase:", v17);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6840], objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSShortcutResultBuilder setBiomeStreamIdentifier:](v5, "setBiomeStreamIdentifier:", v18);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6858], objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
      v21 = objc_msgSend(v19, "unsignedIntegerValue");
    else
      v21 = 0;
    -[SSShortcutResultBuilder setEntityThumbnailDisplayStyle:](v5, "setEntityThumbnailDisplayStyle:", v21);
    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6888], objc_opt_class());
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
      v24 = objc_msgSend(v22, "unsignedIntegerValue");
    else
      v24 = 0;
    -[SSShortcutResultBuilder setEntityBadgeType:](v5, "setEntityBadgeType:", v24);
    -[SSResultBuilder relatedAppBundleIdentifier](v5, "relatedAppBundleIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v25, "isEqualToString:", CFSTR("com.apple.mobiletimer")) & 1) != 0)
    {
      -[SSShortcutResultBuilder domainIdentifier](v5, "domainIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)MEMORY[0x1E0DC7DD0];
      -[SSResultBuilder relatedAppBundleIdentifier](v5, "relatedAppBundleIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "spotlightDomainIdentifierForBundleIdentifier:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSShortcutResultBuilder setIsAlarmResult:](v5, "setIsAlarmResult:", objc_msgSend(v26, "isEqual:", v29));

    }
    else
    {
      -[SSShortcutResultBuilder setIsAlarmResult:](v5, "setIsAlarmResult:", 0);
    }

    -[SSShortcutResultBuilder domainIdentifier](v5, "domainIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSShortcutResultBuilder setIsCustomAppAttributedShortcut:](v5, "setIsCustomAppAttributedShortcut:", objc_msgSend(v30, "isEqualToString:", *MEMORY[0x1E0DC8018]));

  }
  return v5;
}

- (id)buildResult
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSShortcutResultBuilder;
  -[SSResultBuilder buildResult](&v6, sel_buildResult);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSShortcutResultBuilder userActivityRequiredString](self, "userActivityRequiredString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserActivityRequiredString:", v4);

  objc_msgSend(v3, "setType:", 20);
  return v3;
}

- (id)buildTitle
{
  void *v3;
  void *v4;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v10;

  -[SSResultBuilder result](self, "result");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "shouldUseCompactDisplay")
    && !-[SSShortcutResultBuilder isCustomAppAttributedShortcut](self, "isCustomAppAttributedShortcut"))
  {
    -[SSShortcutResultBuilder primaryPhrase](self, "primaryPhrase");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    if (v7)
    {
      v8 = (void *)MEMORY[0x1E0D8C660];
      -[SSShortcutResultBuilder primaryPhrase](self, "primaryPhrase");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "textWithString:", v9);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      return v4;
    }
  }
  else
  {

  }
  v10.receiver = self;
  v10.super_class = (Class)SSShortcutResultBuilder;
  -[SSResultBuilder buildTitle](&v10, sel_buildTitle);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaxLines:", 2);
  return v4;
}

- (id)buildStandardThumbnail
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  -[SSShortcutResultBuilder lnPropertyIdentifier](self, "lnPropertyIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)objc_opt_new();
    -[SSShortcutResultBuilder lnPropertyIdentifier](self, "lnPropertyIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLnPropertyIdentifier:", v5);

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SSShortcutResultBuilder;
    -[SSResultBuilder buildThumbnail](&v7, sel_buildThumbnail);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "setCornerRoundingStyle:", 4 * (-[SSShortcutResultBuilder entityThumbnailDisplayStyle](self, "entityThumbnailDisplayStyle") == 1));
  return v4;
}

- (id)buildBadgingImageWithThumbnail:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  -[SSShortcutResultBuilder biomeStreamIdentifier](self, "biomeStreamIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SSShortcutResultBuilder;
    -[SSResultBuilder buildBadgingImageWithThumbnail:](&v9, sel_buildBadgingImageWithThumbnail_, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)buildCompactThumbnail
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[SSResultBuilder relatedAppBundleIdentifier](self, "relatedAppBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBundleIdentifier:", v4);

  return v3;
}

- (id)buildThumbnail
{
  void *v3;
  BOOL v4;
  void *v5;

  -[SSResultBuilder result](self, "result");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "shouldUseCompactDisplay"))
  {

    goto LABEL_5;
  }
  v4 = -[SSShortcutResultBuilder isCustomAppAttributedShortcut](self, "isCustomAppAttributedShortcut");

  if (v4)
  {
LABEL_5:
    -[SSShortcutResultBuilder buildStandardThumbnail](self, "buildStandardThumbnail");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    return v5;
  }
  -[SSShortcutResultBuilder buildCompactThumbnail](self, "buildCompactThumbnail");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  return v5;
}

- (id)buildDescriptions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D8C660];
  -[SSShortcutResultBuilder numberOfActionsString](self, "numberOfActionsString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)buildFootnote
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[SSResultBuilder result](self, "result");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "relatedAppIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0D8C660];
    -[SSShortcutResultBuilder alternateNames](self, "alternateNames");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textWithString:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)buildCommand
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  if (-[SSShortcutResultBuilder resultShadowsSettingResult](self, "resultShadowsSettingResult"))
  {
    v3 = (void *)objc_opt_new();
    -[SSShortcutResultBuilder settingsPreference](self, "settingsPreference");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setCoreSpotlightIdentifier:", v4);

    objc_msgSend(v3, "setApplicationBundleIdentifier:", CFSTR("com.apple.Preferences"));
  }
  else if (-[SSShortcutResultBuilder isAlarmResult](self, "isAlarmResult"))
  {
    if (buildCommand_onceToken != -1)
      dispatch_once(&buildCommand_onceToken, &__block_literal_global_8);
    v3 = (void *)objc_opt_new();
    -[SSResultBuilder result](self, "result");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "relatedAppIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setApplicationBundleIdentifier:", v6);

    objc_msgSend(v3, "setUserActivityRequiredString:", buildCommand_alarmToggleUserActivityString);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SSShortcutResultBuilder;
    -[SSResultBuilder buildCommand](&v8, sel_buildCommand);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

void __39__SSShortcutResultBuilder_buildCommand__block_invoke()
{
  id v0;

  v0 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5920]), "initWithActivityType:", CFSTR("com.apple.clock.alarm"));
  objc_msgSend(v0, "_createUserActivityStringsWithOptions:completionHandler:", 0, &__block_literal_global_62);

}

void __39__SSShortcutResultBuilder_buildCommand__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)&buildCommand_alarmToggleUserActivityString, a2);
}

- (id)buildButtonItems
{
  void *v3;
  void *v4;
  void *v5;
  void **v6;
  void *v7;
  void *v8;
  objc_super v10;
  objc_super v11;
  objc_super v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (-[SSShortcutResultBuilder resultShadowsSettingResult](self, "resultShadowsSettingResult"))
  {
    v3 = (void *)objc_opt_new();
    v12.receiver = self;
    v12.super_class = (Class)SSShortcutResultBuilder;
    -[SSResultBuilder buildCommand](&v12, sel_buildCommand);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setCommand:", v4);

    v14[0] = v3;
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = (void **)v14;
LABEL_5:
    objc_msgSend(v5, "arrayWithObjects:count:", v6, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return v8;
  }
  if (-[SSShortcutResultBuilder isAlarmResult](self, "isAlarmResult"))
  {
    v3 = (void *)objc_opt_new();
    v11.receiver = self;
    v11.super_class = (Class)SSShortcutResultBuilder;
    -[SSResultBuilder buildCommand](&v11, sel_buildCommand);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setCommand:", v7);

    v13 = v3;
    v5 = (void *)MEMORY[0x1E0C99D20];
    v6 = &v13;
    goto LABEL_5;
  }
  v10.receiver = self;
  v10.super_class = (Class)SSShortcutResultBuilder;
  -[SSResultBuilder buildButtonItems](&v10, sel_buildButtonItems);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)buildButtonItemsAreTrailing
{
  objc_super v4;

  if (-[SSShortcutResultBuilder resultShadowsSettingResult](self, "resultShadowsSettingResult"))
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)SSShortcutResultBuilder;
  return -[SSResultBuilder buildButtonItemsAreTrailing](&v4, sel_buildButtonItemsAreTrailing);
}

- (id)buildTrailingThumbnail
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  id v14;
  char isKindOfClass;

  -[SSResultBuilder result](self, "result");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSShortcutResultBuilder buildStandardThumbnail](self, "buildStandardThumbnail");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSResultBuilder result](self, "result");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "shouldUseCompactDisplay")
    && !-[SSShortcutResultBuilder isCustomAppAttributedShortcut](self, "isCustomAppAttributedShortcut"))
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v14 = v4;
      v12 = v14;
      if (v14)
        goto LABEL_15;
    }
  }
  else
  {

  }
  objc_msgSend(v3, "applicationBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.shortcuts")))
  {

  }
  else
  {
    objc_msgSend(v3, "resultBundleId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.shortcuts"));

    if (!v8)
    {
      v14 = 0;
      v12 = v4;
      goto LABEL_15;
    }
  }
  -[SSResultBuilder result](self, "result");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueForAttribute:withType:", *MEMORY[0x1E0CA6828], objc_opt_class());
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_opt_new();
  v12 = v11;
  if (v10)
    v13 = v10;
  else
    v13 = CFSTR("app.2.stack.3d.fill");
  objc_msgSend(v11, "setSymbolName:", v13);
  objc_msgSend(v12, "setIsTemplate:", 1);

  v14 = 0;
LABEL_15:

  return v12;
}

- (id)buildDetailedRowCardSection
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSShortcutResultBuilder;
  -[SSResultBuilder buildDetailedRowCardSection](&v6, sel_buildDetailedRowCardSection);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSShortcutResultBuilder actionIdentifier](self, "actionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCommandDetail:", v4);

  objc_msgSend(v3, "setButtonItemsAreTrailing:", 1);
  return v3;
}

- (id)buildAppTopHitEntityCardSection
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  id v10;
  unint64_t v11;
  __CFString **v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SSShortcutResultBuilder;
  -[SSResultBuilder buildAppTopHitEntityCardSection](&v16, sel_buildAppTopHitEntityCardSection);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "thumbnail");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || -[SSShortcutResultBuilder isCustomAppAttributedShortcut](self, "isCustomAppAttributedShortcut")
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[SSResultBuilder result](self, "result");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForAttribute:withType:", *MEMORY[0x1E0CA6828], objc_opt_class());
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)objc_opt_new();
    v8 = v7;
    if (v6)
      v9 = v6;
    else
      v9 = CFSTR("app.2.stack.3d.fill");
    objc_msgSend(v7, "setSymbolName:", v9);

    v4 = v8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v4;
    objc_msgSend(v10, "setIsTemplate:", 1);
    objc_msgSend(v10, "setPunchThroughBackground:", 1);
    objc_msgSend(v10, "setPrimaryColor:", 7);
    objc_msgSend(v10, "setCornerRoundingStyle:", 4);

  }
  v11 = -[SSShortcutResultBuilder entityBadgeType](self, "entityBadgeType");
  if (v11 == 1)
  {
    v12 = SSPhoneBundleIdentifier;
    goto LABEL_14;
  }
  if (v11 == 2)
  {
    v12 = SSFaceTimeBundleIdentifier;
LABEL_14:
    v13 = (void *)objc_opt_new();
    objc_msgSend(v13, "setBundleIdentifier:", *v12);
    objc_msgSend(v4, "setBadgingImage:", v13);

  }
  objc_msgSend(v3, "setThumbnail:", v4);
  -[SSShortcutResultBuilder actionIdentifier](self, "actionIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCommandDetail:", v14);

  return v3;
}

- (BOOL)resultShadowsSettingResult
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[SSShortcutResultBuilder settingsPreference](self, "settingsPreference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    -[SSResultBuilder result](self, "result");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "relatedAppIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.Preferences"));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isBackgroundRunnable
{
  return self->_isBackgroundRunnable;
}

- (void)setIsBackgroundRunnable:(BOOL)a3
{
  self->_isBackgroundRunnable = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSArray)alternateNames
{
  return self->_alternateNames;
}

- (void)setAlternateNames:(id)a3
{
  objc_storeStrong((id *)&self->_alternateNames, a3);
}

- (NSString)numberOfActionsString
{
  return self->_numberOfActionsString;
}

- (void)setNumberOfActionsString:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfActionsString, a3);
}

- (NSString)punchoutLabel
{
  return self->_punchoutLabel;
}

- (void)setPunchoutLabel:(id)a3
{
  objc_storeStrong((id *)&self->_punchoutLabel, a3);
}

- (NSString)userActivityRequiredString
{
  return self->_userActivityRequiredString;
}

- (void)setUserActivityRequiredString:(id)a3
{
  objc_storeStrong((id *)&self->_userActivityRequiredString, a3);
}

- (NSString)settingsPreference
{
  return self->_settingsPreference;
}

- (void)setSettingsPreference:(id)a3
{
  objc_storeStrong((id *)&self->_settingsPreference, a3);
}

- (unint64_t)entityThumbnailDisplayStyle
{
  return self->_entityThumbnailDisplayStyle;
}

- (void)setEntityThumbnailDisplayStyle:(unint64_t)a3
{
  self->_entityThumbnailDisplayStyle = a3;
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (void)setActionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_actionIdentifier, a3);
}

- (NSString)domainIdentifier
{
  return self->_domainIdentifier;
}

- (void)setDomainIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_domainIdentifier, a3);
}

- (NSString)lnPropertyIdentifier
{
  return self->_lnPropertyIdentifier;
}

- (void)setLnPropertyIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_lnPropertyIdentifier, a3);
}

- (NSString)primaryPhrase
{
  return self->_primaryPhrase;
}

- (void)setPrimaryPhrase:(id)a3
{
  objc_storeStrong((id *)&self->_primaryPhrase, a3);
}

- (NSString)biomeStreamIdentifier
{
  return self->_biomeStreamIdentifier;
}

- (void)setBiomeStreamIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_biomeStreamIdentifier, a3);
}

- (unint64_t)entityBadgeType
{
  return self->_entityBadgeType;
}

- (void)setEntityBadgeType:(unint64_t)a3
{
  self->_entityBadgeType = a3;
}

- (BOOL)isAlarmResult
{
  return self->_isAlarmResult;
}

- (void)setIsAlarmResult:(BOOL)a3
{
  self->_isAlarmResult = a3;
}

- (BOOL)isCustomAppAttributedShortcut
{
  return self->_isCustomAppAttributedShortcut;
}

- (void)setIsCustomAppAttributedShortcut:(BOOL)a3
{
  self->_isCustomAppAttributedShortcut = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biomeStreamIdentifier, 0);
  objc_storeStrong((id *)&self->_primaryPhrase, 0);
  objc_storeStrong((id *)&self->_lnPropertyIdentifier, 0);
  objc_storeStrong((id *)&self->_domainIdentifier, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
  objc_storeStrong((id *)&self->_settingsPreference, 0);
  objc_storeStrong((id *)&self->_userActivityRequiredString, 0);
  objc_storeStrong((id *)&self->_punchoutLabel, 0);
  objc_storeStrong((id *)&self->_numberOfActionsString, 0);
  objc_storeStrong((id *)&self->_alternateNames, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
