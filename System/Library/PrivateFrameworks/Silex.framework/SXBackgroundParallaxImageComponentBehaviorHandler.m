@implementation SXBackgroundParallaxImageComponentBehaviorHandler

- (SXBackgroundParallaxImageComponentBehaviorHandler)initWithComponentView:(id)a3 withBehavior:(id)a4
{
  SXBackgroundParallaxImageComponentBehaviorHandler *v4;
  SXBackgroundParallaxImageComponentBehaviorHandler *v5;
  void *v6;
  double v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SXBackgroundParallaxImageComponentBehaviorHandler;
  v4 = -[SXComponentBehaviorHandler initWithComponentView:withBehavior:](&v9, sel_initWithComponentView_withBehavior_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[SXComponentBehaviorHandler behavior](v4, "behavior");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "amplitude");
    v5->_amplitude = v7;

    v5->_viewHierarchyIndex = 0x7FFFFFFFFFFFFFFFLL;
  }
  return v5;
}

- (void)setupWithBehaviorController:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SXBackgroundParallaxImageComponentBehaviorHandler;
  -[SXComponentBehaviorHandler setupWithBehaviorController:](&v4, sel_setupWithBehaviorController_, a3);
  -[SXBackgroundParallaxImageComponentBehaviorHandler setupWindowedScroll](self, "setupWindowedScroll");
}

- (void)updateWithBehaviorController:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)SXBackgroundParallaxImageComponentBehaviorHandler;
  -[SXComponentBehaviorHandler updateWithBehaviorController:](&v33, sel_updateWithBehaviorController_, v4);
  if (UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsReduceMotionEnabled())
  {
    -[SXBackgroundParallaxImageComponentBehaviorHandler windowedScrollContentView](self, "windowedScrollContentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "center");
    v7 = v6;
    -[SXBackgroundParallaxImageComponentBehaviorHandler originalYCenter](self, "originalYCenter");
    v9 = v8;
  }
  else
  {
    -[SXBackgroundParallaxImageComponentBehaviorHandler amplitude](self, "amplitude");
    v11 = v10;
    objc_msgSend(v4, "viewport");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dynamicBounds");

    objc_msgSend(v4, "viewport");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    v15 = v14;

    objc_msgSend(v4, "viewport");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXComponentBehaviorHandler componentView](self, "componentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "center");
    v19 = v18;
    v21 = v20;
    -[SXComponentBehaviorHandler componentView](self, "componentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "superview");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "convertPoint:fromView:", v23, v19, v21);
    v25 = v24;

    objc_msgSend(v4, "viewport");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "dynamicBounds");
    v28 = v25 - v27;

    v29 = v28 / v15 * 2.0 + -1.0;
    -[SXBackgroundParallaxImageComponentBehaviorHandler windowedScrollContentView](self, "windowedScrollContentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "center");
    v7 = v30;
    -[SXBackgroundParallaxImageComponentBehaviorHandler originalYCenter](self, "originalYCenter");
    v9 = v31 - v29 * v11;
  }
  -[SXBackgroundParallaxImageComponentBehaviorHandler windowedScrollContentView](self, "windowedScrollContentView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setCenter:", v7, v9);

}

- (void)setupWindowedScroll
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double x;
  double y;
  double width;
  double height;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  -[SXBackgroundParallaxImageComponentBehaviorHandler amplitude](self, "amplitude");
  v4 = v3;
  -[SXComponentBehaviorHandler behaviorView](self, "behaviorView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXBackgroundParallaxImageComponentBehaviorHandler setWindowedScrollContentView:](self, "setWindowedScrollContentView:", v5);

  -[SXBackgroundParallaxImageComponentBehaviorHandler clippingView](self, "clippingView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = objc_alloc_init(MEMORY[0x24BDF6F90]);
    -[SXBackgroundParallaxImageComponentBehaviorHandler setClippingView:](self, "setClippingView:", v7);

    -[SXBackgroundParallaxImageComponentBehaviorHandler clippingView](self, "clippingView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setClipsToBounds:", 1);

  }
  -[SXBackgroundParallaxImageComponentBehaviorHandler clippingView](self, "clippingView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXBackgroundParallaxImageComponentBehaviorHandler windowedScrollContentView](self, "windowedScrollContentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  objc_msgSend(v9, "setFrame:");

  -[SXBackgroundParallaxImageComponentBehaviorHandler windowedScrollContentView](self, "windowedScrollContentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v33 = CGRectInset(v32, -v4, -v4);
  x = v33.origin.x;
  y = v33.origin.y;
  width = v33.size.width;
  height = v33.size.height;
  -[SXBackgroundParallaxImageComponentBehaviorHandler windowedScrollContentView](self, "windowedScrollContentView");
  v16 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v16, "setFrame:", x, y, width, height);

  -[SXBackgroundParallaxImageComponentBehaviorHandler windowedScrollContentView](self, "windowedScrollContentView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  LOBYTE(v16) = objc_opt_isKindOfClass();

  if ((v16 & 1) != 0)
  {
    -[SXBackgroundParallaxImageComponentBehaviorHandler windowedScrollContentView](self, "windowedScrollContentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXBackgroundParallaxImageComponentBehaviorHandler windowedScrollContentView](self, "windowedScrollContentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "frame");
    objc_msgSend(v18, "fillFrameWithBoundingSize:", v20, v21);
    objc_msgSend(v18, "setContentFrame:");

  }
  -[SXBackgroundParallaxImageComponentBehaviorHandler windowedScrollContentView](self, "windowedScrollContentView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "frame");
  -[SXBackgroundParallaxImageComponentBehaviorHandler setOriginalYCenter:](self, "setOriginalYCenter:", CGRectGetMidY(v34));

  -[SXBackgroundParallaxImageComponentBehaviorHandler windowedScrollContentView](self, "windowedScrollContentView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "superview");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "subviews");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXBackgroundParallaxImageComponentBehaviorHandler windowedScrollContentView](self, "windowedScrollContentView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXBackgroundParallaxImageComponentBehaviorHandler setViewHierarchyIndex:](self, "setViewHierarchyIndex:", objc_msgSend(v25, "indexOfObject:", v26));

  -[SXBackgroundParallaxImageComponentBehaviorHandler windowedScrollContentView](self, "windowedScrollContentView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "superview");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXBackgroundParallaxImageComponentBehaviorHandler clippingView](self, "clippingView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "insertSubview:atIndex:", v29, -[SXBackgroundParallaxImageComponentBehaviorHandler viewHierarchyIndex](self, "viewHierarchyIndex"));

  -[SXBackgroundParallaxImageComponentBehaviorHandler clippingView](self, "clippingView");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  -[SXBackgroundParallaxImageComponentBehaviorHandler windowedScrollContentView](self, "windowedScrollContentView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addSubview:", v30);

}

- (void)destroyWindowedScroll
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;

  -[SXBackgroundParallaxImageComponentBehaviorHandler clippingView](self, "clippingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXBackgroundParallaxImageComponentBehaviorHandler windowedScrollContentView](self, "windowedScrollContentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "insertSubview:atIndex:", v5, -[SXBackgroundParallaxImageComponentBehaviorHandler viewHierarchyIndex](self, "viewHierarchyIndex"));

  -[SXComponentBehaviorHandler componentView](self, "componentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXBackgroundParallaxImageComponentBehaviorHandler windowedScrollContentView](self, "windowedScrollContentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentBehaviorHandler behavior](self, "behavior");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "originalFrameForContentView:behavior:", v7, v8);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[SXBackgroundParallaxImageComponentBehaviorHandler windowedScrollContentView](self, "windowedScrollContentView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFrame:", v10, v12, v14, v16);

  -[SXBackgroundParallaxImageComponentBehaviorHandler setWindowedScrollContentView:](self, "setWindowedScrollContentView:", 0);
  -[SXBackgroundParallaxImageComponentBehaviorHandler clippingView](self, "clippingView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeFromSuperview");

  -[SXBackgroundParallaxImageComponentBehaviorHandler setViewHierarchyIndex:](self, "setViewHierarchyIndex:", 0x7FFFFFFFFFFFFFFFLL);
}

- (void)destroyWithBehaviorController:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SXBackgroundParallaxImageComponentBehaviorHandler;
  -[SXComponentBehaviorHandler destroyWithBehaviorController:](&v4, sel_destroyWithBehaviorController_, a3);
  -[SXBackgroundParallaxImageComponentBehaviorHandler destroyWindowedScroll](self, "destroyWindowedScroll");
}

- (UIView)windowedScrollContentView
{
  return self->_windowedScrollContentView;
}

- (void)setWindowedScrollContentView:(id)a3
{
  objc_storeStrong((id *)&self->_windowedScrollContentView, a3);
}

- (double)originalYCenter
{
  return self->_originalYCenter;
}

- (void)setOriginalYCenter:(double)a3
{
  self->_originalYCenter = a3;
}

- (UIView)clippingView
{
  return self->_clippingView;
}

- (void)setClippingView:(id)a3
{
  objc_storeStrong((id *)&self->_clippingView, a3);
}

- (unint64_t)viewHierarchyIndex
{
  return self->_viewHierarchyIndex;
}

- (void)setViewHierarchyIndex:(unint64_t)a3
{
  self->_viewHierarchyIndex = a3;
}

- (double)amplitude
{
  return self->_amplitude;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clippingView, 0);
  objc_storeStrong((id *)&self->_windowedScrollContentView, 0);
}

@end
