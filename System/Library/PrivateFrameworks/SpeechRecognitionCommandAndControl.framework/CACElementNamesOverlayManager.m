@implementation CACElementNamesOverlayManager

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    -[CACSimpleContentViewManager setContentViewManagerDelegate:](self, "setContentViewManagerDelegate:", obj);
  }

}

- (void)showNamesForElements:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __54__CACElementNamesOverlayManager_showNamesForElements___block_invoke_2;
  v6[3] = &unk_24F2AD590;
  v7 = v4;
  v5 = v4;
  -[CACSimpleContentViewManager showViewControllerWithCreationHandler:updateHandler:](self, "showViewControllerWithCreationHandler:updateHandler:", &__block_literal_global_46, v6);

}

CACElementNamesOverlayViewController *__54__CACElementNamesOverlayManager_showNamesForElements___block_invoke()
{
  return objc_alloc_init(CACElementNamesOverlayViewController);
}

uint64_t __54__CACElementNamesOverlayManager_showNamesForElements___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setItems:", *(_QWORD *)(a1 + 32));
}

- (id)voiceOverDescriptions
{
  CACElementNamesOverlayManager *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = self;
  objc_sync_enter(v2);
  -[CACSimpleContentViewManager viewController](v2, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_sync_exit(v2);
  +[CACVoiceOverShortDescriptionGenerator sharedInstance](CACVoiceOverShortDescriptionGenerator, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "shortDescriptionsForItems:style:", v5, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isOverlay
{
  return 1;
}

- (void)hide
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CACElementNamesOverlayManager;
  -[CACSimpleContentViewManager hide](&v2, sel_hide);
}

- (void)hideWithoutAnimation
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CACElementNamesOverlayManager;
  -[CACSimpleContentViewManager hideWithoutAnimation](&v2, sel_hideWithoutAnimation);
}

- (void)startDelayedDimmingOfNumbers
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  double v8;
  dispatch_time_t v9;
  id v10;
  _QWORD block[5];

  -[CACSimpleContentViewManager setPendingDimmingTransactionID:](self, "setPendingDimmingTransactionID:", -[CACSimpleContentViewManager pendingDimmingTransactionID](self, "pendingDimmingTransactionID") + 1);
  -[CACSimpleContentViewManager setActiveDimmingTransactionID:](self, "setActiveDimmingTransactionID:", -[CACSimpleContentViewManager pendingDimmingTransactionID](self, "pendingDimmingTransactionID"));
  -[CACSimpleContentViewManager viewController](self, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 1.0);

  -[CACElementNamesOverlayManager delegate](self, "delegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isOverlayFadingEnabledForElementNamesOverlayManager:", self) & 1) != 0)
  {
    -[CACElementNamesOverlayManager delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isAlwaysShowingElementNamesOverlayManager:", self);

    if (v6)
    {
      -[CACElementNamesOverlayManager delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "overlayFadeDelayForElementNamesOverlayManager:", self);
      v9 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __61__CACElementNamesOverlayManager_startDelayedDimmingOfNumbers__block_invoke;
      block[3] = &unk_24F2AA860;
      block[4] = self;
      dispatch_after(v9, MEMORY[0x24BDAC9B8], block);

    }
  }
  else
  {

  }
}

uint64_t __61__CACElementNamesOverlayManager_startDelayedDimmingOfNumbers__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  _QWORD v4[5];

  v2 = objc_msgSend(*(id *)(a1 + 32), "activeDimmingTransactionID");
  result = objc_msgSend(*(id *)(a1 + 32), "pendingDimmingTransactionID");
  if (v2 == result)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __61__CACElementNamesOverlayManager_startDelayedDimmingOfNumbers__block_invoke_2;
    v4[3] = &unk_24F2AA860;
    v4[4] = *(_QWORD *)(a1 + 32);
    return objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:completion:", v4, 0, 1.0);
  }
  return result;
}

void __61__CACElementNamesOverlayManager_startDelayedDimmingOfNumbers__block_invoke_2(uint64_t a1)
{
  float v2;
  double v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "overlayFadeOpacityForElementNamesOverlayManager:", *(_QWORD *)(a1 + 32));
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", v3);

}

- (void)stopDelayedDimmingOfNumbers
{
  void *v3;
  id v4;

  -[CACSimpleContentViewManager setPendingDimmingTransactionID:](self, "setPendingDimmingTransactionID:", -[CACSimpleContentViewManager pendingDimmingTransactionID](self, "pendingDimmingTransactionID") + 1);
  -[CACSimpleContentViewManager viewController](self, "viewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 1.0);

}

- (CACElementNamesOverlayManagerDelegate)delegate
{
  return (CACElementNamesOverlayManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
