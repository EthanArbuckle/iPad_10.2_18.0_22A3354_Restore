@implementation CRLFreehandDrawingsAttachment

- (CRLFreehandDrawingsAttachment)initWithDelegate:(id)a3 drawing:(id)a4
{
  id v6;
  id v7;
  CRLFreehandDrawingsAttachment *v8;
  CRLFreehandDrawingsAttachment *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CRLFreehandDrawingsAttachment;
  v8 = -[CRLFreehandDrawingsAttachment init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_drawing, a4);
    -[CRLFreehandDrawingsAttachment updateVisibleUnscaledBoundsAfterDrawingChanged](v9, "updateVisibleUnscaledBoundsAfterDrawingChanged");
  }

  return v9;
}

- (void)teardown
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_isTornDown)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012324E8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF1734();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101232508);
    v2 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingsAttachment teardown]"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingsAttachment.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, v4, 53, 0, "attempting to call teardown on an instance of CRLFreehandDrawingsAttachment that has already been torn down.");

  }
  else
  {
    self->_isTornDown = 1;
  }
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  if (!self->_isTornDown)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101232528);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF17B8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101232548);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingsAttachment dealloc]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingsAttachment.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 58, 0, "teardown not called for CRLFreehandDrawingsAttachment.");

  }
  v6.receiver = self;
  v6.super_class = (Class)CRLFreehandDrawingsAttachment;
  -[CRLFreehandDrawingsAttachment dealloc](&v6, "dealloc");
}

- (void)updateVisibleUnscaledBoundsAfterDrawingChanged
{
  id WeakRetained;
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
  UIView *v25;
  UIView *mViewRep;
  id v27;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v27 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "interactiveCanvasController"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "canvasView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "unscaledCoordinateSpace"));
  -[PKDrawing bounds](self->_drawing, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "canvasView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "window"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "coordinateSpace"));
  objc_msgSend(v5, "convertRect:toCoordinateSpace:", v16, v7, v9, v11, v13);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  v25 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", v18, v20, v22, v24);
  mViewRep = self->mViewRep;
  self->mViewRep = v25;

}

- (BOOL)isAtEndOfDocument
{
  return 0;
}

- (PKStrokeSpatialCache)strokeSpatialCache
{
  id WeakRetained;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "smartSelectionControllerForAttachment:", self));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "strokeSpatialCacheForAttachment:", self));
  return (PKStrokeSpatialCache *)v5;
}

- (UIView)viewRep
{
  return self->mViewRep;
}

- (UIView)tileContainerView
{
  return self->mViewRep;
}

- (UIView)attachmentContainerView
{
  return self->mViewRep;
}

- (PKAttachmentView)attachmentView
{
  return 0;
}

- (BOOL)isExternalAttachment
{
  return 1;
}

- (PKRecognitionController)recognitionController
{
  id WeakRetained;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "smartSelectionControllerForAttachment:", self));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recognitionController"));
  return (PKRecognitionController *)v5;
}

- (CGAffineTransform)drawingTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  return self;
}

- (int64_t)contentTypeForIntersectedStrokes:(id)a3
{
  return 1;
}

- (void)fetchIntersectedStrokesBetweenTopPoint:(CGPoint)a3 bottomPoint:(CGPoint)a4 liveScrollOffset:(CGPoint)a5 completion:(id)a6
{
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  CRLFreehandDrawingsAttachmentDelegate **p_delegate;
  id v14;
  id WeakRetained;
  id v16;

  y = a5.y;
  x = a5.x;
  v8 = a4.y;
  v9 = a4.x;
  v10 = a3.y;
  v11 = a3.x;
  p_delegate = &self->_delegate;
  v14 = a6;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "smartSelectionControllerForAttachment:", self));

  objc_msgSend(v16, "fetchIntersectedStrokesBetweenTopPoint:bottomPoint:liveScrollOffset:completion:", v14, v11, v10, v9, v8, x, y);
}

- (void)fetchIntersectedStrokesAtPoint:(CGPoint)a3 selectionType:(int64_t)a4 inputType:(int64_t)a5 visibleOnscreenStrokes:(id)a6 completion:(id)a7
{
  double y;
  double x;
  CRLFreehandDrawingsAttachmentDelegate **p_delegate;
  id v14;
  id v15;
  id WeakRetained;
  id v17;

  y = a3.y;
  x = a3.x;
  p_delegate = &self->_delegate;
  v14 = a7;
  v15 = a6;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "smartSelectionControllerForAttachment:", self));

  objc_msgSend(v17, "fetchIntersectedStrokesAtPoint:selectionType:inputType:visibleOnscreenStrokes:completion:", a4, a5, v15, v14, x, y);
}

- (id)contentWindowCoordinateSpace
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "interactiveCanvasController"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "canvasView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "coordinateSpace"));

  return v6;
}

- (id)contentScaledCoordinateSpace
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "interactiveCanvasController"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "canvasView"));
  return v4;
}

- (id)contentUnscaledCoordinateSpace
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "interactiveCanvasController"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "canvasView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "unscaledCoordinateSpace"));

  return v5;
}

- (double)viewScaleForExternalAttachment
{
  id WeakRetained;
  void *v3;
  double v4;
  double v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "interactiveCanvasController"));

  objc_msgSend(v3, "viewScale");
  v5 = v4;

  return v5;
}

- (void)installSelectionView:(id)a3
{
  CRLFreehandDrawingsAttachmentDelegate **p_delegate;
  id v5;
  void *v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingsAttachment viewRep](self, "viewRep"));
  objc_msgSend(WeakRetained, "installSelectionView:fromView:", v5, v6);

}

- (BOOL)_handleSingleTapAtDrawingLocation:(CGPoint)a3
{
  return 1;
}

- (BOOL)hitByTouchLocation:(CGPoint)a3 bounds:(CGRect)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;

  y = a3.y;
  x = a3.x;
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(a4, v7);
}

- (void)visibleOnscreenBoundsDidChange:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id WeakRetained;
  id v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "smartSelectionControllerForAttachment:", self));

  objc_msgSend(v9, "invalidateCacheForBounds:inDrawing:", self->_drawing, x, y, width, height);
}

- (id)_firstStrokesInSelectedStrokes:(id)a3
{
  CRLFreehandDrawingsAttachmentDelegate **p_delegate;
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "smartSelectionControllerForAttachment:", self));

  v8 = objc_msgSend(v7, "firstStrokesInSelectedStrokes:isRTL:", v5, sub_1003A91F4());
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return v9;
}

- (id)_lastStrokesInSelectedStrokes:(id)a3
{
  CRLFreehandDrawingsAttachmentDelegate **p_delegate;
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "smartSelectionControllerForAttachment:", self));

  v8 = objc_msgSend(v7, "lastStrokesInSelectedStrokes:isRTL:", v5, sub_1003A91F4());
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return v9;
}

- (void)updateLiveSelectionForStrokesInLayer:(id)a3 inDrawing:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id WeakRetained;
  id v9;
  void *v10;
  id v11;

  v5 = a3;
  v7 = objc_opt_class(CRLFreehandDrawingPKSelectionManager, v6);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = sub_100221D0C(v7, WeakRetained);
  v11 = (id)objc_claimAutoreleasedReturnValue(v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "selectionDecorator"));
  objc_msgSend(v10, "setDecoratorLayer:", v5);

}

- (void)translationDidFinishedInViewController:(id)a3
{
  CRLFreehandDrawingsAttachmentDelegate **p_delegate;
  id v4;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "installTranslationViewController:", v4);

}

- (void)didSelectPreviouslySelectedStrokes:(id)a3
{
  CRLFreehandDrawingsAttachmentDelegate **p_delegate;
  id v4;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "pencilKitDidSmartSelectPreviouslySelectedStrokes:", v4);

}

- (PKDrawing)drawing
{
  return self->_drawing;
}

- (void)setDrawing:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (UIView)tileMaskView
{
  return self->_tileMaskView;
}

- (BOOL)isTornDown
{
  return self->_isTornDown;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tileMaskView, 0);
  objc_storeStrong((id *)&self->_drawing, 0);
  objc_storeStrong((id *)&self->mTiledContainerView, 0);
  objc_storeStrong((id *)&self->mViewRep, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
