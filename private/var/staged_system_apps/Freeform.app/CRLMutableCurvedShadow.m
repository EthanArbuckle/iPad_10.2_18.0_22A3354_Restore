@implementation CRLMutableCurvedShadow

- (void)setAngle:(double)a3
{
  sub_1000618C4(a3);
  -[CRLShadow i_setAngle:](self, "i_setAngle:");
}

- (void)setOffset:(double)a3
{
  -[CRLCurvedShadow clampOffset:](self, "clampOffset:", a3);
  -[CRLShadow i_setOffset:](self, "i_setOffset:");
}

- (void)setRadius:(double)a3
{
  -[CRLShadow clampRadius:](self, "clampRadius:", a3);
  -[CRLShadow i_setRadius:](self, "i_setRadius:");
}

- (void)setOpacity:(double)a3
{
  -[CRLShadow clampOpacity:](self, "clampOpacity:", a3);
  -[CRLShadow i_setOpacity:](self, "i_setOpacity:");
}

- (void)setEnabled:(BOOL)a3
{
  -[CRLShadow i_setEnabled:](self, "i_setEnabled:", a3);
}

- (void)setColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124BD78);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E180DC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124BD98);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMutableCurvedShadow setColor:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShadowMutableMethods.h"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 34, 0, "invalid nil value for '%{public}s'", "color");

  }
  -[CRLShadow i_setColor:](self, "i_setColor:", v4);

}

- (void)setCurve:(double)a3
{
  -[CRLCurvedShadow i_setCurve:](self, "i_setCurve:", a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  CRLCurvedShadow *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  CRLCurvedShadow *v16;

  v4 = +[CRLCurvedShadow allocWithZone:](CRLCurvedShadow, "allocWithZone:", a3);
  -[CRLShadow offset](self, "offset");
  v6 = v5;
  -[CRLShadow angle](self, "angle");
  v8 = v7;
  -[CRLShadow radius](self, "radius");
  v10 = v9;
  -[CRLCurvedShadow curve](self, "curve");
  v12 = v11;
  -[CRLShadow opacity](self, "opacity");
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShadow color](self, "color"));
  v16 = -[CRLCurvedShadow initWithOffset:angle:radius:curve:opacity:color:enabled:](v4, "initWithOffset:angle:radius:curve:opacity:color:enabled:", v15, -[CRLShadow isEnabled](self, "isEnabled"), v6, v8, v10, v12, v14);

  return v16;
}

@end
