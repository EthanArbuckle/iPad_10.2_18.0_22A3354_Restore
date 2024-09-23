@implementation SPCopyPrefsDisabledApps

void __SPCopyPrefsDisabledApps_block_invoke(uint64_t a1)
{
  CFPropertyListRef v2;
  uint64_t v3;
  void *v4;
  const void *v5;
  id v6;

  if (!CFPreferencesGetAppBooleanValue(CFSTR("11.2.Migrated"), SpotlightUIPrefsDomain, 0))
  {
    DMGetPreviousBuildVersion();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "hasPrefix:", CFSTR("15A")) & 1) != 0
      || objc_msgSend(v6, "hasPrefix:", CFSTR("15B")))
    {
      v2 = CFPreferencesCopyValue(CFSTR("SBSearchDisabledBundles"), SpotlightUIPrefsDomain, (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
      v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v4 = *(void **)(v3 + 40);
      *(_QWORD *)(v3 + 40) = v2;

      v5 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      if (v5)
        CFPreferencesSetAppValue(CFSTR("SBSearchDisabledApps"), v5, SpotlightUIPrefsDomain);
    }
    CFPreferencesSetAppValue(CFSTR("11.2.Migrated"), (CFPropertyListRef)*MEMORY[0x24BDBD270], SpotlightUIPrefsDomain);

  }
}

@end
