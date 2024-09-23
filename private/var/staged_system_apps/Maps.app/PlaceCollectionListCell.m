@implementation PlaceCollectionListCell

- (PlaceCollectionListCell)initWithFrame:(CGRect)a3
{
  PlaceCollectionListCell *v3;
  PlaceCollectionListCell *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PlaceCollectionListCell;
  v3 = -[PlaceCollectionListCell initWithFrame:](&v9, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (objc_class *)objc_opt_class(v3);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[PlaceCollectionListCell setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", v7);

    -[PlaceCollectionListCell setupSubviews](v4, "setupSubviews");
    -[PlaceCollectionListCell setupConstraints](v4, "setupConstraints");
    -[PlaceCollectionListCell setupCornerRadius](v4, "setupCornerRadius");
  }
  return v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PlaceCollectionListCell;
  v4 = a3;
  -[PlaceCollectionListCell traitCollectionDidChange:](&v9, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory", v9.receiver, v9.super_class));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell traitCollection](self, "traitCollection"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "preferredContentSizeCategory"));

  if (v5 != v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell collectionItem](self, "collectionItem"));
    objc_msgSend(v8, "contentCategorySizeDidChange");

    -[PlaceCollectionListCell setTextMetadata](self, "setTextMetadata");
  }
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
  v8.super_class = (Class)PlaceCollectionListCell;
  -[PlaceCollectionListCell prepareForReuse](&v8, "prepareForReuse");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell collectionLabel](self, "collectionLabel"));
  objc_msgSend(v3, "setAttributedText:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell collectionSecondaryLabel](self, "collectionSecondaryLabel"));
  objc_msgSend(v4, "setAttributedText:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell collectionImageView](self, "collectionImageView"));
  objc_msgSend(v5, "setBackgroundColor:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell collectionImageView](self, "collectionImageView"));
  objc_msgSend(v6, "setImage:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell publisherLogoImageView](self, "publisherLogoImageView"));
  objc_msgSend(v7, "setImage:", 0);

}

- (void)setTextMetadata
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell collectionItem](self, "collectionItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "collectionTitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell collectionLabel](self, "collectionLabel"));
  objc_msgSend(v5, "setAttributedText:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell collectionItem](self, "collectionItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "secondaryCollectionTitle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell collectionSecondaryLabel](self, "collectionSecondaryLabel"));
  objc_msgSend(v8, "setAttributedText:", v7);

  v11 = (id)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell collectionItem](self, "collectionItem"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "backgroundColor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell collectionImageView](self, "collectionImageView"));
  objc_msgSend(v10, "setBackgroundColor:", v9);

}

- (void)configureWithModel:(id)a3
{
  -[PlaceCollectionListCell setCollectionItem:](self, "setCollectionItem:", a3);
  -[PlaceCollectionListCell setTextMetadata](self, "setTextMetadata");
  -[PlaceCollectionListCell setImageMetadata](self, "setImageMetadata");
}

- (void)setImageMetadata
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  PlaceCollectionListCell *v21;
  id v22;
  id location;
  uint8_t buf[4];
  void *v25;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  -[PlaceCollectionListCell setUpdateIdentifier:](self, "setUpdateIdentifier:", v3);
  objc_initWeak(&location, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell collectionItem](self, "collectionItem"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1004F34C8;
  v19[3] = &unk_1011B93F0;
  objc_copyWeak(&v22, &location);
  v5 = v3;
  v20 = v5;
  v21 = self;
  objc_msgSend(v4, "publisherIconImageWithCompletion:", v19);

  v6 = sub_1004316CC();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell collectionItem](self, "collectionItem"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "collectionTitle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "string"));
    *(_DWORD *)buf = 138412290;
    v25 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[⌛]Requesting image for : %@", buf, 0xCu);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell collectionItem](self, "collectionItem"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1004F3570;
  v15[3] = &unk_1011B9418;
  objc_copyWeak(&v18, &location);
  v15[4] = self;
  v13 = v5;
  v16 = v13;
  v14 = v11;
  v17 = v14;
  objc_msgSend(v12, "collectionImageForSize:onCompletion:", v15, 50.0, 50.0);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

- (void)setupSubviews
{
  -[PlaceCollectionListCell setupImageView](self, "setupImageView");
  -[PlaceCollectionListCell setupMetadata](self, "setupMetadata");
}

- (void)setupCornerRadius
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell collectionImageView](self, "collectionImageView"));
  objc_msgSend(v3, "_setContinuousCornerRadius:", 8.0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell collectionImageView](self, "collectionImageView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layer"));
  objc_msgSend(v5, "setMasksToBounds:", 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell publisherLogoImageView](self, "publisherLogoImageView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layer"));
  objc_msgSend(v7, "setMasksToBounds:", 1);

  v8 = (id)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell publisherLogoImageView](self, "publisherLogoImageView"));
  objc_msgSend(v8, "_setContinuousCornerRadius:", 5.0);

}

- (void)setupConstraints
{
  void *v3;
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
  void *v64;
  void *v65;
  void *v66;
  void *v67;
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
  _QWORD v86[18];

  v85 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell collectionImageView](self, "collectionImageView"));
  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "leadingAnchor"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell leftImageView](self, "leftImageView"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "leadingAnchor"));
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "constraintEqualToAnchor:", v82));
  v86[0] = v81;
  v80 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell collectionImageView](self, "collectionImageView"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "topAnchor"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell leftImageView](self, "leftImageView"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "topAnchor"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "constraintEqualToAnchor:", v77));
  v86[1] = v76;
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell collectionImageView](self, "collectionImageView"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "bottomAnchor"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell leftImageView](self, "leftImageView"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "bottomAnchor"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "constraintEqualToAnchor:", v72));
  v86[2] = v71;
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell collectionImageView](self, "collectionImageView"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "trailingAnchor"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell leftImageView](self, "leftImageView"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "trailingAnchor"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "constraintEqualToAnchor:", v67));
  v86[3] = v66;
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell publisherLogoImageView](self, "publisherLogoImageView"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "heightAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "constraintEqualToConstant:", 25.0));
  v86[4] = v63;
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell publisherLogoImageView](self, "publisherLogoImageView"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "widthAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "constraintEqualToConstant:", 25.0));
  v86[5] = v60;
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell publisherLogoImageView](self, "publisherLogoImageView"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "bottomAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell collectionImageView](self, "collectionImageView"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "bottomAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToAnchor:constant:", v56, 5.0));
  v86[6] = v55;
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell publisherLogoImageView](self, "publisherLogoImageView"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "trailingAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell collectionImageView](self, "collectionImageView"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "trailingAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:constant:", v51, 5.0));
  v86[7] = v50;
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell leftImageView](self, "leftImageView"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "heightAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToConstant:", 50.0));
  v86[8] = v47;
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell leftImageView](self, "leftImageView"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "widthAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToConstant:", 50.0));
  v86[9] = v44;
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell leftImageView](self, "leftImageView"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "leadingAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell contentView](self, "contentView"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "leadingAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v40));
  v86[10] = v39;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell leftImageView](self, "leftImageView"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "centerYAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell collectionLabelStackView](self, "collectionLabelStackView"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "centerYAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v35));
  v86[11] = v34;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell collectionLabelStackView](self, "collectionLabelStackView"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "leadingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell publisherLogoImageView](self, "publisherLogoImageView"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "trailingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:constant:", v30, 10.0));
  v86[12] = v29;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell collectionLabelStackView](self, "collectionLabelStackView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "trailingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell contentView](self, "contentView"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "trailingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:constant:", v25, -16.0));
  v86[13] = v24;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell contentView](self, "contentView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "topAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell collectionLabelStackView](self, "collectionLabelStackView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "topAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintLessThanOrEqualToAnchor:constant:", v20, -16.0));
  v86[14] = v19;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell contentView](self, "contentView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "topAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell leftImageView](self, "leftImageView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "topAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintLessThanOrEqualToAnchor:constant:", v15, -16.0));
  v86[15] = v14;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell contentView](self, "contentView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bottomAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell collectionLabelStackView](self, "collectionLabelStackView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bottomAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintGreaterThanOrEqualToAnchor:constant:", v5, 16.0));
  v86[16] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell contentView](self, "contentView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell leftImageView](self, "leftImageView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintGreaterThanOrEqualToAnchor:constant:", v10, 16.0));
  v86[17] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v86, 18));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (void)setupImageView
{
  id v3;
  double y;
  double width;
  double height;
  id v7;
  void *v8;
  void *v9;
  id v10;
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
  id v25;

  v3 = objc_alloc((Class)UIView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[PlaceCollectionListCell setLeftImageView:](self, "setLeftImageView:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell leftImageView](self, "leftImageView"));
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell leftImageView](self, "leftImageView"));
  objc_msgSend(v9, "setAccessibilityIdentifier:", CFSTR("LeftImageView"));

  v10 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[PlaceCollectionListCell setCollectionImageView:](self, "setCollectionImageView:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell collectionImageView](self, "collectionImageView"));
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell collectionImageView](self, "collectionImageView"));
  objc_msgSend(v12, "setAccessibilityIgnoresInvertColors:", 1);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell collectionImageView](self, "collectionImageView"));
  objc_msgSend(v13, "setAccessibilityIdentifier:", CFSTR("CollectionImage"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell collectionImageView](self, "collectionImageView"));
  objc_msgSend(v14, "setContentMode:", 1);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell leftImageView](self, "leftImageView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell collectionImageView](self, "collectionImageView"));
  objc_msgSend(v15, "addSubview:", v16);

  v17 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[PlaceCollectionListCell setPublisherLogoImageView:](self, "setPublisherLogoImageView:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell publisherLogoImageView](self, "publisherLogoImageView"));
  objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell publisherLogoImageView](self, "publisherLogoImageView"));
  objc_msgSend(v19, "setAccessibilityIgnoresInvertColors:", 1);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell publisherLogoImageView](self, "publisherLogoImageView"));
  objc_msgSend(v20, "setAccessibilityIdentifier:", CFSTR("PublisherLogoImage"));

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell publisherLogoImageView](self, "publisherLogoImageView"));
  objc_msgSend(v21, "setContentMode:", 1);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell leftImageView](self, "leftImageView"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell publisherLogoImageView](self, "publisherLogoImageView"));
  objc_msgSend(v22, "addSubview:", v23);

  v25 = (id)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell contentView](self, "contentView"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell leftImageView](self, "leftImageView"));
  objc_msgSend(v25, "addSubview:", v24);

}

- (void)setupMetadata
{
  id v3;
  double y;
  double width;
  double height;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v3 = objc_alloc((Class)UIStackView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = objc_msgSend(v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[PlaceCollectionListCell setCollectionLabelStackView:](self, "setCollectionLabelStackView:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell collectionLabelStackView](self, "collectionLabelStackView"));
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell collectionLabelStackView](self, "collectionLabelStackView"));
  objc_msgSend(v9, "setAxis:", 1);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell collectionLabelStackView](self, "collectionLabelStackView"));
  objc_msgSend(v10, "setDistribution:", 4);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell collectionLabelStackView](self, "collectionLabelStackView"));
  objc_msgSend(v11, "setSpacing:", 2.0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell collectionLabelStackView](self, "collectionLabelStackView"));
  objc_msgSend(v12, "setAccessibilityIdentifier:", CFSTR("CollectionLabelStack"));

  v13 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[PlaceCollectionListCell setCollectionLabel:](self, "setCollectionLabel:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell collectionLabel](self, "collectionLabel"));
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell collectionLabel](self, "collectionLabel"));
  objc_msgSend(v15, "setNumberOfLines:", 0);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell collectionLabel](self, "collectionLabel"));
  objc_msgSend(v16, "setAccessibilityIdentifier:", CFSTR("CollectionLabel"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell collectionLabelStackView](self, "collectionLabelStackView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell collectionLabel](self, "collectionLabel"));
  objc_msgSend(v17, "addArrangedSubview:", v18);

  v19 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[PlaceCollectionListCell setCollectionSecondaryLabel:](self, "setCollectionSecondaryLabel:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell collectionSecondaryLabel](self, "collectionSecondaryLabel"));
  objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell collectionSecondaryLabel](self, "collectionSecondaryLabel"));
  objc_msgSend(v21, "setNumberOfLines:", 0);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell collectionSecondaryLabel](self, "collectionSecondaryLabel"));
  objc_msgSend(v23, "setTextColor:", v22);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell collectionSecondaryLabel](self, "collectionSecondaryLabel"));
  objc_msgSend(v24, "setAccessibilityIdentifier:", CFSTR("CollectionSecondaryLabel"));

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell collectionLabelStackView](self, "collectionLabelStackView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell collectionSecondaryLabel](self, "collectionSecondaryLabel"));
  objc_msgSend(v25, "addArrangedSubview:", v26);

  v28 = (id)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell contentView](self, "contentView"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[PlaceCollectionListCell collectionLabelStackView](self, "collectionLabelStackView"));
  objc_msgSend(v28, "addSubview:", v27);

}

- (UIImageView)publisherLogoImageView
{
  return self->_publisherLogoImageView;
}

- (void)setPublisherLogoImageView:(id)a3
{
  objc_storeStrong((id *)&self->_publisherLogoImageView, a3);
}

- (UIImageView)collectionImageView
{
  return self->_collectionImageView;
}

- (void)setCollectionImageView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionImageView, a3);
}

- (UIView)leftImageView
{
  return self->_leftImageView;
}

- (void)setLeftImageView:(id)a3
{
  objc_storeStrong((id *)&self->_leftImageView, a3);
}

- (UILabel)collectionLabel
{
  return self->_collectionLabel;
}

- (void)setCollectionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_collectionLabel, a3);
}

- (UILabel)collectionSecondaryLabel
{
  return self->_collectionSecondaryLabel;
}

- (void)setCollectionSecondaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_collectionSecondaryLabel, a3);
}

- (UIStackView)collectionLabelStackView
{
  return self->_collectionLabelStackView;
}

- (void)setCollectionLabelStackView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionLabelStackView, a3);
}

- (NSUUID)updateIdentifier
{
  return self->_updateIdentifier;
}

- (void)setUpdateIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_updateIdentifier, a3);
}

- (MKPlaceCollectionViewModel)collectionItem
{
  return self->_collectionItem;
}

- (void)setCollectionItem:(id)a3
{
  objc_storeStrong((id *)&self->_collectionItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionItem, 0);
  objc_storeStrong((id *)&self->_updateIdentifier, 0);
  objc_storeStrong((id *)&self->_collectionLabelStackView, 0);
  objc_storeStrong((id *)&self->_collectionSecondaryLabel, 0);
  objc_storeStrong((id *)&self->_collectionLabel, 0);
  objc_storeStrong((id *)&self->_leftImageView, 0);
  objc_storeStrong((id *)&self->_collectionImageView, 0);
  objc_storeStrong((id *)&self->_publisherLogoImageView, 0);
}

@end
