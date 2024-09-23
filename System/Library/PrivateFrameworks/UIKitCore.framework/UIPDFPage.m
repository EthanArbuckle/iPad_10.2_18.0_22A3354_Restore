@implementation UIPDFPage

- (UIPDFPage)initWithCGPDFPage:(CGPDFPage *)a3
{
  UIPDFPage *v4;
  UIPDFPage *v5;
  size_t PageNumber;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIPDFPage;
  v4 = -[UIPDFPage init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_cgPage = a3;
    CGPDFPageRetain(a3);
    PageNumber = CGPDFPageGetPageNumber(a3);
    v5->_pageNumber = PageNumber;
    v5->_pageIndex = PageNumber - 1;
    v5->_lock._os_unfair_lock_opaque = 0;
  }
  return v5;
}

- (void)setDocument:(id)a3
{
  unint64_t *p_document;

  p_document = (unint64_t *)&self->_document;
  while (!__ldaxr(p_document))
  {
    if (!__stlxr((unint64_t)a3, p_document))
      return;
  }
  __clrex();
}

- (UIPDFPage)initWithDocument:(id)a3 pageNumber:(unint64_t)a4
{
  UIPDFPage *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIPDFPage;
  v5 = -[UIPDFPage init](&v7, sel_init);
  if (v5)
  {
    objc_msgSend(a3, "CGDocument");
    v5->_cgPage = (CGPDFPage *)CGPDFDocumentCopyPage();
    v5->_pageIndex = v5->_pageNumber - 1;
    v5->_lock._os_unfair_lock_opaque = 0;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[UIPDFPage setSelection:](self, "setSelection:", 0);
  -[UIPDFPage setPageImage:](self, "setPageImage:", 0);
  CGPDFPageRemoveLayout();
  CGPDFPageRelease(self->_cgPage);
  v3.receiver = self;
  v3.super_class = (Class)UIPDFPage;
  -[UIPDFPage dealloc](&v3, sel_dealloc);
}

- (void)drawInRect:(CGRect)a3 context:(CGContext *)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGPDFPage *cgPage;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  double v19;
  int v20;
  int v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  double v26;
  double v27;
  CGFloat v28;
  UIPDFPage *v29;
  CGFloat MaxY;
  double MinY;
  double MinX;
  CGFloat MaxX;
  CGFloat tx;
  CGFloat txa;
  CGAffineTransform v36;
  CGAffineTransform v37;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform transform;
  CGRect v41;
  CGRect v42;
  CGRect BoxRect;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  CGContextSaveGState(a4);
  v41.origin.x = x;
  v41.origin.y = y;
  v41.size.width = width;
  v41.size.height = height;
  CGContextClipToRect(a4, v41);
  CGContextSetFillColorWithColor(a4, -[UIColor CGColor](+[UIColor whiteColor](UIColor, "whiteColor"), "CGColor"));
  v42.origin.x = x;
  v42.origin.y = y;
  v42.size.width = width;
  v42.size.height = height;
  CGContextFillRect(a4, v42);
  cgPage = self->_cgPage;
  memset(&v36, 0, 32);
  memset(&transform, 0, sizeof(transform));
  BoxRect = CGPDFPageGetBoxRect(cgPage, kCGPDFCropBox);
  v11 = BoxRect.origin.x;
  v12 = BoxRect.origin.y;
  v13 = BoxRect.size.width;
  v14 = BoxRect.size.height;
  v55 = CGPDFPageGetBoxRect(cgPage, kCGPDFMediaBox);
  v44.origin.x = v11;
  v44.origin.y = v12;
  v44.size.width = v13;
  v44.size.height = v14;
  v45 = CGRectIntersection(v44, v55);
  v15 = v45.origin.x;
  v16 = v45.origin.y;
  v17 = v45.size.width;
  v18 = v45.size.height;
  MinX = CGRectGetMinX(v45);
  v46.origin.x = v15;
  v46.origin.y = v16;
  v46.size.width = v17;
  v46.size.height = v18;
  MinY = CGRectGetMinY(v46);
  v47.origin.x = v15;
  v47.origin.y = v16;
  v47.size.width = v17;
  v47.size.height = v18;
  MaxX = CGRectGetMaxX(v47);
  v48.origin.x = v15;
  v48.origin.y = v16;
  v48.size.width = v17;
  v48.size.height = v18;
  MaxY = CGRectGetMaxY(v48);
  v49.origin.x = v15;
  v49.origin.y = v16;
  v49.size.width = v17;
  v49.size.height = v18;
  tx = CGRectGetWidth(v49);
  v50.origin.x = v15;
  v50.origin.y = v16;
  v50.size.width = v17;
  v50.size.height = v18;
  v19 = CGRectGetHeight(v50);
  v20 = CGPDFPageGetRotationAngle(cgPage) % 360;
  v21 = v20 + (v20 < 0 ? 0x168 : 0);
  if (v21 > 179)
  {
    if (v21 != 180)
    {
      if (v21 == 270)
      {
        v24 = -MinX;
        *(_OWORD *)&v36.a = xmmword_18666F250;
        *(_OWORD *)&v36.c = xmmword_1866830B0;
        v22 = MaxY;
        v23 = v19;
        v19 = tx;
        goto LABEL_11;
      }
LABEL_12:
      abort();
    }
    v36.a = -1.0;
    v36.b = 0.0;
    v36.c = 0.0;
    v36.d = -1.0;
    v22 = MaxX;
    v24 = MaxY;
LABEL_10:
    v23 = tx;
    goto LABEL_11;
  }
  if (!v21)
  {
    v22 = -MinX;
    v24 = -MinY;
    v36.a = 1.0;
    v36.b = 0.0;
    v36.c = 0.0;
    v36.d = 1.0;
    goto LABEL_10;
  }
  if (v21 != 90)
    goto LABEL_12;
  v22 = -MinY;
  *(_OWORD *)&v36.a = xmmword_18667DCB0;
  *(_OWORD *)&v36.c = xmmword_1866721B0;
  v23 = v19;
  v24 = MaxX;
  v19 = tx;
LABEL_11:
  v36.tx = v22;
  v36.ty = v24;
  CGAffineTransformMakeTranslation(&transform, v23 * -0.5, v19 * -0.5);
  t1 = v36;
  t2 = transform;
  CGAffineTransformConcat(&v36, &t1, &t2);
  v51.origin.x = x;
  v51.origin.y = y;
  v51.size.width = width;
  v51.size.height = height;
  txa = CGRectGetMinX(v51);
  v52.origin.x = x;
  v52.origin.y = y;
  v52.size.width = width;
  v52.size.height = height;
  v25 = CGRectGetMinY(v52);
  v53.origin.x = x;
  v53.origin.y = y;
  v53.size.width = width;
  v53.size.height = height;
  v26 = CGRectGetWidth(v53);
  v54.origin.x = x;
  v54.origin.y = y;
  v54.size.width = width;
  v54.size.height = height;
  v27 = CGRectGetHeight(v54);
  v28 = fmin(v26 / v23, v27 / v19);
  CGAffineTransformMakeScale(&t1, v28, v28);
  transform = t1;
  t2 = v36;
  v37 = t1;
  CGAffineTransformConcat(&t1, &t2, &v37);
  v36 = t1;
  CGAffineTransformMakeTranslation(&t1, v26 * 0.5, v27 * 0.5);
  transform = t1;
  t2 = v36;
  v37 = t1;
  CGAffineTransformConcat(&t1, &t2, &v37);
  v36 = t1;
  CGAffineTransformMakeTranslation(&t1, txa, v25);
  transform = t1;
  t2 = v36;
  v37 = t1;
  CGAffineTransformConcat(&t1, &t2, &v37);
  v36 = t1;
  transform = t1;
  CGContextConcatCTM(a4, &transform);
  v29 = self;
  CGContextDrawPDFPage(a4, -[UIPDFPage CGPage](self, "CGPage"));

  CGContextRestoreGState(a4);
}

- (id)getImageIfAvailable
{
  UIImage *v3;
  UIImage *v4;
  UIImage *v5;

  v3 = -[UIPDFPage pageImage](self, "pageImage");
  if (!v3)
    return -[UIPDFPageImageCache getImageIfAvailableForPage:](-[UIPDFDocument pageImageCache](-[UIPDFPage document](self, "document"), "pageImageCache"), "getImageIfAvailableForPage:", -[UIPDFPage pageNumber](self, "pageNumber"));
  v4 = v3;
  v5 = v3;
  return v4;
}

- (void)deliverImageWithWidth:(unint64_t)a3 height:(unint64_t)a4 receiver:(id)a5 selector:(SEL)a6 info:(id)a7
{
  char v7;

  v7 = 1;
  -[UIPDFPageImageCache deliverImageOfPage:maxSize:quality:receiver:selector:info:](-[UIPDFDocument thumbnailCache](-[UIPDFPage document](self, "document"), "thumbnailCache"), "deliverImageOfPage:maxSize:quality:receiver:selector:info:", -[UIPDFPage pageNumber](self, "pageNumber"), &v7, a5, a6, a7, (double)a3, (double)a4);
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;
  CGRect BoxRect;

  BoxRect = CGPDFPageGetBoxRect(self->_cgPage, kCGPDFCropBox);
  width = BoxRect.size.width;
  height = BoxRect.size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGRect)cropBox
{
  return CGPDFPageGetBoxRect(self->_cgPage, kCGPDFCropBox);
}

- (CGRect)cropBoxAccountForRotation
{
  double BoxRectWithRotation;
  double v3;
  double v4;
  double v5;
  CGRect result;

  BoxRectWithRotation = CGPDFPageGetBoxRectWithRotation(self->_cgPage, kCGPDFCropBox);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = BoxRectWithRotation;
  return result;
}

- (CGRect)mediaBox
{
  return CGPDFPageGetBoxRect(self->_cgPage, kCGPDFMediaBox);
}

- (CGRect)mediaBoxAccountForRotation
{
  double BoxRectWithRotation;
  double v3;
  double v4;
  double v5;
  CGRect result;

  BoxRectWithRotation = CGPDFPageGetBoxRectWithRotation(self->_cgPage, kCGPDFMediaBox);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = BoxRectWithRotation;
  return result;
}

- (unint64_t)rotation
{
  int v2;

  v2 = CGPDFPageGetRotationAngle(self->_cgPage) % 360;
  if (v2 >= 0)
    return v2;
  else
    return (v2 + 360);
}

- (id)string
{
  id result;

  result = self->_stringInReadingOrder;
  if (!result)
  {
    CGPDFPageGetLayout();
    result = (id)CGPDFLayoutCreateString();
    self->_stringInReadingOrder = (NSString *)result;
  }
  return result;
}

- (unint64_t)cfCompareFlagsFromNSOptions:(unint64_t)a3
{
  return (a3 & 5 | (16 * ((a3 >> 1) & 1))) ^ 0x10;
}

- (id)findString:(id)a3 fromSelection:(id)a4 options:(unint64_t)a5
{
  id result;
  const __CFString *v10;
  CFIndex v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CFIndex v15;
  CFIndex v16;
  CFStringCompareFlags v17;
  UIPDFSelection *v18;
  CFRange v19;
  CFRange v20;

  result = -[UIPDFPage string](self, "string");
  if (!result)
    return result;
  v10 = (const __CFString *)result;
  if ((a5 & 4) == 0)
  {
    v11 = 0;
    if (!a4)
      goto LABEL_11;
LABEL_6:
    v12 = objc_msgSend(a4, "stringRange");
    if ((a5 & 4) != 0)
      v14 = -1;
    else
      v14 = v13;
    v15 = v14 + v12;
    if (v12 != -1)
      v11 = v15;
    goto LABEL_11;
  }
  v11 = CFStringGetLength((CFStringRef)result) - 1;
  if (a4)
    goto LABEL_6;
LABEL_11:
  if ((a5 & 4) != 0)
  {
    v16 = 0;
  }
  else
  {
    v16 = v11;
    v11 = CFStringGetLength(v10) - v11;
  }
  v17 = -[UIPDFPage cfCompareFlagsFromNSOptions:](self, "cfCompareFlagsFromNSOptions:", a5, 0, 0);
  v20.location = v16;
  v20.length = v11;
  if (!CFStringFindWithOptions(v10, (CFStringRef)a3, v20, v17, &v19))
    return 0;
  v18 = -[UIPDFSelection initWithPage:cgSelection:]([UIPDFSelection alloc], "initWithPage:cgSelection:", self, CGPDFSelectionCreateForStringRange());
  -[UIPDFSelection setStringRange:](v18, "setStringRange:", v19.location, v19.length);
  CGPDFSelectionRelease();
  return v18;
}

- (id)copyPage
{
  os_unfair_lock_s *p_lock;
  UIPDFDocument *document;
  CGPDFPage *v5;
  UIPDFPage *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  document = self->_document;
  if (document && self->_cgPage)
  {
    -[UIPDFDocument CGDocument](document, "CGDocument");
    v5 = (CGPDFPage *)CGPDFDocumentCopyPage();
    if (CGPDFPageGetProperty())
      CGPDFPageSetProperty();
    v6 = -[UIPDFPage initWithCGPDFPage:]([UIPDFPage alloc], "initWithCGPDFPage:", v5);
    CGPDFPageRelease(v5);
    -[UIPDFPage setDocument:](v6, "setDocument:", self->_document);
  }
  else
  {
    v6 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)refresh
{
  if (self->_cgPage)
  {
    os_unfair_lock_lock(&self->_lock);
    CGPDFPageRemoveProperty();
    os_unfair_lock_unlock(&self->_lock);
  }
  -[UIPDFPage clearAnnotations](self, "clearAnnotations");
}

- (id)annotationIn:(id)a3 withIndex:(unint64_t)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (!v6)
    return 0;
  v7 = v6;
  v8 = *(_QWORD *)v13;
LABEL_3:
  v9 = 0;
  while (1)
  {
    if (*(_QWORD *)v13 != v8)
      objc_enumerationMutation(a3);
    v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
    if (objc_msgSend(v10, "index") == a4)
      return v10;
    if (v7 == ++v9)
    {
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        goto LABEL_3;
      return 0;
    }
  }
}

- (id)annotations
{
  id result;
  NSMutableArray **p_annotations;
  void *v5;
  CGPDFDictionary *Dictionary;
  size_t Count;
  size_t v8;
  size_t i;
  id v10;
  void *v11;
  size_t j;
  CGPDFArray *v13;
  CGPDFDictionary *v14;
  size_t v15;
  size_t v16;
  size_t v17;
  id v18;
  id v19;
  void *v20;
  CGPDFDictionaryRef v22;
  char *__s2;
  CGPDFDictionaryRef v24;
  CGPDFArrayRef value;
  CGPDFDictionaryRef dict;

  p_annotations = &self->_annotations;
  result = self->_annotations;
  if (!result)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
    Dictionary = CGPDFPageGetDictionary(self->_cgPage);
    if (Dictionary && (value = 0, CGPDFDictionaryGetArray(Dictionary, "Annots", &value)))
    {
      Count = CGPDFArrayGetCount(value);
      if (!Count)
        goto LABEL_31;
      v8 = Count;
      for (i = 0; i != v8; ++i)
      {
        dict = 0;
        if (CGPDFArrayGetDictionary(value, i, &dict))
        {
          v24 = 0;
          if (CGPDFDictionaryGetName(dict, "Subtype", (const char **)&v24))
          {
            v10 = +[UIPDFAnnotationController newAnnotation:type:](UIPDFAnnotationController, "newAnnotation:type:", dict, v24);
            if (v10)
            {
              v11 = v10;
              objc_msgSend(v10, "setIndex:", i);
              objc_msgSend(v11, "setEditable:", 0);
              objc_msgSend(v11, "setPage:", self);
              objc_msgSend(v5, "addObject:", v11);

            }
          }
        }
      }
      for (j = 0; j != v8; ++j)
      {
        v24 = 0;
        if (CGPDFArrayGetDictionary(value, j, &v24))
        {
          __s2 = 0;
          if (CGPDFDictionaryGetName(v24, "Subtype", (const char **)&__s2) && !strcmp("Popup", __s2))
          {
            v22 = 0;
            if (CGPDFDictionaryGetDictionary(v24, "Parent", &v22))
            {
              v13 = value;
              v14 = v22;
              v15 = CGPDFArrayGetCount(value);
              if (v15)
              {
                v16 = v15;
                v17 = 0;
                while (1)
                {
                  dict = 0;
                  if (CGPDFArrayGetDictionary(v13, v17, &dict) && dict == v14)
                    break;
                  if (v16 == ++v17)
                    goto LABEL_28;
                }
                if ((v17 & 0x8000000000000000) == 0)
                {
                  v18 = -[UIPDFPage annotationIn:withIndex:](self, "annotationIn:withIndex:", v5, v17);
                  v19 = -[UIPDFPage annotationIn:withIndex:](self, "annotationIn:withIndex:", v5, j);
                  if (v18)
                  {
                    v20 = v19;
                    if (v19)
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          objc_msgSend(v18, "setPopup:", v20);
                          objc_msgSend(v20, "setParent:", v18);
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
LABEL_28:
        ;
      }
LABEL_31:
      while (!__ldaxr((unint64_t *)p_annotations))
      {
        if (!__stlxr((unint64_t)v5, (unint64_t *)p_annotations))
          return *p_annotations;
      }
      __clrex();

      return *p_annotations;
    }
    else
    {

      return 0;
    }
  }
  return result;
}

- (void)clearAnnotations
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);

  self->_annotations = 0;
  os_unfair_lock_unlock(p_lock);
}

- (void)removeAllAnnotations
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableArray removeAllObjects](self->_annotations, "removeAllObjects");
  os_unfair_lock_unlock(p_lock);
}

- (void)addAnnotation:(id)a3
{
  unint64_t *p_annotations;
  os_unfair_lock_s *p_lock;
  id v8;

  p_annotations = (unint64_t *)&self->_annotations;
  if (self->_annotations)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    -[NSMutableArray addObject:](self->_annotations, "addObject:", a3);
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
    objc_msgSend(v8, "addObject:", a3);
    while (!__ldaxr(p_annotations))
    {
      if (!__stlxr((unint64_t)v8, p_annotations))
        return;
    }
    __clrex();

  }
}

- (void)removeAnnotation:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  void *v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = (void *)objc_msgSend(a3, "popup");
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, "setParent:", 0);
    -[NSMutableArray removeObject:](self->_annotations, "removeObject:", v7);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (void *)objc_msgSend(a3, "parent");
    if (v8)
      objc_msgSend(v8, "setPopup:", 0);
  }
  if (objc_msgSend(a3, "annotationView"))
    objc_msgSend((id)objc_msgSend(a3, "annotationView"), "removeFromSuperview");
  -[NSMutableArray removeObject:](self->_annotations, "removeObject:", a3);
  os_unfair_lock_unlock(p_lock);
}

- (CGPDFPage)CGPage
{
  return self->_cgPage;
}

- (unint64_t)pageNumber
{
  return self->_pageNumber;
}

- (unint64_t)pageIndex
{
  return self->_pageIndex;
}

- (UIPDFSelection)selection
{
  return (UIPDFSelection *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSelection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (UIPDFDocument)document
{
  return self->_document;
}

- (UIImage)pageImage
{
  return (UIImage *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPageImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

@end
