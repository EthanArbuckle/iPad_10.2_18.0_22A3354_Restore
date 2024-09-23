void sub_1000027D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1000027EC(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  dispatch_semaphore_t v10;
  id v11;
  NSObject *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  NSObject *v17;
  uint64_t *v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  _QWORD v27[11];

  v3 = a1;
  v4 = a2;
  v5 = objc_alloc_init((Class)NSMutableArray);
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_100002C10;
  v25 = sub_100002C20;
  v26 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("identifier == %@"), v4));
  v27[0] = CFSTR("identifier");
  v27[1] = CFSTR("title");
  v27[2] = CFSTR("contributors");
  v27[3] = CFSTR("contentType");
  v27[4] = CFSTR("thumbnailURL");
  v27[5] = CFSTR("thumbnailData");
  v27[6] = CFSTR("contentType");
  v27[7] = CFSTR("contentURL");
  v27[8] = CFSTR("fileSize");
  v27[9] = CFSTR("com_apple_iBooks_storeURL");
  v27[10] = CFSTR("com_apple_iBooks_localFileURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 11));
  v8 = objc_msgSend(objc_alloc((Class)CSSearchQuery), "initWithQueryString:attributes:", v6, v7);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100002C28;
  v19[3] = &unk_100004260;
  v9 = v5;
  v20 = v9;
  objc_msgSend(v8, "setFoundItemsHandler:", v19);
  v10 = dispatch_semaphore_create(0);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100002C34;
  v15[3] = &unk_100004288;
  v11 = v9;
  v16 = v11;
  v18 = &v21;
  v12 = v10;
  v17 = v12;
  objc_msgSend(v8, "setCompletionHandler:", v15);
  objc_msgSend(v8, "start");
  dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v22[5], "attributeSet"));

  _Block_object_dispose(&v21, 8);
  return v13;
}

void sub_100002A7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100002BA0()
{
  if (qword_100008248 != -1)
    dispatch_once(&qword_100008248, &stru_100004238);
  return (id)qword_100008240;
}

void sub_100002BE0(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.iBooks", "Spotlight Extension");
  v2 = (void *)qword_100008240;
  qword_100008240 = (uint64_t)v1;

}

uint64_t sub_100002C10(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100002C20(uint64_t a1)
{

}

id sub_100002C28(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", a2);
}

intptr_t sub_100002C34(uint64_t a1)
{
  id *v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v2 = (id *)(a1 + 32);
  if (!objc_msgSend(*(id *)(a1 + 32), "count") || (unint64_t)objc_msgSend(*v2, "count") >= 2)
  {
    v3 = sub_100002BA0();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      sub_1000030EC(v2, v4);

  }
  if (!objc_msgSend(*v2, "count"))
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "firstObject"));
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") < 2)
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = *v2;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (!v8)
    goto LABEL_26;
  v9 = v8;
  v10 = *(_QWORD *)v24;
  while (2)
  {
    for (i = 0; i != v9; i = (char *)i + 1)
    {
      if (*(_QWORD *)v24 != v10)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "attributeSet"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "contentType"));
      if (objc_msgSend(v14, "length"))
        goto LABEL_24;
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "attributeForKey:", CFSTR("com_apple_iBooks_storeURL")));
      if (v15)
      {
        v16 = (void *)v15;
LABEL_23:

LABEL_24:
LABEL_25:
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v12);

        goto LABEL_26;
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "attributeForKey:", CFSTR("com_apple_iBooks_localFileURL")));
      if (v16)
        goto LABEL_23;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "contentURL"));
      if (v17)
      {

        goto LABEL_23;
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "fileSize"));
      objc_msgSend(v18, "doubleValue");
      v20 = v19;

      if (v20 > 0.0)
        goto LABEL_25;

    }
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v9)
      continue;
    break;
  }
LABEL_26:

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100002E98(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void sub_100002EE4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_100002F18(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_100002F24(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 138412290;
  v4 = a1;
  sub_100002F18((void *)&_mh_execute_header, a2, a3, "Index extension wants to reindex everything. searchableIndex: %@", (uint8_t *)&v3);
  sub_100002F10();
}

void sub_100002F8C()
{
  uint64_t v0;
  os_log_t v1;

  sub_100002EF8();
  sub_100002EE4((void *)&_mh_execute_header, v0, v1, "Index extension wants to reindex. searchableIndex: %@, identifiers: %@");
  sub_100002F10();
}

void sub_100002FEC(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Requesting URL but no URL is available.", v1, 2u);
}

void sub_10000302C()
{
  uint64_t v0;
  os_log_t v1;

  sub_100002EF8();
  sub_100002EE4((void *)&_mh_execute_header, v0, v1, "Asked for data for %@ with type %@");
  sub_100002F10();
}

void sub_10000308C()
{
  uint64_t v0;
  os_log_t v1;

  sub_100002EF8();
  sub_100002EE4((void *)&_mh_execute_header, v0, v1, "Asked for file URL for %@ with type %@");
  sub_100002F10();
}

void sub_1000030EC(id *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*a1, "count")));
  v5 = 138412290;
  v6 = v3;
  sub_100002F18((void *)&_mh_execute_header, a2, v4, "unexpected item count found for %@", (uint8_t *)&v5);

}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attributeForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributeForKey:");
}

id objc_msgSend_attributeSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributeSet");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_contentType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentType");
}

id objc_msgSend_contentURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentURL");
}

id objc_msgSend_contributors(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contributors");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_fileSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileSize");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_initWithQueryString_attributes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithQueryString:attributes:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_loadDataWithTypeIdentifier_forItemProviderCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadDataWithTypeIdentifier:forItemProviderCompletionHandler:");
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longLongValue");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_preferredFilenameExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredFilenameExtension");
}

id objc_msgSend_setCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCompletionHandler:");
}

id objc_msgSend_setFoundItemsHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFoundItemsHandler:");
}

id objc_msgSend_si_stringAttributeForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "si_stringAttributeForKey:");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "start");
}

id objc_msgSend_stringFromByteCount_countStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringFromByteCount:countStyle:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "title");
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uppercaseString");
}
