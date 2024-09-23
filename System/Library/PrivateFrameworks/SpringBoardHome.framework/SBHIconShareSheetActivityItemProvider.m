@implementation SBHIconShareSheetActivityItemProvider

- (SBHIconShareSheetActivityItemProvider)initWithIconManager:(id)a3 icon:(id)a4
{
  id v6;
  id v7;
  void *v8;
  SBHIconShareSheetActivityItemProvider *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  LSiTunesMetadata *iTunesMetadata;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  LSiTunesMetadata *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  NSURL *itemURL;
  NSString *itemName;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  UIImage *itemImage;
  uint64_t v40;
  NSURL *v41;
  objc_super v42;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99D50], "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v42.receiver = self;
  v42.super_class = (Class)SBHIconShareSheetActivityItemProvider;
  v9 = -[UIActivityItemProvider initWithPlaceholderItem:](&v42, sel_initWithPlaceholderItem_, v8);
  if (v9)
  {
    objc_msgSend(v7, "applicationBundleID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v19 = objc_opt_class();
      v20 = v7;
      if (v19)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v21 = v20;
        else
          v21 = 0;
      }
      else
      {
        v21 = 0;
      }
      v29 = v21;

      objc_msgSend(v29, "webClip");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "pageURL");
      v30 = objc_claimAutoreleasedReturnValue();
      itemURL = v9->_itemURL;
      v9->_itemURL = (NSURL *)v30;

      objc_msgSend(v11, "title");
      v28 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v10, 1, 0);
    objc_msgSend(v11, "iTunesMetadata");
    v12 = objc_claimAutoreleasedReturnValue();
    iTunesMetadata = v9->_iTunesMetadata;
    v9->_iTunesMetadata = (LSiTunesMetadata *)v12;

    -[LSiTunesMetadata distributorInfo](v9->_iTunesMetadata, "distributorInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "shareURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[LSiTunesMetadata distributorInfo](v9->_iTunesMetadata, "distributorInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v15)
    {
      objc_msgSend(v16, "shareURL");
      v18 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v16, "sourceURL");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = v9->_iTunesMetadata;
      if (!v22)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[LSiTunesMetadata storeItemIdentifier](v23, "storeItemIdentifier"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("https://apps.apple.com/app/id%@"), v17);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v27);
        v40 = objc_claimAutoreleasedReturnValue();
        v41 = v9->_itemURL;
        v9->_itemURL = (NSURL *)v40;

        goto LABEL_12;
      }
      v24 = (void *)MEMORY[0x1E0CB3998];
      -[LSiTunesMetadata distributorInfo](v23, "distributorInfo");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "sourceURL");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "componentsWithURL:resolvingAgainstBaseURL:", v26, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "setPath:", 0);
      objc_msgSend(v17, "URL");
      v18 = objc_claimAutoreleasedReturnValue();
    }
    v27 = v9->_itemURL;
    v9->_itemURL = (NSURL *)v18;
LABEL_12:

    -[LSiTunesMetadata itemName](v9->_iTunesMetadata, "itemName");
    v28 = objc_claimAutoreleasedReturnValue();
LABEL_15:
    itemName = v9->_itemName;
    v9->_itemName = (NSString *)v28;

    objc_msgSend(v6, "iconImageCache");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rootViewController");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "traitCollection");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3E88], "sbh_iconImageAppearanceFromTraitCollection:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "imageForIcon:imageAppearance:options:", v7, v36, 0);
    v37 = objc_claimAutoreleasedReturnValue();
    itemImage = v9->_itemImage;
    v9->_itemImage = (UIImage *)v37;

  }
  return v9;
}

- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4
{
  return (id)objc_msgSend((id)*MEMORY[0x1E0CEC618], "identifier", a3, a4);
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  UIImage *v13;
  void *v14;
  void *v15;

  v4 = objc_alloc_init(MEMORY[0x1E0CC11A8]);
  -[SBHIconShareSheetActivityItemProvider itemURL](self, "itemURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOriginalURL:", v5);
  objc_msgSend(v4, "setURL:", v5);
  v6 = objc_alloc_init(MEMORY[0x1E0CC1268]);
  -[SBHIconShareSheetActivityItemProvider itemName](self, "itemName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setName:", v7);

  -[SBHIconShareSheetActivityItemProvider iTunesMetadata](self, "iTunesMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "artistName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSubtitle:", v10);

    objc_msgSend(v9, "genre");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setGenre:", v11);
  }
  else
  {
    objc_msgSend(v5, "host");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSubtitle:", v11);
  }

  v12 = objc_alloc(MEMORY[0x1E0CC1178]);
  -[SBHIconShareSheetActivityItemProvider itemImage](self, "itemImage");
  v13 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIImagePNGRepresentation(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "initWithData:MIMEType:", v14, CFSTR("image/png"));

  objc_msgSend(v6, "setIcon:", v15);
  objc_msgSend(v4, "setSpecialization:", v6);

  return v4;
}

- (LSiTunesMetadata)iTunesMetadata
{
  return self->_iTunesMetadata;
}

- (void)setITunesMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_iTunesMetadata, a3);
}

- (NSString)itemName
{
  return self->_itemName;
}

- (void)setItemName:(id)a3
{
  objc_storeStrong((id *)&self->_itemName, a3);
}

- (NSURL)itemURL
{
  return self->_itemURL;
}

- (void)setItemURL:(id)a3
{
  objc_storeStrong((id *)&self->_itemURL, a3);
}

- (UIImage)itemImage
{
  return self->_itemImage;
}

- (void)setItemImage:(id)a3
{
  objc_storeStrong((id *)&self->_itemImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemImage, 0);
  objc_storeStrong((id *)&self->_itemURL, 0);
  objc_storeStrong((id *)&self->_itemName, 0);
  objc_storeStrong((id *)&self->_iTunesMetadata, 0);
}

@end
