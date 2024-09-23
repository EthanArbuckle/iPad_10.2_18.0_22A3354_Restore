@implementation NSMutableString(OSAStackshotKCDataExtension)

- (void)appendPortLabelInfo:()OSAStackshotKCDataExtension portlabels:
{
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("<port label truncated>");
  if ((_DWORD)a3 && v10)
  {
    if ((_DWORD)a3 != -1)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
        v7 = v8;

    }
    objc_msgSend(a1, "appendFormat:", CFSTR(" (%@)"), v7);
  }

}

@end
