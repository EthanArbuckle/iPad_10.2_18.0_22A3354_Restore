void sub_100002874(uint64_t a1)
{
  NSString *v1;
  os_log_t v2;
  void *v3;
  id v4;

  v1 = NSStringFromClass(*(Class *)(a1 + 32));
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v1));
  v2 = os_log_create("com.apple.email", (const char *)objc_msgSend(v4, "UTF8String"));
  v3 = (void *)qword_100008668;
  qword_100008668 = (uint64_t)v2;

}

void sub_1000028D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_10000292C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)MFDiagnosticExtension;
  -[_Unwind_Exception dealloc](&a9, "dealloc");
  _Unwind_Resume(a1);
}

void sub_100002B88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

id sub_100002BE8(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", a2);
}

void sub_100002C40(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100002FF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1000030E4(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error getting contents of %{public}@, error: %{public}@", buf, 0x16u);

}

void sub_100003148(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error requesting diagnostics: %{public}@", (uint8_t *)&v2, 0xCu);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend__attachmentForURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_attachmentForURL:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_attachmentWithPathURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attachmentWithPathURL:");
}

id objc_msgSend_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_daemonInterface(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "daemonInterface");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_diagnosticInfoGatherer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "diagnosticInfoGatherer");
}

id objc_msgSend_ef_addOptionalObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ef_addOptionalObject:");
}

id objc_msgSend_future(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "future");
}

id objc_msgSend_gatherDiagnosticsWithOptions_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "gatherDiagnosticsWithOptions:completionHandler:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "log");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_promise(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "promise");
}

id objc_msgSend_requestDiagnostics_isSensitiveCollectionAllowed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestDiagnostics:isSensitiveCollectionAllowed:");
}

id objc_msgSend_resultWithTimeout_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resultWithTimeout:error:");
}

id objc_msgSend_setDaemonInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDaemonInterface:");
}

id objc_msgSend_setDeleteOnAttach_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeleteOnAttach:");
}

id objc_msgSend_startAccessingSecurityScopedResource(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startAccessingSecurityScopedResource");
}

id objc_msgSend_stopAccessingSecurityScopedResource(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopAccessingSecurityScopedResource");
}
