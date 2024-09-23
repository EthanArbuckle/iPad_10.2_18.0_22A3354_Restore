@implementation PHRecentsPhoneHeaderSummaryView

- (PHRecentsPhoneHeaderSummaryView)initWithFrame:(CGRect)a3 recentCall:(id)a4 occurrenceDate:(id)a5 status:(unsigned int)a6 duration:(double)a7 type:(unsigned int)a8
{
  uint64_t v8;
  PHRecentsPhoneHeaderSummaryView *v12;
  uint64_t v13;
  void *v14;
  id v15;
  double y;
  double width;
  double height;
  id v19;
  uint64_t v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  int v43;
  void *v44;
  void *v45;
  void *v46;
  const __CFString *v47;
  void *v48;
  void *v49;
  double v50;
  void *v51;
  void *v53;
  const __CFString *v54;
  objc_super v55;
  const __CFString *v56;
  const __CFString *v57;
  _QWORD v58[2];

  v8 = *(_QWORD *)&a8;
  v55.receiver = self;
  v55.super_class = (Class)PHRecentsPhoneHeaderSummaryView;
  v12 = -[PHRecentsPhoneHeaderSummaryView initWithFrame:](&v55, "initWithFrame:", a4, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (!v12)
    return v12;
  if (objc_msgSend(UIApp, "userInterfaceStyle") == 1)
    v13 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  else
    v13 = objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  v14 = (void *)v13;
  v15 = objc_alloc((Class)UILabel);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v19 = objc_msgSend(v15, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v20 = UIFontDescriptorTextStyleCaption1;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont phPreferredBoldFontForTextStyle:](UIFont, "phPreferredBoldFontForTextStyle:", UIFontDescriptorTextStyleCaption1));
  objc_msgSend(v19, "setFont:", v21);

  objc_msgSend(v19, "setTextColor:", v14);
  -[PHRecentsPhoneHeaderSummaryView addSubview:](v12, "addSubview:", v19);
  objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v22) = 1144750080;
  objc_msgSend(v19, "setContentCompressionResistancePriority:forAxis:", 0, v22);
  LODWORD(v23) = 1148846080;
  objc_msgSend(v19, "setContentCompressionResistancePriority:forAxis:", 1, v23);
  LODWORD(v24) = 1132068864;
  objc_msgSend(v19, "setContentHuggingPriority:forAxis:", 0, v24);
  LODWORD(v25) = 1148846080;
  objc_msgSend(v19, "setContentHuggingPriority:forAxis:", 1, v25);
  if (kCHCallStatusMissed == a6)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v27 = v26;
    v28 = CFSTR("MISSED");
LABEL_11:
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", v28, &stru_10008B240, CFSTR("Recents")));
    v30 = 0;
    goto LABEL_12;
  }
  if (kCHCallStatusCancelled == a6)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v27 = v26;
    v28 = CFSTR("CANCELLED");
    goto LABEL_11;
  }
  if (kCHCallStatusAnsweredElsewhere == a6)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v27 = v26;
    v28 = CFSTR("ANSWERED_ELSEWHERE");
    goto LABEL_11;
  }
  if (kCHCallStatusConnectedOutgoing == a6)
  {
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v27 = v53;
    v54 = CFSTR("OUTGOING");
LABEL_30:
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "localizedStringForKey:value:table:", v54, &stru_10008B240, CFSTR("Recents")));
    v30 = 1;
LABEL_12:

    if (v29)
      goto LABEL_16;
    goto LABEL_13;
  }
  if (kCHCallStatusConnectedIncoming == a6)
  {
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v27 = v53;
    v54 = CFSTR("INCOMING");
    goto LABEL_30;
  }
  v30 = 0;
LABEL_13:
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unable to generate type string for recent call type %d"), v8));
  NSLog(CFSTR("** TUAssertion failure: %@"), v31);

  if (_TUAssertShouldCrashApplication())
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, v12, CFSTR("PHRecentsPhoneHeaderView.m"), 101, CFSTR("Unable to generate type string for recent call type %d"), v8);

  }
  v29 = 0;
LABEL_16:
  objc_msgSend(v19, "setText:", v29);
  objc_msgSend(v19, "intrinsicContentSize");
  v34 = v33;
  if ((v30 & 1) == 0)
  {
    v56 = CFSTR("Type");
    v57 = CFSTR("Duration");
    v58[0] = v19;
    goto LABEL_20;
  }
  v35 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont phPreferredFontForTextStyle:](UIFont, "phPreferredFontForTextStyle:", v20));
  objc_msgSend(v35, "setFont:", v36);

  objc_msgSend(v35, "setTextColor:", v14);
  v37 = sub_10003CCE0(a7);
  v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
  objc_msgSend(v35, "setText:", v38);

  -[PHRecentsPhoneHeaderSummaryView addSubview:](v12, "addSubview:", v35);
  objc_msgSend(v35, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v39) = 1148846080;
  objc_msgSend(v35, "setContentCompressionResistancePriority:forAxis:", 0, v39);
  LODWORD(v40) = 1148846080;
  objc_msgSend(v35, "setContentCompressionResistancePriority:forAxis:", 1, v40);
  LODWORD(v41) = 1148846080;
  objc_msgSend(v35, "setContentHuggingPriority:forAxis:", 0, v41);
  LODWORD(v42) = 1148846080;
  objc_msgSend(v35, "setContentHuggingPriority:forAxis:", 1, v42);
  v56 = CFSTR("Type");
  v57 = CFSTR("Duration");
  v58[0] = v19;
  if (!v35)
  {
LABEL_20:
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v35 = 0;
    v43 = 1;
    goto LABEL_21;
  }
  v43 = 0;
  v44 = v35;
LABEL_21:
  v58[1] = v44;
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v58, &v56, 2));
  if (v43)
  {

    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-0@1000-[Type]-0@1000-|"), 0, 0, v45));
    -[PHRecentsPhoneHeaderSummaryView addConstraints:](v12, "addConstraints:", v46);
    v47 = CFSTR("|-0@1000-[Type]->=0@999-|");
  }
  else
  {
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-0@1000-[Type]-0@1000-|"), 0, 0, v45));
    -[PHRecentsPhoneHeaderSummaryView addConstraints:](v12, "addConstraints:", v48);

    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-0@500-[Duration]-0@500-|"), 0, 0, v45));
    -[PHRecentsPhoneHeaderSummaryView addConstraints:](v12, "addConstraints:", v49);

    LODWORD(v50) = 1148846080;
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:priority:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:priority:", v35, 11, 0, v19, 11, 1.0, 0.0, v50));
    -[PHRecentsPhoneHeaderSummaryView addConstraint:](v12, "addConstraint:", v46);
    v47 = CFSTR("|-0@1000-[Type]->=0@999-[Duration]-0@1000-|");
  }

  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", v47, 0, 0, v45));
  -[PHRecentsPhoneHeaderSummaryView addConstraints:](v12, "addConstraints:", v51);

  -[PHRecentsPhoneHeaderSummaryView setTopmostLabel:](v12, "setTopmostLabel:", v19);
  -[PHRecentsPhoneHeaderSummaryView setBottommostLabel:](v12, "setBottommostLabel:", v19);
  -[PHRecentsPhoneHeaderSummaryView setIntrinsicContentHeight:](v12, "setIntrinsicContentHeight:", v34 + 0.0);

  return v12;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  CGSize result;

  -[PHRecentsPhoneHeaderSummaryView intrinsicContentHeight](self, "intrinsicContentHeight");
  v3 = v2;
  v4 = 177.0;
  result.height = v3;
  result.width = v4;
  return result;
}

- (UILabel)topmostLabel
{
  return self->_topmostLabel;
}

- (void)setTopmostLabel:(id)a3
{
  self->_topmostLabel = (UILabel *)a3;
}

- (UILabel)bottommostLabel
{
  return self->_bottommostLabel;
}

- (void)setBottommostLabel:(id)a3
{
  self->_bottommostLabel = (UILabel *)a3;
}

- (double)intrinsicContentHeight
{
  return self->_intrinsicContentHeight;
}

- (void)setIntrinsicContentHeight:(double)a3
{
  self->_intrinsicContentHeight = a3;
}

@end
