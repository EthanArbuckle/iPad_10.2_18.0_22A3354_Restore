@implementation _UIDirectionalRotationView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)setCounterTransformView:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[_UIDirectionalRotationView drLayer](self, "drLayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCounterTransformLayer:", v3);

}

- (BOOL)isCounterTransformView
{
  void *v2;
  char v3;

  -[_UIDirectionalRotationView drLayer](self, "drLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCounterTransformLayer");

  return v3;
}

- (BOOL)isInverseTransformView
{
  void *v2;
  char v3;

  -[_UIDirectionalRotationView drLayer](self, "drLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInverseTransformLayer");

  return v3;
}

- (void)setInverseTransformView:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[_UIDirectionalRotationView drLayer](self, "drLayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInverseTransformLayer:", v3);

}

@end
