@implementation NSUserDefaults(RTUserDefaults)

- (uint64_t)rt_synchronize
{
  return CFPreferencesAppSynchronize((CFStringRef)*MEMORY[0x1E0C9B248]);
}

- (void)rt_refreshDomain:()RTUserDefaults
{
  const void *v3;
  const __CFString *v4;
  const __CFString *v5;
  __CFString *applicationID;

  v3 = (const void *)*MEMORY[0x1E0C9AE50];
  v4 = (const __CFString *)*MEMORY[0x1E0C9B240];
  v5 = (const __CFString *)*MEMORY[0x1E0C9B230];
  applicationID = a3;
  CFPreferencesSetValue(CFSTR("RTDefaultsManagerForceRefresh"), v3, applicationID, v4, v5);
  CFPreferencesSetValue(CFSTR("RTDefaultsManagerForceRefresh"), 0, applicationID, v4, v5);

}

- (CFPropertyListRef)rt_objectForKey:()RTUserDefaults domain:
{
  return (id)CFPreferencesCopyAppValue(key, applicationID);
}

- (void)rt_setObject:()RTUserDefaults forKey:domain:
{
  CFPreferencesSetAppValue(key, value, applicationID);
}

- (CFArrayRef)rt_copyKeyListForDomain:()RTUserDefaults
{
  return CFPreferencesCopyKeyList(applicationID, (CFStringRef)*MEMORY[0x1E0C9B240], (CFStringRef)*MEMORY[0x1E0C9B230]);
}

- (uint64_t)rt_synchronizeDomain:()RTUserDefaults
{
  return CFPreferencesAppSynchronize(applicationID);
}

@end
