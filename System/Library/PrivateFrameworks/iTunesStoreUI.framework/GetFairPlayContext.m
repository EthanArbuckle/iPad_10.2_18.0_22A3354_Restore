@implementation GetFairPlayContext

void ____GetFairPlayContext_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  const __CFString *v3;
  CFStringEncoding SystemEncoding;
  const __CFData *ExternalRepresentation;
  const __CFData *v6;
  const UInt8 *BytePtr;
  CFIndex Length;
  id v9;

  v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", CPSharedResourcesDirectory(), CFSTR("Media"), CFSTR("iTunes_Control"), CFSTR("iTunes"), 0);
  objc_msgSend(MEMORY[0x24BDD17C8], "pathWithComponents:");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)__GetFairPlayContext_sFolderPath;
  __GetFairPlayContext_sFolderPath = v0;

  v2 = MGCopyAnswer();
  if (v2)
  {
    v3 = (const __CFString *)v2;
    SystemEncoding = CFStringGetSystemEncoding();
    ExternalRepresentation = CFStringCreateExternalRepresentation(0, v3, SystemEncoding, 0);
    if (ExternalRepresentation)
    {
      v6 = ExternalRepresentation;
      BytePtr = CFDataGetBytePtr(ExternalRepresentation);
      Length = CFDataGetLength(v6);
      zxcm2Qme0x((uint64_t)BytePtr, Length, (uint64_t)&__GetFairPlayContext_sHardwareInfo);
      CFRelease(v6);
    }
    else
    {
      zxcm2Qme0x(0, 0, (uint64_t)&__GetFairPlayContext_sHardwareInfo);
    }
    CFRelease(v3);
  }

}

@end
