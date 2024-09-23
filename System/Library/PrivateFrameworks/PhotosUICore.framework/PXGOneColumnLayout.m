@implementation PXGOneColumnLayout

- (PXGOneColumnLayout)init
{
  char *v2;
  PXGOneColumnLayout *v3;
  __int128 v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PXGOneColumnLayout;
  v2 = -[PXGItemsLayout init](&v11, sel_init);
  v3 = (PXGOneColumnLayout *)v2;
  if (v2)
  {
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)(v2 + 1144) = _Q0;
    *((_QWORD *)v2 + 138) = 0x3FF0000000000000;
    *((_QWORD *)v2 + 139) = 0x3FF0000000000000;
    *((_QWORD *)v2 + 140) = 0x4010000000000000;
    *((_QWORD *)v2 + 142) = 0x7FFFFFFFFFFFFFFFLL;
    v9 = *(_OWORD *)off_1E50B8580;
    *(_OWORD *)(v2 + 1176) = *(_OWORD *)off_1E50B8580;
    *(_OWORD *)(v2 + 1160) = v9;
    objc_msgSend(v2, "setLazy:", 1);
  }
  return v3;
}

- (BOOL)allowsDanglingUpdatesAssertions
{
  return 0;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSRange v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10.location = -[PXGItemsLayout loadedItems](self, "loadedItems");
  NSStringFromRange(v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGLayout alpha](self, "alpha");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p: loadedItems = %@; alpha = %.2f>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
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
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  isUpdating = self->_isUpdating;
  self->_isUpdating = 1;
  -[PXGLayout rootLayout](self, "rootLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[PXGOneColumnLayout invalidateLoadedItems](self, "invalidateLoadedItems");
  -[PXGItemsLayout updateLoadedItemsIfNeeded](self, "updateLoadedItemsIfNeeded");
  self->_didAlreadyUpdateLoadedItems = 1;
  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.willPerformUpdate = 0;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGOneColumnLayout update]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("PXGOneColumnLayout.m"), 91, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

      needsUpdate = p_updateFlags->needsUpdate;
    }
    self->_updateFlags.isPerformingUpdate = 1;
    self->_updateFlags.updated = 2;
    if ((needsUpdate & 2) != 0)
    {
      p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFDLL;
      -[PXGOneColumnLayout _updateSprites](self, "_updateSprites");
      if (!self->_updateFlags.isPerformingUpdate)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGOneColumnLayout update]");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("PXGOneColumnLayout.m"), 97, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

      }
    }
    v8 = p_updateFlags->needsUpdate;
    self->_updateFlags.updated |= 4uLL;
    if ((v8 & 4) != 0)
    {
      p_updateFlags->needsUpdate = v8 & 0xFFFFFFFFFFFFFFFBLL;
      -[PXGOneColumnLayout _updateVisibleRect](self, "_updateVisibleRect");
    }
    if (!self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGOneColumnLayout update]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("PXGOneColumnLayout.m"), 101, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v9 = p_updateFlags->needsUpdate;
    self->_updateFlags.updated |= 8uLL;
    if ((v9 & 8) != 0)
    {
      p_updateFlags->needsUpdate = v9 & 0xFFFFFFFFFFFFFFF7;
      -[PXGOneColumnLayout _updateSpriteStyles](self, "_updateSpriteStyles");
      v9 = p_updateFlags->needsUpdate;
    }
    self->_updateFlags.isPerformingUpdate = 0;
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGOneColumnLayout update]");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("PXGOneColumnLayout.m"), 104, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

    }
  }
  self->_didAlreadyUpdateLoadedItems = 0;
  v18.receiver = self;
  v18.super_class = (Class)PXGOneColumnLayout;
  -[PXGItemsLayout update](&v18, sel_update);
  self->_isUpdating = isUpdating;
}

- (void)_updateSprites
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  double v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unsigned __int8 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  unsigned __int8 v35;
  id v36;
  void *v37;
  uint64_t v38;
  id v39;
  void *v40;
  int64_t v41;
  double v42;
  double v43;
  double v44;
  uint64_t v45;
  unint64_t v47;
  uint64_t v48;
  double v49;
  float v50;
  double v51;
  id v52;
  id v53;
  id v54;
  double *v55;
  double v56;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  unsigned __int8 v65;
  double v66;
  uint64_t v67;
  double v68;
  _QWORD v69[4];
  id v70;
  PXGOneColumnLayout *v71;
  id v72;
  id v73;
  uint64_t *v74;
  uint64_t v75;
  double v76;
  uint64_t v77;
  double v78;
  uint64_t v79;
  uint64_t v80;
  double v81;
  uint64_t v82;
  double v83;
  float v84;
  unsigned __int8 v85;
  unsigned __int8 v86;
  uint64_t v87;
  double *v88;
  uint64_t v89;
  uint64_t v90;

  v3 = -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites");
  -[PXGItemsLayout delegate](self, "delegate");
  v4 = objc_claimAutoreleasedReturnValue();
  if (-[PXGItemsLayout delegateRespondsTo:](self, "delegateRespondsTo:", 4))
    v5 = (void *)v4;
  else
    v5 = 0;
  v6 = v5;
  v63 = (void *)v4;
  if (-[PXGItemsLayout delegateRespondsTo:](self, "delegateRespondsTo:", 256))
    v7 = (void *)v4;
  else
    v7 = 0;
  v8 = v7;
  -[PXGItemsLayout insetDelegate](self, "insetDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGLayout displayScale](self, "displayScale");
  v11 = v10;
  -[PXGOneColumnLayout padding](self, "padding");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[PXGOneColumnLayout aspectRatioLimit](self, "aspectRatioLimit");
  v18 = 1.0;
  v20 = 1.0 / v19;
  -[PXGOneColumnLayout aspectRatioLimit](self, "aspectRatioLimit");
  v67 = v21;
  -[PXGOneColumnLayout interItemSpacing](self, "interItemSpacing");
  v66 = v22;
  -[PXGLayout referenceSize](self, "referenceSize");
  v68 = v23;
  v24 = -[PXGItemsLayout loadedItems](self, "loadedItems");
  v64 = v25;
  v26 = -[PXGItemsLayout numberOfItems](self, "numberOfItems");
  v27 = -[PXGOneColumnLayout presentationType](self, "presentationType");
  v65 = -[PXGOneColumnLayout mediaKind](self, "mediaKind");
  -[PXGOneColumnLayout overrideAspectRatio](self, "overrideAspectRatio");
  v29 = v28;
  -[PXGOneColumnLayout overrideAspectRatioAmount](self, "overrideAspectRatioAmount");
  v31 = v30;
  -[PXGOneColumnLayout anchorObjectReference](self, "anchorObjectReference");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[PXGOneColumnLayout anchorObjectReference](self, "anchorObjectReference");
    v62 = v24;
    v34 = v26;
    v35 = v27;
    v36 = v8;
    v37 = v9;
    v38 = v3;
    v39 = v6;
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = -[PXGItemsLayout itemForObjectReference:](self, "itemForObjectReference:", v40);

    v6 = v39;
    v3 = v38;
    v9 = v37;
    v8 = v36;
    v27 = v35;
    v26 = v34;
    v24 = v62;

    if (v41 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v6, "itemsLayout:aspectRatioForItem:", self, v41);
      PXClamp();
      v18 = v42;
    }
  }
  v87 = 0;
  v88 = (double *)&v87;
  v89 = 0x2020000000;
  v90 = v13;
  if (-[PXGOneColumnLayout fillSafeAreaTopInset](self, "fillSafeAreaTopInset"))
  {
    -[PXGLayout safeAreaInsets](self, "safeAreaInsets");
    v88[3] = v88[3] - v43;
  }
  v44 = v68 - v15 - v17;
  v45 = 1000;
  if (v24 < 1000)
    v45 = v24;
  if (v24 == 0x7FFFFFFFFFFFFFFFLL || v64 == 0)
    v47 = 0x8000000000000000;
  else
    v47 = -(v24 + v64);
  v48 = (v47 + v26) & ~((uint64_t)(v47 + v26) >> 63);
  v49 = (double)v45;
  if (v26 < 1)
    v49 = 0.0;
  v50 = v15 + v44 * 0.5;
  v88[3] = v88[3] + v49 * v44;
  v69[0] = MEMORY[0x1E0C809B0];
  v69[1] = 3221225472;
  v69[2] = __36__PXGOneColumnLayout__updateSprites__block_invoke;
  v69[3] = &unk_1E5121BD8;
  if (v26 >= 1)
    v51 = (double)v48;
  else
    v51 = 0.0;
  v75 = v24;
  v76 = v20;
  v52 = v6;
  v70 = v52;
  v71 = self;
  v77 = v67;
  v78 = v18;
  v79 = v29;
  v80 = v31;
  v53 = v8;
  v72 = v53;
  v54 = v9;
  v81 = v44;
  v82 = v11;
  v84 = v50;
  v73 = v54;
  v74 = &v87;
  v85 = v27;
  v86 = v65;
  v83 = v66;
  -[PXGLayout modifySpritesInRange:state:](self, "modifySpritesInRange:state:", v3 << 32, v69);
  v55 = v88;
  v56 = v88[3];
  if ((_DWORD)v3)
  {
    v56 = v56 - v66;
    v88[3] = v56;
  }
  v55[3] = v56 + v51 * v44;
  PXFloatRoundToPixel();
  -[PXGLayout setLastBaseline:](self, "setLastBaseline:");
  PXSizeRoundToPixel();
  -[PXGLayout setContentSize:](self, "setContentSize:");
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_32:
      p_updateFlags->needsUpdate = needsUpdate | 8;
      goto LABEL_33;
    }
LABEL_31:
    if ((self->_updateFlags.updated & 8) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGOneColumnLayout _updateSprites]");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "handleFailureInFunction:file:lineNumber:description:", v61, CFSTR("PXGOneColumnLayout.m"), 206, CFSTR("invalidating %lu after it already has been updated"), 8);

      abort();
    }
    goto LABEL_32;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_31;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 8;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
LABEL_33:

  _Block_object_dispose(&v87, 8);
}

- (void)_updateVisibleRect
{
  int64_t v4;
  int64_t v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  uint64_t v16;
  double v17;
  double x;
  double y;
  double width;
  double height;
  void *v22;
  void *v23;
  double v24;
  CGRect v25;
  CGRect v26;

  v4 = -[PXGOneColumnLayout anchorItem](self, "anchorItem");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = v4;
    -[PXGOneColumnLayout anchorItemCenter](self, "anchorItemCenter");
    v7 = v6;
    -[PXGOneColumnLayout setAnchorItem:](self, "setAnchorItem:", 0x7FFFFFFFFFFFFFFFLL);
    -[PXGOneColumnLayout setAnchorItemCenter:](self, "setAnchorItemCenter:", *(double *)off_1E50B8580, *((double *)off_1E50B8580 + 1));
    -[PXGLayout visibleRect](self, "visibleRect");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v16 = -[PXGItemsLayout spriteIndexForItem:](self, "spriteIndexForItem:", v5);
    if ((_DWORD)v16 == -1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGOneColumnLayout.m"), 223, CFSTR("Must have a sprite representing the item at this point."));

    }
    -[PXGLayout geometryForSpriteAtIndex:](self, "geometryForSpriteAtIndex:", v16, 0);
    if (v24 == 0.0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v24);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGOneColumnLayout.m"), 227, CFSTR("Sprite must have valid geometry at this point."));

    }
    if (PXPointIsNull())
    {
      PXRectGetCenter();
      v7 = v17;
    }
    v25.origin.x = v9;
    v25.origin.y = v11;
    v25.size.width = v13;
    v25.size.height = v15;
    v26 = CGRectOffset(v25, 0.0, 0.0 - v7);
    x = v26.origin.x;
    y = v26.origin.y;
    width = v26.size.width;
    height = v26.size.height;
    if ((PXRectApproximatelyEqualToRect() & 1) == 0)
      -[PXGLayout changeVisibleRectToProposedVisibleRect:](self, "changeVisibleRectToProposedVisibleRect:", x, y, width, height);
  }
}

- (void)_updateSpriteStyles
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[5];
  id v23;
  uint64_t v24;
  int v25;
  _QWORD v26[4];
  id v27;
  PXGOneColumnLayout *v28;
  id v29;
  uint64_t v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  BOOL v34;

  v3 = -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites");
  -[PXGLayout alpha](self, "alpha");
  v5 = v4;
  -[PXGOneColumnLayout aspectRatioLimit](self, "aspectRatioLimit");
  v7 = v6;
  -[PXGOneColumnLayout aspectRatioLimit](self, "aspectRatioLimit");
  v9 = v8;
  v10 = -[PXGItemsLayout loadedItems](self, "loadedItems");
  if (-[PXGOneColumnLayout enableBestCropRect](self, "enableBestCropRect"))
    v11 = -[PXGItemsLayout delegateRespondsTo:](self, "delegateRespondsTo:", 8);
  else
    v11 = 0;
  -[PXGItemsLayout delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PXGOneColumnLayout enablePerItemCornerRadius](self, "enablePerItemCornerRadius"))
  {
    if (-[PXGItemsLayout delegateRespondsTo:](self, "delegateRespondsTo:", 1024))
      v13 = v12;
    else
      v13 = 0;
  }
  else
  {
    v13 = 0;
  }
  v14 = v13;
  v15 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __41__PXGOneColumnLayout__updateSpriteStyles__block_invoke;
  v26[3] = &unk_1E5121C00;
  v30 = v10;
  v34 = v11;
  v31 = 1.0 / v7;
  v32 = v9;
  v21 = v12;
  v27 = v21;
  v28 = self;
  v33 = v5;
  v16 = v14;
  v29 = v16;
  -[PXGLayout modifySpritesInRange:state:](self, "modifySpritesInRange:state:", v3 << 32, v26);
  if (-[PXGItemsLayout delegateRespondsTo:](self, "delegateRespondsTo:", 16))
    v17 = v21;
  else
    v17 = 0;
  v18 = v17;
  if (-[PXGOneColumnLayout enableEffects](self, "enableEffects") && v18)
  {
    -[PXGLayout entityManager](self, "entityManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "effectComponent");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v15;
    v22[1] = 3221225472;
    v22[2] = __41__PXGOneColumnLayout__updateSpriteStyles__block_invoke_2;
    v22[3] = &unk_1E513AD88;
    v25 = v3;
    v22[4] = self;
    v24 = v10;
    v23 = v18;
    objc_msgSend(v20, "performChanges:", v22);

  }
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

  v4 = -[PXGOneColumnLayout itemRangeInRect:](self, "itemRangeInRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
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

- (_NSRange)itemsToLoad
{
  int64_t v3;
  int64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  uint64_t *v9;
  int64_t v10;
  uint64_t v14;
  NSUInteger v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double x;
  double y;
  double width;
  double height;
  BOOL IsEmpty;
  char v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  int64_t v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double MidY;
  uint64_t v41;
  NSUInteger v42;
  uint64_t v43;
  double v44;
  double v45;
  double v46;
  double v47;
  _BOOL4 v48;
  NSUInteger v49;
  NSUInteger v50;
  CGRect rect;
  void *v52;
  PXGOneColumnLayout *v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  uint8_t buf[40];
  uint64_t v60;
  _NSRange result;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;

  v60 = *MEMORY[0x1E0C80C00];
  v3 = -[PXGItemsLayout numberOfItems](self, "numberOfItems");
  if (!v3)
  {
    v14 = 0x7FFFFFFFFFFFFFFFLL;
    -[PXGOneColumnLayout setAnchorItem:](self, "setAnchorItem:", 0x7FFFFFFFFFFFFFFFLL);
    v15 = 0;
    goto LABEL_52;
  }
  v4 = v3;
  -[PXGLayout rootLayout](self, "rootLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v55 = 0;
  v56 = &v55;
  v57 = 0x2020000000;
  v58 = 0x7FFFFFFFFFFFFFFFLL;
  v7 = -[PXGLayout anchoredContentEdges](self, "anchoredContentEdges");
  -[PXGOneColumnLayout anchorObjectReference](self, "anchorObjectReference");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v56;
  v10 = v56[3];
  if (v10 == 0x7FFFFFFFFFFFFFFFLL && v8 != 0)
  {
    v10 = -[PXGItemsLayout itemForObjectReference:](self, "itemForObjectReference:", v8);
    v9 = v56;
    v56[3] = v10;
  }
  if (v10 == 0x7FFFFFFFFFFFFFFFLL && v7 != 0 && v6 != 0)
  {
    if (objc_msgSend(v6, "type") == 5)
    {
      v9 = v56;
    }
    else if ((v7 & 1) != 0)
    {
      v9 = v56;
      v56[3] = 0;
    }
    else
    {
      v9 = v56;
      if ((v7 & 4) != 0)
        v56[3] = v4 - 1;
    }
  }
  if (v9[3] == 0x7FFFFFFFFFFFFFFFLL && v6)
  {
    *(_QWORD *)&rect.origin.y = MEMORY[0x1E0C809B0];
    *(_QWORD *)&rect.size.width = 3221225472;
    *(_QWORD *)&rect.size.height = __33__PXGOneColumnLayout_itemsToLoad__block_invoke;
    v52 = &unk_1E5121C28;
    v53 = self;
    v54 = &v55;
    objc_msgSend(v6, "enumerateAllSpriteReferencesUsingBlock:", &rect.origin.y);
  }
  v16 = -[PXGItemsLayout loadedItems](self, "loadedItems");
  v18 = v17;
  -[PXGLayout visibleRect](self, "visibleRect");
  x = v62.origin.x;
  y = v62.origin.y;
  width = v62.size.width;
  height = v62.size.height;
  IsEmpty = CGRectIsEmpty(v62);
  if (v18)
    v24 = IsEmpty;
  else
    v24 = 1;
  v25 = v56[3];
  if ((v24 & 1) != 0)
    goto LABEL_28;
  if (v25 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v28 = -[PXGOneColumnLayout itemRangeInRect:](self, "itemRangeInRect:", x, y, width, height);
    v30 = v28 == 0x7FFFFFFFFFFFFFFFLL || v29 == 0;
    v31 = v30 ? 0x7FFFFFFFFFFFFFFFLL : v28 + (v29 >> 1);
    v56[3] = v31;
    if (v31 == 0x7FFFFFFFFFFFFFFFLL)
    {
      PXRectGetCenter();
      v32 = -[PXGOneColumnLayout itemClosestTo:](self, "itemClosestTo:");
      -[PXGOneColumnLayout frameForItem:](self, "frameForItem:", v32);
      rect.origin.x = v33;
      v35 = v34;
      v37 = v36;
      v39 = v38;
      v64.origin.x = x;
      v64.origin.y = y;
      v64.size.width = width;
      v64.size.height = height;
      MidY = CGRectGetMidY(v64);
      v65.origin.x = rect.origin.x;
      v65.origin.y = v35;
      v65.size.width = v37;
      v65.size.height = v39;
      v41 = v32 + llround((MidY - CGRectGetMidY(v65)) / width);
      if (v4 - 1 < v41)
        v41 = v4 - 1;
      v25 = v41 & ~(v41 >> 63);
      v56[3] = v25;
LABEL_28:
      if (v25 == 0x7FFFFFFFFFFFFFFFLL)
      {
        PXGTungstenGetLog();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v63.origin.x = x;
          v63.origin.y = y;
          v63.size.width = width;
          v63.size.height = height;
          NSStringFromCGRect(v63);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v27;
          _os_log_impl(&dword_1A6789000, v26, OS_LOG_TYPE_DEFAULT, "No anchor specified for %@, defaulting to last item, visibleRect:%@.", buf, 0x16u);

        }
        v56[3] = v4 - 1;
      }
    }
  }
  v14 = -[PXGOneColumnLayout _itemsToLoadForAnchorItem:visibleRect:](self, "_itemsToLoadForAnchorItem:visibleRect:", x, y, width, height);
  v15 = v42;
  if (v16 != v14 || v18 != v42)
  {
    v43 = -[PXGItemsLayout spriteIndexForItem:](self, "spriteIndexForItem:", v56[3]);
    v46 = *(double *)off_1E50B8580;
    v47 = *((double *)off_1E50B8580 + 1);
    if ((_DWORD)v43 != -1)
    {
      memset(buf, 0, 32);
      -[PXGLayout geometryForSpriteAtIndex:](self, "geometryForSpriteAtIndex:", v43);
      v44 = *(double *)buf;
      v45 = *(double *)&buf[8];
      v48 = *(double *)buf != 0.0;
      if (*(double *)&buf[8] != 0.0)
        v48 = 1;
      if (v48)
      {
        v46 = *(double *)buf;
        v47 = *(double *)&buf[8];
      }
    }
    -[PXGOneColumnLayout setAnchorItem:](self, "setAnchorItem:", v56[3], v44, v45);
    -[PXGOneColumnLayout setAnchorItemCenter:](self, "setAnchorItemCenter:", v46, v47);
  }

  _Block_object_dispose(&v55, 8);
LABEL_52:
  v49 = v14;
  v50 = v15;
  result.length = v50;
  result.location = v49;
  return result;
}

- (_NSRange)_itemsToLoadForAnchorItem:(int64_t)a3 visibleRect:(CGRect)a4
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  int64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  int64_t v17;
  void *v18;
  double v19;
  double v20;
  int IsNull;
  double v22;
  double v23;
  uint64_t v24;
  int64_t v25;
  uint64_t v26;
  NSUInteger location;
  NSUInteger length;
  NSRange v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  PXGOneColumnLayout *v43;
  uint64_t v44;
  NSRange v45;
  _NSRange result;
  NSRange v47;
  CGSize v48;
  CGRect v49;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v44 = *MEMORY[0x1E0C80C00];
  v11 = -[PXGItemsLayout numberOfItems](self, "numberOfItems");
  if (v11 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGOneColumnLayout.m"), 395, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("numberOfItems > 0"));

  }
  v12 = height;
  if (height == 0.0)
  {
    -[PXGLayout referenceSize](self, "referenceSize");
    v12 = v13;
  }
  v14 = width;
  if (width == 0.0)
  {
    -[PXGLayout referenceSize](self, "referenceSize");
    v14 = v15;
  }
  if (v12 != 0.0 && v14 != 0.0)
  {
    -[PXGOneColumnLayout aspectRatioLimit](self, "aspectRatioLimit");
    v17 = vcvtpd_s64_f64(v12 / (v14 / v16));
    +[PXGTextureManagerPreheatingStrategy defaultPreheatingStrategy](PXGTextureManagerPreheatingStrategy, "defaultPreheatingStrategy");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "maxPreheatingDistance");
    v20 = v19;

    -[PXGOneColumnLayout anchorViewportCenter](self, "anchorViewportCenter");
    IsNull = PXPointIsNull();
    v22 = ceil(v20 / v12);
    v23 = v22 + v22;
    if (IsNull)
      v24 = (uint64_t)v23;
    else
      v24 = 1;
    v25 = a3 / v17;
    if (a3 / v17 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSRange PXRangeWithMidLocationAndPadding(NSInteger, NSInteger)");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, CFSTR("NSRange+PhotosUIFoundation.h"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("midLocation != NSNotFound"));

      if ((v24 & 0x8000000000000000) == 0)
        goto LABEL_14;
    }
    else if ((v24 & 0x8000000000000000) == 0)
    {
LABEL_14:
      v26 = (v25 - v24) & ~((v25 - v24) >> 63);
      v45.location = v26 * v17;
      v45.length = v17 + v17 * (v24 + v25 - v26);
      v47.location = 0;
      v47.length = v11;
      v29 = NSIntersectionRange(v45, v47);
      length = v29.length;
      location = v29.location;
      goto LABEL_20;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSRange PXRangeWithMidLocationAndPadding(NSInteger, NSInteger)");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInFunction:file:lineNumber:description:", v37, CFSTR("NSRange+PhotosUIFoundation.h"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("padding >= 0"));

    goto LABEL_14;
  }
  PXGTungstenGetLog();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    v49.origin.x = x;
    v49.origin.y = y;
    v49.size.width = width;
    v49.size.height = height;
    NSStringFromCGRect(v49);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGLayout referenceSize](self, "referenceSize");
    NSStringFromCGSize(v48);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v39 = v31;
    v40 = 2112;
    v41 = v32;
    v42 = 2112;
    v43 = self;
    _os_log_impl(&dword_1A6789000, v30, OS_LOG_TYPE_DEFAULT, "Invalid visibleRect:%@ referenceSize:%@ in %@", buf, 0x20u);

  }
  location = a3;
  length = 1;
LABEL_20:
  result.length = length;
  result.location = location;
  return result;
}

- (CGRect)frameForItem:(int64_t)a3
{
  unsigned int v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  float32x2_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  CGRect result;

  v6 = -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites");
  -[PXGItemsLayout loadedItems](self, "loadedItems");
  if (v7 != v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGOneColumnLayout.m"), 429, CFSTR("Every loaded item should have a sprite at this point"));

  }
  v8 = *MEMORY[0x1E0C9D628];
  v9 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v10 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v11 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v12 = -[PXGItemsLayout spriteIndexForItem:](self, "spriteIndexForItem:", a3);
  if ((_DWORD)v12 == -1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGOneColumnLayout.m"), 437, CFSTR("Invalid to ask for the frame of an item without a sprite representing it"));

  }
  else
  {
    -[PXGLayout geometryForSpriteAtIndex:](self, "geometryForSpriteAtIndex:", v12);
    v13 = vmul_f32(0, (float32x2_t)0x3F0000003F000000);
    v8 = 0.0 - v13.f32[0];
    v9 = 0.0 - v13.f32[1];
    v10 = 0.0;
    v11 = 0.0;
  }
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v18 = v11;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (int64_t)itemClosestTo:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  id v23;
  uint64_t v24;
  int64_t v25;
  void *v27;
  void *v28;
  __int128 v29;
  _OWORD v30[2];
  _QWORD v31[4];
  id v32;
  _QWORD aBlock[9];
  _QWORD v34[4];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;

  y = a3.y;
  x = a3.x;
  v7 = -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites");
  -[PXGItemsLayout loadedItems](self, "loadedItems");
  if (v8 != v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGOneColumnLayout.m"), 442, CFSTR("Every loaded item should have a sprite at this point"));

  }
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0x7FFFFFFFFFFFFFFFLL;
  v9 = -[PXGItemsLayout numberOfItems](self, "numberOfItems");
  v10 = -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites");
  if (v9 >= 1)
  {
    v11 = v10;
    if (v10)
    {
      v34[0] = 0;
      v34[1] = v34;
      v34[2] = 0x2020000000;
      v34[3] = 0x7FEFFFFFFFFFFFFFLL;
      v12 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __36__PXGOneColumnLayout_itemClosestTo___block_invoke;
      aBlock[3] = &unk_1E5121C50;
      *(CGFloat *)&aBlock[7] = x;
      *(CGFloat *)&aBlock[8] = y;
      aBlock[5] = v34;
      aBlock[6] = &v35;
      aBlock[4] = self;
      v13 = _Block_copy(aBlock);
      PXRectWithCenterAndSize();
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v21 = v20;
      -[PXGLayout spriteDataStore](self, "spriteDataStore");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = v12;
      v31[1] = 3221225472;
      v31[2] = __36__PXGOneColumnLayout_itemClosestTo___block_invoke_2;
      v31[3] = &unk_1E5137138;
      v23 = v13;
      v32 = v23;
      objc_msgSend(v22, "enumerateSpritesInRect:usingBlock:", v31, v15, v17, v19, v21);

      if (v36[3] == 0x7FFFFFFFFFFFFFFFLL)
      {
        memset(v30, 0, sizeof(v30));
        -[PXGLayout geometryForSpriteAtIndex:](self, "geometryForSpriteAtIndex:", 0);
        (*((void (**)(id, _QWORD, _OWORD *))v23 + 2))(v23, 0, v30);
        v24 = v11 - 1;
        -[PXGLayout geometryForSpriteAtIndex:](self, "geometryForSpriteAtIndex:", v24, 0, 0, 0, 0);
        (*((void (**)(id, uint64_t, __int128 *))v23 + 2))(v23, v24, &v29);
        if (v36[3] == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGOneColumnLayout.m"), 477, CFSTR("Should always be able to find a closest item."));

        }
      }

      _Block_object_dispose(v34, 8);
    }
  }
  v25 = v36[3];
  _Block_object_dispose(&v35, 8);
  return v25;
}

- (_NSRange)itemRangeInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  unsigned int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;
  void *v19;
  void *v20;
  _NSRange result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites");
  -[PXGItemsLayout loadedItems](self, "loadedItems");
  if (v10 != v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGOneColumnLayout.m"), 483, CFSTR("Every loaded item should have a sprite at this point"));

  }
  if (-[PXGItemsLayout numberOfItems](self, "numberOfItems") < 1)
  {
    v16 = 0;
    v14 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    -[PXGLayout spriteDataStore](self, "spriteDataStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "spriteIndexesInRect:", x, y, width, height);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXGItemsLayout itemsForSpriteIndexes:](self, "itemsForSpriteIndexes:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "px_coveringRange");
    v16 = v15;
    if (v14 + v15 > -[PXGItemsLayout numberOfItems](self, "numberOfItems"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGOneColumnLayout.m"), 491, CFSTR("Should not return items out of bounds."));

    }
  }
  v17 = v14;
  v18 = v16;
  result.length = v18;
  result.location = v17;
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

- (void)setAnchorItem:(int64_t)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  if (self->_anchorItem != a3)
  {
    self->_anchorItem = a3;
    if (a3 != 0x7FFFFFFFFFFFFFFFLL)
    {
      p_updateFlags = &self->_updateFlags;
      needsUpdate = self->_updateFlags.needsUpdate;
      if (needsUpdate)
      {
        if (!self->_updateFlags.isPerformingUpdate)
        {
LABEL_8:
          p_updateFlags->needsUpdate = needsUpdate | 4;
          return;
        }
LABEL_7:
        if ((self->_updateFlags.updated & 4) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGOneColumnLayout setAnchorItem:]");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGOneColumnLayout.m"), 518, CFSTR("invalidating %lu after it already has been updated"), 4);

          abort();
        }
        goto LABEL_8;
      }
      if (self->_updateFlags.isPerformingUpdate)
        goto LABEL_7;
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      p_updateFlags->needsUpdate = 4;
      if (!willPerformUpdate)
        -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
    }
  }
}

- (void)setAnchorItemCenter:(CGPoint)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v8;
  void *v9;

  if (self->_anchorItemCenter.x != a3.x || self->_anchorItemCenter.y != a3.y)
  {
    self->_anchorItemCenter = a3;
    if ((PXPointIsNull() & 1) == 0)
    {
      p_updateFlags = &self->_updateFlags;
      needsUpdate = self->_updateFlags.needsUpdate;
      if (needsUpdate)
      {
        if (!self->_updateFlags.isPerformingUpdate)
        {
LABEL_11:
          p_updateFlags->needsUpdate = needsUpdate | 4;
          return;
        }
LABEL_10:
        if ((self->_updateFlags.updated & 4) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGOneColumnLayout setAnchorItemCenter:]");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("PXGOneColumnLayout.m"), 528, CFSTR("invalidating %lu after it already has been updated"), 4);

          abort();
        }
        goto LABEL_11;
      }
      if (self->_updateFlags.isPerformingUpdate)
        goto LABEL_10;
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      p_updateFlags->needsUpdate = 4;
      if (!willPerformUpdate)
        -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
    }
  }
}

- (void)setVisibleRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  objc_super v12;
  CGRect v13;
  CGRect v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PXGLayout visibleRect](self, "visibleRect");
  v14.origin.x = v8;
  v14.origin.y = v9;
  v14.size.width = v10;
  v14.size.height = v11;
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  CGRectEqualToRect(v13, v14);
  v12.receiver = self;
  v12.super_class = (Class)PXGOneColumnLayout;
  -[PXGLayout setVisibleRect:](&v12, sel_setVisibleRect_, x, y, width, height);
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
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGOneColumnLayout setEnableBestCropRect:]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGOneColumnLayout.m"), 545, CFSTR("invalidating %lu after it already has been updated"), 8);

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
        p_updateFlags->needsUpdate = needsUpdate | 2;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 2) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGOneColumnLayout setPadding:]");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("PXGOneColumnLayout.m"), 553, CFSTR("invalidating %lu after it already has been updated"), 2);

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

- (void)setInterItemSpacing:(CGSize)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v7;
  void *v8;

  if (a3.width != self->_interItemSpacing.width || a3.height != self->_interItemSpacing.height)
  {
    self->_interItemSpacing = a3;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_10:
        p_updateFlags->needsUpdate = needsUpdate | 2;
        return;
      }
LABEL_9:
      if ((self->_updateFlags.updated & 2) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGOneColumnLayout setInterItemSpacing:]");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("PXGOneColumnLayout.m"), 561, CFSTR("invalidating %lu after it already has been updated"), 2);

        abort();
      }
      goto LABEL_10;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_9;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 2;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)setOverrideAspectRatio:(double)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  if (self->_overrideAspectRatio != a3)
  {
    self->_overrideAspectRatio = a3;
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
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGOneColumnLayout setOverrideAspectRatio:]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGOneColumnLayout.m"), 569, CFSTR("invalidating %lu after it already has been updated"), 2);

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

- (void)setOverrideAspectRatioAmount:(double)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  if (self->_overrideAspectRatioAmount != a3)
  {
    self->_overrideAspectRatioAmount = a3;
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
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGOneColumnLayout setOverrideAspectRatioAmount:]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGOneColumnLayout.m"), 577, CFSTR("invalidating %lu after it already has been updated"), 2);

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
        p_updateFlags->needsUpdate = needsUpdate | 0xA;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 0xA) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGOneColumnLayout setAspectRatioLimit:]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGOneColumnLayout.m"), 586, CFSTR("invalidating %lu after it already has been updated"), 10);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 10;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)setAnchorObjectReference:(id)a3
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v5 = self->_anchorObjectReference;
  if (v5 == v14)
  {

LABEL_11:
    v8 = v14;
    goto LABEL_12;
  }
  v6 = v5;
  v7 = objc_msgSend(v5, "isEqual:", v14);

  v8 = v14;
  if ((v7 & 1) == 0)
  {
    objc_storeStrong(&self->_anchorObjectReference, a3);
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_9:
        p_updateFlags->needsUpdate = needsUpdate | 0xA;
LABEL_10:
        -[PXGOneColumnLayout invalidateLoadedItems](self, "invalidateLoadedItems");
        goto LABEL_11;
      }
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      p_updateFlags->needsUpdate = 10;
      if (!willPerformUpdate)
        -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
      goto LABEL_10;
    }
    if ((self->_updateFlags.updated & 0xA) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGOneColumnLayout setAnchorObjectReference:]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("PXGOneColumnLayout.m"), 596, CFSTR("invalidating %lu after it already has been updated"), 10);

      abort();
    }
    goto LABEL_9;
  }
LABEL_12:

}

- (void)setAnchorViewportCenter:(CGPoint)a3
{
  if (self->_anchorViewportCenter.x != a3.x || self->_anchorViewportCenter.y != a3.y)
  {
    self->_anchorViewportCenter = a3;
    -[PXGOneColumnLayout invalidateLoadedItems](self, "invalidateLoadedItems");
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
        p_updateFlags->needsUpdate = needsUpdate | 2;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 2) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGOneColumnLayout setMediaKind:]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGOneColumnLayout.m"), 613, CFSTR("invalidating %lu after it already has been updated"), 2);

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
        p_updateFlags->needsUpdate = needsUpdate | 2;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 2) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGOneColumnLayout setPresentationType:]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGOneColumnLayout.m"), 621, CFSTR("invalidating %lu after it already has been updated"), 2);

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
        p_updateFlags->needsUpdate = needsUpdate | 2;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 2) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGOneColumnLayout setFillSafeAreaTopInset:]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGOneColumnLayout.m"), 629, CFSTR("invalidating %lu after it already has been updated"), 2);

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
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGOneColumnLayout setEnableEffects:]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGOneColumnLayout.m"), 637, CFSTR("invalidating %lu after it already has been updated"), 8);

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
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGOneColumnLayout setEnablePerItemCornerRadius:]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGOneColumnLayout.m"), 645, CFSTR("invalidating %lu after it already has been updated"), 8);

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

- (void)referenceSizeDidChange
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXGOneColumnLayout;
  -[PXGLayout referenceSizeDidChange](&v8, sel_referenceSizeDidChange);
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGOneColumnLayout referenceSizeDidChange]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGOneColumnLayout.m"), 652, CFSTR("invalidating %lu after it already has been updated"), 2);

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

- (void)displayScaleDidChange
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXGOneColumnLayout;
  -[PXGLayout displayScaleDidChange](&v8, sel_displayScaleDidChange);
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGOneColumnLayout displayScaleDidChange]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGOneColumnLayout.m"), 657, CFSTR("invalidating %lu after it already has been updated"), 2);

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
  v11.super_class = (Class)PXGOneColumnLayout;
  -[PXGLayout entityManagerDidChange](&v11, sel_entityManagerDidChange);
  -[PXGLayout entityManager](self, "entityManager");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = -[PXGOneColumnLayout enableEffects](self, "enableEffects");

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
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGOneColumnLayout entityManagerDidChange]");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("PXGOneColumnLayout.m"), 663, CFSTR("invalidating %lu after it already has been updated"), 8);

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
  v8.super_class = (Class)PXGOneColumnLayout;
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGOneColumnLayout alphaDidChange]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGOneColumnLayout.m"), 669, CFSTR("invalidating %lu after it already has been updated"), 8);

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
  v3.super_class = (Class)PXGOneColumnLayout;
  -[PXGLayout visibleRectDidChange](&v3, sel_visibleRectDidChange);
  if (!self->_isUpdating)
    -[PXGOneColumnLayout invalidateLoadedItems](self, "invalidateLoadedItems");
}

- (BOOL)canHandleVisibleRectRejection
{
  return 1;
}

- (void)invalidateLoadedItems
{
  void *v4;
  objc_super v5;

  if (self->_didAlreadyUpdateLoadedItems)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGOneColumnLayout.m"), 687, CFSTR("Already updated loaded items during this update pass in %@"), self);

  }
  v5.receiver = self;
  v5.super_class = (Class)PXGOneColumnLayout;
  -[PXGItemsLayout invalidateLoadedItems](&v5, sel_invalidateLoadedItems);
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
  v8.super_class = (Class)PXGOneColumnLayout;
  -[PXGItemsLayout loadedItemsDidChange](&v8, sel_loadedItemsDidChange);
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 0xA;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0xA) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGOneColumnLayout loadedItemsDidChange]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGOneColumnLayout.m"), 693, CFSTR("invalidating %lu after it already has been updated"), 10);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 10;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
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
  v15.super_class = (Class)PXGOneColumnLayout;
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
        p_updateFlags->needsUpdate = needsUpdate | 0xA;
        goto LABEL_9;
      }
LABEL_7:
      if ((self->_updateFlags.updated & 0xA) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGOneColumnLayout setNumberOfItems:withChangeDetails:changeMediaVersionHandler:]");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("PXGOneColumnLayout.m"), 700, CFSTR("invalidating %lu after it already has been updated"), 10);

        abort();
      }
      goto LABEL_8;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_7;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 10;
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
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGOneColumnLayout.m"), 706, CFSTR("Invalid to modify sprites directly when lazy, use setNumberOfItems:withChangeDetails: instead."));

  }
  v15.receiver = self;
  v15.super_class = (Class)PXGOneColumnLayout;
  -[PXGLayout applySpriteChangeDetails:countAfterChanges:initialState:modifyState:](&v15, sel_applySpriteChangeDetails_countAfterChanges_initialState_modifyState_, v11, v8, v12, v13);

}

- (int64_t)itemClosestToItem:(int64_t)a3 inDirection:(unint64_t)a4
{
  return PXGItemsGeometryItemClosestToItemVerticalGridDefaultImplementation(a3, a4, 1, -[PXGItemsLayout numberOfItems](self, "numberOfItems"));
}

- (id)itemsBetweenItem:(int64_t)a3 andItem:(int64_t)a4
{
  return PXGItemsGeometryItemsBetweenItemAndItemDefaultImplementation(a3, a4);
}

- (id)itemsInRect:(CGRect)a3 inLayout:(id)a4
{
  uint64_t v4;
  uint64_t v5;

  v4 = -[PXGOneColumnLayout itemRangeInRect:](self, "itemRangeInRect:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", v4, v5);
}

- (id)diagnosticDescription
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  objc_super v17;
  UIEdgeInsets v18;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PXGLayout referenceSize](self, "referenceSize");
  v5 = v4;
  -[PXGLayout referenceSize](self, "referenceSize");
  v7 = v6;
  -[PXGOneColumnLayout padding](self, "padding");
  NSStringFromUIEdgeInsets(v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PXGItemsLayout numberOfItems](self, "numberOfItems");
  -[PXGOneColumnLayout interItemSpacing](self, "interItemSpacing");
  v11 = v10;
  -[PXGLayout displayScale](self, "displayScale");
  v13 = v12;
  v17.receiver = self;
  v17.super_class = (Class)PXGOneColumnLayout;
  -[PXGLayout diagnosticDescription](&v17, sel_diagnosticDescription);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("size: {%.3f, %.3f}; padding: %@; items: %li; interItemSpacing: %.3f; screenScale: %.3f sprites: {%@}"),
    v5,
    v7,
    v8,
    v9,
    v11,
    v13,
    v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
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

- (unsigned)mediaKind
{
  return self->_mediaKind;
}

- (unsigned)presentationType
{
  return self->_presentationType;
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

- (void)setItemCaptionSpacing:(double)a3
{
  self->_itemCaptionSpacing = a3;
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

- (double)overrideAspectRatio
{
  return self->_overrideAspectRatio;
}

- (double)overrideAspectRatioAmount
{
  return self->_overrideAspectRatioAmount;
}

- (double)aspectRatioLimit
{
  return self->_aspectRatioLimit;
}

- (BOOL)fillSafeAreaTopInset
{
  return self->_fillSafeAreaTopInset;
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

- (int64_t)anchorItem
{
  return self->_anchorItem;
}

- (CGPoint)anchorItemCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_anchorItemCenter.x;
  y = self->_anchorItemCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_anchorObjectReference, 0);
}

uint64_t __36__PXGOneColumnLayout_itemClosestTo___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  double v5;
  double v6;

  result = PXRectShortestDistanceToPoint();
  v6 = v5;
  if (v5 < *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    result = PXSizeIsEmpty();
    if ((result & 1) == 0)
    {
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v6;
      result = objc_msgSend(*(id *)(a1 + 32), "itemForSpriteIndex:", a2);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
    }
  }
  return result;
}

uint64_t __36__PXGOneColumnLayout_itemClosestTo___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __33__PXGOneColumnLayout_itemsToLoad__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(a2, "objectReference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v9 = v7;
    v8 = objc_msgSend(*(id *)(a1 + 32), "itemForObjectReference:options:", v7, a3);
    v7 = v9;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v8;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != 0x7FFFFFFFFFFFFFFFLL)
      *a4 = 1;
  }

}

uint64_t __41__PXGOneColumnLayout__updateSpriteStyles__block_invoke(uint64_t result, unint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  float32x4_t v9;
  float64_t v10;
  float64x2_t v11;
  float64_t v12;
  float64x2_t v13;
  float v14;
  int v15;
  int v16;
  int v17;
  int v18;
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
  float32x4_t v29;

  v4 = HIDWORD(a2);
  if (HIDWORD(a2))
  {
    v6 = a2;
    v7 = result;
    v29 = *(float32x4_t *)off_1E50B8218;
    v27 = *((_OWORD *)off_1E50B83A0 + 7);
    v28 = *((_OWORD *)off_1E50B83A0 + 6);
    v25 = *((_OWORD *)off_1E50B83A0 + 9);
    v26 = *((_OWORD *)off_1E50B83A0 + 8);
    v23 = *((_OWORD *)off_1E50B83A0 + 3);
    v24 = *((_OWORD *)off_1E50B83A0 + 2);
    v21 = *((_OWORD *)off_1E50B83A0 + 5);
    v22 = *((_OWORD *)off_1E50B83A0 + 4);
    v19 = *((_OWORD *)off_1E50B83A0 + 1);
    v20 = *(_OWORD *)off_1E50B83A0;
    do
    {
      v8 = *(_QWORD *)(v7 + 56) + v6;
      v9 = v29;
      if (*(_BYTE *)(v7 + 88))
      {
        PXClamp();
        objc_msgSend(*(id *)(v7 + 32), "itemsLayout:bestCropRectForItem:withAspectRatio:", *(_QWORD *)(v7 + 40), v8);
        v11.f64[1] = v10;
        v13.f64[1] = v12;
        v9 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v13), v11);
      }
      *(_OWORD *)(a4 + 96) = v28;
      *(_OWORD *)(a4 + 112) = v27;
      *(_OWORD *)(a4 + 128) = v26;
      *(_OWORD *)(a4 + 144) = v25;
      *(_OWORD *)(a4 + 32) = v24;
      *(_OWORD *)(a4 + 48) = v23;
      *(_OWORD *)(a4 + 64) = v22;
      *(_OWORD *)(a4 + 80) = v21;
      *(_OWORD *)a4 = v20;
      *(_OWORD *)(a4 + 16) = v19;
      *(float32x4_t *)(a4 + 4) = v9;
      v14 = *(double *)(v7 + 80);
      *(float *)a4 = v14;
      result = objc_msgSend(*(id *)(v7 + 48), "itemsLayout:cornerRadiusForItem:", *(_QWORD *)(v7 + 40), v8, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28);
      *(_DWORD *)(a4 + 36) = v15;
      *(_DWORD *)(a4 + 40) = v16;
      *(_DWORD *)(a4 + 44) = v17;
      *(_DWORD *)(a4 + 48) = v18;
      ++v6;
      a4 += 160;
      LODWORD(v4) = v4 - 1;
    }
    while ((_DWORD)v4);
  }
  return result;
}

void __41__PXGOneColumnLayout__updateSpriteStyles__block_invoke_2(uint64_t a1, id a2)
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

uint64_t __36__PXGOneColumnLayout__updateSprites__block_invoke(uint64_t result, unint64_t a2, uint64_t a3, uint64_t a4, float32x2_t *a5)
{
  unint64_t v5;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  __int128 v13;
  float64x2_t v14;
  float64x2_t v15;
  float32x2_t v16;
  float64x2_t v17;
  float64_t v18;
  float32x2_t v19;
  double v20;
  uint64_t v21;
  __int128 v22;
  float64_t v23;
  float64_t v24;

  v5 = HIDWORD(a2);
  if (HIDWORD(a2))
  {
    v8 = a2;
    v9 = result;
    do
    {
      v10 = *(_QWORD *)(v9 + 72) + v8;
      objc_msgSend(*(id *)(v9 + 32), "itemsLayout:aspectRatioForItem:", *(_QWORD *)(v9 + 40), v10, v22);
      PXClamp();
      if (PXFloatEqualToFloatWithTolerance())
        PXFloatByLinearlyInterpolatingFloats();
      objc_msgSend(*(id *)(v9 + 48), "itemsLayout:marginForItem:", *(_QWORD *)(v9 + 40), v10);
      objc_msgSend(*(id *)(v9 + 56), "itemsLayout:insetForItem:", *(_QWORD *)(v9 + 40), v10);
      PXSizeAdd();
      v23 = v12;
      v24 = v11;
      PXFloatRoundToPixel();
      v22 = v13;
      v14.f64[0] = *(float64_t *)(v9 + 120);
      *(_QWORD *)&v14.f64[1] = v13;
      v15.f64[0] = v24;
      v15.f64[1] = v23;
      v16 = vcvt_f32_f64(vmaxnmq_f64(vsubq_f64(v14, v15), (float64x2_t)0));
      PXFloatRoundToPixel();
      v17.f64[0] = *(float64_t *)(v9 + 120);
      v17.f64[1] = v18;
      v19 = vcvt_f32_f64(v17);
      *(float *)v17.f64 = *(double *)(v9 + 128);
      v20 = *(double *)(*(_QWORD *)(*(_QWORD *)(v9 + 64) + 8) + 24) + *(double *)&v22 * 0.5;
      *(double *)a3 = *(float *)(v9 + 144);
      *(double *)(a3 + 8) = v20;
      *(_QWORD *)(a3 + 16) = 0;
      *(float32x2_t *)(a3 + 24) = v16;
      a5->i8[0] = *(_BYTE *)(v9 + 148);
      a5->i8[1] = *(_BYTE *)(v9 + 149);
      a5[1] = vmul_n_f32(v19, *(float *)v17.f64);
      result = PXFloatRoundToPixel();
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v9 + 64) + 8) + 24) = v21;
      ++v8;
      a3 += 32;
      a5 += 5;
      LODWORD(v5) = v5 - 1;
    }
    while ((_DWORD)v5);
  }
  return result;
}

- ($6FCFBD36564ECBB6D9D1614A84D6F83D)itemCornerRadius
{
  $6FCFBD36564ECBB6D9D1614A84D6F83D result;

  *(_QWORD *)&result.var0.var1[2] = a2;
  *(_QWORD *)&result.var0.var0.var0 = self;
  return result;
}

- (unsigned)spriteInfoFlags
{
  return 0;
}

- (BOOL)supportsContentMode
{
  return 0;
}

- (BOOL)itemCaptionsVisible
{
  return 0;
}

- (int64_t)numberOfColumns
{
  return 1;
}

- (double)rowHeight
{
  return 0.0;
}

- (void)setNumberOfColumns:(int64_t)a3
{
  id v5;

  if (a3 != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXZoomablePhotosContentLayout.m"), 88, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("numberOfColumns == 1"));

  }
}

- (int64_t)columnForItem:(int64_t)a3
{
  return 0;
}

- (BOOL)shiftItem:(int64_t)a3 toColumn:(int64_t)a4 topPaddingRows:(int64_t)a5 hideIncompleteRows:(BOOL)a6
{
  return 0;
}

- (int64_t)visualItemShift
{
  return 0;
}

- (BOOL)hideIncompleteLastRowOrColumn
{
  return 0;
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
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v25;
  double v26;
  double v27;
  double v28;
  CGFloat rect;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect result;
  CGRect v36;

  v3 = -[PXGItemsLayout loadedItems](self, "loadedItems");
  if (v4)
  {
    v5 = v4 + v3 - 1;
    -[PXGOneColumnLayout frameForItem:](self, "frameForItem:", v3);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[PXGOneColumnLayout frameForItem:](self, "frameForItem:", v5);
    v36.origin.x = v14;
    rect = v14;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v30.origin.x = v7;
    v30.origin.y = v9;
    v30.size.width = v11;
    v30.size.height = v13;
    v36.origin.y = v16;
    v36.size.width = v18;
    v36.size.height = v20;
    v31 = CGRectUnion(v30, v36);
    x = v31.origin.x;
    y = v31.origin.y;
    width = v31.size.width;
    height = v31.size.height;
    CGRectGetMinX(v31);
    v32.origin.x = x;
    v32.origin.y = y;
    v32.size.width = width;
    v32.size.height = height;
    CGRectGetMinY(v32);
    v33.origin.x = x;
    v33.origin.y = y;
    v33.size.width = width;
    v33.size.height = height;
    CGRectGetMaxX(v33);
    v34.origin.x = rect;
    v34.origin.y = v16;
    v34.size.width = v18;
    v34.size.height = v20;
    CGRectGetMaxY(v34);
    PXRectWithEdges();
  }
  else
  {
    v25 = *MEMORY[0x1E0C9D648];
    v26 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v27 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v28 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (BOOL)loadItemsOutsideAnchorViewport
{
  return 0;
}

- (double)accessoryAlpha
{
  return 1.0;
}

- (BOOL)enablePerItemInsets
{
  return 1;
}

@end
