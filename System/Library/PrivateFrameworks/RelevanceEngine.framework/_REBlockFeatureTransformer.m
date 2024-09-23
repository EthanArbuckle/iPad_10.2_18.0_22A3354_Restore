@implementation _REBlockFeatureTransformer

- (BOOL)isEqual:(id)a3
{
  _REBlockFeatureTransformer *v4;
  _REBlockFeatureTransformer *v5;
  id v6;
  id v7;
  int v8;
  BOOL v9;

  v4 = (_REBlockFeatureTransformer *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = (id)MEMORY[0x2199B2434](self->_block);
      v7 = (id)MEMORY[0x2199B2434](v5->_block);
      if (v6 == v7)
      {

      }
      else
      {
        v8 = objc_msgSend(v6, "isEqual:", v7);

        if (!v8)
          goto LABEL_11;
      }
      if (self->_featureCount == v5->_featureCount)
      {
        v9 = self->_outputFeatureType == v5->_outputFeatureType;
LABEL_12:

        goto LABEL_13;
      }
LABEL_11:
      v9 = 0;
      goto LABEL_12;
    }
    v9 = 0;
  }
LABEL_13:

  return v9;
}

- (unint64_t)hash
{
  return objc_msgSend(self->_block, "hash");
}

- (_REBlockFeatureTransformer)initWithFeatureCount:(unint64_t)a3 outputFeatureType:(unint64_t)a4 transformation:(id)a5
{
  id v8;
  _REBlockFeatureTransformer *v9;
  _REBlockFeatureTransformer *v10;
  uint64_t v11;
  id block;
  objc_super v14;

  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_REBlockFeatureTransformer;
  v9 = -[REFeatureTransformer init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_featureCount = a3;
    v9->_outputFeatureType = a4;
    v11 = MEMORY[0x2199B2434](v8);
    block = v10->_block;
    v10->_block = (id)v11;

  }
  return v10;
}

- (int64_t)_bitCount
{
  return -1;
}

- (unint64_t)_featureCount
{
  return self->_featureCount;
}

- (unint64_t)_outputType
{
  return self->_outputFeatureType;
}

- (unint64_t)_createTransformFromValues:(unint64_t *)a3 count:(unint64_t)a4
{
  unint64_t v4;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;

  if (!self->_block)
    return 0;
  v4 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", a4);
  for (i = (void *)objc_claimAutoreleasedReturnValue(); v4; --v4)
  {
    v8 = (void *)*a3++;
    REFeatureValueForTaggedPointer(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(i, "addObject:", v9);

  }
  (*((void (**)(void))self->_block + 2))();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = RECreateFeatureValueTaggedPointer(v10);

  return v11;
}

- (BOOL)_validateWithFeatures:(id)a3
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

@end
