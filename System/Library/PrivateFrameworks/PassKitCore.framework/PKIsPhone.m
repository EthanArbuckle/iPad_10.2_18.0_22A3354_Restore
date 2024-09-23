@implementation PKIsPhone

void __PKIsPhone_block_invoke()
{
  id v0;

  PKDeviceClass();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  byte_1ECF21C79 = objc_msgSend(v0, "isEqualToString:", CFSTR("iPhone"));

}

@end
