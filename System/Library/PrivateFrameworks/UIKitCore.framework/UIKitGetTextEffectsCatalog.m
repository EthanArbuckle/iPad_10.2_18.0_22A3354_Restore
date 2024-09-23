@implementation UIKitGetTextEffectsCatalog

void ___UIKitGetTextEffectsCatalog_block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v0 = objc_alloc(MEMORY[0x1E0D1A6A8]);
  v1 = (void *)MEMORY[0x1E0CB34D0];
  _UIKitResourceBundlePath(CFSTR("TextEffectsCatalog.bundle"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleWithPath:", v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v0, "initWithName:fromBundle:error:", CFSTR("TextEffects"), v2, 0);
  v4 = (void *)qword_1ECD82A80;
  qword_1ECD82A80 = v3;

}

@end
