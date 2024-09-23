@implementation _UIRemoteKeyboardPlaceholderView

+ (id)placeholderForView:(id)a3
{
  id v4;
  _UIRemoteKeyboardPlaceholderView *v5;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    v5 = [_UIRemoteKeyboardPlaceholderView alloc];
    objc_msgSend(v4, "frame");
    v8 = -[_UIRemoteKeyboardPlaceholderView initWithSize:](v5, "initWithSize:", v6, v7);
    v9 = (void *)v8;
    if (v8)
    {
      objc_storeStrong((id *)(v8 + 416), a3);
      v10 = v9;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (UIView)placeheldView
{
  UIView *mirroredView;

  mirroredView = self->_mirroredView;
  if (!mirroredView)
    mirroredView = self->_fallbackView;
  return mirroredView;
}

- (UIView)associatedView
{
  return self->_associatedView;
}

- (CGRect)_compatibleBounds
{
  double v2;
  double v3;
  double width;
  double height;
  CGRect result;

  if (self->_mirroredView)
  {
    -[UIView _compatibleBounds](self->_mirroredView, "_compatibleBounds");
  }
  else
  {
    width = self->_fixedSize.width;
    height = self->_fixedSize.height;
    v2 = 0.0;
    v3 = 0.0;
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)refreshPlaceholder
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double (**sizeBlock)(id, SEL);
  CGSize *p_fixedSize;
  void *v12;
  id WeakRetained;
  CGFloat v14;
  NSObject *v15;
  void *v16;
  CGFloat v17;
  CGFloat v18;
  void *v19;
  double v20;
  double v21;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;
  CGSize v29;
  CGSize v30;

  v28 = *MEMORY[0x1E0C80C00];
  if (self->_mirroredView)
  {
    -[UIView bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    -[UIView bounds](self->_mirroredView, "bounds");
    if (v4 != v8 || v6 != v7)
    {
LABEL_14:
      -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
      LOBYTE(sizeBlock) = 1;
      return (char)sizeBlock;
    }
  }
  sizeBlock = (double (**)(id, SEL))self->_sizeBlock;
  if (sizeBlock)
  {
    p_fixedSize = &self->_fixedSize;
    self->_fixedSize.width = sizeBlock[2](sizeBlock, a2);
    +[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_sceneForHeight);
    objc_msgSend(v12, "intersectionHeightForWindowScene:isLocalMinimumHeightOut:ignoreHorizontalOffset:", WeakRetained, &self->_isLocalMinimumHeight, 1);
    self->_fixedSize.height = v14;

    KeyboardArbiterClientLog_1();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v29.width = p_fixedSize->width;
      v29.height = self->_fixedSize.height;
      NSStringFromCGSize(v29);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bounds](self, "bounds");
      v30.width = v17;
      v30.height = v18;
      NSStringFromCGSize(v30);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138412546;
      v25 = v16;
      v26 = 2112;
      v27 = v19;
      _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_DEFAULT, "-[_UIRemoteKeyboardPlaceholderView refreshPlaceholder]  refreshPlaceholder: size=%@ [previous size=%@]", (uint8_t *)&v24, 0x16u);

    }
    -[UIView bounds](self, "bounds");
    if (v21 == p_fixedSize->width && v20 == self->_fixedSize.height)
    {
      LOBYTE(sizeBlock) = 0;
      return (char)sizeBlock;
    }
    goto LABEL_14;
  }
  return (char)sizeBlock;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double width;
  double v4;
  double height;
  CGSize result;

  if (self->_mirroredView)
  {
    -[UIView bounds](self->_mirroredView, "bounds");
    width = v2;
    height = v4;
  }
  else
  {
    width = self->_fixedSize.width;
    height = self->_fixedSize.height;
  }
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  id *v6;
  id *v7;
  char v8;
  UIView *fallbackView;
  UIView *associatedView;
  void *v11;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (id *)v5;
    v7 = v6;
    if (self->_mirroredView)
    {
      v8 = objc_msgSend(v6[52], "isEqual:");
LABEL_14:

      goto LABEL_15;
    }
    fallbackView = self->_fallbackView;
    if (fallbackView)
    {
      objc_msgSend(v6, "fallbackView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[UIView isEqual:](fallbackView, "isEqual:", v3))
      {
        v8 = 0;
        goto LABEL_13;
      }
      associatedView = self->_associatedView;
      if (!associatedView)
      {
        v8 = 1;
LABEL_13:

        goto LABEL_14;
      }
    }
    else
    {
      associatedView = self->_associatedView;
      if (!associatedView)
      {
        if (self->_fixedSize.width == *((double *)v6 + 53) && self->_fixedSize.height == *((double *)v6 + 54))
        {
          -[UIView frame](self, "frame");
          v15 = v14;
          v17 = v16;
          objc_msgSend(v7, "frame");
          v8 = v17 == v19 && v15 == v18;
        }
        else
        {
          v8 = 0;
        }
        goto LABEL_14;
      }
    }
    objc_msgSend(v7, "associatedView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[UIView isEqual:](associatedView, "isEqual:", v11);

    if (!fallbackView)
      goto LABEL_14;
    goto LABEL_13;
  }
  v8 = 0;
LABEL_15:

  return v8;
}

- (UIView)fallbackView
{
  return self->_fallbackView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedView, 0);
  objc_storeStrong((id *)&self->_fallbackView, 0);
  objc_destroyWeak((id *)&self->_sceneForHeight);
  objc_storeStrong(&self->_sizeBlock, 0);
  objc_storeStrong((id *)&self->_mirroredView, 0);
}

- (void)setFallbackView:(id)a3
{
  objc_storeStrong((id *)&self->_fallbackView, a3);
}

- (void)setAssociatedView:(id)a3
{
  objc_storeStrong((id *)&self->_associatedView, a3);
}

+ (id)placeholderWithWidthSizer:(id)a3 heightWithScene:(id)a4
{
  double (**v5)(_QWORD);
  id v6;
  _UIRemoteKeyboardPlaceholderView *v7;
  uint64_t v8;
  id sizeBlock;
  _UIRemoteKeyboardPlaceholderView *v10;

  v5 = (double (**)(_QWORD))a3;
  v6 = a4;
  if (v5)
  {
    v7 = -[_UIRemoteKeyboardPlaceholderView initWithSize:]([_UIRemoteKeyboardPlaceholderView alloc], "initWithSize:", v5[2](v5), 0.0);
    if (v7)
    {
      v8 = objc_msgSend(v5, "copy");
      sizeBlock = v7->_sizeBlock;
      v7->_sizeBlock = (id)v8;

      objc_storeWeak((id *)&v7->_sceneForHeight, v6);
      v10 = v7;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (_UIRemoteKeyboardPlaceholderView)initWithSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  _UIRemoteKeyboardPlaceholderView *v5;
  _UIRemoteKeyboardPlaceholderView *v6;
  objc_super v8;

  height = a3.height;
  width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)_UIRemoteKeyboardPlaceholderView;
  v5 = -[UIView initWithSize:](&v8, sel_initWithSize_);
  v6 = v5;
  if (v5)
  {
    v5->_fixedSize.width = width;
    v5->_fixedSize.height = height;
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_UIRemoteKeyboardPlaceholderView _configureDebugOverlayIfNecessary](v6, "_configureDebugOverlayIfNecessary");
  }
  return v6;
}

- (void)_configureDebugOverlayIfNecessary
{
  id v3;

  if (qword_1ECD7A2D0 != -1)
    dispatch_once(&qword_1ECD7A2D0, &__block_literal_global_240_0);
  if (qword_1ECD7A2D8)
  {
    -[UIView setBackgroundColor:](self, "setBackgroundColor:");
    -[UIView layer](self, "layer");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAllowsHitTesting:", 0);

  }
}

+ (id)placeholderWithWidth:(double)a3 height:(double)a4
{
  return -[_UIRemoteKeyboardPlaceholderView initWithSize:]([_UIRemoteKeyboardPlaceholderView alloc], "initWithSize:", a3, a4);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  objc_super v16;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[_UIRemoteKeyboardPlaceholderView placeheldView](self, "placeheldView");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_4;
  v9 = (void *)v8;
  -[_UIRemoteKeyboardPlaceholderView placeheldView](self, "placeheldView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[_UIRemoteKeyboardPlaceholderView placeheldView](self, "placeheldView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIRemoteKeyboardPlaceholderView placeheldView](self, "placeheldView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView convertPoint:toCoordinateSpace:](self, "convertPoint:toCoordinateSpace:", v13, x, y);
    v14 = objc_msgSend(v12, "pointInside:withEvent:", v7);

  }
  else
  {
LABEL_4:
    v16.receiver = self;
    v16.super_class = (Class)_UIRemoteKeyboardPlaceholderView;
    v14 = -[UIView pointInside:withEvent:](&v16, sel_pointInside_withEvent_, v7, x, y);
  }

  return v14;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (CGSize)fixedSize
{
  double v2;
  double width;
  double v4;
  double height;
  CGSize result;

  if (self->_mirroredView)
  {
    -[UIView bounds](self->_mirroredView, "bounds");
    width = v2;
    height = v4;
  }
  else
  {
    width = self->_fixedSize.width;
    height = self->_fixedSize.height;
  }
  result.height = height;
  result.width = width;
  return result;
}

- (void)setFixedSize:(CGSize)a3
{
  self->_fixedSize = a3;
  if (!self->_mirroredView)
    -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  if (self->_mirroredView)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("mirrored=%@"), self->_mirroredView);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    NSStringFromCGSize(self->_fixedSize);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("size=%@"), v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v6 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)_UIRemoteKeyboardPlaceholderView;
  -[UIView description](&v10, sel_description);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@; %@>"), v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (BOOL)isLocalMinimumHeightPlaceholder
{
  return self->_isLocalMinimumHeight;
}

- (CGSize)leftContentViewSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x1E0C9D820];
  v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)rightContentViewSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x1E0C9D820];
  v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

@end
