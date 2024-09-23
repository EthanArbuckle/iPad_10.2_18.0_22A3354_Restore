@implementation SSPhotosFromAppSectionBuilder

+ (id)supportedBundleIds
{
  if (supportedBundleIds_onceToken != -1)
    dispatch_once(&supportedBundleIds_onceToken, &__block_literal_global_58);
  return (id)supportedBundleIds_bundleIDs;
}

void __51__SSPhotosFromAppSectionBuilder_supportedBundleIds__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;

  SSBundleIdentifiersForSyndicatedPhotos();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(v0, "mutableCopy");

  objc_msgSend(v1, "removeObject:", CFSTR("com.apple.mobileslideshow"));
  v2 = (void *)supportedBundleIds_bundleIDs;
  supportedBundleIds_bundleIDs = (uint64_t)v1;

}

- (void)setSection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SSPhotosFromAppSectionBuilder;
  v4 = a3;
  -[SSSectionBuilder setSection:](&v8, sel_setSection_, v4);
  objc_msgSend(v4, "results", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applicationBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSPhotosFromAppSectionBuilder setAppBundleId:](self, "setAppBundleId:", v7);

}

- (id)buildButtonItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[SSSectionBuilder queryContext](self, "queryContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchEntities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "searchString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
      objc_msgSend(v5, "searchString");
    else
      objc_msgSend(v5, "displayString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "searchString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)objc_opt_new();
  -[SSPhotosFromAppSectionBuilder appBundleId](self, "appBundleId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setApplicationBundleIdentifier:", v9);

  objc_msgSend(v8, "setSearchString:", v7);
  objc_msgSend((id)objc_opt_class(), "searchInAppButtonItemWithCommand:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)buildTitle
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[SSSectionBuilder queryContext](self, "queryContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchEntities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isPhotosEntitySearch");

  -[SSPhotosFromAppSectionBuilder appBundleId](self, "appBundleId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SSAppNameForBundleId(v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((v6 & 1) == 0)
  {
    v9 = v8;
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.mobileslideshow")) & 1) == 0)
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("PHOTOS_TITLE_FORMAT"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringWithFormat:", v12, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  objc_msgSend(MEMORY[0x1E0D8C660], "textWithString:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (int64_t)maxCardSections
{
  SSPhotosFromAppSectionBuilder **v3;
  SSPhotosFromAppSectionBuilder *v5;
  SSPhotosFromAppSectionBuilder *v6;

  if (SSSnippetModernizationEnabled())
  {
    v6 = self;
    v3 = &v6;
  }
  else
  {
    if ((isMacOS() & 1) != 0)
      return 12;
    v5 = self;
    v3 = &v5;
  }
  v3[1] = (SSPhotosFromAppSectionBuilder *)SSPhotosFromAppSectionBuilder;
  return (int64_t)objc_msgSendSuper2((objc_super *)v3, sel_maxCardSections, v5);
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (void)setAppBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_appBundleId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appBundleId, 0);
}

@end
