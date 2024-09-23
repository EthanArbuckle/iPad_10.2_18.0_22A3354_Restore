@implementation _REValueRuleCondition

- (unint64_t)hash
{
  unint64_t v3;

  v3 = self->_relation ^ -[REFeature hash](self->_feature, "hash");
  return v3 ^ REFeatureValueHashForTaggedPointer((void *)self->_value);
}

- (id)_inflectionFeatureValuePairs
{
  void *v2;
  REFeatureValuePair *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF20];
  v3 = -[REFeatureValuePair initWithFeature:value:]([REFeatureValuePair alloc], "initWithFeature:value:", self->_feature, self->_value);
  objc_msgSend(v2, "setWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (_REValueRuleCondition)initWithFeature:(id)a3 relation:(int64_t)a4 value:(unint64_t)a5
{
  id v9;
  _REValueRuleCondition *v10;
  _REValueRuleCondition *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_REValueRuleCondition;
  v10 = -[_REValueRuleCondition init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_feature, a3);
    v11->_relation = a4;
    v11->_value = a5;
    RERetainFeatureValueTaggedPointer((CFTypeRef)a5);
    v11->_allowsEmptyValueForFeature = 0;
  }

  return v11;
}

- (id)_dependentFeatures
{
  return +[REFeatureSet featureSetWithFeature:](REFeatureSet, "featureSetWithFeature:", self->_feature);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feature, 0);
}

- (void)dealloc
{
  objc_super v3;

  REReleaseFeatureValueTaggedPointer((CFTypeRef)self->_value);
  v3.receiver = self;
  v3.super_class = (Class)_REValueRuleCondition;
  -[_REValueRuleCondition dealloc](&v3, sel_dealloc);
}

- (id)_notCondition
{
  _REValueRuleCondition *v3;

  v3 = -[_REValueRuleCondition initWithFeature:relation:value:]([_REValueRuleCondition alloc], "initWithFeature:relation:value:", self->_feature, REInvertRelation(self->_relation), self->_value);
  v3->_allowsEmptyValueForFeature = !self->_allowsEmptyValueForFeature;
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _REValueRuleCondition *v4;
  _REValueRuleCondition *v5;
  REFeature *feature;
  REFeature *v7;
  REFeature *v8;
  REFeature *v9;
  _BOOL4 v10;
  BOOL v11;
  void *value;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;

  v4 = (_REValueRuleCondition *)a3;
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
      feature = self->_feature;
      v7 = v5->_feature;
      if (feature == v7)
      {

      }
      else
      {
        v8 = v7;
        v9 = feature;
        v10 = -[REFeature isEqual:](v9, "isEqual:", v8);

        if (!v10)
          goto LABEL_13;
      }
      value = (void *)self->_value;
      v13 = (void *)v5->_value;
      if (value == v13)
        goto LABEL_10;
      v14 = REFeatureValueTypeForTaggedPointer(self->_value);
      if (v14 == REFeatureValueTypeForTaggedPointer((unint64_t)v13))
      {
        REFeatureValueForTaggedPointer(value);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        REFeatureValueForTaggedPointer(v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "isEqual:", v16);

        if (v17)
        {
LABEL_10:
          v11 = self->_relation == v5->_relation;
LABEL_14:

          goto LABEL_15;
        }
      }
LABEL_13:
      v11 = 0;
      goto LABEL_14;
    }
    v11 = 0;
  }
LABEL_15:

  return v11;
}

- (BOOL)_acceptsFeatureMap:(id)a3 predictionSet:(id)a4 explanation:(id *)a5
{
  id v7;
  unint64_t v8;
  int64_t relation;
  uint64_t v10;
  BOOL v11;
  BOOL v12;

  v7 = a3;
  if ((objc_msgSend(v7, "hasValueForFeature:", self->_feature) & 1) != 0)
  {
    v8 = objc_msgSend(v7, "valueForFeature:", self->_feature);
    relation = self->_relation;
    v10 = RECompareFeatureValues(v8, (void *)self->_value);
    switch(relation)
    {
      case -2:
        v11 = v10 == -1;
        goto LABEL_14;
      case -1:
        v12 = v10 == 1;
        goto LABEL_5;
      case 0:
        v11 = v10 == 0;
        goto LABEL_14;
      case 1:
        v12 = v10 == -1;
        goto LABEL_5;
      case 2:
        v11 = v10 == 1;
LABEL_14:
        LODWORD(relation) = v11;
        if (a5)
          goto LABEL_18;
        goto LABEL_20;
      case 4:
        v12 = v10 == 0;
        goto LABEL_5;
      default:
        goto LABEL_20;
    }
  }
  v12 = !self->_allowsEmptyValueForFeature;
LABEL_5:
  LODWORD(relation) = !v12;
  if (a5)
  {
LABEL_18:
    if ((_DWORD)relation)
    {
      +[REMLExplanation explanationForCondition:](REMLExplanation, "explanationForCondition:", self);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      LOBYTE(relation) = 1;
    }
  }
LABEL_20:

  return relation & 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithFeature:relation:value:", self->_feature, self->_relation, self->_value);
}

- (REFeature)feature
{
  return self->_feature;
}

- (int64_t)relation
{
  return self->_relation;
}

- (unint64_t)value
{
  return self->_value;
}

@end
