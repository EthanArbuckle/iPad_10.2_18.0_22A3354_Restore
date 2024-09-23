@implementation UINavigationBarBackButtonShowsContextMenu

void ___UINavigationBarBackButtonShowsContextMenu_block_invoke()
{
  void *v0;
  char v1;
  id v2;

  _UIKitUserDefaults();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("NavigationBarBackButtonShowsContextMenu"));
  v2 = (id)objc_claimAutoreleasedReturnValue();

  if (v2)
    v1 = objc_msgSend(v2, "BOOLValue");
  else
    v1 = dyld_program_sdk_at_least();
  byte_1ECD7A891 = v1;

}

@end
