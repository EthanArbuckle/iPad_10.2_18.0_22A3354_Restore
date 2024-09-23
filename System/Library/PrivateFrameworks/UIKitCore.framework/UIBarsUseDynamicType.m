@implementation UIBarsUseDynamicType

void ___UIBarsUseDynamicType_block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  if (dyld_program_sdk_at_least())
    _MergedGlobals_5_2 = 1;
  _UIKitUserDefaults();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("BarUseDynamicType"));
  v2 = (id)objc_claimAutoreleasedReturnValue();

  v1 = v2;
  if (v2)
  {
    _MergedGlobals_5_2 = objc_msgSend(v2, "BOOLValue");
    v1 = v2;
  }

}

@end
