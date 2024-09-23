@implementation RAPMultilineAddressLabelTableViewCell

- (RAPMultilineAddressLabelTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  RAPMultilineAddressLabelTableViewCell *v4;
  RAPMultilineAddressLabelTableViewCell *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RAPMultilineAddressLabelTableViewCell;
  v4 = -[RAPMultilineAddressLabelTableViewCell initWithStyle:reuseIdentifier:](&v8, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[RAPMultilineAddressLabelTableViewCell initViews](v4, "initViews");
    -[RAPMultilineAddressLabelTableViewCell _updateFonts](v5, "_updateFonts");
    -[RAPMultilineAddressLabelTableViewCell setSelectionStyle:](v5, "setSelectionStyle:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "addObserver:selector:name:object:", v5, "_contentSizeDidChange", UIContentSizeCategoryDidChangeNotification, 0);

    v5->_editableAndTappable = 0;
  }
  return v5;
}

- (void)initViews
{
  TextViewWithPlaceholderText *v3;
  TextViewWithPlaceholderText *freeformAddressTextView;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  RAPSeparatorBar *v13;
  RAPSeparatorBar *topHorizontalHairlineView;
  UITextField *v15;
  UITextField *buildingTextField;
  RAPSeparatorBar *v17;
  RAPSeparatorBar *middleVerticalHairlineView;
  UITextField *v19;
  UITextField *floorTextField;
  RAPSeparatorBar *v21;
  RAPSeparatorBar *bottomHorizontalHairlineView;
  UITextField *v23;
  UITextField *unitTextField;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  UIView *v31;
  UIView *containerView;
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
  _QWORD v56[4];

  v3 = -[TextViewWithPlaceholderText initWithFrame:]([TextViewWithPlaceholderText alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  freeformAddressTextView = self->_freeformAddressTextView;
  self->_freeformAddressTextView = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Add Street or Address [Report an Issue]"), CFSTR("localized string not found"), 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TextViewWithPlaceholderText placeholderLabel](self->_freeformAddressTextView, "placeholderLabel"));
  objc_msgSend(v7, "setText:", v6);

  -[TextViewWithPlaceholderText setScrollEnabled:](self->_freeformAddressTextView, "setScrollEnabled:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TextViewWithPlaceholderText textContainer](self->_freeformAddressTextView, "textContainer"));
  objc_msgSend(v8, "setMaximumNumberOfLines:", 8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMultilineAddressLabelTableViewCell traitCollection](self, "traitCollection"));
  v10 = objc_msgSend(v9, "userInterfaceIdiom");

  if (v10 == (id)5)
    v11 = objc_claimAutoreleasedReturnValue(+[UIColor systemGray6Color](UIColor, "systemGray6Color"));
  else
    v11 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v12 = (void *)v11;
  -[TextViewWithPlaceholderText setBackgroundColor:](self->_freeformAddressTextView, "setBackgroundColor:", v11);

  -[TextViewWithPlaceholderText setDelegate:](self->_freeformAddressTextView, "setDelegate:", self);
  v13 = objc_alloc_init(RAPSeparatorBar);
  topHorizontalHairlineView = self->_topHorizontalHairlineView;
  self->_topHorizontalHairlineView = v13;

  v15 = (UITextField *)objc_alloc_init((Class)UITextField);
  buildingTextField = self->_buildingTextField;
  self->_buildingTextField = v15;

  v17 = objc_alloc_init(RAPSeparatorBar);
  middleVerticalHairlineView = self->_middleVerticalHairlineView;
  self->_middleVerticalHairlineView = v17;

  v19 = (UITextField *)objc_alloc_init((Class)UITextField);
  floorTextField = self->_floorTextField;
  self->_floorTextField = v19;

  v21 = objc_alloc_init(RAPSeparatorBar);
  bottomHorizontalHairlineView = self->_bottomHorizontalHairlineView;
  self->_bottomHorizontalHairlineView = v21;

  v23 = (UITextField *)objc_alloc_init((Class)UITextField);
  unitTextField = self->_unitTextField;
  self->_unitTextField = v23;

  -[TextViewWithPlaceholderText setTranslatesAutoresizingMaskIntoConstraints:](self->_freeformAddressTextView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[RAPSeparatorBar setTranslatesAutoresizingMaskIntoConstraints:](self->_topHorizontalHairlineView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UITextField setTranslatesAutoresizingMaskIntoConstraints:](self->_buildingTextField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[RAPSeparatorBar setTranslatesAutoresizingMaskIntoConstraints:](self->_middleVerticalHairlineView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UITextField setTranslatesAutoresizingMaskIntoConstraints:](self->_floorTextField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[RAPSeparatorBar setTranslatesAutoresizingMaskIntoConstraints:](self->_bottomHorizontalHairlineView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UITextField setTranslatesAutoresizingMaskIntoConstraints:](self->_unitTextField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UITextField setTextAlignment:](self->_buildingTextField, "setTextAlignment:", 0);
  -[UITextField setTextAlignment:](self->_floorTextField, "setTextAlignment:", 0);
  -[UITextField setTextAlignment:](self->_unitTextField, "setTextAlignment:", 0);
  -[UITextField setClearButtonMode:](self->_buildingTextField, "setClearButtonMode:", 1);
  -[UITextField setClearButtonMode:](self->_floorTextField, "setClearButtonMode:", 1);
  -[UITextField setClearButtonMode:](self->_unitTextField, "setClearButtonMode:", 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("Building [Report an Issue]"), CFSTR("localized string not found"), 0));
  -[UITextField setPlaceholder:](self->_buildingTextField, "setPlaceholder:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("Floor [Report an Issue]"), CFSTR("localized string not found"), 0));
  -[UITextField setPlaceholder:](self->_floorTextField, "setPlaceholder:", v28);

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("Unit [Report an Issue]"), CFSTR("localized string not found"), 0));
  -[UITextField setPlaceholder:](self->_unitTextField, "setPlaceholder:", v30);

  -[UITextField addTarget:action:forControlEvents:](self->_floorTextField, "addTarget:action:forControlEvents:", self, "_addressChanged", 0x20000);
  -[UITextField addTarget:action:forControlEvents:](self->_unitTextField, "addTarget:action:forControlEvents:", self, "_addressChanged", 0x20000);
  -[UITextField addTarget:action:forControlEvents:](self->_buildingTextField, "addTarget:action:forControlEvents:", self, "_addressChanged", 0x20000);
  v31 = (UIView *)objc_alloc_init((Class)UIView);
  containerView = self->_containerView;
  self->_containerView = v31;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_containerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMultilineAddressLabelTableViewCell contentView](self, "contentView"));
  objc_msgSend(v33, "addSubview:", self->_containerView);

  v54 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_containerView, "leadingAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMultilineAddressLabelTableViewCell contentView](self, "contentView"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "leadingAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToAnchor:constant:", v53, 0.0));
  v56[0] = v52;
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_containerView, "trailingAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMultilineAddressLabelTableViewCell contentView](self, "contentView"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "trailingAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:constant:", v49, -0.0));
  v56[1] = v48;
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_containerView, "topAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMultilineAddressLabelTableViewCell contentView](self, "contentView"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "topAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:constant:", v35, 0.0));
  v56[2] = v36;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_containerView, "bottomAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMultilineAddressLabelTableViewCell contentView](self, "contentView"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "bottomAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:constant:", v39, -0.0));
  v56[3] = v40;
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v56, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v41);

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMultilineAddressLabelTableViewCell traitCollection](self, "traitCollection"));
  v43 = objc_msgSend(v42, "userInterfaceIdiom");

  if (v43 == (id)5)
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    -[RAPMultilineAddressLabelTableViewCell setBackgroundColor:](self, "setBackgroundColor:", v44);

    v45 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGray6Color](UIColor, "systemGray6Color"));
    -[UIView setBackgroundColor:](self->_containerView, "setBackgroundColor:", v45);

    v46 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_containerView, "layer"));
    objc_msgSend(v46, "setCornerRadius:", 7.5);

    -[UIView setClipsToBounds:](self->_containerView, "setClipsToBounds:", 1);
  }
}

- (void)_updateConstraints
{
  UIView *v3;
  NSMutableArray *v4;
  NSMutableArray *constraints;
  NSMutableArray *v6;
  NSMutableArray *topToFirstBaselineConstraints;
  NSMutableArray *v8;
  NSMutableArray *lastBaselineToBottomConstraints;
  void *v10;
  void *v11;
  void *v12;
  NSLayoutConstraint *v13;
  NSLayoutConstraint *freeformTopConstraint;
  NSMutableArray *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSLayoutConstraint *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  NSLayoutConstraint *v30;
  NSLayoutConstraint *freeformBottomConstraint;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  int *v41;
  uint64_t v42;
  UIView *v43;
  void *v44;
  void *v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  UIView *v74;
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
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  NSMutableArray *obj;
  void *v99;
  uint64_t v100;
  id v101;
  void *v102;
  UIView *v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  _BYTE v108[128];
  _QWORD v109[3];

  +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", self->_constraints);
  -[NSMutableArray removeAllObjects](self->_topToFirstBaselineConstraints, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_lastBaselineToBottomConstraints, "removeAllObjects");
  v3 = self->_containerView;
  v4 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  constraints = self->_constraints;
  self->_constraints = v4;

  v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  topToFirstBaselineConstraints = self->_topToFirstBaselineConstraints;
  self->_topToFirstBaselineConstraints = v6;

  v8 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  lastBaselineToBottomConstraints = self->_lastBaselineToBottomConstraints;
  self->_lastBaselineToBottomConstraints = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TextViewWithPlaceholderText topAnchor](self->_freeformAddressTextView, "topAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v3, "topAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17](UIFont, "system17"));
  objc_msgSend(v12, "_mapkit_scaledValueForValue:", 10.0);
  v13 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11));
  freeformTopConstraint = self->_freeformTopConstraint;
  self->_freeformTopConstraint = v13;

  v15 = self->_constraints;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TextViewWithPlaceholderText leadingAnchor](self->_freeformAddressTextView, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v3, "leadingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17, 10.0));
  v109[0] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[TextViewWithPlaceholderText trailingAnchor](self->_freeformAddressTextView, "trailingAnchor"));
  v103 = v3;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v3, "trailingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20, -8.0));
  v22 = self->_freeformTopConstraint;
  v109[1] = v21;
  v109[2] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v109, 3));
  -[NSMutableArray addObjectsFromArray:](v15, "addObjectsFromArray:", v23);

  v24 = objc_alloc_init((Class)NSMutableArray);
  v25 = -[NSMutableArray count](self->_detailViews, "count");
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[TextViewWithPlaceholderText bottomAnchor](self->_freeformAddressTextView, "bottomAnchor"));
  if (v25)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[RAPSeparatorBar topAnchor](self->_topHorizontalHairlineView, "topAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17](UIFont, "system17"));
    objc_msgSend(v28, "_mapkit_scaledValueForValue:", 10.0);
    v30 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:constant:", v27, -v29));
    freeformBottomConstraint = self->_freeformBottomConstraint;
    self->_freeformBottomConstraint = v30;

    -[NSMutableArray addObject:](self->_constraints, "addObject:", self->_freeformBottomConstraint);
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[RAPSeparatorBar heightAnchor](self->_topHorizontalHairlineView, "heightAnchor"));
    +[RAPSeparatorBar thickness](RAPSeparatorBar, "thickness");
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToConstant:"));
    objc_msgSend(v24, "addObject:", v33);

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[RAPSeparatorBar leadingAnchor](self->_topHorizontalHairlineView, "leadingAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v103, "leadingAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:constant:", v35, 8.0));
    objc_msgSend(v24, "addObject:", v36);

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[RAPSeparatorBar trailingAnchor](self->_topHorizontalHairlineView, "trailingAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v103, "trailingAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:constant:", v38, -8.0));
    objc_msgSend(v24, "addObject:", v39);

    v40 = (void *)objc_claimAutoreleasedReturnValue(-[RAPSeparatorBar bottomAnchor](self->_topHorizontalHairlineView, "bottomAnchor"));
    v41 = &OBJC_IVAR___SuggestionsDataProvider__suggestions;
    if (-[RAPAddressLayoutOptions numberOfEnabledOptions](self->_layoutOptions, "numberOfEnabledOptions") < 3)
      v42 = objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v103, "bottomAnchor"));
    else
      v42 = objc_claimAutoreleasedReturnValue(-[RAPSeparatorBar topAnchor](self->_bottomHorizontalHairlineView, "topAnchor"));
    v102 = (void *)v42;
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17](UIFont, "system17"));
    objc_msgSend(v47, "_mapkit_scaledValueForValue:", 33.0);
    v49 = v48;

    v50 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17](UIFont, "system17"));
    objc_msgSend(v50, "_mapkit_scaledValueForValue:", -22.0);
    v52 = v51;

    v106 = 0u;
    v107 = 0u;
    v104 = 0u;
    v105 = 0u;
    obj = self->_detailViews;
    v101 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v104, v108, 16);
    v53 = 0;
    if (!v101)
    {
      v99 = 0;
      goto LABEL_33;
    }
    v99 = 0;
    v100 = *(_QWORD *)v105;
    while (1)
    {
      v54 = 0;
      v55 = v53;
      do
      {
        if (*(_QWORD *)v105 != v100)
          objc_enumerationMutation(obj);
        v56 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * (_QWORD)v54);
        v57 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_detailViews, "firstObject"));

        if (v56 == v57)
        {
          v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "leadingAnchor"));
          v59 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v103, "leadingAnchor"));
          v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToAnchor:constant:", v59, 10.0));
          objc_msgSend(v24, "addObject:", v60);

          v41 = &OBJC_IVAR___SuggestionsDataProvider__suggestions;
        }
        v61 = objc_opt_class(RAPSeparatorBar);
        if ((objc_opt_isKindOfClass(v56, v61) & 1) != 0)
        {
          if (v56 == *(void **)((char *)&self->super.super.super.super.isa + v41[14]))
          {
            v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "heightAnchor"));
            +[RAPSeparatorBar thickness](RAPSeparatorBar, "thickness");
            v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "constraintEqualToConstant:"));
            objc_msgSend(v24, "addObject:", v78);

            v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "leadingAnchor"));
            v80 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v103, "leadingAnchor"));
            v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "constraintEqualToAnchor:constant:", v80, 8.0));
            objc_msgSend(v24, "addObject:", v81);

            v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "trailingAnchor"));
            v70 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v103, "trailingAnchor"));
            v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "constraintEqualToAnchor:constant:", v70, -8.0));
            objc_msgSend(v24, "addObject:", v82);

          }
          else
          {
            v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "widthAnchor"));
            +[RAPSeparatorBar thickness](RAPSeparatorBar, "thickness");
            v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToConstant:"));
            objc_msgSend(v24, "addObject:", v63);

            v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "centerXAnchor"));
            v65 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](v103, "centerXAnchor"));
            v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "constraintEqualToAnchor:", v65));
            objc_msgSend(v24, "addObject:", v66);

            v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "topAnchor"));
            v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "constraintEqualToAnchor:constant:", v40, 10.0));
            objc_msgSend(v24, "addObject:", v68);

            v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "bottomAnchor"));
            v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "constraintEqualToAnchor:constant:", v102, -10.0));
            objc_msgSend(v24, "addObject:", v70);
          }
        }
        else
        {
          v71 = objc_opt_class(UITextField);
          if ((objc_opt_isKindOfClass(v56, v71) & 1) == 0)
            goto LABEL_25;
          if (v99)
          {
            v72 = (void *)objc_claimAutoreleasedReturnValue(-[RAPSeparatorBar bottomAnchor](self->_topHorizontalHairlineView, "bottomAnchor"));

            if (v40 == v72)
            {
              v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "widthAnchor"));
              v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "widthAnchor"));
              v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "constraintEqualToAnchor:", v84));
              objc_msgSend(v24, "addObject:", v85);

              v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "leadingAnchor"));
              v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "leadingAnchor"));
              v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "constraintEqualToAnchor:constant:", v75, 10.0));
              v74 = v103;
            }
            else
            {
              v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "leadingAnchor"));
              v74 = v103;
              v75 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v103, "leadingAnchor"));
              v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "constraintEqualToAnchor:constant:", v75, 10.0));
            }
            objc_msgSend(v24, "addObject:", v76);

            v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "trailingAnchor"));
            v87 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v74, "trailingAnchor"));
            v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "constraintEqualToAnchor:constant:", v87, -8.0));
            objc_msgSend(v24, "addObject:", v88);

          }
          v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "firstBaselineAnchor"));
          v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "constraintEqualToAnchor:constant:", v40, v49));

          v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "lastBaselineAnchor"));
          v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "constraintEqualToAnchor:constant:", v102, v52));

          objc_msgSend(v24, "addObject:", v69);
          objc_msgSend(v24, "addObject:", v70);
          -[NSMutableArray addObject:](self->_topToFirstBaselineConstraints, "addObject:", v69);
          -[NSMutableArray addObject:](self->_lastBaselineToBottomConstraints, "addObject:", v70);
          v91 = v56;

          v99 = v91;
        }

        v41 = &OBJC_IVAR___SuggestionsDataProvider__suggestions;
LABEL_25:
        v92 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_detailViews, "lastObject"));

        if (v56 == v92)
        {
          v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "trailingAnchor"));
          v94 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v103, "trailingAnchor"));
          v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "constraintEqualToAnchor:constant:", v94, -8.0));
          objc_msgSend(v24, "addObject:", v95);

          v41 = &OBJC_IVAR___SuggestionsDataProvider__suggestions;
        }
        if (v56 == *(void **)((char *)&self->super.super.super.super.isa + v41[14]))
        {
          v96 = objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "bottomAnchor"));

          v97 = objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v103, "bottomAnchor"));
          v102 = (void *)v97;
          v40 = (void *)v96;
        }
        v53 = v56;

        v54 = (char *)v54 + 1;
        v55 = v53;
      }
      while (v101 != v54);
      v101 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v104, v108, 16);
      if (!v101)
      {
LABEL_33:

        v43 = v103;
        goto LABEL_34;
      }
    }
  }
  v43 = v103;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v103, "bottomAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17](UIFont, "system17"));
  objc_msgSend(v45, "_mapkit_scaledValueForValue:", 10.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:constant:", v44, -v46));

  -[NSMutableArray addObject:](self->_constraints, "addObject:", v40);
LABEL_34:

  -[NSMutableArray addObjectsFromArray:](self->_constraints, "addObjectsFromArray:", v24);
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", self->_constraints);

}

- (void)_freeformAddressFieldTapped:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TextViewWithPlaceholderText text](self->_freeformAddressTextView, "text"));
  v5 = objc_msgSend(v4, "length");

  if (!v5)
  {
    -[TextViewWithPlaceholderText resignFirstResponder](self->_freeformAddressTextView, "resignFirstResponder");
LABEL_6:
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMultilineAddressLabelTableViewCell delegate](self, "delegate"));
    objc_msgSend(v6, "userTappedOnAddressTableViewCell:", self);

    goto LABEL_7;
  }
  if (objc_msgSend(v7, "state") == (id)3 && !self->_canEditFreeformAddress)
    goto LABEL_6;
  -[TextViewWithPlaceholderText becomeFirstResponder](self->_freeformAddressTextView, "becomeFirstResponder");
LABEL_7:

}

- (void)_scrollTextViewSelectedRangeVisible:(id)a3
{
  void *v4;
  UITableView **p_parentTableView;
  id WeakRetained;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  unint64_t v15;
  id v16;
  id v17;
  id v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  id v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  v28 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "selectedTextRange"));
  if (v4)
  {
    p_parentTableView = &self->_parentTableView;
    WeakRetained = objc_loadWeakRetained((id *)p_parentTableView);
    objc_msgSend(v28, "firstRectForRange:", v4);
    objc_msgSend(WeakRetained, "convertRect:toView:", v28);
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

    v31.origin.x = CGRectZero.origin.x;
    v31.origin.y = CGRectZero.origin.y;
    v31.size.width = CGRectZero.size.width;
    v31.size.height = CGRectZero.size.height;
    v29.origin.x = v8;
    v29.origin.y = v10;
    v29.size.width = v12;
    v29.size.height = v14;
    if (!CGRectEqualToRect(v29, v31))
    {
      v15 = 0;
      do
      {
        v16 = objc_loadWeakRetained((id *)p_parentTableView);
        objc_msgSend(v16, "scrollRectToVisible:animated:", 0, v8, v10, v12, v14);

        v17 = objc_loadWeakRetained((id *)p_parentTableView);
        objc_msgSend(v17, "layoutIfNeeded");

        v18 = objc_loadWeakRetained((id *)p_parentTableView);
        objc_msgSend(v28, "firstRectForRange:", v4);
        objc_msgSend(v18, "convertRect:toView:", v28);
        v20 = v19;
        v22 = v21;
        v24 = v23;
        v26 = v25;

        v30.origin.x = v20;
        v30.origin.y = v22;
        v30.size.width = v24;
        v30.size.height = v26;
        v32.origin.x = v8;
        v32.origin.y = v10;
        v32.size.width = v12;
        v32.size.height = v14;
        if (CGRectEqualToRect(v30, v32))
          break;
        v8 = v20;
        v10 = v22;
        v12 = v24;
        v14 = v26;
      }
      while (v15++ < 9);
    }
  }

}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  char *v14;
  void *v15;

  v6 = a5;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "text"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet newlineCharacterSet](NSCharacterSet, "newlineCharacterSet"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "componentsSeparatedByCharactersInSet:", v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet newlineCharacterSet](NSCharacterSet, "newlineCharacterSet"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "componentsSeparatedByCharactersInSet:", v11));

  v13 = objc_msgSend(v10, "count");
  v14 = (char *)objc_msgSend(v12, "count") + (_QWORD)v13 - 1;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textContainer"));

  LOBYTE(v7) = v14 <= objc_msgSend(v15, "maximumNumberOfLines");
  return (char)v7;
}

- (BOOL)textViewShouldBeginEditing:(id)a3
{
  return self->_canEditFreeformAddress;
}

- (void)textViewDidBeginEditing:(id)a3
{
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 10167, -[RAPMultilineAddressLabelTableViewCell analyticTarget](self, "analyticTarget", a3), 0);
}

- (void)textViewDidChange:(id)a3
{
  -[RAPMultilineAddressLabelTableViewCell _updateFreeformCellHeightIfNeeded](self, "_updateFreeformCellHeightIfNeeded", a3);
  -[RAPMultilineAddressLabelTableViewCell _addressChanged](self, "_addressChanged");
}

- (void)textViewDidEndEditing:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[RAPMultilineAddressLabelTableViewCell isEditableAndTappable](self, "isEditableAndTappable"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "text"));
    -[RAPMultilineAddressLabelTableViewCell setCanEditFreeformAddress:](self, "setCanEditFreeformAddress:", objc_msgSend(v4, "length") != 0);

  }
}

- (void)_updateFreeformCellHeightIfNeeded
{
  UITableView **p_parentTableView;
  id WeakRetained;
  void *v5;
  id v6;

  p_parentTableView = &self->_parentTableView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentTableView);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "superview"));
  objc_msgSend(v5, "setNeedsLayout");

  v6 = objc_loadWeakRetained((id *)p_parentTableView);
  objc_msgSend(v6, "_maps_reloadCellHeights");

  -[RAPMultilineAddressLabelTableViewCell _scrollTextViewSelectedRangeVisible:](self, "_scrollTextViewSelectedRangeVisible:", self->_freeformAddressTextView);
}

- (void)setFreeformAddress:(id)a3
{
  NSString **p_freeformAddress;
  void *v6;
  id v7;

  p_freeformAddress = &self->_freeformAddress;
  v7 = a3;
  if (!-[NSString isEqualToString:](*p_freeformAddress, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_freeformAddress, a3);
    -[TextViewWithPlaceholderText setText:](self->_freeformAddressTextView, "setText:", *p_freeformAddress);
  }
  if (-[RAPMultilineAddressLabelTableViewCell isEditableAndTappable](self, "isEditableAndTappable"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TextViewWithPlaceholderText text](self->_freeformAddressTextView, "text"));
    -[RAPMultilineAddressLabelTableViewCell setCanEditFreeformAddress:](self, "setCanEditFreeformAddress:", objc_msgSend(v6, "length") != 0);

  }
  else
  {
    -[RAPMultilineAddressLabelTableViewCell setCanEditFreeformAddress:](self, "setCanEditFreeformAddress:", 1);
  }

}

- (void)_addressChanged
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  RAPAddressFields *v8;

  v8 = objc_alloc_init(RAPAddressFields);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TextViewWithPlaceholderText text](self->_freeformAddressTextView, "text"));
  -[RAPAddressFields setFreeformAddress:](v8, "setFreeformAddress:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField text](self->_floorTextField, "text"));
  -[RAPAddressFields setFloor:](v8, "setFloor:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField text](self->_unitTextField, "text"));
  -[RAPAddressFields setUnit:](v8, "setUnit:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField text](self->_buildingTextField, "text"));
  -[RAPAddressFields setBuilding:](v8, "setBuilding:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMultilineAddressLabelTableViewCell delegate](self, "delegate"));
  objc_msgSend(v7, "addressTableViewCell:updatedAddress:", self, v8);

}

- (void)setCanEditFreeformAddress:(BOOL)a3
{
  if (self->_canEditFreeformAddress != a3)
  {
    self->_canEditFreeformAddress = a3;
    if (self->_editableAndTappable)
      -[TextViewWithPlaceholderText setEditable:](self->_freeformAddressTextView, "setEditable:");
  }
}

- (void)setEditableAndTappable:(BOOL)a3
{
  UITapGestureRecognizer *v4;
  UITapGestureRecognizer *v5;
  UITapGestureRecognizer *freeformGestureRecognizer;

  if (self->_editableAndTappable != a3)
  {
    self->_editableAndTappable = a3;
    if (a3)
    {
      if (!self->_freeformGestureRecognizer)
      {
        v5 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_freeformAddressFieldTapped:");
        freeformGestureRecognizer = self->_freeformGestureRecognizer;
        self->_freeformGestureRecognizer = v5;

        -[TextViewWithPlaceholderText addGestureRecognizer:](self->_freeformAddressTextView, "addGestureRecognizer:", self->_freeformGestureRecognizer);
      }
    }
    else
    {
      -[RAPMultilineAddressLabelTableViewCell setCanEditFreeformAddress:](self, "setCanEditFreeformAddress:");
      -[TextViewWithPlaceholderText removeGestureRecognizer:](self->_freeformAddressTextView, "removeGestureRecognizer:", self->_freeformGestureRecognizer);
      v4 = self->_freeformGestureRecognizer;
      self->_freeformGestureRecognizer = 0;

    }
  }
}

- (void)setLayoutOptions:(id)a3
{
  RAPAddressLayoutOptions *v4;
  RAPAddressLayoutOptions *layoutOptions;
  id v6;

  v6 = a3;
  if (!-[RAPAddressLayoutOptions isEqual:](self->_layoutOptions, "isEqual:"))
  {
    v4 = (RAPAddressLayoutOptions *)objc_msgSend(v6, "copy");
    layoutOptions = self->_layoutOptions;
    self->_layoutOptions = v4;

    -[RAPMultilineAddressLabelTableViewCell _updateViews](self, "_updateViews");
    -[RAPMultilineAddressLabelTableViewCell _updateConstraints](self, "_updateConstraints");
  }

}

- (void)_updateViews
{
  NSMutableArray *v3;
  NSMutableArray *detailViews;
  uint64_t v5;
  UIView *v6;
  BOOL v7;
  UIView *v8;

  -[RAPMultilineAddressLabelTableViewCell _clearSubviews](self, "_clearSubviews");
  v8 = self->_containerView;
  -[UIView addSubview:](v8, "addSubview:", self->_freeformAddressTextView);
  v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  detailViews = self->_detailViews;
  self->_detailViews = v3;

  v5 = -[RAPAddressLayoutOptions numberOfEnabledOptions](self->_layoutOptions, "numberOfEnabledOptions");
  v6 = v8;
  if (v5)
  {
    -[UIView addSubview:](v8, "addSubview:", self->_topHorizontalHairlineView);
    if (-[RAPAddressLayoutOptions showFloor](self->_layoutOptions, "showFloor"))
    {
      -[NSMutableArray addObject:](self->_detailViews, "addObject:", self->_floorTextField);
      -[UIView addSubview:](v8, "addSubview:", self->_floorTextField);
    }
    if (-[RAPAddressLayoutOptions showBuilding](self->_layoutOptions, "showBuilding"))
    {
      -[NSMutableArray addObject:](self->_detailViews, "addObject:", self->_buildingTextField);
      -[UIView addSubview:](v8, "addSubview:", self->_buildingTextField);
    }
    if (-[RAPAddressLayoutOptions showUnit](self->_layoutOptions, "showUnit"))
    {
      -[NSMutableArray addObject:](self->_detailViews, "addObject:", self->_unitTextField);
      -[UIView addSubview:](v8, "addSubview:", self->_unitTextField);
    }
    if (v5 >= 2)
    {
      -[UIView addSubview:](v8, "addSubview:", self->_middleVerticalHairlineView);
      -[NSMutableArray insertObject:atIndex:](self->_detailViews, "insertObject:atIndex:", self->_middleVerticalHairlineView, 1);
    }
    v7 = -[RAPAddressLayoutOptions numberOfEnabledOptions](self->_layoutOptions, "numberOfEnabledOptions") <= 2;
    v6 = v8;
    if (!v7)
    {
      -[UIView addSubview:](v8, "addSubview:", self->_bottomHorizontalHairlineView);
      -[NSMutableArray insertObject:atIndex:](self->_detailViews, "insertObject:atIndex:", self->_bottomHorizontalHairlineView, (char *)-[NSMutableArray count](self->_detailViews, "count") - 1);
      v6 = v8;
    }
  }

}

- (void)_clearSubviews
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIView subviews](self->_containerView, "subviews", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), "removeFromSuperview");
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_contentSizeDidChange
{
  -[RAPMultilineAddressLabelTableViewCell _updateFonts](self, "_updateFonts");
  -[RAPMultilineAddressLabelTableViewCell _recalculateConstraints](self, "_recalculateConstraints");
}

- (void)_updateFonts
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17](UIFont, "system17"));
  -[TextViewWithPlaceholderText setFont:](self->_freeformAddressTextView, "setFont:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17](UIFont, "system17"));
  -[UITextField setFont:](self->_floorTextField, "setFont:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17](UIFont, "system17"));
  -[UITextField setFont:](self->_buildingTextField, "setFont:", v5);

  v6 = (id)objc_claimAutoreleasedReturnValue(+[UIFont system17](UIFont, "system17"));
  -[UITextField setFont:](self->_unitTextField, "setFont:", v6);

}

- (void)_recalculateConstraints
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  NSMutableArray *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  NSMutableArray *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17](UIFont, "system17"));
  objc_msgSend(v3, "_mapkit_scaledValueForValue:", 33.0);
  v5 = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17](UIFont, "system17"));
  objc_msgSend(v6, "_mapkit_scaledValueForValue:", -22.0);
  v8 = v7;

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v9 = self->_topToFirstBaselineConstraints;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v27;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v13), "setConstant:", v5);
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v11);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v14 = self->_lastBaselineToBottomConstraints;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v23;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v18), "setConstant:", v8, (_QWORD)v22);
        v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v16);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17](UIFont, "system17"));
  objc_msgSend(v19, "_mapkit_scaledValueForValue:", 10.0);
  -[NSLayoutConstraint setConstant:](self->_freeformTopConstraint, "setConstant:");

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17](UIFont, "system17"));
  objc_msgSend(v20, "_mapkit_scaledValueForValue:", 10.0);
  -[NSLayoutConstraint setConstant:](self->_freeformBottomConstraint, "setConstant:", -v21);

}

- (int)analyticTarget
{
  return self->_analyticTarget;
}

- (void)setAnalyticTarget:(int)a3
{
  self->_analyticTarget = a3;
}

- (RAPAddressLayoutOptions)layoutOptions
{
  return self->_layoutOptions;
}

- (RAPAddressDelegate)delegate
{
  return (RAPAddressDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)freeformAddress
{
  return self->_freeformAddress;
}

- (BOOL)canEditFreeformAddress
{
  return self->_canEditFreeformAddress;
}

- (BOOL)isEditableAndTappable
{
  return self->_editableAndTappable;
}

- (UITableView)parentTableView
{
  return (UITableView *)objc_loadWeakRetained((id *)&self->_parentTableView);
}

- (void)setParentTableView:(id)a3
{
  objc_storeWeak((id *)&self->_parentTableView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentTableView);
  objc_storeStrong((id *)&self->_freeformAddress, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_layoutOptions, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_freeformGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_detailViews, 0);
  objc_storeStrong((id *)&self->_freeformBottomConstraint, 0);
  objc_storeStrong((id *)&self->_freeformTopConstraint, 0);
  objc_storeStrong((id *)&self->_lastBaselineToBottomConstraints, 0);
  objc_storeStrong((id *)&self->_topToFirstBaselineConstraints, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_bottomHorizontalHairlineView, 0);
  objc_storeStrong((id *)&self->_middleVerticalHairlineView, 0);
  objc_storeStrong((id *)&self->_topHorizontalHairlineView, 0);
  objc_storeStrong((id *)&self->_buildingTextField, 0);
  objc_storeStrong((id *)&self->_unitTextField, 0);
  objc_storeStrong((id *)&self->_floorTextField, 0);
  objc_storeStrong((id *)&self->_freeformAddressTextView, 0);
}

@end
