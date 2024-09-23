@implementation PUInteractiveSwipeDismissalController

- (PUInteractiveSwipeDismissalController)init
{
  PUInteractiveSwipeDismissalController *v2;
  PXVerticalSwipeGestureRecognizerHelper *v3;
  PXVerticalSwipeGestureRecognizerHelper *verticalSwipeGestureRecognizerHelper;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUInteractiveSwipeDismissalController;
  v2 = -[PUInteractiveSwipeDismissalController init](&v6, sel_init);
  if (v2)
  {
    v3 = (PXVerticalSwipeGestureRecognizerHelper *)objc_alloc_init(MEMORY[0x1E0D7BBA8]);
    verticalSwipeGestureRecognizerHelper = v2->_verticalSwipeGestureRecognizerHelper;
    v2->_verticalSwipeGestureRecognizerHelper = v3;

    -[PXVerticalSwipeGestureRecognizerHelper setDelegate:](v2->_verticalSwipeGestureRecognizerHelper, "setDelegate:", v2);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[UIPanGestureRecognizer setDelegate:](self->__panGestureRecognizer, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PUInteractiveSwipeDismissalController;
  -[PUInteractiveSwipeDismissalController dealloc](&v3, sel_dealloc);
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
  v10.super_class = (Class)PUInteractiveSwipeDismissalController;
  -[PUInteractiveDismissalController updateGestureRecognizersWithHostingView:](&v10, sel_updateGestureRecognizersWithHostingView_, v4);
  if (!-[PUInteractiveSwipeDismissalController _isHandlingPanGestureRecognizer](self, "_isHandlingPanGestureRecognizer"))
  {
    -[PUInteractiveSwipeDismissalController _panGestureRecognizer](self, "_panGestureRecognizer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4)
    {
      if (!v5)
      {
        v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", self, sel__handlePanGestureRecognizer_);
        objc_msgSend(v6, "setDelegate:", self);
        objc_msgSend(v6, "setAllowedScrollTypesMask:", 3);
        -[PUInteractiveSwipeDismissalController _setPanGestureRecognizer:](self, "_setPanGestureRecognizer:", v6);
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

      -[PUInteractiveSwipeDismissalController _setPanGestureRecognizer:](self, "_setPanGestureRecognizer:", 0);
    }

  }
}

- (void)_handlePanGestureRecognizer:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  PUSwipedDownTileTracker *v8;
  PUChangeDirectionValueFilter *v9;
  uint64_t (**v10)(_QWORD);
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  objc_class *v21;
  void *v22;
  int v23;
  void *v24;
  _BOOL4 v25;
  double v26;
  double v27;
  int v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  _BOOL4 v34;
  void *v35;
  PUSwipedDownTileTracker *v36;
  void *v37;
  PUChangeDirectionValueFilter *v38;
  void *v39;
  int v40;
  _QWORD aBlock[4];
  PUSwipedDownTileTracker *v42;
  PUChangeDirectionValueFilter *v43;

  v4 = a3;
  v5 = objc_msgSend(v4, "state");
  -[PUInteractiveSwipeDismissalController _swipedDownTileTracker](self, "_swipedDownTileTracker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUInteractiveSwipeDismissalController _dismissGestureDirectionValueFilter](self, "_dismissGestureDirectionValueFilter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__PUInteractiveSwipeDismissalController__handlePanGestureRecognizer___block_invoke;
  aBlock[3] = &unk_1E58A0F48;
  v8 = v6;
  v42 = v8;
  v9 = v7;
  v43 = v9;
  v10 = (uint64_t (**)(_QWORD))_Block_copy(aBlock);
  if ((unint64_t)(v5 - 3) >= 3)
  {
    if (v5 == 2)
    {
      if (-[PUInteractiveSwipeDismissalController _isHandlingPanGestureRecognizer](self, "_isHandlingPanGestureRecognizer"))
      {
        if (v8)
        {
          -[PUInteractiveTileTracker update](v8, "update");
          -[PUInteractiveTileTracker progress](v8, "progress");
          v27 = v26;
        }
        else
        {
          objc_msgSend(v4, "view");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "translationInView:", v29);
          v31 = v30;

          -[PUValueFilter setInputValue:](v9, "setInputValue:", v31);
          v27 = v31 / 200.0;
        }
        -[PUInteractiveDismissalController updateDismissalWithInteractionProgress:interactionWillFinish:](self, "updateDismissalWithInteractionProgress:interactionWillFinish:", v10[2](v10), v27);
      }
    }
    else if (v5 == 1
           && !-[PUInteractiveSwipeDismissalController _isHandlingPanGestureRecognizer](self, "_isHandlingPanGestureRecognizer"))
    {
      -[PUInteractiveSwipeDismissalController _setHandlingPanGestureRecognizer:](self, "_setHandlingPanGestureRecognizer:", 1);
      +[PUWorkaroundSettings sharedInstance](PUWorkaroundSettings, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "shouldWorkAround54502886");

      if (v12)
      {
        -[PUInteractiveDismissalController delegate](self, "delegate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "interactiveDismissalControllerViewController:", self);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "viewIfLoaded");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "safeAreaInsets");
        v17 = v16;
        v19 = v18;

        objc_msgSend(v14, "presentingViewController");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (objc_class *)objc_opt_class();
        NSStringFromClass(v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "hasPrefix:", CFSTR("CAM"));

        objc_msgSend(v14, "traitCollection");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v24, "userInterfaceIdiom"))
        {
          v25 = 0;
        }
        else
        {
          objc_msgSend(v14, "viewIfLoaded");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "window");
          v40 = v23;
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "windowScene");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (unint64_t)(objc_msgSend(v33, "interfaceOrientation") - 3) < 2;

          v23 = v40;
        }

        v34 = v17 > 0.0;
        if (v19 > 0.0)
          v34 = 1;
        v28 = v23 & v25 & v34;

      }
      else
      {
        v28 = 0;
      }
      -[PUInteractiveDismissalController tilingView](self, "tilingView");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (v35)
      {
        v36 = -[PUSwipedDownTileTracker initWithPanGestureRecognizer:tilingView:]([PUSwipedDownTileTracker alloc], "initWithPanGestureRecognizer:tilingView:", v4, v35);

        -[PUInteractiveSwipeDismissalController _setSwipedDownTileTracker:](self, "_setSwipedDownTileTracker:", v36);
        -[PUInteractiveDismissalController designatedTileController](self, "designatedTileController");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUSwipedDownTileTracker setDesignatedTileController:](v36, "setDesignatedTileController:", v37);
        -[PUInteractiveTileTracker update](v36, "update");

        v8 = v36;
      }
      else
      {
        v38 = objc_alloc_init(PUChangeDirectionValueFilter);

        -[PUChangeDirectionValueFilter setMinimumChangeValue:](v38, "setMinimumChangeValue:", 5.0);
        -[PUInteractiveSwipeDismissalController _setDismissGestureDirectionValueFilter:](self, "_setDismissGestureDirectionValueFilter:", v38);
        v9 = v38;
      }
      -[PUInteractiveDismissalController beginDismissal](self, "beginDismissal");
      if (v28)
        objc_msgSend(v4, "px_cancel");

    }
  }
  else if (-[PUInteractiveSwipeDismissalController _isHandlingPanGestureRecognizer](self, "_isHandlingPanGestureRecognizer"))
  {
    -[PUInteractiveSwipeDismissalController _setHandlingPanGestureRecognizer:](self, "_setHandlingPanGestureRecognizer:", 0);
    if (v8)
    {
      -[PUInteractiveTileTracker update](v8, "update");
      -[PUInteractiveSwipeDismissalController _setSwipedDownTileTracker:](self, "_setSwipedDownTileTracker:", 0);
    }
    else
    {
      -[PUInteractiveSwipeDismissalController _setDismissGestureDirectionValueFilter:](self, "_setDismissGestureDirectionValueFilter:", 0);
    }
    -[PUInteractiveDismissalController endDismissal:](self, "endDismissal:", v10[2](v10));
  }

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  id v5;
  char v6;
  void *v7;

  v4 = a3;
  -[PUInteractiveSwipeDismissalController _panGestureRecognizer](self, "_panGestureRecognizer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[PUInteractiveSwipeDismissalController verticalSwipeGestureRecognizerHelper](self, "verticalSwipeGestureRecognizerHelper");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "verticalSwipeGestureRecognizerShouldBegin:", v4);

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
  char v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  -[PUInteractiveSwipeDismissalController _panGestureRecognizer](self, "_panGestureRecognizer");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    -[PUInteractiveSwipeDismissalController verticalSwipeGestureRecognizerHelper](self, "verticalSwipeGestureRecognizerHelper");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "verticalSwipeGestureRecognizer:shouldBeRequiredToFailByGestureRecognizer:", v6, v7);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)verticalSwipeGestureRecognizerHelper:(id)a3 shouldRecognizeSwipeDownGestureRecognizer:(id)a4
{
  return -[PUInteractiveDismissalController canBeginDismissalAtLocationFromProvider:](self, "canBeginDismissalAtLocationFromProvider:", a4);
}

- (UIPanGestureRecognizer)_panGestureRecognizer
{
  return self->__panGestureRecognizer;
}

- (void)_setPanGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->__panGestureRecognizer, a3);
}

- (PXVerticalSwipeGestureRecognizerHelper)verticalSwipeGestureRecognizerHelper
{
  return self->_verticalSwipeGestureRecognizerHelper;
}

- (BOOL)_isHandlingPanGestureRecognizer
{
  return self->_handlingPanGestureRecognizer;
}

- (void)_setHandlingPanGestureRecognizer:(BOOL)a3
{
  self->_handlingPanGestureRecognizer = a3;
}

- (PUChangeDirectionValueFilter)_dismissGestureDirectionValueFilter
{
  return self->__dismissGestureDirectionValueFilter;
}

- (void)_setDismissGestureDirectionValueFilter:(id)a3
{
  objc_storeStrong((id *)&self->__dismissGestureDirectionValueFilter, a3);
}

- (PUSwipedDownTileTracker)_swipedDownTileTracker
{
  return self->__swipedDownTileTracker;
}

- (void)_setSwipedDownTileTracker:(id)a3
{
  objc_storeStrong((id *)&self->__swipedDownTileTracker, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__swipedDownTileTracker, 0);
  objc_storeStrong((id *)&self->__dismissGestureDirectionValueFilter, 0);
  objc_storeStrong((id *)&self->_verticalSwipeGestureRecognizerHelper, 0);
  objc_storeStrong((id *)&self->__panGestureRecognizer, 0);
}

uint64_t __69__PUInteractiveSwipeDismissalController__handlePanGestureRecognizer___block_invoke(uint64_t a1)
{
  void *v2;
  double v4;

  v2 = *(void **)(a1 + 32);
  if (v2)
    return objc_msgSend(v2, "shouldFinish");
  objc_msgSend(*(id *)(a1 + 40), "outputValue");
  return v4 >= 0.0;
}

@end
