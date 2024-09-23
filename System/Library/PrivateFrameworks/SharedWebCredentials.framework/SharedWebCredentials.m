void sub_1A855BC3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A855BD18(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A855C15C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  void *v20;

  _Unwind_Resume(a1);
}

id _SWCGetBundle()
{
  if (qword_1ED1B62A8 != -1)
    dispatch_once(&qword_1ED1B62A8, &__block_literal_global_5);
  return (id)_MergedGlobals_5;
}

void sub_1A855C414(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t _SWCIsAuditTokenEntitled(_OWORD *a1, int a2)
{
  void *v4;
  __int128 v5;
  pid_t v6;
  NSObject *v7;
  void *v8;
  int v9;
  NSObject *v10;
  id v11;
  void *v12;
  id v13;
  const void *bytes_ptr;
  id v15;
  int Filtered;
  id v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  char v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  const char *v28;
  audit_token_t v29;
  _BYTE buf[12];
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1A85D4B3C]();
  v5 = a1[1];
  *(_OWORD *)v29.val = *a1;
  *(_OWORD *)&v29.val[4] = v5;
  v6 = audit_token_to_pid(&v29);
  if (qword_1ED1B6278 != -1)
    dispatch_once(&qword_1ED1B6278, &__block_literal_global_93);
  v7 = qword_1ED1B6270;
  if (os_log_type_enabled((os_log_t)qword_1ED1B6270, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v6;
    _os_log_debug_impl(&dword_1A855A000, v7, OS_LOG_TYPE_DEBUG, "Checking connection from %llu for various SWC-tracked entitlements", buf, 0xCu);
  }
  if (qword_1ED1B6320
    && (+[_SWCPrefs sharedPrefs](_SWCPrefs, "sharedPrefs"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isAppleInternal"),
        v8,
        v9))
  {
    if (qword_1ED1B6278 != -1)
      dispatch_once(&qword_1ED1B6278, &__block_literal_global_93);
    v10 = qword_1ED1B6270;
    if (os_log_type_enabled((os_log_t)qword_1ED1B6270, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = v6;
      v31 = 2114;
      v32 = qword_1ED1B6320;
      _os_log_impl(&dword_1A855A000, v10, OS_LOG_TYPE_DEFAULT, "Using artificially-enforced entitlements for %llu: %{public}@", buf, 0x16u);
    }
    v11 = (id)qword_1ED1B6320;
  }
  else
  {
    v12 = (void *)xpc_copy_entitlements_data_for_token();
    if (v12)
    {
      v13 = objc_alloc(MEMORY[0x1E0C99D50]);
      bytes_ptr = xpc_data_get_bytes_ptr(v12);
      v15 = (id)objc_msgSend(v13, "initWithBytesNoCopy:length:freeWhenDone:", bytes_ptr, xpc_data_get_length(v12), 0);
      if (qword_1ED1B6288 != -1)
        dispatch_once(&qword_1ED1B6288, &__block_literal_global_95);
      *(_QWORD *)buf = 0;
      Filtered = _CFPropertyListCreateFiltered();
      v17 = *(id *)buf;
      if (Filtered && (v18 = _NSIsNSDictionary(), v17 = *(id *)buf, v18))
      {
        v17 = *(id *)buf;
        v11 = v17;
      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  if (v11)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("com.apple.private.associated-domains"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqual:", MEMORY[0x1E0C9AAB0]);

    if (((v20 | a2) & 1) == 0)
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("com.apple.private.canGetAppLinkInfo"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v20) = objc_msgSend(v21, "isEqual:", MEMORY[0x1E0C9AAB0]);

    }
    if ((v20 & 1) != 0
      || (objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("com.apple.private.canModifyAppLinkPermissions")),
          v22 = (void *)objc_claimAutoreleasedReturnValue(),
          v23 = objc_msgSend(v22, "isEqual:", MEMORY[0x1E0C9AAB0]),
          v22,
          (v23 & 1) != 0))
    {
      v24 = 1;
LABEL_36:
      if (qword_1ED1B6278 != -1)
        dispatch_once(&qword_1ED1B6278, &__block_literal_global_93);
      v26 = qword_1ED1B6270;
      if (os_log_type_enabled((os_log_t)qword_1ED1B6270, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218498;
        *(_QWORD *)&buf[4] = v6;
        if (a2)
          v28 = "read-write";
        else
          v28 = "read-only";
        v31 = 2082;
        v32 = (uint64_t)v28;
        v33 = 1024;
        v34 = v24;
        _os_log_debug_impl(&dword_1A855A000, v26, OS_LOG_TYPE_DEBUG, "Connection from %llu entitled for %{public}s access? %{BOOL}i", buf, 0x1Cu);
      }
      goto LABEL_39;
    }
  }
  if (qword_1ED1B6320 || v6 != getpid())
  {
    v24 = 0;
    goto LABEL_36;
  }
  if (qword_1ED1B6278 != -1)
    dispatch_once(&qword_1ED1B6278, &__block_literal_global_93);
  v25 = qword_1ED1B6270;
  if (os_log_type_enabled((os_log_t)qword_1ED1B6270, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v6;
    _os_log_debug_impl(&dword_1A855A000, v25, OS_LOG_TYPE_DEBUG, "Treating connection from self (%llu) as entitled", buf, 0xCu);
  }
  v24 = 1;
LABEL_39:

  objc_autoreleasePoolPop(v4);
  return v24;
}

void sub_1A855C908(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A855D370(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, void *a10, void *a11)
{
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

id _SWCGetServerConnection()
{
  void *v0;
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  os_unfair_lock_lock(&gLock);
  v0 = (void *)_MergedGlobals_3;
  if (!_MergedGlobals_3)
  {
    v1 = (void *)MEMORY[0x1A85D4B3C]();
    v2 = gTestListener;
    v3 = objc_alloc(MEMORY[0x1E0CB3B38]);
    v4 = v3;
    if (v2)
    {
      objc_msgSend((id)gTestListener, "endpoint");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v4, "initWithListenerEndpoint:", v5);
      v7 = (void *)_MergedGlobals_3;
      _MergedGlobals_3 = v6;

    }
    else
    {
      v8 = objc_msgSend(v3, "initWithMachServiceName:options:", CFSTR("com.apple.SharedWebCredentials"), 4096);
      v5 = (void *)_MergedGlobals_3;
      _MergedGlobals_3 = v8;
    }

    _SWCGetServerInterface();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)_MergedGlobals_3, "setRemoteObjectInterface:", v9);

    objc_msgSend((id)_MergedGlobals_3, "setInterruptionHandler:", &__block_literal_global_3);
    objc_msgSend((id)_MergedGlobals_3, "setInvalidationHandler:", &__block_literal_global_3);
    objc_msgSend((id)_MergedGlobals_3, "resume");
    objc_autoreleasePoolPop(v1);
    v0 = (void *)_MergedGlobals_3;
  }
  v10 = v0;
  os_unfair_lock_unlock(&gLock);
  return v10;
}

void sub_1A855D56C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id _SWCGetServerInterface()
{
  if (qword_1ED1B6268 != -1)
    dispatch_once(&qword_1ED1B6268, &__block_literal_global_4);
  return (id)qword_1ED1B6260;
}

void ___ZL6getLogv_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.swc", "pattern");
  v1 = (void *)qword_1ED1B6160;
  qword_1ED1B6160 = (uint64_t)v0;

}

void ___ZL6getLogv_block_invoke_0()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.swc", "settings");
  v1 = (void *)qword_1ED1B6190;
  qword_1ED1B6190 = (uint64_t)v0;

}

void ___ZL6getLogv_block_invoke_1()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.swc", "cbx");
  v1 = (void *)qword_1ED1B61C0;
  qword_1ED1B61C0 = (uint64_t)v0;

}

void ___ZL6getLogv_block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.swc", "db");
  v1 = (void *)qword_1ED1B6238;
  qword_1ED1B6238 = (uint64_t)v0;

}

void ___ZL6getLogv_block_invoke_3()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.swc", "xpc");
  v1 = (void *)qword_1ED1B6270;
  qword_1ED1B6270 = (uint64_t)v0;

}

void ___ZL6getLogv_block_invoke_4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.swc", "tracking-domains");
  v1 = (void *)qword_1ED1B62C0;
  qword_1ED1B62C0 = (uint64_t)v0;

}

void ___ZL6getLogv_block_invoke_5()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.swc", "domain");
  v1 = (void *)qword_1ED1B62E0;
  qword_1ED1B62E0 = (uint64_t)v0;

}

void sub_1A855D744(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A855DCD8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A855DE68(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A855E014(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A855E0DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  uint64_t v13;

  std::__hash_table<std::__hash_value_type<std::string_view,SWCSubstitutionVariable const*>,std::__unordered_map_hasher<std::string_view,std::__hash_value_type<std::string_view,SWCSubstitutionVariable const*>,std::hash<std::string_view>,std::equal_to<std::string_view>,true>,std::__unordered_map_equal<std::string_view,std::__hash_value_type<std::string_view,SWCSubstitutionVariable const*>,std::equal_to<std::string_view>,std::hash<std::string_view>,true>,std::allocator<std::__hash_value_type<std::string_view,SWCSubstitutionVariable const*>>>::~__hash_table(v13);

  _Unwind_Resume(a1);
}

unint64_t SWCPatternStorage::evaluate(SWCPatternStorage *this, NSURLComponents *a2, const SWCFNMatch *a3, const audit_token_t *a4)
{
  SWCPatternStorage *v6;
  const char *cStrings;
  unsigned int v8;
  unsigned int v9;
  SWCPatternStorage *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  unint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t result;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  __CFString *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  __CFString *v37;
  __CFString *v38;
  void *v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  id v43;
  unint64_t v44;
  __CFString *v45;
  void *v46;
  __CFString *v47;
  void *v48;
  void *v49;
  __CFString *v50;
  void *v51;
  unint64_t v52;
  void *context;
  unsigned int v55;
  const char *v57[2];
  char v58;
  const char *v59;
  size_t v60;
  char v61;
  const char *v62;
  size_t v63;
  char v64;
  char *v65;
  size_t v66;
  char v67;
  _QWORD v68[2];
  void (*v69)(uint64_t, uint64_t, void *);
  void *v70;
  id v71;
  const char **v72;
  uint64_t *v73;
  const SWCFNMatch *v74;
  unsigned int v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t v83;
  _BYTE v84[128];
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  void *(*v88)(uint64_t, uint64_t);
  uint64_t (*v89)();
  void *v90;
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  if (!a2 || (v6 = this, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "SWCPatternMatchResult SWCPatternStorage::evaluate(NSURLComponents *const __strong, const SWCFNMatch *, const audit_token_t *) const");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "handleFailureInFunction:file:lineNumber:description:", v48, CFSTR("SWCPattern.mm"), 1503, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("components && [components isKindOfClass:[NSURLComponents class]]"));
    v6 = this;

  }
  context = (void *)MEMORY[0x1A85D4B3C]();
  cStrings = v6->cStrings;
  v8 = *(_BYTE *)v6;
  LOBYTE(v65) = 0;
  v67 = 0;
  if ((v8 & 2) != 0)
  {
    v65 = v6->cStrings;
    v66 = strlen(v6->cStrings);
    v67 = 1;
    cStrings += v66 + 1;
  }
  LOBYTE(v62) = 0;
  v64 = 0;
  if ((v8 & 4) != 0)
  {
    v62 = cStrings;
    v63 = strlen(cStrings);
    v64 = 1;
    cStrings += v63 + 1;
  }
  LOBYTE(v59) = 0;
  v61 = 0;
  v9 = ((v8 >> 3) & 3) - 3;
  if (v9 >= 0xFFFFFFFE)
  {
    v59 = cStrings;
    v60 = strlen(cStrings);
    v61 = 1;
    cStrings += v60 + 1;
  }
  if ((v8 & 0x80) != 0)
  {
    v57[0] = cStrings;
    v57[1] = (const char *)strlen(cStrings);
    v58 = 1;
    if (!SWCPatternStorage::_CheckEntitlement((uint64_t)a4, v57))
    {
      v85 = "com.apple.private.associated-domains.ignore-required-entitlements";
      v86 = 65;
      if (!SWCPatternStorage::_CheckEntitlement((uint64_t)a4, &v85))
        goto LABEL_44;
    }
  }
  v55 = (v8 >> 1) & 0x10;
  if ((v8 & 2) != 0)
  {
    if (((v8 >> 6) & 1) != 0)
      -[NSURLComponents path](a2, "path");
    else
      -[NSURLComponents percentEncodedPath](a2, "percentEncodedPath");
    v11 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v11;
    v14 = &stru_1E547D930;
    if (v11)
      v14 = (__CFString *)v11;
    v15 = v14;

    v12 = SWCPatternStorage::_EvaluateString(v15, (unint64_t)&v65, (uint64_t)a3, v55, 1);
    if ((v8 & 4) == 0)
    {
LABEL_32:
      if (v9 < 0xFFFFFFFE)
      {
        v10 = this;
        goto LABEL_73;
      }
      if (v12)
      {
LABEL_37:
        v52 = v12;
        v10 = this;
        v21 = (*(_BYTE *)this >> 3) & 3;
        if (v21 == 1)
        {
          if (((v8 >> 6) & 1) != 0)
            -[NSURLComponents query](a2, "query");
          else
            -[NSURLComponents percentEncodedQuery](a2, "percentEncodedQuery");
          v23 = objc_claimAutoreleasedReturnValue();
          v46 = (void *)v23;
          v47 = &stru_1E547D930;
          if (v23)
            v47 = (__CFString *)v23;
          v45 = v47;

          v10 = this;
          v44 = SWCPatternStorage::_EvaluateString(v45, (unint64_t)&v59, (uint64_t)a3, v55, 0);
        }
        else
        {
          if (v21 != 2)
            goto LABEL_73;
          if (((v8 >> 6) & 1) != 0)
            -[NSURLComponents queryItems](a2, "queryItems");
          else
            -[NSURLComponents percentEncodedQueryItems](a2, "percentEncodedQueryItems");
          v22 = objc_claimAutoreleasedReturnValue();
          v25 = (void *)v22;
          v26 = (void *)MEMORY[0x1E0C9AA60];
          if (v22)
            v26 = (void *)v22;
          v50 = v26;

          v80 = 0;
          v81 = &v80;
          v82 = 0x2020000000;
          v83 = 200;
          v49 = (void *)MEMORY[0x1A85D4B3C]();
          v85 = 0;
          v86 = (uint64_t)&v85;
          v87 = 0x43012000000;
          v88 = __Block_byref_object_copy_;
          v89 = __Block_byref_object_dispose_;
          v90 = &unk_1A85759FB;
          SWCPatternStorage::_ReconstituteQueryJSON(&v59);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27)
          {
            v28 = objc_alloc_init(MEMORY[0x1E0C99E20]);
            v78 = 0u;
            v79 = 0u;
            v76 = 0u;
            v77 = 0u;
            v29 = v50;
            v30 = -[__CFString countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v76, v84, 16);
            if (v30)
            {
              v31 = *(_QWORD *)v77;
              do
              {
                for (i = 0; i != v30; ++i)
                {
                  if (*(_QWORD *)v77 != v31)
                    objc_enumerationMutation(v29);
                  v33 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
                  objc_msgSend(v33, "name");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v33, "value");
                  v35 = objc_claimAutoreleasedReturnValue();
                  v36 = (void *)v35;
                  if (v35)
                    v37 = (__CFString *)v35;
                  else
                    v37 = &stru_1E547D930;
                  v38 = v37;

                  objc_msgSend(v27, "objectForKeyedSubscript:", v34);
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  SWCGetFastUTF8String<1024ul>((uint64_t)v68, v39, (const char *)(v86 + 48));

                  if ((_BYTE)v69)
                  {
                    v40 = v81[3];
                    v41 = SWCPatternStorage::_EvaluateString(v38, (unint64_t)v68, (uint64_t)a3, v55, 0);
                    if (v40 >= v41)
                      v42 = v41;
                    else
                      v42 = v40;
                    v81[3] = v42;
                  }
                  objc_msgSend(v28, "addObject:", v34);

                }
                v30 = -[__CFString countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v76, v84, 16);
              }
              while (v30);
            }

            v68[0] = MEMORY[0x1E0C809B0];
            v68[1] = 3221225472;
            v69 = ___ZN17SWCPatternStorage18_EvaluateQueryJSONEP7NSArrayIP14NSURLQueryItemERKNSt3__117basic_string_viewIcNS5_11char_traitsIcEEEEPK10SWCFNMatchi_block_invoke;
            v70 = &unk_1E547CF20;
            v43 = v28;
            v71 = v43;
            v72 = &v85;
            v73 = &v80;
            v74 = a3;
            v75 = v55;
            objc_msgSend(v27, "enumerateKeysAndObjectsUsingBlock:", v68);

          }
          _Block_object_dispose(&v85, 8);
          objc_autoreleasePoolPop(v49);
          v44 = v81[3];
          _Block_object_dispose(&v80, 8);
          v10 = this;
          v45 = v50;
        }
        v12 = v52;
        if (v44 < v52)
          v12 = v44;

LABEL_73:
        objc_autoreleasePoolPop(context);
        result = v12;
        if (v12 != 200)
          return result;
        goto LABEL_74;
      }
LABEL_44:
      objc_autoreleasePoolPop(context);
      return 0;
    }
    if (!v12)
      goto LABEL_44;
LABEL_24:
    if (((v8 >> 6) & 1) != 0)
      -[NSURLComponents fragment](a2, "fragment");
    else
      -[NSURLComponents percentEncodedFragment](a2, "percentEncodedFragment");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    v18 = &stru_1E547D930;
    if (v16)
      v18 = (__CFString *)v16;
    v19 = v18;

    v20 = SWCPatternStorage::_EvaluateString(v19, (unint64_t)&v62, (uint64_t)a3, v55, 0);
    if (v20 < v12)
      v12 = v20;

    goto LABEL_32;
  }
  if ((v8 & 4) != 0)
  {
    v12 = 200;
    goto LABEL_24;
  }
  if (v9 > 0xFFFFFFFD)
  {
    v12 = 200;
    goto LABEL_37;
  }
  objc_autoreleasePoolPop(context);
  v10 = this;
LABEL_74:
  if ((*(_BYTE *)v10 & 1) != 0)
    return 100;
  else
    return 200;
}

void sub_1A855E784(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

uint64_t SWCPatternStorage::getSize(SWCPatternStorage *this)
{
  char *cStrings;
  unsigned int v2;
  char *v3;

  cStrings = this->cStrings;
  v2 = *(_BYTE *)this;
  if ((v2 & 2) != 0)
  {
    v3 = &cStrings[strlen(this->cStrings) + 1];
    if ((v2 & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  v3 = this->cStrings;
  if ((v2 & 4) != 0)
LABEL_5:
    v3 += strlen(v3) + 1;
LABEL_6:
  if (((v2 >> 3) & 3) - 1 <= 1)
    v3 += strlen(v3) + 1;
  if ((v2 & 0x80) != 0)
    v3 += strlen(v3) + 1;
  return v3 - cStrings + 1;
}

void sub_1A855EE0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1A855F0F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A855F250(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A855F398(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  uint64_t v13;

  std::__hash_table<std::__hash_value_type<std::string_view,SWCSubstitutionVariable const*>,std::__unordered_map_hasher<std::string_view,std::__hash_value_type<std::string_view,SWCSubstitutionVariable const*>,std::hash<std::string_view>,std::equal_to<std::string_view>,true>,std::__unordered_map_equal<std::string_view,std::__hash_value_type<std::string_view,SWCSubstitutionVariable const*>,std::equal_to<std::string_view>,std::hash<std::string_view>,true>,std::allocator<std::__hash_value_type<std::string_view,SWCSubstitutionVariable const*>>>::~__hash_table(v13);

  _Unwind_Resume(a1);
}

void sub_1A855F4E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A855F7B0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A855FC28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1A855FFC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{

  _Unwind_Resume(a1);
}

uint64_t SWCSubstitutionVariable::getSize(SWCSubstitutionVariable *this)
{
  char *cStrings;
  char *i;
  const char *v3;
  int v4;

  if ((*(_BYTE *)this & 1) != 0)
    return 1;
  cStrings = this->cStrings;
  for (i = &this->cStrings[strlen(this->cStrings)]; ; i = (char *)&v3[strlen(v3)])
  {
    v4 = i[1];
    v3 = i + 1;
    if (!v4)
      break;
  }
  return v3 - cStrings + 2;
}

void sub_1A85603C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A8560620(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1A8560B34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1A8560CA8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A8560EE8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A85611AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A856164C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

id SWCSubstitutionVariable::getValuesNoCopy(SWCSubstitutionVariable *this)
{
  id v2;
  size_t v3;
  void *v4;
  const char *v5;
  char v6;
  size_t v7;
  void *v8;
  uint64_t v9;
  const char *v11;
  size_t v12;

  if ((*(_BYTE *)this & 1) != 0)
  {
    v2 = 0;
  }
  else
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if ((*(_BYTE *)this & 1) == 0)
    {
      v3 = strlen(this->cStrings);
      if ((*(_BYTE *)this & 2) != 0)
      {
        v11 = "";
        v12 = 0;
        SWCGetNSStringFromStringViewNoCopy(&v11);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (v4)
          objc_msgSend(v2, "addObject:", v4);

      }
      v5 = &this->cStrings[v3 + 1];
      if (*v5)
      {
        v6 = *(_BYTE *)this;
        do
        {
          if ((v6 & 4) != 0)
            v7 = 1;
          else
            v7 = strlen(v5);
          v11 = v5;
          v12 = v7;
          SWCGetNSStringFromStringViewNoCopy(&v11);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (v8)
            objc_msgSend(v2, "addObject:", v8);

          v6 = *(_BYTE *)this;
          if ((*(_BYTE *)this & 4) != 0)
            v9 = 1;
          else
            v9 = v7 + 1;
          v5 += v9;
        }
        while (*v5);
      }
    }
  }
  return v2;
}

void sub_1A856186C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id SWCSubstitutionVariable::getNameNoCopy(SWCSubstitutionVariable *this)
{
  void *v1;
  _QWORD v3[2];

  if ((*(_BYTE *)this & 1) != 0)
  {
    v1 = 0;
  }
  else
  {
    v3[0] = this->cStrings;
    v3[1] = strlen(this->cStrings);
    SWCGetNSStringFromStringViewNoCopy(v3);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

void sub_1A8561B18(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A8561F98(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A85620E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

uint64_t SWCPatternStorage::_EvaluateString(void *a1, unint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  int v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _BYTE v23[24];
  char v24[1024];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v9 = a1;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "static SWCPatternMatchResult SWCPatternStorage::_EvaluateString(NSString *__strong, const std::string_view &, const SWCFNMatch *, int, BOOL)");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("SWCPattern.mm"), 1252, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("component != nil"));

    if (a3)
      goto LABEL_3;
LABEL_24:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "static SWCPatternMatchResult SWCPatternStorage::_EvaluateString(NSString *__strong, const std::string_view &, const SWCFNMatch *, int, BOOL)");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("SWCPattern.mm"), 1253, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fnmatch != NULL"));

    goto LABEL_3;
  }
  if (!a3)
    goto LABEL_24;
LABEL_3:
  v10 = *(_QWORD *)(a2 + 8);
  if (v10 == 1 && **(_BYTE **)a2 == 42)
  {
    v11 = 200;
  }
  else
  {
    if (a5)
    {
      v12 = +[_SWCPattern _normalizedURLPath:](_SWCPattern, "_normalizedURLPath:", v9);

      v10 = *(_QWORD *)(a2 + 8);
      v9 = v12;
    }
    if (v10)
    {
      if (*(_DWORD *)(a3 + 32))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL SWCFNMatch::execute(const std::string_view &, NSString *const __strong, int) const");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("SWCPattern.mm"), 2258, CFSTR("Entered SWCFNMatch::execute() with non-zero recursion depth (%i)."), *(unsigned int *)(a3 + 32));

      }
      SWCGetFastUTF8String<1024ul>((uint64_t)v23, v9, v24);
      if (v23[16])
      {
        *(_OWORD *)(a3 + 8) = *(_OWORD *)a2;
        *(_BYTE *)a3 = 0;
        v13 = SWCFNMatch::_execute((int8x8_t *)a3, a2, (uint64_t)v23, a4);
      }
      else
      {
        v13 = 0;
      }
      if (*(_DWORD *)(a3 + 32))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL SWCFNMatch::execute(const std::string_view &, NSString *const __strong, int) const");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("SWCPattern.mm"), 2267, CFSTR("Exited SWCFNMatch::execute() with non-zero recursion depth (%i)."), *(unsigned int *)(a3 + 32));

      }
      if (v13)
        v11 = 200;
      else
        v11 = 0;
    }
    else if (objc_msgSend(v9, "length"))
    {
      v11 = 0;
    }
    else
    {
      v11 = 200;
    }
  }

  return v11;
}

void sub_1A85623F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id SWCPatternStorage::_ReconstituteQueryJSON(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v2 = (void *)MEMORY[0x1A85D4B3C]();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", a1[1] + 2);
  objc_msgSend(v3, "appendBytes:length:", "{", 1);
  objc_msgSend(v3, "appendBytes:length:", *a1, a1[1]);
  objc_msgSend(v3, "appendBytes:length:", "}", 1);
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v3, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && _NSIsNSDictionary())
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x2020000000;
    v11 = 1;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = ___ZN17SWCPatternStorage22_ReconstituteQueryJSONERKNSt3__117basic_string_viewIcNS0_11char_traitsIcEEEE_block_invoke;
    v7[3] = &unk_1E547CEF8;
    v7[4] = &v8;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v7);
    if (*((_BYTE *)v9 + 24))
      v5 = v4;
    else
      v5 = 0;
    _Block_object_dispose(&v8, 8);
  }
  else
  {
    v5 = 0;
  }

  objc_autoreleasePoolPop(v2);
  return v5;
}

void sub_1A85625C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  void *v7;
  void *v8;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

uint64_t ___ZN17SWCPatternStorage22_ReconstituteQueryJSONERKNSt3__117basic_string_viewIcNS0_11char_traitsIcEEEE_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = _NSIsNSString();
  if (!(_DWORD)result || (result = _NSIsNSString(), (result & 1) == 0))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

void *__Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  return memcpy((void *)(a1 + 48), (const void *)(a2 + 48), 0x400uLL);
}

void SWCGetFastUTF8String<1024ul>(uint64_t a1, void *a2, const char *a3)
{
  __CFString *v5;
  const char *CStringPtr;
  char v7;
  __CFString *theString;

  v5 = a2;
  *(_BYTE *)a1 = 0;
  *(_BYTE *)(a1 + 16) = 0;
  if (v5)
  {
    theString = v5;
    if (((unint64_t)v5 & 0x8000000000000000) != 0
      || (CStringPtr = CFStringGetCStringPtr(v5, 0x8000100u)) == 0)
    {
      v7 = -[__CFString getCString:maxLength:encoding:](theString, "getCString:maxLength:encoding:", a3, 1024, 4);
      CStringPtr = a3;
      if ((v7 & 1) == 0)
        CStringPtr = (const char *)-[__CFString UTF8String](objc_retainAutorelease(theString), "UTF8String");
    }
    *(_QWORD *)a1 = CStringPtr;
    *(_QWORD *)(a1 + 8) = strlen(CStringPtr);
    *(_BYTE *)(a1 + 16) = 1;
    v5 = theString;
  }

}

void sub_1A8562708(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void ___ZN17SWCPatternStorage18_EvaluateQueryJSONEP7NSArrayIP14NSURLQueryItemERKNSt3__117basic_string_viewIcNS5_11char_traitsIcEEEEPK10SWCFNMatchi_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  _BYTE v9[24];

  objc_msgSend(*(id *)(a1 + 32), "member:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    SWCGetFastUTF8String<1024ul>((uint64_t)v9, a3, (const char *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48));
    if (v9[16])
    {
      v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      v7 = SWCPatternStorage::_EvaluateString(&stru_1E547D930, (unint64_t)v9, *(_QWORD *)(a1 + 56), *(unsigned int *)(a1 + 64), 0);
      if (v6 >= v7)
        v8 = v7;
      else
        v8 = v6;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v8;
    }
  }
}

BOOL SWCPatternStorage::_CheckEntitlement(uint64_t a1, const char **a2)
{
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  _BOOL8 v8;

  if (qword_1ED1B6310
    && (+[_SWCPrefs sharedPrefs](_SWCPrefs, "sharedPrefs"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isAppleInternal"),
        v4,
        v5))
  {
    xpc_dictionary_get_value((xpc_object_t)qword_1ED1B6310, *a2);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else if (a1)
  {
    v6 = xpc_copy_entitlement_for_token();
  }
  else
  {
    v6 = xpc_copy_entitlement_for_self();
  }
  v7 = (void *)v6;
  v8 = v6 && MEMORY[0x1A85D4E60](v6) == MEMORY[0x1E0C812D0] && xpc_BOOL_get_value(v7);

  return v8;
}

void sub_1A85628B4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void ___ZN17SWCPatternStorage13GetTerminatorEv_block_invoke()
{
  _MergedGlobals |= 0x18u;
}

uint64_t std::string_view::find[abi:nn180100](char *__s, uint64_t a2)
{
  char *v2;
  char *v3;
  char *v4;

  v2 = __s;
  v3 = &__s[a2];
  if (a2 >= 2)
  {
    do
    {
      v4 = (char *)memchr(__s, 36, a2 - 1);
      if (!v4)
        break;
      if (*(_WORD *)v4 == 10276)
        goto LABEL_6;
      __s = v4 + 1;
      a2 = v3 - __s;
    }
    while (v3 - __s > 1);
  }
  v4 = v3;
LABEL_6:
  if (v4 == v3)
    return -1;
  else
    return v4 - v2;
}

id getLog(void)
{
  if (qword_1ED1B6168 != -1)
    dispatch_once(&qword_1ED1B6168, &__block_literal_global_218);
  return (id)qword_1ED1B6160;
}

__CFString *SWCGetNSStringFromStringViewNoCopy(_QWORD *a1)
{
  __CFString *v1;

  if (a1[1])
    v1 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", *a1, a1[1], 4, 0);
  else
    v1 = &stru_1E547D930;
  return v1;
}

void ___ZN23SWCSubstitutionVariable13GetTerminatorEv_block_invoke()
{
  byte_1ED1B6129 |= 1u;
}

uint64_t SWCEnumerateStructureSequence<SWCSubstitutionVariable,SWCFNMatch::_getVariable(std::string_view const&)::$_0>(uint64_t result, uint64_t a2)
{
  unint64_t v2;
  SWCSubstitutionVariable *v3;
  uint64_t *v4;
  uint64_t v5;
  size_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint8x8_t v10;
  unint64_t v11;
  uint64_t ***v12;
  uint64_t **i;
  unint64_t v14;
  _QWORD *v15;
  float v16;
  float v17;
  _BOOL8 v18;
  unint64_t v19;
  unint64_t v20;
  int8x8_t prime;
  void *v22;
  void *v23;
  uint64_t v24;
  _QWORD *v25;
  unint64_t v26;
  uint8x8_t v27;
  unint64_t v28;
  uint8x8_t v29;
  uint64_t v30;
  _QWORD *v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  unint64_t v36;
  uint64_t v37;
  void *v38;

  if (result)
  {
    v3 = (SWCSubstitutionVariable *)result;
    if ((*(_BYTE *)result & 1) == 0)
    {
      v4 = (uint64_t *)a2;
      while (1)
      {
        v5 = *v4;
        v6 = strlen(v3->cStrings);
        v7 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100]((uint64_t *)v3->cStrings, v6);
        v8 = v7;
        v9 = *(_QWORD *)(v5 + 48);
        if (v9)
        {
          v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
          v10.i16[0] = vaddlv_u8(v10);
          v11 = v10.u32[0];
          if (v10.u32[0] > 1uLL)
          {
            v2 = v7;
            if (v7 >= v9)
              v2 = v7 % v9;
          }
          else
          {
            v2 = (v9 - 1) & v7;
          }
          v12 = *(uint64_t ****)(*(_QWORD *)(v5 + 40) + 8 * v2);
          if (v12)
          {
            for (i = *v12; i; i = (uint64_t **)*i)
            {
              v14 = (unint64_t)i[1];
              if (v14 == v8)
              {
                if (i[3] == (uint64_t *)v6 && !memcmp(i[2], v3->cStrings, v6))
                  goto LABEL_77;
              }
              else
              {
                if (v11 > 1)
                {
                  if (v14 >= v9)
                    v14 %= v9;
                }
                else
                {
                  v14 &= v9 - 1;
                }
                if (v14 != v2)
                  break;
              }
            }
          }
        }
        v15 = operator new(0x28uLL);
        *v15 = 0;
        v15[1] = v8;
        v15[2] = v3->cStrings;
        v15[3] = v6;
        v15[4] = v3;
        v16 = (float)(unint64_t)(*(_QWORD *)(v5 + 64) + 1);
        v17 = *(float *)(v5 + 72);
        if (!v9 || (float)(v17 * (float)v9) < v16)
          break;
LABEL_67:
        v34 = *(_QWORD *)(v5 + 40);
        v35 = *(_QWORD **)(v34 + 8 * v2);
        if (v35)
        {
          *v15 = *v35;
LABEL_75:
          *v35 = v15;
          goto LABEL_76;
        }
        *v15 = *(_QWORD *)(v5 + 56);
        *(_QWORD *)(v5 + 56) = v15;
        *(_QWORD *)(v34 + 8 * v2) = v5 + 56;
        if (*v15)
        {
          v36 = *(_QWORD *)(*v15 + 8);
          if ((v9 & (v9 - 1)) != 0)
          {
            if (v36 >= v9)
              v36 %= v9;
          }
          else
          {
            v36 &= v9 - 1;
          }
          v35 = (_QWORD *)(*(_QWORD *)(v5 + 40) + 8 * v36);
          goto LABEL_75;
        }
LABEL_76:
        ++*(_QWORD *)(v5 + 64);
LABEL_77:
        v4 = (uint64_t *)a2;
        v37 = *(_QWORD *)(a2 + 8);
        if (*(_QWORD *)(v37 + 8) == v6)
        {
          result = memcmp(*(const void **)v37, v3->cStrings, v6);
          if (!(_DWORD)result)
          {
            **(_QWORD **)(a2 + 16) = v3;
            return result;
          }
        }
        result = SWCSubstitutionVariable::getSize(v3);
        v3 = (SWCSubstitutionVariable *)((char *)v3 + result);
        if ((*(_BYTE *)v3 & 1) != 0)
          return result;
      }
      v18 = (v9 & (v9 - 1)) != 0;
      if (v9 < 3)
        v18 = 1;
      v19 = v18 | (2 * v9);
      v20 = vcvtps_u32_f32(v16 / v17);
      if (v19 <= v20)
        prime = (int8x8_t)v20;
      else
        prime = (int8x8_t)v19;
      if (*(_QWORD *)&prime == 1)
      {
        prime = (int8x8_t)2;
      }
      else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
      {
        prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
        v9 = *(_QWORD *)(v5 + 48);
      }
      if (*(_QWORD *)&prime > v9)
        goto LABEL_33;
      if (*(_QWORD *)&prime < v9)
      {
        v28 = vcvtps_u32_f32((float)*(unint64_t *)(v5 + 64) / *(float *)(v5 + 72));
        if (v9 < 3 || (v29 = (uint8x8_t)vcnt_s8((int8x8_t)v9), v29.i16[0] = vaddlv_u8(v29), v29.u32[0] > 1uLL))
        {
          v28 = std::__next_prime(v28);
        }
        else
        {
          v30 = 1 << -(char)__clz(v28 - 1);
          if (v28 >= 2)
            v28 = v30;
        }
        if (*(_QWORD *)&prime <= v28)
          prime = (int8x8_t)v28;
        if (*(_QWORD *)&prime >= v9)
        {
          v9 = *(_QWORD *)(v5 + 48);
        }
        else
        {
          if (prime)
          {
LABEL_33:
            if (*(_QWORD *)&prime >> 61)
              std::__throw_bad_array_new_length[abi:nn180100]();
            v22 = operator new(8 * *(_QWORD *)&prime);
            v23 = *(void **)(v5 + 40);
            *(_QWORD *)(v5 + 40) = v22;
            if (v23)
              operator delete(v23);
            v24 = 0;
            *(int8x8_t *)(v5 + 48) = prime;
            do
              *(_QWORD *)(*(_QWORD *)(v5 + 40) + 8 * v24++) = 0;
            while (*(_QWORD *)&prime != v24);
            v25 = *(_QWORD **)(v5 + 56);
            if (v25)
            {
              v26 = v25[1];
              v27 = (uint8x8_t)vcnt_s8(prime);
              v27.i16[0] = vaddlv_u8(v27);
              if (v27.u32[0] > 1uLL)
              {
                if (v26 >= *(_QWORD *)&prime)
                  v26 %= *(_QWORD *)&prime;
              }
              else
              {
                v26 &= *(_QWORD *)&prime - 1;
              }
              *(_QWORD *)(*(_QWORD *)(v5 + 40) + 8 * v26) = v5 + 56;
              v31 = (_QWORD *)*v25;
              if (*v25)
              {
                do
                {
                  v32 = v31[1];
                  if (v27.u32[0] > 1uLL)
                  {
                    if (v32 >= *(_QWORD *)&prime)
                      v32 %= *(_QWORD *)&prime;
                  }
                  else
                  {
                    v32 &= *(_QWORD *)&prime - 1;
                  }
                  if (v32 != v26)
                  {
                    v33 = *(_QWORD *)(v5 + 40);
                    if (!*(_QWORD *)(v33 + 8 * v32))
                    {
                      *(_QWORD *)(v33 + 8 * v32) = v25;
                      goto LABEL_58;
                    }
                    *v25 = *v31;
                    *v31 = **(_QWORD **)(*(_QWORD *)(v5 + 40) + 8 * v32);
                    **(_QWORD **)(*(_QWORD *)(v5 + 40) + 8 * v32) = v31;
                    v31 = v25;
                  }
                  v32 = v26;
LABEL_58:
                  v25 = v31;
                  v31 = (_QWORD *)*v31;
                  v26 = v32;
                }
                while (v31);
              }
            }
            v9 = (unint64_t)prime;
            goto LABEL_62;
          }
          v38 = *(void **)(v5 + 40);
          *(_QWORD *)(v5 + 40) = 0;
          if (v38)
            operator delete(v38);
          v9 = 0;
          *(_QWORD *)(v5 + 48) = 0;
        }
      }
LABEL_62:
      if ((v9 & (v9 - 1)) != 0)
      {
        if (v8 >= v9)
          v2 = v8 % v9;
        else
          v2 = v8;
      }
      else
      {
        v2 = (v9 - 1) & v8;
      }
      goto LABEL_67;
    }
  }
  return result;
}

void sub_1A8562E68(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t SWCFNMatch::_execute(int8x8_t *a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  int8x8_t *v7;
  char *v8;
  uint64_t v9;
  uint8_t *v10;
  int v11;
  char *i;
  const char *v13;
  const char *v14;
  unsigned int v15;
  const char *v16;
  unsigned int v17;
  __darwin_ct_rune_t v18;
  unint64_t v19;
  unsigned __int16 v21;
  int v22;
  unsigned __int16 v23;
  int v24;
  __darwin_ct_rune_t v25;
  int v26;
  _BYTE *v27;
  int v28;
  int v29;
  _BYTE *v30;
  uint64_t result;
  size_t v32;
  unint64_t v33;
  int8x8_t v34;
  unint64_t v35;
  uint8x8_t v36;
  unint64_t v37;
  unint64_t v38;
  int v39;
  int64_t v40;
  int v41;
  uint64_t ***v42;
  uint64_t **j;
  unint64_t v44;
  int8x8_t v45;
  void *v46;
  void *v47;
  char *v48;
  size_t v49;
  char v50;
  size_t v51;
  const char *k;
  size_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  void *v64;
  uint64_t v65;
  uint8_t *s;
  uint8_t *sa;
  _QWORD v69[2];
  uint8_t *v70;
  size_t v71;
  _QWORD v72[2];
  size_t v73;
  char v74;
  int v75;
  UChar s2[4];
  size_t v77;
  char v78;
  __int128 s1;
  UChar *v80;
  _QWORD *v81;
  int *v82;
  char *v83;
  uint64_t v84;

  v7 = a1;
  v84 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL SWCFNMatch::_execute(const std::string_view &, const std::string_view &, int) const");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "handleFailureInFunction:file:lineNumber:description:", v56, CFSTR("SWCPattern.mm"), 2043, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pattern.data() != NULL"));
    v7 = a1;

  }
  s = *(uint8_t **)a3;
  if (!*(_QWORD *)a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL SWCFNMatch::_execute(const std::string_view &, const std::string_view &, int) const");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "handleFailureInFunction:file:lineNumber:description:", v58, CFSTR("SWCPattern.mm"), 2044, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("string.data() != NULL"));
    v7 = a1;

    s = *(uint8_t **)a3;
  }
  v8 = *(char **)a2;
  v9 = *(_QWORD *)(a3 + 8);
  v65 = *(_QWORD *)(a2 + 8);
  if (*(_BYTE *)(*(_QWORD *)a2 + v65))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL SWCFNMatch::_execute(const std::string_view &, const std::string_view &, int) const");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "handleFailureInFunction:file:lineNumber:description:", v60, CFSTR("SWCPattern.mm"), 2052, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("*pEnd == '\\0'"));
    v7 = a1;

  }
  v10 = s;
  if (s[v9])
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL SWCFNMatch::_execute(const std::string_view &, const std::string_view &, int) const");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "handleFailureInFunction:file:lineNumber:description:", v62, CFSTR("SWCPattern.mm"), 2053, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("*sEnd == '\\0'"));
    v7 = a1;

    v10 = s;
  }
  if (v7->i8[0])
    return 0;
  if (v7[4].i32[0] >= 65)
  {
    getLog();
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
    {
      SWCGetNSStringFromStringViewNoCopy(&a1[1]);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(s1) = 138412290;
      *(_QWORD *)((char *)&s1 + 4) = v64;
      _os_log_impl(&dword_1A855A000, v63, OS_LOG_TYPE_INFO, "Pattern \"%@\" was too complex. Stopping evaluation.", (uint8_t *)&s1, 0xCu);

    }
    result = 0;
    a1->i8[0] = 1;
    return result;
  }
  v11 = *v8;
  if (!*v8 && *v10)
    return 0;
  for (i = v8; ; ++i)
  {
    if (v11 > 41)
    {
      switch(v11)
      {
        case '?':
          if (*v10)
          {
            SWCFNMatch::_decodeUTF8Character(v10, (const char *)a2, (const char *)a3);
            if (a2 >= 2)
              v10 = &v10[a2 - 1];
            goto LABEL_54;
          }
          break;
        case '\\':
          ++i;
          goto LABEL_54;
        case '*':
          v27 = (_BYTE *)(&v8[v65] - i);
          do
          {
            v29 = *++i;
            v28 = v29;
            --v27;
          }
          while (v29 == 42);
          if (!v28)
            return 1;
          if (*v10)
          {
            v39 = a1[4].i32[0] + 1;
            v40 = &s[v9] - v10;
            do
            {
              a1[4].i32[0] = v39;
              *(_QWORD *)&s1 = i;
              *((_QWORD *)&s1 + 1) = v27;
              *(_QWORD *)s2 = v10;
              v77 = v40;
              result = SWCFNMatch::_execute(a1, &s1, s2, a4);
              v39 = a1[4].i32[0];
              a1[4].i32[0] = v39 - 1;
              if ((result & 1) != 0)
                break;
              v41 = *++v10;
              --v40;
            }
            while (v41);
            return result;
          }
          return 0;
      }
      goto LABEL_29;
    }
    if (!v11)
    {
      if (!*v10)
        return 1;
      goto LABEL_29;
    }
    if (v11 == 36 && !strncmp(i, "$(", 2uLL))
      break;
LABEL_29:
    v15 = SWCFNMatch::_decodeUTF8Character((uint8_t *)i, (const char *)a2, (const char *)a3);
    if (v13)
      v16 = v13 - 1;
    else
      v16 = 0;
    v17 = SWCFNMatch::_decodeUTF8Character(v10, v13, v14);
    v18 = v17;
    i = (char *)&v16[(_QWORD)i];
    v19 = a2 - 1;
    if (!a2)
      v19 = 0;
    v10 += v19;
    if (v15 == v17 || (a4 & 0x10) == 0)
    {
      if (v15 != v17)
        return 0;
    }
    else if (((v17 | v15) & 0xFFFFFF80) != 0)
    {
      if (v15 - 0x10000 >= 0x100000)
        v21 = v15;
      else
        v21 = (v15 >> 10) - 10304;
      v22 = (v15 & 0x3FF | 0xDC00) << 16;
      if (v15 - 0x10000 >= 0x100000)
        v22 = 0;
      WORD2(s1) = 0;
      LODWORD(s1) = v22 & 0xFFFF0000 | v21;
      if (v17 - 0x10000 >= 0x100000)
        v23 = v17;
      else
        v23 = (v17 >> 10) - 10304;
      v24 = (v17 & 0x3FF | 0xDC00) << 16;
      if (v17 - 0x10000 >= 0x100000)
        v24 = 0;
      s2[2] = 0;
      *(_DWORD *)s2 = v24 & 0xFFFF0000 | v23;
      if (u_strcasecmp((const UChar *)&s1, s2, 0))
        return 0;
    }
    else
    {
      v25 = __tolower(v15);
      if (v25 != __tolower(v18))
        return 0;
    }
LABEL_54:
    v26 = i[1];
    v11 = v26;
    ++v10;
  }
  v30 = i + 2;
  result = (uint64_t)strchr(i + 2, 41);
  if (!result)
    return result;
  sa = (uint8_t *)result;
  v32 = result - (_QWORD)v30;
  v72[0] = i + 2;
  v72[1] = result - (_QWORD)v30;
  *(_QWORD *)s2 = 0;
  v33 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100]((uint64_t *)(i + 2), result - (_QWORD)v30);
  v34 = a1[6];
  if (v34)
  {
    v35 = v33;
    v36 = (uint8x8_t)vcnt_s8(v34);
    v36.i16[0] = vaddlv_u8(v36);
    v37 = v36.u32[0];
    if (v36.u32[0] > 1uLL)
    {
      v38 = v33;
      if (v33 >= *(_QWORD *)&v34)
        v38 = v33 % *(_QWORD *)&v34;
    }
    else
    {
      v38 = (*(_QWORD *)&v34 - 1) & v33;
    }
    v42 = *(uint64_t ****)(*(_QWORD *)&a1[5] + 8 * v38);
    if (v42)
    {
      for (j = *v42; j; j = (uint64_t **)*j)
      {
        v44 = (unint64_t)j[1];
        if (v44 == v35)
        {
          if (j[3] == (uint64_t *)v32 && !memcmp(j[2], i + 2, v32))
          {
            v48 = (char *)j[4];
            goto LABEL_90;
          }
        }
        else
        {
          if (v37 > 1)
          {
            if (v44 >= *(_QWORD *)&v34)
              v44 %= *(_QWORD *)&v34;
          }
          else
          {
            v44 &= *(_QWORD *)&v34 - 1;
          }
          if (v44 != v38)
            break;
        }
      }
    }
  }
  if (!a1[10].i8[0])
  {
    *(_QWORD *)&s1 = a1;
    *((_QWORD *)&s1 + 1) = v72;
    v80 = s2;
    v45 = a1[3];
    if (!*(_QWORD *)&v45
      || (SWCEnumerateStructureSequence<SWCSubstitutionVariable,SWCFNMatch::_getVariable(std::string_view const&)::$_0>(*(_QWORD *)&v45 + 8, (uint64_t)&s1), (v48 = *(char **)s2) == 0))
    {
      +[_SWCSubstitutionVariableList cheapBuiltInSubstitutionVariableList](_SWCSubstitutionVariableList, "cheapBuiltInSubstitutionVariableList");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      SWCEnumerateStructureSequence<SWCSubstitutionVariable,SWCFNMatch::_getVariable(std::string_view const&)::$_0>((uint64_t)v46 + 8, (uint64_t)&s1);

      v48 = *(char **)s2;
      if (!*(_QWORD *)s2)
      {
        +[_SWCSubstitutionVariableList expensiveBuiltInSubstitutionVariableList](_SWCSubstitutionVariableList, "expensiveBuiltInSubstitutionVariableList");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        SWCEnumerateStructureSequence<SWCSubstitutionVariable,SWCFNMatch::_getVariable(std::string_view const&)::$_0>((uint64_t)v47 + 8, (uint64_t)&s1);

        v48 = *(char **)s2;
        if (!*(_QWORD *)s2)
          a1[10].i8[0] = 1;
      }
    }
LABEL_90:
    if (v48)
    {
      v70 = sa + 1;
      v71 = strlen((const char *)sa + 1);
      v69[0] = v10;
      v49 = strlen((const char *)v10);
      result = 0;
      v69[1] = v49;
      v75 = a4;
      v74 = 0;
      v73 = v71;
      *(_QWORD *)&s1 = &v73;
      *((_QWORD *)&s1 + 1) = &v70;
      v80 = (UChar *)a1;
      v81 = v69;
      v82 = &v75;
      v83 = &v74;
      v50 = *v48;
      if ((*v48 & 1) == 0)
      {
        v78 = 0;
        v51 = strlen(v48 + 1);
        if ((v50 & 2) == 0
          || (*(_QWORD *)s2 = "",
              v77 = 0,
              SWCFNMatch::_tryMatchingVariable(SWCSubstitutionVariable const*,std::string_view const&,std::string_view const&,int)const::$_0::operator()((uint64_t **)&s1, (uint64_t)s2, &v78), !v78))
        {
          for (k = &v48[v51 + 2]; *k; k += v54)
          {
            if ((*v48 & 4) != 0)
              v53 = 1;
            else
              v53 = strlen(k);
            *(_QWORD *)s2 = k;
            v77 = v53;
            SWCFNMatch::_tryMatchingVariable(SWCSubstitutionVariable const*,std::string_view const&,std::string_view const&,int)const::$_0::operator()((uint64_t **)&s1, (uint64_t)s2, &v78);
            if (v78)
              break;
            v54 = (*v48 & 4) != 0 ? 1 : v53 + 1;
          }
        }
        return v74 != 0;
      }
      return result;
    }
  }
  return 0;
}

void sub_1A8563654(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t SWCFNMatch::_decodeUTF8Character(uint8_t *s, const char *a2, const char *a3)
{
  unsigned int v3;
  int32_t v5;
  uint64_t v6;
  unint64_t v7;
  unsigned int v8;
  int v9;
  unsigned int v10;
  unsigned int v11;

  v3 = *s;
  if ((char)*s < 0)
  {
    if (v3 > 0xBF)
    {
      v5 = 0;
      LODWORD(v6) = 1;
    }
    else
    {
      v5 = utf8_back1SafeBody(s, 0, 0);
      v3 = s[v5];
      if ((v3 & 0x80) == 0)
        return v3;
      LODWORD(v6) = v5 + 1;
      if (v5 == -2)
        return -1;
    }
    if (v3 < 0xE0)
    {
      if (v3 < 0xC2)
        return -1;
      v9 = v3 & 0x1F;
    }
    else
    {
      if (v3 > 0xEF)
      {
        if (v3 > 0xF4)
          return -1;
        v11 = v3 - 240;
        v7 = s[(int)v6];
        if (((byte_1A85731FD[v7 >> 4] >> v11) & 1) == 0)
          return -1;
        v6 = v5 + 2;
        if (v5 == -3)
          return -1;
        v8 = s[v6] ^ 0x80;
        if (v8 > 0x3F)
          return -1;
        LODWORD(v7) = v7 & 0x3F | (v11 << 6);
      }
      else
      {
        v7 = v3 & 0xF;
        if (((a00000000000000[v7] >> (s[(int)v6] >> 5)) & 1) == 0)
          return -1;
        v8 = s[(int)v6] & 0x3F;
      }
      LODWORD(v6) = v6 + 1;
      if ((_DWORD)v6 == -1)
        return -1;
      v9 = v8 | ((_DWORD)v7 << 6);
    }
    v10 = s[(int)v6] ^ 0x80;
    if (v10 <= 0x3F)
      return v10 | (v9 << 6);
    return -1;
  }
  return v3;
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100](uint64_t *a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t v72;
  unint64_t v73;

  if (a2 > 0x20)
  {
    if (a2 <= 0x40)
    {
      v5 = *(uint64_t *)((char *)a1 + a2 - 16);
      v6 = *a1 - 0x3C5A37A36834CED9 * (v5 + a2);
      v8 = a1[2];
      v7 = a1[3];
      v9 = __ROR8__(v6 + v7, 52);
      v10 = v6 + a1[1];
      v11 = __ROR8__(v10, 7);
      v12 = v10 + v8;
      v13 = *(uint64_t *)((char *)a1 + a2 - 32) + v8;
      v14 = *(uint64_t *)((char *)a1 + a2 - 8) + v7;
      v15 = __ROR8__(v14 + v13, 52);
      v16 = v11 + __ROR8__(*a1 - 0x3C5A37A36834CED9 * (v5 + a2), 37) + v9;
      v17 = __ROR8__(v13, 37);
      v18 = *(uint64_t *)((char *)a1 + a2 - 24) + v13;
      v19 = __ROR8__(v18, 7);
      v20 = v16 + __ROR8__(v12, 31);
      v21 = v18 + v5;
      v22 = v21 + v14;
      v23 = 0x9AE16A3B2F90404FLL;
      v24 = 0xC3A5C85C97CB3127 * (v22 + v20) - 0x651E95C4D06FBFB1 * (v12 + v7 + v17 + v19 + v15 + __ROR8__(v21, 31));
      v25 = v20 - 0x3C5A37A36834CED9 * (v24 ^ (v24 >> 47));
      return (v25 ^ (v25 >> 47)) * v23;
    }
    v4 = 0x9DDFEA08EB382D69;
    v32 = *(uint64_t *)((char *)a1 + a2 - 48);
    v33 = *(uint64_t *)((char *)a1 + a2 - 40);
    v34 = *(uint64_t *)((char *)a1 + a2 - 24);
    v36 = *(uint64_t *)((char *)a1 + a2 - 64);
    v35 = *(uint64_t *)((char *)a1 + a2 - 56);
    v37 = *(uint64_t *)((char *)a1 + a2 - 16);
    v38 = *(uint64_t *)((char *)a1 + a2 - 8);
    v39 = v35 + v37;
    v40 = 0x9DDFEA08EB382D69
        * (v34 ^ ((0x9DDFEA08EB382D69 * (v34 ^ (v32 + a2))) >> 47) ^ (0x9DDFEA08EB382D69 * (v34 ^ (v32 + a2))));
    v41 = 0x9DDFEA08EB382D69 * (v40 ^ (v40 >> 47));
    v42 = v32 + v35 + v36 + a2;
    v43 = v42 + v33;
    v44 = __ROR8__(v42, 44) + v36 + a2 + __ROR8__(v36 + a2 + v33 - 0x622015F714C7D297 * (v40 ^ (v40 >> 47)), 21);
    v45 = v35 + v37 + *(uint64_t *)((char *)a1 + a2 - 32) - 0x4B6D499041670D8DLL;
    v46 = v34 + v37 + v45;
    v47 = __ROR8__(v46, 44);
    v48 = v46 + v38;
    v49 = v47 + v45 + __ROR8__(v45 + v33 + v38, 21);
    v51 = *a1;
    v50 = a1 + 4;
    v52 = v51 - 0x4B6D499041670D8DLL * v33;
    v53 = -(uint64_t)((a2 - 1) & 0xFFFFFFFFFFFFFFC0);
    do
    {
      v54 = *(v50 - 3);
      v55 = v52 + v43 + v39 + v54;
      v56 = v50[2];
      v57 = v50[3];
      v58 = v50[1];
      v39 = v58 + v43 - 0x4B6D499041670D8DLL * __ROR8__(v39 + v44 + v56, 42);
      v59 = v41 + v48;
      v60 = *(v50 - 2);
      v61 = *(v50 - 1);
      v62 = *(v50 - 4) - 0x4B6D499041670D8DLL * v44;
      v63 = v62 + v48 + v61;
      v64 = v62 + v54 + v60;
      v43 = v64 + v61;
      v65 = __ROR8__(v64, 44) + v62;
      v66 = (0xB492B66FBE98F273 * __ROR8__(v55, 37)) ^ v49;
      v52 = 0xB492B66FBE98F273 * __ROR8__(v59, 33);
      v44 = v65 + __ROR8__(v63 + v66, 21);
      v67 = v52 + v49 + *v50;
      v48 = v58 + v56 + v67 + v57;
      v49 = __ROR8__(v58 + v56 + v67, 44) + v67 + __ROR8__(v39 + v60 + v67 + v57, 21);
      v50 += 8;
      v41 = v66;
      v53 += 64;
    }
    while (v53);
    v68 = v52
        - 0x622015F714C7D297
        * ((0x9DDFEA08EB382D69
          * (v49 ^ ((0x9DDFEA08EB382D69 * (v49 ^ v44)) >> 47) ^ (0x9DDFEA08EB382D69 * (v49 ^ v44)))) ^ ((0x9DDFEA08EB382D69 * (v49 ^ ((0x9DDFEA08EB382D69 * (v49 ^ v44)) >> 47) ^ (0x9DDFEA08EB382D69 * (v49 ^ v44)))) >> 47));
    v69 = 0x9DDFEA08EB382D69
        * (v68 ^ (v66
                - 0x4B6D499041670D8DLL * (v39 ^ (v39 >> 47))
                - 0x622015F714C7D297
                * ((0x9DDFEA08EB382D69
                  * (v48 ^ ((0x9DDFEA08EB382D69 * (v48 ^ v43)) >> 47) ^ (0x9DDFEA08EB382D69 * (v48 ^ v43)))) ^ ((0x9DDFEA08EB382D69 * (v48 ^ ((0x9DDFEA08EB382D69 * (v48 ^ v43)) >> 47) ^ (0x9DDFEA08EB382D69 * (v48 ^ v43)))) >> 47))));
    v70 = 0x9DDFEA08EB382D69 * (v68 ^ (v69 >> 47) ^ v69);
    goto LABEL_13;
  }
  if (a2 > 0x10)
  {
    v26 = a1[1];
    v27 = 0xB492B66FBE98F273 * *a1;
    v28 = __ROR8__(0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)a1 + a2 - 8), 30) + __ROR8__(v27 - v26, 43);
    v29 = v27 + a2 + __ROR8__(v26 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)a1 + a2 - 8);
    v23 = 0x9DDFEA08EB382D69;
    v30 = 0x9DDFEA08EB382D69 * ((v28 - 0x3C5A37A36834CED9 * *(uint64_t *)((char *)a1 + a2 - 16)) ^ v29);
    v31 = v29 ^ (v30 >> 47) ^ v30;
LABEL_8:
    v25 = 0x9DDFEA08EB382D69 * v31;
    return (v25 ^ (v25 >> 47)) * v23;
  }
  if (a2 < 9)
  {
    if (a2 >= 4)
    {
      v72 = *(unsigned int *)((char *)a1 + a2 - 4);
      v23 = 0x9DDFEA08EB382D69;
      v73 = 0x9DDFEA08EB382D69 * (((8 * *(_DWORD *)a1) + a2) ^ v72);
      v31 = v72 ^ (v73 >> 47) ^ v73;
      goto LABEL_8;
    }
    v4 = 0x9AE16A3B2F90404FLL;
    if (!a2)
      return v4;
    v70 = (0xC949D7C7509E6557 * (a2 + 4 * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                   * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
LABEL_13:
    v4 *= v70 ^ (v70 >> 47);
    return v4;
  }
  v2 = *(uint64_t *)((char *)a1 + a2 - 8);
  v3 = __ROR8__(v2 + a2, a2);
  return (0x9DDFEA08EB382D69
        * ((0x9DDFEA08EB382D69
          * (v3 ^ ((0x9DDFEA08EB382D69 * (v3 ^ *a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v3 ^ *a1)))) ^ ((0x9DDFEA08EB382D69 * (v3 ^ ((0x9DDFEA08EB382D69 * (v3 ^ *a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v3 ^ *a1)))) >> 47))) ^ v2;
}

void std::__throw_bad_array_new_length[abi:nn180100]()
{
  abort();
}

void SWCFNMatch::_tryMatchingVariable(SWCSubstitutionVariable const*,std::string_view const&,std::string_view const&,int)const::$_0::operator()(uint64_t **a1, uint64_t a2, _BYTE *a3)
{
  size_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  unsigned int *v10;
  uint64_t *v11;
  size_t v12;
  size_t v13;
  size_t v14;
  NSObject *v15;
  char *v16;
  size_t v17;
  NSObject *v18;
  int v19;
  int v20;
  void *v21;
  void *v22;
  _OWORD __dst[8];
  uint8_t buf[4];
  _OWORD *v26;
  __int128 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a2 + 8);
  v5 = a1[1];
  v6 = **a1;
  v7 = v6 + v4;
  v8 = a1[2];
  v9 = a1[3];
  v10 = (unsigned int *)a1[4];
  v11 = a1[5];
  v12 = v6 + v4 + 1;
  if (v6 + v4 == -1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void SWCWithFastBuffer(NSUInteger, const FunctionType &) [ElementType = char, ArraySize = 128UL, FunctionType = (lambda at /Library/Caches/com.apple.xbs/Sources/EmbeddedSharedWebCredentials/Sources/SWCPattern.mm:2001:65)]");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("SWCLogging.h"), 157, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("count > 0"));

    v13 = *(_QWORD *)(a2 + 8);
    goto LABEL_4;
  }
  if (v12 <= 0x80)
  {
    v13 = *(_QWORD *)(a2 + 8);
LABEL_4:
    memset(__dst, 0, sizeof(__dst));
    if (v13)
      memmove(__dst, *(const void **)a2, v13);
    v14 = v5[1];
    if (v14)
      memmove((char *)__dst + v4, (const void *)*v5, v14);
    *(_QWORD *)&v27 = __dst;
    *((_QWORD *)&v27 + 1) = v7;
    if (std::string_view::find[abi:nn180100]((char *)__dst, v7) >= v13)
    {
      ++*((_DWORD *)v8 + 8);
      v19 = SWCFNMatch::_execute(v8, &v27, v9, *v10);
      --*((_DWORD *)v8 + 8);
      if (v19)
      {
        *(_BYTE *)v11 = 1;
        *a3 = 1;
      }
    }
    else
    {
      if (qword_1ED1B6168 != -1)
        dispatch_once(&qword_1ED1B6168, &__block_literal_global_218);
      v15 = qword_1ED1B6160;
      if (os_log_type_enabled((os_log_t)qword_1ED1B6160, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v26 = __dst;
        _os_log_impl(&dword_1A855A000, v15, OS_LOG_TYPE_INFO, "Substitution variable value composed to another substitution variable: \"%s\". Rejecting.", buf, 0xCu);
      }
    }
    return;
  }
  if ((v12 & 0x8000000000000000) != 0)
    abort();
  v16 = (char *)operator new(v6 + v4 + 1);
  bzero(v16, v12);
  if (v4)
    memmove(v16, *(const void **)a2, v4);
  v17 = v5[1];
  if (v17)
    memmove(&v16[v4], (const void *)*v5, v17);
  *(_QWORD *)&__dst[0] = v16;
  *((_QWORD *)&__dst[0] + 1) = v7;
  if (std::string_view::find[abi:nn180100](v16, v7) >= v4)
  {
    ++*((_DWORD *)v8 + 8);
    v20 = SWCFNMatch::_execute(v8, __dst, v9, *v10);
    --*((_DWORD *)v8 + 8);
    if (v20)
    {
      *(_BYTE *)v11 = 1;
      *a3 = 1;
    }
  }
  else
  {
    if (qword_1ED1B6168 != -1)
      dispatch_once(&qword_1ED1B6168, &__block_literal_global_218);
    v18 = qword_1ED1B6160;
    if (os_log_type_enabled((os_log_t)qword_1ED1B6160, OS_LOG_TYPE_INFO))
    {
      LODWORD(v27) = 136315138;
      *(_QWORD *)((char *)&v27 + 4) = v16;
      _os_log_impl(&dword_1A855A000, v18, OS_LOG_TYPE_INFO, "Substitution variable value composed to another substitution variable: \"%s\". Rejecting.", (uint8_t *)&v27, 0xCu);
    }
  }
  operator delete(v16);
}

void sub_1A8563FD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{

  _Unwind_Resume(a1);
}

uint64_t std::__hash_table<std::__hash_value_type<std::string_view,SWCSubstitutionVariable const*>,std::__unordered_map_hasher<std::string_view,std::__hash_value_type<std::string_view,SWCSubstitutionVariable const*>,std::hash<std::string_view>,std::equal_to<std::string_view>,true>,std::__unordered_map_equal<std::string_view,std::__hash_value_type<std::string_view,SWCSubstitutionVariable const*>,std::equal_to<std::string_view>,std::hash<std::string_view>,true>,std::allocator<std::__hash_value_type<std::string_view,SWCSubstitutionVariable const*>>>::~__hash_table(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;

  v2 = *(_QWORD **)(a1 + 16);
  if (v2)
  {
    do
    {
      v3 = (_QWORD *)*v2;
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
  v4 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v4)
    operator delete(v4);
  return a1;
}

void sub_1A856417C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A856436C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  void *v26;
  void *v27;
  uint64_t v28;

  _Block_object_dispose(&a21, 8);
  _Block_object_dispose((const void *)(v28 - 128), 8);

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

void sub_1A856458C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A85647D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A85649E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, id a12)
{
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1A8564BB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  void *v26;
  void *v27;
  uint64_t v28;

  _Block_object_dispose(&a21, 8);
  _Block_object_dispose((const void *)(v28 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A8564D74(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A8564F28(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1A8565144(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A8565240(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A85652CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A8565358(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A85653EC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A8565478(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A8565928(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v10 = v6;

  _Unwind_Resume(a1);
}

void sub_1A8565C48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;

  _Block_object_dispose(&a21, 8);
  _Block_object_dispose((const void *)(v29 - 112), 8);

  _Unwind_Resume(a1);
}

void sub_1A8565EAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;

  _Block_object_dispose(&a21, 8);
  _Block_object_dispose((const void *)(v29 - 112), 8);

  _Unwind_Resume(a1);
}

void sub_1A8565FF0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A8566148(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A856627C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A8566314(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A8566414(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A856650C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A856661C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A8566728(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A856684C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A85668E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A8566970(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A8566A5C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1A8566BBC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A8566C5C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A8567270(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, uint64_t a17, void *a18)
{
  void *v18;

  _Unwind_Resume(a1);
}

void sub_1A85673CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A85674CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_1A85678FC(_Unwind_Exception *exception_object, int a2)
{
  void *v2;

  if (a2)
  {

    objc_begin_catch(exception_object);
    os_unfair_recursive_lock_unlock();
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_1A8567C30(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_1A8567FD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1A8568288(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1A8568428(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_1A85684E8(void *a1)
{
  void *v1;
  void *v2;

  objc_begin_catch(a1);
  os_unfair_recursive_lock_unlock();
  objc_exception_rethrow();
}

void sub_1A8568520(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1A8568590(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_recursive_lock_unlock();
  objc_exception_rethrow();
}

void sub_1A85685A8(_Unwind_Exception *a1)
{
  void *v1;

  objc_end_catch();

  _Unwind_Resume(a1);
}

void sub_1A8568658(void *a1)
{
  objc_begin_catch(a1);
  os_unfair_recursive_lock_unlock();
  objc_exception_rethrow();
}

void sub_1A8568670(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  objc_end_catch();

  _Unwind_Resume(a1);
}

void sub_1A85688A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v9 = v6;

  _Unwind_Resume(a1);
}

void sub_1A8568ABC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A8568BD8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A8568D9C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A85690B0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A85694B4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A8569650(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A8569768(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A856980C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A856986C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A85699BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A8569AD0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A8569BF0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A8569CD0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A8569D6C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A8569DEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A8569E7C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A8569F8C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t _SWCEnabledConfigurationGetFromDetails(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v1 = a1;
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("alwaysEnabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("enabledByDefault"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v2, "BOOLValue") & 1) != 0)
  {
    v4 = 1;
  }
  else if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    if (objc_msgSend(v3, "BOOLValue"))
      v4 = 2;
    else
      v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void sub_1A856A06C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t _SWCFieldsEncodeWithCoder(int a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "encodeInt64:forKey:", *(_QWORD *)&a1 & 0xFFFFFFLL, a3);
}

uint64_t _SWCFieldsMakeWithCoder(void *a1, uint64_t a2)
{
  return objc_msgSend(a1, "decodeInt64ForKey:", a2);
}

void _SWCFieldsLogDebugDescription(unsigned int a1, __sFILE *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  objc_object *v11;
  objc_object *v12;
  id v13;

  v13 = a3;
  logApprovalState(a2, CFSTR("User Approval"), a1 & 3);
  logApprovalState(a2, CFSTR("Site/Fmwk Approval"), (a1 >> 2) & 3);
  v5 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v6 = v5;
  if ((a1 & 0x10) != 0)
    objc_msgSend(v5, "addObject:", CFSTR("updating"));
  if ((a1 & 0x20) != 0)
    objc_msgSend(v6, "addObject:", CFSTR("systemApplication"));
  if ((a1 & 0x100) != 0)
    objc_msgSend(v6, "addObject:", CFSTR("enterpriseManaged"));
  if ((a1 & 0x200) != 0)
    objc_msgSend(v6, "addObject:", CFSTR("systemPlaceholder"));
  v7 = (a1 >> 6) - 1;
  if (v7 <= 2)
    objc_msgSend(v6, "addObject:", off_1E547D1A0[v7]);
  v8 = (((unint64_t)(unsigned __int16)a1 >> 10) & 7) - 1;
  if (v8 <= 2)
    objc_msgSend(v6, "addObject:", off_1E547D1B8[v8]);
  if (v13)
    objc_msgSend(v6, "unionSet:", v13);
  v9 = (void *)MEMORY[0x1A85D4B3C]();
  objc_msgSend(v6, "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "componentsJoinedByString:", CFSTR(", "));
  v11 = (objc_object *)objc_claimAutoreleasedReturnValue();
  logValueForOptionalKey(a2, CFSTR("Flags"), v11, -1, -1, 1);

  objc_autoreleasePoolPop(v9);
  if (BYTE2(a1))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", SBYTE2(a1));
    v12 = (objc_object *)objc_claimAutoreleasedReturnValue();
    logValueForOptionalKey(a2, CFSTR("Relative Order"), v12, -1, -1, 1);

  }
}

void sub_1A856A294(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void logApprovalState(__sFILE *a1, void *a2, unsigned int a3)
{
  objc_object *v5;
  int v6;
  int v7;
  NSString *v8;

  v8 = a2;
  _SWCServiceApprovalStateGetDebugDescription(a3);
  v5 = (objc_object *)objc_claimAutoreleasedReturnValue();
  if (a3 == 2)
    v6 = 160;
  else
    v6 = 8;
  if (a3 == 1)
    v7 = 42;
  else
    v7 = v6;
  logValueForOptionalKey(a1, v8, v5, v7, -1, 1);

}

void sub_1A856A360(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

__CFString *_SWCServiceApprovalStateGetDebugDescription(unsigned int a1)
{
  __CFString *v1;

  if (a1 >= 3)
    v1 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%llu"), a1);
  else
    v1 = off_1E547D1D0[(char)a1];
  return v1;
}

void _SWCSetServerListenerForTests(void *a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a1;
  +[_SWCPrefs sharedPrefs](_SWCPrefs, "sharedPrefs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAppleInternal");

  if ((v3 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _SWCSetServerListenerForTests(NSXPCListener *__strong _Nullable)");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("SWCServerProtocol.mm"), 170, CFSTR("Cannot change the SWC XPC server object here"));

  }
  v4 = (void *)MEMORY[0x1A85D4B3C]();
  os_unfair_lock_lock(&gLock);
  if (_MergedGlobals_3)
  {
    objc_msgSend((id)_MergedGlobals_3, "invalidate");
    v5 = (void *)_MergedGlobals_3;
    _MergedGlobals_3 = 0;

  }
  if (gTestListener)
    objc_msgSend((id)gTestListener, "invalidate");
  objc_storeStrong((id *)&gTestListener, a1);
  os_unfair_lock_unlock(&gLock);
  objc_autoreleasePoolPop(v4);

}

void sub_1A856A6B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

BOOL _SWCServerIsUsingTestListener()
{
  void *v0;
  _BOOL8 v1;

  v0 = (void *)MEMORY[0x1A85D4B3C]();
  os_unfair_lock_lock(&gLock);
  v1 = gTestListener != 0;
  os_unfair_lock_unlock(&gLock);
  objc_autoreleasePoolPop(v0);
  return v1;
}

BOOL _SWCGetAuditTokenForSelf(_OWORD *a1)
{
  kern_return_t v2;
  __int128 v3;
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[4];
  __int128 v7;

  task_info_outCnt = 8;
  v2 = task_info(*MEMORY[0x1E0C83DA0], 0xFu, task_info_out, &task_info_outCnt);
  if (a1 && !v2)
  {
    v3 = v7;
    *a1 = *(_OWORD *)task_info_out;
    a1[1] = v3;
  }
  return v2 == 0;
}

BOOL _SWCCanAuditTokenConnect()
{
  objc_msgSend(CFSTR("com.apple.SharedWebCredentials"), "UTF8String");
  return sandbox_check_by_audit_token() == 0;
}

void ___ZL34_SWCGetEntitlementsNeededForAccessP6NSData_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", &unk_1E5480FA8);
  v1 = (void *)qword_1ED1B6280;
  qword_1ED1B6280 = v0;

}

uint64_t _SWCServiceTypeIsWhitelisted(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  _SWCServiceTypeGetCanonicals();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", v1);

  return v3;
}

void sub_1A856A884(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id _SWCServiceTypeGetCanonicals(void)
{
  if (qword_1ED1B6298 != -1)
    dispatch_once(&qword_1ED1B6298, &__block_literal_global_4);
  return (id)_MergedGlobals_4;
}

uint64_t _SWCServiceTypeIsWhitelistedForAppClips(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqual:", CFSTR("appclips")) & 1) != 0)
    v2 = 1;
  else
    v2 = objc_msgSend(v1, "isEqual:", CFSTR("webcredentials"));

  return v2;
}

void sub_1A856A92C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id _SWCServiceTypeCanonicalize(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v1 = a1;
  _SWCServiceTypeGetCanonicals();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "member:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = v1;
  v5 = v3;

  return v5;
}

void sub_1A856A9A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t _SWCServiceTypeMaximumDetailsCount(void *a1)
{
  return objc_msgSend(a1, "isEqual:", CFSTR("applinks")) << 63 >> 63;
}

void ___ZL28_SWCServiceTypeGetCanonicalsv_block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[8];

  v4[7] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v4[0] = CFSTR("activitycontinuation");
  v4[1] = CFSTR("applinks");
  v4[2] = CFSTR("webcredentials");
  v4[3] = CFSTR("messagefilter");
  v4[4] = CFSTR("classificationreport");
  v4[5] = CFSTR("authsrv");
  v4[6] = CFSTR("appclips");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 7);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v0, "initWithArray:", v1);
  v3 = (void *)_MergedGlobals_4;
  _MergedGlobals_4 = v2;

}

void sub_1A856AAB4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A856AB94(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A856ADE0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1A856AFD0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A856B220(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1A856B358(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A856B40C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A856B48C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A856B57C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1A856B638(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A856B744(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  _Unwind_Resume(a1);
}

void sub_1A856B78C()
{
  JUMPOUT(0x1A856B77CLL);
}

void sub_1A856B794()
{
  JUMPOUT(0x1A856B780);
}

void sub_1A856B800(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A856B8B0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A856BA90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id a28)
{
  void *v28;
  void *v29;
  uint64_t v30;

  _Block_object_dispose(&a23, 8);
  _Block_object_dispose((const void *)(v30 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void sub_1A856BCEC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A856BF6C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A856C2B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1A856C3D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A856C440(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A856C4A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A856C59C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  void *v18;
  void *v19;
  void *v20;

  _Unwind_Resume(a1);
}

void sub_1A856C61C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A856C67C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A856C74C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  void *v7;
  void *v8;
  va_list va;

  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A856C7C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A856C894(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1A856C910(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A856CB08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id a32)
{
  void *v32;
  void *v33;

  _Block_object_dispose(&a21, 8);

  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1A856CC24(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A856CD9C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1A856CE68(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A856CF00(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A856CFA8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A856D178(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  void *v20;
  void *v21;

  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_1A856D26C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A856D2BC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A856D398(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A856D42C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A856D4F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A856D564(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A856D6EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

uint64_t _SWCFileIsTTY(FILE *a1)
{
  int v1;
  int v2;
  uint64_t result;

  v1 = fileno(a1);
  if (v1 < 0)
    return 0;
  v2 = v1;
  result = isatty(v1);
  if ((_DWORD)result)
    return *(_DWORD *)forcedTTY() == v2 || getenv("TERM") != 0;
  return result;
}

_DWORD *_SWCForceTTY()
{
  _DWORD *result;
  int v1;

  result = (_DWORD *)forcedTTY();
  *result = v1;
  return result;
}

uint64_t _SWCLogSeparator(FILE *a1)
{
  __int128 v2;
  _OWORD v4[5];
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5 = 0;
  *(_QWORD *)&v2 = 0x2D2D2D2D2D2D2D2DLL;
  *((_QWORD *)&v2 + 1) = 0x2D2D2D2D2D2D2D2DLL;
  v4[0] = v2;
  v4[1] = v2;
  v4[2] = v2;
  v4[3] = v2;
  v4[4] = v2;
  fputs((const char *)v4, a1);
  return fputc(10, a1);
}

void _SWCLogHeader(FILE *a1, void *a2)
{
  id v3;
  int IsTTY;
  id v5;
  const char *v6;
  size_t v7;
  size_t v8;
  __int128 v9;
  size_t v10;
  char *v11;
  _OWORD v12[5];
  char v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fputc(10, a1);
  IsTTY = _SWCFileIsTTY(a1);
  if (IsTTY)
    fputs("\x1B[1m", a1);
  objc_msgSend(v3, "uppercaseString");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = (const char *)objc_msgSend(v5, "UTF8String");

  v7 = strlen(v6);
  if (v7 < 0x4E)
  {
    v8 = v7;
    v13 = 0;
    *(_QWORD *)&v9 = 0x3D3D3D3D3D3D3D3DLL;
    *((_QWORD *)&v9 + 1) = 0x3D3D3D3D3D3D3D3DLL;
    v12[0] = v9;
    v12[1] = v9;
    v12[2] = v9;
    v12[3] = v9;
    v12[4] = v9;
    v10 = 80 - v7;
    v11 = (char *)v12 + ((80 - v7) >> 1);
    *(v11 - 1) = 32;
    memcpy(v11, v6, v8);
    *((_BYTE *)v12 + v8 + (v10 >> 1)) = 32;
    fputs((const char *)v12, a1);
  }
  else
  {
    fputs(v6, a1);
  }
  if (IsTTY)
    fputs("\x1B[0m", a1);
  fputc(10, a1);

}

void sub_1A856DA20(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void _SWCLogValueForKey(__sFILE *a1, NSString *a2, objc_object *a3, int a4, int a5)
{
  logValueForOptionalKey(a1, a2, a3, a4, a5, 1);
}

void logValueForOptionalKey(__sFILE *a1, NSString *a2, objc_object *a3, int a4, int a5, int a6)
{
  objc_object *v11;
  int IsTTY;
  id v13;
  char v14;
  CFTypeID TypeID;
  int v16;
  __CFString *v17;
  __CFString *v18;
  id v19;
  const char *v20;
  char v21;
  char v22;
  NSString *v23;

  v23 = a2;
  v11 = a3;
  IsTTY = _SWCFileIsTTY(a1);
  if (!v23)
    goto LABEL_6;
  if (IsTTY)
    fputs("\x1B[1m", a1);
  -[NSString stringByAppendingString:](v23, "stringByAppendingString:", CFSTR(": "));
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  fprintf(a1, "%-22s", (const char *)objc_msgSend(v13, "UTF8String"));

  if (IsTTY)
  {
    fputs("\x1B[0m", a1);
LABEL_6:
    v14 = IsTTY ^ 1;
    if (a4 < 0)
      v14 = 1;
    if ((v14 & 1) == 0 && (_SWCFileIsTTY(a1) & 1) != 0)
    {
      fprintf(a1, "\x1B[38;5;%um", a4);
      if ((a5 & 0x80000000) == 0)
        fprintf(a1, "\x1B[48;5;%um", a5);
    }
  }
  if (v11)
  {
    TypeID = CFBooleanGetTypeID();
    if (TypeID == CFGetTypeID(v11))
    {
      v16 = -[objc_object BOOLValue](v11, "BOOLValue");
      v17 = CFSTR("no");
      if (v16)
        v17 = CFSTR("yes");
      v18 = v17;

      v11 = (objc_object *)v18;
    }
  }
  -[objc_object description](v11, "description");
  v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v20 = (const char *)objc_msgSend(v19, "UTF8String");
  if (!v20)
    v20 = "(null)";
  fputs(v20, a1);

  v21 = IsTTY ^ 1;
  if ((a5 & a4) < 0 != v22)
    v21 = 1;
  if ((v21 & 1) == 0)
    fputs("\x1B[0m", a1);
  if (a6)
    fputc(10, a1);

}

void sub_1A856DC28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void _SWCLogObject(__sFILE *a1, objc_object *a2, int a3, int a4)
{
  logValueForOptionalKey(a1, 0, a2, a3, a4, 0);
}

void _SWCLogLine(__sFILE *a1, objc_object *a2, int a3, int a4)
{
  logValueForOptionalKey(a1, 0, a2, a3, a4, 1);
}

void sub_1A856DCA8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A856E054(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, uint64_t a14, void *a15, void *a16)
{
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1A856E218(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A856E3C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v2;

  _Unwind_Resume(a1);
}

void sub_1A856EAD0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A856EE80(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A856F088(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A856F124(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A856F430(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A856F564(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A856F748(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  _Unwind_Resume(a1);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80368](data, *(_QWORD *)&len, md);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

CFPropertyListRef CFPropertyListCreateDeepCopy(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AB0](allocator, propertyList, mutabilityOption);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x1E0C990C0](theString, range.location, range.length, buffer);
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1E0C990C8](theString);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFPropertyListCreateFiltered()
{
  return MEMORY[0x1E0C9A3F8]();
}

uint64_t _NSIsNSArray()
{
  return MEMORY[0x1E0C9A860]();
}

uint64_t _NSIsNSData()
{
  return MEMORY[0x1E0C9A878]();
}

uint64_t _NSIsNSDictionary()
{
  return MEMORY[0x1E0C9A888]();
}

uint64_t _NSIsNSString()
{
  return MEMORY[0x1E0C9A8B0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1E0DE43E8](__n);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

void operator delete(void *__p)
{
  off_1E547C870(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E547C878(__sz);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1E0C80C70](*(_QWORD *)&a1);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
  MEMORY[0x1E0C81580](__buf, __nbytes);
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return MEMORY[0x1E0DE40F0](atoken);
}

int audit_token_to_pidversion(audit_token_t *atoken)
{
  return MEMORY[0x1E0DE40F8](atoken);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

id class_createInstance(Class cls, size_t extraBytes)
{
  return (id)MEMORY[0x1E0DE7A90](cls, extraBytes);
}

uint64_t container_create_or_lookup_path_for_current_user()
{
  return MEMORY[0x1E0C82818]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
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

long double exp2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83288](__x);
  return result;
}

int fileno(FILE *a1)
{
  return MEMORY[0x1E0C833B0](a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x1E0C83488](*(_QWORD *)&a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x1E0C83490](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C83660](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return MEMORY[0x1E0C83970](*(_QWORD *)&a1, a2, a3);
}

int isatty(int a1)
{
  return MEMORY[0x1E0C839A8](*(_QWORD *)&a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C84070](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
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

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1E0C849B8]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x1E0C849D0]();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1E0C849F8]();
}

uint64_t sandbox_check_by_audit_token()
{
  return MEMORY[0x1E0C85180]();
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C85518](__s, *(_QWORD *)&__c);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85658](__str, __endptr, *(_QWORD *)&__base);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1E0C85838](*(_QWORD *)&target_task, *(_QWORD *)&flavor, task_info_out, task_info_outCnt);
}

int32_t u_strcasecmp(const UChar *s1, const UChar *s2, uint32_t options)
{
  return MEMORY[0x1E0DE5AD0](s1, s2, *(_QWORD *)&options);
}

int32_t utf8_back1SafeBody(const uint8_t *s, int32_t start, int32_t i)
{
  return MEMORY[0x1E0DE6AB8](s, *(_QWORD *)&start, *(_QWORD *)&i);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x1E0C85F00](xBOOL);
}

uint64_t xpc_copy_entitlement_for_self()
{
  return MEMORY[0x1E0C86118]();
}

uint64_t xpc_copy_entitlement_for_token()
{
  return MEMORY[0x1E0C86120]();
}

uint64_t xpc_copy_entitlements_data_for_token()
{
  return MEMORY[0x1E0C86128]();
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1E0C86198](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1E0C861A8](xdata);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

