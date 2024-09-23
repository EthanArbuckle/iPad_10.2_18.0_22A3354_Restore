@implementation UIPDFDocument

+ (id)documentNamed:(id)a3
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  if (v4
    && (v5 = objc_msgSend(v4, "URLForResource:withExtension:", objc_msgSend(a3, "stringByDeletingPathExtension"), CFSTR("pdf"))) != 0)
  {
    return -[UIPDFDocument initWithURL:]([UIPDFDocument alloc], "initWithURL:", v5);
  }
  else
  {
    return 0;
  }
}

- (CGPDFDocument)copyCGPDFDocument
{
  os_unfair_lock_s *p_lock;
  CGPDFDocument *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = CGPDFDocumentRetain(self->_cgDocument);
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (UIPDFDocument)initWithCGPDFDocument:(CGPDFDocument *)a3
{
  UIPDFDocument *v4;
  UIPDFDocument *v5;
  CGPDFDocument *v6;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)UIPDFDocument;
  v4 = -[UIPDFDocument init](&v13, sel_init);
  v5 = v4;
  if (v4)
  {
    *(_QWORD *)&v4->_lock._os_unfair_lock_opaque = 0;
    v4->_thumbnailLock._os_unfair_lock_opaque = 0;
    v6 = CGPDFDocumentRetain(a3);
    v5->_cgDocument = v6;
    v5->_numberOfPages = CGPDFDocumentGetNumberOfPages(v6);
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&v5->_cachedWidth = _Q0;
    -[UIPDFDocument setImageCacheCount:lookAhead:withResolution:](v5, "setImageCacheCount:lookAhead:withResolution:", 10, 2, 0.5);
  }
  return v5;
}

- (UIPDFDocument)initWithCGPDFDocumentLimitedMemory:(CGPDFDocument *)a3
{
  UIPDFDocument *v4;
  UIPDFDocument *v5;
  CGPDFDocument *v6;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)UIPDFDocument;
  v4 = -[UIPDFDocument init](&v13, sel_init);
  v5 = v4;
  if (v4)
  {
    *(_QWORD *)&v4->_lock._os_unfair_lock_opaque = 0;
    v4->_thumbnailLock._os_unfair_lock_opaque = 0;
    v6 = CGPDFDocumentRetain(a3);
    v5->_cgDocument = v6;
    v5->_numberOfPages = CGPDFDocumentGetNumberOfPages(v6);
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&v5->_cachedWidth = _Q0;
    -[UIPDFDocument setImageCacheCount:lookAhead:withResolution:](v5, "setImageCacheCount:lookAhead:withResolution:", 1, 0, 0.25);
  }
  return v5;
}

- (UIPDFDocument)initWithURL:(id)a3
{
  char *v4;
  CGPDFDocumentRef v5;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UIPDFDocument;
  v4 = -[UIPDFDocument init](&v12, sel_init);
  if (v4)
  {
    v5 = CGPDFDocumentCreateWithURL((CFURLRef)a3);
    *((_QWORD *)v4 + 1) = v5;
    if (v5)
    {
      *((_QWORD *)v4 + 11) = 0;
      *((_DWORD *)v4 + 26) = 0;
      *((_QWORD *)v4 + 6) = (id)objc_msgSend(a3, "lastPathComponent");
      *((_QWORD *)v4 + 2) = CGPDFDocumentGetNumberOfPages(*((CGPDFDocumentRef *)v4 + 1));
      __asm { FMOV            V0.2D, #-1.0 }
      *(_OWORD *)(v4 + 24) = _Q0;
      objc_msgSend(v4, "setImageCacheCount:lookAhead:withResolution:", 10, 2, 0.5);
    }
  }
  return (UIPDFDocument *)v4;
}

- (void)dealloc
{
  UIPDFPageImageCache *thumbnailCache;
  UIPDFPageImageCache *pageImageCache;
  objc_super v5;

  thumbnailCache = self->_thumbnailCache;
  if (thumbnailCache)
  {

    self->_thumbnailCache = 0;
  }
  pageImageCache = self->_pageImageCache;
  if (pageImageCache)
  {

    self->_pageImageCache = 0;
  }
  CGPDFDocumentRelease(self->_cgDocument);

  +[UIPDFViewTouchHandler releaseViewManager](UIPDFViewTouchHandler, "releaseViewManager");
  v5.receiver = self;
  v5.super_class = (Class)UIPDFDocument;
  -[UIPDFDocument dealloc](&v5, sel_dealloc);
}

- (void)setImageCacheCount:(unint64_t)a3 lookAhead:(unint64_t)a4 withResolution:(double)a5
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_imageCacheCount = a3;
  self->_imageCacheLookAhead = a4;
  self->_imageCacheResolution = a5;
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)numberOfPages
{
  os_unfair_lock_s *p_lock;
  unint64_t numberOfPages;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  numberOfPages = self->_numberOfPages;
  os_unfair_lock_unlock(p_lock);
  return numberOfPages;
}

- (id)pageAtIndex:(unint64_t)a3
{
  return -[UIPDFDocument copyPageAtIndex:](self, "copyPageAtIndex:", a3);
}

- (id)copyPageAtIndex:(unint64_t)a3
{
  uint64_t v4;
  CGPDFPage *v5;
  UIPDFPage *v6;

  if (self->_numberOfPages <= a3)
    return 0;
  v4 = CGPDFDocumentCopyPage();
  if (!v4)
    return 0;
  v5 = (CGPDFPage *)v4;
  v6 = -[UIPDFPage initWithCGPDFPage:]([UIPDFPage alloc], "initWithCGPDFPage:", v4);
  CGPDFPageRelease(v5);
  if (v6)
    -[UIPDFPage setDocument:](v6, "setDocument:", self);
  return v6;
}

- (NSString)documentID
{
  NSString *result;
  NSString *v4;
  __CFString *v5;
  __CFString *v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  _BYTE *v12;
  NSString *v13;
  CGPDFStringRef value;

  result = self->_documentID;
  if (!result)
  {
    result = (NSString *)self->_cgDocument;
    if (result)
    {
      result = (NSString *)CGPDFDocumentGetID((CGPDFDocumentRef)result);
      if (result)
      {
        v4 = result;
        if (CGPDFArrayGetCount((CGPDFArrayRef)result))
        {
          value = 0;
          if (CGPDFArrayGetString((CGPDFArrayRef)v4, 0, &value))
          {
            v5 = (__CFString *)CGPDFStringCopyTextString(value);
            if (v5)
            {
              v6 = v5;
              v7 = -[__CFString length](v5, "length");
              v8 = malloc_type_malloc((4 * v7) | 1, 0x265E311DuLL);
              if (v7)
              {
                v9 = 0;
                v10 = 0;
                do
                {
                  v11 = -[__CFString characterAtIndex:](v6, "characterAtIndex:", v9);
                  v12 = &v8[v10];
                  *v12 = a0123456789abcd[(unint64_t)v11 >> 12];
                  v12[1] = a0123456789abcd[(v11 >> 8) & 0xF];
                  v12[2] = a0123456789abcd[v11 >> 4];
                  v10 += 4;
                  v12[3] = a0123456789abcd[v11 & 0xF];
                  ++v9;
                }
                while (v7 != v9);
              }
              else
              {
                v10 = 0;
              }
              v8[v10] = 0;
              v13 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", v8, 1);
              free(v8);
              self->_documentID = v13;
              CFRelease(v6);
            }
          }
        }
        return self->_documentID;
      }
    }
  }
  return result;
}

- (BOOL)allowsCopying
{
  CGPDFDocument *cgDocument;

  cgDocument = self->_cgDocument;
  if (cgDocument)
    LOBYTE(cgDocument) = CGPDFDocumentAllowsCopying(cgDocument);
  return (char)cgDocument;
}

- (NSObject)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (CGPDFDocument)CGDocument
{
  return self->_cgDocument;
}

- (void)updateWidthHeightCache
{
  unint64_t numberOfPages;
  unint64_t i;
  CGPDFPage *v5;
  CGPDFPage *v6;
  CGRect BoxRect;

  numberOfPages = self->_numberOfPages;
  if (numberOfPages)
  {
    for (i = 1; i <= numberOfPages; ++i)
    {
      v5 = (CGPDFPage *)CGPDFDocumentCopyPage();
      if (v5)
      {
        v6 = v5;
        BoxRect = CGPDFPageGetBoxRect(v5, kCGPDFCropBox);
        if (BoxRect.size.width > self->_cachedWidth)
          self->_cachedWidth = BoxRect.size.width;
        if (BoxRect.size.height > self->_cachedHeight)
          self->_cachedHeight = BoxRect.size.height;
        CGPDFPageRelease(v6);
      }
    }
  }
}

- (double)maxWidth
{
  double result;

  result = self->_cachedWidth;
  if (result < 0.0)
  {
    -[UIPDFDocument updateWidthHeightCache](self, "updateWidthHeightCache");
    return self->_cachedWidth;
  }
  return result;
}

- (double)maxHeight
{
  double result;

  result = self->_cachedHeight;
  if (result < 0.0)
  {
    -[UIPDFDocument updateWidthHeightCache](self, "updateWidthHeightCache");
    return self->_cachedHeight;
  }
  return result;
}

- (double)sumWidth
{
  unint64_t numberOfPages;
  double v3;
  unint64_t i;
  CGPDFPage *v5;
  CGPDFPage *v6;
  CGRect BoxRect;

  numberOfPages = self->_numberOfPages;
  if (!numberOfPages)
    return 0.0;
  v3 = 0.0;
  for (i = 1; i <= numberOfPages; ++i)
  {
    v5 = (CGPDFPage *)CGPDFDocumentCopyPage();
    if (v5)
    {
      v6 = v5;
      BoxRect = CGPDFPageGetBoxRect(v5, kCGPDFCropBox);
      v3 = v3 + BoxRect.size.width;
      CGPDFPageRelease(v6);
    }
  }
  return v3;
}

- (double)sumHeight
{
  unint64_t numberOfPages;
  double v3;
  unint64_t i;
  CGPDFPage *v5;
  CGPDFPage *v6;
  CGRect BoxRect;

  numberOfPages = self->_numberOfPages;
  if (!numberOfPages)
    return 0.0;
  v3 = 0.0;
  for (i = 1; i <= numberOfPages; ++i)
  {
    v5 = (CGPDFPage *)CGPDFDocumentCopyPage();
    if (v5)
    {
      v6 = v5;
      BoxRect = CGPDFPageGetBoxRect(v5, kCGPDFCropBox);
      v3 = v3 + BoxRect.size.height;
      CGPDFPageRelease(v6);
    }
  }
  return v3;
}

- (UIPDFPageImageCache)pageImageCache
{
  os_unfair_lock_s *p_imageCacheLock;
  UIPDFPageImageCache *pageImageCache;

  p_imageCacheLock = &self->_imageCacheLock;
  os_unfair_lock_lock(&self->_imageCacheLock);
  pageImageCache = self->_pageImageCache;
  if (!pageImageCache)
  {
    pageImageCache = -[UIPDFPageImageCache initWithDocument:cacheCount:lookAhead:withLookAheadResolution:]([UIPDFPageImageCache alloc], "initWithDocument:cacheCount:lookAhead:withLookAheadResolution:", self, self->_imageCacheCount, self->_imageCacheLookAhead, self->_imageCacheResolution);
    self->_pageImageCache = pageImageCache;
  }
  os_unfair_lock_unlock(p_imageCacheLock);
  return pageImageCache;
}

- (void)setPageImageCache:(id)a3
{
  id v5;
  UIPDFPageImageCache *pageImageCache;

  if (a3)
    v5 = a3;
  os_unfair_lock_lock(&self->_imageCacheLock);
  pageImageCache = self->_pageImageCache;
  if (pageImageCache)

  self->_pageImageCache = (UIPDFPageImageCache *)a3;
  os_unfair_lock_unlock(&self->_imageCacheLock);
}

- (UIPDFPageImageCache)thumbnailCache
{
  os_unfair_lock_s *p_thumbnailLock;
  UIPDFPageImageCache *thumbnailCache;

  p_thumbnailLock = &self->_thumbnailLock;
  os_unfair_lock_lock(&self->_thumbnailLock);
  thumbnailCache = self->_thumbnailCache;
  if (!thumbnailCache)
  {
    thumbnailCache = -[UIPDFPageImageCache initWithDocument:cacheCount:lookAhead:withLookAheadResolution:]([UIPDFPageImageCache alloc], "initWithDocument:cacheCount:lookAhead:withLookAheadResolution:", self, 1, 0, self->_imageCacheResolution);
    self->_thumbnailCache = thumbnailCache;
  }
  os_unfair_lock_unlock(p_thumbnailLock);
  return thumbnailCache;
}

- (void)setThumbnailCache:(id)a3
{
  id v5;
  UIPDFPageImageCache *thumbnailCache;

  if (a3)
    v5 = a3;
  os_unfair_lock_lock(&self->_thumbnailLock);
  thumbnailCache = self->_thumbnailCache;
  if (thumbnailCache)

  self->_thumbnailCache = (UIPDFPageImageCache *)a3;
  os_unfair_lock_unlock(&self->_thumbnailLock);
}

@end
