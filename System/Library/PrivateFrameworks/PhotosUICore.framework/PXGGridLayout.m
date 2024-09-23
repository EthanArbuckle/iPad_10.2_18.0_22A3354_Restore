@implementation PXGGridLayout

- (BOOL)supportsContentMode
{
  return 1;
}

- (BOOL)itemCaptionsVisible
{
  double v2;

  -[PXGGridLayout itemCaptionSpacing](self, "itemCaptionSpacing");
  return v2 > 0.0;
}

- (BOOL)shiftItem:(int64_t)a3 toColumn:(int64_t)a4 topPaddingRows:(int64_t)a5 hideIncompleteRows:(BOOL)a6
{
  int64_t v12;
  int64_t v13;
  int64_t v14;
  uint64_t v15;
  int64_t v16;
  void *v18;

  v12 = -[PXGGridLayout numberOfColumns](self, "numberOfColumns");
  v13 = v12;
  v14 = v12 - 1;
  if (v12 - 1 >= a4)
    v14 = a4;
  v15 = (v14 & ~(v14 >> 63)) + a3 / v12 * v12 - a3;
  if (v15 < 0)
  {
    v15 += v12;
    if (v15 < 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXZoomablePhotosContentLayout.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("visualItemShift >= 0"));

    }
  }
  if (v15 > 0 && a6)
    v16 = v13;
  else
    v16 = 0;
  -[PXGGridLayout setVisualItemShift:](self, "setVisualItemShift:", v15 + v13 * a5 - v16);
  return 1;
}

- (PXGGridLayout)init
{
  PXGGridLayout *result;
  $1A92715FA36BAB2AB993A583878CDF5D v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXGGridLayout;
  result = -[PXGItemsLayout init](&v9, sel_init);
  if (result)
  {
    result->_style = 0;
    result->_axis = 1;
    result->_numberOfColumns = 4;
    result->_numberOfRows = 4;
    __asm { FMOV            V0.2D, #1.0 }
    result->_interItemSpacing = _Q0;
    result->_itemAspectRatio = 1.0;
    v8 = *($1A92715FA36BAB2AB993A583878CDF5D *)off_1E50B8248;
    result->_itemCornerRadius = *($1A92715FA36BAB2AB993A583878CDF5D *)off_1E50B8248;
    result->_edgeCornerRadius = v8;
    result->_aspectRatioLimit = 4.0;
  }
  return result;
}

- (NSString)description
{
  void *v3;
  void *v4;
  objc_super v6;
  objc_super v7;

  if (-[PXGGridLayout scrollableAxis](self, "scrollableAxis") == 2)
  {
    v7.receiver = self;
    v7.super_class = (Class)PXGGridLayout;
    -[PXGItemsLayout description](&v7, sel_description);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "px_stringByAppendingDescriptionDetailsWithFormat:", CFSTR(", axis=horizontal, numberOfRows=%li"), -[PXGGridLayout numberOfRows](self, "numberOfRows"));
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PXGGridLayout;
    -[PXGItemsLayout description](&v6, sel_description);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "px_stringByAppendingDescriptionDetailsWithFormat:", CFSTR(", axis=vertical, numberOfColumns=%li"), -[PXGGridLayout numberOfColumns](self, "numberOfColumns"));
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)willUpdate
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXGGridLayout;
  -[PXGItemsLayout willUpdate](&v5, sel_willUpdate);
  self->_updateFlags.willPerformUpdate = 1;
  if (self->_updateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGridLayout willUpdate]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXGGridLayout.m"), 120, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

  }
}

- (void)update
{
  BOOL isUpdating;
  void *v4;
  void *v5;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
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
  objc_super v21;

  isUpdating = self->_isUpdating;
  self->_isUpdating = 1;
  -[PXGLayout rootLayout](self, "rootLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[PXGItemsLayout invalidateLoadedItems](self, "invalidateLoadedItems");
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    self->_updateFlags.willPerformUpdate = 0;
  }
  else
  {
    -[PXGItemsLayout updateLoadedItemsIfNeeded](self, "updateLoadedItemsIfNeeded");
    -[PXGItemsLayout updateAccessoryItemsIfNeeded](self, "updateAccessoryItemsIfNeeded");
    needsUpdate = p_updateFlags->needsUpdate;
    self->_updateFlags.willPerformUpdate = 0;
    if (!needsUpdate)
      goto LABEL_23;
  }
  if (self->_updateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGridLayout update]");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("PXGGridLayout.m"), 138, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

    needsUpdate = p_updateFlags->needsUpdate;
  }
  self->_updateFlags.isPerformingUpdate = 1;
  self->_updateFlags.updated = 1;
  if ((needsUpdate & 1) != 0)
  {
    p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
    -[PXGGridLayout _updateColumnsMetrics](self, "_updateColumnsMetrics");
    if (!self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGridLayout update]");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("PXGGridLayout.m"), 142, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
  }
  v8 = p_updateFlags->needsUpdate;
  self->_updateFlags.updated |= 2uLL;
  if ((v8 & 2) != 0)
  {
    p_updateFlags->needsUpdate = v8 & 0xFFFFFFFFFFFFFFFDLL;
    -[PXGGridLayout _updateContentSize](self, "_updateContentSize");
  }
  -[PXGItemsLayout updateLoadedItemsIfNeeded](self, "updateLoadedItemsIfNeeded");
  -[PXGItemsLayout updateAccessoryItemsIfNeeded](self, "updateAccessoryItemsIfNeeded");
  if (!self->_updateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGridLayout update]");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("PXGGridLayout.m"), 149, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

  }
  v9 = p_updateFlags->needsUpdate;
  self->_updateFlags.updated |= 4uLL;
  if ((v9 & 4) != 0)
  {
    p_updateFlags->needsUpdate = v9 & 0xFFFFFFFFFFFFFFFBLL;
    -[PXGGridLayout _updateSprites](self, "_updateSprites");
  }
  if (!self->_updateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGridLayout update]");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("PXGGridLayout.m"), 152, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

  }
  v10 = p_updateFlags->needsUpdate;
  self->_updateFlags.updated |= 8uLL;
  if ((v10 & 8) != 0)
  {
    p_updateFlags->needsUpdate = v10 & 0xFFFFFFFFFFFFFFF7;
    -[PXGGridLayout _updateSpriteStyles](self, "_updateSpriteStyles");
    v10 = p_updateFlags->needsUpdate;
  }
  self->_updateFlags.isPerformingUpdate = 0;
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGridLayout update]");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("PXGGridLayout.m"), 155, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

  }
LABEL_23:
  v21.receiver = self;
  v21.super_class = (Class)PXGGridLayout;
  -[PXGItemsLayout update](&v21, sel_update);
  self->_isUpdating = isUpdating;
}

- (void)didUpdate
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXGGridLayout;
  -[PXGItemsLayout didUpdate](&v5, sel_didUpdate);
  if (self->_updateFlags.willPerformUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGridLayout didUpdate]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXGGridLayout.m"), 163, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.willPerformUpdate"));

  }
}

- (void)_updateColumnsMetrics
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double height;
  double v12;
  double v13;
  BOOL v14;
  NSObject *v15;
  BOOL v16;
  BOOL v17;
  __int128 v18;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  int64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL4 willPerformUpdate;
  void *v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  CGSize v32;
  CGSize v33;
  uint8_t buf[4];
  PXGGridLayout *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  CGFloat width;
  __int16 v40;
  CGFloat v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v33 = (CGSize)0;
  v32 = (CGSize)0;
  v30 = 0u;
  v31 = 0u;
  -[PXGGridLayout interItemSpacing](self, "interItemSpacing");
  v4 = v3;
  v6 = v5;
  -[PXGGridLayout padding](self, "padding");
  -[PXGGridLayout _getItemSize:finalInteritemSpacing:finalInsets:forDesiredInterItemSpacing:padding:](self, "_getItemSize:finalInteritemSpacing:finalInsets:forDesiredInterItemSpacing:padding:", &v33, &v32, &v30, v4, v6, v7, v8, v9, v10);
  height = v33.height;
  if (fabs(v33.height) == INFINITY
    || (v12 = v33.width, v33.width < 0.0)
    || ((v13 = fabs(v33.width), v33.height >= 0.0) ? (v14 = v13 == INFINITY) : (v14 = 1), v14))
  {
    PXAssertGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      NSStringFromCGSize(v33);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v35 = self;
      v36 = 2112;
      v37 = v27;
      v38 = 2048;
      width = v32.width;
      v40 = 2048;
      v41 = v32.height;
      _os_log_error_impl(&dword_1A6789000, v15, OS_LOG_TYPE_ERROR, "%@ calculated invalid itemSize:%@ interItemSpacing:%.3fx%.3f", buf, 0x2Au);

    }
    height = v33.height;
    v12 = v33.width;
  }
  v16 = v12 == self->_itemSize.width && height == self->_itemSize.height;
  if (!v16
    || (v32.width == self->_finalInterItemSpacing.width
      ? (v17 = v32.height == self->_finalInterItemSpacing.height)
      : (v17 = 0),
        !v17 || (PXEdgeInsetsEqualToEdgeInsets() & 1) == 0))
  {
    self->_itemSize = v33;
    v18 = v31;
    self->_finalInterItemSpacing = v32;
    *(_OWORD *)&self->_finalInsets.top = v30;
    *(_OWORD *)&self->_finalInsets.bottom = v18;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_27:
        p_updateFlags->needsUpdate = needsUpdate | 0xE;
LABEL_28:
        -[PXGItemsLayout invalidateLoadedItems](self, "invalidateLoadedItems");
        goto LABEL_29;
      }
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      p_updateFlags->needsUpdate = 14;
      if (!willPerformUpdate)
        -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
      goto LABEL_28;
    }
    if ((self->_updateFlags.updated & 0xE) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGridLayout _updateColumnsMetrics]");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, CFSTR("PXGGridLayout.m"), 179, CFSTR("invalidating %lu after it already has been updated"), 14);

      abort();
    }
    goto LABEL_27;
  }
LABEL_29:
  if (-[PXGGridLayout scrollableAxis](self, "scrollableAxis") == 2)
    v21 = -[PXGGridLayout numberOfRows](self, "numberOfRows");
  else
    v21 = -[PXGGridLayout numberOfColumns](self, "numberOfColumns");
  v22 = v21;
  -[PXGLayout axGroup](self, "axGroup");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setNonScrollingAxisItemCount:", v22);
  if (v22 < 15)
  {
    +[PXUserDefaults standardUserDefaults](PXUserDefaults, "standardUserDefaults");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "axExposeAllVisibleElements");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      objc_msgSend(v23, "setLeafFeatures:", objc_msgSend(v23, "leafFeatures") | 2);
      objc_msgSend(v23, "invalidateLeafs");
    }
  }
  else
  {
    objc_msgSend(v23, "setLeafFeatures:", objc_msgSend(v23, "leafFeatures") & 0xFFFFFFFFFFFFFFFBLL);
  }

}

- (void)_updateContentSize
{
  uint64_t v3;
  uint64_t v4;
  double width;
  double v6;
  double left;
  double right;
  double v9;
  double v10;
  double v11;
  double v12;

  v3 = -[PXGGridLayout numberOfVisualColumns](self, "numberOfVisualColumns");
  v4 = -[PXGGridLayout numberOfVisualRows](self, "numberOfVisualRows");
  width = self->_itemSize.width;
  v6 = self->_finalInterItemSpacing.width;
  left = self->_finalInsets.left;
  right = self->_finalInsets.right;
  v9 = self->_finalInsets.top
     + fmax(-(self->_finalInterItemSpacing.height- (double)v4 * (self->_itemSize.height + self->_finalInterItemSpacing.height + self->_itemCaptionSpacing)), 0.0)+ self->_finalInsets.bottom;
  v10 = *MEMORY[0x1E0C9D538];
  v11 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  if (-[PXGGridLayout fillSafeAreaTopInset](self, "fillSafeAreaTopInset"))
  {
    -[PXGLayout safeAreaInsets](self, "safeAreaInsets");
    v11 = v11 - v12;
    v9 = v9 - v12;
  }
  -[PXGGridLayout setContentOrigin:](self, "setContentOrigin:", v10, v11);
  -[PXGLayout setContentSize:](self, "setContentSize:", fmax(-(v6 - (double)v3 * (width + v6)), 0.0) + left + right, v9);
  -[PXGLayout setLastBaseline:](self, "setLastBaseline:", v9);
}

- (id)marginDelegate
{
  void *v3;
  objc_super v5;

  if (-[PXGGridLayout enablePerItemMargin](self, "enablePerItemMargin"))
  {
    v5.receiver = self;
    v5.super_class = (Class)PXGGridLayout;
    -[PXGItemsLayout marginDelegate](&v5, sel_marginDelegate);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)insetDelegate
{
  void *v3;
  objc_super v5;

  if (-[PXGGridLayout enablePerItemInsets](self, "enablePerItemInsets"))
  {
    v5.receiver = self;
    v5.super_class = (Class)PXGGridLayout;
    -[PXGItemsLayout insetDelegate](&v5, sel_insetDelegate);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)_updateSprites
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  unsigned int v15;
  unsigned int v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double height;
  double v25;
  double v26;
  double v27;
  double v28;
  _BOOL4 v29;
  double v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  uint64_t v35;
  double v36;
  double v37;
  double itemCaptionSpacing;
  uint64_t v39;
  int v40;
  BOOL v41;
  int v42;
  int64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t *v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  uint64_t v49;
  uint64_t v50;
  double v51;
  double v52;
  float v53;
  uint64_t v54;
  BOOL v56;
  void *v57;
  id v58;
  id v59;
  id v60;
  id v61;
  int64_t v62;
  int v63;
  id v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  double v68;
  uint64_t v69;
  double v70;
  double v71;
  double top;
  double left;
  uint64_t v74;
  int v75;
  uint64_t v76;
  double v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  BOOL v81;
  int64_t v82;
  uint64_t v83;
  void *v84;
  void *v85;
  uint64_t v86;
  int64_t v87;
  void *v88;
  unint64_t v89;
  id v90;
  double width;
  _QWORD v92[5];
  id v93;
  id v94;
  int64_t v95;
  uint64_t v96;
  double v97;
  double v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  uint64_t v107;
  int v108;
  float v109;
  int v110;
  _QWORD v111[5];
  id v112;
  id v113;
  id v114;
  id v115;
  id v116;
  uint64_t v117;
  int64_t v118;
  uint64_t v119;
  double v120;
  double v121;
  uint64_t v122;
  double v123;
  double v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  double v128;
  uint64_t v129;
  uint64_t v130;
  int64_t v131;
  uint64_t v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  uint64_t v138;
  float v139;
  int v140;
  int v141;
  BOOL v142;
  BOOL v143;
  uint64_t v144;
  uint64_t v145;
  _QWORD v146[4];
  unsigned int v147;
  _QWORD aBlock[4];
  unsigned int v149;

  v3 = -[PXGGridLayout visualItemShift](self, "visualItemShift");
  v4 = -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites");
  -[PXGItemsLayout delegate](self, "delegate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (-[PXGItemsLayout delegateRespondsTo:](self, "delegateRespondsTo:", 4))
    v6 = (void *)v5;
  else
    v6 = 0;
  v7 = v6;
  v82 = -[PXGGridLayout contentMode](self, "contentMode");
  -[PXGGridLayout marginDelegate](self, "marginDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGGridLayout insetDelegate](self, "insetDelegate");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = -[PXGItemsLayout loadedItems](self, "loadedItems");
  -[PXGItemsLayout dropTargetObjectReference](self, "dropTargetObjectReference");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PXGItemsLayout itemForObjectReference:](self, "itemForObjectReference:", v9);

  v89 = -[PXGItemsLayout dropTargetStyle](self, "dropTargetStyle");
  -[PXGGridLayout aspectRatioLimit](self, "aspectRatioLimit");
  v12 = v11;
  -[PXGGridLayout itemAspectRatio](self, "itemAspectRatio");
  v14 = v13;
  v81 = -[PXGGridLayout supportsAutomaticContentRotation](self, "supportsAutomaticContentRotation");
  v15 = -[PXGGridLayout numberOfColumns](self, "numberOfColumns");
  v16 = -[PXGGridLayout numberOfRows](self, "numberOfRows");
  v17 = -[PXGGridLayout scrollableAxis](self, "scrollableAxis");
  -[PXGLayout displayScale](self, "displayScale");
  v19 = v18;
  -[PXGGridLayout contentOrigin](self, "contentOrigin");
  v21 = v20;
  v23 = v22;
  top = self->_finalInsets.top;
  left = self->_finalInsets.left;
  height = self->_itemSize.height;
  width = self->_itemSize.width;
  -[PXGLayout referenceSize](self, "referenceSize");
  v88 = (void *)v5;
  v85 = v7;
  v86 = v4;
  if (v17 == 1)
  {
    v27 = v25 / (double)-[PXGGridLayout numberOfColumns](self, "numberOfColumns");
    v28 = v27 / v14;
  }
  else
  {
    v28 = v26 / (double)-[PXGGridLayout numberOfRows](self, "numberOfRows");
    v27 = v14 * v28;
  }
  v29 = -[PXGGridLayout mediaTargetSizeIgnoresSpacing](self, "mediaTargetSizeIgnoresSpacing");
  if (v29)
    v30 = v27;
  else
    v30 = width;
  if (v29)
    v31 = v28;
  else
    v31 = height;
  v70 = v31;
  v71 = v30;
  v80 = v19;
  PXSizeScale();
  PXSizeRound();
  v78 = v33;
  v79 = v32;
  PXSizeScale();
  v76 = v35;
  v77 = v34;
  v37 = self->_finalInterItemSpacing.width;
  v36 = self->_finalInterItemSpacing.height;
  itemCaptionSpacing = self->_itemCaptionSpacing;
  v39 = -[PXGGridLayout numberOfVisualRows](self, "numberOfVisualRows");
  -[PXGGridLayout itemZPosition](self, "itemZPosition");
  v75 = v40;
  v41 = v10 != 0x7FFFFFFFFFFFFFFFLL && v89 == 2;
  v42 = v41;
  v87 = v3;
  if (!v41 || v17 != 1)
  {
    if (v17 != 2)
      v42 = 0;
    if (v42 == 1)
    {
      v43 = v10;
      v44 = (v10 + v3) / v16;
    }
    else
    {
      v43 = v10;
      v44 = 0x7FFFFFFFFFFFFFFFLL;
      if (v17 != 2)
        goto LABEL_29;
    }
    v67 = v44;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __31__PXGGridLayout__updateSprites__block_invoke;
    aBlock[3] = &__block_descriptor_36_e8_q16__0q8l;
    v149 = v16;
    v45 = MEMORY[0x1E0C809B0];
    v46 = _Block_copy(aBlock);
    v145 = v45;
    v69 = 0x7FFFFFFFFFFFFFFFLL;
    v47 = &v145;
    v48 = __31__PXGGridLayout__updateSprites__block_invoke_3;
    goto LABEL_30;
  }
  v43 = v10;
  v44 = (v10 + v3) / v15;
LABEL_29:
  v146[0] = MEMORY[0x1E0C809B0];
  v146[1] = 3221225472;
  v146[2] = __31__PXGGridLayout__updateSprites__block_invoke_2;
  v146[3] = &__block_descriptor_36_e8_q16__0q8l;
  v147 = v15;
  v45 = MEMORY[0x1E0C809B0];
  v46 = _Block_copy(v146);
  v144 = v45;
  v47 = &v144;
  v16 = v15;
  v69 = v44;
  v67 = 0x7FFFFFFFFFFFFFFFLL;
  v48 = __31__PXGGridLayout__updateSprites__block_invoke_4;
LABEL_30:
  v47[1] = 3221225472;
  v47[2] = (uint64_t)v48;
  v47[3] = (uint64_t)&__block_descriptor_36_e8_q16__0q8l;
  *((_DWORD *)v47 + 8) = v16;
  if (v39 <= 1)
    v49 = 1;
  else
    v49 = v39;
  v50 = v49 - 1;
  if (v43 != 0x7FFFFFFFFFFFFFFFLL)
    v50 = 0x7FFFFFFFFFFFFFFFLL;
  v66 = v50;
  v51 = height + v36 + itemCaptionSpacing;
  v52 = width + v37;
  v68 = v21 + left;
  if (v89 == 1)
    v54 = v43;
  else
    v54 = 0x7FFFFFFFFFFFFFFFLL;
  v74 = v54;
  v56 = v82 == 1 && v85 != 0;
  v57 = _Block_copy(v47);
  v111[0] = v45;
  v111[1] = 3221225472;
  v111[2] = __31__PXGGridLayout__updateSprites__block_invoke_5;
  v111[3] = &unk_1E513AD10;
  v117 = v83;
  v118 = v87;
  v119 = v54;
  v120 = width;
  v121 = height;
  v111[4] = self;
  v112 = v8;
  v142 = v56;
  v113 = v84;
  v114 = v85;
  v122 = v12;
  v123 = v71;
  v124 = v70;
  v125 = v80;
  v126 = v79;
  v127 = v78;
  v143 = v81;
  v128 = v14;
  v58 = v46;
  v115 = v58;
  v59 = v57;
  v116 = v59;
  v129 = v66;
  v130 = v69;
  v131 = v43;
  v139 = v77 * 0.5;
  v132 = v67;
  v133 = v68;
  v134 = v23 + top;
  v135 = v52;
  v136 = v51;
  v137 = v77;
  v138 = v76;
  v140 = v75;
  v141 = v86;
  v90 = v85;
  v60 = v84;
  v61 = v8;
  -[PXGLayout modifySpritesInRange:state:](self, "modifySpritesInRange:state:", v86 << 32, v111);
  v62 = -[PXGItemsLayout numberOfAccessoryItems](self, "numberOfAccessoryItems");
  v63 = -[PXGItemsLayout numberOfItems](self, "numberOfItems");
  v92[0] = MEMORY[0x1E0C809B0];
  v92[1] = 3221225472;
  v92[2] = __31__PXGGridLayout__updateSprites__block_invoke_6;
  v92[3] = &unk_1E513AD38;
  v108 = v63;
  v95 = v87;
  v96 = v74;
  v92[4] = self;
  v93 = v58;
  v94 = v59;
  v97 = width;
  v98 = height;
  v99 = v79;
  v100 = v78;
  v101 = v69;
  v102 = v68;
  v103 = v23 + top;
  v104 = v52;
  v105 = v51;
  v106 = v77;
  v107 = v76;
  v53 = v77 * 0.5;
  v109 = v53;
  v110 = v75;
  v64 = v59;
  v65 = v58;
  -[PXGItemsLayout modifyAccessoryItemSpritesInRange:state:](self, "modifyAccessoryItemSpritesInRange:state:", v62 << 32, v92);
  -[PXGItemsLayout invalidateStylableType:](self, "invalidateStylableType:", 1);

}

- (void)_updateSpriteStyles
{
  int64_t v3;
  int64_t v4;
  int64_t v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  BOOL v28;
  BOOL v30;
  BOOL v31;
  void *v32;
  id v33;
  uint64_t v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  BOOL v42;
  int v43;
  int v44;
  int v45;
  int64_t v46;
  int64_t v47;
  uint64_t v48;
  uint64_t v49;
  BOOL v50;
  id v51;
  _QWORD v52[6];
  _QWORD v53[5];
  id v54;
  uint64_t v55;
  int v56;
  _QWORD v57[4];
  id v58;
  PXGGridLayout *v59;
  id v60;
  id v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  int64_t v66;
  int64_t v67;
  int64_t v68;
  int v69;
  int v70;
  int v71;
  int v72;
  int v73;
  int v74;
  int v75;
  int v76;
  int v77;
  BOOL v78;
  BOOL v79;
  BOOL v80;
  BOOL v81;

  v3 = -[PXGGridLayout visualItemShift](self, "visualItemShift");
  v49 = -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites");
  v4 = -[PXGItemsLayout numberOfItems](self, "numberOfItems");
  v5 = -[PXGGridLayout scrollableAxis](self, "scrollableAxis");
  -[PXGGridLayout itemCornerRadius](self, "itemCornerRadius");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[PXGGridLayout edgeCornerRadius](self, "edgeCornerRadius");
  v44 = v15;
  v45 = v14;
  v43 = v16;
  v18 = v17;
  -[PXGGridLayout itemAspectRatio](self, "itemAspectRatio");
  v20 = v19;
  -[PXGLayout alpha](self, "alpha");
  v22 = v21;
  v48 = -[PXGItemsLayout loadedItems](self, "loadedItems");
  v46 = v4;
  v47 = v3;
  if (-[PXGGridLayout enableBestCropRect](self, "enableBestCropRect"))
    v50 = -[PXGItemsLayout delegateRespondsTo:](self, "delegateRespondsTo:", 8);
  else
    v50 = 0;
  -[PXGItemsLayout delegate](self, "delegate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PXGItemsLayout delegateRespondsTo:](self, "delegateRespondsTo:", 4))
    v24 = v23;
  else
    v24 = 0;
  v25 = v24;
  if (-[PXGItemsLayout delegateRespondsTo:](self, "delegateRespondsTo:", 1024))
    v26 = v23;
  else
    v26 = 0;
  v27 = v26;
  if (v27)
    v28 = -[PXGGridLayout enablePerItemCornerRadius](self, "enablePerItemCornerRadius");
  else
    v28 = 0;
  v30 = -[PXGGridLayout contentMode](self, "contentMode") == 1 && v25 != 0;
  v42 = v30;
  v31 = -[PXGGridLayout supportsAutomaticContentRotation](self, "supportsAutomaticContentRotation");
  if (-[PXGItemsLayout delegateRespondsTo:](self, "delegateRespondsTo:", 128))
    v32 = v23;
  else
    v32 = 0;
  v33 = v32;
  v34 = MEMORY[0x1E0C809B0];
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __36__PXGGridLayout__updateSpriteStyles__block_invoke;
  v57[3] = &unk_1E513AD60;
  v63 = v48;
  v78 = v50;
  v51 = v23;
  v58 = v51;
  v59 = self;
  v64 = v20;
  v69 = v7;
  v70 = v9;
  v71 = v11;
  v72 = v13;
  v79 = v28;
  v35 = v27;
  v60 = v35;
  v65 = v22;
  v36 = v33;
  v61 = v36;
  v80 = v31;
  v81 = v42;
  v37 = v25;
  v73 = v45;
  v74 = v44;
  v75 = v43;
  v76 = v18;
  v62 = v37;
  v66 = v46;
  v67 = v5;
  v68 = v47;
  v77 = v49;
  -[PXGLayout modifySpritesInRange:state:](self, "modifySpritesInRange:state:", v49 << 32, v57);
  if (-[PXGItemsLayout delegateRespondsTo:](self, "delegateRespondsTo:", 16))
    v38 = v51;
  else
    v38 = 0;
  v39 = v38;
  if (-[PXGGridLayout enableEffects](self, "enableEffects") && v39)
  {
    -[PXGLayout entityManager](self, "entityManager");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "effectComponent");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = v34;
    v53[1] = 3221225472;
    v53[2] = __36__PXGGridLayout__updateSpriteStyles__block_invoke_2;
    v53[3] = &unk_1E513AD88;
    v56 = v49;
    v53[4] = self;
    v55 = v48;
    v54 = v39;
    objc_msgSend(v41, "performChanges:", v53);

  }
  v52[0] = v34;
  v52[1] = 3221225472;
  v52[2] = __36__PXGGridLayout__updateSpriteStyles__block_invoke_3;
  v52[3] = &unk_1E513ADB0;
  v52[4] = self;
  v52[5] = v22;
  -[PXGItemsLayout modifyAccessoryItemSpritesInRange:state:](self, "modifyAccessoryItemSpritesInRange:state:", -[PXGItemsLayout numberOfAccessoryItems](self, "numberOfAccessoryItems") << 32, v52);

}

- (double)rowHeight
{
  return self->_itemSize.height + self->_finalInterItemSpacing.height + self->_itemCaptionSpacing;
}

- (int64_t)numberOfVisualRows
{
  int64_t v4;
  int64_t v5;
  int64_t v6;
  uint64_t v7;

  if (-[PXGGridLayout scrollableAxis](self, "scrollableAxis") == 2)
    return -[PXGGridLayout numberOfRows](self, "numberOfRows");
  v4 = -[PXGGridLayout numberOfColumns](self, "numberOfColumns");
  v5 = -[PXGGridLayout numberOfVisualItems](self, "numberOfVisualItems");
  v6 = (v4 + v5 - 1) / v4;
  if (v6 >= 2)
  {
    v7 = v5;
    if (-[PXGGridLayout hideIncompleteLastRowOrColumn](self, "hideIncompleteLastRowOrColumn"))
      v6 -= v7 % v4 != 0;
  }
  return v6;
}

- (int64_t)numberOfVisualColumns
{
  int64_t v4;
  int64_t v5;
  int64_t v6;
  uint64_t v7;

  if (-[PXGGridLayout scrollableAxis](self, "scrollableAxis") == 1)
    return -[PXGGridLayout numberOfColumns](self, "numberOfColumns");
  v4 = -[PXGGridLayout numberOfRows](self, "numberOfRows");
  v5 = -[PXGGridLayout numberOfVisualItems](self, "numberOfVisualItems");
  v6 = (v4 + v5 - 1) / v4;
  if (v6 >= 2)
  {
    v7 = v5;
    if (-[PXGGridLayout hideIncompleteLastRowOrColumn](self, "hideIncompleteLastRowOrColumn"))
      v6 -= v7 % v4 != 0;
  }
  return v6;
}

- (int64_t)numberOfVisualItems
{
  int64_t v3;
  int64_t v4;
  int64_t v5;

  v3 = -[PXGItemsLayout numberOfItems](self, "numberOfItems");
  v4 = -[PXGGridLayout visualItemShift](self, "visualItemShift") + v3;
  v5 = -[PXGItemsLayout numberOfAccessoryItems](self, "numberOfAccessoryItems");
  return (v4 + v5) & ~((v4 + v5) >> 63);
}

- (CGPoint)_layoutPointInContent:(CGPoint)a3
{
  double v3;
  double v4;
  CGPoint result;

  -[PXGGridLayout contentOrigin](self, "contentOrigin");
  PXPointSubtract();
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)_contentPointInLayout:(CGPoint)a3
{
  double v3;
  double v4;
  CGPoint result;

  -[PXGGridLayout contentOrigin](self, "contentOrigin");
  PXPointAdd();
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGRect)_layoutRectInContent:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  -[PXGGridLayout _layoutPointInContent:](self, "_layoutPointInContent:", a3.origin.x, a3.origin.y);
  v7 = width;
  v8 = height;
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)_contentRectInLayout:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  -[PXGGridLayout _contentPointInLayout:](self, "_contentPointInLayout:", a3.origin.x, a3.origin.y);
  v7 = width;
  v8 = height;
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (_PXGSpriteIndexRange)spriteIndexRangeCoveringRect:(CGRect)a3
{
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSRange v8;
  void *v9;
  void *v10;
  unsigned int v11;
  unsigned int v12;
  unint64_t v13;
  NSRange v16;
  NSRange v17;

  v4 = -[PXGGridLayout itemRangeInRect:](self, "itemRangeInRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  v17.location = -[PXGItemsLayout loadedItems](self, "loadedItems");
  v17.length = v7;
  v16.location = v4;
  v16.length = v6;
  v8 = NSIntersectionRange(v16, v17);
  if (v8.length)
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v8.location, v8.length);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGItemsLayout spriteIndexesForItems:](self, "spriteIndexesForItems:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "px_coveringRange");
    v13 = v11 | ((unint64_t)v12 << 32);

  }
  else
  {
    return *(_PXGSpriteIndexRange *)off_1E50B8378;
  }
  return (_PXGSpriteIndexRange)v13;
}

- (CGRect)frameForItem:(int64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[PXGGridLayout _frameForItem:usingInterItemSpacing:itemSize:insets:contentMode:](self, "_frameForItem:usingInterItemSpacing:itemSize:insets:contentMode:", a3, -[PXGGridLayout contentMode](self, "contentMode"), self->_finalInterItemSpacing.width, self->_finalInterItemSpacing.height, self->_itemSize.width, self->_itemSize.height, self->_finalInsets.top, self->_finalInsets.left, self->_finalInsets.bottom, self->_finalInsets.right);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)frameForItem:(int64_t)a3 usingInterItemSpacing:(CGSize)a4
{
  double height;
  double width;
  double v8;
  double v9;
  double v10;
  double v11;
  int64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  __int128 v17;
  __int128 v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  height = a4.height;
  width = a4.width;
  v21 = 0.0;
  v22 = 0.0;
  v19 = 0.0;
  v20 = 0.0;
  v17 = 0u;
  v18 = 0u;
  -[PXGGridLayout padding](self, "padding");
  -[PXGGridLayout _getItemSize:finalInteritemSpacing:finalInsets:forDesiredInterItemSpacing:padding:](self, "_getItemSize:finalInteritemSpacing:finalInsets:forDesiredInterItemSpacing:padding:", &v21, &v19, &v17, width, height, v8, v9, v10, v11);
  v12 = -[PXGGridLayout contentMode](self, "contentMode");
  -[PXGGridLayout _frameForItem:usingInterItemSpacing:itemSize:insets:contentMode:](self, "_frameForItem:usingInterItemSpacing:itemSize:insets:contentMode:", a3, v12, v19, v20, v21, v22, v17, v18);
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)_frameForItem:(int64_t)a3 usingInterItemSpacing:(CGSize)a4 itemSize:(CGSize)a5 insets:(UIEdgeInsets)a6 contentMode:(int64_t)a7
{
  double left;
  double top;
  double height;
  double width;
  double v12;
  double v13;
  int64_t v16;
  int64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
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
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGRect result;

  left = a6.left;
  top = a6.top;
  height = a5.height;
  width = a5.width;
  v12 = a4.height;
  v13 = a4.width;
  v16 = -[PXGGridLayout _rowForItem:](self, "_rowForItem:", a4.width, a4.height, a5.width, a5.height, a6.top, a6.left, a6.bottom, a6.right);
  v17 = -[PXGGridLayout columnForItem:](self, "columnForItem:", a3);
  v18 = v16 - (v16 >= -[PXGGridLayout numberOfVisualRows](self, "numberOfVisualRows"));
  v19 = left
      + (double)(v17 - (v17 >= -[PXGGridLayout numberOfVisualColumns](self, "numberOfVisualColumns"))) * (v13 + width);
  v20 = top + (double)v18 * (v12 + height + self->_itemCaptionSpacing);
  if (-[PXGItemsLayout delegateRespondsTo:](self, "delegateRespondsTo:", 4))
  {
    -[PXGItemsLayout delegate](self, "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (a7 == 1 && v21)
    {
      objc_msgSend(v21, "itemsLayout:aspectRatioForItem:", self, a3);
      -[PXGGridLayout aspectRatioLimit](self, "aspectRatioLimit");
      PXClamp();
      PXRectWithAspectRatioFittingRect();
      v19 = v23;
      v20 = v24;
      width = v25;
      height = v26;
    }
  }
  else
  {
    v22 = 0;
  }
  -[PXGGridLayout _contentRectInLayout:](self, "_contentRectInLayout:", v19, v20, width, height);
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;

  v35 = v28;
  v36 = v30;
  v37 = v32;
  v38 = v34;
  result.size.height = v38;
  result.size.width = v37;
  result.origin.y = v36;
  result.origin.x = v35;
  return result;
}

- (void)_getItemSize:(CGSize *)a3 finalInteritemSpacing:(CGSize *)a4 finalInsets:(UIEdgeInsets *)a5 forDesiredInterItemSpacing:(CGSize)a6 padding:(UIEdgeInsets)a7
{
  double right;
  double bottom;
  double left;
  double top;
  double width;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  int64_t v21;
  int64_t v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  double v33;
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
  double height;
  double v47;
  double v48;
  double v49;
  double v50;
  uint64_t v51;
  double v52;

  right = a7.right;
  bottom = a7.bottom;
  left = a7.left;
  top = a7.top;
  height = a6.height;
  width = a6.width;
  v16 = -[PXGGridLayout numberOfColumns](self, "numberOfColumns");
  v17 = -[PXGGridLayout numberOfRows](self, "numberOfRows");
  -[PXGLayout referenceSize](self, "referenceSize");
  v48 = left;
  v50 = right;
  v44 = v18 - left - right;
  -[PXGLayout referenceSize](self, "referenceSize");
  v47 = top;
  v49 = bottom;
  v43 = v19 - top - bottom;
  -[PXGLayout displayScale](self, "displayScale");
  v45 = v20;
  v21 = -[PXGGridLayout style](self, "style");
  v22 = -[PXGGridLayout scrollableAxis](self, "scrollableAxis");
  if (v21 != 2)
  {
    if (v21 == 1)
    {
      v51 = 0;
      v52 = 0.0;
      if (v22 == 2)
      {
        +[PXLayoutMetricInterpolator bestItemSizeForAvailableWidth:screenScale:columns:bestSpacing:bestInset:](PXLayoutMetricInterpolator, "bestItemSizeForAvailableWidth:screenScale:columns:bestSpacing:bestInset:", v17, &v52, &v51, v43, v45);
        v24 = v33;
        v23 = 0.0;
      }
      else
      {
        +[PXLayoutMetricInterpolator bestItemSizeForAvailableWidth:screenScale:columns:bestSpacing:bestInset:](PXLayoutMetricInterpolator, "bestItemSizeForAvailableWidth:screenScale:columns:bestSpacing:bestInset:", v16, &v52, &v51, v44, v45);
        v23 = v35;
        v24 = 0.0;
      }
      v25 = v52;
      PXEdgeInsetsAdd();
      v26 = v36;
      v27 = v37;
      v28 = v38;
      v29 = v39;
    }
    else
    {
      v23 = 0.0;
      v24 = 0.0;
      v25 = 0.0;
      v26 = 0.0;
      v27 = 0.0;
      v28 = 0.0;
      v29 = 0.0;
      if (!v21)
        goto LABEL_4;
    }
    -[PXGGridLayout itemAspectRatio](self, "itemAspectRatio");
    v41 = v24 * v40;
    v42 = v23 / v40;
    if (v22 == 2)
      v23 = v41;
    else
      v24 = v42;
    v31 = v25;
    width = v25;
    goto LABEL_18;
  }
LABEL_4:
  -[PXGGridLayout itemAspectRatio](self, "itemAspectRatio");
  if (v22 == 2)
  {
    v31 = height;
    v26 = v47;
    v24 = (v43 - (double)(v17 - 1) * height) / (double)v17;
    v23 = v24 * v30;
    v28 = v49;
    v29 = v50;
    v27 = v48;
    if (v21 == 2)
    {
      PXFloatRoundToPixel();
      v31 = height;
      v23 = v32;
    }
  }
  else
  {
    v23 = (v44 - (double)(v16 - 1) * width) / (double)v16;
    v24 = v23 / v30;
    v28 = v49;
    v29 = v50;
    v26 = v47;
    v27 = v48;
    if (v21 == 2)
    {
      PXFloatRoundToPixel();
      v24 = v34;
    }
    v31 = height;
  }
LABEL_18:
  a3->width = v23;
  a3->height = v24;
  a4->width = width;
  a4->height = v31;
  a5->top = v26;
  a5->left = v27;
  a5->bottom = v28;
  a5->right = v29;
}

- (int64_t)_rowForItem:(int64_t)a3
{
  int64_t v4;

  v4 = self->_visualItemShift + a3;
  if (-[PXGGridLayout scrollableAxis](self, "scrollableAxis") == 2)
  {
    if (v4 < 0)
      v4 += -[PXGGridLayout numberOfRows](self, "numberOfRows");
    return v4 % -[PXGGridLayout numberOfRows](self, "numberOfRows");
  }
  else
  {
    if (v4 < 0)
      v4 += -[PXGGridLayout numberOfColumns](self, "numberOfColumns");
    return v4 / -[PXGGridLayout numberOfColumns](self, "numberOfColumns");
  }
}

- (int64_t)columnForItem:(int64_t)a3
{
  int64_t v4;

  v4 = self->_visualItemShift + a3;
  if (-[PXGGridLayout scrollableAxis](self, "scrollableAxis") == 2)
  {
    if (v4 < 0)
      v4 += -[PXGGridLayout numberOfRows](self, "numberOfRows");
    return v4 / -[PXGGridLayout numberOfRows](self, "numberOfRows");
  }
  else
  {
    if (v4 < 0)
      v4 += -[PXGGridLayout numberOfColumns](self, "numberOfColumns");
    return v4 % -[PXGGridLayout numberOfColumns](self, "numberOfColumns");
  }
}

- (int64_t)itemClosestTo:(CGPoint)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  int64_t v11;
  uint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;

  -[PXGGridLayout _layoutPointInContent:](self, "_layoutPointInContent:", a3.x, a3.y);
  v5 = v4;
  v7 = v6;
  v8 = -[PXGItemsLayout numberOfItems](self, "numberOfItems");
  v9 = v8 - 1;
  if (v8 < 1)
    return 0x7FFFFFFFFFFFFFFFLL;
  v10 = -[PXGGridLayout numberOfVisualRows](self, "numberOfVisualRows");
  v11 = -[PXGGridLayout numberOfVisualColumns](self, "numberOfVisualColumns");
  v12 = vcvtmd_s64_f64((v7 - self->_finalInsets.top + self->_finalInterItemSpacing.height + self->_itemCaptionSpacing)/ (self->_itemCaptionSpacing + self->_finalInterItemSpacing.height + self->_itemSize.height));
  v13 = vcvtmd_s64_f64((v5 - self->_finalInsets.left + self->_finalInterItemSpacing.width)/ (self->_finalInterItemSpacing.width + self->_itemSize.width));
  if (v10 - 1 < v12)
    v12 = v10 - 1;
  v14 = v12 & ~(v12 >> 63);
  v15 = v11 - 1;
  if (v11 - 1 >= v13)
    v15 = v13;
  v16 = v15 & ~(v15 >> 63);
  if (-[PXGGridLayout scrollableAxis](self, "scrollableAxis") == 2)
    v17 = v14 + -[PXGGridLayout numberOfRows](self, "numberOfRows") * v16;
  else
    v17 = v16 + -[PXGGridLayout numberOfColumns](self, "numberOfColumns") * v14;
  v19 = v17 - -[PXGGridLayout visualItemShift](self, "visualItemShift");
  if (v19 >= v9)
    v19 = v9;
  return v19 & ~(v19 >> 63);
}

- (CGRect)loadedItemsRect
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect v26;
  CGRect v27;
  CGRect result;

  v3 = -[PXGItemsLayout loadedItems](self, "loadedItems");
  if (v4)
  {
    v5 = v4 + v3 - 1;
    -[PXGGridLayout frameForItem:](self, "frameForItem:", v3);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[PXGGridLayout frameForItem:](self, "frameForItem:", v5);
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v26.origin.x = v7;
    v26.origin.y = v9;
    v26.size.width = v11;
    v26.size.height = v13;
    CGRectGetMinY(v26);
    -[PXGLayout referenceSize](self, "referenceSize");
    v27.origin.x = v15;
    v27.origin.y = v17;
    v27.size.width = v19;
    v27.size.height = v21;
    CGRectGetMaxY(v27);
    PXRectWithEdges();
  }
  else
  {
    v22 = *MEMORY[0x1E0C9D648];
    v23 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v24 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v25 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (_NSRange)itemRangeInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  uint64_t v17;
  int64_t v18;
  double MinY;
  double MaxY;
  double MinX;
  double MaxX;
  uint64_t v23;
  NSUInteger v24;
  unint64_t v25;
  double left;
  double v27;
  double v28;
  unint64_t v29;
  unint64_t v30;
  int64_t v31;
  int64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  void *v37;
  BOOL v38;
  uint64_t v39;
  double top;
  double v41;
  double itemCaptionSpacing;
  double v43;
  double v44;
  unint64_t v45;
  unint64_t v46;
  int64_t v47;
  int64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  NSUInteger v53;
  NSUInteger v54;
  _NSRange result;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (CGRectIsNull(a3))
    goto LABEL_23;
  v56.origin.x = x;
  v56.origin.y = y;
  v56.size.width = width;
  v56.size.height = height;
  if (CGRectIsEmpty(v56))
    goto LABEL_23;
  -[PXGGridLayout _layoutRectInContent:](self, "_layoutRectInContent:", x, y, width, height);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v17 = -[PXGItemsLayout numberOfItems](self, "numberOfItems");
  v18 = -[PXGGridLayout scrollableAxis](self, "scrollableAxis");
  v57.origin.x = v10;
  v57.origin.y = v12;
  v57.size.width = v14;
  v57.size.height = v16;
  MinY = CGRectGetMinY(v57);
  v58.origin.x = v10;
  v58.origin.y = v12;
  v58.size.width = v14;
  v58.size.height = v16;
  MaxY = CGRectGetMaxY(v58);
  v59.origin.x = v10;
  v59.origin.y = v12;
  v59.size.width = v14;
  v59.size.height = v16;
  MinX = CGRectGetMinX(v59);
  v60.origin.x = v10;
  v60.origin.y = v12;
  v60.size.width = v14;
  v60.size.height = v16;
  MaxX = CGRectGetMaxX(v60);
  if (v18 == 2)
  {
    v23 = v17 - 1;
    if (v17 >= 1)
    {
      v24 = 0;
      v25 = 0x7FFFFFFFFFFFFFFFLL;
      if (fabs(MinX) == INFINITY || fabs(MaxX) == INFINITY)
        goto LABEL_25;
      left = self->_finalInsets.left;
      v27 = self->_finalInterItemSpacing.width;
      v28 = v27 + self->_itemSize.width;
      v29 = vcvtmd_s64_f64((MinX - left + v27) / v28);
      v30 = vcvtpd_s64_f64((MaxX - left + v27) / v28);
      v31 = -[PXGGridLayout visualItemShift](self, "visualItemShift");
      v32 = -[PXGGridLayout numberOfRows](self, "numberOfRows");
      v33 = v32 * v29 - v31;
      if (v33 >= v23)
        v33 = v23;
      v25 = v33 & ~(v33 >> 63);
      v34 = ~v31 + v32 * v30;
      if (v34 >= v23)
        v34 = v23;
      v35 = v34 & ~(v34 >> 63);
      if (v35 >= v25)
      {
        v36 = v35 + 1;
        v24 = v35 + 1 - v25;
        if (v35 >= -[PXGItemsLayout numberOfItems](self, "numberOfItems"))
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGGridLayout.m"), 729, CFSTR("Should not return items out of bounds (horiz), %lu < %ld."), v36, -[PXGItemsLayout numberOfItems](self, "numberOfItems"));
LABEL_27:

          goto LABEL_25;
        }
        goto LABEL_25;
      }
LABEL_23:
      v24 = 0;
      v25 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_25;
    }
  }
  v24 = 0;
  v25 = 0x7FFFFFFFFFFFFFFFLL;
  if (v18 == 2)
    goto LABEL_25;
  v38 = v17 < 1;
  v39 = v17 - 1;
  if (v38 || fabs(MinY) == INFINITY || fabs(MaxY) == INFINITY)
    goto LABEL_25;
  top = self->_finalInsets.top;
  v41 = self->_finalInterItemSpacing.height;
  itemCaptionSpacing = self->_itemCaptionSpacing;
  v43 = MinY - top + v41 + itemCaptionSpacing;
  v44 = itemCaptionSpacing + v41 + self->_itemSize.height;
  v45 = vcvtmd_s64_f64(v43 / v44);
  v46 = vcvtpd_s64_f64((MaxY - top) / v44);
  v47 = -[PXGGridLayout visualItemShift](self, "visualItemShift");
  v48 = -[PXGGridLayout numberOfColumns](self, "numberOfColumns");
  v49 = v48 * v45 - v47;
  if (v49 >= v39)
    v49 = v39;
  v25 = v49 & ~(v49 >> 63);
  v50 = ~v47 + v48 * v46;
  if (v50 >= v39)
    v50 = v39;
  v51 = v50 & ~(v50 >> 63);
  if (v51 < v25)
    goto LABEL_23;
  v52 = v51 + 1;
  v24 = v51 + 1 - v25;
  if (v51 >= -[PXGItemsLayout numberOfItems](self, "numberOfItems"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGGridLayout.m"), 746, CFSTR("Should not return items out of bounds (vert), %lu < %ld."), v52, -[PXGItemsLayout numberOfItems](self, "numberOfItems"));
    goto LABEL_27;
  }
LABEL_25:
  v53 = v25;
  v54 = v24;
  result.length = v54;
  result.location = v53;
  return result;
}

- (_NSRange)itemRangeForSpriteIndexRange:(_PXGSpriteIndexRange)a3
{
  NSUInteger length;
  NSUInteger v4;
  NSUInteger v5;
  _NSRange result;

  length = a3.length;
  v4 = -[PXGItemsLayout loadedItems](self, "loadedItems") + a3.location;
  v5 = length;
  result.length = v5;
  result.location = v4;
  return result;
}

- (_NSRange)_itemsToLoadForVisibleRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  NSUInteger v14;
  NSUInteger location;
  NSUInteger length;
  NSUInteger v17;
  NSUInteger v18;
  NSUInteger v19;
  NSUInteger v20;
  int64_t v21;
  double v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  NSUInteger v34;
  int64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSUInteger v38;
  NSRange v39;
  NSRange v40;
  _NSRange result;
  NSRange v42;
  CGRect v43;
  CGRect v44;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!-[PXGItemsLayout isLazy](self, "isLazy"))
  {
    v18 = -[PXGItemsLayout numberOfItems](self, "numberOfItems");
    v17 = 0;
    goto LABEL_8;
  }
  -[PXGGridLayout anchorViewportCenter](self, "anchorViewportCenter");
  v9 = v8;
  v11 = v10;
  if ((PXPointIsNull() & 1) != 0
    || (-[PXGGridLayout anchorObjectReference](self, "anchorObjectReference"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v12,
        !v12)
    || (-[PXGGridLayout anchorObjectReference](self, "anchorObjectReference"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = -[PXGItemsLayout itemForObjectReference:](self, "itemForObjectReference:", v13),
        v13,
        v14 == 0x7FFFFFFFFFFFFFFFLL))
  {
    -[PXGGridLayout _pageAlignedRectForVisibleRect:](self, "_pageAlignedRectForVisibleRect:", x, y, width, height);
    location = -[PXGGridLayout itemRangeInRect:](self, "itemRangeInRect:");
LABEL_6:
    v17 = location;
    v18 = length;
    goto LABEL_8;
  }
  v21 = -[PXGGridLayout scrollableAxis](self, "scrollableAxis");
  -[PXGGridLayout frameForItem:](self, "frameForItem:", v14);
  PXRectGetCenter();
  PXPointSubtract();
  if (v21 == 2)
  {
    v24 = v22 - v9;
    v43.origin.x = x;
    v43.origin.y = y;
    v43.size.width = width;
    v43.size.height = height;
    CGRectOffset(v43, v24, 0.0);
    -[PXGGridLayout contentOrigin](self, "contentOrigin");
    -[PXGLayout contentSize](self, "contentSize");
    -[PXGLayout visibleRect](self, "visibleRect");
  }
  else
  {
    v25 = v23 - v11;
    v44.origin.x = x;
    v44.origin.y = y;
    v44.size.width = width;
    v44.size.height = height;
    CGRectOffset(v44, 0.0, v25);
    -[PXGGridLayout contentOrigin](self, "contentOrigin");
    -[PXGLayout contentSize](self, "contentSize");
  }
  PXRectShiftedInsideConstrainingRect();
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v17 = -[PXGGridLayout itemRangeInRect:](self, "itemRangeInRect:");
  v18 = v34;
  if ((v14 < v17 || v14 - v17 >= v34)
    && -[PXGGridLayout loadItemsOutsideAnchorViewport](self, "loadItemsOutsideAnchorViewport"))
  {
    if (-[PXGGridLayout scrollableAxis](self, "scrollableAxis") == 2)
      v35 = -[PXGGridLayout numberOfRows](self, "numberOfRows");
    else
      v35 = -[PXGGridLayout numberOfColumns](self, "numberOfColumns");
    v36 = 0x7FFFFFFFFFFFFFFFLL;
    if (v18 && v17 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v37 = v18 + v17 - 1;
      if (v37 >= (uint64_t)v14)
        v37 = v14;
      if ((uint64_t)v17 > v37)
        v37 = v17;
      v36 = v14 - v37;
      if (v36 < 0)
        v36 = -v36;
    }
    if (v36 > 2 * v35)
    {
      -[PXGGridLayout _pageAlignedRectForVisibleRect:](self, "_pageAlignedRectForVisibleRect:", v27, v29, v31, v33);
      v17 = -[PXGGridLayout itemRangeInRect:](self, "itemRangeInRect:");
      v18 = v38;
    }
    v40.location = v17;
    v40.length = v18;
    v42.location = v14;
    v42.length = 1;
    v39 = NSUnionRange(v40, v42);
    length = v39.length;
    location = v39.location;
    goto LABEL_6;
  }
LABEL_8:
  v19 = v17;
  v20 = v18;
  result.length = v20;
  result.location = v19;
  return result;
}

- (CGRect)_pageAlignedRectForVisibleRect:(CGRect)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  CGFloat x;
  CGFloat y;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  unint64_t v15;
  double MaxX;
  double v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  unint64_t v25;
  double MaxY;
  double v27;
  double v28;
  double v29;
  double v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  +[PXGTextureManagerPreheatingStrategy defaultPreheatingStrategy](PXGTextureManagerPreheatingStrategy, "defaultPreheatingStrategy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "maxPreheatingDistance");

  if (-[PXGGridLayout scrollableAxis](self, "scrollableAxis") == 2)
  {
    v7 = 0.0;
    PXEdgeInsetsMake();
    PXEdgeInsetsInsetRect();
    x = v31.origin.x;
    y = v31.origin.y;
    v10 = v31.size.width;
    v11 = v31.size.height;
    v12 = round(width * 0.5);
    v13 = CGRectGetMinX(v31) / v12;
    v14 = floor(v13);
    v15 = vcvtmd_s64_f64(v13);
    v32.origin.x = x;
    v32.origin.y = y;
    v32.size.width = v10;
    v32.size.height = v11;
    MaxX = CGRectGetMaxX(v32);
    if (MaxX < 0.0)
      MaxX = 0.0;
    v17 = v12 * (double)(uint64_t)v14;
    v18 = v12 * (double)(uint64_t)(vcvtpd_s64_f64(MaxX / v12) - v15 + 1);
  }
  else
  {
    v17 = 0.0;
    PXEdgeInsetsMake();
    PXEdgeInsetsInsetRect();
    v19 = v33.origin.x;
    v20 = v33.origin.y;
    v18 = v33.size.width;
    v21 = v33.size.height;
    v22 = round(height * 0.5);
    v23 = CGRectGetMinY(v33) / v22;
    v24 = floor(v23);
    v25 = vcvtmd_s64_f64(v23);
    v34.origin.x = v19;
    v34.origin.y = v20;
    v34.size.width = v18;
    v34.size.height = v21;
    MaxY = CGRectGetMaxY(v34);
    if (MaxY < 0.0)
      MaxY = 0.0;
    v7 = v22 * (double)(uint64_t)v24;
    v11 = v22 * (double)(uint64_t)(vcvtpd_s64_f64(MaxY / v22) - v25 + 1);
  }
  v27 = v17;
  v28 = v7;
  v29 = v18;
  v30 = v11;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

- (_NSRange)itemsToLoad
{
  int64_t v4;
  unint64_t v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int64_t v11;
  NSUInteger v12;
  void *v13;
  int64_t v14;
  NSUInteger v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSUInteger v22;
  NSUInteger v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  PXGGridLayout *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  _NSRange result;

  v4 = -[PXGItemsLayout numberOfItems](self, "numberOfItems");
  v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4)
  {
    v6 = v4;
    -[PXGLayout rootLayout](self, "rootLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activeAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = 0;
    v30 = &v29;
    v31 = 0x2020000000;
    v32 = 0x7FFFFFFFFFFFFFFFLL;
    -[PXGLayout rootLayout](self, "rootLayout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "anchoredContentEdges");

    if (v10 && v8 && objc_msgSend(v8, "type") != 5)
    {
      if ((v10 & 1) != 0)
      {
        v11 = 0;
        goto LABEL_10;
      }
      if ((v10 & 4) != 0)
      {
        v11 = v6 - 1;
LABEL_10:
        v30[3] = v11;
      }
    }
    -[PXGGridLayout anchorObjectReference](self, "anchorObjectReference");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v30[3];
    if (v14 == 0x7FFFFFFFFFFFFFFFLL && v13)
    {
      v14 = -[PXGItemsLayout itemForObjectReference:](self, "itemForObjectReference:", v13);
      v30[3] = v14;
    }
    if (v14 == 0x7FFFFFFFFFFFFFFFLL && v8)
    {
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __28__PXGGridLayout_itemsToLoad__block_invoke;
      v25[3] = &unk_1E513ADD8;
      v27 = self;
      v28 = &v29;
      v26 = v8;
      objc_msgSend(v26, "enumerateAllSpriteReferencesUsingBlock:", v25);

    }
    -[PXGLayout visibleRect](self, "visibleRect");
    v5 = -[PXGGridLayout _itemsToLoadForVisibleRect:](self, "_itemsToLoadForVisibleRect:");
    v12 = v15;
    if (v30[3] == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_37;
    -[PXGLayout visibleRect](self, "visibleRect");
    -[PXGGridLayout _itemsToLoadForVisibleRect:](self, "_itemsToLoadForVisibleRect:", 0.0, 0.0);
    v17 = v16;
    v18 = v30[3];
    if (v18 >= v5 && v18 - v5 < v12)
    {
      if (v12 >= v16 || -[PXGGridLayout loadItemsOutsideAnchorViewport](self, "loadItemsOutsideAnchorViewport"))
      {
LABEL_37:

        _Block_object_dispose(&v29, 8);
        goto LABEL_38;
      }
      v18 = v30[3];
    }
    if ((uint64_t)v18 >= v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGGridLayout.m"), 877, CFSTR("Anchor item %ld must be < numberOfItems %ld"), v30[3], v6);

      v18 = v30[3];
    }
    if (v17 <= 1)
      v19 = 1;
    else
      v19 = v17;
    if (v19 >= 0)
      v20 = v19;
    else
      v20 = v19 + 1;
    v21 = (v18 - (v20 >> 1)) & ~((uint64_t)(v18 - (v20 >> 1)) >> 63);
    if (v6 - v21 >= v17)
      v5 = v21;
    else
      v5 = v6 - v17;
    if (v19 >= (uint64_t)(v6 - v5))
      v12 = v6 - v5;
    else
      v12 = v19;
    goto LABEL_37;
  }
  v12 = 0;
LABEL_38:
  v22 = v5;
  v23 = v12;
  result.length = v23;
  result.location = v22;
  return result;
}

- (CGSize)sizeForItem:(int64_t)a3
{
  CGSize *p_itemSize;
  void *v6;
  void *v7;
  double width;
  double height;
  PXGGridLayout *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  CGSize result;

  p_itemSize = &self->_itemSize;
  -[PXGGridLayout marginDelegate](self, "marginDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGGridLayout insetDelegate](self, "insetDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  width = p_itemSize->width;
  height = p_itemSize->height;
  v10 = self;
  objc_msgSend(v6, "itemsLayout:marginForItem:", v10, a3);
  objc_msgSend(v7, "itemsLayout:insetForItem:", v10, a3);

  PXSizeAdd();
  v13 = width - v12;
  if (v13 >= 0.0)
    v14 = v13;
  else
    v14 = 0.0;
  if (height - v11 >= 0.0)
    v15 = height - v11;
  else
    v15 = 0.0;

  -[PXGItemsLayout delegate](v10, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PXGItemsLayout delegateRespondsTo:](v10, "delegateRespondsTo:", 4))
    v17 = v16;
  else
    v17 = 0;
  v18 = v17;
  if (-[PXGGridLayout contentMode](v10, "contentMode") == 1 && v18)
  {
    objc_msgSend(v18, "itemsLayout:aspectRatioForItem:", v10, a3);
    -[PXGGridLayout aspectRatioLimit](v10, "aspectRatioLimit");
    v19 = PXClamp();
    v14 = MEMORY[0x1A85CD660](v19);
    v15 = v20;
  }

  v21 = v14;
  v22 = v15;
  result.height = v22;
  result.width = v21;
  return result;
}

- (unsigned)spriteIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5
{
  id v8;
  int64_t v9;
  unsigned int v10;
  id v11;

  v8 = a3;
  v9 = -[PXGItemsLayout itemForObjectReference:options:](self, "itemForObjectReference:options:", v8, a4);
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    v10 = -1;
  else
    v10 = -[PXGItemsLayout spriteIndexForItem:](self, "spriteIndexForItem:", v9);
  v11 = objc_retainAutorelease(v8);
  *a5 = v11;

  return v10;
}

- (BOOL)shouldUpdateDecorationMediaTargetSizes
{
  void *v2;
  BOOL v3;

  -[PXGGridLayout anchorObjectReference](self, "anchorObjectReference");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (id)dropTargetObjectReferenceForLocation:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  int64_t v16;
  uint64_t v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double MaxY;
  double MinX;
  BOOL v29;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  y = a3.y;
  x = a3.x;
  -[PXGGridLayout _layoutPointInContent:](self, "_layoutPointInContent:");
  v7 = v6;
  v9 = v8;
  v10 = *MEMORY[0x1E0C9D538];
  v11 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[PXGLayout contentSize](self, "contentSize");
  v13 = v12;
  v15 = v14;
  v31.origin.x = v10;
  v31.origin.y = v11;
  v31.size.width = v13;
  v31.size.height = v15;
  if (v7 > CGRectGetMaxX(v31)
    || (v32.origin.x = v10, v32.origin.y = v11, v32.size.width = v13, v32.size.height = v15, v9 > CGRectGetMaxY(v32)))
  {
    if (-[PXGItemsLayout dropTargetStyle](self, "dropTargetStyle") != 2)
      return 0;
  }
  v16 = -[PXGGridLayout itemClosestTo:](self, "itemClosestTo:", x, y);
  if (v16 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v18 = v16;
  -[PXGGridLayout _frameForItem:usingInterItemSpacing:itemSize:insets:contentMode:](self, "_frameForItem:usingInterItemSpacing:itemSize:insets:contentMode:", v16, 0, self->_finalInterItemSpacing.width, self->_finalInterItemSpacing.height, self->_itemSize.width, self->_itemSize.height, self->_finalInsets.top, self->_finalInsets.left, self->_finalInsets.bottom, self->_finalInsets.right);
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  if (-[PXGItemsLayout dropTargetStyle](self, "dropTargetStyle") == 2)
  {
    v33.origin.x = v20;
    v33.origin.y = v22;
    v33.size.width = v24;
    v33.size.height = v26;
    if (x <= CGRectGetMidX(v33))
      goto LABEL_23;
LABEL_20:
    if (v18 + 1 < -[PXGItemsLayout numberOfItems](self, "numberOfItems"))
      ++v18;
    else
      v18 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_23;
  }
  v34.origin.x = v20;
  v34.origin.y = v22;
  v34.size.width = v24;
  v34.size.height = v26;
  MaxY = CGRectGetMaxY(v34);
  v35.origin.x = v20;
  v35.origin.y = v22;
  v35.size.width = v24;
  v35.size.height = v26;
  MinX = CGRectGetMinX(v35);
  if (v18 < 1 || (x < MinX ? (v29 = y < MaxY) : (v29 = 0), !v29))
  {
    v36.origin.x = v20;
    v36.origin.y = v22;
    v36.size.width = v24;
    v36.size.height = v26;
    if (x <= CGRectGetMaxX(v36) && y < MaxY)
      goto LABEL_23;
    goto LABEL_20;
  }
  --v18;
LABEL_23:
  -[PXGItemsLayout objectReferenceForItem:](self, "objectReferenceForItem:", v18);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)navigationObjectReferenceForLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  int64_t v7;
  objc_super v9;

  y = a3.y;
  x = a3.x;
  v9.receiver = self;
  v9.super_class = (Class)PXGGridLayout;
  -[PXGLayout navigationObjectReferenceForLocation:](&v9, sel_navigationObjectReferenceForLocation_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v7 = -[PXGGridLayout itemClosestTo:](self, "itemClosestTo:", x, y);
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v6 = 0;
    }
    else
    {
      -[PXGItemsLayout objectReferenceForItem:](self, "objectReferenceForItem:", v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v6;
}

- (void)dropTargetObjectReferenceDidChange
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXGGridLayout;
  -[PXGItemsLayout dropTargetObjectReferenceDidChange](&v8, sel_dropTargetObjectReferenceDidChange);
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 4;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 4) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGridLayout dropTargetObjectReferenceDidChange]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGGridLayout.m"), 982, CFSTR("invalidating %lu after it already has been updated"), 4);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 4;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
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
  v8.super_class = (Class)PXGGridLayout;
  -[PXGLayout referenceSizeDidChange](&v8, sel_referenceSizeDidChange);
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGridLayout referenceSizeDidChange]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGGridLayout.m"), 989, CFSTR("invalidating %lu after it already has been updated"), 1);

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

- (void)displayScaleDidChange
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXGGridLayout;
  -[PXGLayout displayScaleDidChange](&v8, sel_displayScaleDidChange);
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 5;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 5) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGridLayout displayScaleDidChange]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGGridLayout.m"), 994, CFSTR("invalidating %lu after it already has been updated"), 5);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 5;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)entityManagerDidChange
{
  uint64_t v3;
  void *v4;
  _BOOL4 v5;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PXGGridLayout;
  -[PXGLayout entityManagerDidChange](&v11, sel_entityManagerDidChange);
  -[PXGLayout entityManager](self, "entityManager");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = -[PXGGridLayout enableEffects](self, "enableEffects");

    if (v5)
    {
      p_updateFlags = &self->_updateFlags;
      needsUpdate = self->_updateFlags.needsUpdate;
      if (needsUpdate)
      {
        if (!self->_updateFlags.isPerformingUpdate)
        {
LABEL_8:
          p_updateFlags->needsUpdate = needsUpdate | 8;
          return;
        }
LABEL_7:
        if ((self->_updateFlags.updated & 8) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGridLayout entityManagerDidChange]");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("PXGGridLayout.m"), 1000, CFSTR("invalidating %lu after it already has been updated"), 8);

          abort();
        }
        goto LABEL_8;
      }
      if (self->_updateFlags.isPerformingUpdate)
        goto LABEL_7;
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      p_updateFlags->needsUpdate = 8;
      if (!willPerformUpdate)
        -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
    }
  }
}

- (void)alphaDidChange
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXGGridLayout;
  -[PXGLayout alphaDidChange](&v8, sel_alphaDidChange);
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 8;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 8) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGridLayout alphaDidChange]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGGridLayout.m"), 1006, CFSTR("invalidating %lu after it already has been updated"), 8);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 8;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)visibleRectDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXGGridLayout;
  -[PXGLayout visibleRectDidChange](&v3, sel_visibleRectDidChange);
  -[PXGItemsLayout invalidateLoadedItems](self, "invalidateLoadedItems");
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
  v8.super_class = (Class)PXGGridLayout;
  -[PXGLayout safeAreaInsetsDidChange](&v8, sel_safeAreaInsetsDidChange);
  if (-[PXGGridLayout fillSafeAreaTopInset](self, "fillSafeAreaTopInset"))
  {
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 2;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 2) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGridLayout safeAreaInsetsDidChange]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGGridLayout.m"), 1017, CFSTR("invalidating %lu after it already has been updated"), 2);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 2;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)loadedItemsDidChange
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXGGridLayout;
  -[PXGItemsLayout loadedItemsDidChange](&v8, sel_loadedItemsDidChange);
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 0xC;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0xC) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGridLayout loadedItemsDidChange]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGGridLayout.m"), 1023, CFSTR("invalidating %lu after it already has been updated"), 12);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 12;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)numberOfAccessoryItemsDidChange
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXGGridLayout;
  -[PXGItemsLayout numberOfAccessoryItemsDidChange](&v8, sel_numberOfAccessoryItemsDidChange);
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 2;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGridLayout numberOfAccessoryItemsDidChange]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGGridLayout.m"), 1028, CFSTR("invalidating %lu after it already has been updated"), 2);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 2;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)accessoryItemsDidChange
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXGGridLayout;
  -[PXGItemsLayout accessoryItemsDidChange](&v8, sel_accessoryItemsDidChange);
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 0xC;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0xC) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGridLayout accessoryItemsDidChange]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGGridLayout.m"), 1033, CFSTR("invalidating %lu after it already has been updated"), 12);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 12;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)effectsDidChange
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXGGridLayout;
  -[PXGItemsLayout effectsDidChange](&v8, sel_effectsDidChange);
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 8;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 8) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGridLayout effectsDidChange]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGGridLayout.m"), 1038, CFSTR("invalidating %lu after it already has been updated"), 8);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 8;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)setNeedsUpdateOfScrollableAxis
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXGGridLayout;
  -[PXGLayout setNeedsUpdateOfScrollableAxis](&v8, sel_setNeedsUpdateOfScrollableAxis);
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 0xF;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0xF) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGridLayout setNeedsUpdateOfScrollableAxis]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGGridLayout.m"), 1043, CFSTR("invalidating %lu after it already has been updated"), 15);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 15;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)setStyle:(int64_t)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  if (self->_style != a3)
  {
    self->_style = a3;
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
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGridLayout setStyle:]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGGridLayout.m"), 1051, CFSTR("invalidating %lu after it already has been updated"), 1);

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

- (void)setContentOrigin:(CGPoint)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v7;
  void *v8;

  if (self->_contentOrigin.x != a3.x || self->_contentOrigin.y != a3.y)
  {
    self->_contentOrigin = a3;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_10:
        p_updateFlags->needsUpdate = needsUpdate | 0xC;
        return;
      }
LABEL_9:
      if ((self->_updateFlags.updated & 0xC) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGridLayout setContentOrigin:]");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("PXGGridLayout.m"), 1059, CFSTR("invalidating %lu after it already has been updated"), 12);

        abort();
      }
      goto LABEL_10;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_9;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 12;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)setContentMode:(int64_t)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v7;
  void *v8;

  if (self->_contentMode != a3)
  {
    self->_contentMode = a3;
    -[PXGLayout invalidateDecoration](self, "invalidateDecoration");
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 0xF;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 0xF) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGridLayout setContentMode:]");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("PXGGridLayout.m"), 1068, CFSTR("invalidating %lu after it already has been updated"), 15);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 15;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)setEnableBestCropRect:(BOOL)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  if (self->_enableBestCropRect != a3)
  {
    self->_enableBestCropRect = a3;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 8;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 8) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGridLayout setEnableBestCropRect:]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGGridLayout.m"), 1076, CFSTR("invalidating %lu after it already has been updated"), 8);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 8;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)setEnableEffects:(BOOL)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  if (self->_enableEffects != a3)
  {
    self->_enableEffects = a3;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 8;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 8) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGridLayout setEnableEffects:]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGGridLayout.m"), 1084, CFSTR("invalidating %lu after it already has been updated"), 8);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 8;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)setEnablePerItemCornerRadius:(BOOL)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  if (self->_enablePerItemCornerRadius != a3)
  {
    self->_enablePerItemCornerRadius = a3;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 8;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 8) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGridLayout setEnablePerItemCornerRadius:]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGGridLayout.m"), 1092, CFSTR("invalidating %lu after it already has been updated"), 8);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 8;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)setEnablePerItemInsets:(BOOL)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  if (self->_enablePerItemInsets != a3)
  {
    self->_enablePerItemInsets = a3;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 4;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 4) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGridLayout setEnablePerItemInsets:]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGGridLayout.m"), 1100, CFSTR("invalidating %lu after it already has been updated"), 4);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 4;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)setEnablePerItemMargin:(BOOL)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  if (self->_enablePerItemMargin != a3)
  {
    self->_enablePerItemMargin = a3;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 4;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 4) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGridLayout setEnablePerItemMargin:]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGGridLayout.m"), 1108, CFSTR("invalidating %lu after it already has been updated"), 4);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 4;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)setAxis:(int64_t)a3
{
  if (self->_axis != a3)
  {
    self->_axis = a3;
    -[PXGGridLayout setNeedsUpdateOfScrollableAxis](self, "setNeedsUpdateOfScrollableAxis");
  }
}

- (void)setNumberOfColumns:(int64_t)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  if (self->_numberOfColumns != a3)
  {
    self->_numberOfColumns = a3;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 0xF;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 0xF) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGridLayout setNumberOfColumns:]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGGridLayout.m"), 1125, CFSTR("invalidating %lu after it already has been updated"), 15);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 15;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)setNumberOfRows:(int64_t)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  if (self->_numberOfRows != a3)
  {
    self->_numberOfRows = a3;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 0xF;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 0xF) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGridLayout setNumberOfRows:]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGGridLayout.m"), 1134, CFSTR("invalidating %lu after it already has been updated"), 15);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 15;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)setPadding:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  UIEdgeInsets *p_padding;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v12;
  void *v13;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  p_padding = &self->_padding;
  if ((PXEdgeInsetsEqualToEdgeInsets() & 1) == 0)
  {
    p_padding->top = top;
    p_padding->left = left;
    p_padding->bottom = bottom;
    p_padding->right = right;
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
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGridLayout setPadding:]");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("PXGGridLayout.m"), 1142, CFSTR("invalidating %lu after it already has been updated"), 1);

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

- (void)setFillSafeAreaTopInset:(BOOL)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  if (self->_fillSafeAreaTopInset != a3)
  {
    self->_fillSafeAreaTopInset = a3;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 0xF;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 0xF) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGridLayout setFillSafeAreaTopInset:]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGGridLayout.m"), 1151, CFSTR("invalidating %lu after it already has been updated"), 15);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 15;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)setInterItemSpacing:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  CGSize *p_interItemSpacing;
  NSObject *v8;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v12;
  void *v13;
  uint8_t buf[4];
  PXGGridLayout *v15;
  __int16 v16;
  CGFloat v17;
  __int16 v18;
  CGFloat v19;
  uint64_t v20;

  height = a3.height;
  width = a3.width;
  v20 = *MEMORY[0x1E0C80C00];
  p_interItemSpacing = &self->_interItemSpacing;
  if (a3.width != self->_interItemSpacing.width || a3.height != self->_interItemSpacing.height)
  {
    if (fabs(a3.width) == INFINITY || a3.width < 0.0 || fabs(a3.height) == INFINITY || a3.height < 0.0)
    {
      PXAssertGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v15 = self;
        v16 = 2048;
        v17 = width;
        v18 = 2048;
        v19 = height;
        _os_log_error_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "%@ got invalid interitemSpacing:%.3fx%.3f", buf, 0x20u);
      }

    }
    p_interItemSpacing->width = width;
    p_interItemSpacing->height = height;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_17:
        p_updateFlags->needsUpdate = needsUpdate | 1;
        return;
      }
LABEL_16:
      if ((self->_updateFlags.updated & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGridLayout setInterItemSpacing:]");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("PXGGridLayout.m"), 1160, CFSTR("invalidating %lu after it already has been updated"), 1);

        abort();
      }
      goto LABEL_17;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_16;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 1;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)setItemCaptionSpacing:(double)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v7;
  void *v8;

  if (self->_itemCaptionSpacing != a3)
  {
    self->_itemCaptionSpacing = a3;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 6;
LABEL_8:
        -[PXGLayout invalidateDecoration](self, "invalidateDecoration");
        return;
      }
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      p_updateFlags->needsUpdate = 6;
      if (!willPerformUpdate)
        -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
      goto LABEL_8;
    }
    if ((self->_updateFlags.updated & 6) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGridLayout setItemCaptionSpacing:]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("PXGGridLayout.m"), 1168, CFSTR("invalidating %lu after it already has been updated"), 6);

      abort();
    }
    goto LABEL_7;
  }
}

- (void)setItemAspectRatio:(double)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  if (self->_itemAspectRatio != a3)
  {
    self->_itemAspectRatio = a3;
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
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGridLayout setItemAspectRatio:]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGGridLayout.m"), 1177, CFSTR("invalidating %lu after it already has been updated"), 1);

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

- (void)setAspectRatioLimit:(double)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  if (self->_aspectRatioLimit != a3)
  {
    self->_aspectRatioLimit = a3;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 0xF;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 0xF) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGridLayout setAspectRatioLimit:]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGGridLayout.m"), 1186, CFSTR("invalidating %lu after it already has been updated"), 15);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 15;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)setVisualItemShift:(int64_t)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v7;
  void *v8;

  if (self->_visualItemShift != a3)
  {
    self->_visualItemShift = a3;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 0xE;
LABEL_8:
        -[PXGItemsLayout invalidateLoadedItems](self, "invalidateLoadedItems");
        return;
      }
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      p_updateFlags->needsUpdate = 14;
      if (!willPerformUpdate)
        -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
      goto LABEL_8;
    }
    if ((self->_updateFlags.updated & 0xE) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGridLayout setVisualItemShift:]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("PXGGridLayout.m"), 1194, CFSTR("invalidating %lu after it already has been updated"), 14);

      abort();
    }
    goto LABEL_7;
  }
}

- (void)setHideIncompleteLastRowOrColumn:(BOOL)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v7;
  void *v8;

  if (self->_hideIncompleteLastRowOrColumn != a3)
  {
    self->_hideIncompleteLastRowOrColumn = a3;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 0xE;
LABEL_8:
        -[PXGItemsLayout invalidateLoadedItems](self, "invalidateLoadedItems");
        return;
      }
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      p_updateFlags->needsUpdate = 14;
      if (!willPerformUpdate)
        -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
      goto LABEL_8;
    }
    if ((self->_updateFlags.updated & 0xE) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGridLayout setHideIncompleteLastRowOrColumn:]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("PXGGridLayout.m"), 1203, CFSTR("invalidating %lu after it already has been updated"), 14);

      abort();
    }
    goto LABEL_7;
  }
}

- (void)setAnchorObjectReference:(id)a3
{
  id v5;
  void *v6;
  char v7;
  id v8;

  v8 = a3;
  v5 = self->_anchorObjectReference;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = objc_msgSend(v5, "isEqual:", v8);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong(&self->_anchorObjectReference, a3);
      -[PXGItemsLayout invalidateLoadedItems](self, "invalidateLoadedItems");
    }
  }

}

- (void)setAnchorViewportCenter:(CGPoint)a3
{
  if (self->_anchorViewportCenter.x != a3.x || self->_anchorViewportCenter.y != a3.y)
  {
    self->_anchorViewportCenter = a3;
    -[PXGItemsLayout invalidateLoadedItems](self, "invalidateLoadedItems");
  }
}

- (void)setLoadItemsOutsideAnchorViewport:(BOOL)a3
{
  if (self->_loadItemsOutsideAnchorViewport != a3)
  {
    self->_loadItemsOutsideAnchorViewport = a3;
    -[PXGItemsLayout invalidateLoadedItems](self, "invalidateLoadedItems");
  }
}

- (void)setItemCornerRadius:(id)a3
{
  float v3;
  float v4;
  float v5;
  float v6;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v13;
  void *v14;

  if (v3 != self->_itemCornerRadius.var0.var0.topLeft
    || v4 != self->_itemCornerRadius.var0.var0.topRight
    || v5 != self->_itemCornerRadius.var0.var0.bottomLeft
    || v6 != self->_itemCornerRadius.var0.var0.bottomRight)
  {
    self->_itemCornerRadius.var0.var0.topLeft = v3;
    self->_itemCornerRadius.var0.var0.topRight = v4;
    self->_itemCornerRadius.var0.var0.bottomLeft = v5;
    self->_itemCornerRadius.var0.var0.bottomRight = v6;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_16:
        p_updateFlags->needsUpdate = needsUpdate | 8;
        return;
      }
LABEL_15:
      if ((self->_updateFlags.updated & 8) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", *(_QWORD *)&a3.var0.var0.var0, *(_QWORD *)&a3.var0.var1[2]);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGridLayout setItemCornerRadius:]");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("PXGGridLayout.m"), 1236, CFSTR("invalidating %lu after it already has been updated"), 8);

        abort();
      }
      goto LABEL_16;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_15;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 8;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate", *(_QWORD *)&a3.var0.var0.var0, *(_QWORD *)&a3.var0.var1[2]);
  }
}

- (void)setEdgeCornerRadius:(id)a3
{
  float v3;
  float v4;
  float v5;
  float v6;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v13;
  void *v14;

  if (v3 != self->_edgeCornerRadius.var0.var0.topLeft
    || v4 != self->_edgeCornerRadius.var0.var0.topRight
    || v5 != self->_edgeCornerRadius.var0.var0.bottomLeft
    || v6 != self->_edgeCornerRadius.var0.var0.bottomRight)
  {
    self->_edgeCornerRadius.var0.var0.topLeft = v3;
    self->_edgeCornerRadius.var0.var0.topRight = v4;
    self->_edgeCornerRadius.var0.var0.bottomLeft = v5;
    self->_edgeCornerRadius.var0.var0.bottomRight = v6;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_16:
        p_updateFlags->needsUpdate = needsUpdate | 0xC;
        return;
      }
LABEL_15:
      if ((self->_updateFlags.updated & 0xC) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", *(_QWORD *)&a3.var0.var0.var0, *(_QWORD *)&a3.var0.var1[2]);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGridLayout setEdgeCornerRadius:]");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("PXGGridLayout.m"), 1244, CFSTR("invalidating %lu after it already has been updated"), 12);

        abort();
      }
      goto LABEL_16;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_15;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 12;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate", *(_QWORD *)&a3.var0.var0.var0, *(_QWORD *)&a3.var0.var1[2]);
  }
}

- (void)setItemZPosition:(float)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  if (self->_itemZPosition != a3)
  {
    self->_itemZPosition = a3;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 4;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 4) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGridLayout setItemZPosition:]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGGridLayout.m"), 1252, CFSTR("invalidating %lu after it already has been updated"), 4);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 4;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)setMediaKind:(unsigned __int8)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  if (self->_mediaKind != a3)
  {
    self->_mediaKind = a3;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 4;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 4) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGridLayout setMediaKind:]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGGridLayout.m"), 1260, CFSTR("invalidating %lu after it already has been updated"), 4);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 4;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)setSpriteInfoFlags:(unsigned __int8)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  if (self->_spriteInfoFlags != a3)
  {
    self->_spriteInfoFlags = a3;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 4;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 4) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGridLayout setSpriteInfoFlags:]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGGridLayout.m"), 1268, CFSTR("invalidating %lu after it already has been updated"), 4);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 4;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)setPresentationType:(unsigned __int8)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  if (self->_presentationType != a3)
  {
    self->_presentationType = a3;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 4;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 4) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGridLayout setPresentationType:]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGGridLayout.m"), 1276, CFSTR("invalidating %lu after it already has been updated"), 4);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 4;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)setAccessoryMediaKind:(unsigned __int8)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  if (self->_accessoryMediaKind != a3)
  {
    self->_accessoryMediaKind = a3;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 4;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 4) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGridLayout setAccessoryMediaKind:]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGGridLayout.m"), 1284, CFSTR("invalidating %lu after it already has been updated"), 4);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 4;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)setAccessoryAlpha:(double)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  if (self->_accessoryAlpha != a3)
  {
    self->_accessoryAlpha = a3;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 8;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 8) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGridLayout setAccessoryAlpha:]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGGridLayout.m"), 1292, CFSTR("invalidating %lu after it already has been updated"), 8);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 8;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)setAccessoryPresentationType:(unsigned __int8)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  if (self->_accessoryPresentationType != a3)
  {
    self->_accessoryPresentationType = a3;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 4;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 4) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGridLayout setAccessoryPresentationType:]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGGridLayout.m"), 1300, CFSTR("invalidating %lu after it already has been updated"), 4);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 4;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)setNumberOfItems:(int64_t)a3 withChangeDetails:(id)a4 changeMediaVersionHandler:(id)a5
{
  id v8;
  id v9;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v13;
  void *v14;
  objc_super v15;

  v8 = a4;
  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PXGGridLayout;
  -[PXGItemsLayout setNumberOfItems:withChangeDetails:changeMediaVersionHandler:](&v15, sel_setNumberOfItems_withChangeDetails_changeMediaVersionHandler_, a3, v8, v9);
  if (!v8 || objc_msgSend(v8, "hasAnyChanges"))
  {
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_8:
        p_updateFlags->needsUpdate = needsUpdate | 0xE;
        goto LABEL_9;
      }
LABEL_7:
      if ((self->_updateFlags.updated & 0xE) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGGridLayout setNumberOfItems:withChangeDetails:changeMediaVersionHandler:]");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("PXGGridLayout.m"), 1307, CFSTR("invalidating %lu after it already has been updated"), 14);

        abort();
      }
      goto LABEL_8;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_7;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 14;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
LABEL_9:

}

- (void)applySpriteChangeDetails:(id)a3 countAfterChanges:(unsigned int)a4 initialState:(id)a5 modifyState:(id)a6
{
  uint64_t v8;
  id v11;
  id v12;
  id v13;
  void *v14;
  objc_super v15;

  v8 = *(_QWORD *)&a4;
  v11 = a3;
  v12 = a5;
  v13 = a6;
  if (!self->_isUpdating && -[PXGItemsLayout isLazy](self, "isLazy"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGGridLayout.m"), 1313, CFSTR("Invalid to modify sprites directly when lazy, use setNumberOfItems:withChangeDetails: instead."));

  }
  v15.receiver = self;
  v15.super_class = (Class)PXGGridLayout;
  -[PXGLayout applySpriteChangeDetails:countAfterChanges:initialState:modifyState:](&v15, sel_applySpriteChangeDetails_countAfterChanges_initialState_modifyState_, v11, v8, v12, v13);

}

- (int64_t)itemClosestToItem:(int64_t)a3 inDirection:(unint64_t)a4
{
  if (-[PXGGridLayout scrollableAxis](self, "scrollableAxis") == 2)
    return PXGItemsGeometryItemClosestToItemHorizontalGridDefaultImplementation(a3, a4, -[PXGGridLayout numberOfRows](self, "numberOfRows"), -[PXGItemsLayout numberOfItems](self, "numberOfItems"));
  else
    return PXGItemsGeometryItemClosestToItemVerticalGridDefaultImplementation(a3, a4, -[PXGGridLayout numberOfColumns](self, "numberOfColumns"), -[PXGItemsLayout numberOfItems](self, "numberOfItems"));
}

- (id)itemsBetweenItem:(int64_t)a3 andItem:(int64_t)a4
{
  return PXGItemsGeometryItemsBetweenItemAndItemDefaultImplementation(a3, a4);
}

- (id)itemsInRect:(CGRect)a3 inLayout:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  double MinY;
  double MinX;
  double MaxY;
  CGFloat MaxX;
  double top;
  double left;
  double v20;
  double v21;
  double v22;
  double v23;
  double itemCaptionSpacing;
  double v25;
  int64_t v26;
  int64_t v27;
  int64_t v28;
  int64_t v29;
  id v30;
  id v31;
  int64_t v32;
  int64_t v33;
  int64_t v34;
  int64_t v35;
  PXGGridLayout *v36;
  int64_t v37;
  int64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int64_t v47;
  int64_t v48;
  int64_t v49;
  PXGGridLayout *v50;
  int64_t v51;
  BOOL v52;
  char v53;
  int64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v64;
  void *v66;
  id v67;
  void *v68;
  int64_t v69;
  int64_t v70;
  int64_t v71;
  int64_t v72;
  int64_t v73;
  int64_t v74;
  int64_t v75;
  int64_t v76;
  int64_t v77;
  int64_t v78;
  int64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  int64_t v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v77 = -[PXGItemsLayout numberOfItems](self, "numberOfItems");
  v84.origin.x = x;
  v84.origin.y = y;
  v84.size.width = width;
  v84.size.height = height;
  if (CGRectIsNull(v84)
    || (v85.origin.x = x, v85.origin.y = y, v85.size.width = width, v85.size.height = height, CGRectIsEmpty(v85))
    || !v77)
  {
    v30 = objc_alloc_init(MEMORY[0x1E0CB36B8]);
  }
  else
  {
    v67 = v9;
    -[PXGLayout convertRect:fromLayout:](self, "convertRect:fromLayout:", v9, x, y, width, height);
    -[PXGGridLayout _layoutRectInContent:](self, "_layoutRectInContent:");
    v10 = v86.origin.x;
    v11 = v86.origin.y;
    v12 = v86.size.width;
    v13 = v86.size.height;
    MinY = CGRectGetMinY(v86);
    v87.origin.x = v10;
    v87.origin.y = v11;
    v87.size.width = v12;
    v87.size.height = v13;
    MinX = CGRectGetMinX(v87);
    v88.origin.x = v10;
    v88.origin.y = v11;
    v88.size.width = v12;
    v88.size.height = v13;
    MaxY = CGRectGetMaxY(v88);
    v89.origin.x = v10;
    v89.origin.y = v11;
    v89.size.width = v12;
    v89.size.height = v13;
    MaxX = CGRectGetMaxX(v89);
    top = self->_finalInsets.top;
    left = self->_finalInsets.left;
    v21 = self->_finalInterItemSpacing.width;
    v20 = self->_finalInterItemSpacing.height;
    v22 = MinY - top + v20;
    v23 = self->_itemSize.width;
    itemCaptionSpacing = self->_itemCaptionSpacing;
    v25 = itemCaptionSpacing + v20 + self->_itemSize.height;
    v26 = vcvtmd_s64_f64((v22 + itemCaptionSpacing) / v25);
    v27 = vcvtmd_s64_f64((MaxY - top) / v25);
    v28 = vcvtmd_s64_f64((MinX - left + v21) / (v21 + v23));
    v29 = vcvtmd_s64_f64((MaxX - left) / (v21 + v23));
    v79 = -[PXGGridLayout visualItemShift](self, "visualItemShift");
    v30 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    -[PXGLayout spriteDataStore](self, "spriteDataStore");
    v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v31, "geometries");
    v66 = v31;
    v82 = objc_msgSend(v31, "count");
    v83 = v27;
    v78 = v29;
    v76 = v28;
    if (-[PXGGridLayout scrollableAxis](self, "scrollableAxis") == 1)
    {
      v32 = -[PXGGridLayout numberOfColumns](self, "numberOfColumns");
      if (v26 <= v27)
      {
        v33 = v26;
        v70 = v77 - 1;
        v72 = v32;
        v34 = v26;
        v80 = v76 + v32 * v26 - v79;
        v35 = v29 + v32 * v26 - v79;
        do
        {
          v36 = self;
          v74 = v35;
          if (v35 >= v70)
            v37 = v77 - 1;
          else
            v37 = v35;
          v38 = v34 * v32 - v79;
          if (v38 + v29 >= v70)
            v39 = v77 - 1;
          else
            v39 = v38 + v29;
          if ((v39 & 0x8000000000000000) == 0)
          {
            v40 = (v38 + v76) & ~((v38 + v76) >> 63);
            if (v40 < v77 && v40 <= v39)
            {
              v42 = 0;
              v43 = v80 & ~(v80 >> 63);
              v44 = v43 - v37;
              do
              {
                if (v42 && v44 + v42 && v34 != v33 && v34 != v27)
                  goto LABEL_28;
                v45 = -[PXGItemsLayout spriteIndexForItem:](v36, "spriteIndexForItem:", v43 + v42);
                if ((_DWORD)v45 == -1)
                  goto LABEL_28;
                v46 = v45;
                if (v45 >= v82)
                {
                  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                  v68 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v68, "handleFailureInMethod:object:file:lineNumber:description:", a2, v36, CFSTR("PXGGridLayout.m"), 1371, CFSTR("spriteIndex %i out of bounds 0..<%i"), v46, v82);

                }
                PXRectWithCenterAndSize();
                v92.origin.x = v10;
                v92.origin.y = v11;
                v92.size.width = v12;
                v92.size.height = v13;
                if (CGRectIntersectsRect(v90, v92))
LABEL_28:
                  objc_msgSend(v30, "addIndex:", v43 + v42);
                ++v42;
              }
              while (v43 + v42 - 1 < v39);
            }
          }
          v32 = v72;
          v80 += v72;
          v35 = v74 + v72;
          v52 = v34++ == v27;
          self = v36;
          v29 = v78;
        }
        while (!v52);
      }
    }
    else
    {
      v69 = v26;
      v47 = -[PXGGridLayout numberOfRows](self, "numberOfRows");
      if (v28 <= v29)
      {
        v48 = v28;
        v71 = v77 - 1;
        v73 = v47;
        v81 = v26 + v47 * v28 - v79;
        v49 = v27 + v47 * v28 - v79;
        do
        {
          v50 = self;
          v75 = v49;
          if (v49 >= v71)
            v51 = v77 - 1;
          else
            v51 = v49;
          v52 = v48 == v76 || v48 == v29;
          v53 = v52;
          v54 = v48 * v47 - v79;
          if (v54 + v27 >= v71)
            v55 = v77 - 1;
          else
            v55 = v54 + v27;
          if ((v55 & 0x8000000000000000) == 0)
          {
            v56 = (v54 + v69) & ~((v54 + v69) >> 63);
            if (v56 < v77 && v56 <= v55)
            {
              v58 = 0;
              v59 = v81 & ~(v81 >> 63);
              v60 = v59 - v51;
              do
              {
                if ((v53 & 1) == 0 && v58 && v60 + v58)
                  goto LABEL_61;
                v61 = -[PXGItemsLayout spriteIndexForItem:](v50, "spriteIndexForItem:", v59 + v58);
                if ((_DWORD)v61 == -1)
                  goto LABEL_61;
                v62 = v61;
                if (v61 >= v82)
                {
                  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                  v64 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v64, "handleFailureInMethod:object:file:lineNumber:description:", a2, v50, CFSTR("PXGGridLayout.m"), 1398, CFSTR("spriteIndex %i out of bounds 0..<%i"), v62, v82);

                }
                PXRectWithCenterAndSize();
                v93.origin.x = v10;
                v93.origin.y = v11;
                v93.size.width = v12;
                v93.size.height = v13;
                if (CGRectIntersectsRect(v91, v93))
LABEL_61:
                  objc_msgSend(v30, "addIndex:", v59 + v58);
                ++v58;
              }
              while (v59 + v58 - 1 < v55);
            }
          }
          v47 = v73;
          v81 += v73;
          v49 = v75 + v73;
          v29 = v78;
          v52 = v48++ == v78;
          self = v50;
          v27 = v83;
        }
        while (!v52);
      }
    }

    v9 = v67;
  }

  return v30;
}

- (NSString)diagnosticDescription
{
  void *v3;
  int64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  objc_super v11;
  UIEdgeInsets v12;

  v11.receiver = self;
  v11.super_class = (Class)PXGGridLayout;
  -[PXGLayout diagnosticDescription](&v11, sel_diagnosticDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PXGGridLayout style](self, "style");
  -[PXGGridLayout padding](self, "padding");
  NSStringFromUIEdgeInsets(v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGGridLayout interItemSpacing](self, "interItemSpacing");
  v7 = v6;
  -[PXGGridLayout interItemSpacing](self, "interItemSpacing");
  objc_msgSend(v3, "px_stringByAppendingDescriptionDetailsWithFormat:", CFSTR(", style=%li, padding=%@, interItemSpacing=%.2fx%.2f, visualItemShift=%li"), v4, v5, v7, v8, -[PXGGridLayout visualItemShift](self, "visualItemShift"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (void)axDidReceiveFocusMovementHint:(id)a3 forSpriteAtIndex:(unsigned int)a4
{
  id v6;
  void *v7;
  float32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  NSObject *v12;
  int8x16_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  int32x4_t v18;
  int32x4_t v19;
  int32x4_t v20;
  int32x4_t v21;
  _QWORD v22[4];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[16];
  float64x2_t v28;
  float64x2_t v29;
  float64x2_t v30;
  float64x2_t v31;
  float64x2_t v32;
  float64x2_t v33;
  float64x2_t v34;
  float64x2_t v35;

  v6 = a3;
  v7 = v6;
  v8 = 0uLL;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  if (v6)
  {
    objc_msgSend(v6, "interactionTransform");
    v9 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v34), v35);
    v10 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v32), v33);
    v11 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v30), v31);
    v8 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v28), v29);
  }
  else
  {
    v11 = 0uLL;
    v10 = 0uLL;
    v9 = 0uLL;
  }
  if (a4 != -1)
  {
    v18 = (int32x4_t)v11;
    v19 = (int32x4_t)v10;
    v20 = (int32x4_t)v9;
    v21 = (int32x4_t)v8;
    if (-[PXGLayout localNumberOfSprites](self, "localNumberOfSprites") <= a4)
    {
      PXAssertGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1A6789000, v12, OS_LOG_TYPE_FAULT, "Focus item sprite index is out of bounds", buf, 2u);
      }

    }
    if (-[PXGLayout localNumberOfSprites](self, "localNumberOfSprites") > a4)
    {
      v13 = (int8x16_t)vzip1q_s32(v19, v20);
      *(_QWORD *)&v14 = vzip1q_s32(v21, v18).u64[0];
      *(_QWORD *)&v15 = vtrn2q_s32(v21, v18).u64[0];
      *(_QWORD *)&v16 = vzip2q_s32(v21, v18).u64[0];
      *(_QWORD *)&v17 = vuzp2q_s32(vuzp2q_s32(v21, v18), v21).u64[0];
      *((_QWORD *)&v14 + 1) = vextq_s8(*(int8x16_t *)&v19, v13, 8uLL).i64[1];
      *((_QWORD *)&v15 + 1) = v13.i64[1];
      *((_QWORD *)&v16 + 1) = __PAIR64__(v20.u32[2], v19.u32[2]);
      *((_QWORD *)&v17 + 1) = vzip2q_s32(v19, v20).i64[1];
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __64__PXGGridLayout_axDidReceiveFocusMovementHint_forSpriteAtIndex___block_invoke;
      v22[3] = &__block_descriptor_96_e101_v40__0__PXGSpriteIndexRange_II_8_______ddd__16____f_________ffff__4f___ffffSCf____4___24____CCfqSC_32l;
      v23 = v14;
      v24 = v15;
      v25 = v16;
      v26 = v17;
      -[PXGLayout modifySpritesInRange:state:](self, "modifySpritesInRange:state:", a4 | 0x100000000, v22);
    }
  }

}

- (void)axDidUpdateFocusFromSpriteAtIndex:(unsigned int)a3 toSpriteAtIndex:(unsigned int)a4
{
  int64_t v5;

  if (a4 == -1)
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v5 = -[PXGItemsLayout itemForSpriteIndex:](self, "itemForSpriteIndex:", *(_QWORD *)&a4);
  -[PXGItemsLayout setItem:forStylableType:animated:](self, "setItem:forStylableType:animated:", v5, 1, 1);
}

- (BOOL)canHandleVisibleRectRejection
{
  return self->_canHandleVisibleRectRejection;
}

- (void)setCanHandleVisibleRectRejection:(BOOL)a3
{
  self->_canHandleVisibleRectRejection = a3;
}

- (int64_t)style
{
  return self->_style;
}

- (int64_t)contentMode
{
  return self->_contentMode;
}

- (int64_t)axis
{
  return self->_axis;
}

- (int64_t)numberOfColumns
{
  return self->_numberOfColumns;
}

- (int64_t)numberOfRows
{
  return self->_numberOfRows;
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

- (CGSize)interItemSpacing
{
  double width;
  double height;
  CGSize result;

  width = self->_interItemSpacing.width;
  height = self->_interItemSpacing.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)itemCaptionSpacing
{
  return self->_itemCaptionSpacing;
}

- (double)itemAspectRatio
{
  return self->_itemAspectRatio;
}

- (BOOL)enableBestCropRect
{
  return self->_enableBestCropRect;
}

- (BOOL)enableEffects
{
  return self->_enableEffects;
}

- (BOOL)enablePerItemCornerRadius
{
  return self->_enablePerItemCornerRadius;
}

- (BOOL)enablePerItemMargin
{
  return self->_enablePerItemMargin;
}

- (BOOL)enablePerItemInsets
{
  return self->_enablePerItemInsets;
}

- (double)aspectRatioLimit
{
  return self->_aspectRatioLimit;
}

- (unsigned)mediaKind
{
  return self->_mediaKind;
}

- (unsigned)spriteInfoFlags
{
  return self->_spriteInfoFlags;
}

- (unsigned)presentationType
{
  return self->_presentationType;
}

- (unsigned)accessoryMediaKind
{
  return self->_accessoryMediaKind;
}

- (unsigned)accessoryPresentationType
{
  return self->_accessoryPresentationType;
}

- (double)accessoryAlpha
{
  return self->_accessoryAlpha;
}

- (BOOL)fillSafeAreaTopInset
{
  return self->_fillSafeAreaTopInset;
}

- (BOOL)supportsAutomaticContentRotation
{
  return self->_supportsAutomaticContentRotation;
}

- (void)setSupportsAutomaticContentRotation:(BOOL)a3
{
  self->_supportsAutomaticContentRotation = a3;
}

- (int64_t)visualItemShift
{
  return self->_visualItemShift;
}

- (BOOL)hideIncompleteLastRowOrColumn
{
  return self->_hideIncompleteLastRowOrColumn;
}

- (BOOL)mediaTargetSizeIgnoresSpacing
{
  return self->_mediaTargetSizeIgnoresSpacing;
}

- (void)setMediaTargetSizeIgnoresSpacing:(BOOL)a3
{
  self->_mediaTargetSizeIgnoresSpacing = a3;
}

- ($6FCFBD36564ECBB6D9D1614A84D6F83D)itemCornerRadius
{
  $6FCFBD36564ECBB6D9D1614A84D6F83D result;

  *(_QWORD *)&result.var0.var1[2] = a2;
  *(_QWORD *)&result.var0.var0.var0 = self;
  return result;
}

- ($6FCFBD36564ECBB6D9D1614A84D6F83D)edgeCornerRadius
{
  $6FCFBD36564ECBB6D9D1614A84D6F83D result;

  *(_QWORD *)&result.var0.var1[2] = a2;
  *(_QWORD *)&result.var0.var0.var0 = self;
  return result;
}

- (float)itemZPosition
{
  return self->_itemZPosition;
}

- (id)anchorObjectReference
{
  return self->_anchorObjectReference;
}

- (CGPoint)anchorViewportCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_anchorViewportCenter.x;
  y = self->_anchorViewportCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)loadItemsOutsideAnchorViewport
{
  return self->_loadItemsOutsideAnchorViewport;
}

- (CGPoint)contentOrigin
{
  double x;
  double y;
  CGPoint result;

  x = self->_contentOrigin.x;
  y = self->_contentOrigin.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_anchorObjectReference, 0);
}

__n128 __64__PXGGridLayout_axDidReceiveFocusMovementHint_forSpriteAtIndex___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __n128 result;
  __int128 v5;
  __int128 v6;

  result = *(__n128 *)(a1 + 32);
  v5 = *(_OWORD *)(a1 + 48);
  v6 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(a4 + 128) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(a4 + 144) = v6;
  *(__n128 *)(a4 + 96) = result;
  *(_OWORD *)(a4 + 112) = v5;
  return result;
}

void __28__PXGGridLayout_itemsToLoad__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  id v15;
  CGRect v16;
  CGRect v17;

  objc_msgSend(a2, "objectReference");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "type") != 1
      || (objc_msgSend(*(id *)(a1 + 32), "visibleRect"),
          v17.origin.x = a5,
          v17.origin.y = a6,
          v17.size.width = a7,
          v17.size.height = a8,
          CGRectIntersectsRect(v16, v17)))
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "itemForObjectReference:options:", v15, a3);
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) != 0x7FFFFFFFFFFFFFFFLL)
        *a4 = 1;
    }
  }

}

uint64_t __36__PXGGridLayout__updateSpriteStyles__block_invoke(uint64_t result, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  unint64_t v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  float32x4_t v10;
  float64_t v11;
  float64x2_t v12;
  float64_t v13;
  float64x2_t v14;
  int v15;
  int v16;
  int v17;
  int v18;
  float v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  float32x4_t v40;
  float32x4_t v41;
  _QWORD v42[4];
  _QWORD v43[5];

  v5 = result;
  v43[4] = *MEMORY[0x1E0C80C00];
  v6 = HIDWORD(a2);
  if (HIDWORD(a2))
  {
    v7 = a2;
    v39 = *((_OWORD *)off_1E50B83A0 + 6);
    v40 = *(float32x4_t *)off_1E50B8218;
    v37 = *((_OWORD *)off_1E50B83A0 + 8);
    v38 = *((_OWORD *)off_1E50B83A0 + 7);
    v35 = *((_OWORD *)off_1E50B83A0 + 2);
    v36 = *((_OWORD *)off_1E50B83A0 + 9);
    v33 = *((_OWORD *)off_1E50B83A0 + 4);
    v34 = *((_OWORD *)off_1E50B83A0 + 3);
    v31 = *(_OWORD *)off_1E50B83A0;
    v32 = *((_OWORD *)off_1E50B83A0 + 5);
    v30 = *((_OWORD *)off_1E50B83A0 + 1);
    v8 = a4;
    do
    {
      v9 = *(_QWORD *)(v5 + 72) + v7;
      v10 = v40;
      if (*(_BYTE *)(v5 + 156))
      {
        objc_msgSend(*(id *)(v5 + 32), "itemsLayout:bestCropRectForItem:withAspectRatio:", *(_QWORD *)(v5 + 40), *(_QWORD *)(v5 + 72) + v7, *(double *)(v5 + 80));
        v12.f64[1] = v11;
        v14.f64[1] = v13;
        v10 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v14), v12);
      }
      if (*(_BYTE *)(v5 + 157))
      {
        v41 = v10;
        objc_msgSend(*(id *)(v5 + 48), "itemsLayout:cornerRadiusForItem:", *(_QWORD *)(v5 + 40), v9);
        v10 = v41;
      }
      else
      {
        v15 = *(_DWORD *)(v5 + 120);
        v16 = *(_DWORD *)(v5 + 124);
        v17 = *(_DWORD *)(v5 + 128);
        v18 = *(_DWORD *)(v5 + 132);
      }
      *(_OWORD *)(v8 + 96) = v39;
      *(_OWORD *)(v8 + 112) = v38;
      *(_OWORD *)(v8 + 128) = v37;
      *(_OWORD *)(v8 + 144) = v36;
      *(_OWORD *)(v8 + 32) = v35;
      *(_OWORD *)(v8 + 48) = v34;
      *(_OWORD *)(v8 + 64) = v33;
      *(_OWORD *)(v8 + 80) = v32;
      *(_OWORD *)v8 = v31;
      *(_OWORD *)(v8 + 16) = v30;
      *(float32x4_t *)(v8 + 4) = v10;
      *(_DWORD *)(v8 + 36) = v15;
      *(_DWORD *)(v8 + 40) = v16;
      *(_DWORD *)(v8 + 44) = v17;
      *(_DWORD *)(v8 + 48) = v18;
      v19 = *(double *)(v5 + 88);
      *(float *)v8 = v19;
      result = objc_msgSend(*(id *)(v5 + 56), "itemsLayout:rotationAngleForItem:", *(_QWORD *)(v5 + 40), v9, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39);
      *(float *)&v20 = v20;
      *(_DWORD *)(v8 + 56) = LODWORD(v20);
      if (*(_BYTE *)(v5 + 158))
      {
        if (!*(_BYTE *)(v5 + 159))
        {
          result = objc_msgSend(*(id *)(v5 + 64), "itemsLayout:aspectRatioForItem:", *(_QWORD *)(v5 + 40), v9);
          v22 = *(double *)(v5 + 80);
          if ((v22 <= 0.99 || v22 >= 1.01)
            && (v21 <= 0.99 || v21 >= 1.01)
            && (v21 < 1.0 && v22 > 1.0 || v21 > 1.0 && v22 < 1.0))
          {
            *(_BYTE *)(v8 + 70) = 1;
          }
        }
      }
      ++v7;
      v8 += 160;
      LODWORD(v6) = v6 - 1;
    }
    while ((_DWORD)v6);
  }
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vceqq_f32(*(float32x4_t *)(v5 + 136), *(float32x4_t *)off_1E50B8248)), 0xFuLL))) & 1) == 0&& *(uint64_t *)(v5 + 96) >= 1)
  {
    v23 = objc_msgSend(*(id *)(v5 + 40), "numberOfVisualRows") - 1;
    v24 = objc_msgSend(*(id *)(v5 + 40), "numberOfVisualColumns") - 1;
    v25 = objc_msgSend(*(id *)(v5 + 40), "numberOfColumns");
    result = objc_msgSend(*(id *)(v5 + 40), "numberOfRows");
    v26 = 0;
    v43[0] = 0;
    v43[1] = result * v24;
    v43[2] = result - 1;
    v43[3] = result * v24 + result - 1;
    v42[0] = 0;
    v42[1] = v25 - 1;
    v42[2] = v25 * v23;
    v42[3] = v25 * v23 + v25 - 1;
    v27 = v42;
    if (*(_QWORD *)(v5 + 104) == 2)
      v27 = v43;
    do
    {
      v28 = v27[v26];
      v29 = *(_QWORD *)(v5 + 112);
      if (v28 - v29 >= 0 && v28 - v29 < (unint64_t)*(unsigned int *)(v5 + 152))
        *(_DWORD *)(a4 + 36 + 160 * v28 - 160 * v29 + 4 * v26) = *(_DWORD *)(v5 + 136 + 4 * v26);
      ++v26;
    }
    while (v26 != 4);
  }
  return result;
}

void __36__PXGGridLayout__updateSpriteStyles__block_invoke_2(uint64_t a1, id a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v3 = objc_msgSend(objc_retainAutorelease(a2), "mutableEffectIds");
  objc_msgSend(*(id *)(a1 + 32), "spriteDataStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "spritesInRange:", (unint64_t)*(unsigned int *)(a1 + 56) << 32);
    v6 = *((_QWORD *)&v9 + 1);
  }
  else
  {
    v6 = 0;
    v11 = 0;
    v9 = 0u;
    v10 = 0u;
  }

  if (*(_DWORD *)(a1 + 56))
  {
    v7 = 0;
    do
    {
      v8 = *(unsigned int *)(v6 + 4 * v7);
      *(_DWORD *)(v3 + 4 * v8) = objc_msgSend(*(id *)(a1 + 40), "itemsLayout:effectIdForItem:", *(_QWORD *)(a1 + 32), v7 + *(_QWORD *)(a1 + 48), v9, v10, v11);
      ++v7;
    }
    while (v7 < *(unsigned int *)(a1 + 56));
  }
}

float __36__PXGGridLayout__updateSpriteStyles__block_invoke_3(uint64_t a1, unint64_t a2, uint64_t a3, float *a4)
{
  unint64_t v6;
  double v7;
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
  double v18;
  float v19;

  v6 = HIDWORD(a2);
  objc_msgSend(*(id *)(a1 + 32), "accessoryAlpha");
  if ((_DWORD)v6)
  {
    v9 = *((_OWORD *)off_1E50B83A0 + 4);
    v8 = *((_OWORD *)off_1E50B83A0 + 5);
    v11 = *((_OWORD *)off_1E50B83A0 + 2);
    v10 = *((_OWORD *)off_1E50B83A0 + 3);
    v13 = *((_OWORD *)off_1E50B83A0 + 8);
    v12 = *((_OWORD *)off_1E50B83A0 + 9);
    v15 = *((_OWORD *)off_1E50B83A0 + 6);
    v14 = *((_OWORD *)off_1E50B83A0 + 7);
    v16 = *(_OWORD *)off_1E50B83A0;
    v17 = *((_OWORD *)off_1E50B83A0 + 1);
    do
    {
      *((_OWORD *)a4 + 4) = v9;
      *((_OWORD *)a4 + 5) = v8;
      *((_OWORD *)a4 + 2) = v11;
      *((_OWORD *)a4 + 3) = v10;
      *((_OWORD *)a4 + 8) = v13;
      *((_OWORD *)a4 + 9) = v12;
      *((_OWORD *)a4 + 6) = v15;
      *((_OWORD *)a4 + 7) = v14;
      *(_OWORD *)a4 = v16;
      *((_OWORD *)a4 + 1) = v17;
      v18 = *(double *)(a1 + 40);
      if (v18 >= v7)
        v18 = v7;
      v19 = v18;
      *a4 = v19;
      a4 += 40;
      LODWORD(v6) = v6 - 1;
    }
    while ((_DWORD)v6);
  }
  return *(float *)&v7;
}

uint64_t __31__PXGGridLayout__updateSprites__block_invoke(uint64_t a1, uint64_t a2)
{
  return a2 / *(unsigned int *)(a1 + 32);
}

uint64_t __31__PXGGridLayout__updateSprites__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return a2 % *(unsigned int *)(a1 + 32);
}

uint64_t __31__PXGGridLayout__updateSprites__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return a2 / *(unsigned int *)(a1 + 32);
}

uint64_t __31__PXGGridLayout__updateSprites__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return a2 % *(unsigned int *)(a1 + 32);
}

void __31__PXGGridLayout__updateSprites__block_invoke_5(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unsigned int v6;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  id v16;
  id v17;
  id v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  _BOOL4 v37;
  uint64_t v38;
  BOOL v39;
  uint64_t v40;
  uint64_t v41;
  float v42;
  float v43;
  float64x2_t v44;
  uint64_t v45;
  float v46;
  double v47;
  double v48;
  char v50;
  char v51;
  char v52;
  double v53;
  double v54;
  void *v55;

  v6 = a2;
  v8 = HIDWORD(a2);
  v52 = objc_msgSend(*(id *)(a1 + 32), "presentationType");
  v51 = objc_msgSend(*(id *)(a1 + 32), "mediaKind");
  v50 = objc_msgSend(*(id *)(a1 + 32), "spriteInfoFlags");
  if ((_DWORD)v8)
  {
    v9 = a5;
    do
    {
      v10 = *(_QWORD *)(a1 + 80) + v6;
      if (v10 < *(_QWORD *)(a1 + 96))
        v11 = v10 + *(_QWORD *)(a1 + 88);
      else
        v11 = v10 + *(_QWORD *)(a1 + 88) + 1;
      v13 = *(void **)(a1 + 32);
      v12 = *(void **)(a1 + 40);
      v15 = *(double *)(a1 + 104);
      v14 = *(double *)(a1 + 112);
      v16 = *(id *)(a1 + 48);
      v17 = v12;
      v18 = v13;
      objc_msgSend(v17, "itemsLayout:marginForItem:", v18, v10);
      objc_msgSend(v16, "itemsLayout:insetForItem:", v18, v10);

      PXSizeAdd();
      v21 = v15 - v20;
      if (v21 < 0.0)
        v21 = 0.0;
      v54 = v21;
      v22 = v14 - v19;
      if (v14 - v19 < 0.0)
        v22 = 0.0;
      v53 = v22;

      if (*(_BYTE *)(a1 + 268))
      {
        objc_msgSend(*(id *)(a1 + 56), "itemsLayout:aspectRatioForItem:", *(_QWORD *)(a1 + 32), v10);
        v24 = v23;
        v25 = PXClamp();
        v26 = MEMORY[0x1A85CD660](v25);
        v53 = v27;
        v54 = v26;
        MEMORY[0x1A85CD660](v24, *(double *)(a1 + 128), *(double *)(a1 + 136));
        PXSizeScale();
        v29 = v28;
        v31 = v30;
      }
      else
      {
        v32 = *(double *)(a1 + 152);
        v29 = *(double *)(a1 + 160);
        if (*(_BYTE *)(a1 + 269)
          && ((objc_msgSend(*(id *)(a1 + 56), "itemsLayout:aspectRatioForItem:", *(_QWORD *)(a1 + 32), v10),
               v34 = *(double *)(a1 + 168),
               v34 <= 0.99)
           || v34 >= 1.01)
          && (v33 <= 0.99 || v33 >= 1.01)
          && (v33 < 1.0 && v34 > 1.0 || v33 > 1.0 && v34 < 1.0))
        {
          v31 = v32;
        }
        else
        {
          v31 = v29;
          v29 = v32;
        }
      }
      v35 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
      v36 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
      v37 = v11 < 0;
      v38 = *(_QWORD *)(a1 + 176);
      if (v36 > v38)
        v37 = 1;
      if (v36 < v38)
        v38 = v36;
      v39 = !v37;
      v40 = v38 & ~(v38 >> 63);
      v41 = -2;
      if (v39)
        v41 = v35;
      if (v39)
        v40 = v36;
      v42 = 0.0;
      v43 = 0.0;
      if (v40 == *(_QWORD *)(a1 + 184))
      {
        v43 = *(float *)(a1 + 256);
        if (v10 < *(_QWORD *)(a1 + 192))
          v43 = -v43;
      }
      v44.f64[0] = v54;
      if (v41 == *(_QWORD *)(a1 + 200))
      {
        v42 = *(float *)(a1 + 256);
        if (v10 < *(_QWORD *)(a1 + 192))
          v42 = -v42;
      }
      v44.f64[1] = v53;
      *(float *)&v45 = v29;
      v46 = v31;
      *((float *)&v45 + 1) = v46;
      v47 = *(double *)(a1 + 216) + (double)v40 * *(double *)(a1 + 232) + *(double *)(a1 + 248) + v42;
      v48 = *(float *)(a1 + 260);
      *(double *)a3 = *(double *)(a1 + 208) + (double)v41 * *(double *)(a1 + 224) + *(double *)(a1 + 240) + v43;
      *(double *)(a3 + 8) = v47;
      *(double *)(a3 + 16) = v48;
      *(float32x2_t *)(a3 + 24) = vcvt_f32_f64(v44);
      *(_BYTE *)v9 = v52;
      *(_BYTE *)(v9 + 1) = v51;
      *(_BYTE *)(v9 + 34) = v50;
      *(_QWORD *)(v9 + 8) = v45;
      ++v6;
      a3 += 32;
      v9 += 40;
      LODWORD(v8) = v8 - 1;
    }
    while ((_DWORD)v8);
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "delegateRespondsTo:", 32) & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "itemsLayout:updateTagsInSpriteInfos:forItemsInRange:", *(_QWORD *)(a1 + 32), a5, *(_QWORD *)(a1 + 80), *(unsigned int *)(a1 + 264));

  }
}

double __31__PXGGridLayout__updateSprites__block_invoke_6(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, float32x2_t *a5)
{
  int v7;
  unint64_t v9;
  __int8 v10;
  __int8 v11;
  double result;
  __int8 v13;
  uint64_t v14;
  uint64_t v15;
  float v16;
  float32x2_t v17;
  float32x2_t v18;
  double v19;
  double v20;

  v7 = a2;
  v9 = HIDWORD(a2);
  v10 = objc_msgSend(*(id *)(a1 + 32), "accessoryPresentationType");
  v11 = objc_msgSend(*(id *)(a1 + 32), "accessoryMediaKind");
  if ((_DWORD)v9)
  {
    v13 = v11;
    do
    {
      v14 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      v15 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      v16 = 0.0;
      if (v15 == *(_QWORD *)(a1 + 104))
        v16 = *(float *)(a1 + 164);
      v17 = vcvt_f32_f64(*(float64x2_t *)(a1 + 72));
      v18 = vcvt_f32_f64(*(float64x2_t *)(a1 + 88));
      result = *(double *)(a1 + 112) + (double)v14 * *(double *)(a1 + 128) + *(double *)(a1 + 144) + v16;
      v19 = *(double *)(a1 + 120) + (double)v15 * *(double *)(a1 + 136) + *(double *)(a1 + 152);
      v20 = *(float *)(a1 + 168);
      *(double *)a3 = result;
      *(double *)(a3 + 8) = v19;
      *(double *)(a3 + 16) = v20;
      *(float32x2_t *)(a3 + 24) = v17;
      a5->i8[0] = v10;
      a5->i8[1] = v13;
      a5[1] = v18;
      ++v7;
      a3 += 32;
      a5 += 5;
      LODWORD(v9) = v9 - 1;
    }
    while ((_DWORD)v9);
  }
  return result;
}

@end
