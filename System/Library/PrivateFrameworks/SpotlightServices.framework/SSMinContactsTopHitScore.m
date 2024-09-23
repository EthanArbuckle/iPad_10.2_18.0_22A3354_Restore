@implementation SSMinContactsTopHitScore

void __SSMinContactsTopHitScore_block_invoke()
{
  void *v0;
  void *v1;
  int v2;
  id v3;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.spotlightui"));
  objc_msgSend(v0, "objectForKey:", CFSTR("SPBullseyeMinContactsTopHitScore"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  v1 = v3;
  if (v3)
  {
    objc_msgSend(v3, "floatValue");
    v1 = v3;
  }
  else
  {
    v2 = -1102263091;
  }
  SSMinContactsTopHitScore_sMinContactsTopHitScore = v2;

}

@end
