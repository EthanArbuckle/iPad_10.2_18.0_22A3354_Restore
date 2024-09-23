@implementation PUCurationScoreCheckAssetBrowserDebugViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  NSString *v6;
  NSString *scoreName;
  _QWORD block[5];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PUCurationScoreCheckAssetBrowserDebugViewController;
  -[PUPhotosAlbumViewController viewDidLoad](&v9, sel_viewDidLoad);
  -[PUCurationScoreCheckAssetBrowserDebugViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLeftItemsSupplementBackButton:", 1);

  -[PUCurationScoreCheckAssetBrowserDebugViewController setDefinesPresentationContext:](self, "setDefinesPresentationContext:", 1);
  -[PUCurationScoreCheckAssetBrowserDebugViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("PUPhotoCell"));

  self->_minimumValue = 0.1;
  self->_maximumValue = 0.2;
  -[PUCurationScoreCheckAssetBrowserDebugViewController scoreNames](self, "scoreNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  scoreName = self->_scoreName;
  self->_scoreName = v6;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__PUCurationScoreCheckAssetBrowserDebugViewController_viewDidLoad__block_invoke;
  block[3] = &unk_1E58ABD10;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
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

- (void)getTitle:(id *)a3 prompt:(id *)a4 shouldHideBackButton:(BOOL *)a5 leftBarButtonItems:(id *)a6 rightBarButtonItems:(id *)a7
{
  void *v13;
  void *v14;
  objc_super v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3870], "pu_PhotosUIImageNamed:", CFSTR("PUTTR"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithImage:style:target:action:", v13, 0, self, sel__presentTapToRadar);
  v15.receiver = self;
  v15.super_class = (Class)PUCurationScoreCheckAssetBrowserDebugViewController;
  -[PUPhotosGridViewController getTitle:prompt:shouldHideBackButton:leftBarButtonItems:rightBarButtonItems:](&v15, sel_getTitle_prompt_shouldHideBackButton_leftBarButtonItems_rightBarButtonItems_, a3, a4, a5, a6, a7);
  if (*a6)
  {
    objc_msgSend(*a6, "arrayByAddingObject:", v14);
  }
  else
  {
    v16[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  }
  *a6 = (id)objc_claimAutoreleasedReturnValue();

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
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[3];
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  -[PUCurationScoreCheckAssetBrowserDebugViewController plScoreKeyPathByScoreName](self, "plScoreKeyPathByScoreName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", self->_scoreName);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", v4, self->_sortAscending);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v7;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInternalSortDescriptors:", v9);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ >= %%f && %@ <= %%f"), v4, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v10, *(_QWORD *)&self->_minimumValue, *(_QWORD *)&self->_maximumValue);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_showsVideos)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kind != %d"), 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0CB3528];
    v27[0] = v11;
    v27[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "andPredicateWithSubpredicates:", v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v15;
  }
  objc_msgSend(v6, "setInternalPredicate:", v11);
  v16 = *MEMORY[0x1E0CD1978];
  v26[0] = *MEMORY[0x1E0CD1938];
  v26[1] = v16;
  v26[2] = *MEMORY[0x1E0CD19F0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFetchPropertySets:", v17);

  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssetFetchResult:title:", v18, self->_scoreName);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x1E0CD14E0];
  v25 = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedTitle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "transientCollectionListWithCollections:title:", v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD14D8], "fetchCollectionsInCollectionList:options:", v23, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosAlbumViewController setAssetCollection:fetchResultContainingAssetCollection:filterPredicate:](self, "setAssetCollection:fetchResultContainingAssetCollection:filterPredicate:", v19, v24, 0);

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
  UIPickerView *v16;
  UIPickerView *scorePickerView;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  double v22;
  double v23;
  UIPickerView *v24;
  UIPickerView *sortPickerView;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  void *v42;
  void *v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;

  v48 = objc_alloc_init(MEMORY[0x1E0DC3F20]);
  objc_msgSend(v48, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "colorWithAlphaComponent:", 0.75);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v6);

  v7 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v47 = v4;
  objc_msgSend(v4, "bounds");
  v9 = (void *)objc_msgSend(v7, "initWithFrame:", 10.0, 10.0, v8 + -20.0, 100.0);
  objc_msgSend(v9, "setAutoresizingMask:", 34);
  objc_msgSend(v9, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCornerRadius:", 6.0);

  objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v11);

  objc_msgSend(v4, "addSubview:", v9);
  objc_msgSend(v9, "bounds");
  v13 = v12 + -20.0 + -20.0 + -120.0;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3518]), "initWithFrame:", 20.0, 20.0, 120.0, 40.0);
  objc_msgSend(v14, "setAutoresizingMask:", 36);
  objc_msgSend(v14, "setTitle:forState:", CFSTR("Done"), 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "blueColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTitleColor:forState:", v15, 0);

  objc_msgSend(v14, "addTarget:action:forControlEvents:", self, sel__doneEditingSettings_, 0xFFFFFFFFLL);
  objc_msgSend(v9, "addSubview:", v14);
  objc_msgSend(v14, "sizeToFit");
  v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", 20.0, 80.0, 120.0, 40.0);
  objc_msgSend(v46, "setAutoresizingMask:", 36);
  objc_msgSend(v46, "setText:", CFSTR("Score:"));
  objc_msgSend(v9, "addSubview:", v46);
  v16 = (UIPickerView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AE0]), "initWithFrame:", 140.0, 75.0, v13, 50.0);
  scorePickerView = self->_scorePickerView;
  self->_scorePickerView = v16;

  -[UIPickerView layer](self->_scorePickerView, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setCornerRadius:", 6.0);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPickerView setBackgroundColor:](self->_scorePickerView, "setBackgroundColor:", v19);

  -[UIPickerView setDataSource:](self->_scorePickerView, "setDataSource:", self);
  -[UIPickerView setDelegate:](self->_scorePickerView, "setDelegate:", self);
  -[PUCurationScoreCheckAssetBrowserDebugViewController scoreNames](self, "scoreNames");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "indexOfObject:", self->_scoreName);

  -[UIPickerView selectRow:inComponent:animated:](self->_scorePickerView, "selectRow:inComponent:animated:", v21, 0, 0);
  objc_msgSend(v9, "addSubview:", self->_scorePickerView);
  -[UIPickerView bounds](self->_scorePickerView, "bounds");
  v23 = v22 + 20.0 + 80.0;
  v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", 20.0, v23, 120.0, 40.0);
  objc_msgSend(v45, "setAutoresizingMask:", 36);
  objc_msgSend(v45, "setText:", CFSTR("Sort:"));
  objc_msgSend(v9, "addSubview:", v45);
  v24 = (UIPickerView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AE0]), "initWithFrame:", 140.0, v23 + -5.0, v13, 50.0);
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
  -[UIPickerView setFrame:](self->_sortPickerView, "setFrame:", 140.0, v23 + -5.0, v13, 50.0);
  -[UIPickerView bounds](self->_sortPickerView, "bounds");
  v29 = v23 + v28 + 20.0;
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", 20.0, v29, 120.0, 40.0);
  objc_msgSend(v30, "setAutoresizingMask:", 36);
  objc_msgSend(v30, "setText:", CFSTR("Minimum:"));
  objc_msgSend(v9, "addSubview:", v30);
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3DB8]), "initWithFrame:", 140.0, v29, 50.0, 40.0);
  objc_msgSend(v31, "setAutoresizingMask:", 36);
  objc_msgSend(v31, "layer");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setCornerRadius:", 6.0);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setBackgroundColor:", v33);

  objc_msgSend(v31, "setTextAlignment:", 1);
  objc_msgSend(v31, "setKeyboardType:", 2);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.3g"), *(_QWORD *)&self->_minimumValue);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setText:", v34);

  objc_msgSend(v31, "addTarget:action:forControlEvents:", self, sel__setMinimum_, 0x40000);
  objc_msgSend(v9, "addSubview:", v31);
  v35 = v29 + 60.0;
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", 20.0, v35, 120.0, 40.0);
  objc_msgSend(v36, "setAutoresizingMask:", 36);
  objc_msgSend(v36, "setText:", CFSTR("Maximum:"));
  objc_msgSend(v9, "addSubview:", v36);
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3DB8]), "initWithFrame:", 140.0, v35, 50.0, 40.0);
  objc_msgSend(v37, "setAutoresizingMask:", 36);
  objc_msgSend(v37, "layer");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setCornerRadius:", 6.0);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setBackgroundColor:", v39);

  objc_msgSend(v37, "setTextAlignment:", 1);
  objc_msgSend(v37, "setKeyboardType:", 2);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.3g"), *(_QWORD *)&self->_maximumValue);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setText:", v40);

  objc_msgSend(v37, "addTarget:action:forControlEvents:", self, sel__setMaximum_, 0x40000);
  objc_msgSend(v9, "addSubview:", v37);
  v41 = v35 + 60.0;
  v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", 20.0, v41, 120.0, 40.0);
  objc_msgSend(v42, "setAutoresizingMask:", 36);
  objc_msgSend(v42, "setText:", CFSTR("Show Videos:"));
  objc_msgSend(v9, "addSubview:", v42);
  v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D18]), "initWithFrame:", 140.0, v41, 50.0, 40.0);
  objc_msgSend(v43, "setAutoresizingMask:", 36);
  objc_msgSend(v43, "setOn:", self->_showsVideos);
  objc_msgSend(v43, "addTarget:action:forControlEvents:", self, sel__setShowsVideos_, 4096);
  objc_msgSend(v9, "addSubview:", v43);
  objc_msgSend(v47, "bounds");
  objc_msgSend(v9, "setFrame:", 10.0, 10.0, v44 + -20.0, v41 + 60.0);
  -[PUCurationScoreCheckAssetBrowserDebugViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", 7);
  -[PUCurationScoreCheckAssetBrowserDebugViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v48, 1, 0);

}

- (void)_setMinimum:(id)a3
{
  void *v4;
  double v5;

  objc_msgSend(a3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  self->_minimumValue = v5;

  -[PUCurationScoreCheckAssetBrowserDebugViewController _update](self, "_update");
}

- (void)_setMaximum:(id)a3
{
  void *v4;
  double v5;

  objc_msgSend(a3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  self->_maximumValue = v5;

  -[PUCurationScoreCheckAssetBrowserDebugViewController _update](self, "_update");
}

- (void)_setShowsVideos:(id)a3
{
  self->_showsVideos = objc_msgSend(a3, "isOn");
  -[PUCurationScoreCheckAssetBrowserDebugViewController _update](self, "_update");
}

- (void)_doneEditingSettings:(id)a3
{
  -[PUCurationScoreCheckAssetBrowserDebugViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (id)scoreNames
{
  return &unk_1E59BA9C0;
}

- (id)plScoreKeyPathByScoreName
{
  return &unk_1E59BAC78;
}

- (id)phScoreKeyPathByScoreName
{
  return &unk_1E59BACA0;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)PUCurationScoreCheckAssetBrowserDebugViewController;
  v6 = a4;
  -[PUPhotosGridViewController collectionView:cellForItemAtIndexPath:](&v18, sel_collectionView_cellForItemAtIndexPath_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCurationScoreCheckAssetBrowserDebugViewController phScoreKeyPathByScoreName](self, "phScoreKeyPathByScoreName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", self->_scoreName);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUPhotosAlbumViewController assetCollectionAssets](self, "assetCollectionAssets");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "item");

  objc_msgSend(v10, "objectAtIndex:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "valueForKeyPath:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  v15 = v14;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.2f"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setScore:", v16);

  return v7;
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
  -[PUCurationScoreCheckAssetBrowserDebugViewController scoreNames](self, "scoreNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6;
}

- (double)pickerView:(id)a3 rowHeightForComponent:(int64_t)a4
{
  return 20.0;
}

- (id)pickerView:(id)a3 viewForRow:(int64_t)a4 forComponent:(int64_t)a5 reusingView:(id)a6
{
  UIPickerView *v9;
  id v10;
  id v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;

  v9 = (UIPickerView *)a3;
  v10 = a6;
  v11 = v10;
  if (!v10)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 16.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFont:", v12);

    objc_msgSend(v11, "setTextAlignment:", 1);
  }
  if (self->_scorePickerView == v9)
  {
    -[PUCurationScoreCheckAssetBrowserDebugViewController scoreNames](self, "scoreNames");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndexedSubscript:", a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setText:", v15);

  }
  else
  {
    if (self->_sortPickerView == v9)
    {
      if (a4)
        v13 = CFSTR("Descending");
      else
        v13 = CFSTR("Ascending");
    }
    else
    {
      v13 = CFSTR("Who are you?");
    }
    objc_msgSend(v11, "setText:", v13);
  }

  return v11;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  UIPickerView *v7;
  void *v8;
  NSString *v9;
  NSString *scoreName;
  UIPickerView *v11;

  v7 = (UIPickerView *)a3;
  v11 = v7;
  if (self->_scorePickerView == v7)
  {
    -[PUCurationScoreCheckAssetBrowserDebugViewController scoreNames](self, "scoreNames");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", a4);
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    scoreName = self->_scoreName;
    self->_scoreName = v9;

  }
  else if (self->_sortPickerView == v7)
  {
    self->_sortAscending = a4 == 0;
  }
  -[PUCurationScoreCheckAssetBrowserDebugViewController _update](self, "_update");

}

- (void)_presentTapToRadar
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[5];

  -[PUPhotosGridViewController photoSelectionManager](self, "photoSelectionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosAlbumViewController assetCollection](self, "assetCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isAnyAssetSelectedInAssetCollection:", v4);

  if ((v5 & 1) != 0)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __73__PUCurationScoreCheckAssetBrowserDebugViewController__presentTapToRadar__block_invoke_2;
    v9[3] = &unk_1E58A9910;
    v9[4] = self;
    objc_msgSend(MEMORY[0x1E0D7B428], "presentTermsAndConditionsForUIViewController:completion:", self, v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("File Radar"), CFSTR("File radar without attaching photos?\nSelecting incorrect photos can help improve the audio classification feature."), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __73__PUCurationScoreCheckAssetBrowserDebugViewController__presentTapToRadar__block_invoke;
    v10[3] = &unk_1E58A8DE8;
    v10[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("File Radar"), 0, v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addAction:", v7);
    objc_msgSend(v6, "addAction:", v8);
    -[PUCurationScoreCheckAssetBrowserDebugViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);

  }
}

- (void)_fileRadarWithIncorrectAssets:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, CFSTR("Collecting data for radar..."), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __85__PUCurationScoreCheckAssetBrowserDebugViewController__fileRadarWithIncorrectAssets___block_invoke;
  v8[3] = &unk_1E58AB790;
  v8[4] = self;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  -[PUCurationScoreCheckAssetBrowserDebugViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, v8);

}

- (BOOL)_writeDiagnosticsToURL:(id)a3 incorrectAssets:(id)a4
{
  NSObject *v5;
  id v6;
  void *v7;
  char v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  id v17;
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  const __CFString *v65;
  void *v66;
  NSString *scoreName;
  NSObject *v68;
  void *v69;
  void *v70;
  void *v71;
  NSObject *v72;
  NSObject *v73;
  BOOL v74;
  NSObject *v75;
  NSObject *v77;
  id v78;
  id obj;
  NSObject *v81;
  NSObject *v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  id v87;
  const __CFString *v88;
  NSObject *v89;
  _QWORD v90[3];
  _QWORD v91[3];
  _QWORD v92[2];
  _QWORD v93[2];
  uint8_t v94[128];
  uint8_t buf[4];
  NSObject *v96;
  __int16 v97;
  NSObject *v98;
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = 0;
  v81 = v5;
  v8 = objc_msgSend(v7, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v87);
  v9 = v87;

  if ((v8 & 1) != 0)
  {
    v77 = v9;
    v10 = objc_opt_new();
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v78 = v6;
    obj = v6;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v94, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v84;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v84 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * i);
          -[PUCurationScoreCheckAssetBrowserDebugViewController _cloneAsset:toDirectory:](self, "_cloneAsset:toDirectory:", v15, v81, v77);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v18 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v15, "overallAestheticScore");
          objc_msgSend(v18, "numberWithFloat:");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, CFSTR("overallAestheticScore"));

          objc_msgSend(v15, "aestheticProperties");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v20, "wellFramedSubjectScore");
          objc_msgSend(v21, "numberWithFloat:");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v22, CFSTR("wellFramedSubjectScore"));

          v23 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v20, "wellChosenSubjectScore");
          objc_msgSend(v23, "numberWithFloat:");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v24, CFSTR("wellChosenSubjectScore"));

          v25 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v20, "tastefullyBlurredScore");
          objc_msgSend(v25, "numberWithFloat:");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v26, CFSTR("tastefullyBlurredScore"));

          v27 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v20, "sharplyFocusedSubjectScore");
          objc_msgSend(v27, "numberWithFloat:");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v28, CFSTR("sharplyFocusedSubjectScore"));

          v29 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v20, "wellTimedShotScore");
          objc_msgSend(v29, "numberWithFloat:");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v30, CFSTR("wellTimedShotScore"));

          v31 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v20, "pleasantLightingScore");
          objc_msgSend(v31, "numberWithFloat:");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v32, CFSTR("pleasantLightingScore"));

          v33 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v20, "pleasantReflectionsScore");
          objc_msgSend(v33, "numberWithFloat:");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v34, CFSTR("pleasantReflectionsScore"));

          v35 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v20, "harmoniousColorScore");
          objc_msgSend(v35, "numberWithFloat:");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v36, CFSTR("harmoniousColorScore"));

          v37 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v20, "livelyColorScore");
          objc_msgSend(v37, "numberWithFloat:");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v38, CFSTR("livelyColorScore"));

          v39 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v20, "pleasantSymmetryScore");
          objc_msgSend(v39, "numberWithFloat:");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v40, CFSTR("pleasantSymmetryScore"));

          v41 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v20, "pleasantPatternScore");
          objc_msgSend(v41, "numberWithFloat:");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v42, CFSTR("pleasantPatternScore"));

          v43 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v20, "immersivenessScore");
          objc_msgSend(v43, "numberWithFloat:");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v44, CFSTR("immersivenessScore"));

          v45 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v20, "pleasantPerspectiveScore");
          objc_msgSend(v45, "numberWithFloat:");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v46, CFSTR("pleasantPerspectiveScore"));

          v47 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v20, "pleasantPostProcessingScore");
          objc_msgSend(v47, "numberWithFloat:");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v48, CFSTR("pleasantPostProcessingScore"));

          v49 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v20, "noiseScore");
          objc_msgSend(v49, "numberWithFloat:");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v50, CFSTR("noiseScore"));

          v51 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v20, "failureScore");
          objc_msgSend(v51, "numberWithFloat:");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v52, CFSTR("failureScore"));

          v53 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v20, "pleasantCompositionScore");
          objc_msgSend(v53, "numberWithFloat:");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v54, CFSTR("pleasantCompositionScore"));

          v55 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v20, "interestingSubjectScore");
          objc_msgSend(v55, "numberWithFloat:");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v56, CFSTR("interestingSubjectScore"));

          v57 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v20, "intrusiveObjectPresenceScore");
          objc_msgSend(v57, "numberWithFloat:");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v58, CFSTR("intrusiveObjectPresenceScore"));

          v59 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v20, "pleasantCameraTiltScore");
          objc_msgSend(v59, "numberWithFloat:");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v60, CFSTR("pleasantCameraTiltScore"));

          v61 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v20, "lowLight");
          objc_msgSend(v61, "numberWithFloat:");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v62, CFSTR("lowLight"));

          v92[0] = CFSTR("image");
          objc_msgSend(v16, "lastPathComponent");
          v63 = objc_claimAutoreleasedReturnValue();
          v64 = (void *)v63;
          v65 = &stru_1E58AD278;
          if (v63)
            v65 = (const __CFString *)v63;
          v92[1] = CFSTR("scores");
          v93[0] = v65;
          v93[1] = v17;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v93, v92, 2);
          v66 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSObject addObject:](v10, "addObject:", v66);
        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v94, 16);
      }
      while (v12);
    }

    v90[0] = CFSTR("type");
    v90[1] = CFSTR("scoreName");
    scoreName = self->_scoreName;
    v91[0] = CFSTR("scores");
    v91[1] = scoreName;
    v90[2] = CFSTR("report");
    v88 = CFSTR("FP");
    v89 = v10;
    v68 = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v89, &v88, 1);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v91[2] = v69;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v91, v90, 3);
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    v82 = v77;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v70, 1, &v82);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = v82;

    if (v71)
    {
      -[NSObject URLByAppendingPathComponent:](v81, "URLByAppendingPathComponent:", CFSTR("report.json"));
      v73 = objc_claimAutoreleasedReturnValue();
      v74 = 1;
      if ((objc_msgSend(v71, "writeToURL:atomically:", v73, 1) & 1) != 0)
      {
LABEL_22:

        v6 = v78;
        goto LABEL_23;
      }
      PLUIGetLog();
      v75 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v96 = v73;
        v97 = 2112;
        v98 = v72;
        _os_log_impl(&dword_1AAB61000, v75, OS_LOG_TYPE_ERROR, "Failed to write JSON radar report to path: %@, error: %@", buf, 0x16u);
      }

    }
    else
    {
      PLUIGetLog();
      v73 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v96 = v72;
        _os_log_impl(&dword_1AAB61000, v73, OS_LOG_TYPE_ERROR, "Failed to create JSON data with error: %@", buf, 0xCu);
      }
    }
    v74 = 0;
    goto LABEL_22;
  }
  PLUIGetLog();
  v68 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v96 = v81;
    v97 = 2112;
    v98 = v9;
    _os_log_impl(&dword_1AAB61000, v68, OS_LOG_TYPE_ERROR, "Failed to create directory for feedback files at path: %@, error: %@", buf, 0x16u);
  }
  v74 = 0;
  v72 = v9;
LABEL_23:

  return v74;
}

- (id)_cloneAsset:(id)a3 toDirectory:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  dispatch_semaphore_t v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  id v26;
  _QWORD v28[4];
  id v29;
  NSObject *v30;
  uint64_t *v31;
  _QWORD *v32;
  _QWORD v33[5];
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  objc_msgSend(MEMORY[0x1E0CD1438], "assetResourcesForAsset:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v42;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v42 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v11, "type") == 1)
        {
          v8 = v11;
          goto LABEL_11;
        }
      }
      v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__92893;
  v39 = __Block_byref_object_dispose__92894;
  v40 = 0;
  if (v8)
  {
    v12 = (void *)MEMORY[0x1AF42B2C0]();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "originalFilename");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "pathExtension");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByAppendingPathExtension:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "URLByAppendingPathComponent:", v17);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v36[5];
    v36[5] = v18;

    v20 = objc_alloc_init(MEMORY[0x1E0CD1470]);
    objc_msgSend(v20, "setNetworkAccessAllowed:", 1);
    objc_msgSend(MEMORY[0x1E0CD1458], "defaultManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = dispatch_semaphore_create(0);
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x3032000000;
    v33[3] = __Block_byref_object_copy__92893;
    v33[4] = __Block_byref_object_dispose__92894;
    v34 = 0;
    v23 = v36[5];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __79__PUCurationScoreCheckAssetBrowserDebugViewController__cloneAsset_toDirectory___block_invoke;
    v28[3] = &unk_1E58A8E38;
    v31 = &v35;
    v29 = v6;
    v32 = v33;
    v24 = v22;
    v30 = v24;
    objc_msgSend(v21, "writeDataForAssetResource:toFile:options:completionHandler:", v8, v23, v20, v28);
    dispatch_semaphore_wait(v24, 0xFFFFFFFFFFFFFFFFLL);

    _Block_object_dispose(v33, 8);
    objc_autoreleasePoolPop(v12);
    v25 = (void *)v36[5];
  }
  else
  {
    v25 = 0;
  }
  v26 = v25;
  _Block_object_dispose(&v35, 8);

  return v26;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortPickerView, 0);
  objc_storeStrong((id *)&self->_scorePickerView, 0);
  objc_storeStrong((id *)&self->_scoreName, 0);
}

void __79__PUCurationScoreCheckAssetBrowserDebugViewController__cloneAsset_toDirectory___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
    PLUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v9 = 138412546;
      v10 = v6;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_ERROR, "Failed to write asset data to URL: %@, error: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    v7 = objc_msgSend(getDEUtilsClass_92898(), "copyPath:toDestinationDir:zipped:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 32), 1);
    if (v7)
    {
      v5 = v7;
      objc_msgSend(getDEUtilsClass_92898(), "removeFile:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v5);
    }
    else
    {
      PLUIGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_ERROR, "Failed to zip the asset, attaching unzipped", (uint8_t *)&v9, 2u);
      }

      v5 = 0;
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __85__PUCurationScoreCheckAssetBrowserDebugViewController__fileRadarWithIncorrectAssets___block_invoke(id *a1)
{
  void *v2;
  unint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "assetCollectionAssets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  v4 = objc_msgSend(a1[5], "count");
  v5 = (void *)MEMORY[0x1E0CB37F0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v4 / (double)v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringFromNumber:numberStyle:", v6, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\"%@\" has %ld incorrectly scored asset(s)"), *((_QWORD *)a1[4] + 227), v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v9, "appendString:", CFSTR("— Aesthetic Feedback —\n"));
  objc_msgSend(v9, "appendFormat:", CFSTR("Aesthetic: \"%@\"\n"), *((_QWORD *)a1[4] + 227));
  objc_msgSend(v9, "appendFormat:", CFSTR("Incorrect Classification(s): %ld of %ld (%@)\n"), v4, v3, v7);
  NSTemporaryDirectory();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingPathComponent:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v13, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(a1[4], "_writeDiagnosticsToURL:incorrectAssets:", v14, a1[5]) & 1) == 0)
  {
    PLUIGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v14;
      _os_log_impl(&dword_1AAB61000, v15, OS_LOG_TYPE_ERROR, "Failed to write diagnostics to URL: %@", buf, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  objc_msgSend(v16, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v14, 0, 4, &v28);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v28;
  if (!v17)
  {
    PLUIGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v30 = v14;
      v31 = 2112;
      v32 = v18;
      _os_log_impl(&dword_1AAB61000, v19, OS_LOG_TYPE_ERROR, "Failed to find diagnostic files at URL: %@, error: %@", buf, 0x16u);
    }

  }
  v20 = (void *)MEMORY[0x1E0D7B428];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __85__PUCurationScoreCheckAssetBrowserDebugViewController__fileRadarWithIncorrectAssets___block_invoke_439;
  v24[3] = &unk_1E58A8E10;
  v24[4] = a1[4];
  v25 = a1[6];
  v26 = v16;
  v27 = v14;
  v21 = v14;
  v22 = v16;
  LOBYTE(v23) = 0;
  objc_msgSend(v20, "fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:attachmentURLs:includeSysDiagnose:completionHandler:", v8, v9, CFSTR("Other Bug"), CFSTR("819256"), CFSTR("Photos Media Mining (New Bugs)"), CFSTR("all"), &stru_1E58AD278, v17, v23, v24);

}

void __85__PUCurationScoreCheckAssetBrowserDebugViewController__fileRadarWithIncorrectAssets___block_invoke_439(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setEditing:animated:", 0, 0);
  objc_msgSend(*(id *)(a1 + 40), "dismissViewControllerAnimated:completion:", 1, 0);
  v2 = *(void **)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 56);
  v8 = 0;
  v4 = objc_msgSend(v2, "removeItemAtURL:error:", v3, &v8);
  v5 = v8;
  if ((v4 & 1) == 0)
  {
    PLUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138412546;
      v10 = v7;
      v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_ERROR, "Failed to cleanup temporary Tap-To-Radar item at URL: %@, error: %@", buf, 0x16u);
    }

  }
}

uint64_t __73__PUCurationScoreCheckAssetBrowserDebugViewController__presentTapToRadar__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fileRadarWithIncorrectAssets:", 0);
}

void __73__PUCurationScoreCheckAssetBrowserDebugViewController__presentTapToRadar__block_invoke_2(uint64_t a1, int a2)
{
  id v3;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "selectedAssets");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_fileRadarWithIncorrectAssets:", v3);

  }
}

uint64_t __66__PUCurationScoreCheckAssetBrowserDebugViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_update");
}

@end
