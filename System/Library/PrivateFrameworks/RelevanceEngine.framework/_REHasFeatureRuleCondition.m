@implementation _REHasFeatureRuleCondition

- (unint64_t)hash
{
  return -[REFeature hash](self->_feature, "hash") ^ self->_contains;
}

- (id)_inflectionFeatureValuePairs
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "set");
}

- (id)_dependentFeatures
{
  return +[REFeatureSet featureSetWithFeature:](REFeatureSet, "featureSetWithFeature:", self->_feature);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feature, 0);
}

- (_REHasFeatureRuleCondition)initWithFeature:(id)a3 contains:(BOOL)a4
{
  id v7;
  _REHasFeatureRuleCondition *v8;
  _REHasFeatureRuleCondition *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_REHasFeatureRuleCondition;
  v8 = -[_REHasFeatureRuleCondition init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_feature, a3);
    v9->_contains = a4;
  }

  return v9;
}

- (id)_notCondition
{
  return -[_REHasFeatureRuleCondition initWithFeature:contains:]([_REHasFeatureRuleCondition alloc], "initWithFeature:contains:", self->_feature, !self->_contains);
}

- (BOOL)isEqual:(id)a3
{
  _REHasFeatureRuleCondition *v4;
  _REHasFeatureRuleCondition *v5;
  REFeature *feature;
  REFeature *v7;
  REFeature *v8;
  REFeature *v9;
  _BOOL4 v10;
  BOOL v11;

  v4 = (_REHasFeatureRuleCondition *)a3;
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
        {
          v11 = 0;
LABEL_10:

          goto LABEL_11;
        }
      }
      v11 = self->_contains == v5->_contains;
      goto LABEL_10;
    }
    v11 = 0;
  }
LABEL_11:

  return v11;
}

- (BOOL)_acceptsFeatureMap:(id)a3 predictionSet:(id)a4 explanation:(id *)a5
{
  int v7;
  int v8;
  int contains;

  v7 = objc_msgSend(a3, "hasValueForFeature:", self->_feature, a4);
  v8 = v7;
  contains = self->_contains;
  if (a5 && contains == v7)
  {
    +[REMLExplanation explanationForCondition:](REMLExplanation, "explanationForCondition:", self);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return contains == v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithFeature:contains:", self->_feature, self->_contains);
}

- (REFeature)feature
{
  return self->_feature;
}

- (BOOL)contains
{
  return self->_contains;
}

@end
