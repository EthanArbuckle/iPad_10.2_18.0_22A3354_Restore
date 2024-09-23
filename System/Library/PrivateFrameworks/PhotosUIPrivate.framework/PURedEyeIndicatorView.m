@implementation PURedEyeIndicatorView

- (PURedEyeIndicatorView)init
{
  PURedEyeIndicatorView *v2;
  PURedEyeIndicatorView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PURedEyeIndicatorView;
  v2 = -[PURedEyeIndicatorView init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[PURedEyeIndicatorView setBounds:](v2, "setBounds:", 0.0, 0.0, 22.0, 22.0);
    -[PURedEyeIndicatorView setAnimationType:](v3, "setAnimationType:", 0);
    -[PURedEyeIndicatorView setClearsContextBeforeDrawing:](v3, "setClearsContextBeforeDrawing:", 1);
    -[PURedEyeIndicatorView setOpaque:](v3, "setOpaque:", 0);
  }
  return v3;
}

- (void)didMoveToSuperview
{
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  CGAffineTransform v9;
  CGAffineTransform v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PURedEyeIndicatorView;
  -[PURedEyeIndicatorView didMoveToSuperview](&v11, sel_didMoveToSuperview);
  -[PURedEyeIndicatorView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PURedEyeIndicatorView window](self, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PURedEyeIndicatorView convertRect:fromView:](self, "convertRect:fromView:", v4, 0.0, 0.0, 1.0, 1.0);
    v6 = v5;
    v8 = v7;

    memset(&v10, 0, sizeof(v10));
    CGAffineTransformMakeScale(&v10, v6, v8);
    v9 = v10;
    -[UIView pu_addTransform:](self, "pu_addTransform:", &v9);
  }
}

- (void)drawRect:(CGRect)a3
{
  CGContext *CurrentContext;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MidX;
  CGFloat MidY;
  id v11;
  CGSize v12;
  CGRect v13;
  CGRect v14;

  CurrentContext = UIGraphicsGetCurrentContext();
  -[PURedEyeIndicatorView bounds](self, "bounds");
  x = v13.origin.x;
  y = v13.origin.y;
  width = v13.size.width;
  height = v13.size.height;
  MidX = CGRectGetMidX(v13);
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  MidY = CGRectGetMidY(v14);
  CGContextSetLineWidth(CurrentContext, 2.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v11, "CGColor"));

  v12.width = 0.0;
  v12.height = 1.0;
  CGContextSetShadow(CurrentContext, v12, 0.5);
  CGContextAddArc(CurrentContext, MidX, MidY, 8.0, 0.0, 6.28318531, 1);
  CGContextStrokePath(CurrentContext);
}

- (void)animateWithDelay:(double)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];
  CGAffineTransform v15;
  CGAffineTransform v16;
  CGAffineTransform v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[5];
  _QWORD v21[5];
  CGAffineTransform v22;

  v6 = a4;
  if (self->_animationType == 1)
  {
    CGAffineTransformMakeTranslation(&v22, -10.0, 0.0);
    -[UIView pu_addTransform:](self, "pu_addTransform:", &v22);
    v7 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __53__PURedEyeIndicatorView_animateWithDelay_completion___block_invoke;
    v21[3] = &unk_1E58ABD10;
    v21[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v21, 0, 1.29999995, a3, 0.100000001, 0.0);
    v8 = (void *)MEMORY[0x1E0DC3F10];
    v20[0] = v7;
    v20[1] = 3221225472;
    v20[2] = __53__PURedEyeIndicatorView_animateWithDelay_completion___block_invoke_2;
    v20[3] = &unk_1E58ABD10;
    v20[4] = self;
    v18[0] = v7;
    v18[1] = 3221225472;
    v18[2] = __53__PURedEyeIndicatorView_animateWithDelay_completion___block_invoke_3;
    v18[3] = &unk_1E58AA518;
    v19 = v6;
    v9 = v6;
    objc_msgSend(v8, "animateWithDuration:delay:options:animations:completion:", 0, v20, v18, 0.3, a3 + 0.7);
    v10 = v19;
  }
  else
  {
    memset(&v17, 0, sizeof(v17));
    -[PURedEyeIndicatorView transform](self, "transform");
    CGAffineTransformScale(&v17, &v16, 3.0, 3.0);
    v11 = (void *)MEMORY[0x1E0DC3F10];
    v14[0] = MEMORY[0x1E0C809B0];
    v15 = v17;
    v14[1] = 3221225472;
    v14[2] = __53__PURedEyeIndicatorView_animateWithDelay_completion___block_invoke_4;
    v14[3] = &unk_1E58A6FE0;
    v14[4] = self;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __53__PURedEyeIndicatorView_animateWithDelay_completion___block_invoke_5;
    v12[3] = &unk_1E58AA518;
    v13 = v6;
    v9 = v6;
    objc_msgSend(v11, "animateWithDuration:delay:options:animations:completion:", 3, v14, v12, 0.300000012, a3);
    v10 = v13;
  }

}

- (unint64_t)animationType
{
  return self->_animationType;
}

- (void)setAnimationType:(unint64_t)a3
{
  self->_animationType = a3;
}

uint64_t __53__PURedEyeIndicatorView_animateWithDelay_completion___block_invoke(uint64_t a1)
{
  void *v1;
  CGAffineTransform v3;

  v1 = *(void **)(a1 + 32);
  CGAffineTransformMakeTranslation(&v3, 10.0, 0.0);
  return objc_msgSend(v1, "pu_addTransform:", &v3);
}

uint64_t __53__PURedEyeIndicatorView_animateWithDelay_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __53__PURedEyeIndicatorView_animateWithDelay_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __53__PURedEyeIndicatorView_animateWithDelay_completion___block_invoke_4(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(a1 + 56);
  v5[0] = *(_OWORD *)(a1 + 40);
  v5[1] = v3;
  v5[2] = *(_OWORD *)(a1 + 72);
  objc_msgSend(v2, "setTransform:", v5);
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __53__PURedEyeIndicatorView_animateWithDelay_completion___block_invoke_5(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
