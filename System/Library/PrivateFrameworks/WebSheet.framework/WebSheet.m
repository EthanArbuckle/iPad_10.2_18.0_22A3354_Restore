id GetLocalizedString(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  GetBundle();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = 0;
  if (a1 && v2)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", v5, 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

id GetBundle()
{
  if (GetBundle_onceToken != -1)
    dispatch_once(&GetBundle_onceToken, &__block_literal_global_579);
  return (id)GetBundle_bundle;
}

double RoundFloatToPixels(double a1)
{
  double v2;
  void *v3;
  uint64_t v4;

  v2 = *(double *)&_ScreenScale_scale;
  if (*(double *)&_ScreenScale_scale == 0.0)
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen", *(double *)&_ScreenScale_scale);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scale");
    _ScreenScale_scale = v4;

    v2 = *(double *)&_ScreenScale_scale;
  }
  return round(v2 * a1) / v2;
}

__CFString *escapedStringFromURL(void *a1)
{
  __CFString *v1;
  __CFString *v2;

  objc_msgSend(a1, "absoluteString");
  v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v2 = (__CFString *)CFURLCreateStringByAddingPercentEscapes(0, v1, &stru_24FD35608, CFSTR("/:?&="), 0x8000100u);

  return v2;
}

uint64_t BYSetupAssistantNeedsToRun()
{
  return MEMORY[0x24BE85860]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFStringRef CFURLCreateStringByAddingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveUnescaped, CFStringRef legalURLCharactersToBeEscaped, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC838](allocator, originalString, charactersToLeaveUnescaped, legalURLCharactersToBeEscaped, *(_QWORD *)&encoding);
}

SInt32 CFUserNotificationDisplayAlert(CFTimeInterval timeout, CFOptionFlags flags, CFURLRef iconURL, CFURLRef soundURL, CFURLRef localizationURL, CFStringRef alertHeader, CFStringRef alertMessage, CFStringRef defaultButtonTitle, CFStringRef alternateButtonTitle, CFStringRef otherButtonTitle, CFOptionFlags *responseFlags)
{
  return MEMORY[0x24BDBC930](flags, iconURL, soundURL, localizationURL, alertHeader, alertMessage, defaultButtonTitle, alternateButtonTitle, timeout);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t CPGetDeviceRegionCode()
{
  return MEMORY[0x24BE04690]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

uint64_t SecTrustCopyInfo()
{
  return MEMORY[0x24BDE8DB0]();
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x24BDE8DF0](trust, error);
}

OSStatus SecTrustGetTrustResult(SecTrustRef trust, SecTrustResultType *result)
{
  return MEMORY[0x24BDE8E08](trust, result);
}

uint64_t WebThreadCallDelegate()
{
  return MEMORY[0x24BEC27B0]();
}

uint64_t WebThreadIsCurrent()
{
  return MEMORY[0x24BEC27B8]();
}

uint64_t WebThreadLock()
{
  return MEMORY[0x24BEC27C0]();
}

uint64_t WebThreadMakeNSInvocation()
{
  return MEMORY[0x24BEC27C8]();
}

uint64_t _CFURLResponseGetSSLCertificateContext()
{
  return MEMORY[0x24BDB75C0]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

