@implementation REEpubPlugin

- (void)setStoreController:(id)a3
{
  objc_storeStrong((id *)&self->_storeController, a3);
}

- (void)setEngagementManager:(id)a3
{
  objc_storeStrong((id *)&self->_engagementManager, a3);
}

- (REEpubPlugin)initWithStoreController:(id)a3 engagementManager:(id)a4
{
  id v6;
  id v7;
  REEpubPlugin *v8;
  REEpubPlugin *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)REEpubPlugin;
  v8 = -[REEpubPlugin init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    -[REEpubPlugin setStoreController:](v8, "setStoreController:", v6);
    -[REEpubPlugin setEngagementManager:](v9, "setEngagementManager:", v7);
  }

  return v9;
}

+ (id)associatedAssetType
{
  return CFSTR("application/ePub");
}

- (id)associatedAssetType
{
  return CFSTR("application/ePub");
}

- (id)newViewControllerForAEBookInfo:(id)a3 storeID:(id)a4
{
  id v5;
  void *v6;
  unsigned int v7;
  void *v8;
  unsigned __int8 v9;
  REBookReaderModuleHost *v10;
  void *v12;
  void *v13;
  void *v14;
  REBookReaderHostLayoutController *v15;
  REBookReaderModuleHost *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v7 = objc_msgSend(v6, "BOOLForKey:", CFSTR("REI.EnableFixedLayout"));

  if (v5
    && (!objc_msgSend(v5, "isFixedLayout") || v7 && objc_msgSend(v5, "isFixedLayout"))
    && (v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dcTermsContributor")),
        v9 = objc_msgSend(v8, "hasPrefix:", CFSTR("iBooks Author")),
        v8,
        (v9 & 1) == 0))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate sceneManager](BKAppDelegate, "sceneManager"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "currentSceneController"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_mainViewControllerForModalPresenting"));
    if (v14)
    {
      v15 = -[REBookReaderHostLayoutController initWithViewController:]([REBookReaderHostLayoutController alloc], "initWithViewController:", v14);
      v16 = [REBookReaderModuleHost alloc];
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotationProvider sharedInstance](AEAnnotationProvider, "sharedInstance"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[REEpubPlugin storeController](self, "storeController"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "styleManager"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[REEpubPlugin engagementManager](self, "engagementManager"));
      v10 = -[REBookReaderModuleHost initWithHostEnvironmentProvider:book:annotationProvider:storeController:styleManager:engagementManager:](v16, "initWithHostEnvironmentProvider:book:annotationProvider:storeController:styleManager:engagementManager:", v15, v5, v17, v18, v19, v20);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)prewarmSharedResourcesWithCompletion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  id v9;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale preferredLanguages](NSLocale, "preferredLanguages"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", 0));

  if (v9
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale localeWithLocaleIdentifier:](NSLocale, "localeWithLocaleIdentifier:"))) != 0)
  {
    v6 = v5;
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "languageCode"));

  }
  else
  {
    v7 = CFSTR("en");
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKFontCache sharedInstance](BKFontCache, "sharedInstance"));
  objc_msgSend(v8, "prewarmFontsForLanguage:completion:", v7, v3);

}

- (id)helperForURL:(id)a3 withOptions:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = objc_msgSend(objc_alloc((Class)AEEPubBookHelper), "initWithDelegate:forURL:", self, v5);

  return v6;
}

- (BKStoreController)storeController
{
  return self->_storeController;
}

- (BKEngagementManager)engagementManager
{
  return self->_engagementManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engagementManager, 0);
  objc_storeStrong((id *)&self->_storeController, 0);
}

@end
