@implementation THInteractiveCanvasController

- (void)dealloc
{
  objc_super v3;

  -[THInteractiveCanvasController p_releaseOutlets](self, "p_releaseOutlets");
  v3.receiver = self;
  v3.super_class = (Class)THInteractiveCanvasController;
  -[THInteractiveCanvasController dealloc](&v3, "dealloc");
}

- (void)p_releaseOutlets
{
  -[THInteractiveCanvasController setITunesMobileContext:](self, "setITunesMobileContext:", 0);
  -[THInteractiveCanvasController setMaskLayer:](self, "setMaskLayer:", 0);
}

- (THTextInputResponder)th_textInputResponder
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = objc_opt_class(THTextInputResponder, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController textInputResponder](self, "textInputResponder"));
  v5 = TSUDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return (THTextInputResponder *)v6;
}

- (id)textInputResponder
{
  uint64_t v3;
  void *v4;
  void *v5;
  THTextInputResponder *v6;
  void *v7;
  void *v8;
  THTextInputResponder *v9;
  void *v10;

  v3 = OBJC_IVAR___TSDInteractiveCanvasController_mTextInputResponder;
  if (!*(_QWORD *)&self->TSAInteractiveCanvasController_opaque[OBJC_IVAR___TSDInteractiveCanvasController_mTextInputResponder])
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController layerHost](self, "layerHost"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "canvasView"));

    if (v5)
    {
      v6 = [THTextInputResponder alloc];
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController layerHost](self, "layerHost"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "canvasView"));
      v9 = -[THTextInputResponder initWithNextResponder:](v6, "initWithNextResponder:", v8);
      v10 = *(void **)&self->TSAInteractiveCanvasController_opaque[v3];
      *(_QWORD *)&self->TSAInteractiveCanvasController_opaque[v3] = v9;

    }
  }
  return *(id *)&self->TSAInteractiveCanvasController_opaque[v3];
}

- (id)hitRep:(CGPoint)a3 allowsAllReps:(BOOL)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)THInteractiveCanvasController;
  v6 = -[THInteractiveCanvasController hitRep:](&v15, "hitRep:", a3.x, a3.y);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  -[THInteractiveCanvasController p_trackProgressForRep:](self, "p_trackProgressForRep:", v7);
  if (a4
    || (v9 = objc_opt_class(TSWPRep, v8), (objc_opt_isKindOfClass(v7, v9) & 1) != 0)
    || (v11 = objc_opt_class(THPageRep, v10), (objc_opt_isKindOfClass(v7, v11) & 1) != 0))
  {
    v12 = v7;
  }
  else
  {
    v12 = 0;
  }
  v13 = v12;

  return v13;
}

- (id)hitRep:(CGPoint)a3
{
  return -[THInteractiveCanvasController hitRep:allowsAllReps:](self, "hitRep:allowsAllReps:", 0, a3.x, a3.y);
}

- (BOOL)supportsReadingHighlights
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController bookAnnotationController](self, "bookAnnotationController"));
  v3 = objc_msgSend(v2, "canReadAnnotations");

  return v3;
}

- (BOOL)supportsWritingHighlights
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController bookAnnotationController](self, "bookAnnotationController"));
  v3 = objc_msgSend(v2, "canModifyAnnotations");

  return v3;
}

- (id)additionalLayersUnderRepLayers
{
  return -[THInteractiveCanvasController backgroundLayers](self, "backgroundLayers");
}

- (id)additionalLayersOverRepLayers
{
  return -[THInteractiveCanvasController foregroundLayers](self, "foregroundLayers");
}

- (BOOL)shouldEverShowPathHighlightOnInvisibleShapes
{
  return 0;
}

- (BOOL)isCompactHeight
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = objc_opt_class(THiOSCanvasViewController, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController layerHost](self, "layerHost"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "asiOSCVC"));
  v6 = TSUDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "traitsCache"));
  LOBYTE(v5) = objc_msgSend(v8, "isCompactHeight");

  return (char)v5;
}

- (BOOL)isCompactWidth
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = objc_opt_class(THiOSCanvasViewController, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController layerHost](self, "layerHost"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "asiOSCVC"));
  v6 = TSUDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "traitsCache"));
  LOBYTE(v5) = objc_msgSend(v8, "isCompactWidth");

  return (char)v5;
}

- (void)p_adjustMaskLayerOnScrollView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  id v38;

  if (!self->mHoistedMaskLayer)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController layerHost](self, "layerHost", a3));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "canvasLayer"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mask"));
    objc_msgSend(v6, "frame");
    v8 = v7;
    v10 = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController layerHost](self, "layerHost"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "canvasLayer"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController layerHost](self, "layerHost"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "clippingLayer"));
    objc_msgSend(v14, "bounds");
    v16 = v15;
    v18 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController layerHost](self, "layerHost"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "clippingLayer"));
    objc_msgSend(v12, "convertPoint:toLayer:", v20, v16, v18);

    v21 = TSDAddPoints(-[THInteractiveCanvasController maskLayerOrigin](self, "maskLayerOrigin"));
    v23 = v22;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController layerHost](self, "layerHost"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "canvasLayer"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController layerHost](self, "layerHost"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "clippingLayer"));
    objc_msgSend(v25, "convertRect:fromLayer:", v27, v21, v23, v8, v10);
    v29 = v28;
    v31 = v30;
    v33 = v32;
    v35 = v34;

    v38 = (id)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController layerHost](self, "layerHost"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "canvasLayer"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "mask"));
    objc_msgSend(v37, "setFrame:", v29, v31, v33, v35);

  }
}

- (void)p_updateMaskLayer
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  if (!self->mHoistedMaskLayer)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController delegate](self, "delegate"));
    v4 = TSUProtocolCast(&OBJC_PROTOCOL___THInteractiveCanvasControllerDelegate, v3);
    v15 = (id)objc_claimAutoreleasedReturnValue(v4);

    if ((objc_opt_respondsToSelector(v15, "interactiveCanvasController:maskLayerForBounds:") & 1) != 0)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController layerHost](self, "layerHost"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "clippingLayer"));
      v7 = objc_msgSend(v15, "interactiveCanvasController:maskLayerForBounds:", self, TSDRectWithSize(objc_msgSend(v6, "bounds")));
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[THNoAnimationLayerDelegate sharedInstance](THNoAnimationLayerDelegate, "sharedInstance"));
      objc_msgSend(v8, "setDelegate:", v9);

    }
    else
    {
      v8 = 0;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController maskLayer](self, "maskLayer"));

    if (v8 != v10)
    {
      -[THInteractiveCanvasController setMaskLayer:](self, "setMaskLayer:", v8);
      if (v8)
      {
        objc_msgSend(v8, "frame");
        -[THInteractiveCanvasController setMaskLayerOrigin:](self, "setMaskLayerOrigin:");
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController layerHost](self, "layerHost"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "canvasLayer"));
        objc_msgSend(v12, "setMask:", v8);

        v13 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController canvasView](self, "canvasView"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "enclosingScrollView"));
        -[THInteractiveCanvasController p_adjustMaskLayerOnScrollView:](self, "p_adjustMaskLayerOnScrollView:", v14);
      }
      else
      {
        -[THInteractiveCanvasController setMaskLayerOrigin:](self, "setMaskLayerOrigin:", CGPointZero.x, CGPointZero.y);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController layerHost](self, "layerHost"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "canvasLayer"));
        objc_msgSend(v14, "setMask:", 0);
      }

    }
  }
}

- (void)p_hoistMaskLayer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (!self->mHoistedMaskLayer
    || (v3 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler")),
        v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THInteractiveCanvasController p_hoistMaskLayer]")), v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THInteractiveCanvasController.m")), objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, v5, 291, CFSTR("mask layer has already been hoisted")), v5, v4, v3,
        !self->mHoistedMaskLayer))
  {
    self->mHoistedMaskLayer = 1;
    v10 = (id)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController layerHost](self, "layerHost"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "canvasLayer"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController layerHost](self, "layerHost"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "clippingLayer"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "superlayer"));
    -[THInteractiveCanvasController p_moveMaskFromLayer:toLayer:](self, "p_moveMaskFromLayer:toLayer:", v6, v9);

  }
}

- (void)p_unhoistMaskLayer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (self->mHoistedMaskLayer
    || (v3 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler")),
        v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THInteractiveCanvasController p_unhoistMaskLayer]")), v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THInteractiveCanvasController.m")), objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, v5, 303, CFSTR("mask layer hasn't been hoisted")), v5, v4, v3,
        self->mHoistedMaskLayer))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController layerHost](self, "layerHost"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "clippingLayer"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "superlayer"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController layerHost](self, "layerHost"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "canvasLayer"));
    -[THInteractiveCanvasController p_moveMaskFromLayer:toLayer:](self, "p_moveMaskFromLayer:toLayer:", v8, v10);

    self->mHoistedMaskLayer = 0;
  }
}

- (void)p_moveMaskFromLayer:(id)a3 toLayer:(id)a4
{
  id v5;
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
  id v17;

  v17 = a3;
  v5 = a4;
  if (v17 && v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "mask"));

    if (!v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THInteractiveCanvasController p_moveMaskFromLayer:toLayer:]"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THInteractiveCanvasController.m"));
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, v9, 316, CFSTR("source layer should have a mask"));

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mask"));

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THInteractiveCanvasController p_moveMaskFromLayer:toLayer:]"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THInteractiveCanvasController.m"));
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, v13, 317, CFSTR("destination layer should not have a mask"));

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "mask"));
    objc_msgSend(v14, "frame");
    objc_msgSend(v5, "convertRect:fromLayer:", v17);
    objc_msgSend(v14, "setFrame:");
    objc_msgSend(v5, "setMask:", v14);
    objc_msgSend(v17, "setMask:", 0);
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THInteractiveCanvasController p_moveMaskFromLayer:toLayer:]"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THInteractiveCanvasController.m"));
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, v16, 313, CFSTR("Invalid parameter not satisfying: %s"), "sourceLayer != nil && destinationLayer != nil");

  }
}

- (void)canvasDidLayout:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THInteractiveCanvasController;
  -[THInteractiveCanvasController canvasDidLayout:](&v4, "canvasDidLayout:", a3);
  -[THInteractiveCanvasController p_updateMaskLayer](self, "p_updateMaskLayer");
}

- (BOOL)suppressDoubleTapForSelection
{
  if (-[THInteractiveCanvasController isCompactWidth](self, "isCompactWidth"))
    return 1;
  else
    return -[THInteractiveCanvasController isCompactHeight](self, "isCompactHeight");
}

- (BOOL)zoomColumnAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;

  y = a3.y;
  x = a3.x;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController delegate](self, "delegate"));
  v7 = TSUProtocolCast(&OBJC_PROTOCOL___THInteractiveCanvasControllerDelegate, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if ((objc_opt_respondsToSelector(v8, "interactiveCanvasControllerShouldAllowZoomToColumn:") & 1) != 0
    && objc_msgSend(v8, "interactiveCanvasControllerShouldAllowZoomToColumn:", self))
  {
    v9 = -[THInteractiveCanvasController p_zoomColumnAtPoint:forceWpRep:](self, "p_zoomColumnAtPoint:forceWpRep:", 0, x, y);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)zoomToColumnWithFrame:(CGRect)a3
{
  return -[THInteractiveCanvasController p_zoomColumnAtPoint:forceWpRep:](self, "p_zoomColumnAtPoint:forceWpRep:", 1, TSDCenterOfRect(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height));
}

- (BOOL)dynamicallyZooming
{
  return self->TSAInteractiveCanvasController_opaque[OBJC_IVAR___TSDInteractiveCanvasController_mDynamicallyZooming];
}

- (BOOL)handleHyperlinksWithTextGRs
{
  return 1;
}

- (id)linkForHyperlinkField:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  THModelLink *v7;
  void *v8;
  void *v9;
  THModelLink *v10;
  uint64_t v11;
  void *v12;
  THModelLink *v13;
  void *v14;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "url"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController documentRoot](self, "documentRoot"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "scheme"));

  if (v6)
  {
    v7 = [THModelLink alloc];
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "absoluteString"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "context"));
    v10 = -[THModelLink initWithTarget:context:](v7, "initWithTarget:context:", v8, v9);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "absoluteString"));
    if (objc_msgSend(v8, "hasPrefix:", CFSTR("OPS/")))
    {
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "substringFromIndex:", 4));

      v8 = (void *)v11;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/OPS/"), "stringByAppendingString:", v8));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("apub:///0/0/0%@"), v9));
    v13 = [THModelLink alloc];
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "context"));
    v10 = -[THModelLink initWithTarget:context:](v13, "initWithTarget:context:", v12, v14);

  }
  return v10;
}

- (void)handleHyperlinkGesture:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (objc_msgSend(v10, "state") == (char *)&dword_0 + 3)
  {
    if (objc_msgSend(v10, "wasTapHold"))
      +[TSWPEditMenuController hideEditMenu](TSWPEditMenuController, "hideEditMenu");
    v5 = objc_opt_class(THWPRep, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "hitRep"));
    v7 = TSUDynamicCast(v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "hitField"));
    -[THInteractiveCanvasController handleHyperlink:hitRep:](self, "handleHyperlink:hitRep:", v9, v8);

  }
}

- (id)bookNavigator
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController delegate](self, "delegate"));
  v4 = TSUProtocolCast(&OBJC_PROTOCOL___THInteractiveCanvasControllerDelegate, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  if ((objc_opt_respondsToSelector(v5, "bookNavigatorForInteractiveCanvasController:") & 1) != 0)
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bookNavigatorForInteractiveCanvasController:", self));
  else
    v6 = 0;

  return v6;
}

- (id)documentNavigator
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController delegate](self, "delegate"));
  v4 = TSUProtocolCast(&OBJC_PROTOCOL___THInteractiveCanvasControllerDelegate, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  if ((objc_opt_respondsToSelector(v5, "documentNavigatorForInteractiveCanvasController:") & 1) != 0)
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "documentNavigatorForInteractiveCanvasController:", self));
  else
    v6 = 0;

  return v6;
}

- (void)handleHyperlink:(id)a3 hitRep:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "url"));
  if (objc_msgSend(v7, "th_shouldSharedAppDelegateHandleURL"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[TSKApplicationDelegate sharedDelegate](TSKApplicationDelegate, "sharedDelegate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController documentRoot](self, "documentRoot"));
    objc_msgSend(v8, "openURL:sourceDocumentRoot:", v7, v9);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController bookNavigator](self, "bookNavigator"));
    v10 = objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController documentNavigator](self, "documentNavigator"));
    v9 = (void *)v10;
    if (v8 && v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "parentStorage"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "linkForURL:inStorage:", v7, v11));

      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "anchorFromLink:", v12));
      v15 = objc_opt_class(THModelGlossaryEntryAnchor, v14);
      v16 = TSUDynamicCast(v15, v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "glossaryEntry"));

      if (v18)
      {
        -[THInteractiveCanvasController i_handleGlossaryHyperlink:rep:anchor:](self, "i_handleGlossaryHyperlink:rep:anchor:", v20, v6, v17);
      }
      else
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[TSWPHyperlinkUIController sharedHyperlinkUIController](TSWPHyperlinkUIController, "sharedHyperlinkUIController"));
        objc_msgSend(v19, "endUISession");

        objc_msgSend(v8, "recordOutgoingMajorNavigationJump");
        objc_msgSend(v8, "followLink:", v12);
      }

    }
  }

}

- (void)handleHyperlinkWithURL:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (objc_msgSend(v11, "th_shouldSharedAppDelegateHandleURL"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[TSKApplicationDelegate sharedDelegate](TSKApplicationDelegate, "sharedDelegate"));
    objc_msgSend(v4, "openURL:", v11);
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController bookNavigator](self, "bookNavigator"));
    v5 = objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController documentNavigator](self, "documentNavigator"));
    v6 = (void *)v5;
    if (v4 && v5)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController documentNavigator](self, "documentNavigator"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentContentNode"));

      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "linkForURL:inContentNode:", v11, v8));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[TSWPHyperlinkUIController sharedHyperlinkUIController](TSWPHyperlinkUIController, "sharedHyperlinkUIController"));
      objc_msgSend(v10, "endUISession");

      objc_msgSend(v4, "recordOutgoingMajorNavigationJump");
      objc_msgSend(v4, "followLink:", v9);

    }
  }

}

- (BOOL)gestureHitLink:(id)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController p_gestureHitLink:](self, "p_gestureHitLink:", a3));
  v4 = v3 != 0;

  return v4;
}

- (BOOL)spellCheckingSuppressed
{
  return 1;
}

- (BOOL)shouldShowTextOverflowGlyphs
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", kTHShowTextOverflowIndicator[0]);

  return v3;
}

- (THAnnotationStorageController)bookAnnotationController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController documentRoot](self, "documentRoot"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "annotationController"));

  return (THAnnotationStorageController *)v3;
}

- (void)setSelection:(id)a3 onModel:(id)a4 withFlags:(unint64_t)a5
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THInteractiveCanvasController;
  -[THInteractiveCanvasController setSelection:onModel:withFlags:](&v5, "setSelection:onModel:withFlags:", a3, a4, a5 & 0xFFFFFFFFFFFFFFAFLL);
}

- (BOOL)handleDoubleTapAtPoint:(CGPoint)a3
{
  return 0;
}

- (void)updateBookmarkVisibleState
{
  -[THInteractiveCanvasController makeRepsRecursivelyPerformSelectorIfImplemented:](self, "makeRepsRecursivelyPerformSelectorIfImplemented:", "updateBookmarkVisibleState");
}

- (void)updateBookmarkStatusAnimated:(BOOL)a3
{
  char **v3;

  v3 = &selRef_updateBookmarkStatusAnimated;
  if (!a3)
    v3 = &selRef_updateBookmarkStatus;
  -[THInteractiveCanvasController makeRepsRecursivelyPerformSelectorIfImplemented:](self, "makeRepsRecursivelyPerformSelectorIfImplemented:", *v3);
}

- (void)makeRepsRecursivelyPerformSelectorIfImplemented:(SEL)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController canvas](self, "canvas", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topLevelReps"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "recursivelyPerformSelectorIfImplemented:", a3);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (CGRect)visibleUnscaledRectForContent
{
  double x;
  double y;
  double width;
  double height;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  void *v11;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect result;
  CGRect v31;

  -[THInteractiveCanvasController visibleBoundsRect](self, "visibleBoundsRect");
  x = v24.origin.x;
  y = v24.origin.y;
  width = v24.size.width;
  height = v24.size.height;
  if (!CGRectIsEmpty(v24))
  {
    v25.origin.x = x;
    v25.origin.y = y;
    v25.size.width = width;
    v25.size.height = height;
    v26 = CGRectInset(v25, -width, -height);
    v7 = v26.origin.x;
    v8 = v26.origin.y;
    v9 = v26.size.width;
    v10 = v26.size.height;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController layerHost](self, "layerHost"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "canvasLayer"));
    objc_msgSend(v12, "bounds");
    v31.origin.x = v13;
    v31.origin.y = v14;
    v31.size.width = v15;
    v31.size.height = v16;
    v27.origin.x = v7;
    v27.origin.y = v8;
    v27.size.width = v9;
    v27.size.height = v10;
    v28 = CGRectIntersection(v27, v31);
    x = v28.origin.x;
    y = v28.origin.y;
    width = v28.size.width;
    height = v28.size.height;

    v29.origin.x = x;
    v29.origin.y = y;
    v29.size.width = width;
    v29.size.height = height;
    if (CGRectIsEmpty(v29))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THInteractiveCanvasController visibleUnscaledRectForContent]"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THInteractiveCanvasController.m"));
      objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, v19, 583, CFSTR("shouldn't result in an empty rect"));

    }
  }
  -[THInteractiveCanvasController convertBoundsToUnscaledRect:](self, "convertBoundsToUnscaledRect:", x, y, width, height);
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (double)visibleHeight
{
  void *v2;
  void *v3;
  void *v4;
  double Height;
  CGRect v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController canvasView](self, "canvasView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "enclosingScrollView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layer"));
  objc_msgSend(v4, "bounds");
  Height = CGRectGetHeight(v7);

  return Height;
}

- (void)beginStaticLayoutAndRender
{
  void *v3;
  void *v4;
  double v5;
  id v6;

  self->mWasThreadedLayoutAndRenderEnabled = -[THInteractiveCanvasController allowLayoutAndRenderOnThread](self, "allowLayoutAndRenderOnThread");
  -[THInteractiveCanvasController setAllowLayoutAndRenderOnThread:](self, "setAllowLayoutAndRenderOnThread:", 1);
  -[THInteractiveCanvasController setStaticLayoutAndRenderOnThread:](self, "setStaticLayoutAndRenderOnThread:", 1);
  v6 = (id)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController canvasView](self, "canvasView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "enclosingScrollView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layer"));
  LODWORD(v5) = 0;
  objc_msgSend(v4, "setOpacity:", v5);

}

- (void)endStaticLayoutAndRender:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  id v11;

  v3 = a3;
  if ((-[THInteractiveCanvasController staticLayoutAndRenderOnThread](self, "staticLayoutAndRenderOnThread") & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THInteractiveCanvasController endStaticLayoutAndRender:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THInteractiveCanvasController.m"));
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, v7, 611, CFSTR("didn't begin static layout and render"));

  }
  if (-[THInteractiveCanvasController staticLayoutAndRenderOnThread](self, "staticLayoutAndRenderOnThread"))
  {
    -[THInteractiveCanvasController setAllowLayoutAndRenderOnThread:](self, "setAllowLayoutAndRenderOnThread:", self->mWasThreadedLayoutAndRenderEnabled);
    -[THInteractiveCanvasController setStaticLayoutAndRenderOnThread:](self, "setStaticLayoutAndRenderOnThread:", 0);
    -[THInteractiveCanvasController layoutIfNeeded](self, "layoutIfNeeded");
    if (v3)
      +[CATransaction flush](CATransaction, "flush");
    v11 = (id)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController canvasView](self, "canvasView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "enclosingScrollView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layer"));
    LODWORD(v10) = 1.0;
    objc_msgSend(v9, "setOpacity:", v10);

  }
}

- (void)didBeginFreeTransform
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  -[THInteractiveCanvasController endEditing](self, "endEditing");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController canvas](self, "canvas"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topLevelReps"));
  v5 = objc_msgSend(v4, "copy");

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), "recursivelyPerformSelectorIfImplemented:", "canvasDidBeginFreeTransform", (_QWORD)v14);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController delegate](self, "delegate"));
  v12 = TSUProtocolCast(&OBJC_PROTOCOL___THInteractiveCanvasControllerDelegate, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  if ((objc_opt_respondsToSelector(v13, "interactiveCanvasControllerFreeTransformWillBegin:") & 1) != 0)
    objc_msgSend(v13, "interactiveCanvasControllerFreeTransformWillBegin:", self);

}

- (void)didEndFreeTransform
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController canvas](self, "canvas"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topLevelReps"));
  v5 = objc_msgSend(v4, "copy");

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), "recursivelyPerformSelectorIfImplemented:", "canvasDidEndFreeTransform", (_QWORD)v14);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController delegate](self, "delegate"));
  v12 = TSUProtocolCast(&OBJC_PROTOCOL___THInteractiveCanvasControllerDelegate, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  if ((objc_opt_respondsToSelector(v13, "interactiveCanvasControllerFreeTransformDidEnd:") & 1) != 0)
    objc_msgSend(v13, "interactiveCanvasControllerFreeTransformDidEnd:", self);

}

- (void)didLayoutAndRenderOnThread
{
  void *v3;
  void *v4;
  void *v5;
  double v6;

  if (-[THInteractiveCanvasController staticLayoutAndRenderOnThread](self, "staticLayoutAndRenderOnThread"))
  {
    if (!-[THInteractiveCanvasController suppressRevealScrollViewOnLayoutAndRender](self, "suppressRevealScrollViewOnLayoutAndRender"))
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController canvasView](self, "canvasView"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "enclosingScrollView"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layer"));
      LODWORD(v6) = 1.0;
      objc_msgSend(v5, "setOpacity:", v6);

      +[CATransaction flush](CATransaction, "flush");
    }
  }
}

- (id)canvasEditor
{
  uint64_t v3;
  void *v5;
  int v6;
  THCanvasEditor *v7;
  void *v8;

  v3 = OBJC_IVAR___TSDInteractiveCanvasController_mCanvasEditor;
  if (!*(_QWORD *)&self->TSAInteractiveCanvasController_opaque[OBJC_IVAR___TSDInteractiveCanvasController_mCanvasEditor])
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController documentRoot](self, "documentRoot"));
    if (v5)
    {
      v6 = self->TSAInteractiveCanvasController_opaque[OBJC_IVAR___TSDInteractiveCanvasController_mHasBeenTornDown];

      if (!v6)
      {
        v7 = -[THCanvasEditor initWithInteractiveCanvasController:]([THCanvasEditor alloc], "initWithInteractiveCanvasController:", self);
        v8 = *(void **)&self->TSAInteractiveCanvasController_opaque[v3];
        *(_QWORD *)&self->TSAInteractiveCanvasController_opaque[v3] = v7;

      }
    }
  }
  return *(id *)&self->TSAInteractiveCanvasController_opaque[v3];
}

- (void)setITunesMobileContext:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *miTunesMobileContext;

  v4 = a3;
  if (v4 && self->miTunesMobileContext)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THInteractiveCanvasController setITunesMobileContext:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THInteractiveCanvasController.m"));
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, v7, 677, CFSTR("context does not support simultaneous uses"));

  }
  miTunesMobileContext = self->miTunesMobileContext;
  self->miTunesMobileContext = v4;

}

- ($666C738BFF45484503FF79351D233943)wordMetricsAtPoint:(SEL)a3
{
  double y;
  double x;
  __int128 v8;
  CGSize v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  double v19;
  $666C738BFF45484503FF79351D233943 *result;
  CGPoint v21;
  CGSize v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  y = a4.y;
  x = a4.x;
  v8 = *((_OWORD *)&TSWPEmptyWordMetrics + 3);
  *(_OWORD *)&retstr->var1 = *((_OWORD *)&TSWPEmptyWordMetrics + 2);
  *(_OWORD *)&retstr->var3 = v8;
  *(_QWORD *)&retstr->var5 = *((_QWORD *)&TSWPEmptyWordMetrics + 8);
  v9 = (CGSize)*((_OWORD *)&TSWPEmptyWordMetrics + 1);
  retstr->var0.origin = *(CGPoint *)&TSWPEmptyWordMetrics;
  retstr->var0.size = v9;
  v10 = objc_opt_class(TSWPRep, a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController hitRep:](self, "hitRep:", x, y));
  v12 = TSUDynamicCast(v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  if (v13)
  {
    objc_msgSend(v13, "convertNaturalPointFromUnscaledCanvas:", x, y);
    v14 = objc_msgSend(v13, "charIndexFromPoint:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:isAtEndOfLine:leadingEdge:", 0, 1, 0, 0, 0);
    if (v14 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v13, "wordMetricsAtCharIndex:", v14);
      *(_OWORD *)&retstr->var1 = v23;
      *(_OWORD *)&retstr->var3 = v24;
      *(_QWORD *)&retstr->var5 = v25;
      retstr->var0.origin = v21;
      retstr->var0.size = v22;
      objc_msgSend(v13, "convertNaturalRectToUnscaledCanvas:", retstr->var0.origin.x, retstr->var0.origin.y, retstr->var0.size.width, retstr->var0.size.height);
      retstr->var0.origin.x = v15;
      retstr->var0.origin.y = v16;
      retstr->var0.size.width = v17;
      retstr->var0.size.height = v18;
      objc_msgSend(v13, "convertNaturalPointToUnscaledCanvas:", 0.0, retstr->var1);
      retstr->var1 = v19;
    }
  }

  return result;
}

- (BOOL)handleSingleTapAtPoint:(CGPoint)a3
{
  double y;
  double x;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  uint64_t v14;

  y = a3.y;
  x = a3.x;
  v6 = objc_opt_class(THWPRep, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController hitRep:](self, "hitRep:", x, y));
  v8 = TSUDynamicCast(v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "highlightController"));
  v11 = objc_msgSend(v10, "isCanvasPointOnHighlight:", x, y);

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "highlightController"));
    objc_msgSend(v12, "showHighlightEditorForHighlightAtPoint:", x, y);
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController delegate](self, "delegate"));
    v14 = TSUProtocolCast(&OBJC_PROTOCOL___THInteractiveCanvasControllerDelegate, v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v14);

    if ((objc_opt_respondsToSelector(v12, "interactiveCanvasControllerWasTapped:") & 1) != 0)
      objc_msgSend(v12, "interactiveCanvasControllerWasTapped:", self);
  }

  -[THInteractiveCanvasController endEditing](self, "endEditing");
  return 1;
}

- (id)nsAttributedSubstringForStorage:(id)a3 range:(_NSRange)a4 rep:(id)a5 baselineOrigin:(CGPoint *)a6
{
  return 0;
}

- (void)i_handleGlossaryHyperlink:(id)a3 rep:(id)a4 anchor:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController layerHost](self, "layerHost"));
  v12 = TSUProtocolCast(&OBJC_PROTOCOL___THGlossaryPresenting, v11);
  v18 = (id)objc_claimAutoreleasedReturnValue(v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "glossaryEntry"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "term"));
  v15 = objc_msgSend(v10, "range");
  v17 = v16;

  objc_msgSend(v18, "presentGlossaryPopoverOfType:withTerm:rangeInRep:rep:", 0, v14, v15, v17, v9);
  -[THInteractiveCanvasController endEditing](self, "endEditing");

}

- (BOOL)p_handleTapAtPoint:(CGPoint)a3
{
  double y;
  double x;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned int v11;
  unsigned int v12;

  y = a3.y;
  x = a3.x;
  v6 = objc_opt_class(THWPRep, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController hitRep:allowsAllReps:](self, "hitRep:allowsAllReps:", 1, x, y));
  v8 = TSUDynamicCast(v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "highlightController"));
  v11 = objc_msgSend(v10, "isCanvasPointOnHighlight:", x, y);
  if (v11)
  {
    v12 = -[THInteractiveCanvasController supportsWritingHighlights](self, "supportsWritingHighlights");

    if (!v12)
    {
      LOBYTE(v11) = 0;
      goto LABEL_6;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "highlightController"));
    objc_msgSend(v10, "showHighlightMenuForHighlightAtPoint:", x, y);
  }

LABEL_6:
  return v11;
}

- (id)menuForHighlightAtLocation:(CGPoint)a3
{
  double y;
  double x;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;

  y = a3.y;
  x = a3.x;
  v6 = objc_opt_class(THWPRep, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController hitRep:allowsAllReps:](self, "hitRep:allowsAllReps:", 1, x, y));
  v8 = TSUDynamicCast(v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "highlightController"));
  if (objc_msgSend(v10, "isCanvasPointOnHighlight:", x, y))
  {
    v11 = -[THInteractiveCanvasController supportsWritingHighlights](self, "supportsWritingHighlights");

    if (!v11)
    {
      v12 = 0;
      goto LABEL_7;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "highlightController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "editMenuForHighlightAtPoint:", x, y));
  }
  else
  {
    v12 = 0;
  }

LABEL_7:
  return v12;
}

- (BOOL)p_handleLongPress:(id)a3
{
  id v4;
  unsigned int v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;

  v4 = a3;
  v5 = objc_msgSend(v4, "gestureState");
  switch(v5)
  {
    case 3u:
      if (!-[THInteractiveCanvasController selectOnLongPress](self, "selectOnLongPress"))
        break;
      objc_msgSend(v4, "unscaledLocationForICC:", self);
      v7 = v6;
      v9 = v8;
      v11 = objc_opt_class(THWPRep, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController hitRep:allowsAllReps:](self, "hitRep:allowsAllReps:", 1, v7, v9));
      v13 = TSUDynamicCast(v11, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

      if (objc_msgSend(v14, "shouldBeginEditingWithGesture:", v4))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "highlightController"));
        v16 = objc_msgSend(v15, "isCanvasPointOnHighlight:", v7, v9);

        if ((v16 & 1) == 0)
        {
          v18 = objc_opt_class(TSWPEditingController, v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController beginEditingRep:](self, "beginEditingRep:", v14));
          v20 = TSUDynamicCast(v18, v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

          if (v21)
          {
            objc_msgSend(v14, "convertNaturalPointFromUnscaledCanvas:", v7, v9);
            objc_msgSend(v21, "tappedInRep:point:tapCount:isTapHold:precise:", v14, 1, 1, 0);
          }

        }
      }
LABEL_12:

      break;
    case 2u:
      objc_msgSend(v4, "unscaledLocationForICC:", self);
      v23 = v22;
      v25 = v24;
      v27 = objc_opt_class(THWPRep, v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController hitRep:allowsAllReps:](self, "hitRep:allowsAllReps:", 1, v23, v25));
      v29 = TSUDynamicCast(v27, v28);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v29);

      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "highlightController"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "currentDragAnnotation"));
      -[THInteractiveCanvasController setSelectOnLongPress:](self, "setSelectOnLongPress:", v31 == 0);

      goto LABEL_12;
    case 1u:
      -[THInteractiveCanvasController setSelectOnLongPress:](self, "setSelectOnLongPress:", 1);
      break;
  }

  return 1;
}

- (void)willSetDocumentToMode:(int64_t)a3 fromMode:(int64_t)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  objc_super v17;

  v5 = a5;
  v9 = objc_opt_class(TSWPiOSCanvasViewController, a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController layerHost](self, "layerHost"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "asiOSCVC"));
  v12 = TSUDynamicCast(v9, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "hyperlinkGestureRecognizer"));
  v15 = objc_msgSend(v14, "isEnabled");

  v17.receiver = self;
  v17.super_class = (Class)THInteractiveCanvasController;
  -[THInteractiveCanvasController willSetDocumentToMode:fromMode:animated:](&v17, "willSetDocumentToMode:fromMode:animated:", a3, a4, v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "hyperlinkGestureRecognizer"));
  objc_msgSend(v16, "setEnabled:", v15);

}

- (void)didSetDocumentToMode:(int64_t)a3 fromMode:(int64_t)a4 animated:(BOOL)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)THInteractiveCanvasController;
  -[THInteractiveCanvasController didSetDocumentToMode:fromMode:animated:](&v6, "didSetDocumentToMode:fromMode:animated:", a3, a4, a5);
  -[THInteractiveCanvasController disableNormalGestures](self, "disableNormalGestures");
}

- (void)navigateToPreviousChapter
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController documentNavigator](self, "documentNavigator"));
  objc_msgSend(v2, "navigateByBookDirection:bookGranularity:", 2, 3);

}

- (void)navigateToNextChapter
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController documentNavigator](self, "documentNavigator"));
  objc_msgSend(v2, "navigateByBookDirection:bookGranularity:", 1, 3);

}

- (void)navigateToPreviousPage
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController documentNavigator](self, "documentNavigator"));
  objc_msgSend(v2, "navigateByBookDirection:bookGranularity:", 2, 1);

}

- (void)navigateToNextPage
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController documentNavigator](self, "documentNavigator"));
  objc_msgSend(v2, "navigateByBookDirection:bookGranularity:", 1, 1);

}

- (void)showDictionary:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  v6 = objc_opt_class(THWPEditingController, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController editorController](self, "editorController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textInputEditor"));
  v9 = TSUDynamicCast(v6, v8);
  v10 = (id)objc_claimAutoreleasedReturnValue(v9);

  objc_msgSend(v10, "showDictionary:", v4);
}

- (void)searchSelection:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  v6 = objc_opt_class(THWPEditingController, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController editorController](self, "editorController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textInputEditor"));
  v9 = TSUDynamicCast(v6, v8);
  v10 = (id)objc_claimAutoreleasedReturnValue(v9);

  objc_msgSend(v10, "searchSelection:", v4);
}

- (BOOL)canAddNote
{
  return -[THInteractiveCanvasController hasCurrentSelection](self, "hasCurrentSelection");
}

- (void)addNote:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  v6 = objc_opt_class(THWPEditingController, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController editorController](self, "editorController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textInputEditor"));
  v9 = TSUDynamicCast(v6, v8);
  v10 = (id)objc_claimAutoreleasedReturnValue(v9);

  objc_msgSend(v10, "addNote:", v4);
}

- (BOOL)canAddHighlight
{
  return -[THInteractiveCanvasController hasCurrentSelection](self, "hasCurrentSelection");
}

- (void)addHighlight:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v4 = a3;
  v6 = objc_opt_class(THWPEditingController, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController editorController](self, "editorController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textInputEditor"));
  v9 = TSUDynamicCast(v6, v8);
  v11 = (id)objc_claimAutoreleasedReturnValue(v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController bookAnnotationController](self, "bookAnnotationController"));
  objc_msgSend(v11, "addHighlightWithStyle:forSender:", objc_msgSend(v10, "currentAnnotationStyle"), v4);

}

- (void)removeNote:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  v6 = objc_opt_class(THWPEditingController, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController editorController](self, "editorController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textInputEditor"));
  v9 = TSUDynamicCast(v6, v8);
  v10 = (id)objc_claimAutoreleasedReturnValue(v9);

  objc_msgSend(v10, "removeNote:", v4);
}

- (void)removeNoteAndHighlight:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  v6 = objc_opt_class(THWPEditingController, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController editorController](self, "editorController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textInputEditor"));
  v9 = TSUDynamicCast(v6, v8);
  v10 = (id)objc_claimAutoreleasedReturnValue(v9);

  objc_msgSend(v10, "removeNoteAndHighlight:", v4);
}

- (void)changeAnnotationStyle:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  id v20;

  v20 = a3;
  v5 = objc_opt_class(THWPEditingController, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController editorController](self, "editorController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "textInputEditor"));
  v8 = TSUDynamicCast(v5, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  v11 = objc_opt_class(UICommand, v10);
  v12 = TSUDynamicCast(v11, v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = v13;
  if (v9)
    v15 = v13 == 0;
  else
    v15 = 1;
  if (!v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "propertyList"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("style")));

    if (v17)
    {
      v18 = (unint64_t)objc_msgSend(v17, "integerValue") - 1;
      if (v18 > 5)
        v19 = 0;
      else
        v19 = dword_313E28[v18];
      objc_msgSend(v9, "addHighlightWithStyle:forSender:", v19, v20);
      objc_msgSend(v9, "setSelection:", 0);
    }

  }
}

- (void)presentMenuAtCanvasPoint:(CGPoint)a3 forAnnotationUUID:(id)a4
{
  double y;
  double x;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  y = a3.y;
  x = a3.x;
  v10 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController delegate](self, "delegate"));
  v8 = TSUProtocolCast(&OBJC_PROTOCOL___THInteractiveCanvasControllerDelegate, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if ((objc_opt_respondsToSelector(v9, "interactiveCanvasController:wantsToPresentContextMenuAtCanvasPoint:forAnnotationUUID:") & 1) != 0)objc_msgSend(v9, "interactiveCanvasController:wantsToPresentContextMenuAtCanvasPoint:forAnnotationUUID:", self, v10, x, y);
}

- (BOOL)hasCurrentSelection
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  BOOL v9;

  v3 = objc_opt_class(THWPEditingController, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController editorController](self, "editorController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textInputEditor"));
  v6 = TSUDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringFromSelection"));
    v9 = objc_msgSend(v8, "length") != 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)annotationForUUID:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v4 = a3;
  v6 = objc_opt_class(THWPEditingController, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController editorController](self, "editorController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textInputEditor"));
  v9 = TSUDynamicCast(v6, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  if (v10)
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "annotationForUUID:", v4));
  else
    v11 = 0;

  return v11;
}

- (id)annotationForCurrentSelection
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = objc_opt_class(THWPEditingController, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController editorController](self, "editorController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textInputEditor"));
  v6 = TSUDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (v7)
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "annotationForCurrentSelection"));
  else
    v8 = 0;

  return v8;
}

- (id)annotationFromCurrentSelection
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = objc_opt_class(THWPEditingController, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController editorController](self, "editorController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textInputEditor"));
  v6 = TSUDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (v7)
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "annotationFromCurrentSelection"));
  else
    v8 = 0;

  return v8;
}

- (id)activityItemProviderForCurrentSelection
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = objc_opt_class(THWPEditingController, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController editorController](self, "editorController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textInputEditor"));
  v6 = TSUDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (v7)
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "activityItemProviderForCurrentSelection"));
  else
    v8 = 0;

  return v8;
}

- (id)p_gestureHitLink:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;

  objc_msgSend(a3, "unscaledLocationForICC:", self);
  v5 = v4;
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController hitRep:allowsAllReps:](self, "hitRep:allowsAllReps:", 1));
  v10 = objc_opt_class(THWPRep, v9);
  v11 = TSUDynamicCast(v10, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  objc_msgSend(v12, "convertNaturalPointFromUnscaledCanvas:", v5, v7);
  v14 = v13;
  v16 = v15;
  v18 = objc_opt_class(TSWPHyperlinkField, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "smartFieldAtPoint:", v14, v16));
  v20 = TSUDynamicCast(v18, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

  return v21;
}

- (BOOL)canHandleGesture:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  unsigned int v41;
  unsigned __int8 v42;
  unsigned int v43;
  unsigned __int8 v44;
  unsigned int v46;
  double v47;
  double v48;
  double v49;
  objc_super v50;
  objc_super v51;

  v4 = a3;
  v6 = objc_opt_class(TSWPEditingController, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController editorController](self, "editorController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textInputEditor"));
  v9 = TSUDynamicCast(v6, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "gestureKind"));
  if (v11 == (void *)TSWPImmediateSingleTap)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController p_gestureHitLink:](self, "p_gestureHitLink:", v4));
    if (v13)
    {
      v51.receiver = self;
      v51.super_class = (Class)THInteractiveCanvasController;
      v12 = -[THInteractiveCanvasController canHandleGesture:](&v51, "canHandleGesture:", v4);
    }
    else
    {
      v12 = 1;
    }

  }
  else
  {
    v12 = 0;
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "gestureKind"));
  v15 = v14;
  if (v10)
  {
    v16 = (void *)TSWPLongPress;

    if (v15 != v16)
    {
      v50.receiver = self;
      v50.super_class = (Class)THInteractiveCanvasController;
      if (((-[THInteractiveCanvasController canHandleGesture:](&v50, "canHandleGesture:", v4) | v12) & 1) != 0)
      {
LABEL_10:
        v17 = 1;
        goto LABEL_36;
      }
    }
  }
  else
  {
    if (v14 == (void *)TSWPTapAndTouch)
      LOBYTE(v12) = 1;

    if ((v12 & 1) != 0)
      goto LABEL_10;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "gestureKind"));
  if (v18 == (void *)TSDShortTap)
    goto LABEL_20;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "gestureKind"));
  v20 = v19;
  if (v19 == (void *)TSDDelayedShortTap)
  {

LABEL_20:
    goto LABEL_21;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "gestureKind"));
  v22 = (void *)TSWPLongPress;

  if (v21 == v22)
  {
LABEL_21:
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController delegate](self, "delegate"));
    v26 = TSUProtocolCast(&OBJC_PROTOCOL___THInteractiveCanvasControllerDelegate, v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);

    objc_msgSend(v4, "unscaledLocationForICC:", self);
    v29 = v28;
    v31 = v30;
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController hitRep:](self, "hitRep:"));
    v34 = objc_opt_class(TSWPRep, v33);
    v35 = TSUDynamicCast(v34, v32);
    v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "gestureKind"));
    v38 = (void *)TSWPLongPress;

    if (v37 != v38 || !v36)
    {
      if (v36)
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "gestureKind"));
        v40 = (void *)TSDDelayedShortTap;

        if (v39 != v40)
        {
          v17 = 0;
LABEL_35:

          goto LABEL_36;
        }
      }
      v41 = -[THInteractiveCanvasController p_pointIsInLeftMargin:](self, "p_pointIsInLeftMargin:", v29, v31);
      v42 = -[THInteractiveCanvasController p_pointIsInRightMargin:](self, "p_pointIsInRightMargin:", v29, v31);
      if ((objc_opt_respondsToSelector(v27, "interactiveCanvasControllerShouldPageLeftOnMarginTap:") & 1) != 0)
        v43 = objc_msgSend(v27, "interactiveCanvasControllerShouldPageLeftOnMarginTap:", self) ^ 1;
      else
        v43 = 1;
      if ((objc_opt_respondsToSelector(v27, "interactiveCanvasControllerShouldPageRightOnMarginTap:") & 1) != 0)
        v44 = objc_msgSend(v27, "interactiveCanvasControllerShouldPageRightOnMarginTap:", self);
      else
        v44 = 0;
      if ((v41 ^ 1 | v43) == 1)
      {
        v17 = v42 & v44;
        goto LABEL_35;
      }
    }
    v17 = 1;
    goto LABEL_35;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "gestureKind"));
  v24 = (void *)TSDFreeTransform;

  if (v23 == v24)
  {
    if (-[THInteractiveCanvasController isCompactWidth](self, "isCompactWidth"))
      LOBYTE(v46) = 0;
    else
      v46 = !-[THInteractiveCanvasController isCompactHeight](self, "isCompactHeight");
    -[THInteractiveCanvasController viewScale](self, "viewScale");
    v48 = v47;
    -[THInteractiveCanvasController fitWidthViewScale](self, "fitWidthViewScale");
    if (v48 <= v49)
      v17 = 1;
    else
      v17 = v46;
  }
  else
  {
    v17 = 0;
  }
LABEL_36:

  return v17;
}

- (BOOL)handleGesture:(id)a3
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
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  BOOL v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  THInteractiveCanvasController *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  void *v60;
  void *v61;
  objc_super v63;
  _QWORD v64[4];
  id v65;
  THInteractiveCanvasController *v66;
  _QWORD *v67;
  _QWORD *v68;
  uint64_t v69;
  uint64_t v70;
  _QWORD v71[4];
  id v72;
  id v73;
  id v74;
  _QWORD *v75;
  _QWORD v76[3];
  char v77;
  _QWORD v78[5];
  THInteractiveCanvasController *v79;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "gestureKind"));
  v6 = v5;
  if (v5 == (void *)TSDShortTap)
  {

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "gestureKind"));
    v8 = (void *)TSDDelayedShortTap;

    if (v7 != v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "gestureKind"));
      v10 = (void *)TSWPLongPress;

      if (v9 == v10)
      {
        if (-[THInteractiveCanvasController p_handleLongPress:](self, "p_handleLongPress:", v4))
          goto LABEL_23;
      }
      else
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "gestureKind"));
        v12 = (void *)TSDFreeTransform;

        if (v11 == v12)
        {
          v13 = objc_msgSend(v4, "gestureState");
          v15 = objc_opt_class(THWFreeTransformGestureRecognizer, v14);
          v16 = TSUDynamicCast(v15, v4);
          v18 = (void *)objc_claimAutoreleasedReturnValue(v16);
          if (v18)
          {
            v19 = objc_opt_class(THDocumentRoot, v17);
            v20 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController documentRoot](self, "documentRoot"));
            v21 = TSUDynamicCast(v19, v20);
            v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

            v23 = (void *)objc_claimAutoreleasedReturnValue(+[THApplePubAssetPlugin sharedPlugin](THApplePubAssetPlugin, "sharedPlugin"));
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "existingBookViewControllerForDocumentRoot:", v22));

            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "canvasExitFreeTransformController"));
            v26 = v25;
            if (v13 == 1)
            {
              v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "freeTransformDelegate"));

              if (v27 != v26)
              {
                v28 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
                v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THInteractiveCanvasController handleGesture:]"));
                v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THInteractiveCanvasController.m"));
                objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, v30, 1134, CFSTR("Expected the gesture free transform delegate to be the canvas exit FTC."));

              }
              v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "canvasExitFreeTransformController"));
              objc_msgSend(v18, "setFreeTransformDelegate:", v31);

              objc_msgSend(v26, "setTransformGR:", v18);
              objc_msgSend(v26, "transformGRChanged:", v18);
            }
            else
            {
              objc_msgSend(v25, "transformGRChanged:", v18);
              if (v13 - 3 <= 1)
              {
                v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "transformGR"));
                objc_msgSend(v61, "setFreeTransformDelegate:", 0);

                objc_msgSend(v26, "setTransformGR:", 0);
              }
            }

          }
          goto LABEL_23;
        }
      }
      goto LABEL_12;
    }
  }
  if (-[THInteractiveCanvasController p_handleSingleTap:](self, "p_handleSingleTap:", v4))
    goto LABEL_23;
LABEL_12:
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "gestureKind"));
  v33 = (void *)TSWPImmediateSingleTap;

  if (v32 == v33)
  {
    objc_msgSend(v4, "unscaledLocationForICC:", self);
    v35 = v34;
    v37 = v36;
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController p_gestureHitLink:](self, "p_gestureHitLink:", v4));
    if (v38)
    {

      goto LABEL_15;
    }
    v41 = objc_opt_class(TSWPEditingController, v39);
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController editorController](self, "editorController"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "textInputEditor"));
    v44 = TSUDynamicCast(v41, v43);
    v45 = (void *)objc_claimAutoreleasedReturnValue(v44);

    v78[0] = 0;
    v78[1] = v78;
    v78[2] = 0x3032000000;
    v78[3] = sub_2B6AC;
    v78[4] = sub_2B6BC;
    v46 = self;
    v79 = v46;
    v48 = objc_opt_class(TSWPiOSCanvasViewController, v47);
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController layerHost](v46, "layerHost"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "asiOSCVC"));
    v51 = TSUDynamicCast(v48, v50);
    v52 = (void *)objc_claimAutoreleasedReturnValue(v51);

    v54 = objc_opt_class(THiOSCanvasViewController, v53);
    v55 = TSUDynamicCast(v54, v52);
    v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
    v76[0] = 0;
    v76[1] = v76;
    v76[2] = 0x2020000000;
    v77 = 0;
    v71[0] = _NSConcreteStackBlock;
    v71[1] = 3221225472;
    v71[2] = sub_2B6C4;
    v71[3] = &unk_4275E8;
    v72 = v45;
    v57 = v52;
    v73 = v57;
    v58 = v56;
    v74 = v58;
    v75 = v76;
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472;
    v64[2] = sub_2B754;
    v64[3] = &unk_427630;
    v59 = v72;
    v65 = v59;
    v66 = v46;
    v69 = v35;
    v70 = v37;
    v67 = v78;
    v68 = v76;
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[TSWPTwoPartAction actionWithStartAction:cancelAction:finishAction:](TSWPTwoPartAction, "actionWithStartAction:cancelAction:finishAction:", v71, &stru_427608, v64));
    objc_msgSend(v57, "startDelayedTapAction:", v60);

    _Block_object_dispose(v76, 8);
    _Block_object_dispose(v78, 8);

LABEL_23:
    v40 = 1;
    goto LABEL_24;
  }
LABEL_15:
  v63.receiver = self;
  v63.super_class = (Class)THInteractiveCanvasController;
  v40 = -[THInteractiveCanvasController handleGesture:](&v63, "handleGesture:", v4);
LABEL_24:

  return v40;
}

- (void)willBeginHandlingGesture:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "gestureKind"));
  v5 = (void *)TSDFreeTransform;

  if (v4 == v5)
  {
    v7 = objc_opt_class(THDocumentRoot, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController documentRoot](self, "documentRoot"));
    v9 = TSUDynamicCast(v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[THApplePubAssetPlugin sharedPlugin](THApplePubAssetPlugin, "sharedPlugin"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "existingBookViewControllerForDocumentRoot:", v10));

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "canvasExitFreeTransformController"));
    v15 = objc_opt_class(THWFreeTransformGestureRecognizer, v14);
    v16 = TSUDynamicCast(v15, v25);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "freeTransformDelegate"));
    if (v18)
    {
      v19 = (void *)v18;
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "freeTransformDelegate"));

      if (v20 != v13)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THInteractiveCanvasController willBeginHandlingGesture:]"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THInteractiveCanvasController.m"));
        objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, v23, 1219, CFSTR("Overriding existing delegate."));

      }
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "canvasExitFreeTransformController"));
    objc_msgSend(v17, "setFreeTransformDelegate:", v24);

  }
}

- (void)showHyperlinkInfoForField:(id)a3 inRep:(id)a4 openInEditMode:(BOOL)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v7 = a4;
  v8 = a3;
  v10 = objc_opt_class(THWPRep, v9);
  v11 = TSUDynamicCast(v10, v7);
  v12 = (id)objc_claimAutoreleasedReturnValue(v11);

  -[THInteractiveCanvasController handleHyperlink:hitRep:](self, "handleHyperlink:hitRep:", v8, v12);
}

- (void)pressableRepWasPressed:(id)a3 atPoint:(CGPoint)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  id v35;

  v35 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController delegate](self, "delegate"));
  v6 = TSUProtocolCast(&OBJC_PROTOCOL___THWWidgetHost, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if ((objc_opt_respondsToSelector(v35, "pressableAction") & 1) != 0)
  {
    v8 = objc_msgSend(v35, "pressableAction");
    if ((_DWORD)v8 == 3)
    {
      v15 = objc_opt_class(TSDDrawableInfo, v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "info"));
      v17 = TSUDynamicCast(v15, v16);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v17);

      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "hyperlinkURL"));
      if (v14)
        -[THInteractiveCanvasController performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", "handleHyperlinkWithURL:", v14, 0);
      goto LABEL_20;
    }
    v10 = v8;
    if ((_DWORD)v8 == 2)
    {
      if (v7)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "pressableAnimationLayer"));
        objc_msgSend(v18, "removeAllAnimations");

        if ((objc_opt_respondsToSelector(v35, "expandableRep") & 1) != 0)
        {
          v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "expandableRep"));
        }
        else
        {
          v23 = objc_opt_class(TSDRep, v19);
          v24 = TSUClassAndProtocolCast(v35, v23, 1);
          v20 = objc_claimAutoreleasedReturnValue(v24);
        }
        v13 = (void *)v20;
        if (v20)
          objc_msgSend(v7, "presentRepExpanded:", v20);
        goto LABEL_21;
      }
    }
    else
    {
      if ((_DWORD)v8 != 1)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THInteractiveCanvasController pressableRepWasPressed:atPoint:]"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THInteractiveCanvasController.m"));
        objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v21, v22, 1308, CFSTR("Unrecognized action type: %d"), v10);

LABEL_21:
        goto LABEL_22;
      }
      if (v7)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "info"));
        v12 = TSUProtocolCast(&OBJC_PROTOCOL___TSWPopUpOwner, v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "popUpInfo"));
        if (v14)
        {
          if ((objc_opt_respondsToSelector(v35, "frameForPopupInUnscaledCanvas") & 1) != 0)
            objc_msgSend(v35, "frameForPopupInUnscaledCanvas");
          else
            objc_msgSend(v35, "frameInUnscaledCanvas");
          -[THInteractiveCanvasController convertUnscaledToBoundsRect:](self, "convertUnscaledToBoundsRect:");
          v26 = v25;
          v28 = v27;
          v30 = v29;
          v32 = v31;
          v33 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController canvasView](self, "canvasView"));
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "layer"));
          objc_msgSend(v7, "presentPopoverForPopUpInfo:withFrame:inLayer:", v14, v34, v26, v28, v30, v32);

        }
LABEL_20:

        goto LABEL_21;
      }
    }
  }
LABEL_22:

}

- (BOOL)wantsUpdatedScrollIndicatorInsets
{
  return 0;
}

- (void)progressDidChangeForRep:(id)a3 percent:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController delegate](self, "delegate"));
  v8 = TSUProtocolCast(&OBJC_PROTOCOL___THInteractiveCanvasControllerDelegate, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if ((objc_opt_respondsToSelector(v9, "interactiveCanvasController:progressDidChangeForRep:percent:") & 1) != 0)
    objc_msgSend(v9, "interactiveCanvasController:progressDidChangeForRep:percent:", self, v10, v6);

}

- (void)scoreDidChangeForRep:(id)a3 score:(id)a4 total:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController delegate](self, "delegate"));
  v11 = TSUProtocolCast(&OBJC_PROTOCOL___THInteractiveCanvasControllerDelegate, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  if ((objc_opt_respondsToSelector(v12, "interactiveCanvasController:scoreDidChangeForRep:score:total:") & 1) != 0)
    objc_msgSend(v12, "interactiveCanvasController:scoreDidChangeForRep:score:total:", self, v13, v8, v9);

}

- (void)resetAttemptForRep:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController delegate](self, "delegate"));
  v5 = TSUProtocolCast(&OBJC_PROTOCOL___THInteractiveCanvasControllerDelegate, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if ((objc_opt_respondsToSelector(v6, "interactiveCanvasController:resetAttemptForRep:") & 1) != 0)
    objc_msgSend(v6, "interactiveCanvasController:resetAttemptForRep:", self, v7);

}

- (void)p_trackProgressForRep:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v4 = a3;
  v14 = v4;
  if (v4)
  {
    v6 = v4;
    do
    {
      if ((objc_msgSend(v6, "conformsToProtocol:", &OBJC_PROTOCOL___BCProgressTracking) & 1) != 0)
        break;
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "parentRep"));

      v6 = (void *)v7;
    }
    while (v7);
  }
  else
  {
    v6 = 0;
  }
  v8 = objc_opt_class(TSDRep, v5);
  v9 = TSUClassAndProtocolCast(v6, v8, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController delegate](self, "delegate", &OBJC_PROTOCOL___BCProgressTracking, v14));
    v12 = TSUProtocolCast(&OBJC_PROTOCOL___THInteractiveCanvasControllerDelegate, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

    if ((objc_opt_respondsToSelector(v13, "interactiveCanvasController:activateProgressForRep:") & 1) != 0)
      objc_msgSend(v13, "interactiveCanvasController:activateProgressForRep:", self, v10);

  }
}

- (BOOL)animatingScroll
{
  return self->TSAInteractiveCanvasController_opaque[OBJC_IVAR___TSDInteractiveCanvasController_mAnimatingScroll];
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THInteractiveCanvasController;
  v4 = a3;
  -[THInteractiveCanvasController scrollViewDidScroll:](&v5, "scrollViewDidScroll:", v4);
  -[THInteractiveCanvasController p_handleOverscroll:state:](self, "p_handleOverscroll:state:", v4, 0, v5.receiver, v5.super_class);
  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  -[THInteractiveCanvasController p_adjustMaskLayerOnScrollView:](self, "p_adjustMaskLayerOnScrollView:", v4);

  +[CATransaction commit](CATransaction, "commit");
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  double x;
  id v9;
  objc_super v10;

  y = a4.y;
  x = a4.x;
  v9 = a3;
  if (!-[THInteractiveCanvasController isOverscrolling](self, "isOverscrolling"))
  {
    v10.receiver = self;
    v10.super_class = (Class)THInteractiveCanvasController;
    -[THInteractiveCanvasController scrollViewWillEndDragging:withVelocity:targetContentOffset:](&v10, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", v9, a5, x, y);
  }

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  objc_super v7;

  v4 = a4;
  v7.receiver = self;
  v7.super_class = (Class)THInteractiveCanvasController;
  v6 = a3;
  -[THInteractiveCanvasController scrollViewDidEndDragging:willDecelerate:](&v7, "scrollViewDidEndDragging:willDecelerate:", v6, v4);
  -[THInteractiveCanvasController p_handleOverscroll:state:](self, "p_handleOverscroll:state:", v6, 2, v7.receiver, v7.super_class);

}

- (void)scrollViewDidLayoutSubviews:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController maskLayer](self, "maskLayer"));
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController layerHost](self, "layerHost"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "canvasLayer"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mask"));

    if (v8)
    {
      +[CATransaction begin](CATransaction, "begin");
      +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
      -[THInteractiveCanvasController p_adjustMaskLayerOnScrollView:](self, "p_adjustMaskLayerOnScrollView:", v9);
      +[CATransaction commit](CATransaction, "commit");
    }
  }

}

- (void)scrollView:(id)a3 willAnimateToContentOffset:(CGPoint)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THInteractiveCanvasController;
  -[THInteractiveCanvasController scrollView:willAnimateToContentOffset:](&v5, "scrollView:willAnimateToContentOffset:", a3, a4.x, a4.y);
  -[THInteractiveCanvasController p_hoistMaskLayer](self, "p_hoistMaskLayer");
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THInteractiveCanvasController;
  v4 = a3;
  -[THInteractiveCanvasController scrollViewDidEndScrollingAnimation:](&v5, "scrollViewDidEndScrollingAnimation:", v4);
  -[THInteractiveCanvasController p_handleOverscroll:state:](self, "p_handleOverscroll:state:", v4, 3, v5.receiver, v5.super_class);

  -[THInteractiveCanvasController p_unhoistMaskLayer](self, "p_unhoistMaskLayer");
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THInteractiveCanvasController;
  v4 = a3;
  -[THInteractiveCanvasController scrollViewDidEndDecelerating:](&v5, "scrollViewDidEndDecelerating:", v4);
  -[THInteractiveCanvasController p_handleOverscroll:state:](self, "p_handleOverscroll:state:", v4, 3, v5.receiver, v5.super_class);

}

- (void)scrollViewDidScrollToTop:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THInteractiveCanvasController;
  -[THInteractiveCanvasController scrollViewDidScrollToTop:](&v4, "scrollViewDidScrollToTop:", a3);
  -[THInteractiveCanvasController p_unhoistMaskLayer](self, "p_unhoistMaskLayer");
}

- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  v4 = a4;
  -[THInteractiveCanvasController convertUnscaledToBoundsPoint:](self, "convertUnscaledToBoundsPoint:", a3.x, a3.y);
  v7 = v6;
  v9 = v8;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController canvasView](self, "canvasView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "enclosingScrollView"));
  objc_msgSend(v10, "setContentOffset:animated:", v4, v7, v9);

}

- (void)p_handleOverscroll:(id)a3 state:(int)a4
{
  uint64_t v4;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
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
  double v27;
  double v28;
  double v29;
  double v30;
  _BOOL4 v31;
  id v32;

  v4 = *(_QWORD *)&a4;
  v32 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController delegate](self, "delegate"));
  v7 = TSUProtocolCast(&OBJC_PROTOCOL___THInteractiveCanvasControllerDelegate, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if ((objc_opt_respondsToSelector(v8, "interactiveCanvasControllerShouldIgnoreOverscroll:") & 1) != 0
    && (objc_msgSend(v8, "interactiveCanvasControllerShouldIgnoreOverscroll:", self) & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v32, "contentOffset");
    v11 = v10;
    v13 = v12;
    objc_msgSend(v32, "contentSize");
    v15 = v11 - v14;
    objc_msgSend(v32, "frame");
    v17 = v15 + v16;
    objc_msgSend(v32, "contentSize");
    v19 = v13 - v18;
    objc_msgSend(v32, "frame");
    v21 = v19 + v20;
    objc_msgSend(v32, "contentInset");
    v23 = v22;
    v25 = v11 + v24;
    v27 = v17 - v26;
    v29 = v13 + v28;
    if (v25 >= -5.0)
    {
      if (v27 > 5.0
        && (objc_opt_respondsToSelector(v8, "interactiveCanvasController:didOverscrollRight:state:") & 1) != 0)
      {
        objc_msgSend(v8, "interactiveCanvasController:didOverscrollRight:state:", self, v4, v27);
      }
    }
    else if ((objc_opt_respondsToSelector(v8, "interactiveCanvasController:didOverscrollLeft:state:") & 1) != 0)
    {
      objc_msgSend(v8, "interactiveCanvasController:didOverscrollLeft:state:", self, v4, fabs(v25));
    }
    v30 = v21 - v23;
    if (v29 >= -5.0)
    {
      if (v30 > 5.0
        && (objc_opt_respondsToSelector(v8, "interactiveCanvasController:didOverscrollBottom:state:") & 1) != 0)
      {
        objc_msgSend(v8, "interactiveCanvasController:didOverscrollBottom:state:", self, v4, v30);
      }
    }
    else if ((objc_opt_respondsToSelector(v8, "interactiveCanvasController:didOverscrollTop:state:") & 1) != 0)
    {
      objc_msgSend(v8, "interactiveCanvasController:didOverscrollTop:state:", self, v4, fabs(v29));
    }
    v31 = v25 < -5.0;
    if (v27 > 5.0)
      v31 = 1;
    if (v29 < -5.0)
      v31 = 1;
    v9 = v30 > 5.0 || v31;
  }
  -[THInteractiveCanvasController setIsOverscrolling:](self, "setIsOverscrolling:", v9);

}

- (BOOL)p_handleSingleTap:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  unsigned int v8;
  _BOOL4 v9;

  objc_msgSend(a3, "unscaledLocationForICC:", self);
  v5 = v4;
  v7 = v6;
  v8 = -[THInteractiveCanvasController p_pointIsInLeftMargin:](self, "p_pointIsInLeftMargin:");
  v9 = -[THInteractiveCanvasController p_pointIsInRightMargin:](self, "p_pointIsInRightMargin:", v5, v7);
  if (v8)
  {
    -[THInteractiveCanvasController pageLeft](self, "pageLeft");
LABEL_5:
    LOBYTE(v9) = 1;
    return v9;
  }
  if (v9)
  {
    -[THInteractiveCanvasController pageRight](self, "pageRight");
    goto LABEL_5;
  }
  return v9;
}

- (BOOL)p_allowPaging
{
  THInteractiveCanvasController *v2;
  void *v3;
  void *v4;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v3, "interactiveCanvasControllerAllowPaging:") & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController delegate](v2, "delegate"));
    LOBYTE(v2) = objc_msgSend(v4, "interactiveCanvasControllerAllowPaging:", v2);

  }
  else
  {
    LODWORD(v2) = -[THInteractiveCanvasController currentlyScrolling](v2, "currentlyScrolling") ^ 1;
  }

  return (char)v2;
}

- (void)pageLeft
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
  double v14;
  double v15;
  double v16;
  BOOL v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  THInteractiveCanvasController *v23;

  if (-[THInteractiveCanvasController p_allowPaging](self, "p_allowPaging"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[AETestDriver shared](AETestDriver, "shared"));
    objc_msgSend(v3, "postEvent:sender:", kBETestDriverPageTurnStart, self);
    objc_msgSend(v3, "postEvent:sender:", kBETestDriverPageTurnSetupStart, self);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController canvasView](self, "canvasView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "enclosingScrollView"));

    objc_msgSend(v5, "contentOffset");
    v7 = v6;
    v9 = v8;
    objc_msgSend(v5, "bounds");
    v11 = v10;
    v12 = v7 - v10;
    objc_msgSend(v5, "contentSize");
    if (v11 > 0.0)
    {
      v14 = v13;
      if (objc_msgSend(v5, "isPagingEnabled"))
      {
        v15 = floor(v7 / v11);
        v16 = ceil(v7 / v11);
        v17 = vabdd_f64(v7 + v11, v14) >= 0.00999999978 || v15 == v16;
        if (!v17 && vabdd_f64(v7 / v11, round(v7 / v11)) > 0.1)
          v12 = v12 + v11 * 0.5;
      }
    }
    objc_msgSend(v3, "postEvent:sender:", kBETestDriverPageTurnSetupEnd, self);
    objc_msgSend(v3, "postEvent:sender:", kBETestDriverPageTurnAnimationStart, self);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController canvasView](self, "canvasView"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "enclosingScrollView"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_2C9B0;
    v21[3] = &unk_426D80;
    v22 = v3;
    v23 = self;
    v20 = v3;
    objc_msgSend(v19, "setContentOffset:animated:completionBlock:", 1, v21, v12, v9);

  }
}

- (void)pageRight
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
  double v14;
  double v15;
  BOOL v16;
  double v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  THInteractiveCanvasController *v23;

  if (-[THInteractiveCanvasController p_allowPaging](self, "p_allowPaging"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[AETestDriver shared](AETestDriver, "shared"));
    objc_msgSend(v3, "postEvent:sender:", kBETestDriverPageTurnStart, self);
    objc_msgSend(v3, "postEvent:sender:", kBETestDriverPageTurnSetupStart, self);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController canvasView](self, "canvasView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "enclosingScrollView"));

    objc_msgSend(v5, "contentOffset");
    v7 = v6;
    v9 = v8;
    objc_msgSend(v5, "bounds");
    v11 = v10;
    v12 = v7 + v10;
    objc_msgSend(v5, "contentSize");
    if (v11 > 0.0)
    {
      v14 = v13;
      if (objc_msgSend(v5, "isPagingEnabled"))
      {
        v15 = v11 + v12;
        v16 = vabdd_f64(v12, v14) < 0.00999999978 || v15 <= v14;
        v17 = v12 - (v15 - v14);
        if (!v16)
          v12 = v17;
      }
    }
    objc_msgSend(v3, "postEvent:sender:", kBETestDriverPageTurnSetupEnd, self);
    objc_msgSend(v3, "postEvent:sender:", kBETestDriverPageTurnAnimationStart, self);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController canvasView](self, "canvasView"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "enclosingScrollView"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_2CBB8;
    v21[3] = &unk_426D80;
    v22 = v3;
    v23 = self;
    v20 = v3;
    objc_msgSend(v19, "setContentOffset:animated:completionBlock:", 1, v21, v12, v9);

  }
}

- (BOOL)p_pointIsInLeftMargin:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  uint64_t v7;
  void *v8;
  unsigned __int8 v9;

  y = a3.y;
  x = a3.x;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController delegate](self, "delegate"));
  v7 = TSUProtocolCast(&OBJC_PROTOCOL___THInteractiveCanvasControllerDelegate, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if ((objc_opt_respondsToSelector(v8, "interactiveCanvasController:pointIsInLeftMargin:") & 1) != 0)
    v9 = objc_msgSend(v8, "interactiveCanvasController:pointIsInLeftMargin:", self, x, y);
  else
    v9 = 0;

  return v9;
}

- (BOOL)p_pointIsInRightMargin:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  uint64_t v7;
  void *v8;
  unsigned __int8 v9;

  y = a3.y;
  x = a3.x;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController delegate](self, "delegate"));
  v7 = TSUProtocolCast(&OBJC_PROTOCOL___THInteractiveCanvasControllerDelegate, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if ((objc_opt_respondsToSelector(v8, "interactiveCanvasController:pointIsInRightMargin:") & 1) != 0)
    v9 = objc_msgSend(v8, "interactiveCanvasController:pointIsInRightMargin:", self, x, y);
  else
    v9 = 0;

  return v9;
}

- (BOOL)p_zoomColumnAtPoint:(CGPoint)a3 forceWpRep:(BOOL)a4
{
  double y;
  double x;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double width;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  void *v25;
  double height;
  double v27;
  double v28;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  unsigned __int8 v37;
  double v39;
  double v40;
  double v41;
  CGRect v42;
  CGRect v43;

  y = a3.y;
  x = a3.x;
  if (a4)
    v7 = objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController hitRep:withGesture:passingTest:](self, "hitRep:withGesture:passingTest:", 0, &stru_427670, a3.x, a3.y));
  else
    v7 = objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController hitRep:allowsAllReps:](self, "hitRep:allowsAllReps:", 1, a3.x, a3.y));
  v9 = (void *)v7;
  v10 = objc_opt_class(TSWPRep, v8);
  v11 = TSUDynamicCast(v10, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  objc_msgSend(v12, "convertNaturalPointFromUnscaledCanvas:", x, y);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "closestColumnForPoint:"));
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "typographicBounds");
    objc_msgSend(v12, "convertNaturalRectToUnscaledCanvas:");
    v16 = v15;
    v18 = v17;
    width = v19;
    v22 = v21;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController delegate](self, "delegate"));
    v24 = TSUProtocolCast(&OBJC_PROTOCOL___THInteractiveCanvasControllerDelegate, v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);

    height = v22;
    v40 = width;
    v41 = v18;
    v27 = v16;
    if ((objc_opt_respondsToSelector(v25, "interactiveCanvasControllerPaddingForZoomToColumn:") & 1) != 0)
    {
      objc_msgSend(v25, "interactiveCanvasControllerPaddingForZoomToColumn:", self);
      v29 = -v28;
      v42.origin.x = v16;
      v42.size.width = width;
      v42.origin.y = v18;
      v42.size.height = v22;
      v43 = CGRectInset(v42, v29, v29);
      v27 = v43.origin.x;
      v18 = v43.origin.y;
      width = v43.size.width;
      height = v43.size.height;
    }
    v39 = v16;
    -[THInteractiveCanvasController viewScale](self, "viewScale");
    v31 = v30;
    -[THInteractiveCanvasController viewScaleForZoomToFitRect:outset:fitWidthOnly:](self, "viewScaleForZoomToFitRect:outset:fitWidthOnly:", 0, 1, v27, v18, width, height);
    if (vabdd_f64(v31, v32) >= 0.00999999978)
    {
      if ((objc_opt_respondsToSelector(v25, "interactiveCanvasControllerShouldAllowZoomToColumn:") & 1) != 0
        && objc_msgSend(v25, "interactiveCanvasControllerShouldAllowZoomToColumn:", self)
        && ((objc_opt_respondsToSelector(v25, "interactiveCanvasController:shouldZoomToColumn:withFrame:tapPoint:") & 1) == 0
         || objc_msgSend(v25, "interactiveCanvasController:shouldZoomToColumn:withFrame:tapPoint:", self, v14, v39, v41, v40, v22, x, y)))
      {
        v37 = -[THInteractiveCanvasController zoomToFitRect:outset:fitWidthOnly:centerHorizontally:centerVertically:animated:](self, "zoomToFitRect:outset:fitWidthOnly:centerHorizontally:centerVertically:animated:", 0, 1, 1, 0, 1, v27, v18, width, height);
        if ((objc_opt_respondsToSelector(v25, "interactiveCanvasController:didZoomToColumn:ofRep:") & 1) != 0)
          objc_msgSend(v25, "interactiveCanvasController:didZoomToColumn:ofRep:", self, v14, v12);
        goto LABEL_19;
      }
    }
    else
    {
      -[THInteractiveCanvasController contentOffset](self, "contentOffset");
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "layout"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "pageLayout"));

      if (v34)
        objc_msgSend(v34, "frameInRoot");
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[THInteractiveCanvasController layerHost](self, "layerHost"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "canvasLayer"));
      objc_msgSend(v36, "minimumPinchViewScale");
      -[THInteractiveCanvasController setViewScale:contentOffset:clampOffset:animated:](self, "setViewScale:contentOffset:clampOffset:animated:", 1, 1);

    }
    v37 = 0;
LABEL_19:

    goto LABEL_20;
  }
  v37 = 0;
LABEL_20:

  return v37;
}

- (void)p_editorControllerDidChangeTextInputEditor:(id)a3
{
  id v4;
  _QWORD *v5;
  _QWORD block[4];
  _QWORD *v7;
  _QWORD v8[4];
  id v9;
  THInteractiveCanvasController *v10;

  v4 = a3;
  if (TSUSupportsTextInteraction())
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_2D1A0;
    v8[3] = &unk_426D80;
    v9 = v4;
    v10 = self;
    v5 = objc_retainBlock(v8);
    if (v5)
    {
      if (+[NSThread isMainThread](NSThread, "isMainThread"))
      {
        ((void (*)(_QWORD *))v5[2])(v5);
      }
      else
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_2D2D4;
        block[3] = &unk_427698;
        v7 = v5;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

      }
    }

  }
}

- (BOOL)suppressRevealScrollViewOnLayoutAndRender
{
  return self->mSuppressRevealScrollViewOnLayoutAndRender;
}

- (void)setSuppressRevealScrollViewOnLayoutAndRender:(BOOL)a3
{
  self->mSuppressRevealScrollViewOnLayoutAndRender = a3;
}

- (NSObject)iTunesMobileContext
{
  return self->miTunesMobileContext;
}

- (BOOL)isOverscrolling
{
  return self->mOverscrolling;
}

- (void)setIsOverscrolling:(BOOL)a3
{
  self->mOverscrolling = a3;
}

- (NSArray)backgroundLayers
{
  return self->mBackgroundLayers;
}

- (void)setBackgroundLayers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 616);
}

- (NSArray)foregroundLayers
{
  return self->mForegroundLayers;
}

- (void)setForegroundLayers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 624);
}

- (CALayer)maskLayer
{
  return self->_maskLayer;
}

- (void)setMaskLayer:(id)a3
{
  objc_storeStrong((id *)&self->_maskLayer, a3);
}

- (CGPoint)maskLayerOrigin
{
  double x;
  double y;
  CGPoint result;

  x = self->_maskLayerOrigin.x;
  y = self->_maskLayerOrigin.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setMaskLayerOrigin:(CGPoint)a3
{
  self->_maskLayerOrigin = a3;
}

- (BOOL)selectOnLongPress
{
  return self->_selectOnLongPress;
}

- (void)setSelectOnLongPress:(BOOL)a3
{
  self->_selectOnLongPress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskLayer, 0);
  objc_storeStrong((id *)&self->miTunesMobileContext, 0);
  objc_storeStrong((id *)&self->mForegroundLayers, 0);
  objc_storeStrong((id *)&self->mBackgroundLayers, 0);
}

- (id)_axQuickSpeakContent
{
  id v2;
  Class v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;

  v2 = objc_msgSend(-[THInteractiveCanvasController tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("editorController")), "tsaxValueForKey:", CFSTR("textInputEditor"));
  v3 = NSClassFromString(CFSTR("TSWPEditingController"));
  if ((objc_opt_isKindOfClass(v2, v3) & 1) == 0)
    goto LABEL_8;
  v4 = objc_msgSend(v2, "tsaxValueForKey:", CFSTR("selection"));
  if (!objc_msgSend(v4, "tsaxBoolValueForKey:", CFSTR("isRange")))
    goto LABEL_8;
  v5 = objc_msgSend(v4, "tsaxRangeValueForKey:", CFSTR("range"));
  v7 = 0;
  if (v5 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = v6;
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v6)
      {
        v9 = v5;
        v10 = objc_msgSend(v2, "tsaxValueForKey:", CFSTR("storage"));
        if ((objc_opt_respondsToSelector(v10, "stringEquivalentFromRange:") & 1) != 0)
        {
          v7 = objc_msgSend(v10, "stringEquivalentFromRange:", v9, v8);
          return objc_msgSend(v7, "stringByTrimmingCharactersInSet:", +[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
        }
LABEL_8:
        v7 = 0;
      }
    }
  }
  return objc_msgSend(v7, "stringByTrimmingCharactersInSet:", +[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
}

- (id)_accessibilitySpeakSelectionTextInputResponder
{
  return -[THInteractiveCanvasController tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("mTextInputResponder"));
}

- (BOOL)_accessibilityQuickSpeakContentIsSpeakable
{
  return objc_msgSend(-[THInteractiveCanvasController _axQuickSpeakContent](self, "_axQuickSpeakContent"), "length") != 0;
}

- (BOOL)_accessibilityShouldShowSpeakBubble
{
  _BOOL4 v3;

  v3 = -[TSAccessibility isQuickSpeakEnabled](+[TSAccessibility sharedInstance](TSAccessibility, "sharedInstance"), "isQuickSpeakEnabled");
  if (v3)
    LOBYTE(v3) = (-[THInteractiveCanvasController tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("_accessibilityShouldShowPauseBubble")) & 1) == 0&& objc_msgSend(-[THInteractiveCanvasController _axQuickSpeakContent](self, "_axQuickSpeakContent"), "length") != 0;
  return v3;
}

@end
