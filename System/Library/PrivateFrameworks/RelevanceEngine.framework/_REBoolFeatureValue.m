@implementation _REBoolFeatureValue

+ (id)featureValueWithBool:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t *v4;

  v3 = a3;
  if (featureValueWithBool__onceToken != -1)
    dispatch_once(&featureValueWithBool__onceToken, &__block_literal_global_83);
  v4 = &featureValueWithBool__TrueValue;
  if (!v3)
    v4 = &featureValueWithBool__FalseValue;
  return (id)*v4;
}

- (unint64_t)type
{
  return 0;
}

- (unint64_t)_integralFeatureValue
{
  return -[REFeatureValue BOOLValue](self, "BOOLValue");
}

@end
