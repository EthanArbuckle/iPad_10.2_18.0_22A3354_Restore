@implementation _REFalseConstantComparisonCondition

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_12 != -1)
    dispatch_once(&sharedInstance_onceToken_12, &__block_literal_global_13_0);
  return (id)sharedInstance_Condition_11;
}

- (id)_notCondition
{
  return +[_RETrueConstantComparisonCondition sharedInstance](_RETrueConstantComparisonCondition, "sharedInstance");
}

- (BOOL)_validForRanking
{
  return 1;
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
