@implementation _REFalseConstantCondition

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_11 != -1)
    dispatch_once(&sharedInstance_onceToken_11, &__block_literal_global_12);
  return (id)sharedInstance_Condition_10;
}

- (id)_notCondition
{
  return +[_RETrueConstantCondition sharedInstance](_RETrueConstantCondition, "sharedInstance");
}

- (BOOL)_acceptsFeatureMap:(id)a3 predictionSet:(id)a4 explanation:(id *)a5
{
  return 0;
}

- (id)_inflectionFeatureValuePairs
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "set");
}

@end
