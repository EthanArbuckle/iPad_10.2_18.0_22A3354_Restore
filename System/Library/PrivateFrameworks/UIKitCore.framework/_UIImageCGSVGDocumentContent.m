@implementation _UIImageCGSVGDocumentContent

- (_UIImageCGSVGDocumentContent)initWithCGSVGDocument:(CGSVGDocument *)a3 scale:(double)a4
{
  CFTypeID v8;
  _UIImageCGSVGDocumentContent *v9;
  void *v11;
  void *v12;
  objc_super v13;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIImageContent.m"), 1652, CFSTR("Need a svgDocumentRef"));

  }
  v8 = CFGetTypeID(a3);
  if (v8 != CGSVGDocumentGetTypeID())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIImageContent.m"), 1653, CFSTR("svgDocumentRef passed is not a CGSVGDocumentRef"));

  }
  v13.receiver = self;
  v13.super_class = (Class)_UIImageCGSVGDocumentContent;
  v9 = -[_UIImageContent initWithScale:](&v13, sel_initWithScale_, a4);
  if (v9)
    v9->_svgDocumentRef = (CGSVGDocument *)CGSVGDocumentRetain();
  return v9;
}

- (_UIImageCGSVGDocumentContent)initWithScale:(double)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIImageContent.m"), 1664, CFSTR("You need to use -initWithCGSVGDocument:scale:"));

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  CGSVGDocumentRelease();
  v3.receiver = self;
  v3.super_class = (Class)_UIImageCGSVGDocumentContent;
  -[_UIImageCGSVGDocumentContent dealloc](&v3, sel_dealloc);
}

- (id)typeName
{
  return CFSTR("SVG");
}

- (BOOL)canScaleImageToTargetResolution
{
  return 1;
}

- (BOOL)canEmitVectorDrawingCommands
{
  return 1;
}

- (BOOL)isCGSVGDocument
{
  return 1;
}

- (CGSVGDocument)CGSVGDocument
{
  return self->_svgDocumentRef;
}

- (CGSize)sizeInPixels
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
  CGSize result;

  CGSVGDocumentGetCanvasSize();
  v4 = v3;
  v6 = v5;
  -[_UIImageContent scale](self, "scale");
  v8 = v4 * v7;
  -[_UIImageContent scale](self, "scale");
  v10 = v6 * v9;
  v11 = v8;
  result.height = v10;
  result.width = v11;
  return result;
}

- (double)vectorScale
{
  return 1.0;
}

- (BOOL)isEqual:(id)a3
{
  CGSVGDocument **v4;
  BOOL v5;
  objc_super v7;

  v4 = (CGSVGDocument **)a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIImageCGSVGDocumentContent;
  if (-[_UIImageContent isEqual:](&v7, sel_isEqual_, v4))
    v5 = self->_svgDocumentRef == v4[5];
  else
    v5 = 0;

  return v5;
}

- (unint64_t)hash
{
  return (unint64_t)self->_svgDocumentRef;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CGSVGDocument:%p"), self->_svgDocumentRef);
}

- (void)_prepareForDrawingWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5
{
  double height;
  double width;
  double v9;
  double v10;

  height = a3.height;
  width = a3.width;
  CGContextTranslateCTM(a5, 0.0, a3.height);
  CGContextScaleCTM(a5, 1.0, -1.0);
  -[_UIImageContent size](self, "size");
  CGContextScaleCTM(a5, width / v9, height / v10);
}

- (void)_drawWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5 effect:(id)a6
{
  CGContextDrawSVGDocument();
}

@end
