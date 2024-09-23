@implementation SBSystemApertureProvidedContentElement

- (SBSystemApertureProvidedContentElement)initWithIdentifier:(id)a3 contentProvider:(id)a4
{
  id v7;
  id v8;
  void *v9;
  char *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v20;
  void *v21;
  objc_super v22;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureProvidedContentElement.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureProvidedContentElement.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contentProvider"));

LABEL_3:
  v22.receiver = self;
  v22.super_class = (Class)SBSystemApertureProvidedContentElement;
  v10 = -[SBSystemApertureProvidedContentElement init](&v22, sel_init);
  if (v10)
  {
    objc_msgSend(v7, "elementIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    v13 = (void *)*((_QWORD *)v10 + 8);
    *((_QWORD *)v10 + 8) = v12;

    objc_msgSend(v7, "clientIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    v16 = (void *)*((_QWORD *)v10 + 9);
    *((_QWORD *)v10 + 9) = v15;

    objc_storeStrong((id *)v10 + 1, a4);
    *(int64x2_t *)(v10 + 120) = vdupq_n_s64(3uLL);
    *((_QWORD *)v10 + 17) = 3;
    v17 = -[SBSystemActionElementPreviewingCoordinator initWithElement:]([SBSystemActionElementPreviewingCoordinator alloc], v10);
    v18 = (void *)*((_QWORD *)v10 + 2);
    *((_QWORD *)v10 + 2) = v17;

  }
  return (SBSystemApertureProvidedContentElement *)v10;
}

- (id)elementDescription
{
  SBUISystemApertureContentProviding *contentProvider;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  contentProvider = self->_contentProvider;
  v6 = CFSTR("contentProvider");
  v7[0] = contentProvider;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SAElementIdentityDescription();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (UIView)leadingView
{
  UIView *leadingView;
  void *v4;
  UIView *v5;
  UIView *v6;

  leadingView = self->_leadingView;
  if (!leadingView)
  {
    -[SBUISystemApertureContentProviding leadingContentViewProvider](self->_contentProvider, "leadingContentViewProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setContentContainer:", self);
    objc_msgSend(v4, "providedView");
    v5 = (UIView *)objc_claimAutoreleasedReturnValue();
    v6 = self->_leadingView;
    self->_leadingView = v5;

    leadingView = self->_leadingView;
  }
  return leadingView;
}

- (UIView)trailingView
{
  UIView *trailingView;
  void *v4;
  UIView *v5;
  UIView *v6;

  trailingView = self->_trailingView;
  if (!trailingView)
  {
    -[SBUISystemApertureContentProviding trailingContentViewProvider](self->_contentProvider, "trailingContentViewProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setContentContainer:", self);
    objc_msgSend(v4, "providedView");
    v5 = (UIView *)objc_claimAutoreleasedReturnValue();
    v6 = self->_trailingView;
    self->_trailingView = v5;

    trailingView = self->_trailingView;
  }
  return trailingView;
}

- (UIView)minimalView
{
  UIView *minimalView;
  void *v4;
  UIView *v5;
  UIView *v6;

  minimalView = self->_minimalView;
  if (!minimalView)
  {
    -[SBUISystemApertureContentProviding minimalContentViewProvider](self->_contentProvider, "minimalContentViewProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setContentContainer:", self);
    objc_msgSend(v4, "providedView");
    v5 = (UIView *)objc_claimAutoreleasedReturnValue();
    v6 = self->_minimalView;
    self->_minimalView = v5;

    minimalView = self->_minimalView;
  }
  return minimalView;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setLayoutMode:(int64_t)a3 reason:(int64_t)a4
{
  int64_t layoutMode;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  layoutMode = self->_layoutMode;
  if (layoutMode != a3)
  {
    self->_layoutMode = a3;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[NSHashTable allObjects](self->_observers, "allObjects", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v12, "elementLayoutSpecifier:layoutModeDidChange:reason:", self, layoutMode, a4);
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

    -[SBSystemActionElementPreviewingCoordinator elementInvalidatedProperties]((uint64_t)self->_previewingCoordinator);
  }
}

- (CGSize)sizeThatFitsSize:(CGSize)a3 forProvidedView:(id)a4 inLayoutMode:(int64_t)a5
{
  double height;
  double width;
  UIView *v9;
  UIView *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v9 = (UIView *)a4;
  v10 = v9;
  if (v9 && (self->_leadingView == v9 || self->_trailingView == v9 || self->_minimalView == v9))
  {
    -[SBSystemApertureProvidedContentElement _sizeForEdgeView:thatFits:layoutMode:](self, "_sizeForEdgeView:thatFits:layoutMode:", v9, a5, width, height);
    v11 = v13;
    v12 = v14;
  }
  else
  {
    v11 = *MEMORY[0x1E0C9D820];
    v12 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }

  v15 = v11;
  v16 = v12;
  result.height = v16;
  result.width = v15;
  return result;
}

- (NSDirectionalEdgeInsets)preferredEdgeOutsetsForLayoutMode:(int64_t)a3 suggestedOutsets:(NSDirectionalEdgeInsets)result maximumOutsets:(NSDirectionalEdgeInsets)a5
{
  double bottom;
  CGFloat trailing;
  CGFloat leading;
  void *v9;
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
  double v24;
  void *v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  CGFloat top;

  bottom = result.bottom;
  if (a3 == 3)
  {
    trailing = a5.trailing;
    leading = a5.leading;
    top = result.top;
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen", result.top, result.leading, result.bottom, result.trailing, a5.top, a5.leading, a5.bottom);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_referenceBounds");
    v11 = v10 + -20.0;

    SBUISystemApertureHorizontalItemSpacing();
    v13 = v11 + v12 * -2.0;
    -[SBSystemApertureProvidedContentElement _sizeForEdgeView:thatFits:layoutMode:](self, "_sizeForEdgeView:thatFits:layoutMode:", self->_leadingView, 3, v13, 1.79769313e308);
    v15 = v14;
    v17 = v16;
    -[SBSystemApertureProvidedContentElement _sizeForEdgeView:thatFits:layoutMode:](self, "_sizeForEdgeView:thatFits:layoutMode:", self->_trailingView, 3, v13, 1.79769313e308);
    v20 = v19;
    v21 = -(v15 + 26.0);
    if (!self->_leadingView)
      v21 = -13.0;
    v22 = v13 + v21;
    v23 = -(v18 + 26.0);
    if (!self->_trailingView)
      v23 = -13.0;
    v24 = v22 + v23;
    -[SBSystemApertureProvidedContentElement _primaryView](self, "_primaryView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "systemLayoutSizeFittingSize:", v24, 1.79769313e308);
    v45 = v26;

    -[SBSystemApertureProvidedContentElement _secondaryView](self, "_secondaryView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "systemLayoutSizeFittingSize:", v24, 1.79769313e308);
    v29 = v28;

    -[SBSystemApertureProvidedContentElement _actionView](self, "_actionView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "systemLayoutSizeFittingSize:", v24, 1.79769313e308);
    v32 = v31;
    v34 = v33;

    if (v17 < v20)
      v17 = v20;
    if (v17 > 0.0)
    {
      SBUISystemApertureInterItemSpacing();
      v36 = v17 + v35 * 2.0;
      if (v36 > 50.0)
        v36 = 50.0;
      if (v17 < v36)
        v17 = v36;
    }
    v37 = v17 + -36.6666667;
    if (v17 + -36.6666667 < 0.0)
      v37 = 0.0;
    if (v37 < v45 + v29)
      v37 = v45 + v29;
    v38 = v34 + v37;
    if (v37 > 0.0)
    {
      SBUISystemApertureVerticalItemSpacing();
      v38 = v38 + v39;
    }
    if (v32 != *MEMORY[0x1E0C9D820] || v34 != *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      SBUISystemApertureControlEdgeSpacing();
      v38 = v38 + v41;
    }
    if (bottom - v38 <= bottom + -50.0)
      bottom = bottom - v38;
    else
      bottom = bottom + -50.0;
    result.top = top;
  }
  else
  {
    leading = result.leading;
    trailing = result.trailing;
  }
  v42 = leading;
  v43 = bottom;
  v44 = trailing;
  result.trailing = v44;
  result.bottom = v43;
  result.leading = v42;
  return result;
}

- (void)layoutHostContainerViewDidLayoutSubviews:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  BOOL v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  double v37;
  uint64_t v38;
  id v39;
  double v40;
  CGFloat v41;
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
  UIView **p_leadingView;
  UIView *v54;
  CGFloat v55;
  double v56;
  CGFloat v57;
  double v58;
  CGFloat v59;
  double v60;
  CGFloat v61;
  double v62;
  CGFloat v63;
  double v64;
  CGFloat v65;
  double v66;
  CGFloat v67;
  double v68;
  CGFloat v69;
  double v70;
  CGFloat v71;
  _BOOL4 v72;
  double v73;
  double v74;
  double v75;
  CGFloat v76;
  double v77;
  CGFloat v78;
  CGFloat v79;
  double v80;
  double v81;
  double v82;
  double v84;
  double v85;
  CGFloat v86;
  CGFloat v87;
  double v88;
  double v89;
  CGFloat v90;
  double MaxY;
  CGFloat v92;
  CGFloat v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  BOOL v102;
  double v103;
  CGFloat v104;
  CGFloat v105;
  double v106;
  CGFloat v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  void *v114;
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
  CGFloat x;
  CGFloat y;
  CGFloat v127;
  CGFloat v128;
  double v130;
  CGFloat v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  double v146;
  double v147;
  double v148;
  double v149;
  double v150;
  double v151;
  double v152;
  void *v153;
  double v154;
  double v155;
  double v156;
  CGFloat v157;
  double v158;
  double v159;
  double v160;
  double v161;
  double v162;
  double v163;
  double v164;
  double v165;
  double v166;
  CGFloat MinY;
  double v168;
  double v169;
  CGFloat v170;
  double v171;
  CGFloat v172;
  CGFloat v173;
  void *v174;
  void *v175;
  double v176;
  void *v177;
  void *v178;
  double v179;
  void *v180;
  void *v181;
  double v182;
  void *v183;
  void *v184;
  double v185;
  uint64_t v186;
  CGFloat v187;
  CGFloat v188;
  double v189;
  double v190;
  double height;
  double width;
  double v193;
  double v194;
  uint64_t v195;
  double v196;
  CGFloat v197;
  double v198;
  double v199;
  CGFloat v200;
  double r2;
  CGFloat recta;
  CGFloat rect;
  CGFloat v204;
  double v205;
  CGFloat v206;
  double v207;
  double v208;
  double v209;
  CGFloat v210;
  double v211;
  CGFloat v212;
  double v213;
  CGFloat v214;
  double v215;
  CGFloat v216;
  id v217;
  _QWORD v218[17];
  CGRect v219;
  CGRect v220;
  CGRect v221;
  CGRect v222;
  CGRect v223;
  CGRect v224;
  CGRect v225;
  CGRect v226;
  CGRect v227;
  CGRect v228;
  CGRect v229;
  CGRect v230;
  CGRect v231;
  CGRect v232;
  CGRect v233;
  CGRect v234;
  CGRect v235;
  CGRect v236;
  CGRect v237;
  CGRect v238;
  CGRect v239;
  CGRect v240;
  CGRect v241;
  CGRect v242;
  CGRect v243;
  CGRect v244;
  CGRect v245;
  CGRect v246;
  CGRect v247;
  CGRect v248;
  CGRect v249;
  CGRect v250;
  CGRect v251;
  CGRect v252;

  v217 = a3;
  if (-[SBSystemApertureProvidedContentElement layoutMode](self, "layoutMode") == 3)
  {
    v4 = objc_msgSend(v217, "effectiveUserInterfaceLayoutDirection");
    objc_msgSend(v217, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayScale");
    v7 = v6;

    objc_msgSend(v217, "bounds");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    -[UIView systemLayoutSizeFittingSize:](self->_actionView, "systemLayoutSizeFittingSize:", v12, v14);
    v213 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v214 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v196 = *MEMORY[0x1E0C9D820];
    v198 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v18 = v17 == *MEMORY[0x1E0C9D820] && v16 == *(double *)(MEMORY[0x1E0C9D820] + 8);
    v208 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v211 = *MEMORY[0x1E0C9D648];
    v195 = v7;
    if (v18)
    {
      v193 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      v194 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v187 = *MEMORY[0x1E0C9D648];
      v188 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    }
    else
    {
      SBUISystemApertureControlEdgeSpacing();
      BSRectWithSize();
      v20 = v19;
      recta = v21;
      v204 = v13;
      v22 = v13;
      v23 = v11;
      v25 = v24;
      v27 = v26;
      v219.origin.x = v9;
      v219.origin.y = v23;
      v219.size.width = v22;
      v219.size.height = v15;
      CGRectGetMaxY(v219);
      v220.origin.x = v20;
      v220.origin.y = recta;
      v220.size.width = v25;
      v220.size.height = v27;
      CGRectGetHeight(v220);
      v186 = v7;
      UIRectCenteredXInRectScale();
      v29 = v28;
      v31 = v30;
      v33 = v32;
      v35 = v34;
      v221.origin.x = v9;
      v221.origin.y = v23;
      v221.size.width = v204;
      v221.size.height = v15;
      CGRectGetMaxY(v221);
      v187 = v29;
      v188 = v31;
      v222.origin.x = v29;
      v222.origin.y = v31;
      v193 = v35;
      v194 = v33;
      v222.size.width = v33;
      v222.size.height = v35;
      CGRectGetMinY(v222);
      UIRectInsetEdges();
      v13 = v36;
      v15 = v37;
    }
    v38 = 88;
    if (v4 == 1)
      v38 = 96;
    v39 = *(id *)((char *)&self->super.isa + v38);
    if (v39)
    {
      -[SBSystemApertureProvidedContentElement _sizeForEdgeView:thatFits:layoutMode:](self, "_sizeForEdgeView:thatFits:layoutMode:", v39, 3, v13, v15);
      BSRectWithSize();
      -[SBSystemApertureProvidedContentElement _edgeSpacingWithConcentricPositioningIfNecessaryForView:withFrame:inContainerView:](self, "_edgeSpacingWithConcentricPositioningIfNecessaryForView:withFrame:inContainerView:", v39, v217);
      v186 = v195;
      UIRectCenteredYInRectScale();
      height = v223.size.height;
      width = v223.size.width;
      CGRectGetMaxX(v223);
      UIRectInsetEdges();
      v41 = v40;
      v43 = v42;
      v45 = v44;
      v47 = v46;
      v48 = v208;
    }
    else
    {
      UIRectInsetEdges();
      v41 = v49;
      v43 = v50;
      v45 = v51;
      v47 = v52;
      v48 = v208;
      height = v214;
      width = v208;
    }
    if (v4 == 1)
      p_leadingView = &self->_leadingView;
    else
      p_leadingView = &self->_trailingView;
    v54 = *p_leadingView;
    if (v54)
    {
      -[SBSystemApertureProvidedContentElement _sizeForEdgeView:thatFits:layoutMode:](self, "_sizeForEdgeView:thatFits:layoutMode:", v54, 3, v45, v47);
      BSRectWithSize();
      v55 = v43;
      v206 = v43;
      v57 = v56;
      v59 = v58;
      v61 = v60;
      v63 = v62;
      -[SBSystemApertureProvidedContentElement _edgeSpacingWithConcentricPositioningIfNecessaryForView:withFrame:inContainerView:](self, "_edgeSpacingWithConcentricPositioningIfNecessaryForView:withFrame:inContainerView:", v54, v217);
      v224.size.height = v47;
      v224.origin.x = v41;
      v224.origin.y = v55;
      v224.size.width = v45;
      CGRectGetMaxX(v224);
      v225.origin.x = v57;
      v225.origin.y = v59;
      v225.size.width = v61;
      v225.size.height = v63;
      CGRectGetWidth(v225);
      v186 = v195;
      UIRectCenteredYInRectScale();
      v65 = v64;
      v67 = v66;
      v69 = v68;
      v71 = v70;
      v226.origin.x = v41;
      v226.origin.y = v206;
      v226.size.width = v45;
      v226.size.height = v47;
      CGRectGetMaxX(v226);
      v227.origin.x = v65;
      v227.origin.y = v67;
      v189 = v69;
      v190 = v71;
      v227.size.width = v69;
      v227.size.height = v71;
      CGRectGetMinX(v227);
      UIRectInsetEdges();
    }
    else
    {
      UIRectInsetEdges();
      v189 = v48;
      v190 = v214;
    }
    if (v194 == v196 && v193 == v198)
    {
      v72 = 1;
    }
    else
    {
      v72 = 0;
      if (width == v196 && height == v198)
        v72 = v190 == v198 && v189 == v196;
    }
    SBUISystemApertureHorizontalItemSpacing();
    UIRectInsetEdges();
    SBUISystemApertureVerticalItemSpacing();
    UIRectInsetEdges();
    v76 = v75;
    v78 = v77;
    v79 = v74;
    if (v73 >= 0.0)
      v80 = v73;
    else
      v80 = 0.0;
    -[UIView systemLayoutSizeFittingSize:](self->_secondaryView, "systemLayoutSizeFittingSize:", v80, v74, v186);
    if (v82 == v196 && v81 == v198)
    {
      v88 = v80;
      v89 = v79;
      v90 = v211;
      v87 = v214;
      v205 = v213;
      v207 = v208;
      rect = v211;
    }
    else
    {
      v84 = v81;
      v228.origin.x = v76;
      v228.origin.y = v78;
      v228.size.width = v80;
      v228.size.height = v79;
      v85 = CGRectGetHeight(v228);
      v86 = v80;
      if (v84 <= v85)
        v87 = v84;
      else
        v87 = v85;
      if (v72)
      {
        v88 = v86;
        v205 = v78;
        v207 = v86;
        v89 = v79;
        rect = v76;
      }
      else
      {
        v229.origin.x = v76;
        v229.origin.y = v78;
        v229.size.width = v86;
        v229.size.height = v79;
        MaxY = CGRectGetMaxY(v229);
        v230.origin.x = v76;
        v230.origin.y = v78;
        v230.size.width = v86;
        v230.size.height = v87;
        v92 = v79;
        v93 = MaxY - CGRectGetHeight(v230);
        v231.origin.x = v76;
        v231.origin.y = v78;
        v231.size.width = v86;
        v231.size.height = v92;
        CGRectGetMaxY(v231);
        v232.origin.x = v76;
        v205 = v93;
        v232.origin.y = v93;
        v232.size.width = v86;
        v232.size.height = v87;
        CGRectGetMinY(v232);
        UIRectInsetEdges();
        v94 = v76;
        v76 = v95;
        v78 = v96;
        v88 = v97;
        v207 = v86;
        v89 = v98;
        rect = v94;
      }
      v90 = v211;
    }
    -[UIView systemLayoutSizeFittingSize:](self->_primaryView, "systemLayoutSizeFittingSize:", v88, v89);
    v100 = v99;
    v102 = v101 == v196 && v99 == v198;
    r2 = v87;
    if (v102)
    {
      v105 = v208;
    }
    else
    {
      v233.origin.x = v76;
      v233.origin.y = v78;
      v233.size.width = v88;
      v233.size.height = v89;
      v103 = CGRectGetHeight(v233);
      if (v100 <= v103)
        v104 = v100;
      else
        v104 = v103;
      v214 = v104;
      if (v72)
      {
        v90 = v76;
        v213 = v78;
      }
      else
      {
        v234.origin.x = v76;
        v234.origin.y = v78;
        v234.size.width = v88;
        v234.size.height = v89;
        v106 = CGRectGetMaxY(v234);
        v235.origin.x = v76;
        v235.origin.y = v78;
        v235.size.width = v88;
        v235.size.height = v104;
        v107 = v106 - CGRectGetHeight(v235);
        v236.origin.x = v76;
        v236.origin.y = v78;
        v236.size.width = v88;
        v236.size.height = v89;
        CGRectGetMaxY(v236);
        v237.origin.x = v76;
        v213 = v107;
        v237.origin.y = v107;
        v237.size.width = v88;
        v237.size.height = v104;
        CGRectGetMinY(v237);
        UIRectInsetEdges();
        v90 = v76;
      }
      v105 = v88;
      v87 = r2;
    }
    v212 = v90;
    v238.origin.x = v90;
    v238.origin.y = v213;
    v238.size.height = v214;
    v238.size.width = v105;
    v108 = CGRectGetHeight(v238);
    v239.origin.x = rect;
    v239.origin.y = v205;
    v239.size.width = v207;
    v239.size.height = v87;
    v109 = CGRectGetHeight(v239);
    v110 = v105;
    if (v72 && (v111 = v109, v112 = v108 + v109, (BSFloatIsZero() & 1) == 0))
    {
      -[UIView traitCollection](self->_primaryView, "traitCollection");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v114, "displayScale");
      UIRectCenteredYInRectScale();
      v209 = v116;
      v212 = v115;
      v215 = v117;
      v119 = v118;

      v113 = v119;
      v110 = v209;
      UIRectCenteredYInRectScale();
      r2 = v121;
      rect = v120;
      v207 = v122;
      v123 = v112 * 0.5 - v108;
      v213 = v215 - (v108 * 0.5 + v123);
      v205 = v111 * 0.5 - v123 + v124;
    }
    else
    {
      v113 = v214;
    }
    x = *MEMORY[0x1E0C9D628];
    y = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v127 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v128 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    if (v110 != v196 || v113 != v198)
    {
      v251.origin.x = v212;
      v251.origin.y = v213;
      v251.size.width = v110;
      v251.size.height = v113;
      v240 = CGRectUnion(*MEMORY[0x1E0C9D628], v251);
      x = v240.origin.x;
      y = v240.origin.y;
      v127 = v240.size.width;
      v128 = v240.size.height;
    }
    v130 = v207;
    v216 = v113;
    v210 = v110;
    if (v207 != v196 || r2 != v198)
    {
      v241.origin.x = x;
      v241.origin.y = y;
      v241.size.width = v127;
      v241.size.height = v128;
      v131 = rect;
      v132 = v205;
      v133 = r2;
      v242 = CGRectUnion(v241, *(CGRect *)(&v130 - 2));
      x = v242.origin.x;
      y = v242.origin.y;
      v127 = v242.size.width;
      v128 = v242.size.height;
    }
    v243.origin.x = x;
    v243.origin.y = y;
    v243.size.width = v127;
    v243.size.height = v128;
    CGRectIsNull(v243);
    UIRectCenteredYInRectScale();
    v199 = v134;
    v136 = v135;
    v138 = v137;
    v140 = v139;
    UIRectCenteredYInRectScale();
    v145 = v141;
    v146 = v142;
    v147 = v143;
    v148 = v144;
    if (v4 != 1)
    {
      v141 = v199;
      v142 = v136;
      v143 = v138;
      v144 = v140;
    }
    -[UIView sb_setBoundsAndPositionFromFrame:](self->_leadingView, "sb_setBoundsAndPositionFromFrame:", v141, v142, v143, v144, v195);
    if (v4 == 1)
      v149 = v199;
    else
      v149 = v145;
    if (v4 == 1)
      v150 = v136;
    else
      v150 = v146;
    if (v4 == 1)
      v151 = v138;
    else
      v151 = v147;
    if (v4 == 1)
      v152 = v140;
    else
      v152 = v148;
    -[UIView sb_setBoundsAndPositionFromFrame:](self->_trailingView, "sb_setBoundsAndPositionFromFrame:", v149, v150, v151, v152);
    objc_msgSend(MEMORY[0x1E0DAC6C0], "sharedInstanceForEmbeddedDisplay");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "sensorRegionSize");
    v155 = v154;
    v157 = v156;

    objc_msgSend(v217, "bounds");
    v158 = CGRectGetWidth(v244) - v155;
    if (v158 <= 0.0)
      v159 = 0.0;
    else
      v159 = v158 * 0.5;
    v252.origin.y = 0.0;
    v160 = v213;
    v245.origin.x = v212;
    v245.origin.y = v213;
    v245.size.width = v210;
    v245.size.height = v216;
    v252.origin.x = v159;
    v252.size.width = v155;
    v252.size.height = v157;
    if (CGRectIntersectsRect(v245, v252))
    {
      objc_msgSend(v217, "bounds");
      v200 = v159;
      v161 = CGRectGetHeight(v246);
      v247.origin.x = v212;
      v247.origin.y = v213;
      v247.size.width = v210;
      v247.size.height = v216;
      v162 = CGRectGetMaxY(v247);
      v248.origin.x = rect;
      v248.origin.y = v205;
      v248.size.width = v207;
      v197 = v157;
      v163 = r2;
      v248.size.height = r2;
      v164 = CGRectGetMaxY(v248);
      if (v162 >= v164)
        v164 = v162;
      v249.origin.y = 0.0;
      v165 = fmax(v161 - v164, 0.0);
      v249.size.height = v197;
      v249.origin.x = v200;
      v249.size.width = v155;
      v166 = CGRectGetMaxY(v249);
      v250.origin.x = v212;
      v250.origin.y = v213;
      v250.size.width = v210;
      v250.size.height = v216;
      MinY = CGRectGetMinY(v250);
      v168 = v207;
      v169 = v166 - MinY;
      v170 = rect;
      if (v165 < v169)
        v169 = v165;
      v160 = v213 + v169;
      v171 = v205 + v169;
      v173 = v187;
      v172 = v188;
    }
    else
    {
      v173 = v187;
      v172 = v188;
      v163 = r2;
      v170 = rect;
      v171 = v205;
      v168 = v207;
    }
    v218[0] = MEMORY[0x1E0C809B0];
    v218[1] = 3221225472;
    v218[2] = __83__SBSystemApertureProvidedContentElement_layoutHostContainerViewDidLayoutSubviews___block_invoke;
    v218[3] = &unk_1E8EA4670;
    v218[4] = self;
    *(CGFloat *)&v218[5] = v173;
    *(CGFloat *)&v218[6] = v172;
    *(double *)&v218[7] = v194;
    *(double *)&v218[8] = v193;
    *(CGFloat *)&v218[9] = v212;
    *(double *)&v218[10] = v160;
    *(CGFloat *)&v218[11] = v210;
    *(CGFloat *)&v218[12] = v216;
    *(CGFloat *)&v218[13] = v170;
    *(double *)&v218[14] = v171;
    *(double *)&v218[15] = v168;
    *(double *)&v218[16] = v163;
    objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v218);

  }
  -[SBSystemApertureProvidedContentElement _primaryView](self, "_primaryView");
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  v175 = v174;
  if (self->_layoutMode >= 3)
    v176 = 1.0;
  else
    v176 = 0.0;
  objc_msgSend(v174, "setAlpha:", v176);

  -[SBSystemApertureProvidedContentElement _secondaryView](self, "_secondaryView");
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  v178 = v177;
  if (self->_layoutMode >= 3)
    v179 = 1.0;
  else
    v179 = 0.0;
  objc_msgSend(v177, "setAlpha:", v179);

  -[SBSystemApertureProvidedContentElement _actionView](self, "_actionView");
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  v181 = v180;
  if (self->_layoutMode >= 3)
    v182 = 1.0;
  else
    v182 = 0.0;
  objc_msgSend(v180, "setAlpha:", v182);

  -[SBSystemApertureProvidedContentElement minimalView](self, "minimalView");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  v184 = v183;
  if (self->_layoutMode == 1)
    v185 = 1.0;
  else
    v185 = 0.0;
  objc_msgSend(v183, "setAlpha:", v185);

}

uint64_t __83__SBSystemApertureProvidedContentElement_layoutHostContainerViewDidLayoutSubviews___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "sb_setBoundsAndPositionFromFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "sb_setBoundsAndPositionFromFrame:", *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "sb_setBoundsAndPositionFromFrame:", *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 128));
}

- (void)contentProviderWillTransitionToSize:(CGSize)a3 inContainerView:(id)a4 transitionCoordinator:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v7 = a4;
  v8 = a5;
  if (self->_layoutMode == 3)
  {
    -[SBSystemApertureProvidedContentElement _primaryView](self, "_primaryView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v9);

    -[SBSystemApertureProvidedContentElement _secondaryView](self, "_secondaryView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v10);

    -[SBSystemApertureProvidedContentElement _actionView](self, "_actionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v11);

  }
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __116__SBSystemApertureProvidedContentElement_contentProviderWillTransitionToSize_inContainerView_transitionCoordinator___block_invoke;
  v13[3] = &unk_1E8EB79D8;
  objc_copyWeak(&v15, &location);
  v12 = v7;
  v14 = v12;
  objc_msgSend(v8, "animateAlongsideTransition:completion:", v13, 0);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __116__SBSystemApertureProvidedContentElement_contentProviderWillTransitionToSize_inContainerView_transitionCoordinator___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "layoutHostContainerViewDidLayoutSubviews:", *(_QWORD *)(a1 + 32));

}

- (void)addElementLayoutSpecifierObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    observers = self->_observers;
    v8 = v4;
    if (!observers)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v7 = self->_observers;
      self->_observers = v6;

      observers = self->_observers;
    }
    -[NSHashTable addObject:](observers, "addObject:", v8);
    v4 = v8;
  }

}

- (void)removeElementLayoutSpecifierObserver:(id)a3
{
  NSHashTable *observers;

  if (a3)
  {
    observers = self->_observers;
    if (observers)
      -[NSHashTable removeObject:](observers, "removeObject:");
  }
}

- (void)setPreviewing:(BOOL)a3
{
  if (self->_previewing != a3)
  {
    self->_previewing = a3;
    -[SBSystemActionElementPreviewingCoordinator elementInvalidatedProperties]((uint64_t)self->_previewingCoordinator);
  }
}

- (void)setUrgent:(BOOL)a3
{
  if (self->_urgent != a3)
  {
    self->_urgent = a3;
    -[SBSystemActionElementPreviewingCoordinator elementInvalidatedProperties]((uint64_t)self->_previewingCoordinator);
  }
}

- (void)setExpanding:(BOOL)a3
{
  if (self->_expanding != a3)
  {
    self->_expanding = a3;
    -[SBSystemActionElementPreviewingCoordinator elementInvalidatedProperties]((uint64_t)self->_previewingCoordinator);
  }
}

- (void)setProminent:(BOOL)a3
{
  id WeakRetained;

  if (self->_prominent != a3)
  {
    self->_prominent = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
    objc_msgSend(WeakRetained, "preferredEdgeOutsetsDidInvalidateForLayoutSpecifier:", self);

  }
}

- (void)pop
{
  -[SBSystemActionElementPreviewingCoordinator pop](self->_previewingCoordinator, a2);
}

- (int64_t)systemApertureLayoutCustomizingOptions
{
  return -[SBSystemApertureProvidedContentElement isProminent](self, "isProminent");
}

- (BOOL)shouldSuppressElementWhileOnCoversheet
{
  return 0;
}

- (void)preferredContentSizeDidInvalidateForContentViewProvider:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
  objc_msgSend(WeakRetained, "preferredEdgeOutsetsDidInvalidateForLayoutSpecifier:", self);

}

- (id)_primaryView
{
  UIView *primaryView;
  void *v4;
  UIView *v5;
  UIView *v6;

  primaryView = self->_primaryView;
  if (!primaryView)
  {
    -[SBUISystemApertureContentProviding primaryContentViewProvider](self->_contentProvider, "primaryContentViewProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setContentContainer:", self);
    objc_msgSend(v4, "providedView");
    v5 = (UIView *)objc_claimAutoreleasedReturnValue();
    v6 = self->_primaryView;
    self->_primaryView = v5;

    primaryView = self->_primaryView;
  }
  return primaryView;
}

- (id)_secondaryView
{
  UIView *secondaryView;
  void *v4;
  UIView *v5;
  UIView *v6;

  secondaryView = self->_secondaryView;
  if (!secondaryView)
  {
    -[SBUISystemApertureContentProviding secondaryContentViewProvider](self->_contentProvider, "secondaryContentViewProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setContentContainer:", self);
    objc_msgSend(v4, "providedView");
    v5 = (UIView *)objc_claimAutoreleasedReturnValue();
    v6 = self->_secondaryView;
    self->_secondaryView = v5;

    secondaryView = self->_secondaryView;
  }
  return secondaryView;
}

- (id)_actionView
{
  UIView *actionView;
  void *v4;
  UIView *v5;
  UIView *v6;

  actionView = self->_actionView;
  if (!actionView)
  {
    -[SBUISystemApertureContentProviding actionContentViewProvider](self->_contentProvider, "actionContentViewProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setContentContainer:", self);
    objc_msgSend(v4, "providedView");
    v5 = (UIView *)objc_claimAutoreleasedReturnValue();
    v6 = self->_actionView;
    self->_actionView = v5;

    actionView = self->_actionView;
  }
  return actionView;
}

- (double)_edgeSpacingWithConcentricPositioningIfNecessaryForView:(id)a3 withFrame:(CGRect)a4 inContainerView:(id)a5
{
  double height;
  UIView *v8;
  id v9;
  double v10;
  double v11;

  height = a4.size.height;
  v8 = (UIView *)a3;
  v9 = a5;
  if (self->_leadingView == v8 || (v10 = 26.0, self->_trailingView == v8))
  {
    v10 = 26.0;
    if (!self->_actionView && !self->_secondaryView && BSFloatApproximatelyEqualToFloat())
    {
      objc_msgSend(v9, "frame");
      v10 = (v11 - height) * 0.5;
    }
  }

  return v10;
}

- (CGSize)_sizeForEdgeView:(id)a3 thatFits:(CGSize)a4 layoutMode:(int64_t)a5
{
  double height;
  double width;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGSize result;

  height = a4.height;
  width = a4.width;
  v10 = a3;
  if (!v10)
  {
    v17 = *MEMORY[0x1E0C9D820];
    v18 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    goto LABEL_17;
  }
  -[SBSystemApertureProvidedContentElement leadingView](self, "leadingView");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v10;
  if ((id)v11 == v10)
    goto LABEL_8;
  v13 = (void *)v11;
  -[SBSystemApertureProvidedContentElement trailingView](self, "trailingView");
  v14 = objc_claimAutoreleasedReturnValue();
  if ((id)v14 == v10)
  {

    v12 = v13;
    goto LABEL_8;
  }
  v15 = (void *)v14;
  -[SBSystemApertureProvidedContentElement minimalView](self, "minimalView");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if (v16 != v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureProvidedContentElement.m"), 488, CFSTR("Why are we trying to determine the edge-view size of a non-edge view?"));
LABEL_8:

  }
  objc_msgSend(v10, "systemLayoutSizeFittingSize:", width, height);
  v17 = v19;
  v18 = v20;
  if (a5 == 3)
    v21 = 37.0;
  else
    v21 = 0.0;
  if (BSSizeLessThanSize() && BSSizeLessThanSize())
  {
    v18 = v21;
    v17 = v21;
  }
  -[SBSystemApertureProvidedContentElement minimalView](self, "minimalView");
  v22 = (id)objc_claimAutoreleasedReturnValue();

  if (v22 == v10)
  {
    BSSizeSwap();
    v17 = v23;
    v18 = v24;
  }
LABEL_17:

  v25 = v17;
  v26 = v18;
  result.height = v26;
  result.width = v25;
  return result;
}

- (NSString)elementIdentifier
{
  return self->_elementIdentifier;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (SAElementHosting)elementHost
{
  return (SAElementHosting *)objc_loadWeakRetained((id *)&self->_elementHost);
}

- (void)setElementHost:(id)a3
{
  objc_storeWeak((id *)&self->_elementHost, a3);
}

- (int64_t)layoutMode
{
  return self->_layoutMode;
}

- (int64_t)minimumSupportedLayoutMode
{
  return self->_minimumSupportedLayoutMode;
}

- (void)setMinimumSupportedLayoutMode:(int64_t)a3
{
  self->_minimumSupportedLayoutMode = a3;
}

- (int64_t)maximumSupportedLayoutMode
{
  return self->_maximumSupportedLayoutMode;
}

- (void)setMaximumSupportedLayoutMode:(int64_t)a3
{
  self->_maximumSupportedLayoutMode = a3;
}

- (int64_t)preferredLayoutMode
{
  return self->_preferredLayoutMode;
}

- (void)setPreferredLayoutMode:(int64_t)a3
{
  self->_preferredLayoutMode = a3;
}

- (SAUILayoutHosting)layoutHost
{
  return (SAUILayoutHosting *)objc_loadWeakRetained((id *)&self->_layoutHost);
}

- (void)setLayoutHost:(id)a3
{
  objc_storeWeak((id *)&self->_layoutHost, a3);
}

- (SBSystemAperturePlatformElementHosting)platformElementHost
{
  return (SBSystemAperturePlatformElementHosting *)objc_loadWeakRetained((id *)&self->_platformElementHost);
}

- (void)setPlatformElementHost:(id)a3
{
  objc_storeWeak((id *)&self->_platformElementHost, a3);
}

- (BOOL)isPreviewing
{
  return self->_previewing;
}

- (BOOL)isUrgent
{
  return self->_urgent;
}

- (BOOL)isExpanding
{
  return self->_expanding;
}

- (BOOL)isProminent
{
  return self->_prominent;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_platformElementHost);
  objc_destroyWeak((id *)&self->_layoutHost);
  objc_storeStrong((id *)&self->_minimalView, 0);
  objc_storeStrong((id *)&self->_trailingView, 0);
  objc_storeStrong((id *)&self->_leadingView, 0);
  objc_destroyWeak((id *)&self->_elementHost);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_elementIdentifier, 0);
  objc_storeStrong((id *)&self->_actionView, 0);
  objc_storeStrong((id *)&self->_secondaryView, 0);
  objc_storeStrong((id *)&self->_primaryView, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_previewingCoordinator, 0);
  objc_storeStrong((id *)&self->_contentProvider, 0);
}

@end
