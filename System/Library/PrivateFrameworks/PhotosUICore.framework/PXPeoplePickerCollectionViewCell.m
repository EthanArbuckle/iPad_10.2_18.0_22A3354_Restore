@implementation PXPeoplePickerCollectionViewCell

- (PXPeoplePickerCollectionViewCell)initWithFrame:(CGRect)a3
{
  PXPeoplePickerCollectionViewCell *v3;
  PXPeoplePickerCollectionViewCell *v4;
  void *v5;
  UIImageView *v6;
  UIImageView *imageView;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  UIImageView *v15;
  UIImageView *badgeView;
  UILabel *v17;
  UILabel *nameLabel;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  UIImageView *v23;
  UIImageView *favoriteBadgeView;
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
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  objc_super v91;
  _QWORD v92[9];
  _QWORD v93[13];

  v93[11] = *MEMORY[0x1E0C80C00];
  v91.receiver = self;
  v91.super_class = (Class)PXPeoplePickerCollectionViewCell;
  v3 = -[PXPeoplePickerCollectionViewCell initWithFrame:](&v91, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PXPeoplePickerCollectionViewCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    imageView = v4->_imageView;
    v4->_imageView = v6;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v4->_imageView, "setContentMode:", 1);
    -[UIImageView layer](v4->_imageView, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMasksToBounds:", 1);

    objc_msgSend(v5, "addSubview:", v4->_imageView);
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 3);
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("checkmark.circle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = (void *)v9;
    objc_msgSend(v10, "imageWithSymbolConfiguration:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "px_tintedCircularImageWithColor:backgroundColor:", v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v15 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    badgeView = v4->_badgeView;
    v4->_badgeView = v15;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_badgeView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v88 = (void *)v14;
    -[UIImageView setImage:](v4->_badgeView, "setImage:", v14);
    -[UIImageView setHidden:](v4->_badgeView, "setHidden:", 1);
    objc_msgSend(v5, "addSubview:", v4->_badgeView);
    v17 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    nameLabel = v4->_nameLabel;
    v4->_nameLabel = v17;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_nameLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAdjustsFontForContentSizeCategory:](v4->_nameLabel, "setAdjustsFontForContentSizeCategory:", 1);
    v90 = v5;
    objc_msgSend(v5, "addSubview:", v4->_nameLabel);
    if (+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled"))
    {
      objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:weight:", *MEMORY[0x1E0DC4A88], *MEMORY[0x1E0DC1420]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v4->_nameLabel, "setFont:", v19);

      -[UILabel setTextAlignment:](v4->_nameLabel, "setTextAlignment:", 4);
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v4->_nameLabel, "setTextColor:", v20);

      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("heart.fill"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", 16.0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "imageWithSymbolConfiguration:", v22);
      v82 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
      favoriteBadgeView = v4->_favoriteBadgeView;
      v4->_favoriteBadgeView = v23;

      -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_favoriteBadgeView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIImageView setImage:](v4->_favoriteBadgeView, "setImage:", v82);
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setTintColor:](v4->_favoriteBadgeView, "setTintColor:", v25);

      -[UIImageView setHidden:](v4->_favoriteBadgeView, "setHidden:", 1);
      objc_msgSend(v5, "addSubview:", v4->_favoriteBadgeView);
      v66 = (void *)MEMORY[0x1E0CB3718];
      -[UIImageView topAnchor](v4->_imageView, "topAnchor");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "topAnchor");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "constraintEqualToAnchor:constant:", v85, 5.0);
      v67 = objc_claimAutoreleasedReturnValue();
      v93[0] = v67;
      -[UIImageView leadingAnchor](v4->_imageView, "leadingAnchor");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "leadingAnchor");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "constraintEqualToAnchor:constant:", 5.0);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v93[1] = v86;
      -[UIImageView trailingAnchor](v4->_imageView, "trailingAnchor");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "trailingAnchor");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "constraintEqualToAnchor:constant:", -5.0);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v93[2] = v83;
      -[UIImageView bottomAnchor](v4->_imageView, "bottomAnchor");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bottomAnchor");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "constraintEqualToAnchor:constant:", -5.0);
      v63 = objc_claimAutoreleasedReturnValue();
      v93[3] = v63;
      -[UIImageView trailingAnchor](v4->_favoriteBadgeView, "trailingAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "trailingAnchor");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = v26;
      objc_msgSend(v26, "constraintEqualToAnchor:constant:", -16.0);
      v62 = objc_claimAutoreleasedReturnValue();
      v93[4] = v62;
      -[UIImageView topAnchor](v4->_favoriteBadgeView, "topAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "topAnchor");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = v27;
      objc_msgSend(v27, "constraintEqualToAnchor:constant:", 16.0);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v93[5] = v75;
      -[UIImageView trailingAnchor](v4->_badgeView, "trailingAnchor");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "trailingAnchor");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "constraintEqualToAnchor:constant:", -16.0);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v93[6] = v72;
      -[UIImageView bottomAnchor](v4->_badgeView, "bottomAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bottomAnchor");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "constraintEqualToAnchor:constant:", -16.0);
      v60 = objc_claimAutoreleasedReturnValue();
      v93[7] = v60;
      -[UILabel bottomAnchor](v4->_nameLabel, "bottomAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bottomAnchor");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = v29;
      objc_msgSend(v29, "constraintEqualToAnchor:constant:", -16.0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v93[8] = v30;
      -[UILabel leadingAnchor](v4->_nameLabel, "leadingAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "leadingAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32, 16.0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v93[9] = v33;
      -[UILabel trailingAnchor](v4->_nameLabel, "trailingAnchor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v28;
      objc_msgSend(v90, "trailingAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "constraintEqualToAnchor:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v93[10] = v37;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v93, 11);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "activateConstraints:", v38);

      v39 = (void *)v62;
      v40 = (void *)v63;

      v41 = (void *)v60;
      v42 = v61;

      v43 = v64;
      v44 = v65;

      v45 = (void *)v67;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v4->_nameLabel, "setFont:", v46);

      -[UILabel setTextAlignment:](v4->_nameLabel, "setTextAlignment:", 1);
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v4->_nameLabel, "setTextColor:", v47);

      v68 = (void *)MEMORY[0x1E0CB3718];
      -[UIImageView topAnchor](v4->_imageView, "topAnchor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "topAnchor");
      v82 = v48;
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "constraintEqualToAnchor:constant:", 5.0);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v92[0] = v85;
      -[UIImageView leadingAnchor](v4->_imageView, "leadingAnchor");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "leadingAnchor");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "constraintEqualToAnchor:constant:", v44, 5.0);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v92[1] = v87;
      -[UIImageView trailingAnchor](v4->_imageView, "trailingAnchor");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "trailingAnchor");
      v86 = v49;
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "constraintEqualToAnchor:constant:", v73, -5.0);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v92[2] = v84;
      -[UIImageView bottomAnchor](v4->_imageView, "bottomAnchor");
      v50 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "bottomAnchor");
      v51 = objc_claimAutoreleasedReturnValue();
      v83 = (void *)v50;
      v52 = (void *)v50;
      v43 = (void *)v51;
      objc_msgSend(v52, "constraintEqualToAnchor:constant:", v51, -5.0);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v92[3] = v81;
      -[UIImageView trailingAnchor](v4->_badgeView, "trailingAnchor");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "trailingAnchor");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "constraintEqualToAnchor:");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v92[4] = v79;
      -[UIImageView bottomAnchor](v4->_badgeView, "bottomAnchor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView bottomAnchor](v4->_imageView, "bottomAnchor");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "constraintEqualToAnchor:constant:", -5.0);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v92[5] = v77;
      -[UILabel topAnchor](v4->_nameLabel, "topAnchor");
      v53 = objc_claimAutoreleasedReturnValue();
      -[UIImageView bottomAnchor](v4->_imageView, "bottomAnchor");
      v54 = objc_claimAutoreleasedReturnValue();
      v75 = (void *)v53;
      v55 = (void *)v53;
      v42 = (void *)v54;
      objc_msgSend(v55, "constraintEqualToAnchor:constant:", v54, 5.0);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v92[6] = v74;
      -[UILabel leadingAnchor](v4->_nameLabel, "leadingAnchor");
      v56 = objc_claimAutoreleasedReturnValue();
      -[UIImageView leadingAnchor](v4->_imageView, "leadingAnchor");
      v57 = objc_claimAutoreleasedReturnValue();
      v72 = (void *)v56;
      v58 = (void *)v56;
      v35 = (void *)v57;
      objc_msgSend(v58, "constraintEqualToAnchor:", v57);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v92[7] = v71;
      -[UILabel trailingAnchor](v4->_nameLabel, "trailingAnchor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView trailingAnchor](v4->_imageView, "trailingAnchor");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "constraintEqualToAnchor:");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v92[8] = v69;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v92, 9);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "activateConstraints:", v30);
    }

  }
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PXPeoplePickerCollectionViewCell;
  -[PXPeoplePickerCollectionViewCell layoutSubviews](&v12, sel_layoutSubviews);
  -[PXPeoplePickerCollectionViewCell imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled"))
  {
    v4 = *MEMORY[0x1E0CD2A68];
    objc_msgSend(v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCornerCurve:", v4);

    +[PXLemonadePeopleCellSpecsConstants cornerRadius](PXLemonadePeopleCellSpecsConstants, "cornerRadius");
    v7 = v6;
    objc_msgSend(v3, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCornerRadius:", v7);
  }
  else
  {
    -[PXPeoplePickerCollectionViewCell contentView](self, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frame");
    v10 = v9 * 0.5 + -5.0;
    objc_msgSend(v3, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCornerRadius:", v10);

  }
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPeoplePickerCollectionViewCell;
  -[PXPeoplePickerCollectionViewCell prepareForReuse](&v3, sel_prepareForReuse);
  -[PXPeoplePickerCollectionViewCell setDisabled:](self, "setDisabled:", 0);
  -[PXPeoplePickerCollectionViewCell setSelected:](self, "setSelected:", 0);
  -[PXPeoplePickerCollectionViewCell setFavorite:](self, "setFavorite:", 0);
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
  -[PXPeoplePickerCollectionViewCell _updateContentAlpha](self, "_updateContentAlpha");
}

- (void)setSelected:(BOOL)a3
{
  _BOOL4 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PXPeoplePickerCollectionViewCell;
  -[PXPeoplePickerCollectionViewCell setSelected:](&v5, sel_setSelected_);
  -[UIImageView setHidden:](self->_badgeView, "setHidden:", !v3);
  -[PXPeoplePickerCollectionViewCell _updateContentAlpha](self, "_updateContentAlpha");
}

- (void)setFavorite:(BOOL)a3
{
  if (self->_favorite != a3)
  {
    self->_favorite = a3;
    -[UIImageView setHidden:](self->_favoriteBadgeView, "setHidden:", !a3);
  }
}

- (void)_updateContentAlpha
{
  double v3;
  void *v4;
  id v5;

  v3 = 0.5;
  if (!-[PXPeoplePickerCollectionViewCell isDisabled](self, "isDisabled"))
  {
    if (-[PXPeoplePickerCollectionViewCell isSelected](self, "isSelected"))
      v3 = 0.5;
    else
      v3 = 1.0;
  }
  -[PXPeoplePickerCollectionViewCell imageView](self, "imageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", v3);

  -[PXPeoplePickerCollectionViewCell nameLabel](self, "nameLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", v3);

}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (BOOL)isFavorite
{
  return self->_favorite;
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_favoriteBadgeView, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
}

@end
