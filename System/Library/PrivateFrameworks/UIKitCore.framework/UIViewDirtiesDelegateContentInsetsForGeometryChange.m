@implementation UIViewDirtiesDelegateContentInsetsForGeometryChange

void ___UIViewDirtiesDelegateContentInsetsForGeometryChange_block_invoke()
{
  int v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;

  v0 = dyld_program_sdk_at_least();
  byte_1EDDCA614 = v0;
  if (v0)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "objectForKey:", CFSTR("UIViewUseStaleDelegateContentInsets"));
    v4 = (id)objc_claimAutoreleasedReturnValue();

    v2 = v4;
    if (v4
      || (_UIKitPreferencesOnce(),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "objectForKey:", CFSTR("UIViewUseStaleDelegateContentInsets")),
          v5 = (id)objc_claimAutoreleasedReturnValue(),
          v3,
          (v2 = v5) != 0))
    {
      v6 = v2;
      byte_1EDDCA614 = objc_msgSend(v2, "BOOLValue") ^ 1;

    }
  }
}

@end
