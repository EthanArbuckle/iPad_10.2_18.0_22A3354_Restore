@implementation SBHIconImageAppearance

+ (SBHIconImageAppearance)lightAppearance
{
  if (lightAppearance_onceToken != -1)
    dispatch_once(&lightAppearance_onceToken, &__block_literal_global_78);
  return (SBHIconImageAppearance *)(id)lightAppearance_lightAppearance;
}

void __41__SBHIconImageAppearance_lightAppearance__block_invoke()
{
  SBHLightIconImageAppearance *v0;
  void *v1;

  v0 = objc_alloc_init(SBHLightIconImageAppearance);
  v1 = (void *)lightAppearance_lightAppearance;
  lightAppearance_lightAppearance = (uint64_t)v0;

}

+ (SBHIconImageAppearance)darkAppearance
{
  if (darkAppearance_onceToken != -1)
    dispatch_once(&darkAppearance_onceToken, &__block_literal_global_1_1);
  return (SBHIconImageAppearance *)(id)darkAppearance_darkAppearance;
}

void __40__SBHIconImageAppearance_darkAppearance__block_invoke()
{
  SBHDarkIconImageAppearance *v0;
  void *v1;

  v0 = objc_alloc_init(SBHDarkIconImageAppearance);
  v1 = (void *)darkAppearance_darkAppearance;
  darkAppearance_darkAppearance = (uint64_t)v0;

}

+ (id)tintedAppearanceWithTintColor:(id)a3
{
  id v3;
  SBHTintedIconImageAppearance *v4;

  v3 = a3;
  v4 = -[SBHTintedIconImageAppearance initWithAppearanceType:tintColor:]([SBHTintedIconImageAppearance alloc], "initWithAppearanceType:tintColor:", 2, v3);

  return v4;
}

+ (SBHIconImageAppearance)tintableAppearance
{
  if (tintableAppearance_onceToken != -1)
    dispatch_once(&tintableAppearance_onceToken, &__block_literal_global_4_2);
  return (SBHIconImageAppearance *)(id)tintableAppearance_tintableAppearance;
}

void __44__SBHIconImageAppearance_tintableAppearance__block_invoke()
{
  SBHTintableIconImageAppearance *v0;
  void *v1;

  v0 = objc_alloc_init(SBHTintableIconImageAppearance);
  v1 = (void *)tintableAppearance_tintableAppearance;
  tintableAppearance_tintableAppearance = (uint64_t)v0;

}

+ (id)sharedInstanceForAppearanceType:(int64_t)a3
{
  void *v3;

  if (a3 == 3)
  {
    objc_msgSend(a1, "tintableAppearance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3 == 1)
  {
    objc_msgSend(a1, "darkAppearance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(a1, "lightAppearance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

+ (void)initialize
{
  id v3;
  SBHPlaceholderIconImageAppearance *v4;
  void *v5;

  objc_opt_self();
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
  {
    v4 = [SBHPlaceholderIconImageAppearance alloc];
    v5 = (void *)reusablePlaceholderImageAppearance;
    reusablePlaceholderImageAppearance = (uint64_t)v4;

  }
}

+ (SBHIconImageAppearance)allocWithZone:(_NSZone *)a3
{
  id v5;
  objc_super v7;

  objc_opt_self();
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == a1)
    return (SBHIconImageAppearance *)(id)reusablePlaceholderImageAppearance;
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___SBHIconImageAppearance;
  return (SBHIconImageAppearance *)objc_msgSendSuper2(&v7, sel_allocWithZone_, a3);
}

- (SBHIconImageAppearance)initWithAppearanceType:(int64_t)a3 tintColor:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  SBHTintedIconImageAppearance *v10;
  objc_super v12;

  v6 = a4;
  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBHIconImageAppearance isMemberOfClass:](self, "isMemberOfClass:", v7))
  {

  }
  else
  {
    objc_opt_self();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[SBHIconImageAppearance isMemberOfClass:](self, "isMemberOfClass:", v8);

    if (!v9)
    {
      v12.receiver = self;
      v12.super_class = (Class)SBHIconImageAppearance;
      v10 = -[SBHIconImageAppearance init](&v12, sel_init);
      self = &v10->super;
LABEL_10:
      a3 = (int64_t)v10;
      goto LABEL_11;
    }
  }
  switch(a3)
  {
    case 0:
      +[SBHIconImageAppearance lightAppearance](SBHIconImageAppearance, "lightAppearance");
      v10 = (SBHTintedIconImageAppearance *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 1:
      +[SBHIconImageAppearance darkAppearance](SBHIconImageAppearance, "darkAppearance");
      v10 = (SBHTintedIconImageAppearance *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 2:
      v10 = -[SBHTintedIconImageAppearance initWithAppearanceType:tintColor:]([SBHTintedIconImageAppearance alloc], "initWithAppearanceType:tintColor:", 2, v6);
      goto LABEL_10;
    case 3:
      +[SBHIconImageAppearance tintableAppearance](SBHIconImageAppearance, "tintableAppearance");
      v10 = (SBHTintedIconImageAppearance *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    default:
      break;
  }
LABEL_11:

  return (SBHIconImageAppearance *)a3;
}

- (SBHIconImageAppearance)initWithAppearanceType:(int64_t)a3
{
  return -[SBHIconImageAppearance initWithAppearanceType:tintColor:](self, "initWithAppearanceType:tintColor:", a3, 0);
}

- (SBHIconImageAppearance)init
{
  return -[SBHIconImageAppearance initWithAppearanceType:tintColor:](self, "initWithAppearanceType:tintColor:", 0, 0);
}

- (UIColor)tintColor
{
  return 0;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[SBHIconImageAppearance appearanceType](self, "appearanceType");
  -[SBHIconImageAppearance tintColor](self, "tintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") + v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  SBHIconImageAppearance *v4;
  void *v5;
  char isKindOfClass;
  SBHIconImageAppearance *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (SBHIconImageAppearance *)a3;
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
      v8 = -[SBHIconImageAppearance appearanceType](self, "appearanceType");
      if (v8 == -[SBHIconImageAppearance appearanceType](v7, "appearanceType"))
      {
        -[SBHIconImageAppearance tintColor](self, "tintColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBHIconImageAppearance tintColor](v7, "tintColor");
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
  return (NSString *)-[SBHIconImageAppearance descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
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
  objc_msgSend(v4, "encodeInteger:forKey:", -[SBHIconImageAppearance appearanceType](self, "appearanceType"), CFSTR("appearanceType"));
  -[SBHIconImageAppearance tintColor](self, "tintColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("tintColor"));

}

- (SBHIconImageAppearance)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  SBHIconImageAppearance *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("appearanceType"));
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("tintColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[SBHIconImageAppearance initWithAppearanceType:tintColor:](self, "initWithAppearanceType:tintColor:", v5, v7);
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
  objc_msgSend(v4, "encodeInt64:forKey:", -[SBHIconImageAppearance appearanceType](self, "appearanceType"), CFSTR("appearanceType"));
  -[SBHIconImageAppearance tintColor](self, "tintColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("tintColor"));

}

- (SBHIconImageAppearance)initWithBSXPCCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  SBHIconImageAppearance *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("appearanceType"));
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("tintColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[SBHIconImageAppearance initWithAppearanceType:tintColor:](self, "initWithAppearanceType:tintColor:", v5, v7);
  return v8;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBHIconImageAppearance succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[SBHIconImageAppearance descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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

  -[SBHIconImageAppearance succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconImageAppearance tintColor](self, "tintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", v5, CFSTR("tintColor"), 1);

  return v4;
}

@end
