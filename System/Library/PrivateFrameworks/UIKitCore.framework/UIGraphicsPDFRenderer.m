@implementation UIGraphicsPDFRenderer

- (void)pushContext:(id)a3
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CGContext *v13;
  int *ContextStack;
  CGContextRef v15;
  int v16;
  int *v17;

  v3 = a3;
  v4 = malloc_type_malloc(0x48uLL, 0x1000040773C5DECuLL);
  objc_msgSend(v3, "documentBounds");
  *v4 = v5;
  v4[1] = v6;
  v4[2] = v7;
  v4[3] = v8;
  objc_msgSend(v3, "pageBounds");
  v4[4] = v9;
  v4[5] = v10;
  v4[6] = v11;
  v4[7] = v12;
  *((_BYTE *)v4 + 64) = objc_msgSend(v3, "inPage");
  v13 = (CGContext *)objc_msgSend(v3, "CGContext");

  ContextStack = (int *)GetContextStack(1);
  v15 = CGContextRetain(v13);
  v16 = *ContextStack;
  v17 = &ContextStack[6 * *ContextStack];
  *((_QWORD *)v17 + 1) = v15;
  v17[4] = 2;
  *((_QWORD *)v17 + 3) = v4;
  *ContextStack = v16 + 1;
}

- (void)popContext:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (objc_msgSend(v4, "inPage"))
    CGPDFContextEndPage((CGContextRef)objc_msgSend(v4, "CGContext"));
  v5.receiver = self;
  v5.super_class = (Class)UIGraphicsPDFRenderer;
  -[UIGraphicsRenderer popContext:](&v5, sel_popContext_, v4);
  CGPDFContextClose((CGContextRef)objc_msgSend(v4, "CGContext"));

}

+ (Class)rendererContextClass
{
  return (Class)objc_opt_class();
}

+ (CGContext)contextWithFormat:(id)a3
{
  id v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  const __CFDictionary *v12;
  void *v13;
  const __CFURL *v14;
  const CGRect *v15;
  CGContext *v16;
  void *v17;
  __CFData *v18;
  CGDataConsumer *v19;
  const CGRect *v20;
  uint64_t v22;
  CGRect v23;
  CGRect v24;

  v3 = a3;
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "documentInfo", *(_QWORD *)&v4, *(_QWORD *)&v6, *(_QWORD *)&v8, *(_QWORD *)&v10);
  v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "outputURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v3, "outputURL");
    v14 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
    v23.origin.x = v5;
    v23.origin.y = v7;
    v23.size.width = v9;
    v23.size.height = v11;
    if (CGRectIsEmpty(v23))
      v15 = 0;
    else
      v15 = (const CGRect *)&v22;
    v16 = CGPDFContextCreateWithURL(v14, v15, v12);

  }
  else
  {
    objc_msgSend(v3, "pdfData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17
      && (objc_msgSend(v3, "pdfData"),
          v18 = (__CFData *)objc_claimAutoreleasedReturnValue(),
          v19 = CGDataConsumerCreateWithCFData(v18),
          v18,
          v19))
    {
      v24.origin.x = v5;
      v24.origin.y = v7;
      v24.size.width = v9;
      v24.size.height = v11;
      if (CGRectIsEmpty(v24))
        v20 = 0;
      else
        v20 = (const CGRect *)&v22;
      v16 = CGPDFContextCreate(v19, v20, v12);
      CGDataConsumerRelease(v19);
    }
    else
    {
      v16 = 0;
    }
  }

  return v16;
}

+ (void)prepareCGContext:(CGContext *)a3 withRendererContext:(id)a4
{
  id v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  __int128 v23;
  CGRect v24;

  v4 = a4;
  objc_msgSend(v4, "format");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v21 = v6;
  v22 = v8;
  *(double *)&v23 = v10;
  *((double *)&v23 + 1) = v12;
  objc_msgSend(v5, "documentInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", *MEMORY[0x1E0C9DB58]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "getBytes:length:", &v21, 32);
    v7 = v21;
    v9 = v22;
    v13 = *((double *)&v23 + 1);
    v11 = *(double *)&v23;
  }
  v24.origin.x = v7;
  v24.origin.y = v9;
  v24.size.width = v11;
  v24.size.height = v13;
  if (CGRectIsEmpty(v24))
  {
    v21 = 0.0;
    v22 = 0.0;
    v23 = xmmword_18667DB50;
    v17 = 0.0;
    v18 = 612.0;
    v19 = 792.0;
    v20 = 0.0;
  }
  else
  {
    v20 = v21;
    v17 = v22;
    v19 = *((double *)&v23 + 1);
    v18 = *(double *)&v23;
  }
  objc_msgSend(v4, "setDocumentBounds:", v20, v17, v18, v19, *(_QWORD *)&v21, *(_QWORD *)&v22, v23);
  objc_msgSend(v4, "setPageBounds:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v4, "setInPage:", 0);

}

- (UIGraphicsPDFRenderer)init
{
  void *v3;
  UIGraphicsPDFRenderer *v4;

  +[UIGraphicsRendererFormat preferredFormat](UIGraphicsPDFRendererFormat, "preferredFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[UIGraphicsPDFRenderer initWithBounds:format:](self, "initWithBounds:format:", v3, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

  return v4;
}

- (UIGraphicsPDFRenderer)initWithBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  UIGraphicsPDFRenderer *v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  +[UIGraphicsRendererFormat preferredFormat](UIGraphicsPDFRendererFormat, "preferredFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[UIGraphicsPDFRenderer initWithBounds:format:](self, "initWithBounds:format:", v8, x, y, width, height);

  return v9;
}

- (UIGraphicsPDFRenderer)initWithBounds:(CGRect)bounds format:(UIGraphicsPDFRendererFormat *)format
{
  double height;
  double width;
  double y;
  double x;
  UIGraphicsPDFRendererFormat *v9;
  UIGraphicsPDFRenderer *v10;
  objc_super v12;

  height = bounds.size.height;
  width = bounds.size.width;
  y = bounds.origin.y;
  x = bounds.origin.x;
  v9 = format;
  -[UIGraphicsPDFRendererFormat setPdfData:](v9, "setPdfData:", 0);
  -[UIGraphicsPDFRendererFormat setOutputURL:](v9, "setOutputURL:", 0);
  v12.receiver = self;
  v12.super_class = (Class)UIGraphicsPDFRenderer;
  v10 = -[UIGraphicsRenderer initWithBounds:format:](&v12, sel_initWithBounds_format_, v9, x, y, width, height);

  return v10;
}

- (BOOL)writePDFToURL:(NSURL *)url withActions:(UIGraphicsPDFDrawingActions)actions error:(NSError *)error
{
  UIGraphicsPDFDrawingActions v8;
  NSURL *v9;
  void *v10;

  v8 = actions;
  v9 = url;
  -[UIGraphicsRenderer format](self, "format");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setOutputURL:", v9);

  LOBYTE(error) = -[UIGraphicsRenderer runDrawingActions:completionActions:format:error:](self, "runDrawingActions:completionActions:format:error:", v8, 0, v10, error);
  return (char)error;
}

- (NSData)PDFDataWithActions:(UIGraphicsPDFDrawingActions)actions
{
  objc_class *v4;
  UIGraphicsPDFDrawingActions v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v4 = (objc_class *)MEMORY[0x1E0C99DF0];
  v5 = actions;
  v6 = objc_alloc_init(v4);
  -[UIGraphicsRenderer format](self, "format");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPdfData:", v6);
  LODWORD(self) = -[UIGraphicsRenderer runDrawingActions:completionActions:format:error:](self, "runDrawingActions:completionActions:format:error:", v5, 0, v7, 0);

  if ((_DWORD)self)
    v8 = (id)objc_msgSend(v6, "copy");
  else
    v8 = objc_alloc_init(MEMORY[0x1E0C99D50]);
  v9 = v8;

  return (NSData *)v9;
}

@end
