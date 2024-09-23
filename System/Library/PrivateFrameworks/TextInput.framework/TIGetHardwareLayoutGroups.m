@implementation TIGetHardwareLayoutGroups

void __TIGetHardwareLayoutGroups_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(&unk_1E24C0210, "objectForKey:", CFSTR("HWLayoutGroups.plist"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TIGetHardwareLayoutGroups___layoutGroups;
  TIGetHardwareLayoutGroups___layoutGroups = v0;

  if (!TIGetHardwareLayoutGroups___layoutGroups)
  {
    TIGetTextInputFrameworkPath();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    TILoadBundlePlist(CFSTR("HWLayoutGroups.plist"), v4);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)TIGetHardwareLayoutGroups___layoutGroups;
    TIGetHardwareLayoutGroups___layoutGroups = v2;

  }
}

@end
