@implementation NSNumberFormatter(SBFCacheInstances)

+ (id)sbf_cachedDecimalNumberFormatter
{
  if (sbf_cachedDecimalNumberFormatter_onceToken != -1)
    dispatch_once(&sbf_cachedDecimalNumberFormatter_onceToken, &__block_literal_global_172);
  return (id)sbf_cachedDecimalNumberFormatter__cachedDecimalNumberFormatter;
}

@end
