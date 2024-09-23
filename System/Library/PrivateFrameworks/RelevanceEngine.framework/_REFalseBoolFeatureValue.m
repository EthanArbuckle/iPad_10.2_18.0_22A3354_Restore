@implementation _REFalseBoolFeatureValue

- (BOOL)BOOLValue
{
  return 0;
}

- (unint64_t)hash
{
  return 842849807;
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  char isKindOfClass;

  if (self == a3)
  {
    isKindOfClass = 1;
  }
  else
  {
    v3 = a3;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  return isKindOfClass & 1;
}

@end
