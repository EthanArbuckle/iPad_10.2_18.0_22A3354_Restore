@implementation SPBlockGroupingEnabled

void __SPBlockGroupingEnabled_block_invoke()
{
  void *v0;
  void *v1;
  char v2;
  void *v3;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.spotlightui"));
  objc_msgSend(v0, "objectForKey:", CFSTR("SPRankingBlockGroupingEnabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v1 = v3;
  if (v3)
  {
    v2 = objc_msgSend(v3, "BOOLValue");
    v1 = v3;
  }
  else
  {
    v2 = 0;
  }
  SPBlockGroupingEnabled__blockGroupingEnabled = v2;

}

@end
