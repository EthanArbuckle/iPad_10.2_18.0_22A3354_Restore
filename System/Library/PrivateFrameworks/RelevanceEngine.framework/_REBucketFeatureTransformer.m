@implementation _REBucketFeatureTransformer

- (BOOL)isEqual:(id)a3
{
  _REBucketFeatureTransformer *v4;
  _REBucketFeatureTransformer *v5;
  void *min;
  void *v7;
  void *max;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  BOOL v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;

  v4 = (_REBucketFeatureTransformer *)a3;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      min = (void *)self->_min;
      v7 = (void *)v5->_min;
      if (min != v7)
      {
        v15 = REFeatureValueTypeForTaggedPointer(self->_min);
        if (v15 != REFeatureValueTypeForTaggedPointer((unint64_t)v7))
          goto LABEL_13;
        REFeatureValueForTaggedPointer(min);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        REFeatureValueForTaggedPointer(v7);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "isEqual:", v17);

        if (!v18)
          goto LABEL_13;
      }
      max = (void *)self->_max;
      v9 = (void *)v5->_max;
      if (max != v9)
      {
        v10 = REFeatureValueTypeForTaggedPointer(self->_max);
        if (v10 != REFeatureValueTypeForTaggedPointer((unint64_t)v9))
          goto LABEL_13;
        REFeatureValueForTaggedPointer(max);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        REFeatureValueForTaggedPointer(v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

        if (!v13)
          goto LABEL_13;
      }
      if (self->_count == v5->_count)
        v14 = self->_bitCount == v5->_bitCount;
      else
LABEL_13:
        v14 = 0;

    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
}

- (int64_t)_bitCount
{
  return self->_bitCount;
}

- (unint64_t)_outputType
{
  return 1;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = REFeatureValueHashForTaggedPointer((void *)self->_min);
  return REFeatureValueHashForTaggedPointer((void *)self->_max) ^ v3;
}

+ (id)functionName
{
  return CFSTR("bucket");
}

- (_REBucketFeatureTransformer)init
{
  _REBucketFeatureTransformer *v2;
  _REBucketFeatureTransformer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_REBucketFeatureTransformer;
  v2 = -[REFeatureTransformer init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[_REBucketFeatureTransformer _updateConfigurationForCount:](v2, "_updateConfigurationForCount:", 10);
    -[_REBucketFeatureTransformer setMin:](v3, "setMin:", RECreateDoubleFeatureValueTaggedPointer());
    -[_REBucketFeatureTransformer setMax:](v3, "setMax:", RECreateDoubleFeatureValueTaggedPointer());
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[_REBucketFeatureTransformer setMin:](self, "setMin:", 0);
  -[_REBucketFeatureTransformer setMax:](self, "setMax:", 0);
  v3.receiver = self;
  v3.super_class = (Class)_REBucketFeatureTransformer;
  -[_REBucketFeatureTransformer dealloc](&v3, sel_dealloc);
}

- (void)setMin:(unint64_t)a3
{
  RERetainFeatureValueTaggedPointer((CFTypeRef)a3);
  REReleaseFeatureValueTaggedPointer((CFTypeRef)self->_min);
  self->_min = a3;
}

- (void)setMax:(unint64_t)a3
{
  RERetainFeatureValueTaggedPointer((CFTypeRef)a3);
  REReleaseFeatureValueTaggedPointer((CFTypeRef)self->_max);
  self->_max = a3;
}

- (void)_updateConfigurationForCount:(unint64_t)a3
{
  void *v4;
  unint64_t count;
  unint64_t v6;
  int64_t v7;
  BOOL v8;

  self->_count = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Bucket%lu"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[REFeatureTransformer setName:](self, "setName:", v4);

  count = self->_count;
  self->_bitCount = 0;
  v6 = count - 1;
  if (v6)
  {
    v7 = 0;
    do
    {
      ++v7;
      v8 = v6 > 1;
      v6 >>= 1;
    }
    while (v8);
    self->_bitCount = v7;
  }
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
  uint64_t v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  __CFString *v30;
  uint64_t v31;
  id v32;

  v32 = a3;
  v4 = objc_msgSend(v32, "numberOfArguments");
  if ((v4 & 0xFFFFFFFFFFFFFFFDLL) != 1)
  {
    v29 = (void *)*MEMORY[0x24BDBCAB8];
    v30 = CFSTR("Incorrect number of arguments. Expecting one or three arguments");
LABEL_12:
    RERaiseInternalException(v29, v30, v5, v6, v7, v8, v9, v10, v31);
LABEL_13:
    v13 = v32;
    goto LABEL_14;
  }
  v11 = v4;
  v12 = REIntegerValueForTaggedPointer(objc_msgSend(v32, "getArgumentAtIndex:", 0));
  if (!v12)
  {
    v29 = (void *)*MEMORY[0x24BDBCAB8];
    v30 = CFSTR("Invalid number of buckets");
    goto LABEL_12;
  }
  -[_REBucketFeatureTransformer _updateConfigurationForCount:](self, "_updateConfigurationForCount:", v12);
  v13 = v32;
  if (v11 != 1)
  {
    v14 = objc_msgSend(v32, "getArgumentAtIndex:", 1);
    v15 = objc_msgSend(v32, "getArgumentAtIndex:", 2);
    if (REFeatureValueTypeForTaggedPointer(v14) != 1 && REFeatureValueTypeForTaggedPointer(v14) != 2)
      RERaiseInternalException((void *)*MEMORY[0x24BDBCAB8], CFSTR("Bucket transformer only supports Int64 or Double values types"), v16, v17, v18, v19, v20, v21, v31);
    v22 = REFeatureValueTypeForTaggedPointer(v14);
    if (v22 != REFeatureValueTypeForTaggedPointer(v15))
      RERaiseInternalException((void *)*MEMORY[0x24BDBCAB8], CFSTR("Bucket transformer min and max value types must match"), v23, v24, v25, v26, v27, v28, v31);
    -[_REBucketFeatureTransformer setMin:](self, "setMin:", v14);
    -[_REBucketFeatureTransformer setMax:](self, "setMax:", v15);
    goto LABEL_13;
  }
LABEL_14:

}

- (unint64_t)_featureCount
{
  return 1;
}

- (unint64_t)_createTransformFromValues:(unint64_t *)a3 count:(unint64_t)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t count;
  uint64_t v16;
  double v17;
  const char *v18;
  double v19;
  unint64_t v20;

  if (self->_count)
  {
    v5 = (void *)*a3;
    v6 = REFeatureValueTypeForTaggedPointer(self->_min);
    v7 = REFeatureValueTypeForTaggedPointer((unint64_t)v5);
    if (v6 == 1)
    {
      if (v7 == 1)
        v9 = REIntegerValueForTaggedPointer((unint64_t)v5);
      else
        v9 = (uint64_t)REDoubleValueForTaggedPointer(v5, v8);
      v13 = REIntegerValueForTaggedPointer(self->_min);
      v14 = REIntegerValueForTaggedPointer(self->_max);
      count = self->_count;
      v16 = (unint64_t)((double)(v9 - v13) / ((double)(v14 - v13) / (double)count));
    }
    else
    {
      if (v7 == 1)
        v12 = (double)(unint64_t)REIntegerValueForTaggedPointer((unint64_t)v5);
      else
        v12 = REDoubleValueForTaggedPointer(v5, v8);
      v17 = REDoubleValueForTaggedPointer((void *)self->_min, v11);
      v19 = REDoubleValueForTaggedPointer((void *)self->_max, v18);
      count = self->_count;
      v16 = (uint64_t)((v12 - v17) / ((v19 - v17) / (double)count));
    }
    if (v16 >= count)
      v20 = count - 1;
    else
      v20 = v16;
    if (v16 >= 0)
      v10 = v20;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  return RECreateIntegerFeatureValueTaggedPointer(v10);
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

- (unint64_t)min
{
  return self->_min;
}

- (unint64_t)max
{
  return self->_max;
}

@end
