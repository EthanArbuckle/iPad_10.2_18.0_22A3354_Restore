@implementation UIKBBackdropView

- (UIKBBackdropView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v9;
  UIKBBackdropView *v10;
  UIKBBackdropView *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = +[UIKBRenderConfig backdropStyleForStyle:quality:](UIKBRenderConfig, "backdropStyleForStyle:quality:", a4, +[UIKBRenderFactory _graphicsQuality](UIKBRenderFactory, "_graphicsQuality"));
  v18.receiver = self;
  v18.super_class = (Class)UIKBBackdropView;
  v10 = -[UIVisualEffectView initWithFrame:](&v18, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    -[UIVisualEffectView _setGroupName:](v10, "_setGroupName:", CFSTR("UIKBBackdropGroupName"));
    v12 = *MEMORY[0x1E0CD2958];
    -[UIVisualEffectView _captureGroup](v11, "_captureGroup");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setGroupNamespace:", v12);

    _UIKBEffectsForStyle(v9, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView setBackgroundEffects:](v11, "setBackgroundEffects:", v14);

    +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "colorWithAlphaComponent:", 0.1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v11, "setBackgroundColor:", v16);

  }
  return v11;
}

- (void)_setRenderConfig:(id)a3
{
  -[UIKBBackdropView transitionToStyle:](self, "transitionToStyle:", objc_msgSend(a3, "backdropStyle"));
}

- (void)transitionToStyle:(int64_t)a3
{
  id v4;

  _UIKBEffectsForStyle(a3, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView setBackgroundEffects:](self, "setBackgroundEffects:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageForCorners, 0);
}

- (BOOL)_applyCornerMaskToSelf
{
  return 1;
}

- (id)_generateCornerContentsImage:(unint64_t)a3
{
  double v4;
  void *v5;
  UIGraphicsImageRenderer *v6;
  void *v7;
  _QWORD v9[4];
  __int128 v10;
  double v11;
  double v12;
  double v13;
  unint64_t v14;

  v4 = UIKBCornerRadius();
  v10 = *MEMORY[0x1E0C9D538];
  +[UIGraphicsImageRendererFormat preferredFormat](UIGraphicsImageRendererFormat, "preferredFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPreferredRange:", 0x7FFFLL);
  v6 = -[UIGraphicsImageRenderer initWithSize:format:]([UIGraphicsImageRenderer alloc], "initWithSize:format:", v5, v4 + v4, v4 + v4);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__UIKBBackdropView__generateCornerContentsImage___block_invoke;
  v9[3] = &__block_descriptor_80_e40_v16__0__UIGraphicsImageRendererContext_8l;
  v11 = v4 + v4;
  v12 = v4 + v4;
  v13 = v4;
  v14 = a3;
  -[UIGraphicsImageRenderer imageWithActions:](v6, "imageWithActions:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __49__UIKBBackdropView__generateCornerContentsImage___block_invoke(uint64_t a1, void *a2)
{
  CGContext *v3;
  id v4;

  v3 = (CGContext *)objc_msgSend(a2, "CGContext");
  CGContextSaveGState(v3);
  UIKBAddRoundedRect(v3, *(_QWORD *)(a1 + 72), *(CGFloat *)(a1 + 32), *(CGFloat *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(CGFloat *)(a1 + 64));
  CGContextClosePath(v3);
  +[UIColor blackColor](UIColor, "blackColor");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(v3, (CGColorRef)objc_msgSend(v4, "CGColor"));

  CGContextFillPath(v3);
  CGContextRestoreGState(v3);
}

- (void)updateCorners:(unint64_t)a3
{
  char v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  -[UIKBBackdropView _generateCornerContentsImage:](self, "_generateCornerContentsImage:");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  +[_UIVisualEffectViewCornerMask imageCornerMaskWithImage:radius:](_UIVisualEffectViewCornerMask, "imageCornerMaskWithImage:radius:", v7, UIKBCornerRadius());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cornerMaskAppliedToCorners:", v3 & 0xF);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView _setCornerMask:](self, "_setCornerMask:", v6);

}

- (void)setImageForCorners:(id)a3
{
  UIImage *v5;
  UIImage *imageForCorners;
  void *v7;
  void *v8;
  UIImage *v9;

  v5 = (UIImage *)a3;
  if (self->_imageForCorners != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->_imageForCorners, a3);
    imageForCorners = self->_imageForCorners;
    -[UIVisualEffectView _cornerRadius](self, "_cornerRadius");
    +[_UIVisualEffectViewCornerMask imageCornerMaskWithImage:radius:](_UIVisualEffectViewCornerMask, "imageCornerMaskWithImage:radius:", imageForCorners);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cornerMaskEffectingEdges:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView _setCornerMask:](self, "_setCornerMask:", v8);

    v5 = v9;
  }

}

- (int)textEffectsVisibilityLevel
{
  return 9;
}

- (UIImage)imageForCorners
{
  return self->_imageForCorners;
}

@end
