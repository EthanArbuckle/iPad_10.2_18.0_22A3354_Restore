@implementation CuratedCollectionDescriptionTableViewCell

+ (double)estimatedCellHeight
{
  return 200.0;
}

- (CuratedCollectionDescriptionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CuratedCollectionDescriptionTableViewCell *v4;
  CuratedCollectionDescriptionTableViewCell *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CuratedCollectionDescriptionTableViewCell;
  v4 = -[MapsThemeTableViewCell initWithStyle:reuseIdentifier:](&v10, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[CuratedCollectionDescriptionTableViewCell setSelectionStyle:](v4, "setSelectionStyle:", 0);
    v6 = (objc_class *)objc_opt_class(v5);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[CuratedCollectionDescriptionTableViewCell setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", v8);

    -[CuratedCollectionDescriptionTableViewCell _createSubviews](v5, "_createSubviews");
    -[CuratedCollectionDescriptionTableViewCell _setupConstraints](v5, "_setupConstraints");
  }
  return v5;
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell delegate](self, "delegate"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "anyObject"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "key"));

  }
  else
  {
    v10 = 0;
  }

  if (objc_msgSend(v10, "keyCode") != (id)40)
    goto LABEL_7;
  if ((objc_msgSend(v10, "modifierFlags") & 0x100000) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell descriptionLabel](self, "descriptionLabel"));
    objc_msgSend(v11, "setExpanded:", -[CuratedCollectionDescriptionTableViewCell expanded](self, "expanded") ^ 1);

    if (objc_msgSend(v10, "modifierFlags"))
      goto LABEL_10;
LABEL_9:
    -[CuratedCollectionDescriptionTableViewCell _publisherLogoTapped](self, "_publisherLogoTapped");
    goto LABEL_10;
  }
  if (!objc_msgSend(v10, "modifierFlags"))
    goto LABEL_9;
LABEL_7:
  v12.receiver = self;
  v12.super_class = (Class)CuratedCollectionDescriptionTableViewCell;
  -[CuratedCollectionDescriptionTableViewCell pressesEnded:withEvent:](&v12, "pressesEnded:withEvent:", v6, v7);
LABEL_10:

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CuratedCollectionDescriptionTableViewCell;
  v4 = a3;
  -[MapsThemeTableViewCell traitCollectionDidChange:](&v9, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell traitCollection](self, "traitCollection", v9.receiver, v9.super_class));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredContentSizeCategory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));

  v8 = sub_1002A8950(v6, v7);
  if (v8)
    -[CuratedCollectionDescriptionTableViewCell _updateFonts](self, "_updateFonts");
}

- (void)_createSubviews
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  double y;
  double width;
  double height;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
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
  id v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  id v60;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[CuratedCollectionDescriptionTableViewCell setBackgroundColor:](self, "setBackgroundColor:", v3);

  v4 = objc_alloc_init((Class)UILayoutGuide);
  -[CuratedCollectionDescriptionTableViewCell setContentLayoutGuide:](self, "setContentLayoutGuide:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell contentView](self, "contentView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell contentLayoutGuide](self, "contentLayoutGuide"));
  objc_msgSend(v5, "addLayoutGuide:", v6);

  v7 = objc_alloc((Class)UIStackView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v11 = objc_msgSend(v7, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[CuratedCollectionDescriptionTableViewCell setStackView:](self, "setStackView:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell stackView](self, "stackView"));
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell stackView](self, "stackView"));
  objc_msgSend(v13, "setAxis:", 1);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell stackView](self, "stackView"));
  objc_msgSend(v14, "setDistribution:", 3);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell stackView](self, "stackView"));
  objc_msgSend(v15, "setAlignment:", 0);

  if (sub_1002A8AA0(self) == 5)
    v16 = 12.0;
  else
    v16 = 16.0;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell stackView](self, "stackView"));
  objc_msgSend(v17, "setSpacing:", v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell stackView](self, "stackView"));
  objc_msgSend(v18, "setAccessibilityIdentifier:", CFSTR("StackView"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell contentView](self, "contentView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell stackView](self, "stackView"));
  objc_msgSend(v19, "addSubview:", v20);

  v21 = objc_msgSend(objc_alloc((Class)MUExpandingLabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[CuratedCollectionDescriptionTableViewCell setDescriptionLabel:](self, "setDescriptionLabel:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell descriptionLabel](self, "descriptionLabel"));
  objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell descriptionLabel](self, "descriptionLabel"));
  objc_msgSend(v23, "setNumberOfLinesWhenCollapsed:", 3);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell descriptionLabel](self, "descriptionLabel"));
  objc_msgSend(v24, "setEditable:", 0);

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("[Curated Collections] Show More"), CFSTR("localized string not found"), 0));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell descriptionLabel](self, "descriptionLabel"));
  objc_msgSend(v27, "setShowMoreText:", v26);

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("[Curated Collections] Show Less"), CFSTR("localized string not found"), 0));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell descriptionLabel](self, "descriptionLabel"));
  objc_msgSend(v30, "setShowLessText:", v29);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell descriptionLabel](self, "descriptionLabel"));
  objc_msgSend(v31, "setAllowLessText:", 1);

  objc_initWeak(&location, self);
  objc_copyWeak(&v60, &location);
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell descriptionLabel](self, "descriptionLabel", _NSConcreteStackBlock, 3221225472, sub_10056E650, &unk_1011AD260));
  objc_msgSend(v32, "setLabelResizedBlock:", &v59);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell descriptionLabel](self, "descriptionLabel"));
  objc_msgSend(v33, "setAccessibilityIdentifier:", CFSTR("DescriptionLabel"));

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell stackView](self, "stackView"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell descriptionLabel](self, "descriptionLabel"));
  objc_msgSend(v34, "addArrangedSubview:", v35);

  v36 = objc_msgSend(objc_alloc((Class)UIStackView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  objc_msgSend(v36, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v36, "setAxis:", 0);
  objc_msgSend(v36, "setDistribution:", 0);
  objc_msgSend(v36, "setAlignment:", 3);
  objc_msgSend(v36, "setSpacing:", 8.0);
  objc_msgSend(v36, "setUserInteractionEnabled:", 1);
  objc_msgSend(v36, "setAccessibilityIdentifier:", CFSTR("AuthorImageStackView"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell stackView](self, "stackView"));
  objc_msgSend(v37, "addArrangedSubview:", v36);

  v38 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_publisherLogoTapped");
  -[CuratedCollectionDescriptionTableViewCell setPublisherTapGestureRecognizer:](self, "setPublisherTapGestureRecognizer:", v38);

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell publisherTapGestureRecognizer](self, "publisherTapGestureRecognizer"));
  objc_msgSend(v36, "addGestureRecognizer:", v39);

  v40 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[CuratedCollectionDescriptionTableViewCell setAuthorImageView:](self, "setAuthorImageView:", v40);

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell authorImageView](self, "authorImageView"));
  objc_msgSend(v41, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell authorImageView](self, "authorImageView"));
  objc_msgSend(v42, "setContentMode:", 2);

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell authorImageView](self, "authorImageView"));
  objc_msgSend(v43, "setClipsToBounds:", 1);

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell authorImageView](self, "authorImageView"));
  objc_msgSend(v44, "_setCornerRadius:", 15.0);

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell theme](self, "theme"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "imageBackgroundColor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell authorImageView](self, "authorImageView"));
  objc_msgSend(v47, "setBackgroundColor:", v46);

  v48 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell authorImageView](self, "authorImageView"));
  objc_msgSend(v48, "setAccessibilityIdentifier:", CFSTR("AuthorImageView"));

  v49 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell authorImageView](self, "authorImageView"));
  objc_msgSend(v36, "addArrangedSubview:", v49);

  v50 = objc_msgSend(objc_alloc((Class)UIStackView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  objc_msgSend(v50, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v50, "setAxis:", 1);
  objc_msgSend(v50, "setDistribution:", 3);
  objc_msgSend(v50, "setAlignment:", 0);
  objc_msgSend(v50, "setAccessibilityIdentifier:", CFSTR("LabelStackView"));
  objc_msgSend(v36, "addArrangedSubview:", v50);
  v51 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[CuratedCollectionDescriptionTableViewCell setAuthorLabel:](self, "setAuthorLabel:", v51);

  v52 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell authorLabel](self, "authorLabel"));
  objc_msgSend(v52, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v53 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell authorLabel](self, "authorLabel"));
  objc_msgSend(v53, "setAccessibilityIdentifier:", CFSTR("AuthorLabel"));

  v54 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell authorLabel](self, "authorLabel"));
  objc_msgSend(v50, "addArrangedSubview:", v54);

  v55 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[CuratedCollectionDescriptionTableViewCell setMetadataLabel:](self, "setMetadataLabel:", v55);

  v56 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell metadataLabel](self, "metadataLabel"));
  objc_msgSend(v56, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v57 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell metadataLabel](self, "metadataLabel"));
  objc_msgSend(v57, "setAccessibilityIdentifier:", CFSTR("MetadataLabel"));

  v58 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell metadataLabel](self, "metadataLabel"));
  objc_msgSend(v50, "addArrangedSubview:", v58);

  -[CuratedCollectionDescriptionTableViewCell _updateFonts](self, "_updateFonts");
  -[CuratedCollectionDescriptionTableViewCell _updateColorsAnimated:](self, "_updateColorsAnimated:", 0);

  objc_destroyWeak(&v60);
  objc_destroyWeak(&location);
}

- (void)_setupConstraints
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
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
  id v17;
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
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  _QWORD v56[10];

  v55 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell contentLayoutGuide](self, "contentLayoutGuide"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "topAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell contentView](self, "contentView"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "topAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:", v52));
  v56[0] = v51;
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell contentLayoutGuide](self, "contentLayoutGuide"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "leadingAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell contentView](self, "contentView"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "leadingAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:constant:", v47, 16.0));
  v56[1] = v46;
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell contentLayoutGuide](self, "contentLayoutGuide"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "trailingAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell contentView](self, "contentView"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "trailingAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:constant:", v42, -16.0));
  v56[2] = v41;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell contentLayoutGuide](self, "contentLayoutGuide"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "bottomAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell contentView](self, "contentView"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "bottomAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v37));
  v56[3] = v36;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell stackView](self, "stackView"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "topAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell contentLayoutGuide](self, "contentLayoutGuide"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "topAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v32));
  v56[4] = v31;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell stackView](self, "stackView"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "leadingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell contentLayoutGuide](self, "contentLayoutGuide"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "leadingAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v27));
  v56[5] = v26;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell stackView](self, "stackView"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "trailingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell contentLayoutGuide](self, "contentLayoutGuide"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "trailingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v22));
  v56[6] = v21;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell contentLayoutGuide](self, "contentLayoutGuide"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bottomAnchor"));
  v18 = v3;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell stackView](self, "stackView"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "bottomAnchor"));
  v5 = sub_1002A8AA0(self);
  v6 = 22.0;
  if (v5 == 5)
    v6 = 16.0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:constant:", v4, v6, v4));
  v56[7] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell authorImageView](self, "authorImageView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "widthAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToConstant:", 30.0));
  v56[8] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell authorImageView](self, "authorImageView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "heightAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell authorImageView](self, "authorImageView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "widthAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v14));
  v56[9] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v56, 10));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16);

}

- (void)configureWithModel:(id)a3
{
  id v4;
  id v5;
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
  _QWORD v18[4];
  id v19;
  id v20;
  id location;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell model](self, "model"));

  if (v5 != v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell authorImageView](self, "authorImageView"));
    objc_msgSend(v6, "setImage:", 0);

    -[CuratedCollectionDescriptionTableViewCell setModel:](self, "setModel:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell model](self, "model"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "collectionDescription"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell descriptionLabel](self, "descriptionLabel"));
    objc_msgSend(v9, "setAttributedText:", v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell model](self, "model"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "authorName"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell authorLabel](self, "authorLabel"));
    objc_msgSend(v12, "setText:", v11);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell model](self, "model"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "collectionMetadata"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell metadataLabel](self, "metadataLabel"));
    objc_msgSend(v15, "setText:", v14);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell authorImageView](self, "authorImageView"));
    objc_msgSend(v16, "setHidden:", 0);

    -[CuratedCollectionDescriptionTableViewCell _updateColorsAnimated:](self, "_updateColorsAnimated:", 0);
    objc_initWeak(&location, self);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell model](self, "model"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10056EDEC;
    v18[3] = &unk_1011BB5D0;
    objc_copyWeak(&v20, &location);
    v19 = v4;
    objc_msgSend(v17, "loadAuthorImageForSize:completion:", v18, 30.0, 30.0);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

}

- (void)_updateFonts
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v3 = sub_1002A8AA0(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17](UIFont, "system17"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell descriptionLabel](self, "descriptionLabel"));
  objc_msgSend(v5, "setFont:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17SemiBold](UIFont, "system17SemiBold"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell descriptionLabel](self, "descriptionLabel"));
  objc_msgSend(v7, "setShowMoreFont:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17SemiBold](UIFont, "system17SemiBold"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell descriptionLabel](self, "descriptionLabel"));
  objc_msgSend(v9, "setShowLessFont:", v8);

  if (v3 == 5)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system15Tall](UIFont, "system15Tall"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell authorLabel](self, "authorLabel"));
    objc_msgSend(v11, "setFont:", v10);

    v12 = objc_claimAutoreleasedReturnValue(+[UIFont system15Tall](UIFont, "system15Tall"));
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system15](UIFont, "system15"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell authorLabel](self, "authorLabel"));
    objc_msgSend(v14, "setFont:", v13);

    v12 = objc_claimAutoreleasedReturnValue(+[UIFont system15](UIFont, "system15"));
  }
  v16 = (id)v12;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell metadataLabel](self, "metadataLabel"));
  objc_msgSend(v15, "setFont:", v16);

}

- (void)_updateColorsAnimated:(BOOL)a3
{
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[4];
  BOOL v12;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10056F14C;
  v11[3] = &unk_1011BB5F0;
  v12 = a3;
  v4 = objc_retainBlock(v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell descriptionLabel](self, "descriptionLabel"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10056F184;
  v10[3] = &unk_1011AC860;
  v10[4] = self;
  ((void (*)(_QWORD *, void *, _QWORD *))v4[2])(v4, v5, v10);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell authorLabel](self, "authorLabel"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10056F2C4;
  v9[3] = &unk_1011AC860;
  v9[4] = self;
  ((void (*)(_QWORD *, void *, _QWORD *))v4[2])(v4, v6, v9);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell metadataLabel](self, "metadataLabel"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10056F33C;
  v8[3] = &unk_1011AC860;
  v8[4] = self;
  ((void (*)(_QWORD *, void *, _QWORD *))v4[2])(v4, v7, v8);

}

- (void)setAlwaysUseLightForegroundColors:(BOOL)a3
{
  -[CuratedCollectionDescriptionTableViewCell setAlwaysUseLightForegroundColors:animated:](self, "setAlwaysUseLightForegroundColors:animated:", a3, 0);
}

- (void)setAlwaysUseLightForegroundColors:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_alwaysUseLightForegroundColors != a3)
  {
    self->_alwaysUseLightForegroundColors = a3;
    -[CuratedCollectionDescriptionTableViewCell _updateColorsAnimated:](self, "_updateColorsAnimated:", a4);
  }
}

- (BOOL)expanded
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell descriptionLabel](self, "descriptionLabel"));
  v3 = objc_msgSend(v2, "isExpanded");

  return v3;
}

- (void)_descriptionLabelDidExpand
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  id WeakRetained;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell descriptionLabel](self, "descriptionLabel"));
  if (objc_msgSend(v3, "isExpanded"))
  {

  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionDescriptionTableViewCell descriptionLabel](self, "descriptionLabel"));
    v5 = objc_msgSend(v4, "isShowingExpanded");

    if ((v5 & 1) != 0)
      return;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "cellExpansionOccured:", self);

}

- (void)_publisherLogoTapped
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "cellPublisherLogoTapped:", self);

}

- (CuratedCollectionDescriptionTableViewCellDelegate)delegate
{
  return (CuratedCollectionDescriptionTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)alwaysUseLightForegroundColors
{
  return self->_alwaysUseLightForegroundColors;
}

- (CuratedCollectionDescriptionCellModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (UILayoutGuide)contentLayoutGuide
{
  return self->_contentLayoutGuide;
}

- (void)setContentLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_contentLayoutGuide, a3);
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (MUExpandingLabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionLabel, a3);
}

- (UIImageView)authorImageView
{
  return self->_authorImageView;
}

- (void)setAuthorImageView:(id)a3
{
  objc_storeStrong((id *)&self->_authorImageView, a3);
}

- (UITapGestureRecognizer)publisherTapGestureRecognizer
{
  return self->_publisherTapGestureRecognizer;
}

- (void)setPublisherTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_publisherTapGestureRecognizer, a3);
}

- (UILabel)authorLabel
{
  return self->_authorLabel;
}

- (void)setAuthorLabel:(id)a3
{
  objc_storeStrong((id *)&self->_authorLabel, a3);
}

- (UILabel)metadataLabel
{
  return self->_metadataLabel;
}

- (void)setMetadataLabel:(id)a3
{
  objc_storeStrong((id *)&self->_metadataLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataLabel, 0);
  objc_storeStrong((id *)&self->_authorLabel, 0);
  objc_storeStrong((id *)&self->_publisherTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_authorImageView, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_contentLayoutGuide, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
