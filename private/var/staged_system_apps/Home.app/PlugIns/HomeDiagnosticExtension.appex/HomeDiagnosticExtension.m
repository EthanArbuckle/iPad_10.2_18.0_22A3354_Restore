void sub_100003670(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100003680(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003670((void *)&_mh_execute_header, a1, a3, "Unable to find directory: %@.", a5, a6, a7, a8, 2u);
}

void sub_1000036EC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003670((void *)&_mh_execute_header, a2, a3, "Unable to find contents in directory: %@.", a5, a6, a7, a8, 2u);
}

id objc_msgSend__notifyHomeApps(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_notifyHomeApps");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_attachmentWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attachmentWithPath:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsString:");
}

id objc_msgSend_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_dateFromString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateFromString:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_fileURLWithPath_isDirectory_relativeToURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:isDirectory:relativeToURL:");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastObject");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDateFormat:");
}

id objc_msgSend_sleepForTimeInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sleepForTimeInterval:");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceNow");
}
          v51 = v16;
                v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "componentsSeparatedByString:", CFSTR("_")));
                v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", (char *)objc_msgSend(v17, "count") - 2));
                v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "lastObject"));
                v50 = (void *)v18;
                v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), v18, v19));
                v21 = objc_alloc_init((Class)NSDateFormatter);
                objc_msgSend(v21, "setDateFormat:", CFSTR("MM-dd-yyyy_HH:mm:ss"));
                v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "dateFromString:", v20));
                objc_msgSend(v22, "timeIntervalSinceNow");
                if (v23 > -18000.0)
                {
                  v24 = v11;
                  v25 = v8;
                  v26 = (void *)objc_claimAutoreleasedReturnValue(+[DEAttachmentItem attachmentWithPath:](DEAttachmentItem, "attachmentWithPath:", v14));
                  objc_msgSend(v47, "addObject:", v26);

                  v8 = v25;
                  v11 = v24;
                }

                v12 = v48;
                v10 = v49;
              }

              v13 = (char *)v13 + 1;
            }
            while (v10 != v13);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
          }
          while (v10);
        }

        v27 = objc_msgSend(v47, "copy");
        v4 = v45;
        v3 = v46;
        v6 = v43;
        v7 = v44;
        goto LABEL_24;
      }
    }
    else
    {
      v35 = self->_log;
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        sub_1000036EC((uint64_t)v7, v35, v36, v37, v38, v39, v40, v41);
    }
    v27 = &__NSArray0__struct;
LABEL_24:

    goto LABEL_25;
  }
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    sub_100003680(log, v28, v29, v30, v31, v32, v33, v34);
  v7 = 0;
  v27 = &__NSArray0__struct;
LABEL_25:

  return v27;
}

- (void)_notifyHomeApps
{
  NSObject *log;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint8_t v4[16];

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Posting kHomeDiagnosticExtensionAttachmentRequestNotification", v4, 2u);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("HomeDiagnosticExtensionAttachmentRequestNotification"), 0, 0, 1u);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
}

@end
