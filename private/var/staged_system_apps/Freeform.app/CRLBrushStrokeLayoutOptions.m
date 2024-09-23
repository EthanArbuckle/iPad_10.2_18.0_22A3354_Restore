@implementation CRLBrushStrokeLayoutOptions

- (CRLBrushStrokeLayoutOptions)init
{
  CRLBrushStrokeLayoutOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLBrushStrokeLayoutOptions;
  result = -[CRLBrushStrokeLayoutOptions init](&v3, "init");
  if (result)
    result->_strokeEnd = 1.0;
  return result;
}

- (void)setStrokeEnd:(double)a3
{
  double v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = sub_1003C65EC(a3, 0.0, 1.0);
  self->_strokeEnd = v5;
  if (v5 != a3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125C7E8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E32284();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125C808);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBrushStrokeLayoutOptions setStrokeEnd:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBrushStroke.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 146, 0, "strokeEnd (%f) should be between 0 and 1 inclusive.", *(_QWORD *)&a3);

  }
}

- (NSArray)patternOffsetsBySubpath
{
  return self->_patternOffsetsBySubpath;
}

- (void)setPatternOffsetsBySubpath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)transparencyLayersBySubpath
{
  return self->_transparencyLayersBySubpath;
}

- (void)setTransparencyLayersBySubpath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (double)strokeEnd
{
  return self->_strokeEnd;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transparencyLayersBySubpath, 0);
  objc_storeStrong((id *)&self->_patternOffsetsBySubpath, 0);
}

@end
