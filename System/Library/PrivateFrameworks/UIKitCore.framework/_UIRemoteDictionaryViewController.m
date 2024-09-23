@implementation _UIRemoteDictionaryViewController

- (_UIRemoteDictionaryViewController)initWithStyle:(int64_t)a3
{
  _UIRemoteDictionaryViewController *v3;
  uint64_t v4;
  _UIDictionaryManager *dictionaryAssetManager;
  uint64_t v6;
  NSArray *availableDictionaries;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIRemoteDictionaryViewController;
  v3 = -[UITableViewController initWithStyle:](&v9, sel_initWithStyle_, a3);
  if (v3)
  {
    +[_UIDictionaryManager assetManager](_UIDictionaryManager, "assetManager");
    v4 = objc_claimAutoreleasedReturnValue();
    dictionaryAssetManager = v3->_dictionaryAssetManager;
    v3->_dictionaryAssetManager = (_UIDictionaryManager *)v4;

    -[_UIDictionaryManager availableDefinitionDictionaries](v3->_dictionaryAssetManager, "availableDefinitionDictionaries");
    v6 = objc_claimAutoreleasedReturnValue();
    availableDictionaries = v3->_availableDictionaries;
    v3->_availableDictionaries = (NSArray *)v6;

  }
  return v3;
}

- (void)viewDidLoad
{
  _UIDictionaryManager *dictionaryAssetManager;
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIRemoteDictionaryViewController;
  -[UIViewController viewDidLoad](&v5, sel_viewDidLoad);
  objc_msgSend((id)UIApp, "_beginShowingNetworkActivityIndicator");
  dictionaryAssetManager = self->_dictionaryAssetManager;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48___UIRemoteDictionaryViewController_viewDidLoad__block_invoke;
  v4[3] = &unk_1E16B3FD8;
  v4[4] = self;
  -[_UIDictionaryManager _downloadDictionaryAssetCatalog:](dictionaryAssetManager, "_downloadDictionaryAssetCatalog:", v4);
}

- (id)_downloadButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  +[UIColor tintColor](UIColor, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  +[UIColor systemGrayColor](UIColor, "systemGrayColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIImageSymbolConfiguration configurationWithPaletteColors:](UIImageSymbolConfiguration, "configurationWithPaletteColors:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIButton buttonWithType:](UIButton, "buttonWithType:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPreferredSymbolConfiguration:forImageInState:", v6, 0);
  +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("icloud.and.arrow.down"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:forState:", v8, 0);

  objc_msgSend(v7, "addTarget:action:forControlEvents:", self, sel__handleDownloadButton_, 0x2000);
  objc_msgSend(v7, "sizeToFit");

  return v7;
}

- (void)_handleDownloadButton:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _UIRemoteDictionaryViewController *v9;

  objc_getAssociatedObject(a3, &_UIReferenceLibraryViewController_definitionDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rawAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "state");

  if (v6 == 1)
  {
    -[_UIRemoteDictionaryViewController _startDownloadForDictionary:](self, "_startDownloadForDictionary:", v4);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __59___UIRemoteDictionaryViewController__handleDownloadButton___block_invoke;
    v7[3] = &unk_1E16B1B50;
    v8 = v4;
    v9 = self;
    dispatch_async(MEMORY[0x1E0C80D38], v7);

  }
}

- (void)_startDownloadForDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSMutableDictionary *downloadingAssets;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _UIRemoteDictionaryViewController *v17;
  id v18;

  v4 = a3;
  objc_msgSend(v4, "rawAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_downloadingAssets)
  {
    v6 = (void *)objc_opt_new();
    -[_UIRemoteDictionaryViewController setDownloadingAssets:](self, "setDownloadingAssets:", v6);

  }
  objc_msgSend(v5, "assetId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  downloadingAssets = self->_downloadingAssets;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](downloadingAssets, "setObject:forKey:", v9, v7);

  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setAllowsCellularAccess:", 1);
  objc_msgSend(v10, "setAllowsExpensiveAccess:", 1);
  objc_msgSend(v10, "setDiscretionary:", 0);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65___UIRemoteDictionaryViewController__startDownloadForDictionary___block_invoke;
  v14[3] = &unk_1E16C12A8;
  v15 = v5;
  v16 = v4;
  v17 = self;
  v18 = v7;
  v11 = v7;
  v12 = v4;
  v13 = v5;
  objc_msgSend(v13, "startDownload:then:", v10, v14);

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_availableDictionaries, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  UITableViewCell *v7;
  void *v8;
  void *v9;
  NSArray *availableDictionaries;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  char isKindOfClass;
  void *v27;
  uint64_t v28;
  void *v29;
  NSMutableDictionary *downloadingAssets;
  void *v31;
  void *v32;
  _UICircleProgressIndicator *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  _QWORD v39[4];
  id v40;
  _QWORD block[4];
  id v42;
  _UIRemoteDictionaryViewController *v43;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("downloadable_dictionary_cell"));
  v7 = (UITableViewCell *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = -[UITableViewCell initWithStyle:reuseIdentifier:]([UITableViewCell alloc], "initWithStyle:reuseIdentifier:", 3, CFSTR("downloadable_dictionary_cell"));
  -[UITableViewCell textLabel](v7, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", 0);

  -[UITableViewCell detailTextLabel](v7, "detailTextLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", 0);

  availableDictionaries = self->_availableDictionaries;
  v11 = objc_msgSend(v6, "row");

  -[NSArray objectAtIndex:](availableDictionaries, "objectAtIndex:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rawAsset");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "attributes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", CFSTR("DictionaryPackageName"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqual:", CFSTR("Apple Dictionary.dictionary"));

  if (v16)
  {
    -[UITableViewCell textLabel](v7, "textLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    _UINSLocalizedStringWithDefaultValue(CFSTR("Apple Dictionary"), CFSTR("Apple Dictionary"));
    v18 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v14, "objectForKey:", CFSTR("DictionaryPackageName"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("TTY Abbreviations Dictionary.dictionary"));

    if (!v20)
    {
      -[UITableViewCell detailTextLabel](v7, "detailTextLabel");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedDictionaryName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setText:", v22);

    }
    -[UITableViewCell textLabel](v7, "textLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedLanguageName");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)v18;
  objc_msgSend(v17, "setText:", v18);

  v24 = objc_msgSend(v13, "state");
  if (v24 == 4)
  {
    -[UITableViewCell accessoryView](v7, "accessoryView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[UITableViewCell accessoryView](v7, "accessoryView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[UITableViewCell setAccessoryView:](v7, "setAccessoryView:", 0);
      v27 = 0;
    }
    if ((objc_msgSend(v12, "assetIsLocal") & 1) == 0)
    {
      downloadingAssets = self->_downloadingAssets;
      objc_msgSend(v13, "assetId");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](downloadingAssets, "objectForKeyedSubscript:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32)
      {
        if (v27)
        {
LABEL_17:
          v33 = v27;
          goto LABEL_28;
        }
      }
      else
      {
        -[_UIRemoteDictionaryViewController _startDownloadForDictionary:](self, "_startDownloadForDictionary:", v12);
        if (v27)
          goto LABEL_17;
      }
      v33 = -[_UICircleProgressIndicator initWithFrame:]([_UICircleProgressIndicator alloc], "initWithFrame:", 0.0, 0.0, 26.0, 26.0);
LABEL_28:
      v35 = v33;
      +[UIColor clearColor](UIColor, "clearColor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setBackgroundColor:", v36);

      if (!v27)
      {
        v39[0] = MEMORY[0x1E0C809B0];
        v39[1] = 3221225472;
        v39[2] = __69___UIRemoteDictionaryViewController_tableView_cellForRowAtIndexPath___block_invoke_2;
        v39[3] = &unk_1E16C12D0;
        v37 = v35;
        v40 = v37;
        objc_msgSend(v13, "attachProgressCallBack:", v39);
        objc_setAssociatedObject(v37, &_UIReferenceLibraryViewController_definitionDictionary, v12, (void *)1);
        -[UITableViewCell setAccessoryView:](v7, "setAccessoryView:", v37);

      }
      goto LABEL_30;
    }
  }
  else
  {
    v28 = v24;
    -[UITableViewCell setAccessoryView:](v7, "setAccessoryView:", 0);
    if (v28 == 1)
    {
      -[_UIRemoteDictionaryViewController _downloadButton](self, "_downloadButton");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_setAssociatedObject(v29, &_UIReferenceLibraryViewController_definitionDictionary, v12, (void *)1);
      -[UITableViewCell setAccessoryView:](v7, "setAccessoryView:", v29);

      v27 = 0;
      goto LABEL_31;
    }
    v27 = 0;
    if (!objc_msgSend(v12, "assetIsLocal"))
      goto LABEL_31;
  }
  objc_msgSend(v12, "assetToUpgrade");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    if (objc_msgSend(v12, "assetIsDeletable"))
      objc_msgSend(v13, "purgeSync");
    objc_msgSend(v12, "updateAsset");
    if ((objc_msgSend(v12, "assetIsLocal") & 1) == 0)
    {
      -[_UIRemoteDictionaryViewController _startDownloadForDictionary:](self, "_startDownloadForDictionary:", v12);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __69___UIRemoteDictionaryViewController_tableView_cellForRowAtIndexPath___block_invoke;
      block[3] = &unk_1E16B1B50;
      v42 = v12;
      v43 = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
  }
  else if ((objc_msgSend(v12, "activated") & 1) == 0)
  {
    -[_UIRemoteDictionaryViewController _downloadButton](self, "_downloadButton");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(v35, &_UIReferenceLibraryViewController_definitionDictionary, v12, (void *)1);
    -[UITableViewCell setAccessoryView:](v7, "setAccessoryView:", v35);
LABEL_30:

  }
LABEL_31:

  return v7;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;

  v7 = a3;
  v8 = a5;
  objc_msgSend(v7, "setEditing:animated:", 0, 1);
  -[NSArray objectAtIndex:](self->_availableDictionaries, "objectAtIndex:", objc_msgSend(v8, "row"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84___UIRemoteDictionaryViewController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke;
  block[3] = &unk_1E16B47A8;
  v14 = v9;
  v15 = v7;
  v16 = v8;
  v10 = v8;
  v11 = v7;
  v12 = v9;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  void *v4;
  char v5;

  -[NSArray objectAtIndex:](self->_availableDictionaries, "objectAtIndex:", objc_msgSend(a4, "row", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "assetIsDeletable");

  return v5;
}

- (_UIDictionaryManager)dictionaryAssetManager
{
  return self->_dictionaryAssetManager;
}

- (void)setDictionaryAssetManager:(id)a3
{
  objc_storeStrong((id *)&self->_dictionaryAssetManager, a3);
}

- (NSMutableDictionary)downloadingAssets
{
  return self->_downloadingAssets;
}

- (void)setDownloadingAssets:(id)a3
{
  objc_storeStrong((id *)&self->_downloadingAssets, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadingAssets, 0);
  objc_storeStrong((id *)&self->_dictionaryAssetManager, 0);
  objc_storeStrong((id *)&self->_availableDictionaries, 0);
}

@end
