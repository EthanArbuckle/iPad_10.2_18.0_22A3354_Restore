@implementation _REFeatureComparisonCondition

- (unint64_t)hash
{
  unint64_t v3;

  v3 = self->_relation ^ -[REFeature hash](self->_leftFeature, "hash");
  return v3 ^ -[REFeature hash](self->_rightFeature, "hash");
}

- (id)_inflectionFeatureValuePairs
{
  REFeatureValuePair *v3;
  REFeatureValuePair *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v3 = -[REFeatureValuePair initWithFeature:value:]([REFeatureValuePair alloc], "initWithFeature:value:", self->_leftFeature, 0);
  v8[0] = v3;
  v4 = -[REFeatureValuePair initWithFeature:value:]([REFeatureValuePair alloc], "initWithFeature:value:", self->_rightFeature, 0);
  v8[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_dependentFeatures
{
  REFeature *rightFeature;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  rightFeature = self->_rightFeature;
  v6[0] = self->_leftFeature;
  v6[1] = rightFeature;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeatureSet featureSetWithFeatures:](REFeatureSet, "featureSetWithFeatures:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_validForRanking
{
  return 1;
}

- (_REFeatureComparisonCondition)initWithLeftFeature:(id)a3 relation:(int64_t)a4 rightFeature:(id)a5
{
  id v9;
  id v10;
  _REFeatureComparisonCondition *v11;
  _REFeatureComparisonCondition *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_REFeatureComparisonCondition;
  v11 = -[_REFeatureComparisonCondition init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_leftFeature, a3);
    v12->_relation = a4;
    objc_storeStrong((id *)&v12->_rightFeature, a5);
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightFeature, 0);
  objc_storeStrong((id *)&self->_leftFeature, 0);
}

- (id)_notCondition
{
  return -[_REFeatureComparisonCondition initWithLeftFeature:relation:rightFeature:]([_REFeatureComparisonCondition alloc], "initWithLeftFeature:relation:rightFeature:", self->_leftFeature, REInvertRelation(self->_relation), self->_rightFeature);
}

- (BOOL)_requiresTwoFeatures
{
  return 1;
}

- (BOOL)_acceptsLeftFeatureMap:(id)a3 rightFeatureMap:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  int64_t relation;
  uint64_t v11;
  BOOL v12;
  BOOL v14;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "hasValueForFeature:", self->_leftFeature)
    && objc_msgSend(v7, "hasValueForFeature:", self->_rightFeature))
  {
    v8 = objc_msgSend(v6, "valueForFeature:", self->_leftFeature);
    v9 = (void *)objc_msgSend(v7, "valueForFeature:", self->_rightFeature);
    relation = self->_relation;
    v11 = RECompareFeatureValues(v8, v9);
    switch(relation)
    {
      case -2:
        v12 = v11 == -1;
        goto LABEL_11;
      case -1:
        v14 = v11 == 1;
        goto LABEL_15;
      case 0:
        v12 = v11 == 0;
        goto LABEL_11;
      case 1:
        v14 = v11 == -1;
        goto LABEL_15;
      case 2:
        v12 = v11 == 1;
LABEL_11:
        LOBYTE(relation) = v12;
        break;
      case 4:
        v14 = v11 == 0;
LABEL_15:
        LOBYTE(relation) = !v14;
        break;
      default:
        break;
    }
  }
  else
  {
    LOBYTE(relation) = 0;
  }

  return relation & 1;
}

- (BOOL)isEqual:(id)a3
{
  _REFeatureComparisonCondition *v4;
  _REFeatureComparisonCondition *v5;
  REFeature *leftFeature;
  REFeature *v7;
  REFeature *v8;
  REFeature *v9;
  _BOOL4 v10;
  BOOL v11;
  REFeature *rightFeature;
  REFeature *v13;
  REFeature *v14;
  REFeature *v15;
  _BOOL4 v16;

  v4 = (_REFeatureComparisonCondition *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      leftFeature = self->_leftFeature;
      v7 = v5->_leftFeature;
      if (leftFeature == v7)
      {

      }
      else
      {
        v8 = v7;
        v9 = leftFeature;
        v10 = -[REFeature isEqual:](v9, "isEqual:", v8);

        if (!v10)
          goto LABEL_11;
      }
      rightFeature = self->_rightFeature;
      v13 = v5->_rightFeature;
      if (rightFeature == v13)
      {

      }
      else
      {
        v14 = v13;
        v15 = rightFeature;
        v16 = -[REFeature isEqual:](v15, "isEqual:", v14);

        if (!v16)
        {
LABEL_11:
          v11 = 0;
LABEL_14:

          goto LABEL_15;
        }
      }
      v11 = self->_relation == v5->_relation;
      goto LABEL_14;
    }
    v11 = 0;
  }
LABEL_15:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithLeftFeature:relation:rightFeature:", self->_leftFeature, self->_relation, self->_rightFeature);
}

- (REFeature)leftFeature
{
  return self->_leftFeature;
}

- (int64_t)relation
{
  return self->_relation;
}

- (REFeature)rightFeature
{
  return self->_rightFeature;
}

@end
