@implementation _RETrueConstantCondition

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_18);
  return (id)sharedInstance_Condition;
}

- (id)_notCondition
{
  return +[_REFalseConstantCondition sharedInstance](_REFalseConstantCondition, "sharedInstance");
}

- (BOOL)_acceptsFeatureMap:(id)a3 predictionSet:(id)a4 explanation:(id *)a5
{
  if (a5)
  {
    +[REMLExplanation explanationForCondition:](REMLExplanation, "explanationForCondition:", self, a4);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 1;
}

- (id)_inflectionFeatureValuePairs
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "set");
}

@end
