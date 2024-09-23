@implementation PXSeenAssetSettingsViewController

- (void)viewDidLoad
{
  id v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXSeenAssetSettingsViewController;
  -[PXSeenAssetSettingsViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[PXSeenAssetSettingsViewController setTitle:](self, "setTitle:", CFSTR("Edit seen state"));
  v3 = objc_alloc_init(MEMORY[0x1E0DC3D48]);
  objc_msgSend(v3, "setDataSource:", self);
  objc_msgSend(v3, "setDelegate:", self);
  -[PXSeenAssetSettingsViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v3);

  -[PXSeenAssetSettingsViewController setTableView:](self, "setTableView:", v3);
  -[PXSeenAssetSettingsViewController _fetchSeenAssetsAndReload:](self, "_fetchSeenAssetsAndReload:", 1);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXSeenAssetSettingsViewController;
  -[PXSeenAssetSettingsViewController viewDidAppear:](&v3, sel_viewDidAppear_, a3);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PXSeenAssetSettingsViewController;
  -[PXSeenAssetSettingsViewController viewDidLayoutSubviews](&v13, sel_viewDidLayoutSubviews);
  -[PXSeenAssetSettingsViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[PXSeenAssetSettingsViewController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

- (id)_suggestedSeenFetchOptions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("((additionalAttributes.variationSuggestionStates >> %lld) & %lld) == %lld"), 0, 33, 33);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("((additionalAttributes.variationSuggestionStates >> %lld) & %lld) == %lld"), 12, 33, 33);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3528];
  v13[0] = v4;
  v13[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "orPredicateWithSubpredicates:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setInternalPredicate:", v8);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSortDescriptors:", v10);

  return v3;
}

- (void)_fetchSeenAssetsAndReload:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  -[PXSeenAssetSettingsViewController _suggestedSeenFetchOptions](self, "_suggestedSeenFetchOptions");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithMediaType:options:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSeenAssetSettingsViewController setFetchResult:](self, "setFetchResult:", v5);
  if (v3)
  {
    -[PXSeenAssetSettingsViewController tableView](self, "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadData");

  }
}

- (int64_t)_recommendedVariationTypeForAsset:(id)a3
{
  id v3;
  int64_t v4;
  int v5;

  v3 = a3;
  if (objc_msgSend(v3, "px_isVariationTypeRecommended:", 1))
    v4 = 1;
  else
    v4 = -1;
  v5 = objc_msgSend(v3, "px_isVariationTypeRecommended:", 3);

  if (v5)
    return 3;
  else
    return v4;
}

- (void)_presentConfirmationForAssetAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id location;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Are you sure?"), CFSTR("This will mark all of the asset's suggested variations as unseen"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v6 = (void *)MEMORY[0x1E0DC3448];
  v7 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __77__PXSeenAssetSettingsViewController__presentConfirmationForAssetAtIndexPath___block_invoke;
  v17[3] = &unk_1E512AF98;
  objc_copyWeak(&v20, &location);
  v8 = v4;
  v18 = v8;
  v9 = v5;
  v19 = v9;
  objc_msgSend(v6, "actionWithTitle:style:handler:", CFSTR("Confirm"), 0, v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0DC3448];
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __77__PXSeenAssetSettingsViewController__presentConfirmationForAssetAtIndexPath___block_invoke_2;
  v15[3] = &unk_1E5144530;
  v12 = v9;
  v16 = v12;
  objc_msgSend(v11, "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addAction:", v13);
  objc_msgSend(v12, "addAction:", v10);
  -[PXSeenAssetSettingsViewController navigationController](self, "navigationController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "presentViewController:animated:completion:", v12, 1, 0);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

- (void)_markVariationsAsUnseenForAssetAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXSeenAssetSettingsViewController fetchResult](self, "fetchResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v4, "row"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  PLUIGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v6;
    _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEFAULT, "[PXSeenAssetSettingsViewController] marking suggestions for variations as unseen for asset %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  objc_msgSend(v6, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __80__PXSeenAssetSettingsViewController__markVariationsAsUnseenForAssetAtIndexPath___block_invoke;
  v17[3] = &unk_1E5149198;
  v10 = v6;
  v18 = v10;
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __80__PXSeenAssetSettingsViewController__markVariationsAsUnseenForAssetAtIndexPath___block_invoke_2;
  v13[3] = &unk_1E512AFC0;
  objc_copyWeak(&v16, (id *)buf);
  v11 = v4;
  v14 = v11;
  v12 = v10;
  v15 = v12;
  objc_msgSend(v8, "performChanges:completionHandler:", v17, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[PXSeenAssetSettingsViewController fetchResult](self, "fetchResult", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int64_t v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;

  v6 = a3;
  v7 = a4;
  -[PXSeenAssetSettingsViewController fetchResult](self, "fetchResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v7, "row"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("SeenAssetCell"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("SeenAssetCell"));
  objc_msgSend(v10, "imageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setContentMode:", 2);

  objc_msgSend(v10, "imageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setImage:", 0);

  objc_msgSend(v10, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setNumberOfLines:", 0);

  v14 = -[PXSeenAssetSettingsViewController _recommendedVariationTypeForAsset:](self, "_recommendedVariationTypeForAsset:", v9);
  switch(v14)
  {
    case 3:
      objc_msgSend(v10, "textLabel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v17 = CFSTR("Long Exposure");
      break;
    case 2:
      objc_msgSend(v10, "textLabel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v17 = CFSTR("Mirror");
      break;
    case 1:
      objc_msgSend(v10, "textLabel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v17 = CFSTR("Autoloop");
      break;
    default:
      objc_msgSend(v10, "textLabel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v17 = CFSTR("Unsupported suggested variation or suggestion variation matches current playback");
      break;
  }
  objc_msgSend(v15, "setText:", v17);

  objc_msgSend(MEMORY[0x1E0CD1488], "defaultManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_alloc_init(MEMORY[0x1E0CD15A8]);
  objc_msgSend(v19, "setAllowPlaceholder:", 1);
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __69__PXSeenAssetSettingsViewController_tableView_cellForRowAtIndexPath___block_invoke;
  v26[3] = &unk_1E51356B8;
  v20 = v10;
  v27 = v20;
  v28 = v6;
  v29 = v7;
  v21 = v7;
  v22 = v6;
  objc_msgSend(v18, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v9, 1, v19, v26, 150.0, 150.0);
  v23 = v29;
  v24 = v20;

  return v24;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 150.0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;

  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  -[PXSeenAssetSettingsViewController _presentConfirmationForAssetAtIndexPath:](self, "_presentConfirmationForAssetAtIndexPath:", v6);

}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (PHFetchResult)fetchResult
{
  return self->_fetchResult;
}

- (void)setFetchResult:(id)a3
{
  objc_storeStrong((id *)&self->_fetchResult, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchResult, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

void __69__PXSeenAssetSettingsViewController_tableView_cellForRowAtIndexPath___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    objc_msgSend(a1[4], "imageView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setImage:", v3);

    v5 = a1[5];
    v10[0] = a1[6];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reloadRowsAtIndexPaths:withRowAnimation:", v6, 100);
  }
  else
  {
    v7 = a1[5];
    v8 = a1[6];
    v9 = v3;
    px_dispatch_on_main_queue();

    v6 = v7;
  }

}

void __69__PXSeenAssetSettingsViewController_tableView_cellForRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "cellForRowAtIndexPath:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v2, "imageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImage:", v4);

    v6 = *(void **)(a1 + 32);
    v8[0] = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadRowsAtIndexPaths:withRowAnimation:", v7, 100);

  }
}

id __80__PXSeenAssetSettingsViewController__markVariationsAsUnseenForAssetAtIndexPath___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  v2 = (id)objc_msgSend(MEMORY[0x1E0CD13B0], "px_changeRequestForSettingRecommendationSeen:variationType:asset:", 0, 1, *(_QWORD *)(a1 + 32));
  v3 = (id)objc_msgSend(MEMORY[0x1E0CD13B0], "px_changeRequestForSettingRecommendationSeen:variationType:asset:", 0, 3, *(_QWORD *)(a1 + 32));
  return (id)objc_msgSend(MEMORY[0x1E0CD13B0], "px_changeRequestForSettingRecommendationSeen:variationType:asset:", 0, 2, *(_QWORD *)(a1 + 32));
}

void __80__PXSeenAssetSettingsViewController__markVariationsAsUnseenForAssetAtIndexPath___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  uint64_t v8;
  id v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "_fetchSeenAssetsAndReload:", 0);

    objc_copyWeak(&v10, (id *)(a1 + 48));
    v9 = *(id *)(a1 + 32);
    px_dispatch_on_main_queue();

    objc_destroyWeak(&v10);
  }
  else
  {
    PLUIGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v12 = v8;
      v13 = 2112;
      v14 = v5;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "[PXSeenAssetSettingsViewController] failed to mark suggestions as unseen for asset %@: %@", buf, 0x16u);
    }

  }
}

void __80__PXSeenAssetSettingsViewController__markVariationsAsUnseenForAssetAtIndexPath___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deleteRowsAtIndexPaths:withRowAnimation:", v4, 100);

}

uint64_t __77__PXSeenAssetSettingsViewController__presentConfirmationForAssetAtIndexPath___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_markVariationsAsUnseenForAssetAtIndexPath:", *(_QWORD *)(a1 + 32));

  return objc_msgSend(*(id *)(a1 + 40), "dismissViewControllerAnimated:completion:", 1, 0);
}

uint64_t __77__PXSeenAssetSettingsViewController__presentConfirmationForAssetAtIndexPath___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

@end
