@implementation PXTilingControllerComposition

- (void)setActive:(BOOL)a3
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (self->_active != a3)
  {
    self->_active = a3;
    if (a3)
    {
      -[PXTilingControllerComposition tilingControllers](self, "tilingControllers");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v5, "count"))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXTilingControllerComposition.m"), 29, CFSTR("composition activated before it has any tiling controller"));

      }
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v6 = v5;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v16;
        while (2)
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v16 != v9)
              objc_enumerationMutation(v6);
            objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "scrollController", (_QWORD)v15);
            v11 = objc_claimAutoreleasedReturnValue();
            if (v11)
            {
              v13 = (void *)v11;
              v12 = v6;
              goto LABEL_16;
            }
            ++v10;
          }
          while (v8 != v10);
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          if (v8)
            continue;
          break;
        }
      }

      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXTilingControllerComposition.m"), 36, CFSTR("composition activated before any of its tiling controller has a scroll controller"));
      v13 = 0;
LABEL_16:

      -[PXTilingControllerComposition _setScrollController:](self, "_setScrollController:", v13);
    }
    else
    {
      -[PXTilingControllerComposition _setScrollController:](self, "_setScrollController:", 0);
    }
  }
}

- (void)updateComposition
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXTilingControllerComposition.m"), 44, CFSTR("concrete subclass must implement"));

}

- (void)invalidateComposition
{
  -[PXTilingControllerComposition invalidateCompositionWithContext:](self, "invalidateCompositionWithContext:", 0);
}

- (void)invalidateCompositionWithContext:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXTilingControllerComposition observer](self, "observer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTilingControllerCompositionNeedsUpdate:withContext:", self, v4);

}

- (void)_setScrollController:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->__scrollController);

  v5 = obj;
  if (WeakRetained != obj)
  {
    v6 = objc_loadWeakRetained((id *)&self->__scrollController);

    if (v6)
    {
      v7 = objc_loadWeakRetained((id *)&self->__scrollController);
      +[PXTilingControllerCompositionEngine compositionEngineForScrollController:createIfNeeded:](PXTilingControllerCompositionEngine, "compositionEngineForScrollController:createIfNeeded:", v7, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "unregisterComposition:", self);
    }
    v9 = objc_storeWeak((id *)&self->__scrollController, obj);
    +[PXTilingControllerCompositionEngine compositionEngineForScrollController:createIfNeeded:](PXTilingControllerCompositionEngine, "compositionEngineForScrollController:createIfNeeded:", obj, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "registerComposition:", self);
    v5 = obj;
  }

}

- (BOOL)isActive
{
  return self->_active;
}

- (NSSet)tilingControllers
{
  return self->_tilingControllers;
}

- (PXTilingControllerCompositionInput)input
{
  return (PXTilingControllerCompositionInput *)objc_loadWeakRetained((id *)&self->_input);
}

- (void)setInput:(id)a3
{
  objc_storeWeak((id *)&self->_input, a3);
}

- (PXTilingControllerCompositionOutput)output
{
  return (PXTilingControllerCompositionOutput *)objc_loadWeakRetained((id *)&self->_output);
}

- (void)setOutput:(id)a3
{
  objc_storeWeak((id *)&self->_output, a3);
}

- (PXScrollController)_scrollController
{
  return (PXScrollController *)objc_loadWeakRetained((id *)&self->__scrollController);
}

- (PXTilingControllerCompositionObserver)observer
{
  return (PXTilingControllerCompositionObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
  objc_destroyWeak((id *)&self->__scrollController);
  objc_destroyWeak((id *)&self->_output);
  objc_destroyWeak((id *)&self->_input);
  objc_storeStrong((id *)&self->_tilingControllers, 0);
}

@end
