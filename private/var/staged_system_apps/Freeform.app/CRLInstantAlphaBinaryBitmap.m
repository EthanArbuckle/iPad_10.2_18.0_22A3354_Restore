@implementation CRLInstantAlphaBinaryBitmap

- (CRLInstantAlphaBinaryBitmap)initWithWidth:(int64_t)a3 height:(int64_t)a4 rowBytes:(int64_t)a5
{
  void *v9;
  void *v10;
  void *v11;
  CRLInstantAlphaBinaryBitmap *v12;
  CRLInstantAlphaBinaryBitmap *v13;
  char *v14;
  objc_super v16;

  if (a3 < 1 || a4 < 1 || (uint64_t)((unint64_t)a3 >> 3) > a5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012386E0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DFAEA4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101238700);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInstantAlphaBinaryBitmap initWithWidth:height:rowBytes:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInstantAlphaBinaryBitmap.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 23, 0, "Invalid parameter not satisfying: %{public}s", "width > 0 && height > 0 && rowBytes >= width / 8");

  }
  v16.receiver = self;
  v16.super_class = (Class)CRLInstantAlphaBinaryBitmap;
  v12 = -[CRLInstantAlphaBinaryBitmap init](&v16, "init");
  v13 = v12;
  if (v12)
  {
    v12->mWidth = a3;
    v12->mHeight = a4;
    v12->mRowBytes = a5;
    v14 = (char *)malloc_type_calloc(a4, a5, 0xD12E5C31uLL);
    v13->mData = v14;
    if (!v14)
    {

      return 0;
    }
  }
  return v13;
}

- (CRLInstantAlphaBinaryBitmap)initWithWidth:(int64_t)a3 height:(int64_t)a4
{
  return -[CRLInstantAlphaBinaryBitmap initWithWidth:height:rowBytes:](self, "initWithWidth:height:rowBytes:", a3, a4, sub_100012A28(vcvtpd_u64_f64((double)a3 * 0.125)));
}

- (void)dealloc
{
  char *mData;
  objc_super v4;

  mData = self->mData;
  if (mData)
    free(mData);
  v4.receiver = self;
  v4.super_class = (Class)CRLInstantAlphaBinaryBitmap;
  -[CRLInstantAlphaBinaryBitmap dealloc](&v4, "dealloc");
}

- (void)unionWithBitmap:(id)a3
{
  _QWORD *v4;
  void *v5;
  int64_t mHeight;
  int64_t v7;
  uint64_t v8;
  char *mData;
  int64_t mRowBytes;
  int64_t i;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  v5 = v4;
  if (self->mWidth == v4[1] && (mHeight = self->mHeight, mHeight == v4[2]))
  {
    if (mHeight >= 1)
    {
      v7 = 0;
      v8 = v4[4];
      mRowBytes = self->mRowBytes;
      mData = self->mData;
      do
      {
        if (mRowBytes >= 1)
        {
          for (i = 0; i < mRowBytes; ++i)
          {
            mData[i] |= *(_BYTE *)(v8 + i);
            mRowBytes = self->mRowBytes;
          }
          mHeight = self->mHeight;
        }
        ++v7;
        mData += mRowBytes;
        v8 += v4[3];
      }
      while (mHeight > v7);
    }
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101238720);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DFAF50();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101238740);
    v12 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInstantAlphaBinaryBitmap unionWithBitmap:]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInstantAlphaBinaryBitmap.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 53, 0, "unionWithBitmap: sizes do not match");

  }
}

- (id)medianBitmap
{
  CRLInstantAlphaBinaryBitmap *v3;
  int64_t mHeight;
  int64_t v5;
  int64_t mWidth;
  int64_t v7;
  CRLInstantAlphaBinaryBitmap *v8;
  CRLInstantAlphaBinaryBitmap *v9;
  int v10;
  CRLInstantAlphaBinaryBitmap *v11;
  CRLInstantAlphaBinaryBitmap *v12;
  int v13;
  int64_t v14;
  CRLInstantAlphaBinaryBitmap *v15;
  CRLInstantAlphaBinaryBitmap *v16;
  int v17;
  CRLInstantAlphaBinaryBitmap *v18;
  CRLInstantAlphaBinaryBitmap *v19;
  int v20;
  CRLInstantAlphaBinaryBitmap *v21;
  int v22;
  CRLInstantAlphaBinaryBitmap *v23;
  char *v24;
  char v25;
  char v26;
  unsigned int v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  int64_t v32;
  int64_t v33;
  NSObject *v34;
  char *v35;
  int64_t v36;
  int64_t v38;
  int64_t v39;
  int v40;
  uint8_t buf[4];
  unsigned int v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  int64_t v50;
  __int16 v51;
  int64_t v52;
  __int16 v53;
  int64_t v54;
  __int16 v55;
  int64_t v56;

  v3 = -[CRLInstantAlphaBinaryBitmap initWithWidth:height:rowBytes:]([CRLInstantAlphaBinaryBitmap alloc], "initWithWidth:height:rowBytes:", self->mWidth, self->mHeight, self->mRowBytes);
  mHeight = self->mHeight;
  if (mHeight >= 1)
  {
    v5 = 0;
    mWidth = self->mWidth;
    do
    {
      if (mWidth <= 0)
      {
        v36 = v5 + 1;
      }
      else
      {
        v7 = 0;
        v38 = (v5 - 1);
        v39 = v5 + 1;
        do
        {
          v8 = self;
          v9 = v8;
          if (self->mWidth <= v7 || self->mHeight <= v5)
            v10 = 0;
          else
            v10 = (self->mData[self->mRowBytes * v5 + (v7 >> 3)] << (v7 & 7)) & 0x80;

          v11 = v9;
          v12 = v11;
          v40 = v10;
          if (v7 && self->mWidth > (v7 - 1) && self->mHeight > v5)
            v13 = (self->mData[self->mRowBytes * v5 + ((v7 - 1) >> 3)] << ((v7 - 1) & 7)) & 0x80;
          else
            v13 = 0;

          v14 = v7 + 1;
          v15 = v12;
          v16 = v15;
          if (self->mWidth <= v7 + 1 || self->mHeight <= v5)
            v17 = 0;
          else
            v17 = (self->mData[self->mRowBytes * v5 + (v14 >> 3)] << ((v7 + 1) & 7)) & 0x80;

          v18 = v16;
          v19 = v18;
          v20 = 0;
          if (v5 && self->mWidth > v7)
          {
            if (self->mHeight <= v38)
              v20 = 0;
            else
              v20 = (self->mData[self->mRowBytes * v38 + (v7 >> 3)] << (v7 & 7)) & 0x80;
          }

          v21 = v19;
          if (self->mWidth <= v7 || self->mHeight <= v39)
            v22 = 0;
          else
            v22 = (self->mData[self->mRowBytes * v39 + (v7 >> 3)] << (v7 & 7)) & 0x80;

          v23 = v3;
          if (v3->mWidth <= v7 || v3->mHeight <= v5)
          {
            v27 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_101238760);
            v28 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            {
              v32 = v3->mWidth;
              v33 = v3->mHeight;
              *(_DWORD *)buf = 67110914;
              v42 = v27;
              v43 = 2082;
              v44 = "void setBit(CRLInstantAlphaBinaryBitmap * _Nonnull __strong, NSInteger, NSInteger, NSInteger)";
              v45 = 2082;
              v46 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInstantAlphaBinaryBitmap.h";
              v47 = 1024;
              v48 = 67;
              v49 = 2048;
              v50 = v7;
              v51 = 2048;
              v52 = v5;
              v53 = 2048;
              v54 = v32;
              v55 = 2048;
              v56 = v33;
              _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d bad request for set bit value in IA: (%li, %li) for image of size (%li, %li)", buf, 0x4Au);
              if (qword_10147E370 != -1)
                dispatch_once(&qword_10147E370, &stru_101238780);
            }
            v29 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            {
              v34 = v29;
              v35 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
              *(_DWORD *)buf = 67109378;
              v42 = v27;
              v43 = 2114;
              v44 = v35;
              _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

            }
            v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void setBit(CRLInstantAlphaBinaryBitmap * _Nonnull __strong, NSInteger, NSInteger, NSInteger)"));
            v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLInstantAlphaBinaryBitmap.h"));
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v30, v31, 67, 0, "bad request for set bit value in IA: (%li, %li) for image of size (%li, %li)", v7, v5, v3->mWidth, v3->mHeight);

          }
          else
          {
            v24 = &v3->mData[v3->mRowBytes * v5];
            v25 = v24[(unint64_t)v7 >> 3];
            if (v13 + v40 + v17 + v20 == -v22)
              v26 = v25 & (-129 >> (v7 & 7));
            else
              v26 = v25 | (0x80u >> (v7 & 7));
            v24[(unint64_t)v7 >> 3] = v26;
          }

          mWidth = self->mWidth;
          ++v7;
        }
        while (mWidth > v14);
        mHeight = self->mHeight;
        v36 = v5 + 1;
      }
      v5 = v36;
    }
    while (mHeight > v36);
  }
  return v3;
}

- (int64_t)width
{
  return self->mWidth;
}

- (int64_t)height
{
  return self->mHeight;
}

- (int64_t)rowBytes
{
  return self->mRowBytes;
}

- (char)data
{
  return self->mData;
}

@end
