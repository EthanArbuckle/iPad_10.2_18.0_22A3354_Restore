@implementation PXDebugRelatedViewController

- (PXDebugRelatedViewController)initWithDictionary:(id)a3
{
  id v4;
  PXDebugRelatedViewController *v5;
  PXDebugRelatedViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXDebugRelatedViewController;
  v5 = -[PXDebugRelatedViewController init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[PXDebugRelatedViewController setTitle:](v5, "setTitle:", CFSTR("Related Debug"));
    -[PXDebugRelatedViewController _setupWithDictionary:](v6, "_setupWithDictionary:", v4);
  }

  return v6;
}

- (void)_setupWithDictionary:(id)a3
{
  void *v4;
  id v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *currentKeywords;
  NSCountedSet *v8;
  NSCountedSet *countedKeywords;
  void *v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  NSString *v22;
  NSString *debugDescription;
  NSDictionary *v24;
  NSDictionary *matchingWeight;
  NSDictionary *v26;
  NSDictionary *matchingKeywords;
  NSDictionary *v28;
  NSDictionary *referenceKeywords;
  NSDictionary *v30;
  NSDictionary *relatedKeywords;

  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = a3;
  objc_msgSend(v4, "dictionary");
  v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  currentKeywords = self->_currentKeywords;
  self->_currentKeywords = v6;

  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v8 = (NSCountedSet *)objc_claimAutoreleasedReturnValue();
  countedKeywords = self->_countedKeywords;
  self->_countedKeywords = v8;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("graphScore"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  self->_graphScore = v11;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("neighborScore"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  self->_neighborScore = v13;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("curationScore"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  self->_curationScore = v15;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("relatedScore"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "doubleValue");
  self->_relatedScore = v17;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("matchingScore"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "doubleValue");
  self->_matchingScore = v19;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isInteresting"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isInteresting = objc_msgSend(v20, "BOOLValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("relatedType"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  self->_relatedType = objc_msgSend(v21, "integerValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("debugDescription"));
  v22 = (NSString *)objc_claimAutoreleasedReturnValue();
  debugDescription = self->_debugDescription;
  self->_debugDescription = v22;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("matchingWeight"));
  v24 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  matchingWeight = self->_matchingWeight;
  self->_matchingWeight = v24;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("matchingKeywords"));
  v26 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  matchingKeywords = self->_matchingKeywords;
  self->_matchingKeywords = v26;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("referenceKeywords"));
  v28 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  referenceKeywords = self->_referenceKeywords;
  self->_referenceKeywords = v28;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("relatedKeywords"));
  v30 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

  relatedKeywords = self->_relatedKeywords;
  self->_relatedKeywords = v30;

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  UISegmentedControl *v6;
  UISegmentedControl *segmentedControl;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
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
  id v43;
  UITableView *v44;
  UITableView *tableView;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  objc_super v53;

  v53.receiver = self;
  v53.super_class = (Class)PXDebugRelatedViewController;
  -[PXDebugRelatedViewController viewDidLoad](&v53, sel_viewDidLoad);
  -[PXDebugRelatedViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAutoresizingMask:", 18);

  -[PXDebugRelatedViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

  v6 = (UISegmentedControl *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C58]), "initWithItems:", &unk_1E53E8B08);
  segmentedControl = self->_segmentedControl;
  self->_segmentedControl = v6;

  -[UISegmentedControl addTarget:action:forControlEvents:](self->_segmentedControl, "addTarget:action:forControlEvents:", self, sel__switchLogsAction_, 4096);
  -[PXDebugRelatedViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", self->_segmentedControl);

  v52 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  -[PXDebugRelatedViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v52);

  v10 = (void *)objc_opt_new();
  -[PXDebugRelatedViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v10);

  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 12.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFont:", v13);

  objc_msgSend(v10, "addSubview:", v12);
  v14 = (void *)objc_opt_new();
  objc_msgSend(v14, "setTextAlignment:", 1);
  if (self->_isInteresting)
    v15 = CFSTR("YES");
  else
    v15 = CFSTR("NO");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Curation: %.3f (%@)"), *(_QWORD *)&self->_curationScore, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v16);

  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 12.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFont:", v17);

  objc_msgSend(v10, "addSubview:", v14);
  v18 = (void *)objc_opt_new();
  objc_msgSend(v18, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Graph: %.3f"), *(_QWORD *)&self->_graphScore);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setText:", v19);

  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 12.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFont:", v20);

  objc_msgSend(v10, "addSubview:", v18);
  v21 = (void *)objc_opt_new();
  objc_msgSend(v21, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Neighbor: %.3f"), *(_QWORD *)&self->_neighborScore);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setText:", v22);

  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 12.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFont:", v23);

  objc_msgSend(v10, "addSubview:", v21);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Related: %0.3f (%.3f)"), *(_QWORD *)&self->_relatedScore, *(_QWORD *)&self->_matchingScore);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v24);

  -[UISegmentedControl setSelectedSegmentIndex:](self->_segmentedControl, "setSelectedSegmentIndex:", 0);
  -[UISegmentedControl setTranslatesAutoresizingMaskIntoConstraints:](self->_segmentedControl, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v52, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v51 = v12;
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v50 = v14;
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  _NSDictionaryOfVariableBindings(CFSTR("_segmentedControl, contentView, relatedScoreLabel, curationScoreLabel, graphScoreLabel, neighborScoreLabel, labelsView"), self->_segmentedControl, v52, v12, v14, v18, v21, v10, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "topAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXDebugRelatedViewController view](self, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "safeAreaLayoutGuide");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "topAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:constant:", v29, 10.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setActive:", 1);

  -[PXDebugRelatedViewController view](self, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[labelsView]-10-[_segmentedControl(<=44)]-10-[contentView]-0-|"), 0, 0, v25);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addConstraints:", v32);

  -[PXDebugRelatedViewController view](self, "view");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[_segmentedControl]-|"), 0, 0, v25);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "addConstraints:", v34);

  -[PXDebugRelatedViewController view](self, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-20-[labelsView]-20-|"), 0, 0, v25);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "addConstraints:", v36);

  -[PXDebugRelatedViewController view](self, "view");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[contentView]|"), 0, 0, v25);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addConstraints:", v38);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-[relatedScoreLabel]-[curationScoreLabel]-|"), 0, 0, v25);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addConstraints:", v39);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-[graphScoreLabel]-[neighborScoreLabel]-|"), 0, 0, v25);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addConstraints:", v40);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[curationScoreLabel(==neighborScoreLabel)]-[neighborScoreLabel]|"), 0, 0, v25);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addConstraints:", v41);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[relatedScoreLabel(==graphScoreLabel)]-[graphScoreLabel]|"), 0, 0, v25);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addConstraints:", v42);

  v43 = objc_alloc(MEMORY[0x1E0DC3D48]);
  objc_msgSend(v52, "frame");
  v44 = (UITableView *)objc_msgSend(v43, "initWithFrame:style:", 1);
  tableView = self->_tableView;
  self->_tableView = v44;

  -[UITableView setAutoresizingMask:](self->_tableView, "setAutoresizingMask:", 18);
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
  -[UITableView setAllowsSelection:](self->_tableView, "setAllowsSelection:", 0);
  objc_msgSend(v52, "addSubview:", self->_tableView);
  v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", CFSTR("Close"), 2, self, sel__closeAction_);
  -[PXDebugRelatedViewController navigationItem](self, "navigationItem");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setLeftBarButtonItem:", v46);

  v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 7, self, sel__sendByEmailAction_);
  -[PXDebugRelatedViewController navigationItem](self, "navigationItem");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setRightBarButtonItem:", v48);

  -[PXDebugRelatedViewController _switchLogsAction:](self, "_switchLogsAction:", 0);
}

- (void)_initDataSourceWithKeywords:(id)a3
{
  NSMutableDictionary *currentKeywords;
  id v5;
  _QWORD v6[5];

  currentKeywords = self->_currentKeywords;
  v5 = a3;
  -[NSMutableDictionary removeAllObjects](currentKeywords, "removeAllObjects");
  -[NSCountedSet removeAllObjects](self->_countedKeywords, "removeAllObjects");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__PXDebugRelatedViewController__initDataSourceWithKeywords___block_invoke;
  v6[3] = &unk_1E511C888;
  v6[4] = self;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v6);

}

- (void)_switchLogsAction:(id)a3
{
  unint64_t v4;
  id v5;
  id v6;

  v4 = -[UISegmentedControl selectedSegmentIndex](self->_segmentedControl, "selectedSegmentIndex", a3);
  if (v4 > 2)
    v5 = 0;
  else
    v5 = *(id *)((char *)&self->super.super.super.isa + *off_1E511C8C0[v4]);
  v6 = v5;
  -[PXDebugRelatedViewController _initDataSourceWithKeywords:](self, "_initDataSourceWithKeywords:", v5);
  -[UITableView reloadData](self->_tableView, "reloadData");

}

- (void)_sendByEmailAction:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  __CFString *v19;
  uint8_t buf[8];
  id v21;

  if (objc_msgSend(getMFMailComposeViewControllerClass_42329(), "canSendMail"))
  {
    -[PXDebugRelatedViewController title](self, "title");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("PhotosGraph "), "stringByAppendingString:", v4);
    v5 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("photos-memories-feedback@group.apple.com"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init((Class)getMFMailComposeViewControllerClass_42329());
    objc_msgSend(v7, "setMailComposeDelegate:", self);
    objc_msgSend(v7, "setSubject:", v5);
    objc_msgSend(v7, "setToRecipients:", v6);
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_relatedScore);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("relatedScore"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_matchingScore);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("matchingScore"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_curationScore);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("curationScore"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_graphScore);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, CFSTR("graphScore"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_neighborScore);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("neighborScore"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_relatedType);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, CFSTR("relatedType"));

    objc_msgSend(v8, "setObject:forKeyedSubscript:", self->_debugDescription, CFSTR("debugDescription"));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", self->_matchingWeight, CFSTR("matchingWeight"));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", self->_matchingKeywords, CFSTR("matchingKeywords"));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", self->_referenceKeywords, CFSTR("referenceKeywords"));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", self->_relatedKeywords, CFSTR("relatedKeywords"));
    v21 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v8, 200, 0, &v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v21;
    if (v15)
      objc_msgSend(v7, "addAttachmentData:mimeType:fileName:", v15, CFSTR("application/x-plist"), CFSTR("results.plist"));
    if (v16)
    {
      v17 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v16, "localizedDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", CFSTR("Cannot attach results.plist: %@."), v18);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

      NSLog(CFSTR("ERROR: %@"), v19);
    }
    else
    {
      v19 = &stru_1E5149688;
    }
    objc_msgSend(v7, "setMessageBody:isHTML:", v19, 0);
    -[PXDebugRelatedViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);

  }
  else
  {
    PLUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "ERROR: Looks like email is not setup on this system.", buf, 2u);
    }
  }

}

- (void)_closeAction:(id)a3
{
  -[PXDebugRelatedViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5
{
  -[PXDebugRelatedViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0, a5);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[NSMutableDictionary allKeys](self->_currentKeywords, "allKeys", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;

  -[NSMutableDictionary allKeys](self->_currentKeywords, "allKeys", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKeyedSubscript:](self->_currentKeywords, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSCountedSet *countedKeywords;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("KeywordsCell"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 3, CFSTR("KeywordsCell"));
  -[NSMutableDictionary allKeys](self->_currentKeywords, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v6, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "textLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_currentKeywords, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v6, "row");

  objc_msgSend(v11, "objectAtIndexedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v13);

  countedKeywords = self->_countedKeywords;
  objc_msgSend(v7, "textLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "text");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[NSCountedSet countForObject:](countedKeywords, "countForObject:", v16);

  objc_msgSend(v7, "detailTextLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v17 < 2)
  {
    objc_msgSend(v18, "setText:", &stru_1E5149688);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("x%ld"), v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setText:", v20);

    objc_msgSend(v7, "detailTextLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTextAlignment:", 2);
  }

  objc_msgSend(v7, "textLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 13.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFont:", v22);

  objc_msgSend(v7, "textLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setNumberOfLines:", 0);

  objc_msgSend(v7, "textLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "sizeToFit");

  return v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;

  -[NSMutableDictionary allKeys](self->_currentKeywords, "allKeys", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countedKeywords, 0);
  objc_storeStrong((id *)&self->_currentKeywords, 0);
  objc_storeStrong((id *)&self->_relatedKeywords, 0);
  objc_storeStrong((id *)&self->_referenceKeywords, 0);
  objc_storeStrong((id *)&self->_matchingKeywords, 0);
  objc_storeStrong((id *)&self->_matchingWeight, 0);
  objc_storeStrong((id *)&self->_debugDescription, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
}

void __60__PXDebugRelatedViewController__initDataSourceWithKeywords___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3550], "setWithArray:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "unionSet:", v6);
    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 1080);
    objc_msgSend(v6, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v9);

  }
}

@end
