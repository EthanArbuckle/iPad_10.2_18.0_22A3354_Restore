@implementation THPageLayerAndSubviewHost

- (THPageLayerAndSubviewHost)initWithPageInfo:(id)a3 scrimEnabled:(BOOL)a4 delegate:(id)a5
{
  _BOOL4 v6;
  THPageLayerAndSubviewHost *v8;
  THPageLayerAndSubviewHost *v9;
  CALayer *v10;
  double y;
  CALayer *v12;
  CALayer *v13;
  objc_super v15;
  CALayer *pageContainerLayer;
  CALayer *borderLayer;

  v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)THPageLayerAndSubviewHost;
  v8 = -[THPageLayerAndSubviewHost init](&v15, "init");
  v9 = v8;
  if (v8)
  {
    v8->_delegate = (THPageLayerAndSubviewHostDelegate *)a5;
    v8->_pageInfo = (THModelPageInfo *)a3;
    v9->_view = (UIView *)objc_alloc_init(THPageLayerAndSubviewHostView);
    v9->_borderView = (UIView *)objc_alloc_init(THPageLayerAndSubviewNoHitView);
    v9->_containerView = (UIView *)objc_alloc_init(THPageLayerAndSubviewNoHitView);
    -[CALayer setZPosition:](-[UIView layer](v9->_borderView, "layer"), "setZPosition:", -1.0);
    v9->_pageHostLayer = (TSDTilingHostingLayer *)objc_alloc_init((Class)TSDTilingHostingLayer);
    v9->_pageContainerLayer = (CALayer *)objc_alloc_init((Class)TSDNoDefaultImplicitActionLayer);
    v10 = (CALayer *)objc_alloc_init((Class)TSDNoDefaultImplicitActionLayer);
    v9->_borderLayer = v10;
    y = CGPointZero.y;
    -[CALayer setAnchorPoint:](v10, "setAnchorPoint:", CGPointZero.x, y);
    -[CALayer setBorderColor:](v9->_borderLayer, "setBorderColor:", objc_msgSend(objc_msgSend(+[TSUColor blackColor](TSUColor, "blackColor"), "colorWithAlphaComponent:", 0.1), "CGColor"));
    -[CALayer setBorderWidth:](v9->_borderLayer, "setBorderWidth:", 1.0);
    borderLayer = v9->_borderLayer;
    -[CALayer setSublayers:](-[UIView layer](v9->_borderView, "layer"), "setSublayers:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &borderLayer, 1));
    -[UIView setClipsToBounds:](v9->_containerView, "setClipsToBounds:", 1);
    -[UIView setBackgroundColor:](v9->_containerView, "setBackgroundColor:", objc_msgSend(+[TSUColor whiteColor](TSUColor, "whiteColor"), "platformColor"));
    -[CALayer addSublayer:](-[UIView layer](v9->_containerView, "layer"), "addSublayer:", v9->_pageHostLayer);
    v12 = (CALayer *)objc_alloc_init((Class)TSDNoDefaultImplicitActionLayer);
    v9->_previewLayer = v12;
    -[CALayer setAnchorPoint:](v12, "setAnchorPoint:", CGPointZero.x, y);
    if (v6)
    {
      v13 = (CALayer *)objc_alloc_init((Class)TSDNoDefaultImplicitActionLayer);
      v9->_scrimLayer = v13;
      -[CALayer setAnchorPoint:](v13, "setAnchorPoint:", CGPointZero.x, y);
      -[CALayer setBackgroundColor:](v9->_scrimLayer, "setBackgroundColor:", objc_msgSend(objc_msgSend(+[TSUColor whiteColor](TSUColor, "whiteColor"), "colorWithAlphaComponent:", 0.15), "CGColor"));
      -[CALayer setHidden:](v9->_scrimLayer, "setHidden:", 1);
    }
    -[CALayer setHidden:](v9->_previewLayer, "setHidden:", 1);
    -[UIView addSubview:](v9->_view, "addSubview:", v9->_containerView);
    -[CALayer addSublayer:](-[UIView layer](v9->_view, "layer"), "addSublayer:", v9->_previewLayer);
    if (v9->_scrimLayer)
      -[CALayer addSublayer:](-[UIView layer](v9->_view, "layer"), "addSublayer:", v9->_scrimLayer);
    pageContainerLayer = v9->_pageContainerLayer;
    -[TSDTilingHostingLayer setSublayers:](v9->_pageHostLayer, "setSublayers:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &pageContainerLayer, 1));
    v9->_subviewsController = (TSDCanvasSubviewsController *)objc_msgSend(objc_alloc((Class)TSDCanvasSubviewsController), "initWithLayerAndSubviewHost:", v9);
    v9->_previewState = 0;
    v9->_visible = 1;
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[TSDTilingHostingLayer setController:](self->_pageHostLayer, "setController:", 0);

  if (-[UIView superview](self->_view, "superview"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPageLayerAndSubviewHost dealloc]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageLayerAndSubviewHost.m"), 193, CFSTR("expected nil value for '%s'"), "_view.superview");
  -[UIView removeFromSuperview](self->_view, "removeFromSuperview");

  if (-[UIView superview](self->_borderView, "superview"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPageLayerAndSubviewHost dealloc]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageLayerAndSubviewHost.m"), 196, CFSTR("expected nil value for '%s'"), "_borderView.superview");
  -[UIView removeFromSuperview](self->_borderView, "removeFromSuperview");

  v3.receiver = self;
  v3.super_class = (Class)THPageLayerAndSubviewHost;
  -[THPageLayerAndSubviewHost dealloc](&v3, "dealloc");
}

- (void)teardown
{
  if (self->_rep)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPageLayerAndSubviewHost teardown]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageLayerAndSubviewHost.m"), 212, CFSTR("expected nil value for '%s'"), "_rep");
  -[THPageLayerAndSubviewHost setRep:](self, "setRep:", 0);
  -[TSDCanvasSubviewsController teardown](self->_subviewsController, "teardown");
  if (-[UIView superview](self->_view, "superview"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPageLayerAndSubviewHost teardown]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageLayerAndSubviewHost.m"), 215, CFSTR("expected nil value for '%s'"), "_view.superview");
  -[UIView removeFromSuperview](self->_view, "removeFromSuperview");
  if (-[UIView superview](self->_borderView, "superview"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPageLayerAndSubviewHost teardown]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageLayerAndSubviewHost.m"), 217, CFSTR("expected nil value for '%s'"), "_borderView.superview");
  -[UIView removeFromSuperview](self->_borderView, "removeFromSuperview");
}

- (void)setRep:(id)a3
{
  if (self->_rep != a3)
  {
    self->_rep = (TSDRep *)a3;
    -[TSDTilingHostingLayer setController:](self->_pageHostLayer, "setController:", objc_msgSend(a3, "interactiveCanvasController"));
    -[TSDTilingHostingLayer setDelegate:](self->_pageHostLayer, "setDelegate:", -[TSDRep interactiveCanvasController](self->_rep, "interactiveCanvasController"));
    -[CALayer setDelegate:](self->_pageContainerLayer, "setDelegate:", -[TSDRep interactiveCanvasController](self->_rep, "interactiveCanvasController"));
  }
}

- (void)recycle
{
  if (self->_rep)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPageLayerAndSubviewHost recycle]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageLayerAndSubviewHost.m"), 234, CFSTR("expected nil value for '%s'"), "_rep");
  -[THPageLayerAndSubviewHostDelegate pageLayerAndSubviewHostRecycle:](self->_delegate, "pageLayerAndSubviewHostRecycle:", self);
}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[UIView setHidden:](-[THPageLayerAndSubviewHost view](self, "view"), "setHidden:", a3);
  -[UIView setHidden:](-[THPageLayerAndSubviewHost borderView](self, "borderView"), "setHidden:", v3);
}

- (void)p_layoutLayersWithFrame:(CGRect)a3
{
  double x;
  double y;
  double width;
  double height;
  CGRect v8;
  CGRect v9;

  v8.origin.x = TSDRectWithSize(self);
  x = v8.origin.x;
  y = v8.origin.y;
  width = v8.size.width;
  height = v8.size.height;
  v9 = CGRectInset(v8, -1.0, -1.0);
  -[CALayer setFrame:](self->_borderLayer, "setFrame:", v9.origin.x, v9.origin.y, v9.size.width, v9.size.height);
  -[CALayer setFrame:](self->_previewLayer, "setFrame:", x, y, width, height);
  -[CALayer setFrame:](self->_scrimLayer, "setFrame:", x, y, width, height);
}

- (void)setFrame
{
  id v3;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPageLayerAndSubviewHost setFrame]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageLayerAndSubviewHost.m"), 254, CFSTR("This operation must only be performed on the main thread."));
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    v3 = -[UIView setBounds:](self->_view, "setBounds:", TSDRectWithSize(-[UIView setFrame:](self->_view, "setFrame:", self->_canvasBoundsFrame.origin.x, self->_canvasBoundsFrame.origin.y, self->_canvasBoundsFrame.size.width, self->_canvasBoundsFrame.size.height)));
    -[UIView setFrame:](self->_containerView, "setFrame:", TSDRectWithSize(v3));
    -[UIView setBounds:](self->_containerView, "setBounds:", self->_canvasBoundsFrame.origin.x, self->_canvasBoundsFrame.origin.y, self->_canvasBoundsFrame.size.width, self->_canvasBoundsFrame.size.height);
    -[UIView setFrame:](self->_borderView, "setFrame:", self->_canvasBoundsFrame.origin.x, self->_canvasBoundsFrame.origin.y, self->_canvasBoundsFrame.size.width, self->_canvasBoundsFrame.size.height);
    -[THPageLayerAndSubviewHost p_layoutLayersWithFrame:](self, "p_layoutLayersWithFrame:", self->_canvasBoundsFrame.origin.x, self->_canvasBoundsFrame.origin.y, self->_canvasBoundsFrame.size.width, self->_canvasBoundsFrame.size.height);
    +[CATransaction commit](CATransaction, "commit");
  }
}

- (void)setUnscaledFrame:(CGRect)a3 unscaledLayerOffset:(CGPoint)a4 viewScale:(double)a5
{
  double y;
  double x;
  CGFloat v9;
  CGFloat v10;
  CGFloat width;
  CGFloat height;
  double v13;
  double v14;
  CALayer *pageContainerLayer;
  CATransform3D v17;
  CATransform3D v18;
  CGRect v19;

  y = a4.y;
  x = a4.x;
  v19.origin.x = TSDMultiplyRectScalar((__n128)a3.origin, *(__n128 *)&a3.origin.y, (__n128)a3.size, *(__n128 *)&a3.size.height, a5);
  v9 = v19.origin.x;
  v10 = v19.origin.y;
  width = v19.size.width;
  height = v19.size.height;
  if (!CGRectEqualToRect(v19, self->_canvasBoundsFrame))
  {
    self->_canvasBoundsFrame.origin.x = v9;
    self->_canvasBoundsFrame.origin.y = v10;
    self->_canvasBoundsFrame.size.width = width;
    self->_canvasBoundsFrame.size.height = height;
    -[THPageLayerAndSubviewHost setFrame](self, "setFrame");
  }
  v13 = TSDMultiplyPointScalar(x, y, a5);
  if (v13 != self->_layerBoundsOffset.x || v14 != self->_layerBoundsOffset.y)
  {
    self->_layerBoundsOffset.x = v13;
    self->_layerBoundsOffset.y = v14;
    CATransform3DMakeTranslation(&v18, v13, v14, 0.0);
    pageContainerLayer = self->_pageContainerLayer;
    v17 = v18;
    -[CALayer setSublayerTransform:](pageContainerLayer, "setSublayerTransform:", &v17);
  }
}

- (id)p_largeThumbnail
{
  uint64_t v3;
  double v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  THModelContentNode *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  unint64_t v14;
  id v15;

  v3 = objc_opt_class(THDocumentRoot);
  *(_QWORD *)&v4 = TSUDynamicCast(v3, objc_msgSend(-[THModelPageInfo context](self->_pageInfo, "context"), "documentRoot")).n128_u64[0];
  v6 = v5;
  v7 = objc_msgSend(objc_msgSend(v5, "tocModel", v4), "tiles");
  v8 = objc_msgSend(v6, "navigationModel");
  v9 = -[THModelPageInfo parent](self->_pageInfo, "parent");
  v10 = objc_msgSend(v8, "navigationUnitContainingContentNode:", v9);
  v11 = objc_msgSend(objc_msgSend(v8, "navigationUnits"), "indexOfObject:", v10);
  v12 = -[THModelNode absolutePageIndexForRelativePageIndex:forPresentationType:](v9, "absolutePageIndexForRelativePageIndex:forPresentationType:", -[THModelPageInfo relativePageIndexInParent](self->_pageInfo, "relativePageIndexInParent"), -[THModelNode paginatedPresentationType](v9, "paginatedPresentationType"));
  if (v12 == (id)0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v13 = objc_msgSend(v10, "relativePageIndexForAbsolutePageIndex:forPresentationType:", v12, -[THModelNode paginatedPresentationType](v9, "paginatedPresentationType"));
  if (v13 == (id)0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v14 = (unint64_t)v13;
  if (v11 >= objc_msgSend(objc_msgSend(v8, "navigationUnits"), "count"))
    return 0;
  v15 = objc_msgSend(v7, "objectAtIndex:", v11);
  if (v14 >= (unint64_t)objc_msgSend(objc_msgSend(v15, "largerThumbs"), "count"))
    return 0;
  else
    return +[TSUImage imageWithCGImage:](TSUImage, "imageWithCGImage:", +[TSDBitmapImageProvider temporaryCGImageForImageData:](TSDBitmapImageProvider, "temporaryCGImageForImageData:", objc_msgSend(objc_msgSend(v15, "largerThumbs"), "objectAtIndex:", v14)));
}

- (void)loadPreviewOnQueue:(id)a3
{
  int previewState;
  _QWORD block[5];

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPageLayerAndSubviewHost loadPreviewOnQueue:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageLayerAndSubviewHost.m"), 326, CFSTR("This operation must only be performed on the main thread."));
  previewState = self->_previewState;
  if (previewState == 3)
  {
    self->_previewState = 2;
    -[CALayer removeAllAnimations](self->_previewLayer, "removeAllAnimations");
    -[CALayer removeAllAnimations](self->_scrimLayer, "removeAllAnimations");
  }
  else if (!previewState)
  {
    self->_previewState = 1;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_147360;
    block[3] = &unk_426DD0;
    block[4] = self;
    dispatch_async((dispatch_queue_t)a3, block);
  }
}

- (void)unloadPreviewAnimated:(BOOL)a3
{
  unsigned int previewState;
  CABasicAnimation *v5;
  double v6;
  double v7;
  CABasicAnimation *v8;
  double v9;
  double v10;
  _QWORD v11[5];

  previewState = self->_previewState;
  if (previewState >= 2)
  {
    if (previewState == 2)
    {
      if (a3)
      {
        self->_previewState = 3;
        +[CATransaction begin](CATransaction, "begin");
        +[CATransaction setAnimationDuration:](CATransaction, "setAnimationDuration:", 0.2);
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = sub_147648;
        v11[3] = &unk_426DD0;
        v11[4] = self;
        +[CATransaction setCompletionBlock:](CATransaction, "setCompletionBlock:", v11);
        v5 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("opacity"));
        -[CABasicAnimation setFromValue:](v5, "setFromValue:", -[CALayer valueForKeyPath:](-[CALayer presentationLayer](self->_previewLayer, "presentationLayer"), "valueForKeyPath:", CFSTR("opacity")));
        LODWORD(v6) = 0;
        -[CABasicAnimation setToValue:](v5, "setToValue:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v6));
        -[CALayer addAnimation:forKey:](self->_previewLayer, "addAnimation:forKey:", v5, CFSTR("opacity"));
        LODWORD(v7) = 0;
        -[CALayer setOpacity:](self->_previewLayer, "setOpacity:", v7);
        if (self->_scrimLayer)
        {
          v8 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("opacity"));
          -[CABasicAnimation setFromValue:](v8, "setFromValue:", -[CALayer valueForKeyPath:](-[CALayer presentationLayer](self->_scrimLayer, "presentationLayer"), "valueForKeyPath:", CFSTR("opacity")));
          LODWORD(v9) = 0;
          -[CABasicAnimation setToValue:](v8, "setToValue:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v9));
          -[CALayer addAnimation:forKey:](self->_scrimLayer, "addAnimation:forKey:", v8, CFSTR("opacity"));
          LODWORD(v10) = 0;
          -[CALayer setOpacity:](self->_scrimLayer, "setOpacity:", v10);
        }
        +[CATransaction commit](CATransaction, "commit");
      }
      else
      {
        +[CATransaction begin](CATransaction, "begin");
        self->_previewState = 0;
        -[CALayer setContents:](self->_previewLayer, "setContents:", 0);
        -[CALayer setHidden:](self->_previewLayer, "setHidden:", 1);
        -[CALayer setHidden:](self->_scrimLayer, "setHidden:", 1);
        +[CATransaction commit](CATransaction, "commit");
      }
    }
  }
  else
  {
    self->_previewState = 0;
  }
}

- (UIViewController)containerViewController
{
  return (UIViewController *)objc_msgSend(objc_msgSend(-[TSDRep interactiveCanvasController](self->_rep, "interactiveCanvasController"), "layerHost"), "viewController");
}

- (id)topLevelReps
{
  return objc_msgSend((id)TSUProtocolCast(&OBJC_PROTOCOL___TSDContainerRep, self->_rep), "childReps");
}

- (void)updateTopLevelLayers
{
  id v3;

  v3 = objc_alloc_init((Class)NSMutableArray);
  objc_msgSend(v3, "addObject:", self->_pageContainerLayer);
  objc_msgSend(v3, "addObjectsFromArray:", -[TSDCanvasSubviewsController updateAlternateLayersForViews](self->_subviewsController, "updateAlternateLayersForViews"));
  if ((objc_msgSend(v3, "isEqualToArray:", -[TSDTilingHostingLayer sublayers](self->_pageHostLayer, "sublayers")) & 1) == 0)-[TSDTilingHostingLayer setSublayers:](self->_pageHostLayer, "setSublayers:", v3);

}

- (NSString)description
{
  objc_class *v3;
  NSString *v4;
  THModelPageInfo *pageInfo;
  TSDRep *rep;
  CGRect v8;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  pageInfo = self->_pageInfo;
  rep = self->_rep;
  -[UIView frame](self->_view, "frame");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p; pageInfo=%@ rep=%p frame=%@ view=%@>"),
           v4,
           self,
           pageInfo,
           rep,
           NSStringFromCGRect(v8),
           self->_view);
}

- (UIView)view
{
  return self->_view;
}

- (UIView)borderView
{
  return self->_borderView;
}

- (CGRect)canvasBoundsFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_canvasBoundsFrame.origin.x;
  y = self->_canvasBoundsFrame.origin.y;
  width = self->_canvasBoundsFrame.size.width;
  height = self->_canvasBoundsFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)visible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (CALayer)containerLayer
{
  return self->_pageContainerLayer;
}

- (TSDCanvasSubviewsController)subviewsController
{
  return self->_subviewsController;
}

- (CALayer)topLevelTilingLayer
{
  return (CALayer *)self->_pageHostLayer;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (THModelPageInfo)pageInfo
{
  return self->_pageInfo;
}

- (TSDRep)rep
{
  return self->_rep;
}

@end
