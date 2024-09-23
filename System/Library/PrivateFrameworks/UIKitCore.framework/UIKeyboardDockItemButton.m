@implementation UIKeyboardDockItemButton

- (void)didMoveToSuperview
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIKeyboardDockItemButton;
  -[UIView didMoveToSuperview](&v3, sel_didMoveToSuperview);
  -[UIKeyboardDockItemButton setupDictationAnimationButtonIfNeeded](self, "setupDictationAnimationButtonIfNeeded");
}

- (void)setupDictationAnimationButtonIfNeeded
{
  double v3;
  double v4;
  double v5;
  double v6;
  BOOL v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v14;
  double v15;
  double v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;

  -[UIKeyboardDockItemButton identifier](self, "identifier");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v32, "isEqualToString:", CFSTR("dictationRunning"))
    || ((-[UIView frame](self, "frame"),
         v4 = *MEMORY[0x1E0C9D820],
         v5 = *(double *)(MEMORY[0x1E0C9D820] + 8),
         v6 == *MEMORY[0x1E0C9D820])
      ? (v7 = v3 == v5)
      : (v7 = 0),
        v7))
  {

  }
  else
  {
    -[UIButton imageView](self, "imageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frame");
    v10 = v9;
    v12 = v11;

    if (v10 != v4 || v12 != v5)
    {
      -[UIKeyboardDockItemButton shapeLayer](self, "shapeLayer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        v15 = *MEMORY[0x1E0C9D538];
        v16 = *(double *)(MEMORY[0x1E0C9D538] + 8);
        objc_msgSend(MEMORY[0x1E0CD2840], "layer");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKeyboardDockItemButton setShapeLayer:](self, "setShapeLayer:", v17);

        +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", v15, v16, 48.0, 48.0);
        v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v19 = objc_msgSend(v18, "CGPath");
        -[UIKeyboardDockItemButton shapeLayer](self, "shapeLayer");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setPath:", v19);

        -[UIKeyboardDockItemButton shapeLayer](self, "shapeLayer");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setBounds:", v15, v16, 48.0, 48.0);

        -[UIButton imageView](self, "imageView");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "center");
        v24 = v23;
        v26 = v25;
        -[UIKeyboardDockItemButton shapeLayer](self, "shapeLayer");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setPosition:", v24, v26);

        -[UIView layer](self, "layer");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKeyboardDockItemButton shapeLayer](self, "shapeLayer");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIButton imageView](self, "imageView");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "layer");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "insertSublayer:below:", v29, v31);

        -[UIKeyboardDockItemButton updateFillColor](self, "updateFillColor");
      }
    }
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setTintColor:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIKeyboardDockItemButton;
  -[UIButton setTintColor:](&v4, sel_setTintColor_, a3);
  -[UIKeyboardDockItemButton updateFillColor](self, "updateFillColor");
}

- (void)updateFillColor
{
  _BOOL4 v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v3 = -[UIView _lightStyleRenderConfig](self, "_lightStyleRenderConfig");
  -[UIKeyboardDockItemButton shapeLayer](self, "shapeLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (v3)
      +[UIKeyboardDockItem _standardGlyphColor](UIKeyboardDockItem, "_standardGlyphColor");
    else
      +[UIKeyboardDockItem _darkStyleGlyphColor](UIKeyboardDockItem, "_darkStyleGlyphColor");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = objc_msgSend(v5, "CGColor");
    -[UIKeyboardDockItemButton shapeLayer](self, "shapeLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFillColor:", v6);

  }
  if (qword_1ECD79B20 != -1)
    dispatch_once(&qword_1ECD79B20, &__block_literal_global_348);
  if (_MergedGlobals_13_3)
  {
    +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 1.0, 1.0, 0.0, 0.4);
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = objc_msgSend(v10, "CGColor");
    -[UIKeyboardDockItemButton debugHitLayer](self, "debugHitLayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFillColor:", v8);

  }
}

- (CAShapeLayer)shapeLayer
{
  return self->_shapeLayer;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void)setTapActionRegion:(CGRect)a3
{
  self->_tapActionRegion = a3;
}

- (CGRect)titleRectForContentRect:(CGRect)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  _QWORD v20[2];
  CGRect result;

  v20[1] = *MEMORY[0x1E0C80C00];
  -[UIButton currentTitle](self, "currentTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *(_QWORD *)off_1E1678D90;
  objc_msgSend(off_1E167A828, "systemFontOfSize:", 16.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sizeWithAttributes:", v6);
  -[UIKeyboardDockItemButton rectWithSize:forContentRect:withAlignmentRectInsets:](self, "rectWithSize:forContentRect:withAlignmentRectInsets:", 0, 0, 0, 0);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)imageRectForContentRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIButton currentImage](self, "currentImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "size");
  v10 = v9;
  v12 = v11;
  -[UIButton currentImage](self, "currentImage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "alignmentRectInsets");
  -[UIKeyboardDockItemButton rectWithSize:forContentRect:withAlignmentRectInsets:](self, "rectWithSize:forContentRect:withAlignmentRectInsets:", v10, v12, x, y, width, height, v14, v15, v16, v17);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;

  v26 = v19;
  v27 = v21;
  v28 = v23;
  v29 = v25;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (CGRect)rectWithSize:(CGSize)a3 forContentRect:(CGRect)a4 withAlignmentRectInsets:(UIEdgeInsets)a5
{
  double height;
  double width;
  double v7;
  double v8;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  v7 = a3.height;
  v8 = a3.width;
  if (-[UIView contentMode](self, "contentMode", a3.width, a3.height, a4.origin.x, a4.origin.y) == UIViewContentModeLeft)
  {
    -[UIButton imageEdgeInsets](self, "imageEdgeInsets");
    v11 = 0.0 - v10;
  }
  else if (-[UIView contentMode](self, "contentMode") == UIViewContentModeRight)
  {
    -[UIButton imageEdgeInsets](self, "imageEdgeInsets");
    v11 = width - v8 + v12;
  }
  else if (-[UIView contentMode](self, "contentMode") == UIViewContentModeCenter)
  {
    UIRoundToViewScale(self);
    v11 = v13;
  }
  else
  {
    v11 = *MEMORY[0x1E0C9D538];
  }
  -[UIButton imageEdgeInsets](self, "imageEdgeInsets");
  v15 = height - v7 + v14;
  v16 = v11;
  v17 = v8;
  v18 = v7;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v15;
  result.origin.x = v16;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double MidX;
  double MidY;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;
  CGRect v29;
  CGRect v30;

  v28.receiver = self;
  v28.super_class = (Class)UIKeyboardDockItemButton;
  -[UIButton layoutSubviews](&v28, sel_layoutSubviews);
  -[UIKeyboardDockItemButton identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("dictationRunning"));

  if (v4)
  {
    -[UIButton imageView](self, "imageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCompositingFilter:", *MEMORY[0x1E0CD2F28]);

  }
  -[UIKeyboardDockItemButton debugHitLayer](self, "debugHitLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[UIKeyboardDockItemButton debugHitLayer](self, "debugHitLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperlayer");

    -[UIKeyboardDockItemButton setDebugHitLayer:](self, "setDebugHitLayer:", 0);
  }
  if (_os_feature_enabled_impl())
  {
    if (qword_1ECD79B20 != -1)
      dispatch_once(&qword_1ECD79B20, &__block_literal_global_348);
    if (_MergedGlobals_13_3)
    {
      objc_msgSend(MEMORY[0x1E0CD2840], "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardDockItemButton setDebugHitLayer:](self, "setDebugHitLayer:", v9);

      -[UIKeyboardDockItemButton tapActionRegion](self, "tapActionRegion");
      +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:");
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v11 = objc_msgSend(v10, "CGPath");
      -[UIKeyboardDockItemButton debugHitLayer](self, "debugHitLayer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setPath:", v11);

      -[UIKeyboardDockItemButton tapActionRegion](self, "tapActionRegion");
      v14 = v13;
      v16 = v15;
      v18 = v17;
      v20 = v19;
      -[UIKeyboardDockItemButton debugHitLayer](self, "debugHitLayer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setBounds:", v14, v16, v18, v20);

      -[UIKeyboardDockItemButton tapActionRegion](self, "tapActionRegion");
      MidX = CGRectGetMidX(v29);
      -[UIKeyboardDockItemButton tapActionRegion](self, "tapActionRegion");
      MidY = CGRectGetMidY(v30);
      -[UIKeyboardDockItemButton debugHitLayer](self, "debugHitLayer");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setPosition:", MidX, MidY);

      -[UIView layer](self, "layer");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKeyboardDockItemButton debugHitLayer](self, "debugHitLayer");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView layer](self, "layer");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "insertSublayer:below:", v26, v27);

      -[UIKeyboardDockItemButton updateFillColor](self, "updateFillColor");
    }
  }
}

- (CAShapeLayer)debugHitLayer
{
  return self->_debugHitLayer;
}

- (void)drawRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  _QWORD *ContextStack;
  CGContext *v10;
  objc_super v11;
  CGRect v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    if (qword_1ECD79B20 != -1)
      dispatch_once(&qword_1ECD79B20, &__block_literal_global_348);
    if (_MergedGlobals_13_3)
    {
      +[UIColor orangeColor](UIColor, "orangeColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setFill");

      ContextStack = GetContextStack(0);
      if (*(int *)ContextStack < 1)
        v10 = 0;
      else
        v10 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
      -[UIKeyboardDockItemButton tapActionRegion](self, "tapActionRegion");
      CGContextFillRect(v10, v12);
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)UIKeyboardDockItemButton;
  -[UIView drawRect:](&v11, sel_drawRect_, x, y, width, height);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugHitLayer, 0);
  objc_storeStrong((id *)&self->_shapeLayer, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (BOOL)pointInsideTapActionRegion:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  char v7;
  CGPoint v9;
  CGRect v10;

  y = a3.y;
  x = a3.x;
  if (_os_feature_enabled_impl())
  {
    -[UIKeyboardDockItemButton tapActionRegion](self, "tapActionRegion");
    +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsPoint:", x, y);

    return v7;
  }
  else
  {
    -[UIKeyboardDockItemButton tapActionRegion](self, "tapActionRegion");
    v9.x = x;
    v9.y = y;
    return CGRectContainsPoint(v10, v9);
  }
}

- (void)addAnimatitionIfNeeded
{
  void *v3;
  char v4;
  _QWORD *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  id v14;

  -[UIKeyboardDockItemButton shapeLayer](self, "shapeLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "animationKeys");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v14, "containsObject:", CFSTR("opacityAnimation"));
  v5 = (_QWORD *)MEMORY[0x1E0CD3048];
  if ((v4 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDuration:", 1.0);
    LODWORD(v7) = 2139095039;
    objc_msgSend(v6, "setRepeatCount:", v7);
    objc_msgSend(v6, "setAutoreverses:", 1);
    objc_msgSend(v6, "setFromValue:", &unk_1E1A95B10);
    objc_msgSend(v6, "setToValue:", &unk_1E1A95B20);
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTimingFunction:", v8);

    -[UIKeyboardDockItemButton shapeLayer](self, "shapeLayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAnimation:forKey:", v6, CFSTR("opacityAnimation"));

  }
  if ((objc_msgSend(v14, "containsObject:", CFSTR("scaleXYanimation")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFromValue:", &unk_1E1A98E38);
    objc_msgSend(v10, "setToValue:", &unk_1E1A95B30);
    objc_msgSend(v10, "setDuration:", 1.0);
    LODWORD(v11) = 2139095039;
    objc_msgSend(v10, "setRepeatCount:", v11);
    objc_msgSend(v10, "setAutoreverses:", 1);
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTimingFunction:", v12);

    -[UIKeyboardDockItemButton shapeLayer](self, "shapeLayer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addAnimation:forKey:", v10, CFSTR("scaleXYanimation"));

  }
}

- (CGRect)tapActionRegion
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_tapActionRegion.origin.x;
  y = self->_tapActionRegion.origin.y;
  width = self->_tapActionRegion.size.width;
  height = self->_tapActionRegion.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setShapeLayer:(id)a3
{
  objc_storeStrong((id *)&self->_shapeLayer, a3);
}

- (void)setDebugHitLayer:(id)a3
{
  objc_storeStrong((id *)&self->_debugHitLayer, a3);
}

@end
