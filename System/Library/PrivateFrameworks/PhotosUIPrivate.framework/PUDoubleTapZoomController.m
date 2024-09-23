@implementation PUDoubleTapZoomController

- (PUDoubleTapZoomController)init
{
  PUDoubleTapZoomController *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUDoubleTapZoomController;
  result = -[PUDoubleTapZoomController init](&v3, sel_init);
  if (result)
    result->__needsUpdateGestureRecognizers = 1;
  return result;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateFlags.respondsToViewHostingGestureRecognizers = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToTilingView = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToDelegateForGestureRecognizer = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToCanDoubleTapBeginAtLocationFromProvider = objc_opt_respondsToSelector() & 1;
    -[PUDoubleTapZoomController _invalidateGestureRecognizers](self, "_invalidateGestureRecognizers");
    -[PUDoubleTapZoomController _updateGestureRecognizersIfNeeded](self, "_updateGestureRecognizersIfNeeded");
  }

}

- (void)invalidateViewHostingGestureRecognizers
{
  -[PUDoubleTapZoomController _invalidateGestureRecognizers](self, "_invalidateGestureRecognizers");
  -[PUDoubleTapZoomController _updateGestureRecognizersIfNeeded](self, "_updateGestureRecognizersIfNeeded");
}

- (UITapGestureRecognizer)doubleTapGestureRecognizer
{
  -[PUDoubleTapZoomController _updateGestureRecognizersIfNeeded](self, "_updateGestureRecognizersIfNeeded");
  return -[PUDoubleTapZoomController _doubleTapGestureRecognizer](self, "_doubleTapGestureRecognizer");
}

- (BOOL)shouldDoubleTapBeginAtLocationFromProvider:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  char v12;

  v4 = a3;
  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "allowDoubleTapZoom");

  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6
    && (!self->_delegateFlags.respondsToCanDoubleTapBeginAtLocationFromProvider
     || (-[PUDoubleTapZoomController delegate](self, "delegate"),
         v8 = (void *)objc_claimAutoreleasedReturnValue(),
         v9 = objc_msgSend(v8, "doubleTapZoomController:canDoubleTapBeginAtLocationFromProvider:", self, v4),
         v8,
         v9)))
  {
    if (objc_msgSend(v7, "doubleTapZoomAreaExcludesBackground"))
    {
      -[PUDoubleTapZoomController _userTransformViewAtLocationFromProvider:](self, "_userTransformViewAtLocationFromProvider:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
        v12 = objc_msgSend(v10, "contentContainsLocationFromProvider:", v4);
      else
        v12 = 1;

    }
    else
    {
      v12 = 1;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)_invalidateGestureRecognizers
{
  -[PUDoubleTapZoomController _setNeedsUpdateGestureRecognizers:](self, "_setNeedsUpdateGestureRecognizers:", 1);
}

- (void)_updateGestureRecognizersIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  PUDoubleTapZoomController *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  if (-[PUDoubleTapZoomController _needsUpdateGestureRecognizers](self, "_needsUpdateGestureRecognizers"))
  {
    -[PUDoubleTapZoomController _setNeedsUpdateGestureRecognizers:](self, "_setNeedsUpdateGestureRecognizers:", 0);
    if (self->_delegateFlags.respondsToViewHostingGestureRecognizers)
    {
      -[PUDoubleTapZoomController delegate](self, "delegate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "doubleTapZoomControllerViewHostingGestureRecognizers:", self);
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }
    -[PUDoubleTapZoomController _doubleTapGestureRecognizer](self, "_doubleTapGestureRecognizer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      if (!v4)
      {
        v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleDoubleTapGestureRecognizer_);
        objc_msgSend(v4, "setNumberOfTapsRequired:", 2);
        -[PUDoubleTapZoomController _setDoubleTapGestureRecognizer:](self, "_setDoubleTapGestureRecognizer:", v4);
        if (!self->_delegateFlags.respondsToDelegateForGestureRecognizer
          || (-[PUDoubleTapZoomController delegate](self, "delegate"),
              v5 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v5, "doubleTapZoomController:delegateForGestureRecognizer:", self, v4),
              v6 = (PUDoubleTapZoomController *)objc_claimAutoreleasedReturnValue(),
              v5,
              !v6))
        {
          v6 = self;
        }
        objc_msgSend(v4, "setDelegate:", v6);

      }
      objc_msgSend(v4, "view");
      v7 = (id)objc_claimAutoreleasedReturnValue();

      if (v10 != v7)
      {
        objc_msgSend(v4, "view");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeGestureRecognizer:", v4);

        objc_msgSend(v10, "addGestureRecognizer:", v4);
      }
    }
    else if (v4)
    {
      objc_msgSend(v4, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeGestureRecognizer:", v4);

      -[PUDoubleTapZoomController _setDoubleTapGestureRecognizer:](self, "_setDoubleTapGestureRecognizer:", 0);
    }

  }
}

- (void)_handleDoubleTapGestureRecognizer:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "state") == 3)
  {
    -[PUDoubleTapZoomController _userTransformViewAtLocationFromProvider:](self, "_userTransformViewAtLocationFromProvider:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "hasUserZoomedIn"))
      objc_msgSend(v4, "zoomOut:", 1);
    else
      objc_msgSend(v4, "zoomInOnLocationFromProvider:", v5);

  }
}

- (id)_userTransformViewAtLocationFromProvider:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__23737;
  v16 = __Block_byref_object_dispose__23738;
  v17 = 0;
  if (self->_delegateFlags.respondsToTilingView)
  {
    -[PUDoubleTapZoomController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleTapZoomControllerTilingView:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "locationInView:", v6);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __70__PUDoubleTapZoomController__userTransformViewAtLocationFromProvider___block_invoke;
      v11[3] = &unk_1E58A2FC8;
      v11[4] = &v12;
      objc_msgSend(v6, "enumeratePresentedTileControllersInRect:usingBlock:", v11, v7 + -1.0, v8 + -1.0, 2.0, 2.0);
    }
  }
  else
  {
    v6 = 0;
  }
  v9 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v9;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  return -[PUDoubleTapZoomController shouldDoubleTapBeginAtLocationFromProvider:](self, "shouldDoubleTapBeginAtLocationFromProvider:", a4);
}

- (PUDoubleTapZoomControllerDelegate)delegate
{
  return (PUDoubleTapZoomControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)_needsUpdateGestureRecognizers
{
  return self->__needsUpdateGestureRecognizers;
}

- (void)_setNeedsUpdateGestureRecognizers:(BOOL)a3
{
  self->__needsUpdateGestureRecognizers = a3;
}

- (UITapGestureRecognizer)_doubleTapGestureRecognizer
{
  return self->__doubleTapGestureRecognizer;
}

- (void)_setDoubleTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->__doubleTapGestureRecognizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__doubleTapGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __70__PUDoubleTapZoomController__userTransformViewAtLocationFromProvider___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "userTransformView");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    *a4 = 1;
  }

}

@end
