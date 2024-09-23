@implementation _REBinaryFeatureTransformer

+ (id)functionName
{
  return CFSTR("threshold");
}

- (_REBinaryFeatureTransformer)init
{
  _REBinaryFeatureTransformer *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_REBinaryFeatureTransformer;
  v2 = -[REFeatureTransformer init](&v4, sel_init);
  if (v2)
  {
    -[_REBinaryFeatureTransformer setThreshold:](v2, "setThreshold:", RECreateIntegerFeatureValueTaggedPointer(0));
    -[REFeatureTransformer setName:](v2, "setName:", CFSTR("Binary"));
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[_REBinaryFeatureTransformer setThreshold:](self, "setThreshold:", 0);
  v3.receiver = self;
  v3.super_class = (Class)_REBinaryFeatureTransformer;
  -[_REBinaryFeatureTransformer dealloc](&v3, sel_dealloc);
}

- (void)setThreshold:(unint64_t)a3
{
  RERetainFeatureValueTaggedPointer((CFTypeRef)a3);
  REReleaseFeatureValueTaggedPointer((CFTypeRef)self->_threshold);
  self->_threshold = a3;
}

- (void)configureWithInvocation:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  if (objc_msgSend(v11, "numberOfArguments") == 1)
    -[_REBinaryFeatureTransformer setThreshold:](self, "setThreshold:", objc_msgSend(v11, "getArgumentAtIndex:", 0));
  else
    RERaiseInternalException((void *)*MEMORY[0x24BDBCAB8], CFSTR("Expecting one argument in the invocation"), v4, v5, v6, v7, v8, v9, v10);

}

- (int64_t)_bitCount
{
  return 1;
}

- (unint64_t)_featureCount
{
  return 1;
}

- (unint64_t)_outputType
{
  return 0;
}

- (unint64_t)_createTransformFromValues:(unint64_t *)a3 count:(unint64_t)a4
{
  _BOOL4 v4;

  v4 = RECompareFeatureValues(*a3, (void *)self->_threshold) == 1;
  return RECreateBooleanFeatureValueTaggedPointer(v4);
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
  return REFeatureValueHashForTaggedPointer((void *)self->_threshold);
}

- (BOOL)isEqual:(id)a3
{
  _REBinaryFeatureTransformer *v4;
  _REBinaryFeatureTransformer *v5;
  void *threshold;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v4 = (_REBinaryFeatureTransformer *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      threshold = (void *)self->_threshold;
      v7 = (void *)v5->_threshold;
      if (threshold == v7)
      {
        v8 = 1;
      }
      else
      {
        v9 = REFeatureValueTypeForTaggedPointer((unint64_t)threshold);
        if (v9 == REFeatureValueTypeForTaggedPointer((unint64_t)v7))
        {
          REFeatureValueForTaggedPointer(threshold);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          REFeatureValueForTaggedPointer(v7);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v10, "isEqual:", v11);

        }
        else
        {
          v8 = 0;
        }
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)threshold
{
  return self->_threshold;
}

@end
