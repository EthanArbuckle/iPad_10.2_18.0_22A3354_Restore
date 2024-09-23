@implementation CRLWrapSegments

- (CRLWrapSegments)init
{
  CRLWrapSegments *result;
  CGSize size;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLWrapSegments;
  result = -[CRLWrapSegments init](&v4, "init");
  if (result)
  {
    size = CGRectZero.size;
    result->mBounds.origin = CGRectZero.origin;
    result->mBounds.size = size;
  }
  return result;
}

- (CRLWrapSegments)initWithPath:(id)a3
{
  id v4;
  CRLWrapSegments *v5;
  id v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRLWrapSegments;
  v5 = -[CRLWrapSegments init](&v9, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "isFlat"))
      v6 = v4;
    else
      v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bezierPathByFlatteningPath"));
    v7 = v6;
    -[CRLWrapSegments p_buildSegmentsForPath:](v5, "p_buildSegmentsForPath:", v6);

  }
  return v5;
}

- (void)dealloc
{
  $D9ACD5A945031E604089763E4FBE0988 *mSegments;
  objc_super v4;

  mSegments = self->mSegments;
  if (mSegments)
    free(mSegments);
  v4.receiver = self;
  v4.super_class = (Class)CRLWrapSegments;
  -[CRLWrapSegments dealloc](&v4, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  CRLWrapSegments *v4;
  $D9ACD5A945031E604089763E4FBE0988 *v5;
  CGPoint origin;

  v4 = -[CRLWrapSegments init](+[CRLWrapSegments allocWithZone:](CRLWrapSegments, "allocWithZone:", a3), "init");
  v5 = ($D9ACD5A945031E604089763E4FBE0988 *)malloc_type_calloc(self->mSegmentCount, 0x20uLL, 0x1000040E0EAB150uLL);
  v4->mSegments = v5;
  memcpy(v5, self->mSegments, 32 * self->mSegmentCount);
  v4->mSegmentCount = self->mSegmentCount;
  origin = self->mBounds.origin;
  v4->mBounds.size = self->mBounds.size;
  v4->mBounds.origin = origin;
  return v4;
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->mBounds.origin.x;
  y = self->mBounds.origin.y;
  width = self->mBounds.size.width;
  height = self->mBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (int64_t)segmentCount
{
  return self->mSegmentCount;
}

- (const)segments
{
  return self->mSegments;
}

- (id)wrapSegmentsByApplyingAffineTransform:(CGAffineTransform *)a3
{
  id v4;
  __int128 v5;
  _OWORD v7[3];

  v4 = -[CRLWrapSegments copy](self, "copy");
  v5 = *(_OWORD *)&a3->c;
  v7[0] = *(_OWORD *)&a3->a;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&a3->tx;
  objc_msgSend(v4, "transformUsingAffineTransform:", v7);
  return v4;
}

- (void)transformUsingAffineTransform:(CGAffineTransform *)a3
{
  __int128 v5;
  int64_t mSegmentCount;
  CGPoint *p_var1;
  double v8;
  double v9;
  double v10;
  double v11;
  double x;
  double y;
  double b;
  double c;
  double d;
  double tx;
  double ty;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGAffineTransform v27;

  v5 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v27.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v27.c = v5;
  *(_OWORD *)&v27.tx = *(_OWORD *)&a3->tx;
  if (!CGAffineTransformIsIdentity(&v27))
  {
    mSegmentCount = self->mSegmentCount;
    if (mSegmentCount >= 1)
    {
      p_var1 = &self->mSegments->var1;
      v8 = 2.22507386e-308;
      v9 = 1.79769313e308;
      v10 = 1.79769313e308;
      v11 = 2.22507386e-308;
      do
      {
        x = p_var1[-1].x;
        y = p_var1[-1].y;
        b = a3->b;
        c = a3->c;
        d = a3->d;
        tx = a3->tx;
        ty = a3->ty;
        v19 = tx + y * c + a3->a * x;
        v20 = ty + y * d + b * x;
        v21 = p_var1->y;
        v22 = tx + c * v21 + a3->a * p_var1->x;
        v23 = ty + d * v21 + b * p_var1->x;
        if (v20 >= v23)
        {
          v24 = v22;
          v25 = v23;
        }
        else
        {
          v24 = v19;
          v25 = v20;
          v19 = v22;
          v20 = v23;
        }
        p_var1[-1].x = v24;
        p_var1[-1].y = v25;
        p_var1->x = v19;
        p_var1->y = v20;
        p_var1 += 2;
        if (v24 >= v19)
          v26 = v19;
        else
          v26 = v24;
        if (v24 >= v19)
          v19 = v24;
        if (v10 >= v26)
          v10 = v26;
        if (v11 < v19)
          v11 = v19;
        if (v9 >= v25)
          v9 = v25;
        if (v8 < v20)
          v8 = v20;
        --mSegmentCount;
      }
      while (mSegmentCount);
      self->mBounds.origin.x = v10;
      self->mBounds.origin.y = v9;
      self->mBounds.size.width = v11 - v10;
      self->mBounds.size.height = v8 - v9;
    }
  }
}

- (void)p_buildSegmentsForPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  $D9ACD5A945031E604089763E4FBE0988 **p_mSegments;
  void *v9;
  void *v10;
  void *v11;
  CGSize size;
  char v13;
  char v14;
  uint64_t v15;
  double v16;
  double x;
  double y;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  double v25;
  char v26;
  unsigned int v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  unsigned int v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  int64_t mSegmentCount;
  $D9ACD5A945031E604089763E4FBE0988 *v44;
  NSObject *v45;
  char *v46;
  NSObject *v47;
  char *v48;
  CGFloat v49;
  double v50;
  double v51;
  uint8_t buf[4];
  unsigned int v53;
  __int16 v54;
  const char *v55;
  __int16 v56;
  const char *v57;
  __int16 v58;
  int v59;
  double v60;
  double v61;

  v4 = a3;
  if ((objc_msgSend(v4, "isFlat") & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124DD68);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1AC70();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124DD88);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWrapSegments p_buildSegmentsForPath:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLWrapSegments.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 100, 0, "cannot enumerate flattened segments for a non-flat path");

  }
  p_mSegments = &self->mSegments;
  if (self->mSegments)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124DDA8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1ABEC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124DDC8);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWrapSegments p_buildSegmentsForPath:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLWrapSegments.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 101, 0, "mSegments must be NULL when initializing");

  }
  size = CGRectNull.size;
  self->mBounds.origin = CGRectNull.origin;
  self->mBounds.size = size;
  *p_mSegments = 0;
  self->mSegmentCount = 0;
  if ((uint64_t)objc_msgSend(v4, "elementCount") >= 1)
  {
    *p_mSegments = ($D9ACD5A945031E604089763E4FBE0988 *)malloc_type_calloc((size_t)objc_msgSend(v4, "elementCount"), 0x20uLL, 0x1000040E0EAB150uLL);
    if ((uint64_t)objc_msgSend(v4, "elementCount") >= 1)
    {
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 2.22507386e-308;
      x = CGPointZero.x;
      y = CGPointZero.y;
      v19 = 1.79769313e308;
      v20 = 1.79769313e308;
      v49 = CGPointZero.x;
      v51 = 2.22507386e-308;
      v21 = y;
      v22 = CGPointZero.x;
      v23 = y;
      while (1)
      {
        v24 = objc_msgSend(v4, "elementAtIndex:associatedPoints:", v15, &v60, *(_QWORD *)&v49);
        if (v24 == (id)3)
        {
          if (x == v50 && y == v21)
          {
            if ((v13 & 1) == 0)
              goto LABEL_85;
LABEL_71:
            if ((v14 & 1) != 0)
              goto LABEL_72;
            v14 = 0;
            v26 = 1;
            goto LABEL_88;
          }
          if ((v13 & 1) != 0)
          {
            v23 = y;
            v22 = x;
LABEL_72:
            v14 = 0;
            if (v21 >= v23)
              v39 = v23;
            else
              v39 = v21;
            v40 = v50;
            if (v21 >= v23)
              v41 = v22;
            else
              v41 = v50;
            if (v21 >= v23)
              v42 = v21;
            else
              v42 = v23;
            if (v21 < v23)
              v40 = v22;
            mSegmentCount = self->mSegmentCount;
            v44 = &self->mSegments[mSegmentCount];
            v44->var0.x = v41;
            v44->var0.y = v39;
            v44->var1.x = v40;
            v44->var1.y = v42;
            self->mSegmentCount = mSegmentCount + 1;
            v26 = 1;
            v21 = v23;
            v50 = v22;
            goto LABEL_88;
          }
          v26 = 0;
          v14 = 1;
          v22 = x;
          v23 = y;
        }
        else
        {
          if (v24 != (id)1)
          {
            if (!v24)
            {
              v14 = 0;
              x = v60;
              y = v61;
              if (v20 >= v60)
                v20 = v60;
              if (v19 >= v61)
                v19 = v61;
              if (v16 < v60)
                v16 = v60;
              v25 = v51;
              if (v51 < v61)
                v25 = v61;
              v50 = v60;
              v51 = v25;
              v26 = 1;
              v21 = v61;
              goto LABEL_88;
            }
            v34 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_10124DE28);
            v35 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109890;
              v53 = v34;
              v54 = 2082;
              v55 = "-[CRLWrapSegments p_buildSegmentsForPath:]";
              v56 = 2082;
              v57 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLWrapSegments.m";
              v58 = 1024;
              v59 = 153;
              _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d unexpected element type (path may not be flat)", buf, 0x22u);
            }
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_10124DE48);
            v36 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            {
              v45 = v36;
              v46 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
              *(_DWORD *)buf = 67109378;
              v53 = v34;
              v54 = 2114;
              v55 = v46;
              _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

            }
            v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWrapSegments p_buildSegmentsForPath:]"));
            v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLWrapSegments.m"));
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v37, v38, 153, 0, "unexpected element type (path may not be flat)");

            if ((v13 & 1) == 0)
            {
LABEL_85:
              v26 = 0;
              goto LABEL_88;
            }
            goto LABEL_71;
          }
          if ((v13 & 1) == 0)
          {
            v27 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_10124DDE8);
            v28 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109890;
              v53 = v27;
              v54 = 2082;
              v55 = "-[CRLWrapSegments p_buildSegmentsForPath:]";
              v56 = 2082;
              v57 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLWrapSegments.m";
              v58 = 1024;
              v59 = 135;
              _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d must have previous point before lineTo", buf, 0x22u);
            }
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_10124DE08);
            v29 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            {
              v47 = v29;
              v48 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
              *(_DWORD *)buf = 67109378;
              v53 = v27;
              v54 = 2114;
              v55 = v48;
              _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

            }
            v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWrapSegments p_buildSegmentsForPath:]"));
            v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLWrapSegments.m"));
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v30, v31, 135, 0, "must have previous point before lineTo");

          }
          v22 = v60;
          v23 = v61;
          if (v20 >= v60)
            v20 = v60;
          if (v19 >= v61)
            v19 = v61;
          if (v16 < v60)
            v16 = v60;
          v32 = v51;
          if (v51 < v61)
            v32 = v61;
          v51 = v32;
          if ((v13 & 1) != 0)
            goto LABEL_72;
          v26 = 0;
          v14 = 1;
        }
LABEL_88:
        ++v15;
        v13 = v26;
        if (v15 >= (uint64_t)objc_msgSend(v4, "elementCount", *(_QWORD *)&v50))
          goto LABEL_91;
      }
    }
    v20 = 1.79769313e308;
    v16 = 2.22507386e-308;
    v51 = 2.22507386e-308;
    v19 = 1.79769313e308;
LABEL_91:
    self->mBounds.origin.x = v20;
    self->mBounds.origin.y = v19;
    self->mBounds.size.width = v16 - v20;
    self->mBounds.size.height = v51 - v19;
  }

}

@end
