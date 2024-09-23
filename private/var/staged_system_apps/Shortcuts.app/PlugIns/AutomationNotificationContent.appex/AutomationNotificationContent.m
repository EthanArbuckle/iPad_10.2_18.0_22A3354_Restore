void sub_1000033B8(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "isEnabled"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_allConfiguredTriggers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allConfiguredTriggers");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_categoryIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "categoryIdentifier");
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "content");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_defaultDatabase(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultDatabase");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_estimatedSizeForNotificationUserInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "estimatedSizeForNotificationUserInfo:");
}

id objc_msgSend_initWithDatabase_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDatabase:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initializeProcessWithDatabase_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initializeProcessWithDatabase:");
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEnabled");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_preferredSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredSize");
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "request");
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutoresizingMask:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setPreferredContentSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreferredContentSize:");
}

id objc_msgSend_setView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setView:");
}

id objc_msgSend_updateUIFromNotification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateUIFromNotification:");
}

id objc_msgSend_updateUIFromNotificationUserInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateUIFromNotificationUserInfo:");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}
