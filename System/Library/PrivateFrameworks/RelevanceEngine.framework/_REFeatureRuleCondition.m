@implementation _REFeatureRuleCondition

- (_REFeatureRuleCondition)initWithFeature:(id)a3 relation:(int64_t)a4 feature:(id)a5
{
  id v9;
  id v10;
  _REFeatureRuleCondition *v11;
  _REFeatureRuleCondition *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_REFeatureRuleCondition;
  v11 = -[_REFeatureRuleCondition init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_firstFeature, a3);
    v12->_relation = a4;
    objc_storeStrong((id *)&v12->_secondFeature, a5);
  }

  return v12;
}

- (id)_dependentFeatures
{
  REFeature *secondFeature;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  secondFeature = self->_secondFeature;
  v6[0] = self->_firstFeature;
  v6[1] = secondFeature;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[REFeatureSet featureSetWithFeatures:](REFeatureSet, "featureSetWithFeatures:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_notCondition
{
  return -[_REFeatureRuleCondition initWithFeature:relation:feature:]([_REFeatureRuleCondition alloc], "initWithFeature:relation:feature:", self->_firstFeature, REInvertRelation(self->_relation), self->_secondFeature);
}

- (BOOL)_requiresTwoFeatures
{
  return 1;
}

- (BOOL)_acceptsFeatureMap:(id)a3 predictionSet:(id)a4 explanation:(id *)a5
{
  id v7;
  unint64_t v8;
  void *v9;
  int64_t relation;
  uint64_t v11;
  BOOL v12;
  BOOL v14;

  v7 = a3;
  if (objc_msgSend(v7, "hasValueForFeature:", self->_firstFeature)
    && objc_msgSend(v7, "hasValueForFeature:", self->_secondFeature))
  {
    v8 = objc_msgSend(v7, "valueForFeature:", self->_firstFeature);
    v9 = (void *)objc_msgSend(v7, "valueForFeature:", self->_secondFeature);
    relation = self->_relation;
    v11 = RECompareFeatureValues(v8, v9);
    switch(relation)
    {
      case -2:
        v12 = v11 == -1;
        goto LABEL_11;
      case -1:
        v14 = v11 == 1;
        goto LABEL_17;
      case 0:
        v12 = v11 == 0;
        goto LABEL_11;
      case 1:
        v14 = v11 == -1;
        goto LABEL_17;
      case 2:
        v12 = v11 == 1;
LABEL_11:
        LODWORD(v8) = v12;
        if (!a5)
          break;
        goto LABEL_21;
      case 4:
        v14 = v11 == 0;
LABEL_17:
        LODWORD(v8) = !v14;
        if (a5)
        {
LABEL_21:
          if ((_DWORD)v8)
          {
            +[REMLExplanation explanationForCondition:](REMLExplanation, "explanationForCondition:", self);
            *a5 = (id)objc_claimAutoreleasedReturnValue();
            LOBYTE(v8) = 1;
          }
        }
        break;
      default:
        break;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8 & 1;
}

- (id)_inflectionFeatureValuePairs
{
  REFeatureValuePair *v3;
  REFeatureValuePair *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v3 = -[REFeatureValuePair initWithFeature:value:]([REFeatureValuePair alloc], "initWithFeature:value:", self->_firstFeature, 0);
  v8[0] = v3;
  v4 = -[REFeatureValuePair initWithFeature:value:]([REFeatureValuePair alloc], "initWithFeature:value:", self->_secondFeature, 0);
  v8[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = self->_relation ^ -[REFeature hash](self->_firstFeature, "hash");
  return v3 ^ -[REFeature hash](self->_secondFeature, "hash");
}

- (BOOL)isEqual:(id)a3
{
  _REFeatureRuleCondition *v4;
  _REFeatureRuleCondition *v5;
  REFeature *firstFeature;
  REFeature *v7;
  REFeature *v8;
  REFeature *v9;
  _BOOL4 v10;
  BOOL v11;
  REFeature *secondFeature;
  REFeature *v13;
  REFeature *v14;
  REFeature *v15;
  _BOOL4 v16;

  v4 = (_REFeatureRuleCondition *)a3;
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
      firstFeature = self->_firstFeature;
      v7 = v5->_firstFeature;
      if (firstFeature == v7)
      {

      }
      else
      {
        v8 = v7;
        v9 = firstFeature;
        v10 = -[REFeature isEqual:](v9, "isEqual:", v8);

        if (!v10)
          goto LABEL_11;
      }
      secondFeature = self->_secondFeature;
      v13 = v5->_secondFeature;
      if (secondFeature == v13)
      {

      }
      else
      {
        v14 = v13;
        v15 = secondFeature;
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
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithFeature:relation:feature:", self->_firstFeature, self->_relation, self->_secondFeature);
}

- (REFeature)firstFeature
{
  return self->_firstFeature;
}

- (int64_t)relation
{
  return self->_relation;
}

- (REFeature)secondFeature
{
  return self->_secondFeature;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondFeature, 0);
  objc_storeStrong((id *)&self->_firstFeature, 0);
}

@end
