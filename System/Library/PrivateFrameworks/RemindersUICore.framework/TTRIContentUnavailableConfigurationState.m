@implementation TTRIContentUnavailableConfigurationState

+ (Class)implClass
{
  return (Class)objc_opt_class();
}

- (id)asUIKit
{
  return self->super._impl;
}

- (NSString)searchControllerText
{
  void *v2;
  void *v3;

  -[TTRIContentUnavailableConfigurationState asUIKit](self, "asUIKit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchControllerText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setSearchControllerText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TTRIContentUnavailableConfigurationState asUIKit](self, "asUIKit");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSearchControllerText:", v4);

}

- (TTRIContentUnavailableConfigurationState)initWithTraitCollection:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  TTRIContentUnavailableConfigurationState *v7;

  v4 = (objc_class *)MEMORY[0x1E0DC36A0];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithTraitCollection:", v5);

  objc_msgSend((id)objc_opt_class(), "instanceWrappingImpl:", v6);
  v7 = (TTRIContentUnavailableConfigurationState *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (UITraitCollection)traitCollection
{
  void *v2;
  void *v3;

  -[TTRIContentUnavailableConfigurationState asUIKit](self, "asUIKit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITraitCollection *)v3;
}

- (id)customStateForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[TTRIContentUnavailableConfigurationState asUIKit](self, "asUIKit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "customStateForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setCustomState:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[TTRIContentUnavailableConfigurationState asUIKit](self, "asUIKit");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCustomState:forKey:", v7, v6);

}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[TTRIContentUnavailableConfigurationState asUIKit](self, "asUIKit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[TTRIContentUnavailableConfigurationState asUIKit](self, "asUIKit");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v6);

}

@end
