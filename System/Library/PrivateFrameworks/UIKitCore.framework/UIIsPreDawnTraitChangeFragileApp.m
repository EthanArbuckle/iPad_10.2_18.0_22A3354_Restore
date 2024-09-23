@implementation UIIsPreDawnTraitChangeFragileApp

void ___UIIsPreDawnTraitChangeFragileApp_block_invoke()
{
  id v0;

  if (dyld_program_sdk_at_least())
  {
    byte_1ECD79BCA = 0;
  }
  else
  {
    _UIMainBundleIdentifier();
    v0 = (id)objc_claimAutoreleasedReturnValue();
    byte_1ECD79BCA = objc_msgSend(&unk_1E1A94D48, "containsObject:", v0);

  }
}

@end
