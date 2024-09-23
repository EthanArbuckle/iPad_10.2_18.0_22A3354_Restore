@implementation UIWebPlugInView

- (UIWebPlugInView)initWithWebView:(id)a3 plugInView:(id)a4
{
  UIWebPlugInView *v6;
  UIWebPlugInView *v7;
  CFRunLoopObserverContext context;

  v6 = -[UIWebPlugInView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    v6->_webView = (UIWebDocumentView *)a3;
    if (a4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v7->_uiView = (UIView *)a4;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[UIView performSelector:withObject:](v7->_uiView, "performSelector:withObject:", sel_setWAKView_, v7);
      v7->_parentedInLayer = 0;
      memset(&context, 0, sizeof(context));
      context.info = v7->_uiView;
      v7->_mainRunLoopDrawObserver = CFRunLoopObserverCreate(0, 0xA0uLL, 0, 2500000, (CFRunLoopObserverCallBack)MainRunLoopDidDraw, &context);
    }
    else
    {
      NSLog(CFSTR("Plug-in view is not a UIView: %@"), a4);

      return 0;
    }
  }
  return v7;
}

- (void)dealloc
{
  __CFRunLoop *Main;
  int v4;
  UIView *uiView;
  objc_super v6;

  Main = CFRunLoopGetMain();
  CFRunLoopRemoveObserver(Main, self->_mainRunLoopDrawObserver, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
  CFRelease(self->_mainRunLoopDrawObserver);
  v4 = pthread_main_np();
  uiView = self->_uiView;
  if (v4 == 1)

  else
    -[UIView performSelectorOnMainThread:withObject:waitUntilDone:](uiView, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_release, 0, 0);

  v6.receiver = self;
  v6.super_class = (Class)UIWebPlugInView;
  -[UIWebPlugInView dealloc](&v6, sel_dealloc);
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  objc_super v16;
  CGRect v17;
  CGRect v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIWebPlugInView frame](self, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16.receiver = self;
  v16.super_class = (Class)UIWebPlugInView;
  -[UIWebPlugInView setFrame:](&v16, sel_setFrame_, x, y, width, height);
  v17.origin.x = v9;
  v17.origin.y = v11;
  v17.size.width = v13;
  v17.size.height = v15;
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  if (!CGRectEqualToRect(v17, v18))
    -[UIWebPlugInView reshape](self, "reshape");
}

- (void)setFrameSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v11;

  height = a3.height;
  width = a3.width;
  -[UIWebPlugInView frame](self, "frame");
  v7 = v6;
  v9 = v8;
  v11.receiver = self;
  v11.super_class = (Class)UIWebPlugInView;
  -[UIWebPlugInView setFrameSize:](&v11, sel_setFrameSize_, width, height);
  if (v7 != width || v9 != height)
    -[UIWebPlugInView reshape](self, "reshape");
}

- (void)viewDidMoveToWindow
{
  int v3;
  objc_super v4;
  CGRect v5;

  v4.receiver = self;
  v4.super_class = (Class)UIWebPlugInView;
  -[UIWebPlugInView viewDidMoveToWindow](&v4, sel_viewDidMoveToWindow);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = -[UIView willEnterFullScreen](self->_uiView, "willEnterFullScreen");
  else
    v3 = 0;
  -[UIWebPlugInView bounds](self, "bounds");
  if (!CGRectIsEmpty(v5) || v3)
    WebThreadRunOnMainThread();
}

uint64_t __38__UIWebPlugInView_viewDidMoveToWindow__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_viewDidMoveToWindowOnMainThread");
}

- (void)invalidateGState
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIWebPlugInView;
  -[UIWebPlugInView invalidateGState](&v3, sel_invalidateGState);
  -[UIWebPlugInView reshape](self, "reshape");
}

- (id)plugInView
{
  return self->_uiView;
}

- (BOOL)isParented
{
  return -[CALayer superlayer](-[UIView layer](self->_uiView, "layer"), "superlayer") != 0;
}

- (void)reshape
{
  _QWORD block[5];

  if (WebThreadIsCurrent())
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __26__UIWebPlugInView_reshape__block_invoke;
    block[3] = &unk_1E16B41B8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  if (-[UIWebPlugInView window](self, "window"))
  {
    if (!-[UIWebPlugInView isParented](self, "isParented"))
      -[UIWebPlugInView viewDidMoveToWindow](self, "viewDidMoveToWindow");
  }
}

uint64_t __26__UIWebPlugInView_reshape__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reshapeOnMainThread");
}

- (void)layout
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIView webPlugInLayout](self->_uiView, "webPlugInLayout");
}

- (void)drawRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGContext *v8;
  float v9;
  int *ContextStack;
  CALayer *v11;
  _QWORD *v12;
  uint64_t v13;
  __CFRunLoop *Main;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (CGContext *)WKGetCurrentGraphicsContext();
  if (CGContextGetType() == 1)
  {
    CGContextSaveGState(v8);
    if (self->_parentedInLayer)
    {
      -[UIWebDocumentView _documentScale](self->_webView, "_documentScale");
      CGContextScaleCTM(v8, 1.0 / v9, 1.0 / v9);
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      UIGraphicsPushContext(v8);
      -[UIView drawRectForPrinting:](self->_uiView, "drawRectForPrinting:", x, y, width, height);
      ContextStack = (int *)GetContextStack(0);
      PopContextFromStack(ContextStack);
    }
    else
    {
      v11 = -[UIView layer](self->_uiView, "layer");
      v12 = GetContextStack(0);
      if (*(int *)v12 < 1)
        v13 = 0;
      else
        v13 = v12[3 * (*(_DWORD *)v12 - 1) + 1];
      -[CALayer renderInContext:](v11, "renderInContext:", v13);
    }
    CGContextRestoreGState(v8);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    Main = CFRunLoopGetMain();
    CFRunLoopAddObserver(Main, self->_mainRunLoopDrawObserver, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
  }
}

- (void)webPlugInInitialize
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIView webPlugInInitialize](self->_uiView, "webPlugInInitialize");
}

- (void)webPlugInStart
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIView webPlugInStart](self->_uiView, "webPlugInStart");
}

- (void)webPlugInStop
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIView webPlugInStop](self->_uiView, "webPlugInStop");
}

- (void)webPlugInDestroy
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIView webPlugInDestroy](self->_uiView, "webPlugInDestroy");
}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIWebPlugInView;
  if (-[UIWebPlugInView respondsToSelector:](&v5, sel_respondsToSelector_))
    v3 = 1;
  else
    v3 = objc_opt_respondsToSelector();
  return v3 & 1;
}

- (void)forwardInvocation:(id)a3
{
  objc_super v5;

  objc_msgSend(a3, "selector");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a3, "invokeWithTarget:", self->_uiView);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)UIWebPlugInView;
    -[UIWebPlugInView forwardInvocation:](&v5, sel_forwardInvocation_, a3);
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_opt_class(), "instanceMethodSignatureForSelector:", a3);
  if (!result)
    return (id)-[UIView methodSignatureForSelector:](self->_uiView, "methodSignatureForSelector:", a3);
  return result;
}

- (id)objectForWebScript
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (id)-[UIView objectForWebScript](self->_uiView, "objectForWebScript");
  else
    return 0;
}

- (void)mouseDown:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend((id)WebThreadMakeNSInvocation(), "setArgument:atIndex:", &v3, 2);
  WebThreadCallDelegate();
}

- (void)mouseUp:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend((id)WebThreadMakeNSInvocation(), "setArgument:atIndex:", &v3, 2);
  WebThreadCallDelegate();
}

- (void)setWebView:(id)a3
{
  UIWebDocumentView *webView;

  webView = self->_webView;
  if (webView != a3)
  {
    if (webView)
      -[UIWebDocumentView didRemovePlugInView:](webView, "didRemovePlugInView:", self);
    self->_webView = (UIWebDocumentView *)a3;
  }
}

- (BOOL)willProvidePluginLayer
{
  return self->_isQuickTimePlugIn || self->_isMapViewPlugIn || self->_isiAdPlugIn;
}

- (id)pluginLayer
{
  if (-[UIWebPlugInView isParentedInLayer](self, "isParentedInLayer"))
    return self->_hostingLayer;
  else
    return 0;
}

- (void)_connectPluginLayers
{
  CALayer *v3;
  CALayer *v4;

  WebThreadLock();
  if (!self->_hostingLayer)
    self->_hostingLayer = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
  -[CALayer insertSublayer:atIndex:](-[UIView layer](self->_webView, "layer"), "insertSublayer:atIndex:", self->_hostingLayer, 0);
  if (objc_msgSend(-[UIWebDocumentView webView](self->_webView, "webView"), "_setMediaLayer:forPluginView:", self->_hostingLayer, self))
  {
    -[UIWebPlugInView setParentedInLayer:](self, "setParentedInLayer:", 1);
    v3 = -[UIView layer](self->_uiView, "layer");
    v4 = v3;
    -[CALayer addSublayer:](self->_hostingLayer, "addSublayer:", v3);

    -[UIWebDocumentView _setSubviewCachesNeedUpdate:](self->_webView, "_setSubviewCachesNeedUpdate:", 1);
    -[UIWebPlugInView _reshapeOnMainThread](self, "_reshapeOnMainThread");
  }
}

- (void)_disconnectPluginLayers
{
  CALayer *v3;
  CALayer *v4;

  if (-[UIWebPlugInView isParentedInLayer](self, "isParentedInLayer"))
  {
    WebThreadLock();
    v3 = -[UIView layer](self->_uiView, "layer");
    v4 = v3;
    objc_msgSend(-[UIWebDocumentView webView](self->_webView, "webView"), "_setMediaLayer:forPluginView:", 0, self);
    -[CALayer addSublayer:](-[UIView layer](self->_webView, "layer"), "addSublayer:", v3);

    -[UIWebPlugInView setParentedInLayer:](self, "setParentedInLayer:", 0);
    -[UIWebPlugInView _reshapeOnMainThread](self, "_reshapeOnMainThread");
    -[UIWebDocumentView _setSubviewCachesNeedUpdate:](self->_webView, "_setSubviewCachesNeedUpdate:", 1);
  }
}

- (void)_attachPluginLayerOnMainThread
{
  if (!-[UIWebPlugInView isParentedInLayer](self, "isParentedInLayer")
    && self->_webView
    && (UIWebDocumentView *)-[UIView superview](self->_uiView, "superview") == self->_webView)
  {
    -[UIWebPlugInView _connectPluginLayers](self, "_connectPluginLayers");
  }
}

- (void)attachPluginLayer
{
  _QWORD block[5];

  if (-[UIWebPlugInView willProvidePluginLayer](self, "willProvidePluginLayer"))
  {
    if (WebThreadIsCurrent())
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __36__UIWebPlugInView_attachPluginLayer__block_invoke;
      block[3] = &unk_1E16B41B8;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
    else
    {
      -[UIWebPlugInView _attachPluginLayerOnMainThread](self, "_attachPluginLayerOnMainThread");
    }
  }
}

uint64_t __36__UIWebPlugInView_attachPluginLayer__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_attachPluginLayerOnMainThread");
}

- (void)detachPluginLayer
{
  _QWORD block[5];

  if (-[UIWebPlugInView willProvidePluginLayer](self, "willProvidePluginLayer"))
  {
    if (WebThreadIsCurrent())
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __36__UIWebPlugInView_detachPluginLayer__block_invoke;
      block[3] = &unk_1E16B41B8;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
    else
    {
      -[UIWebPlugInView _detachPluginLayerOnMainThread](self, "_detachPluginLayerOnMainThread");
    }
  }
}

uint64_t __36__UIWebPlugInView_detachPluginLayer__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_detachPluginLayerOnMainThread");
}

- (BOOL)isParentedInLayer
{
  return self->_parentedInLayer;
}

- (void)setParentedInLayer:(BOOL)a3
{
  self->_parentedInLayer = a3;
}

- (BOOL)isQuickTimePlugIn
{
  return self->_isQuickTimePlugIn;
}

- (void)setIsQuickTimePlugIn:(BOOL)a3
{
  self->_isQuickTimePlugIn = a3;
}

- (BOOL)isMapViewPlugIn
{
  return self->_isMapViewPlugIn;
}

- (void)setIsMapViewPlugIn:(BOOL)a3
{
  self->_isMapViewPlugIn = a3;
}

- (BOOL)isiAdPlugIn
{
  return self->_isiAdPlugIn;
}

- (void)setIsiAdPlugIn:(BOOL)a3
{
  self->_isiAdPlugIn = a3;
}

- (void)_reshapeOnMainThread
{
  float v3;
  CALayer *hostingLayer;
  CATransform3D v5;
  CGAffineTransform m;
  CGAffineTransform v7;
  CGAffineTransform v8;
  CGRect v9;
  CGRect v10;
  CGRect v11;
  CGRect v12;
  CGRect v13;

  if (!self->_isFullScreen)
  {
    if (self->_parentedInLayer)
    {
      -[UIWebDocumentView _documentScale](self->_webView, "_documentScale");
      memset(&v8, 0, sizeof(v8));
      CGAffineTransformMakeScale(&v8, v3, v3);
      memset(&v7, 0, sizeof(v7));
      m = v8;
      CGAffineTransformInvert(&v7, &m);
      hostingLayer = self->_hostingLayer;
      m = v7;
      CATransform3DMakeAffineTransform(&v5, &m);
      -[CALayer setTransform:](hostingLayer, "setTransform:", &v5);
      -[CALayer bounds](self->_hostingLayer, "bounds");
      m = v8;
      v10 = CGRectApplyAffineTransform(v9, &m);
      v11 = CGRectIntegral(v10);
      -[UIView setFrame:](self->_uiView, "setFrame:", v11.origin.x, v11.origin.y, v11.size.width, v11.size.height);
    }
    else
    {
      -[UIWebPlugInView bounds](self, "bounds");
      -[UIWebPlugInView convertRect:toView:](self, "convertRect:toView:", 0);
      v13 = CGRectIntegral(v12);
      -[UIView setFrame:](self->_uiView, "setFrame:", v13.origin.x, v13.origin.y, v13.size.width, v13.size.height);
    }
  }
}

- (void)_viewDidMoveToWindowOnMainThread
{
  if (-[UIWebPlugInView window](self, "window"))
  {
    -[UIView addSubview:](self->_webView, "addSubview:", self->_uiView);
    -[UIWebPlugInView _connectPluginLayers](self, "_connectPluginLayers");
  }
  else
  {
    -[UIWebPlugInView _disconnectPluginLayers](self, "_disconnectPluginLayers");
    -[UIView removeFromSuperview](self->_uiView, "removeFromSuperview");

    self->_hostingLayer = 0;
    -[UIWebDocumentView didRemovePlugInView:](self->_webView, "didRemovePlugInView:", self);
    self->_webView = 0;
  }
}

@end
