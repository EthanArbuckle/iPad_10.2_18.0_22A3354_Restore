@implementation REComparisonCondition

+ (id)trueCondition
{
  return +[_RETrueConstantComparisonCondition sharedInstance](_RETrueConstantComparisonCondition, "sharedInstance");
}

+ (id)conditionForLeftFeature:(id)a3 relation:(int64_t)a4 rightFeature:(id)a5
{
  id v7;
  id v8;
  _REFeatureComparisonCondition *v9;

  v7 = a5;
  v8 = a3;
  REEnsureMatchingFeatureTypes(v8, v7);
  v9 = -[_REFeatureComparisonCondition initWithLeftFeature:relation:rightFeature:]([_REFeatureComparisonCondition alloc], "initWithLeftFeature:relation:rightFeature:", v8, a4, v7);

  return v9;
}

+ (id)falseCondition
{
  return +[_REFalseConstantComparisonCondition sharedInstance](_REFalseConstantComparisonCondition, "sharedInstance");
}

- (BOOL)_validForRanking
{
  return 1;
}

- (id)_inflectionFeatureValuePairs
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "set");
}

@end
