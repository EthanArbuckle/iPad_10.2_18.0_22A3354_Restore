@implementation UIBezierPath(Silex)

- (id)TSDBezierPath
{
  void *v2;

  objc_msgSend(MEMORY[0x24BEB3A68], "bezierPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  CGPathApply((CGPathRef)objc_msgSend(objc_retainAutorelease(a1), "CGPath"), v2, (CGPathApplierFunction)UIBezierPathSilexPathApplier);
  return v2;
}

@end
