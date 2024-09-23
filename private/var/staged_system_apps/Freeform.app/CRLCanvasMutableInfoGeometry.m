@implementation CRLCanvasMutableInfoGeometry

- (id)copyWithZone:(_NSZone *)a3
{
  CRLCanvasInfoGeometry *v4;
  $CB6DE01367A4C750E2FF2F6D92039807 flags;

  v4 = [CRLCanvasInfoGeometry alloc];
  flags = self->super._flags;
  return -[CRLCanvasInfoGeometry initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:](v4, "initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:", *(_BYTE *)&flags & 1, (*(unsigned int *)&flags >> 1) & 1, (*(unsigned int *)&flags >> 2) & 1, (*(unsigned int *)&flags >> 3) & 1, self->super._position.x, self->super._position.y, self->super._size.width, self->super._size.height, self->super._angle);
}

- (void)setPosition:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v6;
  void *v7;
  void *v8;

  y = a3.y;
  x = a3.x;
  if ((sub_100061860(a3.x, a3.y) & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124D548);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1A274();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124D568);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasMutableInfoGeometry setPosition:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasInfoGeometry.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 475, 0, "Attempted to set the position of a CRLCanvasInfoGeometry with a non-finite position");

    x = CGPointZero.x;
    y = CGPointZero.y;
  }
  self->super._position.x = x;
  self->super._position.y = y;
}

- (void)setSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  unsigned int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  double v23;
  __int16 v24;
  double v25;

  height = a3.height;
  width = a3.width;
  if (sub_1000637B4())
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124D588);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1A2F8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124D5A8);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasMutableInfoGeometry setSize:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasInfoGeometry.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 483, 0, "Attempted to set the size of a CRLCanvasInfoGeometry with NaNs");

    width = 1.0;
    height = 1.0;
  }
  if (width < 0.0 || height < 0.0)
  {
    v9 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124D5C8);
    v10 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67110402;
      v15 = v9;
      v16 = 2082;
      v17 = "-[CRLCanvasMutableInfoGeometry setSize:]";
      v18 = 2082;
      v19 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasInfoGeometry.m";
      v20 = 1024;
      v21 = 487;
      v22 = 2048;
      v23 = width;
      v24 = 2048;
      v25 = height;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Attempted to set the size of a CRLCanvasInfoGeometry with a negative width or height (%f, %f)", buf, 0x36u);
    }
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124D5E8);
    v11 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasMutableInfoGeometry setSize:]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasInfoGeometry.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 487, 0, "Attempted to set the size of a CRLCanvasInfoGeometry with a negative width or height (%f, %f)", *(_QWORD *)&width, *(_QWORD *)&height);

  }
  self->super._size.width = width;
  self->super._size.height = height;
}

- (void)setAngle:(double)a3
{
  double v4;

  sub_1000618C4(a3);
  self->super._angle = v4;
}

- (void)setWidthValid:(BOOL)a3
{
  *(_BYTE *)&self->super._flags = *(_BYTE *)&self->super._flags & 0xFE | a3;
}

- (void)setHeightValid:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->super._flags = *(_BYTE *)&self->super._flags & 0xFD | v3;
}

- (void)setHorizontalFlip:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->super._flags = *(_BYTE *)&self->super._flags & 0xFB | v3;
}

- (void)setVerticalFlip:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->super._flags = *(_BYTE *)&self->super._flags & 0xF7 | v3;
}

- (void)setCenter:(CGPoint)a3
{
  CGFloat y;

  __asm { FMOV            V3.2D, #-0.5 }
  y = a3.y;
  self->super._position = (CGPoint)vaddq_f64((float64x2_t)a3, vmulq_f64((float64x2_t)self->super._size, _Q3));
}

- (void)setTransformedBoundsOrigin:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  CGFloat v8;

  y = a3.y;
  x = a3.x;
  -[CRLCanvasInfoGeometry transformedBoundsOrigin](self, "transformedBoundsOrigin");
  v7 = sub_1000603B8(self->super._position.x, self->super._position.y, v6);
  self->super._position.x = sub_1000603D0(x, y, v7);
  self->super._position.y = v8;
}

@end
