@implementation _UIImageCUIVectorImageContent

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  void *v5;
  CUINamedVectorImage *v6;
  CUINamedVectorImage *v7;
  CUINamedVectorImage *v8;
  BOOL v9;
  char v10;

  v4 = a3;
  if (+[_UIImageContent content:isEqualToContent:]((uint64_t)_UIImageContent, self, v4))
  {
    v5 = (void *)v4[6];
    v6 = self->_vectorImage;
    v7 = v5;
    v8 = v7;
    if (v6 == v7)
    {
      v10 = 1;
    }
    else
    {
      if (v6)
        v9 = v7 == 0;
      else
        v9 = 1;
      if (v9)
        v10 = 0;
      else
        v10 = -[CUINamedVectorImage isEqual:](v6, "isEqual:", v7);
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)canScaleImageToTargetResolution
{
  return 1;
}

- (unint64_t)hash
{
  return -[CUINamedVectorImage hash](self->_vectorImage, "hash");
}

- (BOOL)_canProvideCGImageDirectly
{
  return 1;
}

- (_UIImageCUIVectorImageContent)initWithCGImage:(CGImage *)a3 CUIVectorImage:(id)a4 scale:(double)a5
{
  id v10;
  _UIImageCUIVectorImageContent *v11;
  void *v13;
  objc_super v14;

  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_UIImageCUIVectorImageContent;
  v11 = -[_UIImageCGImageContent initWithCGImage:scale:](&v14, sel_initWithCGImage_scale_, a3, a5);
  if (v11)
  {
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("_UIImageContent.m"), 1737, CFSTR("Need a valid vector image!"));

    }
    objc_storeStrong((id *)&v11->_vectorImage, a4);
  }

  return v11;
}

- (CGImage)_provideCGImageWithSize:(CGSize)a3 scale:(double)a4
{
  uint64_t v4;
  uint64_t v5;
  const void *v6;

  if (a3.width > 0.0
    && a3.height > 0.0
    && (v6 = (const void *)-[CUINamedVectorImage rasterizeImageUsingScaleFactor:forTargetSize:](self->_vectorImage, "rasterizeImageUsingScaleFactor:forTargetSize:", a4, a3.width, a3.height, v4, v5)) != 0)
  {
    return (CGImage *)CFAutorelease(v6);
  }
  else
  {
    return 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vectorImage, 0);
}

- (_UIImageCUIVectorImageContent)initWithScale:(double)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIImageContent.m"), 1746, CFSTR("You need to use -initWithCUIVectorImage:scale:"));

  return 0;
}

- (id)typeName
{
  return CFSTR("vector");
}

- (BOOL)canEmitVectorDrawingCommands
{
  return 1;
}

- (_UIImageCUIVectorImageContent)contentWithCGImage:(CGImage *)a3
{
  _UIImageCUIVectorImageContent *v5;
  CUINamedVectorImage *vectorImage;

  v5 = [_UIImageCUIVectorImageContent alloc];
  vectorImage = self->_vectorImage;
  -[_UIImageContent scale](self, "scale");
  return -[_UIImageCUIVectorImageContent initWithCGImage:CUIVectorImage:scale:](v5, "initWithCGImage:CUIVectorImage:scale:", a3, vectorImage);
}

- (void)_prepareForDrawingWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5
{
  double height;
  double width;
  double v10;
  double v11;
  double v12;
  double v13;
  _BOOL4 v14;
  _BOOL4 v15;
  CGPDFPage *v16;
  objc_super v17;
  CGAffineTransform transform;
  CGRect v19;

  height = a3.height;
  width = a3.width;
  -[_UIImageContent size](self, "size");
  v11 = v10;
  v13 = v12;
  if (-[_UIImageCUIVectorImageContent isCGPDFPage](self, "isCGPDFPage"))
    v14 = -[_UIImageCUIVectorImageContent CGPDFPage](objc_retainAutorelease(self), "CGPDFPage") != 0;
  else
    v14 = 0;
  if (-[_UIImageCUIVectorImageContent isCGSVGDocument](self, "isCGSVGDocument"))
    v15 = -[_UIImageCUIVectorImageContent CGSVGDocument](objc_retainAutorelease(self), "CGSVGDocument") != 0;
  else
    v15 = 0;
  if (v14)
  {
    if (v11 == 0.0)
      goto LABEL_16;
  }
  else
  {
    if (v11 == 0.0)
      v15 = 0;
    if (!v15)
      goto LABEL_16;
  }
  if (v13 == 0.0)
  {
LABEL_16:
    v17.receiver = self;
    v17.super_class = (Class)_UIImageCUIVectorImageContent;
    -[_UIImageContent _prepareForDrawingWithSize:scale:inContext:](&v17, sel__prepareForDrawingWithSize_scale_inContext_, a5, width, height, a4);
    return;
  }
  CGContextTranslateCTM(a5, 0.0, height);
  CGContextScaleCTM(a5, 1.0, -1.0);
  CGContextScaleCTM(a5, width / v11, height / v13);
  if (v14)
  {
    v16 = -[_UIImageCUIVectorImageContent CGPDFPage](objc_retainAutorelease(self), "CGPDFPage");
    v19.origin.x = 0.0;
    v19.origin.y = 0.0;
    v19.size.width = v11;
    v19.size.height = v13;
    CGPDFPageGetDrawingTransform(&transform, v16, kCGPDFCropBox, v19, 0, 1);
    CGContextConcatCTM(a5, &transform);
  }
}

- (void)_drawWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5 effect:(id)a6
{
  CGFloat height;
  CGFloat width;
  CUINamedVectorImage *vectorImage;
  CGImage *v10;
  CGRect v11;

  if (a3.width > 0.0)
  {
    height = a3.height;
    if (a3.height > 0.0)
    {
      width = a3.width;
      vectorImage = self->_vectorImage;
      -[_UIImageContent scale](self, "scale", a5, a6);
      v10 = (CGImage *)-[CUINamedVectorImage rasterizeImageUsingScaleFactor:forTargetSize:](vectorImage, "rasterizeImageUsingScaleFactor:forTargetSize:");
      v11.origin.x = *(CGFloat *)MEMORY[0x1E0C9D538];
      v11.origin.y = *(CGFloat *)(MEMORY[0x1E0C9D538] + 8);
      v11.size.width = width;
      v11.size.height = height;
      CGContextDrawImage(a5, v11, v10);
      CGImageRelease(v10);
    }
  }
}

- (void)_drawVectorCommandsWithSize:(CGSize)a3 scale:(double)a4 inContext:(CGContext *)a5 effect:(id)a6
{
  double height;
  double width;
  _UIImageCUIVectorImageContent *v11;
  double v12;
  double v13;
  BOOL v14;
  _UIImageCUIVectorImageContent *v15;
  double v16;
  double v17;
  BOOL v18;
  id v19;

  height = a3.height;
  width = a3.width;
  v19 = a6;
  if (-[_UIImageCUIVectorImageContent isCGPDFPage](self, "isCGPDFPage")
    && (v11 = objc_retainAutorelease(self), -[_UIImageCUIVectorImageContent CGPDFPage](v11, "CGPDFPage"))
    && ((-[_UIImageContent CGPDFPageSize](v11, "CGPDFPageSize"), v13 == *MEMORY[0x1E0C9D820])
      ? (v14 = v12 == *(double *)(MEMORY[0x1E0C9D820] + 8))
      : (v14 = 0),
        !v14))
  {
    CGContextDrawPDFPage(a5, -[_UIImageCUIVectorImageContent CGPDFPage](objc_retainAutorelease(v11), "CGPDFPage"));
  }
  else if (-[_UIImageCUIVectorImageContent isCGSVGDocument](self, "isCGSVGDocument")
         && (v15 = objc_retainAutorelease(self), -[_UIImageCUIVectorImageContent CGSVGDocument](v15, "CGSVGDocument"))
         && ((-[_UIImageContent CGSVGDocumentSize](v15, "CGSVGDocumentSize"), v17 == *MEMORY[0x1E0C9D820])
           ? (v18 = v16 == *(double *)(MEMORY[0x1E0C9D820] + 8))
           : (v18 = 0),
             !v18))
  {
    -[_UIImageCUIVectorImageContent CGSVGDocument](objc_retainAutorelease(v15), "CGSVGDocument");
    CGContextDrawSVGDocument();
  }
  else
  {
    -[_UIImageCUIVectorImageContent _drawWithSize:scale:inContext:effect:](self, "_drawWithSize:scale:inContext:effect:", a5, v19, width, height, a4);
  }

}

- (BOOL)isCGPDFPage
{
  uint64_t v2;

  v2 = objc_opt_class();
  return v2 == objc_opt_class();
}

- (CGPDFPage)CGPDFPage
{
  CUINamedVectorImage *v3;
  CGPDFPage *Page;

  if (!-[_UIImageCUIVectorImageContent isCGPDFPage](self, "isCGPDFPage"))
    return 0;
  v3 = self->_vectorImage;
  if (-[CUINamedVectorImage pdfDocument](v3, "pdfDocument")
    && CGPDFDocumentGetNumberOfPages((CGPDFDocumentRef)-[CUINamedVectorImage pdfDocument](v3, "pdfDocument")))
  {
    Page = CGPDFDocumentGetPage((CGPDFDocumentRef)-[CUINamedVectorImage pdfDocument](v3, "pdfDocument"), 1uLL);
  }
  else
  {
    Page = 0;
  }

  return Page;
}

- (BOOL)isCGSVGDocument
{
  uint64_t v2;

  v2 = objc_opt_class();
  return v2 == objc_opt_class();
}

- (CGSVGDocument)CGSVGDocument
{
  if (-[_UIImageCUIVectorImageContent isCGSVGDocument](self, "isCGSVGDocument"))
    return (CGSVGDocument *)-[CUINamedVectorImage svgDocument](self->_vectorImage, "svgDocument");
  else
    return 0;
}

- (double)vectorScale
{
  return 1.0;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  CUINamedVectorImage *vectorImage;
  unint64_t v6;
  _UIImageCUIVectorImageContent *v7;
  void *v8;
  uint64_t v9;
  CUINamedVectorImage *v10;
  unint64_t v11;
  _UIImageCUIVectorImageContent *v12;
  void *v13;
  objc_super v15;

  if (-[_UIImageCUIVectorImageContent isCGPDFPage](self, "isCGPDFPage"))
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = objc_opt_class();
    vectorImage = self->_vectorImage;
    v6 = atomic_load((unint64_t *)&self->super._imageRef);
    v7 = objc_retainAutorelease(self);
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p vector:%p (CGImageRef:%p + CGPDFPage:%p)"), v4, v7, vectorImage, v6, -[_UIImageCUIVectorImageContent CGPDFPage](v7, "CGPDFPage"));
  }
  else
  {
    if (!-[_UIImageCUIVectorImageContent isCGSVGDocument](self, "isCGSVGDocument"))
    {
      v15.receiver = self;
      v15.super_class = (Class)_UIImageCUIVectorImageContent;
      -[_UIImageCGImageContent description](&v15, sel_description);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      return v13;
    }
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = objc_opt_class();
    v10 = self->_vectorImage;
    v11 = atomic_load((unint64_t *)&self->super._imageRef);
    v12 = objc_retainAutorelease(self);
    objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@:%p vector:%p (CGImageRef:%p + CGSVGDocument:%p)"), v9, v12, v10, v11, -[_UIImageCUIVectorImageContent CGSVGDocument](v12, "CGSVGDocument"));
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  return v13;
}

@end
