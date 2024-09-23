@implementation UIMainBundleIdentifier

void ___UIMainBundleIdentifier_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD81F28;
  qword_1ECD81F28 = v0;

}

@end
