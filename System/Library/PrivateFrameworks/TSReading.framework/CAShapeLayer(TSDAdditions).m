@implementation CAShapeLayer(TSDAdditions)

- (uint64_t)setCGLineCap:()TSDAdditions
{
  const __CFString *v3;
  const __CFString *v4;

  v3 = CFSTR("butt");
  if (a3 == 1)
    v3 = CFSTR("round");
  if (a3 == 2)
    v4 = CFSTR("square");
  else
    v4 = v3;
  return objc_msgSend(a1, "setLineCap:", v4);
}

- (uint64_t)setCGLineJoin:()TSDAdditions
{
  const __CFString *v3;
  const __CFString *v4;

  v3 = CFSTR("miter");
  if (a3 == 1)
    v3 = CFSTR("round");
  if (a3 == 2)
    v4 = CFSTR("bevel");
  else
    v4 = v3;
  return objc_msgSend(a1, "setLineJoin:", v4);
}

@end
