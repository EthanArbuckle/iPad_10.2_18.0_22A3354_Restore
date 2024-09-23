@implementation PLSimpleAlbum

- (PLSimpleAlbum)initWithTitle:(id)a3 assets:(id)a4
{
  id v6;
  id v7;
  PLSimpleAlbum *v8;
  uint64_t v9;
  NSOrderedSet *assets;
  uint64_t v11;
  NSString *title;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PLSimpleAlbum;
  v8 = -[PLSimpleAlbum init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    assets = v8->_assets;
    v8->_assets = (NSOrderedSet *)v9;

    v11 = objc_msgSend(v6, "copy");
    title = v8->_title;
    v8->_title = (NSString *)v11;

  }
  return v8;
}

- (int64_t)_countOfAssetType:(signed __int16)a3
{
  NSOrderedSet *assets;
  int64_t v4;
  _QWORD v6[5];
  signed __int16 v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  assets = self->_assets;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__PLSimpleAlbum__countOfAssetType___block_invoke;
  v6[3] = &unk_1E366DBC0;
  v7 = a3;
  v6[4] = &v8;
  -[NSOrderedSet enumerateObjectsUsingBlock:](assets, "enumerateObjectsUsingBlock:", v6);
  v4 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v4;
}

- (NSString)uuid
{
  return 0;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)localizedTitle
{
  void *v2;
  void *v3;

  -[PLSimpleAlbum title](self, "title");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PLLocalizedFrameworkString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSOrderedSet)assets
{
  return self->_assets;
}

- (unint64_t)assetsCount
{
  void *v2;
  unint64_t v3;

  -[PLSimpleAlbum assets](self, "assets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (unint64_t)photosCount
{
  return -[PLSimpleAlbum _countOfAssetType:](self, "_countOfAssetType:", 0);
}

- (unint64_t)videosCount
{
  return -[PLSimpleAlbum _countOfAssetType:](self, "_countOfAssetType:", 1);
}

- (BOOL)isEmpty
{
  return -[PLSimpleAlbum assetsCount](self, "assetsCount") == 0;
}

- (BOOL)canPerformEditOperation:(unint64_t)a3
{
  return 0;
}

- (BOOL)canShowComments
{
  return 0;
}

- (BOOL)canShowAvalancheStacks
{
  return 0;
}

- (NSArray)localizedLocationNames
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

uint64_t __35__PLSimpleAlbum__countOfAssetType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "kind");
  if (*(unsigned __int16 *)(a1 + 40) == (unsigned __int16)result)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

@end
