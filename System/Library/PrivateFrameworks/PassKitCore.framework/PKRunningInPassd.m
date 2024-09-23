@implementation PKRunningInPassd

void __PKRunningInPassd_block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleIdentifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  byte_1ECF21C87 = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.passd"));

}

@end
