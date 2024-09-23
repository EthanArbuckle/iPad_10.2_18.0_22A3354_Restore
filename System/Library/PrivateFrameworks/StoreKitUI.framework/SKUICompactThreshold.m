@implementation SKUICompactThreshold

void __SKUICompactThreshold_block_invoke()
{
  const __CFDictionary *v0;
  const __CFDictionary *v1;
  void *v2;
  void *v3;
  int v4;
  __int128 v5;
  int v6;
  __int128 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8 = -337121064;
  v7 = xmmword_1BBED2A28;
  v6 = 450980336;
  v5 = xmmword_1BBED2A3C;
  if ((MGIsDeviceOneOfType() & 1) != 0)
    goto LABEL_2;
  v0 = (const __CFDictionary *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    CFDictionaryGetValue(v0, CFSTR("ArtworkDeviceSubType"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = v2;
      v4 = objc_msgSend(v2, "intValue", &v5, 0);
      CFRelease(v1);

      if (v4 == 2436)
LABEL_2:
        SKUICompactThreshold_threshold = 0x4089600000000000;
    }
    else
    {
      CFRelease(v1);
    }
  }
}

@end
