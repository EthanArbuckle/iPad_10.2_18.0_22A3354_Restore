@implementation PXRegion

- (id)normalizedWithBasisRect:(CGRect)a3
{
  _BYTE v4[48];

  -[PXRegion transformedWithAffineTransform:](self, "transformedWithAffineTransform:", v4, PXAffineTransformMakeFromRects((uint64_t)v4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 0.0, 0.0, 1.0, 1.0));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)denormalizedWithBasisRect:(CGRect)a3
{
  _BYTE v4[48];

  -[PXRegion transformedWithAffineTransform:](self, "transformedWithAffineTransform:", v4, PXAffineTransformMakeFromRects((uint64_t)v4, 0.0, 0.0, 1.0, 1.0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)transformedWithAffineTransform:(CGAffineTransform *)a3
{
  void *v5;
  objc_class *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXRegion.m"), 26, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXRegion transformedWithAffineTransform:]", v7);

  abort();
}

- (double)opacityAtPoint:(CGPoint)a3
{
  double v3;

  -[PXRegion valueAtPoint:](self, "valueAtPoint:", a3.x, a3.y);
  return fmax(fmin(v3, 1.0), 0.0);
}

- (double)valueAtPoint:(CGPoint)a3
{
  void *v5;
  objc_class *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3.x, a3.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXRegion.m"), 34, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXRegion valueAtPoint:]", v7);

  abort();
}

- (CGPath)createPathInRect:(CGRect)a3
{
  void *v5;
  objc_class *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXRegion.m"), 38, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXRegion createPathInRect:]", v7);

  abort();
}

@end
