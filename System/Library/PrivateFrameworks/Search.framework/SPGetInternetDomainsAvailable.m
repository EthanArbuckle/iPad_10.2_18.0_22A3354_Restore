@implementation SPGetInternetDomainsAvailable

uint64_t __SPGetInternetDomainsAvailable_block_invoke(uint64_t a1)
{
  uint64_t result;
  CFPropertyListRef *v3;
  const __CFString *v4;
  const __CFString *v5;

  result = CFPreferencesGetAppBooleanValue(CFSTR("SBSearchInternetDomainsAvailable"), CFSTR("com.apple.springboard"), (Boolean *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      v3 = (CFPropertyListRef *)MEMORY[0x24BDBD270];
    else
      v3 = (CFPropertyListRef *)MEMORY[0x24BDBD268];
    CFPreferencesSetAppValue(CFSTR("SBSearchInternetDomainsAvailable"), *v3, SpotlightUIPrefsDomain);
    CFPreferencesSetAppValue(CFSTR("SBSearchInternetDomainsAvailable"), 0, CFSTR("com.apple.springboard"));
    v4 = (const __CFString *)*MEMORY[0x24BDBD590];
    v5 = (const __CFString *)*MEMORY[0x24BDBD570];
    CFPreferencesSynchronize(SpotlightUIPrefsDomain, (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
    return CFPreferencesSynchronize(CFSTR("com.apple.springboard"), v4, v5);
  }
  return result;
}

@end
