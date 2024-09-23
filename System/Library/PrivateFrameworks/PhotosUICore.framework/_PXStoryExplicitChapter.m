@implementation _PXStoryExplicitChapter

- (_PXStoryExplicitChapter)initWithFirstAssetUUID:(id)a3 assetUUIDs:(id)a4
{
  id v7;
  id v8;
  _PXStoryExplicitChapter *v9;
  _PXStoryExplicitChapter *v10;
  uint64_t v11;
  NSString *firstAssetUUID;
  uint64_t v13;
  NSSet *assetUUIDs;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_PXStoryExplicitChapter;
  v9 = -[_PXStoryExplicitChapter init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    v11 = objc_msgSend(v7, "copy");
    firstAssetUUID = v10->_firstAssetUUID;
    v10->_firstAssetUUID = (NSString *)v11;

    v13 = objc_msgSend(v8, "copy");
    assetUUIDs = v10->_assetUUIDs;
    v10->_assetUUIDs = (NSSet *)v13;

  }
  return v10;
}

- (NSString)diagnosticDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[_PXStoryExplicitChapter identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXStoryExplicitChapter localizedTitle](self, "localizedTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXStoryExplicitChapter localizedSubtitle](self, "localizedSubtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXStoryExplicitChapter assetUUIDs](self, "assetUUIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("{ id=%@ title=“%@” subtitle=“%@” assetUUIDs=%@ }"), v4, v5, v6, v7);

  return (NSString *)v8;
}

- (NSCopying)identifier
{
  return self->_identifier;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)localizedSubtitle
{
  return self->_localizedSubtitle;
}

- (void)setLocalizedSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)firstAssetUUID
{
  return self->_firstAssetUUID;
}

- (NSSet)assetUUIDs
{
  return self->_assetUUIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetUUIDs, 0);
  objc_storeStrong((id *)&self->_firstAssetUUID, 0);
  objc_storeStrong((id *)&self->_localizedSubtitle, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
