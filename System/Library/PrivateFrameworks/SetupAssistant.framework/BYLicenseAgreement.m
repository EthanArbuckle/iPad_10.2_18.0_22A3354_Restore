@implementation BYLicenseAgreement

+ (void)_clearAcceptedLicenseVersion
{
  CFPreferencesSetAppValue(CFSTR("acceptedSLAVersion"), 0, CFSTR("com.apple.purplebuddy.notbackedup"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.purplebuddy.notbackedup"));
}

+ (unint64_t)versionOfOnDiskAgreement
{
  if (versionOfOnDiskAgreement_onceToken != -1)
    dispatch_once(&versionOfOnDiskAgreement_onceToken, &__block_literal_global_23);
  return versionOfOnDiskAgreement_version;
}

void __46__BYLicenseAgreement_versionOfOnDiskAgreement__block_invoke()
{
  void (*v0)(void);
  void *v1;
  uint64_t v2;
  _Unwind_Exception *v3;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (void (*)(void))getSFLicenseVersionNumberSymbolLoc_ptr;
  v8 = getSFLicenseVersionNumberSymbolLoc_ptr;
  if (!getSFLicenseVersionNumberSymbolLoc_ptr)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __getSFLicenseVersionNumberSymbolLoc_block_invoke;
    v4[3] = &unk_1E4E26900;
    v4[4] = &v5;
    __getSFLicenseVersionNumberSymbolLoc_block_invoke((uint64_t)v4);
    v0 = (void (*)(void))v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)+[BYSiriUtilities deviceSupportsSystemAssistantExperience].cold.1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v3);
  }
  v0();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "hasPrefix:", CFSTR("EA")))
  {
    objc_msgSend(v1, "substringFromIndex:", 2);
    v2 = objc_claimAutoreleasedReturnValue();

    v1 = (void *)v2;
  }
  versionOfOnDiskAgreement_version = objc_msgSend(v1, "integerValue");

}

+ (unint64_t)versionOfAcceptedAgreement
{
  unint64_t result;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  result = CFPreferencesGetAppIntegerValue(CFSTR("acceptedSLAVersion"), CFSTR("com.apple.purplebuddy.notbackedup"), &keyExistsAndHasValidFormat);
  if ((uint64_t)result <= 0 || keyExistsAndHasValidFormat == 0)
    return 0;
  return result;
}

+ (BOOL)needsToAcceptNewAgreement
{
  uint64_t v3;

  v3 = objc_msgSend(a1, "versionOfAcceptedAgreement");
  return v3 != objc_msgSend(a1, "versionOfOnDiskAgreement");
}

+ (void)recordUserAcceptedAgreementVersion:(unint64_t)a3
{
  uint64_t v4;
  NSObject *v5;
  int v6;
  unint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a1, "versionOfAcceptedAgreement");
  _BYLoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134218240;
    v7 = a3;
    v8 = 2048;
    v9 = v4;
    _os_log_impl(&dword_1A4E92000, v5, OS_LOG_TYPE_DEFAULT, "SLA: Accepted software license version %llu! Previous version was %llu.", (uint8_t *)&v6, 0x16u);
  }

  CFPreferencesSetAppValue(CFSTR("acceptedSLAVersion"), (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3), CFSTR("com.apple.purplebuddy.notbackedup"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.purplebuddy.notbackedup"));
}

@end
