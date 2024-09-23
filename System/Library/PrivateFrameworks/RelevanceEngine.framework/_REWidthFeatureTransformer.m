@implementation _REWidthFeatureTransformer

- (BOOL)isEqual:(id)a3
{
  _REWidthFeatureTransformer *v4;
  BOOL v5;

  v4 = (_REWidthFeatureTransformer *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_width == v4->_width && self->_shift == v4->_shift;
  }

  return v5;
}

- (int64_t)_bitCount
{
  return self->_width;
}

- (unint64_t)_outputType
{
  return 1;
}

- (unint64_t)hash
{
  return self->_width ^ (self->_shift << 8);
}

- (_REWidthFeatureTransformer)initWithWidth:(unint64_t)a3 shift:(unint64_t)a4
{
  _REWidthFeatureTransformer *v6;
  _REWidthFeatureTransformer *v7;
  unint64_t width;
  uint64_t v9;
  void *v10;
  uint64_t v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_REWidthFeatureTransformer;
  v6 = -[REFeatureTransformer init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_width = a3;
    v6->_shift = a4;
    width = v6->_width;
    v9 = -1;
    if (width <= 0x3F)
      v9 = ~(-1 << width);
    v6->_mask = v9;
    if (a4)
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Mask%luShift%lu"), width, a4);
    else
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Mask%lu"), width, v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[REFeatureTransformer setName:](v7, "setName:", v10);

  }
  return v7;
}

- (unint64_t)_featureCount
{
  return 1;
}

- (unint64_t)_createTransformFromValues:(unint64_t *)a3 count:(unint64_t)a4
{
  unint64_t v4;

  v4 = self->_mask & ((unint64_t)REIntegerValueForTaggedPointer(*a3) >> self->_shift);
  return RECreateIntegerFeatureValueTaggedPointer(v4);
}

- (BOOL)_validateWithFeatures:(id)a3
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a3, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "featureType");

  return (unint64_t)(v4 - 1) < 2;
}

@end
