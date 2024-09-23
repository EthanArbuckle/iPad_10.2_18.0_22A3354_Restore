@implementation NSData(ICADIUtilityAdditions)

+ (id)ic_dataWithADIBytes:()ICADIUtilityAdditions length:
{
  return (id)objc_msgSend([a1 alloc], "initWithBytesNoCopy:length:deallocator:", a3, a4, &__block_literal_global_35611);
}

@end
