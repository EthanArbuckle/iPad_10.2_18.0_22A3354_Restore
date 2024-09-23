void __updateSiriEnabledStatus_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  AFSupportPreferencesSynchronize();
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "languageCode");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "languageCode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsSeparatedByString:", CFSTR("-"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "assistantIsEnabled") && (AFAssistantRestricted() & 1) == 0)
    objc_msgSend(v4, "isEqualToString:", v6);

}

void sub_2279CFE54(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

unint64_t sp_analytics_log_timing(uint64_t a1, const char *a2, uint64_t a3)
{
  unint64_t v4;
  xpc_object_t empty;

  v4 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - a3;
  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_string(empty, "label", a2);
  xpc_dictionary_set_double(empty, "latency", (double)v4 / 1000000000.0);
  analytics_send_event();

  return v4;
}

void sub_2279D0398(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2279D0FF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t priorityIndexEligibleBundleIdentifer(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if (SSPriorityIndexLimitBundles())
    v2 = objc_msgSend((id)sEligibleBundleSet, "containsObject:", v1);
  else
    v2 = 1;

  return v2;
}

void hideResultFromSection(void *a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  id v10;

  v10 = a1;
  v8 = a3;
  if (a5 != a2)
  {
    v9 = a2;
    handleHiddenResult();
    objc_msgSend(v9, "removeResults:", v10);

  }
}

id copyForResending(void *a1)
{
  id v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char isKindOfClass;
  id v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v7);
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        v10 = objc_alloc(MEMORY[0x24BEB0250]);
        if ((isKindOfClass & 1) != 0)
        {
          v11 = (void *)objc_msgSend(v10, "initWithPrototype:", v8);
          objc_msgSend(v8, "resultSet");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setResultSet:", v12);

        }
        else
        {
          v11 = (void *)objc_msgSend(v10, "initWithSection:", v8, (_QWORD)v14);
        }
        objc_msgSend(v2, "addObject:", v11, (_QWORD)v14);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

  return v2;
}

void query_analytics_log_complete(void *a1, const char *a2, uint64_t a3)
{
  void *empty;
  __uint64_t v6;
  id v7;

  v7 = a1;
  clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  os_unfair_lock_lock((os_unfair_lock_t)&perfDictLock);
  objc_msgSend(v7, "perfDictionary");
  empty = (void *)objc_claimAutoreleasedReturnValue();
  if (!empty)
    empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_string(empty, "label", a2);
  v6 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  xpc_dictionary_set_double(empty, "latency", (double)(v6 - a3) / 1000000000.0);
  analytics_send_event();
  objc_msgSend(v7, "setPerfDictionary:", 0);
  os_unfair_lock_unlock((os_unfair_lock_t)&perfDictLock);

}

void sub_2279D9190(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_2279D91EC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

unint64_t query_analytics_log_timing(void *a1, const char *a2, const char *a3, uint64_t a4)
{
  id v7;
  __uint64_t v8;
  void *empty;
  unint64_t v10;
  char *v12;
  char *key;

  v7 = a1;
  v8 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  key = 0;
  asprintf(&key, "%s_label", a3);
  v12 = 0;
  asprintf(&v12, "%s_latency", a3);
  os_unfair_lock_lock((os_unfair_lock_t)&perfDictLock);
  objc_msgSend(v7, "perfDictionary");
  empty = (void *)objc_claimAutoreleasedReturnValue();
  if (!empty)
  {
    empty = xpc_dictionary_create_empty();
    objc_msgSend(v7, "setPerfDictionary:", empty);
  }
  v10 = v8 - a4;
  xpc_dictionary_set_string(empty, key, a2);
  xpc_dictionary_set_double(empty, v12, (double)v10 / 1000000000.0);
  os_unfair_lock_unlock((os_unfair_lock_t)&perfDictLock);
  free(key);
  free(v12);

  return v10;
}

void sub_2279DCC78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_2279DE3F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,id location)
{
  id *v44;

  objc_destroyWeak(v44);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2279DEAC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,__int128 a29,__int128 a30,uint64_t a31)
{
  __int128 v32;

  si_tracing_restore_current_span((uint64_t)&a23);
  v32 = a30;
  *(_OWORD *)a11 = a29;
  *(_OWORD *)(a11 + 16) = v32;
  *(_QWORD *)(a11 + 32) = a31;
  _Unwind_Resume(a1);
}

__n128 si_tracing_restore_current_span(uint64_t a1)
{
  uint64_t v2;
  __n128 result;
  __int128 v4;

  v2 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
  si_tracing_log_span_end();
  result = *(__n128 *)a1;
  v4 = *(_OWORD *)(a1 + 16);
  *(_QWORD *)(v2 + 32) = *(_QWORD *)(a1 + 32);
  *(__n128 *)v2 = result;
  *(_OWORD *)(v2 + 16) = v4;
  return result;
}

void sub_2279E00D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
  si_tracing_restore_current_span((uint64_t)&a51);
  _Unwind_Resume(a1);
}

void sub_2279E0550(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  si_tracing_restore_current_span((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_2279E0748(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, __int128 buf, int a16, __int16 a17, __int16 a18, uint64_t a19, __int128 a20)
{
  uint64_t v20;
  id v22;
  NSObject *v23;
  NSObject *v24;
  id v25;
  uint64_t v26;
  void *v27;

  if (a2 == 1)
  {
    v22 = objc_begin_catch(a1);
    SPLogForSPLogCategoryDefault();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v25 = (id)objc_opt_class();
      v26 = *(_QWORD *)(v20 + 56);
      objc_msgSend(v22, "callStackSymbols");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138413058;
      *(_QWORD *)((char *)&buf + 4) = v25;
      WORD6(buf) = 2112;
      *(_QWORD *)((char *)&buf + 14) = v22;
      a18 = 2112;
      a19 = v26;
      LOWORD(a20) = 2112;
      *(_QWORD *)((char *)&a20 + 2) = v27;
      _os_log_error_impl(&dword_2279CC000, v23, OS_LOG_TYPE_ERROR, "#query %@ crashed (exception: %@) with search string '%@'\n stack:%@", (uint8_t *)&buf, 0x2Au);

    }
    SPLogForSPLogCategoryTelemetry();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v24))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_2279CC000, v24, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "queryCrash", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
    }

    objc_end_catch();
    JUMPOUT(0x2279E06DCLL);
  }
  si_tracing_restore_current_span((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_2279E1570(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_2279E1924(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void createDedupeDicts(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, int a8)
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  char v25;
  void *v26;
  int v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  id v37;
  uint64_t v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  LODWORD(v38) = a8;
  v45 = *MEMORY[0x24BDAC8D0];
  v14 = a1;
  v15 = a2;
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  objc_msgSend(v14, "bundleIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v38) = objc_msgSend(v21, "isEqualToString:", *MEMORY[0x24BEB0428]);

  objc_msgSend(v14, "bundleIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isEqualToString:", *MEMORY[0x24BEB0440]);

  objc_msgSend(v14, "bundleIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "isEqualToString:", *MEMORY[0x24BEB0448]);

  v39 = v14;
  objc_msgSend(v14, "bundleIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "hasPrefix:", *MEMORY[0x24BEB0430]);

  if ((v38 & 0x100000000) != 0
    || (v23 & 1) != 0
    || (v25 & 1) != 0
    || (v27 & v38 & 1) != 0
    || (objc_msgSend(v39, "bundleIdentifier"),
        v28 = (void *)objc_claimAutoreleasedReturnValue(),
        v29 = objc_msgSend(v28, "hasPrefix:", CFSTR("com.apple.parsec.")),
        v28,
        (v29 & 1) == 0))
  {
    objc_msgSend(v39, "results", v38);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v30, "copy");

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v32 = v31;
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v41 != v35)
            objc_enumerationMutation(v32);
          v37 = objc_unsafeClaimAutoreleasedReturnValue(updateDedupeDictsForResult(*(void **)(*((_QWORD *)&v40 + 1)
                                                                                            + 8 * i), v15, v16, v17, v18, v19, v20));
        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      }
      while (v34);
    }

  }
}

id updateDedupeDictsForResult(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  int v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  int v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  uint64_t i;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t j;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  id v61;
  uint64_t v63;
  void *v64;
  void *v65;
  id v66;
  id obj;
  id v68;
  id v69;
  id v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  uint64_t v75;
  id v76;
  id v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x24BDAC8D0];
  v13 = a1;
  v66 = a2;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v76 = a7;
  objc_msgSend(v13, "sectionBundleIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = *MEMORY[0x24BEB0440];
  LODWORD(a5) = objc_msgSend(v18, "isEqualToString:", *MEMORY[0x24BEB0440]);

  if ((_DWORD)a5
    || (objc_msgSend(v13, "sectionBundleIdentifier"),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        v19 = *MEMORY[0x24BEB0448],
        v21 = objc_msgSend(v20, "isEqualToString:", *MEMORY[0x24BEB0448]),
        v20,
        v21))
  {
    objc_msgSend(v17, "objectForKey:", v19);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
    {
      if (v22 != v13)
      {
        v24 = v22;
LABEL_8:
        v25 = v24;

        goto LABEL_61;
      }
    }
    else
    {
      objc_msgSend(v17, "setObject:forKey:", v13, v19);
    }
    v24 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v13, "storeIdentifier");
  v26 = objc_claimAutoreleasedReturnValue();
  v65 = (void *)v26;
  if (!v26)
  {
    v77 = 0;
    goto LABEL_17;
  }
  v27 = v26;
  objc_msgSend(v14, "objectForKey:", v26);
  v28 = (id)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (!v28)
  {
    objc_msgSend(v14, "setObject:forKey:", v13, v27);
    goto LABEL_15;
  }
  if (v28 == v13)
  {
LABEL_15:
    v77 = 0;
    goto LABEL_16;
  }
  v77 = v28;
LABEL_16:

LABEL_17:
  objc_msgSend(v13, "calendarIdentifier");
  v30 = objc_claimAutoreleasedReturnValue();
  v63 = v30;
  if (v30)
  {
    v31 = v30;
    objc_msgSend(v15, "objectForKey:", v30, v30, v65, v66);
    v32 = (id)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (v32)
    {
      if (v32 != v13)
      {
        v34 = v32;

        v77 = v34;
      }
    }
    else
    {
      objc_msgSend(v15, "setObject:forKey:", v13, v31);
    }

  }
  objc_msgSend(v13, "sectionBundleIdentifier", v63);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "isEqualToString:", *MEMORY[0x24BEB0428]);

  if (!v36)
    goto LABEL_30;
  objc_msgSend(v13, "identifier");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKey:", v37);
  v38 = (id)objc_claimAutoreleasedReturnValue();

  if (!v38)
  {
    objc_msgSend(v13, "identifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v13, v39);
    goto LABEL_28;
  }
  if (v38 != v13)
  {
    v39 = v77;
    v77 = v38;
LABEL_28:

  }
LABEL_30:
  objc_msgSend(v13, "sectionBundleIdentifier");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "hasPrefix:", *MEMORY[0x24BEB0430]);

  if (v41)
  {
    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    objc_msgSend(v13, "inlineCard");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "cardSections");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v43;
    v73 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v82, v87, 16);
    if (v73)
    {
      v71 = v14;
      v72 = *(_QWORD *)v83;
      v69 = v16;
      v70 = v15;
      v68 = v17;
      do
      {
        for (i = 0; i != v73; ++i)
        {
          if (*(_QWORD *)v83 != v72)
            objc_enumerationMutation(obj);
          v45 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v46 = v45;
          else
            v46 = 0;
          v47 = v46;
          if (v47)
          {
            v74 = v47;
            v75 = i;
            v80 = 0u;
            v81 = 0u;
            v78 = 0u;
            v79 = 0u;
            objc_msgSend(v47, "cardSections");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v78, v86, 16);
            if (v49)
            {
              v50 = v49;
              v51 = *(_QWORD *)v79;
              v52 = v76;
              do
              {
                for (j = 0; j != v50; ++j)
                {
                  if (*(_QWORD *)v79 != v51)
                    objc_enumerationMutation(v48);
                  objc_msgSend(*(id *)(*((_QWORD *)&v78 + 1) + 8 * j), "command");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                    v55 = v54;
                  else
                    v55 = 0;
                  v56 = v55;
                  objc_msgSend(v56, "applicationBundleIdentifier");
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v57)
                  {
                    objc_msgSend(v52, "objectForKey:", v57);
                    v58 = (id)objc_claimAutoreleasedReturnValue();
                    v59 = v58;
                    if (v58)
                    {
                      if (v58 != v13)
                      {
                        v60 = v13;
                        v61 = v58;

                        v77 = v61;
                        v13 = v60;
                        v52 = v76;
                      }
                    }
                    else
                    {
                      objc_msgSend(v52, "setObject:forKey:", v13, v57);
                    }

                  }
                }
                v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v78, v86, 16);
              }
              while (v50);
            }

            v15 = v70;
            v14 = v71;
            v17 = v68;
            v16 = v69;
            v47 = v74;
            i = v75;
          }

        }
        v73 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v87, 16);
      }
      while (v73);
    }

  }
  v25 = v77;

LABEL_61:
  return v25;
}

void sub_2279E6528(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

unint64_t query_analytics_log_timing_with_extras(void *a1, const char *a2, const char *a3, uint64_t a4, const char *a5, unint64_t a6, const char *a7, unint64_t a8, const char *a9, unint64_t a10)
{
  id v17;
  __uint64_t v18;
  unint64_t v19;
  void *empty;
  char *v22;
  char *v23;
  char *v24;
  char *v25;
  char *key;

  v17 = a1;
  v18 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  key = 0;
  asprintf(&key, "%s_label", a3);
  v25 = 0;
  asprintf(&v25, "%s_latency", a3);
  v23 = 0;
  v24 = 0;
  v22 = 0;
  if (a5)
    asprintf(&v24, "%s_%s", a3, a5);
  if (a7)
    asprintf(&v23, "%s_%s", a3, a7);
  if (a9)
    asprintf(&v22, "%s_%s", a3, a9);
  v19 = v18 - a4;
  os_unfair_lock_lock((os_unfair_lock_t)&perfDictLock);
  objc_msgSend(v17, "perfDictionary");
  empty = (void *)objc_claimAutoreleasedReturnValue();
  if (!empty)
  {
    empty = xpc_dictionary_create_empty();
    objc_msgSend(v17, "setPerfDictionary:", empty);
  }
  xpc_dictionary_set_string(empty, key, a2);
  xpc_dictionary_set_double(empty, v25, (double)v19 / 1000000000.0);
  if (v24)
    xpc_dictionary_set_double(empty, v24, (double)a6 / 1000000000.0);
  if (v23)
    xpc_dictionary_set_double(empty, v23, (double)a8 / 1000000000.0);
  if (v22)
    xpc_dictionary_set_double(empty, v22, (double)a10 / 1000000000.0);
  os_unfair_lock_unlock((os_unfair_lock_t)&perfDictLock);
  free(key);
  free(v25);
  free(v24);
  free(v23);
  free(v22);

  return v19;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_2279E7760(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2279E7A98(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_2279E7B6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void `anonymous namespace'::updatePhoneFavorites(_anonymous_namespace_ *this)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBAD20], "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "entries");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  v4 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v8), "contactProperty", (_QWORD)v14);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "contact");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  v12 = objc_msgSend(v4, "copy");

}

void sub_2279E7D28(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2279E7E1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_2279E80E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2279E81F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void `anonymous namespace'::updateMailVIPList(_anonymous_namespace_ *this)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255927650);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE636F8], "remoteProxyForXPCInterface:connectionErrorHandler:", v1, &__block_literal_global_533);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)os_transaction_create();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = ___ZN12_GLOBAL__N_117updateMailVIPListEv_block_invoke_535;
  v5[3] = &unk_24F01B8B0;
  v6 = v3;
  v4 = v3;
  objc_msgSend(v2, "orderedVIPAddressesAndUnreadCountsWithCompletion:", v5);

}

void sub_2279E82E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v17 = v16;

  _Unwind_Resume(a1);
}

void sub_2279E83D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2279E85B4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_2279E8780(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2279E8BC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_2279E8C98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_2279E8F58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, uint64_t a17, id location)
{
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_2279E907C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_2279E914C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)SPCSSearchQuery;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_2279E9E88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26)
{

  _Unwind_Resume(a1);
}

uint64_t std::vector<tt_hash_table<`anonymous namespace'::SPResultValueItemHashTableEntry>>::emplace_back<long &,`anonymous namespace'::SPResultValueItemHashTableEntry>(int64x2_t *a1, uint64_t *a2, uint64_t a3)
{
  int64x2_t *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  _QWORD *v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  int64x2_t v27;
  char *v28;
  int64x2_t *v29;
  char *v30;
  int64x2_t v31;
  char *v32;
  int64x2_t *v33;

  v5 = a1;
  v6 = a1[1].u64[0];
  v7 = a1->u64[1];
  if (v7 >= v6)
  {
    v10 = (uint64_t)(v7 - a1->i64[0]) >> 5;
    if ((unint64_t)(v10 + 1) >> 59)
      abort();
    v11 = v6 - a1->i64[0];
    v12 = v11 >> 4;
    if (v11 >> 4 <= (unint64_t)(v10 + 1))
      v12 = v10 + 1;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFE0)
      v13 = 0x7FFFFFFFFFFFFFFLL;
    else
      v13 = v12;
    v33 = a1 + 1;
    if (v13)
    {
      if (v13 >> 59)
        std::__throw_bad_array_new_length[abi:nn180100]();
      v14 = (char *)operator new(32 * v13);
    }
    else
    {
      v14 = 0;
    }
    v30 = v14;
    v31.i64[0] = (uint64_t)&v14[32 * v10];
    v32 = &v14[32 * v13];
    v15 = (_QWORD *)v31.i64[0];
    v9 = v31.i64[0] + 32;
    v31.i64[1] = v31.i64[0] + 32;
    v17 = v5->i64[0];
    v16 = v5->u64[1];
    if (v16 == v5->i64[0])
    {
      v27 = vdupq_n_s64(v16);
    }
    else
    {
      v29 = v5;
      v18 = (_QWORD *)v31.i64[0];
      do
      {
        v19 = *(_DWORD *)(v16 - 32);
        v16 -= 32;
        *((_DWORD *)v18 - 8) = v19;
        v18 -= 4;
        v18[1] = 0;
        v18[2] = 0;
        v18[3] = 0;
        v20 = *(_QWORD *)(v16 + 8);
        v21 = *(_QWORD *)(v16 + 16);
        if (v21 != v20)
        {
          v22 = 0;
          v23 = *(v15 - 2);
          do
          {
            v24 = v20 + v22;
            v25 = v23 + v22;
            v26 = *(_OWORD *)(v20 + v22 + 16);
            *(_OWORD *)v25 = *(_OWORD *)(v20 + v22);
            *(_OWORD *)(v25 + 16) = v26;
            *(_QWORD *)(v25 + 32) = *(id *)(v20 + v22 + 32);
            *(_QWORD *)(v25 + 40) = *(id *)(v20 + v22 + 40);
            *(_QWORD *)(v25 + 48) = *(_QWORD *)(v20 + v22 + 48);
            v22 += 64;
          }
          while (v24 + 64 != v21);
          *(v15 - 2) = v23 + v22;
        }
        v15 = v18;
      }
      while (v16 != v17);
      v5 = v29;
      v27 = *v29;
      v9 = v31.i64[1];
      v15 = v18;
    }
    v5->i64[0] = (uint64_t)v15;
    v5->i64[1] = v9;
    v31 = v27;
    v28 = (char *)v5[1].i64[0];
    v5[1].i64[0] = (uint64_t)v32;
    v32 = v28;
    v30 = (char *)v27.i64[0];
  }
  else
  {
    v9 = v7 + 32;
    v5->i64[1] = v7 + 32;
  }
  v5->i64[1] = v9;
  return result;
}

void sub_2279EA21C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  _Unwind_Resume(a1);
}

void `anonymous namespace'::SPResultValueItemHashTableEntry::~SPResultValueItemHashTableEntry(id *this)
{

}

BOOL `anonymous namespace'::operator>(uint64_t a1, uint64_t a2)
{
  float v2;
  float v3;
  int v4;
  int v5;

  if (*(_OWORD *)a2 < *(_OWORD *)a1)
    return 1;
  if (*(_OWORD *)a1 < *(_OWORD *)a2)
    return 0;
  v2 = *(float *)(a2 + 28);
  v3 = *(float *)(a1 + 28);
  if (v2 < v3)
    return 1;
  if (v3 < v2)
    return 0;
  v4 = *(_DWORD *)(a2 + 24);
  v5 = *(_DWORD *)(a1 + 24);
  if (v4 < v5)
    return 1;
  return v5 >= v4 && *(double *)(a2 + 16) < *(double *)(a1 + 16);
}

void sub_2279EB284(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, void *a16, uint64_t a17, uint64_t a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,void *a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30)
{
  void *v30;
  void *v31;
  void *v32;

  _Unwind_Resume(a1);
}

id `anonymous namespace'::installedApps(_anonymous_namespace_ *this)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v1 = (void *)MEMORY[0x24BDBCF20];
  SPFastApplicationsGetNoBuild();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v4, "count"))
  {
    SPCopyVisibleApps();
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  return v4;
}

void sub_2279EB65C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_2279EB764(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_2279EBA9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{

  _Unwind_Resume(a1);
}

void sub_2279EBB24(_Unwind_Exception *a1)
{
  id *v1;

  _Unwind_Resume(a1);
}

void sub_2279EBB70(_Unwind_Exception *a1)
{
  id *v1;

  _Unwind_Resume(a1);
}

void sub_2279EC0DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, id *location, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,id a33)
{

  _Unwind_Resume(a1);
}

void sub_2279EC4DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, void *a11)
{
  void *v11;

  _Unwind_Resume(a1);
}

void sub_2279EC600(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v13 = v12;

  _Unwind_Resume(a1);
}

void sub_2279ED2B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,_Unwind_Exception *exception_object)
{
  void *v32;
  void *v33;

  _Unwind_Resume(a1);
}

void sub_2279ED668(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2279EE08C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,void *a37,void *a38,uint64_t a39,uint64_t a40,void *a41)
{
  void *v41;
  void *v42;

  _Unwind_Resume(a1);
}

void sub_2279EE654(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

void sub_2279EEE04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, void *a20)
{
  void *v20;

  _Unwind_Resume(a1);
}

void sub_2279EF064(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2279EF100(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2279EF470(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13)
{

  _Unwind_Resume(a1);
}

void sub_2279EFDCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15)
{
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_2279F067C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, _Unwind_Exception *exception_object, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  _Unwind_Resume(a1);
}

void sub_2279F15CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, uint64_t a12, void *a13, void *a14, void *a15, uint64_t a16, void *a17, uint64_t a18, void *a19, uint64_t a20,void *a21,void *a22,void *a23,void *a24,void *a25,void *a26,uint64_t a27,void *a28,void *a29,uint64_t a30,uint64_t a31,void *a32)
{
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;

  _Unwind_Resume(a1);
}

void sub_2279F1A08(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2279F2364(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, id *location, void *a14, void *a15, void *a16, void *a17, void *a18, uint64_t a19, void *a20,void *a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,void *a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *a32,void *a33,void *a34,uint64_t a35,uint64_t a36,id a37)
{
  void *v37;

  objc_destroyWeak(location);
  objc_destroyWeak(&a37);

  _Unwind_Resume(a1);
}

void sub_2279F2638(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_2279F3044(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,id location,uint64_t a34,int a35,__int16 a36,char a37,char a38)
{
  void *v38;

  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

id `anonymous namespace'::BundleIdToResultMap::resultSet(_anonymous_namespace_::BundleIdToResultMap *this, NSString *a2)
{
  NSString *v3;
  id v4;
  void *__p[2];
  char v7;
  void **v8;

  v3 = objc_retainAutorelease(a2);
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)-[NSString UTF8String](v3, "UTF8String"));
  v8 = __p;
  v4 = *((id *)std::__hash_table<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)this, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v8)+ 6);
  if (v7 < 0)
    operator delete(__p[0]);

  return v4;
}

void sub_2279F3260(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  if (a15 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_2279F32C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_2279F331C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_2279F6EC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29,void *a30,void *a31,void *a32,void *a33,void *a34,void *a35,void *a36,void *a37,void *a38,void *a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,void *a45,void *a46,uint64_t a47,void *a48,void *a49,void *a50,void *a51,void *a52,void *a53,void *a54,void *a55,uint64_t a56,void *a57,void *a58,void *a59,void *a60,uint64_t a61,void *a62,void *a63)
{
  void *a65;
  void *a66;
  void *a67;
  void *a68;
  void *a69;
  void *a70;
  void *v70;
  void *v71;
  void *v72;
  void *v73;

  _Unwind_Resume(a1);
}

void sub_2279F7EAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_2279F7FAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_2279F80F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_2279F81E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_2279F82A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_2279F8398(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_2279F8524(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_2279F8668(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2279F88C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void **std::vector<tt_hash_table<`anonymous namespace'::SPResultValueItemHashTableEntry>>::~vector[abi:nn180100](void **a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = *a1;
  if (*a1)
  {
    v3 = (uint64_t)a1[1];
    v4 = *a1;
    if ((void *)v3 != v2)
    {
      do
      {
        v3 -= 32;
      }
      while ((void *)v3 != v2);
      v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

void sub_2279F8E84(_Unwind_Exception *a1)
{
  id *v1;

  std::__hash_table<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>>>::~__hash_table((uint64_t)v1);
  _Unwind_Resume(a1);
}

void ___ZN12_GLOBAL__N_117updateMailVIPListEv_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  _QWORD v5[4];

  v5[3] = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  SPLogForSPLogCategoryDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v2, "localizedDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    ___ZN12_GLOBAL__N_117updateMailVIPListEv_block_invoke_cold_1(v4, (uint64_t)v5, v3);
  }

}

void sub_2279F8F74(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void ___ZN12_GLOBAL__N_117updateMailVIPListEv_block_invoke_535(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  os_log_type_t v9;
  id v10;
  uint8_t v11[16];

  v4 = a2;
  v5 = a3;
  if (v5)
  {
    SPLogForSPLogCategoryDefault();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      ___ZN12_GLOBAL__N_117updateMailVIPListEv_block_invoke_535_cold_1((uint64_t)v5, v6, v7);
  }
  else
  {
    if ((unint64_t)objc_msgSend(v4, "count") >= 0x65)
    {
      objc_msgSend(v4, "subarrayWithRange:", 0, 100);
      v8 = objc_claimAutoreleasedReturnValue();

      v4 = (id)v8;
    }
    SPLogForSPLogCategoryDefault();
    v6 = objc_claimAutoreleasedReturnValue();
    v9 = 2 * (*MEMORY[0x24BE84AF8] == 0);
    if (os_log_type_enabled(v6, v9))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_2279CC000, v6, v9, "Finish Fetching VIPs", v11, 2u);
    }
  }

  v10 = (id)objc_opt_self();

}

void sub_2279F90F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

_anonymous_namespace_::SPResultValueItem *`anonymous namespace'::SPResultValueItem::SPResultValueItem(_anonymous_namespace_::SPResultValueItem *this, CSSearchableItem *a2)
{
  void *v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  unsigned __int8 v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v23;
  CSSearchableItem *v24;

  v24 = a2;
  *((_QWORD *)this + 4) = 0;
  *((_QWORD *)this + 5) = 0;
  -[CSSearchableItem attributeSet](v24, "attributeSet");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "attributeDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BDC2388]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "length") == 16)
    {
      v5 = (_QWORD *)objc_msgSend(objc_retainAutorelease(v4), "bytes");
      v6 = v5[1];
      *(_QWORD *)this = *v5;
      *((_QWORD *)this + 1) = v6;
    }
  }
  if ((v7 & 1) == 0
  {
    qword_253E93688 = (uint64_t)(id)*MEMORY[0x24BDC1EE8];
    qword_253E93690 = (uint64_t)(id)*MEMORY[0x24BDC1C00];
    qword_253E93698 = (uint64_t)(id)*MEMORY[0x24BDC2220];
    qword_253E936A0 = (uint64_t)(id)*MEMORY[0x24BDC1C20];
    qword_253E936A8 = (uint64_t)(id)*MEMORY[0x24BDC1B28];
    qword_253E936B0 = (uint64_t)(id)*MEMORY[0x24BDC1B58];
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDC1AE8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BEB03E0]) & 1) != 0)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDC1B58]);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v9 != (id)*MEMORY[0x24BDBD430])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        *((_DWORD *)this + 6) = 1;
        objc_msgSend(v9, "timeIntervalSinceReferenceDate");
        *((_QWORD *)this + 2) = v10;
      }
    }
  }
  else
  {
    v11 = 0;
    v12 = (void *)*MEMORY[0x24BDBD430];
    while (1)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13 != v12)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v13, "timeIntervalSinceReferenceDate");
          if (v14 > 0.0)
            break;
        }
      }

      if (++v11 == 7)
        goto LABEL_18;
    }
    *((_DWORD *)this + 6) = 7 - v11;
    objc_msgSend(v13, "timeIntervalSinceReferenceDate");
    *((_QWORD *)this + 2) = v15;

  }
LABEL_18:
  objc_msgSend(v23, "curationScore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "floatValue");
  *((_DWORD *)this + 7) = v17;

  -[CSSearchableItem protection](v24, "protection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "copy");
  v20 = (void *)*((_QWORD *)this + 4);
  *((_QWORD *)this + 4) = v19;

  v21 = (void *)*((_QWORD *)this + 5);
  *((_QWORD *)this + 5) = v24;

  return this;
}

void sub_2279F9430(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>>>::find<std::string>(_QWORD *a1, uint64_t a2)
{
  unsigned __int8 *v2;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  int8x8_t v7;
  unint64_t v8;
  uint8x8_t v9;
  unint64_t v10;
  unint64_t v11;
  unsigned __int8 **v12;
  unsigned __int8 *v13;
  uint64_t v14;
  unint64_t v15;
  char v17;

  v2 = (unsigned __int8 *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    v5 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(_QWORD *)a2;
    v5 = v4;
  }
  v6 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100]((uint64_t)&v17, (uint64_t *)a2, v5);
  v7 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v7)
    return 0;
  v8 = v6;
  v9 = (uint8x8_t)vcnt_s8(v7);
  v9.i16[0] = vaddlv_u8(v9);
  v10 = v9.u32[0];
  if (v9.u32[0] > 1uLL)
  {
    v11 = v6;
    if (v6 >= *(_QWORD *)&v7)
      v11 = v6 % *(_QWORD *)&v7;
  }
  else
  {
    v11 = (*(_QWORD *)&v7 - 1) & v6;
  }
  v12 = *(unsigned __int8 ***)(*a1 + 8 * v11);
  if (!v12)
    return 0;
  v13 = *v12;
  if (*v12)
  {
    v14 = (uint64_t)(a1 + 4);
    do
    {
      v15 = *((_QWORD *)v13 + 1);
      if (v15 == v8)
      {
        if ((std::equal_to<std::string>::operator()[abi:nn180100](v14, v13 + 16, v2) & 1) != 0)
          return v13;
      }
      else
      {
        if (v10 > 1)
        {
          if (v15 >= *(_QWORD *)&v7)
            v15 %= *(_QWORD *)&v7;
        }
        else
        {
          v15 &= *(_QWORD *)&v7 - 1;
        }
        if (v15 != v11)
          return 0;
      }
      v13 = *(unsigned __int8 **)v13;
    }
    while (v13);
  }
  return v13;
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100](uint64_t a1, uint64_t *a2, unint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;

  if (a3 > 0x20)
  {
    if (a3 > 0x40)
    {
      v4 = *(uint64_t *)((char *)a2 + a3 - 48);
      v5 = *(uint64_t *)((char *)a2 + a3 - 40);
      v6 = *(uint64_t *)((char *)a2 + a3 - 24);
      v8 = *(uint64_t *)((char *)a2 + a3 - 64);
      v7 = *(uint64_t *)((char *)a2 + a3 - 56);
      v9 = *(uint64_t *)((char *)a2 + a3 - 16);
      v10 = *(uint64_t *)((char *)a2 + a3 - 8);
      v11 = v7 + v9;
      v12 = 0x9DDFEA08EB382D69
          * (v6 ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))) >> 47) ^ (0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))));
      v13 = 0x9DDFEA08EB382D69 * (v12 ^ (v12 >> 47));
      v14 = v8 + a3 + v7 + v4;
      v15 = v14 + v5;
      v16 = __ROR8__(v14, 44) + v8 + a3 + __ROR8__(v5 + v8 + a3 - 0x622015F714C7D297 * (v12 ^ (v12 >> 47)), 21);
      v17 = v7 + v9 + *(uint64_t *)((char *)a2 + a3 - 32) - 0x4B6D499041670D8DLL;
      v18 = v17 + v6 + v9;
      v19 = __ROR8__(v18, 44);
      v20 = v18 + v10;
      v21 = v19 + v17 + __ROR8__(v17 + v5 + v10, 21);
      v23 = *a2;
      v22 = a2 + 4;
      v24 = v23 - 0x4B6D499041670D8DLL * v5;
      v25 = -(uint64_t)((a3 - 1) & 0xFFFFFFFFFFFFFFC0);
      do
      {
        v26 = *(v22 - 3);
        v27 = v24 + v15 + v11 + v26;
        v28 = v22[2];
        v29 = v22[3];
        v30 = v22[1];
        v11 = v30 + v15 - 0x4B6D499041670D8DLL * __ROR8__(v11 + v16 + v28, 42);
        v31 = v13 + v20;
        v32 = *(v22 - 2);
        v33 = *(v22 - 1);
        v34 = *(v22 - 4) - 0x4B6D499041670D8DLL * v16;
        v35 = v34 + v20 + v33;
        v36 = v34 + v26 + v32;
        v15 = v36 + v33;
        v37 = __ROR8__(v36, 44) + v34;
        v38 = (0xB492B66FBE98F273 * __ROR8__(v27, 37)) ^ v21;
        v24 = 0xB492B66FBE98F273 * __ROR8__(v31, 33);
        v16 = v37 + __ROR8__(v35 + v38, 21);
        v39 = v24 + v21 + *v22;
        v20 = v39 + v30 + v28 + v29;
        v21 = __ROR8__(v39 + v30 + v28, 44) + v39 + __ROR8__(v11 + v32 + v39 + v29, 21);
        v22 += 8;
        v13 = v38;
        v25 += 64;
      }
      while (v25);
      v40 = v24
          - 0x622015F714C7D297
          * ((0x9DDFEA08EB382D69
            * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) ^ ((0x9DDFEA08EB382D69 * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) >> 47));
      v41 = 0x9DDFEA08EB382D69
          * (v40 ^ (v38
                  - 0x4B6D499041670D8DLL * (v11 ^ (v11 >> 47))
                  - 0x622015F714C7D297
                  * ((0x9DDFEA08EB382D69
                    * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) ^ ((0x9DDFEA08EB382D69 * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) >> 47))));
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) ^ ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) >> 47));
    }
    else
    {
      return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:nn180100](a2, a3);
    }
  }
  else if (a3 > 0x10)
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:nn180100](a2, a3);
  }
  else
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:nn180100](a2, a3);
  }
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:nn180100](_DWORD *a1, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  if (a2 < 9)
  {
    if (a2 < 4)
    {
      result = 0x9AE16A3B2F90404FLL;
      if (a2)
      {
        v8 = (0xC949D7C7509E6557 * (a2 + 4 * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                      * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
        return 0x9AE16A3B2F90404FLL * (v8 ^ (v8 >> 47));
      }
    }
    else
    {
      v6 = *(unsigned int *)((char *)a1 + a2 - 4);
      v7 = 0x9DDFEA08EB382D69 * (((8 * *a1) + a2) ^ v6);
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) >> 47));
    }
  }
  else
  {
    v3 = *(_QWORD *)((char *)a1 + a2 - 8);
    v4 = __ROR8__(v3 + a2, a2);
    return (0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69
            * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)))) ^ ((0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)))) >> 47))) ^ v3;
  }
  return result;
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:nn180100](_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v2 = a1[1];
  v3 = 0xB492B66FBE98F273 * *a1;
  v4 = __ROR8__(0x9AE16A3B2F90404FLL * *(_QWORD *)((char *)a1 + a2 - 8), 30) + __ROR8__(v3 - v2, 43);
  v5 = v3 + a2 + __ROR8__(v2 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(_QWORD *)((char *)a1 + a2 - 8);
  v6 = 0x9DDFEA08EB382D69 * (v5 ^ (v4 - 0x3C5A37A36834CED9 * *(_QWORD *)((char *)a1 + a2 - 16)));
  return 0x9DDFEA08EB382D69
       * ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) ^ ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) >> 47));
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:nn180100](_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;

  v2 = *(_QWORD *)((char *)a1 + a2 - 16);
  v3 = *a1 - 0x3C5A37A36834CED9 * (v2 + a2);
  v5 = a1[2];
  v4 = a1[3];
  v6 = __ROR8__(v3 + v4, 52);
  v7 = v3 + a1[1];
  v8 = __ROR8__(v7, 7);
  v9 = v7 + v5;
  v10 = *(_QWORD *)((char *)a1 + a2 - 32) + v5;
  v11 = v8 + __ROR8__(*a1 - 0x3C5A37A36834CED9 * (v2 + a2), 37) + v6 + __ROR8__(v9, 31);
  v12 = *(_QWORD *)((char *)a1 + a2 - 24) + v10 + v2;
  v13 = 0xC3A5C85C97CB3127 * (v12 + *(_QWORD *)((char *)a1 + a2 - 8) + v4 + v11)
      - 0x651E95C4D06FBFB1
      * (v9
       + v4
       + __ROR8__(v10, 37)
       + __ROR8__(*(_QWORD *)((char *)a1 + a2 - 24) + v10, 7)
       + __ROR8__(*(_QWORD *)((char *)a1 + a2 - 8) + v4 + v10, 52)
       + __ROR8__(v12, 31));
  return 0x9AE16A3B2F90404FLL
       * ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) ^ ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) >> 47));
}

uint64_t std::equal_to<std::string>::operator()[abi:nn180100](uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  unsigned __int8 *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  int v12;
  BOOL v14;
  uint64_t result;

  v3 = a3;
  v4 = a2[23];
  if ((v4 & 0x80u) == 0)
    v5 = a2[23];
  else
    v5 = *((_QWORD *)a2 + 1);
  v6 = a3[23];
  v7 = (char)v6;
  if ((v6 & 0x80u) != 0)
    v6 = *((_QWORD *)a3 + 1);
  if (v5 != v6)
    return 0;
  if (v7 < 0)
    v3 = *(unsigned __int8 **)a3;
  if ((v4 & 0x80) != 0)
    return memcmp(*(const void **)a2, v3, *((_QWORD *)a2 + 1)) == 0;
  if (!a2[23])
    return 1;
  v8 = v4 - 1;
  do
  {
    v10 = *a2++;
    v9 = v10;
    v12 = *v3++;
    v11 = v12;
    v14 = v8-- != 0;
    result = v9 == v11;
  }
  while (v9 == v11 && v14);
  return result;
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1, uint64_t a2, uint64_t a3, __int128 **a4)
{
  unsigned __int8 *v5;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint8x8_t v12;
  unint64_t v13;
  unint64_t v14;
  unsigned __int8 **v15;
  unsigned __int8 *i;
  unint64_t v17;
  float v18;
  float v19;
  _BOOL8 v20;
  unint64_t v21;
  unint64_t v22;
  size_t v23;
  _QWORD *v24;
  unint64_t v25;
  _QWORD v27[3];

  v5 = (unsigned __int8 *)a2;
  v7 = *(_QWORD *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    v8 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(_QWORD *)a2;
    v8 = v7;
  }
  v9 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100]((uint64_t)v27, (uint64_t *)a2, v8);
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 8);
  if (v11)
  {
    v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      v14 = v9;
      if (v9 >= v11)
        v14 = v9 % v11;
    }
    else
    {
      v14 = (v11 - 1) & v9;
    }
    v15 = *(unsigned __int8 ***)(*(_QWORD *)a1 + 8 * v14);
    if (v15)
    {
      for (i = *v15; i; i = *(unsigned __int8 **)i)
      {
        v17 = *((_QWORD *)i + 1);
        if (v17 == v10)
        {
          if ((std::equal_to<std::string>::operator()[abi:nn180100](a1 + 32, i + 16, v5) & 1) != 0)
            return i;
        }
        else
        {
          if (v13 > 1)
          {
            if (v17 >= v11)
              v17 %= v11;
          }
          else
          {
            v17 &= v11 - 1;
          }
          if (v17 != v14)
            break;
        }
      }
    }
  }
  else
  {
    v14 = 0;
  }
  memset(v27, 0, sizeof(v27));
  std::__hash_table<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(a1, v10, a4, v27);
  v18 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v19 = *(float *)(a1 + 32);
  if (!v11 || (float)(v19 * (float)v11) < v18)
  {
    v20 = 1;
    if (v11 >= 3)
      v20 = (v11 & (v11 - 1)) != 0;
    v21 = v20 | (2 * v11);
    v22 = vcvtps_u32_f32(v18 / v19);
    if (v21 <= v22)
      v23 = v22;
    else
      v23 = v21;
    std::__hash_table<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>>>::__rehash<true>(a1, v23);
    v11 = *(_QWORD *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11)
        v14 = v10 % v11;
      else
        v14 = v10;
    }
    else
    {
      v14 = (v11 - 1) & v10;
    }
  }
  v24 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v14);
  if (v24)
  {
    *(_QWORD *)v27[0] = *v24;
    *v24 = v27[0];
  }
  else
  {
    *(_QWORD *)v27[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v27[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v14) = a1 + 16;
    if (*(_QWORD *)v27[0])
    {
      v25 = *(_QWORD *)(*(_QWORD *)v27[0] + 8);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v25 >= v11)
          v25 %= v11;
      }
      else
      {
        v25 &= v11 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v25) = v27[0];
    }
  }
  i = (unsigned __int8 *)v27[0];
  v27[0] = 0;
  ++*(_QWORD *)(a1 + 24);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,void *>>>>::reset[abi:nn180100]((uint64_t)v27, 0);
  return i;
}

void sub_2279F9D80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,void *>>>>::reset[abi:nn180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

void std::__hash_table<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int128 **a3@<X3>, _QWORD *a4@<X8>)
{
  uint64_t v7;
  _QWORD *v8;
  std::string *v9;
  __int128 *v10;
  __int128 v11;

  v7 = a1 + 16;
  *a4 = 0;
  a4[1] = 0;
  a4[2] = 0;
  v8 = operator new(0x38uLL);
  *a4 = v8;
  a4[1] = v7;
  *((_BYTE *)a4 + 16) = 0;
  *v8 = 0;
  v8[1] = a2;
  v9 = (std::string *)(v8 + 2);
  v10 = *a3;
  if (*((char *)*a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)v10, *((_QWORD *)v10 + 1));
  }
  else
  {
    v11 = *v10;
    v8[4] = *((_QWORD *)v10 + 2);
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = v11;
  }
  v8[5] = 0;
  v8[6] = 0;
  *((_BYTE *)a4 + 16) = 1;
}

void sub_2279F9E24(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,void *>>>>::reset[abi:nn180100](v1, 0);
  _Unwind_Resume(a1);
}

void std::__throw_bad_array_new_length[abi:nn180100]()
{
  abort();
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  std::string *v5;
  std::string::size_type v6;
  std::string::size_type v7;
  std::string *v8;

  v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8)
      abort();
    v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17)
      v6 = __sz | 7;
    v7 = v6 + 1;
    v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    v5 = v8;
  }
  else
  {
    *((_BYTE *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

void std::__hash_table<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>>>::__rehash<true>(uint64_t a1, size_t __n)
{
  size_t prime;
  int8x8_t v4;
  unint64_t v5;
  uint8x8_t v6;
  uint64_t v7;

  if (__n == 1)
  {
    prime = 2;
  }
  else
  {
    prime = __n;
    if ((__n & (__n - 1)) != 0)
      prime = std::__next_prime(__n);
  }
  v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(_QWORD *)&v4)
    goto LABEL_16;
  if (prime < *(_QWORD *)&v4)
  {
    v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(_QWORD *)&v4 < 3uLL || (v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      v5 = std::__next_prime(v5);
    }
    else
    {
      v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2)
        v5 = v7;
    }
    if (prime <= v5)
      prime = v5;
    if (prime < *(_QWORD *)&v4)
LABEL_16:
      std::__hash_table<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>>>::__do_rehash<true>(a1, prime);
  }
}

void std::__hash_table<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  uint8x8_t v9;
  void *v10;
  _QWORD *v11;
  unint64_t v12;

  if (a2)
  {
    if (a2 >> 61)
      std::__throw_bad_array_new_length[abi:nn180100]();
    v4 = operator new(8 * a2);
    v5 = *(void **)a1;
    *(_QWORD *)a1 = v4;
    if (v5)
      operator delete(v5);
    v6 = 0;
    *(_QWORD *)(a1 + 8) = a2;
    do
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    v7 = *(_QWORD **)(a1 + 16);
    if (v7)
    {
      v8 = v7[1];
      v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2)
          v8 %= a2;
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v8) = a1 + 16;
      v11 = (_QWORD *)*v7;
      if (*v7)
      {
        do
        {
          v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2)
              v12 %= a2;
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(_QWORD *)(*(_QWORD *)a1 + 8 * v12))
            {
              *(_QWORD *)(*(_QWORD *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            *v7 = *v11;
            *v11 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v12);
            **(_QWORD **)(*(_QWORD *)a1 + 8 * v12) = v11;
            v11 = v7;
          }
          v12 = v8;
LABEL_24:
          v7 = v11;
          v11 = (_QWORD *)*v11;
          v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    v10 = *(void **)a1;
    *(_QWORD *)a1 = 0;
    if (v10)
      operator delete(v10);
    *(_QWORD *)(a1 + 8) = 0;
  }
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,void *>>>>::reset[abi:nn180100](uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__destroy_at[abi:nn180100]<std::pair<std::string const,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,0>((uint64_t)v2 + 16);
    operator delete(v2);
  }
}

void std::__destroy_at[abi:nn180100]<std::pair<std::string const,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,0>(uint64_t a1)
{

  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

void ___ZN12_GLOBAL__N_149topHitNominatedByPommesScoringforBundleIdentifierEP8NSString_block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[20];

  v13[19] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v1 = *MEMORY[0x24BEB0358];
  v13[0] = *MEMORY[0x24BEB04B8];
  v13[1] = v1;
  v2 = *MEMORY[0x24BEB04D0];
  v13[2] = *MEMORY[0x24BEB0378];
  v13[3] = v2;
  v3 = *MEMORY[0x24BEB03C0];
  v13[4] = *MEMORY[0x24BEB0408];
  v13[5] = v3;
  v4 = *MEMORY[0x24BEB03A8];
  v13[6] = *MEMORY[0x24BEB03D8];
  v13[7] = v4;
  v5 = *MEMORY[0x24BEB0370];
  v13[8] = *MEMORY[0x24BEB03E0];
  v13[9] = v5;
  v6 = *MEMORY[0x24BEB04D8];
  v13[10] = *MEMORY[0x24BEB04A8];
  v13[11] = v6;
  v7 = *MEMORY[0x24BEB04F0];
  v13[12] = *MEMORY[0x24BEB0388];
  v13[13] = v7;
  v8 = *MEMORY[0x24BEB0400];
  v13[14] = *MEMORY[0x24BEB0360];
  v13[15] = v8;
  v9 = *MEMORY[0x24BEB0460];
  v13[16] = *MEMORY[0x24BEB0480];
  v13[17] = v9;
  v13[18] = *MEMORY[0x24BEB0468];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v10);
  v11 = objc_claimAutoreleasedReturnValue();

}

void sub_2279FA32C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(uint64_t a1, uint64_t a2, uint64_t a3, __int128 **a4)
{
  unsigned __int8 *v5;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint8x8_t v12;
  unint64_t v13;
  unint64_t v14;
  unsigned __int8 **v15;
  unsigned __int8 *i;
  unint64_t v17;
  _QWORD *v18;
  __int128 *v19;
  __int128 v20;
  float v21;
  float v22;
  _BOOL8 v23;
  unint64_t v24;
  unint64_t v25;
  size_t v26;
  _QWORD *v27;
  unint64_t v28;
  _QWORD v30[2];
  uint64_t v31;

  v5 = (unsigned __int8 *)a2;
  v7 = *(_QWORD *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    v8 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(_QWORD *)a2;
    v8 = v7;
  }
  v9 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100]((uint64_t)v30, (uint64_t *)a2, v8);
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 8);
  if (v11)
  {
    v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      v14 = v9;
      if (v9 >= v11)
        v14 = v9 % v11;
    }
    else
    {
      v14 = (v11 - 1) & v9;
    }
    v15 = *(unsigned __int8 ***)(*(_QWORD *)a1 + 8 * v14);
    if (v15)
    {
      for (i = *v15; i; i = *(unsigned __int8 **)i)
      {
        v17 = *((_QWORD *)i + 1);
        if (v17 == v10)
        {
          if ((std::equal_to<std::string>::operator()[abi:nn180100](a1 + 32, i + 16, v5) & 1) != 0)
            return i;
        }
        else
        {
          if (v13 > 1)
          {
            if (v17 >= v11)
              v17 %= v11;
          }
          else
          {
            v17 &= v11 - 1;
          }
          if (v17 != v14)
            break;
        }
      }
    }
  }
  else
  {
    v14 = 0;
  }
  v31 = 0;
  v18 = operator new(0x38uLL);
  v30[0] = v18;
  v30[1] = a1 + 16;
  *v18 = 0;
  v18[1] = v10;
  v19 = *a4;
  v20 = **a4;
  v18[4] = *((_QWORD *)*a4 + 2);
  *((_OWORD *)v18 + 1) = v20;
  *((_QWORD *)v19 + 1) = 0;
  *((_QWORD *)v19 + 2) = 0;
  *(_QWORD *)v19 = 0;
  v18[5] = 0;
  v18[6] = 0;
  LOBYTE(v31) = 1;
  v21 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v22 = *(float *)(a1 + 32);
  if (!v11 || (float)(v22 * (float)v11) < v21)
  {
    v23 = 1;
    if (v11 >= 3)
      v23 = (v11 & (v11 - 1)) != 0;
    v24 = v23 | (2 * v11);
    v25 = vcvtps_u32_f32(v21 / v22);
    if (v24 <= v25)
      v26 = v25;
    else
      v26 = v24;
    std::__hash_table<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>>>::__rehash<true>(a1, v26);
    v11 = *(_QWORD *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11)
        v14 = v10 % v11;
      else
        v14 = v10;
    }
    else
    {
      v14 = (v11 - 1) & v10;
    }
  }
  v27 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v14);
  if (v27)
  {
    *(_QWORD *)v30[0] = *v27;
    *v27 = v30[0];
  }
  else
  {
    *(_QWORD *)v30[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v30[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v14) = a1 + 16;
    if (*(_QWORD *)v30[0])
    {
      v28 = *(_QWORD *)(*(_QWORD *)v30[0] + 8);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v28 >= v11)
          v28 %= v11;
      }
      else
      {
        v28 &= v11 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v28) = v30[0];
    }
  }
  i = (unsigned __int8 *)v30[0];
  v30[0] = 0;
  ++*(_QWORD *)(a1 + 24);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,void *>>>>::reset[abi:nn180100]((uint64_t)v30, 0);
  return i;
}

void sub_2279FA5E0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,void *>>>>::reset[abi:nn180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

void ___ZN12_GLOBAL__N_122SPQueryFetchAttributesEv_block_invoke()
{
  uint64_t v0;
  void *v1;

  rankingPrefetchedAttributesArray();
  v0 = objc_claimAutoreleasedReturnValue();

}

void ___ZN12_GLOBAL__N_136topHitQueryParametersForSearchStringEP8NSStringP7NSArrayS1_11SPQueryKindbbbbbS4_S1_S1_l_block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  void *v3;

  if (*(_BYTE *)(a1 + 32))
  {

  }
  else
  {

    v2 = &unk_24F025188;
  }

}

uint64_t std::__hash_table<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>>>::__deallocate_node(a1, *(_QWORD **)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>>>::__deallocate_node(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD *v3;

  if (a2)
  {
    v2 = a2;
    do
    {
      v3 = (_QWORD *)*v2;
      std::__destroy_at[abi:nn180100]<std::pair<std::string const,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,0>((uint64_t)(v2 + 2));
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

id `anonymous namespace'::BundleIdToResultMap::addSectionWithBundleIdentifier(_anonymous_namespace_::BundleIdToResultMap *this, NSString *a2, uint64_t a3)
{
  NSString *v5;
  id v6;
  void *v7;
  uint64_t v8;
  unsigned __int8 *v9;
  void *v10;
  void *v11;
  void *__p[2];
  uint64_t v14;
  void **v15;

  __p[0] = 0;
  __p[1] = 0;
  v14 = 0;
  v5 = objc_retainAutorelease(a2);
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)-[NSString UTF8String](v5, "UTF8String"));
  if (std::__hash_table<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>>>::find<std::string>(this, (uint64_t)__p))
  {
    v15 = __p;
    v6 = *((id *)std::__hash_table<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)this, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v15)+ 5);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEB0250], "mutableSectionWithBundleId:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDomain:", 1);
    objc_msgSend(v7, "setDoNotFold:", a3);
    v8 = objc_opt_new();
    v6 = v7;
    v15 = __p;
    v9 = std::__hash_table<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)this, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v15);
    v10 = (void *)*((_QWORD *)v9 + 5);
    *((_QWORD *)v9 + 5) = v6;

    v11 = (void *)*((_QWORD *)v9 + 6);
    *((_QWORD *)v9 + 6) = v8;

  }
  if (SHIBYTE(v14) < 0)
    operator delete(__p[0]);

  return v6;
}

void sub_2279FA834(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  if (a15 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

_QWORD *std::string::basic_string[abi:nn180100]<0>(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    abort();
  v5 = v4;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((_BYTE *)a1 + 23) = v4;
    v6 = a1;
    if (!v4)
      goto LABEL_9;
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

void std::allocator_traits<std::allocator<std::vector<`anonymous namespace'::SPResultValueItem>>>::destroy[abi:nn180100]<std::vector<`anonymous namespace'::SPResultValueItem>,void>(uint64_t *a1)
{
  if (*a1)
  {
    operator delete((void *)*a1);
  }
}

void std::vector<`anonymous namespace'::SPResultValueItem>::__base_destruct_at_end[abi:nn180100](uint64_t a1, uint64_t a2)
{
  uint64_t i;

  for (i = *(_QWORD *)(a1 + 8); i != a2; i -= 48)
  {

  }
  *(_QWORD *)(a1 + 8) = a2;
}

_QWORD *std::allocator_traits<std::allocator<tt_hash_table<`anonymous namespace'::SPResultValueItemHashTableEntry>>>::construct[abi:nn180100]<tt_hash_table<`anonymous namespace'::SPResultValueItemHashTableEntry>,long &,`anonymous namespace'::SPResultValueItemHashTableEntry,void>(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  _QWORD *result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;

  v4 = *a2;
  *(_DWORD *)a1 = *a2;
  *(_QWORD *)(a1 + 8) = 0;
  result = (_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  if ((_DWORD)v4)
  {
    v7 = v4;
    v8 = *(_QWORD *)(a1 + 16);
    v9 = v8 + (v7 << 6);
    do
    {
      v10 = *(_OWORD *)(a3 + 16);
      *(_OWORD *)v8 = *(_OWORD *)a3;
      *(_OWORD *)(v8 + 16) = v10;
      *(_QWORD *)(v8 + 32) = *(id *)(a3 + 32);
      result = *(id *)(a3 + 40);
      v11 = *(_QWORD *)(a3 + 48);
      *(_QWORD *)(v8 + 40) = result;
      *(_QWORD *)(v8 + 48) = v11;
      v8 += 64;
    }
    while (v8 != v9);
    *(_QWORD *)(a1 + 16) = v9;
  }
  return result;
}

char *std::vector<`anonymous namespace'::SPResultValueItemHashTableEntry>::__vallocate[abi:nn180100](_QWORD *a1, unint64_t a2)
{
  char *result;

  if (a2 >> 58)
    abort();
  result = (char *)operator new(a2 << 6);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[64 * a2];
  return result;
}

uint64_t std::__split_buffer<tt_hash_table<`anonymous namespace'::SPResultValueItemHashTableEntry>>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 32;
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::allocator_traits<std::allocator<tt_hash_table<`anonymous namespace'::SPResultValueItemHashTableEntry>>>::destroy[abi:nn180100]<tt_hash_table<`anonymous namespace'::SPResultValueItemHashTableEntry>,void>(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1)
  {
    v3 = *(_QWORD *)(a1 + 16);
    v4 = *(void **)(a1 + 8);
    if (v3 != v1)
    {
      do
      {

        v3 -= 64;
      }
      while (v3 != v1);
      v4 = *(void **)(a1 + 8);
    }
    *(_QWORD *)(a1 + 16) = v1;
    operator delete(v4);
  }
}

_QWORD *std::__split_buffer<`anonymous namespace'::SPResultValueItem>::__split_buffer(_QWORD *a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  char *v7;
  char *v8;

  a1[3] = 0;
  a1[4] = a4;
  if (a2)
  {
    if (a2 >= 0x555555555555556)
      std::__throw_bad_array_new_length[abi:nn180100]();
    v7 = (char *)operator new(48 * a2);
  }
  else
  {
    v7 = 0;
  }
  v8 = &v7[48 * a3];
  *a1 = v7;
  a1[1] = v8;
  a1[2] = v8;
  a1[3] = &v7[48 * a2];
  return a1;
}

uint64_t *std::vector<`anonymous namespace'::SPResultValueItem>::__swap_out_circular_buffer(uint64_t *result, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = *result;
  v3 = result[1];
  v4 = a2[1];
  if (v3 == *result)
  {
    v5 = a2[1];
  }
  else
  {
    do
    {
      v5 = v4 - 48;
      v6 = *(_OWORD *)(v3 - 32);
      *(_OWORD *)(v4 - 48) = *(_OWORD *)(v3 - 48);
      *(_OWORD *)(v4 - 32) = v6;
      v7 = *(_OWORD *)(v3 - 16);
      *(_QWORD *)(v3 - 16) = 0;
      *(_QWORD *)(v3 - 8) = 0;
      *(_OWORD *)(v4 - 16) = v7;
      v3 -= 48;
      v4 -= 48;
    }
    while (v3 != v2);
  }
  a2[1] = v5;
  v8 = *result;
  *result = v5;
  a2[1] = v8;
  v9 = result[1];
  result[1] = a2[2];
  a2[2] = v9;
  v10 = result[2];
  result[2] = a2[3];
  a2[3] = v10;
  *a2 = a2[1];
  return result;
}

uint64_t std::__split_buffer<`anonymous namespace'::SPResultValueItem>::~__split_buffer(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;

  v2 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v2; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 48;

  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::__sift_up[abi:nn180100]<std::_ClassicAlgPolicy,std::greater<`anonymous namespace'::SPResultValueItem> &,std::__wrap_iter<`anonymous namespace'::SPResultValueItem*>>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3;
  unint64_t v6;
  uint64_t v7;
  _OWORD *v8;
  unint64_t v9;
  unint64_t v10;
  double v11;
  int v12;
  float v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  float v22;
  int v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;

  v3 = a3 - 2;
  if (a3 >= 2)
  {
    v6 = v3 >> 1;
    v7 = a1 + 48 * (v3 >> 1);
    v8 = (_OWORD *)(a2 - 48);
    {
      v10 = *(_QWORD *)(a2 - 48);
      v9 = *(_QWORD *)(a2 - 40);
      v11 = *(double *)(a2 - 32);
      v12 = *(_DWORD *)(a2 - 24);
      v13 = *(float *)(a2 - 20);
      v32 = *(_QWORD *)(a2 - 16);
      v33 = *(_QWORD *)(a2 - 8);
      *(_QWORD *)(a2 - 16) = 0;
      *(_QWORD *)(a2 - 8) = 0;
      v14 = *(_OWORD *)(v7 + 16);
      *v8 = *(_OWORD *)v7;
      v8[1] = v14;
      v15 = a1 + 48 * v6;
      v16 = *(_QWORD *)(v15 + 32);
      *(_QWORD *)(v15 + 32) = 0;
      v17 = *(void **)(a2 - 16);
      *(_QWORD *)(a2 - 16) = v16;

      v18 = *(_QWORD *)(v15 + 40);
      *(_QWORD *)(v15 + 40) = 0;
      v19 = *(void **)(a2 - 8);
      *(_QWORD *)(a2 - 8) = v18;

      if (v3 >= 2)
      {
        while (1)
        {
          v21 = v6 - 1;
          v6 = (v6 - 1) >> 1;
          v20 = a1 + 48 * v6;
          if (__PAIR128__(v9, v10) >= *(_OWORD *)v20)
          {
            if (*(_OWORD *)v20 < __PAIR128__(v9, v10))
              break;
            v22 = *(float *)(v20 + 28);
            if (v13 >= v22)
            {
              if (v22 < v13)
                break;
              v23 = *(_DWORD *)(v20 + 24);
              if (v12 >= v23 && (v23 < v12 || v11 >= *(double *)(v20 + 16)))
                break;
            }
          }
          v24 = *(_OWORD *)(v20 + 16);
          *(_OWORD *)v7 = *(_OWORD *)v20;
          *(_OWORD *)(v7 + 16) = v24;
          v25 = a1 + 48 * v6;
          v26 = *(_QWORD *)(v25 + 32);
          *(_QWORD *)(v25 + 32) = 0;
          v27 = *(void **)(v7 + 32);
          *(_QWORD *)(v7 + 32) = v26;

          v28 = *(_QWORD *)(v25 + 40);
          *(_QWORD *)(v25 + 40) = 0;
          v29 = *(void **)(v7 + 40);
          *(_QWORD *)(v7 + 40) = v28;

          v7 = v25;
          if (v21 <= 1)
            goto LABEL_14;
        }
      }
      v20 = v7;
LABEL_14:
      *(_QWORD *)v20 = v10;
      *(_QWORD *)(v20 + 8) = v9;
      *(double *)(v20 + 16) = v11;
      *(_DWORD *)(v20 + 24) = v12;
      *(float *)(v20 + 28) = v13;
      v30 = *(void **)(v20 + 32);
      *(_QWORD *)(v20 + 32) = v32;

      v31 = *(void **)(v20 + 40);
      *(_QWORD *)(v20 + 40) = v33;

    }
  }
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>>>::__erase_unique<std::string>(_QWORD *a1, uint64_t a2)
{
  unsigned __int8 *result;
  _BYTE v4[24];

  result = std::__hash_table<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>>>::find<std::string>(a1, a2);
  if (result)
  {
    std::__hash_table<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>>>::remove(a1, result, (uint64_t)v4);
    std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,void *>>>>::reset[abi:nn180100]((uint64_t)v4, 0);
    return (unsigned __int8 *)1;
  }
  return result;
}

_QWORD *std::__hash_table<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::pair<SFMutableResultSection * {__strong},NSMutableOrderedSet<SPSearchTopHitResult *> * {__strong}>>>>::remove@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X8>)
{
  int8x8_t v3;
  unint64_t v4;
  uint8x8_t v5;
  _QWORD *v6;
  _QWORD *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v3 = (int8x8_t)result[1];
  v4 = a2[1];
  v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v4 >= *(_QWORD *)&v3)
      v4 %= *(_QWORD *)&v3;
  }
  else
  {
    v4 &= *(_QWORD *)&v3 - 1;
  }
  v6 = *(_QWORD **)(*result + 8 * v4);
  do
  {
    v7 = v6;
    v6 = (_QWORD *)*v6;
  }
  while (v6 != a2);
  if (v7 == result + 2)
    goto LABEL_18;
  v8 = v7[1];
  if (v5.u32[0] > 1uLL)
  {
    if (v8 >= *(_QWORD *)&v3)
      v8 %= *(_QWORD *)&v3;
  }
  else
  {
    v8 &= *(_QWORD *)&v3 - 1;
  }
  if (v8 != v4)
  {
LABEL_18:
    if (!*a2)
      goto LABEL_19;
    v9 = *(_QWORD *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v9 >= *(_QWORD *)&v3)
        v9 %= *(_QWORD *)&v3;
    }
    else
    {
      v9 &= *(_QWORD *)&v3 - 1;
    }
    if (v9 != v4)
LABEL_19:
      *(_QWORD *)(*result + 8 * v4) = 0;
  }
  v10 = *a2;
  if (*a2)
  {
    v11 = *(_QWORD *)(v10 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v11 >= *(_QWORD *)&v3)
        v11 %= *(_QWORD *)&v3;
    }
    else
    {
      v11 &= *(_QWORD *)&v3 - 1;
    }
    if (v11 != v4)
    {
      *(_QWORD *)(*result + 8 * v11) = v7;
      v10 = *a2;
    }
  }
  *v7 = v10;
  *a2 = 0;
  --result[3];
  *(_QWORD *)a3 = a2;
  *(_QWORD *)(a3 + 8) = result + 2;
  *(_BYTE *)(a3 + 16) = 1;
  return result;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void siriSettingsDidChange()
{
  dispatch_async((dispatch_queue_t)sUnBlockMainQueue, &__block_literal_global_155);
}

uint64_t _SpotlightInternetDomainsChangedCallback(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_setSearchDomains:", 0);
}

unint64_t sp_analytics_log_timing_with_bundle_id(uint64_t a1, const char *a2, uint64_t a3, void *a4)
{
  id v6;
  unint64_t v7;
  xpc_object_t empty;

  v6 = a4;
  v7 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - a3;
  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_string(empty, "label", a2);
  xpc_dictionary_set_double(empty, "latency", (double)v7 / 1000000000.0);
  if (v6)
    xpc_dictionary_set_string(empty, "bundleid", (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"));
  analytics_send_event();

  return v7;
}

void sub_227A00C68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_227A01864(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,id location)
{
  id *v37;
  uint64_t v38;

  objc_destroyWeak(v37);
  objc_destroyWeak(&location);
  _Block_object_dispose((const void *)(v38 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

id SPAppStoreSearchURLFromQuery(void *a1)
{
  objc_class *v1;
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (a1)
  {
    v1 = (objc_class *)MEMORY[0x24BDD1808];
    v2 = a1;
    v3 = objc_alloc_init(v1);
    objc_msgSend(v3, "setScheme:", CFSTR("itms-apps"));
    objc_msgSend(v3, "setHost:", &stru_24F01C208);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("action"), CFSTR("search"));
    objc_msgSend(v4, "addObject:", v5);

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("term"), v2);
    objc_msgSend(v4, "addObject:", v6);

    objc_msgSend(v3, "setQueryItems:", v4);
    objc_msgSend(v3, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

id SPWebSearchURLFromQuery(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = a1;
  if (v1)
  {
    if (SPWebSearchURLFromQuery_onceToken != -1)
      dispatch_once(&SPWebSearchURLFromQuery_onceToken, &__block_literal_global_17);
    objc_msgSend(MEMORY[0x24BDE81D8], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "defaultSearchEngine");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "searchURLForUserTypedString:", v1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void sub_227A03AE0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_227A03B74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_227A048A8(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_227A048C0(uint64_t a1, int a2)
{
  if (a2)
    objc_terminate();
  JUMPOUT(0x227A048CCLL);
}

void sub_227A04BAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  si_tracing_restore_current_span((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_227A06088(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)&STACK[0x3B0]);
  _Block_object_dispose(&STACK[0x2E0], 8);
  _Block_object_dispose(&STACK[0x340], 8);
  _Block_object_dispose(&STACK[0x360], 8);
  _Unwind_Resume(a1);
}

id _makeQueryStringForField(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v14;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  if (objc_msgSend(v4, "count"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v14 = v4;
    obj = v4;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v17;
      v9 = 1;
      do
      {
        v10 = 0;
        v11 = v7;
        do
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(obj);
          v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10);
          v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithFormat:", CFSTR("%@ = \"%@\""), v3, v12);

          if ((v9 & 1) == 0)
            objc_msgSend(v7, "appendFormat:", CFSTR("|| %@ = \"%@\""), v3, v12);
          v9 = 0;
          ++v10;
          v11 = v7;
        }
        while (v6 != v10);
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        v9 = 0;
      }
      while (v6);
    }
    else
    {
      v7 = 0;
    }

    v4 = v14;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void sub_227A08308(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)&STACK[0x2C8]);
  _Block_object_dispose(&STACK[0x2D0], 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_227A09840(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  si_tracing_restore_current_span((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_227A0AC20(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_227A0ADD0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

unsigned int *SPResultValueItemCreate2(void *a1)
{
  id v1;
  void *v2;
  unsigned int *v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  void *v18;
  void *v19;
  double v20;
  uint64_t v21;
  void *v22;
  unsigned int v23;
  void *v25;
  _QWORD v26[8];

  v26[7] = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(v1, "attributeSet");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "attributeDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unsigned int *)malloc_type_calloc(1uLL, 0x50uLL, 0x1080040DC77DE92uLL);
  atomic_store(1u, v3);
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BDC2388]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "length") == 16)
    {
      v5 = (_QWORD *)objc_msgSend(objc_retainAutorelease(v4), "bytes");
      v6 = v5[1];
      *((_QWORD *)v3 + 2) = *v5;
      *((_QWORD *)v3 + 3) = v6;
    }
  }
  if (!SPResultValueItemCreate2_dateAttributeNames)
  {
    v7 = *MEMORY[0x24BDC1EE8];
    v26[0] = *MEMORY[0x24BDC21F8];
    v26[1] = v7;
    v8 = *MEMORY[0x24BDC2220];
    v26[2] = *MEMORY[0x24BDC1C00];
    v26[3] = v8;
    v9 = *MEMORY[0x24BDC1B28];
    v26[4] = *MEMORY[0x24BDC1C20];
    v26[5] = v9;
    v26[6] = *MEMORY[0x24BDC1B58];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)SPResultValueItemCreate2_dateAttributeNames;
    SPResultValueItemCreate2_dateAttributeNames = v10;

    SPResultValueItemCreate2_dateAttributeCount = objc_msgSend((id)SPResultValueItemCreate2_dateAttributeNames, "count");
  }
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BDC1AE8]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.mobilemail")) & 1) != 0)
  {
    objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BDC1B58]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v3[12] = 1;
      objc_msgSend(v13, "timeIntervalSinceReferenceDate");
      *((_QWORD *)v3 + 5) = v15;
    }
LABEL_17:

    goto LABEL_18;
  }
  if (SPResultValueItemCreate2_dateAttributeCount)
  {
    v16 = 0;
    v17 = 0;
    while (1)
    {
      objc_msgSend((id)SPResultValueItemCreate2_dateAttributeNames, "objectAtIndexedSubscript:", v16);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "objectForKey:", v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18)
      {
        objc_msgSend(v18, "timeIntervalSinceReferenceDate");
        if (v20 > 0.0)
          break;
      }

      v16 = ++v17;
      if (SPResultValueItemCreate2_dateAttributeCount <= (unint64_t)v17)
        goto LABEL_18;
    }
    v3[12] = SPResultValueItemCreate2_dateAttributeCount - v17;
    objc_msgSend(v19, "timeIntervalSinceReferenceDate");
    *((_QWORD *)v3 + 5) = v21;

    goto LABEL_17;
  }
LABEL_18:
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BDC1BC8]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "floatValue");
  v3[13] = v23;

  *((_QWORD *)v3 + 4) = (id)objc_msgSend(v1, "protection");
  *((_QWORD *)v3 + 8) = CFRetain(v1);

  return v3;
}

void sprvdestroyResultValueArray2(CFTypeRef *a1)
{
  CFRelease(a1[8]);
  free(a1);
}

void sprvreleaseCallback(uint64_t a1, uint64_t a2)
{
  unsigned int v3;
  unsigned int v4;

  do
  {
    v3 = __ldaxr((unsigned int *)a2);
    v4 = v3 - 1;
  }
  while (__stlxr(v4, (unsigned int *)a2));
  if (!v4)
  {
    CFRelease(*(CFTypeRef *)(a2 + 64));
    free((void *)a2);
  }
}

unsigned int *sprvretainCallback(uint64_t a1, unsigned int *a2)
{
  unsigned int *result;
  unsigned int v3;

  result = a2;
  do
    v3 = __ldaxr(a2);
  while (__stlxr(v3 + 1, a2));
  return result;
}

uint64_t sprvcompareResultArrays(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  float v4;
  float v5;
  int v6;
  int v7;
  double v9;
  double v10;

  v3 = *(_QWORD *)(a1 + 16);
  v2 = *(_QWORD *)(a1 + 24);
  if (*(_OWORD *)(a2 + 16) < __PAIR128__(v2, v3))
    return 1;
  if (__PAIR128__(v2, v3) < *(_OWORD *)(a2 + 16))
    return -1;
  v4 = *(float *)(a1 + 52);
  v5 = *(float *)(a2 + 52);
  if (v4 > v5)
    return 1;
  if (v4 < v5)
    return -1;
  v6 = *(_DWORD *)(a1 + 48);
  v7 = *(_DWORD *)(a2 + 48);
  if (v6 > v7)
    return 1;
  if (v6 < v7)
    return -1;
  v9 = *(double *)(a1 + 40);
  v10 = *(double *)(a2 + 40);
  if (v9 > v10)
    return 1;
  if (v9 >= v10)
    return 0;
  else
    return -1;
}

uint64_t sprvcompareRecencyResultArrays(uint64_t a1, uint64_t a2)
{
  double v2;
  double v3;
  uint64_t v4;

  v2 = *(double *)(a1 + 40);
  v3 = *(double *)(a2 + 40);
  if (v2 >= v3)
    v4 = 0;
  else
    v4 = -1;
  if (v2 > v3)
    return 1;
  else
    return v4;
}

uint64_t BOOLValueForAttr(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v2 = objc_msgSend(v1, "BOOLValue");
  else
    v2 = 0;

  return v2;
}

id getURLString(void *a1)
{
  id v1;
  id v2;
  void *v3;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v1, "absoluteString");
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v3 = 0;
      goto LABEL_7;
    }
    v2 = v1;
  }
  v3 = v2;
LABEL_7:

  return v3;
}

void sub_227A12AEC(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x2E0], 8);
  _Unwind_Resume(a1);
}

void ___ZN12_GLOBAL__N_117updateMailVIPListEv_block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_0(&dword_2279CC000, a3, (uint64_t)a3, "** Mail VIP Widget failed to connect to MailServices: %@", (uint8_t *)a2);

}

void ___ZN12_GLOBAL__N_117updateMailVIPListEv_block_invoke_535_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_0(&dword_2279CC000, a2, a3, "There was an XPC error when fetching VIPs: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

uint64_t AFAssistantRestricted()
{
  return MEMORY[0x24BE08BB0]();
}

uint64_t AFSupportPreferencesSynchronize()
{
  return MEMORY[0x24BE09050]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

void CFBinaryHeapAddValue(CFBinaryHeapRef heap, const void *value)
{
  MEMORY[0x24BDBB990](heap, value);
}

CFBinaryHeapRef CFBinaryHeapCreate(CFAllocatorRef allocator, CFIndex capacity, const CFBinaryHeapCallBacks *callBacks, const CFBinaryHeapCompareContext *compareContext)
{
  return (CFBinaryHeapRef)MEMORY[0x24BDBB9A8](allocator, capacity, callBacks, compareContext);
}

CFIndex CFBinaryHeapGetCount(CFBinaryHeapRef heap)
{
  return MEMORY[0x24BDBB9B0](heap);
}

void CFBinaryHeapGetValues(CFBinaryHeapRef heap, const void **values)
{
  MEMORY[0x24BDBB9C0](heap, values);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x24BDBBF10](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

uint64_t CSRedactString()
{
  return MEMORY[0x24BDC19A0]();
}

uint64_t DCSCopyActiveDictionaries()
{
  return MEMORY[0x24BE2CB20]();
}

uint64_t DCSSearchFoundationCopyResultsWithOptions()
{
  return MEMORY[0x24BE2CB68]();
}

uint64_t MDPurgeTokenizers()
{
  return MEMORY[0x24BE66708]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x24BED8490]();
}

NSMapEnumerator *__cdecl NSEnumerateMapTable(NSMapEnumerator *__return_ptr retstr, NSMapTable *table)
{
  return (NSMapEnumerator *)MEMORY[0x24BDD0BD8](retstr, table);
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD0DD8]();
}

void *__cdecl NSMapGet(NSMapTable *table, const void *key)
{
  return (void *)MEMORY[0x24BDD1018](table, key);
}

void NSMapInsert(NSMapTable *table, const void *key, const void *value)
{
  MEMORY[0x24BDD1020](table, key, value);
}

BOOL NSNextMapEnumeratorPair(NSMapEnumerator *enumerator, void **key, void **value)
{
  return MEMORY[0x24BDD10F0](enumerator, key, value);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

uint64_t PRSLogCategoryDefault()
{
  return MEMORY[0x24BEB0330]();
}

uint64_t PRSRankingItemRankerAddJunkFilter()
{
  return MEMORY[0x24BEB03D0]();
}

uint64_t PRSRankingQueryIndexDictionary()
{
  return MEMORY[0x24BEB0490]();
}

uint64_t SDTraceAdd()
{
  return MEMORY[0x24BEB00B0]();
}

uint64_t SIGetCompletionOptionsFromRankingWeights()
{
  return MEMORY[0x24BE67398]();
}

uint64_t SISetCompletionRankingWeights()
{
  return MEMORY[0x24BE67490]();
}

uint64_t SPBuildApplicationNames()
{
  return MEMORY[0x24BE849C0]();
}

uint64_t SPCopyVisibleApps()
{
  return MEMORY[0x24BE849D0]();
}

uint64_t SPDomains()
{
  return MEMORY[0x24BE849D8]();
}

uint64_t SPFastApplicationsGetNoBuild()
{
  return MEMORY[0x24BE849E8]();
}

uint64_t SPFastApplicationsNamesGetNoBuild()
{
  return MEMORY[0x24BE849F0]();
}

uint64_t SPFastHiddenAppsGetNoBuild()
{
  return MEMORY[0x24BE849F8]();
}

uint64_t SPGenreGroupingEnabled()
{
  return MEMORY[0x24BE84A00]();
}

uint64_t SPGetDisabledAppSet()
{
  return MEMORY[0x24BE84A08]();
}

uint64_t SPGetDisabledBundleSet()
{
  return MEMORY[0x24BE84A10]();
}

uint64_t SPGetDisabledDomainSet()
{
  return MEMORY[0x24BE84A18]();
}

uint64_t SPGetDisabledDomains()
{
  return MEMORY[0x24BE84A20]();
}

uint64_t SPHideSearchThroughSuggestions()
{
  return MEMORY[0x24BE84A28]();
}

uint64_t SPL1Threshold()
{
  return MEMORY[0x24BE84A30]();
}

uint64_t SPL2Threshold()
{
  return MEMORY[0x24BE84A38]();
}

uint64_t SPLogForSPLogCategoryDefault()
{
  return MEMORY[0x24BE84A40]();
}

uint64_t SPLogForSPLogCategoryQuery()
{
  return MEMORY[0x24BE84A48]();
}

uint64_t SPLogForSPLogCategoryTelemetry()
{
  return MEMORY[0x24BE84A50]();
}

uint64_t SPLogInit()
{
  return MEMORY[0x24BE84A58]();
}

uint64_t SPMaxCountTopHits()
{
  return MEMORY[0x24BE84A60]();
}

uint64_t SPMaxSectionsBeforeShowMore()
{
  return MEMORY[0x24BE84A68]();
}

uint64_t SPMaxSectionsBeforeShowMoreWithScopedSearch()
{
  return MEMORY[0x24BE84A70]();
}

uint64_t SPMaxVisibleResultsCountPerSection()
{
  return MEMORY[0x24BE84A78]();
}

uint64_t SPMinTopHitThresholdForBigResult()
{
  return MEMORY[0x24BE84A80]();
}

uint64_t SPSetAppsChangedBlockClient()
{
  return MEMORY[0x24BE84AB0]();
}

uint64_t SSAppNameForBundleId()
{
  return MEMORY[0x24BEB0508]();
}

uint64_t SSBundleIdentifiersForSyndicatedPhotos()
{
  return MEMORY[0x24BEB0510]();
}

uint64_t SSCompactRankingAttrsAlloc()
{
  return MEMORY[0x24BEB0520]();
}

uint64_t SSCompactRankingAttrsCopy()
{
  return MEMORY[0x24BEB0528]();
}

uint64_t SSCompactRankingAttrsGetValue()
{
  return MEMORY[0x24BEB0530]();
}

uint64_t SSCompactRankingAttrsInsertValue()
{
  return MEMORY[0x24BEB0538]();
}

uint64_t SSCompactRankingAttrsUpdateValue()
{
  return MEMORY[0x24BEB0540]();
}

uint64_t SSCreateAsTypedSuggestion()
{
  return MEMORY[0x24BEB0550]();
}

uint64_t SSDefaultQueryParseResultsForQueryString()
{
  return MEMORY[0x24BEB0558]();
}

uint64_t SSDefaultsGetResources()
{
  return MEMORY[0x24BEB0560]();
}

uint64_t SSDefaultsLogForTrigger()
{
  return MEMORY[0x24BEB0568]();
}

uint64_t SSDefaultsSetResources()
{
  return MEMORY[0x24BEB0570]();
}

uint64_t SSDisplayLateServerSuggestions()
{
  return MEMORY[0x24BEB0578]();
}

uint64_t SSEnableAppSearchV2()
{
  return MEMORY[0x24BEB0580]();
}

uint64_t SSEnableLocalDetailText()
{
  return MEMORY[0x24BEB0588]();
}

uint64_t SSEnableSpotlightTopHitPersonalizedRanking()
{
  return MEMORY[0x24BEB0590]();
}

uint64_t SSGetCurrentLocale()
{
  return MEMORY[0x24BEB05A8]();
}

uint64_t SSIsCounterFactual()
{
  return MEMORY[0x24BEB05B8]();
}

uint64_t SSMaxSectionsBelowSuggestions()
{
  return MEMORY[0x24BEB05C8]();
}

uint64_t SSNormalizedQueryString()
{
  return MEMORY[0x24BEB05D8]();
}

uint64_t SSPhraseQueryEscapeString()
{
  return MEMORY[0x24BEB05F8]();
}

uint64_t SSPreferLocalResultsOnLocalEngagment()
{
  return MEMORY[0x24BEB0600]();
}

uint64_t SSPriorityIndexDelayMilliseconds()
{
  return MEMORY[0x24BEB0608]();
}

uint64_t SSPriorityIndexFastPathEnabled()
{
  return MEMORY[0x24BEB0610]();
}

uint64_t SSPriorityIndexLimitBundles()
{
  return MEMORY[0x24BEB0618]();
}

uint64_t SSQueryParseResultsForQueryString()
{
  return MEMORY[0x24BEB0620]();
}

uint64_t SSQueryParserCancelWithReferenceDict()
{
  return MEMORY[0x24BEB0628]();
}

uint64_t SSQueryParserCooldown()
{
  return MEMORY[0x24BEB0630]();
}

uint64_t SSQueryParserPreheat()
{
  return MEMORY[0x24BEB0638]();
}

uint64_t SSQueryParserStripKindFromString()
{
  return MEMORY[0x24BEB0640]();
}

uint64_t SSScreenTimeStatusClearCache()
{
  return MEMORY[0x24BEB0658]();
}

uint64_t SSSectionIsSyndicatedPhotos()
{
  return MEMORY[0x24BEB0708]();
}

uint64_t SSSetTopHitWithReasonString()
{
  return MEMORY[0x24BEB0710]();
}

uint64_t SSSetTopHitWithReasonType()
{
  return MEMORY[0x24BEB0718]();
}

uint64_t SSShowMusicRec()
{
  return MEMORY[0x24BEB0728]();
}

uint64_t SSSnippetModernizationEnabled()
{
  return MEMORY[0x24BEB0730]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _MDCreateSimpleQueryEvaluatorWithBlock()
{
  return MEMORY[0x24BE67518]();
}

uint64_t _MDSimpleQueryDeallocate()
{
  return MEMORY[0x24BE67520]();
}

uint64_t _MDSimpleQueryObjectMatches()
{
  return MEMORY[0x24BE67528]();
}

uint64_t _MDSimpleQuerySetWidcardAttributes()
{
  return MEMORY[0x24BE67530]();
}

uint64_t _MDStringPrefixOfString()
{
  return MEMORY[0x24BE67538]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x24BEDABE8](__n);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_24F01A9E8(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24F01A9F0(__sz);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_guard_abort(__guard *a1)
{
  MEMORY[0x24BEDB940](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x24BEDB948](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x24BEDB950](a1);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

uint64_t analytics_send_event()
{
  return MEMORY[0x24BE1A1E8]();
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x24BDAD200](a1, a2);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x24BDAD9C0](*(_QWORD *)&__clock_id);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
  MEMORY[0x24BDADC70](iterations, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x24BDADD18](flags, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x24BDADD20](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDB8](group, queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

uint64_t dispatch_queue_attr_make_with_overcommit()
{
  return MEMORY[0x24BDADEC0]();
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED8](label, attr, target);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint64_t getAppCorrectionIfAny()
{
  return MEMORY[0x24BEB00B8]();
}

uint64_t handleHiddenResult()
{
  return MEMORY[0x24BEB0750]();
}

uint64_t isImageOrVideoContentType()
{
  return MEMORY[0x24BEB0758]();
}

uint64_t isMessagesAttachmentCoreSpotlightId()
{
  return MEMORY[0x24BEB0768]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x24BDAE958]();
}

uint64_t logForCSLogCategoryDefault()
{
  return MEMORY[0x24BDC2588]();
}

uint64_t logForCSLogCategoryPersonalization()
{
  return MEMORY[0x24BDC2590]();
}

uint64_t logForCSLogCategoryQuery()
{
  return MEMORY[0x24BDC2598]();
}

uint64_t logForCSLogCategoryRecs()
{
  return MEMORY[0x24BDC25A0]();
}

uint64_t looksLikeURL()
{
  return MEMORY[0x24BEB07D8]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

uint64_t md_tracing_dispatch_async_propagating()
{
  return MEMORY[0x24BE66868]();
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

uint32_t notify_check(int token, int *check)
{
  return MEMORY[0x24BDAF140](*(_QWORD *)&token, check);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x24BDAF168](name, out_token);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x24BEDD070]();
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

void objc_terminate(void)
{
  MEMORY[0x24BEDD450]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x24BDAF408](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x24BDAF438]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x24BDAF4D8]();
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8C0](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x24BDAF8C8](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x24BDAFA10]();
}

uint64_t rankingAttributeNameArray()
{
  return MEMORY[0x24BEB07F0]();
}

uint64_t rankingPrefetchedAttributesArray()
{
  return MEMORY[0x24BEB07F8]();
}

uint64_t si_tracing_calc_next_spanid()
{
  return MEMORY[0x24BE66878]();
}

uint64_t si_tracing_log_span_begin()
{
  return MEMORY[0x24BE66890]();
}

uint64_t si_tracing_log_span_end()
{
  return MEMORY[0x24BE66898]();
}

uint64_t strippedURL()
{
  return MEMORY[0x24BEB0800]();
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

uint64_t tracing_dispatch_apply()
{
  return MEMORY[0x24BE668A0]();
}

uint64_t tracing_dispatch_async()
{
  return MEMORY[0x24BE668A8]();
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x24BDB08D0]();
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
  MEMORY[0x24BDB0998](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

