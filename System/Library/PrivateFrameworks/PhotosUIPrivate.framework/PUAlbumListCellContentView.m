@implementation PUAlbumListCellContentView

- (PUAlbumListCellContentView)initWithFrame:(CGRect)a3
{
  PUAlbumListCellContentView *v3;
  PUAlbumListCellContentView *v4;
  PUStackView *v5;
  PUStackView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PUAlbumListCellContentView;
  v3 = -[PUAlbumListCellContentView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_enabled = 1;
    v3->__showsTitleAndSubtitle = 1;
    v3->_usesLabelForTitle = 1;
    v5 = [PUStackView alloc];
    -[PUAlbumListCellContentView bounds](v4, "bounds");
    v6 = -[PUStackView initWithFrame:](v5, "initWithFrame:");
    -[PUAlbumListCellContentView addSubview:](v4, "addSubview:", v6);
    -[PUAlbumListCellContentView _setStackView:](v4, "_setStackView:", v6);
    -[PUAlbumListCellContentView setOpaque:](v4, "setOpaque:", 0);

  }
  return v4;
}

- (CGPoint)_deleteButtonCenter
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  -[PUAlbumListCellContentView stackView](self, "stackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topLeftCornerOfFrontStackItem");
  -[PUAlbumListCellContentView convertPoint:fromView:](self, "convertPoint:fromView:", v3);
  v5 = v4 + 2.0;
  v7 = v6 + 3.0;

  v8 = v5;
  v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  double v24;
  double *v25;
  CGFloat v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  NSString *v45;
  _BOOL4 IsAccessibilityCategory;
  uint64_t v47;
  int64_t layout;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double MinX;
  _BOOL4 v62;
  char v63;
  double v64;
  double v65;
  double v66;
  double v67;
  void *v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  void *v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double x;
  CGFloat v83;
  CGFloat v84;
  CGFloat v85;
  double v86;
  double MaxX;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  CGFloat v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  void *v111;
  CGFloat v112;
  double v113;
  double v114;
  double v115;
  double v116;
  CGFloat v117;
  uint64_t v118;
  double v119;
  int v120;
  double v121;
  CGFloat v122;
  CGFloat v123;
  int v124;
  _BOOL4 v125;
  double v126;
  double v127;
  CGFloat v128;
  void *rect;
  double recta;
  double v131;
  CGFloat v132;
  NSString *v133;
  void *v134;
  CGFloat v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  void *v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;
  CGRect v146;
  CGRect v147;
  CGRect v148;
  CGRect v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;
  CGRect v153;
  CGRect v154;
  CGRect v155;
  CGRect v156;
  CGRect v157;

  *(_QWORD *)&v143.origin.y = self;
  *(_QWORD *)&v143.size.width = PUAlbumListCellContentView;
  -[CGFloat layoutSubviews]((objc_super *)&v143.origin.y, sel_layoutSubviews);
  -[PUAlbumListCellContentView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v126 = v7;
  v9 = v8;
  -[PUAlbumListCellContentView _subtitleLabel](self, "_subtitleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAlbumListCellContentView _titleTextField](self, "_titleTextField");
  v11 = objc_claimAutoreleasedReturnValue();
  -[PUAlbumListCellContentView _titleLabel](self, "_titleLabel");
  v12 = objc_claimAutoreleasedReturnValue();
  -[PUAlbumListCellContentView _deleteButton](self, "_deleteButton");
  v13 = objc_claimAutoreleasedReturnValue();
  -[PUAlbumListCellContentView stackView](self, "stackView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAlbumListCellContentView customImageView](self, "customImageView");
  v15 = objc_claimAutoreleasedReturnValue();
  v134 = (void *)v15;
  if (v15 && (v16 = (void *)v15, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v17 = *(double *)(MEMORY[0x1E0DC51A8] + 8);
    v118 = *MEMORY[0x1E0DC51A8];
    objc_msgSend(v16, "collageSize");
    v19 = v18;
    v138 = v20;
  }
  else
  {
    objc_msgSend(v14, "stackSize");
    v19 = v21;
    v138 = v22;
    objc_msgSend(v14, "stackOffset");
    v118 = v23;
    v17 = v24;
  }
  v131 = v19;
  v122 = v4;
  v123 = v6;
  if (v10)
    v120 = objc_msgSend(v10, "isHidden") ^ 1;
  else
    v120 = 0;
  v25 = (double *)MEMORY[0x1E0C9D648];
  v26 = *MEMORY[0x1E0C9D648];
  if (v11)
    v27 = (void *)v11;
  else
    v27 = (void *)v12;
  v28 = *MEMORY[0x1E0C9D820];
  v29 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  objc_msgSend(v27, "sizeThatFits:", *MEMORY[0x1E0C9D820], v29, v118);
  v128 = v30;
  objc_msgSend(v10, "sizeThatFits:", v28, v29);
  v32 = v31;
  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "albumListTitleLabelFont");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  rect = v33;
  objc_msgSend(v33, "albumListSubtitleLabelFont");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "ascender");
  v37 = v36;
  objc_msgSend(v34, "descender");
  v39 = v38;
  objc_msgSend(v35, "ascender");
  v41 = v40;
  v142 = v35;
  objc_msgSend(v35, "descender");
  v43 = v42;
  v125 = -[PUAlbumListCellContentView shouldCenterTextHorizontally](self, "shouldCenterTextHorizontally");
  v124 = -[PUAlbumListCellContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "preferredContentSizeCategory");
  v45 = (NSString *)objc_claimAutoreleasedReturnValue();

  v133 = v45;
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v45);
  v47 = v12;
  layout = self->_layout;
  v137 = v17;
  v143.origin.x = v26;
  if ((unint64_t)(layout - 1) < 2)
  {
    v121 = v32;
    v127 = 0.0;
    v49 = 0.0;
    v50 = (void *)v47;
    v51 = (void *)v13;
    v52 = v14;
    v53 = v134;
    if (v11 | v47)
    {
      PXVisionScaledFloat();
      objc_msgSend(v34, "_scaledValueForValue:useLanguageAwareScaling:", 1);
      v55 = v54 - v37;
      if (PUMainScreenScale_onceToken != -1)
        dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_32103);
      v49 = round(*(double *)&PUMainScreenScale_screenScale * v55) / *(double *)&PUMainScreenScale_screenScale;
    }
    -[PUAlbumListCellContentView _subtitleLabel](self, "_subtitleLabel");
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    if (v56)
    {
      objc_msgSend(v142, "_scaledValueForValue:useLanguageAwareScaling:", 1, 20.0);
      v58 = v43 + v39 + v57 - v41;
      if (PUMainScreenScale_onceToken != -1)
        dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_32103);
      v127 = round(*(double *)&PUMainScreenScale_screenScale * v58) / *(double *)&PUMainScreenScale_screenScale;
    }
    v144.origin.x = v122;
    v144.origin.y = v123;
    v144.size.width = v126;
    v144.size.height = v9;
    v59 = CGRectGetMidX(v144) + v131 * -0.5;
    if (-[PUAlbumListCellContentView topInsetEnabled](self, "topInsetEnabled"))
    {
      v60 = 10.0;
      if (layout == 2)
        v60 = 8.0;
      objc_msgSend(v34, "_scaledValueForValue:useLanguageAwareScaling:", 1, v60);
    }
    else
    {
      v146.origin.x = v122;
      v146.origin.y = v123;
      v146.size.width = v126;
      v146.size.height = v9;
      MinX = CGRectGetMinX(v146);
    }
    v147.origin.y = MinX;
    v75 = rect;
    v147.origin.x = v59;
    recta = v147.origin.y;
    v147.size.width = v131;
    v147.size.height = v138;
    v79 = v49 + v137 + CGRectGetMaxY(v147);
    if (v125)
    {
      v80 = v131;
      v81 = v131;
      x = v143.origin.x;
    }
    else
    {
      objc_msgSend(v10, "sizeThatFits:", v131, v138);
      if (v131 >= v86)
        v80 = v86;
      else
        v80 = v131;
      if (v124)
      {
        v148.origin.x = v59;
        v148.origin.y = recta;
        v148.size.width = v131;
        v148.size.height = v138;
        v81 = v131;
        x = CGRectGetMaxX(v148) - v80;
      }
      else
      {
        v81 = v131;
        x = v59;
      }
    }
    v84 = v81;
    v74 = v59;
    goto LABEL_65;
  }
  v50 = (void *)v47;
  v140 = v25[1];
  v135 = v25[2];
  if (layout)
  {
    v83 = v25[3];
    x = v26;
    v72 = 0.0;
    v132 = v83;
    v81 = v25[2];
    v79 = v25[1];
    v84 = 0.0;
    v85 = 0.0;
    v74 = 0.0;
    v51 = (void *)v13;
    v52 = v14;
    v53 = v134;
    v75 = rect;
    goto LABEL_66;
  }
  v62 = IsAccessibilityCategory;
  v121 = v32;
  if (v11 | v47)
    v63 = IsAccessibilityCategory;
  else
    v63 = 1;
  v127 = 0.0;
  if (v11 | v47)
    v64 = 10.0;
  else
    v64 = 0.0;
  if ((v63 & 1) == 0)
  {
    v65 = 48.0;
    if (v120)
      v65 = 40.0;
    objc_msgSend(v34, "_scaledValueForValue:useLanguageAwareScaling:", 1, v65);
    v67 = v66 - v37;
    if (PUMainScreenScale_onceToken != -1)
      dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_32103);
    v64 = round(*(double *)&PUMainScreenScale_screenScale * v67) / *(double *)&PUMainScreenScale_screenScale;
  }
  -[PUAlbumListCellContentView _subtitleLabel](self, "_subtitleLabel");
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  if (v68)
  {
    objc_msgSend(v142, "_scaledValueForValue:useLanguageAwareScaling:", 1, 20.0);
    v70 = v39 + v69 - v41;
    if (v62)
      v71 = 0.0;
    else
      v71 = v70;
    if (PUMainScreenScale_onceToken != -1)
      dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_32103);
    v127 = round(*(double *)&PUMainScreenScale_screenScale * v71) / *(double *)&PUMainScreenScale_screenScale;
  }
  v72 = fmax(v131, 70.0) + 16.0;
  -[PUAlbumListCellContentView xInset](self, "xInset");
  v74 = v73;
  if (PUMainScreenScale_onceToken != -1)
    dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_32103);
  v51 = (void *)v13;
  v75 = rect;
  v76 = round(*(double *)&PUMainScreenScale_screenScale * ((v9 - v72) * 0.5));
  v77 = v76 / *(double *)&PUMainScreenScale_screenScale;
  v52 = v14;
  recta = v76 / *(double *)&PUMainScreenScale_screenScale;
  if ((v125 | v124 ^ 1) == 1)
  {
    v145.origin.x = v74;
    v145.origin.y = v76 / *(double *)&PUMainScreenScale_screenScale;
    v145.size.width = v72;
    v145.size.height = v72;
    v78 = v126 - CGRectGetMaxX(v145);
  }
  else
  {
    v149.origin.x = v122;
    v149.origin.y = v123;
    v149.size.width = v126;
    v149.size.height = v9;
    MaxX = CGRectGetMaxX(v149);
    v150.origin.x = v74;
    v150.origin.y = v77;
    v150.size.width = v72;
    v150.size.height = v72;
    v88 = MaxX - CGRectGetWidth(v150);
    v151.origin.x = v74;
    v151.origin.y = v77;
    v151.size.width = v72;
    v151.size.height = v72;
    v74 = v88 - CGRectGetMinX(v151);
    v152.origin.x = v74;
    v152.origin.y = v77;
    v152.size.width = v72;
    v152.size.height = v72;
    v78 = CGRectGetMinX(v152);
  }
  v53 = v134;
  v83 = v128;
  v81 = v78 + -8.0 + -4.0;
  v89 = v74;
  v90 = recta;
  v91 = v72;
  v92 = v72;
  if ((v124 & 1) != 0)
  {
    v93 = CGRectGetMinX(*(CGRect *)&v89) + -8.0;
    v153.origin.x = v143.origin.x;
    v153.origin.y = v140;
    v153.size.width = v81;
    v153.size.height = v128;
    x = v93 - CGRectGetWidth(v153);
  }
  else
  {
    x = CGRectGetMaxX(*(CGRect *)&v89) + 8.0;
  }
  v79 = v119 + v64;
  if (v120)
  {
    v84 = v72;
    v59 = x;
    v80 = v81;
    v138 = v84;
LABEL_65:
    v154.origin.x = v59;
    v154.origin.y = v79;
    v154.size.width = v81;
    v83 = v128;
    v154.size.height = v128;
    v132 = v121;
    v140 = v127 + CGRectGetMaxY(v154);
    v135 = v80;
    v143.origin.x = x;
    x = v59;
    v72 = v138;
    v85 = recta;
    goto LABEL_66;
  }
  v84 = v72;
  v85 = recta;
  v132 = 0.0;
LABEL_66:
  v94 = PURoundRectToPixel(v74, v85, v84, v72);
  v96 = v95;
  v98 = v97;
  v100 = v99;
  v101 = PUExtendRectToPixel(x, v79, v81, v83);
  v103 = v102;
  v105 = v104;
  v107 = v106;
  v143.origin.x = PUExtendRectToPixel(v143.origin.x, v140, v135, v132);
  v139 = v109;
  v141 = v108;
  v136 = v110;
  objc_msgSend(v52, "setFrame:", v94, v96, v98, v100);
  objc_msgSend(v53, "setFrame:", v94, v96, v98, v100);
  objc_msgSend((id)v11, "setFrame:", v101, v103, v105, v107);
  objc_msgSend(v50, "setFrame:", v101, v103, v105, v107);
  objc_msgSend(v10, "setFrame:", v143.origin.x, v141, v139, v136);
  -[PUAlbumListCellContentView _deleteButtonCenter](self, "_deleteButtonCenter");
  objc_msgSend(v51, "setCenter:");
  -[PUAlbumListCellContentView checkmarkView](self, "checkmarkView");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  if (v111)
  {
    v155.origin.x = v94;
    v155.origin.y = v96;
    v155.size.width = v98;
    v155.size.height = v100;
    v112 = v137 + CGRectGetMaxY(v155) - v96;
    objc_msgSend(v111, "bounds");
    v114 = v113;
    v116 = v115;
    v156.origin.x = v94;
    v156.origin.y = v96;
    v156.size.width = v98;
    v156.size.height = v112;
    v117 = CGRectGetMaxX(v156) - v114 + -3.5;
    v157.origin.x = v94;
    v157.origin.y = v96;
    v157.size.width = v98;
    v157.size.height = v112;
    objc_msgSend(v111, "setFrame:", v117, CGRectGetMaxY(v157) - v116 + -3.5, v114, v116);
  }

}

- (PXFocusInfo)focusInfo
{
  void *v2;
  void *v3;
  void *v4;

  -[PUAlbumListCellContentView stackView](self, "stackView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D7B448];
  objc_msgSend(v2, "cornerRadius");
  objc_msgSend(v3, "focusInfoWithView:cornerRadius:cornerCurve:", v2, *MEMORY[0x1E0CD2A60]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXFocusInfo *)v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  NSString *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  objc_super v24;
  CGSize result;

  height = a3.height;
  width = a3.width;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (UIContentSizeCategoryIsAccessibilityCategory(v7) && !self->_layout)
  {
    -[PUAlbumListCellContentView _subtitleLabel](self, "_subtitleLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sizeThatFits:", width, height);
    v15 = v14;

    -[PUAlbumListCellContentView _titleTextField](self, "_titleTextField");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAlbumListCellContentView _titleLabel](self, "_titleLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v16;
    if (v16 || (v18 = v17) != 0)
    {
      objc_msgSend(v18, "sizeThatFits:", width, height);
      v15 = v15 + v19;
    }
    -[PUAlbumListCellContentView stackView](self, "stackView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "frame");
    v22 = v21;

    if (v15 >= v22)
      v23 = v15;
    else
      v23 = v22;
    v10 = v23 + 20.0;

  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)PUAlbumListCellContentView;
    -[PUAlbumListCellContentView sizeThatFits:](&v24, sel_sizeThatFits_, width, height);
    width = v8;
    v10 = v9;
  }

  v11 = width;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)setShowsTitle:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;

  v4 = a4;
  v5 = a3;
  if (-[PUAlbumListCellContentView _showsTitleAndSubtitle](self, "_showsTitleAndSubtitle") != a3)
  {
    -[PUAlbumListCellContentView _setShowsTitleAndSubtitle:](self, "_setShowsTitleAndSubtitle:", v5);
    -[PUAlbumListCellContentView _updateTitleFieldAnimated:](self, "_updateTitleFieldAnimated:", v4);
    -[PUAlbumListCellContentView _updateSubtitleLabelAnimated:](self, "_updateSubtitleLabelAnimated:", v4);
  }
}

- (void)handleTransitionFade:(BOOL)a3 animate:(BOOL)a4
{
  double v4;
  id v5;

  if (a3)
    v4 = 1.0;
  else
    v4 = 0.0;
  -[PUAlbumListCellContentView stackView](self, "stackView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setItemAlpha:", v4);

}

- (void)prepareForReuse
{
  void *v3;
  id v4;

  -[PUAlbumListCellContentView stackView](self, "stackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "prepareForReuse");

  -[PUAlbumListCellContentView avatarView](self, "avatarView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "prepareForReuse");

}

- (UIView)springLoadingTargetView
{
  void *v3;
  void *v4;
  PUAlbumListCellContentView *v5;
  uint64_t v6;
  void *v7;
  PUAlbumListCellContentView *v8;

  -[PUAlbumListCellContentView customImageView](self, "customImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[PUAlbumListCellContentView stackView](self, "stackView");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (PUAlbumListCellContentView *)v6;
    else
      v8 = self;
    v5 = v8;

  }
  return (UIView *)v5;
}

- (void)setCustomImageView:(id)a3
{
  UIView *v5;
  UIView *customImageView;
  UIView *v7;

  v5 = (UIView *)a3;
  customImageView = self->_customImageView;
  if (customImageView != v5)
  {
    v7 = v5;
    -[UIView removeFromSuperview](customImageView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_customImageView, a3);
    if (self->_customImageView)
    {
      -[PUAlbumListCellContentView addSubview:](self, "addSubview:");
      -[PUAlbumListCellContentView _updateSubviewOrdering](self, "_updateSubviewOrdering");
    }
    -[PUAlbumListCellContentView _updateStackViewAnimated:](self, "_updateStackViewAnimated:", 0);
    -[PUAlbumListCellContentView setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (void)setShouldCenterTextHorizontally:(BOOL)a3
{
  if (self->_shouldCenterTextHorizontally != a3)
  {
    self->_shouldCenterTextHorizontally = a3;
    -[PUAlbumListCellContentView _updateTitleStyle](self, "_updateTitleStyle");
  }
}

- (void)setTitle:(id)a3
{
  NSString *v4;
  NSString *v5;
  BOOL v6;
  NSString *v7;
  NSString *title;
  NSString *v9;

  v4 = (NSString *)a3;
  v5 = v4;
  if (self->_title != v4)
  {
    v9 = v4;
    v6 = -[NSString isEqualToString:](v4, "isEqualToString:");
    v5 = v9;
    if (!v6)
    {
      v7 = (NSString *)-[NSString copy](v9, "copy");
      title = self->_title;
      self->_title = v7;

      -[PUAlbumListCellContentView _updateTitleFieldAnimated:](self, "_updateTitleFieldAnimated:", 0);
      v5 = v9;
    }
  }

}

- (void)setSubtitle:(id)a3
{
  -[PUAlbumListCellContentView setSubtitle:animated:](self, "setSubtitle:animated:", a3, 0);
}

- (void)setSubtitle:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  NSString *v6;
  NSString *v7;
  BOOL v8;
  NSString *v9;
  NSString *subtitle;
  NSString *v11;

  v4 = a4;
  v6 = (NSString *)a3;
  v7 = v6;
  if (self->_subtitle != v6)
  {
    v11 = v6;
    v8 = -[NSString isEqualToString:](v6, "isEqualToString:");
    v7 = v11;
    if (!v8)
    {
      v9 = (NSString *)-[NSString copy](v11, "copy");
      subtitle = self->_subtitle;
      self->_subtitle = v9;

      -[PUAlbumListCellContentView _updateSubtitleLabelAnimated:](self, "_updateSubtitleLabelAnimated:", v4);
      v7 = v11;
    }
  }

}

- (void)setTitleFont:(id)a3
{
  UIFont *v5;
  UIFont *v6;

  v5 = (UIFont *)a3;
  if (self->_titleFont != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_titleFont, a3);
    -[PUAlbumListCellContentView _updateTitleStyle](self, "_updateTitleStyle");
    v5 = v6;
  }

}

- (void)setSubtitleFont:(id)a3
{
  UIFont *v5;
  UIFont *v6;

  v5 = (UIFont *)a3;
  if (self->_subtitleFont != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_subtitleFont, a3);
    -[PUAlbumListCellContentView _updateSubtitleLabelStyle](self, "_updateSubtitleLabelStyle");
    v5 = v6;
  }

}

- (void)setXInset:(double)a3
{
  if (self->_xInset != a3)
  {
    self->_xInset = a3;
    -[PUAlbumListCellContentView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setLayout:(int64_t)a3
{
  if (self->_layout != a3)
  {
    self->_layout = a3;
    -[PUAlbumListCellContentView _updateTitleFieldAnimated:](self, "_updateTitleFieldAnimated:", 0);
    -[PUAlbumListCellContentView _updateSubtitleLabelAnimated:](self, "_updateSubtitleLabelAnimated:", 0);
    -[PUAlbumListCellContentView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setEditing:(BOOL)a3
{
  -[PUAlbumListCellContentView setEditing:animated:](self, "setEditing:animated:", a3, 0);
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  double v6;
  void *v7;
  _QWORD v8[5];
  BOOL v9;

  if (self->_editing != a3)
  {
    self->_editing = a3;
    if (a4)
      v6 = 0.3;
    else
      v6 = 0.0;
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "beginIgnoringInteractionEvents");

    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __50__PUAlbumListCellContentView_setEditing_animated___block_invoke;
    v8[3] = &unk_1E58AAD68;
    v8[4] = self;
    v9 = a4;
    objc_msgSend(MEMORY[0x1E0DC3F10], "pu_animateWithEnforcedDuration:animations:completion:", v8, &__block_literal_global_7850, v6);
  }
}

- (void)setEnabled:(BOOL)a3
{
  -[PUAlbumListCellContentView setEnabled:animated:](self, "setEnabled:animated:", a3, 0);
}

- (void)setEnabled:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;

  if (self->_enabled != a3)
  {
    v4 = a4;
    self->_enabled = a3;
    -[PUAlbumListCellContentView _updateStackViewAnimated:](self, "_updateStackViewAnimated:", a4);
    -[PUAlbumListCellContentView _updateTitleFieldAnimated:](self, "_updateTitleFieldAnimated:", v4);
    -[PUAlbumListCellContentView _updateSubtitleLabelAnimated:](self, "_updateSubtitleLabelAnimated:", v4);
  }
}

- (void)setEditCapabilities:(unint64_t)a3
{
  -[PUAlbumListCellContentView setEditCapabilities:animated:](self, "setEditCapabilities:animated:", a3, 0);
}

- (void)setEditCapabilities:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;

  if (self->_editCapabilities != a3)
  {
    v4 = a4;
    self->_editCapabilities = a3;
    -[PUAlbumListCellContentView _updateDeleteButtonAnimated:](self, "_updateDeleteButtonAnimated:", a4);
    -[PUAlbumListCellContentView _updateStackViewAnimated:](self, "_updateStackViewAnimated:", v4);
    -[PUAlbumListCellContentView _updateTitleFieldAnimated:](self, "_updateTitleFieldAnimated:", v4);
    -[PUAlbumListCellContentView _updateSubtitleLabelAnimated:](self, "_updateSubtitleLabelAnimated:", v4);
  }
}

- (void)setShowsDeleteButtonWhenEditing:(BOOL)a3
{
  if (self->_showsDeleteButtonWhenEditing != a3)
  {
    self->_showsDeleteButtonWhenEditing = a3;
    -[PUAlbumListCellContentView _updateDeleteButtonAnimated:](self, "_updateDeleteButtonAnimated:", 0);
  }
}

- (void)setShowsAvatarView:(BOOL)a3
{
  if (self->_showsAvatarView != a3)
  {
    self->_showsAvatarView = a3;
    -[PUAlbumListCellContentView _updateAvatarView](self, "_updateAvatarView");
  }
}

- (void)_updateAvatarView
{
  _BOOL4 v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = -[PUAlbumListCellContentView showsAvatarView](self, "showsAvatarView");
  -[PUAlbumListCellContentView avatarView](self, "avatarView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  if (!v3)
  {
    objc_msgSend(v4, "removeFromSuperview");
LABEL_6:

    return;
  }

  if (!v7)
  {
    v5 = objc_alloc(MEMORY[0x1E0D7B670]);
    v7 = (id)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[PUAlbumListCellContentView stackView](self, "stackView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "embedInView:", v6);

    -[PUAlbumListCellContentView setAvatarView:](self, "setAvatarView:", v7);
    goto LABEL_6;
  }
}

- (void)setShowsCheckmarkView:(BOOL)a3
{
  if (self->_showsCheckmarkView != a3)
  {
    self->_showsCheckmarkView = a3;
    -[PUAlbumListCellContentView _updateCheckmarkView](self, "_updateCheckmarkView");
  }
}

- (void)_updateCheckmarkView
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = -[PUAlbumListCellContentView showsCheckmarkView](self, "showsCheckmarkView");
  -[PUAlbumListCellContentView checkmarkView](self, "checkmarkView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  if (!v3)
  {
    objc_msgSend(v4, "removeFromSuperview");
LABEL_6:

    return;
  }

  if (!v7)
  {
    v5 = (void *)MEMORY[0x1E0DC3F10];
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "px_circularGlyphViewWithName:backgroundColor:", CFSTR("checkmark.circle"), v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setUserInteractionEnabled:", 0);
    -[PUAlbumListCellContentView addSubview:](self, "addSubview:", v7);
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PUAlbumListCellContentView setCheckmarkView:](self, "setCheckmarkView:", v7);
    -[PUAlbumListCellContentView setNeedsLayout](self, "setNeedsLayout");
    -[PUAlbumListCellContentView _updateSubviewOrdering](self, "_updateSubviewOrdering");
    goto LABEL_6;
  }
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (-[PUAlbumListCellContentView isHighlighted](self, "isHighlighted") != a3)
  {
    self->_highlighted = v3;
    -[PUAlbumListCellContentView stackView](self, "stackView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHighlighted:", v3);

  }
}

- (void)_updateSubviewOrdering
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[PUAlbumListCellContentView stackView](self, "stackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAlbumListCellContentView bringSubviewToFront:](self, "bringSubviewToFront:", v3);

  -[PUAlbumListCellContentView customImageView](self, "customImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAlbumListCellContentView bringSubviewToFront:](self, "bringSubviewToFront:", v4);

  -[PUAlbumListCellContentView _deleteButton](self, "_deleteButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAlbumListCellContentView bringSubviewToFront:](self, "bringSubviewToFront:", v5);

  -[PUAlbumListCellContentView _subtitleLabel](self, "_subtitleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAlbumListCellContentView bringSubviewToFront:](self, "bringSubviewToFront:", v6);

  -[PUAlbumListCellContentView _titleTextField](self, "_titleTextField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAlbumListCellContentView bringSubviewToFront:](self, "bringSubviewToFront:", v7);

  -[PUAlbumListCellContentView _titleLabel](self, "_titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAlbumListCellContentView bringSubviewToFront:](self, "bringSubviewToFront:", v8);

  -[PUAlbumListCellContentView checkmarkView](self, "checkmarkView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[PUAlbumListCellContentView checkmarkView](self, "checkmarkView");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[PUAlbumListCellContentView bringSubviewToFront:](self, "bringSubviewToFront:", v10);

  }
}

- (void)_updateDeleteButtonAnimated:(BOOL)a3
{
  _BOOL4 v3;
  BOOL v5;
  _BOOL4 v6;
  double v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  id *v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t);
  void *v39;
  id v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  id v46;
  uint64_t v47;
  uint64_t v48;

  v3 = a3;
  v5 = !self->_editing || (self->_editCapabilities & 1) == 0;
  v6 = -[PUAlbumListCellContentView showsDeleteButtonWhenEditing](self, "showsDeleteButtonWhenEditing");
  if (v3)
    v7 = 0.3;
  else
    v7 = 0.0;
  -[PUAlbumListCellContentView _deleteButton](self, "_deleteButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5 || !v6)
  {
    if (!v8)
      return;
    v34 = (void *)MEMORY[0x1E0DC3F10];
    v35 = MEMORY[0x1E0C809B0];
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __58__PUAlbumListCellContentView__updateDeleteButtonAnimated___block_invoke_3;
    v41[3] = &unk_1E58ABD10;
    v32 = &v42;
    v42 = v8;
    v36 = v35;
    v37 = 3221225472;
    v38 = __58__PUAlbumListCellContentView__updateDeleteButtonAnimated___block_invoke_4;
    v39 = &unk_1E58A9910;
    v40 = v42;
    v33 = v42;
    objc_msgSend(v34, "pu_animateWithDuration:animations:completion:", v41, &v36, v7);
    -[PUAlbumListCellContentView _setDeleteButton:](self, "_setDeleteButton:", 0, v36, v37, v38, v39);

  }
  else
  {
    v10 = MEMORY[0x1E0C809B0];
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0D7BB48], "buttonWithType:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addTarget:action:forControlEvents:", self, sel__deleteAction_, 64);
      objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3888], "configurationPreferringMulticolor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "configurationByApplyingConfiguration:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("minus.circle.fill"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "imageByApplyingSymbolConfiguration:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "setImage:forState:", v16, 0);
      -[PUAlbumListCellContentView _deleteButtonCenter](self, "_deleteButtonCenter");
      v18 = v17;
      v20 = v19;
      v21 = (void *)MEMORY[0x1E0DC3F10];
      v45[0] = v10;
      v45[1] = 3221225472;
      v45[2] = __58__PUAlbumListCellContentView__updateDeleteButtonAnimated___block_invoke;
      v45[3] = &unk_1E58A5BB0;
      v9 = v11;
      v46 = v9;
      v47 = v18;
      v48 = v20;
      objc_msgSend(v21, "performWithoutAnimation:", v45);
      PXEdgeInsetsMake();
      v23 = v22;
      v25 = v24;
      v27 = v26;
      v29 = v28;
      objc_msgSend(v9, "px_configuration");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setHitTestOutset:", v23, v25, v27, v29);

      -[PUAlbumListCellContentView addSubview:](self, "addSubview:", v9);
      -[PUAlbumListCellContentView setNeedsLayout](self, "setNeedsLayout");
      -[PUAlbumListCellContentView _setDeleteButton:](self, "_setDeleteButton:", v9);
      -[PUAlbumListCellContentView _updateSubviewOrdering](self, "_updateSubviewOrdering");

    }
    v31 = (void *)MEMORY[0x1E0DC3F10];
    v43[0] = v10;
    v43[1] = 3221225472;
    v43[2] = __58__PUAlbumListCellContentView__updateDeleteButtonAnimated___block_invoke_2;
    v43[3] = &unk_1E58ABD10;
    v32 = &v44;
    v44 = v9;
    v33 = v9;
    objc_msgSend(v31, "pu_animateWithDuration:animations:", v43, v7);
  }

}

- (void)_updateStackViewAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  _BOOL4 editing;
  int v8;
  double v9;
  double v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  PUAlbumListCellContentView *v22;
  double v23;
  char v24;

  v3 = a3;
  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  editing = self->_editing;
  if (self->_editing)
    editing = (self->_editCapabilities & 4) == 0;
  v8 = !self->_enabled || editing;
  v9 = 1.0;
  if (v8 == 1)
  {
    objc_msgSend(v5, "albumListDisabledAlbumStackViewAlpha");
    v9 = v10;
  }
  v11 = v8 ^ 1;
  -[PUAlbumListCellContentView stackView](self, "stackView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAlbumListCellContentView customImageView](self, "customImageView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHidden:", v13 != 0);
  objc_msgSend(v12, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAllowsGroupOpacity:", v9 < 1.0);

  if (v3)
    v15 = 0.3;
  else
    v15 = 0.0;
  v16 = (void *)MEMORY[0x1E0DC3F10];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __55__PUAlbumListCellContentView__updateStackViewAnimated___block_invoke;
  v19[3] = &unk_1E589BD50;
  v23 = v9;
  v20 = v12;
  v21 = v13;
  v22 = self;
  v24 = v11;
  v17 = v13;
  v18 = v12;
  objc_msgSend(v16, "pu_animateWithDuration:animations:completion:", v19, 0, v15);

}

- (int64_t)_titleTextFieldClearButtonModeForLayout:(int64_t)a3
{
  return a3 == 0;
}

- (double)_titleFieldAlpha
{
  _BOOL4 enabled;
  unint64_t editCapabilities;
  _BOOL4 v5;
  BOOL v6;
  double result;
  void *v8;
  double v9;
  double v10;

  enabled = self->_enabled;
  editCapabilities = self->_editCapabilities;
  v5 = -[PUAlbumListCellContentView _showsTitleAndSubtitle](self, "_showsTitleAndSubtitle");
  if (!enabled || (self->_editing ? (v6 = (editCapabilities & 2) == 0) : (v6 = 0), v6))
  {
    +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "albumListDisabledAlbumTitleAlpha");
    v10 = v9;

    return v10;
  }
  else
  {
    result = 0.0;
    if (v5)
      return 1.0;
  }
  return result;
}

- (void)_updateTitleFieldAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  _BOOL4 v9;
  void *v10;
  PUAlbumListCellContentView *v11;
  void *v12;
  PUAlbumListCellContentView *v13;
  uint64_t v14;
  BOOL v15;
  void *v16;
  double v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t v23;

  v3 = a3;
  -[PUAlbumListCellContentView title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");
  -[PUAlbumListCellContentView _titleTextField](self, "_titleTextField");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PUAlbumListCellContentView _titleLabel](self, "_titleLabel");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = -[PUAlbumListCellContentView usesLabelForTitle](self, "usesLabelForTitle");
  if (v6)
  {
    if (v9)
    {
      objc_msgSend(v7, "removeFromSuperview");
      if (!v8)
      {
        v8 = objc_alloc_init(MEMORY[0x1E0DC3990]);
        objc_msgSend(v8, "setUserInteractionEnabled:", 1);
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_handleLabelTap_);
        objc_msgSend(v10, "setDelegate:", self);
        objc_msgSend(v8, "addGestureRecognizer:", v10);
        -[PUAlbumListCellContentView _setTitleLabel:](self, "_setTitleLabel:", v8);
        -[PUAlbumListCellContentView _updateTitleStyle](self, "_updateTitleStyle");
        -[PUAlbumListCellContentView _updateSubviewOrdering](self, "_updateSubviewOrdering");

      }
      objc_msgSend(v8, "superview");
      v11 = (PUAlbumListCellContentView *)objc_claimAutoreleasedReturnValue();

      if (v11 != self)
        -[PUAlbumListCellContentView addSubview:](self, "addSubview:", v8);
      goto LABEL_8;
    }
    objc_msgSend(v8, "removeFromSuperview");
    if (!v7)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0DC3DB8]);
      objc_msgSend(v7, "setDelegate:", self);
      -[PUAlbumListCellContentView _setTitleTextField:](self, "_setTitleTextField:", v7);
      -[PUAlbumListCellContentView _updateTitleStyle](self, "_updateTitleStyle");
      -[PUAlbumListCellContentView _updateSubviewOrdering](self, "_updateSubviewOrdering");
    }
    objc_msgSend(v7, "superview");
    v13 = (PUAlbumListCellContentView *)objc_claimAutoreleasedReturnValue();

    if (v13 != self)
      -[PUAlbumListCellContentView addSubview:](self, "addSubview:", v7);
  }
  else if (v9)
  {
LABEL_8:
    v12 = v8;
    goto LABEL_14;
  }
  v12 = v7;
LABEL_14:
  objc_msgSend(v12, "setText:", v5);
  -[PUAlbumListCellContentView setNeedsLayout](self, "setNeedsLayout");
  -[PUAlbumListCellContentView _titleFieldAlpha](self, "_titleFieldAlpha");
  v15 = !v3;
  v20[1] = 3221225472;
  v16 = (void *)MEMORY[0x1E0DC3F10];
  v20[0] = MEMORY[0x1E0C809B0];
  if (v15)
    v17 = 0.0;
  else
    v17 = 0.3;
  v20[2] = __56__PUAlbumListCellContentView__updateTitleFieldAnimated___block_invoke;
  v20[3] = &unk_1E58A9DF0;
  v23 = v14;
  v21 = v7;
  v22 = v8;
  v18 = v8;
  v19 = v7;
  objc_msgSend(v16, "pu_animateWithEnforcedDuration:animations:completion:", v20, 0, v17);

}

- (void)_updateSubtitleLabelAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  double v9;
  double v10;
  int v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  double v19;

  v3 = a3;
  -[PUAlbumListCellContentView subtitle](self, "subtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");
  -[PUAlbumListCellContentView _subtitleLabel](self, "_subtitleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v6 || v7)
  {
    if (!v6)
    {
      objc_msgSend(v7, "removeFromSuperview");
      -[PUAlbumListCellContentView _setSubtitleLabel:](self, "_setSubtitleLabel:", 0);
    }
  }
  else
  {
    v8 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    -[PUAlbumListCellContentView addSubview:](self, "addSubview:", v8);
    -[PUAlbumListCellContentView _setSubtitleLabel:](self, "_setSubtitleLabel:", v8);
    -[PUAlbumListCellContentView _updateSubtitleLabelStyle](self, "_updateSubtitleLabelStyle");
    -[PUAlbumListCellContentView _updateSubviewOrdering](self, "_updateSubviewOrdering");
  }
  objc_msgSend(v8, "setText:", v5);
  -[PUAlbumListCellContentView setNeedsLayout](self, "setNeedsLayout");
  -[PUAlbumListCellContentView _titleFieldAlpha](self, "_titleFieldAlpha");
  v10 = v9;
  v11 = objc_msgSend(v5, "isEqualToString:", CFSTR(" "));
  v12 = 1.0;
  v13 = 0.0;
  if (v11)
    v12 = 0.0;
  if (v10 >= v12)
    v10 = v12;
  if (v3)
  {
    objc_msgSend(v8, "alpha");
    if (v10 == v14)
      v13 = 0.0;
    else
      v13 = 0.3;
  }
  v15 = (void *)MEMORY[0x1E0DC3F10];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __59__PUAlbumListCellContentView__updateSubtitleLabelAnimated___block_invoke;
  v17[3] = &unk_1E58AACF0;
  v18 = v8;
  v19 = v10;
  v16 = v8;
  objc_msgSend(v15, "pu_animateWithDuration:animations:", v17, v13);

}

- (void)startPerformRetitleAction
{
  void *v3;
  id v4;

  -[PUAlbumListCellContentView setUsesLabelForTitle:](self, "setUsesLabelForTitle:", 0);
  -[PUAlbumListCellContentView _titleTextField](self, "_titleTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "becomeFirstResponder");

  -[PUAlbumListCellContentView _titleTextField](self, "_titleTextField");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectAll");

}

- (void)cancelPerformRetitleAction
{
  void *v3;
  void *v4;
  id v5;

  -[PUAlbumListCellContentView _titleTextField](self, "_titleTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAlbumListCellContentView title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v4);

  -[PUAlbumListCellContentView _titleTextField](self, "_titleTextField");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resignFirstResponder");

}

- (void)setCombinesPhotoDecorations:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_combinesPhotoDecorations != a3)
  {
    v3 = a3;
    self->_combinesPhotoDecorations = a3;
    -[PUAlbumListCellContentView stackView](self, "stackView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCombinesPhotoDecorations:", v3);

  }
}

- (void)setUsesLabelForTitle:(BOOL)a3
{
  if (self->_usesLabelForTitle != a3)
  {
    self->_usesLabelForTitle = a3;
    -[PUAlbumListCellContentView _updateTitleFieldAnimated:](self, "_updateTitleFieldAnimated:", 0);
    -[PUAlbumListCellContentView layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  -[PUAlbumListCellContentView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (self->_enabled && (self->_editCapabilities & 2) != 0)
    v6 = objc_msgSend(v4, "albumListCellContentViewShouldBeginRetitling:", self);
  else
    v6 = 0;

  return v6;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  if ((unint64_t)(self->_layout - 1) <= 1)
    -[PUAlbumListCellContentView setNeedsLayout](self, "setNeedsLayout", a3, a4.location, a4.length, a5);
  return 1;
}

- (void)textFieldDidEndEditing:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  -[PUAlbumListCellContentView setUsesLabelForTitle:](self, "setUsesLabelForTitle:", 1);
  -[PUAlbumListCellContentView title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length") && (objc_msgSend(v5, "isEqualToString:", v4) & 1) == 0)
  {
    -[PUAlbumListCellContentView setTitle:](self, "setTitle:", v5);
  }
  else
  {
    v6 = v4;

    objc_msgSend(v8, "setText:", v6);
    v5 = v6;
  }
  -[PUAlbumListCellContentView delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "albumListCellContentView:didEndRetitlingFromTitle:toTitle:", self, v4, v5);

}

- (BOOL)textFieldShouldReturn:(id)a3
{
  objc_msgSend(a3, "resignFirstResponder");
  return 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  void *v4;
  void *v5;
  _BOOL8 v6;

  objc_msgSend(a3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAlbumListCellContentView _titleLabel](self, "_titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
  {
    LODWORD(v6) = -[PUAlbumListCellContentView isEditing](self, "isEditing");
    if (v6)
      return (-[PUAlbumListCellContentView editCapabilities](self, "editCapabilities") >> 1) & 1;
  }
  else
  {
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (void)_deleteAction:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PUAlbumListCellContentView delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "albumListCellContentView:performDeleteAction:", self, v4);

}

- (void)_updateTitleStyle
{
  PUAlbumListCellContentView *v2;
  PUAlbumListCellContentView *v3;
  int64_t layout;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v2 = self;
  -[PUAlbumListCellContentView _titleTextField](self, "_titleTextField");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[PUAlbumListCellContentView _titleLabel](v2, "_titleLabel");
  v3 = (PUAlbumListCellContentView *)objc_claimAutoreleasedReturnValue();
  layout = v2->_layout;
  if (-[PUAlbumListCellContentView shouldCenterTextHorizontally](v2, "shouldCenterTextHorizontally"))
    v5 = 1;
  else
    v5 = 4;
  if (v10)
  {
    objc_msgSend(v10, "setTextAlignment:", v5);
    objc_msgSend(v10, "setClearButtonMode:", -[PUAlbumListCellContentView _titleTextFieldClearButtonModeForLayout:](v2, "_titleTextFieldClearButtonModeForLayout:", v2->_layout));
    -[PUAlbumListCellContentView titleFont](v2, "titleFont");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFont:", v6);

    +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "configureAlbumListTitleTextField:asOpaque:", v10, layout == 0);

    objc_msgSend(v10, "setAdjustsFontSizeToFitWidth:", 0);
    objc_msgSend(v10, "setContentVerticalAlignment:", 3);
LABEL_8:
    -[PUAlbumListCellContentView setNeedsLayout](v2, "setNeedsLayout");
    goto LABEL_9;
  }
  if (v3)
  {
    -[PUAlbumListCellContentView setTextAlignment:](v3, "setTextAlignment:", v5);
    -[PUAlbumListCellContentView titleFont](v2, "titleFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAlbumListCellContentView setFont:](v3, "setFont:", v8);

    +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "configureAlbumListTitleLabel:asOpaque:", v3, layout == 0);

    -[PUAlbumListCellContentView setAdjustsFontSizeToFitWidth:](v3, "setAdjustsFontSizeToFitWidth:", 0);
    -[PUAlbumListCellContentView _setWantsContentAwareTypesettingLanguage:](v3, "_setWantsContentAwareTypesettingLanguage:", 1);
    v2 = v3;
    goto LABEL_8;
  }
LABEL_9:

}

- (void)_updateSubtitleLabelStyle
{
  int64_t layout;
  _BOOL4 v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  -[PUAlbumListCellContentView _subtitleLabel](self, "_subtitleLabel");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  layout = self->_layout;
  v4 = -[PUAlbumListCellContentView shouldCenterTextHorizontally](self, "shouldCenterTextHorizontally");
  if (v8)
  {
    if (v4)
      v5 = 1;
    else
      v5 = 4;
    objc_msgSend(v8, "setTextAlignment:", v5);
    -[PUAlbumListCellContentView subtitleFont](self, "subtitleFont");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFont:", v6);

    +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "configureAlbumListSubtitleLabel:asOpaque:", v8, layout == 0);

    objc_msgSend(v8, "setAdjustsFontSizeToFitWidth:", 0);
    objc_msgSend(v8, "_setWantsContentAwareTypesettingLanguage:", 1);
    objc_msgSend(v8, "setNeedsLayout");
  }

}

- (PUAlbumListCellDelegate)delegate
{
  return (PUAlbumListCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PUStackView)stackView
{
  return self->_stackView;
}

- (void)_setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (BOOL)combinesPhotoDecorations
{
  return self->_combinesPhotoDecorations;
}

- (BOOL)topInsetEnabled
{
  return self->_topInsetEnabled;
}

- (void)setTopInsetEnabled:(BOOL)a3
{
  self->_topInsetEnabled = a3;
}

- (PXPeopleAvatarView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
  objc_storeStrong((id *)&self->_avatarView, a3);
}

- (BOOL)showsAvatarView
{
  return self->_showsAvatarView;
}

- (BOOL)showsCheckmarkView
{
  return self->_showsCheckmarkView;
}

- (UIView)customImageView
{
  return self->_customImageView;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (BOOL)shouldCenterTextHorizontally
{
  return self->_shouldCenterTextHorizontally;
}

- (double)xInset
{
  return self->_xInset;
}

- (int64_t)layout
{
  return self->_layout;
}

- (unint64_t)editCapabilities
{
  return self->_editCapabilities;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)showsDeleteButtonWhenEditing
{
  return self->_showsDeleteButtonWhenEditing;
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (UIFont)subtitleFont
{
  return self->_subtitleFont;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (UIView)checkmarkView
{
  return self->_checkmarkView;
}

- (void)setCheckmarkView:(id)a3
{
  objc_storeStrong((id *)&self->_checkmarkView, a3);
}

- (BOOL)_showsTitleAndSubtitle
{
  return self->__showsTitleAndSubtitle;
}

- (void)_setShowsTitleAndSubtitle:(BOOL)a3
{
  self->__showsTitleAndSubtitle = a3;
}

- (UITextField)_titleTextField
{
  return self->__titleTextField;
}

- (void)_setTitleTextField:(id)a3
{
  objc_storeStrong((id *)&self->__titleTextField, a3);
}

- (UILabel)_titleLabel
{
  return self->__titleLabel;
}

- (void)_setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->__titleLabel, a3);
}

- (UILabel)_subtitleLabel
{
  return self->__subtitleLabel;
}

- (void)_setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->__subtitleLabel, a3);
}

- (PXUIButton)_deleteButton
{
  return self->__deleteButton;
}

- (void)_setDeleteButton:(id)a3
{
  objc_storeStrong((id *)&self->__deleteButton, a3);
}

- (BOOL)usesLabelForTitle
{
  return self->_usesLabelForTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__deleteButton, 0);
  objc_storeStrong((id *)&self->__subtitleLabel, 0);
  objc_storeStrong((id *)&self->__titleLabel, 0);
  objc_storeStrong((id *)&self->__titleTextField, 0);
  objc_storeStrong((id *)&self->_checkmarkView, 0);
  objc_storeStrong((id *)&self->_subtitleFont, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_customImageView, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __59__PUAlbumListCellContentView__updateSubtitleLabelAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 40));
}

uint64_t __56__PUAlbumListCellContentView__updateTitleFieldAnimated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", *(double *)(a1 + 48));
}

void __55__PUAlbumListCellContentView__updateStackViewAnimated___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setItemAlpha:", *(double *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 40), "setAlpha:", *(double *)(a1 + 56));
  v2 = *(unsigned __int8 *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 48), "avatarView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnabled:", v2);

}

uint64_t __58__PUAlbumListCellContentView__updateDeleteButtonAnimated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "sizeToFit");
  objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __58__PUAlbumListCellContentView__updateDeleteButtonAnimated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __58__PUAlbumListCellContentView__updateDeleteButtonAnimated___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __58__PUAlbumListCellContentView__updateDeleteButtonAnimated___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

uint64_t __50__PUAlbumListCellContentView_setEditing_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateStackViewAnimated:", *(unsigned __int8 *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_updateDeleteButtonAnimated:", *(unsigned __int8 *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_updateTitleFieldAnimated:", *(unsigned __int8 *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_updateSubtitleLabelAnimated:", *(unsigned __int8 *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

void __50__PUAlbumListCellContentView_setEditing_animated___block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "endIgnoringInteractionEvents");

}

@end
