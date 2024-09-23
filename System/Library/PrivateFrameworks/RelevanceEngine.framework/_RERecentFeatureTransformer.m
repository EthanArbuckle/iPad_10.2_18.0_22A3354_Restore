@implementation _RERecentFeatureTransformer

+ (id)functionName
{
  return CFSTR("recent");
}

+ (BOOL)supportsInvalidation
{
  return 1;
}

+ (BOOL)supportsPersistence
{
  return 1;
}

- (_RERecentFeatureTransformer)init
{
  _RERecentFeatureTransformer *v2;
  REFeatureValueCounter *v3;
  REFeatureValueCounter *counter;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_RERecentFeatureTransformer;
  v2 = -[REFeatureTransformer init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(REFeatureValueCounter);
    counter = v2->_counter;
    v2->_counter = v3;

    -[_RERecentFeatureTransformer _updateConfigurationForCount:](v2, "_updateConfigurationForCount:", 20);
  }
  return v2;
}

- (BOOL)readFromURL:(id)a3 error:(id *)a4
{
  return -[REFeatureValueCounter readFromURL:error:](self->_counter, "readFromURL:error:", a3, a4);
}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  return -[REFeatureValueCounter writeToURL:error:](self->_counter, "writeToURL:error:", a3, a4);
}

- (void)configureWithInvocation:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;

  v21 = a3;
  if (objc_msgSend(v21, "numberOfArguments") == 1)
  {
    v10 = objc_msgSend(v21, "getArgumentAtIndex:", 0);
    v11 = (void *)v10;
    if (v10 && REFeatureValueTypeForTaggedPointer(v10) == 1)
    {
      -[_RERecentFeatureTransformer _updateConfigurationForCount:](self, "_updateConfigurationForCount:", REIntegerValueForTaggedPointer((unint64_t)v11));
    }
    else
    {
      v12 = (void *)*MEMORY[0x24BDBCAB8];
      REDescriptionForTaggedPointer(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      RERaiseInternalException(v12, CFSTR("Invalid interval %@"), v14, v15, v16, v17, v18, v19, (uint64_t)v13);

    }
  }
  else
  {
    RERaiseInternalException((void *)*MEMORY[0x24BDBCAB8], CFSTR("Incorrect number of arguments. Expecting one or three arguments"), v4, v5, v6, v7, v8, v9, v20);
  }

}

- (void)_updateConfigurationForCount:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t *p_bitCount;
  unint64_t v11;
  unint64_t v12;
  BOOL v13;
  void *v14;

  if (a3 >= 2)
  {
    p_bitCount = &self->_bitCount;
    self->_bitCount = 0;
  }
  else
  {
    RERaiseInternalException((void *)*MEMORY[0x24BDBCAB8], CFSTR("%s Count is too low. Must be 2 or greater."), a3, v3, v4, v5, v6, v7, (uint64_t)"-[_RERecentFeatureTransformer _updateConfigurationForCount:]");
    p_bitCount = &self->_bitCount;
    self->_bitCount = 0;
    if (!a3)
      goto LABEL_8;
  }
  v11 = 0;
  v12 = a3;
  do
  {
    ++v11;
    v13 = v12 > 1;
    v12 >>= 1;
  }
  while (v13);
  *p_bitCount = v11;
LABEL_8:
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Recent%lu"), a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[REFeatureTransformer setName:](self, "setName:", v14);

  -[REFeatureValueCounter setCount:](self->_counter, "setCount:", a3);
}

- (int64_t)_bitCount
{
  return self->_bitCount;
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
  void *v5;
  unint64_t v6;

  REFeatureValueForTaggedPointer((void *)*a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = RECreateIntegerFeatureValueTaggedPointer(-[REFeatureValueCounter trackedValueForValue:](self->_counter, "trackedValueForValue:", v5));

  return v6;
}

- (BOOL)_validateWithFeatures:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[REFeatureValueCounter count](self->_counter, "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _RERecentFeatureTransformer *v4;
  REFeatureValueCounter *counter;
  _RERecentFeatureTransformer *v6;
  uint64_t v7;
  REFeatureValueCounter *v8;
  BOOL v9;

  v4 = (_RERecentFeatureTransformer *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      counter = self->_counter;
      v6 = v4;
      v7 = -[REFeatureValueCounter count](counter, "count");
      v8 = v6->_counter;

      v9 = v7 == -[REFeatureValueCounter count](v8, "count");
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _RERecentFeatureTransformer *v4;

  v4 = objc_alloc_init(_RERecentFeatureTransformer);
  -[_RERecentFeatureTransformer _updateConfigurationForCount:](v4, "_updateConfigurationForCount:", -[REFeatureValueCounter count](self->_counter, "count"));
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_counter, 0);
}

@end
