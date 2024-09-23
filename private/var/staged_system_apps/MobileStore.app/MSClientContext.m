@implementation MSClientContext

- (MSClientContext)initWithConfigurationDictionary:(id)a3
{
  MSClientContext *v3;
  uint64_t v4;
  NSBundle *bundle;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MSClientContext;
  v3 = -[MSClientContext initWithConfigurationDictionary:](&v11, "initWithConfigurationDictionary:", a3);
  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    bundle = v3->_bundle;
    v3->_bundle = (NSBundle *)v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSClientContext clientInterface](v3, "clientInterface"));
    objc_msgSend(v6, "setClientIdentifier:", CFSTR("WiFi-Music"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
    objc_msgSend(v6, "setDarkKeyColor:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
    objc_msgSend(v6, "setLightKeyColor:", v8);

    objc_msgSend(v6, "setURLBagKey:forIdentifier:", CFSTR("p2-music-searchHints"), SUURLBagKeySearchHints);
    objc_msgSend(v6, "setURLBagKey:forIdentifier:", CFSTR("p2-music-search"), SUURLBagKeySearch);
    v9 = objc_alloc_init((Class)MSViewControllerFactory);
    objc_msgSend(v6, "setViewControllerFactory:", v9);

  }
  return v3;
}

- (id)localizedStringForKey:(id)a3 inTable:(id)a4
{
  id v6;
  id v7;
  SUUILocalizedStringDictionary *localizedStrings;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  NSBundle *bundle;
  uint64_t v14;
  void *v15;
  id v16;
  SUUILocalizedStringDictionary *v17;
  SUUILocalizedStringDictionary *v18;
  void *v19;

  v6 = a3;
  v7 = a4;
  localizedStrings = self->_localizedStrings;
  if (!localizedStrings)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSClientContext valueForConfigurationKey:](self, "valueForConfigurationKey:", SUUIConfigurationKeyLocale));
    v11 = objc_opt_class(NSString, v10);
    if ((objc_opt_isKindOfClass(v9, v11) & 1) != 0)
    {
      v12 = objc_alloc((Class)NSArray);
      bundle = self->_bundle;
      v14 = SUUIBundle();
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v16 = objc_msgSend(v12, "initWithObjects:", bundle, v15, 0);

      v17 = (SUUILocalizedStringDictionary *)objc_msgSend(objc_alloc((Class)SUUILocalizedStringDictionary), "initWithLocaleName:bundles:", v9, v16);
      v18 = self->_localizedStrings;
      self->_localizedStrings = v17;

    }
    localizedStrings = self->_localizedStrings;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SUUILocalizedStringDictionary localizedStringForKey:inTable:](localizedStrings, "localizedStringForKey:inTable:", v6, v7));

  return v19;
}

- (id)localizedAlertWithError:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  if (self)
    v5 = objc_claimAutoreleasedReturnValue(-[MSClientContext localizedStringForKey:](self, "localizedStringForKey:", CFSTR("GENERIC_ERROR")));
  else
    v5 = objc_claimAutoreleasedReturnValue(+[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("GENERIC_ERROR"), 0));
  v6 = (void *)v5;
  if (v5)
  {
    v7 = objc_alloc_init((Class)UIAlertView);
    if (self)
      v8 = objc_claimAutoreleasedReturnValue(-[MSClientContext localizedStringForKey:](self, "localizedStringForKey:", CFSTR("ERROR_CANCEL_BUTTON")));
    else
      v8 = objc_claimAutoreleasedReturnValue(+[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("ERROR_CANCEL_BUTTON"), 0));
    v9 = (void *)v8;
    objc_msgSend(v7, "addButtonWithTitle:", v8);

    objc_msgSend(v7, "setCancelButtonIndex:", 0);
    objc_msgSend(v7, "setTitle:", v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedStrings, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
}

@end
