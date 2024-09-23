@implementation _REProbabilityRuleCondition

- (_REProbabilityRuleCondition)initWithProbability:(id)a3 relation:(int64_t)a4 feature:(id)a5 threshold:(float)a6
{
  id v11;
  id v12;
  _REProbabilityRuleCondition *v13;
  _REProbabilityRuleCondition *v14;
  objc_super v16;

  v11 = a3;
  v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)_REProbabilityRuleCondition;
  v13 = -[_REProbabilityRuleCondition init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_interaction, a3);
    v14->_relation = a4;
    objc_storeStrong((id *)&v14->_feature, a5);
    v14->_threshold = a6;
  }

  return v14;
}

- (id)_dependentFeatures
{
  if (self->_feature)
    +[REFeatureSet featureSetWithFeature:](REFeatureSet, "featureSetWithFeature:");
  else
    +[REFeatureSet featureSet](REFeatureSet, "featureSet");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_needsProbability
{
  return 1;
}

- (id)_notCondition
{
  _REProbabilityRuleCondition *v3;
  NSString *interaction;
  uint64_t v5;
  double v6;

  v3 = [_REProbabilityRuleCondition alloc];
  interaction = self->_interaction;
  v5 = REInvertRelation(self->_relation);
  *(float *)&v6 = self->_threshold;
  return -[_REProbabilityRuleCondition initWithProbability:relation:feature:threshold:](v3, "initWithProbability:relation:feature:threshold:", interaction, v5, self->_feature, v6);
}

- (BOOL)_acceptsFeatureMap:(id)a3 predictionSet:(id)a4 explanation:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  const void *v13;
  int64_t relation;
  uint64_t v15;
  BOOL v16;
  BOOL v17;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (self->_interaction)
    objc_msgSend(v9, "predictionForKey:");
  else
    objc_msgSend(v9, "prediction");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "probability");

  if (self->_feature)
  {
    if (!objc_msgSend(v8, "hasValueForFeature:"))
    {
      LOBYTE(relation) = 0;
      goto LABEL_25;
    }
    v12 = (void *)objc_msgSend(v8, "valueForFeature:", self->_feature);
    RERetainFeatureValueTaggedPointer(v12);
  }
  else
  {
    v12 = (void *)RECreateDoubleFeatureValueTaggedPointer();
  }
  v13 = (const void *)RECreateDoubleFeatureValueTaggedPointer();
  relation = self->_relation;
  v15 = RECompareFeatureValues((unint64_t)v13, v12);
  switch(relation)
  {
    case -2:
      v16 = v15 == -1;
      goto LABEL_15;
    case -1:
      v17 = v15 == 1;
      goto LABEL_19;
    case 0:
      v16 = v15 == 0;
      goto LABEL_15;
    case 1:
      v17 = v15 == -1;
      goto LABEL_19;
    case 2:
      v16 = v15 == 1;
LABEL_15:
      LOBYTE(relation) = v16;
      break;
    case 4:
      v17 = v15 == 0;
LABEL_19:
      LOBYTE(relation) = !v17;
      break;
    default:
      break;
  }
  REReleaseFeatureValueTaggedPointer(v12);
  REReleaseFeatureValueTaggedPointer(v13);
  if (a5 && (relation & 1) != 0)
  {
    +[REMLExplanation explanationForCondition:](REMLExplanation, "explanationForCondition:", self);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    LOBYTE(relation) = 1;
  }
LABEL_25:

  return relation & 1;
}

- (id)_inflectionFeatureValuePairs
{
  void *v2;
  REFeatureValuePair *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF20];
  if (self->_feature)
  {
    v3 = -[REFeatureValuePair initWithFeature:value:]([REFeatureValuePair alloc], "initWithFeature:value:", self->_feature, 0);
    objc_msgSend(v2, "setWithObject:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  double v5;
  void *v6;
  unint64_t v7;

  v3 = self->_relation ^ -[NSString hash](self->_interaction, "hash");
  v4 = v3 ^ -[REFeature hash](self->_feature, "hash");
  *(float *)&v5 = self->_threshold;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4 ^ objc_msgSend(v6, "hash");

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  _REProbabilityRuleCondition *v4;
  _REProbabilityRuleCondition *v5;
  NSString *interaction;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  int v10;
  BOOL v11;
  REFeature *feature;
  REFeature *v13;
  REFeature *v14;
  REFeature *v15;
  _BOOL4 v16;

  v4 = (_REProbabilityRuleCondition *)a3;
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
      interaction = self->_interaction;
      v7 = v5->_interaction;
      if (interaction == v7)
      {

      }
      else
      {
        v8 = v7;
        v9 = interaction;
        v10 = -[NSString isEqual:](v9, "isEqual:", v8);

        if (!v10)
          goto LABEL_15;
      }
      feature = self->_feature;
      v13 = v5->_feature;
      if (feature == v13)
      {

      }
      else
      {
        v14 = v13;
        v15 = feature;
        v16 = -[REFeature isEqual:](v15, "isEqual:", v14);

        if (!v16)
          goto LABEL_15;
      }
      if (self->_relation == v5->_relation)
      {
        v11 = RERelevanceEqualToRelevance(self->_threshold, v5->_threshold);
LABEL_16:

        goto LABEL_17;
      }
LABEL_15:
      v11 = 0;
      goto LABEL_16;
    }
    v11 = 0;
  }
LABEL_17:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  double v5;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  *(float *)&v5 = self->_threshold;
  return (id)objc_msgSend(v4, "initWithProbability:relation:feature:threshold:", self->_interaction, self->_relation, self->_feature, v5);
}

- (NSString)interaction
{
  return self->_interaction;
}

- (REFeature)feature
{
  return self->_feature;
}

- (int64_t)relation
{
  return self->_relation;
}

- (float)threshold
{
  return self->_threshold;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feature, 0);
  objc_storeStrong((id *)&self->_interaction, 0);
}

@end
