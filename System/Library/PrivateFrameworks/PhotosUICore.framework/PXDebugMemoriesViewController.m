@implementation PXDebugMemoriesViewController

- (id)_debugDictionary
{
  return &unk_1E53F0BD8;
}

- (PXDebugMemoriesViewController)initWithMemory:(id)a3 memoryInfo:(id)a4
{
  id v6;
  PXDebugMemoriesViewController *v7;
  PXDebugMemoriesViewController *v8;
  id *p_sourceMemory;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSDictionary *sourceDictionary;
  objc_super v17;

  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PXDebugMemoriesViewController;
  v7 = -[PXDebugMemoriesViewController init](&v17, sel_init);
  v8 = v7;
  if (v7)
  {
    -[PXDebugMemoriesViewController setTitle:](v7, "setTitle:", CFSTR("Memory Debug"));
    p_sourceMemory = (id *)&v8->_sourceMemory;
    objc_storeStrong((id *)&v8->_sourceMemory, a3);
    objc_msgSend(v6, "photosGraphProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      -[PXDebugMemoriesViewController _debugDictionary](v8, "_debugDictionary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(*p_sourceMemory, "localIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (unsigned __int16)objc_msgSend(*p_sourceMemory, "photosGraphVersion");
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXMemoriesRelatedDiagnosticsHelper preprocessDictionary:forMemoryWithLocalIdentifier:algorithmsVersion:inPhotoLibrary:](PXMemoriesRelatedDiagnosticsHelper, "preprocessDictionary:forMemoryWithLocalIdentifier:algorithmsVersion:inPhotoLibrary:", v10, v11, v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    sourceDictionary = v8->_sourceDictionary;
    v8->_sourceDictionary = (NSDictionary *)v14;

  }
  return v8;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  UISegmentedControl *v6;
  UISegmentedControl *segmentedControl;
  void *v8;
  id v9;
  void *v10;
  void *v11;
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
  id v23;
  UITableView *v24;
  UITableView *tableView;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)PXDebugMemoriesViewController;
  -[PXDebugMemoriesViewController viewDidLoad](&v30, sel_viewDidLoad);
  -[PXDebugMemoriesViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAutoresizingMask:", 18);

  -[PXDebugMemoriesViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

  v6 = (UISegmentedControl *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C58]), "initWithItems:", &unk_1E53E9618);
  segmentedControl = self->_segmentedControl;
  self->_segmentedControl = v6;

  -[UISegmentedControl addTarget:action:forControlEvents:](self->_segmentedControl, "addTarget:action:forControlEvents:", self, sel__switchLogsAction_, 4096);
  -[UISegmentedControl setSelectedSegmentIndex:](self->_segmentedControl, "setSelectedSegmentIndex:", 0);
  -[PXDebugMemoriesViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", self->_segmentedControl);

  v9 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  -[PXDebugMemoriesViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", v9);

  -[UISegmentedControl setTranslatesAutoresizingMaskIntoConstraints:](self->_segmentedControl, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UISegmentedControl topAnchor](self->_segmentedControl, "topAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXDebugMemoriesViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "safeAreaLayoutGuide");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "topAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:constant:", v14, 10.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setActive:", 1);

  _NSDictionaryOfVariableBindings(CFSTR("_segmentedControl, contentView"), self->_segmentedControl, v9, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXDebugMemoriesViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[_segmentedControl(<=44)]-10-[contentView]-0-|"), 0, 0, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addConstraints:", v18);

  -[PXDebugMemoriesViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[_segmentedControl]-|"), 0, 0, v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addConstraints:", v20);

  -[PXDebugMemoriesViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[contentView]|"), 0, 0, v16);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addConstraints:", v22);

  v23 = objc_alloc(MEMORY[0x1E0DC3D48]);
  objc_msgSend(v9, "frame");
  v24 = (UITableView *)objc_msgSend(v23, "initWithFrame:style:", 1);
  tableView = self->_tableView;
  self->_tableView = v24;

  -[UITableView setAutoresizingMask:](self->_tableView, "setAutoresizingMask:", 18);
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
  -[UITableView setAllowsSelection:](self->_tableView, "setAllowsSelection:", 0);
  objc_msgSend(v9, "addSubview:", self->_tableView);
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", CFSTR("Close"), 2, self, sel__closeAction_);
  -[PXDebugMemoriesViewController navigationItem](self, "navigationItem");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setLeftBarButtonItem:", v26);

  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 7, self, sel__sendByEmailAction_);
  -[PXDebugMemoriesViewController navigationItem](self, "navigationItem");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setRightBarButtonItem:", v28);

  -[PXDebugMemoriesViewController _switchLogsAction:](self, "_switchLogsAction:", 0);
}

- (void)_switchLogsAction:(id)a3
{
  NSInteger v4;
  NSArray *v5;
  NSDictionary *v6;
  NSArray *sectionTitles;
  NSArray *v8;
  NSDictionary *tableContent;
  NSDictionary *v10;
  id v11;
  id v12;

  v4 = -[UISegmentedControl selectedSegmentIndex](self->_segmentedControl, "selectedSegmentIndex", a3);
  v11 = 0;
  v12 = 0;
  +[PXMemoriesRelatedDiagnosticsHelper generateSectionTitles:andTableContent:forIndex:sourceMemory:sourceDictionary:](PXMemoriesRelatedDiagnosticsHelper, "generateSectionTitles:andTableContent:forIndex:sourceMemory:sourceDictionary:", &v12, &v11, v4, self->_sourceMemory, self->_sourceDictionary);
  v5 = (NSArray *)v12;
  v6 = (NSDictionary *)v11;
  sectionTitles = self->_sectionTitles;
  self->_sectionTitles = v5;
  v8 = v5;

  tableContent = self->_tableContent;
  self->_tableContent = v6;
  v10 = v6;

  -[UITableView reloadData](self->_tableView, "reloadData");
}

- (void)_sendByEmailAction:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  NSObject *v15;
  id v16;
  uint8_t buf[4];
  __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(getMFMailComposeViewControllerClass_102568(), "canSendMail"))
  {
    -[PXDebugMemoriesViewController title](self, "title");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("PhotosGraph "), "stringByAppendingString:", v4);
    v5 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("photos-memories-feedback@group.apple.com"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init((Class)getMFMailComposeViewControllerClass_102568());
    objc_msgSend(v7, "setMailComposeDelegate:", self);
    objc_msgSend(v7, "setSubject:", v5);
    objc_msgSend(v7, "setToRecipients:", v6);
    +[PXMemoriesRelatedDiagnosticsHelper getSummaryFromProviderItem:](PXMemoriesRelatedDiagnosticsHelper, "getSummaryFromProviderItem:", self->_sourceMemory);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v16 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v8, 200, 0, &v16);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v16;
      if (v9)
        objc_msgSend(v7, "addAttachmentData:mimeType:fileName:", v9, CFSTR("application/x-plist"), CFSTR("results.plist"));
      if (v10)
      {
        v11 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v10, "localizedDescription");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", CFSTR("Cannot attach results.plist: %@."), v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = v13;
        PLUIGetLog();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v18 = v14;
          _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_DEFAULT, "ERROR: %@", buf, 0xCu);
        }

        goto LABEL_13;
      }
    }
    else
    {
      v9 = 0;
      v10 = 0;
    }
    v14 = &stru_1E5149688;
LABEL_13:
    objc_msgSend(v7, "setMessageBody:isHTML:", v14, 0);
    -[PXDebugMemoriesViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);

    goto LABEL_14;
  }
  PLUIGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "ERROR: Looks like email is not setup on this system.", buf, 2u);
  }
LABEL_14:

}

- (void)_closeAction:(id)a3
{
  -[PXDebugMemoriesViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5
{
  -[PXDebugMemoriesViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0, a5);
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

  -[PXDebugMemoriesViewController tableView:titleForHeaderInSection:](self, "tableView:titleForHeaderInSection:", a3, a4);
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
  void *v21;
  void *v22;
  void *v23;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", CFSTR("KeywordsCell"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 3, CFSTR("KeywordsCell"));
  -[PXDebugMemoriesViewController tableView:titleForHeaderInSection:](self, "tableView:titleForHeaderInSection:", v7, objc_msgSend(v6, "section"));
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

  objc_msgSend(v8, "textLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 13.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFont:", v21);

  objc_msgSend(v8, "textLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setNumberOfLines:", 0);

  objc_msgSend(v8, "textLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "sizeToFit");

  return v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return -[NSArray objectAtIndexedSubscript:](self->_sectionTitles, "objectAtIndexedSubscript:", a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceMemory, 0);
  objc_storeStrong((id *)&self->_sourceDictionary, 0);
  objc_storeStrong((id *)&self->_tableContent, 0);
  objc_storeStrong((id *)&self->_sectionTitles, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
}

@end
