@implementation PXFeedbackLikeItOrNotComboUIViewController

- (PXFeedbackLikeItOrNotComboUIViewController)initWithDelegate:(id)a3
{
  id v4;
  PXFeedbackLikeItOrNotComboUIViewController *v5;
  PXFeedbackLikeItOrNotComboUIViewController *v6;
  uint64_t v7;
  UIActivityIndicatorView *activityIndicatorView;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXFeedbackLikeItOrNotComboUIViewController;
  v5 = -[PXFeedbackLikeItOrNotComboUIViewController init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    -[PXFeedbackLikeItOrNotComboUIViewController setDelegate:](v5, "setDelegate:", v4);
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    activityIndicatorView = v6->__activityIndicatorView;
    v6->__activityIndicatorView = (UIActivityIndicatorView *)v7;

    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](v6->__activityIndicatorView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  }

  return v6;
}

- (void)_likedIt:(id)a3
{
  id v3;

  -[PXFeedbackLikeItOrNotComboUIViewController delegate](self, "delegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userIndicatedLike");

}

- (void)_dislikedIt:(id)a3
{
  id v3;

  -[PXFeedbackLikeItOrNotComboUIViewController delegate](self, "delegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userIndicatedDislike");

}

- (void)_doFileRadar:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v4 = a3;
  -[PXFeedbackLikeItOrNotComboUIViewController setShowsActivityIndicator:](self, "setShowsActivityIndicator:", 1);
  -[PXFeedbackLikeItOrNotComboUIViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInteractionEnabled:", 0);

  -[PXFeedbackLikeItOrNotComboUIViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__PXFeedbackLikeItOrNotComboUIViewController__doFileRadar___block_invoke;
  v7[3] = &unk_1E5148600;
  v7[4] = self;
  +[PXFeedbackTapToRadarRequestHandler fileRadarFromSourceView:viewTitleForRadar:completionHandler:](PXFeedbackTapToRadarRequestHandler, "fileRadarFromSourceView:viewTitleForRadar:completionHandler:", v6, v4, v7);

}

- (void)_fileRadar:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  PXFeedbackLikeItOrNotComboUIViewController *v18;
  id v19;
  uint64_t *v20;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v4 = a3;
  -[PXFeedbackLikeItOrNotComboUIViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewTitleForRadar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __57__PXFeedbackLikeItOrNotComboUIViewController__fileRadar___block_invoke;
  v21[3] = &unk_1E511B708;
  v21[4] = &v22;
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, v21);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0DC3448];
  v14 = v7;
  v15 = 3221225472;
  v16 = __57__PXFeedbackLikeItOrNotComboUIViewController__fileRadar___block_invoke_2;
  v17 = &unk_1E511B730;
  v20 = &v22;
  v18 = self;
  v10 = v6;
  v19 = v10;
  objc_msgSend(v9, "actionWithTitle:style:handler:", CFSTR("OK"), 0, &v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!*((_BYTE *)v23 + 24))
  {
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Note"), CFSTR("This will take a snapshot of the details of your Photo Library (such as names and locations, but no actual assets).\nBy submitting this feedback you agree to share the details of snapshot with Apple.\nThis may take a few minutes..."), 1, v14, v15, v16, v17, v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addAction:", v8);
    objc_msgSend(v12, "addAction:", v11);
    -[PXFeedbackLikeItOrNotComboUIViewController navigationController](self, "navigationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "presentViewController:animated:completion:", v12, 1, 0);

  }
  _Block_object_dispose(&v22, 8);

}

- (void)showMoreFeedbackForm
{
  -[PXFeedbackLikeItOrNotComboUIViewController _provideFeedback:](self, "_provideFeedback:", 0);
}

- (void)_provideFeedback:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  PXFeedbackFormUIViewController *v10;
  void *v11;
  PXFeedbackFormUIViewController *v12;
  void *v13;
  id v14;

  -[PXFeedbackLikeItOrNotComboUIViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "positiveFeedbackKeys");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[PXFeedbackLikeItOrNotComboUIViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "negativeFeedbackKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXFeedbackLikeItOrNotComboUIViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PXFeedbackLikeItOrNotComboUIViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "wantsCustomFeedbackSection");

  }
  else
  {
    v9 = 0;
  }

  v10 = [PXFeedbackFormUIViewController alloc];
  -[PXFeedbackLikeItOrNotComboUIViewController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PXFeedbackFormUIViewController initWithDelegate:positiveKeys:negativeKeys:wantsCustomFeedbackSection:](v10, "initWithDelegate:positiveKeys:negativeKeys:wantsCustomFeedbackSection:", v11, v14, v6, v9);

  -[PXFeedbackLikeItOrNotComboUIViewController navigationController](self, "navigationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pushViewController:animated:", v12, 1);

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
  uint64_t v26;
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
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  PXFeedbackLikeItOrNotComboUIViewController *v59;
  objc_super v60;
  _QWORD v61[2];

  v61[1] = *MEMORY[0x1E0C80C00];
  v60.receiver = self;
  v60.super_class = (Class)PXFeedbackLikeItOrNotComboUIViewController;
  -[PXFeedbackLikeItOrNotComboUIViewController viewDidLoad](&v60, sel_viewDidLoad);
  PXLocalizedStringFromTable(CFSTR("FeedbackLikeItOrNotViewController.title"), CFSTR("PXFeedbackCollection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFeedbackLikeItOrNotComboUIViewController setTitle:](self, "setTitle:", v3);

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = (void *)objc_opt_new();
  -[PXFeedbackLikeItOrNotComboUIViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "longTitleText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v7);

  objc_msgSend(v5, "setNumberOfLines:", 2);
  objc_msgSend(v5, "setTextAlignment:", 1);
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 18.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v8);

  objc_msgSend(v4, "addSubview:", v5);
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v9, "addTarget:action:forControlEvents:", self, sel__likedIt_, 64);
  objc_msgSend(v9, "setTitle:forState:", CFSTR("😊"), 0);
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 64.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFont:", v10);

  objc_msgSend(v9, "tintColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitleColor:forState:", v12, 0);

  objc_msgSend(v9, "setFrame:", 80.0, 210.0, 160.0, 40.0);
  objc_msgSend(v4, "addSubview:", v9);
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v13, "addTarget:action:forControlEvents:", self, sel__dislikedIt_, 64);
  objc_msgSend(v13, "setTitle:forState:", CFSTR("😕"), 0);
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 64.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "titleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFont:", v14);

  objc_msgSend(v13, "tintColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTitleColor:forState:", v16, 0);

  objc_msgSend(v13, "setFrame:", 80.0, 210.0, 160.0, 40.0);
  objc_msgSend(v4, "addSubview:", v13);
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v17, "addTarget:action:forControlEvents:", self, sel__fileRadar_, 64);
  objc_msgSend(v17, "setTitle:forState:", CFSTR("File Radar"), 0);
  objc_msgSend(v17, "tintColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTitleColor:forState:", v18, 0);

  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 18.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "titleLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFont:", v19);

  objc_msgSend(v17, "titleLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTextAlignment:", 1);

  objc_msgSend(v17, "titleLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setLineBreakMode:", 0);

  objc_msgSend(v4, "addSubview:", v17);
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v23, "addTarget:action:forControlEvents:", self, sel__provideFeedback_, 64);
  objc_msgSend(v23, "setTitle:forState:", CFSTR("More Feedback"), 0);
  objc_msgSend(v23, "tintColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setTitleColor:forState:", v24, 0);

  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 18.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "titleLabel");
  v26 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v26, "setFont:", v25);

  objc_msgSend(v23, "titleLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setTextAlignment:", 1);

  objc_msgSend(v23, "titleLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setLineBreakMode:", 0);

  objc_msgSend(v4, "addSubview:", v23);
  v59 = self;
  -[PXFeedbackLikeItOrNotComboUIViewController delegate](self, "delegate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v26) = objc_msgSend(v29, "shouldDisplaySecondaryFeedbackButtons");

  if ((v26 & 1) == 0)
  {
    objc_msgSend(v17, "setHidden:", 1);
    objc_msgSend(v23, "setHidden:", 1);
  }
  _NSDictionaryOfVariableBindings(CFSTR("label, yesButton, noButton,fileRadarButton,provideFeedbackButton"), v5, v9, v13, v17, v23, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, 3, 0, v4, 10, 1.0, -100.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addConstraint:", v31);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, 9, 0, v4, 9, 1.0, 0.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addConstraint:", v32);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9, 2, -1, v4, 9, 1.0, -20.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addConstraint:", v33);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v13, 1, -1, v4, 9, 1.0, 20.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addConstraint:", v34);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[label]-(50)-[yesButton]"), 0, &unk_1E53EFFD0, v30);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addConstraints:", v35);
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[label]-(50)-[noButton]"), 0, &unk_1E53EFFF8, v30);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addConstraints:", v36);
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[noButton]-(>=50)-[fileRadarButton(>=20)]"), 0, &unk_1E53F0020, v30);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addConstraints:", v37);
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[yesButton]-(>=50)-[provideFeedbackButton(>=20)]"), 0, &unk_1E53F0048, v30);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addConstraints:", v38);
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[fileRadarButton(>=20)]-(>=10)-[provideFeedbackButton(>=20)]-|"), 0, &unk_1E53F0070, v30);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addConstraints:", v39);
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v17, 4, 0, v4, 4, 1.0, -50.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addConstraint:", v40);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v23, 4, 0, v17, 4, 1.0, 0.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addConstraint:", v41);

  -[PXFeedbackLikeItOrNotComboUIViewController view](v59, "view");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setBackgroundColor:", v43);

  objc_msgSend(v42, "addSubview:", v4);
  _NSDictionaryOfVariableBindings(CFSTR("topContainerView"), v4, 0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[topContainerView]-|"), 0, 0, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addConstraints:", v45);
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-[topContainerView]-|"), 0, 0, v44);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v42, "addConstraints:", v46);
  -[PXFeedbackLikeItOrNotComboUIViewController _activityIndicatorView](v59, "_activityIndicatorView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addSubview:", v47);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (void *)MEMORY[0x1E0CB3718];
  -[PXFeedbackLikeItOrNotComboUIViewController _activityIndicatorView](v59, "_activityIndicatorView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v50, 9, 0, v42, 9, 1.0, 0.0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addObject:", v51);

  v52 = (void *)MEMORY[0x1E0CB3718];
  -[PXFeedbackLikeItOrNotComboUIViewController _activityIndicatorView](v59, "_activityIndicatorView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v53, 10, 0, v42, 10, 1.0, 0.0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addObject:", v54);

  objc_msgSend(v42, "addConstraints:", v48);
  PXLocalizedStringFromTable(CFSTR("FeedbackCollectionPanel.cancelButton.title"), CFSTR("PXFeedbackCollection"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", v55, 0, v59, sel_cancelFeedback_);
  v61[0] = v56;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 1);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFeedbackLikeItOrNotComboUIViewController navigationItem](v59, "navigationItem");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setLeftBarButtonItems:", v57);

}

- (void)setShowsActivityIndicator:(BOOL)a3
{
  UIActivityIndicatorView *activityIndicatorView;
  void *v4;
  id v5;

  activityIndicatorView = self->__activityIndicatorView;
  if (a3)
    -[UIActivityIndicatorView startAnimating](activityIndicatorView, "startAnimating");
  else
    -[UIActivityIndicatorView stopAnimating](activityIndicatorView, "stopAnimating");
  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.00999999978);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "runUntilDate:", v4);

}

- (void)cancelFeedback:(id)a3
{
  -[PXFeedbackLikeItOrNotComboUIViewController finishWithSuccess:](self, "finishWithSuccess:", 0);
}

- (void)finishWithSuccess:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  id v7;

  v3 = a3;
  -[PXFeedbackLikeItOrNotComboUIViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[PXFeedbackLikeItOrNotComboUIViewController delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "userDidFinish:", v3);

  }
  else
  {
    -[PXFeedbackLikeItOrNotComboUIViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }
}

- (PXFeedbackFormDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (UIActivityIndicatorView)_activityIndicatorView
{
  return self->__activityIndicatorView;
}

- (BOOL)_showsActivityIndicator
{
  return self->__showsActivityIndicator;
}

- (void)set_showsActivityIndicator:(BOOL)a3
{
  self->__showsActivityIndicator = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

uint64_t __57__PXFeedbackLikeItOrNotComboUIViewController__fileRadar___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

uint64_t __57__PXFeedbackLikeItOrNotComboUIViewController__fileRadar___block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_doFileRadar:", *(_QWORD *)(a1 + 40));
}

void __59__PXFeedbackLikeItOrNotComboUIViewController__doFileRadar___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setShowsActivityIndicator:", 0);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", 1);

  v4 = v12;
  if (v12)
  {
    objc_msgSend(v12, "description");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error Code = %ld"), objc_msgSend(v12, "code"));
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;

    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Error while capturing metadata"), v8, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("OK"), 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAction:", v10);

    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "presentViewController:animated:completion:", v9, 1, 0);

    v4 = v12;
  }

}

@end
