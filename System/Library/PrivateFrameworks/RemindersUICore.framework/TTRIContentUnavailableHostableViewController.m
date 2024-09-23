@implementation TTRIContentUnavailableHostableViewController

- (void)_updateContentUnavailableConfigurationUsingState:(id)a3
{
  id v4;

  objc_msgSend(a3, "asTTRI");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[TTRIContentUnavailableHostableViewController ttr_updateContentUnavailableConfigurationUsingState:](self, "ttr_updateContentUnavailableConfigurationUsingState:", v4);

}

- (void)ttr_updateContentUnavailableConfigurationUsingState:(id)a3
{
  void *v4;
  objc_super v5;

  objc_msgSend(a3, "asUIKit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5.receiver = self;
  v5.super_class = (Class)TTRIContentUnavailableHostableViewController;
  -[TTRIContentUnavailableHostableViewController _updateContentUnavailableConfigurationUsingState:](&v5, sel__updateContentUnavailableConfigurationUsingState_, v4);

}

- (id)_contentUnavailableConfigurationState
{
  void *v2;
  void *v3;

  -[TTRIContentUnavailableHostableViewController ttr_contentUnavailableConfigurationState](self, "ttr_contentUnavailableConfigurationState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "asUIKit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (TTRIContentUnavailableConfigurationState)ttr_contentUnavailableConfigurationState
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TTRIContentUnavailableHostableViewController;
  -[TTRIContentUnavailableHostableViewController _contentUnavailableConfigurationState](&v5, sel__contentUnavailableConfigurationState);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "asTTRI");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (TTRIContentUnavailableConfigurationState *)v3;
}

- (void)_setContentUnavailableConfiguration:(id)a3
{
  id v4;

  objc_msgSend(a3, "asTTRI");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[TTRIContentUnavailableHostableViewController ttr_setContentUnavailableConfiguration:](self, "ttr_setContentUnavailableConfiguration:", v4);

}

- (void)ttr_setContentUnavailableConfiguration:(id)a3
{
  void *v4;
  objc_super v5;

  objc_msgSend(a3, "asUIKit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5.receiver = self;
  v5.super_class = (Class)TTRIContentUnavailableHostableViewController;
  -[TTRIContentUnavailableHostableViewController _setContentUnavailableConfiguration:](&v5, sel__setContentUnavailableConfiguration_, v4);

}

- (id)_contentUnavailableConfiguration
{
  void *v2;
  void *v3;

  -[TTRIContentUnavailableHostableViewController ttr_contentUnavailableConfiguration](self, "ttr_contentUnavailableConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "asUIKit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (TTRIContentUnavailableConfiguration)ttr_contentUnavailableConfiguration
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TTRIContentUnavailableHostableViewController;
  -[TTRIContentUnavailableHostableViewController _contentUnavailableConfiguration](&v5, sel__contentUnavailableConfiguration);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "asTTRI");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (TTRIContentUnavailableConfiguration *)v3;
}

@end
