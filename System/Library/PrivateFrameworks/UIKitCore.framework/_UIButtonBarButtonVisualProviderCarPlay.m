@implementation _UIButtonBarButtonVisualProviderCarPlay

- (id)contentView
{
  void *v3;
  void *v4;

  -[_UIButtonBarButtonVisualProviderCarPlay imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[_UIButtonBarButtonVisualProviderCarPlay imageView](self, "imageView");
  else
    -[_UIButtonBarButtonVisualProviderCarPlay titleView](self, "titleView");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)configureButton:(id)a3 withAppearanceDelegate:(id)a4 fromBarItem:(id)a5
{
  id v8;
  id v9;

  v9 = a3;
  v8 = a5;
  -[_UIButtonBarButtonVisualProviderCarPlay setAppearanceDelegate:](self, "setAppearanceDelegate:", a4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[_UIButtonBarButtonVisualProviderCarPlay configureButton:fromBarButtonItem:](self, "configureButton:fromBarButtonItem:", v9, v8);

}

- (void)configureButton:(id)a3 fromBarButtonItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UIView *v15;
  UIView *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  UIImageView *v27;
  UIImageView *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  UILabel *v36;
  UILabel *v37;
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
  UIImageView *v51;
  void *v52;
  UIImageView *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  double v59;
  void *v60;
  void *v61;
  void *v62;
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
  id v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  unint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  id v108;
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
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  _QWORD v130[7];
  _QWORD v131[12];

  v131[10] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0D156E0];
  -[_UIButtonBarButtonVisualProviderCarPlay buttonConstraints](self, "buttonConstraints");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deactivateConstraints:", v9);

  -[_UIButtonBarButtonVisualProviderCarPlay backView](self, "backView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeFromSuperview");

  -[_UIButtonBarButtonVisualProviderCarPlay imageView](self, "imageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeFromSuperview");

  -[_UIButtonBarButtonVisualProviderCarPlay titleView](self, "titleView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeFromSuperview");

  -[_UIButtonBarButtonVisualProviderCarPlay focusedView](self, "focusedView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeFromSuperview");

  -[_UIButtonBarButtonVisualProviderCarPlay setBackViewToContentConstraint:](self, "setBackViewToContentConstraint:", 0);
  -[_UIButtonBarButtonVisualProviderCarPlay focusedView](self, "focusedView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v15 = [UIView alloc];
    v16 = -[UIView initWithFrame:](v15, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[_UIButtonBarButtonVisualProviderCarPlay setFocusedView:](self, "setFocusedView:", v16);

    -[_UIButtonBarButtonVisualProviderCarPlay focusedView](self, "focusedView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[_UIButtonBarButtonVisualProviderCarPlay focusedView](self, "focusedView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setCornerRadius:", 4.5);

    v20 = *MEMORY[0x1E0CD2A68];
    -[_UIButtonBarButtonVisualProviderCarPlay focusedView](self, "focusedView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setCornerCurve:", v20);

    -[_UIButtonBarButtonVisualProviderCarPlay focusedView](self, "focusedView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setUserInteractionEnabled:", 0);

  }
  -[_UIButtonBarButtonVisualProviderCarPlay focusedView](self, "focusedView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v24);

  objc_msgSend(v7, "_imageForState:compact:type:", 0, 0, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    -[_UIButtonBarButtonVisualProviderCarPlay imageView](self, "imageView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v26)
    {
      v27 = [UIImageView alloc];
      v28 = -[UIImageView initWithFrame:](v27, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      -[_UIButtonBarButtonVisualProviderCarPlay setImageView:](self, "setImageView:", v28);

      -[_UIButtonBarButtonVisualProviderCarPlay imageView](self, "imageView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      +[UIColor _carSystemFocusColor](UIColor, "_carSystemFocusColor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIButtonBarButtonVisualProviderCarPlay imageView](self, "imageView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setTintColor:", v30);

      -[_UIButtonBarButtonVisualProviderCarPlay imageView](self, "imageView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setUserInteractionEnabled:", 0);

    }
    -[_UIButtonBarButtonVisualProviderCarPlay imageView](self, "imageView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setImage:", v25);

    -[_UIButtonBarButtonVisualProviderCarPlay imageView](self, "imageView");
    v34 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_UIButtonBarButtonVisualProviderCarPlay titleView](self, "titleView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v35)
    {
      v36 = [UILabel alloc];
      v37 = -[UILabel initWithFrame:](v36, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      -[_UIButtonBarButtonVisualProviderCarPlay setTitleView:](self, "setTitleView:", v37);

      -[_UIButtonBarButtonVisualProviderCarPlay titleView](self, "titleView");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      objc_msgSend(off_1E167A828, "preferredFontForTextStyle:", CFSTR("UICTFontTextStyleCallout"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIButtonBarButtonVisualProviderCarPlay titleView](self, "titleView");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setFont:", v39);

      -[_UIButtonBarButtonVisualProviderCarPlay titleView](self, "titleView");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setAdjustsFontForContentSizeCategory:", 1);

      +[UIColor _carSystemFocusColor](UIColor, "_carSystemFocusColor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIButtonBarButtonVisualProviderCarPlay titleView](self, "titleView");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setTextColor:", v42);

      -[_UIButtonBarButtonVisualProviderCarPlay titleView](self, "titleView");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setUserInteractionEnabled:", 0);

    }
    objc_msgSend(v7, "resolvedTitle");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIButtonBarButtonVisualProviderCarPlay titleView](self, "titleView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setText:", v45);

    -[_UIButtonBarButtonVisualProviderCarPlay titleView](self, "titleView");
    v34 = objc_claimAutoreleasedReturnValue();
  }
  v47 = (void *)v34;
  objc_msgSend(v6, "addSubview:", v34);

  if ((objc_msgSend(v6, "isBackButton") & 1) != 0 || objc_msgSend(v7, "_showsChevron"))
  {
    v107 = v25;
    -[_UIButtonBarButtonVisualProviderCarPlay backView](self, "backView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v48)
    {
      objc_msgSend(off_1E167A828, "_preferredFontForTextStyle:variant:", CFSTR("UICTFontTextStyleCallout"), 1024);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIImageSymbolConfiguration configurationWithFont:scale:](UIImageSymbolConfiguration, "configurationWithFont:scale:", v49, 2);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = [UIImageView alloc];
      +[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("chevron.backward.circle.fill"), v50);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = -[UIImageView initWithImage:](v51, "initWithImage:", v52);
      -[_UIButtonBarButtonVisualProviderCarPlay setBackView:](self, "setBackView:", v53);

      -[_UIButtonBarButtonVisualProviderCarPlay backView](self, "backView");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      +[UIColor _carSystemFocusColor](UIColor, "_carSystemFocusColor");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIButtonBarButtonVisualProviderCarPlay backView](self, "backView");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "setTintColor:", v55);

      -[_UIButtonBarButtonVisualProviderCarPlay backView](self, "backView");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "setUserInteractionEnabled:", 0);

      -[_UIButtonBarButtonVisualProviderCarPlay backView](self, "backView");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v59) = 1148846080;
      objc_msgSend(v58, "setContentCompressionResistancePriority:forAxis:", 0, v59);

    }
    -[_UIButtonBarButtonVisualProviderCarPlay backView](self, "backView");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v60);

    -[_UIButtonBarButtonVisualProviderCarPlay _setupAlternateTitlesFromBarButtonItem:](self, "_setupAlternateTitlesFromBarButtonItem:", v7);
    objc_msgSend(v6, "widthAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintGreaterThanOrEqualToConstant:", 44.0);
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v63) = 1148846080;
    v64 = v62;
    v106 = v62;
    objc_msgSend(v62, "setPriority:", v63);
    -[_UIButtonBarButtonVisualProviderCarPlay contentView](self, "contentView");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "leadingAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIButtonBarButtonVisualProviderCarPlay backView](self, "backView");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "trailingAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "constraintEqualToAnchor:constant:", v68, 3.0);
    v108 = v7;
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIButtonBarButtonVisualProviderCarPlay setBackViewToContentConstraint:](self, "setBackViewToContentConstraint:", v69);

    v131[0] = v64;
    -[_UIButtonBarButtonVisualProviderCarPlay backView](self, "backView");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "firstBaselineAnchor");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "topAnchor");
    v102 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "constraintEqualToAnchor:constant:", v102, 28.0);
    v103 = objc_claimAutoreleasedReturnValue();
    v131[1] = v103;
    -[_UIButtonBarButtonVisualProviderCarPlay backView](self, "backView");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "leadingAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "leadingAnchor");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    v128 = v70;
    objc_msgSend(v70, "constraintEqualToAnchor:constant:", v127, 12.0);
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    v131[2] = v126;
    -[_UIButtonBarButtonVisualProviderCarPlay contentView](self, "contentView");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "firstBaselineAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "topAnchor");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = v71;
    objc_msgSend(v71, "constraintEqualToAnchor:constant:", v123, 28.0);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    v131[3] = v122;
    -[_UIButtonBarButtonVisualProviderCarPlay backViewToContentConstraint](self, "backViewToContentConstraint");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    v131[4] = v121;
    -[_UIButtonBarButtonVisualProviderCarPlay contentView](self, "contentView");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "trailingAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "trailingAnchor");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v119 = v72;
    objc_msgSend(v72, "constraintEqualToAnchor:constant:", v118, -12.0);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v131[5] = v117;
    -[_UIButtonBarButtonVisualProviderCarPlay focusedView](self, "focusedView");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "topAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "topAnchor");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = v73;
    objc_msgSend(v73, "constraintEqualToAnchor:constant:", v114, 5.0);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v131[6] = v113;
    -[_UIButtonBarButtonVisualProviderCarPlay focusedView](self, "focusedView");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "leadingAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "leadingAnchor");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v111 = v74;
    objc_msgSend(v74, "constraintEqualToAnchor:constant:", v110, 5.0);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v131[7] = v109;
    -[_UIButtonBarButtonVisualProviderCarPlay focusedView](self, "focusedView");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "trailingAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "trailingAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "constraintEqualToAnchor:constant:", v76, -5.0);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v131[8] = v77;
    -[_UIButtonBarButtonVisualProviderCarPlay focusedView](self, "focusedView");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "bottomAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bottomAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "constraintEqualToAnchor:constant:", v80, -5.0);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v131[9] = v81;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v131, 10);
    v82 = v6;
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIButtonBarButtonVisualProviderCarPlay setButtonConstraints:](self, "setButtonConstraints:", v83);

    v6 = v82;
    v7 = v108;

    v84 = (void *)v102;
    v85 = v104;

    v86 = (void *)v103;
    v87 = v106;

    v88 = v105;
    v89 = 0x1E0D15000;
    v25 = v107;
  }
  else
  {
    if (v25 && (objc_msgSend(v25, "hasBaseline") & 1) == 0)
    {
      -[_UIButtonBarButtonVisualProviderCarPlay contentView](self, "contentView");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "centerYAnchor");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "centerYAnchor");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "constraintEqualToAnchor:", v92);
      v93 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[_UIButtonBarButtonVisualProviderCarPlay contentView](self, "contentView");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "firstBaselineAnchor");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "topAnchor");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "constraintEqualToAnchor:constant:", v92, 28.0);
      v93 = objc_claimAutoreleasedReturnValue();
    }
    v87 = (void *)v93;

    -[_UIButtonBarButtonVisualProviderCarPlay contentView](self, "contentView");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "leadingAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "leadingAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "constraintEqualToAnchor:constant:", v84, 12.0);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v130[0] = v86;
    -[_UIButtonBarButtonVisualProviderCarPlay contentView](self, "contentView");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "trailingAnchor");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "trailingAnchor");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    v128 = v94;
    objc_msgSend(v94, "constraintEqualToAnchor:constant:", v127, -12.0);
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    v130[1] = v126;
    v130[2] = v87;
    -[_UIButtonBarButtonVisualProviderCarPlay focusedView](self, "focusedView");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v125, "topAnchor");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "topAnchor");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = v95;
    objc_msgSend(v95, "constraintEqualToAnchor:constant:", v123, 5.0);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    v130[3] = v122;
    -[_UIButtonBarButtonVisualProviderCarPlay focusedView](self, "focusedView");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "leadingAnchor");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "leadingAnchor");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    v120 = v96;
    objc_msgSend(v96, "constraintEqualToAnchor:constant:", v119, 5.0);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v130[4] = v118;
    -[_UIButtonBarButtonVisualProviderCarPlay focusedView](self, "focusedView");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "trailingAnchor");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "trailingAnchor");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = v97;
    objc_msgSend(v97, "constraintEqualToAnchor:constant:", v115, -5.0);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v130[5] = v114;
    -[_UIButtonBarButtonVisualProviderCarPlay focusedView](self, "focusedView");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "bottomAnchor");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bottomAnchor");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = v98;
    objc_msgSend(v98, "constraintEqualToAnchor:constant:", v111, -5.0);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v130[6] = v110;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v130, 7);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIButtonBarButtonVisualProviderCarPlay setButtonConstraints:](self, "setButtonConstraints:");
    v89 = 0x1E0D15000uLL;
  }

  v99 = *(void **)(v89 + 1760);
  -[_UIButtonBarButtonVisualProviderCarPlay buttonConstraints](self, "buttonConstraints");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "activateConstraints:", v100);

}

- (void)buttonLayoutSubviews:(id)a3 baseImplementation:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  id WeakRetained;
  double v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  __CFString *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  unint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void (**v28)(void);

  v28 = (void (**)(void))a4;
  -[_UIButtonBarButtonVisualProviderCarPlay titleAlternatives](self, "titleAlternatives");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    -[_UIButtonBarButtonVisualProviderCarPlay titleView](self, "titleView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_nsis_bounds");
    v9 = v8;

    WeakRetained = objc_loadWeakRetained((id *)&self->_appearanceDelegate);
    objc_msgSend(WeakRetained, "backButtonMaximumWidth");
    v12 = v11;

    if (v9 >= v12)
      v13 = v12;
    else
      v13 = v9;
    if (v12 > 0.0)
      v9 = v13;
    -[_UIButtonBarButtonVisualProviderCarPlay titleAlternatives](self, "titleAlternatives");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (!v15)
      goto LABEL_14;
    v16 = 0;
    v17 = &stru_1E16EDF20;
    do
    {
      -[_UIButtonBarButtonVisualProviderCarPlay titleAlternatives](self, "titleAlternatives");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectAtIndexedSubscript:", v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "width");
      if (v20 <= v9)
        break;

      ++v16;
      -[_UIButtonBarButtonVisualProviderCarPlay titleAlternatives](self, "titleAlternatives");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "count");

    }
    while (v16 < v22);
    if (v19)
    {
      objc_msgSend(v19, "title");
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
LABEL_14:
      v17 = &stru_1E16EDF20;
    }
    v23 = -[__CFString length](v17, "length");
    -[_UIButtonBarButtonVisualProviderCarPlay backViewToContentConstraint](self, "backViewToContentConstraint");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    v26 = 3.0;
    if (!v23)
      v26 = 0.0;
    objc_msgSend(v24, "setConstant:", v26);

    -[_UIButtonBarButtonVisualProviderCarPlay titleView](self, "titleView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setText:", v17);

  }
  v28[2]();

}

- (void)updateButton:(id)a3 forFocusedState:(BOOL)a4
{
  _BOOL4 v4;
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
  id v18;

  v4 = a4;
  -[_UIButtonBarButtonVisualProviderCarPlay backView](self, "backView", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[UIColor _carSystemFocusLabelColor](UIColor, "_carSystemFocusLabelColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTintColor:", v7);

    -[_UIButtonBarButtonVisualProviderCarPlay imageView](self, "imageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIColor _carSystemFocusLabelColor](UIColor, "_carSystemFocusLabelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTintColor:", v9);

    +[UIColor _carSystemFocusLabelColor](UIColor, "_carSystemFocusLabelColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIButtonBarButtonVisualProviderCarPlay titleView](self, "titleView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTextColor:", v10);

    +[UIColor _carSystemFocusColor](UIColor, "_carSystemFocusColor");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    -[_UIButtonBarButtonVisualProviderCarPlay focusedView](self, "focusedView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBackgroundColor:", v18);

  }
  else
  {
    +[UIColor _carSystemFocusColor](UIColor, "_carSystemFocusColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTintColor:", v13);

    -[_UIButtonBarButtonVisualProviderCarPlay imageView](self, "imageView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIColor _carSystemFocusColor](UIColor, "_carSystemFocusColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTintColor:", v15);

    +[UIColor _carSystemFocusColor](UIColor, "_carSystemFocusColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIButtonBarButtonVisualProviderCarPlay titleView](self, "titleView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTextColor:", v16);

    -[_UIButtonBarButtonVisualProviderCarPlay focusedView](self, "focusedView");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setBackgroundColor:", 0);
  }

}

- (void)updateButton:(id)a3 forHighlightedState:(BOOL)a4
{
  double v4;

  v4 = 0.2;
  if (!a4)
    v4 = 1.0;
  objc_msgSend(a3, "setAlpha:", v4);
}

- (BOOL)supportsBackButtons
{
  return 1;
}

- (id)_titleAlternativeForTitle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[_UIButtonBarButtonVisualProviderCarPlay titleAlterntativeLookup](self, "titleAlterntativeLookup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIButtonBarButtonVisualProviderCarPlay titleView](self, "titleView");
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateWithLabel:", v7);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[_CarTitleAlternative alternativeWithTitle:label:](_CarTitleAlternative, "alternativeWithTitle:label:", v4, v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIButtonBarButtonVisualProviderCarPlay titleAlterntativeLookup](self, "titleAlterntativeLookup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v4);
  }

  return v6;
}

- (void)_setupAlternateTitlesFromBarButtonItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_UIButtonBarButtonVisualProviderCarPlay contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIButtonBarButtonVisualProviderCarPlay titleView](self, "titleView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {
    objc_msgSend(v4, "_backButtonAlternateTitles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "count"))
    {
      -[_UIButtonBarButtonVisualProviderCarPlay setTitleAlternatives:](self, "setTitleAlternatives:", 0);
      -[_UIButtonBarButtonVisualProviderCarPlay setTitleAlterntativeLookup:](self, "setTitleAlterntativeLookup:", 0);
      goto LABEL_23;
    }
    v8 = (void *)objc_opt_new();
    objc_msgSend(v4, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIButtonBarButtonVisualProviderCarPlay titleAlterntativeLookup](self, "titleAlterntativeLookup");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      if (v9)
      {
LABEL_6:
        -[_UIButtonBarButtonVisualProviderCarPlay _titleAlternativeForTitle:](self, "_titleAlternativeForTitle:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v11);
        objc_msgSend(v11, "width");
        v13 = v12;

        goto LABEL_10;
      }
    }
    else
    {
      v14 = (void *)objc_opt_new();
      -[_UIButtonBarButtonVisualProviderCarPlay setTitleAlterntativeLookup:](self, "setTitleAlterntativeLookup:", v14);

      if (v9)
        goto LABEL_6;
    }
    v13 = 1.79769313e308;
LABEL_10:
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v41 = v7;
    v15 = v7;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v43 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          -[_UIButtonBarButtonVisualProviderCarPlay _titleAlternativeForTitle:](self, "_titleAlternativeForTitle:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "width");
          if (v22 < v13 && (objc_msgSend(v20, "isEqualToString:", v9) & 1) == 0)
            objc_msgSend(v8, "addObject:", v21);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      }
      while (v17);
    }

    v23 = (void *)objc_msgSend(v8, "copy");
    -[_UIButtonBarButtonVisualProviderCarPlay setTitleAlternatives:](self, "setTitleAlternatives:", v23);

    -[_UIButtonBarButtonVisualProviderCarPlay titleAlternatives](self, "titleAlternatives");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "count");

    v7 = v41;
    if (v25 > (v9 != 0))
    {
      -[_UIButtonBarButtonVisualProviderCarPlay titleView](self, "titleView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v27) = 1132068864;
      objc_msgSend(v26, "setContentCompressionResistancePriority:forAxis:", 0, v27);

      -[_UIButtonBarButtonVisualProviderCarPlay titleAlternatives](self, "titleAlternatives");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "firstObject");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "width");
      v31 = v30;

      -[_UIButtonBarButtonVisualProviderCarPlay maxTitleViewWidthConstraint](self, "maxTitleViewWidthConstraint");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32)
      {
        -[_UIButtonBarButtonVisualProviderCarPlay maxTitleViewWidthConstraint](self, "maxTitleViewWidthConstraint");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setConstant:", v31);
      }
      else
      {
        -[_UIButtonBarButtonVisualProviderCarPlay titleView](self, "titleView");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "widthAnchor");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "constraintLessThanOrEqualToConstant:", v31);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIButtonBarButtonVisualProviderCarPlay setMaxTitleViewWidthConstraint:](self, "setMaxTitleViewWidthConstraint:", v40);

      }
      -[_UIButtonBarButtonVisualProviderCarPlay maxTitleViewWidthConstraint](self, "maxTitleViewWidthConstraint");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v36;
      v38 = 1;
      goto LABEL_26;
    }
LABEL_23:
    -[_UIButtonBarButtonVisualProviderCarPlay titleView](self, "titleView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v35) = 1144913920;
    objc_msgSend(v34, "setContentCompressionResistancePriority:forAxis:", 0, v35);

    -[_UIButtonBarButtonVisualProviderCarPlay maxTitleViewWidthConstraint](self, "maxTitleViewWidthConstraint");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v36;
    v38 = 0;
LABEL_26:
    objc_msgSend(v36, "setActive:", v38);

    goto LABEL_27;
  }
  -[_UIButtonBarButtonVisualProviderCarPlay setTitleAlternatives:](self, "setTitleAlternatives:", 0);
  -[_UIButtonBarButtonVisualProviderCarPlay setTitleAlterntativeLookup:](self, "setTitleAlterntativeLookup:", 0);
LABEL_27:

}

- (_UIButtonBarAppearanceDelegate)appearanceDelegate
{
  return (_UIButtonBarAppearanceDelegate *)objc_loadWeakRetained((id *)&self->_appearanceDelegate);
}

- (void)setAppearanceDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_appearanceDelegate, a3);
}

- (UIView)focusedView
{
  return self->_focusedView;
}

- (void)setFocusedView:(id)a3
{
  objc_storeStrong((id *)&self->_focusedView, a3);
}

- (UIImageView)backView
{
  return self->_backView;
}

- (void)setBackView:(id)a3
{
  objc_storeStrong((id *)&self->_backView, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UILabel)titleView
{
  return self->_titleView;
}

- (void)setTitleView:(id)a3
{
  objc_storeStrong((id *)&self->_titleView, a3);
}

- (NSArray)titleAlternatives
{
  return self->_titleAlternatives;
}

- (void)setTitleAlternatives:(id)a3
{
  objc_storeStrong((id *)&self->_titleAlternatives, a3);
}

- (NSMutableDictionary)titleAlterntativeLookup
{
  return self->_titleAlterntativeLookup;
}

- (void)setTitleAlterntativeLookup:(id)a3
{
  objc_storeStrong((id *)&self->_titleAlterntativeLookup, a3);
}

- (NSArray)buttonConstraints
{
  return self->_buttonConstraints;
}

- (void)setButtonConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_buttonConstraints, a3);
}

- (NSLayoutConstraint)maxTitleViewWidthConstraint
{
  return self->_maxTitleViewWidthConstraint;
}

- (void)setMaxTitleViewWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_maxTitleViewWidthConstraint, a3);
}

- (NSLayoutConstraint)backViewToContentConstraint
{
  return self->_backViewToContentConstraint;
}

- (void)setBackViewToContentConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_backViewToContentConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backViewToContentConstraint, 0);
  objc_storeStrong((id *)&self->_maxTitleViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_buttonConstraints, 0);
  objc_storeStrong((id *)&self->_titleAlterntativeLookup, 0);
  objc_storeStrong((id *)&self->_titleAlternatives, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_backView, 0);
  objc_storeStrong((id *)&self->_focusedView, 0);
  objc_destroyWeak((id *)&self->_appearanceDelegate);
}

@end
