@implementation REDoubleFeatureValue

void __48___REDoubleFeatureValue_featureValueWithDouble___block_invoke()
{
  _REDoubleFeatureValue *v0;
  void *v1;
  _REDoubleFeatureValue *v2;
  void *v3;

  v0 = -[_REDoubleFeatureValue initWithValue:]([_REDoubleFeatureValue alloc], "initWithValue:", 0.0);
  v1 = (void *)featureValueWithDouble__ZeroValue;
  featureValueWithDouble__ZeroValue = (uint64_t)v0;

  v2 = -[_REDoubleFeatureValue initWithValue:]([_REDoubleFeatureValue alloc], "initWithValue:", 1.0);
  v3 = (void *)featureValueWithDouble__OneValue;
  featureValueWithDouble__OneValue = (uint64_t)v2;

}

@end
