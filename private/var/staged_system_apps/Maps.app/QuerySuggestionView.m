@implementation QuerySuggestionView

- (QuerySuggestionView)init
{
  QuerySuggestionView *v2;
  void *v3;
  UILabel *v4;
  UILabel *titleLabel;
  void *v6;
  double v7;
  double v8;
  UILabel *v9;
  UILabel *delimiterLabel;
  void *v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  NSLayoutConstraint *delimeterWidthConstraint;
  UILabel *v17;
  UILabel *detailLabel;
  void *v19;
  double v20;
  double v21;
  id v22;
  void *v23;
  UIStackView *v24;
  UIStackView *labelStackView;
  UIImageView *v26;
  UIImageView *iconImageView;
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
  objc_super v55;
  _QWORD v56[8];
  _QWORD v57[3];

  v55.receiver = self;
  v55.super_class = (Class)QuerySuggestionView;
  v2 = -[QuerySuggestionView init](&v55, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[QuerySuggestionView setBackgroundColor:](v2, "setBackgroundColor:", v3);

    v4 = (UILabel *)objc_alloc_init((Class)UILabel);
    titleLabel = v2->_titleLabel;
    v2->_titleLabel = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](v2->_titleLabel, "setBackgroundColor:", v6);

    LODWORD(v7) = 1144750080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v2->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 0, v7);
    LODWORD(v8) = 1144750080;
    -[UILabel setContentHuggingPriority:forAxis:](v2->_titleLabel, "setContentHuggingPriority:forAxis:", 0, v8);
    -[UILabel setAccessibilityIdentifier:](v2->_titleLabel, "setAccessibilityIdentifier:", CFSTR("QuerySuggestionTitle"));
    v9 = (UILabel *)objc_alloc_init((Class)UILabel);
    delimiterLabel = v2->_delimiterLabel;
    v2->_delimiterLabel = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](v2->_delimiterLabel, "setBackgroundColor:", v11);

    -[UILabel setTextAlignment:](v2->_delimiterLabel, "setTextAlignment:", 0);
    LODWORD(v12) = 1144750080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v2->_delimiterLabel, "setContentCompressionResistancePriority:forAxis:", 0, v12);
    LODWORD(v13) = 1144750080;
    -[UILabel setContentHuggingPriority:forAxis:](v2->_delimiterLabel, "setContentHuggingPriority:forAxis:", 0, v13);
    -[UILabel setAccessibilityIdentifier:](v2->_delimiterLabel, "setAccessibilityIdentifier:", CFSTR("QuerySuggestionDelimiter"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel widthAnchor](v2->_delimiterLabel, "widthAnchor"));
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToConstant:", 14.0));
    delimeterWidthConstraint = v2->_delimeterWidthConstraint;
    v2->_delimeterWidthConstraint = (NSLayoutConstraint *)v15;

    v17 = (UILabel *)objc_alloc_init((Class)UILabel);
    detailLabel = v2->_detailLabel;
    v2->_detailLabel = v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](v2->_detailLabel, "setBackgroundColor:", v19);

    LODWORD(v20) = 1132068864;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v2->_detailLabel, "setContentCompressionResistancePriority:forAxis:", 0, v20);
    LODWORD(v21) = 1132068864;
    -[UILabel setContentHuggingPriority:forAxis:](v2->_detailLabel, "setContentHuggingPriority:forAxis:", 0, v21);
    -[UILabel setAccessibilityIdentifier:](v2->_detailLabel, "setAccessibilityIdentifier:", CFSTR("QuerySuggestionDetail"));
    v22 = objc_alloc((Class)UIStackView);
    v57[0] = v2->_titleLabel;
    v57[1] = v2->_delimiterLabel;
    v57[2] = v2->_detailLabel;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v57, 3));
    v24 = (UIStackView *)objc_msgSend(v22, "initWithArrangedSubviews:", v23);
    labelStackView = v2->_labelStackView;
    v2->_labelStackView = v24;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v2->_labelStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](v2->_labelStackView, "setAxis:", 0);
    -[UIStackView setAlignment:](v2->_labelStackView, "setAlignment:", 1);
    -[UIStackView setDistribution:](v2->_labelStackView, "setDistribution:", 0);
    -[QuerySuggestionView addSubview:](v2, "addSubview:", v2->_labelStackView);
    v26 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    iconImageView = v2->_iconImageView;
    v2->_iconImageView = v26;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v2->_iconImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("magnifyingglass")));
    -[UIImageView setImage:](v2->_iconImageView, "setImage:", v28);

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[UIImageView setTintColor:](v2->_iconImageView, "setTintColor:", v29);

    -[UIImageView setAccessibilityIdentifier:](v2->_iconImageView, "setAccessibilityIdentifier:", CFSTR("QuerySuggestionIcon"));
    -[QuerySuggestionView addSubview:](v2, "addSubview:", v2->_iconImageView);
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](v2->_labelStackView, "topAnchor"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionView topAnchor](v2, "topAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToAnchor:constant:", v53, 10.0));
    v56[0] = v52;
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](v2->_labelStackView, "bottomAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionView bottomAnchor](v2, "bottomAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:constant:", v50, -10.0));
    v56[1] = v49;
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](v2->_labelStackView, "leadingAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](v2->_iconImageView, "trailingAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:constant:", v47, 15.0));
    v56[2] = v46;
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](v2->_labelStackView, "trailingAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionView trailingAnchor](v2, "trailingAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:constant:", v44, -15.0));
    v56[3] = v43;
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](v2->_iconImageView, "centerYAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionView centerYAnchor](v2, "centerYAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:", v30));
    v56[4] = v31;
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](v2->_iconImageView, "leadingAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionView leadingAnchor](v2, "leadingAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:constant:", v33, 16.0));
    v56[5] = v34;
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](v2->_iconImageView, "widthAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToConstant:", 20.0));
    v56[6] = v36;
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](v2->_iconImageView, "heightAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToConstant:", 20.0));
    v56[7] = v38;
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v56, 8));

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v41);
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v39, "addObserver:selector:name:object:", v2, "contentSizeCategoryDidChange:", UIContentSizeCategoryDidChangeNotification, 0);

  }
  return v2;
}

- (void)clearContents
{
  void *v3;
  id v4;

  -[QuerySuggestionView setTitle:](self, "setTitle:", 0);
  -[QuerySuggestionView setHighlightRanges:](self, "setHighlightRanges:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionView titleLabel](self, "titleLabel"));
  objc_msgSend(v3, "setAttributedText:", 0);

  -[QuerySuggestionView setDetailText:](self, "setDetailText:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[QuerySuggestionView detailLabel](self, "detailLabel"));
  objc_msgSend(v4, "setText:", 0);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)QuerySuggestionView;
  -[QuerySuggestionView layoutSubviews](&v3, "layoutSubviews");
  -[QuerySuggestionView updateLabels](self, "updateLabels");
}

- (id)delimiterString
{
  if (qword_1014D3278 != -1)
    dispatch_once(&qword_1014D3278, &stru_1011C65A0);
  return (id)qword_1014D3270;
}

- (id)titleFont
{
  return +[UIFont system17](UIFont, "system17");
}

- (void)setTitle:(id)a3 highlightTitleRanges:(id)a4 detailText:(id)a5 style:(unint64_t)a6
{
  id v10;
  id v11;

  v10 = a5;
  v11 = a4;
  -[QuerySuggestionView setTitle:](self, "setTitle:", a3);
  -[QuerySuggestionView setHighlightRanges:](self, "setHighlightRanges:", v11);

  -[QuerySuggestionView setDetailText:](self, "setDetailText:", v10);
  -[QuerySuggestionView setQuerySuggestionStyle:](self, "setQuerySuggestionStyle:", a6);
  -[QuerySuggestionView updateLabels](self, "updateLabels");
}

- (void)updateTheme
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)QuerySuggestionView;
  -[MapsThemeView updateTheme](&v3, "updateTheme");
  -[QuerySuggestionView updateLabels](self, "updateLabels");
}

- (void)updateLabels
{
  void *v3;
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionView title](self, "title"));
  v4 = objc_msgSend(v3, "length");

  if (!v4)
    return;
  v5 = -[QuerySuggestionView querySuggestionStyle](self, "querySuggestionStyle");
  if (v5 == 1)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionView title](self, "title"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionView titleLabel](self, "titleLabel"));
    objc_msgSend(v16, "setText:", v15);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionView titleLabel](self, "titleLabel"));
    objc_msgSend(v18, "setTextColor:", v17);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionView titleFont](self, "titleFont"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionView titleLabel](self, "titleLabel"));
    objc_msgSend(v20, "setFont:", v19);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionView delimiterString](self, "delimiterString"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionView delimiterLabel](self, "delimiterLabel"));
    objc_msgSend(v22, "setText:", v21);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionView titleFont](self, "titleFont"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionView delimiterLabel](self, "delimiterLabel"));
    objc_msgSend(v24, "setFont:", v23);

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionView delimiterLabel](self, "delimiterLabel"));
    objc_msgSend(v26, "setTextColor:", v25);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionView detailText](self, "detailText"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionView detailLabel](self, "detailLabel"));
    objc_msgSend(v28, "setText:", v27);

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionView detailLabel](self, "detailLabel"));
    objc_msgSend(v30, "setTextColor:", v29);

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionView titleFont](self, "titleFont"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionView detailLabel](self, "detailLabel"));
    objc_msgSend(v32, "setFont:", v31);

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionView detailText](self, "detailText"));
    v34 = objc_msgSend(v33, "length");

    if (v34)
    {
      if (!-[QuerySuggestionView needsTwoLinesLayout](self, "needsTwoLinesLayout"))
      {
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionView delimiterLabel](self, "delimiterLabel"));
        objc_msgSend(v41, "setHidden:", 0);

        v42 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionView labelStackView](self, "labelStackView"));
        objc_msgSend(v42, "setAxis:", 0);

        if (-[QuerySuggestionView shouldDistributeProportionally](self, "shouldDistributeProportionally"))
        {
          v43 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionView labelStackView](self, "labelStackView"));
          objc_msgSend(v43, "setDistribution:", 2);

          v45 = (id)objc_claimAutoreleasedReturnValue(-[QuerySuggestionView delimeterWidthConstraint](self, "delimeterWidthConstraint"));
          objc_msgSend(v45, "setActive:", 1);
        }
        else
        {
          v44 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionView delimeterWidthConstraint](self, "delimeterWidthConstraint"));
          objc_msgSend(v44, "setActive:", 0);

          v45 = (id)objc_claimAutoreleasedReturnValue(-[QuerySuggestionView labelStackView](self, "labelStackView"));
          objc_msgSend(v45, "setDistribution:", 0);
        }
        goto LABEL_14;
      }
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionView labelStackView](self, "labelStackView"));
      objc_msgSend(v35, "setDistribution:", 0);

      v36 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionView labelStackView](self, "labelStackView"));
      objc_msgSend(v36, "setAxis:", 1);
    }
    else
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionView detailLabel](self, "detailLabel"));
      objc_msgSend(v36, "setText:", 0);
    }

    v45 = (id)objc_claimAutoreleasedReturnValue(-[QuerySuggestionView delimiterLabel](self, "delimiterLabel"));
    objc_msgSend(v45, "setHidden:", 1);
LABEL_14:

    return;
  }
  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionView titleLabel](self, "titleLabel"));
    objc_msgSend(v7, "setTextColor:", v6);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionView highlightRanges](self, "highlightRanges"));
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionView title](self, "title"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionView highlightRanges](self, "highlightRanges"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionView titleFont](self, "titleFont"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionView titleFont](self, "titleFont"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
      v45 = (id)objc_claimAutoreleasedReturnValue(+[NSAttributedString attributedStringWithText:highlightRanges:font:highlightedFont:highlightedTextColor:](NSAttributedString, "attributedStringWithText:highlightRanges:font:highlightedFont:highlightedTextColor:", v10, v11, v12, v13, v14));

    }
    else
    {
      v37 = objc_alloc((Class)NSAttributedString);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionView title](self, "title"));
      v45 = objc_msgSend(v37, "initWithString:", v10);
    }

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionView titleLabel](self, "titleLabel"));
    objc_msgSend(v38, "setAttributedText:", v45);

    v39 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionView detailLabel](self, "detailLabel"));
    objc_msgSend(v39, "setText:", 0);

    v40 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionView delimiterLabel](self, "delimiterLabel"));
    objc_msgSend(v40, "setHidden:", 1);

    goto LABEL_14;
  }
}

- (BOOL)shouldDistributeProportionally
{
  QuerySuggestionView *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  NSAttributedStringKey v17;
  void *v18;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionView title](self, "title"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionView delimiterString](v2, "delimiterString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionView detailText](v2, "detailText"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@%@"), v3, v4, v5));

  v17 = NSFontAttributeName;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionView titleFont](v2, "titleFont"));
  v18 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
  objc_msgSend(v6, "sizeWithAttributes:", v8);
  v10 = ceil(v9);

  -[QuerySuggestionView layoutIfNeeded](v2, "layoutIfNeeded");
  -[QuerySuggestionView frame](v2, "frame");
  v12 = v11 + -15.0;
  -[UIImageView frame](v2->_iconImageView, "frame");
  v14 = v12 - v13;
  -[UIImageView frame](v2->_iconImageView, "frame");
  LOBYTE(v2) = v10 >= v14 - v15;

  return (char)v2;
}

- (BOOL)needsTwoLinesLayout
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
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  BOOL v25;
  NSAttributedStringKey v27;
  void *v28;

  if (qword_1014D3288 != -1)
    dispatch_once(&qword_1014D3288, &stru_1011C65C0);
  v3 = (void *)qword_1014D3280;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));
  LODWORD(v3) = objc_msgSend(v3, "containsObject:", v5);

  if (!(_DWORD)v3)
    return 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionView title](self, "title"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionView delimiterString](self, "delimiterString"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionView detailText](self, "detailText"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@%@"), v6, v7, v8));

  v27 = NSFontAttributeName;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionView titleFont](self, "titleFont"));
  v28 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));
  objc_msgSend(v9, "sizeWithAttributes:", v11);
  v13 = ceil(v12);

  -[QuerySuggestionView frame](self, "frame");
  v15 = v14;
  -[QuerySuggestionView layoutMargins](self, "layoutMargins");
  v17 = v15 - v16;
  -[QuerySuggestionView layoutMargins](self, "layoutMargins");
  v19 = 0.0;
  if (v17 - v18 >= 0.0)
  {
    -[QuerySuggestionView frame](self, "frame", 0.0, v17 - v18);
    v21 = v20;
    -[QuerySuggestionView layoutMargins](self, "layoutMargins");
    v23 = v21 - v22;
    -[QuerySuggestionView layoutMargins](self, "layoutMargins");
    v19 = v23 - v24;
  }
  v25 = v13 > v19;

  return v25;
}

- (unint64_t)querySuggestionStyle
{
  return self->_querySuggestionStyle;
}

- (void)setQuerySuggestionStyle:(unint64_t)a3
{
  self->_querySuggestionStyle = a3;
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageView:(id)a3
{
  objc_storeStrong((id *)&self->_iconImageView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)delimiterLabel
{
  return self->_delimiterLabel;
}

- (void)setDelimiterLabel:(id)a3
{
  objc_storeStrong((id *)&self->_delimiterLabel, a3);
}

- (UILabel)detailLabel
{
  return self->_detailLabel;
}

- (void)setDetailLabel:(id)a3
{
  objc_storeStrong((id *)&self->_detailLabel, a3);
}

- (UIStackView)labelStackView
{
  return self->_labelStackView;
}

- (void)setLabelStackView:(id)a3
{
  objc_storeStrong((id *)&self->_labelStackView, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)detailText
{
  return self->_detailText;
}

- (void)setDetailText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)highlightRanges
{
  return self->_highlightRanges;
}

- (void)setHighlightRanges:(id)a3
{
  objc_storeStrong((id *)&self->_highlightRanges, a3);
}

- (NSLayoutConstraint)delimeterWidthConstraint
{
  return self->_delimeterWidthConstraint;
}

- (void)setDelimeterWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_delimeterWidthConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delimeterWidthConstraint, 0);
  objc_storeStrong((id *)&self->_highlightRanges, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_labelStackView, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_delimiterLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
}

@end
