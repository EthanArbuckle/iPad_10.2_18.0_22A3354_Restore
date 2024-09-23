@implementation _RETrueConstantComparisonCondition

- (BOOL)_validForRanking
{
  return 1;
}

- (id)_inflectionFeatureValuePairs
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "set");
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_4 != -1)
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_35);
  return (id)sharedInstance_Condition_0;
}

- (id)_notCondition
{
  return +[_REFalseConstantComparisonCondition sharedInstance](_REFalseConstantComparisonCondition, "sharedInstance");
}

- (BOOL)_acceptsLeftFeatureMap:(id)a3 rightFeatureMap:(id)a4
{
  return 1;
}

@end
