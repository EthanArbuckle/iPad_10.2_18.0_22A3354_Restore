@implementation TwoLinesContentView

- (TwoLinesContentView)initWithFrame:(CGRect)a3 contentViewType:(int)a4
{
  TwoLinesContentView *v5;
  TwoLinesContentView *v6;

  v5 = -[TwoLinesContentView initWithFrame:](self, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_contentViewType = a4;
    -[TwoLinesContentView _updateLabelColors](v5, "_updateLabelColors");
  }
  return v6;
}

- (TwoLinesContentView)initWithFrame:(CGRect)a3
{
  TwoLinesContentView *v3;
  UILayoutGuide *v4;
  UILayoutGuide *titleLayoutGuide;
  id v6;
  double y;
  double width;
  double height;
  UIImageView *v10;
  UIImageView *leftImageView;
  NSTextAttachment *v12;
  NSTextAttachment *attachment;
  double v14;
  double v15;
  double v16;
  UIView *v17;
  UIView *badgeView;
  void *v19;
  void *v20;
  UILabel *v21;
  UILabel *mainTitleLabel;
  UILabel *v23;
  UILabel *secondTitleLabel;
  UILabel *v25;
  UILabel *thirdTitleLabel;
  UITapGestureRecognizer *v27;
  UITapGestureRecognizer *thirdLabelTap;
  UIImageView *v29;
  UIImageView *thirdLabelImageView;
  void *v31;
  double v32;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)TwoLinesContentView;
  v3 = -[TwoLinesContentView initWithFrame:](&v34, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
    titleLayoutGuide = v3->_titleLayoutGuide;
    v3->_titleLayoutGuide = v4;

    -[TwoLinesContentView addLayoutGuide:](v3, "addLayoutGuide:", v3->_titleLayoutGuide);
    v6 = objc_alloc((Class)UIImageView);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v10 = (UIImageView *)objc_msgSend(v6, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    leftImageView = v3->_leftImageView;
    v3->_leftImageView = v10;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_leftImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setAccessibilityIdentifier:](v3->_leftImageView, "setAccessibilityIdentifier:", CFSTR("LeftImage"));
    -[TwoLinesContentView addSubview:](v3, "addSubview:", v3->_leftImageView);
    v12 = (NSTextAttachment *)objc_msgSend(objc_alloc((Class)NSTextAttachment), "initWithData:ofType:", 0, 0);
    attachment = v3->_attachment;
    v3->_attachment = v12;

    -[TwoLinesContentView _imageDimension](v3, "_imageDimension");
    v15 = v14;
    -[TwoLinesContentView _imageDimension](v3, "_imageDimension");
    -[NSTextAttachment setBounds:](v3->_attachment, "setBounds:", 0.0, 0.0, v15, v16);
    v17 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    badgeView = v3->_badgeView;
    v3->_badgeView = v17;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_badgeView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
    -[UIView setBackgroundColor:](v3->_badgeView, "setBackgroundColor:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v3->_badgeView, "layer"));
    objc_msgSend(v20, "setCornerRadius:", 5.0);

    -[UIView setHidden:](v3->_badgeView, "setHidden:", 1);
    -[UIView setAccessibilityIdentifier:](v3->_badgeView, "setAccessibilityIdentifier:", CFSTR("Badge"));
    -[TwoLinesContentView addSubview:](v3, "addSubview:", v3->_badgeView);
    v21 = (UILabel *)objc_alloc_init((Class)UILabel);
    mainTitleLabel = v3->_mainTitleLabel;
    v3->_mainTitleLabel = v21;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_mainTitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAccessibilityIdentifier:](v3->_mainTitleLabel, "setAccessibilityIdentifier:", CFSTR("MainTitle"));
    -[TwoLinesContentView addSubview:](v3, "addSubview:", v3->_mainTitleLabel);
    v23 = (UILabel *)objc_alloc_init((Class)UILabel);
    secondTitleLabel = v3->_secondTitleLabel;
    v3->_secondTitleLabel = v23;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_secondTitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAccessibilityIdentifier:](v3->_secondTitleLabel, "setAccessibilityIdentifier:", CFSTR("SecondTitle"));
    -[TwoLinesContentView addSubview:](v3, "addSubview:", v3->_secondTitleLabel);
    v25 = (UILabel *)objc_alloc_init((Class)UILabel);
    thirdTitleLabel = v3->_thirdTitleLabel;
    v3->_thirdTitleLabel = v25;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_thirdTitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel _setTouchInsets:](v3->_thirdTitleLabel, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
    -[UILabel setAccessibilityIdentifier:](v3->_thirdTitleLabel, "setAccessibilityIdentifier:", CFSTR("ThirdTitle"));
    -[TwoLinesContentView addSubview:](v3, "addSubview:", v3->_thirdTitleLabel);
    v27 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", v3, "didTapOnThirdLabel:");
    thirdLabelTap = v3->_thirdLabelTap;
    v3->_thirdLabelTap = v27;

    -[UILabel addGestureRecognizer:](v3->_thirdTitleLabel, "addGestureRecognizer:", v3->_thirdLabelTap);
    v29 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    thirdLabelImageView = v3->_thirdLabelImageView;
    v3->_thirdLabelImageView = v29;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_thirdLabelImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v3->_thirdLabelImageView, "setContentMode:", 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UIImageView setBackgroundColor:](v3->_thirdLabelImageView, "setBackgroundColor:", v31);

    LODWORD(v32) = 1148846080;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](v3->_thirdLabelImageView, "setContentCompressionResistancePriority:forAxis:", 0, v32);
    -[UIImageView setClipsToBounds:](v3->_thirdLabelImageView, "setClipsToBounds:", 1);
    -[UIImageView setAccessibilityIdentifier:](v3->_thirdLabelImageView, "setAccessibilityIdentifier:", CFSTR("ThirdLabelImage"));
    -[TwoLinesContentView addSubview:](v3, "addSubview:", v3->_thirdLabelImageView);
    -[TwoLinesContentView _updateDebugLabel](v3, "_updateDebugLabel");
    -[TwoLinesContentView _updateFonts](v3, "_updateFonts");
    -[TwoLinesContentView _updateNumberOfLines](v3, "_updateNumberOfLines");
    -[TwoLinesContentView _updateConstraints](v3, "_updateConstraints");
    -[TwoLinesContentView _updateConstraintConstants](v3, "_updateConstraintConstants");
    -[TwoLinesContentView _updateLabelColors](v3, "_updateLabelColors");
  }
  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSString *v10;
  _BOOL4 IsAccessibilityCategory;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  NSString *v18;
  int v19;
  NSString *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)TwoLinesContentView;
  -[MapsThemeView traitCollectionDidChange:](&v26, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView traitCollection](self, "traitCollection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredContentSizeCategory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));
  v8 = sub_1002A8950(v6, v7);

  if (v8)
    -[TwoLinesContentView _updateFonts](self, "_updateFonts");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView traitCollection](self, "traitCollection"));
  v10 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "preferredContentSizeCategory"));
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));
  if (IsAccessibilityCategory == UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v12))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView traitCollection](self, "traitCollection"));
    v14 = objc_msgSend(v13, "userInterfaceStyle");
    v15 = objc_msgSend(v4, "userInterfaceStyle");

    if (v14 == v15)
      goto LABEL_7;
  }
  else
  {

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView viewModel](self, "viewModel"));
  -[TwoLinesContentView _updateViewsWithViewModel:](self, "_updateViewsWithViewModel:", v16);

LABEL_7:
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView traitCollection](self, "traitCollection"));
  v18 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "preferredContentSizeCategory"));
  v19 = UIContentSizeCategoryIsAccessibilityCategory(v18);
  v20 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));
  v21 = UIContentSizeCategoryIsAccessibilityCategory(v20);

  if (v19 != v21)
  {
    -[TwoLinesContentView _updateNumberOfLines](self, "_updateNumberOfLines");
    -[TwoLinesContentView _updateConstraints](self, "_updateConstraints");
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView traitCollection](self, "traitCollection"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "preferredContentSizeCategory"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));
  v25 = sub_1002A8950(v23, v24);

  if (v25)
    -[TwoLinesContentView _updateConstraintConstants](self, "_updateConstraintConstants");

}

- (void)setIsParentCellSelected:(BOOL)a3
{
  if (self->_isParentCellSelected != a3)
  {
    self->_isParentCellSelected = a3;
    -[TwoLinesContentView _updateLabelColors](self, "_updateLabelColors");
    -[TwoLinesContentView _updateVibrantColor](self, "_updateVibrantColor");
    -[TwoLinesContentView _updateViewsWithViewModel:](self, "_updateViewsWithViewModel:", self->_viewModel);
  }
}

- (void)_updateConstraints
{
  NSArray *constraints;
  NSLayoutConstraint *minimumHeightConstraint;
  void *v5;
  NSLayoutConstraint *v6;
  NSLayoutConstraint *thirdLabelImageViewHeightConstraint;
  void *v8;
  void *v9;
  NSLayoutConstraint *v10;
  NSLayoutConstraint *thirdLabelTopConstraint;
  void *v12;
  uint64_t v13;
  void *v14;
  NSLayoutConstraint *v15;
  NSLayoutConstraint *imageVerticalConstraint;
  void *v17;
  NSLayoutConstraint *v18;
  NSLayoutConstraint *imageHeightConstraint;
  void *v20;
  NSLayoutConstraint *v21;
  NSLayoutConstraint *imageWidthConstraint;
  void *v23;
  void *v24;
  NSLayoutConstraint *v25;
  NSLayoutConstraint *thirdLabelImageViewBottomConstraint;
  void *v27;
  void *v28;
  NSLayoutConstraint *v29;
  NSLayoutConstraint *thirdLabelToThirdImageViewLeadingConstraint;
  void *v31;
  void *v32;
  NSLayoutConstraint *v33;
  NSLayoutConstraint *thirdLabelToLayoutGuideLeadingConstraint;
  NSLayoutConstraint *v35;
  NSLayoutConstraint *v36;
  NSLayoutConstraint *v37;
  NSLayoutConstraint *v38;
  NSLayoutConstraint *v39;
  NSLayoutConstraint *v40;
  void *v41;
  NSLayoutConstraint *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSString *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  double v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  objc_class *v64;
  void *v65;
  uint64_t v66;
  double v67;
  double v68;
  void *v69;
  void *v70;
  NSArray *v71;
  NSArray *v72;
  uint64_t v73;
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
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  uint64_t v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  _QWORD v121[5];
  _QWORD v122[3];
  _QWORD v123[25];

  +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", self->_constraints);
  constraints = self->_constraints;
  self->_constraints = 0;

  minimumHeightConstraint = self->_minimumHeightConstraint;
  self->_minimumHeightConstraint = 0;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](self->_thirdLabelImageView, "heightAnchor"));
  v6 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToConstant:", 0.0));
  thirdLabelImageViewHeightConstraint = self->_thirdLabelImageViewHeightConstraint;
  self->_thirdLabelImageViewHeightConstraint = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_thirdTitleLabel, "topAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_secondTitleLabel, "bottomAnchor"));
  v10 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));
  thirdLabelTopConstraint = self->_thirdLabelTopConstraint;
  self->_thirdLabelTopConstraint = v10;

  LODWORD(v9) = -[TwoLinesContentViewModel shouldCenterImage](self->_viewModel, "shouldCenterImage");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](self->_leftImageView, "centerYAnchor"));
  if ((_DWORD)v9)
    v13 = objc_claimAutoreleasedReturnValue(-[TwoLinesContentView centerYAnchor](self, "centerYAnchor"));
  else
    v13 = objc_claimAutoreleasedReturnValue(-[TwoLinesContentView topAnchor](self, "topAnchor"));
  v14 = (void *)v13;
  v15 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v13, 112));
  imageVerticalConstraint = self->_imageVerticalConstraint;
  self->_imageVerticalConstraint = v15;

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](self->_leftImageView, "heightAnchor"));
  -[TwoLinesContentView _imageDimension](self, "_imageDimension");
  v18 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToConstant:"));
  imageHeightConstraint = self->_imageHeightConstraint;
  self->_imageHeightConstraint = v18;

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](self->_leftImageView, "widthAnchor"));
  -[TwoLinesContentView _imageDimension](self, "_imageDimension");
  v21 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToConstant:"));
  imageWidthConstraint = self->_imageWidthConstraint;
  self->_imageWidthConstraint = v21;

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView bottomAnchor](self->_thirdLabelImageView, "bottomAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_thirdTitleLabel, "bottomAnchor"));
  v25 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v24));
  thirdLabelImageViewBottomConstraint = self->_thirdLabelImageViewBottomConstraint;
  self->_thirdLabelImageViewBottomConstraint = v25;

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](self->_thirdLabelImageView, "trailingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_thirdTitleLabel, "leadingAnchor"));
  v29 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:constant:", v28, -4.0));
  thirdLabelToThirdImageViewLeadingConstraint = self->_thirdLabelToThirdImageViewLeadingConstraint;
  self->_thirdLabelToThirdImageViewLeadingConstraint = v29;

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_thirdTitleLabel, "leadingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](self->_titleLayoutGuide, "leadingAnchor"));
  v33 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v32));
  thirdLabelToLayoutGuideLeadingConstraint = self->_thirdLabelToLayoutGuideLeadingConstraint;
  self->_thirdLabelToLayoutGuideLeadingConstraint = v33;

  v120 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v117 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_mainTitleLabel, "topAnchor"));
  v115 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_titleLayoutGuide, "topAnchor"));
  v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "constraintEqualToAnchor:", v115));
  v123[0] = v114;
  v113 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_secondTitleLabel, "topAnchor"));
  v112 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_mainTitleLabel, "bottomAnchor"));
  -[TwoLinesContentView _labelVerticalSpacing](self, "_labelVerticalSpacing");
  v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "constraintEqualToAnchor:constant:", v112));
  v35 = self->_thirdLabelTopConstraint;
  v123[1] = v111;
  v123[2] = v35;
  v110 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_thirdTitleLabel, "bottomAnchor"));
  v109 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self->_titleLayoutGuide, "bottomAnchor"));
  v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "constraintEqualToAnchor:", v109));
  v123[3] = v108;
  v107 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](self->_thirdLabelImageView, "topAnchor"));
  v106 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_thirdTitleLabel, "topAnchor"));
  v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "constraintEqualToAnchor:", v106));
  v36 = self->_thirdLabelImageViewBottomConstraint;
  v37 = self->_imageVerticalConstraint;
  v38 = self->_imageHeightConstraint;
  v123[4] = v105;
  v123[5] = v36;
  v123[6] = v37;
  v123[7] = v38;
  v104 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](self->_badgeView, "centerYAnchor"));
  v103 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView centerYAnchor](self, "centerYAnchor"));
  v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "constraintEqualToAnchor:", v103));
  v123[8] = v102;
  v101 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](self->_badgeView, "heightAnchor"));
  v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "constraintEqualToConstant:", 10.0));
  v39 = self->_thirdLabelImageViewHeightConstraint;
  v123[9] = v100;
  v123[10] = v39;
  v99 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_mainTitleLabel, "leadingAnchor"));
  v98 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](self->_titleLayoutGuide, "leadingAnchor"));
  v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "constraintEqualToAnchor:", v98));
  v123[11] = v97;
  v96 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_mainTitleLabel, "trailingAnchor"));
  v95 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self->_titleLayoutGuide, "trailingAnchor"));
  v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "constraintEqualToAnchor:", v95));
  v123[12] = v94;
  v93 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_secondTitleLabel, "leadingAnchor"));
  v92 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](self->_titleLayoutGuide, "leadingAnchor"));
  v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "constraintEqualToAnchor:", v92));
  v123[13] = v91;
  v89 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_secondTitleLabel, "trailingAnchor"));
  v88 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self->_titleLayoutGuide, "trailingAnchor"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "constraintEqualToAnchor:", v88));
  v123[14] = v87;
  v86 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](self->_thirdLabelImageView, "leadingAnchor"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](self->_titleLayoutGuide, "leadingAnchor"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "constraintEqualToAnchor:", v85));
  v40 = self->_thirdLabelToThirdImageViewLeadingConstraint;
  v123[15] = v84;
  v123[16] = v40;
  v90 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_thirdTitleLabel, "trailingAnchor"));
  v83 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self->_titleLayoutGuide, "trailingAnchor"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "constraintEqualToAnchor:", v83));
  v123[17] = v82;
  v81 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](self->_leftImageView, "leadingAnchor"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView leadingAnchor](self, "leadingAnchor"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "constraintEqualToAnchor:", v80));
  v123[18] = v79;
  v78 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](self->_titleLayoutGuide, "trailingAnchor"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView trailingAnchor](self, "trailingAnchor"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "constraintEqualToAnchor:", v77));
  v123[19] = v76;
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](self->_leftImageView, "leadingAnchor"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView leadingAnchor](self, "leadingAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "constraintEqualToAnchor:", v74));
  v42 = self->_imageWidthConstraint;
  v123[20] = v41;
  v123[21] = v42;
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](self->_badgeView, "centerXAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView trailingAnchor](self, "trailingAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:", v44));
  v123[22] = v45;
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](self->_badgeView, "widthAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToConstant:", 10.0));
  v123[23] = v47;
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](self->_thirdLabelImageView, "widthAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToConstant:", 20.0));
  v123[24] = v49;
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v123, 25));
  objc_msgSend(v120, "addObjectsFromArray:", v50);

  v51 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView traitCollection](self, "traitCollection"));
  v52 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "preferredContentSizeCategory"));
  LODWORD(v44) = UIContentSizeCategoryIsAccessibilityCategory(v52);

  if ((_DWORD)v44)
  {
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](self->_titleLayoutGuide, "topAnchor"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView topAnchor](self, "topAnchor"));
    -[TwoLinesContentView _verticalMargin](self, "_verticalMargin");
    v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:constant:", v54));
    v122[0] = v119;
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](self->_titleLayoutGuide, "bottomAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView bottomAnchor](self, "bottomAnchor"));
    -[TwoLinesContentView _verticalMargin](self, "_verticalMargin");
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintEqualToAnchor:constant:", v56, -v57));
    v122[1] = v58;
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](self->_titleLayoutGuide, "leadingAnchor"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView leadingAnchor](self, "leadingAnchor"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "constraintEqualToAnchor:", v60));
    v122[2] = v61;
    v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v122, 3));
    objc_msgSend(v120, "addObjectsFromArray:", v62);
  }
  else
  {
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView heightAnchor](self, "heightAnchor"));
    v64 = (objc_class *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "constraintGreaterThanOrEqualToConstant:", 0.0));
    v65 = *(Class *)((char *)&self->super.super.super.super.isa + v73);
    *(Class *)((char *)&self->super.super.super.super.isa + v73) = v64;

    v118 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](self->_titleLayoutGuide, "leadingAnchor"));
    v116 = objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](self->_leftImageView, "trailingAnchor"));
    -[TwoLinesContentView _imageToTextSpacing](self, "_imageToTextSpacing");
    v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "constraintEqualToAnchor:constant:", v116));
    v121[0] = v119;
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerYAnchor](self->_titleLayoutGuide, "centerYAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView centerYAnchor](self, "centerYAnchor"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintEqualToAnchor:", v56));
    v66 = *(uint64_t *)((char *)&self->super.super.super.super.isa + v73);
    v121[1] = v58;
    v121[2] = v66;
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView heightAnchor](self, "heightAnchor"));
    LODWORD(v67) = 1140457472;
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "constraintEqualToConstant:priority:", 0.0, v67));
    v121[3] = v60;
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView heightAnchor](self, "heightAnchor"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide heightAnchor](self->_titleLayoutGuide, "heightAnchor"));
    -[TwoLinesContentView _verticalMargin](self, "_verticalMargin");
    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "constraintGreaterThanOrEqualToAnchor:constant:", v62, v68 + v68));
    v121[4] = v69;
    v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v121, 5));
    objc_msgSend(v120, "addObjectsFromArray:", v70);

    v54 = (void *)v116;
    v53 = v118;
  }

  v71 = (NSArray *)objc_msgSend(v120, "copy");
  v72 = self->_constraints;
  self->_constraints = v71;

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", self->_constraints);
}

- (void)_updateConstraintConstants
{
  void *v3;
  NSString *v4;
  BOOL IsAccessibilityCategory;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSLayoutConstraint *thirdLabelToLayoutGuideLeadingConstraint;
  void *v26;
  void *v27;
  NSLayoutConstraint *thirdLabelToThirdImageViewLeadingConstraint;
  void *v29;
  NSLayoutConstraint *thirdLabelImageViewHeightConstraint;
  double v31;
  double v32;
  _QWORD v33[2];
  NSLayoutConstraint *v34;
  _QWORD v35[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView traitCollection](self, "traitCollection"));
  v4 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "preferredContentSizeCategory"));
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  if (!IsAccessibilityCategory)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_mainTitleLabel, "font"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView traitCollection](self, "traitCollection"));
    objc_msgSend(v7, "displayScale");
    +[UILabel _maps_maximumHeightWithFont:numberOfLines:displayScale:](UILabel, "_maps_maximumHeightWithFont:numberOfLines:displayScale:", v6, 1);
    v9 = v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_secondTitleLabel, "font"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView traitCollection](self, "traitCollection"));
    objc_msgSend(v11, "displayScale");
    +[UILabel _maps_maximumHeightWithFont:numberOfLines:displayScale:](UILabel, "_maps_maximumHeightWithFont:numberOfLines:displayScale:", v10, 1);
    v13 = v12;

    -[TwoLinesContentView _verticalMargin](self, "_verticalMargin");
    v15 = v13 + v9 + v14 * 2.0;
    -[TwoLinesContentView _labelVerticalSpacing](self, "_labelVerticalSpacing");
    v17 = v16 + v15;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView viewModel](self, "viewModel"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "placeContextViewModel"));
    v20 = objc_msgSend(v19, "type");

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView viewModel](self, "viewModel"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "placeContextViewModel"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "attributedString"));
    v24 = objc_msgSend(v23, "length");

    thirdLabelToLayoutGuideLeadingConstraint = self->_thirdLabelToLayoutGuideLeadingConstraint;
    v35[0] = self->_thirdLabelImageViewBottomConstraint;
    v35[1] = thirdLabelToLayoutGuideLeadingConstraint;
    v35[2] = self->_thirdLabelToThirdImageViewLeadingConstraint;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v35, 3));
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v26);

    if (v20 == (id)9 && v24)
    {
      v34 = self->_thirdLabelToLayoutGuideLeadingConstraint;
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v34, 1));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v27);

    }
    else
    {
      thirdLabelToThirdImageViewLeadingConstraint = self->_thirdLabelToThirdImageViewLeadingConstraint;
      v33[0] = self->_thirdLabelImageViewBottomConstraint;
      v33[1] = thirdLabelToThirdImageViewLeadingConstraint;
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 2));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v29);

      thirdLabelImageViewHeightConstraint = self->_thirdLabelImageViewHeightConstraint;
      if (!v24)
      {
        v31 = 0.0;
        -[NSLayoutConstraint setConstant:](thirdLabelImageViewHeightConstraint, "setConstant:", 0.0);
LABEL_8:
        -[NSLayoutConstraint setConstant:](self->_thirdLabelTopConstraint, "setConstant:", v31);
        -[NSLayoutConstraint setConstant:](self->_minimumHeightConstraint, "setConstant:", v17);
        if ((-[TwoLinesContentViewModel shouldCenterImage](self->_viewModel, "shouldCenterImage") & 1) == 0)
        {
          -[NSLayoutConstraint constant](self->_minimumHeightConstraint, "constant");
          -[NSLayoutConstraint setConstant:](self->_imageVerticalConstraint, "setConstant:", v32 * 0.5);
        }
        return;
      }
      -[NSLayoutConstraint setConstant:](thirdLabelImageViewHeightConstraint, "setConstant:", 20.0);
    }
    v31 = 8.0;
    goto LABEL_8;
  }
}

- (void)_updateNumberOfLines
{
  void *v3;
  NSString *v4;
  _BOOL4 IsAccessibilityCategory;
  unsigned int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView traitCollection](self, "traitCollection"));
  v4 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "preferredContentSizeCategory"));
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  if (IsAccessibilityCategory)
  {
    -[UILabel setNumberOfLines:](self->_mainTitleLabel, "setNumberOfLines:", 0);
    -[UILabel setNumberOfLines:](self->_secondTitleLabel, "setNumberOfLines:", 0);
  }
  else
  {
    v6 = -[TwoLinesContentViewModel allowsSubtitleWrapping](self->_viewModel, "allowsSubtitleWrapping");
    -[UILabel setNumberOfLines:](self->_mainTitleLabel, "setNumberOfLines:", 1);
    -[UILabel setNumberOfLines:](self->_secondTitleLabel, "setNumberOfLines:", v6 == 0);
  }
  v7 = objc_claimAutoreleasedReturnValue(-[TwoLinesContentViewModel placeContextViewModel](self->_viewModel, "placeContextViewModel"));
  if (v7
    && (v8 = (void *)v7,
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentViewModel placeContextViewModel](self->_viewModel, "placeContextViewModel")),
        v10 = objc_msgSend(v9, "type"),
        v9,
        v8,
        v10 == (id)9))
  {
    v11 = 2;
  }
  else
  {
    v11 = 1;
  }
  -[UILabel setNumberOfLines:](self->_thirdTitleLabel, "setNumberOfLines:", v11);
}

- (void)_updateLabelColors
{
  int contentViewType;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  UILabel *thirdTitleLabel;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;

  contentViewType = self->_contentViewType;
  if (contentViewType)
  {
    if (contentViewType == 1)
    {
      if (sub_1002A8AA0(self) != 5 || !self->_isParentCellSelected)
      {
        v4 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView _labelColor](self, "_labelColor"));
        -[UILabel setTextColor:](self->_mainTitleLabel, "setTextColor:", v4);

        v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
        -[UILabel setTextColor:](self->_secondTitleLabel, "setTextColor:", v5);

        v6 = objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
LABEL_9:
        v9 = v6;
        v19 = (id)v6;
        thirdTitleLabel = self->_thirdTitleLabel;
        goto LABEL_10;
      }
LABEL_8:
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView _selectedLabelColor](self, "_selectedLabelColor"));
      -[UILabel setTextColor:](self->_mainTitleLabel, "setTextColor:", v7);

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView _selectedLabelColor](self, "_selectedLabelColor"));
      -[UILabel setTextColor:](self->_secondTitleLabel, "setTextColor:", v8);

      v6 = objc_claimAutoreleasedReturnValue(-[TwoLinesContentView _selectedLabelColor](self, "_selectedLabelColor"));
      goto LABEL_9;
    }
  }
  else
  {
    if (sub_1002A8AA0(self) == 5 && self->_isParentCellSelected)
      goto LABEL_8;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView _labelColor](self, "_labelColor"));
    -[UILabel setTextColor:](self->_mainTitleLabel, "setTextColor:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentViewModel subtitleTextColor](self->_viewModel, "subtitleTextColor"));
    if (v13)
    {
      -[UILabel setTextColor:](self->_secondTitleLabel, "setTextColor:", v13);
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
      -[UILabel setTextColor:](self->_secondTitleLabel, "setTextColor:", v14);

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentViewModel placeContextViewModel](self->_viewModel, "placeContextViewModel"));

    if (!v15)
    {
      v16 = objc_claimAutoreleasedReturnValue(-[TwoLinesContentViewModel subtitleTextColor](self->_viewModel, "subtitleTextColor"));
      if (!v16)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
        -[UILabel setTextColor:](self->_thirdTitleLabel, "setTextColor:", v18);

        v11 = 0;
        goto LABEL_11;
      }
      v17 = (void *)v16;
      thirdTitleLabel = self->_thirdTitleLabel;
      v19 = v17;
      v9 = (uint64_t)v17;
LABEL_10:
      -[UILabel setTextColor:](thirdTitleLabel, "setTextColor:", v9);
      v11 = v19;
LABEL_11:

    }
  }
}

- (id)_selectedLabelColor
{
  void *v2;
  int contentViewType;
  void *v4;

  contentViewType = self->_contentViewType;
  if (contentViewType == 1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorWithAlphaComponent:", 0.7));

  }
  else if (!contentViewType)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  }
  return v2;
}

- (id)_labelColor
{
  void *v2;
  int contentViewType;
  void *v5;
  void *v6;
  id v7;

  contentViewType = self->_contentViewType;
  if (contentViewType == 1)
    goto LABEL_4;
  if (!contentViewType)
  {
    if ((-[TwoLinesContentViewModel isDisabled](self->_viewModel, "isDisabled") & 1) != 0)
    {
LABEL_4:
      v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
      return v2;
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentViewModel titleTextColor](self->_viewModel, "titleTextColor"));
    v6 = v5;
    if (v5)
      v7 = v5;
    else
      v7 = (id)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    v2 = v7;

  }
  return v2;
}

- (void)_updateImage:(id)a3
{
  void *v4;
  NSString *v5;
  _BOOL4 IsAccessibilityCategory;
  UIImage *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  NSString *v18;
  BOOL v19;
  id v20;
  UIImage *v21;
  UIImage *v22;
  id v23;
  _QWORD v24[5];
  id v25;

  v21 = (UIImage *)a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView traitCollection](self, "traitCollection"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v5);

  if (IsAccessibilityCategory)
  {
    v7 = v21;
    if (!v21)
      v7 = objc_opt_new(UIImage);
    v22 = v7;
    v8 = objc_claimAutoreleasedReturnValue(-[TwoLinesContentView _renderAttachmentImageWithImage:vibrant:](self, "_renderAttachmentImageWithImage:vibrant:", v7, -[TwoLinesContentViewModel hasVibrantBackground](self->_viewModel, "hasVibrantBackground")));

    -[NSTextAttachment setImage:](self->_attachment, "setImage:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel attributedText](self->_mainTitleLabel, "attributedText"));
    v10 = objc_msgSend(v9, "mutableCopy");

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel attributedText](self->_mainTitleLabel, "attributedText"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel attributedText](self->_mainTitleLabel, "attributedText"));
    v13 = objc_msgSend(v12, "length");
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1003BADCC;
    v24[3] = &unk_1011B40E8;
    v24[4] = self;
    v25 = v10;
    v14 = v10;
    objc_msgSend(v11, "enumerateAttribute:inRange:options:usingBlock:", NSAttachmentAttributeName, 0, v13, 0, v24);

    -[UILabel setAttributedText:](self->_mainTitleLabel, "setAttributedText:", v14);
    -[UILabel setNeedsDisplay](self->_mainTitleLabel, "setNeedsDisplay");

    v15 = (id)v8;
  }
  else
  {
    if (-[UIImage isSymbolImage](v21, "isSymbolImage"))
      v16 = 4;
    else
      v16 = 2;
    -[UIImageView setContentMode:](self->_leftImageView, "setContentMode:", v16);
    -[UIImageView setImage:](self->_leftImageView, "setImage:", v21);
    v15 = v21;
  }
  v23 = v15;
  if (v15
    && (v17 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView traitCollection](self, "traitCollection")),
        v18 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "preferredContentSizeCategory")),
        v19 = UIContentSizeCategoryIsAccessibilityCategory(v18),
        v18,
        v17,
        !v19))
  {
    v20 = -[TwoLinesContentViewModel hasVibrantBackground](self->_viewModel, "hasVibrantBackground");
  }
  else
  {
    v20 = 0;
  }
  -[TwoLinesContentView setVibrant:](self, "setVibrant:", v20);

}

- (void)setVibrant:(BOOL)a3
{
  double v4;
  double v5;
  id v6;
  MKVibrantView *vibrantView;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  MKVibrantView *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];

  if (self->_vibrant != a3)
  {
    self->_vibrant = a3;
    if (a3)
    {
      -[TwoLinesContentView _imageDimension](self, "_imageDimension");
      v5 = v4;
      v6 = objc_msgSend(objc_alloc((Class)MKVibrantView), "initWithFrame:", 0.0, 0.0, v5, v5);
      objc_msgSend(v6, "_setCornerRadius:", v5 * 0.5);
      objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[TwoLinesContentView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v6, self->_leftImageView);
      vibrantView = self->_vibrantView;
      self->_vibrantView = (MKVibrantView *)v6;
      v8 = v6;

      -[TwoLinesContentView _updateVibrantColor](self, "_updateVibrantColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "centerXAnchor"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerXAnchor](self->_leftImageView, "centerXAnchor"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v21));
      v23[0] = v20;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "centerYAnchor"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](self->_leftImageView, "centerYAnchor"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v9));
      v23[1] = v10;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "widthAnchor"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](self->_leftImageView, "widthAnchor"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v12));
      v23[2] = v13;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "heightAnchor"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](self->_leftImageView, "heightAnchor"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v15));
      v23[3] = v16;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 4));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v17);

    }
    else
    {
      -[MKVibrantView removeFromSuperview](self->_vibrantView, "removeFromSuperview");
      v18 = self->_vibrantView;
      self->_vibrantView = 0;

    }
  }
}

- (id)_renderAttachmentImageWithImage:(id)a3 vibrant:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  NSString *v8;
  _BOOL4 IsAccessibilityCategory;
  double v10;
  double v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;

  v4 = a4;
  v6 = a3;
  if (v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView traitCollection](self, "traitCollection"));
    v8 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "preferredContentSizeCategory"));
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v8);

    if (IsAccessibilityCategory)
    {
      -[TwoLinesContentView _imageDimension](self, "_imageDimension");
      v11 = v10;
      v12 = objc_alloc((Class)UIGraphicsImageRenderer);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView traitCollection](self, "traitCollection"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIGraphicsImageRendererFormat formatForTraitCollection:](UIGraphicsImageRendererFormat, "formatForTraitCollection:", v13));
      v15 = objc_msgSend(v12, "initWithSize:format:", v14, v11, v11);

      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_1003BB2A4;
      v18[3] = &unk_1011B4110;
      v19 = v6;
      v16 = v6;
      v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "imageWithActions:", v18));

    }
  }
  return v6;
}

- (void)setViewModel:(id)a3
{
  TwoLinesContentViewModel *v5;
  TwoLinesContentViewModel **p_viewModel;
  unsigned int v7;
  unsigned int v8;
  void *v9;
  void *v10;
  TwoLinesContentViewModel *v11;

  v5 = (TwoLinesContentViewModel *)a3;
  p_viewModel = &self->_viewModel;
  if (self->_viewModel != v5)
  {
    v11 = v5;
    v7 = -[TwoLinesContentViewModel shouldCenterImage](v5, "shouldCenterImage");
    v8 = -[TwoLinesContentViewModel shouldCenterImage](*p_viewModel, "shouldCenterImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentViewModel observers](*p_viewModel, "observers"));
    objc_msgSend(v9, "unregisterObserver:", self);

    objc_storeStrong((id *)&self->_viewModel, a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentViewModel observers](*p_viewModel, "observers"));
    objc_msgSend(v10, "registerObserver:", self);

    if (v7 != v8)
      -[TwoLinesContentView _updateConstraints](self, "_updateConstraints");
    -[TwoLinesContentView _updateViewsWithViewModel:](self, "_updateViewsWithViewModel:", v11);
    -[TwoLinesContentView _updateLabelColors](self, "_updateLabelColors");
    -[TwoLinesContentView _updateFonts](self, "_updateFonts");
    -[TwoLinesContentView _updateNumberOfLines](self, "_updateNumberOfLines");
    -[TwoLinesContentView _updateConstraintConstants](self, "_updateConstraintConstants");
    v5 = v11;
  }

}

- (void)_updateViewsWithViewModel:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int contentViewType;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  NSString *v20;
  _BOOL4 IsAccessibilityCategory;
  void *v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  BOOL v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  id v41;
  UIView *v42;
  UIView *leftImageShadowView;
  UIView *v44;
  UIView *v45;
  void *v46;
  void *v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  double v58;
  id v59;
  void *v60;
  double v61;
  double v62;
  void *v63;
  double v64;
  double v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  double v71;
  double v72;
  double v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  int v79;
  void *v80;
  UILabel *thirdTitleLabel;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  id v99;
  void *v100;
  void *v101;
  _QWORD v102[4];
  id v103;
  int v104;
  id location;
  NSAttributedStringKey v106;
  void *v107;

  v4 = a3;
  -[TwoLinesContentView _updateImage:](self, "_updateImage:", 0);
  v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "titleText"));
  v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subtitleText"));
  v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "attributedSubtitleText"));
  if (!objc_msgSend(v100, "length"))
    goto LABEL_7;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "titleHighlightRanges"));
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    contentViewType = self->_contentViewType;
    if (contentViewType)
    {
      if (contentViewType == 1)
      {
        v8 = !self->_isParentCellSelected;
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "titleHighlightRanges"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView _titleFont](self, "_titleFont"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView _titleFont](self, "_titleFont"));
        if (v8)
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
        else
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
        v13 = (id)objc_claimAutoreleasedReturnValue(+[NSAttributedString attributedStringWithText:highlightRanges:font:highlightedFont:highlightedTextColor:](NSAttributedString, "attributedStringWithText:highlightRanges:font:highlightedFont:highlightedTextColor:", v100, v9, v10, v11, v12));

        goto LABEL_17;
      }
LABEL_7:
      v13 = 0;
      goto LABEL_18;
    }
    if (!objc_msgSend(v4, "shouldEnableGrayscaleHighlighting")
      || (v17 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView traitCollection](self, "traitCollection")),
          v18 = objc_msgSend(v17, "userInterfaceIdiom"),
          v17,
          v18 == (id)5))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "titleHighlightRanges"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView _titleRegularFont](self, "_titleRegularFont"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView _titleFont](self, "_titleFont"));
      v13 = (id)objc_claimAutoreleasedReturnValue(+[NSAttributedString attributedStringWithText:boldInRange:font:bold:](NSAttributedString, "attributedStringWithText:boldInRange:font:bold:", v100, v9, v10, v11));
LABEL_17:

      goto LABEL_18;
    }
    v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "titleHighlightRanges"));
    v94 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView _titleFont](self, "_titleFont"));
    v95 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView _titleFont](self, "_titleFont"));
    v96 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    v97 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    v13 = (id)objc_claimAutoreleasedReturnValue(+[NSAttributedString attributedStringWithText:highlightRanges:font:highlightedFont:highlightedTextColor:unhighlightedTextColor:](NSAttributedString, "attributedStringWithText:highlightRanges:font:highlightedFont:highlightedTextColor:unhighlightedTextColor:", v100, v93, v94, v95, v96, v97));

  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "titleTextFont"));

    if (v14)
    {
      v106 = NSFontAttributeName;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "titleTextFont"));
      v107 = v15;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v107, &v106, 1));

    }
    else
    {
      v16 = 0;
    }
    v13 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:attributes:", v100, v16);

  }
LABEL_18:
  if (objc_msgSend(v101, "length"))
  {
    v99 = v101;
  }
  else if (objc_msgSend(v98, "length"))
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subtitleHighlightRanges"));
    v35 = objc_msgSend(v34, "count") == 0;

    if (v35)
    {
      v99 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", v98);
    }
    else
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subtitleHighlightRanges"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system15](UIFont, "system15"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system15Bold](UIFont, "system15Bold"));
      v99 = (id)objc_claimAutoreleasedReturnValue(+[NSAttributedString attributedStringWithText:boldInRange:font:bold:](NSAttributedString, "attributedStringWithText:boldInRange:font:bold:", v98, v36, v37, v38));

    }
  }
  else
  {
    v99 = 0;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView traitCollection](self, "traitCollection"));
  v20 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "preferredContentSizeCategory"));
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v20);

  if (IsAccessibilityCategory)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSAttributedString attributedStringWithAttachment:](NSAttributedString, "attributedStringWithAttachment:", self->_attachment));
    v23 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithAttributedString:", v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "titleText"));

    if (v24)
    {
      v25 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", CFSTR(" "));
      objc_msgSend(v23, "appendAttributedString:", v25);

      v26 = objc_alloc((Class)NSAttributedString);
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "titleText"));
      v28 = objc_msgSend(v26, "initWithString:", v27);
      objc_msgSend(v23, "appendAttributedString:", v28);

    }
    -[UIImageView setHidden:](self->_leftImageView, "setHidden:", 1);

  }
  else
  {
    -[UIImageView setHidden:](self->_leftImageView, "setHidden:", 0);
    v23 = v13;
  }
  -[UILabel setAttributedText:](self->_mainTitleLabel, "setAttributedText:", v23);
  -[UILabel setAttributedText:](self->_secondTitleLabel, "setAttributedText:", v99);
  -[UIView setHidden:](self->_badgeView, "setHidden:", objc_msgSend(v4, "showBadgeView") ^ 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView window](self, "window"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "screen"));
  v31 = v30;
  if (v30)
  {
    objc_msgSend(v30, "scale");
    v33 = v32;
  }
  else
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v39, "scale");
    v33 = v40;

  }
  v41 = objc_msgSend(v4, "imageShadowStyle");
  if (v41 == (id)1)
  {
    leftImageShadowView = self->_leftImageShadowView;
    if (!leftImageShadowView)
    {
      v44 = (UIView *)objc_alloc_init((Class)UIView);
      v45 = self->_leftImageShadowView;
      self->_leftImageShadowView = v44;

      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_leftImageShadowView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_leftImageShadowView, "layer"));
      objc_msgSend(v46, "setShadowPathIsBounds:", 1);

      v47 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_leftImageShadowView, "layer"));
      objc_msgSend(v47, "setPunchoutShadow:", 1);

      -[TwoLinesContentView addSubview:](self, "addSubview:", self->_leftImageShadowView);
      LODWORD(v48) = 1148846080;
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[UIView _maps_constraintsEqualToEdgesOfView:priority:](self->_leftImageShadowView, "_maps_constraintsEqualToEdgesOfView:priority:", self->_leftImageView, v48));
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "allConstraints"));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v50);

      leftImageShadowView = self->_leftImageShadowView;
    }
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](leftImageShadowView, "layer"));
    objc_msgSend(v51, "setBorderWidth:", 1.0 / v33);

    v52 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.454901963, 0.454901963, 0.501960814, 0.200000003)));
    v53 = objc_msgSend(v52, "CGColor");
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_leftImageShadowView, "layer"));
    objc_msgSend(v54, "setBorderColor:", v53);

    v55 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_leftImageShadowView, "layer"));
    objc_msgSend(v55, "setShadowOffset:", 0.0, 1.0);

    v56 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_leftImageShadowView, "layer"));
    objc_msgSend(v56, "setShadowRadius:", 5.0);

    v57 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_leftImageShadowView, "layer"));
    LODWORD(v58) = 1036831949;
    objc_msgSend(v57, "setShadowOpacity:", v58);

    v42 = (UIView *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor")));
    v59 = -[UIView CGColor](v42, "CGColor");
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_leftImageShadowView, "layer"));
    objc_msgSend(v60, "setShadowColor:", v59);

  }
  else
  {
    if (v41)
      goto LABEL_38;
    -[UIView removeFromSuperview](self->_leftImageShadowView, "removeFromSuperview");
    v42 = self->_leftImageShadowView;
    self->_leftImageShadowView = 0;
  }

LABEL_38:
  -[UIView setHidden:](self->_leftImageShadowView, "setHidden:", -[UIImageView isHidden](self->_leftImageView, "isHidden"));
  switch((unint64_t)objc_msgSend(v4, "imageStyle"))
  {
    case 0uLL:
      -[TwoLinesContentView _imageDimension](self, "_imageDimension");
      v62 = v61;
      v63 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_leftImageView, "layer"));
      objc_msgSend(v63, "setCornerRadius:", v62 * 0.5);

      -[TwoLinesContentView _imageDimension](self, "_imageDimension");
      v65 = v64;
      v66 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_leftImageShadowView, "layer"));
      objc_msgSend(v66, "setCornerRadius:", v65 * 0.5);

      break;
    case 1uLL:
      v67 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_leftImageView, "layer"));
      objc_msgSend(v67, "setCornerRadius:", 5.0);

      v68 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_leftImageShadowView, "layer"));
      objc_msgSend(v68, "setCornerRadius:", 5.0);

      break;
    case 2uLL:
      -[UIImageView _setContinuousCornerRadius:](self->_leftImageView, "_setContinuousCornerRadius:", 4.0);
      -[UIView _setContinuousCornerRadius:](self->_leftImageShadowView, "_setContinuousCornerRadius:", 4.0);
      break;
    case 3uLL:
      -[UIImageView _setContinuousCornerRadius:](self->_leftImageView, "_setContinuousCornerRadius:", 7.0);
      -[UIView _setContinuousCornerRadius:](self->_leftImageShadowView, "_setContinuousCornerRadius:", 7.0);
      break;
    case 4uLL:
      v69 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_leftImageView, "layer"));
      objc_msgSend(v69, "setCornerRadius:", 0.0);

      v70 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_leftImageShadowView, "layer"));
      objc_msgSend(v70, "setCornerRadius:", 0.0);

      break;
    default:
      break;
  }
  objc_msgSend(v4, "imageSize");
  if (CGSizeZero.width != v72 || CGSizeZero.height != v71)
  {
    objc_msgSend(v4, "imageSize");
    -[NSLayoutConstraint setConstant:](self->_imageWidthConstraint, "setConstant:");
    objc_msgSend(v4, "imageSize");
    -[NSLayoutConstraint setConstant:](self->_imageHeightConstraint, "setConstant:", v73);
  }
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leftImageTintColor"));

  if (v74)
  {
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leftImageTintColor"));
    -[UIImageView setTintColor:](self->_leftImageView, "setTintColor:", v75);

  }
  v76 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UIImageView setBackgroundColor:](self->_leftImageView, "setBackgroundColor:", v76);

  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingImageBackgroundColor"));
  if (v77)
  {
    v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingImageBackgroundColor"));
    -[UIImageView setBackgroundColor:](self->_leftImageView, "setBackgroundColor:", v78);

  }
  v79 = self->_imageState + 1;
  self->_imageState = v79;
  objc_initWeak(&location, self);
  v102[0] = _NSConcreteStackBlock;
  v102[1] = 3221225472;
  v102[2] = sub_1003BC128;
  v102[3] = &unk_1011B4138;
  objc_copyWeak(&v103, &location);
  v104 = v79;
  objc_msgSend(v4, "fetchImageForScreenScale:withCompletionHandler:", v102, v33);
  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "placeContextViewModel"));

  thirdTitleLabel = self->_thirdTitleLabel;
  if (v80)
  {
    -[UILabel setHidden:](thirdTitleLabel, "setHidden:", 0);
    v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "placeContextViewModel"));
    -[UILabel setUserInteractionEnabled:](self->_thirdTitleLabel, "setUserInteractionEnabled:", objc_msgSend(v82, "isTappable"));

    v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "placeContextViewModel"));
    v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "attributedString"));
    -[UILabel setAttributedText:](self->_thirdTitleLabel, "setAttributedText:", v84);

    v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "placeContextViewModel"));
    v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "image"));
    -[UIImageView setHidden:](self->_thirdLabelImageView, "setHidden:", v86 == 0);

    v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "placeContextViewModel"));
    v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "image"));
    -[UIImageView setImage:](self->_thirdLabelImageView, "setImage:", v88);

    v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "placeContextViewModel"));
    v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "imageTintColor"));
    -[UIImageView setTintColor:](self->_thirdLabelImageView, "setTintColor:", v90);

    v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "placeContextViewModel"));
    objc_msgSend(v91, "imageContinuousCornerRadius");
    -[UIImageView _setContinuousCornerRadius:](self->_thirdLabelImageView, "_setContinuousCornerRadius:");

    v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "placeContextViewModel"));
    -[UITapGestureRecognizer setEnabled:](self->_thirdLabelTap, "setEnabled:", objc_msgSend(v92, "isTappable"));

  }
  else
  {
    -[UILabel setHidden:](thirdTitleLabel, "setHidden:", 1);
    -[UILabel setUserInteractionEnabled:](self->_thirdTitleLabel, "setUserInteractionEnabled:", 0);
    -[UILabel setAttributedText:](self->_thirdTitleLabel, "setAttributedText:", 0);
    -[UIImageView setHidden:](self->_thirdLabelImageView, "setHidden:", 1);
    -[UIImageView setImage:](self->_thirdLabelImageView, "setImage:", 0);
  }
  -[TwoLinesContentView _updateDebugLabel](self, "_updateDebugLabel");
  objc_destroyWeak(&v103);
  objc_destroyWeak(&location);

}

- (void)twoLinesTableViewCellModelDidUpdate:(id)a3
{
  if (self->_viewModel == a3)
    -[TwoLinesContentView _updateViewsWithViewModel:](self, "_updateViewsWithViewModel:");
}

- (void)_updateDebugLabel
{
  void *v3;
  UILabel *debugLabel;
  UILabel *v5;
  UILabel *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  UILabel *v16;
  void *v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentViewModel debugString](self->_viewModel, "debugString"));

  debugLabel = self->_debugLabel;
  if (v3)
  {
    if (!debugLabel)
    {
      v5 = (UILabel *)objc_alloc_init((Class)UILabel);
      v6 = self->_debugLabel;
      self->_debugLabel = v5;

      -[UILabel setAccessibilityIdentifier:](self->_debugLabel, "setAccessibilityIdentifier:", CFSTR("SearchCellDebug"));
      -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_debugLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system11](UIFont, "system11"));
      -[UILabel setFont:](self->_debugLabel, "setFont:", v7);

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
      -[UILabel setTextColor:](self->_debugLabel, "setTextColor:", v8);

      -[UILabel setAlpha:](self->_debugLabel, "setAlpha:", 0.5);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
      -[UILabel setBackgroundColor:](self->_debugLabel, "setBackgroundColor:", v9);

      -[TwoLinesContentView addSubview:](self, "addSubview:", self->_debugLabel);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_debugLabel, "leadingAnchor"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView leadingAnchor](self, "leadingAnchor"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, 10.0));
      objc_msgSend(v12, "setActive:", 1);

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_debugLabel, "bottomAnchor"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView bottomAnchor](self, "bottomAnchor"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, -2.0));
      objc_msgSend(v15, "setActive:", 1);

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentViewModel debugString](self->_viewModel, "debugString"));
    -[UILabel setText:](self->_debugLabel, "setText:", v17);

  }
  else if (debugLabel)
  {
    -[UILabel removeFromSuperview](debugLabel, "removeFromSuperview");
    v16 = self->_debugLabel;
    self->_debugLabel = 0;

  }
}

- (id)_titleFont
{
  void *v2;
  id v3;
  id v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView traitCollection](self, "traitCollection"));
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 == (id)5)
  {
    v4 = sub_10094EC28();
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17SemiBold](UIFont, "system17SemiBold"));
  }
  return v5;
}

- (id)_titleRegularFont
{
  void *v2;
  id v3;
  id v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView traitCollection](self, "traitCollection"));
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 == (id)5)
  {
    v4 = sub_10094EC28();
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17](UIFont, "system17"));
  }
  return v5;
}

- (id)_subtitleFont
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  unsigned int v7;
  void *v8;
  uint64_t v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView traitCollection](self, "traitCollection"));
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == (id)5)
  {
    v5 = sub_10094EC34();
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }
  else
  {
    v7 = -[TwoLinesContentViewModel subtitleUsesMonospacedNumbers](self->_viewModel, "subtitleUsesMonospacedNumbers");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system15](UIFont, "system15"));
    v6 = v8;
    if (v7)
    {
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_maps_fontWithMonospacedNumbers"));

      v6 = (void *)v9;
    }
  }
  return v6;
}

- (void)_updateFonts
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView _titleFont](self, "_titleFont"));
  -[UILabel setFont:](self->_mainTitleLabel, "setFont:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView _subtitleFont](self, "_subtitleFont"));
  -[UILabel setFont:](self->_secondTitleLabel, "setFont:", v4);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView _subtitleFont](self, "_subtitleFont"));
  -[UILabel setFont:](self->_thirdTitleLabel, "setFont:", v5);

}

- (double)_verticalMargin
{
  uint64_t v3;
  double result;

  v3 = sub_1002A8AA0(self);
  result = 16.0;
  if (v3 == 5)
  {
    result = 3.0;
    if (self->_contentViewType == 1)
      return 4.5;
  }
  return result;
}

- (double)_imageDimension
{
  uint64_t v2;
  double result;

  v2 = sub_1002A8AA0(self);
  result = 30.0;
  if (v2 == 5)
    return 24.0;
  return result;
}

- (double)_imageToTextSpacing
{
  uint64_t v2;
  double result;

  v2 = sub_1002A8AA0(self);
  result = 12.0;
  if (v2 == 5)
    return 8.0;
  return result;
}

- (double)_labelVerticalSpacing
{
  uint64_t v2;
  double result;

  v2 = sub_1002A8AA0(self);
  result = 2.0;
  if (v2 == 5)
    return 0.0;
  return result;
}

- (void)didTapOnThirdLabel:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView viewModel](self, "viewModel", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "placeContextViewModel"));

  if (v5)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView placeContextViewModelDelegate](self, "placeContextViewModelDelegate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView viewModel](self, "viewModel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "placeContextViewModel"));
    objc_msgSend(v8, "didTapOnPlaceContextWithViewModel:parentView:", v7, self);

  }
}

- (TwoLinesContentViewModel)viewModel
{
  return self->_viewModel;
}

- (PlaceContextViewModelCellDelegate)placeContextViewModelDelegate
{
  return (PlaceContextViewModelCellDelegate *)objc_loadWeakRetained((id *)&self->_placeContextViewModelDelegate);
}

- (void)setPlaceContextViewModelDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_placeContextViewModelDelegate, a3);
}

- (BOOL)isParentCellSelected
{
  return self->_isParentCellSelected;
}

- (int)contentViewType
{
  return self->_contentViewType;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_placeContextViewModelDelegate);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_vibrantView, 0);
  objc_storeStrong((id *)&self->_thirdLabelToThirdImageViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_thirdLabelToLayoutGuideLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_thirdLabelImageViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_imageWidthConstraint, 0);
  objc_storeStrong((id *)&self->_imageHeightConstraint, 0);
  objc_storeStrong((id *)&self->_thirdLabelTopConstraint, 0);
  objc_storeStrong((id *)&self->_thirdLabelImageViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_imageCenteredVerticalConstraint, 0);
  objc_storeStrong((id *)&self->_imageVerticalConstraint, 0);
  objc_storeStrong((id *)&self->_minimumHeightConstraint, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_attachment, 0);
  objc_storeStrong((id *)&self->_thirdLabelTap, 0);
  objc_storeStrong((id *)&self->_thirdLabelImageView, 0);
  objc_storeStrong((id *)&self->_leftImageShadowView, 0);
  objc_storeStrong((id *)&self->_leftImageView, 0);
  objc_storeStrong((id *)&self->_debugLabel, 0);
  objc_storeStrong((id *)&self->_thirdTitleLabel, 0);
  objc_storeStrong((id *)&self->_secondTitleLabel, 0);
  objc_storeStrong((id *)&self->_mainTitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLayoutGuide, 0);
}

@end
