@implementation ICLoadingPieLayer

- (void)dealloc
{
  objc_super v3;

  -[NSProgress ic_removeObserver:forKeyPath:context:](self->_observedProgress, "ic_removeObserver:forKeyPath:context:", self, CFSTR("fractionCompleted"), &compoundliteral_2);
  v3.receiver = self;
  v3.super_class = (Class)ICLoadingPieLayer;
  -[ICLoadingPieLayer dealloc](&v3, sel_dealloc);
}

- (ICLoadingPieLayer)init
{
  ICLoadingPieLayer *v2;
  ICLoadingPieLayer *v3;
  CAShapeLayer *v4;
  CAShapeLayer *backgroundLayer;
  id v6;
  CGPath *Mutable;
  CAShapeLayer *v8;
  CAShapeLayer *pieLayer;
  id v10;
  const CGPath *v11;
  objc_super v13;
  CGRect v14;

  v13.receiver = self;
  v13.super_class = (Class)ICLoadingPieLayer;
  v2 = -[ICLoadingPieLayer init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    -[ICLoadingPieLayer setFrame:](v2, "setFrame:", 0.0, 0.0, 24.0, 24.0);
    v4 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
    backgroundLayer = v3->_backgroundLayer;
    v3->_backgroundLayer = v4;

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.3);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setFillColor:](v3->_backgroundLayer, "setFillColor:", objc_msgSend(v6, "CGColor"));

    Mutable = CGPathCreateMutable();
    -[ICLoadingPieLayer frame](v3, "frame");
    CGPathAddEllipseInRect(Mutable, 0, v14);
    -[CAShapeLayer setPath:](v3->_backgroundLayer, "setPath:", Mutable);
    CGPathRelease(Mutable);
    v8 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
    pieLayer = v3->_pieLayer;
    v3->_pieLayer = v8;

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 1.0);
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setFillColor:](v3->_pieLayer, "setFillColor:", objc_msgSend(v10, "CGColor"));

    -[CAShapeLayer setFillRule:](v3->_pieLayer, "setFillRule:", *MEMORY[0x1E0CD2B70]);
    v11 = -[ICLoadingPieLayer newPathForProgress:](v3, "newPathForProgress:", 0.1);
    -[CAShapeLayer setPath:](v3->_pieLayer, "setPath:", v11);
    CGPathRelease(v11);
    -[ICLoadingPieLayer addSublayer:](v3, "addSublayer:", v3->_backgroundLayer);
    -[ICLoadingPieLayer addSublayer:](v3, "addSublayer:", v3->_pieLayer);
  }
  return v3;
}

- (CGPath)newPathForProgress:(double)a3
{
  CGPath *Mutable;
  CGRect v7;
  CGRect v8;

  Mutable = CGPathCreateMutable();
  -[ICLoadingPieLayer bounds](self, "bounds");
  v8 = CGRectInset(v7, 1.0, 1.0);
  CGPathAddEllipseInRect(Mutable, 0, v8);
  CGPathMoveToPoint(Mutable, 0, 12.0, 12.0);
  CGPathAddLineToPoint(Mutable, 0, 12.0, 2.0);
  CGPathAddArc(Mutable, 0, 12.0, 12.0, 10.0, -1.57079633, a3 * 6.28318531 + -1.57079633, 0);
  return Mutable;
}

- (void)setProgress:(double)a3
{
  double v5;
  double v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t i;
  CGPath *v11;
  double v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;

  if (a3 >= 1.0 && -[ICLoadingPieLayer removeOnCompletion](self, "removeOnCompletion"))
  {
    -[ICLoadingPieLayer removeFromSuperlayer](self, "removeFromSuperlayer");
  }
  else
  {
    v5 = fmax(self->_progress, 0.1);
    self->_progress = a3;
    v17 = objc_alloc_init(MEMORY[0x1E0CD2798]);
    objc_msgSend(v17, "setKeyPath:", CFSTR("path"));
    v6 = fmax(a3, 0.1) - v5;
    v7 = (uint64_t)fmax(v6 / 0.1, 1.0);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 >= 1)
    {
      for (i = 1; i <= v7; ++i)
      {
        v11 = -[ICLoadingPieLayer newPathForProgress:](self, "newPathForProgress:", v5 + (float)((float)(int)i / (float)v7) * v6);
        objc_msgSend(v8, "addObject:", v11);

        *(float *)&v12 = (float)(int)i / (float)v7;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v13);

      }
    }
    objc_msgSend(v17, "setValues:", v8);
    objc_msgSend(v17, "setKeyTimes:", v9);
    v14 = objc_msgSend(v8, "lastObject");
    -[ICLoadingPieLayer pieLayer](self, "pieLayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setPath:", v14);

    -[ICLoadingPieLayer pieLayer](self, "pieLayer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addAnimation:forKey:", v17, CFSTR("path"));

  }
}

- (void)setObservedProgress:(id)a3
{
  NSProgress **p_observedProgress;
  id v6;

  p_observedProgress = &self->_observedProgress;
  v6 = a3;
  if ((objc_msgSend(v6, "isEqual:", *p_observedProgress) & 1) == 0)
  {
    -[NSProgress ic_removeObserver:forKeyPath:context:](*p_observedProgress, "ic_removeObserver:forKeyPath:context:", self, CFSTR("fractionCompleted"), &compoundliteral_2);
    objc_storeStrong((id *)&self->_observedProgress, a3);
    -[NSProgress ic_addObserver:forKeyPath:context:](*p_observedProgress, "ic_addObserver:forKeyPath:context:", self, CFSTR("fractionCompleted"), &compoundliteral_2);
    if (*p_observedProgress)
    {
      -[NSProgress fractionCompleted](*p_observedProgress, "fractionCompleted");
      -[ICLoadingPieLayer setProgress:](self, "setProgress:");
    }
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  char v13;
  objc_super v14;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  if ((-[ICLoadingPieLayer ic_didAddObserverForContext:inScope:](self, "ic_didAddObserverForContext:inScope:", a6, "/Library/Caches/com.apple.xbs/Sources/MobileNotesSupport/Ironcade/SharedUI/Views/ICLoadingPieLayer.m") & 1) != 0)
  {
    v13 = -[ICLoadingPieLayer ic_shouldIgnoreObserveValue:ofObject:forKeyPath:](self, "ic_shouldIgnoreObserveValue:ofObject:forKeyPath:", v10, v11, v12);

    if (a6 == &compoundliteral_2 && (v13 & 1) == 0)
      dispatchMainAfterDelay();
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)ICLoadingPieLayer;
    -[ICLoadingPieLayer observeValueForKeyPath:ofObject:change:context:](&v14, sel_observeValueForKeyPath_ofObject_change_context_, v12, v11, v10, a6);

  }
}

void __68__ICLoadingPieLayer_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "observedProgress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "observedProgress");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fractionCompleted");
    objc_msgSend(*(id *)(a1 + 32), "setProgress:");

  }
}

- (double)progress
{
  return self->_progress;
}

- (NSProgress)observedProgress
{
  return self->_observedProgress;
}

- (BOOL)removeOnCompletion
{
  return self->_removeOnCompletion;
}

- (void)setRemoveOnCompletion:(BOOL)a3
{
  self->_removeOnCompletion = a3;
}

- (CAShapeLayer)pieLayer
{
  return self->_pieLayer;
}

- (void)setPieLayer:(id)a3
{
  objc_storeStrong((id *)&self->_pieLayer, a3);
}

- (CAShapeLayer)backgroundLayer
{
  return self->_backgroundLayer;
}

- (void)setBackgroundLayer:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundLayer, 0);
  objc_storeStrong((id *)&self->_pieLayer, 0);
  objc_storeStrong((id *)&self->_observedProgress, 0);
}

@end
