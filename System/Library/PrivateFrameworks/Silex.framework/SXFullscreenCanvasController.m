@implementation SXFullscreenCanvasController

- (SXFullscreenCanvasController)initWithShowable:(id)a3 captionViewFactory:(id)a4 sharingPolicy:(unint64_t)a5
{
  id v8;
  id v9;
  SXFullscreenCanvasController *v10;
  SXFullscreenCanvasController *v11;
  UIView *v12;
  UIView *backgroundView;
  void *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SXFullscreenCanvasController;
  v10 = -[SXFullscreenCanvasController init](&v16, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_sharingPolicy = a5;
    objc_storeStrong((id *)&v10->_captionViewFactory, a4);
    objc_storeWeak((id *)&v11->_showable, v8);
    v12 = (UIView *)objc_alloc_init(MEMORY[0x24BDF6F90]);
    backgroundView = v11->_backgroundView;
    v11->_backgroundView = v12;

    -[UIView setAutoresizingMask:](v11->_backgroundView, "setAutoresizingMask:", 18);
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v11->_backgroundView, "setBackgroundColor:", v14);

    -[SXFullscreenCanvasController setup](v11, "setup");
  }

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[SXFullscreenCanvasController stopSupressingColorSettings](self, "stopSupressingColorSettings");
  v3.receiver = self;
  v3.super_class = (Class)SXFullscreenCanvasController;
  -[SXFullscreenCanvasController dealloc](&v3, sel_dealloc);
}

- (void)dismiss
{
  void *v3;
  _QWORD v4[5];

  -[SXFullscreenCanvasController itemizedScrollView](self, "itemizedScrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->_currentViewIndex = objc_msgSend(v3, "activeViewIndex");

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __39__SXFullscreenCanvasController_dismiss__block_invoke;
  v4[3] = &unk_24D689490;
  v4[4] = self;
  -[SXFullscreenCanvasController willStartTransformingWithGestureRecognizer:completionBlock:](self, "willStartTransformingWithGestureRecognizer:completionBlock:", 0, v4);
}

void __39__SXFullscreenCanvasController_dismiss__block_invoke(uint64_t a1, int a2)
{
  _QWORD block[5];

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "startTransitionToFullScreen:controllable:", 1, 0);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __39__SXFullscreenCanvasController_dismiss__block_invoke_2;
    block[3] = &unk_24D6874A8;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

uint64_t __39__SXFullscreenCanvasController_dismiss__block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __39__SXFullscreenCanvasController_dismiss__block_invoke_3;
  v3[3] = &unk_24D6874A8;
  v3[4] = v1;
  return objc_msgSend(v1, "goToOriginalFromFullScreenAnimated:completionBlock:", 1, v3);
}

uint64_t __39__SXFullscreenCanvasController_dismiss__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didEndTransitionFromFullScreen:toFullScreen:", 1, 0);
}

- (void)setupScrollViewIfNeededWithActiveIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  SXItemizedScrollView *v7;
  SXItemizedScrollView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  void *v22;
  CGFloat v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  CGRect v31;
  CGRect v32;

  -[SXFullscreenCanvasController itemizedScrollView](self, "itemizedScrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", self, sel_handleTap_);
    -[SXFullscreenCanvasController setTapGestureRecognizer:](self, "setTapGestureRecognizer:", v6);

    v7 = [SXItemizedScrollView alloc];
    v8 = -[SXItemizedScrollView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    -[SXFullscreenCanvasController setItemizedScrollView:](self, "setItemizedScrollView:", v8);

    -[SXFullscreenCanvasController itemizedScrollView](self, "itemizedScrollView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setContentInsetAdjustmentBehavior:", 2);

    -[SXFullscreenCanvasController itemizedScrollView](self, "itemizedScrollView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDataSource:", self);

    -[SXFullscreenCanvasController itemizedScrollView](self, "itemizedScrollView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDelegate:", self);

    -[SXFullscreenCanvasController canvasViewController](self, "canvasViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;

    -[SXFullscreenCanvasController itemizedScrollView](self, "itemizedScrollView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v31.origin.x = v15;
    v31.origin.y = v17;
    v31.size.width = v19;
    v31.size.height = v21;
    v23 = CGRectGetWidth(v31) + 20.0;
    v32.origin.x = v15;
    v32.origin.y = v17;
    v32.size.width = v19;
    v32.size.height = v21;
    objc_msgSend(v22, "setFrame:", -10.0, 0.0, v23, CGRectGetHeight(v32));

    -[SXFullscreenCanvasController itemizedScrollView](self, "itemizedScrollView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setActiveViewIndex:animated:", a3, 0);

    -[SXFullscreenCanvasController canvasViewController](self, "canvasViewController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXFullscreenCanvasController itemizedScrollView](self, "itemizedScrollView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addSubview:", v27);

    -[SXFullscreenCanvasController canvasViewController](self, "canvasViewController");
    v30 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "view");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXFullscreenCanvasController tapGestureRecognizer](self, "tapGestureRecognizer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addGestureRecognizer:", v29);

  }
}

- (void)didFinishFullscreenActiveIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[SXFullscreenCanvasController setupScrollViewIfNeededWithActiveIndex:](self, "setupScrollViewIfNeededWithActiveIndex:");
  -[SXFullscreenCanvasController itemizedScrollView](self, "itemizedScrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeView");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "scrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXFullscreenCanvasController transferGestureViewToView:](self, "transferGestureViewToView:", v6);

  -[SXFullscreenCanvasController captionView](self, "captionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[SXFullscreenCanvasController captionView](self, "captionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXFullscreenCanvasController changeCaptionViewForViewWithIndex:expanded:animated:](self, "changeCaptionViewForViewWithIndex:expanded:animated:", a3, objc_msgSend(v8, "expanded"), 1);

  }
  else
  {
    -[SXFullscreenCanvasController changeCaptionViewForViewWithIndex:expanded:animated:](self, "changeCaptionViewForViewWithIndex:expanded:animated:", a3, 1, 1);
  }

}

- (void)changeCaptionViewForViewWithIndex:(unint64_t)a3 expanded:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  SXFullscreenCaptionView *v15;
  SXFullscreenCaptionView *captionView;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  SXFullscreenNavigationBarView *v23;
  SXFullscreenNavigationBarView *navigationBarView;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  uint64_t previousExpansionMode;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  id v37;

  v5 = a5;
  v6 = a4;
  -[SXFullscreenCanvasController showable](self, "showable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXFullscreenCanvasController showable](self, "showable");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fullScreenCanvasController:captionForShowable:viewIndex:", self, v10, a3);
  v37 = (id)objc_claimAutoreleasedReturnValue();

  -[SXFullscreenCanvasController captionView](self, "captionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    -[SXFullscreenCanvasController captionViewFactory](self, "captionViewFactory");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "createCaptionView");
    v15 = (SXFullscreenCaptionView *)objc_claimAutoreleasedReturnValue();
    captionView = self->_captionView;
    self->_captionView = v15;

    -[SXFullscreenCanvasController captionView](self, "captionView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setDelegate:", self);

    -[SXFullscreenCanvasController canvasViewController](self, "canvasViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXFullscreenCanvasController captionView](self, "captionView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSubview:", v20);

    self->_previousExpansionMode = 1;
    goto LABEL_5;
  }
  -[SXFullscreenCanvasController captionView](self, "captionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "viewIndex");

  if (v13 != a3)
  {
LABEL_5:
    -[SXFullscreenCanvasController captionView](self, "captionView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "updateWithCaption:forViewIndex:animated:", v37, a3, v5);

  }
  -[SXFullscreenCanvasController navigationBarView](self, "navigationBarView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
  {
    v23 = objc_alloc_init(SXFullscreenNavigationBarView);
    navigationBarView = self->_navigationBarView;
    self->_navigationBarView = v23;

    -[SXFullscreenCanvasController navigationBarView](self, "navigationBarView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setDelegate:", self);

    -[SXFullscreenCanvasController canvasViewController](self, "canvasViewController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXFullscreenCanvasController navigationBarView](self, "navigationBarView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addSubview:", v28);

  }
  -[SXFullscreenCanvasController captionView](self, "captionView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "expanded");

  if (v30 != v6)
  {
    if (!v6 || (previousExpansionMode = self->_previousExpansionMode, !(_DWORD)previousExpansionMode))
    {
      -[SXFullscreenCanvasController captionView](self, "captionView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      self->_previousExpansionMode = objc_msgSend(v32, "expansionMode");

      previousExpansionMode = 0;
    }
    -[SXFullscreenCanvasController captionView](self, "captionView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setExpansionMode:animated:", previousExpansionMode, v5);

  }
  -[SXFullscreenCanvasController navigationBarView](self, "navigationBarView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "expanded");

  if (v35 != v6)
  {
    -[SXFullscreenCanvasController navigationBarView](self, "navigationBarView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setExpanded:animated:", v6, v5);

  }
}

- (void)transformViewToSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  double v37;
  void *v38;
  id v39;
  CGRect v40;
  CGRect v41;

  height = a3.height;
  width = a3.width;
  if (-[SXFullscreenCanvasController isFullscreen](self, "isFullscreen"))
  {
    -[SXFullscreenCanvasController canvasViewController](self, "canvasViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    v9 = v8;
    v11 = v10;

    -[SXFullscreenCanvasController canvasViewController](self, "canvasViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFrame:", v9, v11, width, height);

    -[SXFullscreenCanvasController itemizedScrollView](self, "itemizedScrollView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFrame:", -10.0, 0.0, width + 20.0, height);

    -[SXFullscreenCanvasController showable](self, "showable");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXFullscreenCanvasController showable](self, "showable");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXFullscreenCanvasController itemizedScrollView](self, "itemizedScrollView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "activeViewIndex");
    -[SXFullscreenCanvasController canvasViewController](self, "canvasViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bounds");
    objc_msgSend(v15, "fullScreenCanvasController:fullScreenFrameForShowable:viewIndex:withinRect:", self, v16, v18);
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;

    -[SXFullscreenCanvasController itemizedScrollView](self, "itemizedScrollView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "activeView");
    v39 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v39, "setContentViewFrame:", v22, v24, v26, v28);
    -[SXFullscreenCanvasController captionView](self, "captionView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "updateFrameAnimated:", 0);

    -[SXFullscreenCanvasController navigationBarView](self, "navigationBarView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "updateFrameAnimated:", 0);

    -[SXFullscreenCanvasController gestureView](self, "gestureView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "superview");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "bounds");
    v34 = CGRectGetWidth(v40);
    -[SXFullscreenCanvasController gestureView](self, "gestureView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "superview");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "bounds");
    v37 = CGRectGetHeight(v41);
    -[SXFullscreenCanvasController gestureView](self, "gestureView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setFrame:", 0.0, 0.0, v34, v37);

  }
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SXFullscreenCanvasController backgroundView](self, "backgroundView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

}

- (UIColor)backgroundColor
{
  void *v2;
  void *v3;

  -[SXFullscreenCanvasController backgroundView](self, "backgroundView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (unint64_t)activeViewIndex
{
  void *v3;
  void *v4;
  unint64_t v5;

  if (!-[SXFullscreenCanvasController isFullscreen](self, "isFullscreen"))
    return 0x7FFFFFFFFFFFFFFFLL;
  -[SXFullscreenCanvasController itemizedScrollView](self, "itemizedScrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return -[SXFullscreenCanvasController currentViewIndex](self, "currentViewIndex");
  -[SXFullscreenCanvasController itemizedScrollView](self, "itemizedScrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "activeViewIndex");

  return v5;
}

- (BOOL)otherInteractivityGestureShouldBegin:(id)a3
{
  return 0;
}

- (void)setup
{
  id v3;
  UIView *v4;
  UIView *gestureView;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = objc_alloc(MEMORY[0x24BDF6F90]);
  v4 = (UIView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  gestureView = self->_gestureView;
  self->_gestureView = v4;

  -[SXFullscreenCanvasController gestureView](self, "gestureView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAutoresizingMask:", 18);

  -[SXFullscreenCanvasController gestureView](self, "gestureView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXFullscreenCanvasController setupGestureRecognizersInView:](self, "setupGestureRecognizersInView:", v7);

  -[SXFullscreenCanvasController showable](self, "showable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXFullscreenCanvasController gestureView](self, "gestureView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXFullscreenCanvasController showable](self, "showable");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fullScreenCanvasController:shouldAddGestureView:forShowable:", self, v9, v10);

  -[SXFullscreenCanvasController gestureView](self, "gestureView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "superview");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setUserInteractionEnabled:", 1);

}

- (void)setupGestureRecognizersInView:(id)a3
{
  id v4;
  UITapGestureRecognizer *v5;
  UITapGestureRecognizer *openTapGestureRecognizer;
  void *v7;
  void *v8;
  UIPinchGestureRecognizer *v9;
  UIPinchGestureRecognizer *pinchGestureRecognizer;
  void *v11;
  void *v12;
  UIRotationGestureRecognizer *v13;
  UIRotationGestureRecognizer *rotationGestureRecognizer;
  void *v15;
  void *v16;
  UIPanGestureRecognizer *v17;
  UIPanGestureRecognizer *panGestureRecognizer;
  void *v19;
  void *v20;
  SXDragManager *v21;

  v4 = a3;
  v21 = -[SXDragManager initWithSharingPolicy:dataSource:]([SXDragManager alloc], "initWithSharingPolicy:dataSource:", -[SXFullscreenCanvasController sharingPolicy](self, "sharingPolicy"), self);
  -[SXDragManager setEnabled:](v21, "setEnabled:", 0);
  -[SXFullscreenCanvasController setDragManager:](self, "setDragManager:", v21);
  v5 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", self, sel_handleOpenTapGesture_);
  openTapGestureRecognizer = self->_openTapGestureRecognizer;
  self->_openTapGestureRecognizer = v5;

  -[SXFullscreenCanvasController openTapGestureRecognizer](self, "openTapGestureRecognizer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", self);

  -[SXFullscreenCanvasController openTapGestureRecognizer](self, "openTapGestureRecognizer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addGestureRecognizer:", v8);

  v9 = (UIPinchGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6C60]), "initWithTarget:action:", self, sel_handlePinchGestureRecognizer_);
  pinchGestureRecognizer = self->_pinchGestureRecognizer;
  self->_pinchGestureRecognizer = v9;

  -[SXFullscreenCanvasController pinchGestureRecognizer](self, "pinchGestureRecognizer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDelegate:", self);

  -[SXFullscreenCanvasController pinchGestureRecognizer](self, "pinchGestureRecognizer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addGestureRecognizer:", v12);

  v13 = (UIRotationGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6D18]), "initWithTarget:action:", self, sel_handleRotationGestureRecognizer_);
  rotationGestureRecognizer = self->_rotationGestureRecognizer;
  self->_rotationGestureRecognizer = v13;

  -[SXFullscreenCanvasController rotationGestureRecognizer](self, "rotationGestureRecognizer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDelegate:", self);

  -[SXFullscreenCanvasController rotationGestureRecognizer](self, "rotationGestureRecognizer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addGestureRecognizer:", v16);

  v17 = (UIPanGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6C38]), "initWithTarget:action:", self, sel_handlePanGestureRecognizer_);
  panGestureRecognizer = self->_panGestureRecognizer;
  self->_panGestureRecognizer = v17;

  -[SXFullscreenCanvasController panGestureRecognizer](self, "panGestureRecognizer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setDelegate:", self);

  -[SXFullscreenCanvasController panGestureRecognizer](self, "panGestureRecognizer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addGestureRecognizer:", v20);

}

- (CGSize)fitSizeForRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGSize result;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SXFullscreenCanvasController canvasViewController](self, "canvasViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v24 = v11;
  v25 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v27.origin.x = v10;
  v27.origin.y = v12;
  v27.size.width = v14;
  v27.size.height = v16;
  v17 = CGRectGetWidth(v27);
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  v18 = v17 / CGRectGetWidth(v28);
  v29.origin.x = x;
  v29.origin.y = y;
  v23 = height;
  v29.size.width = width;
  v29.size.height = height;
  v19 = v18 * CGRectGetHeight(v29);
  v30.origin.x = v25;
  v30.origin.y = v24;
  v30.size.width = v14;
  v30.size.height = v16;
  if (v19 > CGRectGetHeight(v30))
  {
    v31.origin.x = v25;
    v31.origin.y = v24;
    v31.size.width = v14;
    v31.size.height = v16;
    v19 = CGRectGetHeight(v31);
    v32.origin.x = x;
    v32.origin.y = y;
    v32.size.width = width;
    v32.size.height = v23;
    v20 = v19 / CGRectGetHeight(v32);
    v33.origin.x = x;
    v33.origin.y = y;
    v33.size.width = width;
    v33.size.height = v23;
    v17 = v20 * CGRectGetWidth(v33);
  }
  v21 = v17;
  v22 = v19;
  result.height = v22;
  result.width = v21;
  return result;
}

- (void)handleGestureRecognizer:(id)a3
{
  id v4;
  unint64_t totalActiveGestureRecognizers;
  unint64_t v6;
  uint64_t v7;
  _QWORD v8[5];

  v4 = a3;
  totalActiveGestureRecognizers = self->_totalActiveGestureRecognizers;
  if (objc_msgSend(v4, "state") == 1)
    ++self->_totalActiveGestureRecognizers;
  if (objc_msgSend(v4, "state") == 4 || objc_msgSend(v4, "state") == 3 || objc_msgSend(v4, "state") == 5)
    --self->_totalActiveGestureRecognizers;
  if (-[SXFullscreenCanvasController verticalSwipingIsActive](self, "verticalSwipingIsActive")
    && !-[SXFullscreenCanvasController isStoppingVerticalSwiping](self, "isStoppingVerticalSwiping"))
  {
    if (!-[SXFullscreenCanvasController panIsActive](self, "panIsActive"))
      goto LABEL_23;
    goto LABEL_22;
  }
  if (totalActiveGestureRecognizers != 1)
  {
    if (totalActiveGestureRecognizers)
    {
      v6 = self->_totalActiveGestureRecognizers;
    }
    else
    {
      v6 = self->_totalActiveGestureRecognizers;
      if (v6 == 1)
      {
        *(_OWORD *)&self->_currentRotation = xmmword_21713C600;
        v7 = MEMORY[0x24BDAC760];
        self->_currentTranslation = (CGPoint)*MEMORY[0x24BDBEFB0];
        v8[0] = v7;
        v8[1] = 3221225472;
        v8[2] = __56__SXFullscreenCanvasController_handleGestureRecognizer___block_invoke;
        v8[3] = &unk_24D689490;
        v8[4] = self;
        -[SXFullscreenCanvasController willStartTransformingWithGestureRecognizer:completionBlock:](self, "willStartTransformingWithGestureRecognizer:completionBlock:", v4, v8);
        goto LABEL_23;
      }
    }
    if (!v6)
      goto LABEL_23;
    goto LABEL_21;
  }
  if (self->_totalActiveGestureRecognizers)
  {
LABEL_21:
    if (objc_msgSend(v4, "state") != 2)
      goto LABEL_23;
LABEL_22:
    -[SXFullscreenCanvasController updateTransform](self, "updateTransform");
    goto LABEL_23;
  }
  if (!-[SXFullscreenCanvasController isStoppingVerticalSwiping](self, "isStoppingVerticalSwiping"))
  {
    -[SXFullscreenCanvasController stopTransformingCancelled:](self, "stopTransformingCancelled:", objc_msgSend(v4, "state") == 4);
    -[SXFullscreenCanvasController setLessTouchesAreInterupting:](self, "setLessTouchesAreInterupting:", 0);
    -[SXFullscreenCanvasController setOrientationChangeIsInterupting:](self, "setOrientationChangeIsInterupting:", 0);
  }
  *(_WORD *)&self->_verticalSwipingIsActive = 0;
LABEL_23:

}

void __56__SXFullscreenCanvasController_handleGestureRecognizer___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  id v5;

  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "startTransitionToFullScreen:controllable:", objc_msgSend(*(id *)(a1 + 32), "isFullscreen") ^ 1, 1);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "pinchGestureRecognizer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancel");

    objc_msgSend(*(id *)(a1 + 32), "panGestureRecognizer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancel");

    objc_msgSend(*(id *)(a1 + 32), "rotationGestureRecognizer");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cancel");

  }
}

- (void)handlePanGestureRecognizer:(id)a3
{
  void *v4;
  void *v5;
  CGFloat v6;
  CGFloat v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  uint64_t v19;
  id v20;

  v20 = a3;
  if (objc_msgSend(v20, "state") == 1)
  {
    self->_panIsActive = 1;
    self->_currentTranslation = (CGPoint)*MEMORY[0x24BDBEFB0];
    if (-[SXFullscreenCanvasController isFullscreen](self, "isFullscreen"))
    {
      if (objc_msgSend(v20, "numberOfTouches") == 1
        && !-[SXFullscreenCanvasController pinchIsActive](self, "pinchIsActive")
        && !-[SXFullscreenCanvasController rotationIsActive](self, "rotationIsActive"))
      {
        self->_verticalSwipingIsActive = 1;
        -[SXFullscreenCanvasController startVerticalSwiping](self, "startVerticalSwiping");
      }
    }
  }
  if (objc_msgSend(v20, "state") != 2)
    goto LABEL_37;
  if (-[SXFullscreenCanvasController pinchIsActive](self, "pinchIsActive")
    || -[SXFullscreenCanvasController isFullscreen](self, "isFullscreen"))
  {
    -[SXFullscreenCanvasController canvasViewController](self, "canvasViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "translationInView:", v5);
    self->_currentTranslation.x = v6;
    self->_currentTranslation.y = v7;

    if (-[SXFullscreenCanvasController isFullscreen](self, "isFullscreen"))
    {
      if (-[SXFullscreenCanvasController verticalSwipingIsActive](self, "verticalSwipingIsActive"))
        self->_currentTranslation.x = 0.0;
    }
  }
  if (objc_msgSend(v20, "numberOfTouches") != 1
    || -[SXFullscreenCanvasController verticalSwipingIsActive](self, "verticalSwipingIsActive"))
  {
LABEL_37:
    if (objc_msgSend(v20, "state") != 4 && objc_msgSend(v20, "state") != 3 && objc_msgSend(v20, "state") != 5)
      goto LABEL_33;
    self->_panIsActive = 0;
    if (!-[SXFullscreenCanvasController isFullscreen](self, "isFullscreen")
      || !-[SXFullscreenCanvasController verticalSwipingIsActive](self, "verticalSwipingIsActive"))
    {
      goto LABEL_33;
    }
    self->_isStoppingVerticalSwiping = 1;
    objc_msgSend(v20, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "velocityInView:", v8);
    v10 = v9;
    v12 = v11;

    -[SXFullscreenCanvasController currentTranslation](self, "currentTranslation");
    if (v13 >= 0.0)
      v14 = v13;
    else
      v14 = -v13;
    -[SXFullscreenCanvasController canvasViewController](self, "canvasViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bounds");
    if (v14 / v17 <= 0.25)
    {
      if (v12 >= 0.0)
        v18 = v12;
      else
        v18 = -v12;

      if (v18 <= 10.0)
      {
        v19 = 0;
        goto LABEL_32;
      }
    }
    else
    {

    }
    v19 = 1;
LABEL_32:
    -[SXFullscreenCanvasController stopVerticalSwipingDismissed:lastVelocity:](self, "stopVerticalSwipingDismissed:lastVelocity:", v19, v10, v12);
LABEL_33:
    -[SXFullscreenCanvasController handleGestureRecognizer:](self, "handleGestureRecognizer:", v20);
    goto LABEL_34;
  }
  -[SXFullscreenCanvasController setLessTouchesAreInterupting:](self, "setLessTouchesAreInterupting:", 1);
  objc_msgSend(v20, "cancel");
LABEL_34:

}

- (void)handleRotationGestureRecognizer:(id)a3
{
  double v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "state") == 1)
  {
    self->_rotationIsActive = 1;
    self->_currentRotation = 0.0;
  }
  if (objc_msgSend(v5, "state") != 2)
    goto LABEL_10;
  if (-[SXFullscreenCanvasController pinchIsActive](self, "pinchIsActive"))
  {
    objc_msgSend(v5, "rotation");
    self->_currentRotation = v4;
  }
  if (objc_msgSend(v5, "numberOfTouches") == 1)
  {
    -[SXFullscreenCanvasController setLessTouchesAreInterupting:](self, "setLessTouchesAreInterupting:", 1);
    objc_msgSend(v5, "cancel");
  }
  else
  {
LABEL_10:
    if (objc_msgSend(v5, "state") == 4 || objc_msgSend(v5, "state") == 3 || objc_msgSend(v5, "state") == 5)
      self->_rotationIsActive = 0;
    -[SXFullscreenCanvasController handleGestureRecognizer:](self, "handleGestureRecognizer:", v5);
  }

}

- (void)handleOpenTapGesture:(id)a3
{
  id v4;
  void *v5;
  char v6;
  uint64_t v12;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  -[SXFullscreenCanvasController showable](self, "showable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "requestInteractivityFocusForFullScreenCanvasController:", self);

  if ((v6 & 1) != 0)
  {
    if (objc_msgSend(v4, "state") != 4 && objc_msgSend(v4, "state") != 5 && objc_msgSend(v4, "state") == 3)
    {
      __asm { FMOV            V0.2D, #0.5 }
      self->_startingAnchorPoint = _Q0;
      *(_OWORD *)&self->_currentRotation = xmmword_21713C600;
      v12 = MEMORY[0x24BDAC760];
      self->_currentTranslation = (CGPoint)*MEMORY[0x24BDBEFB0];
      v13[0] = v12;
      v13[1] = 3221225472;
      v13[2] = __53__SXFullscreenCanvasController_handleOpenTapGesture___block_invoke;
      v13[3] = &unk_24D68AA00;
      v13[4] = self;
      v14 = v4;
      -[SXFullscreenCanvasController willStartTransformingWithGestureRecognizer:completionBlock:](self, "willStartTransformingWithGestureRecognizer:completionBlock:", v14, v13);

    }
  }
  else
  {
    objc_msgSend(v4, "cancel");
  }

}

uint64_t __53__SXFullscreenCanvasController_handleOpenTapGesture___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  _QWORD v5[5];

  if (!a2)
    return objc_msgSend(*(id *)(a1 + 40), "cancel");
  objc_msgSend(*(id *)(a1 + 32), "startTransitionToFullScreen:controllable:", 1, 0);
  v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __53__SXFullscreenCanvasController_handleOpenTapGesture___block_invoke_2;
  v5[3] = &unk_24D6874A8;
  v5[4] = v3;
  return objc_msgSend(v3, "goToFullScreenFromOriginalAnimated:completionBlock:", 1, v5);
}

uint64_t __53__SXFullscreenCanvasController_handleOpenTapGesture___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didEndTransitionFromFullScreen:toFullScreen:", 0, 1);
}

- (void)presentFullscreenWithIndex:(unint64_t)a3
{
  _QWORD v4[5];

  self->_currentScale = 1.0;
  -[SXFullscreenCanvasController setCurrentViewIndex:](self, "setCurrentViewIndex:", a3);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __59__SXFullscreenCanvasController_presentFullscreenWithIndex___block_invoke;
  v4[3] = &unk_24D689490;
  v4[4] = self;
  -[SXFullscreenCanvasController willStartTransformingWithGestureRecognizer:completionBlock:](self, "willStartTransformingWithGestureRecognizer:completionBlock:", 0, v4);
}

uint64_t __59__SXFullscreenCanvasController_presentFullscreenWithIndex___block_invoke(uint64_t result, int a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[5];

  if (a2)
  {
    v2 = result;
    objc_msgSend(*(id *)(result + 32), "backgroundView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAlpha:", 1.0);

    v4 = *(void **)(v2 + 32);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __59__SXFullscreenCanvasController_presentFullscreenWithIndex___block_invoke_2;
    v5[3] = &unk_24D6874A8;
    v5[4] = v4;
    return objc_msgSend(v4, "goToFullScreenFromOriginalAnimated:completionBlock:", 0, v5);
  }
  return result;
}

uint64_t __59__SXFullscreenCanvasController_presentFullscreenWithIndex___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didEndTransitionFromFullScreen:toFullScreen:", 0, 1);
}

- (void)handlePinchGestureRecognizer:(id)a3
{
  double v4;
  double *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  id v11;

  v11 = a3;
  if (objc_msgSend(v11, "state") == 1)
  {
    self->_pinchIsActive = 1;
    objc_msgSend(v11, "scale");
    self->_currentScale = v4;
    self->_currentRotation = 0.0;
    v5 = (double *)MEMORY[0x24BDBEFB0];
    self->_currentTranslation = (CGPoint)*MEMORY[0x24BDBEFB0];
    -[SXFullscreenCanvasController rotationGestureRecognizer](self, "rotationGestureRecognizer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRotation:", 0.0);

    -[SXFullscreenCanvasController panGestureRecognizer](self, "panGestureRecognizer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXFullscreenCanvasController panGestureRecognizer](self, "panGestureRecognizer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTranslation:inView:", v9, *v5, v5[1]);

  }
  if (objc_msgSend(v11, "state") == 2
    && (objc_msgSend(v11, "scale"), self->_currentScale = v10, objc_msgSend(v11, "numberOfTouches") == 1))
  {
    -[SXFullscreenCanvasController setLessTouchesAreInterupting:](self, "setLessTouchesAreInterupting:", 1);
    objc_msgSend(v11, "cancel");
  }
  else
  {
    if (objc_msgSend(v11, "state") == 4 || objc_msgSend(v11, "state") == 3 || objc_msgSend(v11, "state") == 5)
      self->_pinchIsActive = 0;
    -[SXFullscreenCanvasController handleGestureRecognizer:](self, "handleGestureRecognizer:", v11);
  }

}

- (void)willStartTransformingWithGestureRecognizer:(id)a3 completionBlock:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  unint64_t currentViewIndex;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  UIView *v22;
  UIView *currentView;
  void *v24;
  CGFloat v25;
  CGFloat v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  void *v40;
  void *v41;
  unint64_t v42;
  void *v43;
  void *v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  void *v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  char v84;
  void *v85;
  void *v86;
  SXFullscreenCanvasViewController *v87;
  SXFullscreenCanvasViewController *canvasViewController;
  void *v89;
  _QWORD v90[5];
  id v91;
  void (**v92)(id, uint64_t);
  double v93;
  double v94;

  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  if (!self->_isTransitioning)
  {
    if (v6)
    {
      objc_msgSend(v6, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "locationInView:", v8);
      v10 = v9;
      v12 = v11;

      currentViewIndex = -[SXFullscreenCanvasController viewIndexForPoint:](self, "viewIndexForPoint:", v10, v12);
      self->_currentViewIndex = currentViewIndex;
    }
    else
    {
      v10 = *MEMORY[0x24BDBEFB0];
      v12 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
      currentViewIndex = self->_currentViewIndex;
    }
    -[SXFullscreenCanvasController showable](self, "showable");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXFullscreenCanvasController showable](self, "showable");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "fullScreenCanvasController:numberOfViewsForShowable:", self, v15);

    if (currentViewIndex < v16)
    {
      if (-[SXFullscreenCanvasController isFullscreen](self, "isFullscreen"))
      {
        self->_isTransitioning = 1;
        -[SXFullscreenCanvasController canvasViewController](self, "canvasViewController");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setIsTransitioning:", 1);

        -[SXFullscreenCanvasController captionView](self, "captionView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          -[SXFullscreenCanvasController captionView](self, "captionView");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[SXFullscreenCanvasController changeCaptionViewForViewWithIndex:expanded:animated:](self, "changeCaptionViewForViewWithIndex:expanded:animated:", objc_msgSend(v19, "viewIndex"), 0, 1);

        }
        -[SXFullscreenCanvasController showable](self, "showable");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[SXFullscreenCanvasController showable](self, "showable");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "fullScreenCanvasController:originalViewForShowable:viewIndex:", self, v21, -[SXFullscreenCanvasController currentViewIndex](self, "currentViewIndex"));
        v22 = (UIView *)objc_claimAutoreleasedReturnValue();
        currentView = self->_currentView;
        self->_currentView = v22;

        if (v6)
        {
          objc_msgSend(v6, "view");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "convertPoint:toView:", self->_currentView, v10, v12);

          -[UIView bounds](self->_currentView, "bounds");
          -[SXFullscreenCanvasController calculateAnchorPointFromBounds:andPoint:](self, "calculateAnchorPointFromBounds:andPoint:");
          self->_startingAnchorPoint.x = v25;
          self->_startingAnchorPoint.y = v26;
        }
        -[SXFullscreenCanvasController showable](self, "showable");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_opt_respondsToSelector();

        if ((v28 & 1) != 0)
        {
          -[SXFullscreenCanvasController showable](self, "showable");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[SXFullscreenCanvasController showable](self, "showable");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "fullScreenCanvasController:willHideShowable:viewIndex:", self, v30, -[SXFullscreenCanvasController currentViewIndex](self, "currentViewIndex"));

        }
        -[SXFullscreenCanvasController itemizedScrollView](self, "itemizedScrollView");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setScrollEnabled:", 0);

        -[SXFullscreenCanvasController showable](self, "showable");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[SXFullscreenCanvasController showable](self, "showable");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[SXFullscreenCanvasController canvasViewController](self, "canvasViewController");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "view");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "fullScreenCanvasController:originalFrameForShowable:onCanvasView:viewIndex:", self, v33, v35, -[SXFullscreenCanvasController currentViewIndex](self, "currentViewIndex"));
        self->_currentDestinationFrame.origin.x = v36;
        self->_currentDestinationFrame.origin.y = v37;
        self->_currentDestinationFrame.size.width = v38;
        self->_currentDestinationFrame.size.height = v39;

        -[SXFullscreenCanvasController showable](self, "showable");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[SXFullscreenCanvasController showable](self, "showable");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = -[SXFullscreenCanvasController currentViewIndex](self, "currentViewIndex");
        -[SXFullscreenCanvasController canvasViewController](self, "canvasViewController");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "view");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "bounds");
        objc_msgSend(v40, "fullScreenCanvasController:fullScreenFrameForShowable:viewIndex:withinRect:", self, v41, v42);
        self->_currentOriginFrame.origin.x = v45;
        self->_currentOriginFrame.origin.y = v46;
        self->_currentOriginFrame.size.width = v47;
        self->_currentOriginFrame.size.height = v48;

        -[SXFullscreenCanvasController currentView](self, "currentView");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "superview");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[SXFullscreenCanvasController currentView](self, "currentView");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "frame");
        v53 = v52;
        v55 = v54;
        v57 = v56;
        v59 = v58;
        -[SXFullscreenCanvasController canvasViewController](self, "canvasViewController");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "view");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "convertRect:toView:", v61, v53, v55, v57, v59);
        v63 = v62;
        v65 = v64;
        v67 = v66;
        v69 = v68;

        -[SXFullscreenCanvasController currentView](self, "currentView");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "setFrame:", v63, v65, v67, v69);

        -[SXFullscreenCanvasController canvasViewController](self, "canvasViewController");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "view");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        -[SXFullscreenCanvasController currentView](self, "currentView");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        -[SXFullscreenCanvasController captionView](self, "captionView");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "insertSubview:belowSubview:", v73, v74);

        -[SXFullscreenCanvasController transferCurrentViewToCanvas](self, "transferCurrentViewToCanvas");
        -[SXFullscreenCanvasController currentView](self, "currentView");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        -[SXFullscreenCanvasController transferGestureViewToView:](self, "transferGestureViewToView:", v75);

        -[SXFullscreenCanvasController currentView](self, "currentView");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "layer");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        -[SXFullscreenCanvasController startingAnchorPoint](self, "startingAnchorPoint");
        objc_msgSend(v77, "setAnchorPointWithoutChangingPosition:");

        -[SXFullscreenCanvasController itemizedScrollView](self, "itemizedScrollView");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "removeFromSuperview");

        -[SXFullscreenCanvasController setItemizedScrollView:](self, "setItemizedScrollView:", 0);
        -[SXFullscreenCanvasController captionView](self, "captionView");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "removeFromSuperview");

        -[SXFullscreenCanvasController setCaptionView:](self, "setCaptionView:", 0);
        -[SXFullscreenCanvasController navigationBarView](self, "navigationBarView");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "removeFromSuperview");

        -[SXFullscreenCanvasController setNavigationBarView:](self, "setNavigationBarView:", 0);
        if (v7)
          v7[2](v7, 1);
        goto LABEL_19;
      }
      -[SXFullscreenCanvasController showable](self, "showable");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[SXFullscreenCanvasController showable](self, "showable");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        -[SXFullscreenCanvasController showable](self, "showable");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = objc_msgSend(v82, "fullScreenCanvasController:willShowShowable:viewIndex:", self, v83, -[SXFullscreenCanvasController currentViewIndex](self, "currentViewIndex"));

        if ((v84 & 1) == 0)
          goto LABEL_17;
      }
      else
      {

      }
      self->_isTransitioning = 1;
      -[SXFullscreenCanvasController showable](self, "showable");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXFullscreenCanvasController showable](self, "showable");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v90[0] = MEMORY[0x24BDAC760];
      v90[1] = 3221225472;
      v90[2] = __91__SXFullscreenCanvasController_willStartTransformingWithGestureRecognizer_completionBlock___block_invoke;
      v90[3] = &unk_24D68AA28;
      v90[4] = self;
      v91 = v6;
      v93 = v10;
      v94 = v12;
      v92 = v7;
      objc_msgSend(v85, "fullScreenCanvasController:canvasViewControllerForShowable:completionBlock:", self, v86, v90);
      v87 = (SXFullscreenCanvasViewController *)objc_claimAutoreleasedReturnValue();
      canvasViewController = self->_canvasViewController;
      self->_canvasViewController = v87;

      -[SXFullscreenCanvasController canvasViewController](self, "canvasViewController");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "setIsTransitioning:", 1);

      goto LABEL_19;
    }
  }
LABEL_17:
  if (v7)
    v7[2](v7, 0);
LABEL_19:

}

void __91__SXFullscreenCanvasController_willStartTransformingWithGestureRecognizer_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD block[5];
  id v5;
  id v6;
  __int128 v7;

  objc_msgSend(*(id *)(a1 + 32), "canvasViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDelegate:", *(_QWORD *)(a1 + 32));

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __91__SXFullscreenCanvasController_willStartTransformingWithGestureRecognizer_completionBlock___block_invoke_2;
  block[3] = &unk_24D68AA28;
  v3 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v7 = *(_OWORD *)(a1 + 56);
  v6 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __91__SXFullscreenCanvasController_willStartTransformingWithGestureRecognizer_completionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "showable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "showable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fullScreenCanvasController:originalViewForShowable:viewIndex:", v3, v4, objc_msgSend(*(id *)(a1 + 32), "currentViewIndex"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 136);
  *(_QWORD *)(v6 + 136) = v5;

  v8 = *(_QWORD **)(a1 + 32);
  objc_msgSend(v8, "showable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(void **)(a1 + 32);
  objc_msgSend(v10, "showable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "canvasViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fullScreenCanvasController:originalFrameForShowable:onCanvasView:viewIndex:", v10, v11, v13, objc_msgSend(*(id *)(a1 + 32), "currentViewIndex"));
  v8[27] = v14;
  v8[28] = v15;
  v8[29] = v16;
  v8[30] = v17;

  v18 = *(_QWORD **)(a1 + 32);
  objc_msgSend(v18, "showable");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *(void **)(a1 + 32);
  objc_msgSend(v20, "showable");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(*(id *)(a1 + 32), "currentViewIndex");
  objc_msgSend(*(id *)(a1 + 32), "canvasViewController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bounds");
  objc_msgSend(v19, "fullScreenCanvasController:fullScreenFrameForShowable:viewIndex:withinRect:", v20, v21, v22);
  v18[31] = v25;
  v18[32] = v26;
  v18[33] = v27;
  v18[34] = v28;

  v29 = *(void **)(a1 + 40);
  if (v29)
  {
    objc_msgSend(v29, "view");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "convertPoint:toView:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136), *(double *)(a1 + 56), *(double *)(a1 + 64));

    v31 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(v31 + 136), "bounds");
    objc_msgSend((id)v31, "calculateAnchorPointFromBounds:andPoint:");
    *(_QWORD *)(v31 + 200) = v32;
    *(_QWORD *)(v31 + 208) = v33;
  }
  objc_msgSend(*(id *)(a1 + 32), "canvasViewController");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "bounds");
  v37 = v36;

  objc_msgSend(*(id *)(a1 + 32), "canvasViewController");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "view");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "bounds");
  v41 = v40;

  if (v37 >= v41)
    v42 = v37;
  else
    v42 = v41;
  v43 = v42 + v42;
  objc_msgSend(*(id *)(a1 + 32), "canvasViewController");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "view");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "bounds");
  v47 = v46 - v43 * 0.5;
  objc_msgSend(*(id *)(a1 + 32), "canvasViewController");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "view");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "bounds");
  v51 = v50 - v43 * 0.5;

  objc_msgSend(*(id *)(a1 + 32), "canvasViewController");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "view");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "backgroundView");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "addSubview:", v54);

  objc_msgSend(*(id *)(a1 + 32), "backgroundView");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "backgroundView");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setFrame:", v47, v51, v43, v43);

  objc_msgSend(*(id *)(a1 + 32), "transferCurrentViewToCanvas");
  objc_msgSend(*(id *)(a1 + 32), "currentView");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "layer");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "startingAnchorPoint");
  objc_msgSend(v58, "setAnchorPointWithoutChangingPosition:");

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (void)updateTransform
{
  __int128 v3;
  CGFloat x;
  CGFloat y;
  double currentRotation;
  double currentScale;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  _BOOL4 v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  CGAffineTransform v20;
  CGAffineTransform v21;
  CGAffineTransform v22;
  CGAffineTransform v23;
  CGAffineTransform v24;

  v3 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&v24.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v24.c = v3;
  *(_OWORD *)&v24.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  x = self->_currentTranslation.x;
  y = self->_currentTranslation.y;
  *(_OWORD *)&v23.a = *(_OWORD *)&v24.a;
  *(_OWORD *)&v23.c = v3;
  *(_OWORD *)&v23.tx = *(_OWORD *)&v24.tx;
  CGAffineTransformTranslate(&v24, &v23, x, y);
  currentRotation = self->_currentRotation;
  v22 = v24;
  CGAffineTransformRotate(&v23, &v22, currentRotation);
  v24 = v23;
  currentScale = self->_currentScale;
  v22 = v23;
  CGAffineTransformScale(&v23, &v22, currentScale, currentScale);
  v24 = v23;
  v21 = v23;
  -[SXFullscreenCanvasController currentView](self, "currentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v21;
  objc_msgSend(v8, "setTransform:", &v20);

  if (-[SXFullscreenCanvasController verticalSwipingIsActive](self, "verticalSwipingIsActive"))
  {
    -[SXFullscreenCanvasController currentTranslation](self, "currentTranslation");
    if (v9 >= 0.0)
      v10 = v9;
    else
      v10 = -v9;
    -[SXFullscreenCanvasController canvasViewController](self, "canvasViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    v14 = v10 / (v13 * -0.5) + 1.0;

  }
  else
  {
    v15 = -[SXFullscreenCanvasController isFullscreen](self, "isFullscreen");
    -[SXFullscreenCanvasController currentScale](self, "currentScale");
    if (v15)
      v14 = (v16 + -0.6) / 0.4;
    else
      v14 = v16 + -1.0 + v16 + -1.0;
  }
  v17 = fmax(v14, 0.0);
  if (v17 <= 1.0)
    v18 = v17;
  else
    v18 = 1.0;
  -[SXFullscreenCanvasController backgroundView](self, "backgroundView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAlpha:", v18);

}

- (void)stopTransformingCancelled:(BOOL)a3
{
  double currentScale;
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];

  currentScale = self->_currentScale;
  if (currentScale > 1.5)
  {
    if (!-[SXFullscreenCanvasController isFullscreen](self, "isFullscreen", a3))
    {
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __58__SXFullscreenCanvasController_stopTransformingCancelled___block_invoke;
      v8[3] = &unk_24D6874A8;
      v8[4] = self;
      -[SXFullscreenCanvasController goToFullScreenFromOriginalAnimated:completionBlock:](self, "goToFullScreenFromOriginalAnimated:completionBlock:", 1, v8);
      return;
    }
    currentScale = self->_currentScale;
  }
  if (currentScale > 0.6)
  {
    if (-[SXFullscreenCanvasController isFullscreen](self, "isFullscreen"))
    {
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = __58__SXFullscreenCanvasController_stopTransformingCancelled___block_invoke_2;
      v7[3] = &unk_24D6874A8;
      v7[4] = self;
      -[SXFullscreenCanvasController goToFullScreenFromFullScreenAnimated:completionBlock:](self, "goToFullScreenFromFullScreenAnimated:completionBlock:", 1, v7);
      return;
    }
    currentScale = self->_currentScale;
  }
  if (currentScale <= 0.6)
  {
    if (-[SXFullscreenCanvasController isFullscreen](self, "isFullscreen"))
    {
      -[SXFullscreenCanvasController removeScaleAndTranslationFromCurrentView](self, "removeScaleAndTranslationFromCurrentView");
      v6[0] = MEMORY[0x24BDAC760];
      v6[1] = 3221225472;
      v6[2] = __58__SXFullscreenCanvasController_stopTransformingCancelled___block_invoke_3;
      v6[3] = &unk_24D6874A8;
      v6[4] = self;
      -[SXFullscreenCanvasController goToOriginalFromFullScreenAnimated:completionBlock:](self, "goToOriginalFromFullScreenAnimated:completionBlock:", 1, v6);
      return;
    }
    currentScale = self->_currentScale;
  }
  if (currentScale <= 1.5 && !-[SXFullscreenCanvasController isFullscreen](self, "isFullscreen"))
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __58__SXFullscreenCanvasController_stopTransformingCancelled___block_invoke_4;
    v5[3] = &unk_24D6874A8;
    v5[4] = self;
    -[SXFullscreenCanvasController goToOriginalFromOriginalAnimated:completionBlock:](self, "goToOriginalFromOriginalAnimated:completionBlock:", 1, v5);
  }
}

uint64_t __58__SXFullscreenCanvasController_stopTransformingCancelled___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeScaleAndTranslationFromCurrentView");
  return objc_msgSend(*(id *)(a1 + 32), "didEndTransitionFromFullScreen:toFullScreen:", 0, 1);
}

uint64_t __58__SXFullscreenCanvasController_stopTransformingCancelled___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didEndTransitionFromFullScreen:toFullScreen:", 1, 1);
}

uint64_t __58__SXFullscreenCanvasController_stopTransformingCancelled___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didEndTransitionFromFullScreen:toFullScreen:", 1, 0);
}

uint64_t __58__SXFullscreenCanvasController_stopTransformingCancelled___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didEndTransitionFromFullScreen:toFullScreen:", 0, 0);
}

- (void)startTransitionToFullScreen:(BOOL)a3 controllable:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  id v7;

  if (!a3)
  {
    v4 = a4;
    if (-[SXFullscreenCanvasController isFullscreen](self, "isFullscreen"))
    {
      if (v4)
      {
        -[SXFullscreenCanvasController itemizedScrollView](self, "itemizedScrollView");
        v7 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "activeView");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "removeFromSuperview");

      }
    }
  }
}

- (void)didEndTransitionFromFullScreen:(BOOL)a3 toFullScreen:(BOOL)a4
{
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  -[SXFullscreenCanvasController setIsFullscreen:](self, "setIsFullscreen:", a4);
  self->_isTransitioning = 0;
  if (-[SXFullscreenCanvasController isFullscreen](self, "isFullscreen"))
  {
    -[SXFullscreenCanvasController itemizedScrollView](self, "itemizedScrollView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setScrollEnabled:", 1);

    -[SXFullscreenCanvasController didFinishFullscreenActiveIndex:](self, "didFinishFullscreenActiveIndex:", -[SXFullscreenCanvasController currentViewIndex](self, "currentViewIndex"));
    -[SXFullscreenCanvasController showable](self, "showable");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[SXFullscreenCanvasController showable](self, "showable");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXFullscreenCanvasController showable](self, "showable");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "fullScreenCanvasController:didShowShowable:viewIndex:", self, v9, -[SXFullscreenCanvasController currentViewIndex](self, "currentViewIndex"));

    }
    -[SXFullscreenCanvasController dragManager](self, "dragManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = 1;
  }
  else
  {
    -[SXFullscreenCanvasController showable](self, "showable");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      -[SXFullscreenCanvasController showable](self, "showable");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXFullscreenCanvasController showable](self, "showable");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "fullScreenCanvasController:didHideShowable:viewIndex:", self, v16, -[SXFullscreenCanvasController currentViewIndex](self, "currentViewIndex"));

    }
    -[SXFullscreenCanvasController showable](self, "showable");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXFullscreenCanvasController gestureView](self, "gestureView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXFullscreenCanvasController showable](self, "showable");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "fullScreenCanvasController:shouldAddGestureView:forShowable:", self, v18, v19);

    -[SXFullscreenCanvasController canvasViewController](self, "canvasViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setView:", 0);

    -[SXFullscreenCanvasController dragManager](self, "dragManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = 0;
  }
  objc_msgSend(v10, "setEnabled:", v12);

  -[SXFullscreenCanvasController canvasViewController](self, "canvasViewController");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setIsTransitioning:", 0);

}

- (void)startVerticalSwiping
{
  void *v3;
  id v4;

  -[SXFullscreenCanvasController itemizedScrollView](self, "itemizedScrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setScrollEnabled:", 0);

  *(_OWORD *)&self->_currentRotation = xmmword_21713C600;
  -[SXFullscreenCanvasController panGestureRecognizer](self, "panGestureRecognizer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SXFullscreenCanvasController willStartTransformingWithGestureRecognizer:completionBlock:](self, "willStartTransformingWithGestureRecognizer:completionBlock:", v4, 0);

}

- (void)stopVerticalSwipingDismissed:(BOOL)a3 lastVelocity:(CGPoint)a4
{
  double y;
  double x;
  _QWORD v7[5];
  _QWORD v8[5];

  if (a3)
  {
    y = a4.y;
    x = a4.x;
    -[SXFullscreenCanvasController setIsFullscreen:](self, "setIsFullscreen:", 0);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __74__SXFullscreenCanvasController_stopVerticalSwipingDismissed_lastVelocity___block_invoke_2;
    v7[3] = &unk_24D6874A8;
    v7[4] = self;
    -[SXFullscreenCanvasController goToOriginalFromVerticalSwipingWithVelocity:completionBlock:](self, "goToOriginalFromVerticalSwipingWithVelocity:completionBlock:", v7, x, y);
  }
  else
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __74__SXFullscreenCanvasController_stopVerticalSwipingDismissed_lastVelocity___block_invoke;
    v8[3] = &unk_24D6874A8;
    v8[4] = self;
    -[SXFullscreenCanvasController goToFullScreenFromFullScreenAnimated:completionBlock:](self, "goToFullScreenFromFullScreenAnimated:completionBlock:", 1, v8);
  }
}

uint64_t __74__SXFullscreenCanvasController_stopVerticalSwipingDismissed_lastVelocity___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "itemizedScrollView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setScrollEnabled:", 1);

  return objc_msgSend(*(id *)(a1 + 32), "didFinishFullscreenActiveIndex:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128));
}

uint64_t __74__SXFullscreenCanvasController_stopVerticalSwipingDismissed_lastVelocity___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "transferCurrentViewToOriginalView");
  return objc_msgSend(*(id *)(a1 + 32), "didEndTransitionFromFullScreen:toFullScreen:", 1, 0);
}

- (void)goToFullScreenFromOriginalAnimated:(BOOL)a3 completionBlock:(id)a4
{
  _BOOL4 v4;
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  void *v11;
  void *v12;
  _OWORD v13[3];
  _QWORD v14[5];
  void (**v15)(_QWORD);
  _QWORD v16[5];

  v4 = a3;
  v6 = (void (**)(_QWORD))a4;
  -[SXFullscreenCanvasController currentView](self, "currentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
  {
    objc_msgSend(v7, "setUserInteractionEnabled:", 0);

    v9 = (void *)MEMORY[0x24BDF6F90];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __83__SXFullscreenCanvasController_goToFullScreenFromOriginalAnimated_completionBlock___block_invoke;
    v16[3] = &unk_24D6874A8;
    v16[4] = self;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __83__SXFullscreenCanvasController_goToFullScreenFromOriginalAnimated_completionBlock___block_invoke_2;
    v14[3] = &unk_24D68AA50;
    v14[4] = self;
    v15 = v6;
    objc_msgSend(v9, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v16, v14, 0.6, 0.0, 0.6, 0.8);

  }
  else
  {
    v10 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    v13[0] = *MEMORY[0x24BDBD8B8];
    v13[1] = v10;
    v13[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    objc_msgSend(v7, "setTransform:", v13);

    -[SXFullscreenCanvasController currentView](self, "currentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAnchorPointWithoutChangingPosition:", 0.5, 0.5);

    if (v6)
      v6[2](v6);
  }

}

void __83__SXFullscreenCanvasController_goToFullScreenFromOriginalAnimated_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double MidX;
  void *v7;
  double Width;
  void *v9;
  __int128 v10;
  _OWORD v11[3];
  CGRect v12;
  CGRect v13;
  CGRect v14;
  CGRect v15;

  objc_msgSend(*(id *)(a1 + 32), "backgroundView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "currentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAnchorPoint:", 0.5, 0.5);

  objc_msgSend(*(id *)(a1 + 32), "currentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "currentDestinationFrame");
  MidX = CGRectGetMidX(v12);
  objc_msgSend(*(id *)(a1 + 32), "currentDestinationFrame");
  objc_msgSend(v5, "setCenter:", MidX, CGRectGetMidY(v13));

  objc_msgSend(*(id *)(a1 + 32), "currentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "currentDestinationFrame");
  Width = CGRectGetWidth(v14);
  objc_msgSend(*(id *)(a1 + 32), "currentDestinationFrame");
  objc_msgSend(v7, "setBounds:", 0.0, 0.0, Width, CGRectGetHeight(v15));

  objc_msgSend(*(id *)(a1 + 32), "currentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v11[0] = *MEMORY[0x24BDBD8B8];
  v11[1] = v10;
  v11[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v9, "setTransform:", v11);

}

uint64_t __83__SXFullscreenCanvasController_goToFullScreenFromOriginalAnimated_completionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "currentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAnchorPointWithoutChangingPosition:", 0.5, 0.5);

  objc_msgSend(*(id *)(a1 + 32), "currentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInteractionEnabled:", 1);

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)goToFullScreenFromFullScreenAnimated:(BOOL)a3 completionBlock:(id)a4
{
  _BOOL4 v4;
  void (**v6)(_QWORD);
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  void *v15;
  void *v16;
  _OWORD v17[3];
  _QWORD v18[5];
  void (**v19)(_QWORD);
  _QWORD v20[5];

  v4 = a3;
  v6 = (void (**)(_QWORD))a4;
  -[SXFullscreenCanvasController showable](self, "showable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[SXFullscreenCanvasController showable](self, "showable");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXFullscreenCanvasController showable](self, "showable");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fullScreenCanvasController:willReturnToFullscreenForShowable:viewIndex:", self, v10, -[SXFullscreenCanvasController currentViewIndex](self, "currentViewIndex"));

  }
  -[SXFullscreenCanvasController currentView](self, "currentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v4)
  {
    objc_msgSend(v11, "setUserInteractionEnabled:", 1);

    v13 = (void *)MEMORY[0x24BDF6F90];
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __85__SXFullscreenCanvasController_goToFullScreenFromFullScreenAnimated_completionBlock___block_invoke;
    v20[3] = &unk_24D6874A8;
    v20[4] = self;
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __85__SXFullscreenCanvasController_goToFullScreenFromFullScreenAnimated_completionBlock___block_invoke_2;
    v18[3] = &unk_24D68AA50;
    v18[4] = self;
    v19 = v6;
    objc_msgSend(v13, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v20, v18, 0.6, 0.0, 0.6, 0.8);

  }
  else
  {
    v14 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    v17[0] = *MEMORY[0x24BDBD8B8];
    v17[1] = v14;
    v17[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    objc_msgSend(v11, "setTransform:", v17);

    -[SXFullscreenCanvasController currentView](self, "currentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAnchorPointWithoutChangingPosition:", 0.5, 0.5);

    if (v6)
      v6[2](v6);
  }

}

void __85__SXFullscreenCanvasController_goToFullScreenFromFullScreenAnimated_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  __int128 v4;
  _OWORD v5[3];

  objc_msgSend(*(id *)(a1 + 32), "backgroundView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "currentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v5[0] = *MEMORY[0x24BDBD8B8];
  v5[1] = v4;
  v5[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v3, "setTransform:", v5);

}

uint64_t __85__SXFullscreenCanvasController_goToFullScreenFromFullScreenAnimated_completionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "currentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAnchorPointWithoutChangingPosition:", 0.5, 0.5);

  objc_msgSend(*(id *)(a1 + 32), "currentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInteractionEnabled:", 1);

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)goToOriginalFromFullScreenAnimated:(BOOL)a3 completionBlock:(id)a4
{
  _BOOL4 v4;
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  void *v26;
  void *v27;
  _OWORD v28[3];
  _QWORD v29[5];
  void (**v30)(_QWORD);
  _QWORD v31[9];

  v4 = a3;
  v6 = (void (**)(_QWORD))a4;
  -[SXFullscreenCanvasController canvasViewController](self, "canvasViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layoutIfNeeded");

  -[SXFullscreenCanvasController showable](self, "showable");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXFullscreenCanvasController showable](self, "showable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXFullscreenCanvasController canvasViewController](self, "canvasViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fullScreenCanvasController:originalFrameForShowable:onCanvasView:viewIndex:", self, v11, v13, -[SXFullscreenCanvasController currentViewIndex](self, "currentViewIndex"));
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  if (v4)
  {
    -[SXFullscreenCanvasController currentView](self, "currentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setUserInteractionEnabled:", 0);

    v23 = (void *)MEMORY[0x24BDF6F90];
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __83__SXFullscreenCanvasController_goToOriginalFromFullScreenAnimated_completionBlock___block_invoke;
    v31[3] = &unk_24D688B48;
    v31[4] = self;
    v31[5] = v15;
    v31[6] = v17;
    v31[7] = v19;
    v31[8] = v21;
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __83__SXFullscreenCanvasController_goToOriginalFromFullScreenAnimated_completionBlock___block_invoke_2;
    v29[3] = &unk_24D68AA50;
    v29[4] = self;
    v30 = v6;
    objc_msgSend(v23, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v31, v29, 0.6, 0.0, 0.6, 0.8);

  }
  else
  {
    -[SXFullscreenCanvasController currentView](self, "currentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    v28[0] = *MEMORY[0x24BDBD8B8];
    v28[1] = v25;
    v28[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    objc_msgSend(v24, "setTransform:", v28);

    -[SXFullscreenCanvasController currentView](self, "currentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setAnchorPointWithoutChangingPosition:", 0.5, 0.5);

    -[SXFullscreenCanvasController transferCurrentViewToOriginalView](self, "transferCurrentViewToOriginalView");
    if (v6)
      v6[2](v6);
  }

}

void __83__SXFullscreenCanvasController_goToOriginalFromFullScreenAnimated_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double MidX;
  void *v7;
  double Width;
  void *v9;
  __int128 v10;
  _OWORD v11[3];

  objc_msgSend(*(id *)(a1 + 32), "backgroundView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "currentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAnchorPoint:", 0.5, 0.5);

  objc_msgSend(*(id *)(a1 + 32), "currentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MidX = CGRectGetMidX(*(CGRect *)(a1 + 40));
  objc_msgSend(v5, "setCenter:", MidX, CGRectGetMidY(*(CGRect *)(a1 + 40)));

  objc_msgSend(*(id *)(a1 + 32), "currentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  Width = CGRectGetWidth(*(CGRect *)(a1 + 40));
  objc_msgSend(v7, "setBounds:", 0.0, 0.0, Width, CGRectGetHeight(*(CGRect *)(a1 + 40)));

  objc_msgSend(*(id *)(a1 + 32), "currentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v11[0] = *MEMORY[0x24BDBD8B8];
  v11[1] = v10;
  v11[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v9, "setTransform:", v11);

}

uint64_t __83__SXFullscreenCanvasController_goToOriginalFromFullScreenAnimated_completionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "currentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAnchorPointWithoutChangingPosition:", 0.5, 0.5);

  objc_msgSend(*(id *)(a1 + 32), "transferCurrentViewToOriginalView");
  objc_msgSend(*(id *)(a1 + 32), "currentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInteractionEnabled:", 1);

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)goToOriginalFromOriginalAnimated:(BOOL)a3 completionBlock:(id)a4
{
  _BOOL4 v4;
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  void *v12;
  void *v13;
  _OWORD v14[3];
  _QWORD v15[5];
  void (**v16)(_QWORD);
  _QWORD v17[5];

  v4 = a3;
  v6 = (void (**)(_QWORD))a4;
  if (v4)
  {
    -[SXFullscreenCanvasController currentView](self, "currentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setUserInteractionEnabled:", 1);

    v8 = (void *)MEMORY[0x24BDF6F90];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __81__SXFullscreenCanvasController_goToOriginalFromOriginalAnimated_completionBlock___block_invoke;
    v17[3] = &unk_24D6874A8;
    v17[4] = self;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __81__SXFullscreenCanvasController_goToOriginalFromOriginalAnimated_completionBlock___block_invoke_2;
    v15[3] = &unk_24D68AA50;
    v15[4] = self;
    v16 = v6;
    objc_msgSend(v8, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v17, v15, 0.6, 0.0, 0.6, 0.8);

  }
  else
  {
    -[SXFullscreenCanvasController backgroundView](self, "backgroundView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAlpha:", 0.0);

    -[SXFullscreenCanvasController currentView](self, "currentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    v14[0] = *MEMORY[0x24BDBD8B8];
    v14[1] = v11;
    v14[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    objc_msgSend(v10, "setTransform:", v14);

    -[SXFullscreenCanvasController currentView](self, "currentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAnchorPointWithoutChangingPosition:", 0.5, 0.5);

    -[SXFullscreenCanvasController transferCurrentViewToOriginalView](self, "transferCurrentViewToOriginalView");
    if (v6)
      v6[2](v6);
  }

}

void __81__SXFullscreenCanvasController_goToOriginalFromOriginalAnimated_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  __int128 v4;
  _OWORD v5[3];

  objc_msgSend(*(id *)(a1 + 32), "backgroundView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "currentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v5[0] = *MEMORY[0x24BDBD8B8];
  v5[1] = v4;
  v5[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v3, "setTransform:", v5);

}

uint64_t __81__SXFullscreenCanvasController_goToOriginalFromOriginalAnimated_completionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "currentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAnchorPointWithoutChangingPosition:", 0.5, 0.5);

  objc_msgSend(*(id *)(a1 + 32), "transferCurrentViewToOriginalView");
  objc_msgSend(*(id *)(a1 + 32), "currentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInteractionEnabled:", 1);

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)goToOriginalFromVerticalSwipingWithVelocity:(CGPoint)a3 completionBlock:(id)a4
{
  double y;
  CGFloat x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[9];
  _QWORD v29[7];

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[SXFullscreenCanvasController removeScaleAndTranslationFromCurrentView](self, "removeScaleAndTranslationFromCurrentView");
  -[SXFullscreenCanvasController canvasViewController](self, "canvasViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layoutIfNeeded");

  -[SXFullscreenCanvasController showable](self, "showable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXFullscreenCanvasController showable](self, "showable");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXFullscreenCanvasController canvasViewController](self, "canvasViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fullScreenCanvasController:originalFrameForShowable:onCanvasView:viewIndex:", self, v12, v14, -[SXFullscreenCanvasController currentViewIndex](self, "currentViewIndex"));
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  v23 = MEMORY[0x24BDAC760];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __92__SXFullscreenCanvasController_goToOriginalFromVerticalSwipingWithVelocity_completionBlock___block_invoke;
  v29[3] = &unk_24D68AA78;
  v29[4] = self;
  *(CGFloat *)&v29[5] = x;
  *(double *)&v29[6] = y;
  objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 0x20000, v29, 0, 0.13, 0.0);
  v24 = (void *)MEMORY[0x24BDF6F90];
  v28[0] = v23;
  v28[1] = 3221225472;
  v28[2] = __92__SXFullscreenCanvasController_goToOriginalFromVerticalSwipingWithVelocity_completionBlock___block_invoke_2;
  v28[3] = &unk_24D688B48;
  v28[4] = self;
  v28[5] = v16;
  *(double *)&v28[6] = v18 + y * -0.1;
  v28[7] = v20;
  v28[8] = v22;
  v26[0] = v23;
  v26[1] = 3221225472;
  v26[2] = __92__SXFullscreenCanvasController_goToOriginalFromVerticalSwipingWithVelocity_completionBlock___block_invoke_3;
  v26[3] = &unk_24D68AA50;
  v26[4] = self;
  v27 = v7;
  v25 = v7;
  objc_msgSend(v24, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v28, v26, 0.44, 0.08, 0.85, 0.18);

}

void __92__SXFullscreenCanvasController_goToOriginalFromVerticalSwipingWithVelocity_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  CGAffineTransform v3;
  CGAffineTransform v4;

  CGAffineTransformMakeTranslation(&v4, 0.0, *(double *)(a1 + 48) * 0.1);
  objc_msgSend(*(id *)(a1 + 32), "currentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4;
  objc_msgSend(v2, "setTransform:", &v3);

}

void __92__SXFullscreenCanvasController_goToOriginalFromVerticalSwipingWithVelocity_completionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double MidX;
  double Width;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "backgroundView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "currentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAnchorPoint:", 0.5, 0.5);

  objc_msgSend(*(id *)(a1 + 32), "currentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MidX = CGRectGetMidX(*(CGRect *)(a1 + 40));
  objc_msgSend(v5, "setCenter:", MidX, CGRectGetMidY(*(CGRect *)(a1 + 40)));

  objc_msgSend(*(id *)(a1 + 32), "currentView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  Width = CGRectGetWidth(*(CGRect *)(a1 + 40));
  objc_msgSend(v8, "setBounds:", 0.0, 0.0, Width, CGRectGetHeight(*(CGRect *)(a1 + 40)));

}

uint64_t __92__SXFullscreenCanvasController_goToOriginalFromVerticalSwipingWithVelocity_completionBlock___block_invoke_3(uint64_t a1)
{
  void *v2;
  __int128 v3;
  uint64_t result;
  _OWORD v5[3];

  objc_msgSend(*(id *)(a1 + 32), "currentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v5[0] = *MEMORY[0x24BDBD8B8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v2, "setTransform:", v5);

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)handleTap:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  -[SXFullscreenCanvasController itemizedScrollView](self, "itemizedScrollView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[SXFullscreenCanvasController captionView](self, "captionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[SXFullscreenCanvasController captionView](self, "captionView");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v11, "viewIndex");
      -[SXFullscreenCanvasController captionView](self, "captionView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXFullscreenCanvasController changeCaptionViewForViewWithIndex:expanded:animated:](self, "changeCaptionViewForViewWithIndex:expanded:animated:", v9, objc_msgSend(v10, "expanded") ^ 1, 1);

    }
  }
}

- (void)startSupressingColorSettings
{
  if (!-[SXFullscreenCanvasController isSupressingColorSettings](self, "isSupressingColorSettings"))
  {
    objc_msgSend(MEMORY[0x24BDF7018], "suppressColorSettingsForRequester:", self);
    -[SXFullscreenCanvasController setIsSupressingColorSettings:](self, "setIsSupressingColorSettings:", 1);
  }
}

- (void)stopSupressingColorSettings
{
  if (-[SXFullscreenCanvasController isSupressingColorSettings](self, "isSupressingColorSettings"))
  {
    objc_msgSend(MEMORY[0x24BDF7018], "restoreColorSettingsForRequester:", self);
    -[SXFullscreenCanvasController setIsSupressingColorSettings:](self, "setIsSupressingColorSettings:", 0);
  }
}

- (int64_t)viewIndexForPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  int64_t v7;
  void *v8;

  y = a3.y;
  x = a3.x;
  if (-[SXFullscreenCanvasController isFullscreen](self, "isFullscreen"))
  {
    -[SXFullscreenCanvasController itemizedScrollView](self, "itemizedScrollView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "activeViewIndex");
  }
  else
  {
    -[SXFullscreenCanvasController showable](self, "showable");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXFullscreenCanvasController showable](self, "showable");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "fullScreenCanvasController:viewIndexForPoint:inShowable:", self, v8, x, y);

  }
  return v7;
}

- (CGPoint)calculateAnchorPointFromBounds:(CGRect)a3 andPoint:(CGPoint)a4
{
  double v4;
  double v5;
  CGPoint result;

  v4 = a4.x / a3.size.width;
  v5 = a4.y / a3.size.height;
  result.y = v5;
  result.x = v4;
  return result;
}

- (void)transferCurrentViewToCanvas
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;

  -[SXFullscreenCanvasController canvasViewController](self, "canvasViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXFullscreenCanvasController currentView](self, "currentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v5);

  -[SXFullscreenCanvasController currentOriginFrame](self, "currentOriginFrame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[SXFullscreenCanvasController currentView](self, "currentView");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

}

- (void)transferCurrentViewToOriginalView
{
  void *v3;
  id v4;

  -[SXFullscreenCanvasController showable](self, "showable");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SXFullscreenCanvasController showable](self, "showable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fullScreenCanvasController:showable:shouldTransferToOriginalViewWithIndex:", self, v3, -[SXFullscreenCanvasController currentViewIndex](self, "currentViewIndex"));

}

- (void)transferGestureViewToView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double Width;
  void *v8;
  id v9;
  CGRect v10;
  CGRect v11;

  v9 = a3;
  -[SXFullscreenCanvasController gestureView](self, "gestureView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v4);

  -[SXFullscreenCanvasController gestureView](self, "gestureView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXFullscreenCanvasController itemizedScrollView](self, "itemizedScrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  Width = CGRectGetWidth(v10);
  -[SXFullscreenCanvasController itemizedScrollView](self, "itemizedScrollView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  objc_msgSend(v5, "setFrame:", 0.0, 0.0, Width, CGRectGetHeight(v11));

  objc_msgSend(v9, "setUserInteractionEnabled:", 1);
}

- (BOOL)comparePoint:(CGPoint)a3 withPoint:(CGPoint)a4 maxDelta:(double)a5
{
  double v5;
  double v6;

  v5 = a3.x - a4.x;
  if (v5 < 0.0)
    v5 = -v5;
  v6 = a3.y - a4.y;
  if (v6 < 0.0)
    v6 = -v6;
  return v6 <= a5 && v5 <= a5;
}

- (void)removeScaleAndTranslationFromCurrentView
{
  double v3;
  double v4;
  double v5;
  double v6;
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
  void *v30;
  id v31;

  -[SXFullscreenCanvasController currentOriginFrame](self, "currentOriginFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SXFullscreenCanvasController startingAnchorPoint](self, "startingAnchorPoint");
  v12 = v11;
  -[SXFullscreenCanvasController currentScale](self, "currentScale");
  v14 = -(v12 * (v13 + -1.0));
  -[SXFullscreenCanvasController currentTranslation](self, "currentTranslation");
  v16 = v4 + v15 + v14 * v8;
  -[SXFullscreenCanvasController startingAnchorPoint](self, "startingAnchorPoint");
  v18 = v17;
  -[SXFullscreenCanvasController currentScale](self, "currentScale");
  v20 = -(v18 * (v19 + -1.0));
  -[SXFullscreenCanvasController currentTranslation](self, "currentTranslation");
  v22 = v6 + v21 + v20 * v10;
  -[SXFullscreenCanvasController currentScale](self, "currentScale");
  v24 = v8 * v23;
  -[SXFullscreenCanvasController currentScale](self, "currentScale");
  v26 = v10 * v25;
  self->_currentTranslation = (CGPoint)*MEMORY[0x24BDBEFB0];
  self->_currentScale = 1.0;
  -[SXFullscreenCanvasController backgroundView](self, "backgroundView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "alpha");
  v29 = v28;

  -[SXFullscreenCanvasController updateTransform](self, "updateTransform");
  -[SXFullscreenCanvasController backgroundView](self, "backgroundView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setAlpha:", v29);

  -[SXFullscreenCanvasController currentView](self, "currentView");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setFrameUsingCenterAndBounds:", v16, v22, v24, v26);

}

- (void)fullScreenImageViewDidStartZooming:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[SXFullscreenCanvasController captionView](self, "captionView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SXFullscreenCanvasController captionView](self, "captionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXFullscreenCanvasController changeCaptionViewForViewWithIndex:expanded:animated:](self, "changeCaptionViewForViewWithIndex:expanded:animated:", objc_msgSend(v5, "viewIndex"), 0, 1);

  }
  -[SXFullscreenCanvasController pinchGestureRecognizer](self, "pinchGestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cancel");

  -[SXFullscreenCanvasController panGestureRecognizer](self, "panGestureRecognizer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cancel");

  -[SXFullscreenCanvasController rotationGestureRecognizer](self, "rotationGestureRecognizer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cancel");

}

- (void)fullScreenImageViewDidStopZooming:(id)a3
{
  void *v4;
  id v5;

  -[SXFullscreenCanvasController captionView](self, "captionView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SXFullscreenCanvasController captionView](self, "captionView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[SXFullscreenCanvasController changeCaptionViewForViewWithIndex:expanded:animated:](self, "changeCaptionViewForViewWithIndex:expanded:animated:", objc_msgSend(v5, "viewIndex"), 1, 1);

  }
}

- (unint64_t)numberOfViewsInItemizedScrollView:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;

  -[SXFullscreenCanvasController showable](self, "showable", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXFullscreenCanvasController showable](self, "showable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "fullScreenCanvasController:numberOfViewsForShowable:", self, v5);

  return v6;
}

- (CGRect)itemizedScrollView:(id)a3 frameForViewAtIndex:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
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
  double v19;
  CGRect result;

  v5 = a3;
  -[SXFullscreenCanvasController canvasViewController](self, "canvasViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;

  objc_msgSend(v5, "frame");
  v13 = -v12;
  objc_msgSend(v5, "frame");
  v15 = v14;

  v16 = -v15;
  v17 = v13;
  v18 = v9;
  v19 = v11;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v16;
  result.origin.x = v17;
  return result;
}

- (id)itemizedScrollView:(id)a3 viewAtIndex:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  SXFullscreenImageView *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  -[SXFullscreenCanvasController showable](self, "showable", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXFullscreenCanvasController showable](self, "showable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fullScreenCanvasController:originalViewForShowable:viewIndex:", self, v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXFullscreenCanvasController showable](self, "showable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXFullscreenCanvasController showable](self, "showable");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXFullscreenCanvasController canvasViewController](self, "canvasViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  objc_msgSend(v9, "fullScreenCanvasController:fullScreenFrameForShowable:viewIndex:withinRect:", self, v10, a4);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v21 = -[SXFullscreenImageView initWithContentView:viewIndex:]([SXFullscreenImageView alloc], "initWithContentView:viewIndex:", v8, a4);
  -[SXFullscreenImageView setContentViewFrame:](v21, "setContentViewFrame:", v14, v16, v18, v20);
  -[SXFullscreenImageView setDelegate:](v21, "setDelegate:", self);
  -[SXFullscreenCanvasController tapGestureRecognizer](self, "tapGestureRecognizer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXFullscreenImageView doubleTapGestureRecognizer](v21, "doubleTapGestureRecognizer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "requireGestureRecognizerToFail:", v23);

  -[SXFullscreenImageView scrollView](v21, "scrollView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "pinchGestureRecognizer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXFullscreenCanvasController pinchGestureRecognizer](self, "pinchGestureRecognizer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "requireGestureRecognizerToFail:", v26);

  return v21;
}

- (void)itemizedScrollView:(id)a3 didChangeToActiveViewIndex:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(a3, "activeView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "scrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXFullscreenCanvasController transferGestureViewToView:](self, "transferGestureViewToView:", v6);

  -[SXFullscreenCanvasController captionView](self, "captionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXFullscreenCanvasController changeCaptionViewForViewWithIndex:expanded:animated:](self, "changeCaptionViewForViewWithIndex:expanded:animated:", a4, objc_msgSend(v7, "expanded"), 1);

  -[SXFullscreenCanvasController showable](self, "showable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[SXFullscreenCanvasController showable](self, "showable");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXFullscreenCanvasController showable](self, "showable");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fullScreenCanvasController:showable:didShowViewWithIndex:", self, v11, a4);

  }
}

- (void)itemizedScrollView:(id)a3 willShowViewWithIndex:(unint64_t)a4
{
  void *v6;
  char v7;
  void *v8;
  id v9;

  -[SXFullscreenCanvasController showable](self, "showable", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[SXFullscreenCanvasController showable](self, "showable");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[SXFullscreenCanvasController showable](self, "showable");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fullScreenCanvasController:showable:willShowViewWithIndex:", self, v8, a4);

  }
}

- (void)itemizedScrollView:(id)a3 didHideViewWithIndex:(unint64_t)a4
{
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[SXFullscreenCanvasController showable](self, "showable", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[SXFullscreenCanvasController showable](self, "showable");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXFullscreenCanvasController showable](self, "showable");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fullScreenCanvasController:showable:didHideViewWithIndex:", self, v9, a4);

  }
  -[SXFullscreenCanvasController showable](self, "showable");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[SXFullscreenCanvasController showable](self, "showable");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fullScreenCanvasController:showable:shouldTransferToOriginalViewWithIndex:", self, v10, a4);

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
    -[SXFullscreenCanvasController stopSupressingColorSettings](self, "stopSupressingColorSettings", a3);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  char v7;
  void *v8;
  int v9;
  id v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  void *v19;
  char v20;
  id v21;
  id v22;
  _BOOL4 v23;
  double v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  _BOOL4 v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  double v59;
  double v60;
  double v61;
  double v62;
  int64_t v63;
  BOOL v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  uint64_t v71;
  CGPoint v72;
  CGPoint v73;
  CGRect v74;
  CGRect v75;

  v71 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[SXFullscreenCanvasController showable](self, "showable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[SXFullscreenCanvasController showable](self, "showable");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXFullscreenCanvasController showable](self, "showable");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "fullScreenCanvasController:showable:gestureRecognizerShouldBegin:", self, v3, v5);

    if (!v9)
      goto LABEL_49;
  }
  if (-[SXFullscreenCanvasController isFullscreen](self, "isFullscreen")
    && !-[SXFullscreenCanvasController totalActiveGestureRecognizers](self, "totalActiveGestureRecognizers"))
  {
    -[SXFullscreenCanvasController itemizedScrollView](self, "itemizedScrollView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "activeView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    -[SXFullscreenCanvasController itemizedScrollView](self, "itemizedScrollView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isDragging"))
    {
LABEL_31:

LABEL_40:
      goto LABEL_49;
    }
    -[SXFullscreenCanvasController itemizedScrollView](self, "itemizedScrollView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "isDecelerating");

    if ((v37 & 1) != 0 || v27 && !objc_msgSend(v27, "allowsDismissal"))
      goto LABEL_40;

  }
  -[SXFullscreenCanvasController tapGestureRecognizer](self, "tapGestureRecognizer");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 == v5)
  {
    v11 = -[SXFullscreenCanvasController isFullscreen](self, "isFullscreen");

    if (v11)
    {
      -[SXFullscreenCanvasController tapGestureRecognizer](self, "tapGestureRecognizer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXFullscreenCanvasController tapGestureRecognizer](self, "tapGestureRecognizer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "locationInView:", v14);
      v16 = v15;
      v18 = v17;

      -[SXFullscreenCanvasController captionView](self, "captionView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "frame");
      v72.x = v16;
      v72.y = v18;
      if (CGRectContainsPoint(v74, v72))
      {
        v20 = 0;
      }
      else
      {
        -[SXFullscreenCanvasController navigationBarView](self, "navigationBarView");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "frame");
        v73.x = v16;
        v73.y = v18;
        v20 = !CGRectContainsPoint(v75, v73);

      }
      goto LABEL_50;
    }
  }
  else
  {

  }
  -[SXFullscreenCanvasController pinchGestureRecognizer](self, "pinchGestureRecognizer");
  v21 = (id)objc_claimAutoreleasedReturnValue();

  if (v21 == v5)
  {
    v23 = -[SXFullscreenCanvasController isFullscreen](self, "isFullscreen");
    if (v23)
    {
      -[SXFullscreenCanvasController pinchGestureRecognizer](self, "pinchGestureRecognizer");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "scale");
      if (v24 > 1.0)
      {

        goto LABEL_48;
      }
      if (-[SXFullscreenCanvasController isFullscreen](self, "isFullscreen"))
      {

        goto LABEL_11;
      }
    }
    else if (-[SXFullscreenCanvasController isFullscreen](self, "isFullscreen"))
    {
      goto LABEL_11;
    }
    -[SXFullscreenCanvasController pinchGestureRecognizer](self, "pinchGestureRecognizer");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "scale");
    v41 = v40;

    if (v23)
    if (v41 >= 1.0)
      goto LABEL_11;
LABEL_48:
    -[SXFullscreenCanvasController panGestureRecognizer](self, "panGestureRecognizer");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "cancel");

    -[SXFullscreenCanvasController rotationGestureRecognizer](self, "rotationGestureRecognizer");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "cancel");

    goto LABEL_49;
  }
LABEL_11:
  -[SXFullscreenCanvasController panGestureRecognizer](self, "panGestureRecognizer");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  if (v22 != v5)
  {

    goto LABEL_26;
  }
  v25 = -[SXFullscreenCanvasController isFullscreen](self, "isFullscreen");

  if (v25)
  {
    -[SXFullscreenCanvasController itemizedScrollView](self, "itemizedScrollView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "activeView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    objc_msgSend(v27, "scrollView", 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "gestureRecognizers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v66, v70, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v67;
LABEL_19:
      v32 = 0;
      while (1)
      {
        if (*(_QWORD *)v67 != v31)
          objc_enumerationMutation(v3);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * v32), "state"))
          goto LABEL_31;
        if (v30 == ++v32)
        {
          v30 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v66, v70, 16);
          if (v30)
            goto LABEL_19;
          break;
        }
      }
    }

  }
LABEL_26:
  if (-[SXFullscreenCanvasController verticalSwipingIsActive](self, "verticalSwipingIsActive"))
    goto LABEL_49;
  -[SXFullscreenCanvasController openTapGestureRecognizer](self, "openTapGestureRecognizer");
  v33 = (id)objc_claimAutoreleasedReturnValue();

  if (v33 == v5)
  {
    if (!-[SXFullscreenCanvasController isFullscreen](self, "isFullscreen"))
    {
      v20 = !-[SXFullscreenCanvasController pinchIsActive](self, "pinchIsActive");
      goto LABEL_50;
    }
LABEL_49:
    v20 = 0;
    goto LABEL_50;
  }
  -[SXFullscreenCanvasController panGestureRecognizer](self, "panGestureRecognizer");
  v34 = (id)objc_claimAutoreleasedReturnValue();
  if (v34 != v5)
  {

    goto LABEL_58;
  }
  v45 = -[SXFullscreenCanvasController isFullscreen](self, "isFullscreen");

  if (!v45)
  {
LABEL_58:
    if (-[SXFullscreenCanvasController totalActiveGestureRecognizers](self, "totalActiveGestureRecognizers"))
    {
      v20 = 1;
    }
    else
    {
      objc_msgSend(v5, "view");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "locationInView:", v58);
      v60 = v59;
      v62 = v61;

      v63 = -[SXFullscreenCanvasController viewIndexForPoint:](self, "viewIndexForPoint:", v60, v62);
      v20 = v63 != 0x7FFFFFFFFFFFFFFFLL;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v20 = objc_msgSend(v5, "numberOfTouches") == 2 && v63 != 0x7FFFFFFFFFFFFFFFLL;
    }
    goto LABEL_50;
  }
  -[SXFullscreenCanvasController panGestureRecognizer](self, "panGestureRecognizer");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "numberOfTouches");

  -[SXFullscreenCanvasController panGestureRecognizer](self, "panGestureRecognizer");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v48;
  if (v47 == 1)
  {
    -[SXFullscreenCanvasController panGestureRecognizer](self, "panGestureRecognizer");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "view");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "translationInView:", v51);
    v53 = v52;
    v55 = v54;

    v56 = -v55;
    if (v55 >= 0.0)
      v56 = v55;
    v57 = -v53;
    if (v53 >= 0.0)
      v57 = v53;
    v20 = v56 > v57;
  }
  else
  {
    v65 = objc_msgSend(v48, "numberOfTouches") == 2;

    v20 = v65 | v7;
  }
LABEL_50:

  return v20 & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (id)dragManager:(id)a3 dragableAtLocation:(CGPoint)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[SXFullscreenCanvasController itemizedScrollView](self, "itemizedScrollView", a3, a4.x, a4.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SXFullscreenCanvasController itemizedScrollView](self, "itemizedScrollView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activeView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (BOOL)captionView:(id)a3 tapGestureRecognizerShouldBegin:(id)a4
{
  id v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  BOOL v12;
  CGPoint v14;
  CGRect v15;

  v5 = a4;
  if (-[SXFullscreenCanvasController isFullscreen](self, "isFullscreen"))
  {
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "locationInView:", v6);
    v8 = v7;
    v10 = v9;

    -[SXFullscreenCanvasController captionView](self, "captionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    v14.x = v8;
    v14.y = v10;
    v12 = CGRectContainsPoint(v15, v14);

  }
  else
  {
    v12 = 1;
  }

  return v12;
}

- (void)handleNextCommand
{
  void *v3;
  void *v4;
  unint64_t v5;
  id v6;

  -[SXFullscreenCanvasController showable](self, "showable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXFullscreenCanvasController showable](self, "showable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fullScreenCanvasController:numberOfViewsForShowable:", self, v4);

  if (v5 >= 2)
  {
    -[SXFullscreenCanvasController itemizedScrollView](self, "itemizedScrollView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scrollToNext");

  }
}

- (void)handlePreviousCommand
{
  void *v3;
  void *v4;
  unint64_t v5;
  id v6;

  -[SXFullscreenCanvasController showable](self, "showable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXFullscreenCanvasController showable](self, "showable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fullScreenCanvasController:numberOfViewsForShowable:", self, v4);

  if (v5 >= 2)
  {
    -[SXFullscreenCanvasController itemizedScrollView](self, "itemizedScrollView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scrollToPrevious");

  }
}

- (void)fullscreenCanvasViewController:(id)a3 willTransitionToSize:(CGSize)a4 withTransitionCoordinator:(id)a5
{
  _QWORD v5[5];
  CGSize v6;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __110__SXFullscreenCanvasController_fullscreenCanvasViewController_willTransitionToSize_withTransitionCoordinator___block_invoke;
  v5[3] = &unk_24D6873E0;
  v5[4] = self;
  v6 = a4;
  objc_msgSend(a5, "animateAlongsideTransition:completion:", v5, 0);
}

uint64_t __110__SXFullscreenCanvasController_fullscreenCanvasViewController_willTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "transformViewToSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (SXFullscreenCanvasShowable)showable
{
  return (SXFullscreenCanvasShowable *)objc_loadWeakRetained((id *)&self->_showable);
}

- (BOOL)isFullscreen
{
  return self->_isFullscreen;
}

- (void)setIsFullscreen:(BOOL)a3
{
  self->_isFullscreen = a3;
}

- (BOOL)isTransitioning
{
  return self->_isTransitioning;
}

- (unint64_t)sharingPolicy
{
  return self->_sharingPolicy;
}

- (SXFullscreenCaptionViewFactory)captionViewFactory
{
  return self->_captionViewFactory;
}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  return self->_panGestureRecognizer;
}

- (UIPinchGestureRecognizer)pinchGestureRecognizer
{
  return self->_pinchGestureRecognizer;
}

- (UIRotationGestureRecognizer)rotationGestureRecognizer
{
  return self->_rotationGestureRecognizer;
}

- (UITapGestureRecognizer)openTapGestureRecognizer
{
  return self->_openTapGestureRecognizer;
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, a3);
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (UIView)gestureView
{
  return self->_gestureView;
}

- (BOOL)rotationIsActive
{
  return self->_rotationIsActive;
}

- (BOOL)panIsActive
{
  return self->_panIsActive;
}

- (BOOL)pinchIsActive
{
  return self->_pinchIsActive;
}

- (BOOL)verticalSwipingIsActive
{
  return self->_verticalSwipingIsActive;
}

- (BOOL)isStoppingVerticalSwiping
{
  return self->_isStoppingVerticalSwiping;
}

- (unint64_t)totalActiveGestureRecognizers
{
  return self->_totalActiveGestureRecognizers;
}

- (double)currentRotation
{
  return self->_currentRotation;
}

- (double)currentScale
{
  return self->_currentScale;
}

- (CGPoint)currentTranslation
{
  double x;
  double y;
  CGPoint result;

  x = self->_currentTranslation.x;
  y = self->_currentTranslation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)startingAnchorPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_startingAnchorPoint.x;
  y = self->_startingAnchorPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)orientationChangeIsInterupting
{
  return self->_orientationChangeIsInterupting;
}

- (void)setOrientationChangeIsInterupting:(BOOL)a3
{
  self->_orientationChangeIsInterupting = a3;
}

- (BOOL)lessTouchesAreInterupting
{
  return self->_lessTouchesAreInterupting;
}

- (void)setLessTouchesAreInterupting:(BOOL)a3
{
  self->_lessTouchesAreInterupting = a3;
}

- (unint64_t)currentViewIndex
{
  return self->_currentViewIndex;
}

- (void)setCurrentViewIndex:(unint64_t)a3
{
  self->_currentViewIndex = a3;
}

- (UIView)currentView
{
  return self->_currentView;
}

- (void)setCurrentView:(id)a3
{
  objc_storeStrong((id *)&self->_currentView, a3);
}

- (CGRect)currentOriginFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_currentOriginFrame.origin.x;
  y = self->_currentOriginFrame.origin.y;
  width = self->_currentOriginFrame.size.width;
  height = self->_currentOriginFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCurrentOriginFrame:(CGRect)a3
{
  self->_currentOriginFrame = a3;
}

- (CGRect)currentDestinationFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_currentDestinationFrame.origin.x;
  y = self->_currentDestinationFrame.origin.y;
  width = self->_currentDestinationFrame.size.width;
  height = self->_currentDestinationFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCurrentDestinationFrame:(CGRect)a3
{
  self->_currentDestinationFrame = a3;
}

- (SXFullscreenCanvasViewController)canvasViewController
{
  return self->_canvasViewController;
}

- (void)setCanvasViewController:(id)a3
{
  objc_storeStrong((id *)&self->_canvasViewController, a3);
}

- (SXItemizedScrollView)itemizedScrollView
{
  return self->_itemizedScrollView;
}

- (void)setItemizedScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_itemizedScrollView, a3);
}

- (SXFullscreenNavigationBarView)navigationBarView
{
  return self->_navigationBarView;
}

- (void)setNavigationBarView:(id)a3
{
  objc_storeStrong((id *)&self->_navigationBarView, a3);
}

- (SXFullscreenCaptionView)captionView
{
  return self->_captionView;
}

- (void)setCaptionView:(id)a3
{
  objc_storeStrong((id *)&self->_captionView, a3);
}

- (int)previousExpansionMode
{
  return self->_previousExpansionMode;
}

- (void)setPreviousExpansionMode:(int)a3
{
  self->_previousExpansionMode = a3;
}

- (BOOL)isSupressingColorSettings
{
  return self->_isSupressingColorSettings;
}

- (void)setIsSupressingColorSettings:(BOOL)a3
{
  self->_isSupressingColorSettings = a3;
}

- (SXDragManager)dragManager
{
  return self->_dragManager;
}

- (void)setDragManager:(id)a3
{
  objc_storeStrong((id *)&self->_dragManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragManager, 0);
  objc_storeStrong((id *)&self->_captionView, 0);
  objc_storeStrong((id *)&self->_navigationBarView, 0);
  objc_storeStrong((id *)&self->_itemizedScrollView, 0);
  objc_storeStrong((id *)&self->_canvasViewController, 0);
  objc_storeStrong((id *)&self->_currentView, 0);
  objc_storeStrong((id *)&self->_gestureView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_openTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_rotationGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_pinchGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_captionViewFactory, 0);
  objc_destroyWeak((id *)&self->_showable);
}

@end
