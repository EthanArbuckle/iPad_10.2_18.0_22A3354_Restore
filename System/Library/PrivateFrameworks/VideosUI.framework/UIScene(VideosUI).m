@implementation UIScene(VideosUI)

- (uint64_t)vui_isNonLightningSecondScreenScene
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  objc_msgSend(a1, "screen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  VUIDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "Found window scene with display name %@", (uint8_t *)&v8, 0xCu);
  }

  v6 = objc_msgSend(v4, "hasPrefix:", CFSTR("TVOut"));
  return v6;
}

@end
