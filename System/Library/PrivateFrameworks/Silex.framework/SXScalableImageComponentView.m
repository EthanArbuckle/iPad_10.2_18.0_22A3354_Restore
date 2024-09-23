@implementation SXScalableImageComponentView

- (SXScalableImageComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6 analyticsReporting:(id)a7 appStateMonitor:(id)a8 imageViewFactory:(id)a9 canvasControllerFactory:(id)a10 mediaSharingPolicyProvider:(id)a11
{
  SXScalableImageComponentView *v18;
  SXScalableImageComponentView *v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a9;
  v22 = a10;
  v21 = a11;
  v24.receiver = self;
  v24.super_class = (Class)SXScalableImageComponentView;
  v18 = -[SXMediaComponentView initWithDOMObjectProvider:viewport:presentationDelegate:componentStyleRendererFactory:analyticsReporting:appStateMonitor:](&v24, sel_initWithDOMObjectProvider_viewport_presentationDelegate_componentStyleRendererFactory_analyticsReporting_appStateMonitor_, a3, a4, a5, a6, a7, a8);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_imageViewFactory, a9);
    objc_storeStrong((id *)&v19->_canvasControllerFactory, a10);
    objc_storeStrong((id *)&v19->_mediaSharingPolicyProvider, a11);
  }

  return v19;
}

- (void)loadComponent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  SXImageResource *v7;
  SXImageResource *imageResource;
  SXImageResource *v9;
  void *v10;
  SXImageView *v11;
  SXImageView *imageView;
  SXImageView *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  SXFullscreenCanvasController *v19;
  SXFullscreenCanvasController *fullScreenCanvasController;
  SXDragManager *v21;
  void *v22;
  SXDragManager *v23;
  SXDragManager *dragManager;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)SXScalableImageComponentView;
  -[SXComponentView loadComponent:](&v25, sel_loadComponent_, a3);
  if (!self->_imageView)
  {
    -[SXComponentView DOMObjectProvider](self, "DOMObjectProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXComponentView component](self, "component");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageResourceForIdentifier:", v6);
    v7 = (SXImageResource *)objc_claimAutoreleasedReturnValue();

    imageResource = self->_imageResource;
    self->_imageResource = v7;
    v9 = v7;

    -[SXScalableImageComponentView imageViewFactory](self, "imageViewFactory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageViewForResource:", v9);
    v11 = (SXImageView *)objc_claimAutoreleasedReturnValue();
    imageView = self->_imageView;
    self->_imageView = v11;

    v13 = self->_imageView;
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXImageView setBackgroundColor:](v13, "setBackgroundColor:", v14);

    -[SXImageView setDelegate:](self->_imageView, "setDelegate:", self);
    -[SXComponentView component](self, "component");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "accessibilityCaption");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXImageView setAccessibilityLabel:](self->_imageView, "setAccessibilityLabel:", v16);

    -[SXComponentView contentView](self, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSubview:", self->_imageView);

    -[SXScalableImageComponentView canvasControllerFactory](self, "canvasControllerFactory");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "fullscreenCanvasControllerForShowable:", self);
    v19 = (SXFullscreenCanvasController *)objc_claimAutoreleasedReturnValue();
    fullScreenCanvasController = self->_fullScreenCanvasController;
    self->_fullScreenCanvasController = v19;

    v21 = [SXDragManager alloc];
    -[SXScalableImageComponentView mediaSharingPolicyProvider](self, "mediaSharingPolicyProvider");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[SXDragManager initWithSharingPolicy:dataSource:](v21, "initWithSharingPolicy:dataSource:", objc_msgSend(v22, "mediaSharingPolicy"), self);
    dragManager = self->_dragManager;
    self->_dragManager = v23;

    -[SXDragManager updateAccessibilityDragSourceDescriptorsForDraggableElement:](self->_dragManager, "updateAccessibilityDragSourceDescriptorsForDraggableElement:", self->_imageView);
  }
}

- (void)presentComponentWithChanges:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  char v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)SXScalableImageComponentView;
  -[SXComponentView presentComponentWithChanges:](&v29, sel_presentComponentWithChanges_, *(_QWORD *)&a3.var0 & 0xFFFFFFLL);
  -[SXScalableImageComponentView previousContentFrame](self, "previousContentFrame");
  v5 = v4;
  v7 = v6;
  -[SXComponentView contentFrame](self, "contentFrame");
  if (v5 != v9 || v7 != v8)
  {
    -[SXScalableImageComponentView fullScreenCanvasController](self, "fullScreenCanvasController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isFullscreen"))
    {

    }
    else
    {
      -[SXScalableImageComponentView fullScreenCanvasController](self, "fullScreenCanvasController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isTransitioning");

      if ((v13 & 1) == 0)
        -[SXScalableImageComponentView layoutImageView](self, "layoutImageView");
    }
    -[SXScalableImageComponentView imageView](self, "imageView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXComponentView contentFrame](self, "contentFrame");
    objc_msgSend(v14, "setPreferredImageSize:", v15, v16);

    -[SXScalableImageComponentView fullScreenCanvasController](self, "fullScreenCanvasController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isFullscreen");

    if ((v18 & 1) == 0)
    {
      -[SXScalableImageComponentView imageView](self, "imageView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "bounds");
      v21 = v20;
      v23 = v22;
      v25 = v24;
      v27 = v26;
      -[SXScalableImageComponentView gestureView](self, "gestureView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setFrame:", v21, v23, v25, v27);

    }
  }
  -[SXComponentView contentFrame](self, "contentFrame");
  -[SXScalableImageComponentView setPreviousContentFrame:](self, "setPreviousContentFrame:");
}

- (void)renderContents
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SXScalableImageComponentView;
  -[SXComponentView renderContents](&v4, sel_renderContents);
  -[SXScalableImageComponentView imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addInterestInImageQuality:forObject:", 0, self);

}

- (void)discardContents
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SXScalableImageComponentView;
  -[SXComponentView discardContents](&v7, sel_discardContents);
  -[SXScalableImageComponentView imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "objectHasQualityInterest:quality:", self, 0);

  if (v4)
  {
    -[SXScalableImageComponentView imageView](self, "imageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "giveUpInterestForObject:", self);

  }
  -[SXScalableImageComponentView imageView](self, "imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", 0);

}

- (void)visibilityStateDidChangeFromState:(int64_t)a3
{
  void *v5;
  int64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SXScalableImageComponentView;
  -[SXMediaComponentView visibilityStateDidChangeFromState:](&v7, sel_visibilityStateDidChangeFromState_);
  if (-[SXComponentView visibilityState](self, "visibilityState") == 1)
  {
    -[SXScalableImageComponentView imageView](self, "imageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resume");
LABEL_6:

    return;
  }
  v6 = -[SXComponentView visibilityState](self, "visibilityState");
  if (a3 == 1 && v6 == 2)
  {
    -[SXScalableImageComponentView imageView](self, "imageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pause");
    goto LABEL_6;
  }
}

- (void)imageView:(id)a3 didLoadAnimatedImage:(id)a4
{
  void *v5;
  id v6;

  -[SXMediaComponentView setIsDisplayingMedia:](self, "setIsDisplayingMedia:", 1, a4);
  if (-[SXComponentView visibilityState](self, "visibilityState") == 1)
  {
    -[SXScalableImageComponentView imageView](self, "imageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resume");

  }
  -[SXScalableImageComponentView imageView](self, "imageView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setScrubbingEnabled:", 1);

}

- (void)imageView:(id)a3 didLoadImage:(id)a4 ofQuality:(int)a5
{
  -[SXMediaComponentView setIsDisplayingMedia:](self, "setIsDisplayingMedia:", 1, a4, *(_QWORD *)&a5);
}

- (BOOL)requestInteractivityFocusForFullScreenCanvasController:(id)a3
{
  SXScalableImageComponentView *v3;
  void *v4;

  v3 = self;
  -[SXComponentView presentationDelegate](self, "presentationDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "allowInteractivityFocusForComponent:", v3);

  return (char)v3;
}

- (id)fullScreenCanvasController:(id)a3 canvasViewControllerForShowable:(id)a4 completionBlock:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a5;
  v8 = a3;
  -[SXComponentView presentationDelegate](self, "presentationDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestFullScreenCanvasViewControllerForComponent:canvasController:withCompletionBlock:", self, v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)fullScreenCanvasController:(id)a3 showable:(id)a4 shouldTransferToOriginalViewWithIndex:(unint64_t)a5
{
  void *v6;
  void *v7;

  -[SXComponentView contentView](self, "contentView", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXScalableImageComponentView imageView](self, "imageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v7);

  -[SXScalableImageComponentView layoutImageView](self, "layoutImageView");
}

- (id)fullScreenCanvasController:(id)a3 captionForShowable:(id)a4 viewIndex:(unint64_t)a5
{
  void *v6;
  void *v7;
  SXFullscreenCaption *v8;
  void *v9;
  void *v10;
  id *v11;
  void *v12;
  void *v13;
  SXFullscreenCaption *v14;
  id *v15;

  -[SXComponentView component](self, "component", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "captionComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = [SXFullscreenCaption alloc];
    -[SXComponentView component](self, "component");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "captionComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[SXFullscreenCaption initWithCaption:dataSource:]((id *)&v8->super.isa, v10, self);
  }
  else
  {
    -[SXComponentView component](self, "component");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "caption");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      v15 = 0;
      return v15;
    }
    v14 = [SXFullscreenCaption alloc];
    -[SXComponentView component](self, "component");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "caption");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[SXFullscreenCaption initWithText:dataSource:]((id *)&v14->super.isa, v10, self);
  }
  v15 = v11;

  return v15;
}

- (BOOL)fullScreenCanvasController:(id)a3 willShowShowable:(id)a4 viewIndex:(unint64_t)a5
{
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;

  -[SXScalableImageComponentView imageView](self, "imageView", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasLoadedImage");

  if (v7)
  {
    -[SXComponentView presentationDelegate](self, "presentationDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "addInteractivityFocusForComponent:", self);

    if (v9)
    {
      -[SXScalableImageComponentView imageView](self, "imageView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addInterestInImageQuality:forObject:", 1, self);

      -[SXScalableImageComponentView createMediaViewEvent](self, "createMediaViewEvent");
    }
    -[SXComponentView presentationDelegate](self, "presentationDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "animationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stopUpdatingAnimationForComponentView:finishAnimation:", self, 1);

  }
  else
  {
    LOBYTE(v9) = 0;
  }
  return v9;
}

- (void)fullScreenCanvasController:(id)a3 willReturnToFullscreenForShowable:(id)a4 viewIndex:(unint64_t)a5
{
  id v6;

  -[SXComponentView presentationDelegate](self, "presentationDelegate", a3, a4, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "willReturnToFullscreenForComponent:", self);

}

- (void)fullScreenCanvasController:(id)a3 didHideShowable:(id)a4 viewIndex:(unint64_t)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[SXComponentView presentationDelegate](self, "presentationDelegate", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeInteractivityFocusForComponent:", self);

  -[SXComponentView presentationDelegate](self, "presentationDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dismissFullscreenCanvasForComponent:", self);

  -[SXComponentView restoreBehavior](self, "restoreBehavior");
  -[SXScalableImageComponentView imageView](self, "imageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "giveUpInterestForObject:", self);

  -[SXScalableImageComponentView imageView](self, "imageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addInterestInImageQuality:forObject:", 0, self);

  -[SXScalableImageComponentView finishMediaViewEvent](self, "finishMediaViewEvent");
}

- (void)fullScreenCanvasController:(id)a3 willHideShowable:(id)a4 viewIndex:(unint64_t)a5
{
  id v6;

  -[SXComponentView presentationDelegate](self, "presentationDelegate", a3, a4, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "willDismissFullscreenCanvasForComponent:", self);

}

- (CGRect)fullScreenCanvasController:(id)a3 fullScreenFrameForShowable:(id)a4 viewIndex:(unint64_t)a5 withinRect:(CGRect)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat rect;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect result;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v11 = a3;
  -[SXScalableImageComponentView imageView](self, "imageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v14 = v13;
  rect = v15;

  -[SXScalableImageComponentView imageView](self, "imageView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  objc_msgSend(v11, "fitSizeForRect:");
  v18 = v17;
  v20 = v19;

  v29.origin.x = x;
  v29.origin.y = y;
  v29.size.width = width;
  v29.size.height = height;
  v21 = CGRectGetHeight(v29);
  v30.origin.x = v14;
  v30.origin.y = rect;
  v30.size.width = v18;
  v30.size.height = v20;
  v22 = (v21 - CGRectGetHeight(v30)) * 0.5;
  v31.origin.x = x;
  v31.origin.y = y;
  v31.size.width = width;
  v31.size.height = height;
  v23 = CGRectGetWidth(v31);
  v32.origin.x = v14;
  v32.origin.y = v22;
  v32.size.width = v18;
  v32.size.height = v20;
  v24 = (v23 - CGRectGetWidth(v32)) * 0.5;
  v25 = v22;
  v26 = v18;
  v27 = v20;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (void)fullScreenCanvasController:(id)a3 shouldAddGestureView:(id)a4 forShowable:(id)a5
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  -[SXScalableImageComponentView imageView](self, "imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  objc_msgSend(v8, "setFrame:");

  -[SXScalableImageComponentView imageView](self, "imageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v8);

  -[SXScalableImageComponentView setGestureView:](self, "setGestureView:", v8);
}

- (unint64_t)fullScreenCanvasController:(id)a3 numberOfViewsForShowable:(id)a4
{
  return 1;
}

- (CGRect)fullScreenCanvasController:(id)a3 originalFrameForShowable:(id)a4 onCanvasView:(id)a5 viewIndex:(unint64_t)a6
{
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
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
  double v27;
  double v28;
  CGRect result;

  v7 = a5;
  -[SXComponentView contentFrame](self, "contentFrame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[SXComponentView contentView](self, "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "convertRect:fromView:", v16, v9, v11, v13, v15);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  v25 = v18;
  v26 = v20;
  v27 = v22;
  v28 = v24;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (unint64_t)fullScreenCanvasController:(id)a3 viewIndexForPoint:(CGPoint)a4 inShowable:(id)a5
{
  return 0;
}

- (BOOL)fullScreenCanvasController:(id)a3 showable:(id)a4 gestureRecognizerShouldBegin:(id)a5
{
  void *v5;
  char v6;

  -[SXComponentView presentationDelegate](self, "presentationDelegate", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isScrolling") ^ 1;

  return v6;
}

- (void)layoutImageView
{
  void *v3;
  void *v4;
  int v5;
  id v6;

  -[SXScalableImageComponentView fullScreenCanvasController](self, "fullScreenCanvasController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isFullscreen") & 1) == 0)
  {

    goto LABEL_5;
  }
  -[SXScalableImageComponentView fullScreenCanvasController](self, "fullScreenCanvasController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isTransitioning");

  if (v5)
  {
LABEL_5:
    -[SXScalableImageComponentView imageView](self, "imageView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[SXComponentView contentFrame](self, "contentFrame");
    objc_msgSend(v6, "setFrame:");

  }
}

- (BOOL)gestureShouldBegin:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[SXScalableImageComponentView fullScreenCanvasController](self, "fullScreenCanvasController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "otherInteractivityGestureShouldBegin:", v4);

  return v6;
}

- (CGRect)transitionContentFrame
{
  void *v2;
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
  CGRect result;

  -[SXScalableImageComponentView imageView](self, "imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)usesThumbnailWithImageIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[SXComponentView component](self, "component");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  return v7;
}

- (id)textResizerForCaption:(id)a3
{
  id v4;
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
  void *v17;
  void *v18;
  void *v19;
  char v20;
  SXTextResizer *v21;
  void *v22;
  id *v23;
  const __CFString *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SXComponentView DOMObjectProvider](self, "DOMObjectProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SXDefaultTextStyleIdentifierForRole((uint64_t)CFSTR("body"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentView component](self, "component");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentTextStyleForIdentifiers:component:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    -[SXComponentView DOMObjectProvider](self, "DOMObjectProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = CFSTR("default");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v25, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXComponentView component](self, "component");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "componentTextStyleForIdentifiers:component:", v11, v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[SXComponentView DOMObjectProvider](self, "DOMObjectProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXFullscreenCaption caption]((uint64_t)v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "textStyle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentView component](self, "component");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "classification");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentView component](self, "component");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "componentTextStyleForIdentifier:classification:component:", v15, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    v20 = objc_msgSend(v19, "fontScaling");
  else
    v20 = 1;
  v21 = [SXTextResizer alloc];
  -[SXComponentView documentColumnLayout](self, "documentColumnLayout");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[SXTextResizer initWithColumnLayout:defaultTextStyle:fontScalingEnabled:]((id *)&v21->super.isa, v22, v9, v20);

  return v23;
}

- (id)textRulesForCaption:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[SXComponentView component](self, "component", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "classification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textRules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)textStyleForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[SXComponentView DOMObjectProvider](self, "DOMObjectProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentView component](self, "component");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textStyleForIdentifier:component:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)componentTextStyleForIdentifier:(id)a3 inheritingFromComponentTextStyle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[SXComponentView DOMObjectProvider](self, "DOMObjectProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentView component](self, "component");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentTextStyleForIdentifier:inheritingFromComponentTextStyle:component:", v7, v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)contentSizeCategoryForCaption:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[SXComponentView presentationDelegate](self, "presentationDelegate", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentationAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentSizeCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)submitEvents
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SXScalableImageComponentView;
  -[SXMediaComponentView submitEvents](&v3, sel_submitEvents);
  -[SXScalableImageComponentView finishMediaViewEvent](self, "finishMediaViewEvent");
}

- (unint64_t)analyticsMediaType
{
  return 4;
}

- (void)createMediaViewEvent
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[SXScalableImageComponentView activeViewEvent](self, "activeViewEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[SXScalableImageComponentView imageView](self, "imageView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "image");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      return;
    -[SXMediaComponentView mediaEventForClass:](self, "mediaEventForClass:", objc_opt_class());
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[SXScalableImageComponentView setActiveViewEvent:](self, "setActiveViewEvent:", v6);
    v3 = v6;
  }

}

- (void)finishMediaViewEvent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SXScalableImageComponentView activeViewEvent](self, "activeViewEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SXScalableImageComponentView activeViewEvent](self, "activeViewEvent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "determineEndDate");

    -[SXMediaComponentView analyticsReporting](self, "analyticsReporting");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXScalableImageComponentView activeViewEvent](self, "activeViewEvent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reportEvent:", v6);

    -[SXScalableImageComponentView setActiveViewEvent:](self, "setActiveViewEvent:", 0);
  }
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  CGSize v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[SXScalableImageComponentView imageResource](self, "imageResource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dimensions");
  NSStringFromCGSize(v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>: %@"), v4, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (BOOL)allowHierarchyRemoval
{
  unsigned __int8 v3;
  void *v4;
  char v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SXScalableImageComponentView;
  v3 = -[SXComponentView allowHierarchyRemoval](&v7, sel_allowHierarchyRemoval);
  -[SXScalableImageComponentView fullScreenCanvasController](self, "fullScreenCanvasController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFullscreen");

  return v3 & ~v5;
}

- (SXImageViewFactory)imageViewFactory
{
  return self->_imageViewFactory;
}

- (SXFullscreenCanvasControllerFactory)canvasControllerFactory
{
  return self->_canvasControllerFactory;
}

- (SXMediaSharingPolicyProvider)mediaSharingPolicyProvider
{
  return self->_mediaSharingPolicyProvider;
}

- (SXDragManager)dragManager
{
  return self->_dragManager;
}

- (void)setDragManager:(id)a3
{
  objc_storeStrong((id *)&self->_dragManager, a3);
}

- (SXImageView)imageView
{
  return self->_imageView;
}

- (SXImageResource)imageResource
{
  return self->_imageResource;
}

- (void)setImageResource:(id)a3
{
  objc_storeStrong((id *)&self->_imageResource, a3);
}

- (SXFullscreenCanvasController)fullScreenCanvasController
{
  return self->_fullScreenCanvasController;
}

- (void)setFullScreenCanvasController:(id)a3
{
  objc_storeStrong((id *)&self->_fullScreenCanvasController, a3);
}

- (SXMediaViewEvent)activeViewEvent
{
  return self->_activeViewEvent;
}

- (void)setActiveViewEvent:(id)a3
{
  objc_storeStrong((id *)&self->_activeViewEvent, a3);
}

- (CGRect)previousContentFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_previousContentFrame.origin.x;
  y = self->_previousContentFrame.origin.y;
  width = self->_previousContentFrame.size.width;
  height = self->_previousContentFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPreviousContentFrame:(CGRect)a3
{
  self->_previousContentFrame = a3;
}

- (UIView)gestureView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_gestureView);
}

- (void)setGestureView:(id)a3
{
  objc_storeWeak((id *)&self->_gestureView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_gestureView);
  objc_storeStrong((id *)&self->_activeViewEvent, 0);
  objc_storeStrong((id *)&self->_fullScreenCanvasController, 0);
  objc_storeStrong((id *)&self->_imageResource, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_dragManager, 0);
  objc_storeStrong((id *)&self->_mediaSharingPolicyProvider, 0);
  objc_storeStrong((id *)&self->_canvasControllerFactory, 0);
  objc_storeStrong((id *)&self->_imageViewFactory, 0);
}

@end
