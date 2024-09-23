@implementation PRPosterTitleStyleConfiguration

- (id)resolvedWithLookDefaultTitleStyleConfiguration:(id)a3 allowTitleColorUpdates:(BOOL)a4 allowTitleFontUpdates:(BOOL)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a3;
  v9 = (void *)-[PRPosterTitleStyleConfiguration mutableCopy](self, "mutableCopy");
  objc_msgSend(v8, "contentsLuminance");
  objc_msgSend(v9, "setContentsLuminance:");
  objc_msgSend(v8, "groupName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setGroupName:", v10);

  if (!a4)
  {
    objc_msgSend(v8, "effectiveTitleColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTitleColor:", v11);

  }
  if (!a5)
  {
    objc_msgSend(v8, "timeFontConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTimeFontConfiguration:", v12);

  }
  v13 = (void *)objc_msgSend(v9, "copy");

  return v13;
}

+ (PRPosterTitleStyleConfiguration)allocWithZone:(_NSZone *)a3
{
  id v5;
  objc_super v7;

  objc_opt_self();
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == a1)
    return (PRPosterTitleStyleConfiguration *)+[PRPosterTitleStyleConfiguration allocWithZone:](PRImmutablePosterTitleStyleConfiguration, "allocWithZone:", a3);
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___PRPosterTitleStyleConfiguration;
  return (PRPosterTitleStyleConfiguration *)objc_msgSendSuper2(&v7, sel_allocWithZone_, a3);
}

+ (id)titleColorForTitleContentStyle:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  PRPosterColor *v10;
  int v11;
  PRPosterColor *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v3 = a3;
  v4 = objc_msgSend(v3, "type");
  objc_msgSend(v3, "colors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "allowsVariation"))
  {
    objc_msgSend(v3, "variationAppliedColors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v8;
  }
  switch(v4)
  {
    case 0:
      v11 = objc_msgSend(v3, "isVibrant");
      v12 = [PRPosterColor alloc];
      if (v11)
        v13 = 2;
      else
        v13 = 1;
      objc_msgSend(v3, "localizedName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[PRPosterColor initWithColor:preferredStyle:localizedName:](v12, "initWithColor:preferredStyle:localizedName:", v6, v13, v14);

      break;
    case 1:
    case 2:
      +[PRPosterColor vibrantMaterialColor](PRPosterColor, "vibrantMaterialColor");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 3:
      +[PRPosterColor vibrantMonochromeColor](PRPosterColor, "vibrantMonochromeColor");
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_11:
      v10 = (PRPosterColor *)v9;
      break;
    case 4:
      objc_msgSend(v3, "lutIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[PRPosterColor initWithLUTIdentifier:]([PRPosterColor alloc], "initWithLUTIdentifier:", v15);

      break;
    default:
      v10 = 0;
      break;
  }

  return v10;
}

- (PRPosterTitleStyleConfiguration)init
{
  uint64_t v4;

  objc_msgSend((id)objc_opt_class(), "defaultContentsLuminance");
  LOBYTE(v4) = 0;
  return -[PRPosterTitleStyleConfiguration initWithTimeFontConfiguration:preferredTitleAlignment:preferredTitleLayout:titleContentStyle:timeNumberingSystem:userConfigured:contentsLuminance:alternateDateEnabled:groupName:](self, "initWithTimeFontConfiguration:preferredTitleAlignment:preferredTitleLayout:titleContentStyle:timeNumberingSystem:userConfigured:contentsLuminance:alternateDateEnabled:groupName:", 0, 0, 0, 0, 0, 0, v4, 0);
}

- (PRPosterTitleStyleConfiguration)initWithTimeFontConfiguration:(id)a3 titleContentStyle:(id)a4
{
  id v6;
  id v7;
  PRPosterTitleStyleConfiguration *v8;
  uint64_t v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "defaultContentsLuminance");
  LOBYTE(v10) = 0;
  v8 = -[PRPosterTitleStyleConfiguration initWithTimeFontConfiguration:preferredTitleAlignment:preferredTitleLayout:titleContentStyle:timeNumberingSystem:userConfigured:contentsLuminance:alternateDateEnabled:groupName:](self, "initWithTimeFontConfiguration:preferredTitleAlignment:preferredTitleLayout:titleContentStyle:timeNumberingSystem:userConfigured:contentsLuminance:alternateDateEnabled:groupName:", v7, 0, 0, v6, 0, 0, v10, 0);

  return v8;
}

- (PRPosterTitleStyleConfiguration)initWithTimeFontConfiguration:(id)a3 titleContentStyle:(id)a4 timeNumberingSystem:(id)a5
{
  id v8;
  id v9;
  id v10;
  PRPosterTitleStyleConfiguration *v11;
  uint64_t v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[PRPosterTitleStyleConfiguration defaultContentsLuminance](PRPosterTitleStyleConfiguration, "defaultContentsLuminance");
  LOBYTE(v13) = 0;
  v11 = -[PRPosterTitleStyleConfiguration initWithTimeFontConfiguration:preferredTitleAlignment:preferredTitleLayout:titleContentStyle:timeNumberingSystem:userConfigured:contentsLuminance:alternateDateEnabled:groupName:](self, "initWithTimeFontConfiguration:preferredTitleAlignment:preferredTitleLayout:titleContentStyle:timeNumberingSystem:userConfigured:contentsLuminance:alternateDateEnabled:groupName:", v10, 0, 0, v9, v8, 0, v13, 0);

  return v11;
}

- (PRPosterTitleStyleConfiguration)initWithTimeFontConfiguration:(id)a3 preferredTitleAlignment:(unint64_t)a4 preferredTitleLayout:(unint64_t)a5 titleContentStyle:(id)a6 timeNumberingSystem:(id)a7 userConfigured:(BOOL)a8 contentsLuminance:(double)a9 alternateDateEnabled:(BOOL)a10 groupName:(id)a11
{
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  PRPosterTitleStyleConfiguration *v24;
  uint64_t v26;

  v19 = a11;
  v20 = a7;
  v21 = a6;
  v22 = a3;
  objc_msgSend((id)objc_opt_class(), "titleColorForTitleContentStyle:", v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE1(v26) = a10;
  LOBYTE(v26) = a8;
  v24 = -[PRPosterTitleStyleConfiguration initWithTimeFontConfiguration:preferredTitleAlignment:preferredTitleLayout:titleContentStyle:titleColor:timeNumberingSystem:userConfigured:contentsLuminance:alternateDateEnabled:groupName:](self, "initWithTimeFontConfiguration:preferredTitleAlignment:preferredTitleLayout:titleContentStyle:titleColor:timeNumberingSystem:userConfigured:contentsLuminance:alternateDateEnabled:groupName:", v22, a4, a5, v21, v23, v20, a9, v26, v19);

  return v24;
}

- (PRPosterTitleStyleConfiguration)initWithTimeFontConfiguration:(id)a3 preferredTitleAlignment:(unint64_t)a4 preferredTitleLayout:(unint64_t)a5 titleContentStyle:(id)a6 titleColor:(id)a7 timeNumberingSystem:(id)a8 userConfigured:(BOOL)a9 contentsLuminance:(double)a10 alternateDateEnabled:(BOOL)a11 groupName:(id)a12
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  int v25;
  PRImmutablePosterTitleStyleConfiguration *v26;
  PRPosterTitleStyleConfiguration *p_super;
  uint64_t v29;
  objc_super v30;

  v19 = a3;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a12;
  objc_opt_self();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[PRPosterTitleStyleConfiguration isMemberOfClass:](self, "isMemberOfClass:", v24);

  if (v25)
  {
    LOWORD(v29) = __PAIR16__(a11, a9);
    v26 = -[PRImmutablePosterTitleStyleConfiguration initWithTimeFontConfiguration:preferredTitleAlignment:preferredTitleLayout:titleContentStyle:titleColor:timeNumberingSystem:userConfigured:contentsLuminance:alternateDateEnabled:groupName:]([PRImmutablePosterTitleStyleConfiguration alloc], "initWithTimeFontConfiguration:preferredTitleAlignment:preferredTitleLayout:titleContentStyle:titleColor:timeNumberingSystem:userConfigured:contentsLuminance:alternateDateEnabled:groupName:", v19, a4, a5, v20, v21, v22, a10, v29, v23);
  }
  else
  {
    v30.receiver = self;
    v30.super_class = (Class)PRPosterTitleStyleConfiguration;
    v26 = -[PRPosterTitleStyleConfiguration init](&v30, sel_init);
    self = &v26->super;
  }
  p_super = &v26->super;

  return p_super;
}

- (PRPosterTitleStyleConfiguration)initWithTitleStyleConfiguration:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  double v11;
  double v12;
  char v13;
  void *v14;
  PRPosterTitleStyleConfiguration *v15;
  uint64_t v17;

  v3 = a3;
  objc_msgSend(v3, "timeFontConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "preferredTitleAlignment");
  v6 = objc_msgSend(v3, "preferredTitleLayout");
  objc_msgSend(v3, "titleContentStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "titleColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeNumberingSystem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v3, "isUserConfigured");
  objc_msgSend(v3, "contentsLuminance");
  v12 = v11;
  v13 = objc_msgSend(v3, "isAlternateDateEnabled");
  objc_msgSend(v3, "groupName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  BYTE1(v17) = v13;
  LOBYTE(v17) = v10;
  v15 = -[PRPosterTitleStyleConfiguration initWithTimeFontConfiguration:preferredTitleAlignment:preferredTitleLayout:titleContentStyle:titleColor:timeNumberingSystem:userConfigured:contentsLuminance:alternateDateEnabled:groupName:](self, "initWithTimeFontConfiguration:preferredTitleAlignment:preferredTitleLayout:titleContentStyle:titleColor:timeNumberingSystem:userConfigured:contentsLuminance:alternateDateEnabled:groupName:", v4, v5, v6, v7, v8, v9, v12, v17, v14);

  return v15;
}

- (id)effectiveTimeFontWithExtensionBundle:(id)a3
{
  return -[PRPosterTitleStyleConfiguration effectiveTimeFontWithExtensionBundle:forRole:](self, "effectiveTimeFontWithExtensionBundle:forRole:", a3, CFSTR("PRPosterRoleLockScreen"));
}

- (id)effectiveTimeFontWithExtensionBundle:(id)a3 forRole:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v12;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRPosterTitleStyleConfiguration.m"), 127, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("extensionBundle != nil"));

  }
  objc_msgSend(v7, "bundleURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterTitleStyleConfiguration effectiveTimeFontWithExtensionBundleURL:forRole:](self, "effectiveTimeFontWithExtensionBundleURL:forRole:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)effectiveTimeFontWithExtensionBundleURL:(id)a3
{
  return -[PRPosterTitleStyleConfiguration effectiveTimeFontWithExtensionBundleURL:forRole:](self, "effectiveTimeFontWithExtensionBundleURL:forRole:", a3, CFSTR("PRPosterRoleLockScreen"));
}

- (id)effectiveTimeFontWithExtensionBundleURL:(id)a3 forRole:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  id v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  char v18;
  void *v20;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRPosterTitleStyleConfiguration.m"), 136, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("extensionBundleURL != nil"));

  }
  -[PRPosterTitleStyleConfiguration timeFontConfiguration](self, "timeFontConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v12 = v9;
    objc_msgSend(v12, "timeFontIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0DC1350], "pr_fontWithTimeFontIdentifier:forRole:", v13, v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "weight");
      objc_msgSend(v14, "pr_fontWithVariantWeight:forRole:", (unint64_t)v15, v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = 0;
    }

    if (!v16)
      goto LABEL_11;
  }
  else
  {
    objc_opt_self();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_opt_isKindOfClass();

    if ((v18 & 1) == 0
      || (objc_msgSend(v9, "fontWithExtensionBundleURL:", v7), (v16 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
LABEL_11:
      objc_msgSend((id)objc_opt_class(), "defaultTitleFontForRole:", v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v16;
}

- (PRPosterContentStyle)effectiveTitleContentStyle
{
  void *v3;

  -[PRPosterTitleStyleConfiguration titleContentStyle](self, "titleContentStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if ((-[PRPosterTitleStyleConfiguration isUserConfigured](self, "isUserConfigured") & 1) != 0)
    {
      v3 = 0;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "defaultTitleContentStyle");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return (PRPosterContentStyle *)v3;
}

- (id)_effectiveTitlePrivateContentStyle
{
  void *v2;
  id v3;

  -[PRPosterTitleStyleConfiguration effectiveTitleContentStyle](self, "effectiveTitleContentStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EDFFA810))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (PRPosterColor)effectiveTitleColor
{
  void *v3;

  -[PRPosterTitleStyleConfiguration titleColor](self, "titleColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if ((-[PRPosterTitleStyleConfiguration isUserConfigured](self, "isUserConfigured") & 1) != 0)
    {
      v3 = 0;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "defaultTitleColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return (PRPosterColor *)v3;
}

- (unint64_t)effectiveTitleAlignmentForText:(id)a3 withFont:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  unint64_t v9;

  v6 = a3;
  v7 = a4;
  if (-[PRPosterTitleStyleConfiguration preferredTitleAlignment](self, "preferredTitleAlignment") != 1
    || (v8 = +[PRIncomingCallMetricsProvider canApplyKashidaToText:withFont:](PRIncomingCallMetricsProvider, "canApplyKashidaToText:withFont:", v6, v7), v9 = 0, objc_msgSend(v6, "pr_isSuitableForArabicJustification"))&& v8)
  {
    v9 = -[PRPosterTitleStyleConfiguration preferredTitleAlignment](self, "preferredTitleAlignment");
  }

  return v9;
}

- (unint64_t)effectiveTitleLayoutForText:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v4 = a3;
  if (!-[PRPosterTitleStyleConfiguration prefersVerticalTitleLayout](self, "prefersVerticalTitleLayout")
    || (v5 = objc_msgSend(v4, "length"),
        v6 = +[PRIncomingCallMetricsProvider maximumVerticalTextLength](PRIncomingCallMetricsProvider, "maximumVerticalTextLength"), v7 = 0, objc_msgSend(v4, "pr_isSuitableForVerticalLayout"))&& v5 <= v6)
  {
    v7 = -[PRPosterTitleStyleConfiguration preferredTitleLayout](self, "preferredTitleLayout");
  }

  return v7;
}

- (BSUIVibrancyConfiguration)vibrancyConfiguration
{
  return (BSUIVibrancyConfiguration *)-[PRPosterTitleStyleConfiguration _vibrancyConfigurationWithExtensionBundleURL:luminanceReduced:](self, "_vibrancyConfigurationWithExtensionBundleURL:luminanceReduced:", 0, 0);
}

- (id)vibrancyConfigurationWithExtensionBundle:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "bundleURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterTitleStyleConfiguration vibrancyConfigurationWithExtensionBundleURL:](self, "vibrancyConfigurationWithExtensionBundleURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)vibrancyConfigurationWithExtensionBundle:(id)a3 luminanceReduced:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;

  v4 = a4;
  objc_msgSend(a3, "bundleURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterTitleStyleConfiguration vibrancyConfigurationWithExtensionBundleURL:luminanceReduced:](self, "vibrancyConfigurationWithExtensionBundleURL:luminanceReduced:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)vibrancyConfigurationWithExtensionBundleURL:(id)a3
{
  return -[PRPosterTitleStyleConfiguration _vibrancyConfigurationWithExtensionBundleURL:luminanceReduced:](self, "_vibrancyConfigurationWithExtensionBundleURL:luminanceReduced:", a3, 0);
}

- (id)vibrancyConfigurationWithExtensionBundleURL:(id)a3 luminanceReduced:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  if (!v6)
  {
    PRLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[PRPosterTitleStyleConfiguration vibrancyConfigurationWithExtensionBundleURL:luminanceReduced:].cold.1(v7);

  }
  -[PRPosterTitleStyleConfiguration _vibrancyConfigurationWithExtensionBundleURL:luminanceReduced:](self, "_vibrancyConfigurationWithExtensionBundleURL:luminanceReduced:", v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_vibrancyConfigurationWithExtensionBundleURL:(id)a3 luminanceReduced:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  BSUIVibrancyConfiguration *vibrancyConfiguration;
  void *v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  BSUIVibrancyConfiguration *v21;
  BSUIVibrancyConfiguration *v22;
  BSUIVibrancyConfiguration *v23;

  v4 = a4;
  v6 = a3;
  vibrancyConfiguration = self->_vibrancyConfiguration;
  -[PRPosterTitleStyleConfiguration _effectiveTitlePrivateContentStyle](self, "_effectiveTitlePrivateContentStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterTitleStyleConfiguration contentsLuminance](self, "contentsLuminance");
  v10 = PRPosterContentsBackgroundTypeForLuminance(v9);
  v11 = objc_msgSend(v8, "vibrancyEffectType");
  if (vibrancyConfiguration)
  {
    if (-[BSUIVibrancyConfiguration effectType](self->_vibrancyConfiguration, "effectType") == v11)
    {
      -[BSUIVibrancyConfiguration groupName](self->_vibrancyConfiguration, "groupName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRPosterTitleStyleConfiguration groupName](self, "groupName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(vibrancyConfiguration) = BSEqualObjects();

    }
    else
    {
      LODWORD(vibrancyConfiguration) = 0;
    }
  }
  objc_msgSend(MEMORY[0x1E0D01958], "vibrancyLUTFromPrivateContentStyle:extensionBundleURL:luminanceReduced:", v8, v6, v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!(_DWORD)vibrancyConfiguration
    || (-[BSUIVibrancyConfiguration alternativeVibrancyEffectLUT](self->_vibrancyConfiguration, "alternativeVibrancyEffectLUT"), v15 = (void *)objc_claimAutoreleasedReturnValue(), v16 = BSEqualObjects(), v15, (v16 & 1) == 0))
  {
    v17 = objc_alloc(MEMORY[0x1E0D01958]);
    v18 = BSUIVibrancyBackgroundTypeForPRPosterContentsBackgroundType(v10);
    objc_msgSend(v8, "vibrancyEffectColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRPosterTitleStyleConfiguration groupName](self, "groupName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (BSUIVibrancyConfiguration *)objc_msgSend(v17, "initWithEffectType:backgroundType:color:groupName:blendConfiguration:blendAmount:alternativeVibrancyEffectLUT:", v11, v18, v19, v20, 0, v14, 0.0);
    v22 = self->_vibrancyConfiguration;
    self->_vibrancyConfiguration = v21;

  }
  v23 = self->_vibrancyConfiguration;

  return v23;
}

- (NSString)effectiveTimeNumberingSystem
{
  void *v2;

  -[PRPosterTitleStyleConfiguration timeNumberingSystem](self, "timeNumberingSystem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend((id)objc_opt_class(), "defaultTimeNumberingSystem");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v2;
}

- (BOOL)prefersVerticalTitleLayout
{
  return PRPosterTitleLayoutIsVertical(-[PRPosterTitleStyleConfiguration preferredTitleLayout](self, "preferredTitleLayout"));
}

+ (UIFont)defaultTimeFont
{
  return (UIFont *)objc_msgSend(MEMORY[0x1E0DC1350], "pr_defaultTimeFont");
}

+ (id)defaultTitleFontForRole:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "pr_defaultTimeFontForRole:", a3);
}

+ (unint64_t)defaultTitleAlignment
{
  return 0;
}

+ (unint64_t)defaultTitleLayout
{
  return 0;
}

+ (PRPosterContentStyle)defaultTitleContentStyle
{
  return (PRPosterContentStyle *)objc_alloc_init(PRPosterContentVibrantMaterialStyle);
}

+ (PRPosterColor)defaultTitleColor
{
  return +[PRPosterColor vibrantMaterialColor](PRPosterColor, "vibrantMaterialColor");
}

+ (double)defaultContentsLuminance
{
  return 0.5;
}

- (BOOL)isEqual:(id)a3
{
  PRPosterTitleStyleConfiguration *v4;
  void *v5;
  char isKindOfClass;
  PRPosterTitleStyleConfiguration *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  double v19;
  unint64_t v20;
  double v21;
  int v22;
  int v23;
  int v25;

  v4 = (PRPosterTitleStyleConfiguration *)a3;
  if (self == v4)
  {
    LOBYTE(v23) = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v7 = v4;
      -[PRPosterTitleStyleConfiguration timeFontConfiguration](self, "timeFontConfiguration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRPosterTitleStyleConfiguration timeFontConfiguration](v7, "timeFontConfiguration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = BSEqualObjects();

      if (!v10)
        goto LABEL_10;
      v11 = -[PRPosterTitleStyleConfiguration preferredTitleAlignment](self, "preferredTitleAlignment");
      if (v11 != -[PRPosterTitleStyleConfiguration preferredTitleAlignment](v7, "preferredTitleAlignment"))
        goto LABEL_10;
      v12 = -[PRPosterTitleStyleConfiguration preferredTitleLayout](self, "preferredTitleLayout");
      if (v12 != -[PRPosterTitleStyleConfiguration preferredTitleLayout](v7, "preferredTitleLayout"))
        goto LABEL_10;
      -[PRPosterTitleStyleConfiguration titleContentStyle](self, "titleContentStyle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRPosterTitleStyleConfiguration titleContentStyle](v7, "titleContentStyle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = BSEqualObjects();

      if (!v15)
        goto LABEL_10;
      -[PRPosterTitleStyleConfiguration timeNumberingSystem](self, "timeNumberingSystem");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRPosterTitleStyleConfiguration timeNumberingSystem](v7, "timeNumberingSystem");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = BSEqualObjects();

      if (!v18)
        goto LABEL_10;
      -[PRPosterTitleStyleConfiguration contentsLuminance](self, "contentsLuminance");
      v20 = vcvtad_u64_f64(v19 * 10000.0);
      -[PRPosterTitleStyleConfiguration contentsLuminance](v7, "contentsLuminance");
      if (v20 == vcvtad_u64_f64(v21 * 10000.0)
        && (v22 = -[PRPosterTitleStyleConfiguration isUserConfigured](self, "isUserConfigured"),
            v22 == -[PRPosterTitleStyleConfiguration isUserConfigured](v7, "isUserConfigured")))
      {
        v25 = -[PRPosterTitleStyleConfiguration isAlternateDateEnabled](self, "isAlternateDateEnabled");
        v23 = v25 ^ -[PRPosterTitleStyleConfiguration isAlternateDateEnabled](v7, "isAlternateDateEnabled") ^ 1;
      }
      else
      {
LABEL_10:
        LOBYTE(v23) = 0;
      }

    }
    else
    {
      LOBYTE(v23) = 0;
    }
  }

  return v23;
}

- (BOOL)isVisiblyEqualToTitleStyleConfiguration:(id)a3
{
  PRPosterTitleStyleConfiguration *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  char v16;

  v4 = (PRPosterTitleStyleConfiguration *)a3;
  if (self == v4)
  {
    v16 = 1;
  }
  else
  {
    -[PRPosterTitleStyleConfiguration timeFontConfiguration](self, "timeFontConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRPosterTitleStyleConfiguration timeFontConfiguration](v4, "timeFontConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = BSEqualObjects();

    if (!v7)
      goto LABEL_8;
    v8 = -[PRPosterTitleStyleConfiguration preferredTitleAlignment](self, "preferredTitleAlignment");
    if (v8 != -[PRPosterTitleStyleConfiguration preferredTitleAlignment](v4, "preferredTitleAlignment"))
      goto LABEL_8;
    v9 = -[PRPosterTitleStyleConfiguration preferredTitleLayout](self, "preferredTitleLayout");
    if (v9 != -[PRPosterTitleStyleConfiguration preferredTitleLayout](v4, "preferredTitleLayout"))
      goto LABEL_8;
    -[PRPosterTitleStyleConfiguration titleContentStyle](self, "titleContentStyle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRPosterTitleStyleConfiguration titleContentStyle](v4, "titleContentStyle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = BSEqualObjects();

    if (!v12)
      goto LABEL_8;
    -[PRPosterTitleStyleConfiguration timeNumberingSystem](self, "timeNumberingSystem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRPosterTitleStyleConfiguration timeNumberingSystem](v4, "timeNumberingSystem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = BSEqualObjects();

    if (v15)
    {
      -[PRPosterTitleStyleConfiguration isAlternateDateEnabled](self, "isAlternateDateEnabled");
      -[PRPosterTitleStyleConfiguration isAlternateDateEnabled](v4, "isAlternateDateEnabled");
      v16 = BSEqualBools();
    }
    else
    {
LABEL_8:
      v16 = 0;
    }
  }

  return v16;
}

- (unint64_t)hash
{
  double v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;

  -[PRPosterTitleStyleConfiguration contentsLuminance](self, "contentsLuminance");
  v4 = vcvtad_u64_f64(v3 * 10000.0);
  -[PRPosterTitleStyleConfiguration timeFontConfiguration](self, "timeFontConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  -[PRPosterTitleStyleConfiguration titleContentStyle](self, "titleContentStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[PRPosterTitleStyleConfiguration timeNumberingSystem](self, "timeNumberingSystem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash");
  v11 = -[PRPosterTitleStyleConfiguration isUserConfigured](self, "isUserConfigured");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PRPosterTitleStyleConfiguration isAlternateDateEnabled](self, "isAlternateDateEnabled"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v6 ^ v8 ^ v10 ^ v11 ^ objc_msgSend(v12, "hash") ^ v4;

  return v13;
}

- (NSString)description
{
  id v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  PRPosterTitleStyleConfiguration *v11;
  id v12;

  v3 = objc_alloc_init(MEMORY[0x1E0D01750]);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __46__PRPosterTitleStyleConfiguration_description__block_invoke;
  v10 = &unk_1E2183900;
  v11 = self;
  v12 = v3;
  v4 = v3;
  objc_msgSend(v4, "appendProem:block:", self, &v7);
  objc_msgSend(v4, "description", v7, v8, v9, v10, v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

uint64_t __46__PRPosterTitleStyleConfiguration_description__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendDescriptionToFormatter:", *(_QWORD *)(a1 + 40));
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[PRPosterTitleStyleConfiguration initWithTitleStyleConfiguration:](+[PRPosterTitleStyleConfiguration allocWithZone:](PRMutablePosterTitleStyleConfiguration, "allocWithZone:", a3), "initWithTitleStyleConfiguration:", self);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Class)classForCoder
{
  return (Class)objc_opt_self();
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  -[PRPosterTitleStyleConfiguration timeFontConfiguration](self, "timeFontConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("timeFontConfiguration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PRPosterTitleStyleConfiguration preferredTitleAlignment](self, "preferredTitleAlignment"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("preferredTitleAlignment"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PRPosterTitleStyleConfiguration preferredTitleLayout](self, "preferredTitleLayout"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("preferredTitleLayout"));

  -[PRPosterTitleStyleConfiguration titleContentStyle](self, "titleContentStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PRPosterContentStyleSerialization dataForContentStyle:error:](PRPosterContentStyleSerialization, "dataForContentStyle:error:", v8, 0);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("titleContentStyle"));
  -[PRPosterTitleStyleConfiguration titleColor](self, "titleColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("titleColor"));

  -[PRPosterTitleStyleConfiguration timeNumberingSystem](self, "timeNumberingSystem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("timeNumberingSystem"));

  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[PRPosterTitleStyleConfiguration contentsLuminance](self, "contentsLuminance");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("contentsLuminence"));

  -[PRPosterTitleStyleConfiguration groupName](self, "groupName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("groupName"));

  objc_msgSend(v4, "encodeBool:forKey:", -[PRPosterTitleStyleConfiguration isUserConfigured](self, "isUserConfigured"), CFSTR("userConfigured"));
  objc_msgSend(v4, "encodeBool:forKey:", -[PRPosterTitleStyleConfiguration isAlternateDateEnabled](self, "isAlternateDateEnabled"), CFSTR("alternateDateEnabled"));

}

- (PRPosterTitleStyleConfiguration)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  PRPosterColor *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  double v33;
  PRPosterTitleStyleConfiguration *v34;
  double v35;
  double v36;
  char v37;
  void *v38;
  void *v39;
  PRPosterTitleStyleConfiguration *v40;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("timeFontConfiguration"));
  v9 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("titleContentStyle"));
  v10 = objc_claimAutoreleasedReturnValue();
  v46 = (void *)v10;
  v47 = (void *)v9;
  if (v10)
  {
    v48 = 0;
    +[PRPosterContentStyleSerialization contentStyleForData:error:](PRPosterContentStyleSerialization, "contentStyleForData:error:", v10, &v48);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v48;
    if (!v11)
    {
      PRLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[PRPosterTitleStyleConfiguration initWithCoder:].cold.1((uint64_t)v12, v13, v14, v15, v16, v17, v18, v19);

      objc_msgSend((id)objc_opt_class(), "defaultTitleContentStyle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    objc_opt_self();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v20, CFSTR("titleColor"));
    v21 = (PRPosterColor *)objc_claimAutoreleasedReturnValue();

    if (!v21)
    {
      objc_opt_self();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v22, CFSTR("titleColor"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
        v21 = -[PRPosterColor initWithColor:]([PRPosterColor alloc], "initWithColor:", v23);
      else
        v21 = 0;

    }
    -[PRPosterColor contentStyle](v21, "contentStyle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_opt_self();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v24, CFSTR("preferredTitleAlignment"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
    v44 = objc_msgSend(v25, "unsignedIntegerValue");
  else
    v44 = 0;
  objc_opt_self();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v26, CFSTR("preferredTitleLayout"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = v25;
  if (v27)
    v43 = objc_msgSend(v27, "unsignedIntegerValue");
  else
    v43 = 0;
  objc_opt_self();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v28, CFSTR("timeNumberingSystem"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("userConfigured"));
  objc_opt_self();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v31, CFSTR("contentsLuminence"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "defaultContentsLuminance");
  if (v32)
  {
    v34 = self;
    objc_msgSend(v32, "doubleValue");
    v36 = v35;
  }
  else
  {
    v36 = v33;
    v34 = self;
  }
  v37 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("alternateDateEnabled"));
  objc_opt_self();
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v38, CFSTR("groupName"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v42) = v37;
  v40 = -[PRPosterTitleStyleConfiguration initWithTimeFontConfiguration:preferredTitleAlignment:preferredTitleLayout:titleContentStyle:timeNumberingSystem:userConfigured:contentsLuminance:alternateDateEnabled:groupName:](v34, "initWithTimeFontConfiguration:preferredTitleAlignment:preferredTitleLayout:titleContentStyle:timeNumberingSystem:userConfigured:contentsLuminance:alternateDateEnabled:groupName:", v47, v44, v43, v11, v29, v30, v36, v42, v39);

  return v40;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  -[PRPosterTitleStyleConfiguration timeFontConfiguration](self, "timeFontConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("timeFontConfiguration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PRPosterTitleStyleConfiguration preferredTitleAlignment](self, "preferredTitleAlignment"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("preferredTitleAlignment"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PRPosterTitleStyleConfiguration preferredTitleLayout](self, "preferredTitleLayout"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("preferredTitleLayout"));

  -[PRPosterTitleStyleConfiguration titleContentStyle](self, "titleContentStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PRPosterContentStyleSerialization dataForContentStyle:error:](PRPosterContentStyleSerialization, "dataForContentStyle:error:", v8, 0);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("titleContentStyle"));
  -[PRPosterTitleStyleConfiguration titleColor](self, "titleColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("titleColor"));

  -[PRPosterTitleStyleConfiguration timeNumberingSystem](self, "timeNumberingSystem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("timeNumberingSystem"));

  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[PRPosterTitleStyleConfiguration contentsLuminance](self, "contentsLuminance");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("contentsLuminence"));

  -[PRPosterTitleStyleConfiguration groupName](self, "groupName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("groupName"));

  objc_msgSend(v4, "encodeBool:forKey:", -[PRPosterTitleStyleConfiguration isUserConfigured](self, "isUserConfigured"), CFSTR("userConfigured"));
  objc_msgSend(v4, "encodeBool:forKey:", -[PRPosterTitleStyleConfiguration isAlternateDateEnabled](self, "isAlternateDateEnabled"), CFSTR("alternateDateEnabled"));

}

- (PRPosterTitleStyleConfiguration)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  PRPosterColor *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  char v32;
  void *v33;
  void *v34;
  PRPosterTitleStyleConfiguration *v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;

  v4 = a3;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("timeFontConfiguration"));
  v6 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("titleContentStyle"));
  v7 = objc_claimAutoreleasedReturnValue();
  v42 = (void *)v7;
  v43 = (void *)v6;
  if (v7)
  {
    v44 = 0;
    +[PRPosterContentStyleSerialization contentStyleForData:error:](PRPosterContentStyleSerialization, "contentStyleForData:error:", v7, &v44);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v44;
    if (v8)
    {
      v40 = (void *)v8;
    }
    else
    {
      PRLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[PRPosterTitleStyleConfiguration initWithCoder:].cold.1((uint64_t)v9, v14, v15, v16, v17, v18, v19, v20);

      objc_msgSend((id)objc_opt_class(), "defaultTitleContentStyle");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    objc_opt_self();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, CFSTR("titleColor"));
    v11 = (PRPosterColor *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      objc_opt_self();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v12, CFSTR("titleColor"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
        v11 = -[PRPosterColor initWithColor:]([PRPosterColor alloc], "initWithColor:", v13);
      else
        v11 = 0;

    }
    -[PRPosterColor contentStyle](v11, "contentStyle");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = 0;
  }
  objc_opt_self();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v21, CFSTR("preferredTitleAlignment"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
    v39 = objc_msgSend(v22, "unsignedIntegerValue");
  else
    v39 = 0;
  objc_opt_self();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v23, CFSTR("preferredTitleLayout"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = v9;
  if (v24)
    v38 = objc_msgSend(v24, "unsignedIntegerValue");
  else
    v38 = 0;
  objc_opt_self();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v25, CFSTR("timeNumberingSystem"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("userConfigured"));
  objc_opt_self();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v28, CFSTR("contentsLuminence"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "defaultContentsLuminance");
  if (v29)
    objc_msgSend(v29, "doubleValue");
  v31 = v30;
  v32 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("alternateDateEnabled"));
  objc_opt_self();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v33, CFSTR("groupName"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v37) = v32;
  v35 = -[PRPosterTitleStyleConfiguration initWithTimeFontConfiguration:preferredTitleAlignment:preferredTitleLayout:titleContentStyle:timeNumberingSystem:userConfigured:contentsLuminance:alternateDateEnabled:groupName:](self, "initWithTimeFontConfiguration:preferredTitleAlignment:preferredTitleLayout:titleContentStyle:timeNumberingSystem:userConfigured:contentsLuminance:alternateDateEnabled:groupName:", v43, v39, v38, v40, v26, v27, v31, v37, v34);

  return v35;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v15 = a3;
  -[PRPosterTitleStyleConfiguration timeFontConfiguration](self, "timeFontConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v15, "appendObject:withName:", v4, CFSTR("timeFontConfiguration"));

  v6 = (id)objc_msgSend(v15, "appendInteger:withName:", -[PRPosterTitleStyleConfiguration preferredTitleAlignment](self, "preferredTitleAlignment"), CFSTR("preferredTitleAlignment"));
  v7 = (id)objc_msgSend(v15, "appendInteger:withName:", -[PRPosterTitleStyleConfiguration preferredTitleLayout](self, "preferredTitleLayout"), CFSTR("preferredTitleLayout"));
  -[PRPosterTitleStyleConfiguration titleContentStyle](self, "titleContentStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v15, "appendObject:withName:", v8, CFSTR("titleContentStyle"));

  -[PRPosterTitleStyleConfiguration timeNumberingSystem](self, "timeNumberingSystem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v15, "appendObject:withName:", v10, CFSTR("timeNumberingSystem"));

  -[PRPosterTitleStyleConfiguration contentsLuminance](self, "contentsLuminance");
  v12 = (id)objc_msgSend(v15, "appendDouble:withName:decimalPrecision:", CFSTR("contentsLuminance"), 5);
  v13 = (id)objc_msgSend(v15, "appendBool:withName:", -[PRPosterTitleStyleConfiguration isUserConfigured](self, "isUserConfigured"), CFSTR("userConfigured"));
  v14 = (id)objc_msgSend(v15, "appendBool:withName:", -[PRPosterTitleStyleConfiguration isAlternateDateEnabled](self, "isAlternateDateEnabled"), CFSTR("isAlternateDateEnabled"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vibrancyConfiguration, 0);
}

- (PRPosterTitleStyleConfiguration)initWithTimeFontConfiguration:(id)a3 titleColor:(id)a4
{
  id v6;
  id v7;
  PRPosterTitleStyleConfiguration *v8;
  uint64_t v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "defaultContentsLuminance");
  LOBYTE(v10) = 0;
  v8 = -[PRPosterTitleStyleConfiguration initWithTimeFontConfiguration:preferredTitleAlignment:preferredTitleLayout:titleColor:timeNumberingSystem:userConfigured:contentsLuminance:alternateDateEnabled:groupName:](self, "initWithTimeFontConfiguration:preferredTitleAlignment:preferredTitleLayout:titleColor:timeNumberingSystem:userConfigured:contentsLuminance:alternateDateEnabled:groupName:", v7, 0, 0, v6, 0, 0, v10, 0);

  return v8;
}

- (PRPosterTitleStyleConfiguration)initWithTimeFontConfiguration:(id)a3 titleColor:(id)a4 timeNumberingSystem:(id)a5
{
  id v8;
  id v9;
  id v10;
  PRPosterTitleStyleConfiguration *v11;
  uint64_t v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[PRPosterTitleStyleConfiguration defaultContentsLuminance](PRPosterTitleStyleConfiguration, "defaultContentsLuminance");
  LOBYTE(v13) = 0;
  v11 = -[PRPosterTitleStyleConfiguration initWithTimeFontConfiguration:preferredTitleAlignment:preferredTitleLayout:titleColor:timeNumberingSystem:userConfigured:contentsLuminance:alternateDateEnabled:groupName:](self, "initWithTimeFontConfiguration:preferredTitleAlignment:preferredTitleLayout:titleColor:timeNumberingSystem:userConfigured:contentsLuminance:alternateDateEnabled:groupName:", v10, 0, 0, v9, v8, 0, v13, 0);

  return v11;
}

- (PRPosterTitleStyleConfiguration)initWithTimeFontConfiguration:(id)a3 preferredTitleAlignment:(unint64_t)a4 preferredTitleLayout:(unint64_t)a5 titleColor:(id)a6 timeNumberingSystem:(id)a7 userConfigured:(BOOL)a8 contentsLuminance:(double)a9 alternateDateEnabled:(BOOL)a10 groupName:(id)a11
{
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  PRPosterTitleStyleConfiguration *v24;
  uint64_t v26;

  v19 = a11;
  v20 = a7;
  v21 = a6;
  v22 = a3;
  objc_msgSend(v21, "contentStyle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE1(v26) = a10;
  LOBYTE(v26) = a8;
  v24 = -[PRPosterTitleStyleConfiguration initWithTimeFontConfiguration:preferredTitleAlignment:preferredTitleLayout:titleContentStyle:titleColor:timeNumberingSystem:userConfigured:contentsLuminance:alternateDateEnabled:groupName:](self, "initWithTimeFontConfiguration:preferredTitleAlignment:preferredTitleLayout:titleContentStyle:titleColor:timeNumberingSystem:userConfigured:contentsLuminance:alternateDateEnabled:groupName:", v22, a4, a5, v23, v21, v20, a9, v26, v19);

  return v24;
}

- (void)vibrancyConfigurationWithExtensionBundleURL:(os_log_t)log luminanceReduced:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18B634000, log, OS_LOG_TYPE_FAULT, "Fault: Attempting to fetch vibrancy configuration for nil URL", v1, 2u);
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7_0(&dword_18B634000, a2, a3, "Content style deserialization failed with error: %{public}@, falling back to defaultTitleContentStyle", a5, a6, a7, a8, 2u);
}

@end
