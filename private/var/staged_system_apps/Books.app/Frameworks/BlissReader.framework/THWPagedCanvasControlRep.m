@implementation THWPagedCanvasControlRep

- (THWPagedCanvasControlRep)initWithLayout:(id)a3 canvas:(id)a4
{
  THWPagedCanvasControlRep *v6;
  id v7;
  THWPagedCanvasController *pagedCanvasController;
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
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)THWPagedCanvasControlRep;
  v6 = -[THWPagedCanvasControlRep initWithLayout:canvas:](&v23, "initWithLayout:canvas:");
  if (v6)
  {
    v6->_pagedCanvasController = -[THWPagedCanvasController initWithDocumentRoot:]([THWPagedCanvasController alloc], "initWithDocumentRoot:", objc_msgSend(a4, "documentRoot"));
    v7 = -[THWPagedCanvasControlRep canvas](v6, "canvas");
    objc_msgSend(a3, "frameInRoot");
    objc_msgSend(v7, "convertUnscaledToBoundsRect:");
    pagedCanvasController = v6->_pagedCanvasController;
    objc_msgSend(-[THWPagedCanvasControlRep canvas](v6, "canvas"), "convertUnscaledToBoundsRect:", v9, v10, v11, v12);
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    objc_msgSend(-[THWPagedCanvasControlRep interactiveCanvasController](v6, "interactiveCanvasController"), "viewScale");
    -[THWPagedCanvasController createLayerHostIfNeededWithFrame:viewScale:](pagedCanvasController, "createLayerHostIfNeededWithFrame:viewScale:", v14, v16, v18, v20, v21);
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWPagedCanvasControlRep;
  -[THWPagedCanvasControlRep dealloc](&v3, "dealloc");
}

- (void)viewScrollingEnded
{
  objc_msgSend(-[THWPagedCanvasControlRep interactiveCanvasController](self, "interactiveCanvasController"), "invalidateReps");
}

- (TSDContainerInfo)containerInfo
{
  return 0;
}

- (id)childReps
{
  return 0;
}

- (BOOL)canSelectChildRep:(id)a3
{
  return 0;
}

- (void)addAlternateLayersForChildViewsToArray:(id)a3
{
  CALayer *v4;

  v4 = -[THWPagedCanvasController alternateLayerForView](self->_pagedCanvasController, "alternateLayerForView");
  if (v4)
    objc_msgSend(a3, "addObject:", v4);
}

- (void)updateFromLayout
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
  THWPagedCanvasController *pagedCanvasController;
  double v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)THWPagedCanvasControlRep;
  -[THWPagedCanvasControlRep updateFromLayout](&v17, "updateFromLayout");
  objc_msgSend(-[THWPagedCanvasControlRep layout](self, "layout"), "frameInRoot");
  objc_msgSend(-[THWPagedCanvasControlRep canvas](self, "canvas"), "convertUnscaledToBoundsRect:", v3, v4, v5, v6);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  pagedCanvasController = self->_pagedCanvasController;
  objc_msgSend(-[THWPagedCanvasControlRep canvas](self, "canvas"), "viewScale");
  -[THWPagedCanvasController setFrame:scale:](pagedCanvasController, "setFrame:scale:", v8, v10, v12, v14, v16);
}

- (void)addChildViewsToArray:(id)a3
{
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
  THWPagedCanvasController *pagedCanvasController;
  double v18;
  UIView *v19;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWPagedCanvasControlRep addChildViewsToArray:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/THWPagedCanvasControl.m"), 103, CFSTR("This operation must only be performed on the main thread."));
  objc_msgSend(-[THWPagedCanvasControlRep layout](self, "layout"), "frameInRoot");
  objc_msgSend(-[THWPagedCanvasControlRep canvas](self, "canvas"), "convertUnscaledToBoundsRect:", v5, v6, v7, v8);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  pagedCanvasController = self->_pagedCanvasController;
  objc_msgSend(-[THWPagedCanvasControlRep canvas](self, "canvas"), "viewScale");
  -[THWPagedCanvasController createViewIfNeededWithFrame:viewScale:](pagedCanvasController, "createViewIfNeededWithFrame:viewScale:", v10, v12, v14, v16, v18);
  v19 = -[THWPagedCanvasController view](self->_pagedCanvasController, "view");
  if (v19)
    objc_msgSend(a3, "addObject:", v19);
}

- (id)viewControllerForView:(id)a3
{
  if (-[THWPagedCanvasController view](self->_pagedCanvasController, "view") == a3)
    return objc_msgSend(-[TSDInteractiveCanvasController layerHost](-[THWPagedCanvasController interactiveCanvasController](self->_pagedCanvasController, "interactiveCanvasController"), "layerHost"), "viewController");
  else
    return 0;
}

- (void)willBeRemoved
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWPagedCanvasControlRep;
  -[THWControlRep willBeRemoved](&v3, "willBeRemoved");
  -[THWPagedCanvasController teardownController](self->_pagedCanvasController, "teardownController");
  -[THWPagedCanvasController setDelegate:](self->_pagedCanvasController, "setDelegate:", 0);
}

- (void)didAddChildView:(id)a3
{
  -[THWPagedCanvasController didAddView](self->_pagedCanvasController, "didAddView", a3);
}

- (void)willRemoveChildView:(id)a3
{
  THWPagedCanvasController *pagedCanvasController;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWPagedCanvasControlRep willRemoveChildView:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/THWPagedCanvasControl.m"), 148, CFSTR("This operation must only be performed on the main thread."));
  if (a3)
  {
    pagedCanvasController = self->_pagedCanvasController;
    if (pagedCanvasController)
    {
      if (-[THWPagedCanvasController view](pagedCanvasController, "view") == a3)
        -[THWPagedCanvasController teardownView](self->_pagedCanvasController, "teardownView");
    }
  }
}

- (void)screenScaleDidChange
{
  -[THWPagedCanvasController screenScaleDidChange](self->_pagedCanvasController, "screenScaleDidChange");
}

- (THWPagedCanvasController)pagedCanvasController
{
  return self->_pagedCanvasController;
}

@end
