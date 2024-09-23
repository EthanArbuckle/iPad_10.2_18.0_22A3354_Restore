@implementation UIImage(SystemNumberAware)

+ (BOOL)needsLocaleAwareNumbersWorkaroundForSymbol:()SystemNumberAware
{
  void *v3;
  _BOOL8 v4;

  MapImageNameNumberAware(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

+ (uint64_t)systemImageNamedNumberAware:()SystemNumberAware
{
  return objc_msgSend(a1, "systemImageNamedNumberAware:config:", a3, 0);
}

+ (id)systemImageNamedNumberAware:()SystemNumberAware config:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v5 = a3;
  v6 = a4;
  MapImageNameNumberAware(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_5;
  objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
  {
    objc_msgSend(v8, "imageByApplyingSymbolConfiguration:", v6);
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v10;
  }
  if (!v9)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

@end
