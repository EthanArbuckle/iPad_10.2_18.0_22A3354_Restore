@implementation VUIFavoriteBannerView

- (void)setTitleLabel:(id)a3
{
  VUILabel *v4;
  VUILabel *titleLabel;
  VUILabel *v6;

  v4 = (VUILabel *)a3;
  titleLabel = self->_titleLabel;
  if (titleLabel != v4)
    -[VUILabel removeFromSuperview](titleLabel, "removeFromSuperview");
  if (v4 && (-[VUILabel isDescendantOfView:](v4, "isDescendantOfView:", self) & 1) == 0)
    -[VUIFavoriteBannerView addSubview:](self, "addSubview:", v4);
  v6 = self->_titleLabel;
  self->_titleLabel = v4;

  -[VUIFavoriteBannerView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setSubtitleLabel:(id)a3
{
  VUILabel *v4;
  VUILabel *subtitleLabel;
  VUILabel *v6;

  v4 = (VUILabel *)a3;
  subtitleLabel = self->_subtitleLabel;
  if (subtitleLabel != v4)
    -[VUILabel removeFromSuperview](subtitleLabel, "removeFromSuperview");
  if (v4 && (-[VUILabel isDescendantOfView:](v4, "isDescendantOfView:", self) & 1) == 0)
    -[VUIFavoriteBannerView addSubview:](self, "addSubview:", v4);
  v6 = self->_subtitleLabel;
  self->_subtitleLabel = v4;

  -[VUIFavoriteBannerView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setBackgroundView:(id)a3
{
  UIView *v5;
  UIView *backgroundView;
  UIView *v7;

  v5 = (UIView *)a3;
  backgroundView = self->_backgroundView;
  if (backgroundView != v5)
  {
    v7 = v5;
    -[UIView removeFromSuperview](backgroundView, "removeFromSuperview");
    if (v7 && !-[UIView isDescendantOfView:](v7, "isDescendantOfView:", self))
    {
      -[VUIFavoriteBannerView addSubview:](self, "addSubview:", v7);
      -[VUIFavoriteBannerView sendSubviewToBack:](self, "sendSubviewToBack:", v7);
    }
    objc_storeStrong((id *)&self->_backgroundView, a3);
    -[VUIFavoriteBannerView setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (void)setBackgroundImageLogos:(id)a3
{
  id v5;
  NSArray **p_backgroundImageLogos;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "count") || -[NSArray count](self->_backgroundImageLogos, "count"))
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    p_backgroundImageLogos = &self->_backgroundImageLogos;
    v7 = self->_backgroundImageLogos;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v24 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          if ((objc_msgSend(v5, "containsObject:", v12) & 1) == 0)
            objc_msgSend(v12, "removeFromSuperview");
        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v9);
    }

    objc_storeStrong((id *)p_backgroundImageLogos, a3);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v13 = *p_backgroundImageLogos;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v20;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v20 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * j);
          if ((objc_msgSend(v18, "isDescendantOfView:", self->_backgroundView, (_QWORD)v19) & 1) == 0)
            -[UIView addSubview:](self->_backgroundView, "addSubview:", v18);
        }
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v15);
    }

    -[UIView setNeedsLayout](self->_backgroundView, "setNeedsLayout");
    -[VUIFavoriteBannerView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (CGSize)_layoutSubviewsWithSize:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height;
  double width;
  unint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  unint64_t v21;
  unint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGFloat v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  CGFloat v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  uint64_t v63;
  void *v64;
  NSArray *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t i;
  void *v71;
  void *v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  CGFloat v82;
  double v83;
  CGFloat v84;
  double v85;
  CGFloat v86;
  double v87;
  CGFloat v88;
  CGFloat v89;
  CGFloat v90;
  CGFloat v91;
  CGFloat v92;
  double v93;
  double v94;
  double v95;
  CGFloat v96;
  double v97;
  double v98;
  double v99;
  double x;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  _BYTE v113[128];
  uint64_t v114;
  CGSize result;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;

  height = a3.height;
  width = a3.width;
  v114 = *MEMORY[0x1E0C80C00];
  v8 = -[NSArray count](self->_backgroundImageLogos, "count");
  v108 = width;
  v9 = width + -48.0;
  -[VUIFavoriteBannerLayout maxTextWidth](self->_layout, "maxTextWidth");
  if (v10 <= width + -48.0)
  {
    -[VUIFavoriteBannerLayout maxTextWidth](self->_layout, "maxTextWidth");
    v9 = v11;
  }
  -[VUIFavoriteBannerLayout subtitleBaseLine](self->_layout, "subtitleBaseLine");
  v104 = v12;
  -[VUIFavoriteBannerLayout margin](self->_layout, "margin");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v21 = -[VUIFavoriteBannerLayout bannerStyleForSizeClass:](self->_layout, "bannerStyleForSizeClass:", objc_msgSend(MEMORY[0x1E0DC3F98], "vui_currentSizeClassForWindowWidth:", v108));
  v22 = v21;
  v103 = height;
  if (!v21)
  {
    -[VUIFavoriteBannerView _imageSizeForBannerStyle:](self, "_imageSizeForBannerStyle:", 0);
    v46 = v48;
    v45 = (double)(v8 - 1) * 10.0 + (double)v8 * v48;
    v98 = v18;
    v47 = (v108 - v45) * 0.5;
    v117.origin.x = v47;
    v117.origin.y = v14;
    v117.size.width = v45;
    v117.size.height = v46;
    v107 = v14;
    v49 = v14 + CGRectGetHeight(v117) + 0.0;
    -[VUILabel tv_sizeThatFits:](self->_titleLabel, "tv_sizeThatFits:", v9);
    v51 = v50;
    v53 = v52;
    -[VUILabel topMarginWithBaselineMargin:](self->_titleLabel, "topMarginWithBaselineMargin:", 34.0);
    v55 = v49 + v54;
    v118.origin.x = (v108 - v51) * 0.5;
    x = v118.origin.x;
    v101 = v51;
    v118.origin.y = v55;
    v118.size.width = v51;
    v102 = v53;
    v118.size.height = v53;
    v56 = v55 + CGRectGetHeight(v118);
    -[VUILabel tv_sizeThatFits:](self->_subtitleLabel, "tv_sizeThatFits:", v9, 0.0);
    v58 = v57;
    v60 = v59;
    -[VUILabel topMarginToLabel:withBaselineMargin:](self->_subtitleLabel, "topMarginToLabel:withBaselineMargin:", self->_titleLabel, v104);
    v41 = v56 + v61;
    v119.origin.x = (v108 - v58) * 0.5;
    v106 = v119.origin.x;
    v119.origin.y = v41;
    v119.size.width = v58;
    v119.size.height = v60;
    v42 = v41 + v98 + CGRectGetHeight(v119);
    v62 = v108;
    if (a4)
      goto LABEL_41;
LABEL_21:
    v99 = v42;
    -[UIView setFrame:](self->_backgroundView, "setFrame:", v47, v107, v45, v46);
    -[VUILabel setFrame:](self->_titleLabel, "setFrame:", x, v55, v101, v102);
    -[VUILabel setFrame:](self->_subtitleLabel, "setFrame:", v106, v41, v58, v60);
    if (v22)
    {
      if (v22 == 1)
      {
        -[VUIFavoriteBannerView _generatePlainWeaveImagePointsForSize:](self, "_generatePlainWeaveImagePointsForSize:", v108, v103);
        v63 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v22 != 2)
        {
          v64 = 0;
          goto LABEL_29;
        }
        -[VUIFavoriteBannerView _generateSiderowImagePointsForSize:](self, "_generateSiderowImagePointsForSize:", v108, v103);
        v63 = objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      -[VUIFavoriteBannerView _generateSingleRowImagePoints](self, "_generateSingleRowImagePoints");
      v63 = objc_claimAutoreleasedReturnValue();
    }
    v64 = (void *)v63;
LABEL_29:
    v111 = 0u;
    v112 = 0u;
    v109 = 0u;
    v110 = 0u;
    v65 = self->_backgroundImageLogos;
    v66 = -[NSArray countByEnumeratingWithState:objects:count:](v65, "countByEnumeratingWithState:objects:count:", &v109, v113, 16);
    if (v66)
    {
      v67 = v66;
      v68 = 0;
      v69 = *(_QWORD *)v110;
      do
      {
        for (i = 0; i != v67; ++i)
        {
          if (*(_QWORD *)v110 != v69)
            objc_enumerationMutation(v65);
          v71 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * i);
          if (v68 + i >= (unint64_t)objc_msgSend(v64, "count"))
            goto LABEL_37;
          objc_msgSend(v64, "objectAtIndexedSubscript:", v68 + i);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "CGRectValue");
          v74 = v73;
          v76 = v75;
          v78 = v77;
          v80 = v79;

          -[UIView convertRect:toView:](self->_backgroundView, "convertRect:toView:", self, v74, v76, v78, v80);
          v82 = v81;
          v84 = v83;
          v86 = v85;
          v88 = v87;
          -[VUIFavoriteBannerView bounds](self, "bounds");
          v121.origin.x = v89;
          v121.origin.y = v90;
          v121.size.width = v91;
          v121.size.height = v92;
          v120.origin.x = v82;
          v120.origin.y = v84;
          v120.size.width = v86;
          v120.size.height = v88;
          if (CGRectIntersectsRect(v120, v121))
          {
            objc_msgSend(v71, "setHidden:", 0);
            objc_msgSend(v71, "setFrame:", v74, v76, v78, v80);
          }
          else
          {
LABEL_37:
            objc_msgSend(v71, "setHidden:", 1);
          }
        }
        v67 = -[NSArray countByEnumeratingWithState:objects:count:](v65, "countByEnumeratingWithState:objects:count:", &v109, v113, 16);
        v68 += i;
      }
      while (v67);
    }

    v62 = v108;
    v42 = v99;
    goto LABEL_41;
  }
  if (v21 > 2)
  {
    v47 = *MEMORY[0x1E0C9D648];
    v55 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v45 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v46 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v60 = v46;
    v58 = v45;
    v41 = v55;
    v106 = *MEMORY[0x1E0C9D648];
    v107 = v55;
    v42 = 0.0;
    v101 = v45;
    v102 = v46;
    x = *MEMORY[0x1E0C9D648];
    v62 = v108;
    if (a4)
      goto LABEL_41;
    goto LABEL_21;
  }
  v94 = v20;
  v23 = v14;
  -[VUILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v9, 0.0);
  v25 = v24;
  v97 = v18;
  v27 = v26;
  -[VUILabel topMarginToLabel:withBaselineMargin:](self->_subtitleLabel, "topMarginToLabel:withBaselineMargin:", self->_titleLabel, v104);
  v29 = v28;
  v105 = v28;
  -[VUILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", v9, 0.0);
  v31 = v30;
  v33 = v32;
  v34 = v27 + 0.0 + v29 + v32;
  v107 = v23;
  if (height <= v34)
    v35 = v23 + 0.0;
  else
    v35 = (height - v34) * 0.5;
  v36 = (v108 - v25) * 0.5;
  if (v22 != 1)
    v36 = v16;
  v93 = v16;
  if (v22 == 1)
    v37 = (v108 - v31) * 0.5;
  else
    v37 = v16;
  x = v36;
  v101 = v25;
  v38 = v35;
  v39 = v25;
  v102 = v27;
  v40 = v27;
  v95 = v35;
  v41 = v105 + CGRectGetHeight(*(CGRect *)&v36) + v35;
  v106 = v37;
  v116.origin.x = v37;
  v116.origin.y = v41;
  v116.size.width = v31;
  v96 = v33;
  v116.size.height = v33;
  v42 = v97 + CGRectGetHeight(v116) + v41;
  if (v22 == 2)
  {
    v43 = v42;
    -[VUIFavoriteBannerLayout maxTextWidth](self->_layout, "maxTextWidth");
    v42 = v43;
    v45 = v108 - (v94 + v93 * 2.0 + v44);
    v46 = v103 - (v107 + v97);
    v47 = v108 - v94 - v45;
  }
  else
  {
    v47 = (v108 - v108) * 0.5;
    v46 = v103;
    v107 = (v46 - v46) * 0.5;
    v45 = v108;
  }
  v62 = v108;
  v58 = v31;
  v60 = v96;
  v55 = v95;
  if (!a4)
    goto LABEL_21;
LABEL_41:
  result.height = v42;
  result.width = v62;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VUIFavoriteBannerView;
  -[VUIFavoriteBannerView layoutSubviews](&v5, sel_layoutSubviews);
  -[VUIFavoriteBannerView bounds](self, "bounds");
  -[VUIFavoriteBannerView _layoutSubviewsWithSize:computationOnly:](self, "_layoutSubviewsWithSize:computationOnly:", 0, v3, v4);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[VUIFavoriteBannerView _layoutSubviewsWithSize:computationOnly:](self, "_layoutSubviewsWithSize:computationOnly:", 1, a3.width, a3.height);
  v5 = v4;
  v7 = v6;
  -[VUIFavoriteBannerLayout bannerMinHeight](self->_layout, "bannerMinHeight");
  if (v7 >= v8)
    v9 = v7;
  else
    v9 = v8;
  v10 = v5;
  result.height = v9;
  result.width = v10;
  return result;
}

- (CGSize)maxImageSize
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0DC3F98], "vui_keyWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[VUIUtilities scaleContentSizeValue:forTraitCollection:](VUIUtilities, "scaleContentSizeValue:forTraitCollection:", v3, 180.0);
  if (v4 <= 125.0)
    v5 = v4;
  else
    v5 = 125.0;

  v6 = v5;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)imageSizeForBannerStyle:(unint64_t)a3 sizeClass:(int64_t)a4
{
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  double v14;
  double v15;
  CGSize result;
  CGRect v17;

  if (a3 == 2)
  {
    if (!a4)
    {
      v9 = (void *)MEMORY[0x1E0DC3F98];
      -[VUIFavoriteBannerView bounds](self, "bounds");
      a4 = objc_msgSend(v9, "vui_currentSizeClassForWindowWidth:", CGRectGetWidth(v17));
    }
    v10 = 0.0;
    if ((unint64_t)(a4 - 1) <= 7)
      v10 = dbl_1DA1C29D0[a4 - 1];
    objc_msgSend(MEMORY[0x1E0DC3F98], "vui_keyWindow");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[VUIUtilities scaleContentSizeValue:forTraitCollection:](VUIUtilities, "scaleContentSizeValue:forTraitCollection:", v6, v10);
    v8 = 125.0;
    goto LABEL_10;
  }
  if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice", 1, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "userInterfaceIdiom") == 2;

    v4 = dbl_1DA1C29C0[v13];
    goto LABEL_15;
  }
  v4 = 0.0;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0DC3F98], "vui_keyWindow", 0, a4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[VUIUtilities scaleContentSizeValue:forTraitCollection:](VUIUtilities, "scaleContentSizeValue:forTraitCollection:", v6, 50.0);
    v8 = 84.0;
LABEL_10:
    if (v7 <= v8)
      v4 = v7;
    else
      v4 = v8;

  }
LABEL_15:
  v14 = v4;
  v15 = v4;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)setHighlighted:(BOOL)a3
{
  VUIFavoriteBannerLayout *layout;
  id v5;

  layout = self->_layout;
  if (a3)
    -[VUIFavoriteBannerLayout highlightedBackgroundColor](layout, "highlightedBackgroundColor");
  else
    -[VUIFavoriteBannerLayout backgroundColor](layout, "backgroundColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[VUIFavoriteBannerView setBackgroundColor:](self, "setBackgroundColor:", v5);

}

- (CGSize)_imageSizeForBannerStyle:(unint64_t)a3
{
  double v3;
  double v4;
  CGSize result;

  -[VUIFavoriteBannerView imageSizeForBannerStyle:sizeClass:](self, "imageSizeForBannerStyle:sizeClass:", a3, 0);
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)_generateSingleRowImagePoints
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  unint64_t v8;
  double v9;
  void *v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[VUIFavoriteBannerView _imageSizeForBannerStyle:](self, "_imageSizeForBannerStyle:", 0);
  v5 = v4;
  v7 = v6;
  if (-[NSArray count](self->_backgroundImageLogos, "count"))
  {
    v8 = 0;
    v9 = 0.0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v9, 0.0, v5, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v10);

      v9 = v5 + 10.0 + v9;
      ++v8;
    }
    while (v8 < -[NSArray count](self->_backgroundImageLogos, "count"));
  }
  return v3;
}

- (id)_generatePointsForPlainWeaveSide:(double)a3 containerRect:(CGRect)a4 imageSize:(CGSize)a5 direction:(unint64_t)a6
{
  double height;
  double width;
  double v9;
  CGFloat v10;
  CGFloat y;
  CGFloat x;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  id v18;
  unsigned __int8 v19;
  double v20;
  double v21;
  char v22;
  double v23;
  double v24;
  double v25;
  double v26;
  _BOOL4 v27;
  void *v28;
  double v30;
  CGFloat v32;
  CGFloat v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  height = a5.height;
  width = a5.width;
  v9 = a4.size.height;
  v10 = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = 0.0;
  if (!a6)
    v13 = -a5.width;
  if (a6 == 1)
    v14 = a5.width;
  else
    v14 = v13;
  v15 = ceil(CGRectGetHeight(a4) / a5.height);
  v32 = x;
  v33 = y;
  v34.origin.x = x;
  v34.origin.y = y;
  v16 = v10;
  v34.size.width = v10;
  v34.size.height = v9;
  v17 = (CGRectGetHeight(v34) - (double)(unint64_t)v15 * height) * 0.5;
  v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v17 < v9)
  {
    v19 = 0;
    v20 = -0.0;
    if (a6)
      v21 = -0.0;
    else
      v21 = v14;
    if (a6 == 1)
      v20 = v14;
    v30 = v20;
    v22 = 1;
    v23 = a3;
    do
    {
      v24 = v21 + v23;
      v25 = -0.0;
      if ((v22 & v19 & 1) != 0)
        v25 = v14;
      v26 = v25 + v24;
      v35.origin.x = v25 + v24;
      v35.origin.y = v17;
      v35.size.width = width;
      v35.size.height = height;
      v36.origin.x = v32;
      v36.origin.y = v33;
      v36.size.width = v16;
      v36.size.height = v9;
      v27 = CGRectIntersectsRect(v35, v36);
      if (v27)
      {
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v26, v17, width, height);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v28);

        v23 = v30 + v14 + v26;
      }
      else
      {
        v17 = height + v17;
        v19 ^= 1u;
        v23 = a3;
      }
      v22 = !v27;
    }
    while (v17 < v9);
  }
  return v18;
}

- (id)_generatePlainWeaveImagePointsForSize:(CGSize)a3
{
  double height;
  double width;
  id v6;
  double v7;
  CGFloat v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  CGRect v17;
  CGRect v18;

  height = a3.height;
  width = a3.width;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[VUIFavoriteBannerLayout maxTextWidth](self->_layout, "maxTextWidth");
  v8 = v7 + 20.0;
  v9 = (width - (v7 + 20.0)) * 0.5;
  -[VUIFavoriteBannerView _imageSizeForBannerStyle:](self, "_imageSizeForBannerStyle:", 1);
  v11 = v10;
  v13 = v12;
  v17.origin.y = 0.0;
  v17.origin.x = v9;
  v17.size.width = v8;
  v17.size.height = height;
  -[VUIFavoriteBannerView _generatePointsForPlainWeaveSide:containerRect:imageSize:direction:](self, "_generatePointsForPlainWeaveSide:containerRect:imageSize:direction:", 0, CGRectGetMinX(v17), 0.0, 0.0, width, height, v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v14);

  v18.origin.y = 0.0;
  v18.origin.x = v9;
  v18.size.width = v8;
  v18.size.height = height;
  -[VUIFavoriteBannerView _generatePointsForPlainWeaveSide:containerRect:imageSize:direction:](self, "_generatePointsForPlainWeaveSide:containerRect:imageSize:direction:", 1, CGRectGetMaxX(v18), 0.0, 0.0, width, height, v11, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v15);

  return v6;
}

- (id)_generateSiderowImagePointsForSize:(CGSize)a3
{
  double height;
  double width;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  NSUInteger v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  BOOL v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  char v31;
  double v32;
  double v33;
  double v34;
  unint64_t v35;
  double v36;
  double v37;
  char v38;
  void *v39;
  unint64_t v40;
  char v41;
  void *v42;
  unint64_t v44;
  double v45;
  double v46;

  height = a3.height;
  width = a3.width;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[VUIFavoriteBannerView _imageSizeForBannerStyle:](self, "_imageSizeForBannerStyle:", 2);
  v8 = v7;
  v10 = v9;
  -[VUIFavoriteBannerLayout margin](self->_layout, "margin");
  v12 = v11;
  v14 = v13;
  v17 = width - v15 + v16 * -2.0;
  -[VUIFavoriteBannerLayout maxTextWidth](self->_layout, "maxTextWidth");
  v19 = v17 - v18;
  v20 = -[NSArray count](self->_backgroundImageLogos, "count");
  v21 = objc_msgSend(MEMORY[0x1E0DC3F98], "vui_currentSizeClassForWindowWidth:", width);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "userInterfaceIdiom");

  if (v23 == 2)
  {
    if (v20 >= 8)
      v24 = 8;
    else
      v24 = v20;
    v25 = v24 > 1;
    v26 = (double)(v24 - 1);
    v27 = 26.0;
    goto LABEL_16;
  }
  if ((unint64_t)(v21 - 1) > 3)
  {
    if (v20 >= 0xA)
      v24 = 10;
    else
      v24 = v20;
    v25 = v24 > 1;
    v26 = (double)(v24 - 1);
    v27 = 20.0;
LABEL_16:
    v32 = v26 * v27;
    if (!v25)
      v32 = 0.0;
    v33 = (v19 - v32) / (double)v24;
    v34 = height - v12 - v14;
    v29 = fmin(v33, fmin(v34, v10));
    if (v24)
      goto LABEL_19;
    return v6;
  }
  if (v20 >= 8)
    v24 = 8;
  else
    v24 = v20;
  if (v24 > 4)
  {
    v28 = height - v12 - v14;
    v29 = fmin(v8, v28 * 0.5 + -10.0);
    v27 = 10.0;
    v30 = v28 - (v29 * 2.0 + 10.0);
    v31 = 1;
    goto LABEL_20;
  }
  v44 = 4;
  if (v20 < 4)
    v44 = v20;
  v27 = 10.0;
  v45 = (double)(v44 - 1) * 10.0;
  if (v24 <= 1)
    v45 = 0.0;
  v46 = (v19 - v45) / (double)v44;
  v34 = height - v12 - v14;
  v29 = fmin(v8, v46);
  if (v24)
  {
LABEL_19:
    v31 = 0;
    v30 = v34 - v29;
LABEL_20:
    v35 = 0;
    v36 = v30 * 0.5;
    v37 = v29 + v30 * 0.5 + 10.0;
    v38 = v31 ^ 1;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v19 - v29, v36, v29, v29);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v39);

      v40 = v35 + 1;
      if (v35 + 1 >= v24)
        v41 = 1;
      else
        v41 = v38;
      if ((v41 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v19 - v29, v37, v29, v29);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v42);

        v40 = v35 + 2;
      }
      v19 = v19 - v29 - v27;
      v35 = v40;
    }
    while (v40 < v24);
  }
  return v6;
}

- (void)prepareForCellReuse
{
  VUIFavoriteBannerLayout *layout;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  layout = self->_layout;
  self->_layout = 0;

  -[VUILabel setText:](self->_titleLabel, "setText:", 0);
  -[VUILabel setText:](self->_subtitleLabel, "setText:", 0);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = self->_backgroundImageLogos;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setImage:", 0, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (VUIFavoriteBannerLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
  objc_storeStrong((id *)&self->_layout, a3);
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (NSArray)backgroundImageLogos
{
  return self->_backgroundImageLogos;
}

- (VUILabel)titleLabel
{
  return self->_titleLabel;
}

- (VUILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_backgroundImageLogos, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_layout, 0);
}

@end
