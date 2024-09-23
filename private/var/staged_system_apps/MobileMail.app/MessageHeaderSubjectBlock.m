@implementation MessageHeaderSubjectBlock

- (MessageHeaderSubjectBlock)initWithFrame:(CGRect)a3
{
  MessageHeaderSubjectBlock *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MessageHeaderSubjectBlock;
  v3 = -[MessageHeaderSubjectBlock initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, "_fontMetricCacheDidInvalidate:", MFFontMetricCacheInvalidationNotification, 0);

  }
  -[MessageHeaderSubjectBlock setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", MSAccessibilityIdentifierMailConversationViewSubjectBlock);
  return v3;
}

- (void)createPrimaryViews
{
  void *v3;
  void *v4;
  id v5;
  double y;
  double width;
  double height;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)MessageHeaderSubjectBlock;
  -[MessageHeaderSubjectBlock createPrimaryViews](&v22, "createPrimaryViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIStackView mf_baselineAlignedVerticalStackView](UIStackView, "mf_baselineAlignedVerticalStackView"));
  -[MessageHeaderSubjectBlock setSubjectStackView:](self, "setSubjectStackView:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageHeaderSubjectBlock subjectStackView](self, "subjectStackView"));
  -[MessageHeaderSubjectBlock addSubview:](self, "addSubview:", v4);

  v5 = objc_alloc((Class)UITextView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v9 = objc_msgSend(v5, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mailComposeTextViewBackgroundColor](UIColor, "mailComposeTextViewBackgroundColor"));
  objc_msgSend(v9, "setBackgroundColor:", v10);

  objc_msgSend(v9, "setClipsToBounds:", 0);
  objc_msgSend(v9, "setScrollEnabled:", 0);
  objc_msgSend(v9, "setSelectable:", 1);
  objc_msgSend(v9, "setEditable:", 0);
  objc_msgSend(v9, "setDataDetectorTypes:", -1);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "textContainer"));
  objc_msgSend(v11, "setMaximumNumberOfLines:", 13);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "textContainer"));
  objc_msgSend(v12, "setLineFragmentPadding:", 0.0);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "textContainer"));
  objc_msgSend(v13, "setLineBreakMode:", 4);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  objc_msgSend(v9, "setTextColor:", v14);

  v15 = MSAccessibilityIdentifierMailMessageViewSubjectLabel;
  objc_msgSend(v9, "setAccessibilityIdentifier:", MSAccessibilityIdentifierMailMessageViewSubjectLabel);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "linkTextAttributes"));
  v17 = objc_msgSend(v16, "mutableCopy");

  objc_msgSend(v17, "setObject:forKey:", &__kCFBooleanTrue, NSUnderlineStyleAttributeName);
  objc_msgSend(v9, "setLinkTextAttributes:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MessageHeaderSubjectBlock subjectStackView](self, "subjectStackView"));
  objc_msgSend(v18, "addArrangedSubview:", v9);

  -[MessageHeaderSubjectBlock setSubjectTextView:](self, "setSubjectTextView:", v9);
  v19 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v19, "setBackgroundColor:", v20);

  objc_msgSend(v19, "setClipsToBounds:", 0);
  objc_msgSend(v19, "setNumberOfLines:", 13);
  objc_msgSend(v19, "setLineBreakMode:", 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  objc_msgSend(v19, "setTextColor:", v21);

  objc_msgSend(v19, "setAccessibilityIdentifier:", v15);
  -[MessageHeaderSubjectBlock setSubjectLabel:](self, "setSubjectLabel:", v19);
  -[MessageHeaderSubjectBlock _updateFonts](self, "_updateFonts");

}

- (void)initializePrimaryLayoutConstraints
{
  void *v3;
  double v4;
  double v5;
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
  objc_super v23;
  _QWORD v24[4];

  v23.receiver = self;
  v23.super_class = (Class)MessageHeaderSubjectBlock;
  -[MessageHeaderSubjectBlock initializePrimaryLayoutConstraints](&v23, "initializePrimaryLayoutConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageHeaderSubjectBlock subjectStackView](self, "subjectStackView"));
  -[MessageHeaderSubjectBlock _subjectMaxOffset](self, "_subjectMaxOffset");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstBaselineAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageHeaderSubjectBlock topAnchor](self, "topAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v7));
  -[MessageHeaderSubjectBlock setFirstBaselineConstraint:](self, "setFirstBaselineConstraint:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MessageHeaderSubjectBlock bottomAnchor](self, "bottomAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastBaselineAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
  -[MessageHeaderSubjectBlock setLastBaselineConstraint:](self, "setLastBaselineConstraint:", v11);

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MessageHeaderSubjectBlock layoutMarginsGuide](self, "layoutMarginsGuide"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "leadingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:constant:", v12, -v5));
  v24[0] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trailingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MessageHeaderSubjectBlock layoutMarginsGuide](self, "layoutMarginsGuide"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "trailingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:constant:", v16, v5));
  v24[1] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MessageHeaderSubjectBlock firstBaselineConstraint](self, "firstBaselineConstraint"));
  v24[2] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MessageHeaderSubjectBlock lastBaselineConstraint](self, "lastBaselineConstraint"));
  v24[3] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 4));

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v20);
}

- (void)setDisplayMetrics:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  objc_super v22;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageHeaderSubjectBlock displayMetrics](self, "displayMetrics"));
  v22.receiver = self;
  v22.super_class = (Class)MessageHeaderSubjectBlock;
  -[MessageHeaderSubjectBlock setDisplayMetrics:](&v22, "setDisplayMetrics:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageHeaderSubjectBlock displayMetrics](self, "displayMetrics"));
  if (v6)
  {
    objc_msgSend(v4, "firstSeparatorToSubjectBaseline");
    v8 = v7;
    objc_msgSend(v5, "firstSeparatorToSubjectBaseline");
    if (v8 != v9)
    {

LABEL_5:
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MessageHeaderSubjectBlock displayMetrics](self, "displayMetrics"));
      objc_msgSend(v14, "firstSeparatorToSubjectBaseline");
      v16 = v15;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MessageHeaderSubjectBlock firstBaselineConstraint](self, "firstBaselineConstraint"));
      objc_msgSend(v17, "setConstant:", v16);

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MessageHeaderSubjectBlock displayMetrics](self, "displayMetrics"));
      objc_msgSend(v18, "headerBottomPadding");
      v20 = v19;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[MessageHeaderSubjectBlock lastBaselineConstraint](self, "lastBaselineConstraint"));
      objc_msgSend(v21, "setConstant:", v20);

      goto LABEL_6;
    }
    objc_msgSend(v4, "headerBottomPadding");
    v11 = v10;
    objc_msgSend(v5, "headerBottomPadding");
    v13 = v12;

    if (v11 != v13)
      goto LABEL_5;
  }
LABEL_6:

}

- (void)setSeparatorIsHidden:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MessageHeaderSubjectBlock;
  -[MessageHeaderSubjectBlock setSeparatorIsHidden:](&v3, "setSeparatorIsHidden:", 1);
}

- (void)setInteractivelyResizing:(BOOL)a3
{
  _BOOL8 v3;
  unsigned int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v3 = a3;
  v5 = -[MessageHeaderSubjectBlock interactivelyResizing](self, "interactivelyResizing");
  v11.receiver = self;
  v11.super_class = (Class)MessageHeaderSubjectBlock;
  -[MessageHeaderSubjectBlock setInteractivelyResizing:](&v11, "setInteractivelyResizing:", v3);
  if (v5 != v3)
  {
    if (v3)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageHeaderSubjectBlock subjectTextView](self, "subjectTextView"));
      v7 = objc_claimAutoreleasedReturnValue(-[MessageHeaderSubjectBlock subjectLabel](self, "subjectLabel"));
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageHeaderSubjectBlock subjectLabel](self, "subjectLabel"));
      v7 = objc_claimAutoreleasedReturnValue(-[MessageHeaderSubjectBlock subjectTextView](self, "subjectTextView"));
    }
    v8 = (void *)v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MessageHeaderSubjectBlock subjectStackView](self, "subjectStackView"));
    objc_msgSend(v9, "removeArrangedSubview:", v6);

    objc_msgSend(v6, "removeFromSuperview");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MessageHeaderSubjectBlock subjectStackView](self, "subjectStackView"));
    objc_msgSend(v10, "addArrangedSubview:", v8);

  }
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MessageHeaderSubjectBlock;
  -[MessageHeaderSubjectBlock prepareForReuse](&v3, "prepareForReuse");
  -[MessageHeaderSubjectBlock setHidden:](self, "setHidden:", 0);
}

- (void)displayMessageUsingViewModel:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MessageHeaderSubjectBlock;
  -[MessageHeaderSubjectBlock displayMessageUsingViewModel:](&v5, "displayMessageUsingViewModel:", v4);
  -[MessageHeaderSubjectBlock _updateSubjectText](self, "_updateSubjectText");

}

- (double)_subjectMaxOffset
{
  return 7.0;
}

- (void)_updateSubjectText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageHeaderSubjectBlock viewModel](self, "viewModel"));
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subject"));

  if (objc_msgSend(v11, "length"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[DDDetectionController sharedController](DDDetectionController, "sharedController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MessageHeaderSubjectBlock _contextForDDDetectionController](self, "_contextForDDDetectionController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MessageHeaderSubjectBlock subjectTextView](self, "subjectTextView"));
    objc_msgSend(v4, "setContext:forContainer:", v5, v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[ECSubjectFormatter subjectStringForDisplayForSubject:](ECSubjectFormatter, "subjectStringForDisplayForSubject:", v11));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("NO_SUBJECT"), &stru_100531B00, CFSTR("Main")));

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MessageHeaderSubjectBlock subjectTextView](self, "subjectTextView"));
  objc_msgSend(v9, "setText:", v7);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MessageHeaderSubjectBlock subjectLabel](self, "subjectLabel"));
  objc_msgSend(v10, "setText:", v7);

}

- (id)_contextForDDDetectionController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageHeaderSubjectBlock viewModel](self, "viewModel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subjectWithoutPrefix"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MessageHeaderSubjectBlock viewModel](self, "viewModel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dateSent"));

  if (v6)
    objc_msgSend(v3, "setObject:forKey:", v6, kDataDetectorsEventTitleKey);
  if (v8)
    objc_msgSend(v3, "setObject:forKey:", v8, kDataDetectorsReferenceDateKey);
  if (!objc_msgSend(v3, "count"))
  {

    v3 = 0;
  }

  return v3;
}

- (void)_updateFonts
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MessageHeaderSubjectBlock _subjectFont](self, "_subjectFont"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MessageHeaderSubjectBlock subjectTextView](self, "subjectTextView"));
  objc_msgSend(v3, "setFont:", v5);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageHeaderSubjectBlock subjectLabel](self, "subjectLabel"));
  objc_msgSend(v4, "setFont:", v5);

}

- (id)_subjectFont
{
  void *v3;
  void *v4;
  unsigned int v5;
  Block_layout *v6;
  const __CFString *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MFFontMetricCache sharedFontMetricCache](MFFontMetricCache, "sharedFontMetricCache"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MessageHeaderSubjectBlock displayMetrics](self, "displayMetrics"));
  v5 = objc_msgSend(v4, "hasCompactLayout");

  if (v5)
    v6 = &stru_10051EF50;
  else
    v6 = &stru_10051EF70;
  if (v5)
    v7 = CFSTR("MessageHeaderSubjectBlock.compactSubjectFont");
  else
    v7 = CFSTR("MessageHeaderSubjectBlock.regularSubjectFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cachedFont:forKey:", v6, v7));

  return v8;
}

- (UIStackView)subjectStackView
{
  return self->_subjectStackView;
}

- (void)setSubjectStackView:(id)a3
{
  objc_storeStrong((id *)&self->_subjectStackView, a3);
}

- (UITextView)subjectTextView
{
  return self->_subjectTextView;
}

- (void)setSubjectTextView:(id)a3
{
  objc_storeStrong((id *)&self->_subjectTextView, a3);
}

- (UILabel)subjectLabel
{
  return self->_subjectLabel;
}

- (void)setSubjectLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subjectLabel, a3);
}

- (NSLayoutConstraint)firstBaselineConstraint
{
  return self->_firstBaselineConstraint;
}

- (void)setFirstBaselineConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_firstBaselineConstraint, a3);
}

- (NSLayoutConstraint)lastBaselineConstraint
{
  return self->_lastBaselineConstraint;
}

- (void)setLastBaselineConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_lastBaselineConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_firstBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_subjectLabel, 0);
  objc_storeStrong((id *)&self->_subjectTextView, 0);
  objc_storeStrong((id *)&self->_subjectStackView, 0);
}

@end
