@implementation _REHashFeatureTransformer

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

- (unint64_t)hash
{
  return objc_msgSend(&unk_24CFC1360, "hash");
}

+ (id)functionName
{
  return CFSTR("hash");
}

- (_REHashFeatureTransformer)init
{
  _REHashFeatureTransformer *v2;
  _REHashFeatureTransformer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_REHashFeatureTransformer;
  v2 = -[REFeatureTransformer init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[REFeatureTransformer setName:](v2, "setName:", CFSTR("Hash"));
  return v3;
}

- (int64_t)_bitCount
{
  return 32;
}

- (unint64_t)_featureCount
{
  return 1;
}

- (unint64_t)_outputType
{
  return 1;
}

- (unint64_t)_createTransformFromValues:(unint64_t *)a3 count:(unint64_t)a4
{
  void *v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = (void *)*a3;
  if (REFeatureValueTypeForTaggedPointer(*a3) == 3)
  {
    REStringValueForTaggedPointer((unint64_t)v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = REHashString(v5);

    v7 = v6;
  }
  else
  {
    v8 = (void *)*MEMORY[0x24BDBCAB8];
    REDescriptionForTaggedPointer(v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    RERaiseInternalException(v8, CFSTR("Feature value %@ isn't a string"), v10, v11, v12, v13, v14, v15, (uint64_t)v9);

    v7 = 0;
  }
  return RECreateIntegerFeatureValueTaggedPointer(v7);
}

- (BOOL)_validateWithFeatures:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "featureType") == 1;

  return v4;
}

@end
