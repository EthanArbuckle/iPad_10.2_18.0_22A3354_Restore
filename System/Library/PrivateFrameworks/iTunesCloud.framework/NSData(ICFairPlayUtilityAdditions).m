@implementation NSData(ICFairPlayUtilityAdditions)

+ (id)ic_dataWithFairPlayBytes:()ICFairPlayUtilityAdditions length:
{
  return (id)objc_msgSend([a1 alloc], "initWithBytesNoCopy:length:deallocator:", a3, a4, &__block_literal_global_15856);
}

@end
