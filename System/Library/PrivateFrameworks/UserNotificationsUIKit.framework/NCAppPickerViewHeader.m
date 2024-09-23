@implementation NCAppPickerViewHeader

- (NCAppPickerViewHeader)initWithFrame:(CGRect)a3
{
  NCAppPickerViewHeader *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  UILabel *titleLabel;
  UILabel *v11;
  void *v12;
  UILabel *v13;
  void *v14;
  UILabel *v15;
  void *v16;
  double v17;
  uint64_t v18;
  UILabel *descriptionLabel;
  UILabel *v20;
  void *v21;
  UILabel *v22;
  void *v23;
  UILabel *v24;
  void *v25;
  uint64_t v26;
  UILabel *orderingDescriptionLabel;
  UILabel *v28;
  void *v29;
  UILabel *v30;
  void *v31;
  UILabel *v32;
  void *v33;
  uint64_t v34;
  UIView *orderingWarningContainer;
  UIView *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  UIImageView *orderingWarningIconImageView;
  UIImageView *v41;
  void *v42;
  uint64_t v43;
  UILabel *orderingWarningLabel;
  UILabel *v45;
  void *v46;
  UILabel *v47;
  void *v48;
  id v49;
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
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v109;
  void *v110;
  objc_super v111;

  v111.receiver = self;
  v111.super_class = (Class)NCAppPickerViewHeader;
  v3 = -[NCAppPickerViewHeader initWithFrame:](&v111, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3990]);
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v9;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 0);
    v11 = v3->_titleLabel;
    objc_msgSend((id)objc_opt_class(), "_titleText");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v11, "setText:", v12);

    v13 = v3->_titleLabel;
    objc_msgSend((id)objc_opt_class(), "_titleFont");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v13, "setFont:", v14);

    -[UILabel setTextAlignment:](v3->_titleLabel, "setTextAlignment:", 1);
    v15 = v3->_titleLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v15, "setTextColor:", v16);

    LODWORD(v17) = 0.5;
    -[UILabel _setHyphenationFactor:](v3->_titleLabel, "_setHyphenationFactor:", v17);
    -[NCAppPickerViewHeader addSubview:](v3, "addSubview:", v3->_titleLabel);
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v5, v6, v7, v8);
    descriptionLabel = v3->_descriptionLabel;
    v3->_descriptionLabel = (UILabel *)v18;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_descriptionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v3->_descriptionLabel, "setNumberOfLines:", 0);
    v20 = v3->_descriptionLabel;
    objc_msgSend((id)objc_opt_class(), "_descriptionText");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v20, "setText:", v21);

    v22 = v3->_descriptionLabel;
    objc_msgSend((id)objc_opt_class(), "_descriptionFont");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v22, "setFont:", v23);

    -[UILabel setTextAlignment:](v3->_descriptionLabel, "setTextAlignment:", 1);
    v24 = v3->_descriptionLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v24, "setTextColor:", v25);

    -[NCAppPickerViewHeader addSubview:](v3, "addSubview:", v3->_descriptionLabel);
    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v5, v6, v7, v8);
    orderingDescriptionLabel = v3->_orderingDescriptionLabel;
    v3->_orderingDescriptionLabel = (UILabel *)v26;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_orderingDescriptionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v3->_orderingDescriptionLabel, "setNumberOfLines:", 0);
    v28 = v3->_orderingDescriptionLabel;
    objc_msgSend((id)objc_opt_class(), "_orderingDescriptionText");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v28, "setText:", v29);

    v30 = v3->_orderingDescriptionLabel;
    objc_msgSend((id)objc_opt_class(), "_orderingDescriptionFont");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v30, "setFont:", v31);

    v32 = v3->_orderingDescriptionLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v32, "setTextColor:", v33);

    -[UILabel setTextAlignment:](v3->_orderingDescriptionLabel, "setTextAlignment:", 1);
    -[NCAppPickerViewHeader addSubview:](v3, "addSubview:", v3->_orderingDescriptionLabel);
    v34 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v5, v6, v7, v8);
    orderingWarningContainer = v3->_orderingWarningContainer;
    v3->_orderingWarningContainer = (UIView *)v34;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_orderingWarningContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v36 = v3->_orderingWarningContainer;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "colorWithAlphaComponent:", 0.12);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v36, "setBackgroundColor:", v38);

    -[UIView _setContinuousCornerRadius:](v3->_orderingWarningContainer, "_setContinuousCornerRadius:", 12.0);
    -[NCAppPickerViewHeader addSubview:](v3, "addSubview:", v3->_orderingWarningContainer);
    v39 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", v5, v6, v7, v8);
    orderingWarningIconImageView = v3->_orderingWarningIconImageView;
    v3->_orderingWarningIconImageView = (UIImageView *)v39;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_orderingWarningIconImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:", 20.0);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("exclamationmark.circle"), v110);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](v3->_orderingWarningIconImageView, "setImage:", v109);
    -[UIImageView setContentMode:](v3->_orderingWarningIconImageView, "setContentMode:", 4);
    v41 = v3->_orderingWarningIconImageView;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v41, "setTintColor:", v42);

    -[UIView addSubview:](v3->_orderingWarningContainer, "addSubview:", v3->_orderingWarningIconImageView);
    v43 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v5, v6, v7, v8);
    orderingWarningLabel = v3->_orderingWarningLabel;
    v3->_orderingWarningLabel = (UILabel *)v43;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_orderingWarningLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v3->_orderingWarningLabel, "setNumberOfLines:", 0);
    v45 = v3->_orderingWarningLabel;
    objc_msgSend((id)objc_opt_class(), "_orderingWarningFont");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v45, "setFont:", v46);

    v47 = v3->_orderingWarningLabel;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v47, "setTextColor:", v48);

    -[UIView addSubview:](v3->_orderingWarningContainer, "addSubview:", v3->_orderingWarningLabel);
    v49 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[UILabel topAnchor](v3->_titleLabel, "topAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCAppPickerViewHeader topAnchor](v3, "topAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:constant:", v51, 2.0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "addObject:", v52);

    -[UILabel leadingAnchor](v3->_titleLabel, "leadingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCAppPickerViewHeader leadingAnchor](v3, "leadingAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:constant:", v54, 16.0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "addObject:", v55);

    -[NCAppPickerViewHeader trailingAnchor](v3, "trailingAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](v3->_titleLabel, "trailingAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToAnchor:constant:", v57, 16.0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "addObject:", v58);

    -[UILabel topAnchor](v3->_descriptionLabel, "topAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v3->_titleLabel, "bottomAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "constraintEqualToAnchor:constant:", v60, 8.0);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "addObject:", v61);

    -[UILabel leadingAnchor](v3->_descriptionLabel, "leadingAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCAppPickerViewHeader leadingAnchor](v3, "leadingAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintEqualToAnchor:constant:", v63, 16.0);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "addObject:", v64);

    -[NCAppPickerViewHeader trailingAnchor](v3, "trailingAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](v3->_descriptionLabel, "trailingAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "constraintEqualToAnchor:constant:", v66, 16.0);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "addObject:", v67);

    -[UILabel topAnchor](v3->_orderingDescriptionLabel, "topAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v3->_descriptionLabel, "bottomAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintEqualToAnchor:constant:", v69, 14.0);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "addObject:", v70);

    -[UILabel leadingAnchor](v3->_orderingDescriptionLabel, "leadingAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCAppPickerViewHeader leadingAnchor](v3, "leadingAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "constraintEqualToAnchor:", v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "addObject:", v73);

    -[NCAppPickerViewHeader trailingAnchor](v3, "trailingAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](v3->_orderingDescriptionLabel, "trailingAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "constraintEqualToAnchor:", v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "addObject:", v76);

    -[UIView topAnchor](v3->_orderingWarningContainer, "topAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel topAnchor](v3->_orderingWarningLabel, "topAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "constraintEqualToAnchor:constant:", v78, -12.0);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "addObject:", v79);

    -[UIView leadingAnchor](v3->_orderingWarningContainer, "leadingAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[NCAppPickerViewHeader leadingAnchor](v3, "leadingAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "constraintEqualToAnchor:", v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "addObject:", v82);

    -[NCAppPickerViewHeader trailingAnchor](v3, "trailingAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v3->_orderingWarningContainer, "trailingAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "constraintEqualToAnchor:", v84);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "addObject:", v85);

    -[UILabel bottomAnchor](v3->_orderingWarningLabel, "bottomAnchor");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v3->_orderingWarningContainer, "bottomAnchor");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "constraintEqualToAnchor:constant:", v87, -12.0);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "addObject:", v88);

    -[NCAppPickerViewHeader bottomAnchor](v3, "bottomAnchor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v3->_orderingWarningContainer, "bottomAnchor");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "constraintEqualToAnchor:constant:", v90, 8.0);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "addObject:", v91);

    -[UIImageView centerYAnchor](v3->_orderingWarningIconImageView, "centerYAnchor");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel centerYAnchor](v3->_orderingWarningLabel, "centerYAnchor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "constraintEqualToAnchor:", v93);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "addObject:", v94);

    -[UIImageView leadingAnchor](v3->_orderingWarningIconImageView, "leadingAnchor");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v3->_orderingWarningContainer, "leadingAnchor");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "constraintEqualToAnchor:constant:", v96, 12.0);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "addObject:", v97);

    -[UIImageView heightAnchor](v3->_orderingWarningIconImageView, "heightAnchor");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "constraintEqualToConstant:", 24.0);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "addObject:", v99);

    -[UIImageView widthAnchor](v3->_orderingWarningIconImageView, "widthAnchor");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "constraintEqualToConstant:", 24.0);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "addObject:", v101);

    -[UILabel leadingAnchor](v3->_orderingWarningLabel, "leadingAnchor");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView trailingAnchor](v3->_orderingWarningIconImageView, "trailingAnchor");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "constraintEqualToAnchor:constant:", v103, 10.0);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "addObject:", v104);

    -[UIView trailingAnchor](v3->_orderingWarningContainer, "trailingAnchor");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](v3->_orderingWarningLabel, "trailingAnchor");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "constraintEqualToAnchor:constant:", v106, 10.0);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "addObject:", v107);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v49);
  }
  return v3;
}

- (void)configureSupportsSortByAvgNumberOfNotifications:(BOOL)a3
{
  _BOOL4 v3;
  UILabel *orderingWarningLabel;
  id v6;

  v3 = a3;
  -[UIView setHidden:](self->_orderingWarningContainer, "setHidden:");
  orderingWarningLabel = self->_orderingWarningLabel;
  if (v3)
  {
    -[UILabel setText:](self->_orderingWarningLabel, "setText:", 0);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_orderingWarningText");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](orderingWarningLabel, "setText:", v6);

  }
}

+ (id)reuseIdentifier
{
  return CFSTR("NCAppPickerViewHeader");
}

+ (double)preferredHeightForWidth:(double)a3 supportsSortByAvgNumberOfNotifications:(BOOL)a4
{
  id v7;
  void *v8;
  double v9;
  void *v10;
  uint64_t v11;
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
  double result;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  _QWORD v31[2];
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  v31[1] = *MEMORY[0x1E0C80C00];
  if (!preferredHeightForWidth_supportsSortByAvgNumberOfNotifications____drawingContext)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0DC12A0]);
    v8 = (void *)preferredHeightForWidth_supportsSortByAvgNumberOfNotifications____drawingContext;
    preferredHeightForWidth_supportsSortByAvgNumberOfNotifications____drawingContext = (uint64_t)v7;

    objc_msgSend((id)preferredHeightForWidth_supportsSortByAvgNumberOfNotifications____drawingContext, "setWantsNumberOfLineFragments:", 1);
  }
  v9 = fmax(a3 + -32.0, 0.0);
  objc_msgSend((id)objc_opt_class(), "_titleText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = *MEMORY[0x1E0DC1138];
  v11 = v30;
  objc_msgSend(a1, "_titleFont");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "boundingRectWithSize:options:attributes:context:", 1, v13, preferredHeightForWidth_supportsSortByAvgNumberOfNotifications____drawingContext, v9, 0.0);
  CGRectGetHeight(v32);

  objc_msgSend((id)objc_opt_class(), "_descriptionText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v11;
  objc_msgSend(a1, "_descriptionFont");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "boundingRectWithSize:options:attributes:context:", 1, v16, preferredHeightForWidth_supportsSortByAvgNumberOfNotifications____drawingContext, v9, 0.0);
  CGRectGetHeight(v33);

  objc_msgSend((id)objc_opt_class(), "_orderingDescriptionText");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v11;
  objc_msgSend(a1, "_orderingDescriptionFont");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "boundingRectWithSize:options:attributes:context:", 1, v19, preferredHeightForWidth_supportsSortByAvgNumberOfNotifications____drawingContext, v9, 0.0);
  CGRectGetHeight(v34);

  if (!a4)
  {
    objc_msgSend((id)objc_opt_class(), "_orderingWarningText");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v11;
    objc_msgSend(a1, "_orderingWarningFont");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "boundingRectWithSize:options:attributes:context:", 1, v22, preferredHeightForWidth_supportsSortByAvgNumberOfNotifications____drawingContext, fmax(a3 + -12.0 + -24.0 + -10.0 + -10.0, 0.0), 0.0);
    CGRectGetHeight(v35);

  }
  _NCMainScreenScale();
  UICeilToScale();
  return result;
}

+ (id)_titleText
{
  void *v2;
  void *v3;

  NCUserNotificationsUIKitFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_DIGEST_ONBOARDING_ADD_PICKER_TITLE"), &stru_1E8D21F60, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_titleFont
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4AE8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontDescriptorWithSymbolicTraits:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = v3;
  else
    v4 = v2;
  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v4, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_descriptionText
{
  void *v2;
  void *v3;

  NCUserNotificationsUIKitFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_DIGEST_ONBOARDING_ADD_PICKER_DESCRIPTION"), &stru_1E8D21F60, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_descriptionFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
}

+ (id)_orderingDescriptionText
{
  void *v2;
  void *v3;

  NCUserNotificationsUIKitFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_DIGEST_SETTINGS_ORDERED_BY"), &stru_1E8D21F60, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_orderingDescriptionFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
}

+ (id)_orderingWarningText
{
  void *v2;
  void *v3;

  NCUserNotificationsUIKitFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_DIGEST_SETTINGS_NOT_ENOUGH_DATA"), &stru_1E8D21F60, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_orderingWarningFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderingWarningIconImageView, 0);
  objc_storeStrong((id *)&self->_orderingWarningLabel, 0);
  objc_storeStrong((id *)&self->_orderingWarningContainer, 0);
  objc_storeStrong((id *)&self->_orderingDescriptionLabel, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
