@implementation CHAchievementsCellContentView

- (CHAchievementsCellContentView)initWithFrame:(CGRect)a3
{
  CHAchievementsCellContentView *v3;
  void *v4;
  uint64_t v5;
  UIColor *earnedInstanceCountLabelBackgroundColor;
  AAUIAchievementResourceProvider *v7;
  AAUIAchievementResourceProvider *resourceProvider;
  id v9;
  double y;
  double width;
  double height;
  UIImageView *v13;
  UIImageView *badgeView;
  UILabel *v15;
  UILabel *label;
  void *v17;
  double v18;
  UIProgressView *v19;
  UIProgressView *progressBar;
  void *v21;
  void *v22;
  UIColor *v23;
  void *v24;
  void *v25;
  void *v26;
  CHPillLabelView *v27;
  CHPillLabelView *earnedInstanceCountLabelView;
  void *v29;
  uint64_t v30;
  CALayer *darkeningLayer;
  id v32;
  void *v33;
  double v34;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)CHAchievementsCellContentView;
  v3 = -[CHAchievementsCellContentView initWithFrame:](&v36, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[CHAchievementsCellContentView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = objc_claimAutoreleasedReturnValue(+[UIColor fu_systemTextGreyColor](UIColor, "fu_systemTextGreyColor"));
    earnedInstanceCountLabelBackgroundColor = v3->_earnedInstanceCountLabelBackgroundColor;
    v3->_earnedInstanceCountLabelBackgroundColor = (UIColor *)v5;

    v7 = (AAUIAchievementResourceProvider *)objc_alloc_init((Class)AAUIAchievementResourceProvider);
    resourceProvider = v3->_resourceProvider;
    v3->_resourceProvider = v7;

    v3->_preferredWidth = 100.0;
    v9 = objc_alloc((Class)UIImageView);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v13 = (UIImageView *)objc_msgSend(v9, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    badgeView = v3->_badgeView;
    v3->_badgeView = v13;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_badgeView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v3->_badgeView, "setContentMode:", 4);
    v15 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    label = v3->_label;
    v3->_label = v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](v3->_label, "setTextColor:", v17);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v3->_label, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](v3->_label, "setTextAlignment:", 1);
    -[UILabel setLineBreakMode:](v3->_label, "setLineBreakMode:", 0);
    LODWORD(v18) = 1036831949;
    -[UILabel _setHyphenationFactor:](v3->_label, "_setHyphenationFactor:", v18);
    v19 = (UIProgressView *)objc_msgSend(objc_alloc((Class)UIProgressView), "initWithProgressViewStyle:", 1);
    progressBar = v3->_progressBar;
    v3->_progressBar = v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[ARUIMetricColors briskColors](ARUIMetricColors, "briskColors"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "gradientLightColor"));
    -[UIProgressView setProgressTintColor:](v3->_progressBar, "setProgressTintColor:", v22);

    v23 = sub_1000D3E30();
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    -[UIProgressView setTrackTintColor:](v3->_progressBar, "setTrackTintColor:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIProgressView layer](v3->_progressBar, "layer"));
    objc_msgSend(v25, "setCornerRadius:", 2.0);

    -[UIProgressView setTranslatesAutoresizingMaskIntoConstraints:](v3->_progressBar, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIProgressView layer](v3->_progressBar, "layer"));
    objc_msgSend(v26, "setMasksToBounds:", 1);

    -[UIProgressView setHidden:](v3->_progressBar, "setHidden:", 1);
    -[CHAchievementsCellContentView addSubview:](v3, "addSubview:", v3->_badgeView);
    if (AAUIShouldUseNewTrophyCase(-[CHAchievementsCellContentView addSubview:](v3, "addSubview:", v3->_label)))
      -[CHAchievementsCellContentView addSubview:](v3, "addSubview:", v3->_progressBar);
    v27 = -[CHPillLabelView initWithFrame:]([CHPillLabelView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    earnedInstanceCountLabelView = v3->_earnedInstanceCountLabelView;
    v3->_earnedInstanceCountLabelView = v27;

    -[CHPillLabelView setPillBackgroundColor:](v3->_earnedInstanceCountLabelView, "setPillBackgroundColor:", v3->_earnedInstanceCountLabelBackgroundColor);
    -[CHAchievementsCellContentView addSubview:](v3, "addSubview:", v3->_earnedInstanceCountLabelView);
    -[CHAchievementsCellContentView applyViewConstraints](v3, "applyViewConstraints");
    -[CHAchievementsCellContentView fontSizeChanged:](v3, "fontSizeChanged:", 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v29, "addObserver:selector:name:object:", v3, "fontSizeChanged:", UIContentSizeCategoryDidChangeNotification, 0);

    v30 = objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
    darkeningLayer = v3->_darkeningLayer;
    v3->_darkeningLayer = (CALayer *)v30;

    v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor")));
    -[CALayer setBackgroundColor:](v3->_darkeningLayer, "setBackgroundColor:", objc_msgSend(v32, "CGColor"));

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsCellContentView layer](v3, "layer"));
    objc_msgSend(v33, "addSublayer:", v3->_darkeningLayer);

    LODWORD(v34) = 0;
    -[CALayer setOpacity:](v3->_darkeningLayer, "setOpacity:", v34);
  }
  return v3;
}

+ (id)monthlyDateFormatter
{
  if (qword_10083E0E8 != -1)
    dispatch_once(&qword_10083E0E8, &stru_10077A1D0);
  return (id)qword_10083E0E0;
}

+ (id)stringForAchievement:(id)a3 locProvider:(id)a4 formatForFriend:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[2];
  _QWORD v36[2];

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "titleForAchievement:", v8));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" ")));

  if (!v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "template"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uniqueName"));

  }
  if (objc_msgSend(v8, "unearned"))
  {
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "unachievedShortDescriptionForAchievement:", v8));
  }
  else
  {
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "achievedShortDescriptionForAchievement:", v8));
    if (v5 && objc_msgSend(a1, "shouldShowCountForAchievement:", v8))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "relevantEarnedInstance"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "earnedDateComponents"));

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
      v19 = v10;
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "dateFromComponents:", v17));

      v21 = ACHFormatDateWithStyle(v20, 0);
      v22 = objc_claimAutoreleasedReturnValue(v21);

      v10 = v19;
      v15 = (__CFString *)v22;
    }
  }
  if ((-[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("ACHIEVEMENT_UNACHIEVED_SHORT_DESCRIPTION")) & 1) != 0|| -[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("ACHIEVEMENT_ACHIEVED_SHORT_DESCRIPTION")))
  {

    v15 = &stru_1007AE1D0;
  }
  if (-[__CFString length](v15, "length"))
  {
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByAppendingString:", CFSTR("\n")));

    v13 = (void *)v23;
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleCaption2));
  v25 = objc_alloc((Class)NSMutableAttributedString);
  v35[0] = NSFontAttributeName;
  v35[1] = NSForegroundColorAttributeName;
  v36[0] = v24;
  v36[1] = v10;
  v26 = (void *)v10;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v36, v35, 2));
  v28 = objc_msgSend(v25, "initWithString:attributes:", v13, v27);

  if (-[__CFString length](v15, "length"))
  {
    v29 = objc_alloc((Class)NSAttributedString);
    v33[0] = NSFontAttributeName;
    v33[1] = NSForegroundColorAttributeName;
    v34[0] = v24;
    v34[1] = v11;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v34, v33, 2));
    v31 = objc_msgSend(v29, "initWithString:attributes:", v15, v30);
    objc_msgSend(v28, "appendAttributedString:", v31);

  }
  return v28;
}

+ (BOOL)shouldShowCountForAchievement:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  BOOL v6;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "template"));
  if (!objc_msgSend(v4, "displaysEarnedInstanceCount"))
  {

    goto LABEL_6;
  }
  v5 = objc_msgSend(v3, "unearned");

  if ((v5 & 1) != 0)
  {
LABEL_6:
    v6 = 0;
    goto LABEL_7;
  }
  if (ACHShouldUseNewAwardsSystem())
  {
    v6 = objc_msgSend(v3, "earnedInstanceCount") != 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "earnedInstances"));
    v6 = objc_msgSend(v8, "count") != 0;

  }
LABEL_7:

  return v6;
}

+ (double)cellHeightForAchievement:(id)a3 preferredWidth:(double)a4 appliesLargeCellInsets:(BOOL)a5 locProvider:(id)a6
{
  double result;

  +[CHAchievementsCellContentView cellHeightForAchievement:preferredWidth:appliesLargeCellInsets:locProvider:withProgressBar:formatForFriend:](CHAchievementsCellContentView, "cellHeightForAchievement:preferredWidth:appliesLargeCellInsets:locProvider:withProgressBar:formatForFriend:", a3, a5, a6, 1, 0, a4);
  return result;
}

+ (double)cellHeightForAchievement:(id)a3 preferredWidth:(double)a4 appliesLargeCellInsets:(BOOL)a5 locProvider:(id)a6 withProgressBar:(BOOL)a7
{
  double result;

  +[CHAchievementsCellContentView cellHeightForAchievement:preferredWidth:appliesLargeCellInsets:locProvider:withProgressBar:formatForFriend:](CHAchievementsCellContentView, "cellHeightForAchievement:preferredWidth:appliesLargeCellInsets:locProvider:withProgressBar:formatForFriend:", a3, a5, a6, a7, 0, a4);
  return result;
}

+ (double)cellHeightForAchievement:(id)a3 preferredWidth:(double)a4 appliesLargeCellInsets:(BOOL)a5 locProvider:(id)a6 withProgressBar:(BOOL)a7 formatForFriend:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL4 v9;
  _BOOL4 v11;
  id v14;
  id v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;

  v8 = a8;
  v9 = a7;
  v11 = a5;
  v14 = a3;
  v15 = a6;
  if (v11)
    v16 = 17.0;
  else
    v16 = 9.0;
  if (v11)
    a4 = a4 + a4 * -0.05;
  if (qword_10083E0F8 != -1)
    dispatch_once(&qword_10083E0F8, &stru_10077A1F0);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleCaption2));
  objc_msgSend((id)qword_10083E0F0, "setFont:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "stringForAchievement:locProvider:formatForFriend:", v14, v15, v8));
  objc_msgSend((id)qword_10083E0F0, "setAttributedText:", v18);

  objc_msgSend((id)qword_10083E0F0, "sizeThatFits:", a4, 1.79769313e308);
  v20 = v19;
  v21 = 0.0;
  objc_msgSend((id)qword_10083E0F0, "setFrame:", 0.0, 0.0, a4, v19);
  objc_msgSend((id)qword_10083E0F0, "_lastLineBaselineFrameOriginY");
  v23 = v22;
  v24 = v16 + v20;
  objc_msgSend((id)qword_10083E0F0, "_firstBaselineOffsetFromTop");
  v26 = v25;
  if (v9)
  {
    if (objc_msgSend(a1, "_shouldShowProgressBar:", v14))
      v21 = 14.0;
    else
      v21 = 0.0;
  }
  v27 = v24 - v26;
  if (!objc_msgSend(a1, "shouldShowCountForAchievement:", v14) || v8)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10083E0F0, "font"));
    objc_msgSend(v30, "_scaledValueForValue:", 12.0);
    v32 = v31;

    v29 = a4 + v27 + v21 + v32;
  }
  else
  {
    v28 = 36.0;
    if (!v11)
      v28 = 21.0;
    v29 = v28 + v23 - v20 + a4 + v27 + 14.0 + v21;
  }
  v33 = UICeilToViewScale(v29);

  return v33;
}

- (void)applyViewConstraints
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
  id v28;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsCellContentView badgeView](self, "badgeView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsCellContentView leadingAnchor](self, "leadingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v5));
  objc_msgSend(v6, "setActive:", 1);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsCellContentView badgeView](self, "badgeView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsCellContentView topAnchor](self, "topAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));
  objc_msgSend(v10, "setActive:", 1);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsCellContentView badgeView](self, "badgeView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "trailingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsCellContentView trailingAnchor](self, "trailingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v13));
  objc_msgSend(v14, "setActive:", 1);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsCellContentView badgeView](self, "badgeView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "heightAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](self->_badgeView, "widthAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v17));
  objc_msgSend(v18, "setActive:", 1);

  -[CHAchievementsCellContentView applyTextLeadingAndTrailingConstraints](self, "applyTextLeadingAndTrailingConstraints");
  -[CHAchievementsCellContentView applyTextBaselineConstraints](self, "applyTextBaselineConstraints");
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsCellContentView earnedInstanceCountLabelView](self, "earnedInstanceCountLabelView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "centerXAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsCellContentView centerXAnchor](self, "centerXAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v21));
  objc_msgSend(v22, "setActive:", 1);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsCellContentView earnedInstanceCountLabelView](self, "earnedInstanceCountLabelView"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "topAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsCellContentView label](self, "label"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "lastBaselineAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:constant:", v26, 6.0));
  -[CHAchievementsCellContentView setCountLabelTopConstraint:](self, "setCountLabelTopConstraint:", v27);

  v28 = (id)objc_claimAutoreleasedReturnValue(-[CHAchievementsCellContentView countLabelTopConstraint](self, "countLabelTopConstraint"));
  objc_msgSend(v28, "setActive:", 1);

}

- (void)applyTextLeadingAndTrailingConstraints
{
  double v3;
  double v4;
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
  _QWORD v16[2];

  v3 = 0.0;
  if (-[CHAchievementsCellContentView appliesLargeCellInset](self, "appliesLargeCellInset"))
  {
    -[CHAchievementsCellContentView preferredWidth](self, "preferredWidth");
    v3 = v4 * 0.025;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsCellContentView label](self, "label"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsCellContentView leadingAnchor](self, "leadingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:constant:", v7, v3));
  -[CHAchievementsCellContentView setLeadingTextConstraint:](self, "setLeadingTextConstraint:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsCellContentView label](self, "label"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "trailingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsCellContentView trailingAnchor](self, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, -v3));
  -[CHAchievementsCellContentView setTrailingTextConstraint:](self, "setTrailingTextConstraint:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsCellContentView leadingTextConstraint](self, "leadingTextConstraint"));
  v16[0] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsCellContentView trailingTextConstraint](self, "trailingTextConstraint"));
  v16[1] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 2));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v15);

}

- (void)applyTextBaselineConstraints
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (-[CHAchievementsCellContentView appliesLargeCellInset](self, "appliesLargeCellInset"))
    v3 = 17.0;
  else
    v3 = 9.0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsCellContentView label](self, "label"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstBaselineAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsCellContentView badgeView](self, "badgeView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bottomAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsCellContentView label](self, "label"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "font"));
  objc_msgSend(v9, "_scaledValueForValue:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:constant:", v7));
  -[CHAchievementsCellContentView setLabelFirstBaselineConstraint:](self, "setLabelFirstBaselineConstraint:", v10);

  v11 = (id)objc_claimAutoreleasedReturnValue(-[CHAchievementsCellContentView labelFirstBaselineConstraint](self, "labelFirstBaselineConstraint"));
  objc_msgSend(v11, "setActive:", 1);

}

- (void)applyProgressBarConstraints:(id)a3
{
  uint64_t v4;
  double v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSString *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  v27 = a3;
  if (AAUIShouldUseNewTrophyCase(v27))
  {
    *(_QWORD *)&v5 = objc_opt_class(self, v4).n128_u64[0];
    if (objc_msgSend(v6, "_shouldShowProgressBar:", v27, v5))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsCellContentView progressBar](self, "progressBar"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leadingAnchor"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsCellContentView leadingAnchor](self, "leadingAnchor"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:constant:", v9, 5.0));
      objc_msgSend(v10, "setActive:", 1);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsCellContentView progressBar](self, "progressBar"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "trailingAnchor"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsCellContentView trailingAnchor](self, "trailingAnchor"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13, -5.0));
      objc_msgSend(v14, "setActive:", 1);

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v16 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "preferredContentSizeCategory"));
      LODWORD(v13) = UIContentSizeCategoryIsAccessibilityCategory(v16);

      if ((_DWORD)v13)
        v17 = 8.0;
      else
        v17 = 4.0;
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsCellContentView progressBar](self, "progressBar"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "layer"));
      objc_msgSend(v19, "setCornerRadius:", v17 * 0.5);

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsCellContentView progressBar](self, "progressBar"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "heightAnchor"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToConstant:", v17));
      objc_msgSend(v22, "setActive:", 1);

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsCellContentView progressBar](self, "progressBar"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "bottomAnchor"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsCellContentView bottomAnchor](self, "bottomAnchor"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:constant:", v25, -15.0));
      objc_msgSend(v26, "setActive:", 1);

    }
  }

}

- (void)fontSizeChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleCaption2));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsCellContentView label](self, "label"));
  objc_msgSend(v5, "setFont:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsCellContentView labelFirstBaselineConstraint](self, "labelFirstBaselineConstraint"));
  objc_msgSend(v6, "setActive:", 0);

  -[CHAchievementsCellContentView applyTextBaselineConstraints](self, "applyTextBaselineConstraints");
}

- (void)setAppliesLargeCellInset:(BOOL)a3
{
  void *v4;
  void *v5;

  if (self->_appliesLargeCellInset != a3)
  {
    self->_appliesLargeCellInset = a3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsCellContentView leadingTextConstraint](self, "leadingTextConstraint"));
    objc_msgSend(v4, "setActive:", 0);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsCellContentView trailingTextConstraint](self, "trailingTextConstraint"));
    objc_msgSend(v5, "setActive:", 0);

    -[CHAchievementsCellContentView applyTextLeadingAndTrailingConstraints](self, "applyTextLeadingAndTrailingConstraints");
    -[CHAchievementsCellContentView fontSizeChanged:](self, "fontSizeChanged:", 0);
  }
}

- (void)layoutSublayersOfLayer:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CHAchievementsCellContentView;
  v4 = a3;
  -[CHAchievementsCellContentView layoutSublayersOfLayer:](&v14, "layoutSublayersOfLayer:", v4);
  objc_msgSend(v4, "bounds", v14.receiver, v14.super_class);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsCellContentView darkeningLayer](self, "darkeningLayer"));
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

}

- (void)setBadgeHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_badgeHidden = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[CHAchievementsCellContentView badgeView](self, "badgeView"));
  objc_msgSend(v4, "setHidden:", v3);

}

- (CGRect)badgeRect
{
  void *v2;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGRect v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsCellContentView badgeView](self, "badgeView"));
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11.origin.x = v4;
  v11.origin.y = v6;
  v11.size.width = v8;
  v11.size.height = v10;
  return CGRectInset(v11, 10.0, 10.0);
}

- (void)setEarnedInstanceCount:(int64_t)a3
{
  void *v5;
  id v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsCellContentView earnedInstanceCountLabelView](self, "earnedInstanceCountLabelView"));
  v6 = v5;
  if (a3 < 1)
  {
    objc_msgSend(v5, "setHidden:", 1);
  }
  else
  {
    objc_msgSend(v5, "setHidden:", 0);

    v6 = (id)objc_claimAutoreleasedReturnValue(-[CHAchievementsCellContentView earnedInstanceCountLabelView](self, "earnedInstanceCountLabelView"));
    objc_msgSend(v6, "setIntegerValue:", a3);
  }

}

- (void)configureWithAchievement:(id)a3 badgeImageFactory:(id)a4 locProvider:(id)a5
{
  -[CHAchievementsCellContentView configureWithAchievement:badgeImageFactory:locProvider:shouldShowProgressBar:formatForFriend:](self, "configureWithAchievement:badgeImageFactory:locProvider:shouldShowProgressBar:formatForFriend:", a3, a4, a5, 1, 0);
}

- (void)configureWithAchievement:(id)a3 badgeImageFactory:(id)a4 locProvider:(id)a5 shouldShowProgressBar:(BOOL)a6
{
  -[CHAchievementsCellContentView configureWithAchievement:badgeImageFactory:locProvider:shouldShowProgressBar:formatForFriend:](self, "configureWithAchievement:badgeImageFactory:locProvider:shouldShowProgressBar:formatForFriend:", a3, a4, a5, a6, 0);
}

- (void)configureWithAchievement:(id)a3 badgeImageFactory:(id)a4 locProvider:(id)a5 shouldShowProgressBar:(BOOL)a6 formatForFriend:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  double v18;
  id v19;
  id v20;
  CHAchievementsCellContentView *v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  uint64_t v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  uint64_t v34;
  dispatch_queue_global_t global_queue;
  NSObject *v36;
  double v37;
  id v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  unsigned int v43;
  __CFString **v44;
  __CFString *v45;
  void *v46;
  void *v47;
  _QWORD block[4];
  id v49;
  id v50;
  CHAchievementsCellContentView *v51;
  double v52;
  double v53;

  v7 = a7;
  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (!v12)
  {
    -[CHAchievementsCellContentView setHidden:](self, "setHidden:", 1);
    goto LABEL_24;
  }
  -[CHAchievementsCellContentView setHidden:](self, "setHidden:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "template"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "uniqueName"));
  -[CHAchievementsCellContentView setTemplateUniqueName:](self, "setTemplateUniqueName:", v16);

  *(_QWORD *)&v18 = objc_opt_class(self, v17).n128_u64[0];
  if (!objc_msgSend(v19, "shouldShowCountForAchievement:", v12, v18) || v7)
  {
    v21 = self;
    v20 = 0;
  }
  else
  {
    if (!ACHShouldUseNewAwardsSystem())
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "earnedInstances"));
      -[CHAchievementsCellContentView setEarnedInstanceCount:](self, "setEarnedInstanceCount:", objc_msgSend(v22, "count"));

      goto LABEL_10;
    }
    v20 = objc_msgSend(v12, "earnedInstanceCount");
    v21 = self;
  }
  -[CHAchievementsCellContentView setEarnedInstanceCount:](v21, "setEarnedInstanceCount:", v20);
LABEL_10:
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "template"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "sourceName"));
  v25 = objc_msgSend(v24, "isEqualToString:", kASCompetitionsAchievementTemplateSourceIdentifier);

  if (v25)
    v26 = objc_claimAutoreleasedReturnValue(+[UIColor as_lightCompetitionGold](UIColor, "as_lightCompetitionGold"));
  else
    v26 = objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v27 = (void *)v26;
  -[CHAchievementsCellContentView setEarnedInstanceCountLabelBackgroundColor:](self, "setEarnedInstanceCountLabelBackgroundColor:", v26);

  -[CHAchievementsCellContentView preferredWidth](self, "preferredWidth");
  v29 = v28;
  -[CHAchievementsCellContentView preferredWidth](self, "preferredWidth");
  v31 = v30;
  if (objc_msgSend(v13, "hasCachedThumbnailImageForAchievement:size:", v12, v29, v30))
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "thumbnailImageForAchievement:size:", v12, v29, v31));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsCellContentView badgeView](self, "badgeView"));
    objc_msgSend(v33, "setImage:", v32);

  }
  else
  {
    global_queue = dispatch_get_global_queue(25, 0);
    v36 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000BD330;
    block[3] = &unk_10077A218;
    v49 = v13;
    v52 = v29;
    v53 = v31;
    v50 = v12;
    v51 = self;
    dispatch_async(v36, block);

  }
  *(_QWORD *)&v37 = objc_opt_class(self, v34).n128_u64[0];
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "stringForAchievement:locProvider:formatForFriend:", v12, v14, v7, v37));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsCellContentView label](self, "label"));
  objc_msgSend(v40, "setAttributedText:", v39);

  if (AAUIShouldUseNewTrophyCase(v41) && v8)
  {
    -[CHAchievementsCellContentView _populateProgressBar:](self, "_populateProgressBar:", v12);
    -[CHAchievementsCellContentView applyProgressBarConstraints:](self, "applyProgressBarConstraints:", v12);
  }
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsCellContentView templateUniqueName](self, "templateUniqueName"));

  if (v42)
  {
    v43 = objc_msgSend(v12, "unearned");
    v44 = &off_10077A870;
    if (!v43)
      v44 = &off_10077A868;
    v45 = *v44;
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[CHAchievementsCellContentView templateUniqueName](self, "templateUniqueName"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), v46, v45));
    -[CHAchievementsCellContentView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v47);

  }
  -[CHAchievementsCellContentView annotateView:withAchievement:](self, "annotateView:withAchievement:", self->_badgeView, v12);
LABEL_24:

}

+ (BOOL)_shouldShowProgressBar:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  if (AAUIShouldUseNewTrophyCase(v3) && objc_msgSend(v3, "unearned"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "goal"));
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "progress"));
      v6 = v5 != 0;

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_populateProgressBar:(id)a3
{
  uint64_t v4;
  double v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  UIProgressView **p_progressBar;
  double v16;
  id v17;

  v17 = a3;
  *(_QWORD *)&v5 = objc_opt_class(self, v4).n128_u64[0];
  if ((objc_msgSend(v6, "_shouldShowProgressBar:", v17, v5) & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "template"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "canonicalUnit"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "goal"));
    objc_msgSend(v9, "doubleValueForUnit:", v8);
    v11 = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "progress"));
    objc_msgSend(v12, "doubleValueForUnit:", v8);
    v14 = v13;

    if (v11 == 0.0)
    {
      p_progressBar = &self->_progressBar;
    }
    else
    {
      v16 = v14 / v11;
      if (v14 / v11 < 2.22044605e-16)
        v16 = 0.01;
      p_progressBar = &self->_progressBar;
      *(float *)&v16 = v16;
      -[UIProgressView setProgress:](*p_progressBar, "setProgress:", v16);
    }
    -[UIProgressView setHidden:](*p_progressBar, "setHidden:", v11 == 0.0);

  }
  else
  {
    -[UIProgressView setHidden:](self->_progressBar, "setHidden:", 1);
  }

}

- (void)prepareForReuse
{
  -[UIImageView setImage:](self->_badgeView, "setImage:", 0);
  -[UIProgressView setHidden:](self->_progressBar, "setHidden:", 1);
}

- (void)setEarnedInstanceCountLabelBackgroundColor:(id)a3
{
  UIColor **p_earnedInstanceCountLabelBackgroundColor;
  id v6;
  UIColor *v7;
  id v8;

  p_earnedInstanceCountLabelBackgroundColor = &self->_earnedInstanceCountLabelBackgroundColor;
  objc_storeStrong((id *)&self->_earnedInstanceCountLabelBackgroundColor, a3);
  v6 = a3;
  v7 = *p_earnedInstanceCountLabelBackgroundColor;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[CHAchievementsCellContentView earnedInstanceCountLabelView](self, "earnedInstanceCountLabelView"));
  objc_msgSend(v8, "setPillBackgroundColor:", v7);

}

- (double)preferredWidth
{
  return self->_preferredWidth;
}

- (void)setPreferredWidth:(double)a3
{
  self->_preferredWidth = a3;
}

- (BOOL)appliesLargeCellInset
{
  return self->_appliesLargeCellInset;
}

- (UIColor)earnedInstanceCountLabelBackgroundColor
{
  return self->_earnedInstanceCountLabelBackgroundColor;
}

- (BOOL)badgeHidden
{
  return self->_badgeHidden;
}

- (UIImageView)badgeView
{
  return self->_badgeView;
}

- (void)setBadgeView:(id)a3
{
  objc_storeStrong((id *)&self->_badgeView, a3);
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (UIProgressView)progressBar
{
  return self->_progressBar;
}

- (void)setProgressBar:(id)a3
{
  objc_storeStrong((id *)&self->_progressBar, a3);
}

- (CHPillLabelView)earnedInstanceCountLabelView
{
  return self->_earnedInstanceCountLabelView;
}

- (void)setEarnedInstanceCountLabelView:(id)a3
{
  objc_storeStrong((id *)&self->_earnedInstanceCountLabelView, a3);
}

- (NSLayoutConstraint)leadingTextConstraint
{
  return self->_leadingTextConstraint;
}

- (void)setLeadingTextConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_leadingTextConstraint, a3);
}

- (NSLayoutConstraint)trailingTextConstraint
{
  return self->_trailingTextConstraint;
}

- (void)setTrailingTextConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_trailingTextConstraint, a3);
}

- (NSLayoutConstraint)labelFirstBaselineConstraint
{
  return self->_labelFirstBaselineConstraint;
}

- (void)setLabelFirstBaselineConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_labelFirstBaselineConstraint, a3);
}

- (NSLayoutConstraint)countLabelTopConstraint
{
  return self->_countLabelTopConstraint;
}

- (void)setCountLabelTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_countLabelTopConstraint, a3);
}

- (AAUIAchievementResourceProvider)resourceProvider
{
  return self->_resourceProvider;
}

- (void)setResourceProvider:(id)a3
{
  objc_storeStrong((id *)&self->_resourceProvider, a3);
}

- (CALayer)darkeningLayer
{
  return self->_darkeningLayer;
}

- (void)setDarkeningLayer:(id)a3
{
  objc_storeStrong((id *)&self->_darkeningLayer, a3);
}

- (NSString)templateUniqueName
{
  return self->_templateUniqueName;
}

- (void)setTemplateUniqueName:(id)a3
{
  objc_storeStrong((id *)&self->_templateUniqueName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateUniqueName, 0);
  objc_storeStrong((id *)&self->_darkeningLayer, 0);
  objc_storeStrong((id *)&self->_resourceProvider, 0);
  objc_storeStrong((id *)&self->_countLabelTopConstraint, 0);
  objc_storeStrong((id *)&self->_labelFirstBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_trailingTextConstraint, 0);
  objc_storeStrong((id *)&self->_leadingTextConstraint, 0);
  objc_storeStrong((id *)&self->_earnedInstanceCountLabelView, 0);
  objc_storeStrong((id *)&self->_progressBar, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_earnedInstanceCountLabelBackgroundColor, 0);
}

- (void)annotateView:(id)a3 withAchievement:(id)a4
{
  id v6;
  id v7;
  CHAchievementsCellContentView *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_10057F600((uint64_t)v6, a4);

}

@end
