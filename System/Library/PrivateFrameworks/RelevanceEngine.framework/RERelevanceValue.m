@implementation RERelevanceValue

- (RERelevanceValue)initWithValues:(id)a3 isHistoric:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  RERelevanceValue *v8;
  RERelevanceValue *v9;
  RERelevanceValue *v10;
  _QWORD v12[4];
  RERelevanceValue *v13;
  objc_super v14;

  v4 = a4;
  v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)RERelevanceValue;
  v8 = -[RERelevanceValue init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_values, a3);
    v9->_historic = v4;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __46__RERelevanceValue_initWithValues_isHistoric___block_invoke;
    v12[3] = &unk_24CF8D470;
    v10 = v9;
    v13 = v10;
    objc_msgSend(v7, "enumerateFeatureValuesUsingBlock:", v12);
    v10->_hash ^= v4;

  }
  return v9;
}

uint64_t __46__RERelevanceValue_initWithValues_isHistoric___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = REFeatureValueHashForTaggedPointer(a2);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) ^= result;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[RERelevanceValue values](self, "values");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithValues:isHistoric:", v5, -[RERelevanceValue isHistoric](self, "isHistoric"));

  return v6;
}

- (unint64_t)hash
{
  return self->_hash;
}

- (BOOL)isEqual:(id)a3
{
  RERelevanceValue *v4;
  RERelevanceValue *v5;
  id v6;
  id v7;
  int v8;
  _BOOL4 v9;
  _BOOL4 v10;

  v4 = (RERelevanceValue *)a3;
  if (v4 == self)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[RERelevanceValue values](self, "values");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[RERelevanceValue values](v5, "values");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {

      }
      else
      {
        v8 = objc_msgSend(v6, "isEqual:", v7);

        if (!v8)
        {
          LOBYTE(v9) = 0;
LABEL_10:

          goto LABEL_11;
        }
      }
      v10 = -[RERelevanceValue isHistoric](self, "isHistoric");
      v9 = v10 ^ -[RERelevanceValue isHistoric](v5, "isHistoric") ^ 1;
      goto LABEL_10;
    }
    LOBYTE(v9) = 0;
  }
LABEL_11:

  return v9;
}

- (RETaggedFeatureValueArray)values
{
  return self->_values;
}

- (BOOL)isHistoric
{
  return self->_historic;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
}

@end
