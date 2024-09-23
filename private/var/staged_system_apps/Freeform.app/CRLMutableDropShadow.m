@implementation CRLMutableDropShadow

- (void)setAngle:(double)a3
{
  sub_1000618C4(a3);
  -[CRLShadow i_setAngle:](self, "i_setAngle:");
}

- (void)setOffset:(double)a3
{
  -[CRLShadow clampOffset:](self, "clampOffset:", a3);
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
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (!v4)
  {
    v5 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101248468);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E12914(v5, v6);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101248488);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE81F0(v7, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMutableDropShadow setColor:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShadowMutableMethods.h"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 34, 0, "invalid nil value for '%{public}s'", "color");

  }
  -[CRLShadow i_setColor:](self, "i_setColor:", v4);

}

- (id)copyWithZone:(_NSZone *)a3
{
  CRLDropShadow *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  CRLDropShadow *v14;

  v4 = +[CRLDropShadow allocWithZone:](CRLDropShadow, "allocWithZone:", a3);
  -[CRLShadow angle](self, "angle");
  v6 = v5;
  -[CRLShadow offset](self, "offset");
  v8 = v7;
  -[CRLShadow radius](self, "radius");
  v10 = v9;
  -[CRLShadow opacity](self, "opacity");
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShadow color](self, "color"));
  v14 = -[CRLDropShadow initWithAngle:offset:radius:opacity:color:enabled:](v4, "initWithAngle:offset:radius:opacity:color:enabled:", v13, -[CRLShadow isEnabled](self, "isEnabled"), v6, v8, v10, v12);

  return v14;
}

@end
