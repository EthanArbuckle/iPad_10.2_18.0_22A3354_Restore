@implementation PXFeedSectionContentLayout

- (PXFeedSectionContentLayout)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeedSectionContentLayout.m"), 67, CFSTR("%s is not available as initializer"), "-[PXFeedSectionContentLayout init]");

  abort();
}

- (PXFeedSectionContentLayout)initWithViewModel:(id)a3 dataSource:(id)a4 sectionIndexPath:(PXSimpleIndexPath *)a5
{
  id v9;
  id v10;
  PXFeedSectionContentLayout *v11;
  PXFeedSectionContentLayout *v12;
  id *p_viewModel;
  void *v14;
  __int128 v15;
  PXFeedSublayoutComposition *v16;
  void *v17;
  int v18;
  PXFeedAutoplayController *v19;
  uint64_t v20;
  PXFeedAutoplayController *autoplayController;
  _QWORD v23[4];
  id v24;
  objc_super v25;

  v9 = a3;
  v10 = a4;
  v25.receiver = self;
  v25.super_class = (Class)PXFeedSectionContentLayout;
  v11 = -[PXGCompositeLayout init](&v25, sel_init);
  v12 = v11;
  if (v11)
  {
    p_viewModel = (id *)&v11->_viewModel;
    objc_storeStrong((id *)&v11->_viewModel, a3);
    objc_msgSend(*p_viewModel, "registerChangeObserver:context:", v12, ViewModelObservationContext_291627);
    objc_msgSend(*p_viewModel, "registerAccessoryTapToRadarDiagnosticsProvider:", v12);
    objc_msgSend(*p_viewModel, "itemLayoutFactory");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v12->_itemLayoutFactory, v14);
    v12->_itemLayoutFactoryRespondsTo.setItemLayoutShouldAutoplayContentVideoTimeRange = objc_opt_respondsToSelector() & 1;
    v12->_itemLayoutFactoryRespondsTo.setItemLayoutIsTouched = objc_opt_respondsToSelector() & 1;
    v12->_itemLayoutFactoryRespondsTo.setItemLayoutIsHovered = objc_opt_respondsToSelector() & 1;
    v12->_itemLayoutFactoryRespondsTo.shouldReloadItemLayoutForChangedItemFromIndexPathInDataSourceToIndexPathInDataSource = objc_opt_respondsToSelector() & 1;
    v12->_itemLayoutFactoryRespondsTo.configureItemLayoutForChangedItemFromIndexPathInDataSourceToIndexPathInDataSource = objc_opt_respondsToSelector() & 1;
    v12->_itemLayoutFactoryRespondsTo.decorationOverlayAnchorSpriteIndexForItemLayout = objc_opt_respondsToSelector() & 1;
    v12->_itemLayoutFactoryRespondsTo.itemPlacementControllerForItemReferenceItemLayout = objc_opt_respondsToSelector() & 1;
    objc_storeStrong((id *)&v12->_dataSource, a4);
    v15 = *(_OWORD *)&a5->item;
    *(_OWORD *)&v12->_sectionIndexPath.dataSourceIdentifier = *(_OWORD *)&a5->dataSourceIdentifier;
    *(_OWORD *)&v12->_sectionIndexPath.item = v15;
    -[PXGLayout setContentSource:](v12, "setContentSource:", v12);
    v16 = objc_alloc_init(PXFeedSublayoutComposition);
    -[PXGCompositeLayout setComposition:](v12, "setComposition:", v16);

    if (v12->_itemLayoutFactoryRespondsTo.setItemLayoutShouldAutoplayContentVideoTimeRange)
    {
      objc_msgSend(v9, "spec");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "allowsAutoplayContent");

      if (v18)
      {
        v19 = [PXFeedAutoplayController alloc];
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __76__PXFeedSectionContentLayout_initWithViewModel_dataSource_sectionIndexPath___block_invoke;
        v23[3] = &unk_1E5146968;
        v24 = v14;
        v20 = -[PXFeedAutoplayController initWithContainerLayout:viewModel:itemLayoutDesiredPlayStateSetter:](v19, "initWithContainerLayout:viewModel:itemLayoutDesiredPlayStateSetter:", v12, v9, v23);
        autoplayController = v12->_autoplayController;
        v12->_autoplayController = (PXFeedAutoplayController *)v20;

      }
    }
    -[PXFeedSectionContentLayout _invalidateFeedSublayouts](v12, "_invalidateFeedSublayouts");
    -[PXFeedSectionContentLayout _invalidateCompositionParameters](v12, "_invalidateCompositionParameters");
    -[PXFeedSectionContentLayout _invalidateAutoplayControllerParameters](v12, "_invalidateAutoplayControllerParameters");

  }
  return v12;
}

- (int64_t)itemForSpriteIndex:(unsigned int)a3
{
  if (-[PXGLayout localNumberOfSprites](self, "localNumberOfSprites") <= a3)
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return a3;
}

- (int64_t)scrollableAxis
{
  void *v2;
  int64_t v3;

  -[PXGCompositeLayout composition](self, "composition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "scrollableAxis");

  return v3;
}

- (void)didUpdateSublayouts
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXFeedSectionContentLayout;
  -[PXGCompositeLayout didUpdateSublayouts](&v3, sel_didUpdateSublayouts);
  -[PXFeedSectionContentLayout _updateFeedSprites](self, "_updateFeedSprites");
}

- (void)visibleRectDidChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(_QWORD);
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXFeedSectionContentLayout;
  -[PXGCompositeLayout visibleRectDidChange](&v8, sel_visibleRectDidChange);
  -[PXFeedSectionContentLayout autoplayController](self, "autoplayController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containerLayoutVisibleRectDidChange");

  -[PXFeedSectionContentLayout viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "visibleRectChangeObserver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PXFeedSectionContentLayout viewModel](self, "viewModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "visibleRectChangeObserver");
    v7 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
    -[PXGLayout visibleRect](self, "visibleRect");
    v7[2](v7);

  }
}

- (void)localHiddenSpriteIndexesDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXFeedSectionContentLayout;
  -[PXGLayout localHiddenSpriteIndexesDidChange](&v3, sel_localHiddenSpriteIndexesDidChange);
  -[PXGCompositeLayout invalidateSublayouts](self, "invalidateSublayouts");
}

- (BOOL)wantsCustomAlphaForSublayouts
{
  return 1;
}

- (double)alphaForSublayout:(id)a3 atIndex:(int64_t)a4
{
  void *v6;
  char v7;
  double v8;
  void *v9;
  void *v10;
  int v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;

  -[PXGLayout localHiddenSpriteIndexes](self, "localHiddenSpriteIndexes", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsIndex:", a4);

  v8 = 0.0;
  if ((v7 & 1) == 0)
  {
    v8 = 1.0;
    if (!a4)
    {
      -[PXFeedSectionContentLayout viewModel](self, "viewModel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "spec");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "wantsFirstItemFullscreen");

      if (v11)
      {
        -[PXGLayout visibleRect](self, "visibleRect");
        v13 = v12;
        -[PXFeedSectionContentLayout viewModel](self, "viewModel");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "spec");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "scrollBehavior");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "intrinsicContentOffset");
        v18 = v13 / v17;
        v8 = 1.0;
        v19 = 1.0 - v18;

        v20 = fmax(v19, 0.0);
        if (v20 <= 1.0)
          return v20;
      }
    }
  }
  return v8;
}

- (id)hitTestResultForSpriteIndex:(unsigned int)a3
{
  uint64_t v3;
  PXFeedHitTestResult *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _OWORD v15[2];
  _OWORD v16[2];
  __int128 v17;
  __int128 v18;
  _QWORD v19[4];
  id v20;
  int v21;
  _QWORD v22[4];
  id v23;
  int v24;
  _QWORD v25[4];
  id v26;
  int v27;
  _QWORD v28[4];
  id v29;
  int v30;
  id location;

  v3 = *(_QWORD *)&a3;
  if (-[PXGLayout localNumberOfSprites](self, "localNumberOfSprites") <= a3)
  {
    v5 = 0;
  }
  else
  {
    objc_initWeak(&location, self);
    v5 = -[PXFeedHitTestResult initWithSpriteIndex:layout:]([PXFeedHitTestResult alloc], "initWithSpriteIndex:layout:", v3, self);
    v6 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __58__PXFeedSectionContentLayout_hitTestResultForSpriteIndex___block_invoke;
    v28[3] = &unk_1E5146990;
    objc_copyWeak(&v29, &location);
    v30 = v3;
    v7 = -[PXFeedHitTestResult primaryAction:](v5, "primaryAction:", v28);
    v25[0] = v6;
    v25[1] = 3221225472;
    v25[2] = __58__PXFeedSectionContentLayout_hitTestResultForSpriteIndex___block_invoke_2;
    v25[3] = &unk_1E51469B8;
    objc_copyWeak(&v26, &location);
    v27 = v3;
    v8 = -[PXFeedHitTestResult touchAction:](v5, "touchAction:", v25);
    v22[0] = v6;
    v22[1] = 3221225472;
    v22[2] = __58__PXFeedSectionContentLayout_hitTestResultForSpriteIndex___block_invoke_3;
    v22[3] = &unk_1E51469E0;
    objc_copyWeak(&v23, &location);
    v24 = v3;
    v9 = -[PXFeedHitTestResult hoverAction:](v5, "hoverAction:", v22);
    v19[0] = v6;
    v19[1] = 3221225472;
    v19[2] = __58__PXFeedSectionContentLayout_hitTestResultForSpriteIndex___block_invoke_4;
    v19[3] = &unk_1E5146A08;
    objc_copyWeak(&v20, &location);
    v21 = v3;
    v10 = -[PXFeedHitTestResult presentMenuAction:](v5, "presentMenuAction:", v19);
    v17 = 0u;
    v18 = 0u;
    -[PXFeedSectionContentLayout sectionIndexPath](self, "sectionIndexPath");
    *(_QWORD *)&v18 = v3;
    -[PXFeedSectionContentLayout dataSource](self, "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v17;
    v16[1] = v18;
    objc_msgSend(v11, "objectReferenceAtIndexPath:", v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = -[PXFeedHitTestResult objectReference:](v5, "objectReference:", v12);
    v15[0] = v17;
    v15[1] = v18;
    -[PXFeedHitTestResult setDataSourceIndexPath:](v5, "setDataSourceIndexPath:", v15);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
  return v5;
}

- (BOOL)_handlePrimaryActionForItemAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  char v8;
  _OWORD v10[2];
  __int128 v11;
  __int128 v12;

  v11 = 0u;
  v12 = 0u;
  -[PXFeedSectionContentLayout sectionIndexPath](self, "sectionIndexPath");
  *(_QWORD *)&v12 = a3;
  -[PXFeedSectionContentLayout viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionPerformer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFeedSectionContentLayout dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v11;
  v10[1] = v12;
  v8 = objc_msgSend(v6, "handlePrimaryActionOnItemAtIndexPath:inDataSource:", v10, v7);

  return v8;
}

- (id)_handleTouchForItemAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;

  -[PXGLayout sublayoutAtIndex:loadIfNeeded:](self, "sublayoutAtIndex:loadIfNeeded:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && self->_itemLayoutFactoryRespondsTo.setItemLayoutIsTouched)
  {
    -[PXFeedSectionContentLayout itemLayoutFactory](self, "itemLayoutFactory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setItemLayout:isTouched:", v4, 1);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __57__PXFeedSectionContentLayout__handleTouchForItemAtIndex___block_invoke;
    v9[3] = &unk_1E5148D08;
    v10 = v5;
    v11 = v4;
    v6 = v5;
    v7 = _Block_copy(v9);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_handleHoverForItemAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;

  -[PXGLayout sublayoutAtIndex:loadIfNeeded:](self, "sublayoutAtIndex:loadIfNeeded:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && self->_itemLayoutFactoryRespondsTo.setItemLayoutIsHovered)
  {
    -[PXFeedSectionContentLayout itemLayoutFactory](self, "itemLayoutFactory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setItemLayout:isHovered:", v4, 1);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __57__PXFeedSectionContentLayout__handleHoverForItemAtIndex___block_invoke;
    v9[3] = &unk_1E5148D08;
    v10 = v5;
    v11 = v4;
    v6 = v5;
    v7 = _Block_copy(v9);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_handlePresentMenuActionForIndex:(int64_t)a3 atLocation:(CGPoint)a4 inView:(id)a5
{
  double y;
  double x;
  id v9;
  void *v10;
  char v11;
  void *v12;

  y = a4.y;
  x = a4.x;
  v9 = a5;
  -[PXFeedSectionContentLayout itemLayoutFactory](self, "itemLayoutFactory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();
  if ((v11 & 1) != 0)
  {
    -[PXGLayout sublayoutAtIndex:loadIfNeeded:](self, "sublayoutAtIndex:loadIfNeeded:", a3, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "presentMenuForItemLayout:atLocation:inView:", v12, v9, x, y);

  }
  return v11 & 1;
}

- (void)enumerateVisibleAnchoringSpriteIndexesUsingBlock:(id)a3
{
  void (**v4)(id, uint64_t, uint64_t, char *);
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  _QWORD v17[8];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  int v21;
  _QWORD v22[4];

  v4 = (void (**)(id, uint64_t, uint64_t, char *))a3;
  -[PXGLayout visibleRect](self, "visibleRect");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  PXRectGetCenter();
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v22[3] = 0x7FEFFFFFFFFFFFFFLL;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = -1;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __79__PXFeedSectionContentLayout_enumerateVisibleAnchoringSpriteIndexesUsingBlock___block_invoke;
  v17[3] = &unk_1E5146A30;
  v17[6] = v13;
  v17[7] = v14;
  v17[4] = v22;
  v17[5] = &v18;
  -[PXGLayout enumerateLocalSpritesInRect:usingBlock:](self, "enumerateLocalSpritesInRect:usingBlock:", v17, v6, v8, v10, v12);
  v16 = 0;
  v15 = *((unsigned int *)v19 + 6);
  if ((_DWORD)v15 != -1)
    v4[2](v4, v15, 1, &v16);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(v22, 8);

}

- (id)objectReferenceForSpriteIndex:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  objc_super v8;
  _OWORD v9[2];
  __int128 v10;
  __int128 v11;

  v3 = *(_QWORD *)&a3;
  if (-[PXGLayout localNumberOfSprites](self, "localNumberOfSprites") <= a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)PXFeedSectionContentLayout;
    -[PXGLayout objectReferenceForSpriteIndex:](&v8, sel_objectReferenceForSpriteIndex_, v3);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0u;
    v11 = 0u;
    -[PXFeedSectionContentLayout sectionIndexPath](self, "sectionIndexPath");
    *(_QWORD *)&v11 = v3;
    -[PXFeedSectionContentLayout dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v10;
    v9[1] = v11;
    objc_msgSend(v5, "objectReferenceAtIndexPath:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
}

- (unsigned)spriteIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5
{
  return -[PXFeedSectionContentLayout sublayoutIndexForObjectReference:options:updatedObjectReference:](self, "sublayoutIndexForObjectReference:options:updatedObjectReference:", a3, a4, a5);
}

- (int64_t)sublayoutIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  int64_t v11;
  id v12;
  id v13;
  void *v15;
  int64x2_t v16;
  int64x2_t v17;
  int64x2_t v18;
  __int128 v19;

  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PXFeedSectionContentLayout dataSource](self, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectReferenceNearestToObjectReference:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    *(_QWORD *)&v19 = 0;
    if (v10)
    {
      if (v9)
        objc_msgSend(v9, "indexPathForObjectReference:", v10);
    }
    else
    {
      v18 = *(int64x2_t *)off_1E50B8778;
      v19 = *((_OWORD *)off_1E50B8778 + 1);
    }
    v11 = 0x7FFFFFFFFFFFFFFFLL;
    if (v18.i64[0] != *(_QWORD *)off_1E50B7E98)
    {
      -[PXFeedSectionContentLayout sectionIndexPath](self, "sectionIndexPath");
      if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(v18, v16), (int32x4_t)vceqq_s64(v17, vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL)))), 0xFuLL))) & 1) != 0)
      {
        v11 = v19;
        if (!v10)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeedSectionContentLayout.m"), 272, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("nearestObjectReference != nil"));

        }
        v12 = v10;

        v8 = v12;
      }
    }

  }
  else
  {
    v11 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v13 = objc_retainAutorelease(v8);
  *a5 = v13;

  return v11;
}

- (void)setDataSource:(id)a3 changeDetails:(id)a4
{
  PXSectionedDataSource *v7;
  PXSectionedDataSourceChangeDetails *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  PXSimpleIndexPath *p_sectionIndexPath;
  __int128 v13;
  __int128 v14;
  PXSectionedDataSource *dataSource;
  PXSectionedDataSource *v16;
  PXSectionedDataSourceChangeDetails *lastChangeDetails;
  _OWORD v18[2];
  uint8_t buf[32];
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  PXSectionedDataSourceChangeDetails *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = (PXSectionedDataSource *)a3;
  v8 = (PXSectionedDataSourceChangeDetails *)a4;
  PLStoryGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PXSectionedDataSource identifier](self->_dataSource, "identifier");
    *(_DWORD *)buf = 134219010;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 2048;
    *(_QWORD *)&buf[24] = v11;
    v20 = 2048;
    v21 = -[PXSectionedDataSource identifier](v7, "identifier");
    v22 = 2112;
    v23 = v8;
    _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, "[PXFeedSectionContentLayout] %p %@ ds:%lu->%lu changeDetails: %@", buf, 0x34u);

  }
  p_sectionIndexPath = &self->_sectionIndexPath;
  if (v8)
  {
    v13 = *(_OWORD *)&self->_sectionIndexPath.item;
    v18[0] = *(_OWORD *)&p_sectionIndexPath->dataSourceIdentifier;
    v18[1] = v13;
    -[PXSectionedDataSourceChangeDetails indexPathAfterApplyingChangesToIndexPath:hasIncrementalChanges:objectChanged:](v8, "indexPathAfterApplyingChangesToIndexPath:hasIncrementalChanges:objectChanged:", v18, 0, 0);
  }
  else
  {
    memset(buf, 0, sizeof(buf));
  }
  v14 = *(_OWORD *)&buf[16];
  *(_OWORD *)&p_sectionIndexPath->dataSourceIdentifier = *(_OWORD *)buf;
  *(_OWORD *)&self->_sectionIndexPath.item = v14;
  dataSource = self->_dataSource;
  self->_dataSource = v7;
  v16 = v7;

  lastChangeDetails = self->_lastChangeDetails;
  self->_lastChangeDetails = v8;

  -[PXFeedSectionContentLayout _invalidateFeedSublayouts](self, "_invalidateFeedSublayouts");
}

- (CGRect)decorationOverlayRectForSpriteIndex:(unsigned int)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v8;
  void *v9;
  uint64_t v10;
  float32x2_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  v3 = *MEMORY[0x1E0C9D628];
  v4 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  if (self->_itemLayoutFactoryRespondsTo.decorationOverlayAnchorSpriteIndexForItemLayout)
  {
    -[PXGLayout sublayoutAtIndex:loadIfNeeded:](self, "sublayoutAtIndex:loadIfNeeded:", a3, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[PXFeedSectionContentLayout itemLayoutFactory](self, "itemLayoutFactory");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "decorationOverlayAnchorSpriteIndexForItemLayout:", v8);

      objc_msgSend(v8, "geometryForSpriteAtIndex:", v10);
      v11 = vmul_f32(0, (float32x2_t)0x3F0000003F000000);
      -[PXGLayout convertRect:fromLayout:](self, "convertRect:fromLayout:", v8, 0.0 - v11.f32[0], 0.0 - v11.f32[1], 0.0, 0.0);
      v3 = v12;
      v4 = v13;
      v5 = v14;
      v6 = v15;
    }

  }
  v16 = v3;
  v17 = v4;
  v18 = v5;
  v19 = v6;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (id)itemPlacementControllerForItemReference:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (self->_itemLayoutFactoryRespondsTo.itemPlacementControllerForItemReferenceItemLayout)
  {
    -[PXFeedSectionContentLayout itemLayoutFactory](self, "itemLayoutFactory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __70__PXFeedSectionContentLayout_itemPlacementControllerForItemReference___block_invoke;
    v11[3] = &unk_1E5146A58;
    v12 = v6;
    v13 = v4;
    v14 = v5;
    v8 = v6;
    objc_msgSend(v7, "enumerateSublayoutsUsingBlock:", v11);

  }
  +[PXGMultiplexedItemPlacementController itemPlacementControllerForItemPlacementControllers:](PXGMultiplexedItemPlacementController, "itemPlacementControllerForItemPlacementControllers:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)willUpdate
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXFeedSectionContentLayout;
  -[PXGCompositeLayout willUpdate](&v5, sel_willUpdate);
  self->_updateFlags.willPerformUpdate = 1;
  if (self->_updateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXFeedSectionContentLayout willUpdate]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXFeedSectionContentLayout.m"), 319, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

  }
}

- (void)update
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.willPerformUpdate = 0;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXFeedSectionContentLayout update]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("PXFeedSectionContentLayout.m"), 323, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 8;
    if ((needsUpdate & 8) != 0)
    {
      p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFF7;
      -[PXFeedSectionContentLayout _updatePresentedRootLayoutOrientation](self, "_updatePresentedRootLayoutOrientation");
      if (!p_updateFlags->isPerformingUpdate)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXFeedSectionContentLayout update]");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("PXFeedSectionContentLayout.m"), 329, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

      }
    }
    v5 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 1uLL;
    if ((v5 & 1) != 0)
    {
      p_updateFlags->needsUpdate = v5 & 0xFFFFFFFFFFFFFFFELL;
      -[PXFeedSectionContentLayout _updateFeedSublayouts](self, "_updateFeedSublayouts");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXFeedSectionContentLayout update]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("PXFeedSectionContentLayout.m"), 332, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v6 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 2uLL;
    if ((v6 & 2) != 0)
    {
      p_updateFlags->needsUpdate = v6 & 0xFFFFFFFFFFFFFFFDLL;
      -[PXFeedSectionContentLayout _updateCompositionParameters](self, "_updateCompositionParameters");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXFeedSectionContentLayout update]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("PXFeedSectionContentLayout.m"), 335, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v7 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 4uLL;
    if ((v7 & 4) != 0)
    {
      p_updateFlags->needsUpdate = v7 & 0xFFFFFFFFFFFFFFFBLL;
      -[PXFeedSectionContentLayout _updateAutoplayControllerParameters](self, "_updateAutoplayControllerParameters");
      v7 = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXFeedSectionContentLayout update]");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("PXFeedSectionContentLayout.m"), 338, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

    }
  }
  v18.receiver = self;
  v18.super_class = (Class)PXFeedSectionContentLayout;
  -[PXGCompositeLayout update](&v18, sel_update);
}

- (void)didUpdate
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXFeedSectionContentLayout;
  -[PXGCompositeLayout didUpdate](&v5, sel_didUpdate);
  if (self->_updateFlags.willPerformUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXFeedSectionContentLayout didUpdate]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXFeedSectionContentLayout.m"), 344, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.willPerformUpdate"));

  }
}

- (void)_invalidatePresentedRootLayoutOrientation
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

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
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXFeedSectionContentLayout _invalidatePresentedRootLayoutOrientation]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXFeedSectionContentLayout.m"), 349, CFSTR("invalidating %lu after it already has been updated"), 8);

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

- (void)_updatePresentedRootLayoutOrientation
{
  void *v3;
  id v4;

  -[PXFeedSectionContentLayout viewModel](self, "viewModel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "spec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFeedSectionContentLayout setPresentedRootLayoutOrientation:](self, "setPresentedRootLayoutOrientation:", objc_msgSend(v3, "rootLayoutOrientation"));

}

- (void)setPresentedRootLayoutOrientation:(int64_t)a3
{
  if (self->_presentedRootLayoutOrientation != a3)
  {
    self->_presentedRootLayoutOrientation = a3;
    -[PXFeedSectionContentLayout _invalidateFeedSublayouts](self, "_invalidateFeedSublayouts");
  }
}

- (void)_invalidateFeedSublayouts
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

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
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXFeedSectionContentLayout _invalidateFeedSublayouts]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXFeedSectionContentLayout.m"), 369, CFSTR("invalidating %lu after it already has been updated"), 1);

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

- (void)_updateFeedSublayouts
{
  void *v4;
  uint64_t v5;
  PXSectionedDataSource *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  PXSectionedDataSourceChangeDetails *lastChangeDetails;
  int64_t v12;
  int64_t v13;
  id v14;
  NSObject *v15;
  _BOOL4 shouldReloadItemLayoutForChangedItemFromIndexPathInDataSourceToIndexPathInDataSource;
  _BOOL4 configureItemLayoutForChangedItemFromIndexPathInDataSourceToIndexPathInDataSource;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  int64_t v25;
  NSObject *v26;
  PXSectionedDataSource *presentedDataSource;
  void *v28;
  int64x2_t v29;
  void *v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  PXFeedSectionContentLayout *v35;
  id v36;
  PXSectionedDataSource *v37;
  id v38;
  id v39;
  _QWORD *v40;
  _BYTE *v41;
  BOOL v42;
  BOOL v43;
  _QWORD v44[4];
  __int128 v45;
  int64x2_t v46;
  __int128 v47;
  __int128 v48;
  uint8_t v49[4];
  PXFeedSectionContentLayout *v50;
  __int16 v51;
  id v52;
  _BYTE buf[24];
  void *v54;
  _OWORD v55[2];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  -[PXFeedSectionContentLayout dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  -[PXFeedSectionContentLayout sectionIndexPath](self, "sectionIndexPath");
  if (objc_msgSend(v4, "identifier"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeedSectionContentLayout.m"), 375, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sectionIndexPath.dataSourceIdentifier == dataSource.identifier"));

  }
  v5 = *((_QWORD *)&v47 + 1);
  v6 = self->_presentedDataSource;
  PLStoryGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PXSectionedDataSource identifier](v6, "identifier");
    v10 = objc_msgSend(v4, "identifier");
    lastChangeDetails = self->_lastChangeDetails;
    *(_DWORD *)buf = 134219266;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2048;
    v54 = (void *)*((_QWORD *)&v47 + 1);
    LOWORD(v55[0]) = 2048;
    *(_QWORD *)((char *)v55 + 2) = v9;
    WORD5(v55[0]) = 2048;
    *(_QWORD *)((char *)v55 + 12) = v10;
    WORD2(v55[1]) = 2112;
    *(_QWORD *)((char *)&v55[1] + 6) = lastChangeDetails;
    _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEFAULT, "[PXFeedSectionContentLayout] %p %@ section:%li ds:%lu->%lu lastChangeDetails: %@", buf, 0x3Eu);

  }
  v12 = -[PXSectionedDataSourceChangeDetails fromDataSourceIdentifier](self->_lastChangeDetails, "fromDataSourceIdentifier");
  if (v12 == -[PXSectionedDataSource identifier](v6, "identifier")
    && (v13 = -[PXSectionedDataSourceChangeDetails toDataSourceIdentifier](self->_lastChangeDetails, "toDataSourceIdentifier"), v13 == objc_msgSend(v4, "identifier")))
  {
    -[PXSectionedDataSourceChangeDetails itemChangesInSection:](self->_lastChangeDetails, "itemChangesInSection:", *((_QWORD *)&v47 + 1));
    v14 = (id)objc_claimAutoreleasedReturnValue();
    PLStoryGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v14;
      _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_DEFAULT, "[PXFeedSectionContentLayout] %p sectionChangeDetails: %@", buf, 0x16u);
    }

    shouldReloadItemLayoutForChangedItemFromIndexPathInDataSourceToIndexPathInDataSource = self->_itemLayoutFactoryRespondsTo.shouldReloadItemLayoutForChangedItemFromIndexPathInDataSourceToIndexPathInDataSource;
    configureItemLayoutForChangedItemFromIndexPathInDataSourceToIndexPathInDataSource = self->_itemLayoutFactoryRespondsTo.configureItemLayoutForChangedItemFromIndexPathInDataSourceToIndexPathInDataSource;
    if (configureItemLayoutForChangedItemFromIndexPathInDataSourceToIndexPathInDataSource
      || shouldReloadItemLayoutForChangedItemFromIndexPathInDataSourceToIndexPathInDataSource)
    {
      v32 = objc_alloc_init(MEMORY[0x1E0CB3788]);
      -[PXFeedSectionContentLayout itemLayoutFactory](self, "itemLayoutFactory");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x4010000000;
      v54 = &unk_1A7E74EE7;
      memset(v55, 0, sizeof(v55));
      *(_QWORD *)&v55[0] = -[PXSectionedDataSource identifier](v6, "identifier");
      *((_QWORD *)&v55[0] + 1) = v5;
      v29 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
      v55[1] = v29;
      v44[0] = 0;
      v44[1] = v44;
      v44[2] = 0x4010000000;
      v44[3] = &unk_1A7E74EE7;
      v45 = 0u;
      v46 = 0u;
      *(_QWORD *)&v45 = objc_msgSend(v4, "identifier");
      *((_QWORD *)&v45 + 1) = v5;
      v46 = v29;
      objc_msgSend(v14, "changedIndexes");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __51__PXFeedSectionContentLayout__updateFeedSublayouts__block_invoke;
      v33[3] = &unk_1E5146A80;
      v14 = v14;
      v34 = v14;
      v35 = self;
      v40 = v44;
      v41 = buf;
      v42 = shouldReloadItemLayoutForChangedItemFromIndexPathInDataSourceToIndexPathInDataSource;
      v31 = v30;
      v36 = v31;
      v37 = v6;
      v38 = v4;
      v19 = v32;
      v39 = v19;
      v43 = configureItemLayoutForChangedItemFromIndexPathInDataSourceToIndexPathInDataSource;
      objc_msgSend(v18, "enumerateIndexesUsingBlock:", v33);

      if (objc_msgSend(v19, "count"))
      {
        PLStoryGetLog();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v49 = 134218242;
          v50 = self;
          v51 = 2112;
          v52 = v19;
          _os_log_impl(&dword_1A6789000, v20, OS_LOG_TYPE_DEFAULT, "[PXFeedSectionContentLayout] %p indexesToReload: %@", v49, 0x16u);
        }

        v21 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B1608), "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:", v19, v19, 0, 0, 0);
        objc_msgSend(v14, "changeDetailsByAddingChangeDetails:", v21);
        v22 = objc_claimAutoreleasedReturnValue();

        v14 = (id)v22;
      }

      _Block_object_dispose(v44, 8);
      _Block_object_dispose(buf, 8);

    }
  }
  else
  {
    v14 = 0;
  }
  v23 = objc_msgSend(v4, "numberOfItemsInSection:", v5);
  PLStoryGetLog();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = -[PXGLayout numberOfSublayouts](self, "numberOfSublayouts");
    *(_DWORD *)buf = 134218496;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v25;
    *(_WORD *)&buf[22] = 2048;
    v54 = (void *)v23;
    _os_log_impl(&dword_1A6789000, v24, OS_LOG_TYPE_DEFAULT, "[PXFeedSectionContentLayout] %p numberOfSublayouts: %li->%li", buf, 0x20u);
  }

  -[PXGLayout applySublayoutChangeDetails:countAfterChanges:sublayoutProvider:](self, "applySublayoutChangeDetails:countAfterChanges:sublayoutProvider:", v14, v23, self);
  -[PXGLayout applySpriteChangeDetails:countAfterChanges:initialState:modifyState:](self, "applySpriteChangeDetails:countAfterChanges:initialState:modifyState:", v14, v23, 0, 0);
  objc_storeStrong((id *)&self->_presentedDataSource, v4);
  PLStoryGetLog();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    presentedDataSource = self->_presentedDataSource;
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = presentedDataSource;
    _os_log_impl(&dword_1A6789000, v26, OS_LOG_TYPE_DEFAULT, "[PXFeedSectionContentLayout] %p presentedDataSource: %@", buf, 0x16u);
  }

}

- (void)_updateFeedSprites
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int32x2_t v7;
  uint64_t v8;
  int32x2_t v9;
  _QWORD v10[5];
  int32x4_t v11;

  -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = objc_msgSend(v3, "geometries");

  -[PXFeedSectionContentLayout viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "spec");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemCornerRadius");
  *(float *)v7.i32 = *(double *)v7.i32;
  v9 = v7;

  v8 = -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__PXFeedSectionContentLayout__updateFeedSprites__block_invoke;
  v10[3] = &__block_descriptor_56_e101_v40__0__PXGSpriteIndexRange_II_8_______ddd__16____f_________ffff__4f___ffffSCf____4___24____CCfqSC_32l;
  v10[4] = v4;
  v11 = vdupq_lane_s32(v9, 0);
  -[PXGLayout modifySpritesInRange:state:](self, "modifySpritesInRange:state:", v8 << 32, v10);
}

- (void)_invalidateCompositionParameters
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

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
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXFeedSectionContentLayout _invalidateCompositionParameters]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXFeedSectionContentLayout.m"), 443, CFSTR("invalidating %lu after it already has been updated"), 2);

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

- (void)_updateCompositionParameters
{
  void *v3;
  void *v4;
  id v5;

  -[PXFeedSectionContentLayout viewModel](self, "viewModel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "spec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGCompositeLayout composition](self, "composition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSpec:", v3);

}

- (void)_invalidateAutoplayControllerParameters
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

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
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXFeedSectionContentLayout _invalidateAutoplayControllerParameters]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXFeedSectionContentLayout.m"), 451, CFSTR("invalidating %lu after it already has been updated"), 4);

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

- (void)_updateAutoplayControllerParameters
{
  uint64_t v3;
  void *v4;
  id v5;

  -[PXFeedSectionContentLayout viewModel](self, "viewModel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v5, "isActive");
  -[PXFeedSectionContentLayout autoplayController](self, "autoplayController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsContainerLayoutVisible:", v3);

}

- (id)layout:(id)a3 createSublayoutAtIndex:(int64_t)a4
{
  void *v7;
  void *v8;
  BOOL v9;
  id v11;
  double *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v20;
  _OWORD v21[2];
  id v22;
  __int128 v23;
  __int128 v24;

  -[PXFeedSectionContentLayout viewModel](self, "viewModel", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFeedSectionContentLayout dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  -[PXFeedSectionContentLayout sectionIndexPath](self, "sectionIndexPath");
  if (*(_QWORD *)off_1E50B7E98)
    v9 = *((_QWORD *)&v23 + 1) == 0x7FFFFFFFFFFFFFFFLL;
  else
    v9 = 1;
  if (v9 || (_QWORD)v24 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeedSectionContentLayout.m"), 468, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PXSimpleIndexPathIsSection(indexPath)"));

  }
  *(_QWORD *)&v24 = a4;
  -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12 = (double *)(objc_msgSend(v11, "geometries") + 136 * a4);
  v13 = *v12;
  v14 = v12[1];

  -[PXFeedSectionContentLayout itemLayoutFactory](self, "itemLayoutFactory");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v21[0] = v23;
  v21[1] = v24;
  objc_msgSend(v15, "createLayoutForFeedItemAtIndexPath:inDataSource:viewModel:initialReferenceSize:thumbnailAsset:", v21, v8, v7, &v22, v13, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v22;

  if (v17)
  {
    -[PXFeedSectionContentLayout autoplayController](self, "autoplayController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addItemLayout:withDisplayAsset:", v16, v17);

  }
  return v16;
}

- (id)layout:(id)a3 navigationObjectReferenceForSublayoutAtIndex:(int64_t)a4
{
  return 0;
}

- (void)willRemoveSublayout:(id)a3 atIndex:(int64_t)a4 flags:(unint64_t)a5
{
  id v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PXFeedSectionContentLayout;
  v8 = a3;
  -[PXGCompositeLayout willRemoveSublayout:atIndex:flags:](&v10, sel_willRemoveSublayout_atIndex_flags_, v8, a4, a5);
  -[PXFeedSectionContentLayout autoplayController](self, "autoplayController", v10.receiver, v10.super_class);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeItemLayout:", v8);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  id v11;

  v6 = a4;
  v9 = a3;
  if ((void *)ViewModelObservationContext_291627 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeedSectionContentLayout.m"), 500, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v11 = v9;
  if ((v6 & 8) != 0)
  {
    -[PXFeedSectionContentLayout _invalidateCompositionParameters](self, "_invalidateCompositionParameters");
    -[PXFeedSectionContentLayout _invalidatePresentedRootLayoutOrientation](self, "_invalidatePresentedRootLayoutOrientation");
    v9 = v11;
  }
  if ((v6 & 1) != 0)
  {
    -[PXFeedSectionContentLayout _invalidateAutoplayControllerParameters](self, "_invalidateAutoplayControllerParameters");
    v9 = v11;
  }

}

- (BOOL)axShouldSearchLeafsInSubgroups
{
  return 0;
}

- (id)axSpriteIndexes
{
  uint64_t v2;

  v2 = -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites");
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", 0, v2);
}

- (unsigned)axSpriteIndexClosestToSpriteIndex:(unsigned int)a3 inDirection:(unint64_t)a4
{
  uint64_t v5;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  unsigned int v11;

  v5 = *(_QWORD *)&a3;
  -[PXFeedSectionContentLayout viewModel](self, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "spec");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "numberOfColumns");

  if (!v9)
    return -[PXGLayout axSpriteIndexClosestToSpriteIndexDefaultImplementation:inDirection:](self, "axSpriteIndexClosestToSpriteIndexDefaultImplementation:inDirection:", v5, a4);
  v10 = v5 % v9;
  switch(a4)
  {
    case 1uLL:
      if (v9 > v5)
        v11 = -1;
      else
        v11 = v5 - v9;
      break;
    case 2uLL:
      v11 = v9 + v5;
      break;
    case 3uLL:
      if (v10)
        v11 = v5 - 1;
      else
        v11 = -1;
      break;
    case 4uLL:
      if ((v10 + 1) < v9)
        v11 = v5 + 1;
      else
        v11 = -1;
      break;
    case 5uLL:
      v11 = v5 + 1;
      break;
    case 6uLL:
      v11 = v5 - 1;
      break;
    default:
      v11 = -1;
      break;
  }
  if (v11 >= -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites"))
    return -1;
  else
    return v11;
}

- (unint64_t)axFocusabilityForSpriteAtIndex:(unsigned int)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;

  -[PXFeedSectionContentLayout viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "spec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "wantsFirstItemFullscreen");

  if (((a3 == 0) & v6) != 0)
    return 1;
  else
    return 2;
}

- (void)axGroup:(id)a3 didChange:(unint64_t)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  objc_super v17;
  uint64_t v18;
  int64_t v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a5;
  v10 = v9;
  if ((a4 & 2) == 0)
  {
    v11 = 0;
    if ((a4 & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  v21 = 0;
  PXGAXGetFocusFromAndToInfosForUserInfo(v9, 0, &v21);
  v11 = v21;
  if ((a4 & 4) != 0)
  {
LABEL_5:
    v20 = v11;
    PXGAXGetSelectionFromAndToInfosForUserInfo(v10, &v20);
    v12 = v20;

    v11 = v12;
  }
LABEL_6:
  if (v11)
  {
    objc_msgSend(v11, "axContainingGroup");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGLayout axGroup](self, "axGroup");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13 == v14)
    {
      v19 = -[PXFeedSectionContentLayout itemForSpriteIndex:](self, "itemForSpriteIndex:", objc_msgSend(v11, "spriteIndex"));
      -[PXFeedSectionContentLayout dataSource](self, "dataSource");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "identifier");

      v18 = v16;
      PXGAXAddSimpleIndexPathGroupChangeUserInfo(v10, &v18, 0, &v19);
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)PXFeedSectionContentLayout;
  -[PXGCompositeLayout axGroup:didChange:userInfo:](&v17, sel_axGroup_didChange_userInfo_, v8, a4, v10);

}

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  _QWORD *v10;
  _QWORD v11[4];
  __int128 v12;
  __int128 v13;

  v4 = a3;
  -[PXFeedSectionContentLayout itemLayoutFactory](self, "itemLayoutFactory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x4010000000;
    v11[3] = &unk_1A7E74EE7;
    v12 = 0u;
    v13 = 0u;
    -[PXFeedSectionContentLayout sectionIndexPath](self, "sectionIndexPath");
    -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __72__PXFeedSectionContentLayout_collectTapToRadarDiagnosticsIntoContainer___block_invoke;
    v7[3] = &unk_1E5146AC8;
    v10 = v11;
    v8 = v5;
    v9 = v4;
    objc_msgSend(v6, "enumerateSublayoutsUsingBlock:", v7);

    _Block_object_dispose(v11, 8);
  }

}

- (PXFeedViewModel)viewModel
{
  return self->_viewModel;
}

- (PXSectionedDataSource)dataSource
{
  return self->_dataSource;
}

- (PXSimpleIndexPath)sectionIndexPath
{
  __int128 v3;

  v3 = *(_OWORD *)&self[34].section;
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&self[33].subitem;
  *(_OWORD *)&retstr->item = v3;
  return self;
}

- (PXFeedItemLayoutFactory)itemLayoutFactory
{
  return self->_itemLayoutFactory;
}

- (PXFeedAutoplayController)autoplayController
{
  return self->_autoplayController;
}

- (int64_t)presentedRootLayoutOrientation
{
  return self->_presentedRootLayoutOrientation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoplayController, 0);
  objc_storeStrong((id *)&self->_itemLayoutFactory, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_presentedDataSource, 0);
  objc_storeStrong((id *)&self->_lastChangeDetails, 0);
}

uint64_t __72__PXFeedSectionContentLayout_collectTapToRadarDiagnosticsIntoContainer___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  __int128 v6;
  _OWORD v8[2];

  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 48) = a2;
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[6] + 8);
  v5 = (void *)a1[4];
  v6 = *(_OWORD *)(v4 + 48);
  v8[0] = *(_OWORD *)(v4 + 32);
  v8[1] = v6;
  return objc_msgSend(v5, "collectTapToRadarDiagnosticsForItemLayout:indexPath:intoContainer:", a3, v8, v3);
}

void __48__PXFeedSectionContentLayout__updateFeedSprites__block_invoke(uint64_t a1, unint64_t a2, float32x2_t *a3, _OWORD *a4, uint64_t a5)
{
  unint64_t v5;
  unsigned int v7;
  _OWORD *v9;
  _BYTE *v10;
  float32x2_t *v11;
  double *v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat MidX;
  CGFloat MidY;
  CGFloat Height;
  float64x2_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  CGFloat Width;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  v5 = HIDWORD(a2);
  if (HIDWORD(a2))
  {
    v7 = a2;
    v9 = (_OWORD *)(a1 + 40);
    v10 = (_BYTE *)(a5 + 34);
    v11 = a3 + 2;
    v29 = *(_OWORD *)off_1E50B83A0;
    v30 = *((_OWORD *)off_1E50B83A0 + 1);
    v27 = *((_OWORD *)off_1E50B83A0 + 4);
    v28 = *((_OWORD *)off_1E50B83A0 + 5);
    v25 = *((_OWORD *)off_1E50B83A0 + 2);
    v26 = *((_OWORD *)off_1E50B83A0 + 3);
    v23 = *((_OWORD *)off_1E50B83A0 + 8);
    v24 = *((_OWORD *)off_1E50B83A0 + 9);
    v21 = *((_OWORD *)off_1E50B83A0 + 6);
    v22 = *((_OWORD *)off_1E50B83A0 + 7);
    do
    {
      v12 = (double *)(*(_QWORD *)(a1 + 32) + 136 * v7);
      v13 = v12[6];
      v14 = v12[7];
      v15 = v12[4];
      v16 = v12[5];
      v32.origin.x = v13;
      v32.origin.y = v14;
      v32.size.width = v15;
      v32.size.height = v16;
      MidX = CGRectGetMidX(v32);
      v33.origin.x = v13;
      v33.origin.y = v14;
      v33.size.width = v15;
      v33.size.height = v16;
      MidY = CGRectGetMidY(v33);
      v34.origin.x = v13;
      v34.origin.y = v14;
      v34.size.width = v15;
      v34.size.height = v16;
      Width = CGRectGetWidth(v34);
      v35.origin.x = v13;
      v35.origin.y = v14;
      v35.size.width = v15;
      v35.size.height = v16;
      Height = CGRectGetHeight(v35);
      v20.f64[0] = Width;
      v20.f64[1] = Height;
      *(CGFloat *)&v11[-2] = MidX;
      *(CGFloat *)&v11[-1] = MidY;
      *v11 = (float32x2_t)0xC000000000000000;
      v11[1] = vcvt_f32_f64(v20);
      *a4 = v29;
      a4[1] = v30;
      a4[4] = v27;
      a4[5] = v28;
      a4[2] = v25;
      a4[3] = v26;
      a4[8] = v23;
      a4[9] = v24;
      a4[6] = v21;
      a4[7] = v22;
      *(_OWORD *)((char *)a4 + 36) = *v9;
      ++v7;
      *(v10 - 33) = 0;
      *v10 = 4;
      v10 += 40;
      v11 += 4;
      a4 += 10;
      --v5;
    }
    while (v5);
  }
}

void __51__PXFeedSectionContentLayout__updateFeedSublayouts__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;

  v4 = objc_msgSend(*(id *)(a1 + 32), "indexAfterRevertingChangesFromIndex:", a2);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = v4;
    objc_msgSend(*(id *)(a1 + 40), "sublayoutAtIndex:loadIfNeeded:", v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 48) = a2;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 48) = v5;
      if (!*(_BYTE *)(a1 + 96))
        goto LABEL_11;
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
      v8 = *(void **)(a1 + 48);
      v9 = *(_QWORD *)(a1 + 56);
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      v11 = *(_QWORD *)(a1 + 64);
      v12 = *(_OWORD *)(v7 + 48);
      v23 = *(_OWORD *)(v7 + 32);
      v24 = v12;
      v13 = *(_OWORD *)(v10 + 48);
      v21 = *(_OWORD *)(v10 + 32);
      v22 = v13;
      if (objc_msgSend(v8, "shouldReloadItemLayout:forChangedItemFromIndexPath:inDataSource:toIndexPath:inDataSource:", v6, &v23, v9, &v21, v11))
      {
        objc_msgSend(*(id *)(a1 + 72), "addIndex:", a2);
      }
      else
      {
LABEL_11:
        if (*(_BYTE *)(a1 + 97))
        {
          v14 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
          v15 = *(void **)(a1 + 48);
          v16 = *(_QWORD *)(a1 + 56);
          v17 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
          v18 = *(_QWORD *)(a1 + 64);
          v19 = *(_OWORD *)(v14 + 48);
          v23 = *(_OWORD *)(v14 + 32);
          v24 = v19;
          v20 = *(_OWORD *)(v17 + 48);
          v21 = *(_OWORD *)(v17 + 32);
          v22 = v20;
          objc_msgSend(v15, "configureItemLayout:forChangedItemFromIndexPath:inDataSource:toIndexPath:inDataSource:", v6, &v23, v16, &v21, v18);
        }
      }
    }

  }
}

void __70__PXFeedSectionContentLayout_itemPlacementControllerForItemReference___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "itemPlacementControllerForItemReference:itemLayout:", *(_QWORD *)(a1 + 40), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v4);
    v4 = v5;
  }

}

uint64_t __79__PXFeedSectionContentLayout_enumerateVisibleAnchoringSpriteIndexesUsingBlock___block_invoke(uint64_t a1, int a2)
{
  uint64_t result;
  double v5;
  uint64_t v6;

  PXRectWithCenterAndSize();
  PXRectGetCenter();
  result = PXDistanceBetweenPoints();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v5 < *(double *)(v6 + 24))
  {
    *(double *)(v6 + 24) = v5;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  }
  return result;
}

uint64_t __57__PXFeedSectionContentLayout__handleHoverForItemAtIndex___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setItemLayout:isHovered:", *(_QWORD *)(a1 + 40), 0);
}

uint64_t __57__PXFeedSectionContentLayout__handleTouchForItemAtIndex___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setItemLayout:isTouched:", *(_QWORD *)(a1 + 40), 0);
}

uint64_t __58__PXFeedSectionContentLayout_hitTestResultForSpriteIndex___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "_handlePrimaryActionForItemAtIndex:", *(unsigned int *)(a1 + 40));

  return v3;
}

id __58__PXFeedSectionContentLayout_hitTestResultForSpriteIndex___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleTouchForItemAtIndex:", *(unsigned int *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __58__PXFeedSectionContentLayout_hitTestResultForSpriteIndex___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleHoverForItemAtIndex:", *(unsigned int *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __58__PXFeedSectionContentLayout_hitTestResultForSpriteIndex___block_invoke_4(uint64_t a1, void *a2, double a3, double a4)
{
  id *v7;
  id v8;
  id WeakRetained;
  uint64_t v10;

  v7 = (id *)(a1 + 32);
  v8 = a2;
  WeakRetained = objc_loadWeakRetained(v7);
  v10 = objc_msgSend(WeakRetained, "_handlePresentMenuActionForIndex:atLocation:inView:", *(unsigned int *)(a1 + 40), v8, a3, a4);

  return v10;
}

uint64_t __76__PXFeedSectionContentLayout_initWithViewModel_dataSource_sectionIndexPath___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4)
{
  void *v4;
  __int128 v5;
  _OWORD v7[3];

  v4 = *(void **)(a1 + 32);
  v5 = a4[1];
  v7[0] = *a4;
  v7[1] = v5;
  v7[2] = a4[2];
  return objc_msgSend(v4, "setItemLayout:shouldAutoplayContent:videoTimeRange:", a2, a3, v7);
}

@end
