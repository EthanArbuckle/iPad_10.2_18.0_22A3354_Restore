@implementation AMSBag(WLKAdditions)

+ (id)wlk_defaultBag
{
  NSObject *v0;
  void *v1;
  NSObject *v2;
  uint8_t v4[16];
  uint8_t buf[16];

  WLKStartupSignpostLogObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B515A000, v0, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "WLKBag.DefaultAMSBag", ", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CFD9E8], "bagForProfile:profileVersion:", CFSTR("TVApp"), CFSTR("1"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  WLKStartupSignpostLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)v4 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B515A000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "WLKBag.DefaultAMSBag", ", v4, 2u);
  }

  return v1;
}

@end
