@implementation IsLargeIPad

void __IsLargeIPad_block_invoke()
{
  const __CFDictionary *v0;
  const __CFDictionary *v1;
  int v2;
  BOOL v4;
  id v5;

  v0 = (const __CFDictionary *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    CFDictionaryGetValue(v0, CFSTR("ArtworkDeviceSubType"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v2 = objc_msgSend(v5, "intValue");
      v4 = v2 == 2732 || v2 == 2752;
      IsLargeIPad_isLarge = v4;
    }
    CFRelease(v1);

  }
}

@end
