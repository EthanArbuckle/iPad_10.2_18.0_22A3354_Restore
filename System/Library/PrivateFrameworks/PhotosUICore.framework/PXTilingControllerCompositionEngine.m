@implementation PXTilingControllerCompositionEngine

- (PXTilingControllerCompositionEngine)init
{
  return (PXTilingControllerCompositionEngine *)-[PXTilingControllerCompositionEngine _initWithScrollController:](self, "_initWithScrollController:", 0);
}

- (id)_initWithScrollController:(id)a3
{
  id v5;
  PXTilingControllerCompositionEngine *v6;
  PXTilingControllerCompositionEngine *v7;
  id v8;
  id WeakRetained;
  uint64_t v10;
  NSHashTable *tilingControllers;
  uint64_t v12;
  NSHashTable *compositions;
  PXTilingControllerDefaultComposition *v14;
  PXTilingControllerDefaultComposition *defaultComposition;
  uint64_t v16;
  NSMutableArray *invalidationContexts;
  uint64_t v18;
  NSMutableArray *tilingControllersRequestingFocus;
  void *v21;
  objc_super v22;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXTilingControllerCompositionEngine.m"), 58, CFSTR("missing scroll controller"));

  }
  v22.receiver = self;
  v22.super_class = (Class)PXTilingControllerCompositionEngine;
  v6 = -[PXTilingControllerCompositionEngine init](&v22, sel_init);
  v7 = v6;
  if (v6)
  {
    v8 = objc_storeWeak((id *)&v6->__scrollController, v5);
    objc_msgSend(v5, "setUpdateDelegate:", v7);

    WeakRetained = objc_loadWeakRetained((id *)&v7->__scrollController);
    objc_msgSend(WeakRetained, "setRespectsContentZOrder:", 1);

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v10 = objc_claimAutoreleasedReturnValue();
    tilingControllers = v7->__tilingControllers;
    v7->__tilingControllers = (NSHashTable *)v10;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v12 = objc_claimAutoreleasedReturnValue();
    compositions = v7->__compositions;
    v7->__compositions = (NSHashTable *)v12;

    v14 = objc_alloc_init(PXTilingControllerDefaultComposition);
    defaultComposition = v7->__defaultComposition;
    v7->__defaultComposition = v14;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = objc_claimAutoreleasedReturnValue();
    invalidationContexts = v7->__invalidationContexts;
    v7->__invalidationContexts = (NSMutableArray *)v16;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = objc_claimAutoreleasedReturnValue();
    tilingControllersRequestingFocus = v7->__tilingControllersRequestingFocus;
    v7->__tilingControllersRequestingFocus = (NSMutableArray *)v18;

  }
  return v7;
}

- (void)registerTilingController:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(v5, "observer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXTilingControllerCompositionEngine.m"), 74, CFSTR("unexpected tiling controller observer"));

  }
  objc_msgSend(v5, "setObserver:", self);
  -[PXTilingControllerCompositionEngine _tilingControllers](self, "_tilingControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v5);

  -[PXTilingControllerCompositionEngine _invalidateComposition](self, "_invalidateComposition");
}

- (void)unregisterTilingController:(id)a3
{
  id v5;
  PXTilingControllerCompositionEngine *v6;
  void *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(v5, "observer");
  v6 = (PXTilingControllerCompositionEngine *)objc_claimAutoreleasedReturnValue();

  if (v6 != self)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXTilingControllerCompositionEngine.m"), 81, CFSTR("unexpected tiling controller observer"));

  }
  objc_msgSend(v5, "setObserver:", 0);
  -[PXTilingControllerCompositionEngine _tilingControllers](self, "_tilingControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", v5);

  -[PXTilingControllerCompositionEngine _invalidateComposition](self, "_invalidateComposition");
}

- (void)registerComposition:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(v5, "observer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXTilingControllerCompositionEngine.m"), 88, CFSTR("unexpected composition observer"));

  }
  objc_msgSend(v5, "setObserver:", self);
  -[PXTilingControllerCompositionEngine _compositions](self, "_compositions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v5);

  -[PXTilingControllerCompositionEngine _invalidateComposition](self, "_invalidateComposition");
}

- (void)unregisterComposition:(id)a3
{
  id v5;
  PXTilingControllerCompositionEngine *v6;
  void *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(v5, "observer");
  v6 = (PXTilingControllerCompositionEngine *)objc_claimAutoreleasedReturnValue();

  if (v6 != self)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXTilingControllerCompositionEngine.m"), 95, CFSTR("unexpected composition observer"));

  }
  objc_msgSend(v5, "setObserver:", 0);
  -[PXTilingControllerCompositionEngine _compositions](self, "_compositions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", v5);

  -[PXTilingControllerCompositionEngine _invalidateComposition](self, "_invalidateComposition");
}

- (void)_setReferenceSize:(CGSize)a3
{
  if (a3.width != self->__referenceSize.width || a3.height != self->__referenceSize.height)
  {
    self->__referenceSize = a3;
    -[PXTilingControllerCompositionEngine _invalidateComposition](self, "_invalidateComposition");
  }
}

- (void)_setContentInset:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  if ((PXEdgeInsetsEqualToEdgeInsets() & 1) == 0)
  {
    self->__contentInset.top = top;
    self->__contentInset.left = left;
    self->__contentInset.bottom = bottom;
    self->__contentInset.right = right;
    -[PXTilingControllerCompositionEngine _invalidateComposition](self, "_invalidateComposition");
  }
}

- (void)_performChanges:(id)a3
{
  _BOOL4 isPerformingChanges;
  void (*v5)(void);
  id v6;
  void (**v7)(_QWORD);

  isPerformingChanges = self->_isPerformingChanges;
  self->_isPerformingChanges = 1;
  if (isPerformingChanges)
  {
    v5 = (void (*)(void))*((_QWORD *)a3 + 2);
    v6 = a3;
    v5();

    self->_isPerformingChanges = 1;
  }
  else
  {
    v7 = (void (**)(_QWORD))a3;
    -[PXTilingControllerCompositionEngine _beginUpdate](self, "_beginUpdate");
    v7[2](v7);

    self->_isPerformingChanges = 0;
    -[PXTilingControllerCompositionEngine _endUpdate](self, "_endUpdate");
  }
}

- (void)_beginUpdate
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[PXTilingControllerCompositionEngine _tilingControllers](self, "_tilingControllers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "beginUpdate");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_endUpdate
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[PXTilingControllerCompositionEngine _updateScrollControllerMetricsIfNeeded](self, "_updateScrollControllerMetricsIfNeeded");
  -[PXTilingControllerCompositionEngine _updateCompositionIfNeeded](self, "_updateCompositionIfNeeded");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PXTilingControllerCompositionEngine _tilingControllers](self, "_tilingControllers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v9, "updateMetrics");
        objc_msgSend(v9, "updateLayout");
        objc_msgSend(v9, "endUpdate");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  if (-[PXTilingControllerCompositionEngine _needsUpdate](self, "_needsUpdate"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXTilingControllerCompositionEngine.m"), 149, CFSTR("updates still needed after an update cycle"));

  }
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.scrollControllerMetrics || self->_needsUpdateFlags.composition;
}

- (void)_invalidateScrollControllerMetrics
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  self->_needsUpdateFlags.scrollControllerMetrics = 1;
  -[PXTilingControllerCompositionEngine _setNeedsUpdate](self, "_setNeedsUpdate");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  -[PXTilingControllerCompositionEngine _tilingControllers](self, "_tilingControllers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "invalidateScrollControllerMetrics");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_updateScrollControllerMetricsIfNeeded
{
  double v3;
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
  id v15;

  if (self->_needsUpdateFlags.scrollControllerMetrics)
  {
    self->_needsUpdateFlags.scrollControllerMetrics = 0;
    -[PXTilingControllerCompositionEngine _scrollController](self, "_scrollController");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "referenceSize");
    v4 = v3;
    v6 = v5;
    objc_msgSend(v15, "contentInset");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    -[PXTilingControllerCompositionEngine _setReferenceSize:](self, "_setReferenceSize:", v4, v6);
    -[PXTilingControllerCompositionEngine _setContentInset:](self, "_setContentInset:", v8, v10, v12, v14);

  }
}

- (void)_invalidateComposition
{
  self->_needsUpdateFlags.composition = 1;
  -[PXTilingControllerCompositionEngine _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (BOOL)_updateCompositionIfNeeded
{
  _BOOL4 composition;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  BOOL isUpdatingComposition;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  composition = self->_needsUpdateFlags.composition;
  if (!self->_needsUpdateFlags.composition)
    return composition;
  self->_needsUpdateFlags.composition = 0;
  -[PXTilingControllerCompositionEngine _composition](self, "_composition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXTilingControllerCompositionEngine _tilingControllers](self, "_tilingControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXTilingControllerCompositionEngine _compositions](self, "_compositions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXTilingControllerCompositionEngine _compositions](self, "_compositions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", v5);

  if ((v11 & 1) == 0)
  {

    goto LABEL_6;
  }
  if (!v5)
  {
LABEL_6:
    objc_msgSend(v9, "anyObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      -[PXTilingControllerCompositionEngine _defaultComposition](self, "_defaultComposition");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  objc_msgSend(v5, "tilingControllers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToSet:", v7);

  if ((v13 & 1) == 0)
  {
    -[PXTilingControllerCompositionEngine _defaultComposition](self, "_defaultComposition");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 == v14)
    {
      -[PXTilingControllerCompositionEngine _defaultComposition](self, "_defaultComposition");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setTilingControllers:", v7);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXTilingControllerCompositionEngine.m"), 216, CFSTR("composition doesn't include all tiling controllers"));
    }

  }
  objc_msgSend(v5, "setInput:", self);
  objc_msgSend(v5, "setOutput:", self);
  isUpdatingComposition = self->_isUpdatingComposition;
  self->_isUpdatingComposition = 1;
  -[PXTilingControllerCompositionEngine _invalidationContexts](self, "_invalidationContexts");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v19 = v7;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v37;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v37 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v23++), "setCompositionInvalidationContexts:", v18);
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v21);
  }

  objc_msgSend(v5, "updateComposition");
  -[PXTilingControllerCompositionEngine _invalidationContexts](self, "_invalidationContexts");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "removeAllObjects");

  -[PXTilingControllerCompositionEngine _tilingControllersRequestingFocus](self, "_tilingControllersRequestingFocus");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "removeAllObjects");

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v26 = v19;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v33;
    do
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v33 != v29)
          objc_enumerationMutation(v26);
        objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v30++), "setCompositionInvalidationContexts:", 0, (_QWORD)v32);
      }
      while (v28 != v30);
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v28);
  }

  self->_isUpdatingComposition = isUpdatingComposition;
  return composition;
}

- (void)px_scrollControllerDidUpdate:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __68__PXTilingControllerCompositionEngine_px_scrollControllerDidUpdate___block_invoke;
  v3[3] = &unk_1E5149198;
  v3[4] = self;
  -[PXTilingControllerCompositionEngine _performChanges:](self, "_performChanges:", v3);
}

- (void)setTilingControllerNeedsUpdate:(id)a3
{
  id v3;

  -[PXTilingControllerCompositionEngine _scrollController](self, "_scrollController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsUpdate");

}

- (void)tilingController:(id)a3 invalidatedWithContext:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  if (!self->_isUpdatingComposition)
  {
    v8 = v6;
    if (a4 == 1)
    {
      -[PXTilingControllerCompositionEngine _tilingControllersRequestingFocus](self, "_tilingControllersRequestingFocus");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v8);

    }
    -[PXTilingControllerCompositionEngine _invalidateComposition](self, "_invalidateComposition");
    v6 = v8;
  }

}

- (void)setTilingControllerCompositionNeedsUpdate:(id)a3 withContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = v6;
  if (!self->_isUpdatingComposition)
  {
    if (v6)
    {
      -[PXTilingControllerCompositionEngine _invalidationContexts](self, "_invalidationContexts");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v7);

    }
    -[PXTilingControllerCompositionEngine _invalidateComposition](self, "_invalidateComposition");
    -[PXTilingControllerCompositionEngine _scrollController](self, "_scrollController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNeedsUpdate");

  }
}

- (NSArray)tilingControllersRequestingFocus
{
  void *v2;
  void *v3;

  -[PXTilingControllerCompositionEngine _tilingControllersRequestingFocus](self, "_tilingControllersRequestingFocus");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (NSArray)invalidationContexts
{
  void *v2;
  void *v3;

  -[PXTilingControllerCompositionEngine _invalidationContexts](self, "_invalidationContexts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (CGRect)contentBoundsForTilingController:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  objc_msgSend(a3, "layoutContentBounds");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)scrollBoundsForTilingController:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  objc_msgSend(a3, "layoutScrollBounds");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGPoint)preferredOriginForTilingController:(id)a3
{
  double v3;
  double v4;
  CGPoint result;

  objc_msgSend(a3, "layoutPreferredOrigin");
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)originForTilingController:(id)a3
{
  double v3;
  double v4;
  CGPoint result;

  objc_msgSend(a3, "layoutOrigin");
  result.y = v4;
  result.x = v3;
  return result;
}

- (id)scrollInfoForTilingController:(id)a3
{
  return (id)objc_msgSend(a3, "scrollInfo");
}

- (CGPoint)convertPoint:(CGPoint)a3 fromTilingController:(id)a4
{
  double v4;
  double v5;
  CGPoint result;

  objc_msgSend(a4, "convertPointFromLayout:", a3.x, a3.y);
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 fromTilingController:(id)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  objc_msgSend(a4, "convertRectFromLayout:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (id)convertScrollInfo:(id)a3 fromTilingController:(id)a4
{
  return (id)objc_msgSend(a4, "convertScrollInfoFromLayout:", a3);
}

- (void)setReferenceSize:(CGSize)a3 contentInset:(UIEdgeInsets)a4 forTilingController:(id)a5
{
  double right;
  double bottom;
  double left;
  double top;
  double height;
  double width;
  id v13;
  void *v14;
  id v15;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  height = a3.height;
  width = a3.width;
  v13 = a5;
  v15 = v13;
  if (!self->_isUpdatingComposition)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXTilingControllerCompositionEngine.m"), 344, CFSTR("unexpected composition output"));

    v13 = v15;
  }
  objc_msgSend(v13, "setReferenceSize:contentInset:", width, height, top, left, bottom, right);
  objc_msgSend(v15, "updateMetrics");

}

- (void)setContentBounds:(CGRect)a3 scrollBounds:(CGRect)a4 scrollInfo:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  double v9;
  double v10;
  id v12;
  id v13;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3.size.height;
  v10 = a3.size.width;
  v12 = a5;
  -[PXTilingControllerCompositionEngine _scrollController](self, "_scrollController");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPresentedContentSize:", v10, v9);
  objc_msgSend(v13, "setContentBounds:", x, y, width, height);
  objc_msgSend(v13, "setScrollInfo:", v12);

}

- (void)setOrigin:(CGPoint)a3 forTilingController:(id)a4
{
  double y;
  double x;
  id v6;

  y = a3.y;
  x = a3.x;
  v6 = a4;
  objc_msgSend(v6, "setLayoutOrigin:", x, y);
  objc_msgSend(v6, "updateLayout");

}

- (PXScrollController)_scrollController
{
  return (PXScrollController *)objc_loadWeakRetained((id *)&self->__scrollController);
}

- (NSHashTable)_tilingControllers
{
  return self->__tilingControllers;
}

- (NSHashTable)_compositions
{
  return self->__compositions;
}

- (PXTilingControllerComposition)_composition
{
  return self->__composition;
}

- (void)_setComposition:(id)a3
{
  objc_storeStrong((id *)&self->__composition, a3);
}

- (PXTilingControllerDefaultComposition)_defaultComposition
{
  return self->__defaultComposition;
}

- (CGSize)_referenceSize
{
  double width;
  double height;
  CGSize result;

  width = self->__referenceSize.width;
  height = self->__referenceSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIEdgeInsets)_contentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->__contentInset.top;
  left = self->__contentInset.left;
  bottom = self->__contentInset.bottom;
  right = self->__contentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (NSMutableArray)_invalidationContexts
{
  return self->__invalidationContexts;
}

- (NSMutableArray)_tilingControllersRequestingFocus
{
  return self->__tilingControllersRequestingFocus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__tilingControllersRequestingFocus, 0);
  objc_storeStrong((id *)&self->__invalidationContexts, 0);
  objc_storeStrong((id *)&self->__defaultComposition, 0);
  objc_storeStrong((id *)&self->__composition, 0);
  objc_storeStrong((id *)&self->__compositions, 0);
  objc_storeStrong((id *)&self->__tilingControllers, 0);
  objc_destroyWeak((id *)&self->__scrollController);
}

uint64_t __68__PXTilingControllerCompositionEngine_px_scrollControllerDidUpdate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateScrollControllerMetrics");
}

+ (id)compositionEngineForScrollController:(id)a3 createIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  id v6;
  BOOL v7;

  v4 = a4;
  v5 = a3;
  objc_getAssociatedObject(v5, (const void *)compositionEngineForScrollController_createIfNeeded__PXTilingControllerCompositionEngineAssociationKey);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = 1;
  else
    v7 = !v4;
  if (!v7)
  {
    v6 = -[PXTilingControllerCompositionEngine _initWithScrollController:]([PXTilingControllerCompositionEngine alloc], "_initWithScrollController:", v5);
    objc_setAssociatedObject(v5, (const void *)compositionEngineForScrollController_createIfNeeded__PXTilingControllerCompositionEngineAssociationKey, v6, (void *)1);
  }

  return v6;
}

@end
