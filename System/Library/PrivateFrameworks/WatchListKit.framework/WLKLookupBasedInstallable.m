@implementation WLKLookupBasedInstallable

- (WLKLookupBasedInstallable)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Use -initWithLookupItem: instead."));

  return 0;
}

- (WLKLookupBasedInstallable)initWithLookupItem:(id)a3
{
  id v5;
  WLKLookupBasedInstallable *v6;
  WLKLookupBasedInstallable *v7;
  objc_super v9;

  v5 = a3;
  if (!v5)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Item must not be nil."));
  v9.receiver = self;
  v9.super_class = (Class)WLKLookupBasedInstallable;
  v6 = -[WLKLookupBasedInstallable init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_item, a3);

  return v7;
}

- (NSString)title
{
  void *v2;
  void *v3;

  -[WLKLookupBasedInstallable item](self, "item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)name
{
  void *v2;
  void *v3;

  -[WLKLookupBasedInstallable item](self, "item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSArray)appBundleIDs
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[WLKLookupBasedInstallable item](self, "item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)appAdamIDs
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[WLKLookupBasedInstallable item](self, "item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iTunesStoreIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (id)appIconURLForSize:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  height = a3.height;
  width = a3.width;
  -[WLKLookupBasedInstallable item](self, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "wlk_dictionaryForKey:", CFSTR("artwork"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "wlk_stringForKey:", CFSTR("url"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[WLKArtworkVariant artworkURLFromTemplate:forSize:format:](WLKArtworkVariant, "artworkURLFromTemplate:forSize:format:", v8, CFSTR("png"), width, height);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSURL)appStoreURL
{
  void *v2;
  void *v3;

  -[WLKLookupBasedInstallable item](self, "item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "productPageURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (AMSLookupItem)item
{
  return self->_item;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
}

@end
