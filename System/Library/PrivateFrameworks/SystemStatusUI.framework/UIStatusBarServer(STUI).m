@implementation UIStatusBarServer(STUI)

+ (id)stui_doubleHeightStatusStringMapping
{
  if (_MergedGlobals_45 != -1)
    dispatch_once(&_MergedGlobals_45, &__block_literal_global_10);
  return (id)qword_1EDBEDFA0;
}

+ (void)stui_postDoubleHeightStatusString:()STUI forBackgroundActivityWithIdentifier:
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  v6 = a4;
  objc_msgSend(a1, "stui_doubleHeightStatusStringMapping");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v9, v6);
  v8 = STUIStyleOverrideForBackgroundActivityIdentifier(v6);

  if (v8)
    objc_msgSend(a1, "postDoubleHeightStatusString:forStyle:", v9, objc_msgSend(MEMORY[0x1E0DC3CB0], "_defaultStyleForRequestedStyle:styleOverrides:activeStyleOverride:", 0, v8, 0));

}

+ (id)stui_getDoubleHeightStatusStringBackgroundActivityWithIdentifier:()STUI
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a1, "stui_doubleHeightStatusStringMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v7 = STUIStyleOverrideForBackgroundActivityIdentifier(v4);
    if (v7)
    {
      objc_msgSend(a1, "getDoubleHeightStatusStringForStyle:", objc_msgSend(MEMORY[0x1E0DC3CB0], "_defaultStyleForRequestedStyle:styleOverrides:activeStyleOverride:", 0, v7, 0));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

@end
