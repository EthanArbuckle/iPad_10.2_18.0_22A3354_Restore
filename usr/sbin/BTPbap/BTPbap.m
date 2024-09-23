void sub_100004008(char *category)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.bluetooth", category);
  v2 = (void *)qword_10000C908;
  qword_10000C908 = (uint64_t)v1;

}

id sub_1000041F4(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_handleEvent:", a2);
}

void sub_100004200()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = qword_10000C908;
  if (os_log_type_enabled((os_log_t)qword_10000C908, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "Language did change, exiting", v1, 2u);
  }
  exit(1);
}

void sub_10000440C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id sub_10000466C(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_handleEvent:", a2);
}

void sub_100004720(id a1)
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
  v8[0] = &stru_100008410;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", &_xpc_type_int64));
  v7[1] = v2;
  v8[1] = &stru_100008430;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", &_xpc_type_uint64));
  v7[2] = v3;
  v8[2] = &stru_100008450;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", &_xpc_type_double));
  v7[3] = v4;
  v8[3] = &stru_100008470;
  v5 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v7, 4));
  v6 = (void *)qword_10000C910;
  qword_10000C910 = v5;

}

NSNumber *__cdecl sub_100004854(id a1, OS_xpc_object *a2)
{
  _BOOL8 value;

  value = xpc_BOOL_get_value(a2);
  return +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", value);
}

NSNumber *__cdecl sub_100004884(id a1, OS_xpc_object *a2)
{
  int64_t value;

  value = xpc_int64_get_value(a2);
  return +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", value);
}

NSNumber *__cdecl sub_1000048B4(id a1, OS_xpc_object *a2)
{
  uint64_t value;

  value = xpc_uint64_get_value(a2);
  return +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", value);
}

NSNumber *__cdecl sub_1000048E4(id a1, OS_xpc_object *a2)
{
  double value;

  value = xpc_double_get_value(a2);
  return +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", value);
}

void sub_1000049A0(id a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  Block_layout *v5;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", &_xpc_type_string));
  v4 = v1;
  v5 = &stru_1000084D0;
  v2 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v5, &v4, 1));
  v3 = (void *)qword_10000C920;
  qword_10000C920 = v2;

}

NSString *__cdecl sub_100004A44(id a1, OS_xpc_object *a2)
{
  return +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", xpc_string_get_string_ptr(a2));
}

void sub_100004B04(id a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  Block_layout *v5;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", &_xpc_type_dictionary));
  v4 = v1;
  v5 = &stru_100008530;
  v2 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v5, &v4, 1));
  v3 = (void *)qword_10000C930;
  qword_10000C930 = v2;

}

OS_xpc_object *__cdecl sub_100004BA8(id a1, OS_xpc_object *a2)
{
  return a2;
}

void sub_100004F14(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id sub_100004F28(id a1)
{
  return a1;
}

uint64_t sub_100004F30()
{
  uint64_t v0;

  return v0;
}

void sub_100004FB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_10000500C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

id sub_100005178(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_timerEvent");
}

id sub_100005180(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTimer:", 0);
}

void sub_100005244(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

uint64_t start()
{
  BTXpcService *v0;
  void *v1;

  sub_100004008("BTPbap");
  v0 = -[BTXpcService initWithName:sessionClass:]([BTXpcService alloc], "initWithName:sessionClass:", "com.apple.BTServer.pbap", objc_opt_class(XpcSession));
  if (v0)
  {
    v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
    objc_msgSend(v1, "run");

  }
  return 1;
}

void sub_100005D38(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Failed to create XPC server", v1, 2u);
}

void sub_100005D78(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000440C((void *)&_mh_execute_header, a2, a3, "XPC server error: %@", a5, a6, a7, a8, 2u);
}

void sub_100005DE0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000440C((void *)&_mh_execute_header, a2, a3, "Unexpected XPC server event: %@", a5, a6, a7, a8, 2u);
}

void sub_100005E48(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "XPC connection does not have the proper entitlement, cancelling", v1, 2u);
}

void sub_100005E88(char a1, void *a2)
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
  v5 = objc_msgSend((id)sub_100004F30(), "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = 138412546;
  v8 = v3;
  v9 = 2112;
  v10 = v6;
  _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Sending XPC %@: %@", (uint8_t *)&v7, 0x16u);

}

void sub_100005F54(void *a1)
{
  NSObject *v1;
  id v2;
  void *v3;
  int v4;
  void *v5;

  sub_100004F28(a1);
  v2 = objc_msgSend((id)sub_100004F30(), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "Received XPC message: %@", (uint8_t *)&v4, 0xCu);

  sub_100004F08();
}

void sub_100005FE8(void *a1)
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

  sub_100004F28(a1);
  v2 = objc_msgSend((id)sub_100004F30(), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_100004F14((void *)&_mh_execute_header, v4, v5, "XPC connection error: %@", v6, v7, v8, v9, 2u);

  sub_100004F08();
}

void sub_10000606C(void *a1)
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

  sub_100004F28(a1);
  v2 = objc_msgSend((id)sub_100004F30(), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_100004F14((void *)&_mh_execute_header, v4, v5, "Unexpected XPC connection event: %@", v6, v7, v8, v9, 2u);

  sub_100004F08();
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UTF8String");
}

id objc_msgSend__callStatusForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_callStatusForCall:");
}

id objc_msgSend__handleConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleConnection:");
}

id objc_msgSend__objectForKey_dict_optional_converters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_objectForKey:dict:optional:converters:");
}

id objc_msgSend__predicateForType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_predicateForType:");
}

id objc_msgSend__startTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startTimer");
}

id objc_msgSend__stopTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stopTimer");
}

id objc_msgSend__timeout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_timeout");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addressBookRecordId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addressBookRecordId");
}

id objc_msgSend_andPredicateWithSubpredicates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "andPredicateWithSubpredicates:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_beginTransaction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginTransaction");
}

id objc_msgSend_callStatus(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callStatus");
}

id objc_msgSend_callerId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callerId");
}

id objc_msgSend_callerIdLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callerIdLabel");
}

id objc_msgSend_chManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chManager");
}

id objc_msgSend_chRecentCalls(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chRecentCalls");
}

id objc_msgSend_coalescedCallsWithPredicate_limit_offset_batchSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "coalescedCallsWithPredicate:limit:offset:batchSize:");
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connection");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsString:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "count");
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentRunLoop");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "date");
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "description");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_endTransaction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endTransaction");
}

id objc_msgSend_handleMsg_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleMsg:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifier");
}

id objc_msgSend_initWithConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConnection:");
}

id objc_msgSend_initWithName_sessionClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:sessionClass:");
}

id objc_msgSend_isTransacting(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isTransacting");
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "longLongValue");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "name");
}

id objc_msgSend_numberForKey_optional_dict_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberForKey:optional:dict:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_orPredicateWithSubpredicates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "orPredicateWithSubpredicates:");
}

id objc_msgSend_predicateForCallsBetweenStartDate_endDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForCallsBetweenStartDate:endDate:");
}

id objc_msgSend_predicateForCallsWithRemoteParticipantHandleType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForCallsWithRemoteParticipantHandleType:");
}

id objc_msgSend_predicateForCallsWithStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForCallsWithStatus:");
}

id objc_msgSend_predicateForCallsWithStatusRead_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForCallsWithStatusRead:");
}

id objc_msgSend_providerForRecentCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "providerForRecentCall:");
}

id objc_msgSend_raise_format_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "raise:format:");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "run");
}

id objc_msgSend_sendReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendReply:");
}

id objc_msgSend_sessionClass(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionClass");
}

id objc_msgSend_setChRecentCalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setChRecentCalls:");
}

id objc_msgSend_setCoalescingStrategy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCoalescingStrategy:");
}

id objc_msgSend_setIsTransacting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsTransacting:");
}

id objc_msgSend_setLimitingStartDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLimitingStartDate:");
}

id objc_msgSend_setTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimer:");
}

id objc_msgSend_setTimerTransactionCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimerTransactionCount:");
}

id objc_msgSend_setTransactionCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransactionCount:");
}

id objc_msgSend_stringForKey_optional_dict_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForKey:optional:dict:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subarrayWithRange:");
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSince1970");
}

id objc_msgSend_timer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timer");
}

id objc_msgSend_timerTransactionCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timerTransactionCount");
}

id objc_msgSend_transactionCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transactionCount");
}

id objc_msgSend_tuCallProviderManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tuCallProviderManager");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_valueWithPointer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithPointer:");
}

id objc_msgSend_watchdog(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "watchdog");
}

id objc_msgSend_xpcDictForKey_optional_dict_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "xpcDictForKey:optional:dict:");
}
