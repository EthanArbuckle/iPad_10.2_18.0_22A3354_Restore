@implementation PKBridgeAppearanceGetSetupAppearanceSpecifier

void __PKBridgeAppearanceGetSetupAppearanceSpecifier_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  PKBridgeAppearanceGetAppearanceSpecifier();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)qword_1ED06C620;
  qword_1ED06C620 = v1;

  v3 = (void *)qword_1ED06C620;
  if (qword_1ED06C620)
  {
    BPSSetupBackgroundColor();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBackgroundColor:", v4);

  }
}

@end
