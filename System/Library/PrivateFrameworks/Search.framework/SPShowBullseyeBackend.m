@implementation SPShowBullseyeBackend

void __SPShowBullseyeBackend_block_invoke()
{
  void *v0;
  void *v1;
  char v2;
  void *v3;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.spotlightui"));
  objc_msgSend(v0, "objectForKey:", CFSTR("SPShowBullsEyeBackend"));
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
  SPShowBullseyeBackend__useBullseyeBackend = v2;

}

@end
