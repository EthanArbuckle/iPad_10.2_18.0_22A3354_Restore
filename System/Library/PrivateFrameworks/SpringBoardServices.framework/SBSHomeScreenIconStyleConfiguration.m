@implementation SBSHomeScreenIconStyleConfiguration

+ (SBSHomeScreenIconStyleConfiguration)automaticStyleConfiguration
{
  if (automaticStyleConfiguration_onceToken != -1)
    dispatch_once(&automaticStyleConfiguration_onceToken, &__block_literal_global_36);
  return (SBSHomeScreenIconStyleConfiguration *)(id)automaticStyleConfiguration_automaticStyleConfiguration;
}

void __66__SBSHomeScreenIconStyleConfiguration_automaticStyleConfiguration__block_invoke()
{
  SBSHomeScreenIconStyleConfiguration *v0;
  void *v1;

  v0 = -[SBSHomeScreenIconStyleConfiguration initWithConfigurationType:]([SBSHomeScreenIconStyleConfiguration alloc], "initWithConfigurationType:", 0);
  v1 = (void *)automaticStyleConfiguration_automaticStyleConfiguration;
  automaticStyleConfiguration_automaticStyleConfiguration = (uint64_t)v0;

}

+ (SBSHomeScreenIconStyleConfiguration)lightStyleConfiguration
{
  if (lightStyleConfiguration_onceToken != -1)
    dispatch_once(&lightStyleConfiguration_onceToken, &__block_literal_global_1);
  return (SBSHomeScreenIconStyleConfiguration *)(id)lightStyleConfiguration_lightStyleConfiguration;
}

void __62__SBSHomeScreenIconStyleConfiguration_lightStyleConfiguration__block_invoke()
{
  SBSHomeScreenIconStyleConfiguration *v0;
  void *v1;

  v0 = -[SBSHomeScreenIconStyleConfiguration initWithConfigurationType:]([SBSHomeScreenIconStyleConfiguration alloc], "initWithConfigurationType:", 1);
  v1 = (void *)lightStyleConfiguration_lightStyleConfiguration;
  lightStyleConfiguration_lightStyleConfiguration = (uint64_t)v0;

}

+ (SBSHomeScreenIconStyleConfiguration)darkStyleConfiguration
{
  if (darkStyleConfiguration_onceToken != -1)
    dispatch_once(&darkStyleConfiguration_onceToken, &__block_literal_global_2_0);
  return (SBSHomeScreenIconStyleConfiguration *)(id)darkStyleConfiguration_darkStyleConfiguration;
}

void __61__SBSHomeScreenIconStyleConfiguration_darkStyleConfiguration__block_invoke()
{
  SBSHomeScreenIconStyleConfiguration *v0;
  void *v1;

  v0 = -[SBSHomeScreenIconStyleConfiguration initWithConfigurationType:]([SBSHomeScreenIconStyleConfiguration alloc], "initWithConfigurationType:", 2);
  v1 = (void *)darkStyleConfiguration_darkStyleConfiguration;
  darkStyleConfiguration_darkStyleConfiguration = (uint64_t)v0;

}

+ (id)tintedStyleConfigurationWithTintColor:(id)a3
{
  id v3;
  SBSHomeScreenIconStyleConfiguration *v4;

  v3 = a3;
  v4 = -[SBSHomeScreenIconStyleConfiguration initWithConfigurationType:tintColor:]([SBSHomeScreenIconStyleConfiguration alloc], "initWithConfigurationType:tintColor:", 3, v3);

  return v4;
}

- (SBSHomeScreenIconStyleConfiguration)initWithConfigurationType:(int64_t)a3 tintColor:(id)a4
{
  id v7;
  SBSHomeScreenIconStyleConfiguration *v8;
  SBSHomeScreenIconStyleConfiguration *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SBSHomeScreenIconStyleConfiguration;
  v8 = -[SBSHomeScreenIconStyleConfiguration init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_configurationType = a3;
    objc_storeStrong((id *)&v8->_tintColor, a4);
  }

  return v9;
}

- (SBSHomeScreenIconStyleConfiguration)initWithConfigurationType:(int64_t)a3
{
  return -[SBSHomeScreenIconStyleConfiguration initWithConfigurationType:tintColor:](self, "initWithConfigurationType:tintColor:", a3, 0);
}

- (unint64_t)hash
{
  int64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[SBSHomeScreenIconStyleConfiguration configurationType](self, "configurationType");
  -[SBSHomeScreenIconStyleConfiguration tintColor](self, "tintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") + v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  SBSHomeScreenIconStyleConfiguration *v4;
  void *v5;
  char isKindOfClass;
  SBSHomeScreenIconStyleConfiguration *v7;
  int64_t v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (SBSHomeScreenIconStyleConfiguration *)a3;
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
      v8 = -[SBSHomeScreenIconStyleConfiguration configurationType](self, "configurationType");
      if (v8 == -[SBSHomeScreenIconStyleConfiguration configurationType](v7, "configurationType"))
      {
        -[SBSHomeScreenIconStyleConfiguration tintColor](self, "tintColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBSHomeScreenIconStyleConfiguration tintColor](v7, "tintColor");
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
  return (NSString *)-[SBSHomeScreenIconStyleConfiguration descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
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
  objc_msgSend(v4, "encodeInteger:forKey:", -[SBSHomeScreenIconStyleConfiguration configurationType](self, "configurationType"), CFSTR("configurationType"));
  -[SBSHomeScreenIconStyleConfiguration tintColor](self, "tintColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("tintColor"));

}

- (SBSHomeScreenIconStyleConfiguration)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  SBSHomeScreenIconStyleConfiguration *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("configurationType"));
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("tintColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[SBSHomeScreenIconStyleConfiguration initWithConfigurationType:tintColor:](self, "initWithConfigurationType:tintColor:", v5, v7);
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
  objc_msgSend(v4, "encodeInt64:forKey:", -[SBSHomeScreenIconStyleConfiguration configurationType](self, "configurationType"), CFSTR("configurationType"));
  -[SBSHomeScreenIconStyleConfiguration tintColor](self, "tintColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("tintColor"));

}

- (SBSHomeScreenIconStyleConfiguration)initWithBSXPCCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  SBSHomeScreenIconStyleConfiguration *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("configurationType"));
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("tintColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[SBSHomeScreenIconStyleConfiguration initWithConfigurationType:tintColor:](self, "initWithConfigurationType:tintColor:", v5, v7);
  return v8;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBSHomeScreenIconStyleConfiguration succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[SBSHomeScreenIconStyleConfiguration descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  unint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;

  -[SBSHomeScreenIconStyleConfiguration succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SBSHomeScreenIconStyleConfiguration configurationType](self, "configurationType");
  if (v5 > 3)
    v6 = 0;
  else
    v6 = *((_QWORD *)&off_1E288F118 + v5);
  v7 = (id)objc_msgSend(v4, "appendObject:withName:", v6, CFSTR("configurationType"));
  -[SBSHomeScreenIconStyleConfiguration tintColor](self, "tintColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", v8, CFSTR("tintColor"), 1);

  return v4;
}

- (int64_t)configurationType
{
  return self->_configurationType;
}

- (BSColor)tintColor
{
  return self->_tintColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
}

@end
