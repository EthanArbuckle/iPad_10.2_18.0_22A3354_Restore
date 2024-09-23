@implementation PXSuggesterDebugViewController

- (PXSuggesterDebugViewController)initWithName:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  PXSuggesterDebugViewController *v9;
  PXSuggesterDebugViewController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXSuggesterDebugViewController;
  v9 = -[PXSuggesterDebugViewController init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_options, a4);
  }

  return v10;
}

- (void)viewDidLoad
{
  NSString *name;
  void *v4;
  void *v5;
  UIActivityIndicatorView *v6;
  UIActivityIndicatorView *spinnerView;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  void *v27;
  id v28;
  UILabel *v29;
  UILabel *noResultLabel;
  void *v31;
  void *v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  CGFloat v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  CGFloat v50;
  void *v51;
  void *v52;
  objc_super v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;

  v53.receiver = self;
  v53.super_class = (Class)PXSuggesterDebugViewController;
  -[PXSuggesterDebugViewController viewDidLoad](&v53, sel_viewDidLoad);
  name = self->_name;
  -[PXSuggesterDebugViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", name);

  -[PXSuggesterDebugViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEstimatedRowHeight:", 44.0);

  v6 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 101);
  spinnerView = self->_spinnerView;
  self->_spinnerView = v6;

  objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivityIndicatorView setColor:](self->_spinnerView, "setColor:", v8);

  -[UIActivityIndicatorView bounds](self->_spinnerView, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[PXSuggesterDebugViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bounds");
  v19 = v18;
  -[UIActivityIndicatorView bounds](self->_spinnerView, "bounds");
  v21 = (v19 - v20) * 0.5;
  -[PXSuggesterDebugViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "bounds");
  v24 = v23;
  -[UIActivityIndicatorView bounds](self->_spinnerView, "bounds");
  v26 = (v24 - v25) * 0.5;
  v54.origin.x = v10;
  v54.origin.y = v12;
  v54.size.width = v14;
  v54.size.height = v16;
  v55 = CGRectOffset(v54, v21, v26);
  -[UIActivityIndicatorView setFrame:](self->_spinnerView, "setFrame:", v55.origin.x, v55.origin.y, v55.size.width, v55.size.height);

  -[UIActivityIndicatorView setAutoresizingMask:](self->_spinnerView, "setAutoresizingMask:", 45);
  -[UIActivityIndicatorView setHidesWhenStopped:](self->_spinnerView, "setHidesWhenStopped:", 1);
  -[PXSuggesterDebugViewController view](self, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addSubview:", self->_spinnerView);

  v28 = objc_alloc(MEMORY[0x1E0DC3990]);
  v29 = (UILabel *)objc_msgSend(v28, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  noResultLabel = self->_noResultLabel;
  self->_noResultLabel = v29;

  -[UILabel setText:](self->_noResultLabel, "setText:", CFSTR("No Result"));
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 36.0, *MEMORY[0x1E0DC1420]);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_noResultLabel, "setFont:", v31);

  objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_noResultLabel, "setTextColor:", v32);

  -[UILabel setTextAlignment:](self->_noResultLabel, "setTextAlignment:", 1);
  -[UILabel sizeToFit](self->_noResultLabel, "sizeToFit");
  -[UILabel bounds](self->_noResultLabel, "bounds");
  v34 = v33;
  v36 = v35;
  v38 = v37;
  v40 = v39;
  -[PXSuggesterDebugViewController view](self, "view");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "bounds");
  v43 = v42;
  -[UILabel bounds](self->_noResultLabel, "bounds");
  v45 = (v43 - v44) * 0.5;
  -[PXSuggesterDebugViewController view](self, "view");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "bounds");
  v48 = v47;
  -[UILabel bounds](self->_noResultLabel, "bounds");
  v50 = (v48 - v49) * 0.5;
  v56.origin.x = v34;
  v56.origin.y = v36;
  v56.size.width = v38;
  v56.size.height = v40;
  v57 = CGRectOffset(v56, v45, v50);
  -[UILabel setFrame:](self->_noResultLabel, "setFrame:", v57.origin.x, v57.origin.y, v57.size.width, v57.size.height);

  -[UILabel setAutoresizingMask:](self->_noResultLabel, "setAutoresizingMask:", 45);
  -[UILabel setHidden:](self->_noResultLabel, "setHidden:", 1);
  -[PXSuggesterDebugViewController view](self, "view");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "addSubview:", self->_noResultLabel);

  -[PXSuggesterDebugViewController _updateToolbarItems](self, "_updateToolbarItems");
  -[PXSuggesterDebugViewController navigationController](self, "navigationController");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setToolbarHidden:animated:", 0, 1);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  _QWORD v5[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXSuggesterDebugViewController;
  -[PXSuggesterDebugViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  -[PXSuggesterDebugViewController willStartProcessing](self, "willStartProcessing");
  +[PXContextualMemoriesSettingsController sharedController](PXContextualMemoriesSettingsController, "sharedController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__PXSuggesterDebugViewController_viewWillAppear___block_invoke;
  v5[3] = &unk_1E5120DF0;
  v5[4] = self;
  objc_msgSend(v4, "requestUpdatedContextualMemoriesSettingsWithOptions:completionHandler:", 0, v5);

}

- (void)willStartProcessing
{
  -[UIBarButtonItem setEnabled:](self->_fullLibraryButton, "setEnabled:", 0);
  -[UIBarButtonItem setEnabled:](self->_dateButton, "setEnabled:", 0);
  -[UILabel setHidden:](self->_noResultLabel, "setHidden:", 1);
  -[UIActivityIndicatorView startAnimating](self->_spinnerView, "startAnimating");
}

- (void)didStopProcessing
{
  -[UIActivityIndicatorView stopAnimating](self->_spinnerView, "stopAnimating");
  -[UILabel setHidden:](self->_noResultLabel, "setHidden:", -[NSArray count](self->_sortedItems, "count") != 0);
  -[UIBarButtonItem setEnabled:](self->_dateButton, "setEnabled:", 1);
  -[UIBarButtonItem setEnabled:](self->_fullLibraryButton, "setEnabled:", 1);
}

- (void)refresh
{
  void *v3;
  void *v4;
  id v5;

  -[PXSuggesterDebugViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

  -[PXSuggesterDebugViewController navigationItem](self, "navigationItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%d) %@"), -[NSArray count](self->_sortedItems, "count"), self->_name);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v4);

}

- (id)assetsDataSourceManagerForSuggestion:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  PXPhotosDataSourceConfiguration *v9;
  PXPhotosDataSource *v10;
  PXPhotoKitAssetsDataSourceManager *v11;
  PXPhotoKitAssetsDataSourceManager *v12;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CD14E0];
  v14 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v14, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transientCollectionListWithCollections:title:", v6, 0, v14, v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD14D8], "fetchCollectionsInCollectionList:options:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PXPhotosDataSourceConfiguration initWithCollectionListFetchResult:options:]([PXPhotosDataSourceConfiguration alloc], "initWithCollectionListFetchResult:options:", v8, 0);
  v10 = -[PXPhotosDataSource initWithPhotosDataSourceConfiguration:]([PXPhotosDataSource alloc], "initWithPhotosDataSourceConfiguration:", v9);
  v11 = [PXPhotoKitAssetsDataSourceManager alloc];

  v12 = -[PXPhotoKitAssetsDataSourceManager initWithPhotosDataSource:](v11, "initWithPhotosDataSource:", v10);
  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  PHSuggestion *v5;
  PHSuggestion *currentSuggestion;
  void *v7;
  id v8;

  -[NSArray objectAtIndexedSubscript:](self->_sortedItems, "objectAtIndexedSubscript:", objc_msgSend(a4, "row", a3));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "suggestion");
  v5 = (PHSuggestion *)objc_claimAutoreleasedReturnValue();
  currentSuggestion = self->_currentSuggestion;
  self->_currentSuggestion = v5;

  -[UIViewController px_enableOneUpPresentation](self, "px_enableOneUpPresentation");
  -[UIViewController px_oneUpPresentation](self, "px_oneUpPresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", self);
  objc_msgSend(v7, "startWithConfigurationHandler:", 0);

}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;

  -[NSArray objectAtIndexedSubscript:](self->_sortedItems, "objectAtIndexedSubscript:", objc_msgSend(a4, "row", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "rangeOfString:", CFSTR("\n"));

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    v7 = 44.0;
  else
    v7 = 66.0;

  return v7;
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  void *v5;
  id v6;
  PXSuggestionDebugViewController *v7;
  void *v8;
  PXSuggestionDebugViewController *v9;
  void *v10;
  id v11;

  -[NSArray objectAtIndexedSubscript:](self->_sortedItems, "objectAtIndexedSubscript:", objc_msgSend(a4, "row", a3));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "suggestion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyCuratedAssetInAssetCollection:referenceAsset:", v5, 0);
  v7 = [PXSuggestionDebugViewController alloc];
  objc_msgSend(v11, "info");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PXSuggestionDebugViewController initWithSuggestion:suggestionInfo:](v7, "initWithSuggestion:suggestionInfo:", v5, v8);

  -[PXSuggesterDebugViewController navigationController](self, "navigationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "px_presentViewControllerInNavigationController:animated:dimissButtonLocation:completion:", v9, 1, 0, 0);

}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0DC36B8];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __92__PXSuggesterDebugViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke;
  v13[3] = &unk_1E512DF48;
  v14 = v6;
  v15 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)oneUpPresentationDataSourceManager:(id)a3
{
  return -[PXSuggesterDebugViewController assetsDataSourceManagerForSuggestion:](self, "assetsDataSourceManagerForSuggestion:", self->_currentSuggestion);
}

- (id)oneUpPresentationMediaProvider:(id)a3
{
  return objc_alloc_init(PXPhotoKitUIMediaProvider);
}

- (int64_t)oneUpPresentationOrigin:(id)a3
{
  return 0;
}

- (id)oneUpPresentationInitialAssetReference:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[PXSuggesterDebugViewController oneUpPresentationDataSourceManager:](self, "oneUpPresentationDataSourceManager:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startingAssetReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_sortedItems, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  PXSuggesterDebugViewControllerCell *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("SuggestersDebugTableViewCellIdentifier"));
  v7 = (PXSuggesterDebugViewControllerCell *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = -[PXSuggesterDebugViewControllerCell initWithStyle:reuseIdentifier:]([PXSuggesterDebugViewControllerCell alloc], "initWithStyle:reuseIdentifier:", 3, CFSTR("SuggestersDebugTableViewCellIdentifier"));
    -[PXSuggesterDebugViewControllerCell detailTextLabel](v7, "detailTextLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNumberOfLines:", 2);

    -[PXSuggesterDebugViewControllerCell detailTextLabel](v7, "detailTextLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLineBreakMode:", 0);

  }
  -[NSArray objectAtIndexedSubscript:](self->_sortedItems, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSuggesterDebugViewController configureCell:withItem:](self, "configureCell:withItem:", v7, v10);

  return v7;
}

- (void)configureCell:(id)a3 withItem:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v5 = a4;
  objc_msgSend(v5, "suggestion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setSuggestion:", v6);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isInvalid"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v14 = (void *)v8;

    v7 = v14;
    goto LABEL_8;
  }
  objc_msgSend(v5, "info");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("identicalExistingSuggestionInfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "greenColor");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_msgSend(v5, "info");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("suggestionsByCollisionReason"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "orangeColor");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
LABEL_8:
  objc_msgSend(v21, "textLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_1E5149688);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setText:", v17);
  objc_msgSend(v15, "setTextColor:", v7);
  objc_msgSend(v21, "detailTextLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setText:", v19);

  objc_msgSend(v18, "setTextColor:", v7);
  objc_msgSend(v18, "sizeToFit");
  objc_msgSend(v5, "suggestion");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setAccessoryType:", 4 * (v20 != 0));

}

- (void)_fetchSuggestions
{
  void *v3;
  void *v4;
  NSDate *date;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  PXSuggesterDebugCollectionItem *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _QWORD v30[3];

  v30[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSDictionary mutableCopy](self->_options, "mutableCopy");
  v4 = v3;
  date = self->_date;
  if (date)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", date, CFSTR("localDate"));
  if (self->_fullLibraryIsEnabled)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("universalStartDate"));

    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("universalEndDate"));

  }
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v4;
  objc_msgSend(MEMORY[0x1E0CD17D0], "suggestionInfosWithOptions:photoLibrary:", v4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortedArrayUsingDescriptors:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v12, "count"));
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v14 = v12;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CD17D0], "transientSuggestionWithInfo:photoLibrary:", v19, v8);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[PXSuggesterDebugCollectionItem initWithSuggestion:suggestionInfo:]([PXSuggesterDebugCollectionItem alloc], "initWithSuggestion:suggestionInfo:", v20, v19);
        objc_msgSend(v13, "addObject:", v21);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v16);
  }

  v22 = *(void **)(v23 + 1016);
  *(_QWORD *)(v23 + 1016) = v13;

  *(_QWORD *)(v23 + 1072) = 1;
  *(_BYTE *)(v23 + 1080) = 1;
  objc_msgSend((id)v23, "updateShowInvalidItemsButton");
  objc_msgSend((id)v23, "_sortItems");
  objc_msgSend((id)v23, "refresh");

}

- (id)fullLibraryButton
{
  UIBarButtonItem *fullLibraryButton;
  UIBarButtonItem *v4;
  UIBarButtonItem *v5;

  fullLibraryButton = self->_fullLibraryButton;
  if (!fullLibraryButton)
  {
    v4 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", CFSTR("∞"), 0, self, sel_didSelectFullLibraryButton_);
    v5 = self->_fullLibraryButton;
    self->_fullLibraryButton = v4;

    fullLibraryButton = self->_fullLibraryButton;
  }
  return fullLibraryButton;
}

- (id)dateButton
{
  UIBarButtonItem *dateButton;
  UIBarButtonItem *v4;
  UIBarButtonItem *v5;

  dateButton = self->_dateButton;
  if (!dateButton)
  {
    v4 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", &stru_1E5149688, 0, self, sel_didSelectDateButton_);
    v5 = self->_dateButton;
    self->_dateButton = v4;

    dateButton = self->_dateButton;
  }
  return dateButton;
}

- (id)showInvalidItemsButton
{
  UIBarButtonItem *showInvalidItemsButton;
  UIBarButtonItem *v4;
  UIBarButtonItem *v5;

  showInvalidItemsButton = self->_showInvalidItemsButton;
  if (!showInvalidItemsButton)
  {
    v4 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", CFSTR("💊"), 0, self, sel_didSelectShowInvalidItemsButton_);
    v5 = self->_showInvalidItemsButton;
    self->_showInvalidItemsButton = v4;

    showInvalidItemsButton = self->_showInvalidItemsButton;
  }
  return showInvalidItemsButton;
}

- (id)sortButton
{
  UIBarButtonItem *sortButton;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIBarButtonItem *v9;
  UIBarButtonItem *v10;
  CGSize v12;

  sortButton = self->_sortButton;
  if (!sortButton)
  {
    v12.width = 22.0;
    v12.height = 22.0;
    UIGraphicsBeginImageContextWithOptions(v12, 0, 0.0);
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithOvalInRect:", 0.5, 0.5, 21.0, 21.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stroke");

    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRect:", 6.0, 7.0, 10.0, 1.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fill");

    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRect:", 7.0, 11.0, 8.0, 1.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fill");

    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRect:", 8.0, 15.0, 6.0, 1.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fill");

    UIGraphicsGetImageFromCurrentImageContext();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    v9 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithImage:style:target:action:", v8, 0, self, sel_didSelectSortButton_);
    v10 = self->_sortButton;
    self->_sortButton = v9;

    sortButton = self->_sortButton;
  }
  return sortButton;
}

- (void)_updateToolbarItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[8];

  v11[7] = *MEMORY[0x1E0C80C00];
  -[PXSuggesterDebugViewController fullLibraryButton](self, "fullLibraryButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  -[PXSuggesterDebugViewController dateButton](self, "dateButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  -[PXSuggesterDebugViewController showInvalidItemsButton](self, "showInvalidItemsButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  -[PXSuggesterDebugViewController sortButton](self, "sortButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v11[1] = v4;
  v11[2] = v5;
  v11[3] = v6;
  v11[4] = v7;
  v11[5] = v8;
  v11[6] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSuggesterDebugViewController setToolbarItems:](self, "setToolbarItems:", v10);

}

- (void)didSelectFullLibraryButton:(id)a3
{
  _BOOL4 fullLibraryIsEnabled;
  void *v5;
  _QWORD block[5];

  fullLibraryIsEnabled = self->_fullLibraryIsEnabled;
  self->_fullLibraryIsEnabled = !fullLibraryIsEnabled;
  if (fullLibraryIsEnabled)
  {
    -[UIBarButtonItem setTintColor:](self->_fullLibraryButton, "setTintColor:", 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "redColor", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setTintColor:](self->_fullLibraryButton, "setTintColor:", v5);

  }
  -[PXSuggesterDebugViewController willStartProcessing](self, "willStartProcessing");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__PXSuggesterDebugViewController_didSelectFullLibraryButton___block_invoke;
  block[3] = &unk_1E5149198;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)didSelectDateButton:(id)a3
{
  void *v4;
  PXContextualMemoriesSettingsTableViewController *v5;

  v5 = objc_alloc_init(PXContextualMemoriesSettingsTableViewController);
  -[PXSuggesterDebugViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pushViewController:animated:", v5, 1);

}

- (void)didSelectShowInvalidItemsButton:(id)a3
{
  self->_showsInvalidItems ^= 1u;
  -[PXSuggesterDebugViewController updateShowInvalidItemsButton](self, "updateShowInvalidItemsButton", a3);
  -[PXSuggesterDebugViewController _sortItems](self, "_sortItems");
  -[PXSuggesterDebugViewController refresh](self, "refresh");
}

- (void)updateShowInvalidItemsButton
{
  const __CFString *v2;

  if (self->_showsInvalidItems)
    v2 = CFSTR("🚥");
  else
    v2 = CFSTR("✅");
  -[UIBarButtonItem setTitle:](self->_showInvalidItemsButton, "setTitle:", v2);
}

- (void)didSelectSortButton:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[6];

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Sort Criteria"), 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "popoverPresentationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBarButtonItem:", v4);

  v7 = 0;
  v8 = 1;
  do
  {
    v9 = v8;
    -[PXSuggesterDebugViewController _stringWithSortCriteria:](self, "_stringWithSortCriteria:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __54__PXSuggesterDebugViewController_didSelectSortButton___block_invoke;
    v14[3] = &unk_1E5122D98;
    v14[4] = self;
    v14[5] = v7;
    objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v10, 0, v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v7 == self->_currentSortCriteria)
      objc_msgSend(v11, "_setChecked:", 1);
    objc_msgSend(v5, "addAction:", v12);

    v8 = 0;
    v7 = 1;
  }
  while ((v9 & 1) != 0);
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v13);

  -[PXSuggesterDebugViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
}

- (void)_sortItems
{
  NSArray *v3;
  void *v4;
  uint64_t v5;
  unint64_t currentSortCriteria;
  void *v7;
  void *v8;
  NSArray *v9;
  NSArray *sortedItems;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = self->_heuristicallySortedItems;
  if (!self->_showsInvalidItems)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_54792);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray filteredArrayUsingPredicate:](v3, "filteredArrayUsingPredicate:", v4);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (NSArray *)v5;
  }
  currentSortCriteria = self->_currentSortCriteria;
  if (currentSortCriteria == 1)
  {
    objc_storeStrong((id *)&self->_sortedItems, v3);
  }
  else if (!currentSortCriteria)
  {
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("date"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray sortedArrayUsingDescriptors:](v3, "sortedArrayUsingDescriptors:", v8);
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    sortedItems = self->_sortedItems;
    self->_sortedItems = v9;

  }
}

- (id)_stringWithSortCriteria:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Unknown");
  if (a3 == 1)
    v3 = CFSTR("Score");
  if (a3)
    return (id)v3;
  else
    return CFSTR("Date");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortButton, 0);
  objc_storeStrong((id *)&self->_showInvalidItemsButton, 0);
  objc_storeStrong((id *)&self->_dateButton, 0);
  objc_storeStrong((id *)&self->_fullLibraryButton, 0);
  objc_storeStrong((id *)&self->_noResultLabel, 0);
  objc_storeStrong((id *)&self->_spinnerView, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_currentSuggestion, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_sortedItems, 0);
  objc_storeStrong((id *)&self->_heuristicallySortedItems, 0);
}

uint64_t __44__PXSuggesterDebugViewController__sortItems__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isInvalid") ^ 1;
}

uint64_t __54__PXSuggesterDebugViewController_didSelectSortButton___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1072) = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_sortItems");
  return objc_msgSend(*(id *)(a1 + 32), "refresh");
}

uint64_t __61__PXSuggesterDebugViewController_didSelectFullLibraryButton___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_fetchSuggestions");
  return objc_msgSend(*(id *)(a1 + 32), "didStopProcessing");
}

id __92__PXSuggesterDebugViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "cellForRowAtIndexPath:", *(_QWORD *)(a1 + 40));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0DC39D0];
  v3 = (void *)MEMORY[0x1E0DC3428];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __92__PXSuggesterDebugViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_2;
  v9[3] = &unk_1E513C038;
  v10 = v1;
  v4 = v1;
  objc_msgSend(v3, "actionWithTitle:image:identifier:handler:", CFSTR("Persist"), 0, 0, v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "menuWithChildren:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __92__PXSuggesterDebugViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "persist:", 0);
}

void __49__PXSuggesterDebugViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__PXSuggesterDebugViewController_viewWillAppear___block_invoke_2;
  v6[3] = &unk_1E5148D08;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __49__PXSuggesterDebugViewController_viewWillAppear___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(v3 + 1024)
    && (*(void **)(v3 + 1064) == v2
     || (v4 = objc_msgSend(*(id *)(v3 + 1064), "isEqualToDate:", v2), v3 = *(_QWORD *)(a1 + 40), (v4 & 1) != 0)))
  {
    objc_msgSend((id)v3, "didStopProcessing");
  }
  else
  {
    objc_storeStrong((id *)(v3 + 1064), v2);
    objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1064), 1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1112), "setTitle:", v5);

    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(void **)(v6 + 1024);
    *(_QWORD *)(v6 + 1024) = MEMORY[0x1E0C9AA60];

    objc_msgSend(*(id *)(a1 + 40), "refresh");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__PXSuggesterDebugViewController_viewWillAppear___block_invoke_3;
    block[3] = &unk_1E5149198;
    block[4] = *(_QWORD *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

uint64_t __49__PXSuggesterDebugViewController_viewWillAppear___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_fetchSuggestions");
  return objc_msgSend(*(id *)(a1 + 32), "didStopProcessing");
}

@end
