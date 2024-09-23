@implementation TIGetTextInputFrameworkPath

void __TIGetTextInputFrameworkPath_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundlePath");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TIGetTextInputFrameworkPath_textInputFrameworkPath;
  TIGetTextInputFrameworkPath_textInputFrameworkPath = v0;

}

@end
