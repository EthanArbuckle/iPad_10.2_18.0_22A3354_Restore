@implementation UITallPDFPrintFormatter

- (UITallPDFPrintFormatter)initWithPDFURL:(id)a3 pdfPassword:(id)a4
{
  id v7;
  id v8;
  UITallPDFPrintFormatter *v9;
  UITallPDFPrintFormatter *v10;
  CGPDFDocument *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)UITallPDFPrintFormatter;
  v9 = -[UIPrintFormatter init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_rotate90 = 0;
    v9->_pdfScaleFactor = 1.0;
    objc_storeStrong((id *)&v9->_pdfPath, a3);
    v11 = CGPDFDocumentCreateWithURL((CFURLRef)v10->_pdfPath);
    v10->_pdfDocRef = v11;
    if (v8)
    {
      if (v11 && CGPDFDocumentIsEncrypted(v11))
        CGPDFDocumentUnlockWithPassword(v10->_pdfDocRef, (const char *)objc_msgSend(objc_retainAutorelease(v8), "cStringUsingEncoding:", 4));
    }
  }

  return v10;
}

- (UITallPDFPrintFormatter)initWithPDFData:(id)a3 pdfPassword:(id)a4
{
  const __CFData *v6;
  id v7;
  UITallPDFPrintFormatter *v8;
  UITallPDFPrintFormatter *v9;
  CGDataProvider *v10;
  CGDataProvider *v11;
  CGPDFDocument *pdfDocRef;
  objc_super v14;

  v6 = (const __CFData *)a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)UITallPDFPrintFormatter;
  v8 = -[UIPrintFormatter init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_rotate90 = 0;
    v8->_pdfScaleFactor = 1.0;
    if (v6)
    {
      v10 = CGDataProviderCreateWithCFData(v6);
      v11 = v10;
      if (v10)
        v9->_pdfDocRef = CGPDFDocumentCreateWithProvider(v10);
      CGDataProviderRelease(v11);
      if (v7)
      {
        pdfDocRef = v9->_pdfDocRef;
        if (pdfDocRef)
        {
          if (CGPDFDocumentIsEncrypted(pdfDocRef))
            CGPDFDocumentUnlockWithPassword(v9->_pdfDocRef, (const char *)objc_msgSend(objc_retainAutorelease(v7), "cStringUsingEncoding:", 4));
        }
      }
    }
  }

  return v9;
}

- (int64_t)_recalcPageCount
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGPDFDocument *pdfDocRef;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  int NumberOfPages;
  CGPDFPage *Page;
  unint64_t v14;
  double v15;
  double v16;
  CGFloat v17;
  BOOL v18;
  BOOL v19;
  CGFloat v21;
  double v22;
  double v23;
  objc_super v24;
  objc_super v25;
  CGRect BoxRect;
  CGRect v27;
  CGRect v28;

  v25.receiver = self;
  v25.super_class = (Class)UITallPDFPrintFormatter;
  -[UIPrintFormatter _pageContentRect:](&v25, sel__pageContentRect_, 0);
  self->_rotate90 = 0;
  self->_pdfScaleFactor = 1.0;
  self->_shiftUpLength = 0.0;
  pdfDocRef = self->_pdfDocRef;
  if (pdfDocRef)
  {
    v8 = v3;
    v9 = v4;
    v10 = v5;
    v11 = v6;
    NumberOfPages = CGPDFDocumentGetNumberOfPages(pdfDocRef);
    Page = CGPDFDocumentGetPage(self->_pdfDocRef, 1uLL);
    BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFCropBox);
    v14 = 0;
    if (BoxRect.size.height > 0.0 && BoxRect.size.width > 0.0 && v11 > 0.0 && v10 > 0.0)
    {
      v15 = BoxRect.size.width / BoxRect.size.height;
      v16 = v10 / v11;
      if (fabs((BoxRect.size.width / BoxRect.size.height - v10 / v11) / (v10 / v11)) < 0.100000001)
      {
        v17 = BoxRect.size.width / v10;
LABEL_20:
        self->_pdfScaleFactor = v17;
        return NumberOfPages;
      }
      v18 = v15 > 1.0 && v16 < 1.0;
      if (v18 || (v16 > 1.0 ? (v19 = v15 < 1.0) : (v19 = 0), v19))
      {
        if (fabs((1.0 / v15 - v16) / v16) < 0.100000001)
        {
          self->_rotate90 = 1;
          v17 = BoxRect.size.height / v10;
          goto LABEL_20;
        }
      }
      self->_pdfScaleFactor = v10 / BoxRect.size.width;
      v21 = BoxRect.size.height * (v10 / BoxRect.size.width);
      v27.origin.x = v8;
      v27.origin.y = v9;
      v27.size.width = v10;
      v27.size.height = v11;
      v22 = v21 / CGRectGetHeight(v27);
      v14 = vcvtpd_s64_f64(v22);
      v23 = ceil(v22);
      v24.receiver = self;
      v24.super_class = (Class)UITallPDFPrintFormatter;
      -[UIPrintFormatter _pageContentRect:](&v24, sel__pageContentRect_, 0);
      self->_shiftUpLength = -(v21 - CGRectGetHeight(v28) * (double)(uint64_t)v23) - v9;
    }
  }
  else
  {
    NumberOfPages = 0;
    v14 = 0;
  }
  return NumberOfPages * v14;
}

- (void)drawInRect:(CGRect)a3 forPageAtIndex:(int64_t)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGContext *CurrentContext;
  CGPDFDocument *pdfDocRef;
  int NumberOfPages;
  int v13;
  CGPDFPage *Page;
  int64_t v15;
  CGFloat v16;
  objc_super v17;
  CGRect v18;
  CGRect v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  CGContextClipToRect(CurrentContext, v18);
  pdfDocRef = self->_pdfDocRef;
  if (pdfDocRef)
  {
    NumberOfPages = CGPDFDocumentGetNumberOfPages(pdfDocRef);
    if (NumberOfPages)
      v13 = (int)-[UIPrintFormatter pageCount](self, "pageCount") / NumberOfPages;
    else
      v13 = 1;
    Page = CGPDFDocumentGetPage(self->_pdfDocRef, vcvtpd_u64_f64(((double)a4 + 1.0) / (double)v13));
    v15 = a4 - -[UIPrintFormatter startPage](self, "startPage");
    v17.receiver = self;
    v17.super_class = (Class)UITallPDFPrintFormatter;
    -[UIPrintFormatter _pageContentRect:](&v17, sel__pageContentRect_, 0);
    v16 = CGRectGetHeight(v19);
    CGContextTranslateCTM(CurrentContext, x, v16 * (double)v13 - v16 * (double)(v15 % v13) - self->_shiftUpLength);
    CGContextScaleCTM(CurrentContext, self->_pdfScaleFactor, -self->_pdfScaleFactor);
    if (self->_rotate90)
      CGContextRotateCTM(CurrentContext, 90.0);
    if (-[UIPrintFormatter imagePDFAnnotations](self, "imagePDFAnnotations"))
      CGContextDrawPDFPageWithAnnotations();
    else
      CGContextDrawPDFPage(CurrentContext, Page);
  }
  CGContextRestoreGState(CurrentContext);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pdfPath, 0);
}

@end
