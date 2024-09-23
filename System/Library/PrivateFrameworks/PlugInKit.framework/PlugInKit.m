void sub_1AF255F84(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  char v8;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "host");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 32), "flags");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1AF256AA4;
  v5[3] = &unk_1E5F409B8;
  objc_copyWeak(&v7, &location);
  v6 = *(id *)(a1 + 40);
  v8 = *(_BYTE *)(a1 + 48);
  objc_msgSend(v2, "discoverPlugInsForAttributes:flags:found:", v3, v4, v5);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void sub_1AF256070(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AF256790(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  int v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = objc_msgSend(WeakRetained, "annotationNotifyToken");
    v2 = v4;
    if (!v3)
    {
      objc_msgSend(v4, "installWatchers");
      v2 = v4;
    }
  }

}

void sub_1AF256A44(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_1AF256AA4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  _BOOL4 v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;
  id v16;
  char v17;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "report");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 != 0;

  }
  else
  {
    v10 = 0;
  }
  if (v10)
  {
    objc_msgSend(v8, "queue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1AF256BE8;
    block[3] = &unk_1E5F40990;
    objc_copyWeak(&v16, (id *)(a1 + 40));
    v13 = v5;
    v14 = v6;
    v15 = *(id *)(a1 + 32);
    v17 = *(_BYTE *)(a1 + 48);
    dispatch_async(v11, block);

    objc_destroyWeak(&v16);
  }

}

void sub_1AF256BE8(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  NSObject *v9;
  NSObject *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  NSObject *v12;
  _QWORD block[4];
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "report");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    if (v5)
    {
      if (objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 48)) && !*(_BYTE *)(a1 + 64))
      {
        pklog_handle_for_category(6);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          v16 = WeakRetained;
          _os_log_impl(&dword_1AF254000, v12, OS_LOG_TYPE_INFO, "<PKDiscoveryDriver:%p> no visible outcome changes", buf, 0xCu);
        }

      }
      else
      {
        objc_msgSend(WeakRetained, "setLastResults:", *(_QWORD *)(a1 + 32));
        pklog_handle_for_category(6);
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          v7 = objc_msgSend(*(id *)(a1 + 32), "count");
          *(_DWORD *)buf = 134218240;
          v16 = WeakRetained;
          v17 = 1024;
          v18 = v7;
          _os_log_impl(&dword_1AF254000, v6, OS_LOG_TYPE_DEFAULT, "<PKDiscoveryDriver:%p> delivering update to host (%u plugins)", buf, 0x12u);
        }

        objc_msgSend(WeakRetained, "report");
        v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v8[2](v8, *(_QWORD *)(a1 + 32), 0);

        objc_msgSend(WeakRetained, "sync");
        v9 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = sub_1AF256790;
        block[3] = &unk_1E5F40808;
        objc_copyWeak(&v14, v2);
        dispatch_async(v9, block);

        objc_destroyWeak(&v14);
      }
    }
    else
    {
      pklog_handle_for_category(6);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_1AF275B24((uint64_t)WeakRetained, a1, v10);

      objc_msgSend(WeakRetained, "report");
      v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v11[2](v11, 0, *(_QWORD *)(a1 + 40));

    }
  }

}

BOOL sub_1AF256E3C(int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  uint32_t v3;
  NSObject *v4;

  v3 = notify_register_dispatch((const char *)qword_1EEE37028, out_token, queue, handler);
  if (v3)
  {
    pklog_handle_for_category(10);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_1AF275F5C();

  }
  return v3 == 0;
}

void sub_1AF2571BC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF25730C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF257324(xpc_object_t *a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained;
    xpc_connection_send_message_with_reply(*((xpc_connection_t *)WeakRetained + 2), a1[4], *((dispatch_queue_t *)WeakRetained + 3), a1[5]);
    v3 = v4;
  }

}

void sub_1AF25736C(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (MEMORY[0x1AF45B2D8]() == MEMORY[0x1E0C81310])
  {
    xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x1E0C81270]);
    pklog_handle_for_category(1);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_1AF2774B4(a1);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_1AF25740C(uint64_t a1)
{
  void *v2;
  __CFString *v3;
  int v4;
  unsigned int v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  __CFString *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  NSObject *v14;
  __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  __CFString *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  void (**v31)(_QWORD, _QWORD, _QWORD);
  _QWORD *v32;
  _QWORD v33[4];
  __CFString *v34;
  id v35;
  id v36;
  _QWORD *v37;
  os_signpost_id_t v38;
  _QWORD v39[4];
  uint8_t buf[4];
  __CFString *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  _BYTE v45[10];
  __CFString *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 40), "rewriteDiscoveryAttributes:flags:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("NSExtensionPointName"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v3 = CFSTR("multiple");
    }
  }
  v4 = PKGetThreadPriority();
  v5 = *(_DWORD *)(a1 + 64);
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  v39[3] = 0;
  pklog_handle_for_category(6);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_make_with_pointer(v6, *(const void **)(a1 + 48));

  pklog_handle_for_category(6);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    v10 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138478595;
    v41 = v3;
    v42 = 2114;
    v43 = v10;
    v44 = 1026;
    *(_DWORD *)v45 = (v5 >> 10) & 1;
    *(_WORD *)&v45[4] = 1026;
    *(_DWORD *)&v45[6] = v4;
    _os_signpost_emit_with_name_impl(&dword_1AF254000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "HostDiscovery", " identifier=%{private, signpost.description:attribute}@  discoveryUUID=%{public, signpost.description:attribute}@  sync=%{public, signpost.description:attribute}d  priority=%{public, signpost.description:attribute}d ", buf, 0x22u);
  }

  v11 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = sub_1AF2579C0;
  v33[3] = &unk_1E5F40B98;
  v38 = v7;
  v12 = v3;
  v34 = v12;
  v35 = *(id *)(a1 + 48);
  v37 = v39;
  v36 = *(id *)(a1 + 56);
  v13 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1AF45AEB8](v33);
  pklog_handle_for_category(6);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v16 = *(_QWORD *)(a1 + 40);
    v15 = *(__CFString **)(a1 + 48);
    v17 = *(_QWORD *)(a1 + 64);
    *(_DWORD *)buf = 138413058;
    v41 = v15;
    v42 = 2048;
    v43 = v16;
    v44 = 2048;
    *(_QWORD *)v45 = v17;
    *(_WORD *)&v45[8] = 2114;
    v46 = v12;
    _os_log_impl(&dword_1AF254000, v14, OS_LOG_TYPE_DEFAULT, "[d %@] <PKHost:%p> Beginning discovery for flags: %lu, point: %{public}@", buf, 0x2Au);
  }

  pklog_handle_for_category(6);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v20 = *(_QWORD *)(a1 + 40);
    v19 = *(__CFString **)(a1 + 48);
    v21 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    v41 = v19;
    v42 = 2048;
    v43 = v20;
    v44 = 2114;
    *(_QWORD *)v45 = v21;
    _os_log_impl(&dword_1AF254000, v18, OS_LOG_TYPE_INFO, "[d %@] <PKHost:%p> Query: %{public}@", buf, 0x20u);
  }

  if ((*(_QWORD *)(a1 + 64) & 0x100) != 0)
  {
    pklog_handle_for_category(6);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_1AF275C04();

    pkError(3, CFSTR("cannot request embedded plug-ins without using the \"UsesEmbeddedCode\" key"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v13)[2](v13, 0, v25);

  }
  else if ((~*(_WORD *)(a1 + 64) & 0x480) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "daemon");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = *(_QWORD *)(a1 + 64);
    v29[0] = v11;
    v29[1] = 3221225472;
    v29[2] = sub_1AF263EC0;
    v29[3] = &unk_1E5F40BC0;
    v28 = *(void **)(a1 + 48);
    v29[4] = *(_QWORD *)(a1 + 40);
    v30 = v28;
    v31 = v13;
    v32 = v39;
    objc_msgSend(v26, "matchPlugIns:flags:uuid:reply:", v2, v27, v30, v29);

  }
  else
  {
    pklog_handle_for_category(6);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_1AF275BAC();

    pkError(18, CFSTR("PKDiscoverContinuous and PKDiscoverSynchronous incompatible"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v13)[2](v13, 0, v23);

  }
  _Block_object_dispose(v39, 8);

}

void sub_1AF257888(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1AF2578BC(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  PKHostPlugIn *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "discoveryMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  }
  else
  {
    v6 = -[PKHostPlugIn initWithForm:host:]([PKHostPlugIn alloc], "initWithForm:host:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    objc_msgSend(*(id *)(a1 + 32), "discoveryMap");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    objc_msgSend(v9, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v9, v10);

  }
}

void sub_1AF2579C0(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  pklog_handle_for_category(6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = a1[8];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v10 = a1[4];
    v11 = a1[5];
    v12 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
    v14 = 138478339;
    v15 = v10;
    v16 = 2114;
    v17 = v11;
    v18 = 2050;
    v19 = v12;
    _os_signpost_emit_with_name_impl(&dword_1AF254000, v8, OS_SIGNPOST_INTERVAL_END, v9, "HostDiscovery", " identifier=%{private, signpost.description:attribute}@  discoveryUUID=%{public, signpost.description:attribute}@  count=%{public, signpost.description:attribute}lu ", (uint8_t *)&v14, 0x20u);
  }

  v13 = a1[6];
  if (v13)
    (*(void (**)(uint64_t, id, id))(v13 + 16))(v13, v5, v6);

}

void sub_1AF2580F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  id *v24;
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AF2585AC(uint64_t a1)
{
  id v2;
  NSObject *v3;
  dispatch_queue_t v4;
  dispatch_queue_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9.receiver = *(id *)(a1 + 32);
  v9.super_class = (Class)PKDiscoveryDriver;
  v2 = objc_msgSendSuper2(&v9, sel_init);
  if (v2)
  {
    +[PKCapabilities frameworkQueueAttr](PKCapabilities, "frameworkQueueAttr");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("discovery driver", v3);
    objc_msgSend(v2, "setQueue:", v4);

    v5 = dispatch_queue_create("discovery sync", v3);
    objc_msgSend(v2, "setSync:", v5);

    objc_msgSend(v2, "setAttributes:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v2, "setFlags:", *(_QWORD *)(a1 + 80));
    objc_msgSend(v2, "setReport:", *(_QWORD *)(a1 + 64));
    objc_msgSend(v2, "setRelatedActivity:", *(_QWORD *)(a1 + 48));
    objc_msgSend(v2, "setHost:", *(_QWORD *)(a1 + 56));
    pklog_handle_for_category(6);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v11 = v2;
      _os_log_impl(&dword_1AF254000, v6, OS_LOG_TYPE_DEFAULT, "<PKDiscoveryDriver:%p> created discovery driver", buf, 0xCu);
    }

  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v2;

}

id pkIssueSandboxExtensionForMachService(void *a1, __int128 *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  __int128 v9;
  __int128 v10;

  v3 = objc_retainAutorelease(a1);
  objc_msgSend(v3, "UTF8String");
  v9 = *a2;
  v10 = a2[1];
  v4 = sandbox_extension_issue_mach_to_process();
  if (v4)
  {
    v5 = (void *)v4;
    pklog_handle_for_category(4);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      sub_1AF275EA0(v3);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5, v9, v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    free(v5);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id pklog_handle_for_category(int a1)
{
  if (qword_1ECDD70A0 != -1)
    dispatch_once(&qword_1ECDD70A0, &unk_1E5F40558);
  return (id)qword_1ECDD7020[a1];
}

uint64_t PKGetThreadPriority()
{
  thread_inspect_t v0;
  uint64_t v1;
  mach_msg_type_number_t thread_info_outCnt;
  integer_t thread_info_out[4];
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v5 = 0u;
  v6 = 0u;
  *(_OWORD *)thread_info_out = 0u;
  thread_info_outCnt = 28;
  v0 = MEMORY[0x1AF45AC9C]();
  if (thread_info(v0, 5u, thread_info_out, &thread_info_outCnt))
    v1 = 4294966296;
  else
    v1 = DWORD1(v6);
  mach_port_deallocate(*MEMORY[0x1E0C83DA0], v0);
  return v1;
}

uint64_t pklog_get_persona_type_and_name(uint64_t result, uint64_t a2, const char **a3, const char **a4)
{
  const char *v6;
  const char *v7;
  unsigned int v9;

  v6 = "<unknown>";
  v7 = "NOPERSONA";
  if ((_DWORD)result != -1 && a2)
  {
    result = kpersona_info();
    if ((result & 0x80000000) != 0)
    {
      v6 = "<unknown>";
      v7 = "NOPERSONA";
    }
    else
    {
      v9 = *(_DWORD *)(a2 + 8) - 2;
      if (v9 > 4)
        v7 = "<unknown>";
      else
        v7 = off_1E5F40F98[v9];
      v6 = (const char *)(a2 + 88);
    }
  }
  if (a3)
    *a3 = v7;
  if (a4)
    *a4 = v6;
  return result;
}

id __PLUGINKIT_CALLING_OUT_TO_CLIENT_SUBSYSTEM_FOR_INIT__(void *a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(a1, "initForPlugInKitWithOptions:", v3);
  else
    objc_msgSend(a1, "initForPlugInKit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __PLUGINKIT_CALLING_OUT_TO_CLIENT_SUBSYSTEM_FOR_BEGINUSING__(uint64_t a1)
{
  return MEMORY[0x1E0DE7D20](a1, sel_beginUsing_withBundle_);
}

void __PLUGINKIT_HANDING_CONTROL_TO_CLIENT__(uint64_t a1, uint64_t a2)
{
  NSObject *v2;

  if (a2)
  {
    (*(void (**)(uint64_t, uint64_t))(a2 + 16))(a2, a1);
  }
  else
  {
    pklog_handle_for_category(7);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
      sub_1AF275DE8(v2);

  }
}

id pkIssueSandboxExtensionForURL(void *a1, __int128 *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  __int128 v9;
  __int128 v10;

  v3 = objc_retainAutorelease(a1);
  objc_msgSend(v3, "fileSystemRepresentation");
  v9 = *a2;
  v10 = a2[1];
  v4 = sandbox_extension_issue_file_to_process();
  if (v4)
  {
    v5 = (void *)v4;
    pklog_handle_for_category(4);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      sub_1AF275E28(v3);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5, v9, v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    free(v5);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void sub_1AF25A4A0()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;
  os_log_t v4;
  void *v5;
  os_log_t v6;
  void *v7;
  os_log_t v8;
  void *v9;
  os_log_t v10;
  void *v11;
  os_log_t v12;
  void *v13;
  os_log_t v14;
  void *v15;
  os_log_t v16;
  void *v17;
  os_log_t v18;
  void *v19;
  os_log_t v20;
  void *v21;
  os_log_t v22;
  void *v23;
  os_log_t v24;
  void *v25;
  os_log_t v26;
  void *v27;
  os_log_t v28;
  void *v29;
  os_log_t v30;
  void *v31;

  v0 = os_log_create("com.apple.PlugInKit", "unspecified");
  v1 = (void *)qword_1ECDD7020[0];
  qword_1ECDD7020[0] = (uint64_t)v0;

  v2 = os_log_create("com.apple.PlugInKit", "xpc");
  v3 = (void *)qword_1ECDD7028;
  qword_1ECDD7028 = (uint64_t)v2;

  v4 = os_log_create("com.apple.PlugInKit", "nsextension");
  v5 = (void *)qword_1ECDD7030;
  qword_1ECDD7030 = (uint64_t)v4;

  v6 = os_log_create("com.apple.PlugInKit", "ls");
  v7 = (void *)qword_1ECDD7038;
  qword_1ECDD7038 = (uint64_t)v6;

  v8 = os_log_create("com.apple.PlugInKit", "sandbox");
  v9 = (void *)qword_1ECDD7040;
  qword_1ECDD7040 = (uint64_t)v8;

  v10 = os_log_create("com.apple.PlugInKit", "assertions");
  v11 = (void *)qword_1ECDD7048;
  qword_1ECDD7048 = (uint64_t)v10;

  v12 = os_log_create("com.apple.PlugInKit", "discovery");
  v13 = (void *)qword_1ECDD7050;
  qword_1ECDD7050 = (uint64_t)v12;

  v14 = os_log_create("com.apple.PlugInKit", "lifecycle");
  v15 = (void *)qword_1ECDD7058;
  qword_1ECDD7058 = (uint64_t)v14;

  v16 = os_log_create("com.apple.PlugInKit", "subsystems");
  v17 = (void *)qword_1ECDD7060;
  qword_1ECDD7060 = (uint64_t)v16;

  v18 = os_log_create("com.apple.PlugInKit", "cache");
  v19 = (void *)qword_1ECDD7068;
  qword_1ECDD7068 = (uint64_t)v18;

  v20 = os_log_create("com.apple.PlugInKit", "annotations");
  v21 = (void *)qword_1ECDD7070;
  qword_1ECDD7070 = (uint64_t)v20;

  v22 = os_log_create("com.apple.PlugInKit", "holds");
  v23 = (void *)qword_1ECDD7078;
  qword_1ECDD7078 = (uint64_t)v22;

  v24 = os_log_create("com.apple.PlugInKit", "manager");
  v25 = (void *)qword_1ECDD7080;
  qword_1ECDD7080 = (uint64_t)v24;

  v26 = os_log_create("com.apple.PlugInKit", "persona");
  v27 = (void *)qword_1ECDD7088;
  qword_1ECDD7088 = (uint64_t)v26;

  v28 = os_log_create("com.apple.PlugInKit", "capture");
  v29 = (void *)qword_1ECDD7090;
  qword_1ECDD7090 = (uint64_t)v28;

  v30 = os_log_create("com.apple.PlugInKit", "api_misuse");
  v31 = (void *)qword_1ECDD7098;
  qword_1ECDD7098 = (uint64_t)v30;

}

uint64_t sub_1AF25A684(uint64_t a1)
{
  return MEMORY[0x1E0DE7D20](*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), sel_updateFromForm_host_);
}

void sub_1AF25A69C()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)qword_1ECDD6FD8;
  qword_1ECDD6FD8 = v0;

}

void sub_1AF25A6C4(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "annotations");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("election"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "integerValue");

}

void sub_1AF25A728()
{
  PKHost *v0;
  void *v1;

  v0 = objc_alloc_init(PKHost);
  v1 = (void *)qword_1ECDD6FE8;
  qword_1ECDD6FE8 = (uint64_t)v0;

}

void sub_1AF25ABF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF25B1A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_1AF25B358(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v7);

  v9 = (void *)objc_msgSend(v8, "copy");
  return v9;
}

void sub_1AF25BCDC(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAnnotation:value:", CFSTR("election"), v2);

}

void sub_1AF25BE10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1AF25BE28(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1AF25BE38(uint64_t a1)
{

}

void sub_1AF25BE40(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "annotations");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("extension"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t sub_1AF25BF50(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAnnotation:value:", CFSTR("extension"), *(_QWORD *)(a1 + 40));
}

uint64_t sub_1AF25C0BC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invoke");
}

void sub_1AF25C264(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF25C280(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "sourceForm");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void sub_1AF25C7B4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  _BOOL4 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  pklog_handle_for_category(7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 48);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138478339;
    v10 = v7;
    v11 = 2114;
    v12 = v8;
    v13 = 1026;
    v14 = v3 == 0;
    _os_signpost_emit_with_name_impl(&dword_1AF254000, v5, OS_SIGNPOST_INTERVAL_END, v6, "HostBeginUsing", " identifier=%{private, signpost.description:attribute}@  uuid=%{public, signpost.description:attribute}@  success=%{public, signpost.description:attribute}d ", (uint8_t *)&v9, 0x1Cu);

  }
  __PLUGINKIT_HANDING_CONTROL_TO_CLIENT__((uint64_t)v3, *(_QWORD *)(a1 + 40));

}

uint64_t sub_1AF25C8E4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startPlugInRequest:synchronously:subsystemOptions:completion:", *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void sub_1AF25CC50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1AF25CC74(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  _QWORD v5[5];

  v2 = (void *)a1[4];
  v1 = a1[5];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1AF25CCCC;
  v5[3] = &unk_1E5F406F0;
  v3 = a1[6];
  v5[4] = a1[7];
  return objc_msgSend(v2, "startPlugInRequest:synchronously:subsystemOptions:completion:", v1, 1, v3, v5);
}

void sub_1AF25CCCC(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_1AF25DB10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id *location, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,id a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a65;

  objc_destroyWeak(location);
  objc_destroyWeak(&a50);
  _Block_object_dispose(&a51, 8);
  _Block_object_dispose(&a65, 8);
  _Unwind_Resume(a1);
}

void sub_1AF25DB9C(uint64_t a1)
{
  uint64_t v2;
  char v3;
  _BOOL4 v4;
  NSObject *v5;
  uint64_t v6;
  __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  switch(objc_msgSend(*(id *)(a1 + 32), "state"))
  {
    case 1:
      v2 = objc_msgSend(*(id *)(a1 + 32), "isData");
      v3 = v2;
      if ((v2 & 1) != 0)
      {
        v4 = 0;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "plugInPrincipal");
        v2 = objc_claimAutoreleasedReturnValue();
        v4 = v2 == 0;
      }
      if (v4)
        sub_1AF27475C();
      if ((v3 & 1) == 0)

      objc_msgSend(*(id *)(a1 + 32), "setUseCount:", objc_msgSend(*(id *)(a1 + 32), "useCount") + 1);
      pklog_handle_for_category(7);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "uuid");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "multipleInstanceUUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "version");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(*(id *)(a1 + 32), "useCount");
        v18 = 138544386;
        v19 = v13;
        v20 = 2114;
        v21 = v14;
        v22 = 2112;
        v23 = v15;
        v24 = 2112;
        v25 = v16;
        v26 = 1024;
        v27 = v17;
        _os_log_impl(&dword_1AF254000, v12, OS_LOG_TYPE_DEFAULT, "[u %{public}@:m %{public}@] [%@(%@)] plugin reference count incremented to %d, and ready for host.", (uint8_t *)&v18, 0x30u);

      }
      objc_msgSend(*(id *)(a1 + 32), "addRequestUUID:", *(_QWORD *)(a1 + 40));
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      goto LABEL_21;
    case 2:
      pklog_handle_for_category(7);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        sub_1AF274784(a1 + 32, v5);

      v6 = *(_QWORD *)(a1 + 48);
      v7 = CFSTR("plugin has died and must be rediscovered");
      v8 = 5;
      goto LABEL_13;
    case 3:
      pklog_handle_for_category(7);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_1AF2748DC(a1 + 32, v9);

      return;
    case 4:
      pklog_handle_for_category(7);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_1AF274830(a1 + 32, v10);

      v6 = *(_QWORD *)(a1 + 48);
      v7 = CFSTR("plugin is spent and cannot be used anymore");
      v8 = 17;
LABEL_13:
      pkError(v8, v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v11);

LABEL_21:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
      break;
    default:
      return;
  }
}

void sub_1AF25DE58(uint64_t a1, void *a2, int a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  _BYTE v29[20];
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (v5)
    {
      if (!a3)
      {
LABEL_5:
        pklog_handle_for_category(7);
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
          sub_1AF2749C8((uint64_t)WeakRetained, (uint64_t)v7, v8, v9, v10, v11, v12, v13, v28, *(uint64_t *)&v29[4], *(uint64_t *)&v29[12], v30, v31, *((uint64_t *)&v31 + 1), v32, v33, v34, v35, v36,
            v37,
            v38,
            v39,
            v40,
            v41);

        objc_msgSend(WeakRetained, "_startQueue");
        v14 = objc_claimAutoreleasedReturnValue();
        dispatch_resume(v14);

        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        goto LABEL_11;
      }
    }
    else
    {
      pklog_handle_for_category(7);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(WeakRetained, "uuid");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "multipleInstanceUUID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "identifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "version");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138544130;
        *(_QWORD *)v29 = v24;
        *(_WORD *)&v29[8] = 2114;
        *(_QWORD *)&v29[10] = v25;
        *(_WORD *)&v29[18] = 2112;
        v30 = (uint64_t)v26;
        LOWORD(v31) = 2112;
        *(_QWORD *)((char *)&v31 + 2) = v27;
        _os_log_impl(&dword_1AF254000, v23, OS_LOG_TYPE_DEFAULT, "[u %{public}@:m %{public}@] [%@(%@)] plugin loaded and ready for host", (uint8_t *)&v28, 0x2Au);

      }
      if (!a3)
        goto LABEL_5;
    }
    objc_msgSend(*(id *)(a1 + 32), "deactivatePlugIn:", WeakRetained);
    goto LABEL_5;
  }
  pklog_handle_for_category(7);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    sub_1AF274988(v15);

LABEL_11:
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    pklog_handle_for_category(7);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(WeakRetained, "uuid");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "multipleInstanceUUID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "version");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138544130;
      *(_QWORD *)v29 = v17;
      *(_WORD *)&v29[8] = 2114;
      *(_QWORD *)&v29[10] = v18;
      *(_WORD *)&v29[18] = 2112;
      v30 = (uint64_t)v19;
      LOWORD(v31) = 2112;
      *(_QWORD *)((char *)&v31 + 2) = v20;
      _os_log_impl(&dword_1AF254000, v16, OS_LOG_TYPE_DEFAULT, "[u %{public}@:m %{public}@] [%@(%@)] invalidating startup assertion", (uint8_t *)&v28, 0x2Au);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "invalidate");
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v22 = *(void **)(v21 + 40);
    *(_QWORD *)(v21 + 40) = 0;

  }
}

uint64_t sub_1AF25E14C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "changeState:", 3);
}

void sub_1AF25E158(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const __CFString *v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  NSObject *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  os_signpost_id_t v51;
  NSObject *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  NSObject *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  int v68;
  NSObject *v69;
  NSObject *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  int v85;
  void *v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  _BOOL4 v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  NSObject *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  NSObject *v123;
  void *v124;
  void *v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  uint64_t current_persona;
  int v138;
  NSObject *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  uid_t v144;
  uid_t v145;
  uint64_t v146;
  NSObject *v147;
  NSObject *v148;
  os_signpost_id_t v149;
  void *v150;
  void *v151;
  void *v152;
  id v153;
  uint8_t v154;
  void *v155;
  uint64_t v156;
  id v157;
  id *v158;
  id *v159;
  id *v160;
  void *v161;
  id v162;
  id v163;
  id v164;
  uint64_t v165;
  uint64_t v166;
  void (*v167)(uint64_t, void *, void *);
  void *v168;
  uint64_t v169;
  id v170;
  id v171;
  id v172;
  uint64_t v173;
  const char *v174;
  const char *v175;
  _QWORD v176[4];
  id v177;
  _QWORD v178[4];
  id v179;
  _QWORD v180[4];
  id v181;
  id v182;
  id location;
  id v184;
  _QWORD v185[5];
  id v186;
  id v187;
  id v188;
  _QWORD v189[5];
  id v190;
  uint8_t v191[4];
  void *v192;
  __int16 v193;
  void *v194;
  __int16 v195;
  void *v196;
  __int16 v197;
  void *v198;
  __int16 v199;
  uid_t v200;
  __int16 v201;
  uid_t v202;
  __int16 v203;
  int v204;
  __int16 v205;
  const char *v206;
  __int16 v207;
  const char *v208;
  uint8_t buf[32];
  _DWORD v210[8];
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  _BYTE v227[28];
  _QWORD v228[4];

  v228[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v163 = a3;
  v164 = a4;
  pklog_handle_for_category(7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 88);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138478083;
    *(_QWORD *)&buf[4] = v11;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v12;
    _os_signpost_emit_with_name_impl(&dword_1AF254000, v9, OS_SIGNPOST_INTERVAL_END, v10, "HostToDaemonReadyPlugIns", " identifier=%{private, signpost.description:attribute}@  uuid=%{public, signpost.description:attribute}@ ", buf, 0x16u);

  }
  if (!v7)
  {
    objc_msgSend(v163, "objectAtIndexedSubscript:", 0);
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v164, "count");
    if (v14)
    {
      objc_msgSend(v164, "objectAtIndexedSubscript:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }
    v162 = v15;
    if (v14)

    pklog_handle_for_category(7);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "uuid");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "multipleInstanceUUID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "version");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      *(_QWORD *)&buf[4] = v17;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v18;
      *(_WORD *)&buf[22] = 2112;
      *(_QWORD *)&buf[24] = v19;
      LOWORD(v210[0]) = 2112;
      *(_QWORD *)((char *)v210 + 2) = v20;
      HIWORD(v210[2]) = 2112;
      *(_QWORD *)&v210[3] = v161;
      _os_log_impl(&dword_1AF254000, v16, OS_LOG_TYPE_DEFAULT, "[u %{public}@:m %{public}@] [%@(%@)] got pid from ready request: %@", buf, 0x34u);

    }
    if (v162)
    {
      objc_msgSend(*(id *)(a1 + 32), "uuid");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isEqual:", v162) ^ 1;

    }
    else
    {
      v22 = 0;
    }
    if (v22)
    {
      objc_msgSend(*(id *)(a1 + 40), "discoveryMap");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKey:", v162);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        pklog_handle_for_category(7);
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          sub_1AF275150(a1, (uint64_t)v24, (uint64_t)v25, v26, v27, v28, v29, v30, v154, v156, (uint64_t)v158, (uint64_t)v159, (uint64_t)v160, (uint64_t)v161, (uint64_t)v162, (uint64_t)v163, (uint64_t)v164, v165, v166,
            (uint64_t)v167,
            (uint64_t)v168,
            v169,
            (uint64_t)v170,
            (uint64_t)v171);

        v31 = CFSTR("stale");
      }
      else
      {
        v31 = CFSTR("invalid");
      }
      pklog_handle_for_category(15);
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
        sub_1AF2750A0(a1, (uint64_t)v31, (uint64_t)v32, v33, v34, v35, v36, v37, v154, v156, (uint64_t)v158, (uint64_t)v159, (uint64_t)v160, (uint64_t)v161, (uint64_t)v162, (uint64_t)v163, (uint64_t)v164, v165, v166,
          (uint64_t)v167,
          (uint64_t)v168,
          v169,
          (uint64_t)v170,
          (uint64_t)v171);

    }
    if (!v161 || !objc_opt_class())
    {
LABEL_69:
      if (!objc_msgSend(*(id *)(a1 + 32), "isData"))
      {
        objc_msgSend(*(id *)(a1 + 32), "serviceExtension");
        v119 = (void *)objc_claimAutoreleasedReturnValue();

        if (v119)
        {
          v120 = *(void **)(a1 + 32);
          objc_msgSend(v120, "serviceExtension");
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          v228[0] = v121;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v228, 1);
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          v184 = 0;
          LOBYTE(v120) = objc_msgSend(v120, "loadExtensions:error:", v122, &v184);
          v7 = v184;

          if ((v120 & 1) == 0)
          {
            pklog_handle_for_category(7);
            v123 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR))
              sub_1AF274A70(a1 + 32, v7, v123);

            (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
            goto LABEL_89;
          }
        }
        else
        {
          v7 = 0;
        }
        objc_msgSend(*(id *)(a1 + 48), "setDelegate:", *(_QWORD *)(a1 + 32));
        objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE3B3F8);
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "setRemoteObjectInterface:", v124);

        objc_msgSend(*(id *)(a1 + 48), "setExportedObject:", *(_QWORD *)(a1 + 40));
        objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE404A8);
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "setExportedInterface:", v125);

        objc_initWeak(&location, *(id *)(a1 + 32));
        v126 = MEMORY[0x1E0C809B0];
        v180[0] = MEMORY[0x1E0C809B0];
        v180[1] = 3221225472;
        v180[2] = sub_1AF25F3DC;
        v180[3] = &unk_1E5F407B8;
        objc_copyWeak(&v182, &location);
        v181 = *(id *)(a1 + 72);
        v127 = MEMORY[0x1AF45AEB8](v180);
        objc_msgSend(*(id *)(a1 + 48), "synchronousRemoteObjectProxyWithErrorHandler:", v127);
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "setSyncService:", v128);

        objc_msgSend(*(id *)(a1 + 32), "syncService");
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v129, "set_userInfo:", &unk_1E5F4DE00);

        objc_msgSend(*(id *)(a1 + 48), "remoteObjectProxyWithErrorHandler:", v127);
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "setService:", v130);

        v131 = *(void **)(a1 + 32);
        if (*(_BYTE *)(a1 + 96))
          objc_msgSend(v131, "syncService");
        else
          objc_msgSend(v131, "service");
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        v157 = v132;

        v178[0] = v126;
        v178[1] = 3221225472;
        v178[2] = sub_1AF25F464;
        v178[3] = &unk_1E5F40808;
        objc_copyWeak(&v179, &location);
        objc_msgSend(*(id *)(a1 + 48), "setInterruptionHandler:", v178);
        v176[0] = v126;
        v176[1] = 3221225472;
        v176[2] = sub_1AF25F7A0;
        v176[3] = &unk_1E5F40808;
        objc_copyWeak(&v177, &location);
        objc_msgSend(*(id *)(a1 + 48), "setInvalidationHandler:", v176);
        objc_msgSend(*(id *)(a1 + 32), "multipleInstanceUUID");
        v133 = (void *)objc_claimAutoreleasedReturnValue();

        if (v133)
        {
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = 0;
          objc_msgSend(*(id *)(a1 + 32), "multipleInstanceUUID");
          v134 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v134, "getUUIDBytes:", buf);

          objc_msgSend(*(id *)(a1 + 32), "pluginConnection");
          v135 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v135, "_xpcConnection");
          v136 = (void *)objc_claimAutoreleasedReturnValue();
          xpc_connection_set_oneshot_instance();

        }
        objc_msgSend(*(id *)(a1 + 32), "resume");
        v155 = (void *)v127;
        v226 = 0u;
        memset(v227, 0, sizeof(v227));
        v224 = 0u;
        v225 = 0u;
        v222 = 0u;
        v223 = 0u;
        v220 = 0u;
        v221 = 0u;
        v218 = 0u;
        v219 = 0u;
        v216 = 0u;
        v217 = 0u;
        v214 = 0u;
        v215 = 0u;
        v212 = 0u;
        v213 = 0u;
        v211 = 0u;
        memset(v210, 0, sizeof(v210));
        memset(buf, 0, sizeof(buf));
        v174 = 0;
        v175 = 0;
        current_persona = voucher_get_current_persona();
        v138 = current_persona;
        memset(buf, 0, sizeof(buf));
        memset(v210, 0, sizeof(v210));
        v211 = 0u;
        v212 = 0u;
        v213 = 0u;
        v214 = 0u;
        v215 = 0u;
        v216 = 0u;
        v217 = 0u;
        v218 = 0u;
        v219 = 0u;
        v220 = 0u;
        v221 = 0u;
        v222 = 0u;
        v223 = 0u;
        v224 = 0u;
        v225 = 0u;
        v226 = 0u;
        memset(v227, 0, sizeof(v227));
        *(_DWORD *)buf = 1;
        pklog_get_persona_type_and_name(current_persona, (uint64_t)buf, &v175, &v174);
        pklog_handle_for_category(7);
        v139 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v139, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 32), "uuid");
          v140 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "multipleInstanceUUID");
          v141 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "identifier");
          v142 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "version");
          v143 = (void *)objc_claimAutoreleasedReturnValue();
          v144 = geteuid();
          v145 = getuid();
          *(_DWORD *)v191 = 138545410;
          v192 = v140;
          v193 = 2114;
          v194 = v141;
          v195 = 2112;
          v196 = v142;
          v197 = 2112;
          v198 = v143;
          v199 = 1024;
          v200 = v144;
          v201 = 1024;
          v202 = v145;
          v203 = 1024;
          v204 = v138;
          v205 = 2080;
          v206 = v175;
          v207 = 2080;
          v208 = v174;
          _os_log_impl(&dword_1AF254000, v139, OS_LOG_TYPE_DEFAULT, "[u %{public}@:m %{public}@] [%@(%@)] Prepare using sent as euid = %d, uid = %d, personaid = %d, type = %s, name = %s", v191, 0x50u);

        }
        v146 = MEMORY[0x1E0C809B0];
        pklog_handle_for_category(7);
        v147 = objc_claimAutoreleasedReturnValue();
        v148 = v147;
        v149 = *(_QWORD *)(a1 + 88);
        if (v149 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v147))
        {
          objc_msgSend(*(id *)(a1 + 32), "identifier");
          v150 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "uuid");
          v151 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138478083;
          *(_QWORD *)&buf[4] = v150;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v151;
          _os_signpost_emit_with_name_impl(&dword_1AF254000, v148, OS_SIGNPOST_INTERVAL_BEGIN, v149, "HostToExtensionPrepareUsing", " identifier=%{private, signpost.description:attribute}@  uuid=%{public, signpost.description:attribute}@ ", buf, 0x16u);

        }
        v152 = *(void **)(a1 + 32);
        v165 = v146;
        v166 = 3221225472;
        v167 = sub_1AF25F9EC;
        v168 = &unk_1E5F40858;
        v173 = *(_QWORD *)(a1 + 88);
        v169 = (uint64_t)v152;
        v172 = *(id *)(a1 + 72);
        v153 = v157;
        v170 = v153;
        v171 = *(id *)(a1 + 64);
        objc_msgSend(v152, "preparePlugInUsingService:completion:", v153, &v165);

        objc_destroyWeak(&v177);
        objc_destroyWeak(&v179);

        objc_destroyWeak(&v182);
        objc_destroyWeak(&location);
        goto LABEL_89;
      }
      v116 = *(_QWORD *)(a1 + 56);
      v117 = *(unsigned __int8 *)(a1 + 96);
      v185[0] = MEMORY[0x1E0C809B0];
      v185[1] = 3221225472;
      v185[2] = sub_1AF25F29C;
      v185[3] = &unk_1E5F40790;
      v118 = *(void **)(a1 + 40);
      v185[4] = *(_QWORD *)(a1 + 32);
      v187 = *(id *)(a1 + 72);
      v186 = *(id *)(a1 + 64);
      objc_msgSend(v118, "accessPlugIns:synchronously:flags:extensions:", v116, v117, 0, v185);

LABEL_71:
      v7 = 0;
LABEL_89:

      goto LABEL_90;
    }
    v38 = objc_msgSend(v161, "intValue");
    objc_msgSend(*(id *)(a1 + 32), "external");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "runningboard");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "processAssertionWithPID:flags:reason:name:", v38, 7, 9, CFSTR("com.apple.extension.session"));
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v43 = *(void **)(v42 + 40);
    *(_QWORD *)(v42 + 40) = v41;

    v189[0] = MEMORY[0x1E0C809B0];
    v189[1] = 3221225472;
    v189[2] = sub_1AF25F248;
    v189[3] = &unk_1E5F40650;
    v189[4] = *(_QWORD *)(a1 + 32);
    v190 = *(id *)(a1 + 48);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "setInvalidationHandler:", v189);
    LOBYTE(v38) = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "acquire");
    pklog_handle_for_category(7);
    v44 = objc_claimAutoreleasedReturnValue();
    v45 = v44;
    if ((v38 & 1) == 0)
    {
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        sub_1AF274FF4(a1 + 32, (uint64_t)v45, v77, v78, v79, v80, v81, v82, v154, v156, (uint64_t)v158, (uint64_t)v159, (uint64_t)v160, (uint64_t)v161, (uint64_t)v162, (uint64_t)v163, (uint64_t)v164, v165, v166,
          (uint64_t)v167,
          (uint64_t)v168,
          v169,
          (uint64_t)v170,
          (uint64_t)v171);

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "invalidate");
      v83 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      v84 = *(void **)(v83 + 40);
      *(_QWORD *)(v83 + 40) = 0;

      pkError(4, CFSTR("could not acquire startup assertion"));
      v60 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
      v85 = 1;
LABEL_68:

      if (v85)
        goto LABEL_71;
      goto LABEL_69;
    }
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "uuid");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "multipleInstanceUUID");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "version");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v46;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v47;
      *(_WORD *)&buf[22] = 2112;
      *(_QWORD *)&buf[24] = v48;
      LOWORD(v210[0]) = 2112;
      *(_QWORD *)((char *)v210 + 2) = v49;
      _os_log_impl(&dword_1AF254000, v45, OS_LOG_TYPE_DEFAULT, "[u %{public}@:m %{public}@] [%@(%@)] acquired startup assertion", buf, 0x2Au);

    }
    pklog_handle_for_category(7);
    v50 = objc_claimAutoreleasedReturnValue();
    v51 = os_signpost_id_make_with_pointer(v50, *(const void **)(a1 + 32));

    pklog_handle_for_category(7);
    v52 = objc_claimAutoreleasedReturnValue();
    v53 = v52;
    if (v51 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v52))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "uuid");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138478083;
      *(_QWORD *)&buf[4] = v54;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v55;
      _os_signpost_emit_with_name_impl(&dword_1AF254000, v53, OS_SIGNPOST_INTERVAL_BEGIN, v51, "HostRBExtensionCheck", " identifier=%{private, signpost.description:attribute}@  uuid=%{public, signpost.description:attribute}@ ", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "external");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "runningboard");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v161, "intValue"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v188 = 0;
    objc_msgSend(v57, "taskStatesForPID:error:", v58, &v188);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v188;

    pklog_handle_for_category(7);
    v61 = objc_claimAutoreleasedReturnValue();
    v62 = v61;
    if (v51 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v61))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "uuid");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138478083;
      *(_QWORD *)&buf[4] = v63;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v64;
      _os_signpost_emit_with_name_impl(&dword_1AF254000, v62, OS_SIGNPOST_INTERVAL_END, v51, "HostRBExtensionCheck", " identifier=%{private, signpost.description:attribute}@  uuid=%{public, signpost.description:attribute}@ ", buf, 0x16u);

    }
    if (v59)
    {
      v65 = objc_msgSend(v59, "count");
      v66 = v65;
      if (v65)
      {
        if (v65 != 1)
        {
          pklog_handle_for_category(7);
          v70 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
            sub_1AF274D10(a1 + 32, v66, v70);
          goto LABEL_65;
        }
        objc_msgSend(v59, "objectAtIndexedSubscript:", 0);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = objc_msgSend(v67, "isRunning");

        pklog_handle_for_category(7);
        v69 = objc_claimAutoreleasedReturnValue();
        v70 = v69;
        if (v68)
        {
          if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
            sub_1AF274DF0(a1 + 32, (uint64_t)v70, v71, v72, v73, v74, v75, v76, v154, v156, (uint64_t)v158, (uint64_t)v159, (uint64_t)v160, (uint64_t)v161, (uint64_t)v162, (uint64_t)v163, (uint64_t)v164, v165, v166,
              (uint64_t)v167,
              (uint64_t)v168,
              v169,
              (uint64_t)v170,
              (uint64_t)v171);
LABEL_65:
          v85 = 0;
LABEL_66:

          goto LABEL_67;
        }
        if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
          sub_1AF274E9C(a1 + 32, (uint64_t)v70, v94, v95, v96, v97, v98, v99, v154, v156, (uint64_t)v158, (uint64_t)v159, (uint64_t)v160, (uint64_t)v161, (uint64_t)v162, (uint64_t)v163, (uint64_t)v164, v165, v166,
            (uint64_t)v167,
            (uint64_t)v168,
            v169,
            (uint64_t)v170,
            (uint64_t)v171);
      }
      else
      {
        pklog_handle_for_category(7);
        v70 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
          sub_1AF274F48(a1 + 32, (uint64_t)v70, v88, v89, v90, v91, v92, v93, v154, v156, (uint64_t)v158, (uint64_t)v159, (uint64_t)v160, (uint64_t)v161, (uint64_t)v162, (uint64_t)v163, (uint64_t)v164, v165, v166,
            (uint64_t)v167,
            (uint64_t)v168,
            v169,
            (uint64_t)v170,
            (uint64_t)v171);
      }
LABEL_60:

      pklog_handle_for_category(7);
      v107 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
        sub_1AF274B14(a1 + 32, (uint64_t)v107, v108, v109, v110, v111, v112, v113, v154, v156, (uint64_t)v158, (uint64_t)v159, (uint64_t)v160, (uint64_t)v161, (uint64_t)v162, (uint64_t)v163, (uint64_t)v164, v165, v166,
          (uint64_t)v167,
          (uint64_t)v168,
          v169,
          (uint64_t)v170,
          (uint64_t)v171);

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "invalidate");
      v114 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      v115 = *(void **)(v114 + 40);
      *(_QWORD *)(v114 + 40) = 0;

      pkError(4, CFSTR("Extension process exited while/after acquiring startup assertion"));
      v70 = objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
      v85 = 1;
      goto LABEL_66;
    }
    if (!v60)
    {
      v85 = 0;
LABEL_67:

      goto LABEL_68;
    }
    objc_msgSend(v60, "domain");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = v86;
    if (v86 == (void *)*MEMORY[0x1E0D87E48])
    {
      v100 = objc_msgSend(v60, "code") == 1;

      if (v100)
      {
        pklog_handle_for_category(7);
        v70 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
          sub_1AF274BC0(a1 + 32, (uint64_t)v70, v101, v102, v103, v104, v105, v106, v154, v156, (uint64_t)v158, (uint64_t)v159, (uint64_t)v160, (uint64_t)v161, (uint64_t)v162, (uint64_t)v163, (uint64_t)v164, v165, v166,
            (uint64_t)v167,
            (uint64_t)v168,
            v169,
            (uint64_t)v170,
            (uint64_t)v171);
        goto LABEL_60;
      }
    }
    else
    {

    }
    pklog_handle_for_category(7);
    v70 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
      sub_1AF274C6C(a1 + 32, v60, v70);
    goto LABEL_65;
  }
  pklog_handle_for_category(7);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    sub_1AF275200(a1, v7, v13);

  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
LABEL_90:

}

void sub_1AF25F1DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *a11, id *location, id *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,id a45)
{
  objc_destroyWeak(location);
  objc_destroyWeak(a11);
  objc_destroyWeak(a13);
  objc_destroyWeak(&a45);
  _Unwind_Resume(a1);
}

uint64_t sub_1AF25F248(uint64_t a1)
{
  NSObject *v2;

  pklog_handle_for_category(7);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    sub_1AF2752A8(a1, v2);

  return objc_msgSend(*(id *)(a1 + 40), "invalidate");
}

void sub_1AF25F29C(uint64_t a1, uint64_t a2)
{
  void *v3;
  char v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD block[5];
  id v10;
  id v11;

  v3 = *(void **)(a1 + 32);
  v11 = 0;
  v4 = objc_msgSend(v3, "loadExtensions:error:", a2, &v11);
  v5 = v11;
  if ((v4 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_syncQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1AF25F3A0;
    block[3] = &unk_1E5F40650;
    v7 = *(void **)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    v10 = v7;
    dispatch_sync(v6, block);

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setBeganUsingAt:", v8);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t sub_1AF25F3A0(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "addRequestUUID:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "changeState:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "setUseCount:", 1);
}

#error "1AF25F45C: call analysis failed (funcsize=34)"

void sub_1AF25F464(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD *v16;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x3032000000;
    v17[3] = sub_1AF25BE28;
    v17[4] = sub_1AF25BE38;
    objc_msgSend(WeakRetained, "service");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    pklog_handle_for_category(7);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v2, "uuid");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "multipleInstanceUUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "version");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v20 = v6;
      v21 = 2114;
      v22 = v7;
      v23 = 2112;
      v24 = v8;
      v25 = 2112;
      v26 = v9;
      _os_log_debug_impl(&dword_1AF254000, v3, OS_LOG_TYPE_DEBUG, "[u %{public}@:m %{public}@] [%@(%@)] interrupted", buf, 0x2Au);

    }
    if ((objc_msgSend(v2, "terminating") & 1) == 0)
    {
      pklog_handle_for_category(7);
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v2, "uuid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "multipleInstanceUUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "version");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v20 = v10;
        v21 = 2114;
        v22 = v11;
        v23 = 2112;
        v24 = v12;
        v25 = 2112;
        v26 = v13;
        _os_log_error_impl(&dword_1AF254000, v4, OS_LOG_TYPE_ERROR, "[u %{public}@:m %{public}@] [%@(%@)] Connection to plugin interrupted while in use.", buf, 0x2Au);

      }
    }
    objc_msgSend(v2, "_syncQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_1AF25F758;
    v14[3] = &unk_1E5F407E0;
    v15 = v2;
    v16 = v17;
    dispatch_async(v5, v14);

    _Block_object_dispose(v17, 8);
  }

}

void sub_1AF25F72C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF25F758(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if (objc_msgSend(*(id *)(a1 + 32), "state"))
    objc_msgSend(*(id *)(a1 + 32), "unwind:force:", 2, 0);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

#error "1AF25F87C: call analysis failed (funcsize=59)"

uint64_t sub_1AF25F894(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  pklog_handle_for_category(7);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "multipleInstanceUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "version");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544130;
    v10 = v3;
    v11 = 2114;
    v12 = v4;
    v13 = 2112;
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_1AF254000, v2, OS_LOG_TYPE_DEFAULT, "[u %{public}@:m %{public}@] [%@(%@)] Emptying requests set", (uint8_t *)&v9, 0x2Au);

  }
  objc_msgSend(*(id *)(a1 + 32), "requests");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllObjects");

  result = objc_msgSend(*(id *)(a1 + 32), "state");
  if (result)
    return objc_msgSend(*(id *)(a1 + 32), "unwind:force:", 2, 0);
  return result;
}

void sub_1AF25F9EC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const char *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t current_persona;
  int v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uid_t v41;
  NSObject *v42;
  NSObject *v43;
  os_signpost_id_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint8_t v51;
  uid_t v52;
  int v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  void (*v58)(uint64_t, uint64_t, void *);
  void *v59;
  uint64_t v60;
  id v61;
  id v62;
  uint64_t v63;
  const char *v64;
  const char *v65;
  id v66;
  id v67;
  _BYTE v68[22];
  __int16 v69;
  void *v70;
  __int16 v71;
  void *v72;
  __int16 v73;
  uid_t v74;
  __int16 v75;
  uid_t v76;
  __int16 v77;
  int v78;
  __int16 v79;
  const char *v80;
  __int16 v81;
  const char *v82;
  uint8_t buf[32];
  _OWORD v84[2];
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _BYTE v101[28];
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  pklog_handle_for_category(7);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 64);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138478083;
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v11;
    _os_signpost_emit_with_name_impl(&dword_1AF254000, v8, OS_SIGNPOST_INTERVAL_END, v9, "HostToExtensionPrepareUsing", " identifier=%{private, signpost.description:attribute}@  uuid=%{public, signpost.description:attribute}@ ", buf, 0x16u);

  }
  if (v5)
  {
    pklog_handle_for_category(7);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "uuid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "multipleInstanceUUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "version");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      *(_QWORD *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v14;
      *(_WORD *)&buf[22] = 2112;
      *(_QWORD *)&buf[24] = v15;
      LOWORD(v84[0]) = 2112;
      *(_QWORD *)((char *)v84 + 2) = v16;
      WORD5(v84[0]) = 2114;
      *(_QWORD *)((char *)v84 + 12) = v5;
      WORD2(v84[1]) = 2114;
      *(_QWORD *)((char *)&v84[1] + 6) = v6;
      v17 = "[u %{public}@:m %{public}@] [%@(%@)] Failed to start plugin; prepareUsing returned error: %{public}@, response: %{public}@";
LABEL_15:
      _os_log_error_impl(&dword_1AF254000, v12, OS_LOG_TYPE_ERROR, v17, buf, 0x3Eu);

      goto LABEL_16;
    }
    goto LABEL_16;
  }
  v18 = *(void **)(a1 + 32);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sandboxExtensions"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = 0;
  LOBYTE(v18) = objc_msgSend(v18, "loadExtensions:error:", v19, &v67);
  v5 = v67;

  if ((v18 & 1) == 0)
  {
    pklog_handle_for_category(7);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "uuid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "multipleInstanceUUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "version");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      *(_QWORD *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v14;
      *(_WORD *)&buf[22] = 2112;
      *(_QWORD *)&buf[24] = v15;
      LOWORD(v84[0]) = 2112;
      *(_QWORD *)((char *)v84 + 2) = v16;
      WORD5(v84[0]) = 2114;
      *(_QWORD *)((char *)v84 + 12) = v5;
      WORD2(v84[1]) = 2114;
      *(_QWORD *)((char *)&v84[1] + 6) = v6;
      v17 = "[u %{public}@:m %{public}@] [%@(%@)] Failed to start plugin; could not consume sandbox file extensions: %{pu"
            "blic}@, response: %{public}@";
      goto LABEL_15;
    }
LABEL_16:

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    goto LABEL_17;
  }
  objc_msgSend(*(id *)(a1 + 32), "protocolSpec");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = v5;
  sub_1AF266A10(v20, &v66);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v66;

  if (v21)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "pluginConnection");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "remoteObjectInterface");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setInterface:forSelector:argumentIndex:ofReply:", v23, sel_beginUsingPlugIn_ready_, 1, 1);

    objc_msgSend(*(id *)(a1 + 32), "augmentInterface:", v23);
    v26 = objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      pklog_handle_for_category(7);
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        sub_1AF275650(a1 + 32, v26, (uint64_t)v27, v28, v29, v30, v31, v32, v51, v54, v56, v57, (uint64_t)v58, (uint64_t)v59, v60, (uint64_t)v61, (uint64_t)v62, v63, (uint64_t)v64,
          (uint64_t)v65,
          (uint64_t)v66,
          (uint64_t)v67,
          *(uint64_t *)v68,
          *(uint64_t *)&v68[8]);

      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
    else
    {
      v100 = 0u;
      memset(v101, 0, sizeof(v101));
      v98 = 0u;
      v99 = 0u;
      v96 = 0u;
      v97 = 0u;
      v94 = 0u;
      v95 = 0u;
      v92 = 0u;
      v93 = 0u;
      v90 = 0u;
      v91 = 0u;
      v88 = 0u;
      v89 = 0u;
      v86 = 0u;
      v87 = 0u;
      v85 = 0u;
      memset(v84, 0, sizeof(v84));
      memset(buf, 0, sizeof(buf));
      v64 = 0;
      v65 = 0;
      current_persona = voucher_get_current_persona();
      v35 = current_persona;
      memset(buf, 0, sizeof(buf));
      memset(v84, 0, sizeof(v84));
      v85 = 0u;
      v86 = 0u;
      v87 = 0u;
      v88 = 0u;
      v89 = 0u;
      v90 = 0u;
      v91 = 0u;
      v92 = 0u;
      v93 = 0u;
      v94 = 0u;
      v95 = 0u;
      v96 = 0u;
      v97 = 0u;
      v98 = 0u;
      v99 = 0u;
      v100 = 0u;
      memset(v101, 0, sizeof(v101));
      *(_DWORD *)buf = 1;
      pklog_get_persona_type_and_name(current_persona, (uint64_t)buf, &v65, &v64);
      pklog_handle_for_category(7);
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "uuid");
        v53 = v35;
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "multipleInstanceUUID");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "identifier");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "version");
        v55 = v23;
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = geteuid();
        v41 = getuid();
        *(_DWORD *)v68 = 138545410;
        *(_QWORD *)&v68[4] = v37;
        *(_WORD *)&v68[12] = 2114;
        *(_QWORD *)&v68[14] = v38;
        v69 = 2112;
        v70 = v39;
        v71 = 2112;
        v72 = v40;
        v73 = 1024;
        v74 = v52;
        v75 = 1024;
        v76 = v41;
        v77 = 1024;
        v78 = v53;
        v79 = 2080;
        v80 = v65;
        v81 = 2080;
        v82 = v64;
        _os_log_impl(&dword_1AF254000, v36, OS_LOG_TYPE_DEFAULT, "[u %{public}@:m %{public}@] [%@(%@)] Begin using sent as euid = %d, uid = %d, personaid = %d, type = %s, name = %s", v68, 0x50u);

        v23 = v55;
      }

      pklog_handle_for_category(7);
      v42 = objc_claimAutoreleasedReturnValue();
      v43 = v42;
      v44 = *(_QWORD *)(a1 + 64);
      if (v44 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
      {
        objc_msgSend(*(id *)(a1 + 32), "identifier");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "uuid");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138478083;
        *(_QWORD *)&buf[4] = v45;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v46;
        _os_signpost_emit_with_name_impl(&dword_1AF254000, v43, OS_SIGNPOST_INTERVAL_BEGIN, v44, "HostToExtensionBeginUsing", " identifier=%{private, signpost.description:attribute}@  uuid=%{public, signpost.description:attribute}@ ", buf, 0x16u);

      }
      v47 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "queuedHostPrincipal");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = MEMORY[0x1E0C809B0];
      v57 = 3221225472;
      v58 = sub_1AF260128;
      v59 = &unk_1E5F40830;
      v49 = *(_QWORD *)(a1 + 32);
      v50 = *(void **)(a1 + 56);
      v63 = *(_QWORD *)(a1 + 64);
      v60 = v49;
      v62 = v50;
      v61 = *(id *)(a1 + 48);
      objc_msgSend(v47, "beginUsingPlugIn:ready:", v48, &v56);

    }
    v22 = (id)v26;
  }
  else
  {
    pklog_handle_for_category(7);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      sub_1AF275554(a1 + 32, v33);

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

  v5 = v22;
LABEL_17:

}

void sub_1AF260128(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  void *v27;
  uint64_t v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  pklog_handle_for_category(7);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 56);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138478083;
    v31 = v8;
    v32 = 2114;
    v33 = v9;
    _os_signpost_emit_with_name_impl(&dword_1AF254000, v6, OS_SIGNPOST_INTERVAL_END, v7, "HostToExtensionBeginUsing", " identifier=%{private, signpost.description:attribute}@  uuid=%{public, signpost.description:attribute}@ ", buf, 0x16u);

  }
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "protocolSpec");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqual:", CFSTR("NSObject"));

    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = objc_claimAutoreleasedReturnValue();

      v4 = (id)v12;
    }
    objc_msgSend(*(id *)(a1 + 32), "setUseCount:", 1);
    objc_msgSend(*(id *)(a1 + 32), "setPlugInPrincipal:", v4);
    objc_msgSend(*(id *)(a1 + 32), "setEmbeddedPrincipal:", 0);
    objc_msgSend(*(id *)(a1 + 32), "_syncQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    v24 = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = sub_1AF260480;
    v27 = &unk_1E5F40650;
    v14 = *(void **)(a1 + 40);
    v28 = *(_QWORD *)(a1 + 32);
    v29 = v14;
    dispatch_sync(v13, &v24);

    objc_msgSend(MEMORY[0x1E0C99D68], "date", v24, v25, v26, v27, v28);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setBeganUsingAt:", v15);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    pklog_handle_for_category(7);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "uuid");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "multipleInstanceUUID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "version");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v31 = v17;
      v32 = 2114;
      v33 = v18;
      v34 = 2112;
      v35 = v19;
      v36 = 2112;
      v37 = v20;
      _os_log_impl(&dword_1AF254000, v16, OS_LOG_TYPE_INFO, "[u %{public}@:m %{public}@] [%@(%@)] telling plugin that host has control", buf, 0x2Au);

    }
    objc_msgSend(*(id *)(a1 + 32), "service");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "hostHasControl");

  }
  else
  {
    pklog_handle_for_category(7);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_1AF275704(a1, v22);

    v23 = *(_QWORD *)(a1 + 48);
    pkError(5, CFSTR("plug-in failed to initialize"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, uint64_t))(v23 + 16))(v23, v4, 1);
  }

}

uint64_t sub_1AF260480(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "addRequestUUID:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "changeState:", 1);
}

void sub_1AF2609D4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("sandboxExtensions"));
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t sub_1AF260A50(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1AF260D70()
{
  uint64_t result;

  getpid();
  result = sandbox_check();
  byte_1EEE37690 = (_DWORD)result != 0;
  return result;
}

void sub_1AF2610D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF2610F0(uint64_t a1)
{
  void *v2;
  char v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint8_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  _BYTE buf[24];
  uint64_t v44;
  _BYTE v45[24];
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v46 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(a1 + 32))
  {
LABEL_8:
    if (objc_msgSend(*(id *)(a1 + 40), "useCount") <= 1)
      objc_msgSend(*(id *)(a1 + 40), "setTerminating:", 1);
    objc_msgSend(*(id *)(a1 + 40), "unwind:force:", 0, 0);
    return;
  }
  objc_msgSend(*(id *)(a1 + 40), "requests");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 32));

  pklog_handle_for_category(7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((v3 & 1) != 0)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 40), "uuid");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "multipleInstanceUUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "version");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138544386;
      *(_QWORD *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v7;
      *(_WORD *)&buf[22] = 2112;
      v44 = (uint64_t)v8;
      *(_WORD *)v45 = 2112;
      *(_QWORD *)&v45[2] = v9;
      *(_WORD *)&v45[10] = 2112;
      *(_QWORD *)&v45[12] = v10;
      _os_log_impl(&dword_1AF254000, v5, OS_LOG_TYPE_INFO, "[u %{public}@:m %{public}@] [%@(%@)] ending request: %@", buf, 0x34u);

    }
    objc_msgSend(*(id *)(a1 + 40), "requests");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObject:", *(_QWORD *)(a1 + 32));

    pklog_handle_for_category(7);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      sub_1AF275868(a1 + 40, (uint64_t)v12, v13, v14, v15, v16, v17, v18, v36, v37, v38, v39, v41, v42, *(uint64_t *)buf, *(uint64_t *)&buf[8], *(uint64_t *)&buf[16], v44, *(uint64_t *)v45,
        *(uint64_t *)&v45[8],
        *(uint64_t *)&v45[16],
        v46,
        v47,
        v48);

    goto LABEL_8;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "uuid");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "multipleInstanceUUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "version");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138544386;
    *(_QWORD *)&buf[4] = v19;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v20;
    *(_WORD *)&buf[22] = 2112;
    v44 = (uint64_t)v21;
    *(_WORD *)v45 = 2112;
    *(_QWORD *)&v45[2] = v22;
    *(_WORD *)&v45[10] = 2112;
    *(_QWORD *)&v45[12] = v23;
    _os_log_impl(&dword_1AF254000, v5, OS_LOG_TYPE_DEFAULT, "[u %{public}@:m %{public}@] [%@(%@)] ignoring expired end request: [%@]", buf, 0x34u);

  }
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "multipleInstanceUUID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "version");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  pkErrorf(15, CFSTR("[u %@:m %@] [%@(%@)] endUsingRequest: called with unknown/expired request [%@]"), v27, v28, v29, v30, v31, v32, (uint64_t)v24);
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v35 = *(void **)(v34 + 40);
  *(_QWORD *)(v34 + 40) = v33;

}

void sub_1AF2614F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF26150C(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t sub_1AF261C44(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void sub_1AF2621DC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x2Au);
}

void sub_1AF2621F0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x2Au);
}

void sub_1AF2621FC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x34u);
}

uint64_t sub_1AF2622D0(uint64_t a1)
{
  return *(_QWORD *)a1;
}

void sub_1AF2622DC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x34u);
}

void sub_1AF26232C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x34u);
}

uint64_t sub_1AF262354()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t sub_1AF262360()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t sub_1AF26236C()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

void sub_1AF262378(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x2Au);
}

uint64_t sub_1AF262384()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t sub_1AF262390()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t sub_1AF26239C()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t sub_1AF2623C0()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1AF2623CC()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1AF2623D8()
{
  uint64_t v0;

  return v0;
}

void sub_1AF2623E4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 0x34u);
}

uint64_t sub_1AF262600(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1AF262610(uint64_t a1)
{

}

uint64_t sub_1AF262698(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  pklog_handle_for_category(6);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 134217984;
    v6 = v3;
    _os_log_impl(&dword_1AF254000, v2, OS_LOG_TYPE_DEFAULT, "<PKDiscoveryDriver:%p> destroying discovery driver", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 32), "removeWatchers");
}

void sub_1AF262818(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "count") && objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v2 = (void *)MEMORY[0x1AF45AD14]();
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v4 = *(void **)(a1 + 32);
    v5 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = sub_1AF262A8C;
    v22[3] = &unk_1E5F40A08;
    v6 = v3;
    v23 = v6;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v22);
    v7 = *(void **)(a1 + 40);
    v17 = v5;
    v18 = 3221225472;
    v19 = sub_1AF262AD0;
    v20 = &unk_1E5F40A30;
    v8 = v6;
    v21 = v8;
    objc_msgSend(v7, "objectsPassingTest:", &v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count", v17, v18, v19, v20);
    if (v10 == objc_msgSend(*(id *)(a1 + 40), "count") && !*(_BYTE *)(a1 + 56))
    {
      pklog_handle_for_category(6);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_INFO))
      {
        v16 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 134217984;
        v25 = v16;
        _os_log_impl(&dword_1AF254000, (os_log_t)v15, OS_LOG_TYPE_INFO, "<PKDiscoveryDriver:%p> no relevant uninstalled plugins", buf, 0xCu);
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "queue");
      v11 = objc_claimAutoreleasedReturnValue();
      dispatch_assert_queue_V2(v11);

      objc_msgSend(*(id *)(a1 + 48), "setLastResults:", v9);
      pklog_handle_for_category(6);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = *(_QWORD *)(a1 + 48);
        v14 = objc_msgSend(v9, "count");
        *(_DWORD *)buf = 134218240;
        v25 = v13;
        v26 = 1024;
        v27 = v14;
        _os_log_impl(&dword_1AF254000, v12, OS_LOG_TYPE_DEFAULT, "<PKDiscoveryDriver:%p> delivering update to host (%u plugins)", buf, 0x12u);
      }

      objc_msgSend(*(id *)(a1 + 48), "report");
      v15 = objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v15 + 16))(v15, v9, 0);
    }

    objc_autoreleasePoolPop(v2);
  }
}

void sub_1AF262A8C(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "pluginUUID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

uint64_t sub_1AF262AD0(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  NSObject *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "effectiveUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3);
  if (v4)
  {
    pklog_handle_for_category(6);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_1AF254000, v5, OS_LOG_TYPE_DEFAULT, "removing uninstalled plugin %@", (uint8_t *)&v7, 0xCu);
    }

  }
  return v4 ^ 1u;
}

uint64_t sub_1AF262D38(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeWatchers");
}

void sub_1AF262D40(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "lastResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 40);

    if (v3)
    {
      v4 = *(_QWORD *)(a1 + 40);
      pkError(13, CFSTR("query cancelled"));
      v5 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, id))(v4 + 16))(v4, 0, v5);

    }
  }
}

void sub_1AF262DC4(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "report");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  pklog_handle_for_category(6);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)MEMORY[0x1AF45AEB8](v2);
    v6 = 134217984;
    v7 = v4;
    _os_log_impl(&dword_1AF254000, v3, OS_LOG_TYPE_DEFAULT, "Annotations changed, re-performing query for continuous discovery, report block = <%p>.", (uint8_t *)&v6, 0xCu);

  }
  if (v2)
  {
    objc_msgSend(WeakRetained, "lastResults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "performWithPreviousResults:forceNotify:", v5, 1);

  }
}

void sub_1AF262EC4(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "report");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  pklog_handle_for_category(6);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)MEMORY[0x1AF45AEB8](v2);
    v6 = 134217984;
    v7 = v4;
    _os_log_impl(&dword_1AF254000, v3, OS_LOG_TYPE_DEFAULT, "ManagedConfiguration effective settings changed, re-performing query for continuous discovery, report block = <%p>.", (uint8_t *)&v6, 0xCu);

  }
  if (v2)
  {
    objc_msgSend(WeakRetained, "lastResults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "performWithPreviousResults:forceNotify:", v5, 1);

  }
}

void sub_1AF262FC4(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = sub_1AF263078;
    v7[3] = &unk_1E5F40940;
    v9 = *(id *)(a1 + 32);
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

uint64_t sub_1AF263078(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void sub_1AF263520(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "wdriver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v5 = v2;
    v3 = objc_msgSend(*(id *)(a1 + 40), "count");
    objc_msgSend(v5, "lastResults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      objc_msgSend(v5, "_performWithPreviousResults:forceNotify:uninstalledProxies:", v4, 0, *(_QWORD *)(a1 + 40));
    else
      objc_msgSend(v5, "performWithPreviousResults:forceNotify:", v4, 0);

    v2 = v5;
  }

}

void sub_1AF2636A4(uint64_t a1, void *a2)
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
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  uint64_t *v24;
  _QWORD block[5];
  id v26;
  id v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "daemon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorInReply:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "daemon");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_get_value(v3, "matches");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "convertFromXPC:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("uuid"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithUUIDString:", v10);

    v34 = 0;
    v35 = &v34;
    v36 = 0x3032000000;
    v37 = sub_1AF263944;
    v38 = sub_1AF263954;
    v39 = 0;
    v30 = 0;
    v31 = &v30;
    v32 = 0x2020000000;
    v33 = 0;
    objc_msgSend(*(id *)(a1 + 32), "hostQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1AF26395C;
    block[3] = &unk_1E5F40B20;
    v14 = *(_QWORD *)(a1 + 32);
    v28 = &v34;
    block[4] = v14;
    v15 = v11;
    v26 = v15;
    v29 = &v30;
    v16 = v8;
    v27 = v16;
    dispatch_sync(v12, block);

    if (*((_BYTE *)v31 + 24))
    {
      objc_msgSend((id)v35[5], "_syncQueue");
      v18 = objc_claimAutoreleasedReturnValue();
      v21[0] = v13;
      v21[1] = 3221225472;
      v21[2] = sub_1AF263A54;
      v21[3] = &unk_1E5F40B48;
      v24 = &v34;
      v19 = v16;
      v20 = *(_QWORD *)(a1 + 32);
      v22 = v19;
      v23 = v20;
      dispatch_sync(v18, v21);

    }
    (*(void (**)(_QWORD, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v35[5], 0, v17);

    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&v34, 8);

  }
}

void sub_1AF263920(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1AF263944(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1AF263954(uint64_t a1)
{

}

void sub_1AF26395C(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  PKHostPlugIn *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "discoveryMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  }
  else
  {
    v6 = -[PKHostPlugIn initWithForm:host:]([PKHostPlugIn alloc], "initWithForm:host:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    objc_msgSend(*(id *)(a1 + 32), "discoveryMap");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    objc_msgSend(v9, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v9, v10);

  }
}

uint64_t sub_1AF263A54(uint64_t a1)
{
  return MEMORY[0x1E0DE7D20](*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), sel_updateFromForm_host_);
}

void sub_1AF263B10(uint64_t a1, void *a2)
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
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  uint64_t *v24;
  _QWORD block[5];
  id v26;
  id v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "daemon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorInReply:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "daemon");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_get_value(v3, "matches");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "convertFromXPC:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("uuid"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithUUIDString:", v10);

    v34 = 0;
    v35 = &v34;
    v36 = 0x3032000000;
    v37 = sub_1AF263944;
    v38 = sub_1AF263954;
    v39 = 0;
    v30 = 0;
    v31 = &v30;
    v32 = 0x2020000000;
    v33 = 0;
    objc_msgSend(*(id *)(a1 + 32), "hostQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1AF263DB0;
    block[3] = &unk_1E5F40B20;
    v14 = *(_QWORD *)(a1 + 32);
    v28 = &v34;
    block[4] = v14;
    v15 = v11;
    v26 = v15;
    v29 = &v30;
    v16 = v8;
    v27 = v16;
    dispatch_sync(v12, block);

    if (*((_BYTE *)v31 + 24))
    {
      objc_msgSend((id)v35[5], "_syncQueue");
      v18 = objc_claimAutoreleasedReturnValue();
      v21[0] = v13;
      v21[1] = 3221225472;
      v21[2] = sub_1AF263EA8;
      v21[3] = &unk_1E5F40B48;
      v24 = &v34;
      v19 = v16;
      v20 = *(_QWORD *)(a1 + 32);
      v22 = v19;
      v23 = v20;
      dispatch_sync(v18, v21);

    }
    (*(void (**)(_QWORD, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v35[5], 0, v17);

    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&v34, 8);

  }
}

void sub_1AF263D8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1AF263DB0(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  PKHostPlugIn *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "discoveryMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  }
  else
  {
    v6 = -[PKHostPlugIn initWithForm:host:]([PKHostPlugIn alloc], "initWithForm:host:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    objc_msgSend(*(id *)(a1 + 32), "discoveryMap");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    objc_msgSend(v9, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v9, v10);

  }
}

uint64_t sub_1AF263EA8(uint64_t a1)
{
  return MEMORY[0x1E0DE7D20](*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), sel_updateFromForm_host_);
}

void sub_1AF263EC0(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  uint64_t v39;
  uint64_t v40;
  xpc_object_t xdict;
  uint64_t (*v42)(uint64_t, uint64_t);
  uint64_t v43;
  uint64_t v44;
  id obj;
  id v46;
  id v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[7];
  _QWORD block[5];
  id v59;
  void *v60;
  _BYTE *v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  char v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  uint8_t v72[128];
  _BYTE buf[24];
  uint64_t (*v74)(uint64_t, uint64_t);
  void (*v75)(uint64_t);
  id v76;
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  xdict = a2;
  v48 = a1;
  objc_msgSend(*(id *)(a1 + 32), "daemon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorInReply:", xdict);
  v42 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    pklog_handle_for_category(6);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v40 = *(_QWORD *)(a1 + 32);
      v39 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v39;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v40;
      *(_WORD *)&buf[22] = 2112;
      v74 = v42;
      _os_log_error_impl(&dword_1AF254000, v4, OS_LOG_TYPE_ERROR, "[d %@] <PKHost:%p> Failed discovery: %@.", buf, 0x20u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "daemon");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_get_value(xdict, "matches");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "convertFromXPC:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v46 = (id)objc_claimAutoreleasedReturnValue();
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    obj = v7;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v77, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v68;
      do
      {
        v10 = 0;
        if (v8 <= 1)
          v11 = 1;
        else
          v11 = v8;
        do
        {
          if (*(_QWORD *)v68 != v9)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v10);
          v13 = objc_alloc(MEMORY[0x1E0CB3A28]);
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("uuid"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)objc_msgSend(v13, "initWithUUIDString:", v14);

          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v74 = sub_1AF263944;
          v75 = sub_1AF263954;
          v76 = 0;
          v63 = 0;
          v64 = &v63;
          v65 = 0x2020000000;
          v66 = 0;
          objc_msgSend(*(id *)(v48 + 32), "hostQueue");
          v16 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = sub_1AF2578BC;
          block[3] = &unk_1E5F40B20;
          v17 = *(_QWORD *)(v48 + 32);
          v61 = buf;
          block[4] = v17;
          v18 = v15;
          v62 = &v63;
          v59 = v18;
          v60 = v12;
          dispatch_sync(v16, block);

          if (*((_BYTE *)v64 + 24))
          {
            objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "_syncQueue");
            v19 = objc_claimAutoreleasedReturnValue();
            v57[0] = MEMORY[0x1E0C809B0];
            v57[1] = 3221225472;
            v57[2] = sub_1AF25A684;
            v57[3] = &unk_1E5F40B48;
            v20 = *(_QWORD *)(v48 + 32);
            v57[4] = v12;
            v57[5] = v20;
            v57[6] = buf;
            dispatch_sync(v19, v57);

          }
          objc_msgSend(v46, "addObject:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));

          _Block_object_dispose(&v63, 8);
          _Block_object_dispose(buf, 8);

          ++v10;
        }
        while (v11 != v10);
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v77, 16);
      }
      while (v8);
    }

    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v47 = v46;
    v21 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v53, v72, 16);
    if (v21)
    {
      v43 = *(_QWORD *)v54;
      do
      {
        v22 = 0;
        if (v21 <= 1)
          v23 = 1;
        else
          v23 = v21;
        v44 = v23;
        do
        {
          if (*(_QWORD *)v54 != v43)
            objc_enumerationMutation(v47);
          v24 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v22);
          objc_msgSend(v24, "supersedingUUID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25)
          {
            v51 = 0u;
            v52 = 0u;
            v49 = 0u;
            v50 = 0u;
            v26 = v47;
            v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v49, v71, 16);
            if (v27)
            {
              v28 = *(_QWORD *)v50;
              do
              {
                v29 = 0;
                if (v27 <= 1)
                  v30 = 1;
                else
                  v30 = v27;
                do
                {
                  if (*(_QWORD *)v50 != v28)
                    objc_enumerationMutation(v26);
                  v31 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v29);
                  objc_msgSend(v31, "uuid");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "supersedingUUID");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  v34 = objc_msgSend(v32, "isEqual:", v33);

                  if (v34)
                    objc_msgSend(v24, "setSupersededBy:", v31);
                  ++v29;
                }
                while (v30 != v29);
                v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v49, v71, 16);
              }
              while (v27);
            }

          }
          else
          {
            objc_msgSend(v24, "setSupersededBy:", 0);
          }
          ++v22;
        }
        while (v22 != v44);
        v21 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v53, v72, 16);
      }
      while (v21);
    }

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v48 + 56) + 8) + 24) = objc_msgSend(obj, "count");
    pklog_handle_for_category(6);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v37 = *(_QWORD *)(v48 + 32);
      v36 = *(_QWORD *)(v48 + 40);
      v38 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(v48 + 56) + 8) + 24);
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v36;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v37;
      *(_WORD *)&buf[22] = 2048;
      v74 = v38;
      _os_log_impl(&dword_1AF254000, v35, OS_LOG_TYPE_DEFAULT, "[d %@] <PKHost:%p> Completed discovery. Final # of matches: %lu", buf, 0x20u);
    }

    (*(void (**)(void))(*(_QWORD *)(v48 + 48) + 16))();
  }

}

void sub_1AF2644E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose(&STACK[0x2A0], 8);
  _Unwind_Resume(a1);
}

void sub_1AF2645C8(uint64_t a1, xpc_object_t xdict)
{
  void *v3;
  id v4;

  xpc_dictionary_get_array(xdict, "extensions");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v3 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void sub_1AF26475C(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  size_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  xpc_object_t xdict;

  xdict = a2;
  xpc_dictionary_get_array(xdict, "pidarray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_get_array(xdict, "uuids");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3)
  {
    v6 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    if (v5)
      goto LABEL_3;
LABEL_8:
    v7 = 0;
    goto LABEL_9;
  }
  v6 = 0;
  if (!v4)
    goto LABEL_8;
LABEL_3:
  v7 = (void *)objc_opt_new();
  if (xpc_array_get_count(v5))
  {
    v8 = 0;
    do
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", xpc_array_get_uuid(v5, v8));
      objc_msgSend(v7, "addObject:", v9);

      ++v8;
    }
    while (v8 < xpc_array_get_count(v5));
  }
LABEL_9:
  v10 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "daemon");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "errorInReply:", xdict);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *, void *))(v10 + 16))(v10, v12, v6, v7);

}

void sub_1AF264CD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF264CEC(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "activePlugIns");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v6)
  {
    if (objc_msgSend(v6, "state") != 1)
    {
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = 0;

    }
  }
}

void sub_1AF264E64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF264E7C(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "discoveryMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "multipleInstanceUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    goto LABEL_2;
  v6 = *(void **)(a1 + 40);

  if (v4 != v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("PKHost.m"), 383, CFSTR("plugin %@ activating but discovery map contains %@"), *(_QWORD *)(a1 + 40), v4);
LABEL_2:

  }
  objc_msgSend(*(id *)(a1 + 32), "activePlugIns");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v12)
  {
    if (objc_msgSend(v12, "state"))
      goto LABEL_16;
    pklog_handle_for_category(7);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1AF275C5C(a1 + 48, v13);

    objc_msgSend(*(id *)(a1 + 32), "activePlugIns");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeObjectForKey:", v15);

    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = 0;

  }
  pklog_handle_for_category(7);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 40), "uuid");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "multipleInstanceUUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "version");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v39 = v19;
    v40 = 2114;
    v41 = v20;
    v42 = 2112;
    v43 = v21;
    v44 = 2112;
    v45 = v22;
    _os_log_impl(&dword_1AF254000, v18, OS_LOG_TYPE_INFO, "[u %{public}@:m %{public}@] [%@(%@)] activating plugin", buf, 0x2Au);

  }
  objc_msgSend(*(id *)(a1 + 40), "multipleInstanceUUID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
    v24 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "activePlugIns");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v24, v26);

  }
  objc_msgSend(*(id *)(a1 + 32), "activeOneShots");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "effectiveUUID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKeyedSubscript:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = *(_QWORD *)(a1 + 56);
    v35 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "effectiveUUID");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "UUIDString");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", v34, v35, CFSTR("PKHost.m"), 398, CFSTR("superseding active UUID: %@"), v37);

  }
  v30 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "activeOneShots");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "effectiveUUID");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setObject:forKeyedSubscript:", v30, v32);

LABEL_16:
}

void sub_1AF265304(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  pklog_handle_for_category(7);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "multipleInstanceUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "version");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v28 = v3;
    v29 = 2114;
    v30 = v4;
    v31 = 2112;
    v32 = v5;
    v33 = 2112;
    v34 = v6;
    _os_log_impl(&dword_1AF254000, v2, OS_LOG_TYPE_INFO, "[u %{public}@:m %{public}@] [%@(%@)] deactivating plugin", buf, 0x2Au);

  }
  objc_msgSend(*(id *)(a1 + 32), "multipleInstanceUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "activePlugIns");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqualToString:", v12) ^ 1;

    }
    else
    {
      v13 = 0;
    }
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), CFSTR("PKHost.m"), 410, CFSTR("deactivating plugin %@ but encountered %@"), *(_QWORD *)(a1 + 32), v10);

    }
    objc_msgSend(*(id *)(a1 + 40), "activePlugIns");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeObjectForKey:", v16);

  }
  objc_msgSend(*(id *)(a1 + 40), "activeOneShots");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "effectiveUUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = *(_QWORD *)(a1 + 40);
    v23 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "effectiveUUID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "UUIDString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", v23, v24, CFSTR("PKHost.m"), 413, CFSTR("deactivating inactive UUID: %@"), v26);

  }
  objc_msgSend(*(id *)(a1 + 40), "activeOneShots");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "effectiveUUID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "removeObjectForKey:", v21);

}

void sub_1AF26569C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "infoDictionary");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

}

void sub_1AF265774(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

uint64_t sub_1AF2657A0()
{
  uint64_t v0;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v0 + 8) + 40);
}

void sub_1AF2657B0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1AF2657C4(void *a1, uint64_t a2, void *a3, unsigned int a4, void *a5, void *a6)
{
  id v8;
  id v9;
  void *v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *context;
  id v25;
  id obj;
  _QWORD v29[4];
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v25 = a6;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v8;
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, MEMORY[0x1E0C9AA60]);
  for (i = v10; objc_msgSend(i, "count"); i = v15)
  {
    context = (void *)MEMORY[0x1AF45AD14]();
    objc_msgSend(v10, "allKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v10;
    objc_msgSend(v10, "removeObjectForKey:", v13);
    objc_msgSend(a1, "_mutableDictionaryAtKeyPath:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend(v14, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v33;
      do
      {
        v19 = 0;
        if (v17 <= 1)
          v20 = 1;
        else
          v20 = v17;
        do
        {
          if (*(_QWORD *)v33 != v18)
            objc_enumerationMutation(obj);
          v21 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v19);
          objc_msgSend(v13, "arrayByAddingObject:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9 && objc_msgSend(v9, "containsObject:", v22))
          {
            objc_msgSend(a1, "_overlayCustomValueAtKeyPath:intoTargetDictionary:fromSourceDictionary:handler:", v22, v16, v14, v25);
          }
          else
          {
            v29[0] = MEMORY[0x1E0C809B0];
            v29[1] = 3221225472;
            v29[2] = sub_1AF265A64;
            v29[3] = &unk_1E5F40CF0;
            v30 = v15;
            v31 = v22;
            objc_msgSend(a1, "_overlayValueAtKey:intoTargetDictionary:fromSourceDictionary:targetTakePrecedent:nestedDictionaryHandler:", v21, v16, v14, a4, v29);

          }
          ++v19;
        }
        while (v20 != v19);
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v17);
    }

    objc_autoreleasePoolPop(context);
    v10 = v15;
  }

}

uint64_t sub_1AF265A64(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a2, *(_QWORD *)(a1 + 40));
}

void sub_1AF265A74(void *a1, uint64_t a2, void *a3)
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      if (v5 <= 1)
        v8 = 1;
      else
        v8 = v5;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v7), "mutableCopy");
        objc_msgSend(v9, "lastObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "removeLastObject");
        objc_msgSend(a1, "_mutableDictionaryAtKeyPath:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeObjectForKey:", v10);

        ++v7;
      }
      while (v8 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

}

void sub_1AF265BB8(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, int a6, void *a7)
{
  id v11;
  void (**v12)(id, void *);
  void *v13;
  void *v14;
  _BOOL4 v15;
  id v16;

  v16 = a3;
  v11 = a4;
  v12 = a7;
  objc_msgSend(a5, "objectForKeyedSubscript:", v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12[2](v12, v13);
  }
  else
  {
    if (a6)
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", v16);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14 == 0;

    }
    else
    {
      v15 = 1;
    }
    if (v15)
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, v16);
  }

}

void sub_1AF265CA8(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6)
{
  id v9;
  void (**v10)(id, id, void *, void *);
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v9 = a4;
  v10 = a6;
  v11 = a5;
  objc_msgSend(v17, "lastObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v15 = 0;
    v16 = v9;
    goto LABEL_5;
  }
  v10[2](v10, v17, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v9;
  if (!v15)
  {
LABEL_5:
    objc_msgSend(v16, "removeObjectForKey:", v12);
    goto LABEL_6;
  }
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, v12);
LABEL_6:

}

id sub_1AF265DAC(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = a1;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v16;
    v8 = v5;
    do
    {
      v9 = 0;
      if (v6 <= 1)
        v10 = 1;
      else
        v10 = v6;
      v11 = v8;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
        objc_msgSend(v11, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "_createOrConvertToMutableDictionaryFromDictionary:", v13);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, v12);

        ++v9;
        v11 = v8;
      }
      while (v10 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

id sub_1AF265F0C(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = v3;
  if (!v3 || (v5 = (void *)objc_msgSend(v3, "mutableCopy")) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

uint64_t sub_1AF266124()
{
  return NSRequestConcreteImplementation();
}

uint64_t pkUseInternalDiagnostics()
{
  if (qword_1EEE37648 != -1)
    dispatch_once(&qword_1EEE37648, &unk_1E5F404D8);
  return byte_1EEE37650;
}

uint64_t sub_1AF266174()
{
  uint64_t result;

  result = os_variant_has_internal_diagnostics();
  byte_1EEE37650 = result;
  return result;
}

uint64_t pkRunningboardManaged()
{
  _os_feature_enabled_impl();
  return 1;
}

uint64_t PKAnnotationNotificationSetName(uint64_t result)
{
  qword_1EEE37028 = result;
  return result;
}

BOOL PKAnnotationNotificationPost()
{
  uint32_t v0;
  NSObject *v1;

  v0 = notify_post((const char *)qword_1EEE37028);
  if (v0)
  {
    pklog_handle_for_category(10);
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      sub_1AF275F08();

  }
  return v0 == 0;
}

BOOL sub_1AF266230(int a1)
{
  uint32_t v1;
  NSObject *v2;

  v1 = notify_cancel(a1);
  if (v1)
  {
    pklog_handle_for_category(10);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      sub_1AF275FB0();

  }
  return v1 == 0;
}

id sub_1AF26628C(void *a1)
{
  return a1;
}

id pkError(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB35C8];
  if (a2)
  {
    v9 = *MEMORY[0x1E0CB2D50];
    v10[0] = a2;
    v4 = (void *)MEMORY[0x1E0C99D80];
    v5 = a2;
    objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("PlugInKit"), a1, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
    objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("PlugInKit"), a1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

id pkErrorf(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v10 = a2;
  if (v10)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v10, &a9);
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0CB2D50];
    v17[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("PlugInKit"), a1, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PlugInKit"), a1, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

id sub_1AF2664D0(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  Class v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  id v33;
  id v34;
  unsigned int v35;
  void *v36;
  uint64_t v37;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a1;
  v5 = a3;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(","));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v48;
    v33 = v5;
    v34 = v4;
    v36 = v6;
    v39 = *(_QWORD *)v48;
LABEL_3:
    v9 = 0;
    if (v7 <= 1)
      v10 = 1;
    else
      v10 = v7;
    v40 = v10;
    while (1)
    {
      if (*(_QWORD *)v48 != v8)
        objc_enumerationMutation(v6);
      objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * v9), "componentsSeparatedByString:", CFSTR(":"), v33, v34);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "count") != 3)
      {
        pkError(6, v5);
        v42 = objc_claimAutoreleasedReturnValue();

LABEL_45:
        v31 = (void *)v42;
        goto LABEL_46;
      }
      objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("request"));
      v41 = v12;
      if ((v13 & 1) != 0 || (objc_msgSend(v12, "isEqualToString:", CFSTR("reply")) & 1) != 0)
        break;
      pkError(6, v12);
      v42 = objc_claimAutoreleasedReturnValue();
      v30 = 1;
LABEL_41:

      if (v30)
        goto LABEL_45;
      if (++v9 == v10)
      {
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_44;
      }
    }
    v14 = v13 ^ 1u;
    objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "integerValue");

    objc_msgSend(v11, "objectAtIndexedSubscript:", 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "characterAtIndex:", 0) == 123)
    {
      if (objc_msgSend(v17, "characterAtIndex:", objc_msgSend(v17, "length") - 1) == 125)
      {
        v37 = v16;
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v19 = 1;
        objc_msgSend(v17, "substringWithRange:", 1, objc_msgSend(v17, "length") - 2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "componentsSeparatedByString:", CFSTR("+"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
        if (v22)
        {
          v35 = v14;
          v23 = *(_QWORD *)v44;
          do
          {
            v24 = 0;
            if (v22 <= 1)
              v25 = 1;
            else
              v25 = v22;
            do
            {
              if (*(_QWORD *)v44 != v23)
                objc_enumerationMutation(v21);
              v26 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v24));
              v27 = objc_lookUpClass((const char *)objc_msgSend(v26, "UTF8String"));
              if (!v27)
              {
                pkError(6, v26);
                v42 = objc_claimAutoreleasedReturnValue();
                v19 = 0;
                goto LABEL_35;
              }
              objc_msgSend(v18, "addObject:", v27);
              ++v24;
            }
            while (v25 != v24);
            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
          }
          while (v22);
          v19 = 1;
LABEL_35:
          v5 = v33;
          v4 = v34;
          v14 = v35;
        }

        v8 = v39;
        if (!v19)
        {

          v30 = 1;
          v6 = v36;
          goto LABEL_40;
        }
        objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v18, a2, v37, v14);

        v6 = v36;
        goto LABEL_38;
      }
      pkError(6, v17);
      v42 = objc_claimAutoreleasedReturnValue();
      v30 = 1;
      v8 = v39;
    }
    else
    {
      sub_1AF26693C(v17, 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setInterface:forSelector:argumentIndex:ofReply:", v29, a2, v16, v14);

      }
      else
      {
        pkError(6, v17);
        v42 = objc_claimAutoreleasedReturnValue();
      }
      v8 = v39;

      if (v28)
      {
LABEL_38:
        v30 = 0;
        goto LABEL_40;
      }
      v30 = 1;
    }
LABEL_40:

    v10 = v40;
    goto LABEL_41;
  }
LABEL_44:
  v31 = 0;
LABEL_46:

  return v31;
}

id sub_1AF26693C(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;

  v3 = objc_retainAutorelease(a1);
  objc_getProtocol((const char *)objc_msgSend(v3, "UTF8String"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unable to locate protocol [%@] - check that it is defined and not inadvertently optimized away"), v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    pklog_handle_for_category(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      sub_1AF276004((uint64_t)v5, v6);

      if (!a2)
        goto LABEL_5;
    }
    else
    {

      if (!a2)
      {
LABEL_5:

        goto LABEL_6;
      }
    }
    pkError(12, v5);
    *a2 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
LABEL_6:

  return v4;
}

Protocol *sub_1AF266A10(void *a1, _QWORD *a2)
{
  id v3;
  Protocol *v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  __CFString *v11;
  __CFString *v12;
  uint64_t v13;
  id v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  Protocol *v19;
  int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  Protocol *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    sub_1AF26693C(v3, a2);
    v4 = (Protocol *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v5 = v3;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      if (v6)
      {
        v7 = *(_QWORD *)v33;
        v8 = CFSTR("__XX_COMPOUND");
        do
        {
          v9 = 0;
          if (v6 <= 1)
            v10 = 1;
          else
            v10 = v6;
          v11 = v8;
          do
          {
            if (*(_QWORD *)v33 != v7)
              objc_enumerationMutation(v5);
            -[__CFString stringByAppendingFormat:](v11, "stringByAppendingFormat:", CFSTR("__%@"), *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v9));
            v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

            ++v9;
            v11 = v8;
          }
          while (v10 != v9);
          v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        }
        while (v6);
      }
      else
      {
        v8 = CFSTR("__XX_COMPOUND");
      }

      v12 = objc_retainAutorelease(v8);
      objc_allocateProtocol((const char *)-[__CFString UTF8String](v12, "UTF8String"));
      v13 = objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v4 = (Protocol *)v13;
        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        v14 = v5;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v15)
        {
          v16 = *(_QWORD *)v29;
          while (2)
          {
            v17 = 0;
            if (v15 <= 1)
              v18 = 1;
            else
              v18 = v15;
            do
            {
              if (*(_QWORD *)v29 != v16)
                objc_enumerationMutation(v14);
              sub_1AF26693C(*(void **)(*((_QWORD *)&v28 + 1) + 8 * v17), a2);
              v19 = (Protocol *)objc_claimAutoreleasedReturnValue();
              if (!v19)
              {

                v20 = 0;
                goto LABEL_32;
              }
              protocol_addProtocol(v4, v19);

              ++v17;
            }
            while (v18 != v17);
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
            if (v15)
              continue;
            break;
          }
        }

        objc_registerProtocol(v4);
        v20 = 1;
      }
      else
      {
        objc_getProtocol((const char *)-[__CFString UTF8String](objc_retainAutorelease(v12), "UTF8String"));
        v21 = objc_claimAutoreleasedReturnValue();
        v4 = (Protocol *)v21;
        v20 = 1;
        if (a2 && !v21)
        {
          v22 = (void *)MEMORY[0x1E0CB35C8];
          v38 = *MEMORY[0x1E0CB2D50];
          v39[0] = CFSTR("unable to create compound protocol");
          v20 = 1;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("PlugInKit"), 12, v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          v25 = v24;
          v4 = 0;
          *a2 = v25;
        }
      }
LABEL_32:

      if (!v20)
      {
        v26 = 0;
        goto LABEL_34;
      }
    }
    else
    {
      v4 = 0;
    }
  }
  v4 = v4;
  v26 = v4;
LABEL_34:

  return v26;
}

uint64_t pkIsInSpecialSession()
{
  NSObject *v0;
  int v2;
  uint64_t v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  pklog_handle_for_category(0);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    v2 = 136315394;
    v3 = 0;
    v4 = 1024;
    v5 = 0;
    _os_log_impl(&dword_1AF254000, v0, OS_LOG_TYPE_INFO, "vproc manager: [%s], in special session: %d", (uint8_t *)&v2, 0x12u);
  }

  return 0;
}

uint64_t pkIsServiceAccount()
{
  return 0;
}

uint64_t sub_1AF266E1C()
{
  return 0;
}

id sub_1AF266E24(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5;
  void (**v6)(id, _QWORD);
  void *v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      if (v9 <= 1)
        v12 = 1;
      else
        v12 = v9;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v8);
        v6[2](v6, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v7, "addObject:", v13, (_QWORD)v15);

        ++v11;
      }
      while (v12 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  return v7;
}

uint64_t sub_1AF266F78(uint64_t a1)
{
  return MEMORY[0x1E0DE7D20](a1, sel_compare_options_);
}

id sub_1AF266F80(void *a1)
{
  if ((objc_msgSend(a1, "conformsToProtocol:", &unk_1EEE40528) & 1) == 0)
    sub_1AF276078();
  sub_1AF266FBC(a1);
  return (id)objc_claimAutoreleasedReturnValue();
}

__CFString *sub_1AF266FBC(void *a1)
{
  id v1;
  const _xpc_type_s *v2;
  void *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  id v7;
  const void *bytes_ptr;
  id v9;
  __CFString *v10;
  __CFString *v11;

  v1 = a1;
  v2 = (const _xpc_type_s *)MEMORY[0x1AF45B2D8]();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("(%s)"), xpc_type_get_name(v2));
  if (v2 == (const _xpc_type_s *)MEMORY[0x1E0C812D0])
  {
    if (v1 == (id)MEMORY[0x1E0C81240])
      v5 = CFSTR("true");
    else
      v5 = CFSTR("false");
    v6 = v5;
  }
  else if (v2 == (const _xpc_type_s *)MEMORY[0x1E0C81328])
  {
    v6 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", xpc_int64_get_value(v1));
  }
  else if (v2 == (const _xpc_type_s *)MEMORY[0x1E0C81398])
  {
    v6 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedLongLong:", xpc_uint64_get_value(v1));
  }
  else if (v2 == (const _xpc_type_s *)MEMORY[0x1E0C81300])
  {
    v6 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithDouble:", xpc_double_get_value(v1));
  }
  else if (v2 == (const _xpc_type_s *)MEMORY[0x1E0C812F0])
  {
    v6 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", (double)xpc_date_get_value(v1) / 1000000000.0);
  }
  else if (v2 == (const _xpc_type_s *)MEMORY[0x1E0C812E8])
  {
    v7 = objc_alloc(MEMORY[0x1E0C99D50]);
    bytes_ptr = xpc_data_get_bytes_ptr(v1);
    v6 = (__CFString *)objc_msgSend(v7, "initWithBytes:length:", bytes_ptr, xpc_data_get_length(v1));
  }
  else if (v2 == (const _xpc_type_s *)MEMORY[0x1E0C81390])
  {
    v6 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", xpc_string_get_string_ptr(v1), 4);
  }
  else if (v2 == (const _xpc_type_s *)MEMORY[0x1E0C813A0])
  {
    v6 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", xpc_uuid_get_bytes(v1));
  }
  else if (v2 == (const _xpc_type_s *)MEMORY[0x1E0C812F8])
  {
    sub_1AF2674FC(v1);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else if (v2 == (const _xpc_type_s *)MEMORY[0x1E0C812C8])
  {
    sub_1AF267580(v1);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v2 != (const _xpc_type_s *)MEMORY[0x1E0C81310])
    {
      v4 = 0;
      goto LABEL_28;
    }
    v9 = objc_alloc(MEMORY[0x1E0CB3940]);
    v6 = (__CFString *)objc_msgSend(v9, "initWithFormat:", CFSTR("%s"), xpc_dictionary_get_string(v1, (const char *)*MEMORY[0x1E0C81270]));
  }
  v4 = v6;
LABEL_28:
  if (v4)
  {
    if (v2 == (const _xpc_type_s *)MEMORY[0x1E0C812F8] || v2 == (const _xpc_type_s *)MEMORY[0x1E0C812C8])
      v10 = v4;
    else
      v10 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@: %@"), v3, v4);
  }
  else
  {
    v10 = v3;
  }
  v11 = v10;

  return v11;
}

id sub_1AF267308(void *a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  NSObject *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "pluginUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5848]), "initWithUUID:error:", v2, &v14);
  v4 = v14;
  if (v3)
  {
    objc_msgSend(v3, "containingBundleRecord");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "managedPersonas");
    v6 = objc_claimAutoreleasedReturnValue();

    if (-[NSObject count](v6, "count"))
    {
      v7 = v6;
      pklog_handle_for_category(13);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(a1, "pluginUUID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "pluginIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "bundleVersion");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v16 = v9;
        v17 = 2112;
        v18 = v10;
        v19 = 2112;
        v20 = v11;
        v21 = 2112;
        v22 = v7;
        _os_log_impl(&dword_1AF254000, v8, OS_LOG_TYPE_INFO, "[u %{public}@] [%@(%@)] added persona strings: %@", buf, 0x2Au);

      }
    }
    else
    {
      v7 = 0;
    }
    v12 = -[NSObject copy](v7, "copy");
  }
  else
  {
    pklog_handle_for_category(3);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1AF276090((uint64_t)v2, (uint64_t)v4, v6);
    v7 = 0;
    v12 = 0;
  }

  return v12;
}

id sub_1AF2674FC(void *a1)
{
  id v1;
  void *v2;
  id v3;
  _QWORD applier[4];
  id v6;

  v1 = a1;
  v2 = (void *)objc_opt_new();
  applier[0] = MEMORY[0x1E0C809B0];
  applier[1] = 3221225472;
  applier[2] = sub_1AF267604;
  applier[3] = &unk_1E5F40D18;
  v3 = v2;
  v6 = v3;
  xpc_dictionary_apply(v1, applier);

  return v3;
}

id sub_1AF267580(void *a1)
{
  id v1;
  void *v2;
  id v3;
  _QWORD applier[4];
  id v6;

  v1 = a1;
  v2 = (void *)objc_opt_new();
  applier[0] = MEMORY[0x1E0C809B0];
  applier[1] = 3221225472;
  applier[2] = sub_1AF267674;
  applier[3] = &unk_1E5F40D40;
  v3 = v2;
  v6 = v3;
  xpc_array_apply(v1, applier);

  return v3;
}

uint64_t sub_1AF267604(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;

  sub_1AF266FBC(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);

  return 1;
}

uint64_t sub_1AF267674(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;

  sub_1AF266FBC(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v5, a2);

  return 1;
}

void sub_1AF2676C4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_1AF2676E8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

#error "1AF268154: call analysis failed (funcsize=106)"

void sub_1AF26815C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_1AF26847C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v15[0] = CFSTR("NSExtension");
  v15[1] = CFSTR("Shared");
  v9 = (void *)MEMORY[0x1E0C99D20];
  v10 = a2;
  objc_msgSend(v9, "arrayWithObjects:count:", v15, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqual:", v11);

  v13 = v8;
  if (v12)
  {
    objc_msgSend(*(id *)(a1 + 32), "mergeSharedResources:into:", v8, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

void sub_1AF2685C4()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = CFSTR("NSExtension");
  v6[1] = CFSTR("CleanTimeout");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = CFSTR("NSExtension");
  v5[1] = CFSTR("NSExtensionSandboxProfile");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithObjects:", v1, v2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_1ECDD7010;
  qword_1ECDD7010 = v3;

}

void sub_1AF268940()
{
  NSObject *v0;
  id v1;
  uint64_t v2;
  void *v3;
  NSObject *v4;
  size_t v5;
  uint8_t buf[4];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v5 = 37;
  if (sysctlbyname("kern.bootsessionuuid", &unk_1EEE37660, &v5, 0, 0) < 0)
  {
    pklog_handle_for_category(10);
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
      sub_1AF27637C(v0);

  }
  v1 = objc_alloc(MEMORY[0x1E0CB3940]);
  v2 = objc_msgSend(v1, "initWithBytesNoCopy:length:encoding:freeWhenDone:", &unk_1EEE37660, v5 - 1, 4, 0);
  v3 = (void *)qword_1EEE37688;
  qword_1EEE37688 = v2;

  pklog_handle_for_category(10);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v7 = qword_1EEE37688;
    _os_log_impl(&dword_1AF254000, v4, OS_LOG_TYPE_INFO, "Got boot session uuid: %@", buf, 0xCu);
  }

}

void sub_1AF26934C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF2695FC(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("NSExtensionFileProviderActionName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "localizedStringForKey:value:table:", v3, v3, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, v3);
  }
  else
  {
    pklog_handle_for_category(3);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_1AF27690C();
  }

}

void sub_1AF269A7C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x2Au);
}

void sub_1AF269A90(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x2Au);
}

uint64_t sub_1AF269AE0()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1AF269AEC()
{
  uint64_t v0;

  return v0;
}

void sub_1AF269D74(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  id *v4;
  uint64_t v5;

  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 96));
  objc_destroyWeak((id *)(v5 - 88));
  _Unwind_Resume(a1);
}

void sub_1AF269DBC(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  pklog_handle_for_category(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "uuid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "version");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_loadWeakRetained((id *)(a1 + 40));
    v8 = 138544130;
    v9 = v4;
    v10 = 2112;
    v11 = v5;
    v12 = 2112;
    v13 = v6;
    v14 = 1024;
    v15 = objc_msgSend(v7, "processIdentifier");
    _os_log_impl(&dword_1AF254000, v3, OS_LOG_TYPE_DEFAULT, "[u %{public}@] [%@(%@)] host connection from pid %d interrupted", (uint8_t *)&v8, 0x26u);

  }
}

void sub_1AF269EF0(id *a1)
{
  id *v2;
  id WeakRetained;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 5;
  WeakRetained = objc_loadWeakRetained(a1 + 5);
  pklog_handle_for_category(1);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "version");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_loadWeakRetained(a1 + 6);
    *(_DWORD *)buf = 138544130;
    v22 = v5;
    v23 = 2112;
    v24 = v6;
    v25 = 2112;
    v26 = v7;
    v27 = 1024;
    v28 = objc_msgSend(v8, "processIdentifier");
    _os_log_impl(&dword_1AF254000, v4, OS_LOG_TYPE_DEFAULT, "[u %{public}@] [%@(%@)] host connection from pid %d invalidated", buf, 0x26u);

  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(a1[4], "subsystems", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      if (v10 <= 1)
        v13 = 1;
      else
        v13 = v10;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v15 = objc_loadWeakRetained(v2);
          objc_msgSend(v14, "communicationsFailed:", v15);

        }
        ++v12;
      }
      while (v13 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

}

void sub_1AF26AC78(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    pklog_handle_for_category(7);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1AF276A74();

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sandboxExtensions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_1AF26BB5C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x2Au);
}

void sub_1AF26BBB8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

uint64_t sub_1AF26BBEC()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1AF26BBF8()
{
  uint64_t v0;

  return v0;
}

void sub_1AF26BD98(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD block[5];
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (objc_opt_class() && (objc_opt_respondsToSelector() & 1) == 0)
  {
    pklog_handle_for_category(5);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "uuid");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "version");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v12 = v3;
      v13 = 2112;
      v14 = v4;
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_1AF254000, v2, OS_LOG_TYPE_INFO, "[u %{public}@] [%@(%@)] invalidating checkin assertion", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 40), "external");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "runningboard");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "plugInHandshakeComplete");

  }
  objc_msgSend(*(id *)(a1 + 40), "timerQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1AF26BF88;
  block[3] = &unk_1E5F40678;
  block[4] = *(_QWORD *)(a1 + 40);
  dispatch_sync(v8, block);

  pklog_handle_for_category(7);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AF254000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ExtensionStartup", "", buf, 2u);
  }

}

void sub_1AF26BF88(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  objc_msgSend(*(id *)(a1 + 32), "firstHostRequestTimer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "firstHostRequestTimer");
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v3);

    objc_msgSend(*(id *)(a1 + 32), "setFirstHostRequestTimer:", 0);
  }
}

void sub_1AF26C428()
{
  Class v0;
  BOOL v1;
  PKService *v2;
  NSObject *v3;
  void *v5;
  uint8_t v6[16];

  v0 = NSClassFromString(CFSTR("EXPKService"));
  if (_os_feature_enabled_impl())
    v1 = v0 == 0;
  else
    v1 = 1;
  if (v1)
  {
    v2 = objc_alloc_init(PKService);
  }
  else
  {
    pklog_handle_for_category(7);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1AF254000, v3, OS_LOG_TYPE_DEFAULT, "Bootstrapping; Using EXPKService", v6, 2u);
    }

    -[objc_class defaultService](v0, "defaultService");
    v2 = (PKService *)objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)qword_1ECDD6FF8;
  qword_1ECDD6FF8 = (uint64_t)v2;

}

void sub_1AF26C66C(uint64_t a1)
{
  NSObject *v2;
  dispatch_source_t v3;
  NSObject *v4;
  dispatch_time_t v5;
  NSObject *v6;
  NSObject *v7;

  objc_msgSend(*(id *)(a1 + 32), "timerQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v2);
  objc_msgSend(*(id *)(a1 + 32), "setFirstHostRequestTimer:", v3);

  objc_msgSend(*(id *)(a1 + 32), "firstHostRequestTimer");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_source_set_event_handler(v4, &unk_1E5F40E70);

  v5 = dispatch_time(0, 2000000000);
  objc_msgSend(*(id *)(a1 + 32), "firstHostRequestTimer");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_source_set_timer(v6, v5, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);

  objc_msgSend(*(id *)(a1 + 32), "firstHostRequestTimer");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v7);

}

void sub_1AF26C74C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  pklog_handle_for_category(7);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    sub_1AF276EA4(v0, v1, v2, v3, v4, v5, v6, v7);

}

void sub_1AF26DE2C(uint64_t a1)
{
  void *v2;
  dispatch_time_t v3;
  NSObject *v4;
  NSObject *v5;
  dispatch_source_t v6;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *v9;
  _QWORD handler[5];

  objc_msgSend(*(id *)(a1 + 32), "terminationTimer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 40) * 1000000000.0));
    objc_msgSend(*(id *)(a1 + 32), "terminationTimer");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_source_set_timer(v4, v3, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "timerQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v5);
    objc_msgSend(*(id *)(a1 + 32), "setTerminationTimer:", v6);

    objc_msgSend(*(id *)(a1 + 32), "terminationTimer");
    v7 = objc_claimAutoreleasedReturnValue();
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = sub_1AF26DFA8;
    handler[3] = &unk_1E5F40678;
    handler[4] = *(_QWORD *)(a1 + 32);
    dispatch_source_set_event_handler(v7, handler);

    v8 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 40) * 1000000000.0));
    objc_msgSend(*(id *)(a1 + 32), "terminationTimer");
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_source_set_timer(v9, v8, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);

    objc_msgSend(*(id *)(a1 + 32), "terminationTimer");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_resume(v4);
  }

}

void sub_1AF26DFA8(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint8_t v5[16];

  pklog_handle_for_category(7);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1AF254000, v2, OS_LOG_TYPE_DEFAULT, "Exiting when clean", v5, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "external");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "xpc_transaction_exit_clean");

}

void sub_1AF26E0A0(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;

  objc_msgSend(*(id *)(a1 + 32), "external");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "xpc_transaction_interrupt_clean_exit");

  objc_msgSend(*(id *)(a1 + 32), "terminationTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "terminationTimer");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v5);

    objc_msgSend(*(id *)(a1 + 32), "setTerminationTimer:", 0);
  }
}

void sub_1AF26E284(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1AF26E294(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void sub_1AF26E444(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1AF26E45C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1AF26E46C(uint64_t a1)
{

}

void sub_1AF26E474(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void sub_1AF26E760(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (MEMORY[0x1AF45B2D8]() == MEMORY[0x1E0C81310])
  {
    xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x1E0C81270]);
    pklog_handle_for_category(1);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_1AF2773E8(a1);

  }
}

void sub_1AF26F2B4(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  _QWORD *v5;
  BOOL v6;
  NSObject *v7;
  uint64_t uint64;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (v3 != (id)MEMORY[0x1E0C81258] || (*(_BYTE *)(a1 + 56) ? (v6 = WeakRetained == 0) : (v6 = 1), v6))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    pklog_handle_for_category(1);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1AF277528();

    uint64 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 32), "flags");
    xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "flags", uint64 & 0xFFFFFFFFFFFF7FFFLL);
    objc_initWeak(&location, v5);
    v10 = v5[3];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1AF257324;
    v11[3] = &unk_1E5F40F28;
    objc_copyWeak(&v14, &location);
    v12 = *(id *)(a1 + 32);
    v13 = *(id *)(a1 + 40);
    dispatch_async(v10, v11);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

}

void sub_1AF26F540(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 *v9;
  unsigned __int8 uuid[8];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  *(_QWORD *)uuid = 0;
  v11 = 0;
  objc_msgSend(v3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getUUIDBytes:", uuid);

  xpc_array_set_uuid(*(xpc_object_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL, uuid);
  v5 = *(void **)(a1 + 40);
  objc_msgSend(v3, "path");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xpc_array_set_string(v5, 0xFFFFFFFFFFFFFFFFLL, (const char *)objc_msgSend(v6, "UTF8String"));

  objc_msgSend(v3, "multipleInstanceUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v3, "multipleInstanceUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = uuid;
    objc_msgSend(v8, "getUUIDBytes:", uuid);

  }
  else
  {
    v9 = (unsigned __int8 *)&unk_1AF27B1C8;
  }
  xpc_array_set_uuid(*(xpc_object_t *)(a1 + 48), 0xFFFFFFFFFFFFFFFFLL, v9);

}

void sub_1AF26F824(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_1AF26F838(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1AF26F848(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void sub_1AF26FE14(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_1AF2704DC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t sub_1AF2704F0(void *a1, const char *a2)
{
  return objc_msgSend(a1, "handle");
}

uint64_t sub_1AF2707B4()
{
  return 1;
}

void sub_1AF270E60()
{
  id v0;
  void *v1;

  v0 = -[PKManager initForService:]([PKManager alloc], "initForService:", 0);
  v1 = (void *)qword_1ECDD6FC8;
  qword_1ECDD6FC8 = (uint64_t)v0;

}

void sub_1AF270F58()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)qword_1EEE37638;
  qword_1EEE37638 = (uint64_t)v0;

  dword_1EEE37640 = 0;
}

void sub_1AF27138C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, id a18)
{
  objc_destroyWeak(&location);
  objc_destroyWeak(&a18);
  _Unwind_Resume(a1);
}

void sub_1AF2713D0(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (id *)(a1 + 48);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "errorInReply:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  pklog_handle_for_category(12);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 32), "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 134218498;
    v11 = v8;
    v12 = 2112;
    v13 = v9;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_1AF254000, v7, OS_LOG_TYPE_DEFAULT, "<PKManager:%p> register plugin at [%@] completed, error = %@", (uint8_t *)&v10, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_1AF27170C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, id a18)
{
  objc_destroyWeak(&location);
  objc_destroyWeak(&a18);
  _Unwind_Resume(a1);
}

void sub_1AF271750(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (id *)(a1 + 48);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "errorInReply:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  pklog_handle_for_category(12);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 32), "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 134218498;
    v11 = v8;
    v12 = 2112;
    v13 = v9;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_1AF254000, v7, OS_LOG_TYPE_DEFAULT, "<PKManager:%p> unregister plugin at [%@] completed, error = %@", (uint8_t *)&v10, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_1AF271D1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;
  uint64_t v22;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v22 - 144));
  _Unwind_Resume(a1);
}

void sub_1AF271D58(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (id *)(a1 + 48);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "errorInReply:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  pklog_handle_for_category(12);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 32), "bundlePath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 134218498;
    v11 = v8;
    v12 = 2112;
    v13 = v9;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_1AF254000, v7, OS_LOG_TYPE_DEFAULT, "<PKManager:%p> register plugins in bundle at [%@] completed, error = %@", (uint8_t *)&v10, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_1AF27224C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;
  id *v19;
  uint64_t v20;

  objc_destroyWeak(v19);
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v20 - 128));
  _Unwind_Resume(a1);
}

void sub_1AF272288(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (id *)(a1 + 48);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "errorInReply:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  pklog_handle_for_category(12);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 32), "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 134218498;
    v11 = v8;
    v12 = 2112;
    v13 = v9;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_1AF254000, v7, OS_LOG_TYPE_DEFAULT, "<PKManager:%p> unregister plugins in bundle at [%@] completed, error = %@", (uint8_t *)&v10, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_1AF272914(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1AF272938(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1AF272948(uint64_t a1)
{

}

void sub_1AF272950(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void sub_1AF272B04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1AF272B28(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void sub_1AF272CD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1AF272CF8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void sub_1AF272ED4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1AF272EF8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void sub_1AF2730AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1AF2730D0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void sub_1AF273474(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AF2734A8(_QWORD *a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  const uint8_t *uuid;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = (id *)(a1 + 7);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "errorInReply:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    xpc_dictionary_get_value(v4, "conflicts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = (void *)_CFXPCCreateCFObjectFromXPCObject();
      objc_msgSend(v6, "userInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v9, "mutableCopy");

      objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, CFSTR("busyPlugInUUIDs"));
      v11 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v6, "domain");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, objc_msgSend(v6, "code"), v10);
      v13 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v13;
    }
    pklog_handle_for_category(11);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1AF277A28();

    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    uuid = xpc_dictionary_get_uuid(v4, "uuids");

    if (uuid)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", uuid);
      pklog_handle_for_category(11);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = a1[4];
        v18 = a1[5];
        v19 = a1[8];
        v22 = 134218754;
        v23 = v17;
        v24 = 2112;
        v25 = v18;
        v26 = 2048;
        v27 = v19;
        v28 = 2114;
        v29 = v6;
        _os_log_impl(&dword_1AF254000, v16, OS_LOG_TYPE_DEFAULT, "<PKManager:%p> hold request for [%@] with flags: 0x%llx completed with hold token: [%{public}@]", (uint8_t *)&v22, 0x2Au);
      }

      (*(void (**)(_QWORD, void *, _QWORD))(a1[6] + 16))(a1[6], v6, 0);
    }
    else
    {
      pklog_handle_for_category(11);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
        sub_1AF2779AC();

      v21 = a1[6];
      pkError(4, CFSTR("missing hold UUID in apparently successful hold request"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v21 + 16))(v21, 0, v6);
    }
  }

}

void sub_1AF2738A8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1AF2738CC(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (id *)(a1 + 48);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "errorInReply:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  pklog_handle_for_category(11);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1AF277AB4();
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v11 = 134218242;
    v12 = v9;
    v13 = 2114;
    v14 = v10;
    _os_log_impl(&dword_1AF254000, v8, OS_LOG_TYPE_DEFAULT, "<PKManager:%p> released hold [%{public}@]", (uint8_t *)&v11, 0x16u);
  }

}

void sub_1AF273B4C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1AF273B70(_QWORD *a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (id *)(a1 + 7);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "errorInReply:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  pklog_handle_for_category(11);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1AF277B08();
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = a1[4];
    v10 = a1[5];
    v11 = 134218242;
    v12 = v9;
    v13 = 2114;
    v14 = v10;
    _os_log_impl(&dword_1AF254000, v8, OS_LOG_TYPE_DEFAULT, "<PKManager:%p> released hold [%{public}@]", (uint8_t *)&v11, 0x16u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

void sub_1AF273E50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  id *v18;
  uint64_t v19;

  objc_destroyWeak(v18);
  _Block_object_dispose(&a18, 8);
  objc_destroyWeak((id *)(v19 - 56));
  _Unwind_Resume(a1);
}

void sub_1AF273E80(_QWORD *a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (id *)(a1 + 7);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "errorInReply:", v4);
  v6 = objc_claimAutoreleasedReturnValue();

  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
  pklog_handle_for_category(11);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1AF277B5C((uint64_t)a1, (uint64_t)(a1 + 6), v11);
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = a1[4];
    v13 = a1[5];
    v14 = 134218242;
    v15 = v12;
    v16 = 2114;
    v17 = v13;
    _os_log_impl(&dword_1AF254000, v11, OS_LOG_TYPE_DEFAULT, "<PKManager:%p> released hold [%{public}@]", (uint8_t *)&v14, 0x16u);
  }

}

void sub_1AF274150(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AF27417C(_QWORD *a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (id *)(a1 + 7);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "errorInReply:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  pklog_handle_for_category(10);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = a1[4];
    v9 = a1[5];
    v10 = 134218498;
    v11 = v8;
    v12 = 2112;
    v13 = v6;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_1AF254000, v7, OS_LOG_TYPE_DEFAULT, "<PKManager:%p> bulk update extension states completed with error: %@ for %@", (uint8_t *)&v10, 0x20u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

void sub_1AF2742C8(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void sub_1AF2742FC(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

uint64_t sub_1AF274354()
{
  return NSRequestConcreteImplementation();
}

void sub_1AF2744A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;

  sub_1AF2621C8();
  a23 = v29;
  a24 = v30;
  sub_1AF262320();
  a16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v31, "uuid");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sub_1AF2623D8(), "multipleInstanceUUID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sub_1AF2623CC(), "identifier");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sub_1AF2623C0(), "version");
  objc_claimAutoreleasedReturnValue();
  sub_1AF262118();
  _os_log_fault_impl(&dword_1AF254000, v25, OS_LOG_TYPE_FAULT, "[u %{public}@:m %{public}@] [%@(%@)] beginUsing called with system or unspecific persona when using an extension that uses the host's persona", &a9, 0x2Au);

  sub_1AF262104();
}

void sub_1AF274558(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  NSObject *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;

  sub_1AF2621C8();
  a23 = v26;
  a24 = v27;
  sub_1AF262344();
  a16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v28, "uuid");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "multipleInstanceUUID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "identifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "version");
  objc_claimAutoreleasedReturnValue();
  sub_1AF262290();
  sub_1AF2623E4(&dword_1AF254000, v24, v32, "[u %{public}@:m %{public}@] [%@(%@)] Failed to encode subsystem options: %@.", &a9);

  sub_1AF262104();
}

void sub_1AF27460C(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_1AF254000, a2, OS_LOG_TYPE_FAULT, "Failed to encode subsystem options: %@.", (uint8_t *)&v2, 0xCu);
}

void sub_1AF274680(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;

  sub_1AF2621C8();
  a23 = v24;
  a24 = v25;
  v27 = v26;
  v29 = v28;
  a16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v28, "uuid");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "multipleInstanceUUID");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "identifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "version");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "requests");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "count");
  sub_1AF2622F8();
  a12 = v32;
  sub_1AF2623A8();
  sub_1AF26232C(&dword_1AF254000, v27, v35, "[u %{public}@:m %{public}@] [%@(%@)] %lu current requests", &a9);

  sub_1AF262104();
}

void sub_1AF27475C()
{
  __assert_rtn("-[PKHostPlugIn startPlugInRequest:synchronously:subsystemOptions:completion:]_block_invoke", "PKHostPlugIn.m", 441, "self.isData || self.plugInPrincipal");
}

#error "1AF2747F8: call analysis failed (funcsize=41)"

#error "1AF2748A4: call analysis failed (funcsize=41)"

#error "1AF274950: call analysis failed (funcsize=41)"

void sub_1AF274988(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AF254000, log, OS_LOG_TYPE_ERROR, "Could not report plugin ready to client because the id<PKPlugIn> object went away!", v1, 2u);
}

void sub_1AF2749C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;

  sub_1AF2621C8();
  a23 = v29;
  a24 = v30;
  sub_1AF262320();
  a16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v31, "uuid");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sub_1AF2623D8(), "multipleInstanceUUID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sub_1AF2623CC(), "identifier");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sub_1AF2623C0(), "version");
  objc_claimAutoreleasedReturnValue();
  sub_1AF262118();
  sub_1AF262378(&dword_1AF254000, v25, v32, "[u %{public}@:m %{public}@] [%@(%@)] resuming startQueue", &a9);

  sub_1AF262104();
}

#error "1AF274AD8: call analysis failed (funcsize=38)"

void sub_1AF274B14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  sub_1AF2621C8();
  a23 = v29;
  a24 = v30;
  sub_1AF262338();
  objc_msgSend((id)sub_1AF2622D0(v31), "uuid");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sub_1AF262360(), "multipleInstanceUUID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sub_1AF26236C(), "identifier");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sub_1AF262354(), "version");
  objc_claimAutoreleasedReturnValue();
  sub_1AF262150();
  sub_1AF2621F0(&dword_1AF254000, v26, v32, "[u %{public}@:m %{public}@] [%@(%@)] Extension process exited while/after acquiring startup assertion", &a9);

  sub_1AF262104();
}

void sub_1AF274BC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  sub_1AF2621C8();
  a23 = v29;
  a24 = v30;
  sub_1AF262338();
  objc_msgSend((id)sub_1AF2622D0(v31), "uuid");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sub_1AF262360(), "multipleInstanceUUID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sub_1AF26236C(), "identifier");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sub_1AF262354(), "version");
  objc_claimAutoreleasedReturnValue();
  sub_1AF262150();
  sub_1AF2621F0(&dword_1AF254000, v26, v32, "[u %{public}@:m %{public}@] [%@(%@)] Extension process exited prematurely", &a9);

  sub_1AF262104();
}

#error "1AF274CD4: call analysis failed (funcsize=38)"

#error "1AF274DB4: call analysis failed (funcsize=52)"

void sub_1AF274DF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  sub_1AF2621C8();
  a23 = v29;
  a24 = v30;
  sub_1AF262338();
  objc_msgSend((id)sub_1AF2622D0(v31), "uuid");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sub_1AF262360(), "multipleInstanceUUID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sub_1AF26236C(), "identifier");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sub_1AF262354(), "version");
  objc_claimAutoreleasedReturnValue();
  sub_1AF262150();
  sub_1AF262378(&dword_1AF254000, v26, v32, "[u %{public}@:m %{public}@] [%@(%@)] Extension process is running", &a9);

  sub_1AF262104();
}

void sub_1AF274E9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  sub_1AF2621C8();
  a23 = v29;
  a24 = v30;
  sub_1AF262338();
  objc_msgSend((id)sub_1AF2622D0(v31), "uuid");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sub_1AF262360(), "multipleInstanceUUID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sub_1AF26236C(), "identifier");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sub_1AF262354(), "version");
  objc_claimAutoreleasedReturnValue();
  sub_1AF262150();
  sub_1AF2621F0(&dword_1AF254000, v26, v32, "[u %{public}@:m %{public}@] [%@(%@)] Extension process is not running, exited prematurely", &a9);

  sub_1AF262104();
}

void sub_1AF274F48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  sub_1AF2621C8();
  a23 = v29;
  a24 = v30;
  sub_1AF262338();
  objc_msgSend((id)sub_1AF2622D0(v31), "uuid");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sub_1AF262360(), "multipleInstanceUUID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sub_1AF26236C(), "identifier");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sub_1AF262354(), "version");
  objc_claimAutoreleasedReturnValue();
  sub_1AF262150();
  sub_1AF2621F0(&dword_1AF254000, v26, v32, "[u %{public}@:m %{public}@] [%@(%@)] No extension state returned, extension process exited prematurely", &a9);

  sub_1AF262104();
}

void sub_1AF274FF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  sub_1AF2621C8();
  a23 = v29;
  a24 = v30;
  sub_1AF262338();
  objc_msgSend((id)sub_1AF2622D0(v31), "uuid");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sub_1AF262360(), "multipleInstanceUUID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sub_1AF26236C(), "identifier");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sub_1AF262354(), "version");
  objc_claimAutoreleasedReturnValue();
  sub_1AF262150();
  sub_1AF2621F0(&dword_1AF254000, v26, v32, "[u %{public}@:m %{public}@] [%@(%@)] could not acquire startup assertion", &a9);

  sub_1AF262104();
}

void sub_1AF2750A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  sub_1AF2621C8();
  a23 = v29;
  a24 = v30;
  sub_1AF2622E8();
  a16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(v28 + 32), "uuid");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sub_1AF262390(), "multipleInstanceUUID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sub_1AF26239C(), "identifier");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sub_1AF262384(), "version");
  objc_claimAutoreleasedReturnValue();
  sub_1AF262188();
  sub_1AF2623E4(&dword_1AF254000, v26, v31, "[u %{public}@:m %{public}@] [%@(%@)] %@ plugin object used for launch; launched plugin UUID differs from the UUID in"
    " the plugin object used for the request (most likely due to path-based fallback)",
    &a9);

  sub_1AF262104();
}

void sub_1AF275150(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  sub_1AF2621C8();
  a23 = v29;
  a24 = v30;
  sub_1AF2622E8();
  a16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(v28 + 32), "uuid");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sub_1AF262390(), "multipleInstanceUUID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sub_1AF26239C(), "identifier");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sub_1AF262384(), "version");
  objc_claimAutoreleasedReturnValue();
  sub_1AF262188();
  sub_1AF26232C(&dword_1AF254000, v26, v31, "[u %{public}@:m %{public}@] [%@(%@)] stale plugin object used for launch, but launched plugin found in discovery map: %@", &a9);

  sub_1AF262104();
}

#error "1AF27526C: call analysis failed (funcsize=39)"

#error "1AF275320: call analysis failed (funcsize=42)"

void sub_1AF275358(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  NSObject *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;

  sub_1AF2621C8();
  a23 = v26;
  a24 = v27;
  sub_1AF262344();
  a16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v28, "uuid");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "multipleInstanceUUID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "identifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "version");
  objc_claimAutoreleasedReturnValue();
  sub_1AF262250();
  sub_1AF2622DC(&dword_1AF254000, v24, v32, "[u %{public}@:m %{public}@] [%@(%@)] Hub connection error: %{public}@", &a9);

  sub_1AF262104();
}

#error "1AF275474: call analysis failed (funcsize=38)"

void sub_1AF2754AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;

  sub_1AF2621C8();
  a23 = v29;
  a24 = v30;
  sub_1AF262320();
  a16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v31, "uuid");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sub_1AF2623D8(), "multipleInstanceUUID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sub_1AF2623CC(), "identifier");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sub_1AF2623C0(), "version");
  objc_claimAutoreleasedReturnValue();
  sub_1AF262118();
  sub_1AF262378(&dword_1AF254000, v25, v32, "[u %{public}@:m %{public}@] [%@(%@)] invalidated", &a9);

  sub_1AF262104();
}

#error "1AF275614: call analysis failed (funcsize=60)"

void sub_1AF275650(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  NSObject *v24;
  id *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;

  sub_1AF2621C8();
  a23 = v26;
  a24 = v27;
  sub_1AF262344();
  objc_msgSend((id)sub_1AF2622D0(v28), "uuid");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v25, "multipleInstanceUUID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v25, "identifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v25, "version");
  objc_claimAutoreleasedReturnValue();
  sub_1AF262250();
  sub_1AF2622DC(&dword_1AF254000, v24, v32, "[u %{public}@:m %{public}@] [%@(%@)] Failed to start plugin; could not augment primary interface: %{public}@",
    &a9);

  sub_1AF262104();
}

#error "1AF27577C: call analysis failed (funcsize=42)"

void sub_1AF2757B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  NSObject *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;

  sub_1AF2621C8();
  a23 = v26;
  a24 = v27;
  sub_1AF262344();
  a16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v28, "uuid");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "multipleInstanceUUID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "identifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "version");
  objc_claimAutoreleasedReturnValue();
  sub_1AF262290();
  sub_1AF26232C(&dword_1AF254000, v24, v32, "[u %{public}@:m %{public}@] [%@(%@)] useBundle: [%@]", &a9);

  sub_1AF262104();
}

void sub_1AF275868(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  id *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;

  sub_1AF2621C8();
  a23 = v29;
  a24 = v30;
  sub_1AF262338();
  objc_msgSend((id)sub_1AF2622D0(v31), "uuid");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sub_1AF262360(), "multipleInstanceUUID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sub_1AF26236C(), "identifier");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sub_1AF262354(), "version");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v28, "requests");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "count");
  sub_1AF2622F8();
  a12 = v27;
  sub_1AF2623A8();
  sub_1AF26232C(&dword_1AF254000, v26, v34, "[u %{public}@:m %{public}@] [%@(%@)] %lu current requests", &a9);

  sub_1AF262104();
}

void sub_1AF275934(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_1AF254000, a3, OS_LOG_TYPE_ERROR, "unable to terminate plugin at %@: %@", (uint8_t *)&v6, 0x16u);

}

void sub_1AF2759E0()
{
  __assert_rtn("-[PKHostPlugIn unwind:force:]", "PKHostPlugIn.m", 1055, "force || self.useCount > 0");
}

void sub_1AF275A08(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1AF254000, log, OS_LOG_TYPE_ERROR, "could not create extension point record for %@: %@", (uint8_t *)&v3, 0x16u);
}

void sub_1AF275A8C(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_1AF254000, a2, OS_LOG_TYPE_ERROR, "Unexpected class for extension point record: %@", (uint8_t *)&v5, 0xCu);

}

void sub_1AF275B24(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a2 + 40);
  v4 = 134218242;
  v5 = a1;
  v6 = 2112;
  v7 = v3;
  _os_log_error_impl(&dword_1AF254000, log, OS_LOG_TYPE_ERROR, "<PKDiscoveryDriver:%p> error: %@", (uint8_t *)&v4, 0x16u);
}

void sub_1AF275BAC()
{
  uint64_t v0;
  os_log_t v1;

  sub_1AF265774(*MEMORY[0x1E0C80C00]);
  sub_1AF2657B0(&dword_1AF254000, v0, v1, "[d %@] <PKHost:%p> Failed discovery: PKDiscoverContinuous and PKDiscoverSynchronous incompatible.");
}

void sub_1AF275C04()
{
  uint64_t v0;
  os_log_t v1;

  sub_1AF265774(*MEMORY[0x1E0C80C00]);
  sub_1AF2657B0(&dword_1AF254000, v0, v1, "[d %@] <PKHost:%p> Failed discovery: cannot request embedded plug-ins without using the \"UsesEmbeddedCode\" key.");
}

void sub_1AF275C5C(uint64_t a1, NSObject *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)a1 + 8) + 40), "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sub_1AF2657A0(), "multipleInstanceUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sub_1AF2657A0(), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sub_1AF2657A0(), "version");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138544386;
  v8 = v3;
  v9 = 2114;
  v10 = v4;
  v11 = 2112;
  v12 = v5;
  v13 = 2112;
  v14 = v6;
  v15 = 2048;
  v16 = objc_msgSend((id)sub_1AF2657A0(), "state");
  _os_log_error_impl(&dword_1AF254000, a2, OS_LOG_TYPE_ERROR, "[u %{public}@:m %{public}@] [%@(%@)] purging stale active plugin from state: %lu", (uint8_t *)&v7, 0x34u);

}

void sub_1AF275DE8(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1AF254000, log, OS_LOG_TYPE_FAULT, "Attempt to call back to client with nil completion block.", v1, 2u);
}

void sub_1AF275E28(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "path");
  v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v1, "UTF8String");
  sub_1AF2676FC();
  sub_1AF2676E8(&dword_1AF254000, v2, v3, "issued file extension for [%s]", v4, v5, v6, v7, v8);

  sub_1AF267718();
}

void sub_1AF275EA0(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
  sub_1AF2676FC();
  sub_1AF2676E8(&dword_1AF254000, v1, v2, "issued mach extension for [%s]", v3, v4, v5, v6, v7);
  sub_1AF267718();
}

void sub_1AF275F08()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1AF2676D4();
  sub_1AF2676C4(&dword_1AF254000, v0, v1, "could not post notification: %d", v2, v3, v4, v5, v6);
  sub_1AF267710();
}

void sub_1AF275F5C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1AF2676D4();
  sub_1AF2676C4(&dword_1AF254000, v0, v1, "could not register for notification: %d", v2, v3, v4, v5, v6);
  sub_1AF267710();
}

void sub_1AF275FB0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1AF2676D4();
  sub_1AF2676C4(&dword_1AF254000, v0, v1, "could not cancel notification: %d", v2, v3, v4, v5, v6);
  sub_1AF267710();
}

void sub_1AF276004(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1AF254000, a2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v2, 0xCu);
}

void sub_1AF276078()
{
  _os_crash();
  __break(1u);
}

void sub_1AF276090(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1AF254000, log, OS_LOG_TYPE_ERROR, "unable to get LSApplicationExtensionRecord for %@: %@", (uint8_t *)&v3, 0x16u);
}

void sub_1AF276114()
{
  __assert_rtn("-[PKPlugInCore isEqual:]", "PKPlugInCore.m", 106, "self.uuid");
}

void sub_1AF27613C()
{
  __assert_rtn("-[PKPlugInCore hash]", "PKPlugInCore.m", 112, "self.uuid");
}

void sub_1AF276164(uint64_t a1, void *a2)
{
  void *v2;
  os_log_t v3;
  os_log_type_t v4;
  const char *v5;
  uint8_t *v6;
  void *v7;

  objc_msgSend(a2, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1AF269A6C();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0x16u);

}

void sub_1AF27620C(uint64_t a1, int a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 1024;
  v6 = a2;
  _os_log_error_impl(&dword_1AF254000, log, OS_LOG_TYPE_ERROR, "plugin sdk [%{public}@] not registered for platform %u", (uint8_t *)&v3, 0x12u);
}

void sub_1AF276290(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, __int128 a10, void *a11, __int128 a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_class *v31;
  void *v32;
  __int16 v33;
  uint64_t v34;

  sub_1AF269AA4();
  a21 = v22;
  a22 = v23;
  v25 = v24;
  v27 = v26;
  a14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v26, "uuid");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "identifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "version");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (objc_class *)objc_opt_class();
  NSStringFromClass(v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1AF269AC8();
  *(_QWORD *)((char *)&a10 + 6) = v29;
  HIWORD(a10) = v33;
  a11 = v30;
  LOWORD(a12) = 2114;
  *(_QWORD *)((char *)&a12 + 2) = v34;
  _os_log_error_impl(&dword_1AF254000, v25, OS_LOG_TYPE_ERROR, "[u %{public}@] [%@(%@)] invalid NSExtensionPointIdentifier: [%{public}@]", &a9, 0x2Au);

  sub_1AF2699E8();
}

void sub_1AF27637C(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AF254000, log, OS_LOG_TYPE_ERROR, "could not get kern.bootsessionuuid", v1, 2u);
}

void sub_1AF2763BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, __int128 a10, void *a11, __int128 a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  __int16 v34;
  uint64_t v35;

  sub_1AF269AA4();
  a21 = v22;
  a22 = v23;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  a14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v28, "uuid");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "identifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "version");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("annotations"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1AF269AC8();
  *(_QWORD *)((char *)&a10 + 6) = v31;
  HIWORD(a10) = v34;
  a11 = v32;
  LOWORD(a12) = 2080;
  *(_QWORD *)((char *)&a12 + 2) = "-[PKPlugInCore updateFromForm:]";
  WORD5(a12) = v34;
  *(_QWORD *)((char *)&a12 + 12) = v35;
  _os_log_debug_impl(&dword_1AF254000, v25, OS_LOG_TYPE_DEBUG, "[u %{public}@] [%@(%@)] %s got annotation from form: %@", &a9, 0x34u);

  sub_1AF2699E8();
}

void sub_1AF2764BC()
{
  objc_class *v0;
  void *v1;
  os_log_t v2;
  os_log_type_t v3;
  const char *v4;
  uint8_t *v5;
  void *v6;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1AF269A6C();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0xCu);

}

#error "1AF2765A8: call analysis failed (funcsize=34)"

#error "1AF276638: call analysis failed (funcsize=34)"

void sub_1AF27666C(void *a1)
{
  void *v2;
  void *v3;
  void *v4;
  os_log_t v5;
  os_log_type_t v6;
  const char *v7;
  uint8_t *v8;

  objc_msgSend(a1, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "version");
  objc_claimAutoreleasedReturnValue();
  sub_1AF269A30();
  sub_1AF269A6C();
  _os_log_error_impl(v4, v5, v6, v7, v8, 0x20u);

  sub_1AF269AB8();
}

#error "1AF27679C: call analysis failed (funcsize=45)"

#error "1AF27682C: call analysis failed (funcsize=34)"

void sub_1AF276860(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  uint8_t v6[40];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "version");
  objc_claimAutoreleasedReturnValue();
  sub_1AF269A30();
  _os_log_debug_impl(&dword_1AF254000, a2, OS_LOG_TYPE_DEBUG, "[u %{public}@] [%@(%@)] no actions found in pkdict", v6, 0x20u);

  sub_1AF269AB8();
}

void sub_1AF27690C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  os_log_t v5;
  os_log_type_t v6;
  const char *v7;
  uint8_t *v8;
  void *v9;

  sub_1AF269AA4();
  sub_1AF269A5C();
  objc_msgSend(*(id *)(v1 + 48), "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v0 + 48), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v0 + 48), "version");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1AF269A6C();
  _os_log_error_impl(v4, v5, v6, v7, v8, 0x2Au);

  sub_1AF2699E8();
}

void sub_1AF2769E0()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_1AF26BBCC();
  objc_msgSend(v3, "uuid");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sub_1AF26BBF8(), "identifier");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sub_1AF26BBEC(), "version");
  objc_claimAutoreleasedReturnValue();
  sub_1AF26BAF8();
  sub_1AF26BB5C(&dword_1AF254000, v4, v5, "[u %{public}@] [%@(%@)] failed to construct service personality: %{public}@", v6, v7, v8, v9, v10);

  sub_1AF26BB70();
}

void sub_1AF276A74()
{
  id *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_1AF26BBCC();
  objc_msgSend(*(id *)(v1 + 32), "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0[4], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0[4], "version");
  objc_claimAutoreleasedReturnValue();
  sub_1AF26BB84();
  sub_1AF26BB5C(&dword_1AF254000, v4, v5, "[u %{public}@] [%@(%@)] failed to prepare plug-in, unable to tell legacy client: %@", v6, v7, v8, v9, v10);

  sub_1AF26BB70();
}

void sub_1AF276B14(void *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend(a1, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "version");
  objc_claimAutoreleasedReturnValue();
  sub_1AF26BB30();
  sub_1AF26BBB8(&dword_1AF254000, v4, v5, "[u %{public}@] [%@(%@)] unable to create service principal", v6, v7, v8, v9, v10);

  sub_1AF26BBDC();
}

void sub_1AF276BB0()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_1AF26BBCC();
  objc_msgSend(v3, "uuid");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sub_1AF26BBF8(), "identifier");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sub_1AF26BBEC(), "version");
  objc_claimAutoreleasedReturnValue();
  sub_1AF26BB84();
  sub_1AF26BB5C(&dword_1AF254000, v4, v5, "[u %{public}@] [%@(%@)] augmentInterface failed: %@", v6, v7, v8, v9, v10);

  sub_1AF26BB70();
}

void sub_1AF276C44(void *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend(a1, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "version");
  objc_claimAutoreleasedReturnValue();
  sub_1AF26BB30();
  sub_1AF26BBB8(&dword_1AF254000, v4, v5, "[u %{public}@] [%@(%@)] missing protocol specification in Info.plist", v6, v7, v8, v9, v10);

  sub_1AF26BBDC();
}

void sub_1AF276CE0(void *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend(a1, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "version");
  objc_claimAutoreleasedReturnValue();
  sub_1AF26BB30();
  sub_1AF26BBB8(&dword_1AF254000, v4, v5, "[u %{public}@] [%@(%@)] principal class not specified in Info.plist", v6, v7, v8, v9, v10);

  sub_1AF26BBDC();
}

void sub_1AF276D7C()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_1AF26BBCC();
  objc_msgSend(v3, "uuid");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sub_1AF26BBF8(), "identifier");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sub_1AF26BBEC(), "version");
  objc_claimAutoreleasedReturnValue();
  sub_1AF26BAF8();
  sub_1AF26BB5C(&dword_1AF254000, v4, v5, "[u %{public}@] [%@(%@)] principal class \"%{public}@\" not found", v6, v7, v8, v9, v10);

  sub_1AF26BB70();
}

void sub_1AF276E10()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_1AF26BBCC();
  objc_msgSend(v3, "uuid");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sub_1AF26BBF8(), "identifier");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sub_1AF26BBEC(), "version");
  objc_claimAutoreleasedReturnValue();
  sub_1AF26BAF8();
  sub_1AF26BB5C(&dword_1AF254000, v4, v5, "[u %{public}@] [%@(%@)] principal class \"%{public}@\" failed to instantiate", v6, v7, v8, v9, v10);

  sub_1AF26BB70();
}

void sub_1AF276EA4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1AF26E284(&dword_1AF254000, a1, a3, "WARNING: Did not receive handshake message from the host after waiting ~%0.0f seconds. THIS MAY BE A SPURIOUS LAUNCH OF THE PLUGIN due to a message to an XPC endpoint other than the main service endpoint, or the CPU is highly contended and this extension or its host is not getting enough CPU time.", a5, a6, a7, a8, 0);
  sub_1AF26E2AC();
}

void sub_1AF276F10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1AF26E294(*MEMORY[0x1E0C80C00]);
  sub_1AF26E284(&dword_1AF254000, v0, v1, "Bootstrapping; unable to instantiate service delegate class %{public}@",
    v2,
    v3,
    v4,
    v5,
    v6);
  sub_1AF26E2AC();
}

void sub_1AF276F64()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1AF26E294(*MEMORY[0x1E0C80C00]);
  sub_1AF26E284(&dword_1AF254000, v0, v1, "Bootstrapping; service delegate class %{public}@ does not conform to PKServiceDelegate",
    v2,
    v3,
    v4,
    v5,
    v6);
  sub_1AF26E2AC();
}

void sub_1AF276FB8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1AF26E294(*MEMORY[0x1E0C80C00]);
  sub_1AF26E284(&dword_1AF254000, v0, v1, "Bootstrapping; PlugInKit listener %{public}@ unexpected (rejecting)",
    v2,
    v3,
    v4,
    v5,
    v6);
  sub_1AF26E2AC();
}

void sub_1AF27700C(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1AF254000, log, OS_LOG_TYPE_FAULT, "Bootstrapping; Error: Unexpected class for bootstrap for key 'SUBSYSTEM_OPTIONS'. This value must be an NSDictionary.",
    v1,
    2u);
}

void sub_1AF27704C()
{
  os_log_t v0;
  uint8_t v1[24];

  sub_1AF26E294(*MEMORY[0x1E0C80C00]);
  _os_log_fault_impl(&dword_1AF254000, v0, OS_LOG_TYPE_FAULT, "Bootstrapping; misconfigured plugin; external subsystem [%{public}@] not present; possible missing linkage",
    v1,
    0xCu);
  sub_1AF26E2AC();
}

void sub_1AF2770AC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1AF26E294(*MEMORY[0x1E0C80C00]);
  sub_1AF26E284(&dword_1AF254000, v0, v1, "Bootstrapping; external subsystem %{public}@ refused setup",
    v2,
    v3,
    v4,
    v5,
    v6);
  sub_1AF26E2AC();
}

void sub_1AF277100()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1AF26E294(*MEMORY[0x1E0C80C00]);
  sub_1AF26E284(&dword_1AF254000, v0, v1, "Bootstrapping; external subsystem initializer %{public}@ does not conform to PKModularService",
    v2,
    v3,
    v4,
    v5,
    v6);
  sub_1AF26E2AC();
}

void sub_1AF277154(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1AF26E284(&dword_1AF254000, a1, a3, "%s unsupported", a5, a6, a7, a8, 2u);
  sub_1AF26E2AC();
}

void sub_1AF2771C4(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "personalities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1AF26E2B4();
  _os_log_error_impl(&dword_1AF254000, a2, OS_LOG_TYPE_ERROR, "WARNING! Sole personality requested when nil; THIS MAY BE A SPURIOUS LAUNCH OF THE PLUGIN due to a message to an XPC"
    " endpoint other than the main service endpoint; personalities: %@",
    v4,
    0xCu);

}

void sub_1AF27724C(void *a1, void *a2, NSObject *a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "version");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "personalities");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 138544130;
  v11 = v6;
  v12 = 2112;
  v13 = v7;
  v14 = 2112;
  v15 = v8;
  v16 = 2112;
  v17 = v9;
  _os_log_error_impl(&dword_1AF254000, a3, OS_LOG_TYPE_ERROR, "[u %{public}@] [%@(%@)] WARNING! Sole personality is ambiguous; this may lead to erratic behavior; personalities: %@",
    (uint8_t *)&v10,
    0x2Au);

}

void sub_1AF277350()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1AF26E2B4();
  sub_1AF26E284(&dword_1AF254000, v0, v1, "%@", v2, v3, v4, v5, v6);
  sub_1AF26E2AC();
}

void sub_1AF2773A8(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AF254000, log, OS_LOG_TYPE_ERROR, "Bootstrapping; failed to get my own sandbox container",
    v1,
    2u);
}

void sub_1AF2773E8(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_loadWeakRetained((id *)(a1 + 32));
  sub_1AF26F800();
  sub_1AF26F824(&dword_1AF254000, v2, v3, "%@: XPC error talking to pkd: %{public}s", v4, v5, v6, v7, v8);

  sub_1AF26F860();
}

void sub_1AF27745C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1AF26F848(*MEMORY[0x1E0C80C00]);
  sub_1AF26F838(&dword_1AF254000, v0, v1, "persona missing personaUniqueString: %@", v2, v3, v4, v5, v6);
}

void sub_1AF2774B4(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_loadWeakRetained((id *)(a1 + 40));
  sub_1AF26F800();
  sub_1AF26F824(&dword_1AF254000, v2, v3, "%@: XPC error sending request to pkd: %{public}s", v4, v5, v6, v7, v8);

  sub_1AF26F860();
}

void sub_1AF277528()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1AF26F848(*MEMORY[0x1E0C80C00]);
  sub_1AF26F838(&dword_1AF254000, v0, v1, "%@: retrying async request", v2, v3, v4, v5, v6);
}

void sub_1AF277580(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "debugDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1AF26FE14(&dword_1AF254000, v2, v3, "unexpectedly succeeded in getting LSApplicationExtensionRecord : %{public}@ when initializing appex bundle at %{public}@ failed", v4, v5, v6, v7, 2u);

  sub_1AF26FE28();
}

void sub_1AF277610()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  xpc_strerror();
  sub_1AF26FE14(&dword_1AF254000, v0, v1, "failed to init PKBundle with path '%{public}@': %s", v2, v3, v4, v5, 2u);
}

void sub_1AF27769C(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1AF26FE14(&dword_1AF254000, v2, v3, "failed to convert Info.plist to dictionary: %@ source=%@", v4, v5, v6, v7, 2u);

  sub_1AF26FE28();
}

void sub_1AF27772C(void *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(a1, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_bundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1AF26FE14(&dword_1AF254000, v3, v4, "failed to retrieve Info.plist for %@ through %@", v5, v6, v7, v8, 2u);

  sub_1AF26FE28();
}

void sub_1AF2777D0(NSObject *a1)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_1AF254000, a1, OS_LOG_TYPE_ERROR, "failed to consume extension, errno=%{darwin.errno}d", (uint8_t *)v3, 8u);
}

void sub_1AF277858(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  sub_1AF2704F0(a1, a2);
  sub_1AF2704F8();
  sub_1AF2704DC(&dword_1AF254000, v2, v3, "consuming extension %ld", v4, v5, v6, v7, v8);
  sub_1AF2704D0();
}

void sub_1AF2778B8(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  sub_1AF2704F0(a1, a2);
  sub_1AF2704F8();
  sub_1AF2704DC(&dword_1AF254000, v2, v3, "releasing extension %ld", v4, v5, v6, v7, v8);
  sub_1AF2704D0();
}

void sub_1AF277918(void *a1, char *a2)
{
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  int v8;

  v3 = sub_1AF2704F0(a1, a2);
  v4 = *__error();
  v5 = 134218240;
  v6 = v3;
  v7 = 1024;
  v8 = v4;
  _os_log_error_impl(&dword_1AF254000, (os_log_t)a2, OS_LOG_TYPE_ERROR, "failed to release extension %ld - errno=%{darwin.errno}d", (uint8_t *)&v5, 0x12u);
  sub_1AF2704D0();
}

void sub_1AF2779AC()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[22];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  sub_1AF274310();
  v3 = 2048;
  v4 = v0;
  _os_log_fault_impl(&dword_1AF254000, v1, OS_LOG_TYPE_FAULT, "<PKManager:%p> hold request for [%@] with flags: 0x%llx returned no hold token", v2, 0x20u);
  sub_1AF27432C();
}

void sub_1AF277A28()
{
  uint64_t v0;
  __int16 v1;
  uint64_t v2;
  os_log_t v3;
  uint8_t v4[22];
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  sub_1AF274310();
  v5 = 2048;
  v6 = v0;
  v7 = v1;
  v8 = v2;
  _os_log_error_impl(&dword_1AF254000, v3, OS_LOG_TYPE_ERROR, "<PKManager:%p> hold request for [%@] with flags: 0x%llx completed with error: %@", v4, 0x2Au);
}

void sub_1AF277AB4()
{
  uint64_t v0;
  os_log_t v1;

  sub_1AF2742C8(*MEMORY[0x1E0C80C00]);
  sub_1AF2742FC(&dword_1AF254000, v0, v1, "<PKManager:%p> failed to release hold [%{public}@] with error: %@");
  sub_1AF27432C();
}

void sub_1AF277B08()
{
  uint64_t v0;
  os_log_t v1;

  sub_1AF2742C8(*MEMORY[0x1E0C80C00]);
  sub_1AF2742FC(&dword_1AF254000, v0, v1, "<PKManager:%p> failed to release hold [%{public}@] with error: %@");
  sub_1AF27432C();
}

void sub_1AF277B5C(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 134218498;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 32);
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = *(_QWORD *)(a1 + 40);
  *(_WORD *)&v3[22] = 2112;
  sub_1AF2742FC(&dword_1AF254000, a2, a3, "<PKManager:%p> failed to release hold [%{public}@] with error: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a2 + 8) + 40));
  sub_1AF27432C();
}

CFURLRef CFBundleCopyBundleURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1E0C98000](bundle);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1E0C98120](bundle);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

void CFRunLoopRun(void)
{
  MEMORY[0x1E0C98CA8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x1E0CB3158]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFBundleCreateWithExecutableURLIfLooksLikeBundle()
{
  return MEMORY[0x1E0C99FF8]();
}

uint64_t _CFXPCCreateCFObjectFromXPCMessage()
{
  return MEMORY[0x1E0C9A7F0]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x1E0C9A800]();
}

uint64_t _CFXPCCreateXPCMessageWithCFObject()
{
  return MEMORY[0x1E0C9A808]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x1E0C9A818]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1E0C80FC0](dso, description, activity, *(_QWORD *)&flags);
}

uint64_t _os_crash()
{
  return MEMORY[0x1E0C81000]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1E0C813D0](a1, *(_QWORD *)&a2);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_t dispatch_get_current_queue(void)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82CF8]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x1E0C82F88](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

uint64_t dyld_get_active_platform()
{
  return MEMORY[0x1E0C830A0]();
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1E0C83158]();
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C83660](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1E0C83668]();
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return (passwd *)MEMORY[0x1E0C837A0](*(_QWORD *)&a1);
}

uid_t getuid(void)
{
  return MEMORY[0x1E0C83828]();
}

uint64_t kpersona_info()
{
  return MEMORY[0x1E0C83A60]();
}

uint64_t launch_add_external_service()
{
  return MEMORY[0x1E0C83A78]();
}

uint64_t launch_copy_busy_extension_instances()
{
  return MEMORY[0x1E0C83A80]();
}

uint64_t launch_copy_extension_properties()
{
  return MEMORY[0x1E0C83A88]();
}

uint64_t launch_copy_extension_properties_for_pid()
{
  return MEMORY[0x1E0C83A90]();
}

uint64_t launch_remove_external_service()
{
  return MEMORY[0x1E0C83B08]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1E0C83C70]();
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1E0C83CF8](*(_QWORD *)&task, *(_QWORD *)&name);
}

mach_port_t mach_thread_self(void)
{
  return MEMORY[0x1E0C83DB0]();
}

uint64_t memorystatus_control()
{
  return MEMORY[0x1E0C840A8]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

Protocol *__cdecl objc_allocateProtocol(const char *name)
{
  return (Protocol *)MEMORY[0x1E0DE7BC8](name);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

Protocol *__cdecl objc_getProtocol(const char *name)
{
  return (Protocol *)MEMORY[0x1E0DE7CD8](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

Class objc_lookUpClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7D10](name);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

void objc_registerProtocol(Protocol *proto)
{
  MEMORY[0x1E0DE7D70](proto);
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

void os_activity_apply(os_activity_t activity, os_block_t block)
{
  MEMORY[0x1E0C844F8](activity, block);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1E0C84930](log, ptr);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1E0C849F8]();
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C50](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

void protocol_addProtocol(Protocol *proto, Protocol *addition)
{
  MEMORY[0x1E0DE8078](proto, addition);
}

const char *__cdecl protocol_getName(Protocol *p)
{
  return (const char *)MEMORY[0x1E0DE80B0](p);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1E0C85178]();
}

uint64_t sandbox_container_path_for_pid()
{
  return MEMORY[0x1E0C85190]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1E0C851A0]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1E0C851A8]();
}

uint64_t sandbox_extension_issue_file_to_process()
{
  return MEMORY[0x1E0C851B0]();
}

uint64_t sandbox_extension_issue_mach_to_process()
{
  return MEMORY[0x1E0C851F0]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1E0C851F8]();
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

kern_return_t thread_info(thread_inspect_t target_act, thread_flavor_t flavor, thread_info_t thread_info_out, mach_msg_type_number_t *thread_info_outCnt)
{
  return MEMORY[0x1E0C858F8](*(_QWORD *)&target_act, *(_QWORD *)&flavor, thread_info_out, thread_info_outCnt);
}

uint64_t voucher_get_current_persona()
{
  return MEMORY[0x1E0C85B30]();
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1E0C85DF8](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C85E00](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1E0C85E30](xarray);
}

const uint8_t *__cdecl xpc_array_get_uuid(xpc_object_t xarray, size_t index)
{
  return (const uint8_t *)MEMORY[0x1E0C85E80](xarray, index);
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
  MEMORY[0x1E0C85ED0](xarray, index, string);
}

void xpc_array_set_uint64(xpc_object_t xarray, size_t index, uint64_t value)
{
  MEMORY[0x1E0C85ED8](xarray, index, value);
}

void xpc_array_set_uuid(xpc_object_t xarray, size_t index, const unsigned __int8 *uuid)
{
  MEMORY[0x1E0C85EE0](xarray, index, uuid);
}

uint64_t xpc_bundle_create()
{
  return MEMORY[0x1E0C85F18]();
}

uint64_t xpc_bundle_create_main()
{
  return MEMORY[0x1E0C85F20]();
}

uint64_t xpc_bundle_get_error()
{
  return MEMORY[0x1E0C85F28]();
}

uint64_t xpc_bundle_get_info_dictionary()
{
  return MEMORY[0x1E0C85F38]();
}

uint64_t xpc_bundle_get_property()
{
  return MEMORY[0x1E0C85F40]();
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x1E0C86018](connection);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x1E0C86038](connection, message, replyq, handler);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1E0C86048](connection, message);
}

uint64_t xpc_connection_set_bootstrap()
{
  return MEMORY[0x1E0C86060]();
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

uint64_t xpc_connection_set_oneshot_instance()
{
  return MEMORY[0x1E0C860A8]();
}

uint64_t xpc_connection_set_target_uid()
{
  return MEMORY[0x1E0C860D0]();
}

uint64_t xpc_copy_bootstrap()
{
  return MEMORY[0x1E0C860F0]();
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1E0C86198](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1E0C861A8](xdata);
}

int64_t xpc_date_get_value(xpc_object_t xdate)
{
  return MEMORY[0x1E0C861D0](xdate);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1E0C861F0](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C86248](xdict, key);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x1E0C86270](xdict);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862A0](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862D0](xdict, key);
}

const uint8_t *__cdecl xpc_dictionary_get_uuid(xpc_object_t xdict, const char *key)
{
  return (const uint8_t *)MEMORY[0x1E0C862D8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C86398](xdict, key, value);
}

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
  MEMORY[0x1E0C863B0](xdict, key, uuid);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  double result;

  MEMORY[0x1E0C863E0](xdouble);
  return result;
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

uint64_t xpc_init_services()
{
  return MEMORY[0x1E0C86548]();
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x1E0C86570](xint);
}

uint64_t xpc_strerror()
{
  return MEMORY[0x1E0C86710]();
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1E0C86758](xstring);
}

uint64_t xpc_transaction_exit_clean()
{
  return MEMORY[0x1E0C86778]();
}

uint64_t xpc_transaction_interrupt_clean_exit()
{
  return MEMORY[0x1E0C86780]();
}

const char *__cdecl xpc_type_get_name(xpc_type_t type)
{
  return (const char *)MEMORY[0x1E0C867A0](type);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1E0C867B8](xuint);
}

const uint8_t *__cdecl xpc_uuid_get_bytes(xpc_object_t xuuid)
{
  return (const uint8_t *)MEMORY[0x1E0C867F8](xuuid);
}

