uint64_t XBInterfaceOrientationMaskForInterfaceOrientation(char a1)
{
  return (1 << a1) & 0x1E;
}

uint64_t XBInterfaceOrientationMaskForInterfaceOrientationPair(uint64_t a1)
{
  uint64_t v1;

  v1 = 24;
  if ((unint64_t)(a1 - 3) >= 2)
    v1 = 0;
  if ((unint64_t)(a1 - 1) >= 2)
    return v1;
  else
    return 6;
}

id XBLogFetchRequests()
{
  if (XBLogFetchRequests_onceToken != -1)
    dispatch_once(&XBLogFetchRequests_onceToken, &__block_literal_global_5);
  return (id)XBLogFetchRequests___logObj;
}

uint64_t XBStatusBarStateMaskForStatusBarState(char a1)
{
  return (1 << a1);
}

void sub_2177049B0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217704A64(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217704EA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_2177050DC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id XBLogSnapshot()
{
  if (XBLogSnapshot_onceToken != -1)
    dispatch_once(&XBLogSnapshot_onceToken, &__block_literal_global);
  return (id)XBLogSnapshot___logObj;
}

void sub_217705208(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217705C3C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217705C94(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217705D38(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217705FDC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t XBStatusBarStateMaskMatchesSettings(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v3 = a2;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __XBStatusBarStateMaskMatchesSettings_block_invoke;
  v7[3] = &unk_24D7F4798;
  v9 = &v10;
  v4 = v3;
  v8 = v4;
  XBEnumerateStatusBarStatesMatchingMask(a1, v7);
  v5 = *((unsigned __int8 *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return v5;
}

void sub_217706A5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void XBEnumerateStatusBarStatesMatchingMask(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __XBEnumerateStatusBarStatesMatchingMask_block_invoke;
    v5[3] = &unk_24D7F42A0;
    v7 = a1;
    v6 = v3;
    XBEnumerateStatusBarStates(v5);

  }
}

void XBEnumerateStatusBarStates(void *a1)
{
  void (**v1)(id, _QWORD, char *);
  char v2;

  v1 = a1;
  v2 = 0;
  v1[2](v1, 0, &v2);
  if (!v2)
  {
    v1[2](v1, 1, &v2);
    if (!v2)
      v1[2](v1, 2, &v2);
  }

}

uint64_t XBStatusBarStateMatchesSettings(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    if (a1)
    {
      objc_msgSend(v3, "style");
      v5 = (a1 != 2) ^ UIStatusBarStyleIsDoubleHeight();
    }
    else
    {
      v5 = objc_msgSend(v3, "isHidden");
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id FAKE_NIL_PTR()
{
  if (FAKE_NIL_PTR_onceToken != -1)
    dispatch_once(&FAKE_NIL_PTR_onceToken, &__block_literal_global_9);
  return (id)FAKE_NIL_PTR___fakeNil;
}

uint64_t XBImageOrientationForInterfaceOrientationRotation(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = XBRotationDegreesForInterfaceOrientationRotation(a1, a2) % 360;
  if (v2 <= 89)
  {
    if (v2 != -180)
    {
      if (v2 == -90)
        return 3;
      return 0;
    }
    return 1;
  }
  if (v2 != 90)
    return v2 == 180;
  return 2;
}

uint64_t XBRotationDegreesForInterfaceOrientationRotation(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = 90;
  v3 = -90;
  v4 = 180;
  if (a2 != 2)
    v4 = 0;
  if (a2 != 4)
    v3 = v4;
  if (a2 != 3)
    v2 = v3;
  if (a2 == 1)
    v2 = 0;
  v5 = -90;
  v6 = 90;
  v7 = -180;
  if (a1 != 2)
    v7 = 0;
  if (a1 != 4)
    v6 = v7;
  if (a1 != 3)
    v5 = v6;
  if (a1 == 1)
    v5 = 0;
  v8 = v5 + v2;
  v9 = v8 + 360;
  if (v8 >= -180)
    v9 = v8;
  if (v8 <= 180)
    return v9;
  else
    return v8 - 360;
}

void sub_2177084B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_217708CC4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id XBLogCapture()
{
  if (XBLogCapture_onceToken != -1)
    dispatch_once(&XBLogCapture_onceToken, &__block_literal_global_11);
  return (id)XBLogCapture___logObj;
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x3Au);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_217709594(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id XBLogSnapshotReaper()
{
  if (XBLogSnapshotReaper_onceToken != -1)
    dispatch_once(&XBLogSnapshotReaper_onceToken, &__block_literal_global_7);
  return (id)XBLogSnapshotReaper___logObj;
}

id XBLogFileManifest()
{
  if (XBLogFileManifest_onceToken != -1)
    dispatch_once(&XBLogFileManifest_onceToken, &__block_literal_global_13);
  return (id)XBLogFileManifest___logObj;
}

void sub_21770B04C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t XBApplicationSnapshotContentTypeMaskForContentType(char a1)
{
  return (1 << a1);
}

void sub_21770B6E8(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 48));
  _Unwind_Resume(a1);
}

id XBLogDaemonLifecycle()
{
  if (XBLogDaemonLifecycle_onceToken != -1)
    dispatch_once(&XBLogDaemonLifecycle_onceToken, &__block_literal_global_9);
  return (id)XBLogDaemonLifecycle___logObj;
}

void sub_21770C324(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id XBLogMemory()
{
  if (XBLogMemory_onceToken != -1)
    dispatch_once(&XBLogMemory_onceToken, &__block_literal_global_3);
  return (id)XBLogMemory___logObj;
}

id XBLogPurge()
{
  if (XBLogPurge_onceToken != -1)
    dispatch_once(&XBLogPurge_onceToken, &__block_literal_global_15);
  return (id)XBLogPurge___logObj;
}

id XBLogCommon()
{
  if (XBLogCommon_onceToken != -1)
    dispatch_once(&XBLogCommon_onceToken, &__block_literal_global_17);
  return (id)XBLogCommon___logObj;
}

const __CFString *XBStatusBarStateDescription(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("invalid");
  else
    return off_24D7F42C0[a1];
}

__CFString *XBStatusBarStateMaskDescription(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  if (a1 == -1)
    return CFSTR("All");
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __XBStatusBarStateMaskDescription_block_invoke;
  v6[3] = &unk_24D7F41C0;
  v7 = v2;
  v3 = v2;
  XBEnumerateStatusBarStatesMatchingMask(a1, v6);
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (__CFString *)v4;
}

const __CFString *XBLaunchInterfaceTypeName(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("(null)");
  if (a1 == 1)
    v1 = CFSTR("Storyboard");
  if (a1)
    return v1;
  else
    return CFSTR("XIB");
}

uint64_t _XBInterfaceWithNameExistsInBundle(id *a1, void *a2, uint64_t *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a2;
  if (objc_msgSend(*a1, "length"))
  {
    v6 = *a1;
    objc_msgSend(v6, "pathExtension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v6, "stringByDeletingPathExtension");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = CFSTR("storyboardc");
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("storyboardc")) & 1) != 0
        || (objc_msgSend(v7, "isEqualToString:", CFSTR("storyboard")) & 1) != 0)
      {
        v10 = 1;
        goto LABEL_6;
      }
      v9 = CFSTR("nib");
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("nib")) & 1) != 0
        || objc_msgSend(v7, "isEqualToString:", CFSTR("xib")))
      {
        v10 = 0;
LABEL_6:
        objc_msgSend(v5, "pathForResource:ofType:inDirectory:", v8, v9, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          v10 = 0;
LABEL_21:
          v13 = objc_retainAutorelease(v8);
          *a1 = v13;

          goto LABEL_22;
        }
        goto LABEL_19;
      }
    }
    else
    {
      v8 = v6;
    }
    objc_msgSend(v5, "pathForResource:ofType:inDirectory:", v8, CFSTR("storyboardc"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v10 = 1;
      if (!a3)
        goto LABEL_21;
    }
    else
    {
      objc_msgSend(v5, "pathForResource:ofType:inDirectory:", v8, CFSTR("nib"), 0);
      v10 = objc_claimAutoreleasedReturnValue();

      if (!v10)
        goto LABEL_21;
      if (!a3)
      {
LABEL_20:
        v10 = 1;
        goto LABEL_21;
      }
      v10 = 0;
    }
LABEL_19:
    *a3 = v10;
    goto LABEL_20;
  }
  v10 = 0;
LABEL_22:

  return v10;
}

void sub_21770F6B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL XBIsSymbolicLinkAtPath(void *a1)
{
  stat v3;

  memset(&v3, 0, sizeof(v3));
  return !lstat((const char *)objc_msgSend(objc_retainAutorelease(a1), "fileSystemRepresentation", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                            0,
                            0),
            &v3)
      && (v3.st_mode & 0xF000) == 40960;
}

double XBModificationDateForPath(void *a1)
{
  int v1;
  double result;
  stat v3;

  memset(&v3, 0, sizeof(v3));
  v1 = stat((const char *)objc_msgSend(objc_retainAutorelease(a1), "fileSystemRepresentation", 0, 0, 0, 0, 0, 0), &v3);
  result = 0.0;
  if (!v1)
    return (double)v3.st_mtimespec.tv_nsec / 1000000000.0 + (double)v3.st_mtimespec.tv_sec + -978307200.0;
  return result;
}

BOOL XBEnsureDirectoryExistsAtPath(void *a1)
{
  id v1;
  int v2;
  _BOOL8 v3;
  void *v4;
  id v5;
  id v7;

  v1 = objc_retainAutorelease(a1);
  v2 = mkdir((const char *)objc_msgSend(v1, "fileSystemRepresentation"), 0x1FFu);
  if (!v2 || v2 == -1 && *__error() == 17)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v1, 1, 0, &v7);
    v5 = v7;

    v3 = v5 == 0;
  }

  return v3;
}

id XBCachedNSHomeDirectory()
{
  if (XBCachedNSHomeDirectory_onceToken != -1)
    dispatch_once(&XBCachedNSHomeDirectory_onceToken, &__block_literal_global_1);
  return (id)XBCachedNSHomeDirectory_sHomeDir;
}

id XBCachesPathForApplicationInfo(void *a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "dataContainerURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  XBCachesPathForSandboxPath(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id XBCachesPathForSandboxPath(void *a1)
{
  void *v1;
  void *v2;

  XBLibraryPathForSandboxPath(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("Caches"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id XBSnapshotPathForNonSandboxedSystemApplications()
{
  void *v0;
  void *v1;

  XBSplashBoardPathForSandboxPath(0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("Snapshots"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id XBSplashBoardPathForSandboxPath(void *a1)
{
  void *v1;
  void *v2;

  XBLibraryPathForSandboxPath(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("SplashBoard"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id XBSnapshotPathForBundleIdentifierWithSandboxPath(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a1;
  XBSplashBoardPathForSandboxPath(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("Snapshots"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && !a2)
  {
    objc_msgSend(v5, "stringByAppendingPathComponent:", v3);
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }

  return v5;
}

BOOL XBLegacyCachesSnapshotPathForNonSandboxedSystemApplicationsExists()
{
  void *v0;
  void *v1;
  _BOOL8 v2;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  XBLegacyCachesSnapshotPathForNonSandboxedSystemApplications();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 && (objc_msgSend(v0, "fileExistsAtPath:", v1) & 1) != 0;

  return v2;
}

id XBLegacyCachesSnapshotPathForNonSandboxedSystemApplications()
{
  void *v0;
  void *v1;

  XBCachesPathForSandboxPath(0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("Snapshots"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

uint64_t XBDeleteLegacyCachesSnapshotPathForSandboxedApplicationIfNeeded(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  char v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(v1, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dataContainerURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    XBCachesPathForSandboxPath(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("Snapshots"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6 && objc_msgSend(v7, "fileExistsAtPath:", v6))
    {
      XBLogFileManifest();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v18 = v2;
        v19 = 2114;
        v20 = v4;
        v21 = 2114;
        v22 = v6;
        _os_log_impl(&dword_217702000, v9, OS_LOG_TYPE_DEFAULT, "Deleting legacy cache snapshots path for bundleID: %{public}@, sandboxPath: %{public}@, legacySnapshotsPath: %{public}@", buf, 0x20u);
      }

      v16 = 0;
      v10 = objc_msgSend(v8, "removeItemAtPath:error:", v6, &v16);
      v11 = v16;
      v12 = v11;
      if ((v10 & 1) == 0 && v11)
      {
        XBLogFileManifest();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138544130;
          v18 = v2;
          v19 = 2114;
          v20 = v4;
          v21 = 2114;
          v22 = v6;
          v23 = 2114;
          v24 = v12;
          _os_log_error_impl(&dword_217702000, v13, OS_LOG_TYPE_ERROR, "Error deleting legacy cache snapshots path for bundleID %{public}@, sandboxPath: %{public}@, legacySnapshotsPath: %{public}@: %{public}@", buf, 0x2Au);
        }

      }
      v14 = 1;
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

uint64_t XBDeleteLegacyCachesSnapshotPathForNonSandboxedApplicationIfNeeded(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  char v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    XBLegacyCachesSnapshotPathForNonSandboxedSystemApplications();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingPathComponent:", v1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4 && objc_msgSend(v2, "fileExistsAtPath:", v4))
    {
      XBLogFileManifest();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v14 = v1;
        _os_log_impl(&dword_217702000, v5, OS_LOG_TYPE_DEFAULT, "Deleting legacy cache snapshots path for non-sandboxed system app: %{public}@", buf, 0xCu);
      }

      v12 = 0;
      v6 = objc_msgSend(v2, "removeItemAtPath:error:", v4, &v12);
      v7 = v12;
      v8 = v7;
      if ((v6 & 1) == 0 && v7)
      {
        XBLogFileManifest();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          v14 = v1;
          v15 = 2114;
          v16 = v4;
          v17 = 2114;
          v18 = v8;
          _os_log_error_impl(&dword_217702000, v9, OS_LOG_TYPE_ERROR, "Error deleting legacy cache snapshots path for non-sandboxed system app %{public}@ at %{public}@: %{public}@", buf, 0x20u);
        }

      }
      v10 = 1;
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void XBDeleteLegacyCachesSnapshotPathForNonSandboxedApplicationsIfNeeded()
{
  void *v0;
  void *v1;
  NSObject *v2;
  char v3;
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  XBLegacyCachesSnapshotPathForNonSandboxedSystemApplications();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1 && objc_msgSend(v0, "fileExistsAtPath:", v1))
  {
    XBLogFileManifest();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v9 = v1;
      _os_log_impl(&dword_217702000, v2, OS_LOG_TYPE_DEFAULT, "Deleting legacy cache snapshots path for non-sandboxed system apps: %{public}@", buf, 0xCu);
    }

    v7 = 0;
    v3 = objc_msgSend(v0, "removeItemAtPath:error:", v1, &v7);
    v4 = v7;
    v5 = v4;
    if ((v3 & 1) == 0 && v4)
    {
      XBLogFileManifest();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        XBDeleteLegacyCachesSnapshotPathForNonSandboxedApplicationsIfNeeded_cold_1((uint64_t)v1, (uint64_t)v5, v6);

    }
  }

}

id XBLibraryPathForSandboxPath(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  if (!v1)
  {
    XBCachedNSHomeDirectory();
    v1 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("Library"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

__CFString *XBApplicationSnapshotContentTypeDescription(unint64_t a1)
{
  if (a1 > 2)
    return 0;
  else
    return off_24D7F42F8[a1];
}

__CFString *XBApplicationSnapshotContentTypeMaskDescription(uint64_t a1)
{
  char v1;
  void *v2;
  void *v3;
  __CFString *v4;

  if (a1 == -1)
  {
    v4 = CFSTR("All Types");
    return v4;
  }
  v1 = a1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if ((v1 & 4) == 0)
  {
    if ((v1 & 2) == 0)
      goto LABEL_4;
LABEL_10:
    objc_msgSend(v3, "addObject:", CFSTR("GeneratedDefault"));
    if ((v1 & 1) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  objc_msgSend(v2, "addObject:", CFSTR("StaticDefault"));
  if ((v1 & 2) != 0)
    goto LABEL_10;
LABEL_4:
  if ((v1 & 1) != 0)
LABEL_5:
    objc_msgSend(v3, "addObject:", CFSTR("SceneContent"));
LABEL_6:
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void sub_217711C10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
  _Block_object_dispose(&a51, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

uint64_t XBInterfaceOrientationsAreOrthogonal(uint64_t a1, uint64_t a2)
{
  return ((unint64_t)(a1 - 1) < 2) ^ ((unint64_t)(a2 - 1) < 2);
}

uint64_t XBOppositeInterfaceOrientation(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return 0;
  else
    return qword_21772B128[a1 - 1];
}

uint64_t XBNextClockwiseInterfaceOrientation(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return 0;
  else
    return qword_21772B148[a1 - 1];
}

__CFString *XBStringForInterfaceOrientation(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return 0;
  else
    return off_24D7F4478[a1 - 1];
}

uint64_t XBInterfaceOrientationForString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Landscape")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("LandscapeLeft")) & 1) != 0)
  {
    v2 = 4;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("LandscapeRight")) & 1) != 0)
  {
    v2 = 3;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("PortraitUpsideDown")))
  {
    v2 = 2;
  }
  else
  {
    v2 = 1;
  }

  return v2;
}

uint64_t XBInterfaceOrientationForAffineTransform()
{
  BSRadiansFromAffineTransform();
  if ((BSFloatIsZero() & 1) != 0)
    return 1;
  if ((BSFloatEqualToFloat() & 1) != 0)
    return 4;
  if ((BSFloatEqualToFloat() & 1) != 0)
    return 3;
  if (BSFloatEqualToFloat())
    return 2;
  return 0;
}

uint64_t XBImageOrientationForInterfaceOrientation(uint64_t a1)
{
  if ((unint64_t)(a1 - 2) >= 3)
    return 0;
  else
    return a1 - 1;
}

uint64_t XBImageOrientationForRotationDegrees(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 % 360;
  if (a1 % 360 <= 89)
  {
    if (v1 != -180)
    {
      if (v1 == -90)
        return 3;
      return 0;
    }
    return 1;
  }
  if (v1 != 90)
    return v1 == 180;
  return 2;
}

uint64_t XBRotationDegreesForImageOrientation(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 6)
    return 0;
  else
    return qword_21772B168[a1 - 1];
}

__CFString *XBImageOrientationDescription(uint64_t a1)
{
  uint64_t v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *result;

  v2 = 180;
  v3 = CFSTR("Down");
  switch(a1)
  {
    case 0:
      v4 = CFSTR("Up");
      goto LABEL_3;
    case 1:
      goto LABEL_12;
    case 2:
      v2 = 4294967206;
      v3 = CFSTR("Left");
      goto LABEL_12;
    case 3:
      v2 = 90;
      v3 = CFSTR("Right");
      goto LABEL_12;
    case 4:
      return CFSTR("UpMirrored");
    case 5:
      v2 = 180;
      v3 = CFSTR("DownMirrored");
      goto LABEL_12;
    case 6:
      v2 = 4294967206;
      v3 = CFSTR("LeftMirrored");
      goto LABEL_12;
    case 7:
      v2 = 90;
      v3 = CFSTR("RightMirrored");
LABEL_12:
      -[__CFString stringByAppendingFormat:](v3, "stringByAppendingFormat:", CFSTR(" (%d°)"), v2);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_3:
      result = v4;
      break;
    default:
      result = (__CFString *)0;
      break;
  }
  return result;
}

uint64_t _XBDebugCaptureIsEnabled()
{
  if (_XBDebugCaptureIsEnabled_onceToken != -1)
    dispatch_once(&_XBDebugCaptureIsEnabled_onceToken, &__block_literal_global_3);
  return _XBDebugCaptureIsEnabled_sEncodingEnabled;
}

void _XBPreparedLaunchInterfaceForCapture(uint64_t a1, void *a2, void *a3, void *a4, void *a5, _QWORD *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  id v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (a6)
    goto LABEL_5;
  if (_XBDebugCaptureIsEnabled_onceToken != -1)
    dispatch_once(&_XBDebugCaptureIsEnabled_onceToken, &__block_literal_global_3);
  if (_XBDebugCaptureIsEnabled_sEncodingEnabled)
  {
LABEL_5:
    XBLogCapture();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      _XBPreparedLaunchInterfaceForCapture_cold_1(v11, v15);

    v16 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("splashboardd-%d"), objc_msgSend(v17, "processIdentifier"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v12, "bundleIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v12;
    if (objc_msgSend(v13, "interfaceOrientation") == 1)
    {
      v21 = v11;
      v22 = CFSTR("UIInterfaceOrientationPortrait");
    }
    else
    {
      v21 = v11;
      if (objc_msgSend(v13, "interfaceOrientation") == 4)
      {
        v22 = CFSTR("UIInterfaceOrientationLandscapeLeft");
      }
      else if (objc_msgSend(v13, "interfaceOrientation") == 3)
      {
        v22 = CFSTR("UIInterfaceOrientationLandscapeRight");
      }
      else if (objc_msgSend(v13, "interfaceOrientation") == 2)
      {
        v22 = CFSTR("UIInterfaceOrientationPortraitUpsideDown");
      }
      else
      {
        v22 = 0;
      }
    }
    XBStringForUserInterfaceStyle(objc_msgSend(v13, "userInterfaceStyle"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "naturalSize");
    v25 = v24;
    objc_msgSend(v13, "naturalSize");
    objc_msgSend(v19, "stringWithFormat:", CFSTR("%@-%@-%@-%.fx%.f-%u"), v20, v22, v23, v25, v26, a1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    NSTemporaryDirectory();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@.caar"), v18, v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stringByAppendingPathComponent:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (a6)
      *a6 = objc_retainAutorelease(v30);
    v11 = v21;
    objc_msgSend(v21, "layer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_retainAutorelease(v30);
    objc_msgSend(v32, "UTF8String");
    CAEncodeLayerTreeToFile();

    XBLogCapture();
    v33 = objc_claimAutoreleasedReturnValue();
    v12 = v34;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      v36 = v32;
      v37 = 2114;
      v38 = v34;
      v39 = 2114;
      v40 = v13;
      v41 = 2114;
      v42 = v14;
      _os_log_impl(&dword_217702000, v33, OS_LOG_TYPE_DEFAULT, "splashboardd wrote an encoded launch interface to: %{public}@\nappInfo: %{public}@\nlaunchRequest: %{public}@\nlaunchInterface: %{public}@", buf, 0x2Au);
    }

  }
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return objc_opt_class();
}

void sub_21771468C(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_217714960(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_217714E10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

uint64_t OUTLINED_FUNCTION_3_1()
{
  return objc_opt_class();
}

void sub_21771602C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_217716814(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217716890(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

const __CFString *NSStringFromXBApplicationSnapshotOnDiskFormat(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) > 4)
    return CFSTR("(unknown)");
  else
    return off_24D7F4830[a1 + 1];
}

uint64_t XBApplicationSnapshotOnDiskFormatForFileExtension(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("png")))
  {
    if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("ktx")))
    {
      if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("jpeg")))
      {
        if (objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("jpg")))
          v2 = -1;
        else
          v2 = 3;
      }
      else
      {
        v2 = 3;
      }
    }
    else
    {
      v2 = 1;
    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void sub_2177172A8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2177173E4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217717448(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217717608(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2177178AC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2177179A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_217717A3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_217717C28(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217718F00(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_217719130(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2177191D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_217719250(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2177192E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_217719D14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  void *v16;

  objc_sync_exit(v16);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t _XBTrackDeletionPreferencesChangedHandler()
{
  return +[XBApplicationSnapshotManifest handleTrackingStateChange](XBApplicationSnapshotManifest, "handleTrackingStateChange");
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void _fsEventStreamCallback(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v7;
  __int128 v8;
  uint64_t v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  const __CFString *v17;
  const __CFString *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  __int128 v30;
  id v31;
  _QWORD v32[5];
  _QWORD v33[2];
  _QWORD v34[2];
  const __CFString *v35;
  void *v36;
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v31 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (a3)
  {
    v9 = 0;
    v10 = CFSTR("path");
    v11 = CFSTR("fileID");
    *(_QWORD *)&v8 = 138543362;
    v30 = v8;
    do
    {
      if ((*(_DWORD *)(a5 + 4 * v9) & 0x100200) != 0)
      {
        objc_msgSend(v7, "objectAtIndex:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v11);
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v14;
        if (v13 && v14)
        {
          v16 = v7;
          v17 = v11;
          v18 = v10;
          XBLogFileManifest();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v30;
            v38 = v13;
            _os_log_impl(&dword_217702000, v19, OS_LOG_TYPE_DEFAULT, "fsEventStream: file removed at %{public}@", buf, 0xCu);
          }

          v35 = CFSTR("LaunchImageDeleted");
          v36 = v13;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "addObject:", v20);

          v10 = v18;
          v11 = v17;
          v7 = v16;
        }

      }
      ++v9;
    }
    while (a3 != v9);
  }
  if (objc_msgSend(v31, "count", v30))
  {
    v21 = __LastLogEventTime;
    if (*(double *)&__LastLogEventTime == 0.0
      || (BSContinuousMachTimeNow(), v22 - *(double *)&__LastLogEventTime >= 300.0))
    {
      BSContinuousMachTimeNow();
      __LastLogEventTime = v23;
      v24 = objc_alloc_init(MEMORY[0x24BEB3478]);
      objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "processName");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:", CFSTR("SplashBoard"), CFSTR("Manifest"), CFSTR("LaunchImagesDeleted"), 0, v26, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = *MEMORY[0x24BEB3480];
      v33[0] = *MEMORY[0x24BEB3488];
      v33[1] = v28;
      v34[0] = MEMORY[0x24BDBD1C0];
      v34[1] = MEMORY[0x24BDBD1C0];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = MEMORY[0x24BDAC760];
      v32[1] = 3221225472;
      v32[2] = ___fsEventStreamCallback_block_invoke;
      v32[3] = &__block_descriptor_40_e22_v16__0__NSDictionary_8l;
      v32[4] = v21;
      objc_msgSend(v24, "snapshotWithSignature:duration:events:payload:actions:reply:", v27, v31, 0, v29, v32, 0.0);

    }
  }

}

void sub_21771E8D4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_21771EF9C(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 120));
  _Unwind_Resume(a1);
}

void sub_217720810(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_217721B04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ___fsEventStreamCallback_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  _QWORD block[5];

  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x24BEB3558]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if (v4)
  {
    dispatch_async((dispatch_queue_t)__ManifestFSEventsQueue, &__block_literal_global_382);
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = ___fsEventStreamCallback_block_invoke_3;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async((dispatch_queue_t)__ManifestFSEventsQueue, block);
  }
}

uint64_t ___fsEventStreamCallback_block_invoke_2()
{
  uint64_t result;
  uint64_t v1;

  result = BSContinuousMachTimeNow();
  __LastLogEventTime = v1;
  return result;
}

double ___fsEventStreamCallback_block_invoke_3(uint64_t a1)
{
  double result;

  result = *(double *)(a1 + 32);
  __LastLogEventTime = *(_QWORD *)&result;
  return result;
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_1_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_4_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_5_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_11(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

char *OUTLINED_FUNCTION_14(int *a1)
{
  return strerror(*a1);
}

uint64_t XBIsInternalInstall()
{
  return os_variant_has_internal_content();
}

void sub_2177229C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  char a69;

  _Block_object_dispose(&a63, 8);
  _Block_object_dispose(&a69, 8);
  _Block_object_dispose(&STACK[0x210], 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void sub_217722F4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_217724644(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_217725318(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 240), 8);
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

uint64_t XBStringForUserInterfaceStyle(unint64_t a1)
{
  if (a1 > 2)
    return 0;
  else
    return (uint64_t)*(&off_24D7F5230 + a1);
}

BOOL XBValidateStoryboard(void *a1, void *a2, _QWORD *a3)
{
  return XBValidateResource(a1, CFSTR("storyboardc"), 1, a2, a3);
}

BOOL XBValidateResource(void *a1, void *a2, int a3, void *a4, _QWORD *a5)
{
  double v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _QWORD *v19;
  uint64_t v20;
  void *v21;
  __CFString *v22;
  __CFString *v23;
  id v24;
  void *v25;
  __CFString *v26;
  void *v27;
  uint64_t v28;
  __CFString *v29;
  __CFString *v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  XBLaunchImageError *v34;
  uint64_t v35;
  void *v36;
  XBLaunchImageError *v37;
  void *v38;
  _BOOL8 v39;
  void *v40;
  uint64_t v41;
  void *v42;
  id v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  void *v52;
  id v53;
  NSObject *v54;
  XBLaunchImageError *v55;
  _QWORD *v56;
  void *v57;
  double v58;
  double v59;
  NSObject *v60;
  void *v62;
  double v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  id v69;
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  SecStaticCodeRef staticCode;
  _BYTE v76[128];
  uint64_t v77;
  uint8_t buf[4];
  double v79;
  __int16 v80;
  id v81;
  __int16 v82;
  id v83;
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
  v9 = COERCE_DOUBLE(a1);
  v10 = a2;
  v11 = a4;
  staticCode = 0;
  XBLogCapture();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v79 = v9;
    v80 = 2114;
    v81 = v10;
    v82 = 2114;
    v83 = v11;
    _os_log_impl(&dword_217702000, v12, OS_LOG_TYPE_DEFAULT, "Validating resource %{public}@.%{public}@ in %{public}@", buf, 0x20u);
  }

  v13 = v11;
  objc_msgSend(0, "pathExtension");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", v10);

  if (v15)
  {
    objc_msgSend(*(id *)&v9, "stringByDeletingPathExtension");
    *(double *)&v16 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());

    v9 = *(double *)&v16;
  }
  objc_msgSend(v13, "pathForResource:ofType:", *(_QWORD *)&v9, v10);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v13;
  v69 = v13;
  if (v17
    || (objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        objc_msgSend(v18, "pathForResource:ofType:", *(_QWORD *)&v9, v10),
        (v17 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v19 = a5;
    v67 = v18;
    v68 = (void *)v17;
    objc_msgSend(v13, "bundleIdentifier");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    if (v20)
      v22 = (__CFString *)v20;
    else
      v22 = &stru_24D7F6BF0;
    v23 = v22;

    v24 = v13;
    objc_msgSend(v24, "infoDictionary");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKeyedSubscript:", *MEMORY[0x24BDBD2A0]);
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!v26)
    {
      objc_msgSend(v24, "infoDictionary");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectForKeyedSubscript:", *MEMORY[0x24BDBD1E0]);
      v28 = objc_claimAutoreleasedReturnValue();

      if (v28)
        v26 = (__CFString *)v28;
      else
        v26 = &stru_24D7F6BF0;
    }

    if (v26)
      v29 = v26;
    else
      v29 = &stru_24D7F6BF0;
    v30 = v29;

    v31 = SecStaticCodeCreateWithPath((CFURLRef)objc_msgSend(v24, "bundleURL"), 0, &staticCode);
    if ((_DWORD)v31)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to create SecStaticCodeRef: %d, %@ v%@"), v31, v23, v30);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      XBLogCapture();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        XBValidateResource_cold_1();

      v18 = v67;
      if (!v19)
      {
        v39 = 0;
        v40 = v68;
LABEL_46:

        goto LABEL_47;
      }
      v34 = [XBLaunchImageError alloc];
      objc_msgSend(v24, "bundleIdentifier");
      v35 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Bundle validation failed: %@"), v32);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v34;
      v38 = (void *)v35;
      *v19 = -[XBLaunchImageError initWithCode:bundleID:reason:fatal:](v37, "initWithCode:bundleID:reason:fatal:", 11, v35, v36, 0);

      v39 = 0;
      v40 = v68;
    }
    else
    {
      v40 = v68;
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v68);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v41 = objc_claimAutoreleasedReturnValue();
      v42 = (void *)v41;
      if (a3)
      {
        v65 = (void *)v41;
        v66 = v10;
        v43 = objc_alloc_init(MEMORY[0x24BDD1580]);
        v44 = *MEMORY[0x24BDBCC60];
        v77 = *MEMORY[0x24BDBCC60];
        v39 = 1;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v77, 1);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = v43;
        objc_msgSend(v43, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v32, v45, 4, 0);
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        v73 = 0u;
        v74 = 0u;
        v71 = 0u;
        v72 = 0u;
        v47 = v46;
        v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v71, v76, 16);
        if (v48)
        {
          v49 = v48;
          v62 = v32;
          v63 = v9;
          v50 = *(_QWORD *)v72;
          while (2)
          {
            for (i = 0; i != v49; ++i)
            {
              if (*(_QWORD *)v72 != v50)
                objc_enumerationMutation(v47);
              v52 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
              v70 = 0;
              objc_msgSend(v52, "getResourceValue:forKey:error:", &v70, v44, 0);
              v53 = v70;
              if ((objc_msgSend(v53, "BOOLValue") & 1) == 0 && !validateFile(v23, v30, v52, (uint64_t)staticCode, v19))
              {

                v39 = 0;
                goto LABEL_40;
              }

            }
            v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v71, v76, 16);
            if (v49)
              continue;
            break;
          }
          v39 = 1;
LABEL_40:
          v32 = v62;
          v9 = v63;
        }

        v10 = v66;
        v18 = v67;
        v40 = v68;
        v42 = v65;
      }
      else
      {
        v39 = validateFile(v23, v30, v32, (uint64_t)staticCode, v19);
        v18 = v67;
      }
      v57 = v42;
      objc_msgSend(v42, "timeIntervalSinceNow");
      v59 = v58;
      XBLogCapture();
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v79 = -v59;
        _os_log_impl(&dword_217702000, v60, OS_LOG_TYPE_DEFAULT, "Validated resource in %fs", buf, 0xCu);
      }

      CFRelease(staticCode);
      v38 = v57;
    }

    goto LABEL_46;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Could not find the resource '%@' in bundle %@."), *(_QWORD *)&v9, v18);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  XBLogCapture();
  v54 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    XBValidateResource_cold_1();

  if (!a5)
  {
    v39 = 0;
    goto LABEL_48;
  }
  v55 = [XBLaunchImageError alloc];
  objc_msgSend(v13, "bundleIdentifier");
  v56 = a5;
  v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Bundle validation couldn't find resource: %@"), v40);
  v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v39 = 0;
  *v56 = -[XBLaunchImageError initWithCode:bundleID:reason:fatal:](v55, "initWithCode:bundleID:reason:fatal:", 1, v23, v30, 0);
LABEL_47:

  v13 = v69;
LABEL_48:

  return v39;
}

BOOL XBValidateNib(void *a1, void *a2, _QWORD *a3)
{
  return XBValidateResource(a1, CFSTR("nib"), 0, a2, a3);
}

BOOL validateFile(void *a1, void *a2, void *a3, uint64_t a4, _QWORD *a5)
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  int v12;
  void *v13;
  NSObject *v14;
  XBLaunchImageError *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;

  v8 = a1;
  v9 = a2;
  v10 = a3;
  XBLogCapture();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    validateFile_cold_2();

  v12 = SecStaticCodeValidateResourceWithErrors();
  if (v12)
  {
    if (v12 == -67054)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Security error errSecCSBadResource reading resource from bundle: %@, path: '%@'"), v8, v10, v18, v19);
    }
    else if (v12 == -67062)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot validate resource. Bundle is not codesigned: %@, %@ v%@"), v10, v8, v9, v19);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Security error %ld reading resource from bundle: %@, %@ v%@"), objc_msgSend(0, "code"), v10, v8, v9);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  if (v13)
  {
    XBLogCapture();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      validateFile_cold_1();

    if (a5)
    {
      v15 = [XBLaunchImageError alloc];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Resource validation failed: %@"), v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *a5 = -[XBLaunchImageError initWithCode:bundleID:reason:fatal:](v15, "initWithCode:bundleID:reason:fatal:", 11, v8, v16, 0);

    }
  }

  return v13 == 0;
}

void XBDeleteLegacyCachesSnapshotPathForNonSandboxedApplicationsIfNeeded_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_217702000, log, OS_LOG_TYPE_ERROR, "Error deleting legacy cache snapshots path for non-sandboxed system apps %{public}@: %{public}@", (uint8_t *)&v3, 0x16u);
}

void _XBPreparedLaunchInterfaceForCapture_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "recursiveDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_217702000, a2, OS_LOG_TYPE_DEBUG, "dumping caar for view hierarchy:\n %@", (uint8_t *)&v4, 0xCu);

}

void XBValidateResource_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_217702000, v0, v1, "%{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void validateFile_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_217702000, v0, v1, "Resource validation error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void validateFile_cold_2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_217702000, v0, OS_LOG_TYPE_DEBUG, "Resource validation working on %@", v1, 0xCu);
  OUTLINED_FUNCTION_5();
}

uint64_t BSContinuousMachTimeNow()
{
  return MEMORY[0x24BE38128]();
}

uint64_t BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionaryWithKey()
{
  return MEMORY[0x24BE38130]();
}

uint64_t BSCreateDeserializedCFValueFromXPCDictionaryWithKey()
{
  return MEMORY[0x24BE38138]();
}

uint64_t BSDeserializeArrayOfBSXPCEncodableObjectsFromXPCDictionaryWithKey()
{
  return MEMORY[0x24BE38140]();
}

uint64_t BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey()
{
  return MEMORY[0x24BE38148]();
}

uint64_t BSDeserializeCGFloatFromXPCDictionaryWithKey()
{
  return MEMORY[0x24BE38150]();
}

uint64_t BSDeserializeCGSizeFromXPCDictionaryWithKey()
{
  return MEMORY[0x24BE38158]();
}

uint64_t BSDeserializeDataFromXPCDictionaryWithKey()
{
  return MEMORY[0x24BE38160]();
}

uint64_t BSDispatchBlockCreateWithQualityOfService()
{
  return MEMORY[0x24BE38168]();
}

uint64_t BSDispatchMain()
{
  return MEMORY[0x24BE38170]();
}

uint64_t BSDispatchQueueAssert()
{
  return MEMORY[0x24BE38178]();
}

uint64_t BSDispatchQueueCreateSerial()
{
  return MEMORY[0x24BE38180]();
}

uint64_t BSDispatchQueueCreateSerialWithQoS()
{
  return MEMORY[0x24BE38188]();
}

uint64_t BSDispatchQueueCreateWithQualityOfService()
{
  return MEMORY[0x24BE38190]();
}

uint64_t BSEarlierDate()
{
  return MEMORY[0x24BE38198]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x24BE381A0]();
}

uint64_t BSEqualStrings()
{
  return MEMORY[0x24BE381A8]();
}

uint64_t BSFloatEqualToFloat()
{
  return MEMORY[0x24BE381B0]();
}

uint64_t BSFloatIsZero()
{
  return MEMORY[0x24BE381B8]();
}

uint64_t BSPthreadCurrentEffectiveQualityOfService()
{
  return MEMORY[0x24BE381C0]();
}

uint64_t BSRadiansFromAffineTransform()
{
  return MEMORY[0x24BE381C8]();
}

uint64_t BSRectWithSize()
{
  return MEMORY[0x24BE381D0]();
}

uint64_t BSSerializeArrayOfBSXPCEncodableObjectsToXPCDictionaryWithKey()
{
  return MEMORY[0x24BE381D8]();
}

uint64_t BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey()
{
  return MEMORY[0x24BE381E0]();
}

uint64_t BSSerializeCFValueToXPCDictionaryWithKey()
{
  return MEMORY[0x24BE381E8]();
}

uint64_t BSSerializeCGFloatToXPCDictionaryWithKey()
{
  return MEMORY[0x24BE381F0]();
}

uint64_t BSSerializeCGSizeToXPCDictionaryWithKey()
{
  return MEMORY[0x24BE381F8]();
}

uint64_t BSSettingFlagDescription()
{
  return MEMORY[0x24BE38200]();
}

uint64_t BSSettingFlagForBool()
{
  return MEMORY[0x24BE38208]();
}

uint64_t BSSettingFlagIsYes()
{
  return MEMORY[0x24BE38210]();
}

uint64_t CAEncodeLayerTreeToFile()
{
  return MEMORY[0x24BDE5428]();
}

CATransform3D *__cdecl CATransform3DMakeAffineTransform(CATransform3D *__return_ptr retstr, CGAffineTransform *m)
{
  return (CATransform3D *)MEMORY[0x24BDE55C0](retstr, m);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x24BDBBCB0](allocator, capacity);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x24BDBC1B0](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

uint64_t CGImageCreateFromIOSurface()
{
  return MEMORY[0x24BDD9030]();
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x24BDD9048](idst, image, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x24BDD9078](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x24BDD9090](idst);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x24BDBE648](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x24BDBE680](image);
}

uint64_t CGImageGetImageProvider()
{
  return MEMORY[0x24BDBE690]();
}

uint64_t CGImageProviderCopyIOSurface()
{
  return MEMORY[0x24BDBE708]();
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x24BDBE770](image);
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x24BDBE778](image);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFE0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF040]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

FSEventStreamRef FSEventStreamCreate(CFAllocatorRef allocator, FSEventStreamCallback callback, FSEventStreamContext *context, CFArrayRef pathsToWatch, FSEventStreamEventId sinceWhen, CFTimeInterval latency, FSEventStreamCreateFlags flags)
{
  return (FSEventStreamRef)MEMORY[0x24BDC1470](allocator, callback, context, pathsToWatch, sinceWhen, *(_QWORD *)&flags, latency);
}

void FSEventStreamInvalidate(FSEventStreamRef streamRef)
{
  MEMORY[0x24BDC1490](streamRef);
}

void FSEventStreamRelease(FSEventStreamRef streamRef)
{
  MEMORY[0x24BDC1498](streamRef);
}

void FSEventStreamSetDispatchQueue(FSEventStreamRef streamRef, dispatch_queue_t q)
{
  MEMORY[0x24BDC14A0](streamRef, q);
}

Boolean FSEventStreamStart(FSEventStreamRef streamRef)
{
  return MEMORY[0x24BDC14A8](streamRef);
}

void FSEventStreamStop(FSEventStreamRef streamRef)
{
  MEMORY[0x24BDC14B0](streamRef);
}

uint64_t FigCreateCGImageFromIOSurface()
{
  return MEMORY[0x24BE15878]();
}

uint64_t FigCreateIOSurfaceFromJPEG()
{
  return MEMORY[0x24BE15880]();
}

OSType IOSurfaceGetPixelFormat(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8C80](buffer);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD0DD8]();
}

uint64_t NSLocalizedFileSizeDescription()
{
  return MEMORY[0x24BDD0FE0]();
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x24BDF6678]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

OSStatus SecStaticCodeCreateWithPath(CFURLRef path, SecCSFlags flags, SecStaticCodeRef *staticCode)
{
  return MEMORY[0x24BDE8D28](path, *(_QWORD *)&flags, staticCode);
}

uint64_t SecStaticCodeValidateResourceWithErrors()
{
  return MEMORY[0x24BDE8D30]();
}

uint64_t UIApplicationSceneClassicModeForString()
{
  return MEMORY[0x24BDF7580]();
}

uint64_t UIApplicationSceneCompatibilityModeForString()
{
  return MEMORY[0x24BDF7588]();
}

uint64_t UIApplicationSceneStringForClassicMode()
{
  return MEMORY[0x24BDF7590]();
}

uint64_t UIApplicationSceneStringForCompatibilityMode()
{
  return MEMORY[0x24BDF7598]();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x24BDF7928](image);
}

uint64_t UIStatusBarStyleIsDoubleHeight()
{
  return MEMORY[0x24BDF7DC0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _UIImageJPEGRepresentation()
{
  return MEMORY[0x24BDF8148]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t _bs_set_crash_log_message()
{
  return MEMORY[0x24BE38538]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x24BDACB00](dso, description, activity, *(_QWORD *)&flags);
}

void _os_activity_initiate(void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
  MEMORY[0x24BDACB10](dso, description, *(_QWORD *)&flags, activity_block);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC8](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED8](label, attr, target);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x24BDADF78](source);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

dispatch_workloop_t dispatch_workloop_create(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x24BDAE010](label);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x24BDAE2E8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x24BDAE358](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x24BDAE4D0](a1, a2, a3, *(_QWORD *)&a4);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAEB28](a1, a2);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x24BDAEF28](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x24BEDD070]();
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x24BDAF2A0](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x24BDAF2A8](state);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x24BDAF410](log, ptr);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x24BDAF438]();
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
  MEMORY[0x24BDAF450](lock);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x24BDAF458](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x24BDAF4D0]();
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAFEA8](a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x24BDB0558](*(_QWORD *)&__fd, __buf, __nbyte);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
  MEMORY[0x24BDB05E8](identifier, criteria, handler);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0908](xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0938](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x24BDB0978](xdict, key, value);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x24BDB09A8](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

