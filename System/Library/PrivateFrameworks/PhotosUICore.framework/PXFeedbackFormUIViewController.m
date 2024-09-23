@implementation PXFeedbackFormUIViewController

- (PXFeedbackFormUIViewController)initWithDelegate:(id)a3 positiveKeys:(id)a4 negativeKeys:(id)a5 wantsCustomFeedbackSection:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  PXFeedbackFormUIViewController *v13;
  PXFeedbackFormUIViewController *v14;
  uint64_t v15;
  NSMutableDictionary *positiveFeedbackValues;
  NSArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSMutableDictionary *negativeFeedbackValues;
  NSArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  objc_super v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v52.receiver = self;
  v52.super_class = (Class)PXFeedbackFormUIViewController;
  v13 = -[PXFeedbackFormUIViewController init](&v52, sel_init);
  v14 = v13;
  if (v13)
  {
    v41 = v12;
    v42 = v11;
    v43 = v10;
    v13->_userLikedIt = 0;
    v13->_wantsCustomFeedbackSection = a6;
    objc_storeStrong((id *)&v13->_positiveFeedbackKeys, a4);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = objc_claimAutoreleasedReturnValue();
    positiveFeedbackValues = v14->_positiveFeedbackValues;
    v14->_positiveFeedbackValues = (NSMutableDictionary *)v15;

    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v17 = v14->_positiveFeedbackKeys;
    v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v49;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v49 != v20)
            objc_enumerationMutation(v17);
          v22 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * v21);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v14->_positiveFeedbackValues, "setObject:forKeyedSubscript:", v23, v22);

          ++v21;
        }
        while (v19 != v21);
        v19 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
      }
      while (v19);
    }

    objc_storeStrong((id *)&v14->_negativeFeedbackKeys, a5);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v24 = objc_claimAutoreleasedReturnValue();
    negativeFeedbackValues = v14->_negativeFeedbackValues;
    v14->_negativeFeedbackValues = (NSMutableDictionary *)v24;

    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v26 = v14->_negativeFeedbackKeys;
    v27 = -[NSArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v45;
      do
      {
        v30 = 0;
        do
        {
          if (*(_QWORD *)v45 != v29)
            objc_enumerationMutation(v26);
          v31 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v30);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v14->_negativeFeedbackValues, "setObject:forKeyedSubscript:", v32, v31);

          ++v30;
        }
        while (v28 != v30);
        v28 = -[NSArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
      }
      while (v28);
    }

    v33 = (void *)objc_opt_new();
    -[PXFeedbackFormUIViewController setTableViewController:](v14, "setTableViewController:", v33);

    -[PXFeedbackFormUIViewController tableViewController](v14, "tableViewController");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "view");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setDataSource:", v14);

    -[PXFeedbackFormUIViewController tableViewController](v14, "tableViewController");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "view");
    v37 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v37, "setDelegate:", v14);

    v10 = v43;
    -[PXFeedbackFormUIViewController setDelegate:](v14, "setDelegate:", v43);
    v14->_wantsPositiveFeedbackSection = 1;
    -[PXFeedbackFormUIViewController delegate](v14, "delegate");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v37) = objc_opt_respondsToSelector();

    v12 = v41;
    v11 = v42;
    if ((v37 & 1) != 0)
    {
      -[PXFeedbackFormUIViewController delegate](v14, "delegate");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v14->_wantsPositiveFeedbackSection = objc_msgSend(v39, "wantsPositiveFeedbackSection");

    }
  }

  return v14;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
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
  objc_super v30;
  void *v31;
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v30.receiver = self;
  v30.super_class = (Class)PXFeedbackFormUIViewController;
  -[PXFeedbackFormUIViewController viewDidLoad](&v30, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFeedbackFormUIViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[PXFeedbackFormUIViewController tableViewController](self, "tableViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PXFeedbackFormUIViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v6);

  -[PXFeedbackFormUIViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safeAreaLayoutGuide");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3718];
  v29 = v9;
  objc_msgSend(v9, "topAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "topAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v13;
  objc_msgSend(v9, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activateConstraints:", v17);

  _NSDictionaryOfVariableBindings(CFSTR("feedbackTableView"), v6, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFeedbackFormUIViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-0-[feedbackTableView]-0-|"), 0, 0, v28);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addConstraints:", v19);

  PXLocalizedStringFromTable(CFSTR("FeedbackFormPanel.sendButton.title"), CFSTR("PXFeedbackCollection"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", v20, 0, self, sel_sendFeedback_);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  PXLocalizedStringFromTable(CFSTR("FeedbackCollectionPanel.cancelButton.title"), CFSTR("PXFeedbackCollection"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", v23, 0, self, sel_cancelFeedback_);
  v31 = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFeedbackFormUIViewController navigationItem](self, "navigationItem");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setLeftBarButtonItems:", v25);

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v22, v21, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFeedbackFormUIViewController setToolbarItems:](self, "setToolbarItems:", v27);

}

- (void)cancelFeedback:(id)a3
{
  -[PXFeedbackFormUIViewController finishWithSuccess:](self, "finishWithSuccess:", 0);
}

- (void)sendFeedback:(id)a3
{
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  v9 = a3;
  if (self->_wantsCustomFeedbackSection)
  {
    -[UITextView text](self->_customFeedbackTextView, "text");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_1E5149688;
  }
  -[PXFeedbackFormUIViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userSentPositiveFeedback:negativeFeedback:customFeedback:", self->_positiveFeedbackValues, self->_negativeFeedbackValues, v4);

  -[PXFeedbackFormUIViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PXFeedbackFormUIViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "shouldContinuePresentingFormAfterFeedback");

    if ((v8 & 1) != 0)
      goto LABEL_9;
  }
  else
  {

  }
  -[PXFeedbackFormUIViewController finishWithSuccess:](self, "finishWithSuccess:", 1);
LABEL_9:

}

- (void)finishWithSuccess:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  id v7;

  v3 = a3;
  -[PXFeedbackFormUIViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[PXFeedbackFormUIViewController delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "userDidFinish:", v3);

  }
  else
  {
    -[PXFeedbackFormUIViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  uint64_t v3;

  v3 = 2;
  if (self->_wantsCustomFeedbackSection)
    v3 = 3;
  return self->_wantsPositiveFeedbackSection + v3 - 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  int64_t v7;
  int *v8;
  int64_t v9;

  v6 = a3;
  v7 = -[PXFeedbackFormUIViewController _feedbackFormSectionForSectionIndex:](self, "_feedbackFormSectionForSectionIndex:", a4);
  if (v7)
  {
    if (v7 == 2)
    {
      v9 = 1;
      goto LABEL_9;
    }
    if (v7 != 1)
      goto LABEL_7;
    v8 = &OBJC_IVAR___PXFeedbackFormUIViewController__negativeFeedbackKeys;
  }
  else
  {
    v8 = &OBJC_IVAR___PXFeedbackFormUIViewController__positiveFeedbackKeys;
  }
  v9 = objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v8), "count");
  if (!v9)
LABEL_7:
    objc_exception_throw(objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DA0]), "initWithName:reason:userInfo:", CFSTR("PXFeedbackFormSectionValueNotFound"), CFSTR("Unsupported PXFeedbackFormSection Value"), 0)));
LABEL_9:

  return v9;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6;
  unint64_t v7;
  __CFString *v8;
  void *v9;

  v6 = a3;
  v7 = -[PXFeedbackFormUIViewController _feedbackFormSectionForSectionIndex:](self, "_feedbackFormSectionForSectionIndex:", a4);
  if (v7 > 2)
    v8 = &stru_1E5149688;
  else
    v8 = off_1E5122670[v7];
  if (-[__CFString isEqualToString:](v8, "isEqualToString:", &stru_1E5149688))
    objc_exception_throw(objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DA0]), "initWithName:reason:userInfo:", CFSTR("PXFeedbackFormSectionValueNotFound"), CFSTR("Unsupported PXFeedbackFormSection Value"), 0)));
  PXLocalizedStringFromTable(v8, CFSTR("PXFeedbackCollection"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  UITextView *v14;
  UITextView *customFeedbackTextView;
  void *v16;
  void *v17;
  void *v18;
  id v19;
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
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[PXFeedbackFormUIViewController _feedbackFormSectionForSectionIndex:](self, "_feedbackFormSectionForSectionIndex:", objc_msgSend(v7, "section")) != 2)
  {
    -[PXFeedbackFormUIViewController _feedbackKeyForIndexPath:](self, "_feedbackKeyForIndexPath:", v7);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    PXLocalizedStringFromTable(v24, CFSTR("PXFeedbackCollection"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("SwitchCell"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("SwitchCell"));
      objc_msgSend(v8, "textLabel");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setText:", v25);

      objc_msgSend(v8, "setSelected:", -[PXFeedbackFormUIViewController _isSelectedRow:inSection:](self, "_isSelectedRow:inSection:", v24, objc_msgSend(v7, "section")));
    }
    -[PXFeedbackFormUIViewController _markCell:asSelected:](self, "_markCell:asSelected:", v8, -[PXFeedbackFormUIViewController _isSelectedRow:inSection:](self, "_isSelectedRow:inSection:", v24, objc_msgSend(v7, "section")));
    objc_msgSend(v8, "textLabel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setText:", v25);

    goto LABEL_9;
  }
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("OpenFeedbackCell"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("OpenFeedbackCell"));
    objc_msgSend(v8, "frame");
    v10 = v9;
    objc_msgSend(v8, "frame");
    v12 = v11;
    objc_msgSend(v8, "frame");
    objc_msgSend(v8, "setFrame:", v10, v12);
    if (!self->_customFeedbackTextView)
    {
      v13 = objc_alloc(MEMORY[0x1E0DC3E50]);
      objc_msgSend(v8, "frame");
      v14 = (UITextView *)objc_msgSend(v13, "initWithFrame:");
      customFeedbackTextView = self->_customFeedbackTextView;
      self->_customFeedbackTextView = v14;

      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextView setTextColor:](self->_customFeedbackTextView, "setTextColor:", v16);

      -[UITextView setKeyboardType:](self->_customFeedbackTextView, "setKeyboardType:", 0);
      -[UITextView setReturnKeyType:](self->_customFeedbackTextView, "setReturnKeyType:", 0);
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextView setBackgroundColor:](self->_customFeedbackTextView, "setBackgroundColor:", v17);

      -[UITextView setDelegate:](self->_customFeedbackTextView, "setDelegate:", self);
      objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 15.0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextView setFont:](self->_customFeedbackTextView, "setFont:", v18);

      -[UITextView setUserInteractionEnabled:](self->_customFeedbackTextView, "setUserInteractionEnabled:", 1);
      v19 = objc_alloc(MEMORY[0x1E0DC3E68]);
      v20 = (void *)objc_msgSend(v19, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      objc_msgSend(v20, "sizeToFit");
      objc_msgSend(v20, "setBarStyle:", 0);
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
      v31[0] = v21;
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__handleDoneButtonWasPressedOnCustomFeedbackView);
      v31[1] = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setItems:", v23);

      -[UITextView setInputAccessoryView:](self->_customFeedbackTextView, "setInputAccessoryView:", v20);
    }
    objc_msgSend(v8, "contentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addSubview:", self->_customFeedbackTextView);
LABEL_9:

  }
  objc_msgSend(v8, "textLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setNumberOfLines:", 0);

  objc_msgSend(v8, "textLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setLineBreakMode:", 0);

  objc_msgSend(v8, "setSelectionStyle:", 0);
  return v8;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;

  v6 = a3;
  if (-[PXFeedbackFormUIViewController _feedbackFormSectionForSectionIndex:](self, "_feedbackFormSectionForSectionIndex:", objc_msgSend(a4, "section")) == 2)
  {
    v7 = 500.0;
  }
  else
  {
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("SwitchCell"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("SwitchCell"));
      objc_msgSend(v8, "textLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setLineBreakMode:", 0);

      objc_msgSend(v8, "textLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setNumberOfLines:", 0);

      objc_msgSend(v8, "setSelectionStyle:", 0);
    }
    objc_msgSend(v8, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0DC4FF8], *(double *)(MEMORY[0x1E0DC4FF8] + 8));
    v13 = v12;

    v7 = v13 + 10.0;
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  _BOOL4 v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v6 = a4;
  objc_msgSend(a3, "cellForRowAtIndexPath:", v6);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[PXFeedbackFormUIViewController _feedbackKeyForIndexPath:](self, "_feedbackKeyForIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PXFeedbackFormUIViewController _isSelectedRow:inSection:](self, "_isSelectedRow:inSection:", v7, objc_msgSend(v6, "section"));
  v9 = objc_msgSend(v6, "section");

  if (v8)
  {
    -[PXFeedbackFormUIViewController _setSelectionStateForKey:inSection:to:](self, "_setSelectionStateForKey:inSection:to:", v7, v9, 0);
    objc_msgSend(v13, "setSelected:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "textLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTextColor:", v10);
    v12 = 0;
  }
  else
  {
    -[PXFeedbackFormUIViewController _setSelectionStateForKey:inSection:to:](self, "_setSelectionStateForKey:inSection:to:", v7, v9, 1);
    objc_msgSend(v13, "setSelected:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.298039216, 0.631372549, 1.0, 1.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "textLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTextColor:", v10);
    v12 = 3;
  }

  objc_msgSend(v13, "setAccessoryType:", v12);
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v4;
  id v5;

  v4 = a4;
  if (objc_msgSend(v4, "section") == 2)
    v5 = 0;
  else
    v5 = v4;

  return v5;
}

- (void)_handleDoneButtonWasPressedOnCustomFeedbackView
{
  -[UITextView resignFirstResponder](self->_customFeedbackTextView, "resignFirstResponder");
}

- (BOOL)_isSelectedRow:(id)a3 inSection:(int64_t)a4
{
  id v6;
  int64_t v7;
  int *v8;
  void *v9;
  char v10;

  v6 = a3;
  v7 = -[PXFeedbackFormUIViewController _feedbackFormSectionForSectionIndex:](self, "_feedbackFormSectionForSectionIndex:", a4);
  v8 = &OBJC_IVAR___PXFeedbackFormUIViewController__negativeFeedbackValues;
  if (!v7)
    v8 = &OBJC_IVAR___PXFeedbackFormUIViewController__positiveFeedbackValues;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v8), "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "BOOLValue");
  return v10;
}

- (void)_setSelectionStateForKey:(id)a3 inSection:(int64_t)a4 to:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  int64_t v9;
  uint64_t v10;
  int *v11;
  id v12;

  v5 = a5;
  v8 = a3;
  v9 = -[PXFeedbackFormUIViewController _feedbackFormSectionForSectionIndex:](self, "_feedbackFormSectionForSectionIndex:", a4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v10 = objc_claimAutoreleasedReturnValue();
  v12 = (id)v10;
  v11 = &OBJC_IVAR___PXFeedbackFormUIViewController__negativeFeedbackValues;
  if (!v9)
    v11 = &OBJC_IVAR___PXFeedbackFormUIViewController__positiveFeedbackValues;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v11), "setObject:forKeyedSubscript:", v10, v8);

}

- (id)_feedbackKeyForIndexPath:(id)a3
{
  id v4;
  int64_t v5;
  int *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  v5 = -[PXFeedbackFormUIViewController _feedbackFormSectionForSectionIndex:](self, "_feedbackFormSectionForSectionIndex:", objc_msgSend(v4, "section"));
  v6 = &OBJC_IVAR___PXFeedbackFormUIViewController__negativeFeedbackKeys;
  if (!v5)
    v6 = &OBJC_IVAR___PXFeedbackFormUIViewController__positiveFeedbackKeys;
  v7 = *(Class *)((char *)&self->super.super.super.isa + *v6);
  v8 = objc_msgSend(v4, "row");

  objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_markCell:(id)a3 asSelected:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a4;
  v5 = a3;
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "setAccessoryType:", 3);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.298039216, 0.631372549, 1.0, 1.0);
  }
  else
  {
    objc_msgSend(v5, "setAccessoryType:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  }
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setTextColor:", v8);
}

- (int64_t)_feedbackFormSectionForSectionIndex:(int64_t)a3
{
  if (self->_wantsPositiveFeedbackSection)
    return a3;
  else
    return a3 + 1;
}

- (UITableViewController)tableViewController
{
  return self->_tableViewController;
}

- (void)setTableViewController:(id)a3
{
  objc_storeStrong((id *)&self->_tableViewController, a3);
}

- (PXFeedbackFormDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_tableViewController, 0);
  objc_storeStrong((id *)&self->_customFeedbackTextView, 0);
  objc_storeStrong((id *)&self->_negativeFeedbackValues, 0);
  objc_storeStrong((id *)&self->_negativeFeedbackKeys, 0);
  objc_storeStrong((id *)&self->_positiveFeedbackValues, 0);
  objc_storeStrong((id *)&self->_positiveFeedbackKeys, 0);
}

@end
