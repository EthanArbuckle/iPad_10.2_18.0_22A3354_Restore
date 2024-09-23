@implementation PXPeopleConfirmationSummaryViewController

- (PXPeopleConfirmationSummaryViewController)initWithDelegate:(id)a3
{
  id v5;
  PXPeopleConfirmationSummaryViewController *v6;
  void *v7;
  void *v8;
  id v9;
  void *v11;
  objc_super v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PXPeopleConfirmationSummaryViewController;
  v6 = -[PXPeopleConfirmationSummaryViewController init](&v12, sel_init);
  if (v6)
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("PXPeopleConfirmationSummaryViewController.m"), 42, CFSTR("summary delegate must not be nil"));

    }
    objc_storeWeak((id *)&v6->_delegate, v5);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel_contentSizeCategoryDidChangeNotification_, *MEMORY[0x1E0DC48E8], 0);

    v13[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)-[PXPeopleConfirmationSummaryViewController registerForTraitChanges:withAction:](v6, "registerForTraitChanges:withAction:", v8, sel_traitEnvironment_didChangeTraitCollection_);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC48E8], 0);

  v4.receiver = self;
  v4.super_class = (Class)PXPeopleConfirmationSummaryViewController;
  -[PXPeopleConfirmationSummaryViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  PXPeopleScalableAvatarView *v6;
  PXPeopleScalableAvatarView *avatarView;
  PXPeopleScalableAvatarView *v8;
  UILabel *v9;
  void *v10;
  UILabel *summaryLabel;
  UILabel *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSLayoutConstraint *v21;
  NSLayoutConstraint *labelSpacingConstraint;
  NSLayoutConstraint *v23;
  void *v24;
  PXPerson *v25;
  PXPerson *person;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)PXPeopleConfirmationSummaryViewController;
  -[PXPeopleConfirmationSummaryViewController viewDidLoad](&v27, sel_viewDidLoad);
  -[PXPeopleConfirmationSummaryViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  v6 = -[PXPeopleScalableAvatarView initWithFrame:]([PXPeopleScalableAvatarView alloc], "initWithFrame:", 0.0, 0.0, 500.0, 500.0);
  avatarView = self->_avatarView;
  self->_avatarView = v6;
  v8 = v6;

  v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  -[UILabel setNumberOfLines:](v9, "setNumberOfLines:", 2);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v9, "setFont:", v10);

  -[UILabel setAdjustsFontForContentSizeCategory:](v9, "setAdjustsFontForContentSizeCategory:", 1);
  -[UILabel setTextAlignment:](v9, "setTextAlignment:", 1);
  summaryLabel = self->_summaryLabel;
  self->_summaryLabel = v9;
  v12 = v9;

  objc_msgSend(v5, "addSubview:", v8);
  objc_msgSend(v5, "addSubview:", v12);
  objc_msgSend(v3, "addSubview:", v5);
  -[PXPeopleScalableAvatarView setTranslatesAutoresizingMaskIntoConstraints:](v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  _NSDictionaryOfVariableBindings(CFSTR("avatar, summaryLabel, containerView"), v8, v12, v5, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[summaryLabel]-|"), 512, 0, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addConstraints:", v14);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[summaryLabel]-|"), 1024, 0, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addConstraints:", v15);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[containerView]|"), 1024, 0, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addConstraints:", v16);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v8, 7, 0, v8, 8, 1.0, 0.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addConstraint:", v17);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v8, 8, 0, v3, 8, 0.25, 0.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addConstraint:", v18);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, 10, 0, v3, 10, 1.0, 0.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addConstraint:", v19);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v5, 9, 0, v8, 9, 1.0, 0.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addConstraint:", v20);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v12, 11, 0, v8, 4, 1.0, 28.0);
  v21 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addConstraint:", v21);
  labelSpacingConstraint = self->_labelSpacingConstraint;
  self->_labelSpacingConstraint = v21;
  v23 = v21;

  -[PXPeopleConfirmationSummaryViewController delegate](self, "delegate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "personForSummaryViewController:", self);
  v25 = (PXPerson *)objc_claimAutoreleasedReturnValue();

  -[PXPeopleScalableAvatarView setPerson:](v8, "setPerson:", v25);
  person = self->_person;
  self->_person = v25;

  -[PXPeopleConfirmationSummaryViewController _updateDynamicTypeSpacing](self, "_updateDynamicTypeSpacing");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PXPeopleConfirmationSummaryViewController;
  -[PXPeopleConfirmationSummaryViewController viewWillAppear:](&v15, sel_viewWillAppear_, a3);
  -[PXPeopleConfirmationSummaryViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "personForSummaryViewController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "px_longStyleLocalizedName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR(" "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v4, "userConfirmedCountForSummaryViewController:", self);
  v9 = objc_msgSend(v4, "autoConfirmedCountForSummaryViewController:", self) + v8;
  v10 = objc_msgSend(v7, "length");
  -[PXPeopleConfirmationSummaryViewController summaryLabel](self, "summaryLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    PXLocalizedStringFromTable(CFSTR("PXPeopleConfirmSummaryTotalNamedMessage"), CFSTR("PhotosUICore"));
  else
    PXLocalizedStringFromTable(CFSTR("PXPeopleConfirmSummaryTotalUnnamedMessage"), CFSTR("PhotosUICore"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v9;
  PXStringWithValidatedFormat();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v13, v14);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXPeopleConfirmationSummaryViewController;
  -[PXPeopleConfirmationSummaryViewController viewDidLayoutSubviews](&v5, sel_viewDidLayoutSubviews);
  -[PXPeopleConfirmationSummaryViewController person](self, "person");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleConfirmationSummaryViewController avatarView](self, "avatarView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPerson:", v3);

}

- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  id v15;

  v15 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "displayScale");
    v9 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scale");
    v9 = v11;

  }
  -[PXPeopleConfirmationSummaryViewController traitCollection](self, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "displayScale");
  v14 = v13;

  if (v14 != v9)
    -[PXPeopleConfirmationSummaryViewController _updateDynamicTypeSpacing](self, "_updateDynamicTypeSpacing");

}

- (void)_updateDynamicTypeSpacing
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  id v7;

  -[PXPeopleConfirmationSummaryViewController summaryLabel](self, "summaryLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "font");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_scaledValueForValue:", 28.0);
  *(float *)&v4 = v4;
  v5 = ceilf(*(float *)&v4);
  -[PXPeopleConfirmationSummaryViewController labelSpacingConstraint](self, "labelSpacingConstraint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setConstant:", v5);

}

- (PXPeopleSummaryDelegate)delegate
{
  return (PXPeopleSummaryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSLayoutConstraint)labelSpacingConstraint
{
  return self->_labelSpacingConstraint;
}

- (UILabel)summaryLabel
{
  return self->_summaryLabel;
}

- (PXPeopleScalableAvatarView)avatarView
{
  return self->_avatarView;
}

- (PXPerson)person
{
  return self->_person;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_summaryLabel, 0);
  objc_storeStrong((id *)&self->_labelSpacingConstraint, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
