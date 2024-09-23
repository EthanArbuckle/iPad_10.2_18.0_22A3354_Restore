@implementation OBBulletedListItem

- (OBBulletedListItem)initWithTitle:(id)a3 description:(id)a4 symbolName:(id)a5 tintColor:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  OBBulletedListItem *v17;

  v10 = (void *)MEMORY[0x1E0DC3870];
  v11 = a6;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v10, "_systemImageNamed:", a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", -1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "imageWithConfiguration:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[OBBulletedListItem initWithTitle:description:image:tintColor:](self, "initWithTitle:description:image:tintColor:", v13, v12, v16, v11);
  return v17;
}

- (OBBulletedListItem)initWithTitle:(id)a3 description:(id)a4 symbolName:(id)a5 tintColor:(id)a6 linkButton:(id)a7
{
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  OBBulletedListItem *v20;

  v12 = (void *)MEMORY[0x1E0DC3870];
  v13 = a7;
  v14 = a6;
  v15 = a4;
  v16 = a3;
  objc_msgSend(v12, "_systemImageNamed:", a5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", -1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "imageWithConfiguration:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = -[OBBulletedListItem initWithTitle:description:image:tintColor:linkButton:](self, "initWithTitle:description:image:tintColor:linkButton:", v16, v15, v19, v14, v13);
  return v20;
}

- (OBBulletedListItem)initWithTitle:(id)a3 description:(id)a4 image:(id)a5 tintColor:(id)a6 linkButton:(id)a7
{
  unint64_t v12;
  unint64_t v13;
  id v14;
  id v15;
  id v16;
  OBBulletedListItem *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  OBBulletedListItem *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  UIView *imageContainer;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
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
  double v62;
  double v63;
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
  double v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
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
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  id v120;
  id v121;
  id v122;
  unint64_t v123;
  unint64_t v124;
  objc_super v125;
  _QWORD v126[11];

  v126[9] = *MEMORY[0x1E0C80C00];
  v12 = (unint64_t)a3;
  v13 = (unint64_t)a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (v12 | v13)
  {
    v125.receiver = self;
    v125.super_class = (Class)OBBulletedListItem;
    v18 = *MEMORY[0x1E0C9D648];
    v19 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v20 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v21 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v22 = -[OBBulletedListItem initWithFrame:](&v125, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v19, v20, v21);
    if (v22)
    {
      v122 = v14;
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v14);
      -[OBBulletedListItem setImageView:](v22, "setImageView:", v23);

      -[OBBulletedListItem imageView](v22, "imageView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setTintColor:", v15);

      -[OBBulletedListItem imageView](v22, "imageView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[OBBulletedListItem imageView](v22, "imageView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setContentMode:", 1);

      v27 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v18, v19, v20, v21);
      imageContainer = v22->_imageContainer;
      v22->_imageContainer = (UIView *)v27;

      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v22->_imageContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIView addSubview:](v22->_imageContainer, "addSubview:", v22->_imageView);
      if (objc_msgSend((id)v12, "length"))
      {
        v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v18, v19, v20, v21);
        -[OBBulletedListItem setTitleLabel:](v22, "setTitleLabel:", v29);

        -[OBBulletedListItem titleLabel](v22, "titleLabel");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setNumberOfLines:", 0);

        -[OBBulletedListItem titleLabel](v22, "titleLabel");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

        -[OBBulletedListItem titleLabel](v22, "titleLabel");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setText:", v12);

        -[OBBulletedListItem titleLabel](v22, "titleLabel");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v34) = 1148846080;
        objc_msgSend(v33, "setContentHuggingPriority:forAxis:", 1, v34);

      }
      if (objc_msgSend((id)v13, "length"))
      {
        v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v18, v19, v20, v21);
        -[OBBulletedListItem setDescriptionLabel:](v22, "setDescriptionLabel:", v35);

        -[OBBulletedListItem descriptionLabel](v22, "descriptionLabel");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setNumberOfLines:", 0);

        -[OBBulletedListItem descriptionLabel](v22, "descriptionLabel");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

        -[OBBulletedListItem descriptionLabel](v22, "descriptionLabel");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setText:", v13);

        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.56, 0.56, 0.58, 1.0);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[OBBulletedListItem descriptionLabel](v22, "descriptionLabel");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setTextColor:", v39);

        -[OBBulletedListItem descriptionLabel](v22, "descriptionLabel");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v42) = 1148846080;
        objc_msgSend(v41, "setContentHuggingPriority:forAxis:", 1, v42);

      }
      v121 = v15;
      v123 = v13;
      v124 = v12;
      -[OBBulletedListItem _titleFont](v22, "_titleFont");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBBulletedListItem titleLabel](v22, "titleLabel");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setFont:", v43);

      -[OBBulletedListItem _descriptionFont](v22, "_descriptionFont");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBBulletedListItem descriptionLabel](v22, "descriptionLabel");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setFont:", v45);

      v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3CA8]), "initWithFrame:", v18, v19, v20, v21);
      -[OBBulletedListItem setStackView:](v22, "setStackView:", v47);

      -[OBBulletedListItem stackView](v22, "stackView");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setAxis:", 1);

      -[OBBulletedListItem stackView](v22, "stackView");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setAlignment:", 1);

      -[OBBulletedListItem stackView](v22, "stackView");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      -[OBBulletedListItem stackView](v22, "stackView");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBBulletedListItem titleLabel](v22, "titleLabel");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "addArrangedSubview:", v52);

      -[OBBulletedListItem stackView](v22, "stackView");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBBulletedListItem descriptionLabel](v22, "descriptionLabel");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "addArrangedSubview:", v54);

      v120 = v16;
      if (v16)
      {
        objc_storeStrong((id *)&v22->_accessoryButton, a7);
        -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v22->_accessoryButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[OBBulletedListItem stackView](v22, "stackView");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        -[OBBulletedListItem accessoryButton](v22, "accessoryButton");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "addArrangedSubview:", v56);

      }
      -[OBBulletedListItem addSubview:](v22, "addSubview:", v22->_imageContainer);
      -[OBBulletedListItem stackView](v22, "stackView");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBBulletedListItem addSubview:](v22, "addSubview:", v57);

      -[OBBulletedListItem stackView](v22, "stackView");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBBulletedListItem _titleFont](v22, "_titleFont");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "leading");
      objc_msgSend(v58, "setSpacing:");

      -[OBBulletedListItem imageView](v22, "imageView");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "image");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBBulletedListItem imageSizeForImage:](v22, "imageSizeForImage:", v61);
      v63 = v62;

      -[OBBulletedListItem imageContainer](v22, "imageContainer");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "topAnchor");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBBulletedListItem topAnchor](v22, "topAnchor");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "constraintEqualToAnchor:", v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBBulletedListItem setTopConstraintToImageContainer:](v22, "setTopConstraintToImageContainer:", v67);

      -[OBBulletedListItem bottomAnchor](v22, "bottomAnchor");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBBulletedListItem imageContainer](v22, "imageContainer");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "bottomAnchor");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "constraintEqualToAnchor:", v70);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBBulletedListItem setBottomConstraintToImageContainer:](v22, "setBottomConstraintToImageContainer:", v71);

      -[OBBulletedListItem stackView](v22, "stackView");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "topAnchor");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBBulletedListItem topAnchor](v22, "topAnchor");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "constraintEqualToAnchor:", v74);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBBulletedListItem setTopConstraintToStackView:](v22, "setTopConstraintToStackView:", v75);

      -[OBBulletedListItem bottomAnchor](v22, "bottomAnchor");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBBulletedListItem stackView](v22, "stackView");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "bottomAnchor");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "constraintEqualToAnchor:", v78);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBBulletedListItem setBottomConstraintToStackView:](v22, "setBottomConstraintToStackView:", v79);

      v105 = (void *)MEMORY[0x1E0CB3718];
      -[OBBulletedListItem imageView](v22, "imageView");
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v119, "widthAnchor");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v118, "constraintEqualToConstant:", v63);
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      v126[0] = v117;
      -[OBBulletedListItem imageView](v22, "imageView");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v116, "heightAnchor");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v115, "constraintEqualToConstant:", v63);
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      v126[1] = v114;
      -[OBBulletedListItem imageView](v22, "imageView");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "centerXAnchor");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBBulletedListItem imageContainer](v22, "imageContainer");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v112, "centerXAnchor");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v111, "constraintEqualToAnchor:", v110);
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      v126[2] = v109;
      -[OBBulletedListItem imageView](v22, "imageView");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "centerYAnchor");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBBulletedListItem imageContainer](v22, "imageContainer");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v107, "centerYAnchor");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "constraintEqualToAnchor:", v104);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v126[3] = v103;
      -[OBBulletedListItem imageView](v22, "imageView");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "topAnchor");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBBulletedListItem imageContainer](v22, "imageContainer");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "topAnchor");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "constraintLessThanOrEqualToAnchor:", v99);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      v126[4] = v98;
      -[OBBulletedListItem imageView](v22, "imageView");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "bottomAnchor");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBBulletedListItem imageContainer](v22, "imageContainer");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "bottomAnchor");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "constraintLessThanOrEqualToAnchor:", v80);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v126[5] = v81;
      -[OBBulletedListItem stackView](v22, "stackView");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "trailingAnchor");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBBulletedListItem trailingAnchor](v22, "trailingAnchor");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBBulletedListItem trailingMargins](v22, "trailingMargins");
      objc_msgSend(v83, "constraintEqualToAnchor:constant:", v84, -v85);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v126[6] = v86;
      -[OBBulletedListItem topConstraintToStackView](v22, "topConstraintToStackView");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v126[7] = v87;
      -[OBBulletedListItem bottomConstraintToStackView](v22, "bottomConstraintToStackView");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v126[8] = v88;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v126, 9);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "activateConstraints:", v89);

      -[OBBulletedListItem _updateImageViewLayout](v22, "_updateImageViewLayout");
      -[OBBulletedListItem accessoryButton](v22, "accessoryButton");
      v90 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = v124;
      v14 = v122;
      v13 = v123;
      v16 = v120;
      v15 = v121;
      if (v90)
      {
        -[OBBulletedListItem descriptionLabel](v22, "descriptionLabel");
        v91 = (void *)objc_claimAutoreleasedReturnValue();

        if (v91)
          -[OBBulletedListItem descriptionLabel](v22, "descriptionLabel");
        else
          -[OBBulletedListItem titleLabel](v22, "titleLabel");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        -[OBBulletedListItem stackView](v22, "stackView");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "setCustomSpacing:afterView:", v92, 0.0);

      }
    }
    self = v22;
    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (OBBulletedListItem)initWithTitle:(id)a3 description:(id)a4 image:(id)a5 tintColor:(id)a6
{
  return -[OBBulletedListItem initWithTitle:description:image:tintColor:linkButton:](self, "initWithTitle:description:image:tintColor:linkButton:", a3, a4, a5, a6, 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)OBBulletedListItem;
  -[OBBulletedListItem traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, a3);
  -[OBBulletedListItem _updateImageViewLayout](self, "_updateImageViewLayout");
  -[OBBulletedListItem _titleFont](self, "_titleFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBBulletedListItem titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v4);

  -[OBBulletedListItem _descriptionFont](self, "_descriptionFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBBulletedListItem descriptionLabel](self, "descriptionLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v6);

}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  int v9;
  void *v10;
  double v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)OBBulletedListItem;
  -[OBBulletedListItem layoutSubviews](&v18, sel_layoutSubviews);
  -[OBBulletedListItem imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBBulletedListItem imageSizeForImage:](self, "imageSizeForImage:", v4);
  v6 = v5;

  -[OBBulletedListItem _combinedLabelHeight](self, "_combinedLabelHeight");
  if (v6 <= v7)
  {
    v9 = 0;
  }
  else
  {
    -[OBBulletedListItem stackViewLeadingConstraintVertical](self, "stackViewLeadingConstraintVertical");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isActive") & 1) != 0)
    {
      v9 = 0;
    }
    else
    {
      -[OBBulletedListItem topConstraintToImageContainer](self, "topConstraintToImageContainer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v10, "isActive") ^ 1;

    }
  }
  -[OBBulletedListItem _combinedLabelHeight](self, "_combinedLabelHeight");
  if (v6 <= v11)
  {
    -[OBBulletedListItem stackViewLeadingConstraintVertical](self, "stackViewLeadingConstraintVertical");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "isActive") & 1) != 0)
    {
      v12 = 0;
    }
    else
    {
      -[OBBulletedListItem topConstraintToStackView](self, "topConstraintToStackView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v14, "isActive") ^ 1;

    }
  }
  else
  {
    v12 = 0;
  }
  -[OBBulletedListItem stackViewLeadingConstraintVertical](self, "stackViewLeadingConstraintVertical");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "isActive"))
  {
    -[OBBulletedListItem topConstraintToStackView](self, "topConstraintToStackView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isActive") ^ 1;

  }
  else
  {
    v17 = 0;
  }

  if (((v9 | v12) & 1) != 0 || v17)
    -[OBBulletedListItem setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (double)imageSizeForImage:(id)a3
{
  return 40.0;
}

- (BOOL)shouldLayoutVertically
{
  return +[OBViewUtilities shouldUseAccessibilityLayout](OBViewUtilities, "shouldUseAccessibilityLayout");
}

- (NSArray)imageContainerSizeConstraints
{
  NSArray *imageContainerSizeConstraints;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSArray *v10;
  NSArray *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  imageContainerSizeConstraints = self->_imageContainerSizeConstraints;
  if (!imageContainerSizeConstraints)
  {
    -[OBBulletedListItem imageContainer](self, "imageContainer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "widthAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "constraintEqualToConstant:", 40.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v6;
    -[OBBulletedListItem imageContainer](self, "imageContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "heightAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToConstant:", 40.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v11 = self->_imageContainerSizeConstraints;
    self->_imageContainerSizeConstraints = v10;

    imageContainerSizeConstraints = self->_imageContainerSizeConstraints;
  }
  return imageContainerSizeConstraints;
}

- (void)_updateImageViewLayout
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
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
  double v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
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
  id v55;
  id v56;
  _QWORD v57[8];

  v57[6] = *MEMORY[0x1E0C80C00];
  -[OBBulletedListItem imageContainer](self, "imageContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[OBBulletedListItem imageView](self, "imageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBBulletedListItem imageSizeForImage:](self, "imageSizeForImage:", v5);
  v7 = v6;

  if (-[OBBulletedListItem shouldLayoutVertically](self, "shouldLayoutVertically"))
  {
    -[OBBulletedListItem stackView](self, "stackView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBBulletedListItem imageContainer](self, "imageContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "insertArrangedSubview:atIndex:", v9, 0);

    -[OBBulletedListItem stackView](self, "stackView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBBulletedListItem _imageTextPadding](self, "_imageTextPadding");
    v12 = v11;
    -[OBBulletedListItem imageContainer](self, "imageContainer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCustomSpacing:afterView:", v13, v12);

    -[OBBulletedListItem stackViewLeadingConstraintVertical](self, "stackViewLeadingConstraintVertical");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      -[OBBulletedListItem stackView](self, "stackView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "leadingAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBBulletedListItem leadingAnchor](self, "leadingAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "constraintEqualToAnchor:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBBulletedListItem setStackViewLeadingConstraintVertical:](self, "setStackViewLeadingConstraintVertical:", v18);

    }
    -[OBBulletedListItem stackViewLeadingConstraintHorizontal](self, "stackViewLeadingConstraintHorizontal");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setActive:", 0);

    -[OBBulletedListItem stackViewLeadingConstraintVertical](self, "stackViewLeadingConstraintVertical");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setActive:", 1);

    v21 = (void *)MEMORY[0x1E0CB3718];
    -[OBBulletedListItem imageContainerSizeConstraints](self, "imageContainerSizeConstraints");
    v55 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "activateConstraints:");

  }
  else
  {
    -[OBBulletedListItem imageContainer](self, "imageContainer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBBulletedListItem addSubview:](self, "addSubview:", v22);

    -[OBBulletedListItem stackViewLeadingConstraintHorizontal](self, "stackViewLeadingConstraintHorizontal");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v23)
    {
      -[OBBulletedListItem stackView](self, "stackView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "leadingAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBBulletedListItem imageContainer](self, "imageContainer");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "trailingAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBBulletedListItem _imageTextPadding](self, "_imageTextPadding");
      objc_msgSend(v25, "constraintEqualToAnchor:constant:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBBulletedListItem setStackViewLeadingConstraintHorizontal:](self, "setStackViewLeadingConstraintHorizontal:", v28);

    }
    v29 = (void *)MEMORY[0x1E0CB3718];
    -[OBBulletedListItem imageContainerSizeConstraints](self, "imageContainerSizeConstraints");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "deactivateConstraints:", v30);

    -[OBBulletedListItem stackViewLeadingConstraintHorizontal](self, "stackViewLeadingConstraintHorizontal");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setActive:", 1);

    -[OBBulletedListItem stackViewLeadingConstraintVertical](self, "stackViewLeadingConstraintVertical");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setActive:", 0);

    v47 = (void *)MEMORY[0x1E0CB3718];
    -[OBBulletedListItem topConstraintToImageContainer](self, "topConstraintToImageContainer");
    v56 = (id)objc_claimAutoreleasedReturnValue();
    v57[0] = v56;
    -[OBBulletedListItem bottomConstraintToImageContainer](self, "bottomConstraintToImageContainer");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v57[1] = v54;
    -[OBBulletedListItem imageContainer](self, "imageContainer");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "widthAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToConstant:", v7);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v57[2] = v51;
    -[OBBulletedListItem leadingAnchor](self, "leadingAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBBulletedListItem imageContainer](self, "imageContainer");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "leadingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBBulletedListItem leadingMargins](self, "leadingMargins");
    objc_msgSend(v49, "constraintEqualToAnchor:constant:", v48, -v33);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v57[3] = v46;
    -[OBBulletedListItem imageContainer](self, "imageContainer");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "trailingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBBulletedListItem stackView](self, "stackView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "leadingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBBulletedListItem _imageTextPadding](self, "_imageTextPadding");
    objc_msgSend(v34, "constraintEqualToAnchor:constant:", v36, -v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v57[4] = v38;
    -[OBBulletedListItem stackView](self, "stackView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "centerYAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBBulletedListItem imageContainer](self, "imageContainer");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "centerYAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v57[5] = v43;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 6);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "activateConstraints:", v44);

  }
}

- (double)_horizontalMargins
{
  BOOL v2;
  double result;
  void *v4;
  unint64_t v5;

  v2 = -[OBBulletedListItem shouldLayoutVertically](self, "shouldLayoutVertically");
  result = 0.0;
  if (!v2)
  {
    +[OBDevice currentDevice](OBDevice, "currentDevice", 0.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "templateType");

    result = 10.0;
    if (v5 <= 0xA)
      return dbl_19A01F378[v5];
  }
  return result;
}

- (id)_descriptionFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
}

- (id)_titleFont
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[OBBulletedListItem descriptionLabel](self, "descriptionLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4B10]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fontDescriptorWithSymbolicTraits:", 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v5, 0.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[OBBulletedListItem _descriptionFont](self, "_descriptionFont");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)OBBulletedListItem;
  -[OBBulletedListItem updateConstraints](&v23, sel_updateConstraints);
  -[OBBulletedListItem topConstraintToStackView](self, "topConstraintToStackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setActive:", 0);

  -[OBBulletedListItem bottomConstraintToStackView](self, "bottomConstraintToStackView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActive:", 0);

  -[OBBulletedListItem imageView](self, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBBulletedListItem imageSizeForImage:](self, "imageSizeForImage:", v6);
  v8 = v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBBulletedListItem _combinedLabelHeight](self, "_combinedLabelHeight");
  if (v8 <= v11
    || (-[OBBulletedListItem stackViewLeadingConstraintVertical](self, "stackViewLeadingConstraintVertical"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "isActive"),
        v12,
        (v13 & 1) != 0))
  {
    -[OBBulletedListItem topConstraintToImageContainer](self, "topConstraintToImageContainer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v14);

    -[OBBulletedListItem bottomConstraintToImageContainer](self, "bottomConstraintToImageContainer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v15);

    -[OBBulletedListItem topConstraintToStackView](self, "topConstraintToStackView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v16);

    -[OBBulletedListItem bottomConstraintToStackView](self, "bottomConstraintToStackView");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[OBBulletedListItem topConstraintToStackView](self, "topConstraintToStackView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v18);

    -[OBBulletedListItem bottomConstraintToStackView](self, "bottomConstraintToStackView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v19);

    -[OBBulletedListItem imageContainerSizeConstraints](self, "imageContainerSizeConstraints");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v20);

    -[OBBulletedListItem topConstraintToImageContainer](self, "topConstraintToImageContainer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v21);

    -[OBBulletedListItem bottomConstraintToImageContainer](self, "bottomConstraintToImageContainer");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v17;
  objc_msgSend(v10, "addObject:", v17);

  objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", v9);
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v10);

}

- (double)_combinedLabelHeight
{
  void *v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;

  -[OBBulletedListItem titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBBulletedListItem bounds](self, "bounds");
  objc_msgSend(v3, "systemLayoutSizeFittingSize:", v4, 0.0);
  v6 = v5;
  -[OBBulletedListItem descriptionLabel](self, "descriptionLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBBulletedListItem bounds](self, "bounds");
  objc_msgSend(v7, "systemLayoutSizeFittingSize:", v8, 0.0);
  v10 = v6 + v9;

  return v10;
}

- (double)_imageTextPadding
{
  return 14.0;
}

- (UIView)imageContainer
{
  return self->_imageContainer;
}

- (void)setImageContainer:(id)a3
{
  objc_storeStrong((id *)&self->_imageContainer, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionLabel, a3);
}

- (NSLayoutConstraint)stackViewLeadingConstraintVertical
{
  return self->_stackViewLeadingConstraintVertical;
}

- (void)setStackViewLeadingConstraintVertical:(id)a3
{
  objc_storeStrong((id *)&self->_stackViewLeadingConstraintVertical, a3);
}

- (NSLayoutConstraint)stackViewLeadingConstraintHorizontal
{
  return self->_stackViewLeadingConstraintHorizontal;
}

- (void)setStackViewLeadingConstraintHorizontal:(id)a3
{
  objc_storeStrong((id *)&self->_stackViewLeadingConstraintHorizontal, a3);
}

- (UIButton)accessoryButton
{
  return self->_accessoryButton;
}

- (void)setAccessoryButton:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryButton, a3);
}

- (void)setImageContainerSizeConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_imageContainerSizeConstraints, a3);
}

- (NSLayoutConstraint)topConstraintToStackView
{
  return self->_topConstraintToStackView;
}

- (void)setTopConstraintToStackView:(id)a3
{
  objc_storeStrong((id *)&self->_topConstraintToStackView, a3);
}

- (NSLayoutConstraint)bottomConstraintToStackView
{
  return self->_bottomConstraintToStackView;
}

- (void)setBottomConstraintToStackView:(id)a3
{
  objc_storeStrong((id *)&self->_bottomConstraintToStackView, a3);
}

- (NSLayoutConstraint)topConstraintToImageContainer
{
  return self->_topConstraintToImageContainer;
}

- (void)setTopConstraintToImageContainer:(id)a3
{
  objc_storeStrong((id *)&self->_topConstraintToImageContainer, a3);
}

- (NSLayoutConstraint)bottomConstraintToImageContainer
{
  return self->_bottomConstraintToImageContainer;
}

- (void)setBottomConstraintToImageContainer:(id)a3
{
  objc_storeStrong((id *)&self->_bottomConstraintToImageContainer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomConstraintToImageContainer, 0);
  objc_storeStrong((id *)&self->_topConstraintToImageContainer, 0);
  objc_storeStrong((id *)&self->_bottomConstraintToStackView, 0);
  objc_storeStrong((id *)&self->_topConstraintToStackView, 0);
  objc_storeStrong((id *)&self->_imageContainerSizeConstraints, 0);
  objc_storeStrong((id *)&self->_accessoryButton, 0);
  objc_storeStrong((id *)&self->_stackViewLeadingConstraintHorizontal, 0);
  objc_storeStrong((id *)&self->_stackViewLeadingConstraintVertical, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_imageContainer, 0);
}

@end
