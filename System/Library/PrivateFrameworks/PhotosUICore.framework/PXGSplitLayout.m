@implementation PXGSplitLayout

- (int64_t)scrollableAxis
{
  unint64_t v3;
  void *v4;
  void *v5;
  int64_t v6;
  void *v8;
  objc_super v9;

  v3 = -[PXGSplitLayout mode](self, "mode");
  if (v3 > 7)
    goto LABEL_6;
  if (((1 << v3) & 0xDE) != 0)
  {
    -[PXGSplitLayout secondSublayout](self, "secondSublayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  if (v3)
  {
    -[PXGSplitLayout firstSublayout](self, "firstSublayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  -[PXGSplitLayout firstSublayout](self, "firstSublayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
LABEL_4:
    v5 = v4;
    v6 = objc_msgSend(v4, "scrollableAxis");
    goto LABEL_5;
  }
  -[PXGSplitLayout secondSublayout](self, "secondSublayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v8, "scrollableAxis");

  v5 = 0;
LABEL_5:

  if (!v6)
  {
LABEL_6:
    v9.receiver = self;
    v9.super_class = (Class)PXGSplitLayout;
    return -[PXGLayout scrollableAxis](&v9, sel_scrollableAxis);
  }
  return v6;
}

- (int64_t)mode
{
  return self->_mode;
}

- (PXGLayout)secondSublayout
{
  return self->_secondSublayout;
}

- (void)update
{
  uint64_t v3;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 isPerformingUpdate;
  $F40CD077B40800501ED060B808F886F7 *p_additionalUpdateFlags;
  unint64_t v8;
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
  objc_super v19;

  v3 = -[PXGLayout numberOfDescendantAnchors](self, "numberOfDescendantAnchors");
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (v3 >= 1)
  {
    isPerformingUpdate = self->_updateFlags.isPerformingUpdate;
    if (self->_updateFlags.isPerformingUpdate && (self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGSplitLayout update]");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("PXGSplitLayout.m"), 191, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    needsUpdate |= 1uLL;
    p_updateFlags->needsUpdate = needsUpdate;
    self->_updateFlags.willPerformUpdate = 0;
    if (!isPerformingUpdate)
      goto LABEL_5;
    goto LABEL_19;
  }
  self->_updateFlags.willPerformUpdate = 0;
  if (!needsUpdate)
    goto LABEL_16;
  if (self->_updateFlags.isPerformingUpdate)
  {
LABEL_19:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGSplitLayout update]");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("PXGSplitLayout.m"), 194, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

    needsUpdate = p_updateFlags->needsUpdate;
  }
LABEL_5:
  self->_updateFlags.isPerformingUpdate = 1;
  self->_updateFlags.updated = 1;
  if ((needsUpdate & 1) != 0)
  {
    p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
    -[PXGSplitLayout _updateSublayoutGeometries](self, "_updateSublayoutGeometries");
    p_additionalUpdateFlags = &self->_additionalUpdateFlags;
    self->_additionalUpdateFlags.willPerformUpdate = 0;
    v8 = self->_additionalUpdateFlags.needsUpdate;
    if (v8)
    {
      if (self->_additionalUpdateFlags.isPerformingUpdate)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGSplitLayout update]");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("PXGSplitLayout.m"), 198, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_additionalUpdateFlags.isPerformingUpdate"));

        v8 = p_additionalUpdateFlags->needsUpdate;
      }
      self->_additionalUpdateFlags.isPerformingUpdate = 1;
      self->_additionalUpdateFlags.updated = 1;
      if ((v8 & 1) != 0)
      {
        p_additionalUpdateFlags->needsUpdate = v8 & 0xFFFFFFFFFFFFFFFELL;
        self->_isPerformingAdditionalUpdate = 1;
        -[PXGSplitLayout _updateSublayoutGeometries](self, "_updateSublayoutGeometries");
        self->_isPerformingAdditionalUpdate = 0;
        v8 = p_additionalUpdateFlags->needsUpdate;
      }
      self->_additionalUpdateFlags.isPerformingUpdate = 0;
      if (v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGSplitLayout update]");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("PXGSplitLayout.m"), 204, CFSTR("still needing to update %lu after update pass"), p_additionalUpdateFlags->needsUpdate);

      }
    }
    needsUpdate = p_updateFlags->needsUpdate;
  }
  self->_updateFlags.isPerformingUpdate = 0;
  if (needsUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGSplitLayout update]");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("PXGSplitLayout.m"), 206, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

  }
LABEL_16:
  v19.receiver = self;
  v19.super_class = (Class)PXGSplitLayout;
  -[PXGLayout update](&v19, sel_update);
}

- (void)sublayoutNeedsUpdate:(id)a3
{
  id v4;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXGSplitLayout;
  -[PXGLayout sublayoutNeedsUpdate:](&v10, sel_sublayoutNeedsUpdate_, v4);
  if (self->_isUpdatingSublayouts)
  {
    -[PXGLayout assumeWillUpdateSublayoutInUpdatePass:](self, "assumeWillUpdateSublayoutInUpdatePass:", v4);
    goto LABEL_9;
  }
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_8:
      p_updateFlags->needsUpdate = needsUpdate | 1;
      goto LABEL_9;
    }
LABEL_7:
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGSplitLayout sublayoutNeedsUpdate:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("PXGSplitLayout.m"), 519, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    goto LABEL_8;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_7;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 1;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
LABEL_9:

}

- (void)_updateSublayoutGeometries
{
  _QWORD v3[5];

  self->_isUpdatingSublayouts = 1;
  -[PXGSplitLayout _performUpdateSublayoutGeometries](self, "_performUpdateSublayoutGeometries");
  if (-[PXGLayout hasSublayoutsRemainingToBeUpdated](self, "hasSublayoutsRemainingToBeUpdated")
    && -[PXGSplitLayout allowsRepeatedSublayoutsUpdates](self, "allowsRepeatedSublayoutsUpdates"))
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __44__PXGSplitLayout__updateSublayoutGeometries__block_invoke;
    v3[3] = &unk_1E5149198;
    v3[4] = self;
    -[PXGLayout performRepeatedSublayoutsUpdate:](self, "performRepeatedSublayoutsUpdate:", v3);
  }
  self->_isUpdatingSublayouts = 0;
}

- (void)_replaceSublayout:(id)a3 withSublayout:(id)a4 atIndex:(int64_t)a5
{
  id v8;
  id v9;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v13;
  void *v14;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  self->_settingSublayouts = 1;
  objc_msgSend(v9, "setNeedsUpdate");
  if (v8)
  {
    v15.receiver = self;
    v15.super_class = (Class)PXGSplitLayout;
    -[PXGLayout removeSublayoutsInRange:](&v15, sel_removeSublayoutsInRange_, a5, 1);
  }
  if (v9)
    -[PXGLayout insertSublayout:atIndex:](self, "insertSublayout:atIndex:", v9, a5);
  self->_settingSublayouts = 0;
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_10:
      p_updateFlags->needsUpdate = needsUpdate | 1;
      goto LABEL_11;
    }
LABEL_9:
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGSplitLayout _replaceSublayout:withSublayout:atIndex:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("PXGSplitLayout.m"), 68, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    goto LABEL_10;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_9;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 1;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
LABEL_11:
  -[PXGLayout setNeedsUpdateOfScrollableAxis](self, "setNeedsUpdateOfScrollableAxis");

}

- (void)didAddSublayout:(id)a3 atIndex:(int64_t)a4 flags:(unint64_t)a5
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXGSplitLayout;
  -[PXGLayout didAddSublayout:atIndex:flags:](&v5, sel_didAddSublayout_atIndex_flags_, a3, a4, a5);
}

- (void)setMode:(int64_t)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v7;
  void *v8;

  if (self->_mode != a3)
  {
    self->_mode = a3;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 1;
LABEL_8:
        -[PXGLayout setNeedsUpdateOfScrollableAxis](self, "setNeedsUpdateOfScrollableAxis");
        return;
      }
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      p_updateFlags->needsUpdate = 1;
      if (!willPerformUpdate)
        -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
      goto LABEL_8;
    }
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGSplitLayout setMode:]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("PXGSplitLayout.m"), 107, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    goto LABEL_7;
  }
}

- (void)setInterlayoutSpacing:(double)a3
{
  self->_interlayoutSpacing = a3;
}

void __51__PXGSplitLayout__performUpdateSublayoutGeometries__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  double v12;
  id v13;
  CGRect v14;

  v13 = a3;
  objc_msgSend(v13, "setViewEnvironment:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v13, "setReferenceSize:", *(double *)(a1 + 80), *(double *)(a1 + 88));
  objc_msgSend(v13, "setReferenceDepth:", *(double *)(a1 + 96));
  objc_msgSend(v13, "setReferenceOptions:", *(unsigned __int16 *)(a1 + 224));
  objc_msgSend(v13, "setDisplayScale:", *(double *)(a1 + 104));
  objc_msgSend(v13, "setLastScrollDirection:", *(double *)(a1 + 112), *(double *)(a1 + 120));
  objc_msgSend(v13, "setScrollSpeedRegime:", *(_QWORD *)(a1 + 128));
  objc_msgSend(v13, "setSafeAreaInsets:", *(double *)(a1 + 136), *(double *)(a1 + 144), *(double *)(a1 + 152), *(double *)(a1 + 160));
  objc_msgSend(v13, "setUserInterfaceDirection:", *(_QWORD *)(a1 + 168));
  v14 = CGRectOffset(*(CGRect *)(a1 + 176), -*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32), -*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  v5 = v13;
  if (*(id *)(a1 + 40) == v13)
    *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32) = v14;
  if (*(id *)(a1 + 48) == v13 && *(_QWORD *)(a1 + 208) == 6)
  {
    PXRectWithOriginAndSize();
    v5 = v13;
  }
  objc_msgSend(v5, "setVisibleRect:");
  if (a2 || (v6 = *(_QWORD *)(a1 + 208), v6 > 5))
    v7 = 0;
  else
    v7 = qword_1A7C08F38[v6];
  if (*(_QWORD *)(a1 + 216) - 1 == a2)
  {
    v8 = *(_QWORD *)(a1 + 208);
    v9 = 5;
    if (v8 == 5)
      v9 = v7;
    if (v8 >= 2)
      v7 = v9;
    else
      v7 |= 4uLL;
  }
  objc_msgSend(v13, "createAnchorFromSuperlayoutWithSublayoutIndex:sublayoutPositionEdges:ignoringScrollingAnimationAnchors:", a2, v7, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v10, "autoInvalidate");

  objc_msgSend(v13, "updateIfNeeded");
  objc_msgSend(*(id *)(a1 + 56), "didUpdateSublayout:", v13);
  if (*(_QWORD *)(a1 + 208) <= 1uLL)
  {
    objc_msgSend(v13, "contentSize");
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = v12
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                            + 40);
  }

}

- (void)didUpdate
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXGSplitLayout;
  -[PXGLayout didUpdate](&v5, sel_didUpdate);
  if (self->_updateFlags.willPerformUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGSplitLayout didUpdate]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXGSplitLayout.m"), 213, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.willPerformUpdate"));

  }
}

- (void)_performUpdateSublayoutGeometries
{
  unint64_t v3;
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
  unsigned __int16 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  int64_t v35;
  unsigned __int16 v36;
  PXGLayout *v37;
  uint64_t v38;
  PXGLayout *firstSublayout;
  PXGLayout *v40;
  PXGLayout *v41;
  __int128 v42;
  void *v43;
  uint64_t v44;
  void *v45;
  PXGLayout *v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  int64_t v51;
  BOOL v52;
  double v53;
  double v54;
  double v55;
  double v56;
  PXGLayout *v57;
  PXGLayout *secondSublayout;
  double v59;
  double v60;
  double v61;
  double v62;
  BOOL v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  PXGLayout *v69;
  _BOOL4 v70;
  void *v71;
  void *v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  id v79;
  void *v80;
  unint64_t v81;
  double v82;
  CGFloat v83;
  uint64_t v84;
  void *v85;
  PXGLayout *v86;
  uint64_t v87;
  double v88;
  double width;
  double height;
  double x;
  double y;
  CGFloat v93;
  double v94;
  __int128 v95;
  _QWORD v96[5];
  __int128 v97;
  double v98;
  double v99;
  __int128 v100;
  double v101;
  BOOL v102;
  _QWORD v103[4];
  id v104;
  PXGLayout *v105;
  PXGLayout *v106;
  PXGSplitLayout *v107;
  _QWORD *v108;
  _QWORD *v109;
  double v110;
  double v111;
  double v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  int64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  unint64_t v121;
  double v122;
  double v123;
  double v124;
  double v125;
  unint64_t v126;
  uint64_t v127;
  unsigned __int16 v128;
  _QWORD v129[4];
  __int128 v130;
  __int128 v131;
  _QWORD v132[4];
  __int128 v133;
  __int128 v134;
  __int128 v135;
  CGRect v136;
  CGRect v137;

  v3 = -[PXGSplitLayout mode](self, "mode");
  -[PXGSplitLayout padding](self, "padding");
  v5 = v4;
  v94 = v6;
  v8 = v7;
  v88 = v9;
  -[PXGLayout referenceSize](self, "referenceSize");
  v11 = v10;
  v13 = v12;
  -[PXGLayout referenceDepth](self, "referenceDepth");
  v82 = v14;
  v93 = v5;
  v83 = v8;
  if (-[PXGSplitLayout shouldExcludeTopAndBottomPaddingFromReferenceSize](self, "shouldExcludeTopAndBottomPaddingFromReferenceSize"))
  {
    v15 = 0.0;
  }
  else
  {
    v15 = v5 + v8;
  }
  v16 = -[PXGLayout referenceOptions](self, "referenceOptions");
  -[PXGLayout viewEnvironment](self, "viewEnvironment");
  v17 = objc_claimAutoreleasedReturnValue();
  -[PXGLayout safeAreaInsets](self, "safeAreaInsets");
  v87 = v18;
  v84 = v19;
  v21 = v20;
  v23 = v22;
  -[PXGLayout displayScale](self, "displayScale");
  v25 = v24;
  -[PXGLayout visibleRect](self, "visibleRect");
  x = v26;
  y = v27;
  width = v28;
  height = v29;
  -[PXGLayout lastScrollDirection](self, "lastScrollDirection");
  v31 = v30;
  v33 = v32;
  v34 = -[PXGLayout scrollSpeedRegime](self, "scrollSpeedRegime");
  v85 = (void *)v17;
  v81 = -[PXGLayout userInterfaceDirection](self, "userInterfaceDirection");
  if (v3 > 7)
  {
    v35 = v34;
    v36 = v16;
    v40 = 0;
    v37 = 0;
    goto LABEL_9;
  }
  if (((1 << v3) & 0xDE) != 0)
  {
    v35 = v34;
    v36 = v16;
    v37 = self->_secondSublayout;
    v38 = 904;
  }
  else
  {
    if (!v3)
    {
      if (-[PXGLayout numberOfSublayouts](self, "numberOfSublayouts") == 1)
      {
        v36 = v16;
        firstSublayout = self->_firstSublayout;
        v35 = v34;
        v40 = 0;
        if (!firstSublayout)
          firstSublayout = self->_secondSublayout;
        v37 = firstSublayout;
      }
      else
      {
        v35 = v34;
        v36 = v16;
        firstSublayout = 0;
        v40 = 0;
        v37 = 0;
      }
      goto LABEL_8;
    }
    v35 = v34;
    v36 = v16;
    v37 = self->_firstSublayout;
    v38 = 912;
  }
  firstSublayout = *(PXGLayout **)((char *)&self->super.super.isa + v38);
  v40 = firstSublayout;
LABEL_8:
  v41 = firstSublayout;
LABEL_9:
  v134 = *MEMORY[0x1E0C9D538];
  v135 = v134;
  v132[0] = 0;
  v132[1] = v132;
  v132[2] = 0x3010000000;
  v132[3] = &unk_1A7E74EE7;
  v133 = v134;
  v129[0] = 0;
  v129[1] = v129;
  v129[2] = 0x4010000000;
  v129[3] = &unk_1A7E74EE7;
  v42 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v130 = *MEMORY[0x1E0C9D648];
  v131 = v42;
  -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "count");

  -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v103[0] = MEMORY[0x1E0C809B0];
  v103[1] = 3221225472;
  v103[2] = __51__PXGSplitLayout__performUpdateSublayoutGeometries__block_invoke;
  v103[3] = &unk_1E51176D8;
  v110 = v11 - (v94 + v88);
  v111 = v13 - v15;
  v128 = v36;
  v112 = v82;
  v113 = v25;
  v114 = v31;
  v115 = v33;
  v116 = v35;
  v117 = v87;
  v118 = v84;
  v119 = v21;
  v120 = v23;
  v121 = v81;
  v122 = x;
  v123 = y;
  v124 = width;
  v125 = height;
  v79 = v85;
  v104 = v79;
  v108 = v132;
  v46 = v37;
  v105 = v46;
  v109 = v129;
  v126 = v3;
  v127 = v44;
  v86 = v40;
  v106 = v86;
  v107 = self;
  objc_msgSend(v45, "enumerateSublayoutsUsingBlock:", v103);

  if (v46)
  {
    -[PXGLayout visibleRect](v46, "visibleRect", v79);
    PXPointSubtract();
    v48 = v47;
    v50 = v49;
    v136.origin.x = x;
    v136.origin.y = y;
    v136.size.width = width;
    v136.size.height = height;
    v137 = CGRectOffset(v136, v48, v50);
    x = v137.origin.x;
    y = v137.origin.y;
    width = v137.size.width;
    height = v137.size.height;
    v51 = -[PXGSplitLayout mode](self, "mode");
    v52 = v50 == *(double *)(MEMORY[0x1E0C9D538] + 8) && v48 == *MEMORY[0x1E0C9D538];
    if (!v52 && v86)
    {
      v53 = x;
      v54 = y;
      v55 = width;
      v56 = height;
      if (v51 != 2)
      {
        v53 = x;
        v54 = y;
        v55 = width;
        v56 = height;
        if (v51 != 5)
        {
          if (v51 != 6)
          {
LABEL_20:
            -[PXGLayout updateIfNeeded](v86, "updateIfNeeded");
            -[PXGLayout didUpdateSublayout:](self, "didUpdateSublayout:", v86);
            goto LABEL_21;
          }
          PXRectWithOriginAndSize();
        }
      }
      -[PXGLayout setVisibleRect:](v86, "setVisibleRect:", v53, v54, v55, v56);
      goto LABEL_20;
    }
  }
LABEL_21:
  if (-[PXGSplitLayout scrollableAxis](self, "scrollableAxis", v79))
    -[PXGSplitLayout scrollableAxis](self, "scrollableAxis");
  PXAxisTransposed();
  PXPointValueForAxis();
  v57 = self->_firstSublayout;
  if (v57)
  {
    -[PXGLayout contentSize](v57, "contentSize");
    PXSizeValueForAxis();
  }
  secondSublayout = self->_secondSublayout;
  if (secondSublayout)
  {
    -[PXGLayout contentSize](secondSublayout, "contentSize");
    PXSizeValueForAxis();
  }
  -[PXGSplitLayout floatingThresholdOffset](self, "floatingThresholdOffset");
  -[PXGSplitLayout floatingModesRespectSafeArea](self, "floatingModesRespectSafeArea");
  PXSizeValueForAxis();
  v59 = 0.0;
  switch(v3)
  {
    case 0uLL:
      *(double *)&v135 = v94;
      *((CGFloat *)&v135 + 1) = v93;
      PXPointSetValueForAxis();
      PXPointValueForAxis();
      PXPointSetValueForAxis();
      v69 = self->_firstSublayout;
      if (v69 && !self->_secondSublayout)
      {
        -[PXGLayout contentSize](v69, "contentSize");
        PXSizeValueForAxis();
      }
      v63 = 0;
      v68 = 0.0;
      goto LABEL_51;
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 6uLL:
      PXPointValueForAxis();
      PXPointValueForAxis();
      PXClamp();
      PXPointSetValueForAxis();
      PXPointValueForAxis();
      PXPointSetValueForAxis();
      PXPointValueForAxis();
      v61 = v60;
      PXPointValueForAxis();
      v63 = v61 > v62;
      v64 = 0.0;
      if (v61 > v62)
      {
        PXPointValueForAxis();
        v66 = v65;
        PXPointValueForAxis();
        v64 = v66 - v67;
      }
      *(double *)&v134 = v94;
      *((CGFloat *)&v134 + 1) = v93;
      if (v3 == 1)
      {
        PXPointValueForAxis();
        PXPointSetValueForAxis();
      }
      v59 = v82 * 0.5;
      v68 = 0.0;
      goto LABEL_52;
    case 4uLL:
    case 5uLL:
      v63 = 0;
      *(double *)&v135 = v94;
      *((CGFloat *)&v135 + 1) = v93;
      *(double *)&v134 = v94;
      *((CGFloat *)&v134 + 1) = v93;
      v64 = 0.0;
      if (v3 == 4)
        v68 = 0.0;
      else
        v68 = v82 * 0.5;
      if (v3 == 4)
        v59 = v82 * 0.5;
      else
        v59 = 0.0;
      goto LABEL_52;
    case 7uLL:
      v63 = 0;
      *(double *)&v135 = v94;
      *((CGFloat *)&v135 + 1) = v93;
      *(double *)&v134 = v94;
      *((CGFloat *)&v134 + 1) = v93;
      v68 = v82 * 0.5;
      goto LABEL_51;
    default:
      v63 = 0;
      v68 = 0.0;
LABEL_51:
      v64 = 0.0;
LABEL_52:
      v70 = -[PXGSplitLayout adjustSublayoutZPositions](self, "adjustSublayoutZPositions");
      -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = v71;
      v96[0] = MEMORY[0x1E0C809B0];
      if (v70)
        v73 = v68;
      else
        v73 = 0.0;
      v96[1] = 3221225472;
      if (v70)
        v74 = v59;
      else
        v74 = 0.0;
      v96[2] = __51__PXGSplitLayout__performUpdateSublayoutGeometries__block_invoke_2;
      v96[3] = &unk_1E5117700;
      v96[4] = self;
      v97 = v135;
      v102 = v63;
      v98 = v73;
      v99 = v64;
      v100 = v134;
      v101 = v74;
      objc_msgSend(v71, "enumerateSublayoutGeometriesUsingBlock:", v96);

      v95 = *MEMORY[0x1E0C9D820];
      PXSizeSetValueForAxis();
      PXSizeSetValueForAxis();
      -[PXGLayout setContentSize:](self, "setContentSize:", v95);
      if (-[PXGSplitLayout mode](self, "mode") == 5 && self->_firstSublayout || !self->_secondSublayout)
      {
        PXPointValueForAxis();
        v76 = v78;
        -[PXGLayout lastBaseline](self->_firstSublayout, "lastBaseline");
      }
      else
      {
        PXPointValueForAxis();
        v76 = v75;
        -[PXGLayout lastBaseline](self->_secondSublayout, "lastBaseline");
      }
      -[PXGLayout setLastBaseline:](self, "setLastBaseline:", v76 + v77);
      -[PXGLayout changeVisibleRectToProposedVisibleRect:](self, "changeVisibleRectToProposedVisibleRect:", x, y, width, height);
      self->_presentedPadding.top = v93;
      self->_presentedPadding.left = v94;
      self->_presentedPadding.bottom = v83;
      self->_presentedPadding.right = v88;

      _Block_object_dispose(v129, 8);
      _Block_object_dispose(v132, 8);

      return;
  }
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

- (void)sublayoutDidChangeLastBaseline:(id)a3
{
  id v4;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXGSplitLayout;
  -[PXGLayout sublayoutDidChangeLastBaseline:](&v10, sel_sublayoutDidChangeLastBaseline_, v4);
  if (!self->_isUpdatingSublayouts)
  {
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 1;
        goto LABEL_8;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGSplitLayout sublayoutDidChangeLastBaseline:]");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("PXGSplitLayout.m"), 535, CFSTR("invalidating %lu after it already has been updated"), 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 1;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
LABEL_8:

}

- (BOOL)shouldExcludeTopAndBottomPaddingFromReferenceSize
{
  return self->_shouldExcludeTopAndBottomPaddingFromReferenceSize;
}

- (BOOL)floatingModesRespectSafeArea
{
  return self->_floatingModesRespectSafeArea;
}

- (PXGLayout)firstSublayout
{
  return self->_firstSublayout;
}

- (void)setShouldExcludeTopAndBottomPaddingFromReferenceSize:(BOOL)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  if (self->_shouldExcludeTopAndBottomPaddingFromReferenceSize != a3)
  {
    self->_shouldExcludeTopAndBottomPaddingFromReferenceSize = a3;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 1;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGSplitLayout setShouldExcludeTopAndBottomPaddingFromReferenceSize:]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGSplitLayout.m"), 131, CFSTR("invalidating %lu after it already has been updated"), 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 1;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

void __51__PXGSplitLayout__performUpdateSublayoutGeometries__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, id *a4)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  if (*a4)
  {
    v12 = *a4;
    objc_msgSend(v12, "contentSize");
    v6 = v12;
    *(_QWORD *)(a3 + 32) = v7;
    *(_QWORD *)(a3 + 40) = v8;
    v9 = *(_QWORD *)(a1 + 32);
    if (v12 == *(id *)(v9 + 904))
    {
      v11 = *(_QWORD *)(a1 + 56);
      *(_OWORD *)(a3 + 48) = *(_OWORD *)(a1 + 40);
      *(_QWORD *)(a3 + 64) = v11;
      objc_msgSend(v12, "setFloating:", *(unsigned __int8 *)(a1 + 96));
      objc_msgSend(v12, "setFloatingOffset:", *(double *)(a1 + 64));
      v6 = v12;
    }
    else if (v12 == *(id *)(v9 + 912))
    {
      v10 = *(_QWORD *)(a1 + 88);
      *(_OWORD *)(a3 + 48) = *(_OWORD *)(a1 + 72);
      *(_QWORD *)(a3 + 64) = v10;
    }

  }
}

- (void)willUpdate
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXGSplitLayout;
  -[PXGLayout willUpdate](&v5, sel_willUpdate);
  self->_updateFlags.willPerformUpdate = 1;
  if (self->_updateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGSplitLayout willUpdate]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXGSplitLayout.m"), 185, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

  }
}

- (void)visibleRectDidChange
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXGSplitLayout;
  -[PXGLayout visibleRectDidChange](&v8, sel_visibleRectDidChange);
  if (!self->_isUpdatingSublayouts)
  {
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 1;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGSplitLayout visibleRectDidChange]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGSplitLayout.m"), 484, CFSTR("invalidating %lu after it already has been updated"), 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 1;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)sublayoutDidChangeContentSize:(id)a3
{
  id v4;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXGSplitLayout;
  -[PXGLayout sublayoutDidChangeContentSize:](&v10, sel_sublayoutDidChangeContentSize_, v4);
  if (!self->_isUpdatingSublayouts)
  {
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 1;
        goto LABEL_8;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGSplitLayout sublayoutDidChangeContentSize:]");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("PXGSplitLayout.m"), 528, CFSTR("invalidating %lu after it already has been updated"), 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 1;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
LABEL_8:

}

- (void)setFirstSublayout:(id)a3
{
  PXGLayout *v4;
  PXGLayout *firstSublayout;
  PXGLayout *v6;
  PXGLayout *v7;
  PXGLayout *v8;
  PXGLayout *v9;

  v4 = (PXGLayout *)a3;
  firstSublayout = self->_firstSublayout;
  if (firstSublayout != v4)
  {
    v9 = v4;
    v6 = v4;
    v7 = self->_firstSublayout;
    self->_firstSublayout = v6;
    v8 = firstSublayout;

    -[PXGSplitLayout _replaceSublayout:withSublayout:atIndex:](self, "_replaceSublayout:withSublayout:atIndex:", v8, v6, -[PXGSplitLayout firstSublayoutIndex](self, "firstSublayoutIndex"));
    v4 = v9;
  }

}

- (int64_t)firstSublayoutIndex
{
  return 0;
}

- (void)setSecondSublayout:(id)a3
{
  int64_t v4;
  PXGLayout *secondSublayout;
  PXGLayout *v6;
  PXGLayout *v7;
  PXGLayout *v8;
  PXGLayout *v9;

  v9 = (PXGLayout *)a3;
  if (self->_secondSublayout != v9)
  {
    v4 = -[PXGSplitLayout secondSublayoutIndex](self, "secondSublayoutIndex");
    secondSublayout = self->_secondSublayout;
    v6 = v9;
    v7 = self->_secondSublayout;
    self->_secondSublayout = v6;
    v8 = secondSublayout;

    -[PXGSplitLayout _replaceSublayout:withSublayout:atIndex:](self, "_replaceSublayout:withSublayout:atIndex:", v8, v6, v4);
  }

}

- (int64_t)secondSublayoutIndex
{
  return self->_firstSublayout != 0;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  UIEdgeInsets *p_padding;
  $F40CD077B40800501ED060B808F886F7 *p_additionalUpdateFlags;
  unint64_t needsUpdate;
  void *v11;
  void *v12;
  _BOOL4 willPerformUpdate;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  p_padding = &self->_padding;
  if ((PXEdgeInsetsApproximatelyEqualToEdgeInsets() & 1) == 0)
  {
    p_padding->top = top;
    p_padding->left = left;
    p_padding->bottom = bottom;
    p_padding->right = right;
    if (self->_isUpdatingSublayouts)
    {
      if (self->_isPerformingAdditionalUpdate)
        return;
      p_additionalUpdateFlags = &self->_additionalUpdateFlags;
      needsUpdate = self->_additionalUpdateFlags.needsUpdate;
      if (self->_additionalUpdateFlags.isPerformingUpdate && (self->_additionalUpdateFlags.updated & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGSplitLayout setPadding:]");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("PXGSplitLayout.m"), 120, CFSTR("invalidating %lu after it already has been updated"), 1);
        goto LABEL_17;
      }
      goto LABEL_12;
    }
    p_additionalUpdateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_12:
        p_additionalUpdateFlags->needsUpdate = needsUpdate | 1;
        return;
      }
LABEL_11:
      if ((self->_updateFlags.updated & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGSplitLayout setPadding:]");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("PXGSplitLayout.m"), 118, CFSTR("invalidating %lu after it already has been updated"), 1);
LABEL_17:

        abort();
      }
      goto LABEL_12;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_11;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_additionalUpdateFlags->needsUpdate = 1;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)safeAreaInsetsDidChange
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXGSplitLayout;
  -[PXGLayout safeAreaInsetsDidChange](&v8, sel_safeAreaInsetsDidChange);
  if (!self->_isUpdatingSublayouts)
  {
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 1;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGSplitLayout safeAreaInsetsDidChange]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGSplitLayout.m"), 491, CFSTR("invalidating %lu after it already has been updated"), 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 1;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)referenceSizeDidChange
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXGSplitLayout;
  -[PXGLayout referenceSizeDidChange](&v8, sel_referenceSizeDidChange);
  if (!self->_isUpdatingSublayouts)
  {
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 1;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGSplitLayout referenceSizeDidChange]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGSplitLayout.m"), 470, CFSTR("invalidating %lu after it already has been updated"), 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 1;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)displayScaleDidChange
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXGSplitLayout;
  -[PXGLayout displayScaleDidChange](&v8, sel_displayScaleDidChange);
  if (!self->_isUpdatingSublayouts)
  {
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 1;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGSplitLayout displayScaleDidChange]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGSplitLayout.m"), 498, CFSTR("invalidating %lu after it already has been updated"), 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 1;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)viewEnvironmentDidChange
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXGSplitLayout;
  -[PXGLayout viewEnvironmentDidChange](&v8, sel_viewEnvironmentDidChange);
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGSplitLayout viewEnvironmentDidChange]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGSplitLayout.m"), 464, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 1;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)removeSublayoutsInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  NSRange v6;
  BOOL v7;
  unint64_t v9;
  _BOOL4 v11;
  unint64_t v12;
  _BOOL4 v14;
  objc_super v15;
  NSRange v16;

  length = a3.length;
  location = a3.location;
  if (self->_firstSublayout)
    a3.length = (self->_secondSublayout != 0) + 1;
  else
    a3.length = self->_secondSublayout != 0;
  v16.location = a3.location;
  v16.length = length;
  a3.location = 0;
  v6 = NSIntersectionRange(v16, a3);
  if (v6.length)
    v7 = location == v6.location;
  else
    v7 = 0;
  if (!v7 || length != v6.length)
  {
    v15.receiver = self;
    v15.super_class = (Class)PXGSplitLayout;
    -[PXGLayout removeSublayoutsInRange:](&v15, sel_removeSublayoutsInRange_, location, length);
    return;
  }
  if (self->_firstSublayout)
  {
    v9 = -[PXGSplitLayout firstSublayoutIndex](self, "firstSublayoutIndex");
    v11 = v9 >= location && v9 - location < v6.length;
  }
  else
  {
    v11 = 0;
  }
  if (self->_secondSublayout)
  {
    v12 = -[PXGSplitLayout secondSublayoutIndex](self, "secondSublayoutIndex");
    v14 = v12 >= location && v12 - location < v6.length;
    if (!v11)
      goto LABEL_30;
    goto LABEL_29;
  }
  v14 = 0;
  if (v11)
LABEL_29:
    -[PXGSplitLayout setFirstSublayout:](self, "setFirstSublayout:", 0);
LABEL_30:
  if (v14)
    -[PXGSplitLayout setSecondSublayout:](self, "setSecondSublayout:", 0);
}

- (void)setAdjustSublayoutZPositions:(BOOL)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  if (self->_adjustSublayoutZPositions != a3)
  {
    self->_adjustSublayoutZPositions = a3;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 1;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGSplitLayout setAdjustSublayoutZPositions:]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGSplitLayout.m"), 139, CFSTR("invalidating %lu after it already has been updated"), 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 1;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (int64_t)sublayoutIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5
{
  int64_t v5;
  id v9;
  int64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  v9 = a3;
  v10 = -[PXGSplitLayout objectReferenceLookup](self, "objectReferenceLookup");
  switch(v10)
  {
    case 2:
      *a5 = objc_retainAutorelease(v9);
      -[PXGSplitLayout secondSublayout](self, "secondSublayout");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        -[PXGSplitLayout secondSublayout](self, "secondSublayout");
        v12 = objc_claimAutoreleasedReturnValue();
LABEL_9:
        v13 = (void *)v12;
        v5 = -[PXGLayout indexOfSublayout:](self, "indexOfSublayout:", v12);

LABEL_11:
        break;
      }
LABEL_10:
      v5 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_11;
    case 1:
      *a5 = objc_retainAutorelease(v9);
      -[PXGSplitLayout firstSublayout](self, "firstSublayout");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        -[PXGSplitLayout firstSublayout](self, "firstSublayout");
        v12 = objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
      goto LABEL_10;
    case 0:
      v15.receiver = self;
      v15.super_class = (Class)PXGSplitLayout;
      v5 = -[PXGLayout sublayoutIndexForObjectReference:options:updatedObjectReference:](&v15, sel_sublayoutIndexForObjectReference_options_updatedObjectReference_, v9, a4, a5);
      break;
  }

  return v5;
}

- (void)referenceDepthDidChange
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXGSplitLayout;
  -[PXGLayout referenceDepthDidChange](&v8, sel_referenceDepthDidChange);
  if (!self->_isUpdatingSublayouts)
  {
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 1;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGSplitLayout referenceDepthDidChange]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGSplitLayout.m"), 477, CFSTR("invalidating %lu after it already has been updated"), 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 1;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)scrollSpeedRegimeDidChange
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXGSplitLayout;
  -[PXGLayout scrollSpeedRegimeDidChange](&v8, sel_scrollSpeedRegimeDidChange);
  if (!self->_isUpdatingSublayouts)
  {
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 1;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGSplitLayout scrollSpeedRegimeDidChange]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGSplitLayout.m"), 505, CFSTR("invalidating %lu after it already has been updated"), 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 1;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)userInterfaceDirectionDidChange
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXGSplitLayout;
  -[PXGLayout userInterfaceDirectionDidChange](&v8, sel_userInterfaceDirectionDidChange);
  if (!self->_isUpdatingSublayouts)
  {
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 1;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGSplitLayout userInterfaceDirectionDidChange]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGSplitLayout.m"), 512, CFSTR("invalidating %lu after it already has been updated"), 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 1;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)didChangeSublayoutOrigins
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXGSplitLayout;
  -[PXGLayout didChangeSublayoutOrigins](&v8, sel_didChangeSublayoutOrigins);
  if (!self->_isUpdatingSublayouts)
  {
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 1;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGSplitLayout didChangeSublayoutOrigins]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGSplitLayout.m"), 542, CFSTR("invalidating %lu after it already has been updated"), 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 1;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (BOOL)definesContextForPointReferences
{
  return 0;
}

- (void)enumerateSublayoutsForCreatingPointReferenceUsingBlock:(id)a3
{
  void (**v4)(id, void *, _BYTE *);
  void *v5;
  void *v6;
  char v7;

  v4 = (void (**)(id, void *, _BYTE *))a3;
  v7 = 0;
  -[PXGSplitLayout secondSublayout](self, "secondSublayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v4[2](v4, v5, &v7);
  -[PXGSplitLayout firstSublayout](self, "firstSublayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && !v7)
    v4[2](v4, v6, &v7);

}

- (void)willRemoveSublayout:(id)a3 atIndex:(int64_t)a4 flags:(unint64_t)a5
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXGSplitLayout;
  -[PXGLayout willRemoveSublayout:atIndex:flags:](&v5, sel_willRemoveSublayout_atIndex_flags_, a3, a4, a5);
}

- (void)setFloatingModesRespectSafeArea:(BOOL)a3
{
  self->_floatingModesRespectSafeArea = a3;
}

- (double)floatingThresholdOffset
{
  return self->_floatingThresholdOffset;
}

- (void)setFloatingThresholdOffset:(double)a3
{
  self->_floatingThresholdOffset = a3;
}

- (double)interlayoutSpacing
{
  return self->_interlayoutSpacing;
}

- (UIEdgeInsets)presentedPadding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_presentedPadding.top;
  left = self->_presentedPadding.left;
  bottom = self->_presentedPadding.bottom;
  right = self->_presentedPadding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (int64_t)objectReferenceLookup
{
  return self->_objectReferenceLookup;
}

- (void)setObjectReferenceLookup:(int64_t)a3
{
  self->_objectReferenceLookup = a3;
}

- (BOOL)adjustSublayoutZPositions
{
  return self->_adjustSublayoutZPositions;
}

- (BOOL)allowsRepeatedSublayoutsUpdates
{
  return self->_allowsRepeatedSublayoutsUpdates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondSublayout, 0);
  objc_storeStrong((id *)&self->_firstSublayout, 0);
}

uint64_t __44__PXGSplitLayout__updateSublayoutGeometries__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performUpdateSublayoutGeometries");
}

@end
