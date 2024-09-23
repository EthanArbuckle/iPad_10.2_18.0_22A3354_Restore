@implementation PUITextLayoutConfiguration

+ (id)allocWithZone:(_NSZone *)a3
{
  id v5;
  objc_super v7;

  objc_opt_self();
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == a1)
    return +[PUITextLayoutConfiguration allocWithZone:](PUIImmutableTextLayoutConfiguration, "allocWithZone:", a3);
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___PUITextLayoutConfiguration;
  return objc_msgSendSuper2(&v7, sel_allocWithZone_, a3);
}

+ (id)styleColorForStyle:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  PUIStyleColor *v10;
  int v11;
  PUIStyleColor *v12;
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
      v12 = [PUIStyleColor alloc];
      if (v11)
        v13 = 2;
      else
        v13 = 1;
      objc_msgSend(v3, "localizedName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[PUIStyleColor initWithColor:preferredStyle:localizedName:](v12, "initWithColor:preferredStyle:localizedName:", v6, v13, v14);

      break;
    case 1:
    case 2:
      +[PUIStyleColor vibrantMaterialColor](PUIStyleColor, "vibrantMaterialColor");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 3:
      +[PUIStyleColor vibrantMonochromeColor](PUIStyleColor, "vibrantMonochromeColor");
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_11:
      v10 = (PUIStyleColor *)v9;
      break;
    case 4:
      objc_msgSend(v3, "LUTIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[PUIStyleColor initWithLUTIdentifier:]([PUIStyleColor alloc], "initWithLUTIdentifier:", v15);

      break;
    default:
      v10 = 0;
      break;
  }

  return v10;
}

- (PUITextLayoutConfiguration)init
{
  uint64_t v4;

  objc_msgSend((id)objc_opt_class(), "defaultContentsLuminance");
  LOBYTE(v4) = 0;
  return -[PUITextLayoutConfiguration initWithFontConfiguration:preferredAlignment:preferredLayout:style:numberingSystemType:userConfigured:contentsLuminance:alternateDateEnabled:groupName:](self, "initWithFontConfiguration:preferredAlignment:preferredLayout:style:numberingSystemType:userConfigured:contentsLuminance:alternateDateEnabled:groupName:", 0, 0, 0, 0, 0, 0, v4, 0);
}

- (PUITextLayoutConfiguration)initWithFontConfiguration:(id)a3 style:(id)a4
{
  id v6;
  id v7;
  PUITextLayoutConfiguration *v8;
  uint64_t v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "defaultContentsLuminance");
  LOBYTE(v10) = 0;
  v8 = -[PUITextLayoutConfiguration initWithFontConfiguration:preferredAlignment:preferredLayout:style:numberingSystemType:userConfigured:contentsLuminance:alternateDateEnabled:groupName:](self, "initWithFontConfiguration:preferredAlignment:preferredLayout:style:numberingSystemType:userConfigured:contentsLuminance:alternateDateEnabled:groupName:", v7, 0, 0, v6, 0, 0, v10, 0);

  return v8;
}

- (PUITextLayoutConfiguration)initWithFontConfiguration:(id)a3 style:(id)a4 numberingSystemType:(id)a5
{
  id v8;
  id v9;
  id v10;
  PUITextLayoutConfiguration *v11;
  uint64_t v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[PUITextLayoutConfiguration defaultContentsLuminance](PUITextLayoutConfiguration, "defaultContentsLuminance");
  LOBYTE(v13) = 0;
  v11 = -[PUITextLayoutConfiguration initWithFontConfiguration:preferredAlignment:preferredLayout:style:numberingSystemType:userConfigured:contentsLuminance:alternateDateEnabled:groupName:](self, "initWithFontConfiguration:preferredAlignment:preferredLayout:style:numberingSystemType:userConfigured:contentsLuminance:alternateDateEnabled:groupName:", v10, 0, 0, v9, v8, 0, v13, 0);

  return v11;
}

- (PUITextLayoutConfiguration)initWithFontConfiguration:(id)a3 preferredAlignment:(unint64_t)a4 preferredLayout:(unint64_t)a5 style:(id)a6 numberingSystemType:(id)a7 userConfigured:(BOOL)a8 contentsLuminance:(double)a9 alternateDateEnabled:(BOOL)a10 groupName:(id)a11
{
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  PUITextLayoutConfiguration *v24;
  uint64_t v26;

  v19 = a11;
  v20 = a7;
  v21 = a6;
  v22 = a3;
  objc_msgSend((id)objc_opt_class(), "styleColorForStyle:", v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE1(v26) = a10;
  LOBYTE(v26) = a8;
  v24 = -[PUITextLayoutConfiguration initWithFontConfiguration:preferredAlignment:preferredLayout:style:styleColor:numberingSystemType:userConfigured:contentsLuminance:alternateDateEnabled:groupName:](self, "initWithFontConfiguration:preferredAlignment:preferredLayout:style:styleColor:numberingSystemType:userConfigured:contentsLuminance:alternateDateEnabled:groupName:", v22, a4, a5, v21, v23, v20, a9, v26, v19);

  return v24;
}

- (PUITextLayoutConfiguration)initWithFontConfiguration:(id)a3 preferredAlignment:(unint64_t)a4 preferredLayout:(unint64_t)a5 style:(id)a6 styleColor:(id)a7 numberingSystemType:(id)a8 userConfigured:(BOOL)a9 contentsLuminance:(double)a10 alternateDateEnabled:(BOOL)a11 groupName:(id)a12
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  int v25;
  PUIImmutableTextLayoutConfiguration *v26;
  PUITextLayoutConfiguration *p_super;
  uint64_t v29;
  objc_super v30;

  v19 = a3;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a12;
  objc_opt_self();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[PUITextLayoutConfiguration isMemberOfClass:](self, "isMemberOfClass:", v24);

  if (v25)
  {
    LOWORD(v29) = __PAIR16__(a11, a9);
    v26 = -[PUIImmutableTextLayoutConfiguration initWithFontConfiguration:preferredAlignment:preferredLayout:style:styleColor:numberingSystemType:userConfigured:contentsLuminance:alternateDateEnabled:groupName:]([PUIImmutableTextLayoutConfiguration alloc], "initWithFontConfiguration:preferredAlignment:preferredLayout:style:styleColor:numberingSystemType:userConfigured:contentsLuminance:alternateDateEnabled:groupName:", v19, a4, a5, v20, v21, v22, a10, v29, v23);
  }
  else
  {
    v30.receiver = self;
    v30.super_class = (Class)PUITextLayoutConfiguration;
    v26 = -[PUITextLayoutConfiguration init](&v30, sel_init);
    self = &v26->super;
  }
  p_super = &v26->super;

  return p_super;
}

- (PUITextLayoutConfiguration)initWithTextLayoutConfiguration:(id)a3
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
  PUITextLayoutConfiguration *v15;
  uint64_t v17;

  v3 = a3;
  objc_msgSend(v3, "fontConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "preferredAlignment");
  v6 = objc_msgSend(v3, "preferredLayout");
  objc_msgSend(v3, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "styleColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberingSystemType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v3, "isUserConfigured");
  objc_msgSend(v3, "contentsLuminance");
  v12 = v11;
  v13 = objc_msgSend(v3, "isAlternateDateEnabled");
  objc_msgSend(v3, "groupName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  BYTE1(v17) = v13;
  LOBYTE(v17) = v10;
  v15 = -[PUITextLayoutConfiguration initWithFontConfiguration:preferredAlignment:preferredLayout:style:styleColor:numberingSystemType:userConfigured:contentsLuminance:alternateDateEnabled:groupName:](self, "initWithFontConfiguration:preferredAlignment:preferredLayout:style:styleColor:numberingSystemType:userConfigured:contentsLuminance:alternateDateEnabled:groupName:", v4, v5, v6, v7, v8, v9, v12, v17, v14);

  return v15;
}

- (id)effectiveFontWithExtensionBundle:(id)a3
{
  return -[PUITextLayoutConfiguration effectiveFontWithExtensionBundle:forRole:](self, "effectiveFontWithExtensionBundle:forRole:", a3, *MEMORY[0x24BE74D68]);
}

- (id)effectiveFontWithExtensionBundle:(id)a3 forRole:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a3, "bundleURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUITextLayoutConfiguration effectiveFontWithExtensionBundleURL:forRole:](self, "effectiveFontWithExtensionBundleURL:forRole:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)effectiveFontWithExtensionBundleURL:(id)a3
{
  return -[PUITextLayoutConfiguration effectiveFontWithExtensionBundleURL:forRole:](self, "effectiveFontWithExtensionBundleURL:forRole:", a3, *MEMORY[0x24BE74D68]);
}

- (id)effectiveFontWithExtensionBundleURL:(id)a3 forRole:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  id v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  char v17;

  v6 = a3;
  v7 = a4;
  -[PUITextLayoutConfiguration fontConfiguration](self, "fontConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v11 = v8;
    objc_msgSend(v11, "fontIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(MEMORY[0x24BDF6A70], "pui_UIFontWithPUIFontIdentifier:forRole:", v12, v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "weight");
      objc_msgSend(v13, "pui_UIFontWithVariantWeight:forRole:", (unint64_t)v14, v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = 0;
    }

    if (!v15)
      goto LABEL_9;
  }
  else
  {
    objc_opt_self();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_opt_isKindOfClass();

    if ((v17 & 1) == 0
      || (objc_msgSend(v8, "fontWithExtensionBundleURL:", v6), (v15 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
LABEL_9:
      objc_msgSend((id)objc_opt_class(), "defaultFontForRole:", v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v15;
}

- (PUIStyle)effectiveStyle
{
  void *v3;

  -[PUITextLayoutConfiguration style](self, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if ((-[PUITextLayoutConfiguration isUserConfigured](self, "isUserConfigured") & 1) != 0)
    {
      v3 = 0;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "defaultStyle");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return (PUIStyle *)v3;
}

- (id)_effectivePrivateStyle
{
  void *v2;
  id v3;

  -[PUITextLayoutConfiguration effectiveStyle](self, "effectiveStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_25738AA78))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (id)effectiveStyleColor
{
  void *v3;

  -[PUITextLayoutConfiguration styleColor](self, "styleColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if ((-[PUITextLayoutConfiguration isUserConfigured](self, "isUserConfigured") & 1) != 0)
    {
      v3 = 0;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "defaultStyleColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v3;
}

- (unint64_t)effectiveAlignmentForText:(id)a3 withFont:(id)a4
{
  id v6;
  id v7;
  int v8;
  unint64_t v9;

  v6 = a3;
  v7 = a4;
  if (-[PUITextLayoutConfiguration preferredAlignment](self, "preferredAlignment") != 1
    || (v8 = objc_msgSend(getPRIncomingCallMetricsProviderClass(), "canApplyKashidaToText:withFont:", v6, v7),
        v9 = 0,
        objc_msgSend(v6, "pui_isSuitableForArabicJustification"))
    && v8)
  {
    v9 = -[PUITextLayoutConfiguration preferredAlignment](self, "preferredAlignment");
  }

  return v9;
}

- (unint64_t)effectiveLayoutForText:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v4 = a3;
  if (!-[PUITextLayoutConfiguration prefersVerticalTitleLayout](self, "prefersVerticalTitleLayout")
    || (v5 = objc_msgSend(v4, "length"),
        v6 = objc_msgSend(getPRIncomingCallMetricsProviderClass(), "maximumVerticalTextLength"),
        v7 = 0,
        objc_msgSend(v4, "pui_isSuitableForVerticalLayout"))
    && v5 <= v6)
  {
    v7 = -[PUITextLayoutConfiguration preferredLayout](self, "preferredLayout");
  }

  return v7;
}

- (BSUIVibrancyConfiguration)vibrancyConfiguration
{
  return (BSUIVibrancyConfiguration *)-[PUITextLayoutConfiguration _vibrancyConfigurationWithExtensionBundleURL:luminanceReduced:](self, "_vibrancyConfigurationWithExtensionBundleURL:luminanceReduced:", 0, 0);
}

- (id)vibrancyConfigurationWithExtensionBundle:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "bundleURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUITextLayoutConfiguration vibrancyConfigurationWithExtensionBundleURL:](self, "vibrancyConfigurationWithExtensionBundleURL:", v4);
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
  -[PUITextLayoutConfiguration vibrancyConfigurationWithExtensionBundleURL:luminanceReduced:](self, "vibrancyConfigurationWithExtensionBundleURL:luminanceReduced:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)vibrancyConfigurationWithExtensionBundleURL:(id)a3
{
  return -[PUITextLayoutConfiguration _vibrancyConfigurationWithExtensionBundleURL:luminanceReduced:](self, "_vibrancyConfigurationWithExtensionBundleURL:luminanceReduced:", a3, 0);
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
    PUILogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[PUITextLayoutConfiguration vibrancyConfigurationWithExtensionBundleURL:luminanceReduced:].cold.1(v7);

  }
  -[PUITextLayoutConfiguration _vibrancyConfigurationWithExtensionBundleURL:luminanceReduced:](self, "_vibrancyConfigurationWithExtensionBundleURL:luminanceReduced:", v6, v4);
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
  -[PUITextLayoutConfiguration _effectivePrivateStyle](self, "_effectivePrivateStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUITextLayoutConfiguration contentsLuminance](self, "contentsLuminance");
  v10 = PUIStyleBackgroundTypeForLuminance(v9);
  v11 = objc_msgSend(v8, "vibrancyEffectType");
  if (vibrancyConfiguration)
  {
    if (-[BSUIVibrancyConfiguration effectType](self->_vibrancyConfiguration, "effectType") == v11)
    {
      -[BSUIVibrancyConfiguration groupName](self->_vibrancyConfiguration, "groupName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUITextLayoutConfiguration groupName](self, "groupName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(vibrancyConfiguration) = BSEqualObjects();

    }
    else
    {
      LODWORD(vibrancyConfiguration) = 0;
    }
  }
  objc_msgSend(MEMORY[0x24BE0BF48], "pui_vibrancyLUTFromPrivateStyle:extensionBundleURL:luminanceReduced:", v8, v6, v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!(_DWORD)vibrancyConfiguration
    || (-[BSUIVibrancyConfiguration alternativeVibrancyEffectLUT](self->_vibrancyConfiguration, "alternativeVibrancyEffectLUT"), v15 = (void *)objc_claimAutoreleasedReturnValue(), v16 = BSEqualObjects(), v15, (v16 & 1) == 0))
  {
    v17 = objc_alloc(MEMORY[0x24BE0BF48]);
    v18 = BSUIVibrancyBackgroundTypeForPUIStyleBackgroundType(v10);
    objc_msgSend(v8, "vibrancyEffectColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUITextLayoutConfiguration groupName](self, "groupName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (BSUIVibrancyConfiguration *)objc_msgSend(v17, "initWithEffectType:backgroundType:color:groupName:blendConfiguration:blendAmount:alternativeVibrancyEffectLUT:", v11, v18, v19, v20, 0, v14, 0.0);
    v22 = self->_vibrancyConfiguration;
    self->_vibrancyConfiguration = v21;

  }
  v23 = self->_vibrancyConfiguration;

  return v23;
}

- (NSString)effectiveNumberingSystemType
{
  void *v2;

  -[PUITextLayoutConfiguration numberingSystemType](self, "numberingSystemType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend((id)objc_opt_class(), "defaultNumberingSystemType");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v2;
}

- (BOOL)prefersVerticalTitleLayout
{
  return PUITextLayoutIsVertical(-[PUITextLayoutConfiguration preferredLayout](self, "preferredLayout"));
}

+ (id)defaultFontForRole:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDF6A70], "pui_defaultFontForRole:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6A70], "pui_defaultFont");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

+ (unint64_t)defaultAlignment
{
  return 0;
}

+ (unint64_t)defaultLayout
{
  return 0;
}

+ (PUIStyle)defaultStyle
{
  return (PUIStyle *)objc_alloc_init(PUIStyleVibrantMaterial);
}

+ (id)defaultStyleColor
{
  return +[PUIStyleColor vibrantMaterialColor](PUIStyleColor, "vibrantMaterialColor");
}

+ (double)defaultContentsLuminance
{
  return 0.5;
}

+ (unint64_t)maximumVerticalTextCharacters
{
  if (maximumVerticalTextCharacters_onceToken != -1)
    dispatch_once(&maximumVerticalTextCharacters_onceToken, &__block_literal_global_14);
  return maximumVerticalTextCharacters_maximumVerticalTextCharacters;
}

uint64_t __59__PUITextLayoutConfiguration_maximumVerticalTextCharacters__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(getPRIncomingCallMetricsProviderClass(), "maxVerticalTextLength");
  maximumVerticalTextCharacters_maximumVerticalTextCharacters = result;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  PUITextLayoutConfiguration *v4;
  void *v5;
  char isKindOfClass;
  PUITextLayoutConfiguration *v7;
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

  v4 = (PUITextLayoutConfiguration *)a3;
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
      -[PUITextLayoutConfiguration fontConfiguration](self, "fontConfiguration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUITextLayoutConfiguration fontConfiguration](v7, "fontConfiguration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = BSEqualObjects();

      if (!v10)
        goto LABEL_10;
      v11 = -[PUITextLayoutConfiguration preferredAlignment](self, "preferredAlignment");
      if (v11 != -[PUITextLayoutConfiguration preferredAlignment](v7, "preferredAlignment"))
        goto LABEL_10;
      v12 = -[PUITextLayoutConfiguration preferredLayout](self, "preferredLayout");
      if (v12 != -[PUITextLayoutConfiguration preferredLayout](v7, "preferredLayout"))
        goto LABEL_10;
      -[PUITextLayoutConfiguration style](self, "style");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUITextLayoutConfiguration style](v7, "style");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = BSEqualObjects();

      if (!v15)
        goto LABEL_10;
      -[PUITextLayoutConfiguration numberingSystemType](self, "numberingSystemType");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUITextLayoutConfiguration numberingSystemType](v7, "numberingSystemType");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = BSEqualObjects();

      if (!v18)
        goto LABEL_10;
      -[PUITextLayoutConfiguration contentsLuminance](self, "contentsLuminance");
      v20 = vcvtad_u64_f64(v19 * 10000.0);
      -[PUITextLayoutConfiguration contentsLuminance](v7, "contentsLuminance");
      if (v20 == vcvtad_u64_f64(v21 * 10000.0)
        && (v22 = -[PUITextLayoutConfiguration isUserConfigured](self, "isUserConfigured"),
            v22 == -[PUITextLayoutConfiguration isUserConfigured](v7, "isUserConfigured")))
      {
        v25 = -[PUITextLayoutConfiguration isAlternateDateEnabled](self, "isAlternateDateEnabled");
        v23 = v25 ^ -[PUITextLayoutConfiguration isAlternateDateEnabled](v7, "isAlternateDateEnabled") ^ 1;
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

- (BOOL)isVisiblyEqualToTextLayoutConfiguration:(id)a3
{
  PUITextLayoutConfiguration *v4;
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

  v4 = (PUITextLayoutConfiguration *)a3;
  if (self == v4)
  {
    v16 = 1;
  }
  else
  {
    -[PUITextLayoutConfiguration fontConfiguration](self, "fontConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUITextLayoutConfiguration fontConfiguration](v4, "fontConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = BSEqualObjects();

    if (!v7)
      goto LABEL_8;
    v8 = -[PUITextLayoutConfiguration preferredAlignment](self, "preferredAlignment");
    if (v8 != -[PUITextLayoutConfiguration preferredAlignment](v4, "preferredAlignment"))
      goto LABEL_8;
    v9 = -[PUITextLayoutConfiguration preferredLayout](self, "preferredLayout");
    if (v9 != -[PUITextLayoutConfiguration preferredLayout](v4, "preferredLayout"))
      goto LABEL_8;
    -[PUITextLayoutConfiguration style](self, "style");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUITextLayoutConfiguration style](v4, "style");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = BSEqualObjects();

    if (!v12)
      goto LABEL_8;
    -[PUITextLayoutConfiguration numberingSystemType](self, "numberingSystemType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUITextLayoutConfiguration numberingSystemType](v4, "numberingSystemType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = BSEqualObjects();

    if (v15)
    {
      -[PUITextLayoutConfiguration isAlternateDateEnabled](self, "isAlternateDateEnabled");
      -[PUITextLayoutConfiguration isAlternateDateEnabled](v4, "isAlternateDateEnabled");
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

  -[PUITextLayoutConfiguration contentsLuminance](self, "contentsLuminance");
  v4 = vcvtad_u64_f64(v3 * 10000.0);
  -[PUITextLayoutConfiguration fontConfiguration](self, "fontConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  -[PUITextLayoutConfiguration style](self, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[PUITextLayoutConfiguration numberingSystemType](self, "numberingSystemType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash");
  v11 = -[PUITextLayoutConfiguration isUserConfigured](self, "isUserConfigured");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[PUITextLayoutConfiguration isAlternateDateEnabled](self, "isAlternateDateEnabled"));
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
  PUITextLayoutConfiguration *v11;
  id v12;

  v3 = objc_alloc_init(MEMORY[0x24BE0BE10]);
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __41__PUITextLayoutConfiguration_description__block_invoke;
  v10 = &unk_25154BFC0;
  v11 = self;
  v12 = v3;
  v4 = v3;
  objc_msgSend(v4, "appendProem:block:", self, &v7);
  objc_msgSend(v4, "description", v7, v8, v9, v10, v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

uint64_t __41__PUITextLayoutConfiguration_description__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendDescriptionToFormatter:", *(_QWORD *)(a1 + 40));
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[PUITextLayoutConfiguration initWithTextLayoutConfiguration:](+[PUITextLayoutConfiguration allocWithZone:](PUIMutableTextLayoutConfiguration, "allocWithZone:", a3), "initWithTextLayoutConfiguration:", self);
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
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[PUITextLayoutConfiguration fontConfiguration](self, "fontConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v4, CFSTR("fontConfiguration"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[PUITextLayoutConfiguration preferredAlignment](self, "preferredAlignment"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v5, CFSTR("preferredAlignment"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[PUITextLayoutConfiguration preferredLayout](self, "preferredLayout"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v6, CFSTR("preferredLayout"));

  -[PUITextLayoutConfiguration style](self, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pui_encodeStyle:forKey:error:", v7, CFSTR("style"), 0);

  -[PUITextLayoutConfiguration styleColor](self, "styleColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v8, CFSTR("styleColor"));

  -[PUITextLayoutConfiguration numberingSystemType](self, "numberingSystemType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v9, CFSTR("numberingSystemType"));

  v10 = (void *)MEMORY[0x24BDD16E0];
  -[PUITextLayoutConfiguration contentsLuminance](self, "contentsLuminance");
  objc_msgSend(v10, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v11, CFSTR("contentsLuminence"));

  -[PUITextLayoutConfiguration groupName](self, "groupName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v12, CFSTR("groupName"));

  objc_msgSend(v13, "encodeBool:forKey:", -[PUITextLayoutConfiguration isUserConfigured](self, "isUserConfigured"), CFSTR("userConfigured"));
  objc_msgSend(v13, "encodeBool:forKey:", -[PUITextLayoutConfiguration isAlternateDateEnabled](self, "isAlternateDateEnabled"), CFSTR("alternateDateEnabled"));

}

- (PUITextLayoutConfiguration)initWithCoder:(id)a3
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
  PUIStyleColor *v21;
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
  PUITextLayoutConfiguration *v34;
  double v35;
  double v36;
  char v37;
  void *v38;
  void *v39;
  PUITextLayoutConfiguration *v40;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCF20];
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("fontConfiguration"));
  v9 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("style"));
  v10 = objc_claimAutoreleasedReturnValue();
  v46 = (void *)v10;
  v47 = (void *)v9;
  if (v10)
  {
    v48 = 0;
    +[PUIStyleSerialization styleForData:error:](PUIStyleSerialization, "styleForData:error:", v10, &v48);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v48;
    if (!v11)
    {
      PUILogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[PUITextLayoutConfiguration initWithCoder:].cold.1((uint64_t)v12, v13, v14, v15, v16, v17, v18, v19);

      objc_msgSend((id)objc_opt_class(), "defaultStyle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    objc_opt_self();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v20, CFSTR("styleColor"));
    v21 = (PUIStyleColor *)objc_claimAutoreleasedReturnValue();

    if (!v21)
    {
      objc_opt_self();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v22, CFSTR("styleColor"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
        v21 = -[PUIStyleColor initWithColor:]([PUIStyleColor alloc], "initWithColor:", v23);
      else
        v21 = 0;

    }
    -[PUIStyleColor contentStyle](v21, "contentStyle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_opt_self();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v24, CFSTR("textAlignment"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
    v44 = objc_msgSend(v25, "unsignedIntegerValue");
  else
    v44 = 0;
  objc_opt_self();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v26, CFSTR("preferredLayout"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = v25;
  if (v27)
    v43 = objc_msgSend(v27, "unsignedIntegerValue");
  else
    v43 = 0;
  objc_opt_self();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v28, CFSTR("numberingSystemType"));
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
  v40 = -[PUITextLayoutConfiguration initWithFontConfiguration:preferredAlignment:preferredLayout:style:numberingSystemType:userConfigured:contentsLuminance:alternateDateEnabled:groupName:](v34, "initWithFontConfiguration:preferredAlignment:preferredLayout:style:numberingSystemType:userConfigured:contentsLuminance:alternateDateEnabled:groupName:", v47, v44, v43, v11, v29, v30, v36, v42, v39);

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
  -[PUITextLayoutConfiguration fontConfiguration](self, "fontConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("fontConfiguration"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[PUITextLayoutConfiguration preferredAlignment](self, "preferredAlignment"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("preferredAlignment"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[PUITextLayoutConfiguration preferredLayout](self, "preferredLayout"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("preferredLayout"));

  -[PUITextLayoutConfiguration style](self, "style");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUIStyleSerialization dataForStyle:error:](PUIStyleSerialization, "dataForStyle:error:", v8, 0);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("style"));
  -[PUITextLayoutConfiguration styleColor](self, "styleColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("styleColor"));

  -[PUITextLayoutConfiguration numberingSystemType](self, "numberingSystemType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("numberingSystemType"));

  v11 = (void *)MEMORY[0x24BDD16E0];
  -[PUITextLayoutConfiguration contentsLuminance](self, "contentsLuminance");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("contentsLuminence"));

  -[PUITextLayoutConfiguration groupName](self, "groupName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("groupName"));

  objc_msgSend(v4, "encodeBool:forKey:", -[PUITextLayoutConfiguration isUserConfigured](self, "isUserConfigured"), CFSTR("userConfigured"));
  objc_msgSend(v4, "encodeBool:forKey:", -[PUITextLayoutConfiguration isAlternateDateEnabled](self, "isAlternateDateEnabled"), CFSTR("alternateDateEnabled"));

}

- (PUITextLayoutConfiguration)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  PUIStyleColor *v11;
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
  PUITextLayoutConfiguration *v35;
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
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("fontConfiguration"));
  v6 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("style"));
  v7 = objc_claimAutoreleasedReturnValue();
  v42 = (void *)v7;
  v43 = (void *)v6;
  if (v7)
  {
    v44 = 0;
    +[PUIStyleSerialization styleForData:error:](PUIStyleSerialization, "styleForData:error:", v7, &v44);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v44;
    if (v8)
    {
      v40 = (void *)v8;
    }
    else
    {
      PUILogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[PUITextLayoutConfiguration initWithCoder:].cold.1((uint64_t)v9, v14, v15, v16, v17, v18, v19, v20);

      objc_msgSend((id)objc_opt_class(), "defaultStyle");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    objc_opt_self();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, CFSTR("styleColor"));
    v11 = (PUIStyleColor *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      objc_opt_self();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", v12, CFSTR("styleColor"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
        v11 = -[PUIStyleColor initWithColor:]([PUIStyleColor alloc], "initWithColor:", v13);
      else
        v11 = 0;

    }
    -[PUIStyleColor contentStyle](v11, "contentStyle");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = 0;
  }
  objc_opt_self();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v21, CFSTR("preferredAlignment"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
    v39 = objc_msgSend(v22, "unsignedIntegerValue");
  else
    v39 = 0;
  objc_opt_self();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v23, CFSTR("preferredLayout"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = v9;
  if (v24)
    v38 = objc_msgSend(v24, "unsignedIntegerValue");
  else
    v38 = 0;
  objc_opt_self();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v25, CFSTR("numberingSystemType"));
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
  v35 = -[PUITextLayoutConfiguration initWithFontConfiguration:preferredAlignment:preferredLayout:style:numberingSystemType:userConfigured:contentsLuminance:alternateDateEnabled:groupName:](self, "initWithFontConfiguration:preferredAlignment:preferredLayout:style:numberingSystemType:userConfigured:contentsLuminance:alternateDateEnabled:groupName:", v43, v39, v38, v40, v26, v27, v31, v37, v34);

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
  -[PUITextLayoutConfiguration fontConfiguration](self, "fontConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v15, "appendObject:withName:", v4, CFSTR("fontConfiguration"));

  v6 = (id)objc_msgSend(v15, "appendInteger:withName:", -[PUITextLayoutConfiguration preferredAlignment](self, "preferredAlignment"), CFSTR("preferredAlignment"));
  v7 = (id)objc_msgSend(v15, "appendInteger:withName:", -[PUITextLayoutConfiguration preferredLayout](self, "preferredLayout"), CFSTR("preferredLayout"));
  -[PUITextLayoutConfiguration style](self, "style");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v15, "appendObject:withName:", v8, CFSTR("style"));

  -[PUITextLayoutConfiguration numberingSystemType](self, "numberingSystemType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v15, "appendObject:withName:", v10, CFSTR("numberingSystemType"));

  -[PUITextLayoutConfiguration contentsLuminance](self, "contentsLuminance");
  v12 = (id)objc_msgSend(v15, "appendDouble:withName:decimalPrecision:", CFSTR("contentsLuminance"), 5);
  v13 = (id)objc_msgSend(v15, "appendBool:withName:", -[PUITextLayoutConfiguration isUserConfigured](self, "isUserConfigured"), CFSTR("userConfigured"));
  v14 = (id)objc_msgSend(v15, "appendBool:withName:", -[PUITextLayoutConfiguration isAlternateDateEnabled](self, "isAlternateDateEnabled"), CFSTR("isAlternateDateEnabled"));

}

- (BOOL)prefersVerticalTextLayout
{
  return self->_prefersVerticalTextLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vibrancyConfiguration, 0);
}

- (PUITextLayoutConfiguration)initWithFontConfiguration:(id)a3 styleColor:(id)a4
{
  id v6;
  id v7;
  PUITextLayoutConfiguration *v8;
  uint64_t v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "defaultContentsLuminance");
  LOBYTE(v10) = 0;
  v8 = -[PUITextLayoutConfiguration initWithFontConfiguration:preferredAlignment:preferredLayout:styleColor:numberingSystemType:userConfigured:contentsLuminance:alternateDateEnabled:groupName:](self, "initWithFontConfiguration:preferredAlignment:preferredLayout:styleColor:numberingSystemType:userConfigured:contentsLuminance:alternateDateEnabled:groupName:", v7, 0, 0, v6, 0, 0, v10, 0);

  return v8;
}

- (PUITextLayoutConfiguration)initWithFontConfiguration:(id)a3 styleColor:(id)a4 numberingSystemType:(id)a5
{
  id v8;
  id v9;
  id v10;
  PUITextLayoutConfiguration *v11;
  uint64_t v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[PUITextLayoutConfiguration defaultContentsLuminance](PUITextLayoutConfiguration, "defaultContentsLuminance");
  LOBYTE(v13) = 0;
  v11 = -[PUITextLayoutConfiguration initWithFontConfiguration:preferredAlignment:preferredLayout:styleColor:numberingSystemType:userConfigured:contentsLuminance:alternateDateEnabled:groupName:](self, "initWithFontConfiguration:preferredAlignment:preferredLayout:styleColor:numberingSystemType:userConfigured:contentsLuminance:alternateDateEnabled:groupName:", v10, 0, 0, v9, v8, 0, v13, 0);

  return v11;
}

- (PUITextLayoutConfiguration)initWithFontConfiguration:(id)a3 preferredAlignment:(unint64_t)a4 preferredLayout:(unint64_t)a5 styleColor:(id)a6 numberingSystemType:(id)a7 userConfigured:(BOOL)a8 contentsLuminance:(double)a9 alternateDateEnabled:(BOOL)a10 groupName:(id)a11
{
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  PUITextLayoutConfiguration *v24;
  uint64_t v26;

  v19 = a11;
  v20 = a7;
  v21 = a6;
  v22 = a3;
  objc_msgSend(v21, "contentStyle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE1(v26) = a10;
  LOBYTE(v26) = a8;
  v24 = -[PUITextLayoutConfiguration initWithFontConfiguration:preferredAlignment:preferredLayout:style:styleColor:numberingSystemType:userConfigured:contentsLuminance:alternateDateEnabled:groupName:](self, "initWithFontConfiguration:preferredAlignment:preferredLayout:style:styleColor:numberingSystemType:userConfigured:contentsLuminance:alternateDateEnabled:groupName:", v22, a4, a5, v23, v21, v20, a9, v26, v19);

  return v24;
}

- (void)vibrancyConfigurationWithExtensionBundleURL:(os_log_t)log luminanceReduced:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_24464E000, log, OS_LOG_TYPE_FAULT, "Fault: Attempting to fetch vibrancy configuration for nil URL", v1, 2u);
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_24464E000, a2, a3, "Content style deserialization failed with error: %{public}@, falling back to defaultStyle", a5, a6, a7, a8, 2u);
}

@end
