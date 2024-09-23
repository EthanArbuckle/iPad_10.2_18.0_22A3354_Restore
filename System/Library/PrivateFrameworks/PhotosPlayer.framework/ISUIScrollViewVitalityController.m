@implementation ISUIScrollViewVitalityController

- (id)visibilityOffsetHelper
{
  ISUIVisibilityOffsetHelper *visibilityOffsetHelper;
  ISUIVisibilityOffsetHelper *v4;
  ISUIVisibilityOffsetHelper *v5;

  visibilityOffsetHelper = self->_visibilityOffsetHelper;
  if (!visibilityOffsetHelper)
  {
    v4 = objc_alloc_init(ISUIVisibilityOffsetHelper);
    v5 = self->_visibilityOffsetHelper;
    self->_visibilityOffsetHelper = v4;

    visibilityOffsetHelper = self->_visibilityOffsetHelper;
  }
  return visibilityOffsetHelper;
}

- (ISUIScrollViewVitalityController)init
{
  ISUIScrollViewVitalityController *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ISUIScrollViewVitalityController;
  v2 = -[ISScrollViewVitalityController init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__reduceMotionDidChange_, *MEMORY[0x1E0CEB090], 0);

  }
  return v2;
}

uint64_t __64__ISUIScrollViewVitalityController_scrollViewWillBeginDragging___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setScrolling:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setDecelerating:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setEstimatedScrollEndDate:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setHasTargetContentOffset:", 0);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__scrollView);
  objc_storeStrong((id *)&self->_visibilityOffsetHelper, 0);
}

- (void)_setScrollView:(id)a3
{
  objc_storeWeak((id *)&self->__scrollView, a3);
}

- (BOOL)canPerformVitality
{
  _BOOL4 v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ISUIScrollViewVitalityController;
  v2 = -[ISScrollViewVitalityController canPerformVitality](&v4, sel_canPerformVitality);
  if (v2)
    LOBYTE(v2) = !UIAccessibilityIsReduceMotionEnabled();
  return v2;
}

- (void)_reduceMotionDidChange:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59__ISUIScrollViewVitalityController__reduceMotionDidChange___block_invoke;
  v3[3] = &unk_1E9453F48;
  v3[4] = self;
  is_dispatch_on_main_queue(v3);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __64__ISUIScrollViewVitalityController_scrollViewWillBeginDragging___block_invoke;
  v3[3] = &unk_1E9453F48;
  v3[4] = self;
  -[ISScrollViewVitalityController performChanges:](self, "performChanges:", v3);
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __95__ISUIScrollViewVitalityController_scrollViewWillEndDragging_withVelocity_targetContentOffset___block_invoke;
  v5[3] = &unk_1E94541A8;
  v5[4] = self;
  v5[5] = a5;
  -[ISScrollViewVitalityController performChanges:](self, "performChanges:", v5);
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  _QWORD v12[6];
  BOOL v13;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  v8 = 0.0;
  if (v4)
  {
    if (objc_msgSend(v6, "isPagingEnabled", 0.0))
    {
      objc_msgSend(v7, "valueForKey:", CFSTR("_pagingFriction"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "doubleValue");
      v11 = v10;

      v8 = v11 * 33.81 + -32.046;
    }
    else
    {
      v8 = 0.6;
    }
  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __76__ISUIScrollViewVitalityController_scrollViewDidEndDragging_willDecelerate___block_invoke;
  v12[3] = &unk_1E9453DF8;
  v12[4] = self;
  *(double *)&v12[5] = v8;
  v13 = v4;
  -[ISScrollViewVitalityController performChanges:](self, "performChanges:", v12);

}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __65__ISUIScrollViewVitalityController_scrollViewDidEndDecelerating___block_invoke;
  v3[3] = &unk_1E9453F48;
  v3[4] = self;
  -[ISScrollViewVitalityController performChanges:](self, "performChanges:", v3);
}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  return 1;
}

- (UIScrollView)_scrollView
{
  return (UIScrollView *)objc_loadWeakRetained((id *)&self->__scrollView);
}

uint64_t __65__ISUIScrollViewVitalityController_scrollViewDidEndDecelerating___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setScrolling:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setDecelerating:", 0);
}

uint64_t __76__ISUIScrollViewVitalityController_scrollViewDidEndDragging_willDecelerate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", *(double *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEstimatedScrollEndDate:", v3);

  v4 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 48))
    return objc_msgSend(v4, "setDecelerating:", 1);
  else
    return objc_msgSend(v4, "setScrolling:", 0);
}

uint64_t __95__ISUIScrollViewVitalityController_scrollViewWillEndDragging_withVelocity_targetContentOffset___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setHasTargetContentOffset:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "setTargetContentOffset:", **(double **)(a1 + 40), *(double *)(*(_QWORD *)(a1 + 40) + 8));
}

uint64_t __59__ISUIScrollViewVitalityController__reduceMotionDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "canPerformVitalityDidChange");
}

@end
