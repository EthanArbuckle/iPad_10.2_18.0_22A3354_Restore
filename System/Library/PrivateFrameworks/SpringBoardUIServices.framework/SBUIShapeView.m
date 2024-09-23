@implementation SBUIShapeView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)setPath:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  -[SBUIShapeView _shapeLayer](self, "_shapeLayer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_retainAutorelease(v4);
  v6 = objc_msgSend(v5, "CGPath");

  objc_msgSend(v7, "setPath:", v6);
}

- (void)setFillColor:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  -[SBUIShapeView _shapeLayer](self, "_shapeLayer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_retainAutorelease(v4);
  v6 = objc_msgSend(v5, "CGColor");

  objc_msgSend(v7, "setFillColor:", v6);
}

- (void)setFillRule:(int64_t)a3
{
  void *v4;
  _QWORD *v5;
  id v6;

  -[SBUIShapeView _shapeLayer](self, "_shapeLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v5 = (_QWORD *)MEMORY[0x1E0CD2B70];
  if (a3 != 1)
    v5 = (_QWORD *)MEMORY[0x1E0CD2B78];
  objc_msgSend(v4, "setFillRule:", *v5);

}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  char v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBUIShapeView;
  if (-[SBUIShapeView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4))
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("path"));

  return v5;
}

@end
