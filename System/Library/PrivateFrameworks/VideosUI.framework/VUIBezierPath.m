@implementation VUIBezierPath

- (CGPath)vuiCGPath
{
  return (CGPath *)-[VUIBezierPath CGPath](objc_retainAutorelease(self), "CGPath");
}

+ (id)vui_bezierPathWithArcCenter:(CGPoint)a3 radius:(double)a4 startAngle:(double)a5 endAngle:(double)a6 clockwise:(BOOL)a7
{
  return +[VUIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](VUIBezierPath, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", a7, a3.x, a3.y, a4, a5, a6);
}

+ (id)vui_bezierPathWithRoundedRect:(CGRect)a3 radius:(double)a4
{
  return +[VUIBezierPath bezierPathWithRoundedRect:cornerRadius:](VUIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4);
}

@end
