id sub_100001EB0(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleEvent:", a2);
}

void sub_100001EBC()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = qword_10000D088;
  if (os_log_type_enabled((os_log_t)qword_10000D088, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "Language did change, exiting", v1, 2u);
  }
  exit(1);
}

void sub_1000020C8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id sub_1000025E4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleEvent:", a2);
}

void sub_100002698(id a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  _QWORD v8[4];

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", &_xpc_type_BOOL));
  v7[0] = v1;
  v8[0] = &stru_1000084B0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", &_xpc_type_int64));
  v7[1] = v2;
  v8[1] = &stru_1000084D0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", &_xpc_type_uint64));
  v7[2] = v3;
  v8[2] = &stru_1000084F0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", &_xpc_type_double));
  v7[3] = v4;
  v8[3] = &stru_100008510;
  v5 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v7, 4));
  v6 = (void *)qword_10000D050;
  qword_10000D050 = v5;

}

NSNumber *__cdecl sub_1000027CC(id a1, OS_xpc_object *a2)
{
  return +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", xpc_BOOL_get_value(a2));
}

NSNumber *__cdecl sub_1000027FC(id a1, OS_xpc_object *a2)
{
  int64_t value;

  value = xpc_int64_get_value(a2);
  return +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", value);
}

NSNumber *__cdecl sub_10000282C(id a1, OS_xpc_object *a2)
{
  uint64_t value;

  value = xpc_uint64_get_value(a2);
  return +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", value);
}

NSNumber *__cdecl sub_10000285C(id a1, OS_xpc_object *a2)
{
  double value;

  value = xpc_double_get_value(a2);
  return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", value);
}

void sub_100002918(id a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  Block_layout *v5;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", &_xpc_type_string));
  v4 = v1;
  v5 = &stru_100008570;
  v2 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v5, &v4, 1));
  v3 = (void *)qword_10000D060;
  qword_10000D060 = v2;

}

NSString *__cdecl sub_1000029BC(id a1, OS_xpc_object *a2)
{
  return +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", xpc_string_get_string_ptr(a2));
}

void sub_100002A7C(id a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  Block_layout *v5;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", &_xpc_type_dictionary));
  v4 = v1;
  v5 = &stru_1000085D0;
  v2 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v5, &v4, 1));
  v3 = (void *)qword_10000D070;
  qword_10000D070 = v2;

}

OS_xpc_object *__cdecl sub_100002B20(id a1, OS_xpc_object *a2)
{
  return a2;
}

void sub_100002F34(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id sub_100002F48(id a1)
{
  return a1;
}

uint64_t sub_100002F50()
{
  uint64_t v0;

  return v0;
}

void sub_100002F5C(char *category)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.bluetooth", category);
  v2 = (void *)qword_10000D088;
  qword_10000D088 = (uint64_t)v1;

}

void sub_100003000(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_100003058(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

id sub_1000031C4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_timerEvent");
}

id sub_1000031CC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTimer:", 0);
}

void sub_100003290(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

uint64_t start()
{
  BTXpcService *v0;
  void *v1;

  sub_100002F5C("BTMap");
  v0 = -[BTXpcService initWithName:sessionClass:]([BTXpcService alloc], "initWithName:sessionClass:", "com.apple.BTServer.map", objc_opt_class(XpcSession));
  if (v0)
  {
    v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
    objc_msgSend(v1, "run");

  }
  return 1;
}

void sub_100003C10(id a1, NSArray *a2)
{
  IMSPIMarkSPIMessagesAsRead(a2);
}

void sub_100003E74(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[5];
  uint8_t buf[4];
  id v20;

  v3 = a2;
  v4 = qword_10000D088;
  if (os_log_type_enabled((os_log_t)qword_10000D088, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Adding guid %@ to pending send list", buf, 0xCu);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "pendingSendGuids"));
  objc_msgSend(v5, "addObject:", v3);

  v17[0] = CFSTR("kMessageGUID");
  v17[1] = CFSTR("kBody");
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(a1 + 48);
  v18[0] = v3;
  v18[1] = v6;
  v17[2] = CFSTR("kRecipientPhoneNumber");
  v8 = v7;
  if (!v7)
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v18[2] = v8;
  v17[3] = CFSTR("kRecipientEmail");
  v9 = *(void **)(a1 + 56);
  v10 = v9;
  if (!v9)
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v18[3] = v10;
  v17[4] = CFSTR("kDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v18[4] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 5));

  if (!v9)
  {

    if (v7)
      goto LABEL_9;
LABEL_11:

    goto LABEL_9;
  }
  if (!v7)
    goto LABEL_11;
LABEL_9:
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  objc_msgSend(v13, "addObject:", v12);
  v15 = CFSTR("kMessagesInfo");
  v16 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
  objc_msgSend(*(id *)(a1 + 32), "sendMsg:args:", CFSTR("kPendingSendMessage"), v14);

}

void sub_100004124(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  const __CFString *v16;
  void *v17;
  _BYTE v18[128];

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "reverseObjectEnumerator", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serializeIMSPIMessage:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v9)));
        objc_msgSend(v4, "addObject:", v10);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    }
    while (v7);
  }

  v16 = CFSTR("kMessagesInfo");
  v17 = v4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
  objc_msgSend(*(id *)(a1 + 32), "sendReplyToMsg:status:args:", *(_QWORD *)(a1 + 40), 1, v11);

}

void sub_100004F78(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Failed to create XPC server", v1, 2u);
}

void sub_100004FB8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000020C8((void *)&_mh_execute_header, a2, a3, "XPC server error: %@", a5, a6, a7, a8, 2u);
}

void sub_100005020(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000020C8((void *)&_mh_execute_header, a2, a3, "Unexpected XPC server event: %@", a5, a6, a7, a8, 2u);
}

void sub_100005088(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "XPC connection does not have the proper entitlement, cancelling", v1, 2u);
}

void sub_1000050C8(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Ignoring request to add ellipsis as there is insufficient space. bufferMaxLength = %lu", (uint8_t *)&v2, 0xCu);
}

void sub_10000513C(char a1, void *a2)
{
  NSObject *v2;
  const __CFString *v3;
  id v4;
  id v5;
  void *v6;
  int v7;
  const __CFString *v8;
  __int16 v9;
  void *v10;

  if ((a1 & 1) != 0)
    v3 = CFSTR("reply");
  else
    v3 = CFSTR("message");
  v4 = a2;
  v5 = objc_msgSend((id)sub_100002F50(), "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = 138412546;
  v8 = v3;
  v9 = 2112;
  v10 = v6;
  _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Sending XPC %@: %@", (uint8_t *)&v7, 0x16u);

}

void sub_100005208(void *a1)
{
  NSObject *v1;
  id v2;
  void *v3;
  int v4;
  void *v5;

  sub_100002F48(a1);
  v2 = objc_msgSend((id)sub_100002F50(), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "Received XPC message: %@", (uint8_t *)&v4, 0xCu);

  sub_100002F28();
}

void sub_10000529C(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  sub_100002F48(a1);
  v2 = objc_msgSend((id)sub_100002F50(), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_100002F34((void *)&_mh_execute_header, v4, v5, "XPC connection error: %@", v6, v7, v8, v9, 2u);

  sub_100002F28();
}

void sub_100005320(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  sub_100002F48(a1);
  v2 = objc_msgSend((id)sub_100002F50(), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_100002F34((void *)&_mh_execute_header, v4, v5, "Unexpected XPC connection event: %@", v6, v7, v8, v9, 2u);

  sub_100002F28();
}

id objc_msgSend_ID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ID");
}

id objc_msgSend_UTF8DataWithMaxLength_ellipsis_isTruncated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8DataWithMaxLength:ellipsis:isTruncated:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_UTF8StringWithMaxLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8StringWithMaxLength:");
}

id objc_msgSend__handleConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleConnection:");
}

id objc_msgSend__imMessageItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_imMessageItem");
}

id objc_msgSend__objectForKey_dict_optional_converters_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_objectForKey:dict:optional:converters:");
}

id objc_msgSend__setBlocksConnectionAtResume_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setBlocksConnectionAtResume:");
}

id objc_msgSend__startTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_startTimer");
}

id objc_msgSend__stopTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stopTimer");
}

id objc_msgSend__timeout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_timeout");
}

id objc_msgSend_accountTypeName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountTypeName");
}

id objc_msgSend_addListenerID_capabilities_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addListenerID:capabilities:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_address(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "address");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_beginTransaction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginTransaction");
}

id objc_msgSend_blockUntilConnected(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blockUntilConnected");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_cStringUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cStringUsingEncoding:");
}

id objc_msgSend_characterAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "characterAtIndex:");
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connection");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsString:");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentHandler");
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentRunLoop");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_disconnectFromDaemon(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disconnectFromDaemon");
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayName");
}

id objc_msgSend_endTransaction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endTransaction");
}

id objc_msgSend_getBytes_maxLength_usedLength_encoding_options_range_remainingRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:");
}

id objc_msgSend_getImCoreSeedMessages_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getImCoreSeedMessages:");
}

id objc_msgSend_guid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "guid");
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_handleMsg_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleMsg:");
}

id objc_msgSend_initWithBytes_length_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBytes:length:encoding:");
}

id objc_msgSend_initWithConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithConnection:");
}

id objc_msgSend_initWithName_sessionClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:sessionClass:");
}

id objc_msgSend_initWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPath:");
}

id objc_msgSend_isAudioMessage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAudioMessage");
}

id objc_msgSend_isFromMe(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFromMe");
}

id objc_msgSend_isMuted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMuted");
}

id objc_msgSend_isRead(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRead");
}

id objc_msgSend_isSent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSent");
}

id objc_msgSend_isTransacting(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isTransacting");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_lengthOfBytesUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lengthOfBytesUsingEncoding:");
}

id objc_msgSend_markMessageAsRead_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "markMessageAsRead:");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "null");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "object");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_pendingSendGuids(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pendingSendGuids");
}

id objc_msgSend_plainBody(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "plainBody");
}

id objc_msgSend_raise_format_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "raise:format:");
}

id objc_msgSend_recipient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recipient");
}

id objc_msgSend_registerForIMCoreNotifications(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerForIMCoreNotifications");
}

id objc_msgSend_removeListenerID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeListenerID:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reverseObjectEnumerator");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run");
}

id objc_msgSend_sendMsg_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendMsg:");
}

id objc_msgSend_sendMsg_args_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendMsg:args:");
}

id objc_msgSend_sendReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendReply:");
}

id objc_msgSend_sendReplyToMsg_status_args_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendReplyToMsg:status:args:");
}

id objc_msgSend_sendTextMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendTextMessage:");
}

id objc_msgSend_sender(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sender");
}

id objc_msgSend_serializeIMMessageNotification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serializeIMMessageNotification:");
}

id objc_msgSend_serializeIMSPIMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serializeIMSPIMessage:");
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "service");
}

id objc_msgSend_sessionClass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionClass");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setIsTransacting_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsTransacting:");
}

id objc_msgSend_setTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimer:");
}

id objc_msgSend_setTimerTransactionCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimerTransactionCount:");
}

id objc_msgSend_setTransactionCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTransactionCount:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_subject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subject");
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "text");
}

id objc_msgSend_timeDelivered(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeDelivered");
}

id objc_msgSend_timer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timer");
}

id objc_msgSend_timerTransactionCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timerTransactionCount");
}

id objc_msgSend_transactionCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transactionCount");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_valueWithPointer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueWithPointer:");
}

id objc_msgSend_watchdog(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "watchdog");
}
