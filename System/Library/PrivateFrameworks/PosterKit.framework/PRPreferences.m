@implementation PRPreferences

+ (PRPreferences)sharedPreferences
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__PRPreferences_sharedPreferences__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedPreferences_once != -1)
    dispatch_once(&sharedPreferences_once, block);
  return (PRPreferences *)(id)sharedPreferences_sharedPreferences;
}

void __34__PRPreferences_sharedPreferences__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedPreferences_sharedPreferences;
  sharedPreferences_sharedPreferences = (uint64_t)v1;

}

- (BOOL)isAlternateCalendarEnabled
{
  void *v2;
  void *v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x1E0D0CDE0], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "overlayCalendarID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length") != 0;

  return v4;
}

@end
