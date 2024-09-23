@implementation HKSPLocalizedString

void __HKSPLocalizedString_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.Sleep"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED05F1C8;
  qword_1ED05F1C8 = v0;

}

@end
