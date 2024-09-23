@implementation PKHomeScreenWidgetController

+ (void)reloadWidget:(id)a3 budgeted:(BOOL)a4 reason:(id)a5
{
  _BOOL4 v6;
  id v7;
  id v8;
  NSObject *v9;
  const char *v10;
  int v11;
  __CFString **v12;
  __CFString *v13;
  void *v14;
  void *v15;
  char *v16;
  int v17;
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v6 = a4;
  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  PKLogFacilityTypeGetObject(0x1FuLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = "false";
    v17 = 136315906;
    v18 = "+[PKHomeScreenWidgetController reloadWidget:budgeted:reason:]";
    v19 = 2112;
    v20 = v7;
    if (v6)
      v10 = "true";
    v21 = 2080;
    v22 = v10;
    v23 = 2112;
    v24 = v8;
    _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "%s, identifier: %@ budgeted: %s, reason: %@", (uint8_t *)&v17, 0x2Au);
  }

  v11 = PKIsPad();
  v12 = PKHomeScreenWidgetStubBundleIdentifier;
  if (!v11)
    v12 = PKHomeScreenWidgetBundleIdentifier;
  v13 = *v12;
  v14 = (void *)objc_msgSend(objc_alloc((Class)getCHSTimelineControllerClass[0]()), "initWithExtensionBundleIdentifier:kind:", v13, v7);
  v15 = v14;
  if (v6)
    objc_msgSend(v14, "reloadTimelineBudgetedWithReason:", v8);
  else
    objc_msgSend(v14, "reloadTimelineWithReason:", v8);
  v16 = (char *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412290;
      v18 = v16;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Chrono failied to reload timeline with error: %@", (uint8_t *)&v17, 0xCu);
    }

  }
}

@end
