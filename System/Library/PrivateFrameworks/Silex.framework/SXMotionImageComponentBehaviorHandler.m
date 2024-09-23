@implementation SXMotionImageComponentBehaviorHandler

- (SXMotionImageComponentBehaviorHandler)initWithComponentView:(id)a3 withBehavior:(id)a4
{
  SXMotionImageComponentBehaviorHandler *v4;
  SXMotionImageComponentBehaviorHandler *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SXMotionImageComponentBehaviorHandler;
  v4 = -[SXComponentBehaviorHandler initWithComponentView:withBehavior:](&v12, sel_initWithComponentView_withBehavior_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_viewHierarchyIndex = 0x7FFFFFFFFFFFFFFFLL;
    -[SXComponentBehaviorHandler behavior](v4, "behavior");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "amplitude");
    v5->_amplitude = v7;

    -[SXComponentBehaviorHandler behavior](v5, "behavior");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_windowed = objc_msgSend(v8, "windowed");

    -[SXComponentBehaviorHandler behavior](v5, "behavior");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_horizontal = objc_msgSend(v9, "horizontal");

    -[SXComponentBehaviorHandler behavior](v5, "behavior");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_vertical = objc_msgSend(v10, "vertical");

  }
  return v5;
}

- (void)setupWithBehaviorController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SXMotionImageComponentBehaviorHandler;
  v4 = a3;
  -[SXComponentBehaviorHandler setupWithBehaviorController:](&v7, sel_setupWithBehaviorController_, v4);
  -[SXMotionImageComponentBehaviorHandler setupMotionDetection](self, "setupMotionDetection", v7.receiver, v7.super_class);
  objc_msgSend(v4, "viewport");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXMotionImageComponentBehaviorHandler updateEdgeAntialiasingForViewport:](self, "updateEdgeAntialiasingForViewport:", v5);

  objc_msgSend(v4, "viewport");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addViewportChangeListener:forOptions:", self, 8);
}

- (void)destroyWithBehaviorController:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SXMotionImageComponentBehaviorHandler;
  v4 = a3;
  -[SXComponentBehaviorHandler destroyWithBehaviorController:](&v6, sel_destroyWithBehaviorController_, v4);
  -[SXMotionImageComponentBehaviorHandler destroyMotionDetection](self, "destroyMotionDetection", v6.receiver, v6.super_class);
  objc_msgSend(v4, "viewport");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "removeViewportChangeListener:forOptions:", self, 8);
}

- (void)setupMotionDetection
{
  void *v3;
  double v4;
  double v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double x;
  double y;
  double width;
  double height;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  CGRect v49;
  CGRect v50;

  -[SXComponentBehaviorHandler behaviorView](self, "behaviorView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXMotionImageComponentBehaviorHandler setMotionContentView:](self, "setMotionContentView:", v3);

  -[SXMotionImageComponentBehaviorHandler amplitude](self, "amplitude");
  v5 = v4;
  v6 = -[SXMotionImageComponentBehaviorHandler windowed](self, "windowed");
  if (-[SXMotionImageComponentBehaviorHandler windowed](self, "windowed"))
  {
    -[SXMotionImageComponentBehaviorHandler motionContentView](self, "motionContentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "superview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "subviews");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXMotionImageComponentBehaviorHandler motionContentView](self, "motionContentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXMotionImageComponentBehaviorHandler setViewHierarchyIndex:](self, "setViewHierarchyIndex:", objc_msgSend(v9, "indexOfObject:", v10));

    -[SXMotionImageComponentBehaviorHandler clippingView](self, "clippingView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v12 = objc_alloc_init(MEMORY[0x24BDF6F90]);
      -[SXMotionImageComponentBehaviorHandler setClippingView:](self, "setClippingView:", v12);

      -[SXMotionImageComponentBehaviorHandler clippingView](self, "clippingView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setClipsToBounds:", 1);

    }
    -[SXMotionImageComponentBehaviorHandler clippingView](self, "clippingView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXMotionImageComponentBehaviorHandler motionContentView](self, "motionContentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "frame");
    objc_msgSend(v14, "setFrame:");

    -[SXMotionImageComponentBehaviorHandler motionContentView](self, "motionContentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bounds");
    v50 = CGRectInset(v49, -v5, -v5);
    x = v50.origin.x;
    y = v50.origin.y;
    width = v50.size.width;
    height = v50.size.height;
    -[SXMotionImageComponentBehaviorHandler motionContentView](self, "motionContentView");
    v21 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v21, "setFrame:", x, y, width, height);

    -[SXMotionImageComponentBehaviorHandler motionContentView](self, "motionContentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    LOBYTE(v21) = objc_opt_isKindOfClass();

    if ((v21 & 1) != 0)
    {
      -[SXMotionImageComponentBehaviorHandler motionContentView](self, "motionContentView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXMotionImageComponentBehaviorHandler motionContentView](self, "motionContentView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "frame");
      objc_msgSend(v23, "fillFrameWithBoundingSize:", v25, v26);
      objc_msgSend(v23, "setContentFrame:");

    }
    -[SXMotionImageComponentBehaviorHandler motionContentView](self, "motionContentView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "superview");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXMotionImageComponentBehaviorHandler clippingView](self, "clippingView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "insertSubview:atIndex:", v29, -[SXMotionImageComponentBehaviorHandler viewHierarchyIndex](self, "viewHierarchyIndex"));

    -[SXMotionImageComponentBehaviorHandler clippingView](self, "clippingView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXMotionImageComponentBehaviorHandler motionContentView](self, "motionContentView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addSubview:", v31);

  }
  if (-[SXMotionImageComponentBehaviorHandler horizontal](self, "horizontal"))
  {
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6B00]), "initWithKeyPath:type:", CFSTR("center.x"), 0);
    -[SXMotionImageComponentBehaviorHandler setXMotionEffect:](self, "setXMotionEffect:", v32);

    if (v6)
      v33 = v5;
    else
      v33 = -v5;
    if (v6)
      v34 = -v5;
    else
      v34 = v5;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXMotionImageComponentBehaviorHandler xMotionEffect](self, "xMotionEffect");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setMinimumRelativeValue:", v35);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v34);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXMotionImageComponentBehaviorHandler xMotionEffect](self, "xMotionEffect");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setMaximumRelativeValue:", v37);

    -[SXMotionImageComponentBehaviorHandler motionContentView](self, "motionContentView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXMotionImageComponentBehaviorHandler xMotionEffect](self, "xMotionEffect");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addMotionEffect:", v40);

  }
  if (-[SXMotionImageComponentBehaviorHandler vertical](self, "vertical"))
  {
    v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6B00]), "initWithKeyPath:type:", CFSTR("center.y"), 1);
    -[SXMotionImageComponentBehaviorHandler setYMotionEffect:](self, "setYMotionEffect:", v41);

    if (v6)
      v42 = v5;
    else
      v42 = -v5;
    if (v6)
      v5 = -v5;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXMotionImageComponentBehaviorHandler yMotionEffect](self, "yMotionEffect");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setMinimumRelativeValue:", v43);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v5);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXMotionImageComponentBehaviorHandler yMotionEffect](self, "yMotionEffect");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setMaximumRelativeValue:", v45);

    -[SXMotionImageComponentBehaviorHandler motionContentView](self, "motionContentView");
    v48 = (id)objc_claimAutoreleasedReturnValue();
    -[SXMotionImageComponentBehaviorHandler yMotionEffect](self, "yMotionEffect");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "addMotionEffect:", v47);

  }
}

- (void)destroyMotionDetection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;

  -[SXMotionImageComponentBehaviorHandler xMotionEffect](self, "xMotionEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SXMotionImageComponentBehaviorHandler motionContentView](self, "motionContentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXMotionImageComponentBehaviorHandler xMotionEffect](self, "xMotionEffect");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeMotionEffect:", v5);

    -[SXMotionImageComponentBehaviorHandler setXMotionEffect:](self, "setXMotionEffect:", 0);
  }
  -[SXMotionImageComponentBehaviorHandler yMotionEffect](self, "yMotionEffect");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SXMotionImageComponentBehaviorHandler motionContentView](self, "motionContentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXMotionImageComponentBehaviorHandler yMotionEffect](self, "yMotionEffect");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeMotionEffect:", v8);

    -[SXMotionImageComponentBehaviorHandler setYMotionEffect:](self, "setYMotionEffect:", 0);
  }
  -[SXMotionImageComponentBehaviorHandler clippingView](self, "clippingView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[SXMotionImageComponentBehaviorHandler clippingView](self, "clippingView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "superview");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXMotionImageComponentBehaviorHandler motionContentView](self, "motionContentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "insertSubview:atIndex:", v12, -[SXMotionImageComponentBehaviorHandler viewHierarchyIndex](self, "viewHierarchyIndex"));

    -[SXMotionImageComponentBehaviorHandler clippingView](self, "clippingView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeFromSuperview");

    -[SXMotionImageComponentBehaviorHandler setViewHierarchyIndex:](self, "setViewHierarchyIndex:", 0x7FFFFFFFFFFFFFFFLL);
  }
  -[SXComponentBehaviorHandler componentView](self, "componentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXMotionImageComponentBehaviorHandler motionContentView](self, "motionContentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentBehaviorHandler behavior](self, "behavior");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "originalFrameForContentView:behavior:", v15, v16);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  -[SXMotionImageComponentBehaviorHandler motionContentView](self, "motionContentView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFrame:", v18, v20, v22, v24);

  -[SXMotionImageComponentBehaviorHandler setMotionContentView:](self, "setMotionContentView:", 0);
}

- (void)updateEdgeAntialiasingForViewport:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v4 = objc_msgSend(a3, "appearState");
  -[SXMotionImageComponentBehaviorHandler clippingView](self, "clippingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4 == 2)
  {
    objc_msgSend(v6, "setAllowsEdgeAntialiasing:", 1);

    -[SXMotionImageComponentBehaviorHandler motionContentView](self, "motionContentView");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = 1;
  }
  else
  {
    objc_msgSend(v6, "setAllowsEdgeAntialiasing:", 0);

    -[SXMotionImageComponentBehaviorHandler motionContentView](self, "motionContentView");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = 0;
  }
  objc_msgSend(v8, "setAllowsEdgeAntialiasing:", v10);

}

- (UIView)clippingView
{
  return self->_clippingView;
}

- (void)setClippingView:(id)a3
{
  objc_storeStrong((id *)&self->_clippingView, a3);
}

- (UIView)motionContentView
{
  return self->_motionContentView;
}

- (void)setMotionContentView:(id)a3
{
  objc_storeStrong((id *)&self->_motionContentView, a3);
}

- (unint64_t)viewHierarchyIndex
{
  return self->_viewHierarchyIndex;
}

- (void)setViewHierarchyIndex:(unint64_t)a3
{
  self->_viewHierarchyIndex = a3;
}

- (UIInterpolatingMotionEffect)xMotionEffect
{
  return self->_xMotionEffect;
}

- (void)setXMotionEffect:(id)a3
{
  objc_storeStrong((id *)&self->_xMotionEffect, a3);
}

- (UIInterpolatingMotionEffect)yMotionEffect
{
  return self->_yMotionEffect;
}

- (void)setYMotionEffect:(id)a3
{
  objc_storeStrong((id *)&self->_yMotionEffect, a3);
}

- (double)amplitude
{
  return self->_amplitude;
}

- (void)setAmplitude:(double)a3
{
  self->_amplitude = a3;
}

- (BOOL)windowed
{
  return self->_windowed;
}

- (void)setWindowed:(BOOL)a3
{
  self->_windowed = a3;
}

- (BOOL)horizontal
{
  return self->_horizontal;
}

- (void)setHorizontal:(BOOL)a3
{
  self->_horizontal = a3;
}

- (BOOL)vertical
{
  return self->_vertical;
}

- (void)setVertical:(BOOL)a3
{
  self->_vertical = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_yMotionEffect, 0);
  objc_storeStrong((id *)&self->_xMotionEffect, 0);
  objc_storeStrong((id *)&self->_motionContentView, 0);
  objc_storeStrong((id *)&self->_clippingView, 0);
}

@end
