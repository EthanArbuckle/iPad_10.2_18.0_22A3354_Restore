@implementation NSPersonNameComponents(SMExtensions)

+ (id)sharedNameComponents
{
  if (qword_1ED942940 != -1)
    dispatch_once(&qword_1ED942940, &__block_literal_global_13);
  return (id)_MergedGlobals_94;
}

@end
