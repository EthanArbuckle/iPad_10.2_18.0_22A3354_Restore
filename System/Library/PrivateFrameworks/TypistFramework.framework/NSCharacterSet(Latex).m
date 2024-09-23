@implementation NSCharacterSet(Latex)

+ (id)charactersRequiringExtentionCharacterSet
{
  if (charactersRequiringExtentionCharacterSet_onceToken != -1)
    dispatch_once(&charactersRequiringExtentionCharacterSet_onceToken, &__block_literal_global_9);
  return (id)charactersRequiringExtentionCharacterSet_charSet;
}

@end
