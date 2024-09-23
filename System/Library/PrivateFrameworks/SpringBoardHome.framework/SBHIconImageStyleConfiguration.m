@implementation SBHIconImageStyleConfiguration

+ (SBHIconImageStyleConfiguration)automaticStyleConfiguration
{
  if (automaticStyleConfiguration_onceToken != -1)
    dispatch_once(&automaticStyleConfiguration_onceToken, &__block_literal_global_21);
  return (SBHIconImageStyleConfiguration *)(id)automaticStyleConfiguration_automaticStyleConfiguration;
}

void __61__SBHIconImageStyleConfiguration_automaticStyleConfiguration__block_invoke()
{
  SBHAutomaticIconImageStyleConfiguration *v0;
  void *v1;

  v0 = objc_alloc_init(SBHAutomaticIconImageStyleConfiguration);
  v1 = (void *)automaticStyleConfiguration_automaticStyleConfiguration;
  automaticStyleConfiguration_automaticStyleConfiguration = (uint64_t)v0;

}

+ (SBHIconImageStyleConfiguration)automaticWithLightIconsStyleConfiguration
{
  if (automaticWithLightIconsStyleConfiguration_onceToken != -1)
    dispatch_once(&automaticWithLightIconsStyleConfiguration_onceToken, &__block_literal_global_1);
  return (SBHIconImageStyleConfiguration *)(id)automaticWithLightIconsStyleConfiguration_automaticWithLightIconsStyleConfiguration;
}

void __75__SBHIconImageStyleConfiguration_automaticWithLightIconsStyleConfiguration__block_invoke()
{
  SBHAutomaticWithLightIconsIconImageStyleConfiguration *v0;
  void *v1;

  v0 = objc_alloc_init(SBHAutomaticWithLightIconsIconImageStyleConfiguration);
  v1 = (void *)automaticWithLightIconsStyleConfiguration_automaticWithLightIconsStyleConfiguration;
  automaticWithLightIconsStyleConfiguration_automaticWithLightIconsStyleConfiguration = (uint64_t)v0;

}

+ (SBHIconImageStyleConfiguration)lightStyleConfiguration
{
  if (lightStyleConfiguration_onceToken != -1)
    dispatch_once(&lightStyleConfiguration_onceToken, &__block_literal_global_3);
  return (SBHIconImageStyleConfiguration *)(id)lightStyleConfiguration_lightStyleConfiguration;
}

void __57__SBHIconImageStyleConfiguration_lightStyleConfiguration__block_invoke()
{
  SBHLightIconImageStyleConfiguration *v0;
  void *v1;

  v0 = objc_alloc_init(SBHLightIconImageStyleConfiguration);
  v1 = (void *)lightStyleConfiguration_lightStyleConfiguration;
  lightStyleConfiguration_lightStyleConfiguration = (uint64_t)v0;

}

+ (SBHIconImageStyleConfiguration)darkStyleConfiguration
{
  if (darkStyleConfiguration_onceToken != -1)
    dispatch_once(&darkStyleConfiguration_onceToken, &__block_literal_global_5);
  return (SBHIconImageStyleConfiguration *)(id)darkStyleConfiguration_darkStyleConfiguration;
}

void __56__SBHIconImageStyleConfiguration_darkStyleConfiguration__block_invoke()
{
  SBHDarkIconImageStyleConfiguration *v0;
  void *v1;

  v0 = objc_alloc_init(SBHDarkIconImageStyleConfiguration);
  v1 = (void *)darkStyleConfiguration_darkStyleConfiguration;
  darkStyleConfiguration_darkStyleConfiguration = (uint64_t)v0;

}

+ (id)tintedStyleConfigurationWithTintColor:(id)a3
{
  id v3;
  SBHTintedIconImageStyleConfiguration *v4;

  v3 = a3;
  v4 = -[SBHTintedIconImageStyleConfiguration initWithConfigurationType:tintColor:]([SBHTintedIconImageStyleConfiguration alloc], "initWithConfigurationType:tintColor:", 4, v3);

  return v4;
}

+ (id)sharedInstanceForStyleConfigurationType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  switch(a3)
  {
    case 0:
      objc_msgSend(a1, "automaticStyleConfiguration", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      objc_msgSend(a1, "automaticWithLightIconsStyleConfiguration", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      objc_msgSend(a1, "lightStyleConfiguration", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      objc_msgSend(a1, "darkStyleConfiguration", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

+ (void)initialize
{
  id v3;
  SBHPlaceholderIconImageStyleConfiguration *v4;
  void *v5;

  objc_opt_self();
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
  {
    v4 = [SBHPlaceholderIconImageStyleConfiguration alloc];
    v5 = (void *)reusablePlaceholderImageStyleConfiguration;
    reusablePlaceholderImageStyleConfiguration = (uint64_t)v4;

  }
}

+ (SBHIconImageStyleConfiguration)allocWithZone:(_NSZone *)a3
{
  id v5;
  objc_super v7;

  objc_opt_self();
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == a1)
    return (SBHIconImageStyleConfiguration *)(id)reusablePlaceholderImageStyleConfiguration;
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___SBHIconImageStyleConfiguration;
  return (SBHIconImageStyleConfiguration *)objc_msgSendSuper2(&v7, sel_allocWithZone_, a3);
}

- (SBHIconImageStyleConfiguration)initWithConfigurationType:(int64_t)a3 tintColor:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  SBHTintedIconImageStyleConfiguration *v10;
  objc_super v12;

  v6 = a4;
  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBHIconImageStyleConfiguration isMemberOfClass:](self, "isMemberOfClass:", v7))
  {

  }
  else
  {
    objc_opt_self();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[SBHIconImageStyleConfiguration isMemberOfClass:](self, "isMemberOfClass:", v8);

    if (!v9)
    {
      v12.receiver = self;
      v12.super_class = (Class)SBHIconImageStyleConfiguration;
      v10 = -[SBHIconImageStyleConfiguration init](&v12, sel_init);
      self = &v10->super;
LABEL_11:
      a3 = (int64_t)v10;
      goto LABEL_12;
    }
  }
  switch(a3)
  {
    case 0:
      +[SBHIconImageStyleConfiguration automaticStyleConfiguration](SBHIconImageStyleConfiguration, "automaticStyleConfiguration");
      v10 = (SBHTintedIconImageStyleConfiguration *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 1:
      +[SBHIconImageStyleConfiguration automaticWithLightIconsStyleConfiguration](SBHIconImageStyleConfiguration, "automaticWithLightIconsStyleConfiguration");
      v10 = (SBHTintedIconImageStyleConfiguration *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 2:
      +[SBHIconImageStyleConfiguration lightStyleConfiguration](SBHIconImageStyleConfiguration, "lightStyleConfiguration");
      v10 = (SBHTintedIconImageStyleConfiguration *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 3:
      +[SBHIconImageStyleConfiguration darkStyleConfiguration](SBHIconImageStyleConfiguration, "darkStyleConfiguration");
      v10 = (SBHTintedIconImageStyleConfiguration *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 4:
      v10 = -[SBHTintedIconImageStyleConfiguration initWithConfigurationType:tintColor:]([SBHTintedIconImageStyleConfiguration alloc], "initWithConfigurationType:tintColor:", 4, v6);
      goto LABEL_11;
    default:
      break;
  }
LABEL_12:

  return (SBHIconImageStyleConfiguration *)a3;
}

- (SBHIconImageStyleConfiguration)initWithConfigurationType:(int64_t)a3
{
  return -[SBHIconImageStyleConfiguration initWithConfigurationType:tintColor:](self, "initWithConfigurationType:tintColor:", a3, 0);
}

+ (SBHIconImageStyleConfiguration)styleConfigurationWithIconImageAppearance:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = a3;
  switch(objc_msgSend(v4, "appearanceType"))
  {
    case 0:
      objc_msgSend(a1, "automaticWithLightIconsStyleConfiguration");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    case 1:
    case 3:
      objc_msgSend(a1, "darkStyleConfiguration");
      v5 = objc_claimAutoreleasedReturnValue();
LABEL_5:
      v6 = (void *)v5;
      break;
    case 2:
      objc_msgSend(v4, "tintColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "tintedStyleConfigurationWithTintColor:", v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v6 = 0;
      break;
  }

  return (SBHIconImageStyleConfiguration *)v6;
}

- (SBHIconImageStyleConfiguration)init
{
  return -[SBHIconImageStyleConfiguration initWithConfigurationType:tintColor:](self, "initWithConfigurationType:tintColor:", 0, 0);
}

- (UIColor)tintColor
{
  return 0;
}

- (id)iconImageAppearanceWithUserInterfaceStyle:(int64_t)a3
{
  id result;
  void *v6;
  void *v7;
  void *v8;

  switch(-[SBHIconImageStyleConfiguration configurationType](self, "configurationType"))
  {
    case 0:
      if (a3 == 2)
        goto LABEL_5;
      goto LABEL_4;
    case 1:
    case 2:
LABEL_4:
      +[SBHIconImageAppearance lightAppearance](SBHIconImageAppearance, "lightAppearance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 3:
LABEL_5:
      +[SBHIconImageAppearance darkAppearance](SBHIconImageAppearance, "darkAppearance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
      result = v6;
      break;
    case 4:
      -[SBHIconImageStyleConfiguration tintColor](self, "tintColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBHIconImageAppearance tintedAppearanceWithTintColor:](SBHIconImageAppearance, "tintedAppearanceWithTintColor:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      result = v8;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (id)widgetAppearanceWithUserInterfaceStyle:(int64_t)a3
{
  id result;
  void *v6;
  void *v7;
  void *v8;

  switch(-[SBHIconImageStyleConfiguration configurationType](self, "configurationType"))
  {
    case 0:
    case 1:
      if (a3 != 2)
        goto LABEL_5;
      goto LABEL_6;
    case 2:
LABEL_5:
      +[SBHIconImageAppearance lightAppearance](SBHIconImageAppearance, "lightAppearance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3:
LABEL_6:
      +[SBHIconImageAppearance darkAppearance](SBHIconImageAppearance, "darkAppearance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
      result = v6;
      break;
    case 4:
      -[SBHIconImageStyleConfiguration tintColor](self, "tintColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBHIconImageAppearance tintedAppearanceWithTintColor:](SBHIconImageAppearance, "tintedAppearanceWithTintColor:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      result = v8;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[SBHIconImageStyleConfiguration configurationType](self, "configurationType");
  -[SBHIconImageStyleConfiguration tintColor](self, "tintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") + v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  SBHIconImageStyleConfiguration *v4;
  void *v5;
  char isKindOfClass;
  SBHIconImageStyleConfiguration *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (SBHIconImageStyleConfiguration *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v7 = v4;
      v8 = -[SBHIconImageStyleConfiguration configurationType](self, "configurationType");
      if (v8 == -[SBHIconImageStyleConfiguration configurationType](v7, "configurationType"))
      {
        -[SBHIconImageStyleConfiguration tintColor](self, "tintColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBHIconImageStyleConfiguration tintColor](v7, "tintColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = BSEqualObjects();

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (NSString)description
{
  return (NSString *)-[SBHIconImageStyleConfiguration descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
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
  id v5;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[SBHIconImageStyleConfiguration configurationType](self, "configurationType"), CFSTR("configurationType"));
  -[SBHIconImageStyleConfiguration tintColor](self, "tintColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("tintColor"));

}

- (SBHIconImageStyleConfiguration)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  SBHIconImageStyleConfiguration *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("configurationType"));
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("tintColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[SBHIconImageStyleConfiguration initWithConfigurationType:tintColor:](self, "initWithConfigurationType:tintColor:", v5, v7);
  return v8;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[SBHIconImageStyleConfiguration configurationType](self, "configurationType"), CFSTR("configurationType"));
  -[SBHIconImageStyleConfiguration tintColor](self, "tintColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("tintColor"));

}

- (SBHIconImageStyleConfiguration)initWithBSXPCCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  SBHIconImageStyleConfiguration *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("configurationType"));
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("tintColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[SBHIconImageStyleConfiguration initWithConfigurationType:tintColor:](self, "initWithConfigurationType:tintColor:", v5, v7);
  return v8;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBHIconImageStyleConfiguration succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBHIconImageStyleConfiguration descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[SBHIconImageStyleConfiguration succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconImageStyleConfiguration tintColor](self, "tintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", v5, CFSTR("tintColor"), 1);

  return v4;
}

+ (SBHIconImageStyleConfiguration)styleConfigurationWithHomeScreenConfiguration:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = a3;
  switch(objc_msgSend(v3, "styleType"))
  {
    case 0:
      +[SBHIconImageStyleConfiguration automaticStyleConfiguration](SBHIconImageStyleConfiguration, "automaticStyleConfiguration");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 1:
      +[SBHIconImageStyleConfiguration darkStyleConfiguration](SBHIconImageStyleConfiguration, "darkStyleConfiguration");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 2:
      +[SBHIconImageStyleConfiguration automaticWithLightIconsStyleConfiguration](SBHIconImageStyleConfiguration, "automaticWithLightIconsStyleConfiguration");
      v4 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v5 = (void *)v4;
      break;
    case 3:
      v7 = (void *)styleConfigurationWithHomeScreenConfiguration__sharedTintedStyleConfigurations;
      if (!styleConfigurationWithHomeScreenConfiguration__sharedTintedStyleConfigurations)
      {
        objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = (void *)styleConfigurationWithHomeScreenConfiguration__sharedTintedStyleConfigurations;
        styleConfigurationWithHomeScreenConfiguration__sharedTintedStyleConfigurations = v8;

        v7 = (void *)styleConfigurationWithHomeScreenConfiguration__sharedTintedStyleConfigurations;
      }
      objc_msgSend(v7, "objectForKey:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v5)
      {
        objc_msgSend(v3, "accentColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[SBHIconImageStyleConfiguration tintedStyleConfigurationWithTintColor:](SBHIconImageStyleConfiguration, "tintedStyleConfigurationWithTintColor:", v10);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend((id)styleConfigurationWithHomeScreenConfiguration__sharedTintedStyleConfigurations, "setObject:forKey:", v5, v3);
      }
      break;
    default:
      v5 = 0;
      break;
  }

  return (SBHIconImageStyleConfiguration *)v5;
}

- (PUIStylePickerHomeScreenConfiguration)homeScreenConfiguration
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = -[SBHIconImageStyleConfiguration configurationType](self, "configurationType");
  if ((unint64_t)(v3 - 1) < 2)
  {
    v4 = 0;
    v5 = 2;
  }
  else if (v3 == 3)
  {
    v4 = 0;
    v5 = 1;
  }
  else if (v3 == 4)
  {
    -[SBHIconImageStyleConfiguration tintColor](self, "tintColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 3;
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FCE8]), "initWithStyleType:variation:luminance:", v5, 0.0, 0.0);
  v7 = v6;
  if (v4)
    objc_msgSend(v6, "setAccentColor:", v4);

  return (PUIStylePickerHomeScreenConfiguration *)v7;
}

- (SBSHomeScreenIconStyleConfiguration)homeScreenIconStyleConfiguration
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = -[SBHIconImageStyleConfiguration configurationType](self, "configurationType");
  if (v3 == 4)
  {
    v5 = (void *)MEMORY[0x1E0DAAE80];
    -[SBHIconImageStyleConfiguration tintColor](self, "tintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "BSColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tintedStyleConfigurationWithTintColor:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v3 == 3)
    {
      objc_msgSend(MEMORY[0x1E0DAAE80], "darkStyleConfiguration");
      v4 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v3)
        objc_msgSend(MEMORY[0x1E0DAAE80], "lightStyleConfiguration");
      else
        objc_msgSend(MEMORY[0x1E0DAAE80], "automaticStyleConfiguration");
      v4 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (void *)v4;
  }
  return (SBSHomeScreenIconStyleConfiguration *)v8;
}

@end
