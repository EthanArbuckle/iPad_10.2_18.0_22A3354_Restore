@implementation TCCAccessRequest

void __TCCAccessRequest_block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  BOOL v3;
  char *v4;
  const void *v5;
  xpc_object_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFData *v9;
  int v10;
  uint64_t v11;
  void (*v12)(void);
  xpc_object_t v13;
  NSObject *v14;
  _xpc_connection_s *v15;
  xpc_object_t v16;
  _xpc_connection_s *v17;
  _BOOL4 v18;
  __int128 v19;
  NSObject *v20;
  const void *v21;
  xpc_object_t v22;
  xpc_object_t *v23;
  void *v24;
  _QWORD v25[4];
  int8x16_t v26;
  __int128 v27;
  char v28;
  BOOL v29;
  _QWORD v30[5];
  _QWORD v31[5];
  BOOL v32;
  UInt8 buffer[8];
  uint64_t v34;
  _QWORD block[6];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  xpc_object_t values[2];
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  char *keys[2];
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  CFRange v48;

  v47 = *MEMORY[0x1E0C80C00];
  v36 = 0;
  v37 = &v36;
  v38 = 0x2000000000;
  v39 = 0;
  *(_OWORD *)keys = xmmword_1E4A2E3A0;
  v45 = *(_OWORD *)&off_1E4A2E3B0;
  v46 = xmmword_1E4A2E3C0;
  v43 = 0;
  v41 = 0u;
  v42 = 0u;
  *(_OWORD *)values = 0u;
  v2 = *(_QWORD *)(a1 + 48);
  v3 = v2 == 0;
  if (!v2)
  {
    v7 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 0x40000000;
    block[2] = __TCCAccessRequest_block_invoke_5;
    block[3] = &unk_1E4A2E3D8;
    v8 = *(_QWORD *)(a1 + 56);
    block[4] = &v36;
    block[5] = v8;
    dispatch_sync((dispatch_queue_t)TCCAccessRequest_cache_queue, block);
    v9 = (const __CFData *)v37[3];
    if (v9)
    {
      *(_QWORD *)buffer = 0;
      v34 = 0;
      v48.location = 0;
      v48.length = 16;
      CFDataGetBytes(v9, v48, buffer);
      v10 = *(_DWORD *)buffer;
      v11 = *(_QWORD *)(a1 + 32);
      if (*(_DWORD *)buffer != 2)
      {
        if (v11)
        {
          (*(void (**)(uint64_t, _QWORD, _QWORD))(v11 + 16))(v11, 0, buffer[4]);
          v10 = *(_DWORD *)buffer;
        }
        if (!*(_DWORD *)(a1 + 72))
        {
          v14 = *(NSObject **)(a1 + 64);
          v31[0] = v7;
          v31[1] = 0x40000000;
          v31[2] = __TCCAccessRequest_block_invoke_6;
          v31[3] = &unk_1E4A2E400;
          v31[4] = *(_QWORD *)(a1 + 40);
          v32 = v10 == 0;
          dispatch_async(v14, v31);
          goto LABEL_23;
        }
        v12 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_16:
        v12();
LABEL_23:
        v15 = 0;
        v16 = 0;
        v4 = 0;
        goto LABEL_34;
      }
      if (v11)
      {
        (*(void (**)(uint64_t, uint64_t, _QWORD))(v11 + 16))(v11, 1, 0);
        v12 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
        goto LABEL_16;
      }
    }
  }
  v4 = stringCopyUTF8String(*(const __CFString **)(a1 + 56));
  if (!v4)
    goto LABEL_29;
  values[0] = xpc_string_create("TCCAccessRequest");
  if (!values[0])
    goto LABEL_29;
  values[1] = xpc_string_create(v4);
  if (!values[1])
    goto LABEL_29;
  *(_QWORD *)&v41 = xpc_BOOL_create(*(_QWORD *)(a1 + 32) != 0);
  if (!(_QWORD)v41)
    goto LABEL_29;
  v5 = *(const void **)(a1 + 48);
  v6 = v5 ? xpc_data_create(v5, 0x20uLL) : xpc_null_create();
  if ((*((_QWORD *)&v41 + 1) = v6) != 0
    && (*(_QWORD *)&v42 = xpc_BOOL_create(0), (_QWORD)v42)
    && (!*(_DWORD *)(a1 + 76) ? (v13 = xpc_null_create()) : (v13 = xpc_BOOL_create(*(_DWORD *)(a1 + 80) != 0)),
        (*((_QWORD *)&v42 + 1) = v13) != 0))
  {
    v16 = xpc_dictionary_create((const char *const *)keys, values, 6uLL);
    if (v16)
    {
      v17 = tccd();
      if (v17)
      {
        v15 = v17;
        CFRetain(*(CFTypeRef *)(a1 + 56));
        v18 = *(_DWORD *)(a1 + 72) == 0;
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 0x40000000;
        v25[2] = __TCCAccessRequest_block_invoke_8;
        v25[3] = &unk_1E4A2E470;
        v28 = 0;
        v29 = v3;
        v19 = *(_OWORD *)(a1 + 48);
        v26 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
        v27 = v19;
        tccd_set_message_number(v16);
        tccd_send_message(v15, v18, v16, (uint64_t)v25, 7, 0);
        goto LABEL_34;
      }
    }
  }
  else
  {
LABEL_29:
    v16 = 0;
  }
  if (*(_DWORD *)(a1 + 72))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v20 = *(NSObject **)(a1 + 64);
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 0x40000000;
    v30[2] = __TCCAccessRequest_block_invoke_7;
    v30[3] = &unk_1E4A2E428;
    v30[4] = *(_QWORD *)(a1 + 40);
    dispatch_async(v20, v30);
  }
  v15 = 0;
LABEL_34:
  v21 = (const void *)v37[3];
  if (v21)
    CFRelease(v21);
  free(v4);
  if (v16)
    xpc_release(v16);
  if (v15)
    xpc_release(v15);
  v22 = values[0];
  if (values[0])
  {
    v23 = &values[1];
    do
    {
      xpc_release(v22);
      v24 = *v23++;
      v22 = v24;
    }
    while (v24);
  }
  CFRelease(*(CFTypeRef *)(a1 + 56));
  _Block_object_dispose(&v36, 8);
}

uint64_t __TCCAccessRequest_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __TCCAccessRequest_block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __TCCAccessRequest_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

dispatch_queue_t __TCCAccessRequest_block_invoke_2()
{
  dispatch_queue_t result;

  TCCAccessRequest_cache_map = (uint64_t)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  result = dispatch_queue_create("com.apple.tcc.cache_queue", 0);
  TCCAccessRequest_cache_queue = (uint64_t)result;
  return result;
}

CFTypeRef __TCCAccessRequest_block_invoke_5(uint64_t a1)
{
  CFTypeRef result;

  result = CFDictionaryGetValue((CFDictionaryRef)TCCAccessRequest_cache_map, *(const void **)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (result)
    return CFRetain(*(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  return result;
}

uint64_t __TCCAccessRequest_block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void __TCCAccessRequest_block_invoke_8(uint64_t a1, void *a2)
{
  const char *string;
  xpc_object_t value;
  _BOOL8 v6;
  _BOOL8 v7;
  BOOL v8;
  BOOL v9;
  uint64_t v10;
  void (*v11)(void);
  uint64_t v12;
  const char *v13;
  _QWORD v14[5];
  BOOL v15;
  BOOL v16;
  BOOL v17;

  if (MEMORY[0x1A859163C](a2) == MEMORY[0x1E0C81310])
  {
    if (tcc_log_handle_onceToken != -1)
      dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
    if (os_log_type_enabled((os_log_t)tcc_client_log, OS_LOG_TYPE_ERROR))
      __TCCAccessRequest_block_invoke_8_cold_1(a2);
    v11 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    goto LABEL_15;
  }
  string = xpc_dictionary_get_string(a2, "abort");
  if (string)
  {
    v12 = (uint64_t)string;
    v13 = xpc_dictionary_get_string(a2, "problem_key");
    __TCC_CRASHING_DUE_TO_PRIVACY_VIOLATION__(v12, v13);
  }
  value = xpc_dictionary_get_value(a2, "extension");
  if (*(_QWORD *)(a1 + 48)
    || *(_BYTE *)(a1 + 64)
    || !value
    || (xpc_string_get_string_ptr(value), sandbox_extension_consume() != -1))
  {
    v6 = xpc_dictionary_get_BOOL(a2, "preflight_unknown");
    v7 = xpc_dictionary_get_BOOL(a2, "restricted");
    v8 = xpc_dictionary_get_BOOL(a2, "result");
    v9 = xpc_dictionary_get_BOOL(a2, "do_not_cache");
    if (*(_BYTE *)(a1 + 65) && !v9)
    {
      CFRetain(*(CFTypeRef *)(a1 + 56));
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 0x40000000;
      v14[2] = __TCCAccessRequest_block_invoke_186;
      v14[3] = &__block_descriptor_tmp_187;
      v15 = v6;
      v14[4] = *(_QWORD *)(a1 + 56);
      v16 = v8;
      v17 = v7;
      dispatch_async((dispatch_queue_t)TCCAccessRequest_cache_queue, v14);
    }
    v10 = *(_QWORD *)(a1 + 40);
    if (v10)
      (*(void (**)(uint64_t, _BOOL8, _BOOL8))(v10 + 16))(v10, v6, v7);
    v11 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
LABEL_15:
    v11();
    CFRelease(*(CFTypeRef *)(a1 + 56));
    return;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __TCCAccessRequest_block_invoke_186(uint64_t a1)
{
  int v2;
  int v3;
  CFDataRef v4;
  _QWORD v5[2];

  if (*(_BYTE *)(a1 + 40))
  {
    if (CFDictionaryGetValue((CFDictionaryRef)TCCAccessRequest_cache_map, *(const void **)(a1 + 32)))
    {
      CFRelease(*(CFTypeRef *)(a1 + 32));
      return;
    }
    v3 = *(unsigned __int8 *)(a1 + 40);
    v5[0] = 0;
    if (v3)
    {
      v2 = 2;
      goto LABEL_8;
    }
  }
  else
  {
    v5[0] = 0;
  }
  v2 = *(_BYTE *)(a1 + 41) == 0;
LABEL_8:
  LODWORD(v5[0]) = v2;
  BYTE4(v5[0]) = *(_BYTE *)(a1 + 42);
  v5[1] = time(0);
  v4 = CFDataCreate(0, (const UInt8 *)v5, 16);
  CFDictionarySetValue((CFMutableDictionaryRef)TCCAccessRequest_cache_map, *(const void **)(a1 + 32), v4);
  CFRelease(v4);
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void __TCCAccessRequest_block_invoke_2_191(uint64_t a1)
{
  int v2;
  NSObject *v3;
  void *v4;

  v2 = *(_DWORD *)(a1 + 56);
  v3 = service_queue(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32) != 0);
  v4 = *(void **)(a1 + 40);
  if (v2)
    dispatch_sync(v3, v4);
  else
    dispatch_async(v3, v4);
}

void __TCCAccessRequest_block_invoke_8_cold_1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  xpc_dictionary_get_string(a1, (const char *)*MEMORY[0x1E0C81270]);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_1A364C000, v1, v2, "%{public}s: %{public}s", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_3();
}

@end
