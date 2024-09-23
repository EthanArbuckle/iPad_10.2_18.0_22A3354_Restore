@implementation VUIPlistMediaItem

- (VUIPlistMediaItem)initWithMediaLibrary:(id)a3 databaseItem:(id)a4 requestedProperties:(id)a5
{
  id v9;
  id v10;
  id v11;
  VUIPlistMediaEntityIdentifier *v12;
  void *v13;
  VUIPlistMediaEntityIdentifier *v14;
  void *v15;
  VUIPlistMediaItem *v16;
  objc_super v18;

  v9 = a4;
  v10 = a5;
  v11 = a3;
  v12 = [VUIPlistMediaEntityIdentifier alloc];
  objc_msgSend(v9, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[VUIPlistMediaEntityIdentifier initWithIdentifier:type:](v12, "initWithIdentifier:type:", v13, objc_msgSend(v9, "type"));

  VUIPlistMediaItemKind();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18.receiver = self;
  v18.super_class = (Class)VUIPlistMediaItem;
  v16 = -[VUIMediaEntity initWithMediaLibrary:identifier:requestedProperties:kind:](&v18, sel_initWithMediaLibrary_identifier_requestedProperties_kind_, v11, v14, v10, v15);

  if (v16)
    objc_storeStrong((id *)&v16->_databaseItem, a4);

  return v16;
}

- (VUIPlistMediaItem)initWithMediaLibrary:(id)a3 identifier:(id)a4 requestedProperties:(id)a5 kind:(id)a6
{
  void *v7;
  uint64_t v8;
  void *v9;

  v7 = (void *)MEMORY[0x1E0C99DA0];
  v8 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "raise:format:", v8, CFSTR("The %@ initializer is not available."), v9);

  return 0;
}

- (id)coverArtImageIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[VUIPlistMediaItem databaseItem](self, "databaseItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "coverArtURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)playedState
{
  return &unk_1EA0B9D90;
}

- (id)showIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  VUIPlistMediaEntityIdentifier *v6;

  -[VUIPlistMediaItem databaseItem](self, "databaseItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "season");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "show");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[VUIPlistMediaEntityIdentifier initWithIdentifier:type:]([VUIPlistMediaEntityIdentifier alloc], "initWithIdentifier:type:", v5, 4);
  return v6;
}

- (id)showTitle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[VUIPlistMediaItem databaseItem](self, "databaseItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "season");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "show");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)seasonNumber
{
  void *v2;
  void *v3;
  void *v4;

  -[VUIPlistMediaItem databaseItem](self, "databaseItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "season");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "seasonNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)isLocal
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[VUIPlistMediaItem databaseItem](self, "databaseItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "downloadState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithBool:", objc_msgSend(v4, "isEqualToString:", VUIPlistDatabaseItemDownloadStateDownloaded));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_valueForPropertyDescriptor:(id)a3
{
  void *v4;
  void *v5;
  NSString *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "sourcePropertyNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(v5, "firstObject");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    -[VUIPlistMediaItem databaseItem](self, "databaseItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSSelectorFromString(v6);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "valueForKey:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)previewFrameImageIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[VUIPlistMediaItem databaseItem](self, "databaseItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "previewFrameURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)seasonIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  VUIPlistMediaEntityIdentifier *v5;

  -[VUIPlistMediaItem databaseItem](self, "databaseItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "season");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[VUIPlistMediaEntityIdentifier initWithIdentifier:type:]([VUIPlistMediaEntityIdentifier alloc], "initWithIdentifier:type:", v4, 5);
  return v5;
}

- (id)seasonTitle
{
  void *v2;
  void *v3;
  void *v4;

  -[VUIPlistMediaItem databaseItem](self, "databaseItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "season");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)assetType
{
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;

  -[VUIPlistMediaItem databaseItem](self, "databaseItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "downloadState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", VUIPlistDatabaseItemDownloadStateDownloaded);

  if (v4)
    v5 = 3;
  else
    v5 = 2;
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
}

- (id)imageLoadParamsWithImageType:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  VUIPlistMediaEntityImageLoadParams *v10;

  if (a3 == 1)
  {
    -[VUIPlistMediaItem databaseItem](self, "databaseItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "previewFrameURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[VUIPlistMediaItem previewFrameImageIdentifier](self, "previewFrameImageIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3)
    {
      v9 = 0;
      v6 = 0;
      v10 = 0;
      goto LABEL_9;
    }
    -[VUIPlistMediaItem databaseItem](self, "databaseItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "coverArtURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[VUIPlistMediaItem coverArtImageIdentifier](self, "coverArtImageIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v7;
  v10 = 0;
  if (v6 && v7)
    v10 = -[VUIPlistMediaEntityImageLoadParams initWithImageURL:baseImageIdentifier:imageType:]([VUIPlistMediaEntityImageLoadParams alloc], "initWithImageURL:baseImageIdentifier:imageType:", v6, v7, a3);
LABEL_9:

  return v10;
}

- (VUIPlistMediaDatabaseItem)databaseItem
{
  return self->_databaseItem;
}

- (void)setDatabaseItem:(id)a3
{
  objc_storeStrong((id *)&self->_databaseItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseItem, 0);
}

@end
