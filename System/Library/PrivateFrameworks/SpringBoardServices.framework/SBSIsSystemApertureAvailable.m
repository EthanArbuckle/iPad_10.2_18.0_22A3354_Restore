@implementation SBSIsSystemApertureAvailable

void __SBSIsSystemApertureAvailable_block_invoke()
{
  const __CFDictionary *v0;
  const __CFDictionary *v1;
  void *v2;
  void *v3;
  char v4;

  v0 = (const __CFDictionary *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    CFDictionaryGetValue(v0, CFSTR("ArtworkDeviceSubType"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v2)
      _block_invoke_deviceSubtype = (int)objc_msgSend(v2, "intValue");
    CFRelease(v1);

  }
  v4 = 1;
  if (_block_invoke_deviceSubtype > 2795)
  {
    if (_block_invoke_deviceSubtype != 2796 && _block_invoke_deviceSubtype != 2868)
      goto LABEL_11;
  }
  else if (_block_invoke_deviceSubtype != 2556 && _block_invoke_deviceSubtype != 2622)
  {
LABEL_11:
    v4 = 0;
  }
  SBSIsSystemApertureAvailable___isSystemApertureAvailable = v4;
}

@end
