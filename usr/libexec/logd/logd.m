uint64_t sub_100001594(int a1, const char *a2, int a3)
{
  __int16 v3;
  uint64_t v4;
  int v5;
  int *v7;
  int v8;
  __int128 v9;
  uint64_t v10;

  v3 = a3;
  v4 = openat(a1, a2, a3, 420);
  if (qword_10003A9B8 == -1)
  {
    if ((v3 & 0x200) == 0)
      return v4;
  }
  else
  {
    dispatch_once(&qword_10003A9B8, &stru_10002A858);
    if ((v3 & 0x200) == 0)
      return v4;
  }
  if (byte_10003A9C0 && (_DWORD)v4 != -1)
  {
    v10 = 0;
    v9 = xmmword_100024268;
    if (sub_100010658())
      v5 = 3;
    else
      v5 = 2;
    v8 = v5;
    if (fsetattrlist(v4, &v9, &v8, 4uLL, 0) == -1)
    {
      v7 = __error();
      _os_assumes_log(*v7);
    }
  }
  return v4;
}

void sub_100001694(_xpc_connection_s *a1)
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 0x40000000;
  v2[2] = sub_100002C1C;
  v2[3] = &unk_100029900;
  v2[4] = a1;
  xpc_connection_set_event_handler(a1, v2);
  xpc_connection_set_target_queue(a1, (dispatch_queue_t)qword_10003A8F0);
  xpc_connection_activate(a1);
}

_DWORD *sub_100001734(_DWORD *result, uint64_t a2)
{
  NDR_record_t v3;

  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    v3 = NDR_record;
  }
  else
  {
    result = (_DWORD *)sub_100008390(result[3], result[2]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    v3 = NDR_record;
    if (!(_DWORD)result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 56;
      return result;
    }
  }
  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

void sub_1000017B4(uint64_t *a1)
{
  os_unfair_lock_lock_with_options(&unk_10003A8D8, 0x10000);
  sub_10000A7BC(qword_10003A8E0, a1);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10003A8D8);
}

void sub_1000017F8(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  dispatch_suspend((dispatch_object_t)qword_10002C280);
  off_10002C2A8 = (_UNKNOWN *)a1;
  v2 = *(NSObject **)(a1 + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_1000108C4;
  block[3] = &unk_100028DE0;
  block[4] = a1;
  dispatch_group_async(v2, (dispatch_queue_t)qword_10002C298, block);
  dispatch_group_notify_f(*(dispatch_group_t *)(a1 + 8), (dispatch_queue_t)qword_10002C288, (void *)a1, (dispatch_function_t)sub_10000199C);
}

void sub_100001888()
{
  _QWORD *v0;

  v0 = (_QWORD *)_os_trace_calloc(1, 88);
  v0[8] = 0;
  v0[9] = v0 + 8;
  v0[1] = -1;
  operator new();
}

void sub_1000018F4(const void *a1)
{
  _QWORD *v2;

  v2 = malloc_type_malloc(0x10uLL, 0xA0040BD48D6D6uLL);
  *v2 = _Block_copy(a1);
  v2[1] = dispatch_group_create();
  dispatch_async_f((dispatch_queue_t)qword_10002C280, v2, (dispatch_function_t)sub_1000017F8);
}

void sub_100001954(id a1)
{
  if (byte_10003A89D == 1)
  {
    os_map_str_clear(&unk_10003A8A0, &stru_1000296E0);
    word_10003A8B8 = ~word_10003A8B8 | 0xFFFE;
  }
}

void sub_10000199C(dispatch_object_t *a1)
{
  ((void (*)(void))(*a1)[2].isa)();
  off_10002C2A8 = 0;
  dispatch_release(a1[1]);
  _Block_release(*a1);
  free(a1);
  dispatch_resume((dispatch_object_t)qword_10002C280);
}

void sub_1000019FC(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  sub_10000F298(a1);
  sub_1000105EC(*(void ***)(a1 + 16));
  v2 = *(_QWORD *)(a1 + 24);
  sub_10000F4AC(v2);
  if (v2)
  {
    sub_10000F56C(*(void ***)(v2 + 16));
    v3 = *(void **)v2;
    *(_QWORD *)v2 = 0;
    if (v3)
      operator delete(v3);
    operator delete();
  }
  sub_1000046BC(*(void ***)(a1 + 40), 0);
  free((void *)a1);
}

void sub_100001A74(uint64_t a1)
{
  uint64_t v2;
  dispatch_block_t v3;
  NSObject *v4;
  _QWORD v5[7];
  _QWORD block[5];

  v2 = *(_QWORD *)(a1 + 8);
  if (v2)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = sub_100010A60;
    block[3] = &unk_100029980;
    block[4] = a1;
    v3 = dispatch_block_create((dispatch_block_flags_t)0, block);
  }
  else
  {
    v3 = 0;
  }
  v4 = *(NSObject **)a1;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 0x40000000;
  v5[2] = sub_100010A20;
  v5[3] = &unk_1000299A8;
  v5[5] = a1;
  v5[6] = v2;
  v5[4] = v3;
  dispatch_sync(v4, v5);
  if (v2)
  {
    dispatch_block_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
    _Block_release(v3);
  }
}

uint64_t sub_100001B70(uint64_t a1, int a2)
{
  uint64_t result;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;

  if (0x10000 % vm_page_size)
  {
    v11 = _os_assert_log(0);
    result = _os_crash(v11);
    __break(1u);
LABEL_13:
    __break(0x5513u);
    goto LABEL_14;
  }
  *(_QWORD *)(a1 + 1128) = 0x4FFFFFFFFLL;
  *(_DWORD *)(a1 + 1104) = 15;
  *(_QWORD *)(a1 + 1120) = 0x40000;
  result = mach_vm_map(mach_task_self_, (mach_vm_address_t *)(a1 + 1112), 0x40000uLL, 0, 1308622849, 0, 0, 0, 3, 3, 2u);
  if (!(_DWORD)result)
  {
    v5 = 0;
    v6 = 0;
    while (v5 <= ~(a1 + 48))
    {
      v7 = a1 + v5;
      *(_QWORD *)(v7 + 296) = 0x10000;
      *(_DWORD *)(v7 + 304) = 0;
      *(_QWORD *)(v7 + 288) = v6 + *(_QWORD *)(a1 + 1112);
      v6 += 0x10000;
      v5 += 264;
      if (v6 == 0x40000)
      {
        v8 = *(_QWORD *)(a1 + 8);
        v9 = a2 / 0x20000;
        if (a2 / 0x20000 <= 1)
          v9 = 1;
        *(_DWORD *)(a1 + 1168) = 0;
        if (v8)
          v10 = 1;
        else
          v10 = v9;
        *(_DWORD *)(a1 + 1172) = v10;
        *(_QWORD *)(a1 + 1144) = 0;
        *(_QWORD *)(a1 + 1136) = _os_trace_calloc(v10, 280);
        sub_100001888();
      }
    }
    goto LABEL_13;
  }
LABEL_14:
  qword_10002DF48 = (uint64_t)"BUG IN LIBTRACE: Allocating buffer failed";
  qword_10002DF78 = (int)result;
  __break(1u);
  return result;
}

void sub_100001DB0(uint64_t a1, unsigned int a2)
{
  char *v4;
  int v5;
  int v6;
  unint64_t StatusReg;
  unsigned __int16 *v8;
  int v9;
  uint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  unsigned int *v13;
  unsigned int v14;

  os_unfair_lock_lock_with_options(&unk_10002C2E0, 0x10000);
  v4 = (char *)off_10002C2D0;
  if (off_10002C2D0)
  {
    v5 = 0;
    v6 = 1 << a2;
    StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    do
    {
      if (!v4[144])
      {
        if (*((_DWORD *)v4 + 32))
        {
          v8 = (unsigned __int16 *)(v4 + 140);
          do
          {
            v9 = __ldxr(v8);
            if (((256 << a2) & v9) != 0)
            {
              __clrex();
              goto LABEL_16;
            }
            if ((v6 & v9) != 0)
            {
              __clrex();
              goto LABEL_13;
            }
          }
          while (__stxr(v9 | v6, v8));
          v10 = a2 | (2 * v4[147]);
          *(_QWORD *)&v4[8 * a2 + 32] = 0;
          v11 = (unint64_t *)&dword_10002C270[4 * v10 + 32];
          *(_QWORD *)(StatusReg + 976) = v11;
          do
            v12 = __ldxr(v11);
          while (__stlxr((unint64_t)v4, v11));
          if (v12)
          {
            *(_QWORD *)(v12 + 8 * a2 + 32) = v4;
            *(_QWORD *)(StatusReg + 976) = 0;
          }
          else
          {
            *(_QWORD *)&dword_10002C270[4 * v10 + 30] = v4;
            *(_QWORD *)(StatusReg + 976) = 0;
            dispatch_source_merge_data(*(dispatch_source_t *)&dword_10002C270[2 * v10 + 46], 1uLL);
          }
        }
LABEL_13:
        ++v5;
        if (a2)
          v4[145] = 1;
        else
          v4[146] = 1;
      }
LABEL_16:
      v4 = (char *)*((_QWORD *)v4 + 2);
    }
    while (v4);
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_10002C2E0);
    if (v5)
    {
      v13 = (unsigned int *)(*(_QWORD *)(a1 + 8) + 48);
      do
        v14 = __ldxr(v13);
      while (__stxr(v14 - 4 * v5, v13));
    }
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_10002C2E0);
  }
}

void sub_100001F40(uint64_t a1)
{
  int v2;
  uint64_t v3;
  const unsigned __int8 *v4;
  unsigned int v5;
  const char *v6;
  const char *v7;
  char v8;
  xpc_object_t v9;
  const char *v10;
  void *v11;
  BOOL v12;
  void *v13;
  char __b[1024];

  memset(__b, 170, sizeof(__b));
  sub_10000F9A4((unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), 1u, __b);
  if (!utimes(__b, 0))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 2088) = 1;
  v2 = *(_DWORD *)(a1 + 56);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = (const unsigned __int8 *)(v3 + 24);
  if ((v2 & 8) != 0)
  {
    v6 = (const char *)(v3 + 40);
    v7 = (const char *)(v3 + 1064);
    v8 = *(_BYTE *)(v3 + 2088);
    v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v9, "operation", 5uLL);
    xpc_dictionary_set_uuid(v9, "uuid", v4);
    xpc_dictionary_set_string(v9, "path", v6);
    xpc_dictionary_set_string(v9, "role", v7);
    v10 = "coproc_free_only";
    v11 = v9;
    v12 = v8;
  }
  else
  {
    if (*(_BYTE *)(v3 + 2088))
    {
      v5 = 0;
      goto LABEL_9;
    }
    if ((v2 & 2) != 0)
    {
      v9 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_uint64(v9, "operation", 2uLL);
      xpc_dictionary_set_uuid(v9, "uuid", (const unsigned __int8 *)(v3 + 24));
      goto LABEL_8;
    }
    v13 = *(void **)(a1 + 40);
    v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v9, "operation", 4uLL);
    xpc_dictionary_set_string(v9, "path", (const char *)(v3 + 40));
    xpc_dictionary_set_uuid(v9, "uuid", (const unsigned __int8 *)(v3 + 24));
    if (v13)
      xpc_dictionary_set_value(v9, "sections", v13);
    if ((v2 & 0x200) != 0)
      xpc_dictionary_set_BOOL(v9, "fake_uuid", 1);
    if ((v2 & 4) == 0)
      goto LABEL_8;
    xpc_dictionary_set_string(v9, "role", (const char *)(v3 + 1064));
    v10 = "ftab";
    v11 = v9;
    v12 = 1;
  }
  xpc_dictionary_set_BOOL(v11, v10, v12);
LABEL_8:
  v5 = sub_100002200(v9, 1);
  xpc_release(v9);
LABEL_9:
  if (*(_QWORD *)(a1 + 40))
  {
    os_release(*(void **)(a1 + 48));
    xpc_release(*(xpc_object_t *)(a1 + 40));
  }
  if (!v5 || (*(_BYTE *)(a1 + 56) & 4) != 0)
    sub_1000017B4((uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
}

xpc_type_t sub_100002200(xpc_object_t message, int a2)
{
  _xpc_connection_s *v4;
  xpc_object_t v5;
  void *v6;
  void *v8;
  xpc_type_t result;
  const char *string;
  int64_t int64;
  char __b[1024];

  if (qword_10003A800 != -1)
    dispatch_once(&qword_10003A800, &stru_1000292F8);
  v4 = (_xpc_connection_s *)qword_10003A7F8;
  while (1)
  {
    v5 = xpc_connection_send_message_with_reply_sync(v4, message);
    v6 = v5;
    if (v5 != &_xpc_error_connection_interrupted)
      break;
    if (__OFSUB__(a2, 1))
      __break(0x5515u);
    if (a2-- <= 0)
    {
      v8 = &_xpc_error_connection_interrupted;
      goto LABEL_10;
    }
  }
  v8 = v5;
LABEL_10:
  result = xpc_get_type(v8);
  if (result == (xpc_type_t)&_xpc_type_dictionary)
  {
    int64 = xpc_dictionary_get_int64(v8, "status");
LABEL_16:
    xpc_release(v8);
    return (xpc_type_t)int64;
  }
  if (result == (xpc_type_t)&_xpc_type_error)
  {
    memset(__b, 170, sizeof(__b));
    string = xpc_dictionary_get_string(v8, _xpc_error_key_description);
    snprintf(__b, 0x400uLL, "Error connecting to logd_helper: %s", string);
    sub_100013FF0((uint64_t)__b);
    if (v6 == &_xpc_error_connection_interrupted)
      int64 = 35;
    else
      int64 = 22;
    goto LABEL_16;
  }
  qword_10002DF48 = (uint64_t)"BUG IN LIBTRACE: Unexpected xpc object";
  qword_10002DF78 = (uint64_t)result;
  __break(1u);
  return result;
}

size_t sub_1000023A0(char *a1, size_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  BOOL v9;
  id v10;
  size_t v11;
  id v12;
  id v13;
  size_t result;
  size_t v15;
  id v17;
  char __b[1024];

  v5 = a3;
  if (!+[NSJSONSerialization isValidJSONObject:](NSJSONSerialization, "isValidJSONObject:", v5))
  {
    memset(__b, 170, sizeof(__b));
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "description")));
    snprintf(__b, 0x400uLL, "JSON serialization would not work for record: %s", (const char *)objc_msgSend(v12, "UTF8String"));

    sub_100013FF0((uint64_t)__b);
    v11 = 0;
LABEL_19:

    return v11;
  }
  v17 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v5, 0, &v17));
  v7 = v17;
  v8 = v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 0;
  if (!v9)
  {
    memset(__b, 170, sizeof(__b));
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "description")));
    snprintf(__b, 0x400uLL, "JSON serialization failed for record: %s", (const char *)objc_msgSend(v10, "UTF8String"));

    sub_100013FF0((uint64_t)__b);
    v11 = 0;
LABEL_18:

    goto LABEL_19;
  }
  v13 = objc_retainAutorelease(objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v6, 4));
  result = strlcpy(a1, (const char *)objc_msgSend(v13, "UTF8String"), a2);
  v15 = result;
  v11 = result + 1;
  if (result >= a2 || v11 >= a2)
  {
    memset(__b, 170, sizeof(__b));
    snprintf(__b, 0x400uLL, "JSON of length %zd is too long, prefix: %.64s...", v15, a1);
    sub_100013FF0((uint64_t)__b);
    v11 = 0;
LABEL_17:

    goto LABEL_18;
  }
  if (result <= ~(unint64_t)a1)
  {
    a1[result] = 10;
    if (result < ~(unint64_t)a1)
    {
      a1[v11] = 0;
      goto LABEL_17;
    }
  }
  __break(0x5513u);
  return result;
}

BOOL sub_1000025C4(id a1, const char *a2, void *a3)
{
  free((void *)a2);
  return 1;
}

uint64_t sub_1000025E0(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  mem_entry_name_port_t v5;
  int v6;
  int v7;
  int v8;
  mach_port_name_t v9;
  uint64_t v10;
  mach_vm_size_t v11;
  __int128 v12;
  _OWORD v13[2];

  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 5 && *(_DWORD *)(result + 4) == 112)
  {
    if (*(unsigned __int16 *)(result + 38) << 16 == 1114112
      && *(unsigned __int16 *)(result + 50) << 16 == 0x100000
      && *(unsigned __int16 *)(result + 62) << 16 == 0x100000
      && *(unsigned __int16 *)(result + 74) << 16 == 1114112
      && *(unsigned __int16 *)(result + 86) << 16 == 1114112)
    {
      if (!*(_DWORD *)(result + 112) && *(_DWORD *)(result + 116) > 0x1Fu)
      {
        v4 = *(unsigned int *)(result + 12);
        v5 = *(_DWORD *)(result + 28);
        v6 = *(_DWORD *)(result + 40);
        v7 = *(_DWORD *)(result + 52);
        v8 = *(_DWORD *)(result + 64);
        v9 = *(_DWORD *)(result + 76);
        v10 = *(_QWORD *)(result + 96);
        v11 = *(_QWORD *)(result + 104);
        v12 = *(_OWORD *)(result + 148);
        v13[0] = *(_OWORD *)(result + 132);
        v13[1] = v12;
        result = sub_1000026F4(v4, v5, v10, v6, v7, v8, v9, v11, v13);
        *(_DWORD *)(a2 + 32) = result;
        return result;
      }
      v3 = -309;
    }
    else
    {
      v3 = -300;
    }
  }
  else
  {
    v3 = -304;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_1000026F4(uint64_t a1, mem_entry_name_port_t a2, uint64_t a3, int a4, int a5, int a6, mach_port_name_t a7, mach_vm_size_t a8, _DWORD *a9)
{
  kern_return_t v17;
  kern_return_t v18;
  kern_return_t v19;
  kern_return_t v20;
  mach_vm_address_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  int v26;
  int v27;
  uint64_t v28;
  char v29;
  char v30;
  mach_port_name_t v31;
  uint64_t v32;
  kern_return_t v33;
  uint64_t f;
  uint64_t *v35;
  NSObject *v36;
  vm_address_t v37[2];
  vm_size_t size;
  mach_vm_address_t address;
  mach_vm_address_t v40[2];
  _DWORD v41[2];

  *(_OWORD *)v37 = xmmword_100024000;
  size = 0;
  address = 0;
  if (dispatch_mach_mig_demux_get_context())
    return 5;
  if (a3 != 0x40000)
    return 18;
  v17 = mach_vm_map(mach_task_self_, &address, 0x40000uLL, 0, 1, a2, 0, 0, 1, 1, 2u);
  if (v17 == -301)
    sub_1000226B4();
  if (v17)
  {
    _dispatch_bug(1343, v17);
    return 3;
  }
  if (a7)
  {
    if (!a8)
    {
LABEL_12:
      v19 = mach_port_deallocate(mach_task_self_, a7);
      if (v19 == -301)
        sub_1000226B4();
      if (v19)
        _dispatch_bug(91, v19);
      goto LABEL_16;
    }
    v40[0] = 0;
    v18 = mach_vm_map(mach_task_self_, v40, a8, 0, 1, a7, 0, 1, 1, 1, 2u);
    if (!v18)
    {
      v37[1] = v40[0];
      size = a8;
      goto LABEL_12;
    }
    sub_100022704(v18, &address);
    return 3;
  }
LABEL_16:
  v20 = mach_port_deallocate(mach_task_self_, a2);
  if (v20 == -301)
    sub_1000226B4();
  if (v20)
    _dispatch_bug(91, v20);
  v21 = address;
  v22 = _os_object_alloc_realized(OS_firehose_client, 152);
  v23 = v22;
  v24 = 0;
  *(_QWORD *)(v22 + 48) = v21;
  *(_QWORD *)(v22 + 64) = *(_QWORD *)(v21 + 464);
  *(_QWORD *)(v22 + 56) = *(_QWORD *)(v22 + 64);
  *(_QWORD *)(v22 + 80) = *(_QWORD *)(v21 + 488);
  *(_QWORD *)(v22 + 72) = *(_QWORD *)(v22 + 80);
  v25 = a9[5];
  if (!v25)
    v25 = -1;
  v26 = a9[1];
  v27 = a9[7];
  *(_DWORD *)(v22 + 128) = v25;
  *(_DWORD *)(v22 + 132) = v27;
  *(_DWORD *)(v22 + 136) = v26;
  v41[0] = a4;
  v41[1] = a5;
  v40[0] = qword_10002C298;
  v40[1] = qword_10002C288;
  *(_BYTE *)(v22 + 142) = 2;
  v28 = v22 + 96;
  v29 = 1;
  do
  {
    v30 = v29;
    v31 = v41[v24];
    v32 = v23 + 4 * v24;
    *(_DWORD *)(v32 + 112) = v31;
    v33 = mach_port_guard(mach_task_self_, v31, v32 + 112, 1);
    if (v33 == -301)
      sub_1000226B4();
    if (v33)
      _dispatch_bug(101, v33);
    f = dispatch_mach_create_f("com.apple.firehose.peer", v40[v24], v23, sub_100004DA8);
    v29 = 0;
    *(_QWORD *)(v28 + 8 * v24) = f;
    v24 = 1;
  }
  while ((v30 & 1) != 0);
  *(_DWORD *)(v23 + 120) = a6;
  dispatch_mach_notify_no_senders(*(_QWORD *)(v23 + 96), 1);
  dispatch_assert_queue_V2((dispatch_queue_t)qword_10002C298);
  os_unfair_lock_lock_with_options(&unk_10002C2E0, 0x10000);
  *(_QWORD *)(v23 + 16) = 0;
  v35 = (uint64_t *)off_10002C2D8;
  *(_QWORD *)(v23 + 24) = off_10002C2D8;
  *v35 = v23;
  off_10002C2D8 = (_UNKNOWN **)(v23 + 16);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10002C2E0);
  (*((void (**)(void *, uint64_t, uint64_t, vm_address_t *, _QWORD))off_10002C2A0 + 2))(off_10002C2A0, v23, 1, v37, 0);
  v36 = *(NSObject **)(v23 + 96);
  if (*(_DWORD *)(v23 + 128))
  {
    dispatch_mach_connect(v36, *(unsigned int *)(v23 + 112), 0, 0);
    dispatch_mach_connect(*(_QWORD *)(v23 + 104), *(unsigned int *)(v23 + 116), 0, 0);
  }
  else
  {
    dispatch_activate(v36);
  }
  if (size)
    vm_deallocate(mach_task_self_, v37[1], size);
  return 0;
}

void sub_100002A88(unint64_t a1)
{
  unsigned __int16 *v2;
  unsigned __int16 v3;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  unint64_t *v7;
  unint64_t StatusReg;
  unint64_t v9;
  unsigned __int16 v10;
  uint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  unint64_t v14;

  dispatch_suspend(*(dispatch_object_t *)(a1 + 96));
  dispatch_suspend(*(dispatch_object_t *)(a1 + 96));
  v2 = (unsigned __int16 *)(a1 + 140);
  while (1)
  {
    v3 = __ldxr(v2);
    if ((v3 & 0x100) != 0)
    {
      __clrex();
      goto LABEL_11;
    }
    if ((v3 & 1) != 0)
      break;
    if (!__stxr(v3 | 1, v2))
      goto LABEL_5;
  }
  __clrex();
LABEL_5:
  v4 = *(unsigned __int8 *)(a1 + 147);
  if (a1 && (v3 & 1) == 0)
  {
    v5 = 2 * v4;
    v6 = &dword_10002C270[8 * v4 + 30];
    *(_QWORD *)(a1 + 32) = 0;
    v7 = (unint64_t *)&dword_10002C270[4 * v5 + 32];
    StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    *(_QWORD *)(StatusReg + 976) = v7;
    do
      v9 = __ldxr(v7);
    while (__stlxr(a1, v7));
    if (v9)
    {
      *(_QWORD *)(v9 + 32) = a1;
      *(_QWORD *)(StatusReg + 976) = 0;
    }
    else
    {
      *(_QWORD *)v6 = a1;
      *(_QWORD *)(StatusReg + 976) = 0;
      dispatch_source_merge_data(*(dispatch_source_t *)&dword_10002C270[2 * v5 + 46], 1uLL);
    }
  }
  while (1)
  {
LABEL_11:
    v10 = __ldxr(v2);
    if ((v10 & 0x200) != 0)
    {
      __clrex();
      return;
    }
    if ((v10 & 2) != 0)
      break;
    if (!__stxr(v10 | 2, v2))
      goto LABEL_14;
  }
  __clrex();
LABEL_14:
  v11 = 3;
  if (!*(_BYTE *)(a1 + 147))
    v11 = 1;
  if (a1 && (v10 & 2) == 0)
  {
    *(_QWORD *)(a1 + 40) = 0;
    v12 = (unint64_t *)&dword_10002C270[4 * v11 + 32];
    v13 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    *(_QWORD *)(v13 + 976) = v12;
    do
      v14 = __ldxr(v12);
    while (__stlxr(a1, v12));
    if (v14)
    {
      *(_QWORD *)(v14 + 40) = a1;
      *(_QWORD *)(v13 + 976) = 0;
    }
    else
    {
      *(_QWORD *)&dword_10002C270[4 * v11 + 30] = a1;
      *(_QWORD *)(v13 + 976) = 0;
      dispatch_source_merge_data(*(dispatch_source_t *)&dword_10002C270[2 * v11 + 46], 1uLL);
    }
  }
}

void sub_100002BE8(NSObject *a1)
{
  if ((dispatch_source_get_mask(a1) & 0x21) != 0)
    sub_100005B94();
  else
    dispatch_source_merge_data((dispatch_source_t)qword_10003A948, 1uLL);
}

#error "100002CBC: switch analysis failed: switch information is incomplete or incorrect (funcsize=51)"

void sub_100002CF8(_xpc_connection_s *a1, xpc_object_t original)
{
  xpc_object_t reply;
  void *v4;
  const char *v5;
  __int128 v6;
  int v7;
  int v8;
  char *v9;
  uint64_t v10;
  int v11;
  int v12;
  char *v13;
  uint64_t v14;
  int v15;
  int v16;
  char *v17;
  uint64_t v18;
  int v19;
  int v20;
  int v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;

  reply = xpc_dictionary_create_reply(original);
  if (!reply)
    return;
  v4 = reply;
  if (qword_10003A9B0 != -1)
    dispatch_once(&qword_10003A9B0, &stru_10002A6F0);
  v5 = (const char *)qword_10003A998;
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v24 = v6;
  v25 = v6;
  xpc_connection_get_audit_token(a1, &v24);
  v7 = open(v5, 0);
  if (v7 == -1)
  {
    v18 = *__error();
  }
  else
  {
    v8 = v7;
    xpc_dictionary_set_fd(v4, "persistdir_fd", v7);
    if (close(v8) != -1)
      goto LABEL_6;
    v19 = *__error();
    v18 = *__error();
    if (v19 == 9)
    {
      qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
      qword_10002DF78 = v18;
      __break(1u);
      goto LABEL_32;
    }
  }
  _os_assumes_log(v18);
LABEL_6:
  v22 = v24;
  v23 = v25;
  v9 = (char *)sandbox_extension_issue_file_to_process("com.apple.logd.read-only", v5, 0, &v22);
  if (v9)
    xpc_dictionary_set_string(v4, "persistdir_sbext", v9);
  free(v9);
  if (qword_10003A9B0 != -1)
    dispatch_once(&qword_10003A9B0, &stru_10002A6F0);
  v10 = qword_10003A9A0;
  v11 = open((const char *)qword_10003A9A0, 0);
  if (v11 == -1)
  {
    v18 = *__error();
    goto LABEL_28;
  }
  v12 = v11;
  xpc_dictionary_set_fd(v4, "timesyncdir_fd", v11);
  if (close(v12) != -1)
    goto LABEL_12;
  v20 = *__error();
  v18 = *__error();
  if (v20 == 9)
  {
LABEL_32:
    qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_10002DF78 = v18;
    __break(1u);
    goto LABEL_33;
  }
LABEL_28:
  _os_assumes_log(v18);
LABEL_12:
  v22 = v24;
  v23 = v25;
  v13 = (char *)sandbox_extension_issue_file_to_process("com.apple.logd.read-only", v10, 0, &v22);
  if (v13)
    xpc_dictionary_set_string(v4, "timesyncdir_sbext", v13);
  free(v13);
  if (qword_10003A9B0 != -1)
    dispatch_once(&qword_10003A9B0, &stru_10002A6F0);
  v14 = qword_10003A9A8;
  v15 = open((const char *)qword_10003A9A8, 0);
  if (v15 == -1)
  {
    v18 = *__error();
LABEL_30:
    _os_assumes_log(v18);
    goto LABEL_18;
  }
  v16 = v15;
  xpc_dictionary_set_fd(v4, "uuidtextdir_fd", v15);
  if (close(v16) == -1)
  {
    v21 = *__error();
    v18 = *__error();
    if (v21 != 9)
      goto LABEL_30;
LABEL_33:
    qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_10002DF78 = v18;
    __break(1u);
    return;
  }
LABEL_18:
  v22 = v24;
  v23 = v25;
  v17 = (char *)sandbox_extension_issue_file_to_process("com.apple.logd.read-only", v14, 0, &v22);
  if (v17)
    xpc_dictionary_set_string(v4, "uuidtextdir_sbext", v17);
  free(v17);
  xpc_connection_send_message(a1, v4);
  xpc_release(v4);
}

void sub_100003094(id a1, void *a2)
{
  xpc_type_t type;

  type = xpc_get_type(a2);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    sub_100003FD8((_xpc_connection_s *)a2);
  }
  else
  {
    qword_10002DF48 = (uint64_t)"BUG IN LIBTRACE: Unexpected xpc object";
    qword_10002DF78 = (uint64_t)type;
    __break(1u);
  }
}

uint64_t sub_1000030F4(NSObject *a1)
{
  int handle;
  uint64_t result;
  int v3;

  handle = dispatch_source_get_handle(a1);
  result = close(handle);
  if ((_DWORD)result == -1)
  {
    v3 = *__error();
    result = *__error();
    if (v3 == 9)
    {
      qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
      qword_10002DF78 = result;
      __break(1u);
    }
    else
    {
      return _os_assumes_log(result);
    }
  }
  return result;
}

void sub_100003164(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  dispatch_queue_t *v4;
  unsigned int v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  unsigned int v13;
  uint64_t *v14;
  uint64_t v15;
  __uint64_t v16;
  double v17;
  __int128 *v19;
  time_t v20;
  time_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  size_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
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
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char v75;
  int v76;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  unint64_t v87;
  unint64_t v88;
  uint64_t v89;
  char is_development_build;
  double v91;
  unint64_t v93;
  unint64_t v94;
  uint64_t v95;
  size_t v96;
  unint64_t v97;
  unint64_t v98;
  unint64_t v99;
  uint64_t v100;
  unint64_t v101;
  unint64_t v102;
  uint64_t v103;
  _BOOL8 v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  time_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  char v143;
  int v144;
  _BYTE *v145;
  unint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  size_t v169;
  char v170;
  char v171;
  char v172;
  char v173;
  char v174;
  char v175;
  BOOL v176;
  _BOOL4 v177;
  uint64_t v178;
  unint64_t v179;
  void *v180;
  void *context;
  void *contexta;
  time_t v183;
  size_t __nel;
  uint64_t v186;
  uint64_t v187;
  _QWORD v188[5];
  char v189;
  _QWORD v190[5];
  BOOL v191;
  void *v192;
  uint64_t v193;
  unint64_t v194;
  _BYTE v195[1024];
  _QWORD __b[128];
  const __CFString *v197;
  const __CFString *v198;
  const __CFString *v199;
  const __CFString *v200;
  const __CFString *v201;
  const __CFString *v202;
  const __CFString *v203;
  const __CFString *v204;
  const __CFString *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  char __str[1032];

  v3 = *(_QWORD *)(a1 + 8);
  if (v3)
    v4 = (dispatch_queue_t *)(v3 + 16);
  else
    v4 = (dispatch_queue_t *)a1;
  dispatch_assert_queue_V2(*v4);
  v5 = *(unsigned __int8 *)(a1 + 1240);
  if (v5 > 4)
    return;
  v188[0] = _NSConcreteStackBlock;
  v188[1] = 0x40000000;
  v188[2] = sub_100005880;
  v188[3] = &unk_100029098;
  v188[4] = a1;
  v189 = v5;
  sub_100005828((uint64_t)v188);
  __nel = rb_tree_count((rb_tree_t *)(a1 + 1176));
  v6 = _os_trace_calloc(1, 8 * __nel);
  v7 = rb_tree_iterate((rb_tree_t *)(a1 + 1176), 0, 1u);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = rb_tree_iterate((rb_tree_t *)(a1 + 1176), v8, 1u);
      rb_tree_remove_node((rb_tree_t *)(a1 + 1176), v8);
      if (v9 == 0x3FFFFFFF8)
        break;
      if (v9 > ~v6)
        goto LABEL_108;
      *(_QWORD *)(v6 + v9) = v8;
      v10 += v8[3];
      v9 += 8;
      v8 = v11;
      if (!v11)
        goto LABEL_12;
    }
LABEL_109:
    __break(0x5500u);
  }
  v10 = 0;
LABEL_12:
  v12 = __nel;
  qsort((void *)v6, __nel, 8uLL, (int (__cdecl *)(const void *, const void *))sub_10001051C);
  v13 = *(unsigned __int8 *)(a1 + 1240);
  if (v13 <= 3)
  {
    v14 = *(uint64_t **)(a1 + 8);
    v15 = v14[17];
    v14[16] = v15;
    v16 = clock_gettime_nsec_np(_CLOCK_MONOTONIC);
    v14[17] = v16;
    v17 = (double)v14[6] / ((double)(v16 - v15) / 1000000000.0);
    if (v17 <= -1.0 || v17 >= 1.84467441e19)
      goto LABEL_110;
    v19 = &xmmword_10003A970;
    if (v13 == 3)
      v19 = (__int128 *)((char *)&xmmword_10003A970 + 8);
    if (*(_QWORD *)v19 < (unint64_t)v17)
    {
      v177 = v5 == 3;
      if ((v5 == 3 || !(_BYTE)word_10003A990) && (v5 != 3 || !HIBYTE(word_10003A990)))
      {
        is_development_build = _os_trace_is_development_build();
        if (v5 == 3 || (is_development_build & 1) == 0)
        {
          v100 = 1;
        }
        else
        {
          v91 = *(double *)&qword_10003A988 * (double)v10;
          if (v91 <= -1.0 || v91 >= 1.84467441e19)
          {
LABEL_110:
            __break(0x5505u);
            return;
          }
          v93 = (unint64_t)v91;
          if (v5 == 1)
            v94 = 1;
          else
            v94 = qword_10003A980;
          v95 = *(_QWORD *)v6;
          if (strcmp((const char *)(*(_QWORD *)v6 + 32), "/kernel") || *(_QWORD *)(v95 + 24) < v93)
          {
            if (v94 >= __nel)
              v96 = __nel;
            else
              v96 = v94;
            if (v96)
            {
              v97 = 0;
              v98 = 0;
              v99 = 0;
              while (!(v98 >> 60) && v97 <= ~v6)
              {
                v100 = v98 + 1;
                v99 += *(_QWORD *)(*(_QWORD *)(v6 + 8 * v98) + 24);
                if (v99 >= v93)
                  goto LABEL_78;
                v97 += 8;
                ++v98;
                if (v96 == v100)
                  goto LABEL_25;
              }
              goto LABEL_108;
            }
            goto LABEL_25;
          }
          if (__nel >= 2)
            v100 = 2;
          else
            v100 = __nel;
          if (!v100)
            goto LABEL_25;
        }
LABEL_78:
        v101 = 0;
        v102 = 0;
        v176 = v5 == 3;
        v179 = ~v6;
        v187 = v6;
        v178 = v100;
        while (1)
        {
          if (v102 >> 60 || v101 > v179)
            goto LABEL_108;
          v103 = *(_QWORD *)(v6 + v101);
          if (strcmp((const char *)(v103 + 32), "/kernel"))
            break;
          if ((_os_trace_is_development_build() & 1) == 0)
          {
            memset(&__str[21], 170, 0x3EBuLL);
            strcpy(__str, "Quarantined: /kernel");
            sub_100013FF0((uint64_t)__str);
            v104 = 0;
            byte_10003A7C8 = 1;
            goto LABEL_85;
          }
LABEL_98:
          ++v102;
          v101 += 8;
          if (v100 == v102)
            goto LABEL_25;
        }
        v190[0] = _NSConcreteStackBlock;
        v190[1] = 0x40000000;
        v190[2] = sub_1000123B4;
        v190[3] = &unk_1000290F8;
        v190[4] = v103;
        v191 = v176;
        sub_100005828((uint64_t)v190);
        v104 = v177;
LABEL_85:
        memset(__b, 170, sizeof(__b));
        v194 = 0xAA00000000000000;
        v192 = __b;
        v193 = 0x40000000000;
        sub_100004728(&v192, "--- !logd quarantine record\n", v105, v106, v107, v108, v109, v110, v170);
        v111 = time(0);
        memset(v195, 170, sizeof(v195));
        v118 = "Quaratine";
        if (v104)
          v118 = "Super Quarantine";
        sub_100004728(&v192, "type         : %s\n", v112, v113, v114, v115, v116, v117, (char)v118);
        snprintf(v195, 0x400uLL, "%s/%016llx.tracev3", *(const char **)(a2 + 8), *(_QWORD *)(a2 + 24) - 1);
        sub_100004728(&v192, "file         : %s\n", v119, v120, v121, v122, v123, v124, (char)v195);
        sub_100004728(&v192, "client       : %s\n", v125, v126, v127, v128, v129, v130, v103 + 32);
        sub_100004728(&v192, "time         : ", v131, v132, v133, v134, v135, v136, v175);
        sub_100004068((tm *)&v192, v111);
        __str[0] = 10;
        if ((v194 & 0x200000000) == 0)
        {
          v143 = BYTE6(v194);
          v144 = v193;
          if (SBYTE6(v194) + HIDWORD(v193) - 1 == (_DWORD)v193)
          {
            sub_1000078E8((uint64_t)&v192, __str, 1uLL);
          }
          else
          {
            v145 = v192;
            v146 = ~(unint64_t)v192;
            if (~(unint64_t)v192 < v193)
              goto LABEL_108;
            *((_BYTE *)v192 + v193) = 10;
            v147 = (v144 + 1);
            LODWORD(v193) = v147;
            if (!v143)
            {
              if (v146 < v147)
                goto LABEL_108;
              v145[v147] = 0;
            }
          }
        }
        contexta = (void *)v102;
        sub_100004728(&v192, "time covered : %llu\n", v137, v138, v139, v140, v141, v142, (*(_QWORD *)(a2 + 136) - *(_QWORD *)(a2 + 128)) / 0x3B9ACA00uLL);
        sub_100004728(&v192, "client total : %zu\n", v148, v149, v150, v151, v152, v153, *(_QWORD *)(v103 + 24));
        sub_100004728(&v192, "overall total: %zu\n\n", v154, v155, v156, v157, v158, v159, v10);
        sub_1000106D0();
        if ((v194 & 0x100000000) != 0)
        {
          v160 = v192;
          v192 = (void *)3954044928;
          WORD2(v194) = 0;
          free(v160);
        }
        v180 = objc_autoreleasePoolPush();
        bzero(__str, 0x400uLL);
        snprintf(__str, 0x400uLL, "%s/%016llx.tracev3", *(const char **)(a2 + 8), *(_QWORD *)(a2 + 24) - 1);
        v205 = CFSTR("logd quarantine");
        v197 = CFSTR("record");
        v198 = CFSTR("superQuarantine");
        v161 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v104));
        v206 = v161;
        v199 = CFSTR("file");
        v162 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", __str));
        v207 = v162;
        v200 = CFSTR("client");
        v163 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v103 + 32));
        v208 = v163;
        v201 = CFSTR("unixTime");
        v164 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", v111));
        v209 = v164;
        v202 = CFSTR("timeCovered");
        v165 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (*(_QWORD *)(a2 + 136) - *(_QWORD *)(a2 + 128)) / 0x3B9ACA00uLL));
        v210 = v165;
        v203 = CFSTR("sizeBytes");
        v166 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", *(_QWORD *)(v103 + 24)));
        v211 = v166;
        v204 = CFSTR("totalBytes");
        v167 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", v10));
        v212 = v167;
        v168 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v205, &v197, 8));

        v169 = sub_1000023A0((char *)__b, 0x400uLL, v168);
        objc_autoreleasePoolPop(v180);
        if (v169)
          sub_100012478();
        v6 = v187;
        v12 = __nel;
        v100 = v178;
        v102 = (unint64_t)contexta;
        goto LABEL_98;
      }
    }
  }
LABEL_25:
  os_unfair_lock_lock_with_options(&stru_10002DFA0, 0x10000);
  v20 = time(0);
  v21 = v20;
  v22 = a2;
  if (a2)
  {
    v183 = v20;
    v186 = v6;
    if (v12 >= 0x32)
      v23 = 50;
    else
      v23 = v12;
    context = objc_autoreleasePoolPush();
    bzero(__str, 0x400uLL);
    snprintf(__str, 0x400uLL, "%s/%016llx.tracev3", *(const char **)(a2 + 8), *(_QWORD *)(a2 + 24) - 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", v23));
    if (v23)
    {
      v25 = 0;
      v26 = ~v6;
      v27 = 8 * v23;
      while (v25 <= v26)
      {
        v28 = *(_QWORD *)(v186 + v25);
        v29 = *(_QWORD *)(v28 + 24);
        v30 = v28 + 32;
        v197 = CFSTR("sizeBytes");
        v31 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", v29));
        v205 = v31;
        v198 = CFSTR("process");
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v30));
        v206 = v32;
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v205, &v197, 2));
        objc_msgSend(v24, "addObject:", v33);

        v25 += 8;
        if (v27 == v25)
          goto LABEL_33;
      }
      goto LABEL_108;
    }
LABEL_33:
    *(_QWORD *)v195 = CFSTR("record");
    *(_QWORD *)&v195[8] = CFSTR("type");
    __b[0] = CFSTR("logd statistics");
    __b[1] = CFSTR("File Rotate");
    *(_QWORD *)&v195[16] = CFSTR("file");
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", __str));
    __b[2] = v34;
    *(_QWORD *)&v195[24] = CFSTR("unixTime");
    v21 = v183;
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", v183));
    __b[3] = v35;
    *(_QWORD *)&v195[32] = CFSTR("totalBytes");
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", v10));
    *(_QWORD *)&v195[40] = CFSTR("processList");
    __b[4] = v36;
    __b[5] = v24;
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", __b, v195, 6));

    v38 = sub_1000023A0(byte_10002DFA4, 0xC800uLL, v37);
    objc_autoreleasePoolPop(context);
    v22 = a2;
    v6 = v186;
    v12 = __nel;
    if (v38)
    {
      sub_100010568();
      dword_10002C34C = sub_100003EA0(dword_10002C34C, "logdata.statistics.0.jsonl", "logdata.statistics.1.jsonl", 5242880);
    }
  }
  memset(__str, 170, 0x400uLL);
  *(_QWORD *)&v195[16] = 0xAA00000000000000;
  *(_QWORD *)v195 = __str;
  *(_QWORD *)&v195[8] = 0x40000000000;
  sub_100004728(v195, "--- !logd statistics record\n", v39, v40, v41, v42, v43, v44, v170);
  if (v22)
  {
    memset(__b, 170, sizeof(__b));
    snprintf((char *)__b, 0x400uLL, "%s/%016llx.tracev3", *(const char **)(v22 + 8), *(_QWORD *)(v22 + 24) - 1);
    sub_100004728(v195, "type  : File Rotate\n", v51, v52, v53, v54, v55, v56, v172);
    sub_100004728(v195, "file  : %s\n", v57, v58, v59, v60, v61, v62, (char)__b);
  }
  else
  {
    sub_100004728(v195, "type  : Memory Rollover\n", v45, v46, v47, v48, v49, v50, v171);
  }
  sub_100004728(v195, "time  : ", v63, v64, v65, v66, v67, v68, v173);
  sub_100004068((tm *)v195, v21);
  LOBYTE(__b[0]) = 10;
  if ((v195[20] & 2) == 0)
  {
    v75 = v195[22];
    v76 = *(_DWORD *)&v195[8];
    if (v195[22] + *(_DWORD *)&v195[12] - 1 == *(_DWORD *)&v195[8])
      goto LABEL_107;
    v77 = *(_QWORD *)v195;
    v78 = ~*(_QWORD *)v195;
    if (~*(_QWORD *)v195 < (unint64_t)*(unsigned int *)&v195[8])
      goto LABEL_108;
    *(_BYTE *)(*(_QWORD *)v195 + *(unsigned int *)&v195[8]) = 10;
    v79 = (v76 + 1);
    *(_DWORD *)&v195[8] = v79;
    if (!v75)
    {
      if (v78 < v79)
      {
LABEL_108:
        __break(0x5513u);
        goto LABEL_109;
      }
      *(_BYTE *)(v77 + v79) = 0;
    }
  }
  while (1)
  {
    sub_100004728(v195, "total : %zu\n", v69, v70, v71, v72, v73, v74, v10);
    sub_100004728(v195, "procs :\n", v80, v81, v82, v83, v84, v85, v174);
    sub_100003E60();
    if ((v195[20] & 1) == 0)
      break;
    qword_10002DF48 = (uint64_t)"BUG IN LIBTRACE: Buffer needs free";
    __break(1u);
LABEL_107:
    sub_1000078E8((uint64_t)v195, __b, 1uLL);
  }
  if (v12)
  {
    v86 = 0;
    v87 = 0;
    v88 = ~v6;
    do
    {
      if (v87 <= 0x13)
      {
        if (v86 > v88)
          goto LABEL_108;
        v89 = *(_QWORD *)(v6 + v86);
        memset(__str, 170, 0x400uLL);
        snprintf(__str, 0x400uLL, "    - [ %10zu, %5.1f, %s ]\n", *(_QWORD *)(v89 + 24), (double)*(unint64_t *)(v89 + 24) / (double)v10 * 100.0, (const char *)(v89 + 32));
        sub_100003E60();
      }
      if (v87 >> 60 || v86 > v88)
        goto LABEL_108;
      free(*(void **)(v6 + v86));
      ++v87;
      v86 += 8;
    }
    while (v12 != v87);
  }
  sub_100003E60();
  dword_10002C348 = sub_100003EA0(dword_10002C348, "logdata.statistics.0.txt", "logdata.statistics.1.txt", 0x100000);
  os_unfair_lock_unlock(&stru_10002DFA0);
  free((void *)v6);
}

uint64_t sub_100003E60()
{
  uint64_t result;
  int *v1;

  result = dword_10002C348;
  if ((dword_10002C348 & 0x80000000) == 0)
  {
    result = _os_trace_write();
    if (result == -1)
    {
      v1 = __error();
      return _os_assumes_log(*v1);
    }
  }
  return result;
}

uint64_t sub_100003EA0(uint64_t a1, const char *a2, const char *a3, off_t a4)
{
  uint64_t v7;
  off_t v8;
  uint64_t result;
  int *v10;
  int v11;
  int *v12;
  int *v13;

  v7 = a1;
  v8 = lseek(a1, 0, 2);
  if (v8 == -1)
  {
    v10 = __error();
    _os_assumes_log(*v10);
  }
  fsync(v7);
  if (v8 < a4)
    return v7;
  if (close(v7) != -1)
  {
LABEL_5:
    if (renameat(dword_10002DBF8, a2, dword_10002DBF8, a3) == -1)
    {
      v12 = __error();
      _os_assumes_log(*v12);
    }
    v7 = openat(dword_10002DBF8, a2, 778, 420);
    if ((_DWORD)v7 == -1)
    {
      v13 = __error();
      _os_assumes_log(*v13);
    }
    return v7;
  }
  v11 = *__error();
  result = *__error();
  if (v11 != 9)
  {
    _os_assumes_log(result);
    goto LABEL_5;
  }
  qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_10002DF78 = result;
  __break(1u);
  return result;
}

void sub_100003FD8(_xpc_connection_s *a1)
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 0x40000000;
  v2[2] = sub_1000048B0;
  v2[3] = &unk_1000295E0;
  v2[4] = a1;
  xpc_connection_set_event_handler(a1, v2);
  xpc_connection_activate(a1);
}

tm *sub_100004068(tm *result, time_t a2)
{
  tm *v2;
  __int128 v3;
  uint64_t v4;
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
  tm v16;
  time_t v17;

  v17 = a2;
  if (BYTE2(result->tm_year))
  {
    qword_10002DF48 = (uint64_t)"BUG IN LIBTRACE: Can't use addf() in binary blobs";
    __break(1u);
    goto LABEL_9;
  }
  v2 = result;
  if ((result->tm_year & 2) == 0)
  {
    v16.tm_zone = (char *)0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v16.tm_mon = v3;
    *(_OWORD *)&v16.tm_isdst = v3;
    *(_OWORD *)&v16.tm_sec = v3;
    result = localtime_r(&v17, &v16);
    if (result)
    {
      if (!__OFADD__(v16.tm_year, 1900) && !__OFADD__(v16.tm_mon, 1))
      {
        sub_100004728(v2, "%04d-%02d-%02d %02d:%02d:%02d", v4, v5, v6, v7, v8, v9, LOBYTE(v16.tm_year) + 108);
        return (tm *)sub_100004728(v2, "%+05ld", v10, v11, v12, v13, v14, v15, (v16.tm_gmtoff / 60 % 60) + 100 * (v16.tm_gmtoff / 3600));
      }
LABEL_9:
      __break(0x5500u);
    }
  }
  return result;
}

void sub_1000041BC(_xpc_connection_s *a1, xpc_object_t xdict)
{
  unsigned int uint64;
  int v5;
  int v6;
  pid_t pid;
  time_t v8;
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  int tm_hour;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  char v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  size_t v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  void **v50;
  uint64_t i;
  char v52;
  char v53;
  _QWORD v54[7];
  char v55;
  char v56;
  tm v57[20];
  mach_vm_address_t address;
  mach_vm_size_t size;
  void *v60;
  int v61;
  char v62;
  char v63[1024];
  _QWORD v64[3];
  _QWORD __src[3];

  if (qword_10003A7D8 != -1)
    dispatch_once(&qword_10003A7D8, &stru_100029178);
  uint64 = xpc_dictionary_get_uint64(xdict, "logd_snapshot_flags");
  v5 = xpc_dictionary_dup_fd(xdict, "snapshot_file_descriptor");
  if (v5 < 0)
  {
    sub_1000069E0(a1, xdict, 22);
  }
  else
  {
    v6 = v5;
    memset(&v57[0].tm_wday, 170, 0x400uLL);
    pid = xpc_connection_get_pid(a1);
    if (proc_pidpath(pid, &v57[0].tm_wday, 0x400u) <= 0)
      strcpy((char *)&v57[0].tm_wday, "<unknown>");
    v8 = time(0);
    memset(v63, 170, sizeof(v63));
    *(_QWORD *)&v57[0].tm_mon = 0xAA00000000000000;
    *(_QWORD *)&v57[0].tm_sec = v63;
    *(_QWORD *)&v57[0].tm_hour = 0x40000000000;
    sub_100004728(v57, "--- !logd snapshot record\n", v9, v10, v11, v12, v13, v14, v52);
    sub_100004728(v57, "client : %s\n", v15, v16, v17, v18, v19, v20, (char)&v57[0].tm_wday);
    sub_100004728(v57, "time   : ", v21, v22, v23, v24, v25, v26, v53);
    sub_100004068(v57, v8);
    LOBYTE(__src[0]) = 10;
    if ((v57[0].tm_year & 2) == 0)
    {
      v33 = BYTE2(v57[0].tm_year);
      tm_hour = v57[0].tm_hour;
      if (SBYTE2(v57[0].tm_year) + v57[0].tm_mday - 1 == v57[0].tm_hour)
      {
        sub_1000078E8((uint64_t)v57, __src, 1uLL);
      }
      else
      {
        v35 = *(_QWORD *)&v57[0].tm_sec;
        v36 = ~*(_QWORD *)&v57[0].tm_sec;
        if (~*(_QWORD *)&v57[0].tm_sec < (unint64_t)v57[0].tm_hour)
          goto LABEL_25;
        *(_BYTE *)(*(_QWORD *)&v57[0].tm_sec + v57[0].tm_hour) = 10;
        v37 = (tm_hour + 1);
        v57[0].tm_hour = v37;
        if (!v33)
        {
          if (v36 < v37)
            goto LABEL_25;
          *(_BYTE *)(v35 + v37) = 0;
        }
      }
    }
    v38 = uint64 & 1;
    sub_100004728(v57, "flags  : 0x%llx\n\n", v27, v28, v29, v30, v31, v32, uint64);
    sub_1000106D0();
    if ((v57[0].tm_year & 1) != 0)
      free(*(void **)&v57[0].tm_sec);
    v39 = (uint64 >> 1) & 1;
    v40 = objc_autoreleasePoolPush();
    __src[0] = CFSTR("logd snapshot");
    v64[0] = CFSTR("record");
    v64[1] = CFSTR("client");
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", &v57[0].tm_wday));
    __src[1] = v41;
    v64[2] = CFSTR("unixTime");
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", v8));
    __src[2] = v42;
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", __src, v64, 3));

    v44 = sub_1000023A0(v63, 0x400uLL, v43);
    objc_autoreleasePoolPop(v40);
    if (v44)
      sub_100012478();
    dispatch_semaphore_wait((dispatch_semaphore_t)qword_10003A7D0, 0xFFFFFFFFFFFFFFFFLL);
    v45 = dispatch_queue_create("com.apple.logd.snapshot", 0);
    v46 = dispatch_queue_create("com.apple.logd.snapshot.book", 0);
    v47 = dispatch_group_create();
    bzero(&v57[0].tm_gmtoff, 0x4D0uLL);
    dword_10002DE84 = v6;
    qword_10002DE50 = (uint64_t)v46;
    *(_QWORD *)&v57[0].tm_wday = v45;
    *(_QWORD *)&v57[0].tm_isdst = &off_10002DE40;
    v62 = 5;
    sub_100001B70((uint64_t)&v57[0].tm_wday, 0x20000);
    dispatch_group_enter(v47);
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 0x40000000;
    v54[2] = sub_100008D10;
    v54[3] = &unk_1000291D8;
    v55 = v39;
    v54[4] = v47;
    v54[5] = &v57[0].tm_wday;
    v56 = v38;
    v54[6] = v45;
    sub_1000018F4(v54);
    dispatch_group_wait(v47, 0xFFFFFFFFFFFFFFFFLL);
    sub_100001A74((uint64_t)&v57[0].tm_wday);
    if (v61 >= 1)
    {
      v48 = 0;
      v49 = 272;
      while (!__CFADD__(v60, v49 - 272))
      {
        v50 = (void **)((char *)v60 + v49);
        sub_1000019FC(*(_QWORD *)((char *)v60 + v49 - 48));
        free(*v50);
        ++v48;
        v49 += 280;
        if (v48 >= v61)
          goto LABEL_20;
      }
LABEL_25:
      __break(0x5513u);
    }
LABEL_20:
    free(v60);
    mach_vm_deallocate(mach_task_self_, address, size);
    for (i = 0; i != 1056; i += 264)
    {
      sub_1000046BC(*(void ***)((char *)&v57[5].tm_mon + i), (uint64_t (*)(_QWORD))&_os_release);
      sub_1000046BC(*(void ***)((char *)&v57[5].tm_wday + i), (uint64_t (*)(_QWORD))sub_10000F5B0);
    }
    sub_100010734((uint64_t)&off_10002DE40);
    qword_10002DE50 = 0;
    dispatch_release(v47);
    dispatch_release(v45);
    dispatch_release(v46);
    sub_1000069E0(a1, xdict, 0);
    dispatch_semaphore_signal((dispatch_semaphore_t)qword_10003A7D0);
  }
}

_QWORD *sub_1000046BC(void **a1, uint64_t (*a2)(_QWORD))
{
  _QWORD *result;
  _QWORD *v4;
  _QWORD *v5;
  void *v6;

  result = sub_10000F32C(a1, a2);
  if (a1)
  {
    v4 = a1[2];
    if (v4)
    {
      do
      {
        v5 = (_QWORD *)*v4;
        operator delete(v4);
        v4 = v5;
      }
      while (v5);
    }
    v6 = *a1;
    *a1 = 0;
    if (v6)
      operator delete(v6);
    operator delete();
  }
  return result;
}

uint64_t sub_100004728(_QWORD *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (*((_BYTE *)a1 + 22))
  {
    qword_10002DF48 = (uint64_t)"BUG IN LIBTRACE: Can't use addf() in binary blobs";
    __break(1u);
    return 0;
  }
  if ((*((_WORD *)a1 + 10) & 2) != 0)
    return 0;
  v12 = *((_DWORD *)a1 + 2);
  v11 = *((_DWORD *)a1 + 3);
  *__error() = 0;
  v13 = *((unsigned int *)a1 + 2);
  if (__CFADD__(*a1, v13))
    goto LABEL_17;
  v14 = vsnprintf((char *)(*a1 + v13), (v11 - v12), a2, &a9);
  if ((v14 & 0x80000000) != 0)
  {
    v18 = *((unsigned int *)a1 + 2);
    if (!__CFADD__(*a1, v18))
    {
      v15 = 0;
      *(_BYTE *)(*a1 + v18) = 0;
      return v15;
    }
    goto LABEL_17;
  }
  v15 = v14;
  v16 = (v11 + ~v12);
  if (v14 > v16)
  {
    if (*((_DWORD *)a1 + 3) >= *((_DWORD *)a1 + 4))
      goto LABEL_9;
    v16 = sub_1000079B4((uint64_t)a1, v14);
    *__error() = 0;
    v17 = *((unsigned int *)a1 + 2);
    if (!__CFADD__(*a1, v17))
    {
      vsnprintf((char *)(*a1 + v17), (v16 + 1), a2, &a9);
LABEL_9:
      if (v15 > v16)
      {
        *((_WORD *)a1 + 10) |= 2u;
        v15 = v16;
      }
      goto LABEL_11;
    }
LABEL_17:
    __break(0x5513u);
  }
LABEL_11:
  *((_DWORD *)a1 + 2) += v15;
  return v15;
}

#error "100004BC0: switch analysis failed: switch information is incomplete or incorrect (funcsize=219)"

uint64_t sub_100004C58(_QWORD *a1)
{
  kern_return_t v2;
  uint64_t v3;
  memory_object_offset_t v4;
  kern_return_t memory_entry_64;
  uint64_t result;
  memory_object_size_t size;

  size = a1[5];
  if (dword_10002C2BC)
  {
    v2 = mach_port_deallocate(mach_task_self_, dword_10002C2BC);
    if (v2 == -301)
      sub_1000226B4();
    if (v2)
      _dispatch_bug(1024, v2);
  }
  if (qword_10002C2C8)
    munmap((void *)qword_10002C2C8, qword_10002C2C0);
  v3 = a1[5];
  qword_10002C2C8 = a1[6];
  qword_10002C2C0 = v3;
  dword_10002C2BC = 0;
  v4 = a1[6];
  if (v4)
  {
    memory_entry_64 = mach_make_memory_entry_64(mach_task_self_, &size, v4, 4194305, (mach_port_t *)&dword_10002C2BC, 0);
    if (memory_entry_64 == -301)
      sub_1000226B4();
    if (memory_entry_64)
      _dispatch_bug(1039, memory_entry_64);
  }
  result = a1[4];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_100004D48(id a1)
{
  notify_post("com.apple.system.logging.prefschanged");
}

void sub_100004D54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  mach_msg_header_t *msg;

  if (a2 == 2 && (dispatch_mach_mig_demux(a1, &off_100028D98, 1, a3) & 1) == 0)
  {
    msg = (mach_msg_header_t *)dispatch_mach_msg_get_msg(a3, 0);
    mach_msg_destroy(msg);
  }
}

void sub_100004DA8(unint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v5;
  uint64_t v6;
  char i;
  unint64_t v8;
  mach_port_name_t v9;
  _DWORD *v10;
  mach_port_name_t v11;
  char v12;
  mach_msg_header_t *msg;
  unsigned __int8 *v14;
  int v15;
  kern_return_t v16;
  const void **v17;
  CFIndex v18;
  const CFArrayCallBacks *v19;
  const __CFAllocator *v20;
  unsigned __int16 *v21;
  unsigned __int16 v22;
  uint64_t v23;
  uint64_t v24;
  int *v25;
  unint64_t *v26;
  unint64_t StatusReg;
  unint64_t v28;
  unsigned __int16 v29;
  uint64_t v30;
  unint64_t *v31;
  unint64_t v32;
  unint64_t v33;

  if (a2 > 7)
  {
    if (a2 == 8)
    {
      v14 = (unsigned __int8 *)(a1 + 142);
      do
        v15 = __ldxr(v14);
      while (__stlxr(v15 - 1, v14));
      if (v15 == 1)
      {
        atomic_load((unsigned __int8 *)(a1 + 142));
        v16 = mach_port_deallocate(mach_task_self_, *(_DWORD *)(a1 + 120));
        if (v16 == -301)
          sub_1000226B4();
        if (v16)
          _dispatch_bug(91, v16);
        *(_DWORD *)(a1 + 120) = 0;
        v20 = (const __CFAllocator *)*(unsigned int *)(a1 + 112);
        if (((_DWORD)v20 + 1) >= 2
          || (v20 = (const __CFAllocator *)*(unsigned int *)(a1 + 116), ((_DWORD)v20 + 1) > 1))
        {
          sub_10002276C(v20, v17, v18, v19);
        }
        v21 = (unsigned __int16 *)(a1 + 140);
        do
        {
          v22 = __ldxr(v21);
          if ((v22 & 0x110) != 0)
          {
            __clrex();
            goto LABEL_35;
          }
        }
        while (__stxr(v22 | 0x11, v21));
        v23 = *(unsigned __int8 *)(a1 + 147);
        if (a1 && (v22 & 1) == 0)
        {
          v24 = 2 * v23;
          v25 = &dword_10002C270[8 * v23 + 30];
          *(_QWORD *)(a1 + 32) = 0;
          v26 = (unint64_t *)&dword_10002C270[4 * v24 + 32];
          StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          *(_QWORD *)(StatusReg + 976) = v26;
          do
            v28 = __ldxr(v26);
          while (__stlxr(a1, v26));
          if (v28)
          {
            *(_QWORD *)(v28 + 32) = a1;
            *(_QWORD *)(StatusReg + 976) = 0;
          }
          else
          {
            *(_QWORD *)v25 = a1;
            *(_QWORD *)(StatusReg + 976) = 0;
            dispatch_source_merge_data(*(dispatch_source_t *)&dword_10002C270[2 * v24 + 46], 1uLL);
            v21 = (unsigned __int16 *)(a1 + 140);
          }
        }
        do
        {
LABEL_35:
          v29 = __ldxr(v21);
          if ((v29 & 0x220) != 0)
          {
            __clrex();
            return;
          }
        }
        while (__stxr(v29 | 0x22, v21));
        v30 = 3;
        if (!*(_BYTE *)(a1 + 147))
          v30 = 1;
        if (a1 && (v29 & 2) == 0)
        {
          *(_QWORD *)(a1 + 40) = 0;
          v31 = (unint64_t *)&dword_10002C270[4 * v30 + 32];
          v32 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          *(_QWORD *)(v32 + 976) = v31;
          do
            v33 = __ldxr(v31);
          while (__stlxr(a1, v31));
          if (v33)
          {
            *(_QWORD *)(v33 + 40) = a1;
            *(_QWORD *)(v32 + 976) = 0;
          }
          else
          {
            *(_QWORD *)&dword_10002C270[4 * v30 + 30] = a1;
            *(_QWORD *)(v32 + 976) = 0;
            dispatch_source_merge_data(*(dispatch_source_t *)&dword_10002C270[2 * v30 + 46], 1uLL);
          }
        }
      }
    }
    else if (a2 == 13)
    {
      dispatch_mach_cancel(*(_QWORD *)(a1 + 96));
      dispatch_mach_cancel(*(_QWORD *)(a1 + 104));
    }
  }
  else if (a2 == 2)
  {
    if ((dispatch_mach_mig_demux(a1, &off_100028D98, 1, a3) & 1) == 0)
    {
      msg = (mach_msg_header_t *)dispatch_mach_msg_get_msg(a3, 0);
      mach_msg_destroy(msg);
    }
  }
  else if (a2 == 7)
  {
    v5 = *(_DWORD *)(dispatch_mach_msg_get_msg(a3, 0) + 12);
    if (v5 - 1 <= 0xFFFFFFFD)
    {
      v6 = 0;
      for (i = 1; ; i = 0)
      {
        v8 = a1 + 4 * v6;
        v11 = *(_DWORD *)(v8 + 112);
        v10 = (_DWORD *)(v8 + 112);
        v9 = v11;
        if (v11 == v5)
          break;
        v12 = i;
        v6 = 1;
        if ((v12 & 1) == 0)
          sub_100022744(v5);
      }
      if (mach_port_destruct(mach_task_self_, v9, 0, (mach_port_context_t)v10) == -301)
        sub_1000226B4();
      *v10 = 0;
    }
  }
}

BOOL sub_100005078(_xpc_connection_s *a1, xpc_object_t xdict)
{
  xpc_object_t array;
  char uint64;
  uint64_t v6;
  _BOOL8 result;
  char v8;
  __int128 v9;
  pid_t pid;
  _QWORD applier[4];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  _BYTE *v18;
  char v19;
  char v20;
  _BYTE __b[1024];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;

  array = xpc_dictionary_get_array(xdict, "entries");
  uint64 = xpc_dictionary_get_uint64(xdict, "ttl");
  v6 = xpc_dictionary_get_uint64(xdict, "aid");
  result = xpc_dictionary_get_BOOL(xdict, "quarantined");
  if ((_DWORD)result)
    v8 = 3;
  else
    v8 = 1;
  if (array)
  {
    *(_QWORD *)&v9 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v25 = v9;
    v26 = v9;
    v23 = v9;
    v24 = v9;
    v22 = v9;
    memset(__b, 170, sizeof(__b));
    result = sub_1000056D8((uint64_t)a1, xdict, (uint64_t)&v22);
    if ((_DWORD)result)
    {
      pid = xpc_connection_get_pid(a1);
      if (proc_pidpath(pid, __b, 0x400u) <= 0)
        __b[0] = 0;
      applier[0] = _NSConcreteStackBlock;
      applier[1] = 0x40000000;
      applier[2] = sub_100006AF4;
      applier[3] = &unk_100029920;
      v14 = v24;
      v15 = v25;
      v16 = v26;
      v13 = v23;
      v12 = v22;
      v19 = uint64;
      v17 = v6;
      v18 = __b;
      v20 = v8;
      return xpc_array_apply(array, applier);
    }
  }
  return result;
}

void sub_100005200(_xpc_connection_s *a1, void *a2)
{
  __int128 v4;
  int uint64;
  _BOOL4 v6;
  int v7;
  uint64_t v8;
  pid_t pid;
  xpc_object_t reply;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  int v14;
  char v15;
  uint64_t v16;
  int v17;
  unsigned __int8 *data;
  uint64_t v19;
  uint64_t *v20;
  NSObject *v21;
  uint64_t v22;
  NSObject **v23;
  NSObject *v24;
  _QWORD block[4];
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
  __int128 v39;
  uint64_t *v40;
  _BYTE *v41;
  char __str[1024];
  _BYTE __b[1024];
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

  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v65 = v4;
  v64 = v4;
  v63 = v4;
  v62 = v4;
  v61 = v4;
  v60 = v4;
  v59 = v4;
  v58 = v4;
  v57 = v4;
  v56 = v4;
  v55 = v4;
  v54 = v4;
  v53 = v4;
  v52 = v4;
  v51 = v4;
  v50 = v4;
  v49 = v4;
  v48 = v4;
  v47 = v4;
  v46 = v4;
  v45 = v4;
  v44 = v4;
  memset(__b, 170, sizeof(__b));
  uint64 = xpc_dictionary_get_uint64(a2, "stream_id");
  v6 = xpc_dictionary_get_BOOL(a2, "quarantined");
  v7 = uint64;
  v8 = 4;
  switch(v7)
  {
    case 0:
      if (v6)
        v8 = 3;
      else
        v8 = 0;
      goto LABEL_12;
    case 1:
      if (v6)
        v8 = 3;
      else
        v8 = 1;
      goto LABEL_12;
    case 2:
      goto LABEL_12;
    case 4:
      if (v6)
        v8 = 3;
      else
        v8 = 2;
LABEL_12:
      if (!sub_1000056D8((uint64_t)a1, a2, (uint64_t)&v47))
        goto LABEL_20;
      pid = xpc_connection_get_pid(a1);
      if (proc_pidpath(pid, __b, 0x400u) < 1)
        __b[0] = 0;
      memset(__str, 170, 16);
      *(_QWORD *)&v44 = xpc_dictionary_get_data(a2, "commands", (size_t *)&__str[8]);
      *((_QWORD *)&v44 + 1) = *(_QWORD *)&__str[8];
      if ((__int128 *)((char *)&v45 + 1) != 0 && (unint64_t)&v44 >= 0xFFFFFFFFFFFFFFEFLL)
        goto LABEL_36;
      memset(__str, 170, 16);
      *(_QWORD *)&v45 = xpc_dictionary_get_data(a2, "pubdata", (size_t *)&__str[8]);
      *((_QWORD *)&v45 + 1) = *(_QWORD *)&__str[8];
      if ((unint64_t)&v44 > 0xFFFFFFFFFFFFFFDFLL)
        goto LABEL_36;
      memset(__str, 170, 16);
      *(_QWORD *)&v46 = xpc_dictionary_get_data(a2, "privdata", (size_t *)&__str[8]);
      *((_QWORD *)&v46 + 1) = *(_QWORD *)&__str[8];
      if (*((_QWORD *)&v44 + 1) > 0x8000uLL
        || *((_QWORD *)&v45 + 1) > 0x8000uLL
        || *(_QWORD *)&__str[8] > 0x8000uLL
        || (v12 = *((_QWORD *)&v44 + 1) + *(_QWORD *)&__str[8] + *((_QWORD *)&v45 + 1), v12 > 0x8000))
      {
        memset(__str, 170, sizeof(__str));
        snprintf(__str, 0x400uLL, "Received oversize message with invalid size: %zd, %zd, %zd");
LABEL_19:
        sub_100013FF0((uint64_t)__str);
      }
      else
      {
        *(_QWORD *)&v52 = 24578;
        *((_QWORD *)&v52 + 1) = v12 + 32;
        v13 = v49;
        v14 = HIDWORD(v48);
        v15 = xpc_dictionary_get_uint64(a2, "ttl");
        v16 = xpc_dictionary_get_uint64(a2, "ts");
        v17 = xpc_dictionary_get_uint64(a2, "message_id");
        *(_QWORD *)&v53 = v13;
        DWORD2(v53) = v14;
        BYTE12(v53) = v15;
        *(_WORD *)((char *)&v53 + 13) = 0;
        HIBYTE(v53) = 0;
        *(_QWORD *)&v54 = v16;
        DWORD2(v54) = v17;
        WORD6(v54) = WORD4(v44) + WORD4(v45);
        HIWORD(v54) = WORD4(v46);
        memset(__str, 170, 16);
        data = (unsigned __int8 *)xpc_dictionary_get_data(a2, "subsystem", (size_t *)&__str[8]);
        v19 = 0;
        if (data && *(_QWORD *)&__str[8] >= 4uLL)
        {
          if (*(_QWORD *)&__str[8] - 4 >= data[2] + (unint64_t)data[3])
            v19 = sub_100009838((uint64_t)data);
          else
            v19 = 0;
        }
        if (1248 * v8 > ~(unint64_t)qword_10002C398)
        {
LABEL_36:
          __break(0x5513u);
          return;
        }
        v20 = &qword_10002C398[156 * v8];
        v21 = *v20;
        *(_QWORD *)__str = _NSConcreteStackBlock;
        *(_QWORD *)&__str[8] = 0x40000000;
        *(_QWORD *)&__str[16] = sub_1000080B8;
        *(_QWORD *)&__str[24] = &unk_100029960;
        *(_QWORD *)&__str[32] = &v52;
        *(_QWORD *)&__str[40] = v20;
        *(_QWORD *)&__str[48] = 3;
        *(_QWORD *)&__str[56] = &v44;
        *(_QWORD *)&__str[64] = &v47;
        *(_QWORD *)&__str[72] = v19;
        dispatch_sync(v21, __str);
        v22 = v20[1];
        if (v22)
          v23 = (NSObject **)(v22 + 16);
        else
          v23 = (NSObject **)&qword_10002C398[156 * v8];
        v24 = *v23;
        block[0] = _NSConcreteStackBlock;
        block[1] = 0x40000000;
        block[2] = sub_1000057C8;
        block[3] = &unk_100029940;
        v36 = v62;
        v37 = v63;
        v38 = v64;
        v39 = v65;
        v32 = v58;
        v33 = v59;
        v34 = v60;
        v35 = v61;
        v28 = v54;
        v29 = v55;
        v30 = v56;
        v31 = v57;
        v26 = v52;
        v27 = v53;
        v40 = &qword_10002C398[156 * v8];
        v41 = __b;
        dispatch_sync(v24, block);
      }
LABEL_20:
      reply = xpc_dictionary_create_reply(a2);
      if (reply)
      {
        v11 = reply;
        xpc_connection_send_message(a1, reply);
        xpc_release(v11);
      }
      return;
    default:
      memset(__str, 170, sizeof(__str));
      snprintf(__str, 0x400uLL, "Received oversize message with invalid stream id: %d (%d)");
      goto LABEL_19;
  }
}

BOOL sub_1000056D8(uint64_t a1, void *a2, uint64_t a3)
{
  __int128 v5;
  int v6;
  const uint8_t *uuid;
  _OWORD *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  unint64_t v13;

  xpc_connection_get_audit_token(a1, a3);
  v13 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v11 = v5;
  v12 = v5;
  v10 = v5;
  v6 = proc_pidinfo(*(_DWORD *)(a3 + 20), 17, 1uLL, &v10, 56);
  if (v6 == 56)
  {
    *(_BYTE *)(a3 + 72) = xpc_dictionary_get_BOOL(a2, "32bits");
    *(_QWORD *)(a3 + 32) = v11;
    *(_OWORD *)(a3 + 40) = v10;
    uuid = xpc_dictionary_get_uuid(a2, "dsc_uuid");
    v8 = (_OWORD *)(a3 + 56);
    if (uuid)
    {
      *v8 = *(_OWORD *)uuid;
    }
    else
    {
      *(_QWORD *)v8 = 0;
      *(_QWORD *)(a3 + 64) = 0;
    }
  }
  return v6 == 56;
}

void sub_1000057C8(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 40) + 16;
  sub_100005964(*(_QWORD *)(a1 + 256), *(const void **)(a1 + 264), &v1);
}

void sub_100005828(uint64_t a1)
{
  uint64_t *v2;

  os_unfair_lock_lock_with_options(&unk_10003A7B0, 0x10000);
  v2 = &qword_10003A7B8;
  do
    v2 = (uint64_t *)*v2;
  while (v2 && ((*(uint64_t (**)(uint64_t, uint64_t *))(a1 + 16))(a1, v2) & 1) != 0);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10003A7B0);
}

uint64_t sub_100005880(uint64_t a1, uint64_t a2)
{
  os_unfair_lock_s *v4;
  uint64_t v5;
  _QWORD *v6;

  v4 = (os_unfair_lock_s *)(a2 + 132);
  os_unfair_lock_lock_with_options(a2 + 132, 0x10000);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = (_QWORD *)sub_10000A17C(a2, *(unsigned __int8 *)(a1 + 40));
  sub_100005964(v5, (const void *)(a2 + 138), v6);
  *(_QWORD *)sub_10000A17C(a2, *(unsigned __int8 *)(a1 + 40)) = 0;
  os_unfair_lock_unlock(v4);
  return 1;
}

void sub_100005900(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 16;
  sub_100005964(v1, *(const void **)(a1 + 48), &v2);
}

void sub_100005964(uint64_t a1, const void *a2, _QWORD *a3)
{
  uint64_t v6;
  dispatch_queue_t *v7;
  rb_tree_t *v8;
  _QWORD *node;
  size_t v10;
  size_t v11;

  v6 = *(_QWORD *)(a1 + 8);
  if (v6)
    v7 = (dispatch_queue_t *)(v6 + 16);
  else
    v7 = (dispatch_queue_t *)a1;
  dispatch_assert_queue_V2(*v7);
  if (*(unsigned __int8 *)(a1 + 1240) <= 4u && *a3)
  {
    v8 = (rb_tree_t *)(a1 + 1176);
    node = rb_tree_find_node(v8, a2);
    if (!node)
    {
      v10 = strlen((const char *)a2);
      node = (_QWORD *)_os_trace_calloc(1, v10 + 33);
      v11 = strlen((const char *)a2);
      memcpy(node + 4, a2, v11);
      rb_tree_insert_node(v8, node);
    }
    node[3] += *a3;
  }
}

_DWORD *sub_100005A2C(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }
  else
  {
    result = (_DWORD *)sub_100005A8C(result[3]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }
  return result;
}

uint64_t sub_100005A8C(int a1)
{
  unint64_t context;
  int v3;
  int v4;
  unsigned __int16 *v5;
  int v6;
  _BOOL8 v7;
  uint64_t v8;
  unint64_t *v9;
  unint64_t StatusReg;
  unint64_t v11;
  uint64_t v12;

  context = dispatch_mach_mig_demux_get_context();
  if (!context)
    return 5;
  v3 = *(_DWORD *)(context + 116);
  if (!*(_BYTE *)(context + 144))
  {
    v4 = 1 << (v3 == a1);
    v5 = (unsigned __int16 *)(context + 140);
    do
    {
      v6 = __ldxr(v5);
      if (((256 << (v3 == a1)) & v6) != 0 || (v4 & v6) != 0)
      {
        v12 = 0;
        __clrex();
        return v12;
      }
    }
    while (__stxr(v6 | v4, v5));
    v7 = v3 == a1;
    v8 = v7 | (2 * *(unsigned __int8 *)(context + 147));
    *(_QWORD *)(context + 8 * v7 + 32) = 0;
    v9 = (unint64_t *)&dword_10002C270[4 * v8 + 32];
    StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    *(_QWORD *)(StatusReg + 976) = v9;
    do
      v11 = __ldxr(v9);
    while (__stlxr(context, v9));
    if (v11)
    {
      v12 = 0;
      *(_QWORD *)(v11 + 8 * v7 + 32) = context;
      *(_QWORD *)(StatusReg + 976) = 0;
      return v12;
    }
    *(_QWORD *)&dword_10002C270[4 * v8 + 30] = context;
    *(_QWORD *)(StatusReg + 976) = 0;
    dispatch_source_merge_data(*(dispatch_source_t *)&dword_10002C270[2 * v8 + 46], 1uLL);
  }
  return 0;
}

void sub_100005B94()
{
  NSObject *v0;
  id v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  const char *v5;
  int v6;
  const char *v7;
  unsigned int v8;
  const char *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *plist_at;
  uint64_t is_development_build;
  const char *v17;
  void *v18;
  id v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  char *v31;
  id v32;
  id sysprefs;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  xpc_object_t dictionary;
  void *v40;
  void *v41;
  char v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  xpc_type_t v46;
  const char *v47;
  int v48;
  NSObject *v49;
  void *v50;
  int *v51;
  NSObject *v52;
  id v53;
  void *v54;
  uint64_t v55;
  unint64_t v56;
  char __b[1024];
  _BYTE v58[128];
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  char __str[1024];
  _BYTE v64[1024];
  char applier[1032];

  if (qword_10003A948)
  {
    v0 = 0;
  }
  else
  {
    v0 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_data_or, 0, 0, (dispatch_queue_t)qword_10003A938);
    dispatch_source_set_event_handler_f(v0, (dispatch_function_t)sub_100007344);
    dispatch_activate(v0);
    objc_storeStrong((id *)&qword_10003A948, v0);
  }
  memset(__b, 170, sizeof(__b));
  if (qword_10003A950)
    goto LABEL_52;
  v1 = objc_alloc_init((Class)NSMutableSet);
  memset(v64, 170, sizeof(v64));
  v2 = memset(__str, 170, sizeof(__str));
  v56 = 0xAA01000000100000;
  v3 = (const char *)_os_trace_sysprefsdir_path(v2);
  snprintf(__str, 0x400uLL, "%s/Subsystems", v3);
  v4 = sub_100018B30(v1, __str);
  v5 = (const char *)_os_trace_app_cryptex_sysprefsdir_path(v4);
  snprintf(__str, 0x400uLL, "%s/Subsystems", v5);
  v6 = sub_100018B30(v1, __str);
  v7 = (const char *)_os_trace_os_cryptex_sysprefsdir_path();
  snprintf(__str, 0x400uLL, "%s/Subsystems", v7);
  v8 = sub_100018B30(v1, __str);
  if (_os_trace_is_development_build())
  {
    v9 = (const char *)_os_trace_intprefsdir_path();
    snprintf(__str, 0x400uLL, "%s/Subsystems", v9);
    sub_100018B30(v1, __str);
  }
  v54 = v64;
  v55 = 0x40000000000;
  if (byte_10003A992)
  {
    v10 = v1;
    v11 = 0;
    v12 = 1;
  }
  else
  {
    v13 = memset(applier, 170, 0x400uLL);
    v14 = (const char *)_os_trace_sysprefsdir_path(v13);
    if (snprintf(applier, 0x400uLL, "%s/com.apple.logd.highvol.plist", v14) >= 1024)
      _os_assumes_log(0);
    plist_at = (void *)_os_trace_read_plist_at(4294967294, applier);
    is_development_build = _os_trace_is_development_build();
    if ((_DWORD)is_development_build)
    {
      v17 = (const char *)_os_trace_intprefsdir_path();
      if (snprintf(applier, 0x400uLL, "%s/com.apple.logd.highvol.plist", v17) >= 1024)
        _os_assumes_log(0);
      v18 = (void *)_os_trace_read_plist_at(4294967294, applier);
      v19 = sub_100018BF8(plist_at, v18);
      v20 = objc_claimAutoreleasedReturnValue(v19);

      plist_at = (void *)v20;
    }
    v21 = (const char *)_os_trace_prefsdir_path(is_development_build);
    if (snprintf(applier, 0x400uLL, "%s/com.apple.logd.highvol.plist", v21) >= 1024)
      _os_assumes_log(0);
    v22 = (void *)_os_trace_read_plist_at(4294967294, applier);
    v23 = sub_100018BF8(plist_at, v22);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v23);

    v24 = v1;
    if (v11)
    {
      *(_QWORD *)applier = _NSConcreteStackBlock;
      *(_QWORD *)&applier[8] = 3221225472;
      *(_QWORD *)&applier[16] = sub_100018CDC;
      *(_QWORD *)&applier[24] = &unk_100029FE8;
      *(_QWORD *)&applier[32] = v24;
      xpc_dictionary_apply(v11, applier);

      v12 = 0;
    }
    else
    {
      v12 = 1;
    }
  }

  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v25 = v1;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v59, v58, 16);
  if (v26)
  {
    v27 = v26;
    v52 = v0;
    v28 = v6 | v8;
    v29 = *(_QWORD *)v60;
    do
    {
      v30 = 0;
      v53 = v27;
      do
      {
        if (*(_QWORD *)v60 != v29)
          objc_enumerationMutation(v25);
        v31 = (char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)v30)), "UTF8String");
        v32 = v11;
        sysprefs = (id)_os_log_preferences_load_sysprefs(v31, 0, v28);
        if ((v12 & 1) == 0)
        {
          v34 = v29;
          v35 = v28;
          v36 = v12;
          v37 = v11;
          v38 = v25;
          dictionary = xpc_dictionary_get_dictionary(v32, v31);
          v40 = (void *)objc_claimAutoreleasedReturnValue(dictionary);
          v41 = v40;
          if (v40)
          {
            if (sysprefs)
              _os_log_preferences_merge(sysprefs, v40, 0);
            else
              sysprefs = v40;
          }

          v25 = v38;
          v11 = v37;
          v12 = v36;
          v28 = v35;
          v29 = v34;
          v27 = v53;
        }

        if (sysprefs)
          sub_100007A78(&v54, v31, sysprefs);

        v30 = (char *)v30 + 1;
      }
      while (v27 != v30);
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v59, v58, 16);
    }
    while (v27);
    v42 = BYTE4(v56);

    if ((v42 & 2) != 0)
    {
      memset(&applier[44], 170, 0x3D4uLL);
      strcpy(applier, "Logging sysprefs cache was larger than 1MB!");
      sub_100013FF0((uint64_t)applier);
      v0 = v52;
      if ((v42 & 1) != 0)
        free(v54);
      goto LABEL_51;
    }
    v0 = v52;
  }
  else
  {

    v42 = 0;
  }
  if (qword_10002DF98 != -1)
    dispatch_once(&qword_10002DF98, &stru_100028F80);
  v43 = v54;
  v44 = v55;
  if (qword_10002DF90)
    sub_100011564((uint64_t)v54, v55, 0, (uint64_t)&stru_100028F20);
  v54 = (void *)3954044928;
  if ((v42 & 1) == 0)
  {
    if (BYTE6(v56))
      v45 = v44;
    else
      v45 = (v44 + 1);
    v43 = (void *)_os_trace_memdup(v43, v45);
  }
  qword_10003A950 = (uint64_t)v43;
  if (v43)
    qword_10003A968 = v44;
LABEL_51:

LABEL_52:
  v46 = sub_100006240(3u);
  v47 = (const char *)_os_trace_prefsdir_path(v46);
  snprintf(__b, 0x400uLL, "%s/Subsystems", v47);
  mkpath_np(__b, 0x1EDu);
  v48 = open(__b, 1081600);
  if (v48 == -1)
  {
    v51 = __error();
    _os_assumes_log(*v51);
    v49 = 0;
  }
  else
  {
    v49 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_vnode, v48, 0x37uLL, (dispatch_queue_t)qword_10003A938);
    dispatch_set_context(v49, v49);
    dispatch_source_set_event_handler_f(v49, (dispatch_function_t)sub_100002BE8);
    dispatch_source_set_cancel_handler_f(v49, (dispatch_function_t)sub_1000030F4);
    dispatch_activate(v49);
  }
  if (qword_10003A958)
  {
    dispatch_source_cancel((dispatch_source_t)qword_10003A958);
    v50 = (void *)qword_10003A958;
  }
  else
  {
    v50 = 0;
  }
  qword_10003A958 = (uint64_t)v49;

  sub_100007344();
}

xpc_type_t sub_100006240(unsigned int a1)
{
  const char *v2;
  const char *v3;
  timespec v4;
  xpc_type_t result;
  xpc_object_t v6;
  xpc_type_t v7;
  char __b[1024];
  stat v9;

  v2 = (const char *)sub_1000063F8(a1);
  if (!v2)
  {
    qword_10002DF48 = (uint64_t)"BUG IN LIBTRACE: Invalid directory index";
    qword_10002DF78 = a1;
    __break(1u);
  }
  v3 = v2;
  v4.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v4.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v9.st_blksize = v4;
  *(timespec *)v9.st_qspare = v4;
  v9.st_birthtimespec = v4;
  *(timespec *)&v9.st_size = v4;
  v9.st_mtimespec = v4;
  v9.st_ctimespec = v4;
  *(timespec *)&v9.st_uid = v4;
  v9.st_atimespec = v4;
  *(timespec *)&v9.st_dev = v4;
  result = (xpc_type_t)stat(v2, &v9);
  if ((_DWORD)result)
    goto LABEL_8;
  if (12 * (unint64_t)a1 <= ~(unint64_t)dword_10002DF0C)
  {
    if (v9.st_uid == dword_10002DF0C[3 * a1]
      && v9.st_gid == dword_10002DF0C[3 * a1 + 1]
      && (v9.st_mode & 0xFFF) == LOWORD(dword_10002DF0C[3 * a1 + 2]))
    {
      memset(__b, 170, sizeof(__b));
      snprintf(__b, 0x400uLL, "%s/%s", v3, ".migrated");
      if (!stat(__b, &v9))
        return 0;
    }
LABEL_8:
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "operation", 6uLL);
    xpc_dictionary_set_uint64(v6, "directory", a1);
    v7 = sub_100002200(v6, 3);

    return v7;
  }
  __break(0x5513u);
  return result;
}

uint64_t sub_1000063F8(int a1)
{
  uint64_t result;

  switch(a1)
  {
    case 0:
      if (qword_10003A9B0 != -1)
        dispatch_once(&qword_10003A9B0, &stru_10002A6F0);
      result = qword_10003A998;
      break;
    case 1:
      if (qword_10003A9B0 != -1)
        dispatch_once(&qword_10003A9B0, &stru_10002A6F0);
      result = qword_10003A9A0;
      break;
    case 2:
      if (qword_10003A9B0 != -1)
        dispatch_once(&qword_10003A9B0, &stru_10002A6F0);
      result = qword_10003A9A8;
      break;
    case 3:
      result = _os_trace_prefsdir_path();
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

void sub_1000064D4(_xpc_connection_s *a1, xpc_object_t xdict)
{
  uint64_t uint64;
  uint64_t v5;
  char *string;
  const char *v7;
  void *v8;
  const char *v9;
  const char *v10;
  char __b[1024];

  uint64 = xpc_dictionary_get_uint64(xdict, "prefs_type");
  if (uint64 - 4 <= 0xFFFFFFFFFFFFFFFCLL
    || (v5 = uint64, (string = (char *)xpc_dictionary_get_string(xdict, "prefs_name")) == 0)
    || (v7 = string, strchr(string, 47))
    || strlen(v7) >= 0x100)
  {
    sub_1000069E0(a1, xdict, 22);
    return;
  }
  v8 = memset(__b, 170, sizeof(__b));
  if (~(unint64_t)qword_100029660 < 8 * v5)
  {
    __break(0x5513u);
    goto LABEL_16;
  }
  if ((v5 & 0x1FFFFFFFFFFFFFFCLL) != 0)
  {
LABEL_16:
    __break(1u);
    return;
  }
  v9 = (const char *)qword_100029660[v5];
  v10 = (const char *)_os_trace_prefsdir_path(v8);
  if (snprintf(__b, 0x400uLL, "%s/%s/%s.plist", v10, v9, v7) >= 1024)
    _os_assumes_log(0);
  if (!unlink(__b))
  {
    dispatch_suspend((dispatch_object_t)qword_10003A948);
    if (v5 == 1)
      sub_10001457C();
    sub_100006A48();
  }
  sub_1000069E0(a1, xdict, 0);
}

void sub_100006654(_xpc_connection_s *a1, xpc_object_t xdict)
{
  uint64_t uint64;
  uint64_t v5;
  char *string;
  const char *v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  _xpc_connection_s *v14;
  xpc_object_t v15;
  int v16;
  int v17;
  std::error_code *v18;
  int v19;
  int v20;
  int *v21;
  int v22;
  int *v23;
  int v24;
  int *v25;
  _QWORD v26[2];
  _BYTE __str[1024];
  _BYTE __b[1024];

  uint64 = xpc_dictionary_get_uint64(xdict, "prefs_type");
  if (uint64 - 4 <= 0xFFFFFFFFFFFFFFFCLL
    || (v5 = uint64, (string = (char *)xpc_dictionary_get_string(xdict, "prefs_name")) == 0)
    || (v7 = string, strchr(string, 47))
    || strlen(v7) >= 0x100)
  {
    sub_1000069E0(a1, xdict, 22);
    return;
  }
  memset(__b, 170, 16);
  v26[0] = xpc_dictionary_get_data(xdict, "prefs_data", (size_t *)&__b[8]);
  v26[1] = *(_QWORD *)&__b[8];
  if (!v26[0] || !*(_QWORD *)&__b[8])
  {
    v14 = a1;
    v15 = xdict;
    v16 = 22;
LABEL_31:
    sub_1000069E0(v14, v15, v16);
    return;
  }
  memset(__b, 170, sizeof(__b));
  v8 = (uint64_t)memset(__str, 170, sizeof(__str));
  if (~(unint64_t)qword_100029660 < 8 * v5)
  {
    __break(0x5513u);
    goto LABEL_37;
  }
  if ((v5 & 0x1FFFFFFFFFFFFFFCLL) != 0)
  {
LABEL_37:
    __break(1u);
LABEL_38:
    qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_10002DF78 = v8;
    __break(1u);
    goto LABEL_39;
  }
  v9 = (const char *)qword_100029660[v5];
  v10 = (const char *)_os_trace_prefsdir_path(v8);
  v11 = snprintf(__b, 0x400uLL, "%s/%s/%s.plist", v10, v9, v7);
  v12 = (const char *)_os_trace_prefsdir_path(v11);
  snprintf(__str, 0x400uLL, "%s/.%s.XXXXXXXX", v12, v7);
  dispatch_suspend((dispatch_object_t)qword_10003A948);
  if (qword_10003A9B8 != -1)
    dispatch_once(&qword_10003A9B8, &stru_10002A858);
  if (byte_10003A9C0)
    v13 = mkstemp_dprotected_np(__str, 4, 0);
  else
    v13 = mkstemp(__str);
  v17 = v13;
  if ((v13 & 0x80000000) != 0)
  {
    v20 = *__error();
LABEL_30:
    sub_100006A48();
    v14 = a1;
    v15 = xdict;
    v16 = v20;
    goto LABEL_31;
  }
  if (_os_trace_writev(v13, v26, 1) != -1)
  {
    if (fchmod(v17, 0x1A4u) == -1)
    {
      v21 = __error();
      _os_assumes_log(*v21);
    }
    if (close(v17) != -1)
      goto LABEL_21;
    v22 = *__error();
    v8 = *__error();
    if (v22 != 9)
    {
      _os_assumes_log(v8);
LABEL_21:
      rename((const std::__fs::filesystem::path *)__str, (const std::__fs::filesystem::path *)__b, v18);
      if (v19 == -1)
      {
        v23 = __error();
        _os_assumes_log(*v23);
      }
      if (v5 == 1)
        sub_10001457C();
      v20 = 0;
      goto LABEL_30;
    }
    goto LABEL_38;
  }
  v20 = *__error();
  if (close(v17) != -1)
  {
LABEL_28:
    if (unlink(__str) == -1)
    {
      v25 = __error();
      _os_assumes_log(*v25);
    }
    goto LABEL_30;
  }
  v24 = *__error();
  v8 = *__error();
  if (v24 != 9)
  {
    _os_assumes_log(v8);
    goto LABEL_28;
  }
LABEL_39:
  qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_10002DF78 = v8;
  __break(1u);
}

void sub_1000069E0(_xpc_connection_s *a1, xpc_object_t original, int a3)
{
  xpc_object_t reply;
  void *v6;

  reply = xpc_dictionary_create_reply(original);
  if (reply)
  {
    v6 = reply;
    xpc_dictionary_set_int64(reply, "st", a3);
    xpc_connection_send_message(a1, v6);
    xpc_release(v6);
  }
}

void sub_100006A48()
{
  NSObject *v0;

  dispatch_source_merge_data((dispatch_source_t)qword_10003A948, 1uLL);
  dispatch_resume((dispatch_object_t)qword_10003A948);
  dispatch_async_and_wait((dispatch_queue_t)qword_10003A938, &stru_100029D50);
  v0 = sub_100006AB0(2);
  dispatch_async_and_wait(v0, &stru_100029D70);

}

NSObject *sub_100006AB0(uint64_t a1)
{
  NSObject *v1;

  if ((unint64_t)(a1 - 1) >= 3)
    sub_1000226DC(a1);
  v1 = *(NSObject **)off_100028E00[a1 - 1];
  dispatch_retain(v1);
  return v1;
}

uint64_t sub_100006AF4(uint64_t a1, int a2, xpc_object_t object)
{
  const void *data;
  uint64_t v7;
  uint64_t v8;
  const uint8_t *uuid;
  const uint8_t *v10;
  __int128 v11;
  size_t v12;
  char v13;
  int v14;
  uint64_t uint64;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  size_t v19[2];
  int v20;
  char v21;
  __int16 v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
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

  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_dictionary)
  {
    v18 = 0xAAAAAAAAAAAAAAAALL;
    v19[0] = 0xAAAAAAAAAAAAAAAALL;
    data = xpc_dictionary_get_data(object, "data", v19);
    if (data)
    {
      v7 = v19[0];
      if (v19[0])
      {
        if (v19[0] <= 0x8000)
        {
          v8 = (uint64_t)data;
          uuid = xpc_dictionary_get_uuid(object, "uuid");
          if (uuid)
          {
            v10 = uuid;
            *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
            *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
            v36 = v11;
            v35 = v11;
            v34 = v11;
            v33 = v11;
            v32 = v11;
            v31 = v11;
            v30 = v11;
            v29 = v11;
            v28 = v11;
            v27 = v11;
            v18 = 24579;
            v19[0] = v7 + 48;
            v12 = *(_QWORD *)(a1 + 64);
            if (*(_BYTE *)(a1 + 128))
              v13 = *(_BYTE *)(a1 + 128);
            else
              v13 = 14;
            v14 = *(_DWORD *)(a1 + 60);
            uint64 = xpc_dictionary_get_uint64(object, "ts");
            v19[1] = v12;
            v20 = v14;
            v21 = v13;
            v22 = 0;
            v23 = 0;
            v17 = *(_QWORD *)(a1 + 112);
            v16 = *(_QWORD *)(a1 + 120);
            v24 = uint64;
            v25 = v17;
            v26 = *(_OWORD *)v10;
            sub_10000716C((uint64_t)&v18, v8, v7, a1 + 32, v16, *(unsigned __int8 *)(a1 + 129), 0);
          }
        }
      }
    }
  }
  return 1;
}

void sub_100006C84(uint64_t a1)
{
  int v1;
  sockaddr v2;
  ssize_t v3;
  __int128 v4;
  socklen_t v5;
  char __str[1024];
  _OWORD v7[7];
  unint64_t v8;
  sockaddr v9;
  sockaddr v10;
  sockaddr v11;
  sockaddr v12;
  sockaddr v13;
  _OWORD v14[2];
  _BYTE __b[4096];

  v1 = *(_DWORD *)(a1 + 32);
  memset(__b, 170, sizeof(__b));
  *(_QWORD *)&v2.sa_len = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v2.sa_data[6] = 0xAAAAAAAAAAAAAAAALL;
  *(sockaddr *)((char *)v14 + 10) = v2;
  v13 = v2;
  v14[0] = v2;
  v11 = v2;
  v12 = v2;
  v9 = v2;
  v10 = v2;
  v5 = 106;
  v3 = recvfrom(v1, __b, 0x1000uLL, 0, &v9, &v5);
  if (v3 >= 1)
  {
    v8 = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v7[5] = v4;
    v7[6] = v4;
    v7[3] = v4;
    v7[4] = v4;
    v7[1] = v4;
    v7[2] = v4;
    v7[0] = v4;
    if (_os_log_simple_parse(__b, v3, v7))
    {
      memset(__str, 170, sizeof(__str));
      snprintf(__str, 0x400uLL, "Unable to parse os_log_simple buffer. Error: %d Received: %zd");
    }
    else
    {
      if (!sub_100006DEC((char *)v7))
        return;
      memset(__str, 170, sizeof(__str));
      snprintf(__str, 0x400uLL, "Unable to mirror error: %d pid: %llu message: %s");
    }
    sub_100013FF0((uint64_t)__str);
  }
}

size_t sub_100006DEC(char *a1)
{
  size_t v2;
  const char *v3;
  size_t v4;
  size_t v5;
  BOOL v6;
  size_t result;
  uint64_t v8;
  BOOL v9;
  const char *v10;
  _OWORD *v11;
  __int128 v12;
  int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  char *v17;
  __int128 v18;
  char v19;
  uint64_t v20;
  unsigned int v21;
  size_t v22;
  uint64_t v23;
  size_t v24;
  uint64_t v25;
  char *v26;
  _QWORD v27[128];
  char v28[1024];
  __int128 v29;
  __int128 v30;
  _BYTE v31[48];

  v2 = strlen(*((const char **)a1 + 2)) + 1;
  v3 = (const char *)*((_QWORD *)a1 + 1);
  if (v3)
    v4 = strlen(v3) + 1;
  else
    v4 = 0;
  v5 = v4 + v2 + 12;
  v6 = __CFADD__(v4, v2 + 12);
  result = 84;
  if (v2 < 0xFFFFFFFFFFFFFFF4 && !v6)
  {
    result = (size_t)malloc_type_calloc(1uLL, v5, 0xD9E6F29uLL);
    if (v5 < 4
      || (v8 = result, *(_DWORD *)result = 1, (v5 & 0xFFFFFFFFFFFFFFFCLL) == 4)
      || ((*(_DWORD *)(result + 4) = v4, v5 >= 8) ? (v9 = (v5 & 0xFFFFFFFFFFFFFFFCLL) == 8) : (v9 = 1), v9))
    {
      __break(1u);
    }
    *(_DWORD *)(result + 8) = v2;
    if (!__CFADD__(result + 12, v4))
    {
      strlcpy((char *)(result + 12 + v4), *((const char **)a1 + 2), v2);
      v10 = (const char *)*((_QWORD *)a1 + 1);
      if (v10)
        strlcpy((char *)(v8 + 12), v10, v4);
      v11 = a1 + 104;
      if (uuid_is_null((const unsigned __int8 *)a1 + 104) && (_dyld_get_shared_cache_uuid(a1 + 104) & 1) == 0)
        _os_assumes_log(0);
      *(_QWORD *)&v12 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)&v31[16] = v12;
      *(_OWORD *)&v31[32] = v12;
      v30 = v12;
      *(_OWORD *)v31 = v12;
      v29 = v12;
      v31[40] = 0;
      v13 = *((_DWORD *)a1 + 8);
      v14 = *((_QWORD *)a1 + 5);
      *(_QWORD *)v31 = v14;
      v15 = *((_DWORD *)a1 + 12);
      DWORD1(v30) = v13;
      HIDWORD(v30) = v15;
      *(_OWORD *)&v31[8] = *(_OWORD *)(a1 + 88);
      *(_OWORD *)&v31[24] = *v11;
      memset(v28, 170, sizeof(v28));
      if (proc_pidpath(v13, v28, 0x400u) <= 0)
      {
        memset(v27, 170, sizeof(v27));
        snprintf((char *)v27, 0x400uLL, "Unable to get path for %d", v13);
        sub_100013FF0((uint64_t)v27);
        v28[0] = 0;
      }
      v16 = sub_10000A278((unsigned __int8 *)a1 + 88, v28, 0, 1);
      v17 = 0;
      v27[27] = 0xAAAAAAAAAAAAAAAALL;
      *(_QWORD *)&v18 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)&v27[25] = v18;
      *(_OWORD *)&v27[23] = v18;
      *(_OWORD *)&v27[21] = v18;
      *(_OWORD *)&v27[19] = v18;
      *(_OWORD *)&v27[17] = v18;
      *(_OWORD *)&v27[15] = v18;
      *(_OWORD *)&v27[13] = v18;
      *(_OWORD *)&v27[11] = v18;
      v27[0] = 24580;
      v19 = *a1;
      v27[1] = v5 + 72;
      v27[2] = v14;
      v20 = *((_QWORD *)a1 + 3);
      LODWORD(v27[3]) = v15;
      BYTE4(v27[3]) = 0;
      BYTE5(v27[3]) = v19;
      HIWORD(v27[3]) = 0;
      v27[4] = v20;
      *(_OWORD *)&v27[5] = *(_OWORD *)(a1 + 56);
      *(_OWORD *)&v27[7] = *(_OWORD *)(a1 + 72);
      *(_OWORD *)&v27[9] = *v11;
      v21 = *(_DWORD *)(v8 + 4);
      if (v21 < 2)
        goto LABEL_28;
      v22 = *(_DWORD *)(v8 + 4);
      __chkstk_darwin(v16);
      v17 = (char *)v27 - v23;
      memset((char *)v27 - v23, 170, v24);
      LOWORD(v25) = os_map_str_find(&unk_10003A8A0, *((_QWORD *)a1 + 1));
      if (!(_WORD)v25)
      {
        v25 = (unsigned __int16)word_10003A8B8;
        word_10003A8B8 -= 2;
        v26 = strdup(*((const char **)a1 + 1));
        os_map_str_insert(&unk_10003A8A0, v26, v25);
      }
      v17[2] = v21;
      v17[3] = 1;
      result = strlcpy(v17 + 4, *((const char **)a1 + 1), v22);
      if (!__CFADD__(v17 + 4, v22))
      {
        v17[v22 + 4] = 0;
        *(_WORD *)v17 = v25;
LABEL_28:
        sub_10000716C((uint64_t)v27, v8, v5, (uint64_t)&v29, (uint64_t)v28, 0, (uint64_t)v17);
        free((void *)v8);
        return 0;
      }
    }
    __break(0x5513u);
  }
  return result;
}

void sub_10000716C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6, uint64_t a7)
{
  uint64_t *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject **v12;
  NSObject *v13;
  _QWORD v14[7];
  _QWORD v15[2];
  _QWORD block[10];

  v15[0] = a2;
  v15[1] = a3;
  if (a6 >= 6)
  {
    __break(0x5512u);
LABEL_8:
    __break(0x5513u);
  }
  if (1248 * (unint64_t)a6 > ~(unint64_t)qword_10002C398)
    goto LABEL_8;
  v9 = &qword_10002C398[156 * a6];
  v10 = *v9;
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_1000080B8;
  block[3] = &unk_100029960;
  block[4] = a1;
  block[5] = v9;
  block[6] = 1;
  block[7] = v15;
  block[8] = a4;
  block[9] = a7;
  dispatch_sync(v10, block);
  v11 = v9[1];
  if (v11)
    v12 = (NSObject **)(v11 + 16);
  else
    v12 = (NSObject **)v9;
  v13 = *v12;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 0x40000000;
  v14[2] = sub_100005900;
  v14[3] = &unk_100029870;
  v14[4] = a1;
  v14[5] = v9;
  v14[6] = a5;
  dispatch_sync(v13, v14);
}

uint64_t sub_100007298(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  char *v5;
  char *v6;
  int v7;
  BOOL v8;
  char *v9;
  id v10;

  v4 = a2 + 21;
  v5 = strrchr((char *)(a2 + 21), 46);
  if (v5)
  {
    if ((*(unsigned __int8 *)(a2 + 20) | 8) == 8)
    {
      v6 = v5;
      v7 = strcmp(v5, ".plist");
      v8 = (unint64_t)v6 > v4;
      v9 = &v6[-v4];
      if (v8 && !v7)
      {
        v10 = objc_msgSend(objc_alloc((Class)NSString), "initWithBytes:length:encoding:", v4, v9, 4);
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v10);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

      }
    }
  }
  return 0;
}

void sub_100007344()
{
  id v0;
  uintptr_t handle;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  char *v7;
  void *v8;
  id v9;
  unsigned int *v10;
  unint64_t v11;
  id v12;
  _QWORD *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  int *v24;
  int *v25;
  int *v26;
  void *v27;
  int v28;
  uint64_t v29;
  void *v30[3];
  _QWORD v31[2];
  uint64_t (*v32)(uint64_t, unsigned int *);
  void *v33;
  id v34;
  void **v35;
  char v36[1024];
  _BYTE v37[128];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  char __str[1024];
  _DWORD __b[256];

  v0 = objc_alloc_init((Class)NSMutableSet);
  memset(__b, 170, sizeof(__b));
  memset(__str, 170, sizeof(__str));
  memset(v30, 170, sizeof(v30));
  if (!qword_10003A950)
  {
    v20 = 0;
    v21 = 0;
LABEL_45:
    sub_100007F70(v20, v21, (uint64_t)&stru_100029F48);

    return;
  }
  if (qword_10003A958)
  {
    handle = dispatch_source_get_handle((dispatch_source_t)qword_10003A958);
    sub_100007FD0(v0, handle);
  }
  v30[0] = __b;
  WORD2(v30[2]) = 0;
  BYTE6(v30[2]) = 1;
  LODWORD(v30[2]) = 0x100000;
  __b[0] = 6;
  v30[1] = (void *)0x40000000004;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v2 = v0;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v38, v37, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v39 != v5)
          objc_enumerationMutation(v2);
        v7 = (char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i)), "UTF8String");
        v8 = (void *)_os_log_preferences_load(v7, 0);
        if (v8)
          sub_100007A78(v30, v7, v8);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v38, v37, 16);
    }
    while (v4);
  }

  if (qword_10002DF98 != -1)
    dispatch_once(&qword_10002DF98, &stru_100028F80);
  if (qword_10002DF90)
    sub_100011564((uint64_t)v30[0], v30[1], 1, (uint64_t)&stru_100028F60);
  v9 = v2;
  v10 = (unsigned int *)qword_10003A950;
  v11 = qword_10003A968;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v32 = sub_100007804;
  v33 = &unk_100029FC0;
  v12 = v9;
  v34 = v12;
  v35 = v30;
  v13 = v31;
  if (v11 >= 0x14)
  {
    do
    {
      v14 = *v10;
      if (v11 < v14)
        break;
      v15 = v10[1];
      if (v15 + 21 > v14)
        break;
      if (__CFADD__(v10 + 5, v15))
        __break(0x5513u);
      if (*((_BYTE *)v10 + v15 + 20))
        break;
      if (!v32((uint64_t)v13, v10))
        break;
      v16 = *v10;
      v10 = (unsigned int *)((char *)v10 + v16);
      v11 -= v16;
    }
    while (v11 > 0x13);
  }

  if ((BYTE4(v30[2]) & 2) != 0)
  {
    memset(&v36[47], 170, 0x3D1uLL);
    strcpy(v36, "Logging preferences cache was larger than 1MB!");
    sub_100013FF0((uint64_t)v36);
LABEL_31:
    v20 = 0;
    v21 = 0;
    goto LABEL_43;
  }
  v18 = (const char *)_os_trace_prefsdir_path(v17);
  snprintf(__str, 0x400uLL, "%s/.plist-cache.XXXXXXXX", v18);
  if (qword_10003A9B8 != -1)
    dispatch_once(&qword_10003A9B8, &stru_10002A858);
  if (byte_10003A9C0)
    v19 = mkstemp_dprotected_np(__str, 4, 0);
  else
    v19 = mkostemp(__str, 0x1000000);
  v22 = v19;
  if ((_DWORD)v19 == -1)
  {
    v24 = __error();
    _os_assumes_log(*v24);
    goto LABEL_31;
  }
  if (unlink(__str) == -1)
  {
    v25 = __error();
    _os_assumes_log(*v25);
  }
  if (_os_trace_write(v22, v30[0], LODWORD(v30[1])) == -1)
  {
    v26 = __error();
    _os_assumes_log(*v26);
  }
  else
  {
    v23 = mmap(0, LODWORD(v30[1]), 1, 2, v22, 0);
    if (v23 != (void *)-1)
    {
      v20 = (uint64_t)v23;
      v21 = LODWORD(v30[1]);
      goto LABEL_42;
    }
  }
  v20 = 0;
  v21 = 0;
LABEL_42:
  if (close(v22) != -1)
    goto LABEL_43;
  v28 = *__error();
  v29 = *__error();
  if (v28 != 9)
  {
    _os_assumes_log(v29);
LABEL_43:
    if ((BYTE4(v30[2]) & 1) != 0)
    {
      v27 = v30[0];
      v30[0] = (void *)3954044928;
      WORD2(v30[2]) = 0;
      free(v27);
    }
    goto LABEL_45;
  }
  qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_10002DF78 = v29;
  __break(1u);
}

uint64_t sub_100007804(uint64_t a1, unsigned int *a2)
{
  id v4;
  uint64_t result;
  _QWORD *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v4 = objc_msgSend(objc_alloc((Class)NSString), "initWithBytes:length:encoding:", a2 + 5, a2[1], 4);
  result = (uint64_t)objc_msgSend(*(id *)(a1 + 32), "containsObject:", v4);
  if ((result & 1) != 0)
    goto LABEL_8;
  v6 = *(_QWORD **)(a1 + 40);
  if ((*((_WORD *)v6 + 10) & 2) != 0)
    goto LABEL_8;
  v7 = *a2;
  v8 = *((unsigned int *)v6 + 2);
  if (*((char *)v6 + 22) + *((_DWORD *)v6 + 3) - (int)v8 - 1 < *a2)
  {
    sub_1000078E8((uint64_t)v6, a2, *a2);
    goto LABEL_8;
  }
  if (!__CFADD__(*v6, v8))
  {
    result = (uint64_t)memcpy((void *)(*v6 + v8), a2, *a2);
    v9 = (*((_DWORD *)v6 + 2) + v7);
    *((_DWORD *)v6 + 2) = v9;
    if (*((_BYTE *)v6 + 22))
    {
LABEL_8:

      return 1;
    }
    if (!__CFADD__(*v6, v9))
    {
      *(_BYTE *)(*v6 + v9) = 0;
      goto LABEL_8;
    }
  }
  __break(0x5513u);
  return result;
}

uint64_t sub_1000078E8(uint64_t result, void *__src, size_t __n)
{
  size_t v3;
  _QWORD *v5;
  unsigned int v6;
  size_t v7;
  uint64_t v8;
  uint64_t v9;

  if ((*(_WORD *)(result + 20) & 2) == 0)
  {
    v3 = __n;
    v5 = (_QWORD *)result;
    v6 = *(_DWORD *)(result + 12);
    v7 = *(char *)(result + 22) + v6 - *(_DWORD *)(result + 8) - 1;
    if (v7 < __n)
    {
      if (v6 < *(_DWORD *)(result + 16))
      {
        result = sub_1000079B4(result, __n);
        v7 = result;
      }
      if (v7 < v3)
      {
        *((_WORD *)v5 + 10) |= 2u;
        v3 = v7;
      }
    }
    v8 = *((unsigned int *)v5 + 2);
    if (__CFADD__(*v5, v8))
      goto LABEL_12;
    result = (uint64_t)memcpy((void *)(*v5 + v8), __src, v3);
    v9 = (*((_DWORD *)v5 + 2) + v3);
    *((_DWORD *)v5 + 2) = v9;
    if (*((_BYTE *)v5 + 22))
      return result;
    if (__CFADD__(*v5, v9))
    {
LABEL_12:
      __break(0x5513u);
      return result;
    }
    *(_BYTE *)(*v5 + v9) = 0;
  }
  return result;
}

uint64_t sub_1000079B4(uint64_t a1, uint64_t a2)
{
  unsigned int v3;
  size_t v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  const void *v8;
  void *v9;

  v3 = *(_DWORD *)(a1 + 8);
  if (*(_BYTE *)(a1 + 22))
    v4 = v3;
  else
    v4 = v3 + 1;
  v5 = v4 + a2;
  if ((v4 + a2) >> 32)
  {
    v6 = *(_DWORD *)(a1 + 12);
    v7 = *(_DWORD *)(a1 + 16);
  }
  else
  {
    v6 = *(_DWORD *)(a1 + 12);
    if ((v6 & 0x80000000) != 0)
    {
      v7 = *(_DWORD *)(a1 + 16);
    }
    else
    {
      if (2 * v6 > v5)
        v5 = 2 * v6;
      if (*(_DWORD *)(a1 + 16) >= v5)
        v7 = v5;
      else
        v7 = *(_DWORD *)(a1 + 16);
    }
  }
  if (v7 > v6)
  {
    v8 = *(const void **)a1;
    if ((*(_WORD *)(a1 + 20) & 1) != 0)
    {
      *(_QWORD *)a1 = _os_trace_realloc(*(_QWORD *)a1, v7);
    }
    else
    {
      v9 = (void *)_os_trace_malloc(v7);
      *(_QWORD *)a1 = v9;
      memcpy(v9, v8, v4);
      *(_WORD *)(a1 + 20) |= 1u;
    }
    *(_DWORD *)(a1 + 12) = v7;
  }
  return v7 - v4;
}

void sub_100007A78(_QWORD *a1, char *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  void *v12;
  _QWORD applier[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  const char *v19;
  _BYTE *v20;
  uint64_t v21;
  unint64_t v22;
  _QWORD v23[3];
  _BYTE __b[1024];

  v5 = a3;
  memset(__b, 170, sizeof(__b));
  v16 = 0;
  v17 = &v16;
  v22 = 0xAA01000000100000;
  v18 = 0x3810000000;
  v19 = "";
  v20 = __b;
  v21 = 0x40000000000;
  applier[0] = _NSConcreteStackBlock;
  applier[1] = 3221225472;
  applier[2] = sub_100007C84;
  applier[3] = &unk_100029F98;
  v6 = v5;
  v14 = v6;
  v15 = &v16;
  xpc_dictionary_apply(v6, applier);
  memset(v23, 170, 20);
  sub_100007F10(v23, a2);
  _os_log_preferences_compute(v6, "DEFAULT-OPTIONS", (char *)&v23[1] + 4);
  LODWORD(v23[0]) += *((_DWORD *)v17 + 10);
  sub_100007D40(a1, a2, (unsigned int *)v23);
  if ((*((_WORD *)a1 + 10) & 2) == 0)
  {
    v7 = (void *)v17[4];
    v8 = *((_DWORD *)v17 + 10);
    v9 = *((unsigned int *)a1 + 2);
    if (*((char *)a1 + 22) + *((_DWORD *)a1 + 3) - (int)v9 - 1 < v8)
    {
      sub_1000078E8((uint64_t)a1, v7, *((unsigned int *)v17 + 10));
    }
    else
    {
      if (__CFADD__(*a1, v9))
        goto LABEL_11;
      memcpy((void *)(*a1 + v9), v7, *((unsigned int *)v17 + 10));
      v10 = *((_DWORD *)a1 + 2) + v8;
      *((_DWORD *)a1 + 2) = v10;
      if (*((_BYTE *)a1 + 22))
        goto LABEL_7;
      if (__CFADD__(*a1, v10))
LABEL_11:
        __break(0x5513u);
      *(_BYTE *)(*a1 + v10) = 0;
    }
  }
LABEL_7:
  v11 = v17;
  if ((*((_WORD *)v17 + 26) & 1) != 0)
  {
    v12 = (void *)v17[4];
    v17[4] = 3954044928;
    *((_WORD *)v11 + 26) = 0;
    free(v12);
  }

  _Block_object_dispose(&v16, 8);
}

uint64_t sub_100007C84(uint64_t a1, char *__s1)
{
  _QWORD v5[3];

  memset(v5, 170, 20);
  if (strcmp(__s1, "DEFAULT-OPTIONS"))
  {
    sub_100007F10(v5, __s1);
    _os_log_preferences_compute(*(_QWORD *)(a1 + 32), __s1, (char *)&v5[1] + 4);
    sub_100007D40((_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), __s1, (unsigned int *)v5);
  }
  return 1;
}

_QWORD *sub_100007D40(_QWORD *result, void *__src, unsigned int *a3)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  int v14;
  size_t v15;
  uint64_t v16;
  uint64_t v17;

  v5 = result;
  if ((*((_WORD *)result + 10) & 2) == 0)
  {
    v6 = *((unsigned int *)result + 2);
    if ((*((char *)result + 22) + *((_DWORD *)result + 3) - v6 - 1) <= 0x13)
    {
      result = (_QWORD *)sub_1000078E8((uint64_t)result, a3, 0x14uLL);
    }
    else
    {
      if (__CFADD__(*result, v6))
        goto LABEL_25;
      v7 = *result + v6;
      v8 = *(_OWORD *)a3;
      *(_DWORD *)(v7 + 16) = a3[4];
      *(_OWORD *)v7 = v8;
      v9 = (*((_DWORD *)result + 2) + 20);
      *((_DWORD *)result + 2) = v9;
      if (!*((_BYTE *)result + 22))
      {
        if (__CFADD__(*result, v9))
          goto LABEL_25;
        *(_BYTE *)(*result + v9) = 0;
      }
    }
  }
  if ((*((_WORD *)v5 + 10) & 2) == 0)
  {
    v10 = a3[1];
    v11 = *((unsigned int *)v5 + 2);
    if (*((char *)v5 + 22) + *((_DWORD *)v5 + 3) - (int)v11 - 1 < v10)
    {
      result = (_QWORD *)sub_1000078E8((uint64_t)v5, __src, a3[1]);
    }
    else
    {
      if (__CFADD__(*v5, v11))
        goto LABEL_25;
      result = memcpy((void *)(*v5 + v11), __src, a3[1]);
      v12 = *((_DWORD *)v5 + 2) + v10;
      *((_DWORD *)v5 + 2) = v12;
      if (!*((_BYTE *)v5 + 22))
      {
        if (__CFADD__(*v5, v12))
          goto LABEL_25;
        *(_BYTE *)(*v5 + v12) = 0;
      }
    }
  }
  v13 = a3[1];
  v14 = v13 - (((_BYTE)v13 + 1) & 3) + 5;
  if ((((_BYTE)v13 + 1) & 3) == 0)
    v14 = v13 + 1;
  if ((*((_WORD *)v5 + 10) & 2) == 0)
  {
    v15 = v14 - v13;
    v16 = *((unsigned int *)v5 + 2);
    if (*((char *)v5 + 22) + *((_DWORD *)v5 + 3) - (int)v16 - 1 < v15)
      return (_QWORD *)sub_1000078E8((uint64_t)v5, &unk_10003A960, v15);
    if (!__CFADD__(*v5, v16))
    {
      result = memcpy((void *)(*v5 + v16), &unk_10003A960, v15);
      v17 = (*((_DWORD *)v5 + 2) + v15);
      *((_DWORD *)v5 + 2) = v17;
      if (*((_BYTE *)v5 + 22))
        return result;
      if (!__CFADD__(*v5, v17))
      {
        *(_BYTE *)(*v5 + v17) = 0;
        return result;
      }
    }
LABEL_25:
    __break(0x5513u);
  }
  return result;
}

uint64_t sub_100007F10(_DWORD *a1, char *__s)
{
  unsigned int v4;
  uint64_t result;
  int v6;
  int v7;

  v4 = strlen(__s);
  a1[1] = v4;
  result = os_simple_hash(__s, v4);
  v6 = a1[1];
  a1[2] = result;
  if ((((_BYTE)v6 + 1) & 3) != 0)
    v7 = v6 - (((_BYTE)v6 + 1) & 3) + 5;
  else
    v7 = v6 + 1;
  *a1 = v7 + 20;
  return result;
}

void sub_100007F70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD block[7];

  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_100004C58;
  block[3] = &unk_100028D78;
  block[5] = a2;
  block[6] = a1;
  block[4] = a3;
  dispatch_async((dispatch_queue_t)qword_10002C298, block);
}

uint64_t sub_100007FD0(void *a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;

  v14 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100007298;
  v7[3] = &unk_100029F70;
  v8 = a1;
  v9 = &v10;
  v3 = v8;
  v4 = _os_trace_fdscandir_b(a2, &v14, v7, 0);
  _os_trace_scandir_free_namelist(v4, v14);
  v5 = *((unsigned __int8 *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return v5;
}

uint64_t sub_1000080B8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  size_t v5;
  unint64_t v6;
  uint64_t result;
  uint64_t v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  size_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  int32x2_t *v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  size_t v26;
  unsigned __int8 *v27;
  uint64_t v28;
  uint64_t v29;
  float **v30;
  _QWORD *v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  size_t v37;
  _QWORD *v38;
  uint64_t v39;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(v3 + 8);
  v5 = v4 + 16;
  if ((v4 & 7) != 0)
    v6 = (v4 & 0xFFFFFFFFFFFFFFF8) + 24;
  else
    v6 = v4 + 16;
  result = (uint64_t)sub_10000B0D8(v2, v6);
  if (result >= 5)
    goto LABEL_30;
  v8 = *(_QWORD *)(a1 + 40) + 48;
  if (__CFADD__(v8, 264 * result))
    goto LABEL_29;
  v9 = result;
  if (v6 >= *(unsigned int *)(v8 + 264 * result + 248))
  {
    v39 = _os_assert_log(0);
    result = _os_crash(v39);
    __break(1u);
    goto LABEL_29;
  }
  if ((int)*(_QWORD *)(a1 + 48) >= 1)
  {
    v10 = 0;
    v11 = *(_QWORD *)(a1 + 56);
    v12 = ~v11;
    v13 = v11 + 8;
    v14 = v5;
    while (v10 <= v12)
    {
      v14 -= *(_QWORD *)(v13 + v10);
      v10 += 16;
      if (16 * *(_QWORD *)(a1 + 48) == v10)
        goto LABEL_13;
    }
    goto LABEL_29;
  }
  v14 = v5;
LABEL_13:
  v15 = v8 + 264 * result;
  v18 = *(_QWORD *)(v15 + 240);
  v17 = (_QWORD *)(v15 + 240);
  v16 = v18;
  v20 = (int32x2_t *)((char *)v17 + 12);
  v19 = *((unsigned int *)v17 + 3);
  if (__CFADD__(v18, v19))
    goto LABEL_29;
  result = (uint64_t)memcpy((void *)(v16 + v19), *(const void **)(a1 + 32), v14);
  v21 = v20->i32[0] + v14;
  v20->i32[0] = v21;
  if (*(int *)(a1 + 48) >= 1)
  {
    v22 = 0;
    v23 = 0;
    while (!__CFADD__(*v17, v21))
    {
      v24 = *(_QWORD *)(a1 + 56);
      if (__CFADD__(v24, v22))
        break;
      result = (uint64_t)memcpy((void *)(*v17 + v21), *(const void **)(v24 + v22), *(_QWORD *)(v24 + v22 + 8));
      v25 = *(_QWORD *)(a1 + 56);
      if (__CFADD__(v25, v22))
        break;
      v21 = v20->i32[0] + *(_DWORD *)(v25 + v22 + 8);
      v20->i32[0] = v21;
      ++v23;
      v22 += 16;
      if (v23 >= *(int *)(a1 + 48))
        goto LABEL_20;
    }
    goto LABEL_29;
  }
LABEL_20:
  if (__CFADD__(*v17, v21))
  {
LABEL_29:
    __break(0x5513u);
LABEL_30:
    __break(0x5512u);
    return result;
  }
  v26 = v6 - v5;
  bzero((void *)(*v17 + v21), v26);
  *v20 = vadd_s32(*v20, (int32x2_t)(v26 | 0x100000000));
  v28 = *(_QWORD *)(a1 + 64);
  v27 = *(unsigned __int8 **)(a1 + 72);
  v29 = v8 + 264 * v9;
  v31 = *(_QWORD **)(v29 + 232);
  v30 = (float **)(v29 + 232);
  result = (uint64_t)sub_10000D3D4(v31, *(_QWORD *)(v28 + 32), *(_DWORD *)(v28 + 28));
  v32 = result;
  if (result)
  {
    if (!v27)
      return result;
  }
  else
  {
    v32 = _os_trace_malloc(88);
    *(_OWORD *)v32 = *(_OWORD *)v28;
    v33 = *(_OWORD *)(v28 + 64);
    v35 = *(_OWORD *)(v28 + 16);
    v34 = *(_OWORD *)(v28 + 32);
    *(_OWORD *)(v32 + 48) = *(_OWORD *)(v28 + 48);
    *(_OWORD *)(v32 + 64) = v33;
    *(_OWORD *)(v32 + 16) = v35;
    *(_OWORD *)(v32 + 32) = v34;
    v36 = _os_trace_calloc(1, 24);
    *(_QWORD *)v36 = 16;
    *(_BYTE *)(v36 + 8) = 1;
    *(_QWORD *)(v36 + 16) = _os_trace_calloc(16, 8);
    *(_QWORD *)(v32 + 80) = v36;
    result = sub_10000D98C(v30, *(_QWORD *)(v28 + 32), *(_DWORD *)(v28 + 28), v32);
    if (!v27)
      return result;
  }
  result = sub_10000C898(*(_QWORD *)(v32 + 80), (uint64_t)v27);
  if (!result)
  {
    v37 = v27[2] + (unint64_t)v27[3] + 4;
    v38 = (_QWORD *)_os_trace_malloc(v37);
    memcpy(v38, v27, v37);
    return sub_10000C928(*(unsigned int **)(v32 + 80), v38, (uint64_t)v38);
  }
  return result;
}

uint64_t sub_100008390(int a1, mach_port_t a2)
{
  uint64_t context;
  unint64_t v5;
  int v6;
  BOOL v7;
  _BOOL4 v8;
  uint64_t *v9;

  context = dispatch_mach_mig_demux_get_context();
  if (!context)
    return 5;
  v5 = context;
  v6 = *(_DWORD *)(context + 116);
  if (*(_BYTE *)(context + 144))
  {
    sub_100022574(context, a2);
  }
  else
  {
    v7 = v6 == a1;
    v8 = v6 == a1;
    v9 = &qword_10002C288;
    if (!v7)
      v9 = &qword_10002C298;
    dispatch_assert_queue_V2((dispatch_queue_t)*v9);
    sub_1000085E8(v5, a2, v8);
  }
  return 4294966991;
}

void sub_10000841C(uint64_t a1)
{
  unint64_t *v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  unsigned __int16 *v9;
  unsigned __int16 *v10;
  uint64_t v11;
  uint64_t *v12;
  unint64_t v13;
  unsigned __int16 *v14;
  int v15;
  int v16;
  unint64_t v17;
  int v18;

  v1 = (unint64_t *)(a1 + 8);
  if (*(_QWORD *)(a1 + 8))
  {
    v3 = 0;
    v4 = a1 - (_QWORD)dword_10002C270 - 120;
    v5 = (v4 >> 4) & 1;
    v18 = 16 << ((v4 & 0x10) != 0);
    v6 = 256 << ((v4 & 0x10) != 0);
    v7 = ~(17 << ((v4 & 0x10) != 0));
    v17 = v4;
    if ((v4 & 0x20) != 0)
      v8 = 1;
    else
      v8 = 4;
    while (2)
    {
      v9 = *(unsigned __int16 **)a1;
      if (!*(_QWORD *)a1)
        v9 = (unsigned __int16 *)_dispatch_wait_for_enqueuer(a1, v1);
      do
      {
        v10 = &v9[4 * v5];
        v11 = *((_QWORD *)v10 + 4);
        *(_QWORD *)a1 = v11;
        if (!v11)
        {
          v12 = (uint64_t *)(v10 + 16);
          while (1)
          {
            v13 = __ldxr(v1);
            if ((unsigned __int16 *)v13 != v9)
              break;
            if (!__stlxr(0, v1))
              goto LABEL_15;
          }
          __clrex();
          v11 = *v12;
          if (!*v12)
            v11 = _dispatch_wait_for_enqueuer(v12, v1);
          *(_QWORD *)a1 = v11;
        }
LABEL_15:
        v14 = v9 + 70;
        do
        {
          v15 = __ldxr(v14);
          if ((v18 & v15) != 0)
            v16 = v15 & v7 | v6;
          else
            v16 = v15 & v7;
        }
        while (__stxr(v16, v14));
        if ((((unsigned __int16)v16 ^ (unsigned __int16)v15) & 0x300) != 0 && (v16 & 0x300) == 0x300)
          dispatch_async_f((dispatch_queue_t)qword_10002C288, v9, (dispatch_function_t)sub_100011000);
        if ((v16 & v6) == 0)
          sub_1000085E8((unint64_t)v9, 0, v5);
        if (++v3 == v8)
        {
          dispatch_source_merge_data(*(dispatch_source_t *)&dword_10002C270[2 * ((v17 >> 4) & 3) + 46], 1uLL);
          return;
        }
        v9 = (unsigned __int16 *)v11;
      }
      while (v11);
      if (*v1)
        continue;
      break;
    }
  }
}

void sub_1000085E8(unint64_t a1, mach_port_t a2, int a3)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t *v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  dispatch_group_t *v11;
  unsigned __int16 v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  dispatch_group_t *v16;
  unint64_t v17;
  unsigned int *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t *v24;
  uint64_t v25;
  unint64_t v26;
  mach_port_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t *v30;
  unint64_t v31;
  unint64_t *v32;
  unint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  unsigned __int16 *v38;
  int v39;
  uint64_t v40;
  unint64_t *v41;
  unint64_t v42;
  unint64_t v43;
  mach_port_t v44;
  unsigned __int16 *v45;
  int v46;
  uint64_t v47;
  unint64_t *v48;
  unint64_t StatusReg;
  unint64_t v50;
  uint64_t v53;
  uint64_t v54;
  unsigned __int16 *v55;
  os_unfair_lock_s *lock;
  uint64_t v57;
  uint64_t v58;
  __int16 v59;
  unint64_t v60;
  unint64_t v61;

  v3 = a1;
  v4 = *(_QWORD *)(a1 + 48);
  v53 = a3 & 1;
  v5 = (uint64_t *)(a1 + 56);
  v6 = (uint64_t *)(a1 + 64);
  v7 = (_BYTE *)(a1 + 146);
  v8 = 4;
  if ((a3 & 1) != 0)
  {
    v7 = (_BYTE *)(a1 + 145);
    v5 = (uint64_t *)(a1 + 72);
    v6 = (uint64_t *)(a1 + 80);
    v9 = v4 + 128;
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 48);
  }
  if ((a3 & 1) != 0)
    v8 = 3;
  v57 = v8;
  v58 = *(_QWORD *)(a1 + 48);
  v54 = *v5;
  v10 = *v6;
  if (*v7)
    v11 = (dispatch_group_t *)off_10002C2A8;
  else
    v11 = 0;
  if (*(_BYTE *)(a1 + 144))
  {
LABEL_80:
    if (v11)
    {
      if ((_DWORD)v53)
        *(_BYTE *)(v3 + 145) = 0;
      else
        *(_BYTE *)(v3 + 146) = 0;
      dispatch_group_leave(v11[1]);
    }
    sub_100022574(v3, a2);
    if (*(_DWORD *)(v3 + 128))
    {
      v45 = (unsigned __int16 *)(v3 + 140);
      do
      {
        v46 = __ldxr(v45);
        if (((272 << v53) & v46) != 0)
        {
          __clrex();
          return;
        }
      }
      while (__stxr(v46 | (17 << v53), v45));
      if (v3 && ((1 << v53) & v46) == 0)
      {
        v47 = v53 | (2 * *(unsigned __int8 *)(v3 + 147));
        *(_QWORD *)(v3 + 8 * v53 + 32) = 0;
        v48 = (unint64_t *)&dword_10002C270[4 * v47 + 32];
        StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        *(_QWORD *)(StatusReg + 976) = v48;
        do
          v50 = __ldxr(v48);
        while (__stlxr(v3, v48));
        if (v50)
        {
          *(_QWORD *)(v50 + 8 * v53 + 32) = v3;
          *(_QWORD *)(StatusReg + 976) = 0;
        }
        else
        {
          *(_QWORD *)&dword_10002C270[4 * v47 + 30] = v3;
          *(_QWORD *)(StatusReg + 976) = 0;
          dispatch_source_merge_data(*(dispatch_source_t *)&dword_10002C270[2 * v47 + 46], 1uLL);
        }
      }
    }
    return;
  }
  v12 = 0;
  v59 = *v6;
  v13 = 320;
  if ((a3 & 1) != 0)
    v13 = 384;
  v55 = (unsigned __int16 *)(v4 + v13);
  lock = (os_unfair_lock_s *)(a1 + 124);
  while ((unsigned __int16)v10 != (unsigned __int16)(v59 + v12))
  {
    do
LABEL_16:
      v15 = *(_WORD *)(v9 + 2 * (((_BYTE)v59 + (_BYTE)v12) & 0x3F)) & 0x3F;
    while (!(*(_DWORD *)(v3 + 128) | v15));
    if ((*(_WORD *)(v9 + 2 * (((_BYTE)v59 + (_BYTE)v12) & 0x3F)) & 0x3F) != 0)
    {
      v16 = v11;
      v17 = v3;
      v18 = (unsigned int *)(v58 + (v15 << 12));
      v19 = *((unsigned __int16 *)v18 + 2);
      v20 = *v18;
      v21 = *((unsigned __int8 *)v18 + 6);
      v22 = *((unsigned __int8 *)v18 + 7);
      if (v21 == 3)
        os_unfair_lock_lock(lock);
      v23 = (v20 | (v19 << 32)) & 0xFFFFFFFFFFFFLL | (v21 << 48) | (v22 << 56);
      v3 = v17;
      (*((void (**)(void *, unint64_t, uint64_t, unsigned int *, uint64_t))off_10002C2A0 + 2))(off_10002C2A0, v17, v57, v18, v23);
      v11 = v16;
      if (v16)
        ((void (*)(void))(*v16)[2].isa)();
      if ((_DWORD)v21 == 3)
        os_unfair_lock_unlock(lock);
    }
    if (++v12 >= 4u && !v11)
      goto LABEL_28;
  }
  v14 = atomic_load(v55);
  if (v14 != (unsigned __int16)v10)
  {
    LOWORD(v10) = v14;
    if ((unsigned __int16)(v14 - v54) > 0x3Fu)
      goto LABEL_80;
    goto LABEL_16;
  }
  if (!v12)
    goto LABEL_75;
LABEL_28:
  v24 = (unint64_t *)(v3 + 64);
  if ((_DWORD)v53)
    v24 = (unint64_t *)(v3 + 80);
  v25 = 258;
  if ((_DWORD)v53)
    v25 = 262;
  do
    v26 = __ldxr(v24);
  while (__stxr(v26 + v12, v24));
  if (!*(_DWORD *)(v3 + 128))
    goto LABEL_50;
  v27 = a2;
  if (a2)
  {
    if (v11)
      goto LABEL_78;
    goto LABEL_36;
  }
  if (*(unsigned __int16 *)(v58 + v25) != (unsigned __int16)v54)
  {
    v27 = 0;
    if (v11)
      goto LABEL_78;
  }
  else
  {
LABEL_50:
    v27 = *(_DWORD *)(v3 + 120);
    if (v11)
      goto LABEL_78;
  }
LABEL_36:
  if (v27)
  {
    while (1)
    {
      v60 = 0;
      v61 = 0;
      v28 = *(_QWORD *)(v3 + 64);
      v29 = *(_QWORD *)(v3 + 80);
      v60 = v28;
      v61 = v29;
      v30 = (unint64_t *)(v3 + 56);
      while (1)
      {
        v31 = __ldxr(v30);
        if (v31 >= v28)
          break;
        if (!__stxr(v28, v30))
          goto LABEL_40;
      }
      __clrex();
LABEL_40:
      v32 = (unint64_t *)(v3 + 72);
      while (1)
      {
        v33 = __ldxr(v32);
        if (v33 >= v29)
          break;
        if (!__stxr(v29, v32))
          goto LABEL_43;
      }
      __clrex();
LABEL_43:
      if (!*(_DWORD *)(v3 + 128))
        break;
      if (*(_DWORD *)(v3 + 120) == v27)
        v34 = sub_10000A1BC(v27, v28, v29, *(unsigned __int8 *)(v3 + 147), 0);
      else
        v34 = sub_10000FC28(v27, 0, v28, v29, *(unsigned __int8 *)(v3 + 147));
      if (v34 != -301)
      {
        if (v34 == 268435459 || !v34)
          goto LABEL_56;
        v35 = v34;
        v36 = 235;
LABEL_105:
        _dispatch_bug(v36, v35);
        goto LABEL_56;
      }
      qword_10002DF48 = (uint64_t)"MIG_REPLY_MISMATCH";
      qword_10002DF78 = -301;
      __break(1u);
LABEL_75:
      v12 = 0;
      v27 = a2;
      if (!v11)
        goto LABEL_36;
LABEL_78:
      v44 = v27;
      sub_100008BD4(v3, (uint64_t)v11, v53);
      if ((_DWORD)v53)
        *(_BYTE *)(v3 + 145) = 0;
      else
        *(_BYTE *)(v3 + 146) = 0;
      dispatch_group_leave(v11[1]);
      v27 = v44;
      if (!v44)
        goto LABEL_56;
    }
    if ((ioctl(dword_10002C2B8, 0x80107451uLL, &v60) & 0x80000000) == 0)
      goto LABEL_56;
    v35 = **(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
    if (!(_DWORD)v35)
      goto LABEL_56;
    v36 = 223;
    goto LABEL_105;
  }
LABEL_56:
  if (*(_DWORD *)(v3 + 128))
  {
    if (v12 >= 4u)
    {
      v37 = 1 << v53;
      v38 = (unsigned __int16 *)(v3 + 140);
      while (1)
      {
        v39 = __ldxr(v38);
        if (((256 << v53) & v39) != 0)
        {
          __clrex();
          goto LABEL_68;
        }
        if ((v37 & v39) != 0)
          break;
        if (!__stxr(v39 | v37, v38))
          goto LABEL_62;
      }
      __clrex();
LABEL_62:
      if (v3 && (v37 & v39) == 0)
      {
        v40 = v53 | (2 * *(unsigned __int8 *)(v3 + 147));
        *(_QWORD *)(v3 + 8 * v53 + 32) = 0;
        v41 = (unint64_t *)&dword_10002C270[4 * v40 + 32];
        v42 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        *(_QWORD *)(v42 + 976) = v41;
        do
          v43 = __ldxr(v41);
        while (__stlxr(v3, v41));
        if (v43)
        {
          *(_QWORD *)(v43 + 8 * v53 + 32) = v3;
          *(_QWORD *)(v42 + 976) = 0;
        }
        else
        {
          *(_QWORD *)&dword_10002C270[4 * v40 + 30] = v3;
          *(_QWORD *)(v42 + 976) = 0;
          dispatch_source_merge_data(*(dispatch_source_t *)&dword_10002C270[2 * v40 + 46], 1uLL);
        }
      }
    }
LABEL_68:
    if (v12)
    {
      if (off_10002C2B0)
        sub_1000085E8(off_10002C2B0, 0, a3 | 2u);
    }
  }
  else if ((a3 & 2) == 0)
  {
    dispatch_resume(*(dispatch_object_t *)(v3 + 96));
  }
}

uint64_t sub_100008BD4(uint64_t result, uint64_t a2, int a3)
{
  uint64_t v3;
  unsigned __int16 *v4;
  uint64_t *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v11;
  unint64_t i;
  unint64_t v13;
  unsigned __int16 *v14;

  v3 = *(_QWORD *)(result + 48);
  v4 = (unsigned __int16 *)(v3 + 260);
  v5 = (uint64_t *)(result + 80);
  if (a3)
  {
    v6 = v3 + 128;
  }
  else
  {
    v4 = (unsigned __int16 *)(v3 + 256);
    v5 = (uint64_t *)(result + 64);
    v6 = *(_QWORD *)(result + 48);
  }
  v7 = *v4;
  v8 = *v5;
  if ((unsigned __int16)(*v5 - v7) <= 0x3Fu)
  {
    v11 = -2;
    if (v7 != (unsigned __int16)v8)
    {
      do
        v11 &= ~(1 << *(_WORD *)(v6 + 2 * (v7++ & 0x3F)));
      while ((unsigned __int16)v7 != (unsigned __int16)v8);
    }
    for (i = *(_QWORD *)(v3 + 520) & v11; i; i &= ~(1 << v13))
    {
      v13 = __clz(__rbit64(i));
      v14 = (unsigned __int16 *)(v3 + (v13 << 12));
      if (*v14 >= 0x11uLL && v14[19] && ((*((_BYTE *)v14 + 7) & 2) == 0) != a3)
        result = (*(uint64_t (**)(void))(*(_QWORD *)a2 + 16))();
    }
  }
  else
  {
    *(_BYTE *)(result + 144) = 1;
  }
  return result;
}

void sub_100008D10(uint64_t a1, uint64_t a2, uint64_t a3, const void *a4, uint64_t a5)
{
  NSObject *v6;
  _QWORD *v7;
  NSObject **v8;
  NSObject *v9;
  NSObject *v10;
  dispatch_block_t v11;
  NSObject *v12;
  NSObject *v13;
  dispatch_block_t v14;
  _QWORD v15[8];
  _QWORD block[6];
  int v17;
  __int16 v18;
  char v19;
  char v20;
  uint64_t v21;

  switch(a3)
  {
    case 1:
      if (*(_BYTE *)(a1 + 56))
      {
        v9 = *(NSObject **)(a1 + 32);
        v8 = *(NSObject ***)(a1 + 40);
        sub_10000F5E0((uint64_t)&qword_10002C398, v9, v8);
        if ((unint64_t)&qword_10002C398 >= 0xFFFFFFFFFFFFFB20
          || (sub_10000F5E0((uint64_t)&qword_10002C878, v9, v8),
              (unint64_t)&qword_10002C398 >= 0xFFFFFFFFFFFFF640)
          || (sub_10000F5E0((uint64_t)&qword_10002CD58, v9, v8),
              (unint64_t)&qword_10002C398 >= 0xFFFFFFFFFFFFF160))
        {
          __break(0x5513u);
        }
        else
        {
          sub_10000F5E0((uint64_t)&qword_10002D238, v9, v8);
        }
      }
      break;
    case 2:
      if (*(_BYTE *)(a1 + 57))
        sub_10000F5E0((uint64_t)&unk_10002D718, *(NSObject **)(a1 + 32), *(NSObject ***)(a1 + 40));
      break;
    case 3:
    case 4:
      if ((unsigned __int16)a5 <= 0x1000uLL && (a5 & 0xFFFF0000) <= 0x10000000uLL)
      {
        switch(BYTE6(a5))
        {
          case 0:
          case 1:
          case 4:
            if (*(_BYTE *)(a1 + 56))
            {
              v15[0] = _NSConcreteStackBlock;
              v15[1] = 0x40000000;
              v15[2] = sub_100010434;
              v15[3] = &unk_1000291B8;
              v6 = *(NSObject **)(a1 + 48);
              v15[4] = *(_QWORD *)(a1 + 40);
              v15[5] = a4;
              v15[6] = a5;
              v15[7] = a2;
              v7 = v15;
              goto LABEL_18;
            }
            break;
          case 2:
            if (*(_BYTE *)(a1 + 57))
            {
              block[0] = _NSConcreteStackBlock;
              block[1] = 0x40000000;
              block[2] = sub_100010500;
              block[3] = &unk_100029198;
              v6 = *(NSObject **)(a1 + 48);
              block[4] = *(_QWORD *)(a1 + 40);
              block[5] = a4;
              v17 = a5;
              v18 = WORD2(a5);
              v19 = 2;
              v20 = HIBYTE(a5);
              v21 = a2;
              v7 = block;
LABEL_18:
              dispatch_sync(v6, v7);
            }
            break;
          case 3:
            sub_100009060(a2, a4);
            break;
          default:
            return;
        }
      }
      break;
    case 5:
      v10 = *(NSObject **)(a1 + 32);
      v11 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, &stru_100029828);
      dispatch_group_async(v10, (dispatch_queue_t)qword_10003A8E8, v11);
      _Block_release(v11);
      v12 = qword_10003A938;
      v13 = *(id *)(a1 + 32);
      v14 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, &stru_100029DF0);
      dispatch_group_async(v13, v12, v14);

      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
      break;
    default:
      return;
  }
}

void sub_100009060(uint64_t a1, const void *a2)
{
  uint64_t v3;
  _WORD *v4;
  char *v5;
  unint64_t v6;
  __int128 v7;
  char *v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unsigned __int8 *v18;
  unsigned __int8 *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unsigned __int8 *v23;
  unint64_t v24;
  char *v25;
  uint64_t v26;
  unsigned __int8 *v27;
  const char *v28;
  int v29;
  const unsigned __int8 *v30;
  unsigned __int8 *v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t *v35;
  int8x8_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint8x8_t v42;
  unint64_t v43;
  unsigned __int16 v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t **v50;
  uint64_t *v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t *v55;
  uint64_t *v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t v59;
  unint64_t v60;
  os_unfair_lock_s *lock;
  int v63;
  __int16 v64;
  _OWORD v65[2];
  _WORD __dst[2048];

  v3 = sub_10000D264(a1);
  memcpy(__dst, a2, sizeof(__dst));
  v4 = &__dst[8];
  v5 = (char *)&__dst[8];
  if (__dst[0] <= 0x1000uLL)
  {
    if (__CFADD__(__dst, __dst[0]))
      goto LABEL_129;
    v5 = (char *)__dst + __dst[0];
  }
  lock = (os_unfair_lock_s *)(v3 + 132);
  v6 = 16;
  *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  while (1)
  {
    v8 = (char *)(v4 + 12);
    if (v4 + 12 >= (_WORD *)v5)
      break;
    v9 = v6;
    if (v6 - 4073 < 0xFFFFFFFFFFFFF007)
      goto LABEL_128;
    v10 = (uint64_t)v4;
    v11 = *((_QWORD *)v4 + 2);
    v12 = HIWORD(v11);
    if (!HIWORD(v11) || (uint64_t)v12 > v5 - v8)
      break;
    v14 = v12 + 24;
    if ((v11 & 0x7000000000000) != 0)
      v14 = (HIWORD(v11) & 0xFFF8) + 32;
    if (__CFADD__(v4, v14))
      goto LABEL_129;
    if (v6 > 0xFF8)
      goto LABEL_128;
    v6 += v14;
    v4 = (_WORD *)((char *)v4 + v14);
    v15 = *(_QWORD *)v10;
    if (*(_QWORD *)v10)
    {
      v65[0] = v7;
      v65[1] = v7;
      v64 = 0;
      v63 = -1431655766;
      if (v15 == 5)
      {
        if ((v15 & 0x10000) != 0)
        {
          if (v11 >> 51)
          {
            v64 = 8;
            v16 = 8;
            if ((v15 & 0x100000) != 0)
              goto LABEL_23;
          }
          else
          {
            v64 = HIWORD(v11);
            v16 = HIWORD(v11);
            if ((v15 & 0x100000) != 0)
            {
LABEL_23:
              if (v16 + 8 > v12)
              {
                v64 = HIWORD(v11);
                v16 = HIWORD(v11);
              }
              else
              {
                v64 = v16 + 8;
                if (__CFADD__(v8, v16))
                  goto LABEL_129;
                v16 = (unsigned __int16)(v16 + 8);
              }
            }
          }
        }
        else
        {
          v16 = 0;
          if ((v15 & 0x100000) != 0)
            goto LABEL_23;
        }
        v17 = v9 + 24;
        switch(BYTE1(v15))
        {
          case 1:
            if ((HIDWORD(v15) - 1) < 2)
            {
              v18 = (unsigned __int8 *)sub_10000A6A0(v10, &v64);
              *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
              *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
              if (!v18)
                continue;
              v19 = v18;
              if (*(_DWORD *)(v10 + 4) == 1)
              {
                uuid_copy((unsigned __int8 *)v65 + 14, v18);
                v20 = *((_QWORD *)v19 + 2);
                v21 = *((_QWORD *)v19 + 3);
                DWORD2(v65[0]) = v20;
                WORD6(v65[0]) = WORD2(v20);
                *(_QWORD *)&v65[0] = v21;
                sub_10000EBAC(v3, (uint64_t)v65);
              }
              else
              {
                sub_10000A744(v3, (uint64_t *)v18);
              }
              v28 = (const char *)(v19 + 32);
              v27 = v19;
              v29 = 1;
              goto LABEL_75;
            }
            if (HIDWORD(v15) != 3 || v16 + 32 > v12)
              continue;
            v64 = v16 + 32;
            if (__CFADD__(v8, v16))
              goto LABEL_129;
            os_unfair_lock_lock_with_options(lock, 0x10000);
            v35 = *(uint64_t **)(v3 + 80);
            if (v35)
            {
              v36 = (int8x8_t)v35[1];
              if (v36)
              {
                v37 = *(_QWORD *)&v8[v16];
                v38 = *(_QWORD *)&v8[v16 + 8];
                v39 = __ROR8__(v38 + 16, 16);
                v40 = 0x9DDFEA08EB382D69
                    * (v39 ^ ((0x9DDFEA08EB382D69 * (v37 ^ v39)) >> 47) ^ (0x9DDFEA08EB382D69 * (v37 ^ v39)));
                v41 = (0x9DDFEA08EB382D69 * (v40 ^ (v40 >> 47))) ^ v38;
                v42 = (uint8x8_t)vcnt_s8(v36);
                v42.i16[0] = vaddlv_u8(v42);
                if (v42.u32[0] > 1uLL)
                {
                  v43 = v41;
                  if (v41 >= *(_QWORD *)&v36)
                    v43 = v41 % *(_QWORD *)&v36;
                }
                else
                {
                  v43 = v41 & (*(_QWORD *)&v36 - 1);
                }
                v49 = *v35;
                v50 = *(uint64_t ***)(*v35 + 8 * v43);
                if (v50)
                {
                  v51 = *v50;
                  if (*v50)
                  {
                    v52 = *(_QWORD *)&v36 - 1;
                    do
                    {
                      v53 = v51[1];
                      if (v53 == v41)
                      {
                        if (v51[2] == v37 && v51[3] == v38)
                        {
                          if (v42.u32[0] > 1uLL)
                          {
                            if (v41 >= *(_QWORD *)&v36)
                              v41 %= *(_QWORD *)&v36;
                          }
                          else
                          {
                            v41 &= v52;
                          }
                          v55 = *(uint64_t **)(v49 + 8 * v41);
                          do
                          {
                            v56 = v55;
                            v55 = (uint64_t *)*v55;
                          }
                          while (v55 != v51);
                          if (v56 == v35 + 2)
                            goto LABEL_114;
                          v57 = v56[1];
                          if (v42.u32[0] > 1uLL)
                          {
                            if (v57 >= *(_QWORD *)&v36)
                              v57 %= *(_QWORD *)&v36;
                          }
                          else
                          {
                            v57 &= v52;
                          }
                          if (v57 != v41)
                          {
LABEL_114:
                            if (!*v51)
                              goto LABEL_115;
                            v58 = *(_QWORD *)(*v51 + 8);
                            if (v42.u32[0] > 1uLL)
                            {
                              if (v58 >= *(_QWORD *)&v36)
                                v58 %= *(_QWORD *)&v36;
                            }
                            else
                            {
                              v58 &= v52;
                            }
                            if (v58 != v41)
LABEL_115:
                              *(_QWORD *)(v49 + 8 * v41) = 0;
                          }
                          v59 = *v51;
                          if (*v51)
                          {
                            v60 = *(_QWORD *)(v59 + 8);
                            if (v42.u32[0] > 1uLL)
                            {
                              if (v60 >= *(_QWORD *)&v36)
                                v60 %= *(_QWORD *)&v36;
                            }
                            else
                            {
                              v60 &= v52;
                            }
                            if (v60 != v41)
                            {
                              *(_QWORD *)(*v35 + 8 * v60) = v56;
                              v59 = *v51;
                            }
                          }
                          *v56 = v59;
                          *v51 = 0;
                          --v35[3];
                          operator delete(v51);
                          break;
                        }
                      }
                      else
                      {
                        if (v42.u32[0] > 1uLL)
                        {
                          if (v53 >= *(_QWORD *)&v36)
                            v53 %= *(_QWORD *)&v36;
                        }
                        else
                        {
                          v53 &= v52;
                        }
                        if (v53 != v43)
                          break;
                      }
                      v51 = (uint64_t *)*v51;
                    }
                    while (v51);
                  }
                }
              }
            }
LABEL_72:
            os_unfair_lock_unlock(lock);
            goto LABEL_76;
          case 2:
            if (v16 + 4 > v12)
              continue;
            if (~(unint64_t)v8 < v16)
              goto LABEL_129;
            v22 = v17 + v16;
            if (v22 - 4094 < 0xFFFFFFFFFFFFF000 || v22 - 4093 < 0xFFFFFFFFFFFFF000)
              goto LABEL_128;
            if (v8[v16 + 2]
               + (unint64_t)(unsigned __int16)(v16 + 4)
               + v8[v16 + 3] > v12)
              continue;
            v64 = v8[v16 + 2] + v16 + 4 + v8[v16 + 3];
            if ((unsigned __int16)(v16 + 4) > ~(unint64_t)v8)
              goto LABEL_129;
            v23 = (unsigned __int8 *)sub_100009838((uint64_t)&v8[v16]);
            *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
            *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
            if (!v23)
              continue;
            sub_100009794(v3, v23);
            goto LABEL_76;
          case 3:
            if (v16 + 32 > v12)
              continue;
            v64 = v16 + 32;
            if (__CFADD__(v8, v16))
              goto LABEL_129;
            v24 = v17 + v16;
            v25 = &v8[v16];
            if (HIDWORD(v15) == 2)
            {
              os_unfair_lock_lock_with_options(lock, 0x10000);
              v44 = *(_WORD *)(v3 + 130);
              if (!v44)
                goto LABEL_72;
              v45 = 0;
              v46 = 0;
              while (1)
              {
                v47 = *(_QWORD *)(v3 + 72);
                if (__CFADD__(v47, v45))
                  break;
                if (v24 > 0xFF8)
                  goto LABEL_128;
                if (*(_QWORD *)(v47 + v45 + 14) == *(_QWORD *)v25)
                {
                  if ((unint64_t)v25 > 0xFFFFFFFFFFFFFFF7
                    || (unint64_t)(v47 + v45 + 14) > 0xFFFFFFFFFFFFFFF7)
                  {
                    break;
                  }
                  if (v24 - 4081 < 0xFFFFFFFFFFFFF007)
                    goto LABEL_128;
                  v48 = v47 + v45;
                  if (*(_QWORD *)(v48 + 22) == *((_QWORD *)v25 + 1))
                  {
                    *(_WORD *)(v48 + 12) = 0;
                    *(_DWORD *)(v48 + 8) = 0;
                    *(_QWORD *)v48 = 0;
                    v44 = *(_WORD *)(v3 + 130);
                  }
                }
                ++v46;
                v45 += 32;
                if (v46 >= v44)
                  goto LABEL_72;
              }
LABEL_129:
              __break(0x5513u);
            }
            if (HIDWORD(v15) == 1)
            {
              uuid_copy((unsigned __int8 *)v65 + 14, (const unsigned __int8 *)&v8[v16]);
              if (v24 - 4073 < 0xFFFFFFFFFFFFF007
                || (v26 = *((_QWORD *)v25 + 2),
                    DWORD2(v65[0]) = v26,
                    WORD6(v65[0]) = WORD2(v26),
                    v24 - 4065 < 0xFFFFFFFFFFFFF007))
              {
LABEL_128:
                __break(1u);
                goto LABEL_129;
              }
              *(_QWORD *)&v65[0] = *((_QWORD *)v25 + 3);
              sub_10000EBAC(v3, (uint64_t)v65);
              if (qword_10003A9E8 != -1)
                dispatch_once(&qword_10003A9E8, &stru_10002A918);
              *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
              *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
              if (!byte_10002DF3C)
              {
                v27 = (unsigned __int8 *)&v8[v16];
                v28 = 0;
                v29 = 2;
LABEL_75:
                sub_10000A278(v27, v28, 0, v29);
LABEL_76:
                *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
                *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
              }
            }
            break;
          case 4:
            sub_10000B0A0(a1, &v63);
            *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
            *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
            if (v63)
              continue;
            v30 = (const unsigned __int8 *)sub_10000A6A0(v10, &v64);
            *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
            *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
            if (!v30)
              continue;
            v31 = (unsigned __int8 *)v30;
            uuid_copy((unsigned __int8 *)v65 + 14, v30);
            v32 = *((_QWORD *)v31 + 2);
            v33 = *((_QWORD *)v31 + 3);
            DWORD2(v65[0]) = v32;
            WORD6(v65[0]) = WORD2(v32);
            *(_QWORD *)&v65[0] = v33;
            sub_10000EBAC(v3, (uint64_t)v65);
            v34 = *(_DWORD *)(v10 + 4);
            if (v34 == 8)
            {
              v28 = (const char *)(v31 + 32);
              v27 = v31;
              v29 = 8;
            }
            else
            {
              *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
              *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
              if (v34 != 16)
                continue;
              v28 = (const char *)(v31 + 32);
              v27 = v31;
              v29 = 4;
            }
            goto LABEL_75;
          default:
            continue;
        }
      }
    }
  }
}

void sub_100009794(uint64_t a1, unsigned __int8 *a2)
{
  unint64_t v4;
  os_unfair_lock_s *v5;
  uint64_t *v6;
  uint64_t **v7;
  uint64_t *v8;
  uint64_t v9;

  v4 = a2[2] + (unint64_t)a2[3];
  v5 = (os_unfair_lock_s *)(a1 + 132);
  os_unfair_lock_lock_with_options(a1 + 132, 0x10000);
  v6 = (uint64_t *)(a1 + 16);
  v7 = (uint64_t **)(a1 + 16);
  while (1)
  {
    v7 = (uint64_t **)*v7;
    if (!v7)
      break;
    if (*((unsigned __int16 *)v7 + 4) == *(unsigned __int16 *)a2)
      goto LABEL_8;
  }
  v8 = (uint64_t *)_os_trace_malloc(v4 + 16);
  memcpy(v8 + 1, a2, v4 + 4);
  v9 = *v6;
  *v8 = *v6;
  if (!v9)
    *(_QWORD *)(a1 + 24) = v8;
  *v6 = (uint64_t)v8;
LABEL_8:
  os_unfair_lock_unlock(v5);
}

uint64_t sub_100009838(uint64_t result)
{
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(unsigned __int8 *)(result + 2);
  if (!*(_BYTE *)(result + 2) || !*(_BYTE *)(result + 3))
    return 0;
  v2 = result + 4;
  v3 = (v1 - 1);
  v4 = ~(result + 4);
  if (v3 > v4)
    goto LABEL_11;
  if (*(_BYTE *)(v2 + v3))
    return 0;
  if (v4 < v1 || (v5 = v2 + v1, v6 = *(unsigned __int8 *)(result + 3) - 1, __CFADD__(v5, v6)))
  {
LABEL_11:
    __break(0x5513u);
  }
  else if (*(_BYTE *)(v5 + v6))
  {
    return 0;
  }
  return result;
}

void sub_100009898(id a1, firehose_client_s *a2, unint64_t a3, firehose_chunk_s *a4, $947C0A473ACA94B8A38733FF54A32168 a5)
{
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  __int128 v10;
  BOOL v11;
  char v12;
  char v13;
  uint64_t **v14;
  uint64_t *v15;
  uint64_t *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  char v22;
  __int128 v23;
  CFArrayRef v24;
  const __CFDictionary *v25;
  const __CFDictionary *v26;
  int v27;
  unsigned __int8 *var1;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  int pid;
  char __b[1024];
  uuid_string_t out;
  _OWORD buffer[64];

  switch(a3)
  {
    case 1uLL:
      pid = -1431655766;
      memset(__b, 170, sizeof(__b));
      sub_10000B0A0((uint64_t)a2, &pid);
      if (!pid)
      {
        *(_QWORD *)__b = 0x6C656E72656B2FLL;
        v9 = sub_10000FE14((uint64_t)a2, __b);
        sub_10000FCA4((uint64_t)a2, (unint64_t)v9);
        if (qword_10003A9C8 != -1)
          dispatch_once(&qword_10003A9C8, &stru_10002A898);
        if (byte_10003A9D0)
          v22 = 6;
        else
          v22 = 4;
        *((_BYTE *)v9 + 136) = v22;
        uuid_copy((unsigned __int8 *)v9 + 32, byte_10003A809);
        if (qword_10003A9E8 != -1)
          dispatch_once(&qword_10003A9E8, &stru_10002A918);
        if (byte_10002DF3C)
          sub_1000224C0((unsigned __int8 *)v9 + 48);
        *(_QWORD *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
        *(_QWORD *)&v23 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v23 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)out = v23;
        *(_OWORD *)&out[16] = v23;
        uuid_unparse(byte_10003A809, out);
        memset(buffer, 170, sizeof(buffer));
        snprintf((char *)buffer, 0x400uLL, "_logd_read_kernel_info calling _logd_uuiddb_harvest_kernel for %s", out);
        sub_100013FF0((uint64_t)buffer);
        sub_1000154C4();
        if (qword_10003A9E8 != -1)
          dispatch_once(&qword_10003A9E8, &stru_10002A918);
        if (!byte_10002DF3C)
        {
          v24 = CFArrayCreate(kCFAllocatorDefault, (const void **)off_10002C368, 3, &kCFTypeArrayCallBacks);
          v25 = (const __CFDictionary *)OSKextCopyLoadedKextInfo(0, v24);
          if (v25)
          {
            v26 = v25;
            CFDictionaryApplyFunction(v25, (CFDictionaryApplierFunction)sub_100013D28, v9);
            CFRelease(v26);
          }
          if (v24)
            CFRelease(v24);
        }
        goto LABEL_55;
      }
      *(_QWORD *)out = 0xAAAAAAAAAAAAAAAALL;
      v7 = sub_10000D970((uint64_t)a2, out);
      if (!v7)
      {
        qword_10002DF48 = (uint64_t)"BUG IN LIBTRACE: Should have a metadata buffer";
        __break(1u);
        goto LABEL_70;
      }
      if (*(_QWORD *)out != 2048)
      {
LABEL_70:
        qword_10002DF48 = (uint64_t)"BUG IN LIBTRACE: Invalid metadata buffer size";
        __break(1u);
        goto LABEL_71;
      }
      v8 = v7;
      if (proc_pidpath(pid, __b, 0x400u) <= 0)
        __strlcpy_chk(__b, v8 + 568, 1024, 1024);
      v9 = sub_10000FE14((uint64_t)a2, __b);
      sub_10000FCA4((uint64_t)a2, (unint64_t)v9);
      *(_QWORD *)&v10 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
      buffer[0] = v10;
      buffer[1] = v10;
      buffer[2] = v10;
      buffer[3] = v10;
      buffer[4] = v10;
      buffer[5] = v10;
      buffer[6] = v10;
      buffer[7] = v10;
      buffer[8] = v10;
      buffer[9] = v10;
      buffer[10] = v10;
      buffer[11] = v10;
      if (proc_pidinfo(pid, 18, 1uLL, buffer, 192) == 192)
      {
        uuid_copy((unsigned __int8 *)v9 + 32, (const unsigned __int8 *)&buffer[8] + 8);
        v11 = (buffer[0] & 0x10) == 0;
        v12 = 6;
        v13 = 4;
      }
      else
      {
        uuid_copy((unsigned __int8 *)v9 + 32, (const unsigned __int8 *)(v8 + 24));
        v11 = (*(_WORD *)v8 & 1) == 0;
        v12 = 4;
        v13 = 6;
      }
      if (v11)
        v12 = v13;
      v27 = *((unsigned __int8 *)v9 + 138);
      *((_BYTE *)v9 + 136) = v12;
      if (v27 && sub_10000A278((unsigned __int8 *)v9 + 32, (const char *)v9 + 138, 0, 1))
        sub_10000FC98((uint64_t)a2);
      if (!uuid_is_null((const unsigned __int8 *)(v8 + 40)))
      {
        uuid_copy((unsigned __int8 *)v9 + 48, (const unsigned __int8 *)(v8 + 40));
        sub_10000FCB8((_OWORD *)v9 + 3);
      }
      var1 = (unsigned __int8 *)a4->var0.var1.var1;
      if (var1)
      {
        v29 = *(_QWORD *)a4->var0.var1.var2;
        if (v29)
          sub_100013E38((uint64_t)v9, var1, v29);
      }
LABEL_55:
      os_unfair_lock_lock_with_options(&unk_10003A7B0, 0x10000);
      v30 = qword_10003A7B8;
      *v9 = qword_10003A7B8;
      if (v30)
        v31 = (uint64_t *)qword_10003A7B8;
      else
        v31 = &qword_10003A7B8;
      v31[1] = (uint64_t)v9;
      qword_10003A7B8 = (uint64_t)v9;
      v9[1] = &qword_10003A7B8;
      if (pid)
      {
        if (__OFADD__(dword_10003A81C, 1))
          goto LABEL_72;
        ++dword_10003A81C;
        if (qword_10003A820 != -1)
          dispatch_once(&qword_10003A820, &stru_1000293F8);
        dispatch_group_enter((dispatch_group_t)qword_10003A828);
      }
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_10003A7B0);
      return;
    case 2uLL:
      *(_DWORD *)__b = -1431655766;
      v14 = (uint64_t **)sub_10000D264((uint64_t)a2);
      sub_10000B0A0((uint64_t)a2, __b);
      os_unfair_lock_lock_with_options(&unk_10003A7B0, 0x10000);
      v15 = *v14;
      v16 = &qword_10003A7B8;
      if (*v14)
        v16 = *v14;
      v16[1] = (uint64_t)v14[1];
      *v14[1] = (uint64_t)v15;
      if (!*(_DWORD *)__b)
        goto LABEL_23;
      v17 = dword_10003A81C - 1;
      if (__OFSUB__(dword_10003A81C, 1))
      {
LABEL_71:
        __break(0x5515u);
LABEL_72:
        __break(0x5500u);
      }
      else
      {
        --dword_10003A81C;
        if (!v17)
        {
          memset((char *)&buffer[2] + 3, 170, 0x3DDuLL);
          strcpy((char *)buffer, "No userlevel firehose clients left");
          sub_100013FF0((uint64_t)buffer);
        }
        if (qword_10003A820 != -1)
          dispatch_once(&qword_10003A820, &stru_1000293F8);
        dispatch_group_leave((dispatch_group_t)qword_10003A828);
LABEL_23:
        os_unfair_lock_unlock((os_unfair_lock_t)&unk_10003A7B0);
        *(_QWORD *)&buffer[0] = _NSConcreteStackBlock;
        *((_QWORD *)&buffer[0] + 1) = 0x40000000;
        *(_QWORD *)&buffer[1] = sub_100012250;
        *((_QWORD *)&buffer[1] + 1) = &unk_100029058;
        *(_QWORD *)&buffer[2] = v14;
        sub_100012250((uint64_t)buffer, 0);
        sub_100012250((uint64_t)buffer, 1u);
        sub_100012250((uint64_t)buffer, 2u);
        (*(void (**)(_OWORD *, uint64_t))&buffer[1])(buffer, 3);
        (*(void (**)(_OWORD *, uint64_t))&buffer[1])(buffer, 4);
      }
      return;
    case 3uLL:
    case 4uLL:
      if (a5.var2.var0 <= 0x1000uLL && a5.var2.var1 <= 0x1000uLL)
      {
        switch(a5.var2.var4)
        {
          case 0u:
          case 1u:
          case 4u:
            if (a3 == 3)
              goto LABEL_66;
            break;
          case 2u:
            if (a3 == 4)
LABEL_66:
              sub_100009FE8(a2, (char *)a4, a5.var0 & 0xFFFFFFFF00000000 | ((unint64_t)a5.var2.var1 << 16) | a5.var2.var0);
            break;
          case 3u:
            if (a3 == 4)
              sub_100009060((uint64_t)a2, a4);
            break;
          default:
            return;
        }
      }
      return;
    case 6uLL:
      v18 = sub_10000D264((uint64_t)a2);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD **)(v18 + 16);
        if (v20)
        {
          do
          {
            v21 = (_QWORD *)*v20;
            free(v20);
            v20 = v21;
          }
          while (v21);
        }
        sub_10000FB30(*(_QWORD *)(v19 + 80));
        free(*(void **)(v19 + 72));
        free((void *)v19);
      }
      return;
    default:
      return;
  }
}

void sub_100009FE8(void *a1, char *a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;
  uint64_t v9;
  os_unfair_lock_s *v10;
  unsigned int v11;
  uint64_t v12;
  _QWORD *v13;
  int v14;

  v6 = HIWORD(a3);
  v14 = -1431655766;
  sub_10000B0A0((uint64_t)a1, &v14);
  if (v14)
    v7 = HIBYTE(a3) & 4;
  else
    LODWORD(v7) = byte_10003A7C8 & 1;
  v8 = 4;
  switch((char)v6)
  {
    case 0:
      goto LABEL_7;
    case 1:
      LOBYTE(v6) = 1;
      goto LABEL_7;
    case 2:
      goto LABEL_12;
    case 4:
      LOBYTE(v6) = 2;
LABEL_7:
      if ((_DWORD)v7)
        v8 = 3;
      else
        v8 = v6;
      if (!(_DWORD)v7 || byte_10003A89C)
      {
LABEL_12:
        v9 = sub_10000D264((uint64_t)a1);
        if (!*(_BYTE *)(v9 + 128))
        {
          if (1248 * (unint64_t)v8 > ~(unint64_t)qword_10002C398)
          {
            __break(0x5513u);
          }
          else
          {
            v10 = (os_unfair_lock_s *)v9;
            sub_10000ADFC((dispatch_queue_t *)&qword_10002C398[156 * v8], a2, a3, a1);
            v11 = (unsigned __int16)a3 - WORD1(a3) + 4096;
            if (v11 >= 0xFF9)
              v11 = 4096;
            if (WORD1(a3) == 4096)
              v12 = (unsigned __int16)a3;
            else
              v12 = v11;
            os_unfair_lock_lock_with_options(&v10[33], 0x10000);
            v13 = (_QWORD *)sub_10000A17C((uint64_t)v10, v8);
            *v13 += v12;
            os_unfair_lock_unlock(v10 + 33);
          }
        }
      }
      break;
    default:
      return;
  }
}

uint64_t sub_10000A17C(uint64_t result, unsigned int a2)
{
  uint64_t v2;

  if (a2 >= 5)
  {
    v2 = _os_assert_log(0);
    result = _os_crash(v2);
    __break(1u);
  }
  else if (!__CFADD__(result + 88, 8 * a2))
  {
    result += 8 * a2 + 88;
    return result;
  }
  __break(0x5513u);
  return result;
}

uint64_t sub_10000A1BC(mach_port_t a1, uint64_t a2, uint64_t a3, int a4, mach_msg_timeout_t timeout)
{
  uint64_t v5;
  mach_msg_header_t msg;
  NDR_record_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;

  v9 = a2;
  v8 = NDR_record;
  v10 = a3;
  v11 = a4;
  *(_QWORD *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 11702;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  v5 = mach_msg(&msg, 17, 0x34u, 0, 0, timeout, 0);
  if ((_DWORD)v5 == 268435460)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(mach_task_self_, msg.msgh_local_port);
    mach_msg_destroy(&msg);
  }
  return v5;
}

uint64_t sub_10000A278(unsigned __int8 *a1, const char *a2, xpc_object_t xdict, int a4)
{
  xpc_object_t array;
  void *v8;
  size_t v9;
  xpc_object_t value;
  uint64_t v11;
  BOOL v13;
  char *v14;
  const char *v15;
  uint64_t v16;
  const void *boot_uuid;
  char *v18;
  char *__stringp[7];
  int v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  _BYTE v24[2072];
  char __b[1024];

  if (!xdict)
  {
    v8 = 0;
LABEL_11:
    memset(__b, 170, sizeof(__b));
    v21 = 0;
    v22 = &v21;
    v23 = 0x83000000000;
    memset(v24, 170, 0x810uLL);
    v24[2064] = 0;
    if (qword_10003A9E8 == -1)
    {
      if ((a4 & 2) == 0)
        goto LABEL_19;
    }
    else
    {
      dispatch_once(&qword_10003A9E8, &stru_10002A918);
      if ((a4 & 2) == 0)
        goto LABEL_19;
    }
    if (byte_10002DF3C)
    {
LABEL_14:
      v11 = 0;
LABEL_15:
      _Block_object_dispose(&v21, 8);
      return v11;
    }
LABEL_19:
    if ((a4 & 1) != 0 && (!a2 || !*a2))
      goto LABEL_14;
    os_unfair_lock_lock_with_options(&unk_10003A8D8, 0x10000);
    v13 = sub_10000A5A8((_QWORD *)qword_10003A8E0, a1);
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_10003A8D8);
    if (v13)
    {
      v11 = 1;
      goto LABEL_15;
    }
    uuid_copy((unsigned __int8 *)v22 + 24, a1);
    if (a2)
    {
      v14 = (char *)(v22 + 5);
      if ((a4 & 0xC) != 0)
      {
        __stringp[0] = (char *)(v22 + 133);
        strlcpy((char *)v22 + 1064, a2, 0x400uLL);
        strsep(__stringp, "/");
        if (__stringp[0])
          v15 = __stringp[0];
        else
          v15 = a2;
        strlcpy(v14, v15, 0x400uLL);
      }
      else
      {
        __strlcpy_chk(v22 + 5, a2, 1024, 1024);
      }
    }
    else
    {
      *((_BYTE *)v22 + 40) = 0;
    }
    v16 = sub_10000F9A4((unsigned __int8 *)v22 + 24, 1u, __b);
    if ((a4 & 0x100) != 0)
    {
      boot_uuid = (const void *)_os_trace_get_boot_uuid(v16);
      if (!setxattr(__b, "com.apple.uuiddb.boot-uuid", boot_uuid, 0x25uLL, 0, 0))
        goto LABEL_14;
    }
    else if (!access(__b, 0))
    {
      sub_1000017B4((uint64_t *)a1);
      v11 = 1;
      *((_BYTE *)v22 + 2088) = 1;
      if ((a4 & 8) == 0)
        goto LABEL_15;
    }
    if (v8)
    {
      xpc_retain(v8);
      v18 = (char *)os_transaction_create("com.apple.logd.uuiddb");
    }
    else
    {
      v18 = 0;
    }
    __stringp[0] = (char *)_NSConcreteStackBlock;
    __stringp[1] = (char *)0x40000000;
    __stringp[2] = (char *)sub_100001F40;
    __stringp[3] = (char *)&unk_100029850;
    v20 = a4;
    __stringp[4] = (char *)&v21;
    __stringp[5] = (char *)v8;
    __stringp[6] = v18;
    dispatch_async((dispatch_queue_t)qword_10003A8E8, __stringp);
    goto LABEL_14;
  }
  if ((a4 & 1) == 0)
    __assert_rtn("_logd_uuiddb_harvest", "logd_uuiddb.c", 303, "opts & LOGD_HARVEST_UUID_MACHO");
  array = xpc_dictionary_get_array(xdict, "sections");
  if (array)
  {
    v8 = array;
    if (xpc_array_get_count(array) == 5)
    {
      v9 = 0;
      while (1)
      {
        value = xpc_array_get_value(v8, v9);
        if (xpc_get_type(value) != (xpc_type_t)&_xpc_type_data)
          break;
        if (++v9 == 5)
          goto LABEL_11;
      }
    }
  }
  return 0;
}

BOOL sub_10000A5A8(_QWORD *a1, _QWORD *a2)
{
  int8x8_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint8x8_t v7;
  unint64_t v8;
  _QWORD *i;
  unint64_t v10;

  v2 = (int8x8_t)a1[1];
  if (v2)
  {
    v3 = a2[1];
    v4 = __ROR8__(v3 + 16, 16);
    v5 = 0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (*a2 ^ v4)) >> 47) ^ (0x9DDFEA08EB382D69 * (*a2 ^ v4)));
    v6 = (0x9DDFEA08EB382D69 * (v5 ^ (v5 >> 47))) ^ v3;
    v7 = (uint8x8_t)vcnt_s8(v2);
    v7.i16[0] = vaddlv_u8(v7);
    if (v7.u32[0] > 1uLL)
    {
      v8 = v6;
      if (v6 >= *(_QWORD *)&v2)
        v8 = v6 % *(_QWORD *)&v2;
    }
    else
    {
      v8 = v6 & (*(_QWORD *)&v2 - 1);
    }
    i = *(_QWORD **)(*a1 + 8 * v8);
    if (i)
    {
      for (i = (_QWORD *)*i; i; i = (_QWORD *)*i)
      {
        v10 = i[1];
        if (v6 == v10)
        {
          if (i[2] == *a2 && i[3] == v3)
            return i != 0;
        }
        else
        {
          if (v7.u32[0] > 1uLL)
          {
            if (v10 >= *(_QWORD *)&v2)
              v10 %= *(_QWORD *)&v2;
          }
          else
          {
            v10 &= *(_QWORD *)&v2 - 1;
          }
          if (v10 != v8)
            goto LABEL_22;
        }
      }
    }
  }
  else
  {
LABEL_22:
    i = 0;
  }
  return i != 0;
}

uint64_t sub_10000A6A0(uint64_t result, _WORD *a2)
{
  unint64_t v3;
  __int16 v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  const char *v9;
  unint64_t v10;
  unint64_t v11;
  unsigned __int16 v12;
  size_t v13;
  unint64_t v14;

  v3 = (unsigned __int16)*a2;
  v4 = v3 + 32;
  v5 = *(_QWORD *)(result + 16);
  if (v3 + 32 > HIWORD(v5))
  {
    result = 0;
    v14 = HIWORD(v5);
LABEL_7:
    *a2 = v14;
    return result;
  }
  *a2 = v4;
  v6 = result + 24;
  v7 = ~(result + 24);
  if (v7 >= v3 && (unsigned __int16)(v3 + 32) <= v7)
  {
    v8 = v6 + v3;
    v9 = (const char *)(v6 + (unsigned __int16)(v3 + 32));
    v10 = *(_QWORD *)(result + 16);
    v11 = HIWORD(v10);
    v12 = HIWORD(v10) - v4;
    v13 = strnlen(v9, (unsigned __int16)(HIWORD(v10) - v4));
    LOWORD(v14) = v4 + v13;
    if (v13 == v12)
    {
      LOWORD(v14) = v11;
      result = 0;
    }
    else
    {
      result = v8;
    }
    goto LABEL_7;
  }
  __break(0x5513u);
  return result;
}

void sub_10000A744(uint64_t a1, uint64_t *a2)
{
  os_unfair_lock_s *v4;
  uint64_t v5;

  v4 = (os_unfair_lock_s *)(a1 + 132);
  os_unfair_lock_lock_with_options(a1 + 132, 0x10000);
  v5 = *(_QWORD *)(a1 + 80);
  if (!v5)
    operator new();
  sub_10000A7BC(v5, a2);
  os_unfair_lock_unlock(v4);
}

void sub_10000A7BC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  unint64_t v9;
  _QWORD *v10;
  _QWORD *i;
  unint64_t v12;
  _QWORD *v14;
  float v15;
  float v16;
  _BOOL8 v17;
  unint64_t v18;
  unint64_t v19;
  size_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  unint64_t v24;

  v3 = *a2;
  v4 = a2[1];
  v5 = __ROR8__(v4 + 16, 16);
  v6 = (0x9DDFEA08EB382D69
      * ((0x9DDFEA08EB382D69 * (v5 ^ ((0x9DDFEA08EB382D69 * (*a2 ^ v5)) >> 47) ^ (0x9DDFEA08EB382D69 * (*a2 ^ v5)))) ^ ((0x9DDFEA08EB382D69 * (v5 ^ ((0x9DDFEA08EB382D69 * (*a2 ^ v5)) >> 47) ^ (0x9DDFEA08EB382D69 * (*a2 ^ v5)))) >> 47))) ^ v4;
  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v9 = (0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69
            * (v5 ^ ((0x9DDFEA08EB382D69 * (*a2 ^ v5)) >> 47) ^ (0x9DDFEA08EB382D69 * (*a2 ^ v5)))) ^ ((0x9DDFEA08EB382D69 * (v5 ^ ((0x9DDFEA08EB382D69 * (*a2 ^ v5)) >> 47) ^ (0x9DDFEA08EB382D69 * (*a2 ^ v5)))) >> 47))) ^ v4;
      if (v6 >= v7)
        v9 = v6 % v7;
    }
    else
    {
      v9 = v6 & (v7 - 1);
    }
    v10 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v9);
    if (v10)
    {
      for (i = (_QWORD *)*v10; i; i = (_QWORD *)*i)
      {
        v12 = i[1];
        if (v12 == v6)
        {
          if (i[2] == v3 && i[3] == v4)
            return;
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v12 >= v7)
              v12 %= v7;
          }
          else
          {
            v12 &= v7 - 1;
          }
          if (v12 != v9)
            break;
        }
      }
    }
  }
  else
  {
    v9 = 0xAAAAAAAAAAAAAAAALL;
  }
  v14 = operator new(0x20uLL);
  v14[1] = v6;
  v14[2] = v3;
  v14[3] = v4;
  v15 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v16 = *(float *)(a1 + 32);
  if (!v7 || (float)(v16 * (float)v7) < v15)
  {
    v17 = 1;
    if (v7 >= 3)
      v17 = (v7 & (v7 - 1)) != 0;
    v18 = v17 | (2 * v7);
    v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19)
      v20 = v19;
    else
      v20 = v18;
    sub_10000F6D8(a1, v20);
    v7 = *(_QWORD *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7)
        v9 = v6 % v7;
      else
        v9 = v6;
    }
    else
    {
      v9 = (v7 - 1) & v6;
    }
  }
  v21 = *(_QWORD *)a1;
  v22 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v9);
  if (v22)
  {
    *v14 = *v22;
LABEL_42:
    *v22 = v14;
    goto LABEL_43;
  }
  v23 = *(_QWORD *)(a1 + 16);
  *v14 = v23;
  *(_QWORD *)(a1 + 16) = v14;
  *(_QWORD *)(v21 + 8 * v9) = a1 + 16;
  if (v23)
  {
    v24 = *(_QWORD *)(v23 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v24 >= v7)
        v24 %= v7;
    }
    else
    {
      v24 &= v7 - 1;
    }
    v22 = (_QWORD *)(*(_QWORD *)a1 + 8 * v24);
    goto LABEL_42;
  }
LABEL_43:
  ++*(_QWORD *)(a1 + 24);
}

_QWORD *sub_10000A9EC(void **a1)
{
  unint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  char *v5;
  char *v6;
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  _QWORD *v10;
  char *v11;
  char *v12;
  _BYTE *v13;
  _QWORD *v14;
  uint64_t *v15;
  _QWORD *v16;
  size_t v17;
  char *v18;
  uint64_t v19;
  _WORD *v20;
  __int16 v21;
  _QWORD *v22;
  void *v23;
  int v24;
  char *v25;
  unsigned int *v26;
  unsigned int *v27;
  size_t v28;
  int64_t v29;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void **v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void **v38;
  void **v39;
  char *v40;

  v2 = sub_10000E6F8(a1);
  v3 = (_QWORD *)_os_trace_calloc(1, v2);
  v4 = v3;
  *v3 = 0x110000600BLL;
  v3[1] = 0;
  v3[4] = a1[1];
  v5 = (char *)v3 + v2;
  v6 = (char *)(v3 + 5);
  v33 = v3 + 5;
  v7 = a1[2];
  if (v7)
    v8 = 16 * v7[3];
  else
    v8 = 0;
  if (&v5[-v8] >= v6)
  {
    v9 = (char *)(v3 + 2);
    v34 = _NSConcreteStackBlock;
    v35 = 0x40000000;
    v36 = sub_10000ADE4;
    v37 = &unk_10002A5C0;
    v38 = &v33;
    v10 = (_QWORD *)v7[2];
    v11 = (char *)(v3 + 5);
    if (v10)
    {
      do
      {
        ((void (*)(void ***, _QWORD *, _QWORD))v36)(&v34, v10 + 2, v10[4]);
        v10 = (_QWORD *)*v10;
      }
      while (v10);
      v11 = (char *)v33;
    }
    v12 = &v11[v8];
    v33 = v12;
    *(_WORD *)v9 = (_WORD)v12 - (_WORD)v6;
    v13 = a1[4];
    if (v5 - v13 >= (unint64_t)v12)
    {
      v14 = a1[3];
      v34 = _NSConcreteStackBlock;
      v35 = 0x40000000;
      v36 = sub_10000ADA4;
      v37 = &unk_10002A5E0;
      v38 = a1;
      v39 = &v33;
      if (v14)
      {
        v15 = (uint64_t *)v14[2];
        if (v15)
        {
          do
          {
            v16 = v15 + 2;
            if (*((char *)v15 + 39) < 0)
              v16 = (_QWORD *)*v16;
            ((void (*)(void ***, _QWORD *, uint64_t))v36)(&v34, v16, v15[5]);
            v15 = (uint64_t *)*v15;
          }
          while (v15);
          v13 = a1[4];
          v12 = (char *)v33;
        }
      }
      v33 = &v13[(_QWORD)v12];
      v17 = ((unint64_t)&v13[(_QWORD)v12 + 7] & 0xFFFFFFFFFFFFFFF8) - (unint64_t)&v13[(_QWORD)v12];
      bzero(&v13[(_QWORD)v12], v17);
      v18 = (char *)v33 + v17;
      v33 = v18;
      v19 = v18 - v6;
      *((_WORD *)v4 + 9) = (_WORD)v18 - (_WORD)v6;
      v20 = a1[5];
      if (v20)
        v21 = v20[12];
      else
        v21 = 0;
      *((_WORD *)v4 + 10) = v21;
      v34 = _NSConcreteStackBlock;
      v35 = 0x40000000;
      v36 = sub_10000B590;
      v37 = &unk_10002A600;
      v38 = a1;
      v39 = &v33;
      v40 = v5;
      if (v20)
      {
        v22 = (_QWORD *)*((_QWORD *)v20 + 2);
        if (v22)
        {
          do
          {
            ((void (*)(void ***, _QWORD))v36)(&v34, v22[4]);
            v22 = (_QWORD *)*v22;
          }
          while (v22);
          v18 = (char *)v33;
          v19 = (_BYTE *)v33 - v6;
        }
      }
      *((_WORD *)v4 + 11) = v19;
      *((_WORD *)v4 + 12) = 0;
      v23 = a1[8];
      if (v23)
      {
        do
        {
          v24 = *((_DWORD *)v23 + 8);
          if (v24)
          {
            *(_OWORD *)v18 = *((_OWORD *)v23 + 1);
            *((_DWORD *)v18 + 4) = v24;
            *((_DWORD *)v18 + 5) = *((_DWORD *)v23 + 9);
            v25 = v18 + 24;
            v33 = v18 + 24;
            if ((unint64_t)(v5 - (v18 + 24)) > 3)
            {
              *((_DWORD *)v18 + 6) = *(_DWORD *)(*((_QWORD *)v23 + 6) + 4);
              v33 = v18 + 28;
              v34 = _NSConcreteStackBlock;
              v26 = (unsigned int *)*((_QWORD *)v23 + 6);
              v35 = 0x40000000;
              v36 = sub_10000B9C8;
              v37 = &unk_10002A660;
              v38 = &v33;
              sub_10000B778(v26, (uint64_t)&v34);
              v25 = (char *)v33;
              if ((unint64_t)(v5 - (_BYTE *)v33) >= 4)
              {
                *(_DWORD *)v33 = *(_DWORD *)(*((_QWORD *)v23 + 5) + 4);
                v33 = v25 + 4;
                v34 = _NSConcreteStackBlock;
                v27 = (unsigned int *)*((_QWORD *)v23 + 5);
                v35 = 0x40000000;
                v36 = sub_10000B800;
                v37 = &unk_10002A680;
                v38 = &v33;
                sub_10000B778(v27, (uint64_t)&v34);
                v25 = (char *)v33;
              }
            }
            ++*((_WORD *)v4 + 12);
            v28 = ((unint64_t)(v25 + 7) & 0xFFFFFFFFFFFFFFF8) - (_QWORD)v25;
            bzero(v25, v28);
            v18 = (char *)v33 + v28;
            v33 = (char *)v33 + v28;
          }
          v23 = *(void **)v23;
        }
        while (v23);
        v19 = v18 - v6;
        v9 = (char *)(v4 + 2);
      }
      if (v19 >= 0x10000)
      {
        v31 = _os_assert_log(0);
        _os_crash(v31);
        __break(1u);
      }
      else
      {
        v29 = v18 - v9;
        v4[1] = v29;
        if (v29 + 16 <= v2)
          return v4;
      }
      v32 = _os_assert_log(0);
      _os_crash(v32);
      __break(1u);
    }
  }
  free(v4);
  return 0;
}

char *sub_10000ADA4(uint64_t a1, const char *a2, unsigned __int16 a3)
{
  char *result;
  uint64_t v4;

  if ((unint64_t)a3 < *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32))
    return strcpy((char *)(**(_QWORD **)(a1 + 40) + a3), a2);
  v4 = _os_assert_log(0);
  result = (char *)_os_crash(v4);
  __break(1u);
  return result;
}

__n128 sub_10000ADE4(uint64_t a1, __n128 *a2, unsigned __int16 a3)
{
  __n128 result;

  result = *a2;
  *(__n128 *)(**(_QWORD **)(a1 + 32) + 16 * a3) = *a2;
  return result;
}

uint64_t sub_10000ADFC(dispatch_queue_t *a1, char *a2, int a3, void *a4)
{
  unsigned int v8;
  unsigned int v9;
  uint64_t v11;
  uint64_t result;
  dispatch_queue_t *v13;
  unsigned int v14;
  uint64_t v15;
  unsigned int v16;
  dispatch_queue_t *v17;
  float **v18;
  _QWORD *v19;
  void *v20;
  dispatch_queue_t *v21;
  uint64_t v22;
  int32x2_t *v23;
  unsigned int v24;
  uint64_t v25;
  unsigned int v26;
  _BOOL4 v27;
  size_t v28;
  _BOOL4 v29;
  size_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  void *v36;
  char *v37;
  size_t v38;
  unsigned int v39;

  dispatch_assert_queue_V2(*a1);
  if (HIWORD(a3) == 4096)
  {
    v8 = (unsigned __int16)a3;
    v9 = (unsigned __int16)a3;
    if ((a3 & 7) == 0)
    {
LABEL_12:
      v11 = v8 + 32;
      goto LABEL_14;
    }
  }
  else
  {
    v9 = (unsigned __int16)a3 - HIWORD(a3) + 4096;
    if ((unsigned __int16)a3 - HIWORD(a3) + 7 < 0xFFFFF007
      || (((unsigned __int16)a3 - HIWORD(a3)) & 7) == 0)
    {
      if (v9 >= 0xFF9)
        v8 = 4096;
      else
        v8 = (unsigned __int16)a3 - HIWORD(a3) + 4096;
      goto LABEL_12;
    }
  }
  v11 = v9 - (unint64_t)(v9 & 7) + 40;
LABEL_14:
  result = (uint64_t)sub_10000B0D8((uint64_t)a1, v11);
  if (result >= 5)
    goto LABEL_47;
  v39 = v11;
  v13 = a1 + 6;
  if (__CFADD__(a1 + 6, 264 * result))
    goto LABEL_46;
  v14 = result;
  v15 = sub_10000B0A0((uint64_t)a4, 0);
  v16 = sub_10000B0D0((uint64_t)a4);
  v17 = &v13[33 * v14];
  v19 = v17[28];
  v18 = (float **)(v17 + 28);
  result = (uint64_t)sub_10000D3D4(v19, v15, v16);
  if (!result)
  {
    v20 = os_retain(a4);
    result = sub_10000D98C(v18, v15, v16, (uint64_t)v20);
  }
  v21 = &v13[33 * v14];
  v24 = *((_DWORD *)v21 + 63);
  v23 = (int32x2_t *)((char *)v21 + 252);
  v22 = v24;
  v25 = *(uint64_t *)((char *)&v23[-2] + 4);
  if (__CFADD__(v25, v24))
    goto LABEL_46;
  v26 = (unsigned __int16)a3 - HIWORD(a3) + 4096;
  v27 = v26 < 0xFF9;
  if (v26 >= 0xFF9)
    v26 = 4096;
  if (HIWORD(a3) == 4096)
    v28 = (unsigned __int16)a3;
  else
    v28 = v26;
  v29 = HIWORD(a3) != 4096 && v27;
  v30 = v28 + 32;
  if (v25)
  {
    v31 = v25 + v22;
    if ((v28 & 7) == 0)
      goto LABEL_38;
    if (!__CFADD__(v31, v30 & 0x1FFFFFFF8))
      goto LABEL_37;
    goto LABEL_46;
  }
  if ((v28 & 7) != 0)
    v32 = (v30 & 0x1FFFFFFF8) + 8;
  else
    v32 = v28 + 32;
  result = _os_trace_malloc(v32);
  v31 = result;
  if ((v28 & 7) != 0)
  {
    if (!__CFADD__(result, v30 & 0x1FFFFFFF8))
    {
LABEL_37:
      *(_QWORD *)(v31 + (v30 & 0x1FFFFFFF8)) = 0;
      goto LABEL_38;
    }
LABEL_46:
    __break(0x5513u);
    goto LABEL_47;
  }
LABEL_38:
  *(_QWORD *)v31 = 24577;
  *(_QWORD *)(v31 + 8) = v28 + 16;
  v33 = sub_10000B0A0((uint64_t)a4, 0);
  v34 = sub_10000B0D0((uint64_t)a4);
  *(_QWORD *)(v31 + 16) = v33;
  *(_DWORD *)(v31 + 24) = v34;
  *(_BYTE *)(v31 + 28) = 0;
  *(_BYTE *)(v31 + 29) = v29;
  v35 = v31 + 32;
  *(_WORD *)(v31 + 30) = 0;
  if (!v29)
  {
    v36 = (void *)(v31 + 32);
    v37 = a2;
    v38 = v28;
    goto LABEL_44;
  }
  result = (uint64_t)memcpy((void *)(v31 + 32), a2, (unsigned __int16)a3);
  if (__CFADD__(v35, (unsigned __int16)a3))
    goto LABEL_46;
  if (HIWORD(a3) <= 0x1000uLL)
  {
    if (!__CFADD__(a2, HIWORD(a3)))
    {
      v36 = (void *)(v35 + (unsigned __int16)a3);
      v37 = &a2[HIWORD(a3)];
      v38 = 4096 - HIWORD(a3);
LABEL_44:
      result = (uint64_t)memcpy(v36, v37, v38);
      *v23 = vadd_s32(*v23, (int32x2_t)(v39 | 0x100000000));
      return result;
    }
    goto LABEL_46;
  }
LABEL_47:
  __break(0x5512u);
  return result;
}

uint64_t sub_10000B0A0(uint64_t a1, _DWORD *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 48);
  if (a2)
    *a2 = *(_DWORD *)(a1 + 128);
  if (!*(_DWORD *)(a1 + 128))
    return 0;
  v3 = *(_QWORD *)(v2 + 1536);
  if (v3)
    return v3;
  else
    return -1;
}

uint64_t sub_10000B0D0(uint64_t a1)
{
  return *(unsigned int *)(a1 + 132);
}

tm *sub_10000B0D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  unint64_t v9;
  unsigned int v10;
  int v11;
  uint64_t v13;
  dispatch_queue_t *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  size_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  const char *boot_uuid;
  int v24;
  int v25;
  unsigned int v26;
  uint64_t v27;
  time_t v28;
  uint64_t v29;
  __int128 v30;
  tm *result;
  int tm_isdst;
  uint64_t v33;
  int v34;
  BOOL v35;
  int v36;
  uint64_t v37;
  unint64_t v38;
  char *v39;
  unint64_t v40;
  time_t v41;
  size_t v42;
  tm __b;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)a1);
  v4 = a1 + 48;
  v5 = *(unsigned int *)(a1 + 1128);
  if ((_DWORD)v5 != -1)
  {
    if (v5 >= 5)
      goto LABEL_54;
    if (__CFADD__(v4, 264 * v5))
      goto LABEL_53;
    v6 = *(unsigned int *)(v4 + 264 * v5 + 252);
    if (v6 + a2 <= (unint64_t)*(unsigned int *)(v4 + 264 * v5 + 248)
      && *(_DWORD *)(v4 + 264 * v5 + 256) < 0x64u)
    {
      v15 = *(unsigned int *)(a1 + 1128);
      if (!(_DWORD)v6)
        goto LABEL_36;
      return (tm *)v15;
    }
    sub_10000ED60(a1);
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)a1);
  v7 = (unint64_t *)(a1 + 1104);
  while (1)
  {
    do
    {
      while (1)
      {
LABEL_8:
        v8 = __ldaxr(v7);
        v9 = HIDWORD(v8);
        if ((_DWORD)v8)
        {
          v10 = (v8 - 1) & v8;
          goto LABEL_12;
        }
        if (v9)
          break;
        __clrex();
LABEL_24:
        v13 = *(_QWORD *)(a1 + 8);
        if (v13)
          v14 = (dispatch_queue_t *)(v13 + 16);
        else
          v14 = (dispatch_queue_t *)a1;
        dispatch_async_and_wait(*v14, &stru_100029B50);
      }
      v10 = 0;
      v9 |= 1uLL;
LABEL_12:
      ;
    }
    while (__stxr(v10 | (v9 << 32), v7));
    if (v10 != (_DWORD)v8)
      break;
    if (!v9)
      goto LABEL_24;
    do
    {
      if ((__ulock_wait(65538, a1 + 1108, v9, 0) & 0x80000000) == 0)
        goto LABEL_8;
      v11 = *__error();
    }
    while (v11 == 4);
    if (v11 > 0x3C || ((1 << v11) & 0x1000000000004001) == 0)
    {
      qword_10002DF48 = (uint64_t)"BUG IN LIBTRACE: ulock_wait() failed";
      qword_10002DF78 = v11;
      __break(1u);
      goto LABEL_53;
    }
  }
  v15 = __clz(__rbit32(v8));
  if ((_DWORD)v8)
    LODWORD(v5) = v15;
  else
    LODWORD(v5) = -1;
  if (v5 >= 5)
    goto LABEL_54;
  if (__CFADD__(v4, 264 * v5))
    goto LABEL_53;
  v16 = v4 + 264 * v5;
  v18 = *(_QWORD *)(v16 + 240);
  v17 = (_QWORD *)(v16 + 240);
  if (!v18)
  {
    v19 = *(unsigned int *)(v4 + 264 * v5 + 248);
    v20 = (void *)(*(_QWORD *)(a1 + 1112) + (v19 * v5));
    *v17 = v20;
    madvise(v20, v19, 8);
  }
  *(_DWORD *)(a1 + 1128) = v5;
  if (*(_DWORD *)(v4 + 264 * v5 + 252))
    return (tm *)v15;
LABEL_36:
  v21 = v4 + 264 * v5;
  v42 = 0xAAAAAAAAAAAAAAAALL;
  if (!*(_DWORD *)v21)
  {
    *(_QWORD *)v21 = 0x1100001000;
    *(_QWORD *)(v21 + 8) = 208;
    *(_DWORD *)(v21 + 52) = 1;
    mach_timebase_info((mach_timebase_info_t)(v21 + 16));
    *(_QWORD *)(v21 + 56) = 0x800006100;
    *(_QWORD *)(v21 + 72) = 0x3800006101;
    *(_QWORD *)(v21 + 136) = 0x1800006102;
    *(_QWORD *)(v21 + 168) = 0x3000006103;
    v42 = 4;
    sysctlbyname("hw.cputype", (void *)(v21 + 80), &v42, 0, 0);
    v42 = 4;
    sysctlbyname("hw.cpusubtype", (void *)(v21 + 84), &v42, 0, 0);
    v42 = 16;
    sysctlbyname("kern.osversion", (void *)(v21 + 88), &v42, 0, 0);
    v42 = 32;
    v22 = sysctlbyname("hw.model", (void *)(v21 + 104), &v42, 0, 0);
    boot_uuid = (const char *)_os_trace_get_boot_uuid(v22);
    uuid_parse(boot_uuid, (unsigned __int8 *)(v21 + 144));
    *(_DWORD *)(v21 + 160) = getpid();
  }
  v24 = *(_DWORD *)(a1 + 1244);
  v25 = *(_DWORD *)(v21 + 52);
  if ((v24 & 1) != 0)
  {
    v26 = v25 | 2;
    *(_DWORD *)(a1 + 1244) = v24 & 0xFFFFFFFE;
  }
  else
  {
    v26 = v25 & 0xFFFFFFFD;
  }
  *(_DWORD *)(v21 + 52) = v26;
  v27 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(v21 + 64) = *(_QWORD *)(a1 + 24);
  v28 = *(_QWORD *)(a1 + 32);
  v29 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(v21 + 24) = v27;
  *(_QWORD *)(v21 + 32) = v28;
  *(_DWORD *)(v21 + 40) = (int)v29 / 1000;
  v41 = v28;
  __b.tm_zone = (char *)0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v30 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v30 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&__b.tm_mon = v30;
  *(_OWORD *)&__b.tm_isdst = v30;
  *(_OWORD *)&__b.tm_sec = v30;
  result = localtime_r(&v41, &__b);
  tm_isdst = __b.tm_isdst;
  *(_DWORD *)(v21 + 48) = __b.tm_isdst;
  if (__OFSUB__(0, __b.tm_gmtoff))
  {
    __break(0x550Du);
    goto LABEL_56;
  }
  v33 = 60 * tm_isdst;
  if (v33 != (int)v33)
  {
LABEL_56:
    __break(0x550Cu);
    goto LABEL_57;
  }
  v34 = -LODWORD(__b.tm_gmtoff) / 60;
  v35 = __OFADD__(v34, (_DWORD)v33);
  v36 = v34 + v33;
  if (!v35)
  {
    *(_DWORD *)(v21 + 44) = v36;
    *(_OWORD *)(v21 + 176) = 0u;
    v37 = v21 + 176;
    *(_OWORD *)(v37 + 16) = 0u;
    *(_OWORD *)(v37 + 32) = 0u;
    memset(&__b, 170, 0x400uLL);
    v38 = readlink("/private/var/db/timezone/localtime", (char *)&__b, 0x3FFuLL);
    if ((v38 & 0x8000000000000000) != 0)
      return (tm *)v15;
    if (v38 < 0x400)
    {
      if (v38 <= ~(unint64_t)&__b)
      {
        *((_BYTE *)&__b.tm_sec + v38) = 0;
        v39 = strstr((char *)&__b, "/private/var/db/timezone/zoneinfo/zoneinfo/");
        v40 = 43;
        if (!v39)
          v40 = 0;
        if (v40 <= ~(unint64_t)&__b)
        {
          strlcpy((char *)v37, (const char *)&__b + v40, 0x30uLL);
          return (tm *)v15;
        }
      }
LABEL_53:
      __break(0x5513u);
    }
LABEL_54:
    __break(0x5512u);
  }
LABEL_57:
  __break(0x5500u);
  return result;
}

void sub_10000B590(_QWORD *a1, uint64_t a2)
{
  unint64_t v4;
  __int16 v5;
  unint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  unsigned int v12;
  void **v13;
  _QWORD *v14;
  void **v15;
  unsigned int *v16;
  _QWORD *v17;
  void **v18;
  unsigned int *v19;
  size_t v20;
  uint64_t v21;
  uint64_t v22;
  void **v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void **v27;
  void **v28;

  v4 = sub_10000B8D4(*(_QWORD **)(a1[4] + 16), (_QWORD *)(a2 + 24));
  if (v4 >= 0x10000)
  {
    v21 = _os_assert_log(0);
    _os_crash(v21);
    __break(1u);
    goto LABEL_10;
  }
  v5 = v4;
  if (!uuid_is_null((const unsigned __int8 *)(a2 + 40)))
  {
    v6 = sub_10000B8D4(*(_QWORD **)(a1[4] + 16), (_QWORD *)(a2 + 40));
    if (v6 < 0x10000)
      goto LABEL_5;
LABEL_10:
    v22 = _os_assert_log(0);
    _os_crash(v22);
    __break(1u);
  }
  LOWORD(v6) = -1;
LABEL_5:
  v7 = (uint64_t *)a1[5];
  v8 = *v7;
  v9 = *(_QWORD *)(a2 + 8);
  v10 = *(_DWORD *)(a2 + 4);
  v11 = *(_DWORD *)(a2 + 16);
  v12 = *(_DWORD *)(a2 + 20);
  *(_DWORD *)v8 = *(_DWORD *)a2;
  *(_WORD *)(v8 + 4) = v5;
  *(_WORD *)(v8 + 6) = v6;
  *(_QWORD *)(v8 + 8) = v9;
  *(_DWORD *)(v8 + 16) = v11;
  *(_DWORD *)(v8 + 20) = v10;
  *(_QWORD *)(v8 + 24) = v12;
  *v7 = v8 + 32;
  v13 = (void **)a1[5];
  v14 = *v13;
  if (a1[6] - (_QWORD)*v13 > 7uLL)
  {
    v15 = (void **)a1[4];
    *v14 = *(unsigned int *)(*(_QWORD *)(a2 + 56) + 4);
    *v13 = v14 + 1;
    v16 = *(unsigned int **)(a2 + 56);
    v23 = _NSConcreteStackBlock;
    v24 = 0x40000000;
    v25 = sub_10000E004;
    v26 = &unk_10002A620;
    v27 = v15;
    v28 = v13;
    sub_10000B778(v16, (uint64_t)&v23);
    v13 = (void **)a1[5];
    v17 = *v13;
    if (a1[6] - (_QWORD)*v13 >= 8uLL)
    {
      v18 = (void **)a1[4];
      *v17 = *(unsigned int *)(*(_QWORD *)(a2 + 64) + 4);
      *v13 = v17 + 1;
      v19 = *(unsigned int **)(a2 + 64);
      v23 = _NSConcreteStackBlock;
      v24 = 0x40000000;
      v25 = sub_10000B818;
      v26 = &unk_10002A640;
      v27 = v13;
      v28 = v18;
      sub_10000B778(v19, (uint64_t)&v23);
      v13 = (void **)a1[5];
    }
  }
  v20 = (((unint64_t)*v13 + 7) & 0xFFFFFFFFFFFFFFF8) - (_QWORD)*v13;
  bzero(*v13, v20);
  *(_QWORD *)a1[5] += v20;
}

unsigned int *sub_10000B778(unsigned int *result, uint64_t a2)
{
  unsigned int *v2;
  unint64_t v3;
  unint64_t i;
  _QWORD *v6;
  int v7;
  _QWORD *v8;
  _QWORD *v9;

  if (*((_QWORD *)result + 2))
  {
    v2 = result;
    v3 = *result;
    if ((_DWORD)v3)
    {
      for (i = 0; i < v3; ++i)
      {
        v6 = *(_QWORD **)(*((_QWORD *)v2 + 2) + 8 * i);
        if (v6)
        {
          do
          {
            v7 = *((unsigned __int8 *)v2 + 8);
            if (v7 == 1)
              v8 = v6 + 1;
            else
              v8 = 0;
            if (v7 == 2)
              v9 = v6 + 1;
            else
              v9 = v8;
            result = (unsigned int *)(*(uint64_t (**)(uint64_t, _QWORD *, _QWORD))(a2 + 16))(a2, v9, v6[2]);
            v6 = (_QWORD *)*v6;
          }
          while (v6);
          v3 = *v2;
        }
      }
    }
  }
  return result;
}

uint64_t sub_10000B800(uint64_t result, _WORD *a2)
{
  _WORD **v2;
  _WORD *v3;

  v2 = *(_WORD ***)(result + 32);
  v3 = *v2;
  *v3 = *a2;
  *v2 = v3 + 1;
  return result;
}

_QWORD *sub_10000B818(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _WORD *v5;
  char *v6;
  _QWORD *v7;
  __int16 v8;
  _QWORD *result;
  __int16 v10;

  v5 = **(_WORD ***)(a1 + 32);
  *v5 = *(_WORD *)a3;
  v6 = *(char **)(a3 + 8);
  if (!v6 || !*(_QWORD *)(a3 + 16))
  {
    _os_assumes_log(0);
    v6 = *(char **)(a3 + 8);
  }
  v7 = sub_10000C688(*(_QWORD **)(*(_QWORD *)(a1 + 40) + 24), v6);
  v8 = (__int16)v7;
  if ((unint64_t)v7 >= 0x10000)
    _os_assumes_log(0);
  v5[1] = v8;
  result = sub_10000C688(*(_QWORD **)(*(_QWORD *)(a1 + 40) + 24), *(char **)(a3 + 16));
  v10 = (__int16)result;
  if ((unint64_t)result >= 0x10000)
    result = (_QWORD *)_os_assumes_log(0);
  v5[2] = v10;
  **(_QWORD **)(a1 + 32) += 6;
  return result;
}

uint64_t sub_10000B8D4(_QWORD *a1, _QWORD *a2)
{
  int8x8_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint8x8_t v7;
  unint64_t v8;
  _QWORD *v9;
  _QWORD *i;
  unint64_t v11;

  v2 = (int8x8_t)a1[1];
  if (v2)
  {
    v3 = a2[1];
    v4 = __ROR8__(v3 + 16, 16);
    v5 = 0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (*a2 ^ v4)) >> 47) ^ (0x9DDFEA08EB382D69 * (*a2 ^ v4)));
    v6 = (0x9DDFEA08EB382D69 * (v5 ^ (v5 >> 47))) ^ v3;
    v7 = (uint8x8_t)vcnt_s8(v2);
    v7.i16[0] = vaddlv_u8(v7);
    if (v7.u32[0] > 1uLL)
    {
      v8 = v6;
      if (v6 >= *(_QWORD *)&v2)
        v8 = v6 % *(_QWORD *)&v2;
    }
    else
    {
      v8 = v6 & (*(_QWORD *)&v2 - 1);
    }
    v9 = *(_QWORD **)(*a1 + 8 * v8);
    if (v9)
    {
      for (i = (_QWORD *)*v9; i; i = (_QWORD *)*i)
      {
        v11 = i[1];
        if (v6 == v11)
        {
          if (i[2] == *a2 && i[3] == v3)
            return i[4];
        }
        else
        {
          if (v7.u32[0] > 1uLL)
          {
            if (v11 >= *(_QWORD *)&v2)
              v11 %= *(_QWORD *)&v2;
          }
          else
          {
            v11 &= *(_QWORD *)&v2 - 1;
          }
          if (v11 != v8)
            return 0;
        }
      }
    }
  }
  return 0;
}

uint64_t sub_10000B9C8(uint64_t result, _WORD *a2)
{
  _WORD **v2;
  _WORD *v3;

  v2 = *(_WORD ***)(result + 32);
  v3 = *v2;
  *v3 = *a2;
  *v2 = v3 + 1;
  return result;
}

uint64_t sub_10000B9E0(uint64_t a1, uint64_t a2)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t *v14;
  unsigned __int8 *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v19;
  uint64_t v20;
  __int16 v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  int v28;
  unint64_t v29;
  unsigned int v30;
  unsigned __int16 *v31;
  unint64_t v32;
  uint64_t v33;
  __int16 v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  os_unfair_lock_s *lock;
  uint64_t v39;
  uint64_t v40;
  unsigned __int16 v41;
  _OWORD v42[4];
  uint64_t v43;

  switch(*(_DWORD *)a2)
  {
    case 0x6001:
      v5 = sub_10000D3D4(*(_QWORD **)(*(_QWORD *)(a1 + 32) + 224), *(_QWORD *)(a2 + 16), *(_DWORD *)(a2 + 24));
      if (!v5)
      {
        v36 = _os_assert_log(0);
        _os_crash(v36);
        __break(1u);
        goto LABEL_76;
      }
      v6 = (uint64_t)v5;
      v7 = *(_QWORD *)(a1 + 40);
      v40 = 0;
      v8 = sub_10000D264((uint64_t)v5);
      v39 = sub_10000D970(v6, &v40);
      v43 = 0;
      memset(v42, 0, sizeof(v42));
      LODWORD(v42[1]) = sub_10000B0D0(v6);
      DWORD1(v42[1]) = sub_10000D984(v6);
      *((_QWORD *)&v42[0] + 1) = sub_10000B0A0(v6, (_DWORD *)v42 + 1);
      if (*(_BYTE *)(v8 + 136) == 4)
        WORD1(v42[0]) |= 1u;
      v9 = *(_OWORD *)(v8 + 48);
      *(_OWORD *)((char *)&v42[1] + 8) = *(_OWORD *)(v8 + 32);
      *(_OWORD *)((char *)&v42[2] + 8) = v9;
      v10 = sub_10000D26C(v7, (uint64_t)v42);
      sub_10000D8F8(v7, v10);
      v11 = (uint64_t *)(a2 + 48);
      v12 = *(unsigned __int16 *)(a2 + 32);
      v13 = a2 + 48;
      if (v12 > 0x1000)
        goto LABEL_10;
      if (__CFADD__(a2 + 32, v12))
LABEL_76:
        __break(0x5513u);
      v13 = a2 + 32 + v12;
LABEL_10:
      v37 = v8 + 16;
      lock = (os_unfair_lock_s *)(v8 + 132);
      while (1)
      {
        v14 = v11 + 3;
        if ((unint64_t)(v11 + 3) >= v13)
          return 1;
        v15 = (unsigned __int8 *)v11;
        v16 = v11[2];
        v17 = HIWORD(v16);
        if (!HIWORD(v16) || (uint64_t)v17 > (uint64_t)(v13 - (_QWORD)v14))
          return 1;
        v19 = v17 + 24;
        if ((v16 & 0x7000000000000) != 0)
          v19 = (HIWORD(v16) & 0xFFF8) + 32;
        if (__CFADD__(v11, v19))
          goto LABEL_76;
        v11 = (uint64_t *)((char *)v11 + v19);
        v20 = *(_QWORD *)v15;
        if (*(_QWORD *)v15)
        {
          v21 = WORD1(*(_QWORD *)v15);
          v22 = *(_QWORD *)v15;
          if ((v22 - 3) >= 2 && v22 != 6)
          {
            if (v22 != 2)
              goto LABEL_74;
            v23 = BYTE1(v20);
            if ((v23 - 1) > 1)
              goto LABEL_74;
            if ((v21 & 1) != 0)
            {
              if (!(v16 >> 51))
                goto LABEL_74;
              v24 = 8;
              if ((v21 & 0x10) != 0)
                goto LABEL_62;
LABEL_27:
              if ((*(_QWORD *)v15 & 0x2000000) != 0)
              {
LABEL_65:
                if (v24 + 8 > v17)
                  goto LABEL_74;
                if (__CFADD__(v14, v24))
                  goto LABEL_76;
                v24 += 8;
              }
            }
            else
            {
              v24 = 0;
              if ((v21 & 0x10) == 0)
                goto LABEL_27;
LABEL_62:
              if (v24 + 8 > v17)
                goto LABEL_74;
              if (__CFADD__(v14, v24))
                goto LABEL_76;
              v24 += 8;
              if ((*(_QWORD *)v15 & 0x2000000) != 0)
                goto LABEL_65;
            }
            if (v23 == 1 && v24 + 8 <= v17)
            {
              LOWORD(v42[0]) = v24 + 8;
              if (__CFADD__(v14, v24))
                goto LABEL_76;
              sub_10000BF54(v6, v15, v8, v7, v10, v42);
            }
            goto LABEL_74;
          }
          v41 = 0;
          if ((v20 & 0x10000) != 0)
          {
            if (!(v16 >> 51))
              goto LABEL_74;
            v41 = 8;
            v25 = 8;
            if ((v21 & 0x10) != 0)
            {
LABEL_34:
              if (v25 + 8 > v17)
                goto LABEL_74;
              v41 = v25 + 8;
              v26 = __CFADD__(v14, v25);
              v25 += 8;
              if (v26)
                goto LABEL_76;
            }
          }
          else
          {
            v25 = 0;
            if ((v21 & 0x10) != 0)
              goto LABEL_34;
          }
          if ((v21 & 0x100) != 0)
          {
            if (v25 + 4 > v17)
              goto LABEL_74;
            v41 = v25 + 4;
            if (__CFADD__(v14, v25))
              goto LABEL_76;
          }
          sub_10000BF54(v6, v15, v8, v7, v10, &v41);
          if (*v15 != 3
            && (*((_WORD *)v15 + 1) & 0x200) != 0
            && (unint64_t)v41 + 2 <= *((unsigned __int16 *)v15 + 11))
          {
            if (__CFADD__(v14, v41))
              goto LABEL_76;
            v27 = v8;
            v28 = *(unsigned __int16 *)((char *)v14 + v41);
            LOWORD(v29) = *(_WORD *)(v39 + 2);
            v30 = *(unsigned __int16 *)(v39 + 4);
            if (v30 >= 0x5C8)
              v30 = 1480;
            do
            {
              if (v30 <= (unsigned __int16)v29 || (unsigned __int16)v29 > 0x5C4u)
                break;
              if (~(v39 + 568) < (unint64_t)(unsigned __int16)v29)
                goto LABEL_76;
              v31 = (unsigned __int16 *)(v39 + (unsigned __int16)v29 + 568);
              v32 = *(unsigned __int8 *)(v39 + (unsigned __int16)v29 + 570)
                  + (unint64_t)*(unsigned __int8 *)(v39 + (unsigned __int16)v29 + 571)
                  + 4;
              if (1480 - (unint64_t)(unsigned __int16)v29 < v32)
                break;
              if (*v31 == v28)
              {
LABEL_59:
                v35 = (char *)(v31 + 1);
                sub_10000CA8C(v7, v10, v28, v35);
                sub_10000C62C(v7, v35);
                goto LABEL_73;
              }
              v29 = v32 + (unsigned __int16)v29 + (v32 & 1);
            }
            while (v29 < 0x10000);
            os_unfair_lock_lock_with_options(lock, 0x10000);
            v33 = v37;
            while (1)
            {
              v33 = *(_QWORD *)v33;
              if (!v33)
                break;
              if (*(unsigned __int16 *)(v33 + 8) == v28)
              {
LABEL_58:
                os_unfair_lock_unlock(lock);
                v34 = *(_WORD *)(v33 + 8);
                v31 = (unsigned __int16 *)(v33 + 8);
                LOWORD(v28) = v34;
                goto LABEL_59;
              }
            }
            os_unfair_lock_unlock(lock);
            *(_QWORD *)&v42[0] = _NSConcreteStackBlock;
            *((_QWORD *)&v42[0] + 1) = 0x40000000;
            *(_QWORD *)&v42[1] = sub_10000F980;
            *((_QWORD *)&v42[1] + 1) = &unk_1000292B8;
            *(_QWORD *)&v42[2] = v6;
            sub_10000F8D0(v6, 0, (uint64_t)&stru_100029298, (uint64_t)v42);
            os_unfair_lock_lock_with_options(lock, 0x10000);
            v33 = v37;
            while (1)
            {
              v33 = *(_QWORD *)v33;
              if (!v33)
                break;
              if (*(unsigned __int16 *)(v33 + 8) == v28)
                goto LABEL_58;
            }
            os_unfair_lock_unlock(lock);
LABEL_73:
            v8 = v27;
          }
LABEL_74:
          sub_10000BEFC(v7, (*((_QWORD *)v15 + 2) & 0xFFFFFFFFFFFFLL) + *(_QWORD *)(a2 + 40));
        }
      }
    case 0x6002:
    case 0x6003:
    case 0x6004:
      sub_10000BEFC(*(_QWORD *)(a1 + 40), *(_QWORD *)(a2 + 32));
      return 1;
    default:
      return 1;
  }
}

_QWORD *sub_10000BEFC(uint64_t a1, unint64_t a2)
{
  _QWORD *result;

  if (*(_QWORD *)(a1 + 80))
    result = **(_QWORD ***)(*(_QWORD *)(a1 + 72) + 8);
  else
    result = sub_10000CB1C(a1);
  if (result[2] > a2)
    result[2] = a2;
  if (result[3] < a2)
    result[3] = a2;
  return result;
}

void sub_10000BF54(uint64_t a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, _WORD *a6)
{
  unsigned int v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unsigned __int8 *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  __int16 v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  __int128 v26;
  const __CFData *v27;
  const __CFData *v28;
  const unsigned __int8 *BytePtr;
  CFArrayRef v30;
  CFArrayRef v31;
  const __CFDictionary *v32;
  const __CFDictionary *Value;
  CFTypeID v34;
  CFTypeID v35;
  CFTypeID TypeID;
  const __CFData *v37;
  const __CFData *v38;
  const unsigned __int8 *v39;
  const char *v40;
  __int128 v41;
  __int128 v42;
  CFTypeRef v43;
  const __CFNumber *v44;
  const __CFDictionary *cf;
  CFTypeRef cfa;
  const __CFDictionary *v47;
  unint64_t v48;
  unint64_t valuePtr;
  void *values;
  _OWORD __b[64];
  uuid_string_t out;

  v11 = *(unsigned __int8 *)(a3 + 136);
  switch(*((_WORD *)a2 + 1) & 0xE)
  {
    case 2:
    case 4:
    case 6:
      v11 = 4;
      break;
    case 8:
      break;
    case 0xA:
      v11 = 20;
      break;
    case 0xC:
      v11 = 6;
      break;
    default:
      v11 = 0;
      break;
  }
  v12 = (unsigned __int16)*a6;
  v13 = v12 + v11;
  v14 = *((_QWORD *)a2 + 2);
  if (v13 > HIWORD(v14))
  {
    *a6 = HIWORD(v14);
    goto LABEL_68;
  }
  *a6 = v13;
  v15 = ~(unint64_t)(a2 + 24);
  if (v15 < v12)
    goto LABEL_74;
  if (!v11)
  {
LABEL_68:
    memset(&__b[2], 170, 0x3E0uLL);
    strcpy((char *)__b, "#DECODE failed to read location");
    goto LABEL_69;
  }
  v16 = &a2[v12 + 24];
  if (v11 == 6)
  {
    v17 = 0;
    v18 = *((unsigned __int16 *)v16 + 2);
  }
  else
  {
    v18 = 0;
    if (v11 == 4)
      v17 = 0;
    else
      v17 = (uint64_t *)(v16 + 4);
  }
  v19 = *(unsigned int *)v16;
  v20 = *((_WORD *)a2 + 1);
  if ((v20 & 0x20) != 0)
  {
    v21 = *((_QWORD *)a2 + 2);
    if ((unint64_t)(unsigned __int16)v13 + 2 > HIWORD(v21))
    {
      *a6 = HIWORD(v21);
      return;
    }
    *a6 = v13 + 2;
    if ((unsigned __int16)v13 <= v15)
    {
      v20 = *((_WORD *)a2 + 1);
      goto LABEL_18;
    }
LABEL_74:
    __break(0x5513u);
  }
LABEL_18:
  if ((v20 & 0xE) == 8)
  {
    v24 = v19 | (v18 << 32);
    v25 = sub_10000DF38(a3, v24);
    if (v25)
    {
LABEL_64:
      sub_10000DE3C(a4, a5, v25);
      os_unfair_lock_unlock((os_unfair_lock_t)(a3 + 132));
      return;
    }
    if (sub_10000B0A0(a1, 0))
    {
      *(_QWORD *)&__b[0] = _NSConcreteStackBlock;
      *((_QWORD *)&__b[0] + 1) = 0x40000000;
      *(_QWORD *)&__b[1] = sub_10000F980;
      *((_QWORD *)&__b[1] + 1) = &unk_1000292B8;
      *(_QWORD *)&__b[2] = a1;
      sub_10000F8D0(a1, 0, (uint64_t)&stru_100029298, (uint64_t)__b);
LABEL_63:
      v25 = sub_10000DF38(a3, v24);
      if (v25)
        goto LABEL_64;
      if (!*(_WORD *)(a3 + 130))
        return;
      *(_QWORD *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
      *(_QWORD *)&v42 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v42 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)out = v42;
      *(_OWORD *)&out[16] = v42;
      LODWORD(values) = -1431655766;
      uuid_unparse((const unsigned __int8 *)(a3 + 32), out);
      sub_10000B0A0(a1, &values);
      memset(__b, 170, sizeof(__b));
      snprintf((char *)__b, 0x400uLL, "#DECODE failed to resolve UUID: [pc:0x%llx ns:0x%02x type:0x%02x flags:0x%04x main:%s pid:%d]", v24, *a2, a2[1], *((unsigned __int16 *)a2 + 1), out, (_DWORD)values);
LABEL_69:
      sub_100013FF0((uint64_t)__b);
      return;
    }
    *(_QWORD *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v26 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v26 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)out = v26;
    *(_OWORD *)&out[16] = v26;
    valuePtr = 0xAAAAAAAAAAAAAAAALL;
    values = 0;
    v48 = 0xAAAAAAAAAAAAAAAALL;
    v27 = (const __CFData *)OSKextCopyUUIDForAddress(v24 | 0xFFFF000000000000);
    v28 = v27;
    if (v27)
    {
      BytePtr = CFDataGetBytePtr(v27);
      uuid_unparse(BytePtr, out);
      values = (void *)CFStringCreateWithCString(kCFAllocatorDefault, out, 0x8000100u);
      if (values)
        v30 = CFArrayCreate(kCFAllocatorDefault, (const void **)&values, 1, &kCFTypeArrayCallBacks);
      else
        v30 = 0;
      v31 = CFArrayCreate(kCFAllocatorDefault, (const void **)off_10002C350, 3, &kCFTypeArrayCallBacks);
      if (values && v30)
      {
        v32 = (const __CFDictionary *)OSKextCopyLoadedKextInfoByUUID(v30, v31);
        if (v32)
        {
          v47 = v32;
          Value = (const __CFDictionary *)CFDictionaryGetValue(v32, values);
          if (Value && (cf = Value, v34 = CFDictionaryGetTypeID(), v34 == CFGetTypeID(cf)))
          {
            v43 = CFDictionaryGetValue(cf, CFSTR("OSBundleExecLoadAddress"));
            if (v43
              && (v35 = CFNumberGetTypeID(), v35 == CFGetTypeID(v43))
              && CFNumberGetValue((CFNumberRef)v43, kCFNumberSInt64Type, &valuePtr))
            {
              v44 = (const __CFNumber *)CFDictionaryGetValue(cf, CFSTR("OSBundleExecLoadSize"));
              if (v44)
              {
                TypeID = CFNumberGetTypeID();
                if (TypeID == CFGetTypeID(v44))
                {
                  if (CFNumberGetValue(v44, kCFNumberSInt64Type, &v48))
                  {
                    v37 = (const __CFData *)CFDictionaryGetValue(cf, CFSTR("OSBundleTextUUID"));
                    if (v37
                      && (v38 = v37, cfa = (CFTypeRef)CFDataGetTypeID(), cfa == (CFTypeRef)CFGetTypeID(v38))
                      && CFDataGetLength(v38) == 16)
                    {
                      *(_QWORD *)&__b[1] = 0xAAAAAAAAAAAAAAAALL;
                      *((_QWORD *)&__b[1] + 1) = 0xAAAAAAAAAAAAAAAALL;
                      *(_QWORD *)&__b[0] = v48;
                      HIWORD(__b[0]) = -21846;
                      DWORD2(__b[0]) = valuePtr;
                      WORD6(__b[0]) = WORD2(valuePtr);
                      v39 = CFDataGetBytePtr(v38);
                      uuid_copy((unsigned __int8 *)__b + 14, v39);
                      sub_10000EBAC(a3, (uint64_t)__b);
                    }
                    else
                    {
                      memset((char *)&__b[3] + 4, 170, 0x3CCuLL);
                      strcpy((char *)__b, "kext query: failed to retrieve kOSBundleTextUUIDKey");
                      sub_100013FF0((uint64_t)__b);
                    }
                    goto LABEL_54;
                  }
                }
              }
              memset((char *)&__b[2] + 9, 170, 0x3D7uLL);
              v40 = "kext query: failed to retrieve load_size";
            }
            else
            {
              memset((char *)&__b[2] + 9, 170, 0x3D7uLL);
              v40 = "kext query: failed to retrieve load_addr";
            }
            v41 = *((_OWORD *)v40 + 1);
            __b[0] = *(_OWORD *)v40;
            __b[1] = v41;
            *(_OWORD *)((char *)&__b[1] + 9) = *(_OWORD *)(v40 + 25);
          }
          else
          {
            memset((char *)&__b[2] + 6, 170, 0x3DAuLL);
            strcpy((char *)__b, "kext query: failed to retrieve bundle");
          }
          sub_100013FF0((uint64_t)__b);
LABEL_54:
          CFRelease(v47);
          goto LABEL_55;
        }
        memset((char *)&__b[1] + 10, 170, 0x3E6uLL);
        strcpy((char *)__b, "kext query: kext_dict nil");
      }
      else
      {
        memset((char *)&__b[1] + 14, 170, 0x3E2uLL);
        strcpy((char *)__b, "kext query: allocation failed");
      }
      sub_100013FF0((uint64_t)__b);
    }
    else
    {
      memset((char *)&__b[2] + 2, 170, 0x3DEuLL);
      strcpy((char *)__b, "kext query: did not find the uuid");
      sub_100013FF0((uint64_t)__b);
      v31 = 0;
      v30 = 0;
    }
LABEL_55:
    if (values)
      CFRelease(values);
    if (v30)
      CFRelease(v30);
    if (v31)
      CFRelease(v31);
    if (v28)
      CFRelease(v28);
    goto LABEL_63;
  }
  if ((v20 & 0xE) == 0xA)
  {
    v22 = *(_QWORD *)(a4 + 16);
    if (v22)
      v23 = *(_QWORD *)(v22 + 24);
    else
      v23 = 0;
    sub_10000D4DC((float *)v22, v17, v23);
  }
}

uint64_t sub_10000C62C(uint64_t a1, char *a2)
{
  unsigned __int8 *v4;
  __int16 v5;
  __int16 v6;

  v4 = (unsigned __int8 *)(a2 + 2);
  v5 = (unsigned __int16)sub_10000C688(*(_QWORD **)(a1 + 24), a2 + 2);
  sub_10000C824(a1, v5);
  v6 = (unsigned __int16)sub_10000C688(*(_QWORD **)(a1 + 24), (char *)&v4[*a2]);
  return sub_10000C824(a1, v6);
}

_QWORD *sub_10000C688(_QWORD *result, char *a2)
{
  _QWORD *v2;
  unsigned __int8 *v3;
  unsigned __int8 *v4;
  void *__p[2];
  char v6;

  if (result)
  {
    v2 = result;
    sub_100020730(__p, a2);
    v3 = sub_10000C718(v2, (uint64_t)__p);
    v4 = v3;
    if (v6 < 0)
    {
      operator delete(__p[0]);
      if (v4)
        return (_QWORD *)*((_QWORD *)v4 + 5);
    }
    else if (v3)
    {
      return (_QWORD *)*((_QWORD *)v4 + 5);
    }
    return 0;
  }
  return result;
}

unsigned __int8 *sub_10000C718(_QWORD *a1, uint64_t a2)
{
  int v4;
  uint64_t *v5;
  unint64_t v6;
  unint64_t v7;
  int8x8_t v8;
  unint64_t v9;
  uint8x8_t v10;
  unint64_t v11;
  unint64_t v12;
  unsigned __int8 **v13;
  unsigned __int8 *i;
  unint64_t v15;

  v4 = *(char *)(a2 + 23);
  if (v4 >= 0)
    v5 = (uint64_t *)a2;
  else
    v5 = *(uint64_t **)a2;
  if (v4 >= 0)
    v6 = *(unsigned __int8 *)(a2 + 23);
  else
    v6 = *(_QWORD *)(a2 + 8);
  v7 = sub_1000207DC(v5, v6);
  v8 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v8)
    return 0;
  v9 = v7;
  v10 = (uint8x8_t)vcnt_s8(v8);
  v10.i16[0] = vaddlv_u8(v10);
  v11 = v10.u32[0];
  if (v10.u32[0] > 1uLL)
  {
    v12 = v7;
    if (v7 >= *(_QWORD *)&v8)
      v12 = v7 % *(_QWORD *)&v8;
  }
  else
  {
    v12 = (*(_QWORD *)&v8 - 1) & v7;
  }
  v13 = *(unsigned __int8 ***)(*a1 + 8 * v12);
  if (!v13)
    return 0;
  for (i = *v13; i; i = *(unsigned __int8 **)i)
  {
    v15 = *((_QWORD *)i + 1);
    if (v9 == v15)
    {
      if (sub_100020C10(i + 16, (unsigned __int8 *)a2))
        return i;
    }
    else
    {
      if (v11 > 1)
      {
        if (v15 >= *(_QWORD *)&v8)
          v15 %= *(_QWORD *)&v8;
      }
      else
      {
        v15 &= *(_QWORD *)&v8 - 1;
      }
      if (v15 != v12)
        return 0;
    }
  }
  return i;
}

uint64_t sub_10000C824(uint64_t a1, __int16 a2)
{
  _QWORD *v2;
  uint64_t v4;

  LOWORD(v4) = a2;
  if (*(_QWORD *)(a1 + 80))
    v2 = **(_QWORD ***)(*(_QWORD *)(a1 + 72) + 8);
  else
    v2 = sub_10000CB1C(a1);
  return sub_10000C928((unsigned int *)v2[5], &v4, 0);
}

uint64_t sub_10000C898(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  unsigned int (*v5)(_QWORD, uint64_t);

  if (*(_QWORD *)(a1 + 16))
  {
    v4 = (_QWORD *)(*(_QWORD *)(a1 + 16) + 8 * (qword_10002A6A0[*(unsigned __int8 *)(a1 + 8)](a2) % *(_DWORD *)a1));
    v5 = (unsigned int (*)(_QWORD, uint64_t))qword_10002A6B8[*(unsigned __int8 *)(a1 + 8)];
    while (1)
    {
      v4 = (_QWORD *)*v4;
      if (!v4)
        break;
      if (v5(v4[1], a2))
        return v4[2];
    }
  }
  return 0;
}

uint64_t sub_10000C928(unsigned int *a1, _QWORD *a2, uint64_t a3)
{
  unsigned int v6;
  unsigned int v7;
  _QWORD *v8;
  uint64_t (*v9)(_QWORD, _QWORD *);
  unsigned int v11;
  unsigned int v12;
  int v13;
  _QWORD *v14;
  uint64_t v15;

  v6 = ((unsigned int (**)(_QWORD *))qword_10002A6A0)[*((unsigned __int8 *)a1 + 8)](a2);
  v7 = *a1;
  if (!*((_QWORD *)a1 + 2))
  {
    v11 = *a1;
LABEL_9:
    *((_QWORD *)a1 + 2) = _os_trace_calloc(v11, 8);
    goto LABEL_10;
  }
  v8 = (_QWORD *)(*((_QWORD *)a1 + 2)
                + 8
                * (((unsigned int (**)(_QWORD *))qword_10002A6A0)[*((unsigned __int8 *)a1 + 8)](a2) % *a1));
  v9 = (uint64_t (*)(_QWORD, _QWORD *))qword_10002A6B8[*((unsigned __int8 *)a1 + 8)];
  while (1)
  {
    v8 = (_QWORD *)*v8;
    if (!v8)
      break;
    if ((v9(v8[1], a2) & 1) != 0)
      return 0;
  }
  if (!*((_QWORD *)a1 + 2))
  {
    v11 = *a1;
    goto LABEL_9;
  }
LABEL_10:
  v12 = v6 % v7;
  v13 = *((unsigned __int8 *)a1 + 8);
  v14 = (_QWORD *)_os_trace_calloc(1, 24);
  *v14 = 0;
  v14[2] = a3;
  if (v13 == 2)
  {
    v14[1] = *a2;
  }
  else if (v13 == 1)
  {
    *((_WORD *)v14 + 4) = *(_WORD *)a2;
  }
  else
  {
    free(v14);
    v14 = 0;
  }
  v15 = *((_QWORD *)a1 + 2);
  *v14 = *(_QWORD *)(v15 + 8 * v12);
  *(_QWORD *)(v15 + 8 * v12) = v14;
  ++a1[1];
  return 1;
}

uint64_t sub_10000CA74(unsigned __int16 *a1)
{
  return *a1;
}

BOOL sub_10000CA7C(unsigned __int16 a1, unsigned __int16 *a2)
{
  return *a2 == a1;
}

uint64_t sub_10000CA8C(uint64_t a1, uint64_t a2, __int16 a3, char *a4)
{
  uint64_t result;
  __int16 v8;

  v8 = a3;
  result = sub_10000C898(*(_QWORD *)(a2 + 64), (uint64_t)&v8);
  if (!result)
    return sub_10000CBDC(a1, a2, v8, a4 + 2, &a4[*a4 + 2]);
  return result;
}

_QWORD *sub_10000CB1C(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;

  v2 = (_QWORD *)_os_trace_calloc(1, 56);
  v2[2] = -1;
  v3 = _os_trace_calloc(1, 24);
  *(_QWORD *)v3 = 16;
  *(_BYTE *)(v3 + 8) = 1;
  *(_QWORD *)(v3 + 16) = _os_trace_calloc(16, 8);
  v2[6] = v3;
  v4 = _os_trace_calloc(1, 24);
  *(_QWORD *)v4 = 16;
  *(_BYTE *)(v4 + 8) = 1;
  *(_QWORD *)(v4 + 16) = _os_trace_calloc(16, 8);
  v2[5] = v4;
  v5 = *(_QWORD **)(a1 + 72);
  v6 = *(_QWORD *)(a1 + 80);
  *v2 = 0;
  v2[1] = v5;
  *v5 = v2;
  *(_QWORD *)(a1 + 72) = v2;
  *(_QWORD *)(a1 + 80) = v6 + 1;
  return v2;
}

uint64_t sub_10000CBDC(uint64_t a1, uint64_t a2, __int16 a3, char *a4, char *a5)
{
  uint64_t v10;
  _QWORD *v11;
  size_t v12;
  _QWORD *v13;
  _QWORD *v14;
  size_t v15;
  _QWORD *v16;
  uint64_t result;
  uint64_t v18;

  LOWORD(v18) = a3;
  v10 = _os_trace_calloc(1, 24);
  *(_WORD *)v10 = a3;
  v11 = sub_10000CD1C(*(_QWORD **)(a1 + 24), a4);
  *(_QWORD *)(v10 + 8) = v11;
  if (!v11)
  {
    sub_10000CDB8((uint64_t **)(a1 + 24), a4, *(_QWORD *)(a1 + 32));
    v12 = strlen(a4);
    v13 = *(_QWORD **)(a1 + 24);
    *(_QWORD *)(a1 + 32) += v12 + 1;
    *(_QWORD *)(v10 + 8) = sub_10000CD1C(v13, a4);
  }
  v14 = sub_10000CD1C(*(_QWORD **)(a1 + 24), a5);
  *(_QWORD *)(v10 + 16) = v14;
  if (!v14)
  {
    sub_10000CDB8((uint64_t **)(a1 + 24), a5, *(_QWORD *)(a1 + 32));
    v15 = strlen(a5);
    v16 = *(_QWORD **)(a1 + 24);
    *(_QWORD *)(a1 + 32) += v15 + 1;
    *(_QWORD *)(v10 + 16) = sub_10000CD1C(v16, a5);
  }
  result = sub_10000C928(*(unsigned int **)(a2 + 64), &v18, v10);
  ++*(_QWORD *)(a1 + 56);
  return result;
}

_QWORD *sub_10000CD1C(_QWORD *result, char *a2)
{
  _QWORD *v2;
  unsigned __int8 *v3;
  unsigned __int8 *v4;
  void *__p[2];
  char v6;

  if (result)
  {
    v2 = result;
    sub_100020730(__p, a2);
    v3 = sub_10000C718(v2, (uint64_t)__p);
    v4 = v3;
    if (v6 < 0)
    {
      operator delete(__p[0]);
      if (v4)
      {
LABEL_4:
        result = v4 + 16;
        if ((char)v4[39] < 0)
          return (_QWORD *)*result;
        return result;
      }
    }
    else if (v3)
    {
      goto LABEL_4;
    }
    return 0;
  }
  return result;
}

uint64_t sub_10000CDB8(uint64_t **a1, char *__s, uint64_t a3)
{
  uint64_t *v4;
  char v5;
  uint64_t *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint8x8_t v11;
  unint64_t v12;
  unint64_t v13;
  unsigned __int8 **v14;
  unsigned __int8 *v15;
  unint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  float v20;
  float v21;
  _BOOL8 v22;
  unint64_t v23;
  unint64_t v24;
  int8x8_t prime;
  void *v26;
  void *v27;
  uint64_t v28;
  _QWORD *v29;
  unint64_t v30;
  uint8x8_t v31;
  unint64_t v32;
  uint8x8_t v33;
  uint64_t v34;
  _QWORD *v35;
  unint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  _QWORD *v39;
  unint64_t v40;
  uint64_t v41;
  void *v43;
  void *__p[2];
  uint64_t v45;

  v4 = *a1;
  if (!*a1)
    operator new();
  sub_100020730(__p, __s);
  v5 = HIBYTE(v45);
  if (v45 >= 0)
    v6 = (uint64_t *)__p;
  else
    v6 = (uint64_t *)__p[0];
  if (v45 >= 0)
    v7 = HIBYTE(v45);
  else
    v7 = (unint64_t)__p[1];
  v8 = sub_1000207DC(v6, v7);
  v9 = v8;
  v10 = v4[1];
  if (!v10)
  {
    v13 = 0xAAAAAAAAAAAAAAAALL;
    goto LABEL_26;
  }
  v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
  v11.i16[0] = vaddlv_u8(v11);
  v12 = v11.u32[0];
  if (v11.u32[0] > 1uLL)
  {
    v13 = v8;
    if (v8 >= v10)
      v13 = v8 % v10;
  }
  else
  {
    v13 = (v10 - 1) & v8;
  }
  v14 = *(unsigned __int8 ***)(*v4 + 8 * v13);
  if (!v14 || (v15 = *v14) == 0)
  {
LABEL_26:
    v17 = v4 + 2;
    v18 = operator new(0x30uLL);
    *v18 = 0;
    v18[1] = v9;
    v19 = v45;
    *((_OWORD *)v18 + 1) = *(_OWORD *)__p;
    __p[1] = 0;
    v45 = 0;
    __p[0] = 0;
    v18[4] = v19;
    v18[5] = a3;
    v20 = (float)(unint64_t)(v4[3] + 1);
    v21 = *((float *)v4 + 8);
    if (v10 && (float)(v21 * (float)v10) >= v20)
    {
LABEL_72:
      v37 = *v4;
      v38 = *(_QWORD **)(*v4 + 8 * v13);
      if (v38)
      {
        *v18 = *v38;
      }
      else
      {
        v39 = (_QWORD *)*v17;
        *v18 = *v17;
        *v17 = v18;
        *(_QWORD *)(v37 + 8 * v13) = v17;
        if (!v39)
          goto LABEL_81;
        v40 = v39[1];
        if ((v10 & (v10 - 1)) != 0)
        {
          if (v40 >= v10)
            v40 %= v10;
        }
        else
        {
          v40 &= v10 - 1;
        }
        v38 = (_QWORD *)(*v4 + 8 * v40);
      }
      *v38 = v18;
LABEL_81:
      ++v4[3];
      v41 = 1;
      if (v45 < 0)
        goto LABEL_82;
      return v41;
    }
    v22 = 1;
    if (v10 >= 3)
      v22 = (v10 & (v10 - 1)) != 0;
    v23 = v22 | (2 * v10);
    v24 = vcvtps_u32_f32(v20 / v21);
    if (v23 <= v24)
      prime = (int8x8_t)v24;
    else
      prime = (int8x8_t)v23;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
    }
    v10 = v4[1];
    if (*(_QWORD *)&prime > v10)
      goto LABEL_38;
    if (*(_QWORD *)&prime < v10)
    {
      v32 = vcvtps_u32_f32((float)(unint64_t)v4[3] / *((float *)v4 + 8));
      if (v10 < 3 || (v33 = (uint8x8_t)vcnt_s8((int8x8_t)v10), v33.i16[0] = vaddlv_u8(v33), v33.u32[0] > 1uLL))
      {
        v32 = std::__next_prime(v32);
      }
      else
      {
        v34 = 1 << -(char)__clz(v32 - 1);
        if (v32 >= 2)
          v32 = v34;
      }
      if (*(_QWORD *)&prime <= v32)
        prime = (int8x8_t)v32;
      if (*(_QWORD *)&prime >= v10)
      {
        v10 = v4[1];
      }
      else
      {
        if (prime)
        {
LABEL_38:
          if (*(_QWORD *)&prime >> 61)
            sub_100020724();
          v26 = operator new(8 * *(_QWORD *)&prime);
          v27 = (void *)*v4;
          *v4 = (uint64_t)v26;
          if (v27)
            operator delete(v27);
          v28 = 0;
          v4[1] = (uint64_t)prime;
          do
            *(_QWORD *)(*v4 + 8 * v28++) = 0;
          while (*(_QWORD *)&prime != v28);
          v29 = (_QWORD *)*v17;
          if (*v17)
          {
            v30 = v29[1];
            v31 = (uint8x8_t)vcnt_s8(prime);
            v31.i16[0] = vaddlv_u8(v31);
            if (v31.u32[0] > 1uLL)
            {
              if (v30 >= *(_QWORD *)&prime)
                v30 %= *(_QWORD *)&prime;
            }
            else
            {
              v30 &= *(_QWORD *)&prime - 1;
            }
            *(_QWORD *)(*v4 + 8 * v30) = v17;
            v35 = (_QWORD *)*v29;
            if (*v29)
            {
              do
              {
                v36 = v35[1];
                if (v31.u32[0] > 1uLL)
                {
                  if (v36 >= *(_QWORD *)&prime)
                    v36 %= *(_QWORD *)&prime;
                }
                else
                {
                  v36 &= *(_QWORD *)&prime - 1;
                }
                if (v36 != v30)
                {
                  if (!*(_QWORD *)(*v4 + 8 * v36))
                  {
                    *(_QWORD *)(*v4 + 8 * v36) = v29;
                    goto LABEL_63;
                  }
                  *v29 = *v35;
                  *v35 = **(_QWORD **)(*v4 + 8 * v36);
                  **(_QWORD **)(*v4 + 8 * v36) = v35;
                  v35 = v29;
                }
                v36 = v30;
LABEL_63:
                v29 = v35;
                v35 = (_QWORD *)*v35;
                v30 = v36;
              }
              while (v35);
            }
          }
          v10 = (unint64_t)prime;
          goto LABEL_67;
        }
        v43 = (void *)*v4;
        *v4 = 0;
        if (v43)
          operator delete(v43);
        v10 = 0;
        v4[1] = 0;
      }
    }
LABEL_67:
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10)
        v13 = v9 % v10;
      else
        v13 = v9;
    }
    else
    {
      v13 = (v10 - 1) & v9;
    }
    goto LABEL_72;
  }
  while (1)
  {
    v16 = *((_QWORD *)v15 + 1);
    if (v16 == v9)
      break;
    if (v12 > 1)
    {
      if (v16 >= v10)
        v16 %= v10;
    }
    else
    {
      v16 &= v10 - 1;
    }
    if (v16 != v13)
      goto LABEL_26;
LABEL_25:
    v15 = *(unsigned __int8 **)v15;
    if (!v15)
      goto LABEL_26;
  }
  if (!sub_100020C10(v15 + 16, (unsigned __int8 *)__p))
    goto LABEL_25;
  v41 = 0;
  if (v5 < 0)
LABEL_82:
    operator delete(__p[0]);
  return v41;
}

uint64_t sub_10000D264(uint64_t a1)
{
  return *(_QWORD *)(a1 + 88);
}

uint64_t sub_10000D26C(uint64_t a1, uint64_t a2)
{
  float **v4;
  _QWORD *v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  float *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  uint64_t v18;

  v4 = (float **)(a1 + 40);
  v5 = sub_10000D3D4(*(_QWORD **)(a1 + 40), *(_QWORD *)(a2 + 8), *(_DWORD *)(a2 + 16));
  if (v5)
    return (uint64_t)v5;
  v6 = _os_trace_calloc(1, 72);
  v5 = (_QWORD *)v6;
  *(_OWORD *)v6 = *(_OWORD *)a2;
  v7 = *(_OWORD *)(a2 + 16);
  v8 = *(_OWORD *)(a2 + 32);
  v9 = *(_OWORD *)(a2 + 48);
  *(_QWORD *)(v6 + 64) = *(_QWORD *)(a2 + 64);
  *(_OWORD *)(v6 + 32) = v8;
  *(_OWORD *)(v6 + 48) = v9;
  *(_OWORD *)(v6 + 16) = v7;
  v10 = *v4;
  if (*v4)
    LOWORD(v10) = *((_WORD *)v10 + 12);
  *(_WORD *)v6 = (_WORD)v10;
  v11 = *(_QWORD *)(a1 + 16);
  if (v11)
    v12 = *(_QWORD *)(v11 + 24);
  else
    v12 = 0;
  sub_10000D4DC((float *)v11, v5 + 3, v12);
  if (!uuid_is_null((const unsigned __int8 *)v5 + 40))
  {
    v13 = *(_QWORD *)(a1 + 16);
    if (v13)
      v14 = *(_QWORD *)(v13 + 24);
    else
      v14 = 0;
    sub_10000D4DC((float *)v13, v5 + 5, v14);
  }
  v15 = _os_trace_calloc(1, 24);
  *(_QWORD *)v15 = 16;
  *(_BYTE *)(v15 + 8) = 2;
  *(_QWORD *)(v15 + 16) = _os_trace_calloc(16, 8);
  v5[7] = v15;
  v16 = _os_trace_calloc(1, 24);
  *(_QWORD *)v16 = 16;
  *(_BYTE *)(v16 + 8) = 1;
  *(_QWORD *)(v16 + 16) = _os_trace_calloc(16, 8);
  v5[8] = v16;
  if ((sub_10000D98C(v4, v5[1], *((_DWORD *)v5 + 4), (uint64_t)v5) & 1) != 0)
    return (uint64_t)v5;
  v18 = _os_assert_log(0);
  result = _os_crash(v18);
  __break(1u);
  return result;
}

_QWORD *sub_10000D3D4(_QWORD *result, uint64_t a2, unsigned int a3)
{
  int8x8_t v3;
  uint64_t v4;
  unint64_t v5;
  uint8x8_t v6;
  unint64_t v7;
  uint64_t **v8;
  uint64_t *i;
  unint64_t v10;

  if (result)
  {
    v3 = (int8x8_t)result[1];
    if (v3)
    {
      v4 = __ROR8__(__PAIR64__(a3, HIDWORD(a2)) + 12, 12);
      v5 = (0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69
            * (v4 ^ ((0x9DDFEA08EB382D69 * (a2 ^ v4)) >> 47) ^ (0x9DDFEA08EB382D69 * (a2 ^ v4)))) ^ ((0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (a2 ^ v4)) >> 47) ^ (0x9DDFEA08EB382D69 * (a2 ^ v4)))) >> 47))) ^ __PAIR64__(a3, HIDWORD(a2));
      v6 = (uint8x8_t)vcnt_s8(v3);
      v6.i16[0] = vaddlv_u8(v6);
      if (v6.u32[0] > 1uLL)
      {
        v7 = (0x9DDFEA08EB382D69
            * ((0x9DDFEA08EB382D69
              * (v4 ^ ((0x9DDFEA08EB382D69 * (a2 ^ v4)) >> 47) ^ (0x9DDFEA08EB382D69 * (a2 ^ v4)))) ^ ((0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (a2 ^ v4)) >> 47) ^ (0x9DDFEA08EB382D69 * (a2 ^ v4)))) >> 47))) ^ __PAIR64__(a3, HIDWORD(a2));
        if (v5 >= *(_QWORD *)&v3)
          v7 = v5 % *(_QWORD *)&v3;
      }
      else
      {
        v7 = v5 & (*(_QWORD *)&v3 - 1);
      }
      v8 = *(uint64_t ***)(*result + 8 * v7);
      if (v8)
      {
        for (i = *v8; i; i = (uint64_t *)*i)
        {
          v10 = i[1];
          if (v5 == v10)
          {
            if (*((_DWORD *)i + 6) == a3 && i[2] == a2)
              return (_QWORD *)i[4];
          }
          else
          {
            if (v6.u32[0] > 1uLL)
            {
              if (v10 >= *(_QWORD *)&v3)
                v10 %= *(_QWORD *)&v3;
            }
            else
            {
              v10 &= *(_QWORD *)&v3 - 1;
            }
            if (v10 != v7)
              return 0;
          }
        }
      }
    }
    return 0;
  }
  return result;
}

uint64_t sub_10000D4DC(float *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint8x8_t v10;
  unint64_t v11;
  _QWORD *v12;
  _QWORD *i;
  unint64_t v14;
  _QWORD *v16;
  float v17;
  float v18;
  _BOOL8 v19;
  unint64_t v20;
  unint64_t v21;
  int8x8_t prime;
  void *v23;
  _QWORD *v24;
  uint64_t v25;
  _QWORD *v26;
  unint64_t v27;
  uint8x8_t v28;
  unint64_t v29;
  uint8x8_t v30;
  uint64_t v31;
  _QWORD *v32;
  unint64_t v33;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v36;
  unint64_t v37;
  _QWORD *v39;

  v5 = *a2;
  v6 = a2[1];
  v7 = __ROR8__(v6 + 16, 16);
  v8 = (0x9DDFEA08EB382D69
      * ((0x9DDFEA08EB382D69 * (v7 ^ ((0x9DDFEA08EB382D69 * (*a2 ^ v7)) >> 47) ^ (0x9DDFEA08EB382D69 * (*a2 ^ v7)))) ^ ((0x9DDFEA08EB382D69 * (v7 ^ ((0x9DDFEA08EB382D69 * (*a2 ^ v7)) >> 47) ^ (0x9DDFEA08EB382D69 * (*a2 ^ v7)))) >> 47))) ^ v6;
  v9 = *((_QWORD *)a1 + 1);
  if (v9)
  {
    v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      v11 = (0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69
             * (v7 ^ ((0x9DDFEA08EB382D69 * (*a2 ^ v7)) >> 47) ^ (0x9DDFEA08EB382D69 * (*a2 ^ v7)))) ^ ((0x9DDFEA08EB382D69 * (v7 ^ ((0x9DDFEA08EB382D69 * (*a2 ^ v7)) >> 47) ^ (0x9DDFEA08EB382D69 * (*a2 ^ v7)))) >> 47))) ^ v6;
      if (v8 >= v9)
        v11 = v8 % v9;
    }
    else
    {
      v11 = v8 & (v9 - 1);
    }
    v12 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v11);
    if (v12)
    {
      for (i = (_QWORD *)*v12; i; i = (_QWORD *)*i)
      {
        v14 = i[1];
        if (v14 == v8)
        {
          if (i[2] == v5 && i[3] == v6)
            return 0;
        }
        else
        {
          if (v10.u32[0] > 1uLL)
          {
            if (v14 >= v9)
              v14 %= v9;
          }
          else
          {
            v14 &= v9 - 1;
          }
          if (v14 != v11)
            break;
        }
      }
    }
  }
  else
  {
    v11 = 0xAAAAAAAAAAAAAAAALL;
  }
  v16 = operator new(0x28uLL);
  *v16 = 0;
  v16[1] = v8;
  v16[2] = v5;
  v16[3] = v6;
  v16[4] = a3;
  v17 = (float)(unint64_t)(*((_QWORD *)a1 + 3) + 1);
  v18 = a1[8];
  if (!v9 || (float)(v18 * (float)v9) < v17)
  {
    v19 = 1;
    if (v9 >= 3)
      v19 = (v9 & (v9 - 1)) != 0;
    v20 = v19 | (2 * v9);
    v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21)
      prime = (int8x8_t)v21;
    else
      prime = (int8x8_t)v20;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
      v9 = *((_QWORD *)a1 + 1);
    }
    if (*(_QWORD *)&prime > v9)
      goto LABEL_34;
    if (*(_QWORD *)&prime < v9)
    {
      v29 = vcvtps_u32_f32((float)*((unint64_t *)a1 + 3) / a1[8]);
      if (v9 < 3 || (v30 = (uint8x8_t)vcnt_s8((int8x8_t)v9), v30.i16[0] = vaddlv_u8(v30), v30.u32[0] > 1uLL))
      {
        v29 = std::__next_prime(v29);
      }
      else
      {
        v31 = 1 << -(char)__clz(v29 - 1);
        if (v29 >= 2)
          v29 = v31;
      }
      if (*(_QWORD *)&prime <= v29)
        prime = (int8x8_t)v29;
      if (*(_QWORD *)&prime >= v9)
      {
        v9 = *((_QWORD *)a1 + 1);
      }
      else
      {
        if (prime)
        {
LABEL_34:
          if (*(_QWORD *)&prime >> 61)
            sub_100020724();
          v23 = operator new(8 * *(_QWORD *)&prime);
          v24 = *(_QWORD **)a1;
          *(_QWORD *)a1 = v23;
          if (v24)
            operator delete(v24);
          v25 = 0;
          *((int8x8_t *)a1 + 1) = prime;
          do
            *(_QWORD *)(*(_QWORD *)a1 + 8 * v25++) = 0;
          while (*(_QWORD *)&prime != v25);
          v26 = (_QWORD *)*((_QWORD *)a1 + 2);
          if (v26)
          {
            v27 = v26[1];
            v28 = (uint8x8_t)vcnt_s8(prime);
            v28.i16[0] = vaddlv_u8(v28);
            if (v28.u32[0] > 1uLL)
            {
              if (v27 >= *(_QWORD *)&prime)
                v27 %= *(_QWORD *)&prime;
            }
            else
            {
              v27 &= *(_QWORD *)&prime - 1;
            }
            *(_QWORD *)(*(_QWORD *)a1 + 8 * v27) = a1 + 4;
            v32 = (_QWORD *)*v26;
            if (*v26)
            {
              do
              {
                v33 = v32[1];
                if (v28.u32[0] > 1uLL)
                {
                  if (v33 >= *(_QWORD *)&prime)
                    v33 %= *(_QWORD *)&prime;
                }
                else
                {
                  v33 &= *(_QWORD *)&prime - 1;
                }
                if (v33 != v27)
                {
                  if (!*(_QWORD *)(*(_QWORD *)a1 + 8 * v33))
                  {
                    *(_QWORD *)(*(_QWORD *)a1 + 8 * v33) = v26;
                    goto LABEL_59;
                  }
                  *v26 = *v32;
                  *v32 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v33);
                  **(_QWORD **)(*(_QWORD *)a1 + 8 * v33) = v32;
                  v32 = v26;
                }
                v33 = v27;
LABEL_59:
                v26 = v32;
                v32 = (_QWORD *)*v32;
                v27 = v33;
              }
              while (v32);
            }
          }
          v9 = (unint64_t)prime;
          goto LABEL_63;
        }
        v39 = *(_QWORD **)a1;
        *(_QWORD *)a1 = 0;
        if (v39)
          operator delete(v39);
        v9 = 0;
        *((_QWORD *)a1 + 1) = 0;
      }
    }
LABEL_63:
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9)
        v11 = v8 % v9;
      else
        v11 = v8;
    }
    else
    {
      v11 = (v9 - 1) & v8;
    }
  }
  v34 = *(_QWORD **)a1;
  v35 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v11);
  if (v35)
  {
    *v16 = *v35;
LABEL_76:
    *v35 = v16;
    goto LABEL_77;
  }
  v36 = *((_QWORD *)a1 + 2);
  *v16 = v36;
  *((_QWORD *)a1 + 2) = v16;
  v34[v11] = a1 + 4;
  if (v36)
  {
    v37 = *(_QWORD *)(v36 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v37 >= v9)
        v37 %= v9;
    }
    else
    {
      v37 &= v9 - 1;
    }
    v35 = (_QWORD *)(*(_QWORD *)a1 + 8 * v37);
    goto LABEL_76;
  }
LABEL_77:
  ++*((_QWORD *)a1 + 3);
  return 1;
}

uint64_t sub_10000D8F8(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t result;
  uint64_t v6;

  if (*(_QWORD *)(a1 + 80))
    v4 = **(_QWORD ***)(*(_QWORD *)(a1 + 72) + 8);
  else
    v4 = sub_10000CB1C(a1);
  if (sub_10000D3D4(*(_QWORD **)(a1 + 40), *(_QWORD *)(a2 + 8), *(_DWORD *)(a2 + 16)))
    return sub_10000C928((unsigned int *)v4[6], (_QWORD *)a2, 0);
  v6 = _os_assert_log(0);
  result = _os_crash(v6);
  __break(1u);
  return result;
}

uint64_t sub_10000D970(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 48);
  *a2 = 2048;
  return v2 + 2048;
}

uint64_t sub_10000D984(uint64_t a1)
{
  return *(unsigned int *)(a1 + 136);
}

uint64_t sub_10000D98C(float **a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  float *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint8x8_t v13;
  unint64_t v14;
  uint64_t **v15;
  uint64_t *i;
  unint64_t v17;
  _QWORD *v19;
  float v20;
  float v21;
  _BOOL8 v22;
  unint64_t v23;
  unint64_t v24;
  int8x8_t prime;
  void *v26;
  _QWORD *v27;
  uint64_t v28;
  _QWORD *v29;
  unint64_t v30;
  uint8x8_t v31;
  unint64_t v32;
  uint8x8_t v33;
  uint64_t v34;
  _QWORD *v35;
  unint64_t v36;
  _QWORD *v37;
  _QWORD *v38;
  uint64_t v39;
  unint64_t v40;
  _QWORD *v42;

  v7 = *a1;
  if (!*a1)
    operator new();
  v8 = 0x9DDFEA08EB382D69 * (a2 ^ __ROR8__(__PAIR64__(a3, HIDWORD(a2)) + 12, 12));
  v9 = __ROR8__(__PAIR64__(a3, HIDWORD(a2)) + 12, 12) ^ (v8 >> 47);
  v10 = 0x9DDFEA08EB382D69 * ((0x9DDFEA08EB382D69 * (v9 ^ v8)) ^ ((0x9DDFEA08EB382D69 * (v9 ^ v8)) >> 47));
  v11 = v10 ^ __PAIR64__(a3, HIDWORD(a2));
  v12 = *((_QWORD *)v7 + 1);
  if (v12)
  {
    v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
    v13.i16[0] = vaddlv_u8(v13);
    if (v13.u32[0] > 1uLL)
    {
      v14 = v10 ^ __PAIR64__(a3, HIDWORD(a2));
      if (v11 >= v12)
        v14 = v11 % v12;
    }
    else
    {
      v14 = v11 & (v12 - 1);
    }
    v15 = *(uint64_t ***)(*(_QWORD *)v7 + 8 * v14);
    if (v15)
    {
      for (i = *v15; i; i = (uint64_t *)*i)
      {
        v17 = i[1];
        if (v17 == v11)
        {
          if (*((_DWORD *)i + 6) == a3 && i[2] == a2)
            return 0;
        }
        else
        {
          if (v13.u32[0] > 1uLL)
          {
            if (v17 >= v12)
              v17 %= v12;
          }
          else
          {
            v17 &= v12 - 1;
          }
          if (v17 != v14)
            break;
        }
      }
    }
  }
  else
  {
    v14 = 0xAAAAAAAAAAAAAAAALL;
  }
  v19 = operator new(0x28uLL);
  *v19 = 0;
  v19[1] = v11;
  v19[2] = a2;
  *((_DWORD *)v19 + 6) = a3;
  v19[4] = a4;
  v20 = (float)(unint64_t)(*((_QWORD *)v7 + 3) + 1);
  v21 = v7[8];
  if (!v12 || (float)(v21 * (float)v12) < v20)
  {
    v22 = 1;
    if (v12 >= 3)
      v22 = (v12 & (v12 - 1)) != 0;
    v23 = v22 | (2 * v12);
    v24 = vcvtps_u32_f32(v20 / v21);
    if (v23 <= v24)
      prime = (int8x8_t)v24;
    else
      prime = (int8x8_t)v23;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
    }
    v12 = *((_QWORD *)v7 + 1);
    if (*(_QWORD *)&prime > v12)
      goto LABEL_36;
    if (*(_QWORD *)&prime < v12)
    {
      v32 = vcvtps_u32_f32((float)*((unint64_t *)v7 + 3) / v7[8]);
      if (v12 < 3 || (v33 = (uint8x8_t)vcnt_s8((int8x8_t)v12), v33.i16[0] = vaddlv_u8(v33), v33.u32[0] > 1uLL))
      {
        v32 = std::__next_prime(v32);
      }
      else
      {
        v34 = 1 << -(char)__clz(v32 - 1);
        if (v32 >= 2)
          v32 = v34;
      }
      if (*(_QWORD *)&prime <= v32)
        prime = (int8x8_t)v32;
      if (*(_QWORD *)&prime >= v12)
      {
        v12 = *((_QWORD *)v7 + 1);
      }
      else
      {
        if (prime)
        {
LABEL_36:
          if (*(_QWORD *)&prime >> 61)
            sub_100020724();
          v26 = operator new(8 * *(_QWORD *)&prime);
          v27 = *(_QWORD **)v7;
          *(_QWORD *)v7 = v26;
          if (v27)
            operator delete(v27);
          v28 = 0;
          *((int8x8_t *)v7 + 1) = prime;
          do
            *(_QWORD *)(*(_QWORD *)v7 + 8 * v28++) = 0;
          while (*(_QWORD *)&prime != v28);
          v29 = (_QWORD *)*((_QWORD *)v7 + 2);
          if (v29)
          {
            v30 = v29[1];
            v31 = (uint8x8_t)vcnt_s8(prime);
            v31.i16[0] = vaddlv_u8(v31);
            if (v31.u32[0] > 1uLL)
            {
              if (v30 >= *(_QWORD *)&prime)
                v30 %= *(_QWORD *)&prime;
            }
            else
            {
              v30 &= *(_QWORD *)&prime - 1;
            }
            *(_QWORD *)(*(_QWORD *)v7 + 8 * v30) = v7 + 4;
            v35 = (_QWORD *)*v29;
            if (*v29)
            {
              do
              {
                v36 = v35[1];
                if (v31.u32[0] > 1uLL)
                {
                  if (v36 >= *(_QWORD *)&prime)
                    v36 %= *(_QWORD *)&prime;
                }
                else
                {
                  v36 &= *(_QWORD *)&prime - 1;
                }
                if (v36 != v30)
                {
                  if (!*(_QWORD *)(*(_QWORD *)v7 + 8 * v36))
                  {
                    *(_QWORD *)(*(_QWORD *)v7 + 8 * v36) = v29;
                    goto LABEL_61;
                  }
                  *v29 = *v35;
                  *v35 = **(_QWORD **)(*(_QWORD *)v7 + 8 * v36);
                  **(_QWORD **)(*(_QWORD *)v7 + 8 * v36) = v35;
                  v35 = v29;
                }
                v36 = v30;
LABEL_61:
                v29 = v35;
                v35 = (_QWORD *)*v35;
                v30 = v36;
              }
              while (v35);
            }
          }
          v12 = (unint64_t)prime;
          goto LABEL_65;
        }
        v42 = *(_QWORD **)v7;
        *(_QWORD *)v7 = 0;
        if (v42)
          operator delete(v42);
        v12 = 0;
        *((_QWORD *)v7 + 1) = 0;
      }
    }
LABEL_65:
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12)
        v14 = v11 % v12;
      else
        v14 = v11;
    }
    else
    {
      v14 = (v12 - 1) & v11;
    }
  }
  v37 = *(_QWORD **)v7;
  v38 = *(_QWORD **)(*(_QWORD *)v7 + 8 * v14);
  if (v38)
  {
    *v19 = *v38;
LABEL_78:
    *v38 = v19;
    goto LABEL_79;
  }
  v39 = *((_QWORD *)v7 + 2);
  *v19 = v39;
  *((_QWORD *)v7 + 2) = v19;
  v37[v14] = v7 + 4;
  if (v39)
  {
    v40 = *(_QWORD *)(v39 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v40 >= v12)
        v40 %= v12;
    }
    else
    {
      v40 &= v12 - 1;
    }
    v38 = (_QWORD *)(*(_QWORD *)v7 + 8 * v40);
    goto LABEL_78;
  }
LABEL_79:
  ++*((_QWORD *)v7 + 3);
  return 1;
}

uint64_t sub_10000DE00(_QWORD *a1)
{
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  v1 = *a1 + ~(*a1 << 32);
  v2 = 9 * (((v1 ^ (v1 >> 22)) + ~((v1 ^ (v1 >> 22)) << 13)) ^ (((v1 ^ (v1 >> 22)) + ~((v1 ^ (v1 >> 22)) << 13)) >> 8));
  v3 = (v2 ^ (v2 >> 15)) + ~((v2 ^ (v2 >> 15)) << 27);
  return (v3 >> 31) ^ v3;
}

uint64_t sub_10000DE3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v6 = *(_QWORD *)(a1 + 16);
  if (v6)
    v7 = *(_QWORD *)(v6 + 24);
  else
    v7 = 0;
  sub_10000D4DC((float *)v6, (uint64_t *)(a3 + 14), v7);
  v11 = *(unsigned int *)(a3 + 8) | ((unint64_t)*(unsigned __int16 *)(a3 + 12) << 32);
  result = sub_10000C898(*(_QWORD *)(a2 + 56), (uint64_t)&v11);
  if (!result)
  {
    v9 = _os_trace_calloc(1, 32);
    *(_QWORD *)v9 = *(unsigned int *)(a3 + 8) | ((unint64_t)*(unsigned __int16 *)(a3 + 12) << 32);
    *(_QWORD *)(v9 + 8) = *(_QWORD *)a3;
    *(_OWORD *)(v9 + 16) = *(_OWORD *)(a3 + 14);
    result = sub_10000C928(*(unsigned int **)(a2 + 56), (_QWORD *)v9, v9);
    if ((result & 1) == 0)
    {
      v10 = _os_assert_log(0);
      _os_crash(v10);
      __break(1u);
    }
    ++*(_QWORD *)(a1 + 48);
  }
  return result;
}

uint64_t sub_10000DF38(uint64_t a1, unint64_t a2)
{
  os_unfair_lock_s *v4;
  unint64_t v5;
  uint64_t result;
  uint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  v4 = (os_unfair_lock_s *)(a1 + 132);
  os_unfair_lock_lock_with_options(a1 + 132, 0x10000);
  if (*(_WORD *)(a1 + 130))
  {
    v5 = 0;
    result = 0;
    v7 = *(_QWORD *)(a1 + 72);
    v8 = -1;
    do
    {
      if (v5 > ~v7)
      {
        __break(0x5513u);
        return result;
      }
      v9 = (unint64_t *)(v7 + v5);
      v10 = *(unsigned int *)(v7 + v5 + 8) | ((unint64_t)*(unsigned __int16 *)(v7 + v5 + 12) << 32);
      if (v10 <= a2 && *v9 + v10 > a2 && *v9 < v8)
      {
        result = v7 + v5;
        v8 = *v9;
      }
      v5 += 32;
    }
    while (32 * *(unsigned __int16 *)(a1 + 130) != v5);
    if (result)
      return result;
  }
  os_unfair_lock_unlock(v4);
  return 0;
}

BOOL sub_10000DFF4(uint64_t a1, _QWORD *a2)
{
  return *a2 == a1;
}

unint64_t sub_10000E004(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unint64_t result;
  unint64_t v6;
  _BOOL8 v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;

  result = sub_10000B8D4(*(_QWORD **)(*(_QWORD *)(a1 + 32) + 16), a3 + 2);
  v6 = result;
  v7 = result < 0x10000;
  if (result >= 0x10000)
    result = _os_assumes_log(result < 0x10000);
  v8 = **(_QWORD ***)(a1 + 40);
  v9 = *a3;
  v8[1] = *((unsigned __int16 *)v8 + 4) | (unint64_t)(*a3 << 16);
  *v8 = a3[1];
  if (v6 >= 0x10000)
  {
    v10 = _os_assert_log(v7);
    result = _os_crash(v10);
    __break(1u);
  }
  else
  {
    v8[1] = (v9 << 16) | (unsigned __int16)v6;
    **(_QWORD **)(a1 + 40) += 16;
  }
  return result;
}

void sub_10000E0B0(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6;
  dispatch_queue_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  size_t v11;
  unsigned int *v12;
  unsigned int v13;
  unint64_t StatusReg;
  uint8_t *v15;
  uint64_t v16;
  uint8_t **v17;
  const uint8_t *v18;
  size_t v19;
  size_t v20;
  size_t v21;
  unint64_t v22;
  uint64_t v23;
  __int128 v24;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int v31;
  _QWORD *v32;
  _QWORD *v33;
  size_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  _QWORD *v38;
  uint64_t v39;
  dispatch_queue_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  dispatch_queue_t *v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  BOOL v49;
  unint64_t v50;
  char v51;
  BOOL v52;
  int v53;
  BOOL v54;
  int v55;
  int v56;
  unint64_t v57;
  uint64_t v58;
  unint64_t v59;
  int v60;
  _BOOL4 v61;
  _QWORD *v62;
  unint64_t v63;
  uint64_t v64;
  _BOOL4 v65;
  _BOOL4 v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  _BOOL4 v71;
  _BOOL4 v72;
  unsigned int v73;
  unint64_t v74;
  _QWORD *v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  unint64_t v79;
  char v80;
  BOOL v81;
  _QWORD *v82;
  unint64_t v83;
  unint64_t v84;
  unint64_t v85;
  unint64_t *v86;
  unint64_t v87;
  unint64_t v88;
  int v89;
  _QWORD *v90;
  int v91;
  uint8_t v92[65544];
  uint64_t v93;
  int *v94;
  unint64_t v95;
  uint64_t v96;
  int v97;
  __int128 v98;
  __int128 v99;

  v6 = *(_QWORD *)(a1 + 8);
  if (v6)
    v7 = (dispatch_queue_t *)(v6 + 16);
  else
    v7 = (dispatch_queue_t *)a1;
  dispatch_assert_queue_V2(*v7);
  if (a2 >= 5)
LABEL_101:
    __break(0x5512u);
  v8 = a1 + 48;
  v9 = 33 * a2;
  if (__CFADD__(a1 + 48, 264 * a2))
    goto LABEL_100;
  v10 = v8 + 264 * a2;
  v13 = *(_DWORD *)(v10 + 252);
  v12 = (unsigned int *)(v10 + 252);
  v11 = v13;
  if (!v13)
    return;
  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  if (StatusReg >= 0xFFFFFFFFFFFFFFE8)
    goto LABEL_100;
  *(_DWORD *)(a1 + 1108) = *(_DWORD *)(StatusReg + 24) & 0xFFFFFFFC;
  __chkstk_darwin();
  v15 = v92;
  memset(v92, 170, 0x10000uLL);
  v16 = v8 + 264 * a2;
  v18 = *(const uint8_t **)(v16 + 240);
  v17 = (uint8_t **)(v16 + 240);
  v97 = 256;
  v19 = compression_encode_buffer(v92, 0x10000uLL, v18, v11, 0, COMPRESSION_LZ4);
  v95 = a3;
  v96 = a2;
  v94 = (int *)v12;
  if (v19)
  {
    v20 = v19;
  }
  else
  {
    v97 = 0;
    v15 = *v17;
    v20 = *v12;
  }
  v21 = v20 + 16;
  v22 = (v20 + 16) & 0xFFFFFFFFFFFFC000;
  v23 = (v20 + 16) & 0x3FFF;
  *(_QWORD *)&v24 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v98 = v24;
  v99 = v24;
  if (!v22 || v23 == 0)
  {
    if ((v20 & 7) != 0)
      v26 = (v21 & 0xFFFFFFFFFFFFFFF8) + 8;
    else
      v26 = v20 + 16;
    v27 = _os_trace_malloc(v26);
    v28 = v27;
    if ((v20 & 7) != 0)
    {
      if ((v21 & 0x8000000000000000) != 0 || (v21 & 0xFFFFFFFFFFFFFFF8) > ~v27)
        goto LABEL_100;
      *(_QWORD *)(v27 + (v21 & 0xFFFFFFFFFFFFFFF8)) = 0;
    }
    *(_QWORD *)v27 = 0x110000600DLL;
    *(_QWORD *)(v27 + 8) = v20;
    memcpy((void *)(v27 + 16), v15, v20);
    v29 = 0;
    *(_QWORD *)&v98 = v28;
    v30 = (v20 & 0xFFFFFFFFFFFFFFF8) + 24;
    if ((v20 & 7) == 0)
      v30 = v20 + 16;
    v31 = 1;
  }
  else
  {
    v93 = v9;
    v32 = (_QWORD *)_os_trace_malloc((v20 + 16) & 0xFFFFFFFFFFFFC000);
    v33 = v32;
    *v32 = 0x110000600DLL;
    v32[1] = v20;
    v34 = v21 & 0x3FF8;
    if ((v20 & 7) != 0)
      v35 = (v21 & 0x3FF8) + 8;
    else
      v35 = (v20 + 16) & 0x3FFF;
    v36 = _os_trace_malloc(v35);
    v37 = (void *)v36;
    if ((v20 & 7) != 0)
    {
      if (__CFADD__(v36, v34))
        goto LABEL_100;
      *(_QWORD *)(v36 + ((v20 + 16) & 0x3FF8)) = 0;
    }
    memcpy(v33 + 2, v15, v22 - 16);
    if (__CFADD__(v15, v22 - 16))
      goto LABEL_100;
    memcpy(v37, &v15[v22 - 16], v20 - (v22 - 16));
    *(_QWORD *)&v98 = v33;
    *((_QWORD *)&v98 + 1) = (v20 + 16) & 0xFFFFFFFFFFFFC000;
    if ((unint64_t)&v98 > 0xFFFFFFFFFFFFFFEFLL)
      goto LABEL_100;
    *(_QWORD *)&v99 = v37;
    v30 = (v20 & 7) != 0 ? v23 - (v20 & 7) + 8 : (v20 + 16) & 0x3FFF;
    v31 = 2;
    v29 = 1;
    v9 = v93;
  }
  v38 = (_QWORD *)(v8 + 8 * v9);
  *((_QWORD *)&v98 + 2 * v29 + 1) = v30;
  v39 = *(_QWORD *)(a1 + 8);
  if (v39)
    v40 = (dispatch_queue_t *)(v39 + 16);
  else
    v40 = (dispatch_queue_t *)a1;
  dispatch_assert_queue_V2(*v40);
  v41 = 0;
  v42 = 0;
  v43 = v31;
  do
  {
    v42 += *(_QWORD *)((char *)&v98 + v41 + 8);
    v41 += 16;
  }
  while (16 * v31 != v41);
  v44 = *(_QWORD *)(a1 + 8);
  if (v44)
    v45 = (dispatch_queue_t *)(v44 + 16);
  else
    v45 = (dispatch_queue_t *)a1;
  dispatch_assert_queue_V2(*v45);
  v46 = *(int *)(a1 + 1168);
  v47 = *(_QWORD *)(a1 + 1136);
  v48 = 280 * (int)v46;
  v49 = __CFADD__(v48, v47);
  v50 = v48 + v47;
  v51 = v49;
  v52 = v50 >= v47;
  if (v46 < 0)
    v52 = v51;
  if (!v52)
    goto LABEL_100;
  if ((unint64_t)(*(_QWORD *)(v47 + 280 * (int)v46 + 232) + v42) > *(_QWORD *)(v47 + 280 * (int)v46 + 240))
    goto LABEL_56;
  v53 = *(_DWORD *)(v47 + 280 * (int)v46 + 268);
  v54 = __OFADD__(v53, (_DWORD)v43);
  v55 = v53 + v43;
  if (v54)
  {
    __break(0x5500u);
    return;
  }
  if (v55 <= *(_DWORD *)(v47 + 280 * (int)v46 + 264)
    && (unint64_t)sub_10000E6F8(*(_QWORD **)(v47 + 280 * (int)v46 + 224)) < 0x8000)
  {
    v62 = (_QWORD *)(v47 + 280 * (int)v46);
  }
  else
  {
LABEL_56:
    sub_10000EEA0(a1);
    v57 = *(_QWORD *)(a1 + 1136);
    v58 = 280 * v56;
    v49 = __CFADD__(v58, v57);
    v59 = v58 + v57;
    v60 = v49;
    v61 = v59 >= v57;
    if (v56 < 0)
      v61 = v60;
    if (!v61)
      goto LABEL_100;
    v62 = (_QWORD *)(v57 + 280 * v56);
    LODWORD(v46) = v56;
  }
  if (!v62[29])
    memcpy(v62, v38, v38[1] + 16);
  v63 = *(_QWORD *)(a1 + 1136);
  v64 = 280 * (int)v46;
  v65 = __CFADD__(v64, v63);
  v66 = v64 + v63 >= v63;
  if ((int)v46 < 0)
    v66 = v65;
  if (!v66)
    goto LABEL_100;
  v67 = 0;
  v68 = v63 + 280 * (int)v46;
  v69 = 16 * v43;
  do
  {
    sub_10000E618(v68, *(_QWORD *)((char *)&v98 + v67), *(_QWORD *)((char *)&v98 + v67 + 8), *(_DWORD *)(v68 + 268));
    v67 += 16;
  }
  while (v69 != v67);
  v70 = *(_QWORD *)(a1 + 1136);
  v71 = __CFADD__(v64, v70);
  v72 = v64 + v70 >= v70;
  if ((int)v46 < 0)
    v72 = v71;
  v74 = v95;
  v73 = v96;
  if (!v72)
    goto LABEL_100;
  v75 = *(_QWORD **)(v70 + 280 * (int)v46 + 224);
  sub_10000EA70((uint64_t)v75, (uint64_t)v38);
  v76 = *(int *)(a1 + 1168);
  v77 = *(_QWORD *)(a1 + 1136);
  v78 = 280 * (int)v76;
  v49 = __CFADD__(v78, v77);
  v79 = v78 + v77;
  v80 = v49;
  v81 = v79 >= v77;
  if (v76 < 0)
    v81 = v80;
  if (!v81)
  {
LABEL_100:
    __break(0x5513u);
    goto LABEL_101;
  }
  if (v75[10])
    v82 = **(_QWORD ***)(v75[9] + 8);
  else
    v82 = sub_10000CB1C((uint64_t)v75);
  v84 = v82[2];
  v83 = v82[3];
  v85 = v77 + 280 * (int)v76;
  v87 = *(_QWORD *)(v85 + 248);
  v86 = (unint64_t *)(v85 + 248);
  if (v84 < v87)
    *v86 = v84;
  v88 = v77 + 280 * (int)v76;
  if (v83 > *(_QWORD *)(v88 + 256))
    *(_QWORD *)(v88 + 256) = v83;
  v89 = *v94;
  if (v75[10])
    v90 = **(_QWORD ***)(v75[9] + 8);
  else
    v90 = sub_10000CB1C((uint64_t)v75);
  v91 = v97;
  *((_DWORD *)v90 + 8) = v89;
  *((_DWORD *)v90 + 9) = v91;
  if (v75[1] > v74)
    v75[1] = v74;
  sub_10000E8E4(a1, v73);
  sub_10000CB1C((uint64_t)v75);
}

void sub_10000E618(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  unint64_t v6;
  BOOL v7;
  BOOL v8;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  BOOL v14;
  unint64_t v15;
  _BOOL4 v16;
  _BOOL4 v17;
  int v18;
  BOOL v19;
  int v20;
  uint64_t v21;

  if (*(_DWORD *)(a1 + 264) <= a4)
  {
    v21 = _os_assert_log(0);
    _os_crash(v21);
    __break(1u);
LABEL_19:
    __break(0x5513u);
    goto LABEL_20;
  }
  v6 = *(_QWORD *)(a1 + 272);
  v7 = __CFADD__(v6, 16 * a4);
  v8 = v6 + 16 * a4 >= v6;
  if (a4 < 0)
    v8 = v7;
  if (!v8)
    goto LABEL_19;
  v11 = v6 + 16 * a4;
  free(*(void **)v11);
  *(_QWORD *)v11 = a2;
  *(_QWORD *)(v11 + 8) = a3;
  if (!a4)
    return;
  v12 = 16 * a4;
  v13 = *(_QWORD *)(a1 + 272);
  v14 = __CFADD__(v12, v13);
  v15 = v12 + v13;
  v16 = v14;
  v17 = v15 >= v13;
  if (a4 < 0)
    v17 = v16;
  if (!v17)
    goto LABEL_19;
  *(_QWORD *)(a1 + 232) += *(_QWORD *)(v13 + 16 * a4 + 8);
  v18 = *(_DWORD *)(a1 + 268);
  v19 = __OFADD__(v18, 1);
  v20 = v18 + 1;
  if (v19)
  {
LABEL_20:
    __break(0x5500u);
    return;
  }
  *(_DWORD *)(a1 + 268) = v20;
}

uint64_t sub_10000E6F8(_QWORD *a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  BOOL v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  int v20;
  unint64_t v21;
  unint64_t v22;
  BOOL v23;
  unint64_t v24;
  uint64_t result;
  _BOOL4 v26;
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
  uint64_t v38;

  v1 = a1[2];
  if (v1)
    v1 = *(_QWORD *)(v1 + 24);
  v2 = 16 * v1 + 40;
  if (v1 >> 60 || 16 * v1 >= 0xFFFFFFFFFFFFFFD8)
  {
    v27 = _os_assert_log(1);
    _os_crash(v27);
    __break(1u);
    goto LABEL_36;
  }
  v3 = a1[4];
  v4 = (v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  v5 = __CFADD__(v2, v4);
  v6 = v2 + v4;
  if (v5)
  {
LABEL_36:
    v28 = _os_assert_log(1);
    _os_crash(v28);
    __break(1u);
    goto LABEL_37;
  }
  v7 = a1[6];
  if (v7 >> 60)
  {
LABEL_37:
    v29 = _os_assert_log(1);
    _os_crash(v29);
    __break(1u);
    goto LABEL_38;
  }
  v8 = a1[7];
  if (!is_mul_ok(v8, 6uLL))
  {
LABEL_38:
    v30 = _os_assert_log(1);
    _os_crash(v30);
    __break(1u);
LABEL_39:
    v31 = _os_assert_log(1);
    _os_crash(v31);
    __break(1u);
    goto LABEL_40;
  }
  v9 = a1[5];
  if (v9)
    v10 = *(_QWORD *)(v9 + 24);
  else
    v10 = 0;
  if (!is_mul_ok(v10, 0x38uLL))
    goto LABEL_39;
  v11 = 16 * v7;
  v12 = 56 * v10;
  v5 = __CFADD__(v12, v11);
  v13 = v12 + v11;
  if (v5)
  {
LABEL_40:
    v32 = _os_assert_log(1);
    _os_crash(v32);
    __break(1u);
    goto LABEL_41;
  }
  v14 = 6 * v8;
  v5 = __CFADD__(v13, v14);
  v15 = v13 + v14;
  if (v5)
  {
LABEL_41:
    v33 = _os_assert_log(1);
    _os_crash(v33);
    __break(1u);
LABEL_42:
    v34 = _os_assert_log(1);
    _os_crash(v34);
    __break(1u);
LABEL_43:
    v35 = _os_assert_log(1);
    _os_crash(v35);
    __break(1u);
    goto LABEL_44;
  }
  if ((v15 & 6) != 0)
    v15 = (v15 & 0xFFFFFFFFFFFFFFF8) + 8;
  v5 = __CFADD__(v15, v6);
  v16 = v15 + v6;
  if (v5)
    goto LABEL_42;
  if (v9)
    v9 = *(_QWORD *)(v9 + 24);
  v17 = 2 * v9 + 32;
  if (v9 < 0 || (unint64_t)(2 * v9) >= 0xFFFFFFFFFFFFFFE0)
    goto LABEL_43;
  v18 = 2 * v9 + 40;
  if (v17 >= 0xFFFFFFFFFFFFFFF8)
  {
LABEL_44:
    v36 = _os_assert_log(1);
    _os_crash(v36);
    __break(1u);
LABEL_45:
    v37 = _os_assert_log(1);
    _os_crash(v37);
    __break(1u);
LABEL_46:
    v38 = _os_assert_log(1);
    result = _os_crash(v38);
    __break(1u);
    return result;
  }
  v5 = __CFADD__(v18, 2 * v3);
  v19 = v18 + 2 * v3;
  v20 = v5;
  if (v3 < 0 || v20)
    goto LABEL_45;
  v21 = (v19 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v19 & 6) == 0)
    v21 = v19;
  v22 = a1[10];
  v23 = !is_mul_ok(v22, v21);
  v24 = v22 * v21;
  result = v16 + v24;
  v26 = __CFADD__(v16, v24);
  if (v23 || v26)
    goto LABEL_46;
  return result;
}

void sub_10000E8E4(uint64_t a1, unsigned int a2)
{
  uint64_t v4;
  dispatch_queue_t *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t **i;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t j;
  unint64_t *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  int v17;
  BOOL v18;

  v4 = *(_QWORD *)(a1 + 8);
  if (v4)
    v5 = (dispatch_queue_t *)(v4 + 16);
  else
    v5 = (dispatch_queue_t *)a1;
  dispatch_assert_queue_V2(*v5);
  if (a2 >= 5)
  {
LABEL_28:
    __break(0x5512u);
    goto LABEL_29;
  }
  v6 = a1 + 48;
  if (__CFADD__(a1 + 48, 264 * a2))
  {
LABEL_29:
    __break(0x5513u);
    return;
  }
  v7 = *(_QWORD **)(v6 + 264 * a2 + 224);
  if (v7)
  {
    for (i = (uint64_t **)v7[2]; i; i = (uint64_t **)*i)
      os_release(i[4]);
    if (v7[3])
    {
      v9 = (_QWORD *)v7[2];
      if (v9)
      {
        do
        {
          v10 = (_QWORD *)*v9;
          operator delete(v9);
          v9 = v10;
        }
        while (v10);
      }
      v7[2] = 0;
      v11 = v7[1];
      if (v11)
      {
        for (j = 0; j != v11; ++j)
          *(_QWORD *)(*v7 + 8 * j) = 0;
      }
      v7[3] = 0;
    }
  }
  v13 = (unint64_t *)(a1 + 1104);
  v14 = v6 + 264 * a2;
  sub_10000F32C(*(_QWORD **)(v14 + 232), (uint64_t (*)(_QWORD))sub_10000F5B0);
  madvise(*(void **)(v14 + 240), *(unsigned int *)(v14 + 248), 7);
  *(_DWORD *)(v14 + 252) = 0;
  *(_DWORD *)(v14 + 256) = 0;
  *(_QWORD *)(v14 + 240) = 0;
  do
    v15 = __ldxr(v13);
  while (__stlxr((1 << a2) | v15, v13));
  if ((v15 & 0x100000000) != 0)
  {
    v16 = a1 + 1108;
    while ((__ulock_wake(258, v16, 0) & 0x80000000) != 0)
    {
      v17 = *__error();
      if (v17 != 4)
      {
        if (v17)
          v18 = v17 == 2;
        else
          v18 = 1;
        if (!v18)
        {
          qword_10002DF48 = (uint64_t)"BUG IN LIBTRACE: ulock_wake() failed";
          qword_10002DF78 = v17;
          __break(1u);
          goto LABEL_28;
        }
        return;
      }
    }
  }
}

uint64_t sub_10000EA70(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  _QWORD *i;
  _QWORD v10[2];
  unsigned int *(*v11)(uint64_t, uint64_t);
  void *v12;
  uint64_t v13;
  _QWORD v14[2];
  uint64_t (*v15)(uint64_t, uint64_t);
  void *v16;
  uint64_t v17;
  uint64_t v18;

  v3 = result;
  v4 = 0;
  v5 = *(_QWORD *)(a2 + 240);
  v6 = *(unsigned int *)(a2 + 252);
  v15 = sub_10000B9E0;
  v16 = &unk_100029B90;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 0x40000000;
  v17 = a2;
  v18 = result;
  do
  {
    if (v6 - v4 < 0x10)
      break;
    v7 = *(_QWORD *)(v5 + v4 + 8);
    if (v6 - v4 - 16 < v7)
      break;
    result = ((uint64_t (*)(_QWORD *))v15)(v14);
    if (!(_DWORD)result)
      break;
    v4 = (v4 + v7 + 23) & 0xFFFFFFFFFFFFFFF8;
  }
  while (v4 - 1 < v6);
  v8 = *(_QWORD *)(a2 + 232);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 0x40000000;
  v11 = sub_10000F1A4;
  v12 = &unk_100029BD0;
  v13 = v3;
  if (v8)
  {
    for (i = *(_QWORD **)(v8 + 16); i; i = (_QWORD *)*i)
      result = (uint64_t)v11((uint64_t)v10, i[4]);
  }
  return result;
}

void sub_10000EBAC(uint64_t a1, uint64_t a2)
{
  os_unfair_lock_s *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _OWORD *v11;
  __int128 v12;
  __int128 v13;
  _OWORD *v14;
  int v15;
  char __b[1024];

  v4 = (os_unfair_lock_s *)(a1 + 132);
  os_unfair_lock_lock_with_options(a1 + 132, 0x10000);
  v5 = *(unsigned __int16 *)(a1 + 130);
  if (v5 <= 0x3FF)
  {
    if (*(_WORD *)(a1 + 130))
    {
      v6 = 0;
      v7 = 0;
      v8 = *(_QWORD *)(a1 + 72);
      v9 = (_QWORD *)(a2 + 14);
      while (1)
      {
        if (v6 > ~v8)
          goto LABEL_18;
        if (*(_QWORD *)(v8 + v6 + 14) == *v9)
        {
          if ((unint64_t)v9 > 0xFFFFFFFFFFFFFFF7 || v8 + v6 + 14 > 0xFFFFFFFFFFFFFFF7)
            goto LABEL_18;
          if (*(_QWORD *)(v8 + v6 + 22) == *(_QWORD *)(a2 + 22))
            break;
        }
        ++v7;
        v6 += 32;
        if (v5 == v7)
          goto LABEL_10;
      }
      v13 = *(_OWORD *)(a2 + 16);
      v14 = (_OWORD *)(v8 + 32 * v7);
      *v14 = *(_OWORD *)a2;
      v14[1] = v13;
    }
    else
    {
LABEL_10:
      if (v5 >= (((_WORD)v5 + 3) & 0xFFFCu))
      {
        v10 = _os_trace_realloc(*(_QWORD *)(a1 + 72), 32 * (unsigned __int16)(((v5 + 3) & 0xFFFC) + 4));
        *(_QWORD *)(a1 + 72) = v10;
        LODWORD(v5) = *(unsigned __int16 *)(a1 + 130);
      }
      else
      {
        v10 = *(_QWORD *)(a1 + 72);
      }
      *(_WORD *)(a1 + 130) = v5 + 1;
      if (__CFADD__(v10, 32 * v5))
LABEL_18:
        __break(0x5513u);
      v11 = (_OWORD *)(v10 + 32 * v5);
      v12 = *(_OWORD *)(a2 + 16);
      *v11 = *(_OWORD *)a2;
      v11[1] = v12;
      if (*(_WORD *)(a1 + 130) == 1024)
      {
        v15 = -1431655766;
        sub_10000B0A0(*(_QWORD *)(a1 + 64), &v15);
        memset(__b, 170, sizeof(__b));
        snprintf(__b, 0x400uLL, "%s (%d) reached %d dylibs", (const char *)(a1 + 138), v15, 1024);
        sub_100013FF0((uint64_t)__b);
      }
    }
  }
  os_unfair_lock_unlock(v4);
}

void sub_10000ED60(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  int times;
  dispatch_block_t v5;
  _QWORD v6[6];
  int v7;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)a1);
  v2 = *(_QWORD *)(a1 + 24);
  dispatch_assert_queue_V2(*(dispatch_queue_t *)a1);
  v3 = *(unsigned int *)(a1 + 1128);
  *(_DWORD *)(a1 + 1128) = -1;
  times = mach_get_times(a1 + 16, a1 + 24, a1 + 32);
  if (times)
    _os_assumes_log(times);
  if ((_DWORD)v3 != -1)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 0x40000000;
    v6[2] = sub_10001053C;
    v6[3] = &unk_100029B70;
    v7 = v3;
    v6[4] = a1;
    v6[5] = v2;
    if (*(_QWORD *)(a1 + 8))
    {
      v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v6);
      dispatch_async(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 8) + 16), v5);
      _Block_release(v5);
    }
    else
    {
      sub_10000E0B0(a1, v3, v2);
    }
  }
}

void sub_10000EEA0(uint64_t a1)
{
  uint64_t v2;
  dispatch_queue_t *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  BOOL v7;
  unint64_t v8;
  char v9;
  BOOL v10;
  uint64_t v11;
  dispatch_queue_t *v12;
  uint64_t v13;
  int v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  BOOL v18;
  BOOL v19;
  uint64_t v21;
  void (**v22)(uint64_t, uint64_t);
  int v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;

  v2 = *(_QWORD *)(a1 + 8);
  if (v2)
    v3 = (dispatch_queue_t *)(v2 + 16);
  else
    v3 = (dispatch_queue_t *)a1;
  dispatch_assert_queue_V2(*v3);
  v4 = *(int *)(a1 + 1168);
  v5 = *(_QWORD *)(a1 + 1136);
  v6 = 280 * (int)v4;
  v7 = __CFADD__(v6, v5);
  v8 = v6 + v5;
  v9 = v7;
  v10 = v8 >= v5;
  if (v4 < 0)
    v10 = v9;
  if (!v10)
    goto LABEL_33;
  if (!*(_QWORD *)(v5 + 280 * (int)v4 + 232))
    return;
  v11 = *(_QWORD *)(a1 + 8);
  v12 = (dispatch_queue_t *)(v11 ? v11 + 16 : a1);
  dispatch_assert_queue_V2(*v12);
  v13 = *(int *)(a1 + 1168);
  v14 = v13;
  v15 = *(_QWORD *)(a1 + 1136);
  v16 = 280 * (int)v13;
  v7 = __CFADD__(v16, v15);
  v17 = v16 + v15;
  v18 = v7;
  v19 = v17 >= v15;
  if (!(v13 >= 0 ? v19 : v18))
    goto LABEL_33;
  v21 = v15 + 280 * v14;
  sub_10000FFE8(v21);
  v22 = *(void (***)(uint64_t, uint64_t))(a1 + 8);
  if (v22)
  {
    (*v22)(a1, v21);
  }
  else
  {
    if (__OFADD__(v14, 1))
    {
LABEL_35:
      __break(0x5500u);
LABEL_36:
      __break(0x5503u);
      return;
    }
    v23 = *(_DWORD *)(a1 + 1172);
    if (v14 == 0x7FFFFFFF && v23 == -1)
      goto LABEL_36;
    v14 = (v14 + 1) % v23;
    *(_DWORD *)(a1 + 1168) = v14;
    if (!v14)
      sub_100003164(a1, 0);
  }
  sub_10000F028(a1, v14);
  v24 = *(_QWORD *)(a1 + 1136);
  v25 = 280 * v14;
  if ((v14 & 0x80000000) == 0)
  {
    if (v25 <= ~v24)
      goto LABEL_30;
LABEL_33:
    __break(0x5513u);
    goto LABEL_34;
  }
  if (v25 <= ~v24)
    goto LABEL_33;
LABEL_30:
  if (*(_QWORD *)(v24 + 280 * v14 + 232))
  {
LABEL_34:
    v26 = _os_assert_log(0);
    _os_crash(v26);
    __break(1u);
    goto LABEL_35;
  }
}

void sub_10000F028(uint64_t a1, int a2)
{
  unint64_t v2;
  uint64_t v3;
  BOOL v4;
  unint64_t v5;
  int v6;
  _BOOL4 v7;
  int *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  unint64_t v16;

  v2 = *(_QWORD *)(a1 + 1136);
  v3 = 280 * a2;
  v4 = __CFADD__(v3, v2);
  v5 = v3 + v2;
  v6 = v4;
  v7 = v5 >= v2;
  if (a2 < 0)
    v7 = v6;
  if (!v7)
  {
LABEL_17:
    __break(0x5513u);
    return;
  }
  v10 = (int *)(v2 + 280 * a2 + 268);
  if (*v10 >= 1)
  {
    v11 = 0;
    v12 = 0;
    v13 = (_QWORD *)(v2 + 280 * a2 + 272);
    v14 = *v13;
    while (!__CFADD__(v14, v11))
    {
      free(*(void **)(v14 + v11));
      v14 = *v13;
      if (__CFADD__(*v13, v11))
        break;
      v15 = (_QWORD *)(v14 + v11);
      ++v12;
      *v15 = 0;
      v15[1] = 0;
      v11 += 16;
      if (v12 >= *v10)
        goto LABEL_12;
    }
    goto LABEL_17;
  }
LABEL_12:
  v16 = v2 + 280 * a2;
  *(_QWORD *)(v16 + 232) = 0;
  *v10 = 1;
  *(_OWORD *)(v16 + 248) = xmmword_100024370;
  if (!*(_BYTE *)(a1 + 1240))
  {
    if (qword_10003A8C8 != -1)
      dispatch_once(&qword_10003A8C8, &stru_100029760);
    dispatch_async((dispatch_queue_t)qword_10003A8D0, &stru_1000296A0);
  }
  sub_10000F298(*(_QWORD *)(v2 + 280 * a2 + 224));
}

uint64_t sub_10000F168(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v4;

  v4 = (char *)(a3 + 2);
  sub_10000CA8C(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_WORD *)a3, (char *)(a3 + 2));
  return sub_10000C62C(*(_QWORD *)(a1 + 32), v4);
}

unsigned int *sub_10000F1A4(uint64_t a1, uint64_t a2)
{
  int v4;
  uint64_t v5;
  unsigned int *v6;
  _QWORD v8[6];
  _WORD v9[2];
  int v10;
  uint64_t v11;
  int v12;
  int v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;

  v9[0] = 0;
  v9[1] = *(unsigned __int8 *)(a2 + 72);
  v10 = *(_DWORD *)(a2 + 20);
  v11 = *(_QWORD *)(a2 + 32);
  v4 = *(_DWORD *)(a2 + 4);
  v12 = *(_DWORD *)(a2 + 28);
  v13 = v4;
  v14 = *(_OWORD *)(a2 + 40);
  v16 = 0;
  v17 = 0;
  v15 = *(_OWORD *)(a2 + 56);
  v5 = sub_10000D26C(*(_QWORD *)(a1 + 32), (uint64_t)v9);
  sub_10000D8F8(*(_QWORD *)(a1 + 32), v5);
  v6 = *(unsigned int **)(a2 + 80);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 0x40000000;
  v8[2] = sub_10000F168;
  v8[3] = &unk_100029BB0;
  v8[4] = *(_QWORD *)(a1 + 32);
  v8[5] = v5;
  return sub_10000B778(v6, (uint64_t)v8);
}

void sub_10000F298(uint64_t a1)
{
  unsigned int **v2;
  unsigned int *v3;

  sub_10000F504(*(_QWORD **)(a1 + 16));
  sub_10000F4AC(*(_QWORD *)(a1 + 24));
  *(_QWORD *)(a1 + 32) = 0;
  sub_10000F32C(*(_QWORD **)(a1 + 40), (uint64_t (*)(_QWORD))sub_10000F3BC);
  v2 = *(unsigned int ***)(a1 + 64);
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = 0;
  if (v2)
  {
    do
    {
      v3 = *v2;
      sub_10000F3FC(v2[6], 0);
      sub_10000F3FC(v2[5], 0);
      free(v2);
      v2 = (unsigned int **)v3;
    }
    while (v3);
  }
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 72) = a1 + 64;
  *(_QWORD *)(a1 + 80) = 0;
  *(_QWORD *)(a1 + 8) = -1;
}

_QWORD *sub_10000F32C(_QWORD *result, uint64_t (*a2)(_QWORD))
{
  _QWORD *v3;
  _QWORD *i;
  _QWORD *v5;
  uint64_t v6;
  uint64_t j;

  if (result)
  {
    v3 = result;
    if (a2)
    {
      for (i = (_QWORD *)result[2]; i; i = (_QWORD *)*i)
        result = (_QWORD *)a2(i[4]);
    }
    if (v3[3])
    {
      result = (_QWORD *)v3[2];
      if (result)
      {
        do
        {
          v5 = (_QWORD *)*result;
          operator delete(result);
          result = v5;
        }
        while (v5);
      }
      v3[2] = 0;
      v6 = v3[1];
      if (v6)
      {
        for (j = 0; j != v6; ++j)
          *(_QWORD *)(*v3 + 8 * j) = 0;
      }
      v3[3] = 0;
    }
  }
  return result;
}

void sub_10000F3BC(unsigned int **a1)
{
  sub_10000F3FC(a1[7], (void (*)(_QWORD))&_free);
  sub_10000F3FC(a1[8], (void (*)(_QWORD))&_free);
  free(a1);
}

void sub_10000F3FC(unsigned int *a1, void (*a2)(_QWORD))
{
  unint64_t v3;
  unint64_t i;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;

  if (!*((_QWORD *)a1 + 2))
    goto LABEL_12;
  v3 = *a1;
  if ((_DWORD)v3)
  {
    for (i = 0; i < v3; ++i)
    {
      v6 = *(_QWORD **)(*((_QWORD *)a1 + 2) + 8 * i);
      if (v6)
      {
        do
        {
          v7 = (_QWORD *)*v6;
          if (a2)
            a2(v6[2]);
          free(v6);
          --a1[1];
          v6 = v7;
        }
        while (v7);
        v3 = *a1;
      }
    }
  }
  if (!a1[1])
  {
    free(*((void **)a1 + 2));
LABEL_12:
    free(a1);
    return;
  }
  v8 = _os_assert_log(0);
  _os_crash(v8);
  __break(1u);
}

void sub_10000F4AC(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;

  if (a1 && *(_QWORD *)(a1 + 24))
  {
    sub_10000F56C(*(void ***)(a1 + 16));
    *(_QWORD *)(a1 + 16) = 0;
    v2 = *(_QWORD *)(a1 + 8);
    if (v2)
    {
      for (i = 0; i != v2; ++i)
        *(_QWORD *)(*(_QWORD *)a1 + 8 * i) = 0;
    }
    *(_QWORD *)(a1 + 24) = 0;
  }
}

_QWORD *sub_10000F504(_QWORD *result)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t i;

  if (result)
  {
    v1 = result;
    if (result[3])
    {
      result = (_QWORD *)result[2];
      if (result)
      {
        do
        {
          v2 = (_QWORD *)*result;
          operator delete(result);
          result = v2;
        }
        while (v2);
      }
      v1[2] = 0;
      v3 = v1[1];
      if (v3)
      {
        for (i = 0; i != v3; ++i)
          *(_QWORD *)(*v1 + 8 * i) = 0;
      }
      v1[3] = 0;
    }
  }
  return result;
}

void sub_10000F56C(void **__p)
{
  void **v1;
  void **v2;

  if (__p)
  {
    v1 = __p;
    do
    {
      v2 = (void **)*v1;
      if (*((char *)v1 + 39) < 0)
        operator delete(v1[2]);
      operator delete(v1);
      v1 = v2;
    }
    while (v2);
  }
}

void sub_10000F5B0(unsigned int **a1)
{
  sub_10000F3FC(a1[10], (void (*)(_QWORD))&_free);
  free(a1);
}

void sub_10000F5E0(uint64_t a1, NSObject *a2, NSObject **a3)
{
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD v9[6];
  _QWORD block[5];

  dispatch_assert_queue_V2(*(dispatch_queue_t *)a1);
  v6 = *(_QWORD *)(a1 + 8);
  sub_10000ED60(a1);
  if (v6)
  {
    v7 = *(NSObject **)(v6 + 16);
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = sub_100010560;
    block[3] = &unk_1000299C8;
    block[4] = a1;
    dispatch_group_async(a2, v7, block);
  }
  else
  {
    v8 = *a3;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 0x40000000;
    v9[2] = sub_10001097C;
    v9[3] = &unk_100029A08;
    v9[4] = a3;
    v9[5] = a1;
    dispatch_sync(v8, v9);
  }
}

void sub_10000F6D8(uint64_t a1, size_t __n)
{
  size_t prime;
  int8x8_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  size_t v9;
  uint8x8_t v10;
  unint64_t v11;
  uint8x8_t v12;
  uint64_t v13;
  _QWORD *v14;
  size_t v15;
  void *v16;

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
  if (prime <= *(_QWORD *)&v4)
  {
    if (prime >= *(_QWORD *)&v4)
      return;
    v11 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(_QWORD *)&v4 < 3uLL || (v12 = (uint8x8_t)vcnt_s8(v4), v12.i16[0] = vaddlv_u8(v12), v12.u32[0] > 1uLL))
    {
      v11 = std::__next_prime(v11);
    }
    else
    {
      v13 = 1 << -(char)__clz(v11 - 1);
      if (v11 >= 2)
        v11 = v13;
    }
    if (prime <= v11)
      prime = v11;
    if (prime >= *(_QWORD *)&v4)
      return;
    if (!prime)
    {
      v16 = *(void **)a1;
      *(_QWORD *)a1 = 0;
      if (v16)
        operator delete(v16);
      *(_QWORD *)(a1 + 8) = 0;
      return;
    }
  }
  if (prime >> 61)
    sub_100020724();
  v5 = operator new(8 * prime);
  v6 = *(void **)a1;
  *(_QWORD *)a1 = v5;
  if (v6)
    operator delete(v6);
  v7 = 0;
  *(_QWORD *)(a1 + 8) = prime;
  do
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v7++) = 0;
  while (prime != v7);
  v8 = *(_QWORD **)(a1 + 16);
  if (v8)
  {
    v9 = v8[1];
    v10 = (uint8x8_t)vcnt_s8((int8x8_t)prime);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      if (v9 >= prime)
        v9 %= prime;
    }
    else
    {
      v9 &= prime - 1;
    }
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v9) = a1 + 16;
    v14 = (_QWORD *)*v8;
    if (*v8)
    {
      do
      {
        v15 = v14[1];
        if (v10.u32[0] > 1uLL)
        {
          if (v15 >= prime)
            v15 %= prime;
        }
        else
        {
          v15 &= prime - 1;
        }
        if (v15 != v9)
        {
          if (!*(_QWORD *)(*(_QWORD *)a1 + 8 * v15))
          {
            *(_QWORD *)(*(_QWORD *)a1 + 8 * v15) = v8;
            goto LABEL_31;
          }
          *v8 = *v14;
          *v14 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v15);
          **(_QWORD **)(*(_QWORD *)a1 + 8 * v15) = v14;
          v14 = v8;
        }
        v15 = v9;
LABEL_31:
        v8 = v14;
        v14 = (_QWORD *)*v14;
        v9 = v15;
      }
      while (v14);
    }
  }
}

void sub_10000F8D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  os_unfair_lock_s *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unsigned __int16 *v11;

  v7 = (os_unfair_lock_s *)(a1 + 124);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 124));
  if (a3)
  {
    if ((*(unsigned int (**)(uint64_t))(a3 + 16))(a3))
    {
      v8 = *(_QWORD *)(a1 + 48);
      v9 = *(_QWORD *)(v8 + 456);
      if (v9)
      {
        do
        {
          v10 = __clz(__rbit64(v9));
          v11 = (unsigned __int16 *)(v8 + (v10 << 12));
          v9 &= ~(1 << v10);
        }
        while ((*v11 < 0x11u
              || !v11[19]
              || *((_BYTE *)v11 + 6) != 3
              || (*(unsigned int (**)(uint64_t))(a4 + 16))(a4))
             && v9);
      }
    }
  }
  os_unfair_lock_unlock(v7);
}

uint64_t sub_10000F980(uint64_t a1, const void *a2)
{
  sub_100009060(*(_QWORD *)(a1 + 32), a2);
  return 1;
}

BOOL sub_10000F99C(id a1)
{
  return 1;
}

uint64_t sub_10000F9A4(unsigned __int8 *a1, unsigned int a2, char *__str)
{
  uint64_t result;
  char *v7;
  size_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;

  if (qword_10003A9B0 != -1)
    dispatch_once(&qword_10003A9B0, &stru_10002A6F0);
  result = snprintf(__str, 0x400uLL, "%s/", (const char *)qword_10003A9A8);
  v7 = &__str[(int)result];
  v8 = 1024 - (int)result;
  if (a2 - 1 >= 2)
  {
    if (a2 != 3)
    {
LABEL_12:
      qword_10002DF48 = (uint64_t)"BUG IN LIBTRACE: Invalid type";
      qword_10002DF78 = a2;
      __break(1u);
      return result;
    }
    result = snprintf(v7, v8, "dsc");
    v9 = 0;
  }
  else
  {
    result = snprintf(v7, v8, "%02X", *a1);
    v9 = 1;
  }
  v10 = (int)result + 1;
  if (v10 + 2 * (16 - v9) >= v8)
  {
    qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: Path buffer is too small";
    qword_10002DF78 = v8;
    __break(1u);
    goto LABEL_12;
  }
  v7[(int)result] = 47;
  v11 = &v7[v10];
  do
  {
    *v11 = a0123456789abcd[(unint64_t)a1[v9] >> 4];
    v11[1] = a0123456789abcd[a1[v9] & 0xF];
    v11 += 2;
    ++v9;
  }
  while (v9 != 16);
  *v11 = 0;
  return result;
}

uint64_t sub_10000FB30(uint64_t result)
{
  void **v1;
  _QWORD *v2;
  _QWORD *v3;
  void *v4;

  if (result)
  {
    v1 = (void **)result;
    v2 = *(_QWORD **)(result + 16);
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
    v4 = *v1;
    *v1 = 0;
    if (v4)
      operator delete(v4);
    operator delete();
  }
  return result;
}

uint64_t sub_10000FBD4(uint64_t a1)
{
  vm_deallocate(mach_task_self_, *(_QWORD *)(a1 + 48), 0x40000uLL);
  *(_QWORD *)(a1 + 48) = 0;
  return (*((uint64_t (**)(void *, uint64_t, uint64_t, _QWORD, _QWORD))off_10002C2A0 + 2))(off_10002C2A0, a1, 6, 0, 0);
}

uint64_t sub_10000FC28(mach_port_t a1, int a2, uint64_t a3, uint64_t a4, int a5)
{
  mach_msg_header_t msg;
  NDR_record_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;

  v8 = a2;
  v7 = NDR_record;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  *(_QWORD *)&msg.msgh_bits = 18;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 11701;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  return mach_msg(&msg, 1, 0x38u, 0, 0, 0, 0);
}

uint64_t sub_10000FC98(uint64_t result)
{
  *(_BYTE *)(result + 143) = 1;
  return result;
}

unint64_t sub_10000FCA4(uint64_t a1, unint64_t a2)
{
  unint64_t *v2;
  unint64_t result;

  v2 = (unint64_t *)(a1 + 88);
  do
    result = __ldxr(v2);
  while (__stxr(a2, v2));
  return result;
}

void sub_10000FCB8(_OWORD *a1)
{
  _QWORD v1[4];
  __int128 v2;
  unsigned __int8 v3[24];

  *(_OWORD *)v3 = *a1;
  if (!sub_10000FD54(v3))
  {
    v1[0] = _NSConcreteStackBlock;
    v1[1] = 0x40000000;
    v1[2] = sub_10001566C;
    v1[3] = &unk_1000297E8;
    v2 = *(_OWORD *)v3;
    dispatch_async((dispatch_queue_t)qword_10003A8E8, v1);
  }
}

BOOL sub_10000FD54(unsigned __int8 *a1)
{
  char __b[1024];

  if (qword_10003A9D8 != -1)
    dispatch_once(&qword_10003A9D8, &stru_10002A8D8);
  if (!byte_10003A9E0)
    return 0;
  memset(__b, 170, sizeof(__b));
  sub_10000F9A4(a1, 3u, __b);
  return access(__b, 0) == 0;
}

void *sub_10000FE14(uint64_t a1, char *__s)
{
  size_t v4;
  uint64_t v5;
  void *result;
  unint64_t v7;

  v4 = strlen(__s);
  v5 = _os_trace_calloc(1, v4 + 145);
  *(_DWORD *)(v5 + 132) = 0;
  *(_QWORD *)(v5 + 16) = 0;
  *(_QWORD *)(v5 + 24) = v5 + 16;
  *(_QWORD *)(v5 + 64) = a1;
  result = memcpy((void *)(v5 + 138), __s, v4);
  *(_QWORD *)(v5 + 88) = 0;
  v7 = v5 + 88;
  if ((unint64_t)(v5 + 88) >= 0xFFFFFFFFFFFFFFF8
    || (*(_QWORD *)(v5 + 96) = 0, v7 >= 0xFFFFFFFFFFFFFFF0)
    || (*(_QWORD *)(v5 + 104) = 0, v7 >= 0xFFFFFFFFFFFFFFE8)
    || (*(_QWORD *)(v5 + 112) = 0, v7 >= 0xFFFFFFFFFFFFFFE0))
  {
    __break(0x5513u);
  }
  else
  {
    *(_QWORD *)(v5 + 120) = 0;
    return (void *)v5;
  }
  return result;
}

void sub_10000FEBC(uint64_t a1)
{
  int v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  BOOL v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  sub_10000EEA0(*(_QWORD *)(a1 + 32));
  if (__OFADD__(v2, 1))
    goto LABEL_25;
  v3 = *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1172);
  if (v2 == 0x7FFFFFFF && (_DWORD)v3 == -1)
    goto LABEL_26;
  v5 = (v2 + 1) % (int)v3;
  if ((v3 & 0x80000000) == 0)
  {
    v6 = v5;
    v7 = 280 * v5;
    do
    {
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1136);
      v9 = __CFADD__(v7, v8);
      v10 = v7 + v8 >= v8;
      if (v6 < 0)
        v10 = v9;
      if (!v10)
        goto LABEL_24;
      if (*(_QWORD *)(v8 + v7 + 232))
      {
        sub_10000FFE8(v8 + v7);
        (**(void (***)(void))(*(_QWORD *)(a1 + 40) + 8))();
      }
      ++v6;
      v7 += 280;
    }
    while (v6 < v3);
  }
  if (v5 >= 1)
  {
    v11 = 0;
    v12 = 280 * v5;
    while (1)
    {
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1136);
      if (__CFADD__(v13, v11))
        break;
      if (*(_QWORD *)(v13 + v11 + 232))
      {
        sub_10000FFE8(v13 + v11);
        (**(void (***)(void))(*(_QWORD *)(a1 + 40) + 8))();
      }
      v11 += 280;
      if (v12 == v11)
        return;
    }
LABEL_24:
    __break(0x5513u);
LABEL_25:
    __break(0x5500u);
LABEL_26:
    __break(0x5503u);
  }
}

void sub_10000FFE8(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = sub_10000A9EC(*(void ***)(a1 + 224));
  if (v2)
  {
    v3 = v2[1];
    if ((v3 & 7) != 0)
      v4 = (v3 & 0xFFFFFFFFFFFFFFF8) + 24;
    else
      v4 = v3 + 16;
    sub_10000E618(a1, (uint64_t)v2, v4, 0);
  }
  else
  {
    v5 = _os_assert_log(0);
    _os_crash(v5);
    __break(1u);
  }
}

void sub_100010040(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  int *v21;
  int v22;
  int *v24;
  int v25;
  char __b[1024];

  v2 = a1;
  v3 = *(_QWORD *)(a1 + 8);
  if (!*(_BYTE *)(v3 + 88))
  {
    v5 = *(_QWORD *)(v3 + 48);
    if (v5)
    {
      v6 = *(_QWORD *)(v3 + 40);
      v7 = *(_QWORD *)(a2 + 232);
      v8 = __OFADD__(v6, v7);
      v9 = v6 + v7;
      if (v8)
        goto LABEL_39;
      if (v9 > v5)
      {
        sub_100010734(*(_QWORD *)(a1 + 8));
        sub_100003164(v2, v3);
      }
    }
    v10 = *(_QWORD *)(a2 + 248);
    if (v10 < *(_QWORD *)(v3 + 72))
      *(_QWORD *)(v3 + 72) = v10;
    v11 = *(_QWORD *)(a2 + 256);
    if (v11 > *(_QWORD *)(v3 + 80))
      *(_QWORD *)(v3 + 80) = v11;
    v12 = *(unsigned int *)(v3 + 68);
    if ((_DWORD)v12 != -1)
    {
LABEL_13:
      if (*(_QWORD *)(v3 + 40))
        goto LABEL_17;
      a1 = _os_trace_write();
      if (a1 == -1)
        goto LABEL_35;
      v13 = *(_QWORD *)(v3 + 40);
      v8 = __OFADD__(v13, a1);
      v14 = v13 + a1;
      if (!v8)
      {
        *(_QWORD *)(v3 + 40) = v14;
        v12 = *(unsigned int *)(v3 + 68);
LABEL_17:
        a1 = _os_trace_writev(v12, *(_QWORD *)(a2 + 272), *(unsigned int *)(a2 + 264));
        if (a1 != -1)
        {
          v15 = *(_QWORD *)(v3 + 40);
          v8 = __OFADD__(v15, a1);
          v16 = v15 + a1;
          if (!v8)
          {
            *(_QWORD *)(v3 + 40) = v16;
            sub_10001037C(v3);
            return;
          }
          goto LABEL_39;
        }
LABEL_35:
        v24 = __error();
        _os_assumes_log(*v24);
        return;
      }
LABEL_39:
      __break(0x5500u);
      goto LABEL_40;
    }
    v17 = *(_QWORD *)(v3 + 96);
    if (*(_DWORD *)(v3 + 64) > *(_DWORD *)(v3 + 92) || *(_QWORD *)(v3 + 56) > v17)
    {
      v18 = openat(dword_10002DBF8, *(const char **)(v3 + 8), 1048832);
      if ((_DWORD)v18 == -1)
      {
        a1 = *__error();
      }
      else
      {
        v19 = v18;
        if ((v18 & 0x80000000) != 0)
          goto LABEL_27;
        sub_100016B64(v3, 0, 0x7FFFFFFFFFFFFFFFLL, v17, v18);
        if (close(v19) != -1)
          goto LABEL_27;
        v25 = *__error();
        a1 = *__error();
        if (v25 == 9)
        {
LABEL_40:
          qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
          qword_10002DF78 = a1;
          __break(1u);
          return;
        }
      }
      _os_assumes_log(a1);
    }
LABEL_27:
    memset(__b, 170, sizeof(__b));
    while (1)
    {
      v20 = *(_QWORD *)(v3 + 24);
      *(_QWORD *)(v3 + 24) = v20 + 1;
      snprintf(__b, 0x400uLL, "%s/%016llx.tracev3", *(const char **)(v3 + 8), v20);
      v12 = sub_100001594(dword_10002DBF8, __b, 2569);
      *(_DWORD *)(v3 + 68) = v12;
      if ((_DWORD)v12 != -1)
        goto LABEL_13;
      v21 = __error();
      _os_assumes_log(*v21);
      v22 = *__error();
      if (v22 != 4 && v22 != 17)
      {
        if (v22)
          return;
        v12 = *(unsigned int *)(v3 + 68);
        goto LABEL_13;
      }
    }
  }
  if (*(_DWORD *)(v3 + 68) == -1)
  {
    memset(__b, 170, sizeof(__b));
    snprintf(__b, 0x400uLL, "%s: writes blocked (and dropped) for %s/%016llx.tracev3", "_logd_book_persist_handler", *(const char **)(v3 + 8), *(_QWORD *)(v3 + 24));
    sub_100013FF0((uint64_t)__b);
  }
  else
  {
    memset(__b, 170, sizeof(__b));
    snprintf(__b, 0x400uLL, "%s: writes blocked (and dropped), %s/%016llx.tracev3 unexpectedly already open", "_logd_book_persist_handler", *(const char **)(v3 + 8), *(_QWORD *)(v3 + 24) - 1);
    sub_100013FF0((uint64_t)__b);
    sub_100010734(v3);
    sub_100003164(v2, v3);
  }
}

uint64_t sub_10001037C(uint64_t a1)
{
  const char *boot_uuid;
  int v3;
  uint64_t result;
  int *v5;
  __int128 v6;
  int value;
  _BYTE v8[20];
  __int128 v9;

  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  boot_uuid = (const char *)_os_trace_get_boot_uuid();
  uuid_parse(boot_uuid, (unsigned __int8 *)&v6);
  v3 = *(_DWORD *)(a1 + 68);
  *(_QWORD *)&v8[12] = 0xAAAAAAAAAAAAAAAALL;
  value = 1;
  v9 = *(_OWORD *)(a1 + 72);
  *(_OWORD *)v8 = v6;
  result = fsetxattr(v3, "com.apple.logd.metadata", &value, 0x28uLL, 0, 0);
  if ((_DWORD)result == -1)
  {
    v5 = __error();
    return _os_assumes_log(*v5);
  }
  return result;
}

uint64_t sub_100010434(uint64_t a1)
{
  return sub_10000ADFC(*(dispatch_queue_t **)(a1 + 32), *(char **)(a1 + 40), *(_QWORD *)(a1 + 48), *(void **)(a1 + 56));
}

_DWORD *sub_100010444(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    goto LABEL_6;
  }
  *(_QWORD *)(a2 + 32) = 0x13000000000000;
  result = (_DWORD *)sub_1000104E0(result[3], (_DWORD *)(a2 + 28), (_QWORD *)(a2 + 48));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
LABEL_6:
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }
  *(NDR_record_t *)(a2 + 40) = NDR_record;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 56;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

uint64_t sub_1000104E0(uint64_t a1, _DWORD *a2, _QWORD *a3)
{
  *a2 = dword_10002C2BC;
  *a3 = qword_10002C2C0;
  return 0;
}

uint64_t sub_100010500(uint64_t a1)
{
  return sub_10000ADFC(*(dispatch_queue_t **)(a1 + 32), *(char **)(a1 + 40), *(_QWORD *)(a1 + 48), *(void **)(a1 + 56));
}

uint64_t sub_100010510(int a1, uint64_t a2, char *__s2)
{
  return strcmp((const char *)(a2 + 32), __s2);
}

uint64_t sub_10001051C(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  BOOL v4;
  unsigned int v5;

  v2 = *(_QWORD *)(*(_QWORD *)a2 + 24);
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 24);
  v4 = v2 > v3;
  if (v2 == v3)
    v5 = 0;
  else
    v5 = -1;
  if (v4)
    return 1;
  else
    return v5;
}

void sub_10001053C(uint64_t a1)
{
  sub_10000E0B0(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

uint64_t sub_10001054C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return strcmp((const char *)(a2 + 32), (const char *)(a3 + 32));
}

void sub_100010560(uint64_t a1)
{
  sub_10000EEA0(*(_QWORD *)(a1 + 32));
}

uint64_t sub_100010568()
{
  uint64_t result;
  int *v1;

  result = dword_10002C34C;
  if ((dword_10002C34C & 0x80000000) == 0)
  {
    result = _os_trace_write();
    if (result == -1)
    {
      v1 = __error();
      return _os_assumes_log(*v1);
    }
  }
  return result;
}

uint64_t sub_1000105A8(uint64_t a1, _DWORD *a2)
{
  uint64_t context;
  uint64_t v4;
  uint64_t result;

  context = dispatch_mach_mig_demux_get_context();
  if (!context)
    return 5;
  v4 = context;
  result = 0;
  *a2 = *(unsigned __int8 *)(v4 + 143) == 0;
  return result;
}

_QWORD *sub_1000105EC(void **a1)
{
  _QWORD *result;
  _QWORD *v3;
  _QWORD *v4;
  void *v5;

  result = sub_10000F504(a1);
  if (a1)
  {
    v3 = a1[2];
    if (v3)
    {
      do
      {
        v4 = (_QWORD *)*v3;
        operator delete(v3);
        v3 = v4;
      }
      while (v4);
    }
    v5 = *a1;
    *a1 = 0;
    if (v5)
      operator delete(v5);
    operator delete();
  }
  return result;
}

BOOL sub_100010658()
{
  _BOOL8 result;

  if (byte_10003A9C1)
    return 1;
  if (qword_10003A9B8 != -1)
    dispatch_once(&qword_10003A9B8, &stru_10002A858);
  if (byte_10003A9C0)
    result = MKBDeviceUnlockedSinceBoot() == 1;
  else
    result = 1;
  byte_10003A9C1 = result;
  return result;
}

void sub_1000106D0()
{
  os_unfair_lock_lock_with_options(&stru_10002DFA0, 0x10000);
  sub_100003E60();
  dword_10002C348 = sub_100003EA0(dword_10002C348, "logdata.statistics.0.txt", "logdata.statistics.1.txt", 0x100000);
  os_unfair_lock_unlock(&stru_10002DFA0);
}

uint64_t sub_100010734(uint64_t result)
{
  uint64_t v1;
  int v2;
  BOOL v3;
  int v4;
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  int v8;

  v1 = result;
  if ((*(_DWORD *)(result + 68) & 0x80000000) != 0)
    goto LABEL_7;
  sub_10001037C(result);
  result = close(*(_DWORD *)(v1 + 68));
  if ((_DWORD)result == -1)
  {
    v8 = *__error();
    result = *__error();
    if (v8 == 9)
      goto LABEL_11;
    result = _os_assumes_log(result);
  }
  *(_DWORD *)(v1 + 68) = -1;
  v2 = *(_DWORD *)(v1 + 64);
  v3 = __OFADD__(v2, 1);
  v4 = v2 + 1;
  if (!v3)
  {
    *(_DWORD *)(v1 + 64) = v4;
    v5 = *(_QWORD *)(v1 + 40);
    v6 = (unint64_t *)(v1 + 56);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + v5, v6));
    if (!__OFADD__(v7, v5))
    {
LABEL_7:
      *(_QWORD *)(v1 + 40) = 0;
      *(_OWORD *)(v1 + 72) = xmmword_100024370;
      return result;
    }
  }
  __break(0x5500u);
LABEL_11:
  qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_10002DF78 = result;
  __break(1u);
  return result;
}

void sub_100010804(id a1, void *a2)
{
  xpc_type_t type;

  type = xpc_get_type(a2);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    sub_100001694((_xpc_connection_s *)a2);
  }
  else
  {
    qword_10002DF48 = (uint64_t)"BUG IN LIBTRACE: Unexpected xpc object";
    qword_10002DF78 = (uint64_t)type;
    __break(1u);
  }
}

void sub_100010864(uint64_t a1)
{
  (*(void (**)(void))(**(_QWORD **)(a1 + 32) + 16))();
  sub_100001DB0(*(_QWORD *)(a1 + 32), 1u);
  if (off_10002C2B0)
    sub_100002A88((unint64_t)off_10002C2B0);
}

void sub_1000108C4(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD block[5];

  (*(void (**)(void))(**(_QWORD **)(a1 + 32) + 16))();
  sub_100001DB0(*(_QWORD *)(a1 + 32), 0);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_100010864;
  block[3] = &unk_100028DC0;
  block[4] = v2;
  dispatch_group_async(v3, (dispatch_queue_t)qword_10002C288, block);
}

BOOL sub_10001095C(id a1, char **a2, unint64_t *a3)
{
  *a2 = 0;
  *a3 = 0;
  return byte_10003A808 & 1;
}

void sub_10001097C(int8x16_t *a1)
{
  int8x16_t v2;
  uint64_t v3;
  NSObject *v4;
  _QWORD block[4];
  int8x16_t v6;

  sub_10000ED60(a1[2].i64[0]);
  block[1] = 0x40000000;
  v2 = vextq_s8(a1[2], a1[2], 8uLL);
  v3 = a1[2].i64[0];
  block[0] = _NSConcreteStackBlock;
  block[2] = sub_10000FEBC;
  block[3] = &unk_1000299E8;
  v4 = *(NSObject **)(*(_QWORD *)(v3 + 8) + 16);
  v6 = v2;
  dispatch_sync(v4, block);
}

void sub_100010A20(uint64_t a1)
{
  uint64_t v2;

  sub_10000ED60(*(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
    dispatch_async(*(dispatch_queue_t *)(v2 + 16), *(dispatch_block_t *)(a1 + 32));
}

void sub_100010A60(uint64_t a1)
{
  sub_10000EEA0(*(_QWORD *)(a1 + 32));
}

_DWORD *sub_100010A68(_DWORD *result, uint64_t a2)
{
  NDR_record_t v3;

  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    v3 = NDR_record;
  }
  else
  {
    result = (_DWORD *)sub_1000105A8(result[3], (_DWORD *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    v3 = NDR_record;
    if (!(_DWORD)result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 40;
      return result;
    }
  }
  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

uint64_t sub_100010B08(uint64_t result)
{
  *(_BYTE *)(result + 147) = 1;
  return result;
}

void sub_100010B14(int a1, const void *a2)
{
  NSObject *v4;
  NSObject *initially_inactive;
  uint64_t f;
  unint64_t StatusReg;
  int v8;
  int v9;
  int v10;
  unint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  char *v17;
  uint64_t *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;

  v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  initially_inactive = dispatch_queue_attr_make_initially_inactive(v4);
  qword_10002C280 = (uint64_t)dispatch_queue_create_with_target_V2("com.apple.firehose.snapshot-gate", v4, 0);
  qword_10002C290 = (uint64_t)dispatch_workloop_create_inactive("com.apple.firehose.io-wl");
  dispatch_set_qos_class_fallback();
  dispatch_activate((dispatch_object_t)qword_10002C290);
  qword_10002C288 = (uint64_t)dispatch_queue_create_with_target_V2("com.apple.firehose.drain-io", v4, (dispatch_queue_t)qword_10002C290);
  qword_10002C298 = (uint64_t)dispatch_queue_create_with_target_V2("com.apple.firehose.drain-mem", initially_inactive, 0);
  dispatch_set_qos_class_fallback();
  dispatch_activate((dispatch_object_t)qword_10002C298);
  f = dispatch_mach_create_f("com.apple.firehose.listener", qword_10002C298, 0, sub_100004D54);
  dword_10002C270[0] = a1;
  qword_10002C278 = f;
  off_10002C2A0 = _Block_copy(a2);
  v20 = 0;
  v21 = 0;
  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  while (1)
  {
    v8 = open_NOCANCEL("/dev/oslog", 2);
    if ((v8 & 0x80000000) == 0)
      break;
    v9 = **(_DWORD **)(StatusReg + 8);
    if (v9 != 4)
    {
      if (v9 != 2)
        sub_1000225EC(v9);
      goto LABEL_12;
    }
  }
  v10 = v8;
  v11 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  while (ioctl(v10, 0x4010744FuLL, &v20) < 0)
  {
    v12 = **(_DWORD **)(v11 + 8);
    if (v12 != 4)
      sub_100022614(v12);
  }
  if ((unint64_t)(v21 - 262145) <= 0xFFFFFFFFFFFCFFFELL)
    sub_10002263C(v21);
  v13 = v20;
  v14 = _os_object_alloc_realized(OS_firehose_client, 152);
  *(_QWORD *)(v14 + 48) = v13;
  *(_QWORD *)(v14 + 64) = *(_QWORD *)(v13 + 464);
  *(_QWORD *)(v14 + 56) = *(_QWORD *)(v14 + 64);
  *(_QWORD *)(v14 + 80) = *(_QWORD *)(v13 + 488);
  *(_QWORD *)(v14 + 72) = *(_QWORD *)(v14 + 80);
  v15 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, v10, 0, (dispatch_queue_t)qword_10002C298);
  dispatch_set_qos_class_floor(v15, QOS_CLASS_USER_INITIATED, 0);
  dispatch_set_context(v15, (void *)v14);
  dispatch_source_set_event_handler_f(v15, (dispatch_function_t)sub_100002A88);
  *(_QWORD *)(v14 + 96) = v15;
  *(_DWORD *)(v14 + 120) = -1;
  dword_10002C2B8 = v10;
  off_10002C2B0 = (_UNKNOWN *)v14;
LABEL_12:
  v16 = 0;
  v17 = (char *)&unk_10002C2E8;
  do
  {
    v18 = &qword_10002C288;
    if ((v16 & 1) == 0)
      v18 = &qword_10002C298;
    v19 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_data_or, 0, 0, (dispatch_queue_t)*v18);
    dispatch_set_context(v19, v17);
    dispatch_source_set_event_handler_f(v19, (dispatch_function_t)sub_10000841C);
    *(_QWORD *)&dword_10002C270[2 * v16++ + 46] = v19;
    v17 += 16;
  }
  while (v16 != 4);
}

uint64_t sub_100010DC0(unsigned int a1)
{
  uint64_t result;

  if (a1 != 20180226)
    sub_10002268C(a1);
  result = _firehose_spi_version;
  if (_firehose_spi_version != 20180226)
    sub_100022664(_firehose_spi_version);
  return result;
}

BOOL sub_100010DFC()
{
  return !off_10002C2B0 || *((_QWORD *)off_10002C2B0 + 10) != 0;
}

void sub_100010E20()
{
  uint64_t i;
  _QWORD block[5];

  if (off_10002C2B0)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = sub_100010EC0;
    block[3] = &unk_100028D50;
    block[4] = dword_10002C270;
    dispatch_async((dispatch_queue_t)qword_10002C298, block);
  }
  dispatch_mach_connect(qword_10002C278, dword_10002C270[0], 0, 0);
  for (i = 0; i != 8; i += 2)
    dispatch_activate(*(dispatch_object_t *)&dword_10002C270[i + 46]);
}

void sub_100010EC0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  NSObject *v3;
  __int128 v4;
  uint64_t v5;

  v4 = xmmword_100024000;
  v5 = 0;
  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
  dispatch_assert_queue_V2((dispatch_queue_t)qword_10002C298);
  os_unfair_lock_lock_with_options(&unk_10002C2E0, 0x10000);
  *(_QWORD *)(v1 + 16) = 0;
  v2 = off_10002C2D8;
  *(_QWORD *)(v1 + 24) = off_10002C2D8;
  *v2 = v1;
  off_10002C2D8 = (_UNKNOWN **)(v1 + 16);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10002C2E0);
  (*((void (**)(void *, uint64_t, uint64_t, __int128 *, _QWORD))off_10002C2A0 + 2))(off_10002C2A0, v1, 1, &v4, 0);
  v3 = *(NSObject **)(v1 + 96);
  if (*(_DWORD *)(v1 + 128))
  {
    dispatch_mach_connect(v3, *(unsigned int *)(v1 + 112), 0, 0);
    dispatch_mach_connect(*(_QWORD *)(v1 + 104), *(unsigned int *)(v1 + 116), 0, 0);
  }
  else
  {
    dispatch_activate(v3);
  }
}

void sub_100010F9C()
{
  _QWORD *v0;

  dispatch_mach_cancel(qword_10002C278);
  os_unfair_lock_lock_with_options(&unk_10002C2E0, 0x10000);
  v0 = off_10002C2D0;
  if (off_10002C2D0)
  {
    do
    {
      if (*((_DWORD *)v0 + 32))
      {
        dispatch_mach_cancel(v0[12]);
        dispatch_mach_cancel(v0[13]);
      }
      v0 = (_QWORD *)v0[2];
    }
    while (v0);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10002C2E0);
}

void sub_100011000(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  char v4;
  char v5;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  unsigned __int16 *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[8];

  v2 = *(_QWORD *)(a1 + 48);
  if (!*(_BYTE *)(a1 + 144))
  {
    dispatch_assert_queue_V2((dispatch_queue_t)qword_10002C288);
    __dmb(9u);
    v3 = *(_QWORD *)(v2 + 520) & 0xFFFFFFFFFFFFFFFELL;
    v4 = 1;
    do
    {
      v5 = v4;
      v6 = (v4 & 1) == 0;
      if ((v4 & 1) != 0)
        v7 = v2;
      else
        v7 = v2 + 128;
      if (v6)
        v8 = 260;
      else
        v8 = 256;
      v9 = *(unsigned __int16 *)(v2 + v8);
      if (v6)
        v10 = 80;
      else
        v10 = 64;
      v11 = *(_QWORD *)(a1 + v10);
      if ((unsigned __int16)(v11 - v9) > 0x3Fu)
      {
        *(_BYTE *)(a1 + 144) = 1;
        goto LABEL_28;
      }
      if (v9 != (unsigned __int16)v11)
      {
        do
          v3 &= ~(1 << *(_WORD *)(v7 + 2 * (v9++ & 0x3F)));
        while ((unsigned __int16)v9 != (unsigned __int16)v11);
      }
      v4 = 0;
    }
    while ((v5 & 1) != 0);
    if (v3)
    {
      v12 = 0;
      v13 = off_10002C2A8;
      do
      {
        v14 = __clz(__rbit64(v3));
        v15 = (unsigned __int16 *)(v2 + (v14 << 12));
        v16 = *v15;
        v17 = 1 << v14;
        if (v16 >= 0x11 && v15[19])
        {
          v18 = *((unsigned __int8 *)v15 + 7);
          if ((v18 & 2) != 0)
          {
            (*((void (**)(void *, uint64_t, uint64_t, unsigned __int16 *, unint64_t))off_10002C2A0 + 2))(off_10002C2A0, a1, 3, v15, v16 & 0xFF0000000000FFFFLL | (((*(unsigned int *)(v15 + 1) | ((unint64_t)*((unsigned __int8 *)v15+ 6) << 32)) & 0xFFFFFFFFFFLL) << 16) | (v18 << 56));
            if (*(_BYTE *)(a1 + 145))
              (*(void (**)(void))(*(_QWORD *)v13 + 16))();
          }
          else
          {
            v12 |= v17;
          }
        }
        v3 &= ~v17;
      }
      while (v3);
      if (v12)
      {
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 0x40000000;
        v19[2] = sub_10001130C;
        v19[3] = &unk_100028DA0;
        v19[4] = v12;
        v19[5] = v2;
        v19[6] = a1;
        v19[7] = v13;
        dispatch_async((dispatch_queue_t)qword_10002C298, v19);
        return;
      }
    }
  }
LABEL_28:
  sub_1000111FC(a1);
}

uint64_t sub_1000111FC(uint64_t a1)
{
  dispatch_group_t *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = (dispatch_group_t *)off_10002C2A8;
  v3 = *(_QWORD *)(a1 + 48);
  dispatch_assert_queue_V2((dispatch_queue_t)qword_10002C288);
  if (*(_BYTE *)(a1 + 145))
  {
    dispatch_group_leave(v2[1]);
    *(_BYTE *)(a1 + 145) = 0;
  }
  if (*(_BYTE *)(a1 + 146))
  {
    dispatch_group_leave(v2[1]);
    *(_BYTE *)(a1 + 146) = 0;
  }
  if (*(_BYTE *)(a1 + 144))
    (*((void (**)(void *, uint64_t, uint64_t, uint64_t, _QWORD))off_10002C2A0 + 2))(off_10002C2A0, a1, 5, v3, 0);
  (*((void (**)(void *, uint64_t, uint64_t, _QWORD, _QWORD))off_10002C2A0 + 2))(off_10002C2A0, a1, 2, 0, 0);
  os_unfair_lock_lock_with_options(&unk_10002C2E0, 0x10000);
  v4 = *(_QWORD *)(a1 + 16);
  v5 = *(_QWORD **)(a1 + 24);
  if (v4)
  {
    *(_QWORD *)(v4 + 24) = v5;
    v5 = *(_QWORD **)(a1 + 24);
  }
  else
  {
    off_10002C2D8 = *(_UNKNOWN ***)(a1 + 24);
  }
  *v5 = v4;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10002C2E0);
  dispatch_release(*(dispatch_object_t *)(a1 + 96));
  *(_QWORD *)(a1 + 96) = 0;
  dispatch_release(*(dispatch_object_t *)(a1 + 104));
  *(_QWORD *)(a1 + 104) = 0;
  *(_QWORD *)(a1 + 16) = -1985229329;
  *(_QWORD *)(a1 + 24) = -1985229329;
  return _os_object_release_without_xref_dispose(a1);
}

void sub_10001130C(uint64_t a1)
{
  unint64_t i;
  unint64_t v3;

  for (i = *(_QWORD *)(a1 + 32); i; i &= ~(1 << v3))
  {
    v3 = __clz(__rbit64(i));
    (*((void (**)(void *, _QWORD, uint64_t, unint64_t, _QWORD))off_10002C2A0 + 2))(off_10002C2A0, *(_QWORD *)(a1 + 48), 4, *(_QWORD *)(a1 + 40) + (v3 << 12), *(_QWORD *)(*(_QWORD *)(a1 + 40) + (v3 << 12)));
    if (*(_BYTE *)(*(_QWORD *)(a1 + 48) + 146))
      (*(void (**)(void))(**(_QWORD **)(a1 + 56) + 16))();
  }
  dispatch_async_f((dispatch_queue_t)qword_10002C288, *(void **)(a1 + 48), (dispatch_function_t)sub_1000111FC);
}

uint64_t sub_1000113C4(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 11605) >= 0xFFFFFFFB)
    return (uint64_t)*(&off_100028E18 + 5 * (v1 - 11600) + 5);
  else
    return 0;
}

void sub_100011400(id a1)
{
  uint64_t *v1;
  _QWORD *v2;
  uint64_t v3;
  unint64_t v4;
  char v5[1032];

  if (&tb_client_connection_create)
  {
    v1 = (uint64_t *)_os_trace_calloc(1, 8);
    v4 = 0xAAAAAAAAAAAAAAAALL;
    if (exclaves_lookup_service(0, "com.apple.service.LogServer_xnuproxy", &v4))
    {
      memset(&v5[34], 170, 0x3DEuLL);
      strcpy(v5, "Exclaves log server not available");
    }
    else
    {
      v2 = (_QWORD *)_os_trace_calloc(1, 16);
      *v2 = 0;
      v2[1] = v4;
      if (tb_endpoint_create_with_data(8, v2, 0, &stru_100028FC0))
      {
        v3 = tb_client_connection_create_with_endpoint();
        if (!tb_client_connection_activate())
        {
          *v1 = v3;
          qword_10002DF90 = (uint64_t)v1;
          return;
        }
      }
      free(v2);
      memset(&v5[41], 170, 0x3D7uLL);
      strcpy(v5, "Failed to initialize config admin client");
    }
    sub_100013FF0((uint64_t)v5);
    free(v1);
  }
}

void sub_10001155C(id a1, void *a2)
{
  free(a2);
}

uint64_t sub_100011564(uint64_t a1, unsigned int a2, int a3, uint64_t a4)
{
  unint64_t v7;
  uint64_t v8;
  unsigned int *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  _QWORD v16[2];
  uint64_t (*v17)(_QWORD *, unsigned int *);
  void *v18;
  uint64_t v19;
  uint64_t *v20;
  _QWORD *v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[4];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;

  v34 = 0;
  v35 = &v34;
  v36 = 0x2000000000;
  v37 = 1;
  if (a3)
    v7 = a2 - 4;
  else
    v7 = a2;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2000000000;
  v33 = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2000000000;
  v29[3] = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2000000000;
  v28 = 0xAAAAAAAAAAAAAAAALL;
  v28 = _os_trace_calloc(20, 16);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 0x40000000;
  v17 = sub_100011788;
  v18 = &unk_100029010;
  v19 = a4;
  v20 = &v25;
  v21 = v29;
  v22 = &v30;
  v23 = &v34;
  v24 = 20;
  if (v7 >= 0x14)
  {
    v8 = 4;
    if (!a3)
      v8 = 0;
    v9 = (unsigned int *)(a1 + v8);
    do
    {
      v10 = *v9;
      if (v7 < v10)
        break;
      v11 = v9[1];
      if (v11 + 21 > v10)
        break;
      if (__CFADD__(v9 + 5, v11))
        __break(0x5513u);
      if (*((_BYTE *)v9 + v11 + 20))
        break;
      if (!v17(v16, v9))
        break;
      v12 = *v9;
      v9 = (unsigned int *)((char *)v9 + v12);
      v7 -= v12;
    }
    while (v7 > 0x13);
  }
  if (*((_BYTE *)v35 + 24))
  {
    ++v31[3];
    v13 = (*(uint64_t (**)(uint64_t))(a4 + 16))(a4);
    *((_BYTE *)v35 + 24) = v13;
  }
  free((void *)v26[3]);
  v14 = *((unsigned __int8 *)v35 + 24);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(v29, 8);
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
  return v14;
}

uint64_t sub_100011788(_QWORD *a1, unsigned int *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  const Bytef *v9;
  uInt v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  __int128 v17;
  const Bytef *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  _QWORD v23[2];
  uint64_t (*v24)(uint64_t, uint64_t);
  void *v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  unsigned int *v29;
  uint64_t v30;

  v2 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(_QWORD *)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v4 + 1;
  if (~v2 < (unint64_t)(16 * v4) || (unint64_t)(v4 + 0x800000000000000) >> 60 != 0)
    goto LABEL_24;
  v8 = v2 + 16 * v4;
  v9 = (const Bytef *)(a2 + 5);
  v10 = strlen((const char *)a2 + 20);
  *(_DWORD *)v8 = crc32(0, v9, v10);
  *(_DWORD *)(v8 + 4) = 0;
  *(_QWORD *)(v8 + 8) = *(_QWORD *)(a2 + 3);
  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) == a1[9])
  {
    v11 = a1[4];
    ++*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
    if (((*(uint64_t (**)(void))(v11 + 16))() & 1) == 0)
    {
      result = 0;
      *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = 0;
      return result;
    }
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
  }
  v12 = a2[1];
  if ((((_BYTE)v12 + 1) & 3) != 0)
    v13 = v12 - (((_BYTE)v12 + 1) & 3) + 5;
  else
    v13 = v12 + 1;
  if (__CFADD__(v9, v13))
LABEL_24:
    __break(0x5513u);
  v23[0] = _NSConcreteStackBlock;
  v24 = sub_100011998;
  v25 = &unk_100028FE8;
  v15 = a1[8];
  v14 = a1[9];
  v29 = a2;
  v30 = v14;
  v16 = *a2 - v13 - 20;
  v23[1] = 0x40000000;
  v17 = *((_OWORD *)a1 + 3);
  v26 = *((_OWORD *)a1 + 2);
  v27 = v17;
  v28 = v15;
  if (v16 >= 0x14)
  {
    v18 = &v9[v13];
    do
    {
      v19 = *(unsigned int *)v18;
      if (v16 < v19)
        break;
      v20 = *((unsigned int *)v18 + 1);
      if (v20 + 21 > v19)
        break;
      if (__CFADD__(v18 + 20, v20))
        goto LABEL_24;
      if (v18[v20 + 20])
        break;
      if (!v24((uint64_t)v23, (uint64_t)v18))
        break;
      v21 = *(unsigned int *)v18;
      v18 += v21;
      v16 -= v21;
    }
    while (v16 > 0x13);
  }
  return 1;
}

uint64_t sub_100011998(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uInt v10;
  uInt v11;
  int v12;
  uint64_t v13;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24);
  v3 = *(_QWORD *)(*(_QWORD *)(result + 48) + 8);
  v4 = *(_QWORD *)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v4 + 1;
  if (~v2 < (unint64_t)(16 * v4) || (unint64_t)(v4 + 0x800000000000000) >> 60 != 0)
  {
    __break(0x5513u);
    return result;
  }
  v7 = (_QWORD *)result;
  v8 = v2 + 16 * v4;
  v9 = *(_QWORD *)(result + 72);
  v10 = strlen((const char *)(v9 + 20));
  *(_DWORD *)v8 = crc32(0, (const Bytef *)(v9 + 20), v10);
  if (a2)
  {
    v11 = strlen((const char *)(a2 + 20));
    v12 = crc32(0, (const Bytef *)(a2 + 20), v11);
  }
  else
  {
    v12 = 0;
    a2 = v9;
  }
  *(_DWORD *)(v8 + 4) = v12;
  *(_QWORD *)(v8 + 8) = *(_QWORD *)(a2 + 12);
  if (*(_QWORD *)(*(_QWORD *)(v7[6] + 8) + 24) != v7[10])
    return 1;
  v13 = v7[4];
  ++*(_QWORD *)(*(_QWORD *)(v7[7] + 8) + 24);
  if (((*(uint64_t (**)(void))(v13 + 16))() & 1) != 0)
  {
    *(_QWORD *)(*(_QWORD *)(v7[6] + 8) + 24) = 0;
    return 1;
  }
  result = 0;
  *(_BYTE *)(*(_QWORD *)(v7[8] + 8) + 24) = 0;
  return result;
}

BOOL sub_100011AD8(id a1, unint64_t a2, oslogdarwin_prefsvalue_s *a3, unint64_t a4)
{
  uint64_t v5;
  char v6;
  _BYTE v7[7];
  oslogdarwin_prefsvalue_s *v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;

  if (a2 >= 2 && !a4)
    return 1;
  v5 = 0x2BFF4390FAE5F890;
  v6 = 3;
  memset(v7, 170, sizeof(v7));
  v8 = a3;
  v9 = a4;
  v10 = 0;
  v11 = 0xAAAAAAAAAAAAAAAALL;
  return sub_100011B74((uint64_t)&v5, a2 == 1);
}

uint64_t sub_100011B74(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 *v7;
  _BOOL8 v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  _QWORD v17[5];
  void **v18;
  _QWORD v19[4];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;

  if (qword_10002DF98 != -1)
    dispatch_once(&qword_10002DF98, &stru_100028F80);
  v4 = (_QWORD *)qword_10002DF90;
  if (!qword_10002DF90)
    return 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2000000000;
  v16 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 0x40000000;
  v12[2] = sub_100011F24;
  v12[3] = &unk_100029038;
  v12[4] = &v13;
  v5 = 0x2BFF4390FAE5F890;
  if (*(_QWORD *)a1 == 0x2BFF4390FAE5F890 || *(_QWORD *)a1 == 0xB846F5BCEBFFF0E0)
  {
    *(_QWORD *)&v31 = 0;
    *((_QWORD *)&v31 + 1) = &v31;
    v32 = 0x2000000000uLL;
    *(_QWORD *)&v24 = _NSConcreteStackBlock;
    *((_QWORD *)&v24 + 1) = 0x40000000;
    *(_QWORD *)&v25 = sub_10001ED68;
    *((_QWORD *)&v25 + 1) = &unk_10002A408;
    *(_QWORD *)&v26 = &v31;
    sub_10001EA64((unsigned __int8 *)(a1 + 8), (uint64_t)&v24);
    v6 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 24);
    _Block_object_dispose(&v31, 8);
    v5 = v6 + 16;
  }
  v36 = 0;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v31 = 0u;
  v30 = 0;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  if (tb_client_connection_message_construct(*v4, &v31, &v24, v5 + 9, 0))
    goto LABEL_13;
  tb_message_encode_u64(&v31, 0x9E08497E7D14E035);
  tb_message_encode_u64(&v31, *(_QWORD *)a1);
  if (*(_QWORD *)a1 == 0x2BFF4390FAE5F890 || *(_QWORD *)a1 == 0xB846F5BCEBFFF0E0)
  {
    v7 = (unsigned __int8 *)(a1 + 8);
    v20 = 0;
    v21 = &v20;
    v22 = 0x2000000000;
    v23 = 0;
    v18 = _NSConcreteStackBlock;
    v19[0] = 0x40000000;
    v19[1] = sub_10001ED80;
    v19[2] = &unk_10002A430;
    v19[3] = &v20;
    sub_10001EA64(v7, (uint64_t)&v18);
    tb_message_encode_u64(&v31, v21[3]);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 0x40000000;
    v17[2] = sub_10001ED98;
    v17[3] = &unk_10002A450;
    v17[4] = &v31;
    sub_10001EA64(v7, (uint64_t)v17);
    _Block_object_dispose(&v20, 8);
  }
  tb_message_encode_BOOL(&v31, a2);
  tb_message_complete(&v31);
  v17[0] = 0;
  if ((tb_connection_send_query(*v4, &v31, v17, 2) & 0xFFFFFFF7) != 0 || (v10 = v17[0]) == 0)
  {
LABEL_12:
    tb_client_connection_message_destruct(*v4, &v31);
LABEL_13:
    v8 = 0;
LABEL_14:
    _Block_object_dispose(&v13, 8);
    return v8;
  }
  v18 = (void **)0xAAAAAAAAAAAAAAAALL;
  v19[0] = 0xAAAAAAAAAAAAAAAALL;
  tb_message_decode_u8(v17[0], &v18);
  if (v18 != 1)
  {
    if (!(_BYTE)v18)
    {
      v11 = v19[0];
LABEL_23:
      sub_100011F24((uint64_t)v12, (char)v18, v11);
      tb_client_connection_message_destruct(*v4, &v31);
      v8 = *((_BYTE *)v14 + 24) == 0;
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  tb_message_decode_u64(v10, v19);
  v11 = v19[0];
  if (v19[0] == 0xCBD9DC39909D106ALL || v19[0] == 0x4EF7D98DF3E71501)
    goto LABEL_23;
  result = _os_crash("TB_ASSERT: (oslogdarwin_configerror__decode(message, &result->value.failure) == TB_ERROR_SUCCESS) && \"failed to decode type: OSLogDarwin.ConfigError\"");
  __break(1u);
  return result;
}

void sub_100011F24(uint64_t a1, char a2, uint64_t a3)
{
  char v4[1032];

  if (a2 == 1)
  {
    if (a3 == 0xCBD9DC39909D106ALL)
    {
      memset(&v4[60], 170, 0x3C4uLL);
      strcpy(v4, "failed to set preferences in exclaves: invalid subsystem id");
    }
    else
    {
      if (a3 != 0x4EF7D98DF3E71501)
      {
LABEL_7:
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
        return;
      }
      memset(&v4[50], 170, 0x3CEuLL);
      strcpy(v4, "failed to set preferences in exclaves: full cache");
    }
    sub_100013FF0((uint64_t)v4);
    goto LABEL_7;
  }
}

BOOL sub_100012034(id a1, unint64_t a2, oslogdarwin_prefsvalue_s *a3, unint64_t a4)
{
  unint64_t v5;
  char v6;
  _BYTE v7[7];
  oslogdarwin_prefsvalue_s *v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;

  if (a2 >= 2 && !a4)
    return 1;
  v5 = 0xB846F5BCEBFFF0E0;
  v6 = 3;
  memset(v7, 170, sizeof(v7));
  v8 = a3;
  v9 = a4;
  v10 = 0;
  v11 = 0xAAAAAAAAAAAAAAAALL;
  return sub_100011B74((uint64_t)&v5, a2 == 1);
}

void sub_1000120D0(void *a1)
{
  uid_t v1;
  gid_t v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  int *v8;
  int *v9;
  char __str[8];
  _QWORD v11[3];

  memset(v11, 170, 22);
  *(_QWORD *)__str = 0xAAAAAAAAAAAAAAAALL;
  v1 = dword_10002DF0C[0];
  v2 = unk_10002DF10;
  v3 = a1;
  snprintf(__str, 0x1EuLL, "%s.tmp", "version.plist");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v3, 200, 0, 0));

  v5 = openat(dword_10002DBF8, __str, 1794, 420);
  if ((_DWORD)v5 == -1)
  {
    v8 = __error();
    _os_assumes_log(*v8);
  }
  else
  {
    v6 = v5;
    fchown(v5, v1, v2);
    v7 = objc_msgSend(objc_alloc((Class)NSFileHandle), "initWithFileDescriptor:", v6);
    objc_msgSend(v7, "writeData:error:", v4, 0);
    objc_msgSend(v7, "synchronizeAndReturnError:", 0);
    objc_msgSend(v7, "closeAndReturnError:", 0);
    if (renameat(dword_10002DBF8, __str, dword_10002DBF8, "version.plist") == -1)
    {
      v9 = __error();
      _os_assumes_log(*v9);
    }

  }
}

void sub_100012250(uint64_t a1, unsigned int a2)
{
  char v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  NSObject **v6;
  NSObject *v7;
  _QWORD v8[6];
  char v9;

  if (a2 >= 6)
  {
    __break(0x5512u);
LABEL_8:
    __break(0x5513u);
  }
  v2 = a2;
  if (1248 * (unint64_t)a2 > ~(unint64_t)qword_10002C398)
    goto LABEL_8;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = &qword_10002C398[156 * a2];
  os_retain(*(void **)(v3 + 64));
  v5 = v4[1];
  if (v5)
    v6 = (NSObject **)(v5 + 16);
  else
    v6 = (NSObject **)v4;
  v7 = *v6;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 0x40000000;
  v8[2] = sub_10001233C;
  v8[3] = &unk_1000290D8;
  v8[4] = v3;
  v8[5] = v4;
  v9 = v2;
  dispatch_async(v7, v8);
}

void sub_10001233C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  const void *v4;
  _QWORD *v5;

  os_unfair_lock_lock_with_options(*(_QWORD *)(a1 + 32) + 132, 0x10000);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = (const void *)(v2 + 138);
  v5 = (_QWORD *)sub_10000A17C(v2, *(unsigned __int8 *)(a1 + 48));
  sub_100005964(v3, v4, v5);
  *(_QWORD *)sub_10000A17C(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48)) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 132));
  os_release(*(void **)(*(_QWORD *)(a1 + 32) + 64));
}

uint64_t sub_1000123B4(uint64_t a1, uint64_t a2)
{
  const char *v4;
  char __b[1024];

  v4 = (const char *)(a2 + 138);
  if (!strcmp((const char *)(*(_QWORD *)(a1 + 32) + 32), (const char *)(a2 + 138)))
  {
    if (*(_BYTE *)(a1 + 40))
    {
      memset(__b, 170, sizeof(__b));
      snprintf(__b, 0x400uLL, "Super Quarantined %s, dropping clients logs.", v4);
      sub_100013FF0((uint64_t)__b);
      *(_BYTE *)(a2 + 128) = 1;
    }
    else
    {
      sub_100010B08(*(_QWORD *)(a2 + 64));
    }
  }
  return 1;
}

void sub_100012478()
{
  os_unfair_lock_lock_with_options(&stru_10002DFA0, 0x10000);
  sub_100010568();
  dword_10002C34C = sub_100003EA0(dword_10002C34C, "logdata.statistics.0.jsonl", "logdata.statistics.1.jsonl", 5242880);
  os_unfair_lock_unlock(&stru_10002DFA0);
}

uint64_t sub_1000124E8(uint64_t a1, uint64_t a2)
{
  os_unfair_lock_s *v4;

  v4 = (os_unfair_lock_s *)(a2 + 132);
  os_unfair_lock_lock_with_options(a2 + 132, 0x10000);
  *(_QWORD *)sub_10000A17C(a2, *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1240)) = 0;
  os_unfair_lock_unlock(v4);
  return 1;
}

void sub_100012540(id a1)
{
  sub_1000217A4(qword_10003A7A8, 0);
}

void sub_100012550(id a1)
{
  qword_10003A7F0 = (uint64_t)dispatch_queue_create("com.apple.logd.time-change", 0);
}

void sub_100012588(id a1)
{
  qword_10003A7D0 = (uint64_t)dispatch_semaphore_create(1);
}

void sub_1000125A8(id a1)
{
  qword_10003A7F8 = (uint64_t)xpc_connection_create_mach_service("com.apple.logd_helper", 0, 2uLL);
  xpc_connection_set_event_handler((xpc_connection_t)qword_10003A7F8, &stru_100029338);
  xpc_connection_activate((xpc_connection_t)qword_10003A7F8);
}

uint64_t start()
{
  uint64_t v0;
  const char *v1;
  uint64_t v2;
  const char *v3;
  int *v4;
  int v5;
  int v6;
  unint64_t v7;
  unint64_t v8;
  unsigned int *v9;
  unsigned int *v10;
  unint64_t v11;
  int v12;
  int v13;
  off_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  size_t v19;
  int v20;
  uint64_t v21;
  size_t v22;
  char *v23;
  int v24;
  uint64_t v25;
  int v26;
  int v27;
  __int128 v28;
  uint64_t result;
  uint64_t v30;
  int *v31;
  int v32;
  int v33;
  int v34;
  unint64_t v35;
  unint64_t v36;
  size_t v37;
  char __str[1032];

  v34 = -1431655766;
  qword_10003A7E0 = os_transaction_create("com.apple.logd");
  os_trace_set_mode(256);
  byte_10003A900 = (MEMORY[0xFFFFFC104] & 0x4000000) != 0;
  _os_trace_set_diagnostic_flags(MEMORY[0xFFFFFC104] | 0x4000000u);
  if (bootstrap_check_in2(bootstrap_port, "com.apple.logd", &v34, 8))
  {
    memset(&__str[36], 170, 0x3DCuLL);
    strcpy(&__str[32], "ogd");
    v1 = "failed to checkin to com.apple.logd";
LABEL_69:
    v28 = *((_OWORD *)v1 + 1);
    *(_OWORD *)__str = *(_OWORD *)v1;
    *(_OWORD *)&__str[16] = v28;
    sub_100013FF0((uint64_t)__str);
    return 1;
  }
  if (&_wd_endpoint_register)
  {
    wd_endpoint_register("com.apple.logd.watchdog");
    v2 = wd_endpoint_set_alive_func(&stru_100029378);
    wd_endpoint_activate(v2);
  }
  if (byte_10003A900)
    sub_100012CEC(v34);
  sub_10001A1D4(0);
  sub_10001A1D4(1u);
  sub_10001A1D4(2u);
  sub_100018DA4();
  qword_10002DDC0 = qword_10003A938;
  qword_10002DD30 = qword_10003A938;
  qword_10002DC10 = qword_10003A938;
  qword_10002DCA0 = qword_10003A938;
  dispatch_sync_f((dispatch_queue_t)qword_10003A938, 0, (dispatch_function_t)sub_100019BD0);
  if (qword_10003A9B0 != -1)
    dispatch_once(&qword_10003A9B0, &stru_10002A6F0);
  v3 = (const char *)qword_10003A9A0;
  v4 = (int *)_os_trace_zalloc(152);
  v5 = openat(-2, v3, 0);
  *v4 = v5;
  if (v5 == -1)
  {
LABEL_24:
    v16 = *__error();
LABEL_25:
    _os_assumes_log(v16);
    goto LABEL_65;
  }
  *((_QWORD *)v4 + 16) = 0x20000;
  v4[34] = 9;
  *((_QWORD *)v4 + 18) = 3888000;
  v35 = 0xAAAAAAAAAAAAAAAALL;
  v36 = 0xAAAAAAAAAAAAAAAALL;
  v6 = sub_100020E3C(v5, &v36, &v35, 1);
  if (v6 < 0)
    goto LABEL_65;
  if (v6)
  {
    v7 = v36;
    v8 = v35 + 1;
    *((_QWORD *)v4 + 12) = v36;
    *((_QWORD *)v4 + 13) = v8;
    v9 = (unsigned int *)(v4 + 24);
    v10 = (unsigned int *)(v4 + 24);
    if (v7 > 1)
      goto LABEL_15;
  }
  else
  {
    *((_QWORD *)v4 + 12) = 2;
    v10 = (unsigned int *)(v4 + 24);
    v9 = (unsigned int *)(v4 + 26);
  }
  *(_QWORD *)v9 = 2;
  v9 = v10;
LABEL_15:
  sub_100021154(v4);
  v11 = *((_QWORD *)v4 + 13);
  if (v11 == 2 || v11 <= *(_QWORD *)v9)
    goto LABEL_34;
  memset(__str, 170, 26);
  snprintf(__str, 0x1AuLL, "%016llx.timesync", v35);
  v12 = openat(*v4, __str, 16777225);
  if (v12 < 0)
    goto LABEL_65;
  v13 = v12;
  v14 = lseek(v12, 0, 2);
  if (v14 == -1)
  {
    v21 = *__error();
LABEL_40:
    _os_assumes_log(v21);
    goto LABEL_21;
  }
  if (v14 > 0x7FFFFFFF)
  {
    v21 = 0;
    goto LABEL_40;
  }
  if ((v14 & 7) != 0)
  {
LABEL_21:
    if (close(v13) != -1)
      goto LABEL_65;
    v15 = *__error();
    v16 = *__error();
    if (v15 != 9)
      goto LABEL_25;
    qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_10002DF78 = v16;
    __break(1u);
    goto LABEL_24;
  }
  v4[28] = v13;
  *((_QWORD *)v4 + 15) = v14;
  if ((unint64_t)v14 >= *((_QWORD *)v4 + 16))
  {
    if (close(v13) == -1)
    {
      LODWORD(v19) = *__error();
      v30 = *__error();
      if ((_DWORD)v19 == 9)
      {
LABEL_80:
        qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
        qword_10002DF78 = v30;
        __break(1u);
LABEL_81:
        sub_1000214C8(((_DWORD)v0 << 16) | ((v19 & 0xFFFFF) << 32) | WORD1(v0) | 0xBAD0000000000000);
      }
      _os_assumes_log(v30);
    }
    sub_100021154(v4);
LABEL_34:
    if ((sub_100021410((uint64_t)v4) & 0x80000000) == 0)
      goto LABEL_35;
LABEL_65:
    if (*v4 < 0 || close(*v4) != -1)
      goto LABEL_67;
    LODWORD(v19) = *__error();
    v30 = *__error();
    if ((_DWORD)v19 != 9)
    {
      _os_assumes_log(v30);
LABEL_67:
      free(v4);
      qword_10003A7A8 = 0;
LABEL_68:
      memset(&__str[33], 170, 0x3DFuLL);
      __str[32] = 0;
      v1 = "failed to create timesync writer";
      goto LABEL_69;
    }
    qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_10002DF78 = v30;
    __break(1u);
    goto LABEL_80;
  }
  if (!v14)
    goto LABEL_35;
  v17 = *v4;
  v37 = 0xAAAAAAAAAAAAAAAALL;
  v18 = (char *)_os_trace_mmap_at(v17, __str, 256, &v37);
  if (!v18)
  {
    v16 = *__error();
    if ((_DWORD)v16)
      goto LABEL_25;
    goto LABEL_65;
  }
  if (!v37)
  {
LABEL_60:
    v26 = munmap(v18, v37);
    v27 = 1;
    LODWORD(v19) = -1431655766;
    LODWORD(v0) = -1431655766;
    goto LABEL_61;
  }
  if (v37 >= 8)
  {
    v22 = 0;
    while (v22 < v37)
    {
      v19 = v22;
      v23 = &v18[v22];
      v24 = *(unsigned __int16 *)&v18[v22];
      if (v24 > 48047)
      {
        if (v24 == 48048)
        {
          if (*((_WORD *)v23 + 1) != 48)
            goto LABEL_58;
          v25 = 48;
        }
        else
        {
          if (v24 != 57005)
            goto LABEL_58;
          v25 = *((unsigned __int16 *)v23 + 1);
        }
      }
      else if (v24 == 27986)
      {
        if (*((_WORD *)v23 + 1) != 88)
          goto LABEL_58;
        v25 = 88;
      }
      else
      {
        if (v24 != 29524 || *((_WORD *)v23 + 1) != 32)
        {
LABEL_58:
          v0 = *(_QWORD *)v23;
          goto LABEL_59;
        }
        v25 = 32;
      }
      v22 = v19 + v25;
      if (v22 > v37)
        goto LABEL_58;
    }
    goto LABEL_60;
  }
  LODWORD(v0) = -1431655766;
  LODWORD(v19) = -1;
LABEL_59:
  v26 = munmap(v18, v37);
  v27 = 0;
LABEL_61:
  if (v26 != -1)
  {
    if (!v27)
      goto LABEL_63;
LABEL_35:
    if ((sub_1000214F0((uint64_t)v4, 0) & 0x80000000) == 0)
    {
      qword_10003A7A8 = (uint64_t)v4;
      if (v4)
      {
        sub_100012D5C();
        memset(__str, 170, 0x400uLL);
        v20 = sub_10002239C();
        snprintf(__str, 0x400uLL, "libtrace_kic=%d", v20);
        sub_100013FF0((uint64_t)__str);
        sub_1000156E8();
      }
      goto LABEL_68;
    }
    goto LABEL_65;
  }
  v33 = v27;
  v31 = __error();
  _os_assumes_log(*v31);
  if (v33)
    goto LABEL_35;
LABEL_63:
  if (close(v4[28]) != -1)
    goto LABEL_64;
  v32 = *__error();
  result = *__error();
  if (v32 != 9)
  {
    _os_assumes_log(result);
LABEL_64:
    sub_100021154(v4);
    if ((sub_100021410((uint64_t)v4) & 0x80000000) == 0)
      goto LABEL_81;
    goto LABEL_65;
  }
  qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_10002DF78 = result;
  __break(1u);
  return result;
}

void sub_100012CEC(int a1)
{
  char v2[1024];

  sub_100018E18();
  memset(&v2[22], 170, 0x3EAuLL);
  strcpy(v2, "Starting in sick mode");
  sub_100013FF0((uint64_t)v2);
  sub_100010B14(a1, &stru_1000293B8);
  sub_100010E20();
  sub_100012EC4();
  sub_10001452C();
  sub_1000158FC();
  dispatch_main();
}

void sub_100012D5C()
{
  char v0[1032];

  if (setiopolicy_np(5, 0, 1) == -1)
  {
    memset(&v0[44], 170, 0x3D4uLL);
    strcpy(v0, "Failed to set IOPOL_VFS_TRIGGER_RESOLVE_OFF");
    sub_100013FF0((uint64_t)v0);
  }
}

void sub_100012DF4()
{
  __int128 v0;
  size_t v1;
  char __b[1024];
  __int128 in;
  _BYTE v4[21];

  *(_QWORD *)&v4[13] = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v0 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v0 + 1) = 0xAAAAAAAAAAAAAAAALL;
  in = v0;
  *(_OWORD *)v4 = v0;
  v1 = 37;
  if (!sysctlbyname("kern.uuid", &in, &v1, 0, 0))
  {
    uuid_parse((const char *)&in, byte_10003A809);
    memset(__b, 170, sizeof(__b));
    snprintf(__b, 0x400uLL, "_read_kernel_uuid calling _logd_uuiddb_harvest_kernel for %s", (const char *)&in);
    sub_100013FF0((uint64_t)__b);
    sub_1000154C4();
  }
}

void sub_100012EC4()
{
  NSObject *v0;
  NSObject *v1;

  if (&_wd_endpoint_register)
  {
    v0 = sub_100006AB0(2);
    v1 = sub_100006AB0(3);
    wd_endpoint_add_queue(v0);
    wd_endpoint_add_queue(v1);
    byte_10003A808 = 1;
  }
}

void sub_100012F1C()
{
  IONotificationPort *v0;
  BOOL v1;
  NSObject *global_queue;

  dword_10003A83C = IORegisterForSystemPower(0, (IONotificationPortRef *)&qword_10003A830, (IOServiceInterestCallback)sub_100013C7C, &dword_10003A838);
  v0 = (IONotificationPort *)qword_10003A830;
  if (dword_10003A83C)
    v1 = qword_10003A830 == 0;
  else
    v1 = 1;
  if (!v1)
  {
    global_queue = dispatch_get_global_queue(25, 0);
    IONotificationPortSetDispatchQueue(v0, global_queue);
  }
}

void sub_100012F90()
{
  host_t v0;
  kern_return_t v1;
  kern_return_t v2;
  uintptr_t v3;
  uintptr_t v4;
  _QWORD handler[4];
  mach_port_name_t v6;
  host_t v7;
  mach_port_name_t name;
  _OWORD __b[64];

  name = 0;
  if (qword_10003A850 != -1)
    dispatch_once(&qword_10003A850, &stru_100029458);
  v0 = dword_10003A84C;
  if (!dword_10003A84C)
  {
    memset((char *)&__b[2] + 13, 170, 0x3D3uLL);
    strcpy((char *)__b, "Failed to get host port for calendar changes");
    goto LABEL_7;
  }
  v1 = mach_port_allocate(mach_task_self_, 1u, &name);
  if (v1)
  {
    v2 = v1;
    memset(__b, 170, sizeof(__b));
    snprintf((char *)__b, 0x400uLL, "Failed to allocate mach port for calendar changes: error %d", v2);
LABEL_7:
    sub_100013FF0((uint64_t)__b);
    return;
  }
  v3 = name;
  if (qword_10003A7E8 != -1)
  {
    v4 = name;
    dispatch_once(&qword_10003A7E8, &stru_100029258);
    v3 = v4;
  }
  qword_10003A840 = (uint64_t)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_mach_recv, v3, 0, (dispatch_queue_t)qword_10003A7F0);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 0x40000000;
  handler[2] = sub_100013A00;
  handler[3] = &unk_100029418;
  v6 = name;
  v7 = v0;
  dispatch_source_set_event_handler((dispatch_source_t)qword_10003A840, handler);
  dispatch_activate((dispatch_object_t)qword_10003A840);
  sub_100013AB4(v0, name);
}

void sub_100013148()
{
  int out_token;
  char v1[1032];

  if (qword_10003A7E8 != -1)
    dispatch_once(&qword_10003A7E8, &stru_100029258);
  out_token = -1431655766;
  if (notify_register_dispatch("com.apple.system.timezone", &out_token, (dispatch_queue_t)qword_10003A7F0, &stru_100029478))
  {
    memset(&v1[40], 170, 0x3D8uLL);
    strcpy(v1, "Failed to register for timezone changes");
    sub_100013FF0((uint64_t)v1);
  }
}

void sub_10001321C()
{
  NSObject *v0;
  dispatch_time_t v1;

  if (qword_10003A7E8 != -1)
    dispatch_once(&qword_10003A7E8, &stru_100029258);
  v0 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)qword_10003A7F0);
  qword_10003A860 = (uint64_t)v0;
  v1 = dispatch_walltime(0, 0);
  dispatch_source_set_timer(v0, v1, 0x34630B8A000uLL, 0xDF8475800uLL);
  dispatch_source_set_event_handler((dispatch_source_t)qword_10003A860, &stru_1000294B8);
  dispatch_activate((dispatch_object_t)qword_10003A860);
}

void sub_1000132C8()
{
  NSObject *v0;

  signal(15, (void (__cdecl *)(int))1);
  v0 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, 0);
  dispatch_set_context(v0, v0);
  dispatch_source_set_cancel_handler_f(v0, (dispatch_function_t)&_dispatch_release);
  dispatch_source_set_event_handler_f(v0, (dispatch_function_t)sub_100013334);
  dispatch_activate(v0);
}

void sub_100013334(NSObject *a1)
{
  uint64_t *v1;
  uint64_t v2;
  char *v3;

  dispatch_source_cancel(a1);
  clock_gettime_nsec_np(_CLOCK_MONOTONIC);
  if (qword_10003A9B0 != -1)
    dispatch_once(&qword_10003A9B0, &stru_10002A6F0);
  v3 = (char *)0xAAAAAAAAAAAAAAAALL;
  asprintf(&v3, "%s/shutdown.log", (const char *)qword_10003A998);
  if (v3)
  {
    fopen(v3, "a+");
    free(v3);
  }
  if (qword_10003A7E8 != -1)
    dispatch_once(&qword_10003A7E8, &stru_100029258);
  dispatch_sync((dispatch_queue_t)qword_10003A7F0, &stru_1000294F8);
  sub_1000217A4(qword_10003A7A8, 0);
  v1 = qword_10002C398;
  v2 = 5;
  do
  {
    sub_100001A74((uint64_t)v1);
    v1 += 156;
    --v2;
  }
  while (v2);
  sub_1000153DC();
}

FILE *sub_100013790(uint64_t a1, uint64_t a2)
{
  FILE *result;
  __int128 v5;
  int v6;
  uuid_string_t out;

  result = *(FILE **)(a1 + 40);
  if (result)
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      fprintf(result, "After %.02fs, these clients are still here:\n", (double)(unint64_t)(*(_QWORD *)(a1 + 48) - *(_QWORD *)(a1 + 56)) / 1000000000.0);
    *(_QWORD *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)out = v5;
    *(_OWORD *)&out[16] = v5;
    v6 = -1431655766;
    sub_10000B0A0(*(_QWORD *)(a2 + 64), &v6);
    uuid_unparse_upper((const unsigned __int8 *)(a2 + 32), out);
    fprintf(*(FILE **)(a1 + 40), "\t\tremaining client pid: %d (%s/%s)\n", v6, (const char *)(a2 + 138), out);
    result = (FILE *)(*(_QWORD *)(a1 + 40) != 0);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  return result;
}

void sub_100013898(id a1)
{
  qword_10003A828 = (uint64_t)dispatch_group_create();
}

void sub_1000138B4(id a1)
{
  byte_10003A848 = 1;
}

void sub_1000138C4(id a1)
{
  char v1[1032];

  if ((byte_10003A848 & 1) == 0 && (sub_1000217A4(qword_10003A7A8, 0) & 0x80000000) != 0)
  {
    memset(&v1[40], 170, 0x3D8uLL);
    strcpy(v1, "Failed to write periodic timesync point");
    sub_100013FF0((uint64_t)v1);
  }
}

void sub_100013964(id a1, int a2)
{
  char v2[1032];

  if ((byte_10003A848 & 1) == 0)
  {
    memset(&v2[41], 170, 0x3D7uLL);
    strcpy(v2, "Time zone changed, updating file headers");
    sub_100013FF0((uint64_t)v2);
    sub_1000217A4(qword_10003A7A8, 1);
  }
}

void sub_100013A00(uint64_t a1)
{
  int v2;
  mach_msg_return_t v3;
  __int128 v4;
  __int128 v5;

  v4 = 0u;
  v5 = 0u;
  v2 = *(_DWORD *)(a1 + 32);
  DWORD1(v4) = 24;
  HIDWORD(v4) = v2;
  v3 = mach_msg_receive((mach_msg_header_t *)&v4);
  if ((byte_10003A848 & 1) == 0 && (DWORD1(v5) & 0xFFFFFFFE) == 0x3B6)
  {
    sub_1000217A4(qword_10003A7A8, 1);
    sub_100013AB4(*(_DWORD *)(a1 + 36), *(_DWORD *)(a1 + 32));
  }
  if (!v3)
    mach_msg_destroy((mach_msg_header_t *)&v4);
}

void sub_100013AB4(host_t a1, mach_port_t notify_port)
{
  kern_return_t v4;
  char __b[1024];

  v4 = host_request_notification(a1, (byte_10003A858 & 1) == 0, notify_port);
  if (v4 == 4 && (byte_10003A858 & 1) == 0)
  {
    byte_10003A858 = 1;
    v4 = host_request_notification(a1, 0, notify_port);
  }
  if (v4)
  {
    memset(__b, 170, sizeof(__b));
    snprintf(__b, 0x400uLL, "Failed to register for calendar changes: error %d", v4);
    sub_100013FF0((uint64_t)__b);
  }
}

void sub_100013B94(id a1)
{
  mach_port_t v1;
  kern_return_t special_port;
  kern_return_t v3;
  mach_port_t port;
  char __b[1024];

  v1 = mach_host_self();
  port = -1431655766;
  special_port = host_get_special_port(v1, -1, 1, &port);
  v3 = special_port;
  if (special_port == 4)
  {
LABEL_4:
    dword_10003A84C = v1;
    if (v1)
      return;
    goto LABEL_5;
  }
  if (!special_port)
  {
    mach_port_deallocate(mach_task_self_, v1);
    v1 = port;
    goto LABEL_4;
  }
  if (!dword_10003A84C)
  {
LABEL_5:
    memset(__b, 170, sizeof(__b));
    snprintf(__b, 0x400uLL, "Failed to get mach host port: error %d", v3);
    sub_100013FF0((uint64_t)__b);
  }
}

uint64_t sub_100013C7C(int a1, int a2, int a3, intptr_t notificationID)
{
  uint64_t *v5;
  uint64_t v6;
  uint64_t result;

  if (a3 != -536870288)
  {
    if (a3 != -536870272)
      return result;
    v5 = qword_10002C398;
    v6 = 5;
    do
    {
      sub_100001A74((uint64_t)v5);
      v5 += 156;
      --v6;
    }
    while (v6);
  }
  return IOAllowPowerChange(dword_10003A83C, notificationID);
}

void sub_100013D28(int a1, CFDictionaryRef theDict, uint64_t a3)
{
  const __CFNumber *Value;
  const __CFData *v6;
  const __CFNumber *v7;
  const __CFNumber *v8;
  __int128 v9;
  const unsigned __int8 *BytePtr;
  unint64_t valuePtr;
  _OWORD v12[2];

  Value = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("OSBundleExecLoadAddress"));
  v6 = (const __CFData *)CFDictionaryGetValue(theDict, CFSTR("OSBundleTextUUID"));
  v7 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("OSBundleExecLoadSize"));
  if (Value)
  {
    if (v6)
    {
      v8 = v7;
      if (v7)
      {
        valuePtr = 0xAAAAAAAAAAAAAAAALL;
        if (CFNumberGetValue(Value, kCFNumberSInt64Type, &valuePtr))
        {
          *(_QWORD *)&v9 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v12[0] = v9;
          v12[1] = v9;
          DWORD2(v12[0]) = valuePtr;
          WORD6(v12[0]) = WORD2(valuePtr);
          BytePtr = CFDataGetBytePtr(v6);
          uuid_copy((unsigned __int8 *)((unint64_t)v12 | 0xE), BytePtr);
          CFNumberGetValue(v8, kCFNumberSInt64Type, v12);
          sub_10000EBAC(a3, (uint64_t)v12);
        }
      }
    }
  }
}

void sub_100013E38(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  unint64_t v3;
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  int v7;
  unint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int8 *v12;
  uint64_t v13;
  _OWORD v14[2];

  v3 = (unint64_t)&a2[a3];
  v4 = a2 + 8;
  if (a2 + 8 < &a2[a3])
  {
    v5 = a2;
    do
    {
      v7 = *(_DWORD *)v5;
      if (!*(_DWORD *)v5)
        return;
      v8 = *((unsigned int *)v5 + 1);
      if (v3 - (unint64_t)v4 < v8)
        return;
      switch(v7)
      {
        case 3:
          goto LABEL_9;
        case 2:
          if (v8 >= 4 && v8 - 4 >= v5[10] + (unint64_t)v5[11])
          {
            v12 = (unsigned __int8 *)sub_100009838((uint64_t)v4);
            if (v12)
              sub_100009794(a1, v12);
          }
          break;
        case 1:
LABEL_9:
          if (v8 >= 0x20 && v8 - 32 != strnlen((const char *)v5 + 40, v8 - 32))
          {
            if (v7 == 1)
            {
              *(_QWORD *)&v9 = 0xAAAAAAAAAAAAAAAALL;
              *((_QWORD *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
              v14[0] = v9;
              v14[1] = v9;
              uuid_copy((unsigned __int8 *)v14 + 14, v4);
              v10 = *((_QWORD *)v5 + 3);
              v11 = *((_QWORD *)v5 + 4);
              DWORD2(v14[0]) = v10;
              WORD6(v14[0]) = WORD2(v10);
              *(_QWORD *)&v14[0] = v11;
              sub_10000EBAC(a1, (uint64_t)v14);
            }
            else
            {
              sub_10000A744(a1, (uint64_t *)v4);
            }
            sub_10000A278(v4, (const char *)v5 + 40, 0, 1);
          }
          break;
      }
      v13 = (*((_DWORD *)v5 + 1) + 7) & 0xFFFFFFF8;
      if (__CFADD__(v4, v13))
        __break(0x5513u);
      v5 = &v4[v13];
      v4 += v13 + 8;
    }
    while ((unint64_t)v4 < v3);
  }
}

uint64_t sub_100013FD8(uint64_t a1)
{
  sub_100013FF0(a1);
  return 1;
}

void sub_100013FF0(uint64_t a1)
{
  _QWORD v2[5];

  if (qword_10003A868 != -1)
    dispatch_once_f(&qword_10003A868, 0, (dispatch_function_t)sub_1000140BC);
  if (!dispatch_get_specific(off_10002C380))
  {
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 0x40000000;
    v2[2] = sub_100014230;
    v2[3] = &unk_100029540;
    v2[4] = a1;
    dispatch_sync((dispatch_queue_t)qword_10003A870, v2);
  }
}

int *sub_1000140BC()
{
  int *result;
  uint64_t v1;
  uint64_t v2;

  asprintf((char **)&qword_10003A878, "com.apple.%s.log", "logd");
  if (!qword_10003A878)
  {
    v1 = *__error();
    qword_10002DF48 = (uint64_t)"BUG IN LIBTRACE: failed to create queue target from subsystem";
    qword_10002DF78 = v1;
    __break(1u);
LABEL_10:
    result = __error();
    v2 = *result;
    qword_10002DF48 = (uint64_t)"BUG IN LIBTRACE: failed to create log file path";
    qword_10002DF78 = v2;
    __break(1u);
    return result;
  }
  qword_10003A870 = (uint64_t)dispatch_queue_create_with_target_V2((const char *)qword_10003A878, 0, 0);
  dispatch_queue_set_specific((dispatch_queue_t)qword_10003A870, off_10002C380, (void *)qword_10003A870, 0);
  if (qword_10003A9B0 != -1)
    dispatch_once(&qword_10003A9B0, &stru_10002A6F0);
  asprintf((char **)&qword_10003A880, "%s/%s.0.log", (const char *)qword_10003A998, "logd");
  if (qword_10003A9B0 != -1)
    dispatch_once(&qword_10003A9B0, &stru_10002A6F0);
  result = (int *)asprintf((char **)&qword_10003A888, "%s/%s.1.log", (const char *)qword_10003A998, "logd");
  if (!qword_10003A880 || !qword_10003A888)
    goto LABEL_10;
  return result;
}

uint64_t sub_100014230(uint64_t a1)
{
  const char *v1;
  __int128 v2;
  const char *v3;
  pid_t v4;
  uint64_t result;
  time_t v6;
  tm v7;
  char v8[8];
  _QWORD v9[3];
  char __b[1024];

  v1 = *(const char **)(a1 + 32);
  dispatch_assert_queue_V2((dispatch_queue_t)qword_10003A870);
  memset(__b, 170, sizeof(__b));
  memset(v9, 170, 18);
  v7.tm_zone = (char *)0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)v8 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v7.tm_mon = v2;
  *(_OWORD *)&v7.tm_isdst = v2;
  *(_OWORD *)&v7.tm_sec = v2;
  v6 = time(0);
  localtime_r(&v6, &v7);
  strftime(v8, 0x1AuLL, "%F %T%z", &v7);
  v3 = getprogname();
  v4 = getpid();
  result = snprintf(__b, 0x400uLL, "%s %s[%d]: %s\n", v8, v3, v4, v1);
  if ((int)result >= 1)
  {
    if (result >= 0x400)
    {
      if ((unint64_t)__b >= 0xFFFFFFFFFFFFFC02)
      {
        __break(0x5513u);
        return result;
      }
      __b[1022] = 10;
    }
    dispatch_assert_queue_V2((dispatch_queue_t)qword_10003A870);
    sub_10001437C();
    result = dword_10002C388;
    if ((dword_10002C388 & 0x80000000) == 0)
    {
      _os_trace_write();
      return sub_1000143C4();
    }
  }
  return result;
}

void sub_10001437C()
{
  dispatch_assert_queue_V2((dispatch_queue_t)qword_10003A870);
  if (dword_10002C388 < 0)
  {
    sub_100014488();
    if ((dword_10002C388 & 0x80000000) == 0)
      sub_1000143C4();
  }
}

uint64_t sub_1000143C4()
{
  off_t v0;
  uint64_t result;
  std::error_code *v2;
  int v3;

  dispatch_assert_queue_V2((dispatch_queue_t)qword_10003A870);
  v0 = lseek(dword_10002C388, 0, 2);
  result = fsync(dword_10002C388);
  if (v0 >= 0x100000)
  {
    if (close(dword_10002C388) != -1)
    {
LABEL_3:
      rename((const std::__fs::filesystem::path *)qword_10003A880, (const std::__fs::filesystem::path *)qword_10003A888, v2);
      return sub_100014488();
    }
    v3 = *__error();
    result = *__error();
    if (v3 != 9)
    {
      _os_assumes_log(result);
      goto LABEL_3;
    }
    qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_10002DF78 = result;
    __break(1u);
  }
  return result;
}

uint64_t sub_100014488()
{
  uint64_t result;

  result = open((const char *)qword_10003A880, 778, 420);
  dword_10002C388 = result;
  if ((result & 0x80000000) == 0)
    return fchown(result, dword_10002DF0C, unk_10002DF10);
  return result;
}

void sub_1000144DC()
{
  if (qword_10003A868 != -1)
    dispatch_once_f(&qword_10003A868, 0, (dispatch_function_t)sub_1000140BC);
  dispatch_sync((dispatch_queue_t)qword_10003A870, &stru_100029580);
}

void sub_10001452C()
{
  _xpc_connection_s *mach_service;

  sub_10001457C();
  mach_service = xpc_connection_create_mach_service("com.apple.logd.admin", 0, 1uLL);
  xpc_connection_set_event_handler(mach_service, &stru_1000295C0);
  xpc_connection_activate(mach_service);
  qword_10003A890 = (uint64_t)mach_service;
}

void sub_10001457C()
{
  int is_development_build;
  int v1;
  void *v2;
  const char *v3;
  void *plist_at;
  void *v5;
  _BOOL4 v6;
  int v7;
  xpc_object_t value;
  void *v9;
  const char *string_ptr;
  int v11;
  xpc_object_t v12;
  void *v13;
  int v14;
  int v15;
  unsigned int v16;
  int v17;
  const char *v18;
  int v19;
  char __b[1024];

  v19 = -1431655766;
  if (_os_trace_atm_diagnostic_config(&v19) && (v19 & 0x500) != 0)
    return;
  is_development_build = _os_trace_is_development_build();
  v1 = (is_development_build & 1) != 0 || (MEMORY[0xFFFFFC104] & 0x8000000) == 0;
  v2 = memset(__b, 170, sizeof(__b));
  v3 = (const char *)_os_trace_prefsdir_path(v2);
  if (snprintf(__b, 0x400uLL, "%s/%s.plist", v3, "com.apple.system.logging") >= 1024)
    _os_assumes_log(0);
  os_unfair_lock_lock_with_options(&stru_10003A898, 0x10000);
  plist_at = (void *)_os_trace_read_plist_at(4294967294, __b);
  if (!plist_at)
  {
    v14 = 0;
    v7 = is_development_build;
LABEL_25:
    v15 = 0;
    v16 = MEMORY[0xFFFFFC104] & 0xFCFFFBFF;
    if (v1)
      v17 = 0;
    else
      v17 = 1024;
    if (!is_development_build)
      goto LABEL_30;
    goto LABEL_29;
  }
  v5 = plist_at;
  v6 = xpc_dictionary_get_BOOL(plist_at, "Enable-Logging");
  v7 = is_development_build | v6;
  is_development_build |= xpc_dictionary_get_BOOL(v5, "Enable-Private-Data");
  value = xpc_dictionary_get_value(v5, "Privacy-Enable-Level");
  if (value)
  {
    v9 = value;
    if (xpc_get_type(value) == (xpc_type_t)&_xpc_type_string)
    {
      string_ptr = xpc_string_get_string_ptr(v9);
      if (!strcasecmp(string_ptr, "Sensitive"))
      {
        v11 = 0;
        is_development_build = 1;
        goto LABEL_15;
      }
      if (!strcasecmp(string_ptr, "Private"))
        is_development_build = 1;
    }
  }
  v11 = 1;
LABEL_15:
  v1 |= v6;
  v12 = xpc_dictionary_get_value(v5, "Privacy-Set-Level");
  if (!v12 || (v13 = v12, xpc_get_type(v12) != (xpc_type_t)&_xpc_type_string))
  {
LABEL_17:
    xpc_release(v5);
    if (v11)
    {
      v14 = 0;
      v15 = 0;
      v16 = MEMORY[0xFFFFFC104] & 0xFCFFFBFF;
      if (v1)
        v17 = 0;
      else
        v17 = 1024;
      if ((is_development_build & 1) == 0)
        goto LABEL_30;
      goto LABEL_29;
    }
    v14 = 0x2000000;
    goto LABEL_25;
  }
  v18 = xpc_string_get_string_ptr(v13);
  if (strcasecmp(v18, "Sensitive"))
  {
    if (!strcasecmp(v18, "Private"))
    {
      is_development_build = 1;
    }
    else if (!strcasecmp(v18, "Public"))
    {
      xpc_release(v5);
      v14 = 0;
      v15 = 0;
      v16 = MEMORY[0xFFFFFC104] & 0xFCFFFBFF;
      if (v1)
        v17 = 0;
      else
        v17 = 1024;
      goto LABEL_30;
    }
    goto LABEL_17;
  }
  xpc_release(v5);
  v16 = MEMORY[0xFFFFFC104] & 0xFCFFFBFF;
  if (v1)
    v17 = 0;
  else
    v17 = 1024;
  v14 = 0x2000000;
LABEL_29:
  v15 = 0x1000000;
LABEL_30:
  if ((v15 | v17 | v14 | v16) != MEMORY[0xFFFFFC104])
    _os_trace_set_diagnostic_flags();
  if (byte_10003A89C != v7)
    byte_10003A89C = v7;
  os_unfair_lock_unlock(&stru_10003A898);
}

void sub_1000148E0(_xpc_connection_s *a1, xpc_object_t xdict)
{
  uint64_t uint64;
  uint64_t v5;
  void *v6;
  const char *v7;
  const char *v8;
  char __b[1024];

  uint64 = xpc_dictionary_get_uint64(xdict, "prefs_type");
  if (uint64 - 4 <= 0xFFFFFFFFFFFFFFFCLL)
  {
    sub_1000069E0(a1, xdict, 22);
    return;
  }
  v5 = uint64;
  v6 = memset(__b, 170, sizeof(__b));
  if (~(unint64_t)qword_100029660 < 8 * v5)
  {
    __break(0x5513u);
    goto LABEL_11;
  }
  if ((v5 & 0x1FFFFFFFFFFFFFFCLL) != 0)
  {
LABEL_11:
    __break(1u);
    return;
  }
  v7 = (const char *)qword_100029660[v5];
  v8 = (const char *)_os_trace_prefsdir_path(v6);
  if (snprintf(__b, 0x400uLL, "%s/%s", v8, v7) >= 1024)
    _os_assumes_log(0);
  dispatch_suspend((dispatch_object_t)qword_10003A948);
  removefile(__b, 0, 3u);
  if (v5 == 1)
    sub_10001457C();
  sub_100006A48();
  sub_1000069E0(a1, xdict, 0);
}

void sub_100014A44(_xpc_connection_s *a1, void *a2)
{
  uint64_t uint64;
  uint64_t v5;
  char __b[1024];

  if (xpc_connection_get_euid(a1))
  {
    sub_1000069E0(a1, a2, 1);
    return;
  }
  if (qword_10003A7E8 != -1)
    dispatch_once(&qword_10003A7E8, &stru_100029258);
  dispatch_sync((dispatch_queue_t)qword_10003A7F0, &stru_100029138);
  uint64 = xpc_dictionary_get_uint64(a2, "purge");
  v5 = uint64;
  if ((uint64 & 1) != 0)
  {
    sub_100015D74((uint64_t)qword_10002C398);
    sub_100015D74((uint64_t)&qword_10002CD58);
    sub_100015D74((uint64_t)&qword_10002D238);
    if ((v5 & 2) == 0)
    {
LABEL_7:
      if ((v5 & 4) == 0)
        goto LABEL_8;
      goto LABEL_13;
    }
  }
  else if ((uint64 & 2) == 0)
  {
    goto LABEL_7;
  }
  sub_100015D74((uint64_t)&qword_10002C878);
  if ((v5 & 4) == 0)
  {
LABEL_8:
    if ((v5 & 0x10) != 0)
      goto LABEL_9;
    goto LABEL_10;
  }
LABEL_13:
  sub_100015D74((uint64_t)&unk_10002D718);
  if ((v5 & 0x10) != 0)
LABEL_9:
    sub_100017764();
LABEL_10:
  memset(__b, 170, sizeof(__b));
  snprintf(__b, 0x400uLL, "All logs erased (mask:%llx)", v5);
  sub_100013FF0((uint64_t)__b);
  sub_1000069E0(a1, a2, 0);
}

void sub_100014BD8(_xpc_connection_s *a1, void *a2)
{
  char v4[1024];

  dispatch_sync((dispatch_queue_t)qword_10003A938, &stru_100029DB0);
  memset(&v4[15], 170, 0x3F1uLL);
  strcpy(v4, "writes blocked");
  sub_100013FF0((uint64_t)v4);
  sub_1000069E0(a1, a2, 0);
}

void sub_100014C88(_xpc_connection_s *a1, void *a2)
{
  dispatch_sync((dispatch_queue_t)qword_10003A938, &stru_100029DD0);
  sub_1000069E0(a1, a2, 0);
}

void sub_100014CC8(_xpc_connection_s *a1, xpc_object_t original)
{
  unsigned __int8 *uuid;
  int v5;

  if (qword_10003A9E8 != -1)
    dispatch_once(&qword_10003A9E8, &stru_10002A918);
  if (!byte_10002DF3C)
  {
    uuid = (unsigned __int8 *)xpc_dictionary_get_uuid(original, "uuid");
    if (!uuid)
    {
      v5 = 22;
      goto LABEL_7;
    }
    sub_10000A278(uuid, 0, 0, 2);
  }
  v5 = 0;
LABEL_7:
  sub_1000069E0(a1, original, v5);
}

void sub_100014D54()
{
  xpc_object_t v0;

  v0 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v0, "operation", 0xAuLL);
  if (qword_10003A800 != -1)
    dispatch_once(&qword_10003A800, &stru_1000292F8);
  xpc_connection_send_message((xpc_connection_t)qword_10003A7F8, v0);
  xpc_release(v0);
}

void sub_100014DCC(_xpc_connection_s *a1, void *a2)
{
  pid_t pid;
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
  time_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  char v31;
  char v32;
  _BYTE v33[1048];
  _QWORD __b[128];

  memset(__b, 170, sizeof(__b));
  pid = xpc_connection_get_pid(a1);
  if (proc_pidpath(pid, __b, 0x400u) <= 0)
    strcpy((char *)__b, "<unknown>");
  memset(&v33[24], 170, 0x400uLL);
  *(_QWORD *)&v33[16] = 0xAA00000000000000;
  *(_QWORD *)v33 = &v33[24];
  *(_QWORD *)&v33[8] = 0x40000000000;
  sub_100004728(v33, "--- !logd flush-buffers record\n", v5, v6, v7, v8, v9, v10, v30);
  sub_100004728(v33, "client : %s\n", v11, v12, v13, v14, v15, v16, (char)__b);
  sub_100004728(v33, "time   : ", v17, v18, v19, v20, v21, v22, v31);
  v23 = time(0);
  sub_100004068((tm *)v33, v23);
  sub_100004728(v33, "\n\n", v24, v25, v26, v27, v28, v29, v32);
  sub_1000106D0();
  if ((v33[20] & 1) != 0)
    free(*(void **)v33);
  sub_100015AC4();
  dispatch_async_and_wait((dispatch_queue_t)qword_10002C398[0], &stru_100029AD0);
  if ((unint64_t)qword_10002C398 >= 0xFFFFFFFFFFFFFB20
    || (dispatch_async_and_wait((dispatch_queue_t)qword_10002C878, &stru_100029AD0),
        (unint64_t)qword_10002C398 >= 0xFFFFFFFFFFFFF640)
    || (dispatch_async_and_wait((dispatch_queue_t)qword_10002CD58, &stru_100029AD0),
        (unint64_t)qword_10002C398 >= 0xFFFFFFFFFFFFF160)
    || (dispatch_async_and_wait((dispatch_queue_t)qword_10002D238, &stru_100029AD0),
        dispatch_async_and_wait((dispatch_queue_t)off_10002C3A0[2], &stru_100029B10),
        dispatch_async_and_wait((dispatch_queue_t)off_10002C880[2], &stru_100029B10),
        (unint64_t)qword_10002C398 >= 0xFFFFFFFFFFFFF640)
    || (dispatch_async_and_wait((dispatch_queue_t)off_10002CD60[2], &stru_100029B10),
        (unint64_t)qword_10002C398 >= 0xFFFFFFFFFFFFF160))
  {
    __break(0x5513u);
  }
  dispatch_async_and_wait((dispatch_queue_t)off_10002D240[2], &stru_100029B10);
  sub_1000069E0(a1, a2, 0);
}

void sub_100014FF0(id a1)
{
  qword_10003A8D0 = (uint64_t)dispatch_queue_create("com.apple.logd.syslog", 0);
}

void sub_100015018()
{
  if (qword_10003A8C8 != -1)
    dispatch_once(&qword_10003A8C8, &stru_100029760);
  dispatch_async_and_wait((dispatch_queue_t)qword_10003A8D0, &stru_100029720);
}

void sub_100015060(id a1)
{
  uintptr_t v1;
  int *v2;
  uint64_t v3;
  int *v4;
  int v5;
  _QWORD handler[4];
  int v7;
  uint64_t v8;
  size_t cnt;
  int *fds;
  _OWORD __b[64];

  cnt = 0xAAAAAAAAAAAAAAAALL;
  fds = (int *)0xAAAAAAAAAAAAAAAALL;
  word_10003A8B8 = -1;
  os_map_str_init(&unk_10003A8A0, 0, 1);
  if (launch_activate_socket("BSDSystemLogger", &fds, &cnt))
  {
    memset(__b, 170, sizeof(__b));
    snprintf((char *)__b, 0x400uLL, "Failed to open syslog socket: %d");
LABEL_6:
    sub_100013FF0((uint64_t)__b);
    return;
  }
  if (cnt != 1)
  {
    if (!cnt)
    {
      memset(&__b[2], 170, 0x3E0uLL);
      strcpy((char *)__b, "Syslog socket fd array is empty");
      goto LABEL_6;
    }
    _os_assumes_log(0);
  }
  v1 = *fds;
  free(fds);
  if ((v1 & 0x80000000) != 0)
  {
    memset(__b, 170, sizeof(__b));
    snprintf((char *)__b, 0x400uLL, "Invalid syslog socket fd: %d");
    goto LABEL_6;
  }
  v8 = 0x20000;
  if (setsockopt(v1, 0xFFFF, 4098, &v8, 8u) == -1)
  {
    v2 = __error();
    _os_assumes_log(*v2);
    if (close(v1) != -1)
      return;
    LODWORD(v1) = *__error();
    v3 = *__error();
    if ((_DWORD)v1 != 9)
      goto LABEL_21;
    qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_10002DF78 = v3;
    __break(1u);
LABEL_19:
    v4 = __error();
    _os_assumes_log(*v4);
    if (close(v1) != -1)
      return;
    v5 = *__error();
    v3 = *__error();
    if (v5 == 9)
    {
      qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
      qword_10002DF78 = v3;
      __break(1u);
      return;
    }
LABEL_21:
    _os_assumes_log(v3);
    return;
  }
  if (fcntl(v1, 4, 4) == -1)
    goto LABEL_19;
  if (qword_10003A8C8 != -1)
    dispatch_once(&qword_10003A8C8, &stru_100029760);
  qword_10003A8C0 = (uint64_t)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, v1, 0, (dispatch_queue_t)qword_10003A8D0);
  *(_QWORD *)&__b[0] = _NSConcreteStackBlock;
  *((_QWORD *)&__b[0] + 1) = 0x40000000;
  *(_QWORD *)&__b[1] = sub_100006C84;
  *((_QWORD *)&__b[1] + 1) = &unk_100029780;
  LODWORD(__b[2]) = v1;
  dispatch_source_set_event_handler((dispatch_source_t)qword_10003A8C0, __b);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 0x40000000;
  handler[2] = sub_10001536C;
  handler[3] = &unk_1000297A0;
  v7 = v1;
  dispatch_source_set_cancel_handler((dispatch_source_t)qword_10003A8C0, handler);
  dispatch_resume((dispatch_object_t)qword_10003A8C0);
  byte_10003A89D = 1;
}

uint64_t sub_10001536C(uint64_t a1)
{
  uint64_t result;
  int v2;

  result = close(*(_DWORD *)(a1 + 32));
  if ((_DWORD)result == -1)
  {
    v2 = *__error();
    result = *__error();
    if (v2 == 9)
    {
      qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
      qword_10002DF78 = result;
      __break(1u);
    }
    else
    {
      return _os_assumes_log(result);
    }
  }
  return result;
}

void sub_1000153DC()
{
  os_unfair_lock_lock_with_options(&unk_10003A8D8, 0x10000);
  operator new();
}

void sub_1000154C4()
{
  _QWORD block[5];
  uint64_t v1;
  unsigned __int8 *v2;
  uint64_t v3;
  _QWORD v4[2];

  if (qword_10003A9E8 != -1)
    dispatch_once(&qword_10003A9E8, &stru_10002A918);
  if (byte_10002DF3C)
  {
    v1 = 0;
    v2 = (unsigned __int8 *)&v1;
    v3 = 0x2800000000;
    v4[0] = 0xAAAAAAAAAAAAAAAALL;
    v4[1] = 0xAAAAAAAAAAAAAAAALL;
    sub_1000224C0((unsigned __int8 *)v4);
    if (!sub_10000FD54(v2 + 24))
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 0x40000000;
      block[2] = sub_100015600;
      block[3] = &unk_1000297C8;
      block[4] = &v1;
      dispatch_async((dispatch_queue_t)qword_10003A8E8, block);
    }
    _Block_object_dispose(&v1, 8);
  }
  else
  {
    sub_10000A278(byte_10003A809, 0, 0, 2);
  }
}

void sub_100015600(uint64_t a1)
{
  const unsigned __int8 *v1;
  xpc_object_t v2;

  v1 = (const unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "operation", 3uLL);
  xpc_dictionary_set_uuid(v2, "uuid", v1);
  sub_100002200(v2, 1);
  xpc_release(v2);
}

void sub_10001566C(uint64_t a1)
{
  const unsigned __int8 *v1;
  xpc_object_t v2;
  signed int v3;

  v1 = (const unsigned __int8 *)(a1 + 32);
  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "operation", 1uLL);
  xpc_dictionary_set_uuid(v2, "uuid", v1);
  v3 = sub_100002200(v2, 1);
  xpc_release(v2);
  if (v3)
    _os_assumes_log(v3);
}

void sub_1000156E8()
{
  NSObject *v0;

  v0 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  qword_10003A8E8 = (uint64_t)dispatch_queue_create_with_target_V2("com.apple.uuid.harvest", v0, 0);
  operator new();
}

void sub_1000157F4()
{
  CFArrayRef v0;
  CFArrayRef v1;
  const __CFDictionary *v2;
  const __CFDictionary *v3;
  CFTypeID v4;

  v0 = CFArrayCreate(kCFAllocatorDefault, (const void **)&off_10002C390, 1, &kCFTypeArrayCallBacks);
  if (v0)
  {
    v1 = v0;
    v2 = (const __CFDictionary *)OSKextCopyLoadedKextInfo(0, v0);
    if (v2)
    {
      v3 = v2;
      v4 = CFGetTypeID(v2);
      if (v4 == CFDictionaryGetTypeID())
        CFDictionaryApplyFunction(v3, (CFDictionaryApplierFunction)sub_100015898, 0);
      CFRelease(v3);
    }
    CFRelease(v1);
  }
}

const __CFData *sub_100015898(int a1, CFDictionaryRef theDict)
{
  const __CFData *result;
  const __CFData *v3;
  CFTypeID v4;
  unsigned __int8 *BytePtr;

  result = (const __CFData *)CFDictionaryGetValue(theDict, CFSTR("OSBundleTextUUID"));
  if (result)
  {
    v3 = result;
    v4 = CFGetTypeID(result);
    result = (const __CFData *)CFDataGetTypeID();
    if ((const __CFData *)v4 == result)
    {
      BytePtr = (unsigned __int8 *)CFDataGetBytePtr(v3);
      return (const __CFData *)sub_10000A278(BytePtr, 0, 0, 258);
    }
  }
  return result;
}

void sub_1000158FC()
{
  _xpc_connection_s *mach_service;

  qword_10003A8F0 = (uint64_t)dispatch_queue_create_with_target_V2("com.apple.logd.eventlog", 0, 0);
  mach_service = xpc_connection_create_mach_service("com.apple.logd.events", (dispatch_queue_t)qword_10003A8F0, 1uLL);
  xpc_connection_set_event_handler(mach_service, &stru_1000298B0);
  xpc_connection_activate(mach_service);
  qword_10003A8F8 = (uint64_t)mach_service;
}

uint64_t sub_100015964(int a1, xpc_object_t xdict)
{
  unsigned __int8 *uuid;
  const char *string;

  uuid = (unsigned __int8 *)xpc_dictionary_get_uuid(xdict, "uuid");
  string = xpc_dictionary_get_string(xdict, "path");
  return sub_10000A278(uuid, string, xdict, 1);
}

void sub_1000159B4(int a1, xpc_object_t original)
{
  xpc_object_t reply;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  reply = xpc_dictionary_create_reply(original);
  if (reply)
  {
    v3 = reply;
    v6 = 0;
    v7 = &v6;
    v8 = 0x2020000000;
    v9 = 0;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100017564;
    v5[3] = &unk_100029C98;
    v5[4] = &v6;
    dispatch_async_and_wait((dispatch_queue_t)qword_10003A938, v5);
    v4 = v7[3];
    _Block_object_dispose(&v6, 8);
    xpc_dictionary_set_uint64(v3, "device_salt", v4);
    xpc_dictionary_send_reply(v3);
    xpc_release(v3);
  }
}

void sub_100015AC4()
{
  void **v0;
  uint64_t v1;
  void (*v2)(uint64_t);
  void *v3;
  uint64_t *v4;

  v0 = _NSConcreteStackBlock;
  v1 = 0x40000000;
  v2 = sub_100015BE4;
  v3 = &unk_100029A70;
  v4 = qword_10002C398;
  dispatch_async((dispatch_queue_t)qword_10002C398[0], &v0);
  if ((unint64_t)qword_10002C398 >= 0xFFFFFFFFFFFFFB20)
    goto LABEL_5;
  v0 = _NSConcreteStackBlock;
  v1 = 0x40000000;
  v2 = sub_100015BE4;
  v3 = &unk_100029A70;
  v4 = &qword_10002C878;
  dispatch_async((dispatch_queue_t)qword_10002C878, &v0);
  if ((unint64_t)qword_10002C398 >= 0xFFFFFFFFFFFFF640
    || (v0 = _NSConcreteStackBlock,
        v1 = 0x40000000,
        v2 = sub_100015BE4,
        v3 = &unk_100029A70,
        v4 = &qword_10002CD58,
        dispatch_async((dispatch_queue_t)qword_10002CD58, &v0),
        (unint64_t)qword_10002C398 >= 0xFFFFFFFFFFFFF160))
  {
LABEL_5:
    __break(0x5513u);
  }
  v0 = _NSConcreteStackBlock;
  v1 = 0x40000000;
  v2 = sub_100015BE4;
  v3 = &unk_100029A70;
  v4 = &qword_10002D238;
  dispatch_async((dispatch_queue_t)qword_10002D238, &v0);
}

void sub_100015BE4(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD v3[5];

  v1 = *(_QWORD *)(a1 + 32);
  dispatch_assert_queue_V2(*(dispatch_queue_t *)v1);
  sub_10000ED60(v1);
  v2 = *(NSObject **)(*(_QWORD *)(v1 + 8) + 16);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 0x40000000;
  v3[2] = sub_100015C84;
  v3[3] = &unk_100029A90;
  v3[4] = v1;
  dispatch_async(v2, v3);
}

void sub_100015C84(uint64_t a1)
{
  sub_10000EEA0(*(_QWORD *)(a1 + 32));
}

uint64_t sub_100015CA4(uint64_t result)
{
  int v1;
  uint64_t *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v1 = result;
  v2 = qword_10002C398;
  v3 = 5;
  while (1)
  {
    v4 = *((unsigned __int8 *)v2 + 1240);
    if (v4 >= 5)
      break;
    result = (uint64_t)sub_100006AB0(qword_1000241A8[v4]);
    *v2 = result;
    if (v1)
      *((_DWORD *)v2 + 311) |= 1u;
    v5 = *((unsigned __int8 *)v2 + 1240);
    if (v5 > 4)
      goto LABEL_10;
    if (~(unint64_t)dword_100024190 < 4 * v5)
      goto LABEL_11;
    result = sub_100001B70((uint64_t)v2, dword_100024190[v5]);
    v2 += 156;
    if (!--v3)
      return result;
  }
  qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: Nope";
  qword_10002DF78 = v4;
  __break(1u);
LABEL_10:
  __break(0x5512u);
LABEL_11:
  __break(0x5513u);
  return result;
}

void sub_100015D74(uint64_t a1)
{
  NSObject *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[7];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  uint64_t v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3002000000;
  v8 = sub_100015E54;
  v9 = sub_100015E64;
  v10 = 0;
  v1 = *(NSObject **)a1;
  v2 = *(_QWORD *)(a1 + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 0x40000000;
  v4[2] = sub_100015E70;
  v4[3] = &unk_100029A50;
  v4[5] = a1;
  v4[6] = v2;
  v4[4] = &v5;
  dispatch_sync(v1, v4);
  v3 = (void *)v6[5];
  if (v3)
  {
    dispatch_block_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
    _Block_release((const void *)v6[5]);
  }
  _Block_object_dispose(&v5, 8);
}

void sub_100015E54(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 135);
}

void sub_100015E64(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 135);
}

void sub_100015E70(_QWORD *a1)
{
  uint64_t v2;
  int v3;
  int times;
  uint64_t v5;
  _QWORD v6[4];
  uint64_t v7;
  uint64_t v8;
  int v9;

  v2 = a1[5];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)v2);
  v3 = *(_DWORD *)(v2 + 1128);
  *(_DWORD *)(v2 + 1128) = -1;
  times = mach_get_times(v2 + 16, v2 + 24, v2 + 32);
  if (times)
    _os_assumes_log(times);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 0x40000000;
  v6[2] = sub_100015F78;
  v6[3] = &unk_100029A28;
  v9 = v3;
  v5 = a1[5];
  v7 = a1[6];
  v8 = v5;
  if (v7)
  {
    *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40) = dispatch_block_create((dispatch_block_flags_t)0, v6);
    dispatch_async(*(dispatch_queue_t *)(a1[6] + 16), *(dispatch_block_t *)(*(_QWORD *)(a1[4] + 8) + 40));
  }
  else
  {
    sub_100015F78((uint64_t)v6);
  }
}

void sub_100015F78(uint64_t a1)
{
  uint64_t v2;
  time_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  unsigned int v12;
  _BYTE *v13;
  unint64_t v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  dispatch_queue_t *v21;
  rb_tree_t *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  uint64_t v28;
  int v29;
  char __src;
  _OWORD v31[64];
  _QWORD __b[128];

  v2 = *(_QWORD *)(a1 + 32);
  if (!v2)
    goto LABEL_14;
  memset(__b, 170, sizeof(__b));
  if (qword_10003A9B0 != -1)
    dispatch_once(&qword_10003A9B0, &stru_10002A6F0);
  snprintf((char *)__b, 0x400uLL, "%s/%s", (const char *)qword_10003A998, *(const char **)(v2 + 8));
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 16));
  sub_100010734(v2);
  *(_QWORD *)(v2 + 56) = 0;
  *(_DWORD *)(v2 + 64) = 0;
  removefile((const char *)__b, 0, 3u);
  v29 = -1442840576;
  v26 = v31;
  v28 = 1024;
  memset(&v31[1], 170, 0x3F0uLL);
  v31[0] = *(_OWORD *)"--- !logd erase\n";
  if ((unint64_t)v31 >= 0xFFFFFFFFFFFFFFF0)
    goto LABEL_29;
  *(_QWORD *)&v31[1] = 0x203A2020656D6974;
  v27 = 24;
  if ((unint64_t)v31 >= 0xFFFFFFFFFFFFFFE8)
    goto LABEL_29;
  BYTE8(v31[1]) = 0;
  v3 = time(0);
  sub_100004068((tm *)&v26, v3);
  sub_100004728(&v26, "\npath  : %s\n", v4, v5, v6, v7, v8, v9, (char)__b);
  __src = 10;
  v10 = v29;
  if ((v29 & 2) != 0)
    goto LABEL_12;
  v11 = BYTE2(v29);
  v12 = v27;
  if (SBYTE2(v29) + (_DWORD)v28 - 1 != v27)
  {
    v13 = v26;
    v14 = ~(unint64_t)v26;
    if (~(unint64_t)v26 >= v27)
    {
      *((_BYTE *)v26 + v27) = 10;
      v15 = v12 + 1;
      v27 = v15;
      if (v11)
        goto LABEL_12;
      if (v14 >= v15)
      {
        v13[v15] = 0;
        goto LABEL_12;
      }
    }
LABEL_29:
    __break(0x5513u);
  }
  sub_1000078E8((uint64_t)&v26, &__src, 1uLL);
  v10 = v29;
LABEL_12:
  sub_1000106D0();
  if ((v10 & 1) != 0)
    free(v26);
LABEL_14:
  v16 = *(_DWORD *)(a1 + 48);
  if (v16 != -1)
    sub_10000E8E4(*(_QWORD *)(a1 + 40), v16);
  v17 = *(_QWORD *)(a1 + 40);
  v18 = v17;
  if (*(int *)(v17 + 1172) >= 1)
  {
    v19 = 0;
    do
      sub_10000F028(*(_QWORD *)(a1 + 40), v19++);
    while (v19 < *(_DWORD *)(v17 + 1172));
    v18 = *(_QWORD *)(a1 + 40);
  }
  *(_DWORD *)(v17 + 1168) = 0;
  v20 = *(_QWORD *)(v18 + 8);
  if (v20)
    v21 = (dispatch_queue_t *)(v20 + 16);
  else
    v21 = (dispatch_queue_t *)v18;
  dispatch_assert_queue_V2(*v21);
  if (*(unsigned __int8 *)(v18 + 1240) <= 4u)
  {
    __b[0] = _NSConcreteStackBlock;
    __b[1] = 0x40000000;
    __b[2] = sub_1000124E8;
    __b[3] = &unk_1000290B8;
    __b[4] = v18;
    sub_100005828((uint64_t)__b);
    v22 = (rb_tree_t *)(v18 + 1176);
    v23 = rb_tree_iterate((rb_tree_t *)(v18 + 1176), 0, 1u);
    if (v23)
    {
      v24 = v23;
      do
      {
        v25 = rb_tree_iterate(v22, v24, 1u);
        rb_tree_remove_node(v22, v24);
        free(v24);
        v24 = v25;
      }
      while (v25);
    }
  }
}

void sub_100016280()
{
  dispatch_queue_attr_t v0;
  NSObject *v1;
  dispatch_queue_t v2;
  void *v3;

  v0 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  v1 = objc_claimAutoreleasedReturnValue(v0);
  v2 = dispatch_queue_create("com.apple.power_button_queue", v1);
  v3 = (void *)qword_10003A908;
  qword_10003A908 = (uint64_t)v2;

  dispatch_async((dispatch_queue_t)qword_10003A908, &stru_100029BF0);
}

void sub_1000162E0(id a1)
{
  void *v1;
  _QWORD v2[2];
  _QWORD v3[2];
  char v4[1032];

  qword_10003A928 = IOHIDEventSystemClientCreateWithType(kCFAllocatorDefault, 1, 0);
  if (qword_10003A928)
  {
    v2[0] = CFSTR("PrimaryUsagePage");
    v2[1] = CFSTR("PrimaryUsage");
    v3[0] = &off_10002ADD8;
    v3[1] = &off_10002ADF0;
    v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v3, v2, 2));
    IOHIDEventSystemClientSetMatching(qword_10003A928, v1);
    IOHIDEventSystemClientSetDispatchQueue(qword_10003A928, qword_10003A908);
    IOHIDEventSystemClientRegisterEventBlock(qword_10003A928, &stru_100029C30, 0, 0);
    IOHIDEventSystemClientActivate(qword_10003A928);

  }
  else
  {
    memset(&v4[43], 170, 0x3D5uLL);
    strcpy(v4, "Failed to create an IOHIDEventSystemClient");
    sub_100013FF0((uint64_t)v4);
  }
}

void sub_100016418(id a1, void *a2, void *a3, void *a4, __IOHIDEvent *a5)
{
  uint64_t IntegerValue;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _OWORD *v10;
  uint64_t v11;
  char v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t TimeStamp;
  int v18;
  double v19;
  int v20;
  BOOL v21;
  unint64_t v22;
  int v23;
  BOOL v24;
  _OWORD *v25;
  BOOL v26;
  double v27;
  double v28;
  dispatch_time_t v30;
  uint64_t v31;
  int v32;
  dispatch_time_t v33;
  int v35;
  dispatch_time_t v36;
  _QWORD v37[4];
  int v38;
  _QWORD block[5];
  _OWORD v40[8];

  if (IOHIDEventGetType(a5, a2, a3, a4) != 3)
    return;
  if (IOHIDEventGetIntegerValue(a5, 196608) != 12)
    return;
  IntegerValue = IOHIDEventGetIntegerValue(a5, 196609);
  if ((unint64_t)(IntegerValue - 233) >= 2 && IntegerValue != 64 && IntegerValue != 48)
    return;
  dispatch_assert_queue_V2((dispatch_queue_t)qword_10003A908);
  v40[4] = xmmword_100024210;
  v40[5] = unk_100024220;
  memset(&v40[6], 0, 32);
  v40[0] = xmmword_1000241D0;
  v40[1] = unk_1000241E0;
  v40[2] = xmmword_1000241F0;
  v40[3] = unk_100024200;
  v7 = qword_10003A918;
  if (qword_10003A918)
  {
    v8 = ~(unint64_t)v40;
    if (~(unint64_t)v40 < 32 * (qword_10003A918 - 1))
      goto LABEL_63;
    v9 = *(_QWORD *)&v40[2 * qword_10003A918 - 2];
  }
  else
  {
    v9 = 0;
    v8 = ~(unint64_t)v40;
  }
  if (v8 < 32 * qword_10003A918)
    goto LABEL_63;
  v10 = &v40[2 * qword_10003A918];
  v11 = *(_QWORD *)v10;
  v12 = *((_BYTE *)v10 + 8);
  v13 = *((double *)v10 + 2);
  v14 = *((double *)v10 + 3);
  v15 = IOHIDEventGetIntegerValue(a5, 196609);
  v16 = IOHIDEventGetIntegerValue(a5, 196610);
  TimeStamp = IOHIDEventGetTimeStamp(a5);
  if (v15 != v11)
  {
    if (v15 != v9)
      goto LABEL_46;
    v23 = ((v12 & 1) == 0) ^ (v16 == 0);
    goto LABEL_24;
  }
  v18 = v16 == 0;
  v19 = (double)TimeStamp * 41.6666667 / 1000000000.0 - *(double *)&qword_10003A910;
  if (v7 <= 0)
    v19 = 0.0;
  v20 = (v12 & 1) == 0;
  if (v20 == v18 || (v19 >= v13 ? (v21 = v19 < v14) : (v21 = 0), !v21))
  {
    v23 = v20 ^ v18;
LABEL_24:
    if (v23)
      v22 = 0;
    else
      v22 = v7;
    goto LABEL_27;
  }
  *(double *)&qword_10003A910 = (double)TimeStamp * 41.6666667 / 1000000000.0;
  v22 = v7 + 1;
LABEL_27:
  if (v22)
    v24 = v22 == qword_10003A918;
  else
    v24 = 1;
  if (v24)
    goto LABEL_46;
  if (__CFADD__(v40, 32 * v22))
  {
LABEL_63:
    __break(0x5513u);
LABEL_64:
    __break(0x5500u);
    goto LABEL_65;
  }
  if (v22 > 3)
  {
LABEL_65:
    __break(1u);
LABEL_66:
    __break(0x5505u);
    return;
  }
  v25 = &v40[2 * v22];
  if (*(_QWORD *)v25)
    v26 = 0;
  else
    v26 = *((_BYTE *)v25 + 8) == 0;
  if (v26)
  {
    v27 = *((double *)v25 + 3);
    if (fabs(v27) + fabs(*((double *)v25 + 2)) < 0.01)
    {
      sub_10001685C();
      qword_10003A918 = 0;
      goto LABEL_46;
    }
  }
  else
  {
    v27 = *((double *)&v40[2 * v22 + 1] + 1);
  }
  qword_10003A918 = v22;
  v28 = v27 * 1000000000.0;
  if (v27 * 1000000000.0 <= -9.22337204e18 || v28 >= 9.22337204e18)
    goto LABEL_66;
  v30 = dispatch_time(0, (uint64_t)v28);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100016840;
  block[3] = &unk_10002A2B0;
  block[4] = v22;
  dispatch_after(v30, (dispatch_queue_t)qword_10003A908, block);
LABEL_46:
  if (!IOHIDEventGetIntegerValue(a5, 196610))
  {
    byte_10003A920 = 0;
    return;
  }
  if (__OFADD__(dword_10003A930, 1))
    goto LABEL_64;
  ++dword_10003A930;
  v31 = IOHIDEventGetIntegerValue(a5, 196609);
  if (v31 == 64)
  {
    v32 = byte_10003A920 | 2;
  }
  else
  {
    if (v31 != 48)
    {
      v32 = byte_10003A920;
      goto LABEL_55;
    }
    v32 = byte_10003A920 | 1;
  }
  byte_10003A920 = v32;
LABEL_55:
  if (v32 == 3)
  {
    v33 = dispatch_time(0, 200000000);
    dispatch_after(v33, (dispatch_queue_t)qword_10003A908, &stru_100029C50);
    v32 = byte_10003A920;
  }
  if ((v32 & (v32 - 1)) == 0 && v32 != 0)
  {
    v35 = dword_10003A930;
    v36 = dispatch_time(0, 5000000000);
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_1000168EC;
    v37[3] = &unk_100029C70;
    v38 = v35;
    dispatch_after(v36, (dispatch_queue_t)qword_10003A908, v37);
  }
}

uint64_t sub_100016840(uint64_t result)
{
  if (qword_10003A918 == *(_QWORD *)(result + 32))
    qword_10003A918 = 0;
  return result;
}

void sub_10001685C()
{
  char v0[1032];

  memset(&v0[23], 170, 0x3E9uLL);
  strcpy(v0, "flush for power button");
  sub_100013FF0((uint64_t)v0);
  notify_post("com.apple.system.logging.power_button_notification");
  sub_100015AC4();
}

uint64_t sub_1000168EC(uint64_t result)
{
  BOOL v1;

  v1 = (byte_10003A920 & (byte_10003A920 - 1)) != 0 || byte_10003A920 == 0;
  if (!v1 && *(_DWORD *)(result + 32) == dword_10003A930)
    byte_10003A920 = 0;
  return result;
}

void sub_100016920(id a1)
{
  if (byte_10003A920 == 3)
  {
    sub_10001685C();
    byte_10003A920 = 0;
  }
}

void sub_100016950(const char *a1)
{
  void *plist_at;
  void *v3;
  char __b[1024];

  memset(__b, 170, sizeof(__b));
  if (snprintf(__b, 0x400uLL, "%s/%s.plist", a1, "com.apple.logd") >= 1024)
    _os_assumes_log(0);
  plist_at = (void *)_os_trace_read_plist_at(4294967294, __b);
  if (plist_at)
  {
    v3 = plist_at;
    sub_100016AC8(plist_at, "QuarantineLimit", (uint64_t *)&xmmword_10003A970, (xpc_type_t)&_xpc_type_uint64);
    sub_100016AC8(v3, "SuperQuaratineLimit", (uint64_t *)&xmmword_10003A970 + 1, (xpc_type_t)&_xpc_type_uint64);
    sub_100016AC8(v3, "CoalitionSize", (uint64_t *)&qword_10003A980, (xpc_type_t)&_xpc_type_uint64);
    sub_100016AC8(v3, "QuarantineRatio", (uint64_t *)&qword_10003A988, (xpc_type_t)&_xpc_type_double);
    sub_100016AC8(v3, "DisableQuarantine", (uint64_t *)&word_10003A990, (xpc_type_t)&_xpc_type_BOOL);
    sub_100016AC8(v3, "DisableSuperQuarantine", (uint64_t *)((char *)&word_10003A990 + 1), (xpc_type_t)&_xpc_type_BOOL);
    sub_100016AC8(v3, "DisableHighVolOverrides", (uint64_t *)&byte_10003A992, (xpc_type_t)&_xpc_type_BOOL);
    xpc_release(v3);
  }
}

void sub_100016AC8(void *a1, const char *a2, uint64_t *a3, xpc_type_t a4)
{
  xpc_object_t value;
  xpc_type_t type;

  value = xpc_dictionary_get_value(a1, a2);
  type = xpc_get_type(value);
  if (value && type == a4)
  {
    if (a4 == (xpc_type_t)&_xpc_type_uint64)
    {
      *a3 = xpc_uint64_get_value(value);
    }
    else if (a4 == (xpc_type_t)&_xpc_type_double)
    {
      *(double *)a3 = xpc_double_get_value(value);
    }
    else if (a4 == (xpc_type_t)&_xpc_type_BOOL)
    {
      *(_BYTE *)a3 = xpc_BOOL_get_value(value);
    }
  }
}

uint64_t sub_100016B64(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5;
  timespec v9;
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
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  int *v32;
  unsigned int v33;
  int v34;
  char v36;
  unsigned int v37;
  _BYTE v39[1056];
  stat v40;

  v5 = a5;
  v9.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v9.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v40.st_blksize = v9;
  *(timespec *)v40.st_qspare = v9;
  v40.st_birthtimespec = v9;
  *(timespec *)&v40.st_size = v9;
  v40.st_mtimespec = v9;
  v40.st_ctimespec = v9;
  *(timespec *)&v40.st_uid = v9;
  v40.st_atimespec = v9;
  *(timespec *)&v40.st_dev = v9;
  *(_QWORD *)&v39[24] = 0;
  v10 = *(_QWORD *)(a1 + 56);
  v37 = sub_100016DE0(a1, a5, (uint64_t)&v39[24]);
  memset(&v39[32], 170, 0x400uLL);
  *(_QWORD *)&v39[16] = 0xAA00000000100000;
  *(_QWORD *)v39 = &v39[32];
  *(_QWORD *)&v39[8] = 0x40000000000;
  if (a2 >= 4)
    goto LABEL_30;
  if (~(unint64_t)off_100029E38 < 8 * (unint64_t)a2)
  {
LABEL_28:
    __break(0x5513u);
LABEL_29:
    __break(0x5500u);
LABEL_30:
    __break(0x5512u);
  }
  sub_100016E90((tm *)v39, a1, (uint64_t)off_100029E38[a2], a3, v11, v12, v13, v14, v36);
  v19 = v37;
  if ((int)v37 < 1)
  {
    v22 = 0;
    *(_DWORD *)(a1 + 64) = v37;
    goto LABEL_24;
  }
  v20 = 0;
  v21 = 0;
  v22 = 0;
  v23 = v37;
  while (1)
  {
    if ((int)v23 <= *(_DWORD *)(a1 + 92))
    {
      if (a3 < 1)
        break;
      if (__OFSUB__(v10, v22))
        goto LABEL_27;
      if (v10 - v22 <= a4)
        break;
    }
    if (__CFADD__(*(_QWORD *)&v39[24], v20))
      goto LABEL_28;
    v24 = (const char *)(*(_QWORD *)(*(_QWORD *)&v39[24] + v20) + 21);
    if (fstatat(v5, v24, &v40, 32) == -1)
      v40.st_size = 0;
    if (unlinkat(v5, v24, 0) == -1)
    {
      v32 = __error();
      _os_assumes_log(*v32);
    }
    v31 = __OFADD__(v22, v40.st_size);
    v22 += v40.st_size;
    if (v31)
      goto LABEL_29;
    v31 = __OFSUB__(a3, v40.st_size);
    a3 -= v40.st_size;
    if (v31)
      goto LABEL_27;
    sub_100004728(v39, "    - %s/%s: %lld bytes\n", v25, v26, v27, v28, v29, v30, *(_QWORD *)(a1 + 8));
    *(_QWORD *)(a1 + 32) = sub_100017050(v24);
    ++v21;
    v20 += 8;
    if (!--v23)
    {
      v33 = v37;
      v21 = v37;
      goto LABEL_20;
    }
  }
  v33 = v37;
LABEL_20:
  v31 = __OFSUB__(v33, (_DWORD)v21);
  v34 = v33 - v21;
  if (v31)
  {
LABEL_27:
    __break(0x5515u);
    goto LABEL_28;
  }
  *(_DWORD *)(a1 + 64) = v34;
  if ((_DWORD)v21)
    sub_1000170E4(v39, a1, v21, v22, v15, v16, v17, v18);
  v19 = v37;
LABEL_24:
  if ((v39[20] & 1) != 0)
    free(*(void **)v39);
  _os_trace_scandir_free_namelist(v19, *(_QWORD *)&v39[24]);
  return v22;
}

uint64_t sub_100016DE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD v7[5];

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001723C;
  v7[3] = &unk_100029E58;
  v7[4] = a1;
  return _os_trace_fdscandir_b(a2, a3, v7, &stru_100029E98);
}

uint64_t sub_100016E90(tm *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  char v9;
  uint64_t tm_hour;
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  time_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v36;
  char __src;

  v9 = a4;
  if ((a1->tm_year & 2) == 0)
  {
    tm_hour = a1->tm_hour;
    if ((SBYTE2(a1->tm_year) + a1->tm_mday - tm_hour - 1) <= 0x16)
    {
      sub_1000078E8((uint64_t)a1, "--- !logd purge record\n", 0x17uLL);
    }
    else
    {
      if (__CFADD__(*(_QWORD *)&a1->tm_sec, tm_hour))
        goto LABEL_16;
      qmemcpy((void *)(*(_QWORD *)&a1->tm_sec + tm_hour), "--- !logd purge record\n", 23);
      v13 = (a1->tm_hour + 23);
      a1->tm_hour = v13;
      if (!BYTE2(a1->tm_year))
      {
        if (__CFADD__(*(_QWORD *)&a1->tm_sec, v13))
          goto LABEL_16;
        *(_BYTE *)(*(_QWORD *)&a1->tm_sec + v13) = 0;
      }
    }
  }
  sub_100004728(a1, "type  : %s %s\n", a3, a4, a5, a6, a7, a8, *(_QWORD *)(a2 + 8));
  sub_100004728(a1, "goal  : %lld\n", v14, v15, v16, v17, v18, v19, v9);
  sub_100004728(a1, "time  : ", v20, v21, v22, v23, v24, v25, v36);
  v26 = time(0);
  sub_100004068(a1, v26);
  __src = 10;
  if ((a1->tm_year & 2) == 0)
  {
    v33 = a1->tm_hour;
    if (SBYTE2(a1->tm_year) + a1->tm_mday - 1 == (_DWORD)v33)
    {
      sub_1000078E8((uint64_t)a1, &__src, 1uLL);
      return sub_100004728(a1, "files :\n", v27, v28, v29, v30, v31, v32, a9);
    }
    if (__CFADD__(*(_QWORD *)&a1->tm_sec, v33))
      goto LABEL_16;
    *(_BYTE *)(*(_QWORD *)&a1->tm_sec + v33) = 10;
    v34 = (a1->tm_hour + 1);
    a1->tm_hour = v34;
    if (!BYTE2(a1->tm_year))
    {
      if (!__CFADD__(*(_QWORD *)&a1->tm_sec, v34))
      {
        *(_BYTE *)(*(_QWORD *)&a1->tm_sec + v34) = 0;
        return sub_100004728(a1, "files :\n", v27, v28, v29, v30, v31, v32, a9);
      }
LABEL_16:
      __break(0x5513u);
    }
  }
  return sub_100004728(a1, "files :\n", v27, v28, v29, v30, v31, v32, a9);
}

unint64_t sub_100017050(const char *a1)
{
  unint64_t v2;
  char *__s1;

  __s1 = (char *)0xAAAAAAAAAAAAAAAALL;
  v2 = strtoull(a1, &__s1, 16);
  if (__s1 - a1 != 16)
    return 0;
  if (!strcmp(__s1, ".tracev3"))
    return v2;
  return 0;
}

void sub_1000170E4(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8;
  unint64_t *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  _BOOL4 v27;
  BOOL v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  char __src;

  v8 = a4;
  v11 = (unint64_t *)(a2 + 56);
  do
  {
    v12 = __ldxr(v11);
    v13 = v12 - a4;
  }
  while (__stxr(v12 - a4, v11));
  if (__OFSUB__(v12, a4))
LABEL_16:
    __break(0x5515u);
  sub_100004728(a1, "count : %d\n", a3, a4, a5, a6, a7, a8, a3);
  sub_100004728(a1, "size  : %lld\n", v14, v15, v16, v17, v18, v19, v8);
  v26 = *(_DWORD *)(a2 + 64);
  v27 = *(_DWORD *)(a2 + 68) != -1;
  v28 = __OFADD__(v26, v27);
  v29 = v26 + v27;
  if (v28 || __OFADD__(v13, *(_QWORD *)(a2 + 40)))
  {
    __break(0x5500u);
    goto LABEL_15;
  }
  sub_100004728(a1, "kept  : %d files, %lld bytes\n", v20, v21, v22, v23, v24, v25, v29);
  __src = 10;
  if ((*((_WORD *)a1 + 10) & 2) != 0)
    goto LABEL_12;
  v30 = *((unsigned int *)a1 + 2);
  if (*((char *)a1 + 22) + *((_DWORD *)a1 + 3) - 1 == (_DWORD)v30)
  {
    sub_1000078E8((uint64_t)a1, &__src, 1uLL);
    goto LABEL_12;
  }
  if (__CFADD__(*a1, v30))
  {
LABEL_15:
    __break(0x5513u);
    goto LABEL_16;
  }
  *(_BYTE *)(*a1 + v30) = 10;
  v31 = (*((_DWORD *)a1 + 2) + 1);
  *((_DWORD *)a1 + 2) = v31;
  if (!*((_BYTE *)a1 + 22))
  {
    if (!__CFADD__(*a1, v31))
    {
      *(_BYTE *)(*a1 + v31) = 0;
      goto LABEL_12;
    }
    goto LABEL_15;
  }
LABEL_12:
  sub_1000106D0();
}

char *sub_10001723C(uint64_t a1, uint64_t a2)
{
  const char *v3;
  char *result;
  unint64_t v5;
  uint64_t v6;
  int v7;
  unint64_t v8;
  BOOL v9;
  uint64_t v10;

  if (*(_BYTE *)(a2 + 20) != 8)
    return 0;
  v3 = (const char *)(a2 + 21);
  result = strrchr((char *)(a2 + 21), 46);
  if (!result)
    return result;
  if (strcmp(result, ".tracev3"))
    return 0;
  if (!strncmp(v3, "logdata.Persistent.", 0x13uLL))
    return (char *)1;
  v5 = sub_100017050(v3);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_DWORD *)(v6 + 68);
  v8 = *(_QWORD *)(v6 + 24);
  v9 = v8 < 2 || v7 == -1;
  v10 = -2;
  if (v9)
    v10 = -1;
  return (char *)(v5 - 1 < v8 + v10);
}

int sub_1000172E8(id a1, const dirent **a2, const dirent **a3)
{
  int v5;
  int v6;

  v5 = strncmp((*a2)->d_name, "logdata.Persistent.", 0x13uLL);
  v6 = strncmp((*a3)->d_name, "logdata.Persistent.", 0x13uLL);
  if ((v5 == 0) != (v6 == 0))
    return (v5 != 0) - (v6 != 0);
  else
    return alphasort(a2, a3);
}

int *sub_100017390(int a1, const char *a2)
{
  const char *v2;
  int *result;
  int v5;
  int v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;

  v2 = a2;
  result = (int *)mkpathat_np(a1, a2, 0x1EDu);
  if ((_DWORD)result && (_DWORD)result != 17)
    goto LABEL_17;
  if (qword_10003A9B8 != -1)
    dispatch_once(&qword_10003A9B8, &stru_10002A858);
  if (!byte_10003A9C0)
    goto LABEL_12;
  v12 = 0;
  v11 = xmmword_100024250;
  v10 = 0x4000001EDLL;
  v5 = openat(a1, v2, 0x100000);
  if (v5 == -1)
  {
    result = __error();
    v9 = *result;
    qword_10002DF48 = (uint64_t)"BUG IN LIBTRACE: Unable to open path";
    qword_10002DF78 = v9;
    __break(1u);
LABEL_17:
    qword_10002DF48 = (uint64_t)"BUG IN LIBTRACE: Unable to create path";
    qword_10002DF78 = (int)result;
    __break(1u);
    return result;
  }
  v6 = v5;
  if (fsetattrlist(v5, &v11, &v10, 8uLL, 0) == -1)
  {
    v8 = __error();
    _os_assumes_log(*v8);
  }
  result = (int *)close(v6);
  if ((_DWORD)result == -1)
  {
    v2 = (const char *)*__error();
    v7 = *__error();
    if ((_DWORD)v2 != 9)
      return (int *)_os_assumes_log(v7);
    qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_10002DF78 = v7;
    __break(1u);
LABEL_12:
    result = (int *)fchmodat(a1, v2, 0x1EDu, 32);
    if ((_DWORD)result != -1)
      return result;
    v7 = *__error();
    return (int *)_os_assumes_log(v7);
  }
  return result;
}

uint64_t sub_100017564(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = qword_10003A940;
  return result;
}

uint64_t sub_10001757C(uint64_t a1)
{
  int v2;
  int v3;
  DIR *v4;
  timespec v5;
  dirent *v6;
  uint64_t i;
  const char *d_name;
  char *v9;
  BOOL v10;
  unint64_t v11;
  int v12;
  int v13;
  int *v14;
  uint64_t result;
  int *v16;
  uint64_t v17;
  stat v18;

  v2 = openat(dword_10002DBF8, *(const char **)(a1 + 8), 1048832);
  if (v2 < 0)
  {
LABEL_19:
    v17 = *__error();
    qword_10002DF48 = (uint64_t)"BUG IN LIBTRACE: Unable to open log book";
    qword_10002DF78 = v17;
    __break(1u);
  }
  v3 = v2;
  v4 = fdopendir(v2);
  v5.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v5.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v18.st_blksize = v5;
  *(timespec *)v18.st_qspare = v5;
  v18.st_birthtimespec = v5;
  *(timespec *)&v18.st_size = v5;
  v18.st_mtimespec = v5;
  v18.st_ctimespec = v5;
  *(timespec *)&v18.st_uid = v5;
  v18.st_atimespec = v5;
  *(timespec *)&v18.st_dev = v5;
  v6 = readdir(v4);
  for (i = 0; v6; v6 = readdir(v4))
  {
    if (v6->d_type == 8)
    {
      d_name = v6->d_name;
      v9 = strrchr(v6->d_name, 46);
      if (v9)
      {
        if (!strcmp(v9, ".tracev3"))
        {
          if (fstatat(v3, d_name, &v18, 32) == -1)
          {
            v14 = __error();
            _os_assumes_log(*v14);
          }
          else
          {
            v10 = __OFADD__(i, v18.st_size);
            i += v18.st_size;
            if (v10)
              goto LABEL_18;
          }
          v11 = sub_100017050(d_name);
          if (v11 >= *(_QWORD *)(a1 + 24))
            *(_QWORD *)(a1 + 24) = v11 + 1;
          v12 = *(_DWORD *)(a1 + 64);
          v10 = __OFADD__(v12, 1);
          v13 = v12 + 1;
          if (v10)
          {
LABEL_18:
            __break(0x5500u);
            goto LABEL_19;
          }
          *(_DWORD *)(a1 + 64) = v13;
        }
      }
    }
  }
  *(_QWORD *)(a1 + 72) = -1;
  result = closedir(v4);
  if ((_DWORD)result == -1)
  {
    v16 = __error();
    result = _os_assumes_log(*v16);
  }
  *(_QWORD *)(a1 + 56) = i;
  return result;
}

uint64_t sub_10001772C(uint64_t a1)
{
  uint64_t result;

  result = sub_100016B64(*(_QWORD *)(a1 + 40), *(_DWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned int *)(a1 + 68));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void sub_100017764()
{
  void *v0;
  _QWORD v1[7];
  _QWORD v2[4];
  _QWORD v3[4];
  _QWORD v4[4];
  _QWORD v5[4];
  _QWORD v6[4];
  _QWORD v7[4];
  _QWORD v8[4];
  _BYTE __b[1024];

  if (!__OFADD__(time(0), -86400))
  {
    v8[0] = 0;
    v8[1] = v8;
    v8[2] = 0x2020000000;
    v8[3] = 0;
    v7[0] = 0;
    v7[1] = v7;
    v7[2] = 0x2020000000;
    v7[3] = 0;
    v6[0] = 0;
    v6[1] = v6;
    v6[2] = 0x2020000000;
    v6[3] = 0;
    v5[0] = 0;
    v5[1] = v5;
    v5[2] = 0x2020000000;
    v5[3] = 0;
    v4[0] = 0;
    v4[1] = v4;
    v4[2] = 0x2020000000;
    v4[3] = 0;
    v3[0] = 0;
    v3[1] = v3;
    v3[2] = 0x2020000000;
    v3[3] = 0;
    v2[0] = 0;
    v2[1] = v2;
    v2[2] = 0x2020000000;
    v2[3] = 0;
    v0 = memset(__b, 170, sizeof(__b));
    v1[0] = 0;
    v1[1] = v1;
    v1[2] = 0x3810000000;
    v1[6] = 0xAA00000000100000;
    v1[3] = "";
    v1[4] = __b;
    v1[5] = 0x40000000000;
    _os_trace_get_boot_uuid(v0);
    sub_1000153DC();
  }
  __break(0x5515u);
}

void sub_100017E68(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint8x8_t v17;
  unint64_t v18;
  _QWORD *v19;
  _QWORD *i;
  unint64_t v21;
  _QWORD *v23;
  float v24;
  float v25;
  _BOOL8 v26;
  unint64_t v27;
  unint64_t v28;
  size_t v29;
  uint64_t v30;
  _QWORD *v31;
  unint64_t v32;
  os_unfair_lock_s *lock;

  sub_10000A7BC(*(_QWORD *)(a1 + 32), (uint64_t *)(a2 + 32));
  sub_10000A7BC(*(_QWORD *)(a1 + 32), (uint64_t *)(a2 + 48));
  os_unfair_lock_lock_with_options(a2 + 132, 0x10000);
  if (!*(_WORD *)(a2 + 130))
  {
LABEL_5:
    lock = (os_unfair_lock_s *)(a2 + 132);
    v7 = *(_QWORD *)(a2 + 80);
    if (!v7 || (v8 = *(_QWORD **)(v7 + 16)) == 0)
    {
LABEL_52:
      os_unfair_lock_unlock(lock);
      return;
    }
    v9 = *(_QWORD *)(a1 + 32);
    v10 = (_QWORD *)(v9 + 16);
    while (1)
    {
      v11 = v8[2];
      v12 = v8[3];
      v13 = v11 ^ __ROR8__(v12 + 16, 16);
      v14 = __ROR8__(v12 + 16, 16);
      v15 = (0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v14 ^ ((0x9DDFEA08EB382D69 * v13) >> 47) ^ (0x9DDFEA08EB382D69 * v13))) ^ ((0x9DDFEA08EB382D69 * (v14 ^ ((0x9DDFEA08EB382D69 * v13) >> 47) ^ (0x9DDFEA08EB382D69 * v13))) >> 47))) ^ v12;
      v16 = *(_QWORD *)(v9 + 8);
      if (v16)
      {
        v17 = (uint8x8_t)vcnt_s8((int8x8_t)v16);
        v17.i16[0] = vaddlv_u8(v17);
        if (v17.u32[0] > 1uLL)
        {
          v18 = v15;
          if (v15 >= v16)
            v18 = v15 % v16;
        }
        else
        {
          v18 = v15 & (v16 - 1);
        }
        v19 = *(_QWORD **)(*(_QWORD *)v9 + 8 * v18);
        if (v19)
        {
          for (i = (_QWORD *)*v19; i; i = (_QWORD *)*i)
          {
            v21 = i[1];
            if (v21 == v15)
            {
              if (i[2] == v11 && i[3] == v12)
                goto LABEL_51;
            }
            else
            {
              if (v17.u32[0] > 1uLL)
              {
                if (v21 >= v16)
                  v21 %= v16;
              }
              else
              {
                v21 &= v16 - 1;
              }
              if (v21 != v18)
                break;
            }
          }
        }
      }
      else
      {
        v18 = 0xAAAAAAAAAAAAAAAALL;
      }
      v23 = operator new(0x20uLL);
      *v23 = 0;
      v23[1] = v15;
      *((_OWORD *)v23 + 1) = *((_OWORD *)v8 + 1);
      v24 = (float)(unint64_t)(*(_QWORD *)(v9 + 24) + 1);
      v25 = *(float *)(v9 + 32);
      if (!v16 || (float)(v25 * (float)v16) < v24)
      {
        v26 = (v16 & (v16 - 1)) != 0;
        if (v16 < 3)
          v26 = 1;
        v27 = v26 | (2 * v16);
        v28 = vcvtps_u32_f32(v24 / v25);
        if (v27 <= v28)
          v29 = v28;
        else
          v29 = v27;
        sub_10000F6D8(v9, v29);
        v16 = *(_QWORD *)(v9 + 8);
        if ((v16 & (v16 - 1)) != 0)
        {
          if (v15 >= v16)
            v18 = v15 % v16;
          else
            v18 = v15;
        }
        else
        {
          v18 = (v16 - 1) & v15;
        }
      }
      v30 = *(_QWORD *)v9;
      v31 = *(_QWORD **)(*(_QWORD *)v9 + 8 * v18);
      if (v31)
      {
        *v23 = *v31;
      }
      else
      {
        *v23 = *v10;
        *v10 = v23;
        *(_QWORD *)(v30 + 8 * v18) = v10;
        if (!*v23)
          goto LABEL_50;
        v32 = *(_QWORD *)(*v23 + 8);
        if ((v16 & (v16 - 1)) != 0)
        {
          if (v32 >= v16)
            v32 %= v16;
        }
        else
        {
          v32 &= v16 - 1;
        }
        v31 = (_QWORD *)(*(_QWORD *)v9 + 8 * v32);
      }
      *v31 = v23;
LABEL_50:
      ++*(_QWORD *)(v9 + 24);
LABEL_51:
      v8 = (_QWORD *)*v8;
      if (!v8)
        goto LABEL_52;
    }
  }
  v4 = 0;
  v5 = 14;
  while (1)
  {
    v6 = *(_QWORD *)(a2 + 72);
    if (__CFADD__(v6, v5 - 14))
      break;
    sub_10000A7BC(*(_QWORD *)(a1 + 32), (uint64_t *)(v6 + v5));
    ++v4;
    v5 += 32;
    if (v4 >= *(unsigned __int16 *)(a2 + 130))
      goto LABEL_5;
  }
  __break(0x5513u);
}

void sub_100018150(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_10000A7BC(*(_QWORD *)(a1 + 32), a3);
}

void sub_10001815C(uint64_t a1, uint64_t a2)
{
  char *v4;
  uint64_t v5;
  char *v6;
  size_t v7;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  int *v11;
  _QWORD v12[2];
  unsigned int (*v13)(_QWORD *);
  void *v14;
  id v15;
  size_t v16;

  v4 = strrchr((char *)(a2 + 104), 46);
  if (v4)
  {
    if (!strcmp(v4, ".tracev3"))
    {
      v16 = 0xAAAAAAAAAAAAAAAALL;
      v5 = _os_trace_mmap_at(4294967294, *(_QWORD *)(a2 + 48), 256, &v16);
      if (v5)
      {
        v6 = (char *)v5;
        v7 = v16;
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v13 = (unsigned int (*)(_QWORD *))sub_100018A58;
        v14 = &unk_100029F00;
        v15 = *(id *)(a1 + 32);
        v8 = v12;
        v9 = 0;
        do
        {
          if (v7 - v9 < 0x10)
            break;
          v10 = *(_QWORD *)&v6[v9 + 8];
          if (v7 - v9 - 16 < v10)
            break;
          if (!v13(v8))
            break;
          v9 = (v9 + v10 + 23) & 0xFFFFFFFFFFFFFFF8;
        }
        while (v9 - 1 < v7);

        if (munmap(v6, v16) == -1)
        {
          v11 = __error();
          _os_assumes_log(*v11);
        }

      }
    }
  }
}

tm *sub_1000182C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  tm *result;
  uint64_t v11;
  uint64_t v12;
  tm *v13;
  time_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;

  sub_100004728((_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32), "--- !logd uuid purge records\n", a3, a4, a5, a6, a7, a8, v19);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if ((*(_WORD *)(v9 + 52) & 2) == 0)
  {
    result = (tm *)(v9 + 32);
    v11 = *(unsigned int *)(v9 + 40);
    if ((*(char *)(v9 + 54) + *(_DWORD *)(v9 + 44) - v11 - 1) <= 7)
    {
      sub_1000078E8((uint64_t)result, "time  : ", 8uLL);
    }
    else
    {
      if (__CFADD__(*(_QWORD *)&result->tm_sec, v11))
        goto LABEL_16;
      *(_QWORD *)(*(_QWORD *)&result->tm_sec + v11) = 0x203A2020656D6974;
      v12 = (*(_DWORD *)(v9 + 40) + 8);
      *(_DWORD *)(v9 + 40) = v12;
      if (!*(_BYTE *)(v9 + 54))
      {
        if (__CFADD__(*(_QWORD *)&result->tm_sec, v12))
          goto LABEL_16;
        *(_BYTE *)(*(_QWORD *)&result->tm_sec + v12) = 0;
      }
    }
  }
  v13 = (tm *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32);
  v14 = time(0);
  result = sub_100004068(v13, v14);
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if ((*(_WORD *)(v15 + 52) & 2) != 0)
    return result;
  result = (tm *)(v15 + 32);
  v16 = *(unsigned int *)(v15 + 40);
  if ((*(char *)(v15 + 54) + *(_DWORD *)(v15 + 44) - v16 - 1) <= 8)
    return (tm *)sub_1000078E8((uint64_t)result, "\nuuids :\n", 9uLL);
  if (__CFADD__(*(_QWORD *)&result->tm_sec, v16))
    goto LABEL_16;
  v17 = *(_QWORD *)&result->tm_sec + v16;
  *(_QWORD *)v17 = *(_QWORD *)"\nuuids :\n";
  *(_BYTE *)(v17 + 8) = 10;
  v18 = (*(_DWORD *)(v15 + 40) + 9);
  *(_DWORD *)(v15 + 40) = v18;
  if (*(_BYTE *)(v15 + 54))
    return result;
  if (__CFADD__(*(_QWORD *)&result->tm_sec, v18))
  {
LABEL_16:
    __break(0x5513u);
    return result;
  }
  *(_BYTE *)(*(_QWORD *)&result->tm_sec + v18) = 0;
  return result;
}

uint64_t sub_100018438(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int *v32;
  int *v33;

  v8 = *(unsigned __int16 *)(a2 + 88);
  switch(*(_WORD *)(a2 + 88))
  {
    case 1:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      sub_100004728((_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), "    - %s\n", a3, a4, a5, a6, a7, a8, *(_QWORD *)(a2 + 48));
      result = removefile(*(const char **)(a2 + 48), 0, 1u);
      break;
    case 2:
    case 4:
    case 7:
    case 0xA:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      v11 = (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
      v12 = *(_QWORD *)(a2 + 48);
      strerror(*(_DWORD *)(a2 + 56));
      result = sub_100004728(v11, "    - error at %s (%d:%s)\n", v13, v14, v15, v16, v17, v18, v12);
      break;
    case 3:
    case 8:
      if (unlink(*(const char **)(a2 + 48)) == -1)
      {
        v32 = __error();
        _os_assumes_log(*v32);
      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      result = sub_100004728((_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), "    - %s [default]\n", v20, v21, v22, v23, v24, v25, *(_QWORD *)(a2 + 48));
      break;
    case 0xC:
    case 0xD:
      if (*(_WORD *)(a2 + 86))
      {
        if (unlink(*(const char **)(a2 + 48)) == -1)
        {
          v33 = __error();
          _os_assumes_log(*v33);
        }
        result = sub_100004728((_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), "    - %s [symlink]\n", v26, v27, v28, v29, v30, v31, *(_QWORD *)(a2 + 48));
      }
      else
      {
        result = sub_100004728((_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), "    - root %s is a symbolic link\n", a3, a4, a5, a6, a7, a8, *(_QWORD *)(a2 + 48));
      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      break;
    default:
      qword_10002DF48 = (uint64_t)"BUG IN LIBTRACE: unexpected fts entry";
      qword_10002DF78 = v8;
      __break(1u);
      JUMPOUT(0x100018614);
  }
  return result;
}

uint64_t sub_100018648(uint64_t a1, uint64_t a2, unsigned __int8 *uu)
{
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t result;
  const char *v19;
  const void *v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uuid_string_t out;
  __int128 value;
  _BYTE v47[21];

  if (*(_WORD *)(a2 + 88) != 8)
  {
    v44 = (const char *)_os_assert_log(0);
    _os_crash(v44);
    __break(1u);
    goto LABEL_19;
  }
  *(_QWORD *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)out = v6;
  *(_OWORD *)&out[16] = v6;
  uuid_unparse_upper(uu, out);
  v7 = *(_QWORD *)(*(_QWORD *)(a2 + 96) + 96);
  if (sub_10000A5A8(*(_QWORD **)(a1 + 104), uu))
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v15 = *(_QWORD *)(v14 + 24);
    v16 = __OFADD__(v15, v7);
    v17 = v15 + v7;
    if (!v16)
    {
      *(_QWORD *)(v14 + 24) = v17;
      return sub_100004728((_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32), "    - %s: %lld bytes IN USE\n", v8, v9, v10, v11, v12, v13, (char)out);
    }
LABEL_19:
    __break(0x5500u);
  }
  v19 = *(const char **)(a2 + 48);
  v20 = *(const void **)(a1 + 112);
  *(_QWORD *)&v47[13] = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v21 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v21 + 1) = 0xAAAAAAAAAAAAAAAALL;
  value = v21;
  *(_OWORD *)v47 = v21;
  if (getxattr(v19, "com.apple.uuiddb.boot-uuid", &value, 0x25uLL, 0, 0) == 37 && !memcmp(&value, v20, 0x25uLL))
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v41 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v42 = *(_QWORD *)(v41 + 24);
    v16 = __OFADD__(v42, v7);
    v43 = v42 + v7;
    if (v16)
      goto LABEL_19;
    *(_QWORD *)(v41 + 24) = v43;
    return sub_100004728((_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32), "    - %s: %lld bytes LOCKED\n", v22, v23, v24, v25, v26, v27, (char)out);
  }
  else if (*(_QWORD *)(*(_QWORD *)(a2 + 96) + 64) >= *(_QWORD *)(a1 + 120))
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    v35 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v36 = *(_QWORD *)(v35 + 24);
    v16 = __OFADD__(v36, v7);
    v37 = v36 + v7;
    if (v16)
      goto LABEL_19;
    *(_QWORD *)(v35 + 24) = v37;
    return sub_100004728((_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32), "    - %s: %lld bytes RECENT\n", v22, v23, v24, v25, v26, v27, (char)out);
  }
  else
  {
    result = unlink(*(const char **)(a2 + 48));
    if ((_DWORD)result)
    {
      if ((_DWORD)result == -1)
      {
        v34 = __error();
        return _os_assumes_log(*v34);
      }
    }
    else
    {
      v38 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
      v39 = *(_QWORD *)(v38 + 24);
      v16 = __OFADD__(v39, v7);
      v40 = v39 + v7;
      if (v16)
        goto LABEL_19;
      *(_QWORD *)(v38 + 24) = v40;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = 1;
      return sub_100004728((_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32), "    - %s: %lld bytes REMOVED\n", v28, v29, v30, v31, v32, v33, (char)out);
    }
  }
  return result;
}

void sub_1000188B4(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
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
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  char __src;

  if (*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    sub_100004728((_QWORD *)(*(_QWORD *)(a1[5] + 8) + 32), "files_in_use: %ld bytes: %lld\n", a3, a4, a5, a6, a7, a8, *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24));
    sub_100004728((_QWORD *)(*(_QWORD *)(a1[5] + 8) + 32), "files_locked: %ld bytes: %lld\n", v9, v10, v11, v12, v13, v14, *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24));
    sub_100004728((_QWORD *)(*(_QWORD *)(a1[5] + 8) + 32), "files_recent: %ld bytes: %lld\n", v15, v16, v17, v18, v19, v20, *(_QWORD *)(*(_QWORD *)(a1[10] + 8) + 24));
    v21 = *(_QWORD *)(a1[5] + 8);
    __src = 10;
    if ((*(_WORD *)(v21 + 52) & 2) == 0)
    {
      v22 = (_QWORD *)(v21 + 32);
      v23 = *(unsigned int *)(v21 + 40);
      if (*(char *)(v21 + 54) + *(_DWORD *)(v21 + 44) - 1 == (_DWORD)v23)
      {
        sub_1000078E8((uint64_t)v22, &__src, 1uLL);
        goto LABEL_8;
      }
      if (__CFADD__(*v22, v23))
      {
LABEL_11:
        __break(0x5513u);
        return;
      }
      *(_BYTE *)(*v22 + v23) = 10;
      v24 = (*(_DWORD *)(v21 + 40) + 1);
      *(_DWORD *)(v21 + 40) = v24;
      if (!*(_BYTE *)(v21 + 54))
      {
        if (!__CFADD__(*v22, v24))
        {
          *(_BYTE *)(*v22 + v24) = 0;
          goto LABEL_8;
        }
        goto LABEL_11;
      }
    }
LABEL_8:
    sub_1000106D0();
  }
}

uint64_t sub_100018A58(uint64_t a1, _DWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *i;
  _QWORD v9[2];
  uint64_t (*v10)(uint64_t);
  void *v11;
  uint64_t v12;

  if (*a2 == 24587)
  {
    v3 = sub_10001EFEC(a2);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(v3 + 16);
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 0x40000000;
      v10 = sub_10001EDD8;
      v11 = &unk_10002A478;
      v12 = v5;
      for (i = *(_QWORD **)(v6 + 16); i; i = (_QWORD *)*i)
        ((void (*)(_QWORD *, _QWORD *, _QWORD))v10)(v9, i + 2, i[4]);
      sub_1000019FC(v4);
    }
  }
  return 1;
}

uint64_t sub_100018B30(void *a1, const char *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t result;
  int v8;

  v3 = a1;
  v4 = open(a2, 1048832);
  if ((_DWORD)v4 == -1)
  {
    v6 = 0;
    result = *__error();
    goto LABEL_6;
  }
  v5 = v4;
  v6 = sub_100007FD0(v3, v4);
  if (close(v5) != -1)
  {
LABEL_3:

    return v6;
  }
  v8 = *__error();
  result = *__error();
  if (v8 != 9)
  {
LABEL_6:
    _os_assumes_log(result);
    goto LABEL_3;
  }
  qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_10002DF78 = result;
  __break(1u);
  return result;
}

id sub_100018BF8(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (!v4)
  {
    v8 = v3;
LABEL_6:
    v7 = v8;
    goto LABEL_7;
  }
  if (!v3)
  {
    v8 = v4;
    goto LABEL_6;
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100018D28;
  v10[3] = &unk_100029FE8;
  v6 = v3;
  v11 = v6;
  xpc_dictionary_apply(v5, v10);
  v7 = v6;

LABEL_7:
  return v7;
}

uint64_t sub_100018CDC(uint64_t a1, uint64_t a2)
{
  id v3;

  v3 = objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", a2);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

  return 1;
}

uint64_t sub_100018D28(uint64_t a1, const char *a2, void *a3)
{
  id v5;
  xpc_object_t dictionary;
  uint64_t v7;
  id v8;

  v5 = a3;
  dictionary = xpc_dictionary_get_dictionary(*(xpc_object_t *)(a1 + 32), a2);
  v7 = objc_claimAutoreleasedReturnValue(dictionary);
  if (v7)
  {
    v8 = (id)v7;
    _os_log_preferences_merge(v7, v5, 0);
  }
  else
  {
    v8 = v5;
  }
  xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), a2, v8);

  return 1;
}

void sub_100018DA4()
{
  dispatch_queue_attr_t v0;
  NSObject *v1;
  dispatch_queue_attr_t v2;
  dispatch_queue_t v3;
  void *v4;
  NSObject *attr;

  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v1 = objc_claimAutoreleasedReturnValue(v0);
  v2 = dispatch_queue_attr_make_with_qos_class(v1, QOS_CLASS_UTILITY, 0);
  attr = objc_claimAutoreleasedReturnValue(v2);

  v3 = dispatch_queue_create_with_target_V2("com.apple.logd.store", attr, 0);
  v4 = (void *)qword_10003A938;
  qword_10003A938 = (uint64_t)v3;

}

void sub_100018E18()
{
  dispatch_time_t v0;
  char v1[1032];

  sub_100018DA4();
  if (qword_10003A9B0 != -1)
    dispatch_once(&qword_10003A9B0, &stru_10002A6F0);
  dword_10002DBF8 = open((const char *)qword_10003A998, 0x100000);
  if ((dword_10002DBF8 & 0x80000000) == 0)
  {
    sub_1000144DC();
    sub_100018F40();
  }
  if (&_CacheDeleteRegisterInfoCallbacks)
  {
    dispatch_async_f((dispatch_queue_t)qword_10003A938, 0, (dispatch_function_t)sub_100019214);
  }
  else
  {
    memset(&v1[51], 170, 0x3CDuLL);
    strcpy(v1, "CacheDelete not available - functioning without it");
    sub_100013FF0((uint64_t)v1);
  }
  v0 = dispatch_time(0, 600000000000);
  dispatch_after(v0, (dispatch_queue_t)qword_10003A938, &stru_100029D90);
}

uint64_t sub_100018F40()
{
  int v0;
  int v1;
  DIR *v2;
  int v3;
  dirent *v4;
  int d_type;
  uint64_t v6;
  const char *d_name;
  const char *v8;
  char *v9;
  int v10;
  int *v11;
  uint64_t result;
  int *v13;
  int *v14;
  int v15;
  char __b[1024];

  memset(__b, 170, sizeof(__b));
  v0 = dup(dword_10002DBF8);
  if (v0 == -1)
  {
    v13 = __error();
    _os_assumes_log(*v13);
    v2 = 0;
  }
  else
  {
    v1 = v0;
    if (lseek(v0, 0, 0) == -1)
    {
      v14 = __error();
      _os_assumes_log(*v14);
    }
    v2 = fdopendir(v1);
    if (!v2)
    {
      v3 = *__error();
      if (close(v1) == -1)
      {
        v15 = *__error();
        result = *__error();
        if (v15 == 9)
        {
          qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
          qword_10002DF78 = result;
          __break(1u);
          return result;
        }
        _os_assumes_log(result);
      }
      v2 = 0;
      *__error() = v3;
    }
  }
  v4 = readdir(v2);
  if (v4)
  {
    while (1)
    {
      d_type = v4->d_type;
      if (d_type == 8)
        break;
      if (d_type == 4)
      {
        v6 = 0;
        d_name = v4->d_name;
        while (strcmp((&off_10002A008)[v6], d_name))
        {
          if (++v6 == 5)
            goto LABEL_23;
        }
        if (qword_10003A9B0 != -1)
          dispatch_once(&qword_10003A9B0, &stru_10002A6F0);
        snprintf(__b, 0x400uLL, "%s/%s", (const char *)qword_10003A998, d_name);
        v10 = removefile(__b, 0, 1u);
LABEL_21:
        if (v10 == -1)
        {
          v11 = __error();
          _os_assumes_log(*v11);
        }
      }
LABEL_23:
      v4 = readdir(v2);
      if (!v4)
        goto LABEL_26;
    }
    v8 = v4->d_name;
    v9 = strrchr(v4->d_name, 46);
    if (!v9 || strcmp(v9, ".tracev3"))
      goto LABEL_23;
    if (!strncmp(v8, "logdata.Persistent.", 0x13uLL))
    {
      snprintf(__b, 0x400uLL, "Persist/%s", v8);
      v10 = renameat(dword_10002DBF8, v8, dword_10002DBF8, __b);
    }
    else
    {
      v10 = unlinkat(dword_10002DBF8, v8, 0);
    }
    goto LABEL_21;
  }
LABEL_26:
  closedir(v2);
  removefile("/private/var/mobile/Library/Logs/com.apple.sharingd", 0, 1u);
  return removefile("/private/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/WatchConnectivity", 0, 1u);
}

void sub_100019214()
{
  char v0[1032];

  if ((CacheDeleteRegisterInfoCallbacks(CFSTR("com.apple.logd.cachedelete"), &stru_10002A050, &stru_10002A098, &stru_10002A0E0, &stru_10002A100) & 0x80000000) != 0)
  {
    memset(&v0[37], 170, 0x3DBuLL);
    strcpy(v0, "Unable to register with cache delete");
    sub_100013FF0((uint64_t)v0);
  }
}

void sub_1000192C4(id a1)
{
  _os_trace_set_diagnostic_flags(MEMORY[0xFFFFFC104] & 0xFBFFFFFF);
  exit(0);
}

__CFDictionary *__cdecl sub_1000192E8(id a1, int a2, __CFDictionary *a3)
{
  return 0;
}

__CFDictionary *__cdecl sub_1000192F4(id a1, int a2, __CFDictionary *a3)
{
  void *v4;
  __CFDictionary *v5;
  _QWORD v7[2];
  uint64_t (*v8)(uint64_t, uint64_t);
  void *v9;
  uint64_t *v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  const __CFString *v17;
  void *v18;
  _BYTE __b[1024];

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  if (qword_10003A9B0 != -1)
    dispatch_once(&qword_10003A9B0, &stru_10002A6F0);
  if (sub_100019498((const char *)qword_10003A998, a3))
  {
    memset(__b, 170, sizeof(__b));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v8 = sub_100019590;
    v9 = &unk_10002A0C0;
    v11 = __b;
    v12 = 1024;
    v10 = &v13;
    sub_100019590((uint64_t)v7, (uint64_t)&off_10002DDB0);
    sub_100019590((uint64_t)v7, (uint64_t)&off_10002DD20);
    v8((uint64_t)v7, (uint64_t)&off_10002DC00);
    v8((uint64_t)v7, (uint64_t)&off_10002DC90);
  }
  v17 = CFSTR("CACHE_DELETE_AMOUNT");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v14[3]));
  v18 = v4;
  v5 = (__CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));

  _Block_object_dispose(&v13, 8);
  return v5;
}

BOOL sub_100019498(const char *a1, void *a2)
{
  void *v4;
  id v5;
  timespec v6;
  _BOOL8 v7;
  stat v9;
  stat v10;

  v4 = objc_autoreleasePoolPush();
  v5 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_VOLUME"));
  v6.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v6.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v10.st_blksize = v6;
  *(timespec *)v10.st_qspare = v6;
  v10.st_birthtimespec = v6;
  *(timespec *)&v10.st_size = v6;
  v10.st_mtimespec = v6;
  v10.st_ctimespec = v6;
  *(timespec *)&v10.st_uid = v6;
  v10.st_atimespec = v6;
  *(timespec *)v9.st_qspare = v6;
  *(timespec *)&v10.st_dev = v6;
  *(timespec *)&v9.st_size = v6;
  *(timespec *)&v9.st_blksize = v6;
  v9.st_ctimespec = v6;
  v9.st_birthtimespec = v6;
  v9.st_atimespec = v6;
  v9.st_mtimespec = v6;
  *(timespec *)&v9.st_dev = v6;
  *(timespec *)&v9.st_uid = v6;
  v7 = v5
    && (stat(a1, &v10) & 0x80000000) == 0
    && (stat((const char *)objc_msgSend(objc_retainAutorelease(v5), "fileSystemRepresentation"), &v9) & 0x80000000) == 0
    && v10.st_dev == v9.st_dev;

  objc_autoreleasePoolPop(v4);
  return v7;
}

uint64_t sub_100019590(uint64_t a1, uint64_t a2)
{
  char *v4;
  size_t v5;
  uint64_t result;
  int v7;
  timespec v8;
  uint64_t v9;
  off_t st_size;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  off_t v14;
  int v15;
  stat v16;

  v4 = *(char **)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  if (qword_10003A9B0 != -1)
    dispatch_once(&qword_10003A9B0, &stru_10002A6F0);
  snprintf(v4, v5, "%s/%s", (const char *)qword_10003A998, *(const char **)(a2 + 8));
  result = open(*(const char **)(a1 + 40), 0x100000);
  if ((result & 0x80000000) != 0)
  {
    st_size = 0;
  }
  else
  {
    v7 = result;
    v8.tv_sec = 0xAAAAAAAAAAAAAAAALL;
    v8.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
    *(timespec *)&v16.st_blksize = v8;
    *(timespec *)v16.st_qspare = v8;
    v16.st_birthtimespec = v8;
    *(timespec *)&v16.st_size = v8;
    v16.st_mtimespec = v8;
    v16.st_ctimespec = v8;
    *(timespec *)&v16.st_uid = v8;
    v16.st_atimespec = v8;
    *(timespec *)&v16.st_dev = v8;
    v9 = _os_trace_fdscandir_b();
    if ((int)v9 < 1)
    {
      v16.st_size = 0;
    }
    else
    {
      if (fstatat(v7, (const char *)(MEMORY[0] + 21), &v16, 32) == -1)
        v16.st_size = 1;
      unlinkat(v7, (const char *)(MEMORY[0] + 21), 0);
    }
    if (close(v7) == -1)
    {
      v15 = *__error();
      result = *__error();
      if (v15 == 9)
      {
        qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
        qword_10002DF78 = result;
        __break(1u);
        return result;
      }
      _os_assumes_log(result);
    }
    result = _os_trace_scandir_free_namelist(v9, 0);
    st_size = v16.st_size;
  }
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v12 = *(_QWORD *)(v11 + 24);
  v13 = __OFADD__(v12, st_size);
  v14 = v12 + st_size;
  if (v13)
    __break(0x5500u);
  *(_QWORD *)(v11 + 24) = v14;
  return result;
}

int sub_100019768(id a1, const dirent **a2, const dirent **a3)
{
  int v5;
  int v6;

  v5 = strncmp((*a2)->d_name, "logdata.Persistent.", 0x13uLL);
  v6 = strncmp((*a3)->d_name, "logdata.Persistent.", 0x13uLL);
  if ((v5 == 0) != (v6 == 0))
    return (v5 != 0) - (v6 != 0);
  else
    return alphasort(a2, a3);
}

int sub_100019810(id a1, const dirent *a2)
{
  char *v2;

  if (a2->d_type == 8)
  {
    v2 = strrchr(a2->d_name, 46);
    if (v2)
      LODWORD(v2) = strcmp(v2, ".tracev3") == 0;
  }
  else
  {
    LODWORD(v2) = 0;
  }
  return (int)v2;
}

__CFDictionary *__cdecl sub_100019858(id a1, int a2, __CFDictionary *a3)
{
  _QWORD *v4;
  FTS *v5;
  FTS *v6;
  FTSENT *v7;
  FTSENT *v8;
  void *v9;
  __CFDictionary *v10;
  _QWORD v12[2];
  const char *(*v13)(uint64_t, uint64_t);
  void *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  const __CFString *v20;
  void *v21;
  char *v22[2];

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  if (qword_10003A9B0 != -1)
    dispatch_once(&qword_10003A9B0, &stru_10002A6F0);
  if (sub_100019498((const char *)qword_10003A998, a3))
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v13 = sub_100019A30;
    v14 = &unk_10002A078;
    v15 = &v16;
    v4 = v12;
    if (qword_10003A9B0 != -1)
      dispatch_once(&qword_10003A9B0, &stru_10002A6F0);
    v22[0] = (char *)qword_10003A998;
    v22[1] = 0;
    v5 = fts_open(v22, 2132, 0);
    if (v5)
    {
      v6 = v5;
      v7 = fts_read(v5);
      if (v7)
      {
        v8 = v7;
        do
        {
          if (v8->fts_info == 8)
            ((void (*)(_QWORD *))v13)(v4);
          v8 = fts_read(v6);
        }
        while (v8);
      }
      fts_close(v6);
    }
    else
    {
      _os_assumes_log(0);
    }

  }
  v20 = CFSTR("CACHE_DELETE_AMOUNT");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v17[3]));
  v21 = v9;
  v10 = (__CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));

  _Block_object_dispose(&v16, 8);
  return v10;
}

const char *sub_100019A30(uint64_t a1, uint64_t a2)
{
  const char *result;
  timespec v5;
  uint64_t v6;
  uint64_t v7;
  stat v8;

  result = strrchr((char *)(a2 + 104), 46);
  if (result)
  {
    result = (const char *)strcmp(result, ".tracev3");
    if (!(_DWORD)result)
    {
      v5.tv_sec = 0xAAAAAAAAAAAAAAAALL;
      v5.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
      *(timespec *)&v8.st_blksize = v5;
      *(timespec *)v8.st_qspare = v5;
      v8.st_birthtimespec = v5;
      *(timespec *)&v8.st_size = v5;
      v8.st_mtimespec = v5;
      v8.st_ctimespec = v5;
      *(timespec *)&v8.st_uid = v5;
      v8.st_atimespec = v5;
      *(timespec *)&v8.st_dev = v5;
      result = (const char *)stat(*(const char **)(a2 + 48), &v8);
      if ((result & 0x80000000) == 0)
      {
        v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        v7 = *(_QWORD *)(v6 + 24);
        if (__OFADD__(v7, v8.st_size))
          __break(0x5500u);
        else
          *(_QWORD *)(v6 + 24) = v7 + v8.st_size;
      }
    }
  }
  return result;
}

void sub_100019AEC(id a1)
{
  byte_10002DE08 = 1;
  byte_10002DD78 = 1;
  byte_10002DC58 = 1;
  byte_10002DCE8 = 1;
}

void sub_100019B14(id a1)
{
  char v1[1032];

  dispatch_assert_queue_V2((dispatch_queue_t)qword_10003A938);
  if (dword_10002DBF8 == -1)
    sub_100019BD0();
  byte_10002DE08 = 0;
  byte_10002DD78 = 0;
  byte_10002DC58 = 0;
  byte_10002DCE8 = 0;
  memset(&v1[17], 170, 0x3EFuLL);
  strcpy(v1, "writes unblocked");
  sub_100013FF0((uint64_t)v1);
}

void sub_100019BD0()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  int *v19;
  uint64_t is_development_build;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  const char *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  int *v29;
  int *v30;
  const char *v31;
  uint64_t v32;
  _OWORD __b[64];

  dispatch_assert_queue_V2((dispatch_queue_t)qword_10003A938);
  if (dword_10002DBF8 != -1)
    __assert_rtn("_logd_store_initialize_io", "logd_store.m", 3231, "_logd_store_dirfd == -1");
  sub_10001A1D4(0);
  if (qword_10003A9B0 != -1)
    dispatch_once(&qword_10003A9B0, &stru_10002A6F0);
  dword_10002DBF8 = open((const char *)qword_10003A998, 0x100000);
  if (dword_10002DBF8 < 0)
    goto LABEL_51;
  sub_1000144DC();
  v0 = sub_10001A370();
  v1 = (void *)objc_claimAutoreleasedReturnValue(v0);
  v2 = objc_autoreleasePoolPush();
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("Version")));
  v4 = (unint64_t)objc_msgSend(v3, "integerValue");

  if ((uint64_t)v4 >= 8)
  {
    memset(__b, 170, sizeof(__b));
    snprintf((char *)__b, 0x400uLL, "Store version (%ld) is more recent than what this system supports (<= %d), logs will be corrupted", v4, 7);
    sub_100013FF0((uint64_t)__b);
    goto LABEL_21;
  }
  if (v4 != 7)
  {
    if (v4 <= 6)
      v5 = 6;
    else
      v5 = v4;
    if (v4 <= 7)
      v6 = 7 - v4;
    else
      v6 = 0;
    v7 = 8 * v4;
    v8 = v4;
    while (v4 < 7)
    {
      if (v7 > ~(unint64_t)off_10002DED0)
        goto LABEL_49;
      if (!v6)
        goto LABEL_50;
      ((void (*)(void *))off_10002DED0[v7 / 8])(v1);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", v8 + 1));
      objc_msgSend(v1, "setObject:forKeyedSubscript:", v9, CFSTR("Version"));

      --v6;
      v7 += 8;
      if (v8++ == v5)
      {
        sub_1000120D0(v1);
        goto LABEL_21;
      }
    }
    __break(0x5512u);
LABEL_49:
    __break(0x5513u);
LABEL_50:
    __break(1u);
LABEL_51:
    v32 = *__error();
    qword_10002DF48 = (uint64_t)"BUG IN LIBTRACE: failed to open log store directory";
    qword_10002DF78 = v32;
    __break(1u);
  }
LABEL_21:
  objc_autoreleasePoolPop(v2);
  v11 = v1;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Salt")));
  if ((objc_msgSend(v12, "isNSNumber") & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Salt")));
    v14 = objc_msgSend(v13, "unsignedLongLongValue");

    if (v14)
      goto LABEL_28;
  }
  else
  {

  }
  *(_QWORD *)&__b[0] = 0;
  do
    arc4random_buf(__b, 8uLL);
  while (!*(_QWORD *)&__b[0]);
  v15 = objc_alloc((Class)NSNumber);
  v16 = objc_msgSend(v15, "initWithUnsignedLongLong:", *(_QWORD *)&__b[0]);
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, CFSTR("Salt"));

  sub_1000120D0(v11);
LABEL_28:
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Salt")));
  v18 = objc_msgSend(v17, "unsignedLongLongValue");

  if (!v18)
  {
    v31 = (const char *)_os_assert_log(0);
    _os_crash(v31);
    __break(1u);
LABEL_47:
    dispatch_once(&qword_10003A9B8, &stru_10002A858);
    goto LABEL_32;
  }
  qword_10003A940 = (uint64_t)v18;

  sub_100017390(dword_10002DBF8, off_10002DDB8);
  sub_100017390(dword_10002DBF8, off_10002DD28);
  sub_100017390(dword_10002DBF8, off_10002DC08);
  v19 = sub_100017390(dword_10002DBF8, off_10002DC98);
  is_development_build = _os_trace_is_development_build(v19);
  xmmword_10003A970 = xmmword_100024390;
  qword_10003A980 = 3;
  qword_10003A988 = 0x3FE0000000000000;
  word_10003A990 = 0;
  byte_10003A992 = 0;
  v21 = (const char *)_os_trace_sysprefsdir_path(is_development_build);
  sub_100016950(v21);
  v23 = _os_trace_is_development_build(v22);
  if ((_DWORD)v23)
  {
    v24 = (const char *)_os_trace_intprefsdir_path();
    sub_100016950(v24);
  }
  v25 = (const char *)_os_trace_prefsdir_path(v23);
  sub_100016950(v25);
  sub_10001757C((uint64_t)&off_10002DDB0);
  sub_10001757C((uint64_t)&off_10002DD20);
  sub_10001757C((uint64_t)&off_10002DC00);
  sub_10001757C((uint64_t)&off_10002DC90);
  v11 = v11;
  if (qword_10003A9B8 != -1)
    goto LABEL_47;
LABEL_32:
  if (byte_10003A9C0)
  {
    sub_10001A588(v11, 0);

    notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &dword_10002DF08, (dispatch_queue_t)qword_10003A938, &stru_10002A1A0);
    if (!sub_100010658())
      goto LABEL_37;
    *(_QWORD *)&__b[0] = _NSConcreteStackBlock;
    *((_QWORD *)&__b[0] + 1) = 3221225472;
    *(_QWORD *)&__b[1] = sub_10001A6C0;
    *((_QWORD *)&__b[1] + 1) = &unk_10002A1C8;
    *(_QWORD *)&__b[2] = &stru_10002A1A0;
    dispatch_async((dispatch_queue_t)qword_10003A938, __b);
    v26 = *(void **)&__b[2];
  }
  else
  {
    sub_10001A588(v11, 1);
    v26 = v11;
  }

LABEL_37:
  if (&_CacheDeleteRegisterInfoCallbacks)
  {
    dispatch_async_f((dispatch_queue_t)qword_10003A938, 0, (dispatch_function_t)sub_10001A6D0);
  }
  else
  {
    memset((char *)&__b[3] + 3, 170, 0x3CDuLL);
    strcpy((char *)__b, "CacheDelete not available - functioning without it");
    sub_100013FF0((uint64_t)__b);
  }
  v27 = openat(dword_10002DBF8, "logdata.statistics.0.txt", 778, 420);
  dword_10002C348 = v27;
  if ((_DWORD)v27 == -1)
  {
    v29 = __error();
    _os_assumes_log(*v29);
    v27 = dword_10002C348;
  }
  dword_10002C348 = sub_100003EA0(v27, "logdata.statistics.0.txt", "logdata.statistics.1.txt", 0x100000);
  v28 = openat(dword_10002DBF8, "logdata.statistics.0.jsonl", 778, 420);
  dword_10002C34C = v28;
  if ((_DWORD)v28 == -1)
  {
    v30 = __error();
    _os_assumes_log(*v30);
    v28 = dword_10002C34C;
  }
  dword_10002C34C = sub_100003EA0(v28, "logdata.statistics.0.jsonl", "logdata.statistics.1.jsonl", 5242880);

}

void sub_10001A1D4(unsigned int a1)
{
  signed int v2;
  const char *v3;
  int v4;
  int v5;
  int *v6;
  int v7;
  int *v8;
  uint64_t v9;
  int v10;
  __int128 v11;
  uint64_t v12;

  v2 = sub_100006240(a1);
  if (v2)
  {
    qword_10002DF48 = (uint64_t)"BUG IN LIBTRACE: Failed to migrate directory";
    qword_10002DF78 = v2;
    __break(1u);
  }
  if (qword_10003A9B8 != -1)
    dispatch_once(&qword_10003A9B8, &stru_10002A858);
  if (byte_10003A9C0)
  {
    v12 = 0;
    v11 = xmmword_100024268;
    v10 = 4;
    v3 = (const char *)sub_1000063F8(a1);
    v4 = open(v3, 0x100000);
    if (v4 == -1)
    {
      v8 = __error();
      v9 = *v8;
      qword_10002DF48 = (uint64_t)"BUG IN LIBTRACE: Failed to open directory";
      qword_10002DF78 = v9;
      __break(1u);
    }
    else
    {
      v5 = v4;
      if (fsetattrlist(v4, &v11, &v10, 4uLL, 0) == -1)
      {
        v6 = __error();
        _os_assumes_log(*v6);
      }
      if (close(v5) != -1)
        return;
      v7 = *__error();
      v8 = (int *)*__error();
      if (v7 != 9)
      {
        _os_assumes_log(v8);
        return;
      }
    }
    qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_10002DF78 = (uint64_t)v8;
    __break(1u);
  }
}

id sub_10001A370()
{
  uint64_t v0;
  id v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  NSErrorDomain v6;
  NSErrorDomain v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v14;

  v0 = openat(dword_10002DBF8, "version.plist", 256);
  if ((_DWORD)v0 == -1)
  {
    if (*__error() != 2)
      _os_assumes_log(0);
    goto LABEL_9;
  }
  v1 = objc_msgSend(objc_alloc((Class)NSFileHandle), "initWithFileDescriptor:", v0);
  v14 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "readDataToEndOfFileAndReturnError:", &v14));
  v3 = v14;
  v4 = v3;
  if (v2)
  {
    objc_msgSend(v1, "closeFile");

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v2, 1, 0, 0));
    goto LABEL_10;
  }
  v6 = (NSErrorDomain)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
  v7 = v6;
  if (v6 != NSCocoaErrorDomain)
  {

    goto LABEL_20;
  }
  v8 = objc_msgSend(v4, "code");

  if (v8 != (id)260)
LABEL_20:
    _os_assumes_log(0);
  objc_msgSend(v1, "closeFile");

LABEL_9:
  v2 = 0;
  v5 = 0;
LABEL_10:

  if ((objc_msgSend(v5, "isNSDictionary") & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Version")));
    v10 = v9;
    if (v9 && (objc_msgSend(v9, "isNSNumber") & 1) == 0)
      objc_msgSend(v5, "removeObjectForKey:", CFSTR("Version"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Pending")));

    if (v11 && (objc_msgSend(v11, "isNSArray") & 1) == 0)
      objc_msgSend(v5, "removeObjectForKey:", CFSTR("Pending"));
  }
  else
  {
    v12 = objc_alloc_init((Class)NSMutableDictionary);

    v11 = 0;
    v5 = v12;
  }

  return v5;
}

void sub_10001A588(void *a1, int a2)
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  _BYTE v9[128];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("Pending")));
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v7), "isEqualToString:", CFSTR("timesync-build")))v8 = a2 == 0;
        else
          v8 = 1;
        if (!v8)
          dispatch_async_f((dispatch_queue_t)qword_10003A938, CFSTR("timesync-build"), (dispatch_function_t)sub_10001DBDC);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
    }
    while (v5);
  }

}

uint64_t sub_10001A6C0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10001A6D0()
{
  char v0[1032];

  if ((CacheDeleteRegisterInfoCallbacks(CFSTR("com.apple.logd.cachedelete"), &stru_10002A208, &stru_10002A250, &stru_10002A270, &stru_10002A290) & 0x80000000) != 0)
  {
    memset(&v0[37], 170, 0x3DBuLL);
    strcpy(v0, "Unable to register with cache delete");
    sub_100013FF0((uint64_t)v0);
  }
}

__CFDictionary *__cdecl sub_10001A780(id a1, int a2, __CFDictionary *a3)
{
  char *v4;
  __int128 v5;
  const char *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  int *v10;
  int v11;
  int v12;
  _DWORD *v13;
  uint64_t v14;
  uint64_t v15;
  __darwin_time_t v16;
  DIR *v17;
  dirent *v18;
  uint64_t v19;
  char v20;
  const char *d_name;
  char *v22;
  int *v23;
  _removefile_state *v24;
  BOOL v25;
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
  uint64_t v38;
  int v39;
  int v40;
  DIR *v41;
  DIR *v42;
  dirent *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  const char *v52;
  char *v53;
  unint64_t v54;
  uint64_t v55;
  char *v56;
  unint64_t v57;
  _QWORD *v58;
  unint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  int v64;
  int v65;
  int v66;
  __CFDictionary *result;
  uint64_t v68;
  unint64_t v69;
  int *v70;
  int *v71;
  int *v72;
  int v73;
  int v74;
  time_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  int *v82;
  int *v83;
  int v84;
  int v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void ***v91;
  void *v92;
  __CFDictionary *v93;
  int *v94;
  int v95;
  int *v96;
  int v97;
  uint64_t v98;
  uint64_t v99;
  _QWORD *v100;
  unsigned int v101;
  __CFDictionary *v102;
  char v103;
  _QWORD block[6];
  tm v105;
  _QWORD v106[10];
  unsigned int v107;
  int v108;
  uint64_t v109;
  uint64_t *v110;
  uint64_t v111;
  uint64_t v112;
  _QWORD v113[2];
  uint64_t (*v114)(uint64_t, uint64_t);
  void *v115;
  char *v116;
  __int128 *v117;
  __int128 **p_value;
  __int128 *value;
  _QWORD v120[12];
  char *v121;
  unsigned int v122;
  int v123;
  void *v124;
  int v125;
  unint64_t v126;
  const __CFString *v127;
  void *v128;
  __int128 v129;
  __int128 v130;
  void ***v131;
  size_t __b[129];

  memset(__b, 170, 0x400uLL);
  snprintf((char *)__b, 0x400uLL, "Received a Periodic Request from CacheDelete on volume %s", (const char *)objc_msgSend(objc_retainAutorelease(-[__CFDictionary objectForKeyedSubscript:](a3, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_VOLUME"))), "UTF8String"));
  sub_100013FF0((uint64_t)__b);
  if (qword_10003A9B0 != -1)
    dispatch_once(&qword_10003A9B0, &stru_10002A6F0);
  v4 = &byte_10002DFA4[49244];
  if (!sub_100019498((const char *)qword_10003A998, a3))
  {
    v9 = 0;
LABEL_105:
    if (qword_10003A9B0 != -1)
      dispatch_once(&qword_10003A9B0, &stru_10002A6F0);
    if (sub_100019498((const char *)qword_10003A9A8, a3))
    {
      memset((char *)&__b[2] + 3, 170, 0x3EDuLL);
      strcpy((char *)__b, "Purging UUID Cache");
      sub_100013FF0((uint64_t)__b);
      sub_100017764();
    }
    memset(__b, 170, 0x400uLL);
    snprintf((char *)__b, 0x400uLL, "Periodic complete. Removed %lld bytes.", v9);
    sub_100013FF0((uint64_t)__b);
    v127 = CFSTR("CACHE_DELETE_AMOUNT");
    v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v9));
    v128 = v92;
    v93 = (__CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v128, &v127, 1));

    return v93;
  }
  v131 = (void ***)0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v129 = v5;
  v130 = v5;
  if (qword_10003A9B0 != -1)
    dispatch_once(&qword_10003A9B0, &stru_10002A6F0);
  v6 = (const char *)qword_10003A9A0;
  v7 = _os_trace_zalloc(136);
  v8 = openat(-2, v6, 0);
  *(_DWORD *)v7 = v8;
  if (v8 == -1)
  {
    v10 = __error();
    _os_assumes_log(*v10);
  }
  else if ((int)sub_100020E3C(v8, (_QWORD *)(v7 + 8), (_QWORD *)(v7 + 16), 0) >= 1
         && (sub_100021964(v7) & 0x80000000) == 0)
  {
    clock_gettime_nsec_np(_CLOCK_REALTIME);
    sub_100021DCC();
  }
  v11 = *__error();
  if ((*(_DWORD *)v7 & 0x80000000) == 0 && close(*(_DWORD *)v7) == -1)
  {
    v97 = *__error();
    result = (__CFDictionary *)*__error();
    if (v97 == 9)
    {
LABEL_118:
      qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
      qword_10002DF78 = (uint64_t)result;
      __break(1u);
      qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
      qword_10002DF78 = (uint64_t)result;
      __break(1u);
      goto LABEL_119;
    }
    _os_assumes_log(result);
  }
  free((void *)v7);
  *__error() = v11;
  v12 = *__error();
  memset(__b, 170, 0x400uLL);
  snprintf((char *)__b, 0x400uLL, "Unable to open timesync database at %s: error %d", v6, v12);
  sub_100013FF0((uint64_t)__b);
  v13 = &unk_10002D000;
  v14 = openat(dword_10002DBF8, "TTL", 1048832);
  if ((v14 & 0x80000000) == 0)
  {
    if ((unint64_t)&v129 >= 0xFFFFFFFFFFFFFFE8)
      goto LABEL_115;
    v15 = v14;
    v16 = *((_QWORD *)&v130 + 1);
    v17 = fdopendir(v14);
    v18 = readdir(v17);
    if (v18)
    {
      v102 = a3;
      v19 = 0;
      v20 = 0;
      do
      {
        if (v18->d_type == 8)
        {
          d_name = v18->d_name;
          v22 = strrchr(v18->d_name, 46);
          if (v22)
          {
            if (!strcmp(v22, ".tracev3"))
            {
              __b[0] = 0xAAAAAAAAAAAAAAAALL;
              if (sub_10001B6D4(v15, d_name, v16, __b))
              {
                if (unlinkat(v15, d_name, 0) == -1)
                {
                  v23 = __error();
                  _os_assumes_log(*v23);
                }
                v19 += __b[0];
              }
              else
              {
                v20 = 1;
              }
            }
          }
        }
        v18 = readdir(v17);
      }
      while (v18);
      a3 = v102;
      v4 = byte_10002DFA4 + 49244;
      v13 = (_DWORD *)&unk_10002D000;
      if ((v20 & 1) != 0)
      {
LABEL_34:
        closedir(v17);
        goto LABEL_35;
      }
    }
    else
    {
      v19 = 0;
    }
    memset(__b, 170, 0x400uLL);
    if (qword_10003A9B0 != -1)
      dispatch_once(&qword_10003A9B0, &stru_10002A6F0);
    snprintf((char *)__b, 0x400uLL, "%s/TTL", *((const char **)v4 + 307));
    value = 0;
    v24 = removefile_state_alloc();
    removefile_state_set(v24, 1u, sub_10001B948);
    removefile_state_set(v24, 2u, &value);
    removefile((const char *)__b, v24, 1u);
    removefile_state_free(v24);
    v25 = __OFADD__(v19, value);
    v19 += (uint64_t)value;
    if (v25)
      goto LABEL_116;
    goto LABEL_34;
  }
  v19 = 0;
LABEL_35:
  if ((__int128 *)((char *)&v130 + 1) != 0 && (unint64_t)&v129 >= 0xFFFFFFFFFFFFFFEFLL
    || (unint64_t)&v129 > 0xFFFFFFFFFFFFFFDFLL)
  {
    goto LABEL_115;
  }
  v26 = v129;
  v27 = v130;
  v28 = sub_10001B9DC((uint64_t)&off_10002DC00, (uint64_t)v131);
  v29 = v19 + v28;
  if (__OFADD__(v19, v28)
    || (v30 = sub_10001B9DC((uint64_t)&off_10002DD20, v27), v25 = __OFADD__(v29, v30), v31 = v29 + v30, v25)
    || (v32 = sub_10001B9DC((uint64_t)&off_10002DDB0, v26), v9 = v31 + v32, __OFADD__(v31, v32)))
  {
LABEL_116:
    __break(0x5500u);
  }
  v33 = openat(v13[766], off_10002DC98, 1048832);
  if ((_DWORD)v33 == -1)
    goto LABEL_112;
  v34 = v33;
  if ((v33 & 0x80000000) != 0)
    goto LABEL_102;
  *(_QWORD *)&v105.tm_wday = 0;
  *(_QWORD *)&v105.tm_isdst = &v105.tm_wday;
  v105.tm_gmtoff = 0x2020000000;
  v105.tm_zone = (char *)0xAAAAAAAAAAAAAAAALL;
  memset(__b, 170, 0x400uLL);
  *(_QWORD *)&v105.tm_mon = 0xAA00000000100000;
  *(_QWORD *)&v105.tm_sec = __b;
  *(_QWORD *)&v105.tm_hour = 0x40000000000;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001BB54;
  block[3] = &unk_10002A328;
  block[4] = &v105.tm_wday;
  block[5] = &off_10002DC90;
  dispatch_sync((dispatch_queue_t)qword_10003A938, block);
  sub_100016E90(&v105, (uint64_t)&off_10002DC90, (uint64_t)"Periodic Compaction", 0, v35, v36, v37, v38, v98);
  v39 = dup(v34);
  if (v39 == -1)
  {
    v82 = __error();
    _os_assumes_log(*v82);
LABEL_95:
    _os_assumes_log(0);
    v42 = 0;
    v50 = 0;
LABEL_96:
    if ((v105.tm_year & 1) != 0)
    {
      v86 = *(void **)&v105.tm_sec;
      *(_QWORD *)&v105.tm_sec = 3954044928;
      LOWORD(v105.tm_year) = 0;
      free(v86);
    }
    if (closedir(v42) == -1)
    {
      v94 = __error();
      _os_assumes_log(*v94);
    }
    _Block_object_dispose(&v105.tm_wday, 8);
    v25 = __OFADD__(v9, v50);
    v9 += v50;
    if (v25)
      goto LABEL_116;
    if (close(v34) != -1)
      goto LABEL_102;
    v95 = *__error();
    result = (__CFDictionary *)*__error();
    if (v95 != 9)
    {
      _os_assumes_log(result);
LABEL_112:
      v96 = __error();
      _os_assumes_log(*v96);
LABEL_102:
      v87 = (void *)v129;
      sub_1000105EC(*(void ***)v129);
      free(v87);
      if (&v98 == (uint64_t *)-520)
        goto LABEL_115;
      v88 = (void *)*((_QWORD *)&v129 + 1);
      sub_1000105EC(**((void ****)&v129 + 1));
      free(v88);
      v89 = (void *)v130;
      sub_1000105EC(*(void ***)v130);
      free(v89);
      if ((unint64_t)&v129 > 0xFFFFFFFFFFFFFFE7)
        goto LABEL_115;
      v90 = (void *)*((_QWORD *)&v130 + 1);
      sub_1000105EC(**((void ****)&v130 + 1));
      free(v90);
      v91 = v131;
      sub_1000105EC(*v131);
      free(v91);
      memset(__b, 170, 0x400uLL);
      snprintf((char *)__b, 0x400uLL, "Compacted %lld bytes", v9);
      sub_100013FF0((uint64_t)__b);
      goto LABEL_105;
    }
    qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_10002DF78 = (uint64_t)result;
    __break(1u);
    goto LABEL_118;
  }
  v40 = v39;
  if (lseek(v39, 0, 0) == -1)
  {
    v83 = __error();
    _os_assumes_log(*v83);
  }
  v41 = fdopendir(v40);
  if (v41)
  {
    v42 = v41;
    v103 = 0;
    v43 = readdir(v41);
    v50 = 0;
    if (v43)
    {
      v51 = v120;
      do
      {
        if (v43->d_type == 8)
        {
          v52 = v43->d_name;
          v53 = strrchr(v43->d_name, 46);
          if (v53)
          {
            if (!strcmp(v53, ".tracev3"))
            {
              v54 = sub_100017050(v52);
              if (v54)
              {
                if (v54 < *(_QWORD *)(*(_QWORD *)&v105.tm_isdst + 24))
                {
                  v126 = 0xAAAAAAAAAAAAAAAALL;
                  v55 = _os_trace_mmap_at(v34, v52, 256, &v126);
                  if (v55)
                  {
                    v56 = (char *)v55;
                    v99 = v50;
                    v100 = v51;
                    v101 = v34;
                    v102 = a3;
                    v51[16] = 0;
                    *((_OWORD *)v51 + 6) = 0u;
                    *((_OWORD *)v51 + 7) = 0u;
                    *((_OWORD *)v51 + 4) = 0u;
                    *((_OWORD *)v51 + 5) = 0u;
                    *((_OWORD *)v51 + 2) = 0u;
                    *((_OWORD *)v51 + 3) = 0u;
                    *(_OWORD *)v51 = 0u;
                    *((_OWORD *)v51 + 1) = 0u;
                    value = &v129;
                    v120[1] = -1;
                    v125 = 0x10000;
                    v124 = (void *)_os_trace_malloc(0x10000);
                    v57 = v126;
                    v113[0] = _NSConcreteStackBlock;
                    v113[1] = 3221225472;
                    v114 = sub_10001BC40;
                    v115 = &unk_10002A368;
                    v116 = v56;
                    v117 = &v129;
                    p_value = &value;
                    v58 = v113;
                    v59 = 0;
                    do
                    {
                      if (v57 - v59 < 0x10)
                        break;
                      v60 = *(_QWORD *)&v56[v59 + 8];
                      if (v57 - 16 - v59 < v60)
                        break;
                      if (!((unsigned int (*)(_QWORD *))v114)(v58))
                        break;
                      v59 = (v59 + v60 + 23) & 0xFFFFFFFFFFFFFFF8;
                    }
                    while (v59 - 1 < v57);

                    if (v120[3])
                      sub_10001BEBC((uint64_t)&value);
                    v109 = 0;
                    v110 = &v109;
                    v111 = 0x2020000000;
                    v112 = 0;
                    v34 = v101;
                    v51 = v100;
                    if (v122 > 1)
                    {
                      a3 = v102;
                      if (!(v126 >> 17))
                      {
LABEL_75:
                        v68 = 16;
                        v69 = 1;
                        while (!__CFADD__(v121, v68))
                        {
                          free(*(void **)&v121[v68]);
                          ++v69;
                          v68 += 16;
                          if (v69 >= v122)
                            goto LABEL_78;
                        }
LABEL_115:
                        __break(0x5513u);
                        goto LABEL_116;
                      }
                      if ((3 * v123) < 2 * v126)
                      {
                        v63 = sub_100001594(v101, "tmp", 1538);
                        if ((_DWORD)v63 == -1)
                        {
                          v71 = __error();
                          _os_assumes_log(*v71);
                          v34 = v101;
                        }
                        else
                        {
                          v64 = v63;
                          if (_os_trace_writev(v63, v121, v122) == -1)
                          {
                            v72 = __error();
                            _os_assumes_log(*v72);
                            v73 = close(v64);
                            v34 = v101;
                            if (v73 == -1)
                            {
                              v74 = *__error();
                              result = (__CFDictionary *)*__error();
                              if (v74 == 9)
                                goto LABEL_121;
                              _os_assumes_log(result);
                              a3 = v102;
                              v34 = v101;
                              v51 = v100;
                            }
                          }
                          else
                          {
                            v106[0] = _NSConcreteStackBlock;
                            v106[1] = 3221225472;
                            v106[2] = sub_10001BFAC;
                            v107 = v101;
                            v108 = v64;
                            v106[5] = v52;
                            v106[6] = &value;
                            v106[3] = &unk_10002A390;
                            v106[4] = &v109;
                            v106[7] = v126;
                            v106[8] = &v105;
                            v106[9] = &off_10002DC90;
                            dispatch_sync((dispatch_queue_t)qword_10003A938, v106);
                            v65 = v64;
                            v34 = v101;
                            if (close(v65) == -1)
                            {
                              v66 = *__error();
                              result = (__CFDictionary *)*__error();
                              if (v66 == 9)
                                goto LABEL_120;
                              _os_assumes_log(result);
                            }
                          }
                        }
                      }
                    }
                    else
                    {
                      v61 = sub_10001BB6C(v101, (uint64_t)v52, v126, (uint64_t)&v105, (uint64_t)&v103);
                      v110[3] = v61;
                      a3 = v102;
                    }
                    if (v122 > 1)
                      goto LABEL_75;
LABEL_78:
                    free(v121);
                    free(v124);
                    if (munmap(v56, v126) == -1)
                    {
                      v70 = __error();
                      _os_assumes_log(*v70);
                    }
                    v62 = v110[3];
                    _Block_object_dispose(&v109, 8);
                    v50 = v99;
                  }
                  else
                  {
                    v62 = sub_10001BB6C(v34, (uint64_t)v52, v126, (uint64_t)&v105, (uint64_t)&v103);
                  }
                  v25 = __OFADD__(v50, v62);
                  v50 += v62;
                  if (v25)
                    goto LABEL_116;
                }
              }
            }
          }
        }
        v43 = readdir(v42);
      }
      while (v43);
    }
    if (v50 || v103)
    {
      sub_100004728(&v105, "done  : ", v44, v45, v46, v47, v48, v49, v98);
      v75 = time(0);
      sub_100004068(&v105, v75);
      sub_100004728(&v105, "\n\n", v76, v77, v78, v79, v80, v81, v98);
      sub_1000106D0();
    }
    goto LABEL_96;
  }
  v84 = *__error();
  if (close(v40) != -1)
  {
LABEL_94:
    *__error() = v84;
    goto LABEL_95;
  }
  v85 = *__error();
  result = (__CFDictionary *)*__error();
  if (v85 != 9)
  {
    _os_assumes_log(result);
    goto LABEL_94;
  }
LABEL_119:
  qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_10002DF78 = (uint64_t)result;
  __break(1u);
LABEL_120:
  qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_10002DF78 = (uint64_t)result;
  __break(1u);
LABEL_121:
  qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_10002DF78 = (uint64_t)result;
  __break(1u);
  return result;
}

void sub_10001B5F4(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v2 = objc_autoreleasePoolPush();
  v3 = sub_10001A370();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_10001CFD0(v4, CFSTR("ttl01"), **(uint64_t ***)(a1 + 32));
  v5 = *(_QWORD *)(a1 + 32);
  if (v5 >= 0xFFFFFFFFFFFFFFF8
    || (sub_10001CFD0(v4, CFSTR("ttl03"), *(uint64_t **)(v5 + 8)), v6 = *(_QWORD *)(a1 + 32), v6 > 0xFFFFFFFFFFFFFFEFLL)
    || (sub_10001CFD0(v4, CFSTR("ttl07"), *(uint64_t **)(v6 + 16)), v7 = *(_QWORD *)(a1 + 32), v7 > 0xFFFFFFFFFFFFFFE7)
    || (sub_10001CFD0(v4, CFSTR("ttl14"), *(uint64_t **)(v7 + 24)), v8 = *(_QWORD *)(a1 + 32), v8 > 0xFFFFFFFFFFFFFFDFLL))
  {
    __break(0x5513u);
  }
  else
  {
    sub_10001CFD0(v4, CFSTR("ttl30"), *(uint64_t **)(v8 + 32));
    sub_1000120D0(v4);

    objc_autoreleasePoolPop(v2);
  }
}

uint64_t sub_10001B6D4(uint64_t a1, const char *a2, __darwin_time_t a3, size_t *a4)
{
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL8 v11;
  char *v12;
  unint64_t v13;
  stat *v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  timespec v18;
  off_t st_size;
  int *v21;
  int *v22;
  int *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  stat v28;
  _OWORD v29[2];
  unint64_t v30;

  v30 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v29[0] = v8;
  v29[1] = v8;
  v9 = _os_trace_getxattr_at(a1, a2, 256, "com.apple.logd.metadata", v29, 40);
  if (v9 == 40)
  {
    v17 = sub_10000B8D4(*(_QWORD **)a3, (_OWORD *)((char *)v29 + 4));
    if (v17 && (v17 != 1 || v30 >= *(_QWORD *)(a3 + 8)))
      return 0;
    goto LABEL_19;
  }
  if (v9 != -1)
  {
    _os_assumes_log(0);
LABEL_19:
    v18.tv_sec = 0xAAAAAAAAAAAAAAAALL;
    v18.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
    *(timespec *)&v28.st_blksize = v18;
    *(timespec *)v28.st_qspare = v18;
    v28.st_birthtimespec = v18;
    *(timespec *)&v28.st_size = v18;
    v28.st_mtimespec = v18;
    v28.st_ctimespec = v18;
    *(timespec *)&v28.st_uid = v18;
    v28.st_atimespec = v18;
    *(timespec *)&v28.st_dev = v18;
    if (fstatat(a1, a2, &v28, 32) == -1)
    {
      v23 = __error();
      _os_assumes_log(*v23);
      st_size = 0;
    }
    else
    {
      st_size = v28.st_size;
    }
    *a4 = st_size;
    return 1;
  }
  if (*__error() != 93)
  {
    v21 = __error();
    _os_assumes_log(*v21);
  }
  v10 = _os_trace_mmap_at(a1, a2, 256, a4);
  v11 = 1;
  if (v10)
  {
    v12 = (char *)v10;
    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    v27 = 1;
    v13 = *a4;
    *(_QWORD *)&v28.st_dev = _NSConcreteStackBlock;
    v28.st_ino = 3221225472;
    *(_QWORD *)&v28.st_uid = sub_10001CEEC;
    *(_QWORD *)&v28.st_rdev = &unk_10002A2D8;
    v28.st_atimespec.tv_nsec = v10;
    v28.st_mtimespec.tv_sec = a3;
    v28.st_atimespec.tv_sec = (__darwin_time_t)&v24;
    v14 = &v28;
    v15 = 0;
    do
    {
      if (v13 - v15 < 0x10)
        break;
      v16 = *(_QWORD *)&v12[v15 + 8];
      if (v13 - 16 - v15 < v16)
        break;
      if (!(*(unsigned int (**)(stat *))&v28.st_uid)(v14))
        break;
      v15 = (v15 + v16 + 23) & 0xFFFFFFFFFFFFFFF8;
    }
    while (v15 - 1 < v13);

    if (munmap(v12, *a4) == -1)
    {
      v22 = __error();
      _os_assumes_log(*v22);
    }
    v11 = *((_BYTE *)v25 + 24) != 0;
    _Block_object_dispose(&v24, 8);
  }
  return v11;
}

uint64_t sub_10001B948(int a1, char *a2, _QWORD *a3)
{
  timespec v4;
  uint64_t result;
  stat v6;

  v4.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v4.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v6.st_blksize = v4;
  *(timespec *)v6.st_qspare = v4;
  v6.st_birthtimespec = v4;
  *(timespec *)&v6.st_size = v4;
  v6.st_mtimespec = v4;
  v6.st_ctimespec = v4;
  *(timespec *)&v6.st_uid = v4;
  v6.st_atimespec = v4;
  *(timespec *)&v6.st_dev = v4;
  result = lstat(a2, &v6);
  if ((_DWORD)result)
    return 0;
  if (!__OFADD__(*a3, v6.st_size))
  {
    *a3 += v6.st_size;
    return 0;
  }
  __break(0x5500u);
  return result;
}

uint64_t sub_10001B9DC(uint64_t a1, uint64_t a2)
{
  int v4;
  int v5;
  uint64_t v6;
  int *v7;
  uint64_t result;
  int v9;
  int *v10;
  _QWORD block[7];
  int v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v4 = openat(dword_10002DBF8, *(const char **)(a1 + 8), 1048832);
  if (v4 == -1)
  {
    v7 = __error();
    _os_assumes_log(*v7);
    goto LABEL_6;
  }
  v5 = v4;
  if (v4 < 0)
  {
LABEL_6:
    v6 = 0;
    goto LABEL_7;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001CCF0;
  block[3] = &unk_10002A300;
  v12 = v4;
  block[5] = a1;
  block[6] = a2;
  block[4] = &v13;
  dispatch_sync((dispatch_queue_t)qword_10003A938, block);
  if (close(v5) != -1)
  {
LABEL_4:
    v6 = v14[3];
LABEL_7:
    _Block_object_dispose(&v13, 8);
    return v6;
  }
  v9 = *__error();
  result = *__error();
  if (v9 != 9)
  {
    _os_assumes_log(result);
    v10 = __error();
    _os_assumes_log(*v10);
    goto LABEL_4;
  }
  qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_10002DF78 = result;
  __break(1u);
  return result;
}

uint64_t sub_10001BB54(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 40) + 24) - 1;
  return result;
}

uint64_t sub_10001BB6C(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD v7[10];
  int v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001CC44;
  v7[3] = &unk_10002A3B8;
  v8 = a1;
  v7[4] = &v9;
  v7[5] = a2;
  v7[6] = a5;
  v7[7] = a3;
  v7[8] = a4;
  v7[9] = &off_10002DC90;
  dispatch_sync((dispatch_queue_t)qword_10003A938, v7);
  v5 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t sub_10001BC40(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  size_t v11;
  compression_algorithm v12;
  uint8_t *v13;
  size_t v14;
  size_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD v18[2];
  uint64_t (*v19)(uint64_t, unint64_t *);
  void *v20;
  uint64_t v21;

  v3 = result;
  v4 = *(_DWORD *)a2;
  if (*(_QWORD *)(result + 32) != a2)
  {
    if (v4 != 24589)
    {
      if (v4 == 24587)
      {
        v5 = *(_QWORD *)(result + 48);
        if (*(_QWORD *)(v5 + 32))
        {
          sub_10001BEBC(*(_QWORD *)(result + 48));
          v5 = *(_QWORD *)(v3 + 48);
        }
        v6 = sub_10001EFEC((_DWORD *)a2);
        *(_QWORD *)(v5 + 32) = v6;
        if (v6)
        {
          *(_QWORD *)(v5 + 48) = *(_QWORD *)(v6 + 64);
          *(_DWORD *)(v5 + 124) = *(_DWORD *)(v5 + 112);
          sub_10001C2A8(v5, 0);
          sub_100001888();
        }
      }
      return 1;
    }
    v8 = *(_QWORD *)(result + 48);
    if (*(_QWORD *)(v8 + 32))
    {
      v9 = *(_QWORD *)(v8 + 48);
      if (v9)
      {
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v19 = sub_10001C34C;
        v20 = &unk_10002A348;
        v21 = v8;
        v10 = *(_DWORD *)(v9 + 32);
        if (v10)
          v11 = v10;
        else
          v11 = 0x10000;
        if (v10)
          v12 = *(_DWORD *)(v9 + 36);
        else
          v12 = COMPRESSION_LZ4;
        if (!v12)
        {
          v13 = (uint8_t *)(a2 + 16);
          v11 = *(_QWORD *)(a2 + 8);
          goto LABEL_31;
        }
        v13 = (uint8_t *)_os_trace_malloc(v11);
        v14 = compression_decode_buffer(v13, v11, (const uint8_t *)(a2 + 16), *(_QWORD *)(a2 + 8), 0, v12);
        if (!v14)
        {
          free(v13);
          v13 = 0;
LABEL_39:
          free(v13);
LABEL_40:
          *(_QWORD *)(*(_QWORD *)(v3 + 48) + 48) = **(_QWORD **)(*(_QWORD *)(v3 + 48) + 48);
          return 1;
        }
        v15 = v14;
        if (v10)
        {
          if (v14 == v11)
            goto LABEL_28;
          _os_assumes_log(0);
        }
        v11 = v15;
LABEL_28:
        if (!v13)
          goto LABEL_39;
LABEL_31:
        v16 = 0;
        do
        {
          if (v11 - v16 < 0x10)
            break;
          v17 = *(_QWORD *)&v13[v16 + 8];
          if (v11 - v16 - 16 < v17)
            break;
          if (!((unsigned int (*)(_QWORD *))v19)(v18))
            break;
          v16 = (v16 + v17 + 23) & 0xFFFFFFFFFFFFFFF8;
        }
        while (v16 - 1 < v11);
        if (!v12)
          goto LABEL_40;
        goto LABEL_39;
      }
    }
    return 1;
  }
  if (v4 != 4096 || *(_QWORD *)(a2 + 8) < 0x28uLL)
    return 0;
  v7 = *(_QWORD *)(result + 40);
  if (v7 >= 0xFFFFFFFFFFFFFFE0)
  {
    __break(0x5513u);
    return result;
  }
  result = sub_10000B8D4(**(_QWORD ***)(v7 + 32), (_QWORD *)(a2 + 144));
  if (result)
  {
    *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8) = a2 + 144;
    sub_10001C2A8(*(_QWORD *)(v3 + 48), a2);
    return 1;
  }
  return result;
}

void sub_10001BEBC(uint64_t a1)
{
  int v2;
  uint64_t v3;
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  _QWORD *v12;

  if (*(_DWORD *)(a1 + 136))
    sub_10001C130(a1);
  v2 = *(_DWORD *)(a1 + 124);
  if (v2 + 1 == *(_DWORD *)(a1 + 112))
  {
    *(_DWORD *)(a1 + 112) = v2;
LABEL_17:
    sub_1000019FC(*(_QWORD *)(a1 + 32));
    sub_1000019FC(*(_QWORD *)(a1 + 88));
    *(_QWORD *)(a1 + 88) = 0;
    *(_QWORD *)(a1 + 32) = 0;
    *(_QWORD *)(a1 + 48) = 0;
    return;
  }
  v3 = *(_QWORD *)(a1 + 88);
  if (*(_QWORD *)(v3 + 80))
    v4 = **(_QWORD ***)(*(_QWORD *)(v3 + 72) + 8);
  else
    v4 = sub_10000CB1C(v3);
  v6 = v4[2];
  v5 = v4[3];
  if (v6 < *(_QWORD *)(a1 + 16))
    *(_QWORD *)(a1 + 16) = v6;
  if (v5 > *(_QWORD *)(a1 + 24))
    *(_QWORD *)(a1 + 24) = v5;
  v7 = sub_10000A9EC(*(void ***)(a1 + 88));
  v8 = *(_QWORD *)(a1 + 104);
  v9 = *(unsigned int *)(a1 + 124);
  if (!__CFADD__(v8, 16 * v9))
  {
    v10 = v7[1];
    if ((v10 & 7) != 0)
      v11 = (v10 & 0xFFFFFFFFFFFFFFF8) + 24;
    else
      v11 = v10 + 16;
    v12 = (_QWORD *)(v8 + 16 * v9);
    *v12 = v7;
    v12[1] = v11;
    *(_DWORD *)(a1 + 120) += v11;
    goto LABEL_17;
  }
  __break(0x5513u);
}

uint64_t sub_10001BFAC(uint64_t a1)
{
  int v2;
  uint64_t v3;
  _OWORD *v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  int *v16;
  int *v17;
  int value;
  _BYTE v19[20];
  __int128 v20;

  if (faccessat(*(_DWORD *)(a1 + 80), *(const char **)(a1 + 40), 0, 0) == -1)
    goto LABEL_10;
  v2 = *(_DWORD *)(a1 + 84);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_OWORD **)(v3 + 8);
  v5 = *(_OWORD *)(v3 + 16);
  *(_QWORD *)&v19[12] = 0xAAAAAAAAAAAAAAAALL;
  value = 1;
  v20 = v5;
  *(_OWORD *)v19 = *v4;
  if (fsetxattr(v2, "com.apple.logd.metadata", &value, 0x28uLL, 0, 0) == -1)
  {
    v16 = __error();
    _os_assumes_log(*v16);
  }
  fsync(*(_DWORD *)(a1 + 84));
  if (renameat(*(_DWORD *)(a1 + 80), "tmp", *(_DWORD *)(a1 + 80), *(const char **)(a1 + 40)) == -1)
    goto LABEL_10;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *(_QWORD *)(a1 + 56)
                                                              - *(unsigned int *)(*(_QWORD *)(a1 + 48) + 120);
  result = sub_100004728(*(_QWORD **)(a1 + 64), "    - [ %s/%s, %zd, %d ]\n", v6, v7, v8, v9, v10, v11, *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8));
  v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v14 = (unint64_t *)(*(_QWORD *)(a1 + 72) + 56);
  do
    v15 = __ldxr(v14);
  while (__stxr(v15 - v13, v14));
  if (__OFSUB__(v15, v13))
  {
    __break(0x5515u);
LABEL_10:
    result = unlinkat(*(_DWORD *)(a1 + 80), "tmp", 0);
    if ((_DWORD)result == -1)
    {
      v17 = __error();
      return _os_assumes_log(*v17);
    }
  }
  return result;
}

uint64_t sub_10001C130(uint64_t a1)
{
  uint64_t v1;
  uint8_t *v2;
  int v3;
  size_t v4;
  size_t v5;
  size_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  int v12;
  _QWORD *v13;
  uint8_t __b[65536];

  v1 = __chkstk_darwin(a1);
  v2 = __b;
  memset(__b, 170, sizeof(__b));
  v3 = 256;
  v4 = compression_encode_buffer(__b, 0x10000uLL, *(const uint8_t **)(v1 + 128), *(unsigned int *)(v1 + 136), 0, COMPRESSION_LZ4);
  if (v4)
  {
    v5 = v4;
  }
  else
  {
    v3 = 0;
    v2 = *(uint8_t **)(v1 + 128);
    v5 = *(unsigned int *)(v1 + 136);
  }
  v6 = v5 + 16;
  v7 = (v5 + 16) & 0xFFFFFFFFFFFFFFF8;
  if ((v5 & 7) != 0)
    v8 = v7 + 8;
  else
    v8 = v5 + 16;
  result = _os_trace_malloc(v8);
  v10 = result;
  if ((v5 & 7) != 0)
  {
    if ((v6 & 0x8000000000000000) != 0 || v7 > ~result)
    {
      __break(0x5513u);
      return result;
    }
    *(_QWORD *)(result + (v6 & 0xFFFFFFFFFFFFFFF8)) = 0;
  }
  *(_QWORD *)result = 0x110000600DLL;
  *(_QWORD *)(result + 8) = v5;
  memcpy((void *)(result + 16), v2, v5);
  sub_10001C2A8(v1, v10);
  v11 = *(_QWORD *)(v1 + 88);
  v12 = *(_DWORD *)(v1 + 136);
  if (*(_QWORD *)(v11 + 80))
  {
    v13 = **(_QWORD ***)(*(_QWORD *)(v11 + 72) + 8);
  }
  else
  {
    v13 = sub_10000CB1C(v11);
    v11 = *(_QWORD *)(v1 + 88);
  }
  *((_DWORD *)v13 + 8) = v12;
  *((_DWORD *)v13 + 9) = v3;
  result = (uint64_t)sub_10000CB1C(v11);
  *(_DWORD *)(v1 + 136) = 0;
  return result;
}

uint64_t sub_10001C2A8(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  int v4;
  unsigned int v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v3 = result;
  v4 = *(_DWORD *)(result + 112);
  if (v4 == *(_DWORD *)(result + 116))
  {
    v5 = 2 * v4;
    if (v5 <= 0x10)
      v5 = 16;
    *(_DWORD *)(result + 116) = v5;
    result = _os_trace_realloc(*(_QWORD *)(result + 104), 16 * v5);
    *(_QWORD *)(v3 + 104) = result;
  }
  if (a2)
  {
    v6 = *(_QWORD *)(a2 + 8);
    v7 = (v6 & 0xFFFFFFFFFFFFFFF8) + 24;
    v8 = v6 + 16;
    if ((*(_QWORD *)(a2 + 8) & 7) != 0)
      v8 = v7;
  }
  else
  {
    v8 = 0;
  }
  v9 = *(_QWORD *)(v3 + 104);
  v10 = *(unsigned int *)(v3 + 112);
  *(_DWORD *)(v3 + 112) = v10 + 1;
  if (__CFADD__(v9, 16 * v10))
  {
    __break(0x5513u);
  }
  else
  {
    v11 = (_QWORD *)(v9 + 16 * v10);
    *v11 = a2;
    v11[1] = v8;
    *(_DWORD *)(v3 + 120) += v8;
  }
  return result;
}

uint64_t sub_10001C34C(uint64_t result, unint64_t *a2)
{
  uint64_t v3;
  int v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  _QWORD *v21;
  unint64_t v22;
  unsigned int v23;
  size_t *v24;
  size_t v25;
  _QWORD *v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  _BYTE *v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unsigned int v42;
  unint64_t v43;
  unint64_t v44;
  unsigned int *v45;
  uint64_t *v46;
  unint64_t v47;
  _QWORD *v48;
  unint64_t v49;
  unint64_t v50;
  unsigned int v51;
  uint64_t v52;
  BOOL v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  __int16 v68;
  __int16 v69;
  unint64_t v70;
  unint64_t v71;
  char *v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unsigned __int16 v76;
  unsigned __int16 *v77;
  uint64_t v78;
  size_t v79;
  uint64_t v80;
  unsigned int v81;
  _BOOL4 v82;
  size_t v83;
  _BOOL4 v84;
  _QWORD *v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  int v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  int v93;
  unint64_t *v94;
  unint64_t *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t *v98;
  __int16 v99;
  unint64_t v100;
  uint64_t v101;
  unsigned int __n;
  __int16 v103;
  size_t __src[512];
  uint64_t v105;
  int v106;
  __int16 v107;
  _BYTE v108[18];

  v3 = *(_QWORD *)(result + 32);
  v4 = *(_DWORD *)a2;
  if ((*(_DWORD *)a2 - 24578) >= 2)
  {
    if (v4 != 24577)
    {
      if (v4 != 24580)
        return 1;
      goto LABEL_4;
    }
    v14 = a2[1];
    v15 = v14 - 16;
    if (v14 >= 0x10)
    {
      v16 = a2 + 4;
      if (v14 - 4113 < 0xFFFFFFFFFFFFF00FLL)
        goto LABEL_32;
      v17 = *((unsigned __int16 *)a2 + 16);
      if (v15 >= v17)
      {
        v18 = *((unsigned __int16 *)a2 + 17);
        if (v18 <= 0xFFF)
        {
          if (*((_BYTE *)a2 + 29))
          {
            if (v15 <= v17 + (unsigned __int16)(4096 - v18))
            {
              if (v17 > 0x1000)
                goto LABEL_158;
              if (__CFADD__(v16, v17))
                goto LABEL_157;
              v19 = (unsigned __int16)(4096 - v18);
              v20 = (char *)v16 + v17;
              goto LABEL_31;
            }
          }
          else if (v15 == 4096)
          {
            if (__CFADD__(v16, v18))
              goto LABEL_157;
            v20 = (char *)v16 + v18;
            v19 = (unsigned __int16)(4096 - v18);
LABEL_31:
            *(_QWORD *)(v3 + 64) = v20;
            *(_QWORD *)(v3 + 72) = v19;
LABEL_33:
            *(_QWORD *)(v3 + 56) = v16;
            goto LABEL_34;
          }
        }
LABEL_32:
        *(_QWORD *)(v3 + 64) = 0;
        *(_QWORD *)(v3 + 72) = 0;
        goto LABEL_33;
      }
    }
LABEL_155:
    *(_QWORD *)(v3 + 56) = 0;
    return 1;
  }
LABEL_4:
  v5 = *((unsigned __int8 *)a2 + 28);
  if (!*((_BYTE *)a2 + 28))
    return 1;
  v6 = *(_QWORD *)v3;
  v7 = 1;
  v8 = 2;
  v9 = 3;
  if (v5 >= 0xF)
    v9 = 4;
  if (v5 >= 8)
    v8 = v9;
  if (v5 >= 4)
    v7 = v8;
  if (v5 == 1)
    v10 = 0;
  else
    v10 = v7;
  if (__CFADD__(v6, 8 * v10))
    goto LABEL_157;
  v11 = a2[4];
  v12 = *(_QWORD *)(v6 + 8 * v10);
  v13 = sub_10000B8D4(*(_QWORD **)v12, *(_QWORD **)(v3 + 8));
  if (!v13 || v13 == 1 && *(_QWORD *)(v12 + 8) > v11)
    return 1;
LABEL_34:
  v21 = sub_10000D3D4(*(_QWORD **)(*(_QWORD *)(v3 + 32) + 40), a2[2], *((_DWORD *)a2 + 6));
  *(_QWORD *)(v3 + 40) = v21;
  if (!v21)
    goto LABEL_155;
  v22 = a2[1];
  if ((v22 & 7) != 0)
    v23 = (v22 & 0xFFFFFFF8) + 24;
  else
    v23 = v22 + 16;
  if (*(_DWORD *)(v3 + 136) + v23 > *(_DWORD *)(v3 + 140))
    sub_10001C130(v3);
  if (*(_DWORD *)a2 != 24577)
  {
    memcpy((void *)(*(_QWORD *)(v3 + 128) + *(unsigned int *)(v3 + 136)), a2, v23);
    *(_DWORD *)(v3 + 136) += v23;
    sub_10000BEFC(*(_QWORD *)(v3 + 88), a2[4]);
    v78 = sub_10000D26C(*(_QWORD *)(v3 + 88), *(_QWORD *)(v3 + 40));
    *(_QWORD *)(v3 + 80) = v78;
    sub_10000D8F8(*(_QWORD *)(v3 + 88), v78);
    *(_QWORD *)(v3 + 80) = 0;
    *(_QWORD *)(v3 + 40) = 0;
    return 1;
  }
  memset(&__src[2], 170, 0xFF0uLL);
  v24 = *(size_t **)(v3 + 56);
  __src[1] = v24[1];
  v25 = *v24;
  LODWORD(v25) = 268435472;
  __src[0] = v25;
  *(_QWORD *)(v3 + 96) = __src;
  v26 = v24 + 2;
  v27 = *(unsigned __int16 *)v24;
  v28 = (unint64_t)(v24 + 2);
  if (v27 <= 0x1000)
  {
    if (__CFADD__(v24, v27))
      goto LABEL_157;
    v28 = (unint64_t)v24 + v27;
  }
  v94 = a2;
  v95 = a2 + 2;
  while (1)
  {
    v29 = (unint64_t)(v26 + 3);
    if ((unint64_t)(v26 + 3) >= v28)
      break;
    v30 = v26;
    v31 = v26[2];
    v32 = HIWORD(v31);
    if (!HIWORD(v31) || (uint64_t)v32 > (uint64_t)(v28 - v29))
      break;
    v34 = v32 + 24;
    if ((v31 & 0x7000000000000) != 0)
      v34 = (HIWORD(v31) & 0xFFF8) + 32;
    if (__CFADD__(v26, v34))
      goto LABEL_157;
    v26 = (_QWORD *)((char *)v26 + v34);
    v35 = *(_QWORD *)v30;
    if (*(_QWORD *)v30 && (v35 | 2) == 6)
    {
      v36 = WORD1(*(_QWORD *)v30);
      if ((v35 & 0x10000) == 0)
      {
        v37 = 0;
        if ((v35 & 0x100000) == 0)
          goto LABEL_58;
        goto LABEL_67;
      }
      if (v31 >> 51)
      {
        v37 = 8;
        if ((v35 & 0x100000) == 0)
        {
LABEL_58:
          if ((v35 & 0x1000000) == 0)
            goto LABEL_59;
          goto LABEL_70;
        }
LABEL_67:
        if (v37 + 8 <= v32)
        {
          if (__CFADD__(v29, v37))
            goto LABEL_157;
          v37 += 8;
          if ((v35 & 0x1000000) == 0)
          {
LABEL_59:
            LODWORD(v38) = 0;
            v39 = 0;
            v40 = v37;
            v37 = 0;
            goto LABEL_60;
          }
LABEL_70:
          v40 = v37 + 4;
          if (v37 + 4 <= v32)
          {
            if (__CFADD__(v29, v37))
              goto LABEL_157;
            v39 = *(unsigned __int16 *)(v29 + v37);
            v38 = *(unsigned __int16 *)(v29 + v37 + 2);
            if (v38 + v39 <= 0x1000 && 4096 - *(_QWORD *)(v3 + 72) <= v39)
            {
LABEL_60:
              v41 = *(_QWORD *)(v3 + 40);
              if ((*(_WORD *)(v41 + 2) & 1) != 0)
                v42 = 4;
              else
                v42 = 6;
              switch(v36 & 0xE)
              {
                case 2:
                case 4:
                case 6:
                  v42 = 4;
                  break;
                case 8:
                  break;
                case 0xA:
                  v42 = 20;
                  break;
                case 0xC:
                  v42 = 6;
                  break;
                default:
                  v42 = 0;
                  break;
              }
              v43 = v40 + v42;
              if (v43 <= v32)
              {
                v44 = ~v29;
                if (~v29 < v40)
                  goto LABEL_157;
                if (v42)
                {
                  v45 = (unsigned int *)(v29 + v40);
                  if (v42 == 6)
                  {
                    v97 = *((unsigned __int16 *)v45 + 2);
                    v98 = 0;
                  }
                  else
                  {
                    if (v42 == 4)
                      v46 = 0;
                    else
                      v46 = (uint64_t *)(v45 + 1);
                    v97 = 0;
                    v98 = v46;
                  }
                  v96 = *v45;
                  if ((v36 & 0x20) != 0)
                  {
                    v47 = v43 + 2;
                    if (v43 + 2 <= v32)
                    {
                      if (v43 > v44)
                        goto LABEL_157;
                      goto LABEL_91;
                    }
                  }
                  else
                  {
                    v47 = v43;
LABEL_91:
                    __n = v38;
                    v100 = v39;
                    if ((*(_QWORD *)v30 & 0x2000000) != 0)
                    {
                      v48 = v26;
                      v49 = v28;
                      v50 = v47 + 2;
                      if (v47 + 2 > v32)
                      {
                        v101 = 0;
                        v99 = -21846;
                        v47 = HIWORD(v31);
                      }
                      else
                      {
                        if (v47 > v44)
                          goto LABEL_157;
                        v99 = *(_WORD *)(v29 + v47);
                        v103 = v99;
                        v101 = sub_10000C898(*(_QWORD *)(v41 + 64), (uint64_t)&v103);
                        v31 = *((_QWORD *)v30 + 2);
                        v36 = *((_WORD *)v30 + 1);
                        v32 = HIWORD(v31);
                        v47 = v50;
                      }
                      v28 = v49;
                      v26 = v48;
                      if ((v36 & 0x400) != 0)
                        goto LABEL_98;
                    }
                    else
                    {
                      v101 = 0;
                      v99 = -21846;
                      if ((*(_QWORD *)v30 & 0x4000000) != 0)
                      {
LABEL_98:
                        if (v47 < v32)
                        {
                          if (v47 > v44)
                            goto LABEL_157;
                          v51 = *(unsigned __int8 *)(v29 + v47);
                          if (*(_BYTE *)(v29 + v47))
                          {
                            if (v51 == 1)
                            {
                              v52 = 0;
                            }
                            else if (v51 >= 4)
                            {
                              if (v51 >= 8)
                              {
                                v53 = v51 >= 0xF;
                                v52 = 3;
                                if (v53)
                                  v52 = 4;
                              }
                              else
                              {
                                v52 = 2;
                              }
                            }
                            else
                            {
                              v52 = 1;
                            }
                            if (__CFADD__(*(_QWORD *)v3, 8 * v52))
                              goto LABEL_157;
                            v54 = *(_QWORD *)(*(_QWORD *)(v3 + 56) + 8);
                            v55 = *(_QWORD *)(*(_QWORD *)v3 + 8 * v52);
                            v56 = sub_10000B8D4(*(_QWORD **)v55, *(_QWORD **)(v3 + 8));
                            if (v56)
                            {
                              v57 = v54 + (v31 & 0xFFFFFFFFFFFFLL);
                              if (v56 != 1 || *(_QWORD *)(v55 + 8) <= v57)
                              {
                                if (!*(_QWORD *)(v3 + 80))
                                {
                                  v58 = sub_10000D26C(*(_QWORD *)(v3 + 88), *(_QWORD *)(v3 + 40));
                                  *(_QWORD *)(v3 + 80) = v58;
                                  sub_10000D8F8(*(_QWORD *)(v3 + 88), v58);
                                  v36 = *((_WORD *)v30 + 1);
                                }
                                v59 = v36 & 0xE;
                                if (v59 == 10)
                                {
                                  v63 = *(_QWORD *)(*(_QWORD *)(v3 + 88) + 16);
                                  v60 = v101;
                                  if (v63)
                                    v64 = *(_QWORD *)(v63 + 24);
                                  else
                                    v64 = 0;
                                  sub_10000D4DC((float *)v63, v98, v64);
                                  goto LABEL_123;
                                }
                                v60 = v101;
                                if (v59 == 8)
                                {
                                  v61 = sub_10001EDF0(*(unsigned int **)(*(_QWORD *)(v3 + 40) + 56), v96 | (v97 << 32));
                                  if (v61)
                                  {
                                    *(_QWORD *)&v108[10] = 0xAAAAAAAAAAAAAAAALL;
                                    v62 = *(_QWORD *)v61;
                                    v105 = *(_QWORD *)(v61 + 8);
                                    v106 = v62;
                                    v107 = WORD2(v62);
                                    *(_OWORD *)v108 = *(_OWORD *)(v61 + 16);
                                    sub_10000DE3C(*(_QWORD *)(v3 + 88), *(_QWORD *)(v3 + 80), (uint64_t)&v105);
                                    v60 = v101;
                                    goto LABEL_123;
                                  }
                                }
                                else
                                {
LABEL_123:
                                  if (v60)
                                  {
                                    v65 = *(_QWORD *)(v3 + 80);
                                    v66 = *(_QWORD *)(v3 + 88);
                                    v103 = v99;
                                    if (!sub_10000C898(*(_QWORD *)(v65 + 64), (uint64_t)&v103))
                                      sub_10000CBDC(v66, v65, v103, *(char **)(v60 + 8), *(char **)(v60 + 16));
                                    v67 = *(_QWORD *)(v3 + 88);
                                    v68 = (unsigned __int16)sub_10000C688(*(_QWORD **)(v67 + 24), *(char **)(v60 + 8));
                                    sub_10000C824(v67, v68);
                                    v69 = (unsigned __int16)sub_10000C688(*(_QWORD **)(v67 + 24), *(char **)(v60 + 16));
                                    sub_10000C824(v67, v69);
                                  }
                                  result = (uint64_t)sub_10000BEFC(*(_QWORD *)(v3 + 88), v57);
                                  v70 = *(_QWORD *)(v3 + 96);
                                  v71 = *(unsigned __int16 *)v70;
                                  if (v71 > 0x1000)
                                    goto LABEL_158;
                                  if (~v70 < v71)
                                    goto LABEL_157;
                                  v72 = (char *)(v70 + v71);
                                  v73 = *((_QWORD *)v30 + 2);
                                  if ((v73 & 0x7000000000000) != 0)
                                    v74 = (HIWORD(v73) & 0xFFF8) + 32;
                                  else
                                    v74 = HIWORD(v73) + 24;
                                  result = (uint64_t)memcpy(v72, v30, (unsigned __int16)v74);
                                  *(_WORD *)v70 += v74;
                                  if ((v30[3] & 1) != 0)
                                  {
                                    v75 = *(_QWORD *)(v3 + 72);
                                    v76 = *(_WORD *)(v70 + 2) - __n;
                                    *(_WORD *)(v70 + 2) = v76;
                                    if (v76 > 0x1000u)
                                      goto LABEL_158;
                                    if (~v70 < v76)
                                      goto LABEL_157;
                                    memcpy((void *)(v70 + v76), (const void *)(*(_QWORD *)(v3 + 64) + v100 + v75 - 4096), __n);
                                    if (__CFADD__(v72 + 24, v37))
                                      goto LABEL_157;
                                    v77 = (unsigned __int16 *)&v72[v37 + 24];
                                    *v77 = v76;
                                    v77[1] = __n;
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  if (!*(_QWORD *)(v3 + 80))
  {
LABEL_154:
    *(_QWORD *)(v3 + 80) = 0;
    *(_QWORD *)(v3 + 40) = 0;
    *(_QWORD *)(v3 + 96) = 0;
    goto LABEL_155;
  }
  v79 = LOWORD(__src[0]);
  v80 = WORD1(__src[0]);
  v81 = LOWORD(__src[0]) - WORD1(__src[0]) + 4096;
  v82 = v81 < 0xFF9;
  if (v81 >= 0xFF9)
    v81 = 4096;
  if (WORD1(__src[0]) == 4096)
    v83 = LOWORD(__src[0]);
  else
    v83 = v81;
  v84 = WORD1(__src[0]) != 4096 && v82;
  v85 = (_QWORD *)(*(_QWORD *)(v3 + 128) + *(unsigned int *)(v3 + 136));
  *v85 = 24577;
  v85[1] = v83 + 16;
  v86 = (*(_DWORD *)(v3 + 136) + 16);
  *(_DWORD *)(v3 + 136) = v86;
  LOWORD(v85) = *((_WORD *)v94 + 15);
  v87 = *(_QWORD *)(v3 + 128) + v86;
  v88 = *v95;
  v89 = *((_DWORD *)v95 + 2);
  *(_BYTE *)(v87 + 12) = *((_BYTE *)v95 + 12);
  *(_DWORD *)(v87 + 8) = v89;
  *(_QWORD *)v87 = v88;
  *(_BYTE *)(v87 + 13) = v84;
  *(_WORD *)(v87 + 14) = (_WORD)v85;
  v90 = (*(_DWORD *)(v3 + 136) + 16);
  *(_DWORD *)(v3 + 136) = v90;
  v91 = (void *)(*(_QWORD *)(v3 + 128) + v90);
  if (!v84)
  {
    memcpy(v91, __src, v83);
    v93 = *(_DWORD *)(v3 + 136) + v83;
LABEL_153:
    *(_DWORD *)(v3 + 136) = v93;
    goto LABEL_154;
  }
  result = (uint64_t)memcpy(v91, __src, v79);
  v92 = (*(_DWORD *)(v3 + 136) + v79);
  *(_DWORD *)(v3 + 136) = v92;
  if (v80 <= 0x1000)
  {
    if (!__CFADD__(__src, v80))
    {
      memcpy((void *)(*(_QWORD *)(v3 + 128) + v92), (char *)__src + v80, 4096 - v80);
      v93 = *(_DWORD *)(v3 + 136) + 4096 - v80;
      goto LABEL_153;
    }
LABEL_157:
    __break(0x5513u);
  }
LABEL_158:
  __break(0x5512u);
  return result;
}

uint64_t sub_10001CC44(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  BOOL v12;
  int v13;
  uint64_t v14;
  unint64_t *v15;
  unint64_t v16;

  result = unlinkat(*(_DWORD *)(a1 + 80), *(const char **)(a1 + 40), 0);
  if ((_DWORD)result != -1)
  {
    v9 = *(_QWORD *)(a1 + 56);
    **(_BYTE **)(a1 + 48) = 1;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v9;
    result = sub_100004728(*(_QWORD **)(a1 + 64), "    - [ %s/%s, %zd, 0 ]\n", v3, v4, v5, v6, v7, v8, *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8));
    v10 = *(_QWORD *)(a1 + 72);
    v11 = *(_DWORD *)(v10 + 64);
    v12 = __OFSUB__(v11, 1);
    v13 = v11 - 1;
    if (v12)
      goto LABEL_7;
    *(_DWORD *)(v10 + 64) = v13;
    v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    v15 = (unint64_t *)(v10 + 56);
    do
      v16 = __ldxr(v15);
    while (__stxr(v16 - v14, v15));
    if (__OFSUB__(v16, v14))
LABEL_7:
      __break(0x5515u);
  }
  return result;
}

uint64_t sub_10001CCF0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t result;
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
  int *v21;
  uint64_t v22;
  char v23;
  size_t v24;
  _BYTE v25[1056];

  *(_QWORD *)&v25[24] = 0;
  v2 = sub_100016DE0(*(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 56), (uint64_t)&v25[24]);
  memset(&v25[32], 170, 0x400uLL);
  *(_QWORD *)&v25[16] = 0xAA00000000100000;
  *(_QWORD *)v25 = &v25[32];
  *(_QWORD *)&v25[8] = 0x40000000000;
  sub_100016E90((tm *)v25, *(_QWORD *)(a1 + 40), (uint64_t)"Periodic Compaction", 0, v3, v4, v5, v6, v23);
  if ((int)v2 < 1)
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 40) + 64) = v2;
  }
  else
  {
    v7 = 0;
    v8 = 0;
    while (1)
    {
      if (__CFADD__(*(_QWORD *)&v25[24], v7))
        __break(0x5513u);
      v9 = (const char *)(*(_QWORD *)(*(_QWORD *)&v25[24] + 8 * v8) + 21);
      v24 = 0xAAAAAAAAAAAAAAAALL;
      result = sub_10001B6D4(*(unsigned int *)(a1 + 56), v9, *(_QWORD *)(a1 + 48), &v24);
      if (!(_DWORD)result)
        break;
      if (unlinkat(*(_DWORD *)(a1 + 56), v9, 0) == -1)
      {
        v21 = __error();
        _os_assumes_log(*v21);
      }
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += v24;
      sub_100004728(v25, "    - %s/%s\n", v15, v16, v17, v18, v19, v20, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));
      result = sub_100017050(v9);
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32) = result;
      ++v8;
      v7 += 8;
      if (v2 == v8)
      {
        v8 = v2;
        break;
      }
    }
    if (__OFSUB__((_DWORD)v2, (_DWORD)v8))
    {
      __break(0x5515u);
      return result;
    }
    v22 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)(v22 + 64) = v2 - v8;
    if ((_DWORD)v8)
      sub_1000170E4(v25, v22, v8, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), v11, v12, v13, v14);
  }
  if ((v25[20] & 1) != 0)
    free(*(void **)v25);
  return _os_trace_scandir_free_namelist(v2, *(_QWORD *)&v25[24]);
}

uint64_t sub_10001CEEC(uint64_t a1, int *a2)
{
  int v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t result;
  uint64_t v7;

  v3 = *a2;
  if (*(int **)(a1 + 40) == a2)
  {
    if (v3 == 4096 && *((_QWORD *)a2 + 1) >= 0x28uLL)
    {
      result = sub_10000B8D4(**(_QWORD ***)(a1 + 48), (_QWORD *)a2 + 18);
      if (result != 1)
      {
        v7 = result;
        result = 0;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v7 == 0;
      }
    }
    else
    {
      return 0;
    }
  }
  else if (v3 == 24587 && (v4 = sub_10001EFEC(a2)) != 0)
  {
    v5 = (_QWORD *)(v4 + 64);
    while (1)
    {
      v5 = (_QWORD *)*v5;
      if (!v5)
        break;
      if (v5[3] >= *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8))
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
        break;
      }
    }
    sub_1000019FC(v4);
    return *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) != 0;
  }
  else
  {
    return 1;
  }
  return result;
}

void sub_10001CFD0(void *a1, void *a2, uint64_t *a3)
{
  __int128 v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  __int128 v11;
  void *v12;
  int v13;
  void **v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id *v20;
  unint64_t v21;
  id v22;
  size_t v23;
  _QWORD v24[2];
  _QWORD v25[2];
  uuid_string_t out;
  uuid_t uu;
  char in[16];
  _BYTE v29[21];

  memset(uu, 170, sizeof(uu));
  *(_QWORD *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)out = v5;
  *(_OWORD *)&out[16] = v5;
  v6 = a2;
  v7 = a1;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v6));
  if ((objc_msgSend(v8, "isNSDictionary") & 1) == 0)
    goto LABEL_10;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ContinuousTime")));
  if ((objc_msgSend(v9, "isNSNumber") & 1) == 0)
  {

LABEL_10:
    goto LABEL_11;
  }
  v10 = objc_msgSend(v9, "unsignedLongLongValue");
  *(_QWORD *)&v29[13] = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)in = v11;
  *(_OWORD *)v29 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("UUID")));

  if (!objc_msgSend(v12, "isNSString")
    || (objc_msgSend(v12, "getCString:maxLength:encoding:", in, 37, 1) & 1) == 0)
  {

    goto LABEL_10;
  }
  v13 = uuid_parse(in, uu);

  if (!v13)
  {
    v14 = (void **)*a3;
    v15 = *a3 ? v14[3] : 0;
    v19 = sub_10000B8D4((_QWORD *)*a3, uu);
    if (v19)
    {
      v20 = (id *)(a3 + 1);
      v21 = v19 - 1;
      if (v19 == 1)
      {
        v22 = *v20;
        if (*v20 <= v10)
          v22 = v10;
        *v20 = v22;
      }
      else
      {
        *v20 = v10;
        if ((unint64_t)v15 > v21)
        {
          memmove(a3 + 3, &a3[2 * v21 + 3], 16 * (uint64_t)((uint64_t)v15 - v21));
          sub_1000105EC(v14);
          operator new();
        }
        if (v14)
          v23 = 16 * (_QWORD)v14[3];
        else
          v23 = 0;
        *v20 = 0;
        a3[2] = 0;
        bzero(a3 + 3, v23);
        sub_10000F504(v14);
      }
    }
  }
LABEL_11:
  uuid_unparse_upper((const unsigned __int8 *)a3 + 24, out);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", out, CFSTR("UUID")));
  v24[1] = CFSTR("ContinuousTime");
  v25[0] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3[1]));
  v25[1] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v25, v24, 2));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, v6);

}

void sub_10001D2B0(id a1)
{
  char v1[1032];

  memset(&v1[56], 170, 0x3C8uLL);
  strcpy(v1, "Received a Cancel Request from CacheDelete. Ignoring...");
  sub_100013FF0((uint64_t)v1);
}

__CFDictionary *__cdecl sub_10001D338(id a1, int a2, __CFDictionary *a3)
{
  void *v5;
  void *v6;
  id v7;
  const char *v8;
  int v9;
  uint64_t v10;
  void *v11;
  __CFDictionary *v12;
  _QWORD v14[2];
  void (*v15)(uint64_t, uint64_t);
  void *v16;
  uint64_t *v17;
  uint64_t *v18;
  int v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  const __CFString *v28;
  void *v29;
  char __b[1032];

  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0xAAAAAAAAAAAAAAAALL;
  v5 = objc_autoreleasePoolPush();
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](a3, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_AMOUNT")));
  v7 = objc_msgSend(v6, "longLongValue");

  objc_autoreleasePoolPop(v5);
  v23 = (unint64_t)v7;
  memset(__b, 170, 0x400uLL);
  v8 = (const char *)objc_msgSend(objc_retainAutorelease(-[__CFDictionary objectForKeyedSubscript:](a3, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_VOLUME"))), "UTF8String");
  snprintf(__b, 0x400uLL, "Received a Purge Request from CacheDelete on volume %s with urgency: %d and goal: %lld", v8, a2, v21[3]);
  sub_100013FF0((uint64_t)__b);
  if (qword_10003A9B0 != -1)
    dispatch_once(&qword_10003A9B0, &stru_10002A6F0);
  if (sub_100019498((const char *)qword_10003A998, a3))
  {
    if (a2 == 2)
      v9 = 2;
    else
      v9 = 3;
    v14[0] = _NSConcreteStackBlock;
    if (a2 <= 1)
      v9 = 1;
    v14[1] = 3221225472;
    v15 = sub_10001D684;
    v16 = &unk_10002A230;
    v19 = v9;
    v17 = &v20;
    v18 = &v24;
    sub_10001D684((uint64_t)v14, (uint64_t)&off_10002DDB0);
    sub_10001D684((uint64_t)v14, (uint64_t)&off_10002DD20);
    v15((uint64_t)v14, (uint64_t)&off_10002DC00);
    v15((uint64_t)v14, (uint64_t)&off_10002DC90);
  }
  if (qword_10003A9B0 != -1)
    dispatch_once(&qword_10003A9B0, &stru_10002A6F0);
  if (sub_100019498((const char *)qword_10003A9A8, a3))
  {
    memset(&__b[19], 170, 0x3EDuLL);
    strcpy(__b, "Purging UUID Cache");
    sub_100013FF0((uint64_t)__b);
    sub_100017764();
  }
  v10 = v25[3];
  memset(__b, 170, 0x400uLL);
  snprintf(__b, 0x400uLL, "Purge complete. Goal: %lld bytes. Removed: %lld bytes", v21[3], v10);
  sub_100013FF0((uint64_t)__b);
  v28 = CFSTR("CACHE_DELETE_AMOUNT");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v25[3]));
  v29 = v11;
  v12 = (__CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1));

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
  return v12;
}

void sub_10001D684(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD block[128];

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(_QWORD *)(v2 + 24);
  if (v3 < 1)
    return;
  v5 = a1;
  v6 = *(unsigned int *)(a1 + 48);
  if (*(_DWORD *)(a2 + 64) <= *(_DWORD *)(a2 + 92))
  {
    if (v6 >= 4)
    {
LABEL_22:
      __break(0x5512u);
      goto LABEL_23;
    }
    if (__CFADD__(a2 + 96, 8 * v6))
    {
LABEL_21:
      __break(0x5513u);
      goto LABEL_22;
    }
    if (*(_QWORD *)(a2 + 56) <= *(_QWORD *)(a2 + 8 * v6 + 96))
    {
      v11 = 0;
      goto LABEL_14;
    }
  }
  else if (v6 > 3)
  {
    goto LABEL_22;
  }
  if (__CFADD__(a2 + 96, 8 * v6))
    goto LABEL_21;
  v7 = *(_QWORD *)(a2 + 8 * v6 + 96);
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v8 = openat(dword_10002DBF8, *(const char **)(a2 + 8), 1048832);
  if (v8 == -1)
  {
    a1 = *__error();
  }
  else
  {
    v9 = v8;
    if (v8 < 0)
      goto LABEL_12;
    v10 = *(NSObject **)(a2 + 16);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001772C;
    block[3] = &unk_100029E18;
    block[4] = &v17;
    block[5] = a2;
    block[6] = v3;
    block[7] = v7;
    block[8] = __PAIR64__(v9, v6);
    dispatch_sync(v10, block);
    if (close(v9) != -1)
      goto LABEL_12;
    v16 = *__error();
    a1 = *__error();
    if (v16 == 9)
    {
LABEL_25:
      qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
      qword_10002DF78 = a1;
      __break(1u);
      return;
    }
  }
  _os_assumes_log(a1);
LABEL_12:
  v11 = v18[3];
  _Block_object_dispose(&v17, 8);
  v2 = *(_QWORD *)(*(_QWORD *)(v5 + 32) + 8);
  v3 = *(_QWORD *)(v2 + 24);
LABEL_14:
  if (__OFSUB__(v3, v11))
  {
LABEL_23:
    __break(0x5515u);
    goto LABEL_24;
  }
  *(_QWORD *)(v2 + 24) = v3 - v11;
  v12 = *(_QWORD *)(*(_QWORD *)(v5 + 40) + 8);
  v13 = *(_QWORD *)(v12 + 24);
  v14 = __OFADD__(v13, v11);
  v15 = v13 + v11;
  if (v14)
  {
LABEL_24:
    __break(0x5500u);
    goto LABEL_25;
  }
  *(_QWORD *)(v12 + 24) = v15;
  memset(block, 170, sizeof(block));
  snprintf((char *)block, 0x400uLL, "Purging book: %s, Removed: %lld bytes", *(const char **)(a2 + 8), v11);
  sub_100013FF0((uint64_t)block);
}

__CFDictionary *__cdecl sub_10001D8E0(id a1, int a2, __CFDictionary *a3)
{
  int v5;
  void *v6;
  void *v7;
  __CFDictionary *v8;
  _QWORD v10[2];
  uint64_t (*v11)(uint64_t, uint64_t);
  void *v12;
  uint64_t *v13;
  uint64_t *v14;
  int v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[2];
  _QWORD v25[2];
  char __b[1024];

  memset(__b, 170, sizeof(__b));
  snprintf(__b, 0x400uLL, "Received a Purgeable Request from CacheDelete on volume: %s", (const char *)objc_msgSend(objc_retainAutorelease(-[__CFDictionary objectForKeyedSubscript:](a3, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_VOLUME"))), "UTF8String"));
  sub_100013FF0((uint64_t)__b);
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  if (qword_10003A9B0 != -1)
    dispatch_once(&qword_10003A9B0, &stru_10002A6F0);
  if (sub_100019498((const char *)qword_10003A998, a3))
  {
    if (a2 == 2)
      v5 = 2;
    else
      v5 = 3;
    v10[0] = _NSConcreteStackBlock;
    if (a2 <= 1)
      v5 = 1;
    v10[1] = 3221225472;
    v11 = sub_10001DB54;
    v12 = &unk_10002A230;
    v15 = v5;
    v13 = &v20;
    v14 = &v16;
    sub_10001DB54((uint64_t)v10, (uint64_t)&off_10002DDB0);
    sub_10001DB54((uint64_t)v10, (uint64_t)&off_10002DD20);
    v11((uint64_t)v10, (uint64_t)&off_10002DC00);
    v11((uint64_t)v10, (uint64_t)&off_10002DC90);
  }
  memset(__b, 170, sizeof(__b));
  snprintf(__b, 0x400uLL, "Reporting %lld/%lld bytes as purgeable", v21[3], v17[3]);
  sub_100013FF0((uint64_t)__b);
  v24[0] = CFSTR("CACHE_DELETE_AMOUNT");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v21[3]));
  v24[1] = CFSTR("CACHE_DELETE_NONPURGEABLE_AMOUNT");
  v25[0] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v17[3]));
  v25[1] = v7;
  v8 = (__CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v25, v24, 2));

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  return v8;
}

uint64_t sub_10001DB54(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v2 = *(_QWORD *)(a2 + 56);
  v3 = *(unsigned int *)(result + 48);
  if (v3 >= 4)
  {
    __break(0x5512u);
    goto LABEL_12;
  }
  if (__CFADD__(a2 + 96, 8 * v3))
  {
LABEL_12:
    __break(0x5513u);
LABEL_13:
    __break(0x5515u);
    return result;
  }
  v4 = *(_QWORD *)(a2 + 8 * v3 + 96);
  v5 = v2 - v4;
  if (v2 <= v4)
    goto LABEL_9;
  if (__OFSUB__(v2, v4))
    goto LABEL_13;
  v2 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  v6 = *(_QWORD *)(v2 + 24);
  v7 = __OFADD__(v6, v5);
  v8 = v6 + v5;
  if (v7
    || (*(_QWORD *)(v2 + 24) = v8,
        v9 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8),
        v11 = *(_QWORD *)(v9 + 24),
        v10 = (_QWORD *)(v9 + 24),
        v2 = v11 + v4,
        __OFADD__(v11, v4)))
  {
    do
    {
      __break(0x5500u);
LABEL_9:
      v12 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
      v13 = *(_QWORD *)(v12 + 24);
      v10 = (_QWORD *)(v12 + 24);
      v7 = __OFADD__(v13, v2);
      v2 += v13;
    }
    while (v7);
  }
  *v10 = v2;
  return result;
}

uint64_t sub_10001DBDC()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  int v3;
  const char *boot_uuid;
  int *v5;
  int v6;
  _QWORD *v7;
  FTS *v8;
  FTS *v9;
  FTSENT *v10;
  FTSENT *v11;
  uint64_t result;
  int v13;
  uint64_t v14;
  _QWORD v15[2];
  const char *(*v16)(uint64_t, uint64_t);
  void *v17;
  int *v18;
  uuid_t uu;
  char __str[8];
  _QWORD v21[3];

  if (qword_10003A9B0 != -1)
    dispatch_once(&qword_10003A9B0, &stru_10002A6F0);
  v0 = openat(-2, (const char *)qword_10003A9A0, 0);
  if ((_DWORD)v0 == -1)
  {
    v14 = *__error();
    qword_10002DF48 = (uint64_t)"BUG IN LIBTRACE: Unable to open timesync directory";
    qword_10002DF78 = v14;
    __break(1u);
LABEL_27:
    __break(0x5513u);
  }
  if (&qword_10002DC70 < (uint64_t *)&unk_10002DC60)
    goto LABEL_27;
  v1 = v0;
  v2 = qword_10002DC70;
  if (qword_10002DC38 <= qword_10002DC70)
    goto LABEL_9;
  v0 = openat(dword_10002DBF8, off_10002DC08, 1048832);
  if ((_DWORD)v0 == -1)
  {
    result = *__error();
LABEL_25:
    v0 = _os_assumes_log(result);
LABEL_9:
    memset(uu, 170, sizeof(uu));
    boot_uuid = (const char *)_os_trace_get_boot_uuid(v0);
    uuid_parse(boot_uuid, uu);
    v5 = (int *)_os_trace_zalloc(48);
    memset(v21, 170, 18);
    *(_QWORD *)__str = 0xAAAAAAAAAAAAAAAALL;
    snprintf(__str, 0x1AuLL, "%016llx.timesync", 1);
    v6 = openat(v1, __str, 1537, 420);
    if (v6 < 0)
    {
      free(v5);
      v5 = 0;
    }
    else
    {
      *v5 = v6;
      uuid_copy((unsigned __int8 *)v5 + 4, uu);
      *((_QWORD *)v5 + 3) = _os_trace_calloc(8196, 64);
      *((_OWORD *)v5 + 2) = xmmword_1000243A0;
    }
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v16 = sub_10001E2FC;
    v17 = &unk_10002A1E8;
    v18 = v5;
    v7 = v15;
    if (qword_10003A9B0 != -1)
      dispatch_once(&qword_10003A9B0, &stru_10002A6F0);
    *(_QWORD *)__str = qword_10003A998;
    v21[0] = 0;
    v8 = fts_open((char *const *)__str, 2132, 0);
    if (v8)
    {
      v9 = v8;
      v10 = fts_read(v8);
      if (v10)
      {
        v11 = v10;
        do
        {
          if (v11->fts_info == 8)
            ((void (*)(_QWORD *))v16)(v7);
          v11 = fts_read(v9);
        }
        while (v11);
      }
      fts_close(v9);
    }
    else
    {
      _os_assumes_log(0);
    }

    qsort_b(*((void **)v5 + 3), *((_QWORD *)v5 + 4), 0x40uLL, &stru_10002A750);
    operator new();
  }
  v3 = v0;
  if ((v0 & 0x80000000) != 0)
    goto LABEL_9;
  sub_100016B64((uint64_t)&off_10002DC00, 2u, 0x7FFFFFFFFFFFFFFFLL, v2, v0);
  v0 = close(v3);
  if ((_DWORD)v0 != -1)
    goto LABEL_9;
  v13 = *__error();
  result = *__error();
  if (v13 != 9)
    goto LABEL_25;
  qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_10002DF78 = result;
  __break(1u);
  return result;
}

const char *sub_10001E2FC(uint64_t a1, uint64_t a2)
{
  const char *result;
  char *v5;
  unint64_t v6;
  uint64_t v7;
  size_t v8;
  unint64_t v9;
  size_t v10;
  _QWORD v11[2];
  uint64_t (*v12)(uint64_t, unsigned __int8 *);
  void *v13;
  uint64_t v14;

  result = strrchr((char *)(a2 + 104), 46);
  if (result)
  {
    result = (const char *)strcmp(result, ".tracev3");
    if (!(_DWORD)result)
    {
      v10 = 0xAAAAAAAAAAAAAAAALL;
      result = (const char *)_os_trace_mmap_at(4294967294, *(_QWORD *)(a2 + 48), 0, &v10);
      if (result)
      {
        v5 = (char *)result;
        v6 = 0;
        v7 = *(_QWORD *)(a1 + 32);
        v8 = v10;
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 0x40000000;
        v12 = sub_100020CF4;
        v13 = &unk_10002A710;
        v14 = v7;
        do
        {
          if (v8 - v6 < 0x10)
            break;
          v9 = *(_QWORD *)&v5[v6 + 8];
          if (v8 - v6 - 16 < v9)
            break;
          if (!((unsigned int (*)(_QWORD *))v12)(v11))
            break;
          v6 = (v6 + v9 + 23) & 0xFFFFFFFFFFFFFFF8;
        }
        while (v6 - 1 < v8);
        return (const char *)munmap(v5, v10);
      }
    }
  }
  return result;
}

void sub_10001E428(id a1, int a2)
{
  int v2;
  FTS *v3;
  FTS *v4;
  FTSENT *v5;
  FTSENT *v6;
  char *v7;
  const char *v8;
  int v9;
  int *v10;
  id v11;
  void *v12;
  int v13;
  __int128 v14;
  uint64_t v15;
  char *v16[2];

  do
    v2 = __ldxr((unsigned int *)&dword_10002DF08);
  while (__stxr(0xFFFFFFFF, (unsigned int *)&dword_10002DF08));
  if (v2 != -1)
  {
    notify_cancel(v2);
    if (qword_10003A9B0 != -1)
      dispatch_once(&qword_10003A9B0, &stru_10002A6F0);
    v16[0] = (char *)qword_10003A998;
    v16[1] = 0;
    v3 = fts_open(v16, 2132, 0);
    if (v3)
    {
      v4 = v3;
      v5 = fts_read(v3);
      if (v5)
      {
        v6 = v5;
        while (1)
        {
          if (v6->fts_info != 8)
            goto LABEL_17;
          v15 = 0;
          v14 = xmmword_100024268;
          v7 = strrchr(v6->fts_name, 46);
          if (!v7)
            goto LABEL_17;
          v8 = v7;
          if (!strcmp(v7, ".log") || !strcmp(v8, ".txt"))
            break;
          if (!strcmp(v8, ".tracev3"))
          {
            v9 = 3;
            goto LABEL_15;
          }
LABEL_17:
          v6 = fts_read(v4);
          if (!v6)
            goto LABEL_18;
        }
        v9 = 4;
LABEL_15:
        v13 = v9;
        if (setattrlist(v6->fts_path, &v14, &v13, 4uLL, 0) == -1)
        {
          v10 = __error();
          _os_assumes_log(*v10);
        }
        goto LABEL_17;
      }
LABEL_18:
      fts_close(v4);
    }
    else
    {
      _os_assumes_log(0);
    }
    v11 = sub_10001A370();
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    sub_10001A588(v12, 1);

  }
}

void sub_10001E608(void *a1)
{
  id v1;
  _QWORD *v2;
  FTS *v3;
  FTS *v4;
  FTSENT *v5;
  FTSENT *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[2];
  const char *(*v11)(uint64_t, uint64_t);
  void *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  char *v18[2];

  v1 = a1;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v11 = sub_10001E9F4;
  v12 = &unk_10002A078;
  v13 = &v14;
  v2 = v10;
  if (qword_10003A9B0 != -1)
    dispatch_once(&qword_10003A9B0, &stru_10002A6F0);
  v18[0] = (char *)qword_10003A998;
  v18[1] = 0;
  v3 = fts_open(v18, 2132, 0);
  if (v3)
  {
    v4 = v3;
    v5 = fts_read(v3);
    if (v5)
    {
      v6 = v5;
      do
      {
        if (v6->fts_info == 8)
          ((void (*)(_QWORD *))v11)(v2);
        v6 = fts_read(v4);
      }
      while (v6);
    }
    fts_close(v4);
  }
  else
  {
    _os_assumes_log(0);
  }

  if (*((_BYTE *)v15 + 24))
  {
    v7 = v1;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Pending")));
    if (v8)
    {
      v9 = v8;
      if ((objc_msgSend(v8, "containsObject:", CFSTR("timesync-build")) & 1) == 0)
        objc_msgSend(v9, "addObject:", CFSTR("timesync-build"));
    }
    else
    {
      v9 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithObjects:", CFSTR("timesync-build"), 0);
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("Pending"));
    }

  }
  _Block_object_dispose(&v14, 8);

}

uint64_t sub_10001E7E8()
{
  FTS *v0;
  FTS *v1;
  FTSENT *v2;
  FTSENT *v3;
  char *v4;
  const char *v5;
  int *v6;
  char *v8[2];

  if (qword_10003A9B0 != -1)
    dispatch_once(&qword_10003A9B0, &stru_10002A6F0);
  v8[0] = (char *)qword_10003A998;
  v8[1] = 0;
  v0 = fts_open(v8, 2132, 0);
  if (!v0)
    return _os_assumes_log(0);
  v1 = v0;
  v2 = fts_read(v0);
  if (v2)
  {
    v3 = v2;
    do
    {
      if (v3->fts_info == 8)
      {
        v4 = strrchr(v3->fts_name, 46);
        if (v4)
        {
          v5 = v4;
          if ((!strcmp(v4, ".txt") || !strcmp(v5, ".log") || !strcmp(v5, ".tracev3"))
            && chmod(v3->fts_path, 0x1A4u) == -1)
          {
            v6 = __error();
            _os_assumes_log(*v6);
          }
        }
      }
      v3 = fts_read(v1);
    }
    while (v3);
  }
  return fts_close(v1);
}

uint64_t sub_10001E948()
{
  unlinkat(dword_10002DBF8, "uuid.purged.0.txt", 0);
  return unlinkat(dword_10002DBF8, "uuid.purged.1.txt", 0);
}

void sub_10001E988(void *a1)
{
  id v1;
  void *v2;
  id v3;

  v1 = a1;
  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUIDString"));
  objc_msgSend(v1, "setObject:forKeyedSubscript:", v2, CFSTR("Identifier"));

}

const char *sub_10001E9F4(uint64_t a1, uint64_t a2)
{
  const char *result;
  int *v5;

  result = strrchr((char *)(a2 + 104), 46);
  if (result)
  {
    result = (const char *)strcmp(result, ".timesync");
    if (!(_DWORD)result)
    {
      result = (const char *)unlink(*(const char **)(a2 + 48));
      if ((_DWORD)result == -1)
      {
        v5 = __error();
        result = (const char *)_os_assumes_log(*v5);
      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    }
  }
  return result;
}

unsigned __int8 *sub_10001EA64(unsigned __int8 *result, uint64_t a2)
{
  _QWORD *v3;
  int v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int v12;
  _QWORD v13[6];
  unint64_t v14;
  unint64_t v15;
  _OWORD v16[6];
  uint64_t v17;
  _OWORD v18[5];
  uint64_t v19;

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
            if (v6 >> 59 || (v7 = v3[1], v5 > ~v7))
              __break(0x5513u);
            result = (unsigned __int8 *)(*(uint64_t (**)(uint64_t, unint64_t, unint64_t))(a2 + 16))(a2, v6++, v7 + v5);
            v5 += 16;
          }
          while (v6 < v3[2]);
        }
        return result;
      }
      printf("TB_FATAL: invalid tag in array metadata: 0x%x (%s:%d)\n", v4, "/Library/Caches/com.apple.xbs/Binaries/libtrace_executables/install/TempContent/Objects/libtrace.build/logd.build/DerivedSources/OSLogDarwin_C.c", 707);
      _os_crash("TB_FATAL: invalid tag in array metadata: 0x%x", v12);
      __break(1u);
LABEL_19:
      result = (unsigned __int8 *)_os_crash("TB_ASSERT: (err == TB_ERROR_SUCCESS) && \"failed to wrap packed buffer\"");
      __break(1u);
      return result;
    }
    v8 = *((_QWORD *)result + 1);
    v9 = v3[2];
    v10 = v3[3];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 0x40000000;
    v13[2] = sub_10001EC90;
    v13[3] = &unk_10002A3E0;
    v13[4] = a2;
    v13[5] = v3;
    result = (unsigned __int8 *)tb_message_subrange(v8, v9, v10, v13);
    if (!(_DWORD)result)
      return result;
    _os_crash("TB_ASSERT: (vErr == TB_ERROR_SUCCESS) && \"tb_message_subrange failed\"");
    __break(1u);
  }
  v19 = 0;
  memset(v18, 0, sizeof(v18));
  v17 = 0;
  memset(v16, 0, sizeof(v16));
  tb_transport_message_buffer_wrap_buffer(v16, v3[1], v3[2]);
  if (tb_message_construct(v18, v16, 0))
    goto LABEL_19;
  result = (unsigned __int8 *)tb_message_configure_recieved(v18, 2);
  if (v3[3])
  {
    v11 = 0;
    do
    {
      v14 = 0xAAAAAAAAAAAAAAAALL;
      v15 = 0xAAAAAAAAAAAAAAAALL;
      tb_message_decode_u32(v18, &v14);
      tb_message_decode_u32(v18, (char *)&v14 + 4);
      tb_message_decode_u64(v18, &v15);
      result = (unsigned __int8 *)(*(uint64_t (**)(uint64_t, unint64_t, unint64_t *))(a2 + 16))(a2, v11++, &v14);
    }
    while (v11 < v3[3]);
  }
  return result;
}

uint64_t sub_10001EC90(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  unint64_t v6;
  unint64_t v7;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 32))
  {
    v4 = 0;
    do
    {
      v6 = 0xAAAAAAAAAAAAAAAALL;
      v7 = 0xAAAAAAAAAAAAAAAALL;
      tb_message_decode_u32(a2, &v6);
      tb_message_decode_u32(a2, (char *)&v6 + 4);
      tb_message_decode_u64(a2, &v7);
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      ++v4;
    }
    while (v4 < *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32));
  }
  return 0;
}

uint64_t sub_10001ED68(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += 16;
  return result;
}

uint64_t sub_10001ED80(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

uint64_t sub_10001ED98(uint64_t a1, uint64_t a2, unsigned int *a3)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a1 + 32);
  tb_message_encode_u32(v4, *a3);
  tb_message_encode_u32(v4, a3[1]);
  return tb_message_encode_u64(v4, *((_QWORD *)a3 + 1));
}

uint64_t sub_10001EDD8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_10001EDF0(unsigned int *a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD v4[7];
  _QWORD v5[4];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2000000000;
  v9 = 0;
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2000000000;
  v5[3] = -1;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 0x40000000;
  v4[2] = sub_10001EEC8;
  v4[3] = &unk_10002A4A0;
  v4[5] = &v6;
  v4[6] = a2;
  v4[4] = v5;
  sub_10000B778(a1, (uint64_t)v4);
  v2 = v7[3];
  _Block_object_dispose(v5, 8);
  _Block_object_dispose(&v6, 8);
  return v2;
}

_QWORD *sub_10001EEC8(_QWORD *result, uint64_t a2, _QWORD *a3)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v3 = result[6];
  if (v3 >= *a3)
  {
    v4 = a3[1];
    if (v3 < v4 + *a3)
    {
      v5 = *(_QWORD *)(result[4] + 8);
      if (v4 < *(_QWORD *)(v5 + 24))
      {
        *(_QWORD *)(v5 + 24) = v4;
        *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24) = a3;
      }
    }
  }
  return result;
}

BOOL sub_10001EF10(unint64_t *a1, unint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5)
{
  BOOL v10;
  unint64_t i;
  unint64_t v12;

  if (a4)
  {
    v10 = 0;
    for (i = 0; i != a4; v10 = i >= a4)
    {
      v12 = *a1;
      if (a2)
      {
        if (a2 < v12 || a2 - v12 < a3)
          break;
      }
      *a1 = v12 + a3;
      if (!v12)
        break;
      if (((*(uint64_t (**)(uint64_t, unint64_t, unint64_t, unint64_t *))(a5 + 16))(a5, i, v12, a1) & 1) == 0)break;
      ++i;
    }
  }
  else
  {
    return 1;
  }
  return v10;
}

BOOL sub_10001EFB8(unint64_t *a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t *v4;
  BOOL v5;

  v4 = (unint64_t *)*a1;
  if ((!a2 || (a2 >= (unint64_t)v4 ? (v5 = a2 - (unint64_t)v4 >= 8) : (v5 = 0), v5))
    && (*a1 = (unint64_t)(v4 + 1), v4))
  {
    return sub_10001EF10(a1, a2, a3, *v4, a4);
  }
  else
  {
    return 0;
  }
}

uint64_t sub_10001EFEC(_DWORD *a1)
{
  _QWORD *v1;

  if (*a1 == 24587)
  {
    v1 = (_QWORD *)_os_trace_calloc(1, 88);
    v1[8] = 0;
    v1[9] = v1 + 8;
    v1[1] = -1;
    operator new();
  }
  return 0;
}

uint64_t sub_10001F55C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_10000D4DC(*(float **)(*(_QWORD *)(a1 + 32) + 16), a3, a2);
  if (*(_BYTE *)(a1 + 40))
    sub_1000206A0(a2, (unsigned __int8 *)a3);
  return 1;
}

uint64_t sub_10001F5B4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_10000D4DC(*(float **)(*(_QWORD *)(a1 + 32) + 16), a3, a2);
  if (*(_BYTE *)(a1 + 40))
    sub_1000206A0(a2, (unsigned __int8 *)a3);
  return 1;
}

uint64_t sub_10001F60C(uint64_t a1, unsigned __int16 a2, uint64_t a3, unsigned __int16 **a4)
{
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int **v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  int v28;
  __int128 v29;
  const char *v30;
  uuid_string_t out;

  if (sub_10000D3D4(*(_QWORD **)(*(_QWORD *)(a1 + 32) + 40), *(_QWORD *)(a3 + 8), *(_DWORD *)(a3 + 16)))
    return 1;
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(_DWORD *)(v9 + 4);
  v11 = v9 + 40;
  v12 = v9 + 32;
  v13 = v10 == 17;
  if (v10 == 17)
    v14 = v9 + 40;
  else
    v14 = v9 + 32;
  v15 = *(unsigned __int16 *)(v9 + 16);
  v16 = v11 + v15;
  v17 = v12 + v15;
  if (v13)
    v18 = v16;
  else
    v18 = v17;
  v19 = _os_trace_calloc(1, 72);
  v20 = (unsigned int **)v19;
  *(_DWORD *)v19 = *(_DWORD *)a3;
  *(_DWORD *)(v19 + 4) = *(_DWORD *)(a3 + 20);
  *(_QWORD *)(v19 + 8) = *(_QWORD *)(a3 + 8);
  *(_DWORD *)(v19 + 16) = *(_DWORD *)(a3 + 16);
  *(_DWORD *)(v19 + 20) = *(_DWORD *)(a3 + 24);
  v21 = *(unsigned __int16 *)(a3 + 4);
  v22 = v18 - v14;
  if (v22 >= 16 * v21 && v22 - 16 * v21 > 0xF)
    *(_OWORD *)(v19 + 24) = *(_OWORD *)(v14 + 16 * v21);
  else
    _os_assumes_log(0);
  v24 = *(unsigned __int16 *)(a3 + 6);
  if (v24 != 0xFFFF)
  {
    if (v22 >= 16 * v24 && v22 - 16 * v24 > 0xF)
      *(_OWORD *)(v20 + 5) = *(_OWORD *)(v14 + 16 * v24);
    else
      _os_assumes_log(0);
  }
  v26 = _os_trace_calloc(1, 24);
  *(_QWORD *)v26 = 16;
  *(_BYTE *)(v26 + 8) = 2;
  *(_QWORD *)(v26 + 16) = _os_trace_calloc(16, 8);
  v20[7] = (unsigned int *)v26;
  v27 = _os_trace_calloc(1, 24);
  *(_QWORD *)v27 = 16;
  *(_BYTE *)(v27 + 8) = 1;
  *(_QWORD *)(v27 + 16) = _os_trace_calloc(16, 8);
  v20[8] = (unsigned int *)v27;
  v28 = *(unsigned __int8 *)(a1 + 56);
  if (*(_BYTE *)(a1 + 56))
  {
    printf("[%03u]\n\t%10s : %llu@%u\n\t%10s : %d\n\t%10s : %u\n\t%10s : %u\n\t%10s : %x\n", a2, "proc id", v20[1], *((_DWORD *)v20 + 4), "pid", *((_DWORD *)v20 + 1), "euid", *((_DWORD *)v20 + 5), "index", *(unsigned __int16 *)v20, "flags", *((unsigned __int16 *)v20 + 1));
    v28 = *(unsigned __int8 *)(a1 + 56);
    if (*(_BYTE *)(a1 + 56))
    {
      *(_QWORD *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
      *(_QWORD *)&v29 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v29 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)out = v29;
      *(_OWORD *)&out[16] = v29;
      uuid_unparse((const unsigned __int8 *)v20 + 24, out);
      if (*(_BYTE *)(a1 + 56))
        printf("\t%10s : %s\n", "main uuid", out);
      out[0] = 0;
      if (!uuid_is_null((const unsigned __int8 *)v20 + 40))
        uuid_unparse((const unsigned __int8 *)v20 + 40, out);
      v28 = *(unsigned __int8 *)(a1 + 56);
      if (*(_BYTE *)(a1 + 56))
      {
        printf("\t%10s : %s\n", "dsc uuid", out);
        v28 = *(unsigned __int8 *)(a1 + 56);
      }
    }
  }
  if (sub_1000200DC(a4, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), (uint64_t)v20, v28 != 0, *(_QWORD *)(a1 + 40))&& sub_1000202F8(a4, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), (uint64_t)v20, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40)))
  {
    if ((sub_10000D98C((float **)(*(_QWORD *)(a1 + 32) + 40), (uint64_t)v20[1], *((_DWORD *)v20 + 4), (uint64_t)v20) & 1) != 0)
      return 1;
    v30 = (const char *)_os_assert_log(0);
    _os_crash(v30);
    __break(1u);
  }
  sub_10000F3BC(v20);
  return 0;
}

uint64_t sub_10001F940(uint64_t a1, unint64_t a2, unsigned __int16 *a3, unsigned __int16 **a4)
{
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  int v29;
  __int128 v30;
  uuid_string_t out;

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  if (v8)
  {
    v9 = (_QWORD *)(v8 + 16);
    while (1)
    {
      v9 = (_QWORD *)*v9;
      if (!v9)
        break;
      if (v9[2] == *((_QWORD *)a3 + 1))
      {
        if (v9[4])
          return 1;
        break;
      }
    }
  }
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(_DWORD *)(v10 + 4);
  v12 = v10 + 40;
  v13 = v10 + 32;
  v14 = v11 == 17;
  if (v11 == 17)
    v15 = v10 + 40;
  else
    v15 = v10 + 32;
  v16 = *(unsigned __int16 *)(v10 + 16);
  v17 = v12 + v16;
  v18 = v13 + v16;
  if (v14)
    v19 = v17;
  else
    v19 = v18;
  v20 = _os_trace_calloc(1, 72);
  v21 = v20;
  v22 = *a3;
  v23 = v19 - v15;
  if (v23 >= 16 * v22 && v23 - 16 * v22 > 0xF)
    *(_OWORD *)(v20 + 24) = *(_OWORD *)(v15 + 16 * v22);
  else
    _os_assumes_log(0);
  v25 = a3[1];
  if (v23 >= 16 * v25 && v23 - 16 * v25 > 0xF)
    *(_OWORD *)(v21 + 40) = *(_OWORD *)(v15 + 16 * v25);
  else
    _os_assumes_log(0);
  *(_DWORD *)(v21 + 4) = *((_DWORD *)a3 + 1);
  *(_QWORD *)(v21 + 8) = *((_QWORD *)a3 + 1);
  if (a2 >= 0x10000)
    _os_assumes_log(0);
  *(_WORD *)v21 = a2;
  *(_WORD *)(v21 + 2) = 0x8000;
  v27 = _os_trace_calloc(1, 24);
  *(_QWORD *)v27 = 16;
  *(_BYTE *)(v27 + 8) = 2;
  *(_QWORD *)(v27 + 16) = _os_trace_calloc(16, 8);
  *(_QWORD *)(v21 + 56) = v27;
  v28 = _os_trace_calloc(1, 24);
  *(_QWORD *)v28 = 16;
  *(_BYTE *)(v28 + 8) = 1;
  *(_QWORD *)(v28 + 16) = _os_trace_calloc(16, 8);
  *(_QWORD *)(v21 + 64) = v28;
  v29 = *(unsigned __int8 *)(a1 + 56);
  if (*(_BYTE *)(a1 + 56))
  {
    printf("[%03u]\n\t%10s : %llu\n\t%10s : %u\n", (unsigned __int16)a2, "proc id", *(_QWORD *)(v21 + 8), "pid", *(_DWORD *)(v21 + 4));
    v29 = *(unsigned __int8 *)(a1 + 56);
    if (*(_BYTE *)(a1 + 56))
    {
      *(_QWORD *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
      *(_QWORD *)&v30 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v30 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)out = v30;
      *(_OWORD *)&out[16] = v30;
      uuid_unparse((const unsigned __int8 *)(v21 + 24), out);
      if (*(_BYTE *)(a1 + 56))
        printf("\t%10s : %s\n", "main uuid", out);
      uuid_unparse((const unsigned __int8 *)(v21 + 40), out);
      v29 = *(unsigned __int8 *)(a1 + 56);
      if (*(_BYTE *)(a1 + 56))
      {
        printf("\t%10s : %s\n", "dsc uuid", out);
        v29 = *(unsigned __int8 *)(a1 + 56);
      }
    }
  }
  if ((sub_1000200DC(a4, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), v21, v29 != 0, *(_QWORD *)(a1 + 40)) & 1) != 0
    && (sub_1000202F8(a4, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), v21, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40)) & 1) != 0)
  {
    if ((sub_10000D98C((float **)(*(_QWORD *)(a1 + 32) + 40), *(_QWORD *)(v21 + 8), *(_DWORD *)(v21 + 16), v21) & 1) == 0)
      _os_assumes_log(0);
    return 1;
  }
  else
  {
    sub_10000F3BC((unsigned int **)v21);
    return 0;
  }
}

BOOL sub_10001FC40(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  unint64_t v5;
  BOOL v6;
  _BOOL8 result;
  _BOOL4 v8;
  void **v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, unsigned __int16, uint64_t *, unint64_t *);
  void *v12;
  uint64_t v13;
  unint64_t v14;
  char v15;

  v4 = *(_QWORD *)(a3 + 8) + a3 + 16;
  if (*(_DWORD *)(a3 + 4) != 17)
  {
    v9 = _NSConcreteStackBlock;
    v10 = 0x40000000;
    v11 = sub_100020000;
    v12 = &unk_10002A5A0;
    v15 = 0;
    v13 = a2;
    v14 = v4;
    v8 = sub_10001EFB8(a1, v4, 0x20uLL, (uint64_t)&v9);
    result = 0;
    if (!v8)
      return result;
    return *a1 <= v4;
  }
  v5 = *(unsigned __int16 *)(a3 + 24);
  v9 = _NSConcreteStackBlock;
  v10 = 0x40000000;
  v11 = sub_10001FD64;
  v12 = &unk_10002A580;
  v15 = 0;
  v13 = a2;
  v14 = v4;
  v6 = sub_10001EF10(a1, v4, 0x18uLL, v5, (uint64_t)&v9);
  result = 0;
  if (v6)
    return *a1 <= v4;
  return result;
}

uint64_t sub_10001FD64(uint64_t a1, unsigned __int16 a2, uint64_t *a3, unint64_t *a4)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  unsigned __int16 *v13;
  _BOOL4 v14;
  unint64_t v15;
  uint64_t result;
  int v17;
  unsigned __int16 *v18;
  unint64_t v20;
  int v21;
  unsigned __int16 *v22;
  int v23;
  unsigned __int16 *v24;
  unint64_t v26;

  v8 = sub_10000CB1C(*(_QWORD *)(a1 + 32));
  v9 = *a3;
  v10 = a3[1];
  v8[2] = *a3;
  v8[3] = v10;
  v11 = *((_DWORD *)a3 + 4);
  v12 = *((_DWORD *)a3 + 5);
  *((_DWORD *)v8 + 8) = v11;
  *((_DWORD *)v8 + 9) = v12;
  v13 = (unsigned __int16 *)(a3 + 3);
  *a4 = (unint64_t)(a3 + 3);
  if (*(_BYTE *)(a1 + 48))
  {
    printf("[%03u]\n\t%10s : %llu\n\t%10s : %llu\n\t%10s : %u\n\t%10s : %u\n", a2, "startts", v9, "endts", v10, "uncomp sz", v11, "comp algo", v12);
    v14 = *(_BYTE *)(a1 + 48) != 0;
    v13 = (unsigned __int16 *)*a4;
  }
  else
  {
    v14 = 0;
  }
  v15 = *(_QWORD *)(a1 + 40);
  if (v15)
  {
    result = 0;
    if (v15 < (unint64_t)v13 || v15 - (unint64_t)v13 < 4)
      return result;
  }
  *a4 = (unint64_t)(v13 + 2);
  if (!v13)
    return 0;
  if (v14)
    printf("\t\t%10s : %u\n\t\t%10s : ", "procinfos", *(_DWORD *)v13, "indexes");
  if (*(_DWORD *)v13)
  {
    v17 = 0;
    do
    {
      v18 = (unsigned __int16 *)*a4;
      if (v15)
      {
        if (v15 < (unint64_t)v18 || v15 - (unint64_t)v18 < 2)
          return 0;
      }
      *a4 = (unint64_t)(v18 + 1);
      if (!v18)
        return 0;
      if (v8)
        sub_10000C928((unsigned int *)v8[6], v18, 0);
      if (v14)
        printf("%u,", *v18);
    }
    while (++v17 < *(_DWORD *)v13);
  }
  if (v14)
    putchar(10);
  v20 = *(_QWORD *)(a1 + 40);
  v21 = *(unsigned __int8 *)(a1 + 48);
  v22 = (unsigned __int16 *)*a4;
  if (v20)
  {
    result = 0;
    if (v20 < (unint64_t)v22 || v20 - (unint64_t)v22 < 4)
      return result;
  }
  *a4 = (unint64_t)(v22 + 2);
  if (!v22)
    return 0;
  if (v21)
    printf("\t\t%10s : %u\n\t\t%10s : ", "subcats", *(_DWORD *)v22, "offsets");
  if (*(_DWORD *)v22)
  {
    v23 = 0;
    do
    {
      v24 = (unsigned __int16 *)*a4;
      if (v20)
      {
        if (v20 < (unint64_t)v24 || v20 - (unint64_t)v24 < 2)
          return 0;
      }
      *a4 = (unint64_t)(v24 + 1);
      if (!v24)
        return 0;
      if (v8)
        sub_10000C928((unsigned int *)v8[5], v24, 0);
      if (v21)
        printf("%u,", *v24);
    }
    while (++v23 < *(_DWORD *)v22);
  }
  if (v21)
    putchar(10);
  v26 = *a4;
  if ((*a4 & 7) != 0)
    v26 = (*a4 & 0xFFFFFFFFFFFFFFF8) + 8;
  *a4 = v26;
  return 1;
}

uint64_t sub_100020000(uint64_t a1, unsigned __int16 a2, uint64_t *a3, unint64_t *a4)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  BOOL v15;
  unint64_t v17;

  v8 = sub_10000CB1C(*(_QWORD *)(a1 + 32));
  v9 = *a3;
  v10 = a3[1];
  v8[2] = *a3;
  v8[3] = v10;
  if (*(_BYTE *)(a1 + 48))
    printf("[%03u]\n\t%10s : %llu\n\t%10s : %llu\n\t%10s : %u\n\t%10s : %u\n", a2, "startts", v9, "endts", v10, "log cnt", *((_DWORD *)a3 + 4), "others cnt", *((_DWORD *)a3 + 5));
  v11 = (unint64_t)a3 + 26;
  *a4 = (unint64_t)a3 + 26;
  v12 = *(_QWORD *)(a1 + 40);
  v13 = *((unsigned __int16 *)a3 + 12);
  if (v12)
  {
    v15 = v12 >= v11;
    v14 = v12 - v11;
    v15 = v15 && v14 >= v13;
    if (!v15)
      return 0;
  }
  v17 = v11 + v13;
  if ((v17 & 7) != 0)
    v17 = (v17 & 0xFFFFFFFFFFFFFFF8) + 8;
  *a4 = v17;
  return 1;
}

uint64_t sub_1000200DC(_QWORD *a1, unint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6)
{
  _QWORD *v11;
  int v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v23;
  unsigned __int8 *v24;
  unint64_t v25;
  __int128 v27;
  unint64_t v29;
  uint64_t v30;
  uuid_string_t out;

  v11 = (_QWORD *)*a1;
  if (a2)
  {
    if (a2 < (unint64_t)v11 || a2 - (unint64_t)v11 < 8)
      return 0;
  }
  *a1 = v11 + 1;
  if (!v11)
    return 0;
  v13 = *(_DWORD *)(a6 + 4);
  v14 = v13 == 17;
  if (v13 == 17)
    v15 = a6 + 40;
  else
    v15 = a6 + 32;
  v16 = *(unsigned __int16 *)(a6 + 16);
  v17 = a6 + 40 + v16;
  v18 = a6 + 32 + v16;
  if (v14)
    v19 = v17;
  else
    v19 = v18;
  if (a5)
    printf("\t%10s : %llu\n", "uuidinfos", *v11);
  if (*v11)
  {
    v20 = 0;
    v29 = v19 - v15;
    while (1)
    {
      v21 = (_QWORD *)*a1;
      if (a2)
      {
        if (a2 < (unint64_t)v21 || a2 - (unint64_t)v21 < 0x10)
          break;
      }
      *a1 = v21 + 2;
      if (!v21)
        break;
      v30 = v21[1] >> 16;
      if (!sub_10000C898(*(_QWORD *)(a4 + 56), (uint64_t)&v30))
      {
        v23 = _os_trace_calloc(1, 32);
        v24 = (unsigned __int8 *)v23;
        *(_QWORD *)v23 = v21[1] >> 16;
        *(_QWORD *)(v23 + 8) = *v21;
        v25 = 16 * (unsigned __int16)*((_DWORD *)v21 + 2);
        if (v29 >= v25 && v29 - v25 > 0xF)
          *(_OWORD *)(v23 + 16) = *(_OWORD *)(v15 + 16 * (unsigned __int16)*((_DWORD *)v21 + 2));
        else
          _os_assumes_log(0);
        sub_10000C928(*(unsigned int **)(a4 + 56), v24, (uint64_t)v24);
        ++*(_QWORD *)(a3 + 48);
        if (a5)
        {
          *(_QWORD *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
          *(_QWORD *)&v27 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v27 + 1) = 0xAAAAAAAAAAAAAAAALL;
          *(_OWORD *)out = v27;
          *(_OWORD *)&out[16] = v27;
          uuid_unparse(v24 + 16, out);
          printf("\t\t<%10s : 0x%llx, %10s : %10llu, %10s : %s>\n", "load addr", *(_QWORD *)v24, "size", *((_QWORD *)v24 + 1), "uuid", out);
        }
      }
      if ((unint64_t)++v20 >= *v11)
        return 1;
    }
    return 0;
  }
  return 1;
}

uint64_t sub_1000202F8(unsigned __int16 **a1, unint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6)
{
  int v7;
  unsigned __int16 **v11;
  unsigned __int16 *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unsigned __int16 *v18;
  _QWORD *v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unsigned __int16 *v26;
  unint64_t v28;
  unint64_t v29;
  char *v30;
  _QWORD *v31;
  _QWORD *v32;
  unint64_t v33;
  unsigned __int16 **v35;
  int v36;
  uint64_t v37;
  uint64_t v38;

  v7 = a5;
  v11 = a1;
  v12 = *a1;
  if (*(_DWORD *)(a6 + 4) != 17)
  {
    if (!a2 || (a2 >= (unint64_t)v12 ? (v21 = a2 - (unint64_t)v12 >= 8) : (v21 = 0), v21))
    {
      *a1 = v12 + 4;
      if (v12)
      {
        v22 = *(unsigned __int16 *)(a6 + 16);
        v23 = *(unsigned __int16 *)(a6 + 18);
        if (a5)
          printf("\t%10s : %llu\n", "subsystems", *(_QWORD *)v12);
        if (*(_QWORD *)v12)
        {
          v24 = 0;
          v38 = a6 + 24 + v22 + 8;
          v25 = v23 - (v22 + 8);
          v36 = v7;
          while (1)
          {
            v26 = *v11;
            if (a2)
            {
              if (a2 < (unint64_t)v26 || a2 - (unint64_t)v26 < 4)
                return 0;
            }
            *v11 = v26 + 2;
            if (!v26)
              return 0;
            if (v7)
              printf("\t\t<%10s : %3u, %10s : %5hu>\n", "id", *v26, "offset", v26[1]);
            v28 = v26[1];
            if (v25 < v28)
            {
LABEL_59:
              _os_assumes_log(0);
              return 0;
            }
            if (!sub_10000C898(*(_QWORD *)(a4 + 64), (uint64_t)v26))
            {
              v29 = v25;
              v30 = (char *)(v38 + v28);
              v31 = (_QWORD *)_os_trace_calloc(1, 24);
              *(_WORD *)v31 = *v26;
              v31[1] = sub_10000CD1C(*(_QWORD **)(a3 + 24), v30 + 2);
              v32 = sub_10000CD1C(*(_QWORD **)(a3 + 24), &v30[*v30 + 2]);
              v31[2] = v32;
              if (!v32 || !v31[1])
                _os_assumes_log(0);
              sub_10000C928(*(unsigned int **)(a4 + 64), v31, (uint64_t)v31);
              ++*(_QWORD *)(a3 + 56);
              v25 = v29;
              v7 = v36;
            }
            if ((unint64_t)++v24 >= *(_QWORD *)v12)
              goto LABEL_56;
          }
        }
        goto LABEL_56;
      }
    }
    return 0;
  }
  if (a2)
  {
    if (a2 < (unint64_t)v12 || a2 - (unint64_t)v12 < 8)
      return 0;
  }
  *a1 = v12 + 4;
  if (!v12)
    return 0;
  v14 = *(unsigned __int16 *)(a6 + 16);
  v15 = *(unsigned __int16 *)(a6 + 18);
  if (a5)
    printf("\t%10s : %llu\n", "subsystems", *(_QWORD *)v12);
  if (*(_QWORD *)v12)
  {
    v16 = 0;
    v37 = a6 + 40 + v14;
    v17 = v15 - v14;
    v35 = v11;
    do
    {
      v18 = *v11;
      if (a2)
      {
        if (a2 < (unint64_t)v18 || a2 - (unint64_t)v18 < 6)
          return 0;
      }
      *v11 = v18 + 3;
      if (!v18)
        return 0;
      if (v7)
        printf("\t\t<%10s : %3u, %10s : %5hu, %10s : %5hu>\n", "id", *v18, "subsystem", v18[1], "category", v18[2]);
      if (v17 < v18[1] || v17 < v18[2])
        goto LABEL_59;
      if (!sub_10000C898(*(_QWORD *)(a4 + 64), (uint64_t)v18))
      {
        v20 = (_QWORD *)_os_trace_calloc(1, 24);
        *(_WORD *)v20 = *v18;
        v20[1] = sub_10000CD1C(*(_QWORD **)(a3 + 24), (char *)(v37 + v18[1]));
        v11 = v35;
        v20[2] = sub_10000CD1C(*(_QWORD **)(a3 + 24), (char *)(v37 + v18[2]));
        sub_10000C928(*(unsigned int **)(a4 + 64), v20, (uint64_t)v20);
        ++*(_QWORD *)(a3 + 56);
      }
    }
    while ((unint64_t)++v16 < *(_QWORD *)v12);
  }
LABEL_56:
  v33 = (unint64_t)*v11;
  if (((unint64_t)*v11 & 7) != 0)
    v33 = ((unint64_t)*v11 & 0xFFFFFFFFFFFFFFF8) + 8;
  *v11 = (unsigned __int16 *)v33;
  return 1;
}

BOOL sub_100020698(id a1, unint64_t a2, const void *a3, char **a4)
{
  return 1;
}

uint64_t sub_1000206A0(uint64_t a1, unsigned __int8 *uu)
{
  __int128 v3;
  uuid_string_t out;

  *(_QWORD *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)out = v3;
  *(_OWORD *)&out[16] = v3;
  uuid_unparse(uu, out);
  return printf("[%03llu] %s\n", a1, out);
}

void sub_100020724()
{
  abort();
}

_QWORD *sub_100020730(_QWORD *a1, char *__s)
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

unint64_t sub_1000207DC(uint64_t *a1, unint64_t a2)
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
    v42 = v36 + a2 + v35 + v32;
    v43 = v42 + v33;
    v44 = __ROR8__(v42, 44) + v36 + a2 + __ROR8__(v33 + v36 + a2 - 0x622015F714C7D297 * (v40 ^ (v40 >> 47)), 21);
    v45 = v35 + v37 + *(uint64_t *)((char *)a1 + a2 - 32) - 0x4B6D499041670D8DLL;
    v46 = v45 + v34 + v37;
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
      v48 = v67 + v58 + v56 + v57;
      v49 = __ROR8__(v67 + v58 + v56, 44) + v67 + __ROR8__(v39 + v60 + v67 + v57, 21);
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
    v30 = 0x9DDFEA08EB382D69 * (v29 ^ (v28 - 0x3C5A37A36834CED9 * *(uint64_t *)((char *)a1 + a2 - 16)));
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

BOOL sub_100020C10(unsigned __int8 *a1, unsigned __int8 *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  int v10;
  BOOL v12;
  BOOL v13;
  _BOOL8 v14;

  v2 = a1[23];
  if ((v2 & 0x80u) == 0)
    v3 = a1[23];
  else
    v3 = *((_QWORD *)a1 + 1);
  v4 = a2[23];
  v5 = (char)v4;
  if ((v4 & 0x80u) != 0)
    v4 = *((_QWORD *)a2 + 1);
  if (v3 != v4)
    return 0;
  if (v5 < 0)
    a2 = *(unsigned __int8 **)a2;
  if ((v2 & 0x80) != 0)
    return memcmp(*(const void **)a1, a2, *((_QWORD *)a1 + 1)) == 0;
  if (!a1[23])
    return 1;
  v6 = v2 - 1;
  do
  {
    v8 = *a1++;
    v7 = v8;
    v10 = *a2++;
    v9 = v10;
    v12 = v6-- != 0;
    v13 = v7 == v9;
    v14 = v7 == v9;
  }
  while (v13 && v12);
  return v14;
}

void sub_100020CB0(id a1)
{
  qword_10003A998 = (uint64_t)"/private/var/db/diagnostics";
  qword_10003A9A0 = (uint64_t)"/private/var/db/diagnostics/timesync";
  qword_10003A9A8 = (uint64_t)"/private/var/db/uuidtext";
}

uint64_t sub_100020CF4(uint64_t a1, unsigned __int8 *src)
{
  _QWORD *v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (*(_DWORD *)src == 4096 && *((_QWORD *)src + 1) >= 0xA8uLL)
  {
    v3 = *(_QWORD **)(a1 + 32);
    if (*(_QWORD *)((char *)v3 + 4) != *((_QWORD *)src + 18) || *(_QWORD *)((char *)v3 + 12) != *((_QWORD *)src + 19))
    {
      v4 = v3[4];
      v5 = v3[5];
      v6 = v3[3];
      if (v4 >= v5)
      {
        v7 = 2 * v5;
        v6 = _os_trace_realloc(v6, v5 << 7);
        v3[3] = v6;
        v3[5] = v7;
        v4 = v3[4];
      }
      v3[4] = v4 + 1;
      v8 = v6 + (v4 << 6);
      v9 = *((_QWORD *)src + 4);
      v10 = *((_DWORD *)src + 10);
      v11 = *((_QWORD *)src + 2);
      v12 = *((_QWORD *)src + 8);
      v13 = *(_QWORD *)(src + 44);
      *(_QWORD *)v8 = 0;
      *(_QWORD *)(v8 + 8) = 0;
      *(_QWORD *)(v8 + 16) = 0;
      *(_QWORD *)(v8 + 24) = v9;
      *(_DWORD *)(v8 + 32) = v10;
      *(_QWORD *)(v8 + 40) = v13;
      *(_QWORD *)(v8 + 48) = v11;
      *(_QWORD *)(v8 + 56) = v12;
      uuid_copy((unsigned __int8 *)(v3[3] + (v4 << 6) + 8), src + 144);
    }
  }
  return 1;
}

int sub_100020DCC(id a1, const void *a2, const void *a3)
{
  unint64_t v3;
  unint64_t v4;
  BOOL v5;
  int v6;

  if (*(_QWORD *)a2 == *(_QWORD *)a3)
  {
    v3 = *((_QWORD *)a2 + 7);
    v4 = *((_QWORD *)a3 + 7);
    v5 = v3 == v4;
    if (v3 < v4)
      v6 = -1;
    else
      v6 = 1;
    if (v5)
      return 0;
    else
      return v6;
  }
  else if (*(_QWORD *)a2 < *(_QWORD *)a3)
  {
    return -1;
  }
  else
  {
    return 1;
  }
}

int sub_100020E04(id a1, const void *a2, const void *a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  BOOL v7;
  int v8;

  v3 = *((_QWORD *)a2 + 3);
  v4 = *((_QWORD *)a3 + 3);
  if (v3 == v4)
  {
    v5 = *((_DWORD *)a2 + 8);
    v6 = *((_DWORD *)a3 + 8);
    v7 = v5 == v6;
    if (v5 < v6)
      v8 = -1;
    else
      v8 = 1;
    if (v7)
      return 0;
    else
      return v8;
  }
  else if (v3 < v4)
  {
    return -1;
  }
  else
  {
    return 1;
  }
}

uint64_t sub_100020E3C(int a1, _QWORD *a2, _QWORD *a3, int a4)
{
  _QWORD *v6;
  int v7;
  int v8;
  DIR *v9;
  DIR *v10;
  dirent *v11;
  dirent *v12;
  int d_type;
  uint64_t v14;
  char *d_name;
  uint64_t v16;
  char *v17;
  char v18;
  int *v19;
  int v20;
  uint64_t v21;
  uint64_t result;
  int *v23;
  int v24;
  _QWORD v25[4];
  int v26;
  _QWORD v27[2];
  uint64_t (*v28)(_QWORD *, char *);
  void *v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  int v44;

  v6 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x2000000000;
  v44 = 0;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2000000000;
  v40 = -1;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2000000000;
  v28 = sub_1000216F8;
  v29 = &unk_10002A7B8;
  v36 = 0;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 0x40000000;
  v30 = &v41;
  v31 = &v37;
  v32 = &v33;
  if (a4)
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 0x40000000;
    v25[2] = sub_10002176C;
    v25[3] = &unk_10002A7D8;
    v26 = a1;
    v6 = v25;
  }
  v7 = dup(a1);
  if (v7 == -1)
  {
LABEL_27:
    v19 = __error();
    _os_assumes_log(*v19);
    goto LABEL_30;
  }
  v8 = v7;
  if (lseek(v7, 0, 0) == -1)
  {
    v23 = __error();
    _os_assumes_log(*v23);
  }
  v9 = fdopendir(v8);
  if (v9)
  {
    v10 = v9;
    while (1)
    {
LABEL_8:
      v11 = readdir(v10);
      if (!v11)
        break;
      v12 = v11;
      d_type = v11->d_type;
      if ((d_type | 8) == 8)
      {
        v14 = 0;
        d_name = v11->d_name;
        while ((d_name[v14] & 0x80000000) == 0
             && (_DefaultRuneLocale.__runetype[d_name[v14]] & 0x10000) != 0)
        {
          if (++v14 == 16)
          {
            if (strcmp(&v11->d_name[16], ".timesync"))
              break;
            v18 = v28(v27, d_name);
            goto LABEL_25;
          }
        }
      }
      if (v6 && d_type == 8)
      {
        v16 = 0;
        v17 = v12->d_name;
        while ((v17[v16] & 0x80000000) == 0
             && (_DefaultRuneLocale.__runetype[v17[v16]] & 0x10000) != 0)
        {
          if (++v16 == 16)
          {
            if (!strcmp(&v12->d_name[16], ".timesync"))
              goto LABEL_8;
            break;
          }
        }
        if (strcmp(v12->d_name, ".migrated"))
        {
          v18 = ((uint64_t (*)(_QWORD *, char *))v6[2])(v6, v17);
LABEL_25:
          if ((v18 & 1) == 0)
            break;
        }
      }
    }
    if (closedir(v10) != -1)
      goto LABEL_30;
    goto LABEL_27;
  }
  v20 = *__error();
  if (close(v8) == -1)
  {
    v24 = *__error();
    result = *__error();
    if (v24 == 9)
    {
      qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
      qword_10002DF78 = result;
      __break(1u);
      return result;
    }
    _os_assumes_log(result);
  }
  *__error() = v20;
LABEL_30:
  v21 = *((unsigned int *)v42 + 6);
  if ((int)v21 >= 1)
  {
    *a2 = v38[3];
    *a3 = v34[3];
  }
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);
  return v21;
}

int *sub_100021154(int *result)
{
  int *v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  int v6;
  int v7;
  timespec v8;
  int v9;
  int *v10;
  int v11;
  uint64_t v12;
  int *v13;
  int v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  stat v18;
  char __str[8];
  _QWORD v20[3];

  if (*((_QWORD *)result + 13) - *((_QWORD *)result + 12) <= (unint64_t)result[34])
    return result;
  v1 = result;
  v16 = 0xAAAAAAAAAAAAAAAALL;
  v17 = 0xAAAAAAAAAAAAAAAALL;
  result = (int *)_os_trace_get_times_now(&v17, &v16, 0);
  v2 = v16 / 0x3B9ACA00;
  v16 /= 0x3B9ACA00uLL;
  v3 = *((_QWORD *)v1 + 12);
  v4 = *((_QWORD *)v1 + 13) - v1[34];
  if (v3 >= v4)
  {
LABEL_21:
    v3 = v4;
    goto LABEL_22;
  }
  v5 = v2 - *((_QWORD *)v1 + 18);
  while (1)
  {
    memset(v20, 170, 18);
    *(_QWORD *)__str = 0xAAAAAAAAAAAAAAAALL;
    snprintf(__str, 0x1AuLL, "%016llx.timesync", v3);
    v6 = openat(*v1, __str, 0);
    if (v6 == -1)
      goto LABEL_27;
    v7 = v6;
    v8.tv_sec = 0xAAAAAAAAAAAAAAAALL;
    v8.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
    *(timespec *)&v18.st_blksize = v8;
    *(timespec *)v18.st_qspare = v8;
    v18.st_birthtimespec = v8;
    *(timespec *)&v18.st_size = v8;
    v18.st_mtimespec = v8;
    v18.st_ctimespec = v8;
    *(timespec *)&v18.st_uid = v8;
    v18.st_atimespec = v8;
    *(timespec *)&v18.st_dev = v8;
    v9 = fstat(v6, &v18);
    if (v9)
    {
      if (v9 == -1)
      {
        v10 = __error();
        _os_assumes_log(*v10);
      }
      goto LABEL_9;
    }
    if (v18.st_mtimespec.tv_sec > v5)
      break;
LABEL_9:
    if (close(v7) == -1)
    {
      v11 = *__error();
      v12 = *__error();
      if (v11 == 9)
      {
        qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
        qword_10002DF78 = v12;
        __break(1u);
      }
      _os_assumes_log(v12);
    }
    result = (int *)unlinkat(*v1, __str, 0);
    if ((_DWORD)result == -1)
    {
      v13 = __error();
      result = (int *)_os_assumes_log(*v13);
    }
    if (v3 == 2)
    {
      snprintf(__str, 0x1AuLL, "%016llx.timesync", 1);
      result = (int *)unlinkat(*v1, __str, 0);
      if ((_DWORD)result == -1)
      {
        result = __error();
        if (*result != 2)
        {
          result = (int *)*__error();
          if ((_DWORD)result)
            result = (int *)_os_assumes_log(result);
        }
      }
    }
    if (++v3 >= v4)
      goto LABEL_21;
  }
  result = (int *)close(v7);
  if ((_DWORD)result != -1)
    goto LABEL_22;
  v14 = *__error();
  v15 = *__error();
  if (v14 == 9)
  {
    qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_10002DF78 = v15;
    __break(1u);
LABEL_27:
    v15 = *__error();
  }
  result = (int *)_os_assumes_log(v15);
LABEL_22:
  *((_QWORD *)v1 + 12) = v3;
  return result;
}

uint64_t sub_100021410(uint64_t a1)
{
  int v2;
  uint64_t result;
  uint64_t v4;
  char __str[8];
  _QWORD v6[3];

  memset(v6, 170, 18);
  v4 = *(_QWORD *)(a1 + 104);
  *(_QWORD *)__str = 0xAAAAAAAAAAAAAAAALL;
  snprintf(__str, 0x1AuLL, "%016llx.timesync", v4);
  v2 = openat(*(_DWORD *)a1, __str, 16779785, 420);
  *(_DWORD *)(a1 + 112) = v2;
  if (v2 < 0)
    return 0xFFFFFFFFLL;
  result = 0;
  *(_QWORD *)(a1 + 120) = 0;
  ++*(_QWORD *)(a1 + 104);
  return result;
}

void sub_1000214C8(uint64_t a1)
{
  qword_10002DF48 = (uint64_t)"BUG IN LIBTRACE: Bad timesync db entry, file rotated";
  qword_10002DF78 = a1;
  __break(1u);
}

uint64_t sub_1000214F0(uint64_t a1, int a2)
{
  const char *boot_uuid;
  __int128 v5;
  unint64_t v6;
  uint64_t result;
  int *v8;
  int *v9;
  uint64_t v10;
  tm v11;
  size_t v12;
  time_t v13;
  uint64_t v14;
  tm *v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;

  v18 = 0u;
  v19 = 0u;
  v17 = 0u;
  LODWORD(v17) = 3193776;
  *(_QWORD *)&v11.tm_sec = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v11.tm_hour = 0xAAAAAAAAAAAAAAAALL;
  v13 = 0x1500000001;
  v12 = 16;
  if (sysctl((int *)&v13, 2u, &v11, &v12, 0, 0) < 0)
  {
    v10 = *__error();
    qword_10002DF48 = (uint64_t)"BUG IN LIBTRACE: Can't get boot time";
    qword_10002DF78 = v10;
    __break(1u);
  }
  *(_QWORD *)&v19 = 1000000000 * *(_QWORD *)&v11.tm_sec + 1000 * v11.tm_hour;
  boot_uuid = (const char *)_os_trace_get_boot_uuid();
  uuid_parse(boot_uuid, (unsigned __int8 *)&v17 + 8);
  mach_timebase_info((mach_timebase_info_t)&v18 + 1);
  v13 = time(0);
  v11.tm_zone = (char *)0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v11.tm_mon = v5;
  *(_OWORD *)&v11.tm_isdst = v5;
  *(_OWORD *)&v11.tm_sec = v5;
  localtime_r(&v13, &v11);
  v6 = ((unsigned __int128)(v11.tm_gmtoff * (__int128)0x7777777777777777) >> 64) - v11.tm_gmtoff;
  DWORD2(v19) = (v6 >> 5) + (v6 >> 63) + 60 * v11.tm_isdst;
  HIDWORD(v19) = v11.tm_isdst;
  memset(&v11.tm_hour, 0, 24);
  v11.tm_sec = 2126676;
  v11.tm_min = a2;
  _os_trace_get_times_now(&v11.tm_hour, &v11.tm_mon, &v11.tm_wday);
  v13 = (time_t)&v17;
  v14 = 48;
  v15 = &v11;
  v16 = 32;
  if (_os_trace_writev(*(unsigned int *)(a1 + 112), &v13, 2) == -1)
  {
    v8 = __error();
    _os_assumes_log(*v8);
    return 0xFFFFFFFFLL;
  }
  else
  {
    if (fsync(*(_DWORD *)(a1 + 112)) == -1)
    {
      v9 = __error();
      _os_assumes_log(*v9);
    }
    result = 0;
    *(_QWORD *)(a1 + 120) += v16 + v14;
  }
  return result;
}

uint64_t sub_1000216F8(_QWORD *a1, char *__str)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  ++*(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  v3 = strtoull(__str, 0, 16);
  v4 = *(_QWORD *)(a1[5] + 8);
  if (v3 < *(_QWORD *)(v4 + 24))
    *(_QWORD *)(v4 + 24) = v3;
  v5 = *(_QWORD *)(a1[6] + 8);
  if (v3 > *(_QWORD *)(v5 + 24))
    *(_QWORD *)(v5 + 24) = v3;
  return 1;
}

uint64_t sub_10002176C(uint64_t a1, const char *a2)
{
  int *v3;

  if (unlinkat(*(_DWORD *)(a1 + 32), a2, 0) == -1)
  {
    v3 = __error();
    _os_assumes_log(*v3);
  }
  return 1;
}

uint64_t sub_1000217A4(uint64_t a1, int a2)
{
  uint64_t result;
  uint64_t v5;
  int *v6;
  int v7;
  int *v8;
  int *v9;
  _DWORD v10[2];
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (*(_QWORD *)(a1 + 120) < *(_QWORD *)(a1 + 128))
  {
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v10[0] = 2126676;
    v10[1] = a2;
    _os_trace_get_times_now(&v11, &v12, &v13);
    if (_os_trace_write(*(unsigned int *)(a1 + 112), v10, 32) != -1)
    {
      if (fsync(*(_DWORD *)(a1 + 112)) == -1)
      {
        v8 = __error();
        _os_assumes_log(*v8);
      }
      result = 0;
      v5 = *(_QWORD *)(a1 + 120) + 32;
LABEL_6:
      *(_QWORD *)(a1 + 120) = v5;
      return result;
    }
    goto LABEL_16;
  }
  if (close(*(_DWORD *)(a1 + 112)) != -1)
  {
LABEL_8:
    sub_100021154((int *)a1);
    if ((sub_100021410(a1) & 0x80000000) != 0 || (sub_1000214F0(a1, a2) & 0x80000000) != 0)
      return 0xFFFFFFFFLL;
    if (!*(_WORD *)(a1 + 8))
      return 0;
    if (_os_trace_write(*(unsigned int *)(a1 + 112), a1 + 8, 88) != -1)
    {
      if (fsync(*(_DWORD *)(a1 + 112)) == -1)
      {
        v9 = __error();
        _os_assumes_log(*v9);
      }
      result = 0;
      v5 = *(_QWORD *)(a1 + 120) + 88;
      goto LABEL_6;
    }
LABEL_16:
    v6 = __error();
    _os_assumes_log(*v6);
    return 0xFFFFFFFFLL;
  }
  v7 = *__error();
  result = *__error();
  if (v7 != 9)
  {
    _os_assumes_log(result);
    goto LABEL_8;
  }
  qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_10002DF78 = result;
  __break(1u);
  return result;
}

uint64_t sub_100021964(uint64_t a1)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t result;
  char *v5;
  uint64_t v6;

  sub_100021A10(a1);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a1 + 8);
  while ((sub_100021A64((_QWORD *)a1) & 0x80000000) != 0)
  {
    v2 = *(_QWORD *)(a1 + 16);
    v3 = *(_QWORD *)(a1 + 24) + 1;
    *(_QWORD *)(a1 + 24) = v3;
    if (v3 > v2)
      return 0xFFFFFFFFLL;
  }
  sub_100021B78(a1);
  v6 = *(_QWORD *)(a1 + 32);
  v5 = sub_100021BDC(*(unsigned __int16 **)(a1 + 48), &v6);
  result = 0;
  *(_QWORD *)(a1 + 48) = v5;
  return result;
}

uint64_t sub_100021A10(uint64_t a1)
{
  uint64_t result;
  _QWORD *v3;
  int *v4;

  v3 = (_QWORD *)(a1 + 40);
  result = *(_QWORD *)(a1 + 40);
  if ((unint64_t)(result + 1) >= 2)
  {
    result = munmap((void *)result, *(_QWORD *)(a1 + 32));
    if ((_DWORD)result == -1)
    {
      v4 = __error();
      result = _os_assumes_log(*v4);
    }
    *v3 = 0;
    v3[1] = 0;
  }
  return result;
}

uint64_t sub_100021A64(_QWORD *a1)
{
  unsigned __int16 *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  char __str[8];
  _QWORD v8[3];

  memset(v8, 170, 18);
  v6 = a1[3];
  *(_QWORD *)__str = 0xAAAAAAAAAAAAAAAALL;
  snprintf(__str, 0x1AuLL, "%016llx.timesync", v6);
  v2 = (unsigned __int16 *)_os_trace_mmap_at(*(unsigned int *)a1, __str, 256, a1 + 4);
  a1[5] = v2;
  if (!v2)
  {
    v4 = *__error();
    if ((_DWORD)v4)
      _os_assumes_log(v4);
    return 0xFFFFFFFFLL;
  }
  if ((uint64_t)a1[4] < 80 || *v2 != 48048 || v2[1] != 48 || v2[24] != 29524 || v2[25] != 32)
  {
    sub_100021A10((uint64_t)a1);
    a1[5] = 0;
    return 0xFFFFFFFFLL;
  }
  v3 = 0;
  a1[6] = v2;
  return v3;
}

uint64_t sub_100021B78(uint64_t result)
{
  __int128 *v1;
  __int128 v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(__int128 **)(result + 48);
  if (*((_DWORD *)v1 + 6))
  {
    if (*((_DWORD *)v1 + 7))
    {
      v2 = *v1;
      v3 = v1[1];
      *(_OWORD *)(result + 88) = v1[2];
      *(_OWORD *)(result + 72) = v3;
      *(_OWORD *)(result + 56) = v2;
      *(_QWORD *)(result + 112) = 0;
      *(_OWORD *)(result + 120) = *(_OWORD *)(result + 88);
      return result;
    }
  }
  else
  {
    v4 = _os_assert_log(0);
    _os_crash(v4);
    __break(1u);
  }
  v5 = _os_assert_log(0);
  result = _os_crash(v5);
  __break(1u);
  return result;
}

char *sub_100021BDC(unsigned __int16 *a1, _QWORD *a2)
{
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;

  v2 = *a1;
  if (v2 > 0xBBAF)
  {
    if (v2 == 48048)
    {
      if (a1[1] != 48)
        goto LABEL_17;
      v3 = 48;
    }
    else
    {
      if (v2 != 57005)
        goto LABEL_17;
      v3 = a1[1];
    }
  }
  else
  {
    if (v2 != 27986)
    {
      if (v2 == 29524 && a1[1] == 32)
      {
        v3 = 32;
        goto LABEL_13;
      }
LABEL_17:
      _os_assumes_log(0);
      return 0;
    }
    if (a1[1] != 88)
      goto LABEL_17;
    v3 = 88;
  }
LABEL_13:
  v4 = *a2 - v3;
  *a2 = v4;
  v5 = (char *)a1 + v3;
  if (v4 >= 1)
    return v5;
  else
    return 0;
}

uint64_t sub_100021C94(uint64_t result)
{
  unsigned __int16 *v1;
  _QWORD *v2;
  unsigned __int16 *v3;
  __int128 v4;
  unint64_t v5;
  unint64_t v6;
  int v7;
  uint64_t v8;

  v1 = *(unsigned __int16 **)(result + 48);
  if (!v1)
    return result;
  v2 = (_QWORD *)result;
  if (*v1 == 48048)
  {
    sub_100021B78(result);
    v3 = (unsigned __int16 *)v2[6];
  }
  else
  {
    v4 = *(_OWORD *)v1;
    *(_OWORD *)(result + 120) = *((_OWORD *)v1 + 1);
    *(_OWORD *)(result + 104) = v4;
    v3 = v1;
  }
  v8 = v2[4] - (_QWORD)v3 + v2[5];
  while (1)
  {
    result = (uint64_t)sub_100021BDC(v1, &v8);
    v1 = (unsigned __int16 *)result;
    if (!result)
      break;
LABEL_10:
    v7 = *v1;
    if (v7 == 48048)
    {
      if (*((_QWORD *)v1 + 1) != v2[8] || *((_QWORD *)v1 + 2) != v2[9])
        goto LABEL_17;
    }
    else if (v7 == 29524)
    {
      goto LABEL_17;
    }
  }
  result = sub_100021A10((uint64_t)v2);
  v5 = v2[2];
  v6 = v2[3] + 1;
  v2[3] = v6;
  if (v6 <= v5)
  {
    result = sub_100021A64(v2);
    if ((result & 0x80000000) == 0)
    {
      v1 = (unsigned __int16 *)v2[6];
      v8 = v2[4];
      if (!v1)
        goto LABEL_17;
      goto LABEL_10;
    }
  }
  v1 = 0;
LABEL_17:
  v2[6] = v1;
  return result;
}

void sub_100021DCC()
{
  uint64_t v0;

  v0 = _os_trace_zalloc(24);
  *(_QWORD *)v0 = 0;
  *(_OWORD *)(v0 + 8) = xmmword_100024370;
  operator new();
}

BOOL sub_100022210(uint64_t a1, uint64_t a2, unint64_t a3)
{
  return *(_QWORD *)(a1 + 32) >= a3;
}

__n128 sub_100022220(uint64_t a1, __n128 *a2, uint64_t a3)
{
  __n128 result;

  result = *a2;
  *(__n128 *)(*(_QWORD *)(a1 + 32) + 16 * a3 + 8) = *a2;
  return result;
}

void sub_100022234(id a1)
{
  byte_10003A9C0 = MKBDeviceFormattedForContentProtection(a1) == 1;
}

void sub_100022258(id a1)
{
  int *v1;
  size_t v2;
  _BYTE __b[648];
  int v4[6];

  *(_OWORD *)v4 = xmmword_100024280;
  memset(__b, 170, sizeof(__b));
  v2 = 648;
  if (sysctl(v4, 4u, __b, &v2, 0, 0) == -1)
  {
    v1 = __error();
    _os_assumes_log(*v1);
  }
  byte_10003A9D0 = (__b[32] & 4) != 0;
}

void sub_100022310(id a1)
{
  uint64_t v1;
  int v2;

  v1 = getpid();
  v2 = SANDBOX_CHECK_NO_REPORT;
  if (qword_10003A9B0 != -1)
    dispatch_once(&qword_10003A9B0, &stru_10002A6F0);
  byte_10003A9E0 = sandbox_check(v1, "file-read-data", v2 | 1u) == 0;
}

uint64_t sub_10002239C()
{
  if (qword_10003A9E8 != -1)
    dispatch_once(&qword_10003A9E8, &stru_10002A918);
  return byte_10002DF3C;
}

void sub_1000223DC(id a1)
{
  size_t v1;
  char __b[1024];

  memset(__b, 170, sizeof(__b));
  v1 = 1024;
  byte_10002DF3C = sysctlbyname("kern.filesetuuid", __b, &v1, 0, 0) != 0;
  if (!sysctlbyname("kern.bootargs", __b, &v1, 0, 0))
  {
    if (strstr(__b, "libtrace_kic=0"))
      byte_10002DF3C = 0;
    if (strstr(__b, "libtrace_kic=1"))
      byte_10002DF3C = 1;
  }
}

void sub_1000224C0(unsigned __int8 *a1)
{
  __int128 v2;
  size_t v3;
  char in[16];
  _BYTE v5[21];

  *(_QWORD *)&v5[13] = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)in = v2;
  *(_OWORD *)v5 = v2;
  v3 = 37;
  if (sysctlbyname("kern.kernelcacheuuid", in, &v3, 0, 0))
  {
    uuid_copy(a1, byte_10003A809);
    a1[15] = ~a1[15];
  }
  else
  {
    uuid_parse(in, a1);
  }
}

uint64_t sub_100022574(uint64_t result, mach_port_t a2)
{
  *(_BYTE *)(result + 144) = 1;
  if (a2)
  {
    result = sub_10000FC28(a2, 0, -1, -1, 0);
    if ((_DWORD)result == -301)
    {
      qword_10002DF48 = (uint64_t)"MIG_REPLY_MISMATCH";
      qword_10002DF78 = -301;
      __break(1u);
    }
    if ((_DWORD)result)
      return _dispatch_bug(267, (int)result);
  }
  return result;
}

void sub_1000225EC(int a1)
{
  qword_10002DF48 = (uint64_t)"BUG IN LIBDISPATCH: Unable to open /dev/oslog";
  qword_10002DF78 = a1;
  __break(1u);
}

void sub_100022614(int a1)
{
  qword_10002DF48 = (uint64_t)"BUG IN LIBDISPATCH: Unable to map kernel buffer";
  qword_10002DF78 = a1;
  __break(1u);
}

void sub_10002263C(uint64_t a1)
{
  qword_10002DF48 = (uint64_t)"BUG IN LIBDISPATCH: Unexpected kernel buffer size";
  qword_10002DF78 = a1;
  __break(1u);
}

void sub_100022664(unsigned int a1)
{
  qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: firehose libdispatch version mismatch (20180226)";
  qword_10002DF78 = a1;
  __break(1u);
}

void sub_10002268C(unsigned int a1)
{
  qword_10002DF48 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: firehose server version mismatch (20180226)";
  qword_10002DF78 = a1;
  __break(1u);
}

void sub_1000226B4()
{
  qword_10002DF48 = (uint64_t)"MIG_REPLY_MISMATCH";
  qword_10002DF78 = -301;
  __break(1u);
}

void sub_1000226DC(uint64_t a1)
{
  qword_10002DF48 = (uint64_t)"BUG IN LIBDISPATCH: Invalid firehose server queue type";
  qword_10002DF78 = a1;
  __break(1u);
}

uint64_t sub_100022704(int a1, mach_vm_address_t *a2)
{
  _dispatch_bug(1353, a1);
  return mach_vm_deallocate(mach_task_self_, *a2, 0x40000uLL);
}

void sub_100022744(unsigned int a1)
{
  qword_10002DF48 = (uint64_t)"BUG IN LIBDISPATCH: Unknown recv-right";
  qword_10002DF78 = a1;
  __break(1u);
}

void sub_10002276C(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  qword_10002DF48 = (uint64_t)"BUG IN LIBDISPATCH: recv-right leak";
  qword_10002DF78 = allocator;
  __break(1u);
  CFArrayCreate(allocator, values, numValues, callBacks);
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDString");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_closeAndReturnError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "closeAndReturnError:");
}

id objc_msgSend_closeFile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "closeFile");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithJSONObject:options:error:");
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithPropertyList:format:options:error:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileSystemRepresentation");
}

id objc_msgSend_getCString_maxLength_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCString:maxLength:encoding:");
}

id objc_msgSend_initWithBytes_length_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBytes:length:encoding:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithFileDescriptor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFileDescriptor:");
}

id objc_msgSend_initWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithObjects:");
}

id objc_msgSend_initWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUTF8String:");
}

id objc_msgSend_initWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUnsignedLongLong:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isNSArray__(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isNSArray__");
}

id objc_msgSend_isNSDictionary__(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isNSDictionary__");
}

id objc_msgSend_isNSNumber__(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isNSNumber__");
}

id objc_msgSend_isNSString__(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isNSString__");
}

id objc_msgSend_isValidJSONObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isValidJSONObject:");
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longLongValue");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithLong:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_numberWithUnsignedLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLong:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "propertyListWithData:options:format:error:");
}

id objc_msgSend_readDataToEndOfFileAndReturnError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readDataToEndOfFileAndReturnError:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_synchronizeAndReturnError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synchronizeAndReturnError:");
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongLongValue");
}

id objc_msgSend_writeData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeData:error:");
}

