@implementation DOCContentUnavailableConfiguration

+ (Class)implClass
{
  return (Class)objc_opt_class(UIContentUnavailableConfiguration);
}

- (id)asUIKit
{
  return self->super._impl;
}

+ (id)emptyConfiguration
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIContentUnavailableConfiguration emptyConfiguration](UIContentUnavailableConfiguration, "emptyConfiguration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "asDOC"));

  return v3;
}

+ (id)emptyProminentConfiguration
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIContentUnavailableConfiguration emptyProminentConfiguration](UIContentUnavailableConfiguration, "emptyProminentConfiguration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "asDOC"));

  return v3;
}

+ (id)emptyExtraProminentConfiguration
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIContentUnavailableConfiguration emptyExtraProminentConfiguration](UIContentUnavailableConfiguration, "emptyExtraProminentConfiguration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "asDOC"));

  return v3;
}

+ (id)loadingConfiguration
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIContentUnavailableConfiguration loadingConfiguration](UIContentUnavailableConfiguration, "loadingConfiguration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "asDOC"));

  return v3;
}

+ (id)searchConfiguration
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIContentUnavailableConfiguration searchConfiguration](UIContentUnavailableConfiguration, "searchConfiguration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "asDOC"));

  return v3;
}

- (UIImage)image
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DOCContentUnavailableConfiguration asUIKit](self, "asUIKit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "image"));

  return (UIImage *)v3;
}

- (void)setImage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[DOCContentUnavailableConfiguration asUIKit](self, "asUIKit"));
  objc_msgSend(v5, "setImage:", v4);

}

- (UIColor)textColor
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DOCContentUnavailableConfiguration asUIKit](self, "asUIKit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "textProperties"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "color"));

  return (UIColor *)v4;
}

- (void)setTextColor:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[DOCContentUnavailableConfiguration asUIKit](self, "asUIKit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "textProperties"));
  objc_msgSend(v5, "setColor:", v4);

}

- (NSString)text
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DOCContentUnavailableConfiguration asUIKit](self, "asUIKit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "text"));

  return (NSString *)v3;
}

- (void)setText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[DOCContentUnavailableConfiguration asUIKit](self, "asUIKit"));
  objc_msgSend(v5, "setText:", v4);

}

- (NSString)secondaryText
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DOCContentUnavailableConfiguration asUIKit](self, "asUIKit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "secondaryText"));

  return (NSString *)v3;
}

- (void)setSecondaryText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[DOCContentUnavailableConfiguration asUIKit](self, "asUIKit"));
  objc_msgSend(v5, "setSecondaryText:", v4);

}

- (DOCContentUnavailableButtonProperties)buttonProperties
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DOCContentUnavailableConfiguration asUIKit](self, "asUIKit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "buttonProperties"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "asDOC"));

  return (DOCContentUnavailableButtonProperties *)v4;
}

- (id)makeContentView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DOCContentUnavailableConfiguration asUIKit](self, "asUIKit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "makeContentView"));

  return v3;
}

- (id)updatedConfigurationForState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_opt_class(self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DOCContentUnavailableConfiguration asUIKit](self, "asUIKit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "updatedConfigurationForState:", v4));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "instanceWrappingImpl:", v7));
  return v8;
}

@end
