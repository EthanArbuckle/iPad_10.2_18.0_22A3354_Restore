BOOL _symptoms_is_daemon_fallback_blacklisted(int a1, char *a2)
{
  if (_symptoms_is_daemon_fallback_blacklisted_onceToken != -1)
    dispatch_once(&_symptoms_is_daemon_fallback_blacklisted_onceToken, &__block_literal_global_22);
  return (_symptoms_is_daemon_fallback_blacklisted_is_fallback_blacklisted & 1) != 0
      || a2 && _symptoms_is_daemon_fallback_blacklisted_is_media_play && !strcasecmp(a2, "com.apple.mobilesafari");
}

const char *___symptoms_is_daemon_fallback_blacklisted_block_invoke()
{
  const char *result;
  const char *v1;
  uint64_t v2;

  result = getprogname();
  if (result)
  {
    v1 = result;
    v2 = 0;
    while (strcmp(v1, _block_invoke_2_kBlacklistedProcessNameList[v2]))
    {
      if (++v2 == 7)
        goto LABEL_7;
    }
    _symptoms_is_daemon_fallback_blacklisted_is_fallback_blacklisted = 1;
LABEL_7:
    result = (const char *)strcmp(v1, "mediaserverd");
    if (!(_DWORD)result || (result = (const char *)strcmp(v1, "mediaplaybackd"), !(_DWORD)result))
      _symptoms_is_daemon_fallback_blacklisted_is_media_play = 1;
  }
  return result;
}

uint64_t update_globals_for_symptom_removal(uint64_t a1, const void **a2)
{
  int *v3;
  int v4;

  --*(_QWORD *)(a1 + 120);
  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 320) == -1)
    v3 = *(int **)(MEMORY[0x1E0C87FA0] + 328);
  else
    v3 = (int *)_os_alloc_once();
  v4 = *v3;
  if ((*v3 & 2) != 0)
  {
    printf("update globals to remove symptom at %p\n", a2);
    v4 = *v3;
  }
  if ((v4 & 4) != 0)
    _sr_log("update globals to remove symptom at %p\n", a2);
  return dump_symptom(a2);
}

void symptoms_incoming_message(uint64_t a1, unsigned __int16 *a2, unint64_t a3)
{
  uint64_t v6;
  int *v7;
  int v8;
  unsigned int v9;
  unint64_t v10;
  int v11;
  int *v12;
  int v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  unint64_t v20;
  int *v21;
  unint64_t v22;
  int v23;
  _DWORD *v24;
  int v25;
  uint64_t v26;
  int *v27;
  int v28;
  int v29;
  _QWORD *symptom_ctrl;
  _DWORD *v31;
  int v32;
  int *v33;
  int v34;
  int *v35;
  int v36;
  uint64_t v37;
  unint64_t v38;
  _OWORD v39[4];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C874D8];
  v6 = MEMORY[0x1E0C87FA0];
  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 320) == -1)
    v7 = *(int **)(MEMORY[0x1E0C87FA0] + 328);
  else
    v7 = (int *)_os_alloc_once();
  v8 = *v7;
  if ((*v7 & 2) != 0)
  {
    puts("+++ SYMPTOMSD MESSAGE RECEIVED +++");
    v8 = *v7;
  }
  if ((v8 & 4) != 0)
    _sr_log("+++ SYMPTOMSD MESSAGE RECEIVED +++\n");
  if (a3 < 4)
    return;
  while (1)
  {
    v9 = *a2;
    if (v9 <= 0xB)
      break;
    if (v9 != 12)
    {
      if (v9 == 41)
      {
        if (a3 >= 8 && a2[1] == 4)
        {
          ++*(_QWORD *)(a1 + 248);
          if (*((_DWORD *)a2 + 1) == *(_DWORD *)(a1 + 108))
          {
            *(_BYTE *)(a1 + 112) = 0;
            if (*(_QWORD *)(a1 + 80))
              send_current(a1);
          }
        }
        else
        {
          _sr_log("SymptomReporter incoming_message, SYMTLV_TERMINAL_ACK sz too small %zd");
        }
      }
      return;
    }
    _sr_log("SymptomReporter incoming_message, SYMTLV_FILTER sc %zd desc->stlv_len %d filter size %zd", a3, a2[1], 0x10uLL);
    v20 = a2[1];
    if (a3 < 0x14 || v20 < 0x10 || (v20 & 0xF) != 0)
    {
      _sr_log("SymptomReporter incoming_message, SYMTLV_FILTER sz %zd fails consistency checks, desc->stlv_len %d");
      return;
    }
    if (*(_QWORD *)(v6 + 320) == -1)
      v21 = *(int **)(v6 + 328);
    else
      v21 = (int *)_os_alloc_once();
    v22 = v20 >> 4;
    v23 = *v21;
    if ((*v21 & 2) != 0)
    {
      printf("apply_new_filters, count is %zd, seqno %d\n", v22, *(_DWORD *)(a1 + 104) + 1);
      v23 = *v21;
    }
    if ((v23 & 4) != 0)
      _sr_log("apply_new_filters, count is %zd, seqno %d\n", v22, *(_DWORD *)(a1 + 104) + 1);
    ++*(_DWORD *)(a1 + 104);
    v24 = a2 + 8;
    do
    {
      v25 = *(v24 - 2);
      v26 = *(_QWORD *)(v6 + 320);
      if (!v25)
      {
        v31 = (_DWORD *)(a1 + 88);
        goto LABEL_54;
      }
      if (v26 == -1)
        v27 = *(int **)(v6 + 328);
      else
        v27 = (int *)_os_alloc_once();
      v28 = *v27;
      if ((*v27 & 2) != 0)
      {
        printf("apply_new_filters, Symptom: %x   Qlert %d    Q drop %d\n", v25, *((unsigned __int16 *)v24 - 2), *((unsigned __int16 *)v24 - 1));
        v28 = *v27;
      }
      v29 = *(v24 - 2);
      if ((v28 & 4) != 0)
      {
        _sr_log("apply_new_filters, Symptom: %x   Qlert %d    Q drop %d\n", v29, *((unsigned __int16 *)v24 - 2), *((unsigned __int16 *)v24 - 1));
        v29 = *(v24 - 2);
      }
      symptom_ctrl = get_symptom_ctrl((_QWORD *)a1, v29);
      if (symptom_ctrl)
      {
        v31 = (_DWORD *)symptom_ctrl + 11;
        v26 = *(_QWORD *)(v6 + 320);
LABEL_54:
        v32 = *(_DWORD *)(a1 + 104);
        *v31 = *v24;
        v31[1] = *((unsigned __int16 *)v24 - 2);
        v31[2] = *((unsigned __int16 *)v24 - 1);
        v31[3] = v32;
        if (v26 == -1)
          v33 = *(int **)(v6 + 328);
        else
          v33 = (int *)_os_alloc_once();
        v34 = *v33;
        if ((*v33 & 2) != 0)
        {
          printf("update_filter_values, max age %d, alert len %d drop len %d seqno %d\n", *v31, v31[1], v31[2], v32);
          v34 = *v33;
        }
        if ((v34 & 4) != 0)
          _sr_log("update_filter_values, max age %d, alert len %d drop len %d seqno %d\n", *v31, v31[1], v31[2], v32);
      }
      v24 += 4;
      --v22;
    }
    while (v22);
    if (*(_QWORD *)(v6 + 320) == -1)
      v35 = *(int **)(v6 + 328);
    else
      v35 = (int *)_os_alloc_once();
    v36 = *v35;
    if ((*v35 & 2) != 0)
    {
      printf("apply_new_filters");
      v36 = *v35;
    }
    if ((v36 & 4) != 0)
      _sr_log("apply_new_filters");
    reevaluate_sr_symptoms(a1);
    v37 = a2[1];
    a3 = a3 - v37 - 4;
    a2 = (unsigned __int16 *)((char *)a2 + v37 + 4);
LABEL_72:
    if (a3 <= 3)
      return;
  }
  if (v9 == 1)
  {
    a2 += 2;
    a3 -= 4;
    goto LABEL_72;
  }
  if (v9 == 11)
  {
    v10 = a3 - 16;
    if (a3 >= 0x10 && a2[1] == 12)
    {
      v11 = *((_DWORD *)a2 + 3);
      if (*(_QWORD *)(v6 + 320) == -1)
        v12 = *(int **)(v6 + 328);
      else
        v12 = (int *)_os_alloc_once();
      memset(v39, 0, 60);
      v13 = *v12;
      if ((*v12 & 2) != 0)
      {
        printf("new_symptoms_read: ack_id %d\n", v11);
        v13 = *v12;
      }
      if ((v13 & 4) != 0)
        _sr_log("new_symptoms_read: ack_id %d\n", v11);
      v14 = (char *)malloc_type_malloc(0x28A0uLL, 0x23FD76D0uLL);
      v15 = v14;
      if (v14)
        v16 = v14;
      else
        v16 = (char *)v39;
      v17 = (char *)&v39[3] + 8;
      if (v14)
      {
        v38 = 10340;
        v17 = read_symptoms(a1, v14 + 56, &v38);
      }
      if (v15)
        v18 = v15;
      else
        v18 = (char *)v39;
      *((_DWORD *)v18 + 1) = 3145735;
      if (v15)
        v19 = v15 + 8;
      else
        v19 = (char *)v39 + 8;
      read_current_status(a1, (uint64_t)v19, v11, 1);
      *(_DWORD *)v17 = 0;
      *(_WORD *)v16 = 1;
      *((_WORD *)v18 + 1) = (_WORD)v17 - (_WORD)v19 + 8;
      symptom_transport_send(a1, v16, (unsigned __int16)((_WORD)v17 - (_WORD)v19 + 8) + 4);
      ++*(_QWORD *)(a1 + 280);
      sr_log_status_send(a1, (uint64_t)v16);
      if (v15)
        free(v15);
      a2 = (unsigned __int16 *)((char *)a2 + a2[1] + 4);
      a3 = v10;
      goto LABEL_72;
    }
    _sr_log("SymptomReporter incoming_message, SYMTLV_READ sz too small %zd");
  }
}

uint64_t symptoms_go_multithreaded(uint64_t result)
{
  *(_BYTE *)(result + 32) = 1;
  return result;
}

uint64_t symptom_transport_send(uint64_t a1, const void *a2, size_t a3)
{
  xpc_object_t v6;
  uint64_t v7;
  void *v8;
  int *v9;
  int v10;
  size_t v11;
  int *v13;
  int v14;

  v6 = xpc_dictionary_create(0, 0, 0);
  v7 = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 320);
  if (v6)
  {
    v8 = v6;
    if (v7 == -1)
      v9 = *(int **)(MEMORY[0x1E0C87FA0] + 328);
    else
      v9 = (int *)_os_alloc_once();
    v10 = *v9;
    if ((*v9 & 2) != 0)
    {
      printf("symptom_transport_send:  ptr %p size %lu \n", a2, a3);
      v10 = *v9;
    }
    if ((v10 & 4) != 0)
      _sr_log("symptom_transport_send:  ptr %p size %lu \n", a2, a3);
    v11 = *(_QWORD *)(a1 + 264) + a3;
    ++*(_QWORD *)(a1 + 256);
    *(_QWORD *)(a1 + 264) = v11;
    xpc_dictionary_set_data(v8, "payload", a2, a3);
    if (*(_BYTE *)(a1 + 352))
      xpc_connection_send_message(*(xpc_connection_t *)(a1 + 136), v8);
    xpc_release(v8);
    return 0;
  }
  else
  {
    if (v7 == -1)
      v13 = *(int **)(MEMORY[0x1E0C87FA0] + 328);
    else
      v13 = (int *)_os_alloc_once();
    v14 = *v13;
    if ((*v13 & 2) != 0)
    {
      puts("symptom_transport_send:  ERR no dictionary");
      v14 = *v13;
    }
    if ((v14 & 4) != 0)
      _sr_log("symptom_transport_send:  ERR no dictionary\n");
    return 0xFFFFFFFFLL;
  }
}

uint64_t symptom_transport_connect(uint64_t a1)
{
  uint64_t v2;
  int *v3;
  int v4;
  xpc_connection_t mach_service;
  _xpc_connection_s *v6;
  int *v8;
  int v9;
  _QWORD handler[5];

  v2 = MEMORY[0x1E0C87FA0];
  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 320) == -1)
    v3 = *(int **)(MEMORY[0x1E0C87FA0] + 328);
  else
    v3 = (int *)_os_alloc_once();
  v4 = *v3;
  if ((*v3 & 2) != 0)
  {
    printf("symptom_transport_connect called, connecting to %s\n", "com.apple.usymptomsd");
    v4 = *v3;
  }
  if ((v4 & 4) != 0)
    _sr_log("symptom_transport_connect called, connecting to %s\n", "com.apple.usymptomsd");
  mach_service = xpc_connection_create_mach_service("com.apple.usymptomsd", *(dispatch_queue_t *)(a1 + 128), 2uLL);
  *(_QWORD *)(a1 + 136) = mach_service;
  if (mach_service)
  {
    gettimeofday((timeval *)(a1 + 160), 0);
    xpc_connection_set_target_queue(*(xpc_connection_t *)(a1 + 136), *(dispatch_queue_t *)(a1 + 128));
    v6 = *(_xpc_connection_s **)(a1 + 136);
    handler[0] = MEMORY[0x1E0C87450];
    handler[1] = 0x40000000;
    handler[2] = __symptom_transport_connect_block_invoke;
    handler[3] = &__block_descriptor_tmp_0;
    handler[4] = a1;
    xpc_connection_set_event_handler(v6, handler);
    xpc_connection_resume(*(xpc_connection_t *)(a1 + 136));
    return 0;
  }
  else
  {
    if (*(_QWORD *)(v2 + 320) == -1)
      v8 = *(int **)(v2 + 328);
    else
      v8 = (int *)_os_alloc_once();
    v9 = *v8;
    if ((*v8 & 2) != 0)
    {
      printf("failed to connect to %s\n", "com.apple.usymptomsd");
      v9 = *v8;
    }
    if ((v9 & 4) != 0)
      _sr_log("failed to connect to %s\n", "com.apple.usymptomsd");
    return 0xFFFFFFFFLL;
  }
}

uint64_t symptom_set_qualifier(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t result;

  result = 0xFFFFFFFFLL;
  if (a1)
  {
    if (a3 <= 7)
    {
      result = 0;
      *(_QWORD *)(a1 + 8 * a3 + 40) = a2;
      *(_DWORD *)(a1 + 20) |= 1 << a3;
    }
  }
  return result;
}

uint64_t symptom_set_additional_qualifier(uint64_t a1, int a2, size_t a3, const void *a4)
{
  unint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t result;

  if (!a1)
    return 0xFFFFFFFFLL;
  v8 = ((a3 + 3) & 0xFFFFFFFFFFFFFFFCLL) + 8;
  if (get_symptom_qual_size(a1) + v8 > 0x2710)
    return 0xFFFFFFFFLL;
  if ((unint64_t)get_symptom_qual_count(a1) > 0x13)
    return 0xFFFFFFFFLL;
  v9 = malloc_type_calloc(1uLL, a3 + 27, 0xC0EB7443uLL);
  if (!v9)
    return 0xFFFFFFFFLL;
  v10 = v9;
  *((_DWORD *)v9 + 2) = 11337453;
  *((_WORD *)v9 + 6) = 8;
  *((_WORD *)v9 + 7) = v8;
  *((_DWORD *)v9 + 4) = a2;
  *((_DWORD *)v9 + 5) = a3;
  if (a3)
  {
    if (a4)
      memcpy(v9 + 3, a4, a3);
  }
  result = 0;
  *v10 = *(_QWORD *)(a1 + 104);
  *(_QWORD *)(a1 + 104) = v10;
  *(_DWORD *)(a1 + 20) |= 0x40000000u;
  return result;
}

uint64_t symptom_send(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  if (a1)
  {
    sr_log_symptom((uint64_t)a1);
    v2 = a1[14];
    if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 320) == -1)
      v3 = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 328);
    else
      v3 = _os_alloc_once();
    if (!*(_BYTE *)(v3 + 32))
    {
      if (!_dispatch_is_multithreaded())
      {
        *(_BYTE *)(v2 + 352) = 0;
        symptom_free(a1, "Not Multithreaded");
        return 0;
      }
      if (*(_QWORD *)(v3 + 24) != -1)
        dispatch_once_f((dispatch_once_t *)(v3 + 24), (void *)v3, (dispatch_function_t)symptoms_go_multithreaded);
    }
    *(_BYTE *)(v2 + 352) = 1;
    dispatch_async_f(*(dispatch_queue_t *)(v2 + 128), a1, (dispatch_function_t)symptom_post);
    return 0;
  }
  return 0xFFFFFFFFLL;
}

void symptom_post(uint64_t a1)
{
  uint64_t v2;
  _DWORD *v3;
  uint64_t v4;
  const char *v5;
  _QWORD *symptom_ctrl;
  _DWORD *v7;

  v2 = MEMORY[0x1E0C87FA0];
  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 320) == -1)
    v3 = *(_DWORD **)(MEMORY[0x1E0C87FA0] + 328);
  else
    v3 = (_DWORD *)_os_alloc_once();
  if ((*v3 & 2) != 0)
  {
    printf("symptom_post entry, symptom pointer %p\n", (const void *)a1);
    if ((*v3 & 4) == 0)
    {
LABEL_5:
      if (a1)
        goto LABEL_6;
      return;
    }
  }
  else if ((*v3 & 4) == 0)
  {
    goto LABEL_5;
  }
  _sr_log("symptom_post entry, symptom pointer %p\n", (const void *)a1);
  if (a1)
  {
LABEL_6:
    dump_symptom((const void **)a1);
    v4 = *(_QWORD *)(a1 + 112);
    if (*(_BYTE *)(v4 + 115))
    {
      v5 = "Disabled";
LABEL_8:
      symptom_free((_QWORD *)a1, v5);
      return;
    }
    if (!*(_BYTE *)(v4 + 352))
    {
      v5 = "Singlethreaded";
      goto LABEL_8;
    }
    symptom_ctrl = get_symptom_ctrl(*(_QWORD **)(a1 + 112), *(_DWORD *)(a1 + 32));
    if (*(_QWORD *)(v2 + 320) == -1)
      v7 = *(_DWORD **)(v2 + 328);
    else
      v7 = (_DWORD *)_os_alloc_once();
    if ((*v7 & 2) != 0)
    {
      printf("symptom_post obtained control structure at %p\n", symptom_ctrl);
      if ((*v7 & 4) == 0)
      {
LABEL_17:
        if (symptom_ctrl)
        {
LABEL_18:
          handle_symptom(v4, (uint64_t)symptom_ctrl, (_QWORD *)a1);
          return;
        }
LABEL_22:
        sr_log_symptom_action(a1, 2048);
        v5 = "No mem";
        goto LABEL_8;
      }
    }
    else if ((*v7 & 4) == 0)
    {
      goto LABEL_17;
    }
    _sr_log("symptom_post obtained control structure at %p\n", symptom_ctrl);
    if (symptom_ctrl)
      goto LABEL_18;
    goto LABEL_22;
  }
}

_QWORD *symptom_new(uint64_t a1, unsigned int a2)
{
  _QWORD *v2;
  _QWORD *v5;
  int v6;
  timeval v8;

  v2 = 0;
  if (a1)
  {
    if (!(a2 >> 20))
    {
      v5 = malloc_type_calloc(1uLL, 0x78uLL, 0x1020040647A71D6uLL);
      v2 = v5;
      if (v5)
      {
        v8.tv_sec = 0;
        *(_QWORD *)&v8.tv_usec = 0;
        v5[1] = 0x580002CEEDFEEDLL;
        *((_BYTE *)v5 + 16) = 1;
        *((_DWORD *)v5 + 5) = 0;
        gettimeofday(&v8, 0);
        v6 = 1000 * v8.tv_usec;
        *((_DWORD *)v2 + 6) = v8.tv_sec;
        *((_DWORD *)v2 + 7) = v6;
        *(_OWORD *)(v2 + 5) = 0u;
        *(_OWORD *)(v2 + 7) = 0u;
        *(_OWORD *)(v2 + 9) = 0u;
        *(_OWORD *)(v2 + 11) = 0u;
        *((_DWORD *)v2 + 8) = a2 | (*(_DWORD *)(a1 + 12) << 20);
        v2[14] = a1;
      }
    }
  }
  return v2;
}

void symptom_free(_QWORD *a1, const char *a2)
{
  _QWORD *v4;
  int *v5;
  int v6;

  if (a1)
  {
    while (1)
    {
      v4 = (_QWORD *)a1[13];
      if (!v4)
        break;
      a1[13] = *v4;
      free(v4);
    }
    *((_DWORD *)a1 + 2) = -823271763;
    if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 320) == -1)
      v5 = *(int **)(MEMORY[0x1E0C87FA0] + 328);
    else
      v5 = (int *)_os_alloc_once();
    v6 = *v5;
    if ((*v5 & 2) != 0)
    {
      printf("Free symptom %p, %s", a1, a2);
      v6 = *v5;
    }
    if ((v6 & 4) != 0)
      _sr_log("Free symptom %p, %s", a1, a2);
    free(a1);
  }
}

_QWORD *symptom_framework_init(unsigned int a1, char *__s)
{
  size_t v4;

  v4 = strlen(__s);
  if (a1 > 0xFF || v4 > 0x400)
    return 0;
  else
    return obtain_symptom_framework(a1, __s, v4);
}

uint64_t sym_ctrl_dequeue(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  int *v6;
  int v7;

  v4 = *(_QWORD *)(a2 + 24);
  v5 = *(_QWORD **)(a2 + 32);
  if (v4)
  {
    *(_QWORD *)(v4 + 32) = v5;
    v5 = *(_QWORD **)(a2 + 32);
  }
  else
  {
    *(_QWORD *)(a1 + 72) = v5;
  }
  *v5 = v4;
  *(_BYTE *)(a2 + 40) = 0;
  --*(_QWORD *)(a1 + 80);
  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 320) == -1)
    v6 = *(int **)(MEMORY[0x1E0C87FA0] + 328);
  else
    v6 = (int *)_os_alloc_once();
  v7 = *v6;
  if ((*v6 & 2) != 0)
  {
    printf("After sym_ctrl_dequeue  %p\n", (const void *)a2);
    v7 = *v6;
  }
  if ((v7 & 4) != 0)
    _sr_log("After sym_ctrl_dequeue  %p\n", (const void *)a2);
  return dump_symptom_state(a1);
}

_BYTE *sr_log_symptom_action(uint64_t a1, int a2)
{
  uint64_t v4;
  _BYTE *result;
  unsigned int v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  char *v16;
  size_t v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  char __str[1500];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C874D8];
  v4 = MEMORY[0x1E0C87FA0];
  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 320) == -1)
  {
    result = *(_BYTE **)(MEMORY[0x1E0C87FA0] + 328);
    if (!result)
      return result;
  }
  else
  {
    result = (_BYTE *)_os_alloc_once();
    if (!result)
      return result;
  }
  if ((*result & 1) == 0)
    return result;
  v6 = snprintf(__str, 0x5DBuLL, "Symptom Sender Name: %s", *(const char **)(*(_QWORD *)(a1 + 112) + 24));
  if (v6 >= 0x5DB)
    v7 = 1499;
  else
    v7 = v6;
  v8 = snprintf(&__str[v7], 1499 - v7, "Symptom ID %x    ", *(_DWORD *)(a1 + 32));
  v9 = 0;
  if ((unint64_t)(v7 + v8) >= 0x5DB)
    v10 = 1499;
  else
    v10 = v7 + v8;
  do
  {
    if (((*(_DWORD *)(a1 + 20) >> v9) & 1) != 0)
    {
      v10 += snprintf(&__str[v10], 1499 - v10, "QUAL[%d] %llx ", v9, *(_QWORD *)(a1 + 40 + 8 * v9));
      v11 = 1499;
      if (v10 > 0x5DB)
        break;
    }
    ++v9;
    v11 = v10;
  }
  while (v9 != 8);
  if (a2)
  {
    v12 = 1499;
    v13 = snprintf(&__str[v11], 1499 - v11, "ACTION:");
    if ((unint64_t)(v11 + v13) < 0x5DB)
      v12 = v11 + v13;
    if ((a2 & 1) != 0)
    {
      v15 = snprintf(&__str[v12], 1499 - v12, " save");
      if ((unint64_t)(v12 + v15) >= 0x5DB)
        v12 = 1499;
      else
        v12 += v15;
      if ((a2 & 2) == 0)
      {
LABEL_18:
        if ((a2 & 0x100) == 0)
          goto LABEL_19;
        goto LABEL_43;
      }
    }
    else if ((a2 & 2) == 0)
    {
      goto LABEL_18;
    }
    v16 = &__str[v12];
    v17 = 1499 - v12;
    if ((a2 & 0x1000) != 0)
      v18 = snprintf(v16, v17, " alert-send");
    else
      v18 = snprintf(v16, v17, " alert-pend");
    if ((unint64_t)(v12 + v18) >= 0x5DB)
      v12 = 1499;
    else
      v12 += v18;
    if ((a2 & 0x100) == 0)
    {
LABEL_19:
      if ((a2 & 0x400) == 0)
        goto LABEL_20;
      goto LABEL_47;
    }
LABEL_43:
    v19 = snprintf(&__str[v12], 1499 - v12, " drop");
    if ((unint64_t)(v12 + v19) >= 0x5DB)
      v12 = 1499;
    else
      v12 += v19;
    if ((a2 & 0x400) == 0)
    {
LABEL_20:
      if ((a2 & 0x800) == 0)
        goto LABEL_21;
      goto LABEL_51;
    }
LABEL_47:
    v20 = snprintf(&__str[v12], 1499 - v12, " (note, dropped older)");
    if ((unint64_t)(v12 + v20) >= 0x5DB)
      v12 = 1499;
    else
      v12 += v20;
    if ((a2 & 0x800) == 0)
    {
LABEL_21:
      if ((a2 & 0x4000) == 0)
        goto LABEL_22;
      goto LABEL_55;
    }
LABEL_51:
    v21 = snprintf(&__str[v12], 1499 - v12, " drop (NOMEM)");
    if ((unint64_t)(v12 + v21) >= 0x5DB)
      v12 = 1499;
    else
      v12 += v21;
    if ((a2 & 0x4000) == 0)
    {
LABEL_22:
      if ((a2 & 0x8000) == 0)
      {
LABEL_26:
        snprintf(&__str[v12], 1499 - v12, " ALERTS posted %d", *(unsigned __int8 *)(*(_QWORD *)(a1 + 112) + 114));
        goto LABEL_27;
      }
LABEL_23:
      v14 = snprintf(&__str[v12], 1499 - v12, " sent");
      if ((unint64_t)(v12 + v14) >= 0x5DB)
        v12 = 1499;
      else
        v12 += v14;
      goto LABEL_26;
    }
LABEL_55:
    v22 = snprintf(&__str[v12], 1499 - v12, " reinit");
    if ((unint64_t)(v12 + v22) >= 0x5DB)
      v12 = 1499;
    else
      v12 += v22;
    if ((a2 & 0x8000) == 0)
      goto LABEL_26;
    goto LABEL_23;
  }
LABEL_27:
  if (*(_QWORD *)(v4 + 320) == -1)
    result = *(_BYTE **)(v4 + 328);
  else
    result = (_BYTE *)_os_alloc_once();
  if ((*result & 2) != 0)
    return (_BYTE *)printf(" SYMPTOM-LOG-STRING: %s\n", __str);
  return result;
}

_BYTE *sr_log_symptom(uint64_t a1)
{
  return sr_log_symptom_action(a1, 0);
}

_BYTE *sr_log_status_send(uint64_t a1, uint64_t a2)
{
  _BYTE *result;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  int v8;
  char v9;
  int v10;
  int v11;
  int v12;
  const char *v13;
  char __str[1500];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C874D8];
  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 320) == -1)
  {
    result = *(_BYTE **)(MEMORY[0x1E0C87FA0] + 328);
    if (!result)
      return result;
  }
  else
  {
    result = (_BYTE *)_os_alloc_once();
    if (!result)
      return result;
  }
  if ((*result & 1) != 0)
  {
    v13 = *(const char **)(a1 + 24);
    v5 = 1499;
    v6 = snprintf(__str, 0x5DBuLL, "Status Sender Name: %s", v13);
    if (v6 >= 0x5DB)
      v7 = 1499;
    else
      v7 = v6;
    v8 = snprintf(&__str[v7], 1499 - v7, "Sent STATUS flags");
    if ((unint64_t)(v7 + v8) < 0x5DB)
      v5 = v7 + v8;
    v9 = *(_BYTE *)(a2 + 10);
    if ((v9 & 1) != 0)
    {
      v11 = snprintf(&__str[v5], 1499 - v5, " resp");
      if ((unint64_t)(v5 + v11) >= 0x5DB)
        v5 = 1499;
      else
        v5 += v11;
      if ((v9 & 2) == 0)
      {
LABEL_11:
        if ((v9 & 4) == 0)
          return (_BYTE *)snprintf(&__str[v5], 1499 - v5, " ack-id %d  num-alerts %d num-queued %d", *(_DWORD *)(a2 + 12), *(_DWORD *)(a2 + 16), *(_DWORD *)(a2 + 20));
LABEL_12:
        v10 = snprintf(&__str[v5], 1499 - v5, " EAGAIN !!!");
        if ((unint64_t)(v5 + v10) >= 0x5DB)
          v5 = 1499;
        else
          v5 += v10;
        return (_BYTE *)snprintf(&__str[v5], 1499 - v5, " ack-id %d  num-alerts %d num-queued %d", *(_DWORD *)(a2 + 12), *(_DWORD *)(a2 + 16), *(_DWORD *)(a2 + 20));
      }
    }
    else if ((*(_BYTE *)(a2 + 10) & 2) == 0)
    {
      goto LABEL_11;
    }
    v12 = snprintf(&__str[v5], 1499 - v5, " alert");
    if ((unint64_t)(v5 + v12) >= 0x5DB)
      v5 = 1499;
    else
      v5 += v12;
    if ((v9 & 4) == 0)
      return (_BYTE *)snprintf(&__str[v5], 1499 - v5, " ack-id %d  num-alerts %d num-queued %d", *(_DWORD *)(a2 + 12), *(_DWORD *)(a2 + 16), *(_DWORD *)(a2 + 20));
    goto LABEL_12;
  }
  return result;
}

char *read_symptoms(uint64_t a1, char *a2, unint64_t *a3)
{
  uint64_t v6;
  int *v7;
  int v8;
  _QWORD *i;
  int *v10;
  int v11;
  int *v12;
  int v13;
  const void **v14;
  const void **v15;
  char *v16;
  const void *v17;
  char *symptom;
  uint64_t v19;
  int *v20;
  int v21;
  int *v22;
  int v23;
  const void *v24;
  uint64_t *v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t *v31;
  const void *v32;
  const void **v33;

  v30 = 0;
  v31 = &v30;
  v6 = MEMORY[0x1E0C87FA0];
  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 320) == -1)
    v7 = *(int **)(MEMORY[0x1E0C87FA0] + 328);
  else
    v7 = (int *)_os_alloc_once();
  v8 = *v7;
  if ((*v7 & 2) != 0)
  {
    printf("read_symptoms for sr %p %s\n", (const void *)a1, *(const char **)(a1 + 24));
    v8 = *v7;
  }
  if ((v8 & 4) != 0)
    _sr_log("read_symptoms for sr %p %s\n", (const void *)a1, *(const char **)(a1 + 24));
  for (i = *(_QWORD **)(a1 + 64); i; i = *(_QWORD **)(a1 + 64))
  {
    sym_ctrl_dequeue(a1, (uint64_t)i);
    if (*(_QWORD *)(v6 + 320) == -1)
      v10 = *(int **)(v6 + 328);
    else
      v10 = (int *)_os_alloc_once();
    v11 = *v10;
    if ((*v10 & 2) != 0)
    {
      printf("read_symptoms for sc %p, q len %zu\n", i, i[8]);
      v11 = *v10;
    }
    if ((v11 & 4) != 0)
      _sr_log("read_symptoms for sc %p, q len %zu\n", i, i[8]);
    v32 = 0;
    v33 = &v32;
    if (*(_QWORD *)(v6 + 320) == -1)
      v12 = *(int **)(v6 + 328);
    else
      v12 = (int *)_os_alloc_once();
    v13 = *v12;
    if ((*v12 & 2) != 0)
    {
      puts("read_symptoms_from_q: entry");
      v13 = *v12;
    }
    if ((v13 & 4) != 0)
      _sr_log("read_symptoms_from_q: entry\n");
    v14 = (const void **)(i + 9);
    v15 = (const void **)i[9];
    if (v15)
    {
      v16 = a2;
      while (1)
      {
        v17 = *v15;
        *v14 = *v15;
        if (!v17)
          i[10] = v14;
        symptom = read_symptom((uint64_t)v15, v16, a3);
        v19 = *(_QWORD *)(v6 + 320);
        if (symptom == v16)
          break;
        a2 = symptom;
        if (v19 == -1)
          v20 = *(int **)(v6 + 328);
        else
          v20 = (int *)_os_alloc_once();
        v21 = *v20;
        if ((*v20 & 2) != 0)
        {
          puts("read_symptoms_from_q: added next symptom");
          v21 = *v20;
        }
        if ((v21 & 4) != 0)
          _sr_log("read_symptoms_from_q: added next symptom\n");
        --i[8];
        ++*(_QWORD *)(a1 + 296);
        update_globals_for_symptom_removal(a1, v15);
        symptom_free(v15, "transport OK");
        v15 = (const void **)i[9];
        v16 = a2;
        if (!v15)
          goto LABEL_41;
      }
      if (v19 == -1)
        v22 = *(int **)(v6 + 328);
      else
        v22 = (int *)_os_alloc_once();
      v23 = *v22;
      if ((*v22 & 2) != 0)
      {
        printf("read_symptoms_from_q: no next symptom available");
        v23 = *v22;
      }
      if ((v23 & 4) != 0)
        _sr_log("read_symptoms_from_q: no next symptom available");
      *v15 = 0;
      *v33 = v15;
      v33 = v15;
      *a3 = 0;
      a2 = v16;
    }
LABEL_41:
    v24 = v32;
    if (!v32)
      goto LABEL_47;
    if (*v14)
    {
      *v33 = *v14;
      v33 = (const void **)i[10];
      i[9] = 0;
      i[10] = v14;
      v24 = v32;
      if (!v32)
        goto LABEL_47;
    }
    else
    {
      v14 = (const void **)i[10];
    }
    *v14 = v24;
    i[10] = v33;
LABEL_47:
    if (i[8])
    {
      i[3] = 0;
      v25 = v31;
      i[4] = v31;
      *v25 = (uint64_t)i;
      v31 = i + 3;
    }
  }
  while (1)
  {
    v28 = v30;
    if (!v30)
      break;
    v26 = *(_QWORD *)(v30 + 24);
    v27 = *(_QWORD **)(v30 + 32);
    if (v26)
    {
      *(_QWORD *)(v26 + 32) = v27;
      v27 = *(_QWORD **)(v28 + 32);
    }
    else
    {
      v31 = *(uint64_t **)(v30 + 32);
    }
    *v27 = v26;
    ensure_sym_ctrl_is_queued(a1, v28);
  }
  return a2;
}

char *read_symptom(uint64_t a1, _DWORD *a2, unint64_t *a3)
{
  char *v4;
  uint64_t **v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t **i;
  size_t v14;

  v4 = (char *)a2;
  v6 = *(uint64_t ***)(a1 + 104);
  if (v6)
  {
    v7 = 0;
    do
    {
      v7 += *((unsigned __int16 *)v6 + 7) + 4;
      v6 = (uint64_t **)*v6;
    }
    while (v6);
    v8 = v7 + 92;
  }
  else
  {
    v8 = 92;
  }
  if (v8 <= *a3)
  {
    *a2 = 5767170;
    v9 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)(a2 + 5) = *(_OWORD *)(a1 + 32);
    *(_OWORD *)(a2 + 1) = v9;
    v10 = *(_OWORD *)(a1 + 48);
    v11 = *(_OWORD *)(a1 + 64);
    v12 = *(_OWORD *)(a1 + 80);
    *(_QWORD *)(a2 + 21) = *(_QWORD *)(a1 + 96);
    *(_OWORD *)(a2 + 17) = v12;
    *(_OWORD *)(a2 + 13) = v11;
    *(_OWORD *)(a2 + 9) = v10;
    sr_log_symptom_action(a1, 0x8000);
    v4 += 92;
    *a3 -= 92;
    for (i = *(uint64_t ***)(a1 + 104); i; i = (uint64_t **)*i)
    {
      v14 = *((unsigned __int16 *)i + 7) + 4;
      memcpy(v4, (char *)i + 12, v14);
      v4 += v14;
      *a3 -= v14;
    }
  }
  return v4;
}

_DWORD *read_current_status(uint64_t a1, uint64_t a2, int a3, int a4)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int v11;
  int *v12;
  int v13;

  v6 = *(_QWORD *)(a1 + 80);
  *(_BYTE *)(a1 + 114) = v6 != 0;
  if (v6)
    v7 = a4 | 2;
  else
    v7 = a4;
  *(_BYTE *)a2 = 3;
  *(_BYTE *)(a2 + 1) = *(_DWORD *)(a1 + 12);
  *(_BYTE *)(a2 + 2) = v7;
  *(_BYTE *)(a2 + 3) = 0;
  *(_DWORD *)(a2 + 4) = a3;
  *(_DWORD *)(a2 + 8) = v6;
  *(_DWORD *)(a2 + 12) = *(_QWORD *)(a1 + 120);
  v8 = *(_QWORD *)(a1 + 24);
  if (v8)
  {
    v5 = a3;
    v4 = a2;
    v9 = 0;
    v10 = 32;
    while (1)
    {
      v11 = *(unsigned __int8 *)(v8 + v9);
      *(_BYTE *)(a2 + v9 + 16) = v11;
      if (!v11)
        break;
      --v10;
      ++v9;
      if (v10 <= 1)
      {
        *(_BYTE *)(a2 + v9 + 16) = 0;
        break;
      }
    }
    if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 320) == -1)
    {
      v12 = *(int **)(MEMORY[0x1E0C87FA0] + 328);
      goto LABEL_11;
    }
  }
  else
  {
    __break(1u);
  }
  v12 = (int *)_os_alloc_once();
LABEL_11:
  v13 = *v12;
  if ((*v12 & 2) != 0)
  {
    printf("read_current_status, ack id %d, flags %d num_alerts %d  num_queued %d\n", v5, v7, *(_DWORD *)(v4 + 8), *(_DWORD *)(v4 + 12));
    v13 = *v12;
  }
  if ((v13 & 4) != 0)
    _sr_log("read_current_status, ack id %d, flags %d num_alerts %d  num_queued %d\n", v5, v7, *(_DWORD *)(v4 + 8), *(_DWORD *)(v4 + 12));
  return dump_status((unsigned __int8 *)v4);
}

_QWORD *obtain_symptom_framework(int a1, char *a2, size_t a3)
{
  _QWORD *result;
  _QWORD block[6];
  int v8;

  result = find_symptom_reporter_by_name(a1, a2, a3);
  if (!result)
  {
    if (framework_creation_queue_pred != -1)
      dispatch_once(&framework_creation_queue_pred, &__block_literal_global_0);
    block[0] = MEMORY[0x1E0C87450];
    block[1] = 0x40000000;
    block[2] = __obtain_symptom_framework_block_invoke;
    block[3] = &__block_descriptor_tmp_1;
    v8 = a1;
    block[4] = a2;
    block[5] = a3;
    dispatch_sync((dispatch_queue_t)framework_creation_queue_serialization_q, block);
    return find_symptom_reporter_by_name(a1, a2, a3);
  }
  return result;
}

void handle_symptom(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  int *v7;
  int v8;
  int *v9;
  unsigned int *v10;
  int v11;
  int *v12;
  int v13;
  int *v14;
  int v15;
  unsigned int v16;
  uint64_t *v17;
  uint64_t v18;
  __darwin_time_t tv_sec;
  __darwin_time_t v20;
  uint64_t v21;
  int *v22;
  int v23;
  int *v24;
  int v25;
  int v26;
  int *v27;
  int v28;
  unint64_t v29;
  const void **v30;
  const void *v31;
  int *v32;
  int v33;
  unint64_t v34;
  unint64_t v35;
  int *v36;
  int v37;
  int *v38;
  int v39;
  int *v40;
  int v41;
  int *v42;
  int v43;
  _WORD *v44;
  _WORD *v45;
  __int16 v46;
  char *symptom;
  unsigned __int16 v48;
  const char *v49;
  timeval v50;

  v6 = MEMORY[0x1E0C87FA0];
  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 320) == -1)
    v7 = *(int **)(MEMORY[0x1E0C87FA0] + 328);
  else
    v7 = (int *)_os_alloc_once();
  v8 = *v7;
  if ((*v7 & 2) != 0)
  {
    printf("handle_symptom entry, symptom pointer %p   sc filter seqno %d  sr seqno %d\n", a3, *(_DWORD *)(a2 + 56), *(_DWORD *)(a1 + 104));
    v8 = *v7;
  }
  if ((v8 & 4) != 0)
    _sr_log("handle_symptom entry, symptom pointer %p   sc filter seqno %d  sr seqno %d\n", a3, *(_DWORD *)(a2 + 56), *(_DWORD *)(a1 + 104));
  if (*(_DWORD *)(a2 + 56) == *(_DWORD *)(a1 + 104))
  {
    if (*(_QWORD *)(v6 + 320) == -1)
      v9 = *(int **)(v6 + 328);
    else
      v9 = (int *)_os_alloc_once();
    v10 = (unsigned int *)(a2 + 44);
    v11 = *v9;
    if ((*v9 & 2) != 0)
    {
      puts("handle_symptom: filter with sc filter");
      v11 = *v9;
    }
    if ((v11 & 4) != 0)
      _sr_log("handle_symptom: filter with sc filter\n");
  }
  else
  {
    if (*(_QWORD *)(v6 + 320) == -1)
      v12 = *(int **)(v6 + 328);
    else
      v12 = (int *)_os_alloc_once();
    v10 = (unsigned int *)(a1 + 88);
    v13 = *v12;
    if ((*v12 & 2) != 0)
    {
      puts("handle_symptom: filter with global filter");
      v13 = *v12;
    }
    if ((v13 & 4) != 0)
      _sr_log("handle_symptom: filter with global filter\n");
  }
  if (*(_QWORD *)(v6 + 320) == -1)
    v14 = *(int **)(v6 + 328);
  else
    v14 = (int *)_os_alloc_once();
  v15 = *v14;
  if ((*v14 & 2) != 0)
  {
    printf("filter_new_symptom: entry, q->sq_len %lu cf->cf_queue_len_max %d cf->cf_queue_len_alert %d\n", *(_QWORD *)(a2 + 64), v10[2], v10[1]);
    v15 = *v14;
  }
  if ((v15 & 4) != 0)
    _sr_log("filter_new_symptom: entry, q->sq_len %lu cf->cf_queue_len_max %d cf->cf_queue_len_alert %d\n", *(_QWORD *)(a2 + 64), v10[2], v10[1]);
  v16 = v10[2];
  if (!v16)
  {
    if (*(_QWORD *)(v6 + 320) == -1)
      v24 = *(int **)(v6 + 328);
    else
      v24 = (int *)_os_alloc_once();
    v25 = *v24;
    if ((*v24 & 2) != 0)
    {
      printf("filter_new_symptom: cf->cf_queue_len_max == 0, DROP");
      v25 = *v24;
    }
    if ((v25 & 4) != 0)
      _sr_log("filter_new_symptom: cf->cf_queue_len_max == 0, DROP");
    goto LABEL_58;
  }
  if (*v10)
  {
    v50.tv_sec = 0;
    *(_QWORD *)&v50.tv_usec = 0;
    gettimeofday(&v50, 0);
    v17 = (uint64_t *)(a2 + 72);
    v18 = *(_QWORD *)(a2 + 72);
    tv_sec = v50.tv_sec;
    v20 = *v10;
    if (v18 && v50.tv_sec - *(unsigned int *)(v18 + 24) > v20)
    {
      do
      {
        v21 = *(_QWORD *)v18;
        *v17 = *(_QWORD *)v18;
        if (!v21)
          *(_QWORD *)(a2 + 80) = v17;
        --*(_QWORD *)(a2 + 64);
        update_globals_for_symptom_removal(a1, (const void **)v18);
        if (*(_QWORD *)(v6 + 320) == -1)
          v22 = *(int **)(v6 + 328);
        else
          v22 = (int *)_os_alloc_once();
        v23 = *v22;
        if ((*v22 & 2) != 0)
        {
          puts("filter_new_symptom: DROP_HEAD (Age limit)");
          v23 = *v22;
        }
        if ((v23 & 4) != 0)
          _sr_log("filter_new_symptom: DROP_HEAD (Age limit)\n");
        symptom_free((_QWORD *)v18, "Too old");
        v18 = *v17;
        v20 = *v10;
      }
      while (*v17 && tv_sec - *(unsigned int *)(v18 + 24) > v20);
      v26 = 1025;
    }
    else
    {
      v26 = 1;
    }
    if (tv_sec - *((unsigned int *)a3 + 6) > v20)
    {
      if (*(_QWORD *)(v6 + 320) == -1)
        v27 = *(int **)(v6 + 328);
      else
        v27 = (int *)_os_alloc_once();
      v28 = *v27;
      if ((*v27 & 2) != 0)
      {
        printf("filter_new_symptom: too old DROP");
        v28 = *v27;
      }
      if ((v28 & 4) != 0)
        _sr_log("filter_new_symptom: too old DROP");
LABEL_58:
      v26 = 256;
      goto LABEL_86;
    }
    v16 = v10[2];
  }
  else
  {
    v26 = 1;
  }
  v29 = *(_QWORD *)(a2 + 64);
  if (v29 >= v16)
  {
    ++*(_QWORD *)(a1 + 304);
    v30 = *(const void ***)(a2 + 72);
    v31 = *v30;
    *(_QWORD *)(a2 + 72) = *v30;
    if (!v31)
      *(_QWORD *)(a2 + 80) = a2 + 72;
    *(_QWORD *)(a2 + 64) = v29 - 1;
    update_globals_for_symptom_removal(a1, v30);
    if (*(_QWORD *)(v6 + 320) == -1)
      v32 = *(int **)(v6 + 328);
    else
      v32 = (int *)_os_alloc_once();
    v33 = *v32;
    if ((*v32 & 2) != 0)
    {
      puts("filter_new_symptom: DROP_HEAD");
      v33 = *v32;
    }
    if ((v33 & 4) != 0)
      _sr_log("filter_new_symptom: DROP_HEAD\n");
    symptom_free(v30, "Queue length limit");
    v26 = 1025;
  }
  if (*((_BYTE *)a3 + 17) == 4)
  {
    v26 |= 0x2000u;
  }
  else
  {
    *a3 = 0;
    **(_QWORD **)(a2 + 80) = a3;
    *(_QWORD *)(a2 + 80) = a3;
    v34 = *(_QWORD *)(a2 + 64) + 1;
    *(_QWORD *)(a2 + 64) = v34;
    ++*(_QWORD *)(a1 + 120);
    v35 = v10[1];
    if (v34 >= v35)
    {
      if (*(_QWORD *)(v6 + 320) == -1)
        v36 = *(int **)(v6 + 328);
      else
        v36 = (int *)_os_alloc_once();
      v37 = *v36;
      if ((*v36 & 2) != 0)
      {
        printf("filter_new_symptom: q->sq_len %zdd >= cf->cf_queue_len_alert %d ALERT\n", v34, v35);
        v37 = *v36;
      }
      if ((v37 & 4) != 0)
        _sr_log("filter_new_symptom: q->sq_len %zdd >= cf->cf_queue_len_alert %d ALERT\n", *(_QWORD *)(a2 + 64), v10[1]);
      v26 |= 2u;
    }
  }
  if (*(_QWORD *)(v6 + 320) == -1)
    v38 = *(int **)(v6 + 328);
  else
    v38 = (int *)_os_alloc_once();
  v39 = *v38;
  if ((*v38 & 2) != 0)
  {
    printf("filter_new_symptom: return %x\n", v26);
    v39 = *v38;
  }
  if ((v39 & 4) != 0)
    _sr_log("filter_new_symptom: return %x\n", v26);
LABEL_86:
  if (*(_QWORD *)(v6 + 320) == -1)
    v40 = *(int **)(v6 + 328);
  else
    v40 = (int *)_os_alloc_once();
  v41 = *v40;
  if ((*v40 & 2) != 0)
  {
    printf("symptom_post action flags %x from filter %p\n", v26, v10);
    v41 = *v40;
  }
  if ((v41 & 4) != 0)
    _sr_log("symptom_post action flags %x from filter %p\n", v26, v10);
  sr_log_symptom_action((uint64_t)a3, v26);
  if ((v26 & 0x2000) != 0)
  {
    if (*(_QWORD *)(v6 + 320) == -1)
      v42 = *(int **)(v6 + 328);
    else
      v42 = (int *)_os_alloc_once();
    v43 = *v42;
    if ((*v42 & 2) != 0)
    {
      printf("push_symptom_to_nhm, symptom %p\n", a3);
      v43 = *v42;
    }
    if ((v43 & 4) != 0)
      _sr_log("push_symptom_to_nhm, symptom %p\n", a3);
    v44 = malloc_type_malloc(0x28A0uLL, 0xAA6ABA9DuLL);
    if (!v44)
    {
LABEL_109:
      if ((v26 & 0x100) == 0)
      {
        v49 = "Drop (immediate)";
LABEL_112:
        symptom_free(a3, v49);
        return;
      }
LABEL_111:
      ++*(_QWORD *)(a1 + 312);
      v49 = "Drop (filter)";
      goto LABEL_112;
    }
    v45 = v44;
    *((_DWORD *)v44 + 1) = 2359299;
    v46 = (_WORD)v44 + 8;
    fill_sender_id(a1, (uint64_t)(v44 + 4));
    v50.tv_sec = 10444;
    symptom = read_symptom((uint64_t)a3, (_DWORD *)v45 + 11, (unint64_t *)&v50);
    *(_DWORD *)symptom = 0;
    *v45 = 1;
    v48 = (_WORD)symptom - v46 + 8;
    v45[1] = v48;
    if (!*(_BYTE *)(a1 + 113))
    {
      connect_symptom_framework(a1);
      if (!*(_BYTE *)(a1 + 113))
      {
LABEL_108:
        free(v45);
        goto LABEL_109;
      }
      v48 = v45[1];
    }
    symptom_transport_send(a1, v45, v48 + 4);
    ++*(_QWORD *)(a1 + 288);
    goto LABEL_108;
  }
  if ((v26 & 2) != 0)
  {
    ensure_sym_ctrl_is_queued(a1, a2);
    ensure_alert(a1);
  }
  if ((v26 & 0x100) != 0)
    goto LABEL_111;
}

uint64_t get_symptom_qual_size(uint64_t a1)
{
  uint64_t **v1;
  uint64_t result;

  v1 = *(uint64_t ***)(a1 + 104);
  if (!v1)
    return 0;
  result = 0;
  do
  {
    result += *((unsigned __int16 *)v1 + 7) + 4;
    v1 = (uint64_t **)*v1;
  }
  while (v1);
  return result;
}

uint64_t get_symptom_qual_count(uint64_t a1)
{
  uint64_t *v1;
  uint64_t result;

  v1 = *(uint64_t **)(a1 + 104);
  if (!v1)
    return 0;
  result = 0;
  do
  {
    if ((*((_BYTE *)v1 + 19) & 0x40) == 0)
      ++result;
    v1 = (uint64_t *)*v1;
  }
  while (v1);
  return result;
}

_QWORD *get_symptom_ctrl(_QWORD *a1, int a2)
{
  _QWORD *result;
  uint64_t v5;

  result = (_QWORD *)a1[5];
  if (result)
  {
    while (*((_DWORD *)result + 2) != a2)
    {
      result = (_QWORD *)result[2];
      if (!result)
        goto LABEL_4;
    }
  }
  else
  {
LABEL_4:
    result = malloc_type_calloc(1uLL, 0x58uLL, 0x10A0040C61C5460uLL);
    if (result)
    {
      *result = 3435986669;
      *((_DWORD *)result + 2) = a2;
      *((_DWORD *)result + 14) = 0;
      result[9] = 0;
      result[8] = 0;
      result[10] = result + 9;
      v5 = a1[5];
      result[2] = v5;
      if (!v5)
        a1[6] = result + 2;
      a1[5] = result;
      ++a1[7];
    }
  }
  return result;
}

_QWORD *find_symptom_reporter_by_name(int a1, char *__s2, size_t __n)
{
  uint64_t v6;
  int *v7;
  int v8;
  uint64_t v9;
  _QWORD *v10;
  int *v11;
  int v12;
  int *v13;
  int v14;

  v6 = MEMORY[0x1E0C87FA0];
  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 320) == -1)
    v7 = *(int **)(MEMORY[0x1E0C87FA0] + 328);
  else
    v7 = (int *)_os_alloc_once();
  v8 = *v7;
  if ((*v7 & 2) != 0)
  {
    printf("find_symptom_reporter_by_name  %s   len %ld\n", __s2, __n);
    v8 = *v7;
  }
  if ((v8 & 4) != 0)
    _sr_log("find_symptom_reporter_by_name  %s   len %ld\n", __s2, __n);
  if (*(_QWORD *)(v6 + 320) == -1)
  {
    v9 = *(_QWORD *)(v6 + 328);
    if (!v9)
      goto LABEL_23;
  }
  else
  {
    v9 = _os_alloc_once();
    if (!v9)
      goto LABEL_23;
  }
  v10 = *(_QWORD **)(v9 + 8);
  if (v10)
  {
    while (1)
    {
      if (*(_QWORD *)(v6 + 320) == -1)
        v11 = *(int **)(v6 + 328);
      else
        v11 = (int *)_os_alloc_once();
      v12 = *v11;
      if ((*v11 & 2) != 0)
      {
        printf("find_symptom_reporter_by_name  check sr %p name len %ld\n", v10, v10[4]);
        v12 = *v11;
      }
      if ((v12 & 4) != 0)
        _sr_log("find_symptom_reporter_by_name  check sr %p name len %ld\n", v10, v10[4]);
      if (*((_DWORD *)v10 + 3) == a1 && v10[4] == __n && !strncmp((const char *)v10[3], __s2, __n))
        return v10;
      v10 = (_QWORD *)*v10;
      if (!v10)
      {
        if (*(_QWORD *)(v6 + 320) == -1)
          break;
        v13 = (int *)_os_alloc_once();
        goto LABEL_24;
      }
    }
  }
LABEL_23:
  v13 = *(int **)(v6 + 328);
LABEL_24:
  v14 = *v13;
  if ((*v13 & 2) != 0)
  {
    puts("find_symptom_reporter_by_name  returns NULL");
    v14 = *v13;
  }
  if ((v14 & 4) != 0)
    _sr_log("find_symptom_reporter_by_name  returns NULL\n");
  return 0;
}

void ensure_symptom_framework_connect(uint64_t a1)
{
  uint64_t v2;
  int *v3;
  int v4;
  __darwin_time_t tv_sec;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  unint64_t v9;
  int *v10;
  int v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  int *v15;
  int v16;
  unint64_t v17;
  dispatch_time_t v18;
  NSObject *v19;
  _QWORD block[5];
  timeval v21;

  v2 = MEMORY[0x1E0C87FA0];
  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 320) == -1)
    v3 = *(int **)(MEMORY[0x1E0C87FA0] + 328);
  else
    v3 = (int *)_os_alloc_once();
  v4 = *v3;
  if ((*v3 & 2) != 0)
  {
    printf("ensure_symptom_framework_connect %s, set sr_connect_queued\n", *(const char **)(a1 + 24));
    v4 = *v3;
  }
  if ((v4 & 4) != 0)
    _sr_log("ensure_symptom_framework_connect %s, set sr_connect_queued\n", *(const char **)(a1 + 24));
  v21.tv_sec = 0;
  *(_QWORD *)&v21.tv_usec = 0;
  *(_BYTE *)(a1 + 216) = 1;
  gettimeofday(&v21, 0);
  tv_sec = v21.tv_sec;
  v6 = *(_QWORD *)(a1 + 160);
  v7 = __OFSUB__(v21.tv_sec, v6);
  v8 = v21.tv_sec - v6;
  if (v8 < 0 != v7)
    v9 = 0;
  else
    v9 = v8;
  if (*(_QWORD *)(v2 + 320) == -1)
    v10 = *(int **)(v2 + 328);
  else
    v10 = (int *)_os_alloc_once();
  v11 = *v10;
  if ((*v10 & 2) != 0)
  {
    printf("ensure_connect, update backoff value, uptime_secs %lu\n", v9);
    v11 = *v10;
  }
  if ((v11 & 4) != 0)
    _sr_log("ensure_connect, update backoff value, uptime_secs %lu\n", v9);
  if (v9 < 0x259)
  {
    v12 = *(_QWORD *)(a1 + 192);
    if (v12 < 0x8BB2C97000)
    {
      v12 *= 2;
      v13 = 2 * *(_QWORD *)(a1 + 200);
      *(_QWORD *)(a1 + 192) = v12;
      *(_QWORD *)(a1 + 200) = v13;
    }
    if (v12 > 0x8BB2C97000)
    {
      *(_QWORD *)(a1 + 192) = 600000000000;
      v12 = 600000000000;
    }
    if (*(_QWORD *)(a1 + 200) > 0xB2D05E00uLL)
      *(_QWORD *)(a1 + 200) = 3000000000;
  }
  else
  {
    v12 = 100000000;
    *(int64x2_t *)(a1 + 192) = vdupq_n_s64(0x5F5E100uLL);
  }
  v14 = (unint64_t)rand_r((unsigned int *)(a1 + 208)) % *(_QWORD *)(a1 + 200) + v12;
  if (*(_QWORD *)(v2 + 320) == -1)
    v15 = *(int **)(v2 + 328);
  else
    v15 = (int *)_os_alloc_once();
  v16 = *v15;
  if ((*v15 & 2) != 0)
  {
    printf("delay_after_interruption is %lld nanoseconds\n", v14);
    v16 = *v15;
  }
  if ((v16 & 4) != 0)
    _sr_log("delay_after_interruption is %lld nanoseconds\n", v14);
  v17 = 1000000000 * (tv_sec - *(_QWORD *)(a1 + 176));
  if (v14 <= v17)
  {
    connect_symptom_framework(a1);
  }
  else
  {
    v18 = dispatch_time(0, v14 - v17);
    v19 = *(NSObject **)(a1 + 128);
    block[0] = MEMORY[0x1E0C87450];
    block[1] = 0x40000000;
    block[2] = __ensure_symptom_framework_connect_block_invoke;
    block[3] = &__block_descriptor_tmp_57;
    block[4] = a1;
    dispatch_after(v18, v19, block);
  }
}

uint64_t ensure_sym_ctrl_is_queued(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int *v5;
  int v6;
  _QWORD *v7;
  uint64_t v8;
  int *v9;
  int v10;

  v4 = MEMORY[0x1E0C87FA0];
  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 320) == -1)
    v5 = *(int **)(MEMORY[0x1E0C87FA0] + 328);
  else
    v5 = (int *)_os_alloc_once();
  v6 = *v5;
  if ((*v5 & 2) != 0)
  {
    printf("ensure_sym_ctrl_is_queued, sc %p, in use %d\n", (const void *)a2, *(unsigned __int8 *)(a2 + 40));
    v6 = *v5;
  }
  if ((v6 & 4) != 0)
    _sr_log("ensure_sym_ctrl_is_queued, sc %p, in use %d\n", (const void *)a2, *(unsigned __int8 *)(a2 + 40));
  if (!*(_BYTE *)(a2 + 40))
  {
    *(_BYTE *)(a2 + 40) = 1;
    *(_QWORD *)(a2 + 24) = 0;
    v7 = *(_QWORD **)(a1 + 72);
    v8 = *(_QWORD *)(a1 + 80);
    *(_QWORD *)(a2 + 32) = v7;
    *v7 = a2;
    *(_QWORD *)(a1 + 72) = a2 + 24;
    *(_QWORD *)(a1 + 80) = v8 + 1;
  }
  if (*(_QWORD *)(v4 + 320) == -1)
    v9 = *(int **)(v4 + 328);
  else
    v9 = (int *)_os_alloc_once();
  v10 = *v9;
  if ((*v9 & 2) != 0)
  {
    printf("After ensure_sym_ctrl_is_queued %p\n", (const void *)a2);
    v10 = *v9;
  }
  if ((v10 & 4) != 0)
    _sr_log("After ensure_sym_ctrl_is_queued %p\n", (const void *)a2);
  return dump_symptom_state(a1);
}

void ensure_alert(uint64_t a1)
{
  int v2;
  uint64_t v3;
  _OWORD v4[3];
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C874D8];
  if (*(_BYTE *)(a1 + 113))
  {
    v2 = *(_DWORD *)(a1 + 16);
    if (v2 == 2)
    {
      if (!*(_BYTE *)(a1 + 112))
        send_current(a1);
    }
    else if (v2 == 1 && !*(_BYTE *)(a1 + 114))
    {
      v5 = 0;
      memset(v4, 0, sizeof(v4));
      v3 = 0x30000700380001;
      read_current_status(a1, (uint64_t)v4, 0, 2);
      v5 = 0;
      symptom_transport_send(a1, &v3, 0x3CuLL);
      ++*(_QWORD *)(a1 + 272);
      sr_log_status_send(a1, (uint64_t)&v3);
      *(_BYTE *)(a1 + 114) = 1;
    }
  }
  else if (!*(_BYTE *)(a1 + 216))
  {
    ensure_symptom_framework_connect(a1);
  }
}

_DWORD *dump_system_reporter(uint64_t a1)
{
  uint64_t v2;
  _DWORD *v3;
  _DWORD *v4;
  _DWORD *v5;
  _DWORD *v6;
  _DWORD *v7;
  _DWORD *v8;
  _DWORD *v9;
  _DWORD *v10;
  _DWORD *result;

  v2 = MEMORY[0x1E0C87FA0];
  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 320) == -1)
    v3 = *(_DWORD **)(MEMORY[0x1E0C87FA0] + 328);
  else
    v3 = (_DWORD *)_os_alloc_once();
  if ((~*v3 & 0xA) != 0 || (puts("System global... "), *(_QWORD *)(v2 + 320) == -1))
    v4 = *(_DWORD **)(v2 + 328);
  else
    v4 = (_DWORD *)_os_alloc_once();
  if ((~*v4 & 0xA) != 0
    || (printf(" sr_ctrl_head        first, last  %p %p\n", *(const void **)(a1 + 40), *(const void **)(a1 + 48)),
        *(_QWORD *)(v2 + 320) == -1))
  {
    v5 = *(_DWORD **)(v2 + 328);
  }
  else
  {
    v5 = (_DWORD *)_os_alloc_once();
  }
  if ((~*v5 & 0xA) != 0 || (printf(" sr_ctrl_num    %lu\n", *(_QWORD *)(a1 + 56)), *(_QWORD *)(v2 + 320) == -1))
    v6 = *(_DWORD **)(v2 + 328);
  else
    v6 = (_DWORD *)_os_alloc_once();
  if ((~*v6 & 0xA) != 0
    || (printf(" sr_ctrl_active_head first, last  %p %p\n", *(const void **)(a1 + 64), *(const void **)(a1 + 72)),
        *(_QWORD *)(v2 + 320) == -1))
  {
    v7 = *(_DWORD **)(v2 + 328);
  }
  else
  {
    v7 = (_DWORD *)_os_alloc_once();
  }
  if ((~*v7 & 0xA) != 0 || (printf(" sr_num_active  %lu\n", *(_QWORD *)(a1 + 80)), *(_QWORD *)(v2 + 320) == -1))
    v8 = *(_DWORD **)(v2 + 328);
  else
    v8 = (_DWORD *)_os_alloc_once();
  if ((~*v8 & 0xA) == 0)
    puts(" sr_filter ...");
  dump_creation_filter((_DWORD *)(a1 + 88));
  if (*(_QWORD *)(v2 + 320) == -1)
    v9 = *(_DWORD **)(v2 + 328);
  else
    v9 = (_DWORD *)_os_alloc_once();
  if ((~*v9 & 0xA) != 0 || (printf(" sr_filter_seqno  %u\n", *(_DWORD *)(a1 + 104)), *(_QWORD *)(v2 + 320) == -1))
    v10 = *(_DWORD **)(v2 + 328);
  else
    v10 = (_DWORD *)_os_alloc_once();
  if ((~*v10 & 0xA) != 0
    || (printf(" sr_alert_sent       %d\n", *(unsigned __int8 *)(a1 + 114)), *(_QWORD *)(v2 + 320) == -1))
  {
    result = *(_DWORD **)(v2 + 328);
  }
  else
  {
    result = (_DWORD *)_os_alloc_once();
  }
  if ((~*result & 0xA) == 0)
    return (_DWORD *)printf(" sr_q_counts         %lu\n", *(_QWORD *)(a1 + 120));
  return result;
}

uint64_t dump_symptom_state(uint64_t a1)
{
  dump_system_reporter(a1);
  dump_idents(a1);
  return dump_active_idents(a1);
}

uint64_t dump_symptom(const void **a1)
{
  uint64_t v2;
  _DWORD *v3;
  _DWORD *v4;
  _DWORD *v5;

  v2 = MEMORY[0x1E0C87FA0];
  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 320) == -1)
    v3 = *(_DWORD **)(MEMORY[0x1E0C87FA0] + 328);
  else
    v3 = (_DWORD *)_os_alloc_once();
  if ((~*v3 & 0xA) != 0 || (printf(" Symptom at %p\n", a1), *(_QWORD *)(v2 + 320) == -1))
    v4 = *(_DWORD **)(v2 + 328);
  else
    v4 = (_DWORD *)_os_alloc_once();
  if ((~*v4 & 0xA) != 0 || (printf("   s_link next  %p\n", *a1), *(_QWORD *)(v2 + 320) == -1))
    v5 = *(_DWORD **)(v2 + 328);
  else
    v5 = (_DWORD *)_os_alloc_once();
  if ((~*v5 & 0xA) == 0)
    printf("   s_magic      %x\n", *((_DWORD *)a1 + 2));
  return dump_basic_symptom((unsigned __int8 *)a1 + 16);
}

_DWORD *dump_status(unsigned __int8 *a1)
{
  uint64_t v2;
  _DWORD *v3;
  _DWORD *v4;
  _DWORD *v5;
  _DWORD *v6;
  _DWORD *v7;
  _DWORD *v8;
  _DWORD *result;

  v2 = MEMORY[0x1E0C87FA0];
  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 320) == -1)
    v3 = *(_DWORD **)(MEMORY[0x1E0C87FA0] + 328);
  else
    v3 = (_DWORD *)_os_alloc_once();
  if ((~*v3 & 0xA) != 0 || (puts("Reporter status:"), *(_QWORD *)(v2 + 320) == -1))
    v4 = *(_DWORD **)(v2 + 328);
  else
    v4 = (_DWORD *)_os_alloc_once();
  if ((~*v4 & 0xA) != 0 || (printf("srs_version             %d\n", *a1), *(_QWORD *)(v2 + 320) == -1))
    v5 = *(_DWORD **)(v2 + 328);
  else
    v5 = (_DWORD *)_os_alloc_once();
  if ((~*v5 & 0xA) != 0 || (printf("srs_flags               %0x\n", a1[2]), *(_QWORD *)(v2 + 320) == -1))
    v6 = *(_DWORD **)(v2 + 328);
  else
    v6 = (_DWORD *)_os_alloc_once();
  if ((~*v6 & 0xA) != 0
    || (printf("srs_ack_id              %0x\n", *((_DWORD *)a1 + 1)), *(_QWORD *)(v2 + 320) == -1))
  {
    v7 = *(_DWORD **)(v2 + 328);
  }
  else
  {
    v7 = (_DWORD *)_os_alloc_once();
  }
  if ((~*v7 & 0xA) != 0 || (printf("srs_num_alerts          %d\n", *((_DWORD *)a1 + 2)), *(_QWORD *)(v2 + 320) == -1))
    v8 = *(_DWORD **)(v2 + 328);
  else
    v8 = (_DWORD *)_os_alloc_once();
  if ((~*v8 & 0xA) != 0 || (printf("srs_num_queued          %d\n", *((_DWORD *)a1 + 3)), *(_QWORD *)(v2 + 320) == -1))
    result = *(_DWORD **)(v2 + 328);
  else
    result = (_DWORD *)_os_alloc_once();
  if ((~*result & 0xA) == 0)
    return (_DWORD *)puts("srs_sym_basic   ...");
  return result;
}

uint64_t dump_idents(uint64_t a1)
{
  uint64_t result;
  uint64_t i;

  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 320) == -1)
    result = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 328);
  else
    result = _os_alloc_once();
  if ((~*(_DWORD *)result & 0xA) == 0)
    result = puts("dump_idents.. ");
  for (i = *(_QWORD *)(a1 + 40); i; i = *(_QWORD *)(i + 16))
    result = (uint64_t)dump_ident((const void **)i);
  return result;
}

_DWORD *dump_ident(const void **a1)
{
  uint64_t v2;
  _DWORD *v3;
  _DWORD *v4;
  _DWORD *v5;
  _DWORD *v6;
  _DWORD *v7;
  _DWORD *v8;
  _DWORD *v9;
  _DWORD *v10;
  _DWORD *v11;
  _DWORD *result;

  v2 = MEMORY[0x1E0C87FA0];
  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 320) == -1)
    v3 = *(_DWORD **)(MEMORY[0x1E0C87FA0] + 328);
  else
    v3 = (_DWORD *)_os_alloc_once();
  if ((~*v3 & 0xA) != 0 || (printf("symptom_ctrl at %p\n", a1), *(_QWORD *)(v2 + 320) == -1))
    v4 = *(_DWORD **)(v2 + 328);
  else
    v4 = (_DWORD *)_os_alloc_once();
  if ((~*v4 & 0xA) != 0 || (printf(" sc_magic               %x\n", *(_DWORD *)a1), *(_QWORD *)(v2 + 320) == -1))
    v5 = *(_DWORD **)(v2 + 328);
  else
    v5 = (_DWORD *)_os_alloc_once();
  if ((~*v5 & 0xA) != 0 || (printf(" sc_flags               %x\n", *((_DWORD *)a1 + 1)), *(_QWORD *)(v2 + 320) == -1))
    v6 = *(_DWORD **)(v2 + 328);
  else
    v6 = (_DWORD *)_os_alloc_once();
  if ((~*v6 & 0xA) != 0 || (printf(" sc_id                  %x\n", *((_DWORD *)a1 + 2)), *(_QWORD *)(v2 + 320) == -1))
    v7 = *(_DWORD **)(v2 + 328);
  else
    v7 = (_DWORD *)_os_alloc_once();
  if ((~*v7 & 0xA) != 0 || (printf(" sc_link                %p\n", a1[2]), *(_QWORD *)(v2 + 320) == -1))
    v8 = *(_DWORD **)(v2 + 328);
  else
    v8 = (_DWORD *)_os_alloc_once();
  if ((~*v8 & 0xA) != 0 || (printf(" sc_active_link         %p\n", a1[3]), *(_QWORD *)(v2 + 320) == -1))
    v9 = *(_DWORD **)(v2 + 328);
  else
    v9 = (_DWORD *)_os_alloc_once();
  if ((~*v9 & 0xA) != 0
    || (printf(" sc_active_link_in_use  %d\n", *((unsigned __int8 *)a1 + 40)), *(_QWORD *)(v2 + 320) == -1))
  {
    v10 = *(_DWORD **)(v2 + 328);
  }
  else
  {
    v10 = (_DWORD *)_os_alloc_once();
  }
  if ((~*v10 & 0xA) == 0)
    puts(" sc_filter ...");
  dump_creation_filter((_DWORD *)a1 + 11);
  if (*(_QWORD *)(v2 + 320) == -1)
    v11 = *(_DWORD **)(v2 + 328);
  else
    v11 = (_DWORD *)_os_alloc_once();
  if ((~*v11 & 0xA) != 0 || (printf(" sc_symptom_q len %lu\n", a1[8]), *(_QWORD *)(v2 + 320) == -1))
    result = *(_DWORD **)(v2 + 328);
  else
    result = (_DWORD *)_os_alloc_once();
  if ((~*result & 0xA) == 0)
    return (_DWORD *)printf(" sc_symptom_q first, last %p %p\n", a1[9], a1[10]);
  return result;
}

_DWORD *dump_creation_filter(_DWORD *a1)
{
  uint64_t v2;
  _DWORD *v3;
  _DWORD *v4;
  _DWORD *result;

  v2 = MEMORY[0x1E0C87FA0];
  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 320) == -1)
    v3 = *(_DWORD **)(MEMORY[0x1E0C87FA0] + 328);
  else
    v3 = (_DWORD *)_os_alloc_once();
  if ((~*v3 & 0xA) != 0 || (printf("    cf_queue_len_max    %x\n", a1[2]), *(_QWORD *)(v2 + 320) == -1))
    v4 = *(_DWORD **)(v2 + 328);
  else
    v4 = (_DWORD *)_os_alloc_once();
  if ((~*v4 & 0xA) != 0 || (printf("    cf_queue_len_alert  %x\n", a1[1]), *(_QWORD *)(v2 + 320) == -1))
    result = *(_DWORD **)(v2 + 328);
  else
    result = (_DWORD *)_os_alloc_once();
  if ((~*result & 0xA) == 0)
    return (_DWORD *)printf("    cf_filter_seqno     %x\n", a1[3]);
  return result;
}

uint64_t dump_basic_symptom(unsigned __int8 *a1)
{
  uint64_t v2;
  _DWORD *v3;
  _DWORD *v4;
  _DWORD *v5;
  _DWORD *v6;
  _DWORD *v7;
  uint64_t v8;
  uint64_t i;
  uint64_t result;

  v2 = MEMORY[0x1E0C87FA0];
  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 320) == -1)
    v3 = *(_DWORD **)(MEMORY[0x1E0C87FA0] + 328);
  else
    v3 = (_DWORD *)_os_alloc_once();
  if ((~*v3 & 0xA) != 0 || (printf(" sb_version         %d\n", *a1), *(_QWORD *)(v2 + 320) == -1))
    v4 = *(_DWORD **)(v2 + 328);
  else
    v4 = (_DWORD *)_os_alloc_once();
  if ((~*v4 & 0xA) != 0 || (printf(" sb_flags           %x\n", *((_DWORD *)a1 + 1)), *(_QWORD *)(v2 + 320) == -1))
    v5 = *(_DWORD **)(v2 + 328);
  else
    v5 = (_DWORD *)_os_alloc_once();
  if ((~*v5 & 0xA) != 0 || (printf(" sb_timestamp_secs  %d\n", *((_DWORD *)a1 + 2)), *(_QWORD *)(v2 + 320) == -1))
    v6 = *(_DWORD **)(v2 + 328);
  else
    v6 = (_DWORD *)_os_alloc_once();
  if ((~*v6 & 0xA) != 0 || (printf(" sb_timestamp_nsecs %d\n", *((_DWORD *)a1 + 3)), *(_QWORD *)(v2 + 320) == -1))
    v7 = *(_DWORD **)(v2 + 328);
  else
    v7 = (_DWORD *)_os_alloc_once();
  if ((~*v7 & 0xA) != 0)
  {
    v8 = -1;
  }
  else
  {
    printf(" sb_ident           %d\n", *((_DWORD *)a1 + 4));
    v8 = *(_QWORD *)(v2 + 320);
  }
  for (i = 0; i != 8; ++i)
  {
    if (v8 == -1)
      result = *(_QWORD *)(v2 + 328);
    else
      result = _os_alloc_once();
    if ((~*(_DWORD *)result & 0xA) != 0)
    {
      v8 = -1;
    }
    else
    {
      result = printf(" sb_qualifier[%d]    %llx\n", i, *(_QWORD *)&a1[8 * i + 24]);
      v8 = *(_QWORD *)(v2 + 320);
    }
  }
  return result;
}

uint64_t dump_active_idents(uint64_t a1)
{
  uint64_t result;
  uint64_t i;

  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 320) == -1)
    result = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 328);
  else
    result = _os_alloc_once();
  if ((~*(_DWORD *)result & 0xA) == 0)
    result = puts("dump_active_idents.. ");
  for (i = *(_QWORD *)(a1 + 64); i; i = *(_QWORD *)(i + 24))
    result = (uint64_t)dump_ident((const void **)i);
  return result;
}

uint64_t connect_symptom_framework(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  int *v3;
  int v4;
  uint64_t v5;
  int *v6;
  int v7;
  uint64_t v8;
  int *v9;
  int v10;
  int *v11;
  int v12;
  int *v13;
  int v14;

  v1 = result;
  v2 = MEMORY[0x1E0C87FA0];
  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 320) == -1)
  {
    v3 = *(int **)(MEMORY[0x1E0C87FA0] + 328);
  }
  else
  {
    result = _os_alloc_once();
    v3 = (int *)result;
  }
  v4 = *v3;
  if ((*v3 & 2) != 0)
  {
    result = puts("connect_symptom_framework called");
    v4 = *v3;
  }
  if ((v4 & 4) != 0)
    result = _sr_log("connect_symptom_framework called\n");
  if (*(_QWORD *)(v1 + 136))
  {
    v5 = *(_QWORD *)(v2 + 320);
LABEL_10:
    ++*(_QWORD *)(v1 + 344);
    *(_WORD *)(v1 + 113) = 1;
    if (v5 == -1)
    {
      v6 = *(int **)(v2 + 328);
    }
    else
    {
      result = _os_alloc_once();
      v6 = (int *)result;
    }
    v7 = *v6;
    if ((*v6 & 2) != 0)
    {
      result = printf("connect_symptom_framework: %s transport connect OK, unset sr_connect_queued\n", *(const char **)(v1 + 24));
      v7 = *v6;
    }
    if ((v7 & 4) != 0)
      result = _sr_log("connect_symptom_framework: %s transport connect OK, unset sr_connect_queued\n", *(const char **)(v1 + 24));
    *(_BYTE *)(v1 + 216) = 0;
    v8 = *(_QWORD *)(v2 + 320);
    if (*(_QWORD *)(v1 + 80))
    {
      if (v8 == -1)
        v9 = *(int **)(v2 + 328);
      else
        v9 = (int *)_os_alloc_once();
      v10 = *v9;
      if ((*v9 & 2) != 0)
      {
        puts("connect_symptom_framework: ensure_alert");
        v10 = *v9;
      }
      if ((v10 & 4) != 0)
        _sr_log("connect_symptom_framework: ensure_alert\n");
      result = ensure_alert(v1);
      v8 = *(_QWORD *)(v2 + 320);
    }
    if (v8 == -1)
    {
      v11 = *(int **)(v2 + 328);
    }
    else
    {
      result = _os_alloc_once();
      v11 = (int *)result;
    }
    v12 = *v11;
    if ((*v11 & 2) != 0)
    {
      result = puts("connect_symptom_framework: exit");
      v12 = *v11;
    }
    if ((v12 & 4) != 0)
      return _sr_log("connect_symptom_framework: exit\n");
    return result;
  }
  result = symptom_transport_connect(v1);
  v5 = *(_QWORD *)(v2 + 320);
  if ((result & 0x80000000) == 0)
    goto LABEL_10;
  if (v5 == -1)
    v13 = *(int **)(v2 + 328);
  else
    v13 = (int *)_os_alloc_once();
  v14 = *v13;
  if ((*v13 & 2) != 0)
  {
    printf("connect_symptom_framework: %s transport connect failed, unset sr_connect_queued\n", *(const char **)(v1 + 24));
    v14 = *v13;
  }
  if ((v14 & 4) != 0)
    _sr_log("connect_symptom_framework: %s transport connect failed, unset sr_connect_queued\n", *(const char **)(v1 + 24));
  *(_BYTE *)(v1 + 216) = 0;
  return ensure_symptom_framework_connect(v1);
}

void _symptoms_globals_init(uint64_t a1)
{
  if (_dispatch_is_fork_of_multithreaded_parent())
  {
    *(_BYTE *)(a1 + 32) = -1;
  }
  else if (_dispatch_is_multithreaded() && *(_QWORD *)(a1 + 24) != -1)
  {
    dispatch_once_f((dispatch_once_t *)(a1 + 24), (void *)a1, (dispatch_function_t)symptoms_go_multithreaded);
  }
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = a1 + 8;
}

void __symptom_transport_connect_block_invoke(uint64_t a1, void *a2)
{
  const void *v4;
  uint64_t v5;
  int *v6;
  int v7;
  int *v8;
  int v9;
  int *v10;
  int v11;
  const char **v12;
  const char *string;
  const char *v14;
  uint64_t v15;
  int *v16;
  int v17;
  const char *v18;
  const char *v19;
  int *v20;
  int v21;
  _QWORD *v22;
  unsigned __int16 *data;
  uint64_t v24;
  unsigned __int16 *v25;
  int *v26;
  int v27;
  size_t v28;
  size_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  unsigned int v34;
  uint64_t v35;
  int *v36;
  int v37;
  int *v38;
  int v39;
  int *v40;
  int v41;
  int *v42;
  int v43;
  unint64_t v44;
  size_t length;

  v4 = (const void *)MEMORY[0x1CAA41294](a2);
  v5 = MEMORY[0x1E0C87FA0];
  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 320) == -1)
    v6 = *(int **)(MEMORY[0x1E0C87FA0] + 328);
  else
    v6 = (int *)_os_alloc_once();
  v7 = *v6;
  if ((*v6 & 2) != 0)
  {
    printf("symptom_transport_connect event handler called on %p for %p evcount %lu errcount %lu\n", *(const void **)(a1 + 32), a2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 240));
    v7 = *v6;
  }
  if ((v7 & 4) != 0)
    _sr_log("symptom_transport_connect event handler called on %p for %p evcount %lu errcount %lu\n", *(const void **)(a1 + 32), a2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 240));
  if (v4 != (const void *)MEMORY[0x1E0C89000])
  {
    if (v4 == (const void *)MEMORY[0x1E0C88FE8])
    {
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152) = 0;
      if (*(_QWORD *)(v5 + 320) == -1)
        v20 = *(int **)(v5 + 328);
      else
        v20 = (int *)_os_alloc_once();
      v21 = *v20;
      if ((*v20 & 2) != 0)
      {
        printf("handling incoming message");
        v21 = *v20;
      }
      if ((v21 & 4) != 0)
        _sr_log("handling incoming message");
      v22 = *(_QWORD **)(a1 + 32);
      length = 0;
      data = (unsigned __int16 *)xpc_dictionary_get_data(a2, "payload", &length);
      v24 = *(_QWORD *)(v5 + 320);
      if (data)
      {
        v25 = data;
        if (v24 == -1)
          v26 = *(int **)(v5 + 328);
        else
          v26 = (int *)_os_alloc_once();
        v27 = *v26;
        if ((*v26 & 2) != 0)
        {
          printf("handle_incoming_xpc_dictionary:  desc %p size %lu\n", v25, length);
          v27 = *v26;
        }
        if ((v27 & 4) != 0)
          _sr_log("handle_incoming_xpc_dictionary:  desc %p size %lu\n", v25, length);
        v28 = length;
        v29 = v22[29] + length;
        ++v22[28];
        v22[29] = v29;
        symptoms_incoming_message((uint64_t)v22, v25, v28);
      }
      else
      {
        if (v24 == -1)
          v36 = *(int **)(v5 + 328);
        else
          v36 = (int *)_os_alloc_once();
        v37 = *v36;
        if ((*v36 & 2) != 0)
        {
          printf("handle_incoming_xpc_dictionary:  ERR message with no payload");
          v37 = *v36;
        }
        if ((v37 & 4) != 0)
          _sr_log("handle_incoming_xpc_dictionary:  ERR message with no payload");
        ++v22[30];
      }
    }
    else
    {
      if (*(_QWORD *)(v5 + 320) == -1)
        v8 = *(int **)(v5 + 328);
      else
        v8 = (int *)_os_alloc_once();
      v9 = *v8;
      if ((*v8 & 2) != 0)
      {
        printf("unexpected message from peer %p", v4);
        v9 = *v8;
      }
      if ((v9 & 4) != 0)
        _sr_log("unexpected message from peer %p", v4);
      ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 240);
    }
    return;
  }
  if (*(_QWORD *)(v5 + 320) == -1)
    v10 = *(int **)(v5 + 328);
  else
    v10 = (int *)_os_alloc_once();
  v11 = *v10;
  v12 = (const char **)MEMORY[0x1E0C88FA8];
  if ((*v10 & 2) != 0)
  {
    string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x1E0C88FA8]);
    printf("connection error: %s\n", string);
    v11 = *v10;
  }
  if ((v11 & 4) != 0)
  {
    v14 = xpc_dictionary_get_string(a2, *v12);
    _sr_log("connection error: %s\n", v14);
  }
  if (a2 == (void *)MEMORY[0x1E0C88F98])
  {
    _sr_log("%s: %s", *(const char **)(*(_QWORD *)(a1 + 32) + 24), "SymptomReporter: XPC connection to Symptom Framework interrupted\n");
    v30 = *(_QWORD *)(a1 + 32);
    ++*(_QWORD *)(v30 + 144);
    *(_BYTE *)(v30 + 113) = 0;
    ++*(_QWORD *)(v30 + 328);
    goto LABEL_46;
  }
  if (a2 != (void *)MEMORY[0x1E0C88FA0])
  {
    v15 = *(_QWORD *)(v5 + 320);
    if (a2 == (void *)MEMORY[0x1E0C88FB0])
    {
      if (v15 == -1)
        v38 = *(int **)(v5 + 328);
      else
        v38 = (int *)_os_alloc_once();
      v39 = *v38;
      if ((*v38 & 2) != 0)
      {
        puts("symptom_transport: skipping TERMINATION_IMMINENT event");
        v39 = *v38;
      }
      if ((v39 & 4) != 0)
        _sr_log("symptom_transport: skipping TERMINATION_IMMINENT event\n");
    }
    else
    {
      if (v15 == -1)
        v16 = *(int **)(v5 + 328);
      else
        v16 = (int *)_os_alloc_once();
      v17 = *v16;
      if ((*v16 & 2) != 0)
      {
        v18 = xpc_dictionary_get_string(a2, *v12);
        printf("symptom_transport: unhandled connection error: %s", v18);
        v17 = *v16;
      }
      if ((v17 & 4) != 0)
      {
        v19 = xpc_dictionary_get_string(a2, *v12);
        _sr_log("symptom_transport: unhandled connection error: %s", v19);
      }
    }
    return;
  }
  v31 = *(_QWORD *)(a1 + 32);
  v32 = *(void **)(v31 + 136);
  if (v32)
  {
    xpc_release(v32);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136) = 0;
    v31 = *(_QWORD *)(a1 + 32);
  }
  *(_QWORD *)(v31 + 136) = 0;
  v33 = *(_QWORD *)(a1 + 32);
  *(_BYTE *)(v33 + 113) = 0;
  ++*(_QWORD *)(v33 + 336);
  v34 = *(_DWORD *)(v33 + 212) + 1;
  *(_DWORD *)(v33 + 212) = v34;
  if (v34 >= 2)
  {
    *(_DWORD *)(v33 + 212) = 0;
    v35 = *(_QWORD *)(v5 + 320);
LABEL_72:
    if (v35 == -1)
      v42 = *(int **)(v5 + 328);
    else
      v42 = (int *)_os_alloc_once();
    v43 = *v42;
    if ((*v42 & 2) != 0)
    {
      puts("symptom_transport: CONNECTION_INVALID");
      v43 = *v42;
    }
    if ((v43 & 4) != 0)
      _sr_log("symptom_transport: CONNECTION_INVALID\n");
    v30 = *(_QWORD *)(a1 + 32);
    v44 = *(_QWORD *)(v30 + 152) + 1;
    *(_QWORD *)(v30 + 152) = v44;
    if (v44 >= 4)
    {
      _sr_log("%s: %s", *(const char **)(v30 + 24), "SymptomReporter: Disabling Symptom Transport after perstent invalid connections\n");
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 115) = 1;
      return;
    }
    if (*(_QWORD *)(v30 + 192) < 0xDF8475800uLL)
      *(_QWORD *)(v30 + 192) = 60000000000;
LABEL_46:
    symptoms_transport_dropped(v30);
    return;
  }
  v35 = *(_QWORD *)(v5 + 320);
  if (!v34)
    goto LABEL_72;
  if (v35 == -1)
    v40 = *(int **)(v5 + 328);
  else
    v40 = (int *)_os_alloc_once();
  v41 = *v40;
  if ((*v40 & 2) != 0)
  {
    printf("symptom_transport: XPC connection invalid for %s, switch to %s\n", "com.apple.usymptomsd", "com.apple.usymptomsd");
    v41 = *v40;
  }
  if ((v41 & 4) != 0)
    _sr_log("symptom_transport: XPC connection invalid for %s, switch to %s\n", "com.apple.usymptomsd", "com.apple.usymptomsd");
  symptoms_transport_fastdrop(*(_QWORD *)(a1 + 32));
}

void __obtain_symptom_framework_block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  unsigned __int8 *v3;
  _QWORD *v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int *v13;
  int v14;
  const char *v15;
  const char *v16;
  timeval label;

  v1 = *(_DWORD *)(a1 + 48);
  v3 = *(unsigned __int8 **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = malloc_type_calloc(1uLL, 0x168uLL, 0x10B0040F933FA69uLL);
  v5 = MEMORY[0x1E0C87FA0];
  if (!v4)
    goto LABEL_25;
  v6 = malloc_type_malloc(v2 + 1, 0xC50D3191uLL);
  v4[3] = v6;
  if (!v6)
    goto LABEL_24;
  label.tv_sec = 0;
  if (!v3)
  {
    __break(1u);
LABEL_40:
    v10 = _os_alloc_once();
    if (!v10)
      goto LABEL_25;
    goto LABEL_19;
  }
  if ((unint64_t)(v2 + 1) < 2)
  {
    v7 = v2 + 1;
    if (v2 != -1)
    {
LABEL_11:
      if (v7)
        *v6 = 0;
    }
  }
  else
  {
    v7 = 1;
    v8 = v2 + 1;
    while (1)
    {
      v9 = *v3;
      *v6 = v9;
      if (!v9)
        break;
      ++v6;
      ++v3;
      if ((unint64_t)--v8 <= 1)
      {
        if (v2 != -1)
          goto LABEL_11;
        break;
      }
    }
  }
  v4[4] = v2;
  asprintf((char **)&label, "%s symptoms", (const char *)v4[3]);
  if (label.tv_sec)
  {
    v4[16] = dispatch_queue_create((const char *)label.tv_sec, 0);
    if (label.tv_sec)
      free((void *)label.tv_sec);
  }
  if (!v4[16])
  {
    v12 = (void *)v4[3];
    if (v12)
      free(v12);
LABEL_24:
    free(v4);
    v4 = 0;
    goto LABEL_25;
  }
  label.tv_sec = 0;
  *(_QWORD *)&label.tv_usec = 0;
  v4[5] = 0;
  *((_DWORD *)v4 + 3) = v1;
  *((_DWORD *)v4 + 4) = 1;
  *((_DWORD *)v4 + 2) = 195165933;
  v4[6] = v4 + 5;
  v4[7] = 0;
  v4[8] = 0;
  v4[9] = v4 + 8;
  v4[10] = 0;
  *(_WORD *)((char *)v4 + 113) = 0;
  *((_DWORD *)v4 + 53) = 0;
  *((int64x2_t *)v4 + 12) = vdupq_n_s64(0x5F5E100uLL);
  *(_OWORD *)(v4 + 11) = xmmword_1C966BED0;
  *((_DWORD *)v4 + 26) = 1;
  gettimeofday(&label, 0);
  *((_DWORD *)v4 + 52) = label.tv_usec ^ LODWORD(label.tv_sec);
  if (*(_QWORD *)(v5 + 320) != -1)
    goto LABEL_40;
  v10 = *(_QWORD *)(v5 + 328);
  if (!v10)
    goto LABEL_25;
LABEL_19:
  v11 = *(_QWORD *)(v10 + 8);
  *v4 = v11;
  if (!v11)
    *(_QWORD *)(v10 + 16) = v4;
  *(_QWORD *)(v10 + 8) = v4;
LABEL_25:
  if (*(_QWORD *)(v5 + 320) == -1)
    v13 = *(int **)(v5 + 328);
  else
    v13 = (int *)_os_alloc_once();
  v14 = *v13;
  if ((*v13 & 2) != 0)
  {
    if (v4)
      v15 = (const char *)v4[3];
    else
      v15 = "<nil>";
    printf("create_symptom_framework returns %p, name %s\n", v4, v15);
    v14 = *v13;
  }
  if ((v14 & 4) != 0)
  {
    if (v4)
      v16 = (const char *)v4[3];
    else
      v16 = "<nil>";
    _sr_log("create_symptom_framework returns %p, name %s\n", v4, v16);
  }
}

dispatch_queue_t __framework_creation_queue_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("symptom_init_queue", 0);
  framework_creation_queue_serialization_q = (uint64_t)result;
  return result;
}

BOOL is_valid_symptom(uint64_t a1)
{
  uint64_t v1;
  _BOOL8 result;

  result = 0;
  if (*(_DWORD *)(a1 + 8) == -823263507)
  {
    v1 = *(_QWORD *)(a1 + 112);
    if (v1)
    {
      if (*(_DWORD *)(v1 + 8) == 195165933)
        return 1;
    }
  }
  return result;
}

BOOL is_valid_symptom_reporter(uint64_t a1)
{
  return *(_DWORD *)(a1 + 8) == 195165933;
}

BOOL is_valid_symptom_ctrl(_DWORD *a1)
{
  return *a1 == -858980627;
}

uint64_t symptom_send_immediate(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  if (a1)
  {
    *(_BYTE *)(a1 + 17) = 4;
    sr_log_symptom(a1);
    v2 = *(_QWORD *)(a1 + 112);
    if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 320) == -1)
      v3 = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 328);
    else
      v3 = _os_alloc_once();
    if (!*(_BYTE *)(v3 + 32))
    {
      if (!_dispatch_is_multithreaded())
      {
        *(_BYTE *)(v2 + 352) = 0;
        symptom_free((_QWORD *)a1, "Not Multithreaded");
        return 0;
      }
      if (*(_QWORD *)(v3 + 24) != -1)
        dispatch_once_f((dispatch_once_t *)(v3 + 24), (void *)v3, (dispatch_function_t)symptoms_go_multithreaded);
    }
    *(_BYTE *)(v2 + 352) = 1;
    dispatch_async_f(*(dispatch_queue_t *)(v2 + 128), (void *)a1, (dispatch_function_t)symptom_post);
    return 0;
  }
  return 0xFFFFFFFFLL;
}

uint64_t symptom_framework_set_version(uint64_t a1, int a2)
{
  BOOL v2;
  uint64_t v3;

  if (a1)
    v2 = (a2 - 1) >= 2;
  else
    v2 = 1;
  v3 = !v2;
  if ((_DWORD)v3 == 1)
    *(_DWORD *)(a1 + 16) = a2;
  return v3;
}

uint64_t _symptoms_daemon_fallback_initial_disposition(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t result;

  if (_symptoms_daemon_fallback_initial_disposition_onceToken != -1)
    dispatch_once(&_symptoms_daemon_fallback_initial_disposition_onceToken, &__block_literal_global);
  result = _symptoms_daemon_fallback_initial_disposition_initial_disposition;
  if (_symptoms_daemon_fallback_initial_disposition_initial_disposition == 2)
  {
    if (a4)
    {
      *a4 = 0x2000000;
      return 2;
    }
    else
    {
      result = 0;
      _symptoms_daemon_fallback_initial_disposition_initial_disposition = 0;
    }
  }
  return result;
}

size_t ___symptoms_daemon_fallback_initial_disposition_block_invoke()
{
  size_t result;
  const char *v1;
  size_t v2;
  uint64_t i;
  uint64_t v4;
  char j;
  char v6;
  const char *v7;
  int v8;

  result = (size_t)getprogname();
  if (result)
  {
    v1 = (const char *)result;
    v2 = strlen((const char *)result);
    for (i = 0; i != 7; ++i)
    {
      result = strlen(_block_invoke_2_kBlacklistedProcessNameList[i]);
      if (v2 >= result)
      {
        result = strncasecmp(v1, _block_invoke_2_kBlacklistedProcessNameList[i], result);
        if (!(_DWORD)result)
        {
          v8 = 0;
          goto LABEL_14;
        }
      }
    }
    if (!_symptoms_daemon_fallback_initial_disposition_initial_disposition)
      return result;
    v4 = 0;
    for (j = 1; ; j = 0)
    {
      v6 = j;
      v7 = _block_invoke_kPreemptProcessNameList[v4];
      result = strlen(v7);
      if (v2 >= result)
      {
        result = strncasecmp(v1, v7, result);
        if (!(_DWORD)result)
          break;
      }
      v4 = 1;
      if ((v6 & 1) == 0)
        return result;
    }
    v8 = 2;
LABEL_14:
    _symptoms_daemon_fallback_initial_disposition_initial_disposition = v8;
  }
  return result;
}

uint64_t _symptoms_daemon_fallback_subseq_disposition(int a1, int a2, const unsigned __int8 *a3, NSObject *a4, void *aBlock)
{
  BOOL v7;
  uint64_t v8;
  void *v10;
  xpc_object_t v11;
  uint64_t v12;
  uint64_t v13;
  int *v14;
  int v15;
  _QWORD v17[6];
  _QWORD v18[6];
  _QWORD block[8];

  if (a4)
    v7 = aBlock == 0;
  else
    v7 = 1;
  v8 = !v7;
  if (!v7)
  {
    v10 = _Block_copy(aBlock);
    v11 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v11, "type", 1uLL);
    xpc_dictionary_set_uint64(v11, "seqno", 6uLL);
    xpc_dictionary_set_uint64(v11, "howmany", 1uLL);
    xpc_dictionary_set_uuid(v11, "uuid", a3);
    v12 = _create_connection_connection;
    if (_create_connection_connection)
    {
LABEL_9:
      v13 = MEMORY[0x1E0C87450];
      v18[0] = MEMORY[0x1E0C87450];
      v18[1] = 0x40000000;
      v18[2] = ___symptoms_daemon_fallback_subseq_disposition_block_invoke;
      v18[3] = &unk_1E82862E8;
      v18[4] = v10;
      v18[5] = v11;
      if (_service_queue_service_queue_once != -1)
        dispatch_once(&_service_queue_service_queue_once, &__block_literal_global_31);
      block[0] = v13;
      block[1] = 0x40000000;
      block[2] = ___send_with_reply_block_invoke;
      block[3] = &unk_1E8286430;
      block[6] = v11;
      block[7] = a4;
      block[4] = v18;
      block[5] = v12;
      dispatch_sync((dispatch_queue_t)_service_queue_service_queue, block);
      return v8;
    }
    if (_service_queue_service_queue_once != -1)
      dispatch_once(&_service_queue_service_queue_once, &__block_literal_global_31);
    _create_connection_connection = (uint64_t)xpc_connection_create_mach_service("com.apple.symptoms.symptomsd.managed_events", (dispatch_queue_t)_service_queue_service_queue, 2uLL);
    if (_create_connection_connection)
    {
      if (MEMORY[0x1CAA41294]() == MEMORY[0x1E0C88FD0])
      {
        xpc_connection_set_event_handler((xpc_connection_t)_create_connection_connection, &__block_literal_global_28);
        xpc_connection_resume((xpc_connection_t)_create_connection_connection);
        v12 = _create_connection_connection;
        if (_create_connection_connection)
          goto LABEL_9;
      }
      else
      {
        if (_create_connection_connection)
          xpc_release((xpc_object_t)_create_connection_connection);
        _create_connection_connection = 0;
      }
    }
    v17[0] = MEMORY[0x1E0C87450];
    v17[1] = 0x40000000;
    v17[2] = ___symptoms_daemon_fallback_subseq_disposition_block_invoke_2;
    v17[3] = &unk_1E8286310;
    v17[4] = v10;
    v17[5] = v11;
    dispatch_async(a4, v17);
    return v8;
  }
  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 320) == -1)
    v14 = *(int **)(MEMORY[0x1E0C87FA0] + 328);
  else
    v14 = (int *)_os_alloc_once();
  v15 = *v14;
  if ((*v14 & 2) != 0)
  {
    printf("incorrect arguments (queue/completion): %p/%p", a4, aBlock);
    v15 = *v14;
  }
  if ((v15 & 4) != 0)
    _sr_log("incorrect arguments (queue/completion): %p/%p", a4, aBlock);
  return v8;
}

void ___symptoms_daemon_fallback_subseq_disposition_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  void (*v6)(void);
  xpc_object_t value;
  void *v8;
  int *v9;
  int v10;
  size_t count;
  xpc_object_t v12;
  void *v13;
  int *v14;
  int v15;
  size_t v16;
  int *v17;
  int v18;
  uint64_t uint64;
  uint64_t v20;
  unint64_t v21;
  int v22;
  unint64_t v23;
  int *v24;
  int v25;

  if (!a2)
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    goto LABEL_16;
  }
  v4 = MEMORY[0x1CAA41294](a2);
  v5 = MEMORY[0x1E0C88FE8];
  if (v4 != MEMORY[0x1E0C88FE8])
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    goto LABEL_16;
  }
  if (xpc_dictionary_get_uint64(a2, "error"))
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    goto LABEL_16;
  }
  value = xpc_dictionary_get_value(a2, "event_data");
  v8 = value;
  if (!value || MEMORY[0x1CAA41294](value) != MEMORY[0x1E0C88FC0])
  {
    if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 320) == -1)
      v9 = *(int **)(MEMORY[0x1E0C87FA0] + 328);
    else
      v9 = (int *)_os_alloc_once();
    v10 = *v9;
    if ((*v9 & 2) != 0)
    {
      printf("incorrect event_data: %p", v8);
      v10 = *v9;
    }
    if ((v10 & 4) != 0)
      _sr_log("incorrect event_data: %p");
LABEL_15:
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    goto LABEL_16;
  }
  count = xpc_array_get_count(v8);
  if (count != 1)
  {
    v16 = count;
    if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 320) == -1)
      v17 = *(int **)(MEMORY[0x1E0C87FA0] + 328);
    else
      v17 = (int *)_os_alloc_once();
    v18 = *v17;
    if ((*v17 & 2) != 0)
    {
      printf("incorrect event_data count: %zu", v16);
      v18 = *v17;
    }
    if ((v18 & 4) != 0)
      _sr_log("incorrect event_data count: %zu");
    goto LABEL_15;
  }
  v12 = xpc_array_get_value(v8, 0);
  v13 = v12;
  if (!v12 || MEMORY[0x1CAA41294](v12) != v5)
  {
    if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 320) == -1)
      v14 = *(int **)(MEMORY[0x1E0C87FA0] + 328);
    else
      v14 = (int *)_os_alloc_once();
    v15 = *v14;
    if ((*v14 & 2) != 0)
    {
      printf("incorrect dict: %p", v13);
      v15 = *v14;
    }
    if ((v15 & 4) != 0)
      _sr_log("incorrect dict: %p");
    goto LABEL_15;
  }
  uint64 = xpc_dictionary_get_uint64(v13, "reason_code");
  v20 = uint64;
  if (uint64 == -1)
  {
    v23 = 0;
    v22 = 1;
  }
  else
  {
    v21 = 0x1000000;
    if (uint64 > 0x1000000)
      v21 = uint64;
    if (v21 >= 0x4000000)
      v21 = 0x4000000;
    if (uint64)
      v22 = 2;
    else
      v22 = 0;
    if (uint64)
      v23 = v21;
    else
      v23 = 0;
  }
  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 320) == -1)
    v24 = *(int **)(MEMORY[0x1E0C87FA0] + 328);
  else
    v24 = (int *)_os_alloc_once();
  v25 = *v24;
  if ((*v24 & 2) != 0)
  {
    printf("actionable new fallback disposition: (dispo/grant/hinted): %d/%llu/%llu", v22, v23, v20);
    v25 = *v24;
  }
  if ((v25 & 4) != 0)
    _sr_log("actionable new fallback disposition: (dispo/grant/hinted): %d/%llu/%llu", v22, v23, v20);
  v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
LABEL_16:
  v6();
  _Block_release(*(const void **)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 40));
}

void ___symptoms_daemon_fallback_subseq_disposition_block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 40));
}

void ___create_connection_block_invoke(uint64_t a1, const void *a2)
{
  int *v3;
  int v4;

  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 320) == -1)
    v3 = *(int **)(MEMORY[0x1E0C87FA0] + 328);
  else
    v3 = (int *)_os_alloc_once();
  v4 = *v3;
  if ((*v3 & 2) != 0)
  {
    printf("connection handler received object  %p", a2);
    v4 = *v3;
  }
  if ((v4 & 4) != 0)
    _sr_log("connection handler received object  %p", a2);
  if (MEMORY[0x1CAA41294](a2) == MEMORY[0x1E0C89000] && _create_connection_connection)
  {
    xpc_connection_cancel((xpc_connection_t)_create_connection_connection);
    if (_create_connection_connection)
      xpc_release((xpc_object_t)_create_connection_connection);
    _create_connection_connection = 0;
  }
}

dispatch_queue_t ___service_queue_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("com.apple.symptoms.service.queue", 0);
  _service_queue_service_queue = (uint64_t)result;
  return result;
}

void ___send_with_reply_block_invoke(uint64_t a1)
{
  xpc_connection_send_message_with_reply(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 48), *(dispatch_queue_t *)(a1 + 56), *(xpc_handler_t *)(a1 + 32));
}

void send_current(uint64_t a1)
{
  int v2;
  int v3;
  int *v4;
  int v5;
  char *v6;
  char *v7;
  __int16 v8;
  char *v9;
  unint64_t v10;

  v2 = *(_DWORD *)(a1 + 108);
  if ((v2 + 1) > 1)
    v3 = v2 + 1;
  else
    v3 = 1;
  *(_DWORD *)(a1 + 108) = v3;
  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 320) == -1)
    v4 = *(int **)(MEMORY[0x1E0C87FA0] + 328);
  else
    v4 = (int *)_os_alloc_once();
  v5 = *v4;
  if ((*v4 & 2) != 0)
  {
    printf("send_current: ack_id %d\n", *(_DWORD *)(a1 + 108));
    v5 = *v4;
  }
  if ((v5 & 4) != 0)
    _sr_log("send_current: ack_id %d\n", *(_DWORD *)(a1 + 108));
  v6 = (char *)malloc_type_malloc(0x28A0uLL, 0x8F63F342uLL);
  if (v6)
  {
    v7 = v6;
    *((_DWORD *)v6 + 1) = 2359299;
    v8 = (_WORD)v6 + 8;
    fill_sender_id(a1, (uint64_t)(v6 + 8));
    v10 = 10344;
    v9 = read_symptoms(a1, v7 + 44, &v10);
    *(_DWORD *)v9 = 262184;
    *((_DWORD *)v9 + 1) = *(_DWORD *)(a1 + 108);
    *(_WORD *)v7 = 1;
    *((_WORD *)v7 + 1) = (_WORD)v9 + 4 - v8 + 8;
    symptom_transport_send(a1, v7, (unsigned __int16)((_WORD)v9 + 4 - v8 + 8) + 4);
    *(_BYTE *)(a1 + 112) = 1;
    ++*(_QWORD *)(a1 + 280);
    free(v7);
  }
}

uint64_t symptoms_transport_dropped(uint64_t a1)
{
  uint64_t v2;
  int *v3;
  int v4;
  int *v5;
  int v6;
  uint64_t result;
  int *v8;
  int v9;
  int *v10;
  int v11;

  v2 = MEMORY[0x1E0C87FA0];
  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 320) == -1)
    v3 = *(int **)(MEMORY[0x1E0C87FA0] + 328);
  else
    v3 = (int *)_os_alloc_once();
  v4 = *v3;
  if ((*v3 & 2) != 0)
  {
    printf("symptoms_transport_dropped %s\n", *(const char **)(a1 + 24));
    v4 = *v3;
  }
  if ((v4 & 4) != 0)
    _sr_log("symptoms_transport_dropped %s\n", *(const char **)(a1 + 24));
  gettimeofday((timeval *)(a1 + 176), 0);
  ++*(_DWORD *)(a1 + 104);
  if (*(_QWORD *)(v2 + 320) == -1)
    v5 = *(int **)(v2 + 328);
  else
    v5 = (int *)_os_alloc_once();
  v6 = *v5;
  if ((*v5 & 2) != 0)
  {
    printf("reset_sr_filters for %s\n", *(const char **)(a1 + 24));
    v6 = *v5;
  }
  if ((v6 & 4) != 0)
    _sr_log("reset_sr_filters for %s\n", *(const char **)(a1 + 24));
  result = reevaluate_sr_symptoms(a1);
  if (*(_QWORD *)(a1 + 80))
  {
    if (*(_QWORD *)(v2 + 320) == -1)
    {
      v8 = *(int **)(v2 + 328);
    }
    else
    {
      result = _os_alloc_once();
      v8 = (int *)result;
    }
    v9 = *v8;
    if ((*v8 & 2) != 0)
    {
      result = printf("symptoms_transport_dropped %s, immediate reconnect\n", *(const char **)(a1 + 24));
      v9 = *v8;
    }
    if ((v9 & 4) != 0)
      result = _sr_log("symptoms_transport_dropped %s, immediate reconnect\n", *(const char **)(a1 + 24));
    if (*(_BYTE *)(a1 + 216))
    {
      if (*(_QWORD *)(v2 + 320) == -1)
      {
        v10 = *(int **)(v2 + 328);
      }
      else
      {
        result = _os_alloc_once();
        v10 = (int *)result;
      }
      v11 = *v10;
      if ((*v10 & 2) != 0)
      {
        result = printf("symptoms_transport_dropped %s, immediate reconnect, but connect queued\n", *(const char **)(a1 + 24));
        v11 = *v10;
      }
      if ((v11 & 4) != 0)
        return _sr_log("symptoms_transport_dropped %s, immediate reconnect, but connect queued\n", *(const char **)(a1 + 24));
    }
    else
    {
      return ensure_symptom_framework_connect(a1);
    }
  }
  return result;
}

uint64_t reevaluate_sr_symptoms(uint64_t result)
{
  uint64_t v1;
  const void *v2;
  uint64_t v3;
  int *v4;
  int v5;
  int *v6;
  int v7;
  int *v8;
  int v9;
  const void **v10;
  const void **v11;
  int *v12;
  int v13;
  int *v14;
  int v15;
  const void **v16;
  const void ***v17;

  v1 = *(_QWORD *)(result + 40);
  if (v1)
  {
    v2 = (const void *)result;
    v3 = MEMORY[0x1E0C87FA0];
    do
    {
      if (*(_QWORD *)(v3 + 320) == -1)
      {
        v4 = *(int **)(v3 + 328);
      }
      else
      {
        result = _os_alloc_once();
        v4 = (int *)result;
      }
      v5 = *v4;
      if ((*v4 & 2) != 0)
      {
        result = printf("reevaluate_sr_symptoms: evaluate symptom control %p, id %x\n", (const void *)v1, *(_DWORD *)(v1 + 8));
        v5 = *v4;
      }
      if ((v5 & 4) != 0)
        result = _sr_log("reevaluate_sr_symptoms: evaluate symptom control %p, id %x\n", (const void *)v1, *(_DWORD *)(v1 + 8));
      v16 = 0;
      v17 = &v16;
      if (*(_QWORD *)(v3 + 320) == -1)
      {
        v6 = *(int **)(v3 + 328);
      }
      else
      {
        result = _os_alloc_once();
        v6 = (int *)result;
      }
      v7 = *v6;
      if ((*v6 & 2) != 0)
      {
        result = printf("reevaluate_sc_symptoms: sr %p sc %p\n", v2, (const void *)v1);
        v7 = *v6;
      }
      if ((v7 & 4) != 0)
        result = _sr_log("reevaluate_sc_symptoms: sr %p sc %p\n", v2, (const void *)v1);
      if (*(_BYTE *)(v1 + 40))
      {
        sym_ctrl_dequeue((uint64_t)v2, v1);
        if (*(_QWORD *)(v3 + 320) == -1)
          v8 = *(int **)(v3 + 328);
        else
          v8 = (int *)_os_alloc_once();
        v9 = *v8;
        if ((*v8 & 2) != 0)
        {
          puts("reevaluate_sc_symptoms: sc was active, dequeued");
          v9 = *v8;
        }
        if ((v9 & 4) != 0)
          _sr_log("reevaluate_sc_symptoms: sc was active, dequeued\n");
        result = dump_symptom_state((uint64_t)v2);
      }
      v10 = *(const void ***)(v1 + 72);
      if (v10)
      {
        *v17 = v10;
        v17 = *(const void ****)(v1 + 80);
        *(_QWORD *)(v1 + 72) = 0;
        *(_QWORD *)(v1 + 80) = v1 + 72;
      }
      *(_QWORD *)(v1 + 64) = 0;
      while (1)
      {
        v11 = v16;
        if (!v16)
          break;
        v16 = (const void **)*v16;
        if (!v16)
          v17 = &v16;
        update_globals_for_symptom_removal((uint64_t)v2, v11);
        if (*(_QWORD *)(v3 + 320) == -1)
          v12 = *(int **)(v3 + 328);
        else
          v12 = (int *)_os_alloc_once();
        v13 = *v12;
        if ((*v12 & 2) != 0)
        {
          printf("reevaluate_sc_symptoms: evaluate symptom %p\n", v11);
          v13 = *v12;
        }
        if ((v13 & 4) != 0)
          _sr_log("reevaluate_sc_symptoms: evaluate symptom %p\n", v11);
        result = handle_symptom(v2, v1, v11);
        if (*(_QWORD *)(v3 + 320) == -1)
        {
          v14 = *(int **)(v3 + 328);
        }
        else
        {
          result = _os_alloc_once();
          v14 = (int *)result;
        }
        v15 = *v14;
        if ((*v14 & 2) != 0)
        {
          result = puts("reevaluate_sc_symptoms: after evaluate symptom");
          v15 = *v14;
        }
        if ((v15 & 4) != 0)
          result = _sr_log("reevaluate_sc_symptoms: after evaluate symptom\n");
      }
      v1 = *(_QWORD *)(v1 + 16);
    }
    while (v1);
  }
  return result;
}

uint64_t fill_sender_id(uint64_t result, uint64_t a2)
{
  int v2;
  unsigned __int8 *v3;
  _BYTE *v4;
  uint64_t v5;
  int v6;

  v2 = *(_DWORD *)(result + 12);
  *(_BYTE *)a2 = *(_DWORD *)(result + 16);
  *(_BYTE *)(a2 + 1) = v2;
  *(_WORD *)(a2 + 2) = 0;
  v3 = *(unsigned __int8 **)(result + 24);
  if (v3)
  {
    v4 = (_BYTE *)(a2 + 4);
    v5 = 32;
    while (1)
    {
      v6 = *v3;
      *v4 = v6;
      if (!v6)
        break;
      ++v4;
      ++v3;
      if ((unint64_t)--v5 <= 1)
      {
        *v4 = 0;
        return result;
      }
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t __ensure_symptom_framework_connect_block_invoke(uint64_t a1)
{
  int *v2;
  int v3;

  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 320) == -1)
    v2 = *(int **)(MEMORY[0x1E0C87FA0] + 328);
  else
    v2 = (int *)_os_alloc_once();
  v3 = *v2;
  if ((*v2 & 2) != 0)
  {
    puts("ensure_symptom_framework_connect: connect after delay");
    v3 = *v2;
  }
  if ((v3 & 4) != 0)
    _sr_log("ensure_symptom_framework_connect: connect after delay\n");
  return connect_symptom_framework(*(_QWORD *)(a1 + 32));
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C87428](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C87440](aBlock);
}

uint64_t _dispatch_is_fork_of_multithreaded_parent()
{
  return MEMORY[0x1E0C86EE0]();
}

uint64_t _dispatch_is_multithreaded()
{
  return MEMORY[0x1E0C86EF0]();
}

uint64_t _os_alloc_once()
{
  return MEMORY[0x1E0C88A80]();
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1E0C87620](a1, a2);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C86F78](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C86F98](queue, block);
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x1E0C86FA8](queue, context, work);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C87100](predicate, block);
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
  MEMORY[0x1E0C87108](predicate, context, function);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C87128](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C871F8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C87208](when, delta);
}

void free(void *a1)
{
  MEMORY[0x1E0C88920](a1);
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1E0C877C0]();
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1E0C877C8](a1, a2);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C88970](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C88978](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C87830](__dst, __src, __n);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1E0C87890](a1);
}

int puts(const char *a1)
{
  return MEMORY[0x1E0C878A0](a1);
}

int rand_r(unsigned int *a1)
{
  return MEMORY[0x1E0C878B8](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C87950](__str, __size, __format);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1E0C87970](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C87990](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C879D8](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x1E0C879E0](a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C879E8](__s1, __s2, __n);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1E0C89070](xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1E0C89090](xarray, index);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x1E0C890D8](connection);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C890E0](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x1E0C890F0](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x1E0C89100](connection, message);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x1E0C89108](connection, message, replyq, handler);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C89120](connection, handler);
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  MEMORY[0x1E0C89130](connection, targetq);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C891A0](keys, values, count);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1E0C891D0](xdict, key, length);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C891E8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C891F0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C89200](xdict, key);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x1E0C89210](xdict, key, bytes, length);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C89238](xdict, key, value);
}

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
  MEMORY[0x1E0C89240](xdict, key, uuid);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C89270](object);
}

