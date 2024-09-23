void sub_100005E10(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x250], 8);
  _Block_object_dispose(&STACK[0x270], 8);
  _Block_object_dispose(&STACK[0x290], 8);
  _Block_object_dispose(&STACK[0x2B0], 8);
  _Block_object_dispose(&STACK[0x2D0], 8);
  _Block_object_dispose(&STACK[0x2F0], 8);
  _Block_object_dispose(&STACK[0x310], 8);
  _Block_object_dispose(&STACK[0x340], 8);
  _Block_object_dispose(&STACK[0x370], 8);
  _Block_object_dispose(&STACK[0x3A0], 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100005EC4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100005ED4(uint64_t a1)
{

}

void sub_100005EDC(uint64_t a1)
{
  uint64_t v2;
  ssize_t v3;
  ssize_t v4;
  ssize_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  __CFString *v9;
  void *v10;
  ssize_t v11;
  void *v12;
  id v13;
  __CFString *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    return;
  v2 = a1 + 32;
  v3 = recv((int)objc_msgSend(*(id *)(a1 + 32), "localSocket"), *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), 0x4000uLL, 0);
  v4 = v3;
  if (v3 <= 0)
  {
    if (v3)
    {
      if (*__error() == 35)
        return;
      if (*(_BYTE *)(a1 + 80) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        sub_10000D134(v2);
    }
    else if (*(_BYTE *)(a1 + 80) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      sub_10000D0B4(v2);
    }
    goto LABEL_30;
  }
  v5 = send((int)objc_msgSend(*(id *)(a1 + 32), "bridgeSocket"), *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), v3, 0);
  if (!v5)
  {
    if (*(_BYTE *)(a1 + 80) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      sub_10000D1BC(v2);
    goto LABEL_30;
  }
  v6 = v5;
  if (v5 < 0)
  {
    if (*__error() == 35)
    {
      v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      goto LABEL_23;
    }
    if (*(_BYTE *)(a1 + 80) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      sub_10000D23C(v2);
LABEL_30:
    dispatch_source_cancel(*(dispatch_source_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    return;
  }
  v4 -= v5;
  if (!v4)
  {
    if (*(_BYTE *)(a1 + 80))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serviceName"));
        v8 = objc_msgSend(*(id *)(a1 + 32), "servicePort");
        v9 = sub_100006258(*(unsigned __int8 *)(a1 + 81), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        v16 = 138413058;
        v17 = v7;
        v18 = 2048;
        v19 = v8;
        v20 = 2048;
        v21 = v6;
        v22 = 2112;
        v23 = v10;
        _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%@(%lu) LOCAL->IDS: %ld bytes sent.%@", (uint8_t *)&v16, 0x2Au);

      }
    }
    return;
  }
  v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) + v5;
LABEL_23:
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v11;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;
  if (*(_BYTE *)(a1 + 80) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serviceName"));
    v13 = objc_msgSend(*(id *)(a1 + 32), "servicePort");
    v14 = sub_100006258(*(unsigned __int8 *)(a1 + 81), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = 138413058;
    v17 = v12;
    v18 = 2048;
    v19 = v13;
    v20 = 2048;
    v21 = v6;
    v22 = 2112;
    v23 = v15;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%@(%lu) LOCAL->IDS: %ld bytes sent. Write buffer full.%@", (uint8_t *)&v16, 0x2Au);

  }
  dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
}

__CFString *sub_100006258(int a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  __CFString *v4;

  if (a1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", a2, a3));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" DATA=%@"), v3));

  }
  else
  {
    v4 = &stru_100014960;
  }
  return v4;
}

void sub_1000062D0(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void (**v4)(void);
  uint64_t v5;
  void *v6;

  v2 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v2)
    dispatch_source_cancel(v2);
  v3 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v3)
    dispatch_source_cancel(v3);
  v4 = (void (**)(void))objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "localCompletion"));
  v4[2]();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v6 = *(void **)(v5 + 24);
  if (v6)
  {
    free(v6);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  }
  *(_QWORD *)(v5 + 24) = 0;
}

void sub_100006350(uint64_t a1)
{
  id *v2;
  ssize_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  __CFString *v8;
  void *v9;
  void *v10;
  id v11;
  __CFString *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;

  if (*(uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) < 1)
    return;
  v2 = (id *)(a1 + 32);
  v3 = send((int)objc_msgSend(*(id *)(a1 + 32), "bridgeSocket"), *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), 0);
  if (!v3)
  {
    if (*(_BYTE *)(a1 + 80) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      sub_10000D2C4((uint64_t)v2);
    goto LABEL_20;
  }
  v4 = v3;
  if (v3 < 0 && *__error() != 35)
  {
    if (*(_BYTE *)(a1 + 80) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      sub_10000D3DC((uint64_t)v2);
LABEL_20:
    dispatch_source_cancel(*(dispatch_source_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    return;
  }
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (v4 == *(_QWORD *)(v5 + 24))
  {
    *(_QWORD *)(v5 + 24) = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                            + 24);
    if (*(_BYTE *)(a1 + 80))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serviceName"));
        v11 = objc_msgSend(*(id *)(a1 + 32), "servicePort");
        v12 = sub_100006258(*(unsigned __int8 *)(a1 + 81), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), v4);
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        v14 = 138413058;
        v15 = v10;
        v16 = 2048;
        v17 = v11;
        v18 = 2048;
        v19 = v4;
        v20 = 2112;
        v21 = v13;
        _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%@(%lu) LOCAL->IDS: %ld bytes sent from write src.%@", (uint8_t *)&v14, 0x2Au);

      }
    }
    dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
    dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  }
  else if (v4 < 1)
  {
    if (*(_BYTE *)(a1 + 80) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      sub_10000D344(v2);
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += v4;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) -= v4;
    if (*(_BYTE *)(a1 + 80) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serviceName"));
      v7 = objc_msgSend(*(id *)(a1 + 32), "servicePort");
      v8 = sub_100006258(*(unsigned __int8 *)(a1 + 81), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v14 = 138413058;
      v15 = v6;
      v16 = 2048;
      v17 = v7;
      v18 = 2048;
      v19 = v4;
      v20 = 2112;
      v21 = v9;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%@(%lu) LOCAL->IDS: %ld bytes sent from write src unfinished.%@", (uint8_t *)&v14, 0x2Au);

    }
  }
}

void sub_100006690(uint64_t a1)
{
  uint64_t v2;
  ssize_t v3;
  ssize_t v4;
  ssize_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  __CFString *v9;
  void *v10;
  ssize_t v11;
  void *v12;
  id v13;
  __CFString *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    return;
  v2 = a1 + 32;
  v3 = recv((int)objc_msgSend(*(id *)(a1 + 32), "bridgeSocket"), *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), 0x4000uLL, 0);
  v4 = v3;
  if (v3 <= 0)
  {
    if (v3)
    {
      if (*__error() == 35)
        return;
      if (*(_BYTE *)(a1 + 80) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        sub_10000D4E4(v2);
    }
    else if (*(_BYTE *)(a1 + 80) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      sub_10000D464(v2);
    }
    goto LABEL_30;
  }
  v5 = send((int)objc_msgSend(*(id *)(a1 + 32), "localSocket"), *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), v3, 0);
  if (!v5)
  {
    if (*(_BYTE *)(a1 + 80) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      sub_10000D56C(v2);
    goto LABEL_30;
  }
  v6 = v5;
  if (v5 < 0)
  {
    if (*__error() == 35)
    {
      v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      goto LABEL_23;
    }
    if (*(_BYTE *)(a1 + 80) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      sub_10000D5EC(v2);
LABEL_30:
    dispatch_source_cancel(*(dispatch_source_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    return;
  }
  v4 -= v5;
  if (!v4)
  {
    if (*(_BYTE *)(a1 + 80))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serviceName"));
        v8 = objc_msgSend(*(id *)(a1 + 32), "servicePort");
        v9 = sub_100006258(*(unsigned __int8 *)(a1 + 81), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        v16 = 138413058;
        v17 = v7;
        v18 = 2048;
        v19 = v8;
        v20 = 2048;
        v21 = v6;
        v22 = 2112;
        v23 = v10;
        _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%@(%lu) IDS->LOCAL: %ld bytes sent.%@", (uint8_t *)&v16, 0x2Au);

      }
    }
    return;
  }
  v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) + v5;
LABEL_23:
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v11;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;
  if (*(_BYTE *)(a1 + 80) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serviceName"));
    v13 = objc_msgSend(*(id *)(a1 + 32), "servicePort");
    v14 = sub_100006258(*(unsigned __int8 *)(a1 + 81), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = 138413058;
    v17 = v12;
    v18 = 2048;
    v19 = v13;
    v20 = 2048;
    v21 = v6;
    v22 = 2112;
    v23 = v15;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%@(%lu) IDS->LOCAL: %ld bytes sent. Write buffer full.%@", (uint8_t *)&v16, 0x2Au);

  }
  dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
}

void sub_100006A0C(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void (**v4)(void);
  uint64_t v5;
  void *v6;

  v2 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v2)
    dispatch_source_cancel(v2);
  v3 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v3)
    dispatch_source_cancel(v3);
  v4 = (void (**)(void))objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bridgeCompletion"));
  v4[2]();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v6 = *(void **)(v5 + 24);
  if (v6)
  {
    free(v6);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  }
  *(_QWORD *)(v5 + 24) = 0;
}

void sub_100006A8C(uint64_t a1)
{
  id *v2;
  ssize_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  __CFString *v8;
  void *v9;
  void *v10;
  id v11;
  __CFString *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;

  if (*(uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) < 1)
    return;
  v2 = (id *)(a1 + 32);
  v3 = send((int)objc_msgSend(*(id *)(a1 + 32), "localSocket"), *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), 0);
  if (!v3)
  {
    if (*(_BYTE *)(a1 + 80) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      sub_10000D674((uint64_t)v2);
    goto LABEL_20;
  }
  v4 = v3;
  if (v3 < 0 && *__error() != 35)
  {
    if (*(_BYTE *)(a1 + 80) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      sub_10000D78C((uint64_t)v2);
LABEL_20:
    dispatch_source_cancel(*(dispatch_source_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    return;
  }
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (v4 == *(_QWORD *)(v5 + 24))
  {
    *(_QWORD *)(v5 + 24) = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                            + 24);
    if (*(_BYTE *)(a1 + 80))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serviceName"));
        v11 = objc_msgSend(*(id *)(a1 + 32), "servicePort");
        v12 = sub_100006258(*(unsigned __int8 *)(a1 + 81), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), v4);
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        v14 = 138413058;
        v15 = v10;
        v16 = 2048;
        v17 = v11;
        v18 = 2048;
        v19 = v4;
        v20 = 2112;
        v21 = v13;
        _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%@(%lu) IDS->LOCAL: %ld bytes sent from write src.%@", (uint8_t *)&v14, 0x2Au);

      }
    }
    dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
    dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  }
  else if (v4 < 1)
  {
    if (*(_BYTE *)(a1 + 80) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      sub_10000D6F4(v2);
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += v4;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) -= v4;
    if (*(_BYTE *)(a1 + 80) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serviceName"));
      v7 = objc_msgSend(*(id *)(a1 + 32), "servicePort");
      v8 = sub_100006258(*(unsigned __int8 *)(a1 + 81), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v14 = 138413058;
      v15 = v6;
      v16 = 2048;
      v17 = v7;
      v18 = 2048;
      v19 = v4;
      v20 = 2112;
      v21 = v9;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%@(%lu) IDS->LOCAL: %ld bytes sent from write src unfinished.%@", (uint8_t *)&v14, 0x2Au);

    }
  }
}

id sub_100006E6C()
{
  id *v0;

  return objc_msgSend(*v0, "servicePort");
}

void sub_100006E90(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void sub_100006EA0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

char *sub_100006EF4(int *a1)
{
  return strerror(*a1);
}

int *sub_100006EFC()
{
  return __error();
}

uint64_t sub_100006F04(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t sub_100006F10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 24) = a2;
  return *(_QWORD *)a1;
}

void sub_100006F1C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x2Au);
}

id sub_100006F3C()
{
  id *v0;

  return objc_msgSend(*v0, "servicePort");
}

void sub_1000077FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,id location)
{
  id *v43;
  id *v44;
  id *v45;
  id *v46;

  objc_destroyWeak(v46);
  objc_destroyWeak(v45);
  objc_destroyWeak(v44);
  objc_destroyWeak(v43);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100007898(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;

  v3 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = NRPairedDeviceRegistryDeviceDidPairNotification;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Notification: %@", (uint8_t *)&v8, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "handlePairingNotification:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "service"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "devices"));
    objc_msgSend(v5, "checkNearbyDevices:", v7);

  }
}

void sub_1000079A4(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id WeakRetained;
  void *v13;
  void *v14;
  void *v15;

  v3 = a2;
  v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v4)
    sub_10000D814(v4, v5, v6, v7, v8, v9, v10, v11);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v13 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "handlePairingNotification:", v3);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "service"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "devices"));
    objc_msgSend(v13, "checkNearbyDevices:", v15);

  }
}

void sub_100007A40(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id WeakRetained;
  void *v13;
  void *v14;
  void *v15;

  v3 = a2;
  v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v4)
    sub_10000D88C(v4, v5, v6, v7, v8, v9, v10, v11);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v13 = WeakRetained;
  if (WeakRetained)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "service"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "devices"));
    objc_msgSend(v13, "checkNearbyDevices:", v15);

  }
}

void sub_100007AD0(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id WeakRetained;
  void *v13;
  void *v14;
  void *v15;

  v3 = a2;
  v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v4)
    sub_10000D904(v4, v5, v6, v7, v8, v9, v10, v11);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v13 = WeakRetained;
  if (WeakRetained)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "service"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "devices"));
    objc_msgSend(v13, "checkNearbyDevices:", v15);

  }
}

void sub_10000851C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_10000852C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_10000853C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

void sub_100008870(id a1)
{
  CPXIDSRelayCompanion *v1;
  void *v2;

  v1 = objc_alloc_init(CPXIDSRelayCompanion);
  v2 = (void *)qword_100019FF0;
  qword_100019FF0 = (uint64_t)v1;

}

void sub_100008980(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100008AFC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    sub_10000DB9C(a1, v2, v3, v4, v5, v6, v7, v8);
  objc_msgSend(*(id *)(a1 + 40), "stopTimerForUDID:", *(_QWORD *)(a1 + 32));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

id sub_100008C70(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;
  uint8_t buf[8];
  uint64_t v14;
  _UNKNOWN **v15;

  xpc_transaction_begin();
  if (*(_BYTE *)(a1 + 48))
  {
    if (!*(_BYTE *)(a1 + 49))
    {
      v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "wifiPortConnections"));
      v3 = objc_msgSend(v2, "count");

      if (!v3)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "WiFi preferred client connection: Enabling preferWifi for data forwarding to gizmo.", buf, 2u);
        }
        v4 = (void *)objc_claimAutoreleasedReturnValue(+[CPXIDSRelayCompanion defaultCPXIDSRelayCompanion](CPXIDSRelayCompanion, "defaultCPXIDSRelayCompanion"));
        v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "service"));
        objc_msgSend(v5, "setPreferInfraWiFi:", 1);
LABEL_12:

      }
    }
  }
  else if (!*(_BYTE *)(a1 + 49))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "highPriorityPortConnections"));
    v7 = objc_msgSend(v6, "count");

    if (!v7)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Bluetooth preferred client connection: Enabling BT Classic", buf, 2u);
      }
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "service"));
      v14 = IDSLinkPreferenceOptionPacketsPerSecondKey;
      v15 = &off_1000152E8;
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
      objc_msgSend(v4, "setLinkPreferences:", v5);
      goto LABEL_12;
    }
  }
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(unsigned __int8 *)(a1 + 49);
  v10 = *(unsigned __int8 *)(a1 + 48);
  v12.receiver = *(id *)(a1 + 32);
  v12.super_class = (Class)CPXIDSRelayCompanion;
  return objc_msgSendSuper2(&v12, "acquirePort:isLowPriority:preferWifi:", v8, v9, v10);
}

void sub_100008EB0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint8_t v11[8];
  objc_super v12;
  uint64_t v13;
  _UNKNOWN **v14;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(unsigned __int8 *)(a1 + 48);
  v4 = *(unsigned __int8 *)(a1 + 49);
  v12.receiver = *(id *)(a1 + 32);
  v12.super_class = (Class)CPXIDSRelayCompanion;
  if (!objc_msgSendSuper2(&v12, "releasePort:isLowPriority:preferWifi:", v2, v3, v4)
    && *(_QWORD *)(a1 + 40) != 62078)
  {
    objc_msgSend(*(id *)(a1 + 32), "teardownListeningSocket:");
  }
  if (*(_BYTE *)(a1 + 49))
  {
    if (!*(_BYTE *)(a1 + 48))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "wifiPortConnections"));
      v6 = objc_msgSend(v5, "count");

      if (!v6)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v11 = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Wifi preferred client connection: Disabling preferWifi for data forwarding to gizmo.", v11, 2u);
        }
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[CPXIDSRelayCompanion defaultCPXIDSRelayCompanion](CPXIDSRelayCompanion, "defaultCPXIDSRelayCompanion"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "service"));
        objc_msgSend(v8, "setPreferInfraWiFi:", 0);
LABEL_15:

      }
    }
  }
  else if (!*(_BYTE *)(a1 + 48))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "highPriorityPortConnections"));
    v10 = objc_msgSend(v9, "count");

    if (!v10)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Bluetooth preferred client connection: Disabling BT Classic, Entering LE", v11, 2u);
      }
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "service"));
      v13 = IDSLinkPreferenceOptionPacketsPerSecondKey;
      v14 = &off_100015300;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
      objc_msgSend(v7, "setLinkPreferences:", v8);
      goto LABEL_15;
    }
  }
  xpc_transaction_end();
}

void sub_100009814(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  void *v30;

  objc_sync_exit(v30);
  _Block_object_dispose(&a30, 8);
  _Unwind_Resume(a1);
}

void sub_100009860(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "service"));
  LOBYTE(v3) = *(_BYTE *)(a1 + 67);
  objc_msgSend(v2, "acceptConnection:socket:targetPort:serviceName:requiredHostIP:isLowPriority:preferWifi:", v4, *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), *(unsigned __int16 *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 66), v3);

}

void sub_1000098C8(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  int v5;
  int *v6;
  char *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  _BYTE v12[14];
  __int16 v13;
  uint64_t v14;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(unsigned __int16 *)(a1 + 64);
    v4 = *(unsigned __int16 *)(a1 + 66);
    v11 = 138412802;
    *(_QWORD *)v12 = v2;
    *(_WORD *)&v12[8] = 1024;
    *(_DWORD *)&v12[10] = v3;
    v13 = 2048;
    v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Stop accepting %@ connections from companion port %d to gizmo port %lu", (uint8_t *)&v11, 0x1Cu);
  }
  if (close(*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)) < 0
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *__error();
    v6 = __error();
    v7 = strerror(*v6);
    v11 = 67109378;
    *(_DWORD *)v12 = v5;
    *(_WORD *)&v12[4] = 2080;
    *(_QWORD *)&v12[6] = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "localSocket conn close error: %d (%s)", (uint8_t *)&v11, 0x12u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "connectionSources"));
  objc_sync_enter(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "connectionSources"));
  objc_msgSend(v9, "removeObjectForKey:", *(_QWORD *)(a1 + 48));

  objc_sync_exit(v8);
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "connectionSourceGroup"));
  dispatch_group_leave(v10);

}

void sub_100009A68(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100009BFC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10000A2F4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v5) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Error sending message!", (uint8_t *)&v5, 2u);
  }
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "connectionMap"));
  objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "releasePort:isLowPriority:preferWifi:", *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 68), *(unsigned __int8 *)(a1 + 69));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 48);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Ending connection for service: %@", (uint8_t *)&v5, 0xCu);
  }
  return close(*(_DWORD *)(a1 + 64));
}

void sub_10000A848(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000A894(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10000A8A4(uint64_t a1)
{

}

void sub_10000A8AC(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  int v6;
  int *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  _QWORD *v13;
  CPXConnection *v14;
  _QWORD v15[6];
  __int128 v16;
  __int128 v17;
  char v18;
  uint8_t buf[4];
  _QWORD v20[2];

  v5 = a3;
  if (v5 && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20[0] = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create IDSDeviceConnection: %@", buf, 0xCu);
    }
    if (close(*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24)) < 0
      && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *__error();
      v7 = __error();
      v8 = strerror(*v7);
      *(_DWORD *)buf = 67109378;
      LODWORD(v20[0]) = v6;
      WORD2(v20[0]) = 2080;
      *(_QWORD *)((char *)v20 + 6) = v8;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "localSocket IDS close error: %d (%s)", buf, 0x12u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      v20[0] = v9;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Ending connection for service: %@", buf, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 40), "releasePort:isLowPriority:preferWifi:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24), *(unsigned __int8 *)(a1 + 96));
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      sub_10000DCA0((_QWORD *)a1);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000AB54;
    v15[3] = &unk_1000146C0;
    v10 = *(_QWORD *)(a1 + 72);
    v11 = *(_OWORD *)(a1 + 56);
    v15[4] = *(_QWORD *)(a1 + 40);
    v15[5] = v10;
    v12 = *(_OWORD *)(a1 + 80);
    v16 = v11;
    v17 = v12;
    v18 = *(_BYTE *)(a1 + 96);
    v13 = objc_retainBlock(v15);
    v14 = -[CPXConnection initWithIDSDeviceConnection:idsMessageContext:localSocket:bridgeSocket:localCompletion:bridgeCompletion:serviceName:servicePort:]([CPXConnection alloc], "initWithIDSDeviceConnection:idsMessageContext:localSocket:bridgeSocket:localCompletion:bridgeCompletion:serviceName:servicePort:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 48), *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24), a2, v13, &stru_1000146E0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
    objc_msgSend(*(id *)(a1 + 40), "handleGenericCPXConnection:", v14);

  }
}

id sub_10000AB54(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int *v10;
  char *v11;
  uint64_t v12;
  int v14;
  _QWORD v15[2];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    sub_10000DD60(a1, v2, v3, v4, v5, v6, v7, v8);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "close");
  if (close(*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)) < 0
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *__error();
    v10 = __error();
    v11 = strerror(*v10);
    v14 = 67109378;
    LODWORD(v15[0]) = v9;
    WORD2(v15[0]) = 2080;
    *(_QWORD *)((char *)v15 + 6) = v11;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "localSocket completion close error: %d (%s)", (uint8_t *)&v14, 0x12u);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    v14 = 138412290;
    v15[0] = v12;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Ending connection for service: %@", (uint8_t *)&v14, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "releasePort:isLowPriority:preferWifi:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24), *(unsigned __int8 *)(a1 + 80));
}

void sub_10000ACCC(id a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    sub_10000DDD8();
}

id sub_10000B0CC(uint64_t a1, _DWORD *a2)
{
  int v3;
  void *v4;
  CFTypeID v5;
  CFTypeID TypeID;
  CFTypeRef cf;

  cf = 0;
  v3 = lockdown_receive_message(a1, &cf);
  v4 = (void *)cf;
  if (!v3 && cf && (v5 = CFGetTypeID(cf), TypeID = CFDictionaryGetTypeID(), v4 = (void *)cf, v5 == TypeID))
  {
    cf = 0;
  }
  else if (v4)
  {
    CFRelease(v4);
    v4 = 0;
  }
  if (a2)
    *a2 = v3;
  return v4;
}

BOOL sub_10000B14C(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  int v4;

  v4 = lockdown_send_message(a1, a2, 200);
  if (a3)
    *a3 = v4;
  return v4 == 0;
}

void sub_10000B180(uint64_t a1, uint64_t a2)
{
  void *v3;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v5 = CFSTR("Error");
  v6 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1));
  v4 = lockdown_send_message(a1, v3, 200);

  if (v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      sub_10000DE1C(v4);
  }
}

id sub_10000B238(int a1, char *a2)
{
  int v3;
  int *v4;
  char *v5;
  const char *v6;
  uint32_t v7;
  void *v8;
  char v10;
  int *v11;
  char *v12;
  int *v13;
  char *v14;
  socklen_t v15;
  uint8_t buf[4];
  _QWORD v17[3];
  char v18[16];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  sockaddr v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = (sockaddr)0;
  v27 = 0u;
  v15 = 128;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  *(_OWORD *)v18 = 0u;
  v19 = 0u;
  if (!a2)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    *(_WORD *)buf = 0;
    v6 = "out_IPv6 can't be NULL";
LABEL_10:
    v7 = 2;
    goto LABEL_11;
  }
  if (a1 < 0)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    *(_WORD *)buf = 0;
    v6 = "Invalid socket";
    goto LABEL_10;
  }
  if (!getpeername(a1, &v26, &v15))
  {
    if (v26.sa_family == 30)
    {
      if (inet_ntop(30, &v26.sa_data[6], v18, 0x80u))
      {
        v10 = 1;
        goto LABEL_20;
      }
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        goto LABEL_12;
      v13 = __error();
      v14 = strerror(*v13);
      *(_DWORD *)buf = 136315138;
      v17[0] = v14;
      v6 = "Can't convert to ipv6 string: %s";
    }
    else
    {
      if (v26.sa_family != 2)
      {
        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          goto LABEL_12;
        *(_DWORD *)buf = 67109120;
        LODWORD(v17[0]) = v26.sa_family;
        v6 = "Unknown socket family %d";
        v7 = 8;
        goto LABEL_11;
      }
      if (inet_ntop(2, &v26.sa_data[2], v18, 0x80u))
      {
        v10 = 0;
LABEL_20:
        *a2 = v10;
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v18));
        return v8;
      }
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        goto LABEL_12;
      v11 = __error();
      v12 = strerror(*v11);
      *(_DWORD *)buf = 136315138;
      v17[0] = v12;
      v6 = "Can't convert to ipv4 string: %s";
    }
    v7 = 12;
    goto LABEL_11;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *__error();
    v4 = __error();
    v5 = strerror(*v4);
    *(_DWORD *)buf = 67109378;
    LODWORD(v17[0]) = v3;
    WORD2(v17[0]) = 2080;
    *(_QWORD *)((char *)v17 + 6) = v5;
    v6 = "getpeername failed: %d (%s)";
    v7 = 18;
LABEL_11:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v6, buf, v7);
  }
LABEL_12:
  v8 = 0;
  return v8;
}

uint64_t start()
{
  dispatch_queue_global_t global_queue;
  NSObject *v1;
  NSObject *v2;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    sub_10000DE98();
  signal(15, (void (__cdecl *)(int))1);
  global_queue = dispatch_get_global_queue(0, 0);
  v1 = objc_claimAutoreleasedReturnValue(global_queue);
  v2 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v1);

  if (v2)
  {
    dispatch_source_set_event_handler(v2, &stru_100014728);
    dispatch_resume(v2);
  }
  lockdown_checkin_xpc("com.apple.companion_proxy", 0, 0, &stru_100014768);
  CFRunLoopRun();

  return 0;
}

void sub_10000B5D0(id a1)
{
  void *v1;
  uint8_t v2[16];
  uint8_t buf[16];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Got SIGTERM, performing shutdown.", buf, 2u);
  }
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[CPXIDSRelayCompanion defaultCPXIDSRelayCompanion](CPXIDSRelayCompanion, "defaultCPXIDSRelayCompanion"));
  objc_msgSend(v1, "teardownAllListeningSockets");

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Got SIGTERM, exiting now.", v2, 2u);
  }
  exit(0);
}

void sub_10000B684(id a1, _lockdown_connection *a2, __CFDictionary *a3)
{
  const void *Value;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  unsigned __int8 v27;
  CPXService *v28;
  unsigned int socket;
  dispatch_queue_global_t global_queue;
  NSObject *v31;
  dispatch_source_t v32;
  CPXService *v33;
  NSObject *v34;
  CPXService *v35;
  int v36;
  id v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  id v42;
  const char *v43;
  void *v44;
  void *v45;
  id v46;
  unsigned int v47;
  void *v48;
  BOOL v49;
  int v50;
  id v51;
  uint64_t v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  double v57;
  _BOOL4 v58;
  uint64_t v59;
  NSMutableArray *v60;
  void *v61;
  int v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  BOOL v71;
  int v72;
  dispatch_queue_global_t v73;
  void *v74;
  id v75;
  dispatch_semaphore_t v76;
  NSObject *v77;
  dispatch_time_t v78;
  const __CFString *v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  NSMutableArray *v83;
  char v84;
  NSMutableArray *v85;
  void *v86;
  BOOL v87;
  int v88;
  _lockdown_connection *v89;
  void *context;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  id v95;
  id obj;
  NSMutableArray *v97;
  uint64_t v98;
  uint64_t *v99;
  uint64_t v100;
  int v101;
  const __CFString *v102;
  void *v103;
  id v104;
  uint8_t v105[16];
  uint8_t v106[16];
  __int128 v107;
  __int128 v108;
  __int128 v109;
  _BYTE *v110;
  _BYTE v111[24];
  uint64_t v112;
  uint8_t buf[32];
  __int128 v114;
  __int128 v115;
  NSMutableArray *v116;
  NSMutableArray **v117;
  uint64_t v118;
  uint64_t (*v119)(uint64_t, uint64_t);
  void (*v120)(uint64_t);
  id v121;
  _BYTE handler[24];
  void *v123;
  CPXService *v124;
  dispatch_source_t v125;
  uint64_t *v126;

  context = objc_autoreleasePoolPush();
  v97 = objc_opt_new(NSMutableArray);
  v98 = 0;
  v99 = &v98;
  v100 = 0x2020000000;
  v101 = 0;
  if ((MGGetBoolAnswer(CFSTR("watch-companion")) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)handler = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "companion_proxy is incompatible with this device", handler, 2u);
    }
    sub_10000B180((uint64_t)a2, (uint64_t)CFSTR("UnsupportedDevice"));
    v91 = 0;
    goto LABEL_28;
  }
  Value = CFDictionaryGetValue(a3, kLockdownCheckinClientNameKey);
  v91 = (void *)objc_claimAutoreleasedReturnValue(Value);
  v6 = sub_10000B0CC((uint64_t)a2, (_DWORD *)v99 + 6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v93 = v7;
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *((_DWORD *)v99 + 6);
      *(_DWORD *)handler = 138412546;
      *(_QWORD *)&handler[4] = v91;
      *(_WORD *)&handler[12] = 1024;
      *(_DWORD *)&handler[14] = v16;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to receive initial message from client %@: 0x08%x", handler, 0x12u);
    }
    sub_10000B180((uint64_t)a2, (uint64_t)CFSTR("NoInitialMessage"));
LABEL_28:
    obj = 0;
    v92 = 0;
    v93 = 0;
LABEL_29:
    v94 = 0;
LABEL_30:
    lockdown_disconnect(a2);
    goto LABEL_31;
  }
  v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Command")));
  if (!v94)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)handler = 138412546;
      *(_QWORD *)&handler[4] = v91;
      *(_WORD *)&handler[12] = 2112;
      *(_QWORD *)&handler[14] = v93;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to receive command in message from %@: %@", handler, 0x16u);
    }
    sub_10000B180((uint64_t)a2, (uint64_t)CFSTR("NoCommandInMessage"));
    obj = 0;
    v92 = 0;
    goto LABEL_29;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    sub_10000DF30((uint64_t)v94);
  v92 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance", a2, context));
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "getDevices"));
  if (objc_msgSend(v94, "isEqualToString:", CFSTR("GetDeviceRegistry")))
  {
    v108 = 0u;
    v109 = 0u;
    *(_OWORD *)v106 = 0u;
    v107 = 0u;
    obj = obj;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", v106, handler, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v107;
      v10 = NRDevicePropertyUDID;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v107 != v9)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*(_QWORD *)&v106[8] + 8 * (_QWORD)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "valueForProperty:", v10));
          if (v13)
          {
            -[NSMutableArray addObject:](v97, "addObject:", v13);
          }
          else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v12;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Got nil UDID from device %@", buf, 0xCu);
          }

        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", v106, handler, 16);
      }
      while (v8);
    }

    if (-[NSMutableArray count](v97, "count"))
    {
      *(_QWORD *)v111 = CFSTR("PairedDevicesArray");
      v116 = v97;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v116, v111, 1));
      if (!sub_10000B14C((uint64_t)v89, (uint64_t)v14, (_DWORD *)v99 + 6)
        && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v15 = *((_DWORD *)v99 + 6);
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v14;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v15;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to send devices message (%@): 0x%08x", buf, 0x12u);
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Companion has no paired devices", buf, 2u);
      }
      sub_10000B180((uint64_t)v89, (uint64_t)CFSTR("NoPairedWatches"));
      v14 = 0;
    }

LABEL_54:
    a2 = v89;
    goto LABEL_30;
  }
  if (!objc_msgSend(v94, "isEqualToString:", CFSTR("GetValueFromRegistry")))
  {
    if (objc_msgSend(v94, "isEqualToString:", CFSTR("StartListeningForDevices")))
    {
      v28 = -[CPXService initWithLockdownContext:]([CPXService alloc], "initWithLockdownContext:", a2);
      socket = lockdown_get_socket(a2);
      if ((socket & 0x80000000) == 0)
      {
        -[CPXService startService](v28, "startService");
        global_queue = dispatch_get_global_queue(0, 0);
        v31 = objc_claimAutoreleasedReturnValue(global_queue);
        v32 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, socket, 0, v31);

        *(_QWORD *)handler = _NSConcreteStackBlock;
        *(_QWORD *)&handler[8] = 3221225472;
        *(_QWORD *)&handler[16] = sub_10000CC84;
        v123 = &unk_1000147B8;
        v33 = v28;
        v125 = v32;
        v126 = &v98;
        v124 = v33;
        v34 = v32;
        dispatch_source_set_event_handler(v34, handler);
        *(_QWORD *)v106 = _NSConcreteStackBlock;
        *(_QWORD *)&v106[8] = 3221225472;
        *(_QWORD *)&v107 = sub_10000CD5C;
        *((_QWORD *)&v107 + 1) = &unk_1000147E0;
        *(_QWORD *)&v108 = v33;
        v35 = v33;
        dispatch_source_set_cancel_handler(v34, v106);
        dispatch_resume(v34);

        goto LABEL_31;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)handler = 138412290;
        *(_QWORD *)&handler[4] = v91;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to get socket for connection from client %@", handler, 0xCu);
      }
      sub_10000B180((uint64_t)a2, (uint64_t)CFSTR("NoSocket"));

    }
    else if (objc_msgSend(v94, "isEqualToString:", CFSTR("StartForwardingServicePort")))
    {
      LOBYTE(v116) = 0;
      v36 = lockdown_get_socket(a2);
      v37 = sub_10000B238(v36, (char *)&v116);
      v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
      if (!v38)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)handler = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to get required host IP", handler, 2u);
        }
        sub_10000B180((uint64_t)a2, (uint64_t)CFSTR("ServiceProxySetup"));
        goto LABEL_30;
      }
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("PreferWifi")));
      v40 = _NSIsNSNumber();

      if (v40)
      {
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("PreferWifi")));
        v42 = objc_msgSend(v41, "BOOLValue");

      }
      else
      {
        v42 = 0;
      }
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("GizmoRemotePortNumber")));
      if (v63)
      {
        v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("IsServiceLowPriority")));
        v65 = objc_msgSend(v64, "BOOLValue");

        v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("ForwardedServiceName")));
        v67 = (void *)objc_claimAutoreleasedReturnValue(+[CPXIDSRelayCompanion defaultCPXIDSRelayCompanion](CPXIDSRelayCompanion, "defaultCPXIDSRelayCompanion"));
        v68 = objc_msgSend(v63, "unsignedShortValue");
        v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "setupListeningSocket:serviceName:requiredHostIP:ipV6:isLowPriority:preferWifi:", v68, v66, v38, v116, v65, v42));

        if (v69)
        {
          *(_QWORD *)v106 = CFSTR("Command");
          *(_QWORD *)&v106[8] = CFSTR("CompanionProxyServicePort");
          *(_QWORD *)handler = CFSTR("CompanionServiceSetup");
          *(_QWORD *)&handler[8] = v69;
          v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", handler, v106, 2));
          v71 = sub_10000B14C((uint64_t)v89, (uint64_t)v70, (_DWORD *)v99 + 6);

          if (!v71 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            v72 = *((_DWORD *)v99 + 6);
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = v72;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to send companion service setup message: 0x%08x", buf, 8u);
          }
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)handler = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to setup forwarding port", handler, 2u);
          }
          sub_10000B180((uint64_t)v89, (uint64_t)CFSTR("ServiceProxySetup"));
        }

      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)handler = 138412546;
          *(_QWORD *)&handler[4] = v91;
          *(_WORD *)&handler[12] = 2112;
          *(_QWORD *)&handler[14] = v93;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to receive port number in message from %@: %@", handler, 0x16u);
        }
        sub_10000B180((uint64_t)v89, (uint64_t)CFSTR("MalformedCommand"));

      }
    }
    else
    {
      if (!objc_msgSend(v94, "isEqualToString:", CFSTR("StopForwardingServicePort")))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)handler = 138412546;
          *(_QWORD *)&handler[4] = v91;
          *(_WORD *)&handler[12] = 2112;
          *(_QWORD *)&handler[14] = v94;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unsupported command from %@: %@", handler, 0x16u);
        }
        sub_10000B180((uint64_t)a2, (uint64_t)CFSTR("UnsupportedCommand"));
        goto LABEL_30;
      }
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("GizmoRemotePortNumber")));
      if (v44)
      {
        v45 = (void *)objc_claimAutoreleasedReturnValue(+[CPXIDSRelayCompanion defaultCPXIDSRelayCompanion](CPXIDSRelayCompanion, "defaultCPXIDSRelayCompanion"));
        objc_msgSend(v45, "teardownListeningSocket:", objc_msgSend(v44, "unsignedIntegerValue"));

        v46 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v47 = objc_msgSend(v44, "intValue");
          *(_DWORD *)handler = 67109120;
          *(_DWORD *)&handler[4] = v47;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Stopped forwarding to gizmo port %d", handler, 8u);
        }

        *(_QWORD *)v106 = CFSTR("Command");
        *(_QWORD *)handler = CFSTR("ComandSuccess");
        v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", handler, v106, 1));
        v49 = sub_10000B14C((uint64_t)v89, (uint64_t)v48, (_DWORD *)v99 + 6);

        if (!v49 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v50 = *((_DWORD *)v99 + 6);
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v50;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to send companion service setup message: 0x%08x", buf, 8u);
        }
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)handler = 138412546;
          *(_QWORD *)&handler[4] = v91;
          *(_WORD *)&handler[12] = 2112;
          *(_QWORD *)&handler[14] = v93;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to receive port number in message from %@: %@", handler, 0x16u);
        }
        sub_10000B180((uint64_t)a2, (uint64_t)CFSTR("MalformedCommand"));
      }

    }
    goto LABEL_54;
  }
  v116 = 0;
  v117 = &v116;
  v118 = 0x3032000000;
  v119 = sub_10000CA98;
  v120 = sub_10000CAA8;
  v121 = 0;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("GetValueGizmoUDIDKey")));
  if (!v17)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)handler = 138412546;
      *(_QWORD *)&handler[4] = v91;
      *(_WORD *)&handler[12] = 2112;
      *(_QWORD *)&handler[14] = v93;
      v43 = "Failed to receive gizmoUDID in message from %@: %@.";
LABEL_81:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v43, handler, 0x16u);
    }
LABEL_82:
    sub_10000B180((uint64_t)a2, (uint64_t)CFSTR("MalformedCommand"));
    v61 = 0;
    v51 = 0;
    v54 = 0;
    v19 = 0;
    goto LABEL_83;
  }
  v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("GetValueKeyKey")));
  if (!v18)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)handler = 138412546;
      *(_QWORD *)&handler[4] = v91;
      *(_WORD *)&handler[12] = 2112;
      *(_QWORD *)&handler[14] = v93;
      v43 = "Failed to receive GetValueKey in message from %@: %@";
      goto LABEL_81;
    }
    goto LABEL_82;
  }
  v19 = (id)v18;
  v114 = 0u;
  v115 = 0u;
  memset(buf, 0, sizeof(buf));
  v20 = obj;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", buf, handler, 16);
  if (v21)
  {
    v22 = **(_QWORD **)&buf[16];
    v23 = NRDevicePropertyUDID;
LABEL_40:
    v24 = 0;
    while (1)
    {
      if (**(_QWORD **)&buf[16] != v22)
        objc_enumerationMutation(v20);
      v25 = *(void **)(*(_QWORD *)&buf[8] + 8 * v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "valueForProperty:", v23));
      v27 = objc_msgSend(v17, "isEqualToString:", v26);

      if ((v27 & 1) != 0)
        break;
      if (v21 == (id)++v24)
      {
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", buf, handler, 16);
        if (v21)
          goto LABEL_40;
        goto LABEL_46;
      }
    }
    v51 = v25;

    if (!v51)
      goto LABEL_75;
    v52 = qword_10001A010;
    v53 = v19;
    if (v52 != -1)
      dispatch_once(&qword_10001A010, &stru_100014800);
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10001A008, "valueForKey:", v53));

    if (v54)
    {
      if (qword_10001A000)
      {
        v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10001A000, "objectForKeyedSubscript:", CFSTR("CPXAboutInfoDateKey")));
        objc_msgSend(v55, "timeIntervalSinceDate:", v56);
        v58 = v57 < 10.0;

        if (v58)
        {
          v59 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10001A000, "objectForKeyedSubscript:", v54));
          v60 = v117[5];
          v117[5] = (NSMutableArray *)v59;

LABEL_125:
          v85 = v117[5];
          v104 = v53;
          *(_QWORD *)v105 = v85;
          v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v105, &v104, 1));
          v102 = CFSTR("RetrievedValueDictionary");
          v103 = v61;
          v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v103, &v102, 1));
          v87 = sub_10000B14C((uint64_t)v89, (uint64_t)v86, (_DWORD *)v99 + 6);

          if (!v87 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            v88 = *((_DWORD *)v99 + 6);
            *(_DWORD *)v111 = 138412546;
            *(_QWORD *)&v111[4] = v61;
            *(_WORD *)&v111[12] = 1024;
            *(_DWORD *)&v111[14] = v88;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to send retrieved value message (%@): 0x%08x", v111, 0x12u);
          }
          v62 = 0;
          v19 = v53;
          goto LABEL_84;
        }
      }
      v73 = dispatch_get_global_queue(0, 0);
      v74 = (void *)objc_claimAutoreleasedReturnValue(v73);
      v75 = objc_msgSend(objc_alloc((Class)NSSManager), "initWithQueue:", v74);
      v76 = dispatch_semaphore_create(0);
      *(_QWORD *)v111 = 0;
      *(_QWORD *)&v111[8] = v111;
      *(_QWORD *)&v111[16] = 0x2020000000;
      v112 = 0;
      *(_QWORD *)v106 = _NSConcreteStackBlock;
      *(_QWORD *)&v106[8] = 3221225472;
      *(_QWORD *)&v107 = sub_10000CAB0;
      *((_QWORD *)&v107 + 1) = &unk_100014790;
      *((_QWORD *)&v109 + 1) = &v116;
      v95 = v54;
      *(_QWORD *)&v108 = v95;
      v19 = v53;
      *((_QWORD *)&v108 + 1) = v19;
      v110 = v111;
      v77 = v76;
      *(_QWORD *)&v109 = v77;
      objc_msgSend(v75, "getAboutInfo:", v106);
      v78 = dispatch_time(0, 5000000000);
      if (dispatch_semaphore_wait(v77, v78))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v105 = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Timeout waiting for reply from getAboutInfo", v105, 2u);
        }
        v79 = CFSTR("TimeoutReply");
      }
      else
      {
        v79 = *(const __CFString **)(*(_QWORD *)&v111[8] + 24);
        if (!v79)
        {
          v62 = 0;
          v84 = 1;
LABEL_124:

          _Block_object_dispose(v111, 8);
          if ((v84 & 1) == 0)
          {
            v61 = 0;
            v54 = v95;
            goto LABEL_84;
          }
          goto LABEL_125;
        }
      }
      sub_10000B180((uint64_t)v89, (uint64_t)v79);
      v84 = 0;
      v62 = 2;
      goto LABEL_124;
    }
    v80 = qword_10001A020;
    v19 = v53;
    if (v80 != -1)
      dispatch_once(&qword_10001A020, &stru_100014820);
    v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10001A018, "valueForKey:", v19));

    v82 = objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "valueForProperty:", v81));
    v83 = v117[5];
    v117[5] = (NSMutableArray *)v82;

    if (v117[5])
      goto LABEL_125;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v106 = 138412290;
      *(_QWORD *)&v106[4] = v19;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unsupported key on a Watch: %@", v106, 0xCu);
    }
    sub_10000B180((uint64_t)v89, (uint64_t)CFSTR("UnsupportedWatchKey"));
    v61 = 0;
  }
  else
  {
LABEL_46:

LABEL_75:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v106 = 138412290;
      *(_QWORD *)&v106[4] = v17;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "No gizmo matching UDID: %@", v106, 0xCu);
    }
    sub_10000B180((uint64_t)v89, (uint64_t)CFSTR("NoMatchingWatch"));
    v61 = 0;
    v51 = 0;
  }
  v54 = 0;
LABEL_83:
  v62 = 2;
LABEL_84:

  _Block_object_dispose(&v116, 8);
  a2 = v89;
  if ((v62 | 2) == 2)
    goto LABEL_30;
LABEL_31:
  _Block_object_dispose(&v98, 8);

  objc_autoreleasePoolPop(context);
}

void sub_10000CA08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000CA98(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10000CAA8(uint64_t a1)
{

}

void sub_10000CAB0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  const __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  id v18;
  __int16 v19;
  uint64_t v20;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412290;
      v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Error on reply from getAboutInfo: %@", (uint8_t *)&v17, 0xCu);
    }
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v8 = CFSTR("ErrorReply");
  }
  else
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32)));
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    {
      v12 = objc_msgSend(v5, "mutableCopy");
      v13 = (void *)qword_10001A000;
      qword_10001A000 = (uint64_t)v12;

      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      objc_msgSend((id)qword_10001A000, "setObject:forKeyedSubscript:", v14, CFSTR("CPXAboutInfoDateKey"));

      goto LABEL_8;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(_QWORD *)(a1 + 32);
      v15 = *(void **)(a1 + 40);
      v17 = 138412546;
      v18 = v15;
      v19 = 2112;
      v20 = v16;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "NSS value missing for key: %@, %@", (uint8_t *)&v17, 0x16u);
    }
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v8 = CFSTR("UnexpectedReply");
  }
  *(_QWORD *)(v7 + 24) = v8;
LABEL_8:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

void sub_10000CC84(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "receiveMessageWithError:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) != 1
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 138412290;
    v4 = v2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Got unexpected incoming message: %@", (uint8_t *)&v3, 0xCu);
  }
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));

}

id sub_10000CD5C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopService");
}

void sub_10000CD64(id a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[3];
  _QWORD v4[3];

  v3[0] = CFSTR("BatteryIsCharging");
  v3[1] = CFSTR("BatteryCurrentCapacity");
  v4[0] = kNSSAboutBatteryIsChargingKey;
  v4[1] = kNSSAboutBatteryCurrentCapacityKey;
  v3[2] = CFSTR("AmountDataAvailable");
  v4[2] = kNSSUsageAvailableStorageKey;
  v1 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 3));
  v2 = (void *)qword_10001A008;
  qword_10001A008 = v1;

}

void sub_10000CE20(id a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[16];
  _QWORD v4[16];

  v3[0] = CFSTR("HardwareModel");
  v3[1] = CFSTR("DeviceName");
  v4[0] = NRDevicePropertyHWModelString;
  v4[1] = NRDevicePropertyName;
  v3[2] = CFSTR("DeviceClass");
  v3[3] = CFSTR("BluetoothAddress");
  v4[2] = NRDevicePropertyClass;
  v4[3] = NRDevicePropertyBluetoothMACAddress;
  v3[4] = CFSTR("RegionInfo");
  v3[5] = CFSTR("UniqueDeviceID");
  v4[4] = NRDevicePropertyRegionInfo;
  v4[5] = NRDevicePropertyUDID;
  v3[6] = CFSTR("ModelNumber");
  v3[7] = CFSTR("BuildVersion");
  v4[6] = NRDevicePropertyModelNumber;
  v4[7] = NRDevicePropertySystemBuildVersion;
  v3[8] = CFSTR("ProductType");
  v3[9] = CFSTR("ProductName");
  v4[8] = NRDevicePropertyProductType;
  v4[9] = NRDevicePropertySystemName;
  v3[10] = CFSTR("SerialNumber");
  v3[11] = CFSTR("WiFiAddress");
  v4[10] = NRDevicePropertySerialNumber;
  v4[11] = NRDevicePropertyWIFIMACAddress;
  v3[12] = CFSTR("ProductVersion");
  v3[13] = CFSTR("DeviceColor");
  v4[12] = NRDevicePropertySystemVersion;
  v4[13] = NRDevicePropertyColor;
  v3[14] = CFSTR("DeviceEnclosureColor");
  v3[15] = CFSTR("TotalDataCapacity");
  v4[14] = NRDevicePropertyEnclosureColor;
  v4[15] = NRDevicePropertyTotalStorage;
  v1 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 16));
  v2 = (void *)qword_10001A018;
  qword_10001A018 = v1;

}

void sub_10000D018()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Socket data logging is enabled", v0, 2u);
}

void sub_10000D05C(void *a1, uint8_t *buf, _QWORD *a3)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Enabled service socket logging for %@", buf, 0xCu);

}

void sub_10000D0B4(uint64_t a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v2 = objc_msgSend((id)sub_100006F04(a1), "serviceName");
  objc_claimAutoreleasedReturnValue(v2);
  sub_100006E6C();
  sub_100006E78();
  sub_100006EA0((void *)&_mh_execute_header, &_os_log_default, v3, "%@(%lu) LOCAL->IDS read src closed cleanly on recv", v4, v5, v6, v7, v8);

  sub_100006EBC();
}

void sub_10000D134(uint64_t a1)
{
  void *v1;
  id v2;
  int *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v2 = objc_msgSend((id)sub_100006F10(a1, __stack_chk_guard), "serviceName");
  objc_claimAutoreleasedReturnValue(v2);
  sub_100006E6C();
  v3 = sub_100006EFC();
  sub_100006EF4(v3);
  sub_100006E48();
  sub_100006E90((void *)&_mh_execute_header, &_os_log_default, v4, "%@(%lu) LOCAL->IDS read src closed with error on recv: %s", v5, v6, v7, v8, v9);

  sub_100006EB0();
}

void sub_10000D1BC(uint64_t a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v2 = objc_msgSend((id)sub_100006F04(a1), "serviceName");
  objc_claimAutoreleasedReturnValue(v2);
  sub_100006E6C();
  sub_100006E78();
  sub_100006EA0((void *)&_mh_execute_header, &_os_log_default, v3, "%@(%lu) LOCAL->IDS read src closed cleanly on send", v4, v5, v6, v7, v8);

  sub_100006EBC();
}

void sub_10000D23C(uint64_t a1)
{
  void *v1;
  id v2;
  int *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v2 = objc_msgSend((id)sub_100006F10(a1, __stack_chk_guard), "serviceName");
  objc_claimAutoreleasedReturnValue(v2);
  sub_100006E6C();
  v3 = sub_100006EFC();
  sub_100006EF4(v3);
  sub_100006E48();
  sub_100006E90((void *)&_mh_execute_header, &_os_log_default, v4, "%@(%lu) LOCAL->IDS read src closed with error on send: %s", v5, v6, v7, v8, v9);

  sub_100006EB0();
}

void sub_10000D2C4(uint64_t a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v2 = objc_msgSend((id)sub_100006F04(a1), "serviceName");
  objc_claimAutoreleasedReturnValue(v2);
  sub_100006E6C();
  sub_100006E78();
  sub_100006EA0((void *)&_mh_execute_header, &_os_log_default, v3, "%@(%lu) LOCAL->IDS read src closed cleanly on write send", v4, v5, v6, v7, v8);

  sub_100006EBC();
}

void sub_10000D344(id *a1)
{
  void *v1;
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_claimAutoreleasedReturnValue(objc_msgSend(*a1, "serviceName"));
  sub_100006F3C();
  v2 = __error();
  sub_100006EF4(v2);
  sub_100006EC8();
  sub_100006F1C((void *)&_mh_execute_header, &_os_log_default, v3, "%@(%lu) LOCAL->IDS: %ld return from send : %s", v4, v5, v6, v7, v8);

  sub_100006F2C();
}

void sub_10000D3DC(uint64_t a1)
{
  void *v1;
  id v2;
  int *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v2 = objc_msgSend((id)sub_100006F10(a1, __stack_chk_guard), "serviceName");
  objc_claimAutoreleasedReturnValue(v2);
  sub_100006E6C();
  v3 = sub_100006EFC();
  sub_100006EF4(v3);
  sub_100006E48();
  sub_100006E90((void *)&_mh_execute_header, &_os_log_default, v4, "%@(%lu) LOCAL->IDS read src closed with error on write send: %s", v5, v6, v7, v8, v9);

  sub_100006EB0();
}

void sub_10000D464(uint64_t a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v2 = objc_msgSend((id)sub_100006F04(a1), "serviceName");
  objc_claimAutoreleasedReturnValue(v2);
  sub_100006E6C();
  sub_100006E78();
  sub_100006EA0((void *)&_mh_execute_header, &_os_log_default, v3, "%@(%lu) IDS->LOCAL read src closed cleanly on recv", v4, v5, v6, v7, v8);

  sub_100006EBC();
}

void sub_10000D4E4(uint64_t a1)
{
  void *v1;
  id v2;
  int *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v2 = objc_msgSend((id)sub_100006F10(a1, __stack_chk_guard), "serviceName");
  objc_claimAutoreleasedReturnValue(v2);
  sub_100006E6C();
  v3 = sub_100006EFC();
  sub_100006EF4(v3);
  sub_100006E48();
  sub_100006E90((void *)&_mh_execute_header, &_os_log_default, v4, "%@(%lu) IDS->LOCAL read src closed with error on recv: %s", v5, v6, v7, v8, v9);

  sub_100006EB0();
}

void sub_10000D56C(uint64_t a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v2 = objc_msgSend((id)sub_100006F04(a1), "serviceName");
  objc_claimAutoreleasedReturnValue(v2);
  sub_100006E6C();
  sub_100006E78();
  sub_100006EA0((void *)&_mh_execute_header, &_os_log_default, v3, "%@(%lu) IDS->LOCAL read src closed cleanly on send", v4, v5, v6, v7, v8);

  sub_100006EBC();
}

void sub_10000D5EC(uint64_t a1)
{
  void *v1;
  id v2;
  int *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v2 = objc_msgSend((id)sub_100006F10(a1, __stack_chk_guard), "serviceName");
  objc_claimAutoreleasedReturnValue(v2);
  sub_100006E6C();
  v3 = sub_100006EFC();
  sub_100006EF4(v3);
  sub_100006E48();
  sub_100006E90((void *)&_mh_execute_header, &_os_log_default, v4, "%@(%lu) IDS->LOCAL read src closed with error on send: %s", v5, v6, v7, v8, v9);

  sub_100006EB0();
}

void sub_10000D674(uint64_t a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v2 = objc_msgSend((id)sub_100006F04(a1), "serviceName");
  objc_claimAutoreleasedReturnValue(v2);
  sub_100006E6C();
  sub_100006E78();
  sub_100006EA0((void *)&_mh_execute_header, &_os_log_default, v3, "%@(%lu) IDS->LOCAL read src closed cleanly on write send", v4, v5, v6, v7, v8);

  sub_100006EBC();
}

void sub_10000D6F4(id *a1)
{
  void *v1;
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_claimAutoreleasedReturnValue(objc_msgSend(*a1, "serviceName"));
  sub_100006F3C();
  v2 = __error();
  sub_100006EF4(v2);
  sub_100006EC8();
  sub_100006F1C((void *)&_mh_execute_header, &_os_log_default, v3, "%@(%lu) IDS->LOCAL: %ld return from send : %s", v4, v5, v6, v7, v8);

  sub_100006F2C();
}

void sub_10000D78C(uint64_t a1)
{
  void *v1;
  id v2;
  int *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v2 = objc_msgSend((id)sub_100006F10(a1, __stack_chk_guard), "serviceName");
  objc_claimAutoreleasedReturnValue(v2);
  sub_100006E6C();
  v3 = sub_100006EFC();
  sub_100006EF4(v3);
  sub_100006E48();
  sub_100006E90((void *)&_mh_execute_header, &_os_log_default, v4, "%@(%lu) IDS->LOCAL read src closed with error on write send: %s", v5, v6, v7, v8, v9);

  sub_100006EB0();
}

void sub_10000D814(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000851C((void *)&_mh_execute_header, &_os_log_default, a3, "Notification: %@", a5, a6, a7, a8, 2u);
  sub_10000854C();
}

void sub_10000D88C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000851C((void *)&_mh_execute_header, &_os_log_default, a3, "Notification: %@", a5, a6, a7, a8, 2u);
  sub_10000854C();
}

void sub_10000D904(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000851C((void *)&_mh_execute_header, &_os_log_default, a3, "Notification: %@", a5, a6, a7, a8, 2u);
  sub_10000854C();
}

void sub_10000D97C(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "udid"));
  sub_10000853C((void *)&_mh_execute_header, &_os_log_default, v1, "nearbyState changed to %d for %@", v2, v3, v4, v5, 2u);

  sub_100006EBC();
}

void sub_10000DA0C(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "udid"));
  sub_10000853C((void *)&_mh_execute_header, &_os_log_default, v1, "nearbyState changed to %d for %@", v2, v3, v4, v5, 2u);

  sub_100006EBC();
}

void sub_10000DA98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000852C((void *)&_mh_execute_header, &_os_log_default, a3, "Active paired device, but no UDID. Pairing is probably in progress.", a5, a6, a7, a8, 0);
}

void sub_10000DAD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000852C((void *)&_mh_execute_header, &_os_log_default, a3, "No activate paired device.", a5, a6, a7, a8, 0);
}

void sub_10000DB08()
{
  __assert_rtn("-[CPXIDSRelayCompanion startTimerForUDID:queue:timeout:withErrorCallback:]", "CPXIDSRelayCompanion.m", 152, "uuid");
}

void sub_10000DB30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000851C((void *)&_mh_execute_header, &_os_log_default, a3, "Starting timer for %@", a5, a6, a7, a8, 2u);
  sub_10000854C();
}

void sub_10000DB9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000851C((void *)&_mh_execute_header, &_os_log_default, a3, "Timeout occurred for %@", a5, a6, a7, a8, 2u);
  sub_10000854C();
}

void sub_10000DC0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000851C((void *)&_mh_execute_header, &_os_log_default, a3, "Stopping timer for %@", a5, a6, a7, a8, 2u);
  sub_10000854C();
}

void sub_10000DC78()
{
  __assert_rtn("-[CPXIDSRelayCompanion teardownAllListeningSockets]", "CPXIDSRelayCompanion.m", 386, "[self.connectionSources count] == 0");
}

void sub_10000DCA0(_QWORD *a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _DWORD v5[2];
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;

  v1 = *(_DWORD *)(*(_QWORD *)(a1[8] + 8) + 24);
  v2 = *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 24);
  v3 = a1[4];
  v4 = *(_QWORD *)(*(_QWORD *)(a1[10] + 8) + 40);
  v5[0] = 67109890;
  v5[1] = v1;
  v6 = 2048;
  v7 = v2;
  v8 = 2112;
  v9 = v3;
  v10 = 2112;
  v11 = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Created connection to socket %d, port %ld, stream %@ for %@", (uint8_t *)v5, 0x26u);
}

void sub_10000DD60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000851C((void *)&_mh_execute_header, &_os_log_default, a3, "Terminating connection to port %ld", a5, a6, a7, a8, 0);
  sub_10000854C();
}

void sub_10000DDD8()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Terminating the bridge connection", v0, 2u);
}

void sub_10000DE1C(int a1)
{
  _DWORD v1[2];

  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Could not send error response to host: 0x%08x", (uint8_t *)v1, 8u);
}

void sub_10000DE98()
{
  int v0;
  const char *v1;
  __int16 v2;
  const char *v3;

  v0 = 136315394;
  v1 = "Aug  3 2024";
  v2 = 2080;
  v3 = "07:36:52";
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "companion_proxy built at %s %s started", (uint8_t *)&v0, 0x16u);
}

void sub_10000DF30(uint64_t a1)
{
  int v1;
  uint64_t v2;

  v1 = 138412290;
  v2 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Received command: %@", (uint8_t *)&v1, 0xCu);
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDString");
}

id objc_msgSend_acceptConnection_socket_targetPort_serviceName_requiredHostIP_isLowPriority_preferWifi_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "acceptConnection:socket:targetPort:serviceName:requiredHostIP:isLowPriority:preferWifi:");
}

id objc_msgSend_acquirePort_isLowPriority_preferWifi_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "acquirePort:isLowPriority:preferWifi:");
}

id objc_msgSend_addDelegate_queue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addDelegate:queue:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserverForName_object_queue_usingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserverForName:object:queue:usingBlock:");
}

id objc_msgSend_addPropertyObserver_forPropertyChanges_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addPropertyObserver:forPropertyChanges:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allValues");
}

id objc_msgSend_arrayForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayForKey:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bridgeCompletion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bridgeCompletion");
}

id objc_msgSend_bridgeSocket(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bridgeSocket");
}

id objc_msgSend_checkNearbyDevices_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkNearbyDevices:");
}

id objc_msgSend_clientHostIPAddress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientHostIPAddress");
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "close");
}

id objc_msgSend_conn(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "conn");
}

id objc_msgSend_connectionMap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionMap");
}

id objc_msgSend_connectionSourceGroup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionSourceGroup");
}

id objc_msgSend_connectionSources(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionSources");
}

id objc_msgSend_connectionTimers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionTimers");
}

id objc_msgSend_copyLockdownPortNumWithRequireHostIP_ipV6_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyLockdownPortNumWithRequireHostIP:ipV6:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithPropertyList:format:options:error:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_defaultCPXIDSRelayCompanion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCPXIDSRelayCompanion");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "device");
}

id objc_msgSend_deviceForFromID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceForFromID:");
}

id objc_msgSend_deviceForNRDevice_fromIDSDevices_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceForNRDevice:fromIDSDevices:");
}

id objc_msgSend_devices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "devices");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_getAboutInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAboutInfo:");
}

id objc_msgSend_getActivePairedDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getActivePairedDevice");
}

id objc_msgSend_getDevices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getDevices");
}

id objc_msgSend_getPairedDevices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPairedDevices");
}

id objc_msgSend_handleGenericCPXConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleGenericCPXConnection:");
}

id objc_msgSend_handleIDSRelayConnectionResponse_fromID_UUID_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleIDSRelayConnectionResponse:fromID:UUID:context:");
}

id objc_msgSend_handlePairingNotification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handlePairingNotification:");
}

id objc_msgSend_highPriorityPortConnections(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "highPriorityPortConnections");
}

id objc_msgSend_initSocketWithDevice_options_completionHandler_queue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initSocketWithDevice:options:completionHandler:queue:");
}

id objc_msgSend_initWithIDSDeviceConnection_idsMessageContext_localSocket_bridgeSocket_localCompletion_bridgeCompletion_serviceName_servicePort_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIDSDeviceConnection:idsMessageContext:localSocket:bridgeSocket:localCompletion:bridgeCompletion:serviceName:servicePort:");
}

id objc_msgSend_initWithLockdownContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithLockdownContext:");
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithQueue:");
}

id objc_msgSend_initWithServerPort_targetingPort_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithServerPort:targetingPort:");
}

id objc_msgSend_initWithService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithService:");
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSuiteName:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_ipV6(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ipV6");
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isActive");
}

id objc_msgSend_isEqualToCPXIDSproxy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToCPXIDSproxy:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isNearby(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isNearby");
}

id objc_msgSend_localCompletion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localCompletion");
}

id objc_msgSend_localSocket(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localSocket");
}

id objc_msgSend_lowPriorityPortConnections(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lowPriorityPortConnections");
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainQueue");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_nearby(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nearby");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedShort_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedShort:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "propertyListWithData:options:format:error:");
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queue");
}

id objc_msgSend_receiveMessageWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "receiveMessageWithError:");
}

id objc_msgSend_releasePort_isLowPriority_preferWifi_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "releasePort:isLowPriority:preferWifi:");
}

id objc_msgSend_removeDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeDelegate:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removePropertyObserver_forPropertyChanges_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removePropertyObserver:forPropertyChanges:");
}

id objc_msgSend_sendData_toDestinations_priority_options_identifier_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendData:toDestinations:priority:options:identifier:error:");
}

id objc_msgSend_sendMessage_messageDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendMessage:messageDictionary:");
}

id objc_msgSend_serverPort(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serverPort");
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "service");
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceName");
}

id objc_msgSend_servicePort(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "servicePort");
}

id objc_msgSend_serviceStarted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceStarted");
}

id objc_msgSend_setActiveObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActiveObserver:");
}

id objc_msgSend_setDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDevice:");
}

id objc_msgSend_setInactiveObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInactiveObserver:");
}

id objc_msgSend_setLinkPreferences_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLinkPreferences:");
}

id objc_msgSend_setNearby_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNearby:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPairObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPairObserver:");
}

id objc_msgSend_setPreferInfraWiFi_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreferInfraWiFi:");
}

id objc_msgSend_setService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setService:");
}

id objc_msgSend_setServiceStarted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setServiceStarted:");
}

id objc_msgSend_setUdid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUdid:");
}

id objc_msgSend_setUnpairObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUnpairObserver:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setupListeningSocket_serviceName_requiredHostIP_ipV6_isLowPriority_preferWifi_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupListeningSocket:serviceName:requiredHostIP:ipV6:isLowPriority:preferWifi:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_startService(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startService");
}

id objc_msgSend_startTimerForUDID_queue_timeout_withErrorCallback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startTimerForUDID:queue:timeout:withErrorCallback:");
}

id objc_msgSend_stopTimerForUDID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopTimerForUDID:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_targetPort(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "targetPort");
}

id objc_msgSend_teardownAllListeningSockets(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "teardownAllListeningSockets");
}

id objc_msgSend_teardownListeningSocket_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "teardownListeningSocket:");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_udid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "udid");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_unsignedShortValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedShortValue");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_valueForProperty_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForProperty:");
}

id objc_msgSend_wifiPortConnections(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wifiPortConnections");
}
