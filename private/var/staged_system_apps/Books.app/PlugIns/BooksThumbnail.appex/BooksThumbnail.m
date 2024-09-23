id BooksThumbsLog(void)
{
  if (qword_1000081D8 != -1)
    dispatch_once(&qword_1000081D8, &stru_1000041B0);
  return (id)qword_1000081D0;
}

void sub_1000028C0(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.iBooks", "BooksThumbs");
  v2 = (void *)qword_1000081D0;
  qword_1000081D0 = (uint64_t)v1;

}

void sub_100002D88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  _Unwind_Resume(a1);
}

id sub_100002E84(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a1;
  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", CFSTR("iTunesArtwork"), 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](NSData, "dataWithContentsOfURL:", v5));
  if (!v6)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "path"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BLLibrary defaultBookLibrary](BLLibrary, "defaultBookLibrary"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v7));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_perUserBookURLForBookURL:", v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "path"));
    v12 = objc_msgSend(v11, "mutableCopy");

    if ((objc_msgSend(v12, "hasSuffix:", CFSTR("/")) & 1) == 0)
      objc_msgSend(v12, "appendString:", CFSTR("/"));
    operator new();
  }

  return v6;
}

void sub_100003144(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

uint64_t sub_100003220(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "drawInRect:", 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48));
  return 1;
}

void sub_10000324C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_100003280()
{
  uint64_t v0;
  os_log_t v1;

  sub_100003260();
  sub_10000324C((void *)&_mh_execute_header, v0, v1, "Error getting cover image from image data for URL: %@ Error: %@");
  sub_100003278();
}

void sub_1000032E0(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid src or dst size passed in", v1, 2u);
}

void sub_100003320()
{
  uint64_t v0;
  os_log_t v1;

  sub_100003260();
  sub_10000324C((void *)&_mh_execute_header, v0, v1, "Unable to create '%@' due to %@");
  sub_100003278();
}

void sub_100003380(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Encountered an error while trying to get cover image data: %{public}@", (uint8_t *)&v2, 0xCu);
  sub_100003278();
}

void operator delete()
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

id objc_msgSend_URLByAppendingPathComponent_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByAppendingPathComponent:isDirectory:");
}

id objc_msgSend__perUserBookURLForBookURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_perUserBookURLForBookURL:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendString:");
}

id objc_msgSend_bu_nonCollidingNameForFileName_inDestPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bu_nonCollidingNameForFileName:inDestPath:");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentDevice");
}

id objc_msgSend_dataWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithContentsOfFile:");
}

id objc_msgSend_dataWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithContentsOfURL:");
}

id objc_msgSend_defaultBookLibrary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultBookLibrary");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_drawInRect_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "drawInRect:");
}

id objc_msgSend_extractArchiveFromURL_toURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extractArchiveFromURL:toURL:options:error:");
}

id objc_msgSend_fileURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURL");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_initWithData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:");
}

id objc_msgSend_isZipArchiveAtURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isZipArchiveAtURL:error:");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_maximumSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maximumSize");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_purchasesRepositoryPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "purchasesRepositoryPath");
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_replyWithContextSize_currentContextDrawingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "replyWithContextSize:currentContextDrawingBlock:");
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "size");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInterfaceIdiom");
}
