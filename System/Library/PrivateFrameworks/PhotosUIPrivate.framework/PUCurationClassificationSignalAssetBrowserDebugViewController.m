@implementation PUCurationClassificationSignalAssetBrowserDebugViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUCurationClassificationSignalAssetBrowserDebugViewController;
  -[PUPhotosAlbumViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[PUCurationClassificationSignalAssetBrowserDebugViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLeftItemsSupplementBackButton:", 1);

  -[PUCurationClassificationSignalAssetBrowserDebugViewController setDefinesPresentationContext:](self, "setDefinesPresentationContext:", 1);
  -[PUCurationClassificationSignalAssetBrowserDebugViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("PUPhotoCell"));

  self->_minimumValue = 0.0;
  self->_maximumValue = 1.0;
  -[PUCurationClassificationSignalAssetBrowserDebugViewController _update](self, "_update");
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
  v15.super_class = (Class)PUCurationClassificationSignalAssetBrowserDebugViewController;
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
  id v3;
  NSDictionary *signalConfidenceByAssetUUID;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 sortsAscending;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  _QWORD v25[5];
  id v26;
  void *v27;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  signalConfidenceByAssetUUID = self->_signalConfidenceByAssetUUID;
  v5 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __72__PUCurationClassificationSignalAssetBrowserDebugViewController__update__block_invoke;
  v25[3] = &unk_1E589B908;
  v25[4] = self;
  v6 = v3;
  v26 = v6;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](signalConfidenceByAssetUUID, "enumerateKeysAndObjectsUsingBlock:", v25);
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "librarySpecificFetchOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!self->_showsVideos)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("mediaType != %d"), 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPredicate:", v9);

  }
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithLocalIdentifiers:options:", v6, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  sortsAscending = self->_sortsAscending;
  v24[0] = v5;
  v24[1] = 3221225472;
  v24[2] = __72__PUCurationClassificationSignalAssetBrowserDebugViewController__update__block_invoke_2;
  v24[3] = &unk_1E589B9B8;
  v24[4] = self;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:comparator:", CFSTR("uuid"), sortsAscending, v24);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v12;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "fetchedObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sortedArrayUsingDescriptors:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssets:title:", v16, self->_signalName);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0CD14E0];
  v27 = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedTitle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "transientCollectionListWithCollections:title:", v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD14D8], "fetchCollectionsInCollectionList:options:", v21, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosAlbumViewController setAssetCollection:fetchResultContainingAssetCollection:filterPredicate:](self, "setAssetCollection:fetchResultContainingAssetCollection:filterPredicate:", v17, v22, 0);
  -[PUCurationClassificationSignalAssetBrowserDebugViewController collectionView](self, "collectionView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "reloadData");

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
  UIPickerView *sortPickerView;
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
  double v32;
  void *v33;
  void *v34;
  id v35;

  v35 = objc_alloc_init(MEMORY[0x1E0DC3F20]);
  objc_msgSend(v35, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "colorWithAlphaComponent:", 0.75);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v6);

  v7 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v34 = v4;
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
  v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", 20.0, 76.0, 120.0, 40.0);
  objc_msgSend(v33, "setAutoresizingMask:", 36);
  objc_msgSend(v33, "setText:", CFSTR("Sort:"));
  objc_msgSend(v9, "addSubview:", v33);
  v16 = (UIPickerView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AE0]), "initWithFrame:", 140.0, 66.0, v13, 60.0);
  sortPickerView = self->_sortPickerView;
  self->_sortPickerView = v16;

  -[UIPickerView layer](self->_sortPickerView, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setCornerRadius:", 6.0);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPickerView setBackgroundColor:](self->_sortPickerView, "setBackgroundColor:", v19);

  -[UIPickerView setDataSource:](self->_sortPickerView, "setDataSource:", self);
  -[UIPickerView setDelegate:](self->_sortPickerView, "setDelegate:", self);
  -[UIPickerView selectRow:inComponent:animated:](self->_sortPickerView, "selectRow:inComponent:animated:", !self->_sortsAscending, 0, 0);
  objc_msgSend(v9, "addSubview:", self->_sortPickerView);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", 20.0, 132.0, 120.0, 40.0);
  objc_msgSend(v20, "setAutoresizingMask:", 36);
  objc_msgSend(v20, "setText:", CFSTR("Minimum:"));
  objc_msgSend(v9, "addSubview:", v20);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3DB8]), "initWithFrame:", 140.0, 132.0, 50.0, 40.0);
  objc_msgSend(v21, "setAutoresizingMask:", 36);
  objc_msgSend(v21, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setCornerRadius:", 6.0);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setBackgroundColor:", v23);

  objc_msgSend(v21, "setTextAlignment:", 1);
  objc_msgSend(v21, "setKeyboardType:", 8);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.3g"), *(_QWORD *)&self->_minimumValue);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setText:", v24);

  objc_msgSend(v21, "addTarget:action:forControlEvents:", self, sel__setMinimum_, 0x40000);
  objc_msgSend(v9, "addSubview:", v21);
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", 20.0, 188.0, 120.0, 40.0);
  objc_msgSend(v25, "setAutoresizingMask:", 36);
  objc_msgSend(v25, "setText:", CFSTR("Maximum:"));
  objc_msgSend(v9, "addSubview:", v25);
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3DB8]), "initWithFrame:", 140.0, 188.0, 50.0, 40.0);
  objc_msgSend(v26, "setAutoresizingMask:", 36);
  objc_msgSend(v26, "layer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setCornerRadius:", 6.0);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setBackgroundColor:", v28);

  objc_msgSend(v26, "setTextAlignment:", 1);
  objc_msgSend(v26, "setKeyboardType:", 8);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.3g"), *(_QWORD *)&self->_maximumValue);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setText:", v29);

  objc_msgSend(v26, "addTarget:action:forControlEvents:", self, sel__setMaximum_, 0x40000);
  objc_msgSend(v9, "addSubview:", v26);
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", 20.0, 244.0, 120.0, 40.0);
  objc_msgSend(v30, "setAutoresizingMask:", 36);
  objc_msgSend(v30, "setText:", CFSTR("Show Videos:"));
  objc_msgSend(v9, "addSubview:", v30);
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D18]), "initWithFrame:", 140.0, 244.0, 50.0, 40.0);
  objc_msgSend(v31, "setAutoresizingMask:", 36);
  objc_msgSend(v31, "setOn:", self->_showsVideos);
  objc_msgSend(v31, "addTarget:action:forControlEvents:", self, sel__setShowsVideos_, 4096);
  objc_msgSend(v9, "addSubview:", v31);
  objc_msgSend(v34, "bounds");
  objc_msgSend(v9, "setFrame:", 10.0, 10.0, v32 + -20.0, 300.0);
  -[PUCurationClassificationSignalAssetBrowserDebugViewController setModalPresentationStyle:](self, "setModalPresentationStyle:", 7);
  -[PUCurationClassificationSignalAssetBrowserDebugViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v35, 1, 0);

}

- (void)_setMinimum:(id)a3
{
  void *v4;
  double v5;

  objc_msgSend(a3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  self->_minimumValue = v5;

  -[PUCurationClassificationSignalAssetBrowserDebugViewController _update](self, "_update");
}

- (void)_setMaximum:(id)a3
{
  void *v4;
  double v5;

  objc_msgSend(a3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  self->_maximumValue = v5;

  -[PUCurationClassificationSignalAssetBrowserDebugViewController _update](self, "_update");
}

- (void)_setShowsVideos:(id)a3
{
  self->_showsVideos = objc_msgSend(a3, "isOn");
  -[PUCurationClassificationSignalAssetBrowserDebugViewController _update](self, "_update");
}

- (void)_doneEditingSettings:(id)a3
{
  -[PUCurationClassificationSignalAssetBrowserDebugViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)setSignalConfidenceByAssetUUID:(id)a3 withSignalName:(id)a4 operatingPoint:(double)a5 highPrecisionOperatingPoint:(double)a6 highRecallOperatingPoint:(double)a7
{
  NSString *v13;
  NSString *signalName;
  id v15;

  v15 = a3;
  v13 = (NSString *)a4;
  objc_storeStrong((id *)&self->_signalConfidenceByAssetUUID, a3);
  signalName = self->_signalName;
  self->_signalName = v13;

  self->_operatingPoint = a5;
  self->_highPrecisionOperatingPoint = a6;
  self->_highRecallOperatingPoint = a7;
  if (-[PUCurationClassificationSignalAssetBrowserDebugViewController isViewLoaded](self, "isViewLoaded"))
    -[PUCurationClassificationSignalAssetBrowserDebugViewController _update](self, "_update");

}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSDictionary *signalConfidenceByAssetUUID;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v21;
  PUCurationClassificationSignalAssetBrowserDebugViewController *v22;
  uint64_t v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)PUCurationClassificationSignalAssetBrowserDebugViewController;
  v6 = a4;
  -[PUPhotosGridViewController collectionView:cellForItemAtIndexPath:](&v24, sel_collectionView_cellForItemAtIndexPath_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosAlbumViewController assetCollectionAssets](self, "assetCollectionAssets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "item");

  objc_msgSend(v8, "objectAtIndex:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  signalConfidenceByAssetUUID = self->_signalConfidenceByAssetUUID;
  objc_msgSend(v10, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](signalConfidenceByAssetUUID, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  v15 = v14;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.2f"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setScore:", v16);

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __103__PUCurationClassificationSignalAssetBrowserDebugViewController_collectionView_cellForItemAtIndexPath___block_invoke;
  block[3] = &unk_1E58A9DF0;
  v17 = v7;
  v23 = v15;
  v21 = v17;
  v22 = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  v18 = v17;

  return v18;
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  return 2 * (self->_sortPickerView == a3);
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  __CFString *v6;

  if (self->_sortPickerView != a3)
    return 0;
  v6 = CFSTR("Descending");
  if (!a4)
    v6 = CFSTR("Ascending");
  return v6;
}

- (double)pickerView:(id)a3 rowHeightForComponent:(int64_t)a4
{
  return 20.0;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  if (self->_sortPickerView == a3)
    self->_sortsAscending = a4 == 0;
  -[PUCurationClassificationSignalAssetBrowserDebugViewController _update](self, "_update");
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
    v9[2] = __83__PUCurationClassificationSignalAssetBrowserDebugViewController__presentTapToRadar__block_invoke_2;
    v9[3] = &unk_1E58A9910;
    v9[4] = self;
    objc_msgSend(MEMORY[0x1E0D7B428], "presentTermsAndConditionsForUIViewController:completion:", self, v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("File Radar"), CFSTR("File radar without attaching photos?\nSelecting incorrect photos can help improve the classification features."), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __83__PUCurationClassificationSignalAssetBrowserDebugViewController__presentTapToRadar__block_invoke;
    v10[3] = &unk_1E58A8DE8;
    v10[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("File Radar"), 0, v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addAction:", v7);
    objc_msgSend(v6, "addAction:", v8);
    -[PUCurationClassificationSignalAssetBrowserDebugViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);

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
  v8[2] = __95__PUCurationClassificationSignalAssetBrowserDebugViewController__fileRadarWithIncorrectAssets___block_invoke;
  v8[3] = &unk_1E58AB790;
  v8[4] = self;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  -[PUCurationClassificationSignalAssetBrowserDebugViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, v8);

}

- (BOOL)_writeDiagnosticsToURL:(id)a3 incorrectAssets:(id)a4
{
  NSObject *v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  NSString *signalName;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  BOOL v36;
  NSObject *v37;
  NSObject *v39;
  id v40;
  id obj;
  uint64_t v42;
  NSObject *v43;
  NSObject *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  NSObject *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  id v58;
  const __CFString *v59;
  NSObject *v60;
  _QWORD v61[3];
  _QWORD v62[3];
  _QWORD v63[2];
  _QWORD v64[2];
  void *v65;
  _QWORD v66[2];
  _QWORD v67[2];
  _BYTE v68[128];
  uint8_t v69[128];
  uint8_t buf[4];
  NSObject *v71;
  __int16 v72;
  NSObject *v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0;
  v45 = v5;
  LOBYTE(v5) = objc_msgSend(v7, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v58);
  v8 = v58;

  if ((v5 & 1) != 0)
  {
    v39 = v8;
    v9 = objc_opt_new();
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v40 = v6;
    obj = v6;
    v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v69, 16);
    if (v46)
    {
      v42 = *(_QWORD *)v55;
      v43 = v9;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v55 != v42)
            objc_enumerationMutation(obj);
          v48 = v10;
          v11 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v10);
          -[PUCurationClassificationSignalAssetBrowserDebugViewController _cloneAsset:toDirectory:](self, "_cloneAsset:toDirectory:", v11, v45, v39);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(sel_sceneIdentifier);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (void *)objc_opt_new();
          objc_msgSend(v11, "sceneClassifications");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = 0u;
          v51 = 0u;
          v52 = 0u;
          v53 = 0u;
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v50, v68, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v51;
            do
            {
              for (i = 0; i != v16; ++i)
              {
                if (*(_QWORD *)v51 != v17)
                  objc_enumerationMutation(v14);
                v19 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
                v66[0] = v12;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v19, "extendedSceneIdentifier"));
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v66[1] = CFSTR("confidence");
                v67[0] = v20;
                v21 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v19, "confidence");
                objc_msgSend(v21, "numberWithDouble:");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v67[1] = v22;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v67, v66, 2);
                v23 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v13, "addObject:", v23);
              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v50, v68, 16);
            }
            while (v16);
          }
          objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", v12, 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = v24;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v65, 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "sortUsingDescriptors:", v25);

          v63[0] = CFSTR("image");
          objc_msgSend(v47, "lastPathComponent");
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = (void *)v26;
          v28 = &stru_1E58AD278;
          if (v26)
            v28 = (const __CFString *)v26;
          v63[1] = CFSTR("classifications");
          v64[0] = v28;
          v64[1] = v13;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, v63, 2);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          v9 = v43;
          -[NSObject addObject:](v43, "addObject:", v29);

          v10 = v48 + 1;
        }
        while (v48 + 1 != v46);
        v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v69, 16);
      }
      while (v46);
    }

    v61[0] = CFSTR("type");
    v61[1] = CFSTR("signalName");
    signalName = self->_signalName;
    v62[0] = CFSTR("classification signals");
    v62[1] = signalName;
    v61[2] = CFSTR("report");
    v59 = CFSTR("FP");
    v60 = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v62[2] = v31;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, v61, 3);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v49 = v39;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v32, 1, &v49);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v49;

    if (v33)
    {
      -[NSObject URLByAppendingPathComponent:](v45, "URLByAppendingPathComponent:", CFSTR("report.json"));
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = 1;
      if ((objc_msgSend(v33, "writeToURL:atomically:", v35, 1) & 1) != 0)
      {
LABEL_29:

        v6 = v40;
        goto LABEL_30;
      }
      PLUIGetLog();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v71 = v35;
        v72 = 2112;
        v73 = v34;
        _os_log_impl(&dword_1AAB61000, v37, OS_LOG_TYPE_ERROR, "Failed to write JSON radar report to path: %@, error: %@", buf, 0x16u);
      }

    }
    else
    {
      PLUIGetLog();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v71 = v34;
        _os_log_impl(&dword_1AAB61000, v35, OS_LOG_TYPE_ERROR, "Failed to create JSON data with error: %@", buf, 0xCu);
      }
    }
    v36 = 0;
    goto LABEL_29;
  }
  PLUIGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v71 = v45;
    v72 = 2112;
    v73 = v8;
    _os_log_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_ERROR, "Failed to create directory for feedback files at path: %@, error: %@", buf, 0x16u);
  }
  v36 = 0;
  v34 = v8;
LABEL_30:

  return v36;
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
  v38 = __Block_byref_object_copy__4407;
  v39 = __Block_byref_object_dispose__4408;
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
    v33[3] = __Block_byref_object_copy__4407;
    v33[4] = __Block_byref_object_dispose__4408;
    v34 = 0;
    v23 = v36[5];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __89__PUCurationClassificationSignalAssetBrowserDebugViewController__cloneAsset_toDirectory___block_invoke;
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
  objc_storeStrong((id *)&self->_signalConfidenceByAssetUUID, 0);
  objc_storeStrong((id *)&self->_signalName, 0);
}

void __89__PUCurationClassificationSignalAssetBrowserDebugViewController__cloneAsset_toDirectory___block_invoke(uint64_t a1, void *a2)
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
    v7 = objc_msgSend(getDEUtilsClass(), "copyPath:toDestinationDir:zipped:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 32), 1);
    if (v7)
    {
      v5 = v7;
      objc_msgSend(getDEUtilsClass(), "removeFile:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
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

void __95__PUCurationClassificationSignalAssetBrowserDebugViewController__fileRadarWithIncorrectAssets___block_invoke(id *a1)
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

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[CLC] \"%@\" has %ld incorrect classification(s)"), *((_QWORD *)a1[4] + 225), v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v9, "appendString:", CFSTR("— Classification Signal Feedback —\n"));
  objc_msgSend(v9, "appendFormat:", CFSTR("Classification Signal: \"%@\"\n"), *((_QWORD *)a1[4] + 225));
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
  v24[2] = __95__PUCurationClassificationSignalAssetBrowserDebugViewController__fileRadarWithIncorrectAssets___block_invoke_267;
  v24[3] = &unk_1E58A8E10;
  v24[4] = a1[4];
  v25 = a1[6];
  v26 = v16;
  v27 = v14;
  v21 = v14;
  v22 = v16;
  LOBYTE(v23) = 0;
  objc_msgSend(v20, "fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:attachmentURLs:includeSysDiagnose:completionHandler:", v8, v9, CFSTR("Other Bug"), CFSTR("721490"), CFSTR("Photos Scene Classification"), CFSTR("all"), &stru_1E58AD278, v17, v23, v24);

}

void __95__PUCurationClassificationSignalAssetBrowserDebugViewController__fileRadarWithIncorrectAssets___block_invoke_267(uint64_t a1)
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

uint64_t __83__PUCurationClassificationSignalAssetBrowserDebugViewController__presentTapToRadar__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fileRadarWithIncorrectAssets:", 0);
}

void __83__PUCurationClassificationSignalAssetBrowserDebugViewController__presentTapToRadar__block_invoke_2(uint64_t a1, int a2)
{
  id v3;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "selectedAssets");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_fileRadarWithIncorrectAssets:", v3);

  }
}

void __103__PUCurationClassificationSignalAssetBrowserDebugViewController_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1)
{
  double v2;
  double *v3;
  uint64_t v4;
  id v5;

  v2 = *(double *)(a1 + 48);
  v3 = *(double **)(a1 + 40);
  if (v2 >= v3[227])
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else if (v2 >= v3[226])
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v2 >= v3[228])
      objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (id)v4;
  objc_msgSend(*(id *)(a1 + 32), "setColor:", v4);

}

void __72__PUCurationClassificationSignalAssetBrowserDebugViewController__update__block_invoke(uint64_t a1, void *a2, void *a3)
{
  double v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  objc_msgSend(a3, "doubleValue");
  v6 = *(_QWORD *)(a1 + 32);
  if (v5 >= *(double *)(v6 + 1840) && v5 <= *(double *)(v6 + 1848))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);

}

uint64_t __72__PUCurationClassificationSignalAssetBrowserDebugViewController__update__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 1832);
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1832), "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "compare:", v8);
  return v9;
}

@end
