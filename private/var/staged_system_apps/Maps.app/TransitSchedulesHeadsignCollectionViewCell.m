@implementation TransitSchedulesHeadsignCollectionViewCell

- (TransitSchedulesHeadsignCollectionViewCell)init
{
  TransitSchedulesHeadsignCollectionViewCell *v2;
  TransitSchedulesHeadsignCollectionViewCell *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TransitSchedulesHeadsignCollectionViewCell;
  v2 = -[TransitSchedulesHeadsignCollectionViewCell init](&v5, "init");
  v3 = v2;
  if (v2)
    -[TransitSchedulesHeadsignCollectionViewCell configureViews](v2, "configureViews");
  return v3;
}

- (TransitSchedulesHeadsignCollectionViewCell)initWithFrame:(CGRect)a3
{
  TransitSchedulesHeadsignCollectionViewCell *v3;
  TransitSchedulesHeadsignCollectionViewCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TransitSchedulesHeadsignCollectionViewCell;
  v3 = -[TransitSchedulesHeadsignCollectionViewCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[TransitSchedulesHeadsignCollectionViewCell configureViews](v3, "configureViews");
  return v4;
}

- (void)configureViews
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  TransitSchedulesHeadsignCollectionViewCell *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  UILabel *v22;
  UILabel *headsignLabel;
  UILabel *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  Block_layout *v40;
  id v41;
  _QWORD v42[4];

  v3 = objc_alloc_init((Class)UIView);
  -[TransitSchedulesHeadsignCollectionViewCell setBackgroundView:](self, "setBackgroundView:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layer"));
  objc_msgSend(v5, "setMasksToBounds:", 1);

  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor systemGray3Color](UIColor, "systemGray3Color")));
  v7 = objc_msgSend(v6, "CGColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layer"));
  objc_msgSend(v8, "setBorderColor:", v7);

  v9 = self;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesHeadsignCollectionViewCell window](v9, "window"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "screen"));
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesHeadsignCollectionViewCell window](v9, "window"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "screen"));
    objc_msgSend(v13, "nativeScale");
    v15 = v14;

  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v12, "nativeScale");
    v15 = v16;
  }

  if (v15 <= 0.0)
    v17 = 1.0;
  else
    v17 = 1.0 / v15;

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layer"));
  objc_msgSend(v18, "setBorderWidth:", v17);

  objc_msgSend(v3, "_setContinuousCornerRadius:", 16.0);
  v41 = objc_alloc_init((Class)UIView);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
  objc_msgSend(v41, "setBackgroundColor:", v19);

  -[TransitSchedulesHeadsignCollectionViewCell setSelectedBackgroundView:](v9, "setSelectedBackgroundView:", v41);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "layer"));
  objc_msgSend(v20, "setCornerRadius:", 16.0);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesHeadsignCollectionViewCell contentView](v9, "contentView"));
  objc_msgSend(v21, "setAccessibilityIdentifier:", CFSTR("TransitSchedulesHeadsignCollectionViewCell"));
  v22 = (UILabel *)objc_alloc_init((Class)UILabel);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setTextAlignment:](v22, "setTextAlignment:", 1);
  -[UILabel setAccessibilityIdentifier:](v22, "setAccessibilityIdentifier:", CFSTR("TransitSchedulesHeadsignCollectionViewCellHeadsignLabel"));
  v40 = objc_retainBlock(&stru_1011E7A78);
  +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v22, v40);
  objc_msgSend(v21, "addSubview:", v22);
  headsignLabel = v9->_headsignLabel;
  v9->_headsignLabel = v22;
  v24 = v22;

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v24, "topAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "topAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:constant:", v38, 6.0));
  v42[0] = v36;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v24, "bottomAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "bottomAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:constant:", v34, -6.0));
  v42[1] = v33;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v24, "leadingAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "leadingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:constant:", v26, 12.0));
  v42[2] = v27;
  v37 = v3;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v24, "trailingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "trailingAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29, -12.0));
  v42[3] = v30;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v42, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v31);

  -[TransitSchedulesHeadsignCollectionViewCell setIsAccessibilityElement:](v9, "setIsAccessibilityElement:", 1);
  v32 = (unint64_t)-[TransitSchedulesHeadsignCollectionViewCell accessibilityTraits](v9, "accessibilityTraits");
  -[TransitSchedulesHeadsignCollectionViewCell setAccessibilityTraits:](v9, "setAccessibilityTraits:", UIAccessibilityTraitButton | v32);

}

- (void)setHeadsign:(id)a3
{
  NSString *v4;
  NSString *headsign;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_headsign, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    headsign = self->_headsign;
    self->_headsign = v4;

    -[UILabel setText:](self->_headsignLabel, "setText:", self->_headsign);
  }

}

+ (NSString)cellIdentifier
{
  return (NSString *)CFSTR("TransitSchedulesHeadsignCollectionCellIdentifier");
}

- (void)setSelected:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TransitSchedulesHeadsignCollectionViewCell;
  -[TransitSchedulesHeadsignCollectionViewCell setSelected:](&v4, "setSelected:", a3);
  -[TransitSchedulesHeadsignCollectionViewCell updateStyling](self, "updateStyling");
}

- (void)updateStyling
{
  uint64_t v3;
  id v4;

  if (-[TransitSchedulesHeadsignCollectionViewCell isSelected](self, "isSelected"))
    v3 = objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
  else
    v3 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v4 = (id)v3;
  -[UILabel setTextColor:](self->_headsignLabel, "setTextColor:", v3);

}

- (NSString)headsign
{
  return self->_headsign;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headsign, 0);
  objc_storeStrong((id *)&self->_headsignLabel, 0);
}

@end
