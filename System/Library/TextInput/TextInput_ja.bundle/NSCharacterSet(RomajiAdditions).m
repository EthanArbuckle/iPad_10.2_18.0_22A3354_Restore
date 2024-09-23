@implementation NSCharacterSet(RomajiAdditions)

+ (id)alphabetCharacterSet
{
  if (alphabetCharacterSet___onceToken != -1)
    dispatch_once(&alphabetCharacterSet___onceToken, &__block_literal_global);
  return (id)alphabetCharacterSet___alphabetCharacterSet;
}

@end
