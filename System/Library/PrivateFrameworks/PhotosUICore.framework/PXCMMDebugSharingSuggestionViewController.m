@implementation PXCMMDebugSharingSuggestionViewController

- (PXCMMDebugSharingSuggestionViewController)initWithSharingSuggestion:(id)a3
{
  id v5;
  PXCMMDebugSharingSuggestionViewController *v6;
  PXCMMDebugSharingSuggestionViewController *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSDictionary *sourceDictionary;
  NSObject *v13;
  uint64_t v14;
  NSDictionary *v15;
  id v17;
  objc_super v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PXCMMDebugSharingSuggestionViewController;
  v6 = -[PXCMMDebugSharingSuggestionViewController init](&v18, sel_init);
  v7 = v6;
  if (v6)
  {
    -[PXCMMDebugSharingSuggestionViewController setTitle:](v6, "setTitle:", CFSTR("Suggestion Debug"));
    objc_storeStrong((id *)&v7->_sourceSuggestion, a3);
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    objc_msgSend(v8, "sharingSuggestionDebugInformationForAssetCollectionLocalIdentifier:error:", v9, &v17);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v17;
    sourceDictionary = v7->_sourceDictionary;
    v7->_sourceDictionary = (NSDictionary *)v10;

    if (!v7->_sourceDictionary)
    {
      PLSharingGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v5;
        _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_DEFAULT, "Failed to retrieve debug information for asset collection %@", buf, 0xCu);
      }

      -[PXCMMDebugSharingSuggestionViewController _debugDictionary](v7, "_debugDictionary");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v7->_sourceDictionary;
      v7->_sourceDictionary = (NSDictionary *)v14;

    }
  }

  return v7;
}

- (id)_debugDictionary
{
  return &unk_1E53F1088;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)PXCMMDebugSharingSuggestionViewController;
  -[PXCMMDebugSharingSuggestionViewController viewDidLoad](&v21, sel_viewDidLoad);
  -[PXCMMDebugSharingSuggestionViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAutoresizingMask:", 18);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C58]), "initWithItems:", &unk_1E53EAC98);
  objc_msgSend(v5, "addTarget:action:forControlEvents:", self, sel__switchLogsAction_, 4096);
  objc_msgSend(v5, "setSelectedSegmentIndex:", 0);
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PXCMMDebugSharingSuggestionViewController setSegmentedControl:](self, "setSegmentedControl:", v5);
  objc_msgSend(v3, "addSubview:", v5);
  v6 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "addSubview:", v6);
  objc_msgSend(v5, "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaLayoutGuide");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:constant:", v9, 10.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setActive:", 1);

  _NSDictionaryOfVariableBindings(CFSTR("segmentedControl, contentView"), v5, v6, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[segmentedControl(<=44)]-10-[contentView]-0-|"), 0, 0, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addConstraints:", v12);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[segmentedControl]-|"), 0, 0, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addConstraints:", v13);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[contentView]|"), 0, 0, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addConstraints:", v14);

  v15 = objc_alloc(MEMORY[0x1E0DC3D48]);
  objc_msgSend(v6, "frame");
  v16 = (void *)objc_msgSend(v15, "initWithFrame:style:", 1);
  objc_msgSend(v16, "setAutoresizingMask:", 18);
  objc_msgSend(v16, "setDataSource:", self);
  objc_msgSend(v16, "setAllowsSelection:", 0);
  objc_msgSend(v6, "addSubview:", v16);
  -[PXCMMDebugSharingSuggestionViewController setTableView:](self, "setTableView:", v16);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", CFSTR("Close"), 2, self, sel__closeAction_);
  -[PXCMMDebugSharingSuggestionViewController navigationItem](self, "navigationItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setLeftBarButtonItem:", v17);

  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 7, self, sel__sendByEmailAction_);
  -[PXCMMDebugSharingSuggestionViewController navigationItem](self, "navigationItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setRightBarButtonItem:", v19);

  -[PXCMMDebugSharingSuggestionViewController _switchLogsAction:](self, "_switchLogsAction:", 0);
}

- (void)_switchLogsAction:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  NSArray *v7;
  NSDictionary *v8;
  NSArray *sectionTitles;
  NSArray *v10;
  NSDictionary *tableContent;
  void *v12;
  id v13;
  id v14;

  -[PXCMMDebugSharingSuggestionViewController segmentedControl](self, "segmentedControl", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "selectedSegmentIndex");

  v13 = 0;
  v14 = 0;
  -[PXCMMDebugSharingSuggestionViewController sourceSuggestion](self, "sourceSuggestion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXCMMDebugSharingSuggestionViewController generateSectionTitles:andTableContent:forIndex:sourceSuggestion:sourceDictionary:](PXCMMDebugSharingSuggestionViewController, "generateSectionTitles:andTableContent:forIndex:sourceSuggestion:sourceDictionary:", &v14, &v13, v5, v6, self->_sourceDictionary);
  v7 = (NSArray *)v14;
  v8 = (NSDictionary *)v13;

  sectionTitles = self->_sectionTitles;
  self->_sectionTitles = v7;
  v10 = v7;

  tableContent = self->_tableContent;
  self->_tableContent = v8;

  -[PXCMMDebugSharingSuggestionViewController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "reloadData");

}

- (void)_sendByEmailAction:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  NSDictionary *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  __CFString *v13;
  NSObject *v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(getMFMailComposeViewControllerClass_298449(), "canSendMail"))
  {
    -[PXCMMDebugSharingSuggestionViewController title](self, "title");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("PhotosGraph "), "stringByAppendingString:", v4);
    v5 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("photos-memories-feedback@group.apple.com"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init((Class)getMFMailComposeViewControllerClass_298449());
    objc_msgSend(v7, "setMailComposeDelegate:", self);
    objc_msgSend(v7, "setSubject:", v5);
    objc_msgSend(v7, "setToRecipients:", v6);
    v8 = self->_sourceDictionary;
    if (v8)
    {
      v15 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v8, 200, 0, &v15);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v15;
      if (v9)
        objc_msgSend(v7, "addAttachmentData:mimeType:fileName:", v9, CFSTR("application/x-plist"), CFSTR("results.plist"));
      if (v10)
      {
        v11 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v10, "localizedDescription");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", CFSTR("Cannot attach results.plist: %@."), v12);
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

        PLSharingGetLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v17 = v10;
          _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_ERROR, "Failed to attach results: %@", buf, 0xCu);
        }

        goto LABEL_13;
      }
    }
    else
    {
      v9 = 0;
      v10 = 0;
    }
    v13 = &stru_1E5149688;
LABEL_13:
    objc_msgSend(v7, "setMessageBody:isHTML:", v13, 0);
    -[PXCMMDebugSharingSuggestionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);

    goto LABEL_14;
  }
  PLSharingGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "Diagnostics: Looks like email is not setup on this system.", buf, 2u);
  }
LABEL_14:

}

- (void)_closeAction:(id)a3
{
  -[PXCMMDebugSharingSuggestionViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5
{
  -[PXCMMDebugSharingSuggestionViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0, a5);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[NSArray count](self->_sectionTitles, "count", a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  int64_t v7;

  -[PXCMMDebugSharingSuggestionViewController tableView:titleForHeaderInSection:](self, "tableView:titleForHeaderInSection:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_tableContent, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", CFSTR("KeywordsCell"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 3, CFSTR("KeywordsCell"));
  -[PXCMMDebugSharingSuggestionViewController tableView:titleForHeaderInSection:](self, "tableView:titleForHeaderInSection:", v7, objc_msgSend(v6, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSDictionary objectForKeyedSubscript:](self->_tableContent, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "row");

  objc_msgSend(v10, "objectAtIndexedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "lowercaseString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v13, "isEqualToString:", CFSTR("location"));

  if ((_DWORD)v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = v12;
      if ((unint64_t)objc_msgSend(v14, "count") < 2)
      {
        v18 = CFSTR("Invalid location");
      }
      else
      {
        v15 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
        v16 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringWithFormat:", CFSTR("(%@, %@)"), v16, v17);
        v18 = (const __CFString *)objc_claimAutoreleasedReturnValue();

        v14 = (id)v16;
      }

    }
    else
    {
      v18 = CFSTR("Invalid location");
    }

    v12 = (void *)v18;
  }
  objc_msgSend(v8, "textLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setText:", v12);
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 13.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFont:", v20);

  objc_msgSend(v19, "setNumberOfLines:", 0);
  objc_msgSend(v19, "sizeToFit");

  return v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return -[NSArray objectAtIndexedSubscript:](self->_sectionTitles, "objectAtIndexedSubscript:", a4);
}

- (UISegmentedControl)segmentedControl
{
  return self->_segmentedControl;
}

- (void)setSegmentedControl:(id)a3
{
  objc_storeStrong((id *)&self->_segmentedControl, a3);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (PHAssetCollection)sourceSuggestion
{
  return self->_sourceSuggestion;
}

- (void)setSourceSuggestion:(id)a3
{
  objc_storeStrong((id *)&self->_sourceSuggestion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceSuggestion, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_storeStrong((id *)&self->_sourceDictionary, 0);
  objc_storeStrong((id *)&self->_tableContent, 0);
  objc_storeStrong((id *)&self->_sectionTitles, 0);
}

+ (BOOL)generateSectionTitles:(id *)a3 andTableContent:(id *)a4 forIndex:(int64_t)a5 sourceSuggestion:(id)a6 sourceDictionary:(id)a7
{
  id v11;
  id v12;
  void *v13;
  BOOL v14;
  BOOL v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  _QWORD v27[4];
  id v28;
  id v29;
  _QWORD v30[4];
  void *v31;
  _QWORD v32[4];
  void *v33;
  const __CFString *v34;
  id v35;
  const __CFString *v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v11 = a6;
  v12 = a7;
  v13 = v12;
  if (a3)
    v14 = a4 == 0;
  else
    v14 = 1;
  v15 = !v14;
  if (!v14)
  {
    switch(a5)
    {
      case 2:
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("content"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_opt_new();
        v21 = (void *)objc_opt_new();
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __126__PXCMMDebugSharingSuggestionViewController_generateSectionTitles_andTableContent_forIndex_sourceSuggestion_sourceDictionary___block_invoke_3;
        v27[3] = &unk_1E51482B8;
        v28 = v20;
        v29 = v21;
        v22 = v21;
        v23 = v20;
        objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v27);
        v18 = objc_retainAutorelease(v23);
        *a3 = v18;
        v24 = objc_retainAutorelease(v22);
        *a4 = v24;

LABEL_15:
        break;
      case 1:
        v25 = (void *)objc_opt_new();
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("people"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __126__PXCMMDebugSharingSuggestionViewController_generateSectionTitles_andTableContent_forIndex_sourceSuggestion_sourceDictionary___block_invoke_2;
        v30[3] = &unk_1E5148268;
        v31 = v25;
        v18 = v25;
        objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v30);
        *a3 = &unk_1E53EACC8;
        v34 = &stru_1E5149688;
        v35 = v18;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        v19 = v31;
        goto LABEL_14;
      case 0:
        v16 = (void *)objc_opt_new();
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("info"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __126__PXCMMDebugSharingSuggestionViewController_generateSectionTitles_andTableContent_forIndex_sourceSuggestion_sourceDictionary___block_invoke;
        v32[3] = &unk_1E5148268;
        v33 = v16;
        v18 = v16;
        objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v32);
        *a3 = &unk_1E53EACB0;
        v36 = &stru_1E5149688;
        v37[0] = v18;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        v19 = v33;
LABEL_14:

        goto LABEL_15;
    }
  }

  return v15;
}

void __126__PXCMMDebugSharingSuggestionViewController_generateSectionTitles_andTableContent_forIndex_sourceSuggestion_sourceDictionary___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@] %@"), a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

void __126__PXCMMDebugSharingSuggestionViewController_generateSectionTitles_andTableContent_forIndex_sourceSuggestion_sourceDictionary___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ - Number of sources: %lu"), v5, objc_msgSend(v7, "count"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "addObject:");
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\t• %@"), *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@] %@"), v5, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v14);

  }
}

void __126__PXCMMDebugSharingSuggestionViewController_generateSectionTitles_andTableContent_forIndex_sourceSuggestion_sourceDictionary___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v9 = a3;
  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "addObject:", v6);
  v7 = (void *)objc_opt_new();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __126__PXCMMDebugSharingSuggestionViewController_generateSectionTitles_andTableContent_forIndex_sourceSuggestion_sourceDictionary___block_invoke_4;
  v10[3] = &unk_1E5148290;
  v11 = v7;
  v8 = v7;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v10);
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v8, v6);

}

uint64_t __126__PXCMMDebugSharingSuggestionViewController_generateSectionTitles_andTableContent_forIndex_sourceSuggestion_sourceDictionary___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

@end
