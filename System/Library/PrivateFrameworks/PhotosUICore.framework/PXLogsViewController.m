@implementation PXLogsViewController

- (PXLogsViewController)initWithSubsystemsAndCategories:(id)a3 startDate:(id)a4
{
  id v7;
  id v8;
  PXLogsViewController *v9;
  PXLogsViewController *v10;
  void *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PXLogsViewController;
  v9 = -[PXLogsViewController initWithNibName:bundle:](&v13, sel_initWithNibName_bundle_, 0, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_subsystemsAndCategories, a3);
    v11 = v8;
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v10->_startDate, v11);
    if (!v8)

  }
  return v10;
}

- (PXLogsViewController)initWithSubsystem:(id)a3 category:(id)a4 startDate:(id)a5
{
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  id v9;
  void *v10;
  void *v11;
  PXLogsViewController *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CB3940];
  if (a3)
    v7 = (const __CFString *)a3;
  else
    v7 = &stru_1E5149688;
  if (a4)
    v8 = (const __CFString *)a4;
  else
    v8 = &stru_1E5149688;
  v9 = a5;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@:%@"), v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PXLogsViewController initWithSubsystemsAndCategories:startDate:](self, "initWithSubsystemsAndCategories:startDate:", v11, v9);

  return v12;
}

- (id)initLiveWithSubsystemsAndCategories:(id)a3
{
  id v5;
  PXLogsViewController *v6;
  PXLogsViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXLogsViewController;
  v6 = -[PXLogsViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_subsystemsAndCategories, a3);

  return v7;
}

- (id)initLiveWithSubsystem:(id)a3 category:(id)a4
{
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = &stru_1E5149688;
  if (a3)
    v6 = (const __CFString *)a3;
  else
    v6 = &stru_1E5149688;
  if (a4)
    v5 = (const __CFString *)a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PXLogsViewController initLiveWithSubsystemsAndCategories:](self, "initLiveWithSubsystemsAndCategories:", v8);

  return v9;
}

- (void)tapped:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int v13;
  NSMutableArray **p_compactLogs;
  id v15;

  objc_msgSend(a3, "locationInView:", self->_textView);
  v5 = v4;
  v7 = v6;
  -[UITextView layoutManager](self->_textView, "layoutManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView textContainer](self->_textView, "textContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "characterIndexForPoint:inTextContainer:fractionOfDistanceBetweenInsertionPoints:", v9, 0, v5, v7);

  if (-[NSMutableArray count](self->_compactLogs, "count"))
  {
    v11 = 0;
    v12 = 0;
    while (1)
    {
      v13 = -[NSMutableIndexSet containsIndex:](self->_isExpanded, "containsIndex:", v11);
      p_compactLogs = &self->_compactLogs;
      if (v13)
        p_compactLogs = &self->_expandedLogs;
      -[NSMutableArray objectAtIndexedSubscript:](*p_compactLogs, "objectAtIndexedSubscript:", v11);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v12 += objc_msgSend(v15, "length");
      if (v10 < v12)
        break;

      if (++v11 >= (unint64_t)-[NSMutableArray count](self->_compactLogs, "count"))
        return;
    }
    -[PXLogsViewController toggleModeForStringIndex:](self, "toggleModeForStringIndex:", v11);

  }
}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  UITextView *v5;
  UITextView *textView;
  void *v7;
  void *v8;
  UIActivityIndicatorView *v9;
  UIActivityIndicatorView *spinnerView;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  void *v28;
  objc_super v29;
  CGRect v30;
  CGRect v31;

  v29.receiver = self;
  v29.super_class = (Class)PXLogsViewController;
  -[PXLogsViewController viewDidLoad](&v29, sel_viewDidLoad);
  -[PXLogsViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0DC3E50]);
  objc_msgSend(v3, "bounds");
  v5 = (UITextView *)objc_msgSend(v4, "initWithFrame:");
  textView = self->_textView;
  self->_textView = v5;

  -[UITextView setAutoresizingMask:](self->_textView, "setAutoresizingMask:", 18);
  -[UITextView setEditable:](self->_textView, "setEditable:", 0);
  -[UITextView textContainer](self->_textView, "textContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLineBreakMode:", 1);

  -[UITextView setTextAlignment:](self->_textView, "setTextAlignment:", 0);
  objc_msgSend(v3, "addSubview:", self->_textView);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_tapped_);
  -[UITextView addGestureRecognizer:](self->_textView, "addGestureRecognizer:", v8);
  if (self->_startDate)
    -[PXLogsViewController prepareDiskStore](self, "prepareDiskStore");
  else
    -[PXLogsViewController prepareLiveStore](self, "prepareLiveStore");
  if (self->_startDate)
  {
    v9 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 101);
    spinnerView = self->_spinnerView;
    self->_spinnerView = v9;

    objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityIndicatorView setColor:](self->_spinnerView, "setColor:", v11);

    -[UIActivityIndicatorView bounds](self->_spinnerView, "bounds");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    objc_msgSend(v3, "bounds");
    v21 = v20;
    -[UIActivityIndicatorView bounds](self->_spinnerView, "bounds");
    v23 = (v21 - v22) * 0.5;
    objc_msgSend(v3, "bounds");
    v25 = v24;
    -[UIActivityIndicatorView bounds](self->_spinnerView, "bounds");
    v27 = (v25 - v26) * 0.5;
    v30.origin.x = v13;
    v30.origin.y = v15;
    v30.size.width = v17;
    v30.size.height = v19;
    v31 = CGRectOffset(v30, v23, v27);
    -[UIActivityIndicatorView setFrame:](self->_spinnerView, "setFrame:", v31.origin.x, v31.origin.y, v31.size.width, v31.size.height);
    -[UIActivityIndicatorView setAutoresizingMask:](self->_spinnerView, "setAutoresizingMask:", 45);
    -[UIActivityIndicatorView setHidesWhenStopped:](self->_spinnerView, "setHidesWhenStopped:", 1);
    objc_msgSend(v3, "addSubview:", self->_spinnerView);
    -[UIActivityIndicatorView startAnimating](self->_spinnerView, "startAnimating");
  }
  -[PXLogsViewController navigationController](self, "navigationController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setToolbarHidden:animated:", 1, 0);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[OSLogEventStreamBase invalidate](self->_eventStream, "invalidate");
  v5.receiver = self;
  v5.super_class = (Class)PXLogsViewController;
  -[PXLogsViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
}

- (void)prepareDiskStore
{
  void *v3;
  _QWORD v4[5];

  objc_msgSend(MEMORY[0x1E0D44698], "localStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__PXLogsViewController_prepareDiskStore__block_invoke;
  v4[3] = &unk_1E513B168;
  v4[4] = self;
  objc_msgSend(v3, "prepareWithCompletionHandler:", v4);

}

- (void)prepareLiveStore
{
  void *v3;
  _QWORD v4[5];

  objc_msgSend(MEMORY[0x1E0D44670], "liveLocalStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__PXLogsViewController_prepareLiveStore__block_invoke;
  v4[3] = &unk_1E513B190;
  v4[4] = self;
  objc_msgSend(v3, "prepareWithCompletionHandler:", v4);

}

- (id)subsystemsAndCategoriesPredicateWithSubsystemsAndCategories:(id)a3
{
  id v3;
  id v4;
  id v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[2];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!objc_msgSend(v3, "count"))
  {
    v18 = 0;
    goto LABEL_32;
  }
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v20 = v3;
  v5 = v3;
  v22 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (!v22)
    goto LABEL_27;
  v21 = *(_QWORD *)v24;
  v6 = &stru_1E5149688;
  do
  {
    v7 = 0;
    do
    {
      if (*(_QWORD *)v24 != v21)
        objc_enumerationMutation(v5);
      objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v7), "componentsSeparatedByString:", CFSTR(":"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "count"))
      {
        objc_msgSend(v8, "firstObject");
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = &stru_1E5149688;
      }
      if ((unint64_t)objc_msgSend(v8, "count") >= 2)
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      if (-[__CFString length](v9, "length"))
      {
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("subsystem = %@"), v9);
        v10 = (id)objc_claimAutoreleasedReturnValue();
        if (!-[__CFString length](v6, "length"))
        {
          if (v10)
            goto LABEL_23;
          v11 = 0;
LABEL_20:
          v11 = v11;
          v10 = 0;
          v17 = v11;
          goto LABEL_21;
        }
      }
      else
      {
        v10 = 0;
        v11 = 0;
        if (!-[__CFString length](v6, "length"))
          goto LABEL_20;
      }
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("category = %@"), v6);
      v12 = objc_claimAutoreleasedReturnValue();
      v11 = (id)v12;
      if (!v10)
        goto LABEL_20;
      if (!v12)
      {
LABEL_23:
        v10 = v10;
        v11 = 0;
        v17 = v10;
LABEL_24:
        objc_msgSend(v4, "addObject:", v17);

        goto LABEL_25;
      }
      v13 = (void *)MEMORY[0x1E0CB3528];
      v27[0] = v10;
      v27[1] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
      v14 = v5;
      v15 = v4;
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "andPredicateWithSubpredicates:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = v15;
      v5 = v14;
LABEL_21:
      if (v17)
        goto LABEL_24;
LABEL_25:

      ++v7;
      v6 = &stru_1E5149688;
    }
    while (v22 != v7);
    v22 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  }
  while (v22);
LABEL_27:

  if ((unint64_t)objc_msgSend(v4, "count") < 2)
    objc_msgSend(v4, "firstObject");
  else
    objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = v20;
LABEL_32:

  return v18;
}

- (void)setupEventStream:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableArray *v15;
  NSMutableArray *compactLogs;
  NSMutableArray *v17;
  NSMutableArray *expandedLogs;
  NSMutableIndexSet *v19;
  NSMutableIndexSet *isExpanded;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  _QWORD v27[5];
  _QWORD v28[4];
  id v29;
  id v30;
  PXLogsViewController *v31;
  id v32;
  id v33;
  _QWORD *v34;
  _QWORD v35[3];
  char v36;
  uint64_t v37;
  void *v38;
  _QWORD v39[4];

  v39[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "setFlags:", 389);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("type = %d"), 1024);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXLogsViewController subsystemsAndCategoriesPredicateWithSubsystemsAndCategories:](self, "subsystemsAndCategoriesPredicateWithSubsystemsAndCategories:", self->_subsystemsAndCategories);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
  {
    v7 = (void *)MEMORY[0x1E0CB3528];
    v39[0] = v26;
    v39[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "andPredicateWithSubpredicates:", v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = v26;
  }
  objc_msgSend(v4, "setFilterPredicate:", v9);
  -[PXLogsViewController dateFormatter](self, "dateFormatter");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v10, "setDateStyle:", 1);
    objc_msgSend(v10, "setTimeStyle:", 1);
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.9, 0.9, 0.9, 1.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.9, 0.9, 0.7, 1.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.7, 0.9, 0.7, 1.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = *MEMORY[0x1E0DC1100];
  v38 = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  v36 = 0;
  v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  compactLogs = self->_compactLogs;
  self->_compactLogs = v15;

  v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  expandedLogs = self->_expandedLogs;
  self->_expandedLogs = v17;

  v19 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
  isExpanded = self->_isExpanded;
  self->_isExpanded = v19;

  v21 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __41__PXLogsViewController_setupEventStream___block_invoke;
  v28[3] = &unk_1E513B1B8;
  v34 = v35;
  v22 = v11;
  v29 = v22;
  v23 = v12;
  v30 = v23;
  v31 = self;
  v24 = v10;
  v32 = v24;
  v25 = v14;
  v33 = v25;
  objc_msgSend(v4, "setEventHandler:", v28);
  v27[0] = v21;
  v27[1] = 3221225472;
  v27[2] = __41__PXLogsViewController_setupEventStream___block_invoke_3;
  v27[3] = &unk_1E513B1E0;
  v27[4] = self;
  objc_msgSend(v4, "setInvalidationHandler:", v27);

  _Block_object_dispose(v35, 8);
}

- (void)removeSpinner
{
  UIActivityIndicatorView *spinnerView;

  -[UIActivityIndicatorView removeFromSuperview](self->_spinnerView, "removeFromSuperview");
  spinnerView = self->_spinnerView;
  self->_spinnerView = 0;

}

- (void)logAttributedString:(id)a3
{
  id v4;
  NSMutableAttributedString *fullAttributedString;
  NSMutableAttributedString *v6;
  NSMutableAttributedString *v7;
  dispatch_time_t v8;
  _QWORD block[5];

  v4 = a3;
  fullAttributedString = self->_fullAttributedString;
  if (!fullAttributedString)
  {
    v6 = (NSMutableAttributedString *)objc_alloc_init(MEMORY[0x1E0CB3778]);
    v7 = self->_fullAttributedString;
    self->_fullAttributedString = v6;

    fullAttributedString = self->_fullAttributedString;
  }
  -[NSMutableAttributedString appendAttributedString:](fullAttributedString, "appendAttributedString:", v4);
  if (!self->_hasScheduledTextViewUpdate)
  {
    self->_hasScheduledTextViewUpdate = 1;
    v8 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__PXLogsViewController_logAttributedString___block_invoke;
    block[3] = &unk_1E5149198;
    block[4] = self;
    dispatch_after(v8, MEMORY[0x1E0C80D38], block);
  }

}

- (void)toggleModeForStringIndex:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int *v8;
  void *v9;
  id v10;

  v5 = 0;
  v6 = 0;
  v7 = 0;
  do
  {
    v5 += v6;
    if (-[NSMutableIndexSet containsIndex:](self->_isExpanded, "containsIndex:", v7))
      v8 = &OBJC_IVAR___PXLogsViewController__expandedLogs;
    else
      v8 = &OBJC_IVAR___PXLogsViewController__compactLogs;
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v8), "objectAtIndexedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v9, "length");

    ++v7;
  }
  while (v7 <= a3);
  if ((-[NSMutableIndexSet containsIndex:](self->_isExpanded, "containsIndex:", a3) & 1) != 0)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_compactLogs, "objectAtIndexedSubscript:", a3);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableIndexSet removeIndex:](self->_isExpanded, "removeIndex:", a3);
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_expandedLogs, "objectAtIndexedSubscript:", a3);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableIndexSet addIndex:](self->_isExpanded, "addIndex:", a3);
  }
  -[NSMutableAttributedString replaceCharactersInRange:withAttributedString:](self->_fullAttributedString, "replaceCharactersInRange:withAttributedString:", v5, v6, v10);
  -[UITextView setAttributedText:](self->_textView, "setAttributedText:", self->_fullAttributedString);

}

- (id)substitutionForObjectRepresentation:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *substitutionByObjectRepresentation;
  NSMutableDictionary *v14;
  NSMutableDictionary *nextAvailableIndexByClassName;
  void *v16;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_substitutionByObjectRepresentation, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if (objc_msgSend(v4, "hasPrefix:", CFSTR("<")))
    {
      v6 = objc_msgSend(v4, "rangeOfString:", CFSTR(">"));
      v7 = objc_msgSend(v4, "rangeOfString:", CFSTR(": 0x"));
      v5 = 0;
      if (v6 != 0x7FFFFFFFFFFFFFFFLL && v7 < v6)
      {
        objc_msgSend(v4, "substringWithRange:", 1, v7 - 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_nextAvailableIndexByClassName, "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "unsignedIntegerValue");

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %lu"), v8, v10);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10 + 1;
        if (!self->_substitutionByObjectRepresentation)
        {
          v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
          substitutionByObjectRepresentation = self->_substitutionByObjectRepresentation;
          self->_substitutionByObjectRepresentation = v12;

          v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
          nextAvailableIndexByClassName = self->_nextAvailableIndexByClassName;
          self->_nextAvailableIndexByClassName = v14;

        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_nextAvailableIndexByClassName, "setObject:forKeyedSubscript:", v16, v8);

        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_substitutionByObjectRepresentation, "setObject:forKeyedSubscript:", v5, v4);
      }
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isCollectionRepresentation:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("(")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("{"));

  return v4;
}

- (id)substitutionForCollectionRepresentation:(id)a3 attributes:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableDictionary *substitutionByObjectRepresentation;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v6, v7);
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__235460;
  v25 = __Block_byref_object_dispose__235461;
  v26 = 0;
  v9 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0DC1100]);

  substitutionByObjectRepresentation = self->_substitutionByObjectRepresentation;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __75__PXLogsViewController_substitutionForCollectionRepresentation_attributes___block_invoke;
  v17[3] = &unk_1E513B208;
  v20 = &v21;
  v12 = v8;
  v18 = v12;
  v13 = v9;
  v19 = v13;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](substitutionByObjectRepresentation, "enumerateKeysAndObjectsUsingBlock:", v17);
  v14 = (void *)v22[5];
  if (!v14)
    v14 = v12;
  v15 = v14;

  _Block_object_dispose(&v21, 8);
  return v15;
}

- (NSDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (void)setDateFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_dateFormatter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_nextAvailableIndexByClassName, 0);
  objc_storeStrong((id *)&self->_substitutionByObjectRepresentation, 0);
  objc_storeStrong((id *)&self->_isExpanded, 0);
  objc_storeStrong((id *)&self->_expandedLogs, 0);
  objc_storeStrong((id *)&self->_compactLogs, 0);
  objc_storeStrong((id *)&self->_fullAttributedString, 0);
  objc_storeStrong((id *)&self->_eventStream, 0);
  objc_storeStrong((id *)&self->_spinnerView, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_subsystemsAndCategories, 0);
}

void __75__PXLogsViewController_substitutionForCollectionRepresentation_attributes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *i;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a2;
  v5 = a3;
  for (i = 0; ; objc_msgSend(v12, "replaceCharactersInRange:withAttributedString:", v9 - 1, v11 + 2, i))
  {
    v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (!v7)
      v7 = *(void **)(a1 + 32);
    objc_msgSend(v7, "string");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "rangeOfString:", v16);
    v11 = v10;

    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
      break;
    if (!i)
      i = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v5, *(_QWORD *)(a1 + 40));
    v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (!v12)
    {
      v13 = objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

      v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    }
  }

}

uint64_t __44__PXLogsViewController_logAttributedString___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "setAttributedText:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1008));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1016) = 0;
  return result;
}

void __41__PXLogsViewController_setupEventStream___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  char v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  void *v47;
  _QWORD block[5];
  id v49;
  id v50;
  uint64_t v51;
  _QWORD v52[2];

  v52[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *MEMORY[0x1E0DC1100];
  v51 = *MEMORY[0x1E0DC1100];
  v5 = 32;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
    v5 = 40;
  v45 = a1;
  v52[0] = *(_QWORD *)(a1 + v5);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decomposedMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "state"))
  {
    v7 = 0;
    goto LABEL_24;
  }
  v46 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  if (!objc_msgSend(v6, "placeholderCount"))
  {
    v7 = 0;
    goto LABEL_23;
  }
  v43 = v3;
  v44 = v4;
  v8 = 0;
  v9 = 0;
  do
  {
    objc_msgSend(v6, "literalPrefixAtIndex:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v10, v47);
      objc_msgSend(v46, "appendAttributedString:", v11);

    }
    objc_msgSend(v6, "placeholderAtIndex:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "argumentAtIndex:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "rawString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "hasSuffix:", CFSTR("@"));

    if (v15)
    {
      objc_msgSend(v6, "argumentAtIndex:", v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectRepresentation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(*(id *)(v45 + 48), "isCollectionRepresentation:", v17);
      v19 = *(void **)(v45 + 48);
      if (v18)
      {
        objc_msgSend(v19, "substitutionForCollectionRepresentation:attributes:", v17, v47);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "appendAttributedString:", v20);
LABEL_14:
        v8 = 1;
        goto LABEL_17;
      }
      objc_msgSend(v19, "substitutionForObjectRepresentation:", v17);
      v21 = objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        v20 = (void *)v21;
        v22 = (void *)objc_msgSend(v47, "mutableCopy");
        objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setObject:forKeyedSubscript:", v23, v44);

        v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v20, v22);
        objc_msgSend(v46, "appendAttributedString:", v24);

        goto LABEL_14;
      }

    }
    v25 = objc_alloc(MEMORY[0x1E0CB3498]);
    v26 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v13, "objectRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", CFSTR("%@"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v25, "initWithString:attributes:", v17, v47);
    objc_msgSend(v46, "appendAttributedString:", v20);
LABEL_17:

    ++v9;
  }
  while (v9 < objc_msgSend(v6, "placeholderCount"));
  if ((v8 & 1) != 0)
    v7 = v46;
  else
    v7 = 0;
  v3 = v43;
LABEL_23:

LABEL_24:
  v27 = objc_alloc(MEMORY[0x1E0CB3498]);
  v28 = (void *)MEMORY[0x1E0CB3940];
  v29 = *(void **)(v45 + 56);
  objc_msgSend(v3, "date");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "stringFromDate:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "stringWithFormat:", CFSTR("%@ "), v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend(v27, "initWithString:attributes:", v32, *(_QWORD *)(v45 + 64));

  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", CFSTR("\n"), v47);
  v35 = (void *)objc_msgSend(v33, "mutableCopy");
  v36 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(v3, "composedMessage");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend(v36, "initWithString:attributes:", v37, v47);
  objc_msgSend(v35, "appendAttributedString:", v38);

  objc_msgSend(v35, "appendAttributedString:", v34);
  v39 = v35;
  v40 = v39;
  if (v7)
  {
    v40 = (void *)objc_msgSend(v33, "mutableCopy");
    objc_msgSend(v40, "appendAttributedString:", v7);
    objc_msgSend(v40, "appendAttributedString:", v34);

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v45 + 72) + 8) + 24) ^= 1u;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__PXLogsViewController_setupEventStream___block_invoke_2;
  block[3] = &unk_1E51457C8;
  block[4] = *(_QWORD *)(v45 + 48);
  v49 = v40;
  v50 = v39;
  v41 = v39;
  v42 = v40;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __41__PXLogsViewController_setupEventStream___block_invoke_3(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__PXLogsViewController_setupEventStream___block_invoke_4;
  block[3] = &unk_1E5149198;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __41__PXLogsViewController_setupEventStream___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "setAttributedText:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1008));
  return objc_msgSend(*(id *)(a1 + 32), "removeSpinner");
}

uint64_t __41__PXLogsViewController_setupEventStream___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "addObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "addObject:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "logAttributedString:", *(_QWORD *)(a1 + 40));
}

void __40__PXLogsViewController_prepareLiveStore__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = (objc_class *)MEMORY[0x1E0D44678];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithLiveSource:", v4);

  objc_msgSend(*(id *)(a1 + 32), "setupEventStream:", v5);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 1000);
  *(_QWORD *)(v6 + 1000) = v5;
  v8 = v5;

  objc_msgSend(v8, "activate");
}

void __40__PXLogsViewController_prepareDiskStore__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = (objc_class *)MEMORY[0x1E0D446A0];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithSource:", v4);

  objc_msgSend(*(id *)(a1 + 32), "setupEventStream:", v5);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 1000);
  *(_QWORD *)(v6 + 1000) = v5;
  v8 = v5;

  objc_msgSend(v8, "activateStreamFromDate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 976));
}

@end
