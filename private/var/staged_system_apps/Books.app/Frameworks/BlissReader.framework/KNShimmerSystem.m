@implementation KNShimmerSystem

- (void)drawWithPercent:(double)a3 opacity:(double)a4 rotation:(double)a5 clockwise:(BOOL)a6 texture:(id)a7 context:(id)a8
{
  void *v8;
  void *v9;
  id v10;

  v10 = (id)objc_claimAutoreleasedReturnValue(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a6, a7, a8, a3, a4, a5));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNShimmerSystem drawWithPercent:opacity:rotation:clockwise:texture:context:]"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildShimmer.m"));
  objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v8, v9, 526, CFSTR("Call me on the subclass, genius!"));

}

- (double)speedMax
{
  double v3;
  double v4;
  double v5;

  -[KNShimmerSystem objectSize](self, "objectSize");
  v4 = v3;
  -[KNShimmerSystem objectSize](self, "objectSize");
  return sqrt(v4 * v5) * 0.075;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)speedAtIndexPoint:(CGPoint)a3
{
  void *v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  $E2C29196C7A5C696474C6955C5A9CE06 result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KNShimmerSystem randomGenerator](self, "randomGenerator", a3.x, a3.y));
  objc_msgSend(v3, "metalPoint3DRandomDirection");
  v5 = v4;
  v7 = v6;

  v8 = 0.0;
  v9 = v5;
  v10 = v7;
  result.var2 = v8;
  result.var1 = v10;
  result.var0 = v9;
  return result;
}

@end
