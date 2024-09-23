@implementation PKIsPad

void __PKIsPad_block_invoke()
{
  id v0;

  PKDeviceClass();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  byte_1ECF21C7B = objc_msgSend(v0, "isEqualToString:", CFSTR("iPad"));

}

@end
