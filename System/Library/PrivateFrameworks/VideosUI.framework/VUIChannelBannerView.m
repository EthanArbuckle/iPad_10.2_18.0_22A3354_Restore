@implementation VUIChannelBannerView

- (VUIChannelBannerView)initWithFrame:(CGRect)a3
{
  VUIChannelBannerView *v3;
  VUISeparatorView *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VUIChannelBannerView;
  v3 = -[VUIChannelBannerView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(VUISeparatorView);
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "nativeScale");
    v7 = 1.0 / v6;

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUISeparatorView setDarkColor:](v4, "setDarkColor:", v8);

    -[VUISeparatorView setLineHeight:](v4, "setLineHeight:", v7);
    -[VUIChannelBannerView setSeparatorView:](v3, "setSeparatorView:", v4);
    v9 = (void *)objc_opt_new();
    -[VUIChannelBannerView setBgColorView:](v3, "setBgColorView:", v9);

  }
  return v3;
}

- (void)setVuiBackgroundColor:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VUIChannelBannerView;
  v4 = a3;
  -[VUIChannelBannerView setVuiBackgroundColor:](&v5, sel_setVuiBackgroundColor_, v4);
  -[UIView setVuiBackgroundColor:](self->_bgColorView, "setVuiBackgroundColor:", v4, v5.receiver, v5.super_class);

}

- (void)setBgColorView:(id)a3
{
  UIView *v5;
  UIView *bgColorView;
  UIView *v7;

  v5 = (UIView *)a3;
  bgColorView = self->_bgColorView;
  if (bgColorView != v5)
  {
    v7 = v5;
    -[UIView removeFromSuperview](bgColorView, "removeFromSuperview");
    if (v7 && !-[UIView isDescendantOfView:](v7, "isDescendantOfView:", self))
      -[VUIChannelBannerView addSubview:](self, "addSubview:", v7);
    objc_storeStrong((id *)&self->_bgColorView, a3);
    -[VUIChannelBannerView setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (void)setAppleTVChannelLogoView:(id)a3
{
  UIView *v5;

  v5 = (UIView *)a3;
  -[VUIChannelBannerView vui_addSubview:oldView:](self, "vui_addSubview:oldView:", v5, self->_appleTVChannelLogoView);
  if (self->_appleTVChannelLogoView != v5)
  {
    objc_storeStrong((id *)&self->_appleTVChannelLogoView, a3);
    -[VUIChannelBannerView vui_setNeedsLayout](self, "vui_setNeedsLayout");
  }

}

- (void)setSeparatorView:(id)a3
{
  VUISeparatorView *v5;

  v5 = (VUISeparatorView *)a3;
  -[VUIChannelBannerView vui_addSubview:oldView:](self, "vui_addSubview:oldView:", v5, self->_separatorView);
  if (self->_separatorView != v5)
  {
    objc_storeStrong((id *)&self->_separatorView, a3);
    -[VUIChannelBannerView vui_setNeedsLayout](self, "vui_setNeedsLayout");
  }

}

- (void)setTextLabels:(id)a3
{
  id v5;
  NSArray **p_textLabels;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "count") || -[NSArray count](self->_textLabels, "count"))
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    p_textLabels = &self->_textLabels;
    v7 = self->_textLabels;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v11++), "vui_removeFromSuperView");
        }
        while (v9 != v11);
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v9);
    }

    objc_storeStrong((id *)p_textLabels, a3);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v12 = *p_textLabels;
    v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v18;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(v12);
          -[VUIChannelBannerView vui_addSubview:oldView:](self, "vui_addSubview:oldView:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++), 0, (_QWORD)v17);
        }
        while (v14 != v16);
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v14);
    }

    -[VUIChannelBannerView vui_setNeedsLayout](self, "vui_setNeedsLayout");
  }

}

- (void)setDescriptionTextView:(id)a3
{
  UIView *v5;

  v5 = (UIView *)a3;
  -[VUIChannelBannerView vui_addSubview:oldView:](self, "vui_addSubview:oldView:", v5, self->_descriptionTextView);
  if (self->_descriptionTextView != v5)
  {
    objc_storeStrong((id *)&self->_descriptionTextView, a3);
    -[VUIChannelBannerView vui_setNeedsLayout](self, "vui_setNeedsLayout");
  }

}

- (void)setSubscribeButton:(id)a3
{
  UIView *v5;

  v5 = (UIView *)a3;
  -[VUIChannelBannerView vui_addSubview:oldView:](self, "vui_addSubview:oldView:", v5, self->_subscribeButton);
  if (self->_subscribeButton != v5)
  {
    objc_storeStrong((id *)&self->_subscribeButton, a3);
    -[VUIChannelBannerView vui_setNeedsLayout](self, "vui_setNeedsLayout");
  }

}

- (void)setDisclaimerTextLabel:(id)a3
{
  VUILabel *v5;

  v5 = (VUILabel *)a3;
  -[VUIChannelBannerView vui_addSubview:oldView:](self, "vui_addSubview:oldView:", v5, self->_disclaimerTextLabel);
  if (self->_disclaimerTextLabel != v5)
  {
    objc_storeStrong((id *)&self->_disclaimerTextLabel, a3);
    -[VUIChannelBannerView vui_setNeedsLayout](self, "vui_setNeedsLayout");
  }

}

- (void)setBgImageView:(id)a3
{
  VUIProductUberBackgroundView *v5;
  VUIProductUberBackgroundView *v6;

  v5 = (VUIProductUberBackgroundView *)a3;
  if (self->_bgImageView != v5)
  {
    v6 = v5;
    -[VUIChannelBannerView vui_addSubview:oldView:](self, "vui_addSubview:oldView:", v5);
    if (self->_bgImageView != v6)
      objc_storeStrong((id *)&self->_bgImageView, a3);
    -[VUIChannelBannerView vui_sendSubviewToBack:](self, "vui_sendSubviewToBack:", v6);
    -[VUIChannelBannerView vui_setNeedsLayout](self, "vui_setNeedsLayout");
    v5 = v6;
  }

}

- (void)setHeight:(double)a3
{
  if (self->_height != a3)
  {
    self->_height = a3;
    -[VUIChannelBannerView vui_setNeedsLayout](self, "vui_setNeedsLayout");
  }
}

- (double)topThreshold
{
  CGRect v3;

  -[UIView frame](self->_appleTVChannelLogoView, "frame");
  return CGRectGetMinY(v3);
}

- (CGSize)_layoutSubviewsWithSize:(CGSize)a3 computationOnly:(BOOL)a4
{
  double width;
  void *v6;
  char v7;
  uint64_t v8;
  int v9;
  int v10;
  char v11;
  double v12;
  char v13;
  double v14;
  double v15;
  double v16;
  double v17;
  int v18;
  int v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  _BOOL4 v25;
  BOOL v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  UIView *appleTVChannelLogoView;
  double v38;
  double v39;
  double v40;
  CGFloat v41;
  double v42;
  double v43;
  UIView *v44;
  double v45;
  CGFloat v46;
  double v47;
  double v48;
  double v49;
  UIView *p_super;
  BOOL v51;
  double v52;
  uint64_t v53;
  double v54;
  double v55;
  UIView *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  VUISeparatorView *separatorView;
  double v66;
  double v67;
  VUISeparatorView *v68;
  double v69;
  double v70;
  double v71;
  _BOOL8 v72;
  UIView *descriptionTextView;
  NSArray *v74;
  uint64_t v75;
  CGFloat v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t i;
  double v80;
  CGFloat v81;
  double v82;
  CGFloat v83;
  double v84;
  double v85;
  double v86;
  CGFloat v87;
  UIView *v88;
  double v89;
  double v90;
  CGFloat v91;
  double v92;
  double v93;
  double v94;
  uint64_t v95;
  uint64_t v96;
  UIView *v97;
  uint64_t v98;
  double v99;
  uint64_t j;
  void *v101;
  void *v102;
  double v103;
  double v104;
  void *v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  void *v111;
  double v112;
  id v113;
  VUISeparatorView *v114;
  double v115;
  VUISeparatorView *v116;
  double v117;
  CGFloat v118;
  double v119;
  double v120;
  double v121;
  CGFloat MaxY;
  VUILabel *v123;
  double v124;
  double v125;
  CGFloat v126;
  double v127;
  double v128;
  double v129;
  double v130;
  VUILabel *v131;
  double v132;
  double v133;
  CGFloat v134;
  double v135;
  CGFloat v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  CGFloat v143;
  double v144;
  double v145;
  CGFloat v146;
  double v147;
  double v148;
  double v149;
  CGFloat v150;
  CGFloat v151;
  double v152;
  VUILabel *disclaimerTextLabel;
  double v154;
  double v155;
  CGFloat v156;
  double v157;
  double v158;
  double v159;
  CGFloat v160;
  double v161;
  double v162;
  double v163;
  VUISeparatorView *v164;
  VUISeparatorView *v165;
  double v166;
  double v167;
  UIView *v168;
  double v169;
  CGFloat v170;
  double v171;
  CGFloat v172;
  double v173;
  double v174;
  CGFloat v175;
  CGFloat v176;
  double v177;
  double v178;
  NSArray *textLabels;
  double v180;
  double v181;
  double v182;
  NSArray *v183;
  uint64_t v184;
  uint64_t v185;
  id v186;
  uint64_t v187;
  double v188;
  double v189;
  uint64_t v190;
  void *v191;
  void *v192;
  void *v193;
  double v194;
  double v195;
  void *v196;
  double v197;
  double v198;
  double v199;
  double v200;
  double v201;
  void *v202;
  id v203;
  double v204;
  double v205;
  double v206;
  double v207;
  CGFloat v208;
  VUIProductUberBackgroundView *bgImageView;
  double v210;
  double v211;
  double v212;
  double v213;
  double v214;
  double v215;
  double v216;
  double v217;
  double v218;
  double v219;
  double v220;
  double v221;
  double v222;
  double v223;
  double height;
  double v225;
  double v227;
  double v228;
  double v229;
  double v230;
  _BYTE v231[32];
  double v232;
  double v233;
  double v234;
  double v235;
  double v236;
  double v237;
  double v238;
  double v239;
  double v240;
  double v241;
  double x;
  double v243;
  double v244;
  double v245;
  double v246;
  double v247;
  double v248;
  double y;
  CGFloat rect;
  CGFloat recta;
  double v252;
  CGFloat v253;
  double v254;
  double v255;
  double v256;
  double v257;
  CGFloat v258;
  CGFloat v259;
  CGFloat v260;
  CGFloat v261;
  CGFloat v262;
  double v263;
  double v264;
  double v265;
  VUILabel *v266;
  double obj;
  NSArray *obja;
  double objb;
  double objc;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  __int128 v274;
  __int128 v275;
  __int128 v276;
  __int128 v277;
  __int128 v278;
  __int128 v279;
  __int128 v280;
  __int128 v281;
  __int128 v282;
  _BYTE v283[128];
  _BYTE v284[128];
  _BYTE v285[128];
  uint64_t v286;
  CGSize result;
  CGRect v288;
  CGRect v289;
  CGRect v290;
  CGRect v291;
  CGRect v292;
  CGRect v293;
  CGRect v294;
  CGRect v295;
  CGRect v296;
  CGRect v297;
  CGRect v298;
  CGRect v299;
  CGRect v300;
  CGRect v301;
  CGRect v302;
  CGRect v303;
  CGRect v304;
  CGRect v305;
  CGRect v306;
  CGRect v307;
  CGRect v308;
  CGRect v309;
  CGRect v310;
  CGRect v311;
  CGRect v312;
  CGRect v313;
  CGRect v314;
  CGRect v315;
  CGRect v316;
  CGRect v317;
  CGRect v318;

  height = a3.height;
  width = a3.width;
  v286 = *MEMORY[0x1E0C80C00];
  -[VUIChannelBannerView vuiTraitCollection](self, "vuiTraitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isAXEnabled");

  v8 = objc_msgSend(MEMORY[0x1E0DC3F98], "vui_currentSizeClassForWindowWidth:", width);
  v9 = objc_msgSend(MEMORY[0x1E0DC69D0], "isMac");
  v10 = v9;
  if ((unint64_t)(v8 - 1) < 3)
    v11 = 1;
  else
    v11 = v7;
  if (v9)
    v12 = 20.0;
  else
    v12 = 16.0;
  v13 = v11 & ~(_BYTE)v9;
  objc_msgSend(MEMORY[0x1E0DC3F98], "vui_paddingForWindowWidth:", width);
  v15 = v14;
  v257 = v16;
  v17 = width - v16;
  v18 = objc_msgSend(MEMORY[0x1E0DC69D0], "isTV");
  v19 = v18;
  v20 = 36.0;
  if ((v13 & 1) != 0)
    v20 = 40.0;
  if (v18)
    v21 = 68.0;
  else
    v21 = v20;
  v22 = 38.0;
  if (!v18)
    v22 = v12;
  v223 = v22;
  if (v10 | v18)
    v23 = 32.0;
  else
    v23 = 28.0;
  -[VUISeparatorView lineHeight](self->_separatorView, "lineHeight");
  v255 = v24;
  if (v19)
  {
    v25 = -[VUIChannelBannerView _isSubscribed](self, "_isSubscribed");
    v26 = !v25;
    v27 = 58.0;
    v28 = 44.0;
    if (v25)
      v27 = 44.0;
    v264 = v27;
    v29 = 50.0;
  }
  else
  {
    v26 = (v13 & 1) == 0;
    v30 = 32.0;
    if ((v13 & 1) != 0)
      v30 = 28.0;
    v264 = v30;
    v29 = 80.0;
    v28 = 115.0;
  }
  if (v26)
    v31 = v29;
  else
    v31 = v28;
  v230 = v15;
  v32 = v17 - v15;
  v33 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v244 = *MEMORY[0x1E0C9D648];
  v34 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v254 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v225 = *MEMORY[0x1E0C9D538];
  v237 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[VUIChannelBannerView logoHeight](self, "logoHeight");
  v36 = v35;
  v252 = v34;
  v253 = v33;
  if (-[VUIChannelBannerView _isSubscribed](self, "_isSubscribed"))
  {
    appleTVChannelLogoView = self->_appleTVChannelLogoView;
    v38 = 0.0;
    if (appleTVChannelLogoView)
    {
      -[UIView vui_sizeThatFits:](appleTVChannelLogoView, "vui_sizeThatFits:", v32, v36);
      v39 = v33;
      v41 = v40;
      rect = v42;
      x = v257 + (v32 - v40) * 0.5;
      v243 = v254;
      v245 = v39;
      v246 = v39;
      v43 = v244;
      v238 = v244;
      v239 = v34;
      v234 = v39;
      v235 = v254;
      v256 = v34;
      v236 = v244;
      *(double *)&v231[16] = v34;
      *(double *)&v231[24] = v254;
      v38 = v264 + v31 + v42;
      *(double *)v231 = v244;
      *(double *)&v231[8] = v39;
      v240 = v34;
      v241 = v254;
      v248 = v244;
      y = v31;
      v32 = 0.0;
    }
    else
    {
      v243 = v254;
      v245 = v33;
      v246 = v33;
      v43 = v244;
      v238 = v244;
      v239 = v34;
      v234 = v33;
      v235 = v254;
      v256 = v34;
      v236 = v244;
      *(double *)&v231[16] = v34;
      *(double *)&v231[24] = v254;
      *(double *)v231 = v244;
      *(double *)&v231[8] = v33;
      v240 = v34;
      v241 = v254;
      rect = v254;
      v64 = v33;
      v41 = v34;
      v248 = v244;
      y = v64;
      v32 = 0.0;
      x = v244;
    }
    v51 = a4;
    goto LABEL_151;
  }
  v265 = v32;
  if ((v13 & 1) != 0)
  {
    v44 = self->_appleTVChannelLogoView;
    if (v44)
    {
      -[UIView vui_sizeThatFits:](v44, "vui_sizeThatFits:", v32, v36);
      v46 = v45;
      v47 = v257 + (v32 - v45) * 0.5;
      rect = v48;
      v49 = v31 + v48;
      p_super = self->_appleTVChannelLogoView;
      v51 = a4;
      v52 = v254;
    }
    else
    {
      p_super = 0;
      v49 = 0.0;
      v52 = v254;
      rect = v254;
      v46 = v252;
      v31 = v33;
      v47 = v244;
      v51 = a4;
    }
    separatorView = self->_separatorView;
    y = v31;
    if (separatorView)
    {
      -[VUISeparatorView setHidden:](separatorView, "setHidden:", 0, v52);
      v288.origin.x = v47;
      v288.origin.y = v31;
      v288.size.width = v46;
      v288.size.height = rect;
      CGRectGetMaxY(v288);
      VUIRoundValue();
      v67 = v66;
      v68 = self->_separatorView;

      p_super = &v68->super.super;
      v258 = v257;
      v260 = v32;
      v49 = v23 + v255 + v49;
      v240 = v32;
      v241 = v255;
      v262 = v67;
      v246 = v67;
      v248 = v257;
    }
    else
    {
      v255 = rect;
      v260 = v46;
      v262 = v31;
      v258 = v47;
      v241 = v52;
      v240 = v252;
      v246 = v253;
      v248 = v244;
    }
    x = v47;
    v227 = v46;
    if (-[VUIChannelBannerView isDescriptionPreferredOnPhoneSizeClass](self, "isDescriptionPreferredOnPhoneSizeClass")
      && (descriptionTextView = self->_descriptionTextView) != 0)
    {
      -[UIView setHidden:](descriptionTextView, "setHidden:", 0);
      v281 = 0u;
      v282 = 0u;
      v279 = 0u;
      v280 = 0u;
      v74 = self->_textLabels;
      v75 = -[NSArray countByEnumeratingWithState:objects:count:](v74, "countByEnumeratingWithState:objects:count:", &v279, v285, 16);
      v76 = v253;
      if (v75)
      {
        v77 = v75;
        v78 = *(_QWORD *)v280;
        do
        {
          for (i = 0; i != v77; ++i)
          {
            if (*(_QWORD *)v280 != v78)
              objc_enumerationMutation(v74);
            objc_msgSend(*(id *)(*((_QWORD *)&v279 + 1) + 8 * i), "setHidden:", 1);
          }
          v77 = -[NSArray countByEnumeratingWithState:objects:count:](v74, "countByEnumeratingWithState:objects:count:", &v279, v285, 16);
        }
        while (v77);
      }

      -[UIView vui_sizeThatFits:](self->_descriptionTextView, "vui_sizeThatFits:", v32, 1.79769313e308);
      v81 = v80;
      v83 = v82;
      -[UIView topMarginWithBaselineMargin:](self->_descriptionTextView, "topMarginWithBaselineMargin:", v21);
      v85 = v84;
      v289.origin.x = v258;
      v289.size.width = v260;
      v289.origin.y = v262;
      v289.size.height = v255;
      CGRectGetMaxY(v289);
      VUIRoundValue();
      v87 = v86;
      v88 = self->_descriptionTextView;

      v89 = v257;
      v290.origin.x = v257;
      v290.origin.y = v87;
      v290.size.width = v81;
      v290.size.height = v83;
      v90 = v85 + CGRectGetHeight(v290);
      v32 = v265;
      p_super = v88;
      *(CGFloat *)&v231[16] = v81;
      *(CGFloat *)&v231[24] = v83;
      v255 = v83;
      v49 = v49 + v90;
      v258 = v257;
      v260 = v81;
      v262 = v87;
      v91 = v87;
      v51 = a4;
      v43 = v244;
      v92 = v254;
    }
    else if (self->_textLabels)
    {
      v220 = width;
      v93 = v225;
      v94 = v237;
      -[UIView setHidden:](self->_descriptionTextView, "setHidden:", 1);
      v277 = 0u;
      v278 = 0u;
      v275 = 0u;
      v276 = 0u;
      obja = self->_textLabels;
      v95 = -[NSArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v275, v284, 16);
      if (v95)
      {
        v96 = v95;
        v97 = 0;
        v98 = *(_QWORD *)v276;
        v99 = 0.0;
        do
        {
          for (j = 0; j != v96; ++j)
          {
            if (*(_QWORD *)v276 != v98)
              objc_enumerationMutation(obja);
            v101 = *(void **)(*((_QWORD *)&v275 + 1) + 8 * j);
            objc_msgSend(v101, "setHidden:", 0);
            objc_msgSend(v101, "textLayout");
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v102, "margin");
            v104 = v103;
            -[NSArray firstObject](self->_textLabels, "firstObject");
            v105 = (void *)objc_claimAutoreleasedReturnValue();

            if (v105 == v101)
              v106 = v21;
            else
              v106 = v104;
            objc_msgSend(v101, "topMarginToLabel:withBaselineMargin:", v97, v106);
            v108 = v107;
            v32 = v265;
            objc_msgSend(v101, "sizeThatFits:", v265, 0.0);
            v110 = v109;
            -[NSArray firstObject](self->_textLabels, "firstObject");
            v111 = (void *)objc_claimAutoreleasedReturnValue();

            if (v111 == v101)
            {
              v291.origin.x = v258;
              v291.size.width = v260;
              v291.origin.y = v262;
              v291.size.height = v255;
              CGRectGetMaxY(v291);
              VUIRoundValue();
              v94 = v112;
              v49 = v49 + v108;
              v93 = v257;
            }
            else
            {
              v99 = v99 + v108;
            }
            v113 = v101;

            v99 = v110 + v99;
            v97 = (UIView *)v113;

            p_super = v97;
          }
          v96 = -[NSArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v275, v284, 16);
          p_super = v97;
        }
        while (v96);
      }
      else
      {
        v97 = 0;
        v99 = 0.0;
      }

      v49 = v99 + v49;
      v255 = v99;
      v260 = v32;
      v262 = v94;
      v237 = v94;
      v225 = v93;
      v258 = v93;
      v76 = v253;
      v92 = v254;
      *(double *)&v231[16] = v252;
      *(double *)&v231[24] = v254;
      v91 = v253;
      v43 = v244;
      v89 = v244;
      width = v220;
      v51 = a4;
    }
    else
    {
      v76 = v253;
      v92 = v254;
      *(double *)&v231[16] = v252;
      *(double *)&v231[24] = v254;
      v91 = v253;
      v43 = v244;
      v89 = v244;
    }
    objb = v49;
    *(double *)v231 = v89;
    *(CGFloat *)&v231[8] = v91;
    if (self->_subscribeButton)
    {
      -[VUIChannelBannerView _subscribeButtonHeight](self, "_subscribeButtonHeight");
      v143 = v142;
      objc_opt_class();
      v144 = v32;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[UIView width](self->_subscribeButton, "width");
        if (v145 == 0.0)
          v144 = v32;
        else
          v144 = v145;
      }
      v146 = v257 + (v32 - v144) * 0.5;
      -[UIView bottomMarginWithBaselineMargin:](p_super, "bottomMarginWithBaselineMargin:", 30.0);
      v148 = objb + v147;
      v301.origin.x = v258;
      v301.size.width = v260;
      v301.origin.y = v262;
      v301.size.height = v255;
      CGRectGetMaxY(v301);
      v32 = v265;
      VUIRoundValue();
      v150 = v149;
      v302.origin.x = v146;
      v302.origin.y = v150;
      v302.size.width = v144;
      v302.size.height = v143;
      objb = v148 + CGRectGetHeight(v302);
      v256 = v144;
      v258 = v146;
      v260 = v144;
      v236 = v146;
      v151 = v143;
      v262 = v150;
      v234 = v150;
      v152 = v252;
      v76 = v253;
      v92 = v254;
    }
    else
    {
      v143 = v255;
      v151 = v92;
      v152 = v252;
      v256 = v252;
      v234 = v76;
      v236 = v43;
    }
    v235 = v151;
    disclaimerTextLabel = self->_disclaimerTextLabel;
    v243 = v92;
    v245 = v76;
    v154 = v43;
    if (disclaimerTextLabel)
    {
      -[VUILabel sizeThatFits:](disclaimerTextLabel, "sizeThatFits:", v32, 0.0);
      v156 = v155;
      -[VUILabel topMarginWithBaselineMargin:](self->_disclaimerTextLabel, "topMarginWithBaselineMargin:", v223);
      v158 = v157;
      v303.origin.x = v258;
      v303.size.width = v260;
      v303.origin.y = v262;
      v303.size.height = v143;
      CGRectGetMaxY(v303);
      VUIRoundValue();
      v160 = v159;
      -[VUILabel bottomMarginWithBaselineMargin:](self->_disclaimerTextLabel, "bottomMarginWithBaselineMargin:", 24.0);
      v162 = v161;
      v154 = v257;
      v304.origin.x = v257;
      v245 = v160;
      v304.origin.y = v160;
      v304.size.width = v265;
      v243 = v156;
      v304.size.height = v156;
      v163 = v158 + CGRectGetHeight(v304);
      v32 = v265;
      v264 = v162 + v163;
      v152 = v265;
    }
    v238 = v154;
    v239 = v152;
    v38 = objb + v264;

    v41 = v227;
    goto LABEL_151;
  }
  if (v8 == 4)
    v53 = 3;
  else
    v53 = 5;
  if (v8 == 4)
    v54 = 3.0;
  else
    v54 = 4.0;
  objc_msgSend(MEMORY[0x1E0DC3F98], "vui_collectionInteritemSpace:gridType:windowWidth:", v53, 0, width);
  obj = floor((v265 - (v54 + -1.0) * v55) / v54);
  v56 = self->_appleTVChannelLogoView;
  v232 = v265 - obj - v55;
  if (v56)
  {
    -[UIView vui_sizeThatFits:](v56, "vui_sizeThatFits:");
    v58 = v57;
    v60 = v59;
    v61 = v31 + v59;
    v62 = v31;
    v63 = v257;
  }
  else
  {
    v61 = 0.0;
    v58 = v34;
    v62 = v33;
    v60 = v254;
    v63 = v244;
  }
  x = v63;
  y = v62;
  v69 = v58;
  v70 = v60;
  CGRectGetMaxY(*(CGRect *)&v63);
  VUIRoundValue();
  v263 = v71;
  if (self->_descriptionTextView)
    v72 = 0;
  else
    v72 = self->_textLabels == 0;
  v222 = v23 + v61;
  -[VUISeparatorView setHidden:](self->_separatorView, "setHidden:", v72);
  v114 = self->_separatorView;
  v115 = 0.0;
  v228 = v58;
  rect = v60;
  v233 = v23;
  if (v114 && (-[VUISeparatorView isHidden](v114, "isHidden") & 1) == 0)
  {
    v292.size.height = 0.0;
    v292.origin.x = v257;
    v292.origin.y = v263;
    v292.size.width = v265;
    MaxY = CGRectGetMaxY(v292);
    v116 = self->_separatorView;
    v115 = v233;
    v119 = v255;
    v222 = v255 + v222;
    v261 = v255;
    v263 = MaxY;
    v120 = v265;
    v118 = MaxY;
    v121 = v257;
    v117 = v254;
  }
  else
  {
    v116 = 0;
    v261 = 0.0;
    v118 = v253;
    v117 = v254;
    v119 = v254;
    v120 = v34;
    v121 = v244;
  }
  v240 = v120;
  v241 = v119;
  v123 = self->_disclaimerTextLabel;
  v248 = v121;
  v221 = width;
  if (v123)
  {
    v124 = v118;
    -[VUILabel sizeThatFits:](v123, "sizeThatFits:", obj, 0.0);
    v126 = v125;
    v127 = width - obj - v230;
    v128 = 50.0;
    if (!v10)
      v128 = v233;
    -[VUILabel bottomMarginWithBaselineMargin:](self->_disclaimerTextLabel, "bottomMarginWithBaselineMargin:", v128);
    v293.origin.x = v257;
    v293.size.height = v261;
    v293.origin.y = v263;
    v293.size.width = v265;
    CGRectGetMinY(v293);
    v294.origin.x = v127;
    v294.origin.y = v253;
    v294.size.width = obj;
    v294.size.height = v126;
    CGRectGetHeight(v294);
    VUIRoundValue();
    v130 = v129;
    v131 = self->_disclaimerTextLabel;

    v118 = v124;
    v132 = y;
    v60 = rect;
    v121 = v248;
    v117 = v254;
    v243 = v126;
    v261 = v126;
    v263 = v130;
    v133 = v223;
    v134 = obj;
    v238 = v127;
    v239 = obj;
    v245 = v130;
    v259 = v127;
  }
  else
  {
    v133 = v115;
    v259 = v257;
    v243 = v117;
    v245 = v253;
    v238 = v244;
    v239 = v34;
    v134 = v265;
    v132 = y;
    v131 = (VUILabel *)v116;
  }
  if (self->_subscribeButton)
  {
    v247 = v118;
    -[VUIChannelBannerView _subscribeButtonHeight](self, "_subscribeButtonHeight", v117, v132);
    v136 = v135;
    width = v221;
    v295.origin.y = v263;
    v295.size.width = v134;
    v295.origin.x = v259;
    v295.size.height = v261;
    CGRectGetMinY(v295);
    -[VUILabel topMarginWithBaselineMargin:](v131, "topMarginWithBaselineMargin:", v133);
    v296.origin.x = v221 - obj - v230;
    v296.origin.y = v253;
    v296.size.width = obj;
    v296.size.height = v136;
    CGRectGetHeight(v296);
    VUIRoundValue();
    v138 = v137;
    v235 = v136;
    v236 = v221 - obj - v230;
    if (self->_subscribeButton
      && (v297.origin.x = v221 - obj - v230,
          v297.origin.y = v138,
          v297.size.width = obj,
          v297.size.height = v136,
          CGRectGetMinY(v297) < v31))
    {
      v298.origin.x = v221 - obj - v230;
      v298.origin.y = v138;
      v298.size.width = obj;
      v298.size.height = v136;
      v139 = v31 - CGRectGetMinY(v298);
      v299.origin.x = v221 - obj - v230;
      v234 = v138 + v139;
      v299.origin.y = v138 + v139;
      v299.size.width = obj;
      v299.size.height = v136;
      v140 = CGRectGetMaxY(v299);
      if (self->_disclaimerTextLabel)
      {
        v300.origin.x = v238;
        v300.origin.y = v245 + v139;
        v300.size.width = v239;
        v300.size.height = v243;
        v140 = CGRectGetMaxY(v300);
        v259 = v238;
        v261 = v243;
        v134 = v239;
        v263 = v245 + v139;
        v141 = v245 + v139;
        v58 = v228;
      }
      else
      {
        v58 = v228;
        v141 = v245;
      }
      v245 = v141;
      v222 = v233 + v140;
      v164 = self->_separatorView;
      if (v164 && (-[VUISeparatorView isHidden](v164, "isHidden") & 1) == 0)
      {
        v318.origin.x = v259;
        v318.size.height = v261;
        v318.origin.y = v263;
        v318.size.width = v134;
        CGRectGetMaxY(v318);
        VUIRoundValue();
        v118 = v219;
        v222 = v255 + v222;
        v256 = obj;
        v117 = v254;
        v121 = v248;
        v132 = y;
        goto LABEL_110;
      }
      v256 = obj;
    }
    else
    {
      v234 = v138;
      v256 = obj;
      v58 = v228;
    }
    v117 = v254;
    v121 = v248;
    v132 = y;
    v118 = v247;
LABEL_110:
    v60 = rect;
    goto LABEL_111;
  }
  v235 = v117;
  v236 = v244;
  v256 = v252;
  v234 = v253;
  width = v221;
LABEL_111:
  if (self->_appleTVChannelLogoView)
  {
    v165 = self->_separatorView;
    if (v165)
      v166 = v241;
    else
      v166 = v60;
    if (v165)
      v134 = v240;
    else
      v134 = v58;
    if (v165)
      v132 = v118;
    v261 = v166;
    v263 = v132;
    v167 = x;
    if (v165)
      v167 = v121;
    v259 = v167;
  }
  v246 = v118;
  v168 = self->_descriptionTextView;
  if (v168)
  {
    -[UIView setHidden:](v168, "setHidden:", 0);
    -[UIView vui_sizeThatFits:](self->_descriptionTextView, "vui_sizeThatFits:", v232, 1.79769313e308);
    v170 = v169;
    v172 = v171;
    v173 = 10.0;
    if (!+[VUIUtilities isSUIEnabled](VUIUtilities, "isSUIEnabled"))
    {
      -[UIView topMarginWithBaselineMargin:](self->_descriptionTextView, "topMarginWithBaselineMargin:", v21);
      v173 = v174;
    }
    v305.origin.x = v259;
    v305.size.height = v261;
    v305.origin.y = v263;
    v175 = v134;
    v305.size.width = v134;
    CGRectGetMaxY(v305);
    VUIRoundValue();
    v306.origin.y = v176;
    v306.origin.x = v257;
    *(CGFloat *)&v231[8] = v306.origin.y;
    v306.size.width = v170;
    *(CGFloat *)&v231[24] = v172;
    v306.size.height = v172;
    v177 = v173 + CGRectGetHeight(v306);
    -[UIView bottomMarginWithBaselineMargin:](self->_descriptionTextView, "bottomMarginWithBaselineMargin:", v264);
    v222 = v222 + v177 + v178;
  }
  else
  {
    v175 = v134;
    *(double *)&v231[24] = v117;
    v170 = v252;
    *(CGFloat *)&v231[8] = v253;
    v257 = v244;
  }
  *(CGFloat *)&v231[16] = v170;
  textLabels = self->_textLabels;
  if (textLabels)
  {
    v266 = v131;
    v180 = width;
    v181 = v225;
    v182 = v237;
    v273 = 0u;
    v274 = 0u;
    v271 = 0u;
    v272 = 0u;
    v183 = textLabels;
    v184 = -[NSArray countByEnumeratingWithState:objects:count:](v183, "countByEnumeratingWithState:objects:count:", &v271, v283, 16);
    if (v184)
    {
      v185 = v184;
      v186 = 0;
      v187 = *(_QWORD *)v272;
      v188 = 0.0;
      v189 = v180 - obj - v230;
      do
      {
        v190 = 0;
        v191 = v186;
        do
        {
          if (*(_QWORD *)v272 != v187)
            objc_enumerationMutation(v183);
          v192 = *(void **)(*((_QWORD *)&v271 + 1) + 8 * v190);
          objc_msgSend(v192, "setHidden:", 0);
          objc_msgSend(v192, "textLayout");
          v193 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v193, "margin");
          v195 = v194;
          -[NSArray firstObject](self->_textLabels, "firstObject");
          v196 = (void *)objc_claimAutoreleasedReturnValue();

          if (v196 == v192)
            v197 = v21;
          else
            v197 = v195;
          objc_msgSend(v192, "topMarginToLabel:withBaselineMargin:", v191, v197);
          v199 = v198;
          objc_msgSend(v192, "sizeThatFits:", obj, 0.0);
          v201 = v200;
          -[NSArray firstObject](self->_textLabels, "firstObject");
          v202 = (void *)objc_claimAutoreleasedReturnValue();

          if (v202 == v192)
          {
            v307.origin.x = v259;
            v307.size.height = v261;
            v307.origin.y = v263;
            v307.size.width = v175;
            v182 = v199 + CGRectGetMaxY(v307);
            v181 = v189;
          }
          else
          {
            v188 = v188 + v199;
          }
          v186 = v192;

          v188 = v201 + v188;
          -[NSArray lastObject](self->_textLabels, "lastObject");
          v203 = (id)objc_claimAutoreleasedReturnValue();

          if (v203 == v186)
          {
            objc_msgSend(v186, "bottomMarginWithBaselineMargin:", v264);
            v188 = v188 + v204;
          }

          ++v190;
          v191 = v186;
        }
        while (v185 != v190);
        v185 = -[NSArray countByEnumeratingWithState:objects:count:](v183, "countByEnumeratingWithState:objects:count:", &v271, v283, 16);
      }
      while (v185);
    }
    else
    {
      v186 = 0;
      v188 = 0.0;
    }
    v225 = v181;

    v237 = v182;
    v205 = v188 + v182;
    v38 = v222;
    if (v222 < v205)
      v38 = v205;

    width = v221;
    v131 = v266;
  }
  else
  {
    v38 = v222;
  }

  *(double *)v231 = v257;
  v32 = obj;
  v51 = a4;
  v41 = v228;
  v43 = v244;
LABEL_151:
  -[VUIChannelBannerView height](self, "height");
  if (v206 <= 0.0)
  {
    v207 = v38;
  }
  else
  {
    v207 = v206;
    if (!v51)
    {
      v208 = v206 - v38;
      v308.origin.x = x;
      v308.origin.y = y;
      v308.size.height = rect;
      v308.size.width = v41;
      v309 = CGRectOffset(v308, 0.0, v208);
      x = v309.origin.x;
      y = v309.origin.y;
      rect = v309.size.height;
      v41 = v309.size.width;
      v309.size.height = v235;
      v309.origin.x = v236;
      v309.origin.y = v234;
      v309.size.width = v256;
      v310 = CGRectOffset(v309, 0.0, v208);
      v235 = v310.size.height;
      v236 = v310.origin.x;
      v234 = v310.origin.y;
      v256 = v310.size.width;
      v310.origin.x = v238;
      v310.size.width = v239;
      v310.origin.y = v245;
      v310.size.height = v243;
      v311 = CGRectOffset(v310, 0.0, v208);
      v238 = v311.origin.x;
      v239 = v311.size.width;
      v245 = v311.origin.y;
      v243 = v311.size.height;
      v311.origin.y = v246;
      v311.origin.x = v248;
      v311.size.width = v240;
      v311.size.height = v241;
      v312 = CGRectOffset(v311, 0.0, v208);
      v246 = v312.origin.y;
      v248 = v312.origin.x;
      v240 = v312.size.width;
      v241 = v312.size.height;
      v237 = v237 + v208;
      *(CGRect *)v231 = CGRectOffset(*(CGRect *)v231, 0.0, v208);
    }
  }
  bgImageView = self->_bgImageView;
  if (v207 >= height)
    v210 = v207;
  else
    v210 = height;
  if (bgImageView)
    v211 = 0.0;
  else
    v211 = v43;
  if (bgImageView)
    v212 = 0.0;
  else
    v212 = v253;
  v213 = width;
  if (bgImageView)
  {
    v214 = v210;
  }
  else
  {
    width = v252;
    v214 = v254;
  }
  if (!v51)
  {
    if (v207 >= height)
    {
      v229 = v41;
      v215 = v237;
      v216 = rect;
    }
    else
    {
      objc = v214;
      v313.origin.x = x;
      v313.origin.y = y;
      v313.size.height = rect;
      v313.size.width = v41;
      v314 = CGRectOffset(v313, 0.0, height - v207);
      x = v314.origin.x;
      y = v314.origin.y;
      recta = v314.size.height;
      v229 = v314.size.width;
      v314.size.height = v235;
      v314.origin.x = v236;
      v314.origin.y = v234;
      v314.size.width = v256;
      v315 = CGRectOffset(v314, 0.0, height - v207);
      v235 = v315.size.height;
      v236 = v315.origin.x;
      v234 = v315.origin.y;
      v256 = v315.size.width;
      v315.origin.x = v238;
      v315.size.width = v239;
      v315.origin.y = v245;
      v315.size.height = v243;
      v316 = CGRectOffset(v315, 0.0, height - v207);
      v238 = v316.origin.x;
      v239 = v316.size.width;
      v245 = v316.origin.y;
      v243 = v316.size.height;
      v316.origin.y = v246;
      v316.origin.x = v248;
      v316.size.width = v240;
      v316.size.height = v241;
      v317 = CGRectOffset(v316, 0.0, height - v207);
      v246 = v317.origin.y;
      v248 = v317.origin.x;
      v240 = v317.size.width;
      v241 = v317.size.height;
      v215 = v237 + height - v207;
      v216 = recta;
      *(CGRect *)v231 = CGRectOffset(*(CGRect *)v231, 0.0, height - v207);
      v214 = objc;
      bgImageView = self->_bgImageView;
    }
    -[VUIProductUberBackgroundView setFrame:](bgImageView, "setFrame:", v211, v212, width, v214);
    -[UIView setFrame:](self->_appleTVChannelLogoView, "setFrame:", x, y, v229, v216);
    -[UIView setFrame:](self->_subscribeButton, "setFrame:", v236, v234, v256, v235);
    -[VUILabel setFrame:](self->_disclaimerTextLabel, "setFrame:", v238, v245, v239, v243);
    -[VUISeparatorView setFrame:](self->_separatorView, "setFrame:", v248, v246, v240, v241);
    -[VUIChannelBannerView _layoutLabels:withOrigin:maxWidth:](self, "_layoutLabels:withOrigin:maxWidth:", self->_textLabels, v225, v215, v32);
    -[UIView setFrame:](self->_descriptionTextView, "setFrame:", *(double *)v231, *(double *)&v231[8], *(double *)&v231[16], *(double *)&v231[24]);
  }
  v217 = v213;
  v218 = v207;
  result.height = v218;
  result.width = v217;
  return result;
}

- (BOOL)_isSubscribed
{
  NSArray *textLabels;

  return !self->_descriptionTextView
      && ((textLabels = self->_textLabels) == 0 || !-[NSArray count](textLabels, "count"))
      && !self->_subscribeButton
      && self->_disclaimerTextLabel == 0;
}

- (double)_subscribeButtonHeight
{
  double result;
  UIView *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;

  if (+[VUIUtilities isSUIEnabled](VUIUtilities, "isSUIEnabled"))
  {
    -[VUIChannelBannerView subscribeButtonHeight](self, "subscribeButtonHeight");
    return result;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = 0;
    v6 = 0;
    goto LABEL_7;
  }
  v4 = self->_subscribeButton;
  -[UIView textContentView](v4, "textContentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v5, "textLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "maximumContentSizeCategory");

LABEL_8:
  v9 = (void *)MEMORY[0x1E0DC69B0];
  -[UIView height](v4, "height");
  v11 = v10;
  -[VUIChannelBannerView vuiTraitCollection](self, "vuiTraitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scaleContentSizeValue:forTraitCollection:maximumContentSizeCategory:", v12, v8, v11);
  v14 = v13;

  return v14;
}

- (void)_layoutLabels:(id)a3 withOrigin:(CGPoint)a4 maxWidth:(double)a5
{
  CGFloat y;
  double x;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  y = a4.y;
  x = a4.x;
  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v27;
    v13 = y;
    do
    {
      v14 = 0;
      v15 = v11;
      do
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(v8);
        v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v14);
        objc_msgSend(v16, "textLayout");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "margin");
        v19 = v18;
        objc_msgSend(v16, "vui_sizeThatFits:", a5, 0.0);
        v21 = v20;
        objc_msgSend(v8, "firstObject");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22 == v16)
        {
          v24 = y;
        }
        else
        {
          if (v15)
            objc_msgSend(v16, "topMarginToLabel:withBaselineMargin:", v15, v19);
          else
            objc_msgSend(v16, "topMarginWithBaselineMargin:", v19);
          v13 = v13 + v23;
          VUIRoundValue();
          v24 = v25;
        }
        objc_msgSend(v16, "setFrame:", x, v24, a5, v21);
        v11 = v16;

        v13 = v21 + v13;
        ++v14;
        v15 = v11;
      }
      while (v10 != v14);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v10);

  }
}

- (UIView)appleTVChannelLogoView
{
  return self->_appleTVChannelLogoView;
}

- (UIView)subscribeButton
{
  return self->_subscribeButton;
}

- (VUILabel)disclaimerTextLabel
{
  return self->_disclaimerTextLabel;
}

- (UIView)descriptionTextView
{
  return self->_descriptionTextView;
}

- (NSArray)textLabels
{
  return self->_textLabels;
}

- (VUIProductUberBackgroundView)bgImageView
{
  return self->_bgImageView;
}

- (UIView)bgColorView
{
  return self->_bgColorView;
}

- (double)logoHeight
{
  return self->_logoHeight;
}

- (void)setLogoHeight:(double)a3
{
  self->_logoHeight = a3;
}

- (BOOL)isDescriptionPreferredOnPhoneSizeClass
{
  return self->_isDescriptionPreferredOnPhoneSizeClass;
}

- (void)setIsDescriptionPreferredOnPhoneSizeClass:(BOOL)a3
{
  self->_isDescriptionPreferredOnPhoneSizeClass = a3;
}

- (double)height
{
  return self->_height;
}

- (double)subscribeButtonHeight
{
  return self->_subscribeButtonHeight;
}

- (void)setSubscribeButtonHeight:(double)a3
{
  self->_subscribeButtonHeight = a3;
}

- (VUISeparatorView)separatorView
{
  return self->_separatorView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_bgColorView, 0);
  objc_storeStrong((id *)&self->_bgImageView, 0);
  objc_storeStrong((id *)&self->_textLabels, 0);
  objc_storeStrong((id *)&self->_descriptionTextView, 0);
  objc_storeStrong((id *)&self->_disclaimerTextLabel, 0);
  objc_storeStrong((id *)&self->_subscribeButton, 0);
  objc_storeStrong((id *)&self->_appleTVChannelLogoView, 0);
}

@end
