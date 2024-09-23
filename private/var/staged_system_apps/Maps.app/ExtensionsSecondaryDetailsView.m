@implementation ExtensionsSecondaryDetailsView

- (ExtensionsSecondaryDetailsView)initWithCoder:(id)a3
{
  ExtensionsSecondaryDetailsView *v3;
  ExtensionsSecondaryDetailsView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ExtensionsSecondaryDetailsView;
  v3 = -[ExtensionsSecondaryDetailsView initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[ExtensionsSecondaryDetailsView _commonInit](v3, "_commonInit");
  return v4;
}

- (ExtensionsSecondaryDetailsView)initWithFrame:(CGRect)a3
{
  ExtensionsSecondaryDetailsView *v3;
  ExtensionsSecondaryDetailsView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ExtensionsSecondaryDetailsView;
  v3 = -[ExtensionsSecondaryDetailsView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[ExtensionsSecondaryDetailsView _commonInit](v3, "_commonInit");
  return v4;
}

- (id)_newLabelWithNumberOfLines:(int64_t)a3
{
  id v4;
  void *v5;

  v4 = objc_alloc_init((Class)UILabel);
  objc_msgSend(v4, "setNumberOfLines:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  objc_msgSend(v4, "setTextColor:", v5);

  +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v4, &stru_1011E7A78);
  return v4;
}

- (void)_commonInit
{
  void *v3;
  void *v4;
  UIStackView *v5;
  UIStackView *detailsStackView;
  UILabel *v7;
  UILabel *informationLabel;
  UILabel *v9;
  UILabel *disclaimerLabel;

  -[ExtensionsSecondaryDetailsView setLeftHairlineInset:](self, "setLeftHairlineInset:", 16.0);
  -[ExtensionsSecondaryDetailsView setRightHairlineInset:](self, "setRightHairlineInset:", 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsSecondaryDetailsView theme](self, "theme"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hairlineColor"));
  -[ExtensionsSecondaryDetailsView setHairlineColor:](self, "setHairlineColor:", v4);

  -[ExtensionsSecondaryDetailsView setTopHairlineHidden:](self, "setTopHairlineHidden:", 0);
  -[ExtensionsSecondaryDetailsView setBottomHairlineHidden:](self, "setBottomHairlineHidden:", 1);
  v5 = (UIStackView *)objc_alloc_init((Class)UIStackView);
  detailsStackView = self->_detailsStackView;
  self->_detailsStackView = v5;

  -[UIStackView setAxis:](self->_detailsStackView, "setAxis:", 1);
  -[UIStackView setSpacing:](self->_detailsStackView, "setSpacing:", 5.0);
  -[ExtensionsSecondaryDetailsView addSubview:](self, "addSubview:", self->_detailsStackView);
  v7 = -[ExtensionsSecondaryDetailsView _newLabelWithNumberOfLines:](self, "_newLabelWithNumberOfLines:", 0);
  informationLabel = self->_informationLabel;
  self->_informationLabel = v7;

  -[ExtensionsSecondaryDetailsView addSubview:](self, "addSubview:", self->_informationLabel);
  v9 = -[ExtensionsSecondaryDetailsView _newLabelWithNumberOfLines:](self, "_newLabelWithNumberOfLines:", 0);
  disclaimerLabel = self->_disclaimerLabel;
  self->_disclaimerLabel = v9;

  -[ExtensionsSecondaryDetailsView addSubview:](self, "addSubview:", self->_disclaimerLabel);
  -[ExtensionsSecondaryDetailsView _updateConstraints](self, "_updateConstraints");
}

- (void)setDetailEntries:(id)a3
{
  id v4;
  NSArray *latestEntries;
  NSArray *v6;
  NSArray *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  _BOOL4 v19;
  _BOOL4 v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id obj;
  uint64_t v37;
  ExtensionsSecondaryDetailsView *v38;
  id v39;
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
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD v64[7];
  _BYTE v65[128];
  _BYTE v66[128];

  v4 = a3;
  latestEntries = self->_latestEntries;
  if (!latestEntries || (-[NSArray isEqual:](latestEntries, "isEqual:", v4) & 1) == 0)
  {
    v6 = (NSArray *)objc_msgSend(v4, "copy");
    v7 = self->_latestEntries;
    self->_latestEntries = v6;

    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView arrangedSubviews](self->_detailsStackView, "arrangedSubviews"));
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v61;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v61 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)i);
          -[UIStackView removeArrangedSubview:](self->_detailsStackView, "removeArrangedSubview:", v13);
          objc_msgSend(v13, "removeFromSuperview");
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
      }
      while (v10);
    }

    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v35 = v4;
    obj = v4;
    v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
    if (v39)
    {
      v37 = *(_QWORD *)v57;
      v38 = self;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v57 != v37)
            objc_enumerationMutation(obj);
          v55 = v14;
          v15 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v14);
          v16 = objc_alloc_init((Class)UIView);
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
          v18 = objc_msgSend(v17, "userInterfaceLayoutDirection");
          v19 = v18 != 0;
          v20 = v18 == 0;

          v21 = -[ExtensionsSecondaryDetailsView _newLabelWithNumberOfLines:](self, "_newLabelWithNumberOfLines:", 1);
          objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "title"));
          objc_msgSend(v21, "setText:", v22);

          objc_msgSend(v21, "setTextAlignment:", 2 * v19);
          objc_msgSend(v16, "addSubview:", v21);
          v23 = -[ExtensionsSecondaryDetailsView _newLabelWithNumberOfLines:](self, "_newLabelWithNumberOfLines:", 1);
          objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "details"));
          objc_msgSend(v23, "setText:", v24);

          objc_msgSend(v23, "setTextAlignment:", 2 * v20);
          objc_msgSend(v16, "addSubview:", v23);
          LODWORD(v25) = 1144733696;
          objc_msgSend(v21, "setContentCompressionResistancePriority:forAxis:", 0, v25);
          LODWORD(v26) = 1144750080;
          objc_msgSend(v23, "setContentCompressionResistancePriority:forAxis:", 0, v26);
          v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "topAnchor"));
          v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "topAnchor"));
          v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToAnchor:", v53));
          v64[0] = v52;
          v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "leadingAnchor"));
          v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "leadingAnchor"));
          v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:", v50));
          v64[1] = v49;
          v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "bottomAnchor"));
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bottomAnchor"));
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:", v46));
          v64[2] = v45;
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "trailingAnchor"));
          v47 = v16;
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "trailingAnchor"));
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:", v43));
          v64[3] = v42;
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "bottomAnchor"));
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bottomAnchor"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v40));
          v64[4] = v27;
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "firstBaselineAnchor"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "firstBaselineAnchor"));
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v29));
          v64[5] = v30;
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "trailingAnchor"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "leadingAnchor"));
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintLessThanOrEqualToAnchor:", v32));
          v64[6] = v33;
          v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v64, 7));
          +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v34);

          self = v38;
          -[UIStackView addArrangedSubview:](v38->_detailsStackView, "addArrangedSubview:", v47);

          v14 = v55 + 1;
        }
        while (v39 != (id)(v55 + 1));
        v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
      }
      while (v39);
    }

    -[ExtensionsSecondaryDetailsView _updateConstraints](self, "_updateConstraints");
    v4 = v35;
  }

}

- (void)setDisclaimerLabel:(id)a3
{
  objc_storeStrong((id *)&self->_disclaimerLabel, a3);
  -[ExtensionsSecondaryDetailsView _updateConstraints](self, "_updateConstraints");
}

- (void)setInformationLabel:(id)a3
{
  objc_storeStrong((id *)&self->_informationLabel, a3);
  -[ExtensionsSecondaryDetailsView _updateConstraints](self, "_updateConstraints");
}

- (void)_updateConstraints
{
  NSArray *constraints;
  void *v4;
  id v5;
  void *v6;
  id v7;
  NSUInteger v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSArray *v26;
  NSArray *v27;
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
  void *v47;
  void *v48;
  void *v49;
  _QWORD v50[10];

  constraints = self->_constraints;
  if (constraints && -[NSArray count](constraints, "count"))
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", self->_constraints);
  -[ExtensionsSecondaryDetailsView setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_informationLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_detailsStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_disclaimerLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_informationLabel, "text"));
  v5 = objc_msgSend(v4, "length");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_disclaimerLabel, "text"));
  v7 = objc_msgSend(v6, "length");

  v8 = -[NSArray count](self->_latestEntries, "count");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_disclaimerLabel, "topAnchor"));
  v49 = v9;
  v10 = objc_claimAutoreleasedReturnValue(-[ExtensionsSecondaryDetailsView topAnchor](self, "topAnchor"));
  v48 = (void *)v10;
  v11 = 41.0;
  if (v5)
  {
    v12 = 20.0;
  }
  else
  {
    v11 = 0.0;
    v12 = 0.0;
  }
  v13 = 5.0;
  if (v8)
  {
    v14 = 20.0;
  }
  else
  {
    v13 = 0.0;
    v14 = 0.0;
  }
  if (v8)
    v15 = v11;
  else
    v15 = v12;
  if (v7)
    v16 = 20.0;
  else
    v16 = 0.0;
  if (v7)
    v17 = v13;
  else
    v17 = v14;
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10, v16));
  v50[0] = v47;
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_disclaimerLabel, "leadingAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsSecondaryDetailsView leadingAnchor](self, "leadingAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:constant:", v45, 16.0));
  v50[1] = v44;
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsSecondaryDetailsView trailingAnchor](self, "trailingAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_disclaimerLabel, "trailingAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:constant:", v42, 16.0));
  v50[2] = v41;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](self->_detailsStackView, "topAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_disclaimerLabel, "bottomAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:constant:", v39, v17));
  v50[3] = v38;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](self->_detailsStackView, "leadingAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsSecondaryDetailsView leadingAnchor](self, "leadingAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:constant:", v36, 16.0));
  v50[4] = v35;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsSecondaryDetailsView trailingAnchor](self, "trailingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](self->_detailsStackView, "trailingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:constant:", v33, 16.0));
  v50[5] = v32;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_informationLabel, "topAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](self->_detailsStackView, "bottomAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:constant:", v30, v15));
  v50[6] = v29;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_informationLabel, "leadingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsSecondaryDetailsView leadingAnchor](self, "leadingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:constant:", v18, 16.0));
  v50[7] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsSecondaryDetailsView trailingAnchor](self, "trailingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_informationLabel, "trailingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21, 16.0));
  v50[8] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ExtensionsSecondaryDetailsView bottomAnchor](self, "bottomAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_informationLabel, "bottomAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:constant:", v24, 20.0));
  v50[9] = v25;
  v26 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v50, 10));
  v27 = self->_constraints;
  self->_constraints = v26;

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", self->_constraints);
}

- (UILabel)disclaimerLabel
{
  return self->_disclaimerLabel;
}

- (UILabel)informationLabel
{
  return self->_informationLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_informationLabel, 0);
  objc_storeStrong((id *)&self->_disclaimerLabel, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_detailsStackView, 0);
  objc_storeStrong((id *)&self->_latestEntries, 0);
}

@end
