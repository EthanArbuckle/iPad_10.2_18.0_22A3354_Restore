@implementation PXSharedLibraryCameraSharingBannerStatusProvider

uint64_t __75__PXSharedLibraryCameraSharingBannerStatusProvider__updateShouldShowBanner__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setShouldShowBanner:", *(unsigned __int8 *)(a1 + 40));
}

- (void)setShouldShowBanner:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  PXSharedLibraryCameraSharingBannerStatusProvider *v9;
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->_shouldShowBanner != a3)
  {
    v3 = a3;
    self->_shouldShowBanner = a3;
    PLSharedLibraryGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138543874;
      v7 = objc_opt_class();
      v8 = 2048;
      v9 = self;
      v10 = 1024;
      v11 = v3;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Should show banner: %d", (uint8_t *)&v6, 0x1Cu);
    }

    -[PXSharedLibraryCameraSharingBannerStatusProvider signalChange:](self, "signalChange:", 1);
  }
}

- (void)_updateShouldShowBanner
{
  CFIndex AppIntegerValue;
  BOOL v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  _QWORD v17[5];
  BOOL v18;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("CameraSharingPreferencesState"), CFSTR("com.apple.mobileslideshow"), &keyExistsAndHasValidFormat);
  v4 = 0;
  if (keyExistsAndHasValidFormat)
    v5 = (unint64_t)(AppIntegerValue - 3) > 0xFFFFFFFFFFFFFFFDLL;
  else
    v5 = 0;
  if (!v5)
  {
    PXPreferencesFirstCheckDateForCameraSharingPreferences();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "components:fromDate:toDate:options:", 16, v6, v8, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "day");

      +[PXSharedLibrarySettings sharedInstance](PXSharedLibrarySettings, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "sharingSuggestionsBannerFirstCheckThreshold");

      if (v10 < v12)
      {
        v4 = 0;
LABEL_13:

        goto LABEL_14;
      }
      PXPreferencesPromptDateForCameraSharingPreferences();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "timeIntervalSinceDate:", v13);
        v16 = v15;

        v4 = v16 <= 604800.0;
      }
      else
      {
        v4 = 1;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      PXPreferencesSetValue(CFSTR("FirstCheckDateForCameraSharingPreferences"), v13);
      v4 = 0;
    }

    goto LABEL_13;
  }
LABEL_14:
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __75__PXSharedLibraryCameraSharingBannerStatusProvider__updateShouldShowBanner__block_invoke;
  v17[3] = &unk_1E5142B28;
  v17[4] = self;
  v18 = v4;
  -[PXSharedLibraryCameraSharingBannerStatusProvider performChanges:](self, "performChanges:", v17);
}

- (PXSharedLibraryCameraSharingBannerStatusProvider)init
{
  PXSharedLibraryCameraSharingBannerStatusProvider *v2;
  PXSharedLibraryCameraSharingBannerStatusProvider *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXSharedLibraryCameraSharingBannerStatusProvider;
  v2 = -[PXSharedLibraryCameraSharingBannerStatusProvider init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    PXRegisterPreferencesObserver(v2);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__significantTimeChange_, *MEMORY[0x1E0DC4838], 0);

    -[PXSharedLibraryCameraSharingBannerStatusProvider _updateShouldShowBanner](v3, "_updateShouldShowBanner");
  }
  return v3;
}

- (BOOL)shouldShowBanner
{
  return self->_shouldShowBanner;
}

@end
