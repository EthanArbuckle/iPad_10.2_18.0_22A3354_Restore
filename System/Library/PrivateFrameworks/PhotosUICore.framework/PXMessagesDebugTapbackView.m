@implementation PXMessagesDebugTapbackView

- (PXMessagesDebugTapbackView)initWithFrame:(CGRect)a3
{
  PXMessagesDebugTapbackView *v3;
  void *v4;
  uint64_t v5;
  UIImageView *heartImageView;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXMessagesDebugTapbackView;
  v3 = -[PXMessagesDebugTapbackView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("heart.circle.fill"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v4);
    heartImageView = v3->_heartImageView;
    v3->_heartImageView = (UIImageView *)v5;

    objc_msgSend(MEMORY[0x1E0DC3658], "orangeColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v3->_heartImageView, "setTintColor:", v7);

    -[PXMessagesDebugTapbackView addSubview:](v3, "addSubview:", v3->_heartImageView);
  }
  return v3;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXMessagesDebugTapbackView;
  -[PXMessagesDebugTapbackView layoutSubviews](&v3, sel_layoutSubviews);
  -[PXMessagesDebugTapbackView bounds](self, "bounds");
  PXRectGetCenter();
  PXRectWithCenterAndSize();
  -[UIImageView setFrame:](self->_heartImageView, "setFrame:");
}

- (void)becomeReusable
{
  void *v3;

  -[PXMessagesDebugTapbackView setReuseCounter:](self, "setReuseCounter:", -[PXMessagesDebugTapbackView reuseCounter](self, "reuseCounter") + 1);
  -[UIImageView setAlpha:](self->_heartImageView, "setAlpha:", 0.0);
  -[UIImageView layer](self->_heartImageView, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllAnimations");

  -[PXMessagesDebugTapbackView setIsAnimating:](self, "setIsAnimating:", 0);
  -[PXMessagesDebugTapbackView setUserData:](self, "setUserData:", 0);
}

- (BOOL)shouldReloadForUserData:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  int v10;

  v4 = a3;
  objc_msgSend(v4, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isFavorite");

  if (v6)
  {
    -[PXMessagesDebugTapbackUserData asset](self->_userData, "asset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isFavorite");
    objc_msgSend(v4, "asset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v8 ^ objc_msgSend(v9, "isFavorite");

  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (BOOL)shouldReuseWhenInvisible
{
  return 1;
}

- (NSCopying)userData
{
  return (NSCopying *)self->_userData;
}

- (void)setUserData:(id)a3
{
  PXMessagesDebugTapbackUserData *v5;
  char v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  double v11;
  PXMessagesDebugTapbackUserData *v12;

  v12 = (PXMessagesDebugTapbackUserData *)a3;
  v5 = self->_userData;
  if (v5 == v12)
  {

  }
  else
  {
    v6 = -[PXMessagesDebugTapbackUserData isEqual:](v5, "isEqual:", v12);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_userData, a3);
      -[PXMessagesDebugTapbackUserData asset](v12, "asset");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isFavorite");

      if (v8)
      {
        -[PXMessagesDebugTapbackUserData asset](v12, "asset");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isFavorite");
        v11 = 0.0;
        if (v10)
          v11 = 1.0;
        -[UIImageView setAlpha:](self->_heartImageView, "setAlpha:", v11);

        if (-[PXMessagesDebugTapbackUserData shouldAnimate](v12, "shouldAnimate"))
        {
          -[PXMessagesDebugTapbackUserData setShouldAnimate:](v12, "setShouldAnimate:", 0);
          -[PXMessagesDebugTapbackView _bounce](self, "_bounce");
        }
      }
    }
  }

}

- (void)_bounce
{
  int64_t reuseCounter;
  uint64_t v4;
  _QWORD v5[6];
  _QWORD v6[5];
  _QWORD v7[5];

  if (!-[PXMessagesDebugTapbackView isAnimating](self, "isAnimating"))
  {
    reuseCounter = self->_reuseCounter;
    -[PXMessagesDebugTapbackView setIsAnimating:](self, "setIsAnimating:", 1);
    v4 = MEMORY[0x1E0C809B0];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __37__PXMessagesDebugTapbackView__bounce__block_invoke;
    v7[3] = &unk_1E5149198;
    v7[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, v7, 0, 0.1, 0.0, 1.0, 1.0);
    v5[5] = reuseCounter;
    v6[0] = v4;
    v6[1] = 3221225472;
    v6[2] = __37__PXMessagesDebugTapbackView__bounce__block_invoke_2;
    v6[3] = &unk_1E5149198;
    v6[4] = self;
    v5[0] = v4;
    v5[1] = 3221225472;
    v5[2] = __37__PXMessagesDebugTapbackView__bounce__block_invoke_3;
    v5[3] = &unk_1E5142B00;
    v5[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, v6, v5, 0.5, 0.09, 0.5, 1.0);
  }
}

- (void)setAlpha:(double)a3
{
  if (self->_desiredAlpha != a3)
  {
    self->_desiredAlpha = a3;
    -[PXMessagesDebugTapbackView _updateFinalAlpha](self, "_updateFinalAlpha");
  }
}

- (void)setIsAnimating:(BOOL)a3
{
  if (self->_isAnimating != a3)
  {
    self->_isAnimating = a3;
    -[PXMessagesDebugTapbackView _updateFinalAlpha](self, "_updateFinalAlpha");
  }
}

- (void)_updateFinalAlpha
{
  BOOL v3;
  double v4;
  objc_super v5;

  v3 = -[PXMessagesDebugTapbackView isAnimating](self, "isAnimating");
  v4 = 1.0;
  if (!v3)
    -[PXMessagesDebugTapbackView desiredAlpha](self, "desiredAlpha", 1.0);
  v5.receiver = self;
  v5.super_class = (Class)PXMessagesDebugTapbackView;
  -[PXMessagesDebugTapbackView setAlpha:](&v5, sel_setAlpha_, v4);
}

- (CGRect)clippingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->clippingRect.origin.x;
  y = self->clippingRect.origin.y;
  width = self->clippingRect.size.width;
  height = self->clippingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setClippingRect:(CGRect)a3
{
  self->clippingRect = a3;
}

- (double)desiredAlpha
{
  return self->_desiredAlpha;
}

- (void)setDesiredAlpha:(double)a3
{
  self->_desiredAlpha = a3;
}

- (BOOL)isAnimating
{
  return self->_isAnimating;
}

- (int64_t)reuseCounter
{
  return self->_reuseCounter;
}

- (void)setReuseCounter:(int64_t)a3
{
  self->_reuseCounter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userData, 0);
  objc_storeStrong((id *)&self->_heartImageView, 0);
}

uint64_t __37__PXMessagesDebugTapbackView__bounce__block_invoke(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;
  CGAffineTransform v5;

  CGAffineTransformMakeScale(&v5, 0.2, 0.2);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 416);
  v4 = v5;
  return objc_msgSend(v2, "setTransform:", &v4);
}

uint64_t __37__PXMessagesDebugTapbackView__bounce__block_invoke_2(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 416);
  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v4[0] = *MEMORY[0x1E0C9BAA8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return objc_msgSend(v1, "setTransform:", v4);
}

uint64_t __37__PXMessagesDebugTapbackView__bounce__block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "reuseCounter");
  if (result == *(_QWORD *)(a1 + 40))
    return objc_msgSend(*(id *)(a1 + 32), "setIsAnimating:", 0);
  return result;
}

@end
