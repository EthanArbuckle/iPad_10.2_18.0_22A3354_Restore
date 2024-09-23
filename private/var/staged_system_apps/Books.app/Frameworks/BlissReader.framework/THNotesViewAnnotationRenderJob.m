@implementation THNotesViewAnnotationRenderJob

- (void)dealloc
{
  NSObject *mSemaphore;
  objc_super v4;

  mSemaphore = self->mSemaphore;
  if (mSemaphore)
    dispatch_release(mSemaphore);
  v4.receiver = self;
  v4.super_class = (Class)THNotesViewAnnotationRenderJob;
  -[THNotesViewAnnotationRenderJob dealloc](&v4, "dealloc");
}

- (BOOL)waitUntilFinishedWithTimeoutTime:(unint64_t)a3
{
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesViewAnnotationRenderJob waitUntilFinishedWithTimeoutTime:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesViewAnnotationRenderer.m"), 390, CFSTR("This operation must only be performed on the main thread."));
  if (self->mCancelled)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesViewAnnotationRenderJob waitUntilFinishedWithTimeoutTime:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesViewAnnotationRenderer.m"), 391, CFSTR("shouldn't wait on a cancelled job"));
  return dispatch_semaphore_wait((dispatch_semaphore_t)self->mSemaphore, a3) == 0;
}

- (void)willStart
{
  if (!self->mSemaphore
    || (objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNotesViewAnnotationRenderJob willStart]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNotesViewAnnotationRenderer.m"), 398, CFSTR("Unexpected 2nd call to willStart!")), !self->mSemaphore))
  {
    self->mSemaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  }
}

- (void)didFinish
{
  dispatch_semaphore_signal((dispatch_semaphore_t)self->mSemaphore);
}

- (THAnnotation)annotation
{
  return self->mAnnotation;
}

- (void)setAnnotation:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (THModelContentNode)contentNode
{
  return self->mContentNode;
}

- (void)setContentNode:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (unint64_t)maxLines
{
  return self->mMaxLines;
}

- (void)setMaxLines:(unint64_t)a3
{
  self->mMaxLines = a3;
}

- (THNotesViewRenderedAnnotation)renderedAnnotation
{
  return self->mRenderedAnnotation;
}

- (void)setRenderedAnnotation:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (OS_dispatch_semaphore)semaphore
{
  return self->mSemaphore;
}

- (BOOL)cancelled
{
  return self->mCancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->mCancelled = a3;
}

- (int64_t)interfaceStyle
{
  return self->_interfaceStyle;
}

- (void)setInterfaceStyle:(int64_t)a3
{
  self->_interfaceStyle = a3;
}

@end
