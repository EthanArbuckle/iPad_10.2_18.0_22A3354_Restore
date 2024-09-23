@implementation TransitDirectionsStepView

- (NSString)reuseIdentifier
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView transitListItem](self, "transitListItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "reuseIdentifierForItem:", v4));

  return (NSString *)v5;
}

+ (id)reuseIdentifierForItem:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  __CFString *v6;
  void *v7;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = (unint64_t)objc_msgSend(v3, "type");
    if (v5 >= 0x12)
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unknown (%ld)"), v5));
    else
      v6 = off_1011C5188[v5];
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%p"), v6, v4));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)description
{
  NSString *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TransitDirectionsStepView;
  v3 = -[TransitDirectionsStepView description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView transitListItem](self, "transitListItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@; item: %@"),
                   v4,
                   v5));

  return (NSString *)v6;
}

- (TransitDirectionsStepView)initWithFrame:(CGRect)a3
{
  TransitDirectionsStepView *v3;
  TransitDirectionsStepView *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  TransitDirectionsStepView *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TransitDirectionsStepView;
  v3 = -[TransitDirectionsStepView initWithFrame:](&v12, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (objc_class *)objc_opt_class(v3);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[TransitDirectionsStepView setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", v7);

    v4->_trailingGuideToContentViewDistance = 16.0;
    -[TransitDirectionsStepView _createSubviews](v4, "_createSubviews");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView _initialConstraints](v4, "_initialConstraints"));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v8);

    -[TransitDirectionsStepView _updateConstraints](v4, "_updateConstraints");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "addObserver:selector:name:object:", v4, "_contentSizeCategoryDidChange", UIContentSizeCategoryDidChangeNotification, 0);

    v10 = v4;
  }

  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)TransitDirectionsStepView;
  -[TransitDirectionsStepView dealloc](&v4, "dealloc");
}

- (void)prepareForReuse
{
  self->_displayOptions = 0;
}

- (void)configureWithItem:(id)a3
{
  id v5;
  TransitDirectionsListItem *transitListItem;
  id v7;
  void *v8;
  unsigned __int8 v9;
  unint64_t v10;

  v5 = a3;
  transitListItem = self->_transitListItem;
  v10 = (unint64_t)v5;
  v7 = transitListItem;
  v8 = (void *)v10;
  if (v10 | (unint64_t)v7)
  {
    v9 = objc_msgSend((id)v10, "isEqual:", v7);

    v8 = (void *)v10;
    if ((v9 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_transitListItem, a3);
      -[TransitDirectionsStepView _updateBottomSpacer](self, "_updateBottomSpacer");
      -[TransitDirectionsStepView _updateVisibilityForItemFromDisplayOptions](self, "_updateVisibilityForItemFromDisplayOptions");
      v8 = (void *)v10;
    }
  }

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TransitDirectionsStepView;
  -[TransitDirectionsStepView layoutSubviews](&v3, "layoutSubviews");
  -[TransitDirectionsStepView bounds](self, "bounds");
  -[UIControl setFrame:](self->_backgroundControlForHitTesting, "setFrame:");
}

- (void)_createSubviews
{
  void *v3;
  id v4;
  UIControl *v5;
  UIControl *backgroundControlForHitTesting;
  UILayoutGuide *v7;
  UILayoutGuide *leadingAccessoryLayoutGuide;
  UILayoutGuide *v9;
  UILayoutGuide *contentLayoutGuide;
  UILayoutGuide *v11;
  UILayoutGuide *trailingContentLayoutGuide;
  UILayoutGuide *v13;
  UILayoutGuide *bottomSpacingLayoutGuide;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[TransitDirectionsStepView setBackgroundColor:](self, "setBackgroundColor:", v3);

  -[TransitDirectionsStepView setOpaque:](self, "setOpaque:", 0);
  v4 = objc_alloc((Class)UIControl);
  -[TransitDirectionsStepView bounds](self, "bounds");
  v5 = (UIControl *)objc_msgSend(v4, "initWithFrame:");
  backgroundControlForHitTesting = self->_backgroundControlForHitTesting;
  self->_backgroundControlForHitTesting = v5;

  -[UIControl setAutoresizingMask:](self->_backgroundControlForHitTesting, "setAutoresizingMask:", 18);
  -[TransitDirectionsStepView addSubview:](self, "addSubview:", self->_backgroundControlForHitTesting);
  -[UIControl addTarget:action:forControlEvents:](self->_backgroundControlForHitTesting, "addTarget:action:forControlEvents:", self, "_stepViewHighlighted:", 1);
  -[UIControl addTarget:action:forControlEvents:](self->_backgroundControlForHitTesting, "addTarget:action:forControlEvents:", self, "_stepViewUnhighlighted:", 32);
  -[UIControl addTarget:action:forControlEvents:](self->_backgroundControlForHitTesting, "addTarget:action:forControlEvents:", self, "_stepViewUnhighlighted:", 256);
  -[UIControl addTarget:action:forControlEvents:](self->_backgroundControlForHitTesting, "addTarget:action:forControlEvents:", self, "_stepViewSelected:", 64);
  v7 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  leadingAccessoryLayoutGuide = self->_leadingAccessoryLayoutGuide;
  self->_leadingAccessoryLayoutGuide = v7;

  -[TransitDirectionsStepView addLayoutGuide:](self, "addLayoutGuide:", self->_leadingAccessoryLayoutGuide);
  v9 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  contentLayoutGuide = self->_contentLayoutGuide;
  self->_contentLayoutGuide = v9;

  -[TransitDirectionsStepView addLayoutGuide:](self, "addLayoutGuide:", self->_contentLayoutGuide);
  v11 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  trailingContentLayoutGuide = self->_trailingContentLayoutGuide;
  self->_trailingContentLayoutGuide = v11;

  -[TransitDirectionsStepView addLayoutGuide:](self, "addLayoutGuide:", self->_trailingContentLayoutGuide);
  v13 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  bottomSpacingLayoutGuide = self->_bottomSpacingLayoutGuide;
  self->_bottomSpacingLayoutGuide = v13;

  -[TransitDirectionsStepView addLayoutGuide:](self, "addLayoutGuide:", self->_bottomSpacingLayoutGuide);
}

- (id)viewForHitTesting
{
  return self->_backgroundControlForHitTesting;
}

- (void)setLeadingInstructionMargin:(double)a3
{
  double v3;

  v3 = floor(a3);
  if (v3 != self->_leadingInstructionMargin)
  {
    self->_leadingInstructionMargin = v3;
    -[NSLayoutConstraint setConstant:](self->_leadingAccessoryLayoutGuideWidthConstraint, "setConstant:");
  }
}

- (void)setUseNavigationMetrics:(BOOL)a3
{
  if (self->_useNavigationMetrics != a3)
    self->_useNavigationMetrics = a3;
}

- (void)setNavigationState:(int64_t)a3
{
  if (self->_navigationState != a3)
  {
    self->_navigationState = a3;
    -[TransitDirectionsStepView _alphaForCurrentNavigationState](self, "_alphaForCurrentNavigationState");
    -[TransitDirectionsStepView _updateNavigationStateAlpha:](self, "_updateNavigationStateAlpha:");
  }
}

- (double)_alphaForCurrentNavigationState
{
  double v2;
  int64_t v3;

  v2 = 1.0;
  if ((self->_displayOptions & 2) == 0)
  {
    v3 = -[TransitDirectionsStepView navigationState](self, "navigationState");
    if ((unint64_t)(v3 - 1) <= 4)
      return dbl_100E3A308[v3 - 1];
  }
  return v2;
}

- (void)setDisplayOptions:(unint64_t)a3
{
  unint64_t displayOptions;
  char v5;

  displayOptions = self->_displayOptions;
  if (displayOptions != a3)
  {
    self->_displayOptions = a3;
    v5 = displayOptions ^ a3;
    if (((displayOptions ^ a3) & 2) != 0)
    {
      -[TransitDirectionsStepView _alphaForCurrentNavigationState](self, "_alphaForCurrentNavigationState");
      -[TransitDirectionsStepView _updateNavigationStateAlpha:](self, "_updateNavigationStateAlpha:");
    }
    if ((v5 & 4) != 0)
      -[TransitDirectionsStepView _updateVisibilityForItemFromDisplayOptions](self, "_updateVisibilityForItemFromDisplayOptions");
  }
}

- (void)_updateVisibilityForItemFromDisplayOptions
{
  _BOOL8 v3;

  v3 = (self->_displayOptions & 4) != 0
    && -[TransitDirectionsListItem shouldHideInExpandedDisplayStyle](self->_transitListItem, "shouldHideInExpandedDisplayStyle");
  -[TransitDirectionsStepView setHidden:](self, "setHidden:", v3);
  -[TransitDirectionsStepView _updateBottomSpacer](self, "_updateBottomSpacer");
}

- (HairlineView)separatorView
{
  HairlineView *separatorView;
  HairlineView *v4;
  HairlineView *v5;

  separatorView = self->_separatorView;
  if (!separatorView)
  {
    v4 = (HairlineView *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView _maps_addHairlineAtBottomWithMargin:](self, "_maps_addHairlineAtBottomWithMargin:", 0.0));
    v5 = self->_separatorView;
    self->_separatorView = v4;

    separatorView = self->_separatorView;
  }
  return separatorView;
}

- (id)_initialConstraints
{
  void *v3;
  void *v4;
  NSLayoutConstraint *v5;
  NSLayoutConstraint *leadingAccessoryLayoutGuideWidthConstraint;
  void *v7;
  void *v8;
  NSLayoutConstraint *v9;
  NSLayoutConstraint *bottomSpacingLayoutGuideHeightConstraint;
  void *v11;
  void *v12;
  NSLayoutConstraint *v13;
  NSLayoutConstraint *trailingContentLayoutGuideWidthConstraint;
  void *v15;
  void *v16;
  void *v17;
  NSLayoutConstraint *v18;
  NSLayoutConstraint *trailingGuideToContentViewConstraint;
  NSLayoutConstraint *v20;
  NSLayoutConstraint *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSLayoutConstraint *v31;
  void *v32;
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
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  _QWORD v74[16];

  v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide widthAnchor](self->_leadingAccessoryLayoutGuide, "widthAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToConstant:", 0.0));
  v5 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_maps_withIdentifier:", CFSTR("leadingAccessoryLayoutGuideWidthConstraint")));
  leadingAccessoryLayoutGuideWidthConstraint = self->_leadingAccessoryLayoutGuideWidthConstraint;
  self->_leadingAccessoryLayoutGuideWidthConstraint = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide heightAnchor](self->_bottomSpacingLayoutGuide, "heightAnchor"));
  -[TransitDirectionsStepView bottomSpacerHeight](self, "bottomSpacerHeight");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToConstant:"));
  v9 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_maps_withIdentifier:", CFSTR("bottomSpacingLayoutGuideHeight")));
  bottomSpacingLayoutGuideHeightConstraint = self->_bottomSpacingLayoutGuideHeightConstraint;
  self->_bottomSpacingLayoutGuideHeightConstraint = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide widthAnchor](self->_trailingContentLayoutGuide, "widthAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToConstant:", 0.0));
  v13 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_maps_withIdentifier:", CFSTR("trailingContentLayoutGuideWidth")));
  trailingContentLayoutGuideWidthConstraint = self->_trailingContentLayoutGuideWidthConstraint;
  self->_trailingContentLayoutGuideWidthConstraint = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView trailingAnchor](self, "trailingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self->_trailingContentLayoutGuide, "trailingAnchor"));
  -[TransitDirectionsStepView _trailingGuideToContentViewDistance](self, "_trailingGuideToContentViewDistance");
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16));
  v18 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "_maps_withIdentifier:", CFSTR("contentViewTrailingToTrailingContentTrailing")));
  trailingGuideToContentViewConstraint = self->_trailingGuideToContentViewConstraint;
  self->_trailingGuideToContentViewConstraint = v18;

  v72 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](self->_leadingAccessoryLayoutGuide, "leadingAnchor"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView leadingAnchor](self, "leadingAnchor"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "constraintEqualToAnchor:", v71));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "_maps_withIdentifier:", CFSTR("leadingAccessoryLayoutLeadingToContentViewLeading")));
  v74[0] = v69;
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_leadingAccessoryLayoutGuide, "topAnchor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView topAnchor](self, "topAnchor"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "constraintEqualToAnchor:", v67));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "_maps_withIdentifier:", CFSTR("leadingAccessoryLayoutTopToContentViewTop")));
  v74[1] = v65;
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self->_leadingAccessoryLayoutGuide, "bottomAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView bottomAnchor](self, "bottomAnchor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "constraintEqualToAnchor:", v63));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "_maps_withIdentifier:", CFSTR("leadingAccessoryLayoutBottomToContentViewBottom")));
  v20 = self->_leadingAccessoryLayoutGuideWidthConstraint;
  v74[2] = v61;
  v74[3] = v20;
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](self->_contentLayoutGuide, "leadingAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self->_leadingAccessoryLayoutGuide, "trailingAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToAnchor:", v59));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "_maps_withIdentifier:", CFSTR("contentLayoutLeadingToLeadingLayoutLeading")));
  v74[4] = v57;
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_contentLayoutGuide, "topAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView topAnchor](self, "topAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToAnchor:", v55));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "_maps_withIdentifier:", CFSTR("contentLayoutTopToContentViewTop")));
  v74[5] = v53;
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self->_contentLayoutGuide, "bottomAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_bottomSpacingLayoutGuide, "topAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:", v51));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "_maps_withIdentifier:", CFSTR("contentLayoutBottomToBottomSpacingTop")));
  v74[6] = v48;
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](self->_trailingContentLayoutGuide, "leadingAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self->_contentLayoutGuide, "trailingAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:", v46));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "_maps_withIdentifier:", CFSTR("trailingContentLeadingToContentLeading")));
  v74[7] = v44;
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_trailingContentLayoutGuide, "topAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView topAnchor](self, "topAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:", v42));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "_maps_withIdentifier:", CFSTR("trailingContentTopToContentViewTop")));
  v74[8] = v40;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self->_trailingContentLayoutGuide, "bottomAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView bottomAnchor](self, "bottomAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v38));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "_maps_withIdentifier:", CFSTR("trailingContentBottomToContentViewBottom")));
  v21 = self->_trailingGuideToContentViewConstraint;
  v74[9] = v36;
  v74[10] = v21;
  v74[11] = self->_trailingContentLayoutGuideWidthConstraint;
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](self->_bottomSpacingLayoutGuide, "leadingAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView leadingAnchor](self, "leadingAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:", v35));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "_maps_withIdentifier:", CFSTR("bottomSpacingLeadingToContentViewLeading")));
  v74[12] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self->_bottomSpacingLayoutGuide, "trailingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView trailingAnchor](self, "trailingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v24));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "_maps_withIdentifier:", CFSTR("bottomSpacingTrailingToContentViewTrailing")));
  v74[13] = v26;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self->_bottomSpacingLayoutGuide, "bottomAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView bottomAnchor](self, "bottomAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v28));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "_maps_withIdentifier:", CFSTR("bottomSpacingBottomToContentViewBottom")));
  v31 = self->_bottomSpacingLayoutGuideHeightConstraint;
  v74[14] = v30;
  v74[15] = v31;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v74, 16));
  objc_msgSend(v73, "addObjectsFromArray:", v32);

  return v73;
}

- (void)_updateConstraints
{
  GCDTimer *constraintInvalidationTimer;

  -[GCDTimer invalidate](self->_constraintInvalidationTimer, "invalidate");
  constraintInvalidationTimer = self->_constraintInvalidationTimer;
  self->_constraintInvalidationTimer = 0;

  -[TransitDirectionsStepView _updateBottomSpacer](self, "_updateBottomSpacer");
  -[TransitDirectionsStepView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)_updateBottomSpacer
{
  uint64_t v3;
  double v4;
  double v5;
  double v6;

  -[TransitDirectionsStepView bottomSpacerHeight](self, "bottomSpacerHeight");
  v5 = UIRoundToViewScale(self, v3, v4);
  -[NSLayoutConstraint constant](self->_bottomSpacingLayoutGuideHeightConstraint, "constant");
  if (vabdd_f64(v5, v6) > 2.22044605e-16)
    -[NSLayoutConstraint setConstant:](self->_bottomSpacingLayoutGuideHeightConstraint, "setConstant:", v5);
}

- (void)_invalidateConstraints
{
  id v3;
  GCDTimer *v4;
  GCDTimer *constraintInvalidationTimer;
  _QWORD v6[4];
  id v7;
  id location;

  if (!self->_constraintInvalidationTimer)
  {
    objc_initWeak(&location, self);
    v3 = &_dispatch_main_q;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10073EA18;
    v6[3] = &unk_1011AE190;
    objc_copyWeak(&v7, &location);
    v4 = (GCDTimer *)objc_claimAutoreleasedReturnValue(+[GCDTimer scheduledTimerWithTimeInterval:queue:block:](GCDTimer, "scheduledTimerWithTimeInterval:queue:block:", &_dispatch_main_q, v6, 0.0));
    constraintInvalidationTimer = self->_constraintInvalidationTimer;
    self->_constraintInvalidationTimer = v4;

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (void)setTrailingView:(id)a3
{
  UIView *v5;
  UIView **p_trailingView;
  UIView *trailingView;
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
  _QWORD v29[5];

  v5 = (UIView *)a3;
  p_trailingView = &self->_trailingView;
  trailingView = self->_trailingView;
  if (trailingView != v5)
  {
    -[UIView removeFromSuperview](trailingView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_trailingView, a3);
    -[UIView _mapkit_fittingSize](*p_trailingView, "_mapkit_fittingSize");
    -[NSLayoutConstraint setConstant:](self->_trailingContentLayoutGuideWidthConstraint, "setConstant:");
    if (*p_trailingView)
    {
      -[TransitDirectionsStepView addSubview:](self, "addSubview:");
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](*p_trailingView, "topAnchor"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_trailingContentLayoutGuide, "topAnchor"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintGreaterThanOrEqualToAnchor:", v27));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "_maps_withIdentifier:", CFSTR("trailingViewTopToTrailingLayoutTop")));
      v29[0] = v25;
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](*p_trailingView, "bottomAnchor"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self->_trailingContentLayoutGuide, "bottomAnchor"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintLessThanOrEqualToAnchor:", v23));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "_maps_withIdentifier:", CFSTR("trailingViewBottomToTrailingLayoutBottom")));
      v29[1] = v21;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](*p_trailingView, "leadingAnchor"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](self->_trailingContentLayoutGuide, "leadingAnchor"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v19));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "_maps_withIdentifier:", CFSTR("trailingViewLeadingToTrailingLayoutLeading")));
      v29[2] = v17;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](*p_trailingView, "trailingAnchor"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self->_trailingContentLayoutGuide, "trailingAnchor"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_maps_withIdentifier:", CFSTR("trailingViewTrailingToTrailingLayoutTrailing")));
      v29[3] = v11;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](*p_trailingView, "centerYAnchor"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerYAnchor](self->_trailingContentLayoutGuide, "centerYAnchor"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v13));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_maps_withIdentifier:", CFSTR("trailingViewCenterYToTrailingLayoutCenterY")));
      v29[4] = v15;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 5));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16);

    }
  }

}

- (void)_setTrailingGuideToContentViewDistance:(double)a3
{
  self->_trailingGuideToContentViewDistance = a3;
  -[NSLayoutConstraint setConstant:](self->_trailingGuideToContentViewConstraint, "setConstant:");
}

+ (double)estimatedHeightForListItem:(id)a3
{
  id v3;
  double v4;
  double v5;
  void *v6;
  double v7;

  v3 = a3;
  v4 = 20.0;
  if (objc_msgSend(v3, "type") == (id)5)
    goto LABEL_4;
  v5 = 13.0;
  if (objc_msgSend(v3, "type") != (id)6)
  {
    v4 = 70.0;
LABEL_4:
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
    objc_msgSend(v6, "_mapkit_scaledValueForValue:", v4);
    v5 = v7;

  }
  return v5;
}

- (void)_stepViewHighlighted:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView selectionDelegate](self, "selectionDelegate", a3));
  objc_msgSend(v4, "stepViewHighlighted:", self);

}

- (void)_stepViewUnhighlighted:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView selectionDelegate](self, "selectionDelegate", a3));
  objc_msgSend(v4, "stepViewUnhighlighted:", self);

}

- (void)_stepViewSelected:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView selectionDelegate](self, "selectionDelegate", a3));
  objc_msgSend(v4, "stepViewSelected:", self);

}

- (BOOL)_isProminentItemType:(int64_t)a3
{
  return ((unint64_t)a3 < 0x12) & (0x230Fu >> a3);
}

- (double)bottomSpacerHeight
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  BOOL v8;
  double v9;
  double v10;
  double v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView transitListItem](self, "transitListItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "nextItem"));

  if ((-[TransitDirectionsStepView displayOptions](self, "displayOptions") & 4) != 0 && v4)
  {
    do
    {
      if (!objc_msgSend(v4, "shouldHideInExpandedDisplayStyle"))
        break;
      v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "nextItem"));

      v4 = (void *)v5;
    }
    while (v5);
  }
  v6 = objc_msgSend(v4, "type");
  if (-[TransitDirectionsStepView _isProminentItemType:](self, "_isProminentItemType:", v6))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView traitCollection](self, "traitCollection"));
    v8 = objc_msgSend(v7, "userInterfaceIdiom") == (id)5;
    v9 = 16.0;
LABEL_7:
    v10 = 10.0;
LABEL_8:
    if (v8)
      v11 = v10;
    else
      v11 = v9;
LABEL_13:

  }
  else
  {
    v11 = 0.0;
    switch((unint64_t)v6)
    {
      case 0xAuLL:
      case 0xFuLL:
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView traitCollection](self, "traitCollection"));
        objc_msgSend(v7, "userInterfaceIdiom");
        goto LABEL_13;
      case 0xDuLL:
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView traitCollection](self, "traitCollection"));
        v8 = objc_msgSend(v7, "userInterfaceIdiom") == (id)5;
        v9 = 14.0;
        goto LABEL_7;
      case 0x10uLL:
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView traitCollection](self, "traitCollection"));
        v8 = objc_msgSend(v7, "userInterfaceIdiom") == (id)5;
        v9 = 7.0;
        v10 = 5.0;
        goto LABEL_8;
      default:
        break;
    }
  }

  return v11;
}

- (TransitDirectionsListItem)transitListItem
{
  return self->_transitListItem;
}

- (double)leadingInstructionMargin
{
  return self->_leadingInstructionMargin;
}

- (UIView)trailingView
{
  return self->_trailingView;
}

- (BOOL)useNavigationMetrics
{
  return self->_useNavigationMetrics;
}

- (int64_t)navigationState
{
  return self->_navigationState;
}

- (unint64_t)displayOptions
{
  return self->_displayOptions;
}

- (double)_trailingGuideToContentViewDistance
{
  return self->_trailingGuideToContentViewDistance;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (void)setHighlighted:(BOOL)a3
{
  self->_highlighted = a3;
}

- (TransitDirectionsCell)cell
{
  return (TransitDirectionsCell *)objc_loadWeakRetained((id *)&self->_cell);
}

- (void)setCell:(id)a3
{
  objc_storeWeak((id *)&self->_cell, a3);
}

- (TransitDirectionsStepViewSelectionDelegate)selectionDelegate
{
  return (TransitDirectionsStepViewSelectionDelegate *)objc_loadWeakRetained((id *)&self->_selectionDelegate);
}

- (void)setSelectionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_selectionDelegate, a3);
}

- (UILayoutGuide)leadingAccessoryLayoutGuide
{
  return self->_leadingAccessoryLayoutGuide;
}

- (UILayoutGuide)contentLayoutGuide
{
  return self->_contentLayoutGuide;
}

- (UILayoutGuide)bottomSpacingLayoutGuide
{
  return self->_bottomSpacingLayoutGuide;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomSpacingLayoutGuide, 0);
  objc_storeStrong((id *)&self->_contentLayoutGuide, 0);
  objc_storeStrong((id *)&self->_leadingAccessoryLayoutGuide, 0);
  objc_destroyWeak((id *)&self->_selectionDelegate);
  objc_destroyWeak((id *)&self->_cell);
  objc_storeStrong((id *)&self->_trailingView, 0);
  objc_storeStrong((id *)&self->_backgroundControlForHitTesting, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_constraintInvalidationTimer, 0);
  objc_storeStrong((id *)&self->_trailingGuideToContentViewConstraint, 0);
  objc_storeStrong((id *)&self->_trailingContentLayoutGuideWidthConstraint, 0);
  objc_storeStrong((id *)&self->_trailingContentLayoutGuide, 0);
  objc_storeStrong((id *)&self->_bottomSpacingLayoutGuideHeightConstraint, 0);
  objc_storeStrong((id *)&self->_leadingAccessoryLayoutGuideWidthConstraint, 0);
  objc_storeStrong((id *)&self->_transitListItem, 0);
}

@end
