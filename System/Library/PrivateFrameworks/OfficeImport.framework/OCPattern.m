@implementation OCPattern

+ (id)blackAndWhiteImageDataWithPatternName:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (v3)
  {
    +[TCBundleResourceManager instance](TCBundleResourceManager, "instance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dataForResource:ofType:inPackage:cacheResult:", v3, CFSTR("bmp"), CFSTR("OAPatterns"), 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)colorizedImageDataWithBlackAndWhiteImageData:(id)a3 foregroundColor:(id)a4 backgroundColor:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  int v14;
  int v15;
  _BYTE *v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_retainAutorelease(v7);
  v11 = objc_msgSend(v10, "bytes");
  if ((unint64_t)objc_msgSend(v10, "length") >= 0x3F
    && *(_BYTE *)v11 == 66
    && *(_BYTE *)(v11 + 1) == 77
    && *(_DWORD *)(v11 + 14) == 40
    && *(_WORD *)(v11 + 26) == 1
    && *(_WORD *)(v11 + 28) == 1
    && !*(_DWORD *)(v11 + 30))
  {
    v14 = objc_msgSend(v8, "ttColor");
    v15 = objc_msgSend(v9, "ttColor");
    v12 = objc_retainAutorelease((id)objc_msgSend(v10, "mutableCopy"));
    v16 = (_BYTE *)objc_msgSend(v12, "mutableBytes");
    v16[54] = BYTE2(v14);
    v16[55] = BYTE1(v14);
    v16[56] = v14;
    v16[57] = 0;
    v16[58] = BYTE2(v15);
    v16[59] = BYTE1(v15);
    v16[60] = v15;
    v16[61] = 0;
  }
  else
  {
    v12 = v10;
  }

  return v12;
}

+ (id)presetPatternHeader
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = (void *)+[OCPattern presetPatternHeader]::thePresetPatternHeader;
  if (!+[OCPattern presetPatternHeader]::thePresetPatternHeader)
  {
    +[TCBundleResourceManager instance](TCBundleResourceManager, "instance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dataForResource:ofType:inPackage:cacheResult:", CFSTR("patternHeader"), CFSTR("bmp"), CFSTR("OAPatterns"), 1);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)+[OCPattern presetPatternHeader]::thePresetPatternHeader;
    +[OCPattern presetPatternHeader]::thePresetPatternHeader = v4;

    v2 = (void *)+[OCPattern presetPatternHeader]::thePresetPatternHeader;
  }
  return v2;
}

@end
