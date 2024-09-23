void sub_10000360C(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Received unknown notification with category: %@ and action: %@", (uint8_t *)&v3, 0x16u);
}

id objc_msgSend_actionIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionIdentifier");
}

id objc_msgSend_actionWithIdentifier_title_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionWithIdentifier:title:options:");
}

id objc_msgSend_actionWithIdentifier_title_options_icon_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionWithIdentifier:title:options:icon:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_categoryIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "categoryIdentifier");
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "content");
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionContext");
}

id objc_msgSend_iconWithSystemImageName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "iconWithSystemImageName:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_notification(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notification");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_openURL_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openURL:completionHandler:");
}

id objc_msgSend_personalRequestsOptInURLForHomeID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "personalRequestsOptInURLForHomeID:");
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "request");
}

id objc_msgSend_setNotificationActions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNotificationActions:");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}
