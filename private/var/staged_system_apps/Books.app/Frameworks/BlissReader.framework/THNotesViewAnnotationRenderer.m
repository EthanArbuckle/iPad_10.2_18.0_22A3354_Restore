@implementation THNotesViewAnnotationRenderer

- (THNotesViewAnnotationRenderer)initWithDelegate:(id)a3
{
  THNotesViewAnnotationRenderer *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THNotesViewAnnotationRenderer;
  result = -[THNotesViewAnnotationRenderer init](&v5, "init");
  if (result)
    result->mDelegate = (THNotesViewAnnotationRendererDelegate *)a3;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  if (self->mCurrentRenderJob)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesViewAnnotationRenderer dealloc]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesViewAnnotationRenderer.m"), 102, CFSTR("expected nil value for '%s'"), "mCurrentRenderJob");

  v3.receiver = self;
  v3.super_class = (Class)THNotesViewAnnotationRenderer;
  -[THNotesViewAnnotationRenderer dealloc](&v3, "dealloc");
}

- (void)renderAnnotations:(id)a3
{
  NSMutableArray *v5;
  THNotesViewAnnotationRenderJob *mCurrentRenderJob;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesViewAnnotationRenderer renderAnnotations:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesViewAnnotationRenderer.m"), 112, CFSTR("This operation must only be performed on the main thread."));
  v5 = (NSMutableArray *)objc_msgSend(a3, "mutableCopy");
  mCurrentRenderJob = self->mCurrentRenderJob;
  if (mCurrentRenderJob)
  {
    -[THNotesViewAnnotationRenderJob setCancelled:](mCurrentRenderJob, "setCancelled:", 1);
    -[THModelContentNode cancelLoading](-[THNotesViewAnnotationRenderJob contentNode](self->mCurrentRenderJob, "contentNode"), "cancelLoading");

    self->mCurrentRenderJob = 0;
  }

  self->mAnnotationQueue = v5;
  if (!self->mCurrentRenderJob)
    -[THNotesViewAnnotationRenderer p_startNextRenderJob](self, "p_startNextRenderJob");
}

- (void)renderAnnotations:(id)a3 withUserInterfaceStyle:(int64_t)a4
{
  NSMutableArray *v7;
  THNotesViewAnnotationRenderJob *mCurrentRenderJob;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesViewAnnotationRenderer renderAnnotations:withUserInterfaceStyle:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesViewAnnotationRenderer.m"), 136, CFSTR("This operation must only be performed on the main thread."));
  v7 = (NSMutableArray *)objc_msgSend(a3, "mutableCopy");
  mCurrentRenderJob = self->mCurrentRenderJob;
  if (mCurrentRenderJob)
  {
    -[THNotesViewAnnotationRenderJob setCancelled:](mCurrentRenderJob, "setCancelled:", 1);
    -[THModelContentNode cancelLoading](-[THNotesViewAnnotationRenderJob contentNode](self->mCurrentRenderJob, "contentNode"), "cancelLoading");

    self->mCurrentRenderJob = 0;
  }

  self->mAnnotationQueue = v7;
  self->mInterfaceStyle = a4;
  if (!self->mCurrentRenderJob)
    -[THNotesViewAnnotationRenderer p_startNextRenderJob](self, "p_startNextRenderJob");
}

- (void)waitWithTimeout:(double)a3 forCondition:(id)a4
{
  dispatch_time_t v7;

  if (((*((uint64_t (**)(id, SEL))a4 + 2))(a4, a2) & 1) == 0)
  {
    if (!self->mCurrentRenderJob)
      -[THNotesViewAnnotationRenderer p_startNextRenderJob](self, "p_startNextRenderJob");
    v7 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    do
    {
      if (!-[THNotesViewAnnotationRenderJob waitUntilFinishedWithTimeoutTime:](self->mCurrentRenderJob, "waitUntilFinishedWithTimeoutTime:", v7))break;
      -[THNotesViewAnnotationRenderer p_finishedRenderJob:](self, "p_finishedRenderJob:", self->mCurrentRenderJob);
    }
    while (!(*((unsigned int (**)(id))a4 + 2))(a4));
  }
}

- (BOOL)doneRendering
{
  return !-[NSMutableArray count](self->mAnnotationQueue, "count") && self->mCurrentRenderJob == 0;
}

- (void)p_startNextRenderJob
{
  id v3;
  id v4;
  THNotesViewAnnotationRenderJob *v5;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesViewAnnotationRenderer p_startNextRenderJob]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesViewAnnotationRenderer.m"), 190, CFSTR("This operation must only be performed on the main thread."));
  if (self->mCurrentRenderJob)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesViewAnnotationRenderer p_startNextRenderJob]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesViewAnnotationRenderer.m"), 191, CFSTR("expected nil value for '%s'"), "mCurrentRenderJob");
  v3 = -[NSMutableArray firstObject](self->mAnnotationQueue, "firstObject");
  if (self->mDelegate)
  {
    v4 = v3;
    if (v3)
    {
      v5 = objc_alloc_init(THNotesViewAnnotationRenderJob);
      self->mCurrentRenderJob = v5;
      -[THNotesViewAnnotationRenderJob setAnnotation:](v5, "setAnnotation:", v4);
      -[THNotesViewAnnotationRenderJob setInterfaceStyle:](self->mCurrentRenderJob, "setInterfaceStyle:", self->mInterfaceStyle);
      -[THNotesViewAnnotationRenderJob setContentNode:](self->mCurrentRenderJob, "setContentNode:", -[THNotesViewAnnotationRendererDelegate annotationRenderer:contentNodeForAnnotation:](self->mDelegate, "annotationRenderer:contentNodeForAnnotation:", self, v4));
      -[THNotesViewAnnotationRenderJob setMaxLines:](self->mCurrentRenderJob, "setMaxLines:", -[THNotesViewAnnotationRendererDelegate maxLinesForAnnotationRenderer:](self->mDelegate, "maxLinesForAnnotationRenderer:", self));
      -[NSMutableArray removeObjectAtIndex:](self->mAnnotationQueue, "removeObjectAtIndex:", 0);
      -[THNotesViewAnnotationRenderer p_startRenderJob:](self, "p_startRenderJob:", self->mCurrentRenderJob);
    }
  }
  else
  {
    -[NSMutableArray removeAllObjects](self->mAnnotationQueue, "removeAllObjects");
  }
}

- (void)p_startRenderJob:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[14];

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesViewAnnotationRenderer p_startRenderJob:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesViewAnnotationRenderer.m"), 215, CFSTR("This operation must only be performed on the main thread."));
  if (self->mCurrentRenderJob != a3)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesViewAnnotationRenderer p_startRenderJob:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesViewAnnotationRenderer.m"), 216, CFSTR("should only start the current render job"));
  objc_msgSend(a3, "willStart");
  -[THNotesViewAnnotationRendererDelegate highlightWidthForAnnotationRenderer:](self->mDelegate, "highlightWidthForAnnotationRenderer:", self);
  v6 = v5;
  -[THNotesViewAnnotationRendererDelegate editingHighlightWidthForAnnotationRenderer:](self->mDelegate, "editingHighlightWidthForAnnotationRenderer:", self);
  v8 = v7;
  v9 = objc_msgSend(objc_msgSend(a3, "annotation"), "annotationRepresentativeText");
  v10 = objc_msgSend(objc_msgSend(a3, "annotation"), "annotationStorageRange");
  v12 = v11;
  v13 = objc_msgSend(objc_msgSend(a3, "annotation"), "annotationLocation");
  v14 = objc_msgSend(a3, "interfaceStyle");
  v15 = -[THNotesViewAnnotationRendererDelegate accessControllerForAnnotationRenderer:](self->mDelegate, "accessControllerForAnnotationRenderer:", self);
  objc_msgSend(objc_msgSend(a3, "contentNode"), "startLoading");
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_118B5C;
  v16[3] = &unk_429C88;
  v16[4] = self;
  v16[5] = a3;
  v16[6] = v15;
  v16[7] = v13;
  v16[9] = v6;
  v16[10] = v8;
  v16[8] = v9;
  v16[11] = v10;
  v16[12] = v12;
  v16[13] = v14;
  -[TSKThreadDispatcher dispatch:](+[TSKThreadDispatcher sharedInstance](TSKThreadDispatcher, "sharedInstance"), "dispatch:", v16);
}

- (void)p_performRenderJob:(id)a3 accessController:(id)a4 location:(id)a5 width:(double)a6 editingWidth:(double)a7 text:(id)a8 range:(_NSRange)a9 interfaceStyle:(int64_t)a10
{
  NSUInteger length;
  NSUInteger location;
  id v18;
  _QWORD v19[13];

  length = a9.length;
  location = a9.location;
  v18 = -[THNotesViewAnnotationRendererDelegate annotationRenderer:storageForAnnotationLocation:](self->mDelegate, "annotationRenderer:storageForAnnotationLocation:", self, a5);
  if ((objc_msgSend(a3, "cancelled") & 1) == 0)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_118C8C;
    v19[3] = &unk_429CB0;
    v19[4] = self;
    v19[5] = a3;
    *(double *)&v19[8] = a6;
    v19[6] = v18;
    v19[7] = a8;
    v19[9] = location;
    v19[10] = length;
    v19[11] = a10;
    *(double *)&v19[12] = a7;
    objc_msgSend(a4, "performRead:", v19);
  }
}

- (void)p_finishedRenderJob:(id)a3
{
  id v5;

  if ((objc_msgSend(a3, "cancelled") & 1) == 0 && self->mCurrentRenderJob == a3)
  {
    if (objc_msgSend(a3, "contentNode"))
      -[THNotesViewAnnotationRendererDelegate annotationRenderer:didLoadContentNode:](self->mDelegate, "annotationRenderer:didLoadContentNode:", self, objc_msgSend(a3, "contentNode"));
    if ((objc_msgSend(a3, "cancelled") & 1) == 0)
    {
      v5 = a3;

      self->mCurrentRenderJob = 0;
      -[THNotesViewAnnotationRendererDelegate annotationRenderer:didRenderAnnotation:withResult:](self->mDelegate, "annotationRenderer:didRenderAnnotation:withResult:", self, objc_msgSend(a3, "annotation"), objc_msgSend(a3, "renderedAnnotation"));

      -[THNotesViewAnnotationRenderer p_startNextRenderJob](self, "p_startNextRenderJob");
    }
  }
}

- (id)p_newHighlightLayerForAnnotation:(id)a3 width:(double)a4 storage:(id)a5 text:(id)a6 range:(_NSRange)a7 interfaceStyle:(int64_t)a8 maxLines:(unint64_t)a9 documentRoot:(id)a10
{
  NSUInteger length;
  NSUInteger location;
  THNotesAnnotationLayer *v16;
  uint64_t v17;
  void *v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;

  length = a7.length;
  location = a7.location;
  v16 = -[THNotesAnnotationLayer initWithAnnotation:maxLines:showHighlight:]([THNotesAnnotationLayer alloc], "initWithAnnotation:maxLines:showHighlight:", a3, a9, 0);
  -[THNotesAnnotationLayer setContentsScale:](v16, "setContentsScale:", TSUScreenScale(v16, v17));
  -[THNotesAnnotationLayer setFrame:](v16, "setFrame:", 0.0, 0.0, a4, 100.0);
  v18 = objc_autoreleasePoolPush();
  if (a5)
    -[THNoteCardStorageLayer setStorage:range:](v16, "setStorage:range:", a5, location, length);
  else
    -[THNoteCardStorageLayer setText:context:](v16, "setText:context:", a6, objc_msgSend(a10, "context"));
  if (a8 == 1)
    v19 = +[TSUColor blackColor](TSUColor, "blackColor");
  else
    v19 = +[TSUColor whiteColor](TSUColor, "whiteColor");
  -[THNoteCardStorageLayer setFontFamily:textColor:underlineColor:characterSpacing:lineSpacingMode:lineSpacingAmount:](v16, "setFontFamily:textColor:underlineColor:characterSpacing:lineSpacingMode:lineSpacingAmount:", objc_msgSend(+[TSUFont systemFontOfSize:](TSUFont, "systemFontOfSize:", 12.0), "familyName"), v19, 0, 0, 0.0, 1.0);
  -[THNotesAnnotationLayer frame](v16, "frame");
  v21 = v20;
  v23 = v22;
  -[THNotesAnnotationLayer sizeThatFits:](v16, "sizeThatFits:", v24, v25);
  -[THNotesAnnotationLayer setFrame:](v16, "setFrame:", v21, v23, v26, v27);
  -[THNotesAnnotationLayer layoutIfNeeded](v16, "layoutIfNeeded");
  objc_autoreleasePoolPop(v18);
  return v16;
}

- (THNotesViewAnnotationRendererDelegate)delegate
{
  return self->mDelegate;
}

- (void)setDelegate:(id)a3
{
  self->mDelegate = (THNotesViewAnnotationRendererDelegate *)a3;
}

- (NSMutableArray)annotationQueue
{
  return self->mAnnotationQueue;
}

- (void)setAnnotationQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (THNotesViewAnnotationRenderJob)currentRenderJob
{
  return self->mCurrentRenderJob;
}

- (void)setCurrentRenderJob:(id)a3
{
  self->mCurrentRenderJob = (THNotesViewAnnotationRenderJob *)a3;
}

- (int64_t)interfaceStyle
{
  return self->mInterfaceStyle;
}

- (void)setInterfaceStyle:(int64_t)a3
{
  self->mInterfaceStyle = a3;
}

@end
