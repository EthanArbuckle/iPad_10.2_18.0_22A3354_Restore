@implementation THWClippingLayerHost

- (THWClippingLayerHost)init
{
  THWClippingLayerHost *v2;
  CALayer *v3;
  TSDCanvasLayer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)THWClippingLayerHost;
  v2 = -[THWClippingLayerHost init](&v6, "init");
  if (v2)
  {
    v3 = (CALayer *)objc_alloc_init((Class)TSDNoDefaultImplicitActionLayer);
    v2->_layer = v3;
    -[CALayer setMasksToBounds:](v3, "setMasksToBounds:", 1);
    v4 = (TSDCanvasLayer *)objc_alloc_init((Class)TSDCanvasLayer);
    v2->_canvasLayer = v4;
    -[CALayer addSublayer:](v2->_layer, "addSublayer:", v4);
    v2->_subviewsController = (TSDCanvasSubviewsController *)objc_msgSend(objc_alloc((Class)TSDCanvasSubviewsController), "initWithLayerAndSubviewHost:", v2);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWClippingLayerHost;
  -[THWClippingLayerHost dealloc](&v3, "dealloc");
}

- (void)setInteractiveCanvasController:(id)a3
{
  self->_interactiveCanvasController = (TSDInteractiveCanvasController *)a3;
  -[TSDCanvasLayer setController:](-[THWClippingLayerHost canvasLayer](self, "canvasLayer"), "setController:", a3);
}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[CALayer frame](self->_layer, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  double v9;
  double v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = -[CALayer bounds](self->_layer, "bounds");
  -[CALayer setBounds:](self->_layer, "setBounds:", TSDRectWithOriginAndSize(v8, v9, v10, width, height));
  -[CALayer setPosition:](self->_layer, "setPosition:", TSDCenterOfRect(x, y, width, height));
}

- (void)teardownAndTransferCanvasLayersToHost:(id)a3
{
  id v5;

  v5 = objc_msgSend(-[TSDCanvasLayer sublayers](self->_canvasLayer, "sublayers"), "copy");
  -[TSDCanvasLayer setSublayers:](self->_canvasLayer, "setSublayers:", 0);
  objc_msgSend(objc_msgSend(a3, "canvasLayer"), "setSublayers:", v5);

  -[THWClippingLayerHost teardown](self, "teardown");
  -[CALayer removeFromSuperlayer](self->_layer, "removeFromSuperlayer");

  self->_layer = 0;
}

- (void)presentError:(id)a3 completionHandler:(id)a4
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3, a4), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWClippingLayerHost presentError:completionHandler:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/THWClippingLayerHost.m"), 85, CFSTR("should present error"));
}

- (void)presentErrors:(id)a3 withLocalizedDescription:(id)a4 completionHandler:(id)a5
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3, a4, a5), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWClippingLayerHost presentErrors:withLocalizedDescription:completionHandler:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/THWClippingLayerHost.m"), 90, CFSTR("should present error"));
}

- (void)presentMovieCompatibilityAlertForUnplayableMovieURLs:(id)a3 completionHandler:(id)a4
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3, a4), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWClippingLayerHost presentMovieCompatibilityAlertForUnplayableMovieURLs:completionHandler:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/THWClippingLayerHost.m"), 97, CFSTR("should present error"));
}

- (void)presentMovieCompatibilityAlertForUnplayableMoviePasteboardDrawableProviders:(id)a3 completionHandler:(id)a4
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3, a4), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWClippingLayerHost presentMovieCompatibilityAlertForUnplayableMoviePasteboardDrawableProviders:completionHandler:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/THWClippingLayerHost.m"), 102, CFSTR("should present error"));
}

- (void)beginModalOperationWithLocalizedMessage:(id)a3 progress:(id)a4 cancelHandler:(id)a5
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3, a4, a5), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWClippingLayerHost beginModalOperationWithLocalizedMessage:progress:cancelHandler:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/THWClippingLayerHost.m"), 111, CFSTR("should not be called"));
}

- (void)endModalOperation
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWClippingLayerHost endModalOperation]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/THWClippingLayerHost.m"), 116, CFSTR("should not be called"));
}

- (BOOL)isViewLoaded
{
  return 0;
}

- (BOOL)becomeFirstResponder
{
  return 0;
}

- (BOOL)resignFirstResponder
{
  return 0;
}

- (void)teardown
{
  -[CALayer setDelegate:](self->_layer, "setDelegate:", 0);
  -[TSDCanvasLayer teardown](self->_canvasLayer, "teardown");
  -[TSDCanvasSubviewsController teardown](self->_subviewsController, "teardown");
  if (objc_msgSend(-[TSDCanvasSubviewsController repChildViews](self->_subviewsController, "repChildViews"), "count"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWClippingLayerHost teardown]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/THWClippingLayerHost.m"), 151, CFSTR("subviews of layerhost %@ not torn down: %@"), self, -[TSDCanvasSubviewsController repChildViews](self->_subviewsController, "repChildViews"));
  -[TSDInteractiveCanvasController i_layerHostHasBeenTornDown](self->_interactiveCanvasController, "i_layerHostHasBeenTornDown");
}

- (id)undoManager
{
  return 0;
}

- (BOOL)isInFocusedContainer
{
  return 0;
}

- (TSDCanvasView)canvasView
{
  return 0;
}

- (CALayer)clippingLayer
{
  return self->_layer;
}

- (id)newMoviePlaybackHUDWithFrame:(CGRect)a3 playerController:(id)a4 movieRep:(id)a5
{
  return 0;
}

- (id)newAudioPlaybackHUDWithFrame:(CGRect)a3 audioRep:(id)a4 delegate:(id)a5
{
  return 0;
}

- (id)newAnnotationPopoverController
{
  return 0;
}

- (void)promptForAnnotationAuthorNameWithCompletionBlock:(id)a3
{
  if (a3)
    (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (id)asiOSCVC
{
  return 0;
}

- (id)viewController
{
  return 0;
}

- (CGPoint)contentOffset
{
  double v2;
  double v3;
  CGPoint result;

  -[CALayer bounds](-[THWClippingLayerHost clippingLayer](self, "clippingLayer"), "bounds");
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setContentOffset:(CGPoint)a3
{
  double y;
  double x;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  y = a3.y;
  x = a3.x;
  v6 = -[CALayer bounds](-[THWClippingLayerHost clippingLayer](self, "clippingLayer"), "bounds");
  v9 = TSDRectWithOriginAndSize(v6, x, y, v7, v8);
  -[CALayer setBounds:](-[THWClippingLayerHost clippingLayer](self, "clippingLayer"), "setBounds:", v9, v10, v11, v12);
}

- (UIView)containerView
{
  return 0;
}

- (UIViewController)containerViewController
{
  return 0;
}

- (id)topLevelReps
{
  return objc_msgSend(-[TSDInteractiveCanvasController canvas](-[THWClippingLayerHost interactiveCanvasController](self, "interactiveCanvasController"), "canvas"), "topLevelReps");
}

- (TSDCanvasSubviewsController)subviewsController
{
  return self->_subviewsController;
}

- (TSDInteractiveCanvasController)interactiveCanvasController
{
  return self->_interactiveCanvasController;
}

- (CALayer)layer
{
  return self->_layer;
}

- (TSDCanvasLayer)canvasLayer
{
  return self->_canvasLayer;
}

@end
