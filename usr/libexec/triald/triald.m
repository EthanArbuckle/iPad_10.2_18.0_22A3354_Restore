uint64_t start()
{
  void *v0;
  id v1;
  int v3;
  _DWORD v4[2];

  v0 = objc_autoreleasePoolPush();
  if ((_set_user_dir_suffix("com.apple.triald") & 1) == 0
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v3 = *__error();
    v4[0] = 67109120;
    v4[1] = v3;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to set private sandbox for com.apple.triald, errno: %d", (uint8_t *)v4, 8u);
  }
  v1 = NSTemporaryDirectory();
  objc_autoreleasePoolPop(v0);
  TRIDServerRun();
  return 0;
}

void sub_10000323C(uint64_t a1)
{
  void *v2;
  objc_class *v3;
  objc_method *InstanceMethod;
  objc_method *v5;
  void *v6;
  void *v7;

  v2 = objc_autoreleasePoolPush();
  v3 = (objc_class *)objc_opt_class(*(_QWORD *)(a1 + 32));
  InstanceMethod = class_getInstanceMethod(v3, "descriptionWithLocale:");
  if (!InstanceMethod)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("TRIDaemonScopedSwizzling.m"), 28, CFSTR("failed to lookup -[NSDate descriptionWithLocale:]"));

  }
  v5 = class_getInstanceMethod(v3, "tri_memoryFriendlyDescriptionWithLocale:");
  if (!v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("TRIDaemonScopedSwizzling.m"), 30, CFSTR("failed to lookup -[NSDate tri_memoryFriendlyDescriptionWithLocale:]"));

  }
  method_exchangeImplementations(InstanceMethod, v5);
  objc_autoreleasePoolPop(v2);
}

id sub_1000034B4(uint64_t a1)
{
  void *v2;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "tri_memoryFriendlyDescriptionWithLocale:", *(_QWORD *)(a1 + 40)));
  if (!v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("TRIDaemonScopedSwizzling.m"), 53, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("[self tri_memoryFriendlyDescriptionWithLocale:locale]"));

  }
  return v2;
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentHandler");
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_initWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUTF8String:");
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSince1970");
}

id objc_msgSend_tri_memoryFriendlyDescriptionWithLocale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tri_memoryFriendlyDescriptionWithLocale:");
}
