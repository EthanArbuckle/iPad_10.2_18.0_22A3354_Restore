@implementation SSLockdown

id __28__SSLockdown_sharedInstance__block_invoke()
{
  id result;

  result = objc_alloc_init((Class)objc_opt_class());
  sharedInstance_sSharedInstance = (uint64_t)result;
  return result;
}

- (__CFString)copyDeviceGUID
{
  void *v2;
  void *v3;
  CFTypeID v4;
  const void *v5;
  __CFString *v6;

  v2 = (void *)MGCopyAnswer();
  if (!v2)
    return 0;
  v3 = v2;
  v4 = CFGetTypeID(v2);
  if (v4 == CFStringGetTypeID())
  {
    if (SSDeviceIsAppleTV())
      v5 = (const void *)objc_msgSend(v3, "uppercaseString");
    else
      v5 = v3;
    v6 = (__CFString *)CFRetain(v5);
  }
  else
  {
    v6 = 0;
  }
  CFRelease(v3);
  return v6;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__SSLockdown_sharedInstance__block_invoke;
  block[3] = &unk_1E47B8B68;
  block[4] = a1;
  if (sharedInstance_sInstanceGuard != -1)
    dispatch_once(&sharedInstance_sInstanceGuard, block);
  return (id)sharedInstance_sSharedInstance;
}

@end
