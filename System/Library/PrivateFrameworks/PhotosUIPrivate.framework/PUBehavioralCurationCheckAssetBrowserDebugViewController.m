@implementation PUBehavioralCurationCheckAssetBrowserDebugViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  NSString *v6;
  NSString *selectionName;
  NSPredicate *v8;
  NSPredicate *predicate;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PUBehavioralCurationCheckAssetBrowserDebugViewController;
  -[PUPhotosAlbumViewController viewDidLoad](&v10, sel_viewDidLoad);
  -[PUBehavioralCurationCheckAssetBrowserDebugViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLeftItemsSupplementBackButton:", 1);

  -[PUBehavioralCurationCheckAssetBrowserDebugViewController setDefinesPresentationContext:](self, "setDefinesPresentationContext:", 1);
  -[PUBehavioralCurationCheckAssetBrowserDebugViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("PUPhotoCell"));

  -[PUBehavioralCurationCheckAssetBrowserDebugViewController selectionNames](self, "selectionNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  selectionName = self->_selectionName;
  self->_selectionName = v6;

  -[PUBehavioralCurationCheckAssetBrowserDebugViewController predicateForSelectionName:](self, "predicateForSelectionName:", self->_selectionName);
  v8 = (NSPredicate *)objc_claimAutoreleasedReturnValue();
  predicate = self->_predicate;
  self->_predicate = v8;

  -[PUBehavioralCurationCheckAssetBrowserDebugViewController _update](self, "_update");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUBehavioralCurationCheckAssetBrowserDebugViewController;
  -[PUPhotosAlbumViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[PUBehavioralCurationCheckAssetBrowserDebugViewController _update](self, "_update");
}

- (BOOL)shouldShowToolbar
{
  return 1;
}

- (id)newToolbarItems
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 2, self, sel__editSettings_);
  v7[0] = v3;
  v7[1] = v4;
  v7[2] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_update
{
  void *v3;
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "librarySpecificFetchOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUBehavioralCurationCheckAssetBrowserDebugViewController predicateForSelectionName:](self, "predicateForSelectionName:", self->_selectionName);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInternalPredicate:", v5);
  -[PUBehavioralCurationCheckAssetBrowserDebugViewController sortDescriptorForSelectionName:](self, "sortDescriptorForSelectionName:", self->_selectionName);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v6;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInternalSortDescriptors:", v8);

  v18 = *MEMORY[0x1E0CD1978];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFetchPropertySets:", v9);

  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssetFetchResult:title:", v10, self->_selectionName);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CD14E0];
  v17 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedTitle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "transientCollectionListWithCollections:title:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD14D8], "fetchCollectionsInCollectionList:options:", v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosAlbumViewController setAssetCollection:fetchResultContainingAssetCollection:filterPredicate:](self, "setAssetCollection:fetchResultContainingAssetCollection:filterPredicate:", v11, v16, 0);

}

- (void)_editSettings:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  UIPickerView *v17;
  UIPickerView *scorePickerView;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  UIPickerView *v24;
  UIPickerView *sortPickerView;
  void *v26;
  void *v27;
  double v28;
  id v29;

  v29 = objc_alloc_init(MEMORY[0x1E0DC3F20]);
  objc_msgSend(v29, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "colorWithAlphaComponent:", 0.75);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v6);

  v7 = objc_alloc(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v4, "bounds");
  v9 = (void *)objc_msgSend(v7, "initWithFrame:", 10.0, 10.0, v8 + -20.0, 100.0);
  objc_msgSend(v9, "setAutoresizingMask:", 34);
  objc_msgSend(v9, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCornerRadius:", 6.0);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v11);

  objc_msgSend(v4, "addSubview:", v9);
  objc_msgSend(v9, "bounds");
  v13 = v12 + -20.0 + -20.0 + -90.0;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3518]), "initWithFrame:", 20.0, 20.0, 90.0, 60.0);
  objc_msgSend(v14, "setAutoresizingMask:", 36);
  objc_msgSend(v14, "setTitle:forState:", CFSTR("Done"), 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "blueColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTitleColor:forState:", v15, 0);

  objc_msgSend(v14, "addTarget:action:forControlEvents:", self, sel__doneEditingSettings_, 0xFFFFFFFFLL);
  objc_msgSend(v9, "addSubview:", v14);
  objc_msgSend(v14, "sizeToFit");
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", 20.0, 90.0, 90.0, 60.0);
  objc_msgSend(v16, "setAutoresizingMask:", 36);
  objc_msgSend(v16, "setText:", CFSTR("Score:"));
  objc_msgSend(v9, "addSubview:", v16);
  v17 = (UIPickerView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AE0]), "initWithFrame:", 110.0, 90.0, v13, 60.0);
  scorePickerView = self->_scorePickerView;
  self->_scorePickerView = v17;

  -[UIPickerView layer](self->_scorePickerView, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setCornerRadius:", 6.0);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPickerView setBackgroundColor:](self->_scorePickerView, "setBackgroundColor:", v20);

  -[UIPickerView setDataSource:](self->_scorePickerView, "setDataSource:", self);
  -[UIPickerView setDelegate:](self->_scorePickerView, "setDelegate:", self);
  -[PUBehavioralCurationCheckAssetBrowserDebugViewController selectionNames](self, "selectionNames");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "indexOfObject:", self->_selectionName);

  -[UIPickerView selectRow:inComponent:animated:](self->_scorePickerView, "selectRow:inComponent:animated:", v22, 0, 0);
  objc_msgSend(v9, "addSubview:", self->_scorePickerView);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", 20.0, 160.0, 90.0, 60.0);
  objc_msgSend(v23, "setAutoresizingMask:", 36);
  objc_msgSend(v23, "setText:", CFSTR("Sort:"));
  objc_msgSend(v9, "addSubview:", v23);
  v24 = (UIPickerView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AE0]), "initWithFrame:", 110.0, 160.0, v13, 60.0);
  sortPickerView = self->_sortPickerView;
  self->_sortPickerView = v24;

  -[UIPickerView layer](self->_sortPickerView, "layer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setCornerRadius:", 6.0);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPickerView setBackgroundColor:](self->_sortPickerView, "setBackgroundColor:", v27);

  -[UIPickerView setDataSource:](self->_sortPickerView, "setDataSource:", self);
  -[UIPickerView setDelegate:](self->_sortPickerView, "setDelegate:", self);
  -[UIPickerView selectRow:inComponent:animated:](self->_sortPickerView, "selectRow:inComponent:animated:", !self->_sortAscending, 0, 0);
  objc_msgSend(v9, "addSubview:", self->_sortPickerView);
  objc_msgSend(v4, "bounds");
  objc_msgSend(v9, "setFrame:", 10.0, 10.0, v28 + -20.0, 230.0);
  -[PUBehavioralCurationCheckAssetBrowserDebugViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", 7);
  -[PUBehavioralCurationCheckAssetBrowserDebugViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v29, 1, 0);

}

- (void)_doneEditingSettings:(id)a3
{
  -[PUBehavioralCurationCheckAssetBrowserDebugViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (id)selectionNames
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("Gold Assets 🏅");
  v3[1] = CFSTR("Shiny Gem Assets ✨💎");
  v3[2] = CFSTR("Gem Assets 💎");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_goldAssetUUIDs
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v10;

  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "urlForApplicationDataFolderIdentifier:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("PGUserBehaviorPreviousResults.plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v10 = 0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v4, &v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v10;
    if (v6)
    {
      v7 = v6;

      v8 = (void *)MEMORY[0x1E0C9AA60];
      v5 = v7;
    }
    else
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("goldAssetUUIDs"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v8;
}

- (id)predicateForSelectionName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("Gold Assets 🏅")))
  {
    v5 = (void *)MEMORY[0x1E0CB3880];
    -[PUBehavioralCurationCheckAssetBrowserDebugViewController _goldAssetUUIDs](self, "_goldAssetUUIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "predicateWithFormat:", CFSTR("uuid IN %@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("Shiny Gem Assets ✨💎")))
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(computedAttributes.behavioralScore >= %f)"), 0x3FECCCCCC0000000, v9);
    }
    else
    {
      if (!objc_msgSend(v4, "isEqualToString:", CFSTR("Gem Assets 💎")))
      {
        v7 = 0;
        goto LABEL_9;
      }
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(computedAttributes.behavioralScore < %f AND computedAttributes.behavioralScore >= %f)"), 0x3FECCCCCC0000000, 0x3FE6666660000000);
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_9:

  return v7;
}

- (id)sortDescriptorForSelectionName:(id)a3
{
  id v4;
  const __CFString *v5;
  void *v6;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("Gold Assets 🏅")) & 1) != 0)
  {
    v5 = CFSTR("computedAttributes.interactionScore");
  }
  else
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("Shiny Gem Assets ✨💎")) & 1) == 0
      && !objc_msgSend(v4, "isEqualToString:", CFSTR("Gem Assets 💎")))
    {
      v6 = 0;
      goto LABEL_7;
    }
    v5 = CFSTR("computedAttributes.behavioralScore");
  }
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", v5, self->_sortAscending);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v6;
}

- (id)phScoreKeyPathsForSelectionName:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Gold Assets 🏅")) & 1) != 0)
  {
    v4 = &unk_1E59BA810;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Shiny Gem Assets ✨💎")) & 1) != 0
         || objc_msgSend(v3, "isEqualToString:", CFSTR("Gem Assets 💎")))
  {
    v4 = &unk_1E59BA828;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v29;
  objc_super v30;

  v6 = a4;
  v30.receiver = self;
  v30.super_class = (Class)PUBehavioralCurationCheckAssetBrowserDebugViewController;
  -[PUPhotosGridViewController collectionView:cellForItemAtIndexPath:](&v30, sel_collectionView_cellForItemAtIndexPath_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUBehavioralCurationCheckAssetBrowserDebugViewController phScoreKeyPathsForSelectionName:](self, "phScoreKeyPathsForSelectionName:", self->_selectionName);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count") == 1)
  {
    -[PUPhotosAlbumViewController assetCollectionAssets](self, "assetCollectionAssets");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v6, "item"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "valueForKeyPath:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v14 = v13;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.2f"), v14, v29);
LABEL_5:
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setScore:", v27);

    goto LABEL_6;
  }
  if (objc_msgSend(v8, "count") == 2)
  {
    -[PUPhotosAlbumViewController assetCollectionAssets](self, "assetCollectionAssets");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndex:", objc_msgSend(v6, "item"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "valueForKeyPath:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleValue");
    v20 = v19;

    -[PUPhotosAlbumViewController assetCollectionAssets](self, "assetCollectionAssets");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectAtIndex:", objc_msgSend(v6, "item"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "valueForKeyPath:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "doubleValue");
    v26 = v25;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("✨%.1f❤%.2f"), v20, v26);
    goto LABEL_5;
  }
LABEL_6:

  return v7;
}

- (double)semanticScoreFromBehavioralScore:(double)a3
{
  return fmod(a3, 0.1) * 100.0;
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  void *v5;
  int64_t v6;

  if (self->_scorePickerView != a3)
    return 2 * (self->_sortPickerView == a3);
  -[PUBehavioralCurationCheckAssetBrowserDebugViewController selectionNames](self, "selectionNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  UIPickerView *v7;
  UIPickerView *v8;
  __CFString *v9;
  void *v10;
  __CFString *v11;

  v7 = (UIPickerView *)a3;
  v8 = v7;
  if (self->_scorePickerView == v7)
  {
    -[PUBehavioralCurationCheckAssetBrowserDebugViewController selectionNames](self, "selectionNames");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", a4);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else if (self->_sortPickerView == v7)
  {
    v11 = CFSTR("Descending");
    if (!a4)
      v11 = CFSTR("Ascending");
    v9 = v11;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (double)pickerView:(id)a3 rowHeightForComponent:(int64_t)a4
{
  return 20.0;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  UIPickerView *v7;
  void *v8;
  NSString *v9;
  NSString *selectionName;
  UIPickerView *v11;

  v7 = (UIPickerView *)a3;
  v11 = v7;
  if (self->_scorePickerView == v7)
  {
    -[PUBehavioralCurationCheckAssetBrowserDebugViewController selectionNames](self, "selectionNames");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", a4);
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    selectionName = self->_selectionName;
    self->_selectionName = v9;

  }
  else if (self->_sortPickerView == v7)
  {
    self->_sortAscending = a4 == 0;
  }
  -[PUBehavioralCurationCheckAssetBrowserDebugViewController _update](self, "_update");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortPickerView, 0);
  objc_storeStrong((id *)&self->_scorePickerView, 0);
  objc_storeStrong((id *)&self->_selectionName, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
}

@end
