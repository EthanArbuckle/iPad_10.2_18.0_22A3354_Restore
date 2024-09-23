@implementation SiriSharedUIAdaptiveGrabberView

- (SiriSharedUIAdaptiveGrabberView)initWithFrame:(CGRect)a3
{
  SiriSharedUIAdaptiveGrabberView *v3;
  SiriSharedUIAdaptiveGrabberView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SiriSharedUIAdaptiveGrabberView;
  v3 = -[SiriSharedUIAdaptiveGrabberView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SiriSharedUIAdaptiveGrabberView _commonInit](v3, "_commonInit");
    -[SiriSharedUIAdaptiveGrabberView _setupWithStyle:animated:](v4, "_setupWithStyle:animated:", 0, 0);
  }
  return v4;
}

- (SiriSharedUIAdaptiveGrabberView)initWithStyle:(int64_t)a3
{
  SiriSharedUIAdaptiveGrabberView *v4;
  SiriSharedUIAdaptiveGrabberView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SiriSharedUIAdaptiveGrabberView;
  v4 = -[SiriSharedUIAdaptiveGrabberView initWithFrame:](&v7, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = v4;
  if (v4)
  {
    -[SiriSharedUIAdaptiveGrabberView _commonInit](v4, "_commonInit");
    -[SiriSharedUIAdaptiveGrabberView sizeToFit](v5, "sizeToFit");
    -[SiriSharedUIAdaptiveGrabberView _setupWithStyle:animated:](v5, "_setupWithStyle:animated:", a3, 0);
  }
  return v5;
}

- (void)_commonInit
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  -[SiriSharedUIAdaptiveGrabberView shapeLayer](self, "shapeLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "setFillColor:", objc_msgSend(v4, "CGColor"));

  -[SiriSharedUIAdaptiveGrabberView shapeLayer](self, "shapeLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v5, "setStrokeColor:", objc_msgSend(v6, "CGColor"));

  -[SiriSharedUIAdaptiveGrabberView shapeLayer](self, "shapeLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0CD3010];
  objc_msgSend(v7, "setLineCap:", *MEMORY[0x1E0CD3010]);

  -[SiriSharedUIAdaptiveGrabberView shapeLayer](self, "shapeLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLineWidth:", 5.0);

  -[SiriSharedUIAdaptiveGrabberView shapeLayer](self, "shapeLayer");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLineJoin:", v8);

}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (id)shapeLayer
{
  void *v2;
  id v3;

  -[SiriSharedUIAdaptiveGrabberView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[SiriSharedUIAdaptiveGrabberView sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = 36.0;
  v4 = 18.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setStyle:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_style != a3)
  {
    self->_style = a3;
    -[SiriSharedUIAdaptiveGrabberView _setupWithStyle:animated:](self, "_setupWithStyle:animated:");
  }
}

- (void)_setupWithStyle:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  CGPath *v6;
  const CGPath *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a4;
  v6 = -[SiriSharedUIAdaptiveGrabberView _pathForStyle:](self, "_pathForStyle:", a3);
  if (v6)
  {
    v7 = v6;
    -[SiriSharedUIAdaptiveGrabberView shapeLayer](self, "shapeLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v4)
    {
      v10 = objc_msgSend(v8, "path");

      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("path"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setDuration:", 0.2);
      objc_msgSend(v9, "setToValue:", v7);
      objc_msgSend(v9, "setFromValue:", v10);
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTimingFunction:", v11);

      -[SiriSharedUIAdaptiveGrabberView shapeLayer](self, "shapeLayer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addAnimation:forKey:", v9, CFSTR("path"));

      -[SiriSharedUIAdaptiveGrabberView shapeLayer](self, "shapeLayer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setPath:", v7);

    }
    else
    {
      objc_msgSend(v8, "setPath:", v7);
    }

    CGPathRelease(v7);
  }
}

- (CGPath)_pathForStyle:(int64_t)a3
{
  CGPath *Mutable;
  double v5;
  CGPath *v6;

  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, 0.0, 13.0);
  if (a3 == 1)
    v5 = 8.0;
  else
    v5 = 13.0;
  CGPathAddLineToPoint(Mutable, 0, 18.0, v5);
  CGPathAddLineToPoint(Mutable, 0, 36.0, 13.0);
  v6 = (CGPath *)MEMORY[0x1DF0E7D48](Mutable);
  CGPathRelease(Mutable);
  return v6;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

@end
