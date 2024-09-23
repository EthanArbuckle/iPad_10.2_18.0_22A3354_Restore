@implementation SFBrowserCreateConnection

void ___SFBrowserCreateConnection_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  char *context;
  xpc_object_t value;
  const void *v7;
  const void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  const __CFArray *v16;
  const __CFArray *v17;
  CFIndex Count;
  CFIndex v19;
  CFIndex i;
  const __CFDictionary *ValueAtIndex;
  const void *v22;
  const __CFNumber *v23;
  const void *v24;
  NSObject *v25;
  const void *v26;
  int64_t int64;
  xpc_object_t v28;
  __CFArray *ChildrenFromXPCNodes;
  xpc_object_t v30;
  __CFArray *v31;
  NSObject *v32;
  int v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  _BYTE buf[24];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = MEMORY[0x1A8589904](a2);
  if (v4 != MEMORY[0x1E0C81310])
  {
    if (v4 != MEMORY[0x1E0C812F8])
      return;
    context = (char *)xpc_connection_get_context(*(xpc_connection_t *)(a1 + 40));
    pthread_mutex_lock((pthread_mutex_t *)(context + 88));
    value = xpc_dictionary_get_value(a2, "Node");
    if (value)
    {
      v7 = (const void *)_SFNodeCreateWithXPCObject(0, value);
      if (v7)
      {
        v8 = CFDictionaryGetValue(*((CFDictionaryRef *)context + 5), v7);
        if (v8)
        {
          v9 = (uint64_t)v8;
          CFRetain(v8);
          _SFNodeUpdateCachedParentNode(v9, (uint64_t)v7);
          CFRelease(v7);
          v7 = (const void *)v9;
        }
        else
        {
          v25 = browser_log();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            ___SFBrowserCreateConnection_block_invoke_cold_5();
          CFDictionarySetValue(*((CFMutableDictionaryRef *)context + 5), v7, v7);
        }
      }
    }
    else
    {
      v7 = 0;
    }
    if (xpc_dictionary_get_value(a2, "Protocol"))
      v26 = (const void *)_CFXPCCreateCFObjectFromXPCObject();
    else
      v26 = 0;
    int64 = xpc_dictionary_get_int64(a2, "Error");
    v28 = xpc_dictionary_get_value(a2, "Children");
    if (v28)
    {
      ChildrenFromXPCNodes = _SFBrowserCreateChildrenFromXPCNodes(v28);
      _SFBrowserUpdateCachedChildrenNodes((uint64_t)context, v7, ChildrenFromXPCNodes, 0);
      if (ChildrenFromXPCNodes)
        CFRelease(ChildrenFromXPCNodes);
    }
    else
    {
      _SFBrowserUpdateCachedChildrenNodes((uint64_t)context, v7, 0, 0);
    }
    if (CFEqual(*((CFTypeRef *)context + 7), CFSTR("Network")) && SFNodeIsRoot((uint64_t)v7))
    {
      v30 = xpc_dictionary_get_value(a2, "Sidebar");
      if (v30)
      {
        v31 = _SFBrowserCreateChildrenFromXPCNodes(v30);
        _SFBrowserUpdateCachedChildrenNodes((uint64_t)context, v7, v31, 1);
        if (v31)
          CFRelease(v31);
      }
      else
      {
        _SFBrowserUpdateCachedChildrenNodes((uint64_t)context, v7, 0, 1);
      }
    }
    pthread_mutex_unlock((pthread_mutex_t *)(context + 88));
    if (context[16])
    {
      v32 = browser_log();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        ___SFBrowserCreateConnection_block_invoke_cold_4();
        if (!v26)
          goto LABEL_50;
        goto LABEL_49;
      }
    }
    else
    {
      v33 = CFDictionaryContainsKey(*((CFDictionaryRef *)context + 6), v7);
      v34 = browser_log();
      v35 = v34;
      if (v33)
      {
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v7;
          _os_log_impl(&dword_1A2830000, v35, OS_LOG_TYPE_DEFAULT, "SFBrowserCallBack (node = %@)", buf, 0xCu);
        }
        (*((void (**)(char *, const void *, const void *, _QWORD, int64_t, _QWORD))context + 19))(context, v7, v26, 0, int64, *((_QWORD *)context + 21));
        if (!v26)
          goto LABEL_50;
        goto LABEL_49;
      }
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        ___SFBrowserCreateConnection_block_invoke_cold_3();
        if (!v26)
        {
LABEL_50:
          if (v7)
            CFRelease(v7);
          return;
        }
LABEL_49:
        CFRelease(v26);
        goto LABEL_50;
      }
    }
    if (!v26)
      goto LABEL_50;
    goto LABEL_49;
  }
  if (a2 == (void *)MEMORY[0x1E0C81260])
  {
    v13 = browser_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A2830000, v13, OS_LOG_TYPE_DEFAULT, "Connection to sharingd became invalid", buf, 2u);
    }
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C81258];
    v11 = browser_log();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (a2 == v10)
    {
      if (v12)
        ___SFBrowserCreateConnection_block_invoke_cold_1();
      v14 = *(_QWORD *)(a1 + 32);
      pthread_mutex_lock((pthread_mutex_t *)(v14 + 88));
      v15 = *(void **)(v14 + 216);
      *(_QWORD *)(v14 + 216) = _SFBrowserCreateConnection(v14);
      pthread_mutex_unlock((pthread_mutex_t *)(v14 + 88));
      SFBrowserSetMode(v14, *(_QWORD *)(v14 + 200));
      v16 = copyValuesFromDictionary(0, *(CFDictionaryRef *)(v14 + 48));
      if (v16)
      {
        v17 = v16;
        v36 = v15;
        Count = CFArrayGetCount(v16);
        if (Count >= 1)
        {
          v19 = Count;
          for (i = 0; i != v19; ++i)
          {
            *(_QWORD *)buf = 0;
            ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v17, i);
            v22 = CFDictionaryGetValue(ValueAtIndex, CFSTR("Node"));
            v23 = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, CFSTR("Flags"));
            v24 = CFDictionaryGetValue(ValueAtIndex, CFSTR("Protocol"));
            CFNumberGetValue(v23, kCFNumberLongType, buf);
            SFBrowserOpenNode(v14, v22, v24, *(uint64_t *)buf);
          }
        }
        CFRelease(v17);
        v15 = v36;
      }
      xpc_release(v15);
    }
    else if (v12)
    {
      ___SFBrowserCreateConnection_block_invoke_cold_2();
    }
  }
}

void ___SFBrowserCreateConnection_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1A2830000, v0, v1, "Lost connection to sharingd", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void ___SFBrowserCreateConnection_block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1A2830000, v0, v1, "Unknown XPC error", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void ___SFBrowserCreateConnection_block_invoke_cold_3()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7();
  _os_log_error_impl(&dword_1A2830000, v0, OS_LOG_TYPE_ERROR, "SFBrowserNotifyClient: node %@ not found", v1, 0xCu);
  OUTLINED_FUNCTION_3();
}

void ___SFBrowserCreateConnection_block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1A2830000, v0, v1, "SFBrowserNotifyClient: browser invalidated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void ___SFBrowserCreateConnection_block_invoke_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1A2830000, v0, v1, "SFBrowser parent node missing from node cache", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
