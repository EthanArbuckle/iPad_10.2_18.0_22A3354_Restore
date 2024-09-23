@implementation MeCardShortcutViewController

- (MeCardShortcutViewController)initWithShortcutEditSession:(id)a3
{
  id v5;
  MeCardShortcutViewController *v6;
  MeCardShortcutViewController *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MeCardShortcutViewController;
  v6 = -[MeCardShortcutViewController initWithNibName:bundle:](&v11, "initWithNibName:bundle:", 0, 0);
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v6, "cardPresentationController"));
    objc_msgSend(v8, "setPresentedModally:", 1);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v7, "cardPresentationController"));
    objc_msgSend(v9, "setTakesAvailableHeight:", 1);

    objc_storeStrong((id *)&v7->_shortcutEditSession, a3);
  }

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  OverridenBackgroundColorButton *v7;
  OverridenBackgroundColorButton *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  ModalCardHeaderView *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  ModalCardHeaderView *v28;
  AutoLayoutScrollView *v29;
  void *v30;
  ModalCardHeaderView *v31;
  AutoLayoutScrollView *v32;
  ModalCardHeaderView *v33;
  void *v34;
  ModalCardHeaderView *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  AutoLayoutScrollView *v42;
  double v43;
  void *v44;
  NSLayoutConstraint *v45;
  NSLayoutConstraint *contactCardButtonHeightConstraint;
  double v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  OverridenBackgroundColorButton *v69;
  ModalCardHeaderView *v70;
  void *v71;
  AutoLayoutScrollView *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  MeCardShortcutViewController *v87;
  id v88;
  void *v89;
  id v90;
  void *v91;
  id v92;
  void *v93;
  objc_super v94;
  _QWORD v95[11];
  NSLayoutConstraint *v96;

  v94.receiver = self;
  v94.super_class = (Class)MeCardShortcutViewController;
  -[ContaineeViewController viewDidLoad](&v94, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MeCardShortcutViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  if (sub_1002A8AA0(self) == 5)
    v7 = objc_alloc_init(OverridenBackgroundColorButton);
  else
    v7 = +[OverridenBackgroundColorButton newChromeBlueButton](OverridenBackgroundColorButton, "newChromeBlueButton");
  v8 = v7;
  -[OverridenBackgroundColorButton setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("[Shortcut] Open My Contact Card"), CFSTR("localized string not found"), 0));
  -[OverridenBackgroundColorButton setTitle:forState:](v8, "setTitle:forState:", v10, 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OverridenBackgroundColorButton titleLabel](v8, "titleLabel"));
  objc_msgSend(v11, "setNumberOfLines:", 2);

  -[OverridenBackgroundColorButton addTarget:action:forControlEvents:](v8, "addTarget:action:forControlEvents:", self, "_doneAction:", 0x2000);
  objc_msgSend(v6, "addSubview:", v8);
  objc_storeStrong((id *)&self->_contactCardButton, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MeCardShortcutViewController traitCollection](self, "traitCollection"));
  v92 = objc_msgSend(v12, "userInterfaceIdiom");

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MeCardShortcutViewController traitCollection](self, "traitCollection"));
  if (objc_msgSend(v13, "userInterfaceIdiom") == (id)5)
    v14 = 17.0;
  else
    v14 = 0.0;

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MeCardShortcutViewController traitCollection](self, "traitCollection"));
  v90 = objc_msgSend(v15, "userInterfaceIdiom");

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MeCardShortcutViewController traitCollection](self, "traitCollection"));
  v88 = objc_msgSend(v16, "userInterfaceIdiom");

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[OverridenBackgroundColorButton layer](v8, "layer"));
  objc_msgSend(v17, "setCornerRadius:", 7.5);

  v18 = sub_1002A8AA0(self);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[OverridenBackgroundColorButton titleLabel](v8, "titleLabel"));
  v20 = v19;
  v21 = v6;
  v87 = self;
  if (v18 == 5)
  {
    objc_msgSend(v19, "setTextAlignment:", 4);

    -[OverridenBackgroundColorButton setContentHorizontalAlignment:](v8, "setContentHorizontalAlignment:", 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _maps_keyColor](UIColor, "_maps_keyColor"));
    -[OverridenBackgroundColorButton setTitleColor:forState:](v8, "setTitleColor:forState:", v22, 0);

    v23 = (ModalCardHeaderView *)objc_alloc_init((Class)UILabel);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("[Shortcut] Set up your Contact Card"), CFSTR("localized string not found"), 0));
    -[ModalCardHeaderView setText:](v23, "setText:", v25);

    -[ModalCardHeaderView setTranslatesAutoresizingMaskIntoConstraints:](v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v21, "addSubview:", v23);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[ModalCardHeaderView setTextColor:](v23, "setTextColor:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system20Semibold](UIFont, "system20Semibold"));
    -[ModalCardHeaderView setFont:](v23, "setFont:", v27);

    v28 = v23;
    -[ModalCardHeaderView setNumberOfLines:](v23, "setNumberOfLines:", 0);
    v29 = (AutoLayoutScrollView *)objc_alloc_init((Class)UIView);
    -[AutoLayoutScrollView setTranslatesAutoresizingMaskIntoConstraints:](v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v21, "addSubview:", v29);
    objc_storeStrong((id *)&self->_meCardContainerView, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[MeCardShortcutViewController view](self, "view"));
    v31 = (ModalCardHeaderView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "widthAnchor"));
    v32 = (AutoLayoutScrollView *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView constraintEqualToConstant:](v31, "constraintEqualToConstant:", v14 + v14 + 256.0));
    -[AutoLayoutScrollView setActive:](v32, "setActive:", 1);
  }
  else
  {
    objc_msgSend(v19, "setTextAlignment:", 1);

    v33 = [ModalCardHeaderView alloc];
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[ModalCardHeaderConfiguration leadingAlignedTitleModalCardHeaderConfiguration](ModalCardHeaderConfiguration, "leadingAlignedTitleModalCardHeaderConfiguration"));
    v35 = -[ModalCardHeaderView initWithConfiguration:](v33, "initWithConfiguration:", v34);

    -[ModalCardHeaderView setUseAdaptiveFont:](v35, "setUseAdaptiveFont:", 1);
    -[ModalCardHeaderView setTranslatesAutoresizingMaskIntoConstraints:](v35, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("[Shortcut] Set up Contact Card"), CFSTR("localized string not found"), 0));
    -[ModalCardHeaderView setTitle:](v35, "setTitle:", v37);

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView trailingButton](v35, "trailingButton"));
    v39 = sub_1009A992C();
    v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
    objc_msgSend(v38, "setTitle:forState:", v40, 0);

    v41 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView trailingButton](v35, "trailingButton"));
    objc_msgSend(v41, "addTarget:action:forControlEvents:", self, "_close", 0x2000);

    objc_msgSend(v5, "addSubview:", v35);
    objc_storeStrong((id *)&self->_modalHeaderView, v35);
    v31 = v35;
    v42 = -[AutoLayoutScrollView initWithFrame:]([AutoLayoutScrollView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    LODWORD(v43) = 1148846080;
    -[AutoLayoutScrollView setContentOverflowCompressionPriority:forAxis:](v42, "setContentOverflowCompressionPriority:forAxis:", 0, v43);
    -[AutoLayoutScrollView setTranslatesAutoresizingMaskIntoConstraints:](v42, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v6, "addSubview:", v42);
    objc_storeStrong((id *)&self->_scrollView, v42);
    v32 = v42;
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[OverridenBackgroundColorButton heightAnchor](v8, "heightAnchor"));
    v45 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToConstant:", 0.0));
    contactCardButtonHeightConstraint = self->_contactCardButtonHeightConstraint;
    self->_contactCardButtonHeightConstraint = v45;

    v96 = self->_contactCardButtonHeightConstraint;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v96, 1));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v30);
    v29 = v32;
    v28 = v31;
  }
  v70 = v28;
  v72 = v29;

  if (v88 == (id)5)
    v47 = 7.0;
  else
    v47 = 10.0;
  if (v90 == (id)5)
    v48 = 14.0;
  else
    v48 = 0.0;
  if (v92 == (id)5)
    v49 = 13.0;
  else
    v49 = 0.0;
  v93 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView topAnchor](v28, "topAnchor"));
  v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
  v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "constraintEqualToAnchor:constant:", v91, v49));
  v95[0] = v89;
  v86 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView leadingAnchor](v28, "leadingAnchor"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "constraintEqualToAnchor:constant:", v85, v14));
  v95[1] = v84;
  v83 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView trailingAnchor](v28, "trailingAnchor"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "constraintEqualToAnchor:constant:", v82, -v14));
  v95[2] = v81;
  v80 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView bottomAnchor](v28, "bottomAnchor"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bottomAnchor"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "constraintEqualToAnchor:constant:", v79, -v48));
  v95[3] = v78;
  v77 = (void *)objc_claimAutoreleasedReturnValue(-[AutoLayoutScrollView topAnchor](v29, "topAnchor"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "topAnchor"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "constraintEqualToAnchor:", v76));
  v95[4] = v75;
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[AutoLayoutScrollView leadingAnchor](v29, "leadingAnchor"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "leadingAnchor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "constraintEqualToAnchor:", v71));
  v95[5] = v67;
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[AutoLayoutScrollView trailingAnchor](v29, "trailingAnchor"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "trailingAnchor"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintEqualToAnchor:", v65));
  v95[6] = v64;
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[AutoLayoutScrollView bottomAnchor](v29, "bottomAnchor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[OverridenBackgroundColorButton topAnchor](v8, "topAnchor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "constraintEqualToAnchor:constant:", v62, -v47));
  v95[7] = v61;
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[OverridenBackgroundColorButton bottomAnchor](v8, "bottomAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "safeAreaLayoutGuide"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "bottomAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToAnchor:constant:", v51, -10.0));
  v95[8] = v52;
  v69 = v8;
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[OverridenBackgroundColorButton leadingAnchor](v8, "leadingAnchor"));
  v74 = v5;
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "leadingAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:constant:", v54, 16.0));
  v95[9] = v55;
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[OverridenBackgroundColorButton trailingAnchor](v8, "trailingAnchor"));
  v68 = v21;
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "trailingAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToAnchor:constant:", v57, -16.0));
  v95[10] = v58;
  v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v95, 11));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v59);

  -[MeCardShortcutViewController _buildContent](v87, "_buildContent");
}

- (void)_updatePreferredContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;

  if (sub_1002A8AA0(self) == 5)
  {
    -[MeCardShortcutViewController preferredContentSize](self, "preferredContentSize");
    v4 = v3;
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MeCardShortcutViewController view](self, "view"));
    objc_msgSend(v7, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
    v9 = v8;
    v11 = v10;

    if (v4 != v9 || v6 != v11)
      -[MeCardShortcutViewController setPreferredContentSize:](self, "setPreferredContentSize:", v9, v11);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  id WeakRetained;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MeCardShortcutViewController;
  -[MeCardShortcutViewController viewDidAppear:](&v6, "viewDidAppear:", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_sessionController);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "meCardContact"));
  -[MeCardShortcutView setContact:](self->_meCardAvatar, "setContact:", v5);

}

- (UIButton)contactCardButton
{
  return (UIButton *)self->_contactCardButton;
}

- (void)updateContact
{
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_sessionController);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "meCardContact"));
  -[MeCardShortcutView setContact:](self->_meCardAvatar, "setContact:", v3);

}

- (id)shortcut
{
  return -[ShortcutEditSession shortcut](self->_shortcutEditSession, "shortcut");
}

- (BOOL)_isMapUserShortcut
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MeCardShortcutViewController shortcut](self, "shortcut"));
  v3 = objc_msgSend(v2, "type") == (id)1;

  return v3;
}

- (void)_buildContent
{
  UIView *v3;
  UIView *v4;
  MeCardShortcutView *v5;
  MeCardShortcutViewController *v6;
  id WeakRetained;
  void *v8;
  MeCardShortcutView *v9;
  MeCardShortcutView *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  MeCardShortcutViewController *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
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
  UIView *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  MeCardShortcutView *v62;
  void *v63;
  MeCardShortcutViewController *v64;
  _QWORD v65[10];

  if (sub_1002A8AA0(self) == 5)
    v3 = self->_meCardContainerView;
  else
    v3 = (UIView *)objc_claimAutoreleasedReturnValue(-[AutoLayoutScrollView contentView](self->_scrollView, "contentView"));
  v4 = v3;
  v5 = [MeCardShortcutView alloc];
  v6 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_sessionController);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "meCardContact"));
  v9 = -[MeCardShortcutView initWithContact:](v5, "initWithContact:", v8);

  -[MeCardShortcutView setTranslatesAutoresizingMaskIntoConstraints:](v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](v4, "addSubview:", v9);
  v10 = v9;
  objc_storeStrong((id *)&v6->_meCardAvatar, v9);
  v11 = objc_alloc_init((Class)UILabel);
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](v4, "addSubview:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("[Shortcut] Contact Card title"), CFSTR("localized string not found"), 0));
  objc_msgSend(v11, "setText:", v13);

  objc_msgSend(v11, "setNumberOfLines:", 0);
  objc_storeStrong((id *)&v6->_titleLabel, v11);
  v14 = objc_alloc_init((Class)UILabel);
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](v4, "addSubview:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("[Shortcut] Contact Card Update"), CFSTR("localized string not found"), 0));
  objc_msgSend(v14, "setText:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  objc_msgSend(v14, "setTextColor:", v17);

  objc_msgSend(v14, "setNumberOfLines:", 0);
  v18 = v6;
  objc_storeStrong((id *)&v6->_subtitleLabel, v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MeCardShortcutViewController traitCollection](v6, "traitCollection"));
  v20 = objc_msgSend(v19, "userInterfaceIdiom");

  v64 = v6;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MeCardShortcutViewController traitCollection](v6, "traitCollection"));
  v22 = objc_msgSend(v21, "userInterfaceIdiom");

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MeCardShortcutViewController traitCollection](v6, "traitCollection"));
  v24 = objc_msgSend(v23, "userInterfaceIdiom");

  if (sub_1002A8AA0(v18) == 5)
    v25 = 4;
  else
    v25 = 1;
  objc_msgSend(v11, "setTextAlignment:", v25);
  objc_msgSend(v14, "setTextAlignment:", v25);
  if (v24 == (id)5)
    v26 = 14.0;
  else
    v26 = 10.0;
  if (v22 == (id)5)
    v27 = 4.0;
  else
    v27 = 10.0;
  if (v20 == (id)5)
    v28 = 17.0;
  else
    v28 = 24.0;
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[MeCardShortcutView topAnchor](v10, "topAnchor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v4, "topAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "constraintEqualToAnchor:", v61));
  v65[0] = v60;
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[MeCardShortcutView leadingAnchor](v10, "leadingAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v4, "leadingAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "constraintEqualToAnchor:", v58));
  v65[1] = v57;
  v62 = v10;
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[MeCardShortcutView trailingAnchor](v10, "trailingAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v4, "trailingAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToAnchor:", v54));
  v65[2] = v53;
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[MeCardShortcutView bottomAnchor](v10, "bottomAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:constant:", v51, v26));
  v65[3] = v50;
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "leadingAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v4, "leadingAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:constant:", v47, v28));
  v65[4] = v46;
  v55 = v11;
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "trailingAnchor"));
  v49 = v4;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v4, "trailingAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:constant:", v44, -v28));
  v65[5] = v43;
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "topAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:constant:", v41, v27));
  v65[6] = v40;
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "leadingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v4, "leadingAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:constant:", v29, v28));
  v65[7] = v30;
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "trailingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v4, "trailingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32, -v28));
  v65[8] = v33;
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bottomAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v4, "bottomAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintLessThanOrEqualToAnchor:", v35));
  v65[9] = v36;
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v65, 10));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v37);

  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v38, "addObserver:selector:name:object:", v64, "_contentSizeCategoryDidChange:", UIContentSizeCategoryDidChangeNotification, 0);

  -[MeCardShortcutViewController _updateFonts](v64, "_updateFonts");
  -[MeCardShortcutViewController _updatePreferredContentSize](v64, "_updatePreferredContentSize");

}

- (void)_updateFonts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (sub_1002A8AA0(self) == 5)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17Tall](UIFont, "system17Tall"));
    -[UILabel setFont:](self->_titleLabel, "setFont:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17Tall](UIFont, "system17Tall"));
    -[UILabel setFont:](self->_subtitleLabel, "setFont:", v4);

    v10 = (id)objc_claimAutoreleasedReturnValue(+[UIFont system17Tall](UIFont, "system17Tall"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[OverridenBackgroundColorButton titleLabel](self->_contactCardButton, "titleLabel"));
    objc_msgSend(v5, "setFont:", v10);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17Bold](UIFont, "system17Bold"));
    -[UILabel setFont:](self->_titleLabel, "setFont:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system15](UIFont, "system15"));
    -[UILabel setFont:](self->_subtitleLabel, "setFont:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system15Bold](UIFont, "system15Bold"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[OverridenBackgroundColorButton titleLabel](self->_contactCardButton, "titleLabel"));
    objc_msgSend(v9, "setFont:", v8);

    v10 = (id)objc_claimAutoreleasedReturnValue(-[OverridenBackgroundColorButton titleLabel](self->_contactCardButton, "titleLabel"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "font"));
    objc_msgSend(v5, "_mapkit_scaledValueForValue:", 54.0);
    -[NSLayoutConstraint setConstant:](self->_contactCardButtonHeightConstraint, "setConstant:");
  }

}

- (void)_close
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MeCardShortcutViewController sessionController](self, "sessionController"));
  objc_msgSend(v3, "closeViewController:", self);

}

- (void)_doneAction:(id)a3
{
  void *v4;
  unsigned int v5;
  id WeakRetained;
  OverridenBackgroundColorButton *contactCardButton;
  id v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[AddressBookManager sharedManager](AddressBookManager, "sharedManager", a3));
  v5 = objc_msgSend(v4, "meCardExists");

  WeakRetained = objc_loadWeakRetained((id *)&self->_sessionController);
  contactCardButton = self->_contactCardButton;
  v8 = WeakRetained;
  if (v5)
    objc_msgSend(WeakRetained, "showMeCardWithAddress:from:", 0, contactCardButton);
  else
    objc_msgSend(WeakRetained, "presentChoicePickerFrom:", contactCardButton);

}

- (ShortcutEditSessionController)sessionController
{
  return (ShortcutEditSessionController *)objc_loadWeakRetained((id *)&self->_sessionController);
}

- (void)setSessionController:(id)a3
{
  objc_storeWeak((id *)&self->_sessionController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sessionController);
  objc_storeStrong((id *)&self->_meCardAvatar, 0);
  objc_storeStrong((id *)&self->_contactCardButtonHeightConstraint, 0);
  objc_storeStrong((id *)&self->_contactCardButton, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_meCardContainerView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_shortcutEditSession, 0);
  objc_storeStrong((id *)&self->_modalHeaderView, 0);
}

@end
