@implementation PXForYouSuggestionsAssetsDataSource

- (PXForYouSuggestionsAssetsDataSource)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXForYouSuggestionsAssetsDataSource.m"), 22, CFSTR("%s is not available as initializer"), "-[PXForYouSuggestionsAssetsDataSource init]");

  abort();
}

- (PXForYouSuggestionsAssetsDataSource)initWithDisplayAssets:(id)a3 collection:(id)a4
{
  id v6;
  id v7;
  PXForYouSuggestionsAssetsDataSource *v8;
  uint64_t v9;
  NSArray *assets;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXForYouSuggestionsAssetsDataSource;
  v8 = -[PXForYouSuggestionsAssetsDataSource init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    assets = v8->_assets;
    v8->_assets = (NSArray *)v9;

    objc_storeStrong((id *)&v8->_collection, a4);
  }

  return v8;
}

- (int64_t)numberOfSections
{
  return 1;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  void *v6;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXForYouSuggestionsAssetsDataSource.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("section == 0"));

  }
  return -[NSArray count](self->_assets, "count");
}

- (int64_t)numberOfSubitemsInItem:(int64_t)a3 section:(int64_t)a4
{
  return 0;
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  unint64_t item;
  int64_t section;
  void *v8;
  void *v9;
  PXDisplayAssetCollection *v10;
  void *v12;
  void *v13;

  if (a3->dataSourceIdentifier == *(_QWORD *)off_1E50B7E98)
    goto LABEL_4;
  item = a3->item;
  if (item != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a3->subitem == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (item >= -[NSArray count](self->_assets, "count"))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXForYouSuggestionsAssetsDataSource.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath.item < _assets.count"));

      }
      -[NSArray objectAtIndexedSubscript:](self->_assets, "objectAtIndexedSubscript:", a3->item);
      v10 = (PXDisplayAssetCollection *)objc_claimAutoreleasedReturnValue();
      return v10;
    }
LABEL_4:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXForYouSuggestionsAssetsDataSource.m"), 60, CFSTR("%@: expected an item or section index path"), v9);

    abort();
  }
  section = a3->section;
  if (section == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_4;
  if (section)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXForYouSuggestionsAssetsDataSource.m"), 57, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath.section == 0"));

  }
  v10 = self->_collection;
  return v10;
}

- (PXSimpleIndexPath)indexPathForAssetReference:(SEL)a3
{
  id v6;
  void *v7;
  __int128 v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t *v13;
  __int128 v14;
  __int128 v15;
  PXSimpleIndexPath *result;
  _QWORD v17[4];
  id v18;
  PXForYouSuggestionsAssetsDataSource *v19;
  uint64_t *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  void *v28;
  __int128 v29;
  __int128 v30;

  v6 = a4;
  v7 = v6;
  v25 = 0;
  v26 = &v25;
  v27 = 0x4010000000;
  v28 = &unk_1A7E74EE7;
  v8 = *((_OWORD *)off_1E50B8778 + 1);
  v29 = *(_OWORD *)off_1E50B8778;
  v30 = v8;
  if (v6)
  {
    objc_msgSend(v6, "indexPath");
    v9 = v23;
  }
  else
  {
    v9 = 0;
    v23 = 0u;
    v24 = 0u;
  }
  if (v9 == -[PXForYouSuggestionsAssetsDataSource identifier](self, "identifier"))
  {
    if (v7)
    {
      objc_msgSend(v7, "indexPath");
    }
    else
    {
      v21 = 0u;
      v22 = 0u;
    }
    v13 = v26;
    v14 = v22;
    *((_OWORD *)v26 + 2) = v21;
    *((_OWORD *)v13 + 3) = v14;
  }
  else
  {
    objc_msgSend(v7, "asset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXForYouSuggestionsAssetsDataSource assets](self, "assets");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __66__PXForYouSuggestionsAssetsDataSource_indexPathForAssetReference___block_invoke;
    v17[3] = &unk_1E5127690;
    v12 = v10;
    v19 = self;
    v20 = &v25;
    v18 = v12;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v17);

    v13 = v26;
  }
  v15 = *((_OWORD *)v13 + 3);
  *(_OWORD *)&retstr->dataSourceIdentifier = *((_OWORD *)v13 + 2);
  *(_OWORD *)&retstr->item = v15;
  _Block_object_dispose(&v25, 8);

  return result;
}

- (NSArray)assets
{
  return self->_assets;
}

- (void)setAssets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_collection, 0);
}

void __66__PXForYouSuggestionsAssetsDataSource_indexPathForAssetReference___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  int v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;

  v11 = a2;
  v7 = *(id *)(a1 + 32);
  if (v7 == v11)
  {

  }
  else
  {
    v8 = objc_msgSend(v11, "isEqual:", v7);

    if (!v8)
      goto LABEL_6;
  }
  v9 = objc_msgSend(*(id *)(a1 + 40), "identifier");
  v10 = *(_QWORD **)(*(_QWORD *)(a1 + 48) + 8);
  v10[4] = v9;
  v10[5] = 0;
  v10[6] = a3;
  v10[7] = 0x7FFFFFFFFFFFFFFFLL;
  *a4 = 1;
LABEL_6:

}

+ (PXForYouSuggestionsAssetsDataSource)new
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXForYouSuggestionsAssetsDataSource.m"), 26, CFSTR("%s is not available as initializer"), "+[PXForYouSuggestionsAssetsDataSource new]");

  abort();
}

@end
