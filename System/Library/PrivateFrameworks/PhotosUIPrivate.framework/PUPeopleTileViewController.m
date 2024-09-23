@implementation PUPeopleTileViewController

- (PUPeopleTileViewController)initWithReuseIdentifier:(id)a3
{
  PUPeopleTileViewController *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PUPeopleTileViewController;
  v3 = -[PUTileController initWithReuseIdentifier:](&v8, sel_initWithReuseIdentifier_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *MEMORY[0x1E0D7C5C0];
    objc_msgSend(MEMORY[0x1E0D7B698], "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__peopleDidChange_, v5, v6);

  }
  return v3;
}

- (void)viewDidLoad
{
  void *v3;
  PUPeopleTileCollectionViewFlowLayout *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  objc_super v21;
  _QWORD v22[3];
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)PUPeopleTileViewController;
  -[PUTileViewController viewDidLoad](&v21, sel_viewDidLoad);
  -[PUTileViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(PUPeopleTileCollectionViewFlowLayout);
  -[UICollectionViewFlowLayout setScrollDirection:](v4, "setScrollDirection:", 1);
  -[UICollectionViewFlowLayout setSectionInset:](v4, "setSectionInset:", 16.0, 16.0, 16.0, 0.0);
  v5 = objc_alloc(MEMORY[0x1E0DC35B8]);
  v6 = (void *)objc_msgSend(v5, "initWithFrame:collectionViewLayout:", v4, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v7);

  objc_msgSend(v6, "setShowsHorizontalScrollIndicator:", 0);
  objc_msgSend(v6, "setShowsVerticalScrollIndicator:", 0);
  objc_msgSend(v6, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("PUPeopleTileCellReuseIdentifier"));
  objc_msgSend(v6, "setDataSource:", self);
  objc_msgSend(v6, "setDelegate:", self);
  -[PUPeopleTileViewController setCollectionView:](self, "setCollectionView:", v6);
  objc_msgSend(v3, "addSubview:", v6);
  -[PUPeopleTileViewController sortedPeople](self, "sortedPeople");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", objc_msgSend(v8, "count") != 0);

  objc_msgSend(MEMORY[0x1E0CD2790], "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPeopleTileViewController setFadeLayer:](self, "setFadeLayer:", v9);
  objc_msgSend(MEMORY[0x1E0D7B6B0], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "debugFadeLayer");

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.0, 0.0, 0.5);
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v23[0] = objc_msgSend(v12, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0, 1.0, 0.0, 0.5);
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v23[1] = objc_msgSend(v13, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 1.0, 0.5);
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v23[2] = objc_msgSend(v14, "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setColors:", v15);

    objc_msgSend(v3, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSublayer:", v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.9);
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v22[0] = objc_msgSend(v17, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.3);
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v22[1] = objc_msgSend(v18, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.0);
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v22[2] = objc_msgSend(v19, "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setColors:", v20);

    objc_msgSend(v3, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setMask:", v9);
  }

}

- (void)applyLayoutInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)PUPeopleTileViewController;
  v4 = a3;
  -[PUTileViewController applyLayoutInfo:](&v30, sel_applyLayoutInfo_, v4);
  -[PUPeopleTileViewController collectionView](self, "collectionView", v30.receiver, v30.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAllowsGroupOpacity:", 0);

  objc_msgSend(v4, "alpha");
  v8 = v7;

  objc_msgSend(v5, "setAlpha:", v8);
  -[PUTileViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  objc_msgSend(v5, "setFrame:", v11, v13, v15, v17);
  -[PUTileViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "traitCollection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  +[PUPeopleTileViewController _interItemSpacingForTraitCollection:](PUPeopleTileViewController, "_interItemSpacingForTraitCollection:", v19);
  v21 = v20;
  +[PUPeopleTileCollectionViewCell itemSizeForTraitCollection:](PUPeopleTileCollectionViewCell, "itemSizeForTraitCollection:", v19);
  v23 = v21 + v22;
  v24 = (v15 - v23) / v15;
  v25 = objc_msgSend(v19, "layoutDirection");
  if (v25 == 1)
    v26 = 0.0;
  else
    v26 = 1.0;
  if (v25 == 1)
    v24 = 1.0 - v24;
  -[PUPeopleTileViewController fadeLayer](self, "fadeLayer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setFrame:", v11, v13, v15, v17);

  -[PUPeopleTileViewController fadeLayer](self, "fadeLayer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setStartPoint:", v24, 0.0);

  -[PUPeopleTileViewController fadeLayer](self, "fadeLayer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setEndPoint:", v26, 0.0);

  objc_msgSend(v5, "setContentInset:", 0.0, 0.0, 0.0, v23);
}

- (void)becomeReusable
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUPeopleTileViewController;
  -[PUTileViewController becomeReusable](&v4, sel_becomeReusable);
  -[PUPeopleTileViewController setAsset:](self, "setAsset:", 0);
  -[PUPeopleTileViewController setSortedPeople:](self, "setSortedPeople:", 0);
  -[PUPeopleTileViewController setUnsortedFetchResult:](self, "setUnsortedFetchResult:", 0);
  -[PUPeopleTileViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

}

- (void)setDisplayAsset:(id)a3
{
  void *v4;
  char v5;
  PHAsset *v6;
  void *v7;
  PHAsset *asset;
  PHAsset *v9;
  id v10;

  v10 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PUPeopleTileViewController asset](self, "asset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqual:", v10);

    if ((v5 & 1) == 0)
    {
      v6 = (PHAsset *)v10;
      -[PHAsset photoLibrary](v6, "photoLibrary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "registerChangeObserver:", self);

      asset = self->_asset;
      self->_asset = v6;
      v9 = v6;

      -[PUPeopleTileViewController _reloadEverythingForAsset:](self, "_reloadEverythingForAsset:", v9);
    }
  }

}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v5 = a4;
  -[PUPeopleTileViewController collectionView](self, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("PUPeopleTileCellReuseIdentifier"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setPeopleDelegate:", self);
  -[PUPeopleTileViewController sortedPeople](self, "sortedPeople");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "item");

  objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPeopleTileViewController asset](self, "asset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPerson:asset:", v10, v11);

  return v7;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  int64_t v7;

  -[PUPeopleTileViewController asset](self, "asset", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return 0;
  -[PUPeopleTileViewController sortedPeople](self, "sortedPeople");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

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

  objc_msgSend(a3, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUPeopleTileCollectionViewCell itemSizeForTraitCollection:](PUPeopleTileCollectionViewCell, "itemSizeForTraitCollection:", v5);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  void *v5;
  double v6;
  double v7;

  objc_msgSend(a3, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUPeopleTileViewController _interItemSpacingForTraitCollection:](PUPeopleTileViewController, "_interItemSpacingForTraitCollection:", v5);
  v7 = v6;

  return v7;
}

- (void)pushPeopleViewController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PUPeopleTileViewController peopleDelegate](self, "peopleDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pushPeopleViewController:", v4);

}

- (void)presentPeopleViewController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PUPeopleTileViewController peopleDelegate](self, "peopleDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentPeopleViewController:", v4);

}

- (id)allPeople
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PUPeopleTileViewController sortedPeople](self, "sortedPeople");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D7B6B8];
  objc_msgSend(v2, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "peopleFetchResultFromFastEnumeration:photoLibrary:", v2, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setSortedPeople:(id)a3
{
  NSArray *v4;
  NSArray *sortedPeople;
  _BOOL8 v6;
  id v7;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  sortedPeople = self->_sortedPeople;
  self->_sortedPeople = v4;

  v6 = -[NSArray count](self->_sortedPeople, "count") != 0;
  -[PUTileViewController viewIfLoaded](self, "viewIfLoaded");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUserInteractionEnabled:", v6);

}

- (void)_reloadEverythingForAsset:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  dispatch_get_global_queue(25, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__PUPeopleTileViewController__reloadEverythingForAsset___block_invoke;
  block[3] = &unk_1E58AB210;
  v8 = v4;
  v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_peopleDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD block[5];
  id v25;
  id v26;
  id v27;
  uint64_t *v28;
  _QWORD v29[4];
  id v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D7C5C8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUPeopleTileViewController sortedPeople](self, "sortedPeople");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0x7FFFFFFFFFFFFFFFLL;
  if (objc_msgSend(v6, "count") == 1)
  {
    objc_msgSend(v6, "anyObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __47__PUPeopleTileViewController__peopleDidChange___block_invoke;
    v29[3] = &unk_1E58A2418;
    v9 = v8;
    v30 = v9;
    v31 = &v32;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v29);

  }
  if (v33[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = v7;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v36, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "localIdentifier", (_QWORD)v20);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v6, "containsObject:", v14);

          if ((v15 & 1) != 0)
          {

            -[PUPeopleTileViewController asset](self, "asset");
            v10 = (id)objc_claimAutoreleasedReturnValue();
            -[PUPeopleTileViewController _reloadEverythingForAsset:](self, "_reloadEverythingForAsset:", v10);
            goto LABEL_15;
          }
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v36, 16);
        if (v11)
          continue;
        break;
      }
    }
  }
  else
  {
    -[PUPeopleTileViewController asset](self, "asset");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[PUPeopleTileViewController _fetchUnsortedPeopleForAsset:](PUPeopleTileViewController, "_fetchUnsortedPeopleForAsset:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    +[PUPeopleTileViewController _sortedPersonsForFetchResult:](PUPeopleTileViewController, "_sortedPersonsForFetchResult:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__PUPeopleTileViewController__peopleDidChange___block_invoke_2;
    block[3] = &unk_1E58A2440;
    block[4] = self;
    v25 = v7;
    v26 = v18;
    v27 = v17;
    v28 = &v32;
    v19 = v17;
    v10 = v18;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
LABEL_15:

  _Block_object_dispose(&v32, 8);
}

- (BOOL)_compare:(id)a3 to:(id)a4 ignoringIndices:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  int v16;
  BOOL v17;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(v7, "count");
  if (v10 != objc_msgSend(v8, "count"))
  {
LABEL_8:
    v17 = 0;
    goto LABEL_9;
  }
  if (objc_msgSend(v7, "count"))
  {
    v11 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v9, "containsObject:", v12);

      if ((v13 & 1) == 0)
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectAtIndexedSubscript:", v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "isEqual:", v15);

        if (!v16)
          goto LABEL_8;
      }
    }
    while (++v11 < (unint64_t)objc_msgSend(v7, "count"));
  }
  v17 = 1;
LABEL_9:

  return v17;
}

- (void)photoLibraryDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  PUPeopleTileViewController *v14;

  v4 = a3;
  -[PUPeopleTileViewController unsortedFetchResult](self, "unsortedFetchResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changeDetailsForFetchResult:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (objc_msgSend(v6, "hasIncrementalChanges"))
    {
      objc_msgSend(v6, "changedIndexes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "count") == 1)
      {
        objc_msgSend(v6, "removedIndexes");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v8, "count"))
        {
          objc_msgSend(v6, "insertedIndexes");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "count");

          if (!v11)
          {
            v12[0] = MEMORY[0x1E0C809B0];
            v12[1] = 3221225472;
            v12[2] = __52__PUPeopleTileViewController_photoLibraryDidChange___block_invoke;
            v12[3] = &unk_1E58ABCA8;
            v13 = v6;
            v14 = self;
            dispatch_async(MEMORY[0x1E0C80D38], v12);

            goto LABEL_8;
          }
          goto LABEL_7;
        }

      }
    }
LABEL_7:
    -[PUPeopleTileViewController asset](self, "asset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPeopleTileViewController _reloadEverythingForAsset:](self, "_reloadEverythingForAsset:", v9);

  }
LABEL_8:

}

- (PUPeopleTileDelegate)peopleDelegate
{
  return (PUPeopleTileDelegate *)objc_loadWeakRetained((id *)&self->_peopleDelegate);
}

- (void)setPeopleDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_peopleDelegate, a3);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (CAGradientLayer)fadeLayer
{
  return self->_fadeLayer;
}

- (void)setFadeLayer:(id)a3
{
  objc_storeStrong((id *)&self->_fadeLayer, a3);
}

- (UICollectionViewCellRegistration)cellRegistration
{
  return self->_cellRegistration;
}

- (void)setCellRegistration:(id)a3
{
  objc_storeStrong((id *)&self->_cellRegistration, a3);
}

- (PHAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (NSArray)sortedPeople
{
  return self->_sortedPeople;
}

- (PHFetchResult)unsortedFetchResult
{
  return self->_unsortedFetchResult;
}

- (void)setUnsortedFetchResult:(id)a3
{
  objc_storeStrong((id *)&self->_unsortedFetchResult, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unsortedFetchResult, 0);
  objc_storeStrong((id *)&self->_sortedPeople, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_cellRegistration, 0);
  objc_storeStrong((id *)&self->_fadeLayer, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_destroyWeak((id *)&self->_peopleDelegate);
}

void __52__PUPeopleTileViewController_photoLibraryDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  _QWORD v31[2];
  _QWORD v32[2];
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "fetchResultAfterChanges");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUPeopleTileViewController _sortedPersonsForFetchResult:](PUPeopleTileViewController, "_sortedPersonsForFetchResult:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "sortedPeople");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "changedObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v4;
  v8 = objc_msgSend(v3, "indexOfObject:", v6);
  v9 = objc_msgSend(v4, "indexOfObject:", v6);
  objc_msgSend(*(id *)(a1 + 40), "setUnsortedFetchResult:", v2);
  objc_msgSend(*(id *)(a1 + 40), "setSortedPeople:", v3);
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v8, 0);
  v30 = objc_claimAutoreleasedReturnValue();
  v10 = *(void **)(a1 + 40);
  v11 = (void *)MEMORY[0x1E0C99E60];
  if (v8 != v9)
  {
    v29 = v2;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
    v20 = v4;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v21;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v20;
    LODWORD(v20) = objc_msgSend(v10, "_compare:to:ignoringIndices:", v20, v3, v24);

    v25 = *(void **)(a1 + 40);
    if ((_DWORD)v20)
    {
      objc_msgSend(*(id *)(a1 + 40), "collectionView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v9, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)v30;
      objc_msgSend(v17, "moveItemAtIndexPath:toIndexPath:", v26, v30);
      v31[0] = v26;
      v31[1] = v30;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "reloadItemsAtIndexPaths:", v27);

      v7 = v28;
      v2 = v29;
      goto LABEL_9;
    }
    objc_msgSend(*(id *)(a1 + 40), "asset");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "_reloadEverythingForAsset:", v17);
    v7 = v28;
    v2 = v29;
LABEL_8:
    v18 = (void *)v30;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v10, "_compare:to:ignoringIndices:", v4, v3, v14);

  v16 = *(void **)(a1 + 40);
  if (!v15)
  {
    objc_msgSend(*(id *)(a1 + 40), "asset");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_reloadEverythingForAsset:", v17);
    goto LABEL_8;
  }
  objc_msgSend(*(id *)(a1 + 40), "collectionView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)v30;
  v33 = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "reloadItemsAtIndexPaths:", v19);

LABEL_9:
}

void __47__PUPeopleTileViewController__peopleDidChange___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;

  v7 = *(void **)(a1 + 32);
  objc_msgSend(a2, "localIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v7, "isEqualToString:", v8);

  if ((_DWORD)v7)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

void __47__PUPeopleTileViewController__peopleDidChange___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "_compare:to:ignoringIndices:", v3, v4, v8);

  if ((_DWORD)v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setUnsortedFetchResult:", *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 32), "setSortedPeople:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "collectionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reloadItemsAtIndexPaths:", v11);

  }
  else
  {
    v12 = *(void **)(a1 + 32);
    objc_msgSend(v12, "asset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_reloadEverythingForAsset:", v9);
  }

}

void __56__PUPeopleTileViewController__reloadEverythingForAsset___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  +[PUPeopleTileViewController _fetchUnsortedPeopleForAsset:](PUPeopleTileViewController, "_fetchUnsortedPeopleForAsset:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUPeopleTileViewController _sortedPersonsForFetchResult:](PUPeopleTileViewController, "_sortedPersonsForFetchResult:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__PUPeopleTileViewController__reloadEverythingForAsset___block_invoke_2;
  block[3] = &unk_1E58AA2E0;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  v7 = v2;
  v8 = v3;
  v4 = v3;
  v5 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v9);
}

void __56__PUPeopleTileViewController__reloadEverythingForAsset___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained(v2);
    objc_msgSend(v5, "setUnsortedFetchResult:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v5, "setSortedPeople:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v5, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reloadData");

  }
}

+ (CGSize)tileSizeForTraitCollection:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  v4 = a3;
  if (PXUserInterfaceSizeClassFromUITraitCollection() == 2)
    v5 = 6;
  else
    v5 = 4;
  +[PUPeopleTileCollectionViewCell itemSizeForTraitCollection:](PUPeopleTileCollectionViewCell, "itemSizeForTraitCollection:", v4);
  v7 = v6;
  v9 = v8;
  objc_msgSend(a1, "_interItemSpacingForTraitCollection:", v4);
  v11 = v10;

  v12 = v11 * (double)v5 + (double)(v5 | 1) * v7 + 16.0;
  v13 = v9 + 32.0;
  result.height = v13;
  result.width = v12;
  return result;
}

+ (double)_interItemSpacingForTraitCollection:(id)a3
{
  uint64_t v3;
  double result;

  v3 = PXUserInterfaceSizeClassFromUITraitCollection();
  result = 10.0;
  if (v3 == 2)
    return 14.0;
  return result;
}

+ (id)_fetchUnsortedPeopleForAsset:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CD1570];
  v4 = a3;
  objc_msgSend(v3, "fetchOptionsWithPhotoLibrary:orObject:", 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPersonContext:", 4);
  v10[0] = *MEMORY[0x1E0CD1D60];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFetchPropertySets:", v6);

  objc_msgSend(MEMORY[0x1E0CD1570], "px_defaultDetectionTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIncludedDetectionTypes:", v7);

  objc_msgSend(v5, "setIncludeTorsoAndFaceDetectionData:", 1);
  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsInAsset:options:", v4, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_sortedPersonsForFetchResult:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "fetchedObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_45834);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __59__PUPeopleTileViewController__sortedPersonsForFetchResult___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v14;
  void *v15;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  objc_msgSend(v5, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v7 && !v9)
    goto LABEL_6;
  if (!v7 && v9)
  {
LABEL_8:
    v12 = 1;
    goto LABEL_9;
  }
  v10 = objc_msgSend(v4, "faceCount");
  v11 = objc_msgSend(v5, "faceCount");
  if (v10 <= v11)
  {
    if (v10 >= v11)
    {
      objc_msgSend(v4, "localIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v14, "compare:", v15);

      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_6:
  v12 = -1;
LABEL_9:

  return v12;
}

@end
