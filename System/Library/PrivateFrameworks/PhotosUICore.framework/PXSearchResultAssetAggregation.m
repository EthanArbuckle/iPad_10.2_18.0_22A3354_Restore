@implementation PXSearchResultAssetAggregation

- (PXSearchResultAssetAggregation)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultAssetAggregation.m"), 25, CFSTR("%s is not available as initializer"), "-[PXSearchResultAssetAggregation init]");

  abort();
}

- (PXSearchResultAssetAggregation)initWithTitle:(id)a3 subtitle:(id)a4 assetUUIDs:(id)a5 subtype:(unint64_t)a6 identifier:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  PXSearchResultAssetAggregation *v17;
  void *v18;
  uint64_t v19;
  NSString *title;
  uint64_t v21;
  uint64_t v22;
  NSString *subtitle;
  uint64_t v24;
  NSArray *assetUUIDs;
  void *v26;
  uint64_t v27;
  NSString *thumbnailAssetUUID;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  objc_super v36;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  if (v13)
  {
    if (v14)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultAssetAggregation.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("title"));

    if (v14)
    {
LABEL_3:
      if (v15)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultAssetAggregation.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("subtitle"));

  if (v15)
  {
LABEL_4:
    if (a6)
      goto LABEL_5;
LABEL_17:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultAssetAggregation.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("subtype"));

    if (v16)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_16:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultAssetAggregation.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetUUIDs"));

  if (!a6)
    goto LABEL_17;
LABEL_5:
  if (v16)
    goto LABEL_6;
LABEL_18:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultAssetAggregation.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

LABEL_6:
  if (!objc_msgSend(v15, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchResultAssetAggregation.m"), 39, CFSTR("Search result asset aggregation UUID list is empty with title: %@, subtitle: %@, subtype: %ld"), v13, v14, a6);

  }
  v36.receiver = self;
  v36.super_class = (Class)PXSearchResultAssetAggregation;
  v17 = -[PXSearchResultAssetAggregation init](&v36, sel_init);
  if (v17)
  {
    if (a6 == 3)
    {
      PXLocalizedStringFromTable(CFSTR("SEARCH_RESULT_OCR_RESULT_TITLE_FORMAT"), CFSTR("PhotosUICore"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      PXStringWithValidatedFormat();
      v19 = objc_claimAutoreleasedReturnValue();
      title = v17->_title;
      v17->_title = (NSString *)v19;

    }
    else
    {
      v21 = objc_msgSend(v13, "copy");
      v18 = v17->_title;
      v17->_title = (NSString *)v21;
    }

    v22 = objc_msgSend(v14, "copy");
    subtitle = v17->_subtitle;
    v17->_subtitle = (NSString *)v22;

    v24 = objc_msgSend(v15, "copy");
    assetUUIDs = v17->_assetUUIDs;
    v17->_assetUUIDs = (NSArray *)v24;

    -[PXSearchResultAssetAggregation assetUUIDs](v17, "assetUUIDs");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "firstObject");
    v27 = objc_claimAutoreleasedReturnValue();
    thumbnailAssetUUID = v17->_thumbnailAssetUUID;
    v17->_thumbnailAssetUUID = (NSString *)v27;

    v17->_subtype = a6;
    v17->_assetCount = objc_msgSend(v15, "count");
    objc_storeStrong((id *)&v17->_identifier, a7);
    v17->_type = 1;
  }

  return v17;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PXSearchResultAssetAggregation identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  PXSearchResultAssetAggregation *v4;
  PXSearchResultAssetAggregation *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (PXSearchResultAssetAggregation *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[PXSearchResultAssetAggregation identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXSearchResultAssetAggregation identifier](v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqualToString:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (NSString)description
{
  uint64_t v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;

  v14 = (void *)MEMORY[0x1E0CB3940];
  v3 = objc_opt_class();
  -[PXSearchResultAssetAggregation identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PXSearchResultAssetAggregation type](self, "type");
  v6 = -[PXSearchResultAssetAggregation subtype](self, "subtype");
  -[PXSearchResultAssetAggregation title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSearchResultAssetAggregation subtitle](self, "subtitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PXSearchResultAssetAggregation assetCount](self, "assetCount");
  -[PXSearchResultAssetAggregation assetUUIDs](self, "assetUUIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSearchResultAssetAggregation thumbnailAssetUUID](self, "thumbnailAssetUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("<%@: %p, identifier: %@, type: %ld, subtype: %ld, title: %@, subtitle: %@, assetCount: %ld, assetUUIDs: %@, thumbnailAssetUUID: %@>"), v3, self, v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (NSArray)assetUUIDs
{
  return self->_assetUUIDs;
}

- (unint64_t)subtype
{
  return self->_subtype;
}

- (NSString)thumbnailAssetUUID
{
  return self->_thumbnailAssetUUID;
}

- (void)setThumbnailAssetUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (unint64_t)assetCount
{
  return self->_assetCount;
}

- (void)setAssetCount:(unint64_t)a3
{
  self->_assetCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_thumbnailAssetUUID, 0);
  objc_storeStrong((id *)&self->_assetUUIDs, 0);
}

@end
