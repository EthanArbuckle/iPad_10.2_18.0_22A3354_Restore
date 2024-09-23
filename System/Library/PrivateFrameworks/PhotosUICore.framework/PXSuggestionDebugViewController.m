@implementation PXSuggestionDebugViewController

- (PXSuggestionDebugViewController)initWithSuggestion:(id)a3 suggestionInfo:(id)a4
{
  id v7;
  id v8;
  PXSuggestionDebugViewController *v9;
  PXSuggestionDebugViewController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXSuggestionDebugViewController;
  v9 = -[PXSuggestionDebugViewController init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    -[PXSuggestionDebugViewController setTitle:](v9, "setTitle:", CFSTR("Suggestion Debug"));
    objc_storeStrong((id *)&v10->_suggestion, a3);
    objc_storeStrong((id *)&v10->_suggestionInfo, a4);
  }

  return v10;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  UISegmentedControl *v12;
  UISegmentedControl *segmentedControl;
  void *v14;
  id v15;
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
  id v29;
  UITableView *v30;
  UITableView *tableView;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  objc_super v36;
  _QWORD v37[3];

  v37[2] = *MEMORY[0x1E0C80C00];
  v36.receiver = self;
  v36.super_class = (Class)PXSuggestionDebugViewController;
  -[PXSuggestionDebugViewController viewDidLoad](&v36, sel_viewDidLoad);
  -[PXSuggestionDebugViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAutoresizingMask:", 18);

  -[PXSuggestionDebugViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

  -[NSDictionary objectForKeyedSubscript:](self->_suggestionInfo, "objectForKeyedSubscript:", CFSTR("identicalExistingSuggestionInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

    v7 = CFSTR("Nightly");
  }
  else
  {
    -[NSDictionary objectForKeyedSubscript:](self->_suggestionInfo, "objectForKeyedSubscript:", CFSTR("suggestionsByCollisionReason"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CFSTR("Colliding");
    if (v8)
      v9 = CFSTR("Colliding");
    else
      v9 = 0;
    v10 = v9;

    if (!v8)
    {
      v11 = &unk_1E53E8B20;
      goto LABEL_8;
    }
  }
  v37[0] = CFSTR("Info");
  v37[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
  v12 = (UISegmentedControl *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C58]), "initWithItems:", v11);
  segmentedControl = self->_segmentedControl;
  self->_segmentedControl = v12;

  -[UISegmentedControl addTarget:action:forControlEvents:](self->_segmentedControl, "addTarget:action:forControlEvents:", self, sel__switchLogsAction_, 4096);
  -[UISegmentedControl setSelectedSegmentIndex:](self->_segmentedControl, "setSelectedSegmentIndex:", 0);
  -[PXSuggestionDebugViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", self->_segmentedControl);

  v15 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  -[PXSuggestionDebugViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", v15);

  -[UISegmentedControl setTranslatesAutoresizingMaskIntoConstraints:](self->_segmentedControl, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UISegmentedControl topAnchor](self->_segmentedControl, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSuggestionDebugViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "safeAreaLayoutGuide");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:constant:", v20, 10.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setActive:", 1);

  _NSDictionaryOfVariableBindings(CFSTR("_segmentedControl, contentView"), self->_segmentedControl, v15, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSuggestionDebugViewController view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[_segmentedControl(<=44)]-10-[contentView]-0-|"), 0, 0, v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addConstraints:", v24);

  -[PXSuggestionDebugViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[_segmentedControl]-|"), 0, 0, v22);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addConstraints:", v26);

  -[PXSuggestionDebugViewController view](self, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[contentView]|"), 0, 0, v22);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addConstraints:", v28);

  v29 = objc_alloc(MEMORY[0x1E0DC3D48]);
  objc_msgSend(v15, "frame");
  v30 = (UITableView *)objc_msgSend(v29, "initWithFrame:style:", 1);
  tableView = self->_tableView;
  self->_tableView = v30;

  -[UITableView setAutoresizingMask:](self->_tableView, "setAutoresizingMask:", 18);
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
  -[UITableView setAllowsSelection:](self->_tableView, "setAllowsSelection:", 0);
  objc_msgSend(v15, "addSubview:", self->_tableView);
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", CFSTR("Close"), 2, self, sel__closeAction_);
  -[PXSuggestionDebugViewController navigationItem](self, "navigationItem");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setLeftBarButtonItem:", v32);

  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 7, self, sel__sendByEmailAction_);
  -[PXSuggestionDebugViewController navigationItem](self, "navigationItem");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setRightBarButtonItem:", v34);

  -[PXSuggestionDebugViewController _switchLogsAction:](self, "_switchLogsAction:", 0);
}

- (void)_switchLogsAction:(id)a3
{
  NSInteger v4;
  NSDictionary *v5;
  NSDictionary *tableContent;
  void *v7;
  NSArray *v8;
  NSArray *sectionTitles;

  v4 = -[UISegmentedControl selectedSegmentIndex](self->_segmentedControl, "selectedSegmentIndex", a3);
  if (!v4)
  {
    -[PXSuggestionDebugViewController infoSectionsWithSuggestion:suggestionInfo:compact:](self, "infoSectionsWithSuggestion:suggestionInfo:compact:", self->_suggestion, self->_suggestionInfo, 0);
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (v4 == 1)
  {
    -[PXSuggestionDebugViewController existingSectionsWithSuggestion:suggestionInfo:](self, "existingSectionsWithSuggestion:suggestionInfo:", self->_suggestion, self->_suggestionInfo);
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    tableContent = self->_tableContent;
    self->_tableContent = v5;

  }
  -[NSDictionary allKeys](self->_tableContent, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedArrayUsingSelector:", sel_compare_);
  v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
  sectionTitles = self->_sectionTitles;
  self->_sectionTitles = v8;

  -[UITableView reloadData](self->_tableView, "reloadData");
}

- (id)infoSectionsWithSuggestion:(id)a3 suggestionInfo:(id)a4 compact:(BOOL)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
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
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;

  v7 = a3;
  v8 = a4;
  v72 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v9 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v9, "setDateStyle:", 1);
  objc_msgSend(v9, "setTimeStyle:", 2);
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v7, "type");
  PHSuggestionStringWithType();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("[Type] %@"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v13);

  v14 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v7, "subtype");
  PHSuggestionStringWithSubtype();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("[Subtype] %@"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v16);

  objc_msgSend(v7, "uuid");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17
    || (objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("uuid")),
        (v17 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[UUID] %@"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v18);

  }
  objc_msgSend(v7, "creationDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19
    || (objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("creationDate")),
        (v19 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v20 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v9, "stringFromDate:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("[Creation Date] %@"), v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v22);

  }
  v23 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v7, "state");
  PHSuggestionStateStringWithState();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringWithFormat:", CFSTR("[State] %@"), v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v25);

  v26 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v7, "notificationState");
  PHSuggestionNotificationStateStringWithNotificationState();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stringWithFormat:", CFSTR("[Notification state] %@"), v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v28);

  objc_msgSend(v7, "localizedTitle");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29
    || (objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("title")),
        (v29 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Title] %@"), v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v30);

  }
  objc_msgSend(v7, "localizedSubtitle");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31
    || (objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("subtitle")),
        (v31 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Subtitle] %@"), v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v32);

  }
  objc_msgSend(v7, "startDate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33
    || (objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("universalStartDate")),
        (v33 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v34 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v9, "stringFromDate:", v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "stringWithFormat:", CFSTR("[Start Date] %@"), v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v36);

  }
  objc_msgSend(v7, "endDate");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37
    || (objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("universalEndDate")),
        (v37 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v38 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v9, "stringFromDate:", v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "stringWithFormat:", CFSTR("[End Date] %@"), v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v40);

  }
  objc_msgSend(v7, "context");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (v41)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Context] %@"), v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v42);

  }
  objc_msgSend(v7, "relevantUntilDate");
  v43 = objc_claimAutoreleasedReturnValue();
  v69 = (void *)v43;
  if (v43)
  {
    v44 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v9, "stringFromDate:", v43);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "stringWithFormat:", CFSTR("[Relevant Until Date] %@"), v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v46);

  }
  v70 = v9;
  objc_msgSend(v72, "setObject:forKeyedSubscript:", v10, CFSTR("1. Info"));
  v47 = v10;
  v48 = v47;
  if (!a5)
  {
    v48 = objc_alloc_init(MEMORY[0x1E0C99DE8]);

    objc_msgSend(v72, "setObject:forKeyedSubscript:", v48, CFSTR("2. Assets"));
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("keyAssetUUID"));
  v49 = objc_claimAutoreleasedReturnValue();
  v50 = v8;
  v51 = (void *)v49;
  v71 = v50;
  objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("keyAssetCreationDate"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v51)
  {
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyAssetsInAssetCollection:options:", v7, 0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "firstObject");
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v54, "uuid");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "creationDate");
    v55 = objc_claimAutoreleasedReturnValue();

    v52 = (void *)v55;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Key Asset UUID] %@"), v51);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addObject:", v56);

  v57 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v70, "stringFromDate:", v52);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "stringWithFormat:", CFSTR("[Key Asset Creation Date] %@"), v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addObject:", v59);

  objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("reasons"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  if (v60)
    objc_msgSend(v72, "setObject:forKeyedSubscript:", v60, CFSTR("3. Reasons"));
  objc_msgSend(v7, "featuresProperties");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v61;
  if (v61)
  {
    v68 = v47;
    v63 = v41;
    objc_msgSend(v61, "objectForKeyedSubscript:", CFSTR("widgetIdentifier"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v64)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WidgetIdentifier] %@"), v64);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "addObject:", v66);

    }
    if (objc_msgSend(v65, "count"))
      objc_msgSend(v72, "setObject:forKeyedSubscript:", v65, CFSTR("4. Featured Properties"));

    v41 = v63;
    v47 = v68;
  }

  return v72;
}

- (id)existingSectionsWithSuggestion:(id)a3 suggestionInfo:(id)a4
{
  id v4;
  id v5;
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
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
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
  id v38;
  id v39;
  id obj;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  void *v56;
  _BYTE v57[128];
  _BYTE v58[128];
  _QWORD v59[3];

  v59[1] = *MEMORY[0x1E0C80C00];
  v4 = a4;
  v5 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v5, "setDateStyle:", 1);
  objc_msgSend(v5, "setTimeStyle:", 2);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identicalExistingSuggestionInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("uuid"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "librarySpecificFetchOptions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CD17D0], "localIdentifierWithUUID:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v8;
      v13 = (void *)MEMORY[0x1E0CD13B8];
      v59[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "fetchAssetCollectionsWithLocalIdentifiers:options:", v14, v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "firstObject");
      v16 = objc_claimAutoreleasedReturnValue();

      v8 = v12;
      v17 = (void *)v16;
    }
    else
    {
      v17 = 0;
    }
    -[PXSuggestionDebugViewController infoSectionsWithSuggestion:suggestionInfo:compact:](self, "infoSectionsWithSuggestion:suggestionInfo:compact:", v17, v7, 0);
    v47 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v47 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("suggestionsByCollisionReason"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    objc_msgSend(v8, "allKeys");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sortedArrayUsingSelector:", sel_compare_);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v19;
    v43 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
    if (v43)
    {
      v38 = v5;
      v39 = v4;
      v41 = *(_QWORD *)v53;
      v42 = v8;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v53 != v41)
            objc_enumerationMutation(obj);
          v44 = v20;
          v21 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * v20);
          v48 = 0u;
          v49 = 0u;
          v50 = 0u;
          v51 = 0u;
          objc_msgSend(v8, "objectForKeyedSubscript:", v21);
          v45 = (id)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
          if (v22)
          {
            v23 = v22;
            v24 = *(_QWORD *)v49;
            do
            {
              for (i = 0; i != v23; ++i)
              {
                if (*(_QWORD *)v49 != v24)
                  objc_enumerationMutation(v45);
                objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("uuid"));
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                if (v26)
                {
                  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v27, "librarySpecificFetchOptions");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(MEMORY[0x1E0CD17D0], "localIdentifierWithUUID:", v26);
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  v30 = (void *)MEMORY[0x1E0CD13B8];
                  v56 = v29;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v30, "fetchAssetCollectionsWithLocalIdentifiers:options:", v31, v28);
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v32, "firstObject");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();

                }
                else
                {
                  v33 = 0;
                }
                -[PXSuggestionDebugViewController infoSectionsWithSuggestion:suggestionInfo:compact:](self, "infoSectionsWithSuggestion:suggestionInfo:compact:", v33, 0, 1);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("1. Info"));
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %d"), v21, 0);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v47, "setObject:forKey:", v35, v36);

              }
              v23 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
            }
            while (v23);
          }

          v20 = v44 + 1;
          v8 = v42;
        }
        while (v44 + 1 != v43);
        v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
      }
      while (v43);
      v5 = v38;
      v4 = v39;
      v7 = 0;
    }
    v17 = obj;
  }

  return v47;
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
  if (objc_msgSend(getMFMailComposeViewControllerClass_44893(), "canSendMail"))
  {
    -[PXSuggestionDebugViewController title](self, "title");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("PhotosGraph "), "stringByAppendingString:", v4);
    v5 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("photos-memories-feedback@group.apple.com"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init((Class)getMFMailComposeViewControllerClass_44893());
    objc_msgSend(v7, "setMailComposeDelegate:", self);
    objc_msgSend(v7, "setSubject:", v5);
    objc_msgSend(v7, "setToRecipients:", v6);
    +[PXMemoriesRelatedDiagnosticsHelper getSummaryFromProviderItem:](PXMemoriesRelatedDiagnosticsHelper, "getSummaryFromProviderItem:", self->_suggestion);
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
    -[PXSuggestionDebugViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);

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
  -[PXSuggestionDebugViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5
{
  -[PXSuggestionDebugViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0, a5);
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

  -[PXSuggestionDebugViewController tableView:titleForHeaderInSection:](self, "tableView:titleForHeaderInSection:", a3, a4);
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
  -[PXSuggestionDebugViewController tableView:titleForHeaderInSection:](self, "tableView:titleForHeaderInSection:", v7, objc_msgSend(v6, "section"));
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
  objc_storeStrong((id *)&self->_suggestionInfo, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
  objc_storeStrong((id *)&self->_sourceDictionary, 0);
  objc_storeStrong((id *)&self->_tableContent, 0);
  objc_storeStrong((id *)&self->_sectionTitles, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
}

@end
