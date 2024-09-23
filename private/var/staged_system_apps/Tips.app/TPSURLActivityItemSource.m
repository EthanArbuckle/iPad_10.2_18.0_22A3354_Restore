@implementation TPSURLActivityItemSource

- (TPSURLActivityItemSource)initWithTip:(id)a3 appController:(id)a4
{
  id v6;
  id v7;
  TPSURLActivityItemSource *v8;
  TPSURLActivityItemSource *v9;
  id WeakRetained;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  NSURL *url;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)TPSURLActivityItemSource;
  v8 = -[TPSURLActivityItemSource init](&v17, "init");
  v9 = v8;
  if (v8)
  {
    -[TPSURLActivityItemSource setTip:](v8, "setTip:", v6);
    WeakRetained = objc_loadWeakRetained((id *)&v9->_tip);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "webURLPath"));

    if (v11)
    {
      v9->_userInterfaceStyle = 1;
      v12 = objc_loadWeakRetained((id *)&v9->_tip);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "webURLPath"));
      v14 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v13));
      url = v9->_url;
      v9->_url = (NSURL *)v14;

      objc_storeWeak((id *)&v9->_appController, v7);
    }
  }

  return v9;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return self->_url;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  return self->_url;
}

- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5
{
  void *v5;
  void *v6;
  void *v7;

  if (UIActivityTypeAirDrop == a4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[TPSCommonDefines clientBundleIdentifier](TPSCommonDefines, "clientBundleIdentifier", a3, a5.width, a5.height));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v7, "scale");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v6, 1));

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSURLActivityItemSource cacheImage](self, "cacheImage", a3, a5.width, a5.height));
  }
  return v5;
}

- (id)activityViewControllerLinkPresentationMetadata:(id)a3
{
  void *v4;
  id v5;
  TPSTip **p_tip;
  id WeakRetained;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSURLActivityItemSource cacheImage](self, "cacheImage", a3));
  v5 = objc_alloc_init((Class)LPLinkMetadata);
  p_tip = &self->_tip;
  WeakRetained = objc_loadWeakRetained((id *)&self->_tip);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "shortTitle"));
  if (v8)
  {
    objc_msgSend(v5, "setTitle:", v8);
  }
  else
  {
    v9 = objc_loadWeakRetained((id *)p_tip);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "title"));
    objc_msgSend(v5, "setTitle:", v10);

  }
  if (v4)
  {
    v11 = objc_msgSend(objc_alloc((Class)LPImage), "initWithPlatformImage:", v4);
    objc_msgSend(v5, "setImage:", v11);

  }
  return v5;
}

- (id)cacheImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t userInterfaceStyle;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSURLActivityItemSource tip](self, "tip"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSURLActivityItemSource appController](self, "appController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fullContentAssets"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "language"));
  userInterfaceStyle = self->_userInterfaceStyle;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TPSURLActivityItemSource tip](self, "tip"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "assetFileInfoManager"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "assetConfigurationForAssets:language:sizeClass:style:assetFileInfoManager:", v5, v6, 1, userInterfaceStyle, v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "cacheIdentifierForType:", 0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[TPSImageAssetController getImageForIdentifier:](TPSImageAssetController, "getImageForIdentifier:", v11));

  return v12;
}

- (int64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (void)setUserInterfaceStyle:(int64_t)a3
{
  self->_userInterfaceStyle = a3;
}

- (TPSUIAppController)appController
{
  return (TPSUIAppController *)objc_loadWeakRetained((id *)&self->_appController);
}

- (void)setAppController:(id)a3
{
  objc_storeWeak((id *)&self->_appController, a3);
}

- (TPSTip)tip
{
  return (TPSTip *)objc_loadWeakRetained((id *)&self->_tip);
}

- (void)setTip:(id)a3
{
  objc_storeWeak((id *)&self->_tip, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tip);
  objc_destroyWeak((id *)&self->_appController);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
