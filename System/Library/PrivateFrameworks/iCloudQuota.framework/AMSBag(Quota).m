@implementation AMSBag(Quota)

+ (id)quotaBag
{
  if (quotaBag_onceToken != -1)
    dispatch_once(&quotaBag_onceToken, &__block_literal_global_15);
  return (id)quotaBag_quotaBag;
}

@end
