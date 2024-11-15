@implementation PXCloudQuotaUpsellSheetManager

uint64_t __85__PXCloudQuotaUpsellSheetManager_presentUpsellSheetIfNecessaryWithActivationOptions___block_invoke(uint64_t a1, int a2)
{
  double v3;
  double v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  uint8_t *v9;
  __int16 v11;
  uint8_t v12[2];
  uint8_t buf[16];

  if (!a2)
  {
    PLUserStatusGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v11 = 0;
      v8 = "No iCloud Quota upsell currently available";
      v9 = (uint8_t *)&v11;
LABEL_10:
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, v8, v9, 2u);
    }
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v4 = v3 - *(double *)(a1 + 32);
  PLUserStatusGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 > 1.0)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      v8 = "Request for iCloud Quota upsell timed out: Deny presentation";
      v9 = v12;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "Request for iCloud Quota upsell returned current offer: Allow presentation", buf, 2u);
  }
  v7 = 1;
LABEL_12:

  return v7;
}

+ (void)presentUpsellSheetIfNecessaryWithActivationOptions:(int64_t)a3
{
  void *v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  NSObject *v15;
  const char *v16;
  void *v17;
  id v18;
  char v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  _QWORD v31[5];
  uint8_t buf[8];
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("PXCloudQuotaUpsellSheetManagerDisabled"));

  PLUserStatusGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEFAULT, "Will not request iCloud Quota upsell: Disabled by user default", buf, 2u);
    }
    goto LABEL_32;
  }
  v8 = os_signpost_id_generate(v6);
  v9 = v7;
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "iCloudQuotaUpsellCheck", ", buf, 2u);
  }

  PXPreferencesWelcomeViewLastPresentationDate();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v13 = v12;
    objc_msgSend(v11, "timeIntervalSinceReferenceDate");
    if (v13 - v14 < 86400.0)
    {
      PLUserStatusGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v16 = "Will not request iCloud Quota upsell: Welcome views presented too recently";
LABEL_14:
        _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 2u);
        goto LABEL_31;
      }
      goto LABEL_31;
    }
  }
  if (a3 == 2)
  {
    PLUserStatusGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v16 = "Will not request iCloud Quota upsell: Photos launched with some connection options";
      goto LABEL_14;
    }
LABEL_31:

LABEL_32:
    return;
  }
  v37 = 0;
  v38 = &v37;
  v39 = 0x2050000000;
  v17 = (void *)getICQOfferManagerClass_softClass;
  v40 = getICQOfferManagerClass_softClass;
  if (!getICQOfferManagerClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    v33 = 3221225472;
    v34 = (uint64_t)__getICQOfferManagerClass_block_invoke;
    v35 = &unk_1E51482E0;
    v36 = &v37;
    __getICQOfferManagerClass_block_invoke((uint64_t)buf);
    v17 = (void *)v38[3];
  }
  v18 = objc_retainAutorelease(v17);
  _Block_object_dispose(&v37, 8);
  objc_msgSend(v18, "sharedOfferManager");
  v15 = objc_claimAutoreleasedReturnValue();
  v19 = objc_opt_respondsToSelector();
  PLUserStatusGetLog();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if ((v19 & 1) == 0)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v21, OS_LOG_TYPE_ERROR, "Cannot request iCloud Quota upsell: Device OS version too old", buf, 2u);
    }

    goto LABEL_27;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6789000, v21, OS_LOG_TYPE_DEFAULT, "Will request iCloud Quota upsell", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v23 = v22;
  *(_QWORD *)buf = 0;
  v33 = (uint64_t)buf;
  v34 = 0x2020000000;
  v24 = (uint64_t *)getICQUIUpsellTriggerEventAppLaunchSymbolLoc_ptr;
  v35 = (void *)getICQUIUpsellTriggerEventAppLaunchSymbolLoc_ptr;
  if (!getICQUIUpsellTriggerEventAppLaunchSymbolLoc_ptr)
  {
    v25 = iCloudQuotaUILibrary();
    v24 = (uint64_t *)dlsym(v25, "ICQUIUpsellTriggerEventAppLaunch");
    *(_QWORD *)(v33 + 24) = v24;
    getICQUIUpsellTriggerEventAppLaunchSymbolLoc_ptr = (uint64_t)v24;
  }
  _Block_object_dispose(buf, 8);
  if (v24)
  {
    v26 = *v24;
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __85__PXCloudQuotaUpsellSheetManager_presentUpsellSheetIfNecessaryWithActivationOptions___block_invoke;
    v31[3] = &__block_descriptor_40_e8_B12__0B8l;
    v31[4] = v23;
    -[NSObject fetchAndPresentUpsellForBundleIdentifier:event:completion:](v15, "fetchAndPresentUpsellForBundleIdentifier:event:completion:", CFSTR("com.apple.mobileslideshow"), v26, v31);
LABEL_27:
    v27 = v10;
    v28 = v27;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v28, OS_SIGNPOST_INTERVAL_END, v8, "iCloudQuotaUpsellCheck", ", buf, 2u);
    }

    goto LABEL_31;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getICQUIUpsellTriggerEventAppLaunch(void)");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", v30, CFSTR("PXCloudQuotaUpsellSheetManager.m"), 20, CFSTR("%s"), dlerror());

  __break(1u);
}

@end
