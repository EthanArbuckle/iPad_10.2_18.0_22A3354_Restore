@implementation UIKeyboardComputeKeyboardIdiomFromScreenTraits

void __UIKeyboardComputeKeyboardIdiomFromScreenTraits_block_invoke()
{
  void *v0;
  void *v1;
  int v2;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_deviceInfoForKey:", CFSTR("main-screen-class"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "integerValue");

  _MergedGlobals_1108 = v2 == 28;
}

@end
