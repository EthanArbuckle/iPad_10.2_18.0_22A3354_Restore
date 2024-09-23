@implementation FRFont

+ (unint64_t)_referenceCountForFontWithFileURL:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_referenceCountedSet"));
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100082218();
  v6 = objc_msgSend(v5, "countForObject:", v4);

  return (unint64_t)v6;
}

+ (BOOL)registerFontWithURL:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  char v9;
  _QWORD block[4];
  id v12;
  _QWORD *v13;
  uint64_t *v14;
  id v15;
  id *v16;
  _QWORD v17[5];
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v6 = a3;
  if (!v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100081DE0();
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = sub_100018684;
  v17[4] = sub_100018564;
  v18 = 0;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_registrationQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000145F8;
  block[3] = &unk_1000DDE40;
  v12 = v6;
  v13 = v17;
  v14 = &v19;
  v15 = a1;
  v16 = a4;
  v8 = v6;
  dispatch_sync(v7, block);

  v9 = *((_BYTE *)v20 + 24);
  _Block_object_dispose(v17, 8);

  _Block_object_dispose(&v19, 8);
  return v9;
}

+ (void)_increaseReferenceCountForFontWithFileURL:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;

  v4 = a3;
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100081F54();
  v5 = FRArticleLog;
  if (os_log_type_enabled((os_log_t)FRArticleLog, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Increasing reference count for font at URL %{public}@", (uint8_t *)&v7, 0xCu);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_referenceCountedSet"));
  objc_msgSend(v6, "addObject:", v4);

}

+ (id)_referenceCountedSet
{
  if (qword_10010A768 != -1)
    dispatch_once(&qword_10010A768, &stru_1000DDE60);
  return (id)qword_10010A770;
}

+ (id)_registrationQueue
{
  if (qword_10010A778 != -1)
    dispatch_once(&qword_10010A778, &stru_1000DDE80);
  return (id)qword_10010A780;
}

+ (void)unregisterFontWithURL:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100081E9C();
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_registrationQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100064934;
  v7[3] = &unk_1000DDD70;
  v8 = v4;
  v9 = a1;
  v6 = v4;
  dispatch_sync(v5, v7);

}

+ (void)_decreaseReferenceCountForFontWithFileURL:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  id v12;

  v4 = a3;
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100082160();
  v5 = FRArticleLog;
  if (os_log_type_enabled((os_log_t)FRArticleLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Decreasing reference count for font at URL %{public}@", buf, 0xCu);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_referenceCountedSet"));
  objc_msgSend(v6, "removeObject:", v4);
  if (objc_msgSend(a1, "_shouldUnregisterFontWithFileURL:", v4))
  {
    v10 = 0;
    v7 = objc_msgSend(a1, "_unregisterFontAtFileURL:error:", v4, &v10);
    v8 = v10;
    if ((v7 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1000820B0();
    v9 = (void *)FCDefaultLog;
    if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_ERROR))
      sub_10008200C(v9, v8);

  }
}

+ (BOOL)_shouldUnregisterFontWithFileURL:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_1000822D0();
  v5 = objc_msgSend(a1, "_referenceCountForFontWithFileURL:", v4) == 0;

  return v5;
}

+ (BOOL)_unregisterFontAtFileURL:(id)a3 error:(id *)a4
{
  const __CFURL *v5;
  NSObject *v6;
  BOOL v7;
  NSObject *v8;
  void *v9;
  CFIndex Code;
  void *v11;
  id v12;
  NSObject *v14;
  void *v15;
  CFErrorRef error;
  uint8_t buf[4];
  const __CFURL *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;

  v5 = (const __CFURL *)a3;
  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100082440();
  if (*a4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100082388();
  error = 0;
  v6 = FRArticleLog;
  if (os_log_type_enabled((os_log_t)FRArticleLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Attempting to unregister font at URL %{public}@", buf, 0xCu);
  }
  v7 = CTFontManagerUnregisterFontsForURL(v5, kCTFontManagerScopeProcess, &error);
  if (v7)
  {
    v8 = FRArticleLog;
    if (os_log_type_enabled((os_log_t)FRArticleLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v18 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Font unregistration succeeded for font at URL %{public}@", buf, 0xCu);
    }
    v9 = 0;
  }
  else
  {
    Code = CFErrorGetCode(error);
    if ((unint64_t)(Code - 201) > 2)
      v9 = 0;
    else
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("FRFontUnRegistationErrorDomain")));
    v11 = (void *)FRArticleLog;
    if (os_log_type_enabled((os_log_t)FRArticleLog, OS_LOG_TYPE_ERROR))
    {
      v14 = v11;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", Code));
      *(_DWORD *)buf = 138543874;
      v18 = v5;
      v19 = 2114;
      v20 = v9;
      v21 = 2114;
      v22 = v15;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to unregister font at URL %{public}@ with error %{public}@ underlying error code: %{public}@", buf, 0x20u);

    }
  }
  if (error)
    CFRelease(error);
  v12 = objc_retainAutorelease(v9);
  *a4 = v12;

  return v7;
}

+ (id)_postScriptNameForFontAtFileURL:(id)a3
{
  const __CFURL *v3;
  const __CFArray *FontDescriptorsFromURL;
  const __CTFontDescriptor *ValueAtIndex;
  void *v6;
  CFTypeID v7;
  id v8;

  v3 = (const __CFURL *)a3;
  if (!v3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100082658();
  FontDescriptorsFromURL = CTFontManagerCreateFontDescriptorsFromURL(v3);
  if (CFArrayGetCount(FontDescriptorsFromURL) != 1
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1000825A8();
  }
  ValueAtIndex = (const __CTFontDescriptor *)CFArrayGetValueAtIndex(FontDescriptorsFromURL, 0);
  v6 = (void *)CTFontDescriptorCopyAttribute(ValueAtIndex, kCTFontNameAttribute);
  v7 = CFGetTypeID(v6);
  if (v7 != CFStringGetTypeID() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_1000824F8();
  CFRelease(FontDescriptorsFromURL);
  v8 = v6;
  CFRelease(v8);

  return v8;
}

@end
