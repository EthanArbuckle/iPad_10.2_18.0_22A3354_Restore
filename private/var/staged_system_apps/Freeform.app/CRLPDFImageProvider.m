@implementation CRLPDFImageProvider

- (void)i_commonInit
{
  void *v3;
  void *v4;
  void *v5;
  OS_dispatch_queue *v6;
  OS_dispatch_queue *accessQueue;
  OS_dispatch_semaphore *v8;
  OS_dispatch_semaphore *flushableContentLock;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CRLPDFImageProvider;
  -[CRLImageProvider i_commonInit](&v10, "i_commonInit");
  if (self->_accessQueue)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122F698);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEC61C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122F6B8);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPDFImageProvider i_commonInit]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPDFImageProvider.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 40, 0, "called i_common init twice on same object!");

  }
  v6 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.freeform.CRLPDFImageProvider", 0);
  accessQueue = self->_accessQueue;
  self->_accessQueue = v6;

  v8 = (OS_dispatch_semaphore *)dispatch_semaphore_create(1);
  flushableContentLock = self->_flushableContentLock;
  self->_flushableContentLock = v8;

}

- (void)dealloc
{
  objc_super v3;

  CGPDFDocumentRelease(self->_PDFDocument);
  v3.receiver = self;
  v3.super_class = (Class)CRLPDFImageProvider;
  -[CRLImageProvider dealloc](&v3, "dealloc");
}

- (CGPDFDocument)CGPDFDocument
{
  NSObject *accessQueue;
  const void *v4;
  CGPDFDocument *v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  -[CRLPDFImageProvider p_loadIfNecessary](self, "p_loadIfNecessary");
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004E574;
  v7[3] = &unk_10122C5F0;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(accessQueue, v7);
  v4 = (const void *)v9[3];
  if (v4)
  {
    CFAutorelease(v4);
    v5 = (CGPDFDocument *)v9[3];
  }
  else
  {
    v5 = 0;
  }
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (int64_t)pageAngle
{
  int64_t result;

  result = -[CRLPDFImageProvider CGPDFDocument](self, "CGPDFDocument");
  if (result)
  {
    result = (int64_t)CGPDFDocumentGetPage((CGPDFDocumentRef)result, 1uLL);
    if (result)
      return CGPDFPageGetRotationAngle((CGPDFPageRef)result);
  }
  return result;
}

- (CGSize)naturalSize
{
  NSObject *accessQueue;
  double v4;
  double v5;
  double v6;
  double v7;
  _QWORD v8[6];
  uint64_t v9;
  double *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  CGSize result;

  -[CRLPDFImageProvider p_loadIfNecessary](self, "p_loadIfNecessary");
  v9 = 0;
  v10 = (double *)&v9;
  v11 = 0x3010000000;
  v13 = 0;
  v14 = 0;
  v12 = &unk_1010E66AB;
  accessQueue = self->_accessQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004E67C;
  v8[3] = &unk_10122C5F0;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(accessQueue, v8);
  v4 = v10[4];
  v5 = v10[5];
  _Block_object_dispose(&v9, 8);
  v6 = v4;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (BOOL)i_hasFlushableContent
{
  BOOL hasFlushableContent;

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_flushableContentLock, 0xFFFFFFFFFFFFFFFFLL);
  hasFlushableContent = self->_hasFlushableContent;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_flushableContentLock);
  return hasFlushableContent;
}

- (unint64_t)i_flushableMemoryEstimate
{
  unint64_t result;
  void *v4;
  id v5;

  result = -[CRLPDFImageProvider CGPDFDocument](self, "CGPDFDocument");
  if (result)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageProvider imageData](self, "imageData"));
    v5 = objc_msgSend(v4, "length");

    return (unint64_t)v5;
  }
  return result;
}

- (BOOL)isValid
{
  CGPDFDocument *v2;

  v2 = -[CRLPDFImageProvider CGPDFDocument](self, "CGPDFDocument");
  if (v2)
    LOBYTE(v2) = CGPDFDocumentGetPage(v2, 1uLL) != 0;
  return (char)v2;
}

- (void)drawImageInContext:(CGContext *)a3 rect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v10;
  void *v11;
  void *v12;
  CGPDFDocument *v13;
  CGPDFPageRef Page;
  CGPDFPage *v15;
  double MinY;
  CGFloat MaxY;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  CGAffineTransform v25;
  __n128 v26;
  __int128 v27;
  __int128 v28;
  double v29;
  double v30;
  CGAffineTransform v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  if (!-[CRLPDFImageProvider isValid](self, "isValid"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122F6D8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEC6A0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122F6F8);
    v10 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPDFImageProvider drawImageInContext:rect:]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPDFImageProvider.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 103, 0, "shouldn't be drawing an invalid image provider");

  }
  v13 = -[CRLPDFImageProvider CGPDFDocument](self, "CGPDFDocument");
  if (v13)
  {
    Page = CGPDFDocumentGetPage(v13, 1uLL);
    if (Page)
    {
      v15 = Page;
      CGContextSaveGState(a3);
      v32.origin.x = x;
      v32.origin.y = y;
      v32.size.width = width;
      v32.size.height = height;
      MinY = CGRectGetMinY(v32);
      v33.origin.x = x;
      v33.origin.y = y;
      v33.size.width = width;
      v33.size.height = height;
      MaxY = CGRectGetMaxY(v33);
      CGContextTranslateCTM(a3, 0.0, MinY + MaxY);
      CGContextScaleCTM(a3, 1.0, -1.0);
      memset(&v31, 0, sizeof(v31));
      v29 = 0.0;
      v30 = 0.0;
      v18 = sub_10041069C(v15, (uint64_t)&v31, &v29);
      v20 = v19;
      v22 = v21;
      v24 = v23;
      if (!sub_100060BF8(v21, v23) && (sub_1000637B4() & 1) == 0)
      {
        v27 = 0u;
        v28 = 0u;
        v25 = v31;
        v26 = 0u;
        sub_100410A70((__n128 *)&v25, &v26, v29, v30, x, y, width, height);
        *(__n128 *)&v25.a = v26;
        *(_OWORD *)&v25.c = v27;
        *(_OWORD *)&v25.tx = v28;
        CGContextConcatCTM(a3, &v25);
        v34.origin.x = v18;
        v34.origin.y = v20;
        v34.size.width = v22;
        v34.size.height = v24;
        CGContextClipToRect(a3, v34);
        CGContextDrawPDFPage(a3, v15);
      }
      CGContextRestoreGState(a3);
    }
  }
}

- (void)flush
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004EADC;
  block[3] = &unk_10122D110;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

- (void)p_loadIfNecessary
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004EBC0;
  block[3] = &unk_10122D110;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

- (CGPDFDocument)p_load
{
  void *v3;
  CGDataProvider *v4;
  CGPDFDocument *v5;
  CGPDFDocument *v6;
  CGPDFPage *Page;
  CGPDFPage *v8;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  int RotationAngle;
  double v20;
  double v21;
  double v22;
  unsigned int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSString *v29;
  void *v30;
  NSString *v31;
  void *v32;
  NSObject *v34;
  NSString *v35;
  void *v36;
  NSString *v37;
  void *v38;
  uint8_t buf[4];
  unsigned int v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  int v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  CGSize v51;
  CGSize v52;
  CGSize v53;
  CGSize v54;
  CGRect BoxRect;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageProvider imageData](self, "imageData"));
  v4 = (CGDataProvider *)objc_msgSend(v3, "newCGDataProvider");

  if (!v4)
    return 0;
  v5 = CGPDFDocumentCreateWithProvider(v4);
  v6 = v5;
  if (v5)
  {
    Page = CGPDFDocumentGetPage(v5, 1uLL);
    if (Page)
    {
      v8 = Page;
      BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFMediaBox);
      x = BoxRect.origin.x;
      y = BoxRect.origin.y;
      width = BoxRect.size.width;
      height = BoxRect.size.height;
      v56 = CGPDFPageGetBoxRect(v8, kCGPDFCropBox);
      v13 = v56.origin.x;
      v14 = v56.origin.y;
      v15 = v56.size.width;
      v16 = v56.size.height;
      v60 = CGPDFPageGetBoxRect(v8, kCGPDFArtBox);
      v57.origin.x = x;
      v57.origin.y = y;
      v57.size.width = width;
      v57.size.height = height;
      v61 = CGRectIntersection(v57, v60);
      v58.origin.x = v13;
      v58.origin.y = v14;
      v58.size.width = v15;
      v58.size.height = v16;
      v59 = CGRectIntersection(v58, v61);
      v17 = v59.size.width;
      v18 = v59.size.height;
      RotationAngle = CGPDFPageGetRotationAngle(v8);
      if (RotationAngle == 270 || RotationAngle == 90)
      {
        v20 = v18;
      }
      else
      {
        v20 = v17;
        v17 = v18;
      }
      v21 = fmax(v20, 0.01);
      v22 = fmax(v17, 0.01);
      if (v21 != v20 || v22 != v17)
      {
        v24 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10122F718);
        v25 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        {
          v34 = v25;
          v53.width = v20;
          v53.height = v17;
          v35 = NSStringFromCGSize(v53);
          v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
          v54.width = v21;
          v54.height = v22;
          v37 = NSStringFromCGSize(v54);
          v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
          *(_DWORD *)buf = 67110402;
          v40 = v24;
          v41 = 2082;
          v42 = "-[CRLPDFImageProvider p_load]";
          v43 = 2082;
          v44 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPDFImageProvider.m";
          v45 = 1024;
          v46 = 206;
          v47 = 2112;
          v48 = v36;
          v49 = 2112;
          v50 = v38;
          _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d PDF image had zero-width or height size; was %@, capped to %@",
            buf,
            0x36u);

        }
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10122F738);
        v26 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE87A4(v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPDFImageProvider p_load]"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLPDFImageProvider.m"));
        v51.width = v20;
        v51.height = v17;
        v29 = NSStringFromCGSize(v51);
        v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
        v52.width = v21;
        v52.height = v22;
        v31 = NSStringFromCGSize(v52);
        v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v27, v28, 206, 0, "PDF image had zero-width or height size; was %@, capped to %@",
          v30,
          v32);

      }
      self->_naturalSize.width = v21;
      self->_naturalSize.height = v22;
    }
    else
    {
      CGPDFDocumentRelease(v6);
      v6 = 0;
    }
  }
  CGDataProviderRelease(v4);
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flushableContentLock, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
