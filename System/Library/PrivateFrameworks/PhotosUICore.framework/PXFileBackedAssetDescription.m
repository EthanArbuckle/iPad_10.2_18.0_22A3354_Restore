@implementation PXFileBackedAssetDescription

- (PXFileBackedAssetDescription)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFileBackedAsset.m"), 38, CFSTR("%s is not available as initializer"), "-[PXFileBackedAssetDescription init]");

  abort();
}

- (PXFileBackedAssetDescription)initWithURL:(id)a3
{
  return -[PXFileBackedAssetDescription initWithURL:previewImage:](self, "initWithURL:previewImage:", a3, 0);
}

- (PXFileBackedAssetDescription)initWithURL:(id)a3 previewImage:(id)a4
{
  id v7;
  id v8;
  PXFileBackedAssetDescription *v9;
  PXFileBackedAssetDescription *v10;
  uint64_t v11;
  NSURL *url;
  NSMutableDictionary *v13;
  NSMutableDictionary *descriptionDictionary;
  void *v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFileBackedAsset.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("url"));

  }
  v17.receiver = self;
  v17.super_class = (Class)PXFileBackedAssetDescription;
  v9 = -[PXFileBackedAssetDescription init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_previewImage, a4);
    v11 = objc_msgSend(v7, "copy");
    url = v10->_url;
    v10->_url = (NSURL *)v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    descriptionDictionary = v10->_descriptionDictionary;
    v10->_descriptionDictionary = v13;

  }
  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXFileBackedAssetDescription;
  -[PXFileBackedAssetDescription description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFileBackedAssetDescription url](self, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" - URL: %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)objectForKeyedSubscript:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_descriptionDictionary, "objectForKeyedSubscript:", a3);
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_descriptionDictionary, "setObject:forKeyedSubscript:", a3, a4);
}

- (NSURL)url
{
  return self->_url;
}

- (UIImage)previewImage
{
  return self->_previewImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewImage, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_descriptionDictionary, 0);
}

+ (id)simpleImageDescriptionWithURL:(id)a3
{
  return (id)objc_msgSend(a1, "simpleImageDescriptionWithURL:previewImage:", a3, 0);
}

+ (id)simpleImageDescriptionWithURL:(id)a3 previewImage:(id)a4
{
  id v5;
  id v6;
  PXFileBackedAssetDescription *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[PXFileBackedAssetDescription initWithURL:previewImage:]([PXFileBackedAssetDescription alloc], "initWithURL:previewImage:", v6, v5);

  -[PXFileBackedAssetDescription setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", &unk_1E53EDD88, CFSTR("mediaType"));
  -[PXFileBackedAssetDescription setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", &unk_1E53EDDA0, CFSTR("mediaSubtypes"));
  -[PXFileBackedAssetDescription setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", &unk_1E53EDD88, CFSTR("playbackStyle"));
  -[PXFileBackedAssetDescription setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", &unk_1E53EDDB8, CFSTR("playbackVariation"));
  return v7;
}

@end
