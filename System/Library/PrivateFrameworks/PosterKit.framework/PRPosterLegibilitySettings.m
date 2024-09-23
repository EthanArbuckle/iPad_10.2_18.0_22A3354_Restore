@implementation PRPosterLegibilitySettings

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRPosterLegibilitySettings)initWithCoder:(id)a3
{
  id v4;
  PRPosterLegibilitySettings *v5;
  uint64_t v6;
  PUIPosterLegibilitySettings *underlyingLegibilitySettings;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PRPosterLegibilitySettings;
  v5 = -[PRPosterLegibilitySettings init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_underlyingLegibilitySettings"));
    v6 = objc_claimAutoreleasedReturnValue();
    underlyingLegibilitySettings = v5->_underlyingLegibilitySettings;
    v5->_underlyingLegibilitySettings = (PUIPosterLegibilitySettings *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_underlyingLegibilitySettings, CFSTR("_underlyingLegibilitySettings"));
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_underlyingLegibilitySettings, CFSTR("_underlyingLegibilitySettings"));
}

- (PRPosterLegibilitySettings)initWithBSXPCCoder:(id)a3
{
  id v4;
  PRPosterLegibilitySettings *v5;
  uint64_t v6;
  PUIPosterLegibilitySettings *underlyingLegibilitySettings;
  PRPosterLegibilitySettings *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PRPosterLegibilitySettings;
  v5 = -[PRPosterLegibilitySettings init](&v10, sel_init);
  if (v5
    && (objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_underlyingLegibilitySettings")),
        v6 = objc_claimAutoreleasedReturnValue(),
        underlyingLegibilitySettings = v5->_underlyingLegibilitySettings,
        v5->_underlyingLegibilitySettings = (PUIPosterLegibilitySettings *)v6,
        underlyingLegibilitySettings,
        !v5->_underlyingLegibilitySettings))
  {
    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

+ (id)legibilitySettingsForContentColor:(id)a3 contrast:(double)a4
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D7FCF0], "legibilitySettingsForContentColor:contrast:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "prLegibilitySettingsForPUILegibilitySettings:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)legibilitySettingsForStyle:(int64_t)a3 primaryColor:(id)a4 secondaryColor:(id)a5 shadowColor:(id)a6
{
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D7FCF0], "legibilitySettingsForStyle:primaryColor:secondaryColor:shadowColor:", a3, a4, a5, a6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "prLegibilitySettingsForPUILegibilitySettings:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)prLegibilitySettingsForPUILegibilitySettings:(id)a3
{
  id v4;
  PRPosterLegibilitySettings *v5;

  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(PRPosterLegibilitySettings);
    objc_storeStrong((id *)&v5->_underlyingLegibilitySettings, a3);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (PRPosterLegibilitySettings)legibilitySettingsWithUILegibilitySettings:(id)a3
{
  void *v4;
  void *v5;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0D7FCF0], "legibilitySettingsWithUILegibilitySettings:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "prLegibilitySettingsForPUILegibilitySettings:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return (PRPosterLegibilitySettings *)v5;
}

- (id)legibilitySettingsByApplyingShadowRadiusMultiplier:(double)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_opt_class();
  -[PUIPosterLegibilitySettings legibilitySettingsByApplyingShadowRadiusMultiplier:](self->_underlyingLegibilitySettings, "legibilitySettingsByApplyingShadowRadiusMultiplier:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "prLegibilitySettingsForPUILegibilitySettings:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)legibilitySettingsByOverridingShadowAlpha:(double)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_opt_class();
  -[PUIPosterLegibilitySettings legibilitySettingsByOverridingShadowAlpha:](self->_underlyingLegibilitySettings, "legibilitySettingsByOverridingShadowAlpha:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "prLegibilitySettingsForPUILegibilitySettings:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PRPosterLegibilitySettings *v4;
  uint64_t v5;
  PUIPosterLegibilitySettings *underlyingLegibilitySettings;

  v4 = -[PRPosterLegibilitySettings init](+[PRPosterLegibilitySettings allocWithZone:](PRPosterLegibilitySettings, "allocWithZone:", a3), "init");
  v5 = -[PUIPosterLegibilitySettings copy](self->_underlyingLegibilitySettings, "copy");
  underlyingLegibilitySettings = v4->_underlyingLegibilitySettings;
  v4->_underlyingLegibilitySettings = (PUIPosterLegibilitySettings *)v5;

  return v4;
}

- (id)convertToUILegibility
{
  return (id)-[PUIPosterLegibilitySettings convertToUILegibility](self->_underlyingLegibilitySettings, "convertToUILegibility");
}

- (BOOL)isEqual:(id)a3
{
  PRPosterLegibilitySettings *v4;
  PRPosterLegibilitySettings *v5;
  BOOL v6;

  v4 = (PRPosterLegibilitySettings *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (self == v4)
  {
    v6 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = -[PRPosterLegibilitySettings isEqualToLegibilitySettings:](self, "isEqualToLegibilitySettings:", v5);
  else
LABEL_5:
    v6 = 0;
LABEL_7:

  return v6;
}

- (BOOL)isEqualToLegibilitySettings:(id)a3
{
  PRPosterLegibilitySettings *v4;
  PRPosterLegibilitySettings *v5;
  char v6;

  v4 = (PRPosterLegibilitySettings *)a3;
  v5 = v4;
  if (v4)
  {
    if (self == v4)
      v6 = 1;
    else
      v6 = -[PUIPosterLegibilitySettings isEqual:](v4->_underlyingLegibilitySettings, "isEqual:", self->_underlyingLegibilitySettings);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingLegibilitySettings, 0);
}

@end
