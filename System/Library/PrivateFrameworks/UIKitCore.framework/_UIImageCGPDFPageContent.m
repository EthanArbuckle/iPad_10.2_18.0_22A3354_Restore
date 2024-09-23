@implementation _UIImageCGPDFPageContent

- (_UIImageCGPDFPageContent)initWithCGPDFPage:(CGPDFPage *)a3 scale:(double)a4
{
  CFTypeID v8;
  _UIImageCGPDFPageContent *v9;
  void *v11;
  void *v12;
  objc_super v13;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIImageContent.m"), 1568, CFSTR("Need a pdfPageRef"));

  }
  v8 = CFGetTypeID(a3);
  if (v8 != CGPDFPageGetTypeID())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIImageContent.m"), 1569, CFSTR("pdfPageRef passed is not a CGPDFPageRef"));

  }
  v13.receiver = self;
  v13.super_class = (Class)_UIImageCGPDFPageContent;
  v9 = -[_UIImageContent initWithScale:](&v13, sel_initWithScale_, a4);
  if (v9)
    v9->_pdfPageRef = CGPDFPageRetain(a3);
  return v9;
}

- (_UIImageCGPDFPageContent)initWithScale:(double)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIImageContent.m"), 1580, CFSTR("You need to use -initWithCGPDFPage:scale:"));

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  CGPDFPageRelease(self->_pdfPageRef);
  v3.receiver = self;
  v3.super_class = (Class)_UIImageCGPDFPageContent;
  -[_UIImageCGPDFPageContent dealloc](&v3, sel_dealloc);
}

- (id)typeName
{
  return CFSTR("PDF");
}

- (BOOL)canScaleImageToTargetResolution
{
  return 1;
}

- (BOOL)canEmitVectorDrawingCommands
{
  return 1;
}

- (BOOL)isCGPDFPage
{
  return 1;
}

- (CGPDFPage)CGPDFPage
{
  return self->_pdfPageRef;
}

- (CGSize)sizeInPixels
{
  double width;
  double height;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;
  CGRect BoxRect;

  BoxRect = CGPDFPageGetBoxRect(self->_pdfPageRef, kCGPDFMediaBox);
  width = BoxRect.size.width;
  height = BoxRect.size.height;
  -[_UIImageContent scale](self, "scale", BoxRect.origin.x, BoxRect.origin.y);
  v6 = v5 * width;
  -[_UIImageContent scale](self, "scale");
  v8 = height * v7;
  v9 = v6;
  result.height = v8;
  result.width = v9;
  return result;
}

- (double)vectorScale
{
  return 1.0;
}

- (BOOL)isEqual:(id)a3
{
  CGPDFPage **v4;
  BOOL v5;
  objc_super v7;

  v4 = (CGPDFPage **)a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIImageCGPDFPageContent;
  if (-[_UIImageContent isEqual:](&v7, sel_isEqual_, v4))
    v5 = self->_pdfPageRef == v4[5];
  else
    v5 = 0;

  return v5;
}

- (unint64_t)hash
{
  return (unint64_t)self->_pdfPageRef;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CGPDFPage:%p"), self->_pdfPageRef);
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
  CGContextDrawPDFPage(a5, self->_pdfPageRef);
}

@end
