id FRDiagnosticFileManagerCreate(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("group.com.apple.news")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library/Caches/Diagnostics"), 1));

  v5 = objc_msgSend(objc_alloc((Class)TFDiagnosticFileManager), "initWithDiagnosticDumpDir:diagnosticDumpNotificationName:log:", v4, CFSTR("NewsDiagnosticExtensionAttachmentRequestNotification"), v1);
  return v5;
}

id objc_msgSend_URLByAppendingPathComponent_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByAppendingPathComponent:isDirectory:");
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

id objc_msgSend_attachmentsFromDiagnosticFiles_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attachmentsFromDiagnosticFiles:");
}

id objc_msgSend_availableDiagnosticFiles(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "availableDiagnosticFiles");
}

id objc_msgSend_containerURLForSecurityApplicationGroupIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containerURLForSecurityApplicationGroupIdentifier:");
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

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_diagnosticDumpNotifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "diagnosticDumpNotifier");
}

id objc_msgSend_diagnosticFileManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "diagnosticFileManager");
}

id objc_msgSend_initWithDiagnosticDumpDir_diagnosticDumpNotificationName_log_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDiagnosticDumpDir:diagnosticDumpNotificationName:log:");
}

id objc_msgSend_initWithNotificationName_diagnosticFileManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithNotificationName:diagnosticFileManager:");
}

id objc_msgSend_sleepForTimeInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sleepForTimeInterval:");
}

id objc_msgSend_triggerDiagnosticFileDump(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "triggerDiagnosticFileDump");
}
, "Found %u files for diagnostics", (uint8_t *)v15, 8u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NewsDiagnosticExtension attachmentsFromDiagnosticFiles:](self, "attachmentsFromDiagnosticFiles:", v9));

  return v13;
}

- (id)attachmentsFromDiagnosticFiles:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v3, "count")));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[DEAttachmentItem attachmentWithPath:](DEAttachmentItem, "attachmentWithPath:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9), (_QWORD)v13));
        objc_msgSend(v4, "addObject:", v10);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = objc_msgSend(v4, "copy");
  return v11;
}

- (TFInterprocessDiagnosticDumpNotifier)diagnosticDumpNotifier
{
  return self->_diagnosticDumpNotifier;
}

- (TFDiagnosticFileManager)diagnosticFileManager
{
  return self->_diagnosticFileManager;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_diagnosticFileManager, 0);
  objc_storeStrong((id *)&self->_diagnosticDumpNotifier, 0);
}

@end
