int main(int argc, const char **argv, const char **envp)
{
  NSObject *v3;
  id v4;
  PETService *v5;
  _QWORD handler[5];
  uint8_t buf[16];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "PET daemon has launched", buf, 2u);
  }
  v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, 0);
  dispatch_source_set_event_handler(v3, &stru_10000C398);
  dispatch_resume(v3);
  _set_user_dir_suffix("com.apple.proactiveeventtrackerd");
  v4 = NSTemporaryDirectory();
  v5 = objc_opt_new(PETService);
  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to initialize PET service. Exiting...", buf, 2u);
    }
    exit(1);
  }
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100004210;
  handler[3] = &unk_10000C3C0;
  handler[4] = v5;
  xpc_activity_register("com.apple.proactiveeventtrackerd.sendDaily", XPC_ACTIVITY_CHECK_IN, handler);
  xpc_activity_register("com.apple.proactiveeventtrackerd.updateAssetMetadata", XPC_ACTIVITY_CHECK_IN, &stru_10000C400);
  dispatch_main();
}

void sub_100004210(uint64_t a1, void *a2)
{
  id v3;
  uint8_t v4[16];
  uint8_t buf[16];

  v3 = a2;
  if (xpc_activity_get_state((xpc_activity_t)v3) == 2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Running sendDaily", buf, 2u);
    }
    sub_100004380(v3);
    objc_msgSend(*(id *)(a1 + 32), "upload");
    if (!xpc_activity_set_state((xpc_activity_t)v3, 5)
      && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Error setting XPC activity state to DONE", v4, 2u);
    }
  }

}

void sub_1000042F0(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  uint8_t v3[16];

  v2 = a2;
  if (xpc_activity_get_state(v2) == 2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Running updateAssetMetadata", v3, 2u);
    }
    +[PETService updateMobileAssetMetadataWithXPCActivity:](PETService, "updateMobileAssetMetadataWithXPCActivity:", v2);
    sub_100004380(v2);
  }

}

void sub_100004380(void *a1)
{
  id v1;
  dispatch_time_t v2;
  NSObject *v3;
  id v4;
  _QWORD block[4];
  id v6;

  v1 = a1;
  v2 = dispatch_time(0, 1000000000);
  v3 = dispatch_queue_create("com.apple.proactiveeventtrackerd.xpcMonitor", 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004430;
  block[3] = &unk_10000C428;
  v6 = v1;
  v4 = v1;
  dispatch_after(v2, v3, block);

}

void sub_100004430(uint64_t a1)
{
  xpc_activity_state_t state;
  uint8_t v3[16];
  uint8_t v4[16];
  uint8_t v5[16];
  uint8_t buf[16];

  state = xpc_activity_get_state(*(xpc_activity_t *)(a1 + 32));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Checking defer for XPC activity", buf, 2u);
  }
  while (state == 4 || state == 2)
  {
    if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Setting XPC activity state to DEFER", v5, 2u);
      }
      if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 3)
        && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v4 = 0;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Error setting XPC activity state to DEFER", v4, 2u);
      }
      break;
    }
    +[NSThread sleepForTimeInterval:](NSThread, "sleepForTimeInterval:", 0.100000001);
    state = xpc_activity_get_state(*(xpc_activity_t *)(a1 + 32));
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Finished checking defer for XPC activity", v3, 2u);
  }
}

void sub_1000045C8(id a1)
{
  uint8_t v1[16];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Received SIGTERM. Exiting...", v1, 2u);
  }
  exit(0);
}

void sub_100005200(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_100005D94(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[3];
  _QWORD v12[3];
  _QWORD v13[2];
  _QWORD v14[2];
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;

  v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v10 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v16 = v3;
      v17 = 2112;
      v18 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%@ to report data to FBFv2. Error: %@", buf, 0x16u);
    }
    v13[0] = CFSTR("reason");
    v13[1] = CFSTR("group");
    v4 = *(_QWORD *)(a1 + 32);
    v14[0] = v3;
    v14[1] = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 2));
    AnalyticsSendEvent(CFSTR("com.apple.proactive.petd.upload_failed"), v5);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(void **)(a1 + 32);
      v7 = objc_msgSend(*(id *)(a1 + 40), "length");
      *(_DWORD *)buf = 138412546;
      v16 = v6;
      v17 = 2048;
      v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ has been sent to FBFv2. Size: %lu", buf, 0x16u);
    }
    v8 = *(void **)(a1 + 40);
    v12[0] = *(_QWORD *)(a1 + 32);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "length", CFSTR("message_group"), CFSTR("compressed_size"))));
    v11[2] = CFSTR("upload_service");
    v12[1] = v5;
    v12[2] = CFSTR("PFA");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 3));
    AnalyticsSendEvent(CFSTR("com.apple.proactive.petd.uploaded"), v9);

  }
}

Class sub_100005F98(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __int128 v7;
  uint64_t v8;

  v6 = 0;
  if (!qword_100010A10)
  {
    v7 = off_10000C510;
    v8 = 0;
    qword_100010A10 = _sl_dlopen(&v7, &v6);
  }
  if (!qword_100010A10)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void *SearchFoundationLibrary(void)"));
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PETService.m"), 37, CFSTR("%s"), v6);

    goto LABEL_10;
  }
  if (v6)
    free(v6);
  result = objc_getClass("SFCustomFeedback");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Class getSFCustomFeedbackClass(void)_block_invoke"));
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("PETService.m"), 39, CFSTR("Unable to find class %s"), "SFCustomFeedback");

LABEL_10:
    __break(1u);
  }
  qword_100010A08 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_100006134(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __int128 v7;
  uint64_t v8;

  v6 = 0;
  if (!qword_100010A20)
  {
    v7 = off_10000C528;
    v8 = 0;
    qword_100010A20 = _sl_dlopen(&v7, &v6);
  }
  if (!qword_100010A20)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void *CoreParsecLibrary(void)"));
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PETService.m"), 36, CFSTR("%s"), v6);

    goto LABEL_10;
  }
  if (v6)
    free(v6);
  result = objc_getClass("PARSession");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Class getPARSessionClass(void)_block_invoke"));
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("PETService.m"), 38, CFSTR("Unable to find class %s"), "PARSession");

LABEL_10:
    __break(1u);
  }
  qword_100010A18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1000062D0(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[3];
  _QWORD v15[3];
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  _QWORD v20[2];
  _QWORD v21[2];

  v3 = a2;
  if (v3)
  {
    v21[0] = CFSTR("fbfv2");
    v20[0] = CFSTR("reason");
    v20[1] = CFSTR("group");
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "metadata"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "messageGroup"));
    v21[1] = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 2));
    AnalyticsSendEvent(CFSTR("com.apple.proactive.petd.upload_failed"), v6);

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v3;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to report data to FBFv2. Error: %@", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "metadata"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "messageGroup"));
      v9 = objc_msgSend(*(id *)(a1 + 40), "length");
      *(_DWORD *)buf = 138412546;
      v17 = v8;
      v18 = 2048;
      v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Upload data has been sent to FBFv2. messageGroup: %@; size: %lu",
        buf,
        0x16u);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "metadata", CFSTR("message_group")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "messageGroup"));
    v15[0] = v11;
    v14[1] = CFSTR("compressed_size");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "length")));
    v14[2] = CFSTR("upload_service");
    v15[1] = v12;
    v15[2] = CFSTR("fbfv2");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 3));
    AnalyticsSendEvent(CFSTR("com.apple.proactive.petd.uploaded"), v13);

  }
}

void sub_100006544(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "sortUsingSelector:", "compare:");
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_pas_componentsJoinedByString:", CFSTR("\n")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dataUsingEncoding:", 4));
  objc_msgSend(v4, "writeData:", v5);

}

void sub_1000065D0(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_pas_componentsJoinedByString:", CFSTR("\n")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dataUsingEncoding:", 4));
  objc_msgSend(v3, "writeData:", v4);

}

void sub_10000663C(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "assembleUnaggregatedUploadWithTracker:messageGroup:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), a2));
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 40), "_uploadWithUploadPackage:", v3);
    v3 = v4;
  }

}

void sub_10000684C(uint64_t a1, int a2)
{
  uint8_t v3[16];
  uint8_t v4[16];
  uint8_t buf[16];

  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "MobileAsset metadata has been downloaded successfully.", buf, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Error downloading mobileasset metadata", v4, 2u);
    }
    AnalyticsSendEvent(CFSTR("com.apple.proactive.petd.error_update_metadata"), &off_10000CDF0);
  }
  if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 5)
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v3 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Error setting XPC activity state to DONE", v3, 2u);
  }
}

void sub_10000702C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100007448(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000780C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _BYTE *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];
  _QWORD v21[2];
  uint8_t buf[4];
  uint64_t v23;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "compressedMessages"));
  v5 = objc_msgSend(v4, "length");

  if ((unint64_t)v5 <= 0x1F8000)
  {
    if (v3)
    {
      v6 = *(_BYTE **)(a1 + 40);
      if (!v6[8])
      {
LABEL_9:
        objc_msgSend(*(id *)(a1 + 32), "addMessage:", v3);
        objc_msgSend(*(id *)(a1 + 56), "addUnaggregatedMessages:", v3);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
        goto LABEL_13;
      }
      if (objc_msgSend(v6, "_canLog:messageGroup:isInternal:", v3, *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 72)))
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "petConfig"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
        v9 = objc_msgSend(v7, "isAggregatedForMessageName:", v8);

        if ((v9 & 1) == 0)
        {
          v10 = *(void **)(a1 + 40);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
          LODWORD(v10) = objc_msgSend(v10, "_checkMessageSampling:", v11);

          if ((_DWORD)v10)
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "petConfig"));
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "whitelistForMessageName:", v13));

            if (v14)
            {
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rawBytes"));
              v16 = (void *)objc_claimAutoreleasedReturnValue(+[PETProtobufRawDecoder filterProtobufData:withWhitelist:](PETProtobufRawDecoder, "filterProtobufData:withWhitelist:", v15, v14));
              objc_msgSend(v3, "setRawBytes:", v16);

              goto LABEL_9;
            }
          }
        }
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v19 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138412290;
        v23 = v19;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unexpected nil message when enumerating log store: %@", buf, 0xCu);
      }
      v20[0] = CFSTR("reason");
      v20[1] = CFSTR("msg_group");
      v17 = *(_QWORD *)(a1 + 48);
      v21[0] = CFSTR("nil_message");
      v21[1] = v17;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 2));
      AnalyticsSendEvent(CFSTR("com.apple.proactive.petd.assembler.message_dropped"), v18);

    }
  }
LABEL_13:

}

void sub_100007A88(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t v18[16];

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "compressedMessages"));
  v5 = objc_msgSend(v4, "length");

  if ((unint64_t)v5 <= 0x1F8000)
  {
    if (v3)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "key"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rawMessage"));

      if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 8))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
        v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("PET1Key"));

        if (v9)
        {
          v10 = objc_alloc((Class)PET1Key);
          v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rawBytes"));
          v12 = objc_msgSend(v10, "initWithData:", v11);

          LOBYTE(v11) = objc_msgSend(*(id *)(a1 + 40), "_canLogPET1Key:", v12);
          if ((v11 & 1) == 0)
            goto LABEL_14;
        }
        else
        {
          if (!objc_msgSend(*(id *)(a1 + 40), "_canLog:messageGroup:isInternal:", v7, CFSTR("_aggregated"), *(unsigned __int8 *)(a1 + 56)))goto LABEL_14;
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "petConfig"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "whitelistForMessageName:", v14));

          if (!v15)
            goto LABEL_14;
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rawBytes"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[PETProtobufRawDecoder filterProtobufData:withWhitelist:](PETProtobufRawDecoder, "filterProtobufData:withWhitelist:", v16, v15));
          objc_msgSend(v7, "setRawBytes:", v17);

        }
      }
      objc_msgSend(*(id *)(a1 + 32), "addMessage:", v3);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
LABEL_14:

      goto LABEL_15;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v18 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unexpected nil message when enumerating aggregated state", v18, 2u);
    }
    AnalyticsSendEvent(CFSTR("com.apple.proactive.petd.assembler.message_dropped"), &off_10000CEB8);
  }
LABEL_15:

}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDString");
}

id objc_msgSend__canLog_messageGroup_isInternal_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_canLog:messageGroup:isInternal:");
}

id objc_msgSend__canLogPET1Key_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_canLogPET1Key:");
}

id objc_msgSend__checkMessageSampling_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_checkMessageSampling:");
}

id objc_msgSend__checkSampling_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_checkSampling:");
}

id objc_msgSend__createMetadataFrom_submissionId_messageName_typeId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createMetadataFrom:submissionId:messageName:typeId:");
}

id objc_msgSend__errorClose(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_errorClose");
}

id objc_msgSend__flushBuffer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_flushBuffer");
}

id objc_msgSend__pas_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_pas_componentsJoinedByString:");
}

id objc_msgSend__uploadBatchedDataToPFA_schema_messageGroup_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_uploadBatchedDataToPFA:schema:messageGroup:");
}

id objc_msgSend__uploadGMSDataToPFA_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_uploadGMSDataToPFA:");
}

id objc_msgSend__uploadToFBFv2WithUpload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_uploadToFBFv2WithUpload:");
}

id objc_msgSend__uploadToParsecWithUpload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_uploadToParsecWithUpload:");
}

id objc_msgSend__uploadWithUploadPackage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_uploadWithUploadPackage:");
}

id objc_msgSend__writeUploadForTransparency_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_writeUploadForTransparency:");
}

id objc_msgSend_addMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addMessage:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addUnaggregatedMessages_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addUnaggregatedMessages:");
}

id objc_msgSend_aggregateState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "aggregateState");
}

id objc_msgSend_aggregatedMessages(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "aggregatedMessages");
}

id objc_msgSend_appendBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendBytes:length:");
}

id objc_msgSend_appendData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendData:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_assembleAggregatedUploadWithTracker_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assembleAggregatedUploadWithTracker:");
}

id objc_msgSend_assembleUnaggregatedUploadWithTracker_messageGroup_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assembleUnaggregatedUploadWithTracker:messageGroup:");
}

id objc_msgSend_build(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "build");
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_checkIntegrity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkIntegrity");
}

id objc_msgSend_clearAggregatedMessages(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearAggregatedMessages");
}

id objc_msgSend_clearLogStores(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearLogStores");
}

id objc_msgSend_clearUnaggregatedMessages(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearUnaggregatedMessages");
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "close");
}

id objc_msgSend_componentsFromLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsFromLocaleIdentifier:");
}

id objc_msgSend_compressedMessages(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compressedMessages");
}

id objc_msgSend_configVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configVersion");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_country(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "country");
}

id objc_msgSend_countryCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countryCode");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentHandler");
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentLocale");
}

id objc_msgSend_currentOsBuild(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentOsBuild");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "data");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "device");
}

id objc_msgSend_deviceId(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceId");
}

id objc_msgSend_deviceSamplingForMessageName_isSeed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceSamplingForMessageName:isSeed:");
}

id objc_msgSend_dictionaryWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithContentsOfFile:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_downloadMetadataWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadMetadataWithCompletion:");
}

id objc_msgSend_enumerateAggregatedMessagesWithBlock_clearStore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateAggregatedMessagesWithBlock:clearStore:");
}

id objc_msgSend_enumerateMessageGroups_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateMessageGroups:");
}

id objc_msgSend_enumerateMessagesWithBlock_messageGroup_clearStore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateMessagesWithBlock:messageGroup:clearStore:");
}

id objc_msgSend_filesystemPathForAssetDataRelativePath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filesystemPathForAssetDataRelativePath:");
}

id objc_msgSend_filterProtobufData_withWhitelist_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filterProtobufData:withWhitelist:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_formattedTextForAggregatedMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "formattedTextForAggregatedMessage:");
}

id objc_msgSend_formattedTextForUnaggregatedMessage_messageGroup_config_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "formattedTextForUnaggregatedMessage:messageGroup:config:");
}

id objc_msgSend_getCountryCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCountryCode");
}

id objc_msgSend_groupForMessageName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "groupForMessageName:");
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:");
}

id objc_msgSend_initWithAssetTypeDescriptorPath_defaultBundlePath_matchingKeysAndValues_notificationQueue_logHandle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAssetTypeDescriptorPath:defaultBundlePath:matchingKeysAndValues:notificationQueue:logHandle:");
}

id objc_msgSend_initWithAsyncEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAsyncEnabled:");
}

id objc_msgSend_initWithBasePath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBasePath:");
}

id objc_msgSend_initWithData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:");
}

id objc_msgSend_initWithFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFile:");
}

id objc_msgSend_initWithLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithLength:");
}

id objc_msgSend_initWithRootDir_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRootDir:");
}

id objc_msgSend_initWithType_data_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithType:data:");
}

id objc_msgSend_isAggregatedForMessageName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAggregatedForMessageName:");
}

id objc_msgSend_isChinaEnabledForMessageName_messageGroup_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isChinaEnabledForMessageName:messageGroup:");
}

id objc_msgSend_isConfigEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isConfigEnabled");
}

id objc_msgSend_isDNUEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDNUEnabled");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isGm(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isGm");
}

id objc_msgSend_isInternal(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInternal");
}

id objc_msgSend_isInternalBuild(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInternalBuild");
}

id objc_msgSend_isInternalCarry(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInternalCarry");
}

id objc_msgSend_isSeed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSeed");
}

id objc_msgSend_isTesting(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isTesting");
}

id objc_msgSend_key(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "key");
}

id objc_msgSend_language(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "language");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_loadPET1Config(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadPET1Config");
}

id objc_msgSend_loadPETConfig(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadPETConfig");
}

id objc_msgSend_messageGroup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "messageGroup");
}

id objc_msgSend_messageSamplingForMessageName_isSeed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "messageSamplingForMessageName:isSeed:");
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "metadata");
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableBytes");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_pathForResource_ofType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathForResource:ofType:");
}

id objc_msgSend_pet1Config(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pet1Config");
}

id objc_msgSend_petConfig(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "petConfig");
}

id objc_msgSend_platform(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "platform");
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredLanguages");
}

id objc_msgSend_rawBytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rawBytes");
}

id objc_msgSend_rawMessage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rawMessage");
}

id objc_msgSend_reportDataPlatformBatchedEvent_forBundleID_ofSchema_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reportDataPlatformBatchedEvent:forBundleID:ofSchema:completion:");
}

id objc_msgSend_reportSiriInstrumentationEvent_forBundleID_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reportSiriInstrumentationEvent:forBundleID:completion:");
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reset");
}

id objc_msgSend_rootDir(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rootDir");
}

id objc_msgSend_sendCustomFeedback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendCustomFeedback:");
}

id objc_msgSend_setBuild_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBuild:");
}

id objc_msgSend_setCompressedMessages_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCompressedMessages:");
}

id objc_msgSend_setConfigVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConfigVersion:");
}

id objc_msgSend_setCountry_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCountry:");
}

id objc_msgSend_setDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDevice:");
}

id objc_msgSend_setDeviceId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceId:");
}

id objc_msgSend_setIsCompressed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsCompressed:");
}

id objc_msgSend_setIsConfigEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsConfigEnabled:");
}

id objc_msgSend_setIsGm_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsGm:");
}

id objc_msgSend_setIsInternal_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsInternal:");
}

id objc_msgSend_setIsInternalCarry_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsInternalCarry:");
}

id objc_msgSend_setIsSeed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsSeed:");
}

id objc_msgSend_setLanguage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLanguage:");
}

id objc_msgSend_setMessageGroup_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMessageGroup:");
}

id objc_msgSend_setMessageName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMessageName:");
}

id objc_msgSend_setMetadata_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMetadata:");
}

id objc_msgSend_setMetadataWithConfigVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMetadataWithConfigVersion:");
}

id objc_msgSend_setPet1Config_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPet1Config:");
}

id objc_msgSend_setPetConfig_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPetConfig:");
}

id objc_msgSend_setPlatform_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPlatform:");
}

id objc_msgSend_setPseudoDeviceId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPseudoDeviceId:");
}

id objc_msgSend_setRawBytes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRawBytes:");
}

id objc_msgSend_setTypeId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTypeId:");
}

id objc_msgSend_setUberEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUberEvent:");
}

id objc_msgSend_setUploadIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUploadIdentifier:");
}

id objc_msgSend_setUploadService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUploadService:");
}

id objc_msgSend_setUploadTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUploadTime:");
}

id objc_msgSend_sharedLogger(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedLogger");
}

id objc_msgSend_sharedLoggerWithPersistenceConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedLoggerWithPersistenceConfiguration:");
}

id objc_msgSend_sharedSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedSession");
}

id objc_msgSend_shouldUploadToFBFv2(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldUploadToFBFv2");
}

id objc_msgSend_shouldUploadToFBFv2ForCarryAndSeed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldUploadToFBFv2ForCarryAndSeed");
}

id objc_msgSend_shouldUploadToParsec(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldUploadToParsec");
}

id objc_msgSend_sleepForTimeInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sleepForTimeInterval:");
}

id objc_msgSend_sortUsingSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortUsingSelector:");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSince1970");
}

id objc_msgSend_typeId(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "typeId");
}

id objc_msgSend_unaggregatedMessages(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unaggregatedMessages");
}

id objc_msgSend_updateMobileAssetMetadataWithXPCActivity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateMobileAssetMetadataWithXPCActivity:");
}

id objc_msgSend_upload(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "upload");
}

id objc_msgSend_uploadTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uploadTime");
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "version");
}

id objc_msgSend_whitelistForMessageName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "whitelistForMessageName:");
}

id objc_msgSend_wrapAsAnyEvent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wrapAsAnyEvent");
}

id objc_msgSend_writeData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeData:");
}
