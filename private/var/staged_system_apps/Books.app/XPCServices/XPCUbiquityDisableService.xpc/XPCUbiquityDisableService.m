int main(int argc, const char **argv, const char **envp)
{
  ServiceDelegate *v3;
  void *v4;

  v3 = objc_opt_new(ServiceDelegate);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](NSXPCListener, "serviceListener"));
  objc_msgSend(v4, "setDelegate:", v3);
  objc_msgSend(v4, "resume");

  return 0;
}

id BKDisableiCloudServiceLog()
{
  if (qword_100008798 != -1)
    dispatch_once(&qword_100008798, &stru_100004128);
  return (id)qword_100008790;
}

void sub_100002F60(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.iBooks", "DisableiCloudService");
  v2 = (void *)qword_100008790;
  qword_100008790 = (uint64_t)v1;

}

void sub_1000034B4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1000034CC(char a1, uint64_t a2, os_log_t log)
{
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  __int16 v6;
  uint64_t v7;

  v3 = CFSTR("YES");
  if ((a1 & 1) == 0)
    v3 = CFSTR("NO");
  v4 = 138412546;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to set iCloud enabled to %@ for %{public}@.", (uint8_t *)&v4, 0x16u);
  sub_1000034C4();
}

void sub_100003564(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000034B4((void *)&_mh_execute_header, a2, a3, "_isServiceDisabled(%{public}@): TCC returned a NULL array!", a5, a6, a7, a8, 2u);
  sub_1000034C4();
}

id objc_msgSend__isBundleIdentifierInArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isBundleIdentifierInArray:");
}

id objc_msgSend__isServiceDisabledAlternative_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isServiceDisabledAlternative:");
}

id objc_msgSend__isServiceEnabledAlternative_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isServiceEnabledAlternative:");
}

id objc_msgSend__setService_enabled_withReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setService:enabled:withReply:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceListener");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedObject:");
}
, v9, OS_LOG_TYPE_DEFAULT, "Setting iCloud enabled to %@ for %{public}@.", (uint8_t *)&v14, 0x16u);
  }

  if (TCCAccessSetForBundleId(a3, CFSTR("com.apple.iBooks"), v5))
  {
    v11 = 0;
    if (v7)
LABEL_7:
      v7[2](v7, v11);
  }
  else
  {
    v12 = BKDisableiCloudServiceLog();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1000034CC(v5, (uint64_t)a3, v13);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("XPCUbiquityDisableServiceErrorDomain"), 0, 0));
    if (v7)
      goto LABEL_7;
  }

}

- (BOOL)_isBundleIdentifierInArray:(__CFArray *)a3
{
  CFIndex Count;
  unint64_t v5;
  CFIndex v6;
  BOOL v7;
  const __CFString *ValueAtIndex;
  CFTypeID v9;

  Count = CFArrayGetCount(a3);
  if (Count)
  {
    v5 = Count;
    v6 = 0;
    v7 = 1;
    do
    {
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a3, v6);
      v9 = CFGetTypeID(ValueAtIndex);
      if (v9 == CFStringGetTypeID()
        && CFStringCompare(ValueAtIndex, CFSTR("com.apple.iBooks"), 0) == kCFCompareEqualTo)
      {
        break;
      }
      v7 = ++v6 < v5;
    }
    while (v5 != v6);
  }
  else
  {
    return 0;
  }
  return v7;
}

- (BOOL)_isServiceEnabledAlternative:(__CFString *)a3
{
  uint64_t v5;
  const void *v6;
  BOOL v7;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v5 = TCCAccessCopyBundleIdentifiersForService(a3, a2);
  if (v5)
  {
    v6 = (const void *)v5;
    v7 = -[XPCUbiquityDisableService _isBundleIdentifierInArray:](self, "_isBundleIdentifierInArray:", v5);
    CFRelease(v6);
    return v7;
  }
  else
  {
    v9 = BKDisableiCloudServiceLog();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_100003564((uint64_t)a3, v10, v11, v12, v13, v14, v15, v16);

    return 0;
  }
}

- (BOOL)_isServiceDisabledAlternative:(__CFString *)a3
{
  uint64_t v5;
  const void *v6;
  BOOL v7;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v5 = TCCAccessCopyBundleIdentifiersDisabledForService(a3, a2);
  if (v5)
  {
    v6 = (const void *)v5;
    v7 = -[XPCUbiquityDisableService _isBundleIdentifierInArray:](self, "_isBundleIdentifierInArray:", v5);
    CFRelease(v6);
    return v7;
  }
  else
  {
    v9 = BKDisableiCloudServiceLog();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_100003564((uint64_t)a3, v10, v11, v12, v13, v14, v15, v16);

    return 1;
  }
}

@end
