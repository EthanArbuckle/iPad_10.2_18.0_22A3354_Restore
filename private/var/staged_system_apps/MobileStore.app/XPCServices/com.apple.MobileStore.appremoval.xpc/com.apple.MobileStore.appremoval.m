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

id OS_LOG_XPCAPPREMOVAL()
{
  if (qword_100008A60 != -1)
    dispatch_once(&qword_100008A60, &stru_1000040F8);
  return (id)qword_100008A58;
}

void sub_10000330C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create((const char *)objc_msgSend(CFSTR("com.apple.MobileStore"), "UTF8String"), "XPCAppRemovalService");
  v2 = (void *)qword_100008A58;
  qword_100008A58 = (uint64_t)v1;

}

void sub_10000360C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100003624(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000360C((void *)&_mh_execute_header, a1, a3, "Successfully completed AppRemoval for %@", a5, a6, a7, a8, 2u);
  sub_10000361C();
}

void sub_100003694(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000360C((void *)&_mh_execute_header, a2, a3, "Error: %@", a5, a6, a7, a8, 2u);
  sub_10000361C();
}

void sub_1000036F8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000360C((void *)&_mh_execute_header, a1, a3, "Removing User Defaults for %@", a5, a6, a7, a8, 2u);
  sub_10000361C();
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend__deleteAllUserDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_deleteAllUserDefaults");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryRepresentation");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
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

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synchronize");
}
