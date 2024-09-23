@implementation UITraitCollection(SpringBoardHome)

- (uint64_t)sbh_iconTintColor
{
  return objc_msgSend(a1, "sbh_iconTintColorInferringIfNecessary:", 1);
}

- (id)sbh_iconTintColorInferringIfNecessary:()SpringBoardHome
{
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  id v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  char v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  id v20;

  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectForTrait:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v9 = v6;
    if (!a3)
      goto LABEL_17;
  }
  else
  {
    v9 = 0;
    if (!a3)
      goto LABEL_17;
  }
  objc_opt_self();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_isKindOfClass();

  if ((v11 & 1) != 0)
  {
    v12 = v6;
    if (objc_msgSend(v12, "appearanceType") != 2)
      goto LABEL_15;
    goto LABEL_10;
  }
  objc_opt_self();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_isKindOfClass();

  if ((v14 & 1) != 0)
  {
    v12 = v6;
    if (objc_msgSend(v12, "configurationType") == 4)
    {
LABEL_10:
      objc_msgSend(v12, "tintColor");
      v15 = objc_claimAutoreleasedReturnValue();
LABEL_11:
      v16 = (void *)v15;
LABEL_16:

      v9 = v16;
      goto LABEL_17;
    }
LABEL_15:
    v16 = 0;
    goto LABEL_16;
  }
  objc_opt_self();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_opt_isKindOfClass();

  if ((v18 & 1) != 0)
  {
    v19 = v6;
    if (objc_msgSend(v19, "styleType") == 3)
    {
      objc_msgSend(v19, "accentColor");
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    goto LABEL_15;
  }
LABEL_17:
  v20 = v9;

  return v20;
}

+ (id)sbh_traitCollectionWithIconTintColor:()SpringBoardHome
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__UITraitCollection_SpringBoardHome__sbh_traitCollectionWithIconTintColor___block_invoke;
  v8[3] = &unk_1E8D882D0;
  v9 = v4;
  v5 = v4;
  objc_msgSend(a1, "traitCollectionWithTraits:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (uint64_t)sbh_iconImageAppearance
{
  return objc_msgSend(a1, "sbh_iconImageAppearanceInferringIfNecessary:", 1);
}

- (id)sbh_iconImageAppearanceInferringIfNecessary:()SpringBoardHome
{
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  id v9;
  void *v10;

  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectForTrait:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v9 = v6;
  }
  else if (a3)
  {
    objc_msgSend(a1, "sbh_iconImageStyleConfigurationInferringIfNecessary:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(v10, "iconImageAppearanceWithUserInterfaceStyle:", objc_msgSend(a1, "userInterfaceStyle"));
    else
      +[SBHIconImageAppearance lightAppearance](SBHIconImageAppearance, "lightAppearance");
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (uint64_t)sbh_iconImageStyleConfiguration
{
  return objc_msgSend(a1, "sbh_iconImageStyleConfigurationInferringIfNecessary:", 1);
}

- (id)sbh_iconImageStyleConfigurationInferringIfNecessary:()SpringBoardHome
{
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;

  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectForTrait:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v9 = v6;
  }
  else if (a3)
  {
    objc_msgSend(a1, "sbh_homeScreenStyleConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      +[SBHIconImageStyleConfiguration styleConfigurationWithHomeScreenConfiguration:](SBHIconImageStyleConfiguration, "styleConfigurationWithHomeScreenConfiguration:", v10);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(a1, "sbh_homeScreenIconStyleConfiguration:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        objc_msgSend(v11, "sbh_iconImageStyleConfiguration");
        v9 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(a1, "sbh_iconImageAppearanceInferringIfNecessary:", 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          switch(objc_msgSend(v13, "appearanceType"))
          {
            case 0:
              +[SBHIconImageStyleConfiguration automaticWithLightIconsStyleConfiguration](SBHIconImageStyleConfiguration, "automaticWithLightIconsStyleConfiguration");
              v15 = objc_claimAutoreleasedReturnValue();
              break;
            case 1:
            case 3:
              +[SBHIconImageStyleConfiguration darkStyleConfiguration](SBHIconImageStyleConfiguration, "darkStyleConfiguration");
              v15 = objc_claimAutoreleasedReturnValue();
              break;
            case 2:
              objc_msgSend(v14, "tintColor");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_20;
            default:
              goto LABEL_12;
          }
          v9 = (id)v15;
        }
        else
        {
LABEL_12:
          objc_msgSend(a1, "sbh_iconTintColorInferringIfNecessary:", 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
LABEL_20:
            +[SBHIconImageStyleConfiguration tintedStyleConfigurationWithTintColor:](SBHIconImageStyleConfiguration, "tintedStyleConfigurationWithTintColor:", v16);
            v18 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v17 = objc_msgSend(a1, "userInterfaceStyle");
            if (v17 == 2)
            {
              +[SBHIconImageStyleConfiguration darkStyleConfiguration](SBHIconImageStyleConfiguration, "darkStyleConfiguration");
              v18 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              if (v17 == 1)
                +[SBHIconImageStyleConfiguration automaticWithLightIconsStyleConfiguration](SBHIconImageStyleConfiguration, "automaticWithLightIconsStyleConfiguration");
              else
                +[SBHIconImageStyleConfiguration defaultStyleConfiguration](SBHIconImageStyleConfiguration, "defaultStyleConfiguration");
              v18 = objc_claimAutoreleasedReturnValue();
            }
          }
          v9 = (id)v18;

        }
      }

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (uint64_t)sbh_homeScreenIconStyleConfiguration
{
  return objc_msgSend(a1, "sbh_homeScreenIconStyleConfiguration:", 1);
}

- (id)sbh_homeScreenIconStyleConfiguration:()SpringBoardHome
{
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;

  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectForTrait:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v9 = v6;
LABEL_5:
    v11 = v9;
    v13 = v9;
    goto LABEL_6;
  }
  objc_opt_self();
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectForTrait:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v10) = objc_opt_isKindOfClass();

  if ((v10 & 1) != 0)
  {
    v9 = v11;
    goto LABEL_5;
  }
  if (a3)
  {
    objc_msgSend(a1, "sbh_iconImageStyleConfigurationInferringIfNecessary:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
      objc_msgSend(v15, "homeScreenIconStyleConfiguration");
    else
      objc_msgSend(MEMORY[0x1E0DAAE80], "defaultStyleConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
LABEL_6:

  return v13;
}

+ (id)sbh_iconImageAppearanceFromTraitCollection:()SpringBoardHome iconImageStyleConfiguration:
{
  id v5;
  uint64_t v6;
  void *v7;

  v5 = a4;
  if (a3)
    v6 = objc_msgSend(a3, "userInterfaceStyle");
  else
    v6 = 1;
  objc_msgSend(v5, "iconImageAppearanceWithUserInterfaceStyle:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)sbh_iconImageAppearanceFromTraitCollection:()SpringBoardHome
{
  if (a3)
    objc_msgSend(a3, "sbh_iconImageAppearance");
  else
    +[SBHIconImageAppearance defaultAppearance](SBHIconImageAppearance, "defaultAppearance");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)sbh_iconImageAppearanceFromTraitCollection:()SpringBoardHome overrideIconImageAppearance:
{
  id v5;
  void *v6;

  v5 = a4;
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(a3, "sbh_iconImageAppearance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[SBHIconImageAppearance defaultAppearance](SBHIconImageAppearance, "defaultAppearance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v6;
}

+ (id)sbh_iconImageAppearanceFromTraitCollection:()SpringBoardHome overrideIconImageAppearance:overrideIconImageStyleConfiguration:
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v9;
  v12 = v11;
  if (!v11)
  {
    v12 = 0;
    if (v10)
    {
      objc_msgSend(a1, "sbh_iconImageAppearanceFromTraitCollection:iconImageStyleConfiguration:", v8, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  if (!v12)
  {
    objc_msgSend(v8, "sbh_iconImageAppearance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      +[SBHIconImageAppearance defaultAppearance](SBHIconImageAppearance, "defaultAppearance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v12;
}

+ (id)sbh_iconImageStyleConfigurationFromTraitCollection:()SpringBoardHome
{
  if (a3)
    objc_msgSend(a3, "sbh_iconImageStyleConfiguration");
  else
    +[SBHIconImageStyleConfiguration defaultStyleConfiguration](SBHIconImageStyleConfiguration, "defaultStyleConfiguration");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)sbh_iconImageStyleConfigurationFromTraitCollection:()SpringBoardHome overrideIconImageAppearance:overrideIconImageStyleConfiguration:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v8)
  {
    +[SBHIconImageStyleConfiguration styleConfigurationWithIconImageAppearance:](SBHIconImageStyleConfiguration, "styleConfigurationWithIconImageAppearance:", v8);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(v7, "sbh_iconImageStyleConfigurationInferringIfNecessary:", 1);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  return v12;
}

+ (id)sbh_traitCollectionWithIconImageAppearance:()SpringBoardHome
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  void *v10;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __81__UITraitCollection_SpringBoardHome__sbh_traitCollectionWithIconImageAppearance___block_invoke;
  v8[3] = &unk_1E8D882F8;
  v9 = v4;
  v10 = a1;
  v5 = v4;
  objc_msgSend(a1, "traitCollectionWithTraits:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)sbh_traitCollectionWithIconImageStyleConfiguration:()SpringBoardHome
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __89__UITraitCollection_SpringBoardHome__sbh_traitCollectionWithIconImageStyleConfiguration___block_invoke;
  v8[3] = &unk_1E8D882D0;
  v9 = v4;
  v5 = v4;
  objc_msgSend(a1, "traitCollectionWithTraits:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)sbh_traitCollectionWithIconImageStyleConfiguration:()SpringBoardHome userInterfaceStyle:
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __108__UITraitCollection_SpringBoardHome__sbh_traitCollectionWithIconImageStyleConfiguration_userInterfaceStyle___block_invoke;
  v10[3] = &unk_1E8D882F8;
  v11 = v6;
  v12 = a4;
  v7 = v6;
  objc_msgSend(a1, "traitCollectionWithTraits:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (uint64_t)sbh_iconImageUserInterfaceStyle
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v2 = objc_msgSend(a1, "userInterfaceStyle");
  objc_msgSend(a1, "sbh_homeScreenStyleConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "styleType");
    if ((unint64_t)(v5 - 1) < 3)
      v2 = 3 - v5;
  }
  objc_msgSend(a1, "sbh_iconImageAppearanceInferringIfNecessary:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v2 = objc_msgSend(MEMORY[0x1E0DC3E88], "sbh_userInterfaceStyleForIconImageAppearance:", v6);
  objc_msgSend(a1, "sbh_iconTintColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = 0;
  else
    v8 = v2;

  return v8;
}

- (uint64_t)sbh_widgetUserInterfaceStyle
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = objc_msgSend(a1, "userInterfaceStyle");
  objc_msgSend(a1, "sbh_homeScreenStyleConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "styleType");
    v6 = 2;
    if (v5 != 1)
      v6 = v2;
    if (v5 == 3)
      v2 = 0;
    else
      v2 = v6;
  }
  else
  {
    objc_msgSend(a1, "sbh_iconImageStyleConfigurationInferringIfNecessary:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "widgetAppearanceWithUserInterfaceStyle:", v2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = objc_msgSend(MEMORY[0x1E0DC3E88], "sbh_userInterfaceStyleForIconImageAppearance:", v9);
    }
    else
    {
      objc_msgSend(a1, "sbh_iconImageAppearanceInferringIfNecessary:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
        v2 = objc_msgSend(MEMORY[0x1E0DC3E88], "sbh_userInterfaceStyleForIconImageAppearance:", v9);
      objc_msgSend(a1, "sbh_iconTintColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        v2 = 0;

    }
  }

  return v2;
}

- (id)sbh_homeScreenStyleConfiguration
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_opt_self();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectForTrait:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v3;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

+ (id)sbh_traitCollectionWithHomeScreenStyleConfiguration:()SpringBoardHome
{
  void *v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  +[SBHIconImageStyleConfiguration styleConfigurationWithHomeScreenConfiguration:](SBHIconImageStyleConfiguration, "styleConfigurationWithHomeScreenConfiguration:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __90__UITraitCollection_SpringBoardHome__sbh_traitCollectionWithHomeScreenStyleConfiguration___block_invoke;
  v6[3] = &unk_1E8D882D0;
  v7 = v2;
  v3 = v2;
  objc_msgSend(a1, "traitCollectionWithTraits:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)sbh_traitCollectionWithHomeScreenStyleConfiguration:()SpringBoardHome userInterfaceStyle:
{
  void *v6;
  void *v7;

  +[SBHIconImageStyleConfiguration styleConfigurationWithHomeScreenConfiguration:](SBHIconImageStyleConfiguration, "styleConfigurationWithHomeScreenConfiguration:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sbh_traitCollectionWithIconImageStyleConfiguration:userInterfaceStyle:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)sbh_iconImageAppearanceWithHomeScreenStyleConfiguration:()SpringBoardHome
{
  void *v2;
  void *v3;

  +[SBHIconImageStyleConfiguration styleConfigurationWithHomeScreenConfiguration:](SBHIconImageStyleConfiguration, "styleConfigurationWithHomeScreenConfiguration:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconImageAppearanceWithUserInterfaceStyle:", objc_msgSend(a1, "userInterfaceStyle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)sbh_hasIconTintColorOrDarkStyle
{
  void *v2;
  _BOOL8 v3;

  if (objc_msgSend(a1, "sbh_iconImageUserInterfaceStyle") != 1)
    return 1;
  objc_msgSend(a1, "sbh_iconTintColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)sbh_automaticallyChangesWithUserInterfaceStyle
{
  void *v1;
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "sbh_iconImageStyleConfiguration");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "configurationType") == 0;
  else
    v3 = 0;

  return v3;
}

+ (uint64_t)sbh_userInterfaceStyleForIconImageAppearance:()SpringBoardHome
{
  unint64_t v3;

  v3 = objc_msgSend(a3, "appearanceType");
  if (v3 > 2)
    return 0;
  else
    return qword_1D0191030[v3];
}

+ (id)sbh_highestLevelTraitCollectionForView:()SpringBoardHome
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = v3;
    objc_msgSend(v7, "superview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      do
      {
        objc_msgSend(v7, "superview");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "superview");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v7 = v9;
      }
      while (v10);
    }
    else
    {
      v9 = v7;
    }
    objc_msgSend(v9, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

+ (id)sbh_highestLevelTraitCollectionForViewController:()SpringBoardHome
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  objc_msgSend(v3, "viewIfLoaded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = v3;
    objc_msgSend(v8, "parentViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      do
      {
        objc_msgSend(v8, "parentViewController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "parentViewController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v8 = v10;
      }
      while (v11);
    }
    else
    {
      v10 = v8;
    }
    objc_msgSend(v10, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

@end
