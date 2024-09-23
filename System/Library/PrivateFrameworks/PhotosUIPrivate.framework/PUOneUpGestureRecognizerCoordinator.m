@implementation PUOneUpGestureRecognizerCoordinator

- (void)addIrisGestureRecognizer:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[PUOneUpGestureRecognizerCoordinator _irisGestureRecognizers](self, "_irisGestureRecognizers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUOneUpGestureRecognizerCoordinator _setIrisGestureRecognizers:](self, "_setIrisGestureRecognizers:", v4);
  }
  objc_msgSend(v4, "addObject:", v5);

}

- (PUTouchingGestureRecognizer)touchingGestureRecognizer
{
  -[PUOneUpGestureRecognizerCoordinator _updateGestureRecognizersIfNeeded](self, "_updateGestureRecognizersIfNeeded");
  return self->_touchingGestureRecognizer;
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
    self->_delegateFlags.respondsToShouldAllowIrisGestureRecognizer = objc_opt_respondsToSelector() & 1;
    -[PUOneUpGestureRecognizerCoordinator _invalidateGestureRecognizers](self, "_invalidateGestureRecognizers");
    -[PUOneUpGestureRecognizerCoordinator _updateGestureRecognizersIfNeeded](self, "_updateGestureRecognizersIfNeeded");
  }

}

- (id)longPressGestureRecognizer
{
  -[PUOneUpGestureRecognizerCoordinator _updateGestureRecognizersIfNeeded](self, "_updateGestureRecognizersIfNeeded");
  return self->_longPressGestureRecognizer;
}

- (void)_invalidateGestureRecognizers
{
  -[PUOneUpGestureRecognizerCoordinator _setNeedsUpdateGestureRecognizers:](self, "_setNeedsUpdateGestureRecognizers:", 1);
}

- (void)invalidateViewHostingGestureRecognizers
{
  -[PUOneUpGestureRecognizerCoordinator _invalidateGestureRecognizers](self, "_invalidateGestureRecognizers");
  -[PUOneUpGestureRecognizerCoordinator _updateGestureRecognizersIfNeeded](self, "_updateGestureRecognizersIfNeeded");
}

- (void)_updateGestureRecognizersIfNeeded
{
  void *v3;
  PUTouchingGestureRecognizer *v4;
  id v5;
  void *v6;
  id v7;

  if (-[PUOneUpGestureRecognizerCoordinator _needsUpdateGestureRecognizers](self, "_needsUpdateGestureRecognizers"))
  {
    -[PUOneUpGestureRecognizerCoordinator _setNeedsUpdateGestureRecognizers:](self, "_setNeedsUpdateGestureRecognizers:", 0);
    if (self->_delegateFlags.respondsToViewHostingGestureRecognizers)
    {
      -[PUOneUpGestureRecognizerCoordinator delegate](self, "delegate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "oneUpGestureRecognizerCoordinatorViewHostingTouchingGesture:", self);
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }
    -[PUOneUpGestureRecognizerCoordinator touchingGestureRecognizer](self, "touchingGestureRecognizer");
    v4 = (PUTouchingGestureRecognizer *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v4 = -[PUTouchingGestureRecognizer initWithTarget:action:]([PUTouchingGestureRecognizer alloc], "initWithTarget:action:", 0, 0);
      -[PUTouchingGestureRecognizer setCancelsTouchesInView:](v4, "setCancelsTouchesInView:", 0);
      -[PUTouchingGestureRecognizer setDelaysTouchesBegan:](v4, "setDelaysTouchesBegan:", 0);
      -[PUTouchingGestureRecognizer setDelaysTouchesEnded:](v4, "setDelaysTouchesEnded:", 0);
      objc_storeStrong((id *)&self->_touchingGestureRecognizer, v4);
      -[PUTouchingGestureRecognizer setDelegate:](v4, "setDelegate:", self);
    }
    -[PUTouchingGestureRecognizer view](v4, "view");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v7 != v5)
    {
      -[PUTouchingGestureRecognizer view](v4, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeGestureRecognizer:", v4);

      objc_msgSend(v7, "addGestureRecognizer:", v4);
    }

  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  char v12;
  BOOL v13;

  v4 = a3;
  -[PUOneUpGestureRecognizerCoordinator doubleTapZoomController](self, "doubleTapZoomController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleTapGestureRecognizer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    -[PUOneUpGestureRecognizerCoordinator doubleTapZoomController](self, "doubleTapZoomController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "shouldDoubleTapBeginAtLocationFromProvider:", v4);
    goto LABEL_9;
  }
  -[PUOneUpGestureRecognizerCoordinator oneUpBarsController](self, "oneUpBarsController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tapGestureRecognizer");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v4)
  {
    -[PUOneUpGestureRecognizerCoordinator oneUpBarsController](self, "oneUpBarsController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "shouldTapBeginAtLocationFromProvider:", v4);
    goto LABEL_9;
  }
  if (self->_delegateFlags.respondsToShouldAllowIrisGestureRecognizer)
  {
    -[PUOneUpGestureRecognizerCoordinator _irisGestureRecognizers](self, "_irisGestureRecognizers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "containsObject:", v4);

    if (v10)
    {
      -[PUOneUpGestureRecognizerCoordinator delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "oneUpGestureRecognizerCoordinator:shouldAllowIrisGestureAtLocationFromProvider:", self, v4);
LABEL_9:
      v13 = v12;

      goto LABEL_10;
    }
  }
  v13 = 1;
LABEL_10:

  return v13;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  char v10;
  void *v11;
  id v12;

  v6 = a3;
  v7 = a4;
  -[PUOneUpGestureRecognizerCoordinator oneUpBarsController](self, "oneUpBarsController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tapGestureRecognizer");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9 == v6)
  {
    -[PUOneUpGestureRecognizerCoordinator doubleTapZoomController](self, "doubleTapZoomController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleTapGestureRecognizer");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (v12 != v7)
    {
      v10 = 0;
      goto LABEL_6;
    }
    -[PUOneUpGestureRecognizerCoordinator doubleTapZoomController](self, "doubleTapZoomController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "shouldDoubleTapBeginAtLocationFromProvider:", v6);
  }
  else
  {

    v10 = 0;
  }

LABEL_6:
  return v10;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  id v14;
  id v15;
  id v16;
  objc_class *v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  -[PUOneUpGestureRecognizerCoordinator oneUpBarsController](self, "oneUpBarsController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tapGestureRecognizer");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9 == v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v6, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 == v11)
    {
      isKindOfClass = 1;
      goto LABEL_16;
    }
  }
  else
  {

  }
  -[PUOneUpGestureRecognizerCoordinator doubleTapZoomController](self, "doubleTapZoomController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleTapGestureRecognizer");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (v14 == v6)
  {
    v15 = v7;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    -[PUOneUpGestureRecognizerCoordinator oneUpBarsController](self, "oneUpBarsController");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "tapGestureRecognizer");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (v16 == v6)
    {
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "isEqualToString:", CFSTR("UITextTapRecognizer")))
        isKindOfClass = objc_msgSend(v7, "numberOfTapsRequired") == 1;
      else
        isKindOfClass = 0;

    }
    else
    {
      isKindOfClass = 0;
    }

  }
LABEL_16:

  return isKindOfClass & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  char isKindOfClass;
  void *v11;
  id v12;
  void *v13;
  id v14;
  BOOL v15;
  void *v16;
  void *v17;
  char v18;

  v6 = a3;
  v7 = a4;
  -[PUOneUpGestureRecognizerCoordinator _irisGestureRecognizers](self, "_irisGestureRecognizers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "containsObject:", v6) & 1) != 0)
    v9 = 1;
  else
    v9 = objc_msgSend(v8, "containsObject:", v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  -[PUOneUpGestureRecognizerCoordinator oneUpBarsController](self, "oneUpBarsController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "tapGestureRecognizer");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (v12 == v6)
  {
    v15 = 0;
  }
  else
  {
    -[PUOneUpGestureRecognizerCoordinator oneUpBarsController](self, "oneUpBarsController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "tapGestureRecognizer");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v15 = v14 != v7;

  }
  -[PUOneUpGestureRecognizerCoordinator browsingSession](self, "browsingSession");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "viewModel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isScrubbing");

  return isKindOfClass & (v15 | isKindOfClass & v18 ^ 1) | v9;
}

- (PUOneUpGestureRecognizerCoordinatorDelegate)delegate
{
  return (PUOneUpGestureRecognizerCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (PUBrowsingSession)browsingSession
{
  return self->_browsingSession;
}

- (void)setBrowsingSession:(id)a3
{
  objc_storeStrong((id *)&self->_browsingSession, a3);
}

- (PUOneUpBarsController)oneUpBarsController
{
  return self->_oneUpBarsController;
}

- (void)setOneUpBarsController:(id)a3
{
  objc_storeStrong((id *)&self->_oneUpBarsController, a3);
}

- (PUDoubleTapZoomController)doubleTapZoomController
{
  return self->_doubleTapZoomController;
}

- (void)setDoubleTapZoomController:(id)a3
{
  objc_storeStrong((id *)&self->_doubleTapZoomController, a3);
}

- (NSHashTable)_irisGestureRecognizers
{
  return self->__irisGestureRecognizers;
}

- (void)_setIrisGestureRecognizers:(id)a3
{
  objc_storeStrong((id *)&self->__irisGestureRecognizers, a3);
}

- (BOOL)_needsUpdateGestureRecognizers
{
  return self->__needsUpdateGestureRecognizers;
}

- (void)_setNeedsUpdateGestureRecognizers:(BOOL)a3
{
  self->__needsUpdateGestureRecognizers = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__irisGestureRecognizers, 0);
  objc_storeStrong((id *)&self->_doubleTapZoomController, 0);
  objc_storeStrong((id *)&self->_oneUpBarsController, 0);
  objc_storeStrong((id *)&self->_browsingSession, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_touchingGestureRecognizer, 0);
}

@end
