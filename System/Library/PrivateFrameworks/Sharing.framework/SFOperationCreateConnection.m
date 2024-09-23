@implementation SFOperationCreateConnection

void ___SFOperationCreateConnection_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *context;
  xpc_object_t value;
  void *v7;
  const __CFDictionary *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t uint64;
  const void *v21;
  uint64_t v22;
  const void *v23;
  const void *v24;
  uint64_t v25;
  void *v26;
  const __CFAllocator *v27;
  const CFDictionaryKeyCallBacks *v28;
  const CFDictionaryValueCallBacks *v29;
  __CFDictionary *Mutable;
  __CFDictionary *v31;
  CFStringRef v32;
  CFStringRef v33;
  CFErrorRef v34;
  _QWORD v35[6];

  v4 = MEMORY[0x1A8589904](a2);
  if (v4 == MEMORY[0x1E0C81310])
  {
    if (a2 == (void *)MEMORY[0x1E0C81260])
    {
      v19 = framework_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v35[0]) = 0;
        _os_log_impl(&dword_1A2830000, v19, OS_LOG_TYPE_DEFAULT, "Connection to sharingd became invalid", (uint8_t *)v35, 2u);
      }
    }
    else
    {
      v9 = (void *)MEMORY[0x1E0C81258];
      v10 = framework_log();
      v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
      if (a2 == v9)
      {
        if (v11)
          ___SFOperationCreateConnection_block_invoke_cold_1(v10, v12, v13, v14, v15, v16, v17, v18);
        v25 = *(_QWORD *)(a1 + 32);
        v26 = *(void **)(v25 + 184);
        *(_QWORD *)(v25 + 184) = 0;
        if (CFEqual(*(CFTypeRef *)(v25 + 48), CFSTR("Status"))
          || CFEqual(*(CFTypeRef *)(v25 + 48), CFSTR("Listener"))
          || CFEqual(*(CFTypeRef *)(v25 + 48), CFSTR("Controller"))
          || CFEqual(*(CFTypeRef *)(v25 + 48), CFSTR("Information")))
        {
          SFOperationResume(v25);
        }
        else
        {
          v27 = CFGetAllocator((CFTypeRef)v25);
          v28 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9B390];
          v29 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
          Mutable = CFDictionaryCreateMutable(v27, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
          v31 = CFDictionaryCreateMutable(v27, 0, v28, v29);
          if (CFEqual(*(CFTypeRef *)(v25 + 48), CFSTR("Sender"))
            || CFEqual(*(CFTypeRef *)(v25 + 48), CFSTR("Receiver")))
          {
            v32 = copyLocalizedStringForKey(CFSTR("Transfer Failed"));
            if (v32)
            {
              v33 = v32;
              CFDictionarySetValue(v31, (const void *)*MEMORY[0x1E0C9AFE0], v32);
              CFRelease(v33);
            }
          }
          v34 = CFErrorCreate(v27, CFSTR("SFOperation"), -10, v31);
          CFDictionarySetValue(Mutable, CFSTR("Error"), v34);
          _SFOperationNotifyClient(v25, 10, Mutable);
          if (Mutable)
            CFRelease(Mutable);
          CFRelease(v31);
          CFRelease(v34);
        }
        xpc_release(v26);
      }
      else if (v11)
      {
        ___SFOperationCreateConnection_block_invoke_cold_2(v10, v12, v13, v14, v15, v16, v17, v18);
      }
    }
  }
  else if (v4 == MEMORY[0x1E0C812F8])
  {
    context = xpc_connection_get_context(*(xpc_connection_t *)(a1 + 40));
    value = xpc_dictionary_get_value(a2, "Results");
    if (value)
    {
      v7 = value;
      v8 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 0x40000000;
      v35[2] = ___SFOperationCreateResultsFromXPCObject_block_invoke;
      v35[3] = &__block_descriptor_tmp_252;
      v35[4] = 0;
      v35[5] = v8;
      xpc_dictionary_apply(v7, v35);
    }
    else
    {
      v8 = 0;
    }
    uint64 = xpc_dictionary_get_uint64(a2, "Events");
    v21 = CFDictionaryGetValue(v8, CFSTR("Node"));
    if (v21)
    {
      v22 = (uint64_t)v21;
      v23 = SFOperationCopyProperty((uint64_t)context, CFSTR("Node"));
      if (v23)
      {
        v24 = v23;
        _SFNodeUpdateCachedChildNode((uint64_t)v23, v22);
        CFRelease(v24);
      }
    }
    _SFOperationNotifyClient((uint64_t)context, uint64, v8);
    if (v8)
      CFRelease(v8);
  }
}

void ___SFOperationCreateConnection_block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1A2830000, a1, a3, "Lost connection to sharingd", a5, a6, a7, a8, 0);
}

void ___SFOperationCreateConnection_block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1A2830000, a1, a3, "Unknown XPC error", a5, a6, a7, a8, 0);
}

@end
