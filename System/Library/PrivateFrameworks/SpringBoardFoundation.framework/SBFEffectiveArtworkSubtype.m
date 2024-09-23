@implementation SBFEffectiveArtworkSubtype

void __SBFEffectiveArtworkSubtype_block_invoke()
{
  const __CFDictionary *v0;
  const __CFDictionary *v1;
  id v2;

  v0 = (const __CFDictionary *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    CFDictionaryGetValue(v0, CFSTR("ArtworkDeviceSubType"));
    v2 = (id)objc_claimAutoreleasedReturnValue();
    if (v2)
      SBFEffectiveArtworkSubtype_deviceSubtype = (int)objc_msgSend(v2, "intValue");
    CFRelease(v1);

  }
}

@end
