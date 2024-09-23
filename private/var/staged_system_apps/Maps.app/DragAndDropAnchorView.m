@implementation DragAndDropAnchorView

- (DragAndDropAnchorView)initWithFrame:(CGRect)a3
{
  -[DragAndDropAnchorView doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return self;
}

- (DragAndDropAnchorView)initWithCoder:(id)a3
{
  -[DragAndDropAnchorView doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return self;
}

- (DragAndDropAnchorView)initWithDragAndDropMapItem:(id)a3 previewTraitCollection:(id)a4
{
  id v6;
  id v7;
  DragAndDropAnchorView *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  MKMapItem *mapItem;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)DragAndDropAnchorView;
  v8 = -[DragAndDropAnchorView initWithFrame:](&v16, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "presentationObject"));
    v10 = sub_1002A8AA0(v8);
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "resolvedMapItem"));
    v12 = (void *)v11;
    if (v10 == 5)
    {
      v13 = (void *)v11;
      if (!v11)
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "originalMapItem"));
      objc_storeStrong((id *)&v8->_mapItem, v13);
      if (!v12)

    }
    else
    {
      mapItem = v8->_mapItem;
      v8->_mapItem = (MKMapItem *)v11;
      v12 = mapItem;
    }

    objc_storeStrong((id *)&v8->_previewTraitCollection, a4);
    -[DragAndDropAnchorView addSubviews](v8, "addSubviews");
    -[DragAndDropAnchorView updateWithInitialObject:](v8, "updateWithInitialObject:", v9);

  }
  return v8;
}

- (void)addSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  id v8;
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
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
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
  double v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
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
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  _QWORD v106[11];
  _QWORD v107[3];
  _QWORD v108[4];

  v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (sub_1002A8AA0(self) == 5)
  {
    -[DragAndDropAnchorView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:", 5.0);
    -[DragAndDropAnchorView setClipsToBounds:](self, "setClipsToBounds:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    -[DragAndDropAnchorView setBackgroundColor:](self, "setBackgroundColor:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapItem _styleAttributes](self->_mapItem, "_styleAttributes"));
    -[UITraitCollection displayScale](self->_previewTraitCollection, "displayScale");
    v6 = v5;
    LOBYTE(v59) = (id)-[UITraitCollection userInterfaceStyle](self->_previewTraitCollection, "userInterfaceStyle") == (id)2;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKIconManager imageForStyle:size:forScale:format:transparent:transitMode:interactive:nightMode:](MKIconManager, "imageForStyle:size:forScale:format:transparent:transitMode:interactive:nightMode:", v4, 3, 0, 0, 0, 0, v6, v59));

    if (v7)
    {
      v8 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v7);
      -[DragAndDropAnchorView setImageView:](self, "setImageView:", v8);

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[DragAndDropAnchorView imageView](self, "imageView"));
      objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[DragAndDropAnchorView imageView](self, "imageView"));
      -[DragAndDropAnchorView addSubview:](self, "addSubview:", v10);

      v103 = (void *)objc_claimAutoreleasedReturnValue(-[DragAndDropAnchorView imageView](self, "imageView"));
      v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "leadingAnchor"));
      v98 = (void *)objc_claimAutoreleasedReturnValue(-[DragAndDropAnchorView leadingAnchor](self, "leadingAnchor"));
      v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "constraintEqualToAnchor:constant:", v98, 14.0));
      v108[0] = v96;
      v93 = (void *)objc_claimAutoreleasedReturnValue(-[DragAndDropAnchorView imageView](self, "imageView"));
      v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "centerYAnchor"));
      v87 = (void *)objc_claimAutoreleasedReturnValue(-[DragAndDropAnchorView centerYAnchor](self, "centerYAnchor"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "constraintEqualToAnchor:", v87));
      v108[1] = v11;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[DragAndDropAnchorView imageView](self, "imageView"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "heightAnchor"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToConstant:", 20.0));
      v108[2] = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[DragAndDropAnchorView imageView](self, "imageView"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "widthAnchor"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToConstant:", 20.0));
      v108[3] = v17;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v108, 4));
      objc_msgSend(v105, "addObjectsFromArray:", v18);

    }
  }
  v19 = objc_claimAutoreleasedReturnValue(-[DragAndDropAnchorView _effectiveTraitCollection](self, "_effectiveTraitCollection"));
  v20 = objc_alloc_init((Class)UILabel);
  -[DragAndDropAnchorView setTitleLabel:](self, "setTitleLabel:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[DragAndDropAnchorView titleLabel](self, "titleLabel"));
  objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[DragAndDropAnchorView titleLabel](self, "titleLabel"));
  objc_msgSend(v23, "setTextColor:", v22);

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system13SemiboldCompatibleWithTraitCollection:](UIFont, "system13SemiboldCompatibleWithTraitCollection:", v19));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[DragAndDropAnchorView titleLabel](self, "titleLabel"));
  objc_msgSend(v25, "setFont:", v24);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[DragAndDropAnchorView titleLabel](self, "titleLabel"));
  -[DragAndDropAnchorView addSubview:](self, "addSubview:", v26);

  if (sub_1002A8AA0(self) != 5)
  {
    v27 = objc_alloc_init((Class)UILabel);
    -[DragAndDropAnchorView setSubtitleLabel:](self, "setSubtitleLabel:", v27);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[DragAndDropAnchorView subtitleLabel](self, "subtitleLabel"));
    objc_msgSend(v28, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[DragAndDropAnchorView subtitleLabel](self, "subtitleLabel"));
    objc_msgSend(v30, "setTextColor:", v29);

    v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system13CompatibleWithTraitCollection:](UIFont, "system13CompatibleWithTraitCollection:", v19));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[DragAndDropAnchorView subtitleLabel](self, "subtitleLabel"));
    objc_msgSend(v32, "setFont:", v31);

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[DragAndDropAnchorView subtitleLabel](self, "subtitleLabel"));
    -[DragAndDropAnchorView addSubview:](self, "addSubview:", v33);

  }
  v104 = (void *)v19;
  if (sub_1002A8AA0(self) == 5)
  {
    v34 = (id)objc_claimAutoreleasedReturnValue(-[DragAndDropAnchorView titleLabel](self, "titleLabel"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "leadingAnchor"));
    v99 = objc_claimAutoreleasedReturnValue(-[DragAndDropAnchorView imageView](self, "imageView"));
    if (v99)
    {
      v97 = (void *)objc_claimAutoreleasedReturnValue(-[DragAndDropAnchorView imageView](self, "imageView"));
      v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "trailingAnchor"));
    }
    else
    {
      v36 = objc_claimAutoreleasedReturnValue(-[DragAndDropAnchorView leadingAnchor](self, "leadingAnchor"));
      v97 = (void *)v36;
    }
    v92 = (void *)objc_claimAutoreleasedReturnValue(-[DragAndDropAnchorView imageView](self, "imageView"));
    v95 = (void *)v36;
    v49 = 8.0;
    if (!v92)
      v49 = 14.0;
    v102 = v35;
    v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:constant:", v36, v49));
    v107[0] = v89;
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[DragAndDropAnchorView titleLabel](self, "titleLabel"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "trailingAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[DragAndDropAnchorView trailingAnchor](self, "trailingAnchor"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:constant:", v52, -14.0));
    v107[1] = v53;
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[DragAndDropAnchorView titleLabel](self, "titleLabel"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "centerYAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[DragAndDropAnchorView centerYAnchor](self, "centerYAnchor"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintEqualToAnchor:", v56));
    v107[2] = v57;
    v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v107, 3));
    objc_msgSend(v105, "addObjectsFromArray:", v58);

    v47 = (void *)v99;
    if (v99)
    {
      v48 = v104;

    }
    else
    {
      v48 = v104;
    }
  }
  else
  {
    v34 = objc_alloc_init((Class)UILayoutGuide);
    -[DragAndDropAnchorView addLayoutGuide:](self, "addLayoutGuide:", v34);
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "leadingAnchor"));
    v100 = objc_claimAutoreleasedReturnValue(-[DragAndDropAnchorView leadingAnchor](self, "leadingAnchor"));
    v102 = v37;
    v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:constant:", v100, 14.0));
    v106[0] = v97;
    v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "trailingAnchor"));
    v91 = (void *)objc_claimAutoreleasedReturnValue(-[DragAndDropAnchorView trailingAnchor](self, "trailingAnchor"));
    v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "constraintEqualToAnchor:constant:", v91, -14.0));
    v106[1] = v88;
    v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "topAnchor"));
    v85 = (void *)objc_claimAutoreleasedReturnValue(-[DragAndDropAnchorView topAnchor](self, "topAnchor"));
    v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "constraintEqualToAnchor:", v85));
    v106[2] = v84;
    v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "bottomAnchor"));
    v82 = (void *)objc_claimAutoreleasedReturnValue(-[DragAndDropAnchorView bottomAnchor](self, "bottomAnchor"));
    v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "constraintEqualToAnchor:", v82));
    v106[3] = v81;
    v80 = (void *)objc_claimAutoreleasedReturnValue(-[DragAndDropAnchorView titleLabel](self, "titleLabel"));
    v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "firstBaselineAnchor"));
    v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "topAnchor"));
    -[DragAndDropAnchorView titleLabelBaselineToTopConstant](self, "titleLabelBaselineToTopConstant");
    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "constraintEqualToAnchor:constant:", v78));
    v106[4] = v77;
    v76 = (void *)objc_claimAutoreleasedReturnValue(-[DragAndDropAnchorView titleLabel](self, "titleLabel"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "leadingAnchor"));
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "leadingAnchor"));
    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "constraintEqualToAnchor:", v74));
    v106[5] = v73;
    v72 = (void *)objc_claimAutoreleasedReturnValue(-[DragAndDropAnchorView titleLabel](self, "titleLabel"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "trailingAnchor"));
    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "trailingAnchor"));
    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "constraintEqualToAnchor:", v70));
    v106[6] = v69;
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[DragAndDropAnchorView subtitleLabel](self, "subtitleLabel"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "firstBaselineAnchor"));
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[DragAndDropAnchorView titleLabel](self, "titleLabel"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "lastBaselineAnchor"));
    -[DragAndDropAnchorView subtitleLabelBaselineToTitleLabelBaselineConstant](self, "subtitleLabelBaselineToTitleLabelBaselineConstant");
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintEqualToAnchor:constant:", v65));
    v106[7] = v64;
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[DragAndDropAnchorView subtitleLabel](self, "subtitleLabel"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "leadingAnchor"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "leadingAnchor"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToAnchor:", v61));
    v106[8] = v60;
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[DragAndDropAnchorView subtitleLabel](self, "subtitleLabel"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "trailingAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "trailingAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v40));
    v106[9] = v41;
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "bottomAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[DragAndDropAnchorView subtitleLabel](self, "subtitleLabel"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "lastBaselineAnchor"));
    -[DragAndDropAnchorView bottomToSubtitleLabelConstant](self, "bottomToSubtitleLabelConstant");
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:constant:", v44));
    v106[10] = v45;
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v106, 11));
    objc_msgSend(v105, "addObjectsFromArray:", v46);

    v47 = (void *)v100;
    v48 = v104;

  }
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v105);

}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  if (sub_1002A8AA0(self) == 5)
  {
    v3 = 32.0;
  }
  else
  {
    -[DragAndDropAnchorView titleLabelBaselineToTopConstant](self, "titleLabelBaselineToTopConstant");
    v5 = v4;
    -[DragAndDropAnchorView subtitleLabelBaselineToTitleLabelBaselineConstant](self, "subtitleLabelBaselineToTitleLabelBaselineConstant");
    v7 = v5 + v6;
    -[DragAndDropAnchorView bottomToSubtitleLabelConstant](self, "bottomToSubtitleLabelConstant");
    v3 = v7 + v8;
  }
  v9 = UIViewNoIntrinsicMetric;
  result.height = v3;
  result.width = v9;
  return result;
}

- (double)titleLabelBaselineToTopConstant
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DragAndDropAnchorView titleLabel](self, "titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "font"));
  objc_msgSend(v3, "_scaledValueForValue:", 22.0);
  v5 = v4;

  return v5;
}

- (double)subtitleLabelBaselineToTitleLabelBaselineConstant
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DragAndDropAnchorView titleLabel](self, "titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "font"));
  objc_msgSend(v3, "_scaledValueForValue:", 16.0);
  v5 = v4;

  return v5;
}

- (double)bottomToSubtitleLabelConstant
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DragAndDropAnchorView titleLabel](self, "titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "font"));
  objc_msgSend(v3, "_scaledValueForValue:", 14.0);
  v5 = v4;

  return v5;
}

- (void)updateWithInitialObject:(id)a3
{
  void *mapItem;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;

  mapItem = self->_mapItem;
  if (!mapItem)
    mapItem = a3;
  v14 = mapItem;
  v5 = objc_opt_class(MKMapItem);
  if ((objc_opt_isKindOfClass(v14, v5) & 1) != 0)
  {
    v6 = v14;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_addressFormattedAsShortenedAddress"));
LABEL_14:
    v12 = (void *)v8;

    goto LABEL_15;
  }
  v9 = objc_opt_class(AddressBookAddress);
  if ((objc_opt_isKindOfClass(v14, v9) & 1) != 0)
  {
    v6 = v14;
    if (objc_msgSend(v6, "isMeCard"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedLabel"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "capitalizedString"));

    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "compositeName"));
    }
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "shortAddress"));
    goto LABEL_14;
  }
  v11 = objc_opt_class(CRRecentContact);
  if ((objc_opt_isKindOfClass(v14, v11) & 1) == 0)
  {
    v13 = objc_opt_class(ParkedCar);
    if ((objc_opt_isKindOfClass(v14, v13) & 1) == 0)
    {
      v12 = 0;
      v7 = 0;
      goto LABEL_15;
    }
    v6 = v14;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "locationDisplayString"));
    goto LABEL_14;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "address"));
  v12 = 0;
LABEL_15:
  -[DragAndDropAnchorView setTitle:subtitle:](self, "setTitle:subtitle:", v7, v12);

}

- (void)updateWithResolvedMapItem:(id)a3
{
  id v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)&self->_mapItem, a3);
  v5 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_addressFormattedAsShortenedAddress"));

  -[DragAndDropAnchorView setTitle:subtitle:](self, "setTitle:subtitle:", v7, v6);
}

- (void)setTitle:(id)a3 subtitle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DragAndDropAnchorView titleLabel](self, "titleLabel"));
  objc_msgSend(v8, "setText:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DragAndDropAnchorView subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v9, "setText:", v6);

  -[DragAndDropAnchorView setNeedsLayout](self, "setNeedsLayout");
  v10 = (id)objc_claimAutoreleasedReturnValue(-[DragAndDropAnchorView contentUpdateDelegate](self, "contentUpdateDelegate"));
  objc_msgSend(v10, "dragAndDropAnchorViewCellDidUpdateContent:", self);

}

- (id)_maximumContentSizeCategory
{
  return UIContentSizeCategoryExtraExtraExtraLarge;
}

- (id)_effectiveTraitCollection
{
  UITraitCollection *previewTraitCollection;
  void *v3;
  void *v4;

  previewTraitCollection = self->_previewTraitCollection;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DragAndDropAnchorView _maximumContentSizeCategory](self, "_maximumContentSizeCategory"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UITraitCollection _maps_traitCollectionByClampingContentSizeCategoryWithMinimumContentSizeCategory:maximumContentSizeCategory:](previewTraitCollection, "_maps_traitCollectionByClampingContentSizeCategoryWithMinimumContentSizeCategory:maximumContentSizeCategory:", 0, v3));

  return v4;
}

- (DragAndDropMapItem)item
{
  return self->_item;
}

- (UITraitCollection)previewTraitCollection
{
  return self->_previewTraitCollection;
}

- (DragAndDropAnchorViewContentUpdateDelegate)contentUpdateDelegate
{
  return (DragAndDropAnchorViewContentUpdateDelegate *)objc_loadWeakRetained((id *)&self->_contentUpdateDelegate);
}

- (void)setContentUpdateDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_contentUpdateDelegate, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_destroyWeak((id *)&self->_contentUpdateDelegate);
  objc_storeStrong((id *)&self->_previewTraitCollection, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end
