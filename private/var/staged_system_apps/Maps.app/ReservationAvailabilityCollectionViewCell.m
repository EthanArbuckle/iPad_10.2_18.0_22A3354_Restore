@implementation ReservationAvailabilityCollectionViewCell

- (ReservationAvailabilityCollectionViewCell)initWithFrame:(CGRect)a3
{
  ReservationAvailabilityCollectionViewCell *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
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
  objc_super v39;

  v39.receiver = self;
  v39.super_class = (Class)ReservationAvailabilityCollectionViewCell;
  v3 = -[ReservationAvailabilityCollectionViewCell initWithFrame:](&v39, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init((Class)UILabel);
    -[ReservationAvailabilityCollectionViewCell setTitleLabel:](v3, "setTitleLabel:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell titleLabel](v3, "titleLabel"));
    objc_msgSend(v6, "setBackgroundColor:", v5);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell titleLabel](v3, "titleLabel"));
    objc_msgSend(v7, "setTextAlignment:", 1);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell titleLabel](v3, "titleLabel"));
    objc_msgSend(v9, "setTextColor:", v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleTitle2));
    objc_msgSend(v10, "pointSize");
    v12 = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", v12, UIFontWeightLight));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell titleLabel](v3, "titleLabel"));
    objc_msgSend(v14, "setFont:", v13);

    v15 = objc_alloc_init((Class)UILabel);
    -[ReservationAvailabilityCollectionViewCell setSubLabel:](v3, "setSubLabel:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell subLabel](v3, "subLabel"));
    objc_msgSend(v16, "setNumberOfLines:", 2);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell subLabel](v3, "subLabel"));
    objc_msgSend(v18, "setBackgroundColor:", v17);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell subLabel](v3, "subLabel"));
    objc_msgSend(v19, "setTextAlignment:", 1);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleCaption1));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell subLabel](v3, "subLabel"));
    objc_msgSend(v21, "setFont:", v20);

    v22 = objc_alloc_init((Class)UIView);
    -[ReservationAvailabilityCollectionViewCell setContainerView:](v3, "setContainerView:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell containerView](v3, "containerView"));
    objc_msgSend(v23, "setClipsToBounds:", 1);

    v24 = objc_alloc_init((Class)UIView);
    -[ReservationAvailabilityCollectionViewCell setTopColorView:](v3, "setTopColorView:", v24);

    v25 = objc_alloc_init((Class)UIView);
    -[ReservationAvailabilityCollectionViewCell setBottomColorView:](v3, "setBottomColorView:", v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell contentView](v3, "contentView"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell containerView](v3, "containerView"));
    objc_msgSend(v26, "addSubview:", v27);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell contentView](v3, "contentView"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell titleLabel](v3, "titleLabel"));
    objc_msgSend(v28, "addSubview:", v29);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell contentView](v3, "contentView"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell subLabel](v3, "subLabel"));
    objc_msgSend(v30, "addSubview:", v31);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell containerView](v3, "containerView"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell topColorView](v3, "topColorView"));
    objc_msgSend(v32, "addSubview:", v33);

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell containerView](v3, "containerView"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell bottomColorView](v3, "bottomColorView"));
    objc_msgSend(v34, "addSubview:", v35);

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell containerView](v3, "containerView"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "layer"));
    objc_msgSend(v37, "setCornerRadius:", 8.0);

    -[ReservationAvailabilityCollectionViewCell updateColors](v3, "updateColors");
    -[ReservationAvailabilityCollectionViewCell initializeConstraints](v3, "initializeConstraints");
  }
  return v3;
}

- (void)initializeConstraints
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
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  _QWORD v103[19];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell contentView](self, "contentView"));
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell subLabel](self, "subLabel"));
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell containerView](self, "containerView"));
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell topColorView](self, "topColorView"));
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell bottomColorView](self, "bottomColorView"));
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell topColorView](self, "topColorView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell contentView](self, "contentView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topAnchor"));
  v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:constant:", v12, 9.0));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell topColorView](self, "topColorView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "leadingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell contentView](self, "contentView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "leadingAnchor"));
  v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v16));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell topColorView](self, "topColorView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "trailingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell contentView](self, "contentView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "trailingAnchor"));
  v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v20));

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell topColorView](self, "topColorView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "bottomAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell titleLabel](self, "titleLabel"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "lastBaselineAnchor"));
  v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:constant:", v24, 12.0));

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell bottomColorView](self, "bottomColorView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "topAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell topColorView](self, "topColorView"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "bottomAnchor"));
  v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v28));

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell bottomColorView](self, "bottomColorView"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "leadingAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell contentView](self, "contentView"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "leadingAnchor"));
  v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v32));

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell bottomColorView](self, "bottomColorView"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "trailingAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell contentView](self, "contentView"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "trailingAnchor"));
  v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v36));

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell titleLabel](self, "titleLabel"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "topAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell topColorView](self, "topColorView"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "topAnchor"));
  v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:constant:", v40, 8.0));

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell titleLabel](self, "titleLabel"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "leadingAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell contentView](self, "contentView"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "leadingAnchor"));
  v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:constant:", v44, 17.5));

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell titleLabel](self, "titleLabel"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "trailingAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell contentView](self, "contentView"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "trailingAnchor"));
  v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:constant:", v48, -17.5));

  v49 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell subLabel](self, "subLabel"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "firstBaselineAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell bottomColorView](self, "bottomColorView"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "topAnchor"));
  v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:constant:", v52, 15.0));

  v53 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell bottomColorView](self, "bottomColorView"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "leadingAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell subLabel](self, "subLabel"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "leadingAnchor"));
  v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintLessThanOrEqualToAnchor:constant:", v56, -17.5));

  v57 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell bottomColorView](self, "bottomColorView"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "trailingAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell subLabel](self, "subLabel"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "trailingAnchor"));
  v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintGreaterThanOrEqualToAnchor:constant:", v60, 17.5));

  v61 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell titleLabel](self, "titleLabel"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "centerXAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell subLabel](self, "subLabel"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "centerXAnchor"));
  v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToAnchor:", v64));

  v65 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell containerView](self, "containerView"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "topAnchor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell topColorView](self, "topColorView"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "topAnchor"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintEqualToAnchor:", v68));

  v70 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell containerView](self, "containerView"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "leadingAnchor"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell contentView](self, "contentView"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "leadingAnchor"));
  v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "constraintEqualToAnchor:", v73));

  v74 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell containerView](self, "containerView"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "trailingAnchor"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell contentView](self, "contentView"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "trailingAnchor"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "constraintEqualToAnchor:", v77));

  v78 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell containerView](self, "containerView"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "bottomAnchor"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell bottomColorView](self, "bottomColorView"));
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "bottomAnchor"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "constraintEqualToAnchor:", v81));

  v83 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell containerView](self, "containerView"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "widthAnchor"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "constraintGreaterThanOrEqualToConstant:", 88.0));

  v103[0] = v102;
  v103[1] = v101;
  v103[2] = v100;
  v103[3] = v99;
  v103[4] = v98;
  v103[5] = v97;
  v103[6] = v96;
  v103[7] = v95;
  v103[8] = v94;
  v103[9] = v93;
  v103[10] = v92;
  v103[11] = v89;
  v103[12] = v69;
  v103[13] = v88;
  v103[14] = v87;
  v103[15] = v82;
  v103[16] = v85;
  v103[17] = v91;
  v103[18] = v90;
  v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v103, 19));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v86);

}

- (void)updateConstraints
{
  void *v3;
  id v4;
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
  objc_super v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell subText](self, "subText"));
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell bottomColorViewBottomConstraint](self, "bottomColorViewBottomConstraint"));

    if (!v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell bottomColorView](self, "bottomColorView"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bottomAnchor"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell subLabel](self, "subLabel"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastBaselineAnchor"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:constant:", v9, 8.0));
      -[ReservationAvailabilityCollectionViewCell setBottomColorViewBottomConstraint:](self, "setBottomColorViewBottomConstraint:", v10);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell bottomColorViewHeightConstraint](self, "bottomColorViewHeightConstraint"));
    objc_msgSend(v11, "setActive:", 0);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell bottomColorViewBottomConstraint](self, "bottomColorViewBottomConstraint"));
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell bottomColorViewHeightConstraint](self, "bottomColorViewHeightConstraint"));

    if (!v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell bottomColorView](self, "bottomColorView"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "heightAnchor"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToConstant:", 0.0));
      -[ReservationAvailabilityCollectionViewCell setBottomColorViewHeightConstraint:](self, "setBottomColorViewHeightConstraint:", v16);

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell bottomColorViewBottomConstraint](self, "bottomColorViewBottomConstraint"));
    objc_msgSend(v17, "setActive:", 0);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell bottomColorViewHeightConstraint](self, "bottomColorViewHeightConstraint"));
  }
  v18 = v12;
  objc_msgSend(v12, "setActive:", 1);

  v19.receiver = self;
  v19.super_class = (Class)ReservationAvailabilityCollectionViewCell;
  -[ReservationAvailabilityCollectionViewCell updateConstraints](&v19, "updateConstraints");
}

- (void)setColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[UIColor isEqual:](self->_color, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_color, a3);
    -[ReservationAvailabilityCollectionViewCell updateColors](self, "updateColors");
  }

}

- (void)updateColors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell bottomColorView](self, "bottomColorView"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell containerView](self, "containerView"));
  objc_msgSend(v6, "setBackgroundColor:", v5);

  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell color](self, "color")));
  v8 = objc_msgSend(v7, "CGColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell containerView](self, "containerView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layer"));
  objc_msgSend(v10, "setBorderColor:", v8);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell color](self, "color"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell topColorView](self, "topColorView"));
  objc_msgSend(v12, "setBackgroundColor:", v11);

  v14 = (id)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell color](self, "color"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell subLabel](self, "subLabel"));
  objc_msgSend(v13, "setTextColor:", v14);

}

- (void)updateBorderMetrics
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  double v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell subText](self, "subText"));
  v4 = objc_msgSend(v3, "length");

  v8 = (id)objc_claimAutoreleasedReturnValue(-[ReservationAvailabilityCollectionViewCell containerView](self, "containerView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layer"));
  v6 = v5;
  v7 = 1.0;
  if (!v4)
    v7 = 0.0;
  objc_msgSend(v5, "setBorderWidth:", v7);

}

- (void)setTitleText:(id)a3
{
  NSString *v4;
  NSString *titleText;
  id v6;
  id v7;

  v7 = a3;
  if (!-[NSString isEqualToString:](self->_titleText, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v7, "copy");
    titleText = self->_titleText;
    self->_titleText = v4;

    v6 = objc_msgSend(v7, "copy");
    -[UILabel setText:](self->_titleLabel, "setText:", v6);

  }
}

- (void)setSubText:(id)a3
{
  NSString *v4;
  NSString *subText;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_subText, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    subText = self->_subText;
    self->_subText = v4;

    -[UILabel setText:](self->_subLabel, "setText:", v6);
    -[ReservationAvailabilityCollectionViewCell updateBorderMetrics](self, "updateBorderMetrics");
    -[ReservationAvailabilityCollectionViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }

}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)subText
{
  return self->_subText;
}

- (UIColor)color
{
  return self->_color;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (UIView)topColorView
{
  return self->_topColorView;
}

- (void)setTopColorView:(id)a3
{
  objc_storeStrong((id *)&self->_topColorView, a3);
}

- (UIView)bottomColorView
{
  return self->_bottomColorView;
}

- (void)setBottomColorView:(id)a3
{
  objc_storeStrong((id *)&self->_bottomColorView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)subLabel
{
  return self->_subLabel;
}

- (void)setSubLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subLabel, a3);
}

- (NSLayoutConstraint)bottomColorViewBottomConstraint
{
  return self->_bottomColorViewBottomConstraint;
}

- (void)setBottomColorViewBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bottomColorViewBottomConstraint, a3);
}

- (NSLayoutConstraint)bottomColorViewHeightConstraint
{
  return self->_bottomColorViewHeightConstraint;
}

- (void)setBottomColorViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bottomColorViewHeightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomColorViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_bottomColorViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_subLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_bottomColorView, 0);
  objc_storeStrong((id *)&self->_topColorView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_subText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
}

@end
