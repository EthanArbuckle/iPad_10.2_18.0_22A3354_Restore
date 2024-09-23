@implementation TelephonyUtilQueryBuildInformation

void __TelephonyUtilQueryBuildInformation_block_invoke()
{
  CFArrayRef v0;
  CFArrayRef v1;
  void *v2;
  uint64_t (*v3)(CFArrayRef, _QWORD);
  const __CFDictionary *v4;
  const __CFDictionary *v5;
  const __CFString *Value;
  const __CFString *v7;
  CFTypeID v8;
  CFTypeID v9;
  CFTypeID v10;
  CFTypeID v11;
  CFTypeID v12;
  CFTypeID v13;
  char *v14;
  const void *v15[2];

  v15[1] = *(const void **)MEMORY[0x24BDAC8D0];
  v15[0] = CFSTR("ReleaseType");
  v0 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v15, 1, MEMORY[0x24BDBD690]);
  if (v0)
  {
    v1 = v0;
    v2 = dlopen("/usr/lib/libMobileGestalt.dylib", 1);
    if (!v2)
      goto LABEL_25;
    v3 = (uint64_t (*)(CFArrayRef, _QWORD))dlsym(v2, "MGCopyMultipleAnswers");
    if (!v3)
      goto LABEL_25;
    v4 = (const __CFDictionary *)v3(v1, 0);
    if (!v4)
      goto LABEL_25;
    v5 = v4;
    Value = (const __CFString *)CFDictionaryGetValue(v4, CFSTR("ReleaseType"));
    if (!Value)
    {
LABEL_24:
      CFRelease(v5);
LABEL_25:
      CFRelease(v1);
      return;
    }
    v7 = Value;
    v8 = CFGetTypeID(Value);
    if (v8 == CFStringGetTypeID() && CFStringCompare(v7, CFSTR("Vendor"), 0) == kCFCompareEqualTo)
    {
      v14 = &byte_253D0AF03;
    }
    else
    {
      v9 = CFGetTypeID(v7);
      if (v9 == CFStringGetTypeID() && CFStringCompare(v7, CFSTR("Carrier"), 0) == kCFCompareEqualTo)
      {
        v14 = &byte_253D0AF01;
      }
      else
      {
        v10 = CFGetTypeID(v7);
        if (v10 != CFStringGetTypeID() || CFStringCompare(v7, CFSTR("Internal"), 0))
        {
          v11 = CFGetTypeID(v7);
          if (v11 == CFStringGetTypeID() && CFStringCompare(v7, CFSTR("Desense"), 0) == kCFCompareEqualTo)
          {
            v14 = &byte_253D0AF02;
            goto LABEL_23;
          }
          v12 = CFGetTypeID(v7);
          if (v12 != CFStringGetTypeID() || CFStringCompare(v7, CFSTR("NonUI"), 0))
          {
            v13 = CFGetTypeID(v7);
            if (v13 != CFStringGetTypeID() || CFStringCompare(v7, CFSTR("Restore"), 0))
              goto LABEL_24;
            v14 = &byte_253D0AF04;
            goto LABEL_23;
          }
        }
        v14 = &_MergedGlobals_1;
      }
    }
LABEL_23:
    *v14 = 1;
    goto LABEL_24;
  }
}

@end
