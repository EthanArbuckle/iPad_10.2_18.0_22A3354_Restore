@implementation PLSearchSiriLinkDonationsEnabled

void __PLSearchSiriLinkDonationsEnabled_block_invoke()
{
  void *v0;
  int v1;
  uint8_t v2[16];

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("PLSearchSiriLinkDonationsEnabled"));

  if (v1)
  {
    PLSearchSiriLinkDonationsEnabled_siriLinkDonationsEnabled = 1;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v2 = 0;
      _os_log_impl(&dword_199541000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "PLSearchSiriLinkDonationsEnabled is overridden to YES via defaults.", v2, 2u);
    }
  }
}

@end
