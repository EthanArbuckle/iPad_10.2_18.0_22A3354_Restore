@implementation THWViewportInfo

- (THWViewportInfo)initWithContext:(id)a3 geometry:(id)a4
{
  THWViewportInfo *v4;
  TSWPopoverTheme *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THWViewportInfo;
  v4 = -[THWViewportInfo initWithContext:geometry:](&v7, "initWithContext:geometry:", a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(TSWPopoverTheme);
    v4->_popoverTheme = v5;
    -[TSWPopoverTheme setPopoverHasGradientBackground:](v5, "setPopoverHasGradientBackground:", 1);
    -[TSWPopoverTheme setPopoverContentInsets:](v4->_popoverTheme, "setPopoverContentInsets:", 0.0, 0.0, 0.0, 0.0);
    -[TSWPopoverTheme setPopoverFadeInsets:](v4->_popoverTheme, "setPopoverFadeInsets:", 8.0, 0.0, 8.0, 0.0);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->_backgroundShape = 0;
  self->_canvasInfos = 0;

  self->_stroke = 0;
  self->_popoverTheme = 0;

  self->_progressKitID = 0;
  self->_progressKitSectionID = 0;
  v3.receiver = self;
  v3.super_class = (Class)THWViewportInfo;
  -[THWViewportInfo dealloc](&v3, "dealloc");
}

- (Class)layoutClass
{
  return (Class)objc_opt_class(THWViewportLayout, a2);
}

- (Class)repClass
{
  return (Class)objc_opt_class(THWViewportRep, a2);
}

- (void)setBackgroundShape:(id)a3
{
  id v5;
  uint64_t v6;
  double v7;
  void *v8;
  void *v9;

  v5 = a3;

  self->_backgroundShape = (TSDShapeInfo *)a3;
  if (a3)
  {
    v6 = objc_opt_class(TSDColorFill);
    *(_QWORD *)&v7 = TSUDynamicCast(v6, objc_msgSend(-[TSDShapeInfo style](self->_backgroundShape, "style"), "valueForProperty:", 516)).n128_u64[0];
    v9 = v8;
    if (!v8)
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", v7), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWViewportInfo setBackgroundShape:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Viewport/THWViewportInfo.m"), 87, CFSTR("viewport widget must have a background color"));
    -[TSWPopoverTheme setPopoverBackgroundColor:](self->_popoverTheme, "setPopoverBackgroundColor:", objc_msgSend(v9, "color", v7));
  }
}

- (void)setStroke:(id)a3
{
  id v5;

  v5 = a3;

  self->_stroke = (TSDStroke *)a3;
  -[TSWPopoverTheme setPopoverStroke:](self->_popoverTheme, "setPopoverStroke:", a3);
}

- (void)updateBackgroundColor:(id)a3
{
  if (a3)
    goto LABEL_2;
  if (!self->_backgroundShape)
  {
    +[TSUColor lightGrayColor](TSUColor, "lightGrayColor");
LABEL_2:
    -[TSWPopoverTheme setPopoverBackgroundColor:](self->_popoverTheme, "setPopoverBackgroundColor:");
    return;
  }
  -[THWViewportInfo setBackgroundShape:](self, "setBackgroundShape:");
}

- (id)frameCanvasInfos
{
  return -[THWViewportInfo canvasInfos](self, "canvasInfos");
}

- (UIEdgeInsets)frameCanvasContentInsets
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
  UIEdgeInsets result;

  -[THWViewportInfo contentPadding](self, "contentPadding");
  v4 = v3;
  -[THWViewportInfo contentPadding](self, "contentPadding");
  v6 = v5;
  -[THWViewportInfo contentPadding](self, "contentPadding");
  v8 = v7;
  -[THWViewportInfo contentPadding](self, "contentPadding");
  v10 = v9;
  v11 = v4;
  v12 = v6;
  v13 = v8;
  result.right = v10;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (CGSize)frameViewSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend(-[TSDShapeInfo geometry](-[THWViewportInfo backgroundShape](self, "backgroundShape"), "geometry"), "size");
  result.height = v3;
  result.width = v2;
  return result;
}

- (TSDShapeInfo)backgroundShape
{
  return self->_backgroundShape;
}

- (NSArray)canvasInfos
{
  return self->_canvasInfos;
}

- (void)setCanvasInfos:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (CGSize)canvasSize
{
  double width;
  double height;
  CGSize result;

  width = self->canvasSize.width;
  height = self->canvasSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCanvasSize:(CGSize)a3
{
  self->canvasSize = a3;
}

- (double)contentPadding
{
  return self->contentPadding;
}

- (void)setContentPadding:(double)a3
{
  self->contentPadding = a3;
}

- (TSDStroke)stroke
{
  return self->_stroke;
}

- (TSWPopoverTheme)popoverTheme
{
  return self->_popoverTheme;
}

- (void)setPopoverTheme:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (NSString)progressKitID
{
  return self->_progressKitID;
}

- (void)setProgressKitID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)progressKitSectionID
{
  return self->_progressKitSectionID;
}

- (void)setProgressKitSectionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

@end
