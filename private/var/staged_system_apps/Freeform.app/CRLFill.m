@implementation CRLFill

- (void)paintRect:(CGRect)a3 inContext:(CGContext *)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGPath *Mutable;
  CGRect v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  Mutable = CGPathCreateMutable();
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  CGPathAddRect(Mutable, 0, v11);
  -[CRLFill paintPath:inContext:](self, "paintPath:inContext:", Mutable, a4);
  CGPathRelease(Mutable);
}

- (BOOL)canApplyToRenderable
{
  return 0;
}

- (BOOL)shouldBeReappliedToRenderable:(id)a3
{
  return 0;
}

- (void)applyToRenderable:(id)a3 withScale:(double)a4
{
  void *v4;
  void *v5;
  void *v6;

  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", a3, a4);
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10124D0A8);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E199CC();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10124D0C8);
  v4 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE87A4(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFill applyToRenderable:withScale:]"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLFill.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 72, 0, "called -applyToRenderable:withScale: on a CRLFill that can't");

}

- (BOOL)isOpaque
{
  return 0;
}

- (BOOL)isNearlyWhite
{
  return 0;
}

- (BOOL)requiresOutlineOnBackgroundWithAppearance:(unint64_t)a3
{
  return 0;
}

- (BOOL)isClear
{
  return 0;
}

- (BOOL)drawsInOneStep
{
  return 0;
}

- (CRLColor)referenceColor
{
  return +[CRLColor clearColor](CRLColor, "clearColor");
}

- (int64_t)fillType
{
  void *v2;
  void *v3;
  void *v4;

  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10124D0E8);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E19A50();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10124D108);
  v2 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE87A4(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFill fillType]"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLFill.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, v4, 112, 0, "subclasses must override");

  return 4;
}

@end
