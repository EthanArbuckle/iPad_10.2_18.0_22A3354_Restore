@implementation PUWallpaperGalleryDebugViewController

- (PUWallpaperGalleryDebugViewController)initWithSpec:(id)a3
{
  id v5;
  id v6;
  PUWallpaperGalleryDebugViewController *v7;
  PUWallpaperGalleryDebugViewController *v8;

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0DC3610]);
  v7 = -[PUWallpaperGalleryDebugViewController initWithCollectionViewLayout:](self, "initWithCollectionViewLayout:", v6);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_spec, a3);

  return v8;
}

- (void)setSuggestions:(id)a3
{
  NSArray **p_suggestions;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  p_suggestions = &self->_suggestions;
  v13 = a3;
  if ((-[NSArray isEqual:](*p_suggestions, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_suggestions, a3);
    if (-[NSArray count](*p_suggestions, "count"))
    {
      -[NSArray firstObject](*p_suggestions, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "photoLibrary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_alloc(MEMORY[0x1E0CD1620]);
      v9 = (void *)objc_msgSend(v8, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", *p_suggestions, v7, *MEMORY[0x1E0CD1BD0], 0, 0, 0);
      objc_msgSend(v7, "librarySpecificFetchOptions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyAssetBySuggestionUUIDForSuggestions:options:", v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUWallpaperGalleryDebugViewController setKeyAssetBySuggestionUUID:](self, "setKeyAssetBySuggestionUUID:", v11);

      -[PUWallpaperGalleryDebugViewController collectionView](self, "collectionView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "reloadData");

    }
  }

}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUWallpaperGalleryDebugViewController;
  -[PUWallpaperGalleryDebugViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[PUWallpaperGalleryDebugViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("wallpaperCell"));

}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[PUWallpaperGalleryDebugViewController suggestions](self, "suggestions", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("wallpaperCell"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperGalleryDebugViewController suggestions](self, "suggestions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "row");

  objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUWallpaperGalleryDebugViewController keyAssetBySuggestionUUID](self, "keyAssetBySuggestionUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setAsset:", v13);
  v14 = objc_msgSend(MEMORY[0x1E0D77EF8], "posterClassificationForSuggestionSubtype:", objc_msgSend(v10, "subtype"));
  objc_msgSend(v7, "wallpaperView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setClassificationMode:", v14);

  return v7;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  -[PUWallpaperGalleryDebugViewController spec](self, "spec", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemSize");
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  UIEdgeInsets result;

  -[PUWallpaperGalleryDebugViewController spec](self, "spec", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionViewContentInsets");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUWallpaperGalleryDebugViewController;
  -[PUWallpaperGalleryDebugViewController viewWillTransitionToSize:withTransitionCoordinator:](&v7, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  -[PUWallpaperGalleryDebugViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionViewLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidateLayout");

}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (PUPassiveContentDebugViewSpec)spec
{
  return self->_spec;
}

- (void)setSpec:(id)a3
{
  objc_storeStrong((id *)&self->_spec, a3);
}

- (NSDictionary)keyAssetBySuggestionUUID
{
  return self->_keyAssetBySuggestionUUID;
}

- (void)setKeyAssetBySuggestionUUID:(id)a3
{
  objc_storeStrong((id *)&self->_keyAssetBySuggestionUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyAssetBySuggestionUUID, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
}

@end
