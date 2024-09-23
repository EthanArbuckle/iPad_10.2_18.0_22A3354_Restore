uint64_t start()
{
  void *v0;
  dispatch_semaphore_t v1;
  id v2;
  NSObject *v3;
  dispatch_time_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  FILE *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v16;
  _QWORD v17[4];
  NSObject *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;

  v0 = objc_autoreleasePoolPush();
  v1 = dispatch_semaphore_create(0);
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_100002368;
  v24 = sub_100002378;
  v25 = 0;
  v25 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v2 = objc_alloc_init((Class)TransparencyDaemon);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100002380;
  v17[3] = &unk_100004208;
  v19 = &v20;
  v3 = v1;
  v18 = v3;
  objc_msgSend(v2, "transparencySysDiagnose:", v17);
  v4 = dispatch_time(0, 2500000000);
  if (dispatch_semaphore_wait(v3, v4))
  {
    fwrite("tool timed out waiting for transparencyd, using fallback\n", 0x39uLL, 1uLL, __stderrp);
    v26 = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyFileSupport transparencyFilesPath:](TransparencyFileSupport, "transparencyFilesPath:", &v26));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("transparency_start.log"), 0));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "relativePath"));
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithContentsOfFile:encoding:error:](NSString, "stringWithContentsOfFile:encoding:error:", v7, 4, 0));

    if (v8)
    {
      v9 = __stdoutp;
      v8 = objc_retainAutorelease(v8);
      fprintf(v9, "%s\n", (const char *)objc_msgSend(v8, "UTF8String"));
      v10 = 0;
    }
    else
    {
      fwrite("Cant make JSON\n", 0xFuLL, 1uLL, __stderrp);
      v10 = 74;
    }
    goto LABEL_16;
  }
  v11 = (void *)v21[5];
  v16 = 0;
  v12 = v11;
  if (+[NSJSONSerialization isValidJSONObject:](NSJSONSerialization, "isValidJSONObject:", v12))
  {
    v13 = (id)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v12, 3, &v16));
    if (v13)
      v14 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v13, 4);
    else
      v14 = 0;
    goto LABEL_11;
  }
  v14 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorInternal, -26275, CFSTR("auditor report is not valid JSON")));
  NSLog(CFSTR("Bad report: %@"), v12);
  if (v14)
  {
    v13 = objc_retainAutorelease(v14);
    v14 = 0;
    v16 = v13;
LABEL_11:

  }
  v8 = v16;
  if (v14)
  {
    fprintf(__stdoutp, "%s\n", (const char *)objc_msgSend(objc_retainAutorelease(v14), "UTF8String"));
    v10 = 0;
  }
  else
  {
    fwrite("Cant make JSON\n", 0xFuLL, 1uLL, __stderrp);
    v10 = 74;
  }

LABEL_16:
  _Block_object_dispose(&v20, 8);

  objc_autoreleasePoolPop(v0);
  return v10;
}

void sub_100002348(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100002368(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100002378(uint64_t a1)
{

}

intptr_t sub_100002380(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addEntriesFromDictionary:", a2);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", CFSTR("false"), CFSTR("isFallback"));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000026B8(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.Transparency", "default");
  v2 = (void *)qword_100008680;
  qword_100008680 = (uint64_t)v1;

}

void sub_1000026E8(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.Transparency", "default");
  v2 = (void *)qword_100008680;
  qword_100008680 = (uint64_t)v1;

}

void sub_100002914(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.Transparency", "default");
  v2 = (void *)qword_100008680;
  qword_100008680 = (uint64_t)v1;

}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLByAppendingPathComponent_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByAppendingPathComponent:isDirectory:");
}

id objc_msgSend_URLsForDirectory_inDomains_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLsForDirectory:inDomains:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_dataWithContentsOfURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithContentsOfURL:options:error:");
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithJSONObject:options:error:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_deleteFile_inDirectory_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteFile:inDirectory:error:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithContentsOfURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithContentsOfURL:error:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_errorWithDomain_code_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:description:");
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileSystemRepresentation");
}

id objc_msgSend_getResourceValue_forKey_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getResourceValue:forKey:error:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_isValidJSONObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isValidJSONObject:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_readDictionaryFromFile_inDirectory_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readDictionaryFromFile:inDirectory:error:");
}

id objc_msgSend_relativePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "relativePath");
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setProtectionToClassDForURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProtectionToClassDForURL:error:");
}

id objc_msgSend_stringWithContentsOfFile_encoding_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithContentsOfFile:encoding:error:");
}

id objc_msgSend_transparencyFilesPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transparencyFilesPath:");
}

id objc_msgSend_transparencySysDiagnose_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transparencySysDiagnose:");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_writeDictionaryToFile_fileName_inDirectory_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeDictionaryToFile:fileName:inDirectory:error:");
}

id objc_msgSend_writeToURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:error:");
}
