@implementation PXExistingSuggestionsDebugViewController

- (PXExistingSuggestionsDebugViewController)initWithName:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  PXExistingSuggestionsDebugViewController *v9;
  PXExistingSuggestionsDebugViewController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXExistingSuggestionsDebugViewController;
  v9 = -[PXExistingSuggestionsDebugViewController init](&v12, sel_init);
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
  void *v3;
  void *v4;
  const __CFString *name;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXExistingSuggestionsDebugViewController;
  -[PXExistingSuggestionsDebugViewController viewDidLoad](&v7, sel_viewDidLoad);
  -[PXExistingSuggestionsDebugViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_name)
    name = (const __CFString *)self->_name;
  else
    name = CFSTR("Existing Suggestions");
  objc_msgSend(v3, "setTitle:", name);

  -[PXExistingSuggestionsDebugViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEstimatedRowHeight:", 44.0);

  -[PXExistingSuggestionsDebugViewController _fetchExistingSuggestions](self, "_fetchExistingSuggestions");
}

- (id)assetsDataSourceManagerForSuggestion:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PXPhotosDataSourceConfiguration *v10;
  PXPhotosDataSource *v11;
  PXPhotoKitAssetsDataSourceManager *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyAssetsInAssetCollection:options:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchedObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssets:title:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CD14E0];
  v14[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transientCollectionListWithCollections:title:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD14D8], "fetchCollectionsInCollectionList:options:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PXPhotosDataSourceConfiguration initWithCollectionListFetchResult:options:]([PXPhotosDataSourceConfiguration alloc], "initWithCollectionListFetchResult:options:", v9, 4);
  v11 = -[PXPhotosDataSource initWithPhotosDataSourceConfiguration:]([PXPhotosDataSource alloc], "initWithPhotosDataSourceConfiguration:", v10);
  v12 = -[PXPhotoKitAssetsDataSourceManager initWithPhotosDataSource:]([PXPhotoKitAssetsDataSourceManager alloc], "initWithPhotosDataSource:", v11);

  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  NSArray *sectionNames;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  sectionNames = self->_sectionNames;
  v6 = a4;
  -[NSArray objectAtIndexedSubscript:](sectionNames, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_itemsBySectionName, "objectForKeyedSubscript:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "row");

  objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "suggestion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_storeStrong((id *)&self->_currentSuggestion, v10);
    -[UIViewController px_enableOneUpPresentation](self, "px_enableOneUpPresentation");
    -[UIViewController px_oneUpPresentation](self, "px_oneUpPresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDelegate:", self);
    objc_msgSend(v11, "startWithConfigurationHandler:", 0);

  }
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  NSArray *sectionNames;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;

  sectionNames = self->_sectionNames;
  v6 = a4;
  -[NSArray objectAtIndexedSubscript:](sectionNames, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_itemsBySectionName, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "row");

  objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "description");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "rangeOfString:", CFSTR("\n"));

  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    v13 = 44.0;
  else
    v13 = 66.0;

  return v13;
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  NSArray *sectionNames;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  PXSuggestionDebugViewController *v12;
  void *v13;
  id v14;

  sectionNames = self->_sectionNames;
  v6 = a4;
  -[NSArray objectAtIndexedSubscript:](sectionNames, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_itemsBySectionName, "objectForKeyedSubscript:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "row");

  objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "suggestion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (id)objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyCuratedAssetInAssetCollection:referenceAsset:", v10, 0);
    v12 = -[PXSuggestionDebugViewController initWithSuggestion:suggestionInfo:]([PXSuggestionDebugViewController alloc], "initWithSuggestion:suggestionInfo:", v10, 0);
    -[PXExistingSuggestionsDebugViewController navigationController](self, "navigationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "px_presentViewControllerInNavigationController:animated:dimissButtonLocation:completion:", v12, 1, 0, 0);

  }
}

- (BOOL)tableView:(id)a3 shouldShowMenuForRowAtIndexPath:(id)a4
{
  return 1;
}

- (BOOL)tableView:(id)a3 canPerformAction:(SEL)a4 forRowAtIndexPath:(id)a5 withSender:(id)a6
{
  return 0;
}

- (int64_t)oneUpPresentationOrigin:(id)a3
{
  return 0;
}

- (id)oneUpPresentationDataSourceManager:(id)a3
{
  return -[PXExistingSuggestionsDebugViewController assetsDataSourceManagerForSuggestion:](self, "assetsDataSourceManagerForSuggestion:", self->_currentSuggestion);
}

- (id)oneUpPresentationMediaProvider:(id)a3
{
  return objc_alloc_init(PXPhotoKitUIMediaProvider);
}

- (id)oneUpPresentationInitialAssetReference:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[PXExistingSuggestionsDebugViewController oneUpPresentationDataSourceManager:](self, "oneUpPresentationDataSourceManager:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startingAssetReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[NSArray count](self->_sectionNames, "count", a3);
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return -[NSArray objectAtIndexedSubscript:](self->_sectionNames, "objectAtIndexedSubscript:", a4);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  int64_t v7;

  -[NSArray objectAtIndexedSubscript:](self->_sectionNames, "objectAtIndexedSubscript:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_itemsBySectionName, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  PXExistingSuggestionsDebugViewCell *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("ExistingSuggestionsDebugTableViewCellIdentifier"));
  v7 = (PXExistingSuggestionsDebugViewCell *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = -[PXExistingSuggestionsDebugViewCell initWithStyle:reuseIdentifier:]([PXExistingSuggestionsDebugViewCell alloc], "initWithStyle:reuseIdentifier:", 3, CFSTR("ExistingSuggestionsDebugTableViewCellIdentifier"));
    -[PXExistingSuggestionsDebugViewCell detailTextLabel](v7, "detailTextLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNumberOfLines:", 2);

    -[PXExistingSuggestionsDebugViewCell detailTextLabel](v7, "detailTextLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLineBreakMode:", 0);

  }
  -[NSArray objectAtIndexedSubscript:](self->_sectionNames, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_itemsBySectionName, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v6, "row");

  objc_msgSend(v11, "objectAtIndexedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXExistingSuggestionsDebugViewController configureCell:withItem:](self, "configureCell:withItem:", v7, v13);
  return v7;
}

- (void)configureCell:(id)a3 withItem:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v5 = a4;
  objc_msgSend(v5, "suggestion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setSuggestion:", v6);
  switch(objc_msgSend(v6, "state"))
  {
    case 0u:
      objc_msgSend(MEMORY[0x1E0DC3658], "blueColor");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 1u:
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 2u:
      objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 3u:
      objc_msgSend(MEMORY[0x1E0DC3658], "greenColor");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 4u:
      objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v8 = (void *)v7;
      break;
    default:
      v8 = 0;
      break;
  }
  objc_msgSend(v15, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_1E5149688);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setText:", v11);
  objc_msgSend(v9, "setTextColor:", v8);
  objc_msgSend(v15, "detailTextLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v13);

  objc_msgSend(v12, "setTextColor:", v8);
  objc_msgSend(v12, "sizeToFit");
  objc_msgSend(v5, "suggestion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setAccessoryType:", 4 * (v14 != 0));
}

- (void)_fetchExistingSuggestions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  PXExistingSuggestionsDebugCollectionItem *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  NSArray *sectionNames;
  NSDictionary *itemsBySectionName;
  NSDictionary *v27;
  void *v28;
  PXExistingSuggestionsDebugViewController *v29;
  void *v30;
  id obj;
  NSDictionary *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _QWORD v38[4];

  v38[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "librarySpecificFetchOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v5;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSortDescriptors:", v7);

  objc_msgSend(MEMORY[0x1E0CD17D0], "fetchSuggestionsWithOptions:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    v29 = self;
    v30 = v4;
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v32 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    obj = v8;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    v28 = v8;
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v13 = 0;
      v14 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v34 != v14)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          v17 = -[PXExistingSuggestionsDebugCollectionItem initWithSuggestion:]([PXExistingSuggestionsDebugCollectionItem alloc], "initWithSuggestion:", v16);
          objc_msgSend(v16, "creationDate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", v18, 1, 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19;
          if (!v13 || (objc_msgSend(v19, "isEqualToString:", v12) & 1) == 0)
          {
            v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);

            v22 = v20;
            objc_msgSend(v9, "addObject:", v22);
            -[NSDictionary setObject:forKeyedSubscript:](v32, "setObject:forKeyedSubscript:", v21, v22);
            v12 = v22;
            v13 = v21;
          }
          objc_msgSend(v13, "addObject:", v17);

        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v11);
    }
    else
    {
      v12 = 0;
      v13 = 0;
    }

    objc_msgSend(v9, "reverseObjectEnumerator");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "allObjects");
    v24 = objc_claimAutoreleasedReturnValue();
    sectionNames = v29->_sectionNames;
    v29->_sectionNames = (NSArray *)v24;

    itemsBySectionName = v29->_itemsBySectionName;
    v29->_itemsBySectionName = v32;
    v27 = v32;

    v4 = v30;
    v8 = v28;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSuggestion, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_itemsBySectionName, 0);
  objc_storeStrong((id *)&self->_sectionNames, 0);
}

@end
