uint64_t sub_100001908(uint64_t a1)
{
  _QWORD v2[6];

  v2[0] = 0x83EF6AC599EFF6A0;
  v2[1] = a1 != 0;
  v2[2] = a1;
  memset(&v2[3], 0, 24);
  return sub_100001B80((unsigned __int8 *)v2, 1);
}

uint64_t sub_100001950(void *a1, const char *a2, uint64_t a3)
{
  xpc_object_t dictionary;
  void *v5;
  uint64_t v6;
  _QWORD applier[9];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[4];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  dictionary = xpc_dictionary_get_dictionary(a1, a2);
  if (!dictionary)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, _QWORD))(a3 + 16))(a3, 1, 0, 0);
  v5 = dictionary;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2000000000;
  v17 = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2000000000;
  v13[3] = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2000000000;
  v12 = 0;
  v12 = _os_trace_calloc(20, 16);
  applier[0] = _NSConcreteStackBlock;
  applier[1] = 0x40000000;
  applier[2] = sub_1000020E4;
  applier[3] = &unk_10000C9C0;
  applier[7] = &v14;
  applier[8] = 20;
  applier[4] = a3;
  applier[5] = &v9;
  applier[6] = v13;
  if (xpc_dictionary_apply(v5, applier))
  {
    ++v15[3];
    v6 = (*(uint64_t (**)(uint64_t))(a3 + 16))(a3);
  }
  else
  {
    v6 = 0;
  }
  free((void *)v10[3]);
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(v13, 8);
  _Block_object_dispose(&v14, 8);
  return v6;
}

BOOL sub_100001ABC(id a1, unint64_t a2, oslogdarwin_streamprefsvalue_s *a3, unint64_t a4)
{
  uint64_t v5;
  char v6;
  _BYTE v7[7];
  oslogdarwin_streamprefsvalue_s *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (a4)
  {
    v5 = 0x2B8FCFC795D2A138;
    v6 = 3;
    memset(v7, 0, sizeof(v7));
    v8 = a3;
    v9 = a4;
    v10 = 0;
    v11 = 0;
    return sub_100001B80((unsigned __int8 *)&v5, a2 == 1);
  }
  else if (a2 == 1)
  {
    return sub_100001B28();
  }
  else
  {
    return 1;
  }
}

uint64_t sub_100001B28()
{
  _QWORD v1[2];
  uint64_t v2;
  char v3;
  _BYTE v4[7];
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1[0] = 0;
  v1[1] = 0;
  v2 = 0x2B8FCFC795D2A138;
  v3 = 3;
  memset(v4, 0, sizeof(v4));
  v5 = v1;
  v6 = 0;
  v7 = 0;
  v8 = 0;
  return sub_100001B80((unsigned __int8 *)&v2, 1);
}

uint64_t sub_100001B80(unsigned __int8 *a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 *v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  _QWORD v25[5];
  void **v26;
  _QWORD v27[4];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;

  if (qword_100010488 != -1)
    dispatch_once(&qword_100010488, &stru_10000C958);
  v4 = (_QWORD *)qword_100010480;
  if (!qword_100010480)
    return 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2000000000;
  v18 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 0x40000000;
  v14[2] = sub_100001FF8;
  v14[3] = &unk_10000C9E8;
  v14[4] = &v15;
  v5 = *(_QWORD *)a1;
  if (*(_QWORD *)a1 == 0x4E9FB3A19A8A7C1DLL || (v6 = 0x2B8FCFC795D2A138, v5 == 0x2B8FCFC795D2A138))
  {
    *(_QWORD *)&v19 = 0;
    *((_QWORD *)&v19 + 1) = &v19;
    v20 = 0x2000000000uLL;
    *(_QWORD *)&v32 = _NSConcreteStackBlock;
    *((_QWORD *)&v32 + 1) = 0x40000000;
    *(_QWORD *)&v33 = sub_100008E84;
    *((_QWORD *)&v33 + 1) = &unk_10000D008;
    *(_QWORD *)&v34 = &v19;
    sub_100008BFC(a1 + 8, (uint64_t)&v32);
    v8 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 24);
    _Block_object_dispose(&v19, 8);
    v6 = v8 + 16;
  }
  else if (v5 == 0x83EF6AC599EFF6A0)
  {
    v6 = 17;
    if (!a1[8])
      v6 = 9;
  }
  v24 = 0;
  v23 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v38 = 0;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  if (tb_client_connection_message_construct(*v4, &v19, &v32, v6 + 9, 0))
    goto LABEL_21;
  tb_message_encode_u64(&v19, 0xBA9CD36AA072C9FBLL);
  tb_message_encode_u64(&v19, *(_QWORD *)a1);
  v9 = *(_QWORD *)a1;
  if (*(_QWORD *)a1 == 0x4E9FB3A19A8A7C1DLL || v9 == 0x2B8FCFC795D2A138)
  {
    v10 = a1 + 8;
    v28 = 0;
    v29 = &v28;
    v30 = 0x2000000000;
    v31 = 0;
    v26 = _NSConcreteStackBlock;
    v27[0] = 0x40000000;
    v27[1] = sub_100008E9C;
    v27[2] = &unk_10000D030;
    v27[3] = &v28;
    sub_100008BFC(v10, (uint64_t)&v26);
    tb_message_encode_u64(&v19, v29[3]);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 0x40000000;
    v25[2] = sub_100008EB4;
    v25[3] = &unk_10000D050;
    v25[4] = &v19;
    sub_100008BFC(v10, (uint64_t)v25);
    _Block_object_dispose(&v28, 8);
  }
  else if (v9 == 0x83EF6AC599EFF6A0)
  {
    if (a1[8])
    {
      tb_message_encode_u8(&v19, 1);
      tb_message_encode_u64(&v19, *((_QWORD *)a1 + 2));
    }
    else
    {
      tb_message_encode_u8(&v19, 0);
    }
  }
  tb_message_encode_BOOL(&v19, a2);
  tb_message_complete(&v19);
  v25[0] = 0;
  if ((tb_connection_send_query(*v4, &v19, v25, 2) & 0xFFFFFFF7) != 0 || (v12 = v25[0]) == 0)
  {
LABEL_20:
    tb_client_connection_message_destruct(*v4, &v19);
LABEL_21:
    v7 = 0;
LABEL_22:
    _Block_object_dispose(&v15, 8);
    return v7;
  }
  v26 = 0;
  v27[0] = 0;
  tb_message_decode_u8(v25[0], &v26);
  if (v26 != 1)
  {
    if (!(_BYTE)v26)
    {
      v13 = v27[0];
LABEL_31:
      sub_100001FF8((uint64_t)v14, (char)v26, v13);
      tb_client_connection_message_destruct(*v4, &v19);
      v7 = *((_BYTE *)v16 + 24) == 0;
      goto LABEL_22;
    }
    goto LABEL_20;
  }
  tb_message_decode_u64(v12, v27);
  v13 = v27[0];
  if (v27[0] == 0xCBD9DC39909D106ALL || v27[0] == 0x4EF7D98DF3E71501)
    goto LABEL_31;
  result = _os_crash("TB_ASSERT: (oslogdarwin_configerror__decode(message, &result->value.failure) == TB_ERROR_SUCCESS) && \"failed to decode type: OSLogDarwin.ConfigError\"");
  __break(1u);
  return result;
}

void sub_100001FF8(uint64_t a1, char a2, uint64_t a3)
{
  char v4[1032];

  if (a2 == 1)
  {
    if (a3 == 0xCBD9DC39909D106ALL)
    {
      strcpy(v4, "failed to set stream preferences in exclaves: invalid subsystem id");
    }
    else
    {
      if (a3 != 0x4EF7D98DF3E71501)
      {
LABEL_7:
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
        return;
      }
      strcpy(v4, "failed to set stream preferences in exclaves: full cache");
    }
    sub_100006394((uint64_t)v4);
    goto LABEL_7;
  }
}

uint64_t sub_1000020E4(_QWORD *a1, const char *a2, xpc_object_t object)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uInt v11;
  uint64_t value;
  uint64_t v13;

  if (xpc_get_type(object) != (xpc_type_t)&_xpc_type_uint64 && xpc_get_type(object) != (xpc_type_t)&_xpc_type_int64)
    return 0;
  v7 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  v8 = *(_QWORD *)(a1[6] + 8);
  v9 = *(_QWORD *)(v8 + 24);
  *(_QWORD *)(v8 + 24) = v9 + 1;
  v10 = v7 + 16 * v9;
  if (a2)
  {
    v11 = strlen(a2);
    LODWORD(a2) = crc32(0, (const Bytef *)a2, v11);
  }
  value = xpc_uint64_get_value(object);
  *(_DWORD *)v10 = (_DWORD)a2;
  *(_QWORD *)(v10 + 8) = value;
  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) == a1[8])
  {
    v13 = a1[4];
    ++*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
    result = (*(uint64_t (**)(void))(v13 + 16))();
    if (!(_DWORD)result)
      return result;
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
  }
  return 1;
}

BOOL sub_1000021F8(id a1, unint64_t a2, oslogdarwin_streamprefsvalue_s *a3, unint64_t a4)
{
  uint64_t v5;
  char v6;
  _BYTE v7[7];
  oslogdarwin_streamprefsvalue_s *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (a4)
  {
    v5 = 0x4E9FB3A19A8A7C1DLL;
    v6 = 3;
    memset(v7, 0, sizeof(v7));
    v8 = a3;
    v9 = a4;
    v10 = 0;
    v11 = 0;
    return sub_100001B80((unsigned __int8 *)&v5, a2 == 1);
  }
  else if (a2 == 1)
  {
    return sub_100002264();
  }
  else
  {
    return 1;
  }
}

uint64_t sub_100002264()
{
  _QWORD v1[2];
  uint64_t v2;
  char v3;
  _BYTE v4[7];
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1[0] = 0;
  v1[1] = 0;
  v2 = 0x4E9FB3A19A8A7C1DLL;
  v3 = 3;
  memset(v4, 0, sizeof(v4));
  v5 = v1;
  v6 = 0;
  v7 = 0;
  v8 = 0;
  return sub_100001B80((unsigned __int8 *)&v2, 1);
}

void sub_1000022BC(id a1)
{
  uint64_t *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  char v5[1032];

  if (&tb_client_connection_create)
  {
    v1 = (uint64_t *)_os_trace_calloc(1, 8);
    v4 = 0;
    if (exclaves_lookup_service(0, "com.apple.service.LogServer_xnuproxy", &v4))
    {
      strcpy(v5, "Exclaves log server not available");
    }
    else
    {
      v2 = (_QWORD *)_os_trace_calloc(1, 16);
      *v2 = 0;
      v2[1] = v4;
      if (tb_endpoint_create_with_data(8, v2, 0, &stru_10000C998))
      {
        v3 = tb_client_connection_create_with_endpoint();
        if (!tb_client_connection_activate())
        {
          *v1 = v3;
          qword_100010480 = (uint64_t)v1;
          return;
        }
      }
      free(v2);
      strcpy(v5, "Failed to initialize config admin client");
    }
    sub_100006394((uint64_t)v5);
    free(v1);
  }
}

void sub_1000023EC(id a1, void *a2)
{
  free(a2);
}

uint64_t sub_1000023F4()
{
  uint64_t result;

  if (&_lockdown_checkin_xpc)
  {
    lockdown_checkin_xpc("com.apple.syslog_relay", 0, 0, &stru_10000CA28);
    return lockdown_checkin_xpc("com.apple.os_trace_relay", 0, 0, &stru_10000CA68);
  }
  return result;
}

void sub_100002448(id a1, _lockdown_connection *a2, __CFDictionary *a3)
{
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  const void *TypeID;
  BOOL v13;
  CFTypeID v14;
  id v15;
  void *v16;
  CFArrayRef (__cdecl **v17)(CFAllocatorRef, const void **, CFIndex, const CFArrayCallBacks *);
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  StreamContext *v27;
  StreamContext *v28;
  void *v29;
  uint64_t v30;
  id v31;
  id v32;
  CFArrayRef (__cdecl **v33)(CFAllocatorRef, const void **, CFIndex, const CFArrayCallBacks *);
  uint64_t v34;
  NSMutableDictionary *v35;
  NSMutableDictionary *v36;
  int v37;
  pid_t v38;
  pid_t v39;
  uint64_t v40;
  int *v41;
  int v42;
  int v43;
  BOOL v44;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  uint64_t v53;
  id v54;
  id v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  id v63;
  id v64;
  void *v65;
  uint64_t v66;
  id v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  uint64_t socket;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  const __CFString *v80;
  int *v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  id v95;
  id v96;
  void *v97;
  uint64_t v98;
  id v99;
  id v100;
  void *v101;
  uint64_t v102;
  void *v103;
  _UNKNOWN **v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  int v116;
  char v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  const __CFString *v122;
  uint64_t v123;
  int v124;
  char v125;
  id v126;
  const char *v127;
  int v128;
  char v129;
  char v130;
  uint64_t v131;
  void *v132;
  NSMutableDictionary *v133;
  void *v134;
  size_t v135[2];
  const __CFString *v136;
  void *v137;
  __int128 cf;
  uint64_t (*v139)(uint64_t, uint64_t, uint64_t);
  void *v140;
  _QWORD *v141;
  uint64_t v142;
  void *v143;

  v5 = malloc_type_calloc(1uLL, 0x30uLL, 0x10B0040C4D40EDAuLL);
  *v5 = a2;
  v5[1] = sub_1000036D0(a3);
  v5[4] = sub_1000037A4;
  v5[5] = sub_100003FBC;
  v6 = objc_autoreleasePoolPush();
  *(_QWORD *)&cf = 0;
  v11 = lockdown_receive_message(*v5, &cf);
  TypeID = (const void *)cf;
  if (v11)
    v13 = 1;
  else
    v13 = (_QWORD)cf == 0;
  if (v13)
  {
    if (v11 < 2)
      goto LABEL_13;
    sub_100003FEC(cf, (uint64_t)"secure_receive_message", 127, CFSTR("lockdown_receive_message returned error %x"), v7, v8, v9, v10, v11);
LABEL_12:
    TypeID = (const void *)cf;
LABEL_13:
    if (TypeID)
      CFRelease(TypeID);
    goto LABEL_15;
  }
  v14 = CFGetTypeID((CFTypeRef)cf);
  TypeID = (const void *)CFDictionaryGetTypeID();
  if ((const void *)v14 != TypeID)
    goto LABEL_12;
  v15 = (id)cf;
  if (!(_QWORD)cf)
  {
LABEL_15:
    sub_100003FEC((uint64_t)TypeID, (uint64_t)"handle_os_trace_connection", 982, CFSTR("Failed to receive initial message from client %s"), v7, v8, v9, v10, v5[1]);
    sub_100004110((uint64_t)v5, (uint64_t)CFSTR("NoInitialMessage"));
    v15 = 0;
    v20 = 0;
    goto LABEL_16;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)cf, "objectForKeyedSubscript:", CFSTR("Request")));
  v17 = &CFArrayCreate_ptr;
  v18 = objc_opt_class(NSString);
  v19 = v16;
  if ((objc_opt_isKindOfClass(v19, v18) & 1) != 0)
    v20 = v19;
  else
    v20 = 0;

  if (v20)
  {
    if (objc_msgSend(v20, "isEqualToString:", CFSTR("StartActivity")))
    {
      v26 = v15;
      v27 = objc_opt_new(StreamContext);
      v15 = v26;
      v28 = v27;
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("MessageFilter")));
      v30 = objc_opt_class(NSNumber);
      v31 = v29;
      if ((objc_opt_isKindOfClass(v31, v30) & 1) != 0)
        v32 = v31;
      else
        v32 = 0;

      v51 = objc_msgSend(v32, "unsignedShortValue");
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("StreamFlags")));

      v53 = objc_opt_class(NSNumber);
      v54 = v52;
      if ((objc_opt_isKindOfClass(v54, v53) & 1) != 0)
        v55 = v54;
      else
        v55 = 0;

      v64 = objc_msgSend(v55, "unsignedIntValue");
      -[StreamContext setStreamFlags:](v28, "setStreamFlags:", v64);

      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("Pid")));
      v66 = objc_opt_class(NSNumber);
      v67 = v65;
      if ((objc_opt_isKindOfClass(v67, v66) & 1) != 0)
        v68 = v67;
      else
        v68 = 0;

      if (v68)
      {
        v74 = objc_msgSend(v68, "intValue");
        socket = lockdown_get_socket(*v5);
        if ((socket & 0x80000000) == 0)
        {
          sub_1000047F0((uint64_t)v5);
          sub_100006828((uint64_t)v74, v64 & 0x3F, v51, (uint64_t)v5);

          objc_autoreleasePoolPop(v6);
          goto LABEL_17;
        }
        sub_100003FEC(socket, (uint64_t)"set_up_activity", 700, CFSTR("Failed to get socket for connection from client %s"), v76, v77, v78, v79, v5[1]);
        v80 = CFSTR("NoSocket");
      }
      else
      {
        sub_100003FEC(v69, (uint64_t)"set_up_activity", 688, CFSTR("Missing pid in initial message from client %s: %@"), v70, v71, v72, v73, v5[1]);
        v80 = CFSTR("MalformedSetupMessage");
      }
      sub_100004110((uint64_t)v5, (uint64_t)v80);

      goto LABEL_96;
    }
    if (objc_msgSend(v20, "isEqualToString:", CFSTR("PidList")))
    {
      *(_QWORD *)&cf = 0x600000001;
      LODWORD(v137) = 0;
      v135[0] = 4;
      v33 = &CFArrayCreate_ptr;
      if (sysctl((int *)&cf, 2u, &v137, v135, 0, 0) < 0)
      {
        v81 = __error();
        v82 = strerror(*v81);
        sub_100003FEC((uint64_t)v82, (uint64_t)"get_max_proc", 281, CFSTR("Failed to get max proc count (%s)"), v83, v84, v85, v86, (char)v82);
        v36 = objc_opt_new(NSMutableDictionary);
      }
      else
      {
        v34 = v137;
        v35 = objc_opt_new(NSMutableDictionary);
        v36 = v35;
        if ((int)v34 >= 1)
        {
          v133 = v35;
          v132 = malloc_type_calloc(1uLL, 4 * v34, 0x744E5E87uLL);
          v37 = proc_listallpids(v132, 4 * v34);
          v38 = getpid();
          if (v37 >= 1)
          {
            v39 = v38;
            v40 = v37;
            v41 = (int *)v132;
            do
            {
              bzero(&cf, 0x400uLL);
              v43 = *v41++;
              v42 = v43;
              if (v43)
                v44 = v42 == v39;
              else
                v44 = 1;
              if (!v44)
              {
                proc_name(v42, &cf, 0x400u);
                if (((_QWORD)cf != 0x756563617274736FLL || *(_QWORD *)((char *)&cf + 3) != 0x6C69747565636172)
                  && ((_QWORD)cf != 0x74736F6E67616964 || *(_QWORD *)((char *)&cf + 3) != 0x64636974736F6E67)
                  && ((_QWORD)cf != 0x725F676F6C737973 || DWORD2(cf) != 2036427877))
                {
                  v129 = v42;
                  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17[19], "stringWithFormat:", CFSTR("%d")));
                  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17[19], "stringWithUTF8String:", &cf));
                  v136 = CFSTR("ProcessName");
                  v137 = v49;
                  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v137, &v136, 1));
                  -[NSMutableDictionary setObject:forKeyedSubscript:](v133, "setObject:forKeyedSubscript:", v50, v48);

                  v17 = &CFArrayCreate_ptr;
                }
              }
              --v40;
            }
            while (v40);
          }
          free(v132);
          v33 = &CFArrayCreate_ptr;
          v36 = v133;
        }
      }
      v135[0] = (size_t)CFSTR("Status");
      v135[1] = (size_t)CFSTR("Payload");
      *(_QWORD *)&cf = CFSTR("RequestSuccessful");
      *((_QWORD *)&cf + 1) = v36;
      v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33[14], "dictionaryWithObjects:forKeys:count:", &cf, v135, 2));
      v88 = sub_1000041CC(v5, v87);
      if ((v88 & 1) == 0)
        sub_100003FEC(v88, (uint64_t)"send_pid_list", 326, CFSTR("Failed to send PID list"), v89, v90, v91, v92, v129);

      goto LABEL_16;
    }
    v56 = objc_msgSend(v20, "isEqualToString:", CFSTR("CreateArchive"));
    if ((_DWORD)v56)
    {
      v15 = v15;
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("SizeLimit")));
      v62 = objc_opt_class(NSNumber);
      v63 = v61;
      if ((objc_opt_isKindOfClass(v63, v62) & 1) != 0)
        v28 = (StreamContext *)v63;
      else
        v28 = 0;

      v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("AgeLimit")));
      v94 = objc_opt_class(NSNumber);
      v95 = v93;
      if ((objc_opt_isKindOfClass(v95, v94) & 1) != 0)
        v96 = v95;
      else
        v96 = 0;

      v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("StartTime")));
      v98 = objc_opt_class(NSNumber);
      v99 = v97;
      if ((objc_opt_isKindOfClass(v99, v98) & 1) != 0)
        v100 = v99;
      else
        v100 = 0;

      sub_1000042A4(5, "CreateArchive request: max_size %llu, max_age %ld, start %ld", -[StreamContext unsignedLongLongValue](v28, "unsignedLongLongValue"), objc_msgSend(v96, "longValue"), objc_msgSend(v100, "longValue"));
      v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      if (-[StreamContext unsignedLongLongValue](v28, "unsignedLongLongValue"))
      {
        objc_msgSend(v101, "setObject:forKeyedSubscript:", v28, OSLogConstructPersistSizeLimit);
        objc_msgSend(v101, "setObject:forKeyedSubscript:", v28, OSLogConstructSpecialSizeLimit);
        objc_msgSend(v101, "setObject:forKeyedSubscript:", v28, OSLogConstructSignpostSizeLimit);
        objc_msgSend(v101, "setObject:forKeyedSubscript:", v28, OSLogConstructHighVolumeSizeLimit);
      }
      v134 = v100;
      if (objc_msgSend(v96, "longValue"))
      {
        objc_msgSend(v101, "setObject:forKeyedSubscript:", v96, OSLogConstructPersistAgeLimit);
        objc_msgSend(v101, "setObject:forKeyedSubscript:", v96, OSLogConstructSpecialAgeLimit);
        objc_msgSend(v101, "setObject:forKeyedSubscript:", v96, OSLogConstructSignpostAgeLimit);
        v102 = OSLogConstructHighVolumeAgeLimit;
        v103 = v101;
        v104 = (_UNKNOWN **)v96;
      }
      else if (objc_msgSend(v100, "longValue"))
      {
        objc_msgSend(v101, "setObject:forKeyedSubscript:", v100, _OSLogConstructPersistStart);
        objc_msgSend(v101, "setObject:forKeyedSubscript:", v100, _OSLogConstructSpecialStart);
        objc_msgSend(v101, "setObject:forKeyedSubscript:", v100, _OSLogConstructSignpostStart);
        v102 = _OSLogConstructHighVolumeStart;
        v103 = v101;
        v104 = (_UNKNOWN **)v100;
      }
      else
      {
        objc_msgSend(v101, "setObject:forKeyedSubscript:", &off_10000DA08, OSLogConstructPersistAgeLimit);
        objc_msgSend(v101, "setObject:forKeyedSubscript:", &off_10000DA08, OSLogConstructSpecialAgeLimit);
        objc_msgSend(v101, "setObject:forKeyedSubscript:", &off_10000DA08, OSLogConstructSignpostAgeLimit);
        v102 = OSLogConstructHighVolumeAgeLimit;
        v103 = v101;
        v104 = &off_10000DA08;
      }
      objc_msgSend(v103, "setObject:forKeyedSubscript:", v104, v102);
      v109 = malloc_type_malloc(0x8000uLL, 0xB91AE9FDuLL);
      if (!v109)
      {
        sub_100003FEC(0, (uint64_t)"create_archive", 838, CFSTR("malloc() failed"), v105, v106, v107, v108, v130);
        sub_100004110((uint64_t)v5, (uint64_t)CFSTR("SetupFailed"));
        v115 = 0;
LABEL_94:
        v126 = 0;
        v127 = "failed";
LABEL_95:
        sub_1000042A4(5, "CreateArchive request: %s", v127);
        archive_write_free(v115);
        free(v109);

LABEL_96:
        goto LABEL_16;
      }
      v110 = archive_write_new();
      v115 = v110;
      if (v110)
      {
        v116 = archive_write_set_format_pax(v110);
        if (v116)
        {
          v117 = v116;
          archive_error_string(v115);
          v131 = archive_errno(v115);
          sub_100003FEC(v131, (uint64_t)"create_archive", 853, CFSTR("archive_write_set_format_pax() returned %d: %s (%d)"), v118, v119, v120, v121, v117);
LABEL_93:
          sub_100004110((uint64_t)v5, (uint64_t)CFSTR("SetupFailed"));
          goto LABEL_94;
        }
        v124 = archive_write_open(v115, v5, 0, sub_100004324, 0);
        if (!v124)
        {
          *(_QWORD *)&cf = _NSConcreteStackBlock;
          *((_QWORD *)&cf + 1) = 3221225472;
          v139 = sub_1000044C0;
          v140 = &unk_10000CAC8;
          v141 = v5;
          v142 = v115;
          v143 = v109;
          v126 = objc_retainBlock(&cf);
          sub_1000047F0((uint64_t)v5);
          v128 = OSLogConstructArchive(v101, &stru_10000CAA8, v126);
          v127 = "failed";
          if (!v128)
            v127 = "complete";
          goto LABEL_95;
        }
        v125 = v124;
        archive_error_string(v115);
        v110 = archive_errno(v115);
        v130 = v125;
        v122 = CFSTR("archive_write_open() returned %d: %s (%d)");
        v123 = 861;
      }
      else
      {
        v122 = CFSTR("archive_write_new() failed");
        v123 = 845;
      }
      sub_100003FEC(v110, (uint64_t)"create_archive", v123, v122, v111, v112, v113, v114, v130);
      goto LABEL_93;
    }
    sub_100003FEC((uint64_t)v56, (uint64_t)"handle_os_trace_connection", 1004, CFSTR("Invalid initial message from client %s: %@"), v57, v58, v59, v60, v5[1]);
  }
  else
  {
    sub_100003FEC(v21, (uint64_t)"handle_os_trace_connection", 989, CFSTR("Invalid initial message from client %s: %@"), v22, v23, v24, v25, v5[1]);
  }
  sub_100004110((uint64_t)v5, (uint64_t)CFSTR("MalformedSetupMessage"));
LABEL_16:
  objc_autoreleasePoolPop(v6);
  lockdown_disconnect(*v5);
  free((void *)v5[1]);
  free(v5);
LABEL_17:

}

void sub_10000306C(id a1, _lockdown_connection *a2, __CFDictionary *a3)
{
  _QWORD *v5;
  FILE *v6;

  v5 = malloc_type_calloc(1uLL, 0x30uLL, 0x10B0040C4D40EDAuLL);
  *v5 = a2;
  v5[1] = sub_1000036D0(a3);
  v5[4] = sub_10000310C;
  v5[5] = sub_1000035E8;
  v6 = funopen(v5, 0, (int (__cdecl *)(void *, const char *, int))sub_100003620, 0, 0);
  v5[2] = v6;
  setlinebuf(v6);
  sub_100006828(0xFFFFFFFFLL, 140, 6, (uint64_t)v5);
}

BOOL sub_10000310C(uint64_t a1, uint64_t a2)
{
  FILE *v3;
  char *v4;
  char *v5;
  int v6;
  const char *v7;
  int type;
  const char *v9;
  char *v10;
  size_t v11;
  char *v12;
  int v13;
  unint64_t v14;
  uint64_t v15;
  __darwin_ct_rune_t v16;
  int pid[4];
  unsigned __int8 *uu2[2];
  char *__s[2];
  _OWORD v21[2];
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
  char v32[8];
  uint64_t v33;
  _QWORD v34[2];
  char __str[16];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  char v67[16];
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  char v83;
  _BYTE __dst[1024];

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  memset(v21, 0, sizeof(v21));
  *(_OWORD *)uu2 = 0u;
  *(_OWORD *)__s = 0u;
  *(_OWORD *)pid = 0u;
  if (_os_activity_stream_entry_decode(a2, pid))
    return *(_BYTE *)(a1 + 25) == 0;
  v3 = *(FILE **)(a1 + 16);
  v83 = 0;
  v82 = 0u;
  v81 = 0u;
  v80 = 0u;
  v79 = 0u;
  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  *(_OWORD *)v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  *(_OWORD *)__str = 0u;
  v36 = 0u;
  *(_QWORD *)v32 = 0;
  v33 = 0;
  *(_QWORD *)((char *)v34 + 6) = 0;
  v34[0] = 0;
  gethostname(v67, 0x100uLL);
  memcpy(__dst, "<unknown>", sizeof(__dst));
  v4 = (char *)*((_QWORD *)&v22 + 1);
  if ((_QWORD)v22
    && uu2[1]
    && !uuid_compare((const unsigned __int8 *__attribute__((__org_typedef(uuid_t))))v22, uu2[1]))
  {
    if (v4 || (v4 = __s[0]) != 0)
      strrchr(v4, 47);
    snprintf(__str, 0x200uLL, "%s");
  }
  else
  {
    if (__s[0] && v4)
    {
      v5 = __s[0];
LABEL_10:
      strrchr(v5, 47);
      strrchr(v4, 47);
      snprintf(__str, 0x200uLL, "%s(%s)");
      goto LABEL_11;
    }
    if (v4)
    {
      proc_name(pid[1], __dst, 0x400u);
      v5 = __dst;
      goto LABEL_10;
    }
    if (__s[0])
    {
      strrchr(__s[0], 47);
    }
    else
    {
      proc_name(pid[1], __dst, 0x400u);
      strrchr(__dst, 47);
    }
    snprintf(__str, 0x200uLL, "%s(<unknown>)");
  }
LABEL_11:
  if (pid[0] == 1024)
  {
    memset(__dst, 0, 56);
    localtime_r((const time_t *)&v23, (tm *)__dst);
    strftime(v32, 0x1EuLL, "%b %e %T", (const tm *)__dst);
    type = os_log_get_type((char *)v21 + 8);
    if (type <= 1)
    {
      if (!type)
      {
        v7 = "Notice";
        goto LABEL_46;
      }
      if (type == 1)
      {
        v7 = "Info";
        goto LABEL_46;
      }
    }
    else
    {
      switch(type)
      {
        case 2:
          v7 = "Debug";
          goto LABEL_46;
        case 16:
          v7 = "Error";
          goto LABEL_46;
        case 17:
          v7 = "Fault";
LABEL_46:
          v9 = (const char *)os_log_copy_formatted_message((char *)v21 + 8);
          goto LABEL_47;
      }
    }
    v7 = 0;
    goto LABEL_46;
  }
  if (pid[0] != 768)
    return *(_BYTE *)(a1 + 25) == 0;
  memset(__dst, 0, 56);
  localtime_r((const time_t *)&v23, (tm *)__dst);
  strftime(v32, 0x1EuLL, "%b %e %T", (const tm *)__dst);
  v6 = os_trace_get_type((char *)v21 + 8);
  if (v6 <= 3)
  {
    if (v6 == 1)
    {
      v7 = "Notice";
      goto LABEL_43;
    }
    if (v6 == 2)
    {
      v7 = "Debug";
      goto LABEL_43;
    }
LABEL_42:
    v7 = 0;
    goto LABEL_43;
  }
  if (v6 == 4)
  {
    v7 = "Info";
    goto LABEL_43;
  }
  if (v6 == 65)
  {
    v7 = "Error";
    goto LABEL_43;
  }
  if (v6 != 193)
    goto LABEL_42;
  v7 = "Fault";
LABEL_43:
  v9 = (const char *)os_trace_copy_formatted_message((char *)v21 + 8);
LABEL_47:
  v10 = (char *)v9;
  if (v9)
  {
    v11 = (4 * strlen(v9)) | 1;
    v12 = (char *)malloc_type_calloc(1uLL, v11, 0x116AD0FCuLL);
    v13 = strnvis(v12, v11, v10, 32);
    if (v13 >= 1)
    {
      v14 = v13 + 1;
      do
      {
        v15 = (v14 - 2);
        v16 = v12[v15];
        if (v16 < 0)
        {
          if (!__maskrune(v16, 0x4000uLL))
            break;
        }
        else if ((_DefaultRuneLocale.__runetype[v16] & 0x4000) == 0)
        {
          break;
        }
        v12[v15] = 0;
        --v14;
      }
      while (v14 > 1);
    }
    free(v10);
  }
  else
  {
    v12 = strdup("Failed to get message");
  }
  fprintf(v3, "%s %s %s[%d] <%s>: %s\n%c", v32, v67, __str, pid[1], v7, v12, 0);
  free(v12);
  return *(_BYTE *)(a1 + 25) == 0;
}

void sub_1000035E8(void *a1)
{
  lockdown_disconnect(*(_QWORD *)a1);
  fclose(*((FILE **)a1 + 2));
  free(*((void **)a1 + 1));
  free(a1);
}

uint64_t sub_100003620(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t result;

  if (*(_BYTE *)(a1 + 25))
    return 0xFFFFFFFFLL;
  result = lockdown_send(*(_QWORD *)a1, a2, a3);
  if (result != a3)
    *(_BYTE *)(a1 + 25) = 1;
  return result;
}

char *sub_1000036D0(const void *a1)
{
  CFTypeID v2;
  const __CFString *Value;
  const __CFString *v4;
  CFTypeID v5;
  char *result;
  char buffer[255];

  if (!a1)
    return strdup("<unknown>");
  v2 = CFGetTypeID(a1);
  if (v2 != CFDictionaryGetTypeID())
    return strdup("<unknown>");
  Value = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)a1, kLockdownCheckinClientNameKey);
  if (!Value)
    return strdup("<unknown>");
  v4 = Value;
  v5 = CFGetTypeID(Value);
  if (v5 != CFStringGetTypeID())
    return strdup("<unknown>");
  if (!CFStringGetCString(v4, buffer, 255, 0x8000100u))
    return strdup("<unknown>");
  result = strdup(buffer);
  if (!result)
    return strdup("<unknown>");
  return result;
}

BOOL sub_1000037A4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  size_t v9;
  size_t v10;
  char *v11;
  char *v12;
  char *v13;
  const char *v14;
  char *v15;
  size_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  size_t v21;
  size_t v22;
  size_t v23;
  const char *v24;
  size_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  size_t v30;
  void *v31;
  char *v32;
  char *v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  char *v51;
  size_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unsigned __int8 v58;
  char *v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  int v65;
  int v66;
  char *v67;
  char *v68;
  size_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  size_t v74;
  char *v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  size_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  size_t v87;
  size_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  size_t v93;
  uint64_t v94;
  char v95;
  int *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  _BOOL8 v101;
  char v103;
  char *v104;
  unsigned int v105;
  unsigned int v106;
  unsigned int v107;
  int v108;
  size_t __n;
  id v110;
  char *__src;
  __int128 v112;
  __int128 v113;
  char *__s[2];
  _OWORD v115[2];
  char *v116[2];
  __int128 v117;
  __int128 v118;
  __int128 v119;
  char *v120[2];
  __int128 v121;
  char *v122[2];
  char *v123[2];
  __int128 v124;
  __int128 v125;
  timeval v126;
  uint64_t v127;

  v3 = a2;
  v124 = 0u;
  v125 = 0u;
  *(_OWORD *)v122 = 0u;
  *(_OWORD *)v123 = 0u;
  *(_OWORD *)v120 = 0u;
  v121 = 0u;
  v118 = 0u;
  v119 = 0u;
  *(_OWORD *)v116 = 0u;
  v117 = 0u;
  memset(v115, 0, sizeof(v115));
  v113 = 0u;
  *(_OWORD *)__s = 0u;
  v112 = 0u;
  v4 = objc_autoreleasePoolPush();
  if (!_os_activity_stream_entry_decode(v3, &v112))
  {
    v126.tv_sec = 0;
    *(_QWORD *)&v126.tv_usec = 0;
    if (__s[0])
    {
      v9 = strlen(__s[0]);
      v10 = v9 + 1;
      if (v9 + 1 >= 0x10000)
      {
        sub_100003FEC(v9, (uint64_t)"serialize_and_send_stream_entry", 467, CFSTR("proc_imagepath length was longer than UINT16_MAX: %zu"), v5, v6, v7, v8, v9 + 1);
LABEL_26:
        v15 = 0;
        goto LABEL_27;
      }
    }
    else
    {
      v10 = 0;
    }
    v11 = v116[1];
    if (v116[1])
    {
      v11 = (char *)strlen(v116[1]);
      v12 = v11 + 1;
    }
    else
    {
      v12 = 0;
    }
    v13 = &v12[v10 + 129];
    if ((int)v112 <= 514)
    {
      if ((_DWORD)v112 != 513)
      {
        if ((_DWORD)v112 == 514)
        {
          v107 = 0;
          v108 = 0;
          LODWORD(v22) = 0;
          v105 = 0;
          v106 = 0;
          __n = 0;
          v110 = 0;
          __src = 0;
          goto LABEL_54;
        }
        goto LABEL_25;
      }
    }
    else if ((_DWORD)v112 != 515)
    {
      v11 = (char *)v115 + 8;
      if ((_DWORD)v112 != 768)
      {
        if ((_DWORD)v112 == 1024)
        {
          v14 = (const char *)os_log_copy_formatted_message((char *)v115 + 8);
          v15 = (char *)v14;
          if (v14)
          {
            v16 = strlen(v14);
            v21 = v16 + 1;
            if ((v16 + 1) >> 32)
            {
              sub_100003FEC(v16, (uint64_t)"serialize_and_send_stream_entry", 507, CFSTR("Message buffer was longer than UINT32_MAX: %zu"), v17, v18, v19, v20, v16 + 1);
LABEL_27:
              v31 = 0;
              v32 = 0;
LABEL_107:
              free(v32);
              free(v15);

              goto LABEL_108;
            }
          }
          else
          {
            v21 = 0;
          }
          v33 = &v13[v21];
          if (v122[1])
            v22 = strlen(v122[1]) + 1;
          else
            LODWORD(v22) = 0;
          v51 = &v33[v22];
          __src = v15;
          __n = v21;
          if (v123[0])
            v52 = strlen(v123[0]) + 1;
          else
            LODWORD(v52) = 0;
          v105 = 0;
          v106 = v22;
          v110 = 0;
          v107 = v52;
          v108 = v52;
          v13 = &v51[v52];
LABEL_54:
          v58 = objc_msgSend(0, "streamFlags");
          if ((v58 & 0x80) == 0)
            gettimeofday(&v126, 0);
          v59 = v13 + 5;
          v60 = (char *)malloc_type_calloc(1uLL, (size_t)(v13 + 5), 0xA7C4B6C3uLL);
          v32 = v60;
          v65 = 2;
          *v60 = 2;
          *(_DWORD *)(v60 + 1) = (_DWORD)v13;
          v60[5] = 2;
          if ((int)v112 <= 514)
          {
            if ((_DWORD)v112 == 513)
              goto LABEL_67;
            if ((_DWORD)v112 == 514)
            {
              v65 = 32;
              goto LABEL_67;
            }
          }
          else
          {
            switch((_DWORD)v112)
            {
              case 0x203:
                v65 = 16;
                goto LABEL_67;
              case 0x400:
                v65 = 8;
                goto LABEL_67;
              case 0x300:
                v65 = 4;
                goto LABEL_67;
            }
          }
          sub_100003FEC((uint64_t)v60, (uint64_t)"convert_stream_types", 400, CFSTR("Unknown os_activity_stream_type: %u"), v61, v62, v63, v64, v112);
          v65 = 0;
LABEL_67:
          v66 = v22;
          *(_DWORD *)(v32 + 6) = v65;
          *(_DWORD *)(v32 + 10) = 129;
          *(_DWORD *)(v32 + 14) = DWORD1(v112);
          *(_QWORD *)(v32 + 18) = *((_QWORD *)&v112 + 1);
          if (*((_QWORD *)&v113 + 1))
            *(_OWORD *)(v32 + 26) = **((_OWORD **)&v113 + 1);
          *((_WORD *)v32 + 21) = v10;
          *(char **)(v32 + 44) = __s[1];
          *(_QWORD *)(v32 + 52) = *(_QWORD *)&v115[0];
          if ((v58 & 0x80) == 0)
            *(timeval *)(v32 + 60) = v126;
          *(_DWORD *)(v32 + 130) = 0;
          memcpy(v32 + 134, __s[0], v10);
          *(_OWORD *)(v32 + 72) = *(_OWORD *)((char *)v115 + 8);
          v67 = v116[0];
          *((_QWORD *)v32 + 11) = *((_QWORD *)&v115[1] + 1);
          if (v67)
            *((_OWORD *)v32 + 6) = *(_OWORD *)v67;
          v68 = v116[1];
          if (v116[1])
          {
            v69 = strlen(v116[1]);
            v74 = v69 + 1;
            if (v69 + 1 >= 0x10000)
            {
              sub_100003FEC(v69, (uint64_t)"serialize_and_send_stream_entry", 583, CFSTR("Activity image path was longer than UINT16_MAX: %zu"), v70, v71, v72, v73, v69 + 1);
LABEL_76:
              v31 = v110;
              v15 = __src;
              goto LABEL_107;
            }
          }
          else
          {
            v74 = 0;
          }
          v75 = &v32[v10 + 134];
          *((_WORD *)v32 + 56) = v74;
          v76 = memcpy(v75, v68, v74);
          v81 = &v75[v74];
          if ((int)v112 <= 514)
          {
            if ((_DWORD)v112 == 513)
            {
              v31 = v110;
              v15 = __src;
              if (v120[0])
              {
                v88 = strlen(v120[0]);
                v93 = v88 + 1;
                if (v88 + 1 >= 0x10000)
                {
                  sub_100003FEC(v88, (uint64_t)"serialize_and_send_stream_entry", 595, CFSTR("Activity name length was longer than UINT16_MAX: %zu"), v89, v90, v91, v92, v88 + 1);
                  goto LABEL_107;
                }
              }
              else
              {
                v93 = 0;
              }
              *((_WORD *)v32 + 57) = v93;
              v76 = memcpy(v81, v120[0], v93);
              *(char **)(v32 + 116) = v120[1];
              *((_DWORD *)v32 + 31) = DWORD2(v118);
            }
            else
            {
              v31 = v110;
              v15 = __src;
              if ((_DWORD)v112 != 514)
                goto LABEL_85;
            }
          }
          else if ((_DWORD)v112 == 515)
          {
            if (v120[0])
            {
              v82 = strlen(v120[0]);
              v87 = v82 + 1;
              if (v82 + 1 >= 0x10000)
              {
                sub_100003FEC(v82, (uint64_t)"serialize_and_send_stream_entry", 644, CFSTR("Action length was longer than UINT16_MAX: %zu"), v83, v84, v85, v86, v82 + 1);
                goto LABEL_76;
              }
            }
            else
            {
              v87 = 0;
            }
            v31 = v110;
            v15 = __src;
            *((_WORD *)v32 + 57) = v87;
            v76 = memcpy(v81, v120[0], v87);
            *((_DWORD *)v32 + 29) = DWORD2(v118);
          }
          else
          {
            if ((_DWORD)v112 != 768)
            {
              v31 = v110;
              v15 = __src;
              if ((_DWORD)v112 == 1024)
              {
                *(_DWORD *)(v32 + 114) = __n;
                memcpy(v81, __src, __n);
                *(_DWORD *)(v32 + 118) = DWORD2(v118);
                *(_DWORD *)(v32 + 122) = v66;
                memcpy(&v81[__n], v122[1], v106);
                *(_DWORD *)(v32 + 126) = v108;
                v76 = memcpy(&v81[__n + v106], v123[0], v107);
                goto LABEL_100;
              }
LABEL_85:
              sub_100003FEC((uint64_t)v76, (uint64_t)"serialize_and_send_stream_entry", 659, CFSTR("Unknown stream entry type %u"), v77, v78, v79, v80, v112);
              goto LABEL_107;
            }
            *(_DWORD *)(v32 + 114) = __n;
            v15 = __src;
            v76 = memcpy(v81, __src, __n);
            v31 = v110;
            if (v110)
            {
              *(_DWORD *)(v32 + 118) = v105;
              v76 = memcpy(&v81[__n], objc_msgSend(objc_retainAutorelease(v110), "bytes"), v105);
            }
            *(_DWORD *)(v32 + 122) = DWORD2(v118);
          }
LABEL_100:
          if (a1)
          {
            if ((unint64_t)v59 >> 31)
            {
              sub_100003FEC((uint64_t)v76, (uint64_t)"secure_send_activity_stream_message", 147, CFSTR("Cannot send buffer > INT32_MAX: %zu"), v77, v78, v79, v80, (char)v59);
              goto LABEL_106;
            }
            v94 = lockdown_send(*(_QWORD *)a1, v32, v59);
            if ((char *)v94 == v59)
              goto LABEL_107;
            v95 = v94;
            v96 = __error();
            v104 = strerror(*v96);
            sub_100003FEC((uint64_t)v104, (uint64_t)"secure_send_activity_stream_message", 153, CFSTR("Failed to stream message; lockdown_send returned %zd, expected %zu: %s"),
              v97,
              v98,
              v99,
              v100,
              v95);
          }
          if (!v59)
            goto LABEL_107;
LABEL_106:
          sub_100003FEC((uint64_t)v76, (uint64_t)"serialize_and_send_stream_entry", 664, CFSTR("Failed to send buffer to client"), v77, v78, v79, v80, v103);
          *(_BYTE *)(a1 + 25) = 1;
          goto LABEL_107;
        }
LABEL_25:
        sub_100003FEC((uint64_t)v11, (uint64_t)"serialize_and_send_stream_entry", 523, CFSTR("Unknown os_activity_stream_type type %d"), v5, v6, v7, v8, v112);
        goto LABEL_26;
      }
      v24 = (const char *)os_trace_copy_formatted_message((char *)v115 + 8);
      v15 = (char *)v24;
      if (v24)
      {
        v25 = strlen(v24);
        v30 = v25 + 1;
        if ((v25 + 1) >> 32)
        {
          sub_100003FEC(v25, (uint64_t)"serialize_and_send_stream_entry", 484, CFSTR("Message buffer was longer than UINT32_MAX: %zu"), v26, v27, v28, v29, v25 + 1);
          goto LABEL_27;
        }
      }
      else
      {
        v30 = 0;
      }
      v13 += v30;
      __src = v15;
      __n = v30;
      if (!*((_QWORD *)&v121 + 1))
      {
LABEL_53:
        v107 = 0;
        v108 = 0;
        LODWORD(v22) = 0;
        v105 = 0;
        v106 = 0;
        v110 = 0;
        goto LABEL_54;
      }
      v34 = *((id *)&v121 + 1);
      if (!xpc_dictionary_get_count(v34))
      {

        goto LABEL_53;
      }
      v35 = (void *)_CFXPCCreateCFObjectFromXPCObject(v34);
      v40 = v35;
      if (v35)
      {
        if (objc_msgSend(v35, "count") != (id)1
          || (v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("__STRINGS"))),
              v41,
              !v41))
        {
          v42 = objc_msgSend(v40, "mutableCopy");
          objc_msgSend(v42, "removeObjectForKey:", CFSTR("__STRINGS"));
          v43 = v42;

          v127 = 0;
          v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v43, 200, 0, &v127));

          if (!v44)
            sub_100003FEC(v45, (uint64_t)"copy_payload_data", 438, CFSTR("Failed to serialize payload data: %@"), v46, v47, v48, v49, v127);
          v50 = v44;
          v40 = v43;
LABEL_50:

          if (v50)
          {
            v53 = (unint64_t)objc_msgSend(v50, "length");
            if (!HIDWORD(v53))
            {
              v110 = v50;
              v107 = 0;
              v108 = 0;
              LODWORD(v22) = 0;
              v105 = v53;
              v106 = 0;
              v13 += v53;
              goto LABEL_54;
            }
            sub_100003FEC(v53, (uint64_t)"serialize_and_send_stream_entry", 494, CFSTR("Message payload was too large to send at %ld bytes"), v54, v55, v56, v57, v53);

          }
          goto LABEL_53;
        }
      }
      else
      {
        sub_100003FEC(0, (uint64_t)"copy_payload_data", 421, CFSTR("Failed to create CFDictionary from XPC payload object"), v36, v37, v38, v39, v103);
      }
      v50 = 0;
      goto LABEL_50;
    }
    if (v120[0])
      v23 = strlen(v120[0]) + 1;
    else
      v23 = 0;
    v107 = 0;
    v108 = 0;
    LODWORD(v22) = 0;
    v105 = 0;
    v106 = 0;
    __n = 0;
    v110 = 0;
    __src = 0;
    v13 += v23;
    goto LABEL_54;
  }
LABEL_108:
  objc_autoreleasePoolPop(v4);
  v101 = *(_BYTE *)(a1 + 25) == 0;

  return v101;
}

void sub_100003FBC(void **a1)
{
  lockdown_disconnect(*a1);
  free(a1[1]);
  free(a1);
}

void sub_100003FEC(uint64_t a1, uint64_t a2, uint64_t a3, const __CFString *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  CFStringRef v12;
  const __CFString *v13;
  char buffer[1024];

  bzero(buffer, 0x400uLL);
  v12 = CFStringCreateWithFormatAndArguments(kCFAllocatorDefault, 0, a4, &a9);
  v13 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%s:%d %@"), a2, a3, v12);
  CFRelease(v12);
  if (v13)
  {
    CFStringGetCString(v13, buffer, 1024, 0x8000100u);
    sub_1000042A4(3, "%s", buffer);
    CFRelease(v13);
  }
  else
  {
    sub_1000042A4(3, "Failed to construct log string");
  }
}

void sub_100004110(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  const __CFString *v10;
  uint64_t v11;

  if (!*(_BYTE *)(a1 + 24))
  {
    v2 = (_QWORD *)a1;
    *(_BYTE *)(a1 + 24) = 1;
    v10 = CFSTR("Error");
    v11 = a2;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
    LOBYTE(v2) = sub_1000041CC(v2, v3);

    if ((v2 & 1) == 0)
      sub_100003FEC(v4, (uint64_t)"secure_send_error", 220, CFSTR("Could not send error response to host"), v5, v6, v7, v8, v9);
  }
}

uint64_t sub_1000041CC(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v18;
  char v19;

  v3 = a2;
  if (!a1)
  {
LABEL_7:
    v4 = 0;
    goto LABEL_8;
  }
  v4 = 1;
  if (!*((_BYTE *)a1 + 25))
  {
    v19 = 1;
    v5 = lockdown_send(*a1, &v19, 1);
    if (v5 == 1)
    {
      v6 = lockdown_send_message(*a1, v3, 200);
      if (!(_DWORD)v6)
      {
        v4 = 1;
        goto LABEL_8;
      }
      sub_100003FEC(v6, (uint64_t)"secure_send_message", 186, CFSTR("Got error %x from lockdown_send_message"), v7, v8, v9, v10, v6);
    }
    else
    {
      v11 = v5;
      v12 = __error();
      v18 = strerror(*v12);
      sub_100003FEC((uint64_t)v18, (uint64_t)"secure_send_message", 180, CFSTR("Failed to send message type; lockdown_send returned %zd, expected %zu: %s"),
        v13,
        v14,
        v15,
        v16,
        v11);
    }
    goto LABEL_7;
  }
LABEL_8:

  return v4;
}

uint64_t sub_1000042A4(uint64_t a1, char *__format, ...)
{
  char __str[2048];
  va_list va;

  va_start(va, __format);
  vsnprintf(__str, 0x800uLL, __format, va);
  return _simple_asl_log(a1, "com.apple.diagnosticd", __str);
}

uint64_t sub_100004324(uint64_t a1, _QWORD *a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v10;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  int *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  char *v31;
  char v32;
  int v33;

  if (*((_BYTE *)a2 + 25))
  {
    strerror(32);
    archive_set_error(a1, 32, "%s");
  }
  else if (a4 >> 31)
  {
    sub_100003FEC(a1, (uint64_t)"_archive_write", 758, CFSTR("Cannot send buffer > INT32_MAX: %zu"), a5, a6, a7, a8, a4);
    strerror(22);
    archive_set_error(a1, 22, "%s");
  }
  else
  {
    v32 = 3;
    v33 = a4;
    v14 = lockdown_send(*a2, &v32, 5);
    if (v14 == 5)
    {
      v10 = 0;
      if (!a4)
        return v10;
      while (1)
      {
        v15 = lockdown_send(*a2, a3, a4 - v10);
        v16 = v15;
        if (v15 < 0)
          break;
        v10 += v15;
        a3 += v15;
        if (v10 >= a4)
          return v10;
      }
      v24 = __error();
      v19 = *v24;
      v30 = strerror(*v24);
      sub_100003FEC((uint64_t)v30, (uint64_t)"_archive_write", 781, CFSTR("lockdown_send returned %zd: %s"), v25, v26, v27, v28, v16);
    }
    else
    {
      v17 = v14;
      v18 = __error();
      v19 = *v18;
      v31 = strerror(*v18);
      sub_100003FEC((uint64_t)v31, (uint64_t)"_archive_write", 771, CFSTR("lockdown_send returned %zd, expected %zu: %s"), v20, v21, v22, v23, v17);
    }
    v29 = strerror(v19);
    archive_set_error(a1, v19, "%s", v29);
    *((_BYTE *)a2 + 25) = 1;
  }
  return -1;
}

uint64_t sub_1000044C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t disk_new;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int *v31;
  ssize_t v32;
  char v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int *v45;
  int *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  stat v55;
  _BYTE v56[1024];

  memset(&v55, 0, sizeof(v55));
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 25))
  {
    if (fcntl(a2, 50) == -1 || fstat(a2, &v55) == -1)
    {
      v31 = __error();
      _os_assumes_log(*v31);
      return *__error();
    }
    disk_new = archive_read_disk_new();
    if (disk_new)
    {
      v12 = archive_entry_new();
      v17 = v12;
      if (v12)
      {
        archive_entry_copy_pathname(v12, a3);
        archive_entry_copy_sourcepath(v17, v56);
        v18 = archive_read_disk_entry_from_file(disk_new, v17, a2, &v55);
        v19 = *(_QWORD *)(a1 + 40);
        if (v18)
        {
          v3 = archive_errno(v19);
          archive_error_string(*(_QWORD *)(a1 + 40));
          v51 = archive_errno(*(_QWORD *)(a1 + 40));
          sub_100003FEC(v51, (uint64_t)"create_archive_block_invoke_2", 910, CFSTR("archive_read_disk_entry_from_file() returned %d: %s (%d)"), v20, v21, v22, v23, v18);
        }
        else
        {
          v24 = archive_write_header(v19, v17);
          if (v24)
          {
            v25 = v24;
            v3 = archive_errno(*(_QWORD *)(a1 + 40));
            archive_error_string(*(_QWORD *)(a1 + 40));
            v52 = archive_errno(*(_QWORD *)(a1 + 40));
            sub_100003FEC(v52, (uint64_t)"create_archive_block_invoke_2", 918, CFSTR("archive_write_header() returned %d: %s (%d)"), v26, v27, v28, v29, v25);
          }
          else
          {
            if ((v55.st_mode & 0xF000) == 0x4000)
              goto LABEL_22;
            while (1)
            {
              v32 = read(a2, *(void **)(a1 + 48), 0x8000uLL);
              v33 = v32;
              if (v32 < 1)
                break;
              v34 = archive_write_data(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v32);
              if (v34 < 0)
              {
                v3 = archive_errno(*(_QWORD *)(a1 + 40));
                archive_error_string(*(_QWORD *)(a1 + 40));
                v53 = archive_errno(*(_QWORD *)(a1 + 40));
                sub_100003FEC(v53, (uint64_t)"create_archive_block_invoke_2", 929, CFSTR("archive_write_data() returned %d: %s (%d)"), v35, v36, v37, v38, v34);
                goto LABEL_14;
              }
            }
            if (v32 < 0)
            {
              v3 = *__error();
              v45 = __error();
              strerror(*v45);
              v46 = __error();
              sub_100003FEC((uint64_t)v46, (uint64_t)"create_archive_block_invoke_2", 937, CFSTR("read() returned %zd: %s (%d)"), v47, v48, v49, v50, v33);
            }
            else
            {
LABEL_22:
              v39 = archive_write_finish_entry(*(_QWORD *)(a1 + 40));
              if (v39)
              {
                v40 = v39;
                v3 = archive_errno(*(_QWORD *)(a1 + 40));
                archive_error_string(*(_QWORD *)(a1 + 40));
                v54 = archive_errno(*(_QWORD *)(a1 + 40));
                sub_100003FEC(v54, (uint64_t)"create_archive_block_invoke_2", 946, CFSTR("archive_write_finish_entry() returned %d: %s (%d)"), v41, v42, v43, v44, v40);
              }
              else
              {
                v3 = 0;
              }
            }
          }
        }
        goto LABEL_14;
      }
      sub_100003FEC(0, (uint64_t)"create_archive_block_invoke_2", 900, CFSTR("archive_entry_new() failed"), v13, v14, v15, v16, (char)v56);
    }
    else
    {
      sub_100003FEC(0, (uint64_t)"create_archive_block_invoke_2", 893, CFSTR("archive_read_disk_new() failed"), v7, v8, v9, v10, (char)v56);
      v17 = 0;
    }
    v3 = 12;
LABEL_14:
    archive_read_free(disk_new);
    archive_entry_free(v17);
    return v3;
  }
  return 32;
}

void sub_1000047F0(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  const __CFString *v9;
  const __CFString *v10;

  if (!*(_BYTE *)(a1 + 24))
  {
    v1 = (_QWORD *)a1;
    v9 = CFSTR("Status");
    v10 = CFSTR("RequestSuccessful");
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
    LOBYTE(v1) = sub_1000041CC(v1, v2);

    if ((v1 & 1) == 0)
      sub_100003FEC(v3, (uint64_t)"secure_send_status", 205, CFSTR("Could not send error response to host"), v4, v5, v6, v7, v8);
  }
}

void sub_1000048AC(id a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_100003FEC((uint64_t)a1, (uint64_t)"create_archive_block_invoke", 867, CFSTR("%s"), v2, v3, v4, v5, (char)a2);
}

NSMutableDictionary *sub_1000048E4(void *a1, uint64_t a2)
{
  id v2;
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSMutableArray *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSMutableDictionary *v19;
  NSMutableDictionary *v20;
  uint64_t v21;
  CFArrayRef (__cdecl **v22)(CFAllocatorRef, const void **, CFIndex, const CFArrayCallBacks *);
  __CFString *v23;
  void *v24;
  uint64_t v25;
  NSMutableDictionary *v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  void *j;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  NSMutableDictionary *v38;
  NSMutableDictionary *v40;
  NSMutableDictionary *v41;
  id v42;
  void *v43;
  __CFString *v44;
  uint64_t v45;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];

  v2 = a1;
  v3 = objc_opt_new(NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("logicalExp")));
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("operator")));
    if (v6
      && ((v7 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v6, v7) & 1) == 0)
       || (unint64_t)objc_msgSend(v6, "unsignedIntegerValue") > 2))
    {
      v20 = 0;
    }
    else
    {
      v40 = v3;
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("subfilters")));
      if (v8 && (v9 = objc_opt_class(NSArray), (objc_opt_isKindOfClass(v8, v9) & 1) != 0))
      {
        v10 = objc_opt_new(NSMutableArray);
        v51 = 0u;
        v52 = 0u;
        v53 = 0u;
        v54 = 0u;
        v11 = v8;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v52;
          do
          {
            for (i = 0; i != v13; i = (char *)i + 1)
            {
              if (*(_QWORD *)v52 != v14)
                objc_enumerationMutation(v11);
              v16 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)i);
              if (v16)
              {
                v17 = objc_opt_class(NSDictionary);
                if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
                {
                  v18 = (void *)sub_1000048E4(v16, a2);
                  if (v18)
                    -[NSMutableArray addObject:](v10, "addObject:", v18);

                }
              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
          }
          while (v13);
        }

        if (-[NSMutableArray count](v10, "count"))
        {
          v19 = objc_opt_new(NSMutableDictionary);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v10, CFSTR("subfilters"));
          if (v6)
            -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v6, CFSTR("operator"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v40, "setObject:forKeyedSubscript:", v19, CFSTR("logicalExp"));
          v20 = v40;

        }
        else
        {
          v20 = 0;
        }

      }
      else
      {
        v20 = 0;
      }

      v3 = v40;
    }

  }
  else
  {
    v41 = v3;
    v21 = 0;
    v22 = &CFArrayCreate_ptr;
    v42 = v2;
    do
    {
      v23 = off_10000CAE8[v21];
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", v23));
      if (v24)
      {
        v25 = objc_opt_class(v22[14]);
        if ((objc_opt_isKindOfClass(v24, v25) & 1) != 0)
        {
          v44 = v23;
          v45 = v21;
          v26 = objc_opt_new(NSMutableDictionary);
          v47 = 0u;
          v48 = 0u;
          v49 = 0u;
          v50 = 0u;
          v43 = v24;
          v27 = v24;
          v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
          if (v28)
          {
            v29 = v28;
            v30 = *(_QWORD *)v48;
            do
            {
              for (j = 0; j != v29; j = (char *)j + 1)
              {
                if (*(_QWORD *)v48 != v30)
                  objc_enumerationMutation(v27);
                v32 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)j);
                if (v32)
                {
                  v33 = objc_opt_class(NSString);
                  if ((objc_opt_isKindOfClass(v32, v33) & 1) != 0)
                  {
                    v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", v32));
                    v35 = (void *)v34;
                    if (v34)
                    {
                      v36 = objc_opt_class(NSNumber);
                      if ((objc_opt_isKindOfClass(v35, v36) & 1) != 0)
                        v34 = (uint64_t)objc_msgSend(v35, "unsignedLongLongValue");
                      else
                        v34 = 0;
                    }
                    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v34 | a2));
                    -[NSMutableDictionary setObject:forKeyedSubscript:](v26, "setObject:forKeyedSubscript:", v37, v32);

                  }
                }
              }
              v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
            }
            while (v29);
          }

          v23 = v44;
          if (-[NSMutableDictionary count](v26, "count"))
            -[NSMutableDictionary setObject:forKeyedSubscript:](v41, "setObject:forKeyedSubscript:", v26, v44);

          v2 = v42;
          v24 = v43;
          v21 = v45;
          v22 = &CFArrayCreate_ptr;
        }
      }

      ++v21;
    }
    while (v21 != 6);
    v3 = v41;
    if (-[NSMutableDictionary count](v41, "count"))
      v38 = v41;
    else
      v38 = 0;
    v20 = v38;
    v5 = 0;
  }

  return v20;
}

uint64_t sub_100004D7C(void *a1, void *a2, uint64_t a3, uint64_t a4, int8x16_t *a5, uint64_t a6)
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  char v19;
  id v20;
  id v21;
  uint64_t v22;
  int8x16_t *v23;
  void *i;
  uint64_t v25;
  char v26;
  void *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  char v33;
  char v34;
  id obj;
  int8x16_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];

  v11 = a1;
  v12 = a2;
  v13 = objc_autoreleasePoolPush();
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("logicalExp")));
  if (!v14)
  {
    v19 = sub_100005084(v11, v12, a3, a4, a5, a6);
    goto LABEL_41;
  }
  v15 = v12;
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("subfilters")));
  if (!objc_msgSend(v32, "count"))
    goto LABEL_34;
  v29 = v12;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", CFSTR("operator")));
  v17 = v16;
  if (v16)
    v18 = (uint64_t)objc_msgSend(v16, "unsignedIntegerValue");
  else
    v18 = 2;
  v30 = v11;
  v31 = v14;
  v28 = v13;

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v32;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (!v20)
  {
    v33 = 0;
    v34 = 1;
    goto LABEL_31;
  }
  v21 = v20;
  v22 = *(_QWORD *)v38;
  if (a5)
    v23 = &v36;
  else
    v23 = 0;
  v33 = 0;
  v34 = 1;
  while (2)
  {
    for (i = 0; i != v21; i = (char *)i + 1)
    {
      if (*(_QWORD *)v38 != v22)
        objc_enumerationMutation(obj);
      v25 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
      v36 = 0uLL;
      v26 = sub_100004D7C(v25, v15, a3, a4, v23, a6);
      switch(v18)
      {
        case 1:
          if (a5)
          {
            v34 &= v26;
LABEL_23:
            *a5 = vorrq_s8(*a5, v36);
            continue;
          }
          if ((v26 & 1) != 0)
            continue;
          v19 = 0;
LABEL_39:
          v12 = v29;
          v11 = v30;
          v13 = v28;
          v14 = v31;

          goto LABEL_40;
        case 2:
          if (a5)
          {
            v33 |= v26;
            goto LABEL_23;
          }
          if ((v26 & 1) == 0)
            continue;
          v19 = 1;
          goto LABEL_39;
        case 0:
          if (a5)
            *a5 = vorrq_s8(*a5, vextq_s8(v36, v36, 8uLL));
          v19 = v26 ^ 1;
          goto LABEL_39;
      }
    }
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v21)
      continue;
    break;
  }
LABEL_31:

  v14 = v31;
  if (v18)
  {
    v12 = v29;
    v11 = v30;
    v13 = v28;
    v19 = v34;
    if (v18 != 1)
    {
      v19 = v33;
      if (v18 != 2)
LABEL_34:
        v19 = 0;
    }
  }
  else
  {
    v19 = 0;
    v12 = v29;
    v11 = v30;
    v13 = v28;
  }
LABEL_40:

LABEL_41:
  objc_autoreleasePoolPop(v13);

  return v19 & 1;
}

uint64_t sub_100005084(void *a1, void *a2, uint64_t a3, uint64_t a4, _QWORD *a5, int a6)
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  char v18;
  uint64_t v19;
  void *i;
  uint64_t v21;
  void *v22;
  unsigned int v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  void *j;
  uint64_t v36;
  void *v37;
  unsigned int v38;
  unint64_t v39;
  uint64_t v40;
  char *string;
  char *v42;
  char *v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  uint64_t v48;
  void *k;
  void *v50;
  void *v51;
  void *v52;
  unint64_t v53;
  _QWORD *v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  uint64_t v59;
  void *m;
  void *v61;
  void *v62;
  unint64_t v63;
  _QWORD *v64;
  char *v65;
  void *v66;
  id v67;
  id v68;
  id v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  unint64_t v74;
  _QWORD *v75;
  char *v76;
  void *v77;
  id v78;
  id v79;
  id v80;
  uint64_t v81;
  void *v82;
  void *v83;
  unint64_t v84;
  _QWORD *v85;
  void *v86;
  void *v88;
  void *v89;
  id v90;
  xpc_object_t xdict;
  xpc_object_t xdicta;
  void *v93;
  char *v94;
  void *v95;
  void *v96;
  void *v97;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  _BYTE v123[128];
  _BYTE v124[128];
  _BYTE v125[128];
  _BYTE v126[128];
  _BYTE v127[128];
  _BYTE v128[128];

  v10 = a1;
  v11 = a2;
  v90 = v10;
  xdict = v11;
  if ((_DWORD)a3 == -1)
  {
    LOBYTE(v26) = 0;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("pid")));
    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a3));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringValue"));

      if (a5)
      {
        v121 = 0u;
        v122 = 0u;
        v119 = 0u;
        v120 = 0u;
        v93 = v12;
        v15 = v12;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v119, v128, 16);
        if (v16)
        {
          v17 = v16;
          v18 = 0;
          v19 = *(_QWORD *)v120;
          do
          {
            for (i = 0; i != v17; i = (char *)i + 1)
            {
              if (*(_QWORD *)v120 != v19)
                objc_enumerationMutation(v15);
              v21 = *(_QWORD *)(*((_QWORD *)&v119 + 1) + 8 * (_QWORD)i);
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v21));
              v23 = objc_msgSend(v14, "isEqualToString:", v21);
              v24 = (unint64_t)objc_msgSend(v22, "unsignedLongLongValue");
              if (v23)
                v25 = 0;
              else
                v25 = 1;
              if (v23)
                v18 = 1;
              a5[v25] |= v24;

            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v119, v128, 16);
          }
          while (v17);
        }
        else
        {
          v18 = 0;
        }

        v11 = xdict;
        v12 = v93;
        a4 = a4;
      }
      else
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v14));

        if (v27)
        {

          v26 = 1;
          goto LABEL_114;
        }
        v18 = 0;
      }

      v10 = v90;
    }
    else
    {
      v18 = 0;
    }

    LOBYTE(v26) = v18 & 1;
  }
  if ((_DWORD)a4 != -1)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("uid")));
    if (v28)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a4));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "stringValue"));

      if (a5)
      {
        v117 = 0u;
        v118 = 0u;
        v115 = 0u;
        v116 = 0u;
        v96 = v28;
        v31 = v28;
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v115, v127, 16);
        if (v32)
        {
          v33 = v32;
          v34 = *(_QWORD *)v116;
          do
          {
            for (j = 0; j != v33; j = (char *)j + 1)
            {
              if (*(_QWORD *)v116 != v34)
                objc_enumerationMutation(v31);
              v36 = *(_QWORD *)(*((_QWORD *)&v115 + 1) + 8 * (_QWORD)j);
              v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", v36));
              v38 = objc_msgSend(v30, "isEqualToString:", v36);
              v39 = (unint64_t)objc_msgSend(v37, "unsignedLongLongValue");
              if (v38)
                v40 = 0;
              else
                v40 = 1;
              LOBYTE(v26) = v38 | v26;
              a5[v40] |= v39;

            }
            v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v115, v127, 16);
          }
          while (v33);
        }

        v10 = v90;
        v11 = xdict;
        v28 = v96;
      }
      else
      {
        v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", v30));

        if (v86)
        {

          v26 = 1;
          goto LABEL_114;
        }
      }

    }
  }
  string = (char *)xpc_dictionary_get_string(v11, "procpath");
  v42 = string;
  if (string)
    string = strrchr(string, 47);
  v94 = v42;
  if (string)
    v43 = string + 1;
  else
    v43 = v42;
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("process")));
  v89 = v44;
  if (v44)
  {
    v113 = 0u;
    v114 = 0u;
    v111 = 0u;
    v112 = 0u;
    v45 = v44;
    v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v111, v126, 16);
    if (!v46)
      goto LABEL_60;
    v47 = v46;
    v48 = *(_QWORD *)v112;
    while (1)
    {
      for (k = 0; k != v47; k = (char *)k + 1)
      {
        if (*(_QWORD *)v112 != v48)
          objc_enumerationMutation(v45);
        v50 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * (_QWORD)k);
        v51 = v45;
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectForKeyedSubscript:", v50));
        v53 = (unint64_t)objc_msgSend(v52, "unsignedLongLongValue");

        if (v43 && sub_100005968(v43, (char *)objc_msgSend(objc_retainAutorelease(v50), "UTF8String"), v53, a6))
        {
          v26 = 1;
          v54 = a5;
          if (!a5)
          {
            v10 = v90;
            v11 = xdict;
            goto LABEL_113;
          }
        }
        else
        {
          v54 = a5 + 1;
          if (!a5)
            goto LABEL_58;
        }
        *v54 |= v53;
LABEL_58:
        v45 = v51;
      }
      v47 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v111, v126, 16);
      if (!v47)
      {
LABEL_60:

        v10 = v90;
        break;
      }
    }
  }
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("processImagePath")));
  v51 = v55;
  v11 = xdict;
  v88 = v55;
  if (!v55)
    goto LABEL_76;
  v109 = 0u;
  v110 = 0u;
  v107 = 0u;
  v108 = 0u;
  v56 = v55;
  v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v107, v125, 16);
  if (!v57)
    goto LABEL_75;
  v58 = v57;
  v59 = *(_QWORD *)v108;
  v97 = v56;
  do
  {
    for (m = 0; m != v58; m = (char *)m + 1)
    {
      if (*(_QWORD *)v108 != v59)
        objc_enumerationMutation(v56);
      v61 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * (_QWORD)m);
      v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "objectForKeyedSubscript:", v61, v88, v89));
      v63 = (unint64_t)objc_msgSend(v62, "unsignedLongLongValue");

      if (v94 && sub_100005968(v94, (char *)objc_msgSend(objc_retainAutorelease(v61), "UTF8String"), v63, a6))
      {
        v26 = 1;
        v64 = a5;
        if (!a5)
        {
          v10 = v90;
          v51 = v88;
          goto LABEL_112;
        }
      }
      else
      {
        v64 = a5 + 1;
        if (!a5)
          goto LABEL_73;
      }
      *v64 |= v63;
LABEL_73:
      v56 = v97;
    }
    v58 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v107, v125, 16);
  }
  while (v58);
LABEL_75:

  v10 = v90;
  v51 = v88;
LABEL_76:
  v65 = (char *)xpc_dictionary_get_string(xdict, "subsystem");
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("subsystem")));
  v97 = v66;
  if (!v66)
    goto LABEL_91;
  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  v67 = v66;
  v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v103, v124, 16);
  if (!v68)
    goto LABEL_90;
  v69 = v68;
  v70 = *(_QWORD *)v104;
  v95 = v67;
  while (2)
  {
    v71 = 0;
    while (2)
    {
      if (*(_QWORD *)v104 != v70)
        objc_enumerationMutation(v67);
      v72 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * (_QWORD)v71);
      v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "objectForKeyedSubscript:", v72, v88));
      v74 = (unint64_t)objc_msgSend(v73, "unsignedLongLongValue");

      if (v65 && sub_100005968(v65, (char *)objc_msgSend(objc_retainAutorelease(v72), "UTF8String"), v74, a6))
      {
        v26 = 1;
        v75 = a5;
        if (!a5)
        {
          v10 = v90;
          v11 = xdict;
LABEL_110:
          v51 = v88;
          goto LABEL_111;
        }
LABEL_87:
        *v75 |= v74;
      }
      else
      {
        v75 = a5 + 1;
        if (a5)
          goto LABEL_87;
      }
      v71 = (char *)v71 + 1;
      v67 = v95;
      if (v69 != v71)
        continue;
      break;
    }
    v69 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v103, v124, 16);
    if (v69)
      continue;
    break;
  }
LABEL_90:

  v10 = v90;
  v11 = xdict;
  v51 = v88;
LABEL_91:
  v76 = (char *)xpc_dictionary_get_string(v11, "category");
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("category")));
  v95 = v77;
  if (!v77)
    goto LABEL_106;
  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  v78 = v77;
  v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v99, v123, 16);
  if (!v79)
    goto LABEL_105;
  v80 = v79;
  xdicta = *(xpc_object_t *)v100;
  while (2)
  {
    v81 = 0;
    while (2)
    {
      if (*(xpc_object_t *)v100 != xdicta)
        objc_enumerationMutation(v78);
      v82 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * v81);
      v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "objectForKeyedSubscript:", v82, v88));
      v84 = (unint64_t)objc_msgSend(v83, "unsignedLongLongValue");

      if (v76 && sub_100005968(v76, (char *)objc_msgSend(objc_retainAutorelease(v82), "UTF8String"), v84, a6))
      {
        if (!a5)
        {

          v26 = 1;
          v10 = v90;
          goto LABEL_110;
        }
        LOBYTE(v26) = 1;
        v85 = a5;
LABEL_102:
        *v85 |= v84;
      }
      else
      {
        v85 = a5 + 1;
        if (a5)
          goto LABEL_102;
      }
      if (v80 != (id)++v81)
        continue;
      break;
    }
    v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v99, v123, 16);
    if (v80)
      continue;
    break;
  }
LABEL_105:

  v10 = v90;
  v51 = v88;
LABEL_106:
  v26 = (a5 != 0) & v26;
LABEL_111:

LABEL_112:
LABEL_113:

LABEL_114:
  return v26;
}

BOOL sub_100005968(char *__s1, char *__s2, char a3, int a4)
{
  char *v4;
  char *v5;

  v4 = __s2;
  v5 = __s1;
  if (a4)
  {
    if (strcasestr(__s1, __s2))
      return 1;
    __s1 = v4;
    __s2 = v5;
  }
  else if ((a3 & 1) == 0)
  {
    return strcmp(__s1, __s2) == 0;
  }
  return strcasestr(__s1, __s2) != 0;
}

void sub_1000059D4(void *a1, uint64_t a2, int a3)
{
  id v5;
  __objc2_class_ro *v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSMutableDictionary *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  NSMutableDictionary *v27;
  NSMutableDictionary *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  __CFString *v32;
  void *v33;
  NSMutableDictionary *v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  void *i;
  uint64_t v40;
  void *v41;
  unint64_t v42;
  void *v43;
  unint64_t v44;
  void *v45;
  const char *v46;
  id v47;
  void *v48;
  __CFString *v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _QWORD v56[2];

  v5 = a1;
  v6 = &StreamContext__metaData;
  v7 = (void *)qword_100010490;
  if (!qword_100010490)
  {
    v8 = objc_opt_new(NSMutableDictionary);
    v9 = (void *)qword_100010490;
    qword_100010490 = (uint64_t)v8;

    v7 = (void *)qword_100010490;
    if (!qword_100010490)
    {
      v46 = (const char *)_os_assert_log();
      _os_crash(v46);
      __break(1u);
    }
  }
  v10 = (a3 << 16) | (unint64_t)(a2 << 32);
  if (v5)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("logicalExp")));
    if (v11)
    {
      v12 = sub_1000048E4(v5, v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("operator")));
      if (!v13 || (v14 = v13, v15 = objc_msgSend(v13, "unsignedIntegerValue"), v14, v15 == (id)2))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("subfilters")));
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("logicalExp")));
        v18 = v17;
        if (v17
          && ((v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKey:", CFSTR("operator")))) == 0
           || (v20 = v19, v21 = objc_msgSend(v19, "unsignedIntegerValue"), v20, v21 == (id)2)))
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("subfilters")));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "arrayByAddingObjectsFromArray:", v22));
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v23, CFSTR("subfilters"));

        }
        else
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "arrayByAddingObject:", v12));
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v22, CFSTR("subfilters"));
        }

        goto LABEL_20;
      }
LABEL_14:
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100010490, "objectForKeyedSubscript:", CFSTR("global")));
      objc_msgSend((id)qword_100010490, "setObject:forKeyedSubscript:", 0, CFSTR("global"));
      if (objc_msgSend((id)qword_100010490, "count"))
      {
        v27 = objc_opt_new(NSMutableDictionary);
        v28 = objc_opt_new(NSMutableDictionary);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v27, "setObject:forKeyedSubscript:", v28, CFSTR("logicalExp"));
        v56[0] = qword_100010490;
        v56[1] = v12;
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v56, 2));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v29, CFSTR("subfilters"));

        v30 = (void *)qword_100010490;
        qword_100010490 = (uint64_t)v27;

      }
      else
      {
        objc_storeStrong((id *)&qword_100010490, v12);
      }
      objc_msgSend((id)qword_100010490, "setObject:forKeyedSubscript:", v16, CFSTR("global"));
LABEL_20:

      goto LABEL_21;
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("logicalExp")));

    if (v26)
    {
      v12 = sub_1000048E4(v5, v10);
      goto LABEL_14;
    }
    v31 = 0;
    v47 = v5;
    do
    {
      v32 = off_10000CAE8[v31];
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v32));
      if (v33)
      {
        v50 = v31;
        v34 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6[16].ivar_lyt, "objectForKeyedSubscript:", v32));
        if (!v34)
        {
          v34 = objc_opt_new(NSMutableDictionary);
          objc_msgSend(v6[16].ivar_lyt, "setObject:forKeyedSubscript:", v34, v32);
        }
        v48 = v33;
        v49 = v32;
        v53 = 0u;
        v54 = 0u;
        v51 = 0u;
        v52 = 0u;
        v35 = v33;
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
        if (v36)
        {
          v37 = v36;
          v38 = *(_QWORD *)v52;
          do
          {
            for (i = 0; i != v37; i = (char *)i + 1)
            {
              if (*(_QWORD *)v52 != v38)
                objc_enumerationMutation(v35);
              v40 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)i);
              v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKeyedSubscript:", v40));
              v42 = (unint64_t)objc_msgSend(v41, "unsignedLongLongValue");

              v43 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v34, "objectForKeyedSubscript:", v40));
              v44 = (unint64_t)objc_msgSend(v43, "unsignedLongLongValue");

              v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v42 | v44 | v10));
              -[NSMutableDictionary setObject:forKeyedSubscript:](v34, "setObject:forKeyedSubscript:", v45, v40);

            }
            v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
          }
          while (v37);
        }

        v11 = 0;
        v5 = v47;
        v6 = &StreamContext__metaData;
        v32 = v49;
        v31 = v50;
        v33 = v48;
      }

      ++v31;
    }
    while (v31 != 6);
  }
  else
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("global")));
    v25 = (unint64_t)objc_msgSend(v24, "unsignedLongLongValue");

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v25 | v10));
    objc_msgSend((id)qword_100010490, "setObject:forKeyedSubscript:", v11, CFSTR("global"));
  }
LABEL_21:

}

void sub_100005ECC()
{
  id v0;
  id v1;
  const char *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  id v12;
  std::error_code *v13;
  int v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  unint64_t v19;
  int *v20;
  uint64_t v21;
  void *value;
  void *v23;
  int v24;
  uint64_t v25;
  int *v26;
  std::__fs::filesystem::path path[42];
  std::__fs::filesystem::path __str[42];

  v0 = (id)qword_100010490;
  if (qword_100010490)
  {
    v0 = objc_msgSend((id)qword_100010490, "count");
    if (v0)
    {
      v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100010490, "description")));
      v2 = (const char *)objc_msgSend(v1, "UTF8String");
      sub_100006300((uint64_t)v2, "Posting stream filter: \"%s\"", v2);

      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", qword_100010490, 200, 0, 0));
      v4 = (const char *)_os_trace_prefsdir_path(v3);
      v5 = snprintf((char *)__str, 0x400uLL, "%s/%s.plist", v4, "com.apple.diagnosticd.filter");
      v6 = (const char *)_os_trace_prefsdir_path(v5);
      v7 = snprintf((char *)path, 0x400uLL, "%s/%s.XXXXXXXX", v6, "com.apple.diagnosticd.filter");
      if (_os_trace_device_formatted_for_content_protection(v7))
        v8 = mkstemp_dprotected_np((char *)path, 4, 0);
      else
        v8 = mkstemp((char *)path);
      v11 = v8;
      if ((_DWORD)v8 != -1)
      {
        if (fchmod(v8, 0x1A4u) == -1
          || (v12 = objc_retainAutorelease(v3),
              _os_trace_write(v11, objc_msgSend(v12, "bytes"), objc_msgSend(v12, "length")) == -1)
          || fsync(v11) == -1)
        {
          v20 = __error();
          _os_assumes_log(*v20);
          if (close(v11) != -1)
          {
LABEL_38:
            unlink((const char *)path);
            unlink((const char *)__str);
            goto LABEL_39;
          }
          v19 = *__error();
          v21 = *__error();
          if ((_DWORD)v19 == 9)
          {
            qword_100010440 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
            qword_100010470 = v21;
            __break(1u);
            goto LABEL_29;
          }
LABEL_37:
          _os_assumes_log(v21);
          goto LABEL_38;
        }
        if (close(v11) == -1)
        {
          v24 = *__error();
          v25 = *__error();
          if (v24 == 9)
          {
            qword_100010440 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
            qword_100010470 = v25;
            __break(1u);
            return;
          }
          _os_assumes_log(v25);
          v26 = __error();
          _os_assumes_log(*v26);
        }
        rename(path, __str, v13);
        if (v14 != -1)
        {
          v15 = objc_retainAutorelease(v12);
          v16 = objc_msgSend(v15, "bytes");
          v17 = objc_msgSend(v15, "length");
          if (qword_100010488 != -1)
            dispatch_once(&qword_100010488, &stru_10000C958);
          if (!qword_100010480)
            goto LABEL_39;
          v18 = (void *)xpc_create_from_plist(v16, v17);
          if (!v18)
            goto LABEL_39;
          v19 = (unint64_t)v18;
          if (xpc_get_type(v18) != (xpc_type_t)&_xpc_type_dictionary)
            goto LABEL_25;
LABEL_29:
          value = xpc_dictionary_get_value((xpc_object_t)v19, "global");
          if (value)
          {
            v23 = value;
            if (xpc_get_type(value) != (xpc_type_t)&_xpc_type_uint64
              && xpc_get_type(v23) != (xpc_type_t)&_xpc_type_int64)
            {
LABEL_25:
              xpc_release((xpc_object_t)v19);
LABEL_39:
              notify_post("com.apple.system.logging.prefschanged");

              return;
            }
            value = (void *)xpc_uint64_get_value(v23);
          }
          if (sub_100001908((uint64_t)value))
          {
            if (sub_100001950((void *)v19, "category", (uint64_t)&stru_10000C8D8))
              sub_100001950((void *)v19, "subsystem", (uint64_t)&stru_10000C918);
          }
          goto LABEL_25;
        }
      }
      v21 = *__error();
      goto LABEL_37;
    }
  }
  v9 = sub_100006300((uint64_t)v0, "Posting empty stream filter");
  v10 = (const char *)_os_trace_prefsdir_path(v9);
  snprintf((char *)__str, 0x400uLL, "%s/%s.plist", v10, "com.apple.diagnosticd.filter");
  if (!unlink((const char *)__str))
    notify_post("com.apple.system.logging.prefschanged");
  if (qword_100010488 != -1)
    dispatch_once(&qword_100010488, &stru_10000C958);
  if (qword_100010480 && sub_100001908(0) && sub_100001B28())
    sub_100002264();
}

uint64_t sub_100006300(uint64_t a1, char *__format, ...)
{
  char __str[2048];
  va_list va;

  va_start(va, __format);
  vsnprintf(__str, 0x800uLL, __format, va);
  return _simple_asl_log(5, "com.apple.diagnosticd", __str);
}

uint64_t sub_10000637C(uint64_t a1)
{
  sub_100006394(a1);
  return 1;
}

void sub_100006394(uint64_t a1)
{
  _QWORD block[5];

  if (qword_100010498 != -1)
    dispatch_once_f(&qword_100010498, 0, (dispatch_function_t)sub_100006434);
  if (!dispatch_get_specific(off_100010290))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = sub_1000065A8;
    block[3] = &unk_10000CB18;
    block[4] = a1;
    dispatch_sync((dispatch_queue_t)qword_1000104A0, block);
  }
}

int *sub_100006434()
{
  int *result;
  uint64_t v1;
  uint64_t v2;

  asprintf((char **)&qword_1000104A8, "com.apple.%s.log", "diagnosticd");
  if (!qword_1000104A8)
  {
    v1 = *__error();
    qword_100010440 = (uint64_t)"BUG IN LIBTRACE: failed to create queue target from subsystem";
    qword_100010470 = v1;
    __break(1u);
LABEL_10:
    result = __error();
    v2 = *result;
    qword_100010440 = (uint64_t)"BUG IN LIBTRACE: failed to create log file path";
    qword_100010470 = v2;
    __break(1u);
    return result;
  }
  qword_1000104A0 = (uint64_t)dispatch_queue_create_with_target_V2((const char *)qword_1000104A8, 0, 0);
  dispatch_queue_set_specific((dispatch_queue_t)qword_1000104A0, off_100010290, (void *)qword_1000104A0, 0);
  if (qword_100010648 != -1)
    dispatch_once(&qword_100010648, &stru_10000D090);
  asprintf((char **)&qword_1000104B0, "%s/%s.0.log", (const char *)qword_100010638, "diagnosticd");
  if (qword_100010648 != -1)
    dispatch_once(&qword_100010648, &stru_10000D090);
  result = (int *)asprintf((char **)&qword_1000104B8, "%s/%s.1.log", (const char *)qword_100010638, "diagnosticd");
  if (!qword_1000104B0 || !qword_1000104B8)
    goto LABEL_10;
  return result;
}

uint64_t sub_1000065A8(uint64_t a1)
{
  const char *v1;
  const char *v2;
  pid_t v3;
  uint64_t result;
  time_t v5;
  tm v6;
  char v7[26];
  char __str[1024];

  v1 = *(const char **)(a1 + 32);
  dispatch_assert_queue_V2((dispatch_queue_t)qword_1000104A0);
  memset(&v6, 0, sizeof(v6));
  v5 = time(0);
  localtime_r(&v5, &v6);
  strftime(v7, 0x1AuLL, "%F %T%z", &v6);
  v2 = getprogname();
  v3 = getpid();
  result = snprintf(__str, 0x400uLL, "%s %s[%d]: %s\n", v7, v2, v3, v1);
  if ((int)result >= 1)
  {
    if (result >= 0x400)
      __str[1022] = 10;
    dispatch_assert_queue_V2((dispatch_queue_t)qword_1000104A0);
    sub_1000066C8();
    result = dword_100010298;
    if ((dword_100010298 & 0x80000000) == 0)
    {
      _os_trace_write();
      return sub_100006710();
    }
  }
  return result;
}

void sub_1000066C8()
{
  dispatch_assert_queue_V2((dispatch_queue_t)qword_1000104A0);
  if (dword_100010298 < 0)
  {
    sub_1000067D4();
    if ((dword_100010298 & 0x80000000) == 0)
      sub_100006710();
  }
}

uint64_t sub_100006710()
{
  off_t v0;
  uint64_t result;
  std::error_code *v2;
  int v3;

  dispatch_assert_queue_V2((dispatch_queue_t)qword_1000104A0);
  v0 = lseek(dword_100010298, 0, 2);
  result = fsync(dword_100010298);
  if (v0 >= 0x100000)
  {
    if (close(dword_100010298) != -1)
    {
LABEL_3:
      rename((const std::__fs::filesystem::path *)qword_1000104B0, (const std::__fs::filesystem::path *)qword_1000104B8, v2);
      return sub_1000067D4();
    }
    v3 = *__error();
    result = *__error();
    if (v3 != 9)
    {
      _os_assumes_log(result);
      goto LABEL_3;
    }
    qword_100010440 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_100010470 = result;
    __break(1u);
  }
  return result;
}

uint64_t sub_1000067D4()
{
  uint64_t result;

  result = open((const char *)qword_1000104B0, 778, 420);
  dword_100010298 = result;
  if ((result & 0x80000000) == 0)
    return fchown(result, 0x110u, 0x110u);
  return result;
}

void sub_100006828(uint64_t a1, int a2, int a3, uint64_t a4)
{
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  _QWORD v16[5];
  void *v17;
  _UNKNOWN **v18;
  const __CFString *v19;
  void *v20;

  v8 = _os_trace_calloc(1, 104);
  *(_DWORD *)(v8 + 80) = 2;
  *(_DWORD *)(v8 + 16) = a2;
  *(_DWORD *)(v8 + 20) = a3;
  *(_DWORD *)(v8 + 56) = getpid();
  *(_QWORD *)(v8 + 96) = a4;
  if ((_DWORD)a1 != -1)
  {
    v19 = CFSTR("pid");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a1));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringValue"));
    v17 = v10;
    v18 = &off_10000DA20;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
    v20 = v11;
    v12 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));

    *(_QWORD *)(v8 + 64) = v12;
  }
  v13 = *(_DWORD *)(v8 + 16);
  if ((v13 & 0x100) != 0)
    v14 = 9;
  else
    v14 = 8;
  if ((v13 & 0x20) != 0)
    v15 = 11;
  else
    v15 = v14;
  *(_QWORD *)(v8 + 72) = os_transaction_create("com.apple.diagnosticd.relay-stream");
  sub_1000069F0(v8, v15);
  if (qword_100010628 != -1)
    dispatch_once(&qword_100010628, &stru_10000CF58);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 0x40000000;
  v16[2] = sub_100006AD4;
  v16[3] = &unk_10000CB78;
  v16[4] = v8;
  dispatch_barrier_sync((dispatch_queue_t)qword_100010630, v16);
}

void sub_1000069F0(uint64_t a1, int a2)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  _QWORD block[5];

  v4 = _os_trace_calloc(1, 96);
  *(_QWORD *)(v4 + 16) = a1;
  *(_DWORD *)(v4 + 24) = a2;
  v5 = *(_DWORD *)(a1 + 56);
  *(_DWORD *)(v4 + 28) = v5;
  v6 = *(_QWORD *)(a1 + 96);
  if (v6)
    strlcpy((char *)(v4 + 32), *(const char **)(v6 + 8), 0x40uLL);
  else
    proc_name(v5, (void *)(v4 + 32), 0x40u);
  if (qword_1000104D8 != -1)
    dispatch_once(&qword_1000104D8, &stru_10000CC78);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_100006B2C;
  block[3] = &unk_10000CC38;
  block[4] = v4;
  dispatch_sync((dispatch_queue_t)qword_1000104E0, block);
}

uint64_t sub_100006AD4(uint64_t result)
{
  **(_QWORD **)(result + 32) = 0;
  *(_QWORD *)(*(_QWORD *)(result + 32) + 8) = off_1000102A8;
  *off_1000102A8 = *(_UNKNOWN **)(result + 32);
  off_1000102A8 = *(_UNKNOWN ***)(result + 32);
  return result;
}

void sub_100006B04(id a1)
{
  qword_100010630 = (uint64_t)dispatch_queue_create("com.apple.diagnosticd.stream", 0);
}

void sub_100006B2C(uint64_t a1)
{
  id v2;
  const char *v3;
  char *v4;
  char __str[1024];

  sub_1000059D4(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 64), *(unsigned int *)(*(_QWORD *)(a1 + 32) + 24), *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 20));
  sub_100005ECC();
  **(_QWORD **)(a1 + 32) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = off_1000102B8;
  *off_1000102B8 = *(_UNKNOWN **)(a1 + 32);
  off_1000102B8 = *(_UNKNOWN ***)(a1 + 32);
  sub_100006C84();
  sub_100006CAC();
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 64), "description")));
  v3 = (const char *)objc_msgSend(v2, "UTF8String");
  if (!v3)
    v3 = "<empty>";
  v4 = (char *)_os_trace_strdup(v3);

  sub_1000042A4(5, "System mode client started - %s (%d) - mode: 0x%x, filter: \"%s\"", (const char *)(*(_QWORD *)(a1 + 32) + 32), *(_DWORD *)(*(_QWORD *)(a1 + 32) + 28), *(_DWORD *)(*(_QWORD *)(a1 + 32) + 24), v4);
  snprintf(__str, 0x400uLL, "System mode client started - %s (%d) - mode: 0x%x, filter: \"%s\"", (const char *)(*(_QWORD *)(a1 + 32) + 32), *(_DWORD *)(*(_QWORD *)(a1 + 32) + 28), *(_DWORD *)(*(_QWORD *)(a1 + 32) + 24), v4);
  sub_100006394((uint64_t)__str);
  free(v4);
}

uint64_t sub_100006C84()
{
  uint64_t result;

  result = _os_trace_set_diagnostic_flags();
  if ((_DWORD)result)
    errx(74, "Unable to set global diagnostic flag");
  return result;
}

uint64_t sub_100006CAC()
{
  void *v0;
  void *v1;
  xpc_object_t empty;
  unsigned __int8 v3;
  int v4;
  char *v5;
  int v6;
  unsigned int v7;
  uint64_t kernel_cache_uuid;
  uint64_t v9;
  CFArrayRef v10;
  CFArrayRef v11;
  const __CFDictionary *v12;
  const __CFDictionary *v13;
  NSObject *v14;
  uint64_t v16;
  _QWORD v17[5];
  unsigned int v18;
  _QWORD handler[4];
  unsigned int v20;
  int8x16_t v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;

  if (qword_1000104D8 != -1)
    dispatch_once(&qword_1000104D8, &stru_10000CC78);
  dispatch_assert_queue_V2((dispatch_queue_t)qword_1000104E0);
  if (qword_100010490 && objc_msgSend((id)qword_100010490, "count"))
  {
    v0 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100010490, "objectForKeyedSubscript:", CFSTR("global")));
    v1 = v0;
    if (v0 && (objc_msgSend(v0, "unsignedLongLongValue") & 0x40000) != 0)
    {

      v4 = 1;
    }
    else
    {

      empty = xpc_dictionary_create_empty();
      xpc_dictionary_set_string(empty, "procpath", "kernel");
      v21 = 0uLL;
      v3 = sub_100004D7C((void *)qword_100010490, empty, 0, 0, &v21, 1);
      v4 = v3 & ((v21.i64[0] & 0x40000) != 0);

    }
  }
  else
  {
    v4 = 0;
  }
  if (qword_1000105C8 != -1)
    dispatch_once(&qword_1000105C8, &stru_10000CCB8);
  if (!v4)
  {
    if (qword_1000105B8)
    {
      dispatch_source_cancel((dispatch_source_t)qword_1000105B8);
      qword_1000105B8 = 0;
      v5 = "Stopped kernel streaming";
    }
    else
    {
      v5 = "Kernel streaming already stopped";
    }
    goto LABEL_27;
  }
  if (qword_1000105B8)
  {
    v5 = "Kernel streaming is already enabled";
LABEL_27:
    v16 = 7;
    return sub_1000042A4(v16, v5);
  }
  v6 = open("/dev/oslog_stream", 4, 0);
  if (v6 < 0)
  {
    v5 = "failed to open kernel stream";
    v16 = 3;
    return sub_1000042A4(v16, v5);
  }
  v7 = v6;
  v26 = 0;
  v24 = 0;
  v25 = 0u;
  v21 = 0u;
  v22 = 0;
  v23 = xmmword_1000105D0;
  kernel_cache_uuid = _os_trace_kic_mode();
  if ((_DWORD)kernel_cache_uuid)
    kernel_cache_uuid = _os_trace_uuiddb_make_kernel_cache_uuid(&v24, &xmmword_1000105D0);
  if ((_os_trace_is_kernel_64_bit(kernel_cache_uuid) & 1) == 0)
    v21.i16[1] |= 1u;
  v9 = _catalog_create();
  qword_1000103C8 = v9;
  qword_1000103D8 = _catalog_procinfo_create();
  _catalog_subchunk_procinfo_add(v9, qword_1000103D8);
  v10 = CFArrayCreate(kCFAllocatorDefault, (const void **)off_100010410, 4, &kCFTypeArrayCallBacks);
  if (v10)
  {
    v11 = v10;
    v12 = (const __CFDictionary *)OSKextCopyLoadedKextInfo(0, v10);
    if (v12)
    {
      v13 = v12;
      CFDictionaryApplyFunction(v12, (CFDictionaryApplierFunction)sub_10000707C, &unk_1000103A0);
      CFRelease(v13);
    }
    CFRelease(v11);
  }
  v14 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, v7, 0, (dispatch_queue_t)qword_1000105C0);
  qword_1000105B8 = (uint64_t)v14;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 0x40000000;
  handler[2] = sub_10000718C;
  handler[3] = &unk_10000CCD8;
  v20 = v7;
  dispatch_source_set_event_handler(v14, handler);
  dispatch_set_context(v14, &unk_1000103A0);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 0x40000000;
  v17[2] = sub_1000075F4;
  v17[3] = &unk_10000CCF8;
  v18 = v7;
  v17[4] = v14;
  dispatch_source_set_cancel_handler(v14, v17);
  dispatch_activate(v14);
  return sub_1000042A4(7, "Started kernel streaming");
}

uint64_t sub_10000707C(int a1, CFDictionaryRef theDict, uint64_t a3)
{
  const __CFNumber *Value;
  const __CFData *v6;
  uint64_t result;
  const __CFNumber *v8;
  const unsigned __int8 *BytePtr;
  uint64_t valuePtr;
  _OWORD v11[2];

  Value = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("OSBundleExecLoadAddress"));
  v6 = (const __CFData *)CFDictionaryGetValue(theDict, CFSTR("OSBundleTextUUID"));
  result = (uint64_t)CFDictionaryGetValue(theDict, CFSTR("OSBundleExecLoadSize"));
  if (Value)
  {
    if (v6)
    {
      v8 = (const __CFNumber *)result;
      if (result)
      {
        valuePtr = 0;
        result = CFNumberGetValue(Value, kCFNumberSInt64Type, &valuePtr);
        if ((_DWORD)result)
        {
          memset(v11, 0, sizeof(v11));
          DWORD2(v11[0]) = valuePtr;
          WORD6(v11[0]) = WORD2(valuePtr);
          BytePtr = CFDataGetBytePtr(v6);
          uuid_copy((unsigned __int8 *)((unint64_t)v11 | 0xE), BytePtr);
          CFNumberGetValue(v8, kCFNumberSInt64Type, v11);
          return _catalog_procinfo_uuidinfo_add(*(_QWORD *)(a3 + 40), *(_QWORD *)(a3 + 56), v11);
        }
      }
    }
  }
  return result;
}

void sub_10000718C(uint64_t a1)
{
  unint64_t v2;
  int v3;
  ssize_t v4;
  int *v5;
  ssize_t v6;
  xpc_object_t v7;
  xpc_object_t v8;
  xpc_type_t type;
  const char *string;
  void *v11;
  int int64;
  time_t v13;
  uint64_t v14;
  _QWORD block[5];
  _OWORD v16[4];
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
  time_t v28[128];
  tm v29;
  time_t v30;

  mach_timebase_info((mach_timebase_info_t)&unk_1000104E8);
  v13 = 0;
  v14 = 0;
  mach_get_times(&unk_1000104F0, &unk_100010518, &v13);
  qword_1000104F8 = v13;
  dword_100010500 = (int)v14 / 1000;
  v28[0] = v13;
  memset(&v29, 0, sizeof(v29));
  localtime_r(v28, &v29);
  v2 = ((unsigned __int128)(v29.tm_gmtoff * (__int128)0x7777777777777777) >> 64) - v29.tm_gmtoff;
  dword_1000103B0 = (v2 >> 5) + (v2 >> 63) + 60 * v29.tm_isdst;
  *(_DWORD *)algn_1000103B4 = v29.tm_isdst;
  v3 = *(_DWORD *)(a1 + 32);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v17 = 0u;
  memset(v16, 0, sizeof(v16));
  v4 = read(v3, &v29, 0x1000uLL);
  if (v4 <= 31)
  {
    v5 = __error();
    strerror(*v5);
    sub_1000042A4(3, "Error reading from kernel channel %s");
    return;
  }
  v6 = v4;
  *(_QWORD *)&v17 = *(_QWORD *)&v29.tm_sec;
  _catalog_update_earliest_fhbuf_ts(qword_1000103C8);
  if ((char *)&v29 + v6 < (char *)&v29.tm_isdst + HIWORD(*(_QWORD *)&v29.tm_wday))
  {
    snprintf((char *)v28, 0x400uLL, "Invalid kernel tracepoint size (%d) for read length (%zd)", HIWORD(*(_QWORD *)&v29.tm_wday), v6);
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = sub_100007678;
    block[3] = &unk_10000CD18;
    block[4] = v28;
    if (qword_1000105E0 != -1)
      dispatch_once(&qword_1000105E0, block);
    sub_1000042A4(3, "%s");
    return;
  }
  if (*(_QWORD *)&v29.tm_hour == -1)
  {
    sub_1000042A4(7, "Received dropped message count from the kernel: %u");
    return;
  }
  if (LOBYTE(v29.tm_hour) != 5)
  {
    if (!_chunk_support_convert_tracepoint(&v29.tm_hour, v16, &unk_1000103A0))
      return;
    v11 = (void *)_os_activity_stream_entry_encode(v16);
    if (!v11)
      return;
    v8 = v11;
    xpc_dictionary_set_uint64(v11, "action", 6uLL);
    sub_100007694(0, (uint64_t)v8);
    goto LABEL_27;
  }
  if ((v29.tm_hour & 0xFF00) == 0x300)
  {
    memset(&v28[1], 0, 24);
    if (v29.tm_mday == 2)
    {
      _catalog_procinfo_uuidinfo_remove(qword_1000103C8, qword_1000103D8, v29.tm_zone);
      return;
    }
    if (v29.tm_mday == 1)
    {
      LODWORD(v28[1]) = v29.tm_zone;
      WORD2(v28[1]) = WORD2(v29.tm_zone);
      v28[0] = v30;
      uuid_copy((unsigned __int8 *)&v28[1] + 6, (const unsigned __int8 *)&v29.tm_isdst);
      _catalog_procinfo_uuidinfo_add(qword_1000103C8, qword_1000103D8, v28);
      if (qword_1000105F0 != -1)
        dispatch_once(&qword_1000105F0, &stru_10000CD58);
      if (qword_1000105E8)
      {
        xpc_connection_set_event_handler((xpc_connection_t)qword_1000105E8, &stru_10000CD98);
        xpc_connection_activate((xpc_connection_t)qword_1000105E8);
        v7 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_uint64(v7, "operation", 9uLL);
        xpc_dictionary_set_uuid(v7, "uuid", (const unsigned __int8 *)&v29.tm_isdst);
        v8 = xpc_connection_send_message_with_reply_sync((xpc_connection_t)qword_1000105E8, v7);
        xpc_release(v7);
        type = xpc_get_type(v8);
        if (type != (xpc_type_t)&_xpc_type_dictionary)
        {
          if (type != (xpc_type_t)&_xpc_type_error)
          {
            qword_100010440 = (uint64_t)"BUG IN LIBTRACE: Unexpected xpc object";
            qword_100010470 = (uint64_t)type;
            __break(1u);
            return;
          }
          string = xpc_dictionary_get_string(v8, _xpc_error_key_description);
          goto LABEL_26;
        }
        int64 = xpc_dictionary_get_int64(v8, "st");
        if (int64)
        {
          string = strerror(int64);
LABEL_26:
          sub_1000042A4(3, "error harvesting kernel uuid text: %s", string);
        }
LABEL_27:
        xpc_release(v8);
      }
    }
  }
}

void sub_1000075F4(uint64_t a1)
{
  int v2;
  uint64_t v3;

  _catalog_destroy(qword_1000103C8);
  if (close(*(_DWORD *)(a1 + 40)) != -1)
    goto LABEL_2;
  v2 = *__error();
  v3 = *__error();
  if (v2 != 9)
  {
    _os_assumes_log(v3);
LABEL_2:
    dispatch_release(*(dispatch_object_t *)(a1 + 32));
    return;
  }
  qword_100010440 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_100010470 = v3;
  __break(1u);
}

uint64_t sub_100007678(uint64_t a1)
{
  return os_fault_with_payload(18, 2, 0, 0, *(_QWORD *)(a1 + 32), 0);
}

void sub_100007694(uint64_t a1, uint64_t a2)
{
  _QWORD v4[6];

  if (qword_1000105F8 != -1)
    dispatch_once(&qword_1000105F8, &stru_10000CDD8);
  if (qword_100010628 != -1)
    dispatch_once(&qword_100010628, &stru_10000CF58);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 0x40000000;
  v4[2] = sub_10000774C;
  v4[3] = &unk_10000CE78;
  v4[4] = a1;
  v4[5] = a2;
  dispatch_sync((dispatch_queue_t)qword_100010630, v4);
}

void sub_10000774C(uint64_t a1)
{
  char *v1;
  int v3;
  void *v4;
  _xpc_connection_s *v5;
  const char *string;
  __int16 uint64;
  int v8;
  void *v9;
  uint64_t pid;
  uint64_t euid;
  unsigned int *v12;
  int v13;
  uint64_t v14;
  unsigned int v15;
  _xpc_connection_s *v16;
  _xpc_connection_s *v17;
  xpc_object_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  unsigned int v22;
  uint64_t v23;
  const char *v24;
  _QWORD v25[6];
  BOOL v26;
  _QWORD barrier[5];

  v1 = (char *)off_1000102A0;
  if (off_1000102A0)
  {
    while (1)
    {
      v3 = *((_DWORD *)v1 + 20);
      switch(v3)
      {
        case 1:
          if (!*((_QWORD *)v1 + 11))
            goto LABEL_47;
          break;
        case 2:
          if (!*((_QWORD *)v1 + 12))
            goto LABEL_47;
          break;
        case 0:
          v24 = (const char *)_os_assert_log(0);
          _os_crash(v24);
          __break(1u);
          return;
      }
      v5 = *(_xpc_connection_s **)(a1 + 32);
      v4 = *(void **)(a1 + 40);
      if (*((_QWORD *)v1 + 3))
      {
        string = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 40), "SIMULATOR_UDID");
        if (!string || strcmp(string, *((const char **)v1 + 3)))
          goto LABEL_47;
      }
      uint64 = xpc_dictionary_get_uint64(v4, "traceid");
      v8 = *((_DWORD *)v1 + 5);
      if (!v8)
        break;
      if ((v8 & 1) != 0 && uint64 == 2 || (v8 & 8) != 0 && uint64 == 6)
      {
LABEL_28:
        v9 = (void *)*((_QWORD *)v1 + 8);
        if (!v9
          || (!v5
            ? (void *)(pid = 0, euid = 0)
            : (pid = xpc_connection_get_pid(v5), euid = xpc_connection_get_euid(v5), v9 = (void *)*((_QWORD *)v1 + 8)),
              sub_100004D7C(v9, v4, pid, euid, 0, 0)))
        {
          if (*((_DWORD *)v1 + 13) >= dword_100010430)
          {
            ++*((_QWORD *)v1 + 5);
            if (!v1[48] && *((_DWORD *)v1 + 20) == 1)
            {
              v17 = (_xpc_connection_s *)*((_QWORD *)v1 + 11);
              v18 = xpc_dictionary_create(0, 0, 0);
              xpc_dictionary_set_uint64(v18, "action", 0xCuLL);
              xpc_connection_send_message(v17, v18);
              xpc_release(v18);
              v1[48] = 1;
            }
          }
          else
          {
            v12 = (unsigned int *)(v1 + 52);
            v1[48] = 0;
            v13 = *((_DWORD *)v1 + 20);
            if (v13 == 2)
            {
              v19 = *((_QWORD *)v1 + 4) + 1;
              *((_QWORD *)v1 + 4) = v19;
              v20 = v19 & 0x7F;
              v21 = v20 == 0;
              if (!v20)
              {
                do
                  v22 = __ldxr(v12);
                while (__stxr(v22 + 1, v12));
              }
              xpc_retain(*(xpc_object_t *)(a1 + 40));
              if (qword_100010618 != -1)
                dispatch_once(&qword_100010618, &stru_10000CEB8);
              v25[0] = _NSConcreteStackBlock;
              v25[1] = 0x40000000;
              v25[2] = sub_100007AB4;
              v25[3] = &unk_10000CE58;
              v23 = *(_QWORD *)(a1 + 40);
              v25[4] = v1;
              v25[5] = v23;
              v26 = v21;
              dispatch_async((dispatch_queue_t)qword_100010620, v25);
            }
            else if (v13 == 1)
            {
              xpc_connection_send_message(*((xpc_connection_t *)v1 + 11), *(xpc_object_t *)(a1 + 40));
              v14 = *((_QWORD *)v1 + 4) + 1;
              *((_QWORD *)v1 + 4) = v14;
              if ((v14 & 0x7F) == 0)
              {
                do
                  v15 = __ldxr(v12);
                while (__stxr(v15 + 1, v12));
                v16 = (_xpc_connection_s *)*((_QWORD *)v1 + 11);
                barrier[0] = _NSConcreteStackBlock;
                barrier[1] = 0x40000000;
                barrier[2] = sub_100007A98;
                barrier[3] = &unk_10000CE38;
                barrier[4] = v1;
                xpc_connection_send_barrier(v16, barrier);
              }
            }
          }
        }
        goto LABEL_47;
      }
      if ((v8 & 4) != 0 && uint64 == 4 || (v8 & 2) != 0 && uint64 == 3)
        goto LABEL_23;
LABEL_47:
      v1 = *(char **)v1;
      if (!v1)
        return;
    }
    if (uint64 - 3 > 1)
      goto LABEL_28;
LABEL_23:
    if (HIBYTE(uint64) == 2)
    {
      if ((v1[16] & 0x20) != 0)
        goto LABEL_28;
    }
    else if (HIBYTE(uint64) != 1 || (*((_WORD *)v1 + 8) & 0x120) != 0)
    {
      goto LABEL_28;
    }
    goto LABEL_47;
  }
}

uint64_t sub_100007A98(uint64_t result)
{
  unsigned int *v1;
  unsigned int v2;

  v1 = (unsigned int *)(*(_QWORD *)(result + 32) + 52);
  do
    v2 = __ldxr(v1);
  while (__stxr(v2 - 1, v1));
  return result;
}

void sub_100007AB4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unsigned int *v4;
  unsigned int v5;
  _QWORD v6[5];
  _QWORD block[5];

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
  if (!*(_BYTE *)(v2 + 25)
    && ((*(uint64_t (**)(uint64_t, _QWORD))(v2 + 32))(v2, *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (qword_100010628 != -1)
      dispatch_once(&qword_100010628, &stru_10000CF58);
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = sub_100007BF4;
    block[3] = &unk_10000CED8;
    block[4] = v3;
    dispatch_sync((dispatch_queue_t)qword_100010630, block);
    if (qword_100010618 != -1)
      dispatch_once(&qword_100010618, &stru_10000CEB8);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 0x40000000;
    v6[2] = sub_100007C24;
    v6[3] = &unk_10000CEF8;
    v6[4] = v3;
    dispatch_async((dispatch_queue_t)qword_100010620, v6);
  }
  xpc_release(*(xpc_object_t *)(a1 + 40));
  if (*(_BYTE *)(a1 + 48))
  {
    v4 = (unsigned int *)(*(_QWORD *)(a1 + 32) + 52);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 - 1, v4));
  }
}

uint64_t sub_100007BF4(uint64_t result)
{
  uint64_t *v1;
  uint64_t v2;

  v1 = *(uint64_t **)(result + 32);
  v2 = *v1;
  if (*v1)
  {
    *(_QWORD *)(v2 + 8) = v1[1];
    v1 = *(uint64_t **)(result + 32);
    v2 = *v1;
  }
  else
  {
    off_1000102A8 = (_UNKNOWN **)v1[1];
  }
  *(_QWORD *)v1[1] = v2;
  return result;
}

uint64_t sub_100007C24(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 96);
  sub_100007CA0(v2);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(v4 + 40);
  if (v5)
  {
    sub_1000042A4(5, "Stream client PID: %d - Dropped %llu of %llu messages because streaming client could not keep up with the datastream.", *(_DWORD *)(v4 + 56), v5, *(_QWORD *)(v4 + 32) + v5);
    v4 = *(_QWORD *)(a1 + 32);
  }
  os_release(*(void **)(v4 + 72));
  sub_100007D2C(*(void ***)(a1 + 32));
  return (*(uint64_t (**)(uint64_t))(v3 + 40))(v3);
}

void sub_100007CA0(uint64_t a1)
{
  _QWORD block[5];

  if (qword_1000104D8 != -1)
    dispatch_once(&qword_1000104D8, &stru_10000CC78);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_100007D5C;
  block[3] = &unk_10000CF18;
  block[4] = a1;
  dispatch_sync((dispatch_queue_t)qword_1000104E0, block);
}

void sub_100007D2C(void **a1)
{
  free(a1[3]);

  free(a1);
}

uint64_t sub_100007D5C(uint64_t a1)
{
  void **v1;
  void **v2;
  int v3;
  int v4;
  int v5;
  void *v6;
  _UNKNOWN **v7;
  void *v8;
  _QWORD *v9;
  const char *v11;
  char __str[1024];

  v1 = (void **)off_1000102B0;
  if (!off_1000102B0)
    goto LABEL_17;
  v2 = 0;
  v3 = 0;
  do
  {
    if (*(void **)(a1 + 32) == v1[2])
      v2 = v1;
    else
      v3 |= *((_DWORD *)v1 + 6);
    v1 = (void **)*v1;
  }
  while (v1);
  if (!v2)
  {
LABEL_17:
    v11 = (const char *)_os_assert_log(0);
    _os_crash(v11);
    __break(1u);
  }
  v4 = *((_DWORD *)v2 + 6);
  v5 = v4 & ~(dword_1000104D0 | v3);
  if (v5)
  {
    sub_1000042A4(5, "System mode client stopped - %s (%d) - clearing mode: 0x%x, still active: 0x%x", (const char *)v2 + 32, *((_DWORD *)v2 + 7), v4 & ~(dword_1000104D0 | v3), v3);
    snprintf(__str, 0x400uLL, "System mode client stopped - %s (%d) - clearing mode: 0x%x, still active: 0x%x", (const char *)v2 + 32, *((_DWORD *)v2 + 7), v5, v3);
    sub_100006394((uint64_t)__str);
    sub_100006C84();
  }
  else
  {
    sub_1000042A4(5, "System mode client stopped - %s (%d) - clearing mode: 0x0, still active: 0x%x", (const char *)v2 + 32, *((_DWORD *)v2 + 7), v3);
    snprintf(__str, 0x400uLL, "System mode client stopped - %s (%d) - clearing mode: 0x0, still active: 0x%x", (const char *)v2 + 32, *((_DWORD *)v2 + 7), v3);
    sub_100006394((uint64_t)__str);
  }
  v6 = *v2;
  if (*v2)
    v7 = (_UNKNOWN **)*v2;
  else
    v7 = &off_1000102B0;
  v7[1] = v2[1];
  *(_QWORD *)v2[1] = v6;
  free(v2);
  v8 = (void *)qword_100010490;
  qword_100010490 = 0;

  v9 = off_1000102B0;
  if (off_1000102B0)
  {
    do
    {
      sub_1000059D4(*(void **)(v9[2] + 64), *((unsigned int *)v9 + 6), *(_DWORD *)(v9[2] + 20));
      v9 = (_QWORD *)*v9;
    }
    while (v9);
  }
  sub_100005ECC();
  return sub_100006CAC();
}

void sub_100007F20(id a1)
{
  qword_100010620 = (uint64_t)dispatch_queue_create("com.apple.diagnosticd.relay", 0);
}

void sub_100007F48(id a1)
{
  mach_timebase_info(&stru_100010600);
  qword_100010608 = (uint64_t)dispatch_queue_create("com.apple.diagnosticd.memory-pressure", 0);
  qword_100010610 = (uint64_t)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_memorypressure, 0, 7uLL, (dispatch_queue_t)qword_100010608);
  dispatch_source_set_event_handler((dispatch_source_t)qword_100010610, &stru_10000CE18);
}

void sub_100007FA4(id a1)
{
  uintptr_t data;
  int v2;

  data = dispatch_source_get_data((dispatch_source_t)qword_100010610);
  _os_trace_log_simple("Memory pressure 0x%lx", data);
  switch(data)
  {
    case 1uLL:
      v2 = 16;
      break;
    case 4uLL:
      v2 = 4;
      break;
    case 2uLL:
      v2 = 8;
      break;
    default:
      return;
  }
  dword_100010430 = v2;
}

void sub_10000801C(id a1)
{
  qword_1000105E8 = (uint64_t)xpc_connection_create_mach_service("com.apple.logd.admin", 0, 2uLL);
}

void sub_100008048(id a1)
{
  NSObject *v1;
  int *v2;
  char *v3;
  size_t v4;
  char in[16];
  _BYTE v6[21];

  *(_OWORD *)in = 0u;
  memset(v6, 0, sizeof(v6));
  v4 = 37;
  if (!sysctlbyname("kern.uuid", in, &v4, 0, 0))
  {
    v1 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    qword_1000105C0 = (uint64_t)dispatch_queue_create("com.apple.diagnosticd.klog", v1);
    uuid_parse(in, (unsigned __int8 *)&xmmword_1000105D0);
    if (qword_100010648 != -1)
      dispatch_once(&qword_100010648, &stru_10000D090);
    dword_1000103A4 = open((const char *)qword_100010640, 0x100000);
    if (dword_1000103A4 == -1)
    {
      v2 = __error();
      v3 = strerror(*v2);
      sub_1000042A4(3, "Error opening uuiddb: %s", v3);
    }
  }
}

void sub_100008160(id a1)
{
  qword_1000104E0 = (uint64_t)dispatch_queue_create("com.apple.diagnosticd.mode_clients", 0);
}

void start()
{
  void *v0;
  _xpc_connection_s *mach_service;
  char __str[1024];

  if (qword_100010498 != -1)
    dispatch_once_f(&qword_100010498, 0, (dispatch_function_t)sub_100006434);
  dispatch_sync((dispatch_queue_t)qword_1000104A0, &stru_10000CB58);
  if ((MEMORY[0xFFFFFC104] & 8) != 0)
  {
    sub_1000042A4(5, "Startup - clearing mode: 0x%x", 8);
    snprintf(__str, 0x400uLL, "Startup - clearing mode: 0x%x", 8);
    sub_100006394((uint64_t)__str);
    sub_100006C84();
  }
  v0 = (void *)qword_100010490;
  qword_100010490 = 0;

  sub_100005ECC();
  dword_1000104D0 = MEMORY[0xFFFFFC104];
  os_trace_set_mode(256);
  sub_1000042A4(6, "diagnosticd starting");
  strcpy(__str, "diagnosticd starting");
  sub_100006394((uint64_t)__str);
  qword_1000104C0 = (uint64_t)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, 0);
  dispatch_source_set_event_handler((dispatch_source_t)qword_1000104C0, &stru_10000CBB8);
  dispatch_activate((dispatch_object_t)qword_1000104C0);
  mach_service = xpc_connection_create_mach_service("com.apple.diagnosticd", 0, 1uLL);
  qword_1000104C8 = (uint64_t)mach_service;
  if (!mach_service)
    errx(70, "failed to create mach service com.apple.diagnosticd");
  xpc_connection_set_event_handler(mach_service, &stru_10000CBF8);
  xpc_connection_activate((xpc_connection_t)qword_1000104C8);
  sub_1000023F4();
  dispatch_main();
}

void sub_100008304(id a1, void *a2)
{
  void *v3;
  char *v4;
  pid_t pid;
  _QWORD handler[5];

  v3 = (void *)voucher_adopt(0);
  os_release(v3);
  if (xpc_get_type(a2) == (xpc_type_t)&_xpc_type_connection)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 0x40000000;
    handler[2] = sub_1000083E0;
    handler[3] = &unk_10000CC18;
    handler[4] = a2;
    xpc_connection_set_event_handler((xpc_connection_t)a2, handler);
    pid = xpc_connection_get_pid((xpc_connection_t)a2);
    sub_1000042A4(6, "New connection from peer %d", pid);
    xpc_connection_activate((xpc_connection_t)a2);
  }
  else
  {
    v4 = xpc_copy_description(a2);
    sub_1000042A4(3, "Strange connection with %s", v4);
    free(v4);
  }
}

void sub_1000083E0(uint64_t a1, xpc_object_t object)
{
  _xpc_connection_s *v4;
  uint64_t uint64;
  uint64_t v6;
  const char *string;
  uint64_t pid;
  const void *data;
  NSMutableDictionary *v10;
  id v11;
  void *v12;
  uint64_t v13;
  NSMutableDictionary *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  int v25;
  int v26;
  int v27;
  xpc_object_t reply;
  void *v29;
  xpc_object_t v30;
  void *v31;
  _QWORD block[5];
  char __str[8];
  size_t v34[127];
  char buffer[72];

  if (xpc_get_type(object) != (xpc_type_t)&_xpc_type_dictionary)
    return;
  v4 = *(_xpc_connection_s **)(a1 + 32);
  uint64 = xpc_dictionary_get_uint64(object, "action");
  if (uint64 - 1 < 2)
    return;
  v6 = uint64;
  if (uint64 == 6)
  {
    v21 = (void *)voucher_adopt(0);
    os_release(v21);
    sub_100007694((uint64_t)v4, (uint64_t)object);
    return;
  }
  if (uint64 != 3)
  {
    v22 = xpc_copy_description(object);
    sub_1000042A4(3, "Unimplemented action %lld [%s]", v6, v22);
    free(v22);
    return;
  }
  string = xpc_dictionary_get_string(object, "simulator_device");
  pid = xpc_connection_get_pid(v4);
  memset(buffer, 0, 64);
  proc_name(pid, buffer, 0x40u);
  *(_QWORD *)__str = 0;
  v34[0] = 0;
  data = xpc_dictionary_get_data(object, "stream_filter", v34);
  v10 = 0;
  if (!data || !v34[0])
    goto LABEL_19;
  v11 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", data, v34[0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v11, 0, 0, 0));
  v13 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v12, v13) & 1) == 0)
  {

    v10 = 0;
LABEL_17:

    goto LABEL_19;
  }
  v14 = sub_1000048E4(v12, 0);

  if (!v14)
  {
    v10 = 0;
    goto LABEL_19;
  }
  v10 = v14;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", CFSTR("pid")));
  v15 = -[NSMutableDictionary count](v10, "count");

  if (v15 != (id)1 || objc_msgSend(v11, "count") != (id)1)
    goto LABEL_17;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", pid));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringValue"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v17));

  if (v18)
  {
    v19 = pid;
    v20 = "allowing peer %s (%d) to see itself";
    sub_1000042A4(5, "allowing peer %s (%d) to see itself");
LABEL_24:
    snprintf(__str, 0x400uLL, v20, buffer, v19);
    sub_100006394((uint64_t)__str);
    v23 = _os_trace_calloc(1, 104);
    *(_DWORD *)(v23 + 80) = 1;
    *(_DWORD *)(v23 + 16) = xpc_dictionary_get_uint64(object, "flags");
    *(_QWORD *)(v23 + 88) = v4;
    *(_QWORD *)(v23 + 64) = v10;
    *(_DWORD *)(v23 + 20) = xpc_dictionary_get_uint64(object, "types");
    *(_DWORD *)(v23 + 56) = xpc_connection_get_pid(v4);
    if (string)
      v24 = strdup(string);
    else
      v24 = 0;
    *(_QWORD *)(v23 + 24) = v24;
    v25 = *(_DWORD *)(v23 + 16);
    if ((v25 & 0x100) != 0)
      v26 = 9;
    else
      v26 = 8;
    if ((v25 & 0x20) != 0)
      v27 = 11;
    else
      v27 = v26;
    xpc_connection_set_context(v4, (void *)v23);
    xpc_connection_set_finalizer_f(v4, (xpc_finalizer_t)sub_100007D2C);
    xpc_retain(v4);
    *(_QWORD *)__str = _NSConcreteStackBlock;
    v34[0] = 0x40000000;
    v34[1] = (size_t)sub_100008A38;
    v34[2] = (size_t)&unk_10000CF98;
    v34[3] = v23;
    v34[4] = (size_t)v4;
    xpc_connection_set_event_handler(v4, __str);
    if (qword_100010628 != -1)
      dispatch_once(&qword_100010628, &stru_10000CF58);
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = sub_100008B60;
    block[3] = &unk_10000CFB8;
    block[4] = v23;
    dispatch_barrier_sync((dispatch_queue_t)qword_100010630, block);
    sub_1000069F0(v23, v27);
    reply = xpc_dictionary_create_reply(object);
    if (reply)
    {
      v29 = reply;
      xpc_connection_send_message(v4, reply);
      xpc_release(v29);
    }
    return;
  }
LABEL_19:
  if ((_os_trace_peer_is_admin(v4) & 1) != 0 || string)
  {
    v19 = pid;
    v20 = "allowing %s (%d) access to stream due to admin status";
    sub_1000042A4(5, "allowing %s (%d) access to stream due to admin status");
    goto LABEL_24;
  }
  if (sub_1000089B0())
  {
    v19 = pid;
    v20 = "allowing %s (%d) entitled access to stream";
    sub_1000042A4(5, "allowing %s (%d) entitled access to stream");
    goto LABEL_24;
  }
  if (os_variant_is_darwinos("com.apple.diagnosticd") && sub_1000089B0())
  {
    v19 = pid;
    v20 = "allowing %s (%d) darwinOS entitled access to stream";
    sub_1000042A4(5, "allowing %s (%d) darwinOS entitled access to stream");
    goto LABEL_24;
  }
  sub_1000042A4(5, "streaming limited to admin group %s (%d)", buffer, pid);
  snprintf(__str, 0x400uLL, "streaming limited to admin group %s (%d)", buffer, pid);
  sub_100006394((uint64_t)__str);
  sub_1000042A4(3, "denying stream client (insufficient access) %s (%d)", buffer, pid);
  v30 = xpc_dictionary_create_reply(object);
  if (v30)
  {
    v31 = v30;
    xpc_dictionary_set_uint64(v30, "error", 1uLL);
    xpc_connection_send_message(v4, v31);
    xpc_release(v31);
  }
  xpc_connection_cancel(v4);

}

BOOL sub_1000089B0()
{
  void *v0;
  void *v1;
  _BOOL8 value;

  v0 = (void *)xpc_connection_copy_entitlement_value();
  if (!v0)
    return 0;
  v1 = v0;
  if (xpc_get_type(v0) == (xpc_type_t)&_xpc_type_BOOL)
  {
    value = xpc_BOOL_get_value(v1);
  }
  else
  {
    sub_1000042A4(3, "non-BOOLean entitlements unsupported @%s:%d", "_diagd_peer_is_entitled", 554);
    value = 0;
  }
  xpc_release(v1);
  return value;
}

void sub_100008A38(uint64_t a1, xpc_object_t object)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD block[5];

  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_error)
  {
    if (object == &_xpc_error_connection_invalid)
    {
      sub_100007CA0(*(_QWORD *)(a1 + 32));
      if (qword_100010628 != -1)
        dispatch_once(&qword_100010628, &stru_10000CF58);
      block[0] = _NSConcreteStackBlock;
      block[1] = 0x40000000;
      block[2] = sub_100008BBC;
      block[3] = &unk_10000CF78;
      block[4] = *(_QWORD *)(a1 + 32);
      dispatch_barrier_sync((dispatch_queue_t)qword_100010630, block);
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(_QWORD *)(v4 + 40);
      if (v5)
        sub_1000042A4(5, "Stream client PID: %d - Dropped %llu of %llu messages because streaming client could not keep up with the datastream.", *(_DWORD *)(v4 + 56), v5, *(_QWORD *)(v4 + 32) + v5);
      xpc_release(*(xpc_object_t *)(a1 + 40));
      os_release(*(void **)(*(_QWORD *)(a1 + 32) + 72));
    }
    else
    {
      xpc_connection_cancel(*(xpc_connection_t *)(a1 + 40));
    }
  }
}

uint64_t sub_100008B60(uint64_t a1)
{
  uint64_t result;

  result = os_transaction_create("com.apple.diagnosticd.stream");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = result;
  **(_QWORD **)(a1 + 32) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = off_1000102A8;
  *off_1000102A8 = *(_UNKNOWN **)(a1 + 32);
  off_1000102A8 = *(_UNKNOWN ***)(a1 + 32);
  return result;
}

uint64_t sub_100008BBC(uint64_t result)
{
  uint64_t *v1;
  uint64_t v2;

  v1 = *(uint64_t **)(result + 32);
  v2 = *v1;
  if (*v1)
  {
    *(_QWORD *)(v2 + 8) = v1[1];
    v1 = *(uint64_t **)(result + 32);
    v2 = *v1;
  }
  else
  {
    off_1000102A8 = (_UNKNOWN **)v1[1];
  }
  *(_QWORD *)v1[1] = v2;
  return result;
}

void sub_100008BEC(id a1)
{
  exit(0);
}

unsigned __int8 *sub_100008BFC(unsigned __int8 *result, uint64_t a2)
{
  _QWORD *v3;
  int v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int v11;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t v14;
  _OWORD v15[5];
  uint64_t v16;
  _OWORD v17[6];
  uint64_t v18;

  v3 = result;
  v4 = *result;
  if (v4 != 1)
  {
    if (v4 != 2)
    {
      if (v4 == 3)
      {
        if (*((_QWORD *)result + 2))
        {
          v5 = 0;
          v6 = 0;
          do
          {
            result = (unsigned __int8 *)(*(uint64_t (**)(uint64_t, unint64_t, uint64_t))(a2 + 16))(a2, v6++, v3[1] + v5);
            v5 += 16;
          }
          while (v6 < v3[2]);
        }
        return result;
      }
      printf("TB_FATAL: invalid tag in array metadata: 0x%x (%s:%d)\n", v4, "/Library/Caches/com.apple.xbs/Binaries/libtrace_executables/install/TempContent/Objects/libtrace.build/diagnosticd.build/DerivedSources/OSLogDarwin_C.c", 952);
      _os_crash("TB_FATAL: invalid tag in array metadata: 0x%x", v11);
      __break(1u);
LABEL_16:
      result = (unsigned __int8 *)_os_crash("TB_ASSERT: (err == TB_ERROR_SUCCESS) && \"failed to wrap packed buffer\"");
      __break(1u);
      return result;
    }
    v7 = *((_QWORD *)result + 1);
    v8 = v3[2];
    v9 = v3[3];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 0x40000000;
    v12[2] = sub_100008DF4;
    v12[3] = &unk_10000CFE0;
    v12[4] = a2;
    v12[5] = v3;
    result = (unsigned __int8 *)tb_message_subrange(v7, v8, v9, v12);
    if (!(_DWORD)result)
      return result;
    _os_crash("TB_ASSERT: (vErr == TB_ERROR_SUCCESS) && \"tb_message_subrange failed\"");
    __break(1u);
  }
  v16 = 0;
  memset(v15, 0, sizeof(v15));
  v18 = 0;
  memset(v17, 0, sizeof(v17));
  tb_transport_message_buffer_wrap_buffer(v17, v3[1], v3[2]);
  if (tb_message_construct(v15, v17, 0))
    goto LABEL_16;
  result = (unsigned __int8 *)tb_message_configure_recieved(v15, 2);
  if (v3[3])
  {
    v10 = 0;
    do
    {
      v13 = 0;
      v14 = 0;
      tb_message_decode_u32(v15, &v13);
      tb_message_decode_u64(v15, &v14);
      result = (unsigned __int8 *)(*(uint64_t (**)(uint64_t, unint64_t, uint64_t *))(a2 + 16))(a2, v10++, &v13);
    }
    while (v10 < v3[3]);
  }
  return result;
}

uint64_t sub_100008DF4(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  uint64_t v6;
  uint64_t v7;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 32))
  {
    v4 = 0;
    do
    {
      v6 = 0;
      v7 = 0;
      tb_message_decode_u32(a2, &v6);
      tb_message_decode_u64(a2, &v7);
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      ++v4;
    }
    while (v4 < *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32));
  }
  return 0;
}

uint64_t sub_100008E84(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += 12;
  return result;
}

uint64_t sub_100008E9C(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

uint64_t sub_100008EB4(uint64_t a1, uint64_t a2, unsigned int *a3)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a1 + 32);
  tb_message_encode_u32(v4, *a3);
  return tb_message_encode_u64(v4, *((_QWORD *)a3 + 1));
}

void sub_100008EE8(id a1)
{
  qword_100010638 = (uint64_t)"/private/var/db/diagnostics";
  qword_100010640 = (uint64_t)"/private/var/db/uuidtext";
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_arrayByAddingObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayByAddingObject:");
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayByAddingObjectsFromArray:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithPropertyList:format:options:error:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_initWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBytes:length:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longValue");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLongLong:");
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

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setStreamFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStreamFlags:");
}

id objc_msgSend_streamFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "streamFlags");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringValue");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongLongValue");
}

id objc_msgSend_unsignedShortValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedShortValue");
}
