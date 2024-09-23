@implementation UIKeyboardSettingsBundle

void __UIKeyboardSettingsBundle_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", CFSTR("/System/Library/PreferenceBundles/KeyboardSettings.bundle"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD7EA78;
  qword_1ECD7EA78 = v0;

}

@end
