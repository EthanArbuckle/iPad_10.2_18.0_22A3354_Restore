@implementation SBValidateTimeZone

void __SBValidateTimeZone_block_invoke()
{
  NSObject *v0;
  NSObject *v1;
  void *v2;
  void *v3;
  void *v4;
  __CFString *v5;
  CFTimeZoneRef v6;
  CFTimeZoneRef v7;
  CFTimeZoneRef v8;
  int v9;
  NSObject *v10;
  _BOOL4 v11;
  uint8_t v12[16];
  uint8_t v13[16];
  uint8_t v14[16];
  uint8_t buf[16];

  SBLogCommon();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v0, OS_LOG_TYPE_DEFAULT, "validating timezone, checking whether automatic time zone is enabled", buf, 2u);
  }

  if (!TMIsAutomaticTimeZoneEnabled())
  {
    SBLogCommon();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1D0540000, v1, OS_LOG_TYPE_DEFAULT, "automatic timezone is not enabled, validating preferences timezone with locationd", v14, 2u);
    }

    objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, 0, 0, 0, 0, 4, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setProperty:forKey:", CFSTR("com.apple.preferences.datetime"), *MEMORY[0x1E0D807F8]);
    objc_msgSend(v2, "setProperty:forKey:", CFSTR("timezone"), *MEMORY[0x1E0D808B0]);
    PSCityForSpecifier();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "timeZone");
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v6 = CFTimeZoneCreateWithName(0, v5, 0);

      if (v6)
      {
        v7 = CFTimeZoneCopySystem();
        if (v7)
        {
          v8 = v7;
          v9 = CFEqual(v7, v6);
          SBLogCommon();
          v10 = objc_claimAutoreleasedReturnValue();
          v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
          if (v9)
          {
            if (v11)
            {
              *(_WORD *)v12 = 0;
              _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "timezone verified, no work to do.", v12, 2u);
            }

          }
          else
          {
            if (v11)
            {
              *(_WORD *)v13 = 0;
              _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "updating timezone symlink", v13, 2u);
            }

            _timezoneQueue_setTimeZone((uint64_t)v6);
          }
          CFRelease(v8);
        }
        CFRelease(v6);
      }
    }

  }
}

@end
