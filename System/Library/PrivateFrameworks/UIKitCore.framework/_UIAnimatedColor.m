@implementation _UIAnimatedColor

+ (CGPatternCallbacks)_patternCallbacks
{
  if (_MergedGlobals_3_13 != -1)
    dispatch_once(&_MergedGlobals_3_13, &__block_literal_global_258);
  *(_OWORD *)&retstr->version = xmmword_1ECD7A5F0;
  retstr->releaseInfo = (CGPatternReleaseInfoCallback)qword_1ECD7A600;
  return result;
}

+ (id)animatedColorForParentView:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithParentView:", v4);

  return v5;
}

- (_UIAnimatedColor)initWithParentView:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  _UIAnimatedColor *v7;
  _UIAnimatedColor *v8;
  _QWORD aBlock[4];
  id v11;

  v4 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __39___UIAnimatedColor_initWithParentView___block_invoke;
  aBlock[3] = &unk_1E16C8EF8;
  v5 = v4;
  v11 = v5;
  v6 = _Block_copy(aBlock);
  objc_msgSend(v5, "bounds");
  v7 = -[_UIAnimatedColor initWithBounds:invalidationHandler:](self, "initWithBounds:invalidationHandler:", v6);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_parentView, v5);
    -[UIView _addGeometryChangeObserver:](v5, v8);
  }

  return v8;
}

- (_UIAnimatedColor)initWithBounds:(CGRect)a3 invalidationHandler:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  _UIAnimatedColor *v10;
  _UIAnimatedColor *v11;
  uint64_t v12;
  id invalidationHandler;
  UIViewFloatAnimatableProperty *v14;
  UIViewFloatAnimatableProperty *progressAnimatableProperty;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  id location;
  objc_super v24;
  _QWORD v25[2];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v25[1] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v24.receiver = self;
  v24.super_class = (Class)_UIAnimatedColor;
  v10 = -[_UIAnimatedColor init](&v24, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_bounds.origin.x = x;
    v10->_bounds.origin.y = y;
    v10->_bounds.size.width = width;
    v10->_bounds.size.height = height;
    v12 = objc_msgSend(v9, "copy");
    invalidationHandler = v11->_invalidationHandler;
    v11->_invalidationHandler = (id)v12;

    v14 = objc_alloc_init(UIViewFloatAnimatableProperty);
    progressAnimatableProperty = v11->_progressAnimatableProperty;
    v11->_progressAnimatableProperty = v14;

    -[UIViewFloatAnimatableProperty setValue:](v11->_progressAnimatableProperty, "setValue:", 0.0);
    objc_initWeak(&location, v11);
    v25[0] = v11->_progressAnimatableProperty;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __55___UIAnimatedColor_initWithBounds_invalidationHandler___block_invoke;
    v21 = &unk_1E16B3F40;
    objc_copyWeak(&v22, &location);
    +[UIView _createTransformerWithInputAnimatableProperties:presentationValueChangedCallback:](UIView, "_createTransformerWithInputAnimatableProperties:presentationValueChangedCallback:", v16, &v18);

    -[_UIAnimatedColor _recreatePatternColorForBounds:](v11, "_recreatePatternColorForBounds:", x, y, width, height, v18, v19, v20, v21);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v11;
}

- (void)dealloc
{
  _QWORD *WeakRetained;
  CADisplayLink *displayLink;
  void *v5;
  objc_super v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_parentView);
  -[UIView _removeGeometryChangeObserver:](WeakRetained, self);

  displayLink = self->_displayLink;
  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CADisplayLink removeFromRunLoop:forMode:](displayLink, "removeFromRunLoop:forMode:", v5, *MEMORY[0x1E0C99860]);

  v6.receiver = self;
  v6.super_class = (Class)_UIAnimatedColor;
  -[_UIAnimatedColor dealloc](&v6, sel_dealloc);
}

- (void)setProgress:(double)a3
{
  if (vabdd_f64(self->_progress, a3) > 2.22044605e-16)
  {
    self->_progress = a3;
    -[UIViewFloatAnimatableProperty setValue:](self->_progressAnimatableProperty, "setValue:");
  }
}

- (CGColor)_patternColorForSize:(CGSize)a3
{
  CGFloat width;
  CGFloat height;
  CGFloat x;
  CGFloat y;
  CGFloat v10;
  CGFloat v11;
  void *v12;
  _UIAnimatedColor *v13;
  __int128 v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGPattern *v18;
  CGColorSpace *Pattern;
  CGColorRef v20;
  CGAffineTransform v21;
  CGPatternCallbacks callbacks;
  CGRect v23;
  CGRect v24;

  width = a3.width;
  if (a3.width < 2.22044605e-16 || a3.height < 2.22044605e-16)
    return 0;
  height = a3.height;
  v23.origin.x = 0.0;
  v23.origin.y = 0.0;
  v23.size.width = width;
  v23.size.height = height;
  v24 = CGRectIntegral(v23);
  x = v24.origin.x;
  y = v24.origin.y;
  v10 = v24.size.width;
  v11 = v24.size.height;
  memset(&callbacks, 0, sizeof(callbacks));
  v12 = (void *)objc_opt_class();
  if (v12)
    objc_msgSend(v12, "_patternCallbacks");
  else
    memset(&callbacks, 0, sizeof(callbacks));
  v13 = self;
  v14 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v21.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v21.c = v14;
  *(_OWORD *)&v21.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v15 = x;
  *(CGFloat *)&v14 = y;
  v16 = v10;
  v17 = v11;
  v18 = CGPatternCreate(v13, *(CGRect *)((char *)&v14 - 8), &v21, width, height, kCGPatternTilingConstantSpacing, 1, &callbacks);
  Pattern = CGColorSpaceCreatePattern(0);
  v20 = CGColorCreateWithPattern(Pattern, v18, &_patternColorForSize__alpha);
  CGColorSpaceRelease(Pattern);
  CGPatternRelease(v18);
  return (CGColor *)CFAutorelease(v20);
}

- (void)_recreatePatternColorForBounds:(CGRect)a3
{
  UIColor *v4;
  UIColor *wrappedColor;

  if (-[_UIAnimatedColor _patternColorForSize:](self, "_patternColorForSize:", a3.size.width, a3.size.height))
    +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:");
  else
    +[UIColor yellowColor](UIColor, "yellowColor");
  v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
  wrappedColor = self->_wrappedColor;
  self->_wrappedColor = v4;

}

- (void)_drawPatternWithContext:(CGContext *)a3
{
  double x;
  double y;
  double width;
  double height;
  double v9;

  CGContextSaveGState(a3);
  x = self->_bounds.origin.x;
  y = self->_bounds.origin.y;
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  -[UIViewFloatAnimatableProperty presentationValue](self->_progressAnimatableProperty, "presentationValue");
  -[_UIAnimatedColor drawRect:usingContext:progress:](self, "drawRect:usingContext:progress:", a3, x, y, width, height, v9);
  CGContextRestoreGState(a3);
}

- (void)setAnimating:(BOOL)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  CADisplayLink *v7;
  CADisplayLink *displayLink;
  void *v9;
  uint64_t v10;
  CADisplayLink *v11;
  CADisplayLink *v12;
  CADisplayLink *v13;
  CADisplayLink *v14;
  void *v15;
  uint64_t v16;

  self->_animating = a3;
  if (a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_parentView);
    objc_msgSend(WeakRetained, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "screen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayLinkWithTarget:selector:", self, sel__didFireDisplayLink_);
    v7 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel__didFireDisplayLink_);
      v7 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
    }
    displayLink = self->_displayLink;
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x1E0C99860];
    -[CADisplayLink removeFromRunLoop:forMode:](displayLink, "removeFromRunLoop:forMode:", v9, *MEMORY[0x1E0C99860]);

    v11 = self->_displayLink;
    self->_displayLink = v7;
    v12 = v7;

    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v16 = objc_claimAutoreleasedReturnValue();
    -[CADisplayLink addToRunLoop:forMode:](v12, "addToRunLoop:forMode:", v16, v10);

    v13 = (CADisplayLink *)v16;
  }
  else
  {
    v14 = self->_displayLink;
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADisplayLink removeFromRunLoop:forMode:](v14, "removeFromRunLoop:forMode:", v15, *MEMORY[0x1E0C99860]);

    v13 = self->_displayLink;
    self->_displayLink = 0;
  }

}

- (void)_presentationValueChanged
{
  (*((void (**)(void))self->_invalidationHandler + 2))();
}

- (BOOL)_geometryObserverNeedsAncestorOnly
{
  return 1;
}

- (void)_geometryChanged:(id *)a3 forAncestor:(id)a4
{
  UIView **p_parentView;
  id WeakRetained;
  void *v7;
  id v8;

  if ((a3->var0 & 0x108) != 0)
  {
    p_parentView = &self->_parentView;
    WeakRetained = objc_loadWeakRetained((id *)&self->_parentView);
    objc_msgSend(WeakRetained, "bounds");
    -[_UIAnimatedColor _recreatePatternColorForBounds:](self, "_recreatePatternColorForBounds:");

    v8 = objc_loadWeakRetained((id *)p_parentView);
    objc_msgSend(v8, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADisplayLink setPaused:](self->_displayLink, "setPaused:", v7 == 0);

  }
}

- (id)colorSpaceName
{
  return CFSTR("kCGColorSpaceModelPattern");
}

- (BOOL)isPatternColor
{
  return 1;
}

- (BOOL)getWhite:(double *)a3 alpha:(double *)a4
{
  return 0;
}

- (BOOL)getRed:(double *)a3 green:(double *)a4 blue:(double *)a5 alpha:(double *)a6
{
  return 0;
}

- (BOOL)getHue:(double *)a3 saturation:(double *)a4 brightness:(double *)a5 alpha:(double *)a6
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  return 0;
}

- (void)set
{
  -[UIColor set](self->_wrappedColor, "set");
}

- (void)setFill
{
  -[UIColor setFill](self->_wrappedColor, "setFill");
}

- (void)setStroke
{
  -[UIColor setStroke](self->_wrappedColor, "setStroke");
}

- (unint64_t)hash
{
  return -[UIColor hash](self->_wrappedColor, "hash");
}

- (double)alphaComponent
{
  double result;

  -[UIColor alphaComponent](self->_wrappedColor, "alphaComponent");
  return result;
}

- (CGColor)CGColor
{
  return -[UIColor CGColor](self->_wrappedColor, "CGColor");
}

- (_UIAnimatedColor)colorWithAlphaComponent:(double)a3
{
  return (_UIAnimatedColor *)-[UIColor colorWithAlphaComponent:](self->_wrappedColor, "colorWithAlphaComponent:", a3);
}

- (UIView)parentView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_parentView);
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (double)progress
{
  return self->_progress;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentView);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_progressAnimatableProperty, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_wrappedColor, 0);
}

@end
