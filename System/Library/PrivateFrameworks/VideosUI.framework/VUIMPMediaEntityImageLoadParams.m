@implementation VUIMPMediaEntityImageLoadParams

- (MPMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (VUIMPMediaEntityImageLoadParams)initWithMediaItem:(id)a3 andImageType:(unint64_t)a4
{
  id v7;
  VUIMPMediaEntityImageLoadParams *v8;
  VUIMPMediaEntityImageLoadParams *v9;
  objc_super v11;

  v7 = a3;
  if (!v7)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), CFSTR("mediaItem"));
  v11.receiver = self;
  v11.super_class = (Class)VUIMPMediaEntityImageLoadParams;
  v8 = -[VUIMPMediaEntityImageLoadParams init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_mediaItem, a3);
    v9->_imageType = a4;
  }

  return v9;
}

- (unint64_t)imageType
{
  return self->_imageType;
}

- (NSString)imageIdentifier
{
  void *v3;
  NSString *v4;
  NSString *imageIdentifier;

  if (!self->_calculatedIdentifier)
  {
    -[VUIMPMediaEntityImageLoadParams mediaItem](self, "mediaItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "vui_imageIdentifierWithImageType:", -[VUIMPMediaEntityImageLoadParams imageType](self, "imageType"));
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    imageIdentifier = self->_imageIdentifier;
    self->_imageIdentifier = v4;

    self->_calculatedIdentifier = 1;
  }
  return self->_imageIdentifier;
}

- (MPArtworkCatalog)artworkCatalog
{
  MPArtworkCatalog *artworkCatalog;
  void *v4;
  MPArtworkCatalog *v5;
  MPArtworkCatalog *v6;

  artworkCatalog = self->_artworkCatalog;
  if (!artworkCatalog)
  {
    -[VUIMPMediaEntityImageLoadParams mediaItem](self, "mediaItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "vui_artworkCatalogWithImageType:", -[VUIMPMediaEntityImageLoadParams imageType](self, "imageType"));
    v5 = (MPArtworkCatalog *)objc_claimAutoreleasedReturnValue();
    v6 = self->_artworkCatalog;
    self->_artworkCatalog = v5;

    artworkCatalog = self->_artworkCatalog;
  }
  return artworkCatalog;
}

- (VUIMPMediaEntityImageLoadParams)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[VUIMPMediaEntityImageLoadParams imageIdentifier](self, "imageIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  VUIMPMediaEntityImageLoadParams *v4;
  VUIMPMediaEntityImageLoadParams *v5;
  VUIMPMediaEntityImageLoadParams *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  char v13;

  v4 = (VUIMPMediaEntityImageLoadParams *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v13 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v7 = -[VUIMPMediaEntityImageLoadParams imageType](self, "imageType");
    if (v7 == -[VUIMPMediaEntityImageLoadParams imageType](v6, "imageType"))
    {
      -[VUIMPMediaEntityImageLoadParams imageIdentifier](self, "imageIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIMPMediaEntityImageLoadParams imageIdentifier](v6, "imageIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v8;
      v11 = v9;
      v12 = v11;
      if (v10 == v11)
      {
        v13 = 1;
      }
      else
      {
        v13 = 0;
        if (v10 && v11)
          v13 = objc_msgSend(v10, "isEqual:", v11);
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15.receiver = self;
  v15.super_class = (Class)VUIMPMediaEntityImageLoadParams;
  -[VUIMPMediaEntityImageLoadParams description](&v15, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMPMediaEntityImageLoadParams imageIdentifier](self, "imageIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("imageIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v8 = (void *)MEMORY[0x1E0CB3940];
  VUIImageTypeString(-[VUIMPMediaEntityImageLoadParams imageType](self, "imageType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("imageType"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@>"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

- (void)setMediaItem:(id)a3
{
  objc_storeStrong((id *)&self->_mediaItem, a3);
}

- (void)setArtworkCatalog:(id)a3
{
  objc_storeStrong((id *)&self->_artworkCatalog, a3);
}

- (BOOL)calculatedIdentifier
{
  return self->_calculatedIdentifier;
}

- (void)setCalculatedIdentifier:(BOOL)a3
{
  self->_calculatedIdentifier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkCatalog, 0);
  objc_storeStrong((id *)&self->_mediaItem, 0);
  objc_storeStrong((id *)&self->_imageIdentifier, 0);
}

@end
