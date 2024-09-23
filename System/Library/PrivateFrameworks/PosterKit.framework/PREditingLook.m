@implementation PREditingLook

- (NSString)groupName
{
  return (NSString *)CFSTR("PREditingLook");
}

- (id)titleStyleConfigurationWithExtensionBundle:(id)a3 luminance:(double)a4 timeNumberingSystem:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  PRPosterCustomTimeFontConfiguration *v16;
  PRPosterCustomTimeFontConfiguration *v17;
  void *v18;
  char v19;
  PRPosterTitleStyleConfiguration *v20;
  void *v21;
  PRPosterTitleStyleConfiguration *v22;
  uint64_t v24;

  v8 = a3;
  v9 = a5;
  -[PREditingLook initialTimeFontConfiguration](self, "initialTimeFontConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditingLook initialTitleColor](self, "initialTitleColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeFontIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "weight");
  v14 = v13;
  objc_msgSend(v10, "customFont");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = -[PRPosterCustomTimeFontConfiguration initWithFont:extensionBundle:]([PRPosterCustomTimeFontConfiguration alloc], "initWithFont:extensionBundle:", v15, v8);
  }
  else
  {
    if (!v12)
    {
      v17 = 0;
      goto LABEL_6;
    }
    v16 = -[PRPosterSystemTimeFontConfiguration initWithTimeFontIdentifier:weight:systemItem:]([PRPosterSystemTimeFontConfiguration alloc], "initWithTimeFontIdentifier:weight:systemItem:", v12, 1, v14);
  }
  v17 = v16;
LABEL_6:
  +[PRPreferences sharedPreferences](PRPreferences, "sharedPreferences");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isAlternateCalendarEnabled");

  v20 = [PRPosterTitleStyleConfiguration alloc];
  -[PREditingLook groupName](self, "groupName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v24) = v19;
  v22 = -[PRPosterTitleStyleConfiguration initWithTimeFontConfiguration:preferredTitleAlignment:preferredTitleLayout:titleColor:timeNumberingSystem:userConfigured:contentsLuminance:alternateDateEnabled:groupName:](v20, "initWithTimeFontConfiguration:preferredTitleAlignment:preferredTitleLayout:titleColor:timeNumberingSystem:userConfigured:contentsLuminance:alternateDateEnabled:groupName:", v17, 0, 0, v11, v9, 0, a4, v24, v21);

  return v22;
}

+ (PREditingLook)allocWithZone:(_NSZone *)a3
{
  id v5;
  objc_super v7;

  objc_opt_self();
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == a1)
    return (PREditingLook *)+[PREditingLook allocWithZone:](PRImmutableEditingLook, "allocWithZone:", a3);
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___PREditingLook;
  return (PREditingLook *)objc_msgSendSuper2(&v7, sel_allocWithZone_, a3);
}

- (PREditingLook)initWithIdentifier:(id)a3 displayName:(id)a4 initialTimeFontConfiguration:(id)a5 initialTitleColor:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  PRImmutableEditingLook *v16;
  PREditingLook *p_super;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_opt_self();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PREditingLook isMemberOfClass:](self, "isMemberOfClass:", v14);

  if (v15)
  {
    v16 = -[PRImmutableEditingLook initWithIdentifier:displayName:initialTimeFontConfiguration:initialTitleColor:]([PRImmutableEditingLook alloc], "initWithIdentifier:displayName:initialTimeFontConfiguration:initialTitleColor:", v10, v11, v12, v13);
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)PREditingLook;
    v16 = -[PREditingLook init](&v19, sel_init);
    self = &v16->super;
  }
  p_super = &v16->super;

  return p_super;
}

- (PREditingLook)initWithDisplayName:(id)a3 initialTimeFontConfiguration:(id)a4 initialTitleColor:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  PREditingLook *v14;

  v8 = (void *)MEMORY[0x1E0CB3A28];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PREditingLook initWithIdentifier:displayName:initialTimeFontConfiguration:initialTitleColor:](self, "initWithIdentifier:displayName:initialTimeFontConfiguration:initialTitleColor:", v13, v11, v10, v9);

  return v14;
}

- (PREditingLook)initWithIdentifier:(id)a3 displayName:(id)a4 initialTimeFont:(id)a5 initialTitleColor:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  PRTimeFontConfiguration *v14;
  PREditingLook *v15;
  PREditingLook *v16;
  PREditingLook *v17;

  v10 = a5;
  v11 = a6;
  v12 = a4;
  v13 = a3;
  if (v10)
  {
    v14 = -[PRTimeFontConfiguration initWithCustomFont:]([PRTimeFontConfiguration alloc], "initWithCustomFont:", v10);
    v15 = -[PREditingLook initWithIdentifier:displayName:initialTimeFontConfiguration:initialTitleColor:](self, "initWithIdentifier:displayName:initialTimeFontConfiguration:initialTitleColor:", v13, v12, v14, v11);

    v16 = v15;
  }
  else
  {
    v17 = -[PREditingLook initWithIdentifier:displayName:initialTimeFontConfiguration:initialTitleColor:](self, "initWithIdentifier:displayName:initialTimeFontConfiguration:initialTitleColor:", v13, v12, 0, v11);

    v16 = v17;
  }

  return v16;
}

- (PREditingLook)initWithDisplayName:(id)a3 initialTimeFont:(id)a4 initialTitleColor:(id)a5
{
  id v8;
  id v9;
  id v10;
  PRTimeFontConfiguration *v11;
  PREditingLook *v12;
  PREditingLook *v13;
  PREditingLook *v14;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  if (v8)
  {
    v11 = -[PRTimeFontConfiguration initWithCustomFont:]([PRTimeFontConfiguration alloc], "initWithCustomFont:", v8);
    v12 = -[PREditingLook initWithDisplayName:initialTimeFontConfiguration:initialTitleColor:](self, "initWithDisplayName:initialTimeFontConfiguration:initialTitleColor:", v10, v11, v9);

    v13 = v12;
  }
  else
  {
    v14 = -[PREditingLook initWithDisplayName:initialTimeFontConfiguration:initialTitleColor:](self, "initWithDisplayName:initialTimeFontConfiguration:initialTitleColor:", v10, 0, v9);

    v13 = v14;
  }

  return v13;
}

- (PREditingLook)initWithIdentifier:(id)a3 displayName:(id)a4
{
  return -[PREditingLook initWithIdentifier:displayName:initialTimeFontConfiguration:initialTitleColor:](self, "initWithIdentifier:displayName:initialTimeFontConfiguration:initialTitleColor:", a3, a4, 0, 0);
}

- (PREditingLook)initWithDisplayName:(id)a3
{
  return -[PREditingLook initWithDisplayName:initialTimeFontConfiguration:initialTitleColor:](self, "initWithDisplayName:initialTimeFontConfiguration:initialTitleColor:", a3, 0, 0);
}

- (PREditingLook)initWithLook:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PREditingLook *v9;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "initialTimeFontConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "initialTitleColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[PREditingLook initWithIdentifier:displayName:initialTimeFontConfiguration:initialTitleColor:](self, "initWithIdentifier:displayName:initialTimeFontConfiguration:initialTitleColor:", v5, v6, v7, v8);
  return v9;
}

- (PRTimeFontConfiguration)initialTimeFontConfiguration
{
  void *v2;
  void *v3;

  -[PREditingLook initialProperties](self, "initialProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeFontConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PRTimeFontConfiguration *)v3;
}

- (PRPosterColor)initialTitleColor
{
  void *v2;
  void *v3;

  -[PREditingLook initialProperties](self, "initialProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "titlePosterColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PRPosterColor *)v3;
}

- (BOOL)isEqual:(id)a3
{
  PREditingLook *v4;
  void *v5;
  char isKindOfClass;
  PREditingLook *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  char v16;

  v4 = (PREditingLook *)a3;
  if (self == v4)
  {
    v16 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v7 = v4;
      -[PREditingLook identifier](self, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PREditingLook identifier](v7, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = BSEqualObjects();

      if (v10
        && (-[PREditingLook displayName](self, "displayName"),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            -[PREditingLook displayName](v7, "displayName"),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            v13 = BSEqualObjects(),
            v12,
            v11,
            v13))
      {
        -[PREditingLook initialProperties](self, "initialProperties");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[PREditingLook initialProperties](v7, "initialProperties");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = BSEqualObjects();

      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }
  }

  return v16;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[PREditingLook identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[PREditingLook displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[PREditingLook initialProperties](self, "initialProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
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
  PREditingLook *v11;
  id v12;

  v3 = objc_alloc_init(MEMORY[0x1E0D01750]);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __28__PREditingLook_description__block_invoke;
  v10 = &unk_1E2183900;
  v11 = self;
  v12 = v3;
  v4 = v3;
  objc_msgSend(v4, "appendProem:block:", self, &v7);
  objc_msgSend(v4, "description", v7, v8, v9, v10, v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

uint64_t __28__PREditingLook_description__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendDescriptionToFormatter:", *(_QWORD *)(a1 + 40));
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[PREditingLook initWithLook:](+[PREditingLook allocWithZone:](PRMutableEditingLook, "allocWithZone:", a3), "initWithLook:", self);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  -[PREditingLook identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:withName:", v4, CFSTR("identifier"));

  -[PREditingLook displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:withName:", v5, CFSTR("displayName"));

  -[PREditingLook initialProperties](self, "initialProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v8, "appendObject:withName:", v6, CFSTR("initialProperties"));

}

@end
