uint64_t NEHelperIsOSFeatureEnabled()
{
  return _os_feature_enabled_impl();
}

void NEHelperTrackerFreeAppInfo(void *a1)
{
  if (a1)
    free(a1);
}

BOOL NEHelperTrackerAppInfoSetAuditToken(uint64_t a1, __int128 *a2, __int128 *a3)
{
  __int128 v3;
  __int128 v4;

  if (a1)
  {
    v3 = *a2;
    *(_OWORD *)(a1 + 24) = a2[1];
    *(_OWORD *)(a1 + 8) = v3;
    v4 = *a3;
    *(_OWORD *)(a1 + 88) = a3[1];
    *(_OWORD *)(a1 + 72) = v4;
  }
  return a1 != 0;
}

unint64_t NEHelperTrackerContextGetDomainOwner(unint64_t a1)
{
  unint64_t domain_owner;
  BOOL v2;
  BOOL v3;

  domain_owner = a1;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&ne_helper_tracker_lock);
    v2 = ne_helper_tracker_trie == 0x5061747269636961 && unk_253D8F510 == 2;
    if (v2
      && (qword_253D8F528 <= domain_owner
        ? (v3 = qword_253D8F528 + (unint64_t)(unsigned __int16)word_253D8F53C - 1 >= domain_owner)
        : (v3 = 0),
          v3))
    {
      domain_owner = ne_tracker_context_get_domain_owner();
    }
    else
    {
      domain_owner = 0;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&ne_helper_tracker_lock);
  }
  return domain_owner;
}

unint64_t NEHelperTrackerContextGetDomain(unint64_t a1)
{
  unint64_t domain;
  BOOL v2;
  BOOL v3;

  domain = a1;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&ne_helper_tracker_lock);
    v2 = ne_helper_tracker_trie == 0x5061747269636961 && unk_253D8F510 == 2;
    if (v2
      && (qword_253D8F528 <= domain
        ? (v3 = qword_253D8F528 + (unint64_t)(unsigned __int16)word_253D8F53C - 1 >= domain)
        : (v3 = 0),
          v3))
    {
      domain = ne_tracker_context_get_domain();
    }
    else
    {
      domain = 0;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&ne_helper_tracker_lock);
  }
  return domain;
}

unint64_t NEHelperTrackerContextCanBlockRequest(unint64_t a1)
{
  unint64_t can_block_request;
  BOOL v2;
  BOOL v3;

  can_block_request = a1;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&ne_helper_tracker_lock);
    v2 = ne_helper_tracker_trie == 0x5061747269636961 && unk_253D8F510 == 2;
    if (v2
      && (qword_253D8F528 <= can_block_request
        ? (v3 = qword_253D8F528 + (unint64_t)(unsigned __int16)word_253D8F53C - 1 >= can_block_request)
        : (v3 = 0),
          v3))
    {
      can_block_request = ne_tracker_context_can_block_request();
    }
    else
    {
      can_block_request = 0;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&ne_helper_tracker_lock);
  }
  return can_block_request;
}

uint64_t ne_get_configuration_generation()
{
  int v0;
  uint32_t v1;
  uint32_t v2;
  NSObject *v3;
  uint32_t state;
  uint32_t v5;
  const char *v6;
  uint64_t v8;
  int check;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint32_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v0 = ne_get_configuration_generation_configuration_changed_token;
  if (ne_get_configuration_generation_configuration_changed_token < 0)
  {
    if (notify_register_check("com.apple.neconfigurationchanged", &ne_get_configuration_generation_configuration_changed_token))
    {
      ne_get_configuration_generation_configuration_changed_token = -1;
      return ne_get_configuration_generation_current_generation;
    }
    v0 = ne_get_configuration_generation_configuration_changed_token;
    if (ne_get_configuration_generation_configuration_changed_token < 0)
      return ne_get_configuration_generation_current_generation;
  }
  check = 0;
  v1 = notify_check(v0, &check);
  if (!v1)
  {
    if (!check)
      return ne_get_configuration_generation_current_generation;
    v8 = 0;
    state = notify_get_state(ne_get_configuration_generation_configuration_changed_token, &v8);
    if (!state)
    {
      ne_get_configuration_generation_current_generation = v8 & 0x1FFFFFFFFFFFFFLL;
      return ne_get_configuration_generation_current_generation;
    }
    v5 = state;
    v3 = ne_log_obj();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      goto LABEL_4;
    *(_DWORD *)buf = 136315650;
    v11 = "com.apple.neconfigurationchanged";
    v12 = 1024;
    v13 = ne_get_configuration_generation_configuration_changed_token;
    v14 = 1024;
    v15 = v5;
    v6 = "notify_get_state failed for %s, token = %d: %u";
    goto LABEL_16;
  }
  v2 = v1;
  v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v11 = "com.apple.neconfigurationchanged";
    v12 = 1024;
    v13 = ne_get_configuration_generation_configuration_changed_token;
    v14 = 1024;
    v15 = v2;
    v6 = "notify_check failed for %s, token = %d: %u";
LABEL_16:
    _os_log_error_impl(&dword_208439000, v3, OS_LOG_TYPE_ERROR, v6, buf, 0x18u);
  }
LABEL_4:
  notify_cancel(ne_get_configuration_generation_configuration_changed_token);
  ne_get_configuration_generation_configuration_changed_token = -1;
  ne_get_configuration_generation_current_generation = 0;
  return ne_get_configuration_generation_current_generation;
}

BOOL NEHelperTrackerAppInfoSetUUID(uint64_t a1, const unsigned __int8 *a2, const unsigned __int8 *a3)
{
  if (a1)
  {
    uuid_copy((unsigned __int8 *)(a1 + 40), a2);
    uuid_copy((unsigned __int8 *)(a1 + 104), a3);
  }
  return a1 != 0;
}

uint64_t NEHelperTrackerCheckMetadataForApp(uint64_t result)
{
  if (result)
    return ne_tracker_context_is_from_app_list();
  return result;
}

void NETrackerInsertTCCCache(char *a1, int a2)
{
  int64_t v3;
  uint64_t v4;
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  char *v8;
  char key[16];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  *(_OWORD *)key = 0u;
  v10 = 0u;
  NETrackerGenerateTCCCacheKey(a1, key, 0x80uLL);
  if (a2)
    v3 = 1;
  else
    v3 = 2;
  os_unfair_lock_lock((os_unfair_lock_t)&g_tcc_cache_lock);
  v4 = MEMORY[0x24BDACFA0];
  if (g_tcc_cache && MEMORY[0x20BD087A4]() == v4)
  {
    if (!g_tcc_cache)
      goto LABEL_12;
  }
  else
  {
    g_tcc_cache = (uint64_t)xpc_dictionary_create(0, 0, 0);
    if (!g_tcc_cache)
      goto LABEL_12;
  }
  if (MEMORY[0x20BD087A4]() == v4 && !xpc_dictionary_get_int64((xpc_object_t)g_tcc_cache, key))
    xpc_dictionary_set_int64((xpc_object_t)g_tcc_cache, key, v3);
LABEL_12:
  os_unfair_lock_unlock((os_unfair_lock_t)&g_tcc_cache_lock);
  v5 = ne_log_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6[0] = 67109378;
    v6[1] = v3;
    v7 = 2080;
    v8 = key;
    _os_log_debug_impl(&dword_208439000, v5, OS_LOG_TYPE_DEBUG, "NETrackerInsertTCCCache(): (%d) for bundle: (%s)", (uint8_t *)v6, 0x12u);
  }
}

uint64_t NEHelperIsTCCTrackingAllowed(uint64_t a1)
{
  int v2;
  int v3;
  _BOOL8 v4;

  v2 = NETrackerCheckTCCCache((char *)a1);
  if (v2 == 1)
    return 1;
  if (v2 == 2)
    return 0;
  if (a1)
  {
    if (*(_QWORD *)(a1 + 8))
    {
      v3 = TCCAccessPreflightWithAuditToken();
      goto LABEL_8;
    }
    NETrackerInsertTCCCache((char *)a1, 0);
    return 0;
  }
  v3 = TCCAccessPreflight();
LABEL_8:
  v4 = v3 == 0;
  if (v3 != 2)
    NETrackerInsertTCCCache((char *)a1, v3 == 0);
  return v4;
}

uint64_t NETrackerCheckTCCCache(char *a1)
{
  int64_t int64;
  NSObject *v2;
  int v4;
  int64_t v5;
  __int16 v6;
  char *v7;
  char key[16];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  *(_OWORD *)key = 0u;
  v9 = 0u;
  NETrackerGenerateTCCCacheKey(a1, key, 0x80uLL);
  os_unfair_lock_lock((os_unfair_lock_t)&g_tcc_cache_lock);
  if (g_tcc_cache && MEMORY[0x20BD087A4]() == MEMORY[0x24BDACFA0])
    int64 = xpc_dictionary_get_int64((xpc_object_t)g_tcc_cache, key);
  else
    int64 = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)&g_tcc_cache_lock);
  v2 = ne_log_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v4 = 134218242;
    v5 = int64;
    v6 = 2080;
    v7 = key;
    _os_log_debug_impl(&dword_208439000, v2, OS_LOG_TYPE_DEBUG, "NETrackerCheckTCCCache(): (%lld) for bundle: (%s)", (uint8_t *)&v4, 0x16u);
  }
  if ((unint64_t)(int64 - 1) >= 2)
    return 0;
  else
    return int64;
}

char *NETrackerGenerateTCCCacheKey(char *result, char *__dst, size_t __size)
{
  _DWORD *v3;

  if (!result)
    return strncpy(__dst, (const char *)TCC_CACHE_INTHEAPP_KEY, __size);
  v3 = (_DWORD *)*((_QWORD *)result + 1);
  if (v3)
    return (char *)snprintf(__dst, __size, "%x-%x-%x-%x-%x-%x-%x-%x", *v3, v3[1], v3[2], v3[3], v3[4], v3[5], v3[6], v3[7]);
  return result;
}

double NEHelperTrackerGetAppInfo()
{
  _OWORD *v0;
  double result;

  v0 = malloc_type_malloc(0x80uLL, 0x1050040CA3BB8F4uLL);
  if (v0)
  {
    result = 0.0;
    v0[6] = 0u;
    v0[7] = 0u;
    v0[4] = 0u;
    v0[5] = 0u;
    v0[2] = 0u;
    v0[3] = 0u;
    *v0 = 0u;
    v0[1] = 0u;
  }
  return result;
}

BOOL NEHelperIsBundle()
{
  __CFBundle *MainBundle;

  MainBundle = CFBundleGetMainBundle();
  return CFBundleGetIdentifier(MainBundle) != 0;
}

__CFBundle *NEHelperIsHostnameDesignatedTracker(__CFBundle *result)
{
  const char *v1;
  const __CFArray *v2;
  CFIndex Count;
  CFIndex v4;
  CFIndex v5;
  const __CFString *ValueAtIndex;
  size_t v7;
  uint64_t v8;
  size_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  _OWORD v17[16];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (result)
  {
    v1 = (const char *)result;
    result = CFBundleGetMainBundle();
    if (result)
    {
      result = (__CFBundle *)CFBundleGetValueForInfoDictionaryKey(result, CFSTR("NSPrivacyTrackingDomains"));
      if (result)
      {
        v2 = result;
        Count = CFArrayGetCount(result);
        if (Count < 1)
        {
          return 0;
        }
        else
        {
          v4 = Count;
          v5 = 0;
          while (1)
          {
            ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v2, v5);
            memset(v17, 0, 255);
            CFStringGetCString(ValueAtIndex, (char *)v17, 255, 0x8000100u);
            v7 = strlen(v1);
            if (v7)
              v8 = v1[v7 - 1] == 46 ? v7 - 1 : v7;
            else
              v8 = 0;
            v9 = strlen((const char *)v17);
            if (v9)
            {
              v10 = *((_BYTE *)v17 + v9 - 1) == 46 ? v9 - 1 : v9;
              v11 = !v10 || v8 == 0;
              if (!v11 && v8 >= v10)
              {
                while (1)
                {
                  v13 = v8 - 1;
                  if (v8 < 1)
                    break;
                  v14 = v10 - 1;
                  if (v10 < 1)
                    break;
                  v15 = v1[v8 - 1];
                  v16 = *((unsigned __int8 *)v17 + v10 - 1);
                  --v8;
                  --v10;
                  if (v15 != v16)
                  {
                    v8 = v13;
                    v10 = v14;
                    if ((v16 ^ v15) != 0x20)
                      goto LABEL_30;
                  }
                }
                if (v8 == v10 || v8 >= 1 && v1[v13] == 46)
                  return (__CFBundle *)1;
              }
            }
LABEL_30:
            if (++v5 == v4)
              return 0;
          }
        }
      }
    }
  }
  return result;
}

uint64_t NEHelperIsHostnameDesignatedTrackerExternal(const char *a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  NSObject *v8;
  uint32_t v9;
  const char *v10;
  const __CFString *v11;
  const __CFString *v12;
  int v13;
  uint64_t v14;
  NSObject *v15;
  const __CFAllocator *v16;
  CFStringRef v17;
  os_unfair_lock_s *v18;
  const __CFArray *v19;
  CFIndex Count;
  CFIndex v21;
  CFIndex v22;
  const __CFString *ValueAtIndex;
  size_t v24;
  uint64_t v25;
  size_t v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v30;
  uint64_t v31;
  int v32;
  int v33;
  int v34;
  void *AppTrackerDomains;
  void *v36;
  size_t v37;
  size_t v38;
  size_t v39;
  char v40;
  xpc_object_t value;
  const char *string_ptr;
  const char *v43;
  size_t v44;
  uint64_t v45;
  size_t v46;
  uint64_t v47;
  BOOL v48;
  uint64_t v50;
  uint64_t v51;
  int v52;
  int v53;
  NSObject *v54;
  CFStringRef v55;
  CFStringRef v56;
  NSObject *v57;
  int v58;
  int IsTCCTrackingAllowed;
  NSObject *v60;
  NSObject *v61;
  NSObject *v62;
  NSObject *v63;
  NSObject *v64;
  NSObject *v65;
  const char *v67;
  uint8_t *v68;
  NSObject *v69;
  const char *v70;
  __CFArray *theArray;
  uint8_t v72[4];
  const char *v73;
  __int16 v74;
  char *v75;
  char buffer[32];
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  uint8_t v89[30];
  uint8_t buf[16];
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
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  uint64_t v106;

  v2 = 0;
  v106 = *MEMORY[0x24BDAC8D0];
  if (!a1 || !a2)
    return v2;
  if (NEHelperIsHostnameDesignatedTrackerExternal_onceToken != -1)
    dispatch_once(&NEHelperIsHostnameDesignatedTrackerExternal_onceToken, &__block_literal_global_23);
  if (NEHelperIsHostnameDesignatedTrackerExternal_skip_daemon)
  {
    v5 = ne_log_obj();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      return 0;
    *(_WORD *)buf = 0;
    v6 = "Skipping external tracker check from system daemon";
    v7 = buf;
    goto LABEL_8;
  }
  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  v100 = 0u;
  v101 = 0u;
  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  v92 = 0u;
  v93 = 0u;
  *(_OWORD *)buf = 0u;
  v91 = 0u;
  v10 = *(const char **)a2;
  if (!*(_QWORD *)a2)
  {
    v11 = (const __CFString *)NECopySigningIdentifierForPIDwithAuditToken(*(_DWORD *)(a2 + 24), *(_QWORD *)(a2 + 8));
    if (!v11)
    {
      v5 = ne_log_obj();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        return 0;
      *(_WORD *)buffer = 0;
      v6 = "NEHelperIsHostnameDesignatedTrackerExternal(): cannot obtain signing identifier. returning ne_tracker_status_none.";
      v7 = (uint8_t *)buffer;
LABEL_8:
      v8 = v5;
      v9 = 2;
LABEL_9:
      _os_log_debug_impl(&dword_208439000, v8, OS_LOG_TYPE_DEBUG, v6, v7, v9);
      return 0;
    }
    v12 = v11;
    CFStringGetCString(v11, NEHelperIsHostnameDesignatedTrackerExternal_buffer, 254, 0x600u);
    CFRelease(v12);
    v13 = *(_DWORD *)(a2 + 24);
    if (!v13)
    {
      v14 = *(_QWORD *)(a2 + 8);
      if (v14)
        v13 = *(_DWORD *)(v14 + 20);
      else
        v13 = 0;
    }
    proc_name(v13, buf, 0x100u);
    v10 = NEHelperIsHostnameDesignatedTrackerExternal_buffer;
  }
  v15 = ne_log_obj();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buffer = 136315138;
    *(_QWORD *)&buffer[4] = v10;
    _os_log_debug_impl(&dword_208439000, v15, OS_LOG_TYPE_DEBUG, "NEHelperIsHostnameDesignatedTrackerExternal(): obtained signing identifier: (%s)", (uint8_t *)buffer, 0xCu);
  }
  v16 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v17 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], v10, 0x600u);
  v18 = NEHelperTrackerCacheGet((os_unfair_lock_s *)&g_tracker_cache, v17);
  if (v18)
  {
    v19 = (const __CFArray *)v18;
    Count = CFArrayGetCount((CFArrayRef)v18);
    if (Count < 1)
    {
      v34 = 0;
    }
    else
    {
      v21 = Count;
      v22 = 0;
      while (1)
      {
        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v19, v22);
        v88 = 0u;
        memset(v89, 0, sizeof(v89));
        v86 = 0u;
        v87 = 0u;
        v84 = 0u;
        v85 = 0u;
        v82 = 0u;
        v83 = 0u;
        v80 = 0u;
        v81 = 0u;
        v78 = 0u;
        v79 = 0u;
        v77 = 0u;
        memset(buffer, 0, sizeof(buffer));
        CFStringGetCString(ValueAtIndex, buffer, 253, 0x8000100u);
        v24 = strlen(a1);
        if (v24)
          v25 = a1[v24 - 1] == 46 ? v24 - 1 : v24;
        else
          v25 = 0;
        v26 = strlen(buffer);
        if (v26)
        {
          v27 = buffer[v26 - 1] == 46 ? v26 - 1 : v26;
          v28 = !v27 || v25 == 0;
          if (!v28 && v25 >= v27)
          {
            while (1)
            {
              v30 = v25 - 1;
              if (v25 < 1)
                break;
              v31 = v27 - 1;
              if (v27 < 1)
                break;
              v32 = a1[v25 - 1];
              v33 = buffer[v27 - 1];
              --v25;
              --v27;
              if (v32 != v33)
              {
                v25 = v30;
                v27 = v31;
                if ((v33 ^ v32) != 0x20)
                  goto LABEL_48;
              }
            }
            if (v25 == v27 || v25 >= 1 && a1[v30] == 46)
              break;
          }
        }
LABEL_48:
        if (++v22 == v21)
        {
          v34 = 0;
          goto LABEL_93;
        }
      }
      v69 = ne_log_obj();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v72 = 136380931;
        v73 = a1;
        v74 = 2081;
        v75 = buffer;
        _os_log_debug_impl(&dword_208439000, v69, OS_LOG_TYPE_DEBUG, "NEHelperIsHostnameDesignatedTrackerExternal(): found subdomain in cache. (%{private}s) is a subdomain of tracker domain (%{private}s)", v72, 0x16u);
      }
      v34 = 1;
    }
  }
  else
  {
    theArray = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
    AppTrackerDomains = (void *)NEHelperGetAppTrackerDomains();
    if (AppTrackerDomains)
    {
      v36 = AppTrackerDomains;
      v70 = v10;
      v37 = xpc_array_get_count(AppTrackerDomains);
      if (v37)
      {
        v38 = v37;
        v39 = 0;
        v40 = 0;
        do
        {
          value = xpc_array_get_value(v36, v39);
          string_ptr = xpc_string_get_string_ptr(value);
          if (string_ptr)
          {
            v43 = string_ptr;
            if ((v40 & 1) == 0)
            {
              v44 = strlen(a1);
              if (v44)
                v45 = a1[v44 - 1] == 46 ? v44 - 1 : v44;
              else
                v45 = 0;
              v46 = strlen(v43);
              if (v46)
              {
                v47 = v43[v46 - 1] == 46 ? v46 - 1 : v46;
                v48 = !v47 || v45 == 0;
                if (!v48 && v45 >= v47)
                {
                  while (1)
                  {
                    v50 = v45 - 1;
                    if (v45 < 1)
                      break;
                    v51 = v47 - 1;
                    if (v47 < 1)
                      break;
                    v52 = a1[v45 - 1];
                    v53 = v43[v47 - 1];
                    --v45;
                    --v47;
                    if (v52 != v53)
                    {
                      v45 = v50;
                      v47 = v51;
                      if ((v53 ^ v52) != 0x20)
                        goto LABEL_82;
                    }
                  }
                  if (v45 == v47 || v45 >= 1 && a1[v50] == 46)
                  {
                    v54 = ne_log_obj();
                    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buffer = 136380931;
                      *(_QWORD *)&buffer[4] = a1;
                      *(_WORD *)&buffer[12] = 2081;
                      *(_QWORD *)&buffer[14] = v43;
                      _os_log_debug_impl(&dword_208439000, v54, OS_LOG_TYPE_DEBUG, "NEHelperIsHostnameDesignatedTrackerExternal(): found subdomain. (%{private}s) is a subdomain of tracker domain (%{private}s)", (uint8_t *)buffer, 0x16u);
                    }
                    v40 = 1;
                  }
                }
              }
            }
LABEL_82:
            v55 = CFStringCreateWithCString(v16, v43, 0x600u);
            if (v55)
            {
              v56 = v55;
              CFArrayAppendValue(theArray, v55);
              CFRelease(v56);
            }
            else
            {
              v57 = ne_log_obj();
              if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buffer = 136315138;
                *(_QWORD *)&buffer[4] = v70;
                _os_log_debug_impl(&dword_208439000, v57, OS_LOG_TYPE_DEBUG, "NEHelperIsHostnameDesignatedTrackerExternal(): unable to cache domain for bundle (%s)", (uint8_t *)buffer, 0xCu);
              }
            }
          }
          ++v39;
        }
        while (v39 != v38);
      }
      else
      {
        v40 = 0;
      }
      xpc_release(v36);
      v10 = v70;
    }
    else
    {
      v40 = 0;
    }
    NEHelperTrackerCachePut((uint64_t)&g_tracker_cache, v17, (uint64_t)theArray);
    v34 = v40 & 1;
  }
LABEL_93:
  CFRelease(v17);
  v58 = *(_DWORD *)(a2 + 28);
  if (v58 == 2)
  {
    v60 = ne_log_obj();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buffer = 0;
      _os_log_debug_impl(&dword_208439000, v60, OS_LOG_TYPE_DEBUG, "NEHelperIsHostnameDesignatedTrackerExternal(): previous_tcc_check_result is ne_tcc_result_denied", (uint8_t *)buffer, 2u);
    }
    IsTCCTrackingAllowed = 0;
    goto LABEL_108;
  }
  if (!v58)
  {
    if (*(_QWORD *)(a2 + 8))
    {
      if (v34)
        IsTCCTrackingAllowed = NEHelperIsTCCTrackingAllowed(a2);
      else
        IsTCCTrackingAllowed = 1;
      v62 = ne_log_obj();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buffer = 0;
        _os_log_debug_impl(&dword_208439000, v62, OS_LOG_TYPE_DEBUG, "NEHelperIsHostnameDesignatedTrackerExternal(): previous_tcc_check_result is ne_tcc_result_not_performed and audit_token is set", (uint8_t *)buffer, 2u);
      }
      goto LABEL_108;
    }
    goto LABEL_102;
  }
  if (!*(_QWORD *)(a2 + 8))
  {
LABEL_102:
    v61 = ne_log_obj();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buffer = 0;
      _os_log_debug_impl(&dword_208439000, v61, OS_LOG_TYPE_DEBUG, "NEHelperIsHostnameDesignatedTrackerExternal(): context->audit_token is not set.", (uint8_t *)buffer, 2u);
    }
  }
  IsTCCTrackingAllowed = 1;
LABEL_108:
  v63 = ne_log_obj();
  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buffer = 67109376;
    *(_DWORD *)&buffer[4] = v34;
    *(_WORD *)&buffer[8] = 1024;
    *(_DWORD *)&buffer[10] = IsTCCTrackingAllowed;
    _os_log_debug_impl(&dword_208439000, v63, OS_LOG_TYPE_DEBUG, "NEHelperIsHostnameDesignatedTrackerExternal(): is_hostname_found: (%d), is_tcc_allowed: (%d)", (uint8_t *)buffer, 0xEu);
  }
  v64 = ne_log_obj();
  v65 = v64;
  if (!v34)
  {
    if (!os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
      return 0;
    *(_DWORD *)buffer = 136380675;
    *(_QWORD *)&buffer[4] = a1;
    v6 = "External check: hostname %{private}s is not a tracker. Returning: ne_tracker_status_none";
    v7 = (uint8_t *)buffer;
    v8 = v65;
    v9 = 12;
    goto LABEL_9;
  }
  if (IsTCCTrackingAllowed)
  {
    v2 = 2;
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buffer = 136380675;
      *(_QWORD *)&buffer[4] = a1;
      _os_log_debug_impl(&dword_208439000, v65, OS_LOG_TYPE_DEBUG, "External check: Tracking is allowed by the user, hostname %{private}s is a declared tracker. Returning: ne_tracker_status_declared", (uint8_t *)buffer, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      v67 = "";
      if (v10)
        v67 = v10;
      v68 = buf;
      if (!buf[0])
        v68 = (uint8_t *)v67;
      *(_DWORD *)buffer = 136315394;
      *(_QWORD *)&buffer[4] = a1;
      *(_WORD *)&buffer[12] = 2080;
      *(_QWORD *)&buffer[14] = v68;
      _os_log_impl(&dword_208439000, v65, OS_LOG_TYPE_DEFAULT, "Denied access to %s because it matches a domain in the NSTrackingDomains of %s, which does not have permission to track.", (uint8_t *)buffer, 0x16u);
    }
    return 1;
  }
  return v2;
}

os_unfair_lock_s *NEHelperTrackerCacheGet(os_unfair_lock_s *a1, const void *a2)
{
  os_unfair_lock_s *v2;
  os_unfair_lock_s *v4;
  const __CFData *Value;
  const UInt8 *BytePtr;
  uint64_t *v7;
  uint64_t v8;
  _QWORD *v9;
  os_unfair_lock_s *v10;
  os_unfair_lock_s *v11;
  os_unfair_lock_s *v12;
  os_unfair_lock_s *v13;

  v2 = a1;
  if (a1)
  {
    v4 = a1 + 4;
    os_unfair_lock_lock(a1 + 4);
    Value = (const __CFData *)CFDictionaryGetValue(*(CFDictionaryRef *)&v2[2]._os_unfair_lock_opaque, a2);
    if (Value && (BytePtr = CFDataGetBytePtr(Value), (v7 = *(uint64_t **)BytePtr) != 0))
    {
      v8 = *v7;
      v9 = (_QWORD *)v7[1];
      if (*v7)
      {
        *(_QWORD *)(v8 + 8) = v9;
        v9 = (_QWORD *)v7[1];
      }
      else
      {
        *(_QWORD *)&v2[8]._os_unfair_lock_opaque = v9;
      }
      *v9 = v8;
      v11 = *(os_unfair_lock_s **)&v2[6]._os_unfair_lock_opaque;
      v10 = v2 + 6;
      *v7 = (uint64_t)v11;
      v12 = v11 + 2;
      if (v11)
        v13 = v12;
      else
        v13 = v10 + 2;
      *(_QWORD *)&v13->_os_unfair_lock_opaque = v7;
      *(_QWORD *)&v10->_os_unfair_lock_opaque = v7;
      v7[1] = (uint64_t)v10;
      v2 = *(os_unfair_lock_s **)(*(_QWORD *)BytePtr + 24);
    }
    else
    {
      v2 = 0;
    }
    os_unfair_lock_unlock(v4);
  }
  return v2;
}

xpc_object_t NECopySigningIdentifierForPIDwithAuditToken(int a1, uint64_t a2)
{
  xpc_object_t result;
  void *v3;
  uint64_t v4;

  result = ne_copy_signing_identifier_for_pid_with_audit_token(a1, a2);
  if (result)
  {
    v3 = result;
    v4 = _CFXPCCreateCFObjectFromXPCObject();
    xpc_release(v3);
    return (xpc_object_t)v4;
  }
  return result;
}

xpc_object_t ne_copy_signing_identifier_for_pid_with_audit_token(int a1, uint64_t a2)
{
  unint64_t v4;
  _BYTE *v5;
  int *v6;
  unint64_t v7;
  xpc_object_t v8;
  NSObject *v9;
  int *v10;
  char *v11;
  NSObject *v12;
  _BOOL4 v13;
  int v15;
  _QWORD v16[2];
  _BYTE v17[4];
  unsigned int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  bzero(v17, 0x400uLL);
  v4 = 1023;
  v5 = v17;
  while (a2)
  {
    if (!csops_audittoken())
      goto LABEL_11;
LABEL_6:
    v6 = __error();
    if (v5 != v17 || *v6 != 34)
    {
      v9 = ne_log_obj();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = __error();
        v11 = strerror(*v10);
        v15 = 67109378;
        LODWORD(v16[0]) = a1;
        WORD2(v16[0]) = 2080;
        *(_QWORD *)((char *)v16 + 6) = v11;
        _os_log_error_impl(&dword_208439000, v9, OS_LOG_TYPE_ERROR, "Failed to get the signing identifier for %d: %s", (uint8_t *)&v15, 0x12u);
      }
      goto LABEL_18;
    }
    v4 = bswap32(v18);
    if ((v4 - 1048577) <= 0xFFF00006)
    {
      v12 = ne_log_obj();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v15 = 134217984;
        v16[0] = v4;
        _os_log_error_impl(&dword_208439000, v12, OS_LOG_TYPE_ERROR, "signing identifier length is invalid: %lu", (uint8_t *)&v15, 0xCu);
      }
      v5 = 0;
LABEL_18:
      v8 = 0;
      v13 = v5 != 0;
      goto LABEL_21;
    }
    v5 = malloc_type_malloc(v4 + 1, 0x100004077774924uLL);
    if (!v5)
      goto LABEL_18;
  }
  if (csops())
    goto LABEL_6;
LABEL_11:
  v7 = bswap32(*((_DWORD *)v5 + 1));
  if (v4 >= v7)
  {
    v5[v7] = 0;
    v8 = xpc_string_create(v5 + 8);
  }
  else
  {
    v8 = 0;
  }
  v13 = 1;
LABEL_21:
  if (v13 && v5 != v17)
    free(v5);
  return v8;
}

void NEHelperTrackerCachePut(uint64_t a1, const void *a2, uint64_t a3)
{
  os_unfair_lock_s *v6;
  const __CFDictionary *v7;
  const __CFData *Value;
  const UInt8 *BytePtr;
  uint64_t *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  CFDataRef v14;
  CFDataRef v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t **v21;
  uint64_t v22;
  uint64_t **v23;
  uint64_t **v24;
  UInt8 bytes[8];

  if (a1 && a2 && a3)
  {
    v6 = (os_unfair_lock_s *)(a1 + 16);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    v7 = *(const __CFDictionary **)(a1 + 8);
    if (v7)
    {
      Value = (const __CFData *)CFDictionaryGetValue(v7, a2);
      if (Value)
      {
        BytePtr = CFDataGetBytePtr(Value);
        v10 = *(uint64_t **)BytePtr;
        if (*(_QWORD *)BytePtr)
        {
          v11 = *v10;
          v12 = (_QWORD *)v10[1];
          if (*v10)
          {
            *(_QWORD *)(v11 + 8) = v12;
            v12 = (_QWORD *)v10[1];
          }
          else
          {
            *(_QWORD *)(a1 + 32) = v12;
          }
          *v12 = v11;
          v22 = *(_QWORD *)(a1 + 24);
          v21 = (uint64_t **)(a1 + 24);
          *v10 = v22;
          v23 = (uint64_t **)(v22 + 8);
          if (v22)
            v24 = v23;
          else
            v24 = v21 + 1;
          *v24 = v10;
          *v21 = v10;
          v10[1] = (uint64_t)v21;
          *(_QWORD *)(*(_QWORD *)BytePtr + 24) = a3;
        }
      }
      else
      {
        if (*(_DWORD *)a1 <= CFDictionaryGetCount(*(CFDictionaryRef *)(a1 + 8)))
          dealloc_appdata_node(a1, **(uint64_t ***)(*(_QWORD *)(a1 + 32) + 8));
        v13 = malloc_type_malloc(0x20uLL, 0xE0040B6E8BBF2uLL);
        if (v13)
        {
          v13[2] = a2;
          v13[3] = a3;
        }
        *(_QWORD *)bytes = v13;
        v14 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], bytes, 8);
        if (v14)
        {
          v15 = v14;
          CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 8), a2, v14);
          CFRelease(v15);
        }
        v16 = *(_QWORD *)bytes;
        if (*(_QWORD *)bytes)
        {
          v18 = *(_QWORD *)(a1 + 24);
          v17 = (_QWORD *)(a1 + 24);
          **(_QWORD **)bytes = v18;
          v19 = (_QWORD *)(v18 + 8);
          if (v18)
            v20 = v19;
          else
            v20 = v17 + 1;
          *v20 = v16;
          *v17 = v16;
          *(_QWORD *)(v16 + 8) = v17;
        }
      }
      os_unfair_lock_unlock(v6);
    }
    else
    {
      os_unfair_lock_unlock(v6);
    }
  }
}

uint64_t NEHelperTrackerGetDisposition(uint64_t a1, const __CFArray *a2, _QWORD *a3, CFIndex *a4)
{
  return NEHelperTrackerGetDispositionRedactLogs(a1, a2, a3, a4, 0);
}

BOOL NEHelperTrackerMatchDomain(_DWORD *a1, char *__s, uint64_t a3, _QWORD *a4, _BYTE *a5, int a6)
{
  int v11;
  int v12;
  uint64_t v13;
  char *v14;
  NSObject *v15;
  _BOOL4 v16;
  const char *v17;
  int v18;
  NSObject *v19;
  _BOOL8 result;
  int v21;
  NSObject *v22;
  _BOOL4 v23;
  int v24;
  const char *v25;
  int v26;
  int v27;
  const char *v28;
  NSObject *v29;
  uint32_t v30;
  const char *v31;
  int v32;
  const char *v33;
  NSObject *v34;
  uint32_t v35;
  const char *v36;
  int v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  _BYTE v41[14];
  __int16 v42;
  _BYTE v43[20];
  _BYTE v44[32];
  _BYTE v45[10];
  _BYTE v46[10];
  __int16 v47;
  const char *v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  const char *v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  if (!__s)
    return 0;
  v11 = strlen(__s);
  v12 = v11;
  if (!v11)
  {
    v19 = ne_log_obj();
    result = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
    if (!result)
      return result;
    if (!a1 || (v21 = a1[14]) == 0 && (v21 = a1[7]) == 0 && (v21 = a1[30]) == 0 && (v21 = a1[23]) == 0)
      v21 = 0;
LABEL_64:
    *(_DWORD *)buf = 136315650;
    v39 = "NEHelperTrackerMatchDomain";
    v40 = 1024;
    *(_DWORD *)v41 = (_DWORD)a1;
    *(_WORD *)&v41[4] = 1024;
    *(_DWORD *)&v41[6] = v21;
    _os_log_debug_impl(&dword_208439000, v19, OS_LOG_TYPE_DEBUG, "%s: Invalid lookup for zero-length domain (app info ref %X pid %d)", buf, 0x18u);
    return 0;
  }
  if (__s[v11 - 1] == 46)
  {
    v12 = v11 - 1;
    if (v11 == 1)
    {
      v19 = ne_log_obj();
      result = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
      if (!result)
        return result;
      if (!a1 || (v21 = a1[14]) == 0 && (v21 = a1[7]) == 0 && (v21 = a1[30]) == 0 && (v21 = a1[23]) == 0)
        v21 = 0;
      goto LABEL_64;
    }
  }
  if (v12 >= 1)
  {
    v13 = v12;
    v14 = __s;
    do
    {
      *v14 = __tolower(*v14);
      ++v14;
      --v13;
    }
    while (v13);
  }
  __s[v12] = 0;
  v15 = ne_log_obj();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
  if ((a6 & 1) != 0)
  {
    if (!v16)
      goto LABEL_16;
    v17 = "App";
    if (a1)
    {
      v18 = a1[14];
      if (!v18)
      {
        v18 = a1[7];
        if (!v18)
        {
          v18 = a1[30];
          if (!v18)
            v18 = a1[23];
        }
      }
      if ((a1[31] & 1) != 0)
        v17 = "Web";
    }
    else
    {
      v18 = 0;
    }
    *(_DWORD *)buf = 136317187;
    v39 = "NEHelperTrackerMatchDomain";
    v40 = 2160;
    *(_QWORD *)v41 = 1752392040;
    *(_WORD *)&v41[8] = 1040;
    *(_DWORD *)&v41[10] = v12;
    v42 = 2101;
    *(_QWORD *)v43 = __s;
    *(_WORD *)&v43[8] = 1024;
    *(_DWORD *)&v43[10] = (_DWORD)a1;
    *(_WORD *)&v43[14] = 1024;
    *(_DWORD *)&v43[16] = v18;
    *(_WORD *)v44 = 2080;
    *(_QWORD *)&v44[2] = "n/a";
    *(_WORD *)&v44[10] = 2080;
    *(_QWORD *)&v44[12] = "n/a";
    *(_WORD *)&v44[20] = 2080;
    *(_QWORD *)&v44[22] = v17;
    v28 = "%s domain lookup for%{sensitive, mask.hash, networkextension:string}.*P (app info ref %X pid %d for %s) %s - %s";
    v29 = v15;
    v30 = 80;
  }
  else
  {
    if (!v16)
      goto LABEL_16;
    v25 = "App";
    if (a1)
    {
      v26 = a1[14];
      if (!v26)
      {
        v26 = a1[7];
        if (!v26)
        {
          v26 = a1[30];
          if (!v26)
            v26 = a1[23];
        }
      }
      if ((a1[31] & 1) != 0)
        v25 = "Web";
    }
    else
    {
      v26 = 0;
    }
    *(_DWORD *)buf = 136316931;
    v39 = "NEHelperTrackerMatchDomain";
    v40 = 1024;
    *(_DWORD *)v41 = v12;
    *(_WORD *)&v41[4] = 2081;
    *(_QWORD *)&v41[6] = __s;
    v42 = 1024;
    *(_DWORD *)v43 = (_DWORD)a1;
    *(_WORD *)&v43[4] = 1024;
    *(_DWORD *)&v43[6] = v26;
    *(_WORD *)&v43[10] = 2080;
    *(_QWORD *)&v43[12] = "n/a";
    *(_WORD *)v44 = 2080;
    *(_QWORD *)&v44[2] = "n/a";
    *(_WORD *)&v44[10] = 2080;
    *(_QWORD *)&v44[12] = v25;
    v28 = "%s: domain lookup for<%d : %{private}s> (app info ref %X pid %d for %s) %s - %s";
    v29 = v15;
    v30 = 70;
  }
  _os_log_debug_impl(&dword_208439000, v29, OS_LOG_TYPE_DEBUG, v28, buf, v30);
LABEL_16:
  if (ne_trie_search() == 0xFFFF)
    return 0;
  v22 = ne_log_obj();
  v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG);
  if (a6)
  {
    if (v23)
    {
      v24 = strlen(__s);
      v36 = "App";
      if (a1)
      {
        v37 = a1[14];
        if (!v37)
        {
          v37 = a1[7];
          if (!v37)
          {
            v37 = a1[30];
            if (!v37)
              v37 = a1[23];
          }
        }
        if ((a1[31] & 1) != 0)
          v36 = "Web";
      }
      else
      {
        v37 = 0;
      }
      *(_DWORD *)buf = 136318723;
      v39 = "NEHelperTrackerMatchDomain";
      v40 = 2160;
      *(_QWORD *)v41 = 1752392040;
      *(_WORD *)&v41[8] = 1040;
      *(_DWORD *)&v41[10] = v24;
      v42 = 2101;
      *(_QWORD *)v43 = __s;
      *(_WORD *)&v43[8] = 2160;
      *(_QWORD *)&v43[10] = 1752392040;
      *(_WORD *)&v43[18] = 1040;
      *(_DWORD *)v44 = 4;
      *(_WORD *)&v44[4] = 2101;
      *(_QWORD *)&v44[6] = "null";
      *(_WORD *)&v44[14] = 2160;
      *(_QWORD *)&v44[16] = 1752392040;
      *(_WORD *)&v44[24] = 1040;
      *(_DWORD *)&v44[26] = 4;
      *(_WORD *)&v44[30] = 2101;
      *(_QWORD *)v45 = "null";
      *(_WORD *)&v45[8] = 1024;
      *(_DWORD *)v46 = (_DWORD)a1;
      *(_WORD *)&v46[4] = 1024;
      *(_DWORD *)&v46[6] = v37;
      v47 = 2080;
      v48 = "n/a";
      v49 = 2080;
      v50 = "n/a";
      v51 = 2080;
      v52 = v36;
      v33 = "%s: domain lookup result for%{sensitive, mask.hash, networkextension:string}.*P --> metadata %{sensitive, ma"
            "sk.hash, networkextension:string}.*P %{sensitive, mask.hash, networkextension:string}.*P (app info ref %X pi"
            "d %d %s) %s - %s";
      v34 = v22;
      v35 = 132;
LABEL_76:
      _os_log_debug_impl(&dword_208439000, v34, OS_LOG_TYPE_DEBUG, v33, buf, v35);
    }
  }
  else if (v23)
  {
    v27 = strlen(__s);
    v31 = "App";
    if (a1)
    {
      v32 = a1[14];
      if (!v32)
      {
        v32 = a1[7];
        if (!v32)
        {
          v32 = a1[30];
          if (!v32)
            v32 = a1[23];
        }
      }
      if ((a1[31] & 1) != 0)
        v31 = "Web";
    }
    else
    {
      v32 = 0;
    }
    *(_DWORD *)buf = 136317955;
    v39 = "NEHelperTrackerMatchDomain";
    v40 = 1024;
    *(_DWORD *)v41 = v27;
    *(_WORD *)&v41[4] = 2081;
    *(_QWORD *)&v41[6] = __s;
    v42 = 1024;
    *(_DWORD *)v43 = 4;
    *(_WORD *)&v43[4] = 2081;
    *(_QWORD *)&v43[6] = "null";
    *(_WORD *)&v43[14] = 1024;
    *(_DWORD *)&v43[16] = 4;
    *(_WORD *)v44 = 2081;
    *(_QWORD *)&v44[2] = "null";
    *(_WORD *)&v44[10] = 1024;
    *(_DWORD *)&v44[12] = (_DWORD)a1;
    *(_WORD *)&v44[16] = 1024;
    *(_DWORD *)&v44[18] = v32;
    *(_WORD *)&v44[22] = 2080;
    *(_QWORD *)&v44[24] = "n/a";
    *(_WORD *)v45 = 2080;
    *(_QWORD *)&v45[2] = "n/a";
    *(_WORD *)v46 = 2080;
    *(_QWORD *)&v46[2] = v31;
    v33 = "%s: domain lookup result for<%d : %{private}s> --> metadata <%d : %{private}s> <%d : %{private}s> (app info re"
          "f %X pid %d %s) %s - %s";
    v34 = v22;
    v35 = 102;
    goto LABEL_76;
  }
  NEHelperTrackerProcessMatch(__s, 0, (uint64_t)a1, a5, a6);
  if (a4)
    *a4 = 0;
  return 1;
}

void NEHelperTrackerProcessMatch(const char *a1, uint64_t a2, uint64_t a3, _BYTE *a4, int a5)
{
  int v10;
  int v11;
  const char *v12;
  void *v13;
  void *v14;
  int v15;
  const __CFString *v16;
  const __CFString *v17;
  xpc_object_t v18;
  NSObject *v19;
  const char *v20;
  const char *v21;
  NSObject *v22;
  _BOOL4 v23;
  int v24;
  const char *v25;
  int v26;
  int v27;
  const char *v28;
  int v29;
  const char *v30;
  int v31;
  int v32;
  const char *v33;
  const char *domain;
  const char *domain_owner;
  int v36;
  const char *v37;
  const char *v38;
  const char *v39;
  const char *v40;
  int v41;
  const char *v42;
  const char *v43;
  const char *v44;
  NSObject *v45;
  uint32_t v46;
  void *v47;
  void *v48;
  _BYTE v49[50];
  __int128 v50;
  uint64_t v51;
  __int128 *v52;
  _BYTE v53[10];
  _BYTE v54[10];
  __int16 v55;
  __int128 *p_buffer;
  __int16 v57;
  const char *v58;
  __int16 v59;
  const char *v60;
  __int128 buffer;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  unsigned __int8 uu[8];
  unsigned __int8 *v78;
  uint64_t v79;
  char v80;
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  if (!a3)
  {
    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    buffer = 0u;
    v62 = 0u;
    if (!*a4)
    {
      v10 = 0;
      goto LABEL_39;
    }
    goto LABEL_25;
  }
  v10 = *(_DWORD *)(a3 + 56);
  if (v10
    || (v10 = *(_DWORD *)(a3 + 28)) != 0
    || (v10 = *(_DWORD *)(a3 + 120)) != 0
    || (v10 = *(_DWORD *)(a3 + 92)) != 0)
  {
    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    buffer = 0u;
    v62 = 0u;
    proc_name(v10, &buffer, 0x100u);
    if (*a4)
      goto LABEL_40;
    v11 = *(_DWORD *)(a3 + 56);
    if (!v11)
      v11 = *(_DWORD *)(a3 + 28);
    v12 = *(const char **)a3;
    if (*(_QWORD *)a3)
      goto LABEL_10;
    if (v11)
    {
      v16 = (const __CFString *)NECopySigningIdentifierForPIDwithAuditToken(v11, 0);
      if (!v16)
        goto LABEL_39;
      v17 = v16;
      v12 = NEHelperTrackerDomainIsApproved_buffer;
      CFStringGetCString(v16, NEHelperTrackerDomainIsApproved_buffer, 254, 0x600u);
      CFRelease(v17);
      goto LABEL_10;
    }
LABEL_38:
    *(_QWORD *)uu = 0;
    v78 = 0;
    NEHelperTrackerGetAppUUID(a3, uu);
    if (uuid_is_null(uu))
      goto LABEL_39;
    v47 = (void *)NEHelperCacheCopySigningIdentifierMapping();
    if (!v47)
      goto LABEL_39;
    v48 = v47;
    xpc_string_get_string_ptr(v47);
    v12 = NEHelperTrackerDomainIsApproved_buffer;
    __strlcpy_chk();
    xpc_release(v48);
    goto LABEL_10;
  }
  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  buffer = 0u;
  v62 = 0u;
  if (*a4)
  {
LABEL_25:
    v10 = 0;
    goto LABEL_40;
  }
  v10 = 0;
  v12 = *(const char **)a3;
  if (!*(_QWORD *)a3)
    goto LABEL_38;
LABEL_10:
  if (!ne_helper_skip_associated_domain_bundles
    || !xpc_dictionary_get_BOOL((xpc_object_t)ne_helper_skip_associated_domain_bundles, v12))
  {
    if (ne_helper_last_approved_bundle)
    {
      v13 = (void *)ne_helper_last_approved_associated_domains;
      if (ne_helper_last_approved_associated_domains)
      {
        if (!strcmp((const char *)ne_helper_last_approved_bundle, v12))
          goto LABEL_22;
      }
    }
    v14 = (void *)ne_tracker_lookup_app_domains();
    if (v14)
    {
      v13 = v14;
      if (xpc_array_get_count(v14))
      {
        if (ne_helper_last_approved_bundle)
        {
          free((void *)ne_helper_last_approved_bundle);
          ne_helper_last_approved_bundle = 0;
        }
        if (ne_helper_last_approved_associated_domains)
          xpc_release((xpc_object_t)ne_helper_last_approved_associated_domains);
        ne_helper_last_approved_bundle = (uint64_t)strdup(v12);
        ne_helper_last_approved_associated_domains = (uint64_t)v13;
LABEL_22:
        *(_QWORD *)uu = 0;
        v78 = uu;
        v79 = 0x2000000000;
        v80 = 0;
        *(_QWORD *)v49 = MEMORY[0x24BDAC760];
        *(_QWORD *)&v49[8] = 0x40000000;
        *(_QWORD *)&v49[16] = __NEHelperTrackerDomainIsApproved_block_invoke;
        *(_QWORD *)&v49[24] = &unk_24C0A0630;
        *(_QWORD *)&v49[32] = uu;
        *(_QWORD *)&v49[40] = a1;
        xpc_array_apply(v13, v49);
        v15 = v78[24];
        _Block_object_dispose(uu, 8);
        if (v15)
          goto LABEL_40;
        goto LABEL_39;
      }
      v18 = (xpc_object_t)ne_helper_skip_associated_domain_bundles;
      if (!ne_helper_skip_associated_domain_bundles)
      {
        v18 = xpc_dictionary_create(0, 0, 0);
        ne_helper_skip_associated_domain_bundles = (uint64_t)v18;
      }
      if (xpc_dictionary_get_count(v18) <= 0x7F)
        xpc_dictionary_set_BOOL((xpc_object_t)ne_helper_skip_associated_domain_bundles, v12, 1);
      xpc_release(v13);
    }
  }
LABEL_39:
  *a4 = 1;
LABEL_40:
  v19 = ne_log_obj();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = "";
    if (!*a4)
      v20 = ", approved domain";
    v21 = "App";
    if (a3 && (*(_DWORD *)(a3 + 124) & 1) != 0)
      v21 = "Web";
    *(_DWORD *)v49 = 136316162;
    *(_QWORD *)&v49[4] = "NEHelperTrackerProcessMatch";
    *(_WORD *)&v49[12] = 1024;
    *(_DWORD *)&v49[14] = v10;
    *(_WORD *)&v49[18] = 2080;
    *(_QWORD *)&v49[20] = &buffer;
    *(_WORD *)&v49[28] = 2080;
    *(_QWORD *)&v49[30] = v20;
    *(_WORD *)&v49[38] = 2080;
    *(_QWORD *)&v49[40] = v21;
    _os_log_impl(&dword_208439000, v19, OS_LOG_TYPE_DEFAULT, "%s: domain lookup - found match for tracker domain (pid %d %s)%s for %s", v49, 0x30u);
  }
  v22 = ne_log_obj();
  v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG);
  if (a5)
  {
    if (v23)
    {
      v24 = strlen(a1);
      if (a2)
      {
        domain = (const char *)ne_tracker_context_get_domain();
        v27 = strlen(domain);
        v25 = (const char *)ne_tracker_context_get_domain();
        domain_owner = (const char *)ne_tracker_context_get_domain_owner();
        v26 = strlen(domain_owner);
        v28 = (const char *)ne_tracker_context_get_domain_owner();
      }
      else
      {
        v25 = "null";
        v26 = 4;
        v27 = 4;
        v28 = "null";
      }
      if (a3)
      {
        v36 = *(_DWORD *)(a3 + 56);
        if (!v36)
        {
          v36 = *(_DWORD *)(a3 + 28);
          if (!v36)
          {
            v36 = *(_DWORD *)(a3 + 120);
            if (!v36)
              v36 = *(_DWORD *)(a3 + 92);
          }
        }
        v37 = "";
        if (!*a4)
          v37 = ", approved domain";
        if ((*(_DWORD *)(a3 + 124) & 1) != 0)
          v38 = "Web";
        else
          v38 = "App";
      }
      else
      {
        v36 = 0;
        if (*a4)
          v37 = "";
        else
          v37 = ", approved domain";
        v38 = "App";
      }
      *(_DWORD *)v49 = 136318723;
      *(_QWORD *)&v49[4] = "NEHelperTrackerProcessMatch";
      *(_WORD *)&v49[12] = 2160;
      *(_QWORD *)&v49[14] = 1752392040;
      *(_WORD *)&v49[22] = 1040;
      *(_DWORD *)&v49[24] = v24;
      *(_WORD *)&v49[28] = 2101;
      *(_QWORD *)&v49[30] = a1;
      *(_WORD *)&v49[38] = 2160;
      *(_QWORD *)&v49[40] = 1752392040;
      *(_WORD *)&v49[48] = 1040;
      LODWORD(v50) = v27;
      WORD2(v50) = 2101;
      *(_QWORD *)((char *)&v50 + 6) = v25;
      HIWORD(v50) = 2160;
      v51 = 1752392040;
      LOWORD(v52) = 1040;
      *(_DWORD *)((char *)&v52 + 2) = v26;
      HIWORD(v52) = 2101;
      *(_QWORD *)v53 = v28;
      *(_WORD *)&v53[8] = 1024;
      *(_DWORD *)v54 = a3;
      *(_WORD *)&v54[4] = 1024;
      *(_DWORD *)&v54[6] = v36;
      v55 = 2080;
      p_buffer = &buffer;
      v57 = 2080;
      v58 = v37;
      v59 = 2080;
      v60 = v38;
      v44 = "%s: domain lookup - found match for tracker%{sensitive, mask.hash, networkextension:string}.*P --> metadata "
            "%{sensitive, mask.hash, networkextension:string}.*P %{sensitive, mask.hash, networkextension:string}.*P (app"
            " info ref %X pid %d %s) %s - %s";
      v45 = v22;
      v46 = 132;
LABEL_87:
      _os_log_debug_impl(&dword_208439000, v45, OS_LOG_TYPE_DEBUG, v44, v49, v46);
    }
  }
  else if (v23)
  {
    v29 = strlen(a1);
    if (a2)
    {
      v39 = (const char *)ne_tracker_context_get_domain();
      v32 = strlen(v39);
      v30 = (const char *)ne_tracker_context_get_domain();
      v40 = (const char *)ne_tracker_context_get_domain_owner();
      v31 = strlen(v40);
      v33 = (const char *)ne_tracker_context_get_domain_owner();
    }
    else
    {
      v30 = "null";
      v31 = 4;
      v32 = 4;
      v33 = "null";
    }
    if (a3)
    {
      v41 = *(_DWORD *)(a3 + 56);
      if (!v41)
      {
        v41 = *(_DWORD *)(a3 + 28);
        if (!v41)
        {
          v41 = *(_DWORD *)(a3 + 120);
          if (!v41)
            v41 = *(_DWORD *)(a3 + 92);
        }
      }
      v42 = "";
      if (!*a4)
        v42 = ", approved domain";
      if ((*(_DWORD *)(a3 + 124) & 1) != 0)
        v43 = "Web";
      else
        v43 = "App";
    }
    else
    {
      v41 = 0;
      if (*a4)
        v42 = "";
      else
        v42 = ", approved domain";
      v43 = "App";
    }
    *(_DWORD *)v49 = 136317955;
    *(_QWORD *)&v49[4] = "NEHelperTrackerProcessMatch";
    *(_WORD *)&v49[12] = 1024;
    *(_DWORD *)&v49[14] = v29;
    *(_WORD *)&v49[18] = 2081;
    *(_QWORD *)&v49[20] = a1;
    *(_WORD *)&v49[28] = 1024;
    *(_DWORD *)&v49[30] = v32;
    *(_WORD *)&v49[34] = 2081;
    *(_QWORD *)&v49[36] = v30;
    *(_WORD *)&v49[44] = 1024;
    *(_DWORD *)&v49[46] = v31;
    LOWORD(v50) = 2081;
    *(_QWORD *)((char *)&v50 + 2) = v33;
    WORD5(v50) = 1024;
    HIDWORD(v50) = a3;
    LOWORD(v51) = 1024;
    *(_DWORD *)((char *)&v51 + 2) = v41;
    HIWORD(v51) = 2080;
    v52 = &buffer;
    *(_WORD *)v53 = 2080;
    *(_QWORD *)&v53[2] = v42;
    *(_WORD *)v54 = 2080;
    *(_QWORD *)&v54[2] = v43;
    v44 = "%s: domain lookup - found match for tracker<%d : %{private}s> --> metadata <%d : %{private}s> <%d : %{private}"
          "s> (app info ref %X pid %d %s) %s - %s";
    v45 = v22;
    v46 = 102;
    goto LABEL_87;
  }
}

BOOL NEHelperTrackerAddIPForAllFlows(int a1, int a2, _DWORD **a3, int a4, _DWORD *a5, unint64_t a6, const __CFString *a7)
{
  return NEHelperTrackerAddIPForAllFlowsRedactLogs(a1, a2, a3, a4, a5, a6, a7, 0);
}

uint64_t NEHelperTrackerGetAppUUID(uint64_t result, unsigned __int8 *a2)
{
  uint64_t v3;
  const unsigned __int8 *v4;
  int v5;
  int v6;
  int v7;
  const unsigned __int8 *v8;
  unsigned __int8 *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (result)
  {
    v3 = result;
    v4 = (const unsigned __int8 *)(result + 40);
    if (uuid_is_null((const unsigned __int8 *)(result + 40)))
    {
      v5 = *(_DWORD *)(v3 + 56);
      if (v5)
      {
        v13 = 0;
        v11 = 0u;
        v12 = 0u;
        v10 = 0u;
        if (proc_pidinfo(v5, 17, 1uLL, &v10, 56) == 56)
          goto LABEL_12;
      }
      v6 = *(_DWORD *)(v3 + 28);
      if (v6)
      {
        v13 = 0;
        v11 = 0u;
        v12 = 0u;
        v10 = 0u;
        if (proc_pidinfo(v6, 17, 1uLL, &v10, 56) == 56)
        {
LABEL_12:
          v8 = (const unsigned __int8 *)&v10;
          v9 = a2;
LABEL_14:
          uuid_copy(v9, v8);
          return 1;
        }
      }
      v4 = (const unsigned __int8 *)(v3 + 104);
      if (uuid_is_null((const unsigned __int8 *)(v3 + 104)))
      {
        v7 = *(_DWORD *)(v3 + 120);
        if (!v7 || (v13 = 0, v11 = 0u, v12 = 0u, v10 = 0u, proc_pidinfo(v7, 17, 1uLL, &v10, 56) != 56))
        {
          result = *(unsigned int *)(v3 + 92);
          if (!(_DWORD)result)
            return result;
          v13 = 0;
          v11 = 0u;
          v12 = 0u;
          v10 = 0u;
          if (proc_pidinfo(result, 17, 1uLL, &v10, 56) != 56)
            return 0;
        }
        goto LABEL_12;
      }
    }
    v9 = a2;
    v8 = v4;
    goto LABEL_14;
  }
  return result;
}

uint64_t NEHelperTrackerFillParameters(char *a1, size_t a2, int a3, _BYTE *a4, const unsigned __int8 *a5, const void *a6, uint64_t a7, const void *a8, uint64_t a9, int a10)
{
  uint64_t result;
  char *v18;
  size_t v19;
  char *v20;
  uint64_t v21;

  result = 0;
  if (a1 && a2)
  {
    bzero(a1, a2);
    v18 = a1;
    if (a3)
    {
      *a1 = 1;
      *(_DWORD *)(a1 + 1) = 1;
      a1[5] = a3;
      v18 = a1 + 6;
    }
    if (a4)
    {
      v19 = *a4;
      if (*a4)
      {
        *v18 = 2;
        *(_DWORD *)(v18 + 1) = v19;
        v20 = v18 + 5;
        memcpy(v20, a4, v19);
        v18 = &v20[v19];
      }
    }
    if (!uuid_is_null(a5))
    {
      *v18 = 3;
      *(_DWORD *)(v18 + 1) = 16;
      *(_OWORD *)(v18 + 5) = *(_OWORD *)a5;
      v18 += 21;
    }
    if (a6 && a7)
    {
      *v18 = 4;
      *(_DWORD *)(v18 + 1) = a7;
      if ((_DWORD)a7)
      {
        a7 = a7;
        memcpy(v18 + 5, a6, a7);
      }
      else
      {
        a7 = 0;
      }
      v18 += a7 + 5;
    }
    if (a8 && a9)
    {
      *v18 = 5;
      *(_DWORD *)(v18 + 1) = a9;
      if ((_DWORD)a9)
      {
        v21 = a9;
        memcpy(v18 + 5, a8, a9);
      }
      else
      {
        v21 = 0;
      }
      v18 += v21 + 5;
    }
    if (a10)
    {
      *v18 = 6;
      *(_DWORD *)(v18 + 1) = 4;
      *(_DWORD *)(v18 + 5) = a10;
      LODWORD(v18) = (_DWORD)v18 + 9;
    }
    return ((_DWORD)v18 - (_DWORD)a1);
  }
  return result;
}

uint64_t NEHelperTrackerCalculateParameterLen(int a1, int a2, unsigned __int8 *uu, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  int v13;
  int v14;
  int v15;
  int is_null;
  int v17;
  BOOL v18;
  int v19;
  BOOL v20;
  int v21;
  unsigned int v22;

  if (a1)
    v13 = 6;
  else
    v13 = 0;
  v14 = a2 + 5;
  if (!a2)
    v14 = 0;
  v15 = v14 + v13;
  is_null = uuid_is_null(uu);
  v17 = v15 + 21;
  if (is_null)
    v17 = v15;
  if (a5)
    v18 = a4 == 0;
  else
    v18 = 1;
  v19 = a5 + 5;
  if (v18)
    v19 = 0;
  if (a7)
    v20 = a6 == 0;
  else
    v20 = 1;
  v21 = a7 + 5;
  if (v20)
    v21 = 0;
  v22 = v21 + v19 + v17;
  if (a8)
    return v22 + 9;
  else
    return v22;
}

uint64_t NEHelperPidFromAuditToken(_OWORD *a1)
{
  __int128 v1;
  audit_token_t v3;

  v1 = a1[1];
  *(_OWORD *)v3.val = *a1;
  *(_OWORD *)&v3.val[4] = v1;
  return audit_token_to_pid(&v3);
}

uint64_t cLogInternalErrorTrackerFailedtoReadMMAPFile()
{
  return +[NEDiagnosticReport logInternalError:subType:context:](NEDiagnosticReport, "logInternalError:subType:context:", CFSTR("Tracker"), CFSTR("FailedtoReadMMAPFile"), 0);
}

uint64_t NEFlowGetTypeID()
{
  if (runtime_inited != -1)
    dispatch_once(&runtime_inited, &__block_literal_global_10);
  return __kNEFlowTypeID;
}

void __NEFlowDeallocate(uint64_t a1)
{
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const void *v8;
  const void *v9;
  const void *v10;
  const void *v11;
  const void *v12;
  const void *v13;
  const void *v14;
  NSObject *v15;
  _QWORD *v16;
  CFAllocatorRef *v17;
  const __CFAllocator *v18;
  _QWORD *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  const void *v23;
  const void *v24;
  const void *v25;
  const void *v26;
  const void *v27;
  const void *v28;
  const void *v29;
  _DWORD v30[2];
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v2 = ne_log_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_DWORD *)(a1 + 24);
    v4 = *(_QWORD *)(a1 + 248);
    v5 = *(_QWORD *)(a1 + 256);
    v6 = *(_QWORD *)(a1 + 232);
    v7 = *(_QWORD *)(a1 + 240);
    v30[0] = 67110144;
    v30[1] = v3;
    v31 = 2048;
    v32 = v4;
    v33 = 2048;
    v34 = v5;
    v35 = 2048;
    v36 = v6;
    v37 = 2048;
    v38 = v7;
    _os_log_impl(&dword_208439000, v2, OS_LOG_TYPE_DEFAULT, "(%u): Destroying, client tx %llu, client rx %llu, kernel rx %llu, kernel tx %llu", (uint8_t *)v30, 0x30u);
  }
  flow_cancel_bridged_connection(a1, 0);
  v8 = *(const void **)(a1 + 48);
  if (v8)
    CFRelease(v8);
  v9 = *(const void **)(a1 + 56);
  if (v9)
    CFRelease(v9);
  v10 = *(const void **)(a1 + 64);
  if (v10)
    CFRelease(v10);
  v11 = *(const void **)(a1 + 72);
  if (v11)
    CFRelease(v11);
  v12 = *(const void **)(a1 + 80);
  if (v12)
    CFRelease(v12);
  v13 = *(const void **)(a1 + 88);
  if (v13)
    CFRelease(v13);
  v14 = *(const void **)(a1 + 32);
  if (v14)
    CFRelease(v14);
  dispatch_release(*(dispatch_object_t *)(a1 + 112));
  v15 = *(NSObject **)(a1 + 136);
  if (v15)
    dispatch_release(v15);
  v16 = *(_QWORD **)(a1 + 200);
  v17 = (CFAllocatorRef *)MEMORY[0x24BDBD240];
  if (v16)
  {
    v18 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    do
    {
      *(_QWORD *)(a1 + 200) = v16[1];
      CFAllocatorDeallocate(v18, v16);
      v16 = *(_QWORD **)(a1 + 200);
    }
    while (v16);
  }
  flow_clear_datagram_queue(*(_QWORD **)(a1 + 264), *(_QWORD **)(a1 + 272));
  *(_QWORD *)(a1 + 264) = 0;
  *(_QWORD *)(a1 + 272) = a1 + 264;
  v19 = *(_QWORD **)(a1 + 296);
  if (v19)
  {
    v20 = v19[16];
    if (v20)
    {
      dispatch_release(v20);
      v19 = *(_QWORD **)(a1 + 296);
    }
    CFAllocatorDeallocate(*v17, v19);
  }
  flow_handle_pending_write_requests(a1, 0);
  v21 = 0;
  v22 = a1 + 144;
  do
  {
    v23 = *(const void **)(v22 + v21);
    if (v23)
    {
      _Block_release(v23);
      *(_QWORD *)(v22 + v21) = 0;
    }
    v21 += 8;
  }
  while (v21 != 56);
  v24 = *(const void **)(a1 + 352);
  if (v24)
    CFRelease(v24);
  v25 = *(const void **)(a1 + 360);
  if (v25)
    CFRelease(v25);
  v26 = *(const void **)(a1 + 368);
  if (v26)
    CFRelease(v26);
  v27 = *(const void **)(a1 + 376);
  if (v27)
    CFRelease(v27);
  v28 = *(const void **)(a1 + 384);
  if (v28)
    CFRelease(v28);
  v29 = *(const void **)(a1 + 392);
  if (v29)
    CFRelease(v29);
}

BOOL __NEFlowEqual(uint64_t a1, uint64_t a2)
{
  return *(_DWORD *)(a1 + 24) == *(_DWORD *)(a2 + 24);
}

uint64_t __NEFlowHashCode(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

CFStringRef __NEFlowCopyDescription(uint64_t a1)
{
  const __CFData *v2;
  const UInt8 *BytePtr;
  __CFString *v4;
  const __CFData *v5;
  const UInt8 *v6;
  __CFString *v7;
  const __CFData *v8;
  const unsigned __int8 *v9;
  char *v10;
  unsigned int v11;
  const char *v12;
  uint64_t v13;
  const __CFString *v14;
  const __CFString *v15;
  const char *v16;
  const char *v17;
  CFStringRef v18;
  char v20[16];
  char out[40];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  *(_OWORD *)v20 = *(_OWORD *)"<none>";
  v2 = *(const __CFData **)(a1 + 48);
  if (v2)
  {
    BytePtr = CFDataGetBytePtr(v2);
    v4 = NECreateAddressStringWithPort((uint64_t)BytePtr);
  }
  else
  {
    v4 = CFSTR("<unknown>");
  }
  v5 = *(const __CFData **)(a1 + 56);
  if (v5)
  {
    v6 = CFDataGetBytePtr(v5);
    v7 = NECreateAddressStringWithPort((uint64_t)v6);
  }
  else
  {
    v7 = CFSTR("<unknown>");
  }
  memset(out, 0, 37);
  v8 = *(const __CFData **)(a1 + 392);
  if (v8)
  {
    v9 = CFDataGetBytePtr(v8);
    v10 = out;
    uuid_unparse(v9, out);
  }
  else
  {
    v10 = 0;
  }
  v11 = *(_DWORD *)(a1 + 400);
  if (v11)
    if_indextoname(v11, v20);
  v12 = "unknown";
  v13 = *(_QWORD *)(a1 + 16);
  if (v13 == 2)
    v12 = "datagram";
  if (v13 == 1)
    v12 = "stream";
  v14 = *(const __CFString **)(a1 + 80);
  v15 = &stru_24C0A1CF8;
  if (!v14)
    v14 = &stru_24C0A1CF8;
  if (*(_QWORD *)(a1 + 64))
    v15 = *(const __CFString **)(a1 + 64);
  v16 = "";
  if (v10)
    v17 = v10;
  else
    v17 = "";
  if ((*(_DWORD *)(a1 + 344) & 8) != 0)
    v16 = "(bound)";
  v18 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("NEFlow type = %s, app = %@, name = %@, %@ <-> %@, filter_id = %s, interface = %s%s"), v12, v14, v15, v7, v4, v17, v20, v16);
  if (v4)
    CFRelease(v4);
  if (v7)
    CFRelease(v7);
  return v18;
}

void flow_cancel_bridged_connection(uint64_t a1, CFTypeRef cf)
{
  const void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;

  if (cf)
  {
    v4 = *(const void **)(a1 + 32);
    if (v4)
      CFRelease(v4);
    *(_QWORD *)(a1 + 32) = CFRetain(cf);
  }
  flow_read_close(a1, 1);
  flow_write_close(a1, 1);
  if ((~*(_DWORD *)(a1 + 100) & 3) == 0 && !*(_BYTE *)(a1 + 320))
    flow_drop_director((_QWORD *)a1);
  flow_cancel_connection_waiting_timer(a1);
  v5 = *(NSObject **)(a1 + 408);
  if (v5)
  {
    nw_connection_cancel(v5);
    nw_release(*(void **)(a1 + 408));
    *(_QWORD *)(a1 + 408) = 0;
  }
  v6 = *(NSObject **)(a1 + 416);
  if (v6)
  {
    nw_connection_group_cancel(v6);
    nw_release(*(void **)(a1 + 416));
    *(_QWORD *)(a1 + 416) = 0;
  }
  v7 = *(void **)(a1 + 128);
  if (v7)
  {
    os_release(v7);
    *(_QWORD *)(a1 + 128) = 0;
  }
}

void flow_clear_datagram_queue(_QWORD *ptr, _QWORD *a2)
{
  _QWORD *v2;
  const __CFAllocator *v3;
  NSObject *v4;
  _QWORD *v5;
  _QWORD *v6;

  v6 = a2;
  if (ptr)
  {
    v2 = ptr;
    v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    do
    {
      v5 = (_QWORD *)v2[18];
      if (!v5)
        v6 = &v5;
      v4 = v2[16];
      if (v4)
        dispatch_release(v4);
      CFAllocatorDeallocate(v3, v2);
      v2 = v5;
    }
    while (v5);
  }
}

void flow_handle_pending_write_requests(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  _QWORD *v5;
  const __CFAllocator *v6;
  _QWORD *v7;
  int v8;
  uint64_t v9;
  const void *v10;
  const void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  CFIndex v15;
  int v16;
  _DWORD v17[2];
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD **)(a1 + 304);
  if (!v3)
    goto LABEL_12;
  v5 = (_QWORD *)(a1 + 304);
  v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  while (1)
  {
    v7 = v3;
    if (a2)
    {
      v8 = (*(uint64_t (**)(uint64_t, _QWORD *))(a2 + 16))(a2, v3);
      v7 = (_QWORD *)*v5;
      if (!v8)
        break;
    }
    v9 = v7[20];
    *v5 = v9;
    if (!v9)
      *(_QWORD *)(a1 + 312) = v5;
    v10 = (const void *)v3[16];
    if (v10)
      CFRelease(v10);
    v11 = (const void *)v3[19];
    if (v11)
      _Block_release(v11);
    CFAllocatorDeallocate(v6, v3);
    v3 = (_QWORD *)*v5;
    if (!*v5)
      goto LABEL_12;
  }
  if (!v7)
  {
LABEL_12:
    if (*(_BYTE *)(a1 + 320))
    {
      v12 = ne_log_obj();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v16 = *(_DWORD *)(a1 + 24);
        v17[0] = 67109378;
        v17[1] = v16;
        v18 = 2080;
        v19 = "All data written to the kernel, sending close";
        _os_log_debug_impl(&dword_208439000, v12, OS_LOG_TYPE_DEBUG, "(%u): %s", (uint8_t *)v17, 0x12u);
      }
      *(_BYTE *)(a1 + 320) = 0;
      v13 = *(unsigned int *)(a1 + 24);
      v14 = *(_QWORD *)(a1 + 40);
      v15 = flow_error_to_errno(*(_QWORD *)(a1 + 32));
      flow_director_send_close(v14, v13, v15, 0, *(_DWORD *)(a1 + 100) & 4);
      if ((~*(_DWORD *)(a1 + 100) & 3) == 0 && !*(_BYTE *)(a1 + 320))
        flow_drop_director((_QWORD *)a1);
    }
  }
}

CFIndex flow_error_to_errno(CFIndex result)
{
  __CFError *v1;
  __CFString *Domain;
  CFIndex Code;

  if (result)
  {
    v1 = (__CFError *)result;
    Domain = (__CFString *)CFErrorGetDomain((CFErrorRef)result);
    if (Domain == CFSTR("com.apple.VPNTunnel"))
    {
      Code = CFErrorGetCode(v1);
      if ((unint64_t)(Code - 1) < 7)
        return dword_2084670CC[Code - 1];
    }
    else if (Domain == (__CFString *)*MEMORY[0x24BDBD390] || Domain == (__CFString *)*MEMORY[0x24BDE08F8])
    {
      return CFErrorGetCode(v1);
    }
    return 50;
  }
  return result;
}

void flow_director_send_close(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4, int a5)
{
  unsigned int v9;
  const __CFAllocator *v10;
  _DWORD *v11;

  v9 = bswap32(a3);
  v10 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v11 = CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x24BDBD240], 26, 0);
  *(_BYTE *)v11 = 4;
  v11[1] = bswap32(a2);
  *((_BYTE *)v11 + 8) = 5;
  *(_DWORD *)((char *)v11 + 9) = 0x4000000;
  *(_DWORD *)((char *)v11 + 13) = v9;
  *((_BYTE *)v11 + 17) = 7;
  *(_DWORD *)((char *)v11 + 18) = 0x4000000;
  *(_DWORD *)((char *)v11 + 22) = bswap32(a4);
  flow_director_msg_send(a1, (uint64_t)v11, 0x1AuLL, a5 == 0);
  CFAllocatorDeallocate(v10, v11);
}

void flow_drop_director(_QWORD *a1)
{
  uint64_t v1;
  NSObject *v3;
  _QWORD v4[6];

  v1 = a1[5];
  if (v1)
  {
    CFRetain(a1);
    v3 = *(NSObject **)(v1 + 16);
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 0x40000000;
    v4[2] = __flow_drop_director_block_invoke;
    v4[3] = &__block_descriptor_tmp_102;
    v4[4] = a1;
    v4[5] = v1;
    dispatch_async(v3, v4);
  }
}

void __flow_drop_director_block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _DWORD *v4;
  int v5;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 120));
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 40))
  {
    v3 = ne_log_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v5 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 24);
      v6[0] = 67109378;
      v6[1] = v5;
      v7 = 2080;
      v8 = "Dropping the director";
      _os_log_debug_impl(&dword_208439000, v3, OS_LOG_TYPE_DEBUG, "(%u): %s", (uint8_t *)v6, 0x12u);
    }
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 0;
    v4 = *(_DWORD **)(a1 + 32);
    if ((v4[25] & 0x10) != 0)
    {
      rb_tree_remove_node((rb_tree_t *)(*(_QWORD *)(a1 + 40) + 56), v4);
      v4 = *(_DWORD **)(a1 + 32);
      v4[25] &= ~0x10u;
    }
    CFRelease(v4);
    v2 = *(_QWORD *)(a1 + 32);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 120));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void *NEFlowTLVAdd(uint64_t a1, char a2, unsigned int a3, void *__src)
{
  uint64_t v4;
  unint64_t v5;
  _BYTE *v7;
  void *result;
  unint64_t v9;

  v4 = a3;
  v5 = a3 + 5;
  if (*(_QWORD *)(a1 + 8) < v5)
    __assert_rtn("NEFlowTLVAdd", "NEFlow.c", 1839, "tlv_iter->remaining >= add_size");
  **(_BYTE **)a1 = a2;
  v7 = *(_BYTE **)a1;
  *(_DWORD *)(v7 + 1) = bswap32(a3);
  *(_QWORD *)a1 = v7 + 5;
  result = memcpy(v7 + 5, __src, a3);
  v9 = *(_QWORD *)(a1 + 8) - v5;
  *(_QWORD *)a1 += v4;
  *(_QWORD *)(a1 + 8) = v9;
  return result;
}

void flow_director_msg_send(uint64_t a1, uint64_t a2, unint64_t a3, int a4)
{
  NSObject *v5;
  NSObject *v6;
  const char *v7;

  if (a1)
  {
    if (a4 || (v6 = *(NSObject **)(a1 + 40)) == 0)
    {
      v5 = *(NSObject **)(a1 + 24);
      v6 = v5;
    }
    else
    {
      v5 = *(NSObject **)(a1 + 24);
    }
    if (v6 == v5)
      v7 = "control";
    else
      v7 = "data";
    if (flow_director_ctl_write(v6, a2, a3, 0, 0, (uint64_t)v7))
      flow_director_abort(a1, 0);
  }
}

uint64_t flow_director_ctl_write(NSObject *a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  unsigned int v8;
  int handle;
  unint64_t v10;
  unint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v15;
  NSObject *v16;
  int v17;
  char *v18;
  msghdr v19;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  char *v25;
  __int16 v26;
  unint64_t v27;
  _QWORD v28[5];

  v28[4] = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0;
  v28[0] = a2;
  v28[1] = a3;
  v28[2] = a4;
  v28[3] = a5;
  if (a4)
    v8 = 2;
  else
    v8 = 1;
  *(_OWORD *)&v19.msg_control = 0u;
  *(_OWORD *)&v19.msg_name = 0u;
  v19.msg_iov = (iovec *)v28;
  *(_QWORD *)&v19.msg_iovlen = v8;
  handle = dispatch_source_get_handle(a1);
  v10 = sendmsg(handle, &v19, 0);
  if ((v10 & 0x8000000000000000) == 0)
  {
    v11 = v10;
    if (v10 < a3)
    {
      v12 = ne_log_obj();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109890;
        v21 = dword_25453C118;
        v22 = 2080;
        v23 = a6;
        v24 = 2048;
        v25 = (char *)v11;
        v26 = 2048;
        v27 = a3;
        _os_log_error_impl(&dword_208439000, v12, OS_LOG_TYPE_ERROR, "(%u): %s: failed to write an entire message (%zd < %zu)", buf, 0x26u);
      }
      return 40;
    }
    return 0;
  }
  v13 = *__error();
  v15 = ne_log_obj();
  v16 = v15;
  if ((_DWORD)v13 == 55)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      v21 = dword_25453C118;
      v22 = 2080;
      v23 = a6;
      _os_log_impl(&dword_208439000, v16, OS_LOG_TYPE_DEFAULT, "(%u): %s: failed to write a message: no buffer space available", buf, 0x12u);
    }
    return 55;
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v17 = dword_25453C118;
    v18 = strerror(v13);
    *(_DWORD *)buf = 67109634;
    v21 = v17;
    v22 = 2080;
    v23 = a6;
    v24 = 2080;
    v25 = v18;
    _os_log_error_impl(&dword_208439000, v16, OS_LOG_TYPE_ERROR, "(%u): %s: write error: %s", buf, 0x1Cu);
  }
  return v13;
}

void flow_director_abort(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *v5;
  _QWORD v6[6];
  uint8_t buf[4];
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = ne_log_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v8 = dword_25453C118;
    _os_log_impl(&dword_208439000, v4, OS_LOG_TYPE_DEFAULT, "(%u): Aborting the director", buf, 8u);
  }
  v5 = *(NSObject **)(a1 + 16);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 0x40000000;
  v6[2] = __flow_director_abort_block_invoke;
  v6[3] = &unk_24C0A03C0;
  v6[4] = a2;
  v6[5] = a1;
  dispatch_async(v5, v6);
}

uint64_t __flow_director_abort_block_invoke(uint64_t a1)
{
  os_unfair_lock_s *v2;
  uint64_t v3;
  os_unfair_lock_s *v4;
  _QWORD *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t result;

  while (1)
  {
    v2 = (os_unfair_lock_s *)rb_tree_iterate((rb_tree_t *)(*(_QWORD *)(a1 + 40) + 56), 0, 1u);
    if (!v2)
      break;
    v3 = (uint64_t)v2;
    v4 = v2 + 30;
    os_unfair_lock_lock(v2 + 30);
    flow_read_close(v3, 1);
    flow_write_close(v3, 1);
    *(_QWORD *)(v3 + 40) = 0;
    if ((*(_BYTE *)(v3 + 100) & 0x10) != 0)
    {
      rb_tree_remove_node((rb_tree_t *)(*(_QWORD *)(a1 + 40) + 56), (void *)v3);
      *(_DWORD *)(v3 + 100) &= ~0x10u;
    }
    os_unfair_lock_unlock(v4);
    CFRelease((CFTypeRef)v3);
  }
  v5 = *(_QWORD **)(a1 + 40);
  v6 = v5[3];
  if (v6)
  {
    dispatch_source_cancel(v6);
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24) = 0;
    v5 = *(_QWORD **)(a1 + 40);
  }
  v7 = v5[5];
  if (v7)
  {
    dispatch_source_cancel(v7);
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40) = 0;
    v5 = *(_QWORD **)(a1 + 40);
  }
  v8 = (void *)v5[20];
  if (v8)
  {
    free(v8);
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 160) = 0;
    v5 = *(_QWORD **)(a1 + 40);
  }
  v9 = (void *)v5[21];
  if (v9)
  {
    free(v9);
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 168) = 0;
  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void flow_read_close(uint64_t a1, int a2)
{
  int v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  int v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  NSObject *v11;
  int v12;
  __CFError *v13;
  CFIndex Code;
  NSObject *v15;
  int v16;
  const char *v17;
  uint64_t v18;
  const void *v19;
  const void *v20;
  NSObject *v21;
  uint64_t v22;
  int v23;
  NSObject *v24;
  int v25;
  _DWORD v26[7];

  *(_QWORD *)&v26[5] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    v24 = ne_log_obj();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      v25 = 136315138;
      *(_QWORD *)v26 = "flow_read_close";
      _os_log_fault_impl(&dword_208439000, v24, OS_LOG_TYPE_FAULT, "%s called with null flow", (uint8_t *)&v25, 0xCu);
    }
    return;
  }
  v3 = *(_DWORD *)(a1 + 100);
  if ((v3 & 2) != 0)
    return;
  *(_DWORD *)(a1 + 100) = v3 | 2;
  if (!a2)
  {
    v11 = ne_log_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_DWORD *)(a1 + 24);
      v25 = 67109120;
      v26[0] = v12;
      _os_log_impl(&dword_208439000, v11, OS_LOG_TYPE_DEFAULT, "(%u): Closing reads, not closed by plugin", (uint8_t *)&v25, 8u);
    }
    v13 = *(__CFError **)(a1 + 32);
    if (v13)
      Code = CFErrorGetCode(v13);
    else
      Code = 0;
    v21 = *(NSObject **)(a1 + 408);
    if (v21 && *(_QWORD *)(a1 + 16) != 2)
      nw_connection_send(v21, 0, (nw_content_context_t)*MEMORY[0x24BDE0860], 1, (nw_connection_send_completion_t)*MEMORY[0x24BDE0840]);
    flow_notify_client_of_closure(a1);
    v22 = *(_QWORD *)(a1 + 16);
    if (v22 == 2)
    {
      flow_call_dgram_read_handler(a1, Code);
    }
    else if (v22 == 1)
    {
      flow_call_stream_read_handler(a1, Code);
    }
    return;
  }
  v4 = *(_QWORD *)(a1 + 16);
  if ((unint64_t)(v4 - 1) > 1)
  {
    v15 = ne_log_obj();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(_DWORD *)(a1 + 24);
      v25 = 67109120;
      v26[0] = v16;
      v17 = "(%u): Closing reads (other), closed by plugin";
LABEL_17:
      _os_log_impl(&dword_208439000, v15, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v25, 8u);
    }
  }
  else
  {
    if ((v3 & 4) == 0 || v4 == 2 || flow_error_to_errno(*(_QWORD *)(a1 + 32)))
    {
      v5 = ne_log_obj();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(_DWORD *)(a1 + 24);
        v7 = flow_error_to_errno(*(_QWORD *)(a1 + 32));
        v25 = 67109376;
        v26[0] = v6;
        LOWORD(v26[1]) = 1024;
        *(_DWORD *)((char *)&v26[1] + 2) = v7;
        _os_log_impl(&dword_208439000, v5, OS_LOG_TYPE_DEFAULT, "(%u): Closing reads (sending SHUT_WR), closed by plugin (flow error: %d)", (uint8_t *)&v25, 0xEu);
      }
      v8 = *(_DWORD *)(a1 + 24);
      v9 = *(_QWORD *)(a1 + 40);
      v10 = flow_error_to_errno(*(_QWORD *)(a1 + 32));
      flow_director_send_close(v9, v8, v10, 1u, *(_DWORD *)(a1 + 100) & 4);
      goto LABEL_18;
    }
    v15 = ne_log_obj();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v23 = *(_DWORD *)(a1 + 24);
      v25 = 67109120;
      v26[0] = v23;
      v17 = "(%u): Closing reads (suppressing SHUT_WR), closed by plugin";
      goto LABEL_17;
    }
  }
LABEL_18:
  v18 = *(_QWORD *)(a1 + 16);
  if (v18 == 1)
  {
    v19 = *(const void **)(a1 + 328);
    if (!v19)
      return;
    _Block_release(v19);
    *(_QWORD *)(a1 + 328) = 0;
    v18 = *(_QWORD *)(a1 + 16);
  }
  if (v18 == 2)
  {
    v20 = *(const void **)(a1 + 336);
    if (v20)
    {
      _Block_release(v20);
      *(_QWORD *)(a1 + 336) = 0;
    }
  }
}

void flow_write_close(uint64_t a1, int a2)
{
  int v3;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  int v7;
  CFIndex Code;
  NSObject *v9;
  int v10;
  __CFError *v11;
  NSObject *v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  CFIndex v17;
  NSObject *v18;
  _QWORD v19[6];
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v3 = *(_DWORD *)(a1 + 100);
    if ((v3 & 1) != 0)
    {
      if (a2)
        return;
      Code = 2;
    }
    else
    {
      *(_DWORD *)(a1 + 100) = v3 | 1;
      if (a2)
      {
        if ((unint64_t)(*(_QWORD *)(a1 + 16) - 1) > 1)
        {
          v12 = ne_log_obj();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            v13 = *(_DWORD *)(a1 + 24);
            *(_DWORD *)buf = 67109120;
            LODWORD(v21) = v13;
            _os_log_impl(&dword_208439000, v12, OS_LOG_TYPE_DEFAULT, "(%u): Closing writes (other), sending close", buf, 8u);
          }
        }
        else
        {
          v4 = *(_QWORD *)(a1 + 304);
          v5 = ne_log_obj();
          v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
          if (v4)
          {
            if (v6)
            {
              v7 = *(_DWORD *)(a1 + 24);
              *(_DWORD *)buf = 67109120;
              LODWORD(v21) = v7;
              _os_log_impl(&dword_208439000, v5, OS_LOG_TYPE_DEFAULT, "(%u): writes are still pending, delaying sending close until all data is sent to the kernel", buf, 8u);
            }
            *(_BYTE *)(a1 + 320) = 1;
          }
          else
          {
            if (v6)
            {
              v14 = *(_DWORD *)(a1 + 24);
              *(_DWORD *)buf = 67109120;
              LODWORD(v21) = v14;
              _os_log_impl(&dword_208439000, v5, OS_LOG_TYPE_DEFAULT, "(%u): Closing writes, sending SHUT_RD", buf, 8u);
            }
            v15 = *(unsigned int *)(a1 + 24);
            v16 = *(_QWORD *)(a1 + 40);
            v17 = flow_error_to_errno(*(_QWORD *)(a1 + 32));
            flow_director_send_close(v16, v15, v17, 0, *(_DWORD *)(a1 + 100) & 4);
          }
        }
        return;
      }
      v9 = ne_log_obj();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_DWORD *)(a1 + 24);
        *(_DWORD *)buf = 67109120;
        LODWORD(v21) = v10;
        _os_log_impl(&dword_208439000, v9, OS_LOG_TYPE_DEFAULT, "(%u): Closing writes, not sending close", buf, 8u);
      }
      v11 = *(__CFError **)(a1 + 32);
      if (v11)
        Code = CFErrorGetCode(v11);
      else
        Code = 2;
      flow_notify_client_of_closure(a1);
    }
    *(_BYTE *)(a1 + 320) = 0;
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 0x40000000;
    v19[2] = __flow_write_close_block_invoke;
    v19[3] = &__block_descriptor_tmp_100;
    v19[4] = a1;
    v19[5] = Code;
    flow_handle_pending_write_requests(a1, (uint64_t)v19);
    return;
  }
  v18 = ne_log_obj();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "flow_write_close";
    _os_log_fault_impl(&dword_208439000, v18, OS_LOG_TYPE_FAULT, "%s called with null flow", buf, 0xCu);
  }
}

void flow_notify_client_of_closure(uint64_t a1)
{
  int v2;

  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 120));
  v2 = *(_DWORD *)(a1 + 100);
  if ((v2 & 2) == 0 || flow_has_bytes(a1))
  {
    if ((v2 & 1) == 0)
      return;
LABEL_6:
    flow_notify_client((_QWORD *)a1, 3);
    return;
  }
  flow_notify_client((_QWORD *)a1, 2);
  if ((*(_DWORD *)(a1 + 100) & 1) != 0)
    goto LABEL_6;
}

uint64_t __flow_write_close_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a2 + 152);
  if (v2)
    flow_call_write_completion(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v2);
  return 1;
}

void flow_call_write_completion(uint64_t a1, uint64_t a2, void *aBlock)
{
  void *v5;
  NSObject *v6;
  _QWORD v7[6];

  if (*(_QWORD *)(a1 + 136))
  {
    v5 = _Block_copy(aBlock);
    v6 = *(NSObject **)(a1 + 136);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 0x40000000;
    v7[2] = __flow_call_write_completion_block_invoke;
    v7[3] = &unk_24C0A0210;
    v7[4] = v5;
    v7[5] = a2;
    dispatch_async(v6, v7);
  }
}

void __flow_call_write_completion_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
}

BOOL flow_has_bytes(uint64_t a1)
{
  uint64_t v1;
  BOOL v2;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1 == 2)
  {
    v2 = *(_QWORD *)(a1 + 264) == 0;
  }
  else
  {
    if (v1 != 1)
      return 0;
    v2 = dispatch_data_get_size(*(dispatch_data_t *)(a1 + 112)) == 0;
  }
  return !v2;
}

void flow_notify_client(_QWORD *a1, uint64_t a2)
{
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  NSObject *v7;
  _QWORD block[5];

  if (a1[17] && a1[a2 + 18])
  {
    v4 = (_QWORD *)a1[25];
    if (v4)
    {
      while (1)
      {
        v5 = v4;
        if (*v4 == a2)
          break;
        v4 = (_QWORD *)v4[1];
        if (!v4)
          goto LABEL_8;
      }
    }
    else
    {
      v5 = 0;
LABEL_8:
      v6 = CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x24BDBD240], 16, 0);
      *v6 = a2;
      if (v5)
      {
        v6[1] = v5[1];
        v5[1] = v6;
      }
      else
      {
        v6[1] = a1[25];
        a1[25] = v6;
        if (a1[17])
        {
          CFRetain(a1);
          v7 = a1[17];
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 0x40000000;
          block[2] = __flow_notify_client_block_invoke;
          block[3] = &__block_descriptor_tmp_90;
          block[4] = a1;
          dispatch_async(v7, block);
        }
      }
    }
  }
}

void __flow_notify_client_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const __CFAllocator *v3;
  _QWORD *v4;
  uint64_t v5;
  const void *v6;
  void (**v7)(void *, _QWORD);
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  int v11;
  uint8_t buf[4];
  int v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  while (1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(v2 + 120));
    v4 = *(_QWORD **)(v2 + 200);
    if (!v4)
      break;
    v5 = v4[1];
    *(_QWORD *)(v2 + 200) = v5;
    v6 = *(const void **)(v2 + 8 * *v4 + 144);
    if (v6)
    {
      v7 = (void (**)(void *, _QWORD))_Block_copy(v6);
      v8 = *(_QWORD *)(v2 + 200);
      os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 120));
      if (v7)
      {
        v9 = ne_log_obj();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          v10 = "unknown";
          if (*v4 <= 6uLL)
            v10 = off_24C0A0578[*v4];
          v11 = *(_DWORD *)(v2 + 24);
          *(_DWORD *)buf = 67109378;
          v13 = v11;
          v14 = 2080;
          v15 = v10;
          _os_log_debug_impl(&dword_208439000, v9, OS_LOG_TYPE_DEBUG, "(%u): invoking %s event handler", buf, 0x12u);
        }
        v7[2](v7, 0);
        _Block_release(v7);
      }
      CFAllocatorDeallocate(v3, v4);
      if (!v8)
        goto LABEL_15;
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 120));
      CFAllocatorDeallocate(v3, v4);
      if (!v5)
        goto LABEL_15;
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 120));
LABEL_15:
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void flow_call_stream_read_handler(uint64_t a1, uint64_t a2)
{
  const void *v4;
  void *v5;
  NSObject *v6;
  size_t size;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  _QWORD block[7];
  uint8_t buf[4];
  int v14;
  __int16 v15;
  size_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 120));
  if (*(_QWORD *)(a1 + 136))
  {
    v4 = *(const void **)(a1 + 328);
    if (v4)
    {
      v5 = _Block_copy(v4);
      v6 = *(NSObject **)(a1 + 112);
      if (v6)
      {
        size = dispatch_data_get_size(*(dispatch_data_t *)(a1 + 112));
        dispatch_retain(v6);
      }
      else
      {
        size = 0;
      }
      v8 = *(NSObject **)(a1 + 136);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 0x40000000;
      block[2] = __flow_call_stream_read_handler_block_invoke;
      block[3] = &unk_24C0A01C0;
      block[4] = v5;
      block[5] = v6;
      block[6] = a2;
      dispatch_async(v8, block);
      _Block_release(*(const void **)(a1 + 328));
      *(_QWORD *)(a1 + 328) = 0;
      if (size)
      {
        flow_director_send_read_notification(*(_QWORD *)(a1 + 40), *(_DWORD *)(a1 + 24), size);
        *(_QWORD *)(a1 + 256) += size;
        v9 = ne_log_obj();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          v11 = *(_DWORD *)(a1 + 24);
          *(_DWORD *)buf = 67109376;
          v14 = v11;
          v15 = 2048;
          v16 = size;
          _os_log_debug_impl(&dword_208439000, v9, OS_LOG_TYPE_DEBUG, "(%u): plugin read %lu bytes", buf, 0x12u);
        }
        v10 = *(NSObject **)(a1 + 112);
        if (v10)
          dispatch_release(v10);
        *(_QWORD *)(a1 + 112) = MEMORY[0x24BDAC990];
      }
    }
  }
}

void flow_call_dgram_read_handler(uint64_t a1, uint64_t a2)
{
  const void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  int v9;
  _QWORD v10[5];
  __int128 v11;
  uint64_t v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 120));
  if (*(_QWORD *)(a1 + 136))
  {
    v4 = *(const void **)(a1 + 336);
    if (v4)
    {
      v5 = _Block_copy(v4);
      v11 = *(_OWORD *)(a1 + 264);
      v6 = *(NSObject **)(a1 + 136);
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 0x40000000;
      v10[2] = __flow_call_dgram_read_handler_block_invoke;
      v10[3] = &unk_24C0A01E8;
      v10[4] = v5;
      v12 = a2;
      dispatch_async(v6, v10);
      _Block_release(*(const void **)(a1 + 336));
      *(_QWORD *)(a1 + 336) = 0;
      flow_director_send_read_notification(*(_QWORD *)(a1 + 40), *(_DWORD *)(a1 + 24), *(_DWORD *)(a1 + 280));
      *(_QWORD *)(a1 + 256) += *(unsigned int *)(a1 + 280);
      v7 = ne_log_obj();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v8 = *(_DWORD *)(a1 + 24);
        v9 = *(_DWORD *)(a1 + 280);
        *(_DWORD *)buf = 67109376;
        v14 = v8;
        v15 = 1024;
        v16 = v9;
        _os_log_debug_impl(&dword_208439000, v7, OS_LOG_TYPE_DEBUG, "(%u): plugin read %u bytes", buf, 0xEu);
      }
      *(_QWORD *)(a1 + 264) = 0;
      *(_QWORD *)(a1 + 272) = a1 + 264;
      *(_DWORD *)(a1 + 280) = 0;
    }
  }
}

void __flow_call_dgram_read_handler_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
  flow_clear_datagram_queue(*(_QWORD **)(a1 + 40), *(_QWORD **)(a1 + 48));
}

void flow_director_send_read_notification(uint64_t a1, unsigned int a2, unsigned int a3)
{
  unsigned int v5;
  const __CFAllocator *v6;
  _DWORD *v7;

  v5 = bswap32(a3);
  v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v7 = CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x24BDBD240], 17, 0);
  *(_BYTE *)v7 = 5;
  v7[1] = bswap32(a2);
  *((_BYTE *)v7 + 8) = 8;
  *(_DWORD *)((char *)v7 + 9) = 0x4000000;
  *(_DWORD *)((char *)v7 + 13) = v5;
  flow_director_msg_send(a1, (uint64_t)v7, 0x11uLL, 0);
  CFAllocatorDeallocate(v6, v7);
}

void __flow_call_stream_read_handler_block_invoke(uint64_t a1)
{
  NSObject *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
  v2 = *(NSObject **)(a1 + 40);
  if (v2)
    dispatch_release(v2);
}

void flow_cancel_connection_waiting_timer(uint64_t a1)
{
  NSObject *v2;
  int v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 424))
  {
    v2 = ne_log_obj();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v3 = *(_DWORD *)(a1 + 24);
      v4[0] = 67109120;
      v4[1] = v3;
      _os_log_debug_impl(&dword_208439000, v2, OS_LOG_TYPE_DEBUG, "(%u): Cancelling waiting timer", (uint8_t *)v4, 8u);
    }
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 424));
    *(_QWORD *)(a1 + 424) = 0;
  }
}

uint64_t NEFlowGetFlowType(_QWORD *cf)
{
  uint64_t v2;

  if (runtime_inited == -1)
  {
    if (!cf)
      return 0;
  }
  else
  {
    dispatch_once(&runtime_inited, &__block_literal_global_10);
    if (!cf)
      return 0;
  }
  v2 = __kNEFlowTypeID;
  if (CFGetTypeID(cf) == v2)
    return cf[2];
  return 0;
}

uint64_t NEFlowOpen(os_unfair_lock_s *cf)
{
  uint64_t v2;
  os_unfair_lock_s *v3;
  uint64_t v4;

  if (runtime_inited == -1)
  {
    if (!cf)
      return 0;
  }
  else
  {
    dispatch_once(&runtime_inited, &__block_literal_global_10);
    if (!cf)
      return 0;
  }
  v2 = __kNEFlowTypeID;
  if (CFGetTypeID(cf) == v2)
  {
    v3 = cf + 30;
    os_unfair_lock_lock(cf + 30);
    v4 = flow_open((uint64_t)cf);
    os_unfair_lock_unlock(v3);
    return v4;
  }
  return 0;
}

uint64_t flow_open(uint64_t a1)
{
  int v2;
  uint64_t v4;
  CFIndex v5;
  int v7;
  const __CFData *v8;
  unsigned int v9;
  int v10;
  unsigned __int8 *BytePtr;
  NSObject *v12;
  int v13;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  const char *v17;
  UInt8 bytes[16];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 120));
  v2 = *(_DWORD *)(a1 + 100);
  if ((v2 & 4) != 0)
  {
    v4 = a1;
    v5 = 4;
    goto LABEL_9;
  }
  if ((v2 & 3) != 0 || *(_QWORD *)(a1 + 40) == 0)
  {
    v4 = a1;
    v5 = 2;
LABEL_9:
    __NEFlowSetError(v4, v5);
    return 0;
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  *(_OWORD *)bytes = 0u;
  v19 = 0u;
  v7 = *(_DWORD *)(a1 + 400);
  v8 = *(const __CFData **)(a1 + 56);
  if (!v8
    || (CFDataGetBytePtr(v8),
        CFDataGetLength(*(CFDataRef *)(a1 + 56)),
        __memcpy_chk(),
        CFRelease(*(CFTypeRef *)(a1 + 56)),
        bytes[1] != 30)
    && bytes[1] != 2
    || !*(_WORD *)&bytes[2])
  {
    v9 = arc4random_uniform(0x3FFFu) - 0x4000;
    if (bytes[1] == 30 || bytes[1] == 2)
      *(_WORD *)&bytes[2] = bswap32(v9) >> 16;
  }
  *(_QWORD *)(a1 + 56) = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], bytes, bytes[0]);
  v10 = *(_DWORD *)(a1 + 100);
  if ((v10 & 0x40) == 0)
  {
    if (bytes[1] == 30)
    {
      *(_QWORD *)&bytes[8] = 0;
      *(_QWORD *)&v19 = 0;
    }
    else if (bytes[1] == 2)
    {
      *(_DWORD *)&bytes[4] = 0;
    }
  }
  *(_DWORD *)(a1 + 100) = v10 | 4;
  if ((unint64_t)(*(_QWORD *)(a1 + 16) - 1) <= 1)
  {
    BytePtr = (unsigned __int8 *)CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
    v12 = ne_log_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v13 = *(_DWORD *)(a1 + 24);
      *(_DWORD *)buf = 67109378;
      v15 = v13;
      v16 = 2080;
      v17 = "Open, sending successful connect result";
      _os_log_debug_impl(&dword_208439000, v12, OS_LOG_TYPE_DEBUG, "(%u): %s", buf, 0x12u);
    }
    flow_director_send_connect_result(*(_QWORD *)(a1 + 40), *(_DWORD *)(a1 + 24), 0, 0x40000u, *(_DWORD *)(*(_QWORD *)(a1 + 40) + 48), bytes, BytePtr, v7, *(CFDataRef *)(a1 + 352));
  }
  return 1;
}

CFErrorRef __NEFlowSetError(uint64_t a1, CFIndex code)
{
  const void *v4;
  CFErrorRef result;

  v4 = *(const void **)(a1 + 32);
  if (v4)
  {
    CFRelease(v4);
    *(_QWORD *)(a1 + 32) = 0;
  }
  result = CFErrorCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], CFSTR("com.apple.VPNTunnel"), code, 0);
  *(_QWORD *)(a1 + 32) = result;
  return result;
}

void flow_director_send_connect_result(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4, unsigned int a5, unsigned __int8 *a6, unsigned __int8 *a7, int a8, CFDataRef theData)
{
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  const __CFAllocator *v17;
  unint64_t v18;
  _DWORD *v19;
  char *v20;
  unint64_t v21;
  size_t v22;
  BOOL v23;
  char *v24;
  size_t v25;
  char *v26;
  unsigned int Length;
  const UInt8 *BytePtr;

  if (a6)
  {
    v14 = *a6 + 16;
    v15 = 5;
  }
  else
  {
    v15 = 4;
    v14 = 16;
  }
  if (a7)
  {
    v14 += *a7;
    ++v15;
  }
  if (theData)
  {
    v14 += CFDataGetLength(theData);
    ++v15;
  }
  v16 = 5 * v15 + v14;
  v17 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v18 = v16 + 8;
  v19 = CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x24BDBD240], v16 + 8, 0);
  *(_BYTE *)v19 = 2;
  v19[1] = bswap32(a2);
  if (v16 <= 8)
    goto LABEL_25;
  v20 = (char *)v19;
  *((_BYTE *)v19 + 8) = 5;
  *(_DWORD *)((char *)v19 + 9) = 0x4000000;
  *(_DWORD *)((char *)v19 + 13) = bswap32(a3);
  if (v16 - 9 <= 8)
    goto LABEL_25;
  *((_BYTE *)v19 + 17) = 9;
  *(_DWORD *)((char *)v19 + 18) = 0x4000000;
  *(_DWORD *)((char *)v19 + 22) = bswap32(a4);
  if (v16 - 18 <= 8)
    goto LABEL_25;
  *((_BYTE *)v19 + 26) = 10;
  *(_DWORD *)((char *)v19 + 27) = 0x4000000;
  *(_DWORD *)((char *)v19 + 31) = bswap32(a5);
  v21 = v16 - 27;
  if (!a6)
  {
    v24 = (char *)v19 + 35;
    if (!a7)
      goto LABEL_20;
LABEL_17:
    v25 = *a7;
    v23 = v21 >= v25 + 5;
    v21 -= v25 + 5;
    if (v23)
    {
      *v24 = 12;
      *(_DWORD *)(v24 + 1) = (_DWORD)v25 << 24;
      v26 = v24 + 5;
      memcpy(v26, a7, v25);
      v24 = &v26[v25];
      goto LABEL_20;
    }
LABEL_25:
    __assert_rtn("NEFlowTLVAdd", "NEFlow.c", 1839, "tlv_iter->remaining >= add_size");
  }
  v22 = *a6;
  v23 = v21 >= v22 + 5;
  v21 -= v22 + 5;
  if (!v23)
    goto LABEL_25;
  *((_BYTE *)v19 + 35) = 11;
  v19[9] = (_DWORD)v22 << 24;
  memcpy(v19 + 10, a6, v22);
  v24 = &v20[v22 + 40];
  if (a7)
    goto LABEL_17;
LABEL_20:
  if (v21 <= 8)
    goto LABEL_25;
  *v24 = 13;
  *(_DWORD *)(v24 + 1) = 0x4000000;
  *(_DWORD *)(v24 + 5) = a8;
  if (theData)
  {
    Length = CFDataGetLength(theData);
    BytePtr = CFDataGetBytePtr(theData);
    if (v21 - 9 < (unint64_t)Length + 5)
      goto LABEL_25;
    v24[9] = 31;
    *(_DWORD *)(v24 + 10) = bswap32(Length);
    memcpy(v24 + 14, BytePtr, Length);
  }
  flow_director_msg_send(a1, (uint64_t)v20, v18, 1);
  CFAllocatorDeallocate(v17, v20);
}

uint64_t NEFlowReadClose(os_unfair_lock_s *a1, const void *a2)
{
  return flow_close(a1, a2, 1);
}

uint64_t flow_close(os_unfair_lock_s *cf, const void *a2, int a3)
{
  uint64_t v6;
  CFTypeID TypeID;
  os_unfair_lock_s *v8;
  const void *v9;

  if (runtime_inited == -1)
  {
    if (!cf)
      return 0;
  }
  else
  {
    dispatch_once(&runtime_inited, &__block_literal_global_10);
    if (!cf)
      return 0;
  }
  v6 = __kNEFlowTypeID;
  if (CFGetTypeID(cf) != v6)
    return 0;
  if (a2)
  {
    TypeID = CFErrorGetTypeID();
    if (CFGetTypeID(a2) == TypeID)
    {
      v8 = cf + 30;
      os_unfair_lock_lock(cf + 30);
      v9 = *(const void **)&cf[8]._os_unfair_lock_opaque;
      if (v9)
        CFRelease(v9);
      *(_QWORD *)&cf[8]._os_unfair_lock_opaque = CFRetain(a2);
      goto LABEL_10;
    }
    return 0;
  }
  v8 = cf + 30;
  os_unfair_lock_lock(cf + 30);
LABEL_10:
  if (a3)
    flow_read_close((uint64_t)cf, 1);
  else
    flow_write_close((uint64_t)cf, 1);
  if ((~cf[25]._os_unfair_lock_opaque & 3) == 0 && !LOBYTE(cf[80]._os_unfair_lock_opaque))
    flow_drop_director(cf);
  os_unfair_lock_unlock(v8);
  return 1;
}

uint64_t NEFlowWriteClose(os_unfair_lock_s *a1, const void *a2)
{
  return flow_close(a1, a2, 0);
}

uint64_t NEFlowSetEventHandler(os_unfair_lock_s *cf, uint64_t a2, const void *a3)
{
  uint64_t v6;
  CFTypeID v7;
  uint64_t result;
  os_unfair_lock_s *v9;
  const void *v10;
  void **v11;
  const void *v12;

  if (runtime_inited != -1)
  {
    dispatch_once(&runtime_inited, &__block_literal_global_10);
    if (cf)
      goto LABEL_3;
    return 0;
  }
  if (!cf)
    return 0;
LABEL_3:
  v6 = __kNEFlowTypeID;
  v7 = CFGetTypeID(cf);
  result = 0;
  if (a2 <= 6 && v7 == v6)
  {
    os_unfair_lock_lock(cf + 30);
    v9 = &cf[2 * a2];
    v12 = *(const void **)&v9[36]._os_unfair_lock_opaque;
    v11 = (void **)&v9[36];
    v10 = v12;
    if (v12)
    {
      _Block_release(v10);
      *v11 = 0;
    }
    if (a3)
      *v11 = _Block_copy(a3);
    os_unfair_lock_unlock(cf + 30);
    return 1;
  }
  return result;
}

uint64_t NEFlowSetDispatchQueue(os_unfair_lock_s *cf, NSObject *a2)
{
  uint64_t v4;
  os_unfair_lock_s *v5;
  NSObject *v6;
  os_unfair_lock_s *v7;
  const void *v8;

  if (runtime_inited == -1)
  {
    if (!cf)
      return 0;
  }
  else
  {
    dispatch_once(&runtime_inited, &__block_literal_global_10);
    if (!cf)
      return 0;
  }
  v4 = __kNEFlowTypeID;
  if (CFGetTypeID(cf) != v4)
    return 0;
  v5 = cf + 30;
  os_unfair_lock_lock(cf + 30);
  v6 = *(NSObject **)&cf[34]._os_unfair_lock_opaque;
  if (v6)
  {
    dispatch_release(v6);
    *(_QWORD *)&cf[34]._os_unfair_lock_opaque = 0;
  }
  if (a2)
  {
    *(_QWORD *)&cf[34]._os_unfair_lock_opaque = a2;
    dispatch_retain(a2);
  }
  else
  {
    v7 = cf + 36;
    do
    {
      v8 = *(Class *)((char *)&a2->isa + (_QWORD)v7);
      if (v8)
      {
        _Block_release(v8);
        *(Class *)((char *)&a2->isa + (_QWORD)v7) = 0;
      }
      ++a2;
    }
    while (a2 != 56);
  }
  os_unfair_lock_unlock(v5);
  return 1;
}

os_unfair_lock_s *NEFlowCopyError(os_unfair_lock_s *cf)
{
  os_unfair_lock_s *v1;
  uint64_t v2;
  os_unfair_lock_s *v3;
  const void *v4;

  v1 = cf;
  if (runtime_inited == -1)
  {
    if (!cf)
      return v1;
  }
  else
  {
    dispatch_once(&runtime_inited, &__block_literal_global_10);
    if (!v1)
      return v1;
  }
  v2 = __kNEFlowTypeID;
  if (CFGetTypeID(v1) != v2)
    return 0;
  v3 = v1 + 30;
  os_unfair_lock_lock(v1 + 30);
  v4 = *(const void **)&v1[8]._os_unfair_lock_opaque;
  if (v4)
    v1 = (os_unfair_lock_s *)CFRetain(v4);
  else
    v1 = 0;
  os_unfair_lock_unlock(v3);
  return v1;
}

uint64_t NEFlowAsyncRead(os_unfair_lock_s *cf, const void *a2)
{
  uint64_t v4;
  uint64_t v5;

  if (runtime_inited == -1)
  {
    if (!cf)
      return 4;
  }
  else
  {
    dispatch_once(&runtime_inited, &__block_literal_global_10);
    if (!cf)
      return 4;
  }
  v4 = __kNEFlowTypeID;
  if (CFGetTypeID(cf) != v4)
    return 4;
  v5 = 4;
  if (a2 && *(_QWORD *)&cf[4]._os_unfair_lock_opaque == 1)
  {
    os_unfair_lock_lock(cf + 30);
    if (*(_QWORD *)&cf[82]._os_unfair_lock_opaque)
    {
      v5 = 101;
    }
    else
    {
      *(_QWORD *)&cf[82]._os_unfair_lock_opaque = _Block_copy(a2);
      if (flow_has_bytes((uint64_t)cf) || (cf[25]._os_unfair_lock_opaque & 2) != 0)
        flow_call_stream_read_handler((uint64_t)cf, 0);
      v5 = 0;
    }
    os_unfair_lock_unlock(cf + 30);
  }
  return v5;
}

uint64_t NEFlowAsyncDatagramsCopyNext(os_unfair_lock_s *cf, const void *a2)
{
  uint64_t v4;
  uint64_t v5;

  if (runtime_inited == -1)
  {
    if (!cf)
      return 4;
  }
  else
  {
    dispatch_once(&runtime_inited, &__block_literal_global_10);
    if (!cf)
      return 4;
  }
  v4 = __kNEFlowTypeID;
  if (CFGetTypeID(cf) != v4)
    return 4;
  v5 = 4;
  if (a2 && *(_QWORD *)&cf[4]._os_unfair_lock_opaque == 2)
  {
    os_unfair_lock_lock(cf + 30);
    if (*(_QWORD *)&cf[84]._os_unfair_lock_opaque)
    {
      v5 = 101;
    }
    else
    {
      *(_QWORD *)&cf[84]._os_unfair_lock_opaque = _Block_copy(a2);
      if (flow_has_bytes((uint64_t)cf) || (cf[25]._os_unfair_lock_opaque & 2) != 0)
        flow_call_dgram_read_handler((uint64_t)cf, 0);
      v5 = 0;
    }
    os_unfair_lock_unlock(cf + 30);
  }
  return v5;
}

uint64_t NEFlowWrite(os_unfair_lock_s *cf, const void *a2, unsigned __int8 *a3, void *a4)
{
  uint64_t v8;
  CFTypeID TypeID;
  int v10;
  unsigned int v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v15;
  uint32_t v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  NSObject *v20;
  uint32_t v21;
  int v22;
  int v23;
  os_unfair_lock_s *v24;
  CFIndex Length;
  CFIndex v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint32_t v30;
  int v31;
  uint32_t os_unfair_lock_opaque;
  NSObject *v33;
  uint64_t v34;
  _QWORD *v35;
  _QWORD *v36;
  NSObject *v37;
  uint32_t v38;
  uint32_t v39;
  int v40;
  uint32_t v41;
  __int16 v42;
  _WORD v43[11];

  *(_QWORD *)&v43[7] = *MEMORY[0x24BDAC8D0];
  if (runtime_inited == -1)
  {
    if (!cf)
      return 4;
  }
  else
  {
    dispatch_once(&runtime_inited, &__block_literal_global_10);
    if (!cf)
      return 4;
  }
  v8 = __kNEFlowTypeID;
  if (CFGetTypeID(cf) != v8)
    return 4;
  TypeID = CFDataGetTypeID();
  if (!a2 || CFGetTypeID(a2) != TypeID)
  {
    v12 = ne_log_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      os_unfair_lock_opaque = cf[6]._os_unfair_lock_opaque;
      v40 = 67109378;
      v41 = os_unfair_lock_opaque;
      v42 = 2080;
      *(_QWORD *)v43 = "invalid data object";
      _os_log_debug_impl(&dword_208439000, v12, OS_LOG_TYPE_DEBUG, "(%u): %s", (uint8_t *)&v40, 0x12u);
    }
    return 4;
  }
  if (CFDataGetLength((CFDataRef)a2) <= 0)
  {
    v15 = ne_log_obj();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = cf[6]._os_unfair_lock_opaque;
      v40 = 67109376;
      v41 = v16;
      v42 = 2048;
      *(_QWORD *)v43 = CFDataGetLength((CFDataRef)a2);
      v17 = "(%u): data length %ld <= 0";
      v18 = v15;
      v19 = 18;
LABEL_30:
      _os_log_error_impl(&dword_208439000, v18, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v40, v19);
    }
    return 4;
  }
  if (a3)
  {
    v10 = a3[1];
    if (v10 == 2)
    {
      v11 = *a3;
      if (v11 < 0x10)
        goto LABEL_20;
    }
    else
    {
      if (v10 != 30)
      {
        v29 = ne_log_obj();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          v30 = cf[6]._os_unfair_lock_opaque;
          v31 = a3[1];
          v40 = 67109376;
          v41 = v30;
          v42 = 1024;
          *(_DWORD *)v43 = v31;
          v17 = "(%u): address has an invalid family %d";
          v18 = v29;
          v19 = 14;
          goto LABEL_30;
        }
        return 4;
      }
      v11 = *a3;
      if (v11 < 0x1C)
        goto LABEL_20;
    }
    if (v11 >= 0x1D)
    {
LABEL_20:
      v20 = ne_log_obj();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = cf[6]._os_unfair_lock_opaque;
        v22 = a3[1];
        v23 = *a3;
        v40 = 67109632;
        v41 = v21;
        v42 = 1024;
        *(_DWORD *)v43 = v22;
        v43[2] = 1024;
        *(_DWORD *)&v43[3] = v23;
        v17 = "(%u): address with family %d has an invalid length %d";
        v18 = v20;
        v19 = 20;
        goto LABEL_30;
      }
      return 4;
    }
  }
  if (*(_QWORD *)&cf[4]._os_unfair_lock_opaque == 2
    && cf[72]._os_unfair_lock_opaque < CFDataGetLength((CFDataRef)a2))
  {
    return 100;
  }
  v24 = cf + 30;
  os_unfair_lock_lock(cf + 30);
  if ((cf[25]._os_unfair_lock_opaque & 1) != 0)
  {
    v33 = ne_log_obj();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v38 = cf[6]._os_unfair_lock_opaque;
      v40 = 67109376;
      v41 = v38;
      v42 = 2048;
      *(_QWORD *)v43 = CFDataGetLength((CFDataRef)a2);
      _os_log_error_impl(&dword_208439000, v33, OS_LOG_TYPE_ERROR, "(%u): flow is closed for writes, cannot write %ld bytes of data", (uint8_t *)&v40, 0x12u);
    }
    v13 = 1;
  }
  else
  {
    Length = CFDataGetLength((CFDataRef)a2);
    v26 = Length;
    if (*(_QWORD *)&cf[76]._os_unfair_lock_opaque)
    {
      v27 = 0;
      v28 = Length;
    }
    else
    {
      v27 = flow_write_range_of_cfdata((uint64_t)cf, (const __CFData *)a2, 0, Length, a3);
      v28 = v34;
    }
    if (v28 < 1)
    {
      if (a4)
        flow_call_write_completion((uint64_t)cf, 0, a4);
    }
    else
    {
      v35 = CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x24BDBD240], 168, 0);
      v36 = v35;
      *(_OWORD *)v35 = 0u;
      *((_OWORD *)v35 + 1) = 0u;
      *((_OWORD *)v35 + 2) = 0u;
      *((_OWORD *)v35 + 3) = 0u;
      *((_OWORD *)v35 + 4) = 0u;
      *((_OWORD *)v35 + 5) = 0u;
      *((_OWORD *)v35 + 6) = 0u;
      *((_OWORD *)v35 + 7) = 0u;
      *((_OWORD *)v35 + 8) = 0u;
      *((_OWORD *)v35 + 9) = 0u;
      v35[20] = 0;
      if (a3)
        memcpy(v35, a3, *a3);
      v36[16] = CFRetain(a2);
      v36[17] = v27;
      v36[18] = v28;
      if (a4)
        v36[19] = _Block_copy(a4);
      v36[20] = 0;
      **(_QWORD **)&cf[78]._os_unfair_lock_opaque = v36;
      *(_QWORD *)&cf[78]._os_unfair_lock_opaque = v36 + 20;
    }
    v37 = ne_log_obj();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      v39 = cf[6]._os_unfair_lock_opaque;
      v40 = 67109376;
      v41 = v39;
      v42 = 2048;
      *(_QWORD *)v43 = v26;
      _os_log_debug_impl(&dword_208439000, v37, OS_LOG_TYPE_DEBUG, "(%u): plugin wrote %ld bytes", (uint8_t *)&v40, 0x12u);
    }
    v13 = 0;
    *(_QWORD *)&cf[62]._os_unfair_lock_opaque += v26;
  }
  os_unfair_lock_unlock(v24);
  return v13;
}

uint64_t flow_write_range_of_cfdata(uint64_t a1, const __CFData *a2, uint64_t a3, uint64_t a4, unsigned __int8 *__src)
{
  uint64_t v5;
  unint64_t v8;
  int v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  char *v17;
  NSObject *v18;
  int v19;
  NSObject *v20;
  int v22;
  char *v23;
  uint8_t buf[4];
  int v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  char *v29;
  uint64_t v30;

  v5 = a4;
  v30 = *MEMORY[0x24BDAC8D0];
  if (!a2)
    return a3;
  v8 = *(unsigned int *)(a1 + 104);
  if (!*(_DWORD *)(a1 + 104) || a4 < 1)
    return a3;
  while (*(_QWORD *)(a1 + 16) == 2)
  {
    v12 = flow_director_send_cfdata(*(_QWORD *)(a1 + 40), *(_DWORD *)(a1 + 24), a2, a3, v5, __src);
    v13 = v5;
    if (v12)
      goto LABEL_20;
LABEL_15:
    *(_QWORD *)(a1 + 240) += v13;
    v15 = ne_log_obj();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v16 = *(_DWORD *)(a1 + 24);
      v17 = *(char **)(a1 + 240);
      *(_DWORD *)buf = 67109632;
      v25 = v16;
      v26 = 2048;
      v27 = v13;
      v28 = 2048;
      v29 = v17;
      _os_log_debug_impl(&dword_208439000, v15, OS_LOG_TYPE_DEBUG, "(%u): Wrote %ld bytes to the kernel (total bytes written = %llu)", buf, 0x1Cu);
    }
    a3 += v13;
    v5 -= v13;
    v8 = *(unsigned int *)(a1 + 104);
    if (!(_DWORD)v8 || v5 <= 0)
      return a3;
  }
  if (v8 >= v5)
    v8 = v5;
  v14 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(v14 + 184) >= (unint64_t)v8)
    v13 = v8;
  else
    v13 = *(_QWORD *)(v14 + 184);
  v12 = flow_director_send_cfdata(v14, *(_DWORD *)(a1 + 24), a2, a3, v13, 0);
  if (!v12)
    goto LABEL_15;
LABEL_20:
  if (v12 == 55)
  {
    v18 = ne_log_obj();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = *(_DWORD *)(a1 + 24);
      *(_DWORD *)buf = 67109376;
      v25 = v19;
      v26 = 2048;
      v27 = v13;
      _os_log_impl(&dword_208439000, v18, OS_LOG_TYPE_DEFAULT, "(%u): app receive buffer is full, queueing %lu bytes", buf, 0x12u);
    }
  }
  else
  {
    v20 = ne_log_obj();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v22 = *(_DWORD *)(a1 + 24);
      v23 = strerror(v12);
      *(_DWORD *)buf = 67109634;
      v25 = v22;
      v26 = 2048;
      v27 = v13;
      v28 = 2080;
      v29 = v23;
      _os_log_error_impl(&dword_208439000, v20, OS_LOG_TYPE_ERROR, "(%u): Got an error when sending %lu bytes to the kernel: %s", buf, 0x1Cu);
    }
  }
  return a3;
}

uint64_t flow_director_send_cfdata(uint64_t a1, unsigned int a2, const __CFData *a3, uint64_t a4, uint64_t a5, unsigned __int8 *__src)
{
  NSObject *v10;
  size_t v11;
  unint64_t v12;
  NSObject *v13;
  uint64_t v14;
  const UInt8 *BytePtr;
  uint64_t v16;
  _OWORD v18[3];
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v10 = *(NSObject **)(a1 + 40);
    if (!v10)
      v10 = *(NSObject **)(a1 + 24);
    v19 = 0;
    memset(v18, 0, sizeof(v18));
    LOBYTE(v18[0]) = 3;
    DWORD1(v18[0]) = bswap32(a2);
    if (__src)
    {
      v11 = *__src;
      if (v11 >= 0x28)
        __assert_rtn("NEFlowTLVAdd", "NEFlow.c", 1839, "tlv_iter->remaining >= add_size");
      BYTE8(v18[0]) = 12;
      *(_DWORD *)((char *)v18 + 9) = (_DWORD)v11 << 24;
      memcpy((void *)((unint64_t)v18 | 0xD), __src, v11);
      v12 = v11 + 13;
    }
    else
    {
      v12 = 8;
    }
    BytePtr = CFDataGetBytePtr(a3);
    v16 = flow_director_ctl_write(v10, (uint64_t)v18, v12, (uint64_t)&BytePtr[a4], a5, (uint64_t)"data");
    v14 = v16;
    if ((_DWORD)v16 && (_DWORD)v16 != 55)
      flow_director_abort(a1, 0);
  }
  else
  {
    v13 = ne_log_obj();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v18[0]) = 67109120;
      DWORD1(v18[0]) = dword_25453C118;
      _os_log_impl(&dword_208439000, v13, OS_LOG_TYPE_DEFAULT, "(%u): Director is NULL, dropping data", (uint8_t *)v18, 8u);
    }
    return 22;
  }
  return v14;
}

os_unfair_lock_s *NEFlowCopyProperty(os_unfair_lock_s *cf, const void *a2)
{
  os_unfair_lock_s *v3;
  uint64_t v4;
  os_unfair_lock_s *v5;
  const __CFAllocator *v6;
  os_unfair_lock_s *v7;
  CFNumberType v8;
  os_unfair_lock_s *v9;
  const void *v10;

  v3 = cf;
  if (runtime_inited == -1)
  {
    if (!cf)
      return v3;
  }
  else
  {
    dispatch_once(&runtime_inited, &__block_literal_global_10);
    if (!v3)
      return v3;
  }
  v4 = __kNEFlowTypeID;
  if (CFGetTypeID(v3) == v4)
  {
    v5 = v3 + 30;
    os_unfair_lock_lock(v3 + 30);
    if (CFEqual(a2, CFSTR("Type")))
    {
      v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      v7 = v3 + 4;
      v8 = kCFNumberCFIndexType;
LABEL_6:
      v9 = (os_unfair_lock_s *)CFNumberCreate(v6, v8, v7);
LABEL_7:
      v3 = v9;
LABEL_36:
      os_unfair_lock_unlock(v5);
      return v3;
    }
    if (CFEqual(a2, CFSTR("DestinationName")))
    {
      if ((unint64_t)(*(_QWORD *)&v3[4]._os_unfair_lock_opaque - 1) <= 1)
      {
        v10 = *(const void **)&v3[16]._os_unfair_lock_opaque;
        if (!v10)
          goto LABEL_35;
LABEL_16:
        v9 = (os_unfair_lock_s *)CFRetain(v10);
        goto LABEL_7;
      }
    }
    else
    {
      if (CFEqual(a2, CFSTR("DestinationEndpoint")))
      {
        if ((unint64_t)(*(_QWORD *)&v3[4]._os_unfair_lock_opaque - 1) <= 1)
        {
          v10 = *(const void **)&v3[12]._os_unfair_lock_opaque;
          goto LABEL_16;
        }
        goto LABEL_34;
      }
      if (CFEqual(a2, CFSTR("AppRuleIdentifier")))
      {
        if ((unint64_t)(*(_QWORD *)&v3[4]._os_unfair_lock_opaque - 1) <= 1)
        {
          v10 = *(const void **)&v3[18]._os_unfair_lock_opaque;
          if (!v10)
          {
            v10 = *(const void **)&v3[20]._os_unfair_lock_opaque;
            if (!v10)
              goto LABEL_35;
          }
          goto LABEL_16;
        }
        goto LABEL_34;
      }
      if (!CFEqual(a2, CFSTR("AppUnique")))
      {
        if (CFEqual(a2, CFSTR("ServiceType")))
        {
          if ((unint64_t)(*(_QWORD *)&v3[4]._os_unfair_lock_opaque - 1) > 1)
            goto LABEL_34;
          v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
          v7 = v3 + 24;
        }
        else
        {
          if (CFEqual(a2, CFSTR("LocalEndpoint")))
          {
            if ((unint64_t)(*(_QWORD *)&v3[4]._os_unfair_lock_opaque - 1) <= 1)
            {
              v10 = *(const void **)&v3[14]._os_unfair_lock_opaque;
              if (!v10)
                goto LABEL_35;
              goto LABEL_16;
            }
            goto LABEL_34;
          }
          if (CFEqual(a2, CFSTR("Flags")))
          {
            v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
            v7 = v3 + 86;
            v8 = kCFNumberSInt32Type;
            goto LABEL_6;
          }
          if (CFEqual(a2, CFSTR("AppData")))
          {
            v10 = *(const void **)&v3[88]._os_unfair_lock_opaque;
            if (!v10)
              goto LABEL_35;
            goto LABEL_16;
          }
          if (CFEqual(a2, CFSTR("AppAuditToken")))
          {
            v10 = *(const void **)&v3[90]._os_unfair_lock_opaque;
            if (!v10)
              goto LABEL_35;
            goto LABEL_16;
          }
          if (CFEqual(a2, CFSTR("FilterFlowID")))
          {
            v10 = *(const void **)&v3[98]._os_unfair_lock_opaque;
            if (!v10)
              goto LABEL_35;
            goto LABEL_16;
          }
          if (!CFEqual(a2, CFSTR("OutboundInterfaceIndex")) || !v3[100]._os_unfair_lock_opaque)
            goto LABEL_35;
          v7 = v3 + 100;
          v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
        }
        v8 = kCFNumberIntType;
        goto LABEL_6;
      }
      if ((unint64_t)(*(_QWORD *)&v3[4]._os_unfair_lock_opaque - 1) <= 1)
      {
        v10 = *(const void **)&v3[22]._os_unfair_lock_opaque;
        if (!v10)
          goto LABEL_35;
        goto LABEL_16;
      }
    }
LABEL_34:
    __NEFlowSetError((uint64_t)v3, 4);
LABEL_35:
    v3 = 0;
    goto LABEL_36;
  }
  return 0;
}

uint64_t NEFlowSetProperty(uint64_t cf, const void *a2, const __CFData *a3)
{
  uint64_t v5;
  uint64_t v6;
  os_unfair_lock_s *v7;
  CFTypeID TypeID;
  uint64_t v9;
  CFIndex v10;
  uint64_t v11;
  CFTypeID v12;
  NSObject *v13;
  const void *v14;
  CFTypeID v15;
  unsigned int v16;
  NSObject *v17;
  int v19;
  int v20;
  unsigned int valuePtr;
  char v22[16];
  uint8_t buf[4];
  int v24;
  __int16 v25;
  char *v26;
  uint64_t v27;

  v5 = cf;
  v27 = *MEMORY[0x24BDAC8D0];
  if (runtime_inited == -1)
  {
    if (!cf)
      return v5;
  }
  else
  {
    dispatch_once(&runtime_inited, &__block_literal_global_10);
    if (!v5)
      return v5;
  }
  v6 = __kNEFlowTypeID;
  if (CFGetTypeID((CFTypeRef)v5) == v6)
  {
    v7 = (os_unfair_lock_s *)(v5 + 120);
    os_unfair_lock_lock((os_unfair_lock_t)(v5 + 120));
    if (CFEqual(a2, CFSTR("LocalEndpoint")))
    {
      TypeID = CFDataGetTypeID();
      if (a3 && CFGetTypeID(a3) == TypeID)
      {
        v9 = NEFlowResetLocalEndpoint(v5, a3);
        if (v9)
        {
          v10 = v9;
          v11 = v5;
LABEL_28:
          __NEFlowSetError(v11, v10);
          goto LABEL_29;
        }
LABEL_26:
        v5 = 1;
LABEL_30:
        os_unfair_lock_unlock(v7);
        return v5;
      }
    }
    else if (CFEqual(a2, CFSTR("AppData")))
    {
      v12 = CFDataGetTypeID();
      if (a3 && CFGetTypeID(a3) == v12)
      {
        v13 = ne_log_obj();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          v19 = *(_DWORD *)(v5 + 24);
          *(_DWORD *)buf = 67109378;
          v24 = v19;
          v25 = 2080;
          v26 = "Sending a properties update with app data";
          _os_log_debug_impl(&dword_208439000, v13, OS_LOG_TYPE_DEBUG, "(%u): %s", buf, 0x12u);
        }
        if ((*(_BYTE *)(v5 + 100) & 4) != 0)
          flow_director_send_properties_update(*(_QWORD *)(v5 + 40), *(_DWORD *)(v5 + 24), 0, a3);
        v14 = *(const void **)(v5 + 352);
        if (v14)
        {
          CFRelease(v14);
          *(_QWORD *)(v5 + 352) = 0;
        }
        *(_QWORD *)(v5 + 352) = CFDataCreateCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], a3);
        goto LABEL_26;
      }
    }
    else
    {
      if (!CFEqual(a2, CFSTR("OutboundInterfaceIndex")))
      {
LABEL_29:
        v5 = 0;
        goto LABEL_30;
      }
      v15 = CFNumberGetTypeID();
      if (a3 && CFGetTypeID(a3) == v15)
      {
        valuePtr = 0;
        CFNumberGetValue(a3, kCFNumberIntType, &valuePtr);
        v16 = valuePtr;
        *(_DWORD *)(v5 + 400) = valuePtr;
        *(_OWORD *)v22 = *(_OWORD *)"<none>";
        if_indextoname(v16, v22);
        v17 = ne_log_obj();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          v20 = *(_DWORD *)(v5 + 24);
          *(_DWORD *)buf = 67109378;
          v24 = v20;
          v25 = 2080;
          v26 = v22;
          _os_log_debug_impl(&dword_208439000, v17, OS_LOG_TYPE_DEBUG, "(%u): Setting outbound interface to %s", buf, 0x12u);
        }
        flow_director_send_properties_update(*(_QWORD *)(v5 + 40), *(_DWORD *)(v5 + 24), valuePtr, 0);
        goto LABEL_26;
      }
    }
    v11 = v5;
    v10 = 4;
    goto LABEL_28;
  }
  return 0;
}

uint64_t NEFlowResetLocalEndpoint(uint64_t a1, CFDataRef theData)
{
  UInt8 *BytePtr;
  int v5;
  CFStringRef v6;
  const char *v7;
  int v8;
  NSObject *v9;
  const __CFData *v10;
  const UInt8 *v11;
  const UInt8 *v12;
  int v13;
  int v14;
  NSObject *v15;
  uint64_t result;
  void *v17;
  _BOOL4 v18;
  NSObject *v20;
  CFDataRef v21;
  uint64_t v22;
  uint64_t v23;
  __int128 *v24;
  void *v26;
  int v27;
  int v28;
  int v29;
  CFIndex length;
  __int128 v31;
  int v32;
  uint8_t buf[4];
  int v34;
  __int16 v35;
  const char *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  BytePtr = (UInt8 *)CFDataGetBytePtr(theData);
  length = 0;
  v31 = 0uLL;
  v32 = 0;
  v5 = *(_DWORD *)(a1 + 400);
  v6 = NECreateAddressString((CFStringRef)BytePtr);
  if (v6)
  {
    v7 = (const char *)v6;
    if (!NEIsWildcardAddress(BytePtr))
    {
      v8 = NEGetInterfaceForAddress(BytePtr);
      if (v8)
        goto LABEL_7;
      v9 = ne_log_obj();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v29 = *(_DWORD *)(a1 + 24);
        *(_DWORD *)buf = 67109378;
        v34 = v29;
        v35 = 2112;
        v36 = v7;
        _os_log_error_impl(&dword_208439000, v9, OS_LOG_TYPE_ERROR, "(%u): No interface found for %@, not re-setting the interface", buf, 0x12u);
      }
    }
    v8 = v5;
LABEL_7:
    CFRelease(v7);
    v10 = *(const __CFData **)(a1 + 56);
    if (v10)
    {
      v11 = CFDataGetBytePtr(v10);
      v12 = v11;
      v13 = BytePtr[1];
      if (v13 == 2)
      {
        LOWORD(length) = 528;
        WORD1(length) = *((_WORD *)BytePtr + 1);
        v14 = v11[1];
        if (v14 == 2)
          HIDWORD(length) = *((_DWORD *)v11 + 1);
      }
      else
      {
        LOWORD(length) = 7708;
        WORD1(length) = *((_WORD *)BytePtr + 1);
        v14 = v11[1];
        if (v14 == 30)
          v31 = *(_OWORD *)(v11 + 8);
      }
      v18 = NEIsWildcardAddress(BytePtr);
      if (v13 != v14 || v18)
      {
        v20 = ne_log_obj();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          v28 = *(_DWORD *)(a1 + 24);
          *(_DWORD *)buf = 67109378;
          v34 = v28;
          v35 = 2080;
          v36 = "New local address is unspecified or has a different address family, only re-setting the local port";
          _os_log_debug_impl(&dword_208439000, v20, OS_LOG_TYPE_DEBUG, "(%u): %s", buf, 0x12u);
        }
        CFRelease(*(CFTypeRef *)(a1 + 56));
        v21 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const UInt8 *)&length, length);
        result = 0;
        *(_QWORD *)(a1 + 56) = v21;
        return result;
      }
      if (v13 == 30)
      {
        v22 = *((_QWORD *)BytePtr + 1);
        v23 = *((_QWORD *)BytePtr + 2);
        v24 = (__int128 *)(BytePtr + 8);
        if (*((_QWORD *)v12 + 1) != v22 || *((_QWORD *)v12 + 2) != v23)
        {
          *(_DWORD *)(a1 + 100) |= 0x40u;
          v31 = *v24;
        }
      }
      else if (v13 == 2 && *((_DWORD *)v12 + 1) != *((_DWORD *)BytePtr + 1))
      {
        *(_DWORD *)(a1 + 100) |= 0x40u;
        HIDWORD(length) = *((_DWORD *)BytePtr + 1);
      }
      CFRelease(*(CFTypeRef *)(a1 + 56));
      v17 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const UInt8 *)&length, length);
    }
    else
    {
      v17 = (void *)CFRetain(theData);
    }
    v26 = v17;
    result = 0;
    *(_QWORD *)(a1 + 56) = v26;
    *(_DWORD *)(a1 + 400) = v8;
    return result;
  }
  v15 = ne_log_obj();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v27 = *(_DWORD *)(a1 + 24);
    *(_DWORD *)buf = 67109378;
    v34 = v27;
    v35 = 2080;
    v36 = "Cannot reset the local endpoint, given address is invalid";
    _os_log_error_impl(&dword_208439000, v15, OS_LOG_TYPE_ERROR, "(%u): %s", buf, 0x12u);
  }
  return 4;
}

void flow_director_send_properties_update(uint64_t a1, unsigned int a2, int a3, const __CFData *a4)
{
  CFTypeID TypeID;
  CFIndex v9;
  uint64_t v10;
  unint64_t v11;
  const __CFAllocator *v12;
  _DWORD *v13;
  uint64_t v14;
  CFTypeID v15;
  unsigned int Length;
  const UInt8 *BytePtr;

  TypeID = CFDataGetTypeID();
  if (a4 && CFGetTypeID(a4) == TypeID)
  {
    v9 = CFDataGetLength(a4) + 4;
    v10 = 10;
  }
  else
  {
    v10 = 5;
    v9 = 4;
  }
  v11 = v10 + v9;
  v12 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v13 = CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x24BDBD240], v10 + v9 + 8, 0);
  *(_BYTE *)v13 = 7;
  v13[1] = bswap32(a2);
  if (v11 <= 8)
    goto LABEL_11;
  v14 = (uint64_t)v13;
  *((_BYTE *)v13 + 8) = 13;
  *(_DWORD *)((char *)v13 + 9) = 0x4000000;
  *(_DWORD *)((char *)v13 + 13) = a3;
  v15 = CFDataGetTypeID();
  if (a4 && CFGetTypeID(a4) == v15)
  {
    Length = CFDataGetLength(a4);
    BytePtr = CFDataGetBytePtr(a4);
    if (v11 - 9 >= (unint64_t)Length + 5)
    {
      *(_BYTE *)(v14 + 17) = 31;
      *(_DWORD *)(v14 + 18) = bswap32(Length);
      memcpy((void *)(v14 + 22), BytePtr, Length);
      goto LABEL_10;
    }
LABEL_11:
    __assert_rtn("NEFlowTLVAdd", "NEFlow.c", 1839, "tlv_iter->remaining >= add_size");
  }
LABEL_10:
  flow_director_msg_send(a1, v14, v11 + 8, 0);
  CFAllocatorDeallocate(v12, (void *)v14);
}

CFDictionaryRef NEFlowCopyStateDictionary(uint64_t a1, uint64_t a2)
{
  const __CFData *v4;
  const UInt8 *BytePtr;
  __CFString *v6;
  const __CFData *v7;
  const UInt8 *v8;
  __CFString *v9;
  const __CFAllocator *v10;
  CFNumberRef v11;
  const __CFString *v12;
  const void *v13;
  const __CFString *v14;
  const void *v15;
  const __CFString *v16;
  uint64_t v17;
  uint64_t v18;
  size_t size;
  uint64_t v20;
  uint64_t v21;
  CFDictionaryRef v22;
  uint64_t i;
  size_t v25;
  _BOOL4 valuePtr;
  void *v27[2];
  __int128 v28;
  CFNumberRef v29;
  void *v30[2];
  __int128 v31;
  const __CFString *v32;
  void *values[2];
  __int128 v34;
  __int128 v35;
  void *keys[2];
  __int128 v37;
  __int128 v38;
  void *v39[2];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  void *v43[2];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  *(_OWORD *)v43 = xmmword_24C09FEE8;
  v44 = *(_OWORD *)&off_24C09FEF8;
  v45 = xmmword_24C09FF08;
  v46 = *(_OWORD *)&off_24C09FF18;
  v41 = 0u;
  v42 = 0u;
  v40 = 0u;
  *(_OWORD *)keys = xmmword_24C09FF28;
  v37 = *(_OWORD *)&off_24C09FF38;
  v38 = xmmword_24C09FF48;
  v34 = 0u;
  v35 = 0u;
  *(_OWORD *)values = 0u;
  *(_OWORD *)v30 = xmmword_24C09FF58;
  v31 = *(_OWORD *)off_24C09FF68;
  v32 = CFSTR("SendBufferSize");
  v29 = 0;
  *(_OWORD *)v27 = 0u;
  v28 = 0u;
  v4 = *(const __CFData **)(a1 + 48);
  if (v4)
  {
    BytePtr = CFDataGetBytePtr(v4);
    v6 = NECreateAddressStringWithPort((uint64_t)BytePtr);
  }
  else
  {
    v6 = CFSTR("<unknown>");
  }
  v7 = *(const __CFData **)(a1 + 56);
  if (v7)
  {
    v8 = CFDataGetBytePtr(v7);
    v9 = NECreateAddressStringWithPort((uint64_t)v8);
  }
  else
  {
    v9 = CFSTR("<unknown>");
  }
  v10 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v11 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberLongType, (const void *)(a1 + 24));
  v12 = CFSTR("TCP");
  if (*(_QWORD *)(a1 + 16) == 2)
    v12 = CFSTR("UDP");
  v39[0] = v11;
  v39[1] = (void *)v12;
  v13 = *(const void **)(a1 + 80);
  if (v13)
    v14 = (const __CFString *)CFRetain(v13);
  else
    v14 = CFSTR("<unknown>");
  *(_QWORD *)&v40 = v14;
  *((_QWORD *)&v40 + 1) = v6;
  *(_QWORD *)&v41 = v9;
  v15 = *(const void **)(a1 + 64);
  if (v15)
    v16 = (const __CFString *)CFRetain(v15);
  else
    v16 = CFSTR("<unknown>");
  *((_QWORD *)&v41 + 1) = v16;
  v17 = *(_QWORD *)(a1 + 16);
  v18 = 328;
  if (v17 == 2)
    v18 = 336;
  valuePtr = *(_QWORD *)(a1 + v18) != 0;
  if (v17 == 2)
  {
    size = *(unsigned int *)(a1 + 280);
  }
  else
  {
    size = *(_QWORD *)(a1 + 112);
    if (size)
      size = dispatch_data_get_size((dispatch_data_t)size);
  }
  v25 = size;
  values[0] = CFNumberCreate(v10, kCFNumberLongType, &v25);
  values[1] = CFNumberCreate(v10, kCFNumberIntType, &valuePtr);
  *(_QWORD *)&v34 = CFNumberCreate(v10, kCFNumberLongLongType, (const void *)(a1 + 232));
  *((_QWORD *)&v34 + 1) = CFNumberCreate(v10, kCFNumberLongLongType, (const void *)(a1 + 240));
  *(_QWORD *)&v35 = CFNumberCreate(v10, kCFNumberLongLongType, (const void *)(a1 + 248));
  *((_QWORD *)&v35 + 1) = CFNumberCreate(v10, kCFNumberLongLongType, (const void *)(a1 + 256));
  v20 = 0;
  *(_QWORD *)&v42 = CFDictionaryCreate(v10, (const void **)keys, (const void **)values, 6, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  do
    CFRelease(values[v20++]);
  while (v20 != 6);
  v27[0] = CFNumberCreate(v10, kCFNumberLongLongType, (const void *)(a2 + 8));
  v27[1] = CFNumberCreate(v10, kCFNumberLongLongType, (const void *)(a2 + 16));
  *(_QWORD *)&v28 = CFNumberCreate(v10, kCFNumberLongLongType, (const void *)(a2 + 24));
  *((_QWORD *)&v28 + 1) = CFNumberCreate(v10, kCFNumberIntType, (const void *)(a2 + 32));
  v29 = CFNumberCreate(v10, kCFNumberIntType, (const void *)(a2 + 36));
  v21 = 0;
  *((_QWORD *)&v42 + 1) = CFDictionaryCreate(v10, (const void **)v30, (const void **)v27, 5, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  do
    CFRelease(v27[v21++]);
  while (v21 != 5);
  v22 = CFDictionaryCreate(v10, (const void **)v43, (const void **)v39, 8, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  for (i = 0; i != 8; ++i)
    CFRelease(v39[i]);
  return v22;
}

uint64_t NEFlowTLVNext(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  _BYTE *v3;
  unsigned int v4;
  uint64_t v5;
  unint64_t v6;
  _BYTE *v8;

  v2 = *(_QWORD *)(a1 + 8);
  if (v2 < 5)
    return 0;
  v3 = *(_BYTE **)a1;
  *(_BYTE *)a2 = **(_BYTE **)a1;
  v4 = *(_DWORD *)(v3 + 1);
  v5 = bswap32(v4);
  *(_DWORD *)(a2 + 4) = v5;
  if (v4)
  {
    v6 = v5 + 5;
    if (v6 > v2)
      return 0;
    v8 = v3 + 5;
  }
  else
  {
    v8 = 0;
    v6 = 5;
  }
  *(_QWORD *)(a2 + 8) = v8;
  *(_QWORD *)a1 = &v3[v6];
  *(_QWORD *)(a1 + 8) = v2 - v6;
  return 1;
}

_DWORD *NEFlowTLVMsgCreate(unsigned int a1, char a2, uint64_t a3, uint64_t a4, _QWORD *a5, _QWORD *a6)
{
  uint64_t v10;
  _DWORD *result;

  v10 = 5 * a3 + a4;
  result = CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x24BDBD240], v10 + 8, 0);
  *(_BYTE *)result = a2;
  result[1] = bswap32(a1);
  if (a6)
  {
    *a6 = result + 2;
    a6[1] = v10;
  }
  *a5 = v10 + 8;
  return result;
}

char *NEFlowDirectorCreateInternal(int a1, NSObject *a2, unint64_t a3)
{
  NSObject *v6;
  char *v7;
  NSObject *v8;
  NSObject *initially_inactive;
  NSObject *v10;
  NSObject *v11;
  int v12;
  int v13;
  NSObject *v15;
  const char *v16;
  socklen_t v17;
  sockaddr buf[2];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (a1 < 0)
  {
    v15 = ne_log_obj();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      return 0;
    *(_DWORD *)&buf[0].sa_len = 136315138;
    *(_QWORD *)&buf[0].sa_data[2] = "NEFlowDirectorCreateInternal";
    v16 = "%s called with null (control_socket >= 0)";
LABEL_20:
    _os_log_fault_impl(&dword_208439000, v15, OS_LOG_TYPE_FAULT, v16, &buf[0].sa_len, 0xCu);
    return 0;
  }
  if (!((unint64_t)a2 | a3))
  {
    v15 = ne_log_obj();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      return 0;
    *(_DWORD *)&buf[0].sa_len = 136315138;
    *(_QWORD *)&buf[0].sa_data[2] = "NEFlowDirectorCreateInternal";
    v16 = "%s called with null (callback_queue != ((void *)0) || bridge_context != ((void *)0))";
    goto LABEL_20;
  }
  if (NEFlowDirectorCreateInternal_init_predicate != -1)
    dispatch_once(&NEFlowDirectorCreateInternal_init_predicate, &__block_literal_global_71);
  v6 = ne_log_obj();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)&buf[0].sa_len = 67109378;
    *(_DWORD *)&buf[0].sa_data[2] = dword_25453C118;
    *(_WORD *)&buf[0].sa_data[6] = 2080;
    *(_QWORD *)&buf[0].sa_data[8] = "Creating a new flow director";
    _os_log_impl(&dword_208439000, v6, OS_LOG_TYPE_DEFAULT, "(%u): %s", &buf[0].sa_len, 0x12u);
  }
  v7 = (char *)CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x24BDBD240], 200, 0);
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *((_OWORD *)v7 + 2) = 0u;
  *((_OWORD *)v7 + 3) = 0u;
  *((_OWORD *)v7 + 4) = 0u;
  *((_OWORD *)v7 + 5) = 0u;
  *((_OWORD *)v7 + 6) = 0u;
  *((_OWORD *)v7 + 7) = 0u;
  *((_OWORD *)v7 + 8) = 0u;
  *((_OWORD *)v7 + 9) = 0u;
  *((_OWORD *)v7 + 10) = 0u;
  *((_OWORD *)v7 + 11) = 0u;
  *((_QWORD *)v7 + 24) = 0;
  rb_tree_init((rb_tree_t *)(v7 + 56), (const rb_tree_ops_t *)NEFlowDirectorCreateInternal_rb_ops);
  if (a2)
  {
    *((_QWORD *)v7 + 1) = a2;
    dispatch_retain(a2);
  }
  v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  initially_inactive = dispatch_queue_attr_make_initially_inactive(v8);
  v10 = dispatch_queue_attr_make_with_qos_class(initially_inactive, QOS_CLASS_USER_INTERACTIVE, 0);
  v11 = dispatch_queue_create("flow director queue", v10);
  *((_QWORD *)v7 + 2) = v11;
  if (a3)
  {
    nw_queue_context_target_dispatch_queue();
    *(_QWORD *)v7 = nw_retain((void *)a3);
    v11 = *((_QWORD *)v7 + 2);
  }
  dispatch_set_context(v11, v7);
  dispatch_set_finalizer_f(*((dispatch_object_t *)v7 + 2), (dispatch_function_t)flow_director_deallocate);
  dispatch_activate(*((dispatch_object_t *)v7 + 2));
  *((_QWORD *)v7 + 3) = flow_director_create_io_handler((uint64_t)v7, a1);
  v17 = 32;
  memset(buf, 0, sizeof(buf));
  v12 = getpeername(a1, buf, &v17);
  v13 = *(_DWORD *)&buf[0].sa_data[6];
  if (v12)
    v13 = 0;
  *((_DWORD *)v7 + 8) = v13;
  flow_director_reset_default_interface_info((uint64_t)v7, "lo0");
  NEFlowDirectorSetMaxSendSize((uint64_t)v7, 0x100000uLL);
  NEFlowDirectorSetMaxReceiveSize((uint64_t)v7, 0x200000uLL);
  return v7;
}

void flow_director_deallocate(void *a1)
{
  NSObject *v2;
  _DWORD v3[2];
  __int16 v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = ne_log_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3[0] = 67109378;
    v3[1] = dword_25453C118;
    v4 = 2080;
    v5 = "Deallocated flow director";
    _os_log_debug_impl(&dword_208439000, v2, OS_LOG_TYPE_DEBUG, "(%u): %s", (uint8_t *)v3, 0x12u);
  }
  CFAllocatorDeallocate((CFAllocatorRef)*MEMORY[0x24BDBD240], a1);
}

NSObject *flow_director_create_io_handler(uint64_t a1, int a2)
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  int v9;
  int v10;
  NSObject *v11;
  _QWORD aBlock[5];
  _QWORD v14[5];
  unint64_t v15;
  uint64_t handler;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  NSObject *v20;
  unint64_t v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = MEMORY[0x24BDAC760];
  v4 = *(NSObject **)(a1 + 16);
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 0x40000000;
  aBlock[2] = __flow_director_create_io_handler_block_invoke;
  aBlock[3] = &__block_descriptor_tmp_122;
  aBlock[4] = a1;
  v5 = _Block_copy(aBlock);
  v6 = dispatch_source_create(MEMORY[0x24BDACA00], a2, 0, v4);
  v7 = fcntl(a2, 3);
  LODWORD(v8) = v7 | 4;
  if (v7 >= 0)
    v8 = v8;
  else
    v8 = 4;
  fcntl(a2, 4, v8);
  v15 = v4 | 0xBAACCAAB00000000;
  v9 = change_fdguard_np();
  if (v9)
  {
    v10 = v9;
    v11 = ne_log_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LODWORD(handler) = 67109376;
      HIDWORD(handler) = a2;
      LOWORD(v17) = 1024;
      *(_DWORD *)((char *)&v17 + 2) = v10;
      _os_log_error_impl(&dword_208439000, v11, OS_LOG_TYPE_ERROR, "Unable to guard control socket fd %d (%d)", (uint8_t *)&handler, 0xEu);
    }
  }
  dispatch_set_context(v6, v5);
  handler = v3;
  v17 = 0x40000000;
  v18 = __flow_director_create_ctl_source_block_invoke;
  v19 = &__block_descriptor_tmp_123;
  v22 = a2;
  v20 = v6;
  v21 = v15;
  dispatch_source_set_cancel_handler(v6, &handler);
  v14[0] = v3;
  v14[1] = 0x40000000;
  v14[2] = __flow_director_create_ctl_source_block_invoke_2;
  v14[3] = &__block_descriptor_tmp_124;
  v14[4] = v6;
  dispatch_source_set_event_handler(v6, v14);
  return v6;
}

uint64_t flow_director_reset_default_interface_info(uint64_t a1, const char *a2)
{
  const __CFString *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  uint64_t result;

  v4 = (const __CFString *)NECopyInterfaceAddress(a2, 2);
  if (v4)
  {
    v5 = v4;
    v6 = NECreateAddressStructFromString(v4, 0, 0);
    CFRelease(v5);
    v7 = *(void **)(a1 + 160);
    if (v7)
      free(v7);
    *(_QWORD *)(a1 + 160) = v6;
  }
  v8 = (const __CFString *)NECopyInterfaceAddress(a2, 30);
  if (v8)
  {
    v9 = v8;
    v10 = NECreateAddressStructFromString(v8, 0, 0);
    CFRelease(v9);
    v11 = *(void **)(a1 + 168);
    if (v11)
      free(v11);
    *(_QWORD *)(a1 + 168) = v10;
  }
  result = if_nametoindex(a2);
  *(_DWORD *)(a1 + 176) = result;
  return result;
}

void NEFlowDirectorSetMaxSendSize(uint64_t a1, unint64_t a2)
{
  unint64_t v3;
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  int handle;
  int v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  int *v15;
  char *v16;
  NSObject *v17;
  int v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  unint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v18 = a2;
  v3 = a2 - 8;
  if (a2 <= 8)
  {
    v4 = ne_log_obj();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      return;
    *(_DWORD *)buf = 67109632;
    v20 = dword_25453C118;
    v21 = 2048;
    v22 = a2;
    v23 = 2048;
    v24 = 8;
    v5 = "(%u): Cannot set the maximum send size (%lu) to less than %lu";
    v6 = v4;
    v7 = 28;
LABEL_10:
    _os_log_error_impl(&dword_208439000, v6, OS_LOG_TYPE_ERROR, v5, buf, v7);
    return;
  }
  handle = dispatch_source_get_handle(*(dispatch_source_t *)(a1 + 24));
  v10 = handle;
  if (handle <= 0)
  {
    v17 = ne_log_obj();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      return;
    *(_DWORD *)buf = 67109376;
    v20 = dword_25453C118;
    v21 = 1024;
    LODWORD(v22) = v10;
    v5 = "(%u): Did not get a valid control socket from the dispatch source: %d";
    v6 = v17;
    v7 = 14;
    goto LABEL_10;
  }
  v11 = setsockopt(handle, 0xFFFF, 4097, &v18, 4u);
  v12 = ne_log_obj();
  v13 = v12;
  if (v11)
  {
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      return;
    v14 = dword_25453C118;
    v15 = __error();
    v16 = strerror(*v15);
    *(_DWORD *)buf = 67109378;
    v20 = v14;
    v21 = 2080;
    v22 = (unint64_t)v16;
    v5 = "(%u): Failed to set SO_SNDBUF on the control socket: %s";
    v6 = v13;
    v7 = 18;
    goto LABEL_10;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    v20 = dword_25453C118;
    v21 = 2048;
    v22 = a2;
    _os_log_impl(&dword_208439000, v13, OS_LOG_TYPE_DEFAULT, "(%u): Set SO_SNDBUF on the control socket to %lu", buf, 0x12u);
  }
  *(_QWORD *)(a1 + 184) = v3;
}

void NEFlowDirectorSetMaxReceiveSize(uint64_t a1, unint64_t a2)
{
  unint64_t v3;
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  int handle;
  int v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  int *v15;
  char *v16;
  NSObject *v17;
  int v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  unint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v18 = a2;
  v3 = a2 - 8;
  if (a2 <= 8)
  {
    v4 = ne_log_obj();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      return;
    *(_DWORD *)buf = 67109632;
    v20 = dword_25453C118;
    v21 = 2048;
    v22 = a2;
    v23 = 2048;
    v24 = 8;
    v5 = "(%u): Cannot set the maximum receive size (%lu) to less than %lu";
    v6 = v4;
    v7 = 28;
LABEL_10:
    _os_log_error_impl(&dword_208439000, v6, OS_LOG_TYPE_ERROR, v5, buf, v7);
    return;
  }
  handle = dispatch_source_get_handle(*(dispatch_source_t *)(a1 + 24));
  v10 = handle;
  if (handle <= 0)
  {
    v17 = ne_log_obj();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      return;
    *(_DWORD *)buf = 67109376;
    v20 = dword_25453C118;
    v21 = 1024;
    LODWORD(v22) = v10;
    v5 = "(%u): Did not get a valid control socket from the dispatch source: %d";
    v6 = v17;
    v7 = 14;
    goto LABEL_10;
  }
  v11 = setsockopt(handle, 0xFFFF, 4098, &v18, 4u);
  v12 = ne_log_obj();
  v13 = v12;
  if (v11)
  {
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      return;
    v14 = dword_25453C118;
    v15 = __error();
    v16 = strerror(*v15);
    *(_DWORD *)buf = 67109378;
    v20 = v14;
    v21 = 2080;
    v22 = (unint64_t)v16;
    v5 = "(%u): Failed to set SO_RCVBUF on the control socket: %s";
    v6 = v13;
    v7 = 18;
    goto LABEL_10;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    v20 = dword_25453C118;
    v21 = 2048;
    v22 = a2;
    _os_log_impl(&dword_208439000, v13, OS_LOG_TYPE_DEFAULT, "(%u): Set SO_RCVBUF on the control socket to %lu", buf, 0x12u);
  }
  *(_QWORD *)(a1 + 192) = v3;
}

void __flow_director_create_io_handler_block_invoke(uint64_t a1, uint64_t a2, int a3, unsigned __int8 *a4, unint64_t a5)
{
  uint64_t v6;
  const char *v7;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  NSObject *v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  uint64_t v20;
  unint64_t v21;
  __CFArray *Mutable;
  NSObject *v23;
  os_unfair_lock_s *v24;
  os_unfair_lock_s *v25;
  int v26;
  uint64_t v27;
  unsigned int v28;
  NSObject *v29;
  NSObject *v30;
  unsigned __int8 *v31;
  int v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unsigned __int8 *v36;
  NSObject *v37;
  uint8_t *v38;
  NSObject *v39;
  const char *v40;
  NSObject *v41;
  __int128 v42;
  void *node;
  CFDictionaryRef v44;
  NSObject *v45;
  unint64_t v46;
  NSObject *v47;
  const __CFAllocator *v48;
  CFDataRef v49;
  CFStringRef v50;
  CFDataRef v51;
  CFStringRef v52;
  CFStringRef v53;
  NSObject *v54;
  const char *v55;
  unsigned __int8 *v56;
  int v57;
  unsigned int v58;
  size_t v59;
  uint64_t v60;
  const UInt8 *v61;
  BOOL v62;
  uint64_t v63;
  NSObject *v64;
  NSObject *v65;
  CFDataRef v66;
  CFTypeID TypeID;
  CFStringRef v68;
  CFTypeID v69;
  const __CFData *v70;
  unsigned int v71;
  BOOL v72;
  char v74;
  unsigned int v75;
  NSObject *v76;
  CFDataRef v77;
  CFDataRef v78;
  uint32_t os_unfair_lock_opaque;
  char *v80;
  BOOL v81;
  CFDataRef v83;
  int v84;
  _BOOL4 v85;
  int v86;
  uint64_t v87;
  CFDataRef v88;
  const __CFData *v89;
  NSObject *v90;
  uint64_t Instance;
  uint64_t v92;
  NSObject *v93;
  int v94;
  uint64_t v95;
  uint64_t v96;
  char v97;
  CFDataRef v98;
  int v99;
  unsigned __int16 v100;
  UInt8 v101;
  int v102;
  uint64_t v103;
  int v104;
  CFStringRef v105;
  CFStringRef v106;
  CFDataRef v107;
  CFDataRef v108;
  CFDataRef v109;
  CFDataRef v110;
  CFDataRef cf;
  CFDataRef v112;
  CFDataRef v113;
  unsigned int v114;
  unsigned int v115;
  uint8_t dst[8];
  _BYTE v117[12];
  __int16 v118;
  CFStringRef v119;
  __int16 v120;
  int v121;
  __int16 v122;
  CFStringRef v123;
  UInt8 bytes[32];
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  uint8_t buf[48];
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  uint64_t v137;

  v137 = *MEMORY[0x24BDAC8D0];
  v114 = 0;
  v6 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v6 + 40) == a2)
    v7 = "data";
  else
    v7 = "control";
  if (!a4 || !a5)
  {
    v14 = ne_log_obj();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = dword_25453C118;
      *(_WORD *)&buf[8] = 2080;
      *(_QWORD *)&buf[10] = v7;
      v11 = "(%u): %s: aborting director due to EOF";
      v12 = v14;
      v13 = 18;
      goto LABEL_26;
    }
LABEL_10:
    flow_director_abort(*(_QWORD *)(a1 + 32), 0);
    return;
  }
  if (a3)
  {
    v10 = ne_log_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&buf[4] = dword_25453C118;
      *(_WORD *)&buf[8] = 2080;
      *(_QWORD *)&buf[10] = v7;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = strerror(a3);
      v11 = "(%u): %s: aborting director due to read error: %s";
      v12 = v10;
      v13 = 28;
LABEL_26:
      _os_log_error_impl(&dword_208439000, v12, OS_LOG_TYPE_ERROR, v11, buf, v13);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if (a5 <= 7)
  {
    v15 = ne_log_obj();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      return;
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)&buf[4] = dword_25453C118;
    *(_WORD *)&buf[8] = 2080;
    *(_QWORD *)&buf[10] = v7;
    *(_WORD *)&buf[18] = 2048;
    *(_QWORD *)&buf[20] = a5;
    v16 = "(%u): %s: received a message that is too short (%zu)";
    v17 = v15;
    v18 = 28;
    goto LABEL_15;
  }
  v114 = bswap32(*((_DWORD *)a4 + 1));
  if (*a4 == 11)
  {
    v20 = *(_QWORD *)(v6 + 152);
    *(_QWORD *)(v6 + 152) = 0;
    if (v20)
    {
      v21 = a5 - 8;
      Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
      if (v21 < 5)
      {
LABEL_19:
        v23 = *(NSObject **)(v6 + 8);
        *(_QWORD *)buf = MEMORY[0x24BDAC760];
        *(_QWORD *)&buf[8] = 0x40000000;
        *(_QWORD *)&buf[16] = __flow_director_handle_flow_states_block_invoke;
        *(_QWORD *)&buf[24] = &unk_24C0A0298;
        *(_QWORD *)&buf[32] = v20;
        *(_QWORD *)&buf[40] = Mutable;
        dispatch_async(v23, buf);
        return;
      }
      v31 = a4 + 8;
      while (1)
      {
        v32 = *v31;
        v33 = *(_DWORD *)(v31 + 1);
        v34 = bswap32(v33);
        if (v33)
        {
          v35 = v34 + 5;
          if (v34 + 5 > v21)
            goto LABEL_19;
          v36 = v31 + 5;
        }
        else
        {
          v36 = 0;
          v35 = 5;
        }
        if (v32 == 39)
        {
          memset(buf, 0, 40);
          if (v34 > 0x27)
          {
            v42 = *((_OWORD *)v36 + 1);
            *(_OWORD *)buf = *(_OWORD *)v36;
            *(_OWORD *)&buf[16] = v42;
            *(_QWORD *)&buf[32] = *((_QWORD *)v36 + 4);
            node = rb_tree_find_node((rb_tree_t *)(v6 + 56), buf);
            if (node)
            {
              v44 = NEFlowCopyStateDictionary((uint64_t)node, (uint64_t)buf);
              CFArrayAppendValue(Mutable, v44);
              CFRelease(v44);
              goto LABEL_47;
            }
            v45 = ne_log_obj();
            if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
              goto LABEL_47;
            *(_DWORD *)bytes = 67109376;
            *(_DWORD *)&bytes[4] = dword_25453C118;
            *(_WORD *)&bytes[8] = 1024;
            *(_DWORD *)&bytes[10] = *(_DWORD *)buf;
            v38 = bytes;
            v39 = v45;
            v40 = "(%u): Cannot find flow with ID from flow state (%u)";
            goto LABEL_43;
          }
          v37 = ne_log_obj();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)bytes = 67109376;
            *(_DWORD *)&bytes[4] = dword_25453C118;
            *(_WORD *)&bytes[8] = 1024;
            *(_DWORD *)&bytes[10] = v34;
            v38 = bytes;
            v39 = v37;
            v40 = "(%u): Got a flow state TLV with an invalid length: %u";
LABEL_43:
            _os_log_error_impl(&dword_208439000, v39, OS_LOG_TYPE_ERROR, v40, v38, 0xEu);
          }
        }
        else
        {
          v41 = ne_log_obj();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)&buf[4] = dword_25453C118;
            *(_WORD *)&buf[8] = 1024;
            *(_DWORD *)&buf[10] = v32;
            v38 = buf;
            v39 = v41;
            v40 = "(%u): Got a non-state TLV: %u";
            goto LABEL_43;
          }
        }
LABEL_47:
        v31 += v35;
        v21 -= v35;
        if (v21 <= 4)
          goto LABEL_19;
      }
    }
    v30 = ne_log_obj();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      return;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = dword_25453C118;
    v16 = "(%u): Got flow states, but no callback is available";
    v17 = v30;
    v18 = 8;
LABEL_15:
    _os_log_error_impl(&dword_208439000, v17, OS_LOG_TYPE_ERROR, v16, buf, v18);
    return;
  }
  v24 = (os_unfair_lock_s *)rb_tree_find_node((rb_tree_t *)(v6 + 56), &v114);
  v25 = v24;
  v26 = *a4;
  if (v26 != 1)
  {
    if (v24)
    {
      switch(*a4)
      {
        case 2u:
          flow_director_handle_connect_result(*(_QWORD *)(a1 + 32), (uint64_t)v24, a5 - 8, a4 + 8);
          break;
        case 3u:
          flow_director_handle_data(*(_QWORD *)(a1 + 32), (uint64_t)v24, a5 - 8, a4 + 8);
          break;
        case 4u:
          flow_director_handle_close((uint64_t)v24, a5 - 8, a4 + 8);
          break;
        case 5u:
          flow_director_handle_read_notification(v24);
          break;
        default:
          return;
      }
      return;
    }
    if ((v26 & 0xFE) != 2)
      return;
    v54 = ne_log_obj();
    if (!os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      return;
    if (*a4 - 1 > 6)
      v55 = "unknwon";
    else
      v55 = off_24C0A05B0[(*a4 - 1)];
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)&buf[4] = dword_25453C118;
    *(_WORD *)&buf[8] = 2080;
    *(_QWORD *)&buf[10] = v7;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = v55;
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = v114;
    v16 = "(%u): %s: Recevied a %s message for flow %u, but the flow cannot be found";
    v17 = v54;
    v18 = 34;
    goto LABEL_15;
  }
  v27 = *(_QWORD *)(a1 + 32);
  v28 = v114;
  v135 = 0u;
  v136 = 0u;
  v133 = 0u;
  v134 = 0u;
  v132 = 0u;
  memset(buf, 0, sizeof(buf));
  v115 = 0;
  v129 = 0u;
  v130 = 0u;
  v128 = 0u;
  v126 = 0u;
  v127 = 0u;
  v125 = 0u;
  memset(bytes, 0, sizeof(bytes));
  if (v24)
  {
    v29 = ne_log_obj();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      os_unfair_lock_opaque = v25[6]._os_unfair_lock_opaque;
      v80 = strerror(37);
      *(_DWORD *)dst = 67109378;
      *(_DWORD *)&dst[4] = os_unfair_lock_opaque;
      *(_WORD *)v117 = 2080;
      *(_QWORD *)&v117[2] = v80;
      _os_log_error_impl(&dword_208439000, v29, OS_LOG_TYPE_ERROR, "(%u): Sending error connect result: %s", dst, 0x12u);
    }
    flow_director_send_connect_result(v27, v28, 0x25u, 0, 0, 0, 0, 0, 0);
    return;
  }
  v46 = a5 - 8;
  v135 = 0uLL;
  v136 = 0uLL;
  v133 = 0uLL;
  v134 = 0uLL;
  v132 = 0uLL;
  memset(buf, 0, sizeof(buf));
  bytes[1] = 0;
  v47 = ne_log_obj();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)dst = 67109376;
    *(_DWORD *)&dst[4] = dword_25453C118;
    *(_WORD *)v117 = 1024;
    *(_DWORD *)&v117[2] = v28;
    _os_log_impl(&dword_208439000, v47, OS_LOG_TYPE_DEFAULT, "(%u): Flow %u is connecting", dst, 0xEu);
  }
  v48 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  if (v46 < 5)
  {
    v109 = 0;
    v110 = 0;
    v49 = 0;
    v50 = 0;
    v51 = 0;
    cf = 0;
    v102 = 0;
    v52 = 0;
    v53 = 0;
    v104 = 0;
    v100 = 0;
    v101 = 5;
    v103 = 1;
    goto LABEL_130;
  }
  v96 = v27;
  v98 = 0;
  v109 = 0;
  v110 = 0;
  v105 = 0;
  v107 = 0;
  cf = 0;
  v102 = 0;
  v52 = 0;
  v53 = 0;
  v112 = 0;
  v104 = 0;
  v100 = 0;
  v56 = a4 + 8;
  v101 = 5;
  v103 = 1;
  do
  {
    v57 = *v56;
    v58 = *(_DWORD *)(v56 + 1);
    v59 = bswap32(v58);
    if (v58)
    {
      v60 = v59 + 5;
      if (v59 + 5 > v46)
        break;
      v61 = v56 + 5;
    }
    else
    {
      v61 = 0;
      v60 = 5;
    }
    v62 = v57 == 21 && v52 == 0;
    if (v62)
    {
      v52 = CFStringCreateWithBytes(v48, v61, v59, 0x8000100u, 0);
      goto LABEL_73;
    }
    if (v57 == 11 || v57 == 23 || v57 == 22)
    {
      __memcpy_chk();
      goto LABEL_73;
    }
    if (v57 == 24 && !v112)
    {
      v112 = CFDataCreate(v48, v61, v59);
      goto LABEL_73;
    }
    if (v57 == 25 && !v53)
    {
      v53 = CFStringCreateWithBytes(v48, v61, v59, 0x8000100u, 0);
      goto LABEL_73;
    }
    switch(*v56)
    {
      case 0x1Du:
        if (v58 == 0x4000000)
        {
          *(_DWORD *)dst = 0;
          __memcpy_chk();
          v102 |= *(_DWORD *)dst;
        }
        break;
      case 0x1Eu:
        if (v58 != 0x4000000)
          break;
        *(_DWORD *)dst = 0;
        __memcpy_chk();
        v63 = *(unsigned int *)dst;
        if (*(_DWORD *)dst != 1)
        {
          if (*(_DWORD *)dst != 3)
            break;
          v63 = 2;
        }
        v103 = v63;
        break;
      case 0x1Fu:
        if (cf)
          CFRelease(cf);
        cf = CFDataCreate(v48, v61, v59);
        break;
      case 0x20u:
        if (v107)
          CFRelease(v107);
        if (v58 == 0x20000000)
        {
          v107 = CFDataCreate(v48, v61, 32);
        }
        else
        {
          v64 = ne_log_obj();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)dst = 67109376;
            *(_DWORD *)&dst[4] = MEMORY[0x18];
            *(_WORD *)v117 = 1024;
            *(_DWORD *)&v117[2] = v59;
            _os_log_error_impl(&dword_208439000, v64, OS_LOG_TYPE_ERROR, "(%u): Invalid App audit token tlv length: %d", dst, 0xEu);
          }
        }
        break;
      default:
        if (v57 == 20)
        {
          if (v58 == 0x1000000)
            v101 = *v61;
        }
        else if (v57 == 14)
        {
          if (v58 == 0x2000000)
            v100 = *(_WORD *)v61;
        }
        else if (v57 != 33 || v105)
        {
          if (v57 != 34 || v98)
          {
            if (v57 != 35 || v110)
            {
              if (v57 != 36 || v109)
              {
                if (v57 == 13 && !v104 && v58 == 0x4000000)
                  v104 = *(_DWORD *)v61;
              }
              else if (v59 > 0x10)
              {
                v109 = 0;
              }
              else
              {
                *(_QWORD *)dst = 0;
                *(_QWORD *)v117 = 0;
                if (v58 == 0x10000000)
                {
                  uuid_copy(dst, v61);
                }
                else
                {
                  uuid_copy(dst, g_cfil_flow_uuid_template);
                  memcpy(&dst[-v59 + 16], v61, v59);
                }
                v109 = CFDataCreate(v48, dst, 16);
              }
            }
            else if (v58 == 0x20000000)
            {
              v110 = CFDataCreate(v48, v61, 32);
            }
            else
            {
              v65 = ne_log_obj();
              if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)dst = 67109376;
                *(_DWORD *)&dst[4] = MEMORY[0x18];
                *(_WORD *)v117 = 1024;
                *(_DWORD *)&v117[2] = v59;
                _os_log_error_impl(&dword_208439000, v65, OS_LOG_TYPE_ERROR, "(%u): Invalid real audit token tlv length: %d", dst, 0xEu);
              }
              v110 = 0;
            }
          }
          else
          {
            v98 = CFDataCreate(v48, v61, v59);
          }
        }
        else
        {
          v105 = CFStringCreateWithBytes(v48, v61, v59, 0x8000100u, 0);
        }
        break;
    }
LABEL_73:
    v56 += v60;
    v46 -= v60;
  }
  while (v46 > 4);
  v27 = v96;
  v49 = v98;
  v50 = v105;
  v51 = v107;
  v66 = v112;
  if (!v112)
LABEL_130:
    v66 = CFDataCreate(v48, 0, 0);
  v113 = v66;
  if (!v53)
    v53 = &stru_24C0A1CF8;
  if (!v115
    || ((TypeID = CFStringGetTypeID(), !v52) ? (v68 = 0) : CFGetTypeID(v52) != TypeID ? (v68 = 0) : (v68 = v52),
        !v68 && !buf[1] || (v69 = CFStringGetTypeID(), CFGetTypeID(v53) != v69)))
  {
    v76 = ne_log_obj();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)dst = 67110402;
      *(_DWORD *)&dst[4] = dword_25453C118;
      *(_WORD *)v117 = 1024;
      *(_DWORD *)&v117[2] = v28;
      *(_WORD *)&v117[6] = 1024;
      *(_DWORD *)&v117[8] = v115;
      v118 = 2112;
      v119 = v52;
      v120 = 1024;
      v121 = buf[1];
      v122 = 2112;
      v123 = v53;
      _os_log_error_impl(&dword_208439000, v76, OS_LOG_TYPE_ERROR, "(%u): Flow properties are incomplete for flow %u, port = %d, dest_name = %@, target_addr family = %d, app_signing_id = %@", dst, 0x2Eu);
    }
    flow_director_send_connect_result(v27, v28, 0x16u, 0, 0, 0, 0, 0, 0);
    v78 = v110;
    v77 = cf;
    goto LABEL_161;
  }
  v106 = v50;
  v70 = v49;
  if (!buf[1])
  {
    buf[1] = 2;
    v71 = v115;
    if (*(_BYTE *)(v27 + 122))
      v81 = v115 == 53;
    else
      v81 = 0;
    v74 = v81 && v103 == 2;
LABEL_186:
    v97 = v74;
    *(_WORD *)&buf[2] = bswap32(v71) >> 16;
    v75 = 16;
LABEL_187:
    buf[0] = v75;
    goto LABEL_189;
  }
  v71 = v115;
  if (*(_BYTE *)(v27 + 122))
    v72 = v115 == 53;
  else
    v72 = 0;
  v74 = v72 && v103 == 2;
  if (buf[1] == 2)
    goto LABEL_186;
  v97 = v74;
  if (buf[1] == 30)
  {
    *(_WORD *)&buf[2] = bswap32(v115) >> 16;
    v75 = 28;
    goto LABEL_187;
  }
  v75 = buf[0];
LABEL_189:
  v83 = CFDataCreate(v48, buf, v75);
  v84 = bytes[1];
  if (!bytes[1])
  {
    v84 = buf[1];
    bytes[1] = buf[1];
    bytes[0] = buf[0];
  }
  v108 = v51;
  v85 = NEIsWildcardAddress(bytes);
  v86 = 16;
  if (!v85)
  {
    if (v84)
    {
LABEL_199:
      v49 = v70;
      goto LABEL_200;
    }
LABEL_201:
    v99 = 16;
    v88 = 0;
    v49 = v70;
    goto LABEL_202;
  }
  if (!v84)
    goto LABEL_201;
  if (v84 == 30)
  {
    v95 = *(_QWORD *)(v27 + 168);
    if (v95)
    {
      *(_OWORD *)&bytes[8] = *(_OWORD *)(v95 + 8);
      v86 = 80;
    }
    else
    {
      v86 = 16;
    }
    goto LABEL_199;
  }
  v62 = v84 == 2;
  v49 = v70;
  if (v62)
  {
    v87 = *(_QWORD *)(v27 + 160);
    if (v87)
    {
      *(_DWORD *)&bytes[4] = *(_DWORD *)(v87 + 4);
      v86 = 80;
    }
    else
    {
      v86 = 16;
    }
  }
LABEL_200:
  v99 = v86;
  v88 = CFDataCreate(v48, bytes, bytes[0]);
LABEL_202:
  if (v104)
  {
    v89 = v83;
    v90 = ne_log_obj();
    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)dst = 67109632;
      *(_DWORD *)&dst[4] = dword_25453C118;
      *(_WORD *)v117 = 1024;
      *(_DWORD *)&v117[2] = v28;
      *(_WORD *)&v117[6] = 1024;
      *(_DWORD *)&v117[8] = v104;
      _os_log_debug_impl(&dword_208439000, v90, OS_LOG_TYPE_DEBUG, "(%u): Kernel set interface index for flow %u to %u", dst, 0x14u);
    }
    v83 = v89;
  }
  else
  {
    v104 = *(_DWORD *)(v27 + 176);
  }
  if (runtime_inited != -1)
    dispatch_once(&runtime_inited, &__block_literal_global_129);
  Instance = _CFRuntimeCreateInstance();
  v92 = Instance;
  if (Instance)
  {
    *(_QWORD *)(Instance + 16) = v103;
    *(_DWORD *)(Instance + 24) = v28;
    *(_QWORD *)(Instance + 40) = v27;
    *(_QWORD *)(Instance + 48) = v83;
    if (v83)
      CFRetain(v83);
    *(_QWORD *)(v92 + 64) = v52;
    if (v52)
      CFRetain(v52);
    *(_QWORD *)(v92 + 56) = v88;
    if (v88)
      CFRetain(v88);
    *(_QWORD *)(v92 + 280) = 0x4000000000000;
    *(_QWORD *)(v92 + 32) = 0;
    *(_DWORD *)(v92 + 100) = 0;
    *(_DWORD *)(v92 + 104) = 0;
    *(_QWORD *)(v92 + 112) = MEMORY[0x24BDAC990];
    *(_DWORD *)(v92 + 120) = 0;
    *(_QWORD *)(v92 + 80) = v53;
    CFRetain(v53);
    *(_QWORD *)(v92 + 88) = v113;
    if (v113)
      CFRetain(v113);
    *(_OWORD *)(v92 + 176) = 0u;
    *(_OWORD *)(v92 + 192) = 0u;
    *(_OWORD *)(v92 + 144) = 0u;
    *(_OWORD *)(v92 + 160) = 0u;
    *(_DWORD *)(v92 + 96) = v100;
    *(_BYTE *)(v92 + 108) = v101;
    *(_BYTE *)(v92 + 320) = 0;
    *(_QWORD *)(v92 + 264) = 0;
    *(_QWORD *)(v92 + 272) = v92 + 264;
    *(_QWORD *)(v92 + 304) = 0;
    *(_QWORD *)(v92 + 312) = v92 + 304;
    *(_DWORD *)(v92 + 344) = v102;
    *(_QWORD *)(v92 + 352) = cf;
    if (cf)
      CFRetain(cf);
    *(_QWORD *)(v92 + 360) = v108;
    v49 = v70;
    if (v108)
      CFRetain(v108);
    *(_QWORD *)(v92 + 368) = v106;
    if (v106)
      CFRetain(v106);
    *(_QWORD *)(v92 + 376) = v70;
    if (v70)
      CFRetain(v70);
    *(_QWORD *)(v92 + 384) = v110;
    if (v110)
      CFRetain(v110);
    *(_QWORD *)(v92 + 392) = v109;
    if (v109)
      CFRetain(v109);
    *(_DWORD *)(v92 + 400) = v104;
    *(_BYTE *)(v92 + 432) = v97;
  }
  CFRelease(v83);
  if (v88)
    CFRelease(v88);
  v77 = cf;
  if (!v92)
    __assert_rtn("flow_director_handle_connect", "NEFlow.c", 3014, "new_flow != NULL");
  v50 = v106;
  if (rb_tree_insert_node((rb_tree_t *)(v27 + 56), (void *)v92) != (void *)v92)
    __assert_rtn("flow_director_handle_connect", "NEFlow.c", 3015, "rb_tree_insert_node(&director->flow_tree, new_flow) == new_flow");
  *(_DWORD *)(v92 + 100) = v99;
  v93 = ne_log_obj();
  v78 = v110;
  if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
  {
    v94 = *(_DWORD *)(v92 + 24);
    *(_DWORD *)dst = 67109378;
    *(_DWORD *)&dst[4] = v94;
    *(_WORD *)v117 = 2112;
    *(_QWORD *)&v117[2] = v92;
    _os_log_impl(&dword_208439000, v93, OS_LOG_TYPE_DEFAULT, "(%u): New flow: %@", dst, 0x12u);
  }
  os_unfair_lock_lock((os_unfair_lock_t)(v92 + 120));
  flow_startup(v92, v27, 0);
  os_unfair_lock_unlock((os_unfair_lock_t)(v92 + 120));
  v51 = v108;
LABEL_161:
  if (v52)
    CFRelease(v52);
  if (v113)
    CFRelease(v113);
  CFRelease(v53);
  if (v77)
    CFRelease(v77);
  if (v51)
    CFRelease(v51);
  if (v50)
    CFRelease(v50);
  if (v49)
    CFRelease(v49);
  if (v78)
    CFRelease(v78);
  if (v109)
    CFRelease(v109);
}

void __flow_director_create_ctl_source_block_invoke(uint64_t a1)
{
  void *context;

  context = dispatch_get_context(*(dispatch_object_t *)(a1 + 32));
  if (context)
  {
    _Block_release(context);
    dispatch_set_context(*(dispatch_object_t *)(a1 + 32), 0);
  }
  guarded_close_np();
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
}

int *__flow_director_create_ctl_source_block_invoke_2()
{
  return flow_director_ctl_source_do_read();
}

int *flow_director_ctl_source_do_read()
{
  NSObject *v0;
  int handle;
  void *context;
  void *i;
  ssize_t v4;
  uint64_t v5;
  int *result;
  NSObject *v7;
  msghdr v8;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  const char *v12;
  _QWORD v13[2];
  _BYTE v14[66624];
  uint64_t v15;

  v0 = MEMORY[0x24BDAC7A8]();
  v15 = *MEMORY[0x24BDAC8D0];
  v13[0] = v14;
  v13[1] = 66624;
  *(_OWORD *)&v8.msg_control = 0u;
  *(_OWORD *)&v8.msg_name = 0u;
  v8.msg_iov = (iovec *)v13;
  *(_QWORD *)&v8.msg_iovlen = 1;
  handle = dispatch_source_get_handle(v0);
  context = dispatch_get_context(v0);
  if (!context)
    __assert_rtn("flow_director_ctl_source_do_read", "NEFlow.c", 3438, "saved_handler != NULL");
  for (i = context; ; (*((void (**)(void *, NSObject *, _QWORD, _BYTE *, ssize_t))i + 2))(i, v0, 0, v14, v4))
  {
    bzero(v14, 0x10440uLL);
    v4 = recvmsg(handle, &v8, 0);
    if (!v4)
    {
      v5 = 0;
      return (int *)(*((uint64_t (**)(void *, NSObject *, uint64_t, _QWORD, _QWORD))i + 2))(i, v0, v5, 0, 0);
    }
    if (v4 < 0)
      break;
    if ((v8.msg_flags & 8) == 0)
    {
      v7 = ne_log_obj();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
LABEL_14:
        v5 = 22;
        return (int *)(*((uint64_t (**)(void *, NSObject *, uint64_t, _QWORD, _QWORD))i + 2))(i, v0, v5, 0, 0);
      }
      *(_DWORD *)buf = 67109378;
      v10 = dword_25453C118;
      v11 = 2080;
      v12 = "Failed to read an entire packet";
LABEL_18:
      _os_log_error_impl(&dword_208439000, v7, OS_LOG_TYPE_ERROR, "(%u): %s", buf, 0x12u);
      goto LABEL_14;
    }
    if ((v8.msg_flags & 0x10) != 0)
    {
      v7 = ne_log_obj();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        goto LABEL_14;
      *(_DWORD *)buf = 67109378;
      v10 = dword_25453C118;
      v11 = 2080;
      v12 = "Message was too big for the read buffer";
      goto LABEL_18;
    }
  }
  result = __error();
  if (*result == 35)
    return result;
  v5 = *__error();
  return (int *)(*((uint64_t (**)(void *, NSObject *, uint64_t, _QWORD, _QWORD))i + 2))(i, v0, v5, 0, 0);
}

void __flow_director_handle_flow_states_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  CFRelease(*(CFTypeRef *)(a1 + 40));
  _Block_release(*(const void **)(a1 + 32));
}

void flow_startup(uint64_t a1, uint64_t a2, int a3)
{
  const os_unfair_lock *v6;
  const __CFData *v7;
  uint64_t v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  const __CFData *v12;
  const UInt8 *v13;
  int v14;
  uint64_t v15;
  const void *v16;
  int v17;
  const void *v18;
  const void *v19;
  NSObject *v20;
  NSObject *v21;
  _QWORD *v22;
  const UInt8 *BytePtr;
  int v24;
  uint64_t v25;
  int v26;
  NSObject *bridged_parameters;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t *v33;
  NSObject *v34;
  const char *v35;
  NSObject *v36;
  uint8_t *p_receive_handler;
  NSObject *v38;
  uint32_t v39;
  void *v40;
  void *v41;
  NSObject *host_with_numeric_port;
  NSObject *v43;
  NSObject *v44;
  uint64_t address;
  int v46;
  _QWORD block[6];
  _QWORD v48[9];
  int v49;
  _QWORD v50[3];
  CFTypeRef v51;
  uint64_t receive_handler;
  uint64_t v53;
  uint64_t v54;
  CFTypeRef v55;
  uint64_t v56;
  NSObject *v57;
  _BYTE state_changed_handler[24];
  void *v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v6 = (const os_unfair_lock *)(a1 + 120);
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 120));
  if (a3)
    goto LABEL_2;
  if (!*(_QWORD *)a2)
  {
    if ((*(_BYTE *)(a1 + 100) & 0x20) != 0 || !*(_QWORD *)(a2 + 136))
    {
      CFRetain((CFTypeRef)a1);
      dispatch_retain(*(dispatch_object_t *)(a2 + 16));
      v21 = *(NSObject **)(a2 + 8);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 0x40000000;
      block[2] = __flow_startup_block_invoke_154;
      block[3] = &__block_descriptor_tmp_161;
      block[4] = a2;
      block[5] = a1;
      v22 = block;
    }
    else
    {
      v15 = *(_QWORD *)(a1 + 80);
      v16 = *(const void **)(a1 + 360);
      if (!v15)
      {
        v36 = ne_log_obj();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)state_changed_handler = 134218240;
          *(_QWORD *)&state_changed_handler[4] = 0;
          *(_WORD *)&state_changed_handler[12] = 2048;
          *(_QWORD *)&state_changed_handler[14] = v16;
          v35 = "Signing identifier (%p) and/or audit token (%p) not available, rejecting flow";
          p_receive_handler = state_changed_handler;
          v38 = v36;
          v39 = 22;
LABEL_62:
          _os_log_error_impl(&dword_208439000, v38, OS_LOG_TYPE_ERROR, v35, p_receive_handler, v39);
          goto LABEL_2;
        }
        goto LABEL_2;
      }
      v17 = *(_DWORD *)(a1 + 24);
      v18 = *(const void **)(a1 + 368);
      v19 = *(const void **)(a1 + 384);
      CFRetain(*(CFTypeRef *)(a1 + 80));
      if (v16)
        CFRetain(v16);
      if (v18)
        CFRetain(v18);
      if (v19)
        CFRetain(v19);
      v20 = ne_log_obj();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        v46 = *(_DWORD *)(a1 + 24);
        *(_DWORD *)state_changed_handler = 67109378;
        *(_DWORD *)&state_changed_handler[4] = v46;
        *(_WORD *)&state_changed_handler[8] = 2112;
        *(_QWORD *)&state_changed_handler[10] = v15;
        _os_log_debug_impl(&dword_208439000, v20, OS_LOG_TYPE_DEBUG, "(%u): Requesting rule matching for %@", state_changed_handler, 0x12u);
      }
      dispatch_retain(*(dispatch_object_t *)(a2 + 16));
      v21 = *(NSObject **)(a2 + 8);
      v48[0] = MEMORY[0x24BDAC760];
      v48[1] = 0x40000000;
      v48[2] = __flow_startup_block_invoke;
      v48[3] = &__block_descriptor_tmp_153;
      v49 = v17;
      v48[4] = a2;
      v48[5] = v16;
      v48[6] = v15;
      v48[7] = v18;
      v48[8] = v19;
      v22 = v48;
    }
    dispatch_async(v21, v22);
    return;
  }
  if (*(_QWORD *)(a1 + 16) != 2)
    goto LABEL_8;
  os_unfair_lock_assert_owner(v6);
  v7 = *(const __CFData **)(a1 + 48);
  if (!v7)
    goto LABEL_36;
  if (*(_QWORD *)(a1 + 64))
    goto LABEL_8;
  BytePtr = CFDataGetBytePtr(v7);
  if (!BytePtr)
  {
LABEL_36:
    os_unfair_lock_assert_owner(v6);
    v25 = *(_QWORD *)a2;
    v26 = *(unsigned __int8 *)(a2 + 121);
    os_unfair_lock_assert_owner(v6);
    bridged_parameters = flow_create_bridged_parameters(a1, v25, v26);
    if (bridged_parameters)
    {
      v28 = bridged_parameters;
      v29 = nw_connection_group_create_with_parameters();
      nw_release(v28);
      if (v29)
      {
        *(_QWORD *)(a1 + 416) = v29;
        if (!*(_QWORD *)(a1 + 136))
        {
          v30 = *(NSObject **)(a2 + 16);
          *(_QWORD *)(a1 + 136) = v30;
          dispatch_retain(v30);
        }
        nw_connection_group_set_queue(v29, *(dispatch_queue_t *)(a2 + 16));
        v50[0] = 0;
        v50[1] = v50;
        v50[2] = 0x2000000000;
        v51 = 0;
        v51 = CFRetain((CFTypeRef)a1);
        v31 = MEMORY[0x24BDAC760];
        *(_QWORD *)state_changed_handler = MEMORY[0x24BDAC760];
        *(_QWORD *)&state_changed_handler[8] = 0x40000000;
        *(_QWORD *)&state_changed_handler[16] = __flow_setup_bridged_connection_group_block_invoke;
        v59 = &unk_24C0A0468;
        v60 = v50;
        v61 = a1;
        v62 = a2;
        nw_connection_group_set_state_changed_handler(v29, state_changed_handler);
        os_unfair_lock_assert_owner(v6);
        if ((*(_BYTE *)(a1 + 100) & 1) == 0)
        {
          v32 = *(NSObject **)(a1 + 416);
          if (v32)
          {
            receive_handler = v31;
            v53 = 0x40000000;
            v54 = (uint64_t)__flow_bridge_read_data_from_connection_group_block_invoke;
            v55 = &__block_descriptor_tmp_170;
            v56 = a1;
            v57 = v32;
            nw_connection_group_set_receive_handler(v32, 0xFFFFFFFF, 0, &receive_handler);
          }
        }
        nw_connection_group_start(v29);
        v33 = v50;
        goto LABEL_56;
      }
    }
    v34 = ne_log_obj();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      LOWORD(receive_handler) = 0;
      v35 = "Failed to create bridged connection group, rejecting flow";
LABEL_61:
      p_receive_handler = (uint8_t *)&receive_handler;
      v38 = v34;
      v39 = 2;
      goto LABEL_62;
    }
LABEL_2:
    flow_director_send_connect_result(a2, *(_DWORD *)(a1 + 24), 0x3Du, 0, 0, 0, 0, 0, 0);
    flow_drop_director((_QWORD *)a1);
    flow_cancel_bridged_connection(a1, 0);
    return;
  }
  v24 = BytePtr[1];
  if (v24 == 30)
  {
    if (*((_DWORD *)BytePtr + 2) || *((_DWORD *)BytePtr + 3) || *((_DWORD *)BytePtr + 4) || *((_DWORD *)BytePtr + 5))
      goto LABEL_8;
    goto LABEL_36;
  }
  if (v24 != 2 || !*((_DWORD *)BytePtr + 1))
    goto LABEL_36;
LABEL_8:
  os_unfair_lock_assert_owner(v6);
  v8 = *(_QWORD *)a2;
  v9 = *(unsigned __int8 *)(a2 + 121);
  os_unfair_lock_assert_owner(v6);
  v10 = flow_create_bridged_parameters(a1, v8, v9);
  if (!v10)
    goto LABEL_59;
  v11 = v10;
  os_unfair_lock_assert_owner(v6);
  v12 = *(const __CFData **)(a1 + 48);
  if (!v12)
    goto LABEL_50;
  v13 = CFDataGetBytePtr(v12);
  if (!v13)
    goto LABEL_50;
  v14 = v13[1];
  if (v14 != 30 && v14 != 2)
    goto LABEL_50;
  if (*(_QWORD *)(a1 + 64) && (*(_QWORD *)(a1 + 16) != 2 || *((_WORD *)v13 + 1) != 13568))
  {
    v40 = NECreateCStringFromCFString(*(const __CFString **)(a1 + 64));
    if (v40)
    {
      v41 = v40;
      host_with_numeric_port = nw_endpoint_create_host_with_numeric_port();
      free(v41);
      goto LABEL_65;
    }
LABEL_50:
    host_with_numeric_port = 0;
LABEL_51:
    v43 = 0;
    goto LABEL_52;
  }
  if (*(_BYTE *)(a1 + 432))
    address = nw_endpoint_create_host_with_numeric_port();
  else
    address = (uint64_t)nw_endpoint_create_address((const sockaddr *)v13);
  host_with_numeric_port = address;
LABEL_65:
  if (!host_with_numeric_port)
    goto LABEL_51;
  v43 = nw_connection_create(host_with_numeric_port, v11);
LABEL_52:
  nw_release(host_with_numeric_port);
  nw_release(v11);
  if (!v43)
  {
LABEL_59:
    v34 = ne_log_obj();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      LOWORD(receive_handler) = 0;
      v35 = "Failed to create bridged connection, rejecting flow";
      goto LABEL_61;
    }
    goto LABEL_2;
  }
  *(_QWORD *)(a1 + 408) = v43;
  if (!*(_QWORD *)(a1 + 136))
  {
    v44 = *(NSObject **)(a2 + 16);
    *(_QWORD *)(a1 + 136) = v44;
    dispatch_retain(v44);
  }
  nw_connection_set_queue(v43, *(dispatch_queue_t *)(a2 + 16));
  receive_handler = 0;
  v53 = (uint64_t)&receive_handler;
  v54 = 0x2000000000;
  v55 = 0;
  v55 = CFRetain((CFTypeRef)a1);
  *(_QWORD *)state_changed_handler = MEMORY[0x24BDAC760];
  *(_QWORD *)&state_changed_handler[8] = 0x40000000;
  *(_QWORD *)&state_changed_handler[16] = __flow_setup_bridged_connection_block_invoke;
  v59 = &unk_24C0A0518;
  v60 = &receive_handler;
  v61 = a1;
  v62 = a2;
  nw_connection_set_state_changed_handler(v43, state_changed_handler);
  nw_connection_start(v43);
  v33 = &receive_handler;
LABEL_56:
  _Block_object_dispose(v33, 8);
  if (*(_BYTE *)(a2 + 121))
  {
    if (!*(_QWORD *)(a1 + 128))
      *(_QWORD *)(a1 + 128) = os_transaction_create();
  }
}

void flow_director_handle_connect_result(uint64_t a1, uint64_t a2, unint64_t a3, unsigned __int8 *a4)
{
  unint64_t i;
  int v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v13;
  NSObject *v14;
  int v15;
  unsigned int v16;
  unsigned int v17;
  int v18;
  CFDataRef v19;
  const void *v20;
  int v21;
  CFIndex length[3];
  uint64_t v23;
  uint8_t buf[4];
  int v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v23 = 0;
  memset(length, 0, sizeof(length));
  if (a3 >= 5)
  {
    for (i = a3; i > 4; i -= v11)
    {
      v8 = *a4;
      v9 = *(_DWORD *)(a4 + 1);
      v10 = bswap32(v9);
      if (v9)
      {
        v11 = v10 + 5;
        if (v10 + 5 > i)
          break;
      }
      else
      {
        v11 = 5;
      }
      if (v8 == 9)
      {
        __memcpy_chk();
        HIDWORD(v23) = bswap32(HIDWORD(v23));
      }
      else if (v8 == 11 && v10 <= 0x1C)
      {
        __memcpy_chk();
      }
      a4 += v11;
    }
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a2 + 120));
  v13 = ne_log_obj();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v21 = *(_DWORD *)(a2 + 24);
    *(_DWORD *)buf = 67109376;
    v25 = v21;
    v26 = 1024;
    LODWORD(v27) = HIDWORD(v23);
    _os_log_debug_impl(&dword_208439000, v13, OS_LOG_TYPE_DEBUG, "(%u): Got a connect result with window size %u", buf, 0xEu);
  }
  if ((*(_BYTE *)(a2 + 100) & 3) != 0)
  {
    v14 = ne_log_obj();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(_DWORD *)(a2 + 24);
      *(_DWORD *)buf = 67109378;
      v25 = v15;
      v26 = 2080;
      v27 = "Flow is closed, sending close while handling connect result";
      _os_log_impl(&dword_208439000, v14, OS_LOG_TYPE_DEFAULT, "(%u): %s", buf, 0x12u);
    }
    v16 = *(_DWORD *)(a2 + 24);
    v17 = flow_error_to_errno(*(_QWORD *)(a2 + 32));
    flow_director_send_close(a1, v16, v17, 2u, *(_DWORD *)(a2 + 100) & 4);
    goto LABEL_22;
  }
  if (*(_DWORD *)(a2 + 104))
  {
LABEL_22:
    os_unfair_lock_unlock((os_unfair_lock_t)(a2 + 120));
    return;
  }
  v18 = HIDWORD(v23);
  if (!HIDWORD(v23))
  {
    flow_read_close(a2, 0);
    flow_write_close(a2, 0);
    flow_drop_director((_QWORD *)a2);
    goto LABEL_22;
  }
  *(_DWORD *)(a2 + 104) = HIDWORD(v23);
  *(_DWORD *)(a2 + 288) = v18;
  if (BYTE1(length[0]))
  {
    v19 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const UInt8 *)length, LOBYTE(length[0]));
    v20 = *(const void **)(a2 + 56);
    if (v20)
      CFRelease(v20);
    *(_QWORD *)(a2 + 56) = v19;
  }
  flow_notify_client((_QWORD *)a2, 5);
  os_unfair_lock_unlock((os_unfair_lock_t)(a2 + 120));
  flow_director_handle_read_notification((os_unfair_lock_s *)a2);
}

void flow_director_handle_data(uint64_t a1, uint64_t a2, size_t a3, unsigned __int8 *a4)
{
  os_unfair_lock_s *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  dispatch_data_t concat;
  size_t size;
  CFTypeRef v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  int v19;
  uint64_t v20;
  size_t v21;
  NSObject *v22;
  const __CFAllocator *v23;
  dispatch_data_t *v24;
  dispatch_data_t *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  unint64_t v32;
  unsigned __int8 *v33;
  int v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;
  const __CFData *v38;
  const UInt8 *BytePtr;
  size_t Length;
  NSObject *v41;
  NSObject *v42;
  uint64_t v43;
  NSObject *v44;
  int v45;
  NSObject *v46;
  const char *v47;
  NSObject *v48;
  uint32_t v49;
  NSObject *v50;
  unsigned int v51;
  NSObject *v52;
  uint64_t v53;
  NSObject *v54;
  NSObject *v55;
  NSObject *address;
  NSObject *v57;
  NSObject *v58;
  size_t v59;
  int v60;
  int v61;
  int v62;
  int v63;
  const char *v64;
  _QWORD v65[5];
  unsigned __int8 v66;
  NSObject *v67;
  _QWORD completion[7];
  uint8_t v69[4];
  int v70;
  __int16 v71;
  const char *v72;
  __int16 v73;
  NSObject *v74;
  __int16 v75;
  int v76;
  uint8_t buf[32];
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
  v8 = (os_unfair_lock_s *)(a2 + 120);
  os_unfair_lock_lock((os_unfair_lock_t)(a2 + 120));
  if ((*(_BYTE *)(a2 + 100) & 2) != 0)
  {
    v18 = ne_log_obj();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = *(_DWORD *)(a2 + 24);
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = v19;
      *(_WORD *)&buf[8] = 2080;
      *(_QWORD *)&buf[10] = "received bytes, but flow is closed";
      _os_log_impl(&dword_208439000, v18, OS_LOG_TYPE_DEFAULT, "(%u): %s", buf, 0x12u);
    }
    goto LABEL_70;
  }
  v9 = *(_QWORD *)(a2 + 16);
  if (v9 != 2)
  {
    if (v9 == 1)
    {
      v10 = dispatch_data_create(a4, a3, *(dispatch_queue_t *)(a1 + 16), 0);
      *(_QWORD *)(a2 + 232) += dispatch_data_get_size(v10);
      v11 = ne_log_obj();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v60 = *(_DWORD *)(a2 + 24);
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)&buf[4] = v60;
        *(_WORD *)&buf[8] = 2048;
        *(_QWORD *)&buf[10] = dispatch_data_get_size(v10);
        _os_log_debug_impl(&dword_208439000, v11, OS_LOG_TYPE_DEBUG, "(%u): received %zu tcp bytes from app", buf, 0x12u);
      }
      v12 = *(NSObject **)(a2 + 112);
      if (dispatch_data_get_size(v12))
      {
        concat = dispatch_data_create_concat(v12, v10);
        dispatch_release(*(dispatch_object_t *)(a2 + 112));
        dispatch_release(v10);
        v10 = concat;
      }
      *(_QWORD *)(a2 + 112) = v10;
      if (*(_QWORD *)(a2 + 408))
      {
        if (v10 && dispatch_data_get_size(v10))
        {
          *(_QWORD *)(a2 + 112) = MEMORY[0x24BDAC990];
          size = dispatch_data_get_size(v10);
          v15 = CFRetain((CFTypeRef)a2);
          v16 = *(NSObject **)(a2 + 408);
          v17 = *MEMORY[0x24BDE0850];
          completion[0] = MEMORY[0x24BDAC760];
          completion[1] = 0x40000000;
          completion[2] = __flow_director_handle_data_block_invoke;
          completion[3] = &__block_descriptor_tmp_132;
          completion[4] = a2;
          completion[5] = size;
          completion[6] = v15;
          nw_connection_send(v16, v10, v17, 1, completion);
          dispatch_release(v10);
        }
      }
      else
      {
        flow_call_stream_read_handler(a2, 0);
      }
    }
    goto LABEL_70;
  }
  v20 = 0;
  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  memset(buf, 0, sizeof(buf));
  v67 = 0;
  v66 = 0;
  buf[1] = 0;
  if (a3 < 5)
    goto LABEL_15;
  v20 = 0;
  v32 = a3;
  v33 = a4;
  while (1)
  {
    v34 = *v33;
    v35 = *(_DWORD *)(v33 + 1);
    v36 = bswap32(v35);
    if (v35)
    {
      v37 = v36 + 5;
      if (v36 + 5 > v32)
        goto LABEL_15;
    }
    else
    {
      v37 = 5;
    }
    if (*v33 > 0x1Au)
      break;
    if (v34 == 22)
    {
      if (v36 <= 0x80)
        goto LABEL_33;
      goto LABEL_34;
    }
    if (v34 == 23)
    {
      if (v36 <= 4)
        goto LABEL_33;
      goto LABEL_34;
    }
LABEL_35:
    v33 += v37;
    v32 -= v37;
    if (v32 <= 4)
      goto LABEL_15;
  }
  if (v34 == 27)
  {
    if (v36 <= 1)
LABEL_33:
      __memcpy_chk();
LABEL_34:
    v20 += v36 + 5;
    goto LABEL_35;
  }
  if (v34 != 37)
    goto LABEL_35;
  if (v36 <= 8)
    __memcpy_chk();
  v20 += v36 + 5;
LABEL_15:
  v21 = a3 - v20;
  v22 = ne_log_obj();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    v61 = *(_DWORD *)(a2 + 24);
    *(_DWORD *)v69 = 67109888;
    v70 = v61;
    v71 = 2048;
    v72 = (const char *)v21;
    v73 = 2048;
    v74 = v67;
    v75 = 1024;
    v76 = v66;
    _os_log_debug_impl(&dword_208439000, v22, OS_LOG_TYPE_DEBUG, "(%u): received %zu datagram bytes from app, total_size = %lu, is_fragment = %d", v69, 0x22u);
  }
  v23 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v24 = (dispatch_data_t *)CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x24BDBD240], 152, 0);
  v25 = v24;
  *((_OWORD *)v24 + 6) = 0u;
  *((_OWORD *)v24 + 7) = 0u;
  *((_OWORD *)v24 + 4) = 0u;
  *((_OWORD *)v24 + 5) = 0u;
  *((_OWORD *)v24 + 2) = 0u;
  *((_OWORD *)v24 + 3) = 0u;
  *(_OWORD *)v24 = 0u;
  *((_OWORD *)v24 + 1) = 0u;
  *((_OWORD *)v24 + 8) = 0u;
  v24[18] = 0;
  if (buf[1])
  {
    v26 = *(_OWORD *)buf;
    v27 = *(_OWORD *)&buf[16];
    v28 = v79;
    *((_OWORD *)v24 + 2) = v78;
    *((_OWORD *)v24 + 3) = v28;
    *(_OWORD *)v24 = v26;
    *((_OWORD *)v24 + 1) = v27;
    v29 = v80;
    v30 = v81;
    v31 = v83;
    *((_OWORD *)v24 + 6) = v82;
    *((_OWORD *)v24 + 7) = v31;
    *((_OWORD *)v24 + 4) = v29;
    *((_OWORD *)v24 + 5) = v30;
  }
  else
  {
    v38 = *(const __CFData **)(a2 + 48);
    if (v38)
    {
      BytePtr = CFDataGetBytePtr(v38);
      Length = CFDataGetLength(*(CFDataRef *)(a2 + 48));
      memcpy(v25, BytePtr, Length);
    }
  }
  v41 = v67;
  if (v67)
  {
    v25[16] = (dispatch_data_t)MEMORY[0x24BDAC990];
    v25[17] = v41;
    if (*(_QWORD *)(a2 + 296))
    {
      v42 = ne_log_obj();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        v63 = *(_DWORD *)(a2 + 24);
        v64 = *(const char **)(*(_QWORD *)(a2 + 296) + 136);
        *(_DWORD *)v69 = 67109376;
        v70 = v63;
        v71 = 2048;
        v72 = v64;
        _os_log_error_impl(&dword_208439000, v42, OS_LOG_TYPE_ERROR, "(%u): previous fragmented datagram was never completed (%lu bytes remaining), dropping it", v69, 0x12u);
      }
      dispatch_release(*(dispatch_object_t *)(*(_QWORD *)(a2 + 296) + 128));
      CFAllocatorDeallocate(v23, *(void **)(a2 + 296));
    }
    *(_QWORD *)(a2 + 296) = v25;
  }
  else
  {
    v25[16] = dispatch_data_create(&a4[v20], v21, 0, 0);
    v25[18] = 0;
    **(_QWORD **)(a2 + 272) = v25;
    *(_QWORD *)(a2 + 272) = v25 + 18;
    *(_DWORD *)(a2 + 280) += dispatch_data_get_size(v25[16]);
  }
  if (v66)
  {
    v43 = *(_QWORD *)(a2 + 296);
    if (v43 && *(_QWORD *)(v43 + 128))
    {
      if (*(_QWORD *)(v43 + 136) >= v21)
      {
        v57 = dispatch_data_create(&a4[v20], v21, 0, 0);
        v58 = *(NSObject **)(v43 + 128);
        *(_QWORD *)(v43 + 128) = dispatch_data_create_concat(v58, v57);
        dispatch_release(v58);
        dispatch_release(v57);
        v59 = *(_QWORD *)(v43 + 136) - v21;
        *(_QWORD *)(v43 + 136) = v59;
        if (!v59)
        {
          *(_QWORD *)(v43 + 144) = 0;
          **(_QWORD **)(a2 + 272) = v43;
          *(_QWORD *)(a2 + 272) = v43 + 144;
          *(_DWORD *)(a2 + 280) += dispatch_data_get_size(*(dispatch_data_t *)(v43 + 128));
          *(_QWORD *)(a2 + 296) = 0;
        }
      }
      else
      {
        v44 = ne_log_obj();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          v45 = *(_DWORD *)(a2 + 24);
          v46 = *(NSObject **)(v43 + 136);
          *(_DWORD *)v69 = 67109632;
          v70 = v45;
          v71 = 2048;
          v72 = (const char *)v21;
          v73 = 2048;
          v74 = v46;
          v47 = "(%u): Received a datagram fragment with more data than expected (%lu vs. %lu)";
          v48 = v44;
          v49 = 28;
          goto LABEL_72;
        }
      }
    }
    else
    {
      v50 = ne_log_obj();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        v62 = *(_DWORD *)(a2 + 24);
        *(_DWORD *)v69 = 67109378;
        v70 = v62;
        v71 = 2080;
        v72 = "Received a datagram fragment but no previous datagram was found";
        v47 = "(%u): %s";
        v48 = v50;
        v49 = 18;
LABEL_72:
        _os_log_error_impl(&dword_208439000, v48, OS_LOG_TYPE_ERROR, v47, v69, v49);
      }
    }
  }
  v51 = *(_DWORD *)(a2 + 280);
  if (v51)
  {
    v52 = *(NSObject **)(a2 + 408);
    if (v52)
    {
      v65[0] = MEMORY[0x24BDAC760];
      v65[1] = 0x40000000;
      v65[2] = __flow_director_handle_data_block_invoke_134;
      v65[3] = &__block_descriptor_tmp_136;
      v65[4] = a2;
      nw_connection_batch(v52, v65);
    }
    else if (*(_QWORD *)(a2 + 416))
    {
      v53 = *(_QWORD *)(a2 + 264);
      if (v53)
      {
        v54 = *MEMORY[0x24BDE0850];
        do
        {
          v55 = *(NSObject **)(v53 + 128);
          address = nw_endpoint_create_address((const sockaddr *)v53);
          nw_connection_group_send_message(*(nw_connection_group_t *)(a2 + 416), v55, address, v54, &__block_literal_global_138);
          nw_release(address);
          v53 = *(_QWORD *)(v53 + 144);
        }
        while (v53);
        v51 = *(_DWORD *)(a2 + 280);
      }
      flow_director_send_read_notification(*(_QWORD *)(a2 + 40), *(_DWORD *)(a2 + 24), v51);
      flow_clear_datagram_queue(*(_QWORD **)(a2 + 264), *(_QWORD **)(a2 + 272));
      *(_QWORD *)(a2 + 264) = 0;
      *(_QWORD *)(a2 + 272) = a2 + 264;
    }
    else
    {
      flow_call_dgram_read_handler(a2, 0);
    }
  }
LABEL_70:
  os_unfair_lock_unlock(v8);
}

void flow_director_handle_close(uint64_t a1, unint64_t a2, unsigned __int8 *a3)
{
  int v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  unsigned int v9;

  while (a2 >= 5)
  {
    v4 = *a3;
    v5 = *(_DWORD *)(a3 + 1);
    v6 = bswap32(v5);
    if (v5)
    {
      v7 = v6 + 5;
      if (v6 + 5 > a2)
        return;
    }
    else
    {
      v7 = 5;
    }
    a3 += v7;
    a2 -= v7;
    if (v4 == 7)
    {
      __memcpy_chk();
      v9 = bswap32(0);
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
      if (!v9 || (flow_read_close(a1, 0), v9 != 1))
        flow_write_close(a1, 0);
      v8 = *(_DWORD *)(a1 + 100);
      if ((v8 & 3) != 0)
      {
        flow_cancel_bridged_connection(a1, 0);
        v8 = *(_DWORD *)(a1 + 100);
      }
      if ((~v8 & 3) == 0 && !*(_BYTE *)(a1 + 320))
        flow_drop_director((_QWORD *)a1);
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
      return;
    }
  }
}

void flow_director_handle_read_notification(os_unfair_lock_s *a1)
{
  os_unfair_lock_s *v2;
  NSObject *v3;
  uint32_t os_unfair_lock_opaque;
  _QWORD v5[5];
  uint8_t buf[4];
  uint32_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a1 + 30;
  os_unfair_lock_lock(a1 + 30);
  v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    os_unfair_lock_opaque = a1[6]._os_unfair_lock_opaque;
    *(_DWORD *)buf = 67109120;
    v7 = os_unfair_lock_opaque;
    _os_log_debug_impl(&dword_208439000, v3, OS_LOG_TYPE_DEBUG, "(%u): Received a read notification", buf, 8u);
  }
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 0x40000000;
  v5[2] = __flow_director_handle_read_notification_block_invoke;
  v5[3] = &__block_descriptor_tmp_140;
  v5[4] = a1;
  flow_handle_pending_write_requests((uint64_t)a1, (uint64_t)v5);
  os_unfair_lock_unlock(v2);
}

uint64_t __flow_director_handle_read_notification_block_invoke(uint64_t a1, void *__src)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  void *v8;

  v4 = flow_write_range_of_cfdata(*(_QWORD *)(a1 + 32), *((const __CFData **)__src + 16), *((_QWORD *)__src + 17), *((_QWORD *)__src + 18), (unsigned __int8 *)__src);
  if (v5 < 1)
  {
    v8 = (void *)*((_QWORD *)__src + 19);
    if (v8)
      flow_call_write_completion(*(_QWORD *)(a1 + 32), 0, v8);
    return 1;
  }
  else
  {
    v6 = v4;
    result = 0;
    *((_QWORD *)__src + 17) = v6;
    *((_QWORD *)__src + 18) = v5;
  }
  return result;
}

void __flow_director_handle_data_block_invoke(uint64_t a1, nw_error_t error)
{
  CFErrorRef v3;

  if (error)
  {
    v3 = nw_error_copy_cf_error(error);
    flow_close(*(os_unfair_lock_s **)(a1 + 32), v3, 1);
    if (v3)
      CFRelease(v3);
  }
  else
  {
    flow_director_send_read_notification(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), *(_DWORD *)(*(_QWORD *)(a1 + 32) + 24), *(_DWORD *)(a1 + 40));
  }
  CFRelease(*(CFTypeRef *)(a1 + 48));
}

void __flow_director_handle_data_block_invoke_134(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  CFTypeRef v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[6];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 264);
  if (v3)
  {
    v4 = *MEMORY[0x24BDE0850];
    v5 = MEMORY[0x24BDAC760];
    do
    {
      v6 = *(NSObject **)(v3 + 128);
      v7 = CFRetain(*(CFTypeRef *)(a1 + 32));
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(NSObject **)(v8 + 408);
      v10[0] = v5;
      v10[1] = 0x40000000;
      v10[2] = __flow_director_handle_data_block_invoke_2;
      v10[3] = &__block_descriptor_tmp_135;
      v10[4] = v8;
      v10[5] = v7;
      nw_connection_send(v9, v6, v4, 1, v10);
      v3 = *(_QWORD *)(v3 + 144);
    }
    while (v3);
    v2 = *(_QWORD *)(a1 + 32);
  }
  flow_director_send_read_notification(*(_QWORD *)(v2 + 40), *(_DWORD *)(v2 + 24), *(_DWORD *)(v2 + 280));
  flow_clear_datagram_queue(*(_QWORD **)(*(_QWORD *)(a1 + 32) + 264), *(_QWORD **)(*(_QWORD *)(a1 + 32) + 272));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 264) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 272) = *(_QWORD *)(a1 + 32) + 264;
}

void __flow_director_handle_data_block_invoke_2(uint64_t a1, nw_error_t error)
{
  CFErrorRef v3;

  if (error)
  {
    v3 = nw_error_copy_cf_error(error);
    flow_close(*(os_unfair_lock_s **)(a1 + 32), v3, 1);
    if (v3)
      CFRelease(v3);
  }
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

NSObject *flow_create_bridged_parameters(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v5;
  nw_parameters_t secure_udp;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  const __CFData *v10;
  CFIndex Length;
  UInt8 buffer[16];
  __int128 v14;
  CFRange v15;

  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 120));
  v5 = *(_QWORD *)(a1 + 16);
  if (v5 == 2)
  {
    secure_udp = nw_parameters_create_secure_udp((nw_parameters_configure_protocol_block_t)*MEMORY[0x24BDE0880], (nw_parameters_configure_protocol_block_t)*MEMORY[0x24BDE0870]);
  }
  else
  {
    if (v5 != 1)
      return 0;
    secure_udp = nw_parameters_create_secure_tcp((nw_parameters_configure_protocol_block_t)*MEMORY[0x24BDE0880], (nw_parameters_configure_protocol_block_t)*MEMORY[0x24BDE0870]);
  }
  v7 = secure_udp;
  if ((*(_BYTE *)(a1 + 344) & 8) != 0)
  {
    if (*(_DWORD *)(a1 + 400))
    {
      v8 = nw_interface_create_with_index();
      if (v8)
      {
        v9 = v8;
        nw_parameters_require_interface(v7, v8);
        nw_release(v9);
      }
    }
  }
  if (*(_DWORD *)(a1 + 96))
    nw_parameters_set_traffic_class();
  *(_OWORD *)buffer = 0u;
  v14 = 0u;
  v10 = *(const __CFData **)(a1 + 360);
  if (v10)
  {
    Length = CFDataGetLength(v10);
    if (a3)
    {
      if (Length == 32)
      {
        v15.location = 0;
        v15.length = 32;
        CFDataGetBytes(*(CFDataRef *)(a1 + 360), v15, buffer);
        nw_parameters_set_source_application();
      }
    }
  }
  nw_parameters_set_context();
  nw_parameters_set_indefinite();
  return v7;
}

void __flow_setup_bridged_connection_group_block_invoke(_QWORD *a1, int a2, NSObject *a3)
{
  uint64_t v6;
  unsigned int port;
  uint64_t v8;
  const __CFData *v9;
  const UInt8 *BytePtr;
  int v11;
  const __CFAllocator *v12;
  CFIndex v13;
  CFErrorRef v14;
  uint64_t v15;
  const void *v16;
  const __CFData *v17;
  int v18;
  UInt8 bytes[2];
  __int16 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24))
    return;
  os_unfair_lock_lock((os_unfair_lock_t)(a1[5] + 120));
  v6 = a1[5];
  if (!*(_QWORD *)(v6 + 416))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 120));
LABEL_15:
    v15 = *(_QWORD *)(a1[4] + 8);
    v16 = *(const void **)(v15 + 24);
    if (v16)
    {
      CFRelease(v16);
      *(_QWORD *)(v15 + 24) = 0;
    }
    return;
  }
  if ((a2 - 3) >= 2)
  {
    if (a2 == 1)
    {
      flow_start_connection_waiting_timer(v6, *(NSObject **)(a1[6] + 16));
      os_unfair_lock_unlock((os_unfair_lock_t)(a1[5] + 120));
      return;
    }
    if (a2 != 2)
      goto LABEL_23;
    port = nw_connection_group_get_port();
    v8 = a1[5];
    os_unfair_lock_assert_owner((const os_unfair_lock *)(v8 + 120));
    v9 = *(const __CFData **)(v8 + 48);
    if (v9)
    {
      BytePtr = CFDataGetBytePtr(v9);
      if (BytePtr)
      {
        v11 = BytePtr[1];
        if (v11 == 30)
        {
          v21 = 0;
          v22 = 0;
          v23 = 0;
          *(_WORD *)bytes = 7708;
          v20 = __rev16(port);
          v12 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
          v13 = 28;
LABEL_19:
          v17 = CFDataCreate(v12, bytes, v13);
          NEFlowResetLocalEndpoint(a1[5], v17);
          if (v17)
            CFRelease(v17);
          goto LABEL_21;
        }
        if (v11 == 2)
        {
          LODWORD(v22) = 0;
          v21 = 0;
          *(_WORD *)bytes = 528;
          v20 = __rev16(port);
          v12 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
          v13 = 16;
          goto LABEL_19;
        }
      }
    }
LABEL_21:
    v18 = flow_open(a1[5]);
    v6 = a1[5];
    if (!v18)
    {
      flow_cancel_bridged_connection(v6, 0);
      v6 = a1[5];
    }
LABEL_23:
    flow_cancel_connection_waiting_timer(v6);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1[5] + 120));
    return;
  }
  v14 = nw_error_copy_cf_error(a3);
  flow_cancel_bridged_connection(a1[5], v14);
  if (v14)
    CFRelease(v14);
  flow_cancel_connection_waiting_timer(a1[5]);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[5] + 120));
  if (a2 == 4)
    goto LABEL_15;
}

void __flow_bridge_read_data_from_connection_group_block_invoke(uint64_t a1, const void *a2, NSObject *a3)
{
  uint64_t v6;
  uint64_t v7;
  sockaddr *address;
  NSObject *v9;
  os_unfair_lock_s *v10;
  _QWORD v11[5];

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 120));
  v6 = *(_QWORD *)(a1 + 32);
  if ((*(_BYTE *)(v6 + 100) & 1) != 0 || !*(_QWORD *)(v6 + 416))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 120));
    return;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 120));
  if (!a2)
    return;
  if (!a3)
    goto LABEL_11;
  v7 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v7 + 432))
  {
    v9 = nw_connection_group_copy_remote_endpoint_for_message(*(nw_connection_group_t *)(a1 + 40), a3);
    a3 = v9;
    if (v9 && nw_endpoint_get_type(v9) == nw_endpoint_type_address)
    {
      address = (sockaddr *)nw_endpoint_get_address(a3);
      goto LABEL_12;
    }
LABEL_11:
    address = 0;
    goto LABEL_12;
  }
  address = (sockaddr *)CFDataGetBytePtr(*(CFDataRef *)(v7 + 48));
  a3 = 0;
LABEL_12:
  v10 = *(os_unfair_lock_s **)(a1 + 32);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 0x40000000;
  v11[2] = __flow_bridge_read_data_from_connection_group_block_invoke_2;
  v11[3] = &__block_descriptor_tmp_168;
  v11[4] = v10;
  NEFlowWrite(v10, a2, &address->sa_len, v11);
  nw_release(a3);
}

void __flow_setup_bridged_connection_block_invoke(_QWORD *a1, int a2, NSObject *a3)
{
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  const sockaddr *address;
  const __CFData *v10;
  uint64_t v11;
  void *v12;
  int interface_index;
  uint64_t v14;
  int v15;
  uint64_t v16;
  CFErrorRef v17;
  uint64_t v18;
  const void *v19;

  if (!*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24))
    return;
  os_unfair_lock_lock((os_unfair_lock_t)(a1[5] + 120));
  v6 = a1[5];
  if (!*(_QWORD *)(v6 + 408))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 120));
LABEL_21:
    v18 = *(_QWORD *)(a1[4] + 8);
    v19 = *(const void **)(v18 + 24);
    if (v19)
    {
      CFRelease(v19);
      *(_QWORD *)(v18 + 24) = 0;
    }
    return;
  }
  if ((a2 - 4) >= 2)
  {
    if (a2 == 1)
    {
      flow_start_connection_waiting_timer(v6, *(NSObject **)(a1[6] + 16));
    }
    else
    {
      if (a2 == 3)
      {
        v7 = nw_connection_copy_connected_local_endpoint();
        if (v7)
        {
          v8 = v7;
          if (nw_endpoint_get_type(v7) == nw_endpoint_type_address)
          {
            address = nw_endpoint_get_address(v8);
            v10 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], &address->sa_len, address->sa_len);
            NEFlowResetLocalEndpoint(a1[5], v10);
            if (v10)
              CFRelease(v10);
          }
          nw_release(v8);
        }
        v11 = nw_connection_copy_connected_path();
        if (v11)
        {
          v12 = (void *)v11;
          interface_index = nw_path_get_interface_index();
          if (interface_index)
          {
            v14 = a1[5];
            *(_DWORD *)(v14 + 400) = interface_index;
            flow_director_send_properties_update(*(_QWORD *)(v14 + 40), *(_DWORD *)(v14 + 24), interface_index, 0);
          }
          nw_release(v12);
        }
        v15 = flow_open(a1[5]);
        v16 = a1[5];
        if (v15)
          flow_bridge_read_data_from_connection(v16);
        else
          flow_cancel_bridged_connection(v16, 0);
      }
      flow_cancel_connection_waiting_timer(a1[5]);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1[5] + 120));
    return;
  }
  v17 = nw_error_copy_cf_error(a3);
  flow_cancel_bridged_connection(a1[5], v17);
  if (v17)
    CFRelease(v17);
  flow_cancel_connection_waiting_timer(a1[5]);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[5] + 120));
  if (a2 == 5)
    goto LABEL_21;
}

void __flow_startup_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  NSObject *v5;
  const void *v6;
  const void *v7;
  const void *v8;
  _QWORD block[6];
  int v10;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 136);
  if (v3)
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(v3 + 16))(v3, *(unsigned int *)(a1 + 72), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  }
  else
  {
    v4 = *(_DWORD *)(a1 + 72);
    v5 = *(NSObject **)(v2 + 16);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = __NEFlowDirectorHandleMatchRulesResult_block_invoke;
    block[3] = &__block_descriptor_tmp_83;
    v10 = v4;
    block[4] = v2;
    block[5] = 0;
    dispatch_async(v5, block);
  }
  dispatch_release(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 16));
  CFRelease(*(CFTypeRef *)(a1 + 48));
  v6 = *(const void **)(a1 + 40);
  if (v6)
    CFRelease(v6);
  v7 = *(const void **)(a1 + 56);
  if (v7)
    CFRelease(v7);
  v8 = *(const void **)(a1 + 64);
  if (v8)
    CFRelease(v8);
}

void __flow_startup_block_invoke_154(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  _QWORD v13[6];
  uint8_t buf[4];
  int v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144);
  v3 = ne_log_obj();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v11 = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 24);
      *(_DWORD *)buf = 67109378;
      v15 = v11;
      v16 = 2080;
      v17 = "Delivering to client";
      _os_log_debug_impl(&dword_208439000, v4, OS_LOG_TYPE_DEBUG, "(%u): %s", buf, 0x12u);
    }
    v9 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v10 = *(_QWORD *)(v9 + 144);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 0x40000000;
    v13[2] = __flow_startup_block_invoke_156;
    v13[3] = &__block_descriptor_tmp_159;
    v13[4] = v9;
    v13[5] = v8;
    (*(void (**)(uint64_t, uint64_t, _QWORD *, uint64_t, uint64_t, uint64_t))(v10 + 16))(v10, v8, v13, v5, v6, v7);
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v12 = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 24);
      *(_DWORD *)buf = 67109378;
      v15 = v12;
      v16 = 2080;
      v17 = "No new flow callback registered, dropping the flow";
      _os_log_error_impl(&dword_208439000, v4, OS_LOG_TYPE_ERROR, "(%u): %s", buf, 0x12u);
    }
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 120));
    flow_startup(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 1);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 120));
    CFRelease(*(CFTypeRef *)(a1 + 40));
    dispatch_release(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 16));
  }
}

void __flow_startup_block_invoke_156(int8x16_t *a1, char a2)
{
  int8x16_t v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD block[4];
  int8x16_t v7;
  char v8;

  block[1] = 0x40000000;
  v3 = vextq_s8(a1[2], a1[2], 8uLL);
  v4 = a1[2].i64[0];
  block[0] = MEMORY[0x24BDAC760];
  v5 = *(NSObject **)(v4 + 16);
  block[2] = __flow_startup_block_invoke_2;
  block[3] = &__block_descriptor_tmp_157;
  v8 = a2;
  v7 = v3;
  dispatch_async(v5, block);
  dispatch_release(*(dispatch_object_t *)(a1[2].i64[0] + 16));
}

void __flow_startup_block_invoke_2(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 48))
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 120));
    flow_startup(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 1);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 120));
  }
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void flow_bridge_read_data_from_connection(uint64_t a1)
{
  NSObject *v2;
  CFTypeRef v3;
  NSObject *v4;
  _QWORD v5[6];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 120));
    if ((*(_BYTE *)(a1 + 100) & 1) == 0)
    {
      v2 = *(NSObject **)(a1 + 408);
      if (v2)
      {
        v3 = CFRetain((CFTypeRef)a1);
        v5[0] = MEMORY[0x24BDAC760];
        v5[1] = 0x40000000;
        v5[2] = __flow_bridge_read_data_from_connection_block_invoke;
        v5[3] = &__block_descriptor_tmp_176;
        v5[4] = a1;
        v5[5] = v3;
        nw_connection_receive(v2, 0, 0xFFFFFFFF, v5);
      }
    }
  }
  else
  {
    v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v7 = "flow_bridge_read_data_from_connection";
      _os_log_fault_impl(&dword_208439000, v4, OS_LOG_TYPE_FAULT, "%s called with null flow", buf, 0xCu);
    }
  }
}

void flow_start_connection_waiting_timer(uint64_t a1, NSObject *a2)
{
  NSObject *v4;
  dispatch_time_t v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  _QWORD v9[5];
  _QWORD v10[3];
  CFTypeRef v11;
  _QWORD handler[5];
  uint8_t buf[4];
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 120));
  if (!*(_QWORD *)(a1 + 424) && (*(_QWORD *)(a1 + 408) || *(_QWORD *)(a1 + 416)))
  {
    v4 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, a2);
    v5 = dispatch_time(0, 15000000000);
    dispatch_source_set_timer(v4, v5, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
    v6 = MEMORY[0x24BDAC760];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 0x40000000;
    handler[2] = __flow_start_connection_waiting_timer_block_invoke;
    handler[3] = &__block_descriptor_tmp_164;
    handler[4] = a1;
    dispatch_source_set_event_handler(v4, handler);
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x2000000000;
    v11 = 0;
    v11 = CFRetain((CFTypeRef)a1);
    v9[0] = v6;
    v9[1] = 0x40000000;
    v9[2] = __flow_start_connection_waiting_timer_block_invoke_165;
    v9[3] = &unk_24C0A04B0;
    v9[4] = v10;
    dispatch_source_set_cancel_handler(v4, v9);
    dispatch_activate(v4);
    *(_QWORD *)(a1 + 424) = v4;
    v7 = ne_log_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = *(_DWORD *)(a1 + 24);
      *(_DWORD *)buf = 67109120;
      v14 = v8;
      _os_log_debug_impl(&dword_208439000, v7, OS_LOG_TYPE_DEBUG, "(%u): Starting waiting timer", buf, 8u);
    }
    _Block_object_dispose(v10, 8);
  }
}

void __flow_start_connection_waiting_timer_block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  int v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 120));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 424);
  v3 = ne_log_obj();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v4)
    {
      v5 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 24);
      v7 = 67109120;
      v8 = v5;
      _os_log_debug_impl(&dword_208439000, v3, OS_LOG_TYPE_DEBUG, "(%u): Waiting timer fired, cancelling flow", (uint8_t *)&v7, 8u);
    }
    flow_cancel_bridged_connection(*(_QWORD *)(a1 + 32), 0);
  }
  else if (v4)
  {
    v6 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 24);
    v7 = 67109120;
    v8 = v6;
    _os_log_debug_impl(&dword_208439000, v3, OS_LOG_TYPE_DEBUG, "(%u): Waiting timer fired, ignoring stale event", (uint8_t *)&v7, 8u);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 120));
}

void __flow_start_connection_waiting_timer_block_invoke_165(uint64_t a1)
{
  uint64_t v1;
  const void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(const void **)(v1 + 24);
  if (v2)
  {
    CFRelease(v2);
    *(_QWORD *)(v1 + 24) = 0;
  }
}

void __flow_bridge_read_data_from_connection_block_invoke(uint64_t a1, const void *a2, int a3, char a4, nw_error_t error)
{
  uint64_t v9;
  sockaddr *address;
  NSObject *v11;
  os_unfair_lock_s *v12;
  uint64_t v13;
  CFErrorRef v14;
  NSObject *v15;
  _QWORD v16[5];

  if (a2)
  {
    v9 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v9 + 16) == 2)
    {
      if (!*(_BYTE *)(v9 + 432))
      {
        v15 = nw_connection_copy_endpoint(*(nw_connection_t *)(v9 + 408));
        v11 = v15;
        if (v15 && nw_endpoint_get_type(v15) == nw_endpoint_type_address)
          address = (sockaddr *)nw_endpoint_get_address(v11);
        else
          address = 0;
        goto LABEL_7;
      }
      address = (sockaddr *)CFDataGetBytePtr(*(CFDataRef *)(v9 + 48));
    }
    else
    {
      address = 0;
    }
    v11 = 0;
LABEL_7:
    v12 = *(os_unfair_lock_s **)(a1 + 32);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 0x40000000;
    v16[2] = __flow_bridge_read_data_from_connection_block_invoke_2;
    v16[3] = &__block_descriptor_tmp_174;
    v16[4] = v12;
    NEFlowWrite(v12, a2, &address->sa_len, v16);
    nw_release(v11);
  }
  v13 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v13 + 16) == 1)
  {
    if (!error && (a4 & 1) == 0)
      goto LABEL_16;
    if (!error)
    {
      flow_close((os_unfair_lock_s *)v13, 0, 0);
      goto LABEL_16;
    }
  }
  else if (!error)
  {
    goto LABEL_16;
  }
  v14 = nw_error_copy_cf_error(error);
  flow_close(*(os_unfair_lock_s **)(a1 + 32), v14, 0);
  if (v14)
    CFRelease(v14);
LABEL_16:
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

void __flow_bridge_read_data_from_connection_block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 120));
  v4 = *(_QWORD *)(a1 + 32);
  if (a2)
    flow_cancel_bridged_connection(v4, 0);
  else
    flow_bridge_read_data_from_connection(v4);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 120));
}

void __flow_bridge_read_data_from_connection_group_block_invoke_2(uint64_t a1, uint64_t a2)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 120));
  if (a2)
    flow_cancel_bridged_connection(*(_QWORD *)(a1 + 32), 0);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 120));
}

uint64_t flow_divert_compare_flows(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3;
  unsigned int v4;
  BOOL v5;
  _BOOL4 v6;
  int v7;

  v3 = bswap32(*(_DWORD *)(a2 + 24));
  v4 = bswap32(*(_DWORD *)(a3 + 24));
  v5 = v3 >= v4;
  v6 = v3 > v4;
  v7 = !v5;
  return (v6 - v7);
}

uint64_t flow_divert_compare_id(uint64_t a1, uint64_t a2, unsigned int *a3)
{
  unsigned int v3;
  unsigned int v4;
  BOOL v5;
  _BOOL4 v6;
  int v7;

  v3 = bswap32(*(_DWORD *)(a2 + 24));
  v4 = bswap32(*a3);
  v5 = v3 >= v4;
  v6 = v3 > v4;
  v7 = !v5;
  return (v6 - v7);
}

char *NEFlowDirectorCreate(int a1, NSObject *a2)
{
  return NEFlowDirectorCreateInternal(a1, a2, 0);
}

char *NEFlowDirectorCreateBridge(int a1, unint64_t a2)
{
  char *Internal;
  int is_debug_logging_enabled;
  const __CFAllocator *v5;
  char *v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  char v20;
  ssize_t v21;
  NSObject *v22;
  int *v24;
  char *v25;
  NSObject *v26;
  int v27;
  char *v28;
  _OWORD __buf[16];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    Internal = NEFlowDirectorCreateInternal(a1, 0, a2);
    if (Internal)
    {
      arc4random_buf(__buf, 0x100uLL);
      is_debug_logging_enabled = nelog_is_debug_logging_enabled();
      v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      v6 = (char *)CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x24BDBD240], 284, 0);
      v7 = v6;
      *v6 = 6;
      *((_DWORD *)v6 + 1) = 0;
      v6[8] = 17;
      *(_DWORD *)(v6 + 9) = 0x10000;
      v8 = __buf[2];
      v9 = __buf[3];
      v10 = __buf[1];
      *(_OWORD *)(v6 + 13) = __buf[0];
      *(_OWORD *)(v6 + 61) = v9;
      *(_OWORD *)(v6 + 45) = v8;
      *(_OWORD *)(v6 + 29) = v10;
      v11 = __buf[6];
      v12 = __buf[7];
      v13 = __buf[5];
      *(_OWORD *)(v6 + 77) = __buf[4];
      *(_OWORD *)(v6 + 125) = v12;
      *(_OWORD *)(v6 + 109) = v11;
      *(_OWORD *)(v6 + 93) = v13;
      v14 = __buf[10];
      v15 = __buf[11];
      v16 = __buf[9];
      *(_OWORD *)(v6 + 141) = __buf[8];
      *(_OWORD *)(v6 + 189) = v15;
      *(_OWORD *)(v6 + 173) = v14;
      *(_OWORD *)(v6 + 157) = v16;
      v17 = __buf[14];
      v18 = __buf[15];
      v19 = __buf[13];
      *(_OWORD *)(v6 + 205) = __buf[12];
      *(_OWORD *)(v6 + 253) = v18;
      *(_OWORD *)(v6 + 237) = v17;
      *(_OWORD *)(v6 + 221) = v19;
      if (is_debug_logging_enabled)
        v20 = 7;
      else
        v20 = 5;
      v6[269] = 20;
      *(_DWORD *)(v6 + 270) = 0x1000000;
      v6[274] = v20;
      v6[275] = 29;
      *(_QWORD *)(v6 + 276) = 0x104000000;
      v21 = send(a1, v6, 0x11CuLL, 0);
      CFAllocatorDeallocate(v5, v7);
      if (v21 < 0)
      {
        v22 = ne_log_obj();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v24 = __error();
          v25 = strerror(*v24);
          v27 = 136315138;
          v28 = v25;
          _os_log_error_impl(&dword_208439000, v22, OS_LOG_TYPE_ERROR, "Failed to send the FLOW_DIVERT_PKT_GROUP_INIT message: %s", (uint8_t *)&v27, 0xCu);
        }
      }
    }
  }
  else
  {
    v26 = ne_log_obj();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      LODWORD(__buf[0]) = 136315138;
      *(_QWORD *)((char *)__buf + 4) = "NEFlowDirectorCreateBridge";
      _os_log_fault_impl(&dword_208439000, v26, OS_LOG_TYPE_FAULT, "%s called with null context", (uint8_t *)__buf, 0xCu);
    }
    return 0;
  }
  return Internal;
}

void NEFlowDirectorAllowProcessDelegation(uint64_t a1)
{
  NSObject *v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    *(_BYTE *)(a1 + 121) = 1;
  }
  else
  {
    v1 = ne_log_obj();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT))
    {
      v2 = 136315138;
      v3 = "NEFlowDirectorAllowProcessDelegation";
      _os_log_fault_impl(&dword_208439000, v1, OS_LOG_TYPE_FAULT, "%s called with null director", (uint8_t *)&v2, 0xCu);
    }
  }
}

void NEFlowDirectorRedirectDNSToLoopback(uint64_t a1, char a2)
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    *(_BYTE *)(a1 + 122) = a2;
  }
  else
  {
    v2 = ne_log_obj();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    {
      v3 = 136315138;
      v4 = "NEFlowDirectorRedirectDNSToLoopback";
      _os_log_fault_impl(&dword_208439000, v2, OS_LOG_TYPE_FAULT, "%s called with null director", (uint8_t *)&v3, 0xCu);
    }
  }
}

void NEFlowDirectorStart(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[5];

  if (a1)
  {
    v1 = *(NSObject **)(a1 + 16);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = __NEFlowDirectorStart_block_invoke;
    block[3] = &__block_descriptor_tmp_75;
    block[4] = a1;
    dispatch_async(v1, block);
  }
}

void NEFlowDirectorDestroy(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  _QWORD v5[6];
  uint8_t buf[4];
  int v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = ne_log_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109378;
    v7 = dword_25453C118;
    v8 = 2080;
    v9 = "Destroying flow director";
    _os_log_debug_impl(&dword_208439000, v4, OS_LOG_TYPE_DEBUG, "(%u): %s", buf, 0x12u);
  }
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 0x40000000;
  v5[2] = __NEFlowDirectorDestroy_block_invoke;
  v5[3] = &unk_24C0A0038;
  v5[4] = a2;
  v5[5] = a1;
  flow_director_abort(a1, (uint64_t)v5);
}

uint64_t NEFlowDirectorGetMaxSendSize(uint64_t a1)
{
  return *(_QWORD *)(a1 + 184);
}

void NEFlowDirectorHandleNewControlSocket(uint64_t a1, int a2)
{
  NSObject *v2;
  _QWORD v3[5];
  int v4;

  v2 = *(NSObject **)(a1 + 16);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 0x40000000;
  v3[2] = __NEFlowDirectorHandleNewControlSocket_block_invoke;
  v3[3] = &__block_descriptor_tmp_81;
  v3[4] = a1;
  v4 = a2;
  dispatch_async(v2, v3);
}

void NEFlowDirectorHandleMatchRulesResult(uint64_t a1, int a2, CFTypeRef cf)
{
  NSObject *v6;
  _QWORD block[6];
  int v8;

  if (cf)
    CFRetain(cf);
  v6 = *(NSObject **)(a1 + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __NEFlowDirectorHandleMatchRulesResult_block_invoke;
  block[3] = &__block_descriptor_tmp_83;
  v8 = a2;
  block[4] = a1;
  block[5] = cf;
  dispatch_async(v6, block);
}

void NEFlowDirectorSetDelegateInterface(uint64_t a1, int a2)
{
  NSObject *v2;
  _QWORD v3[5];
  int v4;

  v2 = *(NSObject **)(a1 + 16);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 0x40000000;
  v3[2] = __NEFlowDirectorSetDelegateInterface_block_invoke;
  v3[3] = &__block_descriptor_tmp_84;
  v4 = a2;
  v3[4] = a1;
  dispatch_async(v2, v3);
}

void NEFlowDirectorSetOpenControlSocketCallback(uint64_t a1, void *aBlock)
{
  void *v3;
  NSObject *v4;
  _QWORD v5[6];

  if (aBlock)
    v3 = _Block_copy(aBlock);
  else
    v3 = 0;
  v4 = *(NSObject **)(a1 + 16);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 0x40000000;
  v5[2] = __NEFlowDirectorSetOpenControlSocketCallback_block_invoke;
  v5[3] = &unk_24C0A00C0;
  v5[4] = v3;
  v5[5] = a1;
  dispatch_async(v4, v5);
}

void NEFlowDirectorSetMatchRulesCallback(uint64_t a1, void *aBlock)
{
  void *v3;
  NSObject *v4;
  _QWORD v5[6];

  if (aBlock)
    v3 = _Block_copy(aBlock);
  else
    v3 = 0;
  v4 = *(NSObject **)(a1 + 16);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 0x40000000;
  v5[2] = __NEFlowDirectorSetMatchRulesCallback_block_invoke;
  v5[3] = &unk_24C0A00E8;
  v5[4] = v3;
  v5[5] = a1;
  dispatch_async(v4, v5);
}

void NEFlowDirectorSetNewFlowCallback(uint64_t a1, void *aBlock)
{
  void *v3;
  NSObject *v4;
  _QWORD v5[6];

  if (aBlock)
    v3 = _Block_copy(aBlock);
  else
    v3 = 0;
  v4 = *(NSObject **)(a1 + 16);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 0x40000000;
  v5[2] = __NEFlowDirectorSetNewFlowCallback_block_invoke;
  v5[3] = &unk_24C0A0110;
  v5[4] = v3;
  v5[5] = a1;
  dispatch_async(v4, v5);
}

void NEFlowDirectorFetchFlowStates(uint64_t a1, void *aBlock)
{
  void *v3;
  NSObject *v4;
  _QWORD v5[6];

  if (aBlock)
  {
    v3 = _Block_copy(aBlock);
    v4 = *(NSObject **)(a1 + 16);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 0x40000000;
    v5[2] = __NEFlowDirectorFetchFlowStates_block_invoke;
    v5[3] = &unk_24C0A0138;
    v5[4] = v3;
    v5[5] = a1;
    dispatch_async(v4, v5);
  }
}

uint64_t NEPunyCodeString(const char *a1, int32_t a2, char *a3, int32_t a4)
{
  const UIDNA *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  UIDNAInfo v13;
  UErrorCode pErrorCode;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  unsigned __int32 errors;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  pErrorCode = U_ZERO_ERROR;
  v13 = (UIDNAInfo)xmmword_208467180;
  v8 = (const UIDNA *)MEMORY[0x20BD084E0](34, &pErrorCode);
  v9 = uidna_nameToASCII_UTF8(v8, a1, a2, a3, a4, &v13, &pErrorCode);
  uidna_close(v8);
  if (pErrorCode)
  {
    v10 = ne_log_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v16 = a1;
      v17 = 1024;
      errors = pErrorCode;
      v11 = "Failed to punycode label - uidna_nameToASCII_UTF8(%s) failed errorCode %d";
LABEL_9:
      _os_log_error_impl(&dword_208439000, v10, OS_LOG_TYPE_ERROR, v11, buf, 0x12u);
      return 0;
    }
    return 0;
  }
  if (v13.errors)
  {
    v10 = ne_log_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v16 = a1;
      v17 = 1024;
      errors = v13.errors;
      v11 = "Failed to punycode label - uidna_nameToASCII_UTF8(%s) failed info.errors 0x%08X";
      goto LABEL_9;
    }
    return 0;
  }
  return v9;
}

BOOL NEHelperTrackerAppInfoSetSigningIdentifier(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    *a1 = a2;
    a1[8] = a3;
  }
  return a1 != 0;
}

BOOL NEHelperTrackerAppInfoSetPID(uint64_t a1, int a2, int a3)
{
  if (a1)
  {
    *(_DWORD *)(a1 + 56) = a2;
    *(_DWORD *)(a1 + 120) = a3;
  }
  return a1 != 0;
}

BOOL NEHelperTrackerAppInfoSetIsBrowser(uint64_t a1)
{
  if (a1)
    *(_DWORD *)(a1 + 124) |= 1u;
  return a1 != 0;
}

uint64_t NEHelperTrackerAppInfoIsBrowser(uint64_t result)
{
  if (result)
    return *(_BYTE *)(result + 124) & 1;
  return result;
}

uint64_t NEHelperTrackerAppInfoGetPID(unsigned int *a1)
{
  uint64_t result;

  if (!a1)
    return 0;
  result = a1[14];
  if (!(_DWORD)result)
  {
    result = a1[7];
    if (!(_DWORD)result)
    {
      result = a1[30];
      if (!(_DWORD)result)
      {
        result = a1[23];
        if (!(_DWORD)result)
          return 0;
      }
    }
  }
  return result;
}

unint64_t NEHelperTrackerContextCopyDomain(unint64_t a1, char *a2, uint64_t a3, unint64_t *a4)
{
  unint64_t v4;
  BOOL v8;
  BOOL v9;
  const char *domain;
  const char *v11;
  unint64_t v12;
  unint64_t v13;

  v4 = a1;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&ne_helper_tracker_lock);
    v8 = ne_helper_tracker_trie == 0x5061747269636961 && unk_253D8F510 == 2;
    if (v8
      && (qword_253D8F528 <= v4
        ? (v9 = qword_253D8F528 + (unint64_t)(unsigned __int16)word_253D8F53C - 1 >= v4)
        : (v9 = 0),
          v9 && (domain = (const char *)ne_tracker_context_get_domain()) != 0))
    {
      v11 = domain;
      v12 = strlen(domain);
      v13 = v12;
      v4 = 0;
      if (a2 && v12 <= a3 - 1)
      {
        strncpy(a2, v11, v12);
        a2[v13] = 0;
        v4 = (unint64_t)a2;
      }
      if (a4)
        *a4 = v13;
    }
    else
    {
      v4 = 0;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&ne_helper_tracker_lock);
  }
  return v4;
}

unint64_t NEHelperTrackerContextCopyDomainOwner(unint64_t a1, char *a2, uint64_t a3, unint64_t *a4)
{
  unint64_t v4;
  BOOL v8;
  BOOL v9;
  const char *domain_owner;
  const char *v11;
  unint64_t v12;
  unint64_t v13;

  v4 = a1;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&ne_helper_tracker_lock);
    v8 = ne_helper_tracker_trie == 0x5061747269636961 && unk_253D8F510 == 2;
    if (v8
      && (qword_253D8F528 <= v4
        ? (v9 = qword_253D8F528 + (unint64_t)(unsigned __int16)word_253D8F53C - 1 >= v4)
        : (v9 = 0),
          v9 && (domain_owner = (const char *)ne_tracker_context_get_domain_owner()) != 0))
    {
      v11 = domain_owner;
      v12 = strlen(domain_owner);
      v13 = v12;
      v4 = 0;
      if (a2 && v12 <= a3 - 1)
      {
        strncpy(a2, v11, v12);
        a2[v13] = 0;
        v4 = (unint64_t)a2;
      }
      if (a4)
        *a4 = v13;
    }
    else
    {
      v4 = 0;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&ne_helper_tracker_lock);
  }
  return v4;
}

CFStringRef NEHelperTrackerContextDupDomain(const __CFString *a1)
{
  CFStringRef v1;
  BOOL v2;
  BOOL v3;
  const char *domain;

  v1 = a1;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&ne_helper_tracker_lock);
    v2 = ne_helper_tracker_trie == 0x5061747269636961 && unk_253D8F510 == 2;
    if (v2
      && (qword_253D8F528 <= (unint64_t)v1
        ? (v3 = qword_253D8F528 + (unint64_t)(unsigned __int16)word_253D8F53C - 1 >= (unint64_t)v1)
        : (v3 = 0),
          v3 && (domain = (const char *)ne_tracker_context_get_domain()) != 0))
    {
      v1 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], domain, 0x8000100u);
    }
    else
    {
      v1 = 0;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&ne_helper_tracker_lock);
  }
  return v1;
}

CFStringRef NEHelperTrackerContextDupDomainOwner(const __CFString *a1)
{
  CFStringRef v1;
  BOOL v2;
  BOOL v3;
  const char *domain_owner;

  v1 = a1;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&ne_helper_tracker_lock);
    v2 = ne_helper_tracker_trie == 0x5061747269636961 && unk_253D8F510 == 2;
    if (v2
      && (qword_253D8F528 <= (unint64_t)v1
        ? (v3 = qword_253D8F528 + (unint64_t)(unsigned __int16)word_253D8F53C - 1 >= (unint64_t)v1)
        : (v3 = 0),
          v3 && (domain_owner = (const char *)ne_tracker_context_get_domain_owner()) != 0))
    {
      v1 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], domain_owner, 0x8000100u);
    }
    else
    {
      v1 = 0;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&ne_helper_tracker_lock);
  }
  return v1;
}

uint64_t NEHelperTrackerGetDispositionRedactLogs(uint64_t a1, CFArrayRef theArray, _QWORD *a3, CFIndex *a4, int a5)
{
  CFIndex Count;
  uint64_t (*v11)(uint64_t);
  CFIndex v12;
  const __CFString *ValueAtIndex;
  char v15;

  if (theArray)
    Count = CFArrayGetCount(theArray);
  else
    Count = 0;
  v15 = 0;
  if (!a1)
    return 0;
  v11 = (*(_BYTE *)(a1 + 124) & 1) != 0 ? NEHelperTrackerCheckMetadataForWeb : NEHelperTrackerCheckMetadataForApp;
  if (!Count)
    return 0;
  os_unfair_lock_lock((os_unfair_lock_t)&ne_helper_tracker_lock);
  if (!ne_tracker_build_cache() || Count < 1)
  {
LABEL_15:
    os_unfair_lock_unlock((os_unfair_lock_t)&ne_helper_tracker_lock);
    return 0;
  }
  v12 = 0;
  while (1)
  {
    ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(theArray, v12);
    if (CFStringGetCString(ValueAtIndex, NEHelperTrackerGetDispositionRedactLogs_buffer, 254, 0x8000100u))
    {
      if (NEHelperTrackerMatchDomain((_DWORD *)a1, NEHelperTrackerGetDispositionRedactLogs_buffer, (uint64_t)v11, a3, &v15, a5))
      {
        break;
      }
    }
    if (Count == ++v12)
      goto LABEL_15;
  }
  if (a4)
    *a4 = v12;
  os_unfair_lock_unlock((os_unfair_lock_t)&ne_helper_tracker_lock);
  if (v15)
    return 1;
  else
    return 3;
}

uint64_t NEHelperTrackerCheckMetadataForWeb(uint64_t result)
{
  if (result)
    return ne_tracker_context_is_from_web_list();
  return result;
}

uint64_t NEHelperTrackerGetDispositionForDomain(_DWORD *a1, char *__s, _QWORD *a3, int a4)
{
  size_t v8;
  NSObject *v9;
  uint64_t result;
  const char *v11;
  int v12;
  char v13;
  const char *v14;
  const char *v15;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  uint32_t v19;
  const char *v20;
  int v21;
  char v22;
  const char *v23;
  const char *v24;
  NSObject *v25;
  uint32_t v26;
  const char *v27;
  const char *v28;
  int v29;
  const char *v30;
  char v31;
  uint64_t (*v32)(uint64_t);
  char v33;
  _BOOL4 matched;
  const char *v35;
  int v36;
  const char *v37;
  char v38;
  char v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  _BYTE v43[14];
  __int16 v44;
  _BYTE v45[10];
  _BYTE v46[10];
  __int16 v47;
  const char *v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  const char *v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v39 = 0;
  if (__s)
  {
    v8 = strlen(__s);
    if (a1)
      goto LABEL_3;
LABEL_18:
    v17 = ne_log_obj();
    result = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
    if (a4)
    {
      if (!(_DWORD)result)
        return result;
      *(_DWORD *)buf = 136317187;
      v41 = "NEHelperTrackerGetDispositionForDomain";
      v42 = 2160;
      if (__s)
        v18 = __s;
      else
        v18 = "n/a";
      *(_QWORD *)v43 = 1752392040;
      *(_WORD *)&v43[8] = 1040;
      *(_DWORD *)&v43[10] = v8;
      v44 = 2101;
      *(_QWORD *)v45 = v18;
      *(_WORD *)&v45[8] = 1024;
      *(_DWORD *)v46 = 0;
      *(_WORD *)&v46[4] = 1024;
      *(_DWORD *)&v46[6] = 0;
      v47 = 2080;
      v48 = "n/a";
      v49 = 2080;
      v50 = "n/a";
      v51 = 2080;
      v52 = "App";
      v15 = "%s Invalid app info for domain%{sensitive, mask.hash, networkextension:string}.*P (app info ref %X pid %d for %s) %s - %s";
      v16 = v17;
      goto LABEL_24;
    }
    if (!(_DWORD)result)
      return result;
    *(_DWORD *)buf = 136316931;
    v41 = "NEHelperTrackerGetDispositionForDomain";
    v42 = 1024;
    if (__s)
      v27 = __s;
    else
      v27 = "n/a";
    *(_DWORD *)v43 = v8;
    *(_WORD *)&v43[4] = 2081;
    *(_QWORD *)&v43[6] = v27;
    v44 = 1024;
    *(_DWORD *)v45 = 0;
    *(_WORD *)&v45[4] = 1024;
    *(_DWORD *)&v45[6] = 0;
    *(_WORD *)v46 = 2080;
    *(_QWORD *)&v46[2] = "n/a";
    v47 = 2080;
    v48 = "n/a";
    v49 = 2080;
    v50 = "App";
    v15 = "%s: Invalid app info for domain<%d : %{private}s> (app info ref %X pid %d for %s) %s - %s";
    v16 = v17;
LABEL_54:
    v19 = 70;
    goto LABEL_55;
  }
  v8 = 0;
  if (!a1)
    goto LABEL_18;
LABEL_3:
  v9 = ne_log_obj();
  result = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if (v8 - 254 <= 0xFFFFFFFFFFFFFF02)
  {
    if (a4)
    {
      if (!(_DWORD)result)
        return result;
      if (__s)
        v11 = __s;
      else
        v11 = "n/a";
      v12 = a1[14];
      if (!v12)
      {
        v12 = a1[7];
        if (!v12)
        {
          v12 = a1[30];
          if (!v12)
            v12 = a1[23];
        }
      }
      v13 = a1[31];
      v41 = "NEHelperTrackerGetDispositionForDomain";
      *(_DWORD *)buf = 136317187;
      v42 = 2160;
      if ((v13 & 1) != 0)
        v14 = "Web";
      else
        v14 = "App";
      *(_QWORD *)v43 = 1752392040;
      *(_WORD *)&v43[8] = 1040;
      *(_DWORD *)&v43[10] = v8;
      v44 = 2101;
      *(_QWORD *)v45 = v11;
      *(_WORD *)&v45[8] = 1024;
      *(_DWORD *)v46 = (_DWORD)a1;
      *(_WORD *)&v46[4] = 1024;
      *(_DWORD *)&v46[6] = v12;
      v47 = 2080;
      v48 = "n/a";
      v49 = 2080;
      v50 = "n/a";
      v51 = 2080;
      v52 = v14;
      v15 = "%s Invalid domain length%{sensitive, mask.hash, networkextension:string}.*P (app info ref %X pid %d for %s) %s - %s";
      v16 = v9;
LABEL_24:
      v19 = 80;
LABEL_55:
      _os_log_debug_impl(&dword_208439000, v16, OS_LOG_TYPE_DEBUG, v15, buf, v19);
      return 0;
    }
    if (!(_DWORD)result)
      return result;
    if (__s)
      v28 = __s;
    else
      v28 = "n/a";
    v29 = a1[14];
    if (!v29)
    {
      v29 = a1[7];
      if (!v29)
      {
        v29 = a1[30];
        if (!v29)
          v29 = a1[23];
      }
    }
    v30 = "Web";
    v31 = a1[31];
    v41 = "NEHelperTrackerGetDispositionForDomain";
    *(_DWORD *)buf = 136316931;
    v42 = 1024;
    if ((v31 & 1) == 0)
      v30 = "App";
    *(_DWORD *)v43 = v8;
    *(_WORD *)&v43[4] = 2081;
    *(_QWORD *)&v43[6] = v28;
    v44 = 1024;
    *(_DWORD *)v45 = (_DWORD)a1;
    *(_WORD *)&v45[4] = 1024;
    *(_DWORD *)&v45[6] = v29;
    *(_WORD *)v46 = 2080;
    *(_QWORD *)&v46[2] = "n/a";
    v47 = 2080;
    v48 = "n/a";
    v49 = 2080;
    v50 = v30;
    v15 = "%s: Invalid domain length<%d : %{private}s> (app info ref %X pid %d for %s) %s - %s";
    v16 = v9;
    goto LABEL_54;
  }
  if (a4)
  {
    if (!(_DWORD)result)
      goto LABEL_57;
    if (__s)
      v20 = __s;
    else
      v20 = "n/a";
    v21 = a1[14];
    if (!v21)
    {
      v21 = a1[7];
      if (!v21)
      {
        v21 = a1[30];
        if (!v21)
          v21 = a1[23];
      }
    }
    v22 = a1[31];
    v41 = "NEHelperTrackerGetDispositionForDomain";
    *(_DWORD *)buf = 136317187;
    v42 = 2160;
    if ((v22 & 1) != 0)
      v23 = "Web";
    else
      v23 = "App";
    *(_QWORD *)v43 = 1752392040;
    *(_WORD *)&v43[8] = 1040;
    *(_DWORD *)&v43[10] = v8;
    v44 = 2101;
    *(_QWORD *)v45 = v20;
    *(_WORD *)&v45[8] = 1024;
    *(_DWORD *)v46 = (_DWORD)a1;
    *(_WORD *)&v46[4] = 1024;
    *(_DWORD *)&v46[6] = v21;
    v47 = 2080;
    v48 = "n/a";
    v49 = 2080;
    v50 = "n/a";
    v51 = 2080;
    v52 = v23;
    v24 = "%s domain lookup for%{sensitive, mask.hash, networkextension:string}.*P (app info ref %X pid %d for %s) %s - %s";
    v25 = v9;
    v26 = 80;
  }
  else
  {
    if (!(_DWORD)result)
      goto LABEL_57;
    if (__s)
      v35 = __s;
    else
      v35 = "n/a";
    v36 = a1[14];
    if (!v36)
    {
      v36 = a1[7];
      if (!v36)
      {
        v36 = a1[30];
        if (!v36)
          v36 = a1[23];
      }
    }
    v37 = "Web";
    v38 = a1[31];
    v41 = "NEHelperTrackerGetDispositionForDomain";
    *(_DWORD *)buf = 136316931;
    v42 = 1024;
    if ((v38 & 1) == 0)
      v37 = "App";
    *(_DWORD *)v43 = v8;
    *(_WORD *)&v43[4] = 2081;
    *(_QWORD *)&v43[6] = v35;
    v44 = 1024;
    *(_DWORD *)v45 = (_DWORD)a1;
    *(_WORD *)&v45[4] = 1024;
    *(_DWORD *)&v45[6] = v36;
    *(_WORD *)v46 = 2080;
    *(_QWORD *)&v46[2] = "n/a";
    v47 = 2080;
    v48 = "n/a";
    v49 = 2080;
    v50 = v37;
    v24 = "%s: domain lookup for<%d : %{private}s> (app info ref %X pid %d for %s) %s - %s";
    v25 = v9;
    v26 = 70;
  }
  _os_log_debug_impl(&dword_208439000, v25, OS_LOG_TYPE_DEBUG, v24, buf, v26);
LABEL_57:
  if ((a1[31] & 1) != 0)
    v32 = NEHelperTrackerCheckMetadataForWeb;
  else
    v32 = NEHelperTrackerCheckMetadataForApp;
  os_unfair_lock_lock((os_unfair_lock_t)&ne_helper_tracker_lock);
  buf[0] = 0;
  v33 = ne_tracker_build_cache();
  if (buf[0])
    +[NEDiagnosticReport logInternalError:subType:context:](NEDiagnosticReport, "logInternalError:subType:context:", CFSTR("Tracker"), CFSTR("FailedtoReadMMAPFile"), 0);
  if ((v33 & 1) == 0)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&ne_helper_tracker_lock);
    return 0;
  }
  strncpy(NEHelperTrackerGetDispositionForDomain_buffer, __s, 0xFDuLL);
  NEHelperTrackerGetDispositionForDomain_buffer[v8] = 0;
  matched = NEHelperTrackerMatchDomain(a1, NEHelperTrackerGetDispositionForDomain_buffer, (uint64_t)v32, a3, &v39, a4);
  os_unfair_lock_unlock((os_unfair_lock_t)&ne_helper_tracker_lock);
  if (!matched)
    return 0;
  if (v39)
    return 1;
  else
    return 3;
}

void NEHelperTrackerClearCache()
{
  os_unfair_lock_lock((os_unfair_lock_t)&ne_helper_tracker_lock);
  if (qword_253D8F530)
    ne_tracker_clear_cache();
  os_unfair_lock_unlock((os_unfair_lock_t)&ne_helper_tracker_lock);
}

uint64_t NEHelperTrackerAppendTLV(uint64_t a1, char a2, size_t __n, void *__src)
{
  uint64_t v5;

  *(_BYTE *)a1 = a2;
  *(_DWORD *)(a1 + 1) = __n;
  if ((_DWORD)__n)
  {
    v5 = __n;
    memcpy((void *)(a1 + 5), __src, __n);
  }
  else
  {
    v5 = 0;
  }
  return a1 + v5 + 5;
}

_BYTE *NEHelperTrackerParseTLV(uint64_t a1, _BYTE *a2, _DWORD *a3, _QWORD *a4)
{
  _BYTE *result;
  uint64_t v7;
  _BYTE *v8;
  int v9;
  NSObject *v10;
  const char *v11;
  unint64_t v12;
  int v13;
  _BOOL4 v14;
  NSObject *v15;
  uint32_t v16;
  int v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  _BYTE *v24;
  uint64_t v25;

  result = 0;
  v25 = *MEMORY[0x24BDAC8D0];
  if (a1 && a2 && a3 && a4)
  {
    *a2 = *(_BYTE *)a1;
    v7 = *(unsigned int *)(a1 + 1);
    *a3 = v7;
    v8 = (_BYTE *)(a1 + 5);
    *a4 = a1 + 5;
    v9 = *a2;
    switch((int)v7)
    {
      case 0:
        v10 = ne_log_obj();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          v17 = 136315650;
          v18 = "NEHelperTrackerTLVLog";
          v19 = 1024;
          v20 = v9;
          v21 = 1024;
          v22 = 0;
          v11 = "%s: Parsed TLV - type %d length %d";
          goto LABEL_19;
        }
        goto LABEL_24;
      case 1:
        v12 = *v8;
        if (*v8)
          goto LABEL_13;
        goto LABEL_16;
      case 2:
        v12 = *(unsigned __int16 *)v8;
        if (!*(_WORD *)v8)
          goto LABEL_16;
        goto LABEL_13;
      case 4:
        v12 = *(unsigned int *)v8;
        if (*(_DWORD *)v8)
          goto LABEL_13;
        goto LABEL_16;
      case 8:
        v12 = *(_QWORD *)v8;
        if (!*(_QWORD *)v8)
          goto LABEL_16;
LABEL_13:
        v10 = ne_log_obj();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          goto LABEL_24;
        v17 = 136315906;
        v18 = "NEHelperTrackerTLVLog";
        v19 = 1024;
        v20 = v9;
        v21 = 1024;
        v22 = v7;
        v23 = 2048;
        v24 = (_BYTE *)v12;
        v11 = "%s: Parsed TLV - type %d length %d value %llu";
        goto LABEL_22;
      default:
LABEL_16:
        v13 = v8[v7 - 1];
        v10 = ne_log_obj();
        v14 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
        if (v13)
        {
          if (!v14)
            goto LABEL_24;
          v17 = 136315650;
          v18 = "NEHelperTrackerTLVLog";
          v19 = 1024;
          v20 = v9;
          v21 = 1024;
          v22 = v7;
          v11 = "%s: Parsed TLV - type %d length %d";
LABEL_19:
          v15 = v10;
          v16 = 24;
        }
        else
        {
          if (!v14)
            goto LABEL_24;
          v17 = 136315906;
          v18 = "NEHelperTrackerTLVLog";
          v19 = 1024;
          v20 = v9;
          v21 = 1024;
          v22 = v7;
          v23 = 2080;
          v24 = v8;
          v11 = "%s: Parsed TLV - type %d length %d value <%s>";
LABEL_22:
          v15 = v10;
          v16 = 34;
        }
        _os_log_debug_impl(&dword_208439000, v15, OS_LOG_TYPE_DEBUG, v11, (uint8_t *)&v17, v16);
LABEL_24:
        result = &v8[*a3];
        break;
    }
  }
  return result;
}

BOOL NEHelperTrackerAddIPForAllFlowsRedactLogs(int a1, int a2, _DWORD **a3, int a4, _DWORD *a5, unint64_t a6, CFStringRef theString, int a8)
{
  _DWORD **v9;
  const char *v15;
  size_t v16;
  size_t v17;
  size_t v18;
  size_t v19;
  int v20;
  NSObject *v21;
  _BOOL8 result;
  const char *v23;
  const char *v24;
  NSObject *v25;
  uint32_t v26;
  NSObject *v27;
  NSObject *v28;
  size_t v29;
  size_t v30;
  int v32;
  int v33;
  int v34;
  int v35;
  uint64_t v36;
  _OWORD *v37;
  uint64_t v38;
  int v39;
  int v40;
  uint8_t *v41;
  int v42;
  uint8_t *v43;
  NSObject *v44;
  _BOOL4 v45;
  int v46;
  NSObject *v47;
  const char *v48;
  uint32_t v49;
  int v50;
  NSObject *v51;
  int v52;
  NSObject *v53;
  _BOOL4 v54;
  int v55;
  NSObject *v56;
  const char *v57;
  uint32_t v58;
  int v59;
  int v60;
  NSObject *v61;
  NSObject *v62;
  int v63;
  int v64;
  int v65;
  _OWORD *v66;
  int v67;
  uint64_t v68;
  uint64_t v69;
  char *__s;
  uint8_t v71[4];
  const char *v72;
  __int16 v73;
  _BYTE v74[14];
  __int16 v75;
  _BYTE v76[20];
  __int128 v77;
  __int128 v78;
  uint64_t v79;
  _BYTE v80[6];
  __int16 v81;
  char *v82;
  __int16 v83;
  int v84;
  __int16 v85;
  int v86;
  __int16 v87;
  int v88;
  char v89[16];
  __int128 v90;
  __int128 v91;
  __int128 v92;
  uint8_t buf[32];
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  unsigned __int8 uu[8];
  uint64_t v101;
  char out[48];
  _OWORD v103[16];
  _OWORD v104[16];
  _OWORD v105[12];
  uint64_t v106;
  uint64_t v107;

  v9 = a3;
  v107 = *MEMORY[0x24BDAC8D0];
  v106 = 0;
  memset(v105, 0, sizeof(v105));
  memset(v104, 0, 254);
  memset(v103, 0, 254);
  memset(out, 0, 37);
  *(_QWORD *)uu = 0;
  v101 = 0;
  if (!a3 || !a4)
  {
    v21 = ne_log_obj();
    result = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (!(_DWORD)result)
      return result;
    v23 = "is not";
    *(_QWORD *)&buf[4] = "NEHelperTrackerAddIPForAllFlowsRedactLogs";
    *(_DWORD *)buf = 136315650;
    if (!v9)
      v23 = "is";
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = v23;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = a4;
    v24 = "%s: Invalid parameters - addresses %s null, count %d";
    v25 = v21;
    v26 = 28;
    goto LABEL_47;
  }
  if (a2 != 2 && a2 != 30)
  {
    v27 = ne_log_obj();
    result = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
    if (!(_DWORD)result)
      return result;
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "NEHelperTrackerAddIPForAllFlowsRedactLogs";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = a2;
    v24 = "%s: Invalid parameters - address family must be IPv4 / IPv6 (%d)";
    v25 = v27;
    v26 = 18;
    goto LABEL_47;
  }
  if (!a5)
  {
    v28 = ne_log_obj();
    result = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (!(_DWORD)result)
      return result;
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "NEHelperTrackerAddIPForAllFlowsRedactLogs";
    v24 = "%s: Invalid parameters - app_info_ref is null";
    goto LABEL_46;
  }
  if (a1)
  {
    if (!a6)
    {
      v28 = ne_log_obj();
      result = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
      if (!(_DWORD)result)
        return result;
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "NEHelperTrackerAddIPForAllFlowsRedactLogs";
      v24 = "%s: Invalid parameters - trackerDomainContextRef is null";
      goto LABEL_46;
    }
    v15 = (const char *)NEHelperTrackerContextCopyDomain(a6, (char *)v104, 254, 0);
    __s = (char *)NEHelperTrackerContextCopyDomainOwner(a6, (char *)v103, 254, 0);
    if (!v15 || !__s)
    {
      v28 = ne_log_obj();
      result = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
      if (!(_DWORD)result)
        return result;
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "NEHelperTrackerAddIPForAllFlowsRedactLogs";
      v24 = "%s: Failed to get domain/owner from context";
      goto LABEL_46;
    }
    v16 = strlen(v15);
    if (v16 >= 2)
    {
      v17 = v16 - 1;
      if (v15[v16 - 1] == 46)
      {
        __strncpy_chk();
        ne_session_trim_domain_domain_buffer[v17] = 0;
        v15 = ne_session_trim_domain_domain_buffer;
      }
    }
    v18 = strlen(v15);
    v19 = strlen(__s) + 1;
    v20 = (a1 == 3) | 2;
  }
  else
  {
    if (!theString
      || !CFStringGetCString(theString, NEHelperTrackerAddIPForAllFlowsRedactLogs_buffer, 254, 0x8000100u))
    {
      v28 = ne_log_obj();
      result = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
      if (!(_DWORD)result)
        return result;
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "NEHelperTrackerAddIPForAllFlowsRedactLogs";
      v24 = "%s: Invalid parameters - original domain NULL / invalid for NEHelperTrackerDispositionNotTracker";
      goto LABEL_46;
    }
    v15 = NEHelperTrackerAddIPForAllFlowsRedactLogs_buffer;
    v29 = strlen(NEHelperTrackerAddIPForAllFlowsRedactLogs_buffer);
    if (v29 >= 2)
    {
      v30 = v29 - 1;
      if (NEHelperTrackerAddIPForAllFlowsRedactLogs_buffer[v29 - 1] == 46)
      {
        v15 = ne_session_trim_domain_domain_buffer;
        __strncpy_chk();
        ne_session_trim_domain_domain_buffer[v30] = 0;
      }
    }
    v18 = strlen(v15);
    __s = 0;
    v19 = 0;
    v20 = 0;
  }
  v68 = v18 + 1;
  v69 = v19;
  if (v19 >= 0x40 || v18 + 1 >= 0x40)
    v32 = v20;
  else
    v32 = v20 | 4;
  if ((NEHelperTrackerGetAppUUID((uint64_t)a5, uu) & 1) == 0)
  {
    v28 = ne_log_obj();
    result = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (!(_DWORD)result)
      return result;
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "NEHelperTrackerAddIPForAllFlowsRedactLogs";
    v24 = "%s: Failed to get app UUID from app_info_ref";
    goto LABEL_46;
  }
  if (uuid_is_null(uu))
  {
    v28 = ne_log_obj();
    result = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    if (!(_DWORD)result)
      return result;
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "NEHelperTrackerAddIPForAllFlowsRedactLogs";
    v24 = "%s: NULL app UUID";
    goto LABEL_46;
  }
  if (a2 == 2)
    v33 = 16;
  else
    v33 = 28;
  v34 = NEHelperTrackerCalculateParameterLen(a2, v33, uu, (uint64_t)v15, v68, (uint64_t)__s, v69, v32);
  if (v34)
  {
    v67 = v34;
    if (v34 < 201)
    {
      v66 = v105;
    }
    else
    {
      v66 = malloc_type_malloc(v34, 0xD400DD07uLL);
      if (!v66)
      {
        v28 = ne_log_obj();
        result = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
        if ((_DWORD)result)
        {
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = "NEHelperTrackerAddIPForAllFlowsRedactLogs";
          v24 = "%s: Failed to allocate parameter buffer";
LABEL_46:
          v25 = v28;
          v26 = 12;
LABEL_47:
          _os_log_error_impl(&dword_208439000, v25, OS_LOG_TYPE_ERROR, v24, buf, v26);
          return 0;
        }
        return result;
      }
    }
    v98 = 0u;
    v99 = 0u;
    v96 = 0u;
    v97 = 0u;
    v94 = 0u;
    v95 = 0u;
    memset(buf, 0, sizeof(buf));
    buf[1] = a2;
    if (a4 < 1)
    {
      v35 = 0;
LABEL_115:
      v37 = v66;
LABEL_116:
      if (v37 != v105)
        free(v37);
      return v35 == 0;
    }
    v35 = 0;
    v65 = v32;
    v63 = v32 & 2;
    v64 = v32 & 1;
    v36 = a4;
    v37 = v66;
    while (1)
    {
      if (a2 == 30)
      {
        buf[0] = 28;
        *(_OWORD *)&buf[8] = *(_OWORD *)*v9;
        v38 = v69;
      }
      else
      {
        v38 = v69;
        if (a2 != 2)
        {
          v62 = ne_log_obj();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v71 = 136315394;
            v72 = "NEHelperTrackerAddIPForAllFlowsRedactLogs";
            v73 = 1024;
            *(_DWORD *)v74 = a2;
            _os_log_error_impl(&dword_208439000, v62, OS_LOG_TYPE_ERROR, "%s: Address with invalid family %d", v71, 0x12u);
          }
          v35 = 0;
          goto LABEL_116;
        }
        buf[0] = 16;
        *(_DWORD *)&buf[4] = **v9;
      }
      v39 = NEHelperTrackerFillParameters((char *)v37, v67, a2, buf, uu, v15, v68, __s, v38, v65);
      if (v39 != v67)
      {
        v60 = v39;
        v61 = ne_log_obj();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v71 = 136315650;
          v72 = "NEHelperTrackerAddIPForAllFlowsRedactLogs";
          v73 = 1024;
          *(_DWORD *)v74 = v67;
          *(_WORD *)&v74[4] = 1024;
          *(_DWORD *)&v74[6] = v60;
          _os_log_error_impl(&dword_208439000, v61, OS_LOG_TYPE_ERROR, "%s: Failed to fill parameters <calculated len %d result len %d>", v71, 0x18u);
        }
        goto LABEL_115;
      }
      v35 = tracker_action(1, (char *)v37, v67);
      if (v35)
        break;
      if (nelog_is_debug_logging_enabled())
      {
        v91 = 0u;
        v92 = 0u;
        *(_OWORD *)v89 = 0u;
        v90 = 0u;
        if (a2 == 2)
        {
          v42 = 2;
          v43 = &buf[4];
        }
        else
        {
          v42 = 30;
          v43 = &buf[8];
        }
        inet_ntop(v42, v43, v89, 0x40u);
        uuid_unparse_lower(uu, out);
        v51 = ne_log_obj();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          v52 = a5[14];
          if (!v52)
          {
            v52 = a5[7];
            if (!v52)
            {
              v52 = a5[30];
              if (!v52)
                v52 = a5[23];
            }
          }
          *(_DWORD *)v71 = 136316162;
          v72 = "NEHelperTrackerAddIPForAllFlowsRedactLogs";
          v73 = 1024;
          *(_DWORD *)v74 = v52;
          *(_WORD *)&v74[4] = 2080;
          *(_QWORD *)&v74[6] = out;
          v75 = 1024;
          *(_DWORD *)v76 = v64;
          *(_WORD *)&v76[4] = 1024;
          *(_DWORD *)&v76[6] = v63;
          _os_log_impl(&dword_208439000, v51, OS_LOG_TYPE_DEFAULT, "%s: completed for app <%d : %s> <app approved %d> <is_tracker %d>", v71, 0x28u);
        }
        v53 = ne_log_obj();
        v54 = os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG);
        if (a8)
        {
          if (v54)
          {
            v55 = a5[14];
            if (!v55)
            {
              v55 = a5[7];
              if (!v55)
              {
                v55 = a5[30];
                if (!v55)
                  v55 = a5[23];
              }
            }
            *(_DWORD *)v71 = 136318723;
            v72 = "NEHelperTrackerAddIPForAllFlowsRedactLogs";
            v73 = 2160;
            *(_QWORD *)v74 = 1752392040;
            *(_WORD *)&v74[8] = 1040;
            *(_DWORD *)&v74[10] = v68;
            v75 = 2101;
            *(_QWORD *)v76 = v15;
            *(_WORD *)&v76[8] = 2160;
            *(_QWORD *)&v76[10] = 1752392040;
            *(_WORD *)&v76[18] = 1040;
            LODWORD(v77) = v69;
            WORD2(v77) = 2101;
            *(_QWORD *)((char *)&v77 + 6) = __s;
            HIWORD(v77) = 1024;
            LODWORD(v78) = v55;
            WORD2(v78) = 2080;
            *(_QWORD *)((char *)&v78 + 6) = out;
            HIWORD(v78) = 2160;
            v79 = 1752392040;
            *(_WORD *)v80 = 1040;
            *(_DWORD *)&v80[2] = 64;
            v81 = 2101;
            v82 = v89;
            v83 = 1024;
            v84 = v64;
            v85 = 1024;
            v86 = v63;
            v87 = 1024;
            v88 = 0;
            v56 = v53;
            v57 = "%s: completed for%{sensitive, mask.hash, networkextension:string}.*P %{sensitive, mask.hash, networkex"
                  "tension:string}.*P app <%d : %s> %{sensitive, mask.hash, networkextension:string}.*P <app approved %d>"
                  " <is_tracker %d> (error = %d)";
            v58 = 124;
            goto LABEL_111;
          }
        }
        else if (v54)
        {
          v59 = a5[14];
          if (!v59)
          {
            v59 = a5[7];
            if (!v59)
            {
              v59 = a5[30];
              if (!v59)
                v59 = a5[23];
            }
          }
          *(_DWORD *)v71 = 136317955;
          v72 = "NEHelperTrackerAddIPForAllFlowsRedactLogs";
          v73 = 1024;
          *(_DWORD *)v74 = v68;
          *(_WORD *)&v74[4] = 2081;
          *(_QWORD *)&v74[6] = v15;
          v75 = 1024;
          *(_DWORD *)v76 = v69;
          *(_WORD *)&v76[4] = 2081;
          *(_QWORD *)&v76[6] = __s;
          *(_WORD *)&v76[14] = 1024;
          *(_DWORD *)&v76[16] = v59;
          LOWORD(v77) = 2080;
          *(_QWORD *)((char *)&v77 + 2) = out;
          WORD5(v77) = 1024;
          HIDWORD(v77) = 64;
          LOWORD(v78) = 2081;
          *(_QWORD *)((char *)&v78 + 2) = v89;
          WORD5(v78) = 1024;
          HIDWORD(v78) = v64;
          LOWORD(v79) = 1024;
          *(_DWORD *)((char *)&v79 + 2) = v63;
          HIWORD(v79) = 1024;
          *(_DWORD *)v80 = 0;
          v56 = v53;
          v57 = "%s: completed for<%d : %{private}s> <%d : %{private}s> app <%d : %s> <%d : %{private}s> <app approved %d"
                "> <is_tracker %d> (error = %d)";
          v58 = 94;
LABEL_111:
          _os_log_debug_impl(&dword_208439000, v56, OS_LOG_TYPE_DEBUG, v57, v71, v58);
        }
LABEL_103:
        v37 = v66;
      }
      ++v9;
      if (!--v36)
        goto LABEL_116;
    }
    v91 = 0u;
    v92 = 0u;
    *(_OWORD *)v89 = 0u;
    v90 = 0u;
    if (a2 == 2)
    {
      v40 = 2;
      v41 = &buf[4];
    }
    else
    {
      v40 = 30;
      v41 = &buf[8];
    }
    inet_ntop(v40, v41, v89, 0x40u);
    uuid_unparse_lower(uu, out);
    v44 = ne_log_obj();
    v45 = os_log_type_enabled(v44, OS_LOG_TYPE_ERROR);
    if (a8)
    {
      if (!v45)
        goto LABEL_103;
      v46 = a5[14];
      if (!v46)
      {
        v46 = a5[7];
        if (!v46)
        {
          v46 = a5[30];
          if (!v46)
            v46 = a5[23];
        }
      }
      *(_DWORD *)v71 = 136318723;
      v72 = "NEHelperTrackerAddIPForAllFlowsRedactLogs";
      v73 = 2160;
      *(_QWORD *)v74 = 1752392040;
      *(_WORD *)&v74[8] = 1040;
      *(_DWORD *)&v74[10] = v68;
      v75 = 2101;
      *(_QWORD *)v76 = v15;
      *(_WORD *)&v76[8] = 2160;
      *(_QWORD *)&v76[10] = 1752392040;
      *(_WORD *)&v76[18] = 1040;
      LODWORD(v77) = v69;
      WORD2(v77) = 2101;
      *(_QWORD *)((char *)&v77 + 6) = __s;
      HIWORD(v77) = 1024;
      LODWORD(v78) = v46;
      WORD2(v78) = 2080;
      *(_QWORD *)((char *)&v78 + 6) = out;
      HIWORD(v78) = 2160;
      v79 = 1752392040;
      *(_WORD *)v80 = 1040;
      *(_DWORD *)&v80[2] = 64;
      v81 = 2101;
      v82 = v89;
      v83 = 1024;
      v84 = v64;
      v85 = 1024;
      v86 = v63;
      v87 = 1024;
      v88 = v35;
      v47 = v44;
      v48 = "%s: failed for%{sensitive, mask.hash, networkextension:string}.*P %{sensitive, mask.hash, networkextension:s"
            "tring}.*P app <%d : %s> %{sensitive, mask.hash, networkextension:string}.*P <app approved %d> <is_tracker %d> (error = %d)";
      v49 = 124;
    }
    else
    {
      if (!v45)
        goto LABEL_103;
      v50 = a5[14];
      if (!v50)
      {
        v50 = a5[7];
        if (!v50)
        {
          v50 = a5[30];
          if (!v50)
            v50 = a5[23];
        }
      }
      *(_DWORD *)v71 = 136317955;
      v72 = "NEHelperTrackerAddIPForAllFlowsRedactLogs";
      v73 = 1024;
      *(_DWORD *)v74 = v68;
      *(_WORD *)&v74[4] = 2081;
      *(_QWORD *)&v74[6] = v15;
      v75 = 1024;
      *(_DWORD *)v76 = v69;
      *(_WORD *)&v76[4] = 2081;
      *(_QWORD *)&v76[6] = __s;
      *(_WORD *)&v76[14] = 1024;
      *(_DWORD *)&v76[16] = v50;
      LOWORD(v77) = 2080;
      *(_QWORD *)((char *)&v77 + 2) = out;
      WORD5(v77) = 1024;
      HIDWORD(v77) = 64;
      LOWORD(v78) = 2081;
      *(_QWORD *)((char *)&v78 + 2) = v89;
      WORD5(v78) = 1024;
      HIDWORD(v78) = v64;
      LOWORD(v79) = 1024;
      *(_DWORD *)((char *)&v79 + 2) = v63;
      HIWORD(v79) = 1024;
      *(_DWORD *)v80 = v35;
      v47 = v44;
      v48 = "%s: failed for<%d : %{private}s> <%d : %{private}s> app <%d : %s> <%d : %{private}s> <app approved %d> <is_t"
            "racker %d> (error = %d)";
      v49 = 94;
    }
    _os_log_error_impl(&dword_208439000, v47, OS_LOG_TYPE_ERROR, v48, v71, v49);
    goto LABEL_103;
  }
  v28 = ne_log_obj();
  result = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
  if ((_DWORD)result)
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "NEHelperTrackerAddIPForAllFlowsRedactLogs";
    v24 = "%s: Failed to get calculate parameter size";
    goto LABEL_46;
  }
  return result;
}

BOOL NEHelperTrackerAddIPWithDisposition(int a1, int a2, _DWORD **a3, int a4, _DWORD *a5, unint64_t a6)
{
  return NEHelperTrackerAddIPForAllFlowsRedactLogs(a1, a2, a3, a4, a5, a6, 0, 0);
}

BOOL NEHelperTrackerAddIP(int a1, _DWORD **a2, int a3, _DWORD *a4, unint64_t a5)
{
  return NEHelperTrackerAddIPForAllFlowsRedactLogs(1, a1, a2, a3, a4, a5, 0, 0);
}

BOOL NEHelperTrackerDumpIPEntries(int a1, char *buffer, size_t buffer_size, char *a4, size_t a5)
{
  _BOOL8 result;
  int v11;
  int v12;
  _OWORD *v13;
  void *v14;
  int v15;
  int v16;
  NSObject *v17;
  const char *v18;
  uint8_t *v19;
  NSObject *v20;
  uint32_t v21;
  uint64_t v22;
  NSObject *v23;
  int v24;
  int v25;
  char *v26;
  int v27;
  char *v28;
  char *v29;
  size_t v30;
  char *v31;
  char *v32;
  int v33;
  int v34;
  int v35;
  uint8_t *v36;
  int v37;
  uint64_t v38;
  const char *v39;
  int v40;
  const char *v41;
  int v42;
  const char *v43;
  NSObject *v44;
  uint64_t v45;
  char *v46;
  int v47;
  uint8_t v48;
  int v49;
  int v50;
  char *v51;
  unsigned int v52;
  char v53;
  char v54[32];
  __int128 v55;
  __int128 v56;
  uint8_t buf[32];
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  unsigned __int8 uu[16];
  char out[40];
  uint64_t v66;

  result = 0;
  v66 = *MEMORY[0x24BDAC8D0];
  v53 = 0;
  v52 = 0;
  v51 = 0;
  if (buffer)
  {
    if (buffer_size)
    {
      result = 0;
      if (a4)
      {
        if (a5 >= 0xFA)
        {
          v11 = 0;
          memset(out, 0, 37);
          memset(uu, 0, sizeof(uu));
          v12 = 3;
          if (a1 && (int)buffer_size >= 21)
          {
            v13 = malloc_type_malloc(0x80uLL, 0x1050040CA3BB8F4uLL);
            if (v13)
            {
              v14 = v13;
              v13[6] = 0u;
              v13[7] = 0u;
              v13[4] = 0u;
              v13[5] = 0u;
              v13[2] = 0u;
              v13[3] = 0u;
              *v13 = 0u;
              v13[1] = 0u;
              *((_DWORD *)v13 + 30) = a1;
              if (NEHelperTrackerGetAppUUID((uint64_t)v13, uu) && !uuid_is_null(uu))
              {
                *buffer = 3;
                *(_DWORD *)(buffer + 1) = 16;
                *(_OWORD *)(buffer + 5) = *(_OWORD *)uu;
                uuid_unparse_lower(uu, out);
                v11 = snprintf(a4, a5, "\n* Filter by pid %d (%s)\n\n", a1, out);
                uuid_clear(uu);
                memset(out, 0, 37);
                v12 = 2;
              }
              else
              {
                v11 = 0;
              }
              free(v14);
            }
            else
            {
              v11 = 0;
            }
          }
          v15 = tracker_action(v12, buffer, buffer_size);
          if (v15)
          {
            v16 = v15;
            v17 = ne_log_obj();
            result = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
            if (!result)
              return result;
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)&buf[4] = "NEHelperTrackerDumpIPEntries";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v16;
            v18 = "%s: Failed to dump tracker IP table entries <error %d>";
LABEL_16:
            v19 = buf;
            goto LABEL_17;
          }
          v22 = *(unsigned int *)buffer;
          v23 = ne_log_obj();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)&buf[4] = "NEHelperTrackerDumpIPEntries";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v22;
            _os_log_debug_impl(&dword_208439000, v23, OS_LOG_TYPE_DEBUG, "%s: received tlv buffer size is %d", buf, 0x12u);
          }
          v24 = snprintf(&a4[v11], a5 - v11, "%5s %36s %6s %40s %11s %s\n%5s %36s %6s %40s %11s %s\n", "Count", "App UUID", "Family", "Address", "Flags", "Domain - Owner", "=====", "========", "======", "=======", "=====", "==============");
          if ((_DWORD)v22)
          {
            v48 = 0;
            v49 = 0;
            v50 = 0;
            v25 = 0;
            v26 = &buffer[v22 + 4];
            v27 = v24 + v11;
            v28 = buffer + 4;
            v46 = v26;
            v45 = 0;
            do
            {
              v29 = NEHelperTrackerParseTLV((uint64_t)v28, &v53, &v52, &v51);
              if (!v29)
                break;
              v30 = a5 - v27;
              if (v30 <= 0xF9)
              {
                v44 = ne_log_obj();
                result = os_log_type_enabled(v44, OS_LOG_TYPE_ERROR);
                if (!result)
                  return result;
                *(_DWORD *)buf = 136315138;
                *(_QWORD *)&buf[4] = "NEHelperTrackerDumpIPEntries";
                v18 = "%s: Failed to dump tracker IP table entries - exceeded dump_buffer_size size";
                v19 = buf;
                v20 = v44;
                v21 = 12;
                goto LABEL_18;
              }
              v28 = v29;
              if (v53 == 7)
              {
                v31 = v51;
                v32 = &v51[v52];
                v47 = v25 + 1;
                v33 = snprintf(&a4[v27], v30, "%5d ", v25 + 1) + v27;
                if (v31 < v32)
                {
                  while (1)
                  {
                    v31 = NEHelperTrackerParseTLV((uint64_t)v31, &v53, &v52, &v51);
                    switch(v53)
                    {
                      case 1:
                        if (v52 != 1)
                          goto LABEL_54;
                        v48 = *v51;
                        v34 = snprintf(&a4[v33], a5 - v33, "%6d ");
                        goto LABEL_53;
                      case 2:
                        v62 = 0u;
                        v63 = 0u;
                        v60 = 0u;
                        v61 = 0u;
                        v58 = 0u;
                        v59 = 0u;
                        memset(buf, 0, sizeof(buf));
                        buf[1] = v48;
                        if (v48 == 30)
                        {
                          if (v52 != 16)
                          {
                            v17 = ne_log_obj();
                            if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
                              return 0;
LABEL_75:
                            *(_DWORD *)v54 = 136315394;
                            *(_QWORD *)&v54[4] = "NEHelperTrackerDumpIPEntries";
                            *(_WORD *)&v54[12] = 1024;
                            *(_DWORD *)&v54[14] = v52;
                            v18 = "%s: IPv4 Address got invalid length %d";
LABEL_76:
                            v19 = (uint8_t *)v54;
LABEL_17:
                            v20 = v17;
                            v21 = 18;
LABEL_18:
                            _os_log_error_impl(&dword_208439000, v20, OS_LOG_TYPE_ERROR, v18, v19, v21);
                            return 0;
                          }
                          buf[0] = 28;
                          v36 = &buf[8];
                          *(_OWORD *)&buf[8] = *(_OWORD *)v51;
                          v55 = 0u;
                          v56 = 0u;
                          memset(v54, 0, sizeof(v54));
                          v35 = 30;
                        }
                        else
                        {
                          if (v48 != 2)
                          {
                            v17 = ne_log_obj();
                            if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
                              return 0;
                            *(_DWORD *)v54 = 136315394;
                            *(_QWORD *)&v54[4] = "NEHelperTrackerDumpIPEntries";
                            *(_WORD *)&v54[12] = 1024;
                            *(_DWORD *)&v54[14] = v48;
                            v18 = "%s: Address with invalid family %d";
                            goto LABEL_76;
                          }
                          if (v52 != 4)
                          {
                            v17 = ne_log_obj();
                            if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
                              return 0;
                            goto LABEL_75;
                          }
                          buf[0] = 16;
                          *(_DWORD *)&buf[4] = *(_DWORD *)v51;
                          v55 = 0uLL;
                          v56 = 0uLL;
                          memset(v54, 0, sizeof(v54));
                          v35 = 2;
                          v36 = &buf[4];
                        }
                        inet_ntop(v35, v36, v54, 0x40u);
                        v34 = snprintf(&a4[v33], a5 - v33, "%40s ");
LABEL_53:
                        v33 += v34;
                        goto LABEL_54;
                      case 3:
                        if (v52 != 16)
                          goto LABEL_54;
                        *(_OWORD *)uu = *(_OWORD *)v51;
                        uuid_unparse_lower(uu, out);
                        v34 = snprintf(&a4[v33], a5 - v33, "%s ");
                        goto LABEL_53;
                      case 4:
                        if (v52 < 2 || v51[v52 - 1])
                          goto LABEL_54;
                        v34 = snprintf(&a4[v33], a5 - v33, "%s%-20s ");
                        goto LABEL_53;
                      case 5:
                        if (v52 < 2 || v51[v52 - 1])
                          goto LABEL_54;
                        v34 = snprintf(&a4[v33], a5 - v33, "- %s");
                        goto LABEL_53;
                      case 6:
                        if (v52 != 4)
                        {
                          v17 = ne_log_obj();
                          result = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
                          if (!result)
                            return result;
                          *(_DWORD *)buf = 136315394;
                          *(_QWORD *)&buf[4] = "NEHelperTrackerDumpIPEntries";
                          *(_WORD *)&buf[12] = 1024;
                          *(_DWORD *)&buf[14] = v52;
                          v18 = "%s: Flags with invalid size %d";
                          goto LABEL_16;
                        }
                        v37 = *(_DWORD *)v51;
                        v38 = snprintf(&a4[v33], a5 - v33, "<%2X: ", *(_DWORD *)v51) + (uint64_t)v33;
                        v39 = "S";
                        if ((v37 & 4) == 0)
                          v39 = " ";
                        v50 += (v37 & 4) >> 2;
                        v40 = v38 + snprintf(&a4[v38], a5 - v38, "%s", v39);
                        v41 = "|T";
                        if ((v37 & 2) == 0)
                          v41 = "| ";
                        v49 += (v37 & 2) >> 1;
                        v42 = v40 + snprintf(&a4[v40], a5 - v40, "%s", v41);
                        v43 = "|A> ";
                        if ((v37 & 1) == 0)
                          v43 = "| > ";
                        v33 = v42 + snprintf(&a4[v42], a5 - v42, "%s", v43);
LABEL_54:
                        if (v31 >= v32)
                          goto LABEL_55;
                        break;
                      default:
                        goto LABEL_54;
                    }
                  }
                }
LABEL_55:
                v27 = snprintf(&a4[v33], a5 - v33, "\n") + v33;
                v26 = v46;
                v25 = v47;
              }
              else if (v53 == 8 && v52 == 8)
              {
                v45 = *(_QWORD *)v51;
              }
            }
            while (v28 < v26);
            if (v25 >= 1)
              snprintf(&a4[v27], a5 - v27, "\n* Total count %d (short count %d) (total memory used %zu) (trackers %d non-trackers %d) (S=short T=tracker A=app-approved)\n\n", v25, v50, v45, v49, v25 - v49);
          }
          return 1;
        }
      }
    }
  }
  return result;
}

uint64_t NEHelperTrackerGetDispositionWrapper(uint64_t a1, char *__s, char **a3, unint64_t a4)
{
  __int128 *v8;
  __int128 v9;
  const unsigned __int8 *v10;
  int DispositionForDomain;
  const char *v12;
  unint64_t v14;
  char v15[254];
  _OWORD v16[7];
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  memset(v16, 0, sizeof(v16));
  if (*(_QWORD *)a1)
    *(_QWORD *)&v16[0] = *(_QWORD *)a1;
  v8 = *(__int128 **)(a1 + 8);
  if (v8)
  {
    v9 = *v8;
    *(_OWORD *)((char *)&v16[1] + 8) = v8[1];
    *(_OWORD *)((char *)v16 + 8) = v9;
    *(_OWORD *)((char *)&v16[4] + 8) = 0u;
    *(_OWORD *)((char *)&v16[5] + 8) = 0u;
  }
  v10 = *(const unsigned __int8 **)(a1 + 16);
  if (v10)
  {
    uuid_copy((unsigned __int8 *)&v16[2] + 8, v10);
    uuid_copy((unsigned __int8 *)&v16[6] + 8, UUID_NULL);
  }
  if (*(_BYTE *)(a1 + 32))
    HIDWORD(v17) |= 1u;
  v14 = 0;
  DispositionForDomain = NEHelperTrackerGetDispositionForDomain(v16, __s, &v14, 1);
  if ((unint64_t)a3 | a4 && v14)
  {
    if (a3)
    {
      v12 = (const char *)NEHelperTrackerContextCopyDomainOwner(v14, v15, 254, 0);
      if (v12)
        *a3 = strndup(v12, 0xFDuLL);
    }
    if (a4)
      *(_BYTE *)a4 = NEHelperTrackerContextCanBlockRequest(v14);
  }
  return dword_208467190[DispositionForDomain];
}

BOOL ne_session_manager_is_running()
{
  return get_current_notify_pid() != 0;
}

uint64_t get_current_notify_pid()
{
  if (get_current_notify_pid_sm_token < 0)
  {
    if (globals_init_sess_init != -1)
      dispatch_once(&globals_init_sess_init, &__block_literal_global_171);
    if (!notify_register_dispatch("com.apple.nesessionmanager", &get_current_notify_pid_sm_token, (dispatch_queue_t)g_queue, &__block_literal_global_167)&& notify_get_state(get_current_notify_pid_sm_token, &get_current_notify_pid_current_pid))
    {
      get_current_notify_pid_current_pid = 0;
    }
  }
  return get_current_notify_pid_current_pid;
}

void __get_current_notify_pid_block_invoke(int a1, int token)
{
  get_current_notify_pid_sm_token = token;
  if (notify_get_state(token, &get_current_notify_pid_current_pid))
  {
    get_current_notify_pid_current_pid = 0;
  }
  else if (get_current_notify_pid_current_pid)
  {
    update_all_session_clients();
  }
}

void update_all_session_clients()
{
  uint64_t i;

  for (i = g_sessions; i; i = *(_QWORD *)(i + 48))
    fetch_status(i, 0, 0, 0);
}

void fetch_status(uint64_t a1, uint64_t a2, NSObject *a3, void *a4)
{
  uint64_t connection;
  _xpc_connection_s *v9;
  xpc_object_t v10;
  int v11;
  _QWORD handler[8];
  int v13;
  _QWORD block[5];
  int v15;

  connection = get_connection(a1);
  if (connection)
  {
    v9 = (_xpc_connection_s *)connection;
    v10 = xpc_dictionary_create(0, 0, 0);
    v11 = *(_DWORD *)(a1 + 32);
    xpc_dictionary_set_int64(v10, "SessionCommandType", 1);
    if (a4)
      a4 = _Block_copy(a4);
    if (a3)
      dispatch_retain(a3);
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 0x40000000;
    handler[2] = __fetch_status_block_invoke_2;
    handler[3] = &unk_24C0A0BD8;
    v13 = v11;
    handler[4] = a4;
    handler[5] = a1;
    handler[6] = a2;
    handler[7] = a3;
    xpc_connection_send_message_with_reply(v9, v10, (dispatch_queue_t)g_queue, handler);
    xpc_release(v10);
  }
  else if (a3 && a4)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = __fetch_status_block_invoke;
    block[3] = &unk_24C0A0B88;
    block[4] = a4;
    v15 = 0;
    dispatch_async(a3, block);
  }
}

uint64_t get_connection(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  xpc_object_t v4;
  const char *v5;
  NSObject *v6;
  _xpc_connection_s *mach_service;
  uint64_t v8;
  _QWORD handler[5];
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  result = 0;
  v12 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v3 = g_sessions;
    if (g_sessions)
    {
      while (v3 != a1)
      {
        v3 = *(_QWORD *)(v3 + 48);
        if (!v3)
          return 0;
      }
      if (*(_BYTE *)(a1 + 64))
        return 0;
      result = *(_QWORD *)(a1 + 40);
      if (!result)
      {
        v4 = xpc_dictionary_create(0, 0, 0);
        getpid();
        v5 = "com.apple.nesessionmanager";
        if (sandbox_check())
        {
          v6 = ne_log_obj();
          v5 = "com.apple.nesessionmanager.flow-divert-token";
          if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            v11 = "com.apple.nesessionmanager.flow-divert-token";
            _os_log_impl(&dword_208439000, v6, OS_LOG_TYPE_INFO, "Falling back to %s", buf, 0xCu);
          }
        }
        mach_service = xpc_connection_create_mach_service(v5, (dispatch_queue_t)g_queue, 2uLL);
        v8 = MEMORY[0x24BDAC760];
        *(_QWORD *)(a1 + 40) = mach_service;
        handler[0] = v8;
        handler[1] = 0x40000000;
        handler[2] = __get_connection_block_invoke;
        handler[3] = &__block_descriptor_tmp_179;
        handler[4] = a1;
        xpc_connection_set_event_handler(mach_service, handler);
        xpc_connection_resume(*(xpc_connection_t *)(a1 + 40));
        xpc_dictionary_set_int64(v4, "SessionClientType", 1);
        xpc_dictionary_set_uuid(v4, "SessionIdentifier", (const unsigned __int8 *)a1);
        xpc_dictionary_set_int64(v4, "SessionConfigType", *(int *)(a1 + 16));
        xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), v4);
        xpc_release(v4);
        return *(_QWORD *)(a1 + 40);
      }
    }
  }
  return result;
}

uint64_t __fetch_status_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

void __fetch_status_block_invoke_2(uint64_t a1, void *a2)
{
  int64_t int64;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD block[7];

  if (a2 && MEMORY[0x20BD087A4](a2) == MEMORY[0x24BDACFA0])
  {
    int64 = xpc_dictionary_get_int64(a2, "SessionStatus");
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
    {
      v8 = g_sessions;
      if (g_sessions)
      {
        while (v8 != v7)
        {
          v8 = *(_QWORD *)(v8 + 48);
          if (!v8)
            goto LABEL_4;
        }
        if (!*(_BYTE *)(v7 + 64) && int64 != *(_DWORD *)(a1 + 64))
          set_status(v7, *(_QWORD *)(a1 + 48), int64);
      }
    }
  }
  else
  {
    int64 = 1;
  }
LABEL_4:
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    v6 = *(NSObject **)(a1 + 56);
    if (v6)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 0x40000000;
      block[2] = __fetch_status_block_invoke_3;
      block[3] = &unk_24C0A0BB0;
      block[4] = v5;
      block[5] = int64;
      block[6] = v6;
      dispatch_async(v6, block);
    }
  }
}

void set_status(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t i;

  if (*(_DWORD *)(a1 + 32) != a3)
  {
    *(_DWORD *)(a1 + 32) = a3;
    for (i = *(_QWORD *)(a1 + 24); i; i = *(_QWORD *)(i + 8))
    {
      if (i != a2)
        notify_client(i, 1);
    }
  }
}

void __fetch_status_block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 48));
}

void notify_client(uint64_t a1, int a2)
{
  NSObject *v3;
  unsigned int *v4;
  unsigned int v5;
  _QWORD block[6];
  int v7;

  if (*(_QWORD *)(a1 + 24))
  {
    v3 = *(NSObject **)(a1 + 32);
    if (v3)
    {
      v4 = (unsigned int *)(a1 + 40);
      do
        v5 = __ldxr(v4);
      while (__stxr(v5 + 1, v4));
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 0x40000000;
      block[2] = __notify_client_block_invoke;
      block[3] = &__block_descriptor_tmp_184;
      v7 = a2;
      block[4] = a1;
      block[5] = 0;
      dispatch_async(v3, block);
    }
  }
}

void __notify_client_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  uint64_t v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3002000000;
  v8 = __Block_byref_object_copy_;
  v9 = __Block_byref_object_dispose_;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 0x40000000;
  v4[2] = __notify_client_block_invoke_182;
  v4[3] = &unk_24C0A0C20;
  v2 = *(_QWORD *)(a1 + 32);
  v4[4] = &v5;
  v4[5] = v2;
  dispatch_sync((dispatch_queue_t)g_queue, v4);
  v3 = v6[5];
  if (v3)
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));
    _Block_release((const void *)v6[5]);
  }
  ne_session_release(*(_QWORD *)(a1 + 32));
  _Block_object_dispose(&v5, 8);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 135);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 135);
}

void *__notify_client_block_invoke_182(uint64_t a1)
{
  void *result;

  result = *(void **)(*(_QWORD *)(a1 + 40) + 24);
  if (result)
  {
    result = _Block_copy(result);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  }
  return result;
}

void ne_session_release(uint64_t a1)
{
  unsigned int *v1;
  unsigned int v2;
  unsigned int v3;
  _QWORD block[5];

  v1 = (unsigned int *)(a1 + 40);
  do
  {
    v2 = __ldxr(v1);
    v3 = v2 - 1;
  }
  while (__stxr(v3, v1));
  if (!v3)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = __ne_session_release_block_invoke;
    block[3] = &__block_descriptor_tmp_8;
    block[4] = a1;
    dispatch_sync((dispatch_queue_t)g_queue, block);
  }
}

void __ne_session_release_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _xpc_connection_s *v4;
  uint64_t v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(v1 + 8);
  if (v2)
    *(_QWORD *)(v2 + 16) = *(_QWORD *)(v1 + 16);
  **(_QWORD **)(v1 + 16) = v2;
  v3 = *(void **)v1;
  if (!*(_QWORD *)(*(_QWORD *)v1 + 24))
  {
    *((_BYTE *)v3 + 64) = 1;
    v4 = (_xpc_connection_s *)*((_QWORD *)v3 + 5);
    if (v4)
    {
      xpc_connection_cancel(v4);
    }
    else
    {
      v5 = *((_QWORD *)v3 + 6);
      if (v5)
        *(_QWORD *)(v5 + 56) = *((_QWORD *)v3 + 7);
      **((_QWORD **)v3 + 7) = v5;
      free(*(void **)v1);
      *(_QWORD *)v1 = 0;
    }
  }
  ne_session_clear_event_handler(v1, 0);
  free((void *)v1);
}

void ne_session_clear_event_handler(uint64_t a1, char a2)
{
  NSObject *v3;
  uint64_t v4;
  _QWORD block[6];
  char v6;

  v4 = *(_QWORD *)(a1 + 24);
  v3 = *(NSObject **)(a1 + 32);
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  if (v3)
  {
    if (v4)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 0x40000000;
      block[2] = __ne_session_clear_event_handler_block_invoke;
      block[3] = &unk_24C0A0B60;
      v6 = a2;
      block[4] = v4;
      block[5] = v3;
      dispatch_async(v3, block);
    }
    else
    {
      dispatch_release(v3);
    }
  }
}

void __ne_session_clear_event_handler_block_invoke(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 48))
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
}

void __get_connection_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v7;
  int64_t int64;
  uint64_t v9;
  uint64_t i;
  uint64_t j;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = g_sessions;
  if (v2)
    v4 = g_sessions == 0;
  else
    v4 = 1;
  if (!v4)
  {
    while (v3 != v2)
    {
      v3 = *(_QWORD *)(v3 + 48);
      if (!v3)
        return;
    }
    if (a2)
    {
      if (MEMORY[0x20BD087A4](a2) == MEMORY[0x24BDACFB8])
      {
        v7 = *(_QWORD *)(a1 + 32);
        if (*(_QWORD *)(v7 + 40))
        {
          xpc_connection_cancel(*(xpc_connection_t *)(v7 + 40));
          xpc_release(*(xpc_object_t *)(*(_QWORD *)(a1 + 32) + 40));
          *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 0;
          v7 = *(_QWORD *)(a1 + 32);
        }
        if (*(_QWORD *)(v7 + 24))
        {
          set_status(v7, 0, 1);
        }
        else
        {
          v9 = *(_QWORD *)(v7 + 48);
          if (v9)
          {
            *(_QWORD *)(v9 + 56) = *(_QWORD *)(v7 + 56);
            v7 = *(_QWORD *)(a1 + 32);
            v9 = *(_QWORD *)(v7 + 48);
          }
          **(_QWORD **)(v7 + 56) = v9;
          free(*(void **)(a1 + 32));
        }
      }
      else if (MEMORY[0x20BD087A4](a2) == MEMORY[0x24BDACFA0])
      {
        int64 = xpc_dictionary_get_int64(a2, "SessionNotificationType");
        switch(int64)
        {
          case 3:
            for (i = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24); i; i = *(_QWORD *)(i + 8))
              notify_client(i, 3);
            break;
          case 2:
            for (j = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24); j; j = *(_QWORD *)(j + 8))
              notify_client(j, 1);
            break;
          case 1:
            fetch_status(*(_QWORD *)(a1 + 32), 0, 0, 0);
            break;
        }
      }
    }
  }
}

dispatch_queue_t __globals_init_block_invoke()
{
  NSObject *v0;
  dispatch_queue_t result;

  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  result = dispatch_queue_create("ne_session queue", v0);
  g_queue = (uint64_t)result;
  g_sessions = 0;
  return result;
}

uint64_t ne_session_manager_get_pid()
{
  return get_current_notify_pid();
}

uint64_t ne_session_manager_has_active_sessions()
{
  int v0;
  int check;

  check = 0;
  v0 = ne_session_manager_get_info_current_info_token;
  if (ne_session_manager_get_info_current_info_token < 0)
  {
    if (notify_register_check("com.apple.nesessionmanager.info", &ne_session_manager_get_info_current_info_token))
    {
      ne_session_manager_get_info_current_info_token = -1;
      return ne_session_manager_get_info_current_info & 1;
    }
    v0 = ne_session_manager_get_info_current_info_token;
    if (ne_session_manager_get_info_current_info_token < 0)
      return ne_session_manager_get_info_current_info & 1;
  }
  if (notify_check(v0, &check)
    || check
    && notify_get_state(ne_session_manager_get_info_current_info_token, (uint64_t *)&ne_session_manager_get_info_current_info))
  {
    notify_cancel(ne_session_manager_get_info_current_info_token);
    ne_session_manager_get_info_current_info_token = -1;
    ne_session_manager_get_info_current_info = 0;
  }
  return ne_session_manager_get_info_current_info & 1;
}

BOOL ne_session_should_disable_nexus()
{
  int v0;
  int check;

  check = 0;
  v0 = ne_session_should_disable_nexus_disable_nexus_token;
  if (ne_session_should_disable_nexus_disable_nexus_token < 0)
  {
    if (notify_register_check("com.apple.networkextension.disable-nexus", &ne_session_should_disable_nexus_disable_nexus_token))
    {
      ne_session_should_disable_nexus_disable_nexus_token = -1;
      return ne_session_should_disable_nexus_current_state != 0;
    }
    v0 = ne_session_should_disable_nexus_disable_nexus_token;
    if (ne_session_should_disable_nexus_disable_nexus_token < 0)
      return ne_session_should_disable_nexus_current_state != 0;
  }
  if (notify_check(v0, &check)
    || check
    && notify_get_state(ne_session_should_disable_nexus_disable_nexus_token, (uint64_t *)&ne_session_should_disable_nexus_current_state))
  {
    notify_cancel(ne_session_should_disable_nexus_disable_nexus_token);
    ne_session_should_disable_nexus_disable_nexus_token = -1;
    ne_session_should_disable_nexus_current_state = 0;
  }
  return ne_session_should_disable_nexus_current_state != 0;
}

BOOL ne_session_disable_restrictions()
{
  int v0;
  int check;

  check = 0;
  v0 = ne_session_disable_restrictions_disable_restrictions_token;
  if (ne_session_disable_restrictions_disable_restrictions_token < 0)
  {
    if (notify_register_check("com.apple.networkextension.disable-restrictions", &ne_session_disable_restrictions_disable_restrictions_token))
    {
      ne_session_disable_restrictions_disable_restrictions_token = -1;
      return ne_session_disable_restrictions_current_state != 0;
    }
    v0 = ne_session_disable_restrictions_disable_restrictions_token;
    if (ne_session_disable_restrictions_disable_restrictions_token < 0)
      return ne_session_disable_restrictions_current_state != 0;
  }
  if (notify_check(v0, &check)
    || check
    && notify_get_state(ne_session_disable_restrictions_disable_restrictions_token, (uint64_t *)&ne_session_disable_restrictions_current_state))
  {
    notify_cancel(ne_session_disable_restrictions_disable_restrictions_token);
    ne_session_disable_restrictions_disable_restrictions_token = -1;
    ne_session_disable_restrictions_current_state = 0;
  }
  return ne_session_disable_restrictions_current_state != 0;
}

BOOL ne_session_fallback_advisory()
{
  int v0;
  int check;

  check = 0;
  v0 = ne_session_fallback_advisory_fallback_advisory_token;
  if (ne_session_fallback_advisory_fallback_advisory_token < 0)
  {
    if (notify_register_check("com.apple.symptoms.hasAlternateAdvice", &ne_session_fallback_advisory_fallback_advisory_token))
    {
      ne_session_fallback_advisory_fallback_advisory_token = -1;
      return ne_session_fallback_advisory_current_state != 0;
    }
    v0 = ne_session_fallback_advisory_fallback_advisory_token;
    if (ne_session_fallback_advisory_fallback_advisory_token < 0)
      return ne_session_fallback_advisory_current_state != 0;
  }
  if (notify_check(v0, &check)
    || check
    && notify_get_state(ne_session_fallback_advisory_fallback_advisory_token, (uint64_t *)&ne_session_fallback_advisory_current_state))
  {
    notify_cancel(ne_session_fallback_advisory_fallback_advisory_token);
    ne_session_fallback_advisory_fallback_advisory_token = -1;
    ne_session_fallback_advisory_current_state = 0;
  }
  return ne_session_fallback_advisory_current_state != 0;
}

uint64_t ne_session_fallback_default()
{
  int v0;
  int check;

  check = 0;
  v0 = ne_session_fallback_default_fallback_default_token;
  if (ne_session_fallback_default_fallback_default_token < 0)
  {
    if (notify_register_check("com.apple.networkextension.fallback-default", &ne_session_fallback_default_fallback_default_token))
    {
      ne_session_fallback_default_fallback_default_token = -1;
      return ne_session_fallback_default_current_state;
    }
    v0 = ne_session_fallback_default_fallback_default_token;
    if (ne_session_fallback_default_fallback_default_token < 0)
      return ne_session_fallback_default_current_state;
  }
  if (notify_check(v0, &check)
    || check
    && notify_get_state(ne_session_fallback_default_fallback_default_token, (uint64_t *)&ne_session_fallback_default_current_state))
  {
    notify_cancel(ne_session_fallback_default_fallback_default_token);
    ne_session_fallback_default_fallback_default_token = -1;
    ne_session_fallback_default_current_state = 0;
  }
  return ne_session_fallback_default_current_state;
}

uint64_t ne_session_use_as_system_vpn()
{
  return 1;
}

unint64_t ne_session_on_demand_configs_present()
{
  return (unint64_t)get_current_config_state() >> 63;
}

uint64_t get_current_config_state()
{
  int v0;
  int check;

  check = 0;
  v0 = get_current_config_state_config_token;
  if (get_current_config_state_config_token < 0)
  {
    if (notify_register_check("com.apple.neconfigurationchanged", &get_current_config_state_config_token))
    {
      get_current_config_state_config_token = -1;
      return get_current_config_state_current_state;
    }
    v0 = get_current_config_state_config_token;
    if (get_current_config_state_config_token < 0)
      return get_current_config_state_current_state;
  }
  if (notify_check(v0, &check)
    || check
    && notify_get_state(get_current_config_state_config_token, (uint64_t *)&get_current_config_state_current_state))
  {
    notify_cancel(get_current_config_state_config_token);
    get_current_config_state_config_token = -1;
    get_current_config_state_current_state = 0;
  }
  return get_current_config_state_current_state;
}

unint64_t ne_session_vod_evaluate_connection_present()
{
  return ((unint64_t)get_current_config_state() >> 54) & 1;
}

unint64_t ne_session_app_vpn_configs_present()
{
  return ((unint64_t)get_current_config_state() >> 62) & 1;
}

unint64_t ne_session_always_on_vpn_configs_present()
{
  return ((unint64_t)get_current_config_state() >> 61) & 1;
}

uint64_t ne_session_always_on_vpn_configs_present_at_boot()
{
  int v0;
  int v1;
  off_t st_size;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  stat v9;

  if ((get_current_config_state() & 0x2000000000000000) != 0)
    return 1;
  v0 = open("/Library/Preferences/com.apple.networkextension.necp.plist", 0);
  if (v0 == -1)
    return 0;
  v1 = v0;
  memset(&v9, 0, sizeof(v9));
  if (fstat(v0, &v9))
    st_size = 0;
  else
    st_size = v9.st_size;
  if ((unint64_t)(st_size - 1) <= 0x27FE && (v3 = malloc_type_malloc(st_size, 0xB97863F2uLL)) != 0)
  {
    v4 = v3;
    if (pread(v1, v3, st_size, 0) == st_size && (v5 = (void *)xpc_create_from_plist()) != 0)
    {
      v6 = v5;
      v7 = xpc_dictionary_get_int64(v5, "drop_all_feature_always_on_vpn") != 0;
      xpc_release(v6);
    }
    else
    {
      v7 = 0;
    }
    free(v4);
  }
  else
  {
    v7 = 0;
  }
  close(v1);
  return v7;
}

uint64_t ne_session_is_always_on_vpn_enabled(NSObject *a1, const void *a2)
{
  NSObject *v4;
  uint32_t v6;
  uint32_t v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  uint32_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_lock((os_unfair_lock_t)&ne_session_is_always_on_vpn_enabled_notify_lock);
  ne_session_is_always_on_vpn_enabled_enabled = ne_session_always_on_vpn_configs_present_at_boot();
  v4 = ne_session_is_always_on_vpn_enabled_queue;
  if (ne_session_is_always_on_vpn_enabled_queue != a1
    || ne_session_is_always_on_vpn_enabled_handler != (_QWORD)a2)
  {
    if (ne_session_is_always_on_vpn_enabled_notify_token != -1)
    {
      notify_cancel(ne_session_is_always_on_vpn_enabled_notify_token);
      ne_session_is_always_on_vpn_enabled_notify_token = -1;
      v4 = ne_session_is_always_on_vpn_enabled_queue;
    }
    if (v4)
    {
      dispatch_release(v4);
      ne_session_is_always_on_vpn_enabled_queue = 0;
    }
    if (ne_session_is_always_on_vpn_enabled_handler)
    {
      _Block_release((const void *)ne_session_is_always_on_vpn_enabled_handler);
      ne_session_is_always_on_vpn_enabled_handler = 0;
    }
  }
  if (a1)
  {
    if (a2)
    {
      ne_session_is_always_on_vpn_enabled_queue = (uint64_t)a1;
      dispatch_retain(a1);
      ne_session_is_always_on_vpn_enabled_handler = (uint64_t)_Block_copy(a2);
      v6 = notify_register_dispatch("com.apple.neconfigurationchanged", &ne_session_is_always_on_vpn_enabled_notify_token, (dispatch_queue_t)ne_session_is_always_on_vpn_enabled_queue, &__block_literal_global_137);
      if (v6)
      {
        v7 = v6;
        v8 = ne_log_obj();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          v10 = 136315394;
          v11 = "com.apple.neconfigurationchanged";
          v12 = 1024;
          v13 = v7;
          _os_log_error_impl(&dword_208439000, v8, OS_LOG_TYPE_ERROR, "Failed to register for %s notifications in ne_session_is_always_on_vpn_enabled: %u", (uint8_t *)&v10, 0x12u);
        }
      }
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&ne_session_is_always_on_vpn_enabled_notify_lock);
  return ne_session_is_always_on_vpn_enabled_enabled;
}

void __ne_session_is_always_on_vpn_enabled_block_invoke(uint64_t a1, int a2)
{
  uint64_t current_config_state;
  uint64_t v4;
  BOOL v5;
  void (**v6)(void *, BOOL);

  current_config_state = get_current_config_state();
  os_unfair_lock_lock((os_unfair_lock_t)&ne_session_is_always_on_vpn_enabled_notify_lock);
  if (ne_session_is_always_on_vpn_enabled_notify_token != a2
    || ((v4 = current_config_state & 0x2000000000000000,
         ne_session_is_always_on_vpn_enabled_enabled != (current_config_state & 0x2000000000000000uLL) >> 61)
      ? (v5 = ne_session_is_always_on_vpn_enabled_handler == 0)
      : (v5 = 1),
        v5))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&ne_session_is_always_on_vpn_enabled_notify_lock);
  }
  else
  {
    ne_session_is_always_on_vpn_enabled_enabled = (current_config_state & 0x2000000000000000uLL) >> 61;
    v6 = (void (**)(void *, BOOL))_Block_copy((const void *)ne_session_is_always_on_vpn_enabled_handler);
    os_unfair_lock_unlock((os_unfair_lock_t)&ne_session_is_always_on_vpn_enabled_notify_lock);
    if (v6)
    {
      v6[2](v6, v4 != 0);
      _Block_release(v6);
    }
  }
}

unint64_t ne_session_vpn_include_all_networks_configs_present()
{
  return ((unint64_t)get_current_config_state() >> 55) & 1;
}

unint64_t ne_session_content_filter_configs_present()
{
  return ((unint64_t)get_current_config_state() >> 60) & 1;
}

unint64_t ne_session_dns_proxy_configs_present()
{
  return ((unint64_t)get_current_config_state() >> 59) & 1;
}

unint64_t ne_session_path_controller_configs_present()
{
  return ((unint64_t)get_current_config_state() >> 58) & 1;
}

unint64_t ne_session_dns_settings_configs_present()
{
  return ((unint64_t)get_current_config_state() >> 57) & 1;
}

unint64_t ne_session_local_communication_configs_present()
{
  return ((unint64_t)get_current_config_state() >> 56) & 1;
}

unint64_t ne_session_relay_configs_present()
{
  return ((unint64_t)get_current_config_state() >> 53) & 1;
}

uint64_t ne_session_create(uint64_t a1, int a2)
{
  uint64_t v4;
  _QWORD block[6];
  int v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2000000000;
  v11 = 0;
  if (globals_init_sess_init != -1)
    dispatch_once(&globals_init_sess_init, &__block_literal_global_171);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __ne_session_create_block_invoke;
  block[3] = &unk_24C0A0698;
  v7 = a2;
  block[4] = &v8;
  block[5] = a1;
  dispatch_sync((dispatch_queue_t)g_queue, block);
  v4 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v4;
}

_QWORD *__ne_session_create_block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD *result;
  _QWORD *v4;
  uint64_t v5;
  _OWORD *v6;
  unsigned int *v7;
  unsigned int v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;

  v2 = g_sessions;
  if (g_sessions)
  {
    while (uuid_compare(*(const unsigned __int8 **)(a1 + 40), (const unsigned __int8 *)v2)
         || *(_DWORD *)(v2 + 16) != *(_DWORD *)(a1 + 48)
         || *(_BYTE *)(v2 + 64))
    {
      v2 = *(_QWORD *)(v2 + 48);
      if (!v2)
        goto LABEL_6;
    }
  }
  else
  {
LABEL_6:
    result = malloc_type_malloc(0x48uLL, 0x10A0040C4150745uLL);
    if (!result)
      return result;
    v2 = (uint64_t)result;
    result[8] = 0;
    *((_OWORD *)result + 1) = 0u;
    *((_OWORD *)result + 2) = 0u;
    *(_OWORD *)result = 0u;
    *((_OWORD *)result + 3) = 0u;
    v4 = result + 6;
    uuid_copy((unsigned __int8 *)result, *(const unsigned __int8 **)(a1 + 40));
    *(_DWORD *)(v2 + 16) = *(_DWORD *)(a1 + 48);
    *(_QWORD *)(v2 + 24) = 0;
    *(_DWORD *)(v2 + 32) = 1;
    v5 = g_sessions;
    *v4 = g_sessions;
    if (v5)
      *(_QWORD *)(v5 + 56) = v4;
    g_sessions = v2;
    *(_QWORD *)(v2 + 56) = &g_sessions;
  }
  result = malloc_type_malloc(0x30uLL, 0x10A0040D517E767uLL);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  v6 = *(_OWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  *v6 = 0u;
  v6[1] = 0u;
  v6[2] = 0u;
  **(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v2;
  v7 = (unsigned int *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 40);
  do
    v8 = __ldxr(v7);
  while (__stxr(v8 + 1, v7));
  v11 = *(_QWORD *)(v2 + 24);
  v10 = (_QWORD *)(v2 + 24);
  v9 = v11;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 8) = v11;
  if (v11)
    *(_QWORD *)(v9 + 16) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 8;
  *v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 16) = v10;
  return result;
}

uint64_t ne_session_retain(uint64_t result)
{
  unsigned int *v1;
  unsigned int v2;

  v1 = (unsigned int *)(result + 40);
  do
    v2 = __ldxr(v1);
  while (__stxr(v2 + 1, v1));
  return result;
}

void ne_session_set_event_handler(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD block[7];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __ne_session_set_event_handler_block_invoke;
  block[3] = &unk_24C0A06E0;
  block[4] = a3;
  block[5] = a1;
  block[6] = a2;
  dispatch_sync((dispatch_queue_t)g_queue, block);
}

void __ne_session_set_event_handler_block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v3;
  NSObject *v4;

  v1 = a1[5];
  if (v1)
  {
    ne_session_clear_event_handler(a1[5], 0);
    v3 = (void *)a1[4];
    if (v3)
      v3 = _Block_copy(v3);
    *(_QWORD *)(v1 + 24) = v3;
    v4 = a1[6];
    *(_QWORD *)(v1 + 32) = v4;
    if (v4)
      dispatch_retain(v4);
  }
  if (get_current_notify_pid())
    update_all_session_clients();
}

void ne_session_cancel(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __ne_session_cancel_block_invoke;
  block[3] = &__block_descriptor_tmp_10;
  block[4] = a1;
  dispatch_sync((dispatch_queue_t)g_queue, block);
}

void __ne_session_cancel_block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    ne_session_clear_event_handler(v1, 1);
}

void ne_session_get_status(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD block[7];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __ne_session_get_status_block_invoke;
  block[3] = &unk_24C0A0778;
  block[5] = a1;
  block[6] = a2;
  block[4] = a3;
  dispatch_sync((dispatch_queue_t)g_queue, block);
}

void __ne_session_get_status_block_invoke(uint64_t a1)
{
  uint64_t *v2;
  void *v3;
  unsigned int *v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  NSObject *v13;
  uint64_t v14;
  _QWORD block[7];
  int v16;
  _QWORD v17[7];

  v2 = *(uint64_t **)(a1 + 40);
  dispatch_retain(*(dispatch_object_t *)(a1 + 48));
  v3 = _Block_copy(*(const void **)(a1 + 32));
  v4 = (unsigned int *)(*(_QWORD *)(a1 + 40) + 40);
  do
    v5 = __ldxr(v4);
  while (__stxr(v5 + 1, v4));
  v6 = *v2;
  v7 = g_sessions;
  if (*v2)
    v8 = g_sessions == 0;
  else
    v8 = 1;
  if (v8)
    goto LABEL_11;
  while (v7 != v6)
  {
    v7 = *(_QWORD *)(v7 + 48);
    if (!v7)
      goto LABEL_11;
  }
  if (*(_BYTE *)(v6 + 64) || !*(_QWORD *)(v6 + 40))
  {
LABEL_11:
    if (get_current_notify_pid())
    {
      v9 = *v2;
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 0x40000000;
      v17[2] = __ne_session_get_status_block_invoke_2;
      v17[3] = &unk_24C0A0728;
      v11 = *(_QWORD *)(a1 + 40);
      v10 = *(NSObject **)(a1 + 48);
      v17[4] = v3;
      v17[5] = v10;
      v17[6] = v11;
      fetch_status(v9, (uint64_t)v2, v10, v17);
      return;
    }
    v12 = 1;
  }
  else
  {
    v12 = *(_DWORD *)(v6 + 32);
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __ne_session_get_status_block_invoke_3;
  block[3] = &unk_24C0A0750;
  v16 = v12;
  v14 = *(_QWORD *)(a1 + 40);
  v13 = *(NSObject **)(a1 + 48);
  block[4] = v3;
  block[5] = v13;
  block[6] = v14;
  dispatch_async(v13, block);
}

void __ne_session_get_status_block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
  ne_session_release(*(_QWORD *)(a1 + 48));
}

void __ne_session_get_status_block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
  ne_session_release(*(_QWORD *)(a1 + 48));
}

const char *ne_session_info_type_to_string(int a1)
{
  if ((a1 - 1) > 4)
    return "unknown";
  else
    return off_24C0A1070[a1 - 1];
}

void ne_session_local_communication_send_info(uint64_t a1, int a2, uint64_t a3, dispatch_object_t object, const void *a5)
{
  void *v10;
  unsigned int *v11;
  unsigned int v12;
  _QWORD block[8];
  int v14;

  dispatch_retain(object);
  v10 = _Block_copy(a5);
  v11 = (unsigned int *)(a1 + 40);
  do
    v12 = __ldxr(v11);
  while (__stxr(v12 + 1, v11));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __ne_session_local_communication_send_info_block_invoke;
  block[3] = &unk_24C0A0840;
  block[4] = v10;
  block[5] = a1;
  v14 = a2;
  block[6] = object;
  block[7] = a3;
  dispatch_sync((dispatch_queue_t)g_queue, block);
}

void __ne_session_local_communication_send_info_block_invoke(uint64_t a1)
{
  uint64_t connection;
  _xpc_connection_s *v3;
  xpc_object_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD v10[7];
  _QWORD handler[5];
  int8x16_t v12;
  int v13;
  _QWORD block[7];

  if (!get_current_notify_pid())
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 0x40000000;
    v10[2] = __ne_session_local_communication_send_info_block_invoke_2_29;
    v10[3] = &unk_24C0A0818;
    v7 = *(_QWORD *)(a1 + 40);
    v6 = *(NSObject **)(a1 + 48);
    v10[4] = *(_QWORD *)(a1 + 32);
    v10[5] = v6;
    v10[6] = v7;
    v8 = v10;
LABEL_8:
    dispatch_async(v6, v8);
    return;
  }
  connection = get_connection(**(_QWORD **)(a1 + 40));
  if (!connection)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = __ne_session_local_communication_send_info_block_invoke_2;
    block[3] = &unk_24C0A07A0;
    v9 = *(_QWORD *)(a1 + 40);
    v6 = *(NSObject **)(a1 + 48);
    block[4] = *(_QWORD *)(a1 + 32);
    block[5] = v6;
    block[6] = v9;
    v8 = block;
    goto LABEL_8;
  }
  v3 = (_xpc_connection_s *)connection;
  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v4, "SessionCommandType", 7);
  xpc_dictionary_set_int64(v4, "SessionInfoType", *(int *)(a1 + 64));
  v5 = *(void **)(a1 + 56);
  if (v5)
    xpc_dictionary_set_value(v4, "SessionAppPushCallInfo", v5);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 0x40000000;
  handler[2] = __ne_session_local_communication_send_info_block_invoke_3;
  handler[3] = &unk_24C0A07F0;
  v13 = *(_DWORD *)(a1 + 64);
  handler[4] = *(_QWORD *)(a1 + 32);
  v12 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  xpc_connection_send_message_with_reply(v3, v4, (dispatch_queue_t)g_queue, handler);
  xpc_release(v4);
}

void __ne_session_local_communication_send_info_block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
  ne_session_release(*(_QWORD *)(a1 + 48));
}

void __ne_session_local_communication_send_info_block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  xpc_object_t value;
  int v9;
  const char *string;
  _QWORD v11[6];
  uint8_t buf[4];
  int v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (a2 && (v4 = MEMORY[0x20BD087A4](a2), v5 = MEMORY[0x24BDACFA0], v4 == MEMORY[0x24BDACFA0]))
  {
    value = xpc_dictionary_get_value(a2, "SessionAppPushSendMessageResult");
    v7 = value;
    if (!value)
      goto LABEL_6;
    if (MEMORY[0x20BD087A4](value) == v5)
    {
      xpc_retain(v7);
      goto LABEL_6;
    }
  }
  else
  {
    v6 = ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_DWORD *)(a1 + 56);
      string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x24BDACF40]);
      *(_DWORD *)buf = 67109378;
      v13 = v9;
      v14 = 2080;
      v15 = string;
      _os_log_error_impl(&dword_208439000, v6, OS_LOG_TYPE_ERROR, "Failed to send info with type %d: %s", buf, 0x12u);
    }
  }
  v7 = 0;
LABEL_6:
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 0x40000000;
  v11[2] = __ne_session_local_communication_send_info_block_invoke_25;
  v11[3] = &unk_24C0A07C8;
  v11[4] = *(_QWORD *)(a1 + 32);
  v11[5] = v7;
  dispatch_async(*(dispatch_queue_t *)(a1 + 40), v11);
}

void __ne_session_local_communication_send_info_block_invoke_2_29(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
  ne_session_release(*(_QWORD *)(a1 + 48));
}

void __ne_session_local_communication_send_info_block_invoke_25(uint64_t a1)
{
  void *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(void **)(a1 + 40);
  if (v2)
    xpc_release(v2);
  _Block_release(*(const void **)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 48));
  ne_session_release(*(_QWORD *)(a1 + 56));
}

uint64_t ne_session_map_interface_to_provider_uuid(const char *a1, uuid_t uu)
{
  const char *v4;
  NSObject *v5;
  _xpc_connection_s *mach_service;
  xpc_object_t empty;
  xpc_object_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  const uint8_t *uuid;
  NSObject *v13;
  NSObject *v14;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  unsigned __int8 *__attribute__((__org_typedef(uuid_t))) v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  uuid_clear(uu);
  if (a1)
  {
    getpid();
    v4 = "com.apple.nesessionmanager";
    if (sandbox_check())
    {
      v5 = ne_log_obj();
      v4 = "com.apple.nesessionmanager.flow-divert-token";
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v17 = "com.apple.nesessionmanager.flow-divert-token";
        _os_log_impl(&dword_208439000, v5, OS_LOG_TYPE_INFO, "Falling back to %s", buf, 0xCu);
      }
    }
    mach_service = xpc_connection_create_mach_service(v4, (dispatch_queue_t)g_queue, 2uLL);
    xpc_connection_set_event_handler(mach_service, &__block_literal_global_36);
    empty = xpc_dictionary_create_empty();
    xpc_dictionary_set_int64(empty, "SessionClientType", 3);
    xpc_dictionary_set_string(empty, "InterfaceMapInfo", a1);
    xpc_connection_resume(mach_service);
    v8 = xpc_connection_send_message_with_reply_sync(mach_service, empty);
    if (!v8)
    {
      v11 = 0;
LABEL_19:
      xpc_release(empty);
      xpc_connection_cancel(mach_service);
      xpc_release(mach_service);
      return v11;
    }
    v9 = v8;
    if (MEMORY[0x20BD087A4](v8) == MEMORY[0x24BDACFA0])
    {
      uuid = xpc_dictionary_get_uuid(v9, "MachOUUID");
      if (uuid)
      {
        *(_OWORD *)uu = *(_OWORD *)uuid;
        v13 = ne_log_obj();
        v11 = 1;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          v17 = a1;
          v18 = 1040;
          v19 = 16;
          v20 = 2096;
          v21 = uu;
          _os_log_impl(&dword_208439000, v13, OS_LOG_TYPE_INFO, "Mapped interface %s to provider UUID: %{uuid_t}.16P", buf, 0x1Cu);
        }
        goto LABEL_18;
      }
      v14 = ne_log_obj();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_208439000, v14, OS_LOG_TYPE_DEBUG, "Error mapping interface to provider UUID: malformed response from nesessionmanager.", buf, 2u);
      }
    }
    else if (MEMORY[0x20BD087A4](v9) == MEMORY[0x24BDACFB8])
    {
      v10 = ne_log_obj();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_208439000, v10, OS_LOG_TYPE_ERROR, "Error sending a map interface message to nesessionmanager.", buf, 2u);
      }
    }
    v11 = 0;
LABEL_18:
    xpc_release(v9);
    goto LABEL_19;
  }
  return 0;
}

void __ne_session_map_interface_to_provider_uuid_block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  uint8_t v3[16];

  if (a2 && MEMORY[0x20BD087A4](a2) == MEMORY[0x24BDACFB8])
  {
    v2 = ne_log_obj();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v3 = 0;
      _os_log_error_impl(&dword_208439000, v2, OS_LOG_TYPE_ERROR, "Error sending a map interface message to nesessionmanager.", v3, 2u);
    }
  }
}

uint64_t ne_session_set_device_communication_exception(_BOOL4 a1)
{
  const char *v2;
  NSObject *v3;
  _xpc_connection_s *mach_service;
  _xpc_connection_s *v5;
  xpc_object_t empty;
  xpc_object_t v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  _BOOL4 v12;
  NSObject *v13;
  _BOOL4 v14;
  const char *v15;
  const char *v16;
  _QWORD handler[5];
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  getpid();
  v2 = "com.apple.nesessionmanager";
  if (sandbox_check())
  {
    v3 = ne_log_obj();
    v2 = "com.apple.nesessionmanager.flow-divert-token";
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "ne_session_set_device_communication_exception";
      v21 = 2080;
      v22 = "com.apple.nesessionmanager.flow-divert-token";
      _os_log_impl(&dword_208439000, v3, OS_LOG_TYPE_INFO, "%s: Falling back to %s", buf, 0x16u);
    }
  }
  mach_service = xpc_connection_create_mach_service(v2, (dispatch_queue_t)g_queue, 2uLL);
  if (mach_service)
  {
    v5 = mach_service;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 0x40000000;
    handler[2] = __ne_session_set_device_communication_exception_block_invoke;
    handler[3] = &__block_descriptor_tmp_40;
    handler[4] = v2;
    xpc_connection_set_event_handler(mach_service, handler);
    empty = xpc_dictionary_create_empty();
    xpc_dictionary_set_int64(empty, "SessionClientType", 4);
    xpc_dictionary_set_BOOL(empty, "DeviceCommunicationExceptionEnable", a1);
    xpc_connection_resume(v5);
    v7 = xpc_connection_send_message_with_reply_sync(v5, empty);
    if (!v7)
    {
      v11 = 0;
LABEL_25:
      xpc_release(empty);
      xpc_release(v5);
      return v11;
    }
    v8 = v7;
    if (MEMORY[0x20BD087A4](v7) == MEMORY[0x24BDACFA0])
    {
      v12 = xpc_dictionary_get_BOOL(v8, "DeviceCommunicationExceptionResult");
      v13 = ne_log_obj();
      v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
      if (v12)
      {
        if (v14)
        {
          v15 = "disabled";
          if (a1)
            v15 = "enabled";
          *(_DWORD *)buf = 136315138;
          v20 = v15;
          v11 = 1;
          _os_log_impl(&dword_208439000, v13, OS_LOG_TYPE_INFO, "DeviceCommunicationException succeeded: %s", buf, 0xCu);
        }
        else
        {
          v11 = 1;
        }
        goto LABEL_24;
      }
      if (v14)
      {
        v16 = "disabled";
        if (a1)
          v16 = "enabled";
        *(_DWORD *)buf = 136315138;
        v20 = v16;
        _os_log_impl(&dword_208439000, v13, OS_LOG_TYPE_INFO, "DeviceCommunicationException failed: %s", buf, 0xCu);
      }
    }
    else if (MEMORY[0x20BD087A4](v8) == MEMORY[0x24BDACFB8])
    {
      v9 = ne_log_obj();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v20 = v2;
        _os_log_error_impl(&dword_208439000, v9, OS_LOG_TYPE_ERROR, "Error sending a DeviceCommunicationException message to %s", buf, 0xCu);
      }
    }
    v11 = 0;
LABEL_24:
    xpc_release(v8);
    goto LABEL_25;
  }
  v10 = ne_log_obj();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "ne_session_set_device_communication_exception";
    v21 = 2080;
    v22 = v2;
    _os_log_error_impl(&dword_208439000, v10, OS_LOG_TYPE_ERROR, "%s: Error failed to create connection to %s", buf, 0x16u);
  }
  return 0;
}

void __ne_session_set_device_communication_exception_block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (a2 && MEMORY[0x20BD087A4](a2) == MEMORY[0x24BDACFB8])
  {
    v3 = ne_log_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = 136315138;
      v6 = v4;
      _os_log_error_impl(&dword_208439000, v3, OS_LOG_TYPE_ERROR, "XPC Event - Error sending a DeviceCommunicationException message to %s", (uint8_t *)&v5, 0xCu);
    }
  }
}

void ne_session_get_info(uint64_t a1, int a2, dispatch_object_t object, const void *a4)
{
  ne_session_get_info_with_parameters(a1, a2, 0, 0, object, a4);
}

void ne_session_get_info_with_parameters(uint64_t a1, int a2, uint64_t a3, char a4, dispatch_object_t object, const void *a6)
{
  void *v12;
  unsigned int *v13;
  unsigned int v14;
  _QWORD block[8];
  int v16;
  char v17;

  dispatch_retain(object);
  v12 = _Block_copy(a6);
  v13 = (unsigned int *)(a1 + 40);
  do
    v14 = __ldxr(v13);
  while (__stxr(v14 + 1, v13));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __ne_session_get_info_with_parameters_block_invoke;
  block[3] = &unk_24C0A0D08;
  v17 = a4;
  block[4] = v12;
  block[5] = a1;
  v16 = a2;
  block[6] = object;
  block[7] = a3;
  dispatch_sync((dispatch_queue_t)g_queue, block);
}

void __ne_session_get_info_with_parameters_block_invoke(uint64_t a1)
{
  uint64_t connection;
  _xpc_connection_s *v3;
  xpc_object_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD v10[7];
  _QWORD handler[5];
  int8x16_t v12;
  int v13;
  _QWORD v14[7];

  if (!get_current_notify_pid() && !*(_BYTE *)(a1 + 68))
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 0x40000000;
    v10[2] = __ne_session_get_info_with_parameters_block_invoke_2_190;
    v10[3] = &unk_24C0A0CE0;
    v9 = *(_QWORD *)(a1 + 40);
    v6 = *(NSObject **)(a1 + 48);
    v10[4] = *(_QWORD *)(a1 + 32);
    v10[5] = v6;
    v10[6] = v9;
    v8 = v10;
    goto LABEL_9;
  }
  connection = get_connection(**(_QWORD **)(a1 + 40));
  if (!connection)
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 0x40000000;
    v14[2] = __ne_session_get_info_with_parameters_block_invoke_2;
    v14[3] = &unk_24C0A0C68;
    v7 = *(_QWORD *)(a1 + 40);
    v6 = *(NSObject **)(a1 + 48);
    v14[4] = *(_QWORD *)(a1 + 32);
    v14[5] = v6;
    v14[6] = v7;
    v8 = v14;
LABEL_9:
    dispatch_async(v6, v8);
    return;
  }
  v3 = (_xpc_connection_s *)connection;
  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v4, "SessionCommandType", 6);
  xpc_dictionary_set_int64(v4, "SessionInfoType", *(int *)(a1 + 64));
  v5 = *(void **)(a1 + 56);
  if (v5)
    xpc_dictionary_set_value(v4, "SessionOptions", v5);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 0x40000000;
  handler[2] = __ne_session_get_info_with_parameters_block_invoke_3;
  handler[3] = &unk_24C0A0CB8;
  v13 = *(_DWORD *)(a1 + 64);
  handler[4] = *(_QWORD *)(a1 + 32);
  v12 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  xpc_connection_send_message_with_reply(v3, v4, (dispatch_queue_t)g_queue, handler);
  xpc_release(v4);
}

void __ne_session_get_info_with_parameters_block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
  ne_session_release(*(_QWORD *)(a1 + 48));
}

void __ne_session_get_info_with_parameters_block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  xpc_object_t value;
  int v9;
  const char *string;
  _QWORD v11[6];
  uint8_t buf[4];
  int v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (a2 && (v4 = MEMORY[0x20BD087A4](a2), v5 = MEMORY[0x24BDACFA0], v4 == MEMORY[0x24BDACFA0]))
  {
    value = xpc_dictionary_get_value(a2, "SessionInfo");
    v7 = value;
    if (!value)
      goto LABEL_6;
    if (MEMORY[0x20BD087A4](value) == v5)
    {
      xpc_retain(v7);
      goto LABEL_6;
    }
  }
  else
  {
    v6 = ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_DWORD *)(a1 + 56);
      string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x24BDACF40]);
      *(_DWORD *)buf = 67109378;
      v13 = v9;
      v14 = 2080;
      v15 = string;
      _os_log_error_impl(&dword_208439000, v6, OS_LOG_TYPE_ERROR, "Failed to fetch info with type %d: %s", buf, 0x12u);
    }
  }
  v7 = 0;
LABEL_6:
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 0x40000000;
  v11[2] = __ne_session_get_info_with_parameters_block_invoke_187;
  v11[3] = &unk_24C0A0C90;
  v11[4] = *(_QWORD *)(a1 + 32);
  v11[5] = v7;
  dispatch_async(*(dispatch_queue_t *)(a1 + 40), v11);
}

void __ne_session_get_info_with_parameters_block_invoke_2_190(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
  ne_session_release(*(_QWORD *)(a1 + 48));
}

void __ne_session_get_info_with_parameters_block_invoke_187(uint64_t a1)
{
  void *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(void **)(a1 + 40);
  if (v2)
    xpc_release(v2);
  _Block_release(*(const void **)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 48));
  ne_session_release(*(_QWORD *)(a1 + 56));
}

void ne_session_get_info2(uint64_t a1, int a2, char a3, dispatch_object_t object, const void *a5)
{
  ne_session_get_info_with_parameters(a1, a2, 0, a3, object, a5);
}

void ne_session_send_barrier(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  dispatch_time_t v3;
  _xpc_connection_s *v4;
  _QWORD barrier[5];
  _QWORD block[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2000000000;
  v10 = 0;
  v1 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __ne_session_send_barrier_block_invoke;
  block[3] = &unk_24C0A08C8;
  block[4] = &v7;
  block[5] = a1;
  dispatch_sync((dispatch_queue_t)g_queue, block);
  if (v8[3])
  {
    v2 = dispatch_semaphore_create(0);
    v3 = dispatch_time(0, 1000000000);
    dispatch_retain(v2);
    v4 = (_xpc_connection_s *)v8[3];
    barrier[0] = v1;
    barrier[1] = 0x40000000;
    barrier[2] = __ne_session_send_barrier_block_invoke_2;
    barrier[3] = &__block_descriptor_tmp_46;
    barrier[4] = v2;
    xpc_connection_send_barrier(v4, barrier);
    dispatch_semaphore_wait(v2, v3);
    dispatch_release(v2);
    xpc_release((xpc_object_t)v8[3]);
  }
  _Block_object_dispose(&v7, 8);
}

xpc_object_t __ne_session_send_barrier_block_invoke(uint64_t a1)
{
  xpc_object_t result;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = get_connection(**(_QWORD **)(a1 + 40));
  result = *(xpc_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (result)
    return xpc_retain(result);
  return result;
}

void __ne_session_send_barrier_block_invoke_2(uint64_t a1)
{
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
}

void ne_session_start_on_behalf_of(uint64_t a1, uint64_t a2, int a3, int a4, int a5, int a6, int a7)
{
  _QWORD block[6];
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __ne_session_start_on_behalf_of_block_invoke;
  block[3] = &__block_descriptor_tmp_53;
  v8 = a3;
  v9 = a4;
  v10 = a6;
  v11 = a5;
  v12 = a7;
  block[4] = a1;
  block[5] = a2;
  dispatch_sync((dispatch_queue_t)g_queue, block);
}

void __ne_session_start_on_behalf_of_block_invoke(uint64_t a1)
{
  uint64_t *v2;
  uint64_t connection;
  _xpc_connection_s *v4;
  xpc_object_t v5;
  void *v6;
  uint64_t v7;

  v2 = *(uint64_t **)(a1 + 32);
  connection = get_connection(*v2);
  if (connection)
  {
    v4 = (_xpc_connection_s *)connection;
    v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v5, "SessionCommandType", 2);
    xpc_dictionary_set_mach_send();
    xpc_dictionary_set_mach_send();
    xpc_dictionary_set_int64(v5, "SessionGroupID", *(unsigned int *)(a1 + 56));
    xpc_dictionary_set_int64(v5, "SessionUserID", *(unsigned int *)(a1 + 60));
    xpc_dictionary_set_int64(v5, "SessionPID", *(int *)(a1 + 64));
    v6 = *(void **)(a1 + 40);
    if (v6)
      xpc_dictionary_set_value(v5, "SessionOptions", v6);
    xpc_connection_send_message(v4, v5);
    xpc_release(v5);
    v7 = 2;
  }
  else
  {
    v7 = 0;
  }
  set_status(*v2, 0, v7);
}

void ne_session_start_with_options(uint64_t a1, uint64_t a2)
{
  int v4;
  mach_port_name_t v5;
  uid_t v6;
  gid_t v7;
  pid_t v8;
  _QWORD block[6];
  int v10;
  mach_port_name_t v11;
  gid_t v12;
  uid_t v13;
  pid_t v14;

  v4 = *MEMORY[0x24BDAD2F0];
  v5 = audit_session_self();
  v6 = geteuid();
  v7 = getegid();
  v8 = getpid();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __ne_session_start_on_behalf_of_block_invoke;
  block[3] = &__block_descriptor_tmp_53;
  v10 = v4;
  v11 = v5;
  v12 = v7;
  v13 = v6;
  v14 = v8;
  block[4] = a1;
  block[5] = a2;
  dispatch_sync((dispatch_queue_t)g_queue, block);
}

void ne_session_start(uint64_t a1)
{
  ne_session_start_with_options(a1, 0);
}

void ne_session_stop(uint64_t a1)
{
  _QWORD v1[5];
  int v2;

  v1[0] = MEMORY[0x24BDAC760];
  v1[1] = 0x40000000;
  v1[2] = __ne_session_stop_with_reason_block_invoke;
  v1[3] = &__block_descriptor_tmp_194;
  v1[4] = a1;
  v2 = 1;
  dispatch_sync((dispatch_queue_t)g_queue, v1);
}

void __ne_session_stop_with_reason_block_invoke(uint64_t a1)
{
  uint64_t *v2;
  uint64_t connection;
  _xpc_connection_s *v4;
  xpc_object_t v5;
  uint64_t v6;

  v2 = *(uint64_t **)(a1 + 32);
  if (get_current_notify_pid())
  {
    connection = get_connection(*v2);
    if (connection)
    {
      v4 = (_xpc_connection_s *)connection;
      v5 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_int64(v5, "SessionCommandType", 3);
      xpc_dictionary_set_int64(v5, "SessionStopReason", *(int *)(a1 + 40));
      xpc_connection_send_message(v4, v5);
      xpc_release(v5);
      v6 = 5;
    }
    else
    {
      v6 = 0;
    }
    set_status(*v2, 0, v6);
  }
}

void ne_session_get_configuration_id(const unsigned __int8 *__attribute__((__org_typedef(uuid_t))) *a1, uuid_t dst)
{
  uuid_copy(dst, *a1);
}

void ne_session_establish_ipc(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD block[7];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __ne_session_establish_ipc_block_invoke;
  block[3] = &unk_24C0A09A8;
  block[4] = a3;
  block[5] = a1;
  block[6] = a2;
  dispatch_sync((dispatch_queue_t)g_queue, block);
}

void __ne_session_establish_ipc_block_invoke(uint64_t a1)
{
  _xpc_connection_s *connection;
  void *v3;
  unsigned int *v4;
  unsigned int v5;
  xpc_object_t v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD v9[5];
  int8x16_t v10;
  _QWORD block[7];

  connection = (_xpc_connection_s *)get_connection(**(_QWORD **)(a1 + 40));
  v3 = _Block_copy(*(const void **)(a1 + 32));
  dispatch_retain(*(dispatch_object_t *)(a1 + 48));
  v4 = (unsigned int *)(*(_QWORD *)(a1 + 40) + 40);
  do
    v5 = __ldxr(v4);
  while (__stxr(v5 + 1, v4));
  if (connection)
  {
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v6, "SessionCommandType", 4);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 0x40000000;
    v9[2] = __ne_session_establish_ipc_block_invoke_3;
    v9[3] = &unk_24C0A0980;
    v9[4] = v3;
    v10 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
    xpc_connection_send_message_with_reply(connection, v6, (dispatch_queue_t)g_queue, v9);
    xpc_release(v6);
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = __ne_session_establish_ipc_block_invoke_2;
    block[3] = &unk_24C0A0930;
    v8 = *(_QWORD *)(a1 + 40);
    v7 = *(NSObject **)(a1 + 48);
    block[4] = v3;
    block[5] = v7;
    block[6] = v8;
    dispatch_async(v7, block);
  }
}

void __ne_session_establish_ipc_block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
  ne_session_release(*(_QWORD *)(a1 + 48));
}

void __ne_session_establish_ipc_block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  xpc_object_t value;
  _QWORD v5[6];

  v2 = a2;
  if (a2)
  {
    if (MEMORY[0x20BD087A4](a2) == MEMORY[0x24BDACFA0])
    {
      value = xpc_dictionary_get_value(v2, "SessionPrimaryPluginEndpoint");
      v2 = value;
      if (!value)
        goto LABEL_4;
      if (MEMORY[0x20BD087A4](value) == MEMORY[0x24BDACFB0])
      {
        xpc_retain(v2);
        goto LABEL_4;
      }
    }
    v2 = 0;
  }
LABEL_4:
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 0x40000000;
  v5[2] = __ne_session_establish_ipc_block_invoke_4;
  v5[3] = &unk_24C0A0958;
  v5[4] = *(_QWORD *)(a1 + 32);
  v5[5] = v2;
  dispatch_async(*(dispatch_queue_t *)(a1 + 40), v5);
}

void __ne_session_establish_ipc_block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = ne_log_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 134217984;
    v6 = v4;
    _os_log_debug_impl(&dword_208439000, v2, OS_LOG_TYPE_DEBUG, "Establish IPC returning primary = %p", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v3 = *(void **)(a1 + 40);
  if (v3)
    xpc_release(v3);
  _Block_release(*(const void **)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 48));
  ne_session_release(*(_QWORD *)(a1 + 56));
}

uint64_t ne_session_add_necp_drop_dest_from_path(const char *a1)
{
  uint64_t v2;
  NSObject *v3;
  char *v4;
  const char *v5;
  char *v6;
  int v7;
  int v8;
  off_t st_size;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  char *v15;
  char *v16;
  size_t v18;
  _OWORD v19[20];
  int v20;
  stat buf;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v20 = 0;
  memset(v19, 0, sizeof(v19));
  v18 = 324;
  if (sysctlbyname("net.necp.drop_dest_level", 0, &v18, 0, 0))
  {
    v2 = *__error();
    v3 = ne_log_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = strerror(v2);
      buf.st_dev = 136315394;
      *(_QWORD *)&buf.st_mode = "ne_session_add_necp_drop_dest_from_path";
      WORD2(buf.st_ino) = 2080;
      *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v4;
      v5 = "%s: get len sysctlbyname(net.necp.drop_dest_level) failed %s";
LABEL_7:
      _os_log_error_impl(&dword_208439000, v3, OS_LOG_TYPE_ERROR, v5, (uint8_t *)&buf, 0x16u);
    }
  }
  else if (sysctlbyname("net.necp.drop_dest_level", v19, &v18, 0, 0))
  {
    v2 = *__error();
    v3 = ne_log_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v6 = strerror(v2);
      buf.st_dev = 136315394;
      *(_QWORD *)&buf.st_mode = "ne_session_add_necp_drop_dest_from_path";
      WORD2(buf.st_ino) = 2080;
      *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v6;
      v5 = "%s: get sysctlbyname(net.necp.drop_dest_level) failed %s";
      goto LABEL_7;
    }
  }
  else
  {
    v7 = open(a1, 0);
    if (v7 == -1)
    {
      v2 = *__error();
      v14 = ne_log_obj();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = strerror(v2);
        buf.st_dev = 136315650;
        *(_QWORD *)&buf.st_mode = "ne_session_add_necp_drop_dest_from_path";
        WORD2(buf.st_ino) = 2080;
        *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)a1;
        HIWORD(buf.st_gid) = 2080;
        *(_QWORD *)&buf.st_rdev = v15;
        _os_log_error_impl(&dword_208439000, v14, OS_LOG_TYPE_ERROR, "%s: open(%s) failed %s", (uint8_t *)&buf, 0x20u);
      }
    }
    else
    {
      v8 = v7;
      memset(&buf, 0, sizeof(buf));
      if (fstat(v7, &buf))
        st_size = 0;
      else
        st_size = buf.st_size;
      if ((unint64_t)(st_size - 1) > 0x27FE)
      {
        if (st_size <= 0)
          v2 = 0;
        else
          v2 = 27;
      }
      else
      {
        v10 = malloc_type_malloc(st_size, 0x936A0A78uLL);
        if (v10)
        {
          v11 = v10;
          if (pread(v8, v10, st_size, 0) == st_size)
          {
            v12 = xpc_create_from_plist();
            if (v12)
            {
              v13 = (void *)v12;
              if (MEMORY[0x20BD087A4]() == MEMORY[0x24BDACF78])
                v2 = ne_session_parse_necp_drop_dest_array(v13, (uint64_t)v19);
              else
                v2 = 22;
              xpc_release(v13);
            }
            else
            {
              v2 = 22;
            }
          }
          else
          {
            v2 = 0;
          }
          free(v11);
        }
        else
        {
          v2 = 55;
        }
      }
      close(v8);
    }
    if (!(_DWORD)v2)
    {
      if (!sysctlbyname("net.necp.drop_dest_level", 0, 0, v19, 0x144uLL))
        return 0;
      v2 = *__error();
      v3 = ne_log_obj();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        v16 = strerror(v2);
        buf.st_dev = 136315394;
        *(_QWORD *)&buf.st_mode = "ne_session_add_necp_drop_dest_from_path";
        WORD2(buf.st_ino) = 2080;
        *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v16;
        v5 = "%s: set sysctlbyname(net.necp.drop_dest_level) failed %s";
        goto LABEL_7;
      }
    }
  }
  return v2;
}

uint64_t ne_session_parse_necp_drop_dest_array(void *a1, uint64_t a2)
{
  uint64_t v4;
  NSObject *v5;
  _QWORD v7[6];
  __int128 buf;
  uint64_t v9;
  char v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (xpc_array_get_count(a1))
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v9 = 0x2000000000;
    v10 = 1;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 0x40000000;
    v7[2] = __ne_session_parse_necp_drop_dest_array_block_invoke;
    v7[3] = &unk_24C0A0D50;
    v7[4] = &buf;
    v7[5] = a2;
    xpc_array_apply(a1, v7);
    if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
      v4 = 0;
    else
      v4 = 22;
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "ne_session_parse_necp_drop_dest_array";
      _os_log_error_impl(&dword_208439000, v5, OS_LOG_TYPE_ERROR, "%s: empty array", (uint8_t *)&buf, 0xCu);
    }
    return 0;
  }
  return v4;
}

BOOL __ne_session_parse_necp_drop_dest_array_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  NSObject *v3;
  _BOOL8 result;
  NSObject *v7;
  unsigned int v8;
  const char *v9;
  int v10;
  int v11;
  NSObject *v12;
  int *v13;
  char *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  NSObject *v18;
  __int16 v19;
  int v20;
  NSObject *v21;
  int *v22;
  char *v23;
  NSObject *v24;
  unsigned int *v25;
  unint64_t v26;
  uint64_t v27;
  int v28;
  unsigned __int8 *v29;
  BOOL v30;
  NSObject *v31;
  NSObject *v32;
  unsigned int *v33;
  __int128 v34;
  _OWORD v35[3];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  int v51;
  _BYTE v52[29];
  __int128 buf;
  uint64_t (*v54)(uint64_t, char *);
  void *v55;
  uint64_t *v56;
  uint64_t *v57;
  uint64_t *v58;
  uint64_t *v59;
  void *v60;
  uint8_t v61[4];
  const char *v62;
  __int16 v63;
  const char *v64;
  __int16 v65;
  char *v66;
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  memset(v35, 0, 40);
  if (**(_DWORD **)(a1 + 40) == 8)
  {
    v3 = ne_log_obj();
    result = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
    if (result)
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "ne_session_parse_necp_drop_dest_array_block_invoke";
      _os_log_error_impl(&dword_208439000, v3, OS_LOG_TYPE_ERROR, "%s: too many entries", (uint8_t *)&buf, 0xCu);
      return 0;
    }
    return result;
  }
  if (!a3 || MEMORY[0x20BD087A4](a3) != MEMORY[0x24BDACFA0])
  {
    v7 = ne_log_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v61 = 136315138;
      v62 = "ne_parse_necp_drop_dest_dictionary";
      _os_log_error_impl(&dword_208439000, v7, OS_LOG_TYPE_ERROR, "%s: item is not a dictionary", v61, 0xCu);
    }
    goto LABEL_47;
  }
  v48 = 0;
  v49 = &v48;
  v50 = 0x2000000000;
  v51 = -1;
  v44 = 0;
  v45 = &v44;
  v46 = 0x2000000000;
  v47 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2000000000;
  v43 = -1;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2000000000;
  v39 = 1;
  *(_QWORD *)&buf = MEMORY[0x24BDAC760];
  *((_QWORD *)&buf + 1) = 0x40000000;
  v54 = __ne_parse_necp_drop_dest_dictionary_block_invoke;
  v55 = &unk_24C0A0D78;
  v59 = &v36;
  v60 = a3;
  v56 = &v48;
  v57 = &v44;
  v58 = &v40;
  xpc_dictionary_apply(a3, &buf);
  if (!*((_BYTE *)v37 + 24))
    goto LABEL_46;
  v8 = *((_DWORD *)v49 + 6);
  v9 = (const char *)v45[3];
  v10 = *((_DWORD *)v41 + 6);
  *(_OWORD *)v52 = 0uLL;
  *(_QWORD *)&v52[21] = 0;
  *(_QWORD *)&v52[16] = 0;
  if (v9)
  {
    if (v8 > 0xB || ((1 << v8) & 0xC1A) == 0)
    {
      v24 = ne_log_obj();
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        goto LABEL_46;
      *(_DWORD *)v61 = 136315394;
      v62 = "ne_parse_necp_drop_dest_entry";
      v63 = 1024;
      LODWORD(v64) = v8;
      v15 = "%s: bad priority level %d";
LABEL_35:
      v16 = v24;
      v17 = 18;
      goto LABEL_36;
    }
    v11 = inet_pton(30, v9, &v52[9]);
    if (v11 == 1)
    {
      v19 = 7708;
    }
    else
    {
      if (v11 == -1)
      {
        v12 = ne_log_obj();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v13 = __error();
          v14 = strerror(*v13);
          *(_DWORD *)v61 = 136315650;
          v62 = "ne_parse_necp_drop_dest_entry";
          v63 = 2080;
          v64 = v9;
          v65 = 2080;
          v66 = v14;
          v15 = "%s: inet_pton(AF_INET6, %s) failed %s";
          v16 = v12;
          v17 = 32;
LABEL_36:
          _os_log_error_impl(&dword_208439000, v16, OS_LOG_TYPE_ERROR, v15, v61, v17);
          goto LABEL_46;
        }
        goto LABEL_46;
      }
      v20 = inet_pton(2, v9, &v52[5]);
      if (v20 != 1)
      {
        if (v20 != -1)
        {
          v31 = ne_log_obj();
          if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            goto LABEL_46;
          *(_DWORD *)v61 = 136315394;
          v62 = "ne_parse_necp_drop_dest_entry";
          v63 = 2080;
          v64 = v9;
          v15 = "%s: bad address %s";
          v16 = v31;
          v17 = 22;
          goto LABEL_36;
        }
        v21 = ne_log_obj();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v22 = __error();
          v23 = strerror(*v22);
          *(_DWORD *)v61 = 136315650;
          v62 = "ne_parse_necp_drop_dest_entry";
          v63 = 2080;
          v64 = v9;
          v65 = 2080;
          v66 = v23;
          _os_log_error_impl(&dword_208439000, v21, OS_LOG_TYPE_ERROR, "%s: inet_pton(AF_INET, %s) failed %s", v61, 0x20u);
        }
LABEL_27:
        v52[0] = v10;
        if ((v10 - 129) <= 0xFFFFFF7F && v52[2] == 30)
        {
          v24 = ne_log_obj();
          if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            goto LABEL_46;
          *(_DWORD *)v61 = 136315394;
          v62 = "ne_parse_necp_drop_dest_entry";
          v63 = 1024;
          LODWORD(v64) = v52[0];
          v15 = "%s: bad IPv6 prefix %d";
          goto LABEL_35;
        }
        if ((v10 - 33) <= 0xFFFFFFDF && v52[2] == 2)
        {
          v24 = ne_log_obj();
          if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            goto LABEL_46;
          *(_DWORD *)v61 = 136315394;
          v62 = "ne_parse_necp_drop_dest_entry";
          v63 = 1024;
          LODWORD(v64) = v52[0];
          v15 = "%s: bad IPv4 prefix %d";
          goto LABEL_35;
        }
        LODWORD(v35[0]) = v8;
        *(_OWORD *)((char *)v35 + 8) = *(_OWORD *)v52;
        *(_OWORD *)((char *)&v35[1] + 5) = *(_OWORD *)&v52[13];
        _Block_object_dispose(&v36, 8);
        _Block_object_dispose(&v40, 8);
        _Block_object_dispose(&v44, 8);
        _Block_object_dispose(&v48, 8);
        v25 = *(unsigned int **)(a1 + 40);
        v26 = *v25;
        if ((_DWORD)v26)
        {
          v27 = 0;
          v28 = BYTE8(v35[0]);
          v29 = (unsigned __int8 *)v25 + 13;
          v30 = 1;
          do
          {
            if (*(_DWORD *)(v29 - 9) == v8
              && *(v29 - 1) == v28
              && !memcmp(v29, (const void *)((unint64_t)v35 | 9), *v29))
            {
              break;
            }
            v30 = ++v27 < v26;
            v29 += 40;
          }
          while (v26 != v27);
          if (v30)
            return 1;
        }
        else
        {
          LODWORD(v26) = 0;
        }
        v33 = &v25[10 * v26];
        v34 = v35[1];
        *(_OWORD *)(v33 + 1) = v35[0];
        *(_OWORD *)(v33 + 5) = v34;
        *(_QWORD *)(v33 + 9) = *(_QWORD *)&v35[2];
        ++**(_DWORD **)(a1 + 40);
        return 1;
      }
      v19 = 528;
    }
    *(_WORD *)&v52[1] = v19;
    goto LABEL_27;
  }
  v18 = ne_log_obj();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v61 = 136315138;
    v62 = "ne_parse_necp_drop_dest_entry";
    v15 = "%s: address_str is NULL";
    v16 = v18;
    v17 = 12;
    goto LABEL_36;
  }
LABEL_46:
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);
LABEL_47:
  v32 = ne_log_obj();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "ne_session_parse_necp_drop_dest_array_block_invoke";
    _os_log_error_impl(&dword_208439000, v32, OS_LOG_TYPE_ERROR, "%s: not valid", (uint8_t *)&buf, 0xCu);
  }
  result = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  return result;
}

uint64_t __ne_parse_necp_drop_dest_dictionary_block_invoke(uint64_t a1, char *__s1)
{
  NSObject *v4;
  uint64_t result;
  char *value;
  int v7;
  const char *v8;
  __int16 v9;
  char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (!strcmp(__s1, "Level"))
  {
    value = (char *)xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 64), "Level");
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = ne_session_get_necp_level_from_xpc_value(value);
    return 1;
  }
  if (!strcmp(__s1, "Address"))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 64), "Address");
    return 1;
  }
  if (!strcmp(__s1, "Prefix"))
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = xpc_dictionary_get_int64(*(xpc_object_t *)(a1 + 64), "Prefix");
    return 1;
  }
  v4 = ne_log_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v7 = 136315394;
    v8 = "ne_parse_necp_drop_dest_dictionary_block_invoke";
    v9 = 2080;
    v10 = __s1;
    _os_log_error_impl(&dword_208439000, v4, OS_LOG_TYPE_ERROR, "%s: unexpected key %s", (uint8_t *)&v7, 0x16u);
  }
  result = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  return result;
}

char *ne_session_get_necp_level_from_xpc_value(char *result)
{
  char *v1;
  char *string_ptr;
  unint64_t value;
  char **v4;
  char *v5;

  if (result)
  {
    v1 = result;
    string_ptr = (char *)xpc_string_get_string_ptr(result);
    if (!string_ptr)
    {
      value = xpc_int64_get_value(v1);
      if (value > 0xA)
        return 0;
      string_ptr = ne_necp_legacy_level_to_string_mapping[value];
    }
    v4 = &ne_necp_policy_string_to_level_mapping;
    result = "Unknown";
    while (strcasecmp(result, string_ptr))
    {
      v5 = v4[2];
      v4 += 2;
      result = v5;
      if (!v5)
        return result;
    }
    return (char *)*((unsigned int *)v4 + 2);
  }
  return result;
}

uint64_t ne_session_add_necp_drop_dest_from_dest_list(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  NSObject *v10;
  int *v12;
  char *v13;
  const char *v14;
  int *v15;
  char *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  int v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  char *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v37 = 0;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  if (!a1
    || MEMORY[0x20BD087A4](a1, a2, a3, a4, a5, a6, a7, a8, v17, *((_QWORD *)&v17 + 1), v18, *((_QWORD *)&v18 + 1), v19, *((_QWORD *)&v19 + 1), v20, *((_QWORD *)&v20 + 1), v21, *((_QWORD *)&v21 + 1), v22,
         *((_QWORD *)&v22 + 1),
         v23,
         *((_QWORD *)&v23 + 1),
         v24,
         *((_QWORD *)&v24 + 1),
         v25,
         *((_QWORD *)&v25 + 1),
         v26,
         *((_QWORD *)&v26 + 1),
         v27,
         *((_QWORD *)&v27 + 1),
         v28,
         *((_QWORD *)&v28 + 1),
         v29,
         *((_QWORD *)&v29 + 1),
         v30,
         *((_QWORD *)&v30 + 1),
         v31,
         *((_QWORD *)&v31 + 1),
         v32,
         *((_QWORD *)&v32 + 1),
         v33) != MEMORY[0x24BDACF78])
  {
    v9 = 22;
LABEL_4:
    v10 = ne_log_obj();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      return v9;
    v15 = __error();
    v16 = strerror(*v15);
    *(_DWORD *)buf = 136315394;
    v39 = "ne_session_add_necp_drop_dest_from_dest_list";
    v40 = 2080;
    v41 = v16;
    v14 = "%s: failed %s";
LABEL_11:
    _os_log_error_impl(&dword_208439000, v10, OS_LOG_TYPE_ERROR, v14, buf, 0x16u);
    return v9;
  }
  v9 = ne_session_parse_necp_drop_dest_array(a1, (uint64_t)&v17);
  if ((_DWORD)v9)
    goto LABEL_4;
  if (!sysctlbyname("net.necp.drop_dest_level", 0, 0, &v17, 0x144uLL))
    return 0;
  v9 = *__error();
  v10 = ne_log_obj();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v12 = __error();
    v13 = strerror(*v12);
    *(_DWORD *)buf = 136315394;
    v39 = "ne_session_add_necp_drop_dest_from_dest_list";
    v40 = 2080;
    v41 = v13;
    v14 = "%s: set sysctlbyname(net.necp.drop_dest_level) failed %s";
    goto LABEL_11;
  }
  return v9;
}

uint64_t ne_session_initialize_necp_drop_dest()
{
  uint64_t v0;
  const char *v1;
  char **v2;
  uint64_t v3;
  int v4;
  int v5;
  off_t st_size;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  NSObject *v12;
  int *v13;
  char *v14;
  const char *v15;
  int *v16;
  char *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  stat v40;
  uint64_t v41;

  v0 = 0;
  v41 = *MEMORY[0x24BDAC8D0];
  LODWORD(v39) = 0;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v1 = "/var/mobile/Library/terminus/com.apple.necp_drop_dest.plist";
  v2 = &off_24C0A09D0;
  v19 = 0u;
  v20 = 0u;
  v3 = MEMORY[0x24BDACF78];
  do
  {
    v4 = open(v1, 0, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35,
           v36,
           v37,
           v38,
           v39);
    if (v4 != -1)
    {
      v5 = v4;
      memset(&v40, 0, sizeof(v40));
      if (fstat(v4, &v40))
        st_size = 0;
      else
        st_size = v40.st_size;
      if ((unint64_t)(st_size - 1) > 0x27FE)
      {
        if (st_size <= 0)
          v0 = v0;
        else
          v0 = 27;
      }
      else
      {
        v7 = malloc_type_malloc(st_size, 0x89CDE578uLL);
        if (v7)
        {
          v8 = v7;
          if (pread(v5, v7, st_size, 0) == st_size)
          {
            v9 = xpc_create_from_plist();
            if (v9)
            {
              v10 = (void *)v9;
              if (MEMORY[0x20BD087A4]() == v3)
                v0 = ne_session_parse_necp_drop_dest_array(v10, (uint64_t)&v19);
              else
                v0 = 22;
              xpc_release(v10);
            }
            else
            {
              v0 = 22;
            }
          }
          free(v8);
        }
        else
        {
          v0 = 55;
        }
      }
      close(v5);
    }
    v11 = *v2++;
    v1 = v11;
  }
  while (v11);
  if ((_DWORD)v0)
  {
    v12 = ne_log_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = __error();
      v14 = strerror(*v13);
      v40.st_dev = 136315394;
      *(_QWORD *)&v40.st_mode = "ne_session_initialize_necp_drop_dest";
      WORD2(v40.st_ino) = 2080;
      *(__darwin_ino64_t *)((char *)&v40.st_ino + 6) = (__darwin_ino64_t)v14;
      v15 = "%s: failed %s";
LABEL_28:
      _os_log_error_impl(&dword_208439000, v12, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v40, 0x16u);
    }
  }
  else
  {
    if (!sysctlbyname("net.necp.drop_dest_level", 0, 0, &v19, 0x144uLL))
      return 0;
    v0 = *__error();
    v12 = ne_log_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v16 = __error();
      v17 = strerror(*v16);
      v40.st_dev = 136315394;
      *(_QWORD *)&v40.st_mode = "ne_session_initialize_necp_drop_dest";
      WORD2(v40.st_ino) = 2080;
      *(__darwin_ino64_t *)((char *)&v40.st_ino + 6) = (__darwin_ino64_t)v17;
      v15 = "%s: set sysctlbyname(net.necp.drop_dest_level) failed %s";
      goto LABEL_28;
    }
  }
  return v0;
}

void *necp_drop_dest_copy_dest_entry_list()
{
  NSObject *v0;
  void *v1;
  xpc_object_t v3;
  uint64_t v4;
  xpc_object_t v5;
  void *v6;
  char *v7;
  int v8;
  xpc_object_t v9;
  NSObject *v10;
  xpc_object_t xpc_string_from_necp_level;
  int v12;
  int v13;
  int *v14;
  char *v15;
  const char *v16;
  NSObject *v17;
  int *v18;
  char *v19;
  int *v20;
  char *v21;
  size_t v22;
  _OWORD v23[20];
  int v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  _BYTE v28[10];
  __int16 v29;
  char *v30;
  char string[4];
  const char *v32;
  __int16 v33;
  char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v24 = 0;
  memset(v23, 0, sizeof(v23));
  v22 = 0;
  if (sysctlbyname("net.necp.drop_dest_level", 0, &v22, 0, 0))
  {
    v0 = ne_log_obj();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
      goto LABEL_28;
    return 0;
  }
  v22 = 324;
  if (!sysctlbyname("net.necp.drop_dest_level", v23, &v22, 0, 0))
  {
    v3 = xpc_array_create(0, 0);
    if (!v3)
    {
      v0 = ne_log_obj();
      if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
      {
        v14 = __error();
        v15 = strerror(*v14);
        *(_DWORD *)string = 136315394;
        v32 = "necp_drop_dest_copy_dest_entry_list";
        v33 = 2080;
        v34 = v15;
        v16 = "%s: xpc_array_create() failed %s";
LABEL_29:
        _os_log_error_impl(&dword_208439000, v0, OS_LOG_TYPE_ERROR, v16, (uint8_t *)string, 0x16u);
        return 0;
      }
      return 0;
    }
    v1 = v3;
    v4 = 0;
    while (1)
    {
      v5 = xpc_dictionary_create(0, 0, 0);
      if (!v5)
      {
        v17 = ne_log_obj();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v20 = __error();
          v21 = strerror(*v20);
          *(_DWORD *)buf = 136315394;
          v26 = "necp_drop_dest_copy_dest_entry_list";
          v27 = 2080;
          *(_QWORD *)v28 = v21;
          _os_log_error_impl(&dword_208439000, v17, OS_LOG_TYPE_ERROR, "%s: xpc_dictionary_create() failed %s", buf, 0x16u);
        }
        xpc_release(v1);
        return 0;
      }
      v6 = v5;
      v7 = (char *)v23 + v4;
      v8 = *((unsigned __int8 *)v23 + v4 + 14);
      if (v8 == 30)
      {
        if (v7[13] != 28)
          goto LABEL_19;
        inet_ntop(30, (char *)&v23[1] + v4 + 5, string, 0x2Eu);
        xpc_string_from_necp_level = ne_session_create_xpc_string_from_necp_level(*((_DWORD *)v7 + 1));
        xpc_dictionary_set_value(v6, "Level", xpc_string_from_necp_level);
        xpc_release(xpc_string_from_necp_level);
        xpc_dictionary_set_int64(v6, "Prefix", v7[12]);
        xpc_dictionary_set_string(v6, "Address", string);
        v10 = ne_log_obj();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          goto LABEL_19;
      }
      else
      {
        if (v8 != 2)
          goto LABEL_19;
        if (v7[13] != 16)
          goto LABEL_19;
        inet_ntop(2, (char *)&v23[1] + v4 + 1, string, 0x2Eu);
        v9 = ne_session_create_xpc_string_from_necp_level(*((_DWORD *)v7 + 1));
        xpc_dictionary_set_value(v6, "Level", v9);
        xpc_release(v9);
        xpc_dictionary_set_int64(v6, "Prefix", v7[12]);
        xpc_dictionary_set_string(v6, "Address", string);
        v10 = ne_log_obj();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          goto LABEL_19;
      }
      v12 = *((_DWORD *)v7 + 1);
      v13 = v7[12];
      *(_DWORD *)buf = 136315906;
      v26 = "necp_drop_dest_copy_dest_entry_list";
      v27 = 1024;
      *(_DWORD *)v28 = v12;
      *(_WORD *)&v28[4] = 1024;
      *(_DWORD *)&v28[6] = v13;
      v29 = 2080;
      v30 = string;
      _os_log_impl(&dword_208439000, v10, OS_LOG_TYPE_INFO, "%s: level %u prefix %u address %s", buf, 0x22u);
LABEL_19:
      if (xpc_dictionary_get_count(v6))
        xpc_array_append_value(v1, v6);
      xpc_release(v6);
      v4 += 40;
      if (v4 == 320)
        return v1;
    }
  }
  v0 = ne_log_obj();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
LABEL_28:
    v18 = __error();
    v19 = strerror(*v18);
    *(_DWORD *)string = 136315394;
    v32 = "necp_drop_dest_copy_dest_entry_list";
    v33 = 2080;
    v34 = v19;
    v16 = "%s: sysctlbyname(net.necp.drop_dest_level) failed %s";
    goto LABEL_29;
  }
  return 0;
}

xpc_object_t ne_session_create_xpc_string_from_necp_level(unsigned int a1)
{
  const char *v1;
  int *i;
  int v4;

  if (a1 > 0xB)
    return xpc_string_create("Unknown");
  if (LODWORD((&ne_necp_policy_string_to_level_mapping)[2 * a1 + 1]) != a1)
  {
    if (a1)
    {
      for (i = &dword_24C0A0DB0; ; i += 4)
      {
        v1 = (const char *)*((_QWORD *)i - 1);
        if (!v1)
          break;
        v4 = *i;
        if (v4 == a1)
          return xpc_string_create(v1);
      }
    }
    return xpc_string_create("Unknown");
  }
  v1 = (&ne_necp_policy_string_to_level_mapping)[2 * a1];
  return xpc_string_create(v1);
}

BOOL check_alf_plist_if_enabled()
{
  int v0;
  int v1;
  off_t st_size;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  xpc_object_t value;
  xpc_object_t v8;
  _BOOL8 v9;
  stat v11;

  v0 = open("/Library/Preferences/com.apple.alf.plist", 0);
  if (v0 == -1)
    return 0;
  v1 = v0;
  memset(&v11, 0, sizeof(v11));
  if (fstat(v0, &v11))
    st_size = 0;
  else
    st_size = v11.st_size;
  if ((unint64_t)(st_size - 1) <= 0x18FFE && (v3 = malloc_type_malloc(st_size, 0xDBEFE944uLL)) != 0)
  {
    v4 = v3;
    if (pread(v1, v3, st_size, 0) == st_size && (v5 = (void *)xpc_create_from_plist()) != 0)
    {
      v6 = v5;
      value = xpc_dictionary_get_value(v5, "enable_drop_all");
      v9 = value
        && xpc_int64_get_value(value)
        && (v8 = xpc_dictionary_get_value(v6, "globalstate")) != 0
        && xpc_int64_get_value(v8) != 0;
      xpc_release(v6);
    }
    else
    {
      v9 = 0;
    }
    free(v4);
  }
  else
  {
    v9 = 0;
  }
  close(v1);
  return v9;
}

uint64_t ne_session_initialize_necp_drop_all()
{
  int v0;
  int v1;
  off_t st_size;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char *value;
  uint64_t v8;
  uint64_t v9;
  unsigned int necp_level_from_xpc_value;
  stat v12;

  v0 = open("/Library/Preferences/com.apple.networkextension.necp.plist", 0);
  if (v0 == -1)
    return ne_session_initialize_necp_drop_dest();
  v1 = v0;
  memset(&v12, 0, sizeof(v12));
  if (fstat(v0, &v12))
    st_size = 0;
  else
    st_size = v12.st_size;
  if ((unint64_t)(st_size - 1) > 0x27FE)
  {
    if (st_size <= 0)
      v8 = 0;
    else
      v8 = 27;
  }
  else
  {
    v3 = malloc_type_malloc(st_size, 0x3029F0BBuLL);
    if (v3)
    {
      v4 = v3;
      if (pread(v1, v3, st_size, 0) == st_size)
      {
        v5 = (void *)xpc_create_from_plist();
        if (v5)
        {
          v6 = v5;
          value = (char *)xpc_dictionary_get_value(v5, "drop_all_level");
          if (value)
          {
            necp_level_from_xpc_value = ne_session_get_necp_level_from_xpc_value(value);
            if (!necp_level_from_xpc_value)
              necp_level_from_xpc_value = check_alf_plist_if_enabled();
            v8 = sysctlbyname("net.necp.drop_all_level", 0, 0, &necp_level_from_xpc_value, 4uLL);
          }
          else
          {
            v8 = 22;
          }
          xpc_release(v6);
        }
        else
        {
          v8 = 22;
        }
      }
      else
      {
        v8 = 0;
      }
      free(v4);
    }
    else
    {
      v8 = 55;
    }
  }
  close(v1);
  v9 = ne_session_initialize_necp_drop_dest();
  if (!(_DWORD)v8)
    return v9;
  return v8;
}

unsigned __int8 *ne_session_copy_policy_match(const char *a1, char *__s, const char *a3, const unsigned __int8 *a4, _OWORD *a5, int a6, int a7, int a8, int a9)
{
  size_t v15;
  size_t v16;
  size_t v17;
  char *v18;
  char *v19;
  int v20;
  size_t v21;
  uint64_t v22;
  int v23;
  size_t v24;
  int v25;
  size_t v26;
  unsigned __int8 *v27;
  int matched;
  NSObject *v30;
  const char *v31;
  const char *v32;
  uint8_t buf[4];
  char *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  char *v42;
  char v43[48];
  char out[48];
  uuid_t uu;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  if (__s)
  {
    v15 = strlen(__s) + 48;
    if (!a1)
      goto LABEL_4;
    goto LABEL_3;
  }
  v15 = 42;
  if (a1)
LABEL_3:
    v15 += strlen(a1) + 6;
LABEL_4:
  if (a3)
    v15 += strlen(a3) + 6;
  v16 = v15 + 9;
  if (!a6)
    v16 = v15;
  if (a7)
    v16 += 9;
  if (a8)
    v16 += 7;
  if (a9)
    v17 = v16 + 9;
  else
    v17 = v16;
  v18 = (char *)malloc_type_malloc(v17, 0x3578CCD1uLL);
  if (!v18)
    return 0;
  v19 = v18;
  bzero(v18, v17);
  *v19 = 1;
  *(_DWORD *)(v19 + 1) = 16;
  *(_OWORD *)(v19 + 5) = *(_OWORD *)a4;
  v19[21] = 2;
  *(_DWORD *)(v19 + 22) = 16;
  *(_OWORD *)(v19 + 26) = *a5;
  if (!__s)
  {
    v22 = (uint64_t)(v19 + 42);
    if (!a1)
      goto LABEL_29;
    goto LABEL_25;
  }
  v20 = strlen(__s);
  v19[42] = 4;
  v21 = (v20 + 1);
  *(_DWORD *)(v19 + 43) = v21;
  if (v20 == -1)
    v21 = 0;
  else
    memcpy(v19 + 47, __s, v21);
  v22 = (uint64_t)&v19[v21 + 47];
  if (a1)
  {
LABEL_25:
    v23 = strlen(a1);
    *(_BYTE *)v22 = 3;
    v24 = (v23 + 1);
    *(_DWORD *)(v22 + 1) = v24;
    if (v23 == -1)
      v24 = 0;
    else
      memcpy((void *)(v22 + 5), a1, v24);
    v22 += v24 + 5;
  }
LABEL_29:
  if (a3)
  {
    v25 = strlen(a3);
    *(_BYTE *)v22 = 9;
    v26 = (v25 + 1);
    *(_DWORD *)(v22 + 1) = v26;
    if (v25 == -1)
      v26 = 0;
    else
      memcpy((void *)(v22 + 5), a3, v26);
    v22 += v26 + 5;
  }
  if (a6)
  {
    *(_BYTE *)v22 = 6;
    *(_DWORD *)(v22 + 1) = 4;
    *(_DWORD *)(v22 + 5) = a6;
    v22 += 9;
  }
  if (a7)
  {
    *(_BYTE *)v22 = 7;
    *(_DWORD *)(v22 + 1) = 4;
    *(_DWORD *)(v22 + 5) = a7;
    v22 += 9;
  }
  if (a8)
  {
    *(_BYTE *)v22 = 11;
    *(_DWORD *)(v22 + 1) = 2;
    *(_WORD *)(v22 + 5) = a8;
    v22 += 7;
  }
  if (a9)
  {
    *(_BYTE *)v22 = 10;
    *(_DWORD *)(v22 + 1) = 4;
    *(_DWORD *)(v22 + 5) = a9;
  }
  v27 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x1CCuLL, 0x1000040E72E3491uLL);
  matched = necp_match_policy();
  free(v19);
  if (matched || !*(_DWORD *)v27 && !*((_DWORD *)v27 + 2) && !*((_DWORD *)v27 + 4))
  {
    free(v27);
    nelog_is_info_logging_enabled();
    return 0;
  }
  if (nelog_is_info_logging_enabled())
  {
    if (*((_DWORD *)v27 + 10) == 2)
    {
      memset(uu, 0, sizeof(uu));
      memset(out, 0, 37);
      memset(v43, 0, 37);
      uuid_clear(uu);
      uuid_copy(uu, v27 + 20);
      uuid_unparse(uu, out);
      uuid_unparse(a4, v43);
      v30 = ne_log_obj();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        v31 = "";
        *(_DWORD *)buf = 136315906;
        if (a1)
          v32 = a1;
        else
          v32 = "";
        v36 = v43;
        v37 = 2080;
        if (__s)
          v31 = __s;
        v38 = v32;
        v39 = 2080;
        v40 = v31;
        v41 = 2080;
        v42 = out;
        _os_log_impl(&dword_208439000, v30, OS_LOG_TYPE_INFO, "App %s, domain=%s, account=%s matched policy for service %s", buf, 0x2Au);
      }
    }
  }
  return v27;
}

uint64_t ne_session_policy_match_get_service_type(uint64_t result)
{
  if (result)
    return *(unsigned int *)(result + 40);
  return result;
}

uint64_t ne_session_policy_match_get_service(uint64_t a1, uuid_t dst)
{
  BOOL v2;
  uint64_t v3;

  if (a1)
    v2 = dst == 0;
  else
    v2 = 1;
  v3 = !v2;
  if (!v2)
    uuid_copy(dst, (const unsigned __int8 *)(a1 + 20));
  return v3;
}

_DWORD *ne_session_policy_match_is_flow_divert(_DWORD *result)
{
  if (result)
    return (_DWORD *)(*result == 4);
  return result;
}

_DWORD *ne_session_policy_match_get_flow_divert_unit(_DWORD *result)
{
  if (result)
  {
    if (*result == 4)
      return (_DWORD *)result[1];
    else
      return 0;
  }
  return result;
}

_DWORD *ne_session_policy_match_is_drop(_DWORD *result)
{
  if (result)
    return (_DWORD *)(*result == 3);
  return result;
}

uint64_t ne_session_policy_match_get_filter_unit(uint64_t result)
{
  if (result)
    return *(unsigned int *)(result + 8);
  return result;
}

uint64_t ne_session_policy_match_get_service_action()
{
  return 0;
}

uint64_t ne_session_policy_match_service_is_registered(uint64_t result)
{
  if (result)
    return *(_BYTE *)(result + 36) & 1;
  return result;
}

_DWORD *ne_session_policy_match_get_scoped_interface_index(_DWORD *result)
{
  if (result)
  {
    if (*result == 12 || *result == 6)
      return (_DWORD *)result[1];
    else
      return 0;
  }
  return result;
}

uint64_t nehelper_queue()
{
  if (globals_init_sess_init != -1)
    dispatch_once(&globals_init_sess_init, &__block_literal_global_171);
  return g_queue;
}

_xpc_connection_s *nehelper_copy_connection_for_delegate_class(unint64_t a1)
{
  NSObject *v2;
  _xpc_connection_s *v3;
  NSObject *v4;
  _BOOL4 v5;
  _xpc_connection_s *mach_service;
  NSObject *v8;
  _QWORD v9[6];
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (globals_init_sess_init != -1)
    dispatch_once(&globals_init_sess_init, &__block_literal_global_171);
  if (a1 < 0xF)
  {
    os_unfair_lock_lock(&nehelper_copy_connection_for_delegate_class_g_connection_cache_lock);
    v3 = (_xpc_connection_s *)nehelper_copy_connection_for_delegate_class_g_connection_cache[a1];
    v4 = ne_log_obj();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
    if (v3)
    {
      if (v5)
      {
        *(_DWORD *)buf = 134217984;
        v11 = (const char *)a1;
        _os_log_debug_impl(&dword_208439000, v4, OS_LOG_TYPE_DEBUG, "Re-using existing nehelper connection for delegate class %llu", buf, 0xCu);
      }
    }
    else
    {
      if (v5)
      {
        *(_DWORD *)buf = 134217984;
        v11 = (const char *)a1;
        _os_log_debug_impl(&dword_208439000, v4, OS_LOG_TYPE_DEBUG, "Creating a new nehelper connection for delegate class %llu", buf, 0xCu);
      }
      mach_service = xpc_connection_create_mach_service("com.apple.nehelper", (dispatch_queue_t)g_queue, 2uLL);
      if (!mach_service)
      {
        v8 = ne_log_obj();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v11 = "com.apple.nehelper";
          v12 = 2048;
          v13 = a1;
          _os_log_error_impl(&dword_208439000, v8, OS_LOG_TYPE_ERROR, "xpc_connection_create_mach_service(%s, XPC_CONNECTION_MACH_SERVICE_PRIVILEGED) failed for delegate class %llu", buf, 0x16u);
        }
        v3 = 0;
        goto LABEL_15;
      }
      v3 = mach_service;
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 0x40000000;
      v9[2] = __nehelper_copy_connection_for_delegate_class_block_invoke;
      v9[3] = &__block_descriptor_tmp_71;
      v9[4] = a1;
      v9[5] = mach_service;
      xpc_connection_set_event_handler(mach_service, v9);
      xpc_connection_resume(v3);
      nehelper_copy_connection_for_delegate_class_g_connection_cache[a1] = v3;
    }
    xpc_retain(v3);
LABEL_15:
    os_unfair_lock_unlock(&nehelper_copy_connection_for_delegate_class_g_connection_cache_lock);
    return v3;
  }
  v2 = ne_log_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    v11 = (const char *)a1;
    _os_log_error_impl(&dword_208439000, v2, OS_LOG_TYPE_ERROR, "Invalid delegate class id: %llu", buf, 0xCu);
  }
  return 0;
}

void __nehelper_copy_connection_for_delegate_class_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    if (MEMORY[0x20BD087A4](a2) == MEMORY[0x24BDACFB8])
    {
      if (a2 == MEMORY[0x24BDACF30])
      {
        v11 = ne_log_obj();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v12 = *(_QWORD *)(a1 + 32);
          v14 = 134217984;
          v15 = v12;
          _os_log_impl(&dword_208439000, v11, OS_LOG_TYPE_DEFAULT, "nehelper connection for delegate class %llu was interrupted", (uint8_t *)&v14, 0xCu);
        }
      }
      else
      {
        os_unfair_lock_lock(&nehelper_copy_connection_for_delegate_class_g_connection_cache_lock);
        v8 = (void *)nehelper_copy_connection_for_delegate_class_g_connection_cache[*(_QWORD *)(a1 + 32)];
        if (*(void **)(a1 + 40) == v8)
        {
          v9 = ne_log_obj();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            v10 = *(_QWORD *)(a1 + 32);
            v14 = 134217984;
            v15 = v10;
            _os_log_impl(&dword_208439000, v9, OS_LOG_TYPE_DEFAULT, "nehelper connection for delegate class %llu received XPC_ERROR_CONNECTION_INVALID", (uint8_t *)&v14, 0xCu);
          }
          nehelper_copy_connection_for_delegate_class_g_connection_cache[*(_QWORD *)(a1 + 32)] = 0;
          xpc_release(v8);
        }
        os_unfair_lock_unlock(&nehelper_copy_connection_for_delegate_class_g_connection_cache_lock);
      }
    }
    else
    {
      v4 = (void *)MEMORY[0x20BD08648](a2);
      v5 = ne_log_obj();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v13 = *(_QWORD *)(a1 + 32);
        v14 = 134218242;
        v15 = v13;
        v16 = 2080;
        v17 = v4;
        _os_log_error_impl(&dword_208439000, v5, OS_LOG_TYPE_ERROR, "nehelper connection for delegate class %llu received unknown message: %s", (uint8_t *)&v14, 0x16u);
      }
      free(v4);
    }
  }
  else
  {
    v6 = ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v14 = 134217984;
      v15 = v7;
      _os_log_error_impl(&dword_208439000, v6, OS_LOG_TYPE_ERROR, "nehelper connection for delegate class %llu received a NULL message", (uint8_t *)&v14, 0xCu);
    }
  }
}

uint64_t ne_session_address_matches_subnets(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  int v7;
  const char *v8;
  void *v9;
  xpc_object_t value;
  xpc_object_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  size_t count;
  size_t v16;
  int8x16_t *v17;
  int v18;
  _DWORD *v19;
  _DWORD *v20;
  _DWORD *v21;
  int8x16_t *data;
  int8x16_t *v23;
  int8x16_t *v24;
  uint64_t v25;
  uint64_t v26;
  int8x16_t v27;
  uint64_t v28;
  uint64_t v29;
  int8x16_t v30;
  size_t length;

  result = 0;
  if (a1 && a2)
  {
    v5 = MEMORY[0x20BD087A4](a2);
    v6 = MEMORY[0x24BDACFA0];
    if (v5 != MEMORY[0x24BDACFA0])
      return 0;
    v7 = *(unsigned __int8 *)(a1 + 1);
    if (v7 == 2)
    {
      v8 = "ipv4-subnets";
    }
    else
    {
      if (v7 != 30)
        return 0;
      v8 = "ipv6-subnets";
    }
    result = (uint64_t)xpc_dictionary_get_value(a2, v8);
    if (result)
    {
      v9 = (void *)result;
      if (MEMORY[0x20BD087A4]() != v6)
        return 0;
      value = xpc_dictionary_get_value(v9, "subnet-addresses");
      v11 = xpc_dictionary_get_value(v9, "subnet-masks");
      if (!value)
        return 0;
      v12 = v11;
      v13 = MEMORY[0x20BD087A4](value);
      v14 = MEMORY[0x24BDACF78];
      if (v13 != MEMORY[0x24BDACF78])
        return 0;
      if (v12)
      {
        if (MEMORY[0x20BD087A4](v12) != v14)
          return 0;
        count = xpc_array_get_count(value);
        if (count != xpc_array_get_count(v12))
          return 0;
      }
      else
      {
        count = xpc_array_get_count(value);
      }
      if (!count)
        return 0;
      v16 = 0;
      v17 = (int8x16_t *)(a1 + 8);
      do
      {
        length = 0;
        v18 = *(unsigned __int8 *)(a1 + 1);
        if (v18 == 30)
        {
          data = (int8x16_t *)xpc_array_get_data(value, v16, &length);
          if (!data || length < 0x10)
            goto LABEL_43;
          v23 = data;
          if (v12)
          {
            v24 = (int8x16_t *)xpc_array_get_data(v12, v16, &length);
            if (!v24 || length <= 0xF)
              goto LABEL_43;
            v27 = vandq_s8(*v23, *v24);
            v26 = v27.i64[1];
            v25 = v27.i64[0];
            v30 = vandq_s8(*v17, *v24);
            v29 = v30.i64[1];
            v28 = v30.i64[0];
          }
          else
          {
            v25 = data->i64[0];
            v26 = data->i64[1];
            v28 = v17->i64[0];
            v29 = *(_QWORD *)(a1 + 16);
          }
          if (v25 == v28 && v26 == v29)
            return 1;
        }
        else if (v18 == 2)
        {
          v19 = xpc_array_get_data(value, v16, &length);
          if (v19)
          {
            if (length >= 4)
            {
              v20 = v19;
              if (v12)
              {
                v21 = xpc_array_get_data(v12, v16, &length);
                if (v21 && length >= 4 && ((*(_DWORD *)(a1 + 4) ^ *v20) & *v21) == 0)
                  return 1;
              }
              else if (*v19 == *(_DWORD *)(a1 + 4))
              {
                return 1;
              }
            }
          }
        }
LABEL_43:
        result = 0;
        ++v16;
      }
      while (count != v16);
    }
  }
  return result;
}

BOOL ne_session_service_matches_address_for_interface(const unsigned __int8 *a1, int a2, uint64_t a3, const char *a4, char *a5, _BYTE *a6)
{
  _BOOL8 v12;
  int v13;
  BOOL v14;
  xpc_object_t v15;
  void *v16;
  xpc_object_t session_dict_from_cache;
  void *domain_dict_from_session_dict;
  uint64_t v19;
  void *v20;
  xpc_object_t v21;
  void *v22;
  xpc_object_t v23;
  xpc_object_t value;
  xpc_object_t v25;

  if (a6)
    *a6 = 0;
  v12 = 0;
  if (a3 && a4)
  {
    v13 = *(unsigned __int8 *)(a3 + 1);
    v14 = v13 == 30 || v13 == 2;
    if (v14 && (a2 - 3) >= 0xFFFFFFFE)
    {
      os_unfair_lock_lock(&_ne_session_cache_lock);
      v15 = ne_session_copy_cached_values_locked();
      if (v15)
      {
        v16 = v15;
        session_dict_from_cache = ne_session_get_session_dict_from_cache(v15, a1, a2);
        domain_dict_from_session_dict = ne_session_get_domain_dict_from_session_dict(session_dict_from_cache, a5, a4);
        v19 = MEMORY[0x24BDACFA0];
        if (domain_dict_from_session_dict
          && (v20 = domain_dict_from_session_dict, MEMORY[0x20BD087A4]() == v19)
          && xpc_dictionary_get_BOOL(v20, "service-probe-failed")
          || (v21 = xpc_dictionary_get_value(v16, "redirected-addresses")) != 0
          && (v22 = v21, MEMORY[0x20BD087A4]() == v19)
          && (v23 = xpc_dictionary_get_value(v22, a4), ne_session_address_matches_subnets(a3, v23)))
        {
          v12 = 1;
          if (a6)
            *a6 = 1;
        }
        else
        {
          v12 = 0;
          if (a2 == 1)
          {
            if (session_dict_from_cache)
            {
              if (MEMORY[0x20BD087A4](session_dict_from_cache) == v19)
              {
                value = xpc_dictionary_get_value(session_dict_from_cache, "included-routes");
                if (ne_session_address_matches_subnets(a3, value))
                {
                  v25 = xpc_dictionary_get_value(session_dict_from_cache, "excluded-routes");
                  if (!ne_session_address_matches_subnets(a3, v25))
                    v12 = 1;
                }
              }
            }
          }
        }
        xpc_release(v16);
      }
      else
      {
        v12 = 0;
      }
      os_unfair_lock_unlock(&_ne_session_cache_lock);
    }
    else
    {
      return 0;
    }
  }
  return v12;
}

xpc_object_t ne_session_copy_cached_values_locked()
{
  void *v0;
  uint64_t v1;
  NSObject *v3;
  _QWORD v4[5];

  if (globals_init_sess_init != -1)
    dispatch_once(&globals_init_sess_init, &__block_literal_global_171);
  os_unfair_lock_assert_owner(&_ne_session_cache_lock);
  if (_ne_session_cache_notify_token == -1)
    notify_register_dispatch("com.apple.networkextension.ondemandcachechanged", &_ne_session_cache_notify_token, (dispatch_queue_t)g_queue, &__block_literal_global_214);
  v0 = (void *)_ne_session_master_cache;
  if (_ne_session_master_cache)
    return xpc_retain(v0);
  os_unfair_lock_unlock(&_ne_session_cache_lock);
  v3 = dispatch_semaphore_create(0);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 0x40000000;
  v4[2] = __ne_session_copy_cached_values_locked_block_invoke_3;
  v4[3] = &__block_descriptor_tmp_217;
  v4[4] = v3;
  ne_session_update_cached_values((uint64_t)v4);
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v3);
  os_unfair_lock_lock(&_ne_session_cache_lock);
  v1 = 0;
  v0 = (void *)_ne_session_master_cache;
  if (_ne_session_master_cache)
    return xpc_retain(v0);
  return (xpc_object_t)v1;
}

xpc_object_t ne_session_get_session_dict_from_cache(void *a1, const unsigned __int8 *a2, int a3)
{
  uint64_t v6;
  uint64_t v7;
  xpc_object_t result;
  void *v9;
  xpc_object_t value;
  void *v11;
  const char *v12;
  _BYTE v13[37];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = MEMORY[0x20BD087A4]();
  v7 = MEMORY[0x24BDACFA0];
  if (v6 != MEMORY[0x24BDACFA0])
    return 0;
  result = xpc_dictionary_get_value(a1, "services");
  if (result)
  {
    v9 = result;
    if (MEMORY[0x20BD087A4]() != v7)
      return 0;
    memset(v13, 0, sizeof(v13));
    uuid_unparse(a2, v13);
    value = xpc_dictionary_get_value(v9, v13);
    if (!value)
      return 0;
    v11 = value;
    if (MEMORY[0x20BD087A4]() != v7)
      return 0;
    if ((a3 - 1) >= 9)
      v12 = "<unknown>";
    else
      v12 = off_24C0A10C0[a3 - 1];
    return xpc_dictionary_get_value(v11, v12);
  }
  return result;
}

void *ne_session_get_domain_dict_from_session_dict(void *a1, char *a2, const char *a3)
{
  void *v4;
  uint64_t v7;
  uint64_t v8;
  xpc_object_t value;
  void *v11;
  xpc_object_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  size_t count;
  size_t v17;
  size_t v18;
  xpc_object_t v19;
  xpc_object_t v20;
  void *v21;
  size_t v22;
  size_t v23;
  size_t v24;
  const char *string;

  if (!a2)
    return 0;
  v4 = 0;
  if (!a1 || !*a2)
    return v4;
  v7 = MEMORY[0x20BD087A4](a1);
  v8 = MEMORY[0x24BDACFA0];
  if (v7 != MEMORY[0x24BDACFA0])
    return 0;
  value = xpc_dictionary_get_value(a1, a3);
  if (!value)
    return 0;
  v11 = value;
  if (MEMORY[0x20BD087A4]() != v8)
    return 0;
  v12 = xpc_dictionary_get_value(v11, "service-domain-info");
  if (!v12)
    return 0;
  v13 = v12;
  v14 = MEMORY[0x20BD087A4]();
  v15 = MEMORY[0x24BDACF78];
  if (v14 != MEMORY[0x24BDACF78])
    return 0;
  count = xpc_array_get_count(v13);
  if (!count)
    return 0;
  v17 = count;
  v18 = 0;
  while (1)
  {
    v19 = xpc_array_get_value(v13, v18);
    if (v19)
    {
      v4 = v19;
      if (MEMORY[0x20BD087A4]() == v8)
      {
        v20 = xpc_dictionary_get_value(v4, "service-domains");
        if (v20)
        {
          v21 = v20;
          if (MEMORY[0x20BD087A4]() == v15)
          {
            v22 = xpc_array_get_count(v21);
            if (v22)
              break;
          }
        }
      }
    }
LABEL_15:
    v4 = 0;
    if (++v18 == v17)
      return v4;
  }
  v23 = v22;
  v24 = 0;
  while (1)
  {
    string = xpc_array_get_string(v21, v24);
    if (string)
    {
      if (strstr(a2, string))
        return v4;
    }
    if (v23 == ++v24)
      goto LABEL_15;
  }
}

intptr_t __ne_session_copy_cached_values_locked_block_invoke_3(uint64_t a1, void *a2)
{
  os_unfair_lock_lock(&_ne_session_cache_lock);
  if (_ne_session_master_cache)
  {
    xpc_release((xpc_object_t)_ne_session_master_cache);
    _ne_session_master_cache = 0;
  }
  if (a2 && MEMORY[0x20BD087A4](a2) == MEMORY[0x24BDACFA0])
    _ne_session_master_cache = (uint64_t)xpc_retain(a2);
  os_unfair_lock_unlock(&_ne_session_cache_lock);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void ne_session_update_cached_values(uint64_t a1)
{
  _xpc_connection_s *v2;
  _xpc_connection_s *v3;
  xpc_object_t v4;
  void *v5;
  _QWORD handler[5];

  v2 = nehelper_copy_connection_for_delegate_class(1uLL);
  if (v2)
  {
    v3 = v2;
    v4 = xpc_dictionary_create(0, 0, 0);
    if (v4)
    {
      v5 = v4;
      xpc_dictionary_set_uint64(v4, "delegate-class-id", 1uLL);
      xpc_dictionary_set_uint64(v5, "cache-command", 1uLL);
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 0x40000000;
      handler[2] = __ne_session_update_cached_values_block_invoke;
      handler[3] = &unk_24C0A0F58;
      handler[4] = a1;
      xpc_connection_send_message_with_reply(v3, v5, (dispatch_queue_t)g_queue, handler);
      xpc_release(v5);
    }
    xpc_release(v3);
  }
}

uint64_t __ne_session_update_cached_values_block_invoke(uint64_t a1, void *a2)
{
  if (a2 && MEMORY[0x20BD087A4](a2) == MEMORY[0x24BDACFA0])
    xpc_dictionary_get_value(a2, "result-data");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __ne_session_copy_cached_values_locked_block_invoke(uint64_t a1, int a2)
{
  int v3;

  os_unfair_lock_lock(&_ne_session_cache_lock);
  v3 = _ne_session_cache_notify_token;
  os_unfair_lock_unlock(&_ne_session_cache_lock);
  if (v3 == a2)
    ne_session_update_cached_values((uint64_t)&__block_literal_global_216);
}

void __ne_session_copy_cached_values_locked_block_invoke_2(uint64_t a1, void *a2)
{
  os_unfair_lock_lock(&_ne_session_cache_lock);
  if (_ne_session_master_cache)
  {
    xpc_release((xpc_object_t)_ne_session_master_cache);
    _ne_session_master_cache = 0;
  }
  if (a2 && MEMORY[0x20BD087A4](a2) == MEMORY[0x24BDACFA0])
    _ne_session_master_cache = (uint64_t)xpc_retain(a2);
  os_unfair_lock_unlock(&_ne_session_cache_lock);
}

uint64_t ne_session_service_matches_address(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  if (a5)
    *a5 = 0;
  return 0;
}

int64_t ne_session_service_get_dns_service_id_for_interface(const unsigned __int8 *a1, int a2, char *a3, const char *a4)
{
  int64_t int64;
  xpc_object_t v8;
  void *v9;
  xpc_object_t session_dict_from_cache;
  void *domain_dict_from_session_dict;
  void *v12;

  int64 = 0;
  if (a2 == 1 && a4)
  {
    os_unfair_lock_lock(&_ne_session_cache_lock);
    v8 = ne_session_copy_cached_values_locked();
    if (v8)
    {
      v9 = v8;
      session_dict_from_cache = ne_session_get_session_dict_from_cache(v8, a1, 1);
      domain_dict_from_session_dict = ne_session_get_domain_dict_from_session_dict(session_dict_from_cache, a3, a4);
      if (domain_dict_from_session_dict
        && (v12 = domain_dict_from_session_dict, MEMORY[0x20BD087A4]() == MEMORY[0x24BDACFA0]))
      {
        int64 = xpc_dictionary_get_int64(v12, "service-dns-service");
      }
      else
      {
        int64 = 0;
      }
      os_unfair_lock_unlock(&_ne_session_cache_lock);
      xpc_release(v9);
    }
    else
    {
      os_unfair_lock_unlock(&_ne_session_cache_lock);
      return 0;
    }
  }
  return int64;
}

xpc_object_t ne_session_service_copy_cached_match_domains(const unsigned __int8 *a1, int a2)
{
  xpc_object_t v3;
  void *v4;
  xpc_object_t session_dict_from_cache;
  xpc_object_t v6;
  xpc_object_t value;

  if (a2 != 1)
    return 0;
  os_unfair_lock_lock(&_ne_session_cache_lock);
  v3 = ne_session_copy_cached_values_locked();
  if (!v3)
  {
    os_unfair_lock_unlock(&_ne_session_cache_lock);
    return 0;
  }
  v4 = v3;
  session_dict_from_cache = ne_session_get_session_dict_from_cache(v3, a1, 1);
  v6 = session_dict_from_cache;
  if (session_dict_from_cache)
  {
    if (MEMORY[0x20BD087A4](session_dict_from_cache) == MEMORY[0x24BDACFA0])
    {
      value = xpc_dictionary_get_value(v6, "match-domains");
      v6 = value;
      if (!value)
        goto LABEL_6;
      if (MEMORY[0x20BD087A4](value) == MEMORY[0x24BDACF78])
      {
        v6 = xpc_retain(v6);
        goto LABEL_6;
      }
    }
    v6 = 0;
  }
LABEL_6:
  os_unfair_lock_unlock(&_ne_session_cache_lock);
  xpc_release(v4);
  return v6;
}

uint64_t ne_session_service_get_dns_service_id()
{
  return 0;
}

uint64_t ne_session_set_socket_attributes(int a1, char *__s, const char *a3)
{
  const char *v4;
  uint64_t result;
  size_t v7;
  char *v8;
  uint64_t v9;
  size_t v10;
  size_t v11;
  int v12;
  size_t v13;
  int v14;
  size_t v15;
  int v16;

  if (a1 == -1)
    return 0;
  v4 = __s;
  if (!((unint64_t)__s | (unint64_t)a3))
    return 1;
  if (__s)
  {
    v7 = strlen(__s) + 6;
    if (!a3)
      goto LABEL_8;
    goto LABEL_7;
  }
  v7 = 0;
  if (a3)
LABEL_7:
    v7 += strlen(a3) + 6;
LABEL_8:
  result = (uint64_t)malloc_type_malloc(v7, 0xD44B12FFuLL);
  if (result)
  {
    v8 = (char *)result;
    bzero((void *)result, v7);
    v9 = (uint64_t)v8;
    if (v4)
    {
      v10 = strlen(v4);
      if (v10 >= 2)
      {
        v11 = v10 - 1;
        if (v4[v10 - 1] == 46)
        {
          __strncpy_chk();
          ne_session_trim_domain_domain_buffer_227[v11] = 0;
          v4 = ne_session_trim_domain_domain_buffer_227;
        }
      }
      v12 = strlen(v4);
      *v8 = 7;
      v13 = (v12 + 1);
      *(_DWORD *)(v8 + 1) = v13;
      if (v12 == -1)
        v13 = 0;
      else
        memcpy(v8 + 5, v4, v13);
      v9 = (uint64_t)&v8[v13 + 5];
    }
    if (a3)
    {
      v14 = strlen(a3);
      *(_BYTE *)v9 = 8;
      v15 = (v14 + 1);
      *(_DWORD *)(v9 + 1) = v15;
      if (v14 != -1)
        memcpy((void *)(v9 + 5), a3, v15);
    }
    v16 = setsockopt(a1, 0xFFFF, 4361, v8, v7);
    free(v8);
    return v16 == 0;
  }
  return result;
}

uint64_t ne_session_copy_socket_attributes(int a1, void **a2, void **a3)
{
  uint64_t v5;
  uint64_t v7;
  int v8;
  _BYTE *v9;
  size_t v10;
  void *v11;
  uint64_t v12;
  int v13;
  _BYTE *v14;
  size_t v15;
  void *v16;
  socklen_t v17;
  _BYTE v18[256];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17 = 256;
  if (a1 == -1)
    return 0;
  if ((unint64_t)a2 | (unint64_t)a3)
  {
    if (!getsockopt(a1, 0xFFFF, 4361, v18, &v17))
    {
      if (a2 && v17)
      {
        v7 = 0;
        v8 = 0;
        while (1)
        {
          v9 = &v18[v7];
          v10 = *(unsigned int *)&v18[v7 + 1];
          if (v18[v7] == 7)
            break;
          v7 = (v8 + v10 + 5);
          v8 = v7;
          if (v7 >= v17)
            goto LABEL_17;
        }
        if ((_DWORD)v10)
        {
          v11 = malloc_type_calloc(v10 + 1, 1uLL, 0x100004077774924uLL);
          *a2 = v11;
          if (v11)
            memcpy(v11, v9 + 5, v10);
        }
        else
        {
          *a2 = malloc_type_calloc(1uLL, 1uLL, 0x100004077774924uLL);
        }
      }
LABEL_17:
      if (a3 && v17)
      {
        v12 = 0;
        v13 = 0;
        while (1)
        {
          v14 = &v18[v12];
          v15 = *(unsigned int *)&v18[v12 + 1];
          if (v18[v12] == 8)
            break;
          v12 = (v13 + v15 + 5);
          v5 = 1;
          v13 = v12;
          if (v12 >= v17)
            return v5;
        }
        if (!(_DWORD)v15)
        {
          v5 = 1;
          *a3 = malloc_type_calloc(1uLL, 1uLL, 0x100004077774924uLL);
          return v5;
        }
        v16 = malloc_type_calloc(v15 + 1, 1uLL, 0x100004077774924uLL);
        *a3 = v16;
        if (!v16)
          return 1;
        memcpy(v16, v14 + 5, v15);
      }
      return 1;
    }
    return 0;
  }
  return 1;
}

const char *ne_session_status_to_string(int a1)
{
  if ((a1 - 1) > 4)
    return "invalid";
  else
    return off_24C0A1098[a1 - 1];
}

const char *ne_session_type_to_string(int a1)
{
  if ((a1 - 1) > 8)
    return "<unknown>";
  else
    return off_24C0A10C0[a1 - 1];
}

uint64_t ne_session_copy_security_session_info(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  xpc_object_t v5;
  xpc_object_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  const char *string;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v13 = 0;
  v14 = &v13;
  v15 = 0x2000000000;
  v16 = 0;
  *a2 = 0;
  *a3 = 0;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 0x40000000;
  v12[2] = __ne_session_copy_security_session_info_block_invoke;
  v12[3] = &unk_24C0A0A08;
  v12[4] = &v13;
  v12[5] = a1;
  dispatch_sync((dispatch_queue_t)g_queue, v12);
  if (v14[3])
  {
    v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v5, "SessionCommandType", 5);
    v6 = xpc_connection_send_message_with_reply_sync((xpc_connection_t)v14[3], v5);
    v7 = v6;
    if (v6)
    {
      if (MEMORY[0x20BD087A4](v6) == MEMORY[0x24BDACFA0])
      {
        *a2 = xpc_dictionary_copy_mach_send();
        *a3 = xpc_dictionary_copy_mach_send();
      }
      else if (MEMORY[0x20BD087A4](v7) == MEMORY[0x24BDACFB8])
      {
        v8 = ne_log_obj();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          string = xpc_dictionary_get_string(v7, (const char *)*MEMORY[0x24BDACF40]);
          *(_DWORD *)buf = 136315138;
          v18 = string;
          _os_log_error_impl(&dword_208439000, v8, OS_LOG_TYPE_ERROR, "Failed to fetch security session info: %s", buf, 0xCu);
        }
        v9 = 0;
        goto LABEL_11;
      }
    }
    v9 = 1;
LABEL_11:
    xpc_release(v5);
    xpc_release(v7);
    xpc_release((xpc_object_t)v14[3]);
    goto LABEL_12;
  }
  v9 = 0;
LABEL_12:
  _Block_object_dispose(&v13, 8);
  return v9;
}

xpc_object_t __ne_session_copy_security_session_info_block_invoke(uint64_t a1)
{
  xpc_object_t result;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = get_connection(**(_QWORD **)(a1 + 40));
  result = *(xpc_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (result)
  {
    result = xpc_retain(result);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  }
  return result;
}

void ne_session_stop_all_with_plugin_type(int a1, dispatch_queue_t queue, dispatch_block_t block)
{
  if (queue)
  {
    if (block)
      dispatch_async(queue, block);
  }
}

xpc_object_t ne_session_policy_copy_flow_divert_token(const unsigned __int8 *a1, unsigned int a2, xpc_object_t xdict, const char *a4)
{
  xpc_object_t v8;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int *v13;
  unsigned int v14;
  xpc_object_t v15;
  NSObject *v16;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  __int128 block;
  uint64_t (*v28)(uint64_t);
  void *v29;
  uint64_t *v30;
  uint64_t v31;
  _QWORD out[5];
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v18 = 0;
  v19 = &v18;
  v20 = 0x2000000000;
  v21 = 0;
  if (!a4 || uuid_is_null(a1))
  {
    v8 = ne_session_policy_copy_flow_divert_token_with_key(a2, xdict, 0, 0);
    goto LABEL_4;
  }
  if (!ne_session_validate_flow_properties(xdict))
  {
LABEL_17:
    v8 = 0;
    goto LABEL_4;
  }
  v10 = dispatch_semaphore_create(0);
  v11 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 0x40000000;
  v17[2] = __ne_session_policy_copy_flow_divert_token_block_invoke;
  v17[3] = &unk_24C0A0A30;
  v17[4] = &v18;
  v17[5] = v10;
  v12 = ne_session_create((uint64_t)a1, 2);
  v23 = 0;
  v24 = &v23;
  v25 = 0x2000000000;
  v26 = 0;
  if (get_flow_divert_token_from_session_manager_token_init != -1)
    dispatch_once(&get_flow_divert_token_from_session_manager_token_init, &__block_literal_global_226);
  *(_QWORD *)&block = v11;
  *((_QWORD *)&block + 1) = 0x40000000;
  v28 = __get_flow_divert_token_from_session_manager_block_invoke_2;
  v29 = &unk_24C0A0FC0;
  v30 = &v23;
  v31 = v12;
  dispatch_sync((dispatch_queue_t)g_queue, &block);
  if (*((_BYTE *)v24 + 24))
  {
    v13 = (unsigned int *)(v12 + 40);
    do
      v14 = __ldxr(v13);
    while (__stxr(v14 + 1, v13));
    v22[0] = v11;
    v22[1] = 0x40000000;
    v22[2] = __get_flow_divert_token_from_session_manager_block_invoke_3;
    v22[3] = &__block_descriptor_tmp_231;
    v22[4] = v12;
    out[0] = v11;
    out[1] = 0x40000000;
    out[2] = __ne_session_set_event_handler_block_invoke;
    out[3] = &unk_24C0A06E0;
    out[4] = v22;
    v33 = v12;
    v34 = get_flow_divert_token_from_session_manager_token_queue;
    dispatch_sync((dispatch_queue_t)g_queue, out);
  }
  v15 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v15, "SessionFlowDivertTokenControlUnit", a2);
  if (xdict)
    xpc_dictionary_set_value(v15, "SessionFlowDivertTokenProperties", xdict);
  xpc_dictionary_set_string(v15, "SessionFlowDivertTokenSigningIdentifier", a4);
  out[0] = v11;
  out[1] = 0x40000000;
  out[2] = __get_flow_divert_token_from_session_manager_block_invoke_235;
  out[3] = &unk_24C0A1028;
  out[4] = v17;
  v33 = v12;
  ne_session_get_info_with_parameters(v12, 4, (uint64_t)v15, 0, (dispatch_object_t)get_flow_divert_token_from_session_manager_token_queue, out);
  _Block_object_dispose(&v23, 8);
  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v10);
  v8 = (xpc_object_t)v19[3];
  if (!v8)
  {
    memset(out, 0, 37);
    uuid_unparse(a1, (char *)out);
    v16 = ne_log_obj();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      LODWORD(block) = 136315138;
      *(_QWORD *)((char *)&block + 4) = out;
      _os_log_error_impl(&dword_208439000, v16, OS_LOG_TYPE_ERROR, "Failed to obtain the flow divert token for configuration %s", (uint8_t *)&block, 0xCu);
    }
    goto LABEL_17;
  }
LABEL_4:
  _Block_object_dispose(&v18, 8);
  return v8;
}

xpc_object_t ne_session_policy_copy_flow_divert_token_with_key(unsigned int a1, xpc_object_t xdict, const char *a3, void *a4)
{
  const char *string;
  _BYTE *data;
  int int64;
  _BOOL4 v11;
  const void *v12;
  unsigned int uint64;
  _BOOL4 v14;
  xpc_object_t v15;
  int v16;
  size_t v17;
  uint64_t v18;
  size_t v19;
  BOOL v20;
  size_t v21;
  size_t v22;
  size_t v23;
  char *v24;
  char *v25;
  const void *v26;
  unsigned int v27;
  void *v28;
  unsigned int v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  char *v33;
  size_t v34;
  BOOL v35;
  char *v36;
  void *v37;
  int is_debug_logging_enabled;
  int v39;
  unint64_t v40;
  unsigned int v41;
  uint64_t v42;
  unint64_t v43;
  char *v44;
  char *v45;
  unsigned int v46;
  size_t v47;
  unint64_t v48;
  const void *bytes_ptr;
  size_t v50;
  __int128 v51;
  const char *v53;
  int v54;
  int v55;
  unsigned int v56;
  size_t v57;
  size_t length;
  __int128 macOut;
  int v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  length = 0;
  string = xpc_dictionary_get_string(xdict, "flow-host-name");
  data = xpc_dictionary_get_data(xdict, "flow-host-address", &length);
  int64 = xpc_dictionary_get_int64(xdict, "flow-host-port");
  v11 = xpc_dictionary_get_BOOL(xdict, "flow-multipath-requested");
  v57 = 0;
  v12 = xpc_dictionary_get_data(xdict, "app-data", &v57);
  uint64 = xpc_dictionary_get_uint64(xdict, "aggregate_unit");
  v14 = ne_session_validate_flow_properties(xdict);
  v15 = 0;
  if (!v14)
    return v15;
  if (v11)
    v16 = 4;
  else
    v16 = 0;
  v54 = v16;
  if (string)
    v17 = strlen(string) + 5;
  else
    v17 = 0;
  v55 = int64;
  if (data && *data)
    v17 += *data + 5;
  v18 = 61;
  if (!a4)
    v18 = 36;
  v19 = v17 + v18;
  if (a3)
    v19 += strlen(a3) + 5;
  if (v57)
    v20 = v12 == 0;
  else
    v20 = 1;
  v21 = v57 + 5;
  if (v20)
    v21 = 0;
  v22 = v21 + v19;
  v56 = uint64;
  if (uint64)
    v23 = v22 + 9;
  else
    v23 = v22;
  v24 = (char *)malloc_type_malloc(v23, 0x13056143uLL);
  v25 = v24;
  if (string)
  {
    v53 = a3;
    v26 = v12;
    v27 = a1;
    v28 = a4;
    v29 = strlen(string);
    v30 = v29;
    v31 = v29 + 5;
    v32 = v23 - v31;
    if (v23 < v31)
      goto LABEL_58;
    *v25 = 21;
    *(_DWORD *)(v25 + 1) = bswap32(v29);
    memcpy(v25 + 5, string, v29);
    v33 = &v25[v30 + 5];
    a4 = v28;
    a1 = v27;
    v12 = v26;
    a3 = v53;
    if (!data)
      goto LABEL_33;
LABEL_29:
    v34 = *data;
    if (*data)
    {
      v35 = v32 >= v34 + 5;
      v32 -= v34 + 5;
      if (!v35)
        goto LABEL_58;
      *v33 = 22;
      *(_DWORD *)(v33 + 1) = (_DWORD)v34 << 24;
      v36 = v33 + 5;
      memcpy(v36, data, v34);
      v33 = &v36[v34];
    }
    goto LABEL_33;
  }
  v32 = v23;
  v33 = v24;
  if (data)
    goto LABEL_29;
LABEL_33:
  if (v32 <= 8)
    goto LABEL_58;
  *v33 = 23;
  *(_DWORD *)(v33 + 1) = 0x4000000;
  *(_DWORD *)(v33 + 5) = v55;
  if (v32 - 9 <= 8)
    goto LABEL_58;
  v37 = a4;
  v33[9] = 10;
  *(_DWORD *)(v33 + 10) = 0x4000000;
  *(_DWORD *)(v33 + 14) = bswap32(a1);
  is_debug_logging_enabled = nelog_is_debug_logging_enabled();
  if (v32 - 18 <= 8)
    goto LABEL_58;
  v39 = is_debug_logging_enabled ? 7 : 5;
  v33[18] = 20;
  *(_DWORD *)(v33 + 19) = 0x4000000;
  *(_DWORD *)(v33 + 23) = v39;
  if (v32 - 27 <= 8)
LABEL_58:
    __assert_rtn("ne_tlv_add", "ne_session.c", 2995, "tlv_iter->remaining >= add_size");
  v33[27] = 29;
  *((_DWORD *)v33 + 7) = 0x4000000;
  *((_DWORD *)v33 + 8) = v54;
  v40 = v32 - 36;
  if (a3)
  {
    v41 = strlen(a3);
    v42 = v41;
    v43 = v41 + 5;
    v35 = v40 >= v43;
    v40 -= v43;
    if (!v35)
      goto LABEL_58;
    v33[36] = 25;
    *(_DWORD *)(v33 + 37) = bswap32(v41);
    v44 = v33 + 41;
    memcpy(v44, a3, v41);
    v45 = &v44[v42];
  }
  else
  {
    v45 = v33 + 36;
  }
  if (v12)
  {
    v46 = v57;
    if (v57)
    {
      v47 = v57;
      v48 = v57 + 5;
      v35 = v40 >= v48;
      v40 -= v48;
      if (!v35)
        goto LABEL_58;
      *v45 = 31;
      *(_DWORD *)(v45 + 1) = bswap32(v46);
      memcpy(v45 + 5, v12, v47);
      v45 += v47 + 5;
    }
  }
  if (v56)
  {
    if (v40 <= 8)
      goto LABEL_58;
    *v45 = 26;
    *(_DWORD *)(v45 + 1) = 0x4000000;
    *(_DWORD *)(v45 + 5) = bswap32(v56);
    v45 += 9;
    v40 -= 9;
  }
  if (v37)
  {
    macOut = 0uLL;
    v60 = 0;
    bytes_ptr = xpc_data_get_bytes_ptr(v37);
    v50 = xpc_data_get_length(v37);
    CCHmac(0, bytes_ptr, v50, v25, v23 - v40, &macOut);
    if (v40 <= 0x18)
      goto LABEL_58;
    *v45 = 18;
    *(_DWORD *)(v45 + 1) = 335544320;
    v51 = macOut;
    *(_DWORD *)(v45 + 21) = v60;
    *(_OWORD *)(v45 + 5) = v51;
    v40 -= 25;
  }
  v15 = xpc_data_create(v25, v23 - v40);
  free(v25);
  return v15;
}

BOOL ne_session_validate_flow_properties(void *a1)
{
  const char *string;
  unsigned __int8 *data;
  int int64;
  int v5;
  size_t v6;
  BOOL v7;
  NSObject *v8;
  const char *v9;
  _BOOL8 result;
  size_t v11;
  NSObject *v13;
  uint8_t *v14;
  _QWORD v15[2];
  __int16 v16;
  size_t length;

  length = 0;
  string = xpc_dictionary_get_string(a1, "flow-host-name");
  data = (unsigned __int8 *)xpc_dictionary_get_data(a1, "flow-host-address", &length);
  int64 = xpc_dictionary_get_int64(a1, "flow-host-port");
  if (!string)
  {
    if (!data)
    {
      v8 = ne_log_obj();
      result = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
      if (!result)
        return result;
      LOWORD(v15[0]) = 0;
      v9 = "Invalid flow properties: missing hostname and address";
      goto LABEL_31;
    }
    goto LABEL_6;
  }
  if (!*string)
  {
    v8 = ne_log_obj();
    result = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
    if (!result)
      return result;
    LOWORD(v15[0]) = 0;
    v9 = "Invalid flow properties: hostname is empty";
    goto LABEL_31;
  }
  if (data)
  {
LABEL_6:
    v5 = data[1];
    if (v5 == 30)
    {
      v11 = *data;
      if (v11 < 0x1C || length < v11)
        goto LABEL_22;
      v15[0] = 0;
      v15[1] = 0;
      if (*(_OWORD *)(data + 8) != 0)
        goto LABEL_27;
      v8 = ne_log_obj();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        return 0;
      v16 = 0;
      v9 = "Invalid flow properties: address is IN6ADDR_ANY_INIT";
    }
    else
    {
      if (v5 != 2 || ((v6 = *data, v6 >= 0x10) ? (v7 = length >= v6) : (v7 = 0), !v7))
      {
LABEL_22:
        v13 = ne_log_obj();
        result = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
        if (!result)
          return result;
        LOWORD(v15[0]) = 0;
        _os_log_error_impl(&dword_208439000, v13, OS_LOG_TYPE_ERROR, "Invalid host address", (uint8_t *)v15, 2u);
        return 0;
      }
      LODWORD(v15[0]) = 0;
      if (*((_DWORD *)data + 1))
        goto LABEL_27;
      v8 = ne_log_obj();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        return 0;
      v16 = 0;
      v9 = "Invalid flow properties: address is INADDR_ANY";
    }
    v14 = (uint8_t *)&v16;
    goto LABEL_32;
  }
LABEL_27:
  if (int64)
    return 1;
  v8 = ne_log_obj();
  result = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (result)
  {
    LOWORD(v15[0]) = 0;
    v9 = "Invalid flow properties: invalid port";
LABEL_31:
    v14 = (uint8_t *)v15;
LABEL_32:
    _os_log_impl(&dword_208439000, v8, OS_LOG_TYPE_INFO, v9, v14, 2u);
    return 0;
  }
  return result;
}

intptr_t __ne_session_policy_copy_flow_divert_token_block_invoke(uint64_t a1, xpc_object_t object)
{
  if (object)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = xpc_retain(object);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t __get_flow_divert_token_from_session_manager_block_invoke_2(uint64_t result)
{
  char v1;
  uint64_t *v2;
  char v3;
  uint64_t v4;

  v1 = 0;
  v2 = (uint64_t *)(**(_QWORD **)(result + 40) + 24);
  do
  {
    v3 = v1;
    v4 = *v2;
    if ((v1 & 1) != 0)
      break;
    v2 = (uint64_t *)(v4 + 8);
    v1 = 1;
  }
  while (v4);
  if (v4 == 0 && (v3 & 1) != 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

void __get_flow_divert_token_from_session_manager_block_invoke_3(uint64_t a1, int a2)
{
  uint64_t v2;
  _QWORD v3[5];
  _QWORD block[7];

  if (a2 == 2)
  {
    ne_session_release(*(_QWORD *)(a1 + 32));
  }
  else if (a2 == 1)
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 0x40000000;
    v3[2] = __get_flow_divert_token_from_session_manager_block_invoke_4;
    v3[3] = &__block_descriptor_tmp_229;
    v3[4] = v2;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = __ne_session_get_status_block_invoke;
    block[3] = &unk_24C0A0778;
    block[5] = v2;
    block[6] = get_flow_divert_token_from_session_manager_token_queue;
    block[4] = v3;
    dispatch_sync((dispatch_queue_t)g_queue, block);
  }
}

void __get_flow_divert_token_from_session_manager_block_invoke_235(uint64_t a1, void *a2)
{
  if (a2 && MEMORY[0x20BD087A4](a2) == MEMORY[0x24BDACFA0] && xpc_dictionary_get_value(a2, "SessionFlowDivertTokenKey"))
    MEMORY[0x20BD087A4]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  ne_session_release(*(_QWORD *)(a1 + 40));
}

void __get_flow_divert_token_from_session_manager_block_invoke_4(uint64_t a1, unsigned int a2)
{
  NSObject *v4;
  uint64_t v5;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x24BDAC8D0];
  if (a2 <= 1)
  {
    v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LODWORD(v6[0]) = 67109120;
      HIDWORD(v6[0]) = a2;
      _os_log_impl(&dword_208439000, v4, OS_LOG_TYPE_INFO, "Flow divert token session status changed to %d, cleaning up", (uint8_t *)v6, 8u);
    }
    v5 = *(_QWORD *)(a1 + 32);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 0x40000000;
    v6[2] = __ne_session_cancel_block_invoke;
    v6[3] = &__block_descriptor_tmp_10;
    v6[4] = v5;
    dispatch_sync((dispatch_queue_t)g_queue, v6);
  }
}

dispatch_queue_t __get_flow_divert_token_from_session_manager_block_invoke()
{
  NSObject *v0;
  dispatch_queue_t result;

  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  result = dispatch_queue_create("flow divert token queue", v0);
  get_flow_divert_token_from_session_manager_token_queue = (uint64_t)result;
  return result;
}

xpc_object_t ne_session_copy_app_data_from_flow_divert_socket(int a1)
{
  xpc_object_t v2;
  unsigned __int8 *v3;
  unsigned __int8 *v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  NSObject *v11;
  unint64_t v13;
  unsigned __int8 *v14;
  int v15;
  unsigned int v16;
  size_t v17;
  uint64_t v18;
  const void *v19;
  char *v20;
  socklen_t v21;
  uint8_t buf[4];
  char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v21 = 0;
  v2 = 0;
  if (getsockopt(a1, 0xFFFF, 4358, 0, &v21))
    return v2;
  if (!v21)
  {
    v7 = ne_log_obj();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      return 0;
    *(_WORD *)buf = 0;
    v8 = "flow divert token size is 0";
    v9 = v7;
    v10 = 2;
LABEL_24:
    _os_log_error_impl(&dword_208439000, v9, OS_LOG_TYPE_ERROR, v8, buf, v10);
    return 0;
  }
  v3 = (unsigned __int8 *)malloc_type_malloc(v21, 0x100004077774924uLL);
  if (!v3)
  {
    v11 = ne_log_obj();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      return 0;
    *(_DWORD *)buf = 67109120;
    LODWORD(v23) = v21;
    v8 = "Failed to allocate %u bytes for the flow divert token";
    v9 = v11;
    v10 = 8;
    goto LABEL_24;
  }
  v4 = v3;
  if (getsockopt(a1, 0xFFFF, 4358, v3, &v21))
  {
    v5 = *__error();
    v6 = ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v20 = strerror(v5);
      *(_DWORD *)buf = 136315138;
      v23 = v20;
      _os_log_error_impl(&dword_208439000, v6, OS_LOG_TYPE_ERROR, "getsockopt(SO_FLOW_DIVERT_TOKEN) failed: %s", buf, 0xCu);
    }
    free(v4);
    return 0;
  }
  v13 = v21;
  v14 = v4;
  while (v13 >= 5)
  {
    v15 = *v14;
    v16 = *(_DWORD *)(v14 + 1);
    v17 = bswap32(v16);
    if (v16)
    {
      v18 = v17 + 5;
      if (v17 + 5 > v13)
        break;
      v19 = v14 + 5;
    }
    else
    {
      v19 = 0;
      v18 = 5;
    }
    v14 += v18;
    v13 -= v18;
    if (v15 == 31)
    {
      v2 = xpc_data_create(v19, v17);
      goto LABEL_22;
    }
  }
  v2 = 0;
LABEL_22:
  free(v4);
  return v2;
}

xpc_object_t ne_session_copy_app_data_from_flow_divert_token(void *a1)
{
  unsigned __int8 *bytes_ptr;
  size_t length;
  int v4;
  unsigned int v5;
  size_t v6;
  uint64_t v7;
  const void *v8;

  bytes_ptr = (unsigned __int8 *)xpc_data_get_bytes_ptr(a1);
  length = xpc_data_get_length(a1);
  while (length >= 5)
  {
    v4 = *bytes_ptr;
    v5 = *(_DWORD *)(bytes_ptr + 1);
    v6 = bswap32(v5);
    if (v5)
    {
      v7 = v6 + 5;
      if (v6 + 5 > length)
        return 0;
      v8 = bytes_ptr + 5;
    }
    else
    {
      v8 = 0;
      v7 = 5;
    }
    bytes_ptr += v7;
    length -= v7;
    if (v4 == 31)
      return xpc_data_create(v8, v6);
  }
  return 0;
}

uint64_t ne_session_get_config_id_from_network_agent(uint64_t result, unsigned __int8 *a2, _DWORD *a3)
{
  uint64_t v5;

  if (result)
  {
    v5 = result;
    if (!strcmp((const char *)(result + 16), "NetworkExtension") && *(_DWORD *)(v5 + 212) == 40)
    {
      if (a2)
        uuid_copy(a2, (const unsigned __int8 *)(v5 + 216));
      if (a3)
        *a3 = *(_DWORD *)(v5 + 232);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t ne_session_agent_get_advisory_interface_index(uint64_t result, int a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t v6;
  int v7;

  if (result)
  {
    v5 = result;
    if (!strcmp((const char *)(result + 16), "NetworkExtension")
      && !strcmp((const char *)(v5 + 48), "PathController")
      && *(_DWORD *)(v5 + 212) == 140)
    {
      v6 = 0;
      while (1)
      {
        v7 = *(_DWORD *)(v5 + 272 + 4 * v6);
        if (!v7 || v7 == a2)
          break;
        result = 0;
        if (++v6 == 4)
          return result;
      }
      if (a3)
        *a3 = *(_BYTE *)(v5 + 288) & 1;
      return *(unsigned int *)(v5 + 4 * v6 + 256);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t ne_session_agent_get_advisory(uint64_t result, int a2, _BYTE *a3, BOOL *a4, BOOL *a5, BOOL *a6, _DWORD *a7, _QWORD *a8, _QWORD *a9)
{
  uint64_t v16;
  uint64_t v17;
  int v18;

  if (result)
  {
    v16 = result;
    if (!strcmp((const char *)(result + 16), "NetworkExtension")
      && !strcmp((const char *)(v16 + 48), "PathController")
      && *(_DWORD *)(v16 + 212) == 140)
    {
      v17 = 0;
      while (1)
      {
        v18 = *(_DWORD *)(v16 + 272 + 4 * v17);
        if (!v18 || v18 == a2)
          break;
        result = 0;
        if (++v17 == 4)
          return result;
      }
      if (a3)
        *a3 = *(_BYTE *)(v16 + 288) & 1;
      if (a4)
        *a4 = (*(_BYTE *)(v16 + 288) & 2) != 0;
      if (a5)
        *a5 = (*(_BYTE *)(v16 + 288) & 4) != 0;
      if (a6)
        *a6 = (*(_BYTE *)(v16 + 288) & 8) != 0;
      if (a7)
        *a7 = *(_DWORD *)(v16 + 4 * v17 + 256);
      if (a8)
        *a8 = v16 + 289;
      if (a9)
        *a9 = v16 + 321;
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

const char *ne_session_stop_reason_to_string(int a1)
{
  if ((a1 - 1) > 0x28)
    return "None";
  else
    return off_24C0A1108[a1 - 1];
}

xpc_object_t ne_copy_signing_identifier_for_pid(int a1)
{
  return ne_copy_signing_identifier_for_pid_with_audit_token(a1, 0);
}

void *ne_copy_signature_info_for_pid(int a1)
{
  unint64_t v2;
  NSObject *v3;
  unint64_t v4;
  xpc_object_t v5;
  void *v6;
  NSObject *v7;
  int *v9;
  char *v10;
  _DWORD v11[2];
  __int16 v12;
  char *v13;
  _QWORD bytes[2];
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = (unint64_t)ne_copy_signing_identifier_for_pid_with_audit_token(a1, 0);
  bytes[0] = 0;
  bytes[1] = 0;
  v15 = 0;
  if (csops())
  {
    v3 = ne_log_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v9 = __error();
      v10 = strerror(*v9);
      v11[0] = 67109378;
      v11[1] = a1;
      v12 = 2080;
      v13 = v10;
      _os_log_error_impl(&dword_208439000, v3, OS_LOG_TYPE_ERROR, "Failed to get the code directory hash for %d: %s", (uint8_t *)v11, 0x12u);
    }
    v4 = 0;
  }
  else
  {
    v4 = (unint64_t)xpc_data_create(bytes, 0x14uLL);
  }
  if (!(v4 | v2))
    return 0;
  v5 = xpc_dictionary_create(0, 0, 0);
  v6 = v5;
  if (v5)
  {
    if (v4)
      xpc_dictionary_set_value(v5, "SourceAppUniqueIdentifier", (xpc_object_t)v4);
    if (v2)
    {
      xpc_dictionary_set_value(v6, "SourceAppSigningIdentifier", (xpc_object_t)v2);
      if (!v4)
        goto LABEL_17;
LABEL_16:
      xpc_release((xpc_object_t)v4);
      goto LABEL_17;
    }
LABEL_15:
    if (!v4)
      goto LABEL_17;
    goto LABEL_16;
  }
  v7 = ne_log_obj();
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    goto LABEL_15;
  LOWORD(bytes[0]) = 0;
  _os_log_fault_impl(&dword_208439000, v7, OS_LOG_TYPE_FAULT, "xpc_dictionary_create failed", (uint8_t *)bytes, 2u);
  if (v4)
    goto LABEL_16;
LABEL_17:
  if (v2)
    xpc_release((xpc_object_t)v2);
  return v6;
}

void ne_force_reset_uuid_cache()
{
  os_unfair_lock_lock((os_unfair_lock_t)&g_uuid_cache_lock);
  if (g_uuid_cache)
  {
    xpc_release((xpc_object_t)g_uuid_cache);
    g_uuid_cache = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&g_uuid_cache_lock);
}

void *ne_copy_uuid_cache_locked()
{
  NSObject *v0;
  void *v1;
  int v3;
  uint32_t v4;
  uint32_t v5;
  NSObject *v6;
  uint64_t v7;
  uint32_t v8;
  uint32_t v9;
  NSObject *v10;
  NSObject *v11;
  _BOOL4 v12;
  uint64_t v13;
  int v14;
  int v15;
  int v16;
  NSObject *v17;
  uint32_t state;
  uint32_t v19;
  const char *v20;
  int v21;
  NSObject *v22;
  off_t st_size;
  NSObject *v24;
  const char *v25;
  NSObject *v26;
  uint32_t v27;
  void *v28;
  void *v29;
  ssize_t v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  ssize_t v34;
  int v35;
  NSObject *v36;
  const char *string;
  const char *v38;
  NSObject *v39;
  const char *v40;
  uint8_t *p_check;
  NSObject *v42;
  NSObject *v43;
  const unsigned __int8 *data;
  NSObject *v45;
  size_t length;
  stat v47;
  int check;
  uint8_t *v49;
  __int16 v50;
  _BYTE *v51;
  uuid_t dst;
  _BYTE v53[38];
  __int16 v54;
  uint8_t *v55;
  uint8_t buf[136];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_assert_owner((const os_unfair_lock *)&g_uuid_cache_lock);
  g_ne_read_uuid_cache = 0;
  getpid();
  if (!sandbox_check())
  {
    getpid();
    if (!sandbox_check())
    {
      v3 = ne_uuid_cache_changed_cache_change_token;
      if (ne_uuid_cache_changed_cache_change_token == -1)
      {
        v4 = notify_register_check("com.apple.networkextension.uuidcache", &ne_uuid_cache_changed_cache_change_token);
        if (v4)
        {
          v5 = v4;
          ne_uuid_cache_changed_cache_change_token = -1;
          v6 = ne_log_obj();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)&buf[4] = "com.apple.networkextension.uuidcache";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v5;
            _os_log_error_impl(&dword_208439000, v6, OS_LOG_TYPE_ERROR, "Failed to register for %s notifications: %u", buf, 0x12u);
          }
        }
        v3 = ne_uuid_cache_changed_cache_change_token;
      }
      v7 = ne_uuid_cache_changed_cache_generation;
      *(_QWORD *)v53 = ne_uuid_cache_changed_cache_generation;
      if (v3 < 0)
        goto LABEL_17;
      check = 0;
      v8 = notify_check(v3, &check);
      if (v8)
      {
        v9 = v8;
        v10 = ne_log_obj();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
LABEL_15:
          notify_cancel(ne_uuid_cache_changed_cache_change_token);
          v7 = 0;
          ne_uuid_cache_changed_cache_change_token = -1;
          *(_QWORD *)v53 = 0;
          goto LABEL_16;
        }
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "com.apple.networkextension.uuidcache";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = ne_uuid_cache_changed_cache_change_token;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v9;
        v20 = "Failed to check for changes to notification %s, token %d: %u";
LABEL_53:
        _os_log_error_impl(&dword_208439000, v10, OS_LOG_TYPE_ERROR, v20, buf, 0x18u);
        goto LABEL_15;
      }
      if (check)
      {
        state = notify_get_state(ne_uuid_cache_changed_cache_change_token, (uint64_t *)v53);
        if (state)
        {
          v19 = state;
          v10 = ne_log_obj();
          if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            goto LABEL_15;
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = "com.apple.networkextension.uuidcache";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = ne_uuid_cache_changed_cache_change_token;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = v19;
          v20 = "Failed to get the state of notification %s, token %d: %u";
          goto LABEL_53;
        }
        v7 = *(_QWORD *)v53;
      }
LABEL_16:
      if (v7 != ne_uuid_cache_changed_cache_generation)
      {
        v11 = ne_log_obj();
        v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
        v13 = *(_QWORD *)v53;
        if (v12)
        {
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)&buf[4] = ne_uuid_cache_changed_cache_generation;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = *(_QWORD *)v53;
          _os_log_debug_impl(&dword_208439000, v11, OS_LOG_TYPE_DEBUG, "UUID cache generation changed from %llu to %llu", buf, 0x16u);
          v13 = *(_QWORD *)v53;
        }
        ne_uuid_cache_changed_cache_generation = v13;
        g_ne_read_uuid_cache = 1;
        if (g_uuid_cache)
        {
          xpc_release((xpc_object_t)g_uuid_cache);
          g_uuid_cache = 0;
        }
        goto LABEL_23;
      }
LABEL_17:
      ne_uuid_cache_changed_cache_generation = v7;
      v1 = (void *)g_uuid_cache;
      if (g_uuid_cache)
        goto LABEL_51;
      g_ne_read_uuid_cache = 1;
LABEL_23:
      v14 = open("/Library/Preferences/com.apple.networkextension.uuidcache.plist", 0, "/Library/Preferences/com.apple.networkextension.uuidcache.plist");
      if (v14 < 0)
      {
        if (*__error() != 2 && *__error() != 1)
        {
          v21 = *__error();
          if (strerror_r(v21, (char *)buf, 0x80uLL))
            buf[0] = 0;
          v22 = ne_log_obj();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)v53 = 136315650;
            *(_QWORD *)&v53[4] = "/Library/Preferences/com.apple.networkextension.uuidcache.plist";
            *(_WORD *)&v53[12] = 1024;
            *(_DWORD *)&v53[14] = v21;
            *(_WORD *)&v53[18] = 2080;
            *(_QWORD *)&v53[20] = buf;
            _os_log_fault_impl(&dword_208439000, v22, OS_LOG_TYPE_FAULT, "Failed to open %s: [%d] %s", v53, 0x1Cu);
          }
        }
LABEL_50:
        v1 = (void *)g_uuid_cache;
        if (!g_uuid_cache)
          return v1;
LABEL_51:
        xpc_retain(v1);
        return v1;
      }
      v15 = v14;
      memset(&v47, 0, sizeof(v47));
      if (fstat(v14, &v47))
      {
        v16 = *__error();
        if (strerror_r(v16, (char *)buf, 0x80uLL))
          buf[0] = 0;
        v17 = ne_log_obj();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)v53 = 136315650;
          *(_QWORD *)&v53[4] = "/Library/Preferences/com.apple.networkextension.uuidcache.plist";
          *(_WORD *)&v53[12] = 1024;
          *(_DWORD *)&v53[14] = v16;
          *(_WORD *)&v53[18] = 2080;
          *(_QWORD *)&v53[20] = buf;
          _os_log_fault_impl(&dword_208439000, v17, OS_LOG_TYPE_FAULT, "Failed to fstat %s: [%d] %s", v53, 0x1Cu);
        }
        goto LABEL_49;
      }
      st_size = v47.st_size;
      if ((unint64_t)(v47.st_size - 131073) <= 0xFFFFFFFFFFFDFFFFLL)
      {
        v24 = ne_log_obj();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "/Library/Preferences/com.apple.networkextension.uuidcache.plist";
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = st_size;
          v25 = "%s size is 0 or is too big: %lu";
          v26 = v24;
          v27 = 22;
LABEL_67:
          _os_log_error_impl(&dword_208439000, v26, OS_LOG_TYPE_ERROR, v25, buf, v27);
          goto LABEL_49;
        }
        goto LABEL_49;
      }
      v28 = malloc_type_malloc(v47.st_size, 0x100004077774924uLL);
      if (!v28)
      {
        v33 = ne_log_obj();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = st_size;
          v25 = "Failed to allocate %lu bytes";
          v26 = v33;
          v27 = 12;
          goto LABEL_67;
        }
LABEL_49:
        close(v15);
        goto LABEL_50;
      }
      v29 = v28;
      v30 = pread(v15, v28, st_size, 0);
      if (v30 != st_size)
      {
        v34 = v30;
        v35 = *__error();
        if (strerror_r(v35, (char *)buf, 0x80uLL))
          buf[0] = 0;
        v36 = ne_log_obj();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)v53 = 136316162;
          *(_QWORD *)&v53[4] = "/Library/Preferences/com.apple.networkextension.uuidcache.plist";
          *(_WORD *)&v53[12] = 2048;
          *(_QWORD *)&v53[14] = v34;
          *(_WORD *)&v53[22] = 2048;
          *(_QWORD *)&v53[24] = st_size;
          *(_WORD *)&v53[32] = 1024;
          *(_DWORD *)&v53[34] = v35;
          v54 = 2080;
          v55 = buf;
          _os_log_fault_impl(&dword_208439000, v36, OS_LOG_TYPE_FAULT, "Failed to read entire contents of %s, %ld != %lu: [%d] %s", v53, 0x30u);
        }
        goto LABEL_58;
      }
      v31 = xpc_create_from_plist();
      if (!v31)
      {
LABEL_58:
        close(v15);
        free(v29);
        goto LABEL_50;
      }
      v32 = (void *)v31;
      if (MEMORY[0x20BD087A4]() != MEMORY[0x24BDACFA0])
      {
LABEL_46:
        xpc_release(v32);
        goto LABEL_58;
      }
      if (ne_copy_uuid_cache_locked_once_token != -1)
        dispatch_once(&ne_copy_uuid_cache_locked_once_token, &__block_literal_global_155);
      string = xpc_dictionary_get_string(v32, "os-version");
      if (string)
      {
        if (ne_copy_uuid_cache_locked_g_my_os_version)
        {
          v38 = string;
          if (strcmp(string, (const char *)ne_copy_uuid_cache_locked_g_my_os_version))
          {
            v39 = ne_log_obj();
            if (!os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
              goto LABEL_77;
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)&buf[4] = ne_copy_uuid_cache_locked_g_my_os_version;
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = v38;
            v40 = "Not using the UUID cache because the current OS version (%s) does not equal the cache OS version (%s)";
            p_check = buf;
            v42 = v39;
LABEL_76:
            _os_log_impl(&dword_208439000, v42, OS_LOG_TYPE_DEFAULT, v40, p_check, 0x16u);
LABEL_77:
            if (g_uuid_cache)
              goto LABEL_58;
            goto LABEL_46;
          }
        }
        else
        {
          v43 = ne_log_obj();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_208439000, v43, OS_LOG_TYPE_ERROR, "Failed to get the current OS version", buf, 2u);
          }
        }
      }
      memset(dst, 0, sizeof(dst));
      length = 0;
      data = (const unsigned __int8 *)xpc_dictionary_get_data(v32, "boot-uuid", &length);
      if (length != 16
        || (uuid_copy(dst, data), uuid_is_null(ne_copy_uuid_cache_locked_g_my_boot_session_uuid))
        || !uuid_compare(dst, ne_copy_uuid_cache_locked_g_my_boot_session_uuid))
      {
        g_uuid_cache = (uint64_t)v32;
        goto LABEL_58;
      }
      memset(buf, 0, 37);
      memset(v53, 0, 37);
      uuid_unparse(ne_copy_uuid_cache_locked_g_my_boot_session_uuid, (char *)buf);
      uuid_unparse(dst, v53);
      v45 = ne_log_obj();
      if (!os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        goto LABEL_77;
      check = 136315394;
      v49 = buf;
      v50 = 2080;
      v51 = v53;
      v40 = "Not using the UUID cache because the current boot session UUID (%s) does not equal the cache boot session UUID (%s)";
      p_check = (uint8_t *)&check;
      v42 = v45;
      goto LABEL_76;
    }
  }
  v0 = ne_log_obj();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_208439000, v0, OS_LOG_TYPE_DEFAULT, "UUID cache sandbox check failed", buf, 2u);
  }
  return 0;
}

void __ne_copy_uuid_cache_locked_block_invoke()
{
  NSObject *v0;
  NSObject *v1;
  uint8_t v2[16];
  uint8_t buf[16];

  ne_copy_uuid_cache_locked_g_my_os_version = (uint64_t)ne_session_copy_os_version_string();
  if (!ne_copy_uuid_cache_locked_g_my_os_version)
  {
    v0 = ne_log_obj();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_208439000, v0, OS_LOG_TYPE_FAULT, "Failed to get the current OS version", buf, 2u);
    }
  }
  if (!ne_session_get_boot_session_uuid(ne_copy_uuid_cache_locked_g_my_boot_session_uuid))
  {
    v1 = ne_log_obj();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v2 = 0;
      _os_log_fault_impl(&dword_208439000, v1, OS_LOG_TYPE_FAULT, "Failed to get the boot session uuid", v2, 2u);
    }
  }
}

void *ne_session_copy_os_version_string()
{
  int v0;
  NSObject *v1;
  void *v2;
  void *v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  size_t v8;
  uint8_t buf[4];
  _BYTE v10[14];
  __int16 v11;
  char *v12;
  char __strerrbuf[4];
  size_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v8 = 0;
  if (sysctlbyname("kern.osversion", 0, &v8, 0, 0))
  {
    v0 = *__error();
    if (strerror_r(v0, __strerrbuf, 0x80uLL))
      __strerrbuf[0] = 0;
    v1 = ne_log_obj();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v10 = v0;
      *(_WORD *)&v10[4] = 2080;
      *(_QWORD *)&v10[6] = __strerrbuf;
      _os_log_fault_impl(&dword_208439000, v1, OS_LOG_TYPE_FAULT, "Failed to get the size of the kern.osversion sysctl value: [%d] %s", buf, 0x12u);
    }
  }
  else
  {
    v4 = malloc_type_malloc(v8 + 1, 0xBD1E4F51uLL);
    if (v4)
    {
      v2 = v4;
      bzero(v4, v8 + 1);
      if (!sysctlbyname("kern.osversion", v2, &v8, 0, 0))
        return v2;
      v5 = *__error();
      if (strerror_r(v5, __strerrbuf, 0x80uLL))
        __strerrbuf[0] = 0;
      v6 = ne_log_obj();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134218498;
        *(_QWORD *)v10 = v8;
        *(_WORD *)&v10[8] = 1024;
        *(_DWORD *)&v10[10] = v5;
        v11 = 2080;
        v12 = __strerrbuf;
        _os_log_fault_impl(&dword_208439000, v6, OS_LOG_TYPE_FAULT, "Failed to get the kern.osversion sysctl value (%lu bytes): [%d] %s", buf, 0x1Cu);
      }
      free(v2);
    }
    else
    {
      v7 = ne_log_obj();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__strerrbuf = 134217984;
        v14 = v8 + 1;
        _os_log_error_impl(&dword_208439000, v7, OS_LOG_TYPE_ERROR, "Failed to allocate %lu bytes for the version string", (uint8_t *)__strerrbuf, 0xCu);
      }
    }
  }
  return 0;
}

BOOL ne_session_get_boot_session_uuid(unsigned __int8 *a1)
{
  int v2;
  int v3;
  NSObject *v4;
  size_t v6;
  uint8_t buf[4];
  int v8;
  __int16 v9;
  char *v10;
  char __strerrbuf[128];
  _BYTE in[37];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  memset(in, 0, sizeof(in));
  v6 = 37;
  v2 = sysctlbyname("kern.bootsessionuuid", in, &v6, 0, 0);
  if (v2)
  {
    v3 = *__error();
    if (strerror_r(v3, __strerrbuf, 0x80uLL))
      __strerrbuf[0] = 0;
    v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109378;
      v8 = v3;
      v9 = 2080;
      v10 = __strerrbuf;
      _os_log_fault_impl(&dword_208439000, v4, OS_LOG_TYPE_FAULT, "Failed to get kern.bootsessionuuid: [%d] %s", buf, 0x12u);
    }
  }
  else
  {
    uuid_parse(in, a1);
  }
  return v2 == 0;
}

void *ne_copy_uuid_cache()
{
  void *v0;

  os_unfair_lock_lock((os_unfair_lock_t)&g_uuid_cache_lock);
  v0 = ne_copy_uuid_cache_locked();
  os_unfair_lock_unlock((os_unfair_lock_t)&g_uuid_cache_lock);
  return v0;
}

xpc_object_t ne_copy_cached_uuids_for_bundle_identifier(const char *a1, int a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  xpc_object_t v8;
  xpc_object_t dictionary;
  void *v11;
  xpc_object_t value;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD applier[5];

  os_unfair_lock_lock((os_unfair_lock_t)&g_uuid_cache_lock);
  g_ne_read_uuid_cache = 0;
  g_ne_uuid_cache_hit = 0;
  v4 = ne_copy_uuid_cache_locked();
  if (!v4)
  {
    v8 = 0;
    goto LABEL_6;
  }
  v5 = v4;
  v6 = MEMORY[0x20BD087A4]();
  v7 = MEMORY[0x24BDACFA0];
  if (v6 != MEMORY[0x24BDACFA0])
    goto LABEL_3;
  dictionary = xpc_dictionary_get_dictionary(v5, "uuid-mappings");
  if (dictionary && (v11 = dictionary, MEMORY[0x20BD087A4]() == v7))
  {
    value = xpc_dictionary_get_value(v11, a1);
    if (value)
    {
      v13 = value;
      v14 = MEMORY[0x20BD087A4]();
      v15 = MEMORY[0x24BDACF78];
      if (v14 == MEMORY[0x24BDACF78])
      {
        if (!xpc_array_get_count(v13) && (a2 & 1) != 0)
          goto LABEL_10;
      }
      else if (a2)
      {
        goto LABEL_10;
      }
      if (MEMORY[0x20BD087A4](v13) == v15)
      {
        v8 = xpc_array_create(0, 0);
        applier[0] = MEMORY[0x24BDAC760];
        applier[1] = 0x40000000;
        applier[2] = __ne_copy_cached_uuids_for_bundle_identifier_block_invoke;
        applier[3] = &__block_descriptor_tmp_160;
        applier[4] = v8;
        xpc_array_apply(v13, applier);
        g_ne_uuid_cache_hit = 1;
        goto LABEL_4;
      }
      goto LABEL_3;
    }
    if ((a2 & 1) != 0)
      goto LABEL_10;
  }
  else if (a2)
  {
LABEL_10:
    v8 = ne_copy_cached_synthesized_uuids_for_bundle_identifier_locked(a1, v5);
    goto LABEL_4;
  }
LABEL_3:
  v8 = 0;
LABEL_4:
  xpc_release(v5);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&g_uuid_cache_lock);
  return v8;
}

xpc_object_t ne_copy_cached_synthesized_uuids_for_bundle_identifier_locked(const char *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  xpc_object_t v6;
  xpc_object_t dictionary;
  void *v9;
  xpc_object_t value;
  size_t bytes;
  size_t length;
  xpc_object_t v13;
  void *v14;
  _QWORD buffer[3];

  buffer[2] = *MEMORY[0x24BDAC8D0];
  v4 = MEMORY[0x20BD087A4](a2);
  v5 = MEMORY[0x24BDACFA0];
  if (v4 == MEMORY[0x24BDACFA0])
  {
    dictionary = xpc_dictionary_get_dictionary(a2, "synthesized-uuid-mappings");
    if (dictionary)
    {
      v9 = dictionary;
      if (MEMORY[0x20BD087A4]() == v5)
      {
        value = xpc_dictionary_get_value(v9, a1);
        v6 = value;
        if (!value)
          return v6;
        if (MEMORY[0x20BD087A4](value) == MEMORY[0x24BDACF90])
        {
          buffer[0] = 0;
          buffer[1] = 0;
          bytes = xpc_data_get_bytes(v6, buffer, 0, 0x10uLL);
          length = xpc_data_get_length(v6);
          v6 = 0;
          if (bytes != length)
            return v6;
          v13 = xpc_uuid_create((const unsigned __int8 *)buffer);
          if (v13)
          {
            v14 = v13;
            v6 = xpc_array_create(0, 0);
            xpc_array_append_value(v6, v14);
            xpc_release(v14);
            g_ne_uuid_cache_hit = 1;
            return v6;
          }
        }
      }
    }
  }
  return 0;
}

uint64_t __ne_copy_cached_uuids_for_bundle_identifier_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  size_t bytes;
  xpc_object_t v6;
  void *v7;
  _QWORD buffer[3];

  buffer[2] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    if (MEMORY[0x20BD087A4](a3) == MEMORY[0x24BDACF90])
    {
      buffer[0] = 0;
      buffer[1] = 0;
      bytes = xpc_data_get_bytes(a3, buffer, 0, 0x10uLL);
      if (bytes == xpc_data_get_length(a3))
      {
        v6 = xpc_uuid_create((const unsigned __int8 *)buffer);
        if (v6)
        {
          v7 = v6;
          xpc_array_append_value(*(xpc_object_t *)(a1 + 32), v6);
          xpc_release(v7);
        }
      }
    }
  }
  return 1;
}

uint64_t ne_copy_cached_bundle_identifier_for_uuid(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  xpc_object_t dictionary;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  xpc_object_t v11;
  void *v12;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD applier[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2000000000;
  v17 = 0;
  os_unfair_lock_lock((os_unfair_lock_t)&g_uuid_cache_lock);
  g_ne_read_uuid_cache = 0;
  g_ne_uuid_cache_hit = 0;
  v2 = ne_copy_uuid_cache_locked();
  if (v2)
  {
    v3 = v2;
    v4 = MEMORY[0x20BD087A4]();
    v5 = MEMORY[0x24BDACFA0];
    if (v4 == MEMORY[0x24BDACFA0])
    {
      dictionary = xpc_dictionary_get_dictionary(v3, "uuid-mappings");
      if (!dictionary)
        goto LABEL_17;
      v7 = dictionary;
      if (MEMORY[0x20BD087A4]() != v5
        || (v13[0] = MEMORY[0x24BDAC760],
            v13[1] = 0x40000000,
            v13[2] = __ne_copy_cached_bundle_identifier_for_uuid_block_invoke,
            v13[3] = &unk_24C0A0AD8,
            v13[4] = &v14,
            v13[5] = a1,
            xpc_dictionary_apply(v7, v13),
            !v15[3]))
      {
LABEL_17:
        if (MEMORY[0x20BD087A4](v3) == v5
          && (v11 = xpc_dictionary_get_dictionary(v3, "synthesized-uuid-mappings")) != 0
          && (v12 = v11, MEMORY[0x20BD087A4]() == v5))
        {
          v19 = 0;
          v20 = &v19;
          v21 = 0x2000000000;
          v22 = 0;
          applier[0] = MEMORY[0x24BDAC760];
          applier[1] = 0x40000000;
          applier[2] = __ne_copy_cached_bundle_identifier_for_synthesized_uuid_locked_block_invoke;
          applier[3] = &unk_24C0A1050;
          applier[4] = &v19;
          applier[5] = a1;
          xpc_dictionary_apply(v12, applier);
          v8 = v20[3];
          _Block_object_dispose(&v19, 8);
        }
        else
        {
          v8 = 0;
        }
        v15[3] = v8;
      }
    }
    xpc_release(v3);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&g_uuid_cache_lock);
  v9 = v15[3];
  _Block_object_dispose(&v14, 8);
  return v9;
}

uint64_t __ne_copy_cached_bundle_identifier_for_uuid_block_invoke(uint64_t a1, const char *a2, void *a3)
{
  void *v6;
  size_t length;
  _QWORD applier[5];

  if (a3)
  {
    if (MEMORY[0x20BD087A4](a3) == MEMORY[0x24BDACF78])
    {
      applier[0] = MEMORY[0x24BDAC760];
      applier[1] = 0x40000000;
      applier[2] = __ne_copy_cached_bundle_identifier_for_uuid_block_invoke_2;
      applier[3] = &__block_descriptor_tmp_161_301;
      applier[4] = *(_QWORD *)(a1 + 40);
      if (!xpc_array_apply(a3, applier))
      {
        v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
        if (!v6)
        {
LABEL_7:
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = xpc_string_create(a2);
          return 1;
        }
        length = xpc_string_get_length(v6);
        if (strlen(a2) < length)
        {
          xpc_release(*(xpc_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
          goto LABEL_7;
        }
      }
    }
  }
  return 1;
}

uint64_t __ne_copy_cached_bundle_identifier_for_synthesized_uuid_locked_block_invoke(uint64_t a1, const char *a2, void *a3)
{
  size_t bytes;
  uint64_t result;
  xpc_object_t v8;
  _QWORD buffer[3];

  buffer[2] = *MEMORY[0x24BDAC8D0];
  if (!a3)
    return 1;
  if (MEMORY[0x20BD087A4](a3) != MEMORY[0x24BDACF90])
    return 1;
  buffer[0] = 0;
  buffer[1] = 0;
  bytes = xpc_data_get_bytes(a3, buffer, 0, 0x10uLL);
  if (bytes != xpc_data_get_length(a3)
    || uuid_compare((const unsigned __int8 *)buffer, *(const unsigned __int8 **)(a1 + 40)))
  {
    return 1;
  }
  v8 = xpc_string_create(a2);
  result = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v8;
  return result;
}

BOOL __ne_copy_cached_bundle_identifier_for_uuid_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  size_t bytes;
  _QWORD buffer[3];

  buffer[2] = *MEMORY[0x24BDAC8D0];
  if (a3
    && MEMORY[0x20BD087A4](a3) == MEMORY[0x24BDACF90]
    && (buffer[0] = 0,
        buffer[1] = 0,
        bytes = xpc_data_get_bytes(a3, buffer, 0, 0x10uLL),
        bytes == xpc_data_get_length(a3)))
  {
    return uuid_compare((const unsigned __int8 *)buffer, *(const unsigned __int8 **)(a1 + 32)) != 0;
  }
  else
  {
    return 1;
  }
}

BOOL ne_session_is_safeboot()
{
  BOOL v0;
  size_t v2;
  int v3;
  int v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)v4 = 0x4200000001;
  v3 = 0;
  v2 = 4;
  if (sysctl(v4, 2u, &v3, &v2, 0, 0))
    v0 = 1;
  else
    v0 = v3 == 0;
  return !v0;
}

unsigned __int8 *ne_is_sockaddr_valid(unsigned __int8 *result, unint64_t a2)
{
  int v2;
  unint64_t v3;
  BOOL v4;

  if (result)
  {
    v2 = result[1];
    if (v2 == 30)
    {
      v3 = *result;
      v4 = v3 > 0x1B;
    }
    else
    {
      if (v2 != 2)
        return 0;
      v3 = *result;
      v4 = v3 > 0xF;
    }
    return (unsigned __int8 *)(v4 && v3 <= a2);
  }
  return result;
}

uint64_t ne_session_set_socket_tracker_attributes(int a1, char *__s, const char *a3, const char *a4)
{
  const char *v4;
  const char *v6;
  uint64_t result;
  size_t v9;
  char *v10;
  uint64_t v11;
  size_t v12;
  size_t v13;
  int v14;
  size_t v15;
  int v16;
  size_t v17;
  size_t v18;
  size_t v19;
  int v20;
  size_t v21;
  int v22;

  if (a1 == -1)
    return 0;
  v4 = a4;
  v6 = __s;
  if (!__s && !a3 && !a4)
    return 1;
  if (!__s)
  {
    v9 = 0;
    if (!a3)
      goto LABEL_10;
    goto LABEL_9;
  }
  v9 = strlen(__s) + 6;
  if (a3)
LABEL_9:
    v9 += strlen(a3) + 6;
LABEL_10:
  if (v4)
    v9 += strlen(v4) + 6;
  result = (uint64_t)malloc_type_malloc(v9, 0x4CE0CA09uLL);
  if (result)
  {
    v10 = (char *)result;
    bzero((void *)result, v9);
    v11 = (uint64_t)v10;
    if (v6)
    {
      v12 = strlen(v6);
      if (v12 >= 2)
      {
        v13 = v12 - 1;
        if (v6[v12 - 1] == 46)
        {
          __strncpy_chk();
          ne_session_trim_domain_domain_buffer_227[v13] = 0;
          v6 = ne_session_trim_domain_domain_buffer_227;
        }
      }
      v14 = strlen(v6);
      *v10 = 7;
      v15 = (v14 + 1);
      *(_DWORD *)(v10 + 1) = v15;
      if (v14 == -1)
        v15 = 0;
      else
        memcpy(v10 + 5, v6, v15);
      v11 = (uint64_t)&v10[v15 + 5];
    }
    if (a3)
    {
      v16 = strlen(a3);
      *(_BYTE *)v11 = 11;
      v17 = (v16 + 1);
      *(_DWORD *)(v11 + 1) = v17;
      if (v16 == -1)
        v17 = 0;
      else
        memcpy((void *)(v11 + 5), a3, v17);
      v11 += v17 + 5;
    }
    if (v4)
    {
      v18 = strlen(v4);
      if (v18 >= 2)
      {
        v19 = v18 - 1;
        if (v4[v18 - 1] == 46)
        {
          __strncpy_chk();
          ne_session_trim_domain_domain_buffer_227[v19] = 0;
          v4 = ne_session_trim_domain_domain_buffer_227;
        }
      }
      v20 = strlen(v4);
      *(_BYTE *)v11 = 12;
      v21 = (v20 + 1);
      *(_DWORD *)(v11 + 1) = v21;
      if (v20 != -1)
        memcpy((void *)(v11 + 5), v4, v21);
    }
    v22 = setsockopt(a1, 0xFFFF, 4361, v10, v9);
    free(v10);
    return v22 == 0;
  }
  return result;
}

char *ne_session_set_socket_context_attribute(int a1, char *__s)
{
  size_t v4;
  char *result;
  char *v6;
  int v7;
  size_t v8;
  int v9;

  if (a1 == -1)
    return 0;
  if (__s)
    v4 = strlen(__s) + 6;
  else
    v4 = 5;
  result = (char *)malloc_type_malloc(v4, 0x5A28F707uLL);
  if (result)
  {
    v6 = result;
    bzero(result, v4);
    if (__s)
    {
      v7 = strlen(__s);
      *v6 = 13;
      v8 = (v7 + 1);
      *(_DWORD *)(v6 + 1) = v8;
      if (v7 != -1)
        memcpy(v6 + 5, __s, v8);
    }
    else
    {
      *v6 = 13;
      *(_DWORD *)(v6 + 1) = 0;
    }
    v9 = setsockopt(a1, 0xFFFF, 4361, v6, v4);
    free(v6);
    return (char *)(v9 == 0);
  }
  return result;
}

uint64_t ne_session_copy_socket_domain_attributes(int a1, void **a2, void **a3, void **a4, void **a5)
{
  uint64_t v10;
  uint64_t v12;
  int v13;
  _BYTE *v14;
  size_t v15;
  void *v16;
  uint64_t v17;
  int v18;
  _BYTE *v19;
  size_t v20;
  void *v21;
  uint64_t v22;
  int v23;
  _BYTE *v24;
  size_t v25;
  void *v26;
  uint64_t v27;
  int v28;
  _BYTE *v29;
  size_t v30;
  void *v31;
  socklen_t v32;
  _BYTE v33[768];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  bzero(v33, 0x300uLL);
  v32 = 768;
  if (a1 == -1)
    return 0;
  if (a2 || a3 || a4)
  {
    if (!getsockopt(a1, 0xFFFF, 4361, v33, &v32))
    {
      if (a2 && v32)
      {
        v12 = 0;
        v13 = 0;
        while (1)
        {
          v14 = &v33[v12];
          v15 = *(unsigned int *)&v33[v12 + 1];
          if (v33[v12] == 7)
            break;
          v12 = (v13 + v15 + 5);
          v13 = v12;
          if (v12 >= v32)
            goto LABEL_19;
        }
        if ((_DWORD)v15)
        {
          v16 = malloc_type_calloc(v15 + 1, 1uLL, 0x100004077774924uLL);
          *a2 = v16;
          if (v16)
            memcpy(v16, v14 + 5, v15);
        }
        else
        {
          *a2 = malloc_type_calloc(1uLL, 1uLL, 0x100004077774924uLL);
        }
      }
LABEL_19:
      if (a3 && v32)
      {
        v17 = 0;
        v18 = 0;
        while (1)
        {
          v19 = &v33[v17];
          v20 = *(unsigned int *)&v33[v17 + 1];
          if (v33[v17] == 11)
            break;
          v17 = (v18 + v20 + 5);
          v18 = v17;
          if (v17 >= v32)
            goto LABEL_29;
        }
        if ((_DWORD)v20)
        {
          v21 = malloc_type_calloc(v20 + 1, 1uLL, 0x100004077774924uLL);
          *a3 = v21;
          if (v21)
            memcpy(v21, v19 + 5, v20);
        }
        else
        {
          *a3 = malloc_type_calloc(1uLL, 1uLL, 0x100004077774924uLL);
        }
      }
LABEL_29:
      if (a4 && v32)
      {
        v22 = 0;
        v23 = 0;
        while (1)
        {
          v24 = &v33[v22];
          v25 = *(unsigned int *)&v33[v22 + 1];
          if (v33[v22] == 12)
            break;
          v22 = (v23 + v25 + 5);
          v23 = v22;
          if (v22 >= v32)
            goto LABEL_39;
        }
        if ((_DWORD)v25)
        {
          v26 = malloc_type_calloc(v25 + 1, 1uLL, 0x100004077774924uLL);
          *a4 = v26;
          if (v26)
            memcpy(v26, v24 + 5, v25);
        }
        else
        {
          *a4 = malloc_type_calloc(1uLL, 1uLL, 0x100004077774924uLL);
        }
      }
LABEL_39:
      if (a5 && v32)
      {
        v27 = 0;
        v28 = 0;
        while (1)
        {
          v29 = &v33[v27];
          v30 = *(unsigned int *)&v33[v27 + 1];
          if (v33[v27] == 13)
            break;
          v27 = (v28 + v30 + 5);
          v10 = 1;
          v28 = v27;
          if (v27 >= v32)
            return v10;
        }
        if (!(_DWORD)v30)
        {
          v10 = 1;
          *a5 = malloc_type_calloc(1uLL, 1uLL, 0x100004077774924uLL);
          return v10;
        }
        v31 = malloc_type_calloc(v30 + 1, 1uLL, 0x100004077774924uLL);
        *a5 = v31;
        if (!v31)
          return 1;
        memcpy(v31, v29 + 5, v30);
      }
      return 1;
    }
    return 0;
  }
  return 1;
}

void ne_session_clear_caches()
{
  ne_force_reset_uuid_cache();
  os_unfair_lock_lock(&_ne_session_cache_lock);
  if (_ne_session_cache_notify_token != -1)
  {
    notify_cancel(_ne_session_cache_notify_token);
    _ne_session_cache_notify_token = -1;
  }
  if (_ne_session_master_cache)
  {
    xpc_release((xpc_object_t)_ne_session_master_cache);
    _ne_session_master_cache = 0;
  }
  os_unfair_lock_unlock(&_ne_session_cache_lock);
}

CFMutableDictionaryRef init_app_cache(CFMutableDictionaryRef result, CFIndex capacity)
{
  CFMutableDictionaryRef v2;

  if (result)
  {
    v2 = result;
    *(_DWORD *)result = capacity;
    result = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], capacity, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    *((_QWORD *)v2 + 3) = 0;
    v2 = (CFMutableDictionaryRef)((char *)v2 + 24);
    *((_QWORD *)v2 - 2) = result;
    *((_DWORD *)v2 - 2) = 0;
    *((_QWORD *)v2 + 1) = v2;
  }
  return result;
}

void dealloc_app_cache(uint64_t a1)
{
  if (a1)
  {
    while (CFDictionaryGetCount(*(CFDictionaryRef *)(a1 + 8)))
      dealloc_appdata_node(a1, **(uint64_t ***)(*(_QWORD *)(a1 + 32) + 8));
    CFRelease(*(CFTypeRef *)(a1 + 8));
  }
}

void dealloc_appdata_node(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  _QWORD *v4;

  if (a1 && a2)
  {
    v3 = *a2;
    v4 = (_QWORD *)a2[1];
    if (*a2)
    {
      *(_QWORD *)(v3 + 8) = v4;
      v4 = (_QWORD *)a2[1];
    }
    else
    {
      *(_QWORD *)(a1 + 32) = v4;
    }
    *v4 = v3;
    CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 8), (const void *)a2[2]);
    CFRelease((CFTypeRef)a2[3]);
    free(a2);
  }
}

_QWORD *add_appdata_node(_QWORD *result, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;

  if (result && a2)
  {
    v2 = result[3];
    result += 3;
    *a2 = v2;
    v3 = (_QWORD *)(v2 + 8);
    if (v2)
      v4 = v3;
    else
      v4 = result + 1;
    *v4 = a2;
    *result = a2;
    a2[1] = result;
  }
  return result;
}

uint64_t remove_appdata_node(uint64_t result, uint64_t *a2)
{
  uint64_t v2;
  _QWORD *v3;

  if (result && a2)
  {
    v2 = *a2;
    v3 = (_QWORD *)a2[1];
    if (*a2)
    {
      *(_QWORD *)(v2 + 8) = v3;
      v3 = (_QWORD *)a2[1];
    }
    else
    {
      *(_QWORD *)(result + 32) = v3;
    }
    *v3 = v2;
  }
  return result;
}

uint64_t **move_node_to_front(uint64_t **result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t *v4;
  uint64_t **v5;
  uint64_t **v6;

  if (result && a2)
  {
    v2 = *a2;
    v3 = (uint64_t *)a2[1];
    if (*a2)
    {
      *(_QWORD *)(v2 + 8) = v3;
      v3 = (uint64_t *)a2[1];
    }
    else
    {
      result[4] = v3;
    }
    *v3 = v2;
    v4 = result[3];
    result += 3;
    *a2 = (uint64_t)v4;
    v5 = (uint64_t **)(v4 + 1);
    if (v4)
      v6 = v5;
    else
      v6 = result + 1;
    *v6 = a2;
    *result = a2;
    a2[1] = (uint64_t)result;
  }
  return result;
}

_QWORD *alloc_appdata_node(uint64_t a1, uint64_t a2)
{
  _QWORD *result;

  result = 0;
  if (a1 && a2)
  {
    result = malloc_type_malloc(0x20uLL, 0xE0040B6E8BBF2uLL);
    if (result)
    {
      result[2] = a1;
      result[3] = a2;
    }
  }
  return result;
}

void myCFRelease(const void **a1)
{
  const void *v2;

  if (a1)
  {
    v2 = *a1;
    if (v2)
    {
      CFRelease(v2);
      *a1 = 0;
    }
  }
}

CFTypeRef myCFRetain(CFTypeRef cf)
{
  if (cf)
    return CFRetain(cf);
  return cf;
}

void myCFReplace(CFTypeRef *a1, CFTypeRef cf)
{
  CFTypeRef v3;

  if (a1)
  {
    if (cf)
      v3 = CFRetain(cf);
    else
      v3 = 0;
    if (*a1)
      CFRelease(*a1);
    *a1 = v3;
  }
}

uint64_t myCFEqual(unint64_t cf1, unint64_t a2)
{
  uint64_t result;

  if (!(cf1 | a2))
    return 1;
  result = 0;
  if (cf1)
  {
    if (a2)
      return CFEqual((CFTypeRef)cf1, (CFTypeRef)a2);
  }
  return result;
}

void myCFDataReleaseReset(CFDataRef *a1)
{
  __CFData *v2;
  UInt8 *MutableBytePtr;
  UInt8 *v4;
  rsize_t Length;
  rsize_t v6;

  if (a1)
  {
    v2 = *a1;
    if (v2)
    {
      MutableBytePtr = CFDataGetMutableBytePtr(v2);
      if (MutableBytePtr)
      {
        v4 = MutableBytePtr;
        Length = CFDataGetLength(*a1);
        v6 = CFDataGetLength(*a1);
        memset_s(v4, Length, 0, v6);
      }
      CFRelease(*a1);
      *a1 = 0;
    }
  }
}

__CFData *myCFDataCreateMutableCopy(const __CFAllocator *a1, const UInt8 *a2, CFIndex a3)
{
  __CFData *v3;
  __CFData *Mutable;

  v3 = 0;
  if (a2)
  {
    if (a3)
    {
      Mutable = CFDataCreateMutable(a1, 0);
      v3 = Mutable;
      if (Mutable)
        CFDataAppendBytes(Mutable, a2, a3);
    }
  }
  return v3;
}

const __CFData *myCFDataCreateMutableCopyOfData(const __CFData *theData)
{
  NSObject *v1;
  uint8_t v2[16];

  if (theData)
  {
    theData = CFDataCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, theData);
    if (!theData)
    {
      v1 = ne_log_obj();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v2 = 0;
        _os_log_fault_impl(&dword_208439000, v1, OS_LOG_TYPE_FAULT, "CFDataCreateMutableCopy failed", v2, 2u);
      }
      return 0;
    }
  }
  return theData;
}

void myCFDataResetReplace(CFDataRef *a1, CFDataRef theData)
{
  const __CFData *MutableCopyOfData;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    MutableCopyOfData = myCFDataCreateMutableCopyOfData(theData);
    myCFDataReleaseReset(a1);
    *a1 = MutableCopyOfData;
  }
  else
  {
    v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      v5 = 136315138;
      v6 = "myCFDataResetReplace";
      _os_log_fault_impl(&dword_208439000, v4, OS_LOG_TYPE_FAULT, "%s called with null oldP", (uint8_t *)&v5, 0xCu);
    }
  }
}

__CFData *myCFDataCreateMutableFromString(const __CFString *a1)
{
  CFIndex Length;
  CFIndex v3;
  char *v4;
  UInt8 *v5;
  const __CFAllocator *v6;
  CFIndex v7;
  __CFData *MutableCopy;

  if (!a1)
    return 0;
  if (!CFStringGetLength(a1))
    return 0;
  Length = CFStringGetLength(a1);
  v3 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
  v4 = (char *)malloc_type_malloc(v3, 0xD053E110uLL);
  if (!v4)
    return 0;
  v5 = (UInt8 *)v4;
  CFStringGetCString(a1, v4, v3, 0x8000100u);
  v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v7 = CFStringGetLength(a1);
  MutableCopy = myCFDataCreateMutableCopy(v6, v5, v7);
  memset_s(v5, v3, 0, v3);
  free(v5);
  return MutableCopy;
}

void myCFDataResetReplaceFromString(CFDataRef *a1, CFStringRef theString)
{
  const __CFString *MutableCopy;
  CFIndex Length;
  CFIndex v5;
  char *v6;
  UInt8 *v7;
  const __CFAllocator *v8;
  CFIndex v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    MutableCopy = theString;
    if (theString)
    {
      if (CFStringGetLength(theString) >= 1)
      {
        Length = CFStringGetLength(MutableCopy);
        v5 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
        v6 = (char *)malloc_type_malloc(v5, 0x4DB6B145uLL);
        if (v6)
        {
          v7 = (UInt8 *)v6;
          CFStringGetCString(MutableCopy, v6, v5, 0x8000100u);
          v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
          v9 = CFStringGetLength(MutableCopy);
          MutableCopy = (const __CFString *)myCFDataCreateMutableCopy(v8, v7, v9);
          memset_s(v7, v5, 0, v5);
          free(v7);
          goto LABEL_9;
        }
        v10 = ne_log_obj();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        {
          v12 = 67109120;
          LODWORD(v13) = v5;
          _os_log_fault_impl(&dword_208439000, v10, OS_LOG_TYPE_FAULT, "malloc(%u) failed", (uint8_t *)&v12, 8u);
        }
      }
      MutableCopy = 0;
    }
LABEL_9:
    myCFDataReleaseReset(a1);
    *a1 = (CFDataRef)MutableCopy;
    return;
  }
  v11 = ne_log_obj();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
  {
    v12 = 136315138;
    v13 = "myCFDataResetReplaceFromString";
    _os_log_fault_impl(&dword_208439000, v11, OS_LOG_TYPE_FAULT, "%s called with null oldP", (uint8_t *)&v12, 0xCu);
  }
}

const void *NEIsValidCFType(const void *result, uint64_t a2)
{
  if (result)
    return (const void *)(CFGetTypeID(result) == a2);
  return result;
}

const void *NEGetValueWithType(const __CFDictionary *a1, const void *a2, uint64_t a3)
{
  const void *v3;
  const void *Value;

  v3 = 0;
  if (a1)
  {
    if (a2)
    {
      Value = CFDictionaryGetValue(a1, a2);
      if (!Value)
        return 0;
      v3 = Value;
      if (CFGetTypeID(Value) != a3)
        return 0;
    }
  }
  return v3;
}

void NEInitCFTypes()
{
  if (NEInitCFTypes_onceToken != -1)
    dispatch_once(&NEInitCFTypes_onceToken, &__block_literal_global_318);
}

_QWORD *NEMapIntegerToString(_QWORD *result, int a2)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;

  if (result)
  {
    v2 = result;
    result = (_QWORD *)*result;
    if (result)
    {
      v3 = v2 + 2;
      do
      {
        if (*((_DWORD *)v3 - 2) == a2)
          break;
        v4 = (_QWORD *)*v3;
        v3 += 2;
        result = v4;
      }
      while (v4);
    }
  }
  return result;
}

const void **NEMapStringToInteger(const void **result, CFTypeRef cf1)
{
  const void **v3;
  const void *v4;
  const void *v5;

  if (result)
  {
    v3 = result;
    v4 = *result;
    if (*result)
    {
      while (!cf1 || !CFEqual(cf1, v4))
      {
        v5 = v3[2];
        v3 += 2;
        v4 = v5;
        if (!v5)
          return 0;
      }
      return (const void **)*((unsigned int *)v3 + 2);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t NEInChecksum(unsigned __int16 *a1, int a2)
{
  unsigned int v2;
  unsigned int v3;
  int v4;
  BOOL v5;

  if (a2 < 2)
  {
    v2 = 0;
  }
  else
  {
    v2 = 0;
    v3 = a2;
    do
    {
      v4 = *a1++;
      v2 += v4;
      a2 = v3 - 2;
      v5 = v3 > 3;
      v3 -= 2;
    }
    while (v5);
  }
  if (a2 == 1)
    v2 += *(unsigned __int8 *)a1;
  return (unsigned __int16)~(HIWORD(v2) + v2 + ((HIWORD(v2) + (unsigned __int16)v2) >> 16));
}

void *NECreateAddressStructFromString(const __CFString *a1, uint64_t a2, uint64_t a3)
{
  CFIndex v6;
  char *v7;
  const __CFAllocator *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  CFIndex v12;
  char *v13;
  addrinfo *v15;
  addrinfo *v16;
  addrinfo v17;

  v16 = 0;
  if (!a1)
    return 0;
  v6 = CFStringGetLength(a1) + 1;
  v7 = (char *)malloc_type_malloc(v6, 0xEFF596B0uLL);
  CFStringGetCString(a1, v7, v6, 0x600u);
  v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  if (a2)
    v9 = CFStringCreateWithFormat(v8, 0, CFSTR("%@"), a2);
  else
    v9 = CFStringCreateWithFormat(v8, 0, CFSTR("%d"), a3);
  v11 = v9;
  v12 = CFStringGetLength(v9) + 1;
  v13 = (char *)malloc_type_malloc(v12, 0x3A484EECuLL);
  CFStringGetCString(v11, v13, v12, 0x600u);
  CFRelease(v11);
  memset(&v17, 0, sizeof(v17));
  v17.ai_socktype = 2;
  v17.ai_flags = 4;
  if (getaddrinfo(v7, v13, &v17, &v16))
  {
    v10 = 0;
    if (!v7)
      goto LABEL_9;
  }
  else
  {
    v10 = malloc_type_malloc(0x80uLL, 0x1000040AE2C30F4uLL);
    v15 = v16;
    if (v10)
      __memcpy_chk();
    freeaddrinfo(v15);
    if (!v7)
      goto LABEL_9;
  }
  free(v7);
LABEL_9:
  if (v13)
    free(v13);
  return v10;
}

const __CFString *NEGetAddressFamilyFromString(CFStringRef theString)
{
  const __CFString *v1;
  CFIndex v2;
  char *v3;
  addrinfo *v5;
  addrinfo *v6;
  addrinfo v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v1 = theString;
  v16 = *MEMORY[0x24BDAC8D0];
  v6 = 0;
  if (theString)
  {
    v14 = 0u;
    v15 = 0u;
    v13 = 0u;
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v8 = 0u;
    v2 = CFStringGetLength(theString) + 1;
    v3 = (char *)malloc_type_malloc(v2, 0xD62D3ECEuLL);
    CFStringGetCString(v1, v3, v2, 0x600u);
    memset(&v7, 0, sizeof(v7));
    v7.ai_socktype = 2;
    v7.ai_flags = 4;
    if (!getaddrinfo(v3, 0, &v7, &v6))
    {
      v5 = v6;
      __memcpy_chk();
      freeaddrinfo(v5);
      v1 = (const __CFString *)BYTE1(v8);
      if (!v3)
        return v1;
      goto LABEL_4;
    }
    v1 = 0;
    if (v3)
LABEL_4:
      free(v3);
  }
  return v1;
}

CFDataRef NECreateAddressDataFromString(const __CFString *a1, const __CFString *a2, int *a3)
{
  CFIndex v6;
  char *v7;
  CFIndex v8;
  char *v9;
  CFDataRef v10;
  addrinfo *v12;
  int v13;
  addrinfo *v14;
  addrinfo v15;
  _OWORD v16[8];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v14 = 0;
  if (!a1)
    return 0;
  memset(v16, 0, sizeof(v16));
  v6 = CFStringGetLength(a1) + 1;
  v7 = (char *)malloc_type_malloc(v6, 0x3A9DCF8DuLL);
  CFStringGetCString(a1, v7, v6, 0x600u);
  if (a2)
  {
    v8 = CFStringGetLength(a2) + 1;
    v9 = (char *)malloc_type_malloc(v8, 0x565B4E30uLL);
    CFStringGetCString(a2, v9, v8, 0x600u);
  }
  else
  {
    v9 = 0;
  }
  memset(&v15, 0, sizeof(v15));
  v15.ai_socktype = 2;
  v15.ai_flags = 4;
  if (getaddrinfo(v7, v9, &v15, &v14))
    goto LABEL_7;
  v12 = v14;
  __memcpy_chk();
  freeaddrinfo(v12);
  if (BYTE1(v16[0]) == 30)
  {
    v10 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const UInt8 *)v16 + 8, 16);
    if (!a3)
      goto LABEL_8;
    v13 = 30;
    goto LABEL_19;
  }
  if (BYTE1(v16[0]) == 2)
  {
    v10 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const UInt8 *)v16 + 4, 4);
    if (!a3)
      goto LABEL_8;
    v13 = 2;
LABEL_19:
    *a3 = v13;
    goto LABEL_8;
  }
LABEL_7:
  v10 = 0;
LABEL_8:
  if (v7)
    free(v7);
  if (v9)
    free(v9);
  return v10;
}

CFDataRef NECreateAddressStructDataFromString(const __CFString *a1, const __CFString *a2, int *a3)
{
  CFIndex v6;
  char *v7;
  CFIndex v8;
  char *v9;
  CFDataRef v10;
  addrinfo *v11;
  int v12;
  addrinfo *v14;
  addrinfo v15;
  UInt8 bytes[16];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v14 = 0;
  if (!a1)
    return 0;
  v22 = 0u;
  v23 = 0u;
  v21 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  *(_OWORD *)bytes = 0u;
  v6 = CFStringGetLength(a1) + 1;
  v7 = (char *)malloc_type_malloc(v6, 0x967EDE5BuLL);
  CFStringGetCString(a1, v7, v6, 0x600u);
  if (a2)
  {
    v8 = CFStringGetLength(a2) + 1;
    v9 = (char *)malloc_type_malloc(v8, 0xE155708FuLL);
    CFStringGetCString(a2, v9, v8, 0x600u);
  }
  else
  {
    v9 = 0;
  }
  memset(&v15, 0, sizeof(v15));
  v15.ai_socktype = 2;
  v15.ai_flags = 4;
  if (!getaddrinfo(v7, v9, &v15, &v14))
  {
    v11 = v14;
    __memcpy_chk();
    freeaddrinfo(v11);
    v10 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], bytes, 128);
    v12 = bytes[1];
    if (bytes[1] == 2)
    {
      if (!a3)
        goto LABEL_14;
      v12 = 2;
    }
    else if (!a3 || bytes[1] != 30)
    {
      goto LABEL_14;
    }
    *a3 = v12;
    goto LABEL_14;
  }
  v10 = 0;
LABEL_14:
  if (v7)
    free(v7);
  if (v9)
    free(v9);
  return v10;
}

CFStringRef NECreateAddressString(CFStringRef result)
{
  int v1;
  uint64_t *p_info;
  int v3;
  char cStr[64];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (result)
  {
    v1 = BYTE1(result->isa);
    if (v1 == 30)
    {
      if (LOBYTE(result->isa) >= 0x1Cu)
      {
        p_info = &result->info;
        v3 = 30;
        goto LABEL_8;
      }
    }
    else if (v1 == 2 && LOBYTE(result->isa) >= 0x10u)
    {
      p_info = (uint64_t *)((char *)&result->isa + 4);
      v3 = 2;
LABEL_8:
      inet_ntop(v3, p_info, cStr, 0x40u);
      return CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], cStr, 0x600u);
    }
    return 0;
  }
  return result;
}

__CFString *NECreateAddressStringWithPort(uint64_t a1)
{
  const __CFString *v2;
  const __CFString *v3;
  __CFString *MutableCopy;
  int v5;
  const __CFString *v6;

  v2 = NECreateAddressString((CFStringRef)a1);
  if (!v2)
    return 0;
  v3 = v2;
  MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, v2);
  CFRelease(v3);
  v5 = *(unsigned __int8 *)(a1 + 1);
  if (v5 == 30)
  {
    v6 = CFSTR(".%u");
    goto LABEL_7;
  }
  if (v5 == 2)
  {
    v6 = CFSTR(":%u");
LABEL_7:
    CFStringAppendFormat(MutableCopy, 0, v6, bswap32(*(unsigned __int16 *)(a1 + 2)) >> 16);
  }
  return MutableCopy;
}

uint64_t NEGetPortFromAddress(uint64_t result)
{
  int v1;
  unsigned int v2;

  if (result)
  {
    v1 = *(unsigned __int8 *)(result + 1);
    if (v1 == 30 || v1 == 2)
      v2 = *(unsigned __int16 *)(result + 2);
    else
      v2 = 0;
    return __rev16(v2);
  }
  return result;
}

CFStringRef NECreateAddressStringFromBuffer(CFStringRef result, unint64_t a2, int a3)
{
  CFStringRef v3;
  int v4;
  char cStr[64];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (result)
  {
    v3 = result;
    if (a2 >= 4 && a3 == 2)
    {
      v4 = 2;
LABEL_8:
      inet_ntop(v4, v3, cStr, 0x40u);
      return CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], cStr, 0x600u);
    }
    result = 0;
    if (a2 >= 0x10 && a3 == 30)
    {
      v4 = 30;
      goto LABEL_8;
    }
  }
  return result;
}

CFStringRef NECreateIPv4AddressMaskStringFromPrefix(int a1)
{
  size_t v3;
  int v4;
  int __b;
  char cStr[64];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (a1 > 32)
    return 0;
  __b = 0;
  if (a1 < 8)
  {
    v3 = 0;
  }
  else
  {
    v3 = (a1 >> 3) - 1 + 1;
    memset(&__b, 255, v3);
  }
  if (a1 <= 0)
    v4 = -(-a1 & 7);
  else
    v4 = a1 & 7;
  if (v4)
    cStr[v3 - 4] = 0xFF00u >> v4;
  inet_ntop(2, &__b, cStr, 0x40u);
  return CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], cStr, 0x600u);
}

CFStringRef NECreateIPv6AddressMaskStringFromPrefix(int a1)
{
  size_t v2;
  int v3;
  _QWORD __b[2];
  char cStr[64];
  uint64_t v7;

  v2 = 0;
  v7 = *MEMORY[0x24BDAC8D0];
  __b[0] = 0;
  __b[1] = 0;
  if (a1 >= 8)
  {
    v2 = (a1 >> 3) - 1 + 1;
    memset(__b, 255, v2);
  }
  if (a1 <= 0)
    v3 = -(-a1 & 7);
  else
    v3 = a1 & 7;
  if (v3)
    *((_BYTE *)__b + v2) = 0xFF00u >> v3;
  inet_ntop(30, __b, cStr, 0x40u);
  return CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], cStr, 0x600u);
}

CFStringRef NECreateIPv6SubnetAddressWithPrefix(const __CFString *a1, int a2)
{
  const __CFString *v3;
  _BYTE *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  CFStringRef v8;
  _QWORD v10[2];
  char cStr[64];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = NECreateIPv6AddressMaskStringFromPrefix(a2);
  v4 = NECreateAddressStructFromString(v3, 0, 0);
  v5 = NECreateAddressStructFromString(a1, 0, 0);
  v6 = v5;
  if (v4 && v5)
  {
    if (v4[1] == 30 && *((_BYTE *)v5 + 1) == 30)
    {
      v7 = 0;
      v10[0] = 0;
      v10[1] = 0;
      do
      {
        *((_BYTE *)v10 + v7) = v4[v7 + 8] & *((_BYTE *)v5 + v7 + 8);
        ++v7;
      }
      while (v7 != 16);
      inet_ntop(30, v10, cStr, 0x40u);
      v8 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], cStr, 0x600u);
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
    if (!v4)
    {
      if (!v5)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  free(v4);
  if (v6)
LABEL_10:
    free(v6);
LABEL_11:
  if (v3)
    CFRelease(v3);
  return v8;
}

void NESetValueIfPresent(const __CFDictionary *a1, __CFDictionary *a2, void *key)
{
  const void *Value;

  if (a1 && a2 && key)
  {
    if (CFDictionaryContainsKey(a1, key))
    {
      Value = CFDictionaryGetValue(a1, key);
      CFDictionarySetValue(a2, key, Value);
    }
  }
}

void NEAddDateToDictionary(__CFDictionary *a1, const void *a2, uint64_t a3)
{
  CFDateRef v5;
  CFDateRef v6;

  if (a1 && a2)
  {
    v5 = CFDateCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (double)a3 - *MEMORY[0x24BDBD238]);
    if (v5)
    {
      v6 = v5;
      CFDictionaryAddValue(a1, a2, v5);
      CFRelease(v6);
    }
  }
}

void NEAddIntToDictionary(__CFDictionary *a1, const void *a2, int a3)
{
  CFNumberRef v5;
  CFNumberRef v6;
  int valuePtr;

  valuePtr = a3;
  if (a1 && a2)
  {
    v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberIntType, &valuePtr);
    if (v5)
    {
      v6 = v5;
      CFDictionaryAddValue(a1, a2, v5);
      CFRelease(v6);
    }
  }
}

void NEAddInt64ToDictionary(__CFDictionary *a1, const void *a2, uint64_t a3)
{
  CFNumberRef v5;
  CFNumberRef v6;
  uint64_t valuePtr;

  valuePtr = a3;
  if (a1 && a2)
  {
    v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt64Type, &valuePtr);
    if (v5)
    {
      v6 = v5;
      CFDictionaryAddValue(a1, a2, v5);
      CFRelease(v6);
    }
  }
}

void NEAddIntToArray(__CFArray *a1, int a2)
{
  CFNumberRef v3;
  CFNumberRef v4;
  int valuePtr;

  valuePtr = a2;
  if (a1)
  {
    v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberIntType, &valuePtr);
    if (v3)
    {
      v4 = v3;
      CFArrayAppendValue(a1, v3);
      CFRelease(v4);
    }
  }
}

uint64_t NEGetIntFromDictionary(const __CFDictionary *a1, const void *a2, uint64_t a3)
{
  uint64_t v3;
  const __CFNumber *Value;
  unsigned int valuePtr;

  v3 = a3;
  valuePtr = a3;
  if (a1)
  {
    if (a2)
    {
      Value = (const __CFNumber *)CFDictionaryGetValue(a1, a2);
      if (Value)
      {
        CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
        return valuePtr;
      }
    }
  }
  return v3;
}

uint64_t NEGetIntFromArray(const __CFArray *a1, CFIndex a2, uint64_t a3)
{
  uint64_t v3;
  const __CFNumber *ValueAtIndex;
  unsigned int valuePtr;

  v3 = a3;
  valuePtr = a3;
  if (a1)
  {
    ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(a1, a2);
    if (ValueAtIndex)
    {
      CFNumberGetValue(ValueAtIndex, kCFNumberIntType, &valuePtr);
      return valuePtr;
    }
  }
  return v3;
}

void NEAddAddressToDictionary(__CFDictionary *a1, const void *a2, unsigned __int8 *a3)
{
  int v5;
  const void *v6;
  int v7;
  CFStringRef v8;
  CFStringRef v9;
  char cStr[64];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (a1 && a2 && a3)
  {
    v5 = a3[1];
    if (v5 == 30)
    {
      v6 = a3 + 8;
      v7 = 30;
    }
    else
    {
      if (v5 != 2)
        return;
      v6 = a3 + 4;
      v7 = 2;
    }
    inet_ntop(v7, v6, cStr, 0x40u);
    v8 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], cStr, 0x600u);
    if (v8)
    {
      v9 = v8;
      CFDictionaryAddValue(a1, a2, v8);
      CFRelease(v9);
    }
  }
}

void NEAddPortToDictionary(__CFDictionary *a1, const void *a2, uint64_t a3)
{
  int v3;

  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        v3 = *(unsigned __int8 *)(a3 + 1);
        if (v3 == 30 || v3 == 2)
          NEAddIntToDictionary(a1, a2, bswap32(*(unsigned __int16 *)(a3 + 2)) >> 16);
      }
    }
  }
}

uint64_t NEGetPrefixForAddressRange(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  int v9;
  unsigned int v10;
  uint64_t v11;
  __int128 *v12;
  __int128 v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  unsigned int v17;
  unsigned int v18;
  uint64_t v19;
  BOOL v20;
  unsigned int v21;
  unsigned int v22;
  uint64_t v23;
  __int128 v24;
  unint64_t v25;
  unint64_t i;
  uint64_t v27;
  unint64_t v28;
  int64x2_t v29;
  int64x2_t v30;
  int32x4_t v31;
  int32x4_t v32;
  uint32x4_t v33;
  int64x2_t v34;
  int32x4_t v35;
  int8x16_t v36;
  uint64x2_t v37;
  uint64x2_t v38;
  uint64x2_t v39;
  int v40;
  int64x2_t v41;
  int64x2_t v42;
  int32x4_t v43;
  unint64_t v44;
  int32x4_t v45;
  uint32x4_t v46;
  int64x2_t v47;
  int32x4_t v48;
  int8x16_t v49;
  uint64x2_t v50;
  uint64x2_t v51;
  uint64x2_t v52;
  __int128 v53;
  __int128 v54;

  result = 0xFFFFFFFFLL;
  if (!a1 || !a2)
    return result;
  v4 = *(unsigned __int8 *)(a1 + 1);
  if (v4 != *(unsigned __int8 *)(a2 + 1))
    return 0xFFFFFFFFLL;
  if (v4 == 30)
  {
    v11 = 0;
    v12 = (__int128 *)(a1 + 8);
    v13 = *(_OWORD *)(a1 + 8);
    v53 = *(_OWORD *)(a2 + 8);
    v54 = v13;
    result = 32;
    while (1)
    {
      v14 = *(_DWORD *)((char *)&v54 + v11);
      v15 = *(_DWORD *)((char *)&v53 + v11);
      if (v14 != v15)
        break;
      v11 += 4;
      result += 32;
      if (v11 == 16)
      {
        result = 128;
        goto LABEL_20;
      }
    }
    v21 = bswap32(v15);
    v22 = bswap32(v14);
    do
    {
      v22 >>= 1;
      v20 = v22 == v21 >> 1;
      v21 >>= 1;
      --result;
    }
    while (!v20);
LABEL_20:
    v23 = 0;
    v24 = *v12;
    v53 = *(_OWORD *)(a2 + 8);
    v54 = v24;
    v25 = 32 - result;
    for (i = result; ; i -= 32)
    {
      if (!i)
      {
        if (*((_DWORD *)&v54 + v23) || *((_DWORD *)&v53 + v23) != -1)
          return 0xFFFFFFFFLL;
        return result;
      }
      if (i <= 0x1F)
        break;
      ++v23;
      v25 += 32;
      if (v23 == 4)
        return result;
    }
    if (v25 <= 1)
      v25 = 1;
    v27 = v25 - 1;
    v28 = (v25 + 3) & 0xFFFFFFFFFFFFFFFCLL;
    v29 = (int64x2_t)xmmword_208467140;
    v30 = (int64x2_t)xmmword_208467150;
    v31 = (int32x4_t)xmmword_208467160;
    v32 = 0uLL;
    v33.i64[0] = 0x100000001;
    v33.i64[1] = 0x100000001;
    v34 = vdupq_n_s64(4uLL);
    v35.i64[0] = 0x400000004;
    v35.i64[1] = 0x400000004;
    do
    {
      v36 = (int8x16_t)v32;
      v37 = (uint64x2_t)v29;
      v38 = (uint64x2_t)v30;
      v32 = vaddq_s32((int32x4_t)vshlq_u32(v33, (uint32x4_t)v31), v32);
      v29 = vaddq_s64(v29, v34);
      v30 = vaddq_s64(v30, v34);
      v31 = vaddq_s32(v31, v35);
      v28 -= 4;
    }
    while (v28);
    v39 = (uint64x2_t)vdupq_lane_s64(v27, 0);
    v40 = vaddvq_s32((int32x4_t)vbslq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64(v38, v39), (int32x4_t)vcgtq_u64(v37, v39)), v36, (int8x16_t)v32));
    if ((bswap32(*((_DWORD *)&v54 + v23)) & v40) == 0
      && (v40 & ~bswap32(*((_DWORD *)&v53 + v23))) == 0)
    {
      return result;
    }
    return 0xFFFFFFFFLL;
  }
  if (v4 != 2)
    return 0xFFFFFFFFLL;
  v5 = *(_DWORD *)(a1 + 4);
  v6 = bswap32(v5);
  v7 = *(_DWORD *)(a2 + 4);
  v8 = bswap32(v7);
  if (v5 == v7)
  {
    v9 = 0;
    v10 = 32;
  }
  else
  {
    v16 = -3;
    v17 = v8;
    v18 = v6;
    do
    {
      v19 = v16;
      v18 >>= 1;
      v20 = v18 == v17 >> 1;
      v17 >>= 1;
      --v16;
    }
    while (!v20);
    v10 = v19 + 34;
    if (v19 == -2)
    {
      v9 = 0;
    }
    else
    {
      v41 = (int64x2_t)xmmword_208467140;
      v42 = (int64x2_t)xmmword_208467150;
      v43 = (int32x4_t)xmmword_208467160;
      v44 = -v16 & 0xFFFFFFFFFFFFFFFCLL;
      v45 = 0uLL;
      v46.i64[0] = 0x100000001;
      v46.i64[1] = 0x100000001;
      v47 = vdupq_n_s64(4uLL);
      v48.i64[0] = 0x400000004;
      v48.i64[1] = 0x400000004;
      do
      {
        v49 = (int8x16_t)v45;
        v50 = (uint64x2_t)v41;
        v51 = (uint64x2_t)v42;
        v45 = vaddq_s32((int32x4_t)vshlq_u32(v46, (uint32x4_t)v43), v45);
        v41 = vaddq_s64(v41, v47);
        v42 = vaddq_s64(v42, v47);
        v43 = vaddq_s32(v43, v48);
        v44 -= 4;
      }
      while (v44);
      v52 = (uint64x2_t)vdupq_lane_s64(-3 - v19, 0);
      v9 = vaddvq_s32((int32x4_t)vbslq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vcgtq_u64(v51, v52), (int32x4_t)vcgtq_u64(v50, v52)), v49, (int8x16_t)v45));
    }
  }
  if (((v6 | ~v8) & v9) != 0)
    return 0xFFFFFFFFLL;
  else
    return v10;
}

uint64_t NEGetPrefixForAddressRangeStrings(const __CFString *a1, const __CFString *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  v3 = NECreateAddressStructFromString(a1, 0, 0);
  v4 = NECreateAddressStructFromString(a2, 0, 0);
  v5 = NEGetPrefixForAddressRange((uint64_t)v3, (uint64_t)v4);
  if (v3)
    free(v3);
  if (v4)
    free(v4);
  return v5;
}

uint64_t NEGetPrefixForIPv4NetmaskString(const __CFString *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = NECreateAddressStructFromString(a1, 0, 0);
  v2 = NECreateAddressStructFromString(CFSTR("255.255.255.255"), 0, 0);
  v3 = NEGetPrefixForAddressRange((uint64_t)v1, (uint64_t)v2);
  if (v1)
    free(v1);
  if (v2)
    free(v2);
  return v3;
}

uint64_t NEGetPrefixForIPv6NetmaskString(const __CFString *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = NECreateAddressStructFromString(a1, 0, 0);
  v2 = NECreateAddressStructFromString(CFSTR("ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff"), 0, 0);
  v3 = NEGetPrefixForAddressRange((uint64_t)v1, (uint64_t)v2);
  if (v1)
    free(v1);
  if (v2)
    free(v2);
  return v3;
}

uint64_t NECompareAddresses(const __CFString *a1, const __CFString *a2)
{
  uint64_t v2;
  CFDataRef v4;
  const __CFData *v5;
  CFDataRef v6;
  const __CFData *v7;
  const UInt8 *BytePtr;
  const UInt8 *v9;
  size_t Length;
  int v11;
  uint64_t v13;

  v2 = 4294967294;
  if (a1 && a2)
  {
    v13 = 0;
    v4 = NECreateAddressDataFromString(a1, 0, (int *)&v13 + 1);
    v5 = v4;
    if (v4 && HIDWORD(v13))
    {
      v6 = NECreateAddressDataFromString(a2, 0, (int *)&v13);
      if (v6)
      {
        v7 = v6;
        if ((_DWORD)v13 == HIDWORD(v13))
        {
          BytePtr = CFDataGetBytePtr(v5);
          v9 = CFDataGetBytePtr(v7);
          Length = CFDataGetLength(v5);
          v11 = memcmp(BytePtr, v9, Length);
          if (v11 >= 0)
            v2 = v11 != 0;
          else
            v2 = 0xFFFFFFFFLL;
        }
        CFRelease(v5);
        v5 = v7;
      }
      goto LABEL_12;
    }
    if (v4)
LABEL_12:
      CFRelease(v5);
  }
  return v2;
}

BOOL NEAddressRangeIsContainedInAddressRange(const __CFString *a1, const __CFString *a2, const __CFString *a3, const __CFString *a4)
{
  int v6;
  unsigned int v7;

  v6 = NECompareAddresses(a1, a3);
  v7 = NECompareAddresses(a2, a4);
  return (v6 + 1) < 2 && v7 < 2;
}

void NEAddDataToDictionary(__CFDictionary *a1, const void *a2, UInt8 *bytes, int a4)
{
  CFDataRef v6;
  CFDataRef v7;

  if (a1 && a2 && bytes)
  {
    v6 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], bytes, a4);
    if (v6)
    {
      v7 = v6;
      CFDictionaryAddValue(a1, a2, v6);
      CFRelease(v7);
    }
  }
}

void NEAppendIntToArray(__CFArray *a1, int a2)
{
  CFNumberRef v3;
  CFNumberRef v4;
  int valuePtr;

  valuePtr = a2;
  if (a1)
  {
    v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberIntType, &valuePtr);
    if (v3)
    {
      v4 = v3;
      CFArrayAppendValue(a1, v3);
      CFRelease(v4);
    }
  }
}

const __CFNumber *NEGetValueFromIntArray(const __CFNumber *result, CFIndex a2)
{
  const __CFArray *v3;
  unsigned int valuePtr;

  valuePtr = 0;
  if (result)
  {
    v3 = result;
    if (CFArrayGetCount(result) <= a2)
    {
      return 0;
    }
    else
    {
      result = (const __CFNumber *)CFArrayGetValueAtIndex(v3, a2);
      if (result)
      {
        CFNumberGetValue(result, kCFNumberIntType, &valuePtr);
        return (const __CFNumber *)valuePtr;
      }
    }
  }
  return result;
}

CFDataRef NECreateDataFromString(const __CFString *a1, int a2)
{
  CFIndex Length;
  CFIndex v5;
  CFIndex v6;
  char *v7;
  UInt8 *v8;
  CFIndex v9;
  CFDataRef v10;

  if (!a1)
    return 0;
  Length = CFStringGetLength(a1);
  if (!Length)
    return 0;
  v5 = Length;
  v6 = Length + 1;
  v7 = (char *)malloc_type_malloc(Length + 1, 0x970EF794uLL);
  if (!v7)
    return 0;
  v8 = (UInt8 *)v7;
  if (CFStringGetCString(a1, v7, v6, 0x600u))
  {
    if (a2)
      v9 = v5 + 1;
    else
      v9 = v5;
    v10 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v8, v9);
  }
  else
  {
    v10 = 0;
  }
  free(v8);
  return v10;
}

CFStringRef NECreateStringFromData(CFStringRef result)
{
  const __CFData *v1;
  CFIndex Length;
  const UInt8 *BytePtr;
  const __CFAllocator *v4;
  const __CFData *v5;
  const __CFData *v6;
  CFIndex location;
  CFIndex v8;
  UInt8 bytes;
  CFRange v10;

  if (result)
  {
    v1 = (const __CFData *)result;
    Length = CFDataGetLength((CFDataRef)result);
    BytePtr = CFDataGetBytePtr(v1);
    bytes = 0;
    v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v5 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], &bytes, 1);
    if (!v5
      || (v6 = v5,
          v10.location = 0,
          v10.length = Length,
          location = CFDataFind(v1, v5, v10, 0).location,
          CFRelease(v6),
          location == -1))
    {
      v8 = CFDataGetLength(v1);
      return CFStringCreateWithBytes(v4, BytePtr, v8, 0x600u, 0);
    }
    else
    {
      return CFStringCreateWithCString(v4, (const char *)BytePtr, 0x600u);
    }
  }
  return result;
}

void *NECreateCStringFromCFString(const __CFString *a1)
{
  CFIndex Length;
  CFIndex v3;
  void *v4;

  if (!a1)
    return 0;
  Length = CFStringGetLength(a1);
  if (!Length)
    return 0;
  v3 = Length + 1;
  v4 = malloc_type_calloc(1uLL, Length + 1, 0x85813EFEuLL);
  if (v4 && !CFStringGetCString(a1, (char *)v4, v3, 0x600u))
  {
    free(v4);
    return 0;
  }
  return v4;
}

void NEAddValueToIntKeyedDictionary(__CFDictionary *a1, int a2, const void *a3)
{
  CFNumberRef v5;
  CFNumberRef v6;
  int valuePtr;

  valuePtr = a2;
  if (a1 && a3)
  {
    v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberIntType, &valuePtr);
    if (v5)
    {
      v6 = v5;
      CFDictionaryAddValue(a1, v5, a3);
      CFRelease(v6);
    }
  }
}

const __CFDictionary *NEGetValueFromIntKeyedDictionary(const __CFDictionary *a1, int a2)
{
  const __CFDictionary *Value;
  CFNumberRef v3;
  CFNumberRef v4;
  int valuePtr;

  Value = a1;
  valuePtr = a2;
  if (a1)
  {
    v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberIntType, &valuePtr);
    if (v3)
    {
      v4 = v3;
      Value = (const __CFDictionary *)CFDictionaryGetValue(Value, v3);
      CFRelease(v4);
    }
    else
    {
      return 0;
    }
  }
  return Value;
}

void NERemoveValueFromIntKeyedDictionary(__CFDictionary *a1, int a2)
{
  CFNumberRef v3;
  CFNumberRef v4;
  int valuePtr;

  valuePtr = a2;
  if (a1)
  {
    v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberIntType, &valuePtr);
    if (v3)
    {
      v4 = v3;
      CFDictionaryRemoveValue(a1, v3);
      CFRelease(v4);
    }
  }
}

NSObject *NERepeatingEventCreate(NSObject *a1, dispatch_time_t a2, uintptr_t a3, uint64_t a4, uint64_t a5, int a6, const void *a7, const void *a8)
{
  _DWORD *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  _QWORD v21[5];
  _QWORD handler[5];

  v16 = malloc_type_calloc(1uLL, 0x20uLL, 0x1080040AA036A7FuLL);
  *(_QWORD *)v16 = a4;
  v16[2] = a6;
  if (a7)
    *((_QWORD *)v16 + 2) = _Block_copy(a7);
  if (a8)
    *((_QWORD *)v16 + 3) = _Block_copy(a8);
  v16[3] = 0;
  v17 = dispatch_source_create(MEMORY[0x24BDACA18], 0, a3, a1);
  v18 = v17;
  if (v17)
  {
    dispatch_set_context(v17, v16);
    dispatch_set_finalizer_f(v18, (dispatch_function_t)repeatingEventFinalizer);
    dispatch_source_set_timer(v18, a2, 1000000 * a4, 1000000 * a5);
    v19 = MEMORY[0x24BDAC760];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 0x40000000;
    handler[2] = __NERepeatingEventCreate_block_invoke;
    handler[3] = &__block_descriptor_tmp_12_339;
    handler[4] = v18;
    dispatch_source_set_event_handler(v18, handler);
    v21[0] = v19;
    v21[1] = 0x40000000;
    v21[2] = __NERepeatingEventCreate_block_invoke_2;
    v21[3] = &__block_descriptor_tmp_13_340;
    v21[4] = v18;
    dispatch_source_set_cancel_handler(v18, v21);
    dispatch_resume(v18);
  }
  else
  {
    free(v16);
  }
  return v18;
}

void repeatingEventFinalizer(_QWORD *a1)
{
  const void *v2;
  const void *v3;

  if (a1)
  {
    v2 = (const void *)a1[2];
    if (v2)
      _Block_release(v2);
    v3 = (const void *)a1[3];
    if (v3)
      _Block_release(v3);
    free(a1);
  }
}

uint64_t NERepeatingEventGetTimesFired(NSObject *a1)
{
  if (a1)
    return *((unsigned int *)dispatch_get_context(a1) + 3);
  else
    return 0xFFFFFFFFLL;
}

NSObject *NERepeatingEventGetIntervalInMilliseconds(NSObject *result)
{
  if (result)
    return *(NSObject **)dispatch_get_context(result);
  return result;
}

void NERepeatingEventRelease(NSObject *a1)
{
  if (a1)
  {
    if (!dispatch_source_testcancel(a1))
      dispatch_source_cancel(a1);
  }
}

NSObject *NECreateTimerSource(dispatch_queue_t queue, uint64_t a2, void *a3)
{
  NSObject *v5;
  dispatch_time_t v6;
  _QWORD handler[5];

  v5 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, queue);
  if (v5)
  {
    v6 = dispatch_time(0, 1000000000 * a2);
    dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_source_set_event_handler(v5, a3);
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 0x40000000;
    handler[2] = __NECreateTimerSource_block_invoke;
    handler[3] = &__block_descriptor_tmp_14;
    handler[4] = v5;
    dispatch_source_set_cancel_handler(v5, handler);
    dispatch_resume(v5);
  }
  return v5;
}

CFDataRef NECreateDataWithEncodedCString(_BYTE *a1, int a2)
{
  int v2;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  UInt8 *v9;
  UInt8 *v10;
  unsigned int v11;
  CFIndex v12;
  int v13;
  unsigned __int8 *v14;
  UInt8 *v15;
  UInt8 v16;
  unsigned int v17;
  CFDataRef v19;
  char __str[3];

  LOBYTE(v2) = *a1;
  if (!*a1)
    return 0;
  v5 = 0;
  v6 = 1;
  v7 = MEMORY[0x24BDAC740];
  do
  {
    if ((v2 & 0x80) != 0)
    {
      if (!__maskrune((char)v2, 0x4000uLL))
        return 0;
    }
    else
    {
      v8 = *(_DWORD *)(v7 + 4 * (char)v2 + 60);
      if ((v8 & 0x10000) != 0)
      {
        ++v5;
      }
      else if ((v8 & 0x4000) == 0)
      {
        return 0;
      }
    }
    v2 = a1[v6++];
  }
  while (v2);
  if (!v5)
    return 0;
  if ((v5 & 1) != 0)
    return 0;
  v9 = (UInt8 *)malloc_type_malloc(v5 >> 1, 0xFF0D70EEuLL);
  if (!v9)
    return 0;
  v10 = v9;
  v11 = *a1;
  if (*a1)
  {
    v12 = 0;
    v13 = 0;
    v14 = a1 + 1;
    v15 = v9;
    do
    {
      if ((v11 & 0x80) == 0 && (*(_DWORD *)(v7 + 4 * v11 + 60) & 0x10000) != 0)
      {
        if (v13)
        {
          __str[1] = v11;
          __str[2] = 0;
          v16 = strtol(__str, 0, a2);
          v13 = 0;
          *v15++ = v16;
          ++v12;
        }
        else
        {
          __str[0] = v11;
          v13 = 1;
        }
      }
      v17 = *v14++;
      v11 = v17;
    }
    while (v17);
  }
  else
  {
    v12 = 0;
  }
  v19 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v10, v12);
  free(v10);
  return v19;
}

const char *NECertificateStatusToString(int a1)
{
  if ((a1 - 1) > 4)
    return "Unknown";
  else
    return off_24C0A12F0[a1 - 1];
}

uint64_t NECertificateDateIsValid(uint64_t a1)
{
  CFAbsoluteTime v1;
  CFAbsoluteTime v2;
  const __CFDate *v3;
  uint64_t v4;
  CFAbsoluteTime v5;
  CFAbsoluteTime v6;
  const __CFDate *v7;
  double Current;
  const __CFDate *v9;
  const __CFDate *v10;
  NSObject *v11;
  NSObject *v13;
  __CFCalendar *v14;
  __CFCalendar *v15;
  NSObject *v16;
  NSObject *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 4;
  SecCertificateNotValidBefore();
  v2 = v1;
  if (v1 == 0.0)
    v3 = 0;
  else
    v3 = CFDateCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v1);
  SecCertificateNotValidAfter();
  v6 = v5;
  if (v5 == 0.0)
    v7 = 0;
  else
    v7 = CFDateCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v5);
  Current = CFAbsoluteTimeGetCurrent();
  if (Current == 0.0)
  {
    v10 = 0;
    goto LABEL_19;
  }
  v9 = CFDateCreate(0, Current);
  v10 = v9;
  if (!v3 || !v9)
  {
LABEL_19:
    v4 = 1;
    if (!v3)
    {
      if (!v7)
        goto LABEL_22;
      goto LABEL_21;
    }
    goto LABEL_35;
  }
  if (CFDateCompare(v9, v3, 0) == kCFCompareLessThan)
  {
    v13 = ne_log_obj();
    v4 = 2;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_208439000, v13, OS_LOG_TYPE_DEBUG, "Current time before valid time", buf, 2u);
    }
  }
  else
  {
    if (!v7 || CFDateCompare(v10, v7, 0) != kCFCompareGreaterThan)
    {
      v4 = 1;
      goto LABEL_35;
    }
    v11 = ne_log_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_208439000, v11, OS_LOG_TYPE_DEBUG, "Current time after valid time", buf, 2u);
    }
    v4 = 3;
  }
  if (nelog_is_info_logging_enabled())
  {
    v19 = 0;
    v20 = 0;
    v18 = 0;
    v14 = CFCalendarCreateWithIdentifier((CFAllocatorRef)*MEMORY[0x24BDBD240], (CFCalendarIdentifier)*MEMORY[0x24BDBD3B8]);
    if (v14)
    {
      v15 = v14;
      CFCalendarDecomposeAbsoluteTime(v14, v2, "yMdHm", (char *)&v20 + 4, &v20, (char *)&v19 + 4, &v19, &v18);
      v16 = ne_log_obj();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67110144;
        v22 = HIDWORD(v20);
        v23 = 1024;
        v24 = v20;
        v25 = 1024;
        v26 = HIDWORD(v19);
        v27 = 1024;
        v28 = v19;
        v29 = 1024;
        v30 = v18;
        _os_log_impl(&dword_208439000, v16, OS_LOG_TYPE_INFO, "Certificate not valid before yr %d, mon %d, days %d, hours %d, min %d\n", buf, 0x20u);
      }
      CFCalendarDecomposeAbsoluteTime(v15, v6, "yMdHm", (char *)&v20 + 4, &v20, (char *)&v19 + 4, &v19, &v18);
      v17 = ne_log_obj();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67110144;
        v22 = HIDWORD(v20);
        v23 = 1024;
        v24 = v20;
        v25 = 1024;
        v26 = HIDWORD(v19);
        v27 = 1024;
        v28 = v19;
        v29 = 1024;
        v30 = v18;
        _os_log_impl(&dword_208439000, v17, OS_LOG_TYPE_INFO, "Certificate not valid after yr %d, mon %d, days %d, hours %d, min %d\n", buf, 0x20u);
      }
      CFRelease(v15);
    }
  }
LABEL_35:
  CFRelease(v3);
  if (v7)
LABEL_21:
    CFRelease(v7);
LABEL_22:
  if (v10)
    CFRelease(v10);
  return v4;
}

BOOL NEIsInterfaceWIFI()
{
  int v0;
  NSObject *v2;
  const char *v3;
  uint8_t *v4;
  uint8_t buf[4];
  const char *v6;
  _OWORD v7[3];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v0 = socket(2, 2, 0);
  if (v0 < 0)
  {
    v2 = ne_log_obj();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    LODWORD(v7[0]) = 136315138;
    *(_QWORD *)((char *)v7 + 4) = "NEIsInterfaceWIFI";
    v3 = "%s: Failed to open socket";
    v4 = (uint8_t *)v7;
LABEL_10:
    _os_log_error_impl(&dword_208439000, v2, OS_LOG_TYPE_ERROR, v3, v4, 0xCu);
    goto LABEL_7;
  }
  memset(v7, 0, 44);
  __strlcpy_chk();
  if (ioctl(v0, 0xC02C6938uLL, v7) != -1)
  {
    close(v0);
    return (v7[1] & 0xE0) == 128;
  }
  v2 = ne_log_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "NEIsInterfaceWIFI";
    v3 = "%s: Failed to get media";
    v4 = buf;
    goto LABEL_10;
  }
LABEL_7:
  close(v0);
  return 0;
}

ifaddrs *NEGetInterfaceType(const char *a1, _BYTE *a2, BOOL *a3)
{
  ifaddrs *v6;
  ifaddrs *v7;
  const char *ifa_name;
  ifaddrs *v10;

  v10 = 0;
  *a2 = 0;
  *a3 = 0;
  v6 = 0;
  if (!getifaddrs(&v10))
  {
    v7 = v10;
    if (v10)
    {
      v6 = v10;
      while (1)
      {
        ifa_name = v6->ifa_name;
        if (ifa_name)
        {
          if (!strcmp(ifa_name, a1))
            break;
        }
        v6 = v6->ifa_next;
        if (!v6)
          goto LABEL_13;
      }
      v6 = (ifaddrs *)v6->ifa_addr->sa_data[2];
      if ((_DWORD)v6 == 255)
      {
        *a2 = 0;
      }
      else if ((_DWORD)v6 == 6)
      {
        *a2 = 1;
        *a3 = NEIsInterfaceWIFI();
        v7 = v10;
      }
    }
    else
    {
      v6 = 0;
    }
LABEL_13:
    MEMORY[0x20BD07CAC](v7);
  }
  return v6;
}

BOOL NEIsInterfaceCellular(const char *a1)
{
  BOOL v2;
  char v3;

  return NEGetInterfaceType(a1, &v3, &v2) == 255;
}

_QWORD *NECopyInterfaceAddress(const char *a1, int a2)
{
  _QWORD *p_ifa_next;
  const char *v5;
  unsigned __int8 *v6;
  const __CFString *v8;
  unint64_t v9;
  unsigned int v10;
  int v11;
  unsigned int v12;
  ifaddrs *v13;

  v13 = 0;
  p_ifa_next = 0;
  if (!getifaddrs(&v13))
  {
    p_ifa_next = &v13->ifa_next;
    if (v13)
    {
      while (1)
      {
        v5 = (const char *)p_ifa_next[1];
        if (v5)
        {
          if (!strcmp(v5, a1))
          {
            v6 = (unsigned __int8 *)p_ifa_next[3];
            if (v6[1] == a2)
            {
              if (a2 == 30)
              {
                v10 = *v6;
                v8 = (const __CFString *)(v6 + 8);
                v9 = v10;
                v11 = 30;
                goto LABEL_13;
              }
              if (a2 == 2)
                break;
            }
          }
        }
        p_ifa_next = (_QWORD *)*p_ifa_next;
        if (!p_ifa_next)
          goto LABEL_9;
      }
      v12 = *v6;
      v8 = (const __CFString *)(v6 + 4);
      v9 = v12;
      v11 = 2;
LABEL_13:
      p_ifa_next = NECreateAddressStringFromBuffer(v8, v9, v11);
    }
LABEL_9:
    MEMORY[0x20BD07CAC](v13);
  }
  return p_ifa_next;
}

uint64_t NEGetInterfaceForAddress(unsigned __int8 *a1)
{
  int v2;
  ifaddrs *v3;
  int v4;
  sockaddr *ifa_addr;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  NSObject *v10;
  int v11;
  NSObject *v12;
  int v14;
  NSObject *v15;
  char *ifa_name;
  ifaddrs *v17;
  uint8_t v18[4];
  _BYTE v19[14];
  __int16 v20;
  uint8_t *v21;
  uint8_t buf[136];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = a1[1];
  if (v2 == 30)
  {
    if (*a1 > 0x1Bu)
      goto LABEL_4;
LABEL_21:
    v10 = ne_log_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_208439000, v10, OS_LOG_TYPE_ERROR, "Address passed to NEGetInterfaceForAddress is too short", buf, 2u);
    }
    return 0;
  }
  if (v2 == 2 && *a1 < 0x10u)
    goto LABEL_21;
LABEL_4:
  v17 = 0;
  if (getifaddrs(&v17) < 0)
  {
    v11 = *__error();
    if (strerror_r(v11, (char *)buf, 0x80uLL))
      buf[0] = 0;
    v12 = ne_log_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v18 = 67109378;
      *(_DWORD *)v19 = v11;
      *(_WORD *)&v19[4] = 2080;
      *(_QWORD *)&v19[6] = buf;
      _os_log_fault_impl(&dword_208439000, v12, OS_LOG_TYPE_FAULT, "getifaddrs failed: [%d] %s", v18, 0x12u);
    }
    return 0;
  }
  v3 = v17;
  if (!v17)
    return 0;
  v4 = a1[1];
  while (1)
  {
    ifa_addr = v3->ifa_addr;
    if (v4 != ifa_addr->sa_family)
      goto LABEL_16;
    if (v4 == 30)
      break;
    if (v4 == 2 && *((_DWORD *)a1 + 1) == *(_DWORD *)&ifa_addr->sa_data[2])
      goto LABEL_29;
LABEL_16:
    v3 = v3->ifa_next;
    if (!v3)
      goto LABEL_17;
  }
  v7 = *(_QWORD *)&ifa_addr->sa_data[6];
  v6 = *(_QWORD *)&ifa_addr[1].sa_len;
  if (*((_QWORD *)a1 + 1) != v7 || *((_QWORD *)a1 + 2) != v6)
    goto LABEL_16;
LABEL_29:
  v9 = if_nametoindex(v3->ifa_name);
  if (!(_DWORD)v9)
  {
    v14 = *__error();
    if (strerror_r(v14, (char *)buf, 0x80uLL))
      buf[0] = 0;
    v15 = ne_log_obj();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      ifa_name = v3->ifa_name;
      *(_DWORD *)v18 = 136315650;
      *(_QWORD *)v19 = ifa_name;
      *(_WORD *)&v19[8] = 1024;
      *(_DWORD *)&v19[10] = v14;
      v20 = 2080;
      v21 = buf;
      _os_log_fault_impl(&dword_208439000, v15, OS_LOG_TYPE_FAULT, "Failed to get an interface index for interface %s: [%d] %s", v18, 0x1Cu);
    }
LABEL_17:
    v9 = 0;
  }
  if (v17)
    MEMORY[0x20BD07CAC]();
  return v9;
}

uint64_t NEIsValidInterface(const char *a1)
{
  uint64_t v2;
  ifaddrs *v3;
  ifaddrs *v4;
  const char *ifa_name;
  ifaddrs *v7;

  v7 = 0;
  if (getifaddrs(&v7))
    return 0;
  v3 = v7;
  if (v7)
  {
    v4 = v7;
    while (1)
    {
      ifa_name = v4->ifa_name;
      if (ifa_name)
      {
        if (!strcmp(ifa_name, a1))
          break;
      }
      v4 = v4->ifa_next;
      if (!v4)
        goto LABEL_8;
    }
    v2 = 1;
  }
  else
  {
LABEL_8:
    v2 = 0;
  }
  MEMORY[0x20BD07CAC](v3);
  return v2;
}

BOOL NEIsWildcardAddress(unsigned __int8 *a1)
{
  int v1;
  _DWORD *v2;

  v1 = a1[1];
  if (v1 == 30)
  {
    if (*a1 >= 0x1Cu && !*((_DWORD *)a1 + 2) && !*((_DWORD *)a1 + 3) && !*((_DWORD *)a1 + 4))
    {
      v2 = a1 + 20;
      return *v2 == 0;
    }
  }
  else if (v1 == 2 && *a1 >= 0x10u)
  {
    v2 = a1 + 4;
    return *v2 == 0;
  }
  return 0;
}

BOOL NEIsLoopbackAddress(unsigned __int8 *a1)
{
  int v1;
  _DWORD *v2;
  int v3;

  v1 = a1[1];
  if (v1 == 30)
  {
    if (*a1 >= 0x1Cu && !*((_DWORD *)a1 + 2) && !*((_DWORD *)a1 + 3) && !*((_DWORD *)a1 + 4))
    {
      v2 = a1 + 20;
      v3 = 0x1000000;
      return *v2 == v3;
    }
  }
  else if (v1 == 2 && *a1 >= 0x10u)
  {
    v2 = a1 + 4;
    v3 = 16777343;
    return *v2 == v3;
  }
  return 0;
}

uint64_t NEGetEntitlement(void *a1)
{
  uint64_t v2;
  size_t count;
  size_t v5;
  size_t v6;
  const char *string;
  const char *v8;
  size_t v9;

  if (a1)
  {
    if (MEMORY[0x20BD087A4]() == MEMORY[0x24BDACF78])
    {
      count = xpc_array_get_count(a1);
      if (count)
      {
        v5 = count;
        v6 = 0;
        v2 = 0;
        while (1)
        {
          string = xpc_array_get_string(a1, v6);
          if (string)
          {
            v8 = string;
            v9 = strlen(string);
            if (strncmp(v8, "packet-tunnel-provider", v9))
            {
              if (!strncmp(v8, "app-proxy-provider", v9))
                goto LABEL_22;
              if (!strncmp(v8, "content-filter-provider", v9))
                goto LABEL_23;
              if (!strncmp(v8, "dns-proxy", v9))
                goto LABEL_24;
              if (!strncmp(v8, "dns-settings", v9))
              {
                v2 = v2 | 0x40;
                goto LABEL_27;
              }
              if (!strncmp(v8, "relay", v9))
              {
                v2 = v2 | 0x80;
                goto LABEL_27;
              }
              if (strncmp(v8, "packet-tunnel-provider-systemextension", v9))
              {
                if (strncmp(v8, "app-proxy-provider-systemextension", v9))
                {
                  if (strncmp(v8, "content-filter-provider-systemextension", v9))
                  {
                    if (strncmp(v8, "dns-proxy-systemextension", v9))
                    {
                      if (!strncmp(v8, "app-push-provider", v9))
                        v2 = v2 | 0x20;
                      else
                        v2 = v2;
                      goto LABEL_27;
                    }
LABEL_24:
                    v2 = v2 | 0x10;
                    goto LABEL_27;
                  }
LABEL_23:
                  v2 = v2 | 4;
                  goto LABEL_27;
                }
LABEL_22:
                v2 = v2 | 2;
                goto LABEL_27;
              }
            }
            v2 = v2 | 1;
          }
LABEL_27:
          if (v5 == ++v6)
            return v2;
        }
      }
    }
  }
  return 0;
}

CFStringRef NECopySynthesizedIPv6Address(const __CFString *a1, int a2)
{
  CFStringRef v4;
  int v5;
  unsigned int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  __CFString v11;
  int v12;
  void *v13;

  v13 = 0;
  v4 = 0;
  if (NEGetAddressFamilyFromString(a1) != 30)
  {
    v12 = a2;
    v5 = nw_nat64_copy_prefixes();
    if (v5 < 1)
    {
      v4 = 0;
      v7 = 0;
    }
    else
    {
      v6 = v5;
      v7 = NECreateAddressStructFromString(a1, 0, 0);
      if (v7)
      {
        v8 = 0;
        v9 = 16 * v6;
        while (1)
        {
          *(_OWORD *)&v11.isa = xmmword_208467120;
          *(_OWORD *)((char *)&v11.info + 4) = *(__int128 *)((char *)&xmmword_208467120 + 12);
          if (nw_nat64_synthesize_v6())
            break;
          v8 += 16;
          if (v9 == v8)
            goto LABEL_7;
        }
        v4 = NECreateAddressString(&v11);
      }
      else
      {
LABEL_7:
        v4 = 0;
      }
    }
    if (v13)
    {
      free(v13);
      v13 = 0;
    }
    if (v7)
      free(v7);
  }
  return v4;
}

const char *inputNotification2String(int a1)
{
  if ((a1 - 1) > 5)
    return "network changed";
  else
    return off_24C0A1318[a1 - 1];
}

void ne_filter_request_connection(os_unfair_lock_s *a1, unsigned int a2, int a3, void (**a4)(_QWORD, _QWORD))
{
  os_unfair_lock_s *v8;
  void *v9;
  os_unfair_lock_s *v10;
  NSObject *v11;
  NSObject **v12;
  NSObject *v13;
  unsigned int v14;
  _QWORD *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  unsigned int v19;
  uint64_t v20;
  NSObject *v21;
  _QWORD block[6];
  unsigned int v23;
  int v24;
  _QWORD v25[7];
  _QWORD v26[8];
  uint8_t buf[4];
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (a4)
  {
    if (a2 < 8)
    {
      v8 = a1 + 1;
      os_unfair_lock_lock(a1 + 1);
      v9 = _Block_copy(a4);
      v10 = &a1[8 * a2];
      v13 = *(NSObject **)&v10[6]._os_unfair_lock_opaque;
      v12 = (NSObject **)&v10[6];
      v11 = v13;
      if (v13)
      {
        do
          v14 = __ldaxr(&a1->_os_unfair_lock_opaque);
        while (__stlxr(v14 + 1, &a1->_os_unfair_lock_opaque));
        dispatch_retain(v11);
        v26[0] = MEMORY[0x24BDAC760];
        v26[1] = 0x40000000;
        v26[2] = __ne_filter_request_connection_block_invoke;
        v26[3] = &unk_24C0A1350;
        v26[4] = v9;
        v26[5] = a1;
        v26[6] = v12 - 2;
        v26[7] = v11;
        v15 = v26;
        v16 = v11;
      }
      else
      {
        v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        v18 = dispatch_queue_create("Filter provider connection waiter queue", v17);
        *v12 = v18;
        dispatch_suspend(v18);
        do
          v19 = __ldaxr(&a1->_os_unfair_lock_opaque);
        while (__stlxr(v19 + 1, &a1->_os_unfair_lock_opaque));
        v20 = MEMORY[0x24BDAC760];
        v25[0] = MEMORY[0x24BDAC760];
        v25[1] = 0x40000000;
        v25[2] = __ne_filter_request_connection_block_invoke_2;
        v25[3] = &unk_24C0A1378;
        v25[5] = a1;
        v25[6] = v12 - 2;
        v25[4] = v9;
        if (ne_filter_connection_queue_onceToken != -1)
          dispatch_once(&ne_filter_connection_queue_onceToken, &__block_literal_global_384);
        v16 = ne_filter_connection_queue_filter_queue;
        block[0] = v20;
        block[1] = 0x40000000;
        block[2] = __ne_filter_request_connection_block_invoke_3;
        block[3] = &unk_24C0A13A0;
        v23 = a2;
        v24 = a3;
        block[4] = v25;
        block[5] = a1;
        v15 = block;
      }
      dispatch_async(v16, v15);
      os_unfair_lock_unlock(v8);
    }
    else
    {
      a4[2](a4, 0);
    }
  }
  else
  {
    v21 = ne_log_obj();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v28 = "ne_filter_request_connection";
      _os_log_fault_impl(&dword_208439000, v21, OS_LOG_TYPE_FAULT, "%s called with null completionHandler", buf, 0xCu);
    }
  }
}

void __ne_filter_request_connection_block_invoke(uint64_t a1)
{
  unsigned int *v2;
  unsigned int v3;
  unsigned int v4;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 4));
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 4));
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 56));
  v2 = *(unsigned int **)(a1 + 40);
  do
  {
    v3 = __ldaxr(v2);
    v4 = v3 - 1;
  }
  while (__stlxr(v4, v2));
  if (!v4)
    free(*(void **)(a1 + 40));
}

void __ne_filter_request_connection_block_invoke_2(uint64_t a1)
{
  unsigned int *v2;
  unsigned int v3;
  unsigned int v4;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 4));
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 48) + 16));
  dispatch_release(*(dispatch_object_t *)(*(_QWORD *)(a1 + 48) + 16));
  *(_QWORD *)(*(_QWORD *)(a1 + 48) + 16) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 4));
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
  v2 = *(unsigned int **)(a1 + 40);
  do
  {
    v3 = __ldaxr(v2);
    v4 = v3 - 1;
  }
  while (__stlxr(v4, v2));
  if (!v4)
    free(*(void **)(a1 + 40));
}

void __ne_filter_request_connection_block_invoke_3(uint64_t a1)
{
  unsigned int v1;
  void (**v2)(_QWORD, _QWORD);
  uint64_t v3;
  uint64_t v4;
  os_unfair_lock_s *v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  unsigned int v9;
  _xpc_connection_s *mach_service;
  xpc_object_t v11;
  void *v12;
  NSObject *v13;
  _xpc_connection_s *v14;
  NSObject *v15;
  _QWORD handler[5];
  __int128 buf;
  void (*v18)(uint64_t, xpc_object_t);
  void *v19;
  void *v20;
  uint64_t v21;
  int v22;
  unsigned int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v1 = *(_DWORD *)(a1 + 48);
  v2 = *(void (***)(_QWORD, _QWORD))(a1 + 32);
  if (v1 >= 8)
  {
    v2[2](*(_QWORD *)(a1 + 32), 0);
    return;
  }
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(unsigned int *)(a1 + 52);
  v5 = (os_unfair_lock_s *)(v3 + 4);
  os_unfair_lock_lock((os_unfair_lock_t)(v3 + 4));
  v6 = MEMORY[0x24BDAC760];
  if (*(_QWORD *)(v3 + 264))
    goto LABEL_12;
  if (get_current_notify_pid())
  {
    getpid();
    v7 = "com.apple.nesessionmanager.content-filter";
    if (sandbox_check())
    {
      v8 = ne_log_obj();
      v7 = "com.apple.nesessionmanager";
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 136315138;
        *(_QWORD *)((char *)&buf + 4) = "com.apple.nesessionmanager";
        _os_log_impl(&dword_208439000, v8, OS_LOG_TYPE_INFO, "Filter falling back to Mach service %s", (uint8_t *)&buf, 0xCu);
      }
    }
    do
      v9 = __ldaxr((unsigned int *)v3);
    while (__stlxr(v9 + 1, (unsigned int *)v3));
    if (ne_filter_connection_queue_onceToken != -1)
      dispatch_once(&ne_filter_connection_queue_onceToken, &__block_literal_global_384);
    mach_service = xpc_connection_create_mach_service(v7, (dispatch_queue_t)ne_filter_connection_queue_filter_queue, 2uLL);
    xpc_connection_set_context(mach_service, (void *)v3);
    handler[0] = v6;
    handler[1] = 0x40000000;
    handler[2] = __ne_filter_request_xpc_connection_block_invoke;
    handler[3] = &__block_descriptor_tmp_20_391;
    handler[4] = mach_service;
    xpc_connection_set_event_handler(mach_service, handler);
    xpc_connection_activate(mach_service);
    *(_QWORD *)(v3 + 264) = mach_service;
LABEL_12:
    v11 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v11, "SessionClientType", 2);
    xpc_dictionary_set_int64(v11, "SessionConfigType", 4);
    xpc_dictionary_set_int64(v11, "command", 1);
    xpc_dictionary_set_uint64(v11, "control-unit", v4);
    v12 = _Block_copy(v2);
    v13 = ne_log_obj();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 67109120;
      DWORD1(buf) = v4;
      _os_log_debug_impl(&dword_208439000, v13, OS_LOG_TYPE_DEBUG, "Filter requesting xpc connection to control unit %u", (uint8_t *)&buf, 8u);
    }
    v14 = *(_xpc_connection_s **)(v3 + 264);
    if (ne_filter_connection_queue_onceToken != -1)
      dispatch_once(&ne_filter_connection_queue_onceToken, &__block_literal_global_384);
    *(_QWORD *)&buf = v6;
    *((_QWORD *)&buf + 1) = 0x40000000;
    v18 = __ne_filter_request_xpc_connection_block_invoke_24;
    v19 = &unk_24C0A1488;
    v22 = v4;
    v23 = v1;
    v20 = v12;
    v21 = v3;
    xpc_connection_send_message_with_reply(v14, v11, (dispatch_queue_t)ne_filter_connection_queue_filter_queue, &buf);
    xpc_release(v11);
    os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 4));
    return;
  }
  v15 = ne_log_obj();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf) = 0;
    _os_log_error_impl(&dword_208439000, v15, OS_LOG_TYPE_ERROR, "Session manager not running, cannot filter", (uint8_t *)&buf, 2u);
  }
  os_unfair_lock_unlock(v5);
  v2[2](v2, 0);
}

void __ne_filter_request_xpc_connection_block_invoke(uint64_t a1, uint64_t a2)
{
  void *context;
  void *v5;
  _xpc_connection_s *v6;
  unsigned int v7;
  unsigned int v8;

  context = xpc_connection_get_context(*(xpc_connection_t *)(a1 + 32));
  if (a2)
  {
    v5 = context;
    if (context)
    {
      if (MEMORY[0x20BD087A4](a2) == MEMORY[0x24BDACFB8])
      {
        xpc_connection_set_context(*(xpc_connection_t *)(a1 + 32), 0);
        os_unfair_lock_lock((os_unfair_lock_t)v5 + 1);
        v6 = (_xpc_connection_s *)*((_QWORD *)v5 + 33);
        if (v6)
        {
          xpc_connection_cancel(v6);
          xpc_release(*((xpc_object_t *)v5 + 33));
          *((_QWORD *)v5 + 33) = 0;
        }
        os_unfair_lock_unlock((os_unfair_lock_t)v5 + 1);
        do
        {
          v7 = __ldaxr((unsigned int *)v5);
          v8 = v7 - 1;
        }
        while (__stlxr(v8, (unsigned int *)v5));
        if (!v8)
          free(v5);
      }
    }
  }
}

void __ne_filter_request_xpc_connection_block_invoke_24(uint64_t a1, xpc_object_t xdict)
{
  _xpc_endpoint_s *value;
  xpc_connection_t v5;
  _xpc_connection_s *v6;
  __int128 *data;
  int64_t int64;
  NSObject *v9;
  int v10;
  const char *v11;
  int v12;
  const char *string;
  const char *v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int *v18;
  unsigned int v19;
  char *inited;
  NSObject *v21;
  const char *v22;
  int v23;
  const char *v24;
  _QWORD handler[6];
  size_t length;
  uint8_t buf[4];
  int v28;
  __int16 v29;
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  length = 0;
  if (xdict && MEMORY[0x20BD087A4](xdict) == MEMORY[0x24BDACFB8])
  {
    v9 = ne_log_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v12 = *(_DWORD *)(a1 + 48);
    string = xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x24BDACF40]);
    *(_DWORD *)buf = 67109378;
    v28 = v12;
    v29 = 2080;
    v30 = string;
    v14 = "Filter got an error on the XPC connection when requesting endpoint to control unit %u: %s";
    goto LABEL_34;
  }
  value = (_xpc_endpoint_s *)xpc_dictionary_get_value(xdict, "new-connection");
  if (!value)
  {
    int64 = xpc_dictionary_get_int64(xdict, "error");
    v9 = ne_log_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    v10 = *(_DWORD *)(a1 + 48);
    if ((unint64_t)(int64 - 1) > 4)
      v11 = "None";
    else
      v11 = off_24C0A14A8[int64 - 1];
    *(_DWORD *)buf = 67109378;
    v28 = v10;
    v29 = 2080;
    v30 = v11;
    v14 = "Filter failed to get endpoint to control unit %u: %s";
LABEL_34:
    _os_log_error_impl(&dword_208439000, v9, OS_LOG_TYPE_ERROR, v14, buf, 0x12u);
    goto LABEL_12;
  }
  v5 = xpc_connection_create_from_endpoint(value);
  if (v5)
  {
    v6 = v5;
    data = (__int128 *)xpc_dictionary_get_data(xdict, "crypto-key", &length);
    goto LABEL_13;
  }
  v15 = xpc_dictionary_get_int64(xdict, "error");
  v9 = ne_log_obj();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v23 = *(_DWORD *)(a1 + 48);
    if ((unint64_t)(v15 - 1) > 4)
      v24 = "None";
    else
      v24 = off_24C0A14A8[v15 - 1];
    *(_DWORD *)buf = 67109378;
    v28 = v23;
    v29 = 2080;
    v30 = v24;
    v14 = "Filter failed to create connection to unit %u: %s";
    goto LABEL_34;
  }
LABEL_12:
  data = 0;
  v6 = 0;
LABEL_13:
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 4));
  v16 = *(_QWORD *)(a1 + 40);
  v17 = *(unsigned int *)(a1 + 52);
  *(_QWORD *)(v16 + 32 * v17 + 8) = v6;
  if (v6)
  {
    v18 = *(unsigned int **)(a1 + 40);
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 + 1, v18));
    if (ne_filter_connection_queue_onceToken != -1)
      dispatch_once(&ne_filter_connection_queue_onceToken, &__block_literal_global_384);
    xpc_connection_set_target_queue(v6, (dispatch_queue_t)ne_filter_connection_queue_filter_queue);
    xpc_connection_set_context(v6, *(void **)(a1 + 40));
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 0x40000000;
    handler[2] = __ne_filter_request_xpc_connection_block_invoke_28;
    handler[3] = &__block_descriptor_tmp_29;
    handler[4] = v6;
    handler[5] = *(_QWORD *)(a1 + 48);
    xpc_connection_set_event_handler(v6, handler);
    xpc_connection_activate(v6);
  }
  if (data && length == 32)
  {
    inited = ne_filter_crypto_init_client(data);
    *(_QWORD *)(v16 + 32 * v17 + 32) = inited;
    if (!inited)
    {
      v21 = ne_log_obj();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v22 = "Filter failed to init client crypto";
LABEL_27:
        _os_log_error_impl(&dword_208439000, v21, OS_LOG_TYPE_ERROR, v22, buf, 2u);
      }
    }
  }
  else
  {
    v21 = ne_log_obj();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v22 = "Filter failed to retrieve client crypto key";
      goto LABEL_27;
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 4));
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
}

void __ne_filter_request_xpc_connection_block_invoke_28(uint64_t a1, void *a2)
{
  char *context;
  char *v5;
  const uint8_t *uuid;
  const unsigned __int8 *v7;
  os_unfair_lock_s *v8;
  uint64_t v9;
  NSObject *v10;
  char *v11;
  _xpc_connection_s *v12;
  xpc_object_t *v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  unsigned int v17;
  unsigned int v18;
  int v19;
  _DWORD v20[2];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  context = (char *)xpc_connection_get_context(*(xpc_connection_t *)(a1 + 32));
  if (context)
  {
    v5 = context;
    if (a2 && MEMORY[0x20BD087A4](a2) == MEMORY[0x24BDACFB8])
    {
      v10 = ne_log_obj();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v19 = *(_DWORD *)(a1 + 40);
        v20[0] = 67109120;
        v20[1] = v19;
        _os_log_error_impl(&dword_208439000, v10, OS_LOG_TYPE_ERROR, "Got an error on the Filter XPC connection to unit %u", (uint8_t *)v20, 8u);
      }
      xpc_connection_set_context(*(xpc_connection_t *)(a1 + 32), 0);
      os_unfair_lock_lock((os_unfair_lock_t)v5 + 1);
      v11 = &v5[32 * *(unsigned int *)(a1 + 44)];
      v13 = (xpc_object_t *)(v11 + 8);
      v12 = (_xpc_connection_s *)*((_QWORD *)v11 + 1);
      if (v12)
      {
        xpc_connection_cancel(v12);
        xpc_release(*v13);
        *v13 = 0;
      }
      v16 = (void *)*((_QWORD *)v11 + 4);
      v15 = v11 + 32;
      v14 = v16;
      if (v16)
      {
        free(v14);
        *v15 = 0;
      }
      os_unfair_lock_unlock((os_unfair_lock_t)v5 + 1);
      do
      {
        v17 = __ldaxr((unsigned int *)v5);
        v18 = v17 - 1;
      }
      while (__stlxr(v18, (unsigned int *)v5));
      if (!v18)
        free(v5);
    }
    else
    {
      uuid = xpc_dictionary_get_uuid(a2, "flow-uuid");
      if (uuid)
      {
        v7 = uuid;
        v8 = (os_unfair_lock_s *)(v5 + 4);
        os_unfair_lock_lock((os_unfair_lock_t)v5 + 1);
        v9 = *((_QWORD *)v5 + 34);
        if (v9)
        {
          while (uuid_compare(v7, (const unsigned __int8 *)v9))
          {
            v9 = *(_QWORD *)(v9 + 184);
            if (!v9)
              goto LABEL_8;
          }
          ne_filter_protocol_retain(v9);
          os_unfair_lock_unlock(v8);
          ne_filter_protocol_handle_message(v9, a2);
          ne_filter_protocol_release(v9);
        }
        else
        {
LABEL_8:
          os_unfair_lock_unlock(v8);
        }
      }
    }
  }
}

dispatch_queue_t __ne_filter_connection_queue_block_invoke()
{
  NSObject *v0;
  dispatch_queue_t result;

  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  result = dispatch_queue_create("ne.filter", v0);
  ne_filter_connection_queue_filter_queue = (uint64_t)result;
  return result;
}

uint64_t ne_filter_copy_connection(os_unfair_lock_s *a1, unsigned int a2)
{
  uint64_t v2;
  os_unfair_lock_s *v5;
  os_unfair_lock_s *v6;

  if (a2 > 7)
    return 0;
  v5 = a1 + 1;
  os_unfair_lock_lock(a1 + 1);
  v6 = &a1[8 * a2];
  v2 = *(_QWORD *)&v6[2]._os_unfair_lock_opaque;
  if (v2)
    xpc_retain(*(xpc_object_t *)&v6[2]._os_unfair_lock_opaque);
  os_unfair_lock_unlock(v5);
  return v2;
}

BOOL ne_filter_sign_data(os_unfair_lock_s *a1, unsigned int a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, int a7, uint64_t a8, int a9, uint64_t a10, _DWORD *a11)
{
  _BOOL8 v11;
  os_unfair_lock_s *v20;
  uint64_t *v21;

  v11 = 0;
  if (a1 && a2 <= 7)
  {
    v20 = a1 + 1;
    os_unfair_lock_lock(a1 + 1);
    v21 = *(uint64_t **)&a1[8 * a2 + 8]._os_unfair_lock_opaque;
    if (v21)
      v11 = ne_filter_crypto_sign_data(v21, a3, a4, a5, a6, a7, a8, a9, a10, a11) == 0;
    else
      v11 = 1;
    os_unfair_lock_unlock(v20);
  }
  return v11;
}

void ne_filter_send_message(os_unfair_lock_s *a1, unsigned int a2, void *a3, void *a4)
{
  _xpc_connection_s *v6;
  _xpc_connection_s *v7;

  v6 = (_xpc_connection_s *)ne_filter_copy_connection(a1, a2);
  if (v6)
  {
    v7 = v6;
    if (a4)
    {
      if (ne_filter_connection_queue_onceToken != -1)
        dispatch_once(&ne_filter_connection_queue_onceToken, &__block_literal_global_384);
      xpc_connection_send_message_with_reply(v7, a3, (dispatch_queue_t)ne_filter_connection_queue_filter_queue, a4);
    }
    else
    {
      xpc_connection_send_message(v6, a3);
    }
    xpc_release(v7);
  }
}

uint64_t ne_filter_stats_init(uint64_t a1)
{
  NSObject *v2;
  dispatch_queue_t v3;
  uint64_t result;
  unint64_t v5;
  mach_timebase_info info;

  *(_DWORD *)(a1 + 288) = 0;
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = dispatch_queue_create("Filter stats reporting queue", v2);
  *(_QWORD *)(a1 + 312) = 0;
  *(_QWORD *)(a1 + 320) = v3;
  *(_QWORD *)(a1 + 296) = 0;
  *(_QWORD *)(a1 + 304) = a1 + 296;
  info = 0;
  result = mach_timebase_info(&info);
  v5 = 1000000;
  if (!(_DWORD)result && info.numer && info.denom)
    v5 = (unint64_t)((1000000000
                           * (unint64_t)info.denom
                           / info.numer
                           * (unsigned __int128)0x20C49BA5E353F7CFuLL) >> 64) >> 7;
  *(_QWORD *)(a1 + 328) = v5;
  return result;
}

_OWORD *ne_filter_allocate_globals()
{
  _OWORD *v0;
  _OWORD *v1;
  unsigned int v2;

  v0 = malloc_type_malloc(0x150uLL, 0x10A00403A9E6ACAuLL);
  v1 = v0;
  if (v0)
  {
    v0[19] = 0u;
    v0[20] = 0u;
    v0[17] = 0u;
    v0[18] = 0u;
    v0[15] = 0u;
    v0[16] = 0u;
    v0[13] = 0u;
    v0[14] = 0u;
    v0[11] = 0u;
    v0[12] = 0u;
    v0[9] = 0u;
    v0[10] = 0u;
    v0[7] = 0u;
    v0[8] = 0u;
    v0[5] = 0u;
    v0[6] = 0u;
    v0[3] = 0u;
    v0[4] = 0u;
    v0[1] = 0u;
    v0[2] = 0u;
    *v0 = 0u;
    do
      v2 = __ldaxr((unsigned int *)v0);
    while (__stlxr(v2 + 1, (unsigned int *)v0));
    *((_QWORD *)v0 + 34) = 0;
    *((_QWORD *)v0 + 35) = v0 + 17;
    ne_filter_stats_init((uint64_t)v0);
  }
  return v1;
}

void ne_filter_deallocate_globals(uint64_t a1, uint64_t a2)
{
  os_unfair_lock_s *v3;
  NSObject *v4;
  unsigned int v5;
  unsigned int v6;

  v3 = (os_unfair_lock_s *)(a2 + 288);
  os_unfair_lock_lock((os_unfair_lock_t)(a2 + 288));
  dispatch_release(*(dispatch_object_t *)(a2 + 320));
  v4 = *(NSObject **)(a2 + 312);
  if (v4)
  {
    dispatch_source_cancel(v4);
    dispatch_release(*(dispatch_object_t *)(a2 + 312));
    *(_QWORD *)(a2 + 312) = 0;
  }
  os_unfair_lock_unlock(v3);
  do
  {
    v5 = __ldaxr((unsigned int *)a2);
    v6 = v5 - 1;
  }
  while (__stlxr(v6, (unsigned int *)a2));
  if (!v6)
    free((void *)a2);
}

void *ne_filter_set_test_provider_factory(void *result)
{
  if (result)
  {
    result = _Block_copy(result);
    g_testProviderFactory = (uint64_t)result;
  }
  return result;
}

void ne_filter_register_flow(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  os_unfair_lock_s *v4;
  uint64_t v5;
  _QWORD *v6;

  v3 = *(_QWORD *)(a2 + 40);
  v4 = (os_unfair_lock_s *)(a1 + 4);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 4));
  v5 = *(_QWORD *)(a1 + 272);
  *(_QWORD *)(v3 + 184) = v5;
  if (v5)
    v6 = (_QWORD *)(v5 + 192);
  else
    v6 = (_QWORD *)(a1 + 280);
  *v6 = v3 + 184;
  *(_QWORD *)(a1 + 272) = v3;
  *(_QWORD *)(v3 + 192) = a1 + 272;
  *(_DWORD *)(v3 + 120) |= 0x10000u;
  os_unfair_lock_unlock(v4);
}

void ne_filter_unregister_flow(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  os_unfair_lock_s *v4;
  uint64_t v5;
  _QWORD *v6;

  v2 = *(_QWORD *)(a2 + 40);
  if ((*(_BYTE *)(v2 + 122) & 1) != 0)
  {
    v4 = (os_unfair_lock_s *)(a1 + 4);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 4));
    v5 = *(_QWORD *)(v2 + 184);
    v6 = *(_QWORD **)(v2 + 192);
    if (v5)
    {
      *(_QWORD *)(v5 + 192) = v6;
      v6 = *(_QWORD **)(v2 + 192);
    }
    else
    {
      *(_QWORD *)(a1 + 280) = v6;
    }
    *v6 = v5;
    *(_DWORD *)(v2 + 120) &= ~0x10000u;
    os_unfair_lock_unlock(v4);
  }
}

void ne_filter_stats_report(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  xpc_object_t v9;
  xpc_object_t v10;
  void *v11;
  NSObject *v12;
  const sockaddr *address;
  NSObject *v14;
  int v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  uint64_t i;
  void *v22;
  xpc_object_t v23;
  NSObject *v24;
  size_t count;
  uint8_t buf[4];
  int v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  unint64_t v35;
  _OWORD v36[4];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  memset(v36, 0, sizeof(v36));
  v2 = mach_absolute_time();
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
  v3 = *(_QWORD *)(a1 + 296);
  if (!v3)
    goto LABEL_29;
  do
  {
    v4 = *(_QWORD *)(v3 + 144);
    if (!v4)
      goto LABEL_25;
    while (1)
    {
      v5 = atomic_load((unint64_t *)(v3 + 104));
      v6 = atomic_load((unint64_t *)(v3 + 112));
      v7 = *(unsigned int *)(v4 + 4);
      if (v7 > 7)
        goto LABEL_20;
      if (!*(_QWORD *)(v4 + 80))
        goto LABEL_20;
      v8 = (v2 - *(_QWORD *)(v4 + 136)) / *(_QWORD *)(a1 + 328);
      if (v8 <= (unint64_t)((double)*(unint64_t *)(v4 + 80) * 0.95)
        || *(_QWORD *)(v4 + 120) >= v5 && *(_QWORD *)(v4 + 128) >= v6)
      {
        goto LABEL_20;
      }
      if (!*((_QWORD *)v36 + v7))
        break;
LABEL_11:
      v10 = xpc_dictionary_create(0, 0, 0);
      if (!v10)
      {
        v17 = ne_log_obj();
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          goto LABEL_25;
        *(_WORD *)buf = 0;
        v18 = v17;
        v19 = "Stats Report - failed to create xpc dictionary for stats message";
        goto LABEL_28;
      }
      v11 = v10;
      xpc_dictionary_set_uuid(v10, "flow-uuid", (const unsigned __int8 *)v3);
      xpc_dictionary_set_uint64(v11, "byte-count-inbound", v5);
      xpc_dictionary_set_uint64(v11, "byte-count-outbound", v6);
      if ((*(_WORD *)(v4 + 144) & 0x100) == 0)
      {
        v12 = *(NSObject **)(v3 + 64);
        if (v12)
        {
          if (nw_endpoint_get_type(v12) == nw_endpoint_type_address)
          {
            address = nw_endpoint_get_address(*(nw_endpoint_t *)(v3 + 64));
            if (address)
            {
              xpc_dictionary_set_data(v11, "local-addr", address, address->sa_len);
              *(_WORD *)(v4 + 144) |= 0x100u;
            }
          }
        }
      }
      xpc_array_append_value(*((xpc_object_t *)v36 + *(unsigned int *)(v4 + 4)), v11);
      xpc_release(v11);
      v14 = ne_log_obj();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        v15 = *(_DWORD *)(v4 + 4);
        v16 = *(_QWORD *)(v4 + 136);
        *(_DWORD *)buf = 67110144;
        v27 = v15;
        v28 = 2048;
        v29 = v5;
        v30 = 2048;
        v31 = v6;
        v32 = 2048;
        v33 = v16;
        v34 = 2048;
        v35 = v8;
        _os_log_debug_impl(&dword_208439000, v14, OS_LOG_TYPE_DEBUG, "Stats Report collected (client %d) - in %llu out %llu (client ts %llu - elapsed msecs %llu)", buf, 0x30u);
      }
      *(_QWORD *)(v4 + 120) = v5;
      *(_QWORD *)(v4 + 128) = v6;
      *(_QWORD *)(v4 + 136) = mach_absolute_time();
LABEL_20:
      v4 = *(_QWORD *)(v4 + 152);
      if (!v4)
        goto LABEL_25;
    }
    v9 = xpc_array_create(0, 0);
    if (v9)
    {
      *((_QWORD *)v36 + *(unsigned int *)(v4 + 4)) = v9;
      goto LABEL_11;
    }
    v20 = ne_log_obj();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      goto LABEL_25;
    *(_WORD *)buf = 0;
    v18 = v20;
    v19 = "Stats Report - failed to create xpc array for stats message";
LABEL_28:
    _os_log_error_impl(&dword_208439000, v18, OS_LOG_TYPE_ERROR, v19, buf, 2u);
LABEL_25:
    v3 = *(_QWORD *)(v3 + 200);
  }
  while (v3);
LABEL_29:
  for (i = 0; i != 8; ++i)
  {
    v22 = (void *)*((_QWORD *)v36 + i);
    if (v22)
    {
      v23 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_int64(v23, "command", 12);
      xpc_dictionary_set_value(v23, "stats-report-statistics", v22);
      ne_filter_send_message((os_unfair_lock_s *)a1, i, v23, 0);
      v24 = ne_log_obj();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        count = xpc_array_get_count(v22);
        *(_DWORD *)buf = 67109376;
        v27 = i;
        v28 = 2048;
        v29 = count;
        _os_log_debug_impl(&dword_208439000, v24, OS_LOG_TYPE_DEBUG, "Stats Report (client %d) - reported %zu stats", buf, 0x12u);
      }
      xpc_release(v23);
      xpc_release(v22);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
}

uint64_t ne_filter_stats_report_register(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  os_unfair_lock_s *v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  _QWORD *v8;
  NSObject *v9;
  dispatch_source_t v10;
  unsigned int v11;
  NSObject *v12;
  dispatch_time_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  _QWORD v19[5];
  _QWORD handler[5];
  uint8_t buf[16];

  v3 = *(_QWORD *)(a2 + 40);
  v4 = (os_unfair_lock_s *)(a1 + 288);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
  v5 = *(_QWORD *)(a1 + 296);
  if (!v5)
    goto LABEL_6;
  v6 = 0;
  do
  {
    v6 |= v5 == v3;
    v5 = *(_QWORD *)(v5 + 200);
  }
  while (v5);
  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
LABEL_6:
    *(_QWORD *)(v3 + 200) = 0;
    v8 = *(_QWORD **)(a1 + 304);
    *(_QWORD *)(v3 + 208) = v8;
    *v8 = v3;
    *(_QWORD *)(a1 + 304) = v3 + 200;
    v9 = ne_log_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_208439000, v9, OS_LOG_TYPE_DEBUG, "Stats toggle - INSERTED flow", buf, 2u);
    }
    v7 = 1;
  }
  if (*(_QWORD *)(a1 + 296) && !*(_QWORD *)(a1 + 312))
  {
    v10 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, *(dispatch_queue_t *)(a1 + 320));
    *(_QWORD *)(a1 + 312) = v10;
    if (v10)
    {
      do
        v11 = __ldaxr((unsigned int *)a1);
      while (__stlxr(v11 + 1, (unsigned int *)a1));
      v12 = *(NSObject **)(a1 + 312);
      v13 = dispatch_time(0, 200000000);
      dispatch_source_set_timer(v12, v13, 0xBEBC200uLL, 0);
      v14 = MEMORY[0x24BDAC760];
      v15 = *(NSObject **)(a1 + 312);
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 0x40000000;
      handler[2] = __ne_filter_stats_report_register_block_invoke;
      handler[3] = &__block_descriptor_tmp_12_428;
      handler[4] = a1;
      dispatch_source_set_event_handler(v15, handler);
      v16 = *(NSObject **)(a1 + 312);
      v19[0] = v14;
      v19[1] = 0x40000000;
      v19[2] = __ne_filter_stats_report_register_block_invoke_2;
      v19[3] = &__block_descriptor_tmp_13_429;
      v19[4] = a1;
      dispatch_source_set_cancel_handler(v16, v19);
      dispatch_activate(*(dispatch_object_t *)(a1 + 312));
    }
    else
    {
      v17 = ne_log_obj();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_208439000, v17, OS_LOG_TYPE_ERROR, "ne_filter_stats_report_register - dispatch_source_create failed", buf, 2u);
      }
    }
  }
  os_unfair_lock_unlock(v4);
  return v7;
}

void __ne_filter_stats_report_register_block_invoke(uint64_t a1)
{
  ne_filter_stats_report(*(_QWORD *)(a1 + 32));
}

void __ne_filter_stats_report_register_block_invoke_2(uint64_t a1)
{
  unsigned int *v1;
  unsigned int v2;
  unsigned int v3;

  v1 = *(unsigned int **)(a1 + 32);
  do
  {
    v2 = __ldaxr(v1);
    v3 = v2 - 1;
  }
  while (__stlxr(v3, v1));
  if (!v3)
    free(*(void **)(a1 + 32));
}

uint64_t ne_filter_stats_report_unregister(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  os_unfair_lock_s *v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  _QWORD *v8;
  NSObject *v9;
  NSObject *v10;
  uint8_t v12[16];

  v3 = *(_QWORD *)(a2 + 40);
  v4 = (os_unfair_lock_s *)(a1 + 288);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
  v5 = *(_QWORD *)(a1 + 296);
  if (v5)
  {
    v6 = 0;
    do
    {
      v6 |= v5 == v3;
      v5 = *(_QWORD *)(v5 + 200);
    }
    while (v5);
    if ((v6 & 1) != 0)
    {
      v7 = *(_QWORD *)(v3 + 200);
      v8 = *(_QWORD **)(v3 + 208);
      if (v7)
      {
        *(_QWORD *)(v7 + 208) = v8;
        v8 = *(_QWORD **)(v3 + 208);
      }
      else
      {
        *(_QWORD *)(a1 + 304) = v8;
      }
      *v8 = v7;
      v9 = ne_log_obj();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v12 = 0;
        _os_log_debug_impl(&dword_208439000, v9, OS_LOG_TYPE_DEBUG, "Stats toggle - REMOVED flow", v12, 2u);
      }
    }
    if (!*(_QWORD *)(a1 + 296))
    {
      v10 = *(NSObject **)(a1 + 312);
      if (v10)
      {
        dispatch_source_cancel(v10);
        dispatch_release(*(dispatch_object_t *)(a1 + 312));
        *(_QWORD *)(a1 + 312) = 0;
      }
    }
  }
  else
  {
    v6 = 0;
  }
  os_unfair_lock_unlock(v4);
  return v6 & 1;
}

uint64_t ne_filter_get_definition()
{
  if (ne_filter_get_definition_onceToken != -1)
    dispatch_once(&ne_filter_get_definition_onceToken, &__block_literal_global_432);
  return ne_filter_get_definition_filter_definition;
}

uint64_t __ne_filter_get_definition_block_invoke()
{
  if (ne_filter_protocol_identifier_onceToken != -1)
    dispatch_once(&ne_filter_protocol_identifier_onceToken, &__block_literal_global_2);
  ne_filter_get_definition_filter_definition = nw_protocol_definition_create_with_identifier();
  return nw_protocol_definition_set_globals_allocator();
}

uint64_t __ne_filter_protocol_identifier_block_invoke()
{
  ne_filter_protocol_identifier_g_hasNESMAccess = 1;
  g_filter_protocol_identifier = 0u;
  unk_253D8F3BC = 0u;
  qword_253D8F3CC = 0;
  g_filter_protocol_callbacks = 0u;
  *(_OWORD *)algn_25453C4F8 = 0u;
  xmmword_25453C508 = 0u;
  xmmword_25453C518 = 0u;
  xmmword_25453C528 = 0u;
  *(_OWORD *)&qword_25453C538 = 0u;
  xmmword_25453C548 = 0u;
  unk_25453C558 = 0u;
  xmmword_25453C568 = 0u;
  unk_25453C578 = 0u;
  xmmword_25453C588 = 0u;
  unk_25453C598 = 0u;
  xmmword_25453C5A8 = 0u;
  unk_25453C5B8 = 0u;
  xmmword_25453C5C8 = 0u;
  unk_25453C5D8 = 0u;
  xmmword_25453C5E8 = 0u;
  __strlcpy_chk();
  qword_253D8F3CC = 0x100000002;
  nw_protocol_set_default_one_to_one_callbacks();
  *(_QWORD *)&g_filter_protocol_callbacks = ne_filter_protocol_add_input_handler;
  *((_QWORD *)&g_filter_protocol_callbacks + 1) = ne_filter_protocol_remove_input_handler;
  qword_25453C538 = (uint64_t)ne_filter_protocol_get_input_frames;
  unk_25453C540 = ne_filter_protocol_get_output_frames;
  *(_QWORD *)&xmmword_25453C548 = ne_filter_protocol_finalize_output_frames;
  *(_QWORD *)&xmmword_25453C528 = ne_filter_protocol_input_available;
  *((_QWORD *)&xmmword_25453C528 + 1) = ne_filter_protocol_output_available;
  qword_25453C5A0 = (uint64_t)ne_filter_protocol_input_finished;
  *(_QWORD *)&xmmword_25453C5A8 = ne_filter_protocol_output_finished;
  qword_25453C500 = (uint64_t)ne_filter_protocol_connect;
  *(_QWORD *)&xmmword_25453C508 = ne_filter_protocol_disconnect;
  *((_QWORD *)&xmmword_25453C508 + 1) = ne_filter_protocol_connected;
  *(_QWORD *)&xmmword_25453C518 = ne_filter_protocol_disconnected;
  *(_QWORD *)&xmmword_25453C5E8 = nw_filter_protocol_reset;
  return nw_protocol_register();
}

BOOL ne_filter_protocol_add_input_handler(uint64_t a1, unsigned __int8 *src)
{
  uint64_t v3;
  unsigned int *v5;
  unsigned int v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  _BOOL8 result;
  const char *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t globals_for_protocol;
  int filter_unit;
  int v24;
  int v25;
  char *v26;
  char *v27;
  _QWORD *v28;
  _QWORD *v29;
  NSObject *v30;
  uint64_t v31;
  unsigned int *v32;
  unsigned int v33;
  unsigned int v34;
  NSObject *v35;
  uint64_t v36;
  void (*i)(_QWORD, _QWORD);
  void *v38;
  os_unfair_lock_s *v39;
  unsigned int v40;
  int v41;
  unsigned int v42;
  NSObject *v43;
  NSObject *v44;
  uint64_t v45;
  unsigned int *v46;
  unsigned int v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  _QWORD *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  NSObject *v58;
  uint32_t v59;
  _QWORD block[7];
  dispatch_queue_t v61;
  NSObject *v62;
  void (*v63[6])(_QWORD, _QWORD);
  _BYTE buf[28];
  __int16 v65;
  uint64_t v66;
  __int16 v67;
  uint64_t v68;
  __int16 v69;
  uint64_t v70;
  __int16 v71;
  uint64_t v72;
  __int16 v73;
  uint64_t v74;
  __int16 v75;
  uint64_t v76;
  __int16 v77;
  uint64_t v78;
  char out[40];
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    v16 = ne_log_obj();
    result = os_log_type_enabled(v16, OS_LOG_TYPE_FAULT);
    if (!result)
      return result;
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "ne_filter_protocol_add_input_handler";
    v18 = "%s called with null protocol";
    goto LABEL_18;
  }
  v3 = *(_QWORD *)(a1 + 40);
  if (!v3)
  {
    v16 = ne_log_obj();
    result = os_log_type_enabled(v16, OS_LOG_TYPE_FAULT);
    if (!result)
      return result;
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "ne_filter_protocol_add_input_handler";
    v18 = "%s called with null filter";
LABEL_18:
    _os_log_fault_impl(&dword_208439000, v16, OS_LOG_TYPE_FAULT, v18, buf, 0xCu);
    return 0;
  }
  v5 = (unsigned int *)(v3 + 180);
  do
    v6 = __ldaxr(v5);
  while (__stlxr(v6, v5));
  if (!v6)
    return 0;
  *(_QWORD *)(a1 + 48) = src;
  uuid_copy((unsigned __int8 *)v3, src);
  *((_QWORD *)src + 4) = v3;
  if ((*(uint64_t (**)(unsigned __int8 *))(*((_QWORD *)src + 3) + 112))(src)
    && nw_parameters_get_data_mode() == 1)
  {
    memset(out, 0, 37);
    uuid_unparse((const unsigned __int8 *)v3, out);
    v7 = *(_DWORD *)(v3 + 176);
    v8 = ne_log_obj();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
    if (v7 == 3)
    {
      if (v9)
      {
        v10 = *(_QWORD *)(v3 + 80);
        if (v10)
          LODWORD(v10) = nw_parameters_get_ip_protocol();
        v11 = *(_QWORD **)(v3 + 160);
        if (v11)
        {
          v13 = v11[6];
          v14 = v11[7];
          v12 = v11[8];
          v15 = v11[9];
        }
        else
        {
          v12 = -1;
          v13 = -1;
          v14 = -1;
          v15 = -1;
        }
        v52 = *(_QWORD **)(v3 + 168);
        if (v52)
        {
          v54 = v52[6];
          v55 = v52[7];
          v53 = v52[8];
          v56 = v52[9];
        }
        else
        {
          v53 = -1;
          v54 = -1;
          v55 = -1;
          v56 = -1;
        }
        *(_DWORD *)buf = 136317442;
        *(_QWORD *)&buf[4] = out;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v10;
        *(_WORD *)&buf[18] = 2048;
        *(_QWORD *)&buf[20] = v13;
        v65 = 2048;
        v66 = v14;
        v67 = 2048;
        v68 = v12;
        v69 = 2048;
        v70 = v15;
        v71 = 2048;
        v72 = v54;
        v73 = 2048;
        v74 = v55;
        v75 = 2048;
        v76 = v53;
        v77 = 2048;
        v78 = v56;
        v57 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]detected data"
              "gram connection, frame fragmentation disabled";
        v58 = v8;
        v59 = 98;
LABEL_78:
        _os_log_debug_impl(&dword_208439000, v58, OS_LOG_TYPE_DEBUG, v57, buf, v59);
      }
    }
    else if (v9)
    {
      v49 = *(_QWORD *)(v3 + 80);
      if (v49)
        LODWORD(v49) = nw_parameters_get_ip_protocol();
      v50 = *(unsigned int *)(v3 + 176);
      if (v50 > 3)
        v51 = "unknown";
      else
        v51 = (&off_24C0A1818)[v50];
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = out;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v49;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = v51;
      v57 = "[filter %s %d %s] detected datagram connection, frame fragmentation disabled";
      v58 = v8;
      v59 = 28;
      goto LABEL_78;
    }
    *(_DWORD *)(v3 + 120) |= 0x8000u;
  }
  v19 = (void *)(*(uint64_t (**)(unsigned __int8 *))(*((_QWORD *)src + 3) + 128))(src);
  *(_QWORD *)(v3 + 64) = nw_retain(v19);
  v20 = (void *)(*(uint64_t (**)(unsigned __int8 *))(*((_QWORD *)src + 3) + 136))(src);
  *(_QWORD *)(v3 + 72) = nw_retain(v20);
  v21 = (void *)(*(uint64_t (**)(unsigned __int8 *))(*((_QWORD *)src + 3) + 112))(src);
  *(_QWORD *)(v3 + 80) = nw_retain(v21);
  *(_QWORD *)(v3 + 88) = nw_parameters_copy_context();
  if (ne_filter_get_definition_onceToken != -1)
    dispatch_once(&ne_filter_get_definition_onceToken, &__block_literal_global_432);
  globals_for_protocol = nw_context_get_globals_for_protocol();
  *(_QWORD *)(v3 + 96) = globals_for_protocol;
  if (globals_for_protocol)
  {
    (*(void (**)(unsigned __int8 *))(*((_QWORD *)src + 3) + 120))(src);
    filter_unit = nw_path_get_filter_unit();
    if (!filter_unit)
    {
      *(_DWORD *)(v3 + 176) = 1;
LABEL_40:
      ne_filter_register_flow(*(_QWORD *)(v3 + 96), a1);
      result = 1;
      if (*(_QWORD *)(v3 + 144))
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2000000000;
        buf[24] = 1;
        v35 = dispatch_group_create();
        v36 = *(_QWORD *)(v3 + 144);
        for (i = (void (*)(_QWORD, _QWORD))MEMORY[0x24BDAC760]; v36; v36 = *(_QWORD *)(v36 + 152))
        {
          v38 = (void *)ne_filter_copy_connection(*(os_unfair_lock_s **)(v3 + 96), *(_DWORD *)(v36 + 4));
          if (v38)
          {
            xpc_release(v38);
          }
          else
          {
            *(_DWORD *)(v3 + 120) |= 2u;
            dispatch_group_enter(v35);
            v39 = *(os_unfair_lock_s **)(v3 + 96);
            v41 = *(_DWORD *)v36;
            v40 = *(_DWORD *)(v36 + 4);
            v63[0] = i;
            v63[1] = (void (*)(_QWORD, _QWORD))0x40000000;
            v63[2] = (void (*)(_QWORD, _QWORD))__ne_filter_protocol_add_input_handler_block_invoke;
            v63[3] = (void (*)(_QWORD, _QWORD))&unk_24C0A1578;
            v63[4] = (void (*)(_QWORD, _QWORD))buf;
            v63[5] = (void (*)(_QWORD, _QWORD))v35;
            ne_filter_request_connection(v39, v40, v41, v63);
          }
        }
        if ((*(_BYTE *)(v3 + 120) & 2) != 0)
        {
          do
            v42 = __ldaxr(v5);
          while (__stlxr(v42 + 1, v5));
          v43 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
          block[0] = i;
          block[1] = 0x40000000;
          block[2] = __ne_filter_protocol_add_input_handler_block_invoke_2;
          block[3] = &unk_24C0A15C8;
          block[4] = buf;
          block[5] = v3;
          block[6] = a1;
          v61 = dispatch_queue_create("Filter establish connections queue", v43);
          v62 = v35;
          dispatch_group_notify(v35, v61, block);
        }
        else
        {
          dispatch_release(v35);
        }
        _Block_object_dispose(buf, 8);
        return 1;
      }
      return result;
    }
    v24 = filter_unit;
    v25 = 0;
    while (1)
    {
      if (((1 << v25) & v24) != 0)
      {
        v26 = (char *)malloc_type_malloc(0xA8uLL, 0x10A00400F97642BuLL);
        if (!v26)
        {
          v44 = ne_log_obj();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = v25 + 1;
            _os_log_error_impl(&dword_208439000, v44, OS_LOG_TYPE_ERROR, "Failed to allocate a ne_filter_client_t for unit %u", buf, 8u);
          }
          *(_DWORD *)(v3 + 176) = 2;
          v45 = *(_QWORD *)(a1 + 40);
          if (v45)
          {
            v46 = (unsigned int *)(v45 + 180);
            do
              v47 = __ldaxr(v46);
            while (__stlxr(v47, v46));
            if (v47)
            {
              do
                v34 = __ldaxr(v46);
              while (__stlxr(v34 - 1, v46));
LABEL_58:
              if (v34 == 1)
                ne_filter_protocol_destroy(a1);
            }
            return 0;
          }
          v48 = ne_log_obj();
          result = os_log_type_enabled(v48, OS_LOG_TYPE_INFO);
          if (result)
          {
            *(_WORD *)buf = 0;
            goto LABEL_64;
          }
          return result;
        }
        v27 = v26;
        *(_OWORD *)(v26 + 136) = 0u;
        *(_OWORD *)(v26 + 120) = 0u;
        *(_OWORD *)(v26 + 104) = 0u;
        *(_OWORD *)(v26 + 88) = 0u;
        *(_OWORD *)(v26 + 72) = 0u;
        *(_OWORD *)(v26 + 56) = 0u;
        *(_OWORD *)(v26 + 152) = 0u;
        v28 = v26 + 152;
        *(_OWORD *)(v26 + 24) = 0u;
        *(_OWORD *)(v26 + 40) = 0u;
        *(_OWORD *)(v26 + 8) = 0u;
        *(_DWORD *)v26 = 1 << v25;
        *((_DWORD *)v26 + 1) = v25;
        nw_frame_array_init();
        nw_frame_array_init();
        *v28 = 0;
        v29 = *(_QWORD **)(v3 + 152);
        *((_QWORD *)v27 + 20) = v29;
        *v29 = v27;
        *(_QWORD *)(v3 + 152) = v28;
      }
      if (++v25 == 8)
        goto LABEL_40;
    }
  }
  v30 = ne_log_obj();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_208439000, v30, OS_LOG_TYPE_ERROR, "Failed to get the ne_filter globals", buf, 2u);
  }
  v31 = *(_QWORD *)(a1 + 40);
  if (v31)
  {
    v32 = (unsigned int *)(v31 + 180);
    do
      v33 = __ldaxr(v32);
    while (__stlxr(v33, v32));
    if (v33)
    {
      do
        v34 = __ldaxr(v32);
      while (__stlxr(v34 - 1, v32));
      goto LABEL_58;
    }
    return 0;
  }
  else
  {
    v48 = ne_log_obj();
    result = os_log_type_enabled(v48, OS_LOG_TYPE_INFO);
    if (result)
    {
      *(_WORD *)buf = 0;
LABEL_64:
      _os_log_impl(&dword_208439000, v48, OS_LOG_TYPE_INFO, "filter is null", buf, 2u);
      return 0;
    }
  }
  return result;
}

BOOL ne_filter_protocol_remove_input_handler(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unsigned int *v4;
  unsigned int v5;
  _BOOL8 result;
  NSObject *v7;
  const char *v8;
  int v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    v7 = ne_log_obj();
    result = os_log_type_enabled(v7, OS_LOG_TYPE_FAULT);
    if (!result)
      return result;
    v10 = 136315138;
    v11 = "ne_filter_protocol_remove_input_handler";
    v8 = "%s called with null protocol";
    goto LABEL_12;
  }
  v3 = *(_QWORD *)(a1 + 40);
  if (!v3)
  {
    v7 = ne_log_obj();
    result = os_log_type_enabled(v7, OS_LOG_TYPE_FAULT);
    if (!result)
      return result;
    v10 = 136315138;
    v11 = "ne_filter_protocol_remove_input_handler";
    v8 = "%s called with null filter";
LABEL_12:
    _os_log_fault_impl(&dword_208439000, v7, OS_LOG_TYPE_FAULT, v8, (uint8_t *)&v10, 0xCu);
    return 0;
  }
  v4 = (unsigned int *)(v3 + 180);
  do
    v5 = __ldaxr(v4);
  while (__stlxr(v5, v4));
  if (!v5)
    return 0;
  *(_QWORD *)(a2 + 32) = 0;
  if (*(_QWORD *)(a1 + 48) != a2)
    return 0;
  *(_QWORD *)(a1 + 48) = 0;
  *(_DWORD *)(v3 + 120) |= 1u;
  ne_filter_stats_toggle(a1, 0, 0);
  ne_filter_destroy_frames(*(_QWORD *)(a1 + 40));
  v9 = *(_DWORD *)(v3 + 120);
  if ((v9 & 0x40) == 0)
  {
    *(_DWORD *)(v3 + 120) = v9 | 0x40;
    ne_filter_handle_input_finished(a1, 0);
  }
  ne_filter_cleanup(a1);
  return 1;
}

uint64_t ne_filter_protocol_get_input_frames(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7;
  unsigned int *v12;
  unsigned int v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  int v20;
  NSObject *v21;
  _BOOL4 v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  NSObject *v30;
  _BOOL4 v31;
  uint64_t v32;
  NSObject *v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  int v40;
  NSObject *v41;
  _BOOL4 v42;
  BOOL v43;
  uint64_t v44;
  int v45;
  int v46;
  uint64_t v47;
  int v48;
  uint64_t (*v49)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  int v50;
  NSObject *v51;
  uint64_t v52;
  const char *v53;
  int v54;
  unsigned int v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  unsigned int v59;
  int v60;
  NSObject *v61;
  _BOOL4 v62;
  uint64_t v63;
  _QWORD *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  int v69;
  NSObject *v70;
  _BOOL4 v71;
  uint64_t v72;
  _QWORD *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unsigned int v78;
  unsigned int v79;
  unsigned int v80;
  unint64_t *v81;
  unint64_t v82;
  int v83;
  NSObject *v84;
  _BOOL4 v85;
  uint64_t v86;
  _QWORD *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  const char *v94;
  _QWORD *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  _QWORD *v100;
  uint64_t v101;
  const char *v102;
  NSObject *v103;
  uint32_t v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  _QWORD *v108;
  uint64_t v109;
  int v110;
  const char *v111;
  NSObject *v112;
  uint32_t v113;
  uint64_t v114;
  unsigned int v115;
  _QWORD *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  unint64_t v121;
  const char *v122;
  NSObject *v123;
  uint32_t v124;
  unint64_t v125;
  uint64_t v126;
  uint64_t v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  const char *v131;
  _QWORD *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  const char *v137;
  uint32_t v138;
  _QWORD *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  const char *v144;
  NSObject *v145;
  uint32_t v146;
  uint64_t v147;
  uint64_t v148;
  const char *v149;
  _QWORD *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  const char *v155;
  NSObject *v156;
  uint32_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  const char *v166;
  int ip_protocol;
  int v168;
  unsigned int v169;
  unsigned int v170;
  _BYTE buf[18];
  __int16 v172;
  uint64_t v173;
  __int16 v174;
  _BYTE v175[10];
  _BYTE v176[10];
  uint64_t v177;
  __int16 v178;
  uint64_t v179;
  __int16 v180;
  uint64_t v181;
  __int16 v182;
  uint64_t v183;
  __int16 v184;
  uint64_t v185;
  __int16 v186;
  unsigned int v187;
  __int16 v188;
  int v189;
  __int16 v190;
  unint64_t v191;
  char v192[48];
  _QWORD out[8];

  out[5] = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    v16 = ne_log_obj();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      return 0;
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "ne_filter_protocol_get_input_frames";
    v17 = "%s called with null protocol";
LABEL_32:
    v39 = v16;
LABEL_33:
    _os_log_fault_impl(&dword_208439000, v39, OS_LOG_TYPE_FAULT, v17, buf, 0xCu);
    return 0;
  }
  v7 = *(_QWORD *)(a1 + 40);
  if (!v7)
  {
    v16 = ne_log_obj();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      return 0;
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "ne_filter_protocol_get_input_frames";
    v17 = "%s called with null filter";
    goto LABEL_32;
  }
  v12 = (unsigned int *)(v7 + 180);
  do
    v13 = __ldaxr(v12);
  while (__stlxr(v13, v12));
  if (v13)
  {
    nw_frame_array_init();
    v14 = *(_DWORD *)(v7 + 176);
    if (v14 != 2)
    {
      if (!v14)
      {
        v15 = ne_log_obj();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_208439000, v15, OS_LOG_TYPE_DEBUG, "verdict invalid, returning", buf, 2u);
        }
        return 0;
      }
      if ((*(_BYTE *)(v7 + 120) & 8) != 0)
      {
        memset(out, 0, 37);
        uuid_unparse((const unsigned __int8 *)v7, (char *)out);
        v20 = *(_DWORD *)(v7 + 176);
        v21 = ne_log_obj();
        v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);
        if (v20 == 3)
        {
          if (v22)
          {
            v23 = *(_QWORD *)(v7 + 80);
            if (v23)
              LODWORD(v23) = nw_parameters_get_ip_protocol();
            v24 = *(_QWORD **)(v7 + 160);
            if (v24)
            {
              v26 = v24[6];
              v27 = v24[7];
              v25 = v24[8];
              v28 = v24[9];
            }
            else
            {
              v25 = -1;
              v26 = -1;
              v27 = -1;
              v28 = -1;
            }
            v95 = *(_QWORD **)(v7 + 168);
            if (v95)
            {
              v97 = v95[6];
              v98 = v95[7];
              v96 = v95[8];
              v99 = v95[9];
            }
            else
            {
              v96 = -1;
              v97 = -1;
              v98 = -1;
              v99 = -1;
            }
            *(_DWORD *)buf = 136317442;
            *(_QWORD *)&buf[4] = out;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v23;
            v172 = 2048;
            v173 = v26;
            v174 = 2048;
            *(_QWORD *)v175 = v27;
            *(_WORD *)&v175[8] = 2048;
            *(_QWORD *)v176 = v25;
            *(_WORD *)&v176[8] = 2048;
            v177 = v28;
            v178 = 2048;
            v179 = v97;
            v180 = 2048;
            v181 = v98;
            v182 = 2048;
            v183 = v96;
            v184 = 2048;
            v185 = v99;
            v102 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]start get input";
            v103 = v21;
            v104 = 98;
LABEL_120:
            _os_log_debug_impl(&dword_208439000, v103, OS_LOG_TYPE_DEBUG, v102, buf, v104);
          }
        }
        else if (v22)
        {
          v56 = *(_QWORD *)(v7 + 80);
          if (v56)
            LODWORD(v56) = nw_parameters_get_ip_protocol();
          v57 = *(unsigned int *)(v7 + 176);
          if (v57 > 3)
            v58 = "unknown";
          else
            v58 = (&off_24C0A1818)[v57];
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = out;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v56;
          v172 = 2080;
          v173 = (uint64_t)v58;
          v102 = "[filter %s %d %s] start get input";
          v103 = v21;
          v104 = 28;
          goto LABEL_120;
        }
        if (nelog_is_debug_logging_enabled() && (nw_frame_array_is_empty() & 1) == 0)
        {
          v169 = nw_frame_array_unclaimed_length();
          memset(out, 0, 37);
          uuid_unparse((const unsigned __int8 *)v7, (char *)out);
          v29 = *(_DWORD *)(v7 + 176);
          v30 = ne_log_obj();
          v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG);
          if (v29 == 3)
          {
            if (!v31)
              goto LABEL_35;
            v32 = *(_QWORD *)(v7 + 80);
            if (v32)
              LODWORD(v32) = nw_parameters_get_ip_protocol();
            v33 = v30;
            v34 = *(_QWORD **)(v7 + 160);
            if (v34)
            {
              v36 = v34[6];
              v37 = v34[7];
              v35 = v34[8];
              v38 = v34[9];
            }
            else
            {
              v35 = -1;
              v36 = -1;
              v37 = -1;
              v38 = -1;
            }
            v132 = *(_QWORD **)(v7 + 168);
            if (v132)
            {
              v134 = v132[6];
              v135 = v132[7];
              v133 = v132[8];
              v136 = v132[9];
            }
            else
            {
              v133 = -1;
              v134 = -1;
              v135 = -1;
              v136 = -1;
            }
            *(_DWORD *)buf = 136318210;
            *(_QWORD *)&buf[4] = out;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v32;
            v172 = 2048;
            v173 = v36;
            v174 = 2048;
            *(_QWORD *)v175 = v37;
            *(_WORD *)&v175[8] = 2048;
            *(_QWORD *)v176 = v35;
            *(_WORD *)&v176[8] = 2048;
            v177 = v38;
            v178 = 2048;
            v179 = v134;
            v180 = 2048;
            v181 = v135;
            v182 = 2048;
            v183 = v133;
            v184 = 2048;
            v185 = v136;
            v186 = 1024;
            v187 = v169;
            v188 = 1024;
            v189 = a3;
            v190 = 1024;
            LODWORD(v191) = a4;
            v137 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]already "
                   "has %u accepted, min %u max %u";
            v138 = 116;
          }
          else
          {
            if (!v31)
              goto LABEL_35;
            v126 = *(_QWORD *)(v7 + 80);
            if (v126)
              LODWORD(v126) = nw_parameters_get_ip_protocol();
            v33 = v30;
            v127 = *(unsigned int *)(v7 + 176);
            if (v127 > 3)
              v128 = "unknown";
            else
              v128 = (&off_24C0A1818)[v127];
            *(_DWORD *)buf = 136316418;
            *(_QWORD *)&buf[4] = out;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v126;
            v172 = 2080;
            v173 = (uint64_t)v128;
            v174 = 1024;
            *(_DWORD *)v175 = v169;
            *(_WORD *)&v175[4] = 1024;
            *(_DWORD *)&v175[6] = a3;
            *(_WORD *)v176 = 1024;
            *(_DWORD *)&v176[2] = a4;
            v137 = "[filter %s %d %s] already has %u accepted, min %u max %u";
            v138 = 46;
          }
          _os_log_debug_impl(&dword_208439000, v33, OS_LOG_TYPE_DEBUG, v137, buf, v138);
        }
LABEL_35:
        v170 = 0;
        v18 = ne_filter_protocol_fulfill_frame_request(v7, v7 + 128, a6, (*(_DWORD *)(v7 + 120) & 0x8000) == 0, a4, a5, &v170);
        memset(out, 0, 37);
        uuid_unparse((const unsigned __int8 *)v7, (char *)out);
        v40 = *(_DWORD *)(v7 + 176);
        v41 = ne_log_obj();
        v42 = os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG);
        if (v40 == 3)
        {
          if (!v42)
            goto LABEL_40;
          if (*(_QWORD *)(v7 + 80))
            ip_protocol = nw_parameters_get_ip_protocol();
          else
            ip_protocol = 0;
          v100 = *(_QWORD **)(v7 + 160);
          if (v100)
          {
            v163 = v100[7];
            v164 = v100[6];
            v107 = v100[8];
            v101 = v100[9];
            v165 = v107;
          }
          else
          {
            v101 = -1;
            v164 = -1;
            v165 = -1;
            v163 = -1;
          }
          v162 = v101;
          v108 = *(_QWORD **)(v7 + 168);
          if (v108)
          {
            v159 = v108[7];
            v160 = v108[6];
            v114 = v108[8];
            v109 = v108[9];
            v161 = v114;
          }
          else
          {
            v109 = -1;
            v160 = -1;
            v161 = -1;
            v159 = -1;
          }
          v158 = v109;
          v115 = nw_frame_array_unclaimed_length();
          *(_DWORD *)buf = 136317698;
          *(_QWORD *)&buf[4] = out;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = ip_protocol;
          v172 = 2048;
          v173 = v164;
          v174 = 2048;
          *(_QWORD *)v175 = v163;
          *(_WORD *)&v175[8] = 2048;
          *(_QWORD *)v176 = v165;
          *(_WORD *)&v176[8] = 2048;
          v177 = v162;
          v178 = 2048;
          v179 = v160;
          v180 = 2048;
          v181 = v159;
          v182 = 2048;
          v183 = v161;
          v184 = 2048;
          v185 = v158;
          v186 = 1024;
          v187 = v115;
          v111 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]return arr"
                 "ay has %u bytes from acceptedInputFrames";
          v112 = v41;
          v113 = 104;
        }
        else
        {
          if (!v42)
            goto LABEL_40;
          if (*(_QWORD *)(v7 + 80))
            v168 = nw_parameters_get_ip_protocol();
          else
            v168 = 0;
          v105 = *(unsigned int *)(v7 + 176);
          if (v105 > 3)
            v106 = "unknown";
          else
            v106 = (&off_24C0A1818)[v105];
          v166 = v106;
          v110 = nw_frame_array_unclaimed_length();
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = out;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v168;
          v172 = 2080;
          v173 = (uint64_t)v166;
          v174 = 1024;
          *(_DWORD *)v175 = v110;
          v111 = "[filter %s %d %s] return array has %u bytes from acceptedInputFrames";
          v112 = v41;
          v113 = 34;
        }
        _os_log_debug_impl(&dword_208439000, v112, OS_LOG_TYPE_DEBUG, v111, buf, v113);
LABEL_40:
        if (v170)
        {
          v43 = a4 >= v170;
          a4 = a4 - v170;
          if ((_DWORD)a4 == 0 || !v43)
            goto LABEL_90;
          if (a3 <= v170)
            v44 = 1;
          else
            v44 = a3 - v170;
        }
        else
        {
          v44 = a3;
        }
        if ((_DWORD)v18)
        {
          v43 = a5 >= v18;
          a5 = (a5 - v18);
          if ((_DWORD)a5 == 0 || !v43)
          {
LABEL_90:
            if ((*(_BYTE *)(v7 + 121) & 8) != 0 && nw_frame_array_is_empty())
            {
              do
                v78 = __ldaxr(v12);
              while (__stlxr(v78 + 1, v12));
              nw_queue_context_async();
            }
            v79 = nw_frame_array_unclaimed_length();
            v80 = v79;
            v81 = (unint64_t *)(v7 + 104);
            do
              v82 = __ldaxr(v81);
            while (__stlxr(v82 + v79, v81));
            memset(out, 0, 37);
            uuid_unparse((const unsigned __int8 *)v7, (char *)out);
            v83 = *(_DWORD *)(v7 + 176);
            v84 = ne_log_obj();
            v85 = os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG);
            if (v83 == 3)
            {
              if (!v85)
                return v18;
              v86 = *(_QWORD *)(v7 + 80);
              if (v86)
                LODWORD(v86) = nw_parameters_get_ip_protocol();
              v87 = *(_QWORD **)(v7 + 160);
              if (v87)
              {
                v89 = v87[6];
                v90 = v87[7];
                v88 = v87[8];
                v91 = v87[9];
              }
              else
              {
                v88 = -1;
                v89 = -1;
                v90 = -1;
                v91 = -1;
              }
              v116 = *(_QWORD **)(v7 + 168);
              if (v116)
              {
                v118 = v116[6];
                v119 = v116[7];
                v117 = v116[8];
                v120 = v116[9];
              }
              else
              {
                v117 = -1;
                v118 = -1;
                v119 = -1;
                v120 = -1;
              }
              v125 = atomic_load(v81);
              *(_DWORD *)buf = 136318210;
              *(_QWORD *)&buf[4] = out;
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = v86;
              v172 = 2048;
              v173 = v89;
              v174 = 2048;
              *(_QWORD *)v175 = v90;
              *(_WORD *)&v175[8] = 2048;
              *(_QWORD *)v176 = v88;
              *(_WORD *)&v176[8] = 2048;
              v177 = v91;
              v178 = 2048;
              v179 = v118;
              v180 = 2048;
              v181 = v119;
              v182 = 2048;
              v183 = v117;
              v184 = 2048;
              v185 = v120;
              v186 = 1024;
              v187 = v80;
              v188 = 1024;
              v189 = v18;
              v190 = 2048;
              v191 = v125;
              v122 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]INPUT:"
                     " returning %u bytes in %u framesu (total %llu)";
              v123 = v84;
              v124 = 120;
            }
            else
            {
              if (!v85)
                return v18;
              v92 = *(_QWORD *)(v7 + 80);
              if (v92)
                LODWORD(v92) = nw_parameters_get_ip_protocol();
              v93 = *(unsigned int *)(v7 + 176);
              if (v93 > 3)
                v94 = "unknown";
              else
                v94 = (&off_24C0A1818)[v93];
              v121 = atomic_load(v81);
              *(_DWORD *)buf = 136316418;
              *(_QWORD *)&buf[4] = out;
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = v92;
              v172 = 2080;
              v173 = (uint64_t)v94;
              v174 = 1024;
              *(_DWORD *)v175 = v80;
              *(_WORD *)&v175[4] = 1024;
              *(_DWORD *)&v175[6] = v18;
              *(_WORD *)v176 = 2048;
              *(_QWORD *)&v176[2] = v121;
              v122 = "[filter %s %d %s] INPUT: returning %u bytes in %u framesu (total %llu)";
              v123 = v84;
              v124 = 50;
            }
            _os_log_debug_impl(&dword_208439000, v123, OS_LOG_TYPE_DEBUG, v122, buf, v124);
            return v18;
          }
        }
        v45 = *(_DWORD *)(v7 + 176);
        if (v45 != 1)
        {
          if (v45 == 3)
          {
LABEL_61:
            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = 0;
            nw_frame_array_init();
            ne_filter_read_from_network(*(_QWORD *)(a1 + 40), (uint64_t)buf, 0);
            ne_filter_read_approved_frames(v7, (uint64_t)buf);
            LODWORD(out[0]) = 0;
            v54 = ne_filter_protocol_fulfill_frame_request(v7, v7 + 128, a6, (*(_DWORD *)(v7 + 120) & 0x8000) == 0, a4, a5, out);
            v55 = v170 + LODWORD(out[0]);
            v170 += LODWORD(out[0]);
            v18 = (v54 + v18);
LABEL_80:
            if (!v55 || v55 >= a3)
              goto LABEL_90;
            memset(out, 0, 37);
            uuid_unparse((const unsigned __int8 *)v7, (char *)out);
            v69 = *(_DWORD *)(v7 + 176);
            v70 = ne_log_obj();
            v71 = os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG);
            if (v69 == 3)
            {
              if (v71)
              {
                v72 = *(_QWORD *)(v7 + 80);
                if (v72)
                  LODWORD(v72) = nw_parameters_get_ip_protocol();
                v73 = *(_QWORD **)(v7 + 160);
                if (v73)
                {
                  v75 = v73[6];
                  v76 = v73[7];
                  v74 = v73[8];
                  v77 = v73[9];
                }
                else
                {
                  v74 = -1;
                  v75 = -1;
                  v76 = -1;
                  v77 = -1;
                }
                v139 = *(_QWORD **)(v7 + 168);
                if (v139)
                {
                  v141 = v139[6];
                  v142 = v139[7];
                  v140 = v139[8];
                  v143 = v139[9];
                }
                else
                {
                  v140 = -1;
                  v141 = -1;
                  v142 = -1;
                  v143 = -1;
                }
                *(_DWORD *)buf = 136317954;
                *(_QWORD *)&buf[4] = out;
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = v72;
                v172 = 2048;
                v173 = v75;
                v174 = 2048;
                *(_QWORD *)v175 = v76;
                *(_WORD *)&v175[8] = 2048;
                *(_QWORD *)v176 = v74;
                *(_WORD *)&v176[8] = 2048;
                v177 = v77;
                v178 = 2048;
                v179 = v141;
                v180 = 2048;
                v181 = v142;
                v182 = 2048;
                v183 = v140;
                v184 = 2048;
                v185 = v143;
                v186 = 1024;
                v187 = v170;
                v188 = 1024;
                v189 = a3;
                v144 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]pass"
                       " through failed to fulfill minimum bytes requested (%u < %u), moving all to acceptedInputFrames";
                v145 = v70;
                v146 = 110;
LABEL_162:
                _os_log_debug_impl(&dword_208439000, v145, OS_LOG_TYPE_DEBUG, v144, buf, v146);
              }
            }
            else if (v71)
            {
              v129 = *(_QWORD *)(v7 + 80);
              if (v129)
                LODWORD(v129) = nw_parameters_get_ip_protocol();
              v130 = *(unsigned int *)(v7 + 176);
              if (v130 > 3)
                v131 = "unknown";
              else
                v131 = (&off_24C0A1818)[v130];
              *(_DWORD *)buf = 136316162;
              *(_QWORD *)&buf[4] = out;
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = v129;
              v172 = 2080;
              v173 = (uint64_t)v131;
              v174 = 1024;
              *(_DWORD *)v175 = v170;
              *(_WORD *)&v175[4] = 1024;
              *(_DWORD *)&v175[6] = a3;
              v144 = "[filter %s %d %s] pass through failed to fulfill minimum bytes requested (%u < %u), moving all to a"
                     "cceptedInputFrames";
              v145 = v70;
              v146 = 40;
              goto LABEL_162;
            }
            nw_frame_array_foreach();
            v18 = 0;
            v170 = 0;
            goto LABEL_90;
          }
          v46 = *(_DWORD *)(v7 + 120);
LABEL_57:
          if ((v46 & 0x1000) == 0)
          {
            v51 = ne_log_obj();
            if (!os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
              return 0;
            v52 = *(unsigned int *)(v7 + 176);
            if (v52 > 3)
              v53 = "unknown";
            else
              v53 = (&off_24C0A1818)[v52];
            *(_DWORD *)buf = 136315138;
            *(_QWORD *)&buf[4] = v53;
            v17 = "reached end of get_input_frames with disallowed verdict type %s";
            v39 = v51;
            goto LABEL_33;
          }
          goto LABEL_61;
        }
        v46 = *(_DWORD *)(v7 + 120);
        if ((v46 & 0x1000) != 0)
          goto LABEL_57;
        v47 = *(_QWORD *)(v7 + 32);
        out[0] = 0;
        out[1] = out;
        out[2] = 0x2800000000;
        out[3] = 0;
        out[4] = 0;
        nw_frame_array_init();
        v48 = *(_DWORD *)(v7 + 120) | 0x4000;
        *(_DWORD *)(v7 + 120) = v48;
        if (v47)
        {
          v49 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v47 + 24)
                                                                                               + 80);
          if (v49)
          {
            v50 = v49(v47, a1, v44, a4, a5, out[1] + 24);
            v48 = *(_DWORD *)(v7 + 120);
          }
          else
          {
            v50 = 0;
          }
        }
        else
        {
          v50 = 0;
        }
        *(_DWORD *)(v7 + 120) = v48 & 0xFFFFBFFF;
        v59 = nw_frame_array_unclaimed_length();
        memset(v192, 0, 37);
        uuid_unparse((const unsigned __int8 *)v7, v192);
        v60 = *(_DWORD *)(v7 + 176);
        v61 = ne_log_obj();
        v62 = os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG);
        if (v60 == 3)
        {
          if (v62)
          {
            v63 = *(_QWORD *)(v7 + 80);
            if (v63)
              LODWORD(v63) = nw_parameters_get_ip_protocol();
            v64 = *(_QWORD **)(v7 + 160);
            if (v64)
            {
              v66 = v64[6];
              v67 = v64[7];
              v65 = v64[8];
              v68 = v64[9];
            }
            else
            {
              v65 = -1;
              v66 = -1;
              v67 = -1;
              v68 = -1;
            }
            v150 = *(_QWORD **)(v7 + 168);
            if (v150)
            {
              v152 = v150[6];
              v153 = v150[7];
              v151 = v150[8];
              v154 = v150[9];
            }
            else
            {
              v151 = -1;
              v152 = -1;
              v153 = -1;
              v154 = -1;
            }
            *(_DWORD *)buf = 136317954;
            *(_QWORD *)&buf[4] = v192;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v63;
            v172 = 2048;
            v173 = v66;
            v174 = 2048;
            *(_QWORD *)v175 = v67;
            *(_WORD *)&v175[8] = 2048;
            *(_QWORD *)v176 = v65;
            *(_WORD *)&v176[8] = 2048;
            v177 = v68;
            v178 = 2048;
            v179 = v152;
            v180 = 2048;
            v181 = v153;
            v182 = 2048;
            v183 = v151;
            v184 = 2048;
            v185 = v154;
            v186 = 1024;
            v187 = v59;
            v188 = 1024;
            v189 = v50;
            v155 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]passing "
                   "through %u input bytes in %u frames";
            v156 = v61;
            v157 = 110;
            goto LABEL_174;
          }
        }
        else if (v62)
        {
          v147 = *(_QWORD *)(v7 + 80);
          if (v147)
            LODWORD(v147) = nw_parameters_get_ip_protocol();
          v148 = *(unsigned int *)(v7 + 176);
          if (v148 > 3)
            v149 = "unknown";
          else
            v149 = (&off_24C0A1818)[v148];
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)&buf[4] = v192;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v147;
          v172 = 2080;
          v173 = (uint64_t)v149;
          v174 = 1024;
          *(_DWORD *)v175 = v59;
          *(_WORD *)&v175[4] = 1024;
          *(_DWORD *)&v175[6] = v50;
          v155 = "[filter %s %d %s] passing through %u input bytes in %u frames";
          v156 = v61;
          v157 = 40;
LABEL_174:
          _os_log_debug_impl(&dword_208439000, v156, OS_LOG_TYPE_DEBUG, v155, buf, v157);
          if (!v50)
            goto LABEL_79;
          goto LABEL_78;
        }
        if (!v50)
        {
LABEL_79:
          _Block_object_dispose(out, 8);
          v55 = v170;
          goto LABEL_80;
        }
LABEL_78:
        v18 = (v50 + v18);
        v170 += v59;
        nw_frame_array_foreach();
        goto LABEL_79;
      }
    }
  }
  return 0;
}

uint64_t ne_filter_protocol_get_output_frames(uint64_t a1)
{
  uint64_t v1;
  unsigned int *v2;
  unsigned int v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t (*v11)(void);
  unsigned int v12;
  unsigned int v13;
  unint64_t *v14;
  unint64_t v15;
  int v16;
  NSObject *v17;
  _BOOL4 v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  const char *v34;
  NSObject *v35;
  uint32_t v36;
  unint64_t v37;
  int v38;
  char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  _BYTE v45[10];
  _BYTE v46[10];
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  unsigned int v57;
  __int16 v58;
  int v59;
  __int16 v60;
  unint64_t v61;
  char out[40];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    v6 = ne_log_obj();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      return 0;
    v38 = 136315138;
    v39 = "ne_filter_protocol_get_output_frames";
    v7 = "%s called with null protocol";
LABEL_34:
    _os_log_fault_impl(&dword_208439000, v6, OS_LOG_TYPE_FAULT, v7, (uint8_t *)&v38, 0xCu);
    return 0;
  }
  v1 = *(_QWORD *)(a1 + 40);
  if (!v1)
  {
    v6 = ne_log_obj();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      return 0;
    v38 = 136315138;
    v39 = "ne_filter_protocol_get_output_frames";
    v7 = "%s called with null filter";
    goto LABEL_34;
  }
  v2 = (unsigned int *)(v1 + 180);
  do
    v3 = __ldaxr(v2);
  while (__stlxr(v3, v2));
  if (v3)
  {
    v4 = *(_DWORD *)(v1 + 176);
    if (v4 != 2)
    {
      if (v4)
      {
        if ((*(_DWORD *)(v1 + 120) & 0x48) == 8)
        {
          v10 = *(_QWORD *)(v1 + 32);
          if (v10 && (v11 = *(uint64_t (**)(void))(*(_QWORD *)(v10 + 24) + 88)) != 0)
            v8 = v11();
          else
            v8 = 0;
          v12 = nw_frame_array_unclaimed_length();
          v13 = v12;
          v14 = (unint64_t *)(v1 + 112);
          do
            v15 = __ldaxr(v14);
          while (__stlxr(v15 + v12, v14));
          memset(out, 0, 37);
          uuid_unparse((const unsigned __int8 *)v1, out);
          v16 = *(_DWORD *)(v1 + 176);
          v17 = ne_log_obj();
          v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
          if (v16 == 3)
          {
            if (!v18)
              return v8;
            v19 = *(_QWORD *)(v1 + 80);
            if (v19)
              LODWORD(v19) = nw_parameters_get_ip_protocol();
            v20 = *(_QWORD **)(v1 + 160);
            if (v20)
            {
              v22 = v20[6];
              v23 = v20[7];
              v21 = v20[8];
              v24 = v20[9];
            }
            else
            {
              v21 = -1;
              v22 = -1;
              v23 = -1;
              v24 = -1;
            }
            v28 = *(_QWORD **)(v1 + 168);
            if (v28)
            {
              v30 = v28[6];
              v31 = v28[7];
              v29 = v28[8];
              v32 = v28[9];
            }
            else
            {
              v29 = -1;
              v30 = -1;
              v31 = -1;
              v32 = -1;
            }
            v37 = atomic_load(v14);
            v38 = 136318210;
            v39 = out;
            v40 = 1024;
            v41 = v19;
            v42 = 2048;
            v43 = v22;
            v44 = 2048;
            *(_QWORD *)v45 = v23;
            *(_WORD *)&v45[8] = 2048;
            *(_QWORD *)v46 = v21;
            *(_WORD *)&v46[8] = 2048;
            v47 = v24;
            v48 = 2048;
            v49 = v30;
            v50 = 2048;
            v51 = v31;
            v52 = 2048;
            v53 = v29;
            v54 = 2048;
            v55 = v32;
            v56 = 1024;
            v57 = v13;
            v58 = 1024;
            v59 = v8;
            v60 = 2048;
            v61 = v37;
            v34 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]OUTPUT: r"
                  "eturning %u bytes in %u framesu (total %llu)";
            v35 = v17;
            v36 = 120;
          }
          else
          {
            if (!v18)
              return v8;
            v25 = *(_QWORD *)(v1 + 80);
            if (v25)
              LODWORD(v25) = nw_parameters_get_ip_protocol();
            v26 = *(unsigned int *)(v1 + 176);
            if (v26 > 3)
              v27 = "unknown";
            else
              v27 = (&off_24C0A1818)[v26];
            v33 = atomic_load(v14);
            v38 = 136316418;
            v39 = out;
            v40 = 1024;
            v41 = v25;
            v42 = 2080;
            v43 = (uint64_t)v27;
            v44 = 1024;
            *(_DWORD *)v45 = v13;
            *(_WORD *)&v45[4] = 1024;
            *(_DWORD *)&v45[6] = v8;
            *(_WORD *)v46 = 2048;
            *(_QWORD *)&v46[2] = v33;
            v34 = "[filter %s %d %s] OUTPUT: returning %u bytes in %u framesu (total %llu)";
            v35 = v17;
            v36 = 50;
          }
          _os_log_debug_impl(&dword_208439000, v35, OS_LOG_TYPE_DEBUG, v34, (uint8_t *)&v38, v36);
          return v8;
        }
      }
      else
      {
        v5 = ne_log_obj();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v38) = 0;
          _os_log_debug_impl(&dword_208439000, v5, OS_LOG_TYPE_DEBUG, "verdict invalid, returning", (uint8_t *)&v38, 2u);
        }
      }
    }
  }
  return 0;
}

uint64_t ne_filter_protocol_finalize_output_frames(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unsigned int *v4;
  unsigned int v5;
  int v6;
  uint64_t v7;
  BOOL v8;
  int v9;
  NSObject *v10;
  _BOOL4 v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t result;
  const char *v20;
  int v21;
  NSObject *v22;
  _BOOL4 v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  int v31;
  NSObject *v32;
  _BOOL4 v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  NSObject *v43;
  uint32_t v44;
  int v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  NSObject *v57;
  uint32_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  _QWORD *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  NSObject *v68;
  uint32_t v69;
  uint64_t v70;
  uint64_t v71;
  int ip_protocol;
  uint8_t buf[4];
  char *v74;
  __int16 v75;
  int v76;
  __int16 v77;
  uint64_t v78;
  __int16 v79;
  uint64_t v80;
  __int16 v81;
  uint64_t v82;
  __int16 v83;
  uint64_t v84;
  __int16 v85;
  uint64_t v86;
  __int16 v87;
  uint64_t v88;
  __int16 v89;
  uint64_t v90;
  __int16 v91;
  uint64_t v92;
  __int16 v93;
  int v94;
  char out[40];
  uint64_t v96;

  v96 = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    v18 = ne_log_obj();
    result = os_log_type_enabled(v18, OS_LOG_TYPE_FAULT);
    if (!(_DWORD)result)
      return result;
    *(_DWORD *)buf = 136315138;
    v74 = "ne_filter_protocol_finalize_output_frames";
    v20 = "%s called with null protocol";
LABEL_24:
    _os_log_fault_impl(&dword_208439000, v18, OS_LOG_TYPE_FAULT, v20, buf, 0xCu);
    return 0;
  }
  v2 = *(_QWORD *)(a1 + 40);
  if (!v2)
  {
    v18 = ne_log_obj();
    result = os_log_type_enabled(v18, OS_LOG_TYPE_FAULT);
    if (!(_DWORD)result)
      return result;
    *(_DWORD *)buf = 136315138;
    v74 = "ne_filter_protocol_finalize_output_frames";
    v20 = "%s called with null filter";
    goto LABEL_24;
  }
  v4 = (unsigned int *)(v2 + 180);
  do
    v5 = __ldaxr(v4);
  while (__stlxr(v5, v4));
  if (!v5)
    return 0;
  v6 = *(_DWORD *)(v2 + 176);
  if (v6)
  {
    v7 = *(_QWORD *)(v2 + 32);
    v8 = v6 == 2 || v7 == 0;
    if (!v8 && *(_QWORD *)(*(_QWORD *)(v7 + 24) + 96))
    {
      if (v6 == 1 && (*(_BYTE *)(v2 + 121) & 0x20) == 0)
      {
        memset(out, 0, 37);
        uuid_unparse((const unsigned __int8 *)v2, out);
        v9 = *(_DWORD *)(v2 + 176);
        v10 = ne_log_obj();
        v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
        if (v9 == 3)
        {
          if (v11)
          {
            v12 = *(_QWORD *)(v2 + 80);
            if (v12)
              LODWORD(v12) = nw_parameters_get_ip_protocol();
            v13 = *(_QWORD **)(v2 + 160);
            if (v13)
            {
              v15 = v13[6];
              v16 = v13[7];
              v14 = v13[8];
              v17 = v13[9];
            }
            else
            {
              v14 = -1;
              v15 = -1;
              v16 = -1;
              v17 = -1;
            }
            v62 = *(_QWORD **)(v2 + 168);
            if (v62)
            {
              v64 = v62[6];
              v65 = v62[7];
              v63 = v62[8];
              v66 = v62[9];
            }
            else
            {
              v63 = -1;
              v64 = -1;
              v65 = -1;
              v66 = -1;
            }
            *(_DWORD *)buf = 136317442;
            v74 = out;
            v75 = 1024;
            v76 = v12;
            v77 = 2048;
            v78 = v15;
            v79 = 2048;
            v80 = v16;
            v81 = 2048;
            v82 = v14;
            v83 = 2048;
            v84 = v17;
            v85 = 2048;
            v86 = v64;
            v87 = 2048;
            v88 = v65;
            v89 = 2048;
            v90 = v63;
            v91 = 2048;
            v92 = v66;
            v67 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]passing f"
                  "inalize output frames";
            v68 = v10;
            v69 = 98;
LABEL_84:
            _os_log_debug_impl(&dword_208439000, v68, OS_LOG_TYPE_DEBUG, v67, buf, v69);
          }
        }
        else if (v11)
        {
          v59 = *(_QWORD *)(v2 + 80);
          if (v59)
            LODWORD(v59) = nw_parameters_get_ip_protocol();
          v60 = *(unsigned int *)(v2 + 176);
          if (v60 > 3)
            v61 = "unknown";
          else
            v61 = (&off_24C0A1818)[v60];
          *(_DWORD *)buf = 136315650;
          v74 = out;
          v75 = 1024;
          v76 = v59;
          v77 = 2080;
          v78 = (uint64_t)v61;
          v67 = "[filter %s %d %s] passing finalize output frames";
          v68 = v10;
          v69 = 28;
          goto LABEL_84;
        }
        return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 + 24) + 96))(v7, a2);
      }
      memset(out, 0, 37);
      uuid_unparse((const unsigned __int8 *)v2, out);
      v31 = *(_DWORD *)(v2 + 176);
      v32 = ne_log_obj();
      v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG);
      if (v31 == 3)
      {
        if (v33)
        {
          if (*(_QWORD *)(v2 + 80))
            ip_protocol = nw_parameters_get_ip_protocol();
          else
            ip_protocol = 0;
          v46 = *(_QWORD **)(v2 + 160);
          if (v46)
          {
            v47 = v46[7];
            v48 = v46[9];
            v70 = v46[6];
            v71 = v46[8];
          }
          else
          {
            v70 = -1;
            v71 = -1;
            v47 = -1;
            v48 = -1;
          }
          v51 = *(_QWORD **)(v2 + 168);
          if (v51)
          {
            v53 = v51[6];
            v54 = v51[7];
            v52 = v51[8];
            v55 = v51[9];
          }
          else
          {
            v52 = -1;
            v53 = -1;
            v54 = -1;
            v55 = -1;
          }
          *(_DWORD *)buf = 136317698;
          v74 = out;
          v75 = 1024;
          v76 = ip_protocol;
          v77 = 2048;
          v78 = v70;
          v79 = 2048;
          v80 = v47;
          v81 = 2048;
          v82 = v71;
          v83 = 2048;
          v84 = v48;
          v85 = 2048;
          v86 = v53;
          v87 = 2048;
          v88 = v54;
          v89 = 2048;
          v90 = v52;
          v91 = 2048;
          v92 = v55;
          v93 = 1024;
          v94 = nw_frame_array_unclaimed_length();
          v56 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]filtering n"
                "ew output frames, length %u";
          v57 = v32;
          v58 = 104;
LABEL_72:
          _os_log_debug_impl(&dword_208439000, v57, OS_LOG_TYPE_DEBUG, v56, buf, v58);
        }
      }
      else if (v33)
      {
        if (*(_QWORD *)(v2 + 80))
          v45 = nw_parameters_get_ip_protocol();
        else
          v45 = 0;
        v49 = *(unsigned int *)(v2 + 176);
        if (v49 > 3)
          v50 = "unknown";
        else
          v50 = (&off_24C0A1818)[v49];
        *(_DWORD *)buf = 136315906;
        v74 = out;
        v75 = 1024;
        v76 = v45;
        v77 = 2080;
        v78 = (uint64_t)v50;
        v79 = 1024;
        LODWORD(v80) = nw_frame_array_unclaimed_length();
        v56 = "[filter %s %d %s] filtering new output frames, length %u";
        v57 = v32;
        v58 = 34;
        goto LABEL_72;
      }
      ne_filter_send_approved_frames(v2, a2);
      return 1;
    }
    memset(out, 0, 37);
    uuid_unparse((const unsigned __int8 *)v2, out);
    v21 = *(_DWORD *)(v2 + 176);
    v22 = ne_log_obj();
    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG);
    if (v21 == 3)
    {
      if (v23)
      {
        v24 = *(_QWORD *)(v2 + 80);
        if (v24)
          LODWORD(v24) = nw_parameters_get_ip_protocol();
        v25 = *(_QWORD **)(v2 + 160);
        if (v25)
        {
          v27 = v25[6];
          v28 = v25[7];
          v26 = v25[8];
          v29 = v25[9];
        }
        else
        {
          v26 = -1;
          v27 = -1;
          v28 = -1;
          v29 = -1;
        }
        v37 = *(_QWORD **)(v2 + 168);
        if (v37)
        {
          v39 = v37[6];
          v40 = v37[7];
          v38 = v37[8];
          v41 = v37[9];
        }
        else
        {
          v38 = -1;
          v39 = -1;
          v40 = -1;
          v41 = -1;
        }
        *(_DWORD *)buf = 136317442;
        v74 = out;
        v75 = 1024;
        v76 = v24;
        v77 = 2048;
        v78 = v27;
        v79 = 2048;
        v80 = v28;
        v81 = 2048;
        v82 = v26;
        v83 = 2048;
        v84 = v29;
        v85 = 2048;
        v86 = v39;
        v87 = 2048;
        v88 = v40;
        v89 = 2048;
        v90 = v38;
        v91 = 2048;
        v92 = v41;
        v42 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]dropping output frames";
        v43 = v22;
        v44 = 98;
LABEL_56:
        _os_log_debug_impl(&dword_208439000, v43, OS_LOG_TYPE_DEBUG, v42, buf, v44);
      }
    }
    else if (v23)
    {
      v34 = *(_QWORD *)(v2 + 80);
      if (v34)
        LODWORD(v34) = nw_parameters_get_ip_protocol();
      v35 = *(unsigned int *)(v2 + 176);
      if (v35 > 3)
        v36 = "unknown";
      else
        v36 = (&off_24C0A1818)[v35];
      *(_DWORD *)buf = 136315650;
      v74 = out;
      v75 = 1024;
      v76 = v34;
      v77 = 2080;
      v78 = (uint64_t)v36;
      v42 = "[filter %s %d %s] dropping output frames";
      v43 = v22;
      v44 = 28;
      goto LABEL_56;
    }
    nw_frame_array_foreach();
    return 0;
  }
  v30 = ne_log_obj();
  result = os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG);
  if (!(_DWORD)result)
    return result;
  *(_WORD *)buf = 0;
  _os_log_debug_impl(&dword_208439000, v30, OS_LOG_TYPE_DEBUG, "verdict invalid, returning", buf, 2u);
  return 0;
}

void ne_filter_protocol_input_available(uint64_t a1)
{
  uint64_t v1;
  unsigned int *v2;
  unsigned int v3;
  int v4;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void);
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    v9 = ne_log_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      return;
    v12 = 136315138;
    v13 = "ne_filter_protocol_input_available";
    v10 = "%s called with null protocol";
LABEL_19:
    _os_log_fault_impl(&dword_208439000, v9, OS_LOG_TYPE_FAULT, v10, (uint8_t *)&v12, 0xCu);
    return;
  }
  v1 = *(_QWORD *)(a1 + 40);
  if (!v1)
  {
    v9 = ne_log_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      return;
    v12 = 136315138;
    v13 = "ne_filter_protocol_input_available";
    v10 = "%s called with null filter";
    goto LABEL_19;
  }
  v2 = (unsigned int *)(v1 + 180);
  do
    v3 = __ldaxr(v2);
  while (__stlxr(v3, v2));
  if (v3)
  {
    v4 = *(_DWORD *)(v1 + 176);
    if (v4 == 3 || v4 == 1)
    {
      v6 = *(_QWORD *)(v1 + 48);
      if (v6)
      {
        v7 = *(_QWORD *)(v6 + 24);
        if (v7)
        {
          v8 = *(void (**)(void))(v7 + 64);
          if (v8)
            v8();
        }
      }
    }
    else if (!v4)
    {
      v11 = ne_log_obj();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v12) = 0;
        _os_log_debug_impl(&dword_208439000, v11, OS_LOG_TYPE_DEBUG, "verdict invalid, returning", (uint8_t *)&v12, 2u);
      }
    }
  }
}

void ne_filter_protocol_output_available(uint64_t a1)
{
  uint64_t v1;
  unsigned int *v2;
  unsigned int v3;
  int v4;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void);
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    v9 = ne_log_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      return;
    v12 = 136315138;
    v13 = "ne_filter_protocol_output_available";
    v10 = "%s called with null protocol";
LABEL_19:
    _os_log_fault_impl(&dword_208439000, v9, OS_LOG_TYPE_FAULT, v10, (uint8_t *)&v12, 0xCu);
    return;
  }
  v1 = *(_QWORD *)(a1 + 40);
  if (!v1)
  {
    v9 = ne_log_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      return;
    v12 = 136315138;
    v13 = "ne_filter_protocol_output_available";
    v10 = "%s called with null filter";
    goto LABEL_19;
  }
  v2 = (unsigned int *)(v1 + 180);
  do
    v3 = __ldaxr(v2);
  while (__stlxr(v3, v2));
  if (v3)
  {
    v4 = *(_DWORD *)(v1 + 176);
    if (v4 == 3 || v4 == 1)
    {
      v6 = *(_QWORD *)(v1 + 48);
      if (v6)
      {
        v7 = *(_QWORD *)(v6 + 24);
        if (v7)
        {
          v8 = *(void (**)(void))(v7 + 72);
          if (v8)
            v8();
        }
      }
    }
    else if (!v4)
    {
      v11 = ne_log_obj();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v12) = 0;
        _os_log_debug_impl(&dword_208439000, v11, OS_LOG_TYPE_DEBUG, "verdict invalid, returning", (uint8_t *)&v12, 2u);
      }
    }
  }
}

void ne_filter_protocol_input_finished(uint64_t a1)
{
  uint64_t v2;
  unsigned int *v3;
  unsigned int v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  NSObject *v25;
  uint32_t v26;
  _BYTE v27[18];
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  char out[40];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    v14 = ne_log_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      return;
    *(_DWORD *)v27 = 136315138;
    *(_QWORD *)&v27[4] = "ne_filter_protocol_input_finished";
    v15 = "%s called with null protocol";
    goto LABEL_18;
  }
  v2 = *(_QWORD *)(a1 + 40);
  if (!v2)
  {
    v14 = ne_log_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      return;
    *(_DWORD *)v27 = 136315138;
    *(_QWORD *)&v27[4] = "ne_filter_protocol_input_finished";
    v15 = "%s called with null filter";
LABEL_18:
    _os_log_fault_impl(&dword_208439000, v14, OS_LOG_TYPE_FAULT, v15, v27, 0xCu);
    return;
  }
  v3 = (unsigned int *)(v2 + 180);
  do
    v4 = __ldaxr(v3);
  while (__stlxr(v4, v3));
  if (!v4 || (*(_DWORD *)(v2 + 176) | 2) != 3 || (*(_WORD *)(v2 + 120) & 0x240) != 0)
    return;
  memset(out, 0, 37);
  uuid_unparse((const unsigned __int8 *)v2, out);
  v5 = *(_DWORD *)(v2 + 176);
  v6 = ne_log_obj();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5 == 3)
  {
    if (v7)
    {
      v8 = *(_QWORD *)(v2 + 80);
      if (v8)
        LODWORD(v8) = nw_parameters_get_ip_protocol();
      v9 = *(_QWORD **)(v2 + 160);
      if (v9)
      {
        v11 = v9[6];
        v12 = v9[7];
        v10 = v9[8];
        v13 = v9[9];
      }
      else
      {
        v10 = -1;
        v11 = -1;
        v12 = -1;
        v13 = -1;
      }
      v19 = *(_QWORD **)(v2 + 168);
      if (v19)
      {
        v21 = v19[6];
        v22 = v19[7];
        v20 = v19[8];
        v23 = v19[9];
      }
      else
      {
        v20 = -1;
        v21 = -1;
        v22 = -1;
        v23 = -1;
      }
      *(_DWORD *)v27 = 136317442;
      *(_QWORD *)&v27[4] = out;
      *(_WORD *)&v27[12] = 1024;
      *(_DWORD *)&v27[14] = v8;
      v28 = 2048;
      v29 = v11;
      v30 = 2048;
      v31 = v12;
      v32 = 2048;
      v33 = v10;
      v34 = 2048;
      v35 = v13;
      v36 = 2048;
      v37 = v21;
      v38 = 2048;
      v39 = v22;
      v40 = 2048;
      v41 = v20;
      v42 = 2048;
      v43 = v23;
      v24 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]input finished";
      v25 = v6;
      v26 = 98;
LABEL_35:
      _os_log_debug_impl(&dword_208439000, v25, OS_LOG_TYPE_DEBUG, v24, v27, v26);
    }
  }
  else if (v7)
  {
    v16 = *(_QWORD *)(v2 + 80);
    if (v16)
      LODWORD(v16) = nw_parameters_get_ip_protocol();
    v17 = *(unsigned int *)(v2 + 176);
    if (v17 > 3)
      v18 = "unknown";
    else
      v18 = (&off_24C0A1818)[v17];
    *(_DWORD *)v27 = 136315650;
    *(_QWORD *)&v27[4] = out;
    *(_WORD *)&v27[12] = 1024;
    *(_DWORD *)&v27[14] = v16;
    v28 = 2080;
    v29 = (uint64_t)v18;
    v24 = "[filter %s %d %s] input finished";
    v25 = v6;
    v26 = 28;
    goto LABEL_35;
  }
  *(_DWORD *)(v2 + 120) |= 0x200u;
  *(_QWORD *)v27 = 0;
  *(_QWORD *)&v27[8] = 0;
  nw_frame_array_init();
  if ((*(_BYTE *)(v2 + 121) & 0x40) == 0)
    ne_filter_read_from_network(*(_QWORD *)(a1 + 40), (uint64_t)v27, 1);
  ne_filter_handle_input_finished(a1, (uint64_t)v27);
}

void ne_filter_protocol_output_finished(uint64_t a1)
{
  uint64_t v2;
  unsigned int *v3;
  unsigned int v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  NSObject *v26;
  uint32_t v27;
  int v28;
  char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  char out[40];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    v14 = ne_log_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      return;
    v28 = 136315138;
    v29 = "ne_filter_protocol_output_finished";
    v15 = "%s called with null protocol";
    goto LABEL_16;
  }
  v2 = *(_QWORD *)(a1 + 40);
  if (!v2)
  {
    v14 = ne_log_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      return;
    v28 = 136315138;
    v29 = "ne_filter_protocol_output_finished";
    v15 = "%s called with null filter";
LABEL_16:
    _os_log_fault_impl(&dword_208439000, v14, OS_LOG_TYPE_FAULT, v15, (uint8_t *)&v28, 0xCu);
    return;
  }
  v3 = (unsigned int *)(v2 + 180);
  do
    v4 = __ldaxr(v3);
  while (__stlxr(v4, v3));
  if (!v4)
    return;
  memset(out, 0, 37);
  uuid_unparse((const unsigned __int8 *)v2, out);
  v5 = *(_DWORD *)(v2 + 176);
  v6 = ne_log_obj();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5 == 3)
  {
    if (!v7)
      goto LABEL_18;
    v8 = *(_QWORD *)(v2 + 80);
    if (v8)
      LODWORD(v8) = nw_parameters_get_ip_protocol();
    v9 = *(_QWORD **)(v2 + 160);
    if (v9)
    {
      v11 = v9[6];
      v12 = v9[7];
      v10 = v9[8];
      v13 = v9[9];
    }
    else
    {
      v10 = -1;
      v11 = -1;
      v12 = -1;
      v13 = -1;
    }
    v20 = *(_QWORD **)(v2 + 168);
    if (v20)
    {
      v22 = v20[6];
      v23 = v20[7];
      v21 = v20[8];
      v24 = v20[9];
    }
    else
    {
      v21 = -1;
      v22 = -1;
      v23 = -1;
      v24 = -1;
    }
    v28 = 136317442;
    v29 = out;
    v30 = 1024;
    v31 = v8;
    v32 = 2048;
    v33 = v11;
    v34 = 2048;
    v35 = v12;
    v36 = 2048;
    v37 = v10;
    v38 = 2048;
    v39 = v13;
    v40 = 2048;
    v41 = v22;
    v42 = 2048;
    v43 = v23;
    v44 = 2048;
    v45 = v21;
    v46 = 2048;
    v47 = v24;
    v25 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]output finished";
    v26 = v6;
    v27 = 98;
  }
  else
  {
    if (!v7)
      goto LABEL_18;
    v17 = *(_QWORD *)(v2 + 80);
    if (v17)
      LODWORD(v17) = nw_parameters_get_ip_protocol();
    v18 = *(unsigned int *)(v2 + 176);
    if (v18 > 3)
      v19 = "unknown";
    else
      v19 = (&off_24C0A1818)[v18];
    v28 = 136315650;
    v29 = out;
    v30 = 1024;
    v31 = v17;
    v32 = 2080;
    v33 = (uint64_t)v19;
    v25 = "[filter %s %d %s] output finished";
    v26 = v6;
    v27 = 28;
  }
  _os_log_debug_impl(&dword_208439000, v26, OS_LOG_TYPE_DEBUG, v25, (uint8_t *)&v28, v27);
LABEL_18:
  if ((*(_DWORD *)(v2 + 176) | 2) == 3)
  {
    v16 = *(_DWORD *)(v2 + 120);
    if ((v16 & 0x10) == 0)
    {
      *(_DWORD *)(v2 + 120) = v16 | 0x100;
      ne_filter_handle_output_finished(a1);
    }
  }
}

BOOL ne_filter_protocol_connect(uint64_t a1)
{
  uint64_t v2;
  unsigned int *v3;
  unsigned int v4;
  int v5;
  int v6;
  _BOOL8 result;
  uint64_t v9;
  void (*v10)(_QWORD, uint64_t);
  NSObject *v11;
  const char *v12;
  int v13;
  NSObject *v14;
  _BOOL4 v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  NSObject *v24;
  _BOOL4 v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int16 v32;
  int v33;
  _BOOL4 v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  NSObject *v53;
  uint32_t v54;
  uint64_t v55;
  const char *v56;
  _QWORD *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  const char *v64;
  NSObject *v65;
  uint32_t v66;
  _QWORD *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  int v72;
  char *v73;
  __int16 v74;
  int v75;
  __int16 v76;
  uint64_t v77;
  __int16 v78;
  uint64_t v79;
  __int16 v80;
  uint64_t v81;
  __int16 v82;
  uint64_t v83;
  __int16 v84;
  uint64_t v85;
  __int16 v86;
  uint64_t v87;
  __int16 v88;
  uint64_t v89;
  __int16 v90;
  uint64_t v91;
  __int16 v92;
  const char *v93;
  char out[40];
  uint64_t v95;

  v95 = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    v11 = ne_log_obj();
    result = os_log_type_enabled(v11, OS_LOG_TYPE_FAULT);
    if (!result)
      return result;
    v72 = 136315138;
    v73 = "ne_filter_protocol_connect";
    v12 = "%s called with null protocol";
LABEL_20:
    _os_log_fault_impl(&dword_208439000, v11, OS_LOG_TYPE_FAULT, v12, (uint8_t *)&v72, 0xCu);
    return 0;
  }
  v2 = *(_QWORD *)(a1 + 40);
  if (!v2)
  {
    v11 = ne_log_obj();
    result = os_log_type_enabled(v11, OS_LOG_TYPE_FAULT);
    if (!result)
      return result;
    v72 = 136315138;
    v73 = "ne_filter_protocol_connect";
    v12 = "%s called with null filter";
    goto LABEL_20;
  }
  v3 = (unsigned int *)(v2 + 180);
  do
    v4 = __ldaxr(v3);
  while (__stlxr(v4, v3));
  if (!v4)
    return 0;
  v5 = *(_DWORD *)(v2 + 120);
  *(_DWORD *)(v2 + 120) = v5 | 4;
  if ((v5 & 2) != 0)
  {
    memset(out, 0, 37);
    uuid_unparse((const unsigned __int8 *)v2, out);
    v13 = *(_DWORD *)(v2 + 176);
    v14 = ne_log_obj();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
    if (v13 == 3)
    {
      if (v15)
      {
        v16 = *(_QWORD *)(v2 + 80);
        if (v16)
          LODWORD(v16) = nw_parameters_get_ip_protocol();
        v17 = *(_QWORD **)(v2 + 160);
        if (v17)
        {
          v19 = v17[6];
          v20 = v17[7];
          v18 = v17[8];
          v21 = v17[9];
        }
        else
        {
          v18 = -1;
          v19 = -1;
          v20 = -1;
          v21 = -1;
        }
        v47 = *(_QWORD **)(v2 + 168);
        if (v47)
        {
          v49 = v47[6];
          v50 = v47[7];
          v48 = v47[8];
          v51 = v47[9];
        }
        else
        {
          v48 = -1;
          v49 = -1;
          v50 = -1;
          v51 = -1;
        }
        v72 = 136317442;
        v73 = out;
        v74 = 1024;
        v75 = v16;
        v76 = 2048;
        v77 = v19;
        v78 = 2048;
        v79 = v20;
        v80 = 2048;
        v81 = v18;
        v82 = 2048;
        v83 = v21;
        v84 = 2048;
        v85 = v49;
        v86 = 2048;
        v87 = v50;
        v88 = 2048;
        v89 = v48;
        v90 = 2048;
        v91 = v51;
        v52 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]waiting for xpc connection";
LABEL_69:
        v53 = v14;
        v54 = 98;
        goto LABEL_70;
      }
    }
    else if (v15)
    {
      v41 = *(_QWORD *)(v2 + 80);
      if (v41)
        LODWORD(v41) = nw_parameters_get_ip_protocol();
      v42 = *(unsigned int *)(v2 + 176);
      if (v42 > 3)
        v43 = "unknown";
      else
        v43 = (&off_24C0A1818)[v42];
      v72 = 136315650;
      v73 = out;
      v74 = 1024;
      v75 = v41;
      v76 = 2080;
      v77 = (uint64_t)v43;
      v52 = "[filter %s %d %s] waiting for xpc connection";
      goto LABEL_66;
    }
    return 1;
  }
  v6 = *(_DWORD *)(v2 + 176);
  if (v6 != 3 && v6 != 1)
  {
    if (!v6)
    {
      v22 = *(_QWORD *)(v2 + 144);
      if (v22)
      {
        result = 1;
        while (*(_DWORD *)(v22 + 40))
        {
          v22 = *(_QWORD *)(v22 + 152);
          if (!v22)
            return result;
        }
        v32 = *(_WORD *)(v22 + 144);
        if ((v32 & 2) == 0)
        {
          *(_WORD *)(v22 + 144) = v32 | 2;
          ne_filter_data_protocol_send_new_flow(a1, v22);
          return 1;
        }
        memset(out, 0, 37);
        uuid_unparse((const unsigned __int8 *)v2, out);
        v33 = *(_DWORD *)(v2 + 176);
        v14 = ne_log_obj();
        v34 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
        if (v33 == 3)
        {
          if (!v34)
            return 1;
          v35 = *(_QWORD *)(v2 + 80);
          if (v35)
            LODWORD(v35) = nw_parameters_get_ip_protocol();
          v36 = *(_QWORD **)(v2 + 160);
          if (v36)
          {
            v38 = v36[6];
            v39 = v36[7];
            v37 = v36[8];
            v40 = v36[9];
          }
          else
          {
            v37 = -1;
            v38 = -1;
            v39 = -1;
            v40 = -1;
          }
          v67 = *(_QWORD **)(v2 + 168);
          if (v67)
          {
            v69 = v67[6];
            v70 = v67[7];
            v68 = v67[8];
            v71 = v67[9];
          }
          else
          {
            v68 = -1;
            v69 = -1;
            v70 = -1;
            v71 = -1;
          }
          v72 = 136317442;
          v73 = out;
          v74 = 1024;
          v75 = v35;
          v76 = 2048;
          v77 = v38;
          v78 = 2048;
          v79 = v39;
          v80 = 2048;
          v81 = v37;
          v82 = 2048;
          v83 = v40;
          v84 = 2048;
          v85 = v69;
          v86 = 2048;
          v87 = v70;
          v88 = 2048;
          v89 = v68;
          v90 = 2048;
          v91 = v71;
          v52 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]suppressing"
                " duplicate connect call while waiting for initial verdict";
          goto LABEL_69;
        }
        if (!v34)
          return 1;
        v44 = *(_QWORD *)(v2 + 80);
        if (v44)
          LODWORD(v44) = nw_parameters_get_ip_protocol();
        v45 = *(unsigned int *)(v2 + 176);
        if (v45 > 3)
          v46 = "unknown";
        else
          v46 = (&off_24C0A1818)[v45];
        v72 = 136315650;
        v73 = out;
        v74 = 1024;
        v75 = v44;
        v76 = 2080;
        v77 = (uint64_t)v46;
        v52 = "[filter %s %d %s] suppressing duplicate connect call while waiting for initial verdict";
LABEL_66:
        v53 = v14;
        v54 = 28;
LABEL_70:
        _os_log_debug_impl(&dword_208439000, v53, OS_LOG_TYPE_DEBUG, v52, (uint8_t *)&v72, v54);
        return 1;
      }
      return 1;
    }
    memset(out, 0, 37);
    uuid_unparse((const unsigned __int8 *)v2, out);
    v23 = *(_DWORD *)(v2 + 176);
    v24 = ne_log_obj();
    v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG);
    if (v23 == 3)
    {
      if (v25)
      {
        v26 = *(_QWORD *)(v2 + 80);
        if (v26)
          LODWORD(v26) = nw_parameters_get_ip_protocol();
        v27 = *(_QWORD **)(v2 + 160);
        if (v27)
        {
          v29 = v27[6];
          v30 = v27[7];
          v28 = v27[8];
          v31 = v27[9];
        }
        else
        {
          v28 = -1;
          v29 = -1;
          v30 = -1;
          v31 = -1;
        }
        v57 = *(_QWORD **)(v2 + 168);
        if (v57)
        {
          v59 = v57[6];
          v60 = v57[7];
          v58 = v57[8];
          v61 = v57[9];
        }
        else
        {
          v58 = -1;
          v59 = -1;
          v60 = -1;
          v61 = -1;
        }
        v62 = *(unsigned int *)(v2 + 176);
        if (v62 > 3)
          v63 = "unknown";
        else
          v63 = (&off_24C0A1818)[v62];
        v72 = 136317698;
        v73 = out;
        v74 = 1024;
        v75 = v26;
        v76 = 2048;
        v77 = v29;
        v78 = 2048;
        v79 = v30;
        v80 = 2048;
        v81 = v28;
        v82 = 2048;
        v83 = v31;
        v84 = 2048;
        v85 = v59;
        v86 = 2048;
        v87 = v60;
        v88 = 2048;
        v89 = v58;
        v90 = 2048;
        v91 = v61;
        v92 = 2080;
        v93 = v63;
        v64 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]failing call "
              "to connect because of verdict: %s";
        v65 = v24;
        v66 = 108;
LABEL_87:
        _os_log_debug_impl(&dword_208439000, v65, OS_LOG_TYPE_DEBUG, v64, (uint8_t *)&v72, v66);
      }
    }
    else if (v25)
    {
      v55 = *(_QWORD *)(v2 + 80);
      if (v55)
        LODWORD(v55) = nw_parameters_get_ip_protocol();
      v56 = "pass";
      switch(*(_DWORD *)(v2 + 176))
      {
        case 0:
          v56 = "invalid";
          break;
        case 1:
          break;
        case 2:
          v56 = "drop";
          break;
        case 3:
          v56 = "more-data";
          break;
        default:
          v56 = "unknown";
          break;
      }
      v72 = 136315906;
      v73 = out;
      v74 = 1024;
      v75 = v55;
      v76 = 2080;
      v77 = (uint64_t)v56;
      v78 = 2080;
      v79 = (uint64_t)v56;
      v64 = "[filter %s %d %s] failing call to connect because of verdict: %s";
      v65 = v24;
      v66 = 38;
      goto LABEL_87;
    }
    return 0;
  }
  result = 1;
  if ((v5 & 0x40) == 0)
  {
    v9 = *(_QWORD *)(v2 + 32);
    if (v9)
    {
      v10 = *(void (**)(_QWORD, uint64_t))(*(_QWORD *)(v9 + 24) + 24);
      if (v10)
      {
        v10(*(_QWORD *)(v2 + 32), a1);
        return 1;
      }
    }
  }
  return result;
}

void ne_filter_protocol_connected(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  unsigned int *v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(_QWORD, uint64_t);
  void *v10;
  unsigned int v11;
  NSObject *v12;
  const char *v13;
  void (*v14)(uint64_t, _QWORD *);
  int v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    v12 = ne_log_obj();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      return;
    v15 = 136315138;
    v16 = "ne_filter_protocol_connected";
    v13 = "%s called with null protocol";
    goto LABEL_25;
  }
  v3 = a1[5];
  if (!v3)
  {
    v12 = ne_log_obj();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      return;
    v15 = 136315138;
    v16 = "ne_filter_protocol_connected";
    v13 = "%s called with null filter";
LABEL_25:
    _os_log_fault_impl(&dword_208439000, v12, OS_LOG_TYPE_FAULT, v13, (uint8_t *)&v15, 0xCu);
    return;
  }
  v5 = (unsigned int *)(v3 + 180);
  do
    v6 = __ldaxr(v5);
  while (__stlxr(v6, v5));
  if (v6)
  {
    v7 = a1[6];
    if (v7)
    {
      v8 = *(_QWORD *)(v7 + 24);
      if (v8)
      {
        v9 = *(void (**)(_QWORD, uint64_t))(v8 + 40);
        if (v9)
          v9(a1[6], a2);
      }
    }
    if (a1[4] == a2)
    {
      *(_DWORD *)(v3 + 120) |= 8u;
      if (!*(_QWORD *)(v3 + 64))
      {
        v10 = (void *)(*(uint64_t (**)(_QWORD *))(a1[3] + 128))(a1);
        *(_QWORD *)(v3 + 64) = nw_retain(v10);
      }
      v11 = *(_DWORD *)(v3 + 176);
      if (v11 < 2)
      {
        if (!v7)
          return;
        goto LABEL_22;
      }
      if (v7 && v11 == 3)
      {
LABEL_22:
        v14 = *(void (**)(uint64_t, _QWORD *))(*(_QWORD *)(v7 + 24) + 40);
        if (v14)
          v14(v7, a1);
      }
    }
  }
}

void ne_filter_protocol_disconnect(uint64_t a1)
{
  uint64_t v2;
  unsigned int *v3;
  unsigned int v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  NSObject *v25;
  uint32_t v26;
  int v27;
  char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  char out[40];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    v14 = ne_log_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      return;
    v27 = 136315138;
    v28 = "ne_filter_protocol_disconnect";
    v15 = "%s called with null protocol";
    goto LABEL_17;
  }
  v2 = *(_QWORD *)(a1 + 40);
  if (!v2)
  {
    v14 = ne_log_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      return;
    v27 = 136315138;
    v28 = "ne_filter_protocol_disconnect";
    v15 = "%s called with null filter";
LABEL_17:
    _os_log_fault_impl(&dword_208439000, v14, OS_LOG_TYPE_FAULT, v15, (uint8_t *)&v27, 0xCu);
    return;
  }
  v3 = (unsigned int *)(v2 + 180);
  do
    v4 = __ldaxr(v3);
  while (__stlxr(v4, v3));
  if (v4 && (*(_BYTE *)(v2 + 120) & 0x10) == 0)
  {
    memset(out, 0, 37);
    uuid_unparse((const unsigned __int8 *)v2, out);
    v5 = *(_DWORD *)(v2 + 176);
    v6 = ne_log_obj();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
    if (v5 == 3)
    {
      if (v7)
      {
        v8 = *(_QWORD *)(v2 + 80);
        if (v8)
          LODWORD(v8) = nw_parameters_get_ip_protocol();
        v9 = *(_QWORD **)(v2 + 160);
        if (v9)
        {
          v11 = v9[6];
          v12 = v9[7];
          v10 = v9[8];
          v13 = v9[9];
        }
        else
        {
          v10 = -1;
          v11 = -1;
          v12 = -1;
          v13 = -1;
        }
        v19 = *(_QWORD **)(v2 + 168);
        if (v19)
        {
          v21 = v19[6];
          v22 = v19[7];
          v20 = v19[8];
          v23 = v19[9];
        }
        else
        {
          v20 = -1;
          v21 = -1;
          v22 = -1;
          v23 = -1;
        }
        v27 = 136317442;
        v28 = out;
        v29 = 1024;
        v30 = v8;
        v31 = 2048;
        v32 = v11;
        v33 = 2048;
        v34 = v12;
        v35 = 2048;
        v36 = v10;
        v37 = 2048;
        v38 = v13;
        v39 = 2048;
        v40 = v21;
        v41 = 2048;
        v42 = v22;
        v43 = 2048;
        v44 = v20;
        v45 = 2048;
        v46 = v23;
        v24 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]output finished - disconnect";
        v25 = v6;
        v26 = 98;
LABEL_32:
        _os_log_debug_impl(&dword_208439000, v25, OS_LOG_TYPE_DEBUG, v24, (uint8_t *)&v27, v26);
      }
    }
    else if (v7)
    {
      v16 = *(_QWORD *)(v2 + 80);
      if (v16)
        LODWORD(v16) = nw_parameters_get_ip_protocol();
      v17 = *(unsigned int *)(v2 + 176);
      if (v17 > 3)
        v18 = "unknown";
      else
        v18 = (&off_24C0A1818)[v17];
      v27 = 136315650;
      v28 = out;
      v29 = 1024;
      v30 = v16;
      v31 = 2080;
      v32 = (uint64_t)v18;
      v24 = "[filter %s %d %s] output finished - disconnect";
      v25 = v6;
      v26 = 28;
      goto LABEL_32;
    }
    *(_DWORD *)(v2 + 120) |= 0x10u;
    ne_filter_handle_output_finished(a1);
  }
}

void ne_filter_protocol_disconnected(uint64_t a1)
{
  uint64_t v2;
  unsigned int *v3;
  unsigned int v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  NSObject *v25;
  uint32_t v26;
  int v27;
  char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  char out[40];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    v14 = ne_log_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      return;
    v27 = 136315138;
    v28 = "ne_filter_protocol_disconnected";
    v15 = "%s called with null protocol";
    goto LABEL_17;
  }
  v2 = *(_QWORD *)(a1 + 40);
  if (!v2)
  {
    v14 = ne_log_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      return;
    v27 = 136315138;
    v28 = "ne_filter_protocol_disconnected";
    v15 = "%s called with null filter";
LABEL_17:
    _os_log_fault_impl(&dword_208439000, v14, OS_LOG_TYPE_FAULT, v15, (uint8_t *)&v27, 0xCu);
    return;
  }
  v3 = (unsigned int *)(v2 + 180);
  do
    v4 = __ldaxr(v3);
  while (__stlxr(v4, v3));
  if (v4 && (*(_BYTE *)(v2 + 120) & 0x40) == 0)
  {
    memset(out, 0, 37);
    uuid_unparse((const unsigned __int8 *)v2, out);
    v5 = *(_DWORD *)(v2 + 176);
    v6 = ne_log_obj();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
    if (v5 == 3)
    {
      if (v7)
      {
        v8 = *(_QWORD *)(v2 + 80);
        if (v8)
          LODWORD(v8) = nw_parameters_get_ip_protocol();
        v9 = *(_QWORD **)(v2 + 160);
        if (v9)
        {
          v11 = v9[6];
          v12 = v9[7];
          v10 = v9[8];
          v13 = v9[9];
        }
        else
        {
          v10 = -1;
          v11 = -1;
          v12 = -1;
          v13 = -1;
        }
        v19 = *(_QWORD **)(v2 + 168);
        if (v19)
        {
          v21 = v19[6];
          v22 = v19[7];
          v20 = v19[8];
          v23 = v19[9];
        }
        else
        {
          v20 = -1;
          v21 = -1;
          v22 = -1;
          v23 = -1;
        }
        v27 = 136317442;
        v28 = out;
        v29 = 1024;
        v30 = v8;
        v31 = 2048;
        v32 = v11;
        v33 = 2048;
        v34 = v12;
        v35 = 2048;
        v36 = v10;
        v37 = 2048;
        v38 = v13;
        v39 = 2048;
        v40 = v21;
        v41 = 2048;
        v42 = v22;
        v43 = 2048;
        v44 = v20;
        v45 = 2048;
        v46 = v23;
        v24 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]disconnected";
        v25 = v6;
        v26 = 98;
LABEL_32:
        _os_log_debug_impl(&dword_208439000, v25, OS_LOG_TYPE_DEBUG, v24, (uint8_t *)&v27, v26);
      }
    }
    else if (v7)
    {
      v16 = *(_QWORD *)(v2 + 80);
      if (v16)
        LODWORD(v16) = nw_parameters_get_ip_protocol();
      v17 = *(unsigned int *)(v2 + 176);
      if (v17 > 3)
        v18 = "unknown";
      else
        v18 = (&off_24C0A1818)[v17];
      v27 = 136315650;
      v28 = out;
      v29 = 1024;
      v30 = v16;
      v31 = 2080;
      v32 = (uint64_t)v18;
      v24 = "[filter %s %d %s] disconnected";
      v25 = v6;
      v26 = 28;
      goto LABEL_32;
    }
    *(_DWORD *)(v2 + 120) |= 0x40u;
    ne_filter_handle_output_finished(a1);
    ne_filter_handle_input_finished(a1, 0);
    ne_filter_cleanup(a1);
  }
}

uint64_t nw_filter_protocol_reset(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unsigned int *v5;
  unsigned int v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t result;
  const char *v18;
  uint64_t v19;
  int v20;
  int v21;
  NSObject *v22;
  _BOOL4 v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  NSObject *v51;
  uint32_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  _QWORD *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  NSObject *v62;
  uint32_t v63;
  _BYTE v64[40];
  uint64_t v65;
  __int16 v66;
  uint64_t v67;
  __int16 v68;
  uint64_t v69;
  __int16 v70;
  uint64_t v71;
  __int16 v72;
  uint64_t v73;
  __int16 v74;
  uint64_t v75;
  char out[40];
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    v16 = ne_log_obj();
    result = os_log_type_enabled(v16, OS_LOG_TYPE_FAULT);
    if (!(_DWORD)result)
      return result;
    *(_DWORD *)v64 = 136315138;
    *(_QWORD *)&v64[4] = "nw_filter_protocol_reset";
    v18 = "%s called with null protocol";
LABEL_16:
    _os_log_fault_impl(&dword_208439000, v16, OS_LOG_TYPE_FAULT, v18, v64, 0xCu);
    return 0;
  }
  v3 = *(_QWORD *)(a1 + 40);
  if (!v3)
  {
    v16 = ne_log_obj();
    result = os_log_type_enabled(v16, OS_LOG_TYPE_FAULT);
    if (!(_DWORD)result)
      return result;
    *(_DWORD *)v64 = 136315138;
    *(_QWORD *)&v64[4] = "nw_filter_protocol_reset";
    v18 = "%s called with null filter";
    goto LABEL_16;
  }
  v5 = (unsigned int *)(v3 + 180);
  do
    v6 = __ldaxr(v5);
  while (__stlxr(v6, v5));
  if (!v6)
    return 0;
  memset(out, 0, 37);
  uuid_unparse((const unsigned __int8 *)v3, out);
  v7 = *(_DWORD *)(v3 + 176);
  v8 = ne_log_obj();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (v7 == 3)
  {
    if (!v9)
      goto LABEL_19;
    v10 = *(_QWORD *)(v3 + 80);
    if (v10)
      LODWORD(v10) = nw_parameters_get_ip_protocol();
    v11 = *(_QWORD **)(v3 + 160);
    if (v11)
    {
      v13 = v11[6];
      v14 = v11[7];
      v12 = v11[8];
      v15 = v11[9];
    }
    else
    {
      v12 = -1;
      v13 = -1;
      v14 = -1;
      v15 = -1;
    }
    v45 = *(_QWORD **)(v3 + 168);
    if (v45)
    {
      v47 = v45[6];
      v48 = v45[7];
      v46 = v45[8];
      v49 = v45[9];
    }
    else
    {
      v46 = -1;
      v47 = -1;
      v48 = -1;
      v49 = -1;
    }
    *(_DWORD *)v64 = 136317442;
    *(_QWORD *)&v64[4] = out;
    *(_WORD *)&v64[12] = 1024;
    *(_DWORD *)&v64[14] = v10;
    *(_WORD *)&v64[18] = 2048;
    *(_QWORD *)&v64[20] = v13;
    *(_WORD *)&v64[28] = 2048;
    *(_QWORD *)&v64[30] = v14;
    *(_WORD *)&v64[38] = 2048;
    v65 = v12;
    v66 = 2048;
    v67 = v15;
    v68 = 2048;
    v69 = v47;
    v70 = 2048;
    v71 = v48;
    v72 = 2048;
    v73 = v46;
    v74 = 2048;
    v75 = v49;
    v50 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]connection reset";
    v51 = v8;
    v52 = 98;
  }
  else
  {
    if (!v9)
      goto LABEL_19;
    v42 = *(_QWORD *)(v3 + 80);
    if (v42)
      LODWORD(v42) = nw_parameters_get_ip_protocol();
    v43 = *(unsigned int *)(v3 + 176);
    if (v43 > 3)
      v44 = "unknown";
    else
      v44 = (&off_24C0A1818)[v43];
    *(_DWORD *)v64 = 136315650;
    *(_QWORD *)&v64[4] = out;
    *(_WORD *)&v64[12] = 1024;
    *(_DWORD *)&v64[14] = v42;
    *(_WORD *)&v64[18] = 2080;
    *(_QWORD *)&v64[20] = v44;
    v50 = "[filter %s %d %s] connection reset";
    v51 = v8;
    v52 = 28;
  }
  _os_log_debug_impl(&dword_208439000, v51, OS_LOG_TYPE_DEBUG, v50, v64, v52);
LABEL_19:
  v19 = *(_QWORD *)(v3 + 144);
  if (v19)
  {
    do
    {
      ne_filter_data_protocol_send_finished(a1, v19, 0xBu);
      ne_filter_destroy_frames(*(_QWORD *)(a1 + 40));
      *(_DWORD *)(v19 + 40) = 0;
      *(_OWORD *)(v19 + 88) = 0u;
      *(_OWORD *)(v19 + 104) = 0u;
      *(_OWORD *)(v19 + 120) = 0u;
      *(_QWORD *)(v19 + 136) = 0;
      *(_WORD *)(v19 + 144) &= 0xFE00u;
      v19 = *(_QWORD *)(v19 + 152);
    }
    while (v19);
    v20 = 0;
  }
  else
  {
    v20 = 1;
  }
  *(_DWORD *)(v3 + 176) = v20;
  if (!(*(uint64_t (**)(uint64_t))(*(_QWORD *)(a2 + 24) + 112))(a2)
    || nw_parameters_get_data_mode() != 1)
  {
    goto LABEL_33;
  }
  memset(out, 0, 37);
  uuid_unparse((const unsigned __int8 *)v3, out);
  v21 = *(_DWORD *)(v3 + 176);
  v22 = ne_log_obj();
  v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG);
  if (v21 == 3)
  {
    if (v23)
    {
      v24 = *(_QWORD *)(v3 + 80);
      if (v24)
        LODWORD(v24) = nw_parameters_get_ip_protocol();
      v25 = *(_QWORD **)(v3 + 160);
      if (v25)
      {
        v27 = v25[6];
        v28 = v25[7];
        v26 = v25[8];
        v29 = v25[9];
      }
      else
      {
        v26 = -1;
        v27 = -1;
        v28 = -1;
        v29 = -1;
      }
      v56 = *(_QWORD **)(v3 + 168);
      if (v56)
      {
        v58 = v56[6];
        v59 = v56[7];
        v57 = v56[8];
        v60 = v56[9];
      }
      else
      {
        v57 = -1;
        v58 = -1;
        v59 = -1;
        v60 = -1;
      }
      *(_DWORD *)v64 = 136317442;
      *(_QWORD *)&v64[4] = out;
      *(_WORD *)&v64[12] = 1024;
      *(_DWORD *)&v64[14] = v24;
      *(_WORD *)&v64[18] = 2048;
      *(_QWORD *)&v64[20] = v27;
      *(_WORD *)&v64[28] = 2048;
      *(_QWORD *)&v64[30] = v28;
      *(_WORD *)&v64[38] = 2048;
      v65 = v26;
      v66 = 2048;
      v67 = v29;
      v68 = 2048;
      v69 = v58;
      v70 = 2048;
      v71 = v59;
      v72 = 2048;
      v73 = v57;
      v74 = 2048;
      v75 = v60;
      v61 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]detected datagr"
            "am connection, frame fragmentation disabled";
      v62 = v22;
      v63 = 98;
LABEL_62:
      _os_log_debug_impl(&dword_208439000, v62, OS_LOG_TYPE_DEBUG, v61, v64, v63);
    }
  }
  else if (v23)
  {
    v53 = *(_QWORD *)(v3 + 80);
    if (v53)
      LODWORD(v53) = nw_parameters_get_ip_protocol();
    v54 = *(unsigned int *)(v3 + 176);
    if (v54 > 3)
      v55 = "unknown";
    else
      v55 = (&off_24C0A1818)[v54];
    *(_DWORD *)v64 = 136315650;
    *(_QWORD *)&v64[4] = out;
    *(_WORD *)&v64[12] = 1024;
    *(_DWORD *)&v64[14] = v53;
    *(_WORD *)&v64[18] = 2080;
    *(_QWORD *)&v64[20] = v55;
    v61 = "[filter %s %d %s] detected datagram connection, frame fragmentation disabled";
    v62 = v22;
    v63 = 28;
    goto LABEL_62;
  }
  *(_DWORD *)(v3 + 120) |= 0x8000u;
LABEL_33:
  nw_release(*(void **)(v3 + 64));
  v30 = (void *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)(a2 + 24) + 128))(a2);
  *(_QWORD *)(v3 + 64) = nw_retain(v30);
  nw_release(*(void **)(v3 + 72));
  v31 = (void *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)(a2 + 24) + 136))(a2);
  *(_QWORD *)(v3 + 72) = nw_retain(v31);
  nw_release(*(void **)(v3 + 80));
  v32 = (void *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)(a2 + 24) + 112))(a2);
  *(_QWORD *)(v3 + 80) = nw_retain(v32);
  atomic_store(0, (unint64_t *)(v3 + 104));
  atomic_store(0, (unint64_t *)(v3 + 112));
  *(_DWORD *)(v3 + 120) &= 0xFFFFC003;
  ne_filter_unregister_flow(*(_QWORD *)(v3 + 96), a1);
  MEMORY[0x20BD08510](v3);
  ne_filter_register_flow(*(_QWORD *)(v3 + 96), a1);
  v39 = *(_QWORD *)(a1 + 32);
  if (v39
    && (v40 = *(_QWORD *)(v39 + 24)) != 0
    && (v41 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(v40 + 256)) != 0)
  {
    return v41(v39, a1, v33, v34, v35, v36, v37, v38, *(_QWORD *)v64, *(_QWORD *)&v64[8], *(_QWORD *)&v64[16], *(_QWORD *)&v64[24], *(_QWORD *)&v64[32]);
  }
  else
  {
    return 1;
  }
}

void ne_filter_protocol_create()
{
  NSObject *v0;
  _OWORD *v1;
  char *v2;
  unsigned int *v3;
  unsigned int v4;
  unint64_t *v5;
  void *memptr;
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  memptr = 0;
  if (malloc_type_posix_memalign(&memptr, 8uLL, 0xD8uLL, 0x10A0040BDFCEB50uLL))
  {
    v0 = ne_log_obj();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134217984;
      v8 = 216;
      _os_log_fault_impl(&dword_208439000, v0, OS_LOG_TYPE_FAULT, "posix_memalign(%zu) failed", buf, 0xCu);
    }
  }
  else
  {
    v1 = memptr;
    *(_OWORD *)memptr = 0u;
    v1[1] = 0u;
    v1[2] = 0u;
    v1[3] = 0u;
    v1[4] = 0u;
    v1[5] = 0u;
    v1[6] = 0u;
    v1[7] = 0u;
    v1[9] = 0u;
    v1[10] = 0u;
    v1[11] = 0u;
    v1[12] = 0u;
    v1[8] = 0u;
    *((_QWORD *)v1 + 26) = 0;
    *((_QWORD *)v1 + 2) = &g_filter_protocol_identifier;
    *((_QWORD *)v1 + 3) = &g_filter_protocol_callbacks;
    *((_QWORD *)v1 + 5) = v1;
    nw_frame_array_init();
    v2 = (char *)memptr;
    *((_QWORD *)memptr + 18) = 0;
    v2 += 144;
    *((_QWORD *)v2 + 1) = v2;
    v3 = (unsigned int *)(v2 + 36);
    do
      v4 = __ldaxr(v3);
    while (__stlxr(v4 + 1, v3));
    v5 = (unint64_t *)memptr;
    atomic_store(0, (unint64_t *)memptr + 13);
    atomic_store(0, v5 + 14);
  }
}

void ne_filter_data_protocol_send_finished(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3;
  unsigned int *v7;
  unsigned int v8;
  __int16 v9;
  NSObject *v10;
  __int16 v11;
  xpc_object_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_unfair_lock_s *v16;
  unsigned int v17;
  void *v18;
  _QWORD *v19;
  unsigned int v20;
  _QWORD v21[7];
  unsigned int v22;
  uint8_t buf[12];
  _DWORD length[13];

  *(_QWORD *)&length[11] = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
  {
    v7 = (unsigned int *)(v3 + 180);
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8, v7));
    if (v8)
    {
      if (a3 == 9)
      {
        v11 = *(_WORD *)(a2 + 144);
        *(_WORD *)(a2 + 144) = v11 | 0x10;
        if ((v11 & 0x10) != 0)
          return;
      }
      else if (a3 == 10)
      {
        v9 = *(_WORD *)(a2 + 144);
        *(_WORD *)(a2 + 144) = v9 | 0x20;
        if ((v9 & 0x20) != 0)
          return;
      }
      v12 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_int64(v12, "command", a3);
      xpc_dictionary_set_uuid(v12, "flow-uuid", (const unsigned __int8 *)v3);
      if (a3 == 11)
      {
        v13 = atomic_load((unint64_t *)(v3 + 104));
        xpc_dictionary_set_uint64(v12, "byte-count-inbound", v13);
        v14 = atomic_load((unint64_t *)(v3 + 112));
        xpc_dictionary_set_uint64(v12, "byte-count-outbound", v14);
      }
      memset(length, 0, 36);
      if (ne_filter_generate_crypto_signature(*(_DWORD *)(a2 + 4), v3, (uint64_t)&length[1], length, a3 == 11))
      {
        xpc_dictionary_set_data(v12, "crypto-signature", &length[1], length[0]);
      }
      else
      {
        v15 = ne_log_obj();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_208439000, v15, OS_LOG_TYPE_ERROR, "Failed to generate signature for finished message", buf, 2u);
        }
      }
      if (a3 == 11)
      {
        v16 = *(os_unfair_lock_s **)(v3 + 96);
        v17 = *(_DWORD *)(a2 + 4);
        v18 = v12;
        v19 = 0;
      }
      else
      {
        do
          v20 = __ldaxr(v7);
        while (__stlxr(v20 + 1, v7));
        v16 = *(os_unfair_lock_s **)(v3 + 96);
        v17 = *(_DWORD *)(a2 + 4);
        v21[0] = MEMORY[0x24BDAC760];
        v21[1] = 0x40000000;
        v21[2] = __ne_filter_data_protocol_send_finished_block_invoke;
        v21[3] = &__block_descriptor_tmp_41;
        v21[4] = v3;
        v21[5] = a1;
        v22 = a3;
        v21[6] = a2;
        v19 = v21;
        v18 = v12;
      }
      ne_filter_send_message(v16, v17, v18, v19);
      xpc_release(v12);
    }
  }
  else
  {
    v10 = ne_log_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(length[1]) = 0;
      _os_log_impl(&dword_208439000, v10, OS_LOG_TYPE_INFO, "filter is null", (uint8_t *)&length[1], 2u);
    }
  }
}

uint64_t ne_filter_destroy_frames(uint64_t a1)
{
  uint64_t i;

  for (i = *(_QWORD *)(a1 + 144); i; i = *(_QWORD *)(i + 152))
  {
    nw_frame_array_foreach();
    nw_frame_array_foreach();
  }
  return nw_frame_array_foreach();
}

uint64_t __ne_filter_destroy_frames_block_invoke()
{
  nw_frame_array_remove();
  nw_frame_finalize();
  return 1;
}

uint64_t __ne_filter_destroy_frames_block_invoke_2()
{
  nw_frame_array_remove();
  nw_frame_finalize();
  return 1;
}

uint64_t __ne_filter_destroy_frames_block_invoke_3()
{
  nw_frame_array_remove();
  nw_frame_finalize();
  return 1;
}

BOOL ne_filter_generate_crypto_signature(unsigned int a1, uint64_t a2, uint64_t a3, _DWORD *a4, int a5)
{
  NSObject *v10;
  const sockaddr *address;
  int sa_family;
  sockaddr v13;
  NSObject *v14;
  nw_endpoint_type_t type;
  NSObject *v16;
  const sockaddr *v17;
  int v18;
  sockaddr v19;
  uint64_t parent_endpoint_domain;
  const char *v21;
  unint64_t v22;
  unint64_t v23;
  const char *effective_bundle_id;
  uint64_t url;
  const char *v26;
  os_unfair_lock_s *v27;
  int v28;
  int v29;
  int v30;
  BOOL v31;
  _BOOL8 result;
  NSObject *v33;
  uint8_t buf[32];
  uuid_t dst;
  _OWORD v36[7];
  __int128 v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v37 = 0u;
  memset(v36, 0, sizeof(v36));
  *(_OWORD *)dst = 0u;
  if (!a4)
    return 0;
  uuid_copy(dst, (const unsigned __int8 *)a2);
  DWORD2(v36[0]) = nw_parameters_get_server_mode() ^ 1;
  v10 = *(NSObject **)(a2 + 64);
  if (!v10)
    goto LABEL_10;
  if (nw_endpoint_get_type(v10) != nw_endpoint_type_address)
    goto LABEL_10;
  address = nw_endpoint_get_address(*(nw_endpoint_t *)(a2 + 64));
  if (!address)
    goto LABEL_10;
  sa_family = address->sa_family;
  if (sa_family == 30)
  {
    v13 = *address;
    *(sockaddr *)((char *)&v36[3] + 4) = *(sockaddr *)&address->sa_data[10];
    goto LABEL_9;
  }
  if (sa_family == 2)
  {
    v13 = *address;
LABEL_9:
    *(sockaddr *)((char *)&v36[2] + 8) = v13;
  }
LABEL_10:
  v14 = *(NSObject **)(a2 + 72);
  if (!v14)
    goto LABEL_18;
  type = nw_endpoint_get_type(v14);
  v16 = *(NSObject **)(a2 + 72);
  if (type == nw_endpoint_type_address)
  {
    v17 = nw_endpoint_get_address(v16);
    if (v17)
    {
      v18 = v17->sa_family;
      if (v18 == 30)
      {
        v19 = *v17;
        *(sockaddr *)((char *)&v36[1] + 8) = *(sockaddr *)&v17->sa_data[10];
        goto LABEL_20;
      }
      if (v18 == 2)
      {
        v19 = *v17;
LABEL_20:
        *(sockaddr *)((char *)v36 + 12) = v19;
      }
    }
    parent_endpoint_domain = nw_endpoint_get_parent_endpoint_domain();
    goto LABEL_22;
  }
  if (nw_endpoint_get_type(v16) != nw_endpoint_type_host)
  {
LABEL_18:
    v21 = 0;
    goto LABEL_23;
  }
  ne_filter_create_wildcard_remote_sockaddr((uint64_t)buf, a2);
  *(_OWORD *)((char *)v36 + 12) = *(_OWORD *)buf;
  *(_OWORD *)((char *)&v36[1] + 8) = *(_OWORD *)&buf[12];
  parent_endpoint_domain = (uint64_t)nw_endpoint_get_hostname(*(nw_endpoint_t *)(a2 + 72));
LABEL_22:
  v21 = (const char *)parent_endpoint_domain;
LABEL_23:
  DWORD1(v36[4]) = nw_parameters_get_ip_protocol();
  DWORD2(v36[4]) = getpid();
  HIDWORD(v36[4]) = nw_parameters_get_pid();
  nw_parameters_get_proc_uuid();
  nw_parameters_get_e_proc_uuid();
  if (a5)
  {
    v22 = atomic_load((unint64_t *)(a2 + 104));
    v23 = atomic_load((unint64_t *)(a2 + 112));
    *(_QWORD *)&v37 = v22;
    *((_QWORD *)&v37 + 1) = v23;
  }
  effective_bundle_id = (const char *)nw_parameters_get_effective_bundle_id();
  url = nw_parameters_get_url();
  v26 = (const char *)url;
  *a4 = 32;
  v27 = *(os_unfair_lock_s **)(a2 + 96);
  if (effective_bundle_id)
  {
    v28 = strlen(effective_bundle_id);
    if (v26)
      goto LABEL_27;
LABEL_30:
    v29 = 0;
    if (v21)
      goto LABEL_28;
    goto LABEL_31;
  }
  v28 = 0;
  if (!url)
    goto LABEL_30;
LABEL_27:
  v29 = strlen(v26);
  if (v21)
  {
LABEL_28:
    v30 = strlen(v21);
    v31 = ne_filter_sign_data(v27, a1, (uint64_t)dst, (uint64_t)effective_bundle_id, v28, (uint64_t)v26, v29, (uint64_t)v21, v30, a3, a4);
    goto LABEL_32;
  }
LABEL_31:
  v31 = ne_filter_sign_data(v27, a1, (uint64_t)dst, (uint64_t)effective_bundle_id, v28, (uint64_t)v26, v29, 0, 0, a3, a4);
LABEL_32:
  if (!v31)
  {
    v33 = ne_log_obj();
    result = os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_208439000, v33, OS_LOG_TYPE_ERROR, "Failed to sign flow message", buf, 2u);
    return 0;
  }
  result = 1;
  if (*(_QWORD *)(a2 + 64))
    *(_DWORD *)(a2 + 124) = 1;
  return result;
}

uint64_t __ne_filter_data_protocol_send_finished_block_invoke(uint64_t a1, void *a2)
{
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  NSObject *v25;
  uint32_t v26;
  uint8_t buf[4];
  char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  char out[40];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  memset(out, 0, 37);
  uuid_unparse(*(const unsigned __int8 **)(a1 + 32), out);
  v4 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 176);
  v5 = ne_log_obj();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4 == 3)
  {
    if (v6)
    {
      v7 = *(_QWORD **)(a1 + 32);
      v8 = v7[10];
      if (v8)
      {
        LODWORD(v8) = nw_parameters_get_ip_protocol();
        v7 = *(_QWORD **)(a1 + 32);
      }
      v9 = (_QWORD *)v7[20];
      if (v9)
      {
        v11 = v9[6];
        v12 = v9[7];
        v10 = v9[8];
        v13 = v9[9];
      }
      else
      {
        v10 = -1;
        v11 = -1;
        v12 = -1;
        v13 = -1;
      }
      v19 = (_QWORD *)v7[21];
      if (v19)
      {
        v21 = v19[6];
        v22 = v19[7];
        v20 = v19[8];
        v23 = v19[9];
      }
      else
      {
        v20 = -1;
        v21 = -1;
        v22 = -1;
        v23 = -1;
      }
      *(_DWORD *)buf = 136317442;
      v28 = out;
      v29 = 1024;
      v30 = v8;
      v31 = 2048;
      v32 = v11;
      v33 = 2048;
      v34 = v12;
      v35 = 2048;
      v36 = v10;
      v37 = 2048;
      v38 = v13;
      v39 = 2048;
      v40 = v21;
      v41 = 2048;
      v42 = v22;
      v43 = 2048;
      v44 = v20;
      v45 = 2048;
      v46 = v23;
      v24 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]received send-finish reply";
      v25 = v5;
      v26 = 98;
LABEL_20:
      _os_log_debug_impl(&dword_208439000, v25, OS_LOG_TYPE_DEBUG, v24, buf, v26);
    }
  }
  else if (v6)
  {
    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(_QWORD *)(v15 + 80);
    if (v16)
    {
      LODWORD(v16) = nw_parameters_get_ip_protocol();
      v15 = *(_QWORD *)(a1 + 32);
    }
    v17 = *(unsigned int *)(v15 + 176);
    if (v17 > 3)
      v18 = "unknown";
    else
      v18 = (&off_24C0A1818)[v17];
    *(_DWORD *)buf = 136315650;
    v28 = out;
    v29 = 1024;
    v30 = v16;
    v31 = 2080;
    v32 = (uint64_t)v18;
    v24 = "[filter %s %d %s] received send-finish reply";
    v25 = v5;
    v26 = 28;
    goto LABEL_20;
  }
  xpc_retain(a2);
  return nw_queue_context_async();
}

void __ne_filter_data_protocol_send_finished_block_invoke_39(uint64_t a1)
{
  NSObject *v2;
  const char *v3;
  NSObject *v4;
  uint32_t v5;
  NSObject *v6;
  const char *string;
  uint64_t v8;
  uint64_t v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  NSObject *v14;
  const char *v15;
  int v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)(a1 + 32))
    goto LABEL_5;
  if (MEMORY[0x20BD087A4]() == MEMORY[0x24BDACFB8])
  {
    v6 = ne_log_obj();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    string = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 32), (const char *)*MEMORY[0x24BDACF40]);
    v16 = 136315138;
    v17 = string;
    v3 = "Got an error on the XPC connection when sending a finished message: %s";
    v4 = v6;
    v5 = 12;
    goto LABEL_9;
  }
  if (!*(_QWORD *)(a1 + 32) || MEMORY[0x20BD087A4]() != MEMORY[0x24BDACFA0])
  {
LABEL_5:
    v2 = ne_log_obj();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    LOWORD(v16) = 0;
    v3 = "Got an invalid finished message reply";
    v4 = v2;
    v5 = 2;
LABEL_9:
    _os_log_error_impl(&dword_208439000, v4, OS_LOG_TYPE_ERROR, v3, (uint8_t *)&v16, v5);
    goto LABEL_11;
  }
  ne_filter_process_verdict(*(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 32), **(unsigned int **)(a1 + 48));
LABEL_11:
  xpc_release(*(xpc_object_t *)(a1 + 32));
  v8 = *(_QWORD *)(a1 + 40);
  if (!v8)
  {
    v14 = ne_log_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      return;
    LOWORD(v16) = 0;
    v15 = "protocol is null";
LABEL_23:
    _os_log_impl(&dword_208439000, v14, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v16, 2u);
    return;
  }
  v9 = *(_QWORD *)(v8 + 40);
  if (!v9)
  {
    v14 = ne_log_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      return;
    LOWORD(v16) = 0;
    v15 = "filter is null";
    goto LABEL_23;
  }
  v10 = (unsigned int *)(v9 + 180);
  do
    v11 = __ldaxr(v10);
  while (__stlxr(v11, v10));
  if (v11)
  {
    do
    {
      v12 = __ldaxr(v10);
      v13 = v12 - 1;
    }
    while (__stlxr(v13, v10));
    if (!v13)
      ne_filter_protocol_destroy(*(_QWORD *)(a1 + 40));
  }
}

void ne_filter_process_verdict(_QWORD *a1, int a2, void *a3, int a4)
{
  uint64_t v5;
  unsigned int *v9;
  unsigned int v10;
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  int int64;
  int64_t v15;
  char *v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  int v26;
  unsigned int v27;
  BOOL v28;
  BOOL v29;
  unsigned int *v30;
  NSObject *v31;
  _QWORD *v32;
  _QWORD *v33;
  int v34;
  NSObject *v35;
  _BOOL4 v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unsigned int *v43;
  uint64_t uint64;
  __int16 v45;
  int v46;
  NSObject *v47;
  _BOOL4 v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  __int16 v56;
  int v57;
  int v58;
  NSObject *v59;
  _BOOL4 v60;
  uint64_t v61;
  _QWORD *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  int v67;
  int v68;
  NSObject *v69;
  _BOOL4 v70;
  uint64_t v71;
  _QWORD *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  int v77;
  NSObject *v78;
  _BOOL4 v79;
  uint64_t v80;
  _QWORD *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  const char *v94;
  _QWORD *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  _QWORD *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  const char *v110;
  NSObject *v111;
  uint32_t v112;
  uint64_t v113;
  const char *v114;
  const char *v115;
  NSObject *v116;
  uint32_t v117;
  _QWORD *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  const char *v123;
  NSObject *v124;
  uint32_t v125;
  _QWORD *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  const char *v131;
  NSObject *v132;
  uint32_t v133;
  uint64_t v134;
  uint64_t v135;
  const char *v136;
  _QWORD *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  const char *v142;
  NSObject *v143;
  uint32_t v144;
  unsigned int *v145;
  uint8_t buf[4];
  char *v147;
  __int16 v148;
  _BYTE v149[14];
  __int16 v150;
  const char *v151;
  __int16 v152;
  uint64_t v153;
  __int16 v154;
  uint64_t v155;
  __int16 v156;
  uint64_t v157;
  __int16 v158;
  uint64_t v159;
  __int16 v160;
  uint64_t v161;
  __int16 v162;
  uint64_t v163;
  __int16 v164;
  const char *v165;
  __int16 v166;
  const char *v167;
  char out[40];
  uint64_t v169;

  v169 = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    v12 = ne_log_obj();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      return;
    *(_WORD *)buf = 0;
    v13 = "protocol is null";
LABEL_14:
    _os_log_impl(&dword_208439000, v12, OS_LOG_TYPE_INFO, v13, buf, 2u);
    return;
  }
  v5 = a1[5];
  if (!v5)
  {
    v12 = ne_log_obj();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      return;
    *(_WORD *)buf = 0;
    v13 = "filter is null";
    goto LABEL_14;
  }
  v9 = (unsigned int *)(v5 + 180);
  do
    v10 = __ldaxr(v9);
  while (__stlxr(v10, v9));
  if (v10)
  {
    if (!a3 || MEMORY[0x20BD087A4](a3) != MEMORY[0x24BDACFA0])
    {
      v11 = ne_log_obj();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v147 = "";
        _os_log_error_impl(&dword_208439000, v11, OS_LOG_TYPE_ERROR, "Received invalid reply from %s, dropping", buf, 0xCu);
      }
      return;
    }
    int64 = xpc_dictionary_get_int64(a3, "verdict-value");
    if (!int64)
    {
      v15 = xpc_dictionary_get_int64(a3, "error");
      v16 = (char *)v15;
      if (v15 != 6 && v15)
      {
        v19 = ne_log_obj();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218242;
          v147 = v16;
          v148 = 2080;
          *(_QWORD *)v149 = "";
          _os_log_error_impl(&dword_208439000, v19, OS_LOG_TYPE_ERROR, "Received error %llu from %s", buf, 0x16u);
        }
        int64 = 2;
      }
      else
      {
        v17 = ne_log_obj();
        int64 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
        if (int64)
        {
          v18 = "system-internal";
          if (v16 == (char *)6)
            v18 = "gone-away";
          *(_DWORD *)buf = 136315394;
          v147 = (char *)v18;
          v148 = 2080;
          *(_QWORD *)v149 = "";
          _os_log_error_impl(&dword_208439000, v17, OS_LOG_TYPE_ERROR, "Received error %s from %s", buf, 0x16u);
          int64 = 0;
        }
      }
    }
    v20 = *(_QWORD *)(v5 + 144);
    if (v20)
    {
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = 0;
      LOBYTE(v25) = 1;
      LOBYTE(v26) = 1;
      do
      {
        if (*(_DWORD *)v20 == a4)
        {
          if (!int64)
          {
            if (*(_DWORD *)(v20 + 40) == 3)
              int64 = 1;
            else
              int64 = 2;
          }
          *(_DWORD *)(v20 + 40) = int64;
          v27 = int64;
          v24 = v20;
        }
        else
        {
          v27 = *(_DWORD *)(v20 + 40);
        }
        v25 = (v27 != 0) & v25;
        v26 = (v27 == 1) & v26;
        if (v23)
          v28 = 0;
        else
          v28 = v27 == 3;
        if (v28)
          v23 = v20;
        if (v27 == 3)
          v22 = v20;
        v29 = v27 > 3 || v27 == 2;
        v21 |= v29;
        v20 = *(_QWORD *)(v20 + 152);
      }
      while (v20);
      if (v24)
      {
        if ((v26 & 1) == 0)
        {
          if ((v21 & 1) == 0)
          {
            v30 = (unsigned int *)(v5 + 176);
            if (v25)
            {
              *v30 = 3;
LABEL_56:
              *(_QWORD *)(v5 + 160) = v23;
              v32 = (_QWORD *)(v5 + 160);
              v30 = (unsigned int *)(v5 + 176);
              *(_QWORD *)(v5 + 168) = v22;
              v33 = (_QWORD *)(v5 + 168);
              goto LABEL_57;
            }
            *(_QWORD *)(v5 + 160) = v23;
            v32 = (_QWORD *)(v5 + 160);
            v67 = *(_DWORD *)(v5 + 176);
            *(_QWORD *)(v5 + 168) = v22;
            v33 = (_QWORD *)(v5 + 168);
            if (v67 != 2)
            {
LABEL_57:
              v145 = v30;
              *(_QWORD *)(v24 + 48) = xpc_dictionary_get_uint64(a3, "input-pass-offset");
              *(_QWORD *)(v24 + 56) = xpc_dictionary_get_uint64(a3, "input-peek-offset");
              *(_QWORD *)(v24 + 64) = xpc_dictionary_get_uint64(a3, "output-pass-offset");
              *(_QWORD *)(v24 + 72) = xpc_dictionary_get_uint64(a3, "output-peek-offset");
              memset(out, 0, 37);
              uuid_unparse((const unsigned __int8 *)v5, out);
              v34 = *(_DWORD *)(v5 + 176);
              v35 = ne_log_obj();
              v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG);
              if (v34 == 3)
              {
                if (!v36)
                  goto LABEL_64;
                v37 = *(_QWORD *)(v5 + 80);
                if (v37)
                  LODWORD(v37) = nw_parameters_get_ip_protocol();
                v38 = (_QWORD *)*v32;
                if (*v32)
                {
                  v40 = v38[6];
                  v41 = v38[7];
                  v39 = v38[8];
                  v42 = v38[9];
                }
                else
                {
                  v39 = -1;
                  v40 = -1;
                  v41 = -1;
                  v42 = -1;
                }
                v95 = (_QWORD *)*v33;
                if (*v33)
                {
                  v97 = v95[6];
                  v98 = v95[7];
                  v96 = v95[8];
                  v99 = v95[9];
                }
                else
                {
                  v96 = -1;
                  v97 = -1;
                  v98 = -1;
                  v99 = -1;
                }
                v113 = *(unsigned int *)(v24 + 40);
                if (v113 > 3)
                  v114 = "unknown";
                else
                  v114 = (&off_24C0A1818)[v113];
                *(_DWORD *)buf = 136317954;
                v147 = out;
                v148 = 1024;
                *(_DWORD *)v149 = v37;
                *(_WORD *)&v149[4] = 2048;
                *(_QWORD *)&v149[6] = v40;
                v150 = 2048;
                v151 = (const char *)v41;
                v152 = 2048;
                v153 = v39;
                v154 = 2048;
                v155 = v42;
                v156 = 2048;
                v157 = v97;
                v158 = 2048;
                v159 = v98;
                v160 = 2048;
                v161 = v96;
                v162 = 2048;
                v163 = v99;
                v164 = 2080;
                v165 = "";
                v166 = 2080;
                v167 = v114;
                v115 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]new "
                       "verdict from %s: %s";
                v116 = v35;
                v117 = 118;
              }
              else
              {
                if (!v36)
                  goto LABEL_64;
                v86 = *(_QWORD *)(v5 + 80);
                if (v86)
                  LODWORD(v86) = nw_parameters_get_ip_protocol();
                v87 = *v145;
                if (v87 > 3)
                  v88 = "unknown";
                else
                  v88 = (&off_24C0A1818)[v87];
                v108 = *(unsigned int *)(v24 + 40);
                if (v108 > 3)
                  v109 = "unknown";
                else
                  v109 = (&off_24C0A1818)[v108];
                *(_DWORD *)buf = 136316162;
                v147 = out;
                v148 = 1024;
                *(_DWORD *)v149 = v86;
                *(_WORD *)&v149[4] = 2080;
                *(_QWORD *)&v149[6] = v88;
                v150 = 2080;
                v151 = "";
                v152 = 2080;
                v153 = (uint64_t)v109;
                v115 = "[filter %s %d %s] new verdict from %s: %s";
                v116 = v35;
                v117 = 48;
              }
              _os_log_debug_impl(&dword_208439000, v116, OS_LOG_TYPE_DEBUG, v115, buf, v117);
LABEL_64:
              if ((a2 & 0xFFFFFFFD) == 9)
                *(_WORD *)(v24 + 144) = *(_WORD *)(v24 + 144) & 0xFFAF | 0x40;
              v43 = v145;
              if ((a2 & 0xFFFFFFFE) == 0xA)
                *(_WORD *)(v24 + 144) = *(_WORD *)(v24 + 144) & 0xFF5F | 0x80;
              uint64 = xpc_dictionary_get_uint64(a3, "stats-report-frequency");
              ne_filter_stats_toggle((uint64_t)a1, v24, uint64);
              if ((*(_WORD *)(v24 + 144) & 2) == 0)
              {
                if ((*v145 | 2) != 3)
                  goto LABEL_129;
                ne_filter_send_approved_frames(v5, 0);
                v45 = *(_WORD *)(v24 + 144);
                if ((v45 & 4) != 0)
                {
                  if (*(_DWORD *)(v24 + 40) == 3 && (v45 & 0x40) == 0 && *(_QWORD *)(v24 + 64) != -1)
                  {
LABEL_86:
                    v55 = *(_DWORD *)(v5 + 120);
                    if ((v55 & 0x100) != 0)
                    {
                      if ((v55 & 0x400) != 0)
                        goto LABEL_93;
                    }
                    else if ((*(_DWORD *)(v5 + 120) & 0x430) != 0x10)
                    {
                      goto LABEL_93;
                    }
                    if ((nw_frame_array_is_empty() & 1) != 0 || *(_QWORD *)(v24 + 104) >= *(_QWORD *)(v24 + 64))
                      ne_filter_handle_output_finished((uint64_t)a1);
LABEL_93:
                    ne_filter_read_approved_frames(v5, 0);
                    v56 = *(_WORD *)(v24 + 144);
                    if ((v56 & 8) != 0)
                    {
                      if (*(_DWORD *)(v24 + 40) == 3 && (v56 & 0x80) == 0 && *(_QWORD *)(v24 + 48) != -1)
                      {
LABEL_100:
                        v57 = *(_DWORD *)(v5 + 120);
                        if ((v57 & 0x200) != 0)
                        {
                          if ((v57 & 0x800) != 0)
                            goto LABEL_107;
                        }
                        else if ((*(_DWORD *)(v5 + 120) & 0x8C0) != 0x40)
                        {
                          goto LABEL_107;
                        }
                        if ((nw_frame_array_is_empty() & 1) != 0 || *(_QWORD *)(v24 + 88) >= *(_QWORD *)(v24 + 48))
                          ne_filter_handle_input_finished((uint64_t)a1, 0);
LABEL_107:
                        if ((*(_BYTE *)(v5 + 120) & 0x10) == 0 && (nw_frame_array_is_empty() & 1) == 0)
                        {
                          memset(out, 0, 37);
                          uuid_unparse((const unsigned __int8 *)v5, out);
                          v58 = *(_DWORD *)(v5 + 176);
                          v59 = ne_log_obj();
                          v60 = os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG);
                          if (v58 == 3)
                          {
                            if (v60)
                            {
                              v61 = *(_QWORD *)(v5 + 80);
                              if (v61)
                                LODWORD(v61) = nw_parameters_get_ip_protocol();
                              v62 = (_QWORD *)*v32;
                              if (*v32)
                              {
                                v64 = v62[6];
                                v65 = v62[7];
                                v63 = v62[8];
                                v66 = v62[9];
                              }
                              else
                              {
                                v63 = -1;
                                v64 = -1;
                                v65 = -1;
                                v66 = -1;
                              }
                              v137 = (_QWORD *)*v33;
                              if (*v33)
                              {
                                v139 = v137[6];
                                v140 = v137[7];
                                v138 = v137[8];
                                v141 = v137[9];
                              }
                              else
                              {
                                v138 = -1;
                                v139 = -1;
                                v140 = -1;
                                v141 = -1;
                              }
                              *(_DWORD *)buf = 136317442;
                              v147 = out;
                              v148 = 1024;
                              *(_DWORD *)v149 = v61;
                              *(_WORD *)&v149[4] = 2048;
                              *(_QWORD *)&v149[6] = v64;
                              v150 = 2048;
                              v151 = (const char *)v65;
                              v152 = 2048;
                              v153 = v63;
                              v154 = 2048;
                              v155 = v66;
                              v156 = 2048;
                              v157 = v139;
                              v158 = 2048;
                              v159 = v140;
                              v160 = 2048;
                              v161 = v138;
                              v162 = 2048;
                              v163 = v141;
                              v142 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %"
                                     "lld/%lld)]sending input available";
                              v143 = v59;
                              v144 = 98;
LABEL_202:
                              _os_log_debug_impl(&dword_208439000, v143, OS_LOG_TYPE_DEBUG, v142, buf, v144);
                              v43 = v145;
                            }
                          }
                          else if (v60)
                          {
                            v134 = *(_QWORD *)(v5 + 80);
                            if (v134)
                              LODWORD(v134) = nw_parameters_get_ip_protocol();
                            v135 = *v145;
                            if (v135 > 3)
                              v136 = "unknown";
                            else
                              v136 = (&off_24C0A1818)[v135];
                            *(_DWORD *)buf = 136315650;
                            v147 = out;
                            v148 = 1024;
                            *(_DWORD *)v149 = v134;
                            *(_WORD *)&v149[4] = 2080;
                            *(_QWORD *)&v149[6] = v136;
                            v142 = "[filter %s %d %s] sending input available";
                            v143 = v59;
                            v144 = 28;
                            goto LABEL_202;
                          }
                          ne_filter_protocol_input_available(v5);
                        }
LABEL_129:
                        memset(out, 0, 37);
                        uuid_unparse((const unsigned __int8 *)v5, out);
                        v77 = *(_DWORD *)(v5 + 176);
                        v78 = ne_log_obj();
                        v79 = os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG);
                        if (v77 == 3)
                        {
                          if (v79)
                          {
                            v80 = *(_QWORD *)(v5 + 80);
                            if (v80)
                              LODWORD(v80) = nw_parameters_get_ip_protocol();
                            v81 = (_QWORD *)*v32;
                            if (*v32)
                            {
                              v83 = v81[6];
                              v84 = v81[7];
                              v82 = v81[8];
                              v85 = v81[9];
                            }
                            else
                            {
                              v82 = -1;
                              v83 = -1;
                              v84 = -1;
                              v85 = -1;
                            }
                            v103 = (_QWORD *)*v33;
                            if (*v33)
                            {
                              v105 = v103[6];
                              v106 = v103[7];
                              v104 = v103[8];
                              v107 = v103[9];
                            }
                            else
                            {
                              v104 = -1;
                              v105 = -1;
                              v106 = -1;
                              v107 = -1;
                            }
                            *(_DWORD *)buf = 136317442;
                            v147 = out;
                            v148 = 1024;
                            *(_DWORD *)v149 = v80;
                            *(_WORD *)&v149[4] = 2048;
                            *(_QWORD *)&v149[6] = v83;
                            v150 = 2048;
                            v151 = (const char *)v84;
                            v152 = 2048;
                            v153 = v82;
                            v154 = 2048;
                            v155 = v85;
                            v156 = 2048;
                            v157 = v105;
                            v158 = 2048;
                            v159 = v106;
                            v160 = 2048;
                            v161 = v104;
                            v162 = 2048;
                            v163 = v107;
                            v110 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %ll"
                                   "d/%lld)]finished processing new verdict";
                            v111 = v78;
                            v112 = 98;
LABEL_169:
                            _os_log_debug_impl(&dword_208439000, v111, OS_LOG_TYPE_DEBUG, v110, buf, v112);
                          }
                        }
                        else if (v79)
                        {
                          v89 = *(_QWORD *)(v5 + 80);
                          if (v89)
                            LODWORD(v89) = nw_parameters_get_ip_protocol();
                          v90 = *v43;
                          if (v90 > 3)
                            v91 = "unknown";
                          else
                            v91 = (&off_24C0A1818)[v90];
                          *(_DWORD *)buf = 136315650;
                          v147 = out;
                          v148 = 1024;
                          *(_DWORD *)v149 = v89;
                          *(_WORD *)&v149[4] = 2080;
                          *(_QWORD *)&v149[6] = v91;
                          v110 = "[filter %s %d %s] finished processing new verdict";
                          v111 = v78;
                          v112 = 28;
                          goto LABEL_169;
                        }
                        ne_filter_cleanup((uint64_t)a1);
                        return;
                      }
                    }
                    else if ((v56 & 0x80) == 0)
                    {
                      goto LABEL_100;
                    }
                    ne_filter_handle_input_finished((uint64_t)a1, 0);
                    goto LABEL_100;
                  }
                }
                else if ((v45 & 0x40) == 0)
                {
                  goto LABEL_86;
                }
                ne_filter_handle_output_finished((uint64_t)a1);
                goto LABEL_86;
              }
              memset(out, 0, 37);
              uuid_unparse((const unsigned __int8 *)v5, out);
              v46 = *(_DWORD *)(v5 + 176);
              v47 = ne_log_obj();
              v48 = os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG);
              if (v46 == 3)
              {
                if (!v48)
                  goto LABEL_80;
                v49 = *(_QWORD *)(v5 + 80);
                if (v49)
                  LODWORD(v49) = nw_parameters_get_ip_protocol();
                v50 = (_QWORD *)*v32;
                if (*v32)
                {
                  v52 = v50[6];
                  v53 = v50[7];
                  v51 = v50[8];
                  v54 = v50[9];
                }
                else
                {
                  v51 = -1;
                  v52 = -1;
                  v53 = -1;
                  v54 = -1;
                }
                v126 = (_QWORD *)*v33;
                if (*v33)
                {
                  v128 = v126[6];
                  v129 = v126[7];
                  v127 = v126[8];
                  v130 = v126[9];
                }
                else
                {
                  v127 = -1;
                  v128 = -1;
                  v129 = -1;
                  v130 = -1;
                }
                *(_DWORD *)buf = 136317698;
                v147 = out;
                v148 = 1024;
                *(_DWORD *)v149 = v49;
                *(_WORD *)&v149[4] = 2048;
                *(_QWORD *)&v149[6] = v52;
                v150 = 2048;
                v151 = (const char *)v53;
                v152 = 2048;
                v153 = v51;
                v154 = 2048;
                v155 = v54;
                v156 = 2048;
                v157 = v128;
                v158 = 2048;
                v159 = v129;
                v160 = 2048;
                v161 = v127;
                v162 = 2048;
                v163 = v130;
                v164 = 2080;
                v165 = "";
                v131 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]rece"
                       "ived initial verdict from %s";
                v132 = v47;
                v133 = 108;
              }
              else
              {
                if (!v48)
                  goto LABEL_80;
                v100 = *(_QWORD *)(v5 + 80);
                if (v100)
                  LODWORD(v100) = nw_parameters_get_ip_protocol();
                v101 = *v145;
                if (v101 > 3)
                  v102 = "unknown";
                else
                  v102 = (&off_24C0A1818)[v101];
                *(_DWORD *)buf = 136315906;
                v147 = out;
                v148 = 1024;
                *(_DWORD *)v149 = v100;
                *(_WORD *)&v149[4] = 2080;
                *(_QWORD *)&v149[6] = v102;
                v150 = 2080;
                v151 = "";
                v131 = "[filter %s %d %s] received initial verdict from %s";
                v132 = v47;
                v133 = 38;
              }
              _os_log_debug_impl(&dword_208439000, v132, OS_LOG_TYPE_DEBUG, v131, buf, v133);
LABEL_80:
              *(_WORD *)(v24 + 144) &= ~2u;
              if (!ne_filter_protocol_connect((uint64_t)a1))
                ne_filter_protocol_drop_flow(a1);
              goto LABEL_129;
            }
LABEL_119:
            memset(out, 0, 37);
            uuid_unparse((const unsigned __int8 *)v5, out);
            v68 = *(_DWORD *)(v5 + 176);
            v69 = ne_log_obj();
            v70 = os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG);
            if (v68 == 3)
            {
              if (v70)
              {
                v71 = *(_QWORD *)(v5 + 80);
                if (v71)
                  LODWORD(v71) = nw_parameters_get_ip_protocol();
                v72 = (_QWORD *)*v32;
                if (*v32)
                {
                  v74 = v72[6];
                  v75 = v72[7];
                  v73 = v72[8];
                  v76 = v72[9];
                }
                else
                {
                  v73 = -1;
                  v74 = -1;
                  v75 = -1;
                  v76 = -1;
                }
                v118 = (_QWORD *)*v33;
                if (*v33)
                {
                  v120 = v118[6];
                  v121 = v118[7];
                  v119 = v118[8];
                  v122 = v118[9];
                }
                else
                {
                  v119 = -1;
                  v120 = -1;
                  v121 = -1;
                  v122 = -1;
                }
                *(_DWORD *)buf = 136317442;
                v147 = out;
                v148 = 1024;
                *(_DWORD *)v149 = v71;
                *(_WORD *)&v149[4] = 2048;
                *(_QWORD *)&v149[6] = v74;
                v150 = 2048;
                v151 = (const char *)v75;
                v152 = 2048;
                v153 = v73;
                v154 = 2048;
                v155 = v76;
                v156 = 2048;
                v157 = v120;
                v158 = 2048;
                v159 = v121;
                v160 = 2048;
                v161 = v119;
                v162 = 2048;
                v163 = v122;
                v123 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]over"
                       "all verdict is drop, dropping the flow";
                v124 = v69;
                v125 = 98;
LABEL_182:
                _os_log_debug_impl(&dword_208439000, v124, OS_LOG_TYPE_DEBUG, v123, buf, v125);
              }
            }
            else if (v70)
            {
              v92 = *(_QWORD *)(v5 + 80);
              if (v92)
                LODWORD(v92) = nw_parameters_get_ip_protocol();
              v93 = *v30;
              if (v93 > 3)
                v94 = "unknown";
              else
                v94 = (&off_24C0A1818)[v93];
              *(_DWORD *)buf = 136315650;
              v147 = out;
              v148 = 1024;
              *(_DWORD *)v149 = v92;
              *(_WORD *)&v149[4] = 2080;
              *(_QWORD *)&v149[6] = v94;
              v123 = "[filter %s %d %s] overall verdict is drop, dropping the flow";
              v124 = v69;
              v125 = 28;
              goto LABEL_182;
            }
            ne_filter_protocol_drop_flow(a1);
            return;
          }
LABEL_118:
          *(_DWORD *)(v5 + 176) = 2;
          v30 = (unsigned int *)(v5 + 176);
          *(_QWORD *)(v5 + 160) = v23;
          v32 = (_QWORD *)(v5 + 160);
          *(_QWORD *)(v5 + 168) = v22;
          v33 = (_QWORD *)(v5 + 168);
          goto LABEL_119;
        }
        goto LABEL_55;
      }
    }
    else
    {
      v22 = 0;
      v23 = 0;
      v26 = 1;
    }
    v31 = ne_log_obj();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v147 = "";
      _os_log_error_impl(&dword_208439000, v31, OS_LOG_TYPE_ERROR, "Failed to find the filter client for provider %s", buf, 0xCu);
      if ((v26 & 1) == 0)
        goto LABEL_118;
    }
    else if (!v26)
    {
      goto LABEL_118;
    }
    v24 = 0;
LABEL_55:
    *(_DWORD *)(v5 + 176) = 1;
    goto LABEL_56;
  }
}

void ne_filter_protocol_destroy(uint64_t a1)
{
  uint64_t v2;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  int v26;
  char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  char out[40];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 40);
  memset(out, 0, 37);
  uuid_unparse((const unsigned __int8 *)v2, out);
  v3 = *(_DWORD *)(v2 + 176);
  v4 = ne_log_obj();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3 == 3)
  {
    if (v5)
    {
      v6 = *(_QWORD *)(v2 + 80);
      if (v6)
        LODWORD(v6) = nw_parameters_get_ip_protocol();
      v7 = *(_QWORD **)(v2 + 160);
      if (v7)
      {
        v9 = v7[6];
        v10 = v7[7];
        v8 = v7[8];
        v11 = v7[9];
      }
      else
      {
        v8 = -1;
        v9 = -1;
        v10 = -1;
        v11 = -1;
      }
      v18 = *(_QWORD **)(v2 + 168);
      if (v18)
      {
        v20 = v18[6];
        v21 = v18[7];
        v19 = v18[8];
        v22 = v18[9];
      }
      else
      {
        v19 = -1;
        v20 = -1;
        v21 = -1;
        v22 = -1;
      }
      v26 = 136317442;
      v27 = out;
      v28 = 1024;
      v29 = v6;
      v30 = 2048;
      v31 = v9;
      v32 = 2048;
      v33 = v10;
      v34 = 2048;
      v35 = v8;
      v36 = 2048;
      v37 = v11;
      v38 = 2048;
      v39 = v20;
      v40 = 2048;
      v41 = v21;
      v42 = 2048;
      v43 = v19;
      v44 = 2048;
      v45 = v22;
      v23 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]destroying filter";
      v24 = v4;
      v25 = 98;
LABEL_26:
      _os_log_debug_impl(&dword_208439000, v24, OS_LOG_TYPE_DEBUG, v23, (uint8_t *)&v26, v25);
    }
  }
  else if (v5)
  {
    v15 = *(_QWORD *)(v2 + 80);
    if (v15)
      LODWORD(v15) = nw_parameters_get_ip_protocol();
    v16 = *(unsigned int *)(v2 + 176);
    if (v16 > 3)
      v17 = "unknown";
    else
      v17 = (&off_24C0A1818)[v16];
    v26 = 136315650;
    v27 = out;
    v28 = 1024;
    v29 = v15;
    v30 = 2080;
    v31 = (uint64_t)v17;
    v23 = "[filter %s %d %s] destroying filter";
    v24 = v4;
    v25 = 28;
    goto LABEL_26;
  }
  *(_QWORD *)(a1 + 40) = 0;
  nw_release(*(void **)(v2 + 64));
  nw_release(*(void **)(v2 + 72));
  nw_release(*(void **)(v2 + 80));
  nw_release(*(void **)(v2 + 88));
  *(_QWORD *)(v2 + 96) = 0;
  *(_QWORD *)(v2 + 160) = 0;
  *(_QWORD *)(v2 + 168) = 0;
  while (1)
  {
    v12 = *(_QWORD **)(v2 + 144);
    if (!v12)
      break;
    v13 = v12[19];
    v14 = (_QWORD *)v12[20];
    if (v13)
    {
      *(_QWORD *)(v13 + 160) = v14;
      v14 = (_QWORD *)v12[20];
    }
    else
    {
      *(_QWORD *)(v2 + 152) = v14;
    }
    *v14 = v13;
    free(v12);
  }
  ne_filter_stats_toggle(a1, 0, 0);
  memset_s((void *)v2, 0xD8uLL, 0, 0xD8uLL);
  free((void *)v2);
}

void ne_filter_stats_toggle(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int *v8;
  unsigned int v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  unsigned int v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  unsigned int *v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  unint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v6 = *(_QWORD *)(a2 + 80);
    if (a3)
    {
      if (v6 == a3)
        return;
    }
    else if (!v6)
    {
      return;
    }
  }
  if (!a1)
  {
    v14 = ne_log_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      return;
    LOWORD(v23) = 0;
    v15 = "protocol is null";
    goto LABEL_25;
  }
  v7 = *(_QWORD *)(a1 + 40);
  if (!v7)
  {
    v14 = ne_log_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      return;
    LOWORD(v23) = 0;
    v15 = "filter is null";
    goto LABEL_25;
  }
  v8 = (unsigned int *)(v7 + 180);
  do
    v9 = __ldaxr(v8);
  while (__stlxr(v9, v8));
  if (!v9)
    return;
  v10 = *(_QWORD *)(v7 + 96);
  if (!v10)
    return;
  v11 = ne_log_obj();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v23 = 134218240;
    v24 = a2;
    v25 = 2048;
    v26 = a3;
    _os_log_debug_impl(&dword_208439000, v11, OS_LOG_TYPE_DEBUG, "Stats toggle - client %lX frequency %llu", (uint8_t *)&v23, 0x16u);
    if (a3)
      goto LABEL_14;
  }
  else if (a3)
  {
LABEL_14:
    if (a2 && *(_QWORD *)(a2 + 80) != a3)
    {
      v12 = 200;
      if (a3 > 0xC8)
        v12 = a3;
      *(_QWORD *)(a2 + 80) = v12;
      *(_QWORD *)(a2 + 136) = mach_absolute_time();
      if (ne_filter_stats_report_register(v10, a1))
      {
        do
          v13 = __ldaxr(v8);
        while (__stlxr(v13 + 1, v8));
      }
    }
    return;
  }
  if (!a2)
    goto LABEL_47;
  *(_QWORD *)(a2 + 80) = 0;
  v16 = *(_QWORD *)(v7 + 144);
  if (!v16)
    goto LABEL_47;
  v17 = 0;
  do
  {
    if (*(_QWORD *)(v16 + 80))
      v17 = 1;
    v16 = *(_QWORD *)(v16 + 152);
  }
  while (v16);
  if ((v17 & 1) == 0)
  {
LABEL_47:
    if (ne_filter_stats_report_unregister(v10, a1))
    {
      v18 = *(_QWORD *)(a1 + 40);
      if (v18)
      {
        v19 = (unsigned int *)(v18 + 180);
        do
          v20 = __ldaxr(v19);
        while (__stlxr(v20, v19));
        if (v20)
        {
          do
          {
            v21 = __ldaxr(v19);
            v22 = v21 - 1;
          }
          while (__stlxr(v22, v19));
          if (!v22)
            ne_filter_protocol_destroy(a1);
        }
        return;
      }
      v14 = ne_log_obj();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        return;
      LOWORD(v23) = 0;
      v15 = "filter is null";
LABEL_25:
      _os_log_impl(&dword_208439000, v14, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v23, 2u);
    }
  }
}

void ne_filter_protocol_drop_flow(_QWORD *a1)
{
  uint64_t v2;
  unsigned int *v3;
  unsigned int v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  uint64_t i;
  int v24;
  uint64_t v25;
  void (*v26)(uint64_t, _QWORD *, uint64_t);
  void (*v27)(uint64_t, _QWORD *);
  int v28;
  uint64_t v29;
  void (*v30)(uint64_t, _QWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  NSObject *v40;
  uint32_t v41;
  _BYTE v42[40];
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  char out[40];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    v20 = ne_log_obj();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      return;
    *(_DWORD *)v42 = 136315138;
    *(_QWORD *)&v42[4] = "ne_filter_protocol_drop_flow";
    v21 = "%s called with null protocol";
    goto LABEL_16;
  }
  v2 = a1[5];
  if (!v2)
  {
    v20 = ne_log_obj();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      return;
    *(_DWORD *)v42 = 136315138;
    *(_QWORD *)&v42[4] = "ne_filter_protocol_drop_flow";
    v21 = "%s called with null filter";
LABEL_16:
    _os_log_fault_impl(&dword_208439000, v20, OS_LOG_TYPE_FAULT, v21, v42, 0xCu);
    return;
  }
  v3 = (unsigned int *)(v2 + 180);
  do
    v4 = __ldaxr(v3);
  while (__stlxr(v4, v3));
  if (!v4)
    return;
  memset(out, 0, 37);
  uuid_unparse((const unsigned __int8 *)v2, out);
  v5 = *(_DWORD *)(v2 + 176);
  v6 = ne_log_obj();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5 == 3)
  {
    if (!v7)
      goto LABEL_18;
    v14 = *(_QWORD *)(v2 + 80);
    if (v14)
      LODWORD(v14) = nw_parameters_get_ip_protocol();
    v15 = *(_QWORD **)(v2 + 160);
    if (v15)
    {
      v17 = v15[6];
      v18 = v15[7];
      v16 = v15[8];
      v19 = v15[9];
    }
    else
    {
      v16 = -1;
      v17 = -1;
      v18 = -1;
      v19 = -1;
    }
    v34 = *(_QWORD **)(v2 + 168);
    if (v34)
    {
      v36 = v34[6];
      v37 = v34[7];
      v35 = v34[8];
      v38 = v34[9];
    }
    else
    {
      v35 = -1;
      v36 = -1;
      v37 = -1;
      v38 = -1;
    }
    *(_DWORD *)v42 = 136317442;
    *(_QWORD *)&v42[4] = out;
    *(_WORD *)&v42[12] = 1024;
    *(_DWORD *)&v42[14] = v14;
    *(_WORD *)&v42[18] = 2048;
    *(_QWORD *)&v42[20] = v17;
    *(_WORD *)&v42[28] = 2048;
    *(_QWORD *)&v42[30] = v18;
    *(_WORD *)&v42[38] = 2048;
    v43 = v16;
    v44 = 2048;
    v45 = v19;
    v46 = 2048;
    v47 = v36;
    v48 = 2048;
    v49 = v37;
    v50 = 2048;
    v51 = v35;
    v52 = 2048;
    v53 = v38;
    v39 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]drop flow";
    v40 = v6;
    v41 = 98;
  }
  else
  {
    if (!v7)
      goto LABEL_18;
    v31 = *(_QWORD *)(v2 + 80);
    if (v31)
      LODWORD(v31) = nw_parameters_get_ip_protocol();
    v32 = *(unsigned int *)(v2 + 176);
    if (v32 > 3)
      v33 = "unknown";
    else
      v33 = (&off_24C0A1818)[v32];
    *(_DWORD *)v42 = 136315650;
    *(_QWORD *)&v42[4] = out;
    *(_WORD *)&v42[12] = 1024;
    *(_DWORD *)&v42[14] = v31;
    *(_WORD *)&v42[18] = 2080;
    *(_QWORD *)&v42[20] = v33;
    v39 = "[filter %s %d %s] drop flow";
    v40 = v6;
    v41 = 28;
  }
  _os_log_debug_impl(&dword_208439000, v40, OS_LOG_TYPE_DEBUG, v39, v42, v41);
LABEL_18:
  v22 = a1[6];
  if (v22)
  {
    *(_DWORD *)(v2 + 176) = 2;
    for (i = *(_QWORD *)(v2 + 144); i; i = *(_QWORD *)(i + 152))
      *(_DWORD *)(i + 40) = 2;
    v24 = *(_DWORD *)(v2 + 120);
    if ((v24 & 0x80) == 0)
    {
      *(_DWORD *)(v2 + 120) = v24 | 0x80;
      v25 = *(_QWORD *)(v22 + 24);
      v26 = *(void (**)(uint64_t, _QWORD *, uint64_t))(v25 + 56);
      if (v26)
      {
        v26(v22, a1, 57);
        v25 = *(_QWORD *)(v22 + 24);
      }
      v27 = *(void (**)(uint64_t, _QWORD *))(v25 + 48);
      if (v27)
        v27(v22, a1);
    }
    v28 = *(_DWORD *)(v2 + 120);
    if ((v28 & 0x20) == 0)
    {
      *(_DWORD *)(v2 + 120) = v28 | 0x20;
      v29 = a1[4];
      if (v29)
      {
        v30 = *(void (**)(uint64_t, _QWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(v29 + 24) + 32);
        if (v30)
          v30(v29, a1, v8, v9, v10, v11, v12, v13, *(_QWORD *)v42, *(_QWORD *)&v42[8], *(_QWORD *)&v42[16], *(_QWORD *)&v42[24], *(_QWORD *)&v42[32]);
      }
    }
    ne_filter_cleanup((uint64_t)a1);
  }
}

uint64_t ne_filter_send_approved_frames(uint64_t a1, uint64_t a2)
{
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int *v14;
  int v15;
  NSObject *v16;
  _BOOL4 v17;
  int v18;
  NSObject *v19;
  _BOOL4 v20;
  int v21;
  int *v22;
  int v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  int v28;
  int *v29;
  NSObject *v30;
  const char *v31;
  uint32_t v32;
  uint64_t v33;
  int *v34;
  _QWORD *v35;
  uint64_t v36;
  int v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  int v42;
  int *v43;
  NSObject *v44;
  const char *v45;
  uint32_t v46;
  uint64_t v47;
  int *v48;
  _QWORD *v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  uint64_t result;
  uint64_t v54;
  int v55;
  NSObject *v56;
  _BOOL4 v57;
  int v58;
  NSObject *v59;
  _BOOL4 v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  _QWORD *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  NSObject *v70;
  uint32_t v71;
  int v72;
  _QWORD *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  _QWORD *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  int v85;
  const char *v86;
  NSObject *v87;
  uint32_t v88;
  int v89;
  int v90;
  _QWORD *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  _QWORD *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  int v102;
  const char *v103;
  NSObject *v104;
  uint32_t v105;
  int v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  int v120;
  int ip_protocol;
  uint64_t v122;
  int v123;
  int v124;
  _QWORD v125[2];
  _BYTE buf[18];
  __int16 v127;
  uint64_t v128;
  __int16 v129;
  uint64_t v130;
  __int16 v131;
  uint64_t v132;
  __int16 v133;
  uint64_t v134;
  __int16 v135;
  uint64_t v136;
  __int16 v137;
  uint64_t v138;
  __int16 v139;
  uint64_t v140;
  __int16 v141;
  uint64_t v142;
  __int16 v143;
  int v144;
  char out[40];
  uint64_t v146;

  v146 = *MEMORY[0x24BDAC8D0];
  memset(out, 0, 37);
  uuid_unparse((const unsigned __int8 *)a1, out);
  v4 = *(_DWORD *)(a1 + 176);
  v5 = ne_log_obj();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4 == 3)
  {
    if (!v6)
      goto LABEL_8;
    v7 = *(_QWORD *)(a1 + 80);
    if (v7)
      LODWORD(v7) = nw_parameters_get_ip_protocol();
    v8 = *(_QWORD **)(a1 + 160);
    if (v8)
    {
      v10 = v8[6];
      v11 = v8[7];
      v9 = v8[8];
      v12 = v8[9];
    }
    else
    {
      v9 = -1;
      v10 = -1;
      v11 = -1;
      v12 = -1;
    }
    v64 = *(_QWORD **)(a1 + 168);
    if (v64)
    {
      v66 = v64[6];
      v67 = v64[7];
      v65 = v64[8];
      v68 = v64[9];
    }
    else
    {
      v65 = -1;
      v66 = -1;
      v67 = -1;
      v68 = -1;
    }
    *(_DWORD *)buf = 136317442;
    *(_QWORD *)&buf[4] = out;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v7;
    v127 = 2048;
    v128 = v10;
    v129 = 2048;
    v130 = v11;
    v131 = 2048;
    v132 = v9;
    v133 = 2048;
    v134 = v12;
    v135 = 2048;
    v136 = v66;
    v137 = 2048;
    v138 = v67;
    v139 = 2048;
    v140 = v65;
    v141 = 2048;
    v142 = v68;
    v69 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]sending approved frames";
    v70 = v5;
    v71 = 98;
  }
  else
  {
    if (!v6)
      goto LABEL_8;
    v61 = *(_QWORD *)(a1 + 80);
    if (v61)
      LODWORD(v61) = nw_parameters_get_ip_protocol();
    v62 = *(unsigned int *)(a1 + 176);
    if (v62 > 3)
      v63 = "unknown";
    else
      v63 = (&off_24C0A1818)[v62];
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = out;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v61;
    v127 = 2080;
    v128 = (uint64_t)v63;
    v69 = "[filter %s %d %s] sending approved frames";
    v70 = v5;
    v71 = 28;
  }
  _os_log_debug_impl(&dword_208439000, v70, OS_LOG_TYPE_DEBUG, v69, buf, v71);
LABEL_8:
  v125[0] = 0;
  v125[1] = 0;
  nw_frame_array_init();
  if (a2)
    nw_frame_array_append_array();
  v13 = *(_QWORD *)(a1 + 144);
  if (v13)
  {
    v14 = &dword_208439000;
    while (1)
    {
      if (*(_DWORD *)(v13 + 40) != 3 || *(_QWORD *)(v13 + 64) == -1)
        goto LABEL_24;
      if ((nw_frame_array_is_empty() & 1) == 0)
        break;
LABEL_21:
      if (ne_filter_data_protocol_send_data(a1, v13, 0) && (*(_WORD *)(v13 + 144) & 4) != 0)
      {
        ne_filter_data_protocol_send_finished(a1, v13, 9u);
        *(_WORD *)(v13 + 144) &= ~4u;
      }
LABEL_24:
      if (*(_QWORD *)(v13 + 104) < *(_QWORD *)(v13 + 64) && (nw_frame_array_is_empty() & 1) == 0)
      {
        memset(out, 0, 37);
        uuid_unparse((const unsigned __int8 *)a1, out);
        v18 = *(_DWORD *)(a1 + 176);
        v19 = ne_log_obj();
        v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
        if (v18 == 3)
        {
          if (v20)
          {
            if (*(_QWORD *)(a1 + 80))
              ip_protocol = nw_parameters_get_ip_protocol();
            else
              ip_protocol = 0;
            v24 = *(_QWORD **)(a1 + 160);
            if (v24)
            {
              v114 = v24[7];
              v116 = v24[6];
              v33 = v24[8];
              v25 = v24[9];
              v118 = v33;
            }
            else
            {
              v25 = -1;
              v116 = -1;
              v118 = -1;
              v114 = -1;
            }
            v112 = v25;
            v34 = v14;
            v35 = *(_QWORD **)(a1 + 168);
            if (v35)
            {
              v107 = v35[7];
              v108 = v35[6];
              v36 = v35[9];
              v110 = v35[8];
            }
            else
            {
              v108 = -1;
              v110 = -1;
              v107 = -1;
              v36 = -1;
            }
            v37 = nw_frame_array_unclaimed_length();
            *(_DWORD *)buf = 136317698;
            *(_QWORD *)&buf[4] = out;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = ip_protocol;
            v127 = 2048;
            v128 = v116;
            v129 = 2048;
            v130 = v114;
            v131 = 2048;
            v132 = v118;
            v133 = 2048;
            v134 = v112;
            v135 = 2048;
            v136 = v108;
            v137 = 2048;
            v138 = v107;
            v139 = 2048;
            v140 = v110;
            v141 = 2048;
            v142 = v36;
            v143 = 1024;
            v144 = v37;
            v14 = v34;
            v29 = v34;
            v30 = v19;
            v31 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]have %u p"
                  "ending output bytes";
            v32 = 104;
            goto LABEL_53;
          }
        }
        else if (v20)
        {
          if (*(_QWORD *)(a1 + 80))
            v21 = nw_parameters_get_ip_protocol();
          else
            v21 = 0;
          v26 = *(unsigned int *)(a1 + 176);
          v27 = "unknown";
          if (v26 <= 3)
            v27 = (&off_24C0A1818)[v26];
          v28 = nw_frame_array_unclaimed_length();
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = out;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v21;
          v127 = 2080;
          v128 = (uint64_t)v27;
          v129 = 1024;
          LODWORD(v130) = v28;
          v14 = &dword_208439000;
          v29 = &dword_208439000;
          v30 = v19;
          v31 = "[filter %s %d %s] have %u pending output bytes";
          v32 = 34;
LABEL_53:
          _os_log_debug_impl(v29, v30, OS_LOG_TYPE_DEBUG, v31, buf, v32);
        }
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = 0;
        nw_frame_array_init();
        nw_frame_array_foreach();
        if ((nw_frame_array_is_empty() & 1) == 0)
          nw_frame_array_prepend_array();
      }
      if ((nw_frame_array_is_empty() & 1) == 0)
        *(_DWORD *)(a1 + 120) |= 0x2000u;
      v13 = *(_QWORD *)(v13 + 152);
      if (!v13)
        goto LABEL_67;
    }
    memset(out, 0, 37);
    uuid_unparse((const unsigned __int8 *)a1, out);
    v15 = *(_DWORD *)(a1 + 176);
    v16 = ne_log_obj();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);
    if (v15 == 3)
    {
      if (v17)
      {
        if (*(_QWORD *)(a1 + 80))
          v120 = nw_parameters_get_ip_protocol();
        else
          v120 = 0;
        v38 = *(_QWORD **)(a1 + 160);
        if (v38)
        {
          v115 = v38[7];
          v117 = v38[6];
          v47 = v38[8];
          v39 = v38[9];
          v119 = v47;
        }
        else
        {
          v39 = -1;
          v117 = -1;
          v119 = -1;
          v115 = -1;
        }
        v113 = v39;
        v48 = v14;
        v49 = *(_QWORD **)(a1 + 168);
        if (v49)
        {
          v50 = v49[7];
          v51 = v49[9];
          v109 = v49[6];
          v111 = v49[8];
        }
        else
        {
          v109 = -1;
          v111 = -1;
          v50 = -1;
          v51 = -1;
        }
        v52 = nw_frame_array_unclaimed_length();
        *(_DWORD *)buf = 136317698;
        *(_QWORD *)&buf[4] = out;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v120;
        v127 = 2048;
        v128 = v117;
        v129 = 2048;
        v130 = v115;
        v131 = 2048;
        v132 = v119;
        v133 = 2048;
        v134 = v113;
        v135 = 2048;
        v136 = v109;
        v137 = 2048;
        v138 = v50;
        v139 = 2048;
        v140 = v111;
        v141 = 2048;
        v142 = v51;
        v143 = 1024;
        v144 = v52;
        v14 = v48;
        v43 = v48;
        v44 = v16;
        v45 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]sending %u by"
              "tes to the next filter";
        v46 = 104;
LABEL_66:
        _os_log_debug_impl(v43, v44, OS_LOG_TYPE_DEBUG, v45, buf, v46);
      }
    }
    else if (v17)
    {
      v22 = v14;
      if (*(_QWORD *)(a1 + 80))
        v23 = nw_parameters_get_ip_protocol();
      else
        v23 = 0;
      v40 = *(unsigned int *)(a1 + 176);
      v41 = "unknown";
      if (v40 <= 3)
        v41 = (&off_24C0A1818)[v40];
      v42 = nw_frame_array_unclaimed_length();
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = out;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v23;
      v127 = 2080;
      v128 = (uint64_t)v41;
      v129 = 1024;
      LODWORD(v130) = v42;
      v14 = v22;
      v43 = v22;
      v44 = v16;
      v45 = "[filter %s %d %s] sending %u bytes to the next filter";
      v46 = 34;
      goto LABEL_66;
    }
    nw_frame_array_append_array();
    goto LABEL_21;
  }
LABEL_67:
  result = nw_frame_array_is_empty();
  if ((result & 1) == 0)
  {
    if ((*(_BYTE *)(a1 + 120) & 0x40) == 0)
    {
      v54 = *(_QWORD *)(a1 + 32);
      if (v54)
      {
        if (*(_QWORD *)(*(_QWORD *)(v54 + 24) + 96))
        {
          memset(out, 0, 37);
          uuid_unparse((const unsigned __int8 *)a1, out);
          v55 = *(_DWORD *)(a1 + 176);
          v56 = ne_log_obj();
          v57 = os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG);
          if (v55 == 3)
          {
            if (v57)
            {
              if (*(_QWORD *)(a1 + 80))
                v123 = nw_parameters_get_ip_protocol();
              else
                v123 = 0;
              v91 = *(_QWORD **)(a1 + 160);
              if (v91)
              {
                v92 = v91[6];
                v93 = v91[7];
                v94 = v91[9];
                v122 = v91[8];
              }
              else
              {
                v122 = -1;
                v92 = -1;
                v93 = -1;
                v94 = -1;
              }
              v97 = *(_QWORD **)(a1 + 168);
              if (v97)
              {
                v99 = v97[6];
                v100 = v97[7];
                v98 = v97[8];
                v101 = v97[9];
              }
              else
              {
                v98 = -1;
                v99 = -1;
                v100 = -1;
                v101 = -1;
              }
              v106 = nw_frame_array_unclaimed_length();
              *(_DWORD *)buf = 136317698;
              *(_QWORD *)&buf[4] = out;
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = v123;
              v127 = 2048;
              v128 = v92;
              v129 = 2048;
              v130 = v93;
              v131 = 2048;
              v132 = v122;
              v133 = 2048;
              v134 = v94;
              v135 = 2048;
              v136 = v99;
              v137 = 2048;
              v138 = v100;
              v139 = 2048;
              v140 = v98;
              v141 = 2048;
              v142 = v101;
              v143 = 1024;
              v144 = v106;
              v103 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]sendin"
                     "g %u bytes to the network";
              v104 = v56;
              v105 = 104;
LABEL_127:
              _os_log_debug_impl(&dword_208439000, v104, OS_LOG_TYPE_DEBUG, v103, buf, v105);
            }
          }
          else if (v57)
          {
            if (*(_QWORD *)(a1 + 80))
              v90 = nw_parameters_get_ip_protocol();
            else
              v90 = 0;
            v95 = *(unsigned int *)(a1 + 176);
            if (v95 > 3)
              v96 = "unknown";
            else
              v96 = (&off_24C0A1818)[v95];
            v102 = nw_frame_array_unclaimed_length();
            *(_DWORD *)buf = 136315906;
            *(_QWORD *)&buf[4] = out;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v90;
            v127 = 2080;
            v128 = (uint64_t)v96;
            v129 = 1024;
            LODWORD(v130) = v102;
            v103 = "[filter %s %d %s] sending %u bytes to the network";
            v104 = v56;
            v105 = 34;
            goto LABEL_127;
          }
          return (*(uint64_t (**)(uint64_t, _QWORD *))(*(_QWORD *)(v54 + 24) + 96))(v54, v125);
        }
      }
    }
    memset(out, 0, 37);
    uuid_unparse((const unsigned __int8 *)a1, out);
    v58 = *(_DWORD *)(a1 + 176);
    v59 = ne_log_obj();
    v60 = os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG);
    if (v58 == 3)
    {
      if (v60)
      {
        if (*(_QWORD *)(a1 + 80))
          v124 = nw_parameters_get_ip_protocol();
        else
          v124 = 0;
        v73 = *(_QWORD **)(a1 + 160);
        if (v73)
        {
          v75 = v73[6];
          v76 = v73[7];
          v74 = v73[8];
          v77 = v73[9];
        }
        else
        {
          v74 = -1;
          v75 = -1;
          v76 = -1;
          v77 = -1;
        }
        v80 = *(_QWORD **)(a1 + 168);
        if (v80)
        {
          v82 = v80[6];
          v83 = v80[7];
          v81 = v80[8];
          v84 = v80[9];
        }
        else
        {
          v81 = -1;
          v82 = -1;
          v83 = -1;
          v84 = -1;
        }
        v89 = nw_frame_array_unclaimed_length();
        *(_DWORD *)buf = 136317698;
        *(_QWORD *)&buf[4] = out;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v124;
        v127 = 2048;
        v128 = v75;
        v129 = 2048;
        v130 = v76;
        v131 = 2048;
        v132 = v74;
        v133 = 2048;
        v134 = v77;
        v135 = 2048;
        v136 = v82;
        v137 = 2048;
        v138 = v83;
        v139 = 2048;
        v140 = v81;
        v141 = 2048;
        v142 = v84;
        v143 = 1024;
        v144 = v89;
        v86 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]output protoc"
              "ol is disconnected or does not exist, dropping %u outbound bytes";
        v87 = v59;
        v88 = 104;
LABEL_111:
        _os_log_debug_impl(&dword_208439000, v87, OS_LOG_TYPE_DEBUG, v86, buf, v88);
      }
    }
    else if (v60)
    {
      if (*(_QWORD *)(a1 + 80))
        v72 = nw_parameters_get_ip_protocol();
      else
        v72 = 0;
      v78 = *(unsigned int *)(a1 + 176);
      if (v78 > 3)
        v79 = "unknown";
      else
        v79 = (&off_24C0A1818)[v78];
      v85 = nw_frame_array_unclaimed_length();
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = out;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v72;
      v127 = 2080;
      v128 = (uint64_t)v79;
      v129 = 1024;
      LODWORD(v130) = v85;
      v86 = "[filter %s %d %s] output protocol is disconnected or does not exist, dropping %u outbound bytes";
      v87 = v59;
      v88 = 34;
      goto LABEL_111;
    }
    return nw_frame_array_foreach();
  }
  return result;
}

void ne_filter_handle_output_finished(uint64_t a1)
{
  uint64_t v1;
  unsigned int *v3;
  unsigned int v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  int v26;
  NSObject *v27;
  _BOOL4 v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  NSObject *v53;
  uint32_t v54;
  const char *v55;
  NSObject *v56;
  uint32_t v57;
  _BYTE v58[40];
  uint64_t v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  uint64_t v65;
  __int16 v66;
  uint64_t v67;
  __int16 v68;
  uint64_t v69;
  char out[40];
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 40);
  if (!v1)
  {
    v23 = ne_log_obj();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v58 = 136315138;
      *(_QWORD *)&v58[4] = "ne_filter_handle_output_finished";
      _os_log_fault_impl(&dword_208439000, v23, OS_LOG_TYPE_FAULT, "%s called with null filter", v58, 0xCu);
    }
    return;
  }
  v3 = (unsigned int *)(v1 + 180);
  do
    v4 = __ldaxr(v3);
  while (__stlxr(v4, v3));
  if (!v4)
    return;
  v5 = *(_DWORD *)(v1 + 120);
  if ((v5 & 0x400) != 0 || *(_DWORD *)(v1 + 176) != 3 || (v6 = *(_QWORD *)(v1 + 144)) == 0)
  {
LABEL_12:
    *(_DWORD *)(v1 + 120) = v5 | 0x400;
    if ((v5 & 0x100) == 0)
      goto LABEL_25;
    *(_DWORD *)(v1 + 120) = v5 & 0xFFFFFAFF | 0x400;
    memset(out, 0, 37);
    uuid_unparse((const unsigned __int8 *)v1, out);
    v8 = *(_DWORD *)(v1 + 176);
    v9 = ne_log_obj();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
    if (v8 == 3)
    {
      if (v10)
      {
        v17 = *(_QWORD *)(v1 + 80);
        if (v17)
          LODWORD(v17) = nw_parameters_get_ip_protocol();
        v18 = *(_QWORD **)(v1 + 160);
        if (v18)
        {
          v20 = v18[6];
          v21 = v18[7];
          v19 = v18[8];
          v22 = v18[9];
        }
        else
        {
          v19 = -1;
          v20 = -1;
          v21 = -1;
          v22 = -1;
        }
        v42 = *(_QWORD **)(v1 + 168);
        if (v42)
        {
          v44 = v42[6];
          v45 = v42[7];
          v43 = v42[8];
          v46 = v42[9];
        }
        else
        {
          v43 = -1;
          v44 = -1;
          v45 = -1;
          v46 = -1;
        }
        *(_DWORD *)v58 = 136317442;
        *(_QWORD *)&v58[4] = out;
        *(_WORD *)&v58[12] = 1024;
        *(_DWORD *)&v58[14] = v17;
        *(_WORD *)&v58[18] = 2048;
        *(_QWORD *)&v58[20] = v20;
        *(_WORD *)&v58[28] = 2048;
        *(_QWORD *)&v58[30] = v21;
        *(_WORD *)&v58[38] = 2048;
        v59 = v19;
        v60 = 2048;
        v61 = v22;
        v62 = 2048;
        v63 = v44;
        v64 = 2048;
        v65 = v45;
        v66 = 2048;
        v67 = v43;
        v68 = 2048;
        v69 = v46;
        v52 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]calling outpu"
              "t_finished on output protocol";
        v53 = v9;
        v54 = 98;
LABEL_58:
        _os_log_debug_impl(&dword_208439000, v53, OS_LOG_TYPE_DEBUG, v52, v58, v54);
      }
    }
    else if (v10)
    {
      v36 = *(_QWORD *)(v1 + 80);
      if (v36)
        LODWORD(v36) = nw_parameters_get_ip_protocol();
      v37 = *(unsigned int *)(v1 + 176);
      if (v37 > 3)
        v38 = "unknown";
      else
        v38 = (&off_24C0A1818)[v37];
      *(_DWORD *)v58 = 136315650;
      *(_QWORD *)&v58[4] = out;
      *(_WORD *)&v58[12] = 1024;
      *(_DWORD *)&v58[14] = v36;
      *(_WORD *)&v58[18] = 2080;
      *(_QWORD *)&v58[20] = v38;
      v52 = "[filter %s %d %s] calling output_finished on output protocol";
      v53 = v9;
      v54 = 28;
      goto LABEL_58;
    }
    v24 = *(_QWORD *)(v1 + 32);
    if (v24)
    {
      v25 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(v24 + 24) + 192);
      if (v25)
        v25(v24, a1, v11, v12, v13, v14, v15, v16, *(_QWORD *)v58, *(_QWORD *)&v58[8], *(_QWORD *)&v58[16], *(_QWORD *)&v58[24], *(_QWORD *)&v58[32]);
    }
LABEL_25:
    if ((*(_DWORD *)(v1 + 120) & 0x30) != 0x10)
      return;
    *(_DWORD *)(v1 + 120) |= 0x20u;
    memset(out, 0, 37);
    uuid_unparse((const unsigned __int8 *)v1, out);
    v26 = *(_DWORD *)(v1 + 176);
    v27 = ne_log_obj();
    v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG);
    if (v26 == 3)
    {
      if (!v28)
        goto LABEL_33;
      v29 = *(_QWORD *)(v1 + 80);
      if (v29)
        LODWORD(v29) = nw_parameters_get_ip_protocol();
      v30 = *(_QWORD **)(v1 + 160);
      if (v30)
      {
        v32 = v30[6];
        v33 = v30[7];
        v31 = v30[8];
        v34 = v30[9];
      }
      else
      {
        v31 = -1;
        v32 = -1;
        v33 = -1;
        v34 = -1;
      }
      v47 = *(_QWORD **)(v1 + 168);
      if (v47)
      {
        v49 = v47[6];
        v50 = v47[7];
        v48 = v47[8];
        v51 = v47[9];
      }
      else
      {
        v48 = -1;
        v49 = -1;
        v50 = -1;
        v51 = -1;
      }
      *(_DWORD *)v58 = 136317442;
      *(_QWORD *)&v58[4] = out;
      *(_WORD *)&v58[12] = 1024;
      *(_DWORD *)&v58[14] = v29;
      *(_WORD *)&v58[18] = 2048;
      *(_QWORD *)&v58[20] = v32;
      *(_WORD *)&v58[28] = 2048;
      *(_QWORD *)&v58[30] = v33;
      *(_WORD *)&v58[38] = 2048;
      v59 = v31;
      v60 = 2048;
      v61 = v34;
      v62 = 2048;
      v63 = v49;
      v64 = 2048;
      v65 = v50;
      v66 = 2048;
      v67 = v48;
      v68 = 2048;
      v69 = v51;
      v55 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]calling disconn"
            "ect on output protocol";
      v56 = v27;
      v57 = 98;
    }
    else
    {
      if (!v28)
        goto LABEL_33;
      v39 = *(_QWORD *)(v1 + 80);
      if (v39)
        LODWORD(v39) = nw_parameters_get_ip_protocol();
      v40 = *(unsigned int *)(v1 + 176);
      if (v40 > 3)
        v41 = "unknown";
      else
        v41 = (&off_24C0A1818)[v40];
      *(_DWORD *)v58 = 136315650;
      *(_QWORD *)&v58[4] = out;
      *(_WORD *)&v58[12] = 1024;
      *(_DWORD *)&v58[14] = v39;
      *(_WORD *)&v58[18] = 2080;
      *(_QWORD *)&v58[20] = v41;
      v55 = "[filter %s %d %s] calling disconnect on output protocol";
      v56 = v27;
      v57 = 28;
    }
    _os_log_debug_impl(&dword_208439000, v56, OS_LOG_TYPE_DEBUG, v55, v58, v57);
LABEL_33:
    v35 = *(_QWORD *)(v1 + 32);
    if (v35)
    {
      if (*(_QWORD *)(*(_QWORD *)(v35 + 24) + 32))
        (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) + 32))();
    }
    return;
  }
  while (1)
  {
    if (*(_DWORD *)(v6 + 40) == 3 && *(_QWORD *)(v6 + 64) != -1)
    {
      v7 = *(_WORD *)(v6 + 144);
      if ((v7 & 0x40) == 0)
        break;
    }
    v6 = *(_QWORD *)(v6 + 152);
    if (!v6)
      goto LABEL_12;
  }
  *(_WORD *)(v6 + 144) = v7 | 4;
  ne_filter_send_approved_frames(v1, 0);
}

uint64_t ne_filter_read_approved_frames(uint64_t a1, uint64_t a2)
{
  uint64_t i;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  int v11;
  int v12;
  int v13;
  int v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  int v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  int v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  uint64_t result;
  int v39;
  NSObject *v40;
  _BOOL4 v41;
  int v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  _QWORD *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  const char *v56;
  NSObject *v57;
  uint32_t v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  int ip_protocol;
  int v66;
  int v67;
  _BYTE buf[18];
  __int16 v69;
  uint64_t v70;
  __int16 v71;
  uint64_t v72;
  __int16 v73;
  uint64_t v74;
  __int16 v75;
  uint64_t v76;
  __int16 v77;
  uint64_t v78;
  __int16 v79;
  uint64_t v80;
  __int16 v81;
  uint64_t v82;
  __int16 v83;
  uint64_t v84;
  __int16 v85;
  int v86;
  unsigned int out[10];
  uint64_t v88;

  v88 = *MEMORY[0x24BDAC8D0];
  nw_frame_array_init();
  if (a2 && nw_frame_array_unclaimed_length())
    nw_frame_array_append_array();
  for (i = *(_QWORD *)(a1 + 144); i; i = *(_QWORD *)(i + 152))
  {
    if (*(_DWORD *)(i + 40) == 3 && *(_QWORD *)(i + 48) != -1)
    {
      if ((nw_frame_array_is_empty() & 1) == 0)
      {
        memset(out, 0, 37);
        uuid_unparse((const unsigned __int8 *)a1, (char *)out);
        v5 = *(_DWORD *)(a1 + 176);
        v6 = ne_log_obj();
        v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
        if (v5 == 3)
        {
          if (v7)
          {
            if (*(_QWORD *)(a1 + 80))
              ip_protocol = nw_parameters_get_ip_protocol();
            else
              ip_protocol = 0;
            v26 = *(_QWORD **)(a1 + 160);
            if (v26)
            {
              v27 = v26[7];
              v28 = v26[9];
              v62 = v26[6];
              v64 = v26[8];
            }
            else
            {
              v62 = -1;
              v64 = -1;
              v27 = -1;
              v28 = -1;
            }
            v32 = *(_QWORD **)(a1 + 168);
            if (v32)
            {
              v34 = v32[6];
              v35 = v32[7];
              v33 = v32[8];
              v36 = v32[9];
            }
            else
            {
              v33 = -1;
              v34 = -1;
              v35 = -1;
              v36 = -1;
            }
            v37 = nw_frame_array_unclaimed_length();
            *(_DWORD *)buf = 136317698;
            *(_QWORD *)&buf[4] = out;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = ip_protocol;
            v69 = 2048;
            v70 = v62;
            v71 = 2048;
            v72 = v27;
            v73 = 2048;
            v74 = v64;
            v75 = 2048;
            v76 = v28;
            v77 = 2048;
            v78 = v34;
            v79 = 2048;
            v80 = v35;
            v81 = 2048;
            v82 = v33;
            v83 = 2048;
            v84 = v36;
            v85 = 1024;
            v86 = v37;
            _os_log_debug_impl(&dword_208439000, v6, OS_LOG_TYPE_DEBUG, "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]sending %u input bytes to the next filter", buf, 0x68u);
          }
        }
        else if (v7)
        {
          if (*(_QWORD *)(a1 + 80))
            v14 = nw_parameters_get_ip_protocol();
          else
            v14 = 0;
          v29 = *(unsigned int *)(a1 + 176);
          v30 = "unknown";
          if (v29 <= 3)
            v30 = (&off_24C0A1818)[v29];
          v31 = nw_frame_array_unclaimed_length();
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = out;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v14;
          v69 = 2080;
          v70 = (uint64_t)v30;
          v71 = 1024;
          LODWORD(v72) = v31;
          _os_log_debug_impl(&dword_208439000, v6, OS_LOG_TYPE_DEBUG, "[filter %s %d %s] sending %u input bytes to the next filter", buf, 0x22u);
        }
        nw_frame_array_append_array();
      }
      if (ne_filter_data_protocol_send_data(a1, i, 1) && (*(_WORD *)(i + 144) & 8) != 0)
      {
        ne_filter_data_protocol_send_finished(a1, i, 0xAu);
        *(_WORD *)(i + 144) &= ~8u;
      }
    }
    if (*(_QWORD *)(i + 88) < *(_QWORD *)(i + 48) && (nw_frame_array_is_empty() & 1) == 0)
    {
      memset(out, 0, 37);
      uuid_unparse((const unsigned __int8 *)a1, (char *)out);
      v8 = *(_DWORD *)(a1 + 176);
      v9 = ne_log_obj();
      v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
      if (v8 == 3)
      {
        if (v10)
        {
          if (*(_QWORD *)(a1 + 80))
            v66 = nw_parameters_get_ip_protocol();
          else
            v66 = 0;
          v15 = *(_QWORD **)(a1 + 160);
          if (v15)
          {
            v60 = v15[7];
            v61 = v15[6];
            v16 = v15[9];
            v63 = v15[8];
          }
          else
          {
            v61 = -1;
            v63 = -1;
            v60 = -1;
            v16 = -1;
          }
          v20 = *(_QWORD **)(a1 + 168);
          if (v20)
          {
            v22 = v20[6];
            v23 = v20[7];
            v21 = v20[8];
            v24 = v20[9];
          }
          else
          {
            v21 = -1;
            v22 = -1;
            v23 = -1;
            v24 = -1;
          }
          v25 = nw_frame_array_unclaimed_length();
          *(_DWORD *)buf = 136317698;
          *(_QWORD *)&buf[4] = out;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v66;
          v69 = 2048;
          v70 = v61;
          v71 = 2048;
          v72 = v60;
          v73 = 2048;
          v74 = v63;
          v75 = 2048;
          v76 = v16;
          v77 = 2048;
          v78 = v22;
          v79 = 2048;
          v80 = v23;
          v81 = 2048;
          v82 = v21;
          v83 = 2048;
          v84 = v24;
          v85 = 1024;
          v86 = v25;
          _os_log_debug_impl(&dword_208439000, v9, OS_LOG_TYPE_DEBUG, "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]have %u pending input bytes", buf, 0x68u);
        }
      }
      else if (v10)
      {
        if (*(_QWORD *)(a1 + 80))
          v13 = nw_parameters_get_ip_protocol();
        else
          v13 = 0;
        v17 = *(unsigned int *)(a1 + 176);
        v18 = "unknown";
        if (v17 <= 3)
          v18 = (&off_24C0A1818)[v17];
        v19 = nw_frame_array_unclaimed_length();
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = out;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v13;
        v69 = 2080;
        v70 = (uint64_t)v18;
        v71 = 1024;
        LODWORD(v72) = v19;
        _os_log_debug_impl(&dword_208439000, v9, OS_LOG_TYPE_DEBUG, "[filter %s %d %s] have %u pending input bytes", buf, 0x22u);
      }
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
      nw_frame_array_init();
      v11 = *(_DWORD *)(i + 48) - *(_DWORD *)(i + 88);
      out[0] = 0;
      v12 = ne_filter_protocol_fulfill_frame_request(a1, i + 24, (uint64_t)buf, (*(_DWORD *)(a1 + 120) & 0x8000) == 0, v11, -1, out);
      *(_QWORD *)(i + 88) += out[0];
      if (v12)
        nw_frame_array_prepend_array();
    }
    if ((nw_frame_array_is_empty() & 1) == 0)
      *(_DWORD *)(a1 + 120) |= 0x1000u;
  }
  result = nw_frame_array_is_empty();
  if ((result & 1) == 0)
  {
    memset(out, 0, 37);
    uuid_unparse((const unsigned __int8 *)a1, (char *)out);
    v39 = *(_DWORD *)(a1 + 176);
    v40 = ne_log_obj();
    v41 = os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG);
    if (v39 == 3)
    {
      if (v41)
      {
        if (*(_QWORD *)(a1 + 80))
          v67 = nw_parameters_get_ip_protocol();
        else
          v67 = 0;
        v43 = *(_QWORD **)(a1 + 160);
        if (v43)
        {
          v45 = v43[6];
          v46 = v43[7];
          v44 = v43[8];
          v47 = v43[9];
        }
        else
        {
          v44 = -1;
          v45 = -1;
          v46 = -1;
          v47 = -1;
        }
        v50 = *(_QWORD **)(a1 + 168);
        if (v50)
        {
          v52 = v50[6];
          v53 = v50[7];
          v51 = v50[8];
          v54 = v50[9];
        }
        else
        {
          v51 = -1;
          v52 = -1;
          v53 = -1;
          v54 = -1;
        }
        v59 = nw_frame_array_unclaimed_length();
        *(_DWORD *)buf = 136317698;
        *(_QWORD *)&buf[4] = out;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v67;
        v69 = 2048;
        v70 = v45;
        v71 = 2048;
        v72 = v46;
        v73 = 2048;
        v74 = v44;
        v75 = 2048;
        v76 = v47;
        v77 = 2048;
        v78 = v52;
        v79 = 2048;
        v80 = v53;
        v81 = 2048;
        v82 = v51;
        v83 = 2048;
        v84 = v54;
        v85 = 1024;
        v86 = v59;
        v56 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]accepting %u input bytes";
        v57 = v40;
        v58 = 104;
LABEL_81:
        _os_log_debug_impl(&dword_208439000, v57, OS_LOG_TYPE_DEBUG, v56, buf, v58);
      }
    }
    else if (v41)
    {
      if (*(_QWORD *)(a1 + 80))
        v42 = nw_parameters_get_ip_protocol();
      else
        v42 = 0;
      v48 = *(unsigned int *)(a1 + 176);
      if (v48 > 3)
        v49 = "unknown";
      else
        v49 = (&off_24C0A1818)[v48];
      v55 = nw_frame_array_unclaimed_length();
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = out;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v42;
      v69 = 2080;
      v70 = (uint64_t)v49;
      v71 = 1024;
      LODWORD(v72) = v55;
      v56 = "[filter %s %d %s] accepting %u input bytes";
      v57 = v40;
      v58 = 34;
      goto LABEL_81;
    }
    return nw_frame_array_append_array();
  }
  return result;
}

void ne_filter_handle_input_finished(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unsigned int *v4;
  unsigned int v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  int v9;
  int v10;
  NSObject *v11;
  _BOOL4 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t i;
  int v31;
  NSObject *v32;
  _BOOL4 v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(void);
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  _QWORD *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  NSObject *v60;
  uint32_t v61;
  const char *v62;
  NSObject *v63;
  uint32_t v64;
  _BYTE v65[40];
  uint64_t v66;
  __int16 v67;
  uint64_t v68;
  __int16 v69;
  uint64_t v70;
  __int16 v71;
  uint64_t v72;
  __int16 v73;
  uint64_t v74;
  __int16 v75;
  uint64_t v76;
  char out[40];
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    v25 = ne_log_obj();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      return;
    *(_DWORD *)v65 = 136315138;
    *(_QWORD *)&v65[4] = "ne_filter_handle_input_finished";
    v26 = "%s called with null protocol";
    goto LABEL_30;
  }
  v3 = *(_QWORD *)(a1 + 40);
  if (!v3)
  {
    v25 = ne_log_obj();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      return;
    *(_DWORD *)v65 = 136315138;
    *(_QWORD *)&v65[4] = "ne_filter_handle_input_finished";
    v26 = "%s called with null filter";
LABEL_30:
    _os_log_fault_impl(&dword_208439000, v25, OS_LOG_TYPE_FAULT, v26, v65, 0xCu);
    return;
  }
  v4 = (unsigned int *)(v3 + 180);
  do
    v5 = __ldaxr(v4);
  while (__stlxr(v5, v4));
  if (!v5)
    return;
  v6 = *(_DWORD *)(v3 + 120);
  if ((v6 & 0x800) != 0 || *(_DWORD *)(v3 + 176) != 3 || (v7 = *(_QWORD *)(v3 + 144)) == 0)
  {
LABEL_13:
    *(_DWORD *)(v3 + 120) = v6 | 0x800;
    if (a2 && nw_frame_array_unclaimed_length())
      nw_frame_array_append_array();
    v9 = *(_DWORD *)(v3 + 120);
    if ((v9 & 0x10) == 0)
    {
      if (!nw_frame_array_is_empty())
      {
        ne_filter_protocol_input_available(a1);
        return;
      }
      v9 = *(_DWORD *)(v3 + 120);
    }
    if ((v9 & 0x200) == 0)
    {
LABEL_37:
      if ((*(_DWORD *)(v3 + 120) & 0xC0) != 0x40)
        return;
      *(_DWORD *)(v3 + 120) |= 0x80u;
      for (i = *(_QWORD *)(v3 + 144); i; i = *(_QWORD *)(i + 152))
        ne_filter_data_protocol_send_finished(a1, i, 0xBu);
      memset(out, 0, 37);
      uuid_unparse((const unsigned __int8 *)v3, out);
      v31 = *(_DWORD *)(v3 + 176);
      v32 = ne_log_obj();
      v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG);
      if (v31 == 3)
      {
        if (v33)
        {
          v34 = *(_QWORD *)(v3 + 80);
          if (v34)
            LODWORD(v34) = nw_parameters_get_ip_protocol();
          v35 = *(_QWORD **)(v3 + 160);
          if (v35)
          {
            v37 = v35[6];
            v38 = v35[7];
            v36 = v35[8];
            v39 = v35[9];
          }
          else
          {
            v36 = -1;
            v37 = -1;
            v38 = -1;
            v39 = -1;
          }
          v54 = *(_QWORD **)(v3 + 168);
          if (v54)
          {
            v56 = v54[6];
            v57 = v54[7];
            v55 = v54[8];
            v58 = v54[9];
          }
          else
          {
            v55 = -1;
            v56 = -1;
            v57 = -1;
            v58 = -1;
          }
          *(_DWORD *)v65 = 136317442;
          *(_QWORD *)&v65[4] = out;
          *(_WORD *)&v65[12] = 1024;
          *(_DWORD *)&v65[14] = v34;
          *(_WORD *)&v65[18] = 2048;
          *(_QWORD *)&v65[20] = v37;
          *(_WORD *)&v65[28] = 2048;
          *(_QWORD *)&v65[30] = v38;
          *(_WORD *)&v65[38] = 2048;
          v66 = v36;
          v67 = 2048;
          v68 = v39;
          v69 = 2048;
          v70 = v56;
          v71 = 2048;
          v72 = v57;
          v73 = 2048;
          v74 = v55;
          v75 = 2048;
          v76 = v58;
          v62 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]calling dis"
                "connected on input protocol";
          v63 = v32;
          v64 = 98;
LABEL_76:
          _os_log_debug_impl(&dword_208439000, v63, OS_LOG_TYPE_DEBUG, v62, v65, v64);
        }
      }
      else if (v33)
      {
        v46 = *(_QWORD *)(v3 + 80);
        if (v46)
          LODWORD(v46) = nw_parameters_get_ip_protocol();
        v47 = *(unsigned int *)(v3 + 176);
        if (v47 > 3)
          v48 = "unknown";
        else
          v48 = (&off_24C0A1818)[v47];
        *(_DWORD *)v65 = 136315650;
        *(_QWORD *)&v65[4] = out;
        *(_WORD *)&v65[12] = 1024;
        *(_DWORD *)&v65[14] = v46;
        *(_WORD *)&v65[18] = 2080;
        *(_QWORD *)&v65[20] = v48;
        v62 = "[filter %s %d %s] calling disconnected on input protocol";
        v63 = v32;
        v64 = 28;
        goto LABEL_76;
      }
      v40 = *(_QWORD *)(v3 + 48);
      if (v40)
      {
        v41 = *(_QWORD *)(v40 + 24);
        if (v41)
        {
          v42 = *(void (**)(void))(v41 + 48);
          if (v42)
            v42();
        }
      }
      return;
    }
    *(_DWORD *)(v3 + 120) = v9 & 0xFFFFFDFF;
    memset(out, 0, 37);
    uuid_unparse((const unsigned __int8 *)v3, out);
    v10 = *(_DWORD *)(v3 + 176);
    v11 = ne_log_obj();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
    if (v10 == 3)
    {
      if (v12)
      {
        v19 = *(_QWORD *)(v3 + 80);
        if (v19)
          LODWORD(v19) = nw_parameters_get_ip_protocol();
        v20 = *(_QWORD **)(v3 + 160);
        if (v20)
        {
          v22 = v20[6];
          v23 = v20[7];
          v21 = v20[8];
          v24 = v20[9];
        }
        else
        {
          v21 = -1;
          v22 = -1;
          v23 = -1;
          v24 = -1;
        }
        v49 = *(_QWORD **)(v3 + 168);
        if (v49)
        {
          v51 = v49[6];
          v52 = v49[7];
          v50 = v49[8];
          v53 = v49[9];
        }
        else
        {
          v50 = -1;
          v51 = -1;
          v52 = -1;
          v53 = -1;
        }
        *(_DWORD *)v65 = 136317442;
        *(_QWORD *)&v65[4] = out;
        *(_WORD *)&v65[12] = 1024;
        *(_DWORD *)&v65[14] = v19;
        *(_WORD *)&v65[18] = 2048;
        *(_QWORD *)&v65[20] = v22;
        *(_WORD *)&v65[28] = 2048;
        *(_QWORD *)&v65[30] = v23;
        *(_WORD *)&v65[38] = 2048;
        v66 = v21;
        v67 = 2048;
        v68 = v24;
        v69 = 2048;
        v70 = v51;
        v71 = 2048;
        v72 = v52;
        v73 = 2048;
        v74 = v50;
        v75 = 2048;
        v76 = v53;
        v59 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]calling input"
              "_finished on input protocol";
        v60 = v11;
        v61 = 98;
LABEL_73:
        _os_log_debug_impl(&dword_208439000, v60, OS_LOG_TYPE_DEBUG, v59, v65, v61);
      }
    }
    else if (v12)
    {
      v43 = *(_QWORD *)(v3 + 80);
      if (v43)
        LODWORD(v43) = nw_parameters_get_ip_protocol();
      v44 = *(unsigned int *)(v3 + 176);
      if (v44 > 3)
        v45 = "unknown";
      else
        v45 = (&off_24C0A1818)[v44];
      *(_DWORD *)v65 = 136315650;
      *(_QWORD *)&v65[4] = out;
      *(_WORD *)&v65[12] = 1024;
      *(_DWORD *)&v65[14] = v43;
      *(_WORD *)&v65[18] = 2080;
      *(_QWORD *)&v65[20] = v45;
      v59 = "[filter %s %d %s] calling input_finished on input protocol";
      v60 = v11;
      v61 = 28;
      goto LABEL_73;
    }
    v27 = *(_QWORD *)(v3 + 48);
    if (v27)
    {
      v28 = *(_QWORD *)(v27 + 24);
      if (v28)
      {
        v29 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(v28 + 184);
        if (v29)
          v29(v27, a1, v13, v14, v15, v16, v17, v18, *(_QWORD *)v65, *(_QWORD *)&v65[8], *(_QWORD *)&v65[16], *(_QWORD *)&v65[24], *(_QWORD *)&v65[32]);
      }
    }
    goto LABEL_37;
  }
  while (1)
  {
    if (*(_DWORD *)(v7 + 40) == 3 && *(_QWORD *)(v7 + 48) != -1)
    {
      v8 = *(_WORD *)(v7 + 144);
      if ((v8 & 0x80) == 0)
        break;
    }
    v7 = *(_QWORD *)(v7 + 152);
    if (!v7)
      goto LABEL_13;
  }
  *(_WORD *)(v7 + 144) = v8 | 8;
  ne_filter_read_approved_frames(v3, a2);
}

void ne_filter_cleanup(uint64_t a1)
{
  uint64_t v2;
  unsigned int *v3;
  unsigned int v4;
  uint64_t v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  void (*v18)(uint64_t, uint64_t, uint64_t);
  uint64_t v19;
  unsigned int *v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  NSObject *v34;
  uint32_t v35;
  int v36;
  char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  char out[40];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    v16 = ne_log_obj();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      return;
    v36 = 136315138;
    v37 = "ne_filter_cleanup";
    v17 = "%s called with null protocol";
    goto LABEL_35;
  }
  v2 = *(_QWORD *)(a1 + 40);
  if (!v2)
  {
    v16 = ne_log_obj();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      return;
    v36 = 136315138;
    v37 = "ne_filter_cleanup";
    v17 = "%s called with null filter";
LABEL_35:
    _os_log_fault_impl(&dword_208439000, v16, OS_LOG_TYPE_FAULT, v17, (uint8_t *)&v36, 0xCu);
    return;
  }
  v3 = (unsigned int *)(v2 + 180);
  do
    v4 = __ldaxr(v3);
  while (__stlxr(v4, v3));
  if (!v4)
    return;
  if ((~*(_DWORD *)(v2 + 120) & 0x10001) != 0 || (*(_DWORD *)(v2 + 120) & 0x88) == 8)
    return;
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    memset(out, 0, 37);
    uuid_unparse((const unsigned __int8 *)v2, out);
    v7 = *(_DWORD *)(v2 + 176);
    v8 = ne_log_obj();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
    if (v7 == 3)
    {
      if (v9)
      {
        v10 = *(_QWORD *)(v2 + 80);
        if (v10)
          LODWORD(v10) = nw_parameters_get_ip_protocol();
        v11 = *(_QWORD **)(v2 + 160);
        if (v11)
        {
          v13 = v11[6];
          v14 = v11[7];
          v12 = v11[8];
          v15 = v11[9];
        }
        else
        {
          v12 = -1;
          v13 = -1;
          v14 = -1;
          v15 = -1;
        }
        v28 = *(_QWORD **)(v2 + 168);
        if (v28)
        {
          v30 = v28[6];
          v31 = v28[7];
          v29 = v28[8];
          v32 = v28[9];
        }
        else
        {
          v29 = -1;
          v30 = -1;
          v31 = -1;
          v32 = -1;
        }
        v36 = 136317442;
        v37 = out;
        v38 = 1024;
        v39 = v10;
        v40 = 2048;
        v41 = v13;
        v42 = 2048;
        v43 = v14;
        v44 = 2048;
        v45 = v12;
        v46 = 2048;
        v47 = v15;
        v48 = 2048;
        v49 = v30;
        v50 = 2048;
        v51 = v31;
        v52 = 2048;
        v53 = v29;
        v54 = 2048;
        v55 = v32;
        v33 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]tearing down output handler";
        v34 = v8;
        v35 = 98;
LABEL_47:
        _os_log_debug_impl(&dword_208439000, v34, OS_LOG_TYPE_DEBUG, v33, (uint8_t *)&v36, v35);
      }
    }
    else if (v9)
    {
      v25 = *(_QWORD *)(v2 + 80);
      if (v25)
        LODWORD(v25) = nw_parameters_get_ip_protocol();
      v26 = *(unsigned int *)(v2 + 176);
      if (v26 > 3)
        v27 = "unknown";
      else
        v27 = (&off_24C0A1818)[v26];
      v36 = 136315650;
      v37 = out;
      v38 = 1024;
      v39 = v25;
      v40 = 2080;
      v41 = (uint64_t)v27;
      v33 = "[filter %s %d %s] tearing down output handler";
      v34 = v8;
      v35 = 28;
      goto LABEL_47;
    }
    v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 + 24) + 8);
    if (v18)
      v18(v6, a1, 1);
    *(_QWORD *)(a1 + 32) = 0;
  }
  ne_filter_unregister_flow(*(_QWORD *)(v2 + 96), a1);
  v19 = *(_QWORD *)(a1 + 40);
  if (v19)
  {
    v20 = (unsigned int *)(v19 + 180);
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21, v20));
    if (v21)
    {
      do
      {
        v22 = __ldaxr(v20);
        v23 = v22 - 1;
      }
      while (__stlxr(v23, v20));
      if (!v23)
        ne_filter_protocol_destroy(a1);
    }
  }
  else
  {
    v24 = ne_log_obj();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      LOWORD(v36) = 0;
      _os_log_impl(&dword_208439000, v24, OS_LOG_TYPE_INFO, "filter is null", (uint8_t *)&v36, 2u);
    }
  }
}

BOOL ne_filter_data_protocol_send_data(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  int v4;
  unsigned int *v7;
  unsigned int v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  unint64_t v13;
  unsigned int v14;
  unint64_t v15;
  int v16;
  NSObject *v17;
  _BOOL4 v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  _BOOL8 result;
  int v27;
  NSObject *v28;
  _BOOL4 v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  BOOL v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  int v45;
  _BOOL4 v46;
  unsigned int v47;
  uint64_t v48;
  _QWORD *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  NSObject *v55;
  _BOOL4 v56;
  uint64_t v57;
  _QWORD *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  int v66;
  NSObject *v67;
  _BOOL4 v68;
  uint64_t v69;
  _QWORD *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  size_t v76;
  NSObject *v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  int v81;
  NSObject *v82;
  _BOOL4 v83;
  uint64_t v84;
  _QWORD *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  size_t v91;
  size_t v92;
  size_t v93;
  uint64_t v94;
  unsigned int v95;
  unsigned int v96;
  size_t v97;
  uint64_t v98;
  xpc_object_t v101;
  unsigned int ip_protocol;
  int v103;
  NSObject *v104;
  _BOOL4 v105;
  uint64_t v106;
  _QWORD *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  int v115;
  NSObject *v116;
  _BOOL4 v117;
  uint64_t v118;
  _QWORD *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  int v124;
  NSObject *v125;
  _BOOL4 v126;
  uint64_t v127;
  _QWORD *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  const char *v138;
  unsigned int v139;
  NSObject *v140;
  const sockaddr *address;
  NSObject *v142;
  nw_endpoint_type_t type;
  NSObject *v144;
  const sockaddr *v145;
  const sockaddr *v146;
  size_t sa_len;
  int *v148;
  int v149;
  NSObject *v150;
  _BOOL4 v151;
  uint64_t *v152;
  uint64_t v153;
  _QWORD *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  int v159;
  NSObject *v160;
  _BOOL4 v161;
  uint64_t v162;
  _QWORD *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  const char *v170;
  int v171;
  int v172;
  _QWORD *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  const char *v178;
  const char *v179;
  NSObject *v180;
  uint32_t v181;
  const char *v182;
  _QWORD *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  _QWORD *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  const char *v193;
  uint64_t v194;
  uint64_t v195;
  const char *v196;
  const char *v197;
  const char *v198;
  NSObject *v199;
  uint32_t v200;
  const char *v201;
  const char *v202;
  NSObject *v203;
  int v204;
  unsigned int v205;
  os_unfair_lock_s *v206;
  unsigned int v207;
  _QWORD *v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  _QWORD *v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  const char *v218;
  const char *v219;
  NSObject *v220;
  const char *v221;
  uint32_t v222;
  const char *v223;
  const char *v224;
  _QWORD *v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  const char *v230;
  const char *v231;
  NSObject *v232;
  uint32_t v233;
  const char *v234;
  uint64_t v235;
  uint64_t v236;
  const char *v237;
  uint64_t v238;
  uint64_t v239;
  const char *v240;
  uint64_t v241;
  uint64_t v242;
  const char *v243;
  _QWORD *v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  _QWORD *v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  _QWORD *v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  _QWORD *v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  _QWORD *v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  const char *v270;
  NSObject *v271;
  uint32_t v272;
  uint64_t v273;
  const char *v274;
  NSObject *v275;
  uint32_t v276;
  uint64_t v277;
  const char *v278;
  NSObject *v279;
  uint32_t v280;
  uint64_t v281;
  const char *v282;
  NSObject *v283;
  uint32_t v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  NSObject *log;
  unint64_t v290;
  char *v291;
  _QWORD *v292;
  size_t v293;
  unsigned int v294;
  uint64_t *v295;
  uint64_t *v296;
  int v297;
  _QWORD v298[8];
  unsigned int v299;
  uint8_t v300[16];
  _BYTE buf[38];
  __int16 v302;
  unint64_t v303;
  __int16 v304;
  uint64_t v305;
  __int16 v306;
  uint64_t v307;
  __int16 v308;
  uint64_t v309;
  __int16 v310;
  uint64_t v311;
  __int16 v312;
  uint64_t v313;
  __int16 v314;
  size_t v315;
  __int16 v316;
  unint64_t v317;
  __int16 v318;
  unint64_t v319;
  unsigned int out[10];
  uint64_t v321;

  v321 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 40);
  if (!v3)
  {
    v25 = ne_log_obj();
    result = os_log_type_enabled(v25, OS_LOG_TYPE_INFO);
    if (!result)
      return result;
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_208439000, v25, OS_LOG_TYPE_INFO, "filter is null", buf, 2u);
    return 0;
  }
  v4 = a3;
  v7 = (unsigned int *)(v3 + 180);
  do
    v8 = __ldaxr(v7);
  while (__stlxr(v8, v7));
  if (!v8)
    return 0;
  v9 = 104;
  if (a3)
    v9 = 88;
  v10 = *(_QWORD *)(a2 + v9);
  v11 = 112;
  if (a3)
    v11 = 96;
  v295 = (uint64_t *)(a2 + 96);
  v296 = (uint64_t *)(a2 + 112);
  if (a3)
    v12 = (_QWORD *)(a2 + 96);
  else
    v12 = (_QWORD *)(a2 + 112);
  v13 = *(_QWORD *)(a2 + v11);
  v14 = nw_frame_array_unclaimed_length();
  if (!v14)
  {
    memset(out, 0, 37);
    uuid_unparse((const unsigned __int8 *)v3, (char *)out);
    v27 = *(_DWORD *)(v3 + 176);
    v28 = ne_log_obj();
    v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG);
    if (v27 == 3)
    {
      if (v29)
      {
        v30 = *(_QWORD *)(v3 + 80);
        if (v30)
          LODWORD(v30) = nw_parameters_get_ip_protocol();
        v31 = *(_QWORD **)(v3 + 160);
        if (v31)
        {
          v33 = v31[6];
          v34 = v31[7];
          v32 = v31[8];
          v35 = v31[9];
        }
        else
        {
          v32 = -1;
          v33 = -1;
          v34 = -1;
          v35 = -1;
        }
        v173 = *(_QWORD **)(v3 + 168);
        if (v173)
        {
          v175 = v173[6];
          v176 = v173[7];
          v174 = v173[8];
          v177 = v173[9];
        }
        else
        {
          v174 = -1;
          v175 = -1;
          v176 = -1;
          v177 = -1;
        }
        *(_QWORD *)&buf[4] = out;
        v182 = "out";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)buf = 136317698;
        if (v4)
          v182 = "in";
        *(_DWORD *)&buf[14] = v30;
        *(_WORD *)&buf[18] = 2048;
        *(_QWORD *)&buf[20] = v33;
        *(_WORD *)&buf[28] = 2048;
        *(_QWORD *)&buf[30] = v34;
        v302 = 2048;
        v303 = v32;
        v304 = 2048;
        v305 = v35;
        v306 = 2048;
        v307 = v175;
        v308 = 2048;
        v309 = v176;
        v310 = 2048;
        v311 = v174;
        v312 = 2048;
        v313 = v177;
        v314 = 2080;
        v315 = (size_t)v182;
        v179 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]no %sbound p"
               "ending bytes to filter";
        v180 = v28;
        v181 = 108;
        goto LABEL_245;
      }
    }
    else if (v29)
    {
      v36 = *(_QWORD *)(v3 + 80);
      if (v36)
        LODWORD(v36) = nw_parameters_get_ip_protocol();
      v37 = *(unsigned int *)(v3 + 176);
      if (v37 > 3)
        v38 = "unknown";
      else
        v38 = (&off_24C0A1818)[v37];
      v178 = "out";
      *(_QWORD *)&buf[4] = out;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)buf = 136315906;
      if (v4)
        v178 = "in";
      *(_DWORD *)&buf[14] = v36;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = v38;
      *(_WORD *)&buf[28] = 2080;
      *(_QWORD *)&buf[30] = v178;
      v179 = "[filter %s %d %s] no %sbound pending bytes to filter";
      v180 = v28;
      v181 = 38;
      goto LABEL_245;
    }
    return 1;
  }
  v292 = v12;
  v294 = v14;
  v297 = v4;
  if (v13 >= v10)
  {
    v15 = v13;
    goto LABEL_37;
  }
  v15 = v10;
  memset(out, 0, 37);
  uuid_unparse((const unsigned __int8 *)v3, (char *)out);
  v16 = *(_DWORD *)(v3 + 176);
  v17 = ne_log_obj();
  v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
  if (v16 == 3)
  {
    if (v18)
    {
      v19 = *(_QWORD *)(v3 + 80);
      if (v19)
        LODWORD(v19) = nw_parameters_get_ip_protocol();
      v20 = *(_QWORD **)(v3 + 160);
      if (v20)
      {
        v22 = v20[6];
        v23 = v20[7];
        v21 = v20[8];
        v24 = v20[9];
      }
      else
      {
        v21 = -1;
        v22 = -1;
        v23 = -1;
        v24 = -1;
      }
      v183 = *(_QWORD **)(v3 + 168);
      if (v183)
      {
        v185 = v183[6];
        v186 = v183[7];
        v184 = v183[8];
        v187 = v183[9];
      }
      else
      {
        v184 = -1;
        v185 = -1;
        v186 = -1;
        v187 = -1;
      }
      *(_QWORD *)&buf[4] = out;
      v201 = "out";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)buf = 136318210;
      if (v297)
        v201 = "in";
      *(_DWORD *)&buf[14] = v19;
      *(_WORD *)&buf[18] = 2048;
      *(_QWORD *)&buf[20] = v22;
      *(_WORD *)&buf[28] = 2048;
      *(_QWORD *)&buf[30] = v23;
      v302 = 2048;
      v303 = v21;
      v304 = 2048;
      v305 = v24;
      v306 = 2048;
      v307 = v185;
      v308 = 2048;
      v309 = v186;
      v310 = 2048;
      v311 = v184;
      v312 = 2048;
      v313 = v187;
      v314 = 2080;
      v315 = (size_t)v201;
      v316 = 2048;
      v317 = v13;
      v318 = 2048;
      v319 = v10;
      v198 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]%sbound sent o"
             "ffset less than start, adjusting from %llu to %llu";
      v199 = v17;
      v200 = 128;
LABEL_212:
      _os_log_debug_impl(&dword_208439000, v199, OS_LOG_TYPE_DEBUG, v198, buf, v200);
    }
  }
  else if (v18)
  {
    v133 = *(_QWORD *)(v3 + 80);
    if (v133)
      LODWORD(v133) = nw_parameters_get_ip_protocol();
    v134 = *(unsigned int *)(v3 + 176);
    if (v134 > 3)
      v135 = "unknown";
    else
      v135 = (&off_24C0A1818)[v134];
    *(_QWORD *)&buf[4] = out;
    v197 = "out";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)buf = 136316418;
    if (v297)
      v197 = "in";
    *(_DWORD *)&buf[14] = v133;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = v135;
    *(_WORD *)&buf[28] = 2080;
    *(_QWORD *)&buf[30] = v197;
    v302 = 2048;
    v303 = v13;
    v304 = 2048;
    v305 = v10;
    v198 = "[filter %s %d %s] %sbound sent offset less than start, adjusting from %llu to %llu";
    v199 = v17;
    v200 = 58;
    goto LABEL_212;
  }
  v4 = v297;
LABEL_37:
  v39 = v4 == 0;
  v40 = 64;
  if (v4)
    v40 = 48;
  v41 = *(_QWORD *)(a2 + v40);
  v42 = 72;
  if (!v39)
    v42 = 56;
  v43 = *(_QWORD *)(a2 + v42);
  if (v43 <= v41)
  {
    memset(out, 0, 37);
    uuid_unparse((const unsigned __int8 *)v3, (char *)out);
    v54 = *(_DWORD *)(v3 + 176);
    v55 = ne_log_obj();
    v56 = os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG);
    if (v54 == 3)
    {
      if (v56)
      {
        v57 = *(_QWORD *)(v3 + 80);
        if (v57)
          LODWORD(v57) = nw_parameters_get_ip_protocol();
        v58 = *(_QWORD **)(v3 + 160);
        if (v58)
        {
          v60 = v58[6];
          v61 = v58[7];
          v59 = v58[8];
          v62 = v58[9];
        }
        else
        {
          v59 = -1;
          v60 = -1;
          v61 = -1;
          v62 = -1;
        }
        v188 = *(_QWORD **)(v3 + 168);
        if (v188)
        {
          v190 = v188[6];
          v191 = v188[7];
          v189 = v188[8];
          v192 = v188[9];
        }
        else
        {
          v189 = -1;
          v190 = -1;
          v191 = -1;
          v192 = -1;
        }
        *(_QWORD *)&buf[4] = out;
        v202 = "out";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)buf = 136318210;
        if (v297)
          v202 = "in";
        *(_DWORD *)&buf[14] = v57;
        *(_WORD *)&buf[18] = 2048;
        *(_QWORD *)&buf[20] = v60;
        *(_WORD *)&buf[28] = 2048;
        *(_QWORD *)&buf[30] = v61;
        v302 = 2048;
        v303 = v59;
        v304 = 2048;
        v305 = v62;
        v306 = 2048;
        v307 = v190;
        v308 = 2048;
        v309 = v191;
        v310 = 2048;
        v311 = v189;
        v312 = 2048;
        v313 = v192;
        v314 = 2080;
        v315 = (size_t)v202;
        v316 = 2048;
        v317 = v43;
        v318 = 2048;
        v319 = v41;
        v179 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]no %sbound b"
               "ytes to peek (%llu < %llu)";
        v180 = v55;
        v181 = 128;
        goto LABEL_245;
      }
    }
    else if (v56)
    {
      v63 = *(_QWORD *)(v3 + 80);
      if (v63)
        LODWORD(v63) = nw_parameters_get_ip_protocol();
      v64 = *(unsigned int *)(v3 + 176);
      if (v64 > 3)
        v65 = "unknown";
      else
        v65 = (&off_24C0A1818)[v64];
      *(_QWORD *)&buf[4] = out;
      v193 = "out";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)buf = 136316418;
      if (v297)
        v193 = "in";
      *(_DWORD *)&buf[14] = v63;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = v65;
      *(_WORD *)&buf[28] = 2080;
      *(_QWORD *)&buf[30] = v193;
      v302 = 2048;
      v303 = v43;
      v304 = 2048;
      v305 = v41;
      v179 = "[filter %s %d %s] no %sbound bytes to peek (%llu < %llu)";
      v180 = v55;
      v181 = 58;
      goto LABEL_245;
    }
    return 1;
  }
  v44 = v15 - v10;
  if (v41 <= v15)
  {
    v41 = v15;
    v47 = v294;
    goto LABEL_63;
  }
  v290 = v41 - v15;
  memset(out, 0, 37);
  uuid_unparse((const unsigned __int8 *)v3, (char *)out);
  v45 = *(_DWORD *)(v3 + 176);
  log = ne_log_obj();
  v46 = os_log_type_enabled(log, OS_LOG_TYPE_DEBUG);
  if (v45 == 3)
  {
    v47 = v294;
    if (v46)
    {
      v48 = *(_QWORD *)(v3 + 80);
      if (v48)
        LODWORD(v48) = nw_parameters_get_ip_protocol();
      v49 = *(_QWORD **)(v3 + 160);
      if (v49)
      {
        v51 = v49[6];
        v52 = v49[7];
        v50 = v49[8];
        v53 = v49[9];
      }
      else
      {
        v50 = -1;
        v51 = -1;
        v52 = -1;
        v53 = -1;
      }
      v208 = *(_QWORD **)(v3 + 168);
      if (v208)
      {
        v210 = v208[6];
        v211 = v208[7];
        v209 = v208[8];
        v212 = v208[9];
      }
      else
      {
        v209 = -1;
        v210 = -1;
        v211 = -1;
        v212 = -1;
      }
      v223 = "out";
      *(_DWORD *)buf = 136318210;
      *(_QWORD *)&buf[4] = out;
      *(_WORD *)&buf[12] = 1024;
      if (v297)
        v223 = "in";
      *(_DWORD *)&buf[14] = v48;
      *(_WORD *)&buf[18] = 2048;
      *(_QWORD *)&buf[20] = v51;
      *(_WORD *)&buf[28] = 2048;
      *(_QWORD *)&buf[30] = v52;
      v302 = 2048;
      v303 = v50;
      v304 = 2048;
      v305 = v53;
      v306 = 2048;
      v307 = v210;
      v308 = 2048;
      v309 = v211;
      v310 = 2048;
      v311 = v209;
      v312 = 2048;
      v313 = v212;
      v314 = 2080;
      v315 = (size_t)v223;
      v316 = 2048;
      v317 = v44;
      v318 = 2048;
      v319 = v290 + v44;
      v221 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]already passed"
             " %sbound bytes, moving frameArrayStart offset from %llu to %llu";
      v220 = log;
      v222 = 128;
LABEL_240:
      _os_log_debug_impl(&dword_208439000, v220, OS_LOG_TYPE_DEBUG, v221, buf, v222);
    }
  }
  else
  {
    v47 = v294;
    if (v46)
    {
      v194 = *(_QWORD *)(v3 + 80);
      if (v194)
        LODWORD(v194) = nw_parameters_get_ip_protocol();
      v195 = *(unsigned int *)(v3 + 176);
      if (v195 > 3)
        v196 = "unknown";
      else
        v196 = (&off_24C0A1818)[v195];
      v219 = "out";
      *(_DWORD *)buf = 136316418;
      *(_QWORD *)&buf[4] = out;
      *(_WORD *)&buf[12] = 1024;
      if (v297)
        v219 = "in";
      *(_DWORD *)&buf[14] = v194;
      v220 = log;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = v196;
      *(_WORD *)&buf[28] = 2080;
      *(_QWORD *)&buf[30] = v219;
      v302 = 2048;
      v303 = v44;
      v304 = 2048;
      v305 = v290 + v44;
      v221 = "[filter %s %d %s] already passed %sbound bytes, moving frameArrayStart offset from %llu to %llu";
      v222 = 58;
      goto LABEL_240;
    }
  }
  v44 += v290;
  *v292 += v290;
LABEL_63:
  if (v44 > v47)
  {
    memset(out, 0, 37);
    uuid_unparse((const unsigned __int8 *)v3, (char *)out);
    v66 = *(_DWORD *)(v3 + 176);
    v67 = ne_log_obj();
    v68 = os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG);
    if (v66 == 3)
    {
      if (v68)
      {
        v69 = *(_QWORD *)(v3 + 80);
        if (v69)
          LODWORD(v69) = nw_parameters_get_ip_protocol();
        v70 = *(_QWORD **)(v3 + 160);
        if (v70)
        {
          v72 = v70[6];
          v73 = v70[7];
          v71 = v70[8];
          v74 = v70[9];
        }
        else
        {
          v71 = -1;
          v72 = -1;
          v73 = -1;
          v74 = -1;
        }
        v213 = *(_QWORD **)(v3 + 168);
        if (v213)
        {
          v215 = v213[6];
          v216 = v213[7];
          v214 = v213[8];
          v217 = v213[9];
        }
        else
        {
          v214 = -1;
          v215 = -1;
          v216 = -1;
          v217 = -1;
        }
        v224 = "out";
        *(_DWORD *)buf = 136318210;
        *(_QWORD *)&buf[4] = out;
        *(_WORD *)&buf[12] = 1024;
        if (v297)
          v224 = "in";
        *(_DWORD *)&buf[14] = v69;
        *(_WORD *)&buf[18] = 2048;
        *(_QWORD *)&buf[20] = v72;
        *(_WORD *)&buf[28] = 2048;
        *(_QWORD *)&buf[30] = v73;
        v302 = 2048;
        v303 = v71;
        v304 = 2048;
        v305 = v74;
        v306 = 2048;
        v307 = v215;
        v308 = 2048;
        v309 = v216;
        v310 = 2048;
        v311 = v214;
        v312 = 2048;
        v313 = v217;
        v314 = 2080;
        v315 = (size_t)v224;
        v316 = 2048;
        v317 = v44;
        v318 = 1024;
        LODWORD(v319) = v47;
        v179 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]all %sbound "
               "pending bytes already passed (%llu > %u), not filtering";
        v180 = v67;
        v181 = 124;
LABEL_245:
        _os_log_debug_impl(&dword_208439000, v180, OS_LOG_TYPE_DEBUG, v179, buf, v181);
      }
    }
    else if (v68)
    {
      v78 = *(_QWORD *)(v3 + 80);
      if (v78)
        LODWORD(v78) = nw_parameters_get_ip_protocol();
      v79 = *(unsigned int *)(v3 + 176);
      if (v79 > 3)
        v80 = "unknown";
      else
        v80 = (&off_24C0A1818)[v79];
      v218 = "out";
      *(_DWORD *)buf = 136316418;
      *(_QWORD *)&buf[4] = out;
      *(_WORD *)&buf[12] = 1024;
      if (v297)
        v218 = "in";
      *(_DWORD *)&buf[14] = v78;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = v80;
      *(_WORD *)&buf[28] = 2080;
      *(_QWORD *)&buf[30] = v218;
      v302 = 2048;
      v303 = v44;
      v304 = 1024;
      LODWORD(v305) = v47;
      v179 = "[filter %s %d %s] all %sbound pending bytes already passed (%llu > %u), not filtering";
      v180 = v67;
      v181 = 54;
      goto LABEL_245;
    }
    return 1;
  }
  if (v43 >= v41 + v47 - v44)
    v43 = v41 + v47 - v44;
  v75 = v44 + v10;
  if (v43 <= v44 + v10)
  {
    memset(out, 0, 37);
    uuid_unparse((const unsigned __int8 *)v3, (char *)out);
    v81 = *(_DWORD *)(v3 + 176);
    v82 = ne_log_obj();
    v83 = os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG);
    if (v81 == 3)
    {
      if (!v83)
        return 0;
      v84 = *(_QWORD *)(v3 + 80);
      if (v84)
        LODWORD(v84) = nw_parameters_get_ip_protocol();
      v85 = *(_QWORD **)(v3 + 160);
      if (v85)
      {
        v87 = v85[6];
        v88 = v85[7];
        v86 = v85[8];
        v89 = v85[9];
      }
      else
      {
        v86 = -1;
        v87 = -1;
        v88 = -1;
        v89 = -1;
      }
      v225 = *(_QWORD **)(v3 + 168);
      if (v225)
      {
        v227 = v225[6];
        v228 = v225[7];
        v226 = v225[8];
        v229 = v225[9];
      }
      else
      {
        v226 = -1;
        v227 = -1;
        v228 = -1;
        v229 = -1;
      }
      *(_QWORD *)&buf[4] = out;
      v234 = "out";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)buf = 136318210;
      if (v297)
        v234 = "in";
      *(_DWORD *)&buf[14] = v84;
      *(_WORD *)&buf[18] = 2048;
      *(_QWORD *)&buf[20] = v87;
      *(_WORD *)&buf[28] = 2048;
      *(_QWORD *)&buf[30] = v88;
      v302 = 2048;
      v303 = v86;
      v304 = 2048;
      v305 = v89;
      v306 = 2048;
      v307 = v227;
      v308 = 2048;
      v309 = v228;
      v310 = 2048;
      v311 = v226;
      v312 = 2048;
      v313 = v229;
      v314 = 2080;
      v315 = (size_t)v234;
      v316 = 2048;
      v317 = v43;
      v318 = 2048;
      v319 = v75;
      v231 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]no %sbound byt"
             "es to filter (%llu <= %llu)";
      v232 = v82;
      v233 = 128;
    }
    else
    {
      if (!v83)
        return 0;
      v112 = *(_QWORD *)(v3 + 80);
      if (v112)
        LODWORD(v112) = nw_parameters_get_ip_protocol();
      v113 = *(unsigned int *)(v3 + 176);
      if (v113 > 3)
        v114 = "unknown";
      else
        v114 = (&off_24C0A1818)[v113];
      *(_QWORD *)&buf[4] = out;
      v230 = "out";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)buf = 136316418;
      if (v297)
        v230 = "in";
      *(_DWORD *)&buf[14] = v112;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = v114;
      *(_WORD *)&buf[28] = 2080;
      *(_QWORD *)&buf[30] = v230;
      v302 = 2048;
      v303 = v43;
      v304 = 2048;
      v305 = v75;
      v231 = "[filter %s %d %s] no %sbound bytes to filter (%llu <= %llu)";
      v232 = v82;
      v233 = 58;
    }
LABEL_259:
    _os_log_debug_impl(&dword_208439000, v232, OS_LOG_TYPE_DEBUG, v231, buf, v233);
    return 0;
  }
  v76 = v43 - v41;
  if ((v43 - v41) >> 32)
  {
    v77 = ne_log_obj();
    result = os_log_type_enabled(v77, OS_LOG_TYPE_FAULT);
    if (!result)
      return result;
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v43 - v41;
    _os_log_fault_impl(&dword_208439000, v77, OS_LOG_TYPE_FAULT, "frameArraySendLength too big %llu", buf, 0xCu);
    return 0;
  }
  v291 = (char *)malloc_type_malloc(v43 - v41, 0x6208BA9uLL);
  if (!v291)
  {
    memset(out, 0, 37);
    uuid_unparse((const unsigned __int8 *)v3, (char *)out);
    v115 = *(_DWORD *)(v3 + 176);
    v116 = ne_log_obj();
    v117 = os_log_type_enabled(v116, OS_LOG_TYPE_DEBUG);
    if (v115 == 3)
    {
      if (!v117)
        return 0;
      v118 = *(_QWORD *)(v3 + 80);
      if (v118)
        LODWORD(v118) = nw_parameters_get_ip_protocol();
      v119 = *(_QWORD **)(v3 + 160);
      if (v119)
      {
        v121 = v119[6];
        v122 = v119[7];
        v120 = v119[8];
        v123 = v119[9];
      }
      else
      {
        v120 = -1;
        v121 = -1;
        v122 = -1;
        v123 = -1;
      }
      v244 = *(_QWORD **)(v3 + 168);
      if (v244)
      {
        v246 = v244[6];
        v247 = v244[7];
        v245 = v244[8];
        v248 = v244[9];
      }
      else
      {
        v245 = -1;
        v246 = -1;
        v247 = -1;
        v248 = -1;
      }
      *(_DWORD *)buf = 136317698;
      *(_QWORD *)&buf[4] = out;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v118;
      *(_WORD *)&buf[18] = 2048;
      *(_QWORD *)&buf[20] = v121;
      *(_WORD *)&buf[28] = 2048;
      *(_QWORD *)&buf[30] = v122;
      v302 = 2048;
      v303 = v120;
      v304 = 2048;
      v305 = v123;
      v306 = 2048;
      v307 = v246;
      v308 = 2048;
      v309 = v247;
      v310 = 2048;
      v311 = v245;
      v312 = 2048;
      v313 = v248;
      v314 = 2048;
      v315 = v76;
      v231 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]failed to malloc %zu bytes";
      v232 = v116;
      v233 = 108;
    }
    else
    {
      if (!v117)
        return 0;
      v136 = *(_QWORD *)(v3 + 80);
      if (v136)
        LODWORD(v136) = nw_parameters_get_ip_protocol();
      v137 = *(unsigned int *)(v3 + 176);
      if (v137 > 3)
        v138 = "unknown";
      else
        v138 = (&off_24C0A1818)[v137];
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = out;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v136;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = v138;
      *(_WORD *)&buf[28] = 2048;
      *(_QWORD *)&buf[30] = v76;
      v231 = "[filter %s %d %s] failed to malloc %zu bytes";
      v232 = v116;
      v233 = 38;
    }
    goto LABEL_259;
  }
  v90 = nw_frame_array_first();
  v91 = v76 + v44;
  v293 = v43 - v41;
  if (v76 + v44 && v90 && v43 != v41)
  {
    v92 = 0;
    v93 = 0;
    do
    {
      *(_DWORD *)buf = 0;
      v94 = nw_frame_unclaimed_bytes();
      if (v44 <= v92)
        v95 = 0;
      else
        v95 = v44 - v92;
      v96 = *(_DWORD *)buf;
      if (*(_DWORD *)buf > v95)
      {
        if (v91 - (v92 + v95) >= *(_DWORD *)buf - v95)
          v97 = *(_DWORD *)buf - v95;
        else
          v97 = v91 - (v92 + v95);
        memcpy(&v291[v93], (const void *)(v94 + v95), v97);
        v93 += v97;
        v76 = v293;
        v96 = *(_DWORD *)buf;
      }
      v92 += v96;
      v98 = nw_frame_array_next();
    }
    while (v92 < v91 && v98 != 0 && v93 < v76);
  }
  v101 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uuid(v101, "flow-uuid", (const unsigned __int8 *)v3);
  ip_protocol = nw_parameters_get_ip_protocol();
  xpc_dictionary_set_uint64(v101, "ip-protocol", ip_protocol);
  if (!v297)
  {
    xpc_dictionary_set_uint64(v101, "pending-data-start-offset", *v296);
    memset(out, 0, 37);
    uuid_unparse((const unsigned __int8 *)v3, (char *)out);
    v124 = *(_DWORD *)(v3 + 176);
    v125 = ne_log_obj();
    v126 = os_log_type_enabled(v125, OS_LOG_TYPE_DEBUG);
    if (v124 == 3)
    {
      if (v126)
      {
        v127 = *(_QWORD *)(v3 + 80);
        if (v127)
          LODWORD(v127) = nw_parameters_get_ip_protocol();
        v128 = *(_QWORD **)(v3 + 160);
        if (v128)
        {
          v130 = v128[6];
          v131 = v128[7];
          v129 = v128[8];
          v132 = v128[9];
        }
        else
        {
          v129 = -1;
          v130 = -1;
          v131 = -1;
          v132 = -1;
        }
        v254 = *(_QWORD **)(v3 + 168);
        if (v254)
        {
          v256 = v254[6];
          v257 = v254[7];
          v255 = v254[8];
          v258 = v254[9];
        }
        else
        {
          v255 = -1;
          v256 = -1;
          v257 = -1;
          v258 = -1;
        }
        v286 = *v296;
        *(_DWORD *)buf = 136317954;
        *(_QWORD *)&buf[4] = out;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v127;
        *(_WORD *)&buf[18] = 2048;
        *(_QWORD *)&buf[20] = v130;
        *(_WORD *)&buf[28] = 2048;
        *(_QWORD *)&buf[30] = v131;
        v302 = 2048;
        v303 = v129;
        v304 = 2048;
        v305 = v132;
        v306 = 2048;
        v307 = v256;
        v308 = 2048;
        v309 = v257;
        v310 = 2048;
        v311 = v255;
        v312 = 2048;
        v313 = v258;
        v314 = 2048;
        v315 = v293;
        v316 = 2048;
        v317 = v286;
        v278 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]filtering %z"
               "u output bytes at offset %llu";
        v279 = v125;
        v280 = 118;
LABEL_304:
        _os_log_debug_impl(&dword_208439000, v279, OS_LOG_TYPE_DEBUG, v278, buf, v280);
      }
    }
    else if (v126)
    {
      v238 = *(_QWORD *)(v3 + 80);
      if (v238)
        LODWORD(v238) = nw_parameters_get_ip_protocol();
      v239 = *(unsigned int *)(v3 + 176);
      if (v239 > 3)
        v240 = "unknown";
      else
        v240 = (&off_24C0A1818)[v239];
      v277 = *v296;
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = out;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v238;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = v240;
      *(_WORD *)&buf[28] = 2048;
      *(_QWORD *)&buf[30] = v293;
      v302 = 2048;
      v303 = v277;
      v278 = "[filter %s %d %s] filtering %zu output bytes at offset %llu";
      v279 = v125;
      v280 = 48;
      goto LABEL_304;
    }
    v139 = 7;
    goto LABEL_145;
  }
  xpc_dictionary_set_uint64(v101, "pending-data-start-offset", *v295);
  memset(out, 0, 37);
  uuid_unparse((const unsigned __int8 *)v3, (char *)out);
  v103 = *(_DWORD *)(v3 + 176);
  v104 = ne_log_obj();
  v105 = os_log_type_enabled(v104, OS_LOG_TYPE_DEBUG);
  if (v103 == 3)
  {
    if (v105)
    {
      v106 = *(_QWORD *)(v3 + 80);
      if (v106)
        LODWORD(v106) = nw_parameters_get_ip_protocol();
      v107 = *(_QWORD **)(v3 + 160);
      if (v107)
      {
        v109 = v107[6];
        v110 = v107[7];
        v108 = v107[8];
        v111 = v107[9];
      }
      else
      {
        v108 = -1;
        v109 = -1;
        v110 = -1;
        v111 = -1;
      }
      v249 = *(_QWORD **)(v3 + 168);
      if (v249)
      {
        v251 = v249[6];
        v252 = v249[7];
        v250 = v249[8];
        v253 = v249[9];
      }
      else
      {
        v250 = -1;
        v251 = -1;
        v252 = -1;
        v253 = -1;
      }
      v285 = *v295;
      *(_DWORD *)buf = 136317954;
      *(_QWORD *)&buf[4] = out;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v106;
      *(_WORD *)&buf[18] = 2048;
      *(_QWORD *)&buf[20] = v109;
      *(_WORD *)&buf[28] = 2048;
      *(_QWORD *)&buf[30] = v110;
      v302 = 2048;
      v303 = v108;
      v304 = 2048;
      v305 = v111;
      v306 = 2048;
      v307 = v251;
      v308 = 2048;
      v309 = v252;
      v310 = 2048;
      v311 = v250;
      v312 = 2048;
      v313 = v253;
      v314 = 2048;
      v315 = v293;
      v316 = 2048;
      v317 = v285;
      v274 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]filtering %zu "
             "input bytes at offset %llu";
      v275 = v104;
      v276 = 118;
LABEL_301:
      _os_log_debug_impl(&dword_208439000, v275, OS_LOG_TYPE_DEBUG, v274, buf, v276);
    }
  }
  else if (v105)
  {
    v235 = *(_QWORD *)(v3 + 80);
    if (v235)
      LODWORD(v235) = nw_parameters_get_ip_protocol();
    v236 = *(unsigned int *)(v3 + 176);
    if (v236 > 3)
      v237 = "unknown";
    else
      v237 = (&off_24C0A1818)[v236];
    v273 = *v295;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = out;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v235;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = v237;
    *(_WORD *)&buf[28] = 2048;
    *(_QWORD *)&buf[30] = v293;
    v302 = 2048;
    v303 = v273;
    v274 = "[filter %s %d %s] filtering %zu input bytes at offset %llu";
    v275 = v104;
    v276 = 48;
    goto LABEL_301;
  }
  v139 = 8;
LABEL_145:
  xpc_dictionary_set_int64(v101, "command", v139);
  v140 = *(NSObject **)(v3 + 64);
  if (v140)
  {
    if (nw_endpoint_get_type(v140) == nw_endpoint_type_address)
    {
      address = nw_endpoint_get_address(*(nw_endpoint_t *)(v3 + 64));
      if (address)
        xpc_dictionary_set_data(v101, "local-addr", address, address->sa_len);
    }
  }
  v142 = *(NSObject **)(v3 + 72);
  if (v142)
  {
    type = nw_endpoint_get_type(v142);
    v144 = *(NSObject **)(v3 + 72);
    if (type == nw_endpoint_type_address)
    {
      v145 = nw_endpoint_get_address(v144);
      if (!v145)
        goto LABEL_156;
      v146 = v145;
      sa_len = v145->sa_len;
    }
    else
    {
      if (nw_endpoint_get_type(v144) != nw_endpoint_type_host)
        goto LABEL_156;
      memset(buf, 0, 28);
      ne_filter_create_wildcard_remote_sockaddr((uint64_t)buf, v3);
      sa_len = buf[0];
      v146 = (const sockaddr *)buf;
    }
    xpc_dictionary_set_data(v101, "remote-addr", v146, sa_len);
  }
LABEL_156:
  xpc_dictionary_set_data(v101, "data", v291, v293);
  free(v291);
  if (!v297)
  {
    v148 = (int *)(a2 + 104);
    *v296 = v91 + *(_QWORD *)(a2 + 104);
    memset(out, 0, 37);
    uuid_unparse((const unsigned __int8 *)v3, (char *)out);
    v159 = *(_DWORD *)(v3 + 176);
    v160 = ne_log_obj();
    v161 = os_log_type_enabled(v160, OS_LOG_TYPE_DEBUG);
    if (v159 == 3)
    {
      if (v161)
      {
        v162 = *(_QWORD *)(v3 + 80);
        if (v162)
          LODWORD(v162) = nw_parameters_get_ip_protocol();
        v163 = *(_QWORD **)(v3 + 160);
        if (v163)
        {
          v165 = v163[6];
          v166 = v163[7];
          v164 = v163[8];
          v167 = v163[9];
        }
        else
        {
          v164 = -1;
          v165 = -1;
          v166 = -1;
          v167 = -1;
        }
        v264 = *(_QWORD **)(v3 + 168);
        if (v264)
        {
          v266 = v264[6];
          v267 = v264[7];
          v265 = v264[8];
          v268 = v264[9];
        }
        else
        {
          v265 = -1;
          v266 = -1;
          v267 = -1;
          v268 = -1;
        }
        v288 = *v296;
        *(_DWORD *)buf = 136317698;
        *(_QWORD *)&buf[4] = out;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v162;
        *(_WORD *)&buf[18] = 2048;
        *(_QWORD *)&buf[20] = v165;
        *(_WORD *)&buf[28] = 2048;
        *(_QWORD *)&buf[30] = v166;
        v302 = 2048;
        v303 = v164;
        v304 = 2048;
        v305 = v167;
        v306 = 2048;
        v307 = v266;
        v308 = 2048;
        v309 = v267;
        v310 = 2048;
        v311 = v265;
        v312 = 2048;
        v313 = v268;
        v314 = 2048;
        v315 = v288;
        v282 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]outbound sen"
               "t offset is now %llu";
        v283 = v160;
        v284 = 108;
LABEL_310:
        _os_log_debug_impl(&dword_208439000, v283, OS_LOG_TYPE_DEBUG, v282, buf, v284);
      }
    }
    else if (v161)
    {
      v241 = *(_QWORD *)(v3 + 80);
      if (v241)
        LODWORD(v241) = nw_parameters_get_ip_protocol();
      v242 = *(unsigned int *)(v3 + 176);
      if (v242 > 3)
        v243 = "unknown";
      else
        v243 = (&off_24C0A1818)[v242];
      v281 = *v296;
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = out;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v241;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = v243;
      *(_WORD *)&buf[28] = 2048;
      *(_QWORD *)&buf[30] = v281;
      v282 = "[filter %s %d %s] outbound sent offset is now %llu";
      v283 = v160;
      v284 = 38;
      goto LABEL_310;
    }
    v152 = v296;
    goto LABEL_176;
  }
  v148 = (int *)(a2 + 88);
  *v295 = v91 + *(_QWORD *)(a2 + 88);
  memset(out, 0, 37);
  uuid_unparse((const unsigned __int8 *)v3, (char *)out);
  v149 = *(_DWORD *)(v3 + 176);
  v150 = ne_log_obj();
  v151 = os_log_type_enabled(v150, OS_LOG_TYPE_DEBUG);
  if (v149 == 3)
  {
    v152 = v295;
    if (v151)
    {
      v153 = *(_QWORD *)(v3 + 80);
      if (v153)
        LODWORD(v153) = nw_parameters_get_ip_protocol();
      v154 = *(_QWORD **)(v3 + 160);
      if (v154)
      {
        v156 = v154[6];
        v157 = v154[7];
        v155 = v154[8];
        v158 = v154[9];
      }
      else
      {
        v155 = -1;
        v156 = -1;
        v157 = -1;
        v158 = -1;
      }
      v259 = *(_QWORD **)(v3 + 168);
      if (v259)
      {
        v261 = v259[6];
        v262 = v259[7];
        v260 = v259[8];
        v263 = v259[9];
      }
      else
      {
        v260 = -1;
        v261 = -1;
        v262 = -1;
        v263 = -1;
      }
      v287 = *v295;
      *(_DWORD *)buf = 136317698;
      *(_QWORD *)&buf[4] = out;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v153;
      *(_WORD *)&buf[18] = 2048;
      *(_QWORD *)&buf[20] = v156;
      *(_WORD *)&buf[28] = 2048;
      *(_QWORD *)&buf[30] = v157;
      v302 = 2048;
      v303 = v155;
      v304 = 2048;
      v305 = v158;
      v306 = 2048;
      v307 = v261;
      v308 = 2048;
      v309 = v262;
      v310 = 2048;
      v311 = v260;
      v312 = 2048;
      v313 = v263;
      v314 = 2048;
      v315 = v287;
      v270 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]inbound sent o"
             "ffset is now %llu";
      v271 = v150;
      v272 = 108;
LABEL_307:
      _os_log_debug_impl(&dword_208439000, v271, OS_LOG_TYPE_DEBUG, v270, buf, v272);
    }
  }
  else
  {
    v152 = v295;
    if (v151)
    {
      v168 = *(_QWORD *)(v3 + 80);
      if (v168)
        LODWORD(v168) = nw_parameters_get_ip_protocol();
      v169 = *(unsigned int *)(v3 + 176);
      if (v169 > 3)
        v170 = "unknown";
      else
        v170 = (&off_24C0A1818)[v169];
      v269 = *v295;
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = out;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v168;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = v170;
      *(_WORD *)&buf[28] = 2048;
      *(_QWORD *)&buf[30] = v269;
      v270 = "[filter %s %d %s] inbound sent offset is now %llu";
      v271 = v150;
      v272 = 38;
      goto LABEL_307;
    }
  }
LABEL_176:
  v171 = *(_DWORD *)v152;
  v172 = *v148;
  if (!*(_DWORD *)(v3 + 124))
  {
    memset(buf, 0, 32);
    out[0] = 0;
    if (ne_filter_generate_crypto_signature(*(_DWORD *)(a2 + 4), v3, (uint64_t)buf, out, 0))
    {
      xpc_dictionary_set_data(v101, "crypto-signature", buf, out[0]);
    }
    else
    {
      v203 = ne_log_obj();
      if (os_log_type_enabled(v203, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v300 = 0;
        _os_log_error_impl(&dword_208439000, v203, OS_LOG_TYPE_ERROR, "Failed to generate signature for data message", v300, 2u);
      }
    }
  }
  v204 = v171 - v172;
  do
    v205 = __ldaxr(v7);
  while (__stlxr(v205 + 1, v7));
  v206 = *(os_unfair_lock_s **)(v3 + 96);
  v207 = *(_DWORD *)(a2 + 4);
  v298[0] = MEMORY[0x24BDAC760];
  v298[1] = 0x40000000;
  v298[2] = __ne_filter_data_protocol_send_data_block_invoke;
  v298[3] = &__block_descriptor_tmp_33;
  v298[4] = v3;
  v298[5] = v293;
  v299 = v139;
  v298[6] = a1;
  v298[7] = a2;
  ne_filter_send_message(v206, v207, v101, v298);
  xpc_release(v101);
  return v294 == v204;
}

uint64_t ne_filter_protocol_fulfill_frame_request(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, _DWORD *a7)
{
  int v11;
  NSObject *v12;
  _BOOL4 v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  const char *v35;
  NSObject *v36;
  uint32_t v37;
  int v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  int v47;
  __int128 v48;
  uint8_t buf[4];
  _BYTE v50[10];
  _BYTE v51[6];
  uint64_t v52;
  __int16 v53;
  _BYTE v54[10];
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  uint64_t v65;
  __int16 v66;
  int v67;
  __int16 v68;
  int v69;
  char out[40];
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  if (!a2)
  {
    v39 = ne_log_obj();
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
      return 0;
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)v50 = "ne_filter_protocol_fulfill_frame_request";
    v23 = "%s called with null source_array";
    goto LABEL_41;
  }
  if (!a3)
  {
    v39 = ne_log_obj();
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
      return 0;
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)v50 = "ne_filter_protocol_fulfill_frame_request";
    v23 = "%s called with null destination_array";
LABEL_41:
    v24 = v39;
    v25 = 12;
    goto LABEL_24;
  }
  if (!a5 || !a6)
  {
    v20 = ne_log_obj();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      return 0;
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)v50 = a5;
    *(_WORD *)&v50[4] = 1024;
    *(_DWORD *)&v50[6] = 1;
    *(_WORD *)v51 = 1024;
    *(_DWORD *)&v51[2] = a6;
    v23 = "invalid values for frame request, max %u, min %u, max frame %u";
    v24 = v20;
    v25 = 20;
LABEL_24:
    _os_log_fault_impl(&dword_208439000, v24, OS_LOG_TYPE_FAULT, v23, buf, v25);
    return 0;
  }
  v48 = 0uLL;
  nw_frame_array_init();
  v44 = 0;
  v45 = &v44;
  v46 = 0x2000000000;
  v47 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2000000000;
  v43 = 0;
  nw_frame_array_foreach();
  if (*((_DWORD *)v41 + 6) || (nw_frame_array_is_empty() & 1) != 0)
    goto LABEL_17;
  memset(out, 0, 37);
  uuid_unparse((const unsigned __int8 *)a1, out);
  v11 = *(_DWORD *)(a1 + 176);
  v12 = ne_log_obj();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
  if (v11 == 3)
  {
    if (v13)
    {
      v14 = *(_QWORD *)(a1 + 80);
      if (v14)
        LODWORD(v14) = nw_parameters_get_ip_protocol();
      v15 = *(_QWORD **)(a1 + 160);
      if (v15)
      {
        v17 = v15[6];
        v18 = v15[7];
        v16 = v15[8];
        v19 = v15[9];
      }
      else
      {
        v16 = -1;
        v17 = -1;
        v18 = -1;
        v19 = -1;
      }
      v29 = *(_QWORD **)(a1 + 168);
      if (v29)
      {
        v31 = v29[6];
        v32 = v29[7];
        v30 = v29[8];
        v33 = v29[9];
      }
      else
      {
        v30 = -1;
        v31 = -1;
        v32 = -1;
        v33 = -1;
      }
      v38 = *((_DWORD *)v41 + 6);
      *(_DWORD *)buf = 136317954;
      *(_QWORD *)v50 = out;
      *(_WORD *)&v50[8] = 1024;
      *(_DWORD *)v51 = v14;
      *(_WORD *)&v51[4] = 2048;
      v52 = v17;
      v53 = 2048;
      *(_QWORD *)v54 = v18;
      *(_WORD *)&v54[8] = 2048;
      v55 = v16;
      v56 = 2048;
      v57 = v19;
      v58 = 2048;
      v59 = v31;
      v60 = 2048;
      v61 = v32;
      v62 = 2048;
      v63 = v30;
      v64 = 2048;
      v65 = v33;
      v66 = 1024;
      v67 = 1;
      v68 = 1024;
      v69 = v38;
      v35 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]could not meet "
            "minimum byte count %u with %u bytes from source array";
      v36 = v12;
      v37 = 110;
LABEL_36:
      _os_log_debug_impl(&dword_208439000, v36, OS_LOG_TYPE_DEBUG, v35, buf, v37);
    }
  }
  else if (v13)
  {
    v26 = *(_QWORD *)(a1 + 80);
    if (v26)
      LODWORD(v26) = nw_parameters_get_ip_protocol();
    v27 = *(unsigned int *)(a1 + 176);
    if (v27 > 3)
      v28 = "unknown";
    else
      v28 = (&off_24C0A1818)[v27];
    v34 = *((_DWORD *)v41 + 6);
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)v50 = out;
    *(_WORD *)&v50[8] = 1024;
    *(_DWORD *)v51 = v26;
    *(_WORD *)&v51[4] = 2080;
    v52 = (uint64_t)v28;
    v53 = 1024;
    *(_DWORD *)v54 = 1;
    *(_WORD *)&v54[4] = 1024;
    *(_DWORD *)&v54[6] = v34;
    v35 = "[filter %s %d %s] could not meet minimum byte count %u with %u bytes from source array";
    v36 = v12;
    v37 = 40;
    goto LABEL_36;
  }
  nw_frame_array_prepend_array();
  *((_DWORD *)v45 + 6) = 0;
  *((_DWORD *)v41 + 6) = 0;
LABEL_17:
  if (a7)
    *a7 = *((_DWORD *)v41 + 6);
  if ((nw_frame_array_is_empty() & 1) == 0)
    nw_frame_array_foreach();
  v21 = *((unsigned int *)v45 + 6);
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);
  return v21;
}

BOOL __ne_filter_protocol_fulfill_frame_request_block_invoke(uint64_t a1)
{
  unsigned int v2;
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;
  size_t v6;
  unsigned int v7;
  void *v8;
  void *v9;
  const void *v10;
  int v11;
  NSObject *v12;
  _BOOL4 v13;
  _QWORD *v14;
  int v15;
  NSObject *v16;
  _BOOL4 v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  int v29;
  NSObject *v30;
  _BOOL4 v31;
  _QWORD *v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  _BOOL8 result;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  NSObject *v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  NSObject *v52;
  uint32_t v53;
  uint64_t v54;
  int v55;
  _QWORD *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  NSObject *v62;
  uint32_t v63;
  _QWORD *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  _QWORD *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  int ip_protocol;
  uint8_t buf[4];
  char *v79;
  __int16 v80;
  int v81;
  __int16 v82;
  uint64_t v83;
  __int16 v84;
  _BYTE v85[10];
  uint64_t v86;
  __int16 v87;
  uint64_t v88;
  __int16 v89;
  uint64_t v90;
  __int16 v91;
  uint64_t v92;
  __int16 v93;
  uint64_t v94;
  __int16 v95;
  uint64_t v96;
  __int16 v97;
  int v98;
  __int16 v99;
  unsigned int v100;
  __int16 v101;
  int v102;
  char out[40];
  uint64_t v104;

  v104 = *MEMORY[0x24BDAC8D0];
  v2 = nw_frame_unclaimed_length();
  if ((*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 1) > *(_DWORD *)(a1 + 80))
    return 0;
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(_DWORD *)(v3 + 24);
  v5 = *(_DWORD *)(a1 + 84);
  v6 = v5 - v4;
  if (v5 <= v4)
    return 0;
  v7 = v2;
  if (v6 >= v2)
  {
    *(_DWORD *)(v3 + 24) = v4 + v2;
    nw_frame_array_remove();
    memset(out, 0, 37);
    uuid_unparse(*(const unsigned __int8 **)(a1 + 48), out);
    v15 = *(_DWORD *)(*(_QWORD *)(a1 + 48) + 176);
    v16 = ne_log_obj();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);
    if (v15 == 3)
    {
      if (v17)
      {
        v18 = *(_QWORD **)(a1 + 48);
        v19 = v18[10];
        if (v19)
        {
          LODWORD(v19) = nw_parameters_get_ip_protocol();
          v18 = *(_QWORD **)(a1 + 48);
        }
        v20 = (_QWORD *)v18[20];
        if (v20)
        {
          v22 = v20[6];
          v23 = v20[7];
          v21 = v20[8];
          v24 = v20[9];
        }
        else
        {
          v21 = -1;
          v22 = -1;
          v23 = -1;
          v24 = -1;
        }
        v46 = (_QWORD *)v18[21];
        if (v46)
        {
          v48 = v46[6];
          v49 = v46[7];
          v47 = v46[8];
          v50 = v46[9];
        }
        else
        {
          v47 = -1;
          v48 = -1;
          v49 = -1;
          v50 = -1;
        }
        *(_DWORD *)buf = 136317698;
        v79 = out;
        v80 = 1024;
        v81 = v19;
        v82 = 2048;
        v83 = v22;
        v84 = 2048;
        *(_QWORD *)v85 = v23;
        *(_WORD *)&v85[8] = 2048;
        v86 = v21;
        v87 = 2048;
        v88 = v24;
        v89 = 2048;
        v90 = v48;
        v91 = 2048;
        v92 = v49;
        v93 = 2048;
        v94 = v47;
        v95 = 2048;
        v96 = v50;
        v97 = 1024;
        v98 = v7;
        v51 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]Moving entire"
              " frame (%u bytes)";
        v52 = v16;
        v53 = 104;
        goto LABEL_49;
      }
    }
    else if (v17)
    {
      v25 = *(_QWORD *)(a1 + 48);
      v26 = *(_QWORD *)(v25 + 80);
      if (v26)
      {
        LODWORD(v26) = nw_parameters_get_ip_protocol();
        v25 = *(_QWORD *)(a1 + 48);
      }
      v27 = *(unsigned int *)(v25 + 176);
      if (v27 > 3)
        v28 = "unknown";
      else
        v28 = (&off_24C0A1818)[v27];
      *(_DWORD *)buf = 136315906;
      v79 = out;
      v80 = 1024;
      v81 = v26;
      v82 = 2080;
      v83 = (uint64_t)v28;
      v84 = 1024;
      *(_DWORD *)v85 = v7;
      v51 = "[filter %s %d %s] Moving entire frame (%u bytes)";
      v52 = v16;
      v53 = 34;
      goto LABEL_49;
    }
    goto LABEL_41;
  }
  if (!*(_BYTE *)(a1 + 88))
  {
    memset(out, 0, 37);
    uuid_unparse(*(const unsigned __int8 **)(a1 + 48), out);
    v29 = *(_DWORD *)(*(_QWORD *)(a1 + 48) + 176);
    v30 = ne_log_obj();
    v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG);
    if (v29 == 3)
    {
      if (!v31)
        return 0;
      v32 = *(_QWORD **)(a1 + 48);
      v33 = v32[10];
      if (v33)
      {
        LODWORD(v33) = nw_parameters_get_ip_protocol();
        v32 = *(_QWORD **)(a1 + 48);
      }
      v34 = (_QWORD *)v32[20];
      if (v34)
      {
        v36 = v34[6];
        v37 = v34[7];
        v35 = v34[8];
        v38 = v34[9];
      }
      else
      {
        v35 = -1;
        v36 = -1;
        v37 = -1;
        v38 = -1;
      }
      v56 = (_QWORD *)v32[21];
      if (v56)
      {
        v58 = v56[6];
        v59 = v56[7];
        v57 = v56[8];
        v60 = v56[9];
      }
      else
      {
        v57 = -1;
        v58 = -1;
        v59 = -1;
        v60 = -1;
      }
      *(_DWORD *)buf = 136317442;
      v79 = out;
      v80 = 1024;
      v81 = v33;
      v82 = 2048;
      v83 = v36;
      v84 = 2048;
      *(_QWORD *)v85 = v37;
      *(_WORD *)&v85[8] = 2048;
      v86 = v35;
      v87 = 2048;
      v88 = v38;
      v89 = 2048;
      v90 = v58;
      v91 = 2048;
      v92 = v59;
      v93 = 2048;
      v94 = v57;
      v95 = 2048;
      v96 = v60;
      v61 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]skipping partia"
            "l frame, split frames not allowed";
      v62 = v30;
      v63 = 98;
    }
    else
    {
      if (!v31)
        return 0;
      v41 = *(_QWORD *)(a1 + 48);
      v42 = *(_QWORD *)(v41 + 80);
      if (v42)
      {
        LODWORD(v42) = nw_parameters_get_ip_protocol();
        v41 = *(_QWORD *)(a1 + 48);
      }
      v43 = *(unsigned int *)(v41 + 176);
      if (v43 > 3)
        v44 = "unknown";
      else
        v44 = (&off_24C0A1818)[v43];
      *(_DWORD *)buf = 136315650;
      v79 = out;
      v80 = 1024;
      v81 = v42;
      v82 = 2080;
      v83 = (uint64_t)v44;
      v61 = "[filter %s %d %s] skipping partial frame, split frames not allowed";
      v62 = v30;
      v63 = 28;
    }
    _os_log_debug_impl(&dword_208439000, v62, OS_LOG_TYPE_DEBUG, v61, buf, v63);
    return 0;
  }
  v8 = malloc_type_calloc(1uLL, v5 - v4, 0x472678A4uLL);
  if (v8)
  {
    v9 = v8;
    if (nw_frame_create())
    {
      v10 = (const void *)nw_frame_unclaimed_bytes();
      memcpy(v9, v10, v6);
      nw_frame_claim();
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += v6;
      memset(out, 0, 37);
      uuid_unparse(*(const unsigned __int8 **)(a1 + 48), out);
      v11 = *(_DWORD *)(*(_QWORD *)(a1 + 48) + 176);
      v12 = ne_log_obj();
      v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
      if (v11 == 3)
      {
        if (v13)
        {
          v14 = *(_QWORD **)(a1 + 48);
          if (v14[10])
          {
            ip_protocol = nw_parameters_get_ip_protocol();
            v14 = *(_QWORD **)(a1 + 48);
          }
          else
          {
            ip_protocol = 0;
          }
          v64 = (_QWORD *)v14[20];
          if (v64)
          {
            v74 = v64[7];
            v75 = v64[6];
            v68 = v64[8];
            v65 = v64[9];
            v76 = v68;
          }
          else
          {
            v65 = -1;
            v75 = -1;
            v76 = -1;
            v74 = -1;
          }
          v69 = (_QWORD *)v14[21];
          if (v69)
          {
            v71 = v69[6];
            v72 = v69[7];
            v70 = v69[8];
            v73 = v69[9];
          }
          else
          {
            v70 = -1;
            v71 = -1;
            v72 = -1;
            v73 = -1;
          }
          *(_DWORD *)buf = 136318210;
          v79 = out;
          v80 = 1024;
          v81 = ip_protocol;
          v82 = 2048;
          v83 = v75;
          v84 = 2048;
          *(_QWORD *)v85 = v74;
          *(_WORD *)&v85[8] = 2048;
          v86 = v76;
          v87 = 2048;
          v88 = v65;
          v89 = 2048;
          v90 = v71;
          v91 = 2048;
          v92 = v72;
          v93 = 2048;
          v94 = v70;
          v95 = 2048;
          v96 = v73;
          v97 = 1024;
          v98 = v6;
          v99 = 1024;
          v100 = v7;
          v101 = 1024;
          v102 = nw_frame_unclaimed_length();
          v51 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]Moving part"
                "ial frame (%u bytes of %u, %u bytes remaining)";
          v52 = v12;
          v53 = 116;
LABEL_49:
          _os_log_debug_impl(&dword_208439000, v52, OS_LOG_TYPE_DEBUG, v51, buf, v53);
        }
      }
      else if (v13)
      {
        v54 = *(_QWORD *)(a1 + 48);
        if (*(_QWORD *)(v54 + 80))
        {
          v55 = nw_parameters_get_ip_protocol();
          v54 = *(_QWORD *)(a1 + 48);
        }
        else
        {
          v55 = 0;
        }
        v66 = *(unsigned int *)(v54 + 176);
        if (v66 > 3)
          v67 = "unknown";
        else
          v67 = (&off_24C0A1818)[v66];
        *(_DWORD *)buf = 136316418;
        v79 = out;
        v80 = 1024;
        v81 = v55;
        v82 = 2080;
        v83 = (uint64_t)v67;
        v84 = 1024;
        *(_DWORD *)v85 = v6;
        *(_WORD *)&v85[4] = 1024;
        *(_DWORD *)&v85[6] = v7;
        LOWORD(v86) = 1024;
        *(_DWORD *)((char *)&v86 + 2) = nw_frame_unclaimed_length();
        v51 = "[filter %s %d %s] Moving partial frame (%u bytes of %u, %u bytes remaining)";
        v52 = v12;
        v53 = 46;
        goto LABEL_49;
      }
LABEL_41:
      ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
      nw_frame_array_append();
      return 1;
    }
    v45 = ne_log_obj();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_208439000, v45, OS_LOG_TYPE_FAULT, "nw_frame_create with partial data failed", buf, 2u);
    }
    free(v9);
  }
  else
  {
    v39 = ne_log_obj();
    result = os_log_type_enabled(v39, OS_LOG_TYPE_FAULT);
    if (!result)
      return result;
    *(_DWORD *)buf = 67109120;
    LODWORD(v79) = v6;
    _os_log_fault_impl(&dword_208439000, v39, OS_LOG_TYPE_FAULT, "calloc(%u) failed", buf, 8u);
  }
  return 0;
}

uint64_t __ne_filter_protocol_fulfill_frame_request_block_invoke_35(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    nw_frame_array_remove();
    nw_frame_array_append();
  }
  return 1;
}

void ne_filter_partial_input_frame_finalizer(void *a1)
{
  void *buffer;
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    buffer = (void *)nw_frame_get_buffer();
    free(buffer);
    nw_frame_reset();
    nw_release(a1);
  }
  else
  {
    v3 = ne_log_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      v4 = 136315138;
      v5 = "ne_filter_partial_input_frame_finalizer";
      _os_log_fault_impl(&dword_208439000, v3, OS_LOG_TYPE_FAULT, "%s called with null frame", (uint8_t *)&v4, 0xCu);
    }
  }
}

sockaddr *ne_filter_create_wildcard_remote_sockaddr(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  __int16 v5;
  sockaddr *result;
  int sa_family;

  v4 = *(NSObject **)(a2 + 72);
  if (v4)
    v5 = __rev16(nw_endpoint_get_port(v4));
  else
    v5 = 0;
  result = *(sockaddr **)(a2 + 64);
  if (!result
    || (result = (sockaddr *)nw_endpoint_get_type((nw_endpoint_t)result), (_DWORD)result != 1)
    || (result = (sockaddr *)nw_endpoint_get_address(*(nw_endpoint_t *)(a2 + 64))) == 0)
  {
    *(_QWORD *)(a1 + 12) = 0;
    *(_QWORD *)(a1 + 4) = 0;
    *(_QWORD *)(a1 + 20) = 0;
    goto LABEL_10;
  }
  sa_family = result->sa_family;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)a1 = 0;
  *(_DWORD *)(a1 + 24) = 0;
  if (sa_family != 2)
  {
LABEL_10:
    *(_WORD *)a1 = 7708;
    *(_OWORD *)(a1 + 8) = *MEMORY[0x24BDAE878];
    goto LABEL_11;
  }
  *(_WORD *)a1 = 528;
LABEL_11:
  *(_WORD *)(a1 + 2) = v5;
  return result;
}

uint64_t __ne_filter_data_protocol_send_data_block_invoke(uint64_t a1, void *a2)
{
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  NSObject *v26;
  uint32_t v27;
  uint64_t v28;
  uint8_t buf[4];
  char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  char out[40];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  memset(out, 0, 37);
  uuid_unparse(*(const unsigned __int8 **)(a1 + 32), out);
  v4 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 176);
  v5 = ne_log_obj();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4 == 3)
  {
    if (v6)
    {
      v7 = *(_QWORD **)(a1 + 32);
      v8 = v7[10];
      if (v8)
      {
        LODWORD(v8) = nw_parameters_get_ip_protocol();
        v7 = *(_QWORD **)(a1 + 32);
      }
      v9 = (_QWORD *)v7[20];
      if (v9)
      {
        v11 = v9[6];
        v12 = v9[7];
        v10 = v9[8];
        v13 = v9[9];
      }
      else
      {
        v10 = -1;
        v11 = -1;
        v12 = -1;
        v13 = -1;
      }
      v19 = (_QWORD *)v7[21];
      if (v19)
      {
        v21 = v19[6];
        v22 = v19[7];
        v20 = v19[8];
        v23 = v19[9];
      }
      else
      {
        v20 = -1;
        v21 = -1;
        v22 = -1;
        v23 = -1;
      }
      v28 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136317698;
      v30 = out;
      v31 = 1024;
      v32 = v8;
      v33 = 2048;
      v34 = v11;
      v35 = 2048;
      v36 = v12;
      v37 = 2048;
      v38 = v10;
      v39 = 2048;
      v40 = v13;
      v41 = 2048;
      v42 = v21;
      v43 = 2048;
      v44 = v22;
      v45 = 2048;
      v46 = v20;
      v47 = 2048;
      v48 = v23;
      v49 = 2048;
      v50 = v28;
      v25 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]send-data reply"
            " received for %zu bytes";
      v26 = v5;
      v27 = 108;
LABEL_20:
      _os_log_debug_impl(&dword_208439000, v26, OS_LOG_TYPE_DEBUG, v25, buf, v27);
    }
  }
  else if (v6)
  {
    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(_QWORD *)(v15 + 80);
    if (v16)
    {
      LODWORD(v16) = nw_parameters_get_ip_protocol();
      v15 = *(_QWORD *)(a1 + 32);
    }
    v17 = *(unsigned int *)(v15 + 176);
    if (v17 > 3)
      v18 = "unknown";
    else
      v18 = (&off_24C0A1818)[v17];
    v24 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 136315906;
    v30 = out;
    v31 = 1024;
    v32 = v16;
    v33 = 2080;
    v34 = (uint64_t)v18;
    v35 = 2048;
    v36 = v24;
    v25 = "[filter %s %d %s] send-data reply received for %zu bytes";
    v26 = v5;
    v27 = 38;
    goto LABEL_20;
  }
  xpc_retain(a2);
  return nw_queue_context_async();
}

void __ne_filter_data_protocol_send_data_block_invoke_30(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  const char *v4;
  NSObject *v5;
  uint32_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  NSObject *v14;
  const char *v15;
  const char *string;
  int v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  if (!v2)
    goto LABEL_4;
  if (MEMORY[0x20BD087A4](*(_QWORD *)(a1 + 32)) != MEMORY[0x24BDACFB8])
  {
    if (MEMORY[0x20BD087A4](v2) == MEMORY[0x24BDACFA0])
      goto LABEL_8;
LABEL_4:
    v3 = ne_log_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v17) = 0;
      v4 = "Got an invalid data message reply";
      v5 = v3;
      v6 = 2;
LABEL_23:
      _os_log_error_impl(&dword_208439000, v5, OS_LOG_TYPE_ERROR, v4, (uint8_t *)&v17, v6);
      goto LABEL_7;
    }
    goto LABEL_7;
  }
  v7 = ne_log_obj();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    string = xpc_dictionary_get_string(v2, (const char *)*MEMORY[0x24BDACF40]);
    v17 = 136315138;
    v18 = string;
    v4 = "Got an error on the XPC connection when sending a data message: %s";
    v5 = v7;
    v6 = 12;
    goto LABEL_23;
  }
LABEL_7:
  v2 = 0;
LABEL_8:
  ne_filter_process_verdict(*(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 56), v2, **(unsigned int **)(a1 + 48));
  xpc_release(*(xpc_object_t *)(a1 + 32));
  v8 = *(_QWORD *)(a1 + 40);
  if (!v8)
  {
    v14 = ne_log_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      return;
    LOWORD(v17) = 0;
    v15 = "protocol is null";
LABEL_20:
    _os_log_impl(&dword_208439000, v14, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v17, 2u);
    return;
  }
  v9 = *(_QWORD *)(v8 + 40);
  if (!v9)
  {
    v14 = ne_log_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      return;
    LOWORD(v17) = 0;
    v15 = "filter is null";
    goto LABEL_20;
  }
  v10 = (unsigned int *)(v9 + 180);
  do
    v11 = __ldaxr(v10);
  while (__stlxr(v11, v10));
  if (v11)
  {
    do
    {
      v12 = __ldaxr(v10);
      v13 = v12 - 1;
    }
    while (__stlxr(v13, v10));
    if (!v13)
      ne_filter_protocol_destroy(*(_QWORD *)(a1 + 40));
  }
}

BOOL __ne_filter_send_approved_frames_block_invoke(uint64_t a1)
{
  unsigned int v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unsigned int v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  NSObject *v29;
  uint32_t v30;
  uint64_t v31;
  int v32;
  char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  _BYTE v39[18];
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  unsigned int v51;
  __int16 v52;
  uint64_t v53;
  char out[40];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v2 = nw_frame_unclaimed_length();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(v3 + 104) + v2;
  v5 = *(_QWORD *)(v3 + 64);
  if (v4 <= v5)
  {
    v6 = v2;
    v7 = v2;
    nw_frame_array_remove();
    nw_frame_array_append();
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104) += v7;
    memset(out, 0, 37);
    uuid_unparse(*(const unsigned __int8 **)(a1 + 48), out);
    LODWORD(v7) = *(_DWORD *)(*(_QWORD *)(a1 + 48) + 176);
    v8 = ne_log_obj();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
    if ((_DWORD)v7 == 3)
    {
      if (v9)
      {
        v10 = *(_QWORD **)(a1 + 48);
        v11 = v10[10];
        if (v11)
        {
          LODWORD(v11) = nw_parameters_get_ip_protocol();
          v10 = *(_QWORD **)(a1 + 48);
        }
        v12 = (_QWORD *)v10[20];
        if (v12)
        {
          v14 = v12[6];
          v15 = v12[7];
          v13 = v12[8];
          v16 = v12[9];
        }
        else
        {
          v13 = -1;
          v14 = -1;
          v15 = -1;
          v16 = -1;
        }
        v22 = (_QWORD *)v10[21];
        if (v22)
        {
          v24 = v22[6];
          v25 = v22[7];
          v23 = v22[8];
          v26 = v22[9];
        }
        else
        {
          v23 = -1;
          v24 = -1;
          v25 = -1;
          v26 = -1;
        }
        v31 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
        v32 = 136317954;
        v33 = out;
        v34 = 1024;
        v35 = v11;
        v36 = 2048;
        v37 = v14;
        v38 = 2048;
        *(_QWORD *)v39 = v15;
        *(_WORD *)&v39[8] = 2048;
        *(_QWORD *)&v39[10] = v13;
        v40 = 2048;
        v41 = v16;
        v42 = 2048;
        v43 = v24;
        v44 = 2048;
        v45 = v25;
        v46 = 2048;
        v47 = v23;
        v48 = 2048;
        v49 = v26;
        v50 = 1024;
        v51 = v6;
        v52 = 2048;
        v53 = v31;
        v28 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]sending frame"
              " with length %u, pendingOutputStartOffset is now %llu";
        v29 = v8;
        v30 = 114;
LABEL_21:
        _os_log_debug_impl(&dword_208439000, v29, OS_LOG_TYPE_DEBUG, v28, (uint8_t *)&v32, v30);
      }
    }
    else if (v9)
    {
      v18 = *(_QWORD *)(a1 + 48);
      v19 = *(_QWORD *)(v18 + 80);
      if (v19)
      {
        LODWORD(v19) = nw_parameters_get_ip_protocol();
        v18 = *(_QWORD *)(a1 + 48);
      }
      v20 = *(unsigned int *)(v18 + 176);
      if (v20 > 3)
        v21 = "unknown";
      else
        v21 = (&off_24C0A1818)[v20];
      v27 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
      v32 = 136316162;
      v33 = out;
      v34 = 1024;
      v35 = v19;
      v36 = 2080;
      v37 = (uint64_t)v21;
      v38 = 1024;
      *(_DWORD *)v39 = v6;
      *(_WORD *)&v39[4] = 2048;
      *(_QWORD *)&v39[6] = v27;
      v28 = "[filter %s %d %s] sending frame with length %u, pendingOutputStartOffset is now %llu";
      v29 = v8;
      v30 = 44;
      goto LABEL_21;
    }
  }
  return v4 <= v5;
}

uint64_t __ne_filter_send_approved_frames_block_invoke_48()
{
  nw_frame_array_remove();
  nw_frame_finalize();
  return 1;
}

void ne_filter_data_protocol_send_new_flow(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unsigned int *v5;
  unsigned int v6;
  int server_mode;
  xpc_object_t v8;
  unsigned int ip_protocol;
  pid_t v10;
  int pid;
  const char *effective_bundle_id;
  NSObject *v13;
  const char *url;
  NSObject *v15;
  const sockaddr *address;
  NSObject *v17;
  nw_endpoint_type_t type;
  NSObject *v19;
  const sockaddr *v20;
  const char *parent_endpoint_domain;
  NSObject *v22;
  NSObject *v23;
  int v24;
  NSObject *v25;
  _BOOL4 v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int v33;
  os_unfair_lock_s *v34;
  unsigned int v35;
  int v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  NSObject *v48;
  uint32_t v49;
  pid_t v50;
  _QWORD v51[7];
  unsigned int length;
  _BYTE length_4[58];
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  uint64_t v61;
  char v62[48];
  _OWORD bytes[2];
  char v64[48];
  char out[40];
  unsigned __int8 uu[8];
  uint64_t v67;
  unsigned __int8 uuid[8];
  uint64_t v69;
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)uuid = 0;
  v69 = 0;
  *(_QWORD *)uu = 0;
  v67 = 0;
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    v5 = (unsigned int *)(v2 + 180);
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6, v5));
    if (!v6)
      return;
    server_mode = nw_parameters_get_server_mode();
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v8, "command", 6);
    xpc_dictionary_set_uuid(v8, "flow-uuid", (const unsigned __int8 *)v2);
    ip_protocol = nw_parameters_get_ip_protocol();
    xpc_dictionary_set_uint64(v8, "ip-protocol", ip_protocol);
    v10 = getpid();
    xpc_dictionary_set_uint64(v8, "client-pid", v10);
    pid = nw_parameters_get_pid();
    xpc_dictionary_set_uint64(v8, "client-e-pid", pid);
    xpc_dictionary_set_uint64(v8, "connection-direction", server_mode ^ 1u);
    nw_parameters_get_proc_uuid();
    xpc_dictionary_set_uuid(v8, "client-proc-uuid", uuid);
    nw_parameters_get_e_proc_uuid();
    xpc_dictionary_set_uuid(v8, "client-e-proc-uuid", uu);
    effective_bundle_id = (const char *)nw_parameters_get_effective_bundle_id();
    if (effective_bundle_id)
      xpc_dictionary_set_string(v8, "source-app-bundle-id", effective_bundle_id);
    memset(out, 0, 37);
    memset(v64, 0, 37);
    uuid_unparse(uuid, out);
    uuid_unparse(uu, v64);
    v13 = ne_log_obj();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v50 = getpid();
      v36 = nw_parameters_get_pid();
      *(_DWORD *)length_4 = 67110402;
      v37 = "(no bundle id)";
      *(_DWORD *)&length_4[4] = v50;
      if (effective_bundle_id)
        v37 = effective_bundle_id;
      *(_WORD *)&length_4[8] = 1024;
      v38 = "OUT";
      *(_DWORD *)&length_4[10] = v36;
      *(_WORD *)&length_4[14] = 2080;
      *(_QWORD *)&length_4[16] = out;
      if (server_mode)
        v38 = "IN";
      *(_WORD *)&length_4[24] = 2080;
      *(_QWORD *)&length_4[26] = v64;
      *(_WORD *)&length_4[34] = 2080;
      *(_QWORD *)&length_4[36] = v37;
      *(_WORD *)&length_4[44] = 2080;
      *(_QWORD *)&length_4[46] = v38;
      _os_log_debug_impl(&dword_208439000, v13, OS_LOG_TYPE_DEBUG, "FILTER PROTOCOL: New flow info:\n\t\t\t\tpid:\t%d\n\t\t\t\tepid:\t%d\n\t\t\t\tuuid:\t%s\n\t\t\t\teuuid:\t%s\n\t\t\t\tbundle id: %s\n\t\t\t\tconnection Dir: %s", length_4, 0x36u);
    }
    url = (const char *)nw_parameters_get_url();
    if (url)
      xpc_dictionary_set_string(v8, "url", url);
    v15 = *(NSObject **)(v2 + 64);
    if (v15)
    {
      if (nw_endpoint_get_type(v15) == nw_endpoint_type_address)
      {
        address = nw_endpoint_get_address(*(nw_endpoint_t *)(v2 + 64));
        if (address)
          xpc_dictionary_set_data(v8, "local-addr", address, address->sa_len);
      }
    }
    v17 = *(NSObject **)(v2 + 72);
    if (v17)
    {
      type = nw_endpoint_get_type(v17);
      v19 = *(NSObject **)(v2 + 72);
      if (type == nw_endpoint_type_address)
      {
        v20 = nw_endpoint_get_address(v19);
        if (v20)
          xpc_dictionary_set_data(v8, "remote-addr", v20, v20->sa_len);
        parent_endpoint_domain = (const char *)nw_endpoint_get_parent_endpoint_domain();
        if (!parent_endpoint_domain)
          goto LABEL_25;
      }
      else
      {
        if (nw_endpoint_get_type(v19) != nw_endpoint_type_host)
          goto LABEL_25;
        memset(length_4, 0, 28);
        ne_filter_create_wildcard_remote_sockaddr((uint64_t)length_4, v2);
        xpc_dictionary_set_data(v8, "remote-addr", length_4, length_4[0]);
        parent_endpoint_domain = nw_endpoint_get_hostname(*(nw_endpoint_t *)(v2 + 72));
        if (!parent_endpoint_domain)
          goto LABEL_25;
      }
      xpc_dictionary_set_string(v8, "remote-hostname", parent_endpoint_domain);
    }
LABEL_25:
    memset(bytes, 0, sizeof(bytes));
    length = 0;
    if (ne_filter_generate_crypto_signature(*(_DWORD *)(a2 + 4), v2, (uint64_t)bytes, &length, 0))
    {
      xpc_dictionary_set_data(v8, "crypto-signature", bytes, length);
    }
    else
    {
      v23 = ne_log_obj();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)length_4 = 0;
        _os_log_error_impl(&dword_208439000, v23, OS_LOG_TYPE_ERROR, "Failed to generate signature for new flow message", length_4, 2u);
      }
    }
    memset(v62, 0, 37);
    uuid_unparse((const unsigned __int8 *)v2, v62);
    v24 = *(_DWORD *)(v2 + 176);
    v25 = ne_log_obj();
    v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG);
    if (v24 == 3)
    {
      if (v26)
      {
        v27 = *(_QWORD *)(v2 + 80);
        if (v27)
          LODWORD(v27) = nw_parameters_get_ip_protocol();
        v28 = *(_QWORD **)(v2 + 160);
        if (v28)
        {
          v30 = v28[6];
          v31 = v28[7];
          v29 = v28[8];
          v32 = v28[9];
        }
        else
        {
          v29 = -1;
          v30 = -1;
          v31 = -1;
          v32 = -1;
        }
        v42 = *(_QWORD **)(v2 + 168);
        if (v42)
        {
          v44 = v42[6];
          v45 = v42[7];
          v43 = v42[8];
          v46 = v42[9];
        }
        else
        {
          v43 = -1;
          v44 = -1;
          v45 = -1;
          v46 = -1;
        }
        *(_DWORD *)length_4 = 136317442;
        *(_QWORD *)&length_4[4] = v62;
        *(_WORD *)&length_4[12] = 1024;
        *(_DWORD *)&length_4[14] = v27;
        *(_WORD *)&length_4[18] = 2048;
        *(_QWORD *)&length_4[20] = v30;
        *(_WORD *)&length_4[28] = 2048;
        *(_QWORD *)&length_4[30] = v31;
        *(_WORD *)&length_4[38] = 2048;
        *(_QWORD *)&length_4[40] = v29;
        *(_WORD *)&length_4[48] = 2048;
        *(_QWORD *)&length_4[50] = v32;
        v54 = 2048;
        v55 = v44;
        v56 = 2048;
        v57 = v45;
        v58 = 2048;
        v59 = v43;
        v60 = 2048;
        v61 = v46;
        v47 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]sending new flow message";
        v48 = v25;
        v49 = 98;
LABEL_55:
        _os_log_debug_impl(&dword_208439000, v48, OS_LOG_TYPE_DEBUG, v47, length_4, v49);
        goto LABEL_36;
      }
    }
    else if (v26)
    {
      v39 = *(_QWORD *)(v2 + 80);
      if (v39)
        LODWORD(v39) = nw_parameters_get_ip_protocol();
      v40 = *(unsigned int *)(v2 + 176);
      if (v40 > 3)
        v41 = "unknown";
      else
        v41 = (&off_24C0A1818)[v40];
      *(_DWORD *)length_4 = 136315650;
      *(_QWORD *)&length_4[4] = v62;
      *(_WORD *)&length_4[12] = 1024;
      *(_DWORD *)&length_4[14] = v39;
      *(_WORD *)&length_4[18] = 2080;
      *(_QWORD *)&length_4[20] = v41;
      v47 = "[filter %s %d %s] sending new flow message";
      v48 = v25;
      v49 = 28;
      goto LABEL_55;
    }
    do
LABEL_36:
      v33 = __ldaxr(v5);
    while (__stlxr(v33 + 1, v5));
    v34 = *(os_unfair_lock_s **)(v2 + 96);
    v35 = *(_DWORD *)(a2 + 4);
    v51[0] = MEMORY[0x24BDAC760];
    v51[1] = 0x40000000;
    v51[2] = __ne_filter_data_protocol_send_new_flow_block_invoke;
    v51[3] = &__block_descriptor_tmp_63;
    v51[4] = v2;
    v51[5] = a1;
    v51[6] = a2;
    ne_filter_send_message(v34, v35, v8, v51);
    xpc_release(v8);
    return;
  }
  v22 = ne_log_obj();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)length_4 = 0;
    _os_log_impl(&dword_208439000, v22, OS_LOG_TYPE_INFO, "filter is null", length_4, 2u);
  }
}

uint64_t __ne_filter_data_protocol_send_new_flow_block_invoke(uint64_t a1, void *a2)
{
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  NSObject *v25;
  uint32_t v26;
  uint8_t buf[4];
  char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  char out[40];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  memset(out, 0, 37);
  uuid_unparse(*(const unsigned __int8 **)(a1 + 32), out);
  v4 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 176);
  v5 = ne_log_obj();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4 == 3)
  {
    if (v6)
    {
      v7 = *(_QWORD **)(a1 + 32);
      v8 = v7[10];
      if (v8)
      {
        LODWORD(v8) = nw_parameters_get_ip_protocol();
        v7 = *(_QWORD **)(a1 + 32);
      }
      v9 = (_QWORD *)v7[20];
      if (v9)
      {
        v11 = v9[6];
        v12 = v9[7];
        v10 = v9[8];
        v13 = v9[9];
      }
      else
      {
        v10 = -1;
        v11 = -1;
        v12 = -1;
        v13 = -1;
      }
      v19 = (_QWORD *)v7[21];
      if (v19)
      {
        v21 = v19[6];
        v22 = v19[7];
        v20 = v19[8];
        v23 = v19[9];
      }
      else
      {
        v20 = -1;
        v21 = -1;
        v22 = -1;
        v23 = -1;
      }
      *(_DWORD *)buf = 136317442;
      v28 = out;
      v29 = 1024;
      v30 = v8;
      v31 = 2048;
      v32 = v11;
      v33 = 2048;
      v34 = v12;
      v35 = 2048;
      v36 = v10;
      v37 = 2048;
      v38 = v13;
      v39 = 2048;
      v40 = v21;
      v41 = 2048;
      v42 = v22;
      v43 = 2048;
      v44 = v20;
      v45 = 2048;
      v46 = v23;
      v24 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]received new flow xpc reply";
      v25 = v5;
      v26 = 98;
LABEL_20:
      _os_log_debug_impl(&dword_208439000, v25, OS_LOG_TYPE_DEBUG, v24, buf, v26);
    }
  }
  else if (v6)
  {
    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(_QWORD *)(v15 + 80);
    if (v16)
    {
      LODWORD(v16) = nw_parameters_get_ip_protocol();
      v15 = *(_QWORD *)(a1 + 32);
    }
    v17 = *(unsigned int *)(v15 + 176);
    if (v17 > 3)
      v18 = "unknown";
    else
      v18 = (&off_24C0A1818)[v17];
    *(_DWORD *)buf = 136315650;
    v28 = out;
    v29 = 1024;
    v30 = v16;
    v31 = 2080;
    v32 = (uint64_t)v18;
    v24 = "[filter %s %d %s] received new flow xpc reply";
    v25 = v5;
    v26 = 28;
    goto LABEL_20;
  }
  xpc_retain(a2);
  return nw_queue_context_async();
}

void __ne_filter_data_protocol_send_new_flow_block_invoke_61(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  const char *v4;
  NSObject *v5;
  uint32_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  NSObject *v14;
  const char *v15;
  const char *string;
  int v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  if (!v2)
    goto LABEL_4;
  if (MEMORY[0x20BD087A4](*(_QWORD *)(a1 + 32)) != MEMORY[0x24BDACFB8])
  {
    if (MEMORY[0x20BD087A4](v2) == MEMORY[0x24BDACFA0])
      goto LABEL_8;
LABEL_4:
    v3 = ne_log_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v17) = 0;
      v4 = "Got an invalid new flow message reply";
      v5 = v3;
      v6 = 2;
LABEL_23:
      _os_log_error_impl(&dword_208439000, v5, OS_LOG_TYPE_ERROR, v4, (uint8_t *)&v17, v6);
      goto LABEL_7;
    }
    goto LABEL_7;
  }
  v7 = ne_log_obj();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    string = xpc_dictionary_get_string(v2, (const char *)*MEMORY[0x24BDACF40]);
    v17 = 136315138;
    v18 = string;
    v4 = "Got an error on the XPC connection when sending a new flow message: %s";
    v5 = v7;
    v6 = 12;
    goto LABEL_23;
  }
LABEL_7:
  v2 = 0;
LABEL_8:
  ne_filter_process_verdict(*(_QWORD *)(a1 + 40), 6, v2, **(unsigned int **)(a1 + 48));
  xpc_release(*(xpc_object_t *)(a1 + 32));
  v8 = *(_QWORD *)(a1 + 40);
  if (!v8)
  {
    v14 = ne_log_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      return;
    LOWORD(v17) = 0;
    v15 = "protocol is null";
LABEL_20:
    _os_log_impl(&dword_208439000, v14, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v17, 2u);
    return;
  }
  v9 = *(_QWORD *)(v8 + 40);
  if (!v9)
  {
    v14 = ne_log_obj();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      return;
    LOWORD(v17) = 0;
    v15 = "filter is null";
    goto LABEL_20;
  }
  v10 = (unsigned int *)(v9 + 180);
  do
    v11 = __ldaxr(v10);
  while (__stlxr(v11, v10));
  if (v11)
  {
    do
    {
      v12 = __ldaxr(v10);
      v13 = v12 - 1;
    }
    while (__stlxr(v13, v10));
    if (!v13)
      ne_filter_protocol_destroy(*(_QWORD *)(a1 + 40));
  }
}

void ne_filter_read_from_network(uint64_t a1, uint64_t a2, char a3)
{
  unsigned int *v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  int v9;
  int v10;
  int v11;
  NSObject *v12;
  _BOOL4 v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  int v21;
  NSObject *v22;
  _BOOL4 v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  NSObject *v45;
  uint32_t v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  NSObject *v53;
  uint32_t v54;
  uint8_t buf[4];
  char *v56;
  __int16 v57;
  int v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  uint64_t v64;
  __int16 v65;
  uint64_t v66;
  __int16 v67;
  uint64_t v68;
  __int16 v69;
  uint64_t v70;
  __int16 v71;
  uint64_t v72;
  __int16 v73;
  uint64_t v74;
  __int16 v75;
  int v76;
  char out[40];
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v4 = (unsigned int *)(a1 + 180);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5, v4));
    if (v5)
    {
      if ((a3 & 1) != 0)
        goto LABEL_10;
      v6 = *(_QWORD *)(a1 + 144);
      if (!v6)
        goto LABEL_10;
      while (*(_DWORD *)(v6 + 40) != 3 || *(_QWORD *)(v6 + 48) == -1)
      {
        v6 = *(_QWORD *)(v6 + 152);
        if (!v6)
          goto LABEL_10;
      }
      v30 = *(_QWORD *)(v6 + 88) + nw_frame_array_unclaimed_length();
      v31 = *(_QWORD *)(v6 + 56);
      if (v31 > v30 && (_DWORD)v31 != (_DWORD)v30)
      {
LABEL_10:
        nw_frame_array_init();
        v7 = *(_QWORD *)(a1 + 32);
        if (v7)
        {
          v8 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 + 24) + 80);
          if (v8)
          {
            v9 = v8(v7, a1);
            if (v9)
            {
              v10 = v9;
              memset(out, 0, 37);
              uuid_unparse((const unsigned __int8 *)a1, out);
              v11 = *(_DWORD *)(a1 + 176);
              v12 = ne_log_obj();
              v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
              if (v11 == 3)
              {
                if (v13)
                {
                  v14 = *(_QWORD *)(a1 + 80);
                  if (v14)
                    LODWORD(v14) = nw_parameters_get_ip_protocol();
                  v15 = *(_QWORD **)(a1 + 160);
                  if (v15)
                  {
                    v17 = v15[6];
                    v18 = v15[7];
                    v16 = v15[8];
                    v19 = v15[9];
                  }
                  else
                  {
                    v16 = -1;
                    v17 = -1;
                    v18 = -1;
                    v19 = -1;
                  }
                  v39 = *(_QWORD **)(a1 + 168);
                  if (v39)
                  {
                    v41 = v39[6];
                    v42 = v39[7];
                    v40 = v39[8];
                    v43 = v39[9];
                  }
                  else
                  {
                    v40 = -1;
                    v41 = -1;
                    v42 = -1;
                    v43 = -1;
                  }
                  *(_DWORD *)buf = 136317698;
                  v56 = out;
                  v57 = 1024;
                  v58 = v14;
                  v59 = 2048;
                  v60 = v17;
                  v61 = 2048;
                  v62 = v18;
                  v63 = 2048;
                  v64 = v16;
                  v65 = 2048;
                  v66 = v19;
                  v67 = 2048;
                  v68 = v41;
                  v69 = 2048;
                  v70 = v42;
                  v71 = 2048;
                  v72 = v40;
                  v73 = 2048;
                  v74 = v43;
                  v75 = 1024;
                  v76 = v10;
                  v44 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]rec"
                        "eived %u frames from output handler";
                  v45 = v12;
                  v46 = 104;
LABEL_52:
                  _os_log_debug_impl(&dword_208439000, v45, OS_LOG_TYPE_DEBUG, v44, buf, v46);
                }
              }
              else if (v13)
              {
                v33 = *(_QWORD *)(a1 + 80);
                if (v33)
                  LODWORD(v33) = nw_parameters_get_ip_protocol();
                v34 = *(unsigned int *)(a1 + 176);
                if (v34 > 3)
                  v35 = "unknown";
                else
                  v35 = (&off_24C0A1818)[v34];
                *(_DWORD *)buf = 136315906;
                v56 = out;
                v57 = 1024;
                v58 = v33;
                v59 = 2080;
                v60 = (uint64_t)v35;
                v61 = 1024;
                LODWORD(v62) = v10;
                v44 = "[filter %s %d %s] received %u frames from output handler";
                v45 = v12;
                v46 = 34;
                goto LABEL_52;
              }
              nw_frame_array_append_array();
              return;
            }
            memset(out, 0, 37);
            uuid_unparse((const unsigned __int8 *)a1, out);
            v21 = *(_DWORD *)(a1 + 176);
            v22 = ne_log_obj();
            v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG);
            if (v21 == 3)
            {
              if (v23)
              {
                v24 = *(_QWORD *)(a1 + 80);
                if (v24)
                  LODWORD(v24) = nw_parameters_get_ip_protocol();
                v25 = *(_QWORD **)(a1 + 160);
                if (v25)
                {
                  v27 = v25[6];
                  v28 = v25[7];
                  v26 = v25[8];
                  v29 = v25[9];
                }
                else
                {
                  v26 = -1;
                  v27 = -1;
                  v28 = -1;
                  v29 = -1;
                }
                v47 = *(_QWORD **)(a1 + 168);
                if (v47)
                {
                  v49 = v47[6];
                  v50 = v47[7];
                  v48 = v47[8];
                  v51 = v47[9];
                }
                else
                {
                  v48 = -1;
                  v49 = -1;
                  v50 = -1;
                  v51 = -1;
                }
                *(_DWORD *)buf = 136317442;
                v56 = out;
                v57 = 1024;
                v58 = v24;
                v59 = 2048;
                v60 = v27;
                v61 = 2048;
                v62 = v28;
                v63 = 2048;
                v64 = v26;
                v65 = 2048;
                v66 = v29;
                v67 = 2048;
                v68 = v49;
                v69 = 2048;
                v70 = v50;
                v71 = 2048;
                v72 = v48;
                v73 = 2048;
                v74 = v51;
                v52 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]no fr"
                      "ames returned from output handler";
                v53 = v22;
                v54 = 98;
LABEL_60:
                _os_log_debug_impl(&dword_208439000, v53, OS_LOG_TYPE_DEBUG, v52, buf, v54);
              }
            }
            else if (v23)
            {
              v36 = *(_QWORD *)(a1 + 80);
              if (v36)
                LODWORD(v36) = nw_parameters_get_ip_protocol();
              v37 = *(unsigned int *)(a1 + 176);
              if (v37 > 3)
                v38 = "unknown";
              else
                v38 = (&off_24C0A1818)[v37];
              *(_DWORD *)buf = 136315650;
              v56 = out;
              v57 = 1024;
              v58 = v36;
              v59 = 2080;
              v60 = (uint64_t)v38;
              v52 = "[filter %s %d %s] no frames returned from output handler";
              v53 = v22;
              v54 = 28;
              goto LABEL_60;
            }
          }
        }
      }
    }
  }
  else
  {
    v20 = ne_log_obj();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v56 = "ne_filter_read_from_network";
      _os_log_fault_impl(&dword_208439000, v20, OS_LOG_TYPE_FAULT, "%s called with null filter", buf, 0xCu);
    }
  }
}

uint64_t __ne_filter_protocol_finalize_output_frames_block_invoke()
{
  nw_frame_array_remove();
  nw_frame_finalize();
  return 1;
}

uint64_t __ne_filter_protocol_get_input_frames_block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    nw_frame_array_remove();
    nw_frame_array_append();
  }
  return 1;
}

uint64_t __ne_filter_protocol_get_input_frames_block_invoke_43(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    nw_frame_array_remove();
    nw_frame_array_append();
  }
  return 1;
}

void __ne_filter_protocol_get_input_frames_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unsigned int *v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  __int16 v11;
  __int16 v12;

  ne_filter_handle_input_finished(*(_QWORD *)(a1 + 32), 0);
  ne_filter_cleanup(*(_QWORD *)(a1 + 32));
  v2 = *(_QWORD *)(a1 + 32);
  if (!v2)
  {
    v8 = ne_log_obj();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      return;
    v12 = 0;
    v9 = "protocol is null";
    v10 = (uint8_t *)&v12;
LABEL_13:
    _os_log_impl(&dword_208439000, v8, OS_LOG_TYPE_INFO, v9, v10, 2u);
    return;
  }
  v3 = *(_QWORD *)(v2 + 40);
  if (!v3)
  {
    v8 = ne_log_obj();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      return;
    v11 = 0;
    v9 = "filter is null";
    v10 = (uint8_t *)&v11;
    goto LABEL_13;
  }
  v4 = (unsigned int *)(v3 + 180);
  do
    v5 = __ldaxr(v4);
  while (__stlxr(v5, v4));
  if (v5)
  {
    do
    {
      v6 = __ldaxr(v4);
      v7 = v6 - 1;
    }
    while (__stlxr(v7, v4));
    if (!v7)
      ne_filter_protocol_destroy(*(_QWORD *)(a1 + 32));
  }
}

void __ne_filter_protocol_add_input_handler_block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __ne_filter_protocol_add_input_handler_block_invoke_2(uint64_t a1)
{
  nw_queue_context_async();
  dispatch_release(*(dispatch_object_t *)(a1 + 56));
  dispatch_release(*(dispatch_object_t *)(a1 + 64));
}

void __ne_filter_protocol_add_input_handler_block_invoke_3(uint64_t a1)
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int *v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  const char *v33;
  NSObject *v34;
  uint32_t v35;
  int v36;
  int v37;
  char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  int v58;
  char out[40];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  memset(out, 0, 37);
  uuid_unparse(*(const unsigned __int8 **)(a1 + 40), out);
  v2 = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 176);
  v3 = ne_log_obj();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (v2 == 3)
  {
    if (!v4)
      goto LABEL_8;
    v5 = *(_QWORD **)(a1 + 40);
    v6 = v5[10];
    if (v6)
    {
      LODWORD(v6) = nw_parameters_get_ip_protocol();
      v5 = *(_QWORD **)(a1 + 40);
    }
    v7 = (_QWORD *)v5[20];
    if (v7)
    {
      v9 = v7[6];
      v10 = v7[7];
      v8 = v7[8];
      v11 = v7[9];
    }
    else
    {
      v8 = -1;
      v9 = -1;
      v10 = -1;
      v11 = -1;
    }
    v27 = (_QWORD *)v5[21];
    if (v27)
    {
      v29 = v27[6];
      v30 = v27[7];
      v28 = v27[8];
      v31 = v27[9];
    }
    else
    {
      v28 = -1;
      v29 = -1;
      v30 = -1;
      v31 = -1;
    }
    v36 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    v37 = 136317698;
    v38 = out;
    v39 = 1024;
    v40 = v6;
    v41 = 2048;
    v42 = v9;
    v43 = 2048;
    v44 = v10;
    v45 = 2048;
    v46 = v8;
    v47 = 2048;
    v48 = v11;
    v49 = 2048;
    v50 = v29;
    v51 = 2048;
    v52 = v30;
    v53 = 2048;
    v54 = v28;
    v55 = 2048;
    v56 = v31;
    v57 = 1024;
    v58 = v36;
    v33 = "[filter %s %d more-data first (in %lld/%lld out %lld/%lld) last (in %lld/%lld out %lld/%lld)]all provider conn"
          "ection requests complete with success: %d";
    v34 = v3;
    v35 = 104;
  }
  else
  {
    if (!v4)
      goto LABEL_8;
    v23 = *(_QWORD *)(a1 + 40);
    v24 = *(_QWORD *)(v23 + 80);
    if (v24)
    {
      LODWORD(v24) = nw_parameters_get_ip_protocol();
      v23 = *(_QWORD *)(a1 + 40);
    }
    v25 = *(unsigned int *)(v23 + 176);
    if (v25 > 3)
      v26 = "unknown";
    else
      v26 = (&off_24C0A1818)[v25];
    v32 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    v37 = 136315906;
    v38 = out;
    v39 = 1024;
    v40 = v24;
    v41 = 2080;
    v42 = (uint64_t)v26;
    v43 = 1024;
    LODWORD(v44) = v32;
    v33 = "[filter %s %d %s] all provider connection requests complete with success: %d";
    v34 = v3;
    v35 = 34;
  }
  _os_log_debug_impl(&dword_208439000, v34, OS_LOG_TYPE_DEBUG, v33, (uint8_t *)&v37, v35);
LABEL_8:
  v12 = *(_QWORD *)(a1 + 40);
  v13 = *(_DWORD *)(v12 + 120);
  if ((v13 & 1) == 0)
  {
    *(_DWORD *)(v12 + 120) = v13 & 0xFFFFFFFD;
    v14 = *(_QWORD *)(a1 + 40);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    {
      if ((*(_BYTE *)(v14 + 120) & 4) != 0)
        ne_filter_protocol_connect(v14);
    }
    else
    {
      ne_filter_protocol_drop_flow((_QWORD *)v14);
    }
  }
  v15 = *(_QWORD *)(a1 + 48);
  if (!v15)
  {
    v21 = ne_log_obj();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      return;
    LOWORD(v37) = 0;
    v22 = "protocol is null";
LABEL_25:
    _os_log_impl(&dword_208439000, v21, OS_LOG_TYPE_INFO, v22, (uint8_t *)&v37, 2u);
    return;
  }
  v16 = *(_QWORD *)(v15 + 40);
  if (!v16)
  {
    v21 = ne_log_obj();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      return;
    LOWORD(v37) = 0;
    v22 = "filter is null";
    goto LABEL_25;
  }
  v17 = (unsigned int *)(v16 + 180);
  do
    v18 = __ldaxr(v17);
  while (__stlxr(v18, v17));
  if (v18)
  {
    do
    {
      v19 = __ldaxr(v17);
      v20 = v19 - 1;
    }
    while (__stlxr(v20, v17));
    if (!v20)
      ne_filter_protocol_destroy(*(_QWORD *)(a1 + 48));
  }
}

__int128 *ne_filter_protocol_identifier()
{
  if (ne_filter_protocol_identifier_onceToken != -1)
    dispatch_once(&ne_filter_protocol_identifier_onceToken, &__block_literal_global_2);
  if (ne_filter_protocol_identifier_g_hasNESMAccess)
    return &g_filter_protocol_identifier;
  else
    return 0;
}

void ne_filter_protocol_retain(uint64_t a1)
{
  uint64_t v1;
  unsigned int *v2;
  unsigned int v3;
  unsigned int v4;
  NSObject *v5;
  const char *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    v5 = ne_log_obj();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      return;
    v7 = 136315138;
    v8 = "ne_filter_protocol_retain";
    v6 = "%s called with null protocol";
    goto LABEL_13;
  }
  v1 = *(_QWORD *)(a1 + 40);
  if (!v1)
  {
    v5 = ne_log_obj();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      return;
    v7 = 136315138;
    v8 = "ne_filter_protocol_retain";
    v6 = "%s called with null filter";
LABEL_13:
    _os_log_fault_impl(&dword_208439000, v5, OS_LOG_TYPE_FAULT, v6, (uint8_t *)&v7, 0xCu);
    return;
  }
  v2 = (unsigned int *)(v1 + 180);
  do
    v3 = __ldaxr(v2);
  while (__stlxr(v3, v2));
  if (v3)
  {
    do
      v4 = __ldaxr(v2);
    while (__stlxr(v4 + 1, v2));
  }
}

void ne_filter_protocol_release(uint64_t a1)
{
  uint64_t v1;
  unsigned int *v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  __int16 v9;
  __int16 v10;

  if (!a1)
  {
    v6 = ne_log_obj();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      return;
    v10 = 0;
    v7 = "protocol is null";
    v8 = (uint8_t *)&v10;
LABEL_13:
    _os_log_impl(&dword_208439000, v6, OS_LOG_TYPE_INFO, v7, v8, 2u);
    return;
  }
  v1 = *(_QWORD *)(a1 + 40);
  if (!v1)
  {
    v6 = ne_log_obj();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      return;
    v9 = 0;
    v7 = "filter is null";
    v8 = (uint8_t *)&v9;
    goto LABEL_13;
  }
  v2 = (unsigned int *)(v1 + 180);
  do
    v3 = __ldaxr(v2);
  while (__stlxr(v3, v2));
  if (v3)
  {
    do
    {
      v4 = __ldaxr(v2);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, v2));
    if (!v5)
      ne_filter_protocol_destroy(a1);
  }
}

void ne_filter_protocol_handle_message(uint64_t a1, xpc_object_t object)
{
  uint64_t v2;
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  NSObject *v6;
  const char *v7;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    v6 = ne_log_obj();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      return;
    *(_DWORD *)buf = 136315138;
    v9 = "ne_filter_protocol_handle_message";
    v7 = "%s called with null protocol";
    goto LABEL_13;
  }
  v2 = *(_QWORD *)(a1 + 40);
  if (!v2)
  {
    v6 = ne_log_obj();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      return;
    *(_DWORD *)buf = 136315138;
    v9 = "ne_filter_protocol_handle_message";
    v7 = "%s called with null filter";
LABEL_13:
    _os_log_fault_impl(&dword_208439000, v6, OS_LOG_TYPE_FAULT, v7, buf, 0xCu);
    return;
  }
  v3 = (unsigned int *)(v2 + 180);
  do
    v4 = __ldaxr(v3);
  while (__stlxr(v4, v3));
  if (v4)
  {
    do
      v5 = __ldaxr(v3);
    while (__stlxr(v5 + 1, v3));
    xpc_retain(object);
    nw_queue_context_async();
  }
}

void __ne_filter_protocol_handle_message_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unsigned int *v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  __int16 v11;
  __int16 v12;

  ne_filter_process_verdict(*(_QWORD **)(a1 + 32), 0, *(void **)(a1 + 40), *(_DWORD *)(a1 + 48));
  xpc_release(*(xpc_object_t *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 32);
  if (!v2)
  {
    v8 = ne_log_obj();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      return;
    v12 = 0;
    v9 = "protocol is null";
    v10 = (uint8_t *)&v12;
LABEL_13:
    _os_log_impl(&dword_208439000, v8, OS_LOG_TYPE_INFO, v9, v10, 2u);
    return;
  }
  v3 = *(_QWORD *)(v2 + 40);
  if (!v3)
  {
    v8 = ne_log_obj();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      return;
    v11 = 0;
    v9 = "filter is null";
    v10 = (uint8_t *)&v11;
    goto LABEL_13;
  }
  v4 = (unsigned int *)(v3 + 180);
  do
    v5 = __ldaxr(v4);
  while (__stlxr(v5, v4));
  if (v5)
  {
    do
    {
      v6 = __ldaxr(v4);
      v7 = v6 - 1;
    }
    while (__stlxr(v7, v4));
    if (!v7)
      ne_filter_protocol_destroy(*(_QWORD *)(a1 + 32));
  }
}

uint64_t NEPIDByName(const char *a1)
{
  int v2;
  _DWORD *v3;
  _DWORD *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  int *v11;
  char *v12;
  size_t v13;
  int v14;
  int buffer;
  const char *v16;
  __int16 v17;
  char *v18;
  int v19[2];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)v19 = 0x600000001;
  v14 = 0;
  v13 = 4;
  if (sysctl(v19, 2u, &v14, &v13, 0, 0) < 0)
  {
    v9 = ne_log_obj();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = __error();
      v12 = strerror(*v11);
      buffer = 136315394;
      v16 = "NEKernMaxProc";
      v17 = 2080;
      v18 = v12;
      _os_log_error_impl(&dword_208439000, v9, OS_LOG_TYPE_ERROR, "%s: Failed to get max proc count (%s)", (uint8_t *)&buffer, 0x16u);
    }
    return 0;
  }
  if (!v14)
    return 0;
  v2 = 4 * v14;
  v3 = malloc_type_malloc(4 * v14, 0xF88153BEuLL);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = proc_listallpids(v3, v2);
  if (v5 < 1)
  {
LABEL_9:
    v8 = 0;
  }
  else
  {
    v6 = 0;
    v7 = v5;
    while (!proc_name(v4[v6], &buffer, 0x64u) || strcmp((const char *)&buffer, a1))
    {
      if (v7 == ++v6)
        goto LABEL_9;
    }
    v8 = v4[v6];
  }
  free(v4);
  return v8;
}

xpc_object_t NECopySigningIdentifierForPID(int a1)
{
  return NECopySigningIdentifierForPIDwithAuditToken(a1, 0);
}

CFStringRef NECopySigningIdentifierForXPCMessage(void *a1)
{
  NSObject *v2;
  CFStringRef v3;
  const __CFAllocator *v5;
  __SecTask *v6;
  __SecTask *v7;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  uint8_t *p_cf;
  NSObject *v12;
  uint32_t v13;
  _xpc_connection_s *remote_connection;
  pid_t pid;
  audit_token_t cf;
  uint8_t v17[4];
  pid_t v18;
  uint8_t buf[16];
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (!a1 || MEMORY[0x20BD087A4]() != MEMORY[0x24BDACFA0])
  {
    v2 = ne_log_obj();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      return 0;
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "NECopySigningIdentifierForXPCMessage";
    v10 = "XPC object passed to %s is NULL or is not a dictionary";
    p_cf = buf;
    v12 = v2;
    v13 = 12;
LABEL_15:
    _os_log_error_impl(&dword_208439000, v12, OS_LOG_TYPE_ERROR, v10, p_cf, v13);
    return 0;
  }
  *(_OWORD *)buf = 0u;
  v20 = 0u;
  xpc_dictionary_get_audit_token();
  v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  memset(&cf, 0, sizeof(cf));
  v6 = SecTaskCreateWithAuditToken(v5, &cf);
  if (!v6)
  {
    v9 = ne_log_obj();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      return 0;
    LOWORD(cf.val[0]) = 0;
    v10 = "Failed to create a task from audit token";
    p_cf = (uint8_t *)&cf;
    v12 = v9;
    v13 = 2;
    goto LABEL_15;
  }
  v7 = v6;
  *(_QWORD *)cf.val = 0;
  v3 = SecTaskCopySigningIdentifier(v6, (CFErrorRef *)&cf);
  if (*(_QWORD *)cf.val)
  {
    v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      remote_connection = xpc_dictionary_get_remote_connection(a1);
      pid = xpc_connection_get_pid(remote_connection);
      *(_DWORD *)v17 = 67109120;
      v18 = pid;
      _os_log_error_impl(&dword_208439000, v8, OS_LOG_TYPE_ERROR, "Failed to get the signing identifier of process %d", v17, 8u);
    }
    CFRelease(*(CFTypeRef *)cf.val);
  }
  CFRelease(v7);
  return v3;
}

BOOL NEAuditTokenForPID(int pid, integer_t *a2)
{
  kern_return_t v4;
  mach_error_t v5;
  NSObject *v6;
  _BOOL8 result;
  char *v8;
  const char *v9;
  kern_return_t v10;
  mach_error_t v11;
  char *v12;
  mach_msg_type_number_t task_info_outCnt;
  mach_port_name_t target_task;
  uint8_t buf[4];
  int v16;
  __int16 v17;
  mach_error_t v18;
  __int16 v19;
  char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  task_info_outCnt = 8;
  target_task = 0;
  v4 = task_for_pid(*MEMORY[0x24BDAEC58], pid, &target_task);
  if (v4)
  {
    v5 = v4;
    v6 = ne_log_obj();
    result = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
    if (!result)
      return result;
    v8 = mach_error_string(v5);
    *(_DWORD *)buf = 67109634;
    v16 = pid;
    v17 = 1024;
    v18 = v5;
    v19 = 2080;
    v20 = v8;
    v9 = "task_for_pid(mach_task_self(), %d, &task) => %d (%s)\n";
LABEL_7:
    _os_log_debug_impl(&dword_208439000, v6, OS_LOG_TYPE_DEBUG, v9, buf, 0x18u);
    return 0;
  }
  v10 = task_info(target_task, 0xFu, a2, &task_info_outCnt);
  if (v10)
  {
    v11 = v10;
    v6 = ne_log_obj();
    result = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
    if (!result)
      return result;
    v12 = mach_error_string(v11);
    *(_DWORD *)buf = 67109634;
    v16 = pid;
    v17 = 1024;
    v18 = v11;
    v19 = 2080;
    v20 = v12;
    v9 = "task_info(mach_task_self(), %d, TASK_AUDIT_TOKEN) => %d (%s)\n";
    goto LABEL_7;
  }
  return 1;
}

uint64_t NEGIDForAuditToken()
{
  return 0;
}

uint64_t NEUIDForAuditToken()
{
  return 0;
}

uint64_t NECopyBootstrapPortForPID()
{
  return 0;
}

uint64_t NECopyAuditPortForAuditToken()
{
  return 0;
}

uint64_t *ne_filter_crypto_init_master()
{
  uint64_t *v0;
  uint64_t *v1;
  NSObject *v2;
  __int16 v4[8];

  v0 = (uint64_t *)malloc_type_malloc(0x28uLL, 0x1060040A09B13B7uLL);
  v1 = v0;
  if (v0)
  {
    arc4random_buf(v0 + 1, 0x20uLL);
    v2 = ne_log_obj();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v4[0] = 0;
      _os_log_debug_impl(&dword_208439000, v2, OS_LOG_TYPE_DEBUG, "Generated master key", (uint8_t *)v4, 2u);
    }
    *v1 = ccsha256_di();
  }
  return v1;
}

BOOL ne_filter_crypto_generate_client_key(uint64_t a1, int a2, uint64_t a3)
{
  _BOOL8 result;
  int v5;
  NSObject *v6;
  uint8_t buf[4];
  int v9;
  uint64_t v10;

  result = 0;
  v10 = *MEMORY[0x24BDAC8D0];
  if (a1 && a3)
  {
    ccsha256_di();
    v5 = cchkdf();
    v6 = ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      v9 = a2;
      _os_log_debug_impl(&dword_208439000, v6, OS_LOG_TYPE_DEBUG, "Generated client key for salt %u", buf, 8u);
    }
    return v5 == 0;
  }
  return result;
}

char *ne_filter_crypto_init_client(__int128 *a1)
{
  char *v2;
  char *v3;
  __int128 v4;
  NSObject *v5;
  __int16 v7[8];

  if (!a1)
    return 0;
  v2 = (char *)malloc_type_malloc(0x28uLL, 0x1060040A09B13B7uLL);
  v3 = v2;
  if (v2)
  {
    v4 = *a1;
    *(_OWORD *)(v2 + 24) = a1[1];
    *(_OWORD *)(v2 + 8) = v4;
    *(_QWORD *)v2 = ccsha256_di();
    v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v7[0] = 0;
      _os_log_debug_impl(&dword_208439000, v5, OS_LOG_TYPE_DEBUG, "Inited client key", (uint8_t *)v7, 2u);
    }
  }
  return v3;
}

uint64_t ne_filter_crypto_sign_data(uint64_t *a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, int a6, uint64_t a7, int a8, uint64_t a9, _DWORD *a10)
{
  unint64_t *v11;
  uint64_t result;
  unint64_t v14;
  NSObject *v15;
  uint64_t v22;
  char *v23;
  NSObject *v24;
  _QWORD v25[2];
  uint8_t buf[4];
  int v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  if (a1 && (v11 = (unint64_t *)*a1) != 0)
  {
    result = 22;
    if (a2 && a9 && a10)
    {
      v14 = *v11;
      if (*v11 <= 0x20 && v14 <= *a10)
      {
        v25[0] = *v11;
        v25[1] = v25;
        *a10 = v14;
        MEMORY[0x24BDAC7A8](22);
        v23 = (char *)v25 - v22;
        cchmac_init();
        ne_filter_crypto_update_context(*a1, (uint64_t)v23, a2, a3, a4, a5, a6, a7, a8);
        cchmac_final();
        ne_filter_crypto_print_data(a2, a3, a4, a5, a6, a7, a8, (uint64_t)"SIGN");
        v24 = ne_log_obj();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 68289282;
          v27 = 32;
          v28 = 2098;
          v29 = a9;
          v30 = 2048;
          v31 = v25[0];
          _os_log_debug_impl(&dword_208439000, v24, OS_LOG_TYPE_DEBUG, "Sign data: sig = %{public,ne_filter_crypto_signature}.32P sig_len = %zu", buf, 0x1Cu);
        }
        return 0;
      }
      else
      {
        return 34;
      }
    }
  }
  else
  {
    v15 = ne_log_obj();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_208439000, v15, OS_LOG_TYPE_ERROR, "Failed to sign data, no crypto state", buf, 2u);
    }
    return 22;
  }
  return result;
}

uint64_t ne_filter_crypto_update_context(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, int a7, uint64_t a8, int a9)
{
  uint64_t result;

  cchmac_update();
  cchmac_update();
  cchmac_update();
  result = cchmac_update();
  if (a4 && a5)
    result = cchmac_update();
  if (a6 && a7)
    result = cchmac_update();
  if (a8)
  {
    if (a9)
      return cchmac_update();
  }
  return result;
}

void ne_filter_crypto_print_data(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5, uint64_t a6, int a7, uint64_t a8)
{
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  int v32;
  uint64_t v33;
  __int16 v34;
  int v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v16 = ne_log_obj();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v32 = 136315138;
    v33 = a8;
    _os_log_debug_impl(&dword_208439000, v16, OS_LOG_TYPE_DEBUG, "%s NE Filter crypto data:", (uint8_t *)&v32, 0xCu);
  }
  v17 = ne_log_obj();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v32 = 136315650;
    v33 = a8;
    v34 = 1042;
    v35 = 16;
    v36 = 2098;
    v37 = a1;
    _os_log_debug_impl(&dword_208439000, v17, OS_LOG_TYPE_DEBUG, "%s \tflow_id: %{public, u_int8_t}.16P", (uint8_t *)&v32, 0x1Cu);
  }
  v18 = ne_log_obj();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    v32 = 136315650;
    v33 = a8;
    v34 = 1042;
    v35 = 8;
    v36 = 2098;
    v37 = a1 + 16;
    _os_log_debug_impl(&dword_208439000, v18, OS_LOG_TYPE_DEBUG, "%s \tsock_id: %{public,u_int8_t}.8P", (uint8_t *)&v32, 0x1Cu);
  }
  v19 = ne_log_obj();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    v32 = 136315650;
    v33 = a8;
    v34 = 1042;
    v35 = 4;
    v36 = 2098;
    v37 = a1 + 24;
    _os_log_debug_impl(&dword_208439000, v19, OS_LOG_TYPE_DEBUG, "%s \tdirection: %{public,u_int8_t}.4P", (uint8_t *)&v32, 0x1Cu);
  }
  v20 = ne_log_obj();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    v32 = 136315906;
    v33 = a8;
    v34 = 1042;
    v35 = 28;
    v36 = 2098;
    v37 = a1 + 28;
    v38 = 2048;
    v39 = 28;
    _os_log_debug_impl(&dword_208439000, v20, OS_LOG_TYPE_DEBUG, "%s \tremote: %{public,u_int8_t}.28P (%lu)", (uint8_t *)&v32, 0x26u);
  }
  v21 = ne_log_obj();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    v32 = 136315906;
    v33 = a8;
    v34 = 1042;
    v35 = 28;
    v36 = 2098;
    v37 = a1 + 56;
    v38 = 2048;
    v39 = 28;
    _os_log_debug_impl(&dword_208439000, v21, OS_LOG_TYPE_DEBUG, "%s \tlocal: %{public,u_int8_t}.28P (%lu)", (uint8_t *)&v32, 0x26u);
  }
  v22 = ne_log_obj();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    v32 = 136315650;
    v33 = a8;
    v34 = 1042;
    v35 = 4;
    v36 = 2098;
    v37 = a1 + 84;
    _os_log_debug_impl(&dword_208439000, v22, OS_LOG_TYPE_DEBUG, "%s \tsocketProtocol: %{public,u_int8_t}.4P", (uint8_t *)&v32, 0x1Cu);
  }
  v23 = ne_log_obj();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    v32 = 136315650;
    v33 = a8;
    v34 = 1042;
    v35 = 4;
    v36 = 2098;
    v37 = a1 + 88;
    _os_log_debug_impl(&dword_208439000, v23, OS_LOG_TYPE_DEBUG, "%s \tpid: %{public,u_int8_t}.4P", (uint8_t *)&v32, 0x1Cu);
  }
  v24 = ne_log_obj();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    v32 = 136315650;
    v33 = a8;
    v34 = 1042;
    v35 = 4;
    v36 = 2098;
    v37 = a1 + 92;
    _os_log_debug_impl(&dword_208439000, v24, OS_LOG_TYPE_DEBUG, "%s \teffective_pid: %{public,u_int8_t}.4P", (uint8_t *)&v32, 0x1Cu);
  }
  v25 = ne_log_obj();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    v32 = 136315650;
    v33 = a8;
    v34 = 1042;
    v35 = 16;
    v36 = 2098;
    v37 = a1 + 96;
    _os_log_debug_impl(&dword_208439000, v25, OS_LOG_TYPE_DEBUG, "%s \tuuid: %{public,u_int8_t}.16P", (uint8_t *)&v32, 0x1Cu);
  }
  v26 = ne_log_obj();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    v32 = 136315650;
    v33 = a8;
    v34 = 1042;
    v35 = 16;
    v36 = 2098;
    v37 = a1 + 112;
    _os_log_debug_impl(&dword_208439000, v26, OS_LOG_TYPE_DEBUG, "%s \teffective_uuid: %{public,u_int8_t}.16P", (uint8_t *)&v32, 0x1Cu);
  }
  v27 = ne_log_obj();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    v32 = 136315650;
    v33 = a8;
    v34 = 1042;
    v35 = 8;
    v36 = 2098;
    v37 = a1 + 128;
    _os_log_debug_impl(&dword_208439000, v27, OS_LOG_TYPE_DEBUG, "%s \tbyte_count_in: %{public,u_int8_t}.8P", (uint8_t *)&v32, 0x1Cu);
  }
  v28 = ne_log_obj();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    v32 = 136315650;
    v33 = a8;
    v34 = 1042;
    v35 = 8;
    v36 = 2098;
    v37 = a1 + 136;
    _os_log_debug_impl(&dword_208439000, v28, OS_LOG_TYPE_DEBUG, "%s \tbyte_count_out: %{public,u_int8_t}.8P", (uint8_t *)&v32, 0x1Cu);
    if (!a2)
      goto LABEL_29;
  }
  else if (!a2)
  {
    goto LABEL_29;
  }
  v29 = ne_log_obj();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    v32 = 136315650;
    v33 = a8;
    v34 = 1040;
    v35 = a3;
    v36 = 2080;
    v37 = a2;
    _os_log_debug_impl(&dword_208439000, v29, OS_LOG_TYPE_DEBUG, "%s \tbundle_id: %.*s", (uint8_t *)&v32, 0x1Cu);
  }
LABEL_29:
  if (a4 && (v30 = ne_log_obj(), os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)))
  {
    v32 = 136315394;
    v33 = a8;
    v34 = 1024;
    v35 = a5;
    _os_log_debug_impl(&dword_208439000, v30, OS_LOG_TYPE_DEBUG, "%s \turl: <%d characters>", (uint8_t *)&v32, 0x12u);
    if (!a6)
      return;
  }
  else if (!a6)
  {
    return;
  }
  v31 = ne_log_obj();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    v32 = 136315650;
    v33 = a8;
    v34 = 1040;
    v35 = a7;
    v36 = 2080;
    v37 = a6;
    _os_log_debug_impl(&dword_208439000, v31, OS_LOG_TYPE_DEBUG, "%s \thostname: %.*s", (uint8_t *)&v32, 0x1Cu);
  }
}

BOOL ne_filter_crypto_validate_data(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, int a7, uint64_t a8, int a9, uint64_t a10, int a11)
{
  _QWORD *v12;
  _BOOL8 result;
  uint64_t v21;
  char *v22;
  NSObject *v23;
  NSObject *v24;
  _QWORD v25[2];
  uint8_t buf[4];
  int v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  int v31;
  __int16 v32;
  _OWORD *v33;
  _OWORD v34[2];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  if (a1 && (v12 = (_QWORD *)*a1) != 0)
  {
    result = 0;
    if (a2 && a3 && a10 && a11)
    {
      if (*v12 > 0x20uLL || *v12 != a11)
        return 0;
      v25[1] = v25;
      memset(v34, 0, sizeof(v34));
      MEMORY[0x24BDAC7A8](0);
      v22 = (char *)v25 - v21;
      cchmac_init();
      ne_filter_crypto_update_context(*a1, (uint64_t)v22, a3, a4, a5, a6, a7, a8, a9);
      cchmac_final();
      ne_filter_crypto_print_data(a3, a4, a5, a6, a7, a8, a9, (uint64_t)"VALIDATE");
      v23 = ne_log_obj();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 68289538;
        v27 = 32;
        v28 = 2098;
        v29 = a10;
        v30 = 1042;
        v31 = 32;
        v32 = 2098;
        v33 = v34;
        _os_log_debug_impl(&dword_208439000, v23, OS_LOG_TYPE_DEBUG, "Validate data: sig1 = %{public,ne_filter_crypto_signature}.32P sig2 = %{public,ne_filter_crypto_signature}.32P", buf, 0x22u);
      }
      return cc_cmp_safe() == 0;
    }
  }
  else
  {
    v24 = ne_log_obj();
    result = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (result)
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_208439000, v24, OS_LOG_TYPE_ERROR, "Failed to valdate data, no crypto state", buf, 2u);
      return 0;
    }
  }
  return result;
}

void CCHmac(CCHmacAlgorithm algorithm, const void *key, size_t keyLength, const void *data, size_t dataLength, void *macOut)
{
  MEMORY[0x24BDAC238](*(_QWORD *)&algorithm, key, keyLength, data, dataLength, macOut);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x24BDBB790](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
  MEMORY[0x24BDBB7A0](allocator, ptr);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x24BDBBAC0](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x24BDBBAD8]();
}

CFTypeRef CFBundleGetValueForInfoDictionaryKey(CFBundleRef bundle, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x24BDBBAE0](bundle, key);
}

CFCalendarRef CFCalendarCreateWithIdentifier(CFAllocatorRef allocator, CFCalendarIdentifier identifier)
{
  return (CFCalendarRef)MEMORY[0x24BDBBB98](allocator, identifier);
}

Boolean CFCalendarDecomposeAbsoluteTime(CFCalendarRef calendar, CFAbsoluteTime at, const char *componentDesc, ...)
{
  uint64_t v3;
  va_list va;

  va_start(va, componentDesc);
  v3 = va_arg(va, _QWORD);
  return MEMORY[0x24BDBBBA0](calendar, v3, at);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
  MEMORY[0x24BDBBC88](theData, bytes, length);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

CFDataRef CFDataCreateCopy(CFAllocatorRef allocator, CFDataRef theData)
{
  return (CFDataRef)MEMORY[0x24BDBBCA0](allocator, theData);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x24BDBBCB0](allocator, capacity);
}

CFMutableDataRef CFDataCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDataRef theData)
{
  return (CFMutableDataRef)MEMORY[0x24BDBBCB8](allocator, capacity, theData);
}

CFRange CFDataFind(CFDataRef theData, CFDataRef dataToFind, CFRange searchRange, CFDataSearchFlags compareOptions)
{
  CFIndex v4;
  CFIndex v5;
  CFRange result;

  v4 = MEMORY[0x24BDBBCD0](theData, dataToFind, searchRange.location, searchRange.length, compareOptions);
  result.length = v5;
  result.location = v4;
  return result;
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
  MEMORY[0x24BDBBCE8](theData, range.location, range.length, buffer);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x24BDBBD00](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x24BDBBD08]();
}

CFComparisonResult CFDateCompare(CFDateRef theDate, CFDateRef otherDate, void *context)
{
  return MEMORY[0x24BDBBD28](theDate, otherDate, context);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x24BDBBD30](allocator, at);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x24BDBBDC0](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x24BDBBE00](theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x24BDBBE48](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x24BDBBE88](allocator, domain, code, userInfo);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x24BDBBE98](err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x24BDBBEA0](err);
}

CFTypeID CFErrorGetTypeID(void)
{
  return MEMORY[0x24BDBBEA8]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  MEMORY[0x24BDBC4C0](theString, formatOptions, format);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC540](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x24BDBC558](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC660](length, *(_QWORD *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

uint64_t NEHelperCacheCopySigningIdentifierMapping()
{
  return MEMORY[0x24BDAC488]();
}

uint64_t NEHelperGetAppTrackerDomains()
{
  return MEMORY[0x24BDAC498]();
}

uint64_t SecCertificateNotValidAfter()
{
  return MEMORY[0x24BDE8970]();
}

uint64_t SecCertificateNotValidBefore()
{
  return MEMORY[0x24BDE8978]();
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return (CFStringRef)MEMORY[0x24BDE8D38](task, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x24BDE8D78](allocator, token);
}

uint64_t TCCAccessPreflight()
{
  return MEMORY[0x24BEB3790]();
}

uint64_t TCCAccessPreflightWithAuditToken()
{
  return MEMORY[0x24BEB37A8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x24BDAC728](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x24BDBD0A8]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x24BDBD0B0]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x24BDBD138]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x24BDAC838](*(_QWORD *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x24BDAC848]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x24BDAC910]();
}

uint64_t __strncpy_chk()
{
  return MEMORY[0x24BDAC920]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x24BDAC930](*(_QWORD *)&a1);
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

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
  MEMORY[0x24BDAD160](__buf, __nbytes);
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x24BDAD170](*(_QWORD *)&__upper_bound);
}

mach_port_name_t audit_session_self(void)
{
  return MEMORY[0x24BDAD280]();
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return MEMORY[0x24BEDA8F8](atoken);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

uint64_t cc_cmp_safe()
{
  return MEMORY[0x24BDAD350]();
}

uint64_t cchkdf()
{
  return MEMORY[0x24BDAD690]();
}

uint64_t cchmac_final()
{
  return MEMORY[0x24BDAD6B0]();
}

uint64_t cchmac_init()
{
  return MEMORY[0x24BDAD6B8]();
}

uint64_t cchmac_update()
{
  return MEMORY[0x24BDAD6C0]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x24BDAD828]();
}

uint64_t change_fdguard_np()
{
  return MEMORY[0x24BDAD978]();
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

uint64_t csops()
{
  return MEMORY[0x24BDADC00]();
}

uint64_t csops_audittoken()
{
  return MEMORY[0x24BDADC08]();
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x24BDADD60](buffer, size, queue, destructor);
}

dispatch_data_t dispatch_data_create_concat(dispatch_data_t data1, dispatch_data_t data2)
{
  return (dispatch_data_t)MEMORY[0x24BDADD70](data1, data2);
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return MEMORY[0x24BDADD90](data);
}

void *__cdecl dispatch_get_context(dispatch_object_t object)
{
  return (void *)MEMORY[0x24BDADD98](object);
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB0](attr);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x24BDADF20](object);
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

void dispatch_set_context(dispatch_object_t object, void *context)
{
  MEMORY[0x24BDADF40](object, context);
}

void dispatch_set_finalizer_f(dispatch_object_t object, dispatch_function_t finalizer)
{
  MEMORY[0x24BDADF48](object, finalizer);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_handle(dispatch_source_t source)
{
  return MEMORY[0x24BDADF88](source);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFA0](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

intptr_t dispatch_source_testcancel(dispatch_source_t source)
{
  return MEMORY[0x24BDADFD8](source);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x24BDADFE0](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x24BDAE2E8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void freeaddrinfo(addrinfo *a1)
{
  MEMORY[0x24BDAE458](a1);
}

void freeifaddrs(ifaddrs *a1)
{
  MEMORY[0x24BDAE468](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x24BDAE508](*(_QWORD *)&a1, a2);
}

int getaddrinfo(const char *a1, const char *a2, const addrinfo *a3, addrinfo **a4)
{
  return MEMORY[0x24BDAE5A0](a1, a2, a3, a4);
}

gid_t getegid(void)
{
  return MEMORY[0x24BDAE5E8]();
}

uid_t geteuid(void)
{
  return MEMORY[0x24BDAE5F8]();
}

int getifaddrs(ifaddrs **a1)
{
  return MEMORY[0x24BDAE660](a1);
}

int getpeername(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x24BDAE6C0](*(_QWORD *)&a1, a2, a3);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

int getsockopt(int a1, int a2, int a3, void *a4, socklen_t *a5)
{
  return MEMORY[0x24BDAE778](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4, a5);
}

uint64_t guarded_close_np()
{
  return MEMORY[0x24BDAE7C8]();
}

char *__cdecl if_indextoname(unsigned int a1, char *a2)
{
  return (char *)MEMORY[0x24BDAE850](*(_QWORD *)&a1, a2);
}

unsigned int if_nametoindex(const char *a1)
{
  return MEMORY[0x24BDAE860](a1);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x24BDAE8B0](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return MEMORY[0x24BDAE8B8](*(_QWORD *)&a1, a2, a3);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x24BDAE8C8](*(_QWORD *)&a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x24BDAEB58](*(_QWORD *)&error_value);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x24BDAED80](memptr, alignment, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x24BDAEEC8](__s, __smax, *(_QWORD *)&__c, __n);
}

uint64_t ne_log_obj()
{
  return MEMORY[0x24BDAF018]();
}

uint64_t ne_tracker_build_cache()
{
  return MEMORY[0x24BDAF088]();
}

uint64_t ne_tracker_clear_cache()
{
  return MEMORY[0x24BDAF090]();
}

uint64_t ne_tracker_context_can_block_request()
{
  return MEMORY[0x24BDAF098]();
}

uint64_t ne_tracker_context_get_domain()
{
  return MEMORY[0x24BDAF0A0]();
}

uint64_t ne_tracker_context_get_domain_owner()
{
  return MEMORY[0x24BDAF0A8]();
}

uint64_t ne_tracker_context_is_from_app_list()
{
  return MEMORY[0x24BDAF0B0]();
}

uint64_t ne_tracker_context_is_from_web_list()
{
  return MEMORY[0x24BDAF0B8]();
}

uint64_t ne_tracker_lookup_app_domains()
{
  return MEMORY[0x24BDAF0C0]();
}

uint64_t ne_tracker_validate_domain()
{
  return MEMORY[0x24BDAF0C8]();
}

uint64_t ne_trie_search()
{
  return MEMORY[0x24BDAF0D0]();
}

uint64_t necp_match_policy()
{
  return MEMORY[0x24BDAF0E0]();
}

uint64_t nelog_is_debug_logging_enabled()
{
  return MEMORY[0x24BDAF0F0]();
}

uint64_t nelog_is_info_logging_enabled()
{
  return MEMORY[0x24BDAF0F8]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_check(int token, int *check)
{
  return MEMORY[0x24BDAF140](*(_QWORD *)&token, check);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x24BDAF148](*(_QWORD *)&token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x24BDAF168](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

void nw_connection_batch(nw_connection_t connection, dispatch_block_t batch_block)
{
  MEMORY[0x24BDE0AF0](connection, batch_block);
}

void nw_connection_cancel(nw_connection_t connection)
{
  MEMORY[0x24BDE0AF8](connection);
}

uint64_t nw_connection_copy_connected_local_endpoint()
{
  return MEMORY[0x24BDE0B18]();
}

uint64_t nw_connection_copy_connected_path()
{
  return MEMORY[0x24BDE0B20]();
}

nw_endpoint_t nw_connection_copy_endpoint(nw_connection_t connection)
{
  return (nw_endpoint_t)MEMORY[0x24BDE0B40](connection);
}

nw_connection_t nw_connection_create(nw_endpoint_t endpoint, nw_parameters_t parameters)
{
  return (nw_connection_t)MEMORY[0x24BDE0B68](endpoint, parameters);
}

void nw_connection_group_cancel(nw_connection_group_t group)
{
  MEMORY[0x24BDE0BC0](group);
}

nw_endpoint_t nw_connection_group_copy_remote_endpoint_for_message(nw_connection_group_t group, nw_content_context_t context)
{
  return (nw_endpoint_t)MEMORY[0x24BDE0BC8](group, context);
}

uint64_t nw_connection_group_create_with_parameters()
{
  return MEMORY[0x24BDE0BD0]();
}

uint64_t nw_connection_group_get_port()
{
  return MEMORY[0x24BDE0BD8]();
}

void nw_connection_group_send_message(nw_connection_group_t group, dispatch_data_t content, nw_endpoint_t endpoint, nw_content_context_t context, nw_connection_group_send_completion_t completion)
{
  MEMORY[0x24BDE0BE0](group, content, endpoint, context, completion);
}

void nw_connection_group_set_queue(nw_connection_group_t group, dispatch_queue_t queue)
{
  MEMORY[0x24BDE0BE8](group, queue);
}

void nw_connection_group_set_receive_handler(nw_connection_group_t group, uint32_t maximum_message_size, BOOL reject_oversized_messages, nw_connection_group_receive_handler_t receive_handler)
{
  MEMORY[0x24BDE0BF0](group, *(_QWORD *)&maximum_message_size, reject_oversized_messages, receive_handler);
}

void nw_connection_group_set_state_changed_handler(nw_connection_group_t group, nw_connection_group_state_changed_handler_t state_changed_handler)
{
  MEMORY[0x24BDE0BF8](group, state_changed_handler);
}

void nw_connection_group_start(nw_connection_group_t group)
{
  MEMORY[0x24BDE0C00](group);
}

void nw_connection_receive(nw_connection_t connection, uint32_t minimum_incomplete_length, uint32_t maximum_length, nw_connection_receive_completion_t completion)
{
  MEMORY[0x24BDE0C28](connection, *(_QWORD *)&minimum_incomplete_length, *(_QWORD *)&maximum_length, completion);
}

void nw_connection_send(nw_connection_t connection, dispatch_data_t content, nw_content_context_t context, BOOL is_complete, nw_connection_send_completion_t completion)
{
  MEMORY[0x24BDE0C58](connection, content, context, is_complete, completion);
}

void nw_connection_set_queue(nw_connection_t connection, dispatch_queue_t queue)
{
  MEMORY[0x24BDE0C98](connection, queue);
}

void nw_connection_set_state_changed_handler(nw_connection_t connection, nw_connection_state_changed_handler_t handler)
{
  MEMORY[0x24BDE0CB0](connection, handler);
}

void nw_connection_start(nw_connection_t connection)
{
  MEMORY[0x24BDE0CD0](connection);
}

uint64_t nw_context_get_globals_for_protocol()
{
  return MEMORY[0x24BDE0DA8]();
}

nw_endpoint_t nw_endpoint_create_address(const sockaddr *address)
{
  return (nw_endpoint_t)MEMORY[0x24BDE0E68](address);
}

uint64_t nw_endpoint_create_host_with_numeric_port()
{
  return MEMORY[0x24BDE0E98]();
}

const sockaddr *__cdecl nw_endpoint_get_address(nw_endpoint_t endpoint)
{
  return (const sockaddr *)MEMORY[0x24BDE0EC0](endpoint);
}

const char *__cdecl nw_endpoint_get_hostname(nw_endpoint_t endpoint)
{
  return (const char *)MEMORY[0x24BDE0F20](endpoint);
}

uint64_t nw_endpoint_get_parent_endpoint_domain()
{
  return MEMORY[0x24BDE0F30]();
}

uint16_t nw_endpoint_get_port(nw_endpoint_t endpoint)
{
  return MEMORY[0x24BDE0F40](endpoint);
}

nw_endpoint_type_t nw_endpoint_get_type(nw_endpoint_t endpoint)
{
  return MEMORY[0x24BDE0F50](endpoint);
}

CFErrorRef nw_error_copy_cf_error(nw_error_t error)
{
  return (CFErrorRef)MEMORY[0x24BDE0FA8](error);
}

uint64_t nw_frame_array_append()
{
  return MEMORY[0x24BDE1020]();
}

uint64_t nw_frame_array_append_array()
{
  return MEMORY[0x24BDE1028]();
}

uint64_t nw_frame_array_first()
{
  return MEMORY[0x24BDE1030]();
}

uint64_t nw_frame_array_foreach()
{
  return MEMORY[0x24BDE1038]();
}

uint64_t nw_frame_array_init()
{
  return MEMORY[0x24BDE1040]();
}

uint64_t nw_frame_array_is_empty()
{
  return MEMORY[0x24BDE1048]();
}

uint64_t nw_frame_array_next()
{
  return MEMORY[0x24BDE1050]();
}

uint64_t nw_frame_array_prepend_array()
{
  return MEMORY[0x24BDE1060]();
}

uint64_t nw_frame_array_remove()
{
  return MEMORY[0x24BDE1068]();
}

uint64_t nw_frame_array_unclaimed_length()
{
  return MEMORY[0x24BDE1070]();
}

uint64_t nw_frame_claim()
{
  return MEMORY[0x24BDE1080]();
}

uint64_t nw_frame_create()
{
  return MEMORY[0x24BDE1088]();
}

uint64_t nw_frame_finalize()
{
  return MEMORY[0x24BDE1098]();
}

uint64_t nw_frame_get_buffer()
{
  return MEMORY[0x24BDE10A0]();
}

uint64_t nw_frame_reset()
{
  return MEMORY[0x24BDE10B8]();
}

uint64_t nw_frame_unclaimed_bytes()
{
  return MEMORY[0x24BDE10D0]();
}

uint64_t nw_frame_unclaimed_length()
{
  return MEMORY[0x24BDE10D8]();
}

uint64_t nw_interface_create_with_index()
{
  return MEMORY[0x24BDE1378]();
}

uint64_t nw_nat64_copy_prefixes()
{
  return MEMORY[0x24BDE14E8]();
}

uint64_t nw_nat64_synthesize_v6()
{
  return MEMORY[0x24BDE14F0]();
}

uint64_t nw_parameters_copy_context()
{
  return MEMORY[0x24BDE1520]();
}

nw_parameters_t nw_parameters_create_secure_tcp(nw_parameters_configure_protocol_block_t configure_tls, nw_parameters_configure_protocol_block_t configure_tcp)
{
  return (nw_parameters_t)MEMORY[0x24BDE1588](configure_tls, configure_tcp);
}

nw_parameters_t nw_parameters_create_secure_udp(nw_parameters_configure_protocol_block_t configure_dtls, nw_parameters_configure_protocol_block_t configure_udp)
{
  return (nw_parameters_t)MEMORY[0x24BDE15A0](configure_dtls, configure_udp);
}

uint64_t nw_parameters_get_data_mode()
{
  return MEMORY[0x24BDE15A8]();
}

uint64_t nw_parameters_get_e_proc_uuid()
{
  return MEMORY[0x24BDE15B8]();
}

uint64_t nw_parameters_get_effective_bundle_id()
{
  return MEMORY[0x24BDE15C8]();
}

uint64_t nw_parameters_get_ip_protocol()
{
  return MEMORY[0x24BDE15D8]();
}

uint64_t nw_parameters_get_pid()
{
  return MEMORY[0x24BDE15E8]();
}

uint64_t nw_parameters_get_proc_uuid()
{
  return MEMORY[0x24BDE15F0]();
}

uint64_t nw_parameters_get_server_mode()
{
  return MEMORY[0x24BDE1600]();
}

uint64_t nw_parameters_get_url()
{
  return MEMORY[0x24BDE1608]();
}

void nw_parameters_require_interface(nw_parameters_t parameters, nw_interface_t interface)
{
  MEMORY[0x24BDE1620](parameters, interface);
}

uint64_t nw_parameters_set_context()
{
  return MEMORY[0x24BDE1648]();
}

uint64_t nw_parameters_set_indefinite()
{
  return MEMORY[0x24BDE16A8]();
}

uint64_t nw_parameters_set_source_application()
{
  return MEMORY[0x24BDE1770]();
}

uint64_t nw_parameters_set_traffic_class()
{
  return MEMORY[0x24BDE1790]();
}

uint64_t nw_path_get_filter_unit()
{
  return MEMORY[0x24BDE18F0]();
}

uint64_t nw_path_get_interface_index()
{
  return MEMORY[0x24BDE18F8]();
}

uint64_t nw_protocol_definition_create_with_identifier()
{
  return MEMORY[0x24BDE1BD0]();
}

uint64_t nw_protocol_definition_set_globals_allocator()
{
  return MEMORY[0x24BDE1C20]();
}

uint64_t nw_protocol_register()
{
  return MEMORY[0x24BDE1FC0]();
}

uint64_t nw_protocol_set_default_one_to_one_callbacks()
{
  return MEMORY[0x24BDE1FF8]();
}

uint64_t nw_queue_context_async()
{
  return MEMORY[0x24BDE20A0]();
}

uint64_t nw_queue_context_async_if_needed()
{
  return MEMORY[0x24BDE20A8]();
}

uint64_t nw_queue_context_target_dispatch_queue()
{
  return MEMORY[0x24BDE20B8]();
}

void nw_release(void *obj)
{
  MEMORY[0x24BDE2380](obj);
}

void *__cdecl nw_retain(void *obj)
{
  return (void *)MEMORY[0x24BDE2498](obj);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_release(void *object)
{
  MEMORY[0x24BDAF3F0](object);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x24BDAF438]();
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x24BDAF458](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x24BDAF698](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

int proc_listallpids(void *buffer, int buffersize)
{
  return MEMORY[0x24BDAF6C8](buffer, *(_QWORD *)&buffersize);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x24BDAF6E0](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x24BDAF6F8](*(_QWORD *)&pid, *(_QWORD *)&flavor, arg, buffer, *(_QWORD *)&buffersize);
}

void *__cdecl rb_tree_find_node(rb_tree_t *a1, const void *a2)
{
  return (void *)MEMORY[0x24BDAFA58](a1, a2);
}

void rb_tree_init(rb_tree_t *a1, const rb_tree_ops_t *a2)
{
  MEMORY[0x24BDAFA60](a1, a2);
}

void *__cdecl rb_tree_insert_node(rb_tree_t *a1, void *a2)
{
  return (void *)MEMORY[0x24BDAFA68](a1, a2);
}

void *__cdecl rb_tree_iterate(rb_tree_t *a1, void *a2, const unsigned int a3)
{
  return (void *)MEMORY[0x24BDAFA70](a1, a2, *(_QWORD *)&a3);
}

void rb_tree_remove_node(rb_tree_t *a1, void *a2)
{
  MEMORY[0x24BDAFA78](a1, a2);
}

ssize_t recvmsg(int a1, msghdr *a2, int a3)
{
  return MEMORY[0x24BDAFAF0](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

uint64_t sandbox_check()
{
  return MEMORY[0x24BDAFBD8]();
}

ssize_t send(int a1, const void *a2, size_t a3, int a4)
{
  return MEMORY[0x24BDAFCE8](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

ssize_t sendmsg(int a1, const msghdr *a2, int a3)
{
  return MEMORY[0x24BDAFCF0](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x24BDAFD78](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4, *(_QWORD *)&a5);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x24BDAFE50](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x24BDAFED0](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x24BDAFF10](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

int strerror_r(int __errnum, char *__strerrbuf, size_t __buflen)
{
  return MEMORY[0x24BDAFF20](*(_QWORD *)&__errnum, __strerrbuf, __buflen);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x24BDAFF70](__dst, __src, __n);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x24BDAFF78](__s1, __n);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x24BDAFFC8](__s1, __s2);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0000](__str, __endptr, *(_QWORD *)&__base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x24BDB00F8](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}

kern_return_t task_for_pid(mach_port_name_t target_tport, int pid, mach_port_name_t *t)
{
  return MEMORY[0x24BDB0160](*(_QWORD *)&target_tport, *(_QWORD *)&pid, t);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x24BDB0180](*(_QWORD *)&target_task, *(_QWORD *)&flavor, task_info_out, task_info_outCnt);
}

int tracker_action(int action, char *buffer, size_t buffer_size)
{
  return MEMORY[0x24BDB0280](*(_QWORD *)&action, buffer, buffer_size);
}

void uidna_close(UIDNA *idna)
{
  MEMORY[0x24BEDC148](idna);
}

int32_t uidna_nameToASCII_UTF8(const UIDNA *idna, const char *name, int32_t length, char *dest, int32_t capacity, UIDNAInfo *pInfo, UErrorCode *pErrorCode)
{
  return MEMORY[0x24BEDC158](idna, name, *(_QWORD *)&length, dest, *(_QWORD *)&capacity, pInfo, pErrorCode);
}

UIDNA *__cdecl uidna_openUTS46(uint32_t options, UErrorCode *pErrorCode)
{
  return (UIDNA *)MEMORY[0x24BEDC168](*(_QWORD *)&options, pErrorCode);
}

void uuid_clear(uuid_t uu)
{
  MEMORY[0x24BDB0300](uu);
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x24BDB0308](uu1, uu2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
  MEMORY[0x24BDB0310](dst, src);
}

void uuid_generate(uuid_t out)
{
  MEMORY[0x24BDB0318](out);
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x24BDB0328](uu);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x24BDB0330](in, uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x24BDB0338](uu, out);
}

void uuid_unparse_lower(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x24BDB0340](uu, out);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  MEMORY[0x24BDB0630](xarray, value);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x24BDB0638](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB0640](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x24BDB0660](xarray);
}

const void *__cdecl xpc_array_get_data(xpc_object_t xarray, size_t index, size_t *length)
{
  return (const void *)MEMORY[0x24BDB0668](xarray, index, length);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return (const char *)MEMORY[0x24BDB0688](xarray, index);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x24BDB06A0](xarray, index);
}

void xpc_connection_activate(xpc_connection_t connection)
{
  MEMORY[0x24BDB0710](connection);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x24BDB0718](connection);
}

xpc_connection_t xpc_connection_create_from_endpoint(xpc_endpoint_t endpoint)
{
  return (xpc_connection_t)MEMORY[0x24BDB0738](endpoint);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x24BDB0740](name, targetq, flags);
}

void *__cdecl xpc_connection_get_context(xpc_connection_t connection)
{
  return (void *)MEMORY[0x24BDB0760](connection);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x24BDB0788](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x24BDB0798](connection);
}

void xpc_connection_send_barrier(xpc_connection_t connection, dispatch_block_t barrier)
{
  MEMORY[0x24BDB07A0](connection, barrier);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x24BDB07A8](connection, message);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x24BDB07B0](connection, message, replyq, handler);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x24BDB07B8](connection, message);
}

void xpc_connection_set_context(xpc_connection_t connection, void *context)
{
  MEMORY[0x24BDB07C0](connection, context);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x24BDB07C8](connection, handler);
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  MEMORY[0x24BDB07E8](connection, targetq);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x24BDB0820](object);
}

uint64_t xpc_create_from_plist()
{
  return MEMORY[0x24BDB0850]();
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x24BDB0868](bytes, length);
}

size_t xpc_data_get_bytes(xpc_object_t xdata, void *buffer, size_t off, size_t length)
{
  return MEMORY[0x24BDB0878](xdata, buffer, off, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x24BDB0880](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x24BDB0888](xdata);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x24BDB08B0](xdict, applier);
}

uint64_t xpc_dictionary_copy_mach_send()
{
  return MEMORY[0x24BDB08B8]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x24BDB08D0]();
}

uint64_t xpc_dictionary_get_audit_token()
{
  return MEMORY[0x24BDB0900]();
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0908](xdict, key);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x24BDB0910](xdict);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x24BDB0918](xdict, key, length);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0928](xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0938](xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x24BDB0948](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0958](xdict, key);
}

const uint8_t *__cdecl xpc_dictionary_get_uuid(xpc_object_t xdict, const char *key)
{
  return (const uint8_t *)MEMORY[0x24BDB0960](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x24BDB0978](xdict, key, value);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x24BDB0988](xdict, key, bytes, length);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x24BDB09A8](xdict, key, value);
}

uint64_t xpc_dictionary_set_mach_send()
{
  return MEMORY[0x24BDB09B8]();
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x24BDB09D0](xdict, key, value);
}

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
  MEMORY[0x24BDB09D8](xdict, key, uuid);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x24BDB09E0](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x24BDB0A88](xint);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x24BDB0AE0](object);
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x24BDB0AE8](object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x24BDB0B80](string);
}

size_t xpc_string_get_length(xpc_object_t xstring)
{
  return MEMORY[0x24BDB0BA0](xstring);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x24BDB0BA8](xstring);
}

xpc_object_t xpc_uuid_create(const unsigned __int8 *uuid)
{
  return (xpc_object_t)MEMORY[0x24BDB0BF8](uuid);
}

