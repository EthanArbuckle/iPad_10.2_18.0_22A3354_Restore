@implementation VUIMobileGestaltLookup

+ (id)stringValueForKey:(__CFString *)a3
{
  const void *v3;
  const void *v4;
  CFTypeID v5;
  void *v6;

  if (a3 && (v3 = (const void *)MGCopyAnswer()) != 0)
  {
    v4 = v3;
    v5 = CFGetTypeID(v3);
    if (v5 == CFStringGetTypeID())
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    CFRelease(v4);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (BOOL)BOOLValueForKey:(__CFString *)a3
{
  const __CFBoolean *v3;
  const __CFBoolean *v4;
  CFTypeID v5;
  BOOL v6;

  if (!a3)
    return 0;
  v3 = (const __CFBoolean *)MGCopyAnswer();
  if (!v3)
    return 0;
  v4 = v3;
  v5 = CFGetTypeID(v3);
  v6 = v5 == CFBooleanGetTypeID() && CFBooleanGetValue(v4) != 0;
  CFRelease(v4);
  return v6;
}

@end
