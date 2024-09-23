@implementation PXSystemNavigation

+ (id)_urlForDestination:(int64_t)a3
{
  const __CFString *v6;
  void *v7;
  void *v9;
  void *v10;
  void *v11;

  switch(a3)
  {
    case 0:
    case 14:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSystemNavigation.m"), 177, CFSTR("Code which should be unreachable has been reached"));

      abort();
    case 1:
      v6 = CFSTR("prefs:");
      break;
    case 2:
      v6 = CFSTR("prefs:root=General&path=STORAGE_MGMT");
      break;
    case 3:
      v6 = CFSTR("prefs:root=APPLE_ACCOUNT");
      break;
    case 4:
      v6 = CFSTR("prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE");
      break;
    case 5:
      v6 = CFSTR("prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/STORAGE_AND_BACKUP/PHOTOS");
      break;
    case 6:
      v6 = CFSTR("prefs:root=Photos&path=SharedLibrarySettingsButton");
      break;
    case 7:
      v6 = CFSTR("prefs:root=Photos");
      break;
    case 8:
      v6 = CFSTR("prefs:root=ACCOUNTS_AND_PASSWORDS&path=ADD_ACCOUNT");
      break;
    case 9:
      v6 = CFSTR("prefs:root=MOBILE_DATA_SETTINGS_ID&path=SHOW_ALL");
      break;
    case 10:
      v6 = CFSTR("prefs:root=ROOT#AIRPLANE_MODE");
      break;
    case 11:
      v6 = CFSTR("https://icq.icloud.com?context=ZXh0ZXJuYWxBcHBfY29tLmFwcGxlLm1vYmlsZXNsaWRlc2hvdw==");
      break;
    case 12:
      v6 = CFSTR("prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/BACKUP");
      break;
    case 13:
      v6 = CFSTR("prefs:root=Privacy&path=MEDIALIBRARY");
      break;
    default:
      v6 = 0;
      break;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PXSystemNavigationDestinationDescription(a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSystemNavigation.m"), 210, CFSTR("No URL for destination: %@"), v10);

  }
  return v7;
}

+ (void)navigateToDestination:(int64_t)a3 completion:(id)a4
{
  void (**v7)(id, uint64_t, id);
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  _QWORD v22[2];
  _QWORD v23[2];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = (void (**)(id, uint64_t, id))a4;
  if (a3 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSystemNavigation.m"), 219, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("destination > PXSystemNavigationDestinationInvalid"));
  }
  else
  {
    if ((unint64_t)a3 < 0xE)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSystemNavigation.m"), 220, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("destination < PXSystemNavigationDestinationEndMarker"));
  }

LABEL_3:
  objc_msgSend((id)objc_opt_class(), "_urlForDestination:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0D22D88];
  v22[0] = *MEMORY[0x1E0D22DA8];
  v22[1] = v10;
  v23[0] = MEMORY[0x1E0C9AAB0];
  v23[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v12 = objc_msgSend(v9, "openSensitiveURL:withOptions:error:", v8, v11, &v21);
  v13 = v21;

  if ((v12 & 1) == 0)
  {
    v14 = v8;
    v15 = v13;
    PLUIGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      PXSystemNavigationDestinationDescription(a3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "domain");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v15, "code");
      *(_DWORD *)buf = 138544386;
      v25 = v17;
      v26 = 2114;
      v27 = v14;
      v28 = 2114;
      v29 = v18;
      v30 = 2048;
      v31 = v19;
      v32 = 2112;
      v33 = v15;
      _os_log_impl(&dword_1A6789000, v16, OS_LOG_TYPE_ERROR, "Failed to navigate to destination: %{public}@, url: %{public}@, error: <%{public}@:%ld> (%@)", buf, 0x34u);

    }
  }
  if (v7)
    v7[2](v7, v12, v13);

}

@end
