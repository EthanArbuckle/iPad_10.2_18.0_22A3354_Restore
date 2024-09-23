@implementation _RECategoricalHistogram

- (_RECategoricalHistogram)initWithFeature:(id)a3 binningSize:(unint64_t)a4
{
  _RECategoricalHistogram *v4;
  RETaggedFeatureValueCountedSet *v5;
  RETaggedFeatureValueCountedSet *values;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_RECategoricalHistogram;
  v4 = -[REHistogram initWithFeature:binningSize:](&v8, sel_initWithFeature_binningSize_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(RETaggedFeatureValueCountedSet);
    values = v4->_values;
    v4->_values = v5;

  }
  return v4;
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_RECategoricalHistogram;
  v3 = -[REHistogram hash](&v5, sel_hash);
  return -[RETaggedFeatureValueCountedSet hash](self->_values, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  _RECategoricalHistogram *v4;
  RETaggedFeatureValueCountedSet *values;
  RETaggedFeatureValueCountedSet *v6;
  RETaggedFeatureValueCountedSet *v7;
  RETaggedFeatureValueCountedSet *v8;
  char v9;
  objc_super v11;

  v4 = (_RECategoricalHistogram *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v11.receiver = self,
          v11.super_class = (Class)_RECategoricalHistogram,
          -[REHistogram isEqual:](&v11, sel_isEqual_, v4)))
    {
      values = self->_values;
      v6 = v4->_values;
      v7 = values;
      v8 = v7;
      if (v7 == v6)
        v9 = 1;
      else
        v9 = -[RETaggedFeatureValueCountedSet isEqual:](v7, "isEqual:", v6);

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
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_RECategoricalHistogram;
  v4 = -[REHistogram copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = -[RETaggedFeatureValueCountedSet copy](self->_values, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  return v4;
}

- (unint64_t)count
{
  return -[RETaggedFeatureValueCountedSet count](self->_values, "count");
}

- (unint64_t)mean
{
  return RECreateDoubleFeatureValueTaggedPointer();
}

- (unint64_t)standardDeviation
{
  return RECreateDoubleFeatureValueTaggedPointer();
}

- (void)addValue:(unint64_t)a3
{
  -[RETaggedFeatureValueCountedSet addFeatureValue:](self->_values, "addFeatureValue:", a3);
}

- (void)removeValue:(unint64_t)a3
{
  -[RETaggedFeatureValueCountedSet removeFeatureValue:](self->_values, "removeFeatureValue:", a3);
}

- (unint64_t)countForValue:(unint64_t)a3
{
  return -[RETaggedFeatureValueCountedSet countForFeatureValue:](self->_values, "countForFeatureValue:", a3);
}

- (unint64_t)countOfValuesBetweenMinValue:(unint64_t)a3 maxValue:(unint64_t)a4
{
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  unint64_t v12;

  if (a3 == a4)
    return -[RETaggedFeatureValueCountedSet countForFeatureValue:](self->_values, "countForFeatureValue:", a3);
  v7 = REFeatureValueTypeForTaggedPointer(a3);
  if (v7 == REFeatureValueTypeForTaggedPointer(a4))
  {
    REFeatureValueForTaggedPointer((void *)a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    REFeatureValueForTaggedPointer((void *)a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if (v10)
      return -[RETaggedFeatureValueCountedSet countForFeatureValue:](self->_values, "countForFeatureValue:", a3);
  }
  v12 = -[RETaggedFeatureValueCountedSet countForFeatureValue:](self->_values, "countForFeatureValue:", a3);
  return -[RETaggedFeatureValueCountedSet countForFeatureValue:](self->_values, "countForFeatureValue:", a4) + v12;
}

- (void)enumerateValuesUsingBlock:(id)a3
{
  id v4;
  RETaggedFeatureValueCountedSet *values;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (v4)
  {
    values = self->_values;
    v7[1] = 3221225472;
    v7[2] = __53___RECategoricalHistogram_enumerateValuesUsingBlock___block_invoke;
    v7[3] = &unk_24CF8DB78;
    v7[4] = self;
    v6 = v4;
    v7[0] = MEMORY[0x24BDAC760];
    v8 = v4;
    -[RETaggedFeatureValueCountedSet enumerateFeatureValuesUsingBlock:](values, "enumerateFeatureValuesUsingBlock:", v7);

    v4 = v6;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
}

@end
