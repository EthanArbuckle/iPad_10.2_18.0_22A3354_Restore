@implementation PXMockDisplaySingleAssetSuggestion

- (PXMockDisplaySingleAssetSuggestion)initWithAsset:(id)a3 type:(unsigned __int16)a4 subtype:(unsigned __int16)a5 title:(id)a6
{
  id v11;
  id v12;
  PXMockDisplaySingleAssetSuggestion *v13;
  PXMockDisplaySingleAssetSuggestion *v14;
  uint64_t v15;
  NSString *title;
  objc_super v18;

  v11 = a3;
  v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PXMockDisplaySingleAssetSuggestion;
  v13 = -[PXMockDisplaySingleAssetSuggestion init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_type = a4;
    v13->_subtype = a5;
    objc_storeStrong((id *)&v13->_asset, a3);
    v15 = objc_msgSend(v12, "copy");
    title = v14->_title;
    v14->_title = (NSString *)v15;

  }
  return v14;
}

- (NSString)localIdentifier
{
  void *v2;
  void *v3;

  -[PXMockDisplaySingleAssetSuggestion asset](self, "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)fetchKeyAssets
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CD1390];
  -[PXMockDisplaySingleAssetSuggestion asset](self, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXMockDisplaySingleAssetSuggestion asset](self, "asset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "librarySpecificFetchOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchAssetsWithLocalIdentifiers:options:", v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PXMockDisplaySingleAssetSuggestion localIdentifier](self, "localIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", v6))
    {
      -[PXMockDisplaySingleAssetSuggestion title](self, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "title");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToString:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSDate)startDate
{
  void *v2;
  void *v3;

  -[PXMockDisplaySingleAssetSuggestion asset](self, "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "creationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (NSDate)endDate
{
  void *v2;
  void *v3;

  -[PXMockDisplaySingleAssetSuggestion asset](self, "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "creationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSString)localizedSubtitle
{
  return self->_localizedSubtitle;
}

- (unsigned)type
{
  return self->_type;
}

- (unsigned)subtype
{
  return self->_subtype;
}

- (NSDictionary)actionProperties
{
  return self->_actionProperties;
}

- (unsigned)state
{
  return self->_state;
}

- (PHAsset)asset
{
  return self->_asset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_actionProperties, 0);
  objc_storeStrong((id *)&self->_localizedSubtitle, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
