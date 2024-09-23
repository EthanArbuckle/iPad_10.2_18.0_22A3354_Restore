@implementation CRLPKStroke

- (CRLPKStroke)init
{
  CRLPKStroke *v2;
  _CRLPKStrokeData *v3;
  _CRLPKStrokeData *strokeData;
  CGSize size;
  __int128 v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRLPKStroke;
  v2 = -[CRLPKStroke init](&v8, "init");
  v2->_inflight = 1;
  v2->_inputType = 1;
  v3 = objc_alloc_init(_CRLPKStrokeData);
  strokeData = v2->_strokeData;
  v2->_strokeData = v3;

  size = CGRectNull.size;
  v2->_bounds.origin = CGRectNull.origin;
  v2->_bounds.size = size;
  v6 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v2->_transform.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v2->_transform.c = v6;
  *(_OWORD *)&v2->_transform.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  return v2;
}

- (CRLPKStroke)initWithStroke:(id)a3 points:(CRLPKCompressedStrokePoint *)a4 count:(unint64_t)a5 copy:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  CRLPKStroke *v12;
  _CRLPKStrokeData *v13;
  _CRLPKStrokeData *strokeData;
  _QWORD v16[3];

  v6 = a6;
  v10 = a3;
  v11 = objc_msgSend(v10, "_isHidden");
  if (v10)
    objc_msgSend(v10, "_version");
  else
    memset(v16, 0, sizeof(v16));
  v12 = -[CRLPKStroke initWithStroke:hidden:version:](self, "initWithStroke:hidden:version:", v10, v11, v16);
  v13 = -[_CRLPKStrokeData initWithPoints:count:copy:]([_CRLPKStrokeData alloc], "initWithPoints:count:copy:", a4, a5, v6);
  strokeData = v12->_strokeData;
  v12->_strokeData = v13;

  v12->_inputType = (int64_t)objc_msgSend(v10, "_inputType");
  return v12;
}

- (CRLPKStroke)initWithStroke:(id)a3 hidden:(BOOL)a4 version:(_CRLPKStrokeID *)a5
{
  __int128 v5;
  _OWORD v7[3];
  _CRLPKStrokeID v8;

  v8 = *a5;
  v5 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v7[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  return -[CRLPKStroke initWithStroke:hidden:version:transform:](self, "initWithStroke:hidden:version:transform:", a3, a4, &v8, v7);
}

- (CRLPKStroke)initWithStroke:(id)a3 hidden:(BOOL)a4 version:(_CRLPKStrokeID *)a5 transform:(CGAffineTransform *)a6
{
  id v10;
  char *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  void *v17;
  CGSize size;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  objc_super v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;

  v10 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CRLPKStroke;
  v11 = -[CRLPKStroke init](&v23, "init");
  v11[233] = 0;
  *((_QWORD *)v11 + 31) = objc_msgSend(v10, "_inputType");
  v11[232] = a4;
  v12 = *(_OWORD *)&a5->clock;
  *((_QWORD *)v11 + 34) = *(_QWORD *)&a5->replicaUUID[12];
  *((_OWORD *)v11 + 16) = v12;
  if (v10)
  {
    objc_msgSend(v10, "_strokeID");
    *(_OWORD *)(v11 + 24) = v24;
    *((_QWORD *)v11 + 5) = v25;
    objc_msgSend(v10, "_baseValues");
  }
  else
  {
    *((_QWORD *)v11 + 3) = 0;
    *((_QWORD *)v11 + 4) = 0;
    *((_QWORD *)v11 + 5) = 0;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v24 = 0u;
  }
  v14 = v27;
  v13 = v28;
  *((_OWORD *)v11 + 5) = v26;
  *((_OWORD *)v11 + 6) = v14;
  *((_OWORD *)v11 + 7) = v13;
  v15 = v25;
  *((_OWORD *)v11 + 3) = v24;
  *((_OWORD *)v11 + 4) = v15;
  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_strokeData"));
  v17 = (void *)*((_QWORD *)v11 + 1);
  *((_QWORD *)v11 + 1) = v16;

  size = CGRectNull.size;
  *(CGPoint *)(v11 + 280) = CGRectNull.origin;
  *(CGSize *)(v11 + 296) = size;
  objc_msgSend(v10, "timestamp");
  *((_QWORD *)v11 + 30) = v19;
  v20 = *(_OWORD *)&a6->a;
  v21 = *(_OWORD *)&a6->tx;
  *((_OWORD *)v11 + 12) = *(_OWORD *)&a6->c;
  *((_OWORD *)v11 + 13) = v21;
  *((_OWORD *)v11 + 11) = v20;

  return (CRLPKStroke *)v11;
}

- (id)_strokeData
{
  return self->_strokeData;
}

- (CGPath)newPathRepresentation
{
  void *v2;
  CGPath *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPKStroke p_points](self, "p_points"));
  v3 = sub_1002EA71C(v2, 0);

  return v3;
}

- (id)p_points
{
  NSMutableArray *pointsArray;
  CRLPKCompressedStrokePointArray *v4;
  NSMutableArray *v5;

  pointsArray = self->_pointsArray;
  if (!pointsArray)
  {
    v4 = -[CRLPKCompressedStrokePointArray initWithStroke:]([CRLPKCompressedStrokePointArray alloc], "initWithStroke:", self);
    v5 = self->_pointsArray;
    self->_pointsArray = &v4->super;

    pointsArray = self->_pointsArray;
  }
  return pointsArray;
}

- (void)_setPoints:(CRLPKCompressedStrokePoint *)a3 count:(unint64_t)a4 copy:(BOOL)a5
{
  _CRLPKStrokeData *v6;
  _CRLPKStrokeData *strokeData;

  v6 = -[_CRLPKStrokeData initWithPoints:count:copy:]([_CRLPKStrokeData alloc], "initWithPoints:count:copy:", a3, a4, a5);
  strokeData = self->_strokeData;
  self->_strokeData = v6;

}

- (unint64_t)_pointsCount
{
  return self->_strokeData->_pointsCount;
}

- (double)_renderCost
{
  return (double)self->_strokeData->_pointsCount;
}

- (void)_points
{
  return self->_strokeData->_points;
}

- (_CRLPKInflightStrokePoint)_inflightPoints
{
  if (self->_inflight)
    return (_CRLPKInflightStrokePoint *)self->_strokeData->_points;
  else
    return 0;
}

- (CRLPKCompressedStrokePoint)_completedPoints
{
  if (self->_inflight)
    return 0;
  else
    return (CRLPKCompressedStrokePoint *)self->_strokeData->_points;
}

- (void)_strokePointAtIndex:(unint64_t)a3
{
  void *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  NSString *v11;
  void *v12;
  char *points;
  char *v14;
  char *v15;

  if (self->_strokeData->_pointsCount <= a3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125A828);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
    {
      v7 = NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue(v7);
      sub_100E2F19C();
    }

    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125A848);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPKStroke _strokePointAtIndex:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/PencilKit/CRLPKStroke.mm"));
    v11 = NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 242, 0, "Invalid index in %@", v12);

  }
  points = self->_strokeData->_points;
  v14 = &points[80 * a3];
  v15 = &points[24 * a3];
  if (self->_inflight)
    return v14;
  else
    return v15;
}

- (void)_insertStrokePoint:(void *)a3 atIndex:(unint64_t)a4
{
  _CRLPKStrokeData *strokeData;
  unint64_t pointsCount;
  void *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  NSString *v15;
  void *v16;
  uint64_t v17;
  unint64_t pointsMaxCount;

  strokeData = self->_strokeData;
  pointsCount = strokeData->_pointsCount;
  if (pointsCount < a4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125A868);
    v10 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
    {
      v11 = NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue(v11);
      sub_100E2F200();
    }

    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125A888);
    v12 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPKStroke _insertStrokePoint:atIndex:]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/PencilKit/CRLPKStroke.mm"));
    v15 = NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 256, 0, "Invalid index in %@", v16);

    strokeData = self->_strokeData;
    pointsCount = strokeData->_pointsCount;
  }
  if (self->_inflight)
    v17 = 80;
  else
    v17 = 24;
  pointsMaxCount = strokeData->_pointsMaxCount;
  if (pointsCount + 1 >= pointsMaxCount)
  {
    strokeData->_pointsMaxCount = 2 * pointsMaxCount;
    self->_strokeData->_points = (char *)malloc_type_realloc(self->_strokeData->_points, self->_strokeData->_pointsMaxCount * v17, 0xF9837A5EuLL);
    strokeData = self->_strokeData;
    pointsCount = strokeData->_pointsCount;
  }
  memmove(&strokeData->_points[v17 * a4 + v17], &strokeData->_points[v17 * a4], (pointsCount - a4) * v17);
  -[CRLPKStroke _replaceStrokePointAtIndex:withStrokePoint:](self, "_replaceStrokePointAtIndex:withStrokePoint:", a4, a3);
  ++self->_strokeData->_pointsCount;
}

- (void)_removeStrokePointAtIndex:(unint64_t)a3
{
  _CRLPKStrokeData *strokeData;
  unint64_t pointsCount;
  void *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  NSString *v13;
  void *v14;
  uint64_t v15;

  strokeData = self->_strokeData;
  pointsCount = strokeData->_pointsCount;
  if (pointsCount <= a3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125A8A8);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
    {
      v9 = NSStringFromSelector(a2);
      objc_claimAutoreleasedReturnValue(v9);
      sub_100E2F264();
    }

    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125A8C8);
    v10 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPKStroke _removeStrokePointAtIndex:]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/PencilKit/CRLPKStroke.mm"));
    v13 = NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 275, 0, "Invalid index in %@", v14);

    strokeData = self->_strokeData;
    pointsCount = strokeData->_pointsCount;
  }
  v15 = 80;
  if (!self->_inflight)
    v15 = 24;
  memmove(&strokeData->_points[v15 * a3], &strokeData->_points[v15 * a3 + v15], (pointsCount + ~a3) * v15);
  --self->_strokeData->_pointsCount;
}

- (void)_addStrokePoint:(void *)a3
{
  -[CRLPKStroke _insertStrokePoint:atIndex:](self, "_insertStrokePoint:atIndex:", a3, self->_strokeData->_pointsCount);
}

- (void)_removeLastStrokePoint
{
  -[CRLPKStroke _removeStrokePointAtIndex:](self, "_removeStrokePointAtIndex:", self->_strokeData->_pointsCount - 1);
}

- (void)_replaceStrokePointAtIndex:(unint64_t)a3 withStrokePoint:(void *)a4
{
  char *points;
  char *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  char *v10;

  points = self->_strokeData->_points;
  if (self->_inflight)
  {
    v5 = &points[80 * a3];
    *(_OWORD *)v5 = *(_OWORD *)a4;
    v6 = *((_OWORD *)a4 + 1);
    v7 = *((_OWORD *)a4 + 2);
    v8 = *((_OWORD *)a4 + 4);
    *((_OWORD *)v5 + 3) = *((_OWORD *)a4 + 3);
    *((_OWORD *)v5 + 4) = v8;
    *((_OWORD *)v5 + 1) = v6;
    *((_OWORD *)v5 + 2) = v7;
  }
  else
  {
    v9 = *(_OWORD *)a4;
    v10 = &points[24 * a3];
    *((_QWORD *)v10 + 2) = *((_QWORD *)a4 + 2);
    *(_OWORD *)v10 = v9;
  }
}

- (void)_applyTransform:(CGAffineTransform *)a3
{
  CRLPKCompressedStrokePoint *v5;
  __int128 v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  float64x2_t v12;
  double v13;
  double v14;
  _OWORD v15[3];

  v5 = -[CRLPKStroke _completedPoints](self, "_completedPoints");
  v6 = *(_OWORD *)&a3->c;
  v15[0] = *(_OWORD *)&a3->a;
  v15[1] = v6;
  v15[2] = *(_OWORD *)&a3->tx;
  v7 = sub_1000791B0(v15);
  v8 = -[CRLPKStroke _pointsCount](self, "_pointsCount");
  if (v8 >= 1)
  {
    v9 = v8;
    do
    {
      v10 = sub_100075600((uint64_t)v5);
      v12 = vaddq_f64(*(float64x2_t *)&a3->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a3->c, v11), *(float64x2_t *)&a3->a, v10));
      *(float *)&v13 = sub_1000755F0((uint64_t)v5, v12.f64[0], v12.f64[1]);
      v14 = sub_100075694((uint64_t)v5, v13);
      sub_100075650((uint64_t)v5++, v7 + v14);
      --v9;
    }
    while (v9);
  }
  -[CRLPKStroke _invalidateBounds](self, "_invalidateBounds");
}

- (unsigned)_randomSeed
{
  return -[CRLPKStroke hash](self, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  BOOL v8;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;

  v4 = a3;
  objc_opt_class(CRLPKStroke, v5);
  v8 = (objc_opt_isKindOfClass(v4, v6) & 1) != 0
    && ((v14 = *(_OWORD *)&self->_strokeID.clock, v15 = *(_QWORD *)&self->_strokeID.replicaUUID[12], !v4)
      ? (v7 = 0, v11 = 0, v12 = 0, v13 = 0)
      : (objc_msgSend(v4, "_strokeID"), v7 = v10),
        (_DWORD)v14 == v7 && !sub_1003A72E8((const unsigned __int8 *)&v14 + 4, (const unsigned __int8 *)&v11))
    && HIDWORD(v15) == HIDWORD(v13);

  return v8;
}

- (unint64_t)hash
{
  uint64_t v2;

  v2 = self->_strokeID.clock ^ (self->_strokeID.subclock << 16);
  return sub_1003F15C0((uint64_t)self->_strokeID.replicaUUID, 16) ^ v2;
}

- (void)_setBaseValues:(_CRLPKStrokePoint *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  *(_OWORD *)&self->_baseValues.timestamp = *(_OWORD *)&a3->timestamp;
  v3 = *(_OWORD *)&a3->location.y;
  v4 = *(_OWORD *)&a3->aspectRatio;
  v5 = *(_OWORD *)&a3->altitude;
  *(_OWORD *)&self->_baseValues.force = *(_OWORD *)&a3->force;
  *(_OWORD *)&self->_baseValues.altitude = v5;
  *(_OWORD *)&self->_baseValues.location.y = v3;
  *(_OWORD *)&self->_baseValues.aspectRatio = v4;
}

- (_CRLPKStrokePoint)_baseValues
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&self[1].location.y;
  *(_OWORD *)&retstr->aspectRatio = *(_OWORD *)&self[1].timestamp;
  *(_OWORD *)&retstr->force = v3;
  *(_OWORD *)&retstr->altitude = *(_OWORD *)&self[1].aspectRatio;
  v4 = *(_OWORD *)&self->altitude;
  *(_OWORD *)&retstr->timestamp = *(_OWORD *)&self->force;
  *(_OWORD *)&retstr->location.y = v4;
  return self;
}

- (void)_setIsClipped:(BOOL)a3
{
  self->_clipped = a3;
}

- (BOOL)_isClipped
{
  return self->_clipped;
}

- (void)_setClipOrigin:(CGPoint)a3
{
  self->_clipOrigin = a3;
}

- (CGPoint)_clipOrigin
{
  double x;
  double y;
  CGPoint result;

  x = self->_clipOrigin.x;
  y = self->_clipOrigin.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)_setClipNormal:(CGPoint)a3
{
  self->_clipNormal = a3;
}

- (CGPoint)_clipNormal
{
  double x;
  double y;
  CGPoint result;

  x = self->_clipNormal.x;
  y = self->_clipNormal.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)_setShouldSolveMath:(BOOL)a3
{
  self->_shouldSolveMath = a3;
}

- (BOOL)_shouldSolveMath
{
  return self->_shouldSolveMath;
}

- (CGRect)_bounds
{
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  _CRLPKStrokeData *strokeData;
  unint64_t v8;
  char *points;
  __int128 v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  __int128 v22;
  uint64_t v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect result;
  CGRect v28;

  if (!self->_inflight && CGRectIsNull(self->_bounds))
  {
    x = CGRectNull.origin.x;
    y = CGRectNull.origin.y;
    width = CGRectNull.size.width;
    height = CGRectNull.size.height;
    strokeData = self->_strokeData;
    if (strokeData->_pointsCount)
    {
      v8 = 0;
      points = strokeData->_points;
      do
      {
        v10 = *(_OWORD *)points;
        v23 = *((_QWORD *)points + 2);
        v22 = v10;
        v11 = sub_100075610((uint64_t)&v22, *(double *)&v10);
        v12 = sub_10007563C((uint64_t)&v22, v11);
        v13 = sub_100075624((uint64_t)&v22, v12);
        v14 = 1.0;
        if (v13 > 1.0)
          v14 = sub_100075624((uint64_t)&v22, 1.0);
        v15 = (v11 + v12) * v14 + 2.0;
        v16 = sub_100075600((uint64_t)&v22);
        v28.origin.x = self->_transform.tx + v17 * self->_transform.c + self->_transform.a * v16 - v15;
        v28.origin.y = self->_transform.ty + v17 * self->_transform.d + self->_transform.b * v16 - v15;
        v28.size.width = v15 + v15;
        v24.origin.x = x;
        v24.origin.y = y;
        v24.size.width = width;
        v24.size.height = height;
        v28.size.height = v15 + v15;
        v25 = CGRectUnion(v24, v28);
        x = v25.origin.x;
        y = v25.origin.y;
        width = v25.size.width;
        height = v25.size.height;
        ++v8;
        points += 24;
      }
      while (v8 < self->_strokeData->_pointsCount);
    }
    v26.origin.x = x;
    v26.origin.y = y;
    v26.size.width = width;
    v26.size.height = height;
    self->_bounds = CGRectIntegral(v26);
  }
  v18 = self->_bounds.origin.x;
  v19 = self->_bounds.origin.y;
  v20 = self->_bounds.size.width;
  v21 = self->_bounds.size.height;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (void)_invalidateBounds
{
  CGSize size;

  size = CGRectNull.size;
  self->_bounds.origin = CGRectNull.origin;
  self->_bounds.size = size;
}

- (_CRLPKStrokeID)_version
{
  *retstr = *(_CRLPKStrokeID *)((char *)self + 256);
  return self;
}

- (void)_setStrokeID:(_CRLPKStrokeID *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->clock;
  *(_QWORD *)&self->_strokeID.replicaUUID[12] = *(_QWORD *)&a3->replicaUUID[12];
  *(_OWORD *)&self->_strokeID.clock = v3;
}

- (_CRLPKStrokeID)_strokeID
{
  *retstr = self[1];
  return self;
}

- (id)description
{
  id v3;
  id v4;
  uint64_t v5;
  Class v6;
  NSString *v7;
  void *v8;
  void *v9;
  uint64_t clock;
  uint64_t subclock;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;

  v3 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", self->_strokeID.replicaUUID);
  v4 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", self->_version.replicaUUID);
  objc_opt_class(self, v5);
  v7 = NSStringFromClass(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUIDString"));
  clock = self->_strokeID.clock;
  subclock = self->_strokeID.subclock;
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));
  v13 = (void *)v12;
  if (self->_hidden)
    v14 = CFSTR(" hidden");
  else
    v14 = &stru_1012A72B0;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p id=%@:%d.%d v=%@:%d.%d%@>"), v8, self, v9, clock, subclock, v12, self->_version.clock, self->_version.subclock, v14));

  return v15;
}

- (id)descriptionExtended
{
  void *v3;
  uint64_t v4;
  Class v5;
  NSString *v6;
  uint64_t v7;
  uint64_t clock;
  uint64_t subclock;
  uint64_t v10;
  uint64_t v11;
  double timestamp;
  const __CFString *v13;
  const __CFString *v14;
  NSString *v15;
  NSString *v16;
  uint64_t v17;
  NSString *v18;
  void *v19;
  _BOOL4 clipped;
  __int128 v21;
  NSString *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  uint64_t v28;
  const __CFString *v29;
  const __CFString *v30;
  unint64_t pointsCount;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  CRLPKStrokePoint *v36;
  id v37;
  id v38;
  CGAffineTransform transform;
  CGRect v40;

  v38 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", self->_strokeID.replicaUUID);
  v37 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", self->_version.replicaUUID);
  v36 = -[CRLPKStrokePoint initWithStroke:strokePoint:inflight:]([CRLPKStrokePoint alloc], "initWithStroke:strokePoint:inflight:", self, &self->_baseValues, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPKStrokePoint description](v36, "description"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\t"), CFSTR("\t\t")));

  objc_opt_class(self, v4);
  v6 = NSStringFromClass(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  clock = self->_strokeID.clock;
  subclock = self->_strokeID.subclock;
  v10 = self->_version.clock;
  v11 = self->_version.subclock;
  timestamp = self->_timestamp;
  if (self->_inflight)
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  if (self->_hidden)
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  pointsCount = self->_strokeData->_pointsCount;
  v34 = (void *)v7;
  -[CRLPKStroke _bounds](self, "_bounds");
  v15 = NSStringFromCGRect(v40);
  v33 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v29 = v14;
  v30 = v13;
  v16 = NSStringFromCGPoint(self->_clipOrigin);
  v17 = v10;
  v32 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v28 = clock;
  v18 = NSStringFromCGPoint(self->_clipNormal);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  clipped = self->_clipped;
  v21 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&transform.a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&transform.c = v21;
  *(_OWORD *)&transform.tx = *(_OWORD *)&self->_transform.tx;
  v22 = NSStringFromCGAffineTransform(&transform);
  v23 = objc_claimAutoreleasedReturnValue(v22);
  v24 = (void *)v23;
  if (clipped)
    v25 = CFSTR("YES");
  else
    v25 = CFSTR("NO");
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %p (id: %@ %d.%d, version: %@ %d.%d)\n\ttimestamp: %g\n\tinflight: %@\n\thidden: %@\n\t%lu points\n\tbounds: %@\n\tclip origin: %@\n\tclip normal: %@\n\tclipped: %@\n\tbase values:%@\n \ttransform:%@\n"), v34, self, v38, v28, subclock, v37, v17, v11, *(_QWORD *)&timestamp, v30, v29, pointsCount, v33, v32, v19,
                    v25,
                    v35,
                    v23));

  return v26;
}

- (int64_t)compareToStroke:(id)a3
{
  id v4;
  int64_t v5;
  _QWORD v7[3];
  _BYTE v8[24];

  v4 = a3;
  -[CRLPKStroke _strokeID](self, "_strokeID");
  if (v4)
    objc_msgSend(v4, "_strokeID");
  else
    memset(v7, 0, sizeof(v7));
  v5 = sub_1003F169C((uint64_t)v8, (uint64_t)v7);

  return v5;
}

- (CGPoint)_splineControlPoint:(int64_t)a3
{
  _CRLPKStrokeData *strokeData;
  void *v6;
  void *v7;
  void *v8;
  uint64_t points;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  double v13;
  double v14;
  float64x2_t v15;
  double v16;
  double v17;
  double v18;
  float64x2_t *v19;
  float64x2_t *v20;
  float64x2_t v21;
  float64x2_t v22;
  double v23;
  double v24;
  double v25;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  float64x2_t v35;
  float64x2_t v36;
  double v37;
  float64x2_t v38;
  float64x2_t v39;
  float64x2_t v40;
  float64x2_t v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  float64x2_t v49;
  float64x2_t v50;
  float64x2_t v51;
  float64x2_t v52;
  uint64_t v53;
  _OWORD v54[5];
  uint64_t v55;
  _OWORD v56[4];
  CGPoint result;

  if (a3 < -1 || (strokeData = self->_strokeData, (int64_t)strokeData->_pointsCount < a3))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125A8E8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2F348();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125A908);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPKStroke _splineControlPoint:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/PencilKit/CRLPKStroke.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 436, 0, "%ld is out of bounds", a3);

    strokeData = self->_strokeData;
  }
  points = (uint64_t)strokeData->_points;
  v10 = -[CRLPKStroke _pointsCount](self, "_pointsCount");
  if (a3 < 0)
  {
    v16 = sub_100075600(points);
    v44 = v17;
    v47 = v16;
    -[CRLPKStroke _transform](self, "_transform");
    v35 = (float64x2_t)v56[2];
    v38 = (float64x2_t)v56[3];
    v40 = (float64x2_t)v56[1];
    v42 = sub_100075600(points + 24);
    v37 = v18;
    -[CRLPKStroke _transform](self, "_transform");
    v19 = (float64x2_t *)&v55;
    v20 = (float64x2_t *)v56;
    v21 = vaddq_f64(v38, vmlaq_n_f64(vmulq_n_f64(v35, v44), v40, v47));
    v22 = (float64x2_t)v54[4];
LABEL_18:
    __asm { FMOV            V2.2D, #2.0 }
    v15 = vmlaq_f64(vnegq_f64(vaddq_f64(*v20, vmlaq_n_f64(vmulq_n_f64(*v19, v37), v22, v42))), _Q2, v21);
    goto LABEL_19;
  }
  v11 = v10;
  v12 = v10;
  if ((v10 & 0x8000000000000000) != 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125A928);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2F2C8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125A948);
    v32 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPKStroke _splineControlPoint:]"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/PencilKit/CRLPKStroke.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v33, v34, 448, 0, "Out-of-bounds type assignment was clamped to max");

    v12 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v12 <= a3)
  {
    v23 = sub_100075600(points + 24 * v11 - 24);
    v45 = v24;
    v48 = v23;
    -[CRLPKStroke _transform](self, "_transform");
    v36 = (float64x2_t)v54[2];
    v39 = (float64x2_t)v54[3];
    v41 = (float64x2_t)v54[1];
    v42 = sub_100075600(points + 24 * v11 - 48);
    v37 = v25;
    -[CRLPKStroke _transform](self, "_transform");
    v19 = (float64x2_t *)&v53;
    v20 = (float64x2_t *)v54;
    v21 = vaddq_f64(v39, vmlaq_n_f64(vmulq_n_f64(v36, v45), v41, v48));
    v22 = v52;
    goto LABEL_18;
  }
  v13 = sub_100075600(points + 24 * a3);
  v43 = v14;
  v46 = v13;
  -[CRLPKStroke _transform](self, "_transform");
  v15 = vaddq_f64(v51, vmlaq_n_f64(vmulq_n_f64(v50, v43), v49, v46));
LABEL_19:
  v31 = v15.f64[1];
  result.x = v15.f64[0];
  result.y = v31;
  return result;
}

- (CGPoint)_interpolatedPointForSplineSegment:(int64_t)a3 t:(double)a4
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double y;
  double x;
  int64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGPoint result;

  if (a3 < 0 || (char *)-[CRLPKStroke _pointsCount](self, "_pointsCount") - 2 < (char *)a3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125A968);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2F3CC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125A988);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPKStroke _interpolatedPointForSplineSegment:t:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/PencilKit/CRLPKStroke.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 463, 0, "Segment index %ld is out of bounds", a3);

  }
  v10 = 0;
  x = CGPointZero.x;
  y = CGPointZero.y;
  v13 = a3 - 1;
  v14 = 0.0;
  do
  {
    -[CRLPKStroke _splineControlPoint:](self, "_splineControlPoint:", v13 + v10);
    v16 = v15;
    v18 = v17;
    v19 = sub_1002EA020((int)v10 - 2, a4);
    x = x + v19 * v16;
    y = y + v19 * v18;
    v14 = v14 + v19;
    ++v10;
  }
  while (v10 != 4);
  v20 = x / v14;
  v21 = y / v14;
  result.y = v21;
  result.x = v20;
  return result;
}

- (double)_interpolatedTimeForSplineSegment:(int64_t)a3 t:(double)a4
{
  void *v6;
  void *v7;
  void *v8;
  char *points;
  double v10;
  double v11;
  double v12;

  if (a3 < 0 || (char *)-[CRLPKStroke _pointsCount](self, "_pointsCount", a4) - 2 < (char *)a3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", a4);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125A9A8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2F450();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125A9C8);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPKStroke _interpolatedTimeForSplineSegment:t:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/PencilKit/CRLPKStroke.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 482, 0, "Segment index %ld is out of bounds", a3);

  }
  points = self->_strokeData->_points;
  -[CRLPKStroke timestamp](self, "timestamp");
  v11 = sub_1000755E0((float *)&points[24 * a3], v10);
  -[CRLPKStroke timestamp](self, "timestamp");
  return v11 + (sub_1000755E0((float *)&points[24 * a3 + 24], v12) - v11) * (double)a3;
}

- (double)_lengthOfSplineSegment:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;

  if ((char *)-[CRLPKStroke _pointsCount](self, "_pointsCount") - 2 < (char *)a3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125A9E8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2F4D4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125AA08);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPKStroke _lengthOfSplineSegment:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/PencilKit/CRLPKStroke.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 493, 0, "Segment index %ld is out of bounds", a3);

  }
  -[CRLPKStroke _splineControlPoint:](self, "_splineControlPoint:", a3 - 1);
  v9 = v8;
  v11 = v10;
  -[CRLPKStroke _splineControlPoint:](self, "_splineControlPoint:", a3);
  v13 = v12;
  v15 = v14;
  -[CRLPKStroke _splineControlPoint:](self, "_splineControlPoint:", a3 + 1);
  v17 = v16;
  v19 = v18;
  -[CRLPKStroke _splineControlPoint:](self, "_splineControlPoint:", a3 + 2);
  return sub_1002EA1C4(v9, v11, v13, v15, v17, v19, v20, v21);
}

- (double)_strokeLength
{
  double v3;
  char *v4;
  double v5;

  v3 = 0.0;
  if ((id)-[CRLPKStroke _pointsCount](self, "_pointsCount") != (id)1)
  {
    -[CRLPKStroke _pointsCount](self, "_pointsCount");
    v4 = 0;
    do
    {
      -[CRLPKStroke _lengthOfSplineSegment:](self, "_lengthOfSplineSegment:", v4);
      v3 = v3 + v5;
      ++v4;
    }
    while (v4 <= (char *)-[CRLPKStroke _pointsCount](self, "_pointsCount") - 2);
  }
  return v3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (BOOL)_isHidden
{
  return self->_hidden;
}

- (void)set_hidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (void)set_version:(_CRLPKStrokeID *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->clock;
  *(_QWORD *)&self->_version.replicaUUID[12] = *(_QWORD *)&a3->replicaUUID[12];
  *(_OWORD *)&self->_version.clock = v3;
}

- (void)set_bounds:(CGRect)a3
{
  self->_bounds = a3;
}

- (BOOL)_inflight
{
  return self->_inflight;
}

- (void)set_inflight:(BOOL)a3
{
  self->_inflight = a3;
}

- (int64_t)_inputType
{
  return self->_inputType;
}

- (void)_setInputType:(int64_t)a3
{
  self->_inputType = a3;
}

- (CGAffineTransform)_transform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[4].a;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[3].tx;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[4].c;
  return self;
}

- (void)_setTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_transform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_transform.tx = v4;
  *(_OWORD *)&self->_transform.a = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeIDWrapper, 0);
  objc_storeStrong((id *)&self->_pointsArray, 0);
  objc_storeStrong((id *)&self->_strokeData, 0);
}

- (CGPoint)clipOrigin
{
  double v2;
  double v3;
  CGPoint result;

  -[CRLPKStroke _clipOrigin](self, "_clipOrigin");
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)clipNormal
{
  double v2;
  double v3;
  CGPoint result;

  -[CRLPKStroke _clipNormal](self, "_clipNormal");
  result.y = v3;
  result.x = v2;
  return result;
}

@end
