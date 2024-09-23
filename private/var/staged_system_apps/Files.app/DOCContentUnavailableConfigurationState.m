@implementation DOCContentUnavailableConfigurationState

- (id)asUIKit
{
  return self->super._impl;
}

+ (Class)implClass
{
  return (Class)objc_opt_class(UIContentUnavailableConfigurationState);
}

- (NSString)searchControllerText
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DOCContentUnavailableConfigurationState asUIKit](self, "asUIKit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "searchControllerText"));

  return (NSString *)v3;
}

- (void)setSearchControllerText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[DOCContentUnavailableConfigurationState asUIKit](self, "asUIKit"));
  objc_msgSend(v5, "setSearchControllerText:", v4);

}

- (DOCContentUnavailableConfigurationState)initWithTraitCollection:(id)a3
{
  id v4;
  id v5;
  id v6;
  DOCContentUnavailableConfigurationState *v7;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)UIContentUnavailableConfigurationState), "initWithTraitCollection:", v4);

  v6 = objc_msgSend((id)objc_opt_class(self), "instanceWrappingImpl:", v5);
  v7 = (DOCContentUnavailableConfigurationState *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (UITraitCollection)traitCollection
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DOCContentUnavailableConfigurationState asUIKit](self, "asUIKit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "traitCollection"));

  return (UITraitCollection *)v3;
}

- (id)customStateForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DOCContentUnavailableConfigurationState asUIKit](self, "asUIKit"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "customStateForKey:", v4));

  return v6;
}

- (void)setCustomState:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[DOCContentUnavailableConfigurationState asUIKit](self, "asUIKit"));
  objc_msgSend(v8, "setCustomState:forKey:", v7, v6);

}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DOCContentUnavailableConfigurationState asUIKit](self, "asUIKit"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  return v6;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[DOCContentUnavailableConfigurationState asUIKit](self, "asUIKit"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v6);

}

@end
