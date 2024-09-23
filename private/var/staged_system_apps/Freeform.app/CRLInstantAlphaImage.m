@implementation CRLInstantAlphaImage

- (CRLInstantAlphaImage)initWithWidth:(int64_t)a3 height:(int64_t)a4
{
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  CRLInstantAlphaImage *v12;
  CRLInstantAlphaImage *v13;
  unsigned int *v14;
  objc_super v16;

  if (a3 < 1 || a4 <= 0)
  {
    v7 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124F678);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1D204(v7, v8);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124F698);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE81F0(v9, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInstantAlphaImage initWithWidth:height:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInstantAlphaImage.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 15, 0, "Invalid parameter not satisfying: %{public}s", "width > 0 && height > 0");

  }
  v16.receiver = self;
  v16.super_class = (Class)CRLInstantAlphaImage;
  v12 = -[CRLInstantAlphaImage init](&v16, "init");
  v13 = v12;
  if (v12)
  {
    v12->mWidth = a3;
    v12->mHeight = a4;
    v14 = (unsigned int *)malloc_type_calloc(1uLL, 4 * a3 * a4, 0x100004052888210uLL);
    v13->mImageData = v14;
    if (!v14)
    {

      return 0;
    }
  }
  return v13;
}

- (void)dealloc
{
  unsigned int *mImageData;
  objc_super v4;

  mImageData = self->mImageData;
  if (mImageData)
    free(mImageData);
  v4.receiver = self;
  v4.super_class = (Class)CRLInstantAlphaImage;
  -[CRLInstantAlphaImage dealloc](&v4, "dealloc");
}

- (unsigned)averageColorAtXPosition:(int64_t)a3 yPosition:(int64_t)a4
{
  int v5;
  int v6;
  int v7;
  uint64_t i;
  double v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  CRLInstantAlphaImage *v13;
  int64_t v14;
  unsigned int v15;
  unsigned int v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  BOOL v22;
  int64_t mWidth;
  int64_t mHeight;
  NSObject *v25;
  char *v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  uint64_t v32;
  CRLInstantAlphaImage *v34;
  uint8_t buf[4];
  unsigned int v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  int64_t v46;
  __int16 v47;
  int64_t v48;
  __int16 v49;
  int64_t v50;

  v5 = 0;
  v6 = 0;
  v7 = 0;
  for (i = -1; i != 2; ++i)
  {
    v9 = (double)(i + a4);
    v10 = -1;
    v32 = i;
    do
    {
      v11 = (uint64_t)sub_1003C65EC((double)(a3 + v10), 0.0, (double)(self->mWidth - 1));
      v12 = (uint64_t)sub_1003C65EC(v9, 0.0, (double)(self->mHeight - 1));
      v13 = self;
      if (v11 < 0 || v12 < 0 || (v14 = self->mWidth, v14 <= v11) || self->mHeight <= v12)
      {
        v34 = v13;
        v16 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10124F6B8);
        v17 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        {
          mWidth = self->mWidth;
          mHeight = self->mHeight;
          *(_DWORD *)buf = 67110914;
          v36 = v16;
          v37 = 2082;
          v38 = "CRLInstantAlphaPixel getPixel(CRLInstantAlphaImage *__strong, NSInteger, NSInteger)";
          v39 = 2082;
          v40 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInstantAlphaImage.h";
          v41 = 1024;
          v42 = 36;
          v43 = 2048;
          v44 = v11;
          v45 = 2048;
          v46 = v12;
          v47 = 2048;
          v48 = mWidth;
          v49 = 2048;
          v50 = mHeight;
          _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d bad request for get pixel in IA: (%li, %li) for image of size (%li, %li)", buf, 0x4Au);
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10124F6D8);
        }
        v18 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        {
          v25 = v18;
          v26 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
          *(_DWORD *)buf = 67109378;
          v36 = v16;
          v37 = 2114;
          v38 = v26;
          _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

        }
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "CRLInstantAlphaPixel getPixel(CRLInstantAlphaImage *__strong, NSInteger, NSInteger)"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInstantAlphaImage.h"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 36, 0, "bad request for get pixel in IA: (%li, %li) for image of size (%li, %li)", v11, v12, self->mWidth, self->mHeight);

        v15 = 0;
        i = v32;
        v13 = v34;
      }
      else
      {
        v15 = self->mImageData[v11 + v14 * v12];
      }

      if (v10 | i)
        v21 = 3;
      else
        v21 = 5;
      if (v10)
        v22 = i == 0;
      else
        v22 = 1;
      if (!v22)
        v21 = 1;
      v5 += HIBYTE(v15) * v21;
      v7 += BYTE2(v15) * v21;
      v6 += BYTE1(v15) * v21;
      ++v10;
    }
    while (v10 != 2);
  }
  v27 = (v5 / 21) & ~((v5 / 21) >> 31);
  if (v27 >= 0xFF)
    v27 = 255;
  v28 = (v7 / 21) & ~((v7 / 21) >> 31);
  if (v28 >= 0xFF)
    v28 = 255;
  v29 = (v6 / 21) & ~((v6 / 21) >> 31);
  if (v29 >= 0xFF)
    v29 = 255;
  return (v27 << 24) | (v28 << 8) | (v29 << 16) | 0xFF;
}

@end
