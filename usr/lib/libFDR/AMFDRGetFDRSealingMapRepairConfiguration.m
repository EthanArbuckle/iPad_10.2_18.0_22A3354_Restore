@implementation AMFDRGetFDRSealingMapRepairConfiguration

void ___AMFDRGetFDRSealingMapRepairConfiguration_block_invoke()
{
  CFURLRef v0;
  CFURLRef v1;
  CFTypeID v2;

  if (!fileSystemSealingMapRepairConfiguration)
  {
    v0 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x24BDBD240], CFSTR("/System/Library/FDR/FDRSealingMapRepairConfiguration.plist"), kCFURLPOSIXPathStyle, 0);
    if (v0)
    {
      v1 = v0;
      v2 = CFGetTypeID(v0);
      if (v2 == CFURLGetTypeID())
        AMSupportCreateDictionaryFromFileURL();
      AMSupportLogInternal();
      CFRelease(v1);
    }
    else
    {
      AMSupportLogInternal();
    }
    fileSystemSealingMapRepairConfiguration = 0;
  }
}

@end
