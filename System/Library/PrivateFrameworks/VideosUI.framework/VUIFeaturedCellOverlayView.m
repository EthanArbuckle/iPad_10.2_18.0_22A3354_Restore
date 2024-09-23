@implementation VUIFeaturedCellOverlayView

- (void)setAppleTVChannelLogoView:(id)a3
{
  UIView *v5;
  UIView *v6;

  v5 = (UIView *)a3;
  if (self->_appleTVChannelLogoView != v5)
  {
    v6 = v5;
    -[VUIFeaturedCellOverlayView vui_addSubview:oldView:](self, "vui_addSubview:oldView:", v5);
    objc_storeStrong((id *)&self->_appleTVChannelLogoView, a3);
    -[VUIFeaturedCellOverlayView vui_setNeedsLayout](self, "vui_setNeedsLayout");
    v5 = v6;
  }

}

- (void)setTitleLabel:(id)a3
{
  VUILabel *v5;
  VUILabel *v6;

  v5 = (VUILabel *)a3;
  if (self->_titleLabel != v5)
  {
    v6 = v5;
    -[VUIFeaturedCellOverlayView vui_addSubview:oldView:](self, "vui_addSubview:oldView:", v5);
    objc_storeStrong((id *)&self->_titleLabel, a3);
    -[VUIFeaturedCellOverlayView vui_setNeedsLayout](self, "vui_setNeedsLayout");
    v5 = v6;
  }

}

- (void)setSubtitleLabel:(id)a3
{
  VUILabel *v5;
  VUILabel *v6;

  v5 = (VUILabel *)a3;
  v6 = v5;
  if (self->_subtitleLabel != v5)
  {
    -[VUIFeaturedCellOverlayView vui_addSubview:oldView:](self, "vui_addSubview:oldView:", v5);
    objc_storeStrong((id *)&self->_subtitleLabel, a3);
  }
  -[VUIFeaturedCellOverlayView vui_setNeedsLayout](self, "vui_setNeedsLayout");

}

- (void)setDisclaimerLabel:(id)a3
{
  VUILabel *v5;
  VUILabel *v6;

  v5 = (VUILabel *)a3;
  v6 = v5;
  if (self->_disclaimerLabel != v5)
  {
    -[VUIFeaturedCellOverlayView vui_addSubview:oldView:](self, "vui_addSubview:oldView:", v5);
    objc_storeStrong((id *)&self->_disclaimerLabel, a3);
  }
  -[VUIFeaturedCellOverlayView vui_setNeedsLayout](self, "vui_setNeedsLayout");

}

- (void)setButtons:(id)a3
{
  id v5;
  NSArray **p_buttons;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "count") || -[NSArray count](self->_buttons, "count"))
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    p_buttons = &self->_buttons;
    v7 = self->_buttons;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "removeFromSuperview");
        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v9);
    }

    objc_storeStrong((id *)p_buttons, a3);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v12 = *p_buttons;
    v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v19;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * j);
          objc_msgSend(v17, "vui_setNeedsLayout", (_QWORD)v18);
          -[VUIFeaturedCellOverlayView vui_addSubview:oldView:](self, "vui_addSubview:oldView:", v17, 0);
        }
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v14);
    }

    -[VUIFeaturedCellOverlayView vui_setNeedsLayout](self, "vui_setNeedsLayout");
  }

}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;
  CGSize result;

  v12.receiver = self;
  v12.super_class = (Class)VUIFeaturedCellOverlayView;
  -[VUIFeaturedCellOverlayView vui_layoutSubviews:computationOnly:](&v12, sel_vui_layoutSubviews_computationOnly_, a3.width, a3.height);
  v7 = v6;
  v9 = v8;
  if (!a4)
    -[VUIFeaturedCellOverlayView _layoutSubviews](self, "_layoutSubviews");
  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)_layoutSubviews
{
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double Width;
  double v10;
  double Height;
  double v12;
  double v13;
  unint64_t v14;
  double v15;
  double v16;
  double v17;
  int v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double *v23;
  NSArray *buttons;
  double v25;
  int v26;
  double v27;
  double v28;
  VUILabel *disclaimerLabel;
  void *v30;
  char v31;
  VUILabel *v32;
  double v33;
  double v34;
  CGFloat v35;
  double v36;
  unint64_t v37;
  NSArray *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  uint64_t i;
  VUILabel *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  id v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  VUILabel *v60;
  void *v61;
  uint64_t v62;
  char v63;
  double v64;
  double v65;
  CGFloat v66;
  double v67;
  VUILabel *v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  VUILabel *v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  VUILabel *v81;
  UIView *appleTVChannelLogoView;
  double v83;
  double v84;
  CGFloat v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  void *v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t j;
  void *v97;
  void *v98;
  id v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t k;
  void *v105;
  void *v106;
  double v107;
  unint64_t v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  VUIFeaturedCellOverlayView *v127;
  uint64_t v128;
  double v129;
  id obj;
  void *v131;
  double rect;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  _BYTE v145[128];
  _BYTE v146[128];
  _BYTE v147[128];
  uint64_t v148;
  CGRect v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;
  CGRect v153;
  CGRect v154;
  CGRect v155;
  CGRect v156;
  CGRect v157;
  CGRect v158;
  CGRect v159;
  CGRect v160;

  v148 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0DC3F98], "vui_currentSizeClass");
  objc_msgSend(MEMORY[0x1E0DC3F98], "vui_padding");
  v5 = v4;
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0DC3F98], "vui_keyWindow");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  Width = CGRectGetWidth(v149);

  -[VUIFeaturedCellOverlayView bounds](self, "bounds");
  v10 = CGRectGetWidth(v150);
  -[VUIFeaturedCellOverlayView bounds](self, "bounds");
  Height = CGRectGetHeight(v151);
  v12 = 28.0;
  if (v3 == 8)
    v12 = 16.0;
  if (v3 <= 3)
    v13 = 24.0;
  else
    v13 = v12;
  v128 = v3;
  v14 = v3 - 1;
  if (self->_usesDefaultOverlayType)
  {
    if (v14 <= 2)
    {
      if (v10 == Width)
      {
        v15 = Width - v5 - v7;
        v16 = 8.0;
        v17 = 20.0;
        v112 = v5;
      }
      else
      {
        -[VUIFeaturedCellOverlayView bounds](self, "bounds");
        v15 = CGRectGetWidth(v152);
        v16 = v5 * 0.5 + 30.0;
        v17 = v5 * 0.5 + 20.0;
        v112 = 0.0;
        v5 = -0.0;
      }
      v18 = 0;
      v113 = v15;
      v19 = v15 + v17 * -2.0;
      v125 = v5 + v17;
      v21 = v5 + v16;
      v123 = 28.0;
      v121 = 26.0;
      v114 = 20.0;
      v116 = 24.0;
      v20 = 20.0;
      goto LABEL_26;
    }
    if (v3 == 8)
    {
      v22 = 80.0;
      if (v10 == Width)
        v22 = v5;
      v16 = 30.0;
      v21 = v22 + 30.0;
      v18 = 1;
      v20 = 48.0;
      v123 = 64.0;
      v19 = 410.0;
      v121 = 54.0;
      v116 = 50.0;
      v114 = 48.0;
      goto LABEL_24;
    }
    v22 = v5 + 16.0;
    v16 = 0.0;
    v121 = 26.0;
    v18 = 1;
    v114 = 20.0;
    v116 = 24.0;
    v19 = 248.0;
    v123 = 26.0;
    v20 = 26.0;
LABEL_23:
    v21 = v22;
LABEL_24:
    v112 = v22;
    goto LABEL_25;
  }
  if (v14 >= 3)
  {
    v114 = 0.0;
    if (v3 == 8)
    {
      v18 = 1;
      v123 = 62.0;
      v19 = 410.0;
      v22 = 80.0;
      v121 = 72.0;
      v116 = 50.0;
    }
    else
    {
      v116 = 20.0;
      v18 = 1;
      v19 = 154.0;
      v22 = 32.0;
      v121 = 20.0;
      v123 = 20.0;
    }
    v20 = 0.0;
    v16 = 0.0;
    goto LABEL_23;
  }
  v112 = 16.0;
  v114 = 0.0;
  v116 = 18.0;
  v18 = 1;
  v19 = 108.0;
  v121 = 18.0;
  v123 = 18.0;
  v20 = 0.0;
  v16 = 0.0;
  v21 = 16.0;
  v22 = 16.0;
LABEL_25:
  v125 = v22;
  v113 = v19;
LABEL_26:
  v23 = (double *)MEMORY[0x1E0C9D648];
  buttons = self->_buttons;
  v25 = 0.0;
  if (buttons && -[NSArray count](buttons, "count") >= 2)
  {
    if (v3 == 8)
    {
      v110 = 24.0;
      v111 = v20;
      v26 = 1;
      v116 = 64.0;
    }
    else if (+[VUIPPMExtensions isPPMEnabled](VUIPPMExtensions, "isPPMEnabled"))
    {
      v116 = 16.0;
      v26 = 1;
      v123 = 16.0;
      v110 = 8.0;
      v111 = 16.0;
    }
    else
    {
      v107 = v123;
      if (v3 > 3)
        v107 = 34.0;
      v123 = v107;
      if (v3 > 3)
        v20 = 34.0;
      v116 = 26.0;
      v110 = 20.0;
      v111 = v20;
      v26 = 1;
    }
  }
  else
  {
    v26 = 0;
    v110 = 0.0;
    v111 = v20;
  }
  v27 = v23[1];
  v28 = v23[2];
  disclaimerLabel = self->_disclaimerLabel;
  v124 = v28;
  v129 = v23[3];
  rect = v27;
  v126 = *v23;
  if (disclaimerLabel)
  {
    -[VUILabel vuiText](disclaimerLabel, "vuiText");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v30, "length"))
      v31 = v26;
    else
      v31 = 1;

    if ((v31 & 1) != 0)
    {
      v32 = 0;
      v119 = v28;
      v120 = v129;
      v122 = v27;
      v118 = v126;
    }
    else
    {
      -[VUILabel bottomMarginWithBaselineMargin:](self->_disclaimerLabel, "bottomMarginWithBaselineMargin:", 0.0);
      v34 = v33;
      -[VUILabel sizeThatFits:](self->_disclaimerLabel, "sizeThatFits:", v19, 1.79769313e308);
      v153.size.height = v35;
      v153.origin.x = v125;
      v153.origin.y = v27;
      v153.size.width = v19;
      v120 = v153.size.height;
      v36 = v34 + CGRectGetHeight(v153);
      v28 = v124;
      Height = Height - v36;
      v32 = self->_disclaimerLabel;
      v25 = v116;
      v118 = v125;
      v119 = v19;
      v122 = Height;
    }
  }
  else
  {
    v32 = 0;
    v119 = v23[2];
    v120 = v23[3];
    v122 = v23[1];
    v118 = *v23;
  }
  v37 = 0x1E0C99000uLL;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = self->_buttons;
  v127 = self;
  if (!v38 || !-[NSArray count](v38, "count"))
  {
    obj = 0;
    goto LABEL_66;
  }
  -[NSArray reverseObjectEnumerator](self->_buttons, "reverseObjectEnumerator");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "allObjects");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  v143 = 0u;
  v144 = 0u;
  v141 = 0u;
  v142 = 0u;
  obj = v40;
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v141, v147, 16);
  if (!v41)
    goto LABEL_64;
  v42 = v41;
  v108 = __PAIR64__(v18, v26);
  v109 = v19;
  v43 = *(_QWORD *)v142;
  v44 = v113 + v16 * -2.0;
  do
  {
    for (i = 0; i != v42; ++i)
    {
      v46 = v32;
      if (*(_QWORD *)v142 != v43)
        objc_enumerationMutation(obj);
      v47 = *(void **)(*((_QWORD *)&v141 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), v48 = 0.0, (objc_opt_isKindOfClass() & 1) != 0))
      {
        -[VUILabel topMarginWithBaselineMargin:](v46, "topMarginWithBaselineMargin:", v25, v108, *(_QWORD *)&v109);
        v48 = v49;
      }
      if (+[VUIPPMExtensions isPPMEnabled](VUIPPMExtensions, "isPPMEnabled", v108, *(_QWORD *)&v109))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v48 = 12.0;
        else
          v48 = 0.0;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v47, "vui_sizeThatFits:", v44, 0.0);
        v51 = v50;
        v52 = v47;
        v53 = v52;
        if (v52 && (!objc_msgSend(v52, "buttonType") || objc_msgSend(v53, "buttonType") == 3) && v128 <= 3)
        {
          -[VUIFeaturedCellOverlayView bounds](v127, "bounds");
          v54 = CGRectGetWidth(v154);
          objc_msgSend(v53, "width");
          v56 = (v54 - v55) * 0.5;
          objc_msgSend(v53, "width");
          v58 = v57;
          goto LABEL_61;
        }
      }
      else
      {
        v53 = 0;
        v51 = v129;
      }
      v56 = v21;
      v58 = v44;
LABEL_61:
      v155.origin.x = v56;
      v155.origin.y = rect;
      v155.size.width = v58;
      v155.size.height = v51;
      Height = Height - (v48 + CGRectGetHeight(v155));
      v32 = v47;

      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v56, Height, v58, v51);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v131, "addObject:", v59);

      v25 = v13;
    }
    v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v141, v147, 16);
    v25 = v13;
  }
  while (v42);
  v25 = v13;
  self = v127;
  v19 = v109;
  LOBYTE(v26) = v108;
  v18 = HIDWORD(v108);
  v28 = v124;
  v27 = rect;
  v37 = 0x1E0C99000;
LABEL_64:

LABEL_66:
  v60 = self->_disclaimerLabel;
  if (v60)
  {
    -[VUILabel vuiText](v60, "vuiText");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v61, "length");

    v63 = v26 ^ 1;
    if (!v62)
      v63 = 1;
    if ((v63 & 1) == 0)
    {
      -[VUILabel bottomMarginWithBaselineMargin:](self->_disclaimerLabel, "bottomMarginWithBaselineMargin:", v110);
      v65 = v64;
      if (+[VUIPPMExtensions isPPMEnabled](VUIPPMExtensions, "isPPMEnabled"))
        v65 = v110;
      -[VUILabel sizeThatFits:](self->_disclaimerLabel, "sizeThatFits:", v19, 1.79769313e308);
      v156.size.height = v66;
      v156.origin.x = v125;
      v156.origin.y = v122;
      v156.size.width = v19;
      v120 = v156.size.height;
      v67 = v65 + CGRectGetHeight(v156);
      v28 = v124;
      Height = Height - v67;
      v68 = self->_disclaimerLabel;

      v32 = v68;
      v118 = v125;
      v119 = v19;
      v27 = rect;
      v122 = Height;
      v25 = v116;
    }
  }
  if (self->_subtitleLabel)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[VUILabel topMarginToLabel:withBaselineMargin:](v32, "topMarginToLabel:withBaselineMargin:", self->_subtitleLabel, v25);
    else
      -[VUILabel bottomMarginWithBaselineMargin:](self->_subtitleLabel, "bottomMarginWithBaselineMargin:", v114);
    v72 = v69;
    -[VUILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", v19, 1.79769313e308);
    v70 = v73;
    v157.origin.x = v125;
    v157.origin.y = v27;
    v157.size.width = v19;
    v157.size.height = v70;
    v27 = Height - (v72 + CGRectGetHeight(v157));
    v74 = self->_subtitleLabel;

    v32 = v74;
    v115 = v125;
    v117 = v19;
    Height = v27;
    v28 = v124;
    v71 = v126;
  }
  else
  {
    v121 = v25;
    v70 = v129;
    v71 = v126;
    v115 = v126;
    v117 = v28;
  }
  if (self->_titleLabel)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[VUILabel topMarginToLabel:withBaselineMargin:](v32, "topMarginToLabel:withBaselineMargin:", self->_titleLabel, v121);
      v76 = v75;
      if (+[VUIPPMExtensions isPPMEnabled](VUIPPMExtensions, "isPPMEnabled"))
        v76 = v111;
    }
    else
    {
      -[VUILabel bottomMarginWithBaselineMargin:](self->_titleLabel, "bottomMarginWithBaselineMargin:", v111);
      v76 = v79;
    }
    -[VUILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v19, 1.79769313e308);
    v77 = v80;
    v158.origin.x = v125;
    v158.origin.y = rect;
    v158.size.width = v19;
    v158.size.height = v77;
    v78 = Height - (v76 + CGRectGetHeight(v158));
    v81 = self->_titleLabel;

    v28 = v124;
    v121 = v123;
    v32 = v81;
    Height = v78;
  }
  else
  {
    v77 = v129;
    v19 = v28;
    v78 = rect;
    v125 = v71;
  }
  appleTVChannelLogoView = self->_appleTVChannelLogoView;
  if (appleTVChannelLogoView)
  {
    -[UIView vui_sizeThatFits:](appleTVChannelLogoView, "vui_sizeThatFits:", v113, 0.0);
    v28 = v83;
    v85 = v84;
    v159.origin.x = v126;
    v159.origin.y = rect;
    v159.size.width = v28;
    v159.size.height = v85;
    CGRectGetWidth(v159);
    VUIRoundValue();
    v126 = v112 + v86;
    objc_opt_class();
    v129 = v85;
    if ((objc_opt_isKindOfClass() & 1) != 0
      && !+[VUIPPMExtensions isPPMEnabled](VUIPPMExtensions, "isPPMEnabled"))
    {
      -[VUILabel topMarginWithBaselineMargin:](v32, "topMarginWithBaselineMargin:", v121);
      v123 = v87;
    }
    v88 = v19;
    v160.origin.x = v126;
    v160.origin.y = rect;
    v160.size.width = v28;
    v160.size.height = v129;
    rect = Height - (v123 + CGRectGetHeight(v160));
  }
  else
  {
    v88 = v19;
  }
  v89 = 20.0;
  if (v18)
  {
    VUIRoundValue();
    v89 = v90;
  }
  objc_msgSend(*(id *)(v37 + 3560), "array");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v137 = 0u;
  v138 = 0u;
  v139 = 0u;
  v140 = 0u;
  v92 = v131;
  v93 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v137, v146, 16);
  if (v93)
  {
    v94 = v93;
    v95 = *(_QWORD *)v138;
    do
    {
      for (j = 0; j != v94; ++j)
      {
        if (*(_QWORD *)v138 != v95)
          objc_enumerationMutation(v92);
        objc_msgSend(*(id *)(*((_QWORD *)&v137 + 1) + 8 * j), "CGRectValue");
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "addObject:", v97);

      }
      v94 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v137, v146, 16);
    }
    while (v94);
  }

  v98 = (void *)objc_msgSend(v91, "copy");
  -[UIView setFrame:](v127->_appleTVChannelLogoView, "setFrame:", v126, rect - v89, v28, v129);
  -[VUILabel setFrame:](v127->_titleLabel, "setFrame:", v125, v78 - v89, v88, v77);
  -[VUILabel setFrame:](v127->_subtitleLabel, "setFrame:", v115, v27 - v89, v117, v70);
  v135 = 0u;
  v136 = 0u;
  v133 = 0u;
  v134 = 0u;
  v99 = obj;
  v100 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v133, v145, 16);
  if (v100)
  {
    v101 = v100;
    v102 = 0;
    v103 = *(_QWORD *)v134;
    do
    {
      for (k = 0; k != v101; ++k)
      {
        if (*(_QWORD *)v134 != v103)
          objc_enumerationMutation(v99);
        v105 = *(void **)(*((_QWORD *)&v133 + 1) + 8 * k);
        objc_msgSend(v98, "objectAtIndex:", v102 + k);
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v106, "CGRectValue");
        objc_msgSend(v105, "setFrame:");

      }
      v101 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v133, v145, 16);
      v102 += k;
    }
    while (v101);
  }

  -[VUILabel setFrame:](v127->_disclaimerLabel, "setFrame:", v118, v122 - v89, v119, v120);
}

- (UIView)appleTVChannelLogoView
{
  return self->_appleTVChannelLogoView;
}

- (VUILabel)titleLabel
{
  return self->_titleLabel;
}

- (VUILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (VUILabel)disclaimerLabel
{
  return self->_disclaimerLabel;
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (BOOL)usesDefaultOverlayType
{
  return self->_usesDefaultOverlayType;
}

- (void)setUsesDefaultOverlayType:(BOOL)a3
{
  self->_usesDefaultOverlayType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_disclaimerLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_appleTVChannelLogoView, 0);
}

@end
