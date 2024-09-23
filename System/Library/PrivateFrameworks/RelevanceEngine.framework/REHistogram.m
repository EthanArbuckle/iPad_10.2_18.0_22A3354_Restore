@implementation REHistogram

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feature, 0);
}

- (REHistogram)initWithFeature:(id)a3 binningSize:(unint64_t)a4
{
  id v7;
  __objc2_class *v8;
  REHistogram *v9;
  REHistogram *v10;
  REHistogram *v11;
  REHistogram *v12;
  objc_super v14;

  v7 = a3;
  if (-[REHistogram isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
  {
    if (objc_msgSend(v7, "featureType") == 2)
      v8 = _REContinuousHistogram;
    else
      v8 = _RECategoricalHistogram;
    v11 = (REHistogram *)objc_msgSend([v8 alloc], "initWithFeature:binningSize:", v7, a4);
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)REHistogram;
    v9 = -[REHistogram init](&v14, sel_init);
    v10 = v9;
    if (v9)
      objc_storeStrong((id *)&v9->_feature, a3);
    v11 = v10;
    self = v11;
  }
  v12 = v11;

  return v12;
}

- (REHistogram)initWithFeature:(id)a3
{
  id v4;
  uint64_t v5;
  const void *v6;
  REHistogram *v7;
  REHistogram *v8;

  v4 = a3;
  if (objc_msgSend(v4, "featureType") == 2)
    v5 = RECreateDoubleFeatureValueTaggedPointer();
  else
    v5 = RECreateIntegerFeatureValueTaggedPointer(1);
  v6 = (const void *)v5;
  v7 = -[REHistogram initWithFeature:binningSize:](self, "initWithFeature:binningSize:", v4, v5);

  v8 = v7;
  REReleaseFeatureValueTaggedPointer(v6);

  return v8;
}

- (unint64_t)hash
{
  return -[REFeature hash](self->_feature, "hash");
}

- (BOOL)isEqual:(id)a3
{
  REHistogram *v4;
  REFeature *feature;
  REFeature *v6;
  REFeature *v7;
  REFeature *v8;
  char v9;

  v4 = (REHistogram *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      feature = self->_feature;
      v6 = v4->_feature;
      v7 = feature;
      v8 = v7;
      if (v7 == v6)
        v9 = 1;
      else
        v9 = -[REFeature isEqual:](v7, "isEqual:", v6);

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
  id *v4;

  v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong(v4 + 1, self->_feature);
  return v4;
}

- (unint64_t)count
{
  return 0;
}

- (unint64_t)mean
{
  return RECreateDoubleFeatureValueTaggedPointer();
}

- (unint64_t)standardDeviation
{
  return RECreateDoubleFeatureValueTaggedPointer();
}

- (unint64_t)countForValue:(unint64_t)a3
{
  return 0;
}

- (unint64_t)countOfValuesBetweenMinValue:(unint64_t)a3 maxValue:(unint64_t)a4
{
  return 0;
}

- (REFeature)feature
{
  return self->_feature;
}

@end
