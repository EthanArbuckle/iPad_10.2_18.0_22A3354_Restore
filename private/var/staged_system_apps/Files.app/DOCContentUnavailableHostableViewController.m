@implementation DOCContentUnavailableHostableViewController

- (DOCContentUnavailableConfigurationState)docContentUnavailableConfigurationState
{
  id v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DOCContentUnavailableHostableViewController;
  v2 = -[DOCContentUnavailableHostableViewController _contentUnavailableConfigurationState](&v6, "_contentUnavailableConfigurationState");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "asDOC"));

  return (DOCContentUnavailableConfigurationState *)v4;
}

- (id)_contentUnavailableConfigurationState
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DOCContentUnavailableHostableViewController docContentUnavailableConfigurationState](self, "docContentUnavailableConfigurationState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "asUIKit"));

  return v3;
}

- (void)docSetNeedsUpdateContentUnavailableConfiguration
{
  -[DOCContentUnavailableHostableViewController _setNeedsUpdateContentUnavailableConfiguration](self, "_setNeedsUpdateContentUnavailableConfiguration");
}

- (void)doc_setContentUnavailableConfiguration:(id)a3
{
  void *v4;
  objc_super v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "asUIKit"));
  v5.receiver = self;
  v5.super_class = (Class)DOCContentUnavailableHostableViewController;
  -[DOCContentUnavailableHostableViewController _setContentUnavailableConfiguration:](&v5, "_setContentUnavailableConfiguration:", v4);

}

- (void)docUpdateContentUnavailableConfigurationUsingState:(id)a3
{
  void *v4;
  objc_super v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "asUIKit"));
  v5.receiver = self;
  v5.super_class = (Class)DOCContentUnavailableHostableViewController;
  -[DOCContentUnavailableHostableViewController _updateContentUnavailableConfigurationUsingState:](&v5, "_updateContentUnavailableConfigurationUsingState:", v4);

}

- (DOCContentUnavailableConfiguration)docContentUnavailableConfiguration
{
  id v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DOCContentUnavailableHostableViewController;
  v2 = -[DOCContentUnavailableHostableViewController _contentUnavailableConfiguration](&v6, "_contentUnavailableConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "asDOC"));

  return (DOCContentUnavailableConfiguration *)v4;
}

- (void)_updateContentUnavailableConfigurationUsingState:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "asDOC"));
  -[DOCContentUnavailableHostableViewController docUpdateContentUnavailableConfigurationUsingState:](self, "docUpdateContentUnavailableConfigurationUsingState:", v4);

}

- (void)_setContentUnavailableConfiguration:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "asDOC"));
  -[DOCContentUnavailableHostableViewController doc_setContentUnavailableConfiguration:](self, "doc_setContentUnavailableConfiguration:", v4);

}

- (id)_contentUnavailableConfiguration
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DOCContentUnavailableHostableViewController docContentUnavailableConfiguration](self, "docContentUnavailableConfiguration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "asUIKit"));

  return v3;
}

@end
