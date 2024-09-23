@implementation WFApertureIconView

- (WFApertureIconView)initWithIcon:(id)a3
{
  id v4;
  WFApertureIconView *v5;
  WFApertureIconView *v6;
  uint64_t v7;
  UIColor *primaryColor;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  dispatch_time_t v26;
  WFApertureIconView *v27;
  _QWORD block[4];
  WFApertureIconView *v30;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)WFApertureIconView;
  v5 = -[WFApertureIconView initWithFrame:](&v31, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v6 = v5;
  if (v5)
  {
    v5->_mode = 0;
    v5->_iconStyle = 0;
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemWhiteColor");
    v7 = objc_claimAutoreleasedReturnValue();
    primaryColor = v6->_primaryColor;
    v6->_primaryColor = (UIColor *)v7;

    v6->_enabled = 1;
    -[WFApertureIconView setUserInteractionEnabled:](v6, "setUserInteractionEnabled:", 0);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", 0.0, 0.0, 24.0, 24.0);
    objc_msgSend(v9, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAllowsEdgeAntialiasing:", 1);

    objc_msgSend(v9, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setShadowRadius:", 6.0);

    objc_msgSend(v9, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v13) = 1051931443;
    objc_msgSend(v12, "setShadowOpacity:", v13);

    -[WFApertureIconView addSubview:](v6, "addSubview:", v9);
    objc_storeStrong((id *)&v6->_iconImageViewContainer, v9);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithFrame:", 0.0, 0.0, 24.0, 24.0);
    objc_msgSend(v14, "setContentMode:", 1);
    objc_msgSend(v14, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *MEMORY[0x24BDE58E8];
    objc_msgSend(v15, "setCornerCurve:", *MEMORY[0x24BDE58E8]);

    objc_msgSend(v14, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAllowsEdgeAntialiasing:", 1);

    objc_msgSend(v9, "addSubview:", v14);
    objc_storeStrong((id *)&v6->_iconImageView, v14);
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", 0.0, 0.0, 24.0, 24.0);
    objc_msgSend(v18, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAllowsEdgeAntialiasing:", 1);

    -[WFApertureIconView insertSubview:atIndex:](v6, "insertSubview:atIndex:", v18, 0);
    objc_storeStrong((id *)&v6->_colorViewContainer, v18);
    v20 = (void *)objc_opt_new();
    objc_msgSend(v20, "setHidden:", 1);
    objc_msgSend(v20, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setCornerCurve:", v16);

    objc_msgSend(v20, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setMasksToBounds:", 1);

    objc_msgSend(v20, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setAllowsEdgeAntialiasing:", 1);

    objc_msgSend(v18, "addSubview:", v20);
    objc_storeStrong((id *)&v6->_colorView, v20);
    -[WFApertureIconView iconImageView](v6, "iconImageView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObserver:forKeyPath:options:context:", v6, CFSTR("allowsEdgeAntialiasing"), 1, 0);

    -[WFApertureIconView setIcon:animated:](v6, "setIcon:animated:", v4, 0);
    if (-[WFApertureIconView inSiri](v6, "inSiri"))
    {
      v26 = dispatch_time(0, 300000000);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __35__WFApertureIconView_initWithIcon___block_invoke;
      block[3] = &unk_24C5ABB88;
      v30 = v6;
      dispatch_after(v26, MEMORY[0x24BDAC9B8], block);

    }
    v27 = v6;

  }
  return v6;
}

- (WFApertureIconView)initWithApplicationBundleIdentifier:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  WFApertureIconView *v7;
  WFApertureIconView *v8;

  v4 = (objc_class *)MEMORY[0x24BEC1338];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithBundleIdentifier:", v5);

  v7 = -[WFApertureIconView initWithIcon:](self, "initWithIcon:", v6);
  if (v7)
    v8 = v7;

  return v7;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  float v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  float v28;
  double v29;
  double v30;
  double v31;
  objc_super v32;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (!-[WFApertureIconView inSiri](self, "inSiri"))
  {
    -[WFApertureIconView icon](self, "icon");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v11 = v10;
      else
        v11 = 0;
    }
    else
    {
      v11 = 0;
    }
    v12 = v11;

    -[WFApertureIconView icon](self, "icon");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v14 = v13;
      else
        v14 = 0;
    }
    else
    {
      v14 = 0;
    }
    v15 = v14;

    if (sizeThatFits__onceToken == -1)
    {
      if (!v12)
        goto LABEL_23;
    }
    else
    {
      dispatch_once(&sizeThatFits__onceToken, &__block_literal_global_109);
      if (!v12)
        goto LABEL_23;
    }
    if (-[WFApertureIconView iconStyle](self, "iconStyle") == 2)
    {
      objc_msgSend(v12, "symbolName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      unfilledVariantForSymbolName(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = 24.0;
      v7 = 24.0;
      if ((objc_msgSend(v17, "isEqualToString:", CFSTR("qrcode.viewfinder")) & 1) == 0)
      {
        objc_msgSend((id)objc_opt_class(), "preferredImageForSymbolName:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "size");
        v20 = v19;
        v9 = v21;

        objc_msgSend((id)sizeThatFits__horizontalWidthIncreaseOverrideMapping, "objectForKeyedSubscript:", v17);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "floatValue");
        v24 = v23;

        v7 = v20 + v24;
        if (v7 <= v9)
        {
          if (v7 == v9)
          {
            v7 = 22.0;
            v9 = 23.333;
          }
        }
        else
        {
          v7 = fmin(v7 + 8.0, 28.0);
        }
      }

LABEL_26:
      goto LABEL_27;
    }
LABEL_23:
    v9 = 24.0;
    v7 = 27.333;
    if (v15 && -[WFApertureIconView iconStyle](self, "iconStyle") == 3)
    {
      v25 = (void *)sizeThatFits__horizontalWidthIncreaseOverrideMapping;
      objc_msgSend(v15, "bundleIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKeyedSubscript:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "floatValue");
      v29 = v28;

      v7 = v29 + 22.0;
      v9 = 23.333;
    }
    goto LABEL_26;
  }
  v32.receiver = self;
  v32.super_class = (Class)WFApertureIconView;
  -[WFApertureIconView sizeThatFits:](&v32, sel_sizeThatFits_, width, height);
  v7 = v6;
  v9 = v8;
LABEL_27:
  v30 = v7;
  v31 = v9;
  result.height = v31;
  result.width = v30;
  return result;
}

- (void)layoutSubviews
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
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  CGFloat *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  char isKindOfClass;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  id v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  int64_t v48;
  double v49;
  double v50;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  void *v66;
  void *v67;
  double v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  double v74;
  double v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t j;
  void *v84;
  void *v85;
  void *v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  double v94;
  __int128 v95;
  double v96;
  _OWORD v97[8];
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  _OWORD v110[8];
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  objc_super v115;
  _BYTE v116[128];
  _BYTE v117[128];
  _QWORD v118[6];
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;

  v118[4] = *MEMORY[0x24BDAC8D0];
  v115.receiver = self;
  v115.super_class = (Class)WFApertureIconView;
  -[WFApertureIconView layoutSubviews](&v115, sel_layoutSubviews);
  -[WFApertureIconView iconImageView](self, "iconImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v118[0] = v4;
  -[WFApertureIconView iconImageViewContainer](self, "iconImageViewContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v118[1] = v6;
  -[WFApertureIconView colorView](self, "colorView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v118[2] = v8;
  -[WFApertureIconView colorViewContainer](self, "colorViewContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v118[3] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v118, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v111 = 0u;
  v112 = 0u;
  v113 = 0u;
  v114 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v111, v117, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v112;
    v93 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
    v95 = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
    v91 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
    v92 = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
    v89 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
    v90 = *MEMORY[0x24BDE5598];
    v87 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
    v88 = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v112 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * i);
        v19 = (void *)MEMORY[0x24BDD1968];
        if (v18)
          objc_msgSend(*(id *)(*((_QWORD *)&v111 + 1) + 8 * i), "transform");
        else
          memset(v110, 0, sizeof(v110));
        objc_msgSend(v19, "valueWithCATransform3D:", v110, v87, v88, v89, v90, v91, v92);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v20);

        v106 = v95;
        v107 = v93;
        v108 = v92;
        v109 = v91;
        v102 = v90;
        v103 = v89;
        v104 = v88;
        v105 = v87;
        objc_msgSend(v18, "setTransform:", &v102);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v111, v117, 16);
    }
    while (v15);
  }

  v21 = -[WFApertureIconView inSiri](self, "inSiri");
  v22 = (CGFloat *)MEMORY[0x24BDBEFB0];
  if (v21 || (-[WFApertureIconView bounds](self, "bounds"), v23 > 25.0))
  {
    -[WFApertureIconView bounds](self, "bounds");
    v25 = v24;
    v27 = v26;
    v28 = *v22;
    v29 = v22[1];
  }
  else
  {
    if (-[WFApertureIconView iconStyle](self, "iconStyle") == 2
      && (-[WFApertureIconView icon](self, "icon"),
          v30 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          isKindOfClass = objc_opt_isKindOfClass(),
          v30,
          (isKindOfClass & 1) != 0))
    {
      -[WFApertureIconView icon](self, "icon");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (v32)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v33 = v32;
        else
          v33 = 0;
      }
      else
      {
        v33 = 0;
      }
      v38 = v33;

      -[WFApertureIconView iconImageView](self, "iconImageView");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "intrinsicContentSize");
      v25 = v40;
      v27 = v41;

      -[WFApertureIconView bounds](self, "bounds");
      -[WFApertureIconView bounds](self, "bounds");
      -[WFApertureIconView traitCollection](self, "traitCollection");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "displayScale");
      BSPointRoundForScale();

      v43 = (void *)objc_opt_class();
      objc_msgSend(v38, "symbolName");
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v43, "opticalAlignmentForSymbol:", v44);
      -[WFApertureIconView traitCollection](self, "traitCollection");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "displayScale");
    }
    else
    {
      -[WFApertureIconView iconStyle](self, "iconStyle");
      -[WFApertureIconView traitCollection](self, "traitCollection");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "displayScale");
      BSSizeCeilForScale();
      v25 = v35;
      v27 = v36;

      -[WFApertureIconView bounds](self, "bounds");
      -[WFApertureIconView traitCollection](self, "traitCollection");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "displayScale");
    }
    BSPointRoundForScale();
    v28 = v45;
    v29 = v46;

  }
  -[WFApertureIconView iconImageViewContainer](self, "iconImageViewContainer");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = v28;
  v94 = v29;
  objc_msgSend(v47, "setFrame:", v28, v29, v25, v27);

  v48 = -[WFApertureIconView iconStyle](self, "iconStyle");
  v49 = *v22;
  v50 = v22[1];
  if (v48 == 3)
  {
    v119.origin.x = *v22;
    v119.origin.y = v22[1];
    v119.size.width = v25;
    v119.size.height = v27;
    v120 = CGRectInset(v119, -1.0, -1.0);
    x = v120.origin.x;
    y = v120.origin.y;
    width = v120.size.width;
    height = v120.size.height;
    -[WFApertureIconView iconImageView](self, "iconImageView");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v55;
    v57 = x;
    v58 = y;
    v59 = width;
    v60 = height;
  }
  else
  {
    -[WFApertureIconView iconImageView](self, "iconImageView");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v55;
    v57 = v49;
    v58 = v50;
    v59 = v25;
    v60 = v27;
  }
  objc_msgSend(v55, "setFrame:", v57, v58, v59, v60);

  v121.origin.x = v49;
  v121.origin.y = v50;
  v121.size.width = v25;
  v121.size.height = v27;
  v122 = CGRectInset(v121, -0.1, -0.1);
  v61 = v122.origin.x;
  v62 = v122.origin.y;
  v63 = v122.size.width;
  v64 = v122.size.height;
  -[WFApertureIconView iconBlendedBorderLayer](self, "iconBlendedBorderLayer");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setFrame:", v61, v62, v63, v64);

  -[WFApertureIconView colorViewContainer](self, "colorViewContainer");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setFrame:", v96, v94, v25, v27);

  -[WFApertureIconView colorView](self, "colorView");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "setFrame:", v49, v50, v25, v27);

  v68 = v25 * 0.225;
  -[WFApertureIconView iconImageView](self, "iconImageView");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "layer");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setCornerRadius:", v68);

  -[WFApertureIconView iconBlendedBorderLayer](self, "iconBlendedBorderLayer");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "setCornerRadius:", v68);

  -[WFApertureIconView colorView](self, "colorView");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "layer");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "setCornerRadius:", v68);

  -[WFApertureIconView bounds](self, "bounds");
  v75 = v74;
  -[WFApertureIconView iconBlendedBorderLayer](self, "iconBlendedBorderLayer");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = v76;
  if (v75 <= 25.0)
  {
    -[WFApertureIconView traitCollection](self, "traitCollection");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "displayScale");
    BSFloatRoundForScale();
    objc_msgSend(v77, "setBorderWidth:");

  }
  else
  {
    objc_msgSend(v76, "setBorderWidth:", 0.75);
  }

  v100 = 0u;
  v101 = 0u;
  v98 = 0u;
  v99 = 0u;
  v79 = v13;
  v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v98, v116, 16);
  if (v80)
  {
    v81 = v80;
    v82 = *(_QWORD *)v99;
    do
    {
      for (j = 0; j != v81; ++j)
      {
        if (*(_QWORD *)v99 != v82)
          objc_enumerationMutation(v79);
        v84 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * j);
        objc_msgSend(v12, "objectAtIndex:", 0);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        v86 = v85;
        v108 = 0u;
        v109 = 0u;
        v106 = 0u;
        v107 = 0u;
        v104 = 0u;
        v105 = 0u;
        v102 = 0u;
        v103 = 0u;
        if (v85)
          objc_msgSend(v85, "CATransform3DValue");
        v97[4] = v106;
        v97[5] = v107;
        v97[6] = v108;
        v97[7] = v109;
        v97[0] = v102;
        v97[1] = v103;
        v97[2] = v104;
        v97[3] = v105;
        objc_msgSend(v84, "setTransform:", v97);
        objc_msgSend(v12, "removeObjectAtIndex:", 0);

      }
      v81 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v98, v116, 16);
    }
    while (v81);
  }

}

- (void)setIcon:(id)a3 associatedAppBundleIdentifier:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;

  v5 = a5;
  v8 = a4;
  -[WFApertureIconView setIcon:animated:](self, "setIcon:animated:", a3, v5);
  -[WFApertureIconView setAssociatedAppBundleIdentifier:](self, "setAssociatedAppBundleIdentifier:", v8);

}

- (void)setIcon:(id)a3 animated:(BOOL)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  char v8;
  int64_t v9;
  id v10;
  char isKindOfClass;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  char v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  void *v39;
  void *icon;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  __CFString *v45;
  void *v46;
  int64_t v47;
  uint64_t v48;
  int v49;
  void *v50;
  void *v51;
  int v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  dispatch_time_t v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  id v71;
  void *v72;
  int v73;
  NSObject *v74;
  void *v75;
  void *v76;
  WFIcon *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  unsigned int v83;
  unsigned int v84;
  int64_t v85;
  id v86;
  id v87;
  id v88;
  id v89;
  _QWORD block[4];
  id v91;
  WFApertureIconView *v92;
  uint64_t v93;
  int64_t v94;
  char v95;
  uint8_t buf[4];
  const char *v97;
  __int16 v98;
  void *v99;
  uint64_t v100;

  v4 = a4;
  v100 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[WFApertureIconView icon](self, "icon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if ((v8 & 1) == 0)
  {
    v9 = -[WFApertureIconView iconStyle](self, "iconStyle");
    v10 = v6;
    if (v10)
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) != 0)
        v12 = v10;
      else
        v12 = 0;
      v13 = v12;

      v14 = v10;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v15 = v14;
      else
        v15 = 0;
      v87 = v15;

      v16 = v14;
      objc_opt_class();
      v17 = objc_opt_isKindOfClass();
      if ((v17 & 1) != 0)
        v18 = v16;
      else
        v18 = 0;
      v86 = v18;

      v19 = v16;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v20 = v19;
      else
        v20 = 0;
      v21 = v20;

      v85 = v9;
      if ((isKindOfClass & 1) != 0)
      {
        v22 = objc_alloc_init(MEMORY[0x24BEC1350]);
        objc_msgSend(v19, "bundleIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "colorsForBundleIdentifier:error:", v23, 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v88 = v21;
        if (v24)
        {
          objc_msgSend(v24, "backgroundGradient");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25)
          {
            objc_msgSend(v24, "backgroundGradient");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "startColor");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "UIColor");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFApertureIconView setPrimaryColor:](self, "setPrimaryColor:", v28);
LABEL_28:

LABEL_29:
            objc_msgSend(v19, "associatedLogo");
            icon = (void *)objc_claimAutoreleasedReturnValue();
            if (-[WFApertureIconView inSiri](self, "inSiri") || !icon)
            {
              v48 = v4;
              if (-[WFApertureIconView inSiri](self, "inSiri"))
                v49 = 2;
              else
                v49 = 0;
              v83 = v49;
              objc_msgSend(v19, "bundleIdentifier");
              v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "bundleIdentifier");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = objc_msgSend(v51, "isEqualToString:", *MEMORY[0x24BEC1798]);

              if (v52)
              {
                v53 = (void *)MEMORY[0x24BE042F8];
                objc_msgSend(v19, "bundleIdentifier");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "applicationWithBundleIdentifier:", v54);
                v55 = (void *)objc_claimAutoreleasedReturnValue();

                if (objc_msgSend(v55, "isHidden"))
                {

                  v45 = CFSTR("INVALID_BUNDLE_ID");
                }
                v4 = v48;

              }
              else
              {
                v4 = v48;
              }
              v56 = v88;
              v57 = (void *)MEMORY[0x24BEBD640];
              -[WFApertureIconView traitCollection](self, "traitCollection");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v58, "displayScale");
              objc_msgSend(v57, "_applicationIconImageForBundleIdentifier:format:scale:", v45, v83);
              v46 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v46)
              {
                getWFGeneralLogObject();
                v74 = objc_claimAutoreleasedReturnValue();
                v29 = v86;
                if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v19, "bundleIdentifier");
                  v75 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 136315394;
                  v97 = "-[WFApertureIconView setIcon:animated:]";
                  v98 = 2112;
                  v99 = v75;
                  _os_log_impl(&dword_20CE0F000, v74, OS_LOG_TYPE_ERROR, "%s Failed to load application icon for bundle ID: %@", buf, 0x16u);

                }
                v67 = v87;
                goto LABEL_70;
              }
              v47 = 1;
            }
            else
            {
              v41 = (void *)objc_opt_class();
              objc_msgSend(icon, "UIImage");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "downscaledImageForOriginalImage:", v42);
              v43 = (void *)objc_claimAutoreleasedReturnValue();

              v44 = (void *)MEMORY[0x24BEBD640];
              v45 = objc_retainAutorelease(v43);
              objc_msgSend(v44, "imageWithCGImage:", -[__CFString CGImage](v45, "CGImage"));
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              v47 = 3;
            }
            v29 = v86;

            v59 = v19;
            goto LABEL_68;
          }
          objc_msgSend(v24, "tintColor");
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          if (v34)
          {
            objc_msgSend(v24, "tintColor");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "UIColor");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFApertureIconView setPrimaryColor:](self, "setPrimaryColor:", v27);
            goto LABEL_29;
          }
        }
        objc_msgSend(v87, "image");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        +[WFJoeColorUtility colorForImage:](WFJoeColorUtility, "colorForImage:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "UIColor");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "colorWithAlphaComponent:", 1.0);
        v82 = v19;
        v35 = v6;
        v36 = v10;
        v37 = v22;
        v38 = v4;
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFApertureIconView setPrimaryColor:](self, "setPrimaryColor:", v39);

        v4 = v38;
        v22 = v37;
        v10 = v36;
        v6 = v35;
        v19 = v82;
        goto LABEL_28;
      }
      if (v21)
      {
        v29 = v86;
        if (objc_msgSend(v19, "hasClearBackground"))
        {
          objc_msgSend(v19, "hasClearBackground");
          objc_msgSend(v21, "symbolColor");
          v30 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "UIColor");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFApertureIconView setPrimaryColor:](self, "setPrimaryColor:", v31);
          v32 = v19;
          goto LABEL_65;
        }
LABEL_23:
        objc_msgSend(v29, "background");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = v4;
        v89 = v21;
        if (v33)
        {
          v30 = v33;
        }
        else
        {
          objc_msgSend(v21, "background");
          v30 = (id)objc_claimAutoreleasedReturnValue();
          if (!v30)
          {
            v71 = 0;
            goto LABEL_61;
          }
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v68 = v30;
        else
          v68 = 0;
        v69 = v68;

        v30 = v30;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v70 = v30;
        else
          v70 = 0;
        v71 = v70;

        if (v69)
        {
          objc_msgSend(v69, "color");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          v73 = 0;
          v31 = v30;
LABEL_62:
          objc_msgSend(v72, "UIColor");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFApertureIconView setPrimaryColor:](self, "setPrimaryColor:", v76);

          if (v73)
          {

            v72 = v81;
          }

          v4 = v84;
          v29 = v86;
          v32 = v89;
LABEL_65:

          if (v87)
          {
            v88 = v32;
            goto LABEL_67;
          }
          if (v32)
          {
            v9 = v85;
            v88 = v32;
            if (objc_msgSend(v19, "hasClearBackground"))
            {
              v78 = (void *)objc_opt_class();
              objc_msgSend(v32, "symbolName");
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v78, "preferredImageForSymbolName:", v79);
              v80 = (void *)objc_claimAutoreleasedReturnValue();

              v47 = 2;
              -[WFApertureIconView setIconImage:associatedIcon:style:previousIconStyle:animated:](self, "setIconImage:associatedIcon:style:previousIconStyle:animated:", v80, v19, 2, v85, v4);

              goto LABEL_47;
            }
          }
          else
          {
            v88 = 0;
            v9 = v85;
          }
LABEL_46:
          v65 = dispatch_time(0, 100000000);
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __39__WFApertureIconView_setIcon_animated___block_invoke;
          block[3] = &unk_24C5AB3D8;
          v91 = v10;
          v92 = self;
          v47 = 1;
          v93 = 1;
          v94 = v9;
          v95 = v4;
          v66 = (void *)MEMORY[0x24BDAC9B8];
          dispatch_after(v65, MEMORY[0x24BDAC9B8], block);

LABEL_47:
          v19 = 0;
          v67 = 0;
LABEL_69:
          self->_iconStyle = v47;
          v77 = (WFIcon *)v10;
          icon = self->_icon;
          self->_icon = v77;
          v56 = v88;
LABEL_70:

          goto LABEL_71;
        }
LABEL_61:
        objc_msgSend(v71, "gradient");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "darkBaseColor");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 0;
        v73 = 1;
        goto LABEL_62;
      }
      v29 = v86;
      if ((v17 & 1) != 0)
        goto LABEL_23;
      if (v87)
      {
        objc_msgSend(v87, "image");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        +[WFJoeColorUtility colorForImage:](WFJoeColorUtility, "colorForImage:", v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "UIColor");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "colorWithAlphaComponent:", 1.0);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFApertureIconView setPrimaryColor:](self, "setPrimaryColor:", v63);

        v29 = 0;
        v88 = 0;
LABEL_67:
        objc_msgSend(v19, "image");
        icon = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(icon, "UIImage");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = 0;
        v47 = 1;
        v87 = v19;
LABEL_68:

        -[WFApertureIconView setIconImage:associatedIcon:style:previousIconStyle:animated:](self, "setIconImage:associatedIcon:style:previousIconStyle:animated:", v46, v19, v47, v85, v4);
        v19 = v59;
        v67 = v87;
        goto LABEL_69;
      }
    }
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFApertureIconView setPrimaryColor:](self, "setPrimaryColor:", v64);

    v88 = 0;
    v29 = 0;
    goto LABEL_46;
  }
LABEL_71:

}

- (void)setIconImage:(id)a3 associatedIcon:(id)a4 style:(int64_t)a5 previousIconStyle:(int64_t)a6 animated:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  int64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD aBlock[10];

  v7 = a7;
  aBlock[9] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  if (v7)
  {
    v14 = -[WFApertureIconView mode](self, "mode");
    v15 = a6 == 1 && a5 == 1;
    v16 = 2;
    if (v15)
      v16 = 3;
    if (v14)
      v17 = 1;
    else
      v17 = v16;
  }
  else
  {
    v17 = 0;
  }
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__WFApertureIconView_setIconImage_associatedIcon_style_previousIconStyle_animated___block_invoke;
  aBlock[3] = &unk_24C5ABB08;
  aBlock[4] = self;
  aBlock[5] = v13;
  aBlock[7] = a5;
  aBlock[6] = v12;
  _Block_copy(aBlock);
  __asm { BR              X9 }
}

- (void)setMode:(int64_t)a3
{
  -[WFApertureIconView setMode:animated:](self, "setMode:animated:", a3, 0);
}

- (void)setMode:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
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
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void (**v51)(_QWORD);
  double v52;
  double v53;
  dispatch_time_t v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  int v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void (**v70)(_QWORD);
  void *v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _QWORD v80[5];
  _QWORD v81[4];
  void (**v82)(_QWORD);
  _QWORD v83[5];
  CGAffineTransform v84;
  _QWORD block[5];
  void (**v86)(_QWORD);
  CGAffineTransform v87;
  CGAffineTransform v88;
  CGAffineTransform v89;
  _QWORD aBlock[5];
  _QWORD v91[4];
  id v92;
  WFApertureIconView *v93;
  id v94;
  _QWORD v95[4];
  id v96;
  CGAffineTransform v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;

  v4 = a4;
  if (-[WFApertureIconView mode](self, "mode") != a3)
  {
    self->_mode = a3;
    -[WFApertureIconView iconImageViewContainer](self, "iconImageViewContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeAllAnimations");

    -[WFApertureIconView iconImageView](self, "iconImageView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeAllAnimations");

    -[WFApertureIconView colorViewContainer](self, "colorViewContainer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeAllAnimations");

    -[WFApertureIconView colorView](self, "colorView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeAllAnimations");

    -[WFApertureIconView iconImageViewContainer](self, "iconImageViewContainer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
    v99 = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
    v78 = v99;
    v100 = v79;
    v77 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
    v101 = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
    v76 = v101;
    v102 = v77;
    v75 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
    *(_OWORD *)&v97.a = *MEMORY[0x24BDE5598];
    v74 = *(_OWORD *)&v97.a;
    *(_OWORD *)&v97.c = v75;
    v73 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
    *(_OWORD *)&v97.tx = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
    v72 = *(_OWORD *)&v97.tx;
    v98 = v73;
    objc_msgSend(v16, "setTransform:", &v97);

    -[WFApertureIconView iconImageView](self, "iconImageView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = v78;
    v100 = v79;
    v101 = v76;
    v102 = v77;
    *(_OWORD *)&v97.a = v74;
    *(_OWORD *)&v97.c = v75;
    *(_OWORD *)&v97.tx = v72;
    v98 = v73;
    objc_msgSend(v18, "setTransform:", &v97);

    -[WFApertureIconView colorViewContainer](self, "colorViewContainer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = v78;
    v100 = v79;
    v101 = v76;
    v102 = v77;
    *(_OWORD *)&v97.a = v74;
    *(_OWORD *)&v97.c = v75;
    *(_OWORD *)&v97.tx = v72;
    v98 = v73;
    objc_msgSend(v20, "setTransform:", &v97);

    -[WFApertureIconView colorView](self, "colorView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = v78;
    v100 = v79;
    v101 = v76;
    v102 = v77;
    *(_OWORD *)&v97.a = v74;
    *(_OWORD *)&v97.c = v75;
    *(_OWORD *)&v97.tx = v72;
    v98 = v73;
    objc_msgSend(v22, "setTransform:", &v97);

    -[WFApertureIconView icon](self, "icon");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v24 = v23;
      else
        v24 = 0;
    }
    else
    {
      v24 = 0;
    }
    v25 = v24;

    objc_msgSend(v25, "bundleIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      v27 = v26;
    }
    else
    {
      -[WFApertureIconView associatedAppBundleIdentifier](self, "associatedAppBundleIdentifier");
      v27 = (id)objc_claimAutoreleasedReturnValue();
    }
    v28 = v27;

    if (-[WFApertureIconView iconStyle](self, "iconStyle") != 2
      && -[WFApertureIconView iconStyle](self, "iconStyle") != 3)
    {
      v43 = 0;
      if (a3 == 1)
      {
LABEL_19:
        -[WFApertureIconView colorView](self, "colorView");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFApertureIconView iconStackPlatterColorForImage:](self, "iconStackPlatterColorForImage:", v43);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "setBackgroundColor:", v48);

        -[WFApertureIconView colorView](self, "colorView");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "setHidden:", 0);

        v50 = MEMORY[0x24BDAC760];
        aBlock[0] = MEMORY[0x24BDAC760];
        aBlock[1] = 3221225472;
        aBlock[2] = __39__WFApertureIconView_setMode_animated___block_invoke_3;
        aBlock[3] = &unk_24C5ABB88;
        aBlock[4] = self;
        v51 = (void (**)(_QWORD))_Block_copy(aBlock);
        memset(&v97, 0, sizeof(v97));
        -[WFApertureIconView bounds](self, "bounds");
        CGAffineTransformMakeTranslation(&v97, 0.0, v52 * -0.17);
        memset(&v89, 0, sizeof(v89));
        -[WFApertureIconView bounds](self, "bounds");
        CGAffineTransformMakeTranslation(&v89, 0.0, v53 * 0.17);
        if (v4)
        {
          v54 = dispatch_time(0, 170000000);
          block[0] = v50;
          block[1] = 3221225472;
          block[2] = __39__WFApertureIconView_setMode_animated___block_invoke_4;
          block[3] = &unk_24C5AB540;
          block[4] = self;
          v86 = v51;
          v87 = v97;
          v88 = v89;
          dispatch_after(v54, MEMORY[0x24BDAC9B8], block);
          v55 = v86;
        }
        else
        {
          v51[2](v51);
          -[WFApertureIconView iconImageViewContainer](self, "iconImageViewContainer");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v84 = v97;
          objc_msgSend(v56, "setTransform:", &v84);

          -[WFApertureIconView colorViewContainer](self, "colorViewContainer");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v84 = v89;
          objc_msgSend(v55, "setTransform:", &v84);
        }
LABEL_41:

        return;
      }
LABEL_38:
      v69 = MEMORY[0x24BDAC760];
      v83[0] = MEMORY[0x24BDAC760];
      v83[1] = 3221225472;
      v83[2] = __39__WFApertureIconView_setMode_animated___block_invoke_9;
      v83[3] = &unk_24C5ABB88;
      v83[4] = self;
      v70 = (void (**)(_QWORD))_Block_copy(v83);
      v51 = v70;
      if (v4)
      {
        v71 = (void *)MEMORY[0x24BEBDB00];
        v81[0] = v69;
        v81[1] = 3221225472;
        v81[2] = __39__WFApertureIconView_setMode_animated___block_invoke_10;
        v81[3] = &unk_24C5AB400;
        v82 = v70;
        v80[0] = v69;
        v80[1] = 3221225472;
        v80[2] = __39__WFApertureIconView_setMode_animated___block_invoke_11;
        v80[3] = &unk_24C5AB568;
        v80[4] = self;
        objc_msgSend(v71, "animateWithSpringDuration:bounce:initialSpringVelocity:delay:options:animations:completion:", 4, v81, v80, 0.5, 0.0, 0.0, 0.0);
        v55 = v82;
      }
      else
      {
        v70[2](v70);
        -[WFApertureIconView colorView](self, "colorView");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "setHidden:", 1);
      }
      goto LABEL_41;
    }
    if (a3 == 1)
    {
      v29 = (void *)MEMORY[0x24BEBD640];
      -[WFApertureIconView traitCollection](self, "traitCollection");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "displayScale");
      objc_msgSend(v29, "_applicationIconImageForBundleIdentifier:format:scale:", v28, 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v32 = objc_alloc(MEMORY[0x24BEBD668]);
      -[WFApertureIconView iconImageView](self, "iconImageView");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "bounds");
      v34 = (void *)objc_msgSend(v32, "initWithFrame:");

      objc_msgSend(v34, "setImage:", v31);
      objc_msgSend(v34, "layer");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setCornerCurve:", *MEMORY[0x24BDE58E8]);

      objc_msgSend(v34, "layer");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFApertureIconView iconImageView](self, "iconImageView");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "layer");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "cornerRadius");
      objc_msgSend(v36, "setCornerRadius:");

      objc_msgSend(v34, "layer");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setAllowsEdgeAntialiasing:", 1);

      objc_msgSend(v34, "setAlpha:", 0.0);
      -[WFApertureIconView iconImageView](self, "iconImageView");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "addSubview:", v34);

      v41 = (void *)MEMORY[0x24BEBDB00];
      v42 = MEMORY[0x24BDAC760];
      v95[0] = MEMORY[0x24BDAC760];
      v95[1] = 3221225472;
      v95[2] = __39__WFApertureIconView_setMode_animated___block_invoke;
      v95[3] = &unk_24C5ABB88;
      v96 = v34;
      v91[0] = v42;
      v91[1] = 3221225472;
      v91[2] = __39__WFApertureIconView_setMode_animated___block_invoke_2;
      v91[3] = &unk_24C5AB4C8;
      v92 = v96;
      v93 = self;
      v43 = v31;
      v94 = v43;
      v44 = v96;
      objc_msgSend(v41, "animateWithDuration:animations:completion:", v95, v91, 0.25);
      -[WFApertureIconView setBlendedBorderLayerHidden:](self, "setBlendedBorderLayerHidden:", 0);

      goto LABEL_19;
    }
    -[WFApertureIconView icon](self, "icon");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (v45)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v46 = v45;
      else
        v46 = 0;
    }
    else
    {
      v46 = 0;
    }
    v57 = v46;

    -[WFApertureIconView icon](self, "icon");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    if (v58)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v59 = v58;
      else
        v59 = 0;
    }
    else
    {
      v59 = 0;
    }
    v60 = v59;

    if (v57
      && (-[WFApertureIconView icon](self, "icon"),
          v61 = (void *)objc_claimAutoreleasedReturnValue(),
          v62 = objc_msgSend(v61, "hasClearBackground"),
          v61,
          v62))
    {
      v63 = (void *)objc_opt_class();
      objc_msgSend(v57, "symbolName");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "preferredImageForSymbolName:", v64);
      v43 = (id)objc_claimAutoreleasedReturnValue();

      -[WFApertureIconView iconImageView](self, "iconImageView");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "setImage:", v43);
    }
    else
    {
      if (-[WFApertureIconView inSiri](self, "inSiri"))
      {
        v43 = 0;
LABEL_37:
        -[WFApertureIconView setBlendedBorderLayerHidden:](self, "setBlendedBorderLayerHidden:", 1);

        goto LABEL_38;
      }
      objc_msgSend(v60, "associatedLogo");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      if (v65)
      {
        v66 = (void *)objc_opt_class();
        objc_msgSend(v65, "UIImage");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "downscaledImageForOriginalImage:", v67);
        v43 = (id)objc_claimAutoreleasedReturnValue();

        -[WFApertureIconView iconImageView](self, "iconImageView");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "setImage:", v43);

      }
      else
      {
        v43 = 0;
      }
    }

    goto LABEL_37;
  }
}

- (void)setEnabled:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v4 = a4;
  self->_enabled = a3;
  if (a3)
    -[WFApertureIconView symbolColor](self, "symbolColor");
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "sbui_inactiveColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    v8 = (void *)MEMORY[0x24BEBDB00];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __42__WFApertureIconView_setEnabled_animated___block_invoke;
    v10[3] = &unk_24C5ABBB0;
    v10[4] = self;
    v11 = v6;
    objc_msgSend(v8, "animateWithDuration:animations:", v10, 0.2);

  }
  else
  {
    -[WFApertureIconView iconImageView](self, "iconImageView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTintColor:", v7);

  }
}

- (void)setBlendedBorderLayerHidden:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  CALayer *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  CALayer *iconBlendedBorderLayer;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  id v17;

  v3 = a3;
  -[WFApertureIconView iconBlendedBorderLayer](self, "iconBlendedBorderLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5 && !v3)
  {
    v6 = (CALayer *)objc_alloc_init(MEMORY[0x24BDE56D0]);
    -[WFApertureIconView iconImageView](self, "iconImageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v9 = v8;
    -[WFApertureIconView iconImageView](self, "iconImageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    -[CALayer setFrame:](v6, "setFrame:", 0.0, 0.0, v9);

    -[CALayer setCornerCurve:](v6, "setCornerCurve:", *MEMORY[0x24BDE58E8]);
    -[CALayer setBorderColor:](v6, "setBorderColor:", CGColorCreateSRGB(0.247058824, 0.247058824, 0.247058824, 1.0));
    -[CALayer setCompositingFilter:](v6, "setCompositingFilter:", *MEMORY[0x24BDE5B48]);
    iconBlendedBorderLayer = self->_iconBlendedBorderLayer;
    self->_iconBlendedBorderLayer = v6;

  }
  -[WFApertureIconView iconBlendedBorderLayer](self, "iconBlendedBorderLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "superlayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (v13 != 0) ^ v3;

  if ((v14 & 1) == 0)
  {
    if (v3)
    {
      -[WFApertureIconView iconBlendedBorderLayer](self, "iconBlendedBorderLayer");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "removeFromSuperlayer");
    }
    else
    {
      -[WFApertureIconView iconImageView](self, "iconImageView");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "layer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFApertureIconView iconBlendedBorderLayer](self, "iconBlendedBorderLayer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addSublayer:", v16);

    }
  }
}

- (id)iconStackPlatterColorForImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  const CGFloat *Components;
  double v22;
  void *v23;

  v4 = a3;
  -[WFApertureIconView icon](self, "icon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = v8;
  }
  else
  {
    -[WFApertureIconView associatedAppBundleIdentifier](self, "associatedAppBundleIdentifier");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  -[WFApertureIconView primaryColor](self, "primaryColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[WFApertureIconView iconStyle](self, "iconStyle") == 2
     || -[WFApertureIconView iconStyle](self, "iconStyle") == 3)
    && v10
    && (v7 || -[WFApertureIconView iconStyle](self, "iconStyle") != 1))
  {
    v12 = objc_alloc_init(MEMORY[0x24BEC1350]);
    objc_msgSend(v12, "colorsForBundleIdentifier:error:", v10, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13
      && (objc_msgSend(v13, "backgroundGradient"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v15,
          v15))
    {
      objc_msgSend(v14, "backgroundGradient");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "baseColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "UIColor");
      v18 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v4)
      {
LABEL_20:

        goto LABEL_21;
      }
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC14E0]), "initWithPlatformImage:", v4);
      +[WFJoeColorUtility colorForImage:](WFJoeColorUtility, "colorForImage:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "UIColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "colorWithAlphaComponent:", 1.0);
      v18 = objc_claimAutoreleasedReturnValue();

      v11 = v19;
    }

    v11 = (void *)v18;
    goto LABEL_20;
  }
LABEL_21:
  v20 = objc_retainAutorelease(v11);
  Components = CGColorGetComponents((CGColorRef)objc_msgSend(v20, "CGColor"));
  objc_msgSend(v20, "_luminance");
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", (0.5 - v22 + *Components) * 0.3, (0.5 - v22 + Components[1]) * 0.3, (0.5 - v22 + Components[2]) * 0.3, 1.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (UIColor)keyColor
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[WFApertureIconView keyColorOverride](self, "keyColorOverride");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[WFApertureIconView primaryColor](self, "primaryColor");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (UIColor *)v6;
}

- (void)setKeyColorOverride:(id)a3
{
  objc_storeStrong((id *)&self->_keyColorOverride, a3);
}

- (id)symbolColor
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[WFApertureIconView symbolColorOverride](self, "symbolColorOverride");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[WFApertureIconView primaryColor](self, "primaryColor");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (void)setSymbolColorOverride:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_symbolColorOverride, a3);
  if (-[WFApertureIconView isEnabled](self, "isEnabled"))
  {
    -[WFApertureIconView iconImageView](self, "iconImageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTintColor:", v6);

  }
}

- (BOOL)inSiri
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BEC1790]);

  return v4;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  char v16;
  id v17;

  v17 = a3;
  v9 = a4;
  v10 = a5;
  -[WFApertureIconView iconImageView](self, "iconImageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layer");
  v12 = objc_claimAutoreleasedReturnValue();
  if ((id)v12 != v9)
  {
    v13 = (void *)v12;
LABEL_3:

    goto LABEL_4;
  }
  v14 = objc_msgSend(v17, "isEqualToString:", CFSTR("allowsEdgeAntialiasing"));

  if (v14)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "BOOLValue");

    if ((v16 & 1) == 0)
    {
      -[WFApertureIconView iconImageView](self, "iconImageView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "layer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setAllowsEdgeAntialiasing:", 1);
      goto LABEL_3;
    }
  }
LABEL_4:

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[WFApertureIconView iconImageView](self, "iconImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:forKeyPath:", self, CFSTR("allowsEdgeAntialiasing"));

  v5.receiver = self;
  v5.super_class = (Class)WFApertureIconView;
  -[WFApertureIconView dealloc](&v5, sel_dealloc);
}

- (WFIcon)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (UIColor)primaryColor
{
  return self->_primaryColor;
}

- (void)setPrimaryColor:(id)a3
{
  objc_storeStrong((id *)&self->_primaryColor, a3);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (NSString)associatedAppBundleIdentifier
{
  return self->_associatedAppBundleIdentifier;
}

- (void)setAssociatedAppBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_associatedAppBundleIdentifier, a3);
}

- (CGSize)resolution
{
  double width;
  double height;
  CGSize result;

  width = self->_resolution.width;
  height = self->_resolution.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setResolution:(CGSize)a3
{
  self->_resolution = a3;
}

- (UIView)iconImageViewContainer
{
  return self->_iconImageViewContainer;
}

- (void)setIconImageViewContainer:(id)a3
{
  objc_storeStrong((id *)&self->_iconImageViewContainer, a3);
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageView:(id)a3
{
  objc_storeStrong((id *)&self->_iconImageView, a3);
}

- (CALayer)iconBlendedBorderLayer
{
  return self->_iconBlendedBorderLayer;
}

- (void)setIconBlendedBorderLayer:(id)a3
{
  objc_storeStrong((id *)&self->_iconBlendedBorderLayer, a3);
}

- (UIView)colorViewContainer
{
  return self->_colorViewContainer;
}

- (void)setColorViewContainer:(id)a3
{
  objc_storeStrong((id *)&self->_colorViewContainer, a3);
}

- (UIView)colorView
{
  return self->_colorView;
}

- (void)setColorView:(id)a3
{
  objc_storeStrong((id *)&self->_colorView, a3);
}

- (int64_t)mode
{
  return self->_mode;
}

- (int64_t)iconStyle
{
  return self->_iconStyle;
}

- (void)setIconStyle:(int64_t)a3
{
  self->_iconStyle = a3;
}

- (UIColor)keyColorOverride
{
  return self->_keyColorOverride;
}

- (UIColor)symbolColorOverride
{
  return self->_symbolColorOverride;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolColorOverride, 0);
  objc_storeStrong((id *)&self->_keyColorOverride, 0);
  objc_storeStrong((id *)&self->_colorView, 0);
  objc_storeStrong((id *)&self->_colorViewContainer, 0);
  objc_storeStrong((id *)&self->_iconBlendedBorderLayer, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_iconImageViewContainer, 0);
  objc_storeStrong((id *)&self->_associatedAppBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_primaryColor, 0);
  objc_storeStrong((id *)&self->_icon, 0);
}

void __42__WFApertureIconView_setEnabled_animated___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "iconImageView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTintColor:", *(_QWORD *)(a1 + 40));

}

uint64_t __39__WFApertureIconView_setMode_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

void __39__WFApertureIconView_setMode_animated___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 40), "iconImageView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImage:", *(_QWORD *)(a1 + 48));

}

void __39__WFApertureIconView_setMode_animated___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  CATransform3D v6;
  CATransform3D a;
  CATransform3D b;
  CATransform3D v9;
  CATransform3D v10;
  CATransform3D v11;
  CATransform3D v12;

  memset(&v12, 0, sizeof(v12));
  CATransform3DMakeScale(&v12, 0.76, 0.76, 1.0);
  memset(&v11, 0, sizeof(v11));
  CATransform3DMakeRotation(&v11, -0.785398163, 0.0, 0.0, 1.0);
  memset(&v10, 0, sizeof(v10));
  CATransform3DMakeScale(&v10, 1.0, 0.8, 1.0);
  memset(&v9, 0, sizeof(v9));
  a = v11;
  v6 = v10;
  CATransform3DConcat(&b, &a, &v6);
  a = v12;
  CATransform3DConcat(&v9, &a, &b);
  objc_msgSend(*(id *)(a1 + 32), "iconImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  a = v9;
  objc_msgSend(v3, "setTransform:", &a);

  objc_msgSend(*(id *)(a1 + 32), "colorView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  a = v9;
  objc_msgSend(v5, "setTransform:", &a);

}

void __39__WFApertureIconView_setMode_animated___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  dispatch_time_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _QWORD v8[5];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD v15[4];
  id v16;

  v2 = MEMORY[0x24BDAC760];
  v3 = (void *)MEMORY[0x24BEBDB00];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __39__WFApertureIconView_setMode_animated___block_invoke_5;
  v15[3] = &unk_24C5AB400;
  v16 = *(id *)(a1 + 40);
  objc_msgSend(v3, "animateWithSpringDuration:bounce:initialSpringVelocity:delay:options:animations:completion:", 4, v15, 0, 0.45, 0.0, 0.0, 0.0);
  v4 = dispatch_time(0, 60000000);
  v8[1] = 3221225472;
  v5 = *(_OWORD *)(a1 + 64);
  v9 = *(_OWORD *)(a1 + 48);
  v10 = v5;
  v6 = *(_OWORD *)(a1 + 96);
  v11 = *(_OWORD *)(a1 + 80);
  v12 = v6;
  v7 = *(_OWORD *)(a1 + 128);
  v13 = *(_OWORD *)(a1 + 112);
  v8[0] = v2;
  v8[2] = __39__WFApertureIconView_setMode_animated___block_invoke_6;
  v8[3] = &unk_24C5AB518;
  v8[4] = *(_QWORD *)(a1 + 32);
  v14 = v7;
  dispatch_after(v4, MEMORY[0x24BDAC9B8], v8);

}

void __39__WFApertureIconView_setMode_animated___block_invoke_9(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;

  objc_msgSend(*(id *)(a1 + 32), "iconImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
  v23 = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
  v15 = v23;
  v24 = v17;
  v13 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
  v25 = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
  v12 = v25;
  v26 = v13;
  v11 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
  v19 = *MEMORY[0x24BDE5598];
  v10 = v19;
  v20 = v11;
  v9 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
  v21 = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
  v8 = v21;
  v22 = v9;
  objc_msgSend(v3, "setTransform:", &v19);

  objc_msgSend(*(id *)(a1 + 32), "colorView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v15;
  v24 = v17;
  v25 = v12;
  v26 = v13;
  v19 = v10;
  v20 = v11;
  v21 = v8;
  v22 = v9;
  objc_msgSend(v5, "setTransform:", &v19);

  objc_msgSend(*(id *)(a1 + 32), "iconImageViewContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v19 = *MEMORY[0x24BDBD8B8];
  v16 = v19;
  v20 = v18;
  v21 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  v14 = v21;
  objc_msgSend(v6, "setTransform:", &v19);

  objc_msgSend(*(id *)(a1 + 32), "colorViewContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v16;
  v20 = v18;
  v21 = v14;
  objc_msgSend(v7, "setTransform:", &v19);

}

uint64_t __39__WFApertureIconView_setMode_animated___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __39__WFApertureIconView_setMode_animated___block_invoke_11(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "colorView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setHidden:", 1);

}

uint64_t __39__WFApertureIconView_setMode_animated___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __39__WFApertureIconView_setMode_animated___block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  _QWORD v4[5];
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _QWORD v8[5];
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v2 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __39__WFApertureIconView_setMode_animated___block_invoke_7;
  v8[3] = &unk_24C5AB4F0;
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = *(_OWORD *)(a1 + 40);
  v10 = *(_OWORD *)(a1 + 56);
  v11 = *(_OWORD *)(a1 + 72);
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithSpringDuration:bounce:initialSpringVelocity:delay:options:animations:completion:", 4, v8, 0, 0.55, 0.5, 0.0, 0.0);
  v4[0] = v2;
  v4[1] = 3221225472;
  v4[2] = __39__WFApertureIconView_setMode_animated___block_invoke_8;
  v4[3] = &unk_24C5AB4F0;
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = *(_OWORD *)(a1 + 88);
  v6 = *(_OWORD *)(a1 + 104);
  v7 = *(_OWORD *)(a1 + 120);
  return objc_msgSend(MEMORY[0x24BEBDB00], "animateWithSpringDuration:bounce:initialSpringVelocity:delay:options:animations:completion:", 4, v4, 0, 0.55, 0.0, 0.0, 0.0);
}

void __39__WFApertureIconView_setMode_animated___block_invoke_7(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v4[3];

  objc_msgSend(*(id *)(a1 + 32), "iconImageViewContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v3;
  v4[2] = *(_OWORD *)(a1 + 72);
  objc_msgSend(v2, "setTransform:", v4);

}

void __39__WFApertureIconView_setMode_animated___block_invoke_8(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v4[3];

  objc_msgSend(*(id *)(a1 + 32), "colorViewContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v3;
  v4[2] = *(_OWORD *)(a1 + 72);
  objc_msgSend(v2, "setTransform:", v4);

}

void __83__WFApertureIconView_setIconImage_associatedIcon_style_previousIconStyle_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "iconImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_removeAllRetargetableAnimations:", 1);

  objc_msgSend(*(id *)(a1 + 32), "iconImageViewContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_removeAllRetargetableAnimations:", 1);

  objc_opt_class();
  v4 = (objc_opt_isKindOfClass() & 1) == 0 && *(_QWORD *)(a1 + 56) == 1;
  objc_msgSend(*(id *)(a1 + 32), "iconImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMasksToBounds:", v4);

  objc_msgSend(*(id *)(a1 + 32), "setIconStyle:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "iconImageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:", *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 32), "iconImageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "isEnabled") & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "symbolColor");
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "sbui_inactiveColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTintColor:", v9);

  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "colorView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "iconStackPlatterColorForImage:", *(_QWORD *)(a1 + 48));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBackgroundColor:", v10);

}

uint64_t __83__WFApertureIconView_setIconImage_associatedIcon_style_previousIconStyle_animated___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __83__WFApertureIconView_setIconImage_associatedIcon_style_previousIconStyle_animated___block_invoke_134(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  CATransform3D v7;

  objc_msgSend(*(id *)(a1 + 32), "iconImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKeyPath:", &unk_24C5B6450, CFSTR("filters.gaussianBlur.inputRadius"));

  objc_msgSend(*(id *)(a1 + 32), "iconImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "iconImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CATransform3DMakeScale(&v7, 0.87, 0.87, 1.0);
  objc_msgSend(v6, "setTransform:", &v7);

}

uint64_t __83__WFApertureIconView_setIconImage_associatedIcon_style_previousIconStyle_animated___block_invoke_138(uint64_t a1)
{
  uint64_t v2;
  _QWORD v4[5];
  _QWORD v5[5];
  _QWORD v6[4];
  uint64_t v7;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __83__WFApertureIconView_setIconImage_associatedIcon_style_previousIconStyle_animated___block_invoke_2_139;
  v6[3] = &unk_24C5ABB88;
  v7 = *(_QWORD *)(a1 + 32);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __83__WFApertureIconView_setIconImage_associatedIcon_style_previousIconStyle_animated___block_invoke_3;
  v5[3] = &unk_24C5AB428;
  v5[4] = v7;
  v6[0] = MEMORY[0x24BDAC760];
  objc_msgSend(MEMORY[0x24BEBDB00], "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:", 1, v6, v5, 1.0, 0.45, 0.0, 0.0, 0.0, 0.0);
  v4[0] = v2;
  v4[1] = 3221225472;
  v4[2] = __83__WFApertureIconView_setIconImage_associatedIcon_style_previousIconStyle_animated___block_invoke_4;
  v4[3] = &unk_24C5ABB88;
  v4[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x24BEBDB00], "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:", 1, v4, 0, 1.0, 0.34, 0.0, 0.0, 0.0, 0.0);
}

void __83__WFApertureIconView_setIconImage_associatedIcon_style_previousIconStyle_animated___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  void *v9;
  void *v10;
  CATransform3D v11;
  CATransform3D a;
  CATransform3D v13;
  _OWORD v14[8];

  objc_msgSend(*(id *)(a1 + 32), "iconImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.4);

  objc_msgSend(*(id *)(a1 + 32), "iconImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_OWORD *)(a1 + 120);
  v14[4] = *(_OWORD *)(a1 + 104);
  v14[5] = v5;
  v6 = *(_OWORD *)(a1 + 152);
  v14[6] = *(_OWORD *)(a1 + 136);
  v14[7] = v6;
  v7 = *(_OWORD *)(a1 + 56);
  v14[0] = *(_OWORD *)(a1 + 40);
  v14[1] = v7;
  v8 = *(_OWORD *)(a1 + 88);
  v14[2] = *(_OWORD *)(a1 + 72);
  v14[3] = v8;
  objc_msgSend(v4, "setTransform:", v14);

  objc_msgSend(*(id *)(a1 + 32), "iconImageViewContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  CATransform3DMakeRotation(&a, 1.57079633, 0.0, 1.0, 0.0);
  CATransform3DMakeScale(&v11, 0.94, 0.94, 1.0);
  CATransform3DConcat(&v13, &a, &v11);
  objc_msgSend(v10, "setTransform:", &v13);

}

void __83__WFApertureIconView_setIconImage_associatedIcon_style_previousIconStyle_animated___block_invoke_6(uint64_t a1)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (objc_msgSend(*(id *)(a1 + 32), "mode"))
  {
    objc_msgSend(*(id *)(a1 + 32), "iconImageView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAlpha:", 1.0);

  }
  else
  {
    v12 = *MEMORY[0x24BDE5598];
    v13 = *(_QWORD *)(MEMORY[0x24BDE5598] + 16);
    v2 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
    v17 = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
    v18 = v2;
    v3 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
    v19 = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
    v20 = v3;
    v4 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
    v15 = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
    v16 = v4;
    objc_msgSend(*(id *)(a1 + 32), "iconImageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0x3F7CAC083126E979;
    objc_msgSend(v6, "setTransform:", &v12);

    v7 = MEMORY[0x24BDAC760];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __83__WFApertureIconView_setIconImage_associatedIcon_style_previousIconStyle_animated___block_invoke_7;
    v11[3] = &unk_24C5ABB88;
    v11[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:", v11, 0.4);
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __83__WFApertureIconView_setIconImage_associatedIcon_style_previousIconStyle_animated___block_invoke_8;
    v10[3] = &unk_24C5ABB88;
    v10[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BEBDB00], "animateWithSpringDuration:bounce:initialSpringVelocity:delay:options:animations:completion:", 2, v10, 0, 0.9, 0.5, 3.0, 0.0);
    v9[0] = v7;
    v9[1] = 3221225472;
    v9[2] = __83__WFApertureIconView_setIconImage_associatedIcon_style_previousIconStyle_animated___block_invoke_9;
    v9[3] = &unk_24C5ABB88;
    v9[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BEBDB00], "animateWithSpringDuration:bounce:initialSpringVelocity:delay:options:animations:completion:", 2, v9, 0, 0.9, 0.6, 3.0, 0.0);
  }
}

void __83__WFApertureIconView_setIconImage_associatedIcon_style_previousIconStyle_animated___block_invoke_7(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "iconImageView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

void __83__WFApertureIconView_setIconImage_associatedIcon_style_previousIconStyle_animated___block_invoke_8(uint64_t a1)
{
  void *v1;
  void *v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _OWORD v7[8];

  objc_msgSend(*(id *)(a1 + 32), "iconImageViewContainer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
  v7[4] = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
  v7[5] = v3;
  v4 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
  v7[6] = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
  v7[7] = v4;
  v5 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
  v7[0] = *MEMORY[0x24BDE5598];
  v7[1] = v5;
  v6 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
  v7[2] = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
  v7[3] = v6;
  objc_msgSend(v2, "setTransform:", v7);

}

void __83__WFApertureIconView_setIconImage_associatedIcon_style_previousIconStyle_animated___block_invoke_9(uint64_t a1)
{
  void *v1;
  void *v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _OWORD v7[8];

  objc_msgSend(*(id *)(a1 + 32), "iconImageView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
  v7[4] = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
  v7[5] = v3;
  v4 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
  v7[6] = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
  v7[7] = v4;
  v5 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
  v7[0] = *MEMORY[0x24BDE5598];
  v7[1] = v5;
  v6 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
  v7[2] = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
  v7[3] = v6;
  objc_msgSend(v2, "setTransform:", v7);

}

void __83__WFApertureIconView_setIconImage_associatedIcon_style_previousIconStyle_animated___block_invoke_2_139(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "iconImageView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setValue:forKeyPath:", &unk_24C5B6440, CFSTR("filters.gaussianBlur.inputRadius"));

}

void __83__WFApertureIconView_setIconImage_associatedIcon_style_previousIconStyle_animated___block_invoke_3(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "iconImageView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setFilters:", 0);

}

void __83__WFApertureIconView_setIconImage_associatedIcon_style_previousIconStyle_animated___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _OWORD v9[8];

  objc_msgSend(*(id *)(a1 + 32), "iconImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  if (!objc_msgSend(*(id *)(a1 + 32), "mode"))
  {
    objc_msgSend(*(id *)(a1 + 32), "iconImageView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
    v9[4] = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
    v9[5] = v5;
    v6 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
    v9[6] = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
    v9[7] = v6;
    v7 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
    v9[0] = *MEMORY[0x24BDE5598];
    v9[1] = v7;
    v8 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
    v9[2] = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
    v9[3] = v8;
    objc_msgSend(v4, "setTransform:", v9);

  }
}

void __39__WFApertureIconView_setIcon_animated___block_invoke(uint64_t a1)
{
  id v2;

  +[WFIconViewImageGenerator loadIcon:size:style:](WFIconViewImageGenerator, "loadIcon:size:style:", *(_QWORD *)(a1 + 32), 3, 50.0, 50.0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setIconImage:associatedIcon:style:previousIconStyle:animated:", v2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 64));

}

void __35__WFApertureIconView_sizeThatFits___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[5];
  _QWORD v4[6];

  v4[5] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("square.and.pencil");
  v3[1] = CFSTR("music");
  v4[0] = &unk_24C5B6400;
  v4[1] = &unk_24C5B6410;
  v0 = *MEMORY[0x24BEC17A0];
  v3[2] = CFSTR("apple.keynote");
  v3[3] = v0;
  v4[2] = &unk_24C5B6400;
  v4[3] = &unk_24C5B6420;
  v3[4] = *MEMORY[0x24BEC16C8];
  v4[4] = &unk_24C5B6430;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, v3, 5);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)sizeThatFits__horizontalWidthIncreaseOverrideMapping;
  sizeThatFits__horizontalWidthIncreaseOverrideMapping = v1;

}

uint64_t __35__WFApertureIconView_initWithIcon___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setMode:animated:", 1, 1);
}

+ (id)defaultSymbolConfiguration
{
  return +[WFApertureSymbolConfiguration configurationWithPointSize:weight:](WFApertureSymbolConfiguration, "configurationWithPointSize:weight:", 5, 15.0);
}

+ (id)configurationForSymbol:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  unfilledVariantForSymbolName(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (configurationForSymbol__onceToken != -1)
    dispatch_once(&configurationForSymbol__onceToken, &__block_literal_global_40);
  objc_msgSend((id)configurationForSymbol__symbolConfigurationMapping, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    if (objc_msgSend(v3, "containsString:", CFSTR(".circle")))
      +[WFApertureSymbolConfiguration configurationWithPointSize:weight:](WFApertureSymbolConfiguration, "configurationWithPointSize:weight:", 5, 19.0);
    else
      objc_msgSend((id)objc_opt_class(), "defaultSymbolConfiguration");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

+ (CGSize)opticalAlignmentForSymbol:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  unfilledVariantForSymbolName(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (opticalAlignmentForSymbol__onceToken != -1)
    dispatch_once(&opticalAlignmentForSymbol__onceToken, &__block_literal_global_84);
  objc_msgSend((id)opticalAlignmentForSymbol__opticalAlignmentOverrideMapping, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "CGSizeValue");
  v6 = v5;
  v8 = v7;

  if (v6 == *MEMORY[0x24BDBF148] && v8 == *(double *)(MEMORY[0x24BDBF148] + 8))
  {
    objc_msgSend((id)objc_opt_class(), "configurationForSymbol:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pointSize");
    v12 = v11;

    +[WFSymbolAlignment absoluteOffsetFor:fontSize:](WFSymbolAlignment, "absoluteOffsetFor:fontSize:", v3, v12);
    v6 = v13;
    v8 = v14;
  }

  v15 = v6;
  v16 = v8;
  result.height = v16;
  result.width = v15;
  return result;
}

+ (id)preferredImageForSymbolName:(id)a3
{
  void *v4;
  void (**v5)(void *, void *);
  void *v6;
  void *v7;
  _QWORD aBlock[5];

  unfilledVariantForSymbolName(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__WFApertureIconView_preferredImageForSymbolName___block_invoke;
  aBlock[3] = &__block_descriptor_40_e27___UIImage_16__0__NSString_8l;
  aBlock[4] = a1;
  v5 = (void (**)(void *, void *))_Block_copy(aBlock);
  if ((objc_msgSend(&unk_24C5B6478, "containsObject:", v4) & 1) != 0
    || (objc_msgSend(v4, "stringByAppendingString:", CFSTR(".fill")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v5[2](v5, v6),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        !v7))
  {
    v5[2](v5, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (id)downscaledImageForOriginalImage:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  CGFloat v7;
  void *v8;
  CGSize v10;

  v3 = (void *)MEMORY[0x24BEBD8F8];
  v4 = a3;
  objc_msgSend(v3, "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  v7 = v6;
  v10.width = 36.0;
  v10.height = 36.0;
  UIGraphicsBeginImageContextWithOptions(v10, 0, v7);

  objc_msgSend(v4, "drawInRect:", 0.0, 0.0, 36.0, 36.0);
  UIGraphicsGetImageFromCurrentImageContext();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v8;
}

id __50__WFApertureIconView_preferredImageForSymbolName___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = a2;
  objc_msgSend((id)objc_opt_class(), "configurationForSymbol:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BEC14E0];
  objc_msgSend(v3, "pointSize");
  objc_msgSend(v4, "glyphNamed:pointSize:symbolWeight:scaleFactor:", v2, objc_msgSend(v3, "weight"), v5, 4.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UIImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = (void *)MEMORY[0x24BEBD640];
    v9 = (void *)MEMORY[0x24BEBD660];
    objc_msgSend(v3, "pointSize");
    objc_msgSend(v9, "configurationWithPointSize:weight:", 5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_systemImageNamed:withConfiguration:", v2, v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

void __48__WFApertureIconView_opticalAlignmentForSymbol___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[8];
  _QWORD v11[9];

  v11[8] = *MEMORY[0x24BDAC8D0];
  v10[0] = CFSTR("square.and.pencil");
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:", 1.6, -1.3);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v0;
  v10[1] = CFSTR("music");
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:", 0.0, -0.3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v1;
  v10[2] = CFSTR("apple.pages");
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:", 0.0, -0.3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v2;
  v10[3] = CFSTR("apple.numbers");
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:", 0.0, -1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v3;
  v10[4] = CFSTR("star");
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:", 0.0, -0.3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[4] = v4;
  v10[5] = CFSTR("pin");
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:", 0.0, 1.3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[5] = v5;
  v10[6] = CFSTR("alarm");
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:", 0.0, -0.3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[6] = v6;
  v10[7] = CFSTR("rocket");
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGSize:", 0.0, -0.3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[7] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 8);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)opticalAlignmentForSymbol__opticalAlignmentOverrideMapping;
  opticalAlignmentForSymbol__opticalAlignmentOverrideMapping = v8;

}

void __45__WFApertureIconView_configurationForSymbol___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
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
  _QWORD v22[20];
  _QWORD v23[22];

  v23[20] = *MEMORY[0x24BDAC8D0];
  v22[0] = CFSTR("timer");
  +[WFApertureSymbolConfiguration configurationWithPointSize:weight:](WFApertureSymbolConfiguration, "configurationWithPointSize:weight:", 6, 19.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v21;
  v22[1] = CFSTR("clock");
  +[WFApertureSymbolConfiguration configurationWithPointSize:weight:](WFApertureSymbolConfiguration, "configurationWithPointSize:weight:", 6, 19.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v20;
  v22[2] = CFSTR("alarm");
  +[WFApertureSymbolConfiguration configurationWithPointSize:weight:](WFApertureSymbolConfiguration, "configurationWithPointSize:weight:", 6, 17.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v19;
  v22[3] = CFSTR("doc.viewfinder");
  +[WFApertureSymbolConfiguration configurationWithPointSize:weight:](WFApertureSymbolConfiguration, "configurationWithPointSize:weight:", 5, 17.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v18;
  v22[4] = CFSTR("headphones");
  +[WFApertureSymbolConfiguration configurationWithPointSize:weight:](WFApertureSymbolConfiguration, "configurationWithPointSize:weight:", 5, 16.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v17;
  v22[5] = CFSTR("appletvremote.gen4");
  +[WFApertureSymbolConfiguration configurationWithPointSize:weight:](WFApertureSymbolConfiguration, "configurationWithPointSize:weight:", 5, 19.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[5] = v16;
  v22[6] = CFSTR("apple.podcasts");
  +[WFApertureSymbolConfiguration configurationWithPointSize:weight:](WFApertureSymbolConfiguration, "configurationWithPointSize:weight:", 6, 19.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[6] = v15;
  v22[7] = CFSTR("square.and.pencil");
  +[WFApertureSymbolConfiguration configurationWithPointSize:weight:](WFApertureSymbolConfiguration, "configurationWithPointSize:weight:", 5, 19.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[7] = v14;
  v22[8] = CFSTR("music");
  +[WFApertureSymbolConfiguration configurationWithPointSize:weight:](WFApertureSymbolConfiguration, "configurationWithPointSize:weight:", 5, 18.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[8] = v13;
  v22[9] = CFSTR("apple.freeform");
  +[WFApertureSymbolConfiguration configurationWithPointSize:weight:](WFApertureSymbolConfiguration, "configurationWithPointSize:weight:", 6, 17.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[9] = v12;
  v22[10] = CFSTR("apple.pages");
  +[WFApertureSymbolConfiguration configurationWithPointSize:weight:](WFApertureSymbolConfiguration, "configurationWithPointSize:weight:", 6, 18.0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v23[10] = v0;
  v22[11] = CFSTR("apple.numbers");
  +[WFApertureSymbolConfiguration configurationWithPointSize:weight:](WFApertureSymbolConfiguration, "configurationWithPointSize:weight:", 6, 17.0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v23[11] = v1;
  v22[12] = CFSTR("apple.keynote");
  +[WFApertureSymbolConfiguration configurationWithPointSize:weight:](WFApertureSymbolConfiguration, "configurationWithPointSize:weight:", 6, 18.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v23[12] = v2;
  v22[13] = CFSTR("video");
  +[WFApertureSymbolConfiguration configurationWithPointSize:weight:](WFApertureSymbolConfiguration, "configurationWithPointSize:weight:", 5, 17.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v23[13] = v3;
  v22[14] = CFSTR("star");
  +[WFApertureSymbolConfiguration configurationWithPointSize:weight:](WFApertureSymbolConfiguration, "configurationWithPointSize:weight:", 7, 17.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23[14] = v4;
  v22[15] = CFSTR("pin");
  +[WFApertureSymbolConfiguration configurationWithPointSize:weight:](WFApertureSymbolConfiguration, "configurationWithPointSize:weight:", 5, 17.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[15] = v5;
  v22[16] = CFSTR("note.text");
  +[WFApertureSymbolConfiguration configurationWithPointSize:weight:](WFApertureSymbolConfiguration, "configurationWithPointSize:weight:", 5, 18.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[16] = v6;
  v22[17] = CFSTR("qrcode.viewfinder");
  +[WFApertureSymbolConfiguration configurationWithPointSize:weight:](WFApertureSymbolConfiguration, "configurationWithPointSize:weight:", 6, 19.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[17] = v7;
  v22[18] = CFSTR("rectangle.grid.2x2");
  +[WFApertureSymbolConfiguration configurationWithPointSize:weight:](WFApertureSymbolConfiguration, "configurationWithPointSize:weight:", 5, 17.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[18] = v8;
  v22[19] = CFSTR("rocket");
  +[WFApertureSymbolConfiguration configurationWithPointSize:weight:](WFApertureSymbolConfiguration, "configurationWithPointSize:weight:", 5, 16.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[19] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 20);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)configurationForSymbol__symbolConfigurationMapping;
  configurationForSymbol__symbolConfigurationMapping = v10;

}

@end
