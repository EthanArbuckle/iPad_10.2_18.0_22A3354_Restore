@implementation WCFocusRingShapeLayer

+ (id)clearLayer
{
  void *v2;
  id v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___WCFocusRingShapeLayer;
  objc_msgSendSuper2(&v5, sel_layer);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v2, "setFillColor:", objc_msgSend(v3, "CGColor"));

  return v2;
}

+ (id)focusLayerForUserInterfaceStyle:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(a1, "layer", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFillColor:", 0);
  objc_msgSend(MEMORY[0x24BDE5758], "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInnerFocusOutlineLayer:", v4);

  objc_msgSend(v3, "innerFocusOutlineLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFillColor:", 0);

  objc_msgSend(v3, "innerFocusOutlineLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSublayer:", v6);

  objc_msgSend(MEMORY[0x24BDE5758], "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOuterFocusOutlineLayer:", v7);

  objc_msgSend(v3, "outerFocusOutlineLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFillColor:", 0);

  objc_msgSend(v3, "outerFocusOutlineLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSublayer:", v9);

  objc_msgSend(v3, "updateCachedSettings");
  +[WatchControlSettings sharedInstance](WatchControlSettings, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSettingsObserver:", v3);

  return v3;
}

+ (id)parentLayerForUserInterfaceStyle:(int64_t)a3
{
  return +[WCFocusRingShapeLayer clearLayer](WCFocusRingShapeLayer, "clearLayer", a3);
}

+ (id)selectedParentLayerForUserInterfaceStyle:(int64_t)a3
{
  return +[WCFocusRingShapeLayer clearLayer](WCFocusRingShapeLayer, "clearLayer", a3);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[WatchControlSettings sharedInstance](WatchControlSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeSettingsObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)WCFocusRingShapeLayer;
  -[WCFocusRingShapeLayer dealloc](&v4, sel_dealloc);
}

- (void)watchControlSettingsDidChange:(id)a3
{
  AXPerformBlockAsynchronouslyOnMainThread();
}

uint64_t __55__WCFocusRingShapeLayer_watchControlSettingsDidChange___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "updateCachedSettings");
  return objc_msgSend(*(id *)(a1 + 32), "updateAppearance");
}

- (void)setPath:(CGPath *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WCFocusRingShapeLayer;
  -[WCFocusRingShapeLayer setPath:](&v4, sel_setPath_, a3);
  -[WCFocusRingShapeLayer updateFocusOutlinePath](self, "updateFocusOutlinePath");
  -[WCFocusRingShapeLayer updateAppearance](self, "updateAppearance");
}

- (void)updateCachedSettings
{
  void *v3;
  id v4;

  +[WatchControlSettings sharedInstance](WatchControlSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WCFocusRingShapeLayer setIncreasedContrast:](self, "setIncreasedContrast:", objc_msgSend(v3, "focusRingHighContrastEnabled"));

  +[WatchControlSettings sharedInstance](WatchControlSettings, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WCFocusRingShapeLayer setFocusRingColor:](self, "setFocusRingColor:", objc_msgSend(v4, "focusRingColor"));

}

- (void)updateFocusOutlinePath
{
  void *v3;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  _BOOL4 v13;
  double v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  double v31;
  CGFloat v32;
  void *v33;
  id v34;
  void *v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  double v42;
  double v43;
  double v44;
  CGFloat v45;
  double v46;
  double v47;
  id v48;
  uint64_t v49;
  void *v50;
  double v51;
  double sx;
  __int128 v53;
  CGFloat rect;
  __int128 recta;
  CGFloat rect_16;
  __int128 rect_16a;
  CGAffineTransform v58;
  CGAffineTransform v59;
  CGAffineTransform v60;
  CGAffineTransform v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;

  if (-[WCFocusRingShapeLayer path](self, "path"))
  {
    objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithCGPath:", -[WCFocusRingShapeLayer path](self, "path"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    x = v62.origin.x;
    y = v62.origin.y;
    width = v62.size.width;
    height = v62.size.height;
    v8 = CGRectGetWidth(v62);
    v63.origin.x = x;
    v63.origin.y = y;
    rect_16 = y;
    v63.size.width = width;
    v63.size.height = height;
    v9 = CGRectGetHeight(v63);
    if (v8 >= v9)
      v8 = v9;
    -[WCFocusRingShapeLayer innerFocusOutlineLayer](self, "innerFocusOutlineLayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lineWidth");
    v12 = v11 * 0.5;

    v13 = -[WCFocusRingShapeLayer increasedContrast](self, "increasedContrast");
    v14 = v12 + -0.5;
    if (!v13)
      v14 = v12;
    if (v14 + v14 >= v8)
      v15 = 0.0;
    else
      v15 = v14;
    v64.origin.x = x;
    v16 = x;
    rect = x;
    v64.origin.y = y;
    v64.size.width = width;
    v64.size.height = height;
    v65 = CGRectInset(v64, v15, v15);
    v17 = v65.size.width;
    v18 = v65.size.height;
    v19 = v65.origin.x;
    v20 = v65.origin.y;
    v21 = CGRectGetWidth(v65);
    v66.origin.x = v16;
    v66.origin.y = rect_16;
    v66.size.width = width;
    v66.size.height = height;
    v22 = v21 / CGRectGetWidth(v66);
    v67.origin.x = v19;
    v67.origin.y = v20;
    v67.size.width = v17;
    v67.size.height = v18;
    v23 = CGRectGetHeight(v67);
    v68.origin.x = rect;
    v68.origin.y = rect_16;
    v68.size.width = width;
    v68.size.height = height;
    v24 = CGRectGetHeight(v68);
    memset(&v61, 0, sizeof(v61));
    rect_16a = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)&v60.a = *MEMORY[0x24BDBD8B8];
    recta = *(_OWORD *)&v60.a;
    *(_OWORD *)&v60.c = rect_16a;
    *(_OWORD *)&v60.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    v53 = *(_OWORD *)&v60.tx;
    CGAffineTransformScale(&v61, &v60, v22, v23 / v24);
    v60 = v61;
    objc_msgSend(v3, "applyTransform:", &v60);
    objc_msgSend(v3, "bounds");
    *(_OWORD *)&v59.a = recta;
    *(_OWORD *)&v59.c = rect_16a;
    *(_OWORD *)&v59.tx = v53;
    memset(&v60, 0, sizeof(v60));
    CGAffineTransformTranslate(&v60, &v59, v19 - v25, v20 - v26);
    v59 = v60;
    objc_msgSend(v3, "applyTransform:", &v59);
    objc_msgSend(v3, "closePath");
    v27 = objc_retainAutorelease(v3);
    v28 = objc_msgSend(v27, "CGPath");
    -[WCFocusRingShapeLayer innerFocusOutlineLayer](self, "innerFocusOutlineLayer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setPath:", v28);

    -[WCFocusRingShapeLayer outerFocusOutlineLayer](self, "outerFocusOutlineLayer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "lineWidth");
    v32 = v31 * -0.5;

    v33 = (void *)MEMORY[0x24BDF6870];
    v34 = objc_retainAutorelease(v27);
    objc_msgSend(v33, "bezierPathWithCGPath:", objc_msgSend(v34, "CGPath"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v35, "bounds");
    v36 = v69.origin.x;
    v37 = v69.origin.y;
    v38 = v69.size.width;
    v39 = v69.size.height;
    v70 = CGRectInset(v69, v32, v32);
    v51 = v70.origin.y;
    v40 = v70.size.width;
    v41 = v70.size.height;
    v42 = v70.origin.x;
    v43 = CGRectGetWidth(v70);
    v71.origin.x = v36;
    v71.origin.y = v37;
    v71.size.width = v38;
    v71.size.height = v39;
    sx = v43 / CGRectGetWidth(v71);
    v72.origin.x = v42;
    v72.origin.y = v51;
    v72.size.width = v40;
    v72.size.height = v41;
    v44 = CGRectGetHeight(v72);
    v73.origin.x = v36;
    v73.origin.y = v37;
    v73.size.width = v38;
    v73.size.height = v39;
    v45 = CGRectGetHeight(v73);
    *(_OWORD *)&v58.a = recta;
    *(_OWORD *)&v58.c = rect_16a;
    *(_OWORD *)&v58.tx = v53;
    CGAffineTransformScale(&v59, &v58, sx, v44 / v45);
    v61 = v59;
    objc_msgSend(v35, "applyTransform:", &v59);
    objc_msgSend(v35, "bounds");
    *(_OWORD *)&v58.a = recta;
    *(_OWORD *)&v58.c = rect_16a;
    *(_OWORD *)&v58.tx = v53;
    CGAffineTransformTranslate(&v59, &v58, v42 - v46, v51 - v47);
    v60 = v59;
    objc_msgSend(v35, "applyTransform:", &v59);
    objc_msgSend(v35, "closePath");
    v48 = objc_retainAutorelease(v35);
    v49 = objc_msgSend(v48, "CGPath");
    -[WCFocusRingShapeLayer outerFocusOutlineLayer](self, "outerFocusOutlineLayer");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setPath:", v49);

  }
}

- (void)updateAppearance
{
  double v3;
  double v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  _BOOL4 v12;
  uint64_t v13;
  void *v14;

  -[WCFocusRingShapeLayer scaledOutlineWidth:](self, "scaledOutlineWidth:", 3.0);
  v4 = v3;
  -[WCFocusRingShapeLayer innerFocusOutlineLayer](self, "innerFocusOutlineLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLineWidth:", v4);

  -[WCFocusRingShapeLayer strokeColorForFocusOutline](self, "strokeColorForFocusOutline");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = (id)objc_msgSend(v6, "CGColor");
  -[WCFocusRingShapeLayer innerFocusOutlineLayer](self, "innerFocusOutlineLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setStrokeColor:", v7);

  -[WCFocusRingShapeLayer scaledOutlineWidth:](self, "scaledOutlineWidth:", 3.0);
  v10 = v9;
  -[WCFocusRingShapeLayer outerFocusOutlineLayer](self, "outerFocusOutlineLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLineWidth:", v10);

  v12 = -[WCFocusRingShapeLayer increasedContrast](self, "increasedContrast");
  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = objc_msgSend(v7, "CGColor");
  }
  else
  {
    v13 = 0;
  }
  -[WCFocusRingShapeLayer outerFocusOutlineLayer](self, "outerFocusOutlineLayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setStrokeColor:", v13);

  if (v12)
  -[WCFocusRingShapeLayer updateFocusOutlinePath](self, "updateFocusOutlinePath");
}

- (id)strokeColorForFocusOutline
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  double v9;
  double v10;
  BOOL v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v17;
  double v18;
  double v19;

  v3 = (void *)MEMORY[0x24BDF6950];
  AXAssistiveTouchCursorColorForCursorColor(-[WCFocusRingShapeLayer focusRingColor](self, "focusRingColor"));
  objc_msgSend(v3, "colorWithCGColor:", AXSAssistiveTouchCursorColor());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[WCFocusRingShapeLayer focusRingColor](self, "focusRingColor"))
  {
    -[WCFocusRingShapeLayer viewTintColor](self, "viewTintColor");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
      v7 = (void *)v5;
    else
      v7 = v4;
    v8 = v7;

    v4 = v8;
  }
  v18 = 0.0;
  v19 = 0.0;
  v17 = 0.0;
  objc_msgSend(v4, "getHue:saturation:brightness:alpha:", &v19, &v18, &v17, 0);
  v9 = v17 + v17 * v18 * -0.5;
  v10 = 0.0;
  v11 = v9 == 0.0 || v9 == 1.0;
  v12 = 0.0;
  if (!v11)
    v12 = (v17 - v9) / fmin(v9, 1.0 - v9);
  v13 = fmax(fmin(v9, 0.8), 0.25);
  v14 = v13 + v12 * fmin(v13, 1.0 - v13);
  v17 = v14;
  if (v14 != 0.0)
    v10 = 2.0 - (v13 + v13) / v14;
  v18 = v10;
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithHue:saturation:brightness:alpha:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)viewTintColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  objc_opt_class();
  -[WCFocusRingShapeLayer superlayer](self, "superlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CALayerGetDelegate();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_accessibilityFocusRingTintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_opt_class();
    objc_msgSend(v5, "safeValueForKey:", CFSTR("_normalInheritedTintColor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (double)scaledOutlineWidth:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;

  objc_opt_class();
  -[WCFocusRingShapeLayer superlayer](self, "superlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CALayerGetDelegate();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "_axScaleTransformForFocusLayerLineWidth");
    a3 = v8 * a3;
  }

  return a3;
}

- (int64_t)focusRingColor
{
  return self->_focusRingColor;
}

- (void)setFocusRingColor:(int64_t)a3
{
  self->_focusRingColor = a3;
}

- (BOOL)increasedContrast
{
  return self->_increasedContrast;
}

- (void)setIncreasedContrast:(BOOL)a3
{
  self->_increasedContrast = a3;
}

- (CAShapeLayer)innerFocusOutlineLayer
{
  return self->_innerFocusOutlineLayer;
}

- (void)setInnerFocusOutlineLayer:(id)a3
{
  objc_storeStrong((id *)&self->_innerFocusOutlineLayer, a3);
}

- (CAShapeLayer)outerFocusOutlineLayer
{
  return self->_outerFocusOutlineLayer;
}

- (void)setOuterFocusOutlineLayer:(id)a3
{
  objc_storeStrong((id *)&self->_outerFocusOutlineLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outerFocusOutlineLayer, 0);
  objc_storeStrong((id *)&self->_innerFocusOutlineLayer, 0);
}

@end
