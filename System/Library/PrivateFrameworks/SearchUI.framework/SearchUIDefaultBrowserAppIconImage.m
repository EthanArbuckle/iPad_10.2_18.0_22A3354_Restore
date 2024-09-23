@implementation SearchUIDefaultBrowserAppIconImage

+ (void)invalidateDefaultBrowserBundleIdentifier
{
  void *v2;

  v2 = (void *)sDefaultBrowserBundleIdentifier;
  sDefaultBrowserBundleIdentifier = 0;

}

+ (id)defaultBrowserBundleIdentifier
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  objc_opt_class();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v2);
  if (!sDefaultBrowserBundleIdentifier)
  {
    v3 = objc_alloc(MEMORY[0x1E0CA58A8]);
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("http://"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithURL:error:", v4, 0);

    objc_msgSend(v5, "bundleRecord");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      +[SearchUIUtilities bundleIdentifierForApp:](SearchUIUtilities, "bundleIdentifierForApp:", 14);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = (void *)sDefaultBrowserBundleIdentifier;
    sDefaultBrowserBundleIdentifier = (uint64_t)v9;

  }
  objc_sync_exit(v2);

  return (id)sDefaultBrowserBundleIdentifier;
}

- (SearchUIDefaultBrowserAppIconImage)initWithVariant:(unint64_t)a3
{
  void *v5;
  SearchUIDefaultBrowserAppIconImage *v6;
  objc_super v8;

  objc_msgSend((id)objc_opt_class(), "defaultBrowserBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)SearchUIDefaultBrowserAppIconImage;
  v6 = -[SearchUIAppIconImage initWithBundleIdentifier:variant:contentType:](&v8, sel_initWithBundleIdentifier_variant_contentType_, v5, a3, 0);

  return v6;
}

- (id)loadImageWithScale:(double)a3 isDarkStyle:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  objc_super v9;

  v4 = a4;
  objc_msgSend((id)objc_opt_class(), "defaultBrowserBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIAppIconImage setBundleIdentifier:](self, "setBundleIdentifier:", v7);

  v9.receiver = self;
  v9.super_class = (Class)SearchUIDefaultBrowserAppIconImage;
  -[SearchUIAppIconImage loadImageWithScale:isDarkStyle:](&v9, sel_loadImageWithScale_isDarkStyle_, v4, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
