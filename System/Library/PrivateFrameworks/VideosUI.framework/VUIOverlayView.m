@implementation VUIOverlayView

+ (id)overlayViewFromMediaItem:(id)a3 overlayType:(int64_t)a4 existingView:(id)a5
{
  id v7;
  id v8;
  VUIOverlayView *v9;
  VUIOverlayView *v10;
  VUIOverlayView *v11;
  void *v12;
  float v13;
  float v14;
  void *v15;
  float v16;
  float v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = (VUIOverlayView *)v7;
  }
  else
  {
    v10 = [VUIOverlayView alloc];
    v9 = -[VUIOverlayView initWithFrame:](v10, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  }
  v11 = v9;
  -[VUIOverlayView setOverlayType:](v9, "setOverlayType:", a4);
  objc_msgSend(v8, "bookmark");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "floatValue");
  v14 = v13;

  objc_msgSend(v8, "duration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "floatValue");
  v17 = v16;

  objc_msgSend(v8, "playedState");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_msgSend(v18, "integerValue");
  if (v19 == 3)
  {
    v20 = objc_alloc_init(MEMORY[0x1E0DB18B0]);
    +[VUIImageResourceMap imageForResourceName:](VUIImageResourceMap, "imageForResourceName:", CFSTR("watched-checkmark"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setImage:", v21);

    objc_msgSend(v20, "setContentMode:", 12);
    if (!v20)
    {
LABEL_12:

      goto LABEL_13;
    }
    v22 = (void *)objc_opt_new();
    objc_msgSend(v22, "setBadgeView:", v20);
    objc_msgSend(v22, "setBadgeSize:", 160.0, 160.0);
    objc_msgSend(v22, "setBadgeType:", CFSTR("checkmark"));
    v29[0] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIOverlayView setBadgeViewWrappers:](v11, "setBadgeViewWrappers:", v23);

LABEL_11:
    goto LABEL_12;
  }
  if (v14 > 0.0 && v17 > 0.0)
  {
    v24 = v14 / v17;
    if (v24 > 0.0)
    {
      v20 = (id)objc_opt_new();
      +[VUIProgressBarLayout defaultProgressBarLayout](VUIProgressBarLayout, "defaultProgressBarLayout");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "gradientStartColor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setGradientStartColor:", v25);

      objc_msgSend(v22, "gradientEndColor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setGradientEndColor:", v26);

      objc_msgSend(v22, "cornerRadius");
      objc_msgSend(v20, "setCornerRadius:");
      objc_msgSend(v20, "setShouldProgressBarUseRoundCorner:", objc_msgSend(v22, "shouldProgressBarUseRoundCorner"));
      objc_msgSend(v22, "fillColor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setCompleteTintColor:", v27);

      objc_msgSend(v20, "setStyle:", 1);
      objc_msgSend(v22, "height");
      objc_msgSend(v20, "setHeight:");
      objc_msgSend(v20, "setProgress:", v24);
      -[VUIOverlayView setProgressView:](v11, "setProgressView:", v20);
      goto LABEL_11;
    }
  }
LABEL_13:
  -[VUIOverlayView _overlayPadding](v11, "_overlayPadding");
  -[VUIOverlayView setPadding:](v11, "setPadding:");

  return v11;
}

- (void)setOverlayType:(int64_t)a3
{
  if (self->_overlayType != a3)
  {
    self->_overlayType = a3;
    -[VUIOverlayView vui_setNeedsDisplay](self, "vui_setNeedsDisplay");
  }
}

- (void)setGradientLayer:(id)a3
{
  CALayer *v5;
  CALayer **p_gradientLayer;
  CALayer *gradientLayer;
  CALayer *v8;
  void *v9;
  CALayer *v10;

  v5 = (CALayer *)a3;
  p_gradientLayer = &self->_gradientLayer;
  gradientLayer = self->_gradientLayer;
  v10 = v5;
  if (gradientLayer != v5)
  {
    -[CALayer removeFromSuperlayer](gradientLayer, "removeFromSuperlayer");
    objc_storeStrong((id *)&self->_gradientLayer, a3);
    v8 = *p_gradientLayer;
    -[VUIBaseView bounds](self->_gradientView, "bounds");
    -[CALayer setFrame:](v8, "setFrame:");
    -[VUIBaseView layer](self->_gradientView, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSublayer:", *p_gradientLayer);

  }
  -[VUIOverlayView vui_setNeedsLayout](self, "vui_setNeedsLayout");

}

- (void)setGradientView:(id)a3
{
  VUIBaseView *v5;
  VUIBaseView *gradientView;
  VUIBaseView *v7;

  v5 = (VUIBaseView *)a3;
  gradientView = self->_gradientView;
  v7 = v5;
  if (gradientView != v5)
  {
    -[VUIBaseView removeFromSuperview](gradientView, "removeFromSuperview");
    -[VUIOverlayView vui_insertSubview:aboveSubview:oldView:](self, "vui_insertSubview:aboveSubview:oldView:", v7, 0, self->_gradientView);
    objc_storeStrong((id *)&self->_gradientView, a3);
  }
  -[VUIOverlayView vui_setNeedsLayout](self, "vui_setNeedsLayout");

}

- (void)setTitleLabel:(id)a3
{
  VUILabel *v5;
  VUILabel *titleLabel;
  VUILabel *v7;

  v5 = (VUILabel *)a3;
  titleLabel = self->_titleLabel;
  v7 = v5;
  if (titleLabel != v5)
  {
    -[VUILabel removeFromSuperview](titleLabel, "removeFromSuperview");
    objc_storeStrong((id *)&self->_titleLabel, a3);
    if (self->_titleLabel)
      -[VUIOverlayView addSubview:](self, "addSubview:");
  }
  -[VUIOverlayView vui_setNeedsLayout](self, "vui_setNeedsLayout");

}

- (void)setTextBadge:(id)a3
{
  VUITextBadgeView *v5;

  v5 = (VUITextBadgeView *)a3;
  -[VUIOverlayView vui_addSubview:oldView:](self, "vui_addSubview:oldView:", v5, self->_textBadge);
  if (self->_textBadge != v5)
    objc_storeStrong((id *)&self->_textBadge, a3);
  -[VUIOverlayView vui_setNeedsLayout](self, "vui_setNeedsLayout");

}

- (void)setBadgeViewWrappers:(id)a3
{
  id v5;
  NSArray **p_badgeViewWrappers;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
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
  if (objc_msgSend(v5, "count") || -[NSArray count](self->_badgeViewWrappers, "count"))
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    p_badgeViewWrappers = &self->_badgeViewWrappers;
    v7 = self->_badgeViewWrappers;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v24;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v24 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v11), "badgeView");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "removeFromSuperview");

          ++v11;
        }
        while (v9 != v11);
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v9);
    }

    objc_storeStrong((id *)p_badgeViewWrappers, a3);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v13 = *p_badgeViewWrappers;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v20;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v20 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v17), "badgeView", (_QWORD)v19);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[VUIOverlayView addSubview:](self, "addSubview:", v18);

          ++v17;
        }
        while (v15 != v17);
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v15);
    }

    -[VUIOverlayView vui_setNeedsLayout](self, "vui_setNeedsLayout");
  }

}

- (void)setProgressView:(id)a3
{
  VUIProgressView *v5;
  VUIProgressView *progressView;
  VUIProgressView *v7;

  v5 = (VUIProgressView *)a3;
  progressView = self->_progressView;
  v7 = v5;
  if (progressView != v5)
  {
    -[VUIProgressView removeFromSuperview](progressView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_progressView, a3);
    if (self->_progressView)
      -[VUIOverlayView addSubview:](self, "addSubview:");
  }
  -[VUIOverlayView setNeedsLayout](self, "setNeedsLayout");

}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  CGFloat height;
  int v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  VUITextBadgeView *textBadge;
  double v48;
  double v49;
  double v50;
  double v51;
  NSArray *badgeViewWrappers;
  NSArray *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  double v57;
  double v58;
  uint64_t i;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  void *v66;
  double v67;
  double v68;
  int v69;
  double v70;
  double v71;
  double v72;
  void *v73;
  double v74;
  void *v75;
  CALayer *gradientLayer;
  void *v77;
  void *v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  void *v97;
  NSArray *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t j;
  void *v103;
  void *v104;
  void *v105;
  double v106;
  double v107;
  void *v108;
  double v109;
  double v110;
  double right;
  CGFloat width;
  double top;
  double v114;
  CGFloat v115;
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
  double v127;
  double left;
  double v129;
  double v130;
  double v131;
  double v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  objc_super v141;
  _BYTE v142[128];
  _BYTE v143[128];
  uint64_t v144;
  CGSize result;
  CGRect v146;

  height = a3.height;
  v144 = *MEMORY[0x1E0C80C00];
  v141.receiver = self;
  v141.super_class = (Class)VUIOverlayView;
  width = a3.width;
  -[VUIOverlayView vui_layoutSubviews:computationOnly:](&v141, sel_vui_layoutSubviews_computationOnly_, a4);
  v6 = -[VUIOverlayView vuiIsRTL](self, "vuiIsRTL");
  -[VUIOverlayView bounds](self, "bounds");
  v8 = v7;
  v10 = v9;
  top = self->_padding.top;
  left = self->_padding.left;
  right = self->_padding.right;
  v12 = *MEMORY[0x1E0C9D648];
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v14 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v13 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v120 = *MEMORY[0x1E0C9D648];
  v121 = v11;
  v122 = v11;
  v123 = v13;
  v118 = v11;
  v119 = v14;
  v130 = v13;
  v131 = v13;
  v15 = v14;
  v129 = *MEMORY[0x1E0C9D648];
  v132 = v11;
  v115 = height;
  v116 = v14;
  v117 = *MEMORY[0x1E0C9D648];
  if (self->_titleLabel)
  {
    -[VUIOverlayView titleLabel](self, "titleLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "textLayout");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "margin");
    v19 = v18;
    v21 = v20;
    v23 = v22;

    v15 = v8 - v19 - v23;
    -[VUILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v15, 0.0);
    v131 = v24;
    VUIRoundValue();
    v129 = v25;
    v12 = v117;
    switch(self->_overlayType)
    {
      case 1:
        VUIRoundValue();
        v11 = v132;
        v121 = v132;
        v122 = v27;
        v13 = v130;
        v123 = v130;
        v14 = v116;
        v119 = v116;
        v120 = v117;
        v118 = v132;
        break;
      case 2:
      case 4:
        -[VUILabel bottomMarginWithBaselineMargin:](self->_titleLabel, "bottomMarginWithBaselineMargin:", v21);
        VUIRoundValue();
        v122 = v26;
        v123 = v10 * 0.28;
        v118 = v10 - v10 * 0.28;
        v120 = *MEMORY[0x1E0C9D538];
        v121 = *(double *)(MEMORY[0x1E0C9D538] + 8);
        -[VUIOverlayView vui_sendSubviewToBack:](self, "vui_sendSubviewToBack:", self->_gradientView);
        goto LABEL_7;
      case 3:
        -[VUILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v15, 0.0);
        v131 = v28;
        -[VUILabel bottomMarginWithBaselineMargin:](self->_titleLabel, "bottomMarginWithBaselineMargin:", v21);
        VUIRoundValue();
        v122 = v29;
        v118 = v10 + -145.0;
        v120 = *MEMORY[0x1E0C9D538];
        v121 = *(double *)(MEMORY[0x1E0C9D538] + 8);
        -[VUIOverlayView vui_sendSubviewToBack:](self, "vui_sendSubviewToBack:", self->_gradientView);
        v123 = 145.0;
LABEL_7:
        v119 = v8;
        goto LABEL_23;
      case 5:
        v30 = v10 * 0.28;
        v31 = (void *)MEMORY[0x1E0DC3F98];
        -[VUIOverlayView bounds](self, "bounds");
        v32 = objc_msgSend(v31, "vui_currentSizeClassForWindowWidth:", CGRectGetWidth(v146));
        v33 = v32;
        if ((unint64_t)(v32 - 1) < 3)
        {
          objc_msgSend(MEMORY[0x1E0DC3F98], "vui_padding");
          v34 = v8 - v35 - v36;
          v30 = 138.0;
          *(double *)&v37 = 40.0;
        }
        else
        {
          if ((unint64_t)(v32 - 4) >= 3)
          {
            v38 = 0.0;
            v34 = 0.0;
            if (v32 != 8)
              goto LABEL_16;
            v34 = fmin(v8, 856.0);
            v30 = 280.0;
          }
          else
          {
            v34 = fmin(v8, 350.0);
            v30 = 142.0;
          }
          *(double *)&v37 = 50.0;
        }
        v38 = *(double *)&v37;
LABEL_16:
        if (self->_hasPageControlDisplayedOnTop)
          v39 = 53.0;
        else
          v39 = v38;
        -[VUILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v34, 0.0);
        v41 = v40;
        v43 = v42;
        VUIRoundValue();
        v129 = v44;
        v131 = v43;
        -[VUILabel bottomMarginWithBaselineMargin:](self->_titleLabel, "bottomMarginWithBaselineMargin:", v39);
        VUIRoundValue();
        v122 = v45;
        if (v33 == 8)
          v46 = v30 + v10 * 0.035;
        else
          v46 = v30;
        v118 = v10 - v30;
        v120 = *MEMORY[0x1E0C9D538];
        v121 = *(double *)(MEMORY[0x1E0C9D538] + 8);
        -[VUIOverlayView vui_sendSubviewToBack:](self, "vui_sendSubviewToBack:", self->_gradientView);
        v123 = v46;
        v15 = v41;
        v119 = v8;
        v12 = v117;
LABEL_23:
        v13 = v130;
        v14 = v116;
        v11 = v132;
        break;
      default:
        v11 = v132;
        v14 = v116;
        v12 = v117;
        v120 = v117;
        v121 = v132;
        v13 = v130;
        v122 = v132;
        v123 = v130;
        v118 = v132;
        v119 = v116;
        break;
    }
  }
  v114 = v15;
  textBadge = self->_textBadge;
  v126 = v14;
  v127 = v13;
  v124 = v12;
  v125 = v11;
  if (textBadge)
  {
    -[UIView vui_sizeThatFits:](textBadge, "vui_sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    v126 = v48;
    v127 = v49;
    if (self->_overlayType == 3)
      v50 = 40.0;
    else
      v50 = top;
    v51 = 30.0;
    if (self->_overlayType != 3)
      v51 = left;
    v124 = v51;
    v125 = v50;
  }
  badgeViewWrappers = self->_badgeViewWrappers;
  if (badgeViewWrappers)
  {
    v139 = 0u;
    v140 = 0u;
    v137 = 0u;
    v138 = 0u;
    v53 = badgeViewWrappers;
    v54 = -[NSArray countByEnumeratingWithState:objects:count:](v53, "countByEnumeratingWithState:objects:count:", &v137, v143, 16);
    if (v54)
    {
      v55 = v54;
      v56 = *(_QWORD *)v138;
      v57 = top + *MEMORY[0x1E0DC49E8];
      v58 = left + *(double *)(MEMORY[0x1E0DC49E8] + 8);
      do
      {
        for (i = 0; i != v55; ++i)
        {
          if (*(_QWORD *)v138 != v56)
            objc_enumerationMutation(v53);
          v60 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * i);
          objc_msgSend(v60, "badgeSize");
          v62 = v61;
          v64 = v63;
          objc_msgSend(v60, "badgeType");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = v65;
          v67 = v58;
          v68 = v57;
          if (v65)
          {
            v69 = objc_msgSend(v65, "isEqualToString:", CFSTR("checkmark"), v58, v57);
            v67 = v8 - v62;
            v68 = v10 - v64;
            if (!v69)
            {
              v67 = v58;
              v68 = v57;
            }
          }
          if (v6)
          {
            VUIRectWithFlippedOriginRelativeToBoundingRect();
            v62 = v70;
            v64 = v71;
          }
          objc_msgSend(v60, "setBadgeFrame:", v67, v68, v62, v64);

        }
        v55 = -[NSArray countByEnumeratingWithState:objects:count:](v53, "countByEnumeratingWithState:objects:count:", &v137, v143, 16);
      }
      while (v55);
    }

    v12 = v117;
  }
  v72 = v12;
  if (self->_progressView)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "userInterfaceIdiom");

    -[VUIProgressView sizeThatFits:](self->_progressView, "sizeThatFits:", v8 - left - right, 0.0);
    VUIRoundValue();
    v72 = left;
  }
  if (v6)
  {
    VUIRectWithFlippedOriginRelativeToBoundingRect();
    v72 = v74;
    -[VUIProgressView layer](self->_progressView, "layer");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "setFlipsHorizontalAxis:", 1);

  }
  -[VUIProgressView setFrame:](self->_progressView, "setFrame:", v72);
  -[VUIBaseView setFrame:](self->_gradientView, "setFrame:", v12, v118, v119, v123);
  -[CALayer setFrame:](self->_gradientLayer, "setFrame:", v120, v121, v119, v123);
  gradientLayer = self->_gradientLayer;
  if (gradientLayer)
  {
    -[CALayer mask](gradientLayer, "mask");
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    if (v77)
    {
      -[CALayer mask](self->_gradientLayer, "mask");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "setFrame:", v120, v121, v119, v123);

    }
  }
  v79 = v114;
  v80 = v131;
  v81 = v129;
  if (v6)
  {
    VUIRectWithFlippedOriginRelativeToBoundingRect();
    v81 = v82;
    v84 = v83;
    v79 = v85;
    v80 = v86;
    VUIRectWithFlippedOriginRelativeToBoundingRect();
    v88 = v87;
    v90 = v89;
    v91 = v84;
    v93 = v92;
    v95 = v94;
    v96 = v115;
  }
  else
  {
    v91 = v122;
    v96 = v115;
    v93 = v126;
    v95 = v127;
    v88 = v124;
    v90 = v125;
  }
  -[VUILabel setFrame:](self->_titleLabel, "setFrame:", v81, v91, v79, v80);
  -[VUITextBadgeView setFrame:](self->_textBadge, "setFrame:", v88, v90, v93, v95);
  if (self->_overlayType == 3)
  {
    -[VUITextBadgeView layer](self->_textBadge, "layer");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "removeAllAnimations");

  }
  v135 = 0u;
  v136 = 0u;
  v133 = 0u;
  v134 = 0u;
  v98 = self->_badgeViewWrappers;
  v99 = -[NSArray countByEnumeratingWithState:objects:count:](v98, "countByEnumeratingWithState:objects:count:", &v133, v142, 16);
  if (v99)
  {
    v100 = v99;
    v101 = *(_QWORD *)v134;
    do
    {
      for (j = 0; j != v100; ++j)
      {
        if (*(_QWORD *)v134 != v101)
          objc_enumerationMutation(v98);
        v103 = *(void **)(*((_QWORD *)&v133 + 1) + 8 * j);
        objc_msgSend(v103, "badgeView");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v103, "badgeFrame");
        objc_msgSend(v104, "setFrame:");

      }
      v100 = -[NSArray countByEnumeratingWithState:objects:count:](v98, "countByEnumeratingWithState:objects:count:", &v133, v142, 16);
    }
    while (v100);
  }

  -[VUIOverlayView layer](self, "layer");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "cornerRadius");
  v107 = v106;

  -[VUIOverlayView layer](self, "layer");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "setMasksToBounds:", v107 > 0.0);

  v109 = width;
  v110 = v96;
  result.height = v110;
  result.width = v109;
  return result;
}

- (UIEdgeInsets)_overlayPadding
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *MEMORY[0x1E0DC49E8];
  v3 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v4 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v5 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  if (self->_overlayType == 4)
  {
    v5 = 8.0;
    v4 = 8.0;
    v3 = 8.0;
    v2 = 8.0;
  }
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (VUILabel)titleLabel
{
  return self->_titleLabel;
}

- (VUITextBadgeView)textBadge
{
  return self->_textBadge;
}

- (VUIProgressView)progressView
{
  return self->_progressView;
}

- (VUIBaseView)gradientView
{
  return self->_gradientView;
}

- (CALayer)gradientLayer
{
  return self->_gradientLayer;
}

- (NSArray)badgeViewWrappers
{
  return self->_badgeViewWrappers;
}

- (int64_t)overlayType
{
  return self->_overlayType;
}

- (UIEdgeInsets)padding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_padding.top;
  left = self->_padding.left;
  bottom = self->_padding.bottom;
  right = self->_padding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
}

- (BOOL)hasPageControlDisplayedOnTop
{
  return self->_hasPageControlDisplayedOnTop;
}

- (void)setHasPageControlDisplayedOnTop:(BOOL)a3
{
  self->_hasPageControlDisplayedOnTop = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeViewWrappers, 0);
  objc_storeStrong((id *)&self->_gradientLayer, 0);
  objc_storeStrong((id *)&self->_gradientView, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_textBadge, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
