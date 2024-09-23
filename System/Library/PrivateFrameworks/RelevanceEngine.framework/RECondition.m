@implementation RECondition

- (BOOL)_validForRanking
{
  return 0;
}

- (id)_dependentFeatures
{
  return +[REFeatureSet featureSet](REFeatureSet, "featureSet");
}

+ (id)conditionForFeature:(id)a3 hasValue:(id)a4
{
  id v5;
  id v6;
  void *v7;
  const void *v8;
  _REValueRuleCondition *v9;

  v5 = a4;
  v6 = a3;
  REEnsureFeatureWithType(v6, 1uLL);
  +[REFeatureValue featureValueWithString:](REFeatureValue, "featureValueWithString:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (const void *)RECreateFeatureValueTaggedPointer(v7);
  v9 = -[_REValueRuleCondition initWithFeature:relation:value:]([_REValueRuleCondition alloc], "initWithFeature:relation:value:", v6, 0, v8);

  RERetainFeatureValueTaggedPointer(v8);
  return v9;
}

+ (id)andConditions:(id)a3
{
  id v3;
  _REAggregateRuleCondition *v4;
  id v5;
  _REAggregateRuleCondition *v6;

  v3 = a3;
  v4 = [_REAggregateRuleCondition alloc];
  if (v3)
    v5 = v3;
  else
    v5 = (id)MEMORY[0x24BDBD1A8];
  v6 = -[_REAggregateRuleCondition initWithConditions:type:](v4, "initWithConditions:type:", v5, 0);

  return v6;
}

+ (id)conditionHasValueForFeature:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _REHasFeatureRuleCondition *v10;
  uint64_t v12;

  v9 = a3;
  if (!v9)
    RERaiseInternalException((void *)*MEMORY[0x24BDBCAB8], CFSTR("Feature must be non-nil"), v3, v4, v5, v6, v7, v8, v12);
  v10 = -[_REHasFeatureRuleCondition initWithFeature:contains:]([_REHasFeatureRuleCondition alloc], "initWithFeature:contains:", v9, 1);

  return v10;
}

+ (id)conditionForFeature:(id)a3 relation:(int64_t)a4 floatValue:(float)a5
{
  id v6;
  const void *v7;
  _REValueRuleCondition *v8;

  v6 = a3;
  REEnsureFeatureWithType(v6, 2uLL);
  v7 = (const void *)RECreateDoubleFeatureValueTaggedPointer();
  v8 = -[_REValueRuleCondition initWithFeature:relation:value:]([_REValueRuleCondition alloc], "initWithFeature:relation:value:", v6, a4, v7);

  REReleaseFeatureValueTaggedPointer(v7);
  return v8;
}

+ (id)conditionForFeature:(id)a3 hasIntegerValue:(int64_t)a4
{
  id v5;
  const void *v6;
  _REValueRuleCondition *v7;

  v5 = a3;
  REEnsureFeatureWithType(v5, 1uLL);
  v6 = (const void *)RECreateIntegerFeatureValueTaggedPointer(a4);
  v7 = -[_REValueRuleCondition initWithFeature:relation:value:]([_REValueRuleCondition alloc], "initWithFeature:relation:value:", v5, 0, v6);

  REReleaseFeatureValueTaggedPointer(v6);
  return v7;
}

+ (id)notCondition:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v12;

  v9 = a3;
  if (!v9)
    RERaiseInternalException((void *)*MEMORY[0x24BDBCAB8], CFSTR("Condition must be non-nil"), v3, v4, v5, v6, v7, v8, v12);
  objc_msgSend(v9, "_notCondition");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)orConditions:(id)a3
{
  id v3;
  _REAggregateRuleCondition *v4;
  id v5;
  _REAggregateRuleCondition *v6;

  v3 = a3;
  v4 = [_REAggregateRuleCondition alloc];
  if (v3)
    v5 = v3;
  else
    v5 = (id)MEMORY[0x24BDBD1A8];
  v6 = -[_REAggregateRuleCondition initWithConditions:type:](v4, "initWithConditions:type:", v5, 1);

  return v6;
}

+ (id)conditionForFeature:(id)a3 hasBoolValue:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  const void *v6;
  _REValueRuleCondition *v7;

  v4 = a4;
  v5 = a3;
  REEnsureFeatureWithType(v5, 0);
  v6 = (const void *)RECreateBooleanFeatureValueTaggedPointer(v4);
  v7 = -[_REValueRuleCondition initWithFeature:relation:value:]([_REValueRuleCondition alloc], "initWithFeature:relation:value:", v5, 0, v6);

  REReleaseFeatureValueTaggedPointer(v6);
  return v7;
}

+ (id)trueCondition
{
  return +[_RETrueConstantCondition sharedInstance](_RETrueConstantCondition, "sharedInstance");
}

+ (id)falseCondition
{
  return +[_REFalseConstantCondition sharedInstance](_REFalseConstantCondition, "sharedInstance");
}

+ (id)conditionForFeature:(id)a3 relation:(int64_t)a4 integerValue:(int64_t)a5
{
  id v7;
  const void *v8;
  _REValueRuleCondition *v9;

  v7 = a3;
  REEnsureFeatureWithType(v7, 2uLL);
  v8 = (const void *)RECreateIntegerFeatureValueTaggedPointer(a5);
  v9 = -[_REValueRuleCondition initWithFeature:relation:value:]([_REValueRuleCondition alloc], "initWithFeature:relation:value:", v7, a4, v8);

  REReleaseFeatureValueTaggedPointer(v8);
  return v9;
}

+ (id)conditionForFeature:(id)a3 relation:(int64_t)a4 feature:(id)a5
{
  id v7;
  id v8;
  _REFeatureRuleCondition *v9;

  v7 = a5;
  v8 = a3;
  REEnsureMatchingFeatureTypes(v8, v7);
  v9 = -[_REFeatureRuleCondition initWithFeature:relation:feature:]([_REFeatureRuleCondition alloc], "initWithFeature:relation:feature:", v8, a4, v7);

  return v9;
}

+ (id)conditionForProbabilityWithRelation:(int64_t)a3 floatValue:(float)a4
{
  return (id)objc_msgSend(a1, "conditionForProbabilityForInteraction:relation:floatValue:", 0, a3);
}

+ (id)conditionForProbabilityForInteraction:(id)a3 relation:(int64_t)a4 floatValue:(float)a5
{
  id v7;
  _REProbabilityRuleCondition *v8;
  double v9;
  _REProbabilityRuleCondition *v10;

  v7 = a3;
  v8 = [_REProbabilityRuleCondition alloc];
  *(float *)&v9 = a5;
  v10 = -[_REProbabilityRuleCondition initWithProbability:relation:feature:threshold:](v8, "initWithProbability:relation:feature:threshold:", v7, a4, 0, v9);

  return v10;
}

+ (id)conditionForProbabilityForInteraction:(id)a3 relation:(int64_t)a4 feature:(id)a5
{
  id v7;
  id v8;
  _REProbabilityRuleCondition *v9;
  double v10;
  _REProbabilityRuleCondition *v11;

  v7 = a5;
  v8 = a3;
  REEnsureFeatureWithType(v7, 2uLL);
  v9 = [_REProbabilityRuleCondition alloc];
  LODWORD(v10) = 0;
  v11 = -[_REProbabilityRuleCondition initWithProbability:relation:feature:threshold:](v9, "initWithProbability:relation:feature:threshold:", v8, a4, v7, v10);

  return v11;
}

- (BOOL)_requiresTwoFeatures
{
  return 0;
}

- (BOOL)_needsProbability
{
  return 0;
}

- (BOOL)_acceptsFeatureMap:(id)a3 predictionSet:(id)a4 explanation:(id *)a5
{
  return 0;
}

- (BOOL)_acceptsLeftFeatureMap:(id)a3 rightFeatureMap:(id)a4
{
  return 0;
}

- (id)_inflectionFeatureValuePairs
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "set");
}

@end
