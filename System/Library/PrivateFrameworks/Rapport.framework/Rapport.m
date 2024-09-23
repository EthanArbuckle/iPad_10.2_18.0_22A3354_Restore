void sub_1AF28F070(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF28F3D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1AF28F560(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id RPNSOperatingSystemVersionToString(uint64_t *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (*a1 < 1)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringValue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[1]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[2]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(".%@"), v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(".%@"), v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingString:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

void sub_1AF292434(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF294064(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

Class initSFService()
{
  Class result;

  if (SharingLibrary_sOnce != -1)
    dispatch_once(&SharingLibrary_sOnce, &__block_literal_global);
  result = objc_getClass("SFService");
  classSFService = (uint64_t)result;
  getSFServiceClass = (uint64_t (*)())SFServiceFunction;
  return result;
}

id SFServiceFunction()
{
  return (id)classSFService;
}

void sub_1AF298958(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Block_object_dispose((const void *)(v11 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1AF298D7C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

nw_protocol_definition_t nwrapport_copy_protocol_definition()
{
  nw_protocol_definition_t definition;
  uint8_t v2[16];

  definition = nw_framer_create_definition("rapport-client-peer", 0, &__block_literal_global_44);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1AF28C000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "registering rapport peer protocol", v2, 2u);
  }
  return definition;
}

uint64_t __nwrapport_copy_protocol_definition_block_invoke(uint64_t a1, void *a2)
{
  NSObject *v2;
  nw_framer_message_t v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD v7[4];
  NSObject *v8;
  NSObject *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD v12[6];
  _QWORD v13[3];
  char v14;

  v2 = a2;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v14 = 0;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3010000000;
  v12[4] = 0;
  v12[5] = 0;
  v12[3] = "";
  v3 = nw_framer_message_create(v2);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __nwrapport_copy_protocol_definition_block_invoke_2;
  v7[3] = &unk_1E5F4F068;
  v10 = v13;
  v11 = v12;
  v4 = v2;
  v8 = v4;
  v5 = v3;
  v9 = v5;
  nw_framer_set_input_handler(v4, v7);
  nw_framer_set_output_handler(v4, &__block_literal_global_50);
  nw_framer_set_stop_handler(v4, &__block_literal_global_53);
  nw_framer_set_cleanup_handler(v4, &__block_literal_global_55);

  _Block_object_dispose(v12, 8);
  _Block_object_dispose(v13, 8);

  return 2;
}

void sub_1AF299214(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t __nwrapport_copy_protocol_definition_block_invoke_2(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  unint64_t v10;
  uint64_t v11;
  int v12;
  char *v13;
  uint64_t v14;
  void *v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD parse[7];
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  int v40;
  __int16 v41;
  char *v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = a1 + 56;
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_BYTE *)(*(_QWORD *)(v5 + 8) + 24) == 0;
  v7 = MEMORY[0x1E0C809B0];
  v8 = 16;
  v9 = MEMORY[0x1E0C81028];
  v10 = 0x1ECF9B000uLL;
  do
  {
    if (!v6)
      break;
    parse[0] = v7;
    parse[1] = 3221225472;
    parse[2] = __nwrapport_copy_protocol_definition_block_invoke_3;
    parse[3] = &unk_1E5F4F040;
    parse[5] = v5;
    parse[6] = 16;
    parse[4] = *(_QWORD *)v4;
    if (!nw_framer_parse_input(v3, 0x10uLL, 0x10uLL, 0, parse))
      goto LABEL_31;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v11 = objc_msgSend((id)(v10 + 3136), "controlCodeToString:", *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)v4 + 8) + 32));
      v12 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)v4 + 8) + 33);
      v13 = strerror(v12);
      v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v4 + 8) + 40);
      *(_DWORD *)buf = 136315906;
      v38 = v11;
      v10 = 0x1ECF9B000;
      v39 = 1024;
      v40 = v12;
      v41 = 2080;
      v42 = v13;
      v43 = 2048;
      v44 = v14;
      _os_log_debug_impl(&dword_1AF28C000, v9, OS_LOG_TYPE_DEBUG, "Client RX framer msg header={%s error: %d (%s), length: %zu}", buf, 0x26u);
    }
    v5 = *(_QWORD *)(a1 + 48);
    v6 = 1;
  }
  while (!*(_BYTE *)(*(_QWORD *)(v5 + 8) + 24));
  v15 = (void *)nw_framer_connection_state_copy_object_value();
  v16 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
  if (v15)
  {
    if (v16)
      __nwrapport_copy_protocol_definition_block_invoke_2_cold_6(a1 + 56);
    v17 = *(_QWORD *)(*(_QWORD *)v4 + 8);
    if (!*(_BYTE *)(v17 + 32) && *(_QWORD *)(v17 + 40))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        __nwrapport_copy_protocol_definition_block_invoke_2_cold_5(a1 + 56, v27, v28, v29, v30, v31, v32, v33);
      nw_framer_deliver_input_no_copy(v3, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(nw_framer_message_t *)(a1 + 40), 0);
      goto LABEL_30;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      __nwrapport_copy_protocol_definition_block_invoke_2_cold_4(a1 + 56, v18, v19, v20, v21, v22, v23, v24);
    v25 = *(NSObject **)(a1 + 32);
    v26 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 33);
  }
  else
  {
    if (v16)
      __nwrapport_copy_protocol_definition_block_invoke_2_cold_3();
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)v4 + 8) + 36) == 320017171)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        __nwrapport_copy_protocol_definition_block_invoke_2_cold_1();
      nw_framer_connection_state_set_object_value();
      nw_framer_mark_ready(*(nw_framer_t *)(a1 + 32));
      goto LABEL_30;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __nwrapport_copy_protocol_definition_block_invoke_2_cold_2();
    v34 = *(_QWORD *)(*(_QWORD *)v4 + 8);
    v26 = *(unsigned __int8 *)(v34 + 33);
    if (!*(_BYTE *)(v34 + 33))
    {
      *(_BYTE *)(v34 + 33) = 53;
      v26 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)v4 + 8) + 33);
    }
    v25 = *(NSObject **)(a1 + 32);
  }
  nw_framer_mark_failed_with_error(v25, v26);
LABEL_30:
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;

  v8 = 0;
LABEL_31:

  return v8;
}

uint64_t __nwrapport_copy_protocol_definition_block_invoke_3(_QWORD *a1, _OWORD *a2, unint64_t a3)
{
  uint64_t result;
  uint64_t v4;

  if (!a2 || a1[6] > a3)
    return 0;
  *(_OWORD *)(*(_QWORD *)(a1[4] + 8) + 32) = *a2;
  v4 = a1[5];
  result = a1[6];
  *(_BYTE *)(*(_QWORD *)(v4 + 8) + 24) = 1;
  return result;
}

void __nwrapport_copy_protocol_definition_block_invoke_49(uint64_t a1, void *a2, uint64_t a3, size_t a4)
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[2];

  v5 = a2;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    __nwrapport_copy_protocol_definition_block_invoke_49_cold_1(a4, v6, v7, v8, v9, v10, v11, v12);
  v13[0] = 0;
  v13[1] = a4;
  nw_framer_write_output(v5, (const uint8_t *)v13, 0x10uLL);
  nw_framer_write_output_no_copy(v5, a4);

}

uint64_t __nwrapport_copy_protocol_definition_block_invoke_51(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __nwrapport_copy_protocol_definition_block_invoke_51_cold_1((uint64_t)v2);
  +[RPNWFramer writeControlOnFramer:type:error:](RPNWFramer, "writeControlOnFramer:type:error:", v2, 3, 0);

  return 1;
}

void __nwrapport_copy_protocol_definition_block_invoke_54(uint64_t a1, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v3 = 138412290;
    v4 = a2;
    _os_log_impl(&dword_1AF28C000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cleanup handler called for framer=%@", (uint8_t *)&v3, 0xCu);
  }
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

unint64_t *RPBonjourFlagsUpdateWithRPCompanionLinkFlags(unint64_t *result, unsigned int a2)
{
  *result = *result & 0xFFFFFFFFFFFFF803 | (a2 >> 1) & 4 | (2 * a2) & 0x68 | (16 * ((a2 >> 1) & 1)) | (a2 >> 1) & 0x80 | (a2 >> 2) & 0x700;
  return result;
}

uint64_t RPCompanionLinkFlagsToShortString(__int16 a1, uint64_t a2)
{
  int8x16_t v2;
  int16x8_t v3;
  char v4;
  int16x8_t v5;
  char v6;
  char v7;
  char v8;

  v2 = (int8x16_t)vdupq_n_s32(a1);
  v3 = (int16x8_t)vceqzq_s32((int32x4_t)vandq_s8(v2, (int8x16_t)xmmword_1AF3063F0));
  *(int8x8_t *)v3.i8 = vbsl_s8((int8x8_t)vmovn_s32((int32x4_t)v3), (int8x8_t)0x68007000730075, (int8x8_t)0x48005000530055);
  *(_DWORD *)a2 = vmovn_s16(v3).u32[0];
  if ((a1 & 0x10) != 0)
    v4 = 65;
  else
    v4 = 97;
  *(_BYTE *)(a2 + 4) = v4;
  *(_BYTE *)(a2 + 5) = a1 & 0x20 ^ 0x77;
  v5 = (int16x8_t)vceqzq_s32((int32x4_t)vandq_s8(v2, (int8x16_t)xmmword_1AF306400));
  *(int8x8_t *)v5.i8 = vbsl_s8((int8x8_t)vmovn_s32((int32x4_t)v5), (int8x8_t)0x750063006D006CLL, (int8x8_t)0x550043004D004CLL);
  *(_DWORD *)(a2 + 6) = vmovn_s16(v5).u32[0];
  if ((a1 & 0x400) != 0)
    v6 = 72;
  else
    v6 = 104;
  *(_BYTE *)(a2 + 10) = v6;
  if ((a1 & 0x800) != 0)
    v7 = 83;
  else
    v7 = 115;
  *(_BYTE *)(a2 + 11) = v7;
  if ((a1 & 0x1000) != 0)
    v8 = 84;
  else
    v8 = 116;
  *(_BYTE *)(a2 + 12) = v8;
  *(_BYTE *)(a2 + 13) = 0;
  return a2;
}

unsigned int *RPCompanionLinkFlagsWithUpdateBonjourFlags(unsigned int *result, unsigned int a2)
{
  *result = (a2 >> 1) & 0x34 | (a2 >> 3) & 2 | (((a2 >> 7) & 1) << 8) & 0xFFFFE3FF | (((a2 >> 8) & 7) << 10) | *result & 0xFFFFE2C1 | (8 * ((a2 >> 2) & 1));
  return result;
}

const __CFString *RPDeviceClassToString(int a1)
{
  const __CFString *result;

  result = CFSTR("Unknown");
  switch(a1)
  {
    case 1:
      result = CFSTR("iPhone");
      break;
    case 2:
      result = CFSTR("iPod");
      break;
    case 3:
      result = CFSTR("iPad");
      break;
    case 4:
      result = CFSTR("AppleTV");
      break;
    case 5:
      result = CFSTR("FPGA");
      break;
    case 6:
      result = CFSTR("Watch");
      break;
    case 7:
      result = CFSTR("AudioAccessory");
      break;
    case 8:
    case 9:
    case 10:
      return result;
    case 11:
      result = CFSTR("RealityDevice");
      break;
    default:
      if (a1 == 100)
        result = CFSTR("Mac");
      break;
  }
  return result;
}

void RPEncodeNSError(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;

  v3 = a1;
  v4 = a2;
  if (v3)
  {
    v5 = *MEMORY[0x1E0CB2F90];
    v6 = 3;
    v17 = v4;
    while (1)
    {
      v7 = (void *)MEMORY[0x1E0CB37E8];
      v8 = objc_msgSend(v3, "code");
      if (v8)
        v9 = v8;
      else
        v9 = -6700;
      objc_msgSend(v7, "numberWithInteger:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v10, CFSTR("_ec"));

      objc_msgSend(v3, "domain");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11 && (objc_msgSend(v11, "isEqual:", v5) & 1) == 0)
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v12, CFSTR("_ed"));
      objc_msgSend(v3, "userInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      CFStringGetTypeID();
      CFDictionaryGetTypedValue();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "length"))
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v14, CFSTR("_em"));
      if (!v6)
        break;
      CFErrorGetTypeID();
      CFDictionaryGetTypedValue();
      v15 = objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        v3 = 0;
        break;
      }
      v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, CFSTR("_eu"));

      --v6;
      v17 = v16;
      v3 = (id)v15;
    }

    v4 = v17;
  }

}

id RPDecodeNSError(void *a1)
{
  id v1;
  id TypedValue;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  int Int64Ranged;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void **v14;
  uint64_t *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t i;
  void *v22;
  uint64_t v23;
  const __CFString *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  _QWORD v28[2];
  _QWORD v29[2];
  id v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  CFDictionaryGetInt64Ranged();
  v31 = 0;
  v32 = 0;
  v22 = v1;
  v30 = v1;
  if (!v30)
  {
    v31 = 0;
    goto LABEL_6;
  }
  CFDictionaryGetTypeID();
  v31 = (id)CFDictionaryGetTypedValue();
  if (!v31)
  {
LABEL_6:
    TypedValue = 0;
    v32 = 0;
    goto LABEL_7;
  }
  CFDictionaryGetTypeID();
  TypedValue = (id)CFDictionaryGetTypedValue();
  v32 = TypedValue;
  if (TypedValue)
  {
    CFDictionaryGetTypeID();
    TypedValue = (id)CFDictionaryGetTypedValue();
  }
LABEL_7:
  v3 = 0;
  v33 = TypedValue;
  v4 = (void *)*MEMORY[0x1E0CB2F90];
  v5 = 24;
  v23 = *MEMORY[0x1E0CB3388];
  do
  {
    v6 = *(id *)((char *)&v30 + v5);
    if (v6)
    {
      Int64Ranged = CFDictionaryGetInt64Ranged();
      CFStringGetTypeID();
      CFDictionaryGetTypedValue();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      CFStringGetTypeID();
      CFDictionaryGetTypedValue();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
      if (v8)
        v11 = v8;
      else
        v11 = v4;
      v12 = objc_msgSend(v9, "length", v22);
      if (v3)
      {
        if (v12)
        {
          v28[0] = v23;
          v28[1] = CFSTR("cuErrorMsg");
          v29[0] = v3;
          v29[1] = v9;
          v13 = (void *)MEMORY[0x1E0C99D80];
          v14 = (void **)v29;
          v15 = v28;
          v16 = 2;
        }
        else
        {
          v26 = v23;
          v27 = v3;
          v13 = (void *)MEMORY[0x1E0C99D80];
          v14 = &v27;
          v15 = &v26;
          v16 = 1;
        }
        objc_msgSend(v13, "dictionaryWithObjects:forKeys:count:", v14, v15, v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v10, "initWithDomain:code:userInfo:", v11, Int64Ranged, v18);

        v3 = (void *)v19;
      }
      else if (v12)
      {
        v24 = CFSTR("cuErrorMsg");
        v25 = v9;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = (void *)objc_msgSend(v10, "initWithDomain:code:userInfo:", v11, Int64Ranged, v17);

      }
      else
      {
        v3 = (void *)objc_msgSend(v10, "initWithDomain:code:userInfo:", v11, Int64Ranged, 0);
      }

    }
    v5 -= 8;
  }
  while (v5 != -8);
  for (i = 24; i != -8; i -= 8)

  return v3;
}

id RPErrorF()
{
  NSErrorV();
  return (id)objc_claimAutoreleasedReturnValue();
}

id RPNestedErrorF()
{
  NSErrorNestedV();
  return (id)objc_claimAutoreleasedReturnValue();
}

id RPVersionToSourceVersionString()
{
  char v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1 = 0;
  SourceVersionToCString();
  return 0;
}

id RPModelOSVersionToSourceVersionString()
{
  void *v0;

  GestaltProductTypeStringToDeviceClass();
  if ((DeviceOSVersionAtOrLaterEx() & 1) != 0
    || (DeviceOSVersionAtOrLaterEx() & 1) != 0
    || (DeviceOSVersionAtOrLaterEx() & 1) != 0
    || (DeviceOSVersionAtOrLaterEx() & 1) != 0
    || (DeviceOSVersionAtOrLaterEx() & 1) != 0
    || (DeviceOSVersionAtOrLaterEx() & 1) != 0
    || (DeviceOSVersionAtOrLaterEx() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || DeviceOSVersionAtOrLater()
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || NADyFF4UGjtVGBmEW6h()
    || (TN6sBSnEP2() & 1) != 0
    || wInTP56r94EFs9NAAi())
  {
    RPVersionToSourceVersionString();
    v0 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v0 = 0;
  }
  return v0;
}

void RPStringToOperatingSystemVersion(void *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  objc_msgSend(a1, "componentsSeparatedByString:", CFSTR("."));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v8, "count");
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *a2 = objc_msgSend(v5, "integerValue");

    if (v4 != 1)
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      a2[1] = objc_msgSend(v6, "integerValue");

      if (v4 >= 3)
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", 2);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        a2[2] = objc_msgSend(v7, "integerValue");

      }
    }
  }

}

BOOL RPDeviceIsCommunal(int a1)
{
  return a1 == 4 || a1 == 7;
}

BOOL shouldPrintSensitiveData()
{
  if (shouldPrintSensitiveData_onceToken != -1)
    dispatch_once(&shouldPrintSensitiveData_onceToken, &__block_literal_global_182);
  return (shouldPrintSensitiveData_sensitive & 1) == 0;
}

uint64_t __shouldPrintSensitiveData_block_invoke()
{
  uint64_t result;

  if ((os_variant_has_internal_content() & 1) == 0)
    shouldPrintSensitiveData_sensitive = 1;
  result = CFPrefs_GetInt64();
  if (result)
    shouldPrintSensitiveData_sensitive = 0;
  return result;
}

uint64_t formatSensitiveData(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  const __CFString *v5;
  id v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCString:encoding:", a1, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (a2)
    v5 = CFSTR("'%@'");
  else
    v5 = CFSTR("'%~@'");
  objc_msgSend(v3, "appendString:", v5);
  v6 = objc_retainAutorelease(v4);
  v7 = objc_msgSend(v6, "UTF8String");

  return v7;
}

void sub_1AF29D36C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF29D448(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  void *v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  objc_sync_exit(v7);
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

void sub_1AF29D6B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1AF29D78C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF2A4C38(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
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

void sub_1AF2A560C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF2A5D80(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF2A5F28(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF2A6010(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF2A60C8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF2A6180(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

const char *_StateToString(unsigned int a1)
{
  if (a1 > 0x1D)
    return "?";
  else
    return off_1E5F4FE28[a1];
}

const char *RPDataLinkTypeToString(unsigned int a1)
{
  if (a1 > 0xB)
    return "?";
  else
    return off_1E5F50058[a1];
}

id RPConnectionLog()
{
  if (RPConnectionLog_onceToken != -1)
    dispatch_once(&RPConnectionLog_onceToken, &__block_literal_global_1212);
  return (id)RPConnectionLog___logger;
}

const char *RPFrameTypeToString(int a1)
{
  const char *result;

  if (a1 > 47)
  {
    if (a1 <= 63)
    {
      if (a1 == 48)
        return "WatchIdentityRequest";
      if (a1 == 49)
        return "WatchIdentityResponse";
    }
    else
    {
      switch(a1)
      {
        case '@':
          return "FriendIdentityRequest";
        case 'A':
          return "FriendIdentityResponse";
        case 'B':
          return "FriendIdentityUpdate";
      }
    }
    return "?";
  }
  else
  {
    result = "Invalid";
    switch(a1)
    {
      case 0:
        return result;
      case 1:
        result = "NoOp";
        break;
      case 3:
        result = "PS_Start";
        break;
      case 4:
        result = "PS_Next";
        break;
      case 5:
        result = "PV_Start";
        break;
      case 6:
        result = "PV_Next";
        break;
      case 7:
        result = "U_OPACK";
        break;
      case 8:
        result = "E_OPACK";
        break;
      case 9:
        result = "P_OPACK";
        break;
      case 10:
        result = "PA_Req";
        break;
      case 11:
        result = "PA_Rsp";
        break;
      case 16:
        result = "SessionStartRequest";
        break;
      case 17:
        result = "SessionStartResponse";
        break;
      case 18:
        result = "SessionData";
        break;
      case 32:
        result = "FamilyIdentityRequest";
        break;
      case 33:
        result = "FamilyIdentityResponse";
        break;
      case 34:
        result = "FamilyIdentityUpdate";
        break;
      default:
        return "?";
    }
  }
  return result;
}

Class initMCProfileConnection()
{
  Class result;

  if (ManagedConfigurationLibrary_sOnce != -1)
    dispatch_once(&ManagedConfigurationLibrary_sOnce, &__block_literal_global_4);
  result = objc_getClass("MCProfileConnection");
  classMCProfileConnection = (uint64_t)result;
  getMCProfileConnectionClass[0] = (uint64_t (*)())MCProfileConnectionFunction;
  return result;
}

id MCProfileConnectionFunction()
{
  return (id)classMCProfileConnection;
}

id initValMCFeatureRemoteAppPairingAllowed()
{
  id *v0;

  if (ManagedConfigurationLibrary_sOnce != -1)
    dispatch_once(&ManagedConfigurationLibrary_sOnce, &__block_literal_global_4);
  v0 = (id *)dlsym((void *)ManagedConfigurationLibrary_sLib, "MCFeatureRemoteAppPairingAllowed");
  if (v0)
    objc_storeStrong((id *)&constantValMCFeatureRemoteAppPairingAllowed, *v0);
  getMCFeatureRemoteAppPairingAllowed[0] = (uint64_t (*)())MCFeatureRemoteAppPairingAllowedFunction;
  return (id)constantValMCFeatureRemoteAppPairingAllowed;
}

id MCFeatureRemoteAppPairingAllowedFunction()
{
  return (id)constantValMCFeatureRemoteAppPairingAllowed;
}

void sub_1AF2B8DB4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF2B8E84(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF2B8F34(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF2B8FF4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF2BEB18(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF2BEE68(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF2C1250(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
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

void sub_1AF2C2C54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

void sub_1AF2C46F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  (*(void (**)(void))(a11 + 16))();
  _Block_object_dispose(&a45, 8);
  _Unwind_Resume(a1);
}

void sub_1AF2C4C5C(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

void sub_1AF2C58C8(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Block_object_dispose((const void *)(v2 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AF2C7014(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(void))(v1 + 16))();
  _Block_object_dispose((const void *)(v2 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AF2C7FB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  (*(void (**)(void))(a11 + 16))();
  _Unwind_Resume(a1);
}

void sub_1AF2C8598(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  (*(void (**)(uint64_t))(v7 + 16))(v7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF2C87DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  (*(void (**)(uint64_t))(v9 + 16))(v9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF2C9520(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  (*(void (**)(uint64_t))(v7 + 16))(v7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

const __CFString *RPNearFieldTransactionStateDescription(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("Connected");
  if (a1 == 1)
    v1 = CFSTR("Interrupted");
  if (a1 == 2)
    return CFSTR("Exchange Completed");
  else
    return v1;
}

Class initSFDeviceDiscovery()
{
  Class result;

  if (SharingLibrary_sOnce_0 != -1)
    dispatch_once(&SharingLibrary_sOnce_0, &__block_literal_global_461);
  result = objc_getClass("SFDeviceDiscovery");
  classSFDeviceDiscovery = (uint64_t)result;
  getSFDeviceDiscoveryClass[0] = (uint64_t (*)())SFDeviceDiscoveryFunction;
  return result;
}

id SFDeviceDiscoveryFunction()
{
  return (id)classSFDeviceDiscovery;
}

void sub_1AF2DA42C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
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

void sub_1AF2DA754(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF2DAF44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1AF2DB300(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF2DB804(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF2DB9E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1AF2DBCCC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF2DBD8C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF2DBE3C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF2DC030(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF2DD13C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Block_object_dispose((const void *)(v11 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1AF2DE678(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF2DF9F8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF2E1DF8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF2E1E60(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF2E21F8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF2E2368(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF2E24E0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF2E28A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1AF2E2A60(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF2E2E44(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

const char *RPDataLinkTypeToString_0(unsigned int a1)
{
  if (a1 > 0xB)
    return "?";
  else
    return off_1E5F50C20[a1];
}

void sub_1AF2E7134(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF2E8C78(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

Class initAVVCStartRecordSettings()
{
  Class result;

  if (AVFAudioLibrary_sOnce != -1)
    dispatch_once(&AVFAudioLibrary_sOnce, &__block_literal_global_262);
  result = objc_getClass("AVVCStartRecordSettings");
  classAVVCStartRecordSettings = (uint64_t)result;
  getAVVCStartRecordSettingsClass[0] = (uint64_t (*)())AVVCStartRecordSettingsFunction;
  return result;
}

id AVVCStartRecordSettingsFunction()
{
  return (id)classAVVCStartRecordSettings;
}

Class initAVAudioFormat()
{
  Class result;

  if (AVFAudioLibrary_sOnce != -1)
    dispatch_once(&AVFAudioLibrary_sOnce, &__block_literal_global_262);
  result = objc_getClass("AVAudioFormat");
  classAVAudioFormat = (uint64_t)result;
  getAVAudioFormatClass[0] = (uint64_t (*)())AVAudioFormatFunction;
  return result;
}

id AVAudioFormatFunction()
{
  return (id)classAVAudioFormat;
}

Class initAVVoiceController()
{
  Class result;

  if (AVFAudioLibrary_sOnce != -1)
    dispatch_once(&AVFAudioLibrary_sOnce, &__block_literal_global_262);
  result = objc_getClass("AVVoiceController");
  classAVVoiceController = (uint64_t)result;
  getAVVoiceControllerClass[0] = (uint64_t (*)())AVVoiceControllerFunction;
  return result;
}

id AVVoiceControllerFunction()
{
  return (id)classAVVoiceController;
}

Class initAVVCContextSettings()
{
  Class result;

  if (AVFAudioLibrary_sOnce != -1)
    dispatch_once(&AVFAudioLibrary_sOnce, &__block_literal_global_262);
  result = objc_getClass("AVVCContextSettings");
  classAVVCContextSettings = (uint64_t)result;
  getAVVCContextSettingsClass[0] = (uint64_t (*)())AVVCContextSettingsFunction;
  return result;
}

id AVVCContextSettingsFunction()
{
  return (id)classAVVCContextSettings;
}

Class initAVVCPrepareRecordSettings()
{
  Class result;

  if (AVFAudioLibrary_sOnce != -1)
    dispatch_once(&AVFAudioLibrary_sOnce, &__block_literal_global_262);
  result = objc_getClass("AVVCPrepareRecordSettings");
  classAVVCPrepareRecordSettings = (uint64_t)result;
  getAVVCPrepareRecordSettingsClass[0] = (uint64_t (*)())AVVCPrepareRecordSettingsFunction;
  return result;
}

id AVVCPrepareRecordSettingsFunction()
{
  return (id)classAVVCPrepareRecordSettings;
}

void sub_1AF2EE5B8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF2EF884(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF2F0238(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF2F2B90(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF2F2D04(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF2F38B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v12;

  (*(void (**)(void))(a12 + 16))();
  _Block_object_dispose((const void *)(v12 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void sub_1AF2F64D0(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Block_object_dispose((const void *)(v2 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy__71(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x1AF45BE48](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__72(uint64_t a1)
{

}

void sub_1AF2F7508(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Block_object_dispose((const void *)(v2 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1AF2F7E78(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Block_object_dispose((const void *)(v2 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1AF2F87FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  (*(void (**)(uint64_t))(v31 + 16))(v31);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

id RPStreamSessionLog()
{
  if (RPStreamSessionLog_onceToken != -1)
    dispatch_once(&RPStreamSessionLog_onceToken, &__block_literal_global_435);
  return (id)RPStreamSessionLog___logger;
}

void sub_1AF2F9E78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  (*(void (**)(uint64_t))(v15 + 16))(v15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF2FABF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  uint64_t v43;

  (*(void (**)(uint64_t))(v43 + 16))(v43);
  _Block_object_dispose(&a43, 8);
  _Unwind_Resume(a1);
}

Class initRTIDataPayload()
{
  Class result;

  if (RemoteTextInputLibrary_sOnce != -1)
    dispatch_once(&RemoteTextInputLibrary_sOnce, &__block_literal_global_128);
  result = objc_getClass("RTIDataPayload");
  classRTIDataPayload = (uint64_t)result;
  getRTIDataPayloadClass[0] = (uint64_t (*)())RTIDataPayloadFunction;
  return result;
}

id RTIDataPayloadFunction()
{
  return (id)classRTIDataPayload;
}

Class initRTIInputSystemSourceSession()
{
  Class result;

  if (RemoteTextInputLibrary_sOnce != -1)
    dispatch_once(&RemoteTextInputLibrary_sOnce, &__block_literal_global_128);
  result = objc_getClass("RTIInputSystemSourceSession");
  classRTIInputSystemSourceSession = (uint64_t)result;
  getRTIInputSystemSourceSessionClass[0] = (uint64_t (*)())RTIInputSystemSourceSessionFunction;
  return result;
}

id RTIInputSystemSourceSessionFunction()
{
  return (id)classRTIInputSystemSourceSession;
}

void __nwrapport_copy_protocol_definition_block_invoke_2_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1AF28C000, MEMORY[0x1E0C81028], v0, "Validated magic value: 0x%x", v1, v2, v3, v4, 0);
  OUTLINED_FUNCTION_3();
}

void __nwrapport_copy_protocol_definition_block_invoke_2_cold_2()
{
  int v0;
  _DWORD v1[2];

  OUTLINED_FUNCTION_4();
  v1[0] = 67109120;
  v1[1] = v0;
  _os_log_error_impl(&dword_1AF28C000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Magic value does not match: 0x%x", (uint8_t *)v1, 8u);
  OUTLINED_FUNCTION_3();
}

void __nwrapport_copy_protocol_definition_block_invoke_2_cold_3()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_debug_impl(&dword_1AF28C000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Connection not validated yet", v0, 2u);
  OUTLINED_FUNCTION_3();
}

void __nwrapport_copy_protocol_definition_block_invoke_2_cold_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1AF28C000, MEMORY[0x1E0C81028], a3, "Received error code=%u", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

void __nwrapport_copy_protocol_definition_block_invoke_2_cold_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1AF28C000, MEMORY[0x1E0C81028], a3, "Received data, length=%zu, passing through", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_0();
}

void __nwrapport_copy_protocol_definition_block_invoke_2_cold_6(uint64_t a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  _DWORD v4[2];
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(*(_QWORD *)a1 + 8);
  v2 = *(unsigned __int8 *)(v1 + 32);
  v3 = *(_QWORD *)(v1 + 40);
  v4[0] = 67109376;
  v4[1] = v2;
  v5 = 2048;
  v6 = v3;
  _os_log_debug_impl(&dword_1AF28C000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Got a message header, type=%d, length=%zu", (uint8_t *)v4, 0x12u);
  OUTLINED_FUNCTION_0();
}

void __nwrapport_copy_protocol_definition_block_invoke_49_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1AF28C000, MEMORY[0x1E0C81028], a3, "Writing data (%zu bytes) on framer", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_0();
}

void __nwrapport_copy_protocol_definition_block_invoke_51_cold_1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138412290;
  v2 = a1;
  _os_log_error_impl(&dword_1AF28C000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Stop handler called for framer=%@, sending CLOSE to daemon", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_0();
}

uint64_t BonjourAdvertiserCreate()
{
  return MEMORY[0x1E0D1A7E8]();
}

uint64_t BonjourAdvertiserSetDispatchQueue()
{
  return MEMORY[0x1E0D1A7F0]();
}

uint64_t BonjourAdvertiserSetPort()
{
  return MEMORY[0x1E0D1A810]();
}

uint64_t BonjourAdvertiserSetServiceType()
{
  return MEMORY[0x1E0D1A818]();
}

uint64_t BonjourAdvertiserSetTXTRecord()
{
  return MEMORY[0x1E0D1A820]();
}

uint64_t BonjourAdvertiserStart()
{
  return MEMORY[0x1E0D1A828]();
}

uint64_t BonjourAdvertiserStop()
{
  return MEMORY[0x1E0D1A830]();
}

uint64_t BonjourAdvertiserUpdate()
{
  return MEMORY[0x1E0D1A838]();
}

uint64_t BonjourBrowser_Create()
{
  return MEMORY[0x1E0D1A840]();
}

uint64_t BonjourBrowser_SetDispatchQueue()
{
  return MEMORY[0x1E0D1A858]();
}

uint64_t BonjourBrowser_SetEventHandlerBlock()
{
  return MEMORY[0x1E0D1A868]();
}

uint64_t BonjourBrowser_Start()
{
  return MEMORY[0x1E0D1A878]();
}

uint64_t BonjourBrowser_Stop()
{
  return MEMORY[0x1E0D1A880]();
}

uint64_t BonjourDevice_GetDeviceID()
{
  return MEMORY[0x1E0D1A8A8]();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80368](data, *(_QWORD *)&len, md);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80370](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80378](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80380](c, data, *(_QWORD *)&len);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1E0C97D90]();
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1E0C98418]();
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x1E0C984E8]();
}

uint64_t CFDictionaryGetCFDataOfLength()
{
  return MEMORY[0x1E0D1A930]();
}

uint64_t CFDictionaryGetDouble()
{
  return MEMORY[0x1E0D1A950]();
}

uint64_t CFDictionaryGetInt64()
{
  return MEMORY[0x1E0D1A970]();
}

uint64_t CFDictionaryGetInt64Ranged()
{
  return MEMORY[0x1E0D1A980]();
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1E0C985A8]();
}

uint64_t CFDictionaryGetTypedValue()
{
  return MEMORY[0x1E0D1A990]();
}

CFTypeID CFErrorGetTypeID(void)
{
  return MEMORY[0x1E0C98678]();
}

uint64_t CFGetHardwareAddress()
{
  return MEMORY[0x1E0D1A9E0]();
}

uint64_t CFPrefs_GetDouble()
{
  return MEMORY[0x1E0D1AA50]();
}

uint64_t CFPrefs_GetInt64()
{
  return MEMORY[0x1E0D1AA60]();
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

uint64_t CUDescriptionWithLevel()
{
  return MEMORY[0x1E0D1AB00]();
}

uint64_t CUDispatchTimerSet()
{
  return MEMORY[0x1E0D1AB18]();
}

uint64_t CUGetInterfaceAddresses()
{
  return MEMORY[0x1E0D1AB38]();
}

uint64_t CUMetricsLog()
{
  return MEMORY[0x1E0D1AB48]();
}

uint64_t CUMetricsLogEx()
{
  return MEMORY[0x1E0D1AB50]();
}

uint64_t CryptoHKDF()
{
  return MEMORY[0x1E0D1ACF0]();
}

uint64_t Curve25519MakeKeyPair()
{
  return MEMORY[0x1E0D1ACF8]();
}

uint64_t DeviceOSVersionAtOrLater()
{
  return MEMORY[0x1E0D1ADA0]();
}

uint64_t DeviceOSVersionAtOrLaterEx()
{
  return MEMORY[0x1E0D1ADA8]();
}

uint64_t FPrintF()
{
  return MEMORY[0x1E0D1ADB0]();
}

uint64_t FatalErrorF()
{
  return MEMORY[0x1E0D1ADC0]();
}

uint64_t GestaltCopyAnswer()
{
  return MEMORY[0x1E0D1ADD0]();
}

uint64_t GestaltGetDeviceClass()
{
  return MEMORY[0x1E0D1AE00]();
}

uint64_t GestaltProductTypeStringToDeviceClass()
{
  return MEMORY[0x1E0D1AE08]();
}

uint64_t IsAppleInternalBuild()
{
  return MEMORY[0x1E0D1AFF8]();
}

uint64_t LogCategoryCopyOSLogHandle()
{
  return MEMORY[0x1E0D1B038]();
}

uint64_t LogCategoryReplaceF()
{
  return MEMORY[0x1E0D1B050]();
}

uint64_t LogCategory_Remove()
{
  return MEMORY[0x1E0D1B068]();
}

uint64_t LogPrintF()
{
  return MEMORY[0x1E0D1B098]();
}

uint64_t NADyFF4UGjtVGBmEW6h()
{
  return MEMORY[0x1E0D1B128]();
}

uint64_t NSAppendPrintF()
{
  return MEMORY[0x1E0D1B130]();
}

uint64_t NSDecodeNSArrayOfClassIfPresent()
{
  return MEMORY[0x1E0D1B168]();
}

uint64_t NSDecodeNSDictionaryOfClassesIfPresent()
{
  return MEMORY[0x1E0D1B178]();
}

uint64_t NSDecodeNSSetOfClassIfPresent()
{
  return MEMORY[0x1E0D1B180]();
}

uint64_t NSDecodeObjectIfPresent()
{
  return MEMORY[0x1E0D1B188]();
}

uint64_t NSDecodeSInt64RangedIfPresent()
{
  return MEMORY[0x1E0D1B190]();
}

uint64_t NSDecodeStandardContainerIfPresent()
{
  return MEMORY[0x1E0D1B198]();
}

uint64_t NSDictionaryGetNSArrayOfClass()
{
  return MEMORY[0x1E0D1B1A0]();
}

uint64_t NSDictionaryGetNSNumber()
{
  return MEMORY[0x1E0D1B1A8]();
}

uint64_t NSDictionaryGetNSUUID()
{
  return MEMORY[0x1E0D1B1B8]();
}

uint64_t NSErrorNestedV()
{
  return MEMORY[0x1E0D1B1E8]();
}

uint64_t NSErrorV()
{
  return MEMORY[0x1E0D1B1F8]();
}

uint64_t NSErrorWithOSStatusF()
{
  return MEMORY[0x1E0D1B200]();
}

uint64_t NSPrintF()
{
  return MEMORY[0x1E0D1B210]();
}

uint64_t NSRandomData()
{
  return MEMORY[0x1E0D1B228]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

uint64_t OPACKDecodeData()
{
  return MEMORY[0x1E0D1B4C0]();
}

uint64_t OPACKEncoderCreateData()
{
  return MEMORY[0x1E0D1B4D0]();
}

uint64_t OPACKEstimateEncodedSize()
{
  return MEMORY[0x1E0D1B4E0]();
}

uint64_t RandomBytes()
{
  return MEMORY[0x1E0D1B5F8]();
}

uint64_t SNPrintF()
{
  return MEMORY[0x1E0D1B610]();
}

uint64_t SecondsToUpTicks()
{
  return MEMORY[0x1E0D1B628]();
}

uint64_t ServerSocketOpenEx2()
{
  return MEMORY[0x1E0D1B640]();
}

uint64_t ServerSocketPairOpen()
{
  return MEMORY[0x1E0D1B648]();
}

uint64_t SipHash()
{
  return MEMORY[0x1E0D1B658]();
}

uint64_t SockAddrCompareAddr()
{
  return MEMORY[0x1E0D1B660]();
}

uint64_t SockAddrConvertToIPv6()
{
  return MEMORY[0x1E0D1B668]();
}

uint64_t SockAddrGetPort()
{
  return MEMORY[0x1E0D1B678]();
}

uint64_t SockAddrGetSize()
{
  return MEMORY[0x1E0D1B680]();
}

uint64_t SockAddrSetPort()
{
  return MEMORY[0x1E0D1B688]();
}

uint64_t SockAddrSimplify()
{
  return MEMORY[0x1E0D1B690]();
}

uint64_t SockAddrToString()
{
  return MEMORY[0x1E0D1B698]();
}

uint64_t SocketGetInterfaceInfo()
{
  return MEMORY[0x1E0D1B6B0]();
}

uint64_t SocketSetQoS()
{
  return MEMORY[0x1E0D1B6E8]();
}

uint64_t SourceVersionToCString()
{
  return MEMORY[0x1E0D1B708]();
}

uint64_t StringToSockAddr()
{
  return MEMORY[0x1E0D1B710]();
}

uint64_t TN6sBSnEP2()
{
  return MEMORY[0x1E0D1B778]();
}

void TXTRecordCreate(TXTRecordRef *txtRecord, uint16_t bufferLen, void *buffer)
{
  MEMORY[0x1E0C806F0](txtRecord, bufferLen, buffer);
}

void TXTRecordDeallocate(TXTRecordRef *txtRecord)
{
  MEMORY[0x1E0C806F8](txtRecord);
}

const void *__cdecl TXTRecordGetBytesPtr(const TXTRecordRef *txtRecord)
{
  return (const void *)MEMORY[0x1E0C80700](txtRecord);
}

uint16_t TXTRecordGetLength(const TXTRecordRef *txtRecord)
{
  return MEMORY[0x1E0C80718](txtRecord);
}

uint64_t TXTRecordGetNextItem()
{
  return MEMORY[0x1E0D1B780]();
}

DNSServiceErrorType TXTRecordSetValue(TXTRecordRef *txtRecord, const char *key, uint8_t valueSize, const void *value)
{
  return MEMORY[0x1E0C80730](txtRecord, key, valueSize, value);
}

uint64_t TextToHardwareAddress()
{
  return MEMORY[0x1E0D1B798]();
}

uint64_t TextToHardwareAddressScalar()
{
  return MEMORY[0x1E0D1B7A8]();
}

uint64_t UpTicksToMilliseconds()
{
  return MEMORY[0x1E0D1B7F0]();
}

uint64_t UpTicksToSeconds()
{
  return MEMORY[0x1E0D1B808]();
}

uint64_t UpTicksToSecondsF()
{
  return MEMORY[0x1E0D1B818]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _LogCategory_Initialize()
{
  return MEMORY[0x1E0D1B880]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

float __exp10f(float a1)
{
  float result;

  MEMORY[0x1E0C80AD0](a1);
  return result;
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1E0C80C48]();
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t cccurve25519()
{
  return MEMORY[0x1E0C81998]();
}

uint64_t cccurve25519_make_pub()
{
  return MEMORY[0x1E0C819B0]();
}

uint64_t cced25519_make_key_pair_compat()
{
  return MEMORY[0x1E0D1B890]();
}

uint64_t cced25519_sign_compat()
{
  return MEMORY[0x1E0D1B898]();
}

uint64_t cced25519_verify_compat()
{
  return MEMORY[0x1E0D1B8A0]();
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x1E0DE5270](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(_QWORD *)&algorithm);
}

size_t compression_encode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x1E0DE5280](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(_QWORD *)&algorithm);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x1E0C826D8](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
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

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C83300](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

void freeifaddrs(ifaddrs *a1)
{
  MEMORY[0x1E0C834D0](a1);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1E0C83590](*(_QWORD *)&a1, a2);
}

int getifaddrs(ifaddrs **a1)
{
  return MEMORY[0x1E0C836C8](a1);
}

int getpeername(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x1E0C83748](*(_QWORD *)&a1, a2, a3);
}

int getsockname(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x1E0C83810](*(_QWORD *)&a1, a2, a3);
}

unsigned int if_nametoindex(const char *a1)
{
  return MEMORY[0x1E0C83910](a1);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1E0C83C38](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x1E0C840D0](__s, __smax, *(_QWORD *)&__c, __n);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

void nw_connection_cancel(nw_connection_t connection)
{
  MEMORY[0x1E0CCEFB8](connection);
}

nw_endpoint_t nw_endpoint_create_address(const sockaddr *address)
{
  return (nw_endpoint_t)MEMORY[0x1E0CCF388](address);
}

uint64_t nw_endpoint_create_address_with_ethernet()
{
  return MEMORY[0x1E0CCF390]();
}

const sockaddr *__cdecl nw_endpoint_get_address(nw_endpoint_t endpoint)
{
  return (const sockaddr *)MEMORY[0x1E0CCF3D8](endpoint);
}

CFErrorRef nw_error_copy_cf_error(nw_error_t error)
{
  return (CFErrorRef)MEMORY[0x1E0CCF458](error);
}

void nw_framer_async(nw_framer_t framer, nw_framer_block_t async_block)
{
  MEMORY[0x1E0CCF5D0](framer, async_block);
}

uint64_t nw_framer_connection_state_copy_object_value()
{
  return MEMORY[0x1E0CCF5D8]();
}

uint64_t nw_framer_connection_state_set_object_value()
{
  return MEMORY[0x1E0CCF5E0]();
}

nw_protocol_definition_t nw_framer_create_definition(const char *identifier, uint32_t flags, nw_framer_start_handler_t start_handler)
{
  return (nw_protocol_definition_t)MEMORY[0x1E0CCF5E8](identifier, *(_QWORD *)&flags, start_handler);
}

BOOL nw_framer_deliver_input_no_copy(nw_framer_t framer, size_t input_length, nw_framer_message_t message, BOOL is_complete)
{
  return MEMORY[0x1E0CCF5F8](framer, input_length, message, is_complete);
}

void nw_framer_mark_failed_with_error(nw_framer_t framer, int error_code)
{
  MEMORY[0x1E0CCF600](framer, *(_QWORD *)&error_code);
}

void nw_framer_mark_ready(nw_framer_t framer)
{
  MEMORY[0x1E0CCF608](framer);
}

nw_framer_message_t nw_framer_message_create(nw_framer_t framer)
{
  return (nw_framer_message_t)MEMORY[0x1E0CCF618](framer);
}

BOOL nw_framer_parse_input(nw_framer_t framer, size_t minimum_incomplete_length, size_t maximum_length, uint8_t *temp_buffer, nw_framer_parse_completion_t parse)
{
  return MEMORY[0x1E0CCF628](framer, minimum_incomplete_length, maximum_length, temp_buffer, parse);
}

void nw_framer_set_cleanup_handler(nw_framer_t framer, nw_framer_cleanup_handler_t cleanup_handler)
{
  MEMORY[0x1E0CCF648](framer, cleanup_handler);
}

void nw_framer_set_input_handler(nw_framer_t framer, nw_framer_input_handler_t input_handler)
{
  MEMORY[0x1E0CCF650](framer, input_handler);
}

void nw_framer_set_output_handler(nw_framer_t framer, nw_framer_output_handler_t output_handler)
{
  MEMORY[0x1E0CCF658](framer, output_handler);
}

void nw_framer_set_stop_handler(nw_framer_t framer, nw_framer_stop_handler_t stop_handler)
{
  MEMORY[0x1E0CCF660](framer, stop_handler);
}

void nw_framer_write_output(nw_framer_t framer, const uint8_t *output_buffer, size_t output_length)
{
  MEMORY[0x1E0CCF670](framer, output_buffer, output_length);
}

BOOL nw_framer_write_output_no_copy(nw_framer_t framer, size_t output_length)
{
  return MEMORY[0x1E0CCF678](framer, output_length);
}

uint64_t nw_interface_create_with_name()
{
  return MEMORY[0x1E0CCF6F8]();
}

void nw_listener_cancel(nw_listener_t listener)
{
  MEMORY[0x1E0CCF7C8](listener);
}

uint64_t nw_listener_copy_local_endpoint()
{
  return MEMORY[0x1E0CCF7D0]();
}

nw_listener_t nw_listener_create(nw_parameters_t parameters)
{
  return (nw_listener_t)MEMORY[0x1E0CCF7D8](parameters);
}

uint64_t nw_listener_set_event_handler()
{
  return MEMORY[0x1E0CCF800]();
}

void nw_listener_set_new_connection_handler(nw_listener_t listener, nw_listener_new_connection_handler_t handler)
{
  MEMORY[0x1E0CCF810](listener, handler);
}

void nw_listener_set_queue(nw_listener_t listener, dispatch_queue_t queue)
{
  MEMORY[0x1E0CCF820](listener, queue);
}

void nw_listener_start(nw_listener_t listener)
{
  MEMORY[0x1E0CCF830](listener);
}

nw_protocol_stack_t nw_parameters_copy_default_protocol_stack(nw_parameters_t parameters)
{
  return (nw_protocol_stack_t)MEMORY[0x1E0CCF8C8](parameters);
}

uint64_t nw_parameters_create_legacy_tcp_socket()
{
  return MEMORY[0x1E0CCF950]();
}

nw_parameters_t nw_parameters_create_secure_udp(nw_parameters_configure_protocol_block_t configure_dtls, nw_parameters_configure_protocol_block_t configure_udp)
{
  return (nw_parameters_t)MEMORY[0x1E0CCF990](configure_dtls, configure_udp);
}

void nw_parameters_require_interface(nw_parameters_t parameters, nw_interface_t interface)
{
  MEMORY[0x1E0CCFA48](parameters, interface);
}

uint64_t nw_parameters_set_allow_duplicate_state_updates()
{
  return MEMORY[0x1E0CCFA58]();
}

uint64_t nw_parameters_set_delegated_unique_pid()
{
  return MEMORY[0x1E0CCFAA0]();
}

void nw_parameters_set_local_endpoint(nw_parameters_t parameters, nw_endpoint_t local_endpoint)
{
  MEMORY[0x1E0CCFB38](parameters, local_endpoint);
}

void nw_parameters_set_reuse_local_address(nw_parameters_t parameters, BOOL reuse_local_address)
{
  MEMORY[0x1E0CCFC18](parameters, reuse_local_address);
}

uint64_t nw_path_create_evaluator_for_endpoint()
{
  return MEMORY[0x1E0CCFD10]();
}

uint64_t nw_path_evaluator_cancel()
{
  return MEMORY[0x1E0CCFD20]();
}

uint64_t nw_path_evaluator_get_client_id()
{
  return MEMORY[0x1E0CCFD40]();
}

void nw_protocol_stack_set_transport_protocol(nw_protocol_stack_t stack, nw_protocol_options_t protocol)
{
  MEMORY[0x1E0CD0000](stack, protocol);
}

nw_protocol_options_t nw_udp_create_options(void)
{
  return (nw_protocol_options_t)MEMORY[0x1E0CD0408]();
}

uint64_t nw_udp_options_set_no_metadata()
{
  return MEMORY[0x1E0CD0410]();
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
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

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
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

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
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

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1E0C849F0]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1E0C85000](*(_QWORD *)&a1, a2, a3);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

uint64_t stristr()
{
  return MEMORY[0x1E0D1B988]();
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

uint64_t wInTP56r94EFs9NAAi()
{
  return MEMORY[0x1E0D1B9B0]();
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1E0C85D40](*(_QWORD *)&__fd, __buf, __nbyte);
}

xpc_object_t xpc_fd_create(int fd)
{
  return (xpc_object_t)MEMORY[0x1E0C864A0](*(_QWORD *)&fd);
}

int xpc_fd_dup(xpc_object_t xfd)
{
  return MEMORY[0x1E0C864B0](xfd);
}

