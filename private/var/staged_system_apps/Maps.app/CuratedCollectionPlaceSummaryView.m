@implementation CuratedCollectionPlaceSummaryView

- (CuratedCollectionPlaceSummaryView)initWithFrame:(CGRect)a3
{
  CuratedCollectionPlaceSummaryView *v3;
  CuratedCollectionPlaceSummaryView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CuratedCollectionPlaceSummaryView;
  v3 = -[CuratedCollectionPlaceSummaryView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CuratedCollectionPlaceSummaryView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("CuratedCollectionPlaceSummary"));
    -[CuratedCollectionPlaceSummaryView _createSubviews](v4, "_createSubviews");
    -[CuratedCollectionPlaceSummaryView _setupConstraints](v4, "_setupConstraints");
  }
  return v4;
}

- (void)configureWithModel:(id)a3
{
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
  id v19;

  v19 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionPlaceSummaryView titleLabel](self, "titleLabel"));
  objc_msgSend(v5, "setText:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "category"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "category"));
    objc_msgSend(v6, "addObject:", v8);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "distance"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "distance"));
    objc_msgSend(v6, "addObject:", v10);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "price"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "price"));
    objc_msgSend(v6, "addObject:", v12);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR(" · [List view details separator]"), CFSTR("localized string not found"), 0));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "componentsJoinedByString:", v14));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionPlaceSummaryView secondaryLabel](self, "secondaryLabel"));
  objc_msgSend(v16, "setText:", v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "hours"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionPlaceSummaryView tertiaryLabel](self, "tertiaryLabel"));
  objc_msgSend(v18, "setAttributedText:", v17);

}

- (void)_createSubviews
{
  void *v3;
  id v4;
  double y;
  double width;
  double height;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[CuratedCollectionPlaceSummaryView setBackgroundColor:](self, "setBackgroundColor:", v3);

  v4 = objc_alloc((Class)UILabel);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v8 = objc_msgSend(v4, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[CuratedCollectionPlaceSummaryView setTitleLabel:](self, "setTitleLabel:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionPlaceSummaryView titleLabel](self, "titleLabel"));
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  if (sub_1002A8AA0(self) == 5)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system20Semibold](UIFont, "system20Semibold"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionPlaceSummaryView titleLabel](self, "titleLabel"));
    objc_msgSend(v11, "setFont:", v10);

  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionPlaceSummaryView titleLabel](self, "titleLabel"));
    +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v10, &stru_1011E7BD8);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionPlaceSummaryView titleLabel](self, "titleLabel"));
  objc_msgSend(v12, "setNumberOfLines:", 0);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionPlaceSummaryView titleLabel](self, "titleLabel"));
  objc_msgSend(v13, "setAccessibilityIdentifier:", CFSTR("TitleLabel"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionPlaceSummaryView titleLabel](self, "titleLabel"));
  -[CuratedCollectionPlaceSummaryView addSubview:](self, "addSubview:", v14);

  v15 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[CuratedCollectionPlaceSummaryView setSecondaryLabel:](self, "setSecondaryLabel:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionPlaceSummaryView secondaryLabel](self, "secondaryLabel"));
  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  if (sub_1002A8AA0(self) == 5)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17Tall](UIFont, "system17Tall"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionPlaceSummaryView secondaryLabel](self, "secondaryLabel"));
    objc_msgSend(v18, "setFont:", v17);

  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionPlaceSummaryView secondaryLabel](self, "secondaryLabel"));
    +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v17, &stru_1011E7A78);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionPlaceSummaryView secondaryLabel](self, "secondaryLabel"));
  objc_msgSend(v20, "setTextColor:", v19);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionPlaceSummaryView secondaryLabel](self, "secondaryLabel"));
  objc_msgSend(v21, "setAccessibilityIdentifier:", CFSTR("SecondaryLabel"));

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionPlaceSummaryView secondaryLabel](self, "secondaryLabel"));
  -[CuratedCollectionPlaceSummaryView addSubview:](self, "addSubview:", v22);

  v23 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[CuratedCollectionPlaceSummaryView setTertiaryLabel:](self, "setTertiaryLabel:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionPlaceSummaryView tertiaryLabel](self, "tertiaryLabel"));
  objc_msgSend(v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  if (sub_1002A8AA0(self) == 5)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17Tall](UIFont, "system17Tall"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionPlaceSummaryView tertiaryLabel](self, "tertiaryLabel"));
    objc_msgSend(v26, "setFont:", v25);

  }
  else
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionPlaceSummaryView tertiaryLabel](self, "tertiaryLabel"));
    +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v25, &stru_1011E7A78);
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionPlaceSummaryView tertiaryLabel](self, "tertiaryLabel"));
  objc_msgSend(v28, "setTextColor:", v27);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionPlaceSummaryView tertiaryLabel](self, "tertiaryLabel"));
  objc_msgSend(v29, "setAccessibilityIdentifier:", CFSTR("TertiaryLabel"));

  v30 = (id)objc_claimAutoreleasedReturnValue(-[CuratedCollectionPlaceSummaryView tertiaryLabel](self, "tertiaryLabel"));
  -[CuratedCollectionPlaceSummaryView addSubview:](self, "addSubview:", v30);

}

- (void)_setupConstraints
{
  double v3;
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
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD v47[10];

  if (sub_1002A8AA0(self) == 5)
    v3 = 2.0;
  else
    v3 = 1.0;
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionPlaceSummaryView titleLabel](self, "titleLabel"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "topAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionPlaceSummaryView topAnchor](self, "topAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:", v44));
  v47[0] = v43;
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionPlaceSummaryView titleLabel](self, "titleLabel"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "leadingAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionPlaceSummaryView leadingAnchor](self, "leadingAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v40));
  v47[1] = v39;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionPlaceSummaryView titleLabel](self, "titleLabel"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "trailingAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionPlaceSummaryView trailingAnchor](self, "trailingAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v36));
  v47[2] = v35;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionPlaceSummaryView secondaryLabel](self, "secondaryLabel"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "topAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionPlaceSummaryView titleLabel](self, "titleLabel"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "bottomAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:constant:", v31, v3));
  v47[3] = v30;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionPlaceSummaryView secondaryLabel](self, "secondaryLabel"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "leadingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionPlaceSummaryView leadingAnchor](self, "leadingAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v27));
  v47[4] = v26;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionPlaceSummaryView secondaryLabel](self, "secondaryLabel"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "trailingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionPlaceSummaryView trailingAnchor](self, "trailingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v23));
  v47[5] = v22;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionPlaceSummaryView tertiaryLabel](self, "tertiaryLabel"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "topAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionPlaceSummaryView secondaryLabel](self, "secondaryLabel"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bottomAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:constant:", v18, 2.0));
  v47[6] = v17;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionPlaceSummaryView tertiaryLabel](self, "tertiaryLabel"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "leadingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionPlaceSummaryView leadingAnchor](self, "leadingAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v14));
  v47[7] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionPlaceSummaryView tertiaryLabel](self, "tertiaryLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionPlaceSummaryView trailingAnchor](self, "trailingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v7));
  v47[8] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionPlaceSummaryView tertiaryLabel](self, "tertiaryLabel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionPlaceSummaryView bottomAnchor](self, "bottomAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));
  v47[9] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v47, 10));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v13);

}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)secondaryLabel
{
  return self->_secondaryLabel;
}

- (void)setSecondaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryLabel, a3);
}

- (UILabel)tertiaryLabel
{
  return self->_tertiaryLabel;
}

- (void)setTertiaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_tertiaryLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tertiaryLabel, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
