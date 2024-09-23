@implementation NoRecentlySearchCollectionViewCell

- (NoRecentlySearchCollectionViewCell)initWithFrame:(CGRect)a3
{
  NoRecentlySearchCollectionViewCell *v3;
  void *v4;
  id v5;
  MapsThemeLabel *v6;
  MapsThemeLabel *titleLabel;
  void *v8;
  void *v9;
  void *v10;
  MapsThemeLabel *v11;
  MapsThemeLabel *contentLabel;
  void *v13;
  void *v14;
  void *v15;
  KeyboardAvoidingView *v16;
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
  void *v34;
  void *v35;
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
  objc_super v64;
  _QWORD v65[10];

  v64.receiver = self;
  v64.super_class = (Class)NoRecentlySearchCollectionViewCell;
  v3 = -[NoRecentlySearchCollectionViewCell initWithFrame:](&v64, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[NoRecentlySearchCollectionViewCell setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = objc_alloc_init((Class)UIView);
    v6 = objc_alloc_init(MapsThemeLabel);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v6;

    -[MapsThemeLabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MapsThemeLabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("No recent searches title [NoQuery]"), CFSTR("localized string not found"), 0));
    -[MapsThemeLabel setText:](v3->_titleLabel, "setText:", v9);

    +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v3->_titleLabel, &stru_1011E7AB8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[MapsThemeLabel setTextColor:](v3->_titleLabel, "setTextColor:", v10);

    -[MapsThemeLabel setTextAlignment:](v3->_titleLabel, "setTextAlignment:", 1);
    -[MapsThemeLabel setAllowsDefaultTighteningForTruncation:](v3->_titleLabel, "setAllowsDefaultTighteningForTruncation:", 1);
    -[MapsThemeLabel setAdjustsFontSizeToFitWidth:](v3->_titleLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[MapsThemeLabel setMinimumScaleFactor:](v3->_titleLabel, "setMinimumScaleFactor:", 0.699999988);
    objc_msgSend(v5, "addSubview:", v3->_titleLabel);
    v11 = objc_alloc_init(MapsThemeLabel);
    contentLabel = v3->_contentLabel;
    v3->_contentLabel = v11;

    -[MapsThemeLabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_contentLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MapsThemeLabel setNumberOfLines:](v3->_contentLabel, "setNumberOfLines:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("No recent searches message [NoQuery]"), CFSTR("localized string not found"), 0));
    -[MapsThemeLabel setText:](v3->_contentLabel, "setText:", v14);

    +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v3->_contentLabel, &stru_1011E7A78);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[MapsThemeLabel setTextColor:](v3->_contentLabel, "setTextColor:", v15);

    -[MapsThemeLabel setTextAlignment:](v3->_contentLabel, "setTextAlignment:", 1);
    -[MapsThemeLabel setAllowsDefaultTighteningForTruncation:](v3->_contentLabel, "setAllowsDefaultTighteningForTruncation:", 1);
    -[MapsThemeLabel setAdjustsFontSizeToFitWidth:](v3->_contentLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[MapsThemeLabel setMinimumScaleFactor:](v3->_contentLabel, "setMinimumScaleFactor:", 0.699999988);
    objc_msgSend(v5, "addSubview:", v3->_contentLabel);
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v16 = -[KeyboardAvoidingView initWithContentView:]([KeyboardAvoidingView alloc], "initWithContentView:", v5);
    -[NoRecentlySearchCollectionViewCell setKeyboardAvoidingView:](v3, "setKeyboardAvoidingView:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NoRecentlySearchCollectionViewCell keyboardAvoidingView](v3, "keyboardAvoidingView"));
    objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NoRecentlySearchCollectionViewCell contentView](v3, "contentView"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NoRecentlySearchCollectionViewCell keyboardAvoidingView](v3, "keyboardAvoidingView"));
    objc_msgSend(v18, "addSubview:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel firstBaselineAnchor](v3->_titleLabel, "firstBaselineAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21, 56.0));
    -[NoRecentlySearchCollectionViewCell setTitleLabelTopConstraint:](v3, "setTitleLabelTopConstraint:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel firstBaselineAnchor](v3->_contentLabel, "firstBaselineAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel bottomAnchor](v3->_titleLabel, "bottomAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:constant:", v24, 20.0));
    -[NoRecentlySearchCollectionViewCell setContentLabelTopConstraint:](v3, "setContentLabelTopConstraint:", v25);

    v62 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel leadingAnchor](v3->_titleLabel, "leadingAnchor"));
    v63 = v5;
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToAnchor:constant:", v61, 16.0));
    v65[0] = v60;
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel trailingAnchor](v3->_titleLabel, "trailingAnchor"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "constraintEqualToAnchor:constant:", v58, -16.0));
    v65[1] = v57;
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[NoRecentlySearchCollectionViewCell titleLabelTopConstraint](v3, "titleLabelTopConstraint"));
    v65[2] = v56;
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel leadingAnchor](v3->_contentLabel, "leadingAnchor"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel leadingAnchor](v3->_titleLabel, "leadingAnchor"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintEqualToAnchor:", v54));
    v65[3] = v53;
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel trailingAnchor](v3->_contentLabel, "trailingAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeLabel trailingAnchor](v3->_titleLabel, "trailingAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:", v51));
    v65[4] = v50;
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[NoRecentlySearchCollectionViewCell contentLabelTopConstraint](v3, "contentLabelTopConstraint"));
    v65[5] = v49;
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[NoRecentlySearchCollectionViewCell keyboardAvoidingView](v3, "keyboardAvoidingView"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "leadingAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[NoRecentlySearchCollectionViewCell contentView](v3, "contentView"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "leadingAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:", v45));
    v65[6] = v44;
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[NoRecentlySearchCollectionViewCell keyboardAvoidingView](v3, "keyboardAvoidingView"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "trailingAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[NoRecentlySearchCollectionViewCell contentView](v3, "contentView"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "trailingAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v40));
    v65[7] = v39;
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[NoRecentlySearchCollectionViewCell keyboardAvoidingView](v3, "keyboardAvoidingView"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "topAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[NoRecentlySearchCollectionViewCell contentView](v3, "contentView"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "topAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v27));
    v65[8] = v28;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[NoRecentlySearchCollectionViewCell keyboardAvoidingView](v3, "keyboardAvoidingView"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "bottomAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[NoRecentlySearchCollectionViewCell contentView](v3, "contentView"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "bottomAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v32));
    v65[9] = v33;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v65, 10));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v34);

    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v35, "addObserver:selector:name:object:", v3, "_contentSizeCategoryDidChange", UIContentSizeCategoryDidChangeNotification, 0);

  }
  return v3;
}

+ (id)identifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(a1, a2);
  return NSStringFromClass(v2);
}

- (void)clearHeightConstraint
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[NoRecentlySearchCollectionViewCell heightConstraint](self, "heightConstraint"));
  objc_msgSend(v2, "setActive:", 0);

}

- (void)_contentSizeCategoryDidChange
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NoRecentlySearchCollectionViewCell contentLabel](self, "contentLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "font"));
  objc_msgSend(v4, "_mapkit_scaledValueForValue:", 20.0);
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NoRecentlySearchCollectionViewCell contentLabelTopConstraint](self, "contentLabelTopConstraint"));
  objc_msgSend(v7, "setConstant:", v6);

  v12 = (id)objc_claimAutoreleasedReturnValue(-[NoRecentlySearchCollectionViewCell titleLabel](self, "titleLabel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "font"));
  objc_msgSend(v8, "_mapkit_scaledValueForValue:", 56.0);
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NoRecentlySearchCollectionViewCell titleLabelTopConstraint](self, "titleLabelTopConstraint"));
  objc_msgSend(v11, "setConstant:", v10);

}

- (void)setHeightConstraint:(double)a3 withPriority:(float)a4
{
  uint64_t v7;
  void *v8;
  void *v9;
  float v10;
  void *v11;
  float v12;
  float v13;
  void *v14;
  void *v15;
  void *v16;
  float v17;
  float v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  id v25;

  v7 = objc_claimAutoreleasedReturnValue(-[NoRecentlySearchCollectionViewCell heightConstraint](self, "heightConstraint"));
  if (v7)
  {
    v8 = (void *)v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NoRecentlySearchCollectionViewCell heightConstraint](self, "heightConstraint"));
    objc_msgSend(v9, "priority");
    if (v10 == a4)
    {

    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NoRecentlySearchCollectionViewCell heightConstraint](self, "heightConstraint"));
      objc_msgSend(v11, "priority");
      v13 = v12;

      if (a4 == 1000.0 || v13 == 1000.0)
        -[NoRecentlySearchCollectionViewCell clearHeightConstraint](self, "clearHeightConstraint");
    }
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NoRecentlySearchCollectionViewCell heightConstraint](self, "heightConstraint"));

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NoRecentlySearchCollectionViewCell heightConstraint](self, "heightConstraint"));
    objc_msgSend(v15, "setConstant:", a3);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NoRecentlySearchCollectionViewCell heightConstraint](self, "heightConstraint"));
    objc_msgSend(v16, "priority");
    v18 = v17;

    if (v18 == a4)
      return;
    v25 = (id)objc_claimAutoreleasedReturnValue(-[NoRecentlySearchCollectionViewCell heightConstraint](self, "heightConstraint"));
    *(float *)&v19 = a4;
    objc_msgSend(v25, "setPriority:", v19);
  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NoRecentlySearchCollectionViewCell contentView](self, "contentView"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "heightAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToConstant:", a3));
    -[NoRecentlySearchCollectionViewCell setHeightConstraint:](self, "setHeightConstraint:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[NoRecentlySearchCollectionViewCell heightConstraint](self, "heightConstraint"));
    *(float *)&v24 = a4;
    objc_msgSend(v23, "setPriority:", v24);

    v25 = (id)objc_claimAutoreleasedReturnValue(-[NoRecentlySearchCollectionViewCell heightConstraint](self, "heightConstraint"));
    objc_msgSend(v25, "setActive:", 1);
  }

}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NoRecentlySearchCollectionViewCell;
  -[NoRecentlySearchCollectionViewCell layoutSubviews](&v4, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NoRecentlySearchCollectionViewCell keyboardAvoidingView](self, "keyboardAvoidingView"));
  objc_msgSend(v3, "updateForKeyboardFrame");

}

- (KeyboardAvoidingView)keyboardAvoidingView
{
  return self->_keyboardAvoidingView;
}

- (void)setKeyboardAvoidingView:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardAvoidingView, a3);
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_heightConstraint, a3);
}

- (NSLayoutConstraint)titleLabelTopConstraint
{
  return self->_titleLabelTopConstraint;
}

- (void)setTitleLabelTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabelTopConstraint, a3);
}

- (NSLayoutConstraint)contentLabelTopConstraint
{
  return self->_contentLabelTopConstraint;
}

- (void)setContentLabelTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_contentLabelTopConstraint, a3);
}

- (MapsThemeLabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (MapsThemeLabel)contentLabel
{
  return self->_contentLabel;
}

- (void)setContentLabel:(id)a3
{
  objc_storeStrong((id *)&self->_contentLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_contentLabelTopConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelTopConstraint, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_keyboardAvoidingView, 0);
}

@end
