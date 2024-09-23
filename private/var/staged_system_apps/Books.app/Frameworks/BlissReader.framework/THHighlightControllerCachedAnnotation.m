@implementation THHighlightControllerCachedAnnotation

- (THHighlightControllerCachedAnnotation)initWithAnnotation:(id)a3
{
  THHighlightControllerCachedAnnotation *v5;
  THAnnotation *v6;
  objc_super v8;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THHighlightControllerCachedAnnotation initWithAnnotation:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWPHighlightController.mm"), 193, CFSTR("This operation must only be performed on the main thread."));
  v8.receiver = self;
  v8.super_class = (Class)THHighlightControllerCachedAnnotation;
  v5 = -[THHighlightControllerCachedAnnotation init](&v8, "init");
  if (v5)
  {
    if (!a3)
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THHighlightControllerCachedAnnotation initWithAnnotation:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWPHighlightController.mm"), 196, CFSTR("Invalid parameter not satisfying: %s"), "annotation");
    v6 = (THAnnotation *)a3;
    v5->mAnnotation = v6;
    v5->mLastRenderedStyle = -[THAnnotation annotationStyle](v6, "annotationStyle");
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  self->mAnnotation = 0;
  self->mHighlight = 0;

  self->mMarginNote = 0;
  v3.receiver = self;
  v3.super_class = (Class)THHighlightControllerCachedAnnotation;
  -[THHighlightControllerCachedAnnotation dealloc](&v3, "dealloc");
}

- (void)updateAnnotation:(id)a3
{
  THAnnotation *mAnnotation;
  THAnnotation *v6;

  mAnnotation = self->mAnnotation;
  if (mAnnotation != a3)
  {
    if (-[THAnnotation isEqual:](mAnnotation, "isEqual:"))
    {

      self->mAnnotation = 0;
      v6 = (THAnnotation *)a3;
      self->mAnnotation = v6;
      -[THHighlight setAnnotation:](self->mHighlight, "setAnnotation:", v6);
    }
  }
}

- (BOOL)needsMarginNoteUpdate
{
  BOOL v2;

  v2 = self->mMarginNote != 0;
  return v2 ^ (-[THAnnotation annotationNote](self->mAnnotation, "annotationNote") != 0);
}

- (THAnnotation)annotation
{
  return self->mAnnotation;
}

- (THHighlight)highlight
{
  return (THHighlight *)objc_getProperty(self, a2, 24, 1);
}

- (void)setHighlight:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (AEMarginNote)marginNote
{
  return (AEMarginNote *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMarginNote:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (int)lastRenderedStyle
{
  return self->mLastRenderedStyle;
}

- (void)setLastRenderedStyle:(int)a3
{
  self->mLastRenderedStyle = a3;
}

@end
