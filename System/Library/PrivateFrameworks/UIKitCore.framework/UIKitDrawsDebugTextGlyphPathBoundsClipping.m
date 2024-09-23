@implementation UIKitDrawsDebugTextGlyphPathBoundsClipping

void ___UIKitDrawsDebugTextGlyphPathBoundsClipping_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  _UIKitUserDefaults();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("DetectTextLayoutIssues"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    _MergedGlobals_56 = objc_msgSend(v5, "BOOLValue");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "environment");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v2, "objectForKey:", CFSTR("DetectTextLayoutIssues"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
      _MergedGlobals_56 = objc_msgSend(v3, "BOOLValue");

  }
}

@end
