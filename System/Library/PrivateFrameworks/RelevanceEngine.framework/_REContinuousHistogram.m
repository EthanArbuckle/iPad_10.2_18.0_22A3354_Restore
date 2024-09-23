@implementation _REContinuousHistogram

- (_REContinuousHistogram)initWithFeature:(id)a3 binningSize:(unint64_t)a4
{
  _REContinuousHistogram *v5;
  _REContinuousHistogram *v6;
  RESortedDictionary *v7;
  RESortedDictionary *values;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_REContinuousHistogram;
  v5 = -[REHistogram initWithFeature:binningSize:](&v10, sel_initWithFeature_binningSize_, a3);
  v6 = v5;
  if (v5)
  {
    v5->_binningValue = a4;
    RERetainFeatureValueTaggedPointer((CFTypeRef)a4);
    v7 = objc_alloc_init(RESortedDictionary);
    values = v6->_values;
    v6->_values = v7;

  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  REReleaseFeatureValueTaggedPointer((CFTypeRef)self->_binningValue);
  v3.receiver = self;
  v3.super_class = (Class)_REContinuousHistogram;
  -[_REContinuousHistogram dealloc](&v3, sel_dealloc);
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_REContinuousHistogram;
  v3 = -[REHistogram hash](&v5, sel_hash);
  return -[RESortedDictionary hash](self->_values, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  _REContinuousHistogram *v4;
  RESortedDictionary *values;
  RESortedDictionary *v6;
  RESortedDictionary *v7;
  RESortedDictionary *v8;
  char v9;
  objc_super v11;

  v4 = (_REContinuousHistogram *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v11.receiver = self,
          v11.super_class = (Class)_REContinuousHistogram,
          -[REHistogram isEqual:](&v11, sel_isEqual_, v4)))
    {
      values = self->_values;
      v6 = v4->_values;
      v7 = values;
      v8 = v7;
      if (v7 == v6)
        v9 = 1;
      else
        v9 = -[RESortedDictionary isEqual:](v7, "isEqual:", v6);

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
  const void *binningValue;
  RESortedDictionary *v6;
  void *v7;
  RESortedDictionary *values;
  _QWORD *v9;
  _QWORD v11[4];
  id v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_REContinuousHistogram;
  v4 = -[REHistogram copyWithZone:](&v13, sel_copyWithZone_, a3);
  binningValue = (const void *)self->_binningValue;
  v4[2] = binningValue;
  RERetainFeatureValueTaggedPointer(binningValue);
  v6 = objc_alloc_init(RESortedDictionary);
  v7 = (void *)v4[3];
  v4[3] = v6;

  values = self->_values;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __39___REContinuousHistogram_copyWithZone___block_invoke;
  v11[3] = &unk_24CF8BF58;
  v9 = v4;
  v12 = v9;
  -[RESortedDictionary enumerateObjectsUsingBlock:](values, "enumerateObjectsUsingBlock:", v11);

  return v9;
}

- (unint64_t)count
{
  return -[RESortedDictionary count](self->_values, "count");
}

- (unint64_t)mean
{
  unint64_t v2;
  _QWORD v4[6];
  _QWORD v5[4];
  _QWORD v6[4];

  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  v6[3] = 0;
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  v5[3] = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __30___REContinuousHistogram_mean__block_invoke;
  v4[3] = &unk_24CF8BF80;
  v4[4] = v6;
  v4[5] = v5;
  -[_REContinuousHistogram enumerateValuesUsingBlock:](self, "enumerateValuesUsingBlock:", v4);
  v2 = RECreateDoubleFeatureValueTaggedPointer();
  _Block_object_dispose(v5, 8);
  _Block_object_dispose(v6, 8);
  return v2;
}

- (unint64_t)standardDeviation
{
  void *v3;
  const char *v4;
  double v5;
  unint64_t v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double *v14;
  uint64_t v15;
  uint64_t v16;

  if (!-[_REContinuousHistogram count](self, "count"))
    return RECreateDoubleFeatureValueTaggedPointer();
  v3 = -[_REContinuousHistogram mean](self, "mean");
  v5 = REDoubleValueForTaggedPointer(v3, v4);
  REReleaseFeatureValueTaggedPointer(v3);
  v13 = 0;
  v14 = (double *)&v13;
  v15 = 0x2020000000;
  v16 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __43___REContinuousHistogram_standardDeviation__block_invoke;
  v8[3] = &unk_24CF8BFA8;
  *(double *)&v8[6] = v5;
  v8[4] = &v13;
  v8[5] = &v9;
  -[_REContinuousHistogram enumerateValuesUsingBlock:](self, "enumerateValuesUsingBlock:", v8);
  v14[3] = v14[3] / (double)(unint64_t)v10[3];
  v6 = RECreateDoubleFeatureValueTaggedPointer();
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  return v6;
}

- (void)addValue:(unint64_t)a3
{
  RETaggedFeatureValueCountedSet *v5;
  _REHistogramRange *v6;

  v6 = -[_REHistogramRange initWithValue:binningSize:]([_REHistogramRange alloc], "initWithValue:binningSize:", a3, self->_binningValue);
  -[RESortedDictionary objectForKey:](self->_values, "objectForKey:");
  v5 = (RETaggedFeatureValueCountedSet *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = objc_alloc_init(RETaggedFeatureValueCountedSet);
    -[RESortedDictionary setObject:forKey:](self->_values, "setObject:forKey:", v5, v6);
  }
  -[RETaggedFeatureValueCountedSet addFeatureValue:](v5, "addFeatureValue:", a3);

}

- (void)removeValue:(unint64_t)a3
{
  void *v5;
  _REHistogramRange *v6;

  v6 = -[_REHistogramRange initWithValue:binningSize:]([_REHistogramRange alloc], "initWithValue:binningSize:", a3, self->_binningValue);
  -[RESortedDictionary objectForKey:](self->_values, "objectForKey:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFeatureValue:", a3);
  if (!objc_msgSend(v5, "count"))
    -[RESortedDictionary removeObjectForKey:](self->_values, "removeObjectForKey:", v6);

}

- (unint64_t)countForValue:(unint64_t)a3
{
  _REHistogramRange *v5;
  void *v6;
  unint64_t v7;

  v5 = -[_REHistogramRange initWithValue:binningSize:]([_REHistogramRange alloc], "initWithValue:binningSize:", a3, self->_binningValue);
  -[RESortedDictionary objectForKey:](self->_values, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countForFeatureValue:", a3);

  return v7;
}

- (unint64_t)countOfValuesBetweenMinValue:(unint64_t)a3 maxValue:(unint64_t)a4
{
  unint64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __64___REContinuousHistogram_countOfValuesBetweenMinValue_maxValue___block_invoke;
  v6[3] = &unk_24CF8BFD0;
  v6[4] = &v7;
  -[_REContinuousHistogram _enumerateValuesBetweenMinValue:maxValue:block:](self, "_enumerateValuesBetweenMinValue:maxValue:block:", a3, a4, v6);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)_enumerateValuesBetweenMinValue:(unint64_t)a3 maxValue:(unint64_t)a4 block:(id)a5
{
  id v8;
  void (**v9)(_QWORD, _QWORD);
  _REHistogramRange *v10;
  _REHistogramRange *v11;
  _REHistogramRange *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  void *v22;
  _REContinuousHistogram *v23;
  id v24;
  unint64_t v25;
  unint64_t v26;

  v8 = a5;
  if (v8)
  {
    if (RECompareFeatureValues(a3, (void *)a4) == 1)
    {
      -[_REContinuousHistogram _enumerateValuesBetweenMinValue:maxValue:block:](self, "_enumerateValuesBetweenMinValue:maxValue:block:", a4, a3, v8);
    }
    else
    {
      v19 = MEMORY[0x24BDAC760];
      v20 = 3221225472;
      v21 = __73___REContinuousHistogram__enumerateValuesBetweenMinValue_maxValue_block___block_invoke;
      v22 = &unk_24CF8C020;
      v23 = self;
      v25 = a3;
      v26 = a4;
      v24 = v8;
      v9 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199B2434](&v19);
      RERetainFeatureValueTaggedPointer((CFTypeRef)a3);
      v10 = [_REHistogramRange alloc];
      v11 = -[_REHistogramRange initWithValue:binningSize:](v10, "initWithValue:binningSize:", a4, self->_binningValue, v19, v20, v21, v22, v23);
      while (1)
      {
        v12 = -[_REHistogramRange initWithValue:binningSize:]([_REHistogramRange alloc], "initWithValue:binningSize:", a3, self->_binningValue);
        ((void (**)(_QWORD, _REHistogramRange *))v9)[2](v9, v12);
        if (RECompareFeatureValues(-[_REHistogramRange min](v11, "min"), (void *)a3) != 1
          && RECompareFeatureValues(a3, (void *)-[_REHistogramRange max](v11, "max")) != 1)
        {
          break;
        }
        REReleaseFeatureValueTaggedPointer((CFTypeRef)a3);
        v13 = -[_REHistogramRange mid](v12, "mid");
        if (REFeatureValueTypeForTaggedPointer(self->_binningValue) == 1)
        {
          v15 = REIntegerValueForTaggedPointer((unint64_t)v13);
          v16 = REIntegerValueForTaggedPointer(self->_binningValue);
          v17 = RECreateIntegerFeatureValueTaggedPointer(v16 + v15);
        }
        else
        {
          REDoubleValueForTaggedPointer(v13, v14);
          REDoubleValueForTaggedPointer((void *)self->_binningValue, v18);
          v17 = RECreateDoubleFeatureValueTaggedPointer();
        }
        a3 = v17;

      }
      REReleaseFeatureValueTaggedPointer((CFTypeRef)a3);

    }
  }

}

- (void)enumerateValuesUsingBlock:(id)a3
{
  id v4;
  RESortedDictionary *values;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  if (v4)
  {
    values = self->_values;
    v7[1] = 3221225472;
    v7[2] = __52___REContinuousHistogram_enumerateValuesUsingBlock___block_invoke;
    v7[3] = &unk_24CF8C070;
    v6 = v4;
    v7[0] = MEMORY[0x24BDAC760];
    v8 = v4;
    -[RESortedDictionary enumerateObjectsUsingBlock:](values, "enumerateObjectsUsingBlock:", v7);

    v4 = v6;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
}

@end
