@implementation PKIsPod

void __PKIsPod_block_invoke()
{
  id v0;

  PKDeviceClass();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  byte_1ECF21C7A = objc_msgSend(v0, "isEqualToString:", CFSTR("iPod"));

}

@end
