@implementation PUInteractivePinchDismissalController

- (void)dealloc
{
  objc_super v3;

  -[UIPinchGestureRecognizer setDelegate:](self->__pinchGestureRecognizer, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PUInteractivePinchDismissalController;
  -[PUInteractivePinchDismissalController dealloc](&v3, sel_dealloc);
}

- (void)updateGestureRecognizersWithHostingView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PUInteractivePinchDismissalController;
  -[PUInteractiveDismissalController updateGestureRecognizersWithHostingView:](&v10, sel_updateGestureRecognizersWithHostingView_, v4);
  if (!-[PUInteractivePinchDismissalController _isHandlingPinchGestureRecognizer](self, "_isHandlingPinchGestureRecognizer"))
  {
    -[PUInteractivePinchDismissalController _pinchGestureRecognizer](self, "_pinchGestureRecognizer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4)
    {
      if (!v5)
      {
        v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AE8]), "initWithTarget:action:", self, sel__handlePinchGestureRecognizer_);
        objc_msgSend(v6, "setDelegate:", self);
        -[PUInteractivePinchDismissalController _setPinchGestureRecognizer:](self, "_setPinchGestureRecognizer:", v6);
      }
      objc_msgSend(v6, "view");
      v7 = (id)objc_claimAutoreleasedReturnValue();

      if (v7 != v4)
      {
        objc_msgSend(v6, "view");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeGestureRecognizer:", v6);

        objc_msgSend(v4, "addGestureRecognizer:", v6);
      }
    }
    else if (v5)
    {
      objc_msgSend(v5, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeGestureRecognizer:", v6);

      -[PUInteractivePinchDismissalController _setPinchGestureRecognizer:](self, "_setPinchGestureRecognizer:", 0);
    }

  }
}

- (void)_handlePinchGestureRecognizer:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  PUPinchedTileTracker *v8;
  PUChangeDirectionValueFilter *v9;
  uint64_t (**v10)(_QWORD);
  void *v11;
  PUPinchedTileTracker *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  PUChangeDirectionValueFilter *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  PUPinchedTileTracker *v22;
  PUChangeDirectionValueFilter *v23;

  v4 = a3;
  v5 = objc_msgSend(v4, "state");
  -[PUInteractivePinchDismissalController _pinchedTileTracker](self, "_pinchedTileTracker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUInteractivePinchDismissalController _scaleDirectionValueFilter](self, "_scaleDirectionValueFilter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __71__PUInteractivePinchDismissalController__handlePinchGestureRecognizer___block_invoke;
  v21 = &unk_1E58A0F48;
  v8 = v6;
  v22 = v8;
  v9 = v7;
  v23 = v9;
  v10 = (uint64_t (**)(_QWORD))_Block_copy(&v18);
  if ((unint64_t)(v5 - 3) >= 3)
  {
    if (v5 == 2)
    {
      if (-[PUInteractivePinchDismissalController _isHandlingPinchGestureRecognizer](self, "_isHandlingPinchGestureRecognizer", v18, v19, v20, v21, v22))
      {
        if (v8)
        {
          -[PUInteractiveTileTracker update](v8, "update");
          -[PUInteractiveTileTracker progress](v8, "progress");
          v14 = v13;
        }
        else
        {
          objc_msgSend(v4, "scale");
          v16 = v15;
          -[PUValueFilter setInputValue:](v9, "setInputValue:");
          v14 = 1.0 - v16 + 1.0 - v16;
        }
        -[PUInteractiveDismissalController updateDismissalWithInteractionProgress:interactionWillFinish:](self, "updateDismissalWithInteractionProgress:interactionWillFinish:", v10[2](v10), v14);
      }
    }
    else if (v5 == 1
           && !-[PUInteractivePinchDismissalController _isHandlingPinchGestureRecognizer](self, "_isHandlingPinchGestureRecognizer", v18, v19, v20, v21, v22))
    {
      -[PUInteractivePinchDismissalController _setHandlingPinchGestureRecognizer:](self, "_setHandlingPinchGestureRecognizer:", 1);
      -[PUInteractiveDismissalController tilingView](self, "tilingView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v12 = -[PUPinchedTileTracker initWithPinchGestureRecognizer:tilingView:direction:]([PUPinchedTileTracker alloc], "initWithPinchGestureRecognizer:tilingView:direction:", v4, v11, 2);

        -[PUPinchedTileTracker setDelegate:](v12, "setDelegate:", self);
        -[PUInteractivePinchDismissalController _setPinchedTileTracker:](self, "_setPinchedTileTracker:", v12);
        -[PUInteractiveTileTracker update](v12, "update");
        v8 = v12;
      }
      else
      {
        v17 = objc_alloc_init(PUChangeDirectionValueFilter);

        -[PUChangeDirectionValueFilter setMinimumChangeValue:](v17, "setMinimumChangeValue:", 0.05);
        -[PUInteractivePinchDismissalController _setScaleDirectionValueFilter:](self, "_setScaleDirectionValueFilter:", v17);
        v9 = v17;
      }
      -[PUInteractiveDismissalController beginDismissal](self, "beginDismissal");

    }
  }
  else if (-[PUInteractivePinchDismissalController _isHandlingPinchGestureRecognizer](self, "_isHandlingPinchGestureRecognizer", v18, v19, v20, v21, v22))
  {
    -[PUInteractivePinchDismissalController _setHandlingPinchGestureRecognizer:](self, "_setHandlingPinchGestureRecognizer:", 0);
    if (v8)
    {
      -[PUInteractiveTileTracker update](v8, "update");
      -[PUInteractivePinchDismissalController _setPinchedTileTracker:](self, "_setPinchedTileTracker:", 0);
    }
    else
    {
      -[PUInteractivePinchDismissalController _setScaleDirectionValueFilter:](self, "_setScaleDirectionValueFilter:", 0);
    }
    -[PUInteractiveDismissalController endDismissal:](self, "endDismissal:", v10[2](v10));
  }

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  id v5;
  BOOL v6;
  double v7;

  v4 = a3;
  -[PUInteractivePinchDismissalController _pinchGestureRecognizer](self, "_pinchGestureRecognizer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v4)
  {
    if (-[PUInteractiveDismissalController canBeginDismissalAtLocationFromProvider:](self, "canBeginDismissalAtLocationFromProvider:", v4))
    {
      objc_msgSend(v4, "velocity");
      v6 = v7 < 0.0;
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  id v8;
  char isKindOfClass;
  int v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  id v17;

  v6 = a3;
  v7 = a4;
  -[PUInteractivePinchDismissalController _pinchGestureRecognizer](self, "_pinchGestureRecognizer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 != v6)
  {

LABEL_7:
    LOBYTE(v10) = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    goto LABEL_7;
  v17 = 0;
  v10 = objc_msgSend(v7, "px_isPinchGestureRecognizerOfScrollView:", &v17);
  v11 = v17;
  v12 = v11;
  if (v10)
  {
    objc_msgSend(v11, "minimumZoomScale");
    v14 = v13;
    objc_msgSend(v12, "zoomScale");
    LOBYTE(v10) = v15 <= v14;
  }

LABEL_8:
  return v10;
}

- (id)pinchedTiledTracker:(id)a3 finalLayoutInfoForInitialLayoutInfo:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a4;
  -[PUInteractiveDismissalController tilingViewControllerTransition](self, "tilingViewControllerTransition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "hasStarted"))
  {
    -[PUInteractiveDismissalController tilingView](self, "tilingView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "indexPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tileKind");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layoutInfoForTileWithIndexPath:kind:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (UIPinchGestureRecognizer)_pinchGestureRecognizer
{
  return self->__pinchGestureRecognizer;
}

- (void)_setPinchGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->__pinchGestureRecognizer, a3);
}

- (BOOL)_isHandlingPinchGestureRecognizer
{
  return self->_handlingPinchGestureRecognizer;
}

- (void)_setHandlingPinchGestureRecognizer:(BOOL)a3
{
  self->_handlingPinchGestureRecognizer = a3;
}

- (PUChangeDirectionValueFilter)_scaleDirectionValueFilter
{
  return self->__scaleDirectionValueFilter;
}

- (void)_setScaleDirectionValueFilter:(id)a3
{
  objc_storeStrong((id *)&self->__scaleDirectionValueFilter, a3);
}

- (PUPinchedTileTracker)_pinchedTileTracker
{
  return self->__pinchedTileTracker;
}

- (void)_setPinchedTileTracker:(id)a3
{
  objc_storeStrong((id *)&self->__pinchedTileTracker, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__pinchedTileTracker, 0);
  objc_storeStrong((id *)&self->__scaleDirectionValueFilter, 0);
  objc_storeStrong((id *)&self->__pinchGestureRecognizer, 0);
}

uint64_t __71__PUInteractivePinchDismissalController__handlePinchGestureRecognizer___block_invoke(uint64_t a1)
{
  void *v2;
  double v4;

  v2 = *(void **)(a1 + 32);
  if (v2)
    return objc_msgSend(v2, "shouldFinish");
  objc_msgSend(*(id *)(a1 + 40), "outputValue");
  return v4 <= 0.0;
}

@end
