@implementation UPQuiltViewPhone

- (UPQuiltViewPhone)initWithFrame:(CGRect)a3
{
  UPQuiltViewPhone *v3;
  uint64_t v4;
  CAShapeLayer *topQuiltPieceLayer;
  uint64_t v6;
  CAShapeLayer *bottomLeftQuiltPieceLayer;
  uint64_t v8;
  CAShapeLayer *intersectionPieceLayer;
  uint64_t v10;
  CAShapeLayer *bottomRightQuiltPieceLayer;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)UPQuiltViewPhone;
  v3 = -[UPQuiltViewPhone initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDE5758], "layer");
    v4 = objc_claimAutoreleasedReturnValue();
    topQuiltPieceLayer = v3->_topQuiltPieceLayer;
    v3->_topQuiltPieceLayer = (CAShapeLayer *)v4;

    objc_msgSend(MEMORY[0x24BDE5758], "layer");
    v6 = objc_claimAutoreleasedReturnValue();
    bottomLeftQuiltPieceLayer = v3->_bottomLeftQuiltPieceLayer;
    v3->_bottomLeftQuiltPieceLayer = (CAShapeLayer *)v6;

    objc_msgSend(MEMORY[0x24BDE5758], "layer");
    v8 = objc_claimAutoreleasedReturnValue();
    intersectionPieceLayer = v3->_intersectionPieceLayer;
    v3->_intersectionPieceLayer = (CAShapeLayer *)v8;

    objc_msgSend(MEMORY[0x24BDE5758], "layer");
    v10 = objc_claimAutoreleasedReturnValue();
    bottomRightQuiltPieceLayer = v3->_bottomRightQuiltPieceLayer;
    v3->_bottomRightQuiltPieceLayer = (CAShapeLayer *)v10;

    -[UPQuiltViewPhone layer](v3, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSublayer:", v3->_topQuiltPieceLayer);

    -[UPQuiltViewPhone layer](v3, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSublayer:", v3->_bottomLeftQuiltPieceLayer);

    -[UPQuiltViewPhone layer](v3, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSublayer:", v3->_intersectionPieceLayer);

    -[UPQuiltViewPhone layer](v3, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSublayer:", v3->_bottomRightQuiltPieceLayer);

    -[UPQuiltViewPhone setNeedsLayout](v3, "setNeedsLayout");
  }
  return v3;
}

- (void)setTopQuiltColor:(id)a3
{
  UIColor *v5;

  v5 = (UIColor *)a3;
  -[CAShapeLayer setHidden:](self->_topQuiltPieceLayer, "setHidden:", v5 == 0);
  if (self->_topQuiltColor != v5)
  {
    objc_storeStrong((id *)&self->_topQuiltColor, a3);
    -[CAShapeLayer setFillColor:](self->_topQuiltPieceLayer, "setFillColor:", -[UIColor CGColor](objc_retainAutorelease(v5), "CGColor"));
  }

}

- (void)setBottomLeftQuiltColor:(id)a3
{
  UIColor *v5;

  v5 = (UIColor *)a3;
  -[CAShapeLayer setHidden:](self->_bottomLeftQuiltPieceLayer, "setHidden:", v5 == 0);
  if (self->_bottomLeftQuiltColor != v5)
  {
    objc_storeStrong((id *)&self->_bottomLeftQuiltColor, a3);
    -[CAShapeLayer setFillColor:](self->_bottomLeftQuiltPieceLayer, "setFillColor:", -[UIColor CGColor](objc_retainAutorelease(v5), "CGColor"));
  }

}

- (void)setIntersectionPieceColor:(id)a3
{
  UIColor *v5;

  v5 = (UIColor *)a3;
  -[CAShapeLayer setHidden:](self->_intersectionPieceLayer, "setHidden:", v5 == 0);
  if (self->_intersectionPieceColor != v5)
  {
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
    objc_storeStrong((id *)&self->_intersectionPieceColor, a3);
    -[CAShapeLayer setFillColor:](self->_intersectionPieceLayer, "setFillColor:", -[UIColor CGColor](objc_retainAutorelease(v5), "CGColor"));
    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  }

}

- (void)setBottomRightQuiltColor:(id)a3
{
  UIColor *v5;

  v5 = (UIColor *)a3;
  -[CAShapeLayer setHidden:](self->_bottomRightQuiltPieceLayer, "setHidden:", v5 == 0);
  if (self->_bottomRightQuiltColor != v5)
  {
    objc_storeStrong((id *)&self->_bottomRightQuiltColor, a3);
    -[CAShapeLayer setFillColor:](self->_bottomRightQuiltPieceLayer, "setFillColor:", -[UIColor CGColor](objc_retainAutorelease(v5), "CGColor"));
  }

}

- (void)layoutSubviews
{
  void *v3;

  -[UPQuiltView quiltViewDelegate](self, "quiltViewDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "regenerateConfiguration");

  -[UPQuiltViewPhone bounds](self, "bounds");
  -[CAShapeLayer setFrame:](self->_topQuiltPieceLayer, "setFrame:");
  -[UPQuiltViewPhone bounds](self, "bounds");
  -[CAShapeLayer setFrame:](self->_bottomLeftQuiltPieceLayer, "setFrame:");
  -[UPQuiltViewPhone bounds](self, "bounds");
  -[CAShapeLayer setFrame:](self->_intersectionPieceLayer, "setFrame:");
  -[UPQuiltViewPhone bounds](self, "bounds");
  -[CAShapeLayer setFrame:](self->_bottomRightQuiltPieceLayer, "setFrame:");
}

- (CGPath)topQuiltPathRef
{
  void *v2;
  CGPath *v3;

  -[CAShapeLayer presentationLayer](self->_topQuiltPieceLayer, "presentationLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (CGPath *)objc_msgSend(v2, "path");

  return v3;
}

- (CGPath)bottomLeftQuiltPathRef
{
  void *v2;
  CGPath *v3;

  -[CAShapeLayer presentationLayer](self->_bottomLeftQuiltPieceLayer, "presentationLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (CGPath *)objc_msgSend(v2, "path");

  return v3;
}

- (uint64_t)intersectionPiecePathRef
{
  void *v1;
  uint64_t v2;

  if (result)
  {
    objc_msgSend(*(id *)(result + 568), "presentationLayer");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v1, "path");

    return v2;
  }
  return result;
}

- (uint64_t)bottomRightQuiltPathRef
{
  void *v1;
  uint64_t v2;

  if (result)
  {
    objc_msgSend(*(id *)(result + 584), "presentationLayer");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v1, "path");

    return v2;
  }
  return result;
}

- (void)setConfiguration:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  UPQuiltConfigurationPhone *v9;

  v9 = (UPQuiltConfigurationPhone *)a3;
  if (self->_configuration != v9)
  {
    objc_storeStrong((id *)&self->_configuration, a3);
    -[UPQuiltConfigurationPhone topQuiltAwakeLockedPath](v9, "topQuiltAwakeLockedPath");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setPath:](self->_topQuiltPieceLayer, "setPath:", objc_msgSend(v5, "CGPath"));

    -[UPQuiltConfigurationPhone bottomLeftQuiltAwakeLockedPath](v9, "bottomLeftQuiltAwakeLockedPath");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setPath:](self->_bottomLeftQuiltPieceLayer, "setPath:", objc_msgSend(v6, "CGPath"));

    -[UPQuiltConfigurationPhone intersectionPieceAwakeLockedPath](v9, "intersectionPieceAwakeLockedPath");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setPath:](self->_intersectionPieceLayer, "setPath:", objc_msgSend(v7, "CGPath"));

    -[UPQuiltConfigurationPhone bottomRightQuiltAwakeLockedPath](v9, "bottomRightQuiltAwakeLockedPath");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setPath:](self->_bottomRightQuiltPieceLayer, "setPath:", objc_msgSend(v8, "CGPath"));

  }
}

- (void)setColors
{
  id v3;
  id v4;
  id v5;

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.953, 0.0, 0.254, 0.066);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setFillColor:](self->_topQuiltPieceLayer, "setFillColor:", objc_msgSend(v3, "CGColor"));

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.0, 0.559, 0.23, 1.0);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setFillColor:](self->_bottomLeftQuiltPieceLayer, "setFillColor:", objc_msgSend(v4, "CGColor"));

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.98, 0.8, 0.0, 1.0);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setFillColor:](self->_intersectionPieceLayer, "setFillColor:", objc_msgSend(v5, "CGColor"));

}

- (void)updateQuiltsWithUnlockProgress:(double)a3 wakeProgress:(double)a4
{
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  const CGPath *v23;
  id v24;
  const CGPath *CopyByIntersectingPath;
  id v26;
  const CGPath *CopyBySubtractingPath;
  const CGPath *v28;
  id v29;
  id v30;

  v5 = 1.0;
  v6 = a4 * 5.0 + (1.0 - a4) * 0.0;
  v7 = a3 * 45.0 + (1.0 - a3) * 0.0;
  -[UPQuiltConfigurationPhone bottomLeftQuiltAsleepPath](self->_configuration, "bottomLeftQuiltAsleepPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UPQuiltConfigurationPhone bottomLeftQuiltAwakeLockedPath](self->_configuration, "bottomLeftQuiltAwakeLockedPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 <= 5.0)
    v10 = v6 / 5.0;
  else
    v10 = 1.0;
  UPInterpolateBetweenBezierPaths(v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[UPQuiltConfigurationPhone bottomLeftQuiltUnlockedPath](self->_configuration, "bottomLeftQuiltUnlockedPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 <= 45.0)
    v5 = v7 / 45.0;
  UPInterpolateBetweenBezierPaths(v11, v12, v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[UPQuiltConfigurationPhone topQuiltAsleepPath](self->_configuration, "topQuiltAsleepPath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UPQuiltConfigurationPhone topQuiltAwakeLockedPath](self->_configuration, "topQuiltAwakeLockedPath");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  UPInterpolateBetweenBezierPaths(v14, v15, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[UPQuiltConfigurationPhone topQuiltUnlockedPath](self->_configuration, "topQuiltUnlockedPath");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  UPInterpolateBetweenBezierPaths(v16, v17, v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[UPQuiltConfigurationPhone bottomRightQuiltAwakeLockedPath](self->_configuration, "bottomRightQuiltAwakeLockedPath");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UPQuiltConfigurationPhone bottomRightQuiltUnlockedPath](self->_configuration, "bottomRightQuiltUnlockedPath");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  UPInterpolateBetweenBezierPaths(v19, v20, v5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_retainAutorelease(v18);
  v23 = (const CGPath *)objc_msgSend(v22, "CGPath");
  v24 = objc_retainAutorelease(v13);
  CopyByIntersectingPath = CGPathCreateCopyByIntersectingPath(v23, (CGPathRef)objc_msgSend(v24, "CGPath"), 0);
  v26 = objc_retainAutorelease(v22);
  CopyBySubtractingPath = CGPathCreateCopyBySubtractingPath((CGPathRef)objc_msgSend(v26, "CGPath"), CopyByIntersectingPath, 0);
  v30 = objc_retainAutorelease(v24);
  v28 = CGPathCreateCopyBySubtractingPath((CGPathRef)objc_msgSend(v30, "CGPath"), CopyByIntersectingPath, 0);
  -[CAShapeLayer setPath:](self->_topQuiltPieceLayer, "setPath:", CopyBySubtractingPath);
  -[CAShapeLayer setPath:](self->_bottomLeftQuiltPieceLayer, "setPath:", v28);
  -[CAShapeLayer setPath:](self->_intersectionPieceLayer, "setPath:", CopyByIntersectingPath);
  v29 = objc_retainAutorelease(v21);
  -[CAShapeLayer setPath:](self->_bottomRightQuiltPieceLayer, "setPath:", objc_msgSend(v29, "CGPath"));
  if (CopyByIntersectingPath)
    CGPathRelease(CopyByIntersectingPath);
  if (CopyBySubtractingPath)
    CGPathRelease(CopyBySubtractingPath);
  if (v28)
    CGPathRelease(v28);

}

- (void)cleanupQuiltPaths
{
  const CGPath *v2;
  const CGPath *v3;

  if (a1)
  {
    v2 = *(const CGPath **)(a1 + 544);
    if (v2)
    {
      CGPathRelease(v2);
      *(_QWORD *)(a1 + 544) = 0;
    }
    v3 = *(const CGPath **)(a1 + 560);
    if (v3)
    {
      CGPathRelease(v3);
      *(_QWORD *)(a1 + 560) = 0;
    }
  }
}

- (void)dealloc
{
  objc_super v3;

  -[UPQuiltViewPhone cleanupQuiltPaths]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)UPQuiltViewPhone;
  -[UPQuiltViewPhone dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UPQuilt = memory:%p"), self);
}

- (UIColor)topQuiltColor
{
  return self->_topQuiltColor;
}

- (UIColor)bottomLeftQuiltColor
{
  return self->_bottomLeftQuiltColor;
}

- (UIColor)intersectionPieceColor
{
  return self->_intersectionPieceColor;
}

- (UIColor)bottomRightQuiltColor
{
  return self->_bottomRightQuiltColor;
}

- (CAShapeLayer)topQuiltPieceLayer
{
  return self->_topQuiltPieceLayer;
}

- (void)setTopQuiltPieceLayer:(id)a3
{
  objc_storeStrong((id *)&self->_topQuiltPieceLayer, a3);
}

- (CAShapeLayer)bottomLeftQuiltPieceLayer
{
  return self->_bottomLeftQuiltPieceLayer;
}

- (void)setBottomLeftQuiltPieceLayer:(id)a3
{
  objc_storeStrong((id *)&self->_bottomLeftQuiltPieceLayer, a3);
}

- (CAShapeLayer)bottomRightQuiltPieceLayer
{
  return self->_bottomRightQuiltPieceLayer;
}

- (void)setBottomRightQuiltPieceLayer:(id)a3
{
  objc_storeStrong((id *)&self->_bottomRightQuiltPieceLayer, a3);
}

- (UPQuiltConfigurationPhone)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_bottomRightQuiltColor, 0);
  objc_storeStrong((id *)&self->_intersectionPieceColor, 0);
  objc_storeStrong((id *)&self->_bottomLeftQuiltColor, 0);
  objc_storeStrong((id *)&self->_topQuiltColor, 0);
  objc_storeStrong((id *)&self->_bottomRightQuiltPieceLayer, 0);
  objc_storeStrong((id *)&self->_intersectionPieceLayer, 0);
  objc_storeStrong((id *)&self->_bottomLeftQuiltPieceLayer, 0);
  objc_storeStrong((id *)&self->_topQuiltPieceLayer, 0);
}

@end
