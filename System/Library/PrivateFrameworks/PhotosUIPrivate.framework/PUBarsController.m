@implementation PUBarsController

- (PUBarsController)initWithViewController:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  PUBarsController *v8;
  uint64_t v9;
  PXUpdater *updater;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PUBarsController;
  v8 = -[PUBarsController init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0D7CDA0]), "initWithTarget:needsUpdateSelector:", v8, sel__setNeedsUpdate);
    updater = v8->_updater;
    v8->_updater = (PXUpdater *)v9;

    -[PXUpdater addUpdateSelector:needsUpdate:](v8->_updater, "addUpdateSelector:needsUpdate:", sel__updateGestureRecognizers, 1);
    -[PXUpdater addUpdateSelector:needsUpdate:](v8->_updater, "addUpdateSelector:needsUpdate:", sel_updateContentGuideInsets, 1);
    -[PXUpdater addUpdateSelector:needsUpdate:](v8->_updater, "addUpdateSelector:needsUpdate:", sel__updateBars, 1);
    objc_storeWeak((id *)&v8->_delegate, v7);
    v8->_delegateFlags.respondsToViewHostingGestureRecognizers = objc_opt_respondsToSelector() & 1;
    v8->_delegateFlags.respondsToContentGuideInsetsDidChange = objc_opt_respondsToSelector() & 1;
    objc_storeWeak((id *)&v8->_viewController, v6);
  }

  return v8;
}

- (PUBarsController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUBarsController.m"), 52, CFSTR("%s is not available as initializer"), "-[PUBarsController init]");

  abort();
}

- (void)setContentGuideInsets:(UIEdgeInsets)a3
{
  id v7;

  if (a3.left != self->_contentGuideInsets.left
    || a3.top != self->_contentGuideInsets.top
    || a3.right != self->_contentGuideInsets.right
    || a3.bottom != self->_contentGuideInsets.bottom)
  {
    self->_contentGuideInsets = a3;
    if (self->_delegateFlags.respondsToContentGuideInsetsDidChange)
    {
      -[PUBarsController delegate](self, "delegate");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "barsControllerContentGuideInsetsDidChange:", self);

    }
  }
}

- (void)updateIfNeeded
{
  id v2;

  -[PUBarsController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateIfNeeded");

}

- (BOOL)prefersStatusBarHidden
{
  return 0;
}

- (BOOL)wantsNavigationBarVisible
{
  return 1;
}

- (BOOL)wantsToolbarVisible
{
  return 1;
}

- (int64_t)preferredBarStyle
{
  return 0;
}

- (BOOL)isLocationFromProviderInBarsArea:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  _BOOL4 v30;
  CGPoint v32;
  CGRect v33;

  v4 = a3;
  -[PUBarsController viewController](self, "viewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "px_isVisible"))
  {
    -[PUBarsController contentGuideInsets](self, "contentGuideInsets");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "barsAreaVerticalOutset");
    v16 = v15;

    v17 = v7 + v16;
    v18 = v11 + v16;
    objc_msgSend(v5, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bounds");
    v21 = v9 + v20;
    v23 = v17 + v22;
    v25 = v24 - (v9 + v13);
    v27 = v26 - (v17 + v18);
    objc_msgSend(v4, "locationInView:", v19);
    v32.x = v28;
    v32.y = v29;
    v33.origin.x = v21;
    v33.origin.y = v23;
    v33.size.width = v25;
    v33.size.height = v27;
    v30 = !CGRectContainsPoint(v33, v32);

  }
  else
  {
    LOBYTE(v30) = 0;
  }

  return v30;
}

- (void)invalidateBars
{
  id v2;

  -[PUBarsController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateBars);

}

- (void)_updateBars
{
  if (!-[PUBarsController _isUpdateBarsDisabled](self, "_isUpdateBarsDisabled"))
    -[PUBarsController updateBars](self, "updateBars");
}

- (void)_invalidateGestureRecognizers
{
  id v2;

  -[PUBarsController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateGestureRecognizers);

}

- (void)_updateGestureRecognizers
{
  void *v3;
  id v4;

  if (self->_delegateFlags.respondsToViewHostingGestureRecognizers)
  {
    -[PUBarsController delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "barsControllerViewHostingGestureRecognizers:", self);
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  -[PUBarsController updateGestureRecognizersWithHostingView:](self, "updateGestureRecognizersWithHostingView:", v4);

}

- (void)invalidateContentGuideInsets
{
  id v2;

  -[PUBarsController updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel_updateContentGuideInsets);

}

- (void)_setNeedsUpdate
{
  _QWORD v3[4];
  id v4;
  id location;

  if (!-[PUBarsController updateScheduled](self, "updateScheduled"))
  {
    -[PUBarsController setUpdateScheduled:](self, "setUpdateScheduled:", 1);
    objc_initWeak(&location, self);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __35__PUBarsController__setNeedsUpdate__block_invoke;
    v3[3] = &unk_1E58AB2F8;
    objc_copyWeak(&v4, &location);
    dispatch_async(MEMORY[0x1E0C80D38], v3);
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

- (void)_updateNowIfNeeded
{
  id v3;

  -[PUBarsController setUpdateScheduled:](self, "setUpdateScheduled:", 0);
  -[PUBarsController updater](self, "updater");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateIfNeeded");

}

- (BOOL)_isUpdateBarsDisabled
{
  return -[PUBarsController updateBarsDisabledCount](self, "updateBarsDisabledCount") > 0;
}

- (void)disableUpdateBarsForDuration:(double)a3
{
  dispatch_time_t v5;
  _QWORD v6[4];
  id v7;
  id location;

  -[PUBarsController setUpdateBarsDisabledCount:](self, "setUpdateBarsDisabledCount:", -[PUBarsController updateBarsDisabledCount](self, "updateBarsDisabledCount") + 1);
  objc_initWeak(&location, self);
  v5 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__PUBarsController_disableUpdateBarsForDuration___block_invoke;
  v6[3] = &unk_1E58AB2F8;
  objc_copyWeak(&v7, &location);
  dispatch_after(v5, MEMORY[0x1E0C80D38], v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_reenableUpdateBars
{
  int64_t v3;

  v3 = -[PUBarsController updateBarsDisabledCount](self, "updateBarsDisabledCount") - 1;
  -[PUBarsController setUpdateBarsDisabledCount:](self, "setUpdateBarsDisabledCount:", v3);
  if (!v3)
    -[PUBarsController invalidateBars](self, "invalidateBars");
}

- (UIEdgeInsets)contentGuideInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentGuideInsets.top;
  left = self->_contentGuideInsets.left;
  bottom = self->_contentGuideInsets.bottom;
  right = self->_contentGuideInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (PUBarsControllerDelegate)delegate
{
  return (PUBarsControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (BOOL)updateScheduled
{
  return self->_updateScheduled;
}

- (void)setUpdateScheduled:(BOOL)a3
{
  self->_updateScheduled = a3;
}

- (int64_t)updateBarsDisabledCount
{
  return self->_updateBarsDisabledCount;
}

- (void)setUpdateBarsDisabledCount:(int64_t)a3
{
  self->_updateBarsDisabledCount = a3;
}

- (UIViewController)viewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_viewController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewController);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __49__PUBarsController_disableUpdateBarsForDuration___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_reenableUpdateBars");

}

void __35__PUBarsController__setNeedsUpdate__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateNowIfNeeded");

}

@end
