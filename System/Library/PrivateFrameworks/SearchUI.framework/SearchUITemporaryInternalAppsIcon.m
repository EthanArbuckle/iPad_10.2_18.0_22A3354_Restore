@implementation SearchUITemporaryInternalAppsIcon

- (SearchUITemporaryInternalAppsIcon)initWithResult:(id)a3 variant:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  SearchUITemporaryInternalAppsIcon *v10;
  objc_super v12;

  v7 = a3;
  objc_msgSend(v7, "applicationBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "applicationBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)SearchUITemporaryInternalAppsIcon;
  v10 = -[SBLeafIcon initWithLeafIdentifier:applicationBundleID:](&v12, sel_initWithLeafIdentifier_applicationBundleID_, v8, v9);

  if (v10)
  {
    objc_storeStrong((id *)&v10->_searchResult, a3);
    v10->_variant = a4;
  }

  return v10;
}

+ (BOOL)canGenerateIconsInBackground
{
  return 1;
}

- (id)iconImageWithInfo:(SBIconImageInfo *)a3
{
  double v3;
  double v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = v3;
  -[SearchUITemporaryInternalAppsIcon searchResult](self, "searchResult", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[SearchUITemporaryInternalAppsIcon searchResult](self, "searchResult");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUIAppIconImage appIconForResult:variant:](SearchUIAppIconImage, "appIconForResult:variant:", v7, -[SearchUITemporaryInternalAppsIcon variant](self, "variant"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "loadImageWithScale:isDarkStyle:", 0, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)displayNameForLocation:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[SearchUITemporaryInternalAppsIcon searchResult](self, "searchResult", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)variant
{
  return self->_variant;
}

- (SFSearchResult)searchResult
{
  return self->_searchResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResult, 0);
}

@end
