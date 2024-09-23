@implementation RidesharingAppLargeIconTableViewCell

- (RidesharingAppLargeIconTableViewCell)initWithFrame:(CGRect)a3
{
  RidesharingAppLargeIconTableViewCell *v3;
  RidesharingAppLargeIconTableViewCell *v4;
  void *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)RidesharingAppLargeIconTableViewCell;
  v3 = -[MapsThemeCollectionViewCell initWithFrame:](&v10, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[RidesharingAppLargeIconTableViewCell _setupViews](v3, "_setupViews");
    -[RidesharingAppLargeIconTableViewCell _setupConstraints](v4, "_setupConstraints");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, "_updateContentSizeCategoryDependentFontsAndConstraints", UIContentSizeCategoryDidChangeNotification, 0);

    -[RidesharingAppLargeIconTableViewCell _updateContentSizeCategoryDependentFontsAndConstraints](v4, "_updateContentSizeCategoryDependentFontsAndConstraints");
    v6 = (objc_class *)objc_opt_class(v4);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[RidesharingAppLargeIconTableViewCell setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", v8);

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
  v4.super_class = (Class)RidesharingAppLargeIconTableViewCell;
  -[RidesharingAppLargeIconTableViewCell dealloc](&v4, "dealloc");
}

- (void)_setupViews
{
  id v3;
  double y;
  double width;
  double height;
  UILabel *v7;
  UILabel *majorLabel;
  double v9;
  void *v10;
  void *v11;
  UILabel *v12;
  UILabel *minorLabel;
  double v14;
  void *v15;
  void *v16;
  UIButton *v17;
  UIButton *actionButton;
  double v19;
  double v20;
  UIButton *v21;
  void *v22;
  void *v23;
  void *v24;
  UIActivityIndicatorView *v25;
  UIActivityIndicatorView *activityIndicatorView;
  void *v27;
  UILabel *v28;
  UILabel *ratingLabel;
  double v30;
  void *v31;
  UIImageView *v32;
  UIImageView *iconImageView;
  void *v34;
  UILayoutGuide *v35;
  UILayoutGuide *textLayoutGuide;
  void *v37;

  v3 = objc_alloc((Class)UILabel);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = (UILabel *)objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  majorLabel = self->_majorLabel;
  self->_majorLabel = v7;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_majorLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setNumberOfLines:](self->_majorLabel, "setNumberOfLines:", 0);
  LODWORD(v9) = 1148829696;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_majorLabel, "setContentCompressionResistancePriority:forAxis:", 1, v9);
  -[UILabel setAccessibilityIdentifier:](self->_majorLabel, "setAccessibilityIdentifier:", CFSTR("Title"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell contentView](self, "contentView"));
  objc_msgSend(v10, "addSubview:", self->_majorLabel);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UILabel setTextColor:](self->_majorLabel, "setTextColor:", v11);

  v12 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  minorLabel = self->_minorLabel;
  self->_minorLabel = v12;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_minorLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setNumberOfLines:](self->_minorLabel, "setNumberOfLines:", 0);
  LODWORD(v14) = 1148829696;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_minorLabel, "setContentCompressionResistancePriority:forAxis:", 1, v14);
  -[UILabel setAccessibilityIdentifier:](self->_minorLabel, "setAccessibilityIdentifier:", CFSTR("Subtitle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell contentView](self, "contentView"));
  objc_msgSend(v15, "addSubview:", self->_minorLabel);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[UILabel setTextColor:](self->_minorLabel, "setTextColor:", v16);

  v17 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
  actionButton = self->_actionButton;
  self->_actionButton = v17;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_actionButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v19) = 1148829696;
  -[UIButton setContentCompressionResistancePriority:forAxis:](self->_actionButton, "setContentCompressionResistancePriority:forAxis:", 0, v19);
  LODWORD(v20) = 1148829696;
  -[UIButton setContentHuggingPriority:forAxis:](self->_actionButton, "setContentHuggingPriority:forAxis:", 0, v20);
  v21 = self->_actionButton;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("View"), CFSTR("localized string not found"), 0));
  -[UIButton setTitle:forState:](v21, "setTitle:forState:", v23, 0);

  -[UIButton addTarget:action:forControlEvents:](self->_actionButton, "addTarget:action:forControlEvents:", self, "_actionButtonPressed:", 64);
  -[UIButton setAccessibilityIdentifier:](self->_actionButton, "setAccessibilityIdentifier:", CFSTR("ActionButton"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell contentView](self, "contentView"));
  objc_msgSend(v24, "addSubview:", self->_actionButton);

  v25 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 100);
  activityIndicatorView = self->_activityIndicatorView;
  self->_activityIndicatorView = v25;

  -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](self->_activityIndicatorView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIActivityIndicatorView setHidesWhenStopped:](self->_activityIndicatorView, "setHidesWhenStopped:", 1);
  -[UIActivityIndicatorView setAccessibilityIdentifier:](self->_activityIndicatorView, "setAccessibilityIdentifier:", CFSTR("RideSharingActivityIndicator"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell contentView](self, "contentView"));
  objc_msgSend(v27, "addSubview:", self->_activityIndicatorView);

  v28 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  ratingLabel = self->_ratingLabel;
  self->_ratingLabel = v28;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_ratingLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setNumberOfLines:](self->_ratingLabel, "setNumberOfLines:", 0);
  -[UILabel setLineBreakMode:](self->_ratingLabel, "setLineBreakMode:", 0);
  LODWORD(v30) = 1148829696;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_ratingLabel, "setContentCompressionResistancePriority:forAxis:", 1, v30);
  -[UILabel setAccessibilityIdentifier:](self->_ratingLabel, "setAccessibilityIdentifier:", CFSTR("Ratings"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell contentView](self, "contentView"));
  objc_msgSend(v31, "addSubview:", self->_ratingLabel);

  v32 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  iconImageView = self->_iconImageView;
  self->_iconImageView = v32;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_iconImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIImageView setAccessibilityIdentifier:](self->_iconImageView, "setAccessibilityIdentifier:", CFSTR("Icon"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell contentView](self, "contentView"));
  objc_msgSend(v34, "addSubview:", self->_iconImageView);

  v35 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  textLayoutGuide = self->_textLayoutGuide;
  self->_textLayoutGuide = v35;

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell contentView](self, "contentView"));
  objc_msgSend(v37, "addLayoutGuide:", self->_textLayoutGuide);

  -[RidesharingAppLargeIconTableViewCell updateTheme](self, "updateTheme");
}

- (void)updateTheme
{
  UIButton *actionButton;
  void *v4;
  void *v5;
  UIButton *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)RidesharingAppLargeIconTableViewCell;
  -[MapsThemeCollectionViewCell updateTheme](&v13, "updateTheme");
  actionButton = self->_actionButton;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell theme](self, "theme"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "keyColor"));
  -[UIButton setTitleColor:forState:](actionButton, "setTitleColor:forState:", v5, 0);

  v6 = self->_actionButton;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell theme](self, "theme"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "darkKeyColor"));
  -[UIButton setTitleColor:forState:](v6, "setTitleColor:forState:", v8, 1);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel attributedText](self->_ratingLabel, "attributedText"));
  v10 = objc_msgSend(v9, "mutableCopy");

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  objc_msgSend(v10, "addAttribute:value:range:", NSForegroundColorAttributeName, v11, 0, objc_msgSend(v10, "length"));

  -[UILabel setAttributedText:](self->_ratingLabel, "setAttributedText:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell theme](self, "theme"));
  -[UIActivityIndicatorView setActivityIndicatorViewStyle:](self->_activityIndicatorView, "setActivityIndicatorViewStyle:", objc_msgSend(v12, "activityIndicatorStyle"));

}

- (void)_setupConstraints
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSLayoutConstraint *v10;
  NSLayoutConstraint *majorLabelBaselineToTopConstraint;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSLayoutConstraint *v16;
  NSLayoutConstraint *minorLabelBaselineToMajorLabelBaselineConstraint;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSLayoutConstraint *v22;
  NSLayoutConstraint *ratingsLabelBaselineToMinorLabelBaselineConstraint;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSLayoutConstraint *v28;
  NSLayoutConstraint *ratingsLabelToBottomConstraint;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSLayoutConstraint *v34;
  NSLayoutConstraint *minorLabelToBottomConsttraint;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSLayoutConstraint *v40;
  NSLayoutConstraint *majorLabelToBottomConstraint;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSLayoutConstraint *v46;
  NSLayoutConstraint *textToActionButtonConstraint;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSLayoutConstraint *v52;
  NSLayoutConstraint *textToActivityIndicatorConstraint;
  NSLayoutConstraint *v54;
  NSLayoutConstraint *v55;
  NSLayoutConstraint *v56;
  NSLayoutConstraint *v57;
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
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  id v148;
  void *v149;
  _QWORD v150[25];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell contentView](self, "contentView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "heightAnchor"));
  +[RouteOverviewCell minimumRidesharingHeight](RouteOverviewCell, "minimumRidesharingHeight");
  v149 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToConstant:"));

  LODWORD(v5) = 1148813312;
  objc_msgSend(v149, "setPriority:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell majorLabel](self, "majorLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstBaselineAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell contentView](self, "contentView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "topAnchor"));
  v10 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintGreaterThanOrEqualToAnchor:", v9));
  majorLabelBaselineToTopConstraint = self->_majorLabelBaselineToTopConstraint;
  self->_majorLabelBaselineToTopConstraint = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell minorLabel](self, "minorLabel"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstBaselineAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell majorLabel](self, "majorLabel"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastBaselineAnchor"));
  v16 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v15));
  minorLabelBaselineToMajorLabelBaselineConstraint = self->_minorLabelBaselineToMajorLabelBaselineConstraint;
  self->_minorLabelBaselineToMajorLabelBaselineConstraint = v16;

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell ratingLabel](self, "ratingLabel"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "firstBaselineAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell minorLabel](self, "minorLabel"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "lastBaselineAnchor"));
  v22 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v21));
  ratingsLabelBaselineToMinorLabelBaselineConstraint = self->_ratingsLabelBaselineToMinorLabelBaselineConstraint;
  self->_ratingsLabelBaselineToMinorLabelBaselineConstraint = v22;

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell ratingLabel](self, "ratingLabel"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "bottomAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell textLayoutGuide](self, "textLayoutGuide"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "bottomAnchor"));
  v28 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v27));
  ratingsLabelToBottomConstraint = self->_ratingsLabelToBottomConstraint;
  self->_ratingsLabelToBottomConstraint = v28;

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell minorLabel](self, "minorLabel"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "bottomAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell textLayoutGuide](self, "textLayoutGuide"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "bottomAnchor"));
  v34 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v33));
  minorLabelToBottomConsttraint = self->_minorLabelToBottomConsttraint;
  self->_minorLabelToBottomConsttraint = v34;

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell majorLabel](self, "majorLabel"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "bottomAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell textLayoutGuide](self, "textLayoutGuide"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "bottomAnchor"));
  v40 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v39));
  majorLabelToBottomConstraint = self->_majorLabelToBottomConstraint;
  self->_majorLabelToBottomConstraint = v40;

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell actionButton](self, "actionButton"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "leadingAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell textLayoutGuide](self, "textLayoutGuide"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "trailingAnchor"));
  v46 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:constant:", v45, 15.0));
  textToActionButtonConstraint = self->_textToActionButtonConstraint;
  self->_textToActionButtonConstraint = v46;

  v48 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell activityIndicatorView](self, "activityIndicatorView"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "leadingAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell textLayoutGuide](self, "textLayoutGuide"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "trailingAnchor"));
  v52 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:constant:", v51, 25.0));
  textToActivityIndicatorConstraint = self->_textToActivityIndicatorConstraint;
  self->_textToActivityIndicatorConstraint = v52;

  v148 = objc_alloc_init((Class)NSMutableArray);
  v147 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell textLayoutGuide](self, "textLayoutGuide"));
  v145 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v147, "leadingAnchor"));
  v146 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell ratingLabel](self, "ratingLabel"));
  v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v146, "leadingAnchor"));
  v143 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v145, "constraintEqualToAnchor:", v144));
  v150[0] = v143;
  v142 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell iconImageView](self, "iconImageView"));
  v140 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v142, "leadingAnchor"));
  v141 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell contentView](self, "contentView"));
  v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v141, "leadingAnchor"));
  v137 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v140, "constraintEqualToAnchor:constant:", v138, 16.0));
  v150[1] = v137;
  v136 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell iconImageView](self, "iconImageView"));
  v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v136, "widthAnchor"));
  v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v135, "constraintEqualToConstant:", 62.0));
  v150[2] = v134;
  v133 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell textLayoutGuide](self, "textLayoutGuide"));
  v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v133, "leadingAnchor"));
  v132 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell iconImageView](self, "iconImageView"));
  v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v132, "trailingAnchor"));
  v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "constraintEqualToAnchor:constant:", v130, 13.0));
  v150[3] = v129;
  v128 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell textLayoutGuide](self, "textLayoutGuide"));
  v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "leadingAnchor"));
  v127 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell majorLabel](self, "majorLabel"));
  v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v127, "leadingAnchor"));
  v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "constraintEqualToAnchor:", v125));
  v150[4] = v124;
  v123 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell textLayoutGuide](self, "textLayoutGuide"));
  v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "leadingAnchor"));
  v122 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell minorLabel](self, "minorLabel"));
  v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "leadingAnchor"));
  v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v121, "constraintEqualToAnchor:", v120));
  v150[5] = v119;
  v118 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell textLayoutGuide](self, "textLayoutGuide"));
  v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "trailingAnchor"));
  v117 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell majorLabel](self, "majorLabel"));
  v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "trailingAnchor"));
  v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "constraintEqualToAnchor:", v115));
  v150[6] = v114;
  v113 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell textLayoutGuide](self, "textLayoutGuide"));
  v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "trailingAnchor"));
  v112 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell minorLabel](self, "minorLabel"));
  v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "trailingAnchor"));
  v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "constraintEqualToAnchor:", v110));
  v150[7] = v109;
  v108 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell textLayoutGuide](self, "textLayoutGuide"));
  v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "trailingAnchor"));
  v107 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell ratingLabel](self, "ratingLabel"));
  v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "trailingAnchor"));
  v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "constraintEqualToAnchor:", v105));
  v150[8] = v104;
  v103 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell actionButton](self, "actionButton"));
  v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "widthAnchor"));
  v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "constraintGreaterThanOrEqualToConstant:", 47.0));
  v54 = self->_textToActionButtonConstraint;
  v150[9] = v101;
  v150[10] = v54;
  v100 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell actionButton](self, "actionButton"));
  v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "trailingAnchor"));
  v99 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell contentView](self, "contentView"));
  v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "trailingAnchor"));
  v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "constraintEqualToAnchor:constant:", v97, -15.0));
  v150[11] = v96;
  v95 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell activityIndicatorView](self, "activityIndicatorView"));
  v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "trailingAnchor"));
  v94 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell contentView](self, "contentView"));
  v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "trailingAnchor"));
  v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "constraintEqualToAnchor:constant:", v92, -37.0));
  v150[12] = v91;
  v150[13] = v149;
  v90 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell iconImageView](self, "iconImageView"));
  v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "centerYAnchor"));
  v89 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell contentView](self, "contentView"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "centerYAnchor"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "constraintEqualToAnchor:", v87));
  v150[14] = v86;
  v85 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell iconImageView](self, "iconImageView"));
  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "heightAnchor"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell iconImageView](self, "iconImageView"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "widthAnchor"));
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "constraintEqualToAnchor:", v82));
  v150[15] = v81;
  v80 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell textLayoutGuide](self, "textLayoutGuide"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "centerYAnchor"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell contentView](self, "contentView"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "centerYAnchor"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "constraintEqualToAnchor:", v77));
  v150[16] = v76;
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell majorLabel](self, "majorLabel"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "topAnchor"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell textLayoutGuide](self, "textLayoutGuide"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "topAnchor"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "constraintEqualToAnchor:", v72));
  v55 = self->_majorLabelBaselineToTopConstraint;
  v56 = self->_minorLabelBaselineToMajorLabelBaselineConstraint;
  v57 = self->_ratingsLabelBaselineToMinorLabelBaselineConstraint;
  v150[17] = v71;
  v150[18] = v55;
  v150[19] = v56;
  v150[20] = v57;
  v150[21] = self->_ratingsLabelToBottomConstraint;
  v139 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell actionButton](self, "actionButton"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v139, "centerYAnchor"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell contentView](self, "contentView"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "centerYAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "constraintEqualToAnchor:", v68));
  v150[22] = v58;
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell activityIndicatorView](self, "activityIndicatorView"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "centerYAnchor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell contentView](self, "contentView"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "centerYAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToAnchor:", v62));
  v150[23] = v63;
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell actionButton](self, "actionButton"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "heightAnchor"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "constraintGreaterThanOrEqualToConstant:", 26.0));
  v150[24] = v66;
  v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v150, 25));
  objc_msgSend(v148, "addObjectsFromArray:", v67);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v148);
}

- (void)_updateContentSizeCategoryDependentFontsAndConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  double v10;
  void *v11;
  uint64_t v12;
  double v13;
  void *v14;
  uint64_t v15;
  double v16;
  void *v17;
  void *v18;
  uint64_t v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  uint64_t v24;
  double v25;
  double v26;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:", UIFontTextStyleTitle3, 2));
  -[UILabel setFont:](self->_majorLabel, "setFont:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:", UIFontTextStyleSubheadline, 0));
  -[UILabel setFont:](self->_minorLabel, "setFont:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:", UIFontTextStyleCaption1, 0));
  -[UILabel setFont:](self->_ratingLabel, "setFont:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:", UIFontTextStyleSubheadline, 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_actionButton, "titleLabel"));
  objc_msgSend(v7, "setFont:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_majorLabel, "font"));
  objc_msgSend(v8, "_mapkit_scaledValueForValue:", 37.0);
  -[NSLayoutConstraint setConstant:](self->_majorLabelBaselineToTopConstraint, "setConstant:", UIRoundToViewScale(self, v9, v10));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_minorLabel, "font"));
  objc_msgSend(v11, "_mapkit_scaledValueForValue:", 21.0);
  -[NSLayoutConstraint setConstant:](self->_minorLabelBaselineToMajorLabelBaselineConstraint, "setConstant:", UIRoundToViewScale(self, v12, v13));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_ratingLabel, "font"));
  objc_msgSend(v14, "_mapkit_scaledValueForValue:", 18.0);
  -[NSLayoutConstraint setConstant:](self->_ratingsLabelBaselineToMinorLabelBaselineConstraint, "setConstant:", UIRoundToViewScale(self, v15, v16));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_actionButton, "titleLabel"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "font"));
  objc_msgSend(v18, "_mapkit_scaledValueForValue:", 8.0);
  v21 = UIRoundToViewScale(self, v19, v20);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_actionButton, "titleLabel"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "font"));
  objc_msgSend(v23, "_mapkit_scaledValueForValue:", 8.0);
  v26 = UIRoundToViewScale(self, v24, v25);

  -[UIButton setContentEdgeInsets:](self->_actionButton, "setContentEdgeInsets:", v21, v26, v21, v26);
}

- (void)configureWithSuggestedApp:(id)a3
{
  id v4;
  NSString *v5;
  NSString *applicationIdentifer;
  void *v7;
  float v8;
  double v9;
  uint64_t v10;
  UILabel *ratingLabel;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSURL *v16;
  NSURL *lastRequestedImageURL;
  void *v18;
  void *v19;
  _QWORD v20[5];

  v4 = a3;
  -[RidesharingAppLargeIconTableViewCell _clearContent](self, "_clearContent");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "iOSBundleIdentifier"));
  applicationIdentifer = self->_applicationIdentifer;
  self->_applicationIdentifer = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayName"));
  -[UILabel setText:](self->_majorLabel, "setText:", v7);

  objc_msgSend(v4, "ratingsValue");
  v9 = v8;
  v10 = (int)objc_msgSend(v4, "ratingsCount");
  ratingLabel = self->_ratingLabel;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:addingSymbolicTraits:", UIFontTextStyleCaption1, 0));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell mk_theme](self, "mk_theme"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MKStarRatingAndLabelView ratingAndReviewsAsAttributedString:style:font:numberOfReviews:textColor:theme:](MKStarRatingAndLabelView, "ratingAndReviewsAsAttributedString:style:font:numberOfReviews:textColor:theme:", 1, v12, v10, v13, v14, v9));
  -[UILabel setAttributedText:](ratingLabel, "setAttributedText:", v15);

  v16 = (NSURL *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "artworkURL"));
  lastRequestedImageURL = self->_lastRequestedImageURL;
  self->_lastRequestedImageURL = v16;

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[MKAppImageManager sharedImageManager](MKAppImageManager, "sharedImageManager"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "artworkURL"));

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10078FCA0;
  v20[3] = &unk_1011C6638;
  v20[4] = self;
  objc_msgSend(v18, "loadAppImageAtURL:completionHandler:", v19, v20);

  -[RidesharingAppLargeIconTableViewCell _updateViewsAndConstraintsForShowingSuggestedApp](self, "_updateViewsAndConstraintsForShowingSuggestedApp");
}

- (void)configureForErrorMessageWithRideBookingRideOptionStatus:(id)a3
{
  void *v4;
  NSString *v5;
  NSString *applicationIdentifer;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[RidesharingAppLargeIconTableViewCell _clearContent](self, "_clearContent");
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "application"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  applicationIdentifer = self->_applicationIdentifer;
  self->_applicationIdentifer = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "application"));
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
  -[UILabel setText:](self->_majorLabel, "setText:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "errorMessage"));
  -[UILabel setText:](self->_minorLabel, "setText:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "application"));
  v11 = objc_opt_class(RideBookingApplication);
  LOBYTE(v8) = objc_opt_isKindOfClass(v10, v11);

  if ((v8 & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "application"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "iconWithFormat:", 2));
    -[UIImageView setImage:](self->_iconImageView, "setImage:", v13);

  }
  -[RidesharingAppLargeIconTableViewCell _updateViewsAndConstraintsForShowingErrorWithRideBookingRideOptionStatus:](self, "_updateViewsAndConstraintsForShowingErrorWithRideBookingRideOptionStatus:", v14);

}

- (void)configureForLoadingStateWithEnabledRideBookingApplication:(id)a3
{
  id v4;
  NSString *v5;
  NSString *applicationIdentifer;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[RidesharingAppLargeIconTableViewCell _clearContent](self, "_clearContent");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  applicationIdentifer = self->_applicationIdentifer;
  self->_applicationIdentifer = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  -[UILabel setText:](self->_majorLabel, "setText:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Checking for available rides..."), CFSTR("localized string not found"), 0));
  -[UILabel setText:](self->_minorLabel, "setText:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "iconWithFormat:", 2));
  -[UIImageView setImage:](self->_iconImageView, "setImage:", v10);

  -[RidesharingAppLargeIconTableViewCell _updateViewsAndConstraintsForShowingLoadingStateOfEnabledApp](self, "_updateViewsAndConstraintsForShowingLoadingStateOfEnabledApp");
}

- (void)configureWithDisabledRideBookingApplication:(id)a3 showActionButton:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSString *v7;
  NSString *applicationIdentifer;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a4;
  v6 = a3;
  -[RidesharingAppLargeIconTableViewCell _clearContent](self, "_clearContent");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  applicationIdentifer = self->_applicationIdentifer;
  self->_applicationIdentifer = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
  -[UILabel setText:](self->_majorLabel, "setText:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Installed [Ridesharing]"), CFSTR("localized string not found"), 0));
  -[UILabel setText:](self->_minorLabel, "setText:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "iconWithFormat:", 2));
  -[UIImageView setImage:](self->_iconImageView, "setImage:", v12);

  -[RidesharingAppLargeIconTableViewCell _updateViewsAndConstraintsForShowingDisabledApp:](self, "_updateViewsAndConstraintsForShowingDisabledApp:", v4);
}

- (void)configureForLoadingStateWithDisabledRideBookingApplication:(id)a3
{
  id v4;
  NSString *v5;
  NSString *applicationIdentifer;
  void *v7;
  void *v8;

  v4 = a3;
  -[RidesharingAppLargeIconTableViewCell _clearContent](self, "_clearContent");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  applicationIdentifer = self->_applicationIdentifer;
  self->_applicationIdentifer = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  -[UILabel setText:](self->_majorLabel, "setText:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "iconWithFormat:", 2));
  -[UIImageView setImage:](self->_iconImageView, "setImage:", v8);

  -[RidesharingAppLargeIconTableViewCell _updateViewsAndConstraintsForShowingLoadingStateOfDisabledApp](self, "_updateViewsAndConstraintsForShowingLoadingStateOfDisabledApp");
}

- (void)_updateViewsAndConstraintsForShowingSuggestedApp
{
  UIButton *actionButton;
  void *v4;
  void *v5;

  -[UILabel setHidden:](self->_minorLabel, "setHidden:", 1);
  -[UILabel setHidden:](self->_ratingLabel, "setHidden:", 0);
  -[NSLayoutConstraint setActive:](self->_ratingsLabelToBottomConstraint, "setActive:", 1);
  -[NSLayoutConstraint setActive:](self->_minorLabelToBottomConsttraint, "setActive:", 0);
  -[NSLayoutConstraint setActive:](self->_majorLabelToBottomConstraint, "setActive:", 0);
  -[UIButton setHidden:](self->_actionButton, "setHidden:", 0);
  -[UIActivityIndicatorView stopAnimating](self->_activityIndicatorView, "stopAnimating");
  actionButton = self->_actionButton;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("View"), CFSTR("localized string not found"), 0));
  -[UIButton setTitle:forState:](actionButton, "setTitle:forState:", v5, 0);

  -[NSLayoutConstraint setActive:](self->_textToActionButtonConstraint, "setActive:", 1);
  -[NSLayoutConstraint setActive:](self->_textToActivityIndicatorConstraint, "setActive:", 0);
}

- (void)_updateViewsAndConstraintsForShowingLoadingStateOfEnabledApp
{
  -[UILabel setHidden:](self->_minorLabel, "setHidden:", 0);
  -[UILabel setHidden:](self->_ratingLabel, "setHidden:", 1);
  -[NSLayoutConstraint setActive:](self->_ratingsLabelToBottomConstraint, "setActive:", 0);
  -[NSLayoutConstraint setActive:](self->_minorLabelToBottomConsttraint, "setActive:", 1);
  -[NSLayoutConstraint setActive:](self->_majorLabelToBottomConstraint, "setActive:", 0);
  -[UIButton setHidden:](self->_actionButton, "setHidden:", 1);
  -[UIActivityIndicatorView startAnimating](self->_activityIndicatorView, "startAnimating");
  -[NSLayoutConstraint setActive:](self->_textToActionButtonConstraint, "setActive:", 0);
  -[NSLayoutConstraint setActive:](self->_textToActivityIndicatorConstraint, "setActive:", 1);
}

- (void)_updateViewsAndConstraintsForShowingDisabledApp:(BOOL)a3
{
  _BOOL4 v3;
  UIButton *actionButton;
  void *v6;
  void *v7;

  v3 = a3;
  -[UILabel setHidden:](self->_minorLabel, "setHidden:", 0);
  -[UILabel setHidden:](self->_ratingLabel, "setHidden:", 1);
  -[NSLayoutConstraint setActive:](self->_ratingsLabelToBottomConstraint, "setActive:", 0);
  -[NSLayoutConstraint setActive:](self->_minorLabelToBottomConsttraint, "setActive:", 1);
  -[NSLayoutConstraint setActive:](self->_majorLabelToBottomConstraint, "setActive:", 0);
  -[UIButton setHidden:](self->_actionButton, "setHidden:", !v3);
  -[UIActivityIndicatorView stopAnimating](self->_activityIndicatorView, "stopAnimating");
  actionButton = self->_actionButton;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Show Rides"), CFSTR("localized string not found"), 0));
  -[UIButton setTitle:forState:](actionButton, "setTitle:forState:", v7, 0);

  -[NSLayoutConstraint setActive:](self->_textToActionButtonConstraint, "setActive:", 1);
  -[NSLayoutConstraint setActive:](self->_textToActivityIndicatorConstraint, "setActive:", 0);
}

- (void)_updateViewsAndConstraintsForShowingLoadingStateOfDisabledApp
{
  UIButton *actionButton;
  void *v4;
  void *v5;

  -[UILabel setHidden:](self->_minorLabel, "setHidden:", 0);
  -[UILabel setHidden:](self->_ratingLabel, "setHidden:", 1);
  -[NSLayoutConstraint setActive:](self->_ratingsLabelToBottomConstraint, "setActive:", 0);
  -[NSLayoutConstraint setActive:](self->_minorLabelToBottomConsttraint, "setActive:", 0);
  -[NSLayoutConstraint setActive:](self->_majorLabelToBottomConstraint, "setActive:", 1);
  -[UIButton setHidden:](self->_actionButton, "setHidden:", 1);
  -[UIActivityIndicatorView startAnimating](self->_activityIndicatorView, "startAnimating");
  actionButton = self->_actionButton;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Show Rides"), CFSTR("localized string not found"), 0));
  -[UIButton setTitle:forState:](actionButton, "setTitle:forState:", v5, 0);

  -[NSLayoutConstraint setActive:](self->_textToActionButtonConstraint, "setActive:", 0);
  -[NSLayoutConstraint setActive:](self->_textToActivityIndicatorConstraint, "setActive:", 1);
}

- (void)_updateViewsAndConstraintsForShowingErrorWithRideBookingRideOptionStatus:(id)a3
{
  UIButton *actionButton;
  void *v5;
  id v6;

  v6 = a3;
  -[UILabel setHidden:](self->_minorLabel, "setHidden:", 0);
  -[UILabel setHidden:](self->_ratingLabel, "setHidden:", 1);
  -[NSLayoutConstraint setActive:](self->_ratingsLabelToBottomConstraint, "setActive:", 0);
  -[NSLayoutConstraint setActive:](self->_minorLabelToBottomConsttraint, "setActive:", 1);
  -[NSLayoutConstraint setActive:](self->_majorLabelToBottomConstraint, "setActive:", 0);
  -[UIActivityIndicatorView stopAnimating](self->_activityIndicatorView, "stopAnimating");
  -[NSLayoutConstraint setActive:](self->_textToActionButtonConstraint, "setActive:", 1);
  -[NSLayoutConstraint setActive:](self->_textToActivityIndicatorConstraint, "setActive:", 0);
  -[UIButton setHidden:](self->_actionButton, "setHidden:", 1);
  -[UIButton setTitle:forState:](self->_actionButton, "setTitle:forState:", 0, 0);
  if (objc_msgSend(v6, "rideOptionStatusError") == (id)11)
  {
    -[UIButton setHidden:](self->_actionButton, "setHidden:", 0);
    actionButton = self->_actionButton;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "errorMessage"));
    -[UIButton setTitle:forState:](actionButton, "setTitle:forState:", v5, 0);

  }
}

- (void)_clearContent
{
  NSString *applicationIdentifer;

  applicationIdentifer = self->_applicationIdentifer;
  self->_applicationIdentifer = 0;

  -[UILabel setText:](self->_majorLabel, "setText:", 0);
  -[UILabel setText:](self->_minorLabel, "setText:", 0);
  -[UILabel setText:](self->_ratingLabel, "setText:", 0);
  -[UILabel setAttributedText:](self->_ratingLabel, "setAttributedText:", 0);
  -[UIImageView setImage:](self->_iconImageView, "setImage:", 0);
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RidesharingAppLargeIconTableViewCell;
  -[RidesharingAppLargeIconTableViewCell prepareForReuse](&v4, "prepareForReuse");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKAppImageManager sharedImageManager](MKAppImageManager, "sharedImageManager"));
  objc_msgSend(v3, "cancelLoadAppImageAtURL:", self->_lastRequestedImageURL);

}

- (void)_actionButtonPressed:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RidesharingAppLargeIconTableViewCell delegate](self, "delegate"));
  objc_msgSend(v5, "ridesharingAppLargeIconTableViewCell:didSelectActionButton:", self, v4);

}

- (RidesharingAppLargeIconTableViewCellDelegate)delegate
{
  return (RidesharingAppLargeIconTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)applicationIdentifer
{
  return self->_applicationIdentifer;
}

- (void)setApplicationIdentifer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (UILabel)majorLabel
{
  return self->_majorLabel;
}

- (void)setMajorLabel:(id)a3
{
  objc_storeStrong((id *)&self->_majorLabel, a3);
}

- (UILabel)minorLabel
{
  return self->_minorLabel;
}

- (void)setMinorLabel:(id)a3
{
  objc_storeStrong((id *)&self->_minorLabel, a3);
}

- (UIButton)actionButton
{
  return self->_actionButton;
}

- (void)setActionButton:(id)a3
{
  objc_storeStrong((id *)&self->_actionButton, a3);
}

- (UILabel)ratingLabel
{
  return self->_ratingLabel;
}

- (void)setRatingLabel:(id)a3
{
  objc_storeStrong((id *)&self->_ratingLabel, a3);
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageView:(id)a3
{
  objc_storeStrong((id *)&self->_iconImageView, a3);
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (void)setActivityIndicatorView:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicatorView, a3);
}

- (UILayoutGuide)textLayoutGuide
{
  return self->_textLayoutGuide;
}

- (void)setTextLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_textLayoutGuide, a3);
}

- (NSURL)lastRequestedImageURL
{
  return self->_lastRequestedImageURL;
}

- (void)setLastRequestedImageURL:(id)a3
{
  objc_storeStrong((id *)&self->_lastRequestedImageURL, a3);
}

- (NSLayoutConstraint)majorLabelBaselineToTopConstraint
{
  return self->_majorLabelBaselineToTopConstraint;
}

- (void)setMajorLabelBaselineToTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_majorLabelBaselineToTopConstraint, a3);
}

- (NSLayoutConstraint)minorLabelBaselineToMajorLabelBaselineConstraint
{
  return self->_minorLabelBaselineToMajorLabelBaselineConstraint;
}

- (void)setMinorLabelBaselineToMajorLabelBaselineConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_minorLabelBaselineToMajorLabelBaselineConstraint, a3);
}

- (NSLayoutConstraint)ratingsLabelBaselineToMinorLabelBaselineConstraint
{
  return self->_ratingsLabelBaselineToMinorLabelBaselineConstraint;
}

- (void)setRatingsLabelBaselineToMinorLabelBaselineConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_ratingsLabelBaselineToMinorLabelBaselineConstraint, a3);
}

- (NSLayoutConstraint)ratingsLabelToBottomConstraint
{
  return self->_ratingsLabelToBottomConstraint;
}

- (void)setRatingsLabelToBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_ratingsLabelToBottomConstraint, a3);
}

- (NSLayoutConstraint)minorLabelToBottomConsttraint
{
  return self->_minorLabelToBottomConsttraint;
}

- (void)setMinorLabelToBottomConsttraint:(id)a3
{
  objc_storeStrong((id *)&self->_minorLabelToBottomConsttraint, a3);
}

- (NSLayoutConstraint)majorLabelToBottomConstraint
{
  return self->_majorLabelToBottomConstraint;
}

- (void)setMajorLabelToBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_majorLabelToBottomConstraint, a3);
}

- (NSLayoutConstraint)textToActivityIndicatorConstraint
{
  return self->_textToActivityIndicatorConstraint;
}

- (void)setTextToActivityIndicatorConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_textToActivityIndicatorConstraint, a3);
}

- (NSLayoutConstraint)textToActionButtonConstraint
{
  return self->_textToActionButtonConstraint;
}

- (void)setTextToActionButtonConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_textToActionButtonConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textToActionButtonConstraint, 0);
  objc_storeStrong((id *)&self->_textToActivityIndicatorConstraint, 0);
  objc_storeStrong((id *)&self->_majorLabelToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_minorLabelToBottomConsttraint, 0);
  objc_storeStrong((id *)&self->_ratingsLabelToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_ratingsLabelBaselineToMinorLabelBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_minorLabelBaselineToMajorLabelBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_majorLabelBaselineToTopConstraint, 0);
  objc_storeStrong((id *)&self->_lastRequestedImageURL, 0);
  objc_storeStrong((id *)&self->_textLayoutGuide, 0);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_ratingLabel, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_minorLabel, 0);
  objc_storeStrong((id *)&self->_majorLabel, 0);
  objc_storeStrong((id *)&self->_applicationIdentifer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
