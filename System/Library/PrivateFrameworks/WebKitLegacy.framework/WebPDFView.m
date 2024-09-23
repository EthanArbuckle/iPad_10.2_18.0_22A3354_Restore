@implementation WebPDFView

+ (id)supportedMIMETypes
{
  return &unk_1E9D95BE8;
}

+ (CGColor)shadowColor
{
  CGColor *result;
  CGColorRef v3;

  if (_MergedGlobals_5 == 1)
    return (CGColor *)qword_1F0166068;
  createCGColorWithDeviceWhite(0.0, 0.666666667, &v3);
  result = v3;
  qword_1F0166068 = (uint64_t)v3;
  _MergedGlobals_5 = 1;
  return result;
}

+ (CGColor)backgroundColor
{
  CGColor *result;
  CGColorRef v3;

  if (byte_1F0166061 == 1)
    return (CGColor *)qword_1F0166070;
  createCGColorWithDeviceWhite(0.8, 1.0, &v3);
  result = v3;
  qword_1F0166070 = (uint64_t)v3;
  byte_1F0166061 = 1;
  return result;
}

+ (Class)_representationClassForWebFrame:(id)a3
{
  objc_msgSend((id)objc_msgSend(a3, "webView"), "mainFrame");
  return (Class)objc_opt_class();
}

- (void)dealloc
{
  CGPDFDocument *PDFDocument;
  objc_super v4;

  PDFDocument = self->_PDFDocument;
  if (PDFDocument)
    CGPDFDocumentRelease(PDFDocument);
  free(self->_pageRects);
  v4.receiver = self;
  v4.super_class = (Class)WebPDFView;
  -[WebPDFView dealloc](&v4, sel_dealloc);
}

- (void)drawPage:(CGPDFPage *)a3
{
  CGContext *v5;
  CGRect *v6;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGColor *v11;
  CGColorRef v12;
  CGFloat MinX;
  CGFloat MinY;
  CGFloat v15;
  CGFloat v16;
  CGAffineTransform v17;
  uint64_t v18;
  CGColorRef color;
  CGSize v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect BoxRect;

  v5 = (CGContext *)WKGetCurrentGraphicsContext();
  v6 = &self->_pageRects[CGPDFPageGetPageNumber(a3)];
  x = v6[-1].origin.x;
  y = v6[-1].origin.y;
  width = v6[-1].size.width;
  height = v6[-1].size.height;
  CGContextSaveGState(v5);
  v11 = (CGColor *)objc_msgSend((id)objc_opt_class(), "shadowColor");
  v20.width = 0.0;
  v20.height = 2.0;
  CGContextSetShadowWithColor(v5, v20, 3.0, v11);
  v18 = 0x11040000FFFFFFFFLL;
  WebCore::cachedCGColor();
  CGContextSetFillColorWithColor(v5, color);
  v12 = color;
  color = 0;
  if (v12)
    CFRelease(v12);
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  CGContextFillRect(v5, v21);
  CGContextRestoreGState(v5);
  CGContextSaveGState(v5);
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  MinX = CGRectGetMinX(v22);
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  MinY = CGRectGetMinY(v23);
  CGContextTranslateCTM(v5, MinX, MinY);
  CGContextScaleCTM(v5, 1.0, -1.0);
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  v15 = CGRectGetHeight(v24);
  CGContextTranslateCTM(v5, 0.0, -v15);
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  v16 = CGRectGetWidth(v25);
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  v27.size.height = CGRectGetHeight(v26);
  v27.origin.x = 0.0;
  v27.origin.y = 0.0;
  v27.size.width = v16;
  CGPDFPageGetDrawingTransform(&v17, a3, kCGPDFCropBox, v27, 0, 1);
  CGContextConcatCTM(v5, &v17);
  BoxRect = CGPDFPageGetBoxRect(a3, kCGPDFCropBox);
  CGContextClipToRect(v5, BoxRect);
  CGContextDrawPDFPage(v5, a3);
  CGContextRestoreGState(v5);
}

- (id)_pagesInRect:(CGRect)a3
{
  void *v4;
  unint64_t NumberOfPages;
  void *v6;
  size_t v7;
  unint64_t v8;
  CGPDFPageRef Page;
  size_t v10;
  size_t v11;
  unint64_t v12;
  CGPDFPageRef v13;
  CGPDFPageRef v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  v16 = a3;
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  NumberOfPages = CGPDFDocumentGetNumberOfPages(self->_PDFDocument);
  v6 = bsearch(&v16, self->_pageRects, NumberOfPages, 0x20uLL, (int (__cdecl *)(const void *, const void *))comparePageRects);
  if (v6)
  {
    v7 = (int64_t)((uint64_t)v6 - (unint64_t)self->_pageRects) >> 5;
    v8 = v7 + 1;
    Page = CGPDFDocumentGetPage(self->_PDFDocument, v7 + 1);
    if (Page)
    {
      objc_msgSend(v4, "addObject:", Page);
      v10 = v7;
      if (v7 - 1 < NumberOfPages)
      {
        v11 = v7;
        do
        {
          v17 = CGRectInset(self->_pageRects[v11 - 1], 0.0, -16.0);
          if (!CGRectIntersectsRect(v17, v16))
            break;
          v13 = CGPDFDocumentGetPage(self->_PDFDocument, v7);
          if (v13)
            objc_msgSend(v4, "addObject:", v13);
          v12 = v7 - 2;
          --v7;
          --v11;
        }
        while (v12 < NumberOfPages);
      }
      if (v8 < NumberOfPages)
      {
        do
        {
          v18 = CGRectInset(self->_pageRects[v10 + 1], 0.0, -16.0);
          if (!CGRectIntersectsRect(v18, v16))
            break;
          v15 = CGPDFDocumentGetPage(self->_PDFDocument, ++v8);
          if (v15)
            objc_msgSend(v4, "addObject:", v15);
          ++v10;
        }
        while (NumberOfPages != v8);
      }
    }
  }
  return v4;
}

- (void)drawRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGContext *v8;
  CGColor *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  CGRect v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (CGContext *)WKGetCurrentGraphicsContext();
  CGContextSaveGState(v8);
  v9 = (CGColor *)objc_msgSend((id)objc_opt_class(), "backgroundColor");
  CGContextSetFillColorWithColor(v8, v9);
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  CGContextFillRect(v8, v13);
  CGContextRestoreGState(v8);
  if (self->_PDFDocument)
  {
    v10 = (void *)objc_msgSend(-[WebPDFView _pagesInRect:](self, "_pagesInRect:", x, y, width, height), "objectEnumerator");
    v11 = objc_msgSend(v10, "nextObject");
    if (v11)
    {
      v12 = v11;
      do
      {
        -[WebPDFView drawPage:](self, "drawPage:", v12);
        v12 = objc_msgSend(v10, "nextObject");
      }
      while (v12);
    }
  }
}

- (void)setDataSource:(id)a3
{
  void *v4;
  void *m_ptr;
  void *v6;
  void *v7;
  double v8;
  double v9;

  if (!self->dataSourceHasBeenSet)
  {
    if (!self->_title.m_ptr)
    {
      v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "request"), "URL"), "lastPathComponent"), "copy");
      m_ptr = self->_title.m_ptr;
      self->_title.m_ptr = v4;
      if (m_ptr)
        CFRelease(m_ptr);
    }
    v6 = (void *)-[WebPDFView superview](self, "superview", a3);
    if (v6)
    {
      v7 = v6;
      objc_msgSend(v6, "bounds");
      -[WebPDFView convertRect:fromView:](self, "convertRect:fromView:", v7);
      -[WebPDFView setBoundsSize:](self, "setBoundsSize:", v8, v9);
      self->dataSourceHasBeenSet = 1;
    }
  }
}

- (void)layout
{
  -[WebPDFView setNeedsDisplay:](self, "setNeedsDisplay:", 1);
}

- (void)_computePageRects
{
  size_t NumberOfPages;
  uint64_t v4;
  double v5;
  size_t v6;
  double v7;
  CGRect *v8;
  CGPDFPage *Page;
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  double v14;
  double v15;
  CGRect *pageRects;
  unint64_t v17;
  double *p_x;
  unint64_t v19;
  float v20;
  float v21;
  size_t v22;
  double *p_width;
  float v24;
  CGAffineTransform v25;
  CGRect BoxRect;
  CGRect v27;
  CGRect v28;

  NumberOfPages = CGPDFDocumentGetNumberOfPages(self->_PDFDocument);
  self->_pageRects = (CGRect *)malloc_type_malloc(32 * NumberOfPages, 0x1000040E0EAB150uLL);
  if (!NumberOfPages)
  {
    -[WebPDFView setBoundsSize:](self, "setBoundsSize:", 16.0, 8.0);
    return;
  }
  v4 = 0;
  v5 = 0.0;
  v6 = 1;
  v7 = 8.0;
  do
  {
    Page = CGPDFDocumentGetPage(self->_PDFDocument, v6);
    BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFCropBox);
    x = BoxRect.origin.x;
    y = BoxRect.origin.y;
    width = BoxRect.size.width;
    height = BoxRect.size.height;
    v14 = (double)CGPDFPageGetRotationAngle(Page) * 0.0174532925;
    if (v14 != 0.0)
    {
      CGAffineTransformMakeRotation(&v25, v14);
      v27.origin.x = x;
      v27.origin.y = y;
      v27.size.width = width;
      v27.size.height = height;
      v28 = CGRectApplyAffineTransform(v27, &v25);
      x = v28.origin.x;
      *(float *)&v28.origin.x = v28.size.width;
      width = roundf(*(float *)&v28.origin.x);
      *(float *)&v28.origin.x = v28.size.height;
      height = roundf(*(float *)&v28.origin.x);
    }
    v8 = &self->_pageRects[v4];
    v8->size.width = width;
    v8->size.height = height;
    v8->origin.x = x;
    v8->origin.y = v7;
    v7 = v7 + height + 8.0;
    if (v5 < width)
      v5 = width;
    ++v6;
    ++v4;
  }
  while (v6 <= NumberOfPages);
  v15 = v5 + 16.0;
  -[WebPDFView setBoundsSize:](self, "setBoundsSize:", v5 + 16.0, v7);
  pageRects = self->_pageRects;
  if (NumberOfPages < 2)
  {
    v17 = 0;
LABEL_14:
    v22 = NumberOfPages - v17;
    p_width = &pageRects[v17].size.width;
    do
    {
      v24 = (v15 - *p_width) * 0.5;
      *(p_width - 2) = roundf(v24);
      p_width += 4;
      --v22;
    }
    while (v22);
    return;
  }
  v17 = NumberOfPages & 0xFFFFFFFFFFFFFFFELL;
  p_x = &pageRects[1].origin.x;
  v19 = NumberOfPages & 0xFFFFFFFFFFFFFFFELL;
  do
  {
    v20 = (v15 - *(p_x - 2)) * 0.5;
    v21 = (v15 - p_x[2]) * 0.5;
    *(p_x - 4) = roundf(v20);
    *p_x = roundf(v21);
    p_x += 8;
    v19 -= 2;
  }
  while (v19);
  if (NumberOfPages != v17)
    goto LABEL_14;
}

- (void)_checkPDFTitle
{
  CGPDFDocument *PDFDocument;
  CGPDFDictionary *Info;
  const __CFString *v5;
  __CFString *v6;
  void *m_ptr;
  uint64_t v8;
  StringImpl *v9;
  WTF::StringImpl *v10;
  WTF::StringImpl *v11;
  char v12;
  CGPDFStringRef value;

  PDFDocument = self->_PDFDocument;
  if (PDFDocument)
  {
    Info = CGPDFDocumentGetInfo(PDFDocument);
    value = 0;
    if (CGPDFDictionaryGetString(Info, "Title", &value))
    {
      v5 = CGPDFStringCopyTextString(value);
      if (v5)
      {
        v6 = (__CFString *)v5;
        if (CFStringGetLength(v5))
        {
          CFRetain(v6);
          m_ptr = self->_title.m_ptr;
          self->_title.m_ptr = v6;
          if (m_ptr)
            CFRelease(m_ptr);
          v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(-[WAKView _frame](self, "_frame") + 8) + 8) + 280)
                         + 16);
          MEMORY[0x1D82A3998](&v11, self->_title.m_ptr);
          v12 = 0;
          (*(void (**)(uint64_t, WTF::StringImpl **))(*(_QWORD *)v8 + 296))(v8, &v11);
          v10 = v11;
          v11 = 0;
          if (v10)
          {
            if (*(_DWORD *)v10 == 2)
              WTF::StringImpl::destroy(v10, v9);
            else
              *(_DWORD *)v10 -= 2;
          }
        }
        CFRelease(v6);
      }
    }
  }
}

- (void)finishedLoadingWithDataSource:(id)a3
{
  CGDataProvider *v5;
  CGDataProvider *v6;
  CGPDFDocument *v7;
  void *v8;
  const OpaqueJSContext *v9;
  OpaqueJSClass *v10;
  OpaqueJSValue *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  StringImpl *v15;
  unsigned int *v16;
  unsigned int v17;
  unsigned int v18;
  WTF::StringImpl *v19;
  WTF *v20;
  void *v21;
  WTF::StringImpl *v22;
  JSStringRef script;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = CGDataProviderCreateWithCFData((CFDataRef)objc_msgSend(a3, "data"));
  if (v5)
  {
    v6 = v5;
    v7 = CGPDFDocumentCreateWithProvider(v5);
    self->_PDFDocument = v7;
    if (v7)
    {
      -[WebPDFView _checkPDFTitle](self, "_checkPDFTitle");
      -[WebPDFView _computePageRects](self, "_computePageRects");
      v8 = allScriptsInPDFDocument(self->_PDFDocument);
      if (objc_msgSend(v8, "count"))
      {
        v9 = JSGlobalContextCreate(0);
        {
          v10 = (OpaqueJSClass *)jsPDFDocClass(void)::jsPDFDocClass;
        }
        else
        {
          v10 = JSClassCreate(&jsPDFDocClass(void)::jsPDFDocClassDefinition);
          jsPDFDocClass(void)::jsPDFDocClass = (uint64_t)v10;
        }
        v11 = JSObjectMake(v9, v10, a3);
        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        v12 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v12)
        {
          v13 = *(_QWORD *)v25;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v25 != v13)
                objc_enumerationMutation(v8);
              MEMORY[0x1D82A3998](&v22, *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
              OpaqueJSString::tryCreate();
              JSEvaluateScript(v9, script, v11, 0, 0, 0);
              v16 = (unsigned int *)script;
              script = 0;
              if (!v16)
                goto LABEL_16;
              do
              {
                v17 = __ldaxr(v16);
                v18 = v17 - 1;
              }
              while (__stlxr(v18, v16));
              if (!v18)
              {
                atomic_store(1u, v16);
                OpaqueJSString::~OpaqueJSString((OpaqueJSString *)v16);
                WTF::fastFree(v20, v21);
                v19 = v22;
                v22 = 0;
                if (!v19)
                  continue;
              }
              else
              {
LABEL_16:
                v19 = v22;
                v22 = 0;
                if (!v19)
                  continue;
              }
              if (*(_DWORD *)v19 == 2)
                WTF::StringImpl::destroy(v19, v15);
              else
                *(_DWORD *)v19 -= 2;
            }
            v12 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          }
          while (v12);
        }
        JSGlobalContextRelease(v9);
        -[WebPDFView setNeedsDisplay:](self, "setNeedsDisplay:", 1);
      }
    }
    CFRelease(v6);
  }
}

- (BOOL)canProvideDocumentSource
{
  return 0;
}

- (id)documentSource
{
  return 0;
}

- (id)title
{
  return self->_title.m_ptr;
}

- (unsigned)pageNumberForRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  float v13;
  size_t PageNumber;
  CGRect v16;
  CGRect v17;

  if (!self->_PDFDocument)
    return 0;
  if (!self->_pageRects)
    return 0;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = -[WebPDFView _pagesInRect:](self, "_pagesInRect:");
  v9 = objc_msgSend(v8, "count");
  if (!v9)
    return 0;
  v10 = v9;
  v11 = 0;
  v12 = 0;
  v13 = 0.0;
  do
  {
    PageNumber = CGPDFPageGetPageNumber((CGPDFPageRef)objc_msgSend(v8, "objectAtIndex:", v12));
    v17.origin.x = x;
    v17.origin.y = y;
    v17.size.width = width;
    v17.size.height = height;
    v16 = CGRectIntersection(self->_pageRects[PageNumber - 1], v17);
    *(float *)&v16.origin.x = v16.size.width * v16.size.height;
    if (v13 < *(float *)&v16.origin.x)
    {
      v13 = v16.size.width * v16.size.height;
      v11 = PageNumber;
    }
    ++v12;
  }
  while (v10 != v12);
  return v11;
}

- (unsigned)totalPages
{
  CGPDFDocument *PDFDocument;

  PDFDocument = self->_PDFDocument;
  if (PDFDocument)
    LODWORD(PDFDocument) = CGPDFDocumentGetNumberOfPages(PDFDocument);
  return PDFDocument;
}

- (CGPDFDocument)doc
{
  return self->_PDFDocument;
}

- (CGRect)rectForPageNumber:(unsigned int)a3
{
  CGRect *pageRects;
  BOOL v4;
  double *p_x;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  pageRects = self->_pageRects;
  v4 = pageRects != 0;
  p_x = &pageRects[a3 - 1].origin.x;
  if (a3 == 0 || !v4)
    p_x = (double *)MEMORY[0x1E0C9D628];
  v6 = *p_x;
  v7 = p_x[1];
  v8 = p_x[2];
  v9 = p_x[3];
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (void).cxx_destruct
{
  void *m_ptr;

  m_ptr = self->_title.m_ptr;
  self->_title.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 12) = 0;
  return self;
}

@end
