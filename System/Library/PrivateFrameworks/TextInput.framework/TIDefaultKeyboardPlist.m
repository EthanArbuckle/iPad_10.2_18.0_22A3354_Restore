@implementation TIDefaultKeyboardPlist

void __TIDefaultKeyboardPlist_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  id v4;

  TIGetTextInputFrameworkPath();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  TILoadKeyboardPlist(CFSTR("default"), v4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TIDefaultKeyboardPlist_defaultPlist;
  TIDefaultKeyboardPlist_defaultPlist = v0;

  if (!TIDefaultKeyboardPlist_defaultPlist)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99D80]);
    v3 = (void *)TIDefaultKeyboardPlist_defaultPlist;
    TIDefaultKeyboardPlist_defaultPlist = (uint64_t)v2;

  }
}

@end
