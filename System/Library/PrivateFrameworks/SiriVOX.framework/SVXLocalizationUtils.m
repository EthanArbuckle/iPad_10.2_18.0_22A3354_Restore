@implementation SVXLocalizationUtils

- (SVXLocalizationUtils)init
{
  void *v3;
  SVXLocalizationUtils *v4;

  +[SVXBundleUtils sharedInstance](SVXBundleUtils, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SVXLocalizationUtils initWithBundleUtils:](self, "initWithBundleUtils:", v3);

  return v4;
}

- (SVXLocalizationUtils)initWithBundleUtils:(id)a3
{
  id v5;
  SVXLocalizationUtils *v6;
  SVXLocalizationUtils *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SVXLocalizationUtils;
  v6 = -[SVXLocalizationUtils init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_bundleUtils, a3);

  return v7;
}

- (id)getLocalizedStringWithLanguageCode:(id)a3 gender:(int64_t)a4 key:(id)a5
{
  return (id)-[SVXBundleUtilsProtocol getLocalizedStringWithBundle:table:key:languageCode:gender:](self->_bundleUtils, "getLocalizedStringWithBundle:table:key:languageCode:gender:", 0, 0, a5, a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleUtils, 0);
}

@end
