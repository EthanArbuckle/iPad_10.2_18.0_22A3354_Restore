@implementation FRTagSearchResultTableViewCell

- (FRTagSearchResultTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  FRTagSearchResultTableViewCell *v4;
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
  FRSubscriptionButton *v20;
  FRSubscriptionButton *subscriptionButton;
  UIImageView *v22;
  UIImageView *channelLogoView;
  void *v24;
  void *v25;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)FRTagSearchResultTableViewCell;
  v4 = -[FRTagSearchResultTableViewCell initWithStyle:reuseIdentifier:](&v27, "initWithStyle:reuseIdentifier:", 3, a4);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor fr_searchBackgroundColor](UIColor, "fr_searchBackgroundColor"));
    -[FRTagSearchResultTableViewCell setBackgroundColor:](v4, "setBackgroundColor:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontMetrics metricsForTextStyle:](UIFontMetrics, "metricsForTextStyle:", UIFontTextStyleHeadline));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 17.0, UIFontWeightBold));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "scaledFontForFont:", v7));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FRTagSearchResultTableViewCell textLabel](v4, "textLabel"));
    objc_msgSend(v9, "setLineBreakMode:", 4);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FRTagSearchResultTableViewCell textLabel](v4, "textLabel"));
    objc_msgSend(v10, "setFont:", v8);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor fr_searchResultsCellTextColor](UIColor, "fr_searchResultsCellTextColor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FRTagSearchResultTableViewCell textLabel](v4, "textLabel"));
    objc_msgSend(v12, "setTextColor:", v11);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontMetrics metricsForTextStyle:](UIFontMetrics, "metricsForTextStyle:", UIFontTextStyleSubheadline));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 9.0, UIFontWeightBold));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "scaledFontForFont:", v14));

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FRTagSearchResultTableViewCell detailTextLabel](v4, "detailTextLabel"));
    objc_msgSend(v16, "setFont:", v15);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[FRTagSearchResultTableViewCell detailTextLabel](v4, "detailTextLabel"));
    objc_msgSend(v17, "setLineBreakMode:", 4);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor fr_searchResultsCellDetailTextColor](UIColor, "fr_searchResultsCellDetailTextColor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[FRTagSearchResultTableViewCell detailTextLabel](v4, "detailTextLabel"));
    objc_msgSend(v19, "setTextColor:", v18);

    v20 = -[FRSubscriptionButton initWithStyle:]([FRSubscriptionButton alloc], "initWithStyle:", 0);
    subscriptionButton = v4->_subscriptionButton;
    v4->_subscriptionButton = v20;

    -[FRSubscriptionButton setFrame:](v4->_subscriptionButton, "setFrame:", 0.0, 0.0, 24.0, 24.0);
    -[FRTouchInsetsButton setTouchInsets:](v4->_subscriptionButton, "setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
    -[FRTagSearchResultTableViewCell setAccessoryView:](v4, "setAccessoryView:", v4->_subscriptionButton);
    v22 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    channelLogoView = v4->_channelLogoView;
    v4->_channelLogoView = v22;

    -[UIImageView setAlpha:](v4->_channelLogoView, "setAlpha:", 0.0);
    -[UIImageView setContentMode:](v4->_channelLogoView, "setContentMode:", 7);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[FRTagSearchResultTableViewCell contentView](v4, "contentView"));
    objc_msgSend(v24, "addSubview:", v4->_channelLogoView);

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor fr_searchResultsCellSelectedTintColor](UIColor, "fr_searchResultsCellSelectedTintColor"));
    -[FRTagSearchResultTableViewCell setSelectionTintColor:](v4, "setSelectionTintColor:", v25);

  }
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  CGFloat v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double MaxY;
  double v38;
  double v39;
  double v40;
  double MinX;
  double v42;
  void *v43;
  double x;
  double y;
  double width;
  double height;
  void *v48;
  void *v49;
  double v50;
  objc_super v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRTagSearchResultTableViewCell textLabel](self, "textLabel"));
  objc_msgSend(v3, "setNumberOfLines:", 2);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRTagSearchResultTableViewCell detailTextLabel](self, "detailTextLabel"));
  objc_msgSend(v4, "setNumberOfLines:", 2);

  v51.receiver = self;
  v51.super_class = (Class)FRTagSearchResultTableViewCell;
  -[FRTagSearchResultTableViewCell layoutSubviews](&v51, "layoutSubviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRTagSearchResultTableViewCell readableContentGuide](self, "readableContentGuide"));
  objc_msgSend(v5, "layoutFrame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v52.origin.x = v7;
  v52.origin.y = v9;
  v52.size.width = v11;
  v52.size.height = v13;
  v14 = fmax(CGRectGetMinX(v52), 16.0);
  -[FRTagSearchResultTableViewCell frame](self, "frame");
  v16 = (v15 + -40.0) * 0.5;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[FRTagSearchResultTableViewCell channelLogoView](self, "channelLogoView"));
  objc_msgSend(v17, "setFrame:", v14, v16, 40.0, 40.0);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[FRTagSearchResultTableViewCell contentView](self, "contentView"));
  objc_msgSend(v18, "frame");
  v20 = v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[FRTagSearchResultTableViewCell channelLogoView](self, "channelLogoView"));
  objc_msgSend(v21, "frame");
  v22 = v20 - CGRectGetMaxX(v53);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[FRTagSearchResultTableViewCell accessoryView](self, "accessoryView"));
  objc_msgSend(v23, "frame");
  v24 = v22 - CGRectGetWidth(v54) + -20.0;

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[FRTagSearchResultTableViewCell textLabel](self, "textLabel"));
  -[FRTagSearchResultTableViewCell frame](self, "frame");
  objc_msgSend(v25, "sizeThatFits:", v24, CGRectGetHeight(v55));
  v27 = v26;
  v29 = v28;

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[FRTagSearchResultTableViewCell detailTextLabel](self, "detailTextLabel"));
  -[FRTagSearchResultTableViewCell frame](self, "frame");
  objc_msgSend(v30, "sizeThatFits:", v24, CGRectGetHeight(v56));
  v50 = v31;
  v33 = v32;

  -[FRTagSearchResultTableViewCell frame](self, "frame");
  v34 = (CGRectGetHeight(v57) - (v29 + v33)) * 0.5;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[FRTagSearchResultTableViewCell channelLogoView](self, "channelLogoView"));
  objc_msgSend(v35, "frame");
  v36 = CGRectGetMaxX(v58) + 13.0;

  v59.origin.x = v36;
  v59.origin.y = v34;
  v59.size.width = v27;
  v59.size.height = v29;
  MaxY = CGRectGetMaxY(v59);
  v38 = 0.0;
  if (v33 > 0.0)
  {
    v39 = v33 + MaxY;
    -[FRTagSearchResultTableViewCell bounds](self, "bounds");
    v40 = CGRectGetMaxY(v60) - v39;
    if (v40 > 3.0)
      v40 = 3.0;
    if (v40 >= 0.0)
      v38 = v40;
    else
      v38 = 0.0;
  }
  v61.origin.x = v36;
  v61.origin.y = v34;
  v61.size.width = v27;
  v61.size.height = v29;
  MinX = CGRectGetMinX(v61);
  v62.origin.x = v36;
  v62.origin.y = v34;
  v62.size.width = v27;
  v62.size.height = v29;
  v42 = v38 + CGRectGetMaxY(v62);
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[FRTagSearchResultTableViewCell detailTextLabel](self, "detailTextLabel"));
  objc_msgSend(v43, "setFrame:", MinX, v42, v50, v33);

  v63.origin.x = v36;
  v63.origin.y = v34;
  v63.size.width = v27;
  v63.size.height = v29;
  v64 = CGRectOffset(v63, 0.0, v38 * -0.5);
  x = v64.origin.x;
  y = v64.origin.y;
  width = v64.size.width;
  height = v64.size.height;
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[FRTagSearchResultTableViewCell textLabel](self, "textLabel"));
  objc_msgSend(v48, "setFrame:", x, y, width, height);

  v49 = (void *)objc_claimAutoreleasedReturnValue(-[FRTagSearchResultTableViewCell delegate](self, "delegate"));
  objc_msgSend(v49, "searchResultTableViewCellDidFinishLayingOut:", self);

}

- (void)prepareForReuse
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FRTagSearchResultTableViewCell;
  -[FRTagSearchResultTableViewCell prepareForReuse](&v8, "prepareForReuse");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRTagSearchResultTableViewCell textLabel](self, "textLabel"));
  objc_msgSend(v3, "setHidden:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRTagSearchResultTableViewCell textLabel](self, "textLabel"));
  objc_msgSend(v4, "setText:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRTagSearchResultTableViewCell detailTextLabel](self, "detailTextLabel"));
  objc_msgSend(v5, "setText:", 0);

  -[FRTagSearchResultTableViewCell _clearImage](self, "_clearImage");
  -[FRTagSearchResultTableViewCell setChannelTag:](self, "setChannelTag:", 0);
  -[FRTagSearchResultTableViewCell setAccessoryType:](self, "setAccessoryType:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FRTagSearchResultTableViewCell subscriptionButton](self, "subscriptionButton"));
  -[FRTagSearchResultTableViewCell setAccessoryView:](self, "setAccessoryView:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FRTagSearchResultTableViewCell subscriptionButton](self, "subscriptionButton"));
  objc_msgSend(v7, "removeTarget:action:forControlEvents:", 0, 0, 64);

  -[FRTagSearchResultTableViewCell setFeldsparContext:](self, "setFeldsparContext:", 0);
}

- (void)setDescriptionLabelWithText:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "uppercaseString"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRTagSearchResultTableViewCell detailTextLabel](self, "detailTextLabel"));
  objc_msgSend(v4, "setText:", v5);

}

- (void)applyTag:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  -[FRTagSearchResultTableViewCell setChannelTag:](self, "setChannelTag:", v6);
  -[FRTagSearchResultTableViewCell setFeldsparContext:](self, "setFeldsparContext:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FRTagSearchResultTableViewCell textLabel](self, "textLabel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
  objc_msgSend(v8, "setText:", v9);

  if (+[FRMacros isUIAutomationRunning](FRMacros, "isUIAutomationRunning"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));

    if (v10)
    {
      v14 = CFSTR("identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
      v15 = v11;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "fc_jsonString"));
      -[FRTagSearchResultTableViewCell setAccessibilityValue:](self, "setAccessibilityValue:", v13);

    }
    else
    {
      -[FRTagSearchResultTableViewCell setAccessibilityValue:](self, "setAccessibilityValue:", 0);
    }
  }

}

- (void)applyPublisherLogo:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  double v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  _QWORD v12[5];
  id v13;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FRTagSearchResultTableViewCell channelLogoView](self, "channelLogoView"));
  objc_msgSend(v7, "alpha");
  if (v8 == 0.0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FRTagSearchResultTableViewCell channelLogoView](self, "channelLogoView"));
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "image"));

    if (v10 != v6)
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100074224;
      v12[3] = &unk_1000D97A8;
      v12[4] = self;
      v13 = v6;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100074280;
      v11[3] = &unk_1000D9758;
      v11[4] = self;
      +[UIView ts_executeWithAnimated:duration:setupBlock:animationBlock:completion:](UIView, "ts_executeWithAnimated:duration:setupBlock:animationBlock:completion:", v4, v12, v11, &stru_1000DEDE8, 0.5);

    }
  }
  else
  {

  }
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (int64_t)accessibilityElementCount
{
  objc_super v4;

  if (!+[FRMacros isUIAutomationRunning](FRMacros, "isUIAutomationRunning"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)FRTagSearchResultTableViewCell;
  return -[FRTagSearchResultTableViewCell accessibilityElementCount](&v4, "accessibilityElementCount");
}

- (id)accessibilityElements
{
  id v3;
  void *v4;
  objc_super v6;

  if (+[FRMacros isUIAutomationRunning](FRMacros, "isUIAutomationRunning"))
  {
    v6.receiver = self;
    v6.super_class = (Class)FRTagSearchResultTableViewCell;
    v3 = -[FRTagSearchResultTableViewCell accessibilityElements](&v6, "accessibilityElements");
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)accessibilityLabel
{
  NSMutableArray *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  uint64_t v21;

  v3 = objc_opt_new(NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRTagSearchResultTableViewCell textLabel](self, "textLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FRTagSearchResultTableViewCell textLabel](self, "textLabel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "text"));
    -[NSMutableArray addObject:](v3, "addObject:", v8);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FRTagSearchResultTableViewCell detailTextLabel](self, "detailTextLabel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "text"));
  v11 = objc_msgSend(v10, "length");

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FRTagSearchResultTableViewCell detailTextLabel](self, "detailTextLabel"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "text"));
    -[NSMutableArray addObject:](v3, "addObject:", v13);

  }
  if (-[NSMutableArray count](v3, "count"))
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v3, "componentsJoinedByString:", CFSTR(", ")));
  else
    v14 = &stru_1000DF290;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[FRTagSearchResultTableViewCell feldsparContext](self, "feldsparContext"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "subscriptionController"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[FRTagSearchResultTableViewCell channelTag](self, "channelTag"));
  v18 = objc_msgSend(v16, "hasSubscriptionToTag:", v17);

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Following"), &stru_1000DF290, 0));
    v21 = objc_claimAutoreleasedReturnValue(-[__CFString fr_accessibilityAttributedStringWithLowPitchPrefix:](v14, "fr_accessibilityAttributedStringWithLowPitchPrefix:", v20));

    v14 = (__CFString *)v21;
  }

  return v14;
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  id v21;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRTagSearchResultTableViewCell feldsparContext](self, "feldsparContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subscriptionController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRTagSearchResultTableViewCell channelTag](self, "channelTag"));
  v6 = objc_msgSend(v4, "hasSubscriptionToTag:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = v7;
  if (v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Unfollow %1$@"), &stru_1000DF290, 0));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FRTagSearchResultTableViewCell channelTag](self, "channelTag"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v11));

    v13 = objc_msgSend(objc_alloc((Class)UIAccessibilityCustomAction), "initWithName:target:selector:", v12, self, "_accessibilityPerformRemoveFromFavoritesAction");
    v21 = v13;
    v14 = &v21;
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Follow %1$@"), &stru_1000DF290, 0));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FRTagSearchResultTableViewCell channelTag](self, "channelTag"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "name"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v15, v17));

    v13 = objc_msgSend(objc_alloc((Class)UIAccessibilityCustomAction), "initWithName:target:selector:", v12, self, "_accessibilityPerformAddToFavoritesAction");
    v20 = v13;
    v14 = &v20;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 1));

  return v18;
}

- (BOOL)_accessibilityPerformAddToFavoritesAction
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRTagSearchResultTableViewCell feldsparContext](self, "feldsparContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subscriptionController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRTagSearchResultTableViewCell channelTag](self, "channelTag"));
  v6 = objc_msgSend(v4, "hasSubscriptionToTag:", v5);

  if ((v6 & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FRTagSearchResultTableViewCell subscriptionButton](self, "subscriptionButton"));
    objc_msgSend(v7, "sendActionsForControlEvents:", 64);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Following"), &stru_1000DF290, 0));
    UIAccessibilitySpeakAndDoNotBeInterrupted();

    UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, self);
  }
  return 1;
}

- (BOOL)_accessibilityPerformRemoveFromFavoritesAction
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRTagSearchResultTableViewCell feldsparContext](self, "feldsparContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subscriptionController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRTagSearchResultTableViewCell channelTag](self, "channelTag"));
  v6 = objc_msgSend(v4, "hasSubscriptionToTag:", v5);

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FRTagSearchResultTableViewCell subscriptionButton](self, "subscriptionButton"));
    objc_msgSend(v7, "sendActionsForControlEvents:", 64);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Unfollowed"), &stru_1000DF290, 0));
    UIAccessibilitySpeakAndDoNotBeInterrupted();

    UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, self);
  }
  return 1;
}

- (void)_setTextLabelText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[FRTagSearchResultTableViewCell textLabel](self, "textLabel"));
  objc_msgSend(v5, "setText:", v4);

}

- (void)_clearImage
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRTagSearchResultTableViewCell channelLogoView](self, "channelLogoView"));
  objc_msgSend(v3, "setImage:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRTagSearchResultTableViewCell channelLogoView](self, "channelLogoView"));
  objc_msgSend(v4, "setAlpha:", 0.0);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[FRTagSearchResultTableViewCell textLabel](self, "textLabel"));
  objc_msgSend(v5, "setAlpha:", 1.0);

}

- (FRTagSearchResultTableViewCellDelegate)delegate
{
  return (FRTagSearchResultTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (FRSubscriptionButton)subscriptionButton
{
  return self->_subscriptionButton;
}

- (FCTagProviding)channelTag
{
  return self->_channelTag;
}

- (void)setChannelTag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (UIImageView)channelLogoView
{
  return self->_channelLogoView;
}

- (FRFeldsparContext)feldsparContext
{
  return (FRFeldsparContext *)objc_loadWeakRetained((id *)&self->_feldsparContext);
}

- (void)setFeldsparContext:(id)a3
{
  objc_storeWeak((id *)&self->_feldsparContext, a3);
}

- (NSString)descriptionText
{
  return self->_descriptionText;
}

- (void)setDescriptionText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionText, 0);
  objc_destroyWeak((id *)&self->_feldsparContext);
  objc_storeStrong((id *)&self->_channelLogoView, 0);
  objc_storeStrong((id *)&self->_channelTag, 0);
  objc_storeStrong((id *)&self->_subscriptionButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
