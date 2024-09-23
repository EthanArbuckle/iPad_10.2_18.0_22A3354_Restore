void sub_10000214C(void *a1, NSObject *a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &buf, 0x26u);
}

void sub_1000025D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,char a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a66;
  char a72;

  _Block_object_dispose(&a60, 8);
  _Block_object_dispose(&a66, 8);
  _Block_object_dispose(&a72, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100002620(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100002630(uint64_t a1)
{

}

void sub_100002638(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;

  v5 = a2;
  v4 = objc_opt_class(NSURL);
  if ((objc_opt_isKindOfClass(v5, v4) & 1) != 0)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void sub_1000026A4(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;

  v5 = a2;
  v4 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v5, v4) & 1) != 0)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void sub_100002710(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;

  v5 = a2;
  v4 = objc_opt_class(NSURL);
  if ((objc_opt_isKindOfClass(v5, v4) & 1) != 0)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void sub_10000277C(uint64_t a1)
{
  id v2;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_openNewsArticleWithURL:");
  }
  else
  {
    v2 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 3328, 0));
    objc_msgSend(*(id *)(a1 + 40), "cancelRequestWithError:", v2);

  }
}

void sub_1000028BC(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[FCFeldsparIDProvider sharedInstance](FCFeldsparIDProvider, "sharedInstance"));
  v2 = objc_alloc((Class)FCConfigurationManager);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FCContextConfiguration defaultConfiguration](FCContextConfiguration, "defaultConfiguration"));
  v4 = objc_msgSend(v2, "initWithContextConfiguration:contentHostDirectoryFileURL:feldsparIDProvider:", v3, *(_QWORD *)(a1 + 32), v6);
  v5 = (void *)qword_10000D780;
  qword_10000D780 = (uint64_t)v4;

}

void sub_100002A24(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "extensionContext"));
  objc_msgSend(v1, "completeRequestReturningItems:completionHandler:", 0, 0);

}

void sub_100003ABC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100003B00(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100003B10(uint64_t a1)
{

}

void sub_100003B18(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id obj;

  v6 = a2;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "filePath"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v7, 0));
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "URLByAppendingPathComponent:isDirectory:", v10, 0));
      v12 = *(void **)(a1 + 40);
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      obj = *(id *)(v13 + 40);
      objc_msgSend(v12, "copyItemAtURL:toURL:error:", v8, v11, &obj);
      objc_storeStrong((id *)(v13 + 40), obj);
      v14 = *(void **)(a1 + 48);
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "remoteURL"));
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v11, v15);

      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
        *a4 = 1;

    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100004D20();
  }

}

id sub_100004158(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "assetHandleForURL:prefetchedFileURL:importMethod:lifetimeHint:", a2, a3, 0, 0);
}

void sub_100004460(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  uint8_t buf[4];
  void *v19;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL nss_NewsURLForArticleID:internal:targetIsVideo:hardPaywall:](NSURL, "nss_NewsURLForArticleID:internal:targetIsVideo:hardPaywall:", v5, 0, 0, 1));
    v8 = (void *)FCOpenInNewsLog;
    if (!os_log_type_enabled(FCOpenInNewsLog, OS_LOG_TYPE_INFO))
      goto LABEL_7;
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "absoluteString"));
    *(_DWORD *)buf = 138412290;
    v19 = v10;
    v11 = "Open article in News %@";
  }
  else
  {
    v17 = CFSTR("openinnewserror");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL nss_NewsURLWithPathComponents:internal:](NSURL, "nss_NewsURLWithPathComponents:internal:", v12, 0));

    v13 = (void *)FCOpenInNewsLog;
    if (!os_log_type_enabled(FCOpenInNewsLog, OS_LOG_TYPE_INFO))
      goto LABEL_7;
    v14 = *(void **)(a1 + 32);
    v9 = v13;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "absoluteString"));
    *(_DWORD *)buf = 138412290;
    v19 = v10;
    v11 = "Unable to open in News %@";
  }
  _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, v11, buf, 0xCu);

LABEL_7:
  v15 = *(_QWORD *)(a1 + 40);
  if (v15)
    (*(void (**)(void))(v15 + 16))();
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  objc_msgSend(v16, "openSensitiveURL:withOptions:", v7, 0);

}

void sub_1000046A8()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("invalid nil value for '%s'"));
  sub_10000218C();
  sub_10000217C();
  sub_10000215C();
  sub_10000214C((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"contentContext", v6, 2u);

  sub_100002170();
}

void sub_100004760()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_10000218C();
  sub_10000217C();
  sub_10000215C();
  sub_10000214C((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"flintDocumentURLAssetHandlesByRemoteURL", v6, 2u);

  sub_100002170();
}

void sub_100004818()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_10000218C();
  sub_10000217C();
  sub_10000215C();
  sub_10000214C((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"JSONArray", v6, 2u);

  sub_100002170();
}

void sub_1000048D0()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_10000218C();
  sub_10000217C();
  sub_10000215C();
  sub_10000214C((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"assetManager", v6, 2u);

  sub_100002170();
}

void sub_100004988()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_10000218C();
  sub_10000217C();
  sub_10000215C();
  sub_10000214C((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"assetHandlesByRemoteURL", v6, 2u);

  sub_100002170();
}

void sub_100004A40()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_10000218C();
  sub_10000217C();
  sub_10000215C();
  sub_10000214C((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"encodableElement", v6, 2u);

  sub_100002170();
}

void sub_100004AF8()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_10000218C();
  sub_10000217C();
  sub_10000215C();
  sub_10000214C((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"JSONArray", v6, 2u);

  sub_100002170();
}

void sub_100004BB0()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_10000218C();
  sub_10000217C();
  sub_10000215C();
  sub_10000214C((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sharedDirectoryFileURL", v6, 2u);

  sub_100002170();
}

void sub_100004C68()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_10000218C();
  sub_10000217C();
  sub_10000215C();
  sub_10000214C((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"referralItem", v6, 2u);

  sub_100002170();
}

void sub_100004D20()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("invalid nil value for '%s'"));
  sub_10000218C();
  sub_10000217C();
  sub_10000215C();
  sub_10000214C((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"sourceFilePath", v6, 2u);

  sub_100002170();
}

void sub_100004DD8()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_10000218C();
  sub_10000217C();
  sub_10000215C();
  sub_10000214C((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"assetManager", v6, 2u);

  sub_100002170();
}

void sub_100004E90()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_10000218C();
  sub_10000217C();
  sub_10000215C();
  sub_10000214C((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"queryValue", v6, 2u);

  sub_100002170();
}

void sub_100004F48()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_10000218C();
  sub_10000217C();
  sub_10000215C();
  sub_10000214C((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"itemClass", v6, 2u);

  sub_100002170();
}

id objc_msgSend_JSONArray(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "JSONArray");
}

id objc_msgSend_URLByAppendingPathComponent_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByAppendingPathComponent:isDirectory:");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDString");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allValues");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_articleRecordData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "articleRecordData");
}

id objc_msgSend_asChannel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "asChannel");
}

id objc_msgSend_assetHandles(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetHandles");
}

id objc_msgSend_assetManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetManager");
}

id objc_msgSend_attachments(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attachments");
}

id objc_msgSend_cancelRequestWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelRequestWithError:");
}

id objc_msgSend_completeRequestReturningItems_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "completeRequestReturningItems:completionHandler:");
}

id objc_msgSend_configurationManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configurationManager");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_copyItemAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyItemAtURL:toURL:error:");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_decodeObjectOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeObjectOfClasses:forKey:");
}

id objc_msgSend_defaultConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultConfiguration");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultWorkspace");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_encodableElement(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodableElement");
}

id objc_msgSend_encodableElementClass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodableElementClass");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_exceptionWithName_reason_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exceptionWithName:reason:userInfo:");
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionContext");
}

id objc_msgSend_fc_dictionaryByTransformingValuesWithKeyAndValueBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fc_dictionaryByTransformingValuesWithKeyAndValueBlock:");
}

id objc_msgSend_filePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filePath");
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:isDirectory:");
}

id objc_msgSend_flintDocumentURLAssetHandlesByRemoteURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "flintDocumentURLAssetHandlesByRemoteURL");
}

id objc_msgSend_hasItemConformingToTypeIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasItemConformingToTypeIdentifier:");
}

id objc_msgSend_initWithArticleID_sourceChannelID_sectionData_flintDocumentAssetHandle_articleRecordData_sourceChannelRecordData_parentIssueRecordData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithArticleID:sourceChannelID:sectionData:flintDocumentAssetHandle:articleRecordData:sourceChannelRecordData:parentIssueRecordData:");
}

id objc_msgSend_initWithArticleRecordData_sourceChannel_parentIssue_assetManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithArticleRecordData:sourceChannel:parentIssue:assetManager:");
}

id objc_msgSend_initWithBase64EncodedString_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBase64EncodedString:options:");
}

id objc_msgSend_initWithConfigurationManager_cachesDirectoryURL_networkReachability_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithConfigurationManager:cachesDirectoryURL:networkReachability:");
}

id objc_msgSend_initWithConfigurationManager_networkReachability_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithConfigurationManager:networkReachability:");
}

id objc_msgSend_initWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContentsOfURL:");
}

id objc_msgSend_initWithContextConfiguration_contentHostDirectoryFileURL_feldsparIDProvider_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContextConfiguration:contentHostDirectoryFileURL:feldsparIDProvider:");
}

id objc_msgSend_initWithData_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:context:");
}

id objc_msgSend_initWithData_sourceChannel_assetManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:sourceChannel:assetManager:");
}

id objc_msgSend_initWithEncodableElement_assetHandlesByRemoteURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEncodableElement:assetHandlesByRemoteURL:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithJSONArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithJSONArray:");
}

id objc_msgSend_initWithName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:");
}

id objc_msgSend_inputItems(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputItems");
}

id objc_msgSend_loadItemForTypeIdentifier_options_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadItemForTypeIdentifier:options:completionHandler:");
}

id objc_msgSend_myEncodableElement(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "myEncodableElement");
}

id objc_msgSend_networkReachability(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "networkReachability");
}

id objc_msgSend_nss_NewsURLForArticleID_internal_targetIsVideo_hardPaywall_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nss_NewsURLForArticleID:internal:targetIsVideo:hardPaywall:");
}

id objc_msgSend_nss_NewsURLWithPathComponents_internal_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nss_NewsURLWithPathComponents:internal:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_openArticleWithURL_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openArticleWithURL:completion:");
}

id objc_msgSend_openSensitiveURL_withOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openSensitiveURL:withOptions:");
}

id objc_msgSend_parentIssueRecordData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parentIssueRecordData");
}

id objc_msgSend_referralItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "referralItem");
}

id objc_msgSend_remoteURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteURL");
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_resolveWebURL_withQualityOfService_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resolveWebURL:withQualityOfService:completion:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_sharedDirectoryFileURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedDirectoryFileURL");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedNetworkReachability(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedNetworkReachability");
}

id objc_msgSend_slowCachedTagForID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "slowCachedTagForID:");
}

id objc_msgSend_sourceChannelID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sourceChannelID");
}

id objc_msgSend_sourceChannelRecordData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sourceChannelRecordData");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_tagController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tagController");
}

id objc_msgSend_unarchivedObjectOfClasses_fromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unarchivedObjectOfClasses:fromData:error:");
}

id objc_msgSend_uniqueKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uniqueKey");
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:options:error:");
}
