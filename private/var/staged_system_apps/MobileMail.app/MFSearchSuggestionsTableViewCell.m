@implementation MFSearchSuggestionsTableViewCell

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

+ (id)_defaultLabelAttributesWithFont:(id)a3
{
  id v3;
  id v4;
  NSString *v5;
  _BOOL4 IsAccessibilityCategory;
  double v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[2];

  v3 = a3;
  v4 = objc_alloc_init((Class)NSMutableParagraphStyle);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "preferredContentSizeCategory"));
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v5);

  if (IsAccessibilityCategory)
  {
    objc_msgSend(v4, "setLineBreakMode:", 0);
    LODWORD(v7) = 1.0;
    objc_msgSend(v4, "setHyphenationFactor:", v7);
  }
  else
  {
    objc_msgSend(v4, "setLineBreakMode:", 4);
  }
  v10[0] = NSParagraphStyleAttributeName;
  v10[1] = NSFontAttributeName;
  v11[0] = v4;
  v11[1] = v3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 2));

  return v8;
}

- (MFSearchSuggestionsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  MFSearchSuggestionsTableViewCell *v5;
  id v6;
  double y;
  double width;
  double height;
  UIImageView *v10;
  UIImageView *glyph;
  UILabel *v12;
  UILabel *title;
  UILabel *v14;
  UILabel *subtitle;
  void *v16;
  void *v17;
  NSString *v18;
  _BOOL4 IsAccessibilityCategory;
  UILabel *v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
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
  double v43;
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
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  objc_super v77;
  _QWORD v78[3];
  _QWORD v79[3];
  _QWORD v80[5];

  v77.receiver = self;
  v77.super_class = (Class)MFSearchSuggestionsTableViewCell;
  v74 = a4;
  v5 = -[MFSearchSuggestionsTableViewCell initWithStyle:reuseIdentifier:](&v77, "initWithStyle:reuseIdentifier:", a3);
  if (v5)
  {
    v6 = objc_alloc((Class)UIImageView);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v10 = (UIImageView *)objc_msgSend(v6, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    glyph = v5->_glyph;
    v5->_glyph = v10;

    v12 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    title = v5->_title;
    v5->_title = v12;

    v14 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    subtitle = v5->_subtitle;
    v5->_subtitle = v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsTableViewCell _titleFont](v5, "_titleFont"));
    -[UILabel setFont:](v5->_title, "setFont:", v16);

    -[UILabel setTextAlignment:](v5->_title, "setTextAlignment:", 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsTableViewCell _subtitleFont](v5, "_subtitleFont"));
    -[UILabel setFont:](v5->_subtitle, "setFont:", v17);

    -[UILabel setLineBreakMode:](v5->_subtitle, "setLineBreakMode:", 5);
    -[UILabel setTextAlignment:](v5->_subtitle, "setTextAlignment:", 4);
    v18 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "preferredContentSizeCategory"));
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v18);

    v20 = v5->_title;
    if (IsAccessibilityCategory)
    {
      -[UILabel setNumberOfLines:](v20, "setNumberOfLines:", 0);
      -[UILabel setLineBreakMode:](v5->_title, "setLineBreakMode:", 0);
      -[UILabel setLineBreakMode:](v5->_subtitle, "setLineBreakMode:", 0);
      v21 = 0;
    }
    else
    {
      -[UILabel setNumberOfLines:](v20, "setNumberOfLines:", 1);
      -[UILabel setLineBreakMode:](v5->_title, "setLineBreakMode:", 5);
      -[UILabel setLineBreakMode:](v5->_subtitle, "setLineBreakMode:", 5);
      v21 = 1;
    }
    -[UILabel setNumberOfLines:](v5->_subtitle, "setNumberOfLines:", v21);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v5->_glyph, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_title, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_subtitle, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v22) = 1148846080;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](v5->_glyph, "setContentCompressionResistancePriority:forAxis:", 0, v22);
    LODWORD(v23) = 1148846080;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](v5->_glyph, "setContentCompressionResistancePriority:forAxis:", 1, v23);
    LODWORD(v24) = 1148846080;
    -[UIImageView setContentHuggingPriority:forAxis:](v5->_glyph, "setContentHuggingPriority:forAxis:", 0, v24);
    LODWORD(v25) = 1148846080;
    -[UIImageView setContentHuggingPriority:forAxis:](v5->_glyph, "setContentHuggingPriority:forAxis:", 1, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UIImageView setTintColor:](v5->_glyph, "setTintColor:", v26);

    v76 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsTableViewCell contentView](v5, "contentView"));
    objc_msgSend(v76, "addSubview:", v5->_glyph);
    objc_msgSend(v76, "addSubview:", v5->_title);
    objc_msgSend(v76, "addSubview:", v5->_subtitle);
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "layoutMarginsGuide"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerXAnchor](v5->_glyph, "centerXAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "leadingAnchor"));
    -[MFSearchSuggestionsTableViewCell _glyphCenterXConstant](v5, "_glyphCenterXConstant");
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:constant:", v28));
    -[MFSearchSuggestionsTableViewCell setGlyphCenterXConstraint:](v5, "setGlyphCenterXConstraint:", v29);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v5->_title, "leadingAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "leadingAnchor"));
    -[MFSearchSuggestionsTableViewCell _titleLeadingConstant](v5, "_titleLeadingConstant");
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:constant:", v31));
    -[MFSearchSuggestionsTableViewCell setTitleLeadingConstraint:](v5, "setTitleLeadingConstraint:", v32);

    v70 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsTableViewCell glyphCenterXConstraint](v5, "glyphCenterXConstraint"));
    v80[0] = v70;
    v69 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsTableViewCell titleLeadingConstraint](v5, "titleLeadingConstraint"));
    v80[1] = v69;
    v72 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v5->_title, "trailingAnchor"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "trailingAnchor"));
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "constraintEqualToAnchor:"));
    v80[2] = v67;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v5->_subtitle, "leadingAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v5->_title, "leadingAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v34));
    v80[3] = v35;
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v5->_subtitle, "trailingAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v5->_title, "trailingAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v37));
    v80[4] = v38;
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v80, 5));
    -[MFSearchSuggestionsTableViewCell setDefaultConstraints:](v5, "setDefaultConstraints:", v39);

    v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](v5->_glyph, "centerYAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](v5->_title, "firstBaselineAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](v5->_title, "font"));
    objc_msgSend(v42, "capHeight");
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:constant:", v41, v43 * -0.5));
    -[MFSearchSuggestionsTableViewCell setGlyphVerticalConstraint:](v5, "setGlyphVerticalConstraint:", v44);

    v45 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsTableViewCell glyphVerticalConstraint](v5, "glyphVerticalConstraint"));
    objc_msgSend(v45, "setActive:", 1);

    v73 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v5->_title, "topAnchor"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "topAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "constraintEqualToAnchor:constant:", 10.0));
    v79[0] = v46;
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "bottomAnchor"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v5->_title, "bottomAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:constant:", v48, 10.0));
    v79[1] = v49;
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](v5->_subtitle, "centerYAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](v5->_title, "centerYAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:", v51));
    v79[2] = v52;
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v79, 3));
    -[MFSearchSuggestionsTableViewCell setTitleOnlyConstraints:](v5, "setTitleOnlyConstraints:", v53);

    v54 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](v5->_subtitle, "firstBaselineAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](v5->_title, "lastBaselineAnchor"));
    -[MFSearchSuggestionsTableViewCell _interLabelBaselineConstant](v5, "_interLabelBaselineConstant");
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToAnchor:constant:", v55));
    -[MFSearchSuggestionsTableViewCell setInterLabelBaselineConstraint:](v5, "setInterLabelBaselineConstraint:", v56);

    v57 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v5->_title, "topAnchor"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "topAnchor"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToAnchor:constant:", v58, 10.0));
    v78[0] = v59;
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsTableViewCell interLabelBaselineConstraint](v5, "interLabelBaselineConstraint"));
    v78[1] = v60;
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "bottomAnchor"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v5->_subtitle, "bottomAnchor"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "constraintEqualToAnchor:constant:", v62, 10.0));
    v78[2] = v63;
    v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v78, 3));
    -[MFSearchSuggestionsTableViewCell setSubtitleConstraints:](v5, "setSubtitleConstraints:", v64);

    v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v65, "addObserver:selector:name:object:", v5, "_preferredContentSizeCategoryDidChange:", UIContentSizeCategoryDidChangeNotification, 0);

  }
  return v5;
}

- (void)updateConfigurationUsingState:(id)a3
{
  void *v4;
  id v5;

  if (objc_msgSend(a3, "isFocused"))
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
    -[UILabel setTextColor:](self->_title, "setTextColor:");
    -[UILabel setTextColor:](self->_subtitle, "setTextColor:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MUISearchAtomSuggestion focusedTintColor](self->_suggestion, "focusedTintColor"));
  }
  else
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](self->_title, "setTextColor:");
    -[UILabel setTextColor:](self->_subtitle, "setTextColor:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MUISearchAtomSuggestion tintColor](self->_suggestion, "tintColor"));
  }
  -[UIImageView setTintColor:](self->_glyph, "setTintColor:", v4);

}

- (id)_titleFont
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MFFontMetricCache sharedFontMetricCache](MFFontMetricCache, "sharedFontMetricCache"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "cachedFont:forKey:", &stru_1005227E0, CFSTR("MFSearchSuggestionsCell.titleFont")));

  return v3;
}

- (id)_subtitleFont
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MFFontMetricCache sharedFontMetricCache](MFFontMetricCache, "sharedFontMetricCache"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "cachedFont:forKey:", &stru_100522800, CFSTR("MFSearchSuggestionsCell.subtitleFont")));

  return v3;
}

- (double)_glyphCenterXConstant
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MFFontMetricCache sharedFontMetricCache](MFFontMetricCache, "sharedFontMetricCache"));
  objc_msgSend(v2, "cachedFloat:forKey:", &stru_100522820, CFSTR("MFSearchSuggestionCell.glyphCenterX"));
  v4 = v3;

  return v4;
}

- (double)_titleLeadingConstant
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MFFontMetricCache sharedFontMetricCache](MFFontMetricCache, "sharedFontMetricCache"));
  objc_msgSend(v2, "cachedFloat:forKey:", &stru_100522840, CFSTR("MFSearchSuggestionCell.titleLeading"));
  v4 = v3;

  return v4;
}

- (double)_interLabelBaselineConstant
{
  void *v3;
  double v4;
  double v5;
  _QWORD v7[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MFFontMetricCache sharedFontMetricCache](MFFontMetricCache, "sharedFontMetricCache"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001A2C94;
  v7[3] = &unk_100521E80;
  v7[4] = self;
  objc_msgSend(v3, "cachedFloat:forKey:", v7, CFSTR("MFSearchSuggestionCell.twoLineInterLabelBaseline"));
  v5 = v4;

  return v5;
}

- (void)updateConstraints
{
  void *v3;
  _BOOL4 v4;
  NSArray *subtitleConstraints;
  uint64_t v6;
  int *v7;
  NSArray *titleOnlyConstraints;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  objc_super v13;
  _QWORD v14[2];
  _QWORD v15[2];

  v13.receiver = self;
  v13.super_class = (Class)MFSearchSuggestionsTableViewCell;
  -[MFSearchSuggestionsTableViewCell updateConstraints](&v13, "updateConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_subtitle, "text"));
  v4 = objc_msgSend(v3, "length") == 0;

  if (v4)
  {
    titleOnlyConstraints = self->_titleOnlyConstraints;
    v15[0] = self->_defaultConstraints;
    v15[1] = titleOnlyConstraints;
    v6 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 2));
    v7 = &OBJC_IVAR___MFSearchSuggestionsTableViewCell__subtitleConstraints;
  }
  else
  {
    subtitleConstraints = self->_subtitleConstraints;
    v14[0] = self->_defaultConstraints;
    v14[1] = subtitleConstraints;
    v6 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 2));
    v7 = &OBJC_IVAR___MFSearchSuggestionsTableViewCell__titleOnlyConstraints;
  }
  v9 = (void *)v6;
  v10 = *(id *)((char *)&self->super.super.super.super.isa + *v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ef_flatten"));
  +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ef_flatten"));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (void)_preferredContentSizeCategoryDidChange:(id)a3
{
  _BOOL4 IsAccessibilityCategory;
  _BOOL8 v5;
  uint64_t v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  id v17;
  id v18;
  NSString *v19;
  id v20;
  id v21;
  id v22;
  id v23;

  v16 = (id)objc_claimAutoreleasedReturnValue(+[MFFontMetricCache sharedFontMetricCache](MFFontMetricCache, "sharedFontMetricCache", a3));
  objc_msgSend(v16, "ensureCacheIsValid");

  v17 = (id)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsTableViewCell _titleFont](self, "_titleFont"));
  -[UILabel setFont:](self->_title, "setFont:");

  v18 = (id)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsTableViewCell _subtitleFont](self, "_subtitleFont"));
  -[UILabel setFont:](self->_subtitle, "setFont:");

  v19 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "preferredContentSizeCategory"));
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v19);

  v5 = !IsAccessibilityCategory;
  if (IsAccessibilityCategory)
    v6 = 0;
  else
    v6 = 5;
  -[UILabel setNumberOfLines:](self->_title, "setNumberOfLines:", v5);
  -[UILabel setLineBreakMode:](self->_title, "setLineBreakMode:", v6);
  -[UILabel setLineBreakMode:](self->_subtitle, "setLineBreakMode:", v6);
  -[UILabel setNumberOfLines:](self->_subtitle, "setNumberOfLines:", v5);
  v20 = (id)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_title, "font"));
  objc_msgSend(v20, "capHeight");
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsTableViewCell glyphVerticalConstraint](self, "glyphVerticalConstraint"));
  objc_msgSend(v9, "setConstant:", v8 * -0.5);

  -[MFSearchSuggestionsTableViewCell _glyphCenterXConstant](self, "_glyphCenterXConstant");
  v11 = v10;
  v21 = (id)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsTableViewCell glyphCenterXConstraint](self, "glyphCenterXConstraint"));
  objc_msgSend(v21, "setConstant:", v11);

  -[MFSearchSuggestionsTableViewCell _titleLeadingConstant](self, "_titleLeadingConstant");
  v13 = v12;
  v22 = (id)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsTableViewCell titleLeadingConstraint](self, "titleLeadingConstraint"));
  objc_msgSend(v22, "setConstant:", v13);

  -[MFSearchSuggestionsTableViewCell _interLabelBaselineConstant](self, "_interLabelBaselineConstant");
  v15 = v14;
  v23 = (id)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsTableViewCell interLabelBaselineConstraint](self, "interLabelBaselineConstraint"));
  objc_msgSend(v23, "setConstant:", v15);

}

- (void)setSuggestion:(id)a3
{
  void *v3;
  MUISearchAtomSuggestion *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  MUISearchAtomSuggestion *v19;

  v6 = (MUISearchAtomSuggestion *)a3;
  if (self->_suggestion != v6)
  {
    v19 = v6;
    objc_storeStrong((id *)&self->_suggestion, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MUISearchAtomSuggestion image](v19, "image"));
    -[UIImageView setImage:](self->_glyph, "setImage:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MUISearchAtomSuggestion tintColor](v19, "tintColor"));
    -[UIImageView setTintColor:](self->_glyph, "setTintColor:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsTableViewCell _titleFont](self, "_titleFont"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MFSearchSuggestionsTableViewCell _defaultLabelAttributesWithFont:](MFSearchSuggestionsTableViewCell, "_defaultLabelAttributesWithFont:", v9));

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MUISearchAtomSuggestion title](v19, "title"));
    if (v11)
    {
      v12 = objc_alloc((Class)NSAttributedString);
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[MUISearchAtomSuggestion title](v19, "title"));
      v13 = objc_msgSend(v12, "initWithString:attributes:", v3, v10);
    }
    else
    {
      v13 = 0;
    }
    -[UILabel setAttributedText:](self->_title, "setAttributedText:", v13);
    if (v11)
    {

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsTableViewCell _subtitleFont](self, "_subtitleFont"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[MFSearchSuggestionsTableViewCell _defaultLabelAttributesWithFont:](MFSearchSuggestionsTableViewCell, "_defaultLabelAttributesWithFont:", v14));

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MUISearchAtomSuggestion subtitle](v19, "subtitle"));
    if (v16)
    {
      v17 = objc_alloc((Class)NSAttributedString);
      v13 = (id)objc_claimAutoreleasedReturnValue(-[MUISearchAtomSuggestion subtitle](v19, "subtitle"));
      v18 = objc_msgSend(v17, "initWithString:attributes:", v13, v15);
    }
    else
    {
      v18 = 0;
    }
    -[UILabel setAttributedText:](self->_subtitle, "setAttributedText:", v18);
    if (v16)
    {

    }
    -[MFSearchSuggestionsTableViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");

    v6 = v19;
  }

}

- (MUISearchAtomSuggestion)suggestion
{
  return self->_suggestion;
}

- (NSArray)defaultConstraints
{
  return self->_defaultConstraints;
}

- (void)setDefaultConstraints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)titleOnlyConstraints
{
  return self->_titleOnlyConstraints;
}

- (void)setTitleOnlyConstraints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)subtitleConstraints
{
  return self->_subtitleConstraints;
}

- (void)setSubtitleConstraints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSLayoutConstraint)glyphCenterXConstraint
{
  return self->_glyphCenterXConstraint;
}

- (void)setGlyphCenterXConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_glyphCenterXConstraint, a3);
}

- (NSLayoutConstraint)titleLeadingConstraint
{
  return self->_titleLeadingConstraint;
}

- (void)setTitleLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_titleLeadingConstraint, a3);
}

- (NSLayoutConstraint)interLabelBaselineConstraint
{
  return self->_interLabelBaselineConstraint;
}

- (void)setInterLabelBaselineConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_interLabelBaselineConstraint, a3);
}

- (NSLayoutConstraint)glyphVerticalConstraint
{
  return self->_glyphVerticalConstraint;
}

- (void)setGlyphVerticalConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_glyphVerticalConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyphVerticalConstraint, 0);
  objc_storeStrong((id *)&self->_interLabelBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_titleLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_glyphCenterXConstraint, 0);
  objc_storeStrong((id *)&self->_subtitleConstraints, 0);
  objc_storeStrong((id *)&self->_titleOnlyConstraints, 0);
  objc_storeStrong((id *)&self->_defaultConstraints, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_glyph, 0);
}

@end
