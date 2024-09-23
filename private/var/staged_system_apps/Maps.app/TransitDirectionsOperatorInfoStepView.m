@implementation TransitDirectionsOperatorInfoStepView

- (void)_createSubviews
{
  MKMultiPartLabel *v3;
  MKMultiPartLabel *label;
  void *v5;
  void *v6;
  double v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TransitDirectionsOperatorInfoStepView;
  -[TransitDirectionsStepView _createSubviews](&v9, "_createSubviews");
  v3 = (MKMultiPartLabel *)objc_msgSend(objc_alloc((Class)MKMultiPartLabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  label = self->_label;
  self->_label = v3;

  -[MKMultiPartLabel setAccessibilityIdentifier:](self->_label, "setAccessibilityIdentifier:", CFSTR("Label"));
  -[MKMultiPartLabel setTranslatesAutoresizingMaskIntoConstraints:](self->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system15](UIFont, "system15"));
  -[MKMultiPartLabel setFont:](self->_label, "setFont:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[MKMultiPartLabel setTextColor:](self->_label, "setTextColor:", v6);

  -[MKMultiPartLabel setUserInteractionEnabled:](self->_label, "setUserInteractionEnabled:", 0);
  -[MKMultiPartLabel setTextInset:](self->_label, "setTextInset:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  LODWORD(v7) = 1148846080;
  -[MKMultiPartLabel setContentHuggingPriority:forAxis:](self->_label, "setContentHuggingPriority:forAxis:", 1, v7);
  LODWORD(v8) = 1148846080;
  -[MKMultiPartLabel setContentCompressionResistancePriority:forAxis:](self->_label, "setContentCompressionResistancePriority:forAxis:", 1, v8);
  -[TransitDirectionsOperatorInfoStepView addSubview:](self, "addSubview:", self->_label);
}

- (id)_initialConstraints
{
  id v3;
  void *v4;
  MKMultiPartLabel *label;
  void *v6;
  double v7;
  void *v8;
  NSLayoutConstraint *v9;
  NSLayoutConstraint *leadingLabelConstraint;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)TransitDirectionsOperatorInfoStepView;
  v3 = -[TransitDirectionsStepView _initialConstraints](&v13, "_initialConstraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  label = self->_label;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepView contentLayoutGuide](self, "contentLayoutGuide"));
  LODWORD(v7) = 1148846080;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MKMultiPartLabel _maps_constraintsEqualToEdgesOfLayoutGuide:priority:](label, "_maps_constraintsEqualToEdgesOfLayoutGuide:priority:", v6, v7));

  v9 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "leadingConstraint"));
  leadingLabelConstraint = self->_leadingLabelConstraint;
  self->_leadingLabelConstraint = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allConstraints"));
  objc_msgSend(v4, "addObjectsFromArray:", v11);

  return v4;
}

- (void)configureWithItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void **v15;
  uint64_t v16;
  id (*v17)(uint64_t, uint64_t);
  void *v18;
  id v19;
  objc_super v20;
  NSAttributedStringKey v21;
  void *v22;

  v20.receiver = self;
  v20.super_class = (Class)TransitDirectionsOperatorInfoStepView;
  v4 = a3;
  -[TransitDirectionsStepView configureWithItem:](&v20, "configureWithItem:", v4);
  v21 = NSFontAttributeName;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MKMultiPartLabel font](self->_label, "font"));
  v22 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "majorFormattedStrings"));
  v15 = _NSConcreteStackBlock;
  v16 = 3221225472;
  v17 = sub_100BFBB7C;
  v18 = &unk_1011E8F00;
  v19 = v6;
  v8 = v6;
  v9 = sub_10039DCD4(v7, &v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle", v15, v16, v17, v18));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Hours [separator] Fares [Transit, Route List View]"), CFSTR("localized string not found"), 0));

  v13 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MKMultiPartAttributedString multiPartAttributedStringWithComponents:repeatedSeparator:](MKMultiPartAttributedString, "multiPartAttributedStringWithComponents:repeatedSeparator:", v10, v13));

  -[MKMultiPartLabel setMultiPartString:](self->_label, "setMultiPartString:", v14);
}

- (void)setPreviousItem:(id)a3 withPreviousNavigationState:(int64_t)a4
{
  id v7;
  double v8;
  id v9;

  v9 = a3;
  objc_storeStrong((id *)&self->_previousTransitDirectionsListItem, a3);
  self->_previousTransitDirectionsListItemsNavigationState = a4;
  v7 = objc_msgSend(v9, "type");
  v8 = 0.0;
  if (v7 == (id)12)
    +[TransitDirectionsBlockTransferStepView leadingTextInsetForBlockTransferTransitDirectionsListItem:navigationState:](TransitDirectionsBlockTransferStepView, "leadingTextInsetForBlockTransferTransitDirectionsListItem:navigationState:", v9, a4, 0.0);
  -[NSLayoutConstraint setConstant:](self->_leadingLabelConstraint, "setConstant:", v8);

}

- (void)_contentSizeCategoryDidChange
{
  TransitDirectionsOperatorInfoStepView *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  objc_super v6;

  v2 = self;
  if (sub_1002A8AA0(v2) == 5)
    v3 = objc_claimAutoreleasedReturnValue(+[UIFont system17](UIFont, "system17"));
  else
    v3 = objc_claimAutoreleasedReturnValue(+[UIFont system15](UIFont, "system15"));
  v4 = (void *)v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_mapkit_fontByAddingFeaturesForTimeDisplay"));
  -[MKMultiPartLabel setFont:](v2->_label, "setFont:", v5);

  v6.receiver = v2;
  v6.super_class = (Class)TransitDirectionsOperatorInfoStepView;
  -[TransitDirectionsStepView _contentSizeCategoryDidChange](&v6, "_contentSizeCategoryDidChange");
}

- (void)_updateNavigationStateAlpha:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TransitDirectionsOperatorInfoStepView;
  -[TransitDirectionsStepView _updateNavigationStateAlpha:](&v5, "_updateNavigationStateAlpha:");
  -[MKMultiPartLabel setAlpha:](self->_label, "setAlpha:", a3);
}

- (double)bottomSpacerHeight
{
  return 0.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousTransitDirectionsListItem, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_leadingLabelConstraint, 0);
  objc_storeStrong((id *)&self->_topToPrimaryLabelBaselineConstraint, 0);
}

@end
