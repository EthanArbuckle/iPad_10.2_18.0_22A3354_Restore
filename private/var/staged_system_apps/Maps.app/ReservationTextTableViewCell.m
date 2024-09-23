@implementation ReservationTextTableViewCell

- (ReservationTextTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  ReservationTextTableViewCell *v4;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)ReservationTextTableViewCell;
  v4 = -[ReservationTextTableViewCell initWithStyle:reuseIdentifier:](&v28, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init((Class)UILabel);
    -[ReservationTextTableViewCell setLabel:](v4, "setLabel:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleSubheadline));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell label](v4, "label"));
    objc_msgSend(v7, "setFont:", v6);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell label](v4, "label"));
    objc_msgSend(v8, "setNumberOfLines:", 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell label](v4, "label"));
    objc_msgSend(v10, "setTextColor:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
    -[ReservationTextTableViewCell setPrimaryButton:](v4, "setPrimaryButton:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
    -[ReservationTextTableViewCell setSecondaryButton:](v4, "setSecondaryButton:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleSubheadline));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell primaryButton](v4, "primaryButton"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "titleLabel"));
    objc_msgSend(v15, "setFont:", v13);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleSubheadline));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell secondaryButton](v4, "secondaryButton"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "titleLabel"));
    objc_msgSend(v18, "setFont:", v16);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell primaryButton](v4, "primaryButton"));
    objc_msgSend(v19, "addTarget:action:forControlEvents:", v4, "primaryButtonSelected:", 64);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell secondaryButton](v4, "secondaryButton"));
    objc_msgSend(v20, "addTarget:action:forControlEvents:", v4, "secondaryButtonSelected:", 64);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell contentView](v4, "contentView"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell label](v4, "label"));
    objc_msgSend(v21, "addSubview:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell contentView](v4, "contentView"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell primaryButton](v4, "primaryButton"));
    objc_msgSend(v23, "addSubview:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell contentView](v4, "contentView"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell secondaryButton](v4, "secondaryButton"));
    objc_msgSend(v25, "addSubview:", v26);

    -[ReservationTextTableViewCell setupConstraints](v4, "setupConstraints");
  }
  return v4;
}

- (void)primaryButtonSelected:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell delegate](self, "delegate", a3));
  objc_msgSend(v4, "reservationTableViewCellDidSelectPrimaryButton:", self);

}

- (void)secondaryButtonSelected:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell delegate](self, "delegate", a3));
  objc_msgSend(v4, "reservationTableViewCellDidSelectSecondaryButton:", self);

}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
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
  objc_super v20;
  _QWORD v21[2];
  _QWORD v22[3];
  _QWORD v23[3];
  _QWORD v24[2];
  _QWORD v25[4];
  void *v26;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell primaryButtonText](self, "primaryButtonText"));
  if (objc_msgSend(v3, "length"))
  {

  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell secondaryButtonText](self, "secondaryButtonText"));
    v5 = objc_msgSend(v4, "length");

    if (!v5)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell textToBottomConstraint](self, "textToBottomConstraint"));
      v26 = v18;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v26, 1));

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell textToPrimaryButtonConstraint](self, "textToPrimaryButtonConstraint"));
      v25[0] = v13;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell primaryButtonToSecondaryButtonConstraint](self, "primaryButtonToSecondaryButtonConstraint"));
      v25[1] = v14;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell primaryButtonToBottomConstraint](self, "primaryButtonToBottomConstraint"));
      v25[2] = v17;
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell secondaryButtonToBottomConstraint](self, "secondaryButtonToBottomConstraint"));
      v25[3] = v19;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 4));

      goto LABEL_8;
    }
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell secondaryButtonText](self, "secondaryButtonText"));
  v7 = objc_msgSend(v6, "length");

  v8 = objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell textToPrimaryButtonConstraint](self, "textToPrimaryButtonConstraint"));
  v9 = (void *)v8;
  if (!v7)
  {
    v24[0] = v8;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell primaryButtonToBottomConstraint](self, "primaryButtonToBottomConstraint"));
    v24[1] = v16;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 2));

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell textToBottomConstraint](self, "textToBottomConstraint"));
    v23[0] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell primaryButtonToSecondaryButtonConstraint](self, "primaryButtonToSecondaryButtonConstraint"));
    v23[1] = v14;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell secondaryButtonToBottomConstraint](self, "secondaryButtonToBottomConstraint"));
    v23[2] = v17;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 3));
LABEL_8:

    goto LABEL_9;
  }
  v22[0] = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell primaryButtonToSecondaryButtonConstraint](self, "primaryButtonToSecondaryButtonConstraint"));
  v22[1] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell secondaryButtonToBottomConstraint](self, "secondaryButtonToBottomConstraint"));
  v22[2] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 3));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell textToBottomConstraint](self, "textToBottomConstraint"));
  v21[0] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell primaryButtonToBottomConstraint](self, "primaryButtonToBottomConstraint"));
  v21[1] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 2));
LABEL_9:

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);
  +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v15);
  v20.receiver = self;
  v20.super_class = (Class)ReservationTextTableViewCell;
  -[ReservationTextTableViewCell updateConstraints](&v20, "updateConstraints");

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
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  _QWORD v90[8];
  _QWORD v91[7];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell label](self, "label"));
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell primaryButton](self, "primaryButton"));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell secondaryButton](self, "secondaryButton"));
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell label](self, "label"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell contentView](self, "contentView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layoutMarginsGuide"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "leadingAnchor"));
  v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:", v10));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell label](self, "label"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "trailingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell contentView](self, "contentView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "layoutMarginsGuide"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "trailingAnchor"));
  v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v15));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell label](self, "label"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "topAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell contentView](self, "contentView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "layoutMarginsGuide"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "topAnchor"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v20));

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell primaryButton](self, "primaryButton"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "leadingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell contentView](self, "contentView"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "layoutMarginsGuide"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "leadingAnchor"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v25));

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell primaryButton](self, "primaryButton"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "trailingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell contentView](self, "contentView"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "layoutMarginsGuide"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "trailingAnchor"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintLessThanOrEqualToAnchor:", v30));

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell secondaryButton](self, "secondaryButton"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "leadingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell contentView](self, "contentView"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "layoutMarginsGuide"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "leadingAnchor"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v35));

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell secondaryButton](self, "secondaryButton"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "trailingAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell contentView](self, "contentView"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "layoutMarginsGuide"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "trailingAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintLessThanOrEqualToAnchor:", v40));

  v91[0] = v89;
  v91[1] = v88;
  v91[2] = v87;
  v91[3] = v86;
  v91[4] = v85;
  v91[5] = v84;
  v91[6] = v41;
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v91, 7));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v42);

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell contentView](self, "contentView"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "bottomAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell label](self, "label"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "lastBaselineAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell label](self, "label"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "font"));
  objc_msgSend(v48, "_scaledValueForValue:", 21.0);
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:constant:", v46));
  -[ReservationTextTableViewCell setTextToBottomConstraint:](self, "setTextToBottomConstraint:", v49);

  v50 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell primaryButton](self, "primaryButton"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "firstBaselineAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell label](self, "label"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "lastBaselineAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell primaryButton](self, "primaryButton"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "titleLabel"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "font"));
  objc_msgSend(v56, "_scaledValueForValue:", 28.0);
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:constant:", v53));
  -[ReservationTextTableViewCell setTextToPrimaryButtonConstraint:](self, "setTextToPrimaryButtonConstraint:", v57);

  v58 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell secondaryButton](self, "secondaryButton"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "firstBaselineAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell primaryButton](self, "primaryButton"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "lastBaselineAnchor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell primaryButton](self, "primaryButton"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "titleLabel"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "font"));
  objc_msgSend(v64, "_scaledValueForValue:", 28.0);
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "constraintEqualToAnchor:constant:", v61));
  -[ReservationTextTableViewCell setPrimaryButtonToSecondaryButtonConstraint:](self, "setPrimaryButtonToSecondaryButtonConstraint:", v65);

  v66 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell contentView](self, "contentView"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "bottomAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell primaryButton](self, "primaryButton"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "lastBaselineAnchor"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell primaryButton](self, "primaryButton"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "titleLabel"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "font"));
  objc_msgSend(v72, "_scaledValueForValue:", 17.0);
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "constraintEqualToAnchor:constant:", v69));
  -[ReservationTextTableViewCell setPrimaryButtonToBottomConstraint:](self, "setPrimaryButtonToBottomConstraint:", v73);

  v74 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell contentView](self, "contentView"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "bottomAnchor"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell secondaryButton](self, "secondaryButton"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "lastBaselineAnchor"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell secondaryButton](self, "secondaryButton"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "titleLabel"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "font"));
  objc_msgSend(v80, "_scaledValueForValue:", 17.0);
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "constraintEqualToAnchor:constant:", v77));
  -[ReservationTextTableViewCell setSecondaryButtonToBottomConstraint:](self, "setSecondaryButtonToBottomConstraint:", v81);

  v90[0] = v89;
  v90[1] = v88;
  v90[2] = v87;
  v90[3] = v86;
  v90[4] = v85;
  v90[5] = v84;
  v90[6] = v41;
  v82 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell textToBottomConstraint](self, "textToBottomConstraint"));
  v90[7] = v82;
  v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v90, 8));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v83);

}

- (void)setText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell label](self, "label"));
  objc_msgSend(v5, "setText:", v4);

}

- (NSString)text
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell label](self, "label"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "text"));

  return (NSString *)v3;
}

- (void)setPrimaryButtonText:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell primaryButtonText](self, "primaryButtonText"));
  if (!v4)
  {
    if ((objc_msgSend(v9, "isEqual:", &stru_1011EB268) & 1) != 0)
      goto LABEL_4;
    goto LABEL_3;
  }
  v5 = (void *)v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell primaryButtonText](self, "primaryButtonText"));
  v7 = objc_msgSend(v9, "isEqual:", v6);

  if ((v7 & 1) == 0)
  {
LABEL_3:
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell primaryButton](self, "primaryButton"));
    objc_msgSend(v8, "setTitle:forState:", v9, 0);

    -[ReservationTextTableViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
LABEL_4:

}

- (void)setSecondaryButtonText:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell secondaryButtonText](self, "secondaryButtonText"));
  if (!v4)
  {
    if ((objc_msgSend(v9, "isEqual:", &stru_1011EB268) & 1) != 0)
      goto LABEL_4;
    goto LABEL_3;
  }
  v5 = (void *)v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell secondaryButtonText](self, "secondaryButtonText"));
  v7 = objc_msgSend(v9, "isEqual:", v6);

  if ((v7 & 1) == 0)
  {
LABEL_3:
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell secondaryButton](self, "secondaryButton"));
    objc_msgSend(v8, "setTitle:forState:", v9, 0);

    -[ReservationTextTableViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
LABEL_4:

}

- (NSString)primaryButtonText
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell primaryButton](self, "primaryButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "titleForState:", 0));

  return (NSString *)v3;
}

- (NSString)secondaryButtonText
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ReservationTextTableViewCell secondaryButton](self, "secondaryButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "titleForState:", 0));

  return (NSString *)v3;
}

- (ReservationTextTableViewCellDelegate)delegate
{
  return (ReservationTextTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (UIButton)primaryButton
{
  return self->_primaryButton;
}

- (void)setPrimaryButton:(id)a3
{
  objc_storeStrong((id *)&self->_primaryButton, a3);
}

- (UIButton)secondaryButton
{
  return self->_secondaryButton;
}

- (void)setSecondaryButton:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryButton, a3);
}

- (NSLayoutConstraint)textToBottomConstraint
{
  return self->_textToBottomConstraint;
}

- (void)setTextToBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_textToBottomConstraint, a3);
}

- (NSLayoutConstraint)textToPrimaryButtonConstraint
{
  return self->_textToPrimaryButtonConstraint;
}

- (void)setTextToPrimaryButtonConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_textToPrimaryButtonConstraint, a3);
}

- (NSLayoutConstraint)primaryButtonToBottomConstraint
{
  return self->_primaryButtonToBottomConstraint;
}

- (void)setPrimaryButtonToBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_primaryButtonToBottomConstraint, a3);
}

- (NSLayoutConstraint)primaryButtonToSecondaryButtonConstraint
{
  return self->_primaryButtonToSecondaryButtonConstraint;
}

- (void)setPrimaryButtonToSecondaryButtonConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_primaryButtonToSecondaryButtonConstraint, a3);
}

- (NSLayoutConstraint)secondaryButtonToBottomConstraint
{
  return self->_secondaryButtonToBottomConstraint;
}

- (void)setSecondaryButtonToBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryButtonToBottomConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryButtonToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_primaryButtonToSecondaryButtonConstraint, 0);
  objc_storeStrong((id *)&self->_primaryButtonToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_textToPrimaryButtonConstraint, 0);
  objc_storeStrong((id *)&self->_textToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_secondaryButton, 0);
  objc_storeStrong((id *)&self->_primaryButton, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
