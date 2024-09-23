@implementation UIButtonConfigurationVisualProvider

- (BOOL)adjustsFontForContentSizeCategory
{
  return 0;
}

- (void)tintColorDidChange
{
  -[UIButton setNeedsUpdateConfiguration](self->_button, "setNeedsUpdateConfiguration");
}

- (void)intrinsicContentSizeInvalidatedForChildView:(id)a3
{
  if (self->_imageView == a3)
  {
    if (objc_msgSend(a3, "_hasBaseline"))
      -[UIButtonConfigurationVisualProvider updateBaselineInformationDependentOnBounds](self, "updateBaselineInformationDependentOnBounds");
  }
}

uint64_t __78__UIButtonConfigurationVisualProvider__updateBackgroundViewWithConfiguration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 264), "setConfiguration:", *(_QWORD *)(a1 + 40));
}

- (void)alignmentRectInsetsHaveChangedForChildImageView:(id)a3
{
  if (self->_imageView == a3)
  {
    if (objc_msgSend(a3, "_hasBaseline"))
      -[UIButtonConfigurationVisualProvider updateBaselineInformationDependentOnBounds](self, "updateBaselineInformationDependentOnBounds");
  }
}

- (id)viewForLastBaselineLayout
{
  return self->_button;
}

- (UIEdgeInsets)alignmentRectInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

+ (BOOL)requiresNewVisualProviderForChanges
{
  return 0;
}

- (CGRect)contentRectForBounds:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  if (!_UITraitUsageTrackingEnabled() || (dyld_program_sdk_at_least() & 1) == 0)
    -[UIButton setNeedsUpdateConfiguration](self->_button, "setNeedsUpdateConfiguration");
}

- (void)setImage:(id)a3 forState:(unint64_t)a4
{
  -[UIButton setNeedsUpdateConfiguration](self->_button, "setNeedsUpdateConfiguration", a3, a4);
}

- (void)setAttributedTitle:(id)a3 forState:(unint64_t)a4
{
  -[UIButton setNeedsUpdateConfiguration](self->_button, "setNeedsUpdateConfiguration", a3, a4);
}

- (void)setSelected:(BOOL)a3
{
  -[UIButton setNeedsUpdateConfiguration](self->_button, "setNeedsUpdateConfiguration", a3);
}

- (void)setButton:(id)a3
{
  self->_button = (UIButton *)a3;
}

- (BOOL)vendsBaselineInformationToAutoLayout
{
  return self->_vendsBaselineInformationToAutoLayout;
}

- (void)setEnabled:(BOOL)a3
{
  -[UIButton setNeedsUpdateConfiguration](self->_button, "setNeedsUpdateConfiguration", a3);
}

- (CGRect)titleRectForContentRect:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)_layoutContent
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  int v8;
  _UISystemBackgroundView *backgroundView;
  double v10;
  double v11;
  double v12;
  double v13;

  -[UIButtonConfigurationVisualProvider _layoutDataUpdatingIfNecessary](self, "_layoutDataUpdatingIfNecessary");
  v4 = 0.0;
  v3 = 0.0;
  v6 = 0.0;
  v5 = 0.0;
  -[UIButton _currentConfiguration](self->_button, "_currentConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButtonConfigurationVisualProvider _updateBackgroundViewWithConfiguration:](self, "_updateBackgroundViewWithConfiguration:", v7);

  v8 = dyld_program_sdk_at_least();
  backgroundView = self->_backgroundView;
  if (v8)
  {
    -[_UISystemBackgroundView frameInContainerView:](backgroundView, "frameInContainerView:", self->_button);
    v3 = v10;
    v4 = v11;
    v5 = v12;
    v6 = v13;
    backgroundView = self->_backgroundView;
  }
  -[_UISystemBackgroundView setFrame:](backgroundView, "setFrame:", v3, v4, v5, v6);
  if ((*(_BYTE *)&self->_layoutData.flags & 0x20) != 0)
    -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", (unsigned __int128)0, (unsigned __int128)0);
}

- (void)applyConfiguration
{
  void *v3;
  void *v4;
  void *v5;

  -[UIButton _currentConfiguration](self->_button, "_currentConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = v3;
    -[UIButtonConfigurationVisualProvider _updateImageViewWithConfiguration:](self, "_updateImageViewWithConfiguration:", v3);
    -[UIButtonConfigurationVisualProvider _updateIndicatorWithConfiguration:](self, "_updateIndicatorWithConfiguration:", v5);
    -[UIButtonConfigurationVisualProvider _updateProgressIndicatorWithConfiguration:](self, "_updateProgressIndicatorWithConfiguration:", v5);
    -[UIButtonConfigurationVisualProvider _updateTitleLabelWithConfiguration:](self, "_updateTitleLabelWithConfiguration:", v5);
    -[UIButtonConfigurationVisualProvider _updateSubtitleLabelWithConfiguration:](self, "_updateSubtitleLabelWithConfiguration:", v5);
    -[UIButtonConfigurationVisualProvider _updateBackgroundViewWithConfiguration:](self, "_updateBackgroundViewWithConfiguration:", v5);
    -[UIButtonConfigurationVisualProvider invalidateLayoutData](self, "invalidateLayoutData");
    -[UIView invalidateIntrinsicContentSize](self->_button, "invalidateIntrinsicContentSize");
    -[UIButton setNeedsLayout](self->_button, "setNeedsLayout");
    -[UIView hoverStyle](self->_button, "hoverStyle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_invalidateAutomaticHoverEffect");

    v3 = v5;
  }

}

- (void)_updateBackgroundViewWithConfiguration:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  _UISystemBackgroundView *v17;
  _UISystemBackgroundView *backgroundView;
  id v19;
  _QWORD v20[5];
  id v21;

  v19 = a3;
  v4 = objc_msgSend(v19, "cornerStyle");
  objc_msgSend(v19, "background");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    if (v4 != -1)
    {
      v7 = objc_msgSend(v5, "copy");

      v6 = (void *)v7;
    }
    objc_msgSend(v6, "cornerRadius");
    v9 = v8;
    switch(objc_msgSend(v19, "cornerStyle"))
    {
      case 0:
        +[UIFontMetrics defaultMetrics](UIFontMetrics, "defaultMetrics");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView traitCollection](self->_button, "traitCollection");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "scaledValueForValue:compatibleWithTraitCollection:", v11, v9);
        objc_msgSend(v6, "setCornerRadius:");

        break;
      case 1:
        -[UIView bounds](self->_button, "bounds");
        v13 = 0.25;
        goto LABEL_8;
      case 2:
        -[UIView bounds](self->_button, "bounds");
        v13 = 0.35;
LABEL_8:
        v14 = v12 * v13 * 0.5;
        goto LABEL_11;
      case 3:
        -[UIView bounds](self->_button, "bounds");
        v14 = v15 * 0.5 * 0.5;
        goto LABEL_11;
      case 4:
        v14 = 1.79769313e308;
LABEL_11:
        objc_msgSend(v6, "setCornerRadius:", v14);
        break;
      default:
        break;
    }
    if (self->_backgroundView)
    {
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __78__UIButtonConfigurationVisualProvider__updateBackgroundViewWithConfiguration___block_invoke;
      v20[3] = &unk_1E16B1B50;
      v20[4] = self;
      v21 = v6;
      v16 = v6;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v20);

    }
    else
    {
      v17 = -[_UISystemBackgroundView initWithConfiguration:]([_UISystemBackgroundView alloc], "initWithConfiguration:", v6);
      backgroundView = self->_backgroundView;
      self->_backgroundView = v17;

      -[UIView setUserInteractionEnabled:](self->_backgroundView, "setUserInteractionEnabled:", 0);
      -[UIView insertSubview:atIndex:](self->_button, "insertSubview:atIndex:", self->_backgroundView, 0);
    }

  }
}

- (void)invalidateLayoutData
{
  *(_BYTE *)&self->_layoutData.flags &= ~1u;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[UIButtonConfigurationVisualProvider intrinsicSizeWithinSize:](self, "intrinsicSizeWithinSize:", self->_widthForMultilineTextLayout, 0.0);
  result.height = v3;
  result.width = v2;
  return result;
}

- ($E2BAE4BD71C50F14921AF46CCB962FE7)_layoutDataUpdatingIfNecessary
{
  CGFloat *p_height;
  $E2BAE4BD71C50F14921AF46CCB962FE7 *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  $F24F406B2B787EFB06265DBA3D28CBD5 v12;
  CGPoint v13;
  CGPoint v14;
  CGPoint v15;
  CGPoint v16;
  CGSize v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;

  p_height = &self->var1.height;
  if ((LOBYTE(self[1].var1.width) & 1) == 0)
  {
    v5 = self;
    -[$E2BAE4BD71C50F14921AF46CCB962FE7 _layoutBounds](self, "_layoutBounds");
    self = ($E2BAE4BD71C50F14921AF46CCB962FE7 *)-[$E2BAE4BD71C50F14921AF46CCB962FE7 _layoutDataInBounds:](v5, "_layoutDataInBounds:");
    v6 = v29;
    *((_OWORD *)p_height + 10) = v28;
    *((_OWORD *)p_height + 11) = v6;
    *((_QWORD *)p_height + 24) = v30;
    v7 = v25;
    *((_OWORD *)p_height + 6) = v24;
    *((_OWORD *)p_height + 7) = v7;
    v8 = v27;
    *((_OWORD *)p_height + 8) = v26;
    *((_OWORD *)p_height + 9) = v8;
    v9 = v21;
    *((_OWORD *)p_height + 2) = v20;
    *((_OWORD *)p_height + 3) = v9;
    v10 = v23;
    *((_OWORD *)p_height + 4) = v22;
    *((_OWORD *)p_height + 5) = v10;
    v11 = v19;
    *(_OWORD *)p_height = v18;
    *((_OWORD *)p_height + 1) = v11;
  }
  v12 = ($F24F406B2B787EFB06265DBA3D28CBD5)*((_OWORD *)p_height + 11);
  retstr->var5.size = (CGSize)*((_OWORD *)p_height + 10);
  retstr->var6 = v12;
  *(CGFloat *)&retstr->var7 = p_height[24];
  v13 = (CGPoint)*((_OWORD *)p_height + 7);
  retstr->var3.size = (CGSize)*((_OWORD *)p_height + 6);
  retstr->var4.origin = v13;
  v14 = (CGPoint)*((_OWORD *)p_height + 9);
  retstr->var4.size = (CGSize)*((_OWORD *)p_height + 8);
  retstr->var5.origin = v14;
  v15 = (CGPoint)*((_OWORD *)p_height + 3);
  retstr->var1 = (CGSize)*((_OWORD *)p_height + 2);
  retstr->var2.origin = v15;
  v16 = (CGPoint)*((_OWORD *)p_height + 5);
  retstr->var2.size = (CGSize)*((_OWORD *)p_height + 4);
  retstr->var3.origin = v16;
  v17 = (CGSize)*((_OWORD *)p_height + 1);
  retstr->var0.origin = *(CGPoint *)p_height;
  retstr->var0.size = v17;
  return self;
}

- (void)layoutSubviews
{
  _UISystemBackgroundView *backgroundView;
  double currentlyAppliedCornerRadius;
  _UISystemBackgroundView *v5;
  uint64_t v6;
  id v7;

  -[UIButtonConfigurationVisualProvider updateConfigurationIfNecessary](self, "updateConfigurationIfNecessary");
  if (!self->_avoidDefaultTitleAndImageLayout)
    -[UIButtonConfigurationVisualProvider _layoutContent](self, "_layoutContent");
  backgroundView = self->_backgroundView;
  if (backgroundView)
    currentlyAppliedCornerRadius = backgroundView->_currentlyAppliedCornerRadius;
  else
    currentlyAppliedCornerRadius = 0.0;
  -[UIButtonConfigurationVisualProvider updatedAppliedCornerRadius:](self, "updatedAppliedCornerRadius:", currentlyAppliedCornerRadius);
  v5 = self->_backgroundView;
  if (v5)
    v6 = *(_BYTE *)&v5->_systemBackgroundViewFlags & 1;
  else
    v6 = 0;
  -[UIButtonConfigurationVisualProvider updatedAppliedCornersAreContinuous:](self, "updatedAppliedCornersAreContinuous:", v6);
  -[UIView hoverStyle](self->_button, "hoverStyle");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_invalidateAutomaticHoverShape");

}

- (CGSize)intrinsicSizeWithinSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[UIButtonConfigurationVisualProvider updateConfigurationIfNecessary](self, "updateConfigurationIfNecessary");
  -[UIButtonConfigurationVisualProvider _layoutDataInBounds:](self, "_layoutDataInBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), width, height, 0, 0, 0, 0);
  v7 = 0.0;
  v6 = 0.0;
  result.height = v7;
  result.width = v6;
  return result;
}

- ($E2BAE4BD71C50F14921AF46CCB962FE7)_layoutDataInBounds:(SEL)a3
{
  double height;
  double width;
  double y;
  double x;
  $E2BAE4BD71C50F14921AF46CCB962FE7 *result;
  id v10;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[UIButtonConfigurationVisualProvider updateConfigurationIfNecessary](self, "updateConfigurationIfNecessary");
  -[UIButton _currentConfiguration](self->_button, "_currentConfiguration");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[UIButtonConfigurationVisualProvider _layoutDataInBounds:forConfiguration:](self, "_layoutDataInBounds:forConfiguration:", v10, x, y, width, height);

  return result;
}

- (BOOL)hasMultilineText
{
  void *v3;
  char v4;

  -[UIButtonConfigurationVisualProvider updateConfigurationIfNecessary](self, "updateConfigurationIfNecessary");
  -[UIButton _currentConfiguration](self->_button, "_currentConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "_hasMultilineTitle") & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "_hasMultilineSubtitle");

  return v4;
}

- (void)updateConfigurationIfNecessary
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_BYTE *)&self->_flags &= ~1u;
    if (_UIObservationTrackingEnabled())
      -[UIButton _updateConfigurationWithObservationTracking:](self->_button, "_updateConfigurationWithObservationTracking:", self);
    else
      -[UIButtonConfigurationVisualProvider _executeConfigurationUpdate](self, "_executeConfigurationUpdate");
  }
}

- ($E2BAE4BD71C50F14921AF46CCB962FE7)_layoutDataInBounds:(SEL)a3 forConfiguration:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  UIUserInterfaceLayoutDirection v11;
  _BOOL4 v12;
  _BOOL4 v13;
  double v14;
  void *v15;
  int v16;
  int v17;
  int v18;
  void *v19;
  void *v20;
  char v21;
  double v22;
  double v23;
  BOOL v24;
  int v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  int v37;
  int v38;
  int v39;
  _BOOL4 v40;
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
  double v53;
  double v54;
  double v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  uint64_t v62;
  double *v63;
  uint64_t v64;
  double *v65;
  double *v66;
  double v67;
  double v68;
  double v69;
  double *v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  int v77;
  double v78;
  double v79;
  double v80;
  BOOL v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  UIImageView *imageView;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  CGFloat v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  CGFloat v110;
  double v111;
  CGFloat v112;
  uint64_t v113;
  double v114;
  double v115;
  double v116;
  double v117;
  _BOOL4 v118;
  double v119;
  uint64_t v120;
  int v121;
  double v122;
  CGFloat v123;
  CGFloat MaxX;
  double v125;
  double v126;
  double v127;
  double v128;
  char v129;
  double v130;
  double v131;
  double v132;
  CGFloat v133;
  void *v134;
  double v135;
  CGFloat v136;
  double v137;
  double v138;
  double v139;
  double v140;
  CGFloat v141;
  double v142;
  double v143;
  CGFloat v144;
  double v145;
  double v146;
  double v147;
  double v148;
  CGFloat v149;
  double v150;
  void *v151;
  double v152;
  double v153;
  double v154;
  double v155;
  CGFloat v156;
  double v157;
  double v158;
  double v159;
  double v160;
  CGFloat v161;
  double v162;
  CGFloat v163;
  CGFloat v164;
  CGFloat v165;
  CGFloat v166;
  CGFloat v167;
  double v168;
  CGFloat v169;
  CGFloat v170;
  double v171;
  CGFloat v172;
  CGFloat v173;
  CGFloat v174;
  CGFloat v175;
  CGFloat v176;
  double v177;
  CGFloat v178;
  CGFloat v179;
  double v180;
  double v181;
  double v182;
  double v183;
  double v184;
  double v185;
  double v186;
  double v187;
  double v188;
  double v189;
  double v190;
  double v191;
  BOOL v192;
  double v193;
  double v194;
  double v195;
  double v196;
  double v197;
  UIControlContentHorizontalAlignment v198;
  CGFloat v199;
  CGFloat v200;
  CGFloat v201;
  _BOOL4 v202;
  double v203;
  double v204;
  CGFloat v205;
  double v206;
  double v207;
  char v208;
  UIButton *v209;
  double v210;
  UIControlContentVerticalAlignment v211;
  UIControlContentVerticalAlignment v212;
  char v213;
  double v214;
  double v215;
  double v216;
  CGFloat v217;
  double v218;
  double v219;
  CGFloat v220;
  double v221;
  UIButton *button;
  double v223;
  double v224;
  CGFloat v225;
  double v226;
  CGFloat v227;
  double v228;
  CGFloat v229;
  double MinX;
  double v231;
  double v232;
  double v233;
  double v234;
  CGFloat v235;
  double v236;
  double v237;
  CGFloat v238;
  double MinY;
  double MidY;
  CGFloat MaxY;
  CGFloat v242;
  double v243;
  double v244;
  double v245;
  double v246;
  double v247;
  double v248;
  char v249;
  double v250;
  double v251;
  double v252;
  double v253;
  double v254;
  double v255;
  double v256;
  double v257;
  uint64_t v258;
  void *v259;
  double v260;
  double v261;
  id v262;
  double v263;
  double v264;
  uint64_t v265;
  void *v266;
  double v267;
  double v268;
  id v269;
  double v270;
  double v271;
  double v272;
  double v273;
  double v274;
  _BOOL4 v275;
  double v276;
  double v277;
  double v278;
  double v279;
  double v280;
  double v281;
  CGFloat v282;
  double v283;
  double v284;
  double v285;
  double v286;
  char v287;
  char v288;
  $E2BAE4BD71C50F14921AF46CCB962FE7 *result;
  double v290;
  double v291;
  CGFloat v292;
  CGFloat dx;
  CGFloat dxa;
  int v295;
  void *v296;
  void *v297;
  _BOOL4 v298;
  int v299;
  double v300;
  CGFloat v301;
  double v302;
  double v303;
  double v304;
  CGFloat v305;
  double v306;
  CGFloat v307;
  CGFloat v308;
  double v309;
  double v310;
  CGFloat v311;
  CGFloat v312;
  double v313;
  CGFloat v314;
  CGFloat v315;
  double v316;
  CGFloat v317;
  CGFloat v318;
  CGFloat v319;
  uint64_t v320;
  double v321;
  double rect;
  CGFloat recta;
  double rect_8;
  CGFloat rect_8a;
  double rect_16;
  double rect_16a;
  CGFloat rect_16b;
  CGFloat rect_16c;
  double rect_16d;
  CGFloat rect_24;
  double rect_24a;
  CGFloat v333;
  double v334;
  CGFloat r1;
  double r1a;
  uint64_t v337;
  double v338;
  double v339;
  double v340;
  double v341;
  CGFloat v342;
  CGFloat v343;
  double v344;
  uint64_t v345;
  double v346;
  double v347;
  double v348;
  double v349;
  void *r2;
  CGFloat r2a;
  double r2b;
  CGFloat r2_8;
  double r2_8a;
  CGFloat r2_16;
  double r2_16a;
  int r2_24;
  double r2_24a;
  int v359;
  CGFloat v360;
  CGFloat v361;
  double v362;
  CGFloat v363;
  CGFloat v364;
  CGFloat v365;
  double v366;
  double v367;
  CGFloat v368;
  double v369;
  double v370;
  double v371;
  id v372;
  double v373;
  double v374;
  double v375;
  double v376;
  double v377;
  double v378;
  CGRect v379;
  CGRect v380;
  CGRect v381;
  CGRect v382;
  CGRect v383;
  CGRect v384;
  CGRect v385;
  CGRect v386;
  CGRect v387;
  CGRect v388;
  CGRect v389;
  CGRect v390;
  CGRect v391;
  CGRect v392;
  CGRect v393;
  CGRect v394;
  CGRect v395;
  CGRect v396;
  CGRect v397;
  CGRect v398;
  CGRect v399;
  CGRect v400;
  CGRect v401;
  CGRect v402;
  CGRect v403;
  CGRect v404;
  CGRect v405;
  CGRect v406;
  CGRect v407;
  CGRect v408;
  CGRect v409;
  CGRect v410;
  CGRect v411;
  CGRect v412;
  CGRect v413;
  CGRect v414;
  CGRect v415;
  CGRect v416;
  CGRect v417;
  CGRect v418;
  CGRect v419;
  CGRect v420;
  CGRect v421;
  CGRect v422;
  CGRect v423;
  CGRect v424;
  CGRect v425;
  CGRect v426;
  CGRect v427;
  CGRect v428;
  CGRect v429;
  CGRect v430;
  CGRect v431;
  CGRect v432;
  CGRect v433;
  CGRect v434;
  CGRect v435;
  CGRect v436;
  CGRect v437;
  CGRect v438;
  CGRect v439;
  CGRect v440;
  CGRect v441;
  CGRect v442;
  CGRect v443;
  CGRect v444;
  CGRect v445;
  CGRect v446;
  CGRect v447;
  CGRect v448;
  CGRect v449;
  CGRect v450;
  CGRect v451;
  CGRect v452;
  CGRect v453;
  CGRect v454;
  CGRect v455;
  CGRect v456;
  CGRect v457;
  CGRect v458;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v372 = a5;
  v11 = -[UIView effectiveUserInterfaceLayoutDirection](self->_button, "effectiveUserInterfaceLayoutDirection");
  v379.origin.x = x;
  v379.origin.y = y;
  v379.size.width = width;
  v379.size.height = height;
  if (CGRectGetWidth(v379) <= 0.0)
  {
    v12 = 0;
  }
  else
  {
    v380.origin.x = x;
    v380.origin.y = y;
    v380.size.width = width;
    v380.size.height = height;
    v12 = CGRectGetWidth(v380) < 3.40282347e38;
  }
  v381.origin.x = x;
  v381.origin.y = y;
  v381.size.width = width;
  v381.size.height = height;
  if (CGRectGetHeight(v381) <= 0.0)
  {
    v13 = 0;
  }
  else
  {
    v382.origin.x = x;
    v382.origin.y = y;
    v382.size.width = width;
    v382.size.height = height;
    v13 = CGRectGetHeight(v382) < 3.40282347e38;
  }
  v14 = 0.0;
  if (v12)
  {
    v383.origin.x = x;
    v383.origin.y = y;
    v383.size.width = width;
    v383.size.height = height;
    v14 = CGRectGetWidth(v383);
  }
  if (v13)
  {
    v384.origin.x = x;
    v384.origin.y = y;
    v384.size.width = width;
    v384.size.height = height;
    CGRectGetHeight(v384);
  }
  v298 = v12;
  r2_24 = objc_msgSend(v372, "_hasMultilineTitle");
  v359 = objc_msgSend(v372, "_hasMultilineSubtitle");
  objc_msgSend(v372, "_resolvedImage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v372, "showsActivityIndicator");
  r2 = v15;
  v24 = v15 == 0;
  v17 = v16;
  if (v24)
    v18 = v16;
  else
    v18 = 1;
  objc_msgSend(v372, "_resolvedIndicator");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v372, "_resolvedTitle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v372, "_resolvedSubtitle");
  v297 = v20;
  v296 = (void *)objc_claimAutoreleasedReturnValue();
  v345 = objc_msgSend(v20, "length");
  v337 = objc_msgSend(v296, "length");
  v320 = objc_msgSend(v372, "imagePlacement");
  v295 = v18;
  v299 = v18 ^ 1;
  if (v345 | v337)
    v21 = v18 ^ 1;
  else
    v21 = 1;
  v346 = 0.0;
  v22 = 0.0;
  if ((v21 & 1) == 0)
  {
    objc_msgSend(v372, "imagePadding");
    v22 = v23;
  }
  if (v345)
    v24 = v337 == 0;
  else
    v24 = 1;
  v25 = !v24;
  if (!v24)
  {
    objc_msgSend(v372, "titlePadding");
    v346 = v26;
  }
  v27 = v372;
  if (v19)
  {
    objc_msgSend(v372, "_resolvedIndicatorPadding");
    v27 = v372;
    v29 = v28;
  }
  else
  {
    v29 = 0.0;
  }
  objc_msgSend(v27, "_resolvedImageReservation");
  v300 = v30;
  objc_msgSend(v372, "contentInsets");
  v32 = v31;
  v34 = v33;
  v313 = v35;
  v366 = v36;
  v37 = objc_msgSend(v372, "_hasOversizedTitle");
  v38 = objc_msgSend(v372, "_hasOversizedSubtitle");
  v39 = v38;
  if ((v37 & 1) != 0 || v38)
  {
    v373 = 0.0;
    v374 = 0.0;
    if (v25)
    {
      v41 = v14;
      rect_16 = v29;
      v303 = v22;
      v339 = v34;
      v309 = v32;
      v42 = 0.0;
      v43 = 0.0;
      v44 = 0.0;
      v45 = 0.0;
      v46 = 0.0;
      if (v37)
      {
        v46 = +[UILabel _insetsForAttributedString:withDefaultFont:inView:]((uint64_t)UILabel, v297, 0, self->_button);
        v45 = v47;
        v44 = v48;
        v43 = v49;
      }
      v50 = 0.0;
      v51 = 0.0;
      v52 = 0.0;
      v40 = v298;
      if (v39)
      {
        v52 = +[UILabel _insetsForAttributedString:withDefaultFont:inView:]((uint64_t)UILabel, v296, 0, self->_button);
        v42 = v53;
      }
      v378 = -v46;
      v376 = -v50;
      if (v11 == UIUserInterfaceLayoutDirectionRightToLeft)
      {
        if (v43 <= v42)
          v54 = v43;
        else
          v54 = v42;
        v55 = -v54;
        if (v45 <= v51)
          v51 = v45;
      }
      else
      {
        if (v45 <= v51)
          v51 = v45;
        v55 = -v51;
        if (v43 <= v42)
          v51 = v43;
        else
          v51 = v42;
      }
      v32 = v309;
      v22 = v303;
      v377 = v55;
      v375 = -v51;
      v61 = -(v44 + v52);
      v34 = v339;
      v29 = rect_16;
      v14 = v41;
    }
    else
    {
      if (v37)
        v56 = v297;
      else
        v56 = v296;
      v378 = -+[UILabel _insetsForAttributedString:withDefaultFont:inView:]((uint64_t)UILabel, v56, 0, self->_button);
      v376 = -v58;
      v60 = -v59;
      if (v11 == UIUserInterfaceLayoutDirectionRightToLeft)
      {
        v377 = -v57;
        v375 = v60;
      }
      else
      {
        v377 = v60;
        v375 = -v57;
      }
      v61 = 0.0;
      v40 = v298;
    }
    v62 = v320;
    if (!v295)
      v62 = 0;
    v63 = &v374;
    v64 = v62 - 1;
    v65 = &v378;
    switch(v64)
    {
      case 0:
        goto LABEL_64;
      case 1:
        v65 = &v377;
        goto LABEL_64;
      case 3:
        v65 = &v376;
        goto LABEL_64;
      case 7:
        v65 = &v375;
LABEL_64:
        v374 = *v65;
        v63 = v65;
        break;
      default:
        break;
    }
    *v63 = 0.0;
    if (v19)
    {
      v373 = v375;
      v66 = &v375;
    }
    else
    {
      v66 = &v373;
    }
    *v66 = 0.0;
    if (v34 < v377)
      v34 = v377;
    v67 = v366;
    if (v366 < v375)
      v67 = v375;
    v366 = v67;
    if (v32 < v378)
      v32 = v378;
    v68 = v313;
    if (v313 < v376)
      v68 = v376;
    v313 = v68;
    v69 = v346;
    if (v346 < v61)
      v69 = v61;
    v346 = v69;
    if (v22 < v374)
      v22 = v374;
    if (v29 < v373)
      v29 = v373;
  }
  else
  {
    v40 = v298;
  }
  v70 = (double *)MEMORY[0x1E0C9D538];
  v310 = v32;
  v304 = v22;
  if (v17)
  {
    v71 = *MEMORY[0x1E0C9D820];
    v348 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    -[UIActivityIndicatorView sizeThatFits:](self->_progressIndicatorView, "sizeThatFits:", *MEMORY[0x1E0C9D820]);
    v73 = v72;
    v363 = v74;
    if (!v19)
      goto LABEL_85;
    goto LABEL_84;
  }
  v71 = *MEMORY[0x1E0C9D820];
  v348 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (r2)
  {
    imageView = self->_imageView;
    v88 = v14;
    v89 = width;
    v90 = height;
    v91 = v29;
    v92 = *MEMORY[0x1E0C9D538];
    v93 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    -[UIImageView sizeThatFits:](imageView, "sizeThatFits:", v71);
    v95 = v94;
    v96 = v92;
    v29 = v91;
    height = v90;
    width = v89;
    v14 = v88;
    v22 = v304;
    -[UIView alignmentRectForFrame:](imageView, "alignmentRectForFrame:", v96, v93, v95, v97);
    v73 = v98;
    v363 = v99;
    if (!v19)
      goto LABEL_85;
LABEL_84:
    -[UIImageView sizeThatFits:](self->_indicatorView, "sizeThatFits:", v71, v348);
    v71 = v75;
    v348 = v76;
    goto LABEL_85;
  }
  v363 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v73 = *MEMORY[0x1E0C9D820];
  if (v19)
    goto LABEL_84;
LABEL_85:
  v77 = v299;
  if (v14 <= 0.0)
    v77 = 1;
  if ((v320 & 0xA) == 0)
    v77 = 1;
  v369 = v73;
  v78 = v14 - (v22 + v73);
  v79 = 0.0;
  v80 = fmax(v78, 0.0);
  if (v77)
    v80 = v14;
  if (v19)
    v81 = v80 <= 0.0;
  else
    v81 = 1;
  rect_16a = v29;
  v316 = v29 + v71;
  v82 = fmax(v80 - (v29 + v71), 0.0);
  if (!v81)
    v80 = v82;
  v340 = v34;
  v83 = fmax(v80 - (v366 + v34), 0.0);
  if (v80 <= 0.0)
    v84 = v80;
  else
    v84 = v83;
  v292 = width;
  dx = height;
  v318 = v71;
  if (v84 <= 0.0)
  {
    v86 = 3.40282347e38;
  }
  else
  {
    UICeilToViewScale(self->_button);
    v86 = v85;
  }
  v100 = *MEMORY[0x1E0C9D648];
  r2_8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v101 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v333 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v102 = v333;
  r1 = v101;
  v103 = 0.0;
  v104 = *MEMORY[0x1E0C9D648];
  r2_16 = v101;
  rect_24 = v333;
  v105 = *MEMORY[0x1E0C9D648];
  if (v345 | v337)
  {
    r2_16 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v106 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    if (v345)
    {
      -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v86, 3.40282347e38);
      v106 = v107;
      r2_16 = v108;
      if (((!v40 | r2_24) & 1) == 0 && v107 >= v84)
        v106 = v84;
    }
    v109 = v101;
    v110 = v333;
    if (v337)
    {
      -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", v86, 3.40282347e38);
      v110 = v111;
      if (((!v40 | v359) & 1) == 0 && v111 >= v84)
        v110 = v84;
    }
    v112 = v109;
    v385.origin.x = v100;
    v385.origin.y = r2_8;
    rect_24 = v106;
    v385.size.width = v106;
    v385.size.height = r2_16;
    v103 = CGRectGetWidth(v385);
    v386.origin.x = v100;
    v386.origin.y = r2_8;
    v333 = v110;
    r1 = v112;
    v386.size.width = v110;
    v386.size.height = v112;
    v79 = CGRectGetWidth(v386);
    if (v345 && v337)
    {
      v113 = objc_msgSend(v372, "_resolvedTitleAlignment");
      if (v113 == 2 || (v114 = 0.0, (v11 == UIUserInterfaceLayoutDirectionRightToLeft) != (v113 == 3)))
        UIFloorToViewScale(self->_button);
      v105 = v100 + v114;
      if (v103 >= v79)
        v104 = v105;
      else
        v104 = v100;
      if (v103 >= v79)
        v105 = v100;
    }
    else
    {
      v104 = v100;
      v105 = v100;
    }
  }
  v360 = v100;
  v115 = v105;
  v338 = *v70;
  r2_24a = v70[1];
  if ((v320 & 0xA) != 0)
  {
    v116 = 0.0;
    v117 = v369;
    v118 = v13;
    if (v300 > v369)
    {
      v117 = v300;
      UIRoundToViewScale(self->_button);
      v116 = v119;
    }
    v120 = 2;
    if (v11 == UIUserInterfaceLayoutDirectionRightToLeft)
      v120 = 8;
    v121 = v17;
    if ((v320 & v120) != 0)
    {
      v122 = v102 + v304 + v117;
      v387.origin.x = v360;
      v123 = r2_8;
      v387.origin.y = r2_8;
      v387.size.width = v122;
      v387.size.height = v101;
      MaxX = CGRectGetMaxX(v387);
      v115 = v115 + MaxX;
      v104 = v104 + MaxX;
      if (v103 >= v79)
        v125 = v103;
      else
        v125 = v79;
      v126 = v125 + v122;
      v127 = v338;
    }
    else
    {
      if (v103 >= v79)
        v132 = v103;
      else
        v132 = v79;
      v133 = v102 + v304 + v132;
      v388.origin.x = v360;
      v123 = r2_8;
      v388.origin.y = r2_8;
      v388.size.width = v133;
      v388.size.height = v101;
      v127 = CGRectGetMaxX(v388);
      v126 = v133 + v117;
    }
    v134 = r2;
    v135 = v366;
    v389.size.width = v369;
    v389.origin.x = v116 + v127;
    v136 = v389.origin.x;
    v389.origin.y = r2_24a;
    v389.size.height = v363;
    v137 = CGRectGetHeight(v389);
    rect = v115;
    v390.origin.x = v115;
    v138 = v136;
    v390.origin.y = v123;
    v390.size.width = rect_24;
    v390.size.height = r2_16;
    v139 = CGRectGetHeight(v390);
    rect_8 = v104;
    v391.origin.x = v104;
    v391.origin.y = v123;
    v391.size.width = v333;
    v391.size.height = r1;
    v140 = v139 + CGRectGetHeight(v391);
    if (v137 >= v140)
      v140 = v137;
    v141 = v360;
  }
  else
  {
    if (v103 >= v79)
      v128 = v103;
    else
      v128 = v79;
    if (v369 == v128)
      v129 = 1;
    else
      v129 = v21;
    v118 = v13;
    if ((v129 & 1) != 0)
    {
      v130 = v369;
      v131 = v338;
    }
    else
    {
      UIFloorToViewScale(self->_button);
      if (v369 >= v128)
        v143 = -0.0;
      else
        v143 = v142;
      v130 = v369;
      v131 = v338 + v143;
      if (v369 < v128)
        v142 = -0.0;
      v104 = v104 + v142;
      v115 = v115 + v142;
    }
    v121 = v17;
    v144 = v363;
    v135 = v366;
    if (v130 >= v128)
      v126 = v130;
    else
      v126 = v128;
    v145 = v131;
    v146 = r2_24a;
    v147 = CGRectGetHeight(*(CGRect *)(&v130 - 2));
    if (v147 >= v300)
      v148 = v147;
    else
      v148 = v300;
    rect = v115;
    v392.origin.x = v115;
    v392.origin.y = r2_8;
    v392.size.width = rect_24;
    v392.size.height = r2_16;
    v149 = CGRectGetHeight(v392) + v148;
    rect_8 = v104;
    v393.origin.x = v104;
    v393.origin.y = r2_8;
    v393.size.width = v333;
    v393.size.height = r1;
    v140 = v304 + CGRectGetHeight(v393) + v149;
    v134 = r2;
    v141 = v360;
    v138 = v131;
  }
  v150 = v346 + v140;
  v151 = v372;
  if (v19)
  {
    v152 = v340;
    if (v11 == UIUserInterfaceLayoutDirectionRightToLeft)
    {
      v153 = v316;
      v138 = v316 + v138;
      rect = v316 + rect;
      rect_8 = v316 + rect_8;
      v154 = v141;
      v155 = v348;
    }
    else
    {
      v394.origin.x = v141;
      v394.origin.y = r2_8;
      v394.size.width = v126;
      v394.size.height = v150;
      v156 = CGRectGetMaxX(v394);
      v151 = v372;
      v154 = rect_16a + v156;
      v155 = v348;
      v153 = v316;
    }
    v126 = v153 + v126;
    if (v150 < v155)
      v150 = v155;
  }
  else
  {
    v154 = v338;
    v152 = v340;
  }
  if (objc_msgSend(v151, "_isRoundButton"))
  {
    v395.origin.x = v141;
    v395.origin.y = r2_8;
    v395.size.width = v126;
    v395.size.height = v150;
    CGRectGetWidth(v395);
    UIRoundToViewScale(self->_button);
    v158 = v157;
    v396.origin.x = v141;
    v396.origin.y = r2_8;
    v396.size.width = v126;
    v396.size.height = v150;
    CGRectGetHeight(v396);
    UIRoundToViewScale(self->_button);
    v160 = (v158 - v159) * 0.5;
    if (objc_msgSend(v372, "_hasSymbolImage") || v160 <= 0.0)
    {
      v152 = v152 - v160;
      v135 = v135 - v160;
    }
    else
    {
      v310 = v310 + v160;
      v313 = v313 + v160;
    }
  }
  v341 = v152;
  v367 = v135;
  if (v11 == UIUserInterfaceLayoutDirectionRightToLeft)
    v161 = v135;
  else
    v161 = v152;
  v397.origin.x = v141;
  v397.origin.y = r2_8;
  v397.size.width = v126;
  v397.size.height = v150;
  v162 = v310;
  v398 = CGRectOffset(v397, v161, v310);
  rect_16b = v398.origin.x;
  v312 = v398.origin.y;
  v307 = v398.size.height;
  v308 = v398.size.width;
  v398.origin.x = v138;
  v398.origin.y = r2_24a;
  v398.size.width = v369;
  v398.size.height = v363;
  v399 = CGRectOffset(v398, v161, v310);
  v163 = v399.origin.x;
  v370 = v399.origin.y;
  v361 = v399.size.height;
  v364 = v399.size.width;
  v399.origin.x = v154;
  v399.origin.y = r2_24a;
  v399.size.width = v318;
  v399.size.height = v348;
  v400 = CGRectOffset(v399, v161, v310);
  v315 = v400.origin.x;
  v317 = v400.size.width;
  v349 = v400.origin.y;
  v319 = v400.size.height;
  v400.origin.x = rect;
  v400.origin.y = r2_8;
  v400.size.width = rect_24;
  v400.size.height = r2_16;
  v401 = CGRectOffset(v400, v161, v310);
  v164 = v401.origin.x;
  v165 = v401.origin.y;
  v166 = v401.size.width;
  v167 = v401.size.height;
  v401.origin.x = rect_8;
  v401.origin.y = r2_8;
  v401.size.width = v333;
  v401.size.height = r1;
  v402 = CGRectOffset(v401, v161, v310);
  rect_8a = v402.origin.x;
  r2_8a = v402.size.width;
  r2_16a = v402.size.height;
  recta = v164;
  v402.origin.x = v164;
  rect_24a = v165;
  v334 = v166;
  v402.origin.y = v165;
  v402.size.width = v166;
  r1a = v167;
  v402.size.height = v167;
  v347 = v346 + CGRectGetMaxY(v402);
  r2a = v163;
  if ((v21 & 1) != 0)
  {
    v168 = v367;
    v169 = v307;
    v170 = rect_16b;
    v171 = v312;
    if (v19)
    {
LABEL_183:
      v172 = v170;
      v173 = v171;
      v174 = v308;
      v175 = v308;
      v176 = v169;
      CGRectGetMidY(*(CGRect *)(&v171 - 1));
      v403.origin.x = v315;
      v403.size.width = v317;
      v403.origin.y = v349;
      v403.size.height = v319;
      CGRectGetMidY(v403);
      v170 = rect_16b;
      UIFloorToViewScale(self->_button);
      v349 = v349 + v177;
      goto LABEL_199;
    }
  }
  else
  {
    if ((v320 & 0xA) != 0)
    {
      v404.origin.x = v164;
      v456.origin.x = rect_8a;
      v404.origin.y = v165;
      v404.size.width = v166;
      v404.size.height = v167;
      v456.origin.y = v347;
      v456.size.width = r2_8a;
      v456.size.height = r2_16a;
      v405 = CGRectUnion(v404, v456);
      v178 = v405.origin.x;
      v179 = v405.size.width;
      v301 = v405.origin.y;
      v305 = v405.size.height;
      CGRectGetMidY(v405);
      v406.origin.x = v163;
      v406.origin.y = v370;
      v406.size.width = v364;
      v406.size.height = v361;
      CGRectGetMidY(v406);
      UIRoundToViewScale(self->_button);
      if (v180 != 0.0)
      {
        v181 = v180;
        v407.origin.x = v163;
        v407.origin.y = v370;
        v407.size.width = v364;
        v407.size.height = v361;
        v182 = CGRectGetHeight(v407);
        v408.origin.x = v178;
        v408.origin.y = v301;
        v408.size.height = v305;
        v408.size.width = v179;
        if (v182 <= CGRectGetHeight(v408))
        {
          v370 = v370 + v181;
        }
        else
        {
          rect_24a = rect_24a - v181;
          v347 = v347 - v181;
        }
      }
      v162 = v310;
      v171 = v312;
      v168 = v367;
      v169 = v307;
    }
    else
    {
      v409.origin.x = v163;
      v409.origin.y = v370;
      v409.size.height = v361;
      v409.size.width = v364;
      v183 = CGRectGetHeight(v409);
      if (v300 <= v183)
      {
        v185 = 0.0;
        v300 = v183;
      }
      else
      {
        UIRoundToViewScale(self->_button);
        v185 = v184;
      }
      v168 = v367;
      v169 = v307;
      if ((v320 & 1) != 0)
      {
        rect_24a = rect_24a + v304 + v300;
        v347 = v347 + v304 + v300;
        v186 = v370;
      }
      else
      {
        v410.origin.x = rect_8a;
        v410.origin.y = v347;
        v410.size.width = r2_8a;
        v410.size.height = r2_16a;
        v186 = v304 + CGRectGetMaxY(v410);
      }
      v171 = v312;
      v370 = v185 + v186;
    }
    v170 = rect_16b;
    if (v19)
      goto LABEL_183;
  }
  v173 = v171;
  v174 = v308;
LABEL_199:
  v411.origin.x = v170;
  v411.origin.y = v173;
  v411.size.width = v174;
  v411.size.height = v169;
  CGRectGetWidth(v411);
  UIRoundToViewScale(self->_button);
  v412.size.height = v169;
  v188 = v187;
  v412.origin.x = v170;
  v412.origin.y = v173;
  v412.size.width = v174;
  CGRectGetHeight(v412);
  UIRoundToViewScale(self->_button);
  if (v40 && v118)
    v190 = v292;
  else
    v190 = v188;
  if (v40 && v118)
    v191 = dx;
  else
    v191 = v189;
  v302 = v189;
  v306 = v188;
  v192 = v190 == v188 && v191 == v189;
  v368 = v190;
  v311 = v191;
  if (v192)
  {
    v202 = (v345 | v337) != 0;
    v203 = v361;
    v204 = v364;
    v205 = v349;
    v206 = r2a;
    v207 = v370;
    goto LABEL_258;
  }
  if (v11 == UIUserInterfaceLayoutDirectionRightToLeft)
    v193 = v341;
  else
    v193 = v168;
  v194 = v338 + v161;
  v195 = r2_24a + v162;
  v196 = v190 - (v161 + v193);
  v197 = v191 - (v313 + v162);
  v198 = -[UIControl contentHorizontalAlignment](self->_button, "contentHorizontalAlignment");
  if (v198 == UIControlContentHorizontalAlignmentTrailing)
  {
    v199 = v307;
    v200 = v308;
    v201 = rect_16b;
    if (v11 != UIUserInterfaceLayoutDirectionRightToLeft)
      goto LABEL_227;
  }
  else
  {
    v199 = v307;
    v200 = v308;
    v201 = rect_16b;
    if (v198 == UIControlContentHorizontalAlignmentLeading)
    {
      if (v11 == UIUserInterfaceLayoutDirectionRightToLeft)
      {
LABEL_227:
        v415.origin.x = v338 + v161;
        v415.origin.y = v195;
        v415.size.width = v196;
        v415.size.height = v197;
        CGRectGetMaxX(v415);
        v416.origin.x = v201;
        v416.origin.y = v312;
        v416.size.width = v200;
        v416.size.height = v199;
        CGRectGetMaxX(v416);
        goto LABEL_228;
      }
    }
    else
    {
      v208 = v299;
      if (v198 != UIControlContentHorizontalAlignmentFill)
        v208 = 1;
      if ((v320 & 0xA) == 0)
        v208 = 1;
      if (!(v208 & 1 | ((v345 | v337) == 0)))
      {
        v422.origin.x = v338 + v161;
        v422.origin.y = v195;
        v422.size.width = v196;
        v422.size.height = v197;
        CGRectGetMinX(v422);
        v423.origin.x = rect_16b;
        v423.origin.y = v312;
        v423.size.width = v308;
        v423.size.height = v307;
        CGRectGetMinX(v423);
        v424.origin.x = v338 + v161;
        v424.origin.y = v195;
        v424.size.width = v196;
        v424.size.height = v197;
        CGRectGetMaxX(v424);
        v425.origin.x = rect_16b;
        v425.origin.y = v312;
        v425.size.width = v308;
        v425.size.height = v307;
        CGRectGetMaxX(v425);
        button = self->_button;
        if (v11 == UIUserInterfaceLayoutDirectionRightToLeft)
        {
          UICeilToViewScale(button);
          v314 = v223;
          UICeilToViewScale(self->_button);
        }
        else
        {
          UIFloorToViewScale(button);
          v314 = v290;
          UIFloorToViewScale(self->_button);
        }
        dxa = v224;
        v199 = v307;
        v200 = v308;
        goto LABEL_232;
      }
      if (v198 == UIControlContentHorizontalAlignmentRight)
        goto LABEL_227;
      if (v198 != UIControlContentHorizontalAlignmentLeft)
      {
        v454.origin.x = v338 + v161;
        v454.origin.y = v195;
        v454.size.width = v196;
        v454.size.height = v197;
        CGRectGetMidX(v454);
        v455.origin.x = rect_16b;
        v455.origin.y = v312;
        v455.size.width = v308;
        v455.size.height = v307;
        CGRectGetMidX(v455);
        goto LABEL_228;
      }
    }
  }
  v413.origin.x = v338 + v161;
  v413.origin.y = v195;
  v413.size.width = v196;
  v413.size.height = v197;
  CGRectGetMinX(v413);
  v414.origin.x = v201;
  v414.origin.y = v312;
  v414.size.width = v200;
  v414.size.height = v199;
  CGRectGetMinX(v414);
LABEL_228:
  v209 = self->_button;
  if (v11 == UIUserInterfaceLayoutDirectionRightToLeft)
    UICeilToViewScale(v209);
  else
    UIFloorToViewScale(v209);
  v314 = v210;
  dxa = v210;
LABEL_232:
  v211 = -[UIControl contentVerticalAlignment](self->_button, "contentVerticalAlignment");
  v212 = v211;
  v213 = v295 ^ 1;
  if ((v320 & 0xA) != 0)
    v213 = 1;
  if (v211 != UIControlContentVerticalAlignmentFill)
    v213 = 1;
  v342 = v195;
  v291 = v338 + v161;
  if (v213 & 1 | ((v345 | v337) == 0))
  {
    if (v211 == UIControlContentVerticalAlignmentBottom)
    {
      v426.origin.x = v338 + v161;
      v426.origin.y = v195;
      v426.size.width = v196;
      v217 = v197;
      v426.size.height = v197;
      CGRectGetMaxY(v426);
      v427.size.height = v199;
      v427.origin.x = v201;
      v427.origin.y = v312;
      v427.size.width = v200;
      CGRectGetMaxY(v427);
    }
    else
    {
      v214 = v338 + v161;
      v215 = v195;
      v216 = v196;
      v217 = v197;
      v218 = v197;
      if (v211 == UIControlContentVerticalAlignmentTop)
      {
        CGRectGetMinY(*(CGRect *)&v214);
        v417.origin.x = v201;
        v417.origin.y = v312;
        v417.size.width = v200;
        v417.size.height = v199;
        CGRectGetMinY(v417);
      }
      else
      {
        CGRectGetMidY(*(CGRect *)&v214);
        v428.origin.x = v201;
        v428.origin.y = v312;
        v428.size.width = v200;
        v428.size.height = v199;
        CGRectGetMidY(v428);
      }
    }
    UIFloorToViewScale(self->_button);
    v220 = v221;
  }
  else
  {
    v418.origin.x = v338 + v161;
    v418.origin.y = v195;
    v418.size.width = v196;
    v418.size.height = v197;
    CGRectGetMinY(v418);
    v419.origin.x = v201;
    v419.origin.y = v312;
    v419.size.width = v200;
    v419.size.height = v199;
    CGRectGetMinY(v419);
    v420.origin.x = v338 + v161;
    v420.origin.y = v195;
    v420.size.width = v196;
    v217 = v197;
    v420.size.height = v197;
    CGRectGetMaxY(v420);
    v421.origin.x = rect_16b;
    v421.origin.y = v312;
    v421.size.width = v200;
    v421.size.height = v199;
    CGRectGetMaxY(v421);
    UIFloorToViewScale(self->_button);
    v220 = v219;
    UIFloorToViewScale(self->_button);
  }
  v225 = v221;
  if (v19)
  {
    v226 = v194;
    v227 = v342;
    v228 = v196;
    v229 = v217;
    if (v11 == UIUserInterfaceLayoutDirectionRightToLeft)
    {
      MinX = CGRectGetMinX(*(CGRect *)&v226);
      v231 = rect_16b;
      v429.origin.x = rect_16b;
      v429.origin.y = v312;
      v429.size.height = v307;
      v429.size.width = v308;
      v232 = CGRectGetMinX(v429);
    }
    else
    {
      MinX = CGRectGetMaxX(*(CGRect *)&v226);
      v231 = rect_16b;
      v430.origin.x = rect_16b;
      v430.origin.y = v312;
      v430.size.height = v307;
      v430.size.width = v308;
      v232 = CGRectGetMaxX(v430);
    }
    v233 = MinX - v232;
    v202 = (v345 | v337) != 0;
    if (v212 == UIControlContentVerticalAlignmentBottom)
    {
      v432.origin.x = v194;
      v432.origin.y = v342;
      v432.size.width = v196;
      v432.size.height = v217;
      MaxY = CGRectGetMaxY(v432);
      v242 = v231;
      MinY = MaxY;
      v433.origin.x = v242;
      v433.origin.y = v312;
      v433.size.height = v307;
      v433.size.width = v308;
      MidY = CGRectGetMaxY(v433);
    }
    else
    {
      v235 = v342;
      v236 = v194;
      v237 = v196;
      v238 = v217;
      if (v212 == UIControlContentVerticalAlignmentTop)
      {
        MinY = CGRectGetMinY(*(CGRect *)&v236);
        v431.origin.x = rect_16b;
        v431.origin.y = v312;
        v431.size.height = v307;
        v431.size.width = v308;
        MidY = CGRectGetMinY(v431);
      }
      else
      {
        MinY = CGRectGetMidY(*(CGRect *)&v236);
        v434.origin.x = rect_16b;
        v434.origin.y = v312;
        v434.size.height = v307;
        v434.size.width = v308;
        MidY = CGRectGetMidY(v434);
      }
    }
    v234 = MinY - MidY;
  }
  else
  {
    v233 = 0.0;
    v234 = 0.0;
    v202 = (v345 | v337) != 0;
  }
  v435.origin.x = r2a;
  v435.origin.y = v370;
  v435.size.height = v361;
  v435.size.width = v364;
  v436 = CGRectOffset(v435, dxa, v225);
  v206 = v436.origin.x;
  v207 = v436.origin.y;
  v204 = v436.size.width;
  v203 = v436.size.height;
  v436.origin.x = v315;
  v436.size.width = v317;
  v436.origin.y = v349;
  v436.size.height = v319;
  v437 = CGRectOffset(v436, v233, v234);
  v315 = v437.origin.x;
  v317 = v437.size.width;
  v205 = v437.origin.y;
  v319 = v437.size.height;
  v437.origin.x = recta;
  v437.origin.y = rect_24a;
  v437.size.width = v334;
  v437.size.height = r1a;
  v438 = CGRectOffset(v437, v314, v220);
  recta = v438.origin.x;
  rect_24a = v438.origin.y;
  v334 = v438.size.width;
  r1a = v438.size.height;
  v438.origin.x = rect_8a;
  v438.origin.y = v347;
  v438.size.width = r2_8a;
  v438.size.height = r2_16a;
  v439 = CGRectOffset(v438, v314, v220);
  rect_8a = v439.origin.x;
  v347 = v439.origin.y;
  r2_8a = v439.size.width;
  r2_16a = v439.size.height;
LABEL_258:
  v371 = v207;
  r2b = v206;
  v362 = v203;
  -[UIView frameForAlignmentRect:](self->_imageView, "frameForAlignmentRect:", v206, v207, v204, v203, *(_QWORD *)&v291);
  v343 = v243;
  rect_16c = v244;
  v246 = v245;
  v248 = v247;
  if (v134)
    v249 = v121;
  else
    v249 = 1;
  v250 = 0.0;
  if ((v249 & 1) != 0)
  {
    v251 = 0.0;
  }
  else
  {
    v251 = 0.0;
    if (-[UIImageView _hasBaseline](self->_imageView, "_hasBaseline"))
    {
      -[UIImageView _baselineOffsetsAtSize:](self->_imageView, "_baselineOffsetsAtSize:", v246, v248);
      v253 = v252;
      v255 = v254;
      -[UIImageView alignmentRectInsets](self->_imageView, "alignmentRectInsets");
      v250 = v253 + v256;
      v251 = v255 + v257;
    }
  }
  v365 = v204;
  if (v202)
  {
    if (v345)
      v258 = 24;
    else
      v258 = 32;
    v259 = *(Class *)((char *)&self->super.isa + v258);
    v321 = v251;
    if (v345)
      v260 = r1a;
    else
      v260 = r2_16a;
    if (v345)
      v261 = v334;
    else
      v261 = r2_8a;
    v262 = v259;
    objc_msgSend(v262, "_baselineOffsetsAtSize:", v261, v260);
    v264 = v263;
    if (v337)
      v265 = 32;
    else
      v265 = 24;
    v40 = v298;
    v266 = *(Class *)((char *)&self->super.isa + v265);
    if (v337)
      v267 = r2_16a;
    else
      v267 = r1a;
    if (v337)
      v268 = r2_8a;
    else
      v268 = v334;
    v269 = v266;
    v270 = v268;
    v271 = v264;
    v272 = v267;
    v251 = v321;
    objc_msgSend(v269, "_baselineOffsetsAtSize:", v270, v272);
    v274 = v273;

    if (!v134)
      goto LABEL_292;
  }
  else
  {
    v274 = 0.0;
    v271 = 0.0;
    if (!v134)
    {
      if (!v121)
      {
        rect_16d = 0.0;
        v344 = 0.0;
        goto LABEL_299;
      }
      goto LABEL_294;
    }
  }
  if ((v121 & 1) != 0 || -[UIImageView _hasBaseline](self->_imageView, "_hasBaseline") || (v345 | v337) == 0)
  {
    if (((v299 | v202) & 1) != 0)
    {
      v275 = -[UIImageView _hasBaseline](self->_imageView, "_hasBaseline");
      v276 = 0.0;
      v277 = 0.0;
      if (v275 && v202)
      {
        v440.origin.x = v343;
        v440.origin.y = rect_16c;
        v440.size.width = v246;
        v440.size.height = v248;
        CGRectGetMinY(v440);
        v441.origin.x = v338;
        v441.origin.y = r2_24a;
        v441.size.width = v368;
        v441.size.height = v311;
        CGRectGetMaxY(v441);
        v442.origin.x = v343;
        v442.origin.y = rect_16c;
        v442.size.width = v246;
        v442.size.height = v248;
        CGRectGetMaxY(v442);
        v443.origin.x = recta;
        v443.origin.y = rect_24a;
        v443.size.width = v334;
        v443.size.height = r1a;
        CGRectGetMinY(v443);
        v444.origin.x = v338;
        v444.origin.y = r2_24a;
        v444.size.width = v368;
        v444.size.height = v311;
        CGRectGetMaxY(v444);
        v445.origin.x = rect_8a;
        v445.origin.y = v347;
        v445.size.width = r2_8a;
        v445.size.height = r2_16a;
        CGRectGetMaxY(v445);
        UIRoundToViewScale(self->_button);
        v277 = v278;
        UIRoundToViewScale(self->_button);
      }
      goto LABEL_296;
    }
LABEL_294:
    v448.origin.x = v343;
    v448.origin.y = rect_16c;
    v448.size.width = v246;
    v448.size.height = v248;
    v277 = v250 + CGRectGetMinY(v448);
    v449.origin.x = v338;
    v449.origin.y = r2_24a;
    v449.size.width = v368;
    v449.size.height = v311;
    v279 = CGRectGetMaxY(v449);
    goto LABEL_295;
  }
LABEL_292:
  v446.origin.x = recta;
  v446.origin.y = rect_24a;
  v446.size.width = v334;
  v446.size.height = r1a;
  v277 = v271 + CGRectGetMinY(v446);
  v447.origin.x = v338;
  v447.origin.y = r2_24a;
  v447.size.width = v368;
  v447.size.height = v311;
  v279 = CGRectGetMaxY(v447);
  v343 = rect_8a;
  rect_16c = v347;
  v246 = r2_8a;
  v248 = r2_16a;
  v251 = v274;
LABEL_295:
  v450.origin.x = v343;
  v450.origin.y = rect_16c;
  v450.size.width = v246;
  v450.size.height = v248;
  v276 = v251 + v279 - CGRectGetMaxY(v450);
  if (v134)
  {
LABEL_296:
    rect_16d = v276;
    v344 = v277;
    -[UIView frameForAlignmentRect:](self->_imageView, "frameForAlignmentRect:", r2b, v371, v204, v362);
    r2b = v280;
    v282 = v281;
    v362 = v284;
    v365 = v283;
    goto LABEL_300;
  }
  rect_16d = v276;
  v344 = v277;
LABEL_299:
  v282 = v371;
LABEL_300:
  v451.origin.x = recta;
  v451.origin.y = rect_24a;
  v451.size.width = v334;
  v451.size.height = r1a;
  v457.origin.x = rect_8a;
  v457.origin.y = v347;
  v457.size.width = r2_8a;
  v457.size.height = r2_16a;
  v458 = CGRectUnion(v451, v457);
  v452.origin.x = r2b;
  v452.origin.y = v282;
  v452.size.width = v365;
  v452.size.height = v362;
  v453 = CGRectUnion(v452, v458);
  if (v306 >= v453.size.width)
    v285 = v306;
  else
    v285 = v453.size.width;
  if (v40)
    v285 = v306;
  *(_QWORD *)&retstr->var7 = 0;
  if (v302 >= v453.size.height)
    v286 = v302;
  else
    v286 = v453.size.height;
  retstr->var0.origin.x = v338;
  retstr->var0.origin.y = r2_24a;
  if (v118)
    v286 = v302;
  retstr->var0.size.width = v368;
  retstr->var0.size.height = v311;
  retstr->var1.width = v285;
  retstr->var1.height = v286;
  retstr->var2.origin.x = r2b;
  retstr->var2.origin.y = v282;
  retstr->var2.size.width = v365;
  retstr->var2.size.height = v362;
  retstr->var3.origin.x = v315;
  retstr->var3.origin.y = v205;
  retstr->var3.size.width = v317;
  retstr->var3.size.height = v319;
  retstr->var4.origin.x = recta;
  retstr->var4.origin.y = rect_24a;
  retstr->var4.size.width = v334;
  retstr->var4.size.height = r1a;
  retstr->var5.origin.x = rect_8a;
  retstr->var5.origin.y = v347;
  retstr->var5.size.width = r2_8a;
  retstr->var5.size.height = r2_16a;
  retstr->var6.var0 = v344;
  retstr->var6.var1 = rect_16d;
  if (v121)
    v287 = 8;
  else
    v287 = 0;
  if (v134)
    v288 = 3;
  else
    v288 = 1;
  *(_BYTE *)&retstr->var7 = v287 | v288 | (4 * (v19 != 0)) | (16 * (v345 != 0)) | (32 * (v337 != 0));

  return result;
}

- (void)_updateTitleLabelWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  unint64_t v8;
  NSObject *v9;
  UIButton *v10;
  NSObject *v11;
  UIButton *button;
  int v13;
  UIButton *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "_resolvedTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[UIButtonConfigurationVisualProvider titleViewCreateIfNeeded:](self, "titleViewCreateIfNeeded:", 1);
    if (!self->_titleLabel)
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        {
          button = self->_button;
          v13 = 138412290;
          v14 = button;
          _os_log_fault_impl(&dword_185066000, v11, OS_LOG_TYPE_FAULT, "UIKIT INTERNAL ERROR: Failed to create a title label for configuration based button %@", (uint8_t *)&v13, 0xCu);
        }

      }
      else
      {
        v8 = _updateTitleLabelWithConfiguration____s_category;
        if (!_updateTitleLabelWithConfiguration____s_category)
        {
          v8 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v8, (unint64_t *)&_updateTitleLabelWithConfiguration____s_category);
        }
        v9 = *(NSObject **)(v8 + 8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v10 = self->_button;
          v13 = 138412290;
          v14 = v10;
          _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "UIKIT INTERNAL ERROR: Failed to create a title label for configuration based button %@", (uint8_t *)&v13, 0xCu);
        }
      }
    }
    -[UIButtonConfigurationVisualProvider effectiveContentView](self, "effectiveContentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", self->_titleLabel);

    -[UILabel setAttributedText:](self->_titleLabel, "setAttributedText:", v5);
    -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", objc_msgSend(v4, "_hasMultilineTitle") ^ 1);
    -[UILabel setLineBreakMode:](self->_titleLabel, "setLineBreakMode:", objc_msgSend(v4, "titleLineBreakMode"));
  }
  else
  {
    -[UIView removeFromSuperview](self->_titleLabel, "removeFromSuperview");
  }

}

- (void)_updateSubtitleLabelWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  unint64_t v8;
  NSObject *v9;
  UIButton *v10;
  UILabel *v11;
  UILabel *subtitleLabel;
  NSObject *v13;
  UIButton *button;
  int v15;
  UIButton *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "_resolvedSubtitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[UIButtonConfigurationVisualProvider subtitleViewCreateIfNeeded:](self, "subtitleViewCreateIfNeeded:", 1);
    if (!self->_subtitleLabel)
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        {
          button = self->_button;
          v15 = 138412290;
          v16 = button;
          _os_log_fault_impl(&dword_185066000, v13, OS_LOG_TYPE_FAULT, "UIKIT INTERNAL ERROR: Failed to create a subtitle label for configuration based button %@", (uint8_t *)&v15, 0xCu);
        }

      }
      else
      {
        v8 = _updateSubtitleLabelWithConfiguration____s_category;
        if (!_updateSubtitleLabelWithConfiguration____s_category)
        {
          v8 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v8, (unint64_t *)&_updateSubtitleLabelWithConfiguration____s_category);
        }
        v9 = *(NSObject **)(v8 + 8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v10 = self->_button;
          v15 = 138412290;
          v16 = v10;
          _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "UIKIT INTERNAL ERROR: Failed to create a subtitle label for configuration based button %@", (uint8_t *)&v15, 0xCu);
        }
      }
      if (!self->_subtitleLabel)
      {
        v11 = (UILabel *)objc_opt_new();
        subtitleLabel = self->_subtitleLabel;
        self->_subtitleLabel = v11;

      }
    }
    -[UIButtonConfigurationVisualProvider effectiveContentView](self, "effectiveContentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", self->_subtitleLabel);

    -[UILabel setAttributedText:](self->_subtitleLabel, "setAttributedText:", v5);
    -[UILabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", objc_msgSend(v4, "_hasMultilineSubtitle") ^ 1);
    -[UILabel setLineBreakMode:](self->_subtitleLabel, "setLineBreakMode:", objc_msgSend(v4, "subtitleLineBreakMode"));
  }
  else
  {
    -[UIView removeFromSuperview](self->_subtitleLabel, "removeFromSuperview");
  }

}

- (void)_updateProgressIndicatorWithConfiguration:(id)a3
{
  UIActivityIndicatorView *v4;
  UIActivityIndicatorView *progressIndicatorView;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if ((objc_msgSend(v8, "showsActivityIndicator") & 1) != 0)
  {
    -[UIView removeFromSuperview](self->_imageView, "removeFromSuperview");
    if (!self->_progressIndicatorView)
    {
      v4 = -[UIActivityIndicatorView initWithActivityIndicatorStyle:]([UIActivityIndicatorView alloc], "initWithActivityIndicatorStyle:", 16);
      progressIndicatorView = self->_progressIndicatorView;
      self->_progressIndicatorView = v4;

    }
    objc_msgSend(v8, "_resolvedActivityIndicatorSize");
    UIRoundToViewScale(self->_button);
    -[UIActivityIndicatorView _setCustomWidth:](self->_progressIndicatorView, "_setCustomWidth:");
    -[UIActivityIndicatorView startAnimating](self->_progressIndicatorView, "startAnimating");
    -[UIButtonConfigurationVisualProvider effectiveContentView](self, "effectiveContentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", self->_progressIndicatorView);

    objc_msgSend(v8, "_resolvedActivityIndicatorColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIActivityIndicatorView setColor:](self->_progressIndicatorView, "setColor:", v7);

  }
  else
  {
    -[UIView removeFromSuperview](self->_progressIndicatorView, "removeFromSuperview");
  }

}

- (void)_updateIndicatorWithConfiguration:(id)a3
{
  void *v4;
  UIImageView *indicatorView;
  UIImageView *v6;
  UIImageView *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "_resolvedIndicator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  indicatorView = self->_indicatorView;
  if (v4)
  {
    if (!indicatorView)
    {
      v6 = (UIImageView *)objc_opt_new();
      v7 = self->_indicatorView;
      self->_indicatorView = v6;

    }
    -[UIButtonConfigurationVisualProvider effectiveContentView](self, "effectiveContentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", self->_indicatorView);

    -[UIImageView setImage:](self->_indicatorView, "setImage:", v4);
    objc_msgSend(v11, "_resolvedIndicatorSymbolConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setPreferredSymbolConfiguration:](self->_indicatorView, "setPreferredSymbolConfiguration:", v9);

    objc_msgSend(v11, "_resolvedIndicatorColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setTintColor:](self->_indicatorView, "setTintColor:", v10);

  }
  else
  {
    -[UIView removeFromSuperview](indicatorView, "removeFromSuperview");
  }

}

- (void)_updateImageViewWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  UIImageView *imageView;
  void *v12;
  unint64_t v13;
  NSObject *v14;
  UIButton *v15;
  NSObject *v16;
  UIButton *button;
  int v18;
  UIButton *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "_resolvedImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[UIButtonConfigurationVisualProvider imageViewCreateIfNeeded:](self, "imageViewCreateIfNeeded:", 1);
    if (!self->_imageView)
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        {
          button = self->_button;
          v18 = 138412290;
          v19 = button;
          _os_log_fault_impl(&dword_185066000, v16, OS_LOG_TYPE_FAULT, "UIKIT INTERNAL ERROR: Failed to create an image view for configuration based button %@", (uint8_t *)&v18, 0xCu);
        }

      }
      else
      {
        v13 = _updateImageViewWithConfiguration____s_category;
        if (!_updateImageViewWithConfiguration____s_category)
        {
          v13 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v13, (unint64_t *)&_updateImageViewWithConfiguration____s_category);
        }
        v14 = *(NSObject **)(v13 + 8);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v15 = self->_button;
          v18 = 138412290;
          v19 = v15;
          _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_ERROR, "UIKIT INTERNAL ERROR: Failed to create an image view for configuration based button %@", (uint8_t *)&v18, 0xCu);
        }
      }
    }
    -[UIButtonConfigurationVisualProvider effectiveContentView](self, "effectiveContentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", self->_imageView);

    -[UIImageView setImage:](self->_imageView, "setImage:", v5);
    objc_msgSend(v4, "_resolvedSymbolConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setPreferredSymbolConfiguration:](self->_imageView, "setPreferredSymbolConfiguration:", v8);

    objc_msgSend(v4, "_resolvedImageColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setTintColor:](self->_imageView, "setTintColor:", v9);

    if (-[UIControl _allowsSymbolAnimations](self->_button, "_allowsSymbolAnimations"))
    {
      v10 = -[UIControl state](self->_button, "state");
      imageView = self->_imageView;
      objc_msgSend(MEMORY[0x1E0CE8700], "scaleDownEffect");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v10 & 1) != 0)
        -[UIImageView addSymbolEffect:](imageView, "addSymbolEffect:", v12);
      else
        -[UIImageView removeSymbolEffectOfType:](imageView, "removeSymbolEffectOfType:", v12);

    }
  }
  else
  {
    -[UIView removeFromSuperview](self->_imageView, "removeFromSuperview");
  }

}

- (id)effectiveContentView
{
  return self->_button;
}

- (id)titleViewCreateIfNeeded:(BOOL)a3
{
  UILabel *v4;
  UILabel *titleLabel;

  if (a3 && !self->_titleLabel)
  {
    v4 = (UILabel *)objc_opt_new();
    titleLabel = self->_titleLabel;
    self->_titleLabel = v4;

  }
  return self->_titleLabel;
}

- (void)_applyButtonValuesToConfiguration:(id)a3
{
  id v4;
  UIControlState v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[UIControl state](self->_button, "state");
  -[UIButton _attributedTitleForState:](self->_button, "_attributedTitleForState:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v4, "setAttributedTitle:", v6);
  }
  else
  {
    -[UIButton _titleForState:](self->_button, "_titleForState:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton _titleColorForState:](self->_button, "_titleColorForState:", v5);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v7)
    {
      if (v8)
      {
        v10 = objc_alloc(MEMORY[0x1E0CB3498]);
        v15 = *(_QWORD *)off_1E1678D98;
        v16[0] = v9;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v10, "initWithString:attributes:", v7, v11);
        objc_msgSend(v4, "setAttributedTitle:", v12);

      }
      else
      {
        objc_msgSend(v4, "setTitle:", v7);
      }
    }

  }
  -[UIButton _imageForState:applyingConfiguration:usesImageForNormalState:](self->_button, "_imageForState:applyingConfiguration:usesImageForNormalState:", v5, 0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v4, "setImage:", v13);
    if (objc_msgSend(v13, "isSymbolImage"))
    {
      -[UIButton _preferredConfigurationForState:includeDefault:](self->_button, "_preferredConfigurationForState:includeDefault:", v5, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
        objc_msgSend(v4, "setPreferredSymbolConfigurationForImage:", v14);

    }
  }

}

- (id)imageViewCreateIfNeeded:(BOOL)a3
{
  UIImageView *v4;
  UIImageView *imageView;

  if (a3 && !self->_imageView)
  {
    v4 = (UIImageView *)objc_opt_new();
    imageView = self->_imageView;
    self->_imageView = v4;

  }
  return self->_imageView;
}

- (CGRect)_layoutBounds
{
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  double v7;
  double v8;
  double widthForMultilineTextLayout;
  double v10;
  CGRect result;

  if (!-[UIView _wantsAutolayout](self->_button, "_wantsAutolayout"))
    goto LABEL_5;
  -[UIView superview](self->_button, "superview");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3
    || (v4 = (void *)v3,
        -[UIView superview](self->_button, "superview"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "_is_needsLayout"),
        v5,
        v4,
        v6))
  {
    v7 = *MEMORY[0x1E0C9D538];
    v8 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    widthForMultilineTextLayout = self->_widthForMultilineTextLayout;
    v10 = 0.0;
  }
  else
  {
LABEL_5:
    -[UIView bounds](self->_button, "bounds");
  }
  result.size.height = v10;
  result.size.width = widthForMultilineTextLayout;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (void)setNeedsUpdateConfiguration
{
  *(_BYTE *)&self->_flags |= 1u;
  -[UIButton setNeedsLayout](self->_button, "setNeedsLayout");
}

- (void)setWidthForMultilineTextLayout:(double)a3
{
  self->_widthForMultilineTextLayout = a3;
}

- (void)automaticallyUpdateConfigurationIfNecessary:(id)a3
{
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = -[UIButton automaticallyUpdatesConfiguration](self->_button, "automaticallyUpdatesConfiguration");
  v6 = v9;
  if (v5)
  {
    objc_msgSend(v9, "_updateFromButton:", self->_button);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIButtonConfigurationVisualProvider.m"), 747, CFSTR("Updated configuration was nil for configuration: %@"), v9);

    }
    -[UIButton _setCurrentConfiguration:](self->_button, "_setCurrentConfiguration:", v7);

    v6 = v9;
  }

}

+ (BOOL)shouldUpdateContextMenuEnabledOnMenuChanges
{
  return 1;
}

- (void)setTitle:(id)a3 forState:(unint64_t)a4
{
  -[UIButton setNeedsUpdateConfiguration](self->_button, "setNeedsUpdateConfiguration", a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_progressIndicatorView, 0);
  objc_storeStrong((id *)&self->_indicatorView, 0);
}

- (void)dealloc
{
  objc_super v3;

  _unregisterAccessibilityNotifications((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)UIButtonConfigurationVisualProvider;
  -[UIButtonConfigurationVisualProvider dealloc](&v3, sel_dealloc);
}

+ (id)visualProviderForButton:(id)a3
{
  _BYTE *v3;

  v3 = (_BYTE *)objc_opt_new();
  v3[248] |= 1u;
  return v3;
}

- (UIButtonConfigurationVisualProvider)init
{
  UIButtonConfigurationVisualProvider *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIButtonConfigurationVisualProvider;
  v2 = -[UIButtonConfigurationVisualProvider init](&v5, sel_init);
  if (v2 && objc_msgSend((id)objc_opt_class(), "wantsConfigurationUpdateForButtonShapes"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_accessibilityButtonShapesChangedToken = objc_msgSend(v3, "_addObserver:selector:name:object:options:", v2, sel__accessibilityButtonShapesChangedNotification_, CFSTR("UIAccessibilityButtonShapesEnabledStatusDidChangeNotification"), 0, 0);

  }
  return v2;
}

+ (BOOL)wantsConfigurationUpdateForButtonShapes
{
  return 1;
}

- (void)updateBaselineInformationDependentOnBounds
{
  void *v3;
  double v4;
  double v5;
  double v6;

  if (self->_vendsBaselineInformationToAutoLayout)
  {
    -[UIView _layoutEngine](self->_button, "_layoutEngine");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[UIButtonConfigurationVisualProvider _layoutDataInBounds:](self, "_layoutDataInBounds:", -[UIView _nsis_compatibleBoundsInEngine:](self->_button, v3));
      v4 = v5;
      if (v5 != self->_previousFirstBaselineOffsetForAttributeLowering
        || (v4 = v6, v6 != self->_previousLastBaselineOffsetForAttributeLowering))
      {
        -[UIView _invalidateBaselineConstraints](self->_button, "_invalidateBaselineConstraints", v4);
      }
    }

  }
}

- (double)widthForMultilineTextLayout
{
  return self->_widthForMultilineTextLayout;
}

- (BOOL)hasBaseline
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v7;
  void *v8;

  -[UIButtonConfigurationVisualProvider updateConfigurationIfNecessary](self, "updateConfigurationIfNecessary");
  -[UIButton _currentConfiguration](self->_button, "_currentConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 || (objc_msgSend(v3, "showsActivityIndicator") & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "attributedTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
    {
      v5 = 1;
    }
    else
    {
      objc_msgSend(v3, "attributedSubtitle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v8, "length") != 0;

    }
  }

  return v5;
}

- (id)subtitleViewCreateIfNeeded:(BOOL)a3
{
  UILabel *v4;
  UILabel *subtitleLabel;

  if (a3 && !self->_subtitleLabel)
  {
    v4 = (UILabel *)objc_opt_new();
    subtitleLabel = self->_subtitleLabel;
    self->_subtitleLabel = v4;

  }
  return self->_subtitleLabel;
}

- (void)cleanupForVisualProvider:(id)a3
{
  -[UIView removeFromSuperview](self->_backgroundView, "removeFromSuperview", a3);
  -[UIView removeFromSuperview](self->_imageView, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_titleLabel, "removeFromSuperview");
  -[UIView removeFromSuperview](self->_subtitleLabel, "removeFromSuperview");
  _unregisterAccessibilityNotifications((uint64_t)self);
}

- (void)setPreferredSymbolConfiguration:(id)a3 forImageInState:(unint64_t)a4
{
  -[UIButton setNeedsUpdateConfiguration](self->_button, "setNeedsUpdateConfiguration", a3, a4);
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  -[UIButton setNeedsUpdateConfiguration](self->_button, "setNeedsUpdateConfiguration", a3, a4);
}

- (BOOL)isOn
{
  return 1;
}

- (void)_accessibilityButtonShapesChangedNotification:(id)a3
{
  -[UIButton setNeedsUpdateConfiguration](self->_button, "setNeedsUpdateConfiguration", a3);
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __93__UIButtonConfigurationVisualProvider_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
  v5[3] = &unk_1E16B5118;
  v5[4] = self;
  +[UIContextMenuConfiguration configurationWithIdentifier:previewProvider:actionProvider:](UIContextMenuConfiguration, "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __93__UIButtonConfigurationVisualProvider_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  uint64_t v7;
  unint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  _QWORD v18[5];
  void *v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 280), "menu");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 280), "_menuProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 280), "_menuProvider");
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, id))v6)[2](v6, *(_QWORD *)(a1 + 32), v3);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
    if (!v7)
    {
      if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 280), "showsMenuAsPrimaryAction"))
      {
        if (os_variant_has_internal_diagnostics())
        {
          __UIFaultDebugAssertLog();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
          {
            v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 280);
            *(_DWORD *)buf = 138412290;
            v21 = v17;
            _os_log_fault_impl(&dword_185066000, v16, OS_LOG_TYPE_FAULT, "Client configured a button (%@) with a menuProvider and contextMenuIsPrimary=YES, but failed to return a menu, Substituting a dummy menu.", buf, 0xCu);
          }

        }
        else
        {
          v9 = _UIInternalPreference_LabelDisableDefaultClipping_block_invoke___s_category_0;
          if (!_UIInternalPreference_LabelDisableDefaultClipping_block_invoke___s_category_0)
          {
            v9 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v9, (unint64_t *)&_UIInternalPreference_LabelDisableDefaultClipping_block_invoke___s_category_0);
          }
          v10 = *(NSObject **)(v9 + 8);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 280);
            *(_DWORD *)buf = 138412290;
            v21 = v11;
            _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "Client configured a button (%@) with a menuProvider and contextMenuIsPrimary=YES, but failed to return a menu, Substituting a dummy menu.", buf, 0xCu);
          }
        }
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 280), "titleForState:", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 280), "imageForState:", 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __93__UIButtonConfigurationVisualProvider_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_11;
        v18[3] = &unk_1E16B2C10;
        v18[4] = *(_QWORD *)(a1 + 32);
        +[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v12, v13, 0, v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = v14;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIMenu menuWithChildren:](UIMenu, "menuWithChildren:", v15);
        v4 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v4 = 0;
      }
    }
  }

  return v4;
}

uint64_t __93__UIButtonConfigurationVisualProvider_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_11(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 280), "sendActionsForControlEvents:", 64);
}

- (CGPoint)menuAttachmentPointForConfiguration:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGPoint result;

  _UIControlMenuSupportTargetedPreviewOverViews(self->_button, self->_titleLabel, self->_imageView);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "target");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "container");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  objc_msgSend(v3, "target");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "center");
  v13 = round(v12 - v10 * 0.5);
  v15 = round(v14 - v8 * 0.5);
  objc_msgSend(v5, "_window");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convertRect:toView:", v16, v15, v13, v8, v10);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  objc_msgSend(v5, "_window");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = _UIControlMenuAttachmentPointForRectInContainer(v25, v18, v20, v22, v24);
  v28 = v27;

  v29 = v26;
  v30 = v28;
  result.y = v30;
  result.x = v29;
  return result;
}

- (void)contextMenuInteraction:(id)a3 updateStyleForMenuWithConfiguration:(id)a4 style:(id)a5
{
  UIButton *button;
  UILabel *titleLabel;
  UIImageView *imageView;
  id v10;
  id v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  id v16;

  if (a5)
  {
    button = self->_button;
    titleLabel = self->_titleLabel;
    imageView = self->_imageView;
    v10 = a5;
    v11 = a4;
    _UIControlMenuSupportTargetedPreviewOverViews(button, titleLabel, imageView);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    -[UIButton menuAttachmentPointForConfiguration:](self->_button, "menuAttachmentPointForConfiguration:", v11);
    v13 = v12;
    v15 = v14;

    _UIControlMenuSupportUpdateStyle(v10, self->_button, v16, v13, v15);
  }
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  return _UIControlMenuSupportTargetedPreviewOverViews(self->_button, self->_titleLabel, self->_imageView);
}

- (id)contextMenuInteraction:(id)a3 previewForDismissingMenuWithConfiguration:(id)a4
{
  return _UIControlMenuSupportTargetedPreviewOverViews(self->_button, self->_titleLabel, self->_imageView);
}

- (CGRect)visualBoundsWithCornerRadius:(double *)a3
{
  void *v5;
  void *v6;
  void *v7;
  UIUserInterfaceLayoutDirection v8;
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
  double v21;
  double v22;
  double v23;
  double currentlyAppliedCornerRadius;
  double v25;
  double v26;
  double v27;
  double v28;
  _UISystemBackgroundView *backgroundView;
  double y;
  double x;
  double height;
  double width;
  void *progressIndicatorView;
  void *v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  int v40;
  void *v41;
  uint64_t v42;
  _BOOL4 v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  void *v48;
  uint64_t v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  void *v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  UIUserInterfaceLayoutDirection v59;
  _BOOL4 v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
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
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect result;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;

  +[_UIPointerSettingsDomain rootSettings](_UIPointerSettingsDomain, "rootSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "buttonSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIButton _currentConfiguration](self->_button, "_currentConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "_isRoundButton"))
  {
    if (objc_msgSend(v7, "_hasObscuringBackground"))
    {
      -[UIView frame](self->_backgroundView, "frame");
      v17 = v25;
      v19 = v26;
      v21 = v27;
      v23 = v28;
      backgroundView = self->_backgroundView;
      if (backgroundView)
      {
        currentlyAppliedCornerRadius = backgroundView->_currentlyAppliedCornerRadius;
        if (!a3)
          goto LABEL_30;
      }
      else
      {
        currentlyAppliedCornerRadius = 0.0;
        if (!a3)
          goto LABEL_30;
      }
      goto LABEL_29;
    }
    x = *MEMORY[0x1E0C9D628];
    y = *(double *)(MEMORY[0x1E0C9D628] + 8);
    width = *(double *)(MEMORY[0x1E0C9D628] + 16);
    height = *(double *)(MEMORY[0x1E0C9D628] + 24);
    if (objc_msgSend(v7, "showsActivityIndicator"))
    {
      progressIndicatorView = self->_progressIndicatorView;
    }
    else
    {
      objc_msgSend(v7, "_resolvedImage");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v35)
      {
        v40 = 0;
LABEL_15:
        objc_msgSend(v7, "_resolvedTitle");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v41, "length");
        v43 = v42 != 0;

        if (v42)
        {
          -[UIView frame](self->_titleLabel, "frame");
          v99.origin.x = v44;
          v99.origin.y = v45;
          v99.size.width = v46;
          v99.size.height = v47;
          v91.origin.x = x;
          v91.origin.y = y;
          v91.size.width = width;
          v91.size.height = height;
          v92 = CGRectUnion(v91, v99);
          x = v92.origin.x;
          y = v92.origin.y;
          width = v92.size.width;
          height = v92.size.height;
        }
        objc_msgSend(v7, "_resolvedSubtitle");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v48, "length");

        if (v49)
        {
          -[UIView frame](self->_subtitleLabel, "frame");
          v100.origin.x = v50;
          v100.origin.y = v51;
          v100.size.width = v52;
          v100.size.height = v53;
          v93.origin.x = x;
          v93.origin.y = y;
          v93.size.width = width;
          v93.size.height = height;
          v94 = CGRectUnion(v93, v100);
          x = v94.origin.x;
          y = v94.origin.y;
          width = v94.size.width;
          height = v94.size.height;
          v43 = 1;
        }
        objc_msgSend(v7, "_resolvedIndicator");
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        if (v54)
        {
          -[UIView frame](self->_indicatorView, "frame");
          v101.origin.x = v55;
          v101.origin.y = v56;
          v101.size.width = v57;
          v101.size.height = v58;
          v95.origin.x = x;
          v95.origin.y = y;
          v95.size.width = width;
          v95.size.height = height;
          v96 = CGRectUnion(v95, v101);
          x = v96.origin.x;
          y = v96.origin.y;
          width = v96.size.width;
          height = v96.size.height;
          v40 = 1;
        }
        v59 = -[UIView effectiveUserInterfaceLayoutDirection](self->_button, "effectiveUserInterfaceLayoutDirection");
        if ((v40 & v43) == 1)
        {
          v60 = v59 == UIUserInterfaceLayoutDirectionRightToLeft;
          objc_msgSend(v6, "mixedButtonOutsetLeading");
          v88 = v61;
          objc_msgSend(v6, "mixedButtonOutsetTrailing");
          v63 = v62;
          objc_msgSend(v6, "mixedButtonOutsetTop");
          v65 = v64;
          objc_msgSend(v6, "mixedButtonOutsetBottom");
          v67 = v66;
          objc_msgSend(v6, "mixedButtonMinWidth");
          v69 = v68;
          objc_msgSend(v6, "mixedButtonMinHeight");
        }
        else if (v40)
        {
          v60 = v59 == UIUserInterfaceLayoutDirectionRightToLeft;
          objc_msgSend(v6, "imageButtonOutsetLeading");
          v88 = v70;
          objc_msgSend(v6, "imageButtonOutsetTrailing");
          v63 = v71;
          objc_msgSend(v6, "imageButtonOutsetTop");
          v65 = v72;
          objc_msgSend(v6, "imageButtonOutsetBottom");
          v67 = v73;
          objc_msgSend(v6, "imageButtonMinWidth");
          v69 = v74;
          objc_msgSend(v6, "imageButtonMinHeight");
        }
        else
        {
          if (!v43)
          {
            -[UIView bounds](self->_button, "bounds");
LABEL_28:
            v17 = v80;
            v19 = v81;
            v21 = v82;
            v23 = v83;
            currentlyAppliedCornerRadius = -1.0;
            if (!a3)
              goto LABEL_30;
LABEL_29:
            *a3 = currentlyAppliedCornerRadius;
            goto LABEL_30;
          }
          v60 = v59 == UIUserInterfaceLayoutDirectionRightToLeft;
          objc_msgSend(v6, "textButtonOutsetLeading");
          v88 = v75;
          objc_msgSend(v6, "textButtonOutsetTrailing");
          v63 = v76;
          objc_msgSend(v6, "textButtonOutsetTop");
          v65 = v77;
          objc_msgSend(v6, "textButtonOutsetBottom");
          v67 = v78;
          objc_msgSend(v6, "textButtonMinWidth");
          v69 = v79;
          objc_msgSend(v6, "textButtonMinHeight");
        }
        v80 = __outsetRectWithMinimumSize(v60, 0, x, y, width, height, v88, v63, v65, v67, v69);
        goto LABEL_28;
      }
      progressIndicatorView = self->_imageView;
    }
    objc_msgSend(progressIndicatorView, "frame");
    v98.origin.x = v36;
    v98.origin.y = v37;
    v98.size.width = v38;
    v98.size.height = v39;
    v89.origin.x = x;
    v89.origin.y = y;
    v89.size.width = width;
    v89.size.height = height;
    v90 = CGRectUnion(v89, v98);
    x = v90.origin.x;
    y = v90.origin.y;
    width = v90.size.width;
    height = v90.size.height;
    v40 = 1;
    goto LABEL_15;
  }
  v8 = -[UIView effectiveUserInterfaceLayoutDirection](self->_button, "effectiveUserInterfaceLayoutDirection");
  v9 = 0.0;
  if ((objc_msgSend(v7, "_hasObscuringBackground") & 1) == 0)
  {
    objc_msgSend(v6, "roundButtonOutset");
    v9 = v10;
  }
  objc_msgSend(v6, "roundButtonMinSize");
  v12 = v11;
  -[UIView bounds](self->_button, "bounds");
  v17 = __outsetRectWithMinimumSize(v8 == UIUserInterfaceLayoutDirectionRightToLeft, 1, v13, v14, v15, v16, v9, v9, v9, v9, v12);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  currentlyAppliedCornerRadius = v20 * 0.5;
  if (a3)
    goto LABEL_29;
LABEL_30:

  v84 = v17;
  v85 = v19;
  v86 = v21;
  v87 = v23;
  result.size.height = v87;
  result.size.width = v86;
  result.origin.y = v85;
  result.origin.x = v84;
  return result;
}

- (id)pointerEffectPreviewParameters
{
  void *v3;
  void *v4;
  int v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  -[UIButton _currentConfiguration](self->_button, "_currentConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_hasObscuringBackground");

  if (v5)
  {
    -[_UISystemBackgroundView currentVisiblePathInContainerView:](self->_backgroundView, "currentVisiblePathInContainerView:", self->_button);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setShadowPath:", v6);

  }
  return v3;
}

- (id)pointerEffectWithPreview:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[UIButton _currentConfiguration](self->_button, "_currentConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_hasObscuringBackground");

  if (v7)
    v5 = (void *)objc_opt_class();
  objc_msgSend(v5, "effectWithPreview:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)pointerShapeInContainer:(id)a3 proposal:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  id v11;
  double v13;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v7 || ((*((void (**)(id))v7 + 2))(v7), (v9 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v13 = 0.0;
    -[UIButtonConfigurationVisualProvider visualBoundsWithCornerRadius:](self, "visualBoundsWithCornerRadius:", &v13);
    v10 = v13;
    -[UIView convertRect:toView:](self->_button, "convertRect:toView:", v6);
    if (v10 >= 0.0)
      +[UIPointerShape shapeWithRoundedRect:cornerRadius:](UIPointerShape, "shapeWithRoundedRect:cornerRadius:");
    else
      +[UIPointerShape shapeWithRoundedRect:](UIPointerShape, "shapeWithRoundedRect:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = v9;

  return v11;
}

- (id)preferredHoverEffect
{
  void *v2;
  int v3;
  void *v4;

  -[UIButton _currentConfiguration](self->_button, "_currentConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_hasObscuringBackground");

  if (v3)
  {
    +[UIHoverLiftEffect effect](UIHoverLiftEffect, "effect");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)preferredHoverShape
{
  return -[_UISystemBackgroundView shapeInContainerView:](self->_backgroundView, "shapeInContainerView:", self->_button);
}

- (id)defaultFocusEffect
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  _UISystemBackgroundView *backgroundView;

  if (-[UIView isDescendantOfView:](self->_backgroundView, "isDescendantOfView:", self->_button)
    && (-[UIButton _currentConfiguration](self->_button, "_currentConfiguration"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "_hasObscuringBackground"),
        v3,
        v4))
  {
    -[_UISystemBackgroundView currentVisiblePathInContainerView:](self->_backgroundView, "currentVisiblePathInContainerView:", self->_button);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      +[UIFocusHaloEffect effectWithPath:](UIFocusHaloEffect, "effectWithPath:", v5);
    }
    else
    {
      backgroundView = self->_backgroundView;
      -[UIView bounds](backgroundView, "bounds");
      -[UIView convertRect:toView:](backgroundView, "convertRect:toView:", self->_button);
      +[UIFocusHaloEffect effectWithRect:](UIFocusHaloEffect, "effectWithRect:");
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setReferenceView:", self->_backgroundView);

  }
  else
  {
    -[UIView bounds](self->_button, "bounds");
    +[UIFocusHaloEffect effectWithRect:](UIFocusHaloEffect, "effectWithRect:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "setContainerView:", self->_button);
  return v6;
}

- (double)focusSizeIncrease
{
  return 2.22507386e-308;
}

- (void)setRole:(int64_t)a3
{
  -[UIButton setNeedsUpdateConfiguration](self->_button, "setNeedsUpdateConfiguration", a3);
}

- (id)backgroundViewCreateIfNeeded:(BOOL)a3
{
  return self->_backgroundView;
}

- (id)imageEffectContainerView
{
  return -[UIButton imageView](self->_button, "imageView");
}

- (id)contentBackdropView
{
  return 0;
}

- (id)selectionIndicatorView
{
  return 0;
}

- (CGRect)imageRectForContentRect:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (BOOL)useTitleForSelectedIndicatorBounds
{
  return 0;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v5;
  UIButton *button;
  uint64_t v7;
  void *v8;
  UIButton *v9;
  UIButton *v10;
  id v11;

  v5 = a3;
  button = self->_button;
  v11 = v5;
  objc_msgSend(v5, "previouslyFocusedView");
  v7 = objc_claimAutoreleasedReturnValue();
  if (button == (UIButton *)v7)
  {

LABEL_5:
    -[UIButton setNeedsUpdateConfiguration](self->_button, "setNeedsUpdateConfiguration");
    goto LABEL_6;
  }
  v8 = (void *)v7;
  v9 = self->_button;
  objc_msgSend(v11, "nextFocusedView");
  v10 = (UIButton *)objc_claimAutoreleasedReturnValue();

  if (v9 == v10)
    goto LABEL_5;
LABEL_6:

}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (id)preferredConfigurationForFocusAnimation:(int64_t)a3 inContext:(id)a4
{
  return 0;
}

- (id)viewForFirstBaselineLayout
{
  return self->_button;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)baselineOffsetsAtSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  BOOL v9;
  $AED0C895A02F00D9693E1209E5F42816 baselineOffsets;
  BOOL v11;
  BOOL v12;
  void *v13;
  double lastFromBottom;
  $AED0C895A02F00D9693E1209E5F42816 v15;
  $AED0C895A02F00D9693E1209E5F42816 v16;
  $AED0C895A02F00D9693E1209E5F42816 v17;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  height = a3.height;
  width = a3.width;
  -[UIButtonConfigurationVisualProvider updateConfigurationIfNecessary](self, "updateConfigurationIfNecessary");
  -[UIView bounds](self->_button, "bounds");
  v9 = width != 0.0 && width == v6 && height == v7;
  if (!v9 || height == 0.0)
  {
    if ((*(_BYTE *)&self->_layoutData.flags & 1) != 0
      && (width == *MEMORY[0x1E0C9D820] ? (v11 = height == *(double *)(MEMORY[0x1E0C9D820] + 8)) : (v11 = 0),
          v11
       && (self->_layoutData.idealSize.width == self->_layoutData.buttonBounds.size.width
         ? (v12 = self->_layoutData.idealSize.height == self->_layoutData.buttonBounds.size.height)
         : (v12 = 0),
           v12)))
    {
      baselineOffsets = self->_layoutData.baselineOffsets;
    }
    else if (-[UIView _wantsAutolayout](self->_button, "_wantsAutolayout")
           && ((-[UIButton _activeSizeToFitLayoutEngine](self->_button, "_activeSizeToFitLayoutEngine"),
                (v13 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
            || (-[UIView _layoutEngine](self->_button, "_layoutEngine"),
                (v13 = (void *)objc_claimAutoreleasedReturnValue()) != 0)))
    {
      -[UIButtonConfigurationVisualProvider _layoutDataInBounds:](self, "_layoutDataInBounds:", -[UIView _nsis_compatibleBoundsInEngine:](self->_button, v13));

      baselineOffsets = v16;
    }
    else
    {
      -[UIButtonConfigurationVisualProvider _layoutDataInBounds:](self, "_layoutDataInBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), width, height);
      baselineOffsets = v15;
    }
  }
  else
  {
    -[UIButtonConfigurationVisualProvider _layoutDataUpdatingIfNecessary](self, "_layoutDataUpdatingIfNecessary");
    baselineOffsets = v17;
  }
  lastFromBottom = baselineOffsets.lastFromBottom;
  result.var0 = baselineOffsets.firstFromTop;
  result.var1 = lastFromBottom;
  return result;
}

- (void)setContentHorizontalAlignment:(int64_t)a3
{
  -[UIButton setNeedsUpdateConfiguration](self->_button, "setNeedsUpdateConfiguration", a3);
}

- (void)setContentVerticalAlignment:(int64_t)a3
{
  -[UIButton setNeedsUpdateConfiguration](self->_button, "setNeedsUpdateConfiguration", a3);
}

- (void)_executeConfigurationUpdate
{
  void *v3;
  void *v4;
  UIButton *button;
  void *v6;
  uint64_t v7;
  void *v8;
  char *v9;
  _BYTE v10[352];
  _BYTE __dst[352];
  _OWORD __src[22];

  v3 = (void *)_UISetCurrentFallbackEnvironment(self->_button);
  memset(__src, 0, sizeof(__src));
  _UIBeginTrackingTraitUsage(self->_button, 0, __src);
  -[UIButton _currentConfiguration](self->_button, "_currentConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[UIButtonConfigurationVisualProvider _applyButtonValuesToConfiguration:](self, "_applyButtonValuesToConfiguration:", v4);
    -[UIButtonConfigurationVisualProvider automaticallyUpdateConfigurationIfNecessary:](self, "automaticallyUpdateConfigurationIfNecessary:", v4);
  }
  button = self->_button;
  -[UIButton _configurationState](button, "_configurationState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton _updateConfigurationUsingState:](button, "_updateConfigurationUsingState:", v6);

  -[UIButton updateConfiguration](self->_button, "updateConfiguration");
  -[UIButton configurationUpdateHandler](self->_button, "configurationUpdateHandler");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    (*(void (**)(uint64_t, UIButton *))(v7 + 16))(v7, self->_button);
  -[UIButtonConfigurationVisualProvider applyConfiguration](self, "applyConfiguration");
  memcpy(v10, __src, sizeof(v10));
  v9 = (char *)GetTraitCollectionTSD() + 16;
  memcpy(__dst, v9, sizeof(__dst));
  memcpy(v9, v10, 0x160uLL);
  -[UIView _recordTraitUsage:insideMethod:withInvalidationAction:]((uint64_t *)self->_button, (uint64_t)&__dst[136], -[UIButton methodForSelector:](self->_button, "methodForSelector:", sel_updateConfiguration), sel_setNeedsUpdateConfiguration);
  _UITraitUsageTrackingResultDestroy((uint64_t)__dst);
  _UIRestorePreviousFallbackEnvironment(v3);

}

- ($E2BAE4BD71C50F14921AF46CCB962FE7)_debugLayoutData
{
  CGPoint v3;
  CGSize size;
  CGPoint v5;
  CGPoint v6;
  CGSize v7;
  CGPoint v8;

  v3 = *(CGPoint *)&self->var6.var1;
  size = self[1].var0.size;
  retstr->var5.size = (CGSize)self[1].var0.origin;
  retstr->var6 = ($F24F406B2B787EFB06265DBA3D28CBD5)size;
  *(CGFloat *)&retstr->var7 = self[1].var1.width;
  v5 = *(CGPoint *)&self->var4.origin.y;
  v6 = *(CGPoint *)&self->var5.origin.y;
  retstr->var3.size = *(CGSize *)&self->var4.size.height;
  retstr->var4.origin = v6;
  retstr->var4.size = *(CGSize *)&self->var5.size.height;
  retstr->var5.origin = v3;
  v7 = *(CGSize *)&self->var2.origin.y;
  v8 = *(CGPoint *)&self->var3.origin.y;
  retstr->var1 = *(CGSize *)&self->var2.size.height;
  retstr->var2.origin = v8;
  retstr->var2.size = *(CGSize *)&self->var3.size.height;
  retstr->var3.origin = v5;
  retstr->var0.origin = *(CGPoint *)&self->var1.height;
  retstr->var0.size = v7;
  return self;
}

- (UIButton)button
{
  return self->_button;
}

- (void)setVendsBaselineInformationToAutoLayout:(BOOL)a3
{
  self->_vendsBaselineInformationToAutoLayout = a3;
}

- (double)previousFirstBaselineOffsetForAttributeLowering
{
  return self->_previousFirstBaselineOffsetForAttributeLowering;
}

- (void)setPreviousFirstBaselineOffsetForAttributeLowering:(double)a3
{
  self->_previousFirstBaselineOffsetForAttributeLowering = a3;
}

- (double)previousLastBaselineOffsetForAttributeLowering
{
  return self->_previousLastBaselineOffsetForAttributeLowering;
}

- (void)setPreviousLastBaselineOffsetForAttributeLowering:(double)a3
{
  self->_previousLastBaselineOffsetForAttributeLowering = a3;
}

- (BOOL)avoidDefaultTitleAndImageLayout
{
  return self->_avoidDefaultTitleAndImageLayout;
}

- (void)setAvoidDefaultTitleAndImageLayout:(BOOL)a3
{
  self->_avoidDefaultTitleAndImageLayout = a3;
}

@end
