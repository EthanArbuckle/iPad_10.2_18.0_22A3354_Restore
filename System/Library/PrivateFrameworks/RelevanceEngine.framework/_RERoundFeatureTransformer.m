@implementation _RERoundFeatureTransformer

+ (id)functionName
{
  return CFSTR("round");
}

- (_RERoundFeatureTransformer)init
{
  _RERoundFeatureTransformer *v2;
  _RERoundFeatureTransformer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_RERoundFeatureTransformer;
  v2 = -[REFeatureTransformer init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[REFeatureTransformer setName:](v2, "setName:", CFSTR("Round"));
  return v3;
}

- (int64_t)_bitCount
{
  return -1;
}

- (unint64_t)_featureCount
{
  return 1;
}

- (unint64_t)_outputType
{
  return 2;
}

- (unint64_t)_createTransformFromValues:(unint64_t *)a3 count:(unint64_t)a4
{
  void *v4;
  const char *v5;

  v4 = (void *)*a3;
  if (REFeatureValueTypeForTaggedPointer(*a3) == 1)
  {
    RERetainFeatureValueTaggedPointer(v4);
    return (unint64_t)v4;
  }
  else
  {
    REDoubleValueForTaggedPointer(v4, v5);
    return RECreateDoubleFeatureValueTaggedPointer();
  }
}

- (BOOL)_validateWithFeatures:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "featureType") == 2;

  return v4;
}

- (unint64_t)hash
{
  return 0xFF4352C498039EA1;
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
