@implementation PRXScannerIndicatorView

- (PRXScannerIndicatorView)init
{
  PRXScannerIndicatorView *v2;
  CAShapeLayer *v3;
  CAShapeLayer *viewFinderTintLayer;
  CAGradientLayer *v5;
  CAGradientLayer *viewFinderBorderLayer;
  CAShapeLayer *v7;
  CAShapeLayer *borderLayerMask;
  CAShapeLayer *v9;
  CAShapeLayer *initialWhiteTintLayer;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PRXScannerIndicatorView;
  v2 = -[PRXScannerIndicatorView initWithFrame:](&v12, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  if (v2)
  {
    v3 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x24BDE5758]);
    viewFinderTintLayer = v2->_viewFinderTintLayer;
    v2->_viewFinderTintLayer = v3;

    v5 = (CAGradientLayer *)objc_alloc_init(MEMORY[0x24BDE56B8]);
    viewFinderBorderLayer = v2->_viewFinderBorderLayer;
    v2->_viewFinderBorderLayer = v5;

    v7 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x24BDE5758]);
    borderLayerMask = v2->_borderLayerMask;
    v2->_borderLayerMask = v7;

    v9 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x24BDE5758]);
    initialWhiteTintLayer = v2->_initialWhiteTintLayer;
    v2->_initialWhiteTintLayer = v9;

    -[PRXScannerIndicatorView configure](v2, "configure");
  }
  return v2;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  objc_super v39;

  v39.receiver = self;
  v39.super_class = (Class)PRXScannerIndicatorView;
  -[PRXScannerIndicatorView layoutSubviews](&v39, sel_layoutSubviews);
  -[PRXScannerIndicatorView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PRXScannerIndicatorView viewFinderTintLayer](self, "viewFinderTintLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[PRXScannerIndicatorView bounds](self, "bounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[PRXScannerIndicatorView viewFinderBorderLayer](self, "viewFinderBorderLayer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

  -[PRXScannerIndicatorView bounds](self, "bounds");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  -[PRXScannerIndicatorView initialWhiteTintLayer](self, "initialWhiteTintLayer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setFrame:", v22, v24, v26, v28);

  -[PRXScannerIndicatorView bounds](self, "bounds");
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v37 = v36;
  -[PRXScannerIndicatorView borderLayerMask](self, "borderLayerMask");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setFrame:", v31, v33, v35, v37);

  -[PRXScannerIndicatorView animateInitialIfNeeded](self, "animateInitialIfNeeded");
}

+ (double)innerHoleRatio
{
  return 0.6;
}

+ (double)strokeWidth
{
  return 13.0;
}

- (void)configure
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  CGAffineTransform v25;

  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = objc_msgSend(v3, "CGColor");
  -[PRXScannerIndicatorView viewFinderTintLayer](self, "viewFinderTintLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFillColor:", v4);

  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = objc_msgSend(v6, "CGColor");
  -[PRXScannerIndicatorView initialWhiteTintLayer](self, "initialWhiteTintLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFillColor:", v7);

  v9 = *MEMORY[0x24BDE5C50];
  -[PRXScannerIndicatorView viewFinderBorderLayer](self, "viewFinderBorderLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setType:", v9);

  -[PRXScannerIndicatorView viewFinderBorderLayer](self, "viewFinderBorderLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setStartPoint:", 0.5, 0.5);

  -[PRXScannerIndicatorView viewFinderBorderLayer](self, "viewFinderBorderLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  CGAffineTransformMakeRotation(&v25, 3.14159265);
  objc_msgSend(v12, "setAffineTransform:", &v25);

  -[PRXScannerIndicatorView borderLayerMask](self, "borderLayerMask");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = 1060320051;
  objc_msgSend(v13, "setOpacity:", v14);

  -[PRXScannerIndicatorView viewFinderTintLayer](self, "viewFinderTintLayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = 1062501089;
  objc_msgSend(v15, "setOpacity:", v16);

  -[PRXScannerIndicatorView initialWhiteTintLayer](self, "initialWhiteTintLayer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v18) = 1.0;
  objc_msgSend(v17, "setOpacity:", v18);

  -[PRXScannerIndicatorView layer](self, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRXScannerIndicatorView viewFinderBorderLayer](self, "viewFinderBorderLayer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "insertSublayer:atIndex:", v20, 0);

  -[PRXScannerIndicatorView layer](self, "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRXScannerIndicatorView initialWhiteTintLayer](self, "initialWhiteTintLayer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "insertSublayer:atIndex:", v22, 0);

  -[PRXScannerIndicatorView layer](self, "layer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRXScannerIndicatorView viewFinderTintLayer](self, "viewFinderTintLayer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "insertSublayer:atIndex:", v24, 0);

  -[PRXScannerIndicatorView initial](self, "initial");
}

- (void)initial
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  -[PRXScannerIndicatorView viewFinderBorderLayer](self, "viewFinderBorderLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllAnimations");

  -[PRXScannerIndicatorView innerHolePathForRatio:stroke:](self, "innerHolePathForRatio:stroke:", 0.6, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "strokeWidth");
  -[PRXScannerIndicatorView innerHolePathForRatio:stroke:](self, "innerHolePathForRatio:stroke:", 0.6, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendPath:", v6);

  v7 = objc_retainAutorelease(v4);
  v8 = objc_msgSend(v7, "CGPath");
  -[PRXScannerIndicatorView borderLayerMask](self, "borderLayerMask");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPath:", v8);

  objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "colorWithAlphaComponent:", 1.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "colorWithAlphaComponent:", 1.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[PRXScannerIndicatorView animateToColors:duration:](self, "animateToColors:duration:", v14, 0.0);
  -[PRXScannerIndicatorView animateBorderFrom:to:duration:](self, "animateBorderFrom:to:duration:", 0, v7, 0.0);

}

- (void)completed
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDF6950], "systemGreenColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorWithAlphaComponent:", 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  objc_msgSend(MEMORY[0x24BDF6950], "systemGreenColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "colorWithAlphaComponent:", 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PRXScannerIndicatorView animateToColors:duration:](self, "animateToColors:duration:", v7, 0.2);
  -[PRXScannerIndicatorView innerHolePathForRatio:stroke:](self, "innerHolePathForRatio:stroke:", 0.6, 0.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "strokeWidth");
  -[PRXScannerIndicatorView innerHolePathForRatio:stroke:](self, "innerHolePathForRatio:stroke:", 0.6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendPath:", v10);

  -[PRXScannerIndicatorView innerHolePathForRatio:stroke:](self, "innerHolePathForRatio:stroke:", 0.6, 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRXScannerIndicatorView innerHolePathForRatio:stroke:](self, "innerHolePathForRatio:stroke:", 0.6, 19.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendPath:", v12);

  -[PRXScannerIndicatorView animateBorderFrom:to:duration:](self, "animateBorderFrom:to:duration:", v8, v11, 0.5);
  -[PRXScannerIndicatorView setNeedsReset:](self, "setNeedsReset:", 1);

}

- (id)innerHolePathForRatio:(double)a3 stroke:(double)a4
{
  double v7;
  double v8;
  CGFloat v9;
  CGRect v11;
  CGRect v12;

  -[PRXScannerIndicatorView bounds](self, "bounds");
  v8 = a4 + v7 * a3;
  -[PRXScannerIndicatorView bounds](self, "bounds");
  v9 = CGRectGetMidX(v11) - v8 * 0.5;
  -[PRXScannerIndicatorView bounds](self, "bounds");
  return (id)objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithRoundedRect:cornerRadius:", v9, CGRectGetMidY(v12) - v8 * 0.5, v8, v8, v8 * 0.5);
}

- (void)animateToColors:(id)a3 duration:(double)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v12));
        objc_msgSend(v7, "addObject:", objc_msgSend(v13, "CGColor", (_QWORD)v19));
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  if (a4 <= 0.0)
  {
    -[PRXScannerIndicatorView viewFinderBorderLayer](self, "viewFinderBorderLayer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setColors:", v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("colors"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXScannerIndicatorView viewFinderBorderLayer](self, "viewFinderBorderLayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "colors");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFromValue:", v16);

    objc_msgSend(v14, "setToValue:", v7);
    objc_msgSend(v14, "setDuration:", a4);
    objc_msgSend(v14, "setRemovedOnCompletion:", 0);
    objc_msgSend(v14, "setDelegate:", self);
    -[PRXScannerIndicatorView viewFinderBorderLayer](self, "viewFinderBorderLayer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setColors:", v7);

    -[PRXScannerIndicatorView viewFinderBorderLayer](self, "viewFinderBorderLayer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addAnimation:forKey:", v14, CFSTR("colors"));

  }
}

- (void)animateBorderFrom:(id)a3 to:(id)a4 duration:(double)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;

  v8 = (void *)MEMORY[0x24BDE5648];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "animationWithKeyPath:", CFSTR("path"));
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_retainAutorelease(v10);
  v12 = objc_msgSend(v11, "CGPath");

  objc_msgSend(v17, "setFromValue:", v12);
  v13 = objc_retainAutorelease(v9);
  v14 = objc_msgSend(v13, "CGPath");

  objc_msgSend(v17, "setToValue:", v14);
  objc_msgSend(v17, "setDuration:", a5);
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D20]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTimingFunction:", v15);

  objc_msgSend(v17, "setFillMode:", *MEMORY[0x24BDE5970]);
  objc_msgSend(v17, "setRemovedOnCompletion:", 0);
  -[PRXScannerIndicatorView borderLayerMask](self, "borderLayerMask");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAnimation:forKey:", v17, CFSTR("path"));

}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  char isKindOfClass;
  void *v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = v13;
  if ((isKindOfClass & 1) != 0)
  {
    v7 = v13;
    objc_msgSend(v7, "keyPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("colors"));

    if (v9)
    {
      objc_msgSend(v7, "toValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRXScannerIndicatorView viewFinderBorderLayer](self, "viewFinderBorderLayer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setColors:", v10);

      if (-[PRXScannerIndicatorView needsReset](self, "needsReset"))
      {
        -[PRXScannerIndicatorView viewFinderBorderLayer](self, "viewFinderBorderLayer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "removeAllAnimations");

      }
      -[PRXScannerIndicatorView setNeedsReset:](self, "setNeedsReset:", 0);
    }

    v6 = v13;
  }

}

- (void)animateInitialIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  dispatch_time_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t);
  void *v34;
  PRXScannerIndicatorView *v35;
  id v36;

  v3 = (void *)MEMORY[0x24BDF6870];
  -[PRXScannerIndicatorView bounds](self, "bounds");
  objc_msgSend(v3, "bezierPathWithRoundedRect:cornerRadius:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRXScannerIndicatorView innerHolePathForRatio:stroke:](self, "innerHolePathForRatio:stroke:", 0.6, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendPath:", v5);

  -[PRXScannerIndicatorView innerHolePathForRatio:stroke:](self, "innerHolePathForRatio:stroke:", 0.45, 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "strokeWidth");
  -[PRXScannerIndicatorView innerHolePathForRatio:stroke:](self, "innerHolePathForRatio:stroke:", 0.45, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendPath:", v8);

  -[PRXScannerIndicatorView innerHolePathForRatio:stroke:](self, "innerHolePathForRatio:stroke:", 0.6, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "strokeWidth");
  -[PRXScannerIndicatorView innerHolePathForRatio:stroke:](self, "innerHolePathForRatio:stroke:", 0.6, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendPath:", v11);

  v12 = objc_retainAutorelease(v4);
  v13 = objc_msgSend(v12, "CGPath");
  -[PRXScannerIndicatorView viewFinderTintLayer](self, "viewFinderTintLayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPath:", v13);

  v15 = objc_retainAutorelease(v6);
  v16 = objc_msgSend(v15, "CGPath");
  -[PRXScannerIndicatorView borderLayerMask](self, "borderLayerMask");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setPath:", v16);

  -[PRXScannerIndicatorView borderLayerMask](self, "borderLayerMask");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRXScannerIndicatorView viewFinderBorderLayer](self, "viewFinderBorderLayer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setMask:", v18);

  v20 = (void *)MEMORY[0x24BDF6870];
  -[PRXScannerIndicatorView bounds](self, "bounds");
  objc_msgSend(v20, "bezierPathWithRoundedRect:cornerRadius:");
  v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v22 = objc_msgSend(v21, "CGPath");
  -[PRXScannerIndicatorView initialWhiteTintLayer](self, "initialWhiteTintLayer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setPath:", v22);

  v24 = *MEMORY[0x24BDE5988];
  -[PRXScannerIndicatorView viewFinderTintLayer](self, "viewFinderTintLayer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFillRule:", v24);

  -[PRXScannerIndicatorView borderLayerMask](self, "borderLayerMask");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setFillRule:", v24);

  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setFromValue:", &unk_24CC3E018);
  objc_msgSend(v27, "setToValue:", &unk_24CC3E030);
  objc_msgSend(v27, "setDuration:", 0.6);
  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D20]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setTimingFunction:", v28);

  objc_msgSend(v27, "setFillMode:", *MEMORY[0x24BDE5970]);
  objc_msgSend(v27, "setRemovedOnCompletion:", 0);
  v29 = dispatch_time(0, 200000000);
  v31 = MEMORY[0x24BDAC760];
  v32 = 3221225472;
  v33 = __49__PRXScannerIndicatorView_animateInitialIfNeeded__block_invoke;
  v34 = &unk_24CC31E98;
  v35 = self;
  v36 = v27;
  v30 = v27;
  dispatch_after(v29, MEMORY[0x24BDAC9B8], &v31);
  -[PRXScannerIndicatorView animateBorderFrom:to:duration:](self, "animateBorderFrom:to:duration:", v15, v9, 0.5, v31, v32, v33, v34, v35);

}

void __49__PRXScannerIndicatorView_animateInitialIfNeeded__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "initialWhiteTintLayer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addAnimation:forKey:", *(_QWORD *)(a1 + 40), CFSTR("opacity"));

}

- (CAShapeLayer)viewFinderTintLayer
{
  return self->_viewFinderTintLayer;
}

- (CAGradientLayer)viewFinderBorderLayer
{
  return self->_viewFinderBorderLayer;
}

- (CAShapeLayer)borderLayerMask
{
  return self->_borderLayerMask;
}

- (CAShapeLayer)initialWhiteTintLayer
{
  return self->_initialWhiteTintLayer;
}

- (BOOL)needsReset
{
  return self->_needsReset;
}

- (void)setNeedsReset:(BOOL)a3
{
  self->_needsReset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialWhiteTintLayer, 0);
  objc_storeStrong((id *)&self->_borderLayerMask, 0);
  objc_storeStrong((id *)&self->_viewFinderBorderLayer, 0);
  objc_storeStrong((id *)&self->_viewFinderTintLayer, 0);
}

@end
