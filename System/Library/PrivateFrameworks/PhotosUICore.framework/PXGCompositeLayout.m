@implementation PXGCompositeLayout

uint64_t __39__PXGCompositeLayout__updateSublayouts__block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a3, "numberOfDescendantAnchors");
  if (result >= 1)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)didUpdate
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXGCompositeLayout;
  -[PXGLayout didUpdate](&v5, sel_didUpdate);
  if (self->_updateFlags.willPerformUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGCompositeLayout didUpdate]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXGCompositeLayout.m"), 224, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.willPerformUpdate"));

  }
}

- (void)sublayoutNeedsUpdate:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PXGCompositeLayout;
  -[PXGLayout sublayoutNeedsUpdate:](&v5, sel_sublayoutNeedsUpdate_, v4);
  if (self->_isUpdatingSublayouts)
    -[PXGLayout assumeWillUpdateSublayoutInUpdatePass:](self, "assumeWillUpdateSublayoutInUpdatePass:", v4);
  else
    -[PXGCompositeLayout _invalidateSublayouts](self, "_invalidateSublayouts");

}

- (void)axGroup:(id)a3 didChange:(unint64_t)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t i;
  void *v15;
  PXGCompositeLayout *v16;
  void *v17;
  uint64_t v18;
  objc_super v19;
  id v20;

  v8 = a3;
  v9 = a5;
  v10 = v9;
  if ((a4 & 2) != 0)
  {
    v20 = 0;
    PXGAXGetFocusFromAndToInfosForUserInfo(v9, 0, &v20);
    v11 = v20;
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "axContainingGroup");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "containingLayout");
      for (i = objc_claimAutoreleasedReturnValue(); ; i = objc_claimAutoreleasedReturnValue())
      {
        v15 = (void *)i;

        objc_msgSend(v15, "superlayout");
        v16 = (PXGCompositeLayout *)objc_claimAutoreleasedReturnValue();

        if (!v15 || v16 == self)
          break;
        v13 = v15;
        objc_msgSend(v15, "superlayout");
      }
      if (v15)
      {
        -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "indexOfSublayout:", v15);

      }
      else
      {
        v18 = 0x7FFFFFFFFFFFFFFFLL;
      }

    }
    else
    {
      v18 = 0x7FFFFFFFFFFFFFFFLL;
    }
    if (self->_currentSingleLayouts[1] != v18)
      -[PXGCompositeLayout setSublayoutIndex:forUniquelyStylableType:animated:](self, "setSublayoutIndex:forUniquelyStylableType:animated:", v18, 1, 1);

  }
  v19.receiver = self;
  v19.super_class = (Class)PXGCompositeLayout;
  -[PXGLayout axGroup:didChange:userInfo:](&v19, sel_axGroup_didChange_userInfo_, v8, a4, v10);

}

- (void)setSublayoutFaultingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_sublayoutFaultingDelegate, a3);
}

- (PXGCompositeLayout)init
{
  PXGCompositeLayout *v2;
  int64_t *v3;
  int64_t *v4;
  BOOL *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXGCompositeLayout;
  v2 = -[PXGLayout init](&v7, sel_init);
  if (v2)
  {
    v3 = (int64_t *)malloc_type_calloc(3uLL, 8uLL, 0x100004000313F17uLL);
    v2->_currentSingleLayouts = v3;
    memset_pattern16(v3, &unk_1A7C0CA20, 0x18uLL);
    v4 = (int64_t *)malloc_type_calloc(3uLL, 8uLL, 0x100004000313F17uLL);
    v2->_pendingSingleLayouts = v4;
    memset_pattern16(v4, &unk_1A7C0CA20, 0x18uLL);
    v5 = (BOOL *)malloc_type_calloc(3uLL, 1uLL, 0x100004077774924uLL);
    v2->_pendingAnimations = v5;
    v5[2] = 0;
    *(_WORD *)v5 = 0;
  }
  return v2;
}

uint64_t __39__PXGCompositeLayout__updateSublayouts__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __39__PXGCompositeLayout__updateSublayouts__block_invoke_2(uint64_t a1, unint64_t a2, uint64_t a3, id a4)
{
  uint64_t v8;
  double *v9;
  id *v10;
  char v11;
  unint64_t v12;
  unint64_t v13;
  BOOL v14;
  double *v15;
  CGFloat v16;
  double *v17;
  double v18;
  double v19;
  uint64_t v20;
  id *v21;
  uint64_t v22;
  CGFloat v23;
  id v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  uint64_t v29;
  id v30;
  id v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  double v37;
  double x;
  double y;
  double width;
  double height;
  double v42;
  double v43;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  id v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;

  v8 = *(_QWORD *)(a1 + 88);
  v55 = *(_QWORD *)(a1 + 80);
  v9 = (double *)(v55 + 136 * a2);
  v10 = (id *)(v8 + 16 * a2);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) == a2
    && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    v11 = 1;
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 96);
    v14 = a2 >= v12;
    v13 = a2 - v12;
    v14 = !v14 || v13 >= *(_QWORD *)(a1 + 104);
    v11 = !v14;
  }
  v15 = v9 + 6;
  v16 = v9[6];
  v17 = v9 + 4;
  v18 = v9[4];
  v19 = v9[5];
  v20 = v8 + 16 * a2;
  v22 = *(_QWORD *)(v20 + 8);
  v21 = (id *)(v20 + 8);
  if (!v22)
    goto LABEL_27;
  v23 = v9[7];
  if (!*v10)
  {
    if ((v11 & 1) != 0)
      goto LABEL_16;
    PXEdgeInsetsInsetRect();
    v62.origin.x = v25;
    v62.origin.y = v26;
    v62.size.width = v27;
    v62.size.height = v28;
    v58.origin.x = v16;
    v58.origin.y = v23;
    v58.size.width = v18;
    v58.size.height = v19;
    if (CGRectIntersectsRect(v58, v62)
      || (objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend(*(id *)(a1 + 32), "layout:shouldFaultInSublayoutIfOutsideVisibleRect:", *(_QWORD *)(a1 + 40), a2))
    {
LABEL_16:
      v56 = a4;
      v54 = a3;
      v29 = *(_QWORD *)(a1 + 40);
      v30 = *v21;
      objc_msgSend(v30, "layout:createSublayoutAtIndex:", v29, a2);
      v31 = (id)objc_claimAutoreleasedReturnValue();

      if (v31)
      {
        v31 = v31;
        if (*v10 != v31)
        {

          *v10 = v31;
        }

        objc_msgSend(*(id *)(a1 + 40), "didFaultInSublayout:atIndex:fromEstimatedContentSize:", v31, a2, v18, v19);
      }
      else
      {
        *v21 = 0;
        *(_OWORD *)v17 = *MEMORY[0x1E0C9D820];
      }
      a3 = v54;
LABEL_26:

      a4 = v56;
    }
LABEL_27:
    v24 = *v10;
    if (!v24)
      return;
    goto LABEL_28;
  }
  if ((v11 & 1) == 0)
  {
    PXEdgeInsetsInsetRect();
    v63.origin.x = v32;
    v63.origin.y = v33;
    v63.size.width = v34;
    v63.size.height = v35;
    v59.origin.x = v16;
    v59.origin.y = v23;
    v59.size.width = v18;
    v59.size.height = v19;
    if (CGRectIntersectsRect(v59, v63))
      goto LABEL_27;
    v56 = a4;
    v31 = *v10;
    if ((objc_msgSend(*(id *)(a1 + 32), "layout:shouldPreventFaultOutOfSublayout:", *(_QWORD *)(a1 + 40), v31) & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "willFaultOutSublayout:atIndex:", v31, a2);
      if (*v10)
      {

        *v10 = 0;
      }
    }
    goto LABEL_26;
  }
  v24 = *v10;
LABEL_28:
  v57 = v24;
  v36 = *v15;
  v37 = v9[7];
  v60 = CGRectOffset(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32), -*v15, -v37);
  x = v60.origin.x;
  y = v60.origin.y;
  width = v60.size.width;
  height = v60.size.height;
  objc_msgSend(v57, "contentSize");
  if (v42 != *MEMORY[0x1E0C9D820] || v43 != *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    if ((a3 & 8) != 0)
      x = x + v42 - *v17;
    if ((a3 & 4) != 0)
      y = y + v43 - v9[5];
  }
  objc_msgSend(v57, "setViewEnvironment:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v57, "setReferenceSize:", *v9, v9[1]);
  v45 = v55 + 136 * a2;
  objc_msgSend(v57, "setReferenceDepth:", *(double *)(a1 + 176) * *(double *)(v45 + 16));
  objc_msgSend(v57, "setReferenceOptions:", *(unsigned __int16 *)(v45 + 24));
  objc_msgSend(v57, "setVisibleRect:", x, y, width, height);
  objc_msgSend(v57, "setDisplayScale:", *(double *)(a1 + 184));
  objc_msgSend(v57, "setLastScrollDirection:", *(double *)(a1 + 192), *(double *)(a1 + 200));
  objc_msgSend(v57, "setScrollSpeedRegime:", *(_QWORD *)(a1 + 208));
  objc_msgSend(v57, "setUserInterfaceDirection:", *(_QWORD *)(a1 + 216));
  objc_msgSend(v57, "setSafeAreaInsets:", *(double *)(a1 + 224), *(double *)(a1 + 232), *(double *)(a1 + 240), *(double *)(a1 + 248));
  if (*(_BYTE *)(a1 + 264))
  {
    objc_msgSend(*(id *)(a1 + 40), "alphaForSublayout:atIndex:", v57, a2);
    objc_msgSend(v57, "setAlpha:");
  }
  objc_msgSend(v57, "createAnchorFromSuperlayoutWithSublayoutIndex:sublayoutPositionEdges:ignoringScrollingAnimationAnchors:", a2, a4, 1);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v46;
  if (v46)
  {
    v48 = (id)objc_msgSend(v46, "autoInvalidate");
  }
  else if ((*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) != a2 || *(_QWORD *)(a1 + 256))
         && !objc_msgSend(v57, "numberOfDescendantAnchors")
         && objc_msgSend(v57, "needsUpdate"))
  {
    if (*(_QWORD *)(a1 + 256))
      v49 = *(_QWORD *)(a1 + 256);
    else
      v49 = a3;
    objc_msgSend(v57, "createAnchorForContentEdges:", v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = (id)objc_msgSend(v50, "autoInvalidate");

  }
  objc_msgSend(v57, "updateIfNeeded");
  objc_msgSend(*(id *)(a1 + 40), "didUpdateSublayout:", v57);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) == a2)
  {
    objc_msgSend(v57, "visibleRect");
    *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32) = CGRectOffset(v61, v36, v37);
  }
  objc_msgSend(v57, "contentSize");
  *(_QWORD *)v17 = v52;
  *((_QWORD *)v9 + 5) = v53;
  PXGAssertErrValidSize();

}

- (void)viewEnvironmentDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXGCompositeLayout;
  -[PXGLayout viewEnvironmentDidChange](&v3, sel_viewEnvironmentDidChange);
  -[PXGCompositeLayout _invalidateSublayouts](self, "_invalidateSublayouts");
}

- (void)referenceSizeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXGCompositeLayout;
  -[PXGLayout referenceSizeDidChange](&v3, sel_referenceSizeDidChange);
  -[PXGCompositeLayout _invalidateSublayouts](self, "_invalidateSublayouts");
}

- (void)displayScaleDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXGCompositeLayout;
  -[PXGLayout displayScaleDidChange](&v3, sel_displayScaleDidChange);
  -[PXGCompositeLayout _invalidateSublayouts](self, "_invalidateSublayouts");
}

- (void)didApplySublayoutChangeDetails:(id)a3 axAdjustedSubgroupChangeDetails:(id)a4 countAfterChanges:(int64_t)a5
{
  id v8;
  id v9;
  uint64_t v10;
  BOOL v11;
  _QWORD v12[2];
  uint64_t (*v13)(uint64_t, uint64_t);
  void *v14;
  PXGCompositeLayout *v15;
  id v16;
  objc_super v17;
  char v18;

  v8 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PXGCompositeLayout;
  -[PXGLayout didApplySublayoutChangeDetails:axAdjustedSubgroupChangeDetails:countAfterChanges:](&v17, sel_didApplySublayoutChangeDetails_axAdjustedSubgroupChangeDetails_countAfterChanges_, v8, a4, a5);
  if (objc_msgSend(v8, "hasMoves"))
    -[PXGCompositeLayout _invalidateSublayouts](self, "_invalidateSublayouts");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v13 = __103__PXGCompositeLayout_didApplySublayoutChangeDetails_axAdjustedSubgroupChangeDetails_countAfterChanges___block_invoke;
  v14 = &unk_1E51460E8;
  v15 = self;
  v9 = v8;
  v10 = 0;
  v16 = v9;
  v18 = 0;
  do
  {
    ((void (*)(_QWORD *, uint64_t, char *))v13)(v12, v10, &v18);
    if (v18)
      v11 = 1;
    else
      v11 = v10 == 2;
    ++v10;
  }
  while (!v11);

}

uint64_t __103__PXGCompositeLayout_didApplySublayoutChangeDetails_axAdjustedSubgroupChangeDetails_countAfterChanges___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = result;
  v4 = *(_QWORD *)(result + 32);
  v5 = *(_QWORD *)(*(_QWORD *)(v4 + 880) + 8 * a2);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    result = objc_msgSend(*(id *)(result + 40), "indexAfterApplyingChangesToIndex:", *(_QWORD *)(*(_QWORD *)(v4 + 880) + 8 * a2));
    v4 = *(_QWORD *)(v3 + 32);
    if (v5 != result)
    {
      *(_QWORD *)(*(_QWORD *)(v4 + 880) + 8 * a2) = result;
      result = objc_msgSend(*(id *)(v3 + 32), "_invalidateStylableType:", a2);
      v4 = *(_QWORD *)(v3 + 32);
    }
  }
  if (*(_QWORD *)(*(_QWORD *)(v4 + 888) + 8 * a2) != 0x7FFFFFFFFFFFFFFFLL)
  {
    result = objc_msgSend(*(id *)(v3 + 40), "indexAfterApplyingChangesToIndex:");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 888) + 8 * a2) = result;
  }
  return result;
}

- (void)insertSublayoutProvider:(id)a3 inRange:(_NSRange)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXGCompositeLayout;
  -[PXGLayout insertSublayoutProvider:inRange:](&v5, sel_insertSublayoutProvider_inRange_, a3, a4.location, a4.length);
  -[PXGCompositeLayout _invalidateSublayouts](self, "_invalidateSublayouts");
}

- (void)willUpdate
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXGCompositeLayout;
  -[PXGLayout willUpdate](&v5, sel_willUpdate);
  self->_updateFlags.willPerformUpdate = 1;
  if (self->_updateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGCompositeLayout willUpdate]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXGCompositeLayout.m"), 195, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

  }
}

- (void)didAddSublayout:(id)a3 atIndex:(int64_t)a4 flags:(unint64_t)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXGCompositeLayout;
  -[PXGLayout didAddSublayout:atIndex:flags:](&v6, sel_didAddSublayout_atIndex_flags_, a3, a4, a5);
  -[PXGCompositeLayout _invalidateSublayouts](self, "_invalidateSublayouts");
}

- (void)sublayoutDidChangeContentSize:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXGCompositeLayout;
  -[PXGLayout sublayoutDidChangeContentSize:](&v4, sel_sublayoutDidChangeContentSize_, a3);
  -[PXGCompositeLayout _invalidateSublayouts](self, "_invalidateSublayouts");
}

- (void)update
{
  uint64_t v3;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 isPerformingUpdate;
  unint64_t v7;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;

  v3 = -[PXGLayout numberOfDescendantAnchors](self, "numberOfDescendantAnchors");
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (v3 >= 1)
  {
    isPerformingUpdate = self->_updateFlags.isPerformingUpdate;
    if (self->_updateFlags.isPerformingUpdate && (self->_updateFlags.updated & 8) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGCompositeLayout update]");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("PXGCompositeLayout.m"), 201, CFSTR("invalidating %lu after it already has been updated"), 8);

      abort();
    }
    needsUpdate |= 8uLL;
    p_updateFlags->needsUpdate = needsUpdate;
    self->_updateFlags.willPerformUpdate = 0;
    if (!isPerformingUpdate)
      goto LABEL_5;
    goto LABEL_23;
  }
  self->_updateFlags.willPerformUpdate = 0;
  if (!needsUpdate)
    goto LABEL_20;
  if (self->_updateFlags.isPerformingUpdate)
  {
LABEL_23:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGCompositeLayout update]");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("PXGCompositeLayout.m"), 204, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

    needsUpdate = p_updateFlags->needsUpdate;
  }
LABEL_5:
  self->_updateFlags.isPerformingUpdate = 1;
  self->_updateFlags.updated = 8;
  if ((needsUpdate & 8) != 0)
  {
    p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFF7;
    -[PXGCompositeLayout _updateSublayouts](self, "_updateSublayouts");
    if (!self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGCompositeLayout update]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("PXGCompositeLayout.m"), 208, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
  }
  v7 = p_updateFlags->needsUpdate;
  self->_updateFlags.updated |= 1uLL;
  if ((v7 & 1) != 0)
  {
    p_updateFlags->needsUpdate = v7 & 0xFFFFFFFFFFFFFFFELL;
    -[PXGCompositeLayout _updateSublayoutOfStylableType:](self, "_updateSublayoutOfStylableType:", 1);
  }
  if (!self->_updateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGCompositeLayout update]");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("PXGCompositeLayout.m"), 211, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

  }
  v8 = p_updateFlags->needsUpdate;
  self->_updateFlags.updated |= 2uLL;
  if ((v8 & 2) != 0)
  {
    p_updateFlags->needsUpdate = v8 & 0xFFFFFFFFFFFFFFFDLL;
    -[PXGCompositeLayout _updateSublayoutOfStylableType:](self, "_updateSublayoutOfStylableType:", 0);
  }
  if (!self->_updateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGCompositeLayout update]");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("PXGCompositeLayout.m"), 214, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

  }
  v9 = p_updateFlags->needsUpdate;
  self->_updateFlags.updated |= 4uLL;
  if ((v9 & 4) != 0)
  {
    p_updateFlags->needsUpdate = v9 & 0xFFFFFFFFFFFFFFFBLL;
    -[PXGCompositeLayout _updateSublayoutOfStylableType:](self, "_updateSublayoutOfStylableType:", 2);
    v9 = p_updateFlags->needsUpdate;
  }
  self->_updateFlags.isPerformingUpdate = 0;
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGCompositeLayout update]");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("PXGCompositeLayout.m"), 217, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

  }
LABEL_20:
  v22.receiver = self;
  v22.super_class = (Class)PXGCompositeLayout;
  -[PXGLayout update](&v22, sel_update);
}

- (void)_updateSublayoutOfStylableType:(int64_t)a3
{
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void (**v19)(_QWORD, _QWORD, _QWORD);
  int64_t v20;
  int64_t v21;
  int v22;
  BOOL v23;
  void (**v25)(_QWORD);
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  _QWORD aBlock[10];

  objc_msgSend(off_1E50B5CD0, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = objc_msgSend(v6, "geometries");
  -[PXGCompositeLayout composition](self, "composition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sublayoutInsetsForStylableType:", a3);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v17 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__PXGCompositeLayout__updateSublayoutOfStylableType___block_invoke;
  aBlock[3] = &__block_descriptor_72_e11_v20__0q8B16l;
  aBlock[4] = v7;
  aBlock[5] = v10;
  aBlock[6] = v12;
  aBlock[7] = v14;
  aBlock[8] = v16;
  v18 = _Block_copy(aBlock);
  v19 = (void (**)(_QWORD, _QWORD, _QWORD))v18;
  v20 = self->_currentSingleLayouts[a3];
  if (v20 != 0x7FFFFFFFFFFFFFFFLL)
    (*((void (**)(void *, int64_t, _QWORD))v18 + 2))(v18, self->_currentSingleLayouts[a3], 0);
  v21 = self->_pendingSingleLayouts[a3];
  if (v21 != 0x7FFFFFFFFFFFFFFFLL)
    v19[2](v19, self->_pendingSingleLayouts[a3], 1);
  if (self->_pendingAnimations[a3])
  {
    v22 = objc_msgSend(v5, "enableTungstenKeyboardNavigation");
    v23 = v21 == 0x7FFFFFFFFFFFFFFFLL && v20 == 0x7FFFFFFFFFFFFFFFLL;
    if (!v23 && v22 != 0)
    {
      v30[0] = v17;
      v30[1] = 3221225472;
      v30[2] = __53__PXGCompositeLayout__updateSublayoutOfStylableType___block_invoke_2;
      v30[3] = &unk_1E511F078;
      v31 = v5;
      v25 = (void (**)(_QWORD))_Block_copy(v30);
      -[PXGLayout createAnimation](self, "createAnimation");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v25[2](v25);
      -[PXGLayout superlayout](self, "superlayout");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v26, "createAnimation");
        v28 = v5;
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (*)(void (**)(_QWORD), void *))v25[2])(v25, v27);

        v5 = v28;
      }

    }
  }
  self->_currentSingleLayouts[a3] = v21;
  self->_pendingAnimations[a3] = 0;

}

- (PXGSublayoutComposition)composition
{
  return self->_composition;
}

- (void)setSublayoutIndex:(int64_t)a3 forUniquelyStylableType:(int64_t)a4 animated:(BOOL)a5
{
  self->_pendingSingleLayouts[a4] = a3;
  self->_pendingAnimations[a4] = a5;
  -[PXGCompositeLayout _invalidateStylableType:](self, "_invalidateStylableType:", a4);
}

- (void)setComposition:(id)a3
{
  PXGSublayoutComposition *v6;
  PXGSublayoutComposition **p_composition;
  PXGSublayoutComposition *composition;
  void *v9;
  void *v10;
  PXGSublayoutComposition *v11;
  void *v12;
  PXGSublayoutComposition *v13;

  v6 = (PXGSublayoutComposition *)a3;
  p_composition = &self->_composition;
  composition = self->_composition;
  if (composition != v6)
  {
    v13 = v6;
    -[PXGSublayoutComposition setCompositeLayout:](composition, "setCompositeLayout:", 0);
    objc_storeStrong((id *)&self->_composition, a3);
    -[PXGSublayoutComposition compositeLayout](*p_composition, "compositeLayout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *p_composition;
      -[PXGSublayoutComposition compositeLayout](*p_composition, "compositeLayout");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGCompositeLayout.m"), 71, CFSTR("a layout composition currently cannot be use for multiple PXGCompositeLayouts (%@ is already assigned to %@, and thus can't be used with %@)"), v11, v12, self);

    }
    -[PXGSublayoutComposition setCompositeLayout:](*p_composition, "setCompositeLayout:", self);
    -[PXGCompositeLayout _invalidateSublayouts](self, "_invalidateSublayouts");
    -[PXGCompositeLayout _invalidateStylableType:](self, "_invalidateStylableType:", 1);
    -[PXGCompositeLayout _invalidateStylableType:](self, "_invalidateStylableType:", 0);
    -[PXGCompositeLayout _invalidateStylableType:](self, "_invalidateStylableType:", 2);
    v6 = v13;
  }

}

- (void)_invalidateStylableType:(int64_t)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t v4;
  unint64_t needsUpdate;
  unint64_t v6;
  uint64_t v7;
  _BOOL4 willPerformUpdate;
  uint64_t v9;
  void *v10;
  void *v11;

  if (a3 == 2)
  {
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
        goto LABEL_18;
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      v9 = 4;
      goto LABEL_27;
    }
    if ((self->_updateFlags.updated & 4) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGCompositeLayout _invalidateStylableType:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("PXGCompositeLayout.m"), 236, CFSTR("invalidating %lu after it already has been updated"), 4);
      goto LABEL_32;
    }
LABEL_18:
    v7 = needsUpdate | 4;
    goto LABEL_22;
  }
  if (a3 == 1)
  {
    p_updateFlags = &self->_updateFlags;
    v6 = self->_updateFlags.needsUpdate;
    if (v6)
    {
      if (!self->_updateFlags.isPerformingUpdate)
        goto LABEL_21;
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      v9 = 1;
      goto LABEL_27;
    }
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGCompositeLayout _invalidateStylableType:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("PXGCompositeLayout.m"), 233, CFSTR("invalidating %lu after it already has been updated"), 1);
      goto LABEL_32;
    }
LABEL_21:
    v7 = v6 | 1;
    goto LABEL_22;
  }
  if (a3)
    return;
  p_updateFlags = &self->_updateFlags;
  v4 = self->_updateFlags.needsUpdate;
  if (v4)
  {
    if (!self->_updateFlags.isPerformingUpdate)
      goto LABEL_15;
    goto LABEL_14;
  }
  if (self->_updateFlags.isPerformingUpdate)
  {
LABEL_14:
    if ((self->_updateFlags.updated & 2) == 0)
    {
LABEL_15:
      v7 = v4 | 2;
LABEL_22:
      p_updateFlags->needsUpdate = v7;
      return;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGCompositeLayout _invalidateStylableType:]");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("PXGCompositeLayout.m"), 230, CFSTR("invalidating %lu after it already has been updated"), 2);
LABEL_32:

    abort();
  }
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  v9 = 2;
LABEL_27:
  p_updateFlags->needsUpdate = v9;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateSublayouts
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  int64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  CGFloat v22;
  CGFloat v23;
  BOOL v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  id v61;
  id v62;
  void (**v63)(void);
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  CGRect *v75;
  CGFloat v76;
  CGFloat v77;
  void *v78;
  void *v79;
  void *v80;
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  id v92;
  uint64_t v93;
  id v94;
  void *v95;
  unint64_t v96;
  void *v97;
  _QWORD v98[4];
  void (**v99)(void);
  _QWORD v100[4];
  id v101;
  id v102;
  uint64_t *v103;
  _QWORD aBlock[4];
  id v105;
  PXGCompositeLayout *v106;
  id v107;
  uint64_t *v108;
  uint64_t *v109;
  uint64_t *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  int64_t v127;
  unint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  unint64_t v133;
  char v134;
  _QWORD v135[6];
  uint64_t v136;
  uint64_t *v137;
  uint64_t v138;
  char v139;
  uint64_t v140;
  uint64_t *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  CGRect *v145;
  uint64_t v146;
  void *v147;
  __int128 v148;
  __int128 v149;
  CGPoint v150;
  CGRect v151;

  -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  if (!v5)
    goto LABEL_44;
  v6 = v5;
  if (self->_isUpdatingSublayouts)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGCompositeLayout.m"), 318, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_isUpdatingSublayouts"));

  }
  self->_isUpdatingSublayouts = 1;
  -[PXGCompositeLayout composition](self, "composition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGCompositeLayout.m"), 322, CFSTR("%@ has no defined composition"), self);

  }
  v144 = 0;
  v145 = (CGRect *)&v144;
  v146 = 0x4010000000;
  v147 = &unk_1A7E74EE7;
  v148 = 0u;
  v149 = 0u;
  -[PXGLayout visibleRect](self, "visibleRect");
  *(_QWORD *)&v148 = v8;
  *((_QWORD *)&v148 + 1) = v9;
  *(_QWORD *)&v149 = v10;
  *((_QWORD *)&v149 + 1) = v11;
  objc_msgSend(v7, "setSublayoutDataStore:", v4);
  -[PXGLayout referenceSize](self, "referenceSize");
  objc_msgSend(v7, "setReferenceSize:");
  -[PXGLayout visibleRect](self, "visibleRect");
  objc_msgSend(v7, "setVisibleRect:");
  objc_msgSend(v7, "updateEstimate");
  v140 = 0;
  v141 = &v140;
  v142 = 0x2020000000;
  v12 = 0x7FFFFFFFFFFFFFFFLL;
  v143 = 0x7FFFFFFFFFFFFFFFLL;
  v136 = 0;
  v137 = &v136;
  v138 = 0x2020000000;
  v139 = 0;
  v13 = -[PXGLayout anchoredContentEdges](self, "anchoredContentEdges");
  v14 = v13;
  v15 = v141[3];
  if (v15 != 0x7FFFFFFFFFFFFFFFLL || !v13)
  {
LABEL_10:
    if (v15 != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_26;
    goto LABEL_11;
  }
  v16 = objc_msgSend(v7, "anchorSublayoutIndexForAnchoredContentEdges:", v13);
  v141[3] = v16;
  if (v16 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v17 = -[PXGLayout shouldFaultInContentAtAnchoredContentEdges](self, "shouldFaultInContentAtAnchoredContentEdges");
    *((_BYTE *)v137 + 24) = v17;
    v15 = v141[3];
    goto LABEL_10;
  }
LABEL_11:
  v18 = -[PXGLayout anchoredSublayoutIndex](self, "anchoredSublayoutIndex");
  v141[3] = v18;
  if (v18 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v25 = 1;
LABEL_25:
    *((_BYTE *)v137 + 24) = v25;
    goto LABEL_26;
  }
  v135[0] = MEMORY[0x1E0C809B0];
  v135[1] = 3221225472;
  v135[2] = __39__PXGCompositeLayout__updateSublayouts__block_invoke;
  v135[3] = &unk_1E511F0A0;
  v135[4] = &v140;
  v135[5] = &v136;
  objc_msgSend(v4, "enumerateSublayoutsUsingBlock:", v135);
  if (v141[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v6 >= 1)
    {
      v19 = 0;
      for (i = 0; i != v6; ++i)
      {
        v21 = objc_msgSend(objc_retainAutorelease(v4), "geometries");
        v22 = *(double *)(v21 + v19 + 48);
        v23 = *(double *)(v21 + v19 + 56);
        v151.size.width = *(CGFloat *)(v21 + v19 + 32);
        v151.size.height = *(CGFloat *)(v21 + v19 + 40);
        v151.origin.x = v22;
        v151.origin.y = v23;
        if (CGRectIntersectsRect(v151, v145[1]))
        {
          v150.x = v22;
          v150.y = v23;
          v24 = CGRectContainsPoint(v145[1], v150);
          if (v12 == 0x7FFFFFFFFFFFFFFFLL)
            v12 = i;
          if (v24)
          {
            v12 = i;
            goto LABEL_24;
          }
        }
        v19 += 136;
      }
      if (v12 != 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_24;
    }
    v12 = 0;
LABEL_24:
    v25 = 0;
    v141[3] = v12;
    goto LABEL_25;
  }
LABEL_26:
  -[PXGLayout viewEnvironment](self, "viewEnvironment");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = v7;
  if (objc_msgSend(v97, "accessibilityEnabled"))
  {
    v26 = v141[3];
    v27 = 1;
    if (v26 > 0)
      v27 = 2;
    v28 = v26 - (v26 > 0);
    if (v6 - v26 <= 1)
      v29 = v27;
    else
      v29 = v27 + 1;
    v91 = v29;
    v93 = v28;
  }
  else
  {
    v91 = 0;
    v93 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v80 = v4;
  v30 = objc_retainAutorelease(v4);
  v31 = objc_msgSend(v30, "geometries");
  v32 = objc_retainAutorelease(v30);
  v33 = objc_msgSend(v32, "infos");
  -[PXGCompositeLayout faultInOutsets](self, "faultInOutsets");
  sub_1A7AE3F38();
  v89 = v35;
  v90 = v34;
  v88 = v36;
  v38 = v37;
  -[PXGCompositeLayout faultOutOutsets](self, "faultOutOutsets");
  sub_1A7AE3F38();
  v86 = v40;
  v87 = v39;
  v85 = v41;
  v43 = v42;
  -[PXGLayout displayScale](self, "displayScale");
  v84 = v44;
  -[PXGLayout lastScrollDirection](self, "lastScrollDirection");
  v82 = v46;
  v83 = v45;
  v47 = -[PXGLayout scrollSpeedRegime](self, "scrollSpeedRegime");
  v81 = -[PXGLayout userInterfaceDirection](self, "userInterfaceDirection");
  -[PXGLayout safeAreaInsets](self, "safeAreaInsets");
  v49 = v48;
  v51 = v50;
  v53 = v52;
  v55 = v54;
  -[PXGLayout referenceDepth](self, "referenceDepth");
  v57 = v56;
  LOBYTE(v30) = -[PXGCompositeLayout wantsCustomAlphaForSublayouts](self, "wantsCustomAlphaForSublayouts");
  -[PXGCompositeLayout sublayoutFaultingDelegate](self, "sublayoutFaultingDelegate");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[2] = __39__PXGCompositeLayout__updateSublayouts__block_invoke_2;
  aBlock[3] = &unk_1E511F0C8;
  v108 = &v140;
  v109 = &v136;
  v59 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  v112 = v33;
  v113 = v93;
  v114 = v91;
  v110 = &v144;
  v111 = v31;
  v115 = v43;
  v116 = v87;
  v117 = v86;
  v118 = v85;
  v94 = v58;
  v105 = v94;
  v106 = self;
  v119 = v38;
  v120 = v90;
  v121 = v89;
  v122 = v88;
  v92 = v97;
  v107 = v92;
  v123 = v57;
  v124 = v84;
  v125 = v83;
  v126 = v82;
  v127 = v47;
  v128 = v81;
  v129 = v49;
  v130 = v51;
  v131 = v53;
  v132 = v55;
  v134 = (char)v30;
  v133 = v14;
  v60 = _Block_copy(aBlock);
  v100[0] = v59;
  v100[1] = 3221225472;
  v100[2] = __39__PXGCompositeLayout__updateSublayouts__block_invoke_3;
  v100[3] = &unk_1E5140330;
  v61 = v95;
  v101 = v61;
  v103 = &v140;
  v62 = v60;
  v102 = v62;
  v63 = (void (**)(void))_Block_copy(v100);
  v63[2]();
  if (-[PXGLayout hasSublayoutsRemainingToBeUpdated](self, "hasSublayoutsRemainingToBeUpdated")
    && -[PXGCompositeLayout allowsRepeatedSublayoutsUpdates](self, "allowsRepeatedSublayoutsUpdates"))
  {
    v98[0] = MEMORY[0x1E0C809B0];
    v98[1] = 3221225472;
    v98[2] = __39__PXGCompositeLayout__updateSublayouts__block_invoke_5;
    v98[3] = &unk_1E5148A40;
    v99 = v63;
    -[PXGLayout performRepeatedSublayoutsUpdate:](self, "performRepeatedSublayoutsUpdate:", v98);

  }
  objc_msgSend(v61, "contentBounds");
  v66 = v65;
  v68 = v67;
  if (v69 != *MEMORY[0x1E0C9D538] || v64 != *(double *)(MEMORY[0x1E0C9D538] + 8))
  {
    PXPointSubtract();
    v71 = v70;
    v96 = v72;
    PXPointAdd();
    if (v6 >= 1)
    {
      v73 = 0;
      do
      {
        v74 = objc_msgSend(objc_retainAutorelease(v32), "geometries") + v73;
        *(double *)(v74 + 48) = v71 + *(double *)(v74 + 48);
        *(float64x2_t *)(v74 + 56) = vaddq_f64((float64x2_t)v96, *(float64x2_t *)(v74 + 56));
        v73 += 136;
        --v6;
      }
      while (v6);
    }
    PXPointAdd();
    v75 = v145;
    v145[1].origin.x = v76;
    v75[1].origin.y = v77;
  }
  -[PXGLayout setContentSize:](self, "setContentSize:", v66, v68);
  -[PXGLayout changeVisibleRectToProposedVisibleRect:](self, "changeVisibleRectToProposedVisibleRect:", v145[1].origin.x, v145[1].origin.y, v145[1].size.width, v145[1].size.height);
  -[PXGCompositeLayout didUpdateSublayouts](self, "didUpdateSublayouts");
  self->_isUpdatingSublayouts = 0;

  _Block_object_dispose(&v136, 8);
  _Block_object_dispose(&v140, 8);
  _Block_object_dispose(&v144, 8);

  v4 = v80;
LABEL_44:

}

void __39__PXGCompositeLayout__updateSublayouts__block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __39__PXGCompositeLayout__updateSublayouts__block_invoke_4;
  v3[3] = &unk_1E511F0F0;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "updateSublayoutGeometriesFromAnchorSublayoutIndex:usingSublayoutUpdateBlock:", v1, v3);

}

- (BOOL)wantsCustomAlphaForSublayouts
{
  return 0;
}

- (PXGSublayoutFaultingDelegate)sublayoutFaultingDelegate
{
  return (PXGSublayoutFaultingDelegate *)objc_loadWeakRetained((id *)&self->_sublayoutFaultingDelegate);
}

- (UIEdgeInsets)faultOutOutsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_faultOutOutsets.top;
  left = self->_faultOutOutsets.left;
  bottom = self->_faultOutOutsets.bottom;
  right = self->_faultOutOutsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)faultInOutsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_faultInOutsets.top;
  left = self->_faultInOutsets.left;
  bottom = self->_faultInOutsets.bottom;
  right = self->_faultInOutsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)visibleRectDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXGCompositeLayout;
  -[PXGLayout visibleRectDidChange](&v3, sel_visibleRectDidChange);
  -[PXGCompositeLayout _invalidateSublayouts](self, "_invalidateSublayouts");
}

- (void)_invalidateSublayouts
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  if (!self->_isUpdatingSublayouts)
  {
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
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGCompositeLayout _invalidateSublayouts]");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXGCompositeLayout.m"), 307, CFSTR("invalidating %lu after it already has been updated"), 8);

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

- (void)setFaultOutOutsets:(UIEdgeInsets)a3
{
  self->_faultOutOutsets = a3;
}

- (void)setFaultInOutsets:(UIEdgeInsets)a3
{
  self->_faultInOutsets = a3;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_currentSingleLayouts);
  free(self->_pendingSingleLayouts);
  free(self->_pendingAnimations);
  v3.receiver = self;
  v3.super_class = (Class)PXGCompositeLayout;
  -[PXGLayout dealloc](&v3, sel_dealloc);
}

- (PXGCompositeLayout)initWithComposition:(id)a3
{
  id v4;
  PXGCompositeLayout *v5;

  v4 = a3;
  v5 = -[PXGCompositeLayout init](self, "init");
  -[PXGCompositeLayout setComposition:](v5, "setComposition:", v4);

  return v5;
}

- (double)alphaForSublayout:(id)a3 atIndex:(int64_t)a4
{
  id v6;
  void *v7;
  objc_class *v8;
  void *v9;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGCompositeLayout.m"), 88, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXGCompositeLayout alphaForSublayout:atIndex:]", v9);

  abort();
}

- (void)willRemoveSublayout:(id)a3 atIndex:(int64_t)a4 flags:(unint64_t)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXGCompositeLayout;
  -[PXGLayout willRemoveSublayout:atIndex:flags:](&v6, sel_willRemoveSublayout_atIndex_flags_, a3, a4, a5);
  -[PXGCompositeLayout _invalidateSublayouts](self, "_invalidateSublayouts");
}

- (void)referenceDepthDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXGCompositeLayout;
  -[PXGLayout referenceDepthDidChange](&v3, sel_referenceDepthDidChange);
  -[PXGCompositeLayout _invalidateSublayouts](self, "_invalidateSublayouts");
}

- (void)scrollSpeedRegimeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXGCompositeLayout;
  -[PXGLayout scrollSpeedRegimeDidChange](&v3, sel_scrollSpeedRegimeDidChange);
  -[PXGCompositeLayout _invalidateSublayouts](self, "_invalidateSublayouts");
}

- (BOOL)definesContextForPointReferences
{
  return 0;
}

- (BOOL)allowsRepeatedSublayoutsUpdates
{
  return self->_allowsRepeatedSublayoutsUpdates;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sublayoutFaultingDelegate);
  objc_storeStrong((id *)&self->_composition, 0);
}

uint64_t __39__PXGCompositeLayout__updateSublayouts__block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

CGFloat __53__PXGCompositeLayout__updateSublayoutOfStylableType___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  uint64_t v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  uint64_t v18;
  __int128 v19;
  CGFloat result;
  CGAffineTransform v21;
  CGAffineTransform v22;
  CGAffineTransform v23;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_OWORD *)off_1E50B8368;
  v6 = *((_OWORD *)off_1E50B8368 + 1);
  *(_OWORD *)&v22.a = *(_OWORD *)off_1E50B8368;
  *(_OWORD *)&v22.c = v6;
  v7 = *((_OWORD *)off_1E50B8368 + 2);
  *(_OWORD *)&v22.tx = v7;
  v8 = *((double *)off_1E50B8368 + 6);
  if (a3)
  {
    v9 = v4 + 136 * a2;
    v10 = *(double *)(v9 + 32);
    if (v10 > 0.0)
    {
      v11 = *(double *)(v9 + 40);
      if (v11 > 0.0)
      {
        v12 = (v10 - *(double *)(a1 + 48) - *(double *)(a1 + 64)) / v10;
        v13 = v11 - *(double *)(a1 + 40) - *(double *)(a1 + 56);
        v14 = v4 + 136 * a2;
        v15 = v10 * 0.5 + *(double *)(v14 + 48);
        v16 = v11 * 0.5 + *(double *)(v14 + 56);
        *(_OWORD *)&v21.a = v5;
        *(_OWORD *)&v21.c = v6;
        *(_OWORD *)&v21.tx = v7;
        *(_OWORD *)&v23.a = v5;
        *(_OWORD *)&v23.c = v6;
        *(_OWORD *)&v23.tx = v7;
        v17 = v13 / v11;
        CGAffineTransformTranslate(&v21, &v23, v15, v16);
        v8 = v8 + 0.0;
        v22 = v21;
        v23 = v21;
        CGAffineTransformScale(&v21, &v23, v12, v17);
        v22 = v21;
        v23 = v21;
        CGAffineTransformTranslate(&v21, &v23, -v15, -v16);
        v22 = v21;
      }
    }
  }
  v18 = v4 + 136 * a2;
  v19 = *(_OWORD *)&v22.c;
  *(_OWORD *)(v18 + 72) = *(_OWORD *)&v22.a;
  *(_OWORD *)(v18 + 88) = v19;
  result = v22.tx;
  *(_OWORD *)(v18 + 104) = *(_OWORD *)&v22.tx;
  *(double *)(v18 + 120) = v8;
  return result;
}

void __53__PXGCompositeLayout__updateSublayoutOfStylableType___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "keyboardAnimationDuration");
  objc_msgSend(v5, "setDuration:");
  objc_msgSend(*(id *)(a1 + 32), "keyboardDampingRatio");
  *(float *)&v4 = v4;
  objc_msgSend(v5, "setDampingRatio:", v4);
  objc_msgSend(v5, "setScope:", 1);

}

@end
