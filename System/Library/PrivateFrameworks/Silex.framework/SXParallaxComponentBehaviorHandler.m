@implementation SXParallaxComponentBehaviorHandler

- (SXParallaxComponentBehaviorHandler)initWithComponentView:(id)a3 withBehavior:(id)a4
{
  SXParallaxComponentBehaviorHandler *v4;
  SXParallaxComponentBehaviorHandler *v5;
  void *v6;
  double v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SXParallaxComponentBehaviorHandler;
  v4 = -[SXComponentBehaviorHandler initWithComponentView:withBehavior:](&v10, sel_initWithComponentView_withBehavior_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[SXComponentBehaviorHandler behavior](v4, "behavior");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "factor");
    v5->_factor = v7;

    -[SXComponentBehaviorHandler behavior](v5, "behavior");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_direction = objc_msgSend(v8, "direction");

  }
  return v5;
}

- (void)setupWithBehaviorController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  char isKindOfClass;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  objc_super v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)SXParallaxComponentBehaviorHandler;
  -[SXComponentBehaviorHandler setupWithBehaviorController:](&v30, sel_setupWithBehaviorController_, v4);
  -[SXComponentBehaviorHandler behaviorView](self, "behaviorView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewport");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "documentSize");
  v8 = v7;

  objc_msgSend(v4, "viewport");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v11 = v10;
  v13 = v12;

  v14 = *MEMORY[0x24BDBEFB0];
  v15 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "absoluteFrame");
    -[SXParallaxComponentBehaviorHandler setAbsoluteContentViewFrame:](self, "setAbsoluteContentViewFrame:");
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    objc_msgSend(v4, "viewport");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v5, "contentFrame");
      objc_msgSend(v17, "convertRect:fromView:", v5);
      -[SXParallaxComponentBehaviorHandler setAbsoluteContentViewFrame:](self, "setAbsoluteContentViewFrame:");
    }
    else
    {
      objc_msgSend(v5, "frameUsingCenterAndBounds");
      v19 = v18;
      v21 = v20;
      v23 = v22;
      v29 = v15;
      v24 = v8;
      v26 = v25;
      objc_msgSend(v5, "superview");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v26;
      v8 = v24;
      v15 = v29;
      objc_msgSend(v17, "convertRect:fromView:", v27, v19, v21, v23, v28);
      -[SXParallaxComponentBehaviorHandler setAbsoluteContentViewFrame:](self, "setAbsoluteContentViewFrame:");

    }
  }
  -[SXParallaxComponentBehaviorHandler absoluteContentViewFrame](self, "absoluteContentViewFrame");
  v33.origin.x = v14;
  v33.origin.y = v15;
  v33.size.width = v11;
  v33.size.height = v13;
  -[SXParallaxComponentBehaviorHandler setInFirstViewport:](self, "setInFirstViewport:", CGRectIntersectsRect(v31, v33));
  -[SXParallaxComponentBehaviorHandler absoluteContentViewFrame](self, "absoluteContentViewFrame");
  v34.origin.x = v14;
  v34.origin.y = v8 - v13;
  v34.size.width = v11;
  v34.size.height = v13;
  -[SXParallaxComponentBehaviorHandler setInLastViewport:](self, "setInLastViewport:", CGRectIntersectsRect(v32, v34));

}

- (void)updateWithBehaviorController:(id)a3
{
  id v4;
  void *v5;
  __int128 v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double MinY;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  int v24;
  BOOL v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  double v33;
  double v34;
  double v35;
  void *v37;
  double v38;
  double v39;
  double v40;
  id v41;
  CGAffineTransform v42;
  CGAffineTransform v43;
  _OWORD v44[3];
  objc_super v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;

  v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)SXParallaxComponentBehaviorHandler;
  -[SXComponentBehaviorHandler updateWithBehaviorController:](&v45, sel_updateWithBehaviorController_, v4);
  -[SXComponentBehaviorHandler behaviorView](self, "behaviorView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsReduceMotionEnabled())
  {
    v6 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    v44[0] = *MEMORY[0x24BDBD8B8];
    v44[1] = v6;
    v44[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    objc_msgSend(v5, "setTransform:", v44);
  }
  else
  {
    objc_msgSend(v4, "viewport");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dynamicBounds");
    v9 = v8;

    objc_msgSend(v4, "viewport");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "documentSize");
    v12 = v11;

    objc_msgSend(v4, "viewport");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    v15 = v14;
    if (-[SXParallaxComponentBehaviorHandler inFirstViewport](self, "inFirstViewport"))
    {
      objc_msgSend(v13, "contentFrame");
      v16 = v9 - CGRectGetMinY(v46);
    }
    else if (-[SXParallaxComponentBehaviorHandler inLastViewport](self, "inLastViewport"))
    {
      v17 = 0.0;
      if (v9 >= 0.0)
        v17 = v9;
      v16 = -(v12 - v15 - v17);
    }
    else
    {
      -[SXParallaxComponentBehaviorHandler absoluteContentViewFrame](self, "absoluteContentViewFrame");
      MinY = CGRectGetMinY(v47);
      v19 = v9 + -44.0;
      if (v9 + -44.0 < 0.0)
        v19 = 0.0;
      v20 = MinY - v19;
      -[SXParallaxComponentBehaviorHandler absoluteContentViewFrame](self, "absoluteContentViewFrame");
      v16 = v20 + CGRectGetHeight(v48) * 0.5 - v15 * 0.5;
    }
    -[SXParallaxComponentBehaviorHandler factor](self, "factor");
    v22 = v21;
    if (-[SXParallaxComponentBehaviorHandler direction](self, "direction") != 2 || (v23 = 0.0, v16 >= 0.0))
    {
      v24 = -[SXParallaxComponentBehaviorHandler direction](self, "direction");
      v25 = v16 > 0.0 && v24 == 3;
      v23 = 0.0;
      if (!v25)
        v23 = v16;
    }
    v26 = 0.1;
    if (v22 != 1.79769313e308)
      v26 = 1.0 - v22;
    v27 = v26 * v23;
    -[SXComponentBehaviorHandler componentView](self, "componentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "presentationDelegate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "componentController");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "presentedBlueprint");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "isComplete");

    -[SXParallaxComponentBehaviorHandler absoluteContentViewFrame](self, "absoluteContentViewFrame");
    v33 = v27 + CGRectGetMinY(v49);
    -[SXParallaxComponentBehaviorHandler absoluteContentViewFrame](self, "absoluteContentViewFrame");
    v34 = v33 + CGRectGetHeight(v50);
    objc_msgSend(v13, "documentSize");
    if (v34 > v35 && v32 != 0)
    {
      -[SXComponentBehaviorHandler componentView](self, "componentView");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5 == v37)
      {
        objc_msgSend(v13, "documentSize");
        v39 = v38;
        -[SXParallaxComponentBehaviorHandler absoluteContentViewFrame](self, "absoluteContentViewFrame");
        v40 = v39 - CGRectGetHeight(v51);
        -[SXParallaxComponentBehaviorHandler absoluteContentViewFrame](self, "absoluteContentViewFrame");
        v27 = v40 - CGRectGetMinY(v52);
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v41 = v5;
      objc_msgSend(v41, "originalFrame");
      v54 = CGRectOffset(v53, 0.0, v27);
      objc_msgSend(v41, "setContentFrame:", v54.origin.x, v54.origin.y, v54.size.width, v54.size.height);

    }
    else
    {
      CGAffineTransformMakeTranslation(&v43, 0.0, v27);
      v42 = v43;
      objc_msgSend(v5, "setTransform:", &v42);
    }

  }
}

- (void)destroyWithBehaviorController:(id)a3
{
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  __int128 v8;
  _OWORD v9[3];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SXParallaxComponentBehaviorHandler;
  -[SXComponentBehaviorHandler destroyWithBehaviorController:](&v10, sel_destroyWithBehaviorController_, a3);
  -[SXComponentBehaviorHandler behaviorView](self, "behaviorView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  -[SXComponentBehaviorHandler behaviorView](self, "behaviorView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v6, "originalFrame");
    objc_msgSend(v7, "setContentFrame:");
  }
  else
  {
    v8 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    v9[0] = *MEMORY[0x24BDBD8B8];
    v9[1] = v8;
    v9[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    objc_msgSend(v6, "setTransform:", v9);
  }

}

- (BOOL)requiresContinuousUpdates
{
  return 1;
}

- (BOOL)isRotating
{
  return self->_isRotating;
}

- (BOOL)inFirstViewport
{
  return self->_inFirstViewport;
}

- (void)setInFirstViewport:(BOOL)a3
{
  self->_inFirstViewport = a3;
}

- (BOOL)inLastViewport
{
  return self->_inLastViewport;
}

- (void)setInLastViewport:(BOOL)a3
{
  self->_inLastViewport = a3;
}

- (CGRect)absoluteContentViewFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_absoluteContentViewFrame.origin.x;
  y = self->_absoluteContentViewFrame.origin.y;
  width = self->_absoluteContentViewFrame.size.width;
  height = self->_absoluteContentViewFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setAbsoluteContentViewFrame:(CGRect)a3
{
  self->_absoluteContentViewFrame = a3;
}

- (int)direction
{
  return self->_direction;
}

- (void)setDirection:(int)a3
{
  self->_direction = a3;
}

- (double)factor
{
  return self->_factor;
}

@end
