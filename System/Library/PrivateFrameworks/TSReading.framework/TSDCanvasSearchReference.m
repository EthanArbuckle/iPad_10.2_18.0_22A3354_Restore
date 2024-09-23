@implementation TSDCanvasSearchReference

+ (id)searchReferenceWithDrawableInfo:(id)a3
{
  return -[TSDCanvasSearchReference initWithDrawableInfo:]([TSDCanvasSearchReference alloc], "initWithDrawableInfo:", a3);
}

- (TSDCanvasSearchReference)initWithDrawableInfo:(id)a3
{
  TSDCanvasSearchReference *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSDCanvasSearchReference;
  v4 = -[TSDCanvasSearchReference init](&v6, sel_init);
  if (v4)
  {
    v4->mDrawableInfo = (TSDDrawableInfo *)a3;
    v4->mDocumentRoot = (TSKDocumentRoot *)objc_msgSend((id)objc_msgSend(a3, "context"), "documentRoot");
    v4->mCanvasSelection = (TSDCanvasSelection *)+[TSDCanvasEditor canvasSelectionWithInfos:](TSDCanvasEditor, "canvasSelectionWithInfos:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v4->mDrawableInfo));
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDCanvasSearchReference;
  -[TSDCanvasSearchReference dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  id v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(-[TSDCanvasSearchReference drawableInfo](self, "drawableInfo"), "isEqual:", objc_msgSend(a3, "drawableInfo"));
    if (v5)
    {
      v6 = -[TSDCanvasSearchReference model](self, "model");
      LOBYTE(v5) = v6 == (id)objc_msgSend(a3, "model");
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  objc_class *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  -[TSDCanvasSearchReference drawableInfo](self, "drawableInfo");
  v6 = (objc_class *)objc_opt_class();
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p info=<%@ %p>>"), v5, self, NSStringFromClass(v6), -[TSDCanvasSearchReference drawableInfo](self, "drawableInfo"));
}

- (id)commandForReplacingWithString:(id)a3 options:(unint64_t)a4
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3, a4);
  v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDCanvasSearchReference commandForReplacingWithString:options:]");
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCanvasSearchReference.m"), 80, CFSTR("Cannot replace string on drawable"));
  return 0;
}

- (id)drawableInfo
{
  return self->mDrawableInfo;
}

- (id)model
{
  return self->mDocumentRoot;
}

- (id)selection
{
  return self->mCanvasSelection;
}

- (BOOL)isReplaceable
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  TSDCanvasSearchReference *v4;

  v4 = -[TSDCanvasSearchReference initWithDrawableInfo:]([TSDCanvasSearchReference alloc], "initWithDrawableInfo:", self->mDrawableInfo);
  -[TSDCanvasSearchReference searchReferencePoint](self, "searchReferencePoint");
  -[TSDCanvasSearchReference setSearchReferencePoint:](v4, "setSearchReferencePoint:");
  return v4;
}

- (NSArray)findHighlights
{
  return self->mFindHighlights;
}

- (void)setFindHighlights:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (BOOL)autohideHighlight
{
  return self->mAutohideHighlight;
}

- (void)setAutohideHighlight:(BOOL)a3
{
  self->mAutohideHighlight = a3;
}

- (BOOL)pulseHighlight
{
  return self->mPulseHighlight;
}

- (void)setPulseHighlight:(BOOL)a3
{
  self->mPulseHighlight = a3;
}

- (CGPoint)searchReferencePoint
{
  double x;
  double y;
  CGPoint result;

  x = self->mSearchReferencePoint.x;
  y = self->mSearchReferencePoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setSearchReferencePoint:(CGPoint)a3
{
  self->mSearchReferencePoint = a3;
}

- (TSKAnnotation)annotation
{
  return self->mAnnotation;
}

- (void)setAnnotation:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

@end
