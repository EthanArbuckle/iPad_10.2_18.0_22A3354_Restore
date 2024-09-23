@implementation XBStatusBarSettings

- (XBStatusBarSettings)init
{
  id v3;
  XBStatusBarSettings *v4;

  v3 = objc_alloc_init(MEMORY[0x24BE383D8]);
  v4 = -[XBStatusBarSettings _initWithBSSettings:](self, "_initWithBSSettings:", v3);

  return v4;
}

- (id)_initWithBSSettings:(id)a3
{
  id v4;
  XBStatusBarSettings *v5;
  uint64_t v6;
  BSMutableSettings *settings;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)XBStatusBarSettings;
  v5 = -[XBStatusBarSettings init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
    settings = v5->_settings;
    v5->_settings = (BSMutableSettings *)v6;

    -[BSMutableSettings setDescriptionProvider:](v5->_settings, "setDescriptionProvider:", v5);
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[BSMutableSettings setDescriptionProvider:](self->_settings, "setDescriptionProvider:", 0);
  v3.receiver = self;
  v3.super_class = (Class)XBStatusBarSettings;
  -[XBStatusBarSettings dealloc](&v3, sel_dealloc);
}

- (int64_t)style
{
  void *v2;
  void *v3;
  int64_t v4;

  -[BSMutableSettings objectForSetting:](self->_settings, "objectForSetting:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = -1;

  return v4;
}

- (BOOL)isHidden
{
  return -[BSMutableSettings BOOLForSetting:](self->_settings, "BOOLForSetting:", 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  BSMutableSettings *settings;
  void *v5;
  id v6;

  settings = self->_settings;
  v6 = a3;
  objc_msgSend(v6, "encodeInteger:forKey:", -[BSMutableSettings flagForSetting:](settings, "flagForSetting:", 1), CFSTR("hidden"));
  -[BSMutableSettings objectForSetting:](self->_settings, "objectForSetting:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("style"));

  objc_msgSend(v6, "encodeInteger:forKey:", -[BSMutableSettings flagForSetting:](self->_settings, "flagForSetting:", 3), CFSTR("isBackgroundActivityEnabled"));
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BE38380], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[XBStatusBarSettings isHidden](self, "isHidden"), CFSTR("hidden"));
  objc_msgSend(MEMORY[0x24BDF6800], "stringForStatusBarStyle:", -[XBStatusBarSettings style](self, "style"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", v5, CFSTR("style"));

  v7 = (id)objc_msgSend(v3, "appendBool:withName:", -[XBStatusBarSettings isBackgroundActivityEnabled](self, "isBackgroundActivityEnabled"), CFSTR("backgroundActivityEnabled"));
  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (BOOL)isBackgroundActivityEnabled
{
  return -[BSMutableSettings BOOLForSetting:](self->_settings, "BOOLForSetting:", 3);
}

- (BOOL)isEqual:(id)a3
{
  XBStatusBarSettings *v4;
  _BOOL4 v5;
  _BOOL4 v6;
  int64_t v7;
  char v8;

  v4 = (XBStatusBarSettings *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v5 = -[XBStatusBarSettings isHidden](self, "isHidden"), v5 == -[XBStatusBarSettings isHidden](v4, "isHidden"))
      && (v6 = -[XBStatusBarSettings isBackgroundActivityEnabled](self, "isBackgroundActivityEnabled"),
          v6 == -[XBStatusBarSettings isBackgroundActivityEnabled](v4, "isBackgroundActivityEnabled"))
      && (v7 = -[XBStatusBarSettings style](self, "style"), v7 == -[XBStatusBarSettings style](v4, "style")))
    {
      v8 = -[BSMutableSettings isEqual:](self->_settings, "isEqual:", v4->_settings);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  unint64_t v8;

  objc_msgSend(MEMORY[0x24BE38398], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:", -[XBStatusBarSettings isHidden](self, "isHidden"));
  v5 = (id)objc_msgSend(v3, "appendBool:", -[XBStatusBarSettings isBackgroundActivityEnabled](self, "isBackgroundActivityEnabled"));
  v6 = (id)objc_msgSend(v3, "appendInteger:", -[XBStatusBarSettings style](self, "style"));
  v7 = (id)objc_msgSend(v3, "appendObject:", self->_settings);
  v8 = objc_msgSend(v3, "hash");

  return v8;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[XBStatusBarSettings _initWithBSSettings:]([XBMutableStatusBarSettings alloc], "_initWithBSSettings:", self->_settings);
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 - 1 > 2)
    return 0;
  else
    return *(&off_24D7F5200 + a3 - 1);
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v6 = a4;
  v7 = v6;
  if (a5 != 3)
  {
    if (a5 == 2)
    {
      objc_msgSend(MEMORY[0x24BDF6800], "stringForStatusBarStyle:", objc_msgSend(v6, "integerValue"));
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    if (a5 != 1)
    {
      v9 = 0;
      goto LABEL_8;
    }
  }
  BSSettingFlagDescription();
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v9 = (void *)v8;
LABEL_8:

  return v9;
}

- (XBStatusBarSettings)initWithCoder:(id)a3
{
  id v4;
  XBStatusBarSettings *v5;
  XBStatusBarSettings *v6;
  BSMutableSettings *settings;
  void *v8;

  v4 = a3;
  v5 = -[XBStatusBarSettings init](self, "init");
  v6 = v5;
  if (v5)
  {
    -[BSMutableSettings setFlag:forSetting:](v5->_settings, "setFlag:forSetting:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("hidden")), 1);
    settings = v6->_settings;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("style"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSMutableSettings setObject:forSetting:](settings, "setObject:forSetting:", v8, 2);

    -[BSMutableSettings setFlag:forSetting:](v6->_settings, "setFlag:forSetting:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("isBackgroundActivityEnabled")), 3);
  }

  return v6;
}

@end
