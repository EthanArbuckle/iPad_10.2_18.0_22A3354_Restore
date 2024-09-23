@implementation PXLivePhotoTrimScrubberHiddenAnimationHelper

- (PXLivePhotoTrimScrubberHiddenAnimationHelper)initWithAnimationBlock:(id)a3
{
  id v4;
  PXLivePhotoTrimScrubberHiddenAnimationHelper *v5;
  uint64_t v6;
  id animationBlock;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXLivePhotoTrimScrubberHiddenAnimationHelper;
  v5 = -[PXLivePhotoTrimScrubberHiddenAnimationHelper init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    animationBlock = v5->_animationBlock;
    v5->_animationBlock = (id)v6;

  }
  return v5;
}

- (void)setHidden:(BOOL)a3
{
  -[PXLivePhotoTrimScrubberHiddenAnimationHelper setHidden:animated:](self, "setHidden:animated:", a3, 0);
}

- (void)setHidden:(BOOL)a3 animated:(BOOL)a4
{
  -[PXLivePhotoTrimScrubberHiddenAnimationHelper _setHidden:animated:afterDelay:](self, "_setHidden:animated:afterDelay:", a3, a4, 0.0);
}

- (void)_setHidden:(BOOL)a3 animated:(BOOL)a4 afterDelay:(double)a5
{
  int64_t hideRequestCounter;
  void *v8;
  dispatch_time_t v10;
  _QWORD v11[4];
  id v12[2];
  BOOL v13;
  BOOL v14;
  id location;

  hideRequestCounter = self->_hideRequestCounter;
  v8 = (void *)(hideRequestCounter + 1);
  self->_hideRequestCounter = hideRequestCounter + 1;
  if (a5 <= 0.0)
  {
    -[PXLivePhotoTrimScrubberHiddenAnimationHelper _setHidden:animated:withRequstID:](self, "_setHidden:animated:withRequstID:", a3, a4, hideRequestCounter + 1);
  }
  else
  {
    objc_initWeak(&location, self);
    v10 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __79__PXLivePhotoTrimScrubberHiddenAnimationHelper__setHidden_animated_afterDelay___block_invoke;
    v11[3] = &unk_1E51411A8;
    objc_copyWeak(v12, &location);
    v13 = a3;
    v14 = a4;
    v12[1] = v8;
    dispatch_after(v10, MEMORY[0x1E0C80D38], v11);
    objc_destroyWeak(v12);
    objc_destroyWeak(&location);
  }
}

- (void)_setHidden:(BOOL)a3 animated:(BOOL)a4 withRequstID:(int64_t)a5
{
  _BOOL8 v5;
  void (**v6)(id, _BOOL8);
  _QWORD v7[5];
  BOOL v8;

  if (self->_hideRequestCounter == a5)
  {
    v5 = a3;
    if (self->_hidden != a3)
    {
      self->_hidden = a3;
      if (a4)
      {
        v7[0] = MEMORY[0x1E0C809B0];
        v7[1] = 3221225472;
        v7[2] = __81__PXLivePhotoTrimScrubberHiddenAnimationHelper__setHidden_animated_withRequstID___block_invoke;
        v7[3] = &unk_1E5144398;
        v7[4] = self;
        v8 = a3;
        objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v7, 0);
      }
      else
      {
        -[PXLivePhotoTrimScrubberHiddenAnimationHelper animationBlock](self, "animationBlock");
        v6 = (void (**)(id, _BOOL8))objc_claimAutoreleasedReturnValue();
        v6[2](v6, v5);

      }
    }
  }
}

- (id)animationBlock
{
  return self->_animationBlock;
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_animationBlock, 0);
}

void __81__PXLivePhotoTrimScrubberHiddenAnimationHelper__setHidden_animated_withRequstID___block_invoke(uint64_t a1)
{
  void (**v2)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "animationBlock");
  v2 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(unsigned __int8 *)(a1 + 40));

}

void __79__PXLivePhotoTrimScrubberHiddenAnimationHelper__setHidden_animated_afterDelay___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_setHidden:animated:withRequstID:", *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), *(_QWORD *)(a1 + 40));

}

@end
