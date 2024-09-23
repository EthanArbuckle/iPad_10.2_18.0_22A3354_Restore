@implementation UIStatusBarItemView

+ (id)createViewForItem:(id)a3 withData:(id)a4 actions:(int)a5 foregroundStyle:(id)a6
{
  uint64_t v6;
  id v9;
  id v10;
  id v11;
  void *v12;

  if (!a3)
    return 0;
  v6 = *(_QWORD *)&a5;
  v9 = a6;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v11, "viewClass")), "initWithItem:data:actions:style:", v11, v10, v6, v9);

  return v12;
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  char v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UIStatusBarItemView;
  if (-[UIView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4))
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("contents"));

  return v5;
}

- (UIStatusBarItemView)initWithItem:(id)a3 data:(id)a4 actions:(int)a5 style:(id)a6
{
  uint64_t v7;
  id v11;
  id v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  int v20;
  double v21;
  double v22;
  UIStatusBarItemView *v23;
  UIStatusBarItemView *v24;
  double v25;
  void *v26;

  v7 = *(_QWORD *)&a5;
  v11 = a3;
  v12 = a4;
  v13 = a6;
  objc_msgSend(v13, "height");
  v15 = v14;
  v16 = *MEMORY[0x1E0C9D648];
  v17 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v18 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v19 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v20 = objc_msgSend(v13, "usesVerticalLayout");
  if (v20)
    v21 = v15;
  else
    v21 = v18;
  if (v20)
    v22 = v19;
  else
    v22 = v15;
  v23 = -[UIView initWithFrame:](self, "initWithFrame:", v16, v17, v21, v22);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_item, a3);
    v24->_imageContext = 0;
    objc_msgSend(v13, "scale");
    v24->_imageContextScale = v25;
    objc_storeStrong((id *)&v24->_foregroundStyle, a6);
    -[UIStatusBarItemView updateForNewStyle:](v24, "updateForNewStyle:", v13);
    -[UIView layer](v24, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setAllowsGroupOpacity:", 0);

    -[UIStatusBarItemView setAllowsUpdates:](v24, "setAllowsUpdates:", 1);
    -[UIView setUserInteractionEnabled:](v24, "setUserInteractionEnabled:", -[UIStatusBarItemView allowsUserInteraction](v24, "allowsUserInteraction"));
    -[UIStatusBarItemView updateForNewData:actions:](v24, "updateForNewData:actions:", v12, v7);
    -[UIStatusBarItemView updateContentsAndWidth](v24, "updateContentsAndWidth");
  }

  return v24;
}

- (BOOL)allowsUserInteraction
{
  return 0;
}

- (void)dealloc
{
  CGContext *imageContext;
  objc_super v4;

  imageContext = self->_imageContext;
  if (imageContext)
    CFRelease(imageContext);
  v4.receiver = self;
  v4.super_class = (Class)UIStatusBarItemView;
  -[UIView dealloc](&v4, sel_dealloc);
}

- (id)foregroundView
{
  void *v3;
  char isKindOfClass;
  void *v5;

  -[UIView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[UIView superview](self, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)setVisible:(BOOL)a3
{
  -[UIStatusBarItemView setVisible:settingAlpha:](self, "setVisible:settingAlpha:", a3, 1);
}

- (void)setVisible:(BOOL)a3 settingAlpha:(BOOL)a4
{
  double v4;

  self->_visible = a3;
  if (a4)
  {
    v4 = 0.0;
    if (a3)
      v4 = 1.0;
    -[UIView setAlpha:](self, "setAlpha:", v4);
  }
}

- (void)setVisible:(BOOL)a3 frame:(CGRect)a4 duration:(double)a5
{
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v12;
  _QWORD v13[5];
  BOOL v14;
  _QWORD v15[5];
  BOOL v16;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = a5 > 0.0
     && +[UIView _isInAnimationBlockWithAnimationsEnabled](UIView, "_isInAnimationBlockWithAnimationsEnabled");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __49__UIStatusBarItemView_setVisible_frame_duration___block_invoke;
  v15[3] = &__block_descriptor_41_e24_v24__0___v___8___v__B_16l;
  *(double *)&v15[4] = a5;
  v16 = a3;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __49__UIStatusBarItemView_setVisible_frame_duration___block_invoke_2;
  v13[3] = &unk_1E16B1B78;
  v13[4] = self;
  v14 = a3;
  +[UIView conditionallyAnimate:withAnimation:layout:completion:](UIView, "conditionallyAnimate:withAnimation:layout:completion:", v12, v15, v13, 0);
  -[UIView setFrame:](self, "setFrame:", x, y, width, height);
}

uint64_t __49__UIStatusBarItemView_setVisible_frame_duration___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double v3;
  double v4;

  v3 = *(double *)(a1 + 32);
  v4 = v3 * 0.333333333;
  if (!*(_BYTE *)(a1 + 40))
    v4 = 0.0;
  return +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 32, a2, a3, v3 * 0.666666667, v4);
}

uint64_t __49__UIStatusBarItemView_setVisible_frame_duration___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setVisible:", *(unsigned __int8 *)(a1 + 40));
}

- (void)setCurrentOverlap:(double)a3
{
  self->_currentOverlap = a3;
}

- (double)currentOverlap
{
  return self->_currentOverlap;
}

- (double)currentLeftOverlap
{
  return ceil(self->_currentOverlap * 0.5);
}

- (double)currentRightOverlap
{
  return floor(self->_currentOverlap * 0.5);
}

- (double)setStatusBarData:(id)a3 actions:(int)a4
{
  uint64_t v4;
  id v6;
  double v7;
  double v8;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = 0.0;
  if (-[UIStatusBarItemView allowsUpdates](self, "allowsUpdates")
    && -[UIStatusBarItemView updateForNewData:actions:](self, "updateForNewData:actions:", v6, v4))
  {
    -[UIStatusBarItemView updateContentsAndWidth](self, "updateContentsAndWidth");
    v7 = v8;
  }

  return v7;
}

- (int64_t)legibilityStyle
{
  void *v2;
  int64_t v3;

  -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "legibilityStyle");

  return v3;
}

- (double)legibilityStrength
{
  return 0.3;
}

- (void)setLayerContentsImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  int64_t v8;
  void *v9;
  _UILegibilityView *v10;
  _UILegibilitySettings *v11;
  _UILegibilityView *v12;
  _UILegibilityView *v13;
  _UILegibilityView *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _UILegibilityView *legibilityView;
  _UILegibilityView *v20;
  _UILegibilityView *v21;
  _UILegibilityView *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  CGAffineTransform v30;
  CGAffineTransform v31;

  v4 = a3;
  v5 = v4;
  if (!v4 || (objc_msgSend(v4, "image"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v6, !v6))
  {
    -[UIView layer](self, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setContents:", 0);

    -[UIView layer](self, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setMask:", 0);

    legibilityView = self->_legibilityView;
    if (legibilityView)
    {
      -[UIView removeFromSuperview](legibilityView, "removeFromSuperview");
      v20 = self->_legibilityView;
      self->_legibilityView = 0;

    }
    -[UIView layer](self, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setContentsMultiplyColor:", 0);
    goto LABEL_10;
  }
  v7 = -[UIStatusBarItemView legibilityStyle](self, "legibilityStyle");
  if (v7)
  {
    v8 = v7;
    -[UIView layer](self, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setContents:", 0);

    v10 = self->_legibilityView;
    if (!v10)
    {
      v11 = -[_UILegibilitySettings initWithStyle:]([_UILegibilitySettings alloc], "initWithStyle:", v8);
      v12 = [_UILegibilityView alloc];
      -[UIStatusBarItemView legibilityStrength](self, "legibilityStrength");
      v13 = -[_UILegibilityView initWithSettings:strength:image:](v12, "initWithSettings:strength:image:", v11, 0);
      v14 = self->_legibilityView;
      self->_legibilityView = v13;

      -[UIView bounds](self, "bounds");
      -[UIView setFrame:](self->_legibilityView, "setFrame:");
      -[UIView setAutoresizingMask:](self->_legibilityView, "setAutoresizingMask:", 18);
      -[UIView setContentMode:](self->_legibilityView, "setContentMode:", -[UIView contentMode](self, "contentMode"));
      -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_legibilityView, 0);

      v10 = self->_legibilityView;
    }
    objc_msgSend(v5, "image");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "shadowImage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UILegibilityView setImage:shadowImage:](v10, "setImage:shadowImage:", v15, v16);

LABEL_10:
    goto LABEL_11;
  }
  v21 = self->_legibilityView;
  if (v21)
  {
    -[UIView removeFromSuperview](v21, "removeFromSuperview");
    v22 = self->_legibilityView;
    self->_legibilityView = 0;

  }
  if (-[UIStatusBarItemView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
  {
    objc_msgSend(v5, "image");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "imageOrientation");

    if (v24 == 4)
    {
      memset(&v31, 0, sizeof(v31));
      CGAffineTransformMakeScale(&v31, -1.0, 1.0);
      -[UIView layer](self, "layer");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v31;
      objc_msgSend(v25, "setAffineTransform:", &v30);

    }
  }
  objc_msgSend(v5, "image");
  v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v27 = objc_msgSend(v26, "CGImage");
  -[UIView layer](self, "layer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setContents:", v27);

  objc_msgSend(v5, "image");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "scale");
  -[UIView setContentScaleFactor:](self, "setContentScaleFactor:");

  -[UIStatusBarItemView _tintContentLayerIfNeeded](self, "_tintContentLayerIfNeeded");
LABEL_11:

}

- (double)adjustFrameToNewSize:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  int v14;
  double v15;
  double v16;
  double v17;
  double v18;

  -[UIView frame](self, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "usesVerticalLayout");

  if (v14)
    v15 = v12;
  else
    v15 = v10;
  if (v15 == a3)
    return 0.0;
  v16 = a3 - v15;
  if (v14)
    v17 = v10;
  else
    v17 = a3;
  if (v14)
    v18 = a3;
  else
    v18 = v12;
  -[UIView setFrame:](self, "setFrame:", v6, v8, v17, v18);
  return v16;
}

- (double)neededSizeForImageSet:(id)a3
{
  id v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;

  v4 = a3;
  v5 = v4;
  v6 = 0.0;
  if (v4)
  {
    objc_msgSend(v4, "image");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v5, "image");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "size");
      v6 = v9;
      v11 = v10;

      -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "usesVerticalLayout"))
        v6 = v11;

    }
  }

  return v6;
}

- (void)_tintContentLayerIfNeeded
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  if (-[UIStatusBarItemView shouldTintContentImage](self, "shouldTintContentImage"))
  {
    -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tintColor");
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = objc_msgSend(v3, "CGColor");
    -[UIView layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setContentsMultiplyColor:", v4);

  }
  else
  {
    -[UIView layer](self, "layer");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContentsMultiplyColor:", 0);
  }

}

- (double)updateContentsAndWidth
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;

  -[UIStatusBarItemView contentsImage](self, "contentsImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UIStatusBarItemView neededSizeForImageSet:](self, "neededSizeForImageSet:", v3);
    -[UIStatusBarItemView adjustFrameToNewSize:](self, "adjustFrameToNewSize:");
    v5 = v4;
    objc_msgSend(v3, "image");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      -[UIStatusBarItemView setLayerContentsImage:](self, "setLayerContentsImage:", v3);
  }
  else
  {
    -[UIStatusBarItemView contentsIOSurface](self, "contentsIOSurface");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      -[UIStatusBarItemView setLayerContentsImage:](self, "setLayerContentsImage:", 0);
      -[UIView _currentScreenScale](self, "_currentScreenScale");
      v10 = v9;
      -[UIView layer](self, "layer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setContents:", v8);

      -[UIView layer](self, "layer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setContentsScale:", v10);

      -[UIStatusBarItemView _tintContentLayerIfNeeded](self, "_tintContentLayerIfNeeded");
      -[UIStatusBarItemView adjustFrameToNewSize:](self, "adjustFrameToNewSize:", (double)objc_msgSend(v8, "width") / v10);
      v5 = v13;

    }
    else
    {
      -[UIStatusBarItemView neededSizeForImageSet:](self, "neededSizeForImageSet:", 0);
      -[UIStatusBarItemView adjustFrameToNewSize:](self, "adjustFrameToNewSize:");
      v5 = v14;
    }
  }

  return v5;
}

- (void)setContentMode:(int64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIStatusBarItemView;
  -[UIView setContentMode:](&v5, sel_setContentMode_);
  -[UIView setContentMode:](self->_legibilityView, "setContentMode:", a3);
}

- (int64_t)textStyle
{
  return 1;
}

- (id)textFont
{
  void *v3;
  void *v4;

  -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textFontForStyle:", -[UIStatusBarItemView textStyle](self, "textStyle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)textAlignment
{
  void *v2;
  int64_t v3;

  -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "usesVerticalLayout");

  return v3;
}

- (double)standardPadding
{
  void *v2;
  double v3;
  double v4;

  -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "standardPadding");
  v4 = v3;

  return v4;
}

- (double)shadowPadding
{
  void *v2;
  double v3;
  double v4;

  -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shadowPadding");
  v4 = v3;

  return v4;
}

- (double)extraLeftPadding
{
  return 0.0;
}

- (double)extraRightPadding
{
  return 0.0;
}

- (double)resetContentOverlap
{
  return 0.0;
}

- (double)addContentOverlap:(double)a3
{
  return 0.0;
}

- (double)maximumOverlap
{
  return 0.0;
}

- (BOOL)updateForNewData:(id)a3 actions:(int)a4
{
  return 0;
}

- (BOOL)animatesDataChange
{
  return 0;
}

- (id)contentsImage
{
  return 0;
}

- (id)contentsIOSurface
{
  return 0;
}

- (void)beginImageContextWithMinimumWidth:(double)a3
{
  double v4;
  void *v5;
  int v6;
  CGContext *imageContext;
  size_t Height;
  void *v9;
  double v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  _QWORD *ContextStack;
  CGContext *v15;
  CGContext *v16;
  CGFloat Width;
  CGRect v18;

  v4 = ceil(a3);
  -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "usesVerticalLayout");

  imageContext = self->_imageContext;
  if (imageContext)
  {
    if (v6)
      Height = CGBitmapContextGetHeight(imageContext);
    else
      Height = CGBitmapContextGetWidth(imageContext);
    if (v4 == (double)Height / self->_imageContextScale)
    {
      v16 = self->_imageContext;
      if (v16)
      {
        Width = (double)CGBitmapContextGetWidth(self->_imageContext);
        v18.size.height = (double)CGBitmapContextGetHeight(self->_imageContext);
        v18.origin.x = 0.0;
        v18.origin.y = 0.0;
        v18.size.width = Width;
        CGContextClearRect(v16, v18);
        UIGraphicsPushContext(self->_imageContext);
        return;
      }
    }
    else
    {
      CFRelease(self->_imageContext);
      self->_imageContext = 0;
    }
  }
  if (v4 > 0.0)
  {
    -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "height");
    v11 = v10;

    if (v6)
      v12 = v11;
    else
      v12 = v4;
    if (v6)
      v13 = v4;
    else
      v13 = v11;
    _UIGraphicsBeginImageContextWithOptions(0, 0, v12, v13, self->_imageContextScale);
    ContextStack = GetContextStack(0);
    if (*(int *)ContextStack <= 0)
    {
      self->_imageContext = 0;
    }
    else
    {
      v15 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
      self->_imageContext = v15;
      if (v15)
        CFRetain(v15);
    }
  }
}

- (id)imageFromImageContextClippedToWidth:(double)a3
{
  CGContext *imageContext;
  CGImageRef Image;
  CGImage *v7;
  void *v8;
  double Width;
  double Height;
  void *v11;
  CGImageRef v12;
  CGImageRef v13;
  CGRect v15;

  imageContext = self->_imageContext;
  if (imageContext && (Image = CGBitmapContextCreateImage(imageContext)) != 0)
  {
    v7 = Image;
    -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "usesVerticalLayout"))
    {
      Width = (double)CGImageGetWidth(v7);
      Height = self->_imageContextScale * a3;
    }
    else
    {
      Width = self->_imageContextScale * a3;
      Height = (double)CGImageGetHeight(v7);
    }

    v15.origin.x = *(CGFloat *)MEMORY[0x1E0C9D538];
    v15.origin.y = *(CGFloat *)(MEMORY[0x1E0C9D538] + 8);
    v15.size.width = Width;
    v15.size.height = Height;
    v12 = CGImageCreateWithImageInRect(v7, v15);
    if (v12)
    {
      v13 = v12;
      +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", v12, 0, self->_imageContextScale);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      CFRelease(v13);
    }
    else
    {
      v11 = 0;
    }
    CFRelease(v7);
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (void)endImageContext
{
  _QWORD *ContextStack;
  CGContext *v4;
  int *v5;

  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
    v4 = 0;
  else
    v4 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  if (v4 == self->_imageContext)
  {
    v5 = (int *)GetContextStack(0);
    PopContextFromStack(v5);
  }
}

- (id)imageWithText:(id)a3
{
  return -[UIStatusBarItemView imageWithText:shouldCache:](self, "imageWithText:shouldCache:", a3, 1);
}

- (id)imageWithText:(id)a3 shouldCache:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int64_t v10;
  int64_t v11;
  int64_t v12;
  double v13;
  void *v14;
  uint64_t v16;

  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStatusBarItemView item](self, "item");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "type");
    v10 = -[UIStatusBarItemView textAlignment](self, "textAlignment");
    v11 = -[UIStatusBarItemView textStyle](self, "textStyle");
    v12 = -[UIStatusBarItemView legibilityStyle](self, "legibilityStyle");
    -[UIStatusBarItemView legibilityStrength](self, "legibilityStrength");
    LOBYTE(v16) = a4;
    objc_msgSend(v7, "imageWithText:ofItemType:forWidth:lineBreakMode:letterSpacing:textAlignment:style:withLegibilityStyle:legibilityStrength:shouldCache:", v6, v9, 2, v10, v11, v12, 1.79769313e308, 0.0, v13, v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)cachedImageWithText:(id)a3 truncatedWithEllipsesAtMaxWidth:(double)a4 letterSpacing:(double)a5
{
  id v8;
  _UILegibilityImageSet *lastGeneratedTextImage;
  void *v10;
  double v11;
  _UILegibilityImageSet *v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int64_t v17;
  int64_t v18;
  int64_t v19;
  double v20;
  _UILegibilityImageSet *v21;
  _UILegibilityImageSet *v22;

  v8 = a3;
  if (objc_msgSend(v8, "length"))
  {
    if (-[NSString isEqualToString:](self->_lastGeneratedTextImageText, "isEqualToString:", v8))
    {
      lastGeneratedTextImage = self->_lastGeneratedTextImage;
      if (lastGeneratedTextImage)
      {
        -[_UILegibilityImageSet image](lastGeneratedTextImage, "image");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "size");
        if (v11 <= a4)
        {
          v13 = vabdd_f64(self->_lastGeneratedTextImageLetterSpacing, a5);

          if (v13 <= 2.22044605e-16)
          {
LABEL_9:
            v12 = self->_lastGeneratedTextImage;
            goto LABEL_10;
          }
        }
        else
        {

        }
      }
    }
    -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStatusBarItemView item](self, "item");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "type");
    v17 = -[UIStatusBarItemView textAlignment](self, "textAlignment");
    v18 = -[UIStatusBarItemView textStyle](self, "textStyle");
    v19 = -[UIStatusBarItemView legibilityStyle](self, "legibilityStyle");
    -[UIStatusBarItemView legibilityStrength](self, "legibilityStrength");
    objc_msgSend(v14, "imageWithText:ofItemType:forWidth:lineBreakMode:letterSpacing:textAlignment:style:withLegibilityStyle:legibilityStrength:", v8, v16, 4, v17, v18, v19, a4, a5, v20);
    v21 = (_UILegibilityImageSet *)objc_claimAutoreleasedReturnValue();
    v22 = self->_lastGeneratedTextImage;
    self->_lastGeneratedTextImage = v21;

    self->_lastGeneratedTextImageLetterSpacing = a5;
    goto LABEL_9;
  }
  v12 = 0;
LABEL_10:

  return v12;
}

- (void)clearCachedTextImage
{
  NSString *lastGeneratedTextImageText;
  _UILegibilityImageSet *lastGeneratedTextImage;

  lastGeneratedTextImageText = self->_lastGeneratedTextImageText;
  self->_lastGeneratedTextImageText = 0;

  lastGeneratedTextImage = self->_lastGeneratedTextImage;
  self->_lastGeneratedTextImage = 0;

  self->_lastGeneratedTextImageLetterSpacing = 0.0;
}

- (id)imageWithShadowNamed:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  void *v7;

  v4 = a3;
  -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[UIStatusBarItemView legibilityStyle](self, "legibilityStyle");
  -[UIStatusBarItemView legibilityStrength](self, "legibilityStrength");
  objc_msgSend(v5, "imageNamed:withLegibilityStyle:legibilityStrength:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)beginDisablingRasterization
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", 0x1E176EB20, self);

}

- (void)endDisablingRasterization
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", 0x1E176EB40, self);

}

- (void)willMoveToWindow:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (!v4)
    -[UIStatusBarItemView endDisablingRasterization](self, "endDisablingRasterization");
  v5.receiver = self;
  v5.super_class = (Class)UIStatusBarItemView;
  -[UIView willMoveToWindow:](&v5, sel_willMoveToWindow_, v4);

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIStatusBarItemView;
  -[UIView description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStatusBarItemView item](self, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" [Item = %@]"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_shouldReverseLayoutDirection
{
  return +[UIStatusBar _deviceUserInterfaceLayoutDirection](UIStatusBar, "_deviceUserInterfaceLayoutDirection") == 1;
}

- (id)accessibilityHUDRepresentation
{
  return 0;
}

- (UIStatusBarItem)item
{
  return self->_item;
}

- (UIStatusBarLayoutManager)layoutManager
{
  return (UIStatusBarLayoutManager *)objc_loadWeakRetained((id *)&self->_layoutManager);
}

- (void)setLayoutManager:(id)a3
{
  objc_storeWeak((id *)&self->_layoutManager, a3);
}

- (UIStatusBarForegroundStyleAttributes)foregroundStyle
{
  return self->_foregroundStyle;
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (BOOL)allowsUpdates
{
  return self->_allowsUpdates;
}

- (void)setAllowsUpdates:(BOOL)a3
{
  self->_allowsUpdates = a3;
}

- (BOOL)shouldTintContentImage
{
  return self->_shouldTintContentImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foregroundStyle, 0);
  objc_destroyWeak((id *)&self->_layoutManager);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_lastGeneratedTextImageText, 0);
  objc_storeStrong((id *)&self->_lastGeneratedTextImage, 0);
  objc_storeStrong((id *)&self->_legibilityView, 0);
}

@end
