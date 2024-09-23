@implementation PXStoryConcreteTextResource

- (PXStoryConcreteTextResource)initWithIdentifier:(id)a3 kind:(int64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryConcreteResources.m"), 66, CFSTR("%s is not available as initializer"), "-[PXStoryConcreteTextResource initWithIdentifier:kind:]");

  abort();
}

- (PXStoryConcreteTextResource)initWithAssetCollection:(id)a3 type:(int64_t)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  PXStoryConcreteTextResource *v10;
  _TtC12PhotosUICore27PXPhotosCollectionTitleInfo *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  PXStoryTextResourceInfo *v16;
  const __CFString *v17;
  void *v18;
  uint64_t v19;
  PXStoryTextResourceInfo *textResourceInfo;
  objc_super v22;

  v6 = a3;
  v7 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v6, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("assetCollection:%@ type:%ti"), v8, a4);

  v22.receiver = self;
  v22.super_class = (Class)PXStoryConcreteTextResource;
  v10 = -[PXStoryConcreteResource initWithIdentifier:kind:](&v22, sel_initWithIdentifier_kind_, v9, 3);
  if (!v10)
    goto LABEL_12;
  v11 = -[PXPhotosCollectionTitleInfo initWithAssetCollection:]([_TtC12PhotosUICore27PXPhotosCollectionTitleInfo alloc], "initWithAssetCollection:", v6);
  -[PXPhotosCollectionTitleInfo subtitle](v11, "subtitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (a4 == 1)
  {
    v14 = v12;
  }
  else
  {
    if (a4)
    {
      v15 = 0;
      goto LABEL_8;
    }
    -[PXPhotosCollectionTitleInfo title](v11, "title");
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;
LABEL_8:
  v10->_type = a4;
  v16 = [PXStoryTextResourceInfo alloc];
  if (v15)
    v17 = v15;
  else
    v17 = &stru_1E5149688;
  objc_msgSend(v6, "uuid");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[PXStoryTextResourceInfo initWithString:associatedSubtitleString:type:layoutScheme:assetCollectionUUID:](v16, "initWithString:associatedSubtitleString:type:layoutScheme:assetCollectionUUID:", v17, v13, a4, 0, v18);
  textResourceInfo = v10->_textResourceInfo;
  v10->_textResourceInfo = (PXStoryTextResourceInfo *)v19;

LABEL_12:
  return v10;
}

- (PXStoryConcreteTextResource)initWithChapter:(id)a3 type:(int64_t)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  PXStoryConcreteTextResource *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  PXStoryTextResourceInfo *v15;
  const __CFString *v16;
  uint64_t v17;
  PXStoryTextResourceInfo *textResourceInfo;
  objc_super v20;

  v6 = a3;
  v7 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("chapter:%@ type:%ti"), v8, a4);

  v20.receiver = self;
  v20.super_class = (Class)PXStoryConcreteTextResource;
  v10 = -[PXStoryConcreteResource initWithIdentifier:kind:](&v20, sel_initWithIdentifier_kind_, v9, 3);
  if (!v10)
    goto LABEL_12;
  objc_msgSend(v6, "localizedSubtitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (a4 == 1)
  {
    v13 = v11;
  }
  else
  {
    if (a4)
    {
      v14 = 0;
      goto LABEL_8;
    }
    objc_msgSend(v6, "localizedTitle");
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;
LABEL_8:
  v10->_type = a4;
  v15 = [PXStoryTextResourceInfo alloc];
  if (v14)
    v16 = v14;
  else
    v16 = &stru_1E5149688;
  v17 = -[PXStoryTextResourceInfo initWithString:associatedSubtitleString:type:layoutScheme:assetCollectionUUID:](v15, "initWithString:associatedSubtitleString:type:layoutScheme:assetCollectionUUID:", v16, v12, a4, 1, 0);
  textResourceInfo = v10->_textResourceInfo;
  v10->_textResourceInfo = (PXStoryTextResourceInfo *)v17;

LABEL_12:
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryConcreteTextResource;
  if (-[PXStoryConcreteResource isEqual:](&v9, sel_isEqual_, v4))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[PXStoryConcreteTextResource px_storyResourceTextResourceInfo](self, "px_storyResourceTextResourceInfo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "px_storyResourceTextResourceInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5 == v6)
        v7 = 1;
      else
        v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 1;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int64_t)px_storyResourceTextType
{
  return self->_type;
}

- (PXStoryTextResourceInfo)px_storyResourceTextResourceInfo
{
  return self->_textResourceInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textResourceInfo, 0);
}

@end
