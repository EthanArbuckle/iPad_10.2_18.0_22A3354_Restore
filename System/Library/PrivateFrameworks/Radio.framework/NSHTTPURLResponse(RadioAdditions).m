@implementation NSHTTPURLResponse(RadioAdditions)

- (id)radio_decompressedDataWithBodyData:()RadioAdditions
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(a1, "itunes_allHeaderFields");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ISDictionaryValueForCaseInsensitiveString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v4;
  if (v6)
  {
    v7 = v4;
    if (!objc_msgSend(v6, "caseInsensitiveCompare:", CFSTR("gzip")))
    {
      MSVGzipDecompressData();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v7 = v4;
      if (v8)
      {
        v7 = v8;

      }
    }
  }

  return v7;
}

@end
