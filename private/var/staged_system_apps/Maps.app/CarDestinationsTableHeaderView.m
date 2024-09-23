@implementation CarDestinationsTableHeaderView

- (CarDestinationsTableHeaderView)initWithReuseIdentifier:(id)a3
{
  CarDestinationsTableHeaderView *v3;
  MKVibrantLabel *v4;
  MKVibrantLabel *titleLabel;
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
  id v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;
  _QWORD v27[4];
  UIFontDescriptorTraitKey v28;
  void *v29;
  _QWORD v30[3];
  _QWORD v31[3];

  v26.receiver = self;
  v26.super_class = (Class)CarDestinationsTableHeaderView;
  v3 = -[CarDestinationsTableHeaderView initWithReuseIdentifier:](&v26, "initWithReuseIdentifier:", a3);
  if (v3)
  {
    v4 = (MKVibrantLabel *)objc_msgSend(objc_alloc((Class)MKVibrantLabel), "initWithStyle:", 1);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v4;

    -[MKVibrantLabel setAccessibilityIdentifier:](v3->_titleLabel, "setAccessibilityIdentifier:", CFSTR("TitleLabel"));
    -[MKVibrantLabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v30[0] = UIFontDescriptorFamilyAttribute;
    v30[1] = UIFontDescriptorSizeAttribute;
    v31[0] = CFSTR("SF Pro Text");
    v31[1] = &off_101275258;
    v30[2] = UIFontDescriptorTraitsAttribute;
    v28 = UIFontWeightTrait;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", UIFontWeightSemibold));
    v29 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1));
    v31[2] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v31, v30, 3));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor fontDescriptorWithFontAttributes:](UIFontDescriptor, "fontDescriptorWithFontAttributes:", v8));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v25, 10.0));
    -[MKVibrantLabel setFont:](v3->_titleLabel, "setFont:", v9);

    -[MKVibrantLabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 1);
    -[CarDestinationsTableHeaderView addSubview:](v3, "addSubview:", v3->_titleLabel);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MKVibrantLabel firstBaselineAnchor](v3->_titleLabel, "firstBaselineAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CarDestinationsTableHeaderView topAnchor](v3, "topAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:constant:", v23, 10.0));
    v27[0] = v22;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MKVibrantLabel leadingAnchor](v3->_titleLabel, "leadingAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarDestinationsTableHeaderView leadingAnchor](v3, "leadingAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:constant:", v10, -2.0));
    v27[1] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarDestinationsTableHeaderView trailingAnchor](v3, "trailingAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MKVibrantLabel trailingAnchor](v3->_titleLabel, "trailingAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v13));
    v27[2] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarDestinationsTableHeaderView bottomAnchor](v3, "bottomAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MKVibrantLabel lastBaselineAnchor](v3->_titleLabel, "lastBaselineAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, 7.0));
    v27[3] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 4));
    -[CarDestinationsTableHeaderView addConstraints:](v3, "addConstraints:", v18);

    v19 = objc_alloc_init((Class)UIView);
    -[CarDestinationsTableHeaderView setBackgroundView:](v3, "setBackgroundView:", v19);

  }
  return v3;
}

+ (id)reuseIdentifier
{
  return CFSTR("TableHeaderViewReuseIdentifier");
}

- (MKVibrantLabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
