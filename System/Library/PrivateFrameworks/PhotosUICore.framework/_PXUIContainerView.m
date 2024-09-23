@implementation _PXUIContainerView

- (void)didMoveToWindow
{
  void *v3;
  _QWORD block[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_PXUIContainerView;
  -[_PXUIContainerView didMoveToWindow](&v5, sel_didMoveToWindow);
  -[_PXUIContainerView deferredAppearingAnimation](self, "deferredAppearingAnimation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37___PXUIContainerView_didMoveToWindow__block_invoke;
    block[3] = &unk_1E5149198;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

- (id)deferredAppearingAnimation
{
  return self->_deferredAppearingAnimation;
}

- (void)setDeferredAppearingAnimation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deferredAppearingAnimation, 0);
}

@end
