@implementation CACBannerView

- (CACBannerView)initWithFrame:(CGRect)a3
{
  CACBannerView *v3;
  void *v4;
  NSString *v5;
  BOOL IsAccessibilityCategory;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  double v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  uint64_t v40;
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
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  CACBannerView *v64;
  void *v65;
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
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  objc_super v138;
  _QWORD v139[21];

  v139[19] = *MEMORY[0x24BDAC8D0];
  v138.receiver = self;
  v138.super_class = (Class)CACBannerView;
  v3 = -[CACBannerView initWithFrame:](&v138, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v5);

    v7 = (_QWORD *)MEMORY[0x24BEBE1D0];
    if (IsAccessibilityCategory)
    {
      objc_msgSend(MEMORY[0x24BEBD5E0], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEBD5E0], "systemFontOfSize:weight:", 14.0, *MEMORY[0x24BEBE260]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "scaledFontForFont:", v10);
      v8 = objc_claimAutoreleasedReturnValue();

    }
    if (initWithFrame__onceToken != -1)
      dispatch_once(&initWithFrame__onceToken, &__block_literal_global_4);
    objc_msgSend((id)initWithFrame__sSizingLabel, "font");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqual:", v8);

    if ((v12 & 1) == 0)
      objc_msgSend((id)initWithFrame__sSizingLabel, "setFont:", v8);
    -[CACBannerView traitCollection](v3, "traitCollection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "userInterfaceIdiom");

    if (v14 == 3)
      v15 = 10.0;
    else
      v15 = 13.0;
    v16 = (void *)objc_opt_new();
    objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBackgroundColor:", v17);

    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v19 = objc_msgSend(v18, "CGColor");
    objc_msgSend(v16, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setShadowColor:", v19);

    objc_msgSend(v16, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0.0;
    objc_msgSend(v21, "setShadowOffset:", 0.0, 5.0);

    objc_msgSend(v16, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v24) = 1045220557;
    objc_msgSend(v23, "setShadowOpacity:", v24);

    objc_msgSend(v16, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setShadowRadius:", 10.0);

    objc_msgSend(v16, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setMasksToBounds:", 0);

    -[CACBannerView addSubview:](v3, "addSubview:", v16);
    -[CACBannerView setBaseView:](v3, "setBaseView:", v16);
    objc_msgSend(MEMORY[0x24BEBD428], "effectWithStyle:", 1200);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB38]), "initWithEffect:", v27);
    objc_msgSend(v28, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v28, "layer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setCornerRadius:", v15);

    v30 = *MEMORY[0x24BDE58E8];
    objc_msgSend(v28, "layer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setCornerCurve:", v30);

    objc_msgSend(v28, "layer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setMasksToBounds:", 1);

    objc_msgSend(v16, "addSubview:", v28);
    v33 = objc_alloc(MEMORY[0x24BEBDB38]);
    v136 = (void *)v27;
    objc_msgSend(MEMORY[0x24BEBDAF0], "_effectForBlurEffect:vibrancyStyle:", v27, 102);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)objc_msgSend(v33, "initWithEffect:", v34);

    objc_msgSend(v35, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v28, "contentView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addSubview:", v35);

    v37 = objc_alloc_init(MEMORY[0x24BEBD708]);
    objc_msgSend(v37, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v37, "setFont:", v8);
    objc_msgSend(v37, "setNumberOfLines:", 0);
    objc_msgSend(v37, "setTextAlignment:", 4);
    objc_msgSend(v35, "contentView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addSubview:", v37);

    v39 = v37;
    -[CACBannerView setTextLabel:](v3, "setTextLabel:", v37);
    objc_msgSend(MEMORY[0x24BEBD660], "configurationWithTextStyle:scale:", *v7, 2);
    v40 = objc_claimAutoreleasedReturnValue();
    -[CACBannerView symbolImage](v3, "symbolImage");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
    {
      v42 = (void *)MEMORY[0x24BEBD640];
      -[CACBannerView symbolImage](v3, "symbolImage");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "systemImageNamed:", v43);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v137 = (void *)v8;
    v134 = v41;
    v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v41);
    objc_msgSend(v44, "setPreferredSymbolConfiguration:", v40);
    objc_msgSend(v44, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v44, "setContentMode:", 2);
    v135 = (void *)v40;
    objc_msgSend(v44, "setPreferredSymbolConfiguration:", v40);
    objc_msgSend(v35, "contentView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "addSubview:", v44);

    v133 = v44;
    -[CACBannerView setAccessoryImageView:](v3, "setAccessoryImageView:", v44);
    -[CACBannerView accessoryImageView](v3, "accessoryImageView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "image");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v47)
    {
      objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "scaledValueForValue:", 10.0);
      v22 = v49;

    }
    v50 = v39;
    objc_msgSend(v39, "leadingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACBannerView accessoryImageView](v3, "accessoryImageView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "trailingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:constant:", v53, v22);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACBannerView setImageToTextConstraint:](v3, "setImageToTextConstraint:", v54);

    v104 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v16, "topAnchor");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACBannerView topAnchor](v3, "topAnchor");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "constraintEqualToAnchor:", v131);
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    v139[0] = v130;
    objc_msgSend(v16, "bottomAnchor");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACBannerView bottomAnchor](v3, "bottomAnchor");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "constraintEqualToAnchor:", v128);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    v139[1] = v127;
    objc_msgSend(v16, "centerXAnchor");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACBannerView centerXAnchor](v3, "centerXAnchor");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "constraintEqualToAnchor:", v125);
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    v139[2] = v124;
    objc_msgSend(v16, "widthAnchor");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "constraintGreaterThanOrEqualToConstant:", 24.0);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    v139[3] = v122;
    objc_msgSend(v16, "widthAnchor");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "widthAnchor");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "constraintEqualToAnchor:", v120);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    v139[4] = v119;
    objc_msgSend(v16, "heightAnchor");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "heightAnchor");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "constraintEqualToAnchor:", v117);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    v139[5] = v116;
    objc_msgSend(v28, "contentView");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "widthAnchor");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACBannerView widthAnchor](v3, "widthAnchor");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "constraintLessThanOrEqualToAnchor:", v113);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v139[6] = v112;
    objc_msgSend(v28, "topAnchor");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "topAnchor");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "constraintEqualToAnchor:", v110);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v139[7] = v109;
    objc_msgSend(v28, "leadingAnchor");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "leadingAnchor");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "constraintEqualToAnchor:", v107);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v139[8] = v106;
    objc_msgSend(v28, "contentView");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "trailingAnchor");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "trailingAnchor");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "constraintEqualToAnchor:constant:", v102, 12.0);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v139[9] = v101;
    objc_msgSend(v35, "contentView");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "topAnchor");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "contentView");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "topAnchor");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "constraintEqualToAnchor:", v97);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v139[10] = v95;
    objc_msgSend(v35, "contentView");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "leadingAnchor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "contentView");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "leadingAnchor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "constraintEqualToAnchor:", v88);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v139[11] = v87;
    objc_msgSend(v35, "contentView");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "bottomAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "contentView");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "bottomAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "constraintEqualToAnchor:", v83);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v139[12] = v82;
    objc_msgSend(v35, "contentView");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "trailingAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "contentView");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "trailingAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "constraintEqualToAnchor:", v78);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v139[13] = v77;
    -[CACBannerView accessoryImageView](v3, "accessoryImageView");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "centerYAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "centerYAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "constraintEqualToAnchor:", v74);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v139[14] = v73;
    -[CACBannerView accessoryImageView](v3, "accessoryImageView");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "leadingAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "contentView");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "leadingAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "constraintEqualToAnchor:constant:", v69, 12.0);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v139[15] = v68;
    v55 = v50;
    v92 = v50;
    objc_msgSend(v50, "topAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "contentView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "topAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "constraintEqualToAnchor:constant:", v57, 12.0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v139[16] = v58;
    objc_msgSend(v28, "contentView");
    v96 = v35;
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "bottomAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "bottomAnchor");
    v93 = v28;
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintEqualToAnchor:constant:", v61, 12.0);
    v94 = v16;
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v139[17] = v62;
    -[CACBannerView imageToTextConstraint](v3, "imageToTextConstraint");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v139[18] = v63;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v139, 19);
    v64 = v3;
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "activateConstraints:", v65);

    v3 = v64;
  }
  return v3;
}

uint64_t __31__CACBannerView_initWithFrame___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)initWithFrame__sSizingLabel;
  initWithFrame__sSizingLabel = v0;

  return objc_msgSend((id)initWithFrame__sSizingLabel, "setText:", CFSTR("a"));
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[CACBannerView baseView](self, "baseView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hitTest:withEvent:", v7, x, y);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)hitTest:(CGPoint)a3 forEvent:(__GSEvent *)a4
{
  double y;
  double x;
  void *v7;
  void *v8;

  y = a3.y;
  x = a3.x;
  -[CACBannerView baseView](self, "baseView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hitTest:forEvent:", a4, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CACBannerView textLabel](self, "textLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (void)setAttributedText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CACBannerView textLabel](self, "textLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttributedText:", v4);

}

- (void)setSymbolImage:(id)a3
{
  NSString *v5;
  NSString **p_symbolImage;
  CACBannerView *v7;
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
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v5 = (NSString *)a3;
  p_symbolImage = &self->_symbolImage;
  if (self->_symbolImage != v5)
  {
    v7 = self;
    objc_sync_enter(v7);
    objc_storeStrong((id *)p_symbolImage, a3);
    -[CACBannerView symbolImage](v7, "symbolImage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)MEMORY[0x24BEBD640];
      -[CACBannerView symbolImage](v7, "symbolImage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_systemImageNamed:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }

    -[CACBannerView accessoryImageView](v7, "accessoryImageView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setImage:", v11);

    v13 = (void *)MEMORY[0x24BDD1628];
    -[CACBannerView imageToTextConstraint](v7, "imageToTextConstraint");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "deactivateConstraints:", v15);

    -[CACBannerView accessoryImageView](v7, "accessoryImageView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "image");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "scaledValueForValue:", 10.0);
      v20 = v19;

    }
    else
    {
      v20 = 0.0;
    }

    -[CACBannerView textLabel](v7, "textLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACBannerView accessoryImageView](v7, "accessoryImageView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:constant:", v24, v20);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACBannerView setImageToTextConstraint:](v7, "setImageToTextConstraint:", v25);

    v26 = (void *)MEMORY[0x24BDD1628];
    -[CACBannerView imageToTextConstraint](v7, "imageToTextConstraint");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v27;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v29, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "activateConstraints:", v28);

    objc_sync_exit(v7);
  }

}

- (NSString)text
{
  void *v2;
  void *v3;

  -[CACBannerView textLabel](self, "textLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (NSString)symbolImage
{
  return self->_symbolImage;
}

- (NSLayoutConstraint)imageToTextConstraint
{
  return self->_imageToTextConstraint;
}

- (void)setImageToTextConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_imageToTextConstraint, a3);
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_textLabel, a3);
}

- (UIImageView)accessoryImageView
{
  return self->_accessoryImageView;
}

- (void)setAccessoryImageView:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryImageView, a3);
}

- (UIView)baseView
{
  return self->_baseView;
}

- (void)setBaseView:(id)a3
{
  objc_storeStrong((id *)&self->_baseView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseView, 0);
  objc_storeStrong((id *)&self->_accessoryImageView, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_imageToTextConstraint, 0);
  objc_storeStrong((id *)&self->_symbolImage, 0);
  objc_storeStrong((id *)&self->_attributedText, 0);
}

@end
