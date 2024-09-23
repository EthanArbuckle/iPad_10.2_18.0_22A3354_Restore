@implementation _UISearchBarSearchContainerLayout

- (UISearchBarTextField)searchField
{
  return self->_searchField;
}

- (void)setSearchBarFieldHeight:(double)a3
{
  self->_searchBarFieldHeight = a3;
}

- (void)setTextFieldManagedInNSToolbar:(BOOL)a3
{
  __int16 searchContainerLayoutFlags;
  __int16 v4;

  searchContainerLayoutFlags = (__int16)self->_searchContainerLayoutFlags;
  if (((((searchContainerLayoutFlags & 0x20) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 32;
    else
      v4 = 0;
    *(_WORD *)&self->_searchContainerLayoutFlags = searchContainerLayoutFlags & 0xFFDF | v4;
    -[_UISearchBarLayoutBase invalidateLayout](self, "invalidateLayout");
  }
}

- (void)setSearchFieldUsesCustomBackgroundImage:(BOOL)a3
{
  __int16 searchContainerLayoutFlags;
  __int16 v4;

  searchContainerLayoutFlags = (__int16)self->_searchContainerLayoutFlags;
  if (((((searchContainerLayoutFlags & 0x100) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 256;
    else
      v4 = 0;
    *(_WORD *)&self->_searchContainerLayoutFlags = searchContainerLayoutFlags & 0xFEFF | v4;
    -[_UISearchBarLayoutBase invalidateLayout](self, "invalidateLayout");
  }
}

- (void)setSearchFieldRespectsReadableWidth:(BOOL)a3
{
  __int16 searchContainerLayoutFlags;
  __int16 v4;

  searchContainerLayoutFlags = (__int16)self->_searchContainerLayoutFlags;
  if (((((searchContainerLayoutFlags & 0x400) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 1024;
    else
      v4 = 0;
    *(_WORD *)&self->_searchContainerLayoutFlags = searchContainerLayoutFlags & 0xFBFF | v4;
    -[_UISearchBarLayoutBase invalidateLayout](self, "invalidateLayout");
  }
}

- (void)setSearchFieldEffectivelySupportsDynamicType:(BOOL)a3
{
  __int16 searchContainerLayoutFlags;
  __int16 v4;

  searchContainerLayoutFlags = (__int16)self->_searchContainerLayoutFlags;
  if (((((searchContainerLayoutFlags & 0x200) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 512;
    else
      v4 = 0;
    *(_WORD *)&self->_searchContainerLayoutFlags = searchContainerLayoutFlags & 0xFDFF | v4;
    -[_UISearchBarLayoutBase invalidateLayout](self, "invalidateLayout");
  }
}

- (void)setSearchFieldBackgroundPositionAdjustment:(UIOffset)a3
{
  if (a3.horizontal != self->_searchFieldBackgroundPositionAdjustment.horizontal
    || a3.vertical != self->_searchFieldBackgroundPositionAdjustment.vertical)
  {
    self->_searchFieldBackgroundPositionAdjustment = a3;
    -[_UISearchBarLayoutBase invalidateLayout](self, "invalidateLayout");
  }
}

- (void)setSearchBarReadableWidth:(double)a3
{
  double searchBarReadableWidth;

  searchBarReadableWidth = self->_searchBarReadableWidth;
  if (searchBarReadableWidth != a3)
  {
    if (searchBarReadableWidth > a3 || (*(_WORD *)&self->_searchContainerLayoutFlags & 0x800) != 0)
      -[_UISearchBarLayoutBase invalidateLayout](self, "invalidateLayout");
    self->_searchBarReadableWidth = a3;
  }
}

- (void)setRepresentedLayoutState:(int64_t)a3
{
  self->_representedLayoutState = a3;
}

- (void)setHostedInlineByNavigationBar:(BOOL)a3
{
  __int16 searchContainerLayoutFlags;
  __int16 v4;

  searchContainerLayoutFlags = (__int16)self->_searchContainerLayoutFlags;
  if (((((searchContainerLayoutFlags & 0x10) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 16;
    else
      v4 = 0;
    *(_WORD *)&self->_searchContainerLayoutFlags = searchContainerLayoutFlags & 0xFFEF | v4;
    -[_UISearchBarLayoutBase invalidateLayout](self, "invalidateLayout");
  }
}

- (void)setHasLeftButton:(BOOL)a3
{
  __int16 searchContainerLayoutFlags;
  __int16 v4;

  searchContainerLayoutFlags = (__int16)self->_searchContainerLayoutFlags;
  if (((((searchContainerLayoutFlags & 4) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 4;
    else
      v4 = 0;
    *(_WORD *)&self->_searchContainerLayoutFlags = searchContainerLayoutFlags & 0xFFFB | v4;
    -[_UISearchBarLayoutBase invalidateLayout](self, "invalidateLayout");
  }
}

- (void)setHasDeleteButton:(BOOL)a3
{
  __int16 searchContainerLayoutFlags;
  __int16 v4;

  searchContainerLayoutFlags = (__int16)self->_searchContainerLayoutFlags;
  if (((((searchContainerLayoutFlags & 2) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 2;
    else
      v4 = 0;
    *(_WORD *)&self->_searchContainerLayoutFlags = searchContainerLayoutFlags & 0xFFFD | v4;
    -[_UISearchBarLayoutBase invalidateLayout](self, "invalidateLayout");
  }
}

- (void)setHasCancelButton:(BOOL)a3
{
  __int16 searchContainerLayoutFlags;

  searchContainerLayoutFlags = (__int16)self->_searchContainerLayoutFlags;
  if (((((searchContainerLayoutFlags & 1) == 0) ^ a3) & 1) == 0)
  {
    *(_WORD *)&self->_searchContainerLayoutFlags = searchContainerLayoutFlags & 0xFFFE | a3;
    -[_UISearchBarLayoutBase invalidateLayout](self, "invalidateLayout");
  }
}

- (void)setDrawsSearchIconOnly:(BOOL)a3
{
  __int16 searchContainerLayoutFlags;
  __int16 v4;

  searchContainerLayoutFlags = (__int16)self->_searchContainerLayoutFlags;
  if (((((searchContainerLayoutFlags & 0x40) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 64;
    else
      v4 = 0;
    *(_WORD *)&self->_searchContainerLayoutFlags = searchContainerLayoutFlags & 0xFFBF | v4;
    -[_UISearchBarLayoutBase invalidateLayout](self, "invalidateLayout");
  }
}

- (void)setAllowSearchFieldShrinkage:(BOOL)a3
{
  __int16 searchContainerLayoutFlags;
  __int16 v4;

  searchContainerLayoutFlags = (__int16)self->_searchContainerLayoutFlags;
  if (((((searchContainerLayoutFlags & 0x80) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 128;
    else
      v4 = 0;
    *(_WORD *)&self->_searchContainerLayoutFlags = searchContainerLayoutFlags & 0xFF7F | v4;
    -[_UISearchBarLayoutBase invalidateLayout](self, "invalidateLayout");
  }
}

- (void)setOverrideInactiveWidth:(double)a3
{
  self->_overrideInactiveWidth = a3;
}

- (void)setOverrideActiveWidth:(double)a3
{
  self->_overrideActiveWidth = a3;
}

- (void)setDefaultInactiveWidth:(double)a3
{
  self->_defaultInactiveWidth = a3;
}

- (void)setDefaultActiveWidth:(double)a3
{
  self->_defaultActiveWidth = a3;
}

- (void)setSearchIconBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_searchIconBarButtonItem, a3);
}

- (void)setSearchField:(id)a3
{
  objc_storeStrong((id *)&self->_searchField, a3);
}

- (void)setLeftButton:(id)a3
{
  objc_storeStrong((id *)&self->_leftButton, a3);
}

- (void)setFloatingSearchIconView:(id)a3
{
  objc_storeStrong((id *)&self->_floatingSearchIconView, a3);
}

- (void)setDeleteButton:(id)a3
{
  objc_storeStrong((id *)&self->_deleteButton, a3);
}

- (void)setCancelButton:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButton, a3);
}

- (double)naturalContainerHeight
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id WeakRetained;
  double v11;
  void *v13;

  -[_UISearchBarLayoutBase contentInset](self, "contentInset");
  v5 = v4;
  v7 = v6;
  -[_UISearchBarLayoutBase barMetrics](self, "barMetrics");
  -[_UISearchBarSearchContainerLayout searchBarFieldHeight](self, "searchBarFieldHeight");
  v9 = v8;
  if (v8 == 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISearchBarSearchContainerLayout.m"), 171, CFSTR("searchBarFieldHeight is unexpectedly 0.0 in naturalContainerHeight"));

  }
  if ((*(_WORD *)&self->_searchContainerLayoutFlags & 0x200) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "layout:fontScaledValueForValue:", self, v9);
    v9 = v11;

  }
  return v5 + v7 + v9;
}

- (double)searchBarFieldHeight
{
  return self->_searchBarFieldHeight;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)sendWillLayoutSubviewsForSearchFieldContainerView:(id)a3
{
  id v4;
  void (**layoutCustomizationDelegateSearchFieldContainerWillLayoutSubviewsCallback)(id, id, double, double, double, double, double, double, double, double);
  double v6;
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
  id v18;

  v4 = a3;
  layoutCustomizationDelegateSearchFieldContainerWillLayoutSubviewsCallback = (void (**)(id, id, double, double, double, double, double, double, double, double))self->_layoutCustomizationDelegateSearchFieldContainerWillLayoutSubviewsCallback;
  if (layoutCustomizationDelegateSearchFieldContainerWillLayoutSubviewsCallback
    && (*(_WORD *)&self->_searchContainerLayoutFlags & 0x10) == 0)
  {
    v18 = v4;
    -[_UISearchBarSearchContainerLayout searchFieldLayoutFrame](self, "searchFieldLayoutFrame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[_UISearchBarSearchContainerLayout cancelButtonLayoutFrame](self, "cancelButtonLayoutFrame");
    layoutCustomizationDelegateSearchFieldContainerWillLayoutSubviewsCallback[2](layoutCustomizationDelegateSearchFieldContainerWillLayoutSubviewsCallback, v18, v7, v9, v11, v13, v14, v15, v16, v17);
    v4 = v18;
  }

}

- (_UISearchBarContainerSublayoutDelegate)delegate
{
  return (_UISearchBarContainerSublayoutDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)applyLayout
{
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  int v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _UISearchBarSearchContainerLayout *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  BOOL v25;

  -[_UISearchBarLayoutBase updateLayoutIfNeeded](self, "updateLayoutIfNeeded");
  if ((*(_WORD *)&self->_searchContainerLayoutFlags & 0x20) == 0)
  {
    -[_UISearchBarSearchContainerLayout searchFieldLayoutFrame](self, "searchFieldLayoutFrame");
    -[UITextField setFrame:](self->_searchField, "setFrame:");
    -[_UISearchBarSearchContainerLayout floatingSearchIconAlpha](self, "floatingSearchIconAlpha");
    -[UIView setAlpha:](self->_floatingSearchIconView, "setAlpha:");
    -[_UISearchBarSearchContainerLayout floatingSearchIconLayoutFrame](self, "floatingSearchIconLayoutFrame");
    -[UIImageView setFrame:](self->_floatingSearchIconView, "setFrame:");
    -[_UISearchBarSearchContainerLayout floatingSearchIconBackgroundAlpha](self, "floatingSearchIconBackgroundAlpha");
    -[UIView setAlpha:](self->_floatingSearchIconBackgroundView, "setAlpha:");
    -[_UISearchBarSearchContainerLayout floatingSearchIconBackgroundLayoutFrame](self, "floatingSearchIconBackgroundLayoutFrame");
    -[UIView setFrame:](self->_floatingSearchIconBackgroundView, "setFrame:");
    -[UITextField _setForegroundViewsAlpha:](self->_searchField, "_setForegroundViewsAlpha:", self->_searchFieldForegroundFadeAlpha);
    -[UISearchTextField _setBackgroundViewsAlpha:](self->_searchField, "_setBackgroundViewsAlpha:", self->_searchFieldBackgroundFadeAlpha);
    -[_UISearchBarSearchContainerLayout mainContentAlpha](self, "mainContentAlpha");
    -[UIView setAlpha:](self->_searchField, "setAlpha:");
    -[_UISearchBarSearchContainerLayout leftButtonLayoutFrame](self, "leftButtonLayoutFrame");
    -[UIView setFrame:](self->_leftButton, "setFrame:");
    v3 = 12;
    if ((*(_WORD *)&self->_searchContainerLayoutFlags & 2) == 0)
      v3 = 11;
    v17 = objc_retain(*(id *)((char *)&self->super.super.isa
                            + OBJC_IVAR____UISearchBarSearchContainerLayout__searchFieldLayoutFrame[v3]));
    if ((*(_WORD *)&self->_searchContainerLayoutFlags & 2) != 0)
      -[_UISearchBarSearchContainerLayout deleteButtonLayoutFrame](self, "deleteButtonLayoutFrame");
    else
      -[_UISearchBarSearchContainerLayout cancelButtonLayoutFrame](self, "cancelButtonLayoutFrame");
    v8 = v4;
    v9 = v5;
    v10 = v6;
    v11 = v7;
    v12 = *(_WORD *)&self->_searchContainerLayoutFlags & 3;
    objc_msgSend(v17, "subviews");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14
      || !+[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled"))
    {
      objc_msgSend(v17, "setFrame:", v8, v9, v10, v11, v17);
      if (v12)
        v15 = 1.0;
      else
        v15 = 0.0;
      -[_UISearchBarSearchContainerLayout mainContentAlpha](self, "mainContentAlpha");
      objc_msgSend(v17, "setAlpha:", v15 * v16);
    }
    else
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __48___UISearchBarSearchContainerLayout_applyLayout__block_invoke;
      v18[3] = &unk_1E16B7080;
      v21 = v8;
      v22 = v9;
      v23 = v10;
      v24 = v11;
      v25 = v12 != 0;
      v19 = v17;
      v20 = self;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v18);

    }
  }
}

- (double)mainContentAlpha
{
  return self->_mainContentAlpha;
}

- (CGRect)searchFieldLayoutFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  -[_UISearchBarLayoutBase updateLayoutIfNeeded](self, "updateLayoutIfNeeded");
  x = self->_searchFieldLayoutFrame.origin.x;
  y = self->_searchFieldLayoutFrame.origin.y;
  width = self->_searchFieldLayoutFrame.size.width;
  height = self->_searchFieldLayoutFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)leftButtonLayoutFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  -[_UISearchBarLayoutBase updateLayoutIfNeeded](self, "updateLayoutIfNeeded");
  x = self->_leftButtonLayoutFrame.origin.x;
  y = self->_leftButtonLayoutFrame.origin.y;
  width = self->_leftButtonLayoutFrame.size.width;
  height = self->_leftButtonLayoutFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)floatingSearchIconLayoutFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_floatingSearchIconLayoutFrame.origin.x;
  y = self->_floatingSearchIconLayoutFrame.origin.y;
  width = self->_floatingSearchIconLayoutFrame.size.width;
  height = self->_floatingSearchIconLayoutFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)floatingSearchIconAlpha
{
  return self->_floatingSearchIconAlpha;
}

- (CGRect)cancelButtonLayoutFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  -[_UISearchBarLayoutBase updateLayoutIfNeeded](self, "updateLayoutIfNeeded");
  x = self->_cancelButtonLayoutFrame.origin.x;
  y = self->_cancelButtonLayoutFrame.origin.y;
  width = self->_cancelButtonLayoutFrame.size.width;
  height = self->_cancelButtonLayoutFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)updateLayout
{
  id WeakRetained;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double *v16;
  double v17;
  double v18;
  _BOOL4 v19;
  double v20;
  UIView *cancelButton;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect *p_visibleCancelButtonSearchFieldLayoutFrame;
  CGFloat v27;
  __int16 searchContainerLayoutFlags;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  __int16 v42;
  double v43;
  double v44;
  int v45;
  double v46;
  double v47;
  double v48;
  double v49;
  CGFloat v50;
  __int16 v51;
  double searchBarReadableWidth;
  CGFloat Width;
  double (**v54)(double, double, double, double);
  double v55;
  CGFloat v56;
  double v57;
  double v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  double MaxX;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  CGFloat v69;
  CGFloat v70;
  double v71;
  double v72;
  CGFloat v73;
  double Height;
  double v75;
  void *v76;
  uint64_t v77;
  double v78;
  double v79;
  void *v80;
  void *v81;
  double v82;
  double v83;
  double (**delegateSearchFieldFrameForProposedFrame)(double, double, double, double);
  __int16 v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  CGFloat v92;
  double v93;
  double v94;
  double v95;
  double v96;
  CGFloat v97;
  double v98;
  CGFloat v99;
  double v100;
  CGFloat v101;
  void *v102;
  double v103;
  double v104;
  double v105;
  CGFloat v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double MinY;
  void *v112;
  double v113;
  double v114;
  double v115;
  void **p_floatingSearchIconBackgroundView;
  void *v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  int *v127;
  double *v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double MinX;
  double v134;
  CGFloat v135;
  CGFloat v136;
  CGFloat v137;
  double v138;
  CGFloat v139;
  double v140;
  double v141;
  CGFloat v142;
  double v143;
  double v144;
  double v145;
  double v146;
  CGFloat v147;
  CGFloat v148;
  CGFloat v149;
  double v150;
  double v151;
  double rect;
  double v153;
  CGFloat v154;
  UIOffset searchFieldBackgroundPositionAdjustment;
  _QWORD aBlock[9];
  BOOL v157;
  CGRect v158;
  CGRect v159;
  CGRect v160;
  CGRect v161;
  CGRect v162;
  CGRect v163;
  CGRect v164;
  CGRect v165;
  CGRect v166;
  CGRect v167;
  CGRect v168;
  CGRect v169;
  CGRect v170;
  CGRect v171;
  CGRect v172;
  CGRect v173;
  CGRect v174;
  CGRect v175;
  CGRect v176;
  CGRect v177;
  CGRect v178;
  CGRect v179;
  CGRect v180;
  CGRect v181;
  CGRect v182;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "containerLayoutWillUpdateLayout:", self);

  if ((*(_WORD *)&self->_searchContainerLayoutFlags & 0x20) == 0)
  {
    -[_UISearchBarLayoutBase contentInset](self, "contentInset");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[_UISearchBarLayoutBase layoutSize](self, "layoutSize");
    v13 = v12;
    v15 = v14;
    v16 = (double *)MEMORY[0x1E0C9D648];
    v17 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v18 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v19 = -[_UISearchBarLayoutBase isLayoutRTL](self, "isLayoutRTL");
    v20 = 1.0;
    if ((*(_WORD *)&self->_searchContainerLayoutFlags & 0x40) == 0)
      v20 = 0.0;
    cancelButton = self->_cancelButton;
    v132 = v20;
    if (cancelButton || (cancelButton = self->_deleteButton, rect = v18, v149 = v17, cancelButton))
    {
      -[UIView sizeThatFits:](cancelButton, "sizeThatFits:", v13, v15);
      v149 = v22;
      rect = v23;
    }
    -[UIView sizeThatFits:](self->_leftButton, "sizeThatFits:", v13, v15);
    v136 = v25;
    v137 = v24;
    -[_UISearchBarSearchContainerLayout searchFieldHeightUpdatingShrinkageAndFadeAlphas](self, "searchFieldHeightUpdatingShrinkageAndFadeAlphas");
    p_visibleCancelButtonSearchFieldLayoutFrame = &self->_visibleCancelButtonSearchFieldLayoutFrame;
    self->_visibleCancelButtonSearchFieldLayoutFrame.origin.y = 0.0;
    self->_visibleCancelButtonSearchFieldLayoutFrame.size.width = 0.0;
    self->_visibleCancelButtonSearchFieldLayoutFrame.origin.x = 0.0;
    v153 = v27;
    self->_visibleCancelButtonSearchFieldLayoutFrame.size.height = v27;
    searchContainerLayoutFlags = (__int16)self->_searchContainerLayoutFlags;
    v131 = v17;
    v139 = v18;
    if ((searchContainerLayoutFlags & 0x10) != 0)
    {
      v144 = 11.0;
    }
    else
    {
      -[_UISearchBarSearchContainerLayout additionalPaddingForCancelButtonAtLeadingEdge](self, "additionalPaddingForCancelButtonAtLeadingEdge");
      v144 = v29 + 11.0;
      searchContainerLayoutFlags = (__int16)self->_searchContainerLayoutFlags;
    }
    v30 = v13 - v7;
    v146 = v5;
    v31 = v15 - v5;
    v32 = v16[1];
    v150 = *v16;
    v33 = 0.0;
    v34 = 0.0;
    v142 = v32;
    if ((searchContainerLayoutFlags & 0x10) == 0)
    {
      -[_UISearchBarSearchContainerLayout additionalPaddingForSearchFieldAtLeadingEdge](self, "additionalPaddingForSearchFieldAtLeadingEdge");
      v32 = v142;
      v34 = v35;
    }
    v36 = v30 - v11;
    v37 = v31 - v9;
    v38 = v149;
    v39 = v150;
    v40 = v32;
    v41 = rect;
    v140 = v144 + CGRectGetWidth(*(CGRect *)(&v32 - 1));
    if (self->_leftButton)
    {
      v158.origin.x = v150;
      v158.origin.y = v40;
      v158.size.height = v136;
      v158.size.width = v137;
      v33 = CGRectGetWidth(v158) + 11.0;
    }
    v42 = (__int16)self->_searchContainerLayoutFlags;
    v43 = 0.0;
    if ((v42 & 4) != 0)
      v44 = v33;
    else
      v44 = 0.0;
    v45 = v42 & 3;
    if ((v42 & 3) != 0)
      v46 = v140;
    else
      v46 = 0.0;
    if ((v42 & 3) != 0)
      v43 = v34;
    v47 = v44 + v43;
    v148 = v146;
    v159.origin.x = v7;
    v159.origin.y = v146;
    v159.size.width = v36;
    v159.size.height = v37;
    v48 = CGRectGetWidth(v159) - v46 - v47;
    v160.origin.x = v7;
    v160.origin.y = v146;
    v160.size.width = v36;
    v160.size.height = v37;
    self->_visibleCancelButtonSearchFieldLayoutFrame.size.width = CGRectGetWidth(v160) - v140 - v33;
    v161.origin.x = v7;
    v161.origin.y = v146;
    v161.size.width = v36;
    v161.size.height = v37;
    v49 = CGRectGetMinX(v161) + v47;
    v50 = v48;
    v162.origin.x = v7;
    v162.origin.y = v146;
    v162.size.width = v36;
    v162.size.height = v37;
    p_visibleCancelButtonSearchFieldLayoutFrame->origin.x = v33 + CGRectGetMinX(v162);
    v51 = (__int16)self->_searchContainerLayoutFlags;
    if ((v51 & 0x400) != 0
      && (searchBarReadableWidth = self->_searchBarReadableWidth,
          v163.origin.y = 0.0,
          v163.origin.x = v49,
          v163.size.width = v48,
          v163.size.height = v153,
          Width = CGRectGetWidth(v163),
          v51 = (__int16)self->_searchContainerLayoutFlags,
          searchBarReadableWidth < Width))
    {
      *(_WORD *)&self->_searchContainerLayoutFlags = v51 | 0x800;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __49___UISearchBarSearchContainerLayout_updateLayout__block_invoke;
      aBlock[3] = &unk_1E16B7058;
      aBlock[4] = self;
      *(double *)&aBlock[5] = v7;
      *(double *)&aBlock[6] = v146;
      *(double *)&aBlock[7] = v36;
      *(double *)&aBlock[8] = v37;
      v157 = v19;
      v54 = (double (**)(double, double, double, double))_Block_copy(aBlock);
      v49 = v54[2](v49, 0.0, v48, v153);
      v56 = v55;
      v50 = v57;
      v153 = v58;
      self->_visibleCancelButtonSearchFieldLayoutFrame.origin.x = ((double (*)(double (**)(double, double, double, double), CGFloat, CGFloat, CGFloat, CGFloat))v54[2])(v54, self->_visibleCancelButtonSearchFieldLayoutFrame.origin.x, self->_visibleCancelButtonSearchFieldLayoutFrame.origin.y, self->_visibleCancelButtonSearchFieldLayoutFrame.size.width, self->_visibleCancelButtonSearchFieldLayoutFrame.size.height);
      self->_visibleCancelButtonSearchFieldLayoutFrame.origin.y = v59;
      self->_visibleCancelButtonSearchFieldLayoutFrame.size.width = v60;
      self->_visibleCancelButtonSearchFieldLayoutFrame.size.height = v61;

    }
    else
    {
      *(_WORD *)&self->_searchContainerLayoutFlags = v51 & 0xF7FF;
      v56 = 0.0;
    }
    v151 = v50;
    v164.origin.x = v7;
    v164.origin.y = v146;
    v164.size.width = v36;
    v164.size.height = v37;
    MinX = CGRectGetMinX(v164);
    v165.origin.x = v7;
    v165.origin.y = v146;
    v165.size.width = v36;
    v165.size.height = v37;
    MaxX = CGRectGetMaxX(v165);
    v166.size.width = v149;
    v166.origin.x = v150;
    v166.origin.y = v142;
    v166.size.height = rect;
    v63 = MaxX - CGRectGetWidth(v166);
    v167.origin.x = v49;
    v167.origin.y = v56;
    v167.size.width = v50;
    v167.size.height = v153;
    v64 = fmax(v63, v144 + CGRectGetMaxX(v167));
    if (v45)
      v64 = v63;
    v135 = v36;
    if (v19)
    {
      v145 = v63;
      v168.origin.x = v7;
      v168.origin.y = v146;
      v168.size.width = v36;
      v168.size.height = v37;
      v65 = CGRectGetMinX(v168);
      v169.origin.x = v7;
      v169.origin.y = v146;
      v169.size.width = v36;
      v66 = v37;
      v169.size.height = v37;
      v67 = v65 + CGRectGetMaxX(v169);
      v170.origin.x = v49;
      v170.origin.y = v56;
      v170.size.width = v50;
      v170.size.height = v153;
      v68 = v67 - CGRectGetMaxX(v170);
      p_visibleCancelButtonSearchFieldLayoutFrame->origin.x = fmax(v68, v140 + MinX);
      v49 = v68;
      if (v45)
      {
        v141 = MinX;
      }
      else
      {
        v69 = v56;
        v70 = v50;
        v71 = v153;
        v141 = fmin(MinX, CGRectGetMinX(*(CGRect *)&v68) - v140);
      }
    }
    else
    {
      v141 = v64;
      v66 = v37;
      v145 = MinX;
    }
    v72 = v146;
    v73 = v66;
    if (!-[_UISearchBarLayoutBase isHostedByNavigationBar](self, "isHostedByNavigationBar"))
    {
      v171.origin.x = v7;
      v171.origin.y = v146;
      v171.size.width = v36;
      v171.size.height = v66;
      Height = CGRectGetHeight(v171);
      v172.origin.x = v49;
      v172.origin.y = v56;
      v172.size.width = v151;
      v172.size.height = v153;
      v75 = v146 + (Height - CGRectGetHeight(v172)) * 0.5;
      +[UIDevice currentDevice](UIDevice, "currentDevice");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = objc_msgSend(v76, "userInterfaceIdiom");
      v78 = ceil(v75);
      v79 = floor(v75);
      if (v77 == 1)
        v72 = v78;
      else
        v72 = v79;

    }
    if (self->_searchFieldBackgroundPositionAdjustment.horizontal != 0.0
      || self->_searchFieldBackgroundPositionAdjustment.vertical != 0.0)
    {
      searchFieldBackgroundPositionAdjustment = self->_searchFieldBackgroundPositionAdjustment;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &searchFieldBackgroundPositionAdjustment, "{UIOffset=dd}");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = v80;
      if (v80)
      {
        objc_msgSend(v80, "UIOffsetValue");
        if (v19)
          v82 = -v82;
        v49 = v49 + v82;
        v72 = v72 + v83;
      }

    }
    self->_visibleCancelButtonSearchFieldLayoutFrame.origin.y = v72;
    delegateSearchFieldFrameForProposedFrame = (double (**)(double, double, double, double))self->_delegateSearchFieldFrameForProposedFrame;
    v85 = (__int16)self->_searchContainerLayoutFlags;
    if (!delegateSearchFieldFrameForProposedFrame || (v85 & 0x10) != 0)
    {
      v86 = v153;
    }
    else
    {
      v49 = delegateSearchFieldFrameForProposedFrame[2](v49, v72, v151, v153);
      v72 = v87;
      v151 = v88;
      v85 = (__int16)self->_searchContainerLayoutFlags;
    }
    v89 = round(v146 + v66 * 0.5 - rect * 0.5);
    v90 = -1.0;
    v147 = v49;
    v154 = v86;
    if ((v85 & 0x40) != 0)
    {
      v134 = v89;
      -[UIBarButtonItem view](self->_searchIconBarButtonItem, "view");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "imageViewSize");
      v101 = v103;
      v105 = v104;

      v173.origin.x = v7;
      v106 = v148;
      v173.origin.y = v148;
      v173.size.width = v36;
      v173.size.height = v73;
      CGRectGetWidth(v173);
      UIRoundToViewScale(self->_floatingSearchIconView);
      v108 = v107;
      v174.origin.x = v7;
      v174.origin.y = v148;
      v174.size.width = v36;
      v174.size.height = v73;
      v129 = v108 + CGRectGetMinX(v174);
      v175.origin.x = v7;
      v175.origin.y = v148;
      v175.size.width = v36;
      v175.size.height = v73;
      CGRectGetHeight(v175);
      v130 = v105;
      UIRoundToViewScale(self->_floatingSearchIconView);
      v110 = v109;
      v176.origin.x = v7;
      v176.origin.y = v148;
      v176.size.width = v36;
      v176.size.height = v73;
      MinY = CGRectGetMinY(v176);
      v96 = v110 + MinY;
      if ((*(_WORD *)&self->_searchContainerLayoutFlags & 8) == 0)
      {
        v97 = v131;
        v98 = v132;
        v100 = v142;
        v99 = v145;
        v89 = v134;
LABEL_57:
        v90 = -1.0;
        v95 = v129;
        v92 = v130;
LABEL_58:
        v126 = v89 + v90;
        self->_searchFieldLayoutFrame.origin.x = v147;
        self->_searchFieldLayoutFrame.origin.y = v72;
        self->_searchFieldLayoutFrame.size.width = v151;
        self->_searchFieldLayoutFrame.size.height = v154;
        self->_floatingSearchIconLayoutFrame.origin.x = v95;
        self->_floatingSearchIconLayoutFrame.origin.y = v96;
        self->_floatingSearchIconLayoutFrame.size.width = v101;
        self->_floatingSearchIconLayoutFrame.size.height = v92;
        self->_floatingSearchIconAlpha = v98;
        self->_floatingSearchIconBackgroundLayoutFrame.origin.x = v150;
        self->_floatingSearchIconBackgroundLayoutFrame.origin.y = v100;
        self->_floatingSearchIconBackgroundLayoutFrame.size.width = v97;
        self->_floatingSearchIconBackgroundLayoutFrame.size.height = v139;
        self->_floatingSearchIconBackgroundAlpha = v98;
        self->_mainContentAlpha = 1.0 - v98;
        if (self->_cancelButton)
        {
          v127 = &OBJC_IVAR____UISearchBarSearchContainerLayout__cancelButtonLayoutFrame;
        }
        else
        {
          v127 = &OBJC_IVAR____UISearchBarSearchContainerLayout__deleteButtonLayoutFrame;
          if (!self->_deleteButton)
            goto LABEL_62;
        }
        v128 = (double *)((char *)self + *v127);
        *v128 = v141;
        v128[1] = v126;
        v128[2] = v149;
        v128[3] = rect;
LABEL_62:
        if (self->_leftButton)
        {
          self->_leftButtonLayoutFrame.origin.x = v99;
          self->_leftButtonLayoutFrame.origin.y = v126;
          self->_leftButtonLayoutFrame.size.width = v137;
          self->_leftButtonLayoutFrame.size.height = v136;
        }
        return;
      }
      v143 = v110 + MinY;
      -[UIBarButtonItem view](self->_searchIconBarButtonItem, "view");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "backgroundSize");
      v119 = v118;
      v121 = v120;

      v179.origin.x = v7;
      v179.origin.y = v148;
      v179.size.width = v135;
      v179.size.height = v73;
      CGRectGetWidth(v179);
      v97 = v119;
      p_floatingSearchIconBackgroundView = (void **)&self->_floatingSearchIconBackgroundView;
      UIRoundToViewScale(self->_floatingSearchIconBackgroundView);
      v123 = v122;
      v180.origin.x = v7;
      v180.origin.y = v148;
      v180.size.width = v135;
      v180.size.height = v73;
      v150 = v123 + CGRectGetMinX(v180);
      v181.origin.x = v7;
      v181.origin.y = v148;
      v181.size.width = v135;
      v181.size.height = v73;
      CGRectGetHeight(v181);
      v139 = v121;
      v36 = v135;
    }
    else
    {
      -[UISearchTextField _searchIconViewRectForBounds:](self->_searchField, "_searchIconViewRectForBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v151);
      v138 = v93;
      v95 = v49 + v94;
      v96 = v72 + v91;
      v97 = v131;
      if ((*(_WORD *)&self->_searchContainerLayoutFlags & 8) == 0)
      {
        v98 = v132;
        v100 = v142;
        v99 = v145;
        v101 = v138;
        goto LABEL_58;
      }
      v143 = v72 + v91;
      v129 = v95;
      v130 = v92;
      v134 = v89;
      -[UIBarButtonItem view](self->_searchIconBarButtonItem, "view");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v112, "backgroundSize");
      v97 = v113;
      v115 = v114;

      v177.origin.x = v7;
      v106 = v148;
      v177.origin.y = v148;
      v177.size.width = v36;
      v177.size.height = v66;
      v150 = CGRectGetMinX(v177);
      v178.origin.x = v7;
      v178.origin.y = v148;
      v178.size.width = v36;
      v178.size.height = v66;
      CGRectGetHeight(v178);
      v139 = v115;
      p_floatingSearchIconBackgroundView = (void **)&self->_floatingSearchIconBackgroundView;
      v101 = v138;
    }
    UIRoundToViewScale(*p_floatingSearchIconBackgroundView);
    v125 = v124;
    v182.origin.x = v7;
    v182.origin.y = v106;
    v182.size.width = v36;
    v182.size.height = v73;
    v100 = v125 + CGRectGetMinY(v182);
    v98 = v132;
    v89 = v134;
    v96 = v143;
    v99 = v145;
    goto LABEL_57;
  }
}

- (double)searchFieldHeightUpdatingShrinkageAndFadeAlphas
{
  double v3;
  double v4;
  int *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  -[_UISearchBarSearchContainerLayout naturalSearchFieldHeight](self, "naturalSearchFieldHeight");
  v4 = v3;
  if ((*(_WORD *)&self->_searchContainerLayoutFlags & 0x80) != 0)
  {
    -[_UISearchBarLayoutBase layoutSize](self, "layoutSize");
    v8 = v7;
    -[_UISearchBarSearchContainerLayout naturalContainerHeight](self, "naturalContainerHeight");
    v10 = fmax(v9 - v8, 0.0);
    if (v4 <= v10)
      v10 = v4;
    v11 = v10 / v4;
    v4 = v4 - v10;
    v12 = fmax(v11 / 0.2, 0.0);
    if (v12 >= 1.0)
      v13 = 0.0;
    else
      v13 = 1.0 - v12;
    v5 = &OBJC_IVAR____UISearchBarSearchContainerLayout__searchFieldBackgroundFadeAlpha;
    self->_searchFieldForegroundFadeAlpha = v13;
    v14 = fmax((v11 + -0.8) / 0.15, 0.0);
    if (v14 >= 1.0)
      v6 = 0.0;
    else
      v6 = 1.0 - v14;
  }
  else
  {
    v5 = &OBJC_IVAR____UISearchBarSearchContainerLayout__searchFieldForegroundFadeAlpha;
    self->_searchFieldBackgroundFadeAlpha = 1.0;
    v6 = 1.0;
  }
  *(double *)((char *)&self->super.super.isa + *v5) = v6;
  return v4;
}

- (double)naturalSearchFieldHeight
{
  void *v4;
  double v5;
  double v6;
  double v7;
  id WeakRetained;
  double v9;
  void *v11;

  if ((*(_WORD *)&self->_searchContainerLayoutFlags & 0x100) == 0
    || (-[UITextField background](self->_searchField, "background"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "size"),
        v6 = v5,
        v4,
        v6 == 0.0))
  {
    -[_UISearchBarSearchContainerLayout searchBarFieldHeight](self, "searchBarFieldHeight");
    v6 = v7;
    if (v7 == 0.0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISearchBarSearchContainerLayout.m"), 202, CFSTR("searchBarFieldHeight is unexpectedly 0.0 in naturalContainerHeight"));

    }
  }
  if ((*(_WORD *)&self->_searchContainerLayoutFlags & 0x200) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "layout:fontScaledValueForValue:", self, v6);
    v6 = v9;

  }
  return v6;
}

- (double)additionalPaddingForSearchFieldAtLeadingEdge
{
  return self->_additionalPaddingForSearchFieldAtLeadingEdge;
}

- (double)additionalPaddingForCancelButtonAtLeadingEdge
{
  return self->_additionalPaddingForCancelButtonAtLeadingEdge;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_layoutCustomizationDelegateSearchFieldContainerWillLayoutSubviewsCallback, 0);
  objc_storeStrong(&self->_delegateSearchFieldFrameForProposedFrame, 0);
  objc_storeStrong((id *)&self->_searchIconBarButtonItem, 0);
  objc_storeStrong((id *)&self->_leftButton, 0);
  objc_storeStrong((id *)&self->_deleteButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_floatingSearchIconBackgroundView, 0);
  objc_storeStrong((id *)&self->_floatingSearchIconView, 0);
  objc_storeStrong((id *)&self->_searchField, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setDelegateSearchFieldFrameForProposedFrame:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (CGRect)deleteButtonLayoutFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  -[_UISearchBarLayoutBase updateLayoutIfNeeded](self, "updateLayoutIfNeeded");
  x = self->_deleteButtonLayoutFrame.origin.x;
  y = self->_deleteButtonLayoutFrame.origin.y;
  width = self->_deleteButtonLayoutFrame.size.width;
  height = self->_deleteButtonLayoutFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)visibleCancelButtonSearchFieldLayoutFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  -[_UISearchBarLayoutBase updateLayoutIfNeeded](self, "updateLayoutIfNeeded");
  x = self->_visibleCancelButtonSearchFieldLayoutFrame.origin.x;
  y = self->_visibleCancelButtonSearchFieldLayoutFrame.origin.y;
  width = self->_visibleCancelButtonSearchFieldLayoutFrame.size.width;
  height = self->_visibleCancelButtonSearchFieldLayoutFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)searchFieldWidthIsReduced
{
  -[_UISearchBarLayoutBase updateLayoutIfNeeded](self, "updateLayoutIfNeeded");
  return (*(_WORD *)&self->_searchContainerLayoutFlags >> 11) & 1;
}

- (BOOL)isHostedInlineByNavigationBar
{
  return (*(_WORD *)&self->_searchContainerLayoutFlags >> 4) & 1;
}

- (BOOL)isTextFieldManagedInNSToolbar
{
  return (*(_WORD *)&self->_searchContainerLayoutFlags >> 5) & 1;
}

- (BOOL)drawsSearchIconOnly
{
  return (*(_WORD *)&self->_searchContainerLayoutFlags >> 6) & 1;
}

- (BOOL)hasCancelButton
{
  return *(_WORD *)&self->_searchContainerLayoutFlags & 1;
}

- (BOOL)hasDeleteButton
{
  return (*(_WORD *)&self->_searchContainerLayoutFlags >> 1) & 1;
}

- (BOOL)hasLeftButton
{
  return (*(_WORD *)&self->_searchContainerLayoutFlags >> 2) & 1;
}

- (void)setHasFloatingSearchIconBackgroundView:(BOOL)a3
{
  __int16 searchContainerLayoutFlags;
  __int16 v4;

  searchContainerLayoutFlags = (__int16)self->_searchContainerLayoutFlags;
  if (((((searchContainerLayoutFlags & 8) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 8;
    else
      v4 = 0;
    *(_WORD *)&self->_searchContainerLayoutFlags = searchContainerLayoutFlags & 0xFFF7 | v4;
    -[_UISearchBarLayoutBase invalidateLayout](self, "invalidateLayout");
  }
}

- (BOOL)hasFloatingSearchIconBackgroundView
{
  return (*(_WORD *)&self->_searchContainerLayoutFlags >> 3) & 1;
}

- (BOOL)allowSearchFieldShrinkage
{
  return (*(_WORD *)&self->_searchContainerLayoutFlags >> 7) & 1;
}

- (BOOL)searchFieldUsesCustomBackgroundImage
{
  return HIBYTE(*(_WORD *)&self->_searchContainerLayoutFlags) & 1;
}

- (BOOL)searchFieldEffectivelySupportsDynamicType
{
  return (*(_WORD *)&self->_searchContainerLayoutFlags >> 9) & 1;
}

- (BOOL)searchFieldRespectsReadableWidth
{
  return (*(_WORD *)&self->_searchContainerLayoutFlags >> 10) & 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;
  CGSize size;
  CGSize v7;
  CGSize v8;
  CGSize v9;
  CGSize v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_UISearchBarSearchContainerLayout;
  v4 = -[_UISearchBarLayoutBase copyWithZone:](&v12, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 17, self->_searchField);
    objc_storeStrong(v5 + 18, self->_floatingSearchIconView);
    objc_storeStrong(v5 + 19, self->_floatingSearchIconBackgroundView);
    objc_storeStrong(v5 + 20, self->_cancelButton);
    objc_storeStrong(v5 + 21, self->_deleteButton);
    objc_storeStrong(v5 + 22, self->_leftButton);
    v5[9] = *(id *)&self->_searchContainerLayoutFlags;
    v5[23] = *(id *)&self->_searchBarReadableWidth;
    *((_OWORD *)v5 + 17) = self->_searchFieldBackgroundPositionAdjustment;
    v5[32] = *(id *)&self->_additionalPaddingForCancelButtonAtLeadingEdge;
    v5[33] = *(id *)&self->_additionalPaddingForSearchFieldAtLeadingEdge;
    v5[26] = *(id *)&self->_searchBarFieldHeight;
    size = self->_searchFieldLayoutFrame.size;
    *((_OWORD *)v5 + 18) = self->_searchFieldLayoutFrame.origin;
    *((CGSize *)v5 + 19) = size;
    v7 = self->_cancelButtonLayoutFrame.size;
    *((_OWORD *)v5 + 20) = self->_cancelButtonLayoutFrame.origin;
    *((CGSize *)v5 + 21) = v7;
    v8 = self->_deleteButtonLayoutFrame.size;
    *((_OWORD *)v5 + 22) = self->_deleteButtonLayoutFrame.origin;
    *((CGSize *)v5 + 23) = v8;
    v9 = self->_leftButtonLayoutFrame.size;
    *((_OWORD *)v5 + 24) = self->_leftButtonLayoutFrame.origin;
    *((CGSize *)v5 + 25) = v9;
    v10 = self->_visibleCancelButtonSearchFieldLayoutFrame.size;
    *((_OWORD *)v5 + 26) = self->_visibleCancelButtonSearchFieldLayoutFrame.origin;
    *((CGSize *)v5 + 27) = v10;
    v5[10] = *(id *)&self->_searchFieldForegroundFadeAlpha;
    v5[11] = *(id *)&self->_searchFieldBackgroundFadeAlpha;
    objc_msgSend(v5, "setDelegateSearchFieldFrameForProposedFrame:", self->_delegateSearchFieldFrameForProposedFrame);
    objc_msgSend(v5, "setLayoutCustomizationDelegateSearchFieldContainerWillLayoutSubviewsCallback:", self->_layoutCustomizationDelegateSearchFieldContainerWillLayoutSubviewsCallback);
  }
  return v5;
}

- (double)_effectiveInactiveWidth
{
  double v3;
  double result;

  -[_UISearchBarSearchContainerLayout overrideInactiveWidth](self, "overrideInactiveWidth");
  if (v3 <= 0.0)
    -[_UISearchBarSearchContainerLayout defaultInactiveWidth](self, "defaultInactiveWidth");
  else
    -[_UISearchBarSearchContainerLayout overrideInactiveWidth](self, "overrideInactiveWidth");
  return result;
}

- (double)_effectiveActiveWidth
{
  double v3;
  double result;

  -[_UISearchBarSearchContainerLayout overrideActiveWidth](self, "overrideActiveWidth");
  if (v3 <= 0.0)
    -[_UISearchBarSearchContainerLayout defaultActiveWidth](self, "defaultActiveWidth");
  else
    -[_UISearchBarSearchContainerLayout overrideActiveWidth](self, "overrideActiveWidth");
  return result;
}

- (double)prescribedWidth
{
  double v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v3 = 0.0;
  if (-[_UISearchBarSearchContainerLayout isHostedInlineByNavigationBar](self, "isHostedInlineByNavigationBar"))
  {
    if (-[_UISearchBarSearchContainerLayout drawsSearchIconOnly](self, "drawsSearchIconOnly"))
    {
      -[UIBarButtonItem view](self->_searchIconBarButtonItem, "view");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
      v3 = v5;

    }
    else
    {
      if (self->_representedLayoutState == 3)
        -[_UISearchBarSearchContainerLayout _effectiveActiveWidth](self, "_effectiveActiveWidth");
      else
        -[_UISearchBarSearchContainerLayout _effectiveInactiveWidth](self, "_effectiveInactiveWidth");
      v7 = v6;
      -[_UISearchBarLayoutBase contentInset](self, "contentInset");
      v9 = v7 + v8;
      -[_UISearchBarLayoutBase contentInset](self, "contentInset");
      v3 = v9 + v10;
      if (-[_UISearchBarSearchContainerLayout hasCancelButton](self, "hasCancelButton"))
      {
        -[UIView sizeThatFits:](self->_cancelButton, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
        return v3 + v11 + 11.0;
      }
    }
  }
  return v3;
}

- (id)description
{
  void *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int16 searchContainerLayoutFlags;
  uint64_t v15;
  double vertical;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)_UISearchBarSearchContainerLayout;
  -[_UISearchBarLayoutBase description](&v25, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!os_variant_has_internal_diagnostics())
    return v3;
  -[_UISearchBarSearchContainerLayout naturalContainerHeight](self, "naturalContainerHeight");
  v6 = v5;
  -[_UISearchBarSearchContainerLayout naturalSearchFieldHeight](self, "naturalSearchFieldHeight");
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" naturalContainerHeight=%g naturalSearchFieldHeight=%g"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_leftButton)
  {
    objc_msgSend(v8, "stringByAppendingFormat:", CFSTR(" leftButton=%p"), self->_leftButton);
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  if (self->_cancelButton)
  {
    objc_msgSend(v8, "stringByAppendingFormat:", CFSTR(" cancelButton=%p"), self->_cancelButton);
    v10 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v10;
  }
  if (self->_deleteButton)
  {
    objc_msgSend(v8, "stringByAppendingFormat:", CFSTR(" deleteButton=%p"), self->_deleteButton);
    v11 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v11;
  }
  if (self->_searchField)
  {
    objc_msgSend(v8, "stringByAppendingFormat:", CFSTR(" searchField=%p"), self->_searchField);
    v12 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v12;
  }
  if (self->_floatingSearchIconView)
  {
    objc_msgSend(v8, "stringByAppendingFormat:", CFSTR(" searchIconView=%p"), self->_floatingSearchIconView);
    v13 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v13;
  }
  searchContainerLayoutFlags = (__int16)self->_searchContainerLayoutFlags;
  if ((searchContainerLayoutFlags & 0x80) != 0)
  {
    objc_msgSend(v8, "stringByAppendingString:", CFSTR(" allowSearchFieldShrinkage"));
    v22 = objc_claimAutoreleasedReturnValue();

    searchContainerLayoutFlags = (__int16)self->_searchContainerLayoutFlags;
    v8 = (void *)v22;
    if ((searchContainerLayoutFlags & 0x100) == 0)
    {
LABEL_15:
      if ((searchContainerLayoutFlags & 0x200) == 0)
        goto LABEL_16;
      goto LABEL_31;
    }
  }
  else if ((*(_WORD *)&self->_searchContainerLayoutFlags & 0x100) == 0)
  {
    goto LABEL_15;
  }
  objc_msgSend(v8, "stringByAppendingString:", CFSTR(" searchFieldUsesCustomBackgroundImage"));
  v23 = objc_claimAutoreleasedReturnValue();

  searchContainerLayoutFlags = (__int16)self->_searchContainerLayoutFlags;
  v8 = (void *)v23;
  if ((searchContainerLayoutFlags & 0x200) == 0)
  {
LABEL_16:
    if ((searchContainerLayoutFlags & 0x400) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_31:
  objc_msgSend(v8, "stringByAppendingString:", CFSTR(" supportsDynamicType"));
  v24 = objc_claimAutoreleasedReturnValue();

  v8 = (void *)v24;
  if ((*(_WORD *)&self->_searchContainerLayoutFlags & 0x400) != 0)
  {
LABEL_17:
    objc_msgSend(v8, "stringByAppendingFormat:", CFSTR(" readableWidth=%g"), *(_QWORD *)&self->_searchBarReadableWidth);
    v15 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v15;
  }
LABEL_18:
  vertical = self->_searchFieldBackgroundPositionAdjustment.vertical;
  if (self->_searchFieldBackgroundPositionAdjustment.horizontal != 0.0 || vertical != 0.0)
  {
    objc_msgSend(v8, "stringByAppendingFormat:", CFSTR(" searchFieldBackgroundPositionAdjustment=(%g,%g)"), *(_QWORD *)&self->_searchFieldBackgroundPositionAdjustment.horizontal, *(_QWORD *)&vertical);
    v17 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v17;
  }
  if (-[_UISearchBarLayoutBase isLayoutValid](self, "isLayoutValid"))
  {
    objc_msgSend(v8, "stringByAppendingString:", CFSTR(" layoutFrames:"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (self->_leftButton)
    {
      objc_msgSend(v18, "stringByAppendingFormat:", CFSTR(" leftButton=(%g, %g; %g, %g)"),
        *(_QWORD *)&self->_leftButtonLayoutFrame.origin.x,
        *(_QWORD *)&self->_leftButtonLayoutFrame.origin.y,
        *(_QWORD *)&self->_leftButtonLayoutFrame.size.width,
        *(_QWORD *)&self->_leftButtonLayoutFrame.size.height);
      v19 = objc_claimAutoreleasedReturnValue();

      v18 = (void *)v19;
    }
    if (self->_cancelButton)
    {
      objc_msgSend(v18, "stringByAppendingFormat:", CFSTR(" cancelButton=(%g, %g; %g, %g)"),
        *(_QWORD *)&self->_cancelButtonLayoutFrame.origin.x,
        *(_QWORD *)&self->_cancelButtonLayoutFrame.origin.y,
        *(_QWORD *)&self->_cancelButtonLayoutFrame.size.width,
        *(_QWORD *)&self->_cancelButtonLayoutFrame.size.height);
      v20 = objc_claimAutoreleasedReturnValue();

      v18 = (void *)v20;
    }
    if (self->_deleteButton)
    {
      objc_msgSend(v18, "stringByAppendingFormat:", CFSTR(" deleteButton=(%g, %g; %g, %g)"),
        *(_QWORD *)&self->_deleteButtonLayoutFrame.origin.x,
        *(_QWORD *)&self->_deleteButtonLayoutFrame.origin.y,
        *(_QWORD *)&self->_deleteButtonLayoutFrame.size.width,
        *(_QWORD *)&self->_deleteButtonLayoutFrame.size.height);
      v21 = objc_claimAutoreleasedReturnValue();

      v18 = (void *)v21;
    }
    objc_msgSend(v18, "stringByAppendingFormat:", CFSTR(" searchField=(%g, %g; %g, %g)"),
      *(_QWORD *)&self->_searchFieldLayoutFrame.origin.x,
      *(_QWORD *)&self->_searchFieldLayoutFrame.origin.y,
      *(_QWORD *)&self->_searchFieldLayoutFrame.size.width,
      *(_QWORD *)&self->_searchFieldLayoutFrame.size.height);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = v8;
  }
  return v3;
}

- (double)defaultInactiveWidth
{
  return self->_defaultInactiveWidth;
}

- (double)defaultActiveWidth
{
  return self->_defaultActiveWidth;
}

- (double)overrideInactiveWidth
{
  return self->_overrideInactiveWidth;
}

- (double)overrideActiveWidth
{
  return self->_overrideActiveWidth;
}

- (UIImageView)floatingSearchIconView
{
  return self->_floatingSearchIconView;
}

- (UIView)floatingSearchIconBackgroundView
{
  return self->_floatingSearchIconBackgroundView;
}

- (void)setFloatingSearchIconBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_floatingSearchIconBackgroundView, a3);
}

- (UIView)cancelButton
{
  return self->_cancelButton;
}

- (UIView)deleteButton
{
  return self->_deleteButton;
}

- (UIView)leftButton
{
  return self->_leftButton;
}

- (double)searchBarReadableWidth
{
  return self->_searchBarReadableWidth;
}

- (UIOffset)searchFieldBackgroundPositionAdjustment
{
  double horizontal;
  double vertical;
  UIOffset result;

  horizontal = self->_searchFieldBackgroundPositionAdjustment.horizontal;
  vertical = self->_searchFieldBackgroundPositionAdjustment.vertical;
  result.vertical = vertical;
  result.horizontal = horizontal;
  return result;
}

- (UIBarButtonItem)searchIconBarButtonItem
{
  return self->_searchIconBarButtonItem;
}

- (int64_t)representedLayoutState
{
  return self->_representedLayoutState;
}

- (CGRect)floatingSearchIconBackgroundLayoutFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_floatingSearchIconBackgroundLayoutFrame.origin.x;
  y = self->_floatingSearchIconBackgroundLayoutFrame.origin.y;
  width = self->_floatingSearchIconBackgroundLayoutFrame.size.width;
  height = self->_floatingSearchIconBackgroundLayoutFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)floatingSearchIconBackgroundAlpha
{
  return self->_floatingSearchIconBackgroundAlpha;
}

- (id)delegateSearchFieldFrameForProposedFrame
{
  return self->_delegateSearchFieldFrameForProposedFrame;
}

- (id)layoutCustomizationDelegateSearchFieldContainerWillLayoutSubviewsCallback
{
  return self->_layoutCustomizationDelegateSearchFieldContainerWillLayoutSubviewsCallback;
}

- (void)setLayoutCustomizationDelegateSearchFieldContainerWillLayoutSubviewsCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (void)setAdditionalPaddingForCancelButtonAtLeadingEdge:(double)a3
{
  self->_additionalPaddingForCancelButtonAtLeadingEdge = a3;
}

- (void)setAdditionalPaddingForSearchFieldAtLeadingEdge:(double)a3
{
  self->_additionalPaddingForSearchFieldAtLeadingEdge = a3;
}

@end
