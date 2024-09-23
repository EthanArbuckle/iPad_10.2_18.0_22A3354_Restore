xpc_object_t xpc_string_create(const char *string)
{
  xpc_object_t result;
  xpc_object_t v2;
  size_t v3;

  result = _xpc_try_strdup(string);
  if (result)
  {
    v2 = result;
    v3 = strlen((const char *)result);
    return (xpc_object_t)_xpc_string_create((uint64_t)v2, v3);
  }
  return result;
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  uint64_t v3;
  mach_port_context_t v4;
  __int128 v5;
  _OWORD *self_audit_token;
  __int128 v7;
  int v8;

  v3 = _xpc_connection_create(name == 0, (char *)name);
  v4 = v3;
  if (name)
  {
    *(_QWORD *)&v5 = -1;
    *((_QWORD *)&v5 + 1) = -1;
    *(_OWORD *)(v3 + 120) = v5;
    *(_OWORD *)(v3 + 104) = v5;
    *(_DWORD *)(v3 + 124) = 0;
    *(_DWORD *)(v3 + 88) = 0;
  }
  else
  {
    *(_WORD *)(v3 + 224) |= 8u;
    self_audit_token = (_OWORD *)_xpc_get_self_audit_token();
    v7 = self_audit_token[1];
    *(_OWORD *)(v4 + 104) = *self_audit_token;
    *(_OWORD *)(v4 + 120) = v7;
    *(_DWORD *)(v4 + 88) = 0;
    v8 = _xpc_mach_port_allocate(0x203Bu, 0x10u, v4);
    *(_DWORD *)(v4 + 68) = v8;
    *(_DWORD *)(v4 + 76) = v8;
  }
  return (xpc_connection_t)v4;
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  __objc2_class *v1;
  BOOL v2;
  BOOL v3;

  if (((unint64_t)object & 0x8000000000000000) == 0)
  {
    v1 = *(__objc2_class **)object;
    if (*(_QWORD *)object >= (unint64_t)OS_xpc_object)
    {
      v2 = v1 >= OS_xpc_session;
      v3 = v1 == OS_xpc_session;
    }
    else
    {
      v2 = 1;
      v3 = 0;
    }
    if (!v3 && v2)
      return object;
    else
      return (xpc_object_t)_os_object_retain();
  }
  return object;
}

uint64_t xpc_pipe_simpleroutine(uint64_t a1, void *a2)
{
  return _xpc_pipe_simpleroutine(a1, 0, a2, 0, 0);
}

size_t xpc_hash(xpc_object_t object)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  int v7;
  int *extension_vtable;
  unint64_t v9;
  char *v13;

  if (((unint64_t)object & 0x8000000000000000) != 0)
  {
    v2 = 0;
    v3 = *MEMORY[0x1E0DE7C58];
    if ((~(unint64_t)object & 0xC000000000000007) == 0)
      v3 = 0;
    v4 = v3 ^ (unint64_t)object;
    do
    {
      if ((v4 & 7) == *(_BYTE *)(MEMORY[0x1E0DE7C48] + v2))
        break;
      ++v2;
    }
    while (v2 != 7);
    v5 = v2 | v4;
    v6 = v2 & 7;
    v7 = (v5 >> 55) + 8;
    if (v6 == 7)
      LODWORD(v6) = v7;
    if ((_DWORD)v6 == 12)
    {
      extension_vtable = &_OS_xpc_type_uint64;
    }
    else
    {
      if ((_DWORD)v6 != 13)
      {
        v13 = _xpc_asprintf("Object is not an XPC object");
        _xpc_api_misuse(v13);
      }
      extension_vtable = &_OS_xpc_type_int64;
    }
  }
  else
  {
    v9 = *(_QWORD *)object;
    if (*(_QWORD *)object >= (unint64_t)OS_xpc_object
      && v9 <= (unint64_t)OS_xpc_rich_error
      && (*(_QWORD *)object & 7) == 0)
    {
      extension_vtable = (int *)((char *)&_xpc_vtables + 2 * (v9 - (_QWORD)OS_xpc_object));
    }
    else
    {
      extension_vtable = _xpc_get_extension_vtable(object);
    }
  }
  return (*((uint64_t (**)(xpc_object_t))extension_vtable + 4))(object);
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
  NSObject *v4;
  __objc2_class **v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  _QWORD v9[6];
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  xpc_activity_t v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C874D8];
  if (_activity_log_pred != -1)
    dispatch_once(&_activity_log_pred, &__block_literal_global_9);
  v4 = _activity_log__log;
  v5 = &_xpc_activity_check_in;
  if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *((_QWORD *)activity + 3);
    v7 = "dict";
    *(_DWORD *)buf = 136446722;
    if (criteria == &_xpc_activity_check_in)
      v7 = "check-in";
    v11 = v6;
    v12 = 2048;
    v13 = activity;
    v14 = 2082;
    v15 = v7;
    _os_log_impl(&dword_1DEE85000, v4, OS_LOG_TYPE_DEFAULT, "xpc_activity_set_criteria: %{public}s (%p), %{public}s", buf, 0x20u);
  }
  if (criteria != &_xpc_activity_check_in)
  {
    v5 = (__objc2_class **)xpc_copy(criteria);
    _xpc_activity_normalize_critiera(v5);
  }
  xpc_retain(activity);
  v8 = *((_QWORD *)activity + 5);
  v9[0] = MEMORY[0x1E0C87450];
  v9[1] = 0x40000000;
  v9[2] = __xpc_activity_set_criteria_block_invoke;
  v9[3] = &__block_descriptor_tmp_74_0;
  v9[4] = activity;
  v9[5] = v5;
  dispatch_async(v8, v9);
}

void xpc_release(xpc_object_t object)
{
  __objc2_class *v1;
  BOOL v2;
  BOOL v3;

  if (((unint64_t)object & 0x8000000000000000) == 0)
  {
    v1 = *(__objc2_class **)object;
    if (*(_QWORD *)object >= (unint64_t)OS_xpc_object)
    {
      v2 = v1 >= OS_xpc_session;
      v3 = v1 == OS_xpc_session;
    }
    else
    {
      v2 = 1;
      v3 = 0;
    }
    if (!v3 && v2)
    {

    }
    else if (v1 == OS_xpc_session
           || v1 == OS_xpc_listener
           || v1 == OS_xpc_event_publisher
           || v1 == OS_xpc_connection
           || v1 == OS_xpc_service)
    {
      _os_object_release();
    }
    else
    {
      _os_object_release_without_xref_dispose();
    }
  }
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return xpc_activity_set_state_with_completion_status((uint64_t)activity, state, 0);
}

uint64_t _xpc_mach_message_request_init(uint64_t result, int a2, uint64_t a3, int a4, int a5)
{
  char v5;
  char v6;

  if (a4)
    v5 = 2;
  else
    v5 = 0;
  if (a5)
    v6 = 4;
  else
    v6 = 0;
  *(_DWORD *)result = a2;
  *(_DWORD *)(result + 4) = 0;
  *(_QWORD *)(result + 8) = a3;
  *(_BYTE *)(result + 16) = v6 | v5;
  return result;
}

uint64_t _xpc_message_request_get_transport(uint64_t a1)
{
  return *(_BYTE *)(a1 + 16) & 1;
}

uint64_t _xpc_message_request_get_voucher(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8);
}

uint64_t _xpc_message_request_extract_voucher(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = 0;
  return v1;
}

uint64_t _xpc_message_request_debug(_QWORD *a1, char *__str, size_t __size)
{
  return snprintf(__str, __size, ", transport = %d, dest port = 0x%x, dest msg id = 0x%llx, transaction = %d, voucher = %p", a1[2] & 1, *(_DWORD *)a1, *a1, (*((unsigned __int8 *)a1 + 16) >> 1) & 1, (const void *)a1[1]);
}

uint64_t _xpc_message_request_get_transaction(uint64_t a1)
{
  return (*(unsigned __int8 *)(a1 + 16) >> 1) & 1;
}

uint64_t _xpc_message_request_set_transaction(uint64_t result, int a2)
{
  char v2;

  if (a2)
    v2 = 2;
  else
    v2 = 0;
  *(_BYTE *)(result + 16) = *(_BYTE *)(result + 16) & 0xFD | v2;
  return result;
}

BOOL _xpc_message_request_expects_reply(_QWORD *a1)
{
  return *a1 != 0;
}

void _xpc_mach_message_request_handoff_reply(uint64_t a1, dispatch_queue_t queue, dispatch_block_t block)
{
  BOOL v3;

  if ((*(_BYTE *)(a1 + 16) & 1) != 0)
    _xpc_mach_message_request_handoff_reply_cold_1();
  if ((*(_BYTE *)(a1 + 16) & 4) == 0 || (*(_DWORD *)a1 ? (v3 = *(_DWORD *)a1 == -1) : (v3 = 1), v3))
    dispatch_async(queue, block);
  else
    dispatch_mach_handoff_reply();
}

void _xpc_mach_message_request_handoff_reply_f(uint64_t a1, dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  BOOL v4;

  if ((*(_BYTE *)(a1 + 16) & 1) != 0)
    _xpc_mach_message_request_handoff_reply_cold_1();
  if ((*(_BYTE *)(a1 + 16) & 4) == 0 || (*(_DWORD *)a1 ? (v4 = *(_DWORD *)a1 == -1) : (v4 = 1), v4))
    dispatch_async_f(queue, context, work);
  else
    dispatch_mach_handoff_reply_f();
}

uint64_t _xpc_mach_message_request_extract_reply_port(unsigned int *a1)
{
  uint64_t v1;

  if ((a1[4] & 1) != 0)
    _xpc_mach_message_request_handoff_reply_cold_1();
  v1 = *a1;
  *a1 = 0;
  return v1;
}

uint64_t _xpc_remote_message_request_get_reply_msg_id(_BYTE *a1)
{
  if ((a1[16] & 1) == 0)
    _xpc_mach_message_request_handoff_reply_cold_1();
  return *(_QWORD *)a1;
}

uint64_t _xpc_remote_message_request_set_reply_msg_id(uint64_t result, uint64_t a2)
{
  if ((*(_BYTE *)(result + 16) & 1) == 0)
    _xpc_mach_message_request_handoff_reply_cold_1();
  *(_QWORD *)result = a2;
  return result;
}

void _xpc_message_request_destroy(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = *a1;
  if (v3)
  {
    if ((a1[2] & 1) != 0)
    {
      if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 16) == -1)
        v5 = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 24);
      else
        v5 = _os_alloc_once();
      v6 = *(_QWORD *)(v5 + 200);
      if (v6)
        (*(void (**)(uint64_t, _QWORD))(v6 + 8))(a2, *a1);
    }
    else if (_xpc_mach_port_release(v3))
    {
      _os_assumes_log();
    }
  }
  v7 = (void *)a1[1];
  if (v7)
    os_release(v7);
  if ((a1[2] & 2) != 0)
    _xpc_transaction_end();
}

_OWORD *_xpc_mach_received_message_init(uint64_t a1, uint64_t a2, int a3, uint64_t a4, void *a5)
{
  int v7;
  BOOL v8;
  char v9;
  _OWORD *result;
  __int128 v11;

  v7 = *(_DWORD *)(a2 + 8);
  *(_DWORD *)(a2 + 8) = 0;
  v8 = *(_DWORD *)(a2 + 20) == 0x40000000;
  if (a3)
    v9 = 2;
  else
    v9 = 0;
  *(_DWORD *)a1 = v7;
  *(_DWORD *)(a1 + 4) = 0;
  *(_QWORD *)(a1 + 8) = a4;
  *(_BYTE *)(a1 + 16) = v9 | (4 * v8);
  result = (_OWORD *)_xpc_mach_msg_get_audit_token(a2);
  v11 = result[1];
  *(_OWORD *)(a1 + 32) = *result;
  *(_OWORD *)(a1 + 48) = v11;
  *(_QWORD *)(a1 + 24) = 0;
  if (a5)
    return (_OWORD *)_xpc_received_message_set_connection(a1, a5);
  return result;
}

uint64_t _xpc_received_message_set_connection(uint64_t a1, xpc_object_t object)
{
  uint64_t result;

  if (xpc_get_type(object) == (xpc_type_t)OS_xpc_connection)
    result = _xpc_retain_with_resurrect((uint64_t)object);
  else
    result = (uint64_t)xpc_retain(object);
  if (*(_QWORD *)(a1 + 24))
    _xpc_mach_message_request_handoff_reply_cold_1();
  *(_QWORD *)(a1 + 24) = object;
  return result;
}

uint64_t _xpc_remote_received_message_init(uint64_t result, int a2, uint64_t a3, xpc_object_t object)
{
  char v4;
  __int128 v5;

  if (a2)
    v4 = 3;
  else
    v4 = 1;
  *(_QWORD *)result = a3;
  *(_QWORD *)(result + 8) = 0;
  *(_BYTE *)(result + 16) = v4;
  *(_QWORD *)&v5 = -1;
  *((_QWORD *)&v5 + 1) = -1;
  *(_OWORD *)(result + 32) = v5;
  *(_OWORD *)(result + 48) = v5;
  *(_DWORD *)(result + 52) = 0;
  *(_QWORD *)(result + 24) = 0;
  if (object)
    return _xpc_received_message_set_connection(result, object);
  return result;
}

__n128 _xpc_received_message_move(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __n128 result;
  __int128 v4;

  v2 = *a2;
  *(_QWORD *)(a1 + 16) = *((_QWORD *)a2 + 2);
  *(_OWORD *)a1 = v2;
  *((_QWORD *)a2 + 1) = 0;
  *((_QWORD *)a2 + 2) = 0;
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a1 + 24) = *((_QWORD *)a2 + 3);
  *((_QWORD *)a2 + 3) = 0;
  result = (__n128)a2[2];
  v4 = a2[3];
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v4;
  return result;
}

void _xpc_received_message_destroy(uint64_t *a1)
{
  void *v2;

  _xpc_message_request_destroy(a1, a1[3]);
  v2 = (void *)a1[3];
  if (v2)
    xpc_release(v2);
}

__n128 _xpc_received_message_extract_request(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  a2[1].n128_u64[0] = a1[1].n128_u64[0];
  *a2 = result;
  a1->n128_u64[1] = 0;
  a1[1].n128_u64[0] = 0;
  a1->n128_u64[0] = 0;
  return result;
}

__n128 _xpc_received_message_get_audit_token(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)(a1 + 32);
  v3 = *(_OWORD *)(a1 + 48);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  return result;
}

uint64_t _xpc_received_message_get_connection(uint64_t a1)
{
  return *(_QWORD *)(a1 + 24);
}

uint64_t xpc_receive_mach_msg_validate_hdr(_DWORD *a1)
{
  unsigned int v1;
  unint64_t v2;

  HIDWORD(v2) = a1[5];
  LODWORD(v2) = HIDWORD(v2) - 0x10000000;
  v1 = v2 >> 28;
  if (v1 < 2)
    return !a1[2] || (*a1 & 0x1F) == 18;
  if (v1 == 2)
  {
    if (!a1[2])
      return 1;
  }
  else if (v1 == 3)
  {
    return !a1[2] || (*a1 & 0x1F) == 18;
  }
  return 0;
}

uint64_t xpc_receive_mach_msg(NSObject *a1, int a2, void *a3, _QWORD *a4, uint64_t *a5)
{
  mach_msg_header_t *msg;
  _BYTE *v11;
  void *v12;
  uint64_t distorter;
  unsigned int platform;
  uint64_t v15;
  uint64_t result;
  __int128 v17[4];

  msg = (mach_msg_header_t *)dispatch_mach_msg_get_msg();
  if ((xpc_receive_mach_msg_validate_hdr(msg) & 1) != 0)
  {
    _xpc_ktrace_pid1();
    memset(v17, 0, sizeof(v17));
    _xpc_mach_received_message_init((uint64_t)v17, (uint64_t)msg, a2, (uint64_t)a3, a4);
    v11 = _xpc_payload_create_from_mach_msg(a1, 1);
    if (v11)
    {
      v12 = v11;
      if (a4)
      {
        distorter = _xpc_connection_get_distorter(a4);
        _xpc_payload_distort((uint64_t)v12, distorter);
        platform = _xpc_connection_get_platform((uint64_t)a4);
      }
      else
      {
        platform = 0;
      }
      v15 = xpc_graph_unpack(v17, (uint64_t)v12, platform);
      os_release(v12);
      if (v15)
      {
        _xpc_ktrace_pid2();
        result = 0;
        *a5 = v15;
        return result;
      }
    }
    _xpc_received_message_destroy((uint64_t *)v17);
    _xpc_ktrace_pid2();
  }
  else
  {
    if (a2)
      _xpc_transaction_end();
    if (a3)
      os_release(a3);
    mach_msg_destroy(msg);
  }
  return 0xFFFFFFFFLL;
}

uint64_t xpc_receive_remote_msg(const void *a1, size_t a2, int a3, uint64_t a4, xpc_object_t object, uint64_t a6)
{
  id v9;
  void *v10;
  uint64_t v11;
  __int128 v13[4];

  memset(v13, 0, sizeof(v13));
  _xpc_remote_received_message_init((uint64_t)v13, a3, a4, object);
  v9 = _xpc_payload_create_from_data(a1, a2);
  if (!v9 || (v10 = v9, v11 = xpc_graph_unpack_with_ool(v13, (uint64_t)v9, a6), os_release(v10), !v11))
  {
    _xpc_received_message_destroy((uint64_t *)v13);
    return 0;
  }
  return v11;
}

uint64_t OUTLINED_FUNCTION_0()
{
  return _os_assert_log();
}

BOOL _xpc_graph_unpack_header(uint64_t a1, int a2)
{
  unint64_t v2;
  unint64_t v3;
  int *v4;
  BOOL v5;
  int v6;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = v2 - 4;
  if (v2 >= 4
    && ((v4 = *(int **)(a1 + 32), *(_QWORD *)(a1 + 32) = v4 + 1, *(_QWORD *)(a1 + 40) = v3, v4)
      ? (v5 = v3 >= 4)
      : (v5 = 0),
        v5 && (v6 = *v4, *(_QWORD *)(a1 + 32) = v4 + 2, *(_QWORD *)(a1 + 40) = v2 - 8, v6 == dword_1DEEBD120[a2])))
  {
    return v4[1] == 5;
  }
  else
  {
    return 0;
  }
}

uint64_t _xpc_graph_deserializer_read(uint64_t a1, unint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  BOOL v8;
  unint64_t v9;

  result = 0;
  v4 = a2 >= 0xFFFFFFFFFFFFFFFDLL;
  v5 = v4 << 63 >> 63;
  if (v5 == v4 && (v5 & 0x8000000000000000) == 0)
  {
    v6 = (a2 + 3) & 0xFFFFFFFFFFFFFFFCLL;
    v7 = *(_QWORD *)(a1 + 40);
    v8 = v7 >= v6;
    v9 = v7 - v6;
    if (v8)
    {
      result = *(_QWORD *)(a1 + 32);
      *(_QWORD *)(a1 + 32) = result + v6;
      *(_QWORD *)(a1 + 40) = v9;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t xpc_graph_unpack(__int128 *a1, uint64_t a2, unsigned int a3)
{
  if (a3 == 3)
    _xpc_mach_message_request_handoff_reply_cold_1();
  return _xpc_graph_unpack_impl(a1, a2, a3, 0);
}

uint64_t _xpc_graph_unpack_impl(__int128 *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t contiguous_bytes;
  unint64_t v9;
  _DWORD *v10;
  int v12;
  unsigned int v14;
  uint64_t (*v15)(__int128 *);
  __int128 v16;
  uint64_t v17;
  unint64_t v18;
  _DWORD *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;

  if (a3 >= 4)
    _xpc_mach_message_request_handoff_reply_cold_1();
  v23 = 0;
  contiguous_bytes = xpc_payload_get_contiguous_bytes(a2, &v23);
  v9 = v23;
  v16 = (unint64_t)a2;
  v17 = contiguous_bytes;
  v18 = v23;
  v19 = (_DWORD *)contiguous_bytes;
  v20 = v23;
  v21 = 0;
  v22 = 0;
  if (a4)
  {
    _xpc_graph_deserializer_set_ool_callback((uint64_t)&v16, a4);
    v9 = v20;
  }
  if (v9 < 4)
    return 0;
  v10 = v19;
  if ((v9 & 0xFFFFFFFFFFFFFFFCLL) == 4 || v19 == 0)
    return 0;
  v12 = *v19;
  v19 += 2;
  v20 = v9 - 8;
  if (v12 != dword_1DEEBD120[a3] || v10[1] != 5)
    return 0;
  if (a1)
    return _xpc_dictionary_create_from_received_message(a1, &v16);
  if (v9 - 8 < 4)
    return 0;
  v19 = v10 + 3;
  v20 = v9 - 12;
  v14 = v10[2];
  if (!_xpc_class_id_valid(v14))
    return 0;
  v15 = (uint64_t (*)(__int128 *))_xpc_deserialize_from_wire_id(v14);
  return v15(&v16);
}

uint64_t xpc_graph_unpack_with_ool(__int128 *a1, uint64_t a2, uint64_t a3)
{
  return _xpc_graph_unpack_impl(a1, a2, 3u, a3);
}

uint64_t _xpc_graph_deserializer_init(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  v6 = 0;
  result = xpc_payload_get_contiguous_bytes(a2, &v6);
  v5 = v6;
  *(_QWORD *)a1 = a2;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = result;
  *(_QWORD *)(a1 + 24) = v5;
  *(_QWORD *)(a1 + 32) = result;
  *(_QWORD *)(a1 + 40) = v5;
  *(_QWORD *)(a1 + 48) = 0;
  *(_DWORD *)(a1 + 56) = 0;
  return result;
}

uint64_t _xpc_graph_deserializer_init_clone(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (*(_DWORD *)(a2 + 56))
    _xpc_mach_message_request_handoff_reply_cold_1();
  v2 = *(_QWORD *)(a2 + 16);
  v3 = *(_QWORD *)(a2 + 24);
  v4 = *(_QWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)result = 0;
  *(_QWORD *)(result + 8) = 0;
  *(_QWORD *)(result + 16) = v2;
  *(_QWORD *)(result + 24) = v3;
  *(_QWORD *)(result + 32) = v4;
  *(_QWORD *)(result + 40) = v5;
  *(_QWORD *)(result + 48) = 0;
  *(_DWORD *)(result + 56) = 0;
  return result;
}

__n128 _xpc_graph_deserializer_move(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t _xpc_graph_deserializer_get_payload(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t _xpc_graph_deserializer_read_port(uint64_t *a1, int a2, int *a3)
{
  uint64_t v3;
  unint64_t v7;
  int *v8;
  int v9;
  uint64_t result;
  int v11;
  int v12;
  int v13;
  int v14;

  v3 = *a1;
  if (!*a1 || xpc_payload_get_transport(*a1) != 1)
    return 0;
  v7 = a1[6];
  a1[6] = v7 + 1;
  switch(a2)
  {
    case 16:
      v13 = 0;
      v8 = &v13;
      v9 = xpc_mach_payload_extract_ool_receive_right(v3, v7, &v13);
      break;
    case 18:
      v12 = 0;
      v8 = &v12;
      v9 = xpc_mach_payload_extract_ool_send_once_right(v3, v7, &v12);
      break;
    case 17:
      v14 = 0;
      v8 = &v14;
      v9 = xpc_mach_payload_extract_ool_send_right(v3, v7, &v14);
      break;
    default:
      _xpc_graph_deserializer_read_port_cold_1();
  }
  v11 = v9;
  result = 0;
  if (!v11)
  {
    *a3 = *v8;
    return 1;
  }
  return result;
}

BOOL _xpc_graph_deserializer_skip_value(uint64_t a1, unsigned int a2)
{
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  uint64_t v5;
  _BOOL8 result;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;

  v3 = (uint64_t (*)(uint64_t))_xpc_wire_length_from_wire_id(a2);
  v4 = v3(a1);
  if (v4 == -1)
    return 0;
  v5 = v4;
  result = 0;
  v7 = __CFADD__(v5, 3);
  v8 = v5 + 3;
  v9 = v7;
  v10 = v9 << 63 >> 63;
  if (v10 == v9 && (v10 & 0x8000000000000000) == 0)
  {
    v11 = v8 & 0xFFFFFFFFFFFFFFFCLL;
    v12 = *(_QWORD *)(a1 + 40);
    v7 = v12 >= v11;
    v13 = v12 - v11;
    if (!v7)
      return 0;
    v14 = *(_QWORD *)(a1 + 32);
    *(_QWORD *)(a1 + 32) = v14 + v11;
    *(_QWORD *)(a1 + 40) = v13;
    return v14 != 0;
  }
  return result;
}

const char *_xpc_graph_deserializer_read_string(uint64_t a1)
{
  const char *v2;
  size_t v3;
  size_t v4;
  const char *result;
  BOOL v6;
  size_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  size_t v11;

  v2 = *(const char **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = strnlen(v2, v3);
  result = 0;
  v6 = __CFADD__(++v4, 3);
  v7 = v4 + 3;
  v8 = v6;
  v9 = v8 << 63 >> 63;
  if (v9 == v8 && (v9 & 0x8000000000000000) == 0)
  {
    v10 = v7 & 0xFFFFFFFFFFFFFFFCLL;
    v6 = v3 >= (v7 & 0xFFFFFFFFFFFFFFFCLL);
    v11 = v3 - (v7 & 0xFFFFFFFFFFFFFFFCLL);
    if (v6)
    {
      *(_QWORD *)(a1 + 32) = &v2[v10];
      *(_QWORD *)(a1 + 40) = v11;
      return v2;
    }
  }
  return result;
}

uint64_t _xpc_graph_deserializer_set_ool_callback(uint64_t result, uint64_t a2)
{
  if (*(_QWORD *)(result + 8))
    _xpc_mach_message_request_handoff_reply_cold_1();
  *(_QWORD *)(result + 8) = a2;
  return result;
}

uint64_t _xpc_graph_deserializer_get_transport(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result)
    return xpc_payload_get_transport(result);
  return result;
}

uint64_t _xpc_graph_deserializer_get_depth(uint64_t a1)
{
  return *(unsigned int *)(a1 + 56);
}

BOOL _xpc_graph_deserializer_enter_container(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 56);
  if (v1 <= 511)
    *(_DWORD *)(a1 + 56) = v1 + 1;
  return v1 < 512;
}

uint64_t _xpc_graph_deserializer_restore_depth(uint64_t result, int a2)
{
  if (*(_DWORD *)(result + 56) < a2)
    _xpc_mach_message_request_handoff_reply_cold_1();
  *(_DWORD *)(result + 56) = a2;
  return result;
}

uint64_t xpc_payload_get_contiguous_bytes(uint64_t a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v3;

  v3 = a1 + 16;
  result = *(_QWORD *)(a1 + 16);
  *a2 = *(_QWORD *)(v3 + 8);
  return result;
}

uint64_t _xpc_payload_distort(uint64_t result, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, *(_QWORD *)(result + 16), *(_QWORD *)(result + 24));
  return result;
}

uint64_t xpc_payload_get_transport(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 32);
}

uint64_t xpc_mach_payload_ool_port_count(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 32) != 1)
    _xpc_mach_message_request_handoff_reply_cold_1();
  return *(_QWORD *)(a1 + 56);
}

uint64_t xpc_mach_payload_extract_ool_send_right(uint64_t a1, unint64_t a2, _DWORD *a3)
{
  uint64_t result;
  int v5;

  if (*(_BYTE *)(a1 + 32) != 1)
    _xpc_mach_message_request_handoff_reply_cold_1();
  v5 = 0;
  result = _xpc_mach_payload_extract_ool_port(a1, a2, 17, &v5);
  if (!(_DWORD)result)
    *a3 = v5;
  return result;
}

uint64_t _xpc_mach_payload_extract_ool_port(uint64_t a1, unint64_t a2, int a3, _DWORD *a4)
{
  uint64_t v4;
  unsigned int v5;
  uint64_t result;
  int v7;

  if (*(_QWORD *)(a1 + 56) <= a2)
    return 34;
  v4 = *(_QWORD *)(a1 + 48) + 12 * a2;
  v5 = *(unsigned __int8 *)(v4 + 10);
  if (v5 - 16 >= 3)
    _xpc_mach_payload_extract_ool_port_cold_1(v5);
  if (v5 != a3)
    return 22;
  result = 0;
  v7 = *(_DWORD *)v4;
  *(_QWORD *)v4 = 0;
  *(_DWORD *)(v4 + 8) = 0;
  *a4 = v7;
  return result;
}

uint64_t xpc_mach_payload_extract_ool_send_once_right(uint64_t a1, unint64_t a2, _DWORD *a3)
{
  uint64_t result;
  int v5;

  if (*(_BYTE *)(a1 + 32) != 1)
    _xpc_mach_message_request_handoff_reply_cold_1();
  v5 = 0;
  result = _xpc_mach_payload_extract_ool_port(a1, a2, 18, &v5);
  if (!(_DWORD)result)
    *a3 = v5;
  return result;
}

uint64_t xpc_mach_payload_extract_ool_receive_right(uint64_t a1, unint64_t a2, _DWORD *a3)
{
  uint64_t result;
  int v5;

  if (*(_BYTE *)(a1 + 32) != 1)
    _xpc_mach_message_request_handoff_reply_cold_1();
  v5 = 0;
  result = _xpc_mach_payload_extract_ool_port(a1, a2, 16, &v5);
  if (!(_DWORD)result)
    *a3 = v5;
  return result;
}

_BYTE *_xpc_payload_create_from_mach_msg(NSObject *a1, char a2)
{
  _BYTE *v4;
  uint64_t msg;
  unsigned int *v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  _DWORD *v11;
  uint64_t v12;

  v4 = _xpc_payload_alloc(64);
  v4[32] = 1;
  dispatch_retain(a1);
  *((_QWORD *)v4 + 5) = a1;
  if ((a2 & 1) == 0)
    _xpc_mach_message_request_handoff_reply_cold_1();
  msg = dispatch_mach_msg_get_msg();
  v6 = (unsigned int *)(msg + 24);
  if ((*(_DWORD *)msg & 0x80000000) == 0)
  {
    v7 = -24;
LABEL_4:
    *((_QWORD *)v4 + 2) = v6;
    *((_QWORD *)v4 + 3) = v7;
    return v4;
  }
  v8 = *v6;
  if (!*v6)
  {
LABEL_15:
    os_release(v4);
    return 0;
  }
  v9 = msg;
  if (*(_BYTE *)(msg + 39) != 1)
  {
    v6 = (unsigned int *)(msg + 28);
    *((_QWORD *)v4 + 6) = msg + 28;
LABEL_10:
    v10 = v8;
    v11 = v6 + 2;
    v6 += 3 * v8;
    v12 = v8;
    while (!*((_BYTE *)v11 + 3))
    {
      v11 += 3;
      if (!--v12)
        goto LABEL_13;
    }
    goto LABEL_15;
  }
  *((_QWORD *)v4 + 1) = dispatch_data_create(*(const void **)(msg + 28), *(unsigned int *)(msg + 40), 0, (dispatch_block_t)*MEMORY[0x1E0C86EA8]);
  *(_DWORD *)(v9 + 36) &= 0xFFFFFF00;
  *((_QWORD *)v4 + 2) = *(_QWORD *)(v9 + 28);
  *((_QWORD *)v4 + 3) = *(unsigned int *)(v9 + 40);
  v6 = (unsigned int *)(v9 + 44);
  *((_QWORD *)v4 + 6) = v9 + 44;
  if (--v8)
    goto LABEL_10;
  v10 = 0;
LABEL_13:
  *((_QWORD *)v4 + 7) = v10;
  if (!*((_QWORD *)v4 + 1))
  {
    v7 = v9 - (_QWORD)v6;
    goto LABEL_4;
  }
  return v4;
}

id _xpc_payload_create_from_data(const void *a1, size_t a2)
{
  return _xpc_payload_create_from_data_impl(a1, a2, 0);
}

id _xpc_payload_create_from_data_impl(const void *a1, size_t a2, void *a3)
{
  id v6;
  NSObject *v7;

  v6 = _xpc_payload_alloc(40);
  *((_BYTE *)v6 + 32) = 0;
  v7 = dispatch_data_create(a1, a2, 0, a3);
  *((_QWORD *)v6 + 1) = dispatch_data_create_map(v7, (const void **)v6 + 2, (size_t *)v6 + 3);
  dispatch_release(v7);
  return v6;
}

id _xpc_payload_create_from_data_no_copy(const void *a1, size_t a2)
{
  return _xpc_payload_create_from_data_impl(a1, a2, (void *)*MEMORY[0x1E0C86EA0]);
}

void _xpc_payload_dispose(uint64_t a1)
{
  NSObject *v2;
  mach_msg_header_t *msg;

  v2 = *(NSObject **)(a1 + 8);
  if (v2)
    dispatch_release(v2);
  if (*(_BYTE *)(a1 + 32) == 1)
  {
    if (*(_QWORD *)(a1 + 40))
    {
      msg = (mach_msg_header_t *)dispatch_mach_msg_get_msg();
      mach_msg_destroy(msg);
      dispatch_release(*(dispatch_object_t *)(a1 + 40));
    }
  }
}

int *_xpc_get_extension_vtable(id a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  Class Class;
  uint64_t v6;
  unint64_t v7;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  int v16;
  char *v17;

  v2 = MEMORY[0x1E0C87FA0];
  v3 = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 16);
  while (1)
  {
    v4 = v3 == -1 ? *(_QWORD *)(v2 + 24) : _os_alloc_once();
    if (*(_QWORD *)(v4 + 200))
      break;
    v3 = -1;
    if (((unint64_t)a1 & 0x8000000000000000) != 0)
      goto LABEL_19;
LABEL_9:
    v7 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= (unint64_t)OS_xpc_object
      && v7 <= (unint64_t)OS_xpc_rich_error
      && (*(_QWORD *)a1 & 7) == 0)
    {
      return (int *)((char *)&_xpc_vtables + 2 * (v7 - (_QWORD)OS_xpc_object));
    }
  }
  Class = object_getClass(a1);
  v6 = *(_QWORD *)(v4 + 200);
  if (Class == *(Class *)(v6 + 24))
    return *(int **)(v6 + 32);
  v3 = *(_QWORD *)(v2 + 16);
  if (((unint64_t)a1 & 0x8000000000000000) == 0)
    goto LABEL_9;
LABEL_19:
  v11 = 0;
  v12 = *MEMORY[0x1E0DE7C58];
  if ((~(unint64_t)a1 & 0xC000000000000007) == 0)
    v12 = 0;
  v13 = v12 ^ (unint64_t)a1;
  do
  {
    if ((v13 & 7) == *(_BYTE *)(MEMORY[0x1E0DE7C48] + v11))
      break;
    ++v11;
  }
  while (v11 != 7);
  v14 = v11 | v13;
  v15 = v11 & 7;
  v16 = (v14 >> 55) + 8;
  if (v15 == 7)
    LODWORD(v15) = v16;
  if ((_DWORD)v15 == 12)
    return &_OS_xpc_type_uint64;
  if ((_DWORD)v15 != 13)
  {
    v17 = _xpc_asprintf("Object is not an XPC object");
    _xpc_api_misuse(v17);
  }
  return &_OS_xpc_type_int64;
}

uint64_t _xpc_get_extension_type_vtable(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 16) == -1)
    v2 = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 24);
  else
    v2 = _os_alloc_once();
  v3 = *(_QWORD *)(v2 + 200);
  if (v3 && *(_QWORD *)(v3 + 24) == a1)
    return *(_QWORD *)(v3 + 32);
  else
    return 0;
}

double xpc_extension_type_init(uint64_t a1, uint64_t a2)
{
  double result;

  *(_DWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = a2;
  *(_QWORD *)(a1 + 16) = _xpc_extension_copy;
  *(_QWORD *)(a1 + 24) = _xpc_extension_equal;
  *(_QWORD *)(a1 + 32) = _xpc_extension_hash;
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 48) = _xpc_extension_desc;
  *(_QWORD *)(a1 + 56) = _xpc_extension_debug_desc;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 72) = _xpc_extension_serialize;
  *(_QWORD *)(a1 + 80) = _xpc_extension_deserialize;
  *(_QWORD *)(a1 + 88) = _xpc_extension_wire_length;
  result = 0.0;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  return result;
}

uint64_t _xpc_extension_copy()
{
  return 0;
}

BOOL _xpc_extension_equal(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t _xpc_extension_desc(void *a1, uint64_t a2)
{
  uint64_t (*v4)(void *, _OWORD *, uint64_t);
  size_t v5;
  _OWORD v7[32];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C874D8];
  v4 = (uint64_t (*)(void *, _OWORD *, uint64_t))*((_QWORD *)_xpc_get_extension_vtable(a1) + 21);
  memset(v7, 0, sizeof(v7));
  v5 = v4(a1, v7, 512);
  return _xpc_serializer_append(a2, v7, v5, 0);
}

uint64_t _xpc_extension_debug_desc(void *a1, uint64_t a2)
{
  uint64_t (*v4)(void *, _OWORD *, uint64_t);
  size_t v5;
  _OWORD v7[32];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C874D8];
  v4 = (uint64_t (*)(void *, _OWORD *, uint64_t))*((_QWORD *)_xpc_get_extension_vtable(a1) + 22);
  memset(v7, 0, sizeof(v7));
  v5 = v4(a1, v7, 512);
  return _xpc_serializer_append(a2, v7, v5, 0);
}

void _xpc_extension_serialize()
{
  syslog(3, "Extension objects cannot be serialized.");
}

uint64_t _xpc_extension_deserialize()
{
  return 0;
}

uint64_t _xpc_extension_wire_length()
{
  return -1;
}

BOOL _system_version_copy_string_sysctl(void *a1)
{
  size_t v2;

  v2 = 48;
  return sysctlbyname("kern.osproductversion", a1, &v2, 0, 0) == 0;
}

const char *_system_version_plist_path()
{
  return "/System/Library/CoreServices/SystemVersion.plist";
}

BOOL _system_version_copy_string_plist(char *a1)
{
  void *v2;
  void *v3;
  const char *string;
  _BOOL8 v5;

  v2 = _xpc_copy_secure_plist("/System/Library/CoreServices/SystemVersion.plist");
  if (!v2)
    return 0;
  v3 = v2;
  string = xpc_dictionary_get_string(v2, "ProductVersion");
  v5 = string != 0;
  if (string)
    strlcpy(a1, string, 0x30uLL);
  xpc_release(v3);
  return v5;
}

BOOL _system_version_parse_string(const char *a1, uint64_t a2)
{
  return (sscanf(a1, "%d.%d.%d", a2, a2 + 4, a2 + 8) - 1) < 3;
}

BOOL _availability_version_check(unsigned int a1, uint64_t a2)
{
  int base_platform;
  uint64_t v5;
  unsigned int *i;
  uint64_t v8;
  int v9;

  dyld_get_active_platform();
  base_platform = dyld_get_base_platform();
  v9 = 0;
  v8 = 0;
  os_system_version_get_current_version((uint64_t)&v8);
  if (!a1)
    return 1;
  v5 = a1;
  for (i = (unsigned int *)(a2 + 4); *(i - 1) != base_platform; i += 2)
  {
    if (!--v5)
      return 1;
  }
  return *i <= (((_DWORD)v8 << 16) | (BYTE4(v8) << 8) | v9);
}

uint64_t os_system_version_get_current_version(uint64_t a1)
{
  uint64_t v2;

  if (os_system_version_get_current_version_predicate != -1)
    _os_once();
  v2 = *(_QWORD *)current_version;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(current_version + 8);
  *(_QWORD *)a1 = v2;
  return 0;
}

uint64_t populate_current_version()
{
  uint64_t result;
  void *v1;
  size_t v2;
  char v3[16];
  __int128 v4;
  __int128 v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C874D8];
  v4 = 0u;
  v5 = 0u;
  *(_OWORD *)v3 = 0u;
  v2 = 48;
  if (sysctlbyname("kern.osproductversion", v3, &v2, 0, 0))
    _system_version_copy_string_plist(v3);
  result = sscanf(v3, "%d.%d.%d", &parsed_version, &unk_1ECCEB80C, &unk_1ECCEB810);
  if ((result - 1) >= 3)
    v1 = &_system_version_fallback;
  else
    v1 = &parsed_version;
  current_version = (uint64_t)v1;
  return result;
}

uint64_t os_system_version_sim_get_current_host_version(uint64_t a1)
{
  uint64_t v2;

  if (os_system_version_sim_get_current_host_version_predicate != -1)
    _os_once();
  v2 = *(_QWORD *)current_host_version;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(current_host_version + 8);
  *(_QWORD *)a1 = v2;
  return 0;
}

uint64_t populate_current_host_version()
{
  void *v0;
  void *v1;
  uint64_t result;
  void *v3;
  size_t v4;
  char v5[16];
  __int128 v6;
  __int128 v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C874D8];
  v6 = 0u;
  v7 = 0u;
  *(_OWORD *)v5 = 0u;
  v4 = 48;
  if (sysctlbyname("kern.osproductversion", v5, &v4, 0, 0))
  {
    v0 = _xpc_copy_secure_plist("/System/Library/CoreServices/SystemVersion.plist");
    if (v0)
    {
      v1 = v0;
      if (xpc_dictionary_get_string(v0, "ProductVersion"))
        __strlcpy_chk();
      xpc_release(v1);
    }
  }
  result = sscanf(v5, "%d.%d.%d", &parsed_host_version, &unk_1F0460BE0, &unk_1F0460BE4);
  if ((result - 1) >= 3)
    v3 = &_system_version_fallback;
  else
    v3 = &parsed_host_version;
  current_host_version = (uint64_t)v3;
  return result;
}

uint64_t _xpc_rich_error_copy(uint64_t a1)
{
  return xpc_rich_error_create(*(const char **)(a1 + 40), *(_BYTE *)(a1 + 24));
}

BOOL _xpc_rich_error_equal(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 32) == *(_QWORD *)(a2 + 32)
      && _xpc_equal_strings(*(char **)(a1 + 40), *(const char **)(a2 + 40))
      && *(unsigned __int8 *)(a1 + 24) == *(unsigned __int8 *)(a2 + 24);
}

uint64_t _xpc_rich_error_hash(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;

  v2 = 48;
  if (*(_BYTE *)(a1 + 24))
    v2 = 49;
  v3 = _xpc_asprintf("%s%c", *(const char **)(a1 + 40), v2);
  v4 = _xpc_hash(v3, *(_QWORD *)(a1 + 32) + 2);
  free(v3);
  return v4;
}

uint64_t _xpc_rich_error_desc(uint64_t a1, uint64_t a2)
{
  int v4;
  char __str[16];
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C874D8];
  v8 = 0u;
  v9 = 0u;
  *(_OWORD *)__str = 0u;
  v7 = 0u;
  v4 = snprintf(__str, 0x40uLL, "Can Retry: %d. Description:\"", *(unsigned __int8 *)(a1 + 24));
  _xpc_serializer_append(a2, __str, v4, 0);
  _xpc_serializer_append(a2, *(void **)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
  return _xpc_serializer_append(a2, "\"", 1uLL, 0);
}

uint64_t _xpc_rich_error_debug(uint64_t a1, char *__str, size_t __size)
{
  return snprintf(__str, __size, "Can Retry: %d. Description:\"%s\"", *(unsigned __int8 *)(a1 + 24), *(const char **)(a1 + 40));
}

uint64_t _xpc_rich_error_serialize(uint64_t a1, uint64_t a2)
{
  uint64_t v5;
  int v6;
  int v7;
  int __src;

  if (!*(_QWORD *)(a1 + 32))
    _xpc_rich_error_serialize_cold_1();
  __src = 114688;
  _xpc_serializer_append(a2, &__src, 4uLL, 1);
  v7 = *(_DWORD *)(a1 + 32) + 13;
  _xpc_serializer_append(a2, &v7, 4uLL, 1);
  v6 = *(unsigned __int8 *)(a1 + 24);
  _xpc_serializer_append(a2, &v6, 4uLL, 1);
  v5 = *(_QWORD *)(a1 + 32);
  _xpc_serializer_append(a2, &v5, 8uLL, 1);
  return _xpc_serializer_append(a2, (void *)(a1 + 40), *(_QWORD *)(a1 + 32) + 1, 1);
}

uint64_t _xpc_rich_error_deserialize(uint64_t a1)
{
  int *v2;
  int v3;
  uint64_t *v4;
  uint64_t v5;
  const char *v6;

  _xpc_wire_length(a1);
  v2 = (int *)_xpc_graph_deserializer_read(a1, 4uLL);
  if (v2
    && (v3 = *v2, (v4 = (uint64_t *)_xpc_graph_deserializer_read(a1, 8uLL)) != 0)
    && (v5 = *v4, (unint64_t)(*v4 - 0x10000) >= 0xFFFFFFFFFFFF0001)
    && (v6 = (const char *)_xpc_graph_deserializer_read(a1, v5 + 1)) != 0
    && !v6[v5])
  {
    return xpc_rich_error_create(v6, v3 != 0);
  }
  else
  {
    return 0;
  }
}

void _xpc_rich_error_dispose(uint64_t a1)
{
  free(*(void **)(a1 + 40));
}

uint64_t xpc_rich_error_create(const char *a1, char a2)
{
  size_t v4;
  size_t v5;
  uint64_t v6;
  size_t v7;
  char *v9;

  v4 = strlen(a1);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = _xpc_base_create();
  *(_BYTE *)(v6 + 24) = a2;
  *(_QWORD *)(v6 + 40) = _xpc_try_strdup(a1);
  v7 = (v5 & 0xFFFFFFFC) + 8;
  if (v5 > v7)
  {
    v9 = _xpc_asprintf("Unreasonably large string");
    _xpc_api_misuse(v9);
  }
  *(_DWORD *)(v6 + 20) = v7;
  *(_QWORD *)(v6 + 32) = v5;
  return v6;
}

char *__cdecl xpc_rich_error_copy_description(xpc_rich_error_t error)
{
  return _xpc_strdup(*((const char **)error + 5));
}

BOOL xpc_rich_error_can_retry(xpc_rich_error_t error)
{
  return *((_BYTE *)error + 24);
}

xpc_object_t launch_job_query_get_additional_job_properties(_DWORD *a1)
{
  xpc_object_t v2;
  int v3;
  xpc_object_t v4;
  xpc_object_t dictionary;
  xpc_object_t xdict;

  v2 = xpc_dictionary_create(0, 0, 0);
  xdict = 0;
  v3 = _launch_job_query_routine(1200, v2, &xdict);
  if (v3)
  {
    xpc_release(v2);
    if (xdict)
      _xpc_rich_error_serialize_cold_1();
    v4 = 0;
  }
  else
  {
    dictionary = xpc_dictionary_get_dictionary(xdict, "additional-properties");
    v4 = dictionary;
    if (dictionary)
      xpc_retain(dictionary);
    xpc_release(xdict);
    xpc_release(v2);
  }
  *a1 = v3;
  return v4;
}

BOOL _xpc_mach_send_once_equal(uint64_t a1, uint64_t a2)
{
  return *(_DWORD *)(a1 + 24) == *(_DWORD *)(a2 + 24);
}

uint64_t _xpc_mach_send_once_hash(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

uint64_t _xpc_mach_send_once_desc(unsigned int *a1, uint64_t a2)
{
  unsigned int *v4;
  int v5;
  int v6;
  const char *v7;
  unsigned int v8;
  int v9;
  int v11;
  char __str[16];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C874D8];
  v11 = 0;
  v4 = (unsigned int *)MEMORY[0x1E0C883F0];
  v5 = MEMORY[0x1DF0F0E78](*MEMORY[0x1E0C883F0], a1[6], 2, &v11);
  if (v5)
  {
    if (v5 == 15)
    {
      v7 = "(none)";
    }
    else if (v5 == 17)
    {
      v6 = MEMORY[0x1DF0F0E78](*v4, a1[6], 4, &v11);
      v7 = "(invalid)";
      if (!v6)
        v7 = "dead-name";
    }
    else
    {
      v7 = "(invalid)";
    }
  }
  else
  {
    v7 = "send once";
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  *(_OWORD *)__str = 0u;
  v13 = 0u;
  v8 = snprintf(__str, 0x80uLL, "<%s: %p> { name = 0x%x, right = %s }", "mach send once right", a1, a1[6], v7);
  if (v8 >= 0x7F)
    v9 = 127;
  else
    v9 = v8;
  return _xpc_serializer_append(a2, __str, (v9 + 1), 0);
}

uint64_t _xpc_mach_send_once_debug(uint64_t a1, char *__str, size_t __size)
{
  return snprintf(__str, __size, ", port = 0x%x", *(_DWORD *)(a1 + 24));
}

uint64_t _xpc_mach_send_once_serialize(unsigned int *a1, _QWORD *a2)
{
  int right;
  int v6;

  right = xpc_mach_send_once_extract_right(a1);
  v6 = 110592;
  return _xpc_serializer_append_port(a2, &v6, 4uLL, (uint64_t)a1, right, 18);
}

uint64_t _xpc_mach_send_once_deserialize(uint64_t *a1)
{
  int v1;
  uint64_t result;
  int v3;

  v3 = 0;
  if (!_xpc_graph_deserializer_read_port(a1, 18, &v3))
    return 0;
  v1 = v3;
  result = _xpc_base_create();
  *(_DWORD *)(result + 24) = v1;
  *(_DWORD *)(result + 16) |= 3u;
  return result;
}

uint64_t _xpc_mach_send_once_wire_length()
{
  return -1;
}

uint64_t _xpc_mach_send_once_dispose(uint64_t a1)
{
  unsigned int *v1;
  uint64_t result;

  v1 = (unsigned int *)(a1 + 24);
  do
    result = __ldxr(v1);
  while (__stxr(0xFFFFFFFF, v1));
  if ((result - 1) <= 0xFFFFFFFC)
  {
    result = _xpc_mach_port_release(result);
    if ((_DWORD)result)
      return _os_assumes_log();
  }
  return result;
}

uint64_t xpc_mach_send_once_create(int a1)
{
  uint64_t result;

  result = _xpc_base_create();
  *(_DWORD *)(result + 24) = a1;
  *(_DWORD *)(result + 16) |= 2u;
  return result;
}

uint64_t xpc_mach_send_once_extract_right(unsigned int *a1)
{
  uint64_t result;
  unsigned int *v3;
  char *v4;

  if (xpc_get_type(a1) != (xpc_type_t)OS_xpc_mach_send_once)
    return 0;
  v3 = a1 + 6;
  do
    result = __ldxr(v3);
  while (__stxr(0xFFFFFFFE, v3));
  if ((_DWORD)result == -2)
  {
    v4 = _xpc_asprintf("Send once port already consumed");
    _xpc_api_misuse(v4);
  }
  return result;
}

char *_xpc_realpath(const char *a1)
{
  __int128 v3;
  uint64_t v4;
  _BYTE v5[4];
  _DWORD v6[258];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C874D8];
  v3 = xmmword_1DEEBD13C;
  v4 = 0;
  bzero(v5, 0x40CuLL);
  while (getattrlist(a1, &v3, v5, 0x40CuLL, 0) == -1)
  {
    if (*__error() != 35)
      return 0;
  }
  return _xpc_strdup((const char *)v6 + v6[0]);
}

char *_xpc_realpath_fd(int a1)
{
  char *result;
  int *v3;
  char v4[1024];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C874D8];
  bzero(v4, 0x400uLL);
  if (a1 < 0)
  {
    v3 = __error();
    result = 0;
    *v3 = 9;
  }
  else
  {
    while (fcntl(a1, 50, v4) == -1)
    {
      if (*__error() != 35)
        return 0;
    }
    return _xpc_strdup(v4);
  }
  return result;
}

void *_copy_plist_from_fd(int a1, uint64_t a2, _QWORD *a3, ssize_t *a4)
{
  void *v8;
  ssize_t v9;
  ssize_t v10;
  xpc_object_t v11;
  void *v12;

  v8 = _xpc_alloc(*(_QWORD *)(a2 + 96));
  v9 = read(a1, v8, *(_QWORD *)(a2 + 96));
  v10 = v9;
  if (v9 != *(_QWORD *)(a2 + 96))
  {
    if (v9 && (v9 != -1 || *__error()))
      _os_assumes_log();
    goto LABEL_8;
  }
  v11 = xpc_create_from_plist((char *)v8, v9);
  v12 = v11;
  if (v11)
  {
    if (xpc_get_type(v11) != (xpc_type_t)OS_xpc_dictionary)
    {
      xpc_release(v12);
LABEL_8:
      v12 = 0;
      goto LABEL_9;
    }
    if (a3 && a4)
    {
      *a4 = v10;
      *a3 = v8;
      return v12;
    }
  }
LABEL_9:
  free(v8);
  return v12;
}

int *_xpc_strict_close(int *result)
{
  if ((result & 0x80000000) == 0)
  {
    result = (int *)close((int)result);
    if ((_DWORD)result)
    {
      if (*__error())
        _os_assumes_log();
      result = __error();
      if (*result == 9)
        _xpc_mach_message_request_handoff_reply_cold_1();
    }
  }
  return result;
}

void *_xpc_copy_secure_plist(const char *a1)
{
  return _copy_secure_plist(a1, 0, 0);
}

void *_copy_secure_plist(const char *a1, _QWORD *a2, ssize_t *a3)
{
  int *v5;
  int *v6;
  int v7;
  void *v8;
  stat v10;

  if (!a1)
    return 0;
  v5 = (int *)open(a1, 0);
  if ((_DWORD)v5 == -1)
    return 0;
  v6 = v5;
  memset(&v10, 0, sizeof(v10));
  v7 = fstat((int)v5, &v10);
  if (v7 | v10.st_uid || (v10.st_mode & 0x12) != 0)
    v8 = 0;
  else
    v8 = _copy_plist_from_fd((int)v6, (uint64_t)&v10, a2, a3);
  _xpc_strict_close(v6);
  return v8;
}

uint64_t _xpc_ktrace_pid0()
{
  getpid();
  return kdebug_trace();
}

uint64_t _xpc_ktrace_pid1()
{
  getpid();
  return kdebug_trace();
}

uint64_t _xpc_ktrace_pid2()
{
  getpid();
  return kdebug_trace();
}

void _xpc_launch_routine(uint64_t a1, void *a2, xpc_object_t *a3)
{
  int v4;
  xpc_object_t v5;
  xpc_object_t value;
  xpc_object_t xdict;

  xdict = 0;
  v4 = _xpc_interface_routine(a1, a2, &xdict, 0, 0);
  if (v4)
    goto LABEL_2;
  v5 = xdict;
  value = xpc_dictionary_get_value(xdict, "response");
  if (!value)
  {
    xpc_release(v5);
    v4 = 118;
LABEL_2:
    *a3 = xpc_uint64_create(v4);
    return;
  }
  *a3 = xpc_retain(value);
  xpc_release(v5);
}

int64_t _xpc_interface_routine(uint64_t a1, xpc_object_t xdict, xpc_object_t *a3, int a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  int64_t int64;
  uint64_t v14;
  xpc_object_t v15;
  uint64_t v16;
  uint64_t uint64;
  uint64_t v18;
  int v19;
  uint64_t self_audit_token;
  int v21;
  int v22;
  xpc_object_t xdicta;
  __int128 v24;
  __int128 v25;

  v10 = MEMORY[0x1E0C87FA0];
  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 16) == -1)
    v11 = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 24);
  else
    v11 = _os_alloc_once();
  if (*(_BYTE *)v11 || *(_BYTE *)(v11 + 4))
    return 141;
  xdicta = 0;
  if (!*(_BYTE *)(v11 + 41))
    xpc_dictionary_set_BOOL(xdict, "pre-exec", 1);
  v14 = 2;
  if (!*(_BYTE *)(v11 + 88))
    v14 = 6;
  int64 = _xpc_pipe_interface_routine(*(_QWORD *)(v11 + 24), a1, xdict, &xdicta, v14 | a5);
  if (xdicta && xpc_dictionary_get_string(xdicta, "xpc-fault"))
    _XPC_MISUSE_FAULT();
  v15 = xdicta;
  if ((_DWORD)int64 || (int64 = xpc_dictionary_get_int64(xdicta, "error"), v15 = xdicta, (_DWORD)int64))
  {
    if (v15)
      xpc_release(v15);
  }
  else
  {
    if (*(_QWORD *)(v10 + 16) == -1)
      v16 = *(_QWORD *)(v10 + 24);
    else
      v16 = _os_alloc_once();
    if (!*(_BYTE *)(v16 + 88))
    {
      v24 = 0u;
      v25 = 0u;
      xpc_dictionary_get_audit_token(v15);
      if (DWORD1(v25) != 1)
        _xpc_interface_routine_cold_6(SDWORD1(v25));
      if (DWORD1(v24))
        _xpc_interface_routine_cold_5();
      if (a4)
      {
        uint64 = xpc_dictionary_get_uint64(v15, "req_pid");
        v18 = xpc_dictionary_get_uint64(v15, "rec_execcnt");
        if (uint64 >> 31 || (v19 = v18, v18 >> 31))
          _xpc_interface_routine_cold_1();
        self_audit_token = _xpc_get_self_audit_token();
        v21 = *(_DWORD *)(self_audit_token + 20);
        if (!v21 || (v22 = *(_DWORD *)(self_audit_token + 28)) == 0)
          _xpc_interface_routine_cold_2();
        if (v21 != (_DWORD)uint64)
          _xpc_interface_routine_cold_4();
        if (v22 != v19)
          _xpc_interface_routine_cold_3();
      }
    }
    int64 = 0;
    *a3 = xdicta;
  }
  return int64;
}

int64_t _xpc_bootstrap_routine(uint64_t a1, void *a2, xpc_object_t *a3)
{
  return _xpc_interface_routine(a1, a2, a3, 0, 0);
}

int64_t _xpc_bootstrap_routine_authenticate(uint64_t a1, void *a2, xpc_object_t *a3)
{
  return _xpc_interface_routine(a1, a2, a3, 1, 0);
}

int64_t _xpc_bootstrap_routine_check_in(uint64_t a1, void *a2, xpc_object_t *a3)
{
  return _xpc_interface_routine(a1, a2, a3, 0, 1);
}

uint64_t _xpc_interface_routine_async(uint64_t a1, xpc_object_t xdict, uint64_t a3)
{
  uint64_t v6;

  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 16) == -1)
    v6 = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 24);
  else
    v6 = _os_alloc_once();
  if (*(_BYTE *)v6 || *(_BYTE *)(v6 + 4))
    return 141;
  if (!*(_BYTE *)(v6 + 41))
    xpc_dictionary_set_BOOL(xdict, "pre-exec", 1);
  return _xpc_pipe_interface_routine_async(*(_QWORD *)(v6 + 24), a1, xdict, a3, 2);
}

int64_t _xpc_service_routine(uint64_t a1, void *a2, xpc_object_t *a3)
{
  return _xpc_interface_routine(a1, a2, a3, 0, 0);
}

int64_t _xpc_domain_routine(uint64_t a1, void *a2, xpc_object_t *a3)
{
  return _xpc_interface_routine(a1, a2, a3, 0, 0);
}

int64_t _xpc_domain_routine_activate(xpc_object_t xdict, xpc_object_t *a2)
{
  return _xpc_interface_routine(805, xdict, a2, 0, 1);
}

xpc_object_t _xpc_domain_request_create_system()
{
  xpc_object_t empty;

  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(empty, "type", 1uLL);
  xpc_dictionary_set_uint64(empty, "handle", 0);
  return empty;
}

int64_t _launch_job_routine(uint64_t a1, void *a2, xpc_object_t *a3)
{
  return _xpc_interface_routine(a1, a2, a3, 0, 0);
}

int64_t _launch_job_query_routine(uint64_t a1, void *a2, xpc_object_t *a3)
{
  return _xpc_interface_routine(a1, a2, a3, 0, 0);
}

int64_t _launch_server_test_routine(uint64_t a1, void *a2, xpc_object_t *a3)
{
  return _xpc_interface_routine(a1, a2, a3, 0, 0);
}

uint64_t _XPC_MISUSE_FAULT()
{
  int v0;
  char **v1;
  char **v2;
  uint64_t v3;
  char **v4;
  uint64_t result;
  int *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C874D8];
  v7 = 0;
  v8 = 0;
  v9 = 0;
  v10 = 0;
  if ((_dyld_get_image_uuid() & 1) == 0)
  {
    v7 = 0;
    v8 = 0;
  }
  if ((_dyld_get_shared_cache_uuid() & 1) != 0)
  {
    _dyld_get_shared_cache_range();
  }
  else
  {
    v9 = 0;
    v10 = 0;
  }
  _os_log_simple();
  bzero(&v7, 0x400uLL);
  v0 = backtrace(&v7, 128);
  v1 = backtrace_symbols(&v7, v0);
  if (v1)
  {
    v2 = v1;
    if (v0 >= 1)
    {
      v3 = v0;
      v4 = v1;
      do
      {
        if (!*v4)
          break;
        v9 = 0;
        v10 = 0;
        if ((_dyld_get_image_uuid() & 1) == 0)
        {
          v9 = 0;
          v10 = 0;
        }
        if ((_dyld_get_shared_cache_uuid() & 1) != 0)
          _dyld_get_shared_cache_range();
        ++v4;
        _os_log_simple();
        --v3;
      }
      while (v3);
    }
    free(v2);
  }
  result = os_fault_with_payload();
  if ((_DWORD)result)
  {
    v9 = 0;
    v10 = 0;
    if ((_dyld_get_image_uuid() & 1) == 0)
    {
      v9 = 0;
      v10 = 0;
    }
    if ((_dyld_get_shared_cache_uuid() & 1) != 0)
      _dyld_get_shared_cache_range();
    __error();
    v6 = __error();
    xpc_strerror(*v6);
    return _os_log_simple();
  }
  return result;
}

void *_xpc_alloc(size_t size)
{
  void *v2;

  do
  {
    v2 = malloc_type_calloc(1uLL, size, 0x5C63E6C5uLL);
    if (v2)
      break;
    if (*__error() != 12 && *__error())
      _xpc_alloc_cold_1();
  }
  while (_waiting4memory());
  return v2;
}

void *_xpc_realloc(void *ptr, int a2, size_t size)
{
  void *v5;

  do
  {
    v5 = malloc_type_realloc(ptr, size, 0x662826DDuLL);
    if (v5)
      break;
    if (*__error() != 12 && *__error())
      _xpc_alloc_cold_1();
  }
  while (_waiting4memory());
  return v5;
}

int64_t _xpc_look_up_endpoint(char *a1, int a2, uint64_t a3, uint64_t a4, const unsigned __int8 *a5, uint64_t a6, const void *a7, _DWORD *a8, BOOL *a9)
{
  xpc_object_t v17;
  int64_t v18;
  xpc_object_t xdict;

  v17 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v17, "type", a2);
  xpc_dictionary_set_uint64(v17, "handle", a3);
  xpc_dictionary_set_uint64(v17, "lookup-handle", a4);
  xpc_dictionary_set_uint64(v17, "flags", a6);
  xpc_dictionary_set_string(v17, "name", a1);
  if ((a6 & 0x24) != 0)
    xpc_dictionary_set_uuid(v17, "instance", a5);
  if ((a6 & 0x400) != 0)
  {
    if (!a7)
      _xpc_rich_error_serialize_cold_1();
    xpc_dictionary_set_data(v17, "cputypes", a7, 0x24uLL);
  }
  xdict = 0;
  v18 = _xpc_bootstrap_routine_authenticate(804, v17, &xdict);
  if (!(_DWORD)v18)
  {
    *a8 = _xpc_dictionary_extract_mach_send(xdict, "port");
    if (a9)
      *a9 = xpc_dictionary_get_BOOL(xdict, "non-launching");
    xpc_release(xdict);
    _launch_report_service_lookup(a1);
  }
  xpc_release(v17);
  return v18;
}

uint64_t _launch_report_service_lookup(char *a1)
{
  uint64_t result;

  result = _os_feature_enabled_simple_impl();
  if ((_DWORD)result)
  {
    result = _os_trace_lazy_init_completed_4libxpc();
    if ((_DWORD)result)
    {
      result = os_variant_has_internal_content();
      if ((_DWORD)result)
      {
        result = os_variant_has_internal_diagnostics();
        if ((_DWORD)result)
        {
          result = _xpc_equal_strings(a1, "com.apple.system.notification_center");
          if ((result & 1) == 0)
          {
            result = _xpc_equal_strings(a1, "com.apple.logd");
            if ((result & 1) == 0)
            {
              result = _xpc_equal_strings(a1, "com.apple.logd.events");
              if ((result & 1) == 0)
              {
                result = _xpc_equal_strings(a1, "com.apple.diagnosticd");
                if ((result & 1) == 0)
                {
                  result = _xpc_equal_strings(a1, "com.apple.system.logger");
                  if ((result & 1) == 0)
                  {
                    if (_xpc_telemetry_log_handle__once != -1)
                      dispatch_once(&_xpc_telemetry_log_handle__once, &__block_literal_global);
                    result = os_signpost_enabled((os_log_t)_xpc_telemetry_log_handle__log);
                    if ((_DWORD)result)
                      return _os_signpost_emit_unreliably_with_name_impl();
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

int64_t _xpc_activate_endpoint(const char *a1, int a2, uint64_t a3, uint64_t a4, _DWORD *a5, BOOL *a6)
{
  xpc_object_t v12;
  int64_t v13;
  xpc_object_t xdict;

  v12 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v12, "type", a2);
  xpc_dictionary_set_uint64(v12, "handle", a3);
  xpc_dictionary_set_uint64(v12, "flags", a4);
  xpc_dictionary_set_string(v12, "name", a1);
  xdict = 0;
  v13 = _xpc_domain_routine_activate(v12, &xdict);
  if (!(_DWORD)v13)
  {
    *a5 = xpc_dictionary_extract_mach_recv(xdict, "port");
    if (a6)
      *a6 = xpc_dictionary_get_BOOL(xdict, "non-launching");
    xpc_release(xdict);
  }
  xpc_release(v12);
  return v13;
}

int launch_activate_socket(const char *name, int **fds, size_t *cnt)
{
  xpc_object_t v6;
  int v7;
  xpc_object_t value;
  void *v9;
  size_t count;
  int *v11;
  size_t v12;
  size_t v13;
  xpc_object_t xdict;

  v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v6, "type", 6uLL);
  xpc_dictionary_set_uint64(v6, "handle", 0);
  xpc_dictionary_set_uint64(v6, "flags", 0x20uLL);
  xpc_dictionary_set_string(v6, "name", name);
  xdict = 0;
  v7 = _xpc_domain_routine_activate(v6, &xdict);
  if (!v7)
  {
    value = xpc_dictionary_get_value(xdict, "port");
    if (value && (v9 = value, xpc_get_type(value) == (xpc_type_t)OS_xpc_array))
    {
      count = xpc_array_get_count(v9);
      if (count >> 62)
      {
        __break(1u);
        return count;
      }
      v11 = (int *)_xpc_alloc(4 * count);
      if (xpc_array_get_count(v9))
      {
        v12 = 0;
        do
        {
          v11[v12] = xpc_array_dup_fd(v9, v12);
          ++v12;
        }
        while (v12 < xpc_array_get_count(v9));
      }
      *fds = v11;
      v13 = xpc_array_get_count(v9);
      v7 = 0;
      *cnt = v13;
    }
    else
    {
      v7 = 118;
    }
    xpc_release(xdict);
  }
  xpc_release(v6);
  LODWORD(count) = v7;
  return count;
}

int64_t launch_get_service_enabled(const char *a1, BOOL *a2, BOOL *a3)
{
  return _launch_get_service_enabled_impl(a1, a2, a3, 6u);
}

int64_t _launch_get_service_enabled_impl(const char *a1, BOOL *a2, BOOL *a3, unsigned int a4)
{
  xpc_object_t v8;
  int64_t v9;
  xpc_object_t xdict;

  v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v8, "type", a4);
  xpc_dictionary_set_uint64(v8, "handle", 0);
  xpc_dictionary_set_string(v8, "name", a1);
  xdict = 0;
  v9 = _xpc_domain_routine(811, v8, &xdict);
  if (!(_DWORD)v9)
  {
    if (a2)
      *a2 = xpc_dictionary_get_BOOL(xdict, "loaded");
    if (a3)
      *a3 = xpc_dictionary_get_BOOL(xdict, "enabled");
    xpc_release(xdict);
  }
  xpc_release(v8);
  return v9;
}

int64_t launch_get_system_service_enabled(const char *a1, BOOL *a2, BOOL *a3)
{
  return _launch_get_service_enabled_impl(a1, a2, a3, 1u);
}

int64_t launch_set_service_enabled(const char *a1, int a2)
{
  return _launch_set_service_enabled_impl(a1, a2, 6u);
}

int64_t _launch_set_service_enabled_impl(const char *a1, int a2, unsigned int a3)
{
  xpc_object_t v6;
  uint64_t v7;
  xpc_object_t v8;
  int64_t v9;
  xpc_object_t object;

  v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v6, "type", a3);
  xpc_dictionary_set_uint64(v6, "handle", 0);
  if (a2)
    v7 = 808;
  else
    v7 = 809;
  v8 = xpc_array_create(0, 0);
  xpc_array_set_string(v8, 0xFFFFFFFFFFFFFFFFLL, a1);
  xpc_dictionary_set_value(v6, "names", v8);
  xpc_release(v8);
  object = 0;
  v9 = _xpc_domain_routine(v7, v6, &object);
  if (!(_DWORD)v9)
    xpc_release(object);
  xpc_release(v6);
  return v9;
}

int64_t launch_set_system_service_enabled(const char *a1, int a2)
{
  return _launch_set_service_enabled_impl(a1, a2, 1u);
}

int64_t launch_enable_directory(const char *a1)
{
  return _launch_enable_or_disable_directory(a1, 800);
}

int64_t _launch_enable_or_disable_directory(const char *a1, uint64_t a2)
{
  xpc_object_t v4;
  xpc_object_t v5;
  const char *v6;
  int64_t int64;
  const char *v8;
  _DWORD *value;
  void (*v10)(const char *, xpc_object_t);
  xpc_object_t xdict;

  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v4, a1, 0);
  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v5, "type", 7uLL);
  xpc_dictionary_set_uint64(v5, "handle", 0);
  xpc_dictionary_set_value(v5, "paths", v4);
  if ((_DWORD)a2 == 800)
    v6 = "enable";
  else
    v6 = "disable";
  xpc_dictionary_set_BOOL(v5, v6, 1);
  xdict = 0;
  int64 = _xpc_domain_routine(a2, v5, &xdict);
  if (!(_DWORD)int64)
  {
    if ((_DWORD)a2 == 800)
      v8 = "bootstrap-error";
    else
      v8 = "bootout-error";
    int64 = xpc_dictionary_get_int64(xdict, v8);
    value = xpc_dictionary_get_value(xdict, "errors");
    if (value)
    {
      if ((_DWORD)a2 == 800)
        v10 = _print_enable_error;
      else
        v10 = _print_disable_error;
      xpc_dictionary_apply_f(value, 0, (uint64_t)v10);
    }
    xpc_release(xdict);
  }
  xpc_release(v5);
  xpc_release(v4);
  return int64;
}

int64_t launch_disable_directory(const char *a1)
{
  return _launch_enable_or_disable_directory(a1, 801);
}

int64_t launch_create_persona(int a1)
{
  xpc_object_t v2;
  int64_t v3;
  xpc_object_t object;

  object = 0;
  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "type", 1uLL);
  xpc_dictionary_set_uint64(v2, "handle", 0);
  xpc_dictionary_set_uint64(v2, "uid", a1);
  v3 = _xpc_domain_routine(838, v2, &object);
  if (object)
    xpc_release(object);
  xpc_release(v2);
  return v3;
}

int64_t launch_destroy_persona(int a1)
{
  xpc_object_t v2;
  int64_t v3;
  xpc_object_t object;

  object = 0;
  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "type", 2uLL);
  xpc_dictionary_set_uint64(v2, "handle", a1);
  v3 = _xpc_domain_routine(801, v2, &object);
  if (object)
    xpc_release(object);
  xpc_release(v2);
  return v3;
}

uint64_t launch_path_for_user_service_4coresim()
{
  return 0;
}

char *launch_version_for_user_service_4coresim(const char *a1)
{
  xpc_object_t v2;
  uid_t v3;
  char *v4;
  xpc_object_t value;
  xpc_object_t v6;
  const char *string;
  xpc_object_t xdict;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "type", 2uLL);
  v3 = geteuid();
  xpc_dictionary_set_uint64(v2, "handle", v3);
  xpc_dictionary_set_string(v2, "name", a1);
  xdict = 0;
  if (_xpc_service_routine(712, v2, &xdict))
  {
    xpc_release(v2);
    return 0;
  }
  else
  {
    value = xpc_dictionary_get_value(xdict, "attrs");
    v6 = xpc_retain(value);
    xpc_release(xdict);
    xpc_release(v2);
    string = xpc_dictionary_get_string(v6, "version");
    if (string)
      v4 = _xpc_strdup(string);
    else
      v4 = 0;
    xpc_release(v6);
  }
  return v4;
}

int64_t launch_bootout_user_service_4coresim(const char *a1)
{
  xpc_object_t v2;
  uid_t v3;
  int64_t int64;
  _DWORD *value;
  xpc_object_t xdict;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "type", 2uLL);
  v3 = geteuid();
  xpc_dictionary_set_uint64(v2, "handle", v3);
  xpc_dictionary_set_string(v2, "name", a1);
  xdict = 0;
  int64 = _xpc_domain_routine(801, v2, &xdict);
  if (!(_DWORD)int64)
  {
    int64 = xpc_dictionary_get_int64(xdict, "bootout-error");
    value = xpc_dictionary_get_value(xdict, "errors");
    if (value)
      xpc_dictionary_apply_f(value, 0, (uint64_t)_print_disable_error);
    xpc_release(xdict);
  }
  xpc_release(v2);
  return int64;
}

void _print_disable_error(const char *a1, xpc_object_t xint)
{
  int value;
  char *v4;

  value = xpc_int64_get_value(xint);
  v4 = xpc_strerror(value);
  syslog(3, "Failed to disable path: code = %d: %s, %s", value, v4, a1);
}

int64_t launch_service_instance_create(const char *a1, const unsigned __int8 *a2)
{
  xpc_object_t request;
  int64_t v3;
  xpc_object_t object;

  request = _launchd_service_instance_create_request(a1, a2);
  object = 0;
  v3 = _xpc_service_routine(721, request, &object);
  if (object)
    xpc_release(object);
  xpc_release(request);
  return v3;
}

xpc_object_t _launchd_service_instance_create_request(const char *a1, const unsigned __int8 *a2)
{
  xpc_object_t v4;

  if (!a1)
    _xpc_rich_error_serialize_cold_1();
  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v4, "type", 7uLL);
  xpc_dictionary_set_uint64(v4, "handle", 0);
  xpc_dictionary_set_string(v4, "name", a1);
  xpc_dictionary_set_uuid(v4, "instance", a2);
  return v4;
}

void launch_service_instance_remove(const char *a1, const unsigned __int8 *a2, NSObject *a3, const void *a4)
{
  xpc_object_t request;
  int v7;
  unsigned int v8;
  unsigned int v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD block[5];
  int v15;
  xpc_object_t object[6];
  unsigned int v17;
  _QWORD handler[6];

  request = _launchd_service_instance_create_request(a1, a2);
  object[0] = 0;
  v7 = _xpc_service_routine(722, request, object);
  if (v7 || (v8 = xpc_dictionary_copy_mach_send(object[0], "monitor"), v8 - 1 > 0xFFFFFFFD))
  {
    v13 = _Block_copy(a4);
    block[0] = MEMORY[0x1E0C87450];
    block[1] = 0x40000000;
    block[2] = __launch_service_instance_remove_block_invoke;
    block[3] = &unk_1EA957E48;
    block[4] = v13;
    v15 = v7;
    dispatch_async(a3, block);
  }
  else
  {
    v9 = v8;
    v10 = _Block_copy(a4);
    v11 = dispatch_source_create(MEMORY[0x1E0C86F08], v9, 1uLL, a3);
    v12 = (void *)MEMORY[0x1E0C87450];
    handler[0] = MEMORY[0x1E0C87450];
    handler[1] = 0x40000000;
    handler[2] = ___launch_service_monitor_removal_port_block_invoke;
    handler[3] = &unk_1EA957EB0;
    handler[4] = v10;
    handler[5] = v11;
    dispatch_source_set_event_handler(v11, handler);
    object[1] = v12;
    object[2] = (xpc_object_t)0x40000000;
    object[3] = ___launch_service_monitor_removal_port_block_invoke_2;
    object[4] = &__block_descriptor_tmp_41;
    v17 = v9;
    object[5] = v11;
    dispatch_source_set_mandatory_cancel_handler();
    dispatch_activate(v11);
  }
  if (object[0])
    xpc_release(object[0]);
  xpc_release(request);
}

void __launch_service_instance_remove_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
}

xpc_object_t launch_service_instance_copy_uuids(const char *a1, _DWORD *a2)
{
  xpc_object_t empty;
  int v5;
  xpc_object_t v6;
  xpc_object_t array;
  xpc_object_t xdict;

  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(empty, "type", 7uLL);
  xpc_dictionary_set_uint64(empty, "handle", 0);
  xpc_dictionary_set_string(empty, "name", a1);
  xdict = 0;
  v5 = _xpc_service_routine(723, empty, &xdict);
  xpc_release(empty);
  if (v5)
  {
    v6 = 0;
    if (a2)
      *a2 = v5;
  }
  else
  {
    array = xpc_dictionary_get_array(xdict, "uuids");
    v6 = xpc_retain(array);
    xpc_release(xdict);
  }
  return v6;
}

int64_t launch_active_user_switch()
{
  xpc_object_t empty;
  int64_t v1;
  xpc_object_t object;

  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(empty, "type", 1uLL);
  xpc_dictionary_set_uint64(empty, "handle", 0);
  object = 0;
  v1 = _xpc_domain_routine(841, empty, &object);
  if (object)
    xpc_release(object);
  xpc_release(empty);
  return v1;
}

int64_t launch_active_user_login()
{
  xpc_object_t system;
  int64_t v1;
  xpc_object_t object;

  system = _xpc_domain_request_create_system();
  object = 0;
  v1 = _xpc_domain_routine(842, system, &object);
  if (object)
    xpc_release(object);
  xpc_release(system);
  return v1;
}

int64_t launch_active_user_logout()
{
  xpc_object_t system;
  int64_t v1;
  xpc_object_t object;

  system = _xpc_domain_request_create_system();
  object = 0;
  v1 = _xpc_domain_routine(843, system, &object);
  if (object)
    xpc_release(object);
  xpc_release(system);
  return v1;
}

int64_t launch_load_mounted_jetsam_properties(const char *a1)
{
  xpc_object_t empty;
  int64_t v3;
  xpc_object_t object;

  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(empty, "type", 1uLL);
  xpc_dictionary_set_uint64(empty, "handle", 0);
  xpc_dictionary_set_string(empty, "mount-point", a1);
  object = 0;
  v3 = _xpc_domain_routine(846, empty, &object);
  if (object)
    xpc_release(object);
  xpc_release(empty);
  return v3;
}

void launch_cryptex_terminate(const char *a1, NSObject *a2, const void *a3)
{
  xpc_object_t empty;
  uint64_t v7;
  int v8;
  int v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t block;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  void *v17;
  NSObject *v18;
  int v19;

  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(empty, "type", 1uLL);
  xpc_dictionary_set_uint64(empty, "handle", 0);
  xpc_dictionary_set_string(empty, "cryptex", a1);
  v7 = _xpc_mach_port_allocate(0, 1u, 0);
  v8 = _xpc_event_routine_async(847, empty, v7);
  if (v8)
  {
    v9 = v8;
    if (_xpc_mach_port_close_recv(v7, 0, 0))
      _xpc_alloc_cold_1();
    v10 = _Block_copy(a3);
    block = MEMORY[0x1E0C87450];
    v14 = 0x40000000;
    v15 = ___launch_domain_routine_async_block_invoke;
    v16 = &unk_1EA957EF8;
    v17 = v10;
    LODWORD(v18) = v9;
    dispatch_async(a2, &block);
  }
  else
  {
    v11 = dispatch_source_create(MEMORY[0x1E0C86F00], v7, 0, a2);
    v12 = _Block_copy(a3);
    block = MEMORY[0x1E0C87450];
    v14 = 0x40000000;
    v15 = ___launch_domain_routine_async_block_invoke_2;
    v16 = &unk_1EA957F20;
    v19 = v7;
    v17 = v12;
    v18 = v11;
    dispatch_source_set_event_handler(v11, &block);
    dispatch_source_set_mandatory_cancel_handler();
    dispatch_activate(v11);
  }
  xpc_release(empty);
}

int64_t launch_userspace_reboot_with_purpose(uint64_t a1)
{
  xpc_object_t empty;
  int64_t v3;
  xpc_object_t object;

  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(empty, "type", 1uLL);
  xpc_dictionary_set_uint64(empty, "handle", 0);
  xpc_dictionary_set_uint64(empty, "flags", 0x2100000000000000uLL);
  xpc_dictionary_set_uint64(empty, "userreboot_purpose", a1);
  object = 0;
  v3 = _xpc_domain_routine(821, empty, &object);
  if (object)
    xpc_release(object);
  xpc_release(empty);
  return v3;
}

uint64_t ___xpc_telemetry_log_handle_block_invoke()
{
  uint64_t result;

  getpid();
  csops();
  result = MEMORY[0x1E0C88EA0];
  _xpc_telemetry_log_handle__log = MEMORY[0x1E0C88EA0];
  return result;
}

void _print_enable_error(const char *a1, xpc_object_t xint)
{
  int value;
  char *v4;

  value = xpc_int64_get_value(xint);
  v4 = xpc_strerror(value);
  syslog(3, "Failed to enable path: code = %d: %s, %s", value, v4, a1);
}

void ___launch_service_monitor_removal_port_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
}

void ___launch_service_monitor_removal_port_block_invoke_2(uint64_t a1)
{
  if (_xpc_mach_port_release(*(_DWORD *)(a1 + 40)))
    _os_assumes_log();
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
}

void ___launch_domain_routine_async_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
}

void ___launch_domain_routine_async_block_invoke_2(uint64_t a1)
{
  xpc_object_t xdict;

  xdict = 0;
  if (!xpc_pipe_receive(*(_DWORD *)(a1 + 48), &xdict, 0))
  {
    xpc_dictionary_get_int64(xdict, "error");
    xpc_release(xdict);
    xdict = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
}

void ___launch_domain_routine_async_block_invoke_3(uint64_t a1)
{
  if (_xpc_mach_port_close_recv(*(_DWORD *)(a1 + 40), 0, 0))
    _xpc_alloc_cold_1();
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
}

__objc2_class *_xpc_type_from_id(unsigned int a1)
{
  if (a1 >= 0x1E000)
    _xpc_type_from_id_cold_1();
  return OS_xpc_object[2 * (a1 >> 12)];
}

uint64_t _xpc_wire_length_from_wire_id(unsigned int a1)
{
  if (a1 >= 0x1E000)
    _xpc_type_from_id_cold_1();
  return *((_QWORD *)&_xpc_vtables + 20 * (a1 >> 12) + 11);
}

uint64_t _xpc_deserialize_from_wire_id(unsigned int a1)
{
  if ((_BYTE)a1)
    _xpc_deserialize_from_wire_id_cold_2(a1);
  if (a1 >= 0x1E000)
    _xpc_type_from_id_cold_1();
  return *((_QWORD *)&_xpc_vtables + 20 * (a1 >> 12) + 10);
}

BOOL _xpc_class_id_from_wire_valid(int a1)
{
  return (a1 & 0xFFF00F00) == 0 && (a1 - 4096) < 0x1D000;
}

BOOL _xpc_class_id_valid(int a1)
{
  return (a1 & 0xFFF00FFF) == 0 && (a1 - 4096) < 0x1D000;
}

uint64_t _xpc_base_copy()
{
  return 0;
}

uint64_t _xpc_base_hash()
{
  return 0;
}

uint64_t _xpc_base_desc(unint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  int v8;
  int *extension_vtable;
  unint64_t v10;
  unsigned int v13;
  int v14;
  char *v16;
  char __str[16];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C874D8];
  if (((unint64_t)a1 & 0x8000000000000000) != 0)
  {
    v3 = 0;
    v4 = *MEMORY[0x1E0DE7C58];
    if ((~(unint64_t)a1 & 0xC000000000000007) == 0)
      v4 = 0;
    v5 = v4 ^ (unint64_t)a1;
    do
    {
      if ((v5 & 7) == *(_BYTE *)(MEMORY[0x1E0DE7C48] + v3))
        break;
      ++v3;
    }
    while (v3 != 7);
    v6 = v3 | v5;
    v7 = v3 & 7;
    v8 = (v6 >> 55) + 8;
    if (v7 == 7)
      LODWORD(v7) = v8;
    if ((_DWORD)v7 == 12)
    {
      extension_vtable = &_OS_xpc_type_uint64;
    }
    else
    {
      if ((_DWORD)v7 != 13)
      {
        v16 = _xpc_asprintf("Object is not an XPC object");
        _xpc_api_misuse(v16);
      }
      extension_vtable = &_OS_xpc_type_int64;
    }
  }
  else
  {
    v10 = *a1;
    if (*a1 >= (unint64_t)OBJC_CLASS___OS_xpc_object
      && v10 <= (unint64_t)OS_xpc_rich_error
      && (*a1 & 7) == 0)
    {
      extension_vtable = (int *)((char *)&_xpc_vtables + 2 * (v10 - (_QWORD)OBJC_CLASS___OS_xpc_object));
    }
    else
    {
      extension_vtable = _xpc_get_extension_vtable(a1);
    }
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  *(_OWORD *)__str = 0u;
  v18 = 0u;
  v13 = snprintf(__str, 0x80uLL, "<%s>", *((const char **)extension_vtable + 1));
  if (v13 >= 0x7F)
    v14 = 127;
  else
    v14 = v13;
  return _xpc_serializer_append(a2, __str, (v14 + 1), 0);
}

uint64_t _xpc_base_debug_desc(id a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  int v9;
  int *extension_vtable;
  unint64_t v11;
  unsigned int v14;
  int v15;
  char *v17;
  char __str[16];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C874D8];
  if (((unint64_t)a1 & 0x8000000000000000) != 0)
  {
    v4 = 0;
    v5 = *MEMORY[0x1E0DE7C58];
    if ((~(unint64_t)a1 & 0xC000000000000007) == 0)
      v5 = 0;
    v6 = v5 ^ (unint64_t)a1;
    do
    {
      if ((v6 & 7) == *(_BYTE *)(MEMORY[0x1E0DE7C48] + v4))
        break;
      ++v4;
    }
    while (v4 != 7);
    v7 = v4 | v6;
    v8 = v4 & 7;
    v9 = (v7 >> 55) + 8;
    if (v8 == 7)
      LODWORD(v8) = v9;
    if ((_DWORD)v8 == 12)
    {
      extension_vtable = &_OS_xpc_type_uint64;
    }
    else
    {
      if ((_DWORD)v8 != 13)
      {
        v17 = _xpc_asprintf("Object is not an XPC object");
        _xpc_api_misuse(v17);
      }
      extension_vtable = &_OS_xpc_type_int64;
    }
  }
  else
  {
    v11 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= (unint64_t)OS_xpc_object
      && v11 <= (unint64_t)OS_xpc_rich_error
      && (*(_QWORD *)a1 & 7) == 0)
    {
      extension_vtable = (int *)((char *)&_xpc_vtables + 2 * (v11 - (_QWORD)OS_xpc_object));
    }
    else
    {
      extension_vtable = _xpc_get_extension_vtable(a1);
    }
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  *(_OWORD *)__str = 0u;
  v19 = 0u;
  v14 = snprintf(__str, 0x80uLL, "<%s: %p>", *((const char **)extension_vtable + 1), a1);
  if (v14 >= 0x7F)
    v15 = 127;
  else
    v15 = v14;
  return _xpc_serializer_append(a2, __str, (v15 + 1), 0);
}

uint64_t _xpc_base_debug(id a1, char *__str, size_t __size)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  int v11;
  int *extension_vtable;
  size_t v13;
  __objc2_class *v14;
  const char *v17;
  char *v18;
  size_t v19;
  __objc2_class *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  int v26;
  int *v27;
  uint64_t v30;
  size_t v31;
  char *v33;

  if (__size < 2)
  {
    v13 = 0;
  }
  else
  {
    if (((unint64_t)a1 & 0x8000000000000000) != 0)
    {
      v6 = 0;
      v7 = *MEMORY[0x1E0DE7C58];
      if ((~(unint64_t)a1 & 0xC000000000000007) == 0)
        v7 = 0;
      v8 = v7 ^ (unint64_t)a1;
      do
      {
        if ((v8 & 7) == *(_BYTE *)(MEMORY[0x1E0DE7C48] + v6))
          break;
        ++v6;
      }
      while (v6 != 7);
      v9 = v6 | v8;
      v10 = v6 & 7;
      v11 = (v9 >> 55) + 8;
      if (v10 == 7)
        LODWORD(v10) = v11;
      if ((_DWORD)v10 == 12)
      {
        extension_vtable = &_OS_xpc_type_uint64;
      }
      else
      {
        if ((_DWORD)v10 != 13)
          goto LABEL_58;
        extension_vtable = &_OS_xpc_type_int64;
      }
    }
    else
    {
      v14 = *(__objc2_class **)a1;
      if (*(_QWORD *)a1 >= (unint64_t)OBJC_CLASS___OS_xpc_object
        && v14 <= OS_xpc_rich_error
        && (*(_QWORD *)a1 & 7) == 0)
      {
        extension_vtable = (int *)((char *)&_xpc_vtables + 2 * ((char *)v14 - (char *)OBJC_CLASS___OS_xpc_object));
      }
      else
      {
        extension_vtable = _xpc_get_extension_vtable(a1);
      }
    }
    if ((*((_DWORD *)a1 + 4) & 1) != 0)
      v17 = " (from wire)";
    else
      v17 = (const char *)&unk_1DEEBE00B;
    v13 = snprintf(__str, __size, "%s[%p]%s: { refcnt = %x, xrefcnt = %x", *((const char **)extension_vtable + 1), a1, v17, *((_DWORD *)a1 + 2), *((_DWORD *)a1 + 3));
    if (v13 >= __size)
      v13 = __size - 1;
  }
  v18 = &__str[v13];
  v19 = __size - v13;
  v20 = *(__objc2_class **)a1;
  if (*(__objc2_class **)a1 == OBJC_CLASS___OS_xpc_object)
    goto LABEL_52;
  if (((unint64_t)a1 & 0x8000000000000000) == 0)
  {
    if (v20 >= OBJC_CLASS___OS_xpc_object && v20 <= OS_xpc_rich_error && (*(_QWORD *)a1 & 7) == 0)
      v27 = (int *)((char *)&_xpc_vtables + 2 * ((char *)v20 - (char *)OBJC_CLASS___OS_xpc_object));
    else
      v27 = _xpc_get_extension_vtable(a1);
    goto LABEL_51;
  }
  v21 = 0;
  v22 = *MEMORY[0x1E0DE7C58];
  if ((~(unint64_t)a1 & 0xC000000000000007) == 0)
    v22 = 0;
  v23 = v22 ^ (unint64_t)a1;
  do
  {
    if ((v23 & 7) == *(_BYTE *)(MEMORY[0x1E0DE7C48] + v21))
      break;
    ++v21;
  }
  while (v21 != 7);
  v24 = v21 | v23;
  v25 = v21 & 7;
  v26 = (v24 >> 55) + 8;
  if (v25 == 7)
    LODWORD(v25) = v26;
  if ((_DWORD)v25 == 12)
  {
    v27 = &_OS_xpc_type_uint64;
    goto LABEL_51;
  }
  if ((_DWORD)v25 != 13)
  {
LABEL_58:
    v33 = _xpc_asprintf("Object is not an XPC object");
    _xpc_api_misuse(v33);
  }
  v27 = &_OS_xpc_type_int64;
LABEL_51:
  v30 = (*((uint64_t (**)(id, char *, size_t))v27 + 8))(a1, v18, v19);
  v18 += v30;
  v19 -= v30;
LABEL_52:
  if (v19 < 2)
  {
    v31 = 0;
  }
  else
  {
    v31 = snprintf(v18, v19, " }");
    if (v19 <= v31)
      v31 = v19 - 1;
  }
  return &v18[v31] - __str;
}

uint64_t _xpc_base_deserialize()
{
  return 0;
}

uint64_t _xpc_base_wire_length()
{
  return -1;
}

uint64_t _xpc_object_pad(char *__str, size_t __size, uint64_t a3)
{
  char *v4;
  uint64_t v5;
  size_t v7;

  v4 = __str;
  if (a3)
  {
    v5 = a3;
    v4 = __str;
    do
    {
      if (__size < 2)
      {
        v7 = 0;
      }
      else
      {
        v7 = snprintf(v4, __size, "\t");
        if (__size <= v7)
          v7 = __size - 1;
      }
      v4 += v7;
      __size -= v7;
      --v5;
    }
    while (v5);
  }
  return v4 - __str;
}

uint64_t _xpc_base_create()
{
  return _os_object_alloc_realized();
}

unsigned int *_xpc_wire_length(uint64_t a1)
{
  unsigned int *result;

  result = (unsigned int *)_xpc_graph_deserializer_read(a1, 4uLL);
  if (result)
    return (unsigned int *)*result;
  return result;
}

uint64_t _xpc_retain(uint64_t result)
{
  if ((result & 0x8000000000000000) == 0)
    return _os_object_retain_internal();
  return result;
}

uint64_t _xpc_retain_with_resurrect(uint64_t result)
{
  if ((result & 0x8000000000000000) == 0)
    return _os_object_retain_with_resurrect();
  return result;
}

uint64_t _xpc_release(uint64_t result)
{
  if ((result & 0x8000000000000000) == 0)
    return _os_object_release_internal();
  return result;
}

uint64_t _xpc_dispose(id a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  int v7;
  int *extension_vtable;
  unint64_t v9;
  char *v13;

  if (((unint64_t)a1 & 0x8000000000000000) != 0)
  {
    v2 = 0;
    v3 = *MEMORY[0x1E0DE7C58];
    if ((~(unint64_t)a1 & 0xC000000000000007) == 0)
      v3 = 0;
    v4 = v3 ^ (unint64_t)a1;
    do
    {
      if ((v4 & 7) == *(_BYTE *)(MEMORY[0x1E0DE7C48] + v2))
        break;
      ++v2;
    }
    while (v2 != 7);
    v5 = v2 | v4;
    v6 = v2 & 7;
    v7 = (v5 >> 55) + 8;
    if (v6 == 7)
      LODWORD(v6) = v7;
    if ((_DWORD)v6 == 12)
    {
      extension_vtable = &_OS_xpc_type_uint64;
    }
    else
    {
      if ((_DWORD)v6 != 13)
      {
        v13 = _xpc_asprintf("Object is not an XPC object");
        _xpc_api_misuse(v13);
      }
      extension_vtable = &_OS_xpc_type_int64;
    }
  }
  else
  {
    v9 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= (unint64_t)OBJC_CLASS___OS_xpc_object
      && v9 <= (unint64_t)OS_xpc_rich_error
      && (*(_QWORD *)a1 & 7) == 0)
    {
      extension_vtable = (int *)((char *)&_xpc_vtables + 2 * (v9 - (_QWORD)OBJC_CLASS___OS_xpc_object));
    }
    else
    {
      extension_vtable = _xpc_get_extension_vtable(a1);
    }
  }
  return (*((uint64_t (**)(id))extension_vtable + 12))(a1);
}

xpc_object_t xpc_copy(xpc_object_t object)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  int v7;
  int *extension_vtable;
  unint64_t v9;
  char *v13;

  if (((unint64_t)object & 0x8000000000000000) != 0)
  {
    v2 = 0;
    v3 = *MEMORY[0x1E0DE7C58];
    if ((~(unint64_t)object & 0xC000000000000007) == 0)
      v3 = 0;
    v4 = v3 ^ (unint64_t)object;
    do
    {
      if ((v4 & 7) == *(_BYTE *)(MEMORY[0x1E0DE7C48] + v2))
        break;
      ++v2;
    }
    while (v2 != 7);
    v5 = v2 | v4;
    v6 = v2 & 7;
    v7 = (v5 >> 55) + 8;
    if (v6 == 7)
      LODWORD(v6) = v7;
    if ((_DWORD)v6 == 12)
    {
      extension_vtable = &_OS_xpc_type_uint64;
    }
    else
    {
      if ((_DWORD)v6 != 13)
      {
        v13 = _xpc_asprintf("Object is not an XPC object");
        _xpc_api_misuse(v13);
      }
      extension_vtable = &_OS_xpc_type_int64;
    }
  }
  else
  {
    v9 = *(_QWORD *)object;
    if (*(_QWORD *)object >= (unint64_t)OS_xpc_object
      && v9 <= (unint64_t)OS_xpc_rich_error
      && (*(_QWORD *)object & 7) == 0)
    {
      extension_vtable = (int *)((char *)&_xpc_vtables + 2 * (v9 - (_QWORD)OS_xpc_object));
    }
    else
    {
      extension_vtable = _xpc_get_extension_vtable(object);
    }
  }
  return (xpc_object_t)(*((uint64_t (**)(xpc_object_t))extension_vtable + 2))(object);
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  objc_class *Class;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  int v11;
  int *extension_vtable;
  unint64_t v13;
  char *v16;

  Class = object_getClass(object1);
  if (Class != object_getClass(object2))
    return 0;
  if (((unint64_t)object1 & 0x8000000000000000) != 0)
  {
    v6 = 0;
    v7 = *MEMORY[0x1E0DE7C58];
    if ((~(unint64_t)object1 & 0xC000000000000007) == 0)
      v7 = 0;
    v8 = v7 ^ (unint64_t)object1;
    do
    {
      if ((v8 & 7) == *(_BYTE *)(MEMORY[0x1E0DE7C48] + v6))
        break;
      ++v6;
    }
    while (v6 != 7);
    v9 = v6 | v8;
    v10 = v6 & 7;
    v11 = (v9 >> 55) + 8;
    if (v10 == 7)
      LODWORD(v10) = v11;
    if ((_DWORD)v10 == 12)
    {
      extension_vtable = &_OS_xpc_type_uint64;
    }
    else
    {
      if ((_DWORD)v10 != 13)
      {
        v16 = _xpc_asprintf("Object is not an XPC object");
        _xpc_api_misuse(v16);
      }
      extension_vtable = &_OS_xpc_type_int64;
    }
  }
  else
  {
    v13 = *(_QWORD *)object1;
    if (*(_QWORD *)object1 >= (unint64_t)OS_xpc_object
      && v13 <= (unint64_t)OS_xpc_rich_error
      && (*(_QWORD *)object1 & 7) == 0)
    {
      extension_vtable = (int *)((char *)&_xpc_vtables + 2 * (v13 - (_QWORD)OS_xpc_object));
    }
    else
    {
      extension_vtable = _xpc_get_extension_vtable(object1);
    }
  }
  return (*((uint64_t (**)(xpc_object_t, xpc_object_t))extension_vtable + 3))(object1, object2);
}

const char *__cdecl xpc_type_get_name(xpc_type_t type)
{
  char *extension_type_vtable;

  if (type >= (xpc_type_t)OBJC_CLASS___OS_xpc_object
    && type <= (xpc_type_t)OS_xpc_rich_error
    && (type & 7) == 0)
  {
    extension_type_vtable = (char *)&_xpc_vtables + 2 * (type - (xpc_type_t)OBJC_CLASS___OS_xpc_object);
  }
  else
  {
    extension_type_vtable = (char *)_xpc_get_extension_type_vtable((uint64_t)type);
    if (!extension_type_vtable)
      return "<unknown>";
  }
  return (const char *)*((_QWORD *)extension_type_vtable + 1);
}

char *xpc_copy_short_description(unint64_t *a1)
{
  const char **v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  int v8;
  int *extension_vtable;
  unint64_t v10;
  void (*v13)(unint64_t *, const char **);
  char *v14;
  char *v16;

  v2 = (const char **)_xpc_serializer_create_for_description();
  if (((unint64_t)a1 & 0x8000000000000000) != 0)
  {
    v3 = 0;
    v4 = *MEMORY[0x1E0DE7C58];
    if ((~(unint64_t)a1 & 0xC000000000000007) == 0)
      v4 = 0;
    v5 = v4 ^ (unint64_t)a1;
    do
    {
      if ((v5 & 7) == *(_BYTE *)(MEMORY[0x1E0DE7C48] + v3))
        break;
      ++v3;
    }
    while (v3 != 7);
    v6 = v3 | v5;
    v7 = v3 & 7;
    v8 = (v6 >> 55) + 8;
    if (v7 == 7)
      LODWORD(v7) = v8;
    if ((_DWORD)v7 == 12)
    {
      extension_vtable = &_OS_xpc_type_uint64;
    }
    else
    {
      if ((_DWORD)v7 != 13)
      {
        v16 = _xpc_asprintf("Object is not an XPC object");
        _xpc_api_misuse(v16);
      }
      extension_vtable = &_OS_xpc_type_int64;
    }
  }
  else
  {
    v10 = *a1;
    if (*a1 >= (unint64_t)OS_xpc_object
      && v10 <= (unint64_t)OS_xpc_rich_error
      && (*a1 & 7) == 0)
    {
      extension_vtable = (int *)((char *)&_xpc_vtables + 2 * (v10 - (_QWORD)OS_xpc_object));
    }
    else
    {
      extension_vtable = _xpc_get_extension_vtable(a1);
    }
  }
  v13 = (void (*)(unint64_t *, const char **))*((_QWORD *)extension_vtable + 5);
  if (!v13)
    v13 = (void (*)(unint64_t *, const char **))*((_QWORD *)extension_vtable + 6);
  v13(a1, v2);
  v14 = _xpc_strdup(v2[4]);
  xpc_release(v2);
  return v14;
}

char *xpc_copy_clean_description(unint64_t *a1)
{
  const char **v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  int v8;
  int *extension_vtable;
  unint64_t v10;
  char *v13;
  char *v15;

  v2 = (const char **)_xpc_serializer_create_for_description();
  if (((unint64_t)a1 & 0x8000000000000000) != 0)
  {
    v3 = 0;
    v4 = *MEMORY[0x1E0DE7C58];
    if ((~(unint64_t)a1 & 0xC000000000000007) == 0)
      v4 = 0;
    v5 = v4 ^ (unint64_t)a1;
    do
    {
      if ((v5 & 7) == *(_BYTE *)(MEMORY[0x1E0DE7C48] + v3))
        break;
      ++v3;
    }
    while (v3 != 7);
    v6 = v3 | v5;
    v7 = v3 & 7;
    v8 = (v6 >> 55) + 8;
    if (v7 == 7)
      LODWORD(v7) = v8;
    if ((_DWORD)v7 == 12)
    {
      extension_vtable = &_OS_xpc_type_uint64;
    }
    else
    {
      if ((_DWORD)v7 != 13)
      {
        v15 = _xpc_asprintf("Object is not an XPC object");
        _xpc_api_misuse(v15);
      }
      extension_vtable = &_OS_xpc_type_int64;
    }
  }
  else
  {
    v10 = *a1;
    if (*a1 >= (unint64_t)OBJC_CLASS___OS_xpc_object
      && v10 <= (unint64_t)OS_xpc_rich_error
      && (*a1 & 7) == 0)
    {
      extension_vtable = (int *)((char *)&_xpc_vtables + 2 * (v10 - (_QWORD)OBJC_CLASS___OS_xpc_object));
    }
    else
    {
      extension_vtable = _xpc_get_extension_vtable(a1);
    }
  }
  (*((void (**)(unint64_t *, const char **))extension_vtable + 6))(a1, v2);
  v13 = _xpc_strdup(v2[4]);
  xpc_release(v2);
  return v13;
}

char *xpc_copy_debug_description(unint64_t *a1)
{
  const char **v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  int v8;
  int *extension_vtable;
  unint64_t v10;
  void (*v13)(unint64_t *, const char **);
  char *v14;
  char *v16;

  v2 = (const char **)_xpc_serializer_create_for_description();
  if (((unint64_t)a1 & 0x8000000000000000) != 0)
  {
    v3 = 0;
    v4 = *MEMORY[0x1E0DE7C58];
    if ((~(unint64_t)a1 & 0xC000000000000007) == 0)
      v4 = 0;
    v5 = v4 ^ (unint64_t)a1;
    do
    {
      if ((v5 & 7) == *(_BYTE *)(MEMORY[0x1E0DE7C48] + v3))
        break;
      ++v3;
    }
    while (v3 != 7);
    v6 = v3 | v5;
    v7 = v3 & 7;
    v8 = (v6 >> 55) + 8;
    if (v7 == 7)
      LODWORD(v7) = v8;
    if ((_DWORD)v7 == 12)
    {
      extension_vtable = &_OS_xpc_type_uint64;
    }
    else
    {
      if ((_DWORD)v7 != 13)
      {
        v16 = _xpc_asprintf("Object is not an XPC object");
        _xpc_api_misuse(v16);
      }
      extension_vtable = &_OS_xpc_type_int64;
    }
  }
  else
  {
    v10 = *a1;
    if (*a1 >= (unint64_t)OS_xpc_object
      && v10 <= (unint64_t)OS_xpc_rich_error
      && (*a1 & 7) == 0)
    {
      extension_vtable = (int *)((char *)&_xpc_vtables + 2 * (v10 - (_QWORD)OS_xpc_object));
    }
    else
    {
      extension_vtable = _xpc_get_extension_vtable(a1);
    }
  }
  v13 = (void (*)(unint64_t *, const char **))*((_QWORD *)extension_vtable + 7);
  if (!v13)
    v13 = (void (*)(unint64_t *, const char **))*((_QWORD *)extension_vtable + 6);
  v13(a1, v2);
  v14 = _xpc_strdup(v2[4]);
  xpc_release(v2);
  return v14;
}

uint64_t _xpc_make_serialization_with_ool_impl(unint64_t *a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  int v12;
  int *extension_vtable;
  uint64_t v14;
  unint64_t v15;
  void (__cdecl *v18)(void *);
  char *v20;

  if (a3)
  {
    v6 = (_QWORD *)_xpc_serializer_create_for_data();
    v6[13] = a3;
    if (((unint64_t)a1 & 0x8000000000000000) != 0)
    {
LABEL_3:
      v7 = 0;
      v8 = *MEMORY[0x1E0DE7C58];
      if ((~(unint64_t)a1 & 0xC000000000000007) == 0)
        v8 = 0;
      v9 = v8 ^ (unint64_t)a1;
      do
      {
        if ((v9 & 7) == *(_BYTE *)(MEMORY[0x1E0DE7C48] + v7))
          break;
        ++v7;
      }
      while (v7 != 7);
      v10 = v7 | v9;
      v11 = v7 & 7;
      v12 = (v10 >> 55) + 8;
      if (v11 == 7)
        LODWORD(v11) = v12;
      if ((_DWORD)v11 == 12)
      {
        extension_vtable = &_OS_xpc_type_uint64;
      }
      else
      {
        if ((_DWORD)v11 != 13)
        {
          v20 = _xpc_asprintf("Object is not an XPC object");
          _xpc_api_misuse(v20);
        }
        extension_vtable = &_OS_xpc_type_int64;
      }
      goto LABEL_26;
    }
  }
  else
  {
    if (_contains_ool(a1))
      return 0;
    v6 = (_QWORD *)_xpc_serializer_create_for_data();
    if (((unint64_t)a1 & 0x8000000000000000) != 0)
      goto LABEL_3;
  }
  v15 = *a1;
  if (*a1 >= (unint64_t)OS_xpc_object
    && v15 <= (unint64_t)OS_xpc_rich_error
    && (*a1 & 7) == 0)
  {
    extension_vtable = (int *)((char *)&_xpc_vtables + 2 * (v15 - (_QWORD)OS_xpc_object));
  }
  else
  {
    extension_vtable = _xpc_get_extension_vtable(a1);
  }
LABEL_26:
  (*((void (**)(unint64_t *, _QWORD *))extension_vtable + 9))(a1, v6);
  v18 = (void (__cdecl *)(void *))v6[8];
  *a2 = v6[5] - v6[7];
  if (v18 != _xpc_serializer_free)
    _xpc_rich_error_serialize_cold_1();
  v14 = v6[4];
  v6[4] = 0;
  v6[8] = 0;
  xpc_release(v6);
  return v14;
}

uint64_t xpc_make_serialization(unint64_t *a1, _QWORD *a2)
{
  return _xpc_make_serialization_with_ool_impl(a1, a2, 0);
}

id _xpc_create_from_serialization_with_ool_impl(const void *a1, size_t a2, uint64_t a3)
{
  id result;
  void *v5;
  uint64_t v6;

  result = _xpc_payload_create_from_data(a1, a2);
  if (result)
  {
    v5 = result;
    v6 = xpc_graph_unpack_with_ool(0, (uint64_t)result, a3);
    xpc_release(v5);
    return (id)v6;
  }
  return result;
}

id xpc_create_from_serialization(const void *a1, size_t a2)
{
  return _xpc_create_from_serialization_with_ool_impl(a1, a2, 0);
}

uint64_t xpc_exit_reason_get_label(int a1)
{
  return __xpc_enum2label(a1, (uint64_t)&xpc_exit_reason_get_label_reasons, 9);
}

BOOL _contains_ool(void *a1)
{
  __objc2_class *Class;
  uint64_t v3;
  __objc2_class *v4;
  _BOOL8 v5;
  uint64_t *v6;
  size_t count;
  size_t v8;
  size_t v9;
  xpc_object_t value;
  int v11;
  _QWORD applier[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  Class = (__objc2_class *)object_getClass(a1);
  v14 = 0;
  v15 = &v14;
  v16 = 0x2000000000;
  v17 = 0;
  if (Class == OS_xpc_fd)
  {
LABEL_6:
    v5 = 1;
  }
  else
  {
    v3 = 1;
    while (v3 != 8)
    {
      v4 = _xpc_ool_types[v3++];
      if (v4 == Class)
      {
        if ((unint64_t)(v3 - 2) < 7)
          goto LABEL_6;
        break;
      }
    }
    if (Class == OS_xpc_dictionary)
    {
      applier[0] = MEMORY[0x1E0C87450];
      applier[1] = 0x40000000;
      applier[2] = ___contains_ool_block_invoke;
      applier[3] = &unk_1EA957FF8;
      applier[4] = &v14;
      xpc_dictionary_apply(a1, applier);
      v6 = v15;
    }
    else if (Class == OS_xpc_array)
    {
      count = xpc_array_get_count(a1);
      v6 = v15;
      if (count && !*((_BYTE *)v15 + 24))
      {
        v8 = 0;
        v9 = count - 1;
        do
        {
          value = xpc_array_get_value(a1, v8);
          v11 = _contains_ool(value);
          v6 = v15;
          *((_BYTE *)v15 + 24) = v11;
          if (v9 == v8)
            break;
          ++v8;
        }
        while (!v11);
      }
    }
    else
    {
      v6 = &v14;
    }
    v5 = *((unsigned __int8 *)v6 + 24) != 0;
  }
  _Block_object_dispose(&v14, 8);
  return v5;
}

uint64_t ___contains_ool_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v4;

  v4 = _contains_ool(a3);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
  return v4 ^ 1u;
}

unint64_t _xpc_array_copy(uint64_t a1)
{
  unint64_t v2;
  unint64_t v3;
  xpc_object_t v4;

  v2 = _xpc_array_create(*(unsigned int *)(a1 + 36));
  if (*(_DWORD *)(a1 + 32))
  {
    v3 = 0;
    do
    {
      v4 = xpc_copy(*(xpc_object_t *)(*(_QWORD *)(a1 + 24) + 8 * v3));
      _xpc_array_insert(v2, v3, v4);
      xpc_release(v4);
      ++v3;
    }
    while (v3 < *(unsigned int *)(a1 + 32));
  }
  return v2;
}

BOOL _xpc_array_equal(uint64_t a1, uint64_t a2)
{
  int v2;
  unint64_t v5;
  _BOOL4 v6;
  unint64_t v7;

  v2 = *(_DWORD *)(a1 + 32);
  if (v2 != *(_DWORD *)(a2 + 32))
    return 0;
  if (v2)
  {
    v5 = 0;
    do
    {
      v6 = xpc_equal(*(xpc_object_t *)(*(_QWORD *)(a1 + 24) + 8 * v5), *(xpc_object_t *)(*(_QWORD *)(a2 + 24) + 8 * v5));
      v7 = *(unsigned int *)(a1 + 32);
      if (!v6)
        break;
      ++v5;
    }
    while (v5 < v7);
  }
  else
  {
    v7 = 0;
    v5 = 0;
  }
  return v5 == v7;
}

uint64_t _xpc_array_hash(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;

  if (!*(_DWORD *)(a1 + 32))
    return 0;
  v2 = 0;
  v3 = 0;
  do
    v3 += xpc_hash(*(xpc_object_t *)(*(_QWORD *)(a1 + 24) + 8 * v2++));
  while (v2 < *(unsigned int *)(a1 + 32));
  return v3;
}

uint64_t _xpc_array_short_desc(uint64_t a1, uint64_t a2)
{
  unsigned int v3;
  int v4;
  char __str[16];
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C874D8];
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  *(_OWORD *)__str = 0u;
  v7 = 0u;
  v3 = snprintf(__str, 0x80uLL, "[<count = %u>]", *(_DWORD *)(a1 + 32));
  if (v3 >= 0x7F)
    v4 = 127;
  else
    v4 = v3;
  return _xpc_serializer_append(a2, __str, (v4 + 1), 0);
}

uint64_t _xpc_array_desc(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  size_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  uint64_t v13;
  size_t v14;
  unint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  int v21;
  int *extension_vtable;
  unint64_t v23;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v30;
  char __str[16];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C874D8];
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  *(_OWORD *)__str = 0u;
  v32 = 0u;
  v4 = snprintf(__str, 0x80uLL, "[<capacity = %u>\n", *(_DWORD *)(a1 + 36));
  if (v4 >= 0x7F)
    v5 = 127;
  else
    v5 = v4;
  _xpc_serializer_append(a2, __str, v5, 0);
  v6 = _xpc_serializer_pad(a2);
  if (*(_DWORD *)(a1 + 32))
  {
    v7 = v6;
    v8 = 0;
    v9 = MEMORY[0x1E0DE7C48];
    do
    {
      v10 = _xpc_object_pad(__str, 0x80uLL, v7);
      v11 = &__str[v10];
      v12 = 128 - v10;
      if ((unint64_t)(128 - v10) < 2)
      {
        v14 = 0;
      }
      else
      {
        v13 = v10;
        v14 = snprintf(&__str[v10], v12, "%lu: ", v8);
        if (v12 <= v14)
          v14 = 127 - v13;
      }
      _xpc_serializer_append(a2, __str, &v11[v14] - __str, 0);
      v15 = *(unint64_t **)(*(_QWORD *)(a1 + 24) + 8 * v8);
      if (((unint64_t)v15 & 0x8000000000000000) != 0)
      {
        v16 = 0;
        v17 = *MEMORY[0x1E0DE7C58];
        if ((~(unint64_t)v15 & 0xC000000000000007) == 0)
          v17 = 0;
        v18 = v17 ^ (unint64_t)v15;
        do
        {
          if ((v18 & 7) == *(_BYTE *)(v9 + v16))
            break;
          ++v16;
        }
        while (v16 != 7);
        v19 = v16 | v18;
        v20 = v16 & 7;
        v21 = (v19 >> 55) + 8;
        if (v20 == 7)
          LODWORD(v20) = v21;
        extension_vtable = &_OS_xpc_type_uint64;
        if ((_DWORD)v20 != 12)
        {
          if ((_DWORD)v20 != 13)
          {
            v30 = _xpc_asprintf("Object is not an XPC object");
            _xpc_api_misuse(v30);
          }
          extension_vtable = &_OS_xpc_type_int64;
        }
      }
      else
      {
        v23 = *v15;
        if (*v15 >= (unint64_t)OS_xpc_object
          && v23 <= (unint64_t)OS_xpc_rich_error
          && (*v15 & 7) == 0)
        {
          extension_vtable = (int *)((char *)&_xpc_vtables + 2 * (v23 - (_QWORD)OS_xpc_object));
        }
        else
        {
          extension_vtable = _xpc_get_extension_vtable(v15);
        }
      }
      (*((void (**)(unint64_t *, uint64_t))extension_vtable + 6))(v15, a2);
      v26 = *(_QWORD *)(a2 + 56) + 1;
      --*(_QWORD *)(a2 + 48);
      *(_QWORD *)(a2 + 56) = v26;
      _xpc_serializer_append(a2, "\n", 1uLL, 0);
      ++v8;
    }
    while (v8 < *(unsigned int *)(a1 + 32));
  }
  _xpc_serializer_unpad(a2);
  v27 = _xpc_object_pad(*(char **)(a2 + 48), *(_QWORD *)(a2 + 56), *(_QWORD *)(a2 + 112));
  v28 = *(_QWORD *)(a2 + 56) - v27;
  *(_QWORD *)(a2 + 48) += v27;
  *(_QWORD *)(a2 + 56) = v28;
  return _xpc_serializer_append(a2, "]", 2uLL, 0);
}

uint64_t _xpc_array_debug_desc(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  size_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  uint64_t v13;
  size_t v14;
  unint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  int v21;
  int *extension_vtable;
  unint64_t v23;
  void (*v26)(unint64_t *, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v31;
  char __str[16];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C874D8];
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  *(_OWORD *)__str = 0u;
  v33 = 0u;
  v4 = snprintf(__str, 0x80uLL, "<%s: %p> { count = %u, capacity = %u, contents =\n", "array", (const void *)a1, *(_DWORD *)(a1 + 32), *(_DWORD *)(a1 + 36));
  if (v4 >= 0x7F)
    v5 = 127;
  else
    v5 = v4;
  _xpc_serializer_append(a2, __str, v5, 0);
  v6 = _xpc_serializer_pad(a2);
  if (*(_DWORD *)(a1 + 32))
  {
    v7 = v6;
    v8 = 0;
    v9 = MEMORY[0x1E0DE7C48];
    do
    {
      v10 = _xpc_object_pad(__str, 0x80uLL, v7);
      v11 = &__str[v10];
      v12 = 128 - v10;
      if ((unint64_t)(128 - v10) < 2)
      {
        v14 = 0;
      }
      else
      {
        v13 = v10;
        v14 = snprintf(&__str[v10], v12, "%lu: ", v8);
        if (v12 <= v14)
          v14 = 127 - v13;
      }
      _xpc_serializer_append(a2, __str, &v11[v14] - __str, 0);
      v15 = *(unint64_t **)(*(_QWORD *)(a1 + 24) + 8 * v8);
      if (((unint64_t)v15 & 0x8000000000000000) != 0)
      {
        v16 = 0;
        v17 = *MEMORY[0x1E0DE7C58];
        if ((~(unint64_t)v15 & 0xC000000000000007) == 0)
          v17 = 0;
        v18 = v17 ^ (unint64_t)v15;
        do
        {
          if ((v18 & 7) == *(_BYTE *)(v9 + v16))
            break;
          ++v16;
        }
        while (v16 != 7);
        v19 = v16 | v18;
        v20 = v16 & 7;
        v21 = (v19 >> 55) + 8;
        if (v20 == 7)
          LODWORD(v20) = v21;
        extension_vtable = &_OS_xpc_type_uint64;
        if ((_DWORD)v20 != 12)
        {
          if ((_DWORD)v20 != 13)
          {
            v31 = _xpc_asprintf("Object is not an XPC object");
            _xpc_api_misuse(v31);
          }
          extension_vtable = &_OS_xpc_type_int64;
        }
      }
      else
      {
        v23 = *v15;
        if (*v15 >= (unint64_t)OS_xpc_object
          && v23 <= (unint64_t)OS_xpc_rich_error
          && (*v15 & 7) == 0)
        {
          extension_vtable = (int *)((char *)&_xpc_vtables + 2 * (v23 - (_QWORD)OS_xpc_object));
        }
        else
        {
          extension_vtable = _xpc_get_extension_vtable(v15);
        }
      }
      v26 = (void (*)(unint64_t *, uint64_t))*((_QWORD *)extension_vtable + 7);
      if (!v26)
        v26 = (void (*)(unint64_t *, uint64_t))*((_QWORD *)extension_vtable + 6);
      v26(v15, a2);
      v27 = *(_QWORD *)(a2 + 56) + 1;
      --*(_QWORD *)(a2 + 48);
      *(_QWORD *)(a2 + 56) = v27;
      _xpc_serializer_append(a2, "\n", 1uLL, 0);
      ++v8;
    }
    while (v8 < *(unsigned int *)(a1 + 32));
  }
  _xpc_serializer_unpad(a2);
  v28 = _xpc_object_pad(*(char **)(a2 + 48), *(_QWORD *)(a2 + 56), *(_QWORD *)(a2 + 112));
  v29 = *(_QWORD *)(a2 + 56) - v28;
  *(_QWORD *)(a2 + 48) += v28;
  *(_QWORD *)(a2 + 56) = v29;
  return _xpc_serializer_append(a2, "}", 2uLL, 0);
}

uint64_t _xpc_array_debug(uint64_t a1, char *__str, size_t __size)
{
  return snprintf(__str, __size, ", count = %u", *(_DWORD *)(a1 + 32));
}

_DWORD *_xpc_array_serialize(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  int v12;
  int *extension_vtable;
  unint64_t v14;
  _DWORD *result;
  unint64_t v18;
  char *v19;
  uint64_t graph_length;
  int v21;
  int v22;
  int __src;

  __src = 57344;
  _xpc_serializer_append(a2, &__src, 4uLL, 1);
  v22 = 0;
  graph_length = _xpc_serializer_get_graph_length(a2);
  _xpc_serializer_append(a2, &v22, 4uLL, 1);
  v21 = *(_DWORD *)(a1 + 32);
  _xpc_serializer_append(a2, &v21, 4uLL, 1);
  if (*(_DWORD *)(a1 + 32))
  {
    v4 = 0;
    v5 = MEMORY[0x1E0DE7C48];
    do
    {
      v6 = *(unint64_t **)(*(_QWORD *)(a1 + 24) + 8 * v4);
      if (((unint64_t)v6 & 0x8000000000000000) != 0)
      {
        v7 = 0;
        v8 = *MEMORY[0x1E0DE7C58];
        if ((~(unint64_t)v6 & 0xC000000000000007) == 0)
          v8 = 0;
        v9 = v8 ^ (unint64_t)v6;
        do
        {
          if ((v9 & 7) == *(_BYTE *)(v5 + v7))
            break;
          ++v7;
        }
        while (v7 != 7);
        v10 = v7 | v9;
        v11 = v7 & 7;
        v12 = (v10 >> 55) + 8;
        if (v11 == 7)
          LODWORD(v11) = v12;
        extension_vtable = &_OS_xpc_type_uint64;
        if ((_DWORD)v11 != 12)
        {
          if ((_DWORD)v11 != 13)
          {
            v19 = _xpc_asprintf("Object is not an XPC object");
            _xpc_api_misuse(v19);
          }
          extension_vtable = &_OS_xpc_type_int64;
        }
      }
      else
      {
        v14 = *v6;
        if (*v6 >= (unint64_t)OS_xpc_object
          && v14 <= (unint64_t)OS_xpc_rich_error
          && (*v6 & 7) == 0)
        {
          extension_vtable = (int *)((char *)&_xpc_vtables + 2 * (v14 - (_QWORD)OS_xpc_object));
        }
        else
        {
          extension_vtable = _xpc_get_extension_vtable(v6);
        }
      }
      (*((void (**)(unint64_t *, uint64_t))extension_vtable + 9))(v6, a2);
      ++v4;
    }
    while (v4 < *(unsigned int *)(a1 + 32));
  }
  result = (_DWORD *)_xpc_serializer_get_graph_length(a2);
  v18 = (unint64_t)result - graph_length - 4;
  if (!HIDWORD(v18))
  {
    result = (_DWORD *)_xpc_serializer_get_graph_ptr(a2, graph_length);
    *result = v18;
  }
  return result;
}

_DWORD *_xpc_array_deserialize(uint64_t a1)
{
  _DWORD *v2;
  unint64_t v3;
  int depth;
  _DWORD *v5;
  uint64_t v6;
  int *v7;
  unsigned int v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  void *v11;
  xpc_object_t v12;
  _BOOL4 v13;

  if (!_xpc_graph_deserializer_read(a1, 4uLL))
    return 0;
  v2 = (_DWORD *)_xpc_graph_deserializer_read(a1, 4uLL);
  if (!v2)
    return 0;
  v3 = *v2;
  if (HIBYTE(*v2))
    return 0;
  depth = _xpc_graph_deserializer_get_depth(a1);
  v5 = (_DWORD *)_xpc_array_create(v3);
  v5[4] |= 1u;
  v6 = 0;
  if ((_DWORD)v3)
  {
    while (1)
    {
      v7 = (int *)_xpc_graph_deserializer_read(a1, 4uLL);
      if (!v7)
        break;
      v8 = *v7;
      if (_xpc_class_id_valid(*v7))
      {
        if ((v8 == 57344 || v8 == 0x10000 || v8 == 61440) && !_xpc_graph_deserializer_enter_container(a1))
          break;
        v9 = (uint64_t (*)(uint64_t))_xpc_deserialize_from_wire_id(v8);
        v10 = (void *)v9(a1);
        if (!v10)
          break;
        v11 = v10;
        _xpc_array_insert((uint64_t)v5, v6, v10);
        xpc_release(v11);
      }
      else
      {
        if (!_xpc_class_id_from_wire_valid(v8))
          break;
        v12 = xpc_null_create();
        _xpc_array_insert((uint64_t)v5, v6, v12);
        xpc_release(v12);
        v13 = _xpc_graph_deserializer_skip_value(a1, v8);
        if (!v12 || !v13)
          break;
      }
      _xpc_graph_deserializer_restore_depth(a1, depth);
      if (v3 == ++v6)
        return v5;
    }
  }
  if (v6 != v3)
  {
    xpc_release(v5);
    return 0;
  }
  return v5;
}

void _xpc_array_dispose(uint64_t a1)
{
  unint64_t v2;

  if (*(_DWORD *)(a1 + 32))
  {
    v2 = 0;
    do
      xpc_release(*(xpc_object_t *)(*(_QWORD *)(a1 + 24) + 8 * v2++));
    while (v2 < *(unsigned int *)(a1 + 32));
  }
  free(*(void **)(a1 + 24));
}

uint64_t xpc_array_apply_f(uint64_t result, uint64_t a2, uint64_t (*a3)(unint64_t, _QWORD, uint64_t))
{
  uint64_t v5;
  unint64_t v6;
  int v7;
  char *v8;

  if (*(_DWORD *)(result + 32))
  {
    v5 = result;
    v6 = 0;
    v7 = *(_DWORD *)(result + 40);
    do
    {
      result = a3(v6, *(_QWORD *)(*(_QWORD *)(v5 + 24) + 8 * v6), a2);
      if (*(_DWORD *)(v5 + 40) != v7)
      {
        v8 = _xpc_asprintf("Array mutated during iteration");
        _xpc_api_misuse(v8);
      }
      ++v6;
    }
    while (v6 < *(unsigned int *)(v5 + 32));
  }
  return result;
}

void xpc_array_set_pointer(void *a1, size_t a2, uint64_t a3)
{
  void *v5;

  v5 = (void *)xpc_pointer_create(a3);
  xpc_array_set_value(a1, a2, v5);
  xpc_release(v5);
}

void xpc_array_set_value(xpc_object_t xarray, size_t index, xpc_object_t value)
{
  char *v6;

  if (xpc_get_type(xarray) != (xpc_type_t)OS_xpc_array)
    _xpc_api_misuse("Given object not of required type.");
  if (index == -1)
  {
    ++*((_DWORD *)xarray + 10);
    xpc_array_append_value(xarray, value);
  }
  else
  {
    if (*((unsigned int *)xarray + 8) <= index)
    {
      v6 = _xpc_asprintf("Out-of-bounds array insertion attempt.");
      _xpc_api_misuse(v6);
    }
    ++*((_DWORD *)xarray + 10);
    _xpc_array_insert((uint64_t)xarray, index, value);
  }
}

uint64_t xpc_array_get_pointer(void *a1, size_t a2)
{
  _QWORD *value;
  _QWORD *v3;

  value = xpc_array_get_value(a1, a2);
  if (value && (v3 = value, xpc_get_type(value) == (xpc_type_t)OS_xpc_pointer))
    return xpc_pointer_get_value(v3);
  else
    return 0;
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  char *v5;

  if (xpc_get_type(xarray) != (xpc_type_t)OS_xpc_array)
    return 0;
  if (*((unsigned int *)xarray + 8) <= index)
  {
    v5 = _xpc_asprintf("Attempt to access an out-of-bounds index.");
    _xpc_api_misuse(v5);
  }
  return *(xpc_object_t *)(*((_QWORD *)xarray + 3) + 8 * index);
}

void xpc_array_set_mach_send(void *a1, size_t a2, mach_port_name_t a3)
{
  void *v5;

  v5 = (void *)xpc_mach_send_create(a3);
  xpc_array_set_value(a1, a2, v5);
  xpc_release(v5);
}

uint64_t xpc_array_copy_mach_send(void *a1, size_t a2)
{
  unsigned int *value;
  unsigned int *v3;

  value = (unsigned int *)xpc_array_get_value(a1, a2);
  if (value && (v3 = value, xpc_get_type(value) == (xpc_type_t)OS_xpc_mach_send))
    return xpc_mach_send_copy_right(v3);
  else
    return 0;
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  size_t v2;
  unint64_t v3;
  void *v6;
  uint64_t v7;

  v2 = count + 4;
  v3 = count >= 0xFFFFFFFFFFFFFFFCLL;
  if ((uint64_t)(v3 << 63) >> 63 != v3 || __PAIR128__(v3, v2) >= 0x8000000000000000)
    xpc_array_create_cold_1();
  v6 = (void *)_xpc_array_create(2 * v2);
  if (count)
  {
    v7 = 0;
    do
    {
      _xpc_array_insert((uint64_t)v6, v7, objects[v7]);
      ++v7;
    }
    while (count != v7);
  }
  return v6;
}

unint64_t _xpc_array_create(unint64_t result)
{
  unint64_t v1;
  unint64_t v2;

  if (HIDWORD(result) || (v1 = result, result = _xpc_base_create(), *(_DWORD *)(result + 20) = 8, v1 >> 29))
  {
    __break(1u);
  }
  else
  {
    v2 = result;
    *(_QWORD *)(result + 24) = _xpc_alloc(8 * v1);
    *(_DWORD *)(v2 + 36) = v1;
    return v2;
  }
  return result;
}

void _xpc_array_insert(uint64_t a1, uint64_t a2, xpc_object_t object)
{
  void *v4;

  v4 = *(void **)(*(_QWORD *)(a1 + 24) + 8 * a2);
  *(_QWORD *)(*(_QWORD *)(a1 + 24) + 8 * a2) = xpc_retain(object);
  if (v4)
  {
    --*(_DWORD *)(a1 + 32);
    xpc_release(v4);
  }
  ++*(_DWORD *)(a1 + 32);
}

xpc_object_t xpc_array_create_empty(void)
{
  uint64_t v0;

  v0 = _xpc_base_create();
  *(_DWORD *)(v0 + 20) = 8;
  *(_QWORD *)(v0 + 24) = _xpc_alloc(0x40uLL);
  *(_DWORD *)(v0 + 36) = 8;
  return (xpc_object_t)v0;
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  int v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  char *v9;

  if (xpc_get_type(xarray) != (xpc_type_t)OS_xpc_array)
    goto LABEL_11;
  v4 = *((_DWORD *)xarray + 9);
  ++*((_DWORD *)xarray + 10);
  v5 = *((unsigned int *)xarray + 8);
  if ((_DWORD)v5 != v4)
  {
LABEL_10:
    _xpc_array_insert((uint64_t)xarray, v5, value);
    return;
  }
  if (!(_DWORD)v5)
  {
    v6 = 8;
LABEL_7:
    if (xpc_get_type(xarray) == (xpc_type_t)OS_xpc_array)
    {
      if (v6 < *((unsigned int *)xarray + 9))
      {
        v9 = _xpc_asprintf("Attempt to grow an array to a smaller size.");
        _xpc_api_misuse(v9);
      }
      v7 = _xpc_alloc(8 * v6);
      v8 = (void *)*((_QWORD *)xarray + 3);
      memcpy(v7, v8, 8 * *((unsigned int *)xarray + 8));
      free(v8);
      *((_QWORD *)xarray + 3) = v7;
      *((_DWORD *)xarray + 9) = v6;
      LODWORD(v5) = *((_DWORD *)xarray + 8);
      goto LABEL_10;
    }
LABEL_11:
    _xpc_api_misuse("Given object not of required type.");
  }
  if ((v5 & 0x80000000) == 0)
  {
    v6 = 2 * v5;
    goto LABEL_7;
  }
  __break(1u);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  if (xpc_get_type(xarray) == (xpc_type_t)OS_xpc_array)
    return *((unsigned int *)xarray + 8);
  else
    return 0;
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  uint64_t v4;
  int v5;
  BOOL result;
  char *v8;

  if (xpc_get_type(xarray) != (xpc_type_t)OS_xpc_array)
    _xpc_api_misuse("Given object not of required type.");
  if (!*((_DWORD *)xarray + 8))
    return 1;
  v4 = 0;
  v5 = *((_DWORD *)xarray + 10);
  do
  {
    result = (*((uint64_t (**)(xpc_array_applier_t, uint64_t, _QWORD))applier + 2))(applier, v4, *(_QWORD *)(*((_QWORD *)xarray + 3) + 8 * v4));
    if (*((_DWORD *)xarray + 10) != v5)
    {
      v8 = _xpc_asprintf("Array mutated during iteration");
      _xpc_api_misuse(v8);
    }
  }
  while (++v4 < (unint64_t)*((unsigned int *)xarray + 8) && result);
  return result;
}

void xpc_array_set_BOOL(xpc_object_t xarray, size_t index, BOOL value)
{
  xpc_object_t v5;

  v5 = xpc_BOOL_create(value);
  xpc_array_set_value(xarray, index, v5);
  xpc_release(v5);
}

void xpc_array_set_int64(xpc_object_t xarray, size_t index, int64_t value)
{
  xpc_object_t v5;

  v5 = xpc_int64_create(value);
  xpc_array_set_value(xarray, index, v5);
  xpc_release(v5);
}

void xpc_array_set_uint64(xpc_object_t xarray, size_t index, uint64_t value)
{
  xpc_object_t v5;

  v5 = xpc_uint64_create(value);
  xpc_array_set_value(xarray, index, v5);
  xpc_release(v5);
}

void xpc_array_set_double(xpc_object_t xarray, size_t index, double value)
{
  xpc_object_t v5;

  v5 = xpc_double_create(value);
  xpc_array_set_value(xarray, index, v5);
  xpc_release(v5);
}

void xpc_array_set_date(xpc_object_t xarray, size_t index, int64_t value)
{
  xpc_object_t v5;

  v5 = xpc_date_create(value);
  xpc_array_set_value(xarray, index, v5);
  xpc_release(v5);
}

void xpc_array_set_data(xpc_object_t xarray, size_t index, const void *bytes, size_t length)
{
  xpc_object_t v6;

  v6 = xpc_data_create(bytes, length);
  xpc_array_set_value(xarray, index, v6);
  xpc_release(v6);
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
  xpc_object_t v5;

  v5 = xpc_string_create(string);
  xpc_array_set_value(xarray, index, v5);
  xpc_release(v5);
}

void xpc_array_set_uuid(xpc_object_t xarray, size_t index, const unsigned __int8 *uuid)
{
  xpc_object_t v5;

  v5 = xpc_uuid_create(uuid);
  xpc_array_set_value(xarray, index, v5);
  xpc_release(v5);
}

void xpc_array_set_fd(xpc_object_t xarray, size_t index, int fd)
{
  xpc_object_t v5;
  void *v6;

  v5 = xpc_fd_create(fd);
  if (v5)
  {
    v6 = v5;
    xpc_array_set_value(xarray, index, v5);
    xpc_release(v6);
  }
}

void xpc_array_set_connection(xpc_object_t xarray, size_t index, xpc_connection_t connection)
{
  xpc_endpoint_t v5;

  v5 = xpc_endpoint_create(connection);
  xpc_array_set_value(xarray, index, v5);
  xpc_release(v5);
}

BOOL xpc_array_get_BOOL(xpc_object_t xarray, size_t index)
{
  xpc_object_t value;
  void *v3;
  BOOL result;

  value = xpc_array_get_value(xarray, index);
  result = value && (v3 = value, xpc_get_type(value) == (xpc_type_t)OS_xpc_BOOL) && xpc_BOOL_get_value(v3);
  return result;
}

int64_t xpc_array_get_int64(xpc_object_t xarray, size_t index)
{
  xpc_object_t value;
  void *v3;

  value = xpc_array_get_value(xarray, index);
  if (value && (v3 = value, xpc_get_type(value) == (xpc_type_t)OS_xpc_int64))
    return xpc_int64_get_value(v3);
  else
    return 0;
}

uint64_t xpc_array_get_uint64(xpc_object_t xarray, size_t index)
{
  xpc_object_t value;
  void *v3;

  value = xpc_array_get_value(xarray, index);
  if (value && (v3 = value, xpc_get_type(value) == (xpc_type_t)OS_xpc_uint64))
    return xpc_uint64_get_value(v3);
  else
    return 0;
}

double xpc_array_get_double(xpc_object_t xarray, size_t index)
{
  xpc_object_t value;
  void *v3;

  value = xpc_array_get_value(xarray, index);
  if (value && (v3 = value, xpc_get_type(value) == (xpc_type_t)OS_xpc_double))
    return xpc_double_get_value(v3);
  else
    return NAN;
}

int64_t xpc_array_get_date(xpc_object_t xarray, size_t index)
{
  xpc_object_t value;
  void *v3;

  value = xpc_array_get_value(xarray, index);
  if (value && (v3 = value, xpc_get_type(value) == (xpc_type_t)OS_xpc_date))
    return xpc_date_get_value(v3);
  else
    return 0;
}

const void *__cdecl xpc_array_get_data(xpc_object_t xarray, size_t index, size_t *length)
{
  _QWORD *value;
  _QWORD *v5;
  const void *v7;
  size_t v8;

  v7 = 0;
  v8 = 0;
  value = xpc_array_get_value(xarray, index);
  if (value)
  {
    v5 = value;
    if (xpc_get_type(value) == (xpc_type_t)OS_xpc_data
      && !xpc_data_get_bytes_ptr_and_length(v5, &v7, &v8))
    {
      _xpc_rich_error_serialize_cold_1();
    }
  }
  if (length)
    *length = v8;
  return v7;
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  xpc_object_t value;
  void *v3;

  value = xpc_array_get_value(xarray, index);
  if (value && (v3 = value, xpc_get_type(value) == (xpc_type_t)OS_xpc_string))
    return xpc_string_get_string_ptr(v3);
  else
    return 0;
}

const uint8_t *__cdecl xpc_array_get_uuid(xpc_object_t xarray, size_t index)
{
  xpc_object_t value;
  void *v3;

  value = xpc_array_get_value(xarray, index);
  if (value && (v3 = value, xpc_get_type(value) == (xpc_type_t)OS_xpc_uuid))
    return xpc_uuid_get_bytes(v3);
  else
    return 0;
}

int xpc_array_dup_fd(xpc_object_t xarray, size_t index)
{
  xpc_object_t value;
  void *v3;

  value = xpc_array_get_value(xarray, index);
  if (value && (v3 = value, xpc_get_type(value) == (xpc_type_t)OS_xpc_fd))
    return xpc_fd_dup(v3);
  else
    return -1;
}

xpc_connection_t xpc_array_create_connection(xpc_object_t xarray, size_t index)
{
  _xpc_endpoint_s *value;
  _xpc_endpoint_s *v3;

  value = (_xpc_endpoint_s *)xpc_array_get_value(xarray, index);
  if (value && (v3 = value, xpc_get_type(value) == (xpc_type_t)OS_xpc_endpoint))
    return xpc_connection_create_from_endpoint(v3);
  else
    return 0;
}

xpc_object_t xpc_array_get_dictionary(xpc_object_t xarray, size_t index)
{
  xpc_object_t value;
  void *v3;

  value = xpc_array_get_value(xarray, index);
  if (!value)
    return 0;
  v3 = value;
  if (xpc_get_type(value) != (xpc_type_t)OS_xpc_dictionary)
    return 0;
  return v3;
}

xpc_object_t xpc_array_get_array(xpc_object_t xarray, size_t index)
{
  xpc_object_t value;
  void *v3;

  value = xpc_array_get_value(xarray, index);
  if (!value)
    return 0;
  v3 = value;
  if (xpc_get_type(value) != (xpc_type_t)OS_xpc_array)
    return 0;
  return v3;
}

double xpc_binprefs_alloc()
{
  _OWORD *v0;
  double result;

  v0 = _xpc_alloc(0x24uLL);
  result = 0.0;
  *v0 = 0u;
  v0[1] = 0u;
  *((_DWORD *)v0 + 8) = 0;
  return result;
}

double xpc_binprefs_init(uint64_t a1)
{
  double result;

  *(_DWORD *)(a1 + 32) = 0;
  result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

void *xpc_binprefs_copy(const void *a1)
{
  return _xpc_memdup(a1, 0x24uLL);
}

uint64_t xpc_binprefs_add(uint64_t result, int a2, int a3)
{
  uint64_t v3;

  v3 = *(unsigned int *)(result + 32);
  if (v3 >= 4)
    return _os_assumes_log();
  *(_DWORD *)(result + 4 * v3) = a2;
  *(_DWORD *)(result + 4 * (*(_DWORD *)(result + 32))++ + 16) = a3;
  return result;
}

uint64_t xpc_binprefs_count(uint64_t a1)
{
  return *(unsigned int *)(a1 + 32);
}

uint64_t xpc_binprefs_cpu_type(uint64_t a1, unsigned int a2)
{
  if (*(_DWORD *)(a1 + 32) <= a2)
    _xpc_rich_error_serialize_cold_1();
  return *(unsigned int *)(a1 + 4 * a2);
}

uint64_t xpc_binprefs_cpu_subtype(uint64_t a1, unsigned int a2)
{
  if (*(_DWORD *)(a1 + 32) <= a2)
    _xpc_rich_error_serialize_cold_1();
  return *(unsigned int *)(a1 + 4 * a2 + 16);
}

BOOL xpc_binprefs_equal(uint64_t a1, uint64_t a2)
{
  _BOOL8 result;
  int v5;
  unsigned int v6;
  int v7;
  int v8;

  result = (a1 | a2) == 0;
  if (a1 && a2)
  {
    v5 = *(_DWORD *)(a1 + 32);
    if (v5 == *(_DWORD *)(a2 + 32))
    {
      if (!v5)
        return 1;
      v6 = 0;
      while (1)
      {
        v7 = xpc_binprefs_cpu_type(a1, v6);
        if (v7 != xpc_binprefs_cpu_type(a2, v6))
          break;
        v8 = xpc_binprefs_cpu_subtype(a1, v6);
        if (v8 != xpc_binprefs_cpu_subtype(a2, v6))
          break;
        if (++v6 >= *(_DWORD *)(a1 + 32))
          return 1;
      }
    }
    return 0;
  }
  return result;
}

char *xpc_binprefs_copy_description(uint64_t a1)
{
  const char **v2;
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
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char v25;

  if (!a1)
    return _xpc_strdup("(null)");
  v2 = (const char **)string_builder_new(0x80uLL);
  string_builder_appendf((uint64_t)v2, "%d: [", v3, v4, v5, v6, v7, v8, *(_DWORD *)(a1 + 32));
  if (*(_DWORD *)(a1 + 32))
  {
    v15 = 0;
    do
    {
      if (v15)
        string_builder_appendf((uint64_t)v2, ", ", v9, v10, v11, v12, v13, v14, v25);
      v16 = xpc_binprefs_cpu_type(a1, v15);
      xpc_binprefs_cpu_subtype(a1, v15);
      string_builder_appendf((uint64_t)v2, "%d.%d", v17, v18, v19, v20, v21, v22, v16);
      ++v15;
    }
    while (v15 < *(_DWORD *)(a1 + 32));
  }
  string_builder_appendf((uint64_t)v2, "]", v9, v10, v11, v12, v13, v14, v25);
  v23 = string_builder_copy_string(v2);
  string_builder_destroy((void **)v2);
  return v23;
}

BOOL xpc_binprefs_is_noop(_DWORD *a1)
{
  return !a1[8] || *a1 == -1;
}

uint64_t xpc_binprefs_set_psattr(cpu_type_t *a1, posix_spawnattr_t *a2)
{
  uint64_t result;

  result = posix_spawnattr_setarchpref_np(a2, a1[8], a1, a1 + 4, 0);
  if ((_DWORD)result)
    _xpc_alloc_cold_1();
  return result;
}

void xpc_traverse_serialized_data(const void *a1, size_t a2, uint64_t a3)
{
  id v6;
  void *v7;
  int *v8;
  unsigned int v9;
  int v10;
  _OWORD v11[4];
  int v12;

  v12 = 1;
  (*(void (**)(uint64_t, _QWORD, _QWORD))(a3 + 16))(a3, 0, 0);
  v6 = _xpc_payload_create_from_data_no_copy(a1, a2);
  if (v6)
  {
    v7 = v6;
    memset(v11, 0, sizeof(v11));
    _xpc_graph_deserializer_init((uint64_t)v11, (uint64_t)v6);
    if (_xpc_graph_unpack_header((uint64_t)v11, 3))
    {
      v8 = (int *)_xpc_graph_deserializer_read((uint64_t)v11, 4uLL);
      if (v8)
      {
        v9 = *v8;
        if (_xpc_class_id_valid(*v8))
        {
          if (v9 == 57344)
          {
            v10 = _xpc_traverse_array((uint64_t)v11, a3);
          }
          else if (v9 == 61440)
          {
            v10 = _xpc_traverse_dictionary((uint64_t *)v11, a3);
          }
          else
          {
            v10 = _xpc_traverse_simple((uint64_t *)v11, v9, a3);
          }
          v12 = v10;
        }
      }
    }
    (*(void (**)(uint64_t, uint64_t, int *))(a3 + 16))(a3, 1, &v12);
    xpc_release(v7);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, int *))(a3 + 16))(a3, 1, &v12);
  }
}

uint64_t _xpc_traverse_dictionary(uint64_t *a1, uint64_t a2)
{
  unsigned int *v4;
  uint64_t v5;
  uint64_t v6;
  int v8;
  int depth;
  int v10;
  const char *string;
  const char *v12;
  int *v13;
  unsigned int v14;
  int v15;
  uint64_t v16;
  int v17;
  const char *v18;
  __objc2_class *v19;
  _QWORD v20[2];

  if (_xpc_dictionary_wire_length() == -1)
    return 1;
  v4 = (unsigned int *)_xpc_graph_deserializer_read((uint64_t)a1, 4uLL);
  if (!v4)
    return 1;
  v5 = *v4;
  if (v5 > 0x1000000)
    return 1;
  v20[0] = OS_xpc_dictionary;
  v20[1] = v5;
  v6 = 2;
  v8 = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD *))(a2 + 16))(a2, 2, v20);
  if (v8)
  {
    if (v8 != 3)
      _xpc_traverse_dictionary_cold_1();
  }
  else
  {
    depth = _xpc_graph_deserializer_get_depth((uint64_t)a1);
    if ((_DWORD)v5)
    {
      v10 = depth;
      do
      {
        string = _xpc_graph_deserializer_read_string((uint64_t)a1);
        if (!string)
          return 1;
        v12 = string;
        v13 = (int *)_xpc_graph_deserializer_read((uint64_t)a1, 4uLL);
        if (!v13)
          return 1;
        v14 = *v13;
        if (!_xpc_class_id_valid(*v13))
          return 1;
        v18 = v12;
        v19 = 0;
        v19 = _xpc_type_from_id(v14);
        v15 = (*(uint64_t (**)(uint64_t, uint64_t, const char **))(a2 + 16))(a2, 5, &v18);
        v16 = _xt_do_container_element_action(a1, v15, a2, v14, v10);
        if ((_DWORD)v16)
          return v16;
        LODWORD(v5) = v5 - 1;
      }
      while ((_DWORD)v5);
    }
    v17 = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(a2 + 16))(a2, 3, 0);
    if (v17)
    {
      if (v17 != 3)
        _xpc_traverse_dictionary_cold_2();
      return 2;
    }
    else
    {
      return 0;
    }
  }
  return v6;
}

uint64_t _xpc_traverse_array(uint64_t a1, uint64_t a2)
{
  unsigned int *v4;
  uint64_t v5;
  uint64_t v6;
  int v8;
  uint64_t depth;
  uint64_t v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __objc2_class *v18;
  _QWORD v19[2];

  if (_xpc_array_wire_length() == -1)
    return 1;
  v4 = (unsigned int *)_xpc_graph_deserializer_read(a1, 4uLL);
  if (!v4)
    return 1;
  v5 = *v4;
  if (v5 > 0x1000000)
    return 1;
  v19[0] = OS_xpc_array;
  v19[1] = v5;
  v6 = 2;
  v8 = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD *))(a2 + 16))(a2, 2, v19);
  if (v8)
  {
    if (v8 != 3)
      _xpc_traverse_array_cold_1();
  }
  else
  {
    depth = _xpc_graph_deserializer_get_depth(a1);
    if ((_DWORD)v5)
    {
      v10 = depth;
      v11 = 0;
      do
      {
        v12 = (int *)_xpc_graph_deserializer_read(a1, 4uLL);
        if (!v12)
          return 1;
        v13 = *v12;
        if (!_xpc_class_id_valid(*v12))
          return 1;
        v17 = v11;
        v18 = 0;
        v18 = _xpc_type_from_id(v13);
        v14 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t *))(a2 + 16))(a2, 4, &v17);
        v15 = _xt_do_container_element_action(a1, v14, a2, v13, v10);
        if ((_DWORD)v15)
          return v15;
      }
      while (v5 != ++v11);
    }
    v16 = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(a2 + 16))(a2, 3, 0);
    if (v16)
    {
      if (v16 != 3)
        _xpc_traverse_array_cold_2();
      return 2;
    }
    else
    {
      return 0;
    }
  }
  return v6;
}

uint64_t _xpc_traverse_simple(uint64_t *a1, unsigned int a2, uint64_t a3)
{
  unint64_t v6;
  uint64_t result;
  _BOOL4 v8;
  __objc2_class *v9;
  uint64_t v10;
  uint64_t v11;

  v10 = 0;
  v11 = 0;
  v9 = _xpc_type_from_id(a2);
  HIDWORD(v6) = a2;
  LODWORD(v6) = a2 - 0x2000;
  switch((v6 >> 12))
  {
    case 0u:
      v10 = _xpc_BOOL_wire_length();
      if ((_xpc_BOOL_get_wire_value((uint64_t)a1, &v11) & 1) == 0)
        goto LABEL_5;
      goto LABEL_14;
    case 1u:
      v10 = _xpc_int64_wire_length();
      if (!_xpc_date_get_wire_value((uint64_t)a1, &v11))
        goto LABEL_5;
      goto LABEL_14;
    case 2u:
      v10 = _xpc_uint64_wire_length();
      if (_xpc_date_get_wire_value((uint64_t)a1, &v11))
        goto LABEL_14;
      goto LABEL_5;
    case 3u:
      v10 = _xpc_double_wire_length();
      if (_xpc_double_get_wire_value((uint64_t)a1, &v11))
        goto LABEL_14;
      goto LABEL_5;
    case 5u:
      v10 = _xpc_date_wire_length();
      if (_xpc_date_get_wire_value((uint64_t)a1, &v11))
        goto LABEL_14;
      goto LABEL_5;
    case 6u:
      if ((_xpc_data_get_wire_value(a1, &v11, (mach_vm_size_t *)&v10) & 1) != 0)
        goto LABEL_14;
      goto LABEL_5;
    case 7u:
      if ((_xpc_string_get_wire_value((uint64_t)a1, &v11, (unint64_t *)&v10) & 1) != 0)
        goto LABEL_14;
      goto LABEL_5;
    case 8u:
      v10 = _xpc_uuid_wire_length();
      if (_xpc_uuid_get_wire_value((uint64_t)a1, &v11))
      {
LABEL_14:
        result = (*(uint64_t (**)(uint64_t, uint64_t, __objc2_class **))(a3 + 16))(a3, 6, &v9);
        if ((_DWORD)result)
        {
          if ((_DWORD)result != 3)
            _xpc_traverse_simple_cold_1();
          result = 2;
        }
      }
      else
      {
LABEL_5:
        result = 1;
      }
      break;
    default:
      v8 = _xpc_graph_deserializer_skip_value((uint64_t)a1, a2);
      if (!v8)
        _os_assumes_log();
      result = !v8;
      break;
  }
  return result;
}

uint64_t _xt_do_container_element_action(uint64_t *a1, int a2, uint64_t a3, unsigned int a4, int a5)
{
  uint64_t result;
  unsigned int v11;
  uint64_t (*v12)(uint64_t *);
  uint64_t v13;
  void *v14;
  int v15;

  result = 2;
  switch(a2)
  {
    case 0:
    case 2:
      v11 = a4 & 0xFFFFEFFF;
      if ((a4 & 0xFFFFEFFF) == 0xE000)
      {
        result = _xpc_graph_deserializer_enter_container((uint64_t)a1);
        if (!(_DWORD)result)
          return result;
      }
      if (a2 == 2)
      {
        v12 = (uint64_t (*)(uint64_t *))_xpc_deserialize_from_wire_id(a4);
        v13 = v12(a1);
        if (!v13)
          return 1;
        v14 = (void *)v13;
        v15 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a3 + 16))(a3, 7, v13);
        xpc_release(v14);
        if (v15 == 3)
          return 2;
LABEL_18:
        if (v11 == 57344)
          _xpc_graph_deserializer_restore_depth((uint64_t)a1, a5);
        return 0;
      }
      if (a4 == 61440)
      {
        result = _xpc_traverse_dictionary(a1, a3);
        if (!(_DWORD)result)
          goto LABEL_18;
      }
      else if (a4 == 57344)
      {
        result = _xpc_traverse_array((uint64_t)a1, a3);
        if (!(_DWORD)result)
          goto LABEL_18;
      }
      else
      {
        result = _xpc_traverse_simple(a1, a4, a3);
        if (!(_DWORD)result)
          goto LABEL_18;
      }
      return result;
    case 1:
      if (_xpc_graph_deserializer_skip_value((uint64_t)a1, a4))
        return 0;
      _os_assumes_log();
      return 1;
    case 3:
      return result;
    default:
      return 0;
  }
}

xpc_object_t launch_socket_service_check_in()
{
  xpc_object_t v0;
  xpc_object_t v2;

  v0 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v0, "type", 6uLL);
  xpc_dictionary_set_uint64(v0, "handle", 0);
  v2 = 0;
  _xpc_launch_routine(101, v0, &v2);
  xpc_release(v0);
  return v2;
}

uint64_t launchd_getfd()
{
  return 0xFFFFFFFFLL;
}

uint64_t launchd_fdopen()
{
  return 0;
}

uint64_t launchd_msg_send()
{
  return 0xFFFFFFFFLL;
}

uint64_t launchd_msg_recv()
{
  return 0xFFFFFFFFLL;
}

uint64_t launch_data_pack()
{
  return 0;
}

uint64_t launch_data_unpack()
{
  return 0;
}

uint64_t _vprocmgr_getsocket()
{
  return 46;
}

xpc_object_t _launch_msg2(void *a1, int a2, uint64_t a3)
{
  xpc_object_t v6;
  uint64_t v7;
  xpc_object_t v9;

  v6 = xpc_dictionary_create(0, 0, 0);
  if (a2 == 2)
  {
    v7 = 3;
  }
  else if (a2 == 1)
  {
    if (a3 == -1)
      a3 = getuid();
    v7 = 2;
  }
  else
  {
    a3 = 0;
    v7 = 7;
  }
  xpc_dictionary_set_uint64(v6, "type", v7);
  xpc_dictionary_set_uint64(v6, "handle", a3);
  xpc_dictionary_set_value(v6, "request", a1);
  v9 = 0;
  _xpc_launch_routine(100, v6, &v9);
  xpc_release(v6);
  return v9;
}

uint64_t launch_wait()
{
  *__error() = 45;
  return 0xFFFFFFFFLL;
}

uint64_t mpm_wait()
{
  return 46;
}

uint64_t mpm_uncork_fork()
{
  return 46;
}

uint64_t (*reboot2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8))()
{
  int v8;
  uint64_t v10;

  v8 = reboot3(a1, a2, a3, a4, a5, a6, a7, a8, v10);
  if (!v8)
    return 0;
  *__error() = v8;
  return reboot2;
}

uint64_t reboot3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  xpc_object_t v10;
  unsigned int *v11;
  uint64_t v12;
  int64_t v13;
  xpc_object_t v15;
  uint64_t *v16;

  v10 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v10, "type", 1uLL);
  xpc_dictionary_set_uint64(v10, "handle", 0);
  xpc_dictionary_set_uint64(v10, "flags", a1);
  v16 = &a9;
  if ((a1 & 0x100000000000000) != 0)
  {
    v11 = (unsigned int *)v16++;
    v12 = *v11;
    if ((v12 - 1) > 0x63)
      return 22;
    xpc_dictionary_set_uint64(v10, "userreboot_purpose", v12);
  }
  v15 = 0;
  v13 = _xpc_domain_routine(821, v10, &v15);
  xpc_release(v10);
  return v13;
}

uint64_t create_and_switch_to_per_session_launchd()
{
  return 0xFFFFFFFFLL;
}

uint64_t place_hold_on_real_loginwindow()
{
  return 0;
}

launch_data_t launch_data_alloc(launch_data_type_t type)
{
  launch_data_t result;
  char *v2;

  switch(type)
  {
    case LAUNCH_DATA_DICTIONARY:
      result = (launch_data_t)xpc_dictionary_create(0, 0, 0);
      break;
    case LAUNCH_DATA_ARRAY:
      result = (launch_data_t)xpc_array_create(0, 0);
      break;
    case LAUNCH_DATA_FD:
    case LAUNCH_DATA_MACHPORT:
      v2 = _xpc_asprintf("This is not what you want to do.");
      _xpc_api_misuse(v2);
    case LAUNCH_DATA_INTEGER:
      result = (launch_data_t)xpc_int64_create(0);
      break;
    case LAUNCH_DATA_REAL:
      result = (launch_data_t)xpc_double_create(0.0);
      break;
    case LAUNCH_DATA_BOOL:
      result = (launch_data_t)_xpc_BOOL_create_distinct(0);
      break;
    case LAUNCH_DATA_STRING:
      result = (launch_data_t)xpc_string_create((const char *)&unk_1DEEBE00B);
      break;
    case LAUNCH_DATA_OPAQUE:
      result = (launch_data_t)xpc_data_create(&unk_1DEEBE00B, 1uLL);
      break;
    case LAUNCH_DATA_ERRNO:
      result = (launch_data_t)xpc_uint64_create(0);
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

launch_data_type_t launch_data_get_type(const launch_data_t ld)
{
  __objc2_class *type;
  int v2;
  launch_data_type_t v3;

  type = (__objc2_class *)xpc_get_type(ld);
  if (type == OS_xpc_dictionary)
    return 1;
  if (type == OS_xpc_array)
    return 2;
  if (type == OS_xpc_fd)
    return 3;
  if (type == OS_xpc_int64)
    return 4;
  if (type == OS_xpc_double)
    return 5;
  if (type == OS_xpc_BOOL)
    return 6;
  if (type == OS_xpc_string)
    return 7;
  if (type == OS_xpc_mach_recv)
    v2 = 10;
  else
    v2 = 0;
  if (type == OS_xpc_uint64)
    v3 = LAUNCH_DATA_ERRNO;
  else
    v3 = v2;
  if (type == OS_xpc_data)
    return 8;
  else
    return v3;
}

BOOL launch_data_dict_insert(launch_data_t ldict, const launch_data_t lval, const char *key)
{
  xpc_dictionary_set_value(ldict, key, lval);
  xpc_release(lval);
  return 1;
}

launch_data_t launch_data_dict_lookup(const launch_data_t ldict, const char *key)
{
  if (launch_data_get_type(ldict) == LAUNCH_DATA_DICTIONARY)
    return (launch_data_t)xpc_dictionary_get_value(ldict, key);
  else
    return 0;
}

BOOL launch_data_dict_remove(launch_data_t ldict, const char *key)
{
  xpc_dictionary_set_value(ldict, key, 0);
  return 1;
}

void launch_data_dict_iterate(const launch_data_t ldict, launch_data_dict_iterator_t iterator, void *ctx)
{
  _QWORD v3[2];

  v3[0] = iterator;
  v3[1] = ctx;
  xpc_dictionary_apply_f(ldict, (uint64_t)v3, (uint64_t)_launch_data_dict_iterate_apply);
}

uint64_t _launch_data_dict_iterate_apply(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))a3)(a2, a1, *(_QWORD *)(a3 + 8));
}

BOOL launch_data_array_set_index(launch_data_t larray, const launch_data_t lval, size_t idx)
{
  size_t count;
  char *v8;

  count = xpc_array_get_count(larray);
  if (count <= idx)
  {
    if (count != idx)
    {
      v8 = _xpc_asprintf("Out-of-bounds launch array insertion attempt.");
      _xpc_api_misuse(v8);
    }
    xpc_array_append_value(larray, lval);
  }
  else
  {
    xpc_array_set_value(larray, idx, lval);
  }
  xpc_release(lval);
  return 1;
}

xpc_object_t launch_data_new_errno(int a1)
{
  return xpc_uint64_create(a1);
}

BOOL launch_data_set_fd(launch_data_t ld, int fd)
{
  char *v2;

  v2 = _xpc_asprintf("This API is functionally useless.", *(_QWORD *)&fd);
  _xpc_api_misuse(v2);
}

BOOL launch_data_set_machport(launch_data_t ld, mach_port_t mp)
{
  char *v2;

  v2 = _xpc_asprintf("This API is functionally useless.", *(_QWORD *)&mp);
  _xpc_api_misuse(v2);
}

BOOL launch_data_set_integer(launch_data_t ld, uint64_t val)
{
  _xpc_int64_set_value();
}

uint64_t sub_1DEE8E630()
{
  return 1;
}

BOOL launch_data_set_BOOL(launch_data_t ld, BOOL val)
{
  _xpc_BOOL_set_value((uint64_t)ld, val);
  return 1;
}

BOOL launch_data_set_real(launch_data_t ld, double val)
{
  _xpc_double_set_value((uint64_t)ld, val);
  return 1;
}

BOOL launch_data_set_string(launch_data_t ld, const char *val)
{
  _xpc_string_set_value((uint64_t)ld, val);
  return 1;
}

BOOL launch_data_set_opaque(launch_data_t ld, const void *bytes, size_t sz)
{
  _xpc_data_set_value((uint64_t)ld, bytes, sz);
  return 1;
}

uint64_t launch_data_set_errno()
{
  return 1;
}

void *__cdecl launch_data_get_opaque(const launch_data_t ld)
{
  void *v2;
  uint64_t v3;

  v2 = 0;
  v3 = 0;
  if (xpc_data_get_bytes_ptr_and_length(ld, &v2, &v3))
    return v2;
  else
    return 0;
}

size_t launch_data_get_opaque_size(const launch_data_t ld)
{
  uint64_t v2;
  size_t v3;

  v2 = 0;
  v3 = 0;
  if (xpc_data_get_bytes_ptr_and_length(ld, &v2, &v3))
    return v3;
  else
    return 0;
}

int launch_data_get_errno(const launch_data_t ld)
{
  return xpc_uint64_get_value(ld);
}

int launch_get_fd(void)
{
  return -1;
}

launch_data_t launch_msg(const launch_data_t request)
{
  xpc_object_t v2;
  _launch_data *v4;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "type", 7uLL);
  xpc_dictionary_set_uint64(v2, "handle", 0);
  xpc_dictionary_set_value(v2, "request", request);
  if (xpc_get_type(request) == (xpc_type_t)OS_xpc_dictionary
    && xpc_dictionary_get_BOOL(request, "_TargetLocalDomain"))
  {
    xpc_dictionary_set_uint64(v2, "type", 6uLL);
  }
  v4 = 0;
  _xpc_launch_routine(100, v2, (xpc_object_t *)&v4);
  xpc_release(v2);
  return v4;
}

BOOL _xpc_BOOL_equal(uint64_t a1, uint64_t a2)
{
  return *(unsigned __int8 *)(a1 + 24) == *(unsigned __int8 *)(a2 + 24);
}

uint64_t _xpc_BOOL_hash(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 24))
    return 45057;
  else
    return 4107;
}

uint64_t _xpc_BOOL_desc(uint64_t a1, uint64_t a2)
{
  const char *v3;
  unsigned int v4;
  int v5;
  char __str[16];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C874D8];
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  *(_OWORD *)__str = 0u;
  v8 = 0u;
  if (*(_BYTE *)(a1 + 24))
    v3 = "true";
  else
    v3 = "false";
  v4 = snprintf(__str, 0x80uLL, "%s", v3);
  if (v4 >= 0x7F)
    v5 = 127;
  else
    v5 = v4;
  return _xpc_serializer_append(a2, __str, (v5 + 1), 0);
}

uint64_t _xpc_BOOL_debug_desc(_BYTE *a1, uint64_t a2)
{
  const char *v3;
  unsigned int v4;
  int v5;
  char __str[16];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C874D8];
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  *(_OWORD *)__str = 0u;
  v8 = 0u;
  if (a1[24])
    v3 = "true";
  else
    v3 = "false";
  v4 = snprintf(__str, 0x80uLL, "<%s: %p>: %s", "BOOL", a1, v3);
  if (v4 >= 0x7F)
    v5 = 127;
  else
    v5 = v4;
  return _xpc_serializer_append(a2, __str, (v5 + 1), 0);
}

uint64_t _xpc_BOOL_debug(uint64_t a1, char *__str, size_t __size)
{
  const char *v3;

  if (*(_BYTE *)(a1 + 24))
    v3 = "true";
  else
    v3 = "false";
  return snprintf(__str, __size, ", value = %s", v3);
}

uint64_t _xpc_BOOL_serialize(uint64_t a1, uint64_t a2)
{
  int v5;
  int __src;

  __src = 0x2000;
  _xpc_serializer_append(a2, &__src, 4uLL, 1);
  v5 = *(unsigned __int8 *)(a1 + 24);
  return _xpc_serializer_append(a2, &v5, 4uLL, 1);
}

__objc2_class **_xpc_BOOL_deserialize(uint64_t a1)
{
  __objc2_class **result;

  result = (__objc2_class **)_xpc_graph_deserializer_read(a1, 4uLL);
  if (result)
  {
    if (*(_DWORD *)result == 1)
    {
      return &_xpc_BOOL_true;
    }
    else if (*(_DWORD *)result)
    {
      return 0;
    }
    else
    {
      return &_xpc_BOOL_false;
    }
  }
  return result;
}

uint64_t _xpc_BOOL_wire_length()
{
  return 4;
}

uint64_t _xpc_BOOL_create_distinct(char a1)
{
  uint64_t result;

  result = _xpc_base_create();
  *(_DWORD *)(result + 20) = 4;
  *(_BYTE *)(result + 24) = a1;
  return result;
}

uint64_t _xpc_BOOL_set_value(uint64_t result, char a2)
{
  *(_BYTE *)(result + 24) = a2;
  return result;
}

uint64_t _xpc_BOOL_get_wire_value(uint64_t a1, _BYTE *a2)
{
  uint64_t result;
  int v4;

  result = _xpc_graph_deserializer_read(a1, 4uLL);
  if (result)
  {
    v4 = *(_DWORD *)result;
    if (!*(_DWORD *)result || (result = 0, v4 == 1))
    {
      *a2 = v4;
      return 1;
    }
  }
  return result;
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  if (value)
    return &_xpc_BOOL_true;
  else
    return &_xpc_BOOL_false;
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return xpc_get_type(xBOOL) == (xpc_type_t)OS_xpc_BOOL && *((_BYTE *)xBOOL + 24) != 0;
}

uint64_t xpc_get_event_name(const char *a1, uint64_t a2, char *a3)
{
  xpc_object_t v6;
  int v7;
  char *v8;
  uint64_t v9;
  const char *string;
  xpc_object_t xdict;

  v6 = xpc_dictionary_create(0, 0, 0);
  xdict = 0;
  xpc_dictionary_set_string(v6, "stream", a1);
  xpc_dictionary_set_uint64(v6, "token", a2);
  v7 = _xpc_bootstrap_routine(402, v6, &xdict);
  if (!v7)
  {
    string = xpc_dictionary_get_string(xdict, "name");
    if (string)
    {
      strlcpy(a3, string, 0x80uLL);
      xpc_release(xdict);
      v9 = 1;
      goto LABEL_5;
    }
    xpc_release(xdict);
    v7 = 118;
  }
  v8 = xpc_strerror(v7);
  syslog(3, "Could not get event name for stream/token: %s/%llu: %d: %s", a1, a2, v7, v8);
  v9 = 0;
LABEL_5:
  xpc_release(v6);
  return v9;
}

xpc_object_t xpc_copy_event_entitlements(const char *a1, uint64_t a2)
{
  xpc_object_t v4;
  int v5;
  char *v6;
  xpc_object_t v7;
  xpc_object_t value;
  xpc_object_t xdict;

  v4 = xpc_dictionary_create(0, 0, 0);
  xdict = 0;
  xpc_dictionary_set_string(v4, "stream", a1);
  xpc_dictionary_set_uint64(v4, "token", a2);
  v5 = _xpc_bootstrap_routine(405, v4, &xdict);
  if (v5)
    goto LABEL_2;
  value = xpc_dictionary_get_value(xdict, "out-entitlements");
  if (!value)
  {
    xpc_release(xdict);
    v5 = 118;
LABEL_2:
    v6 = xpc_strerror(v5);
    syslog(3, "Could not get entitlements for stream/token: %s/%llu: %d: %s", a1, a2, v5, v6);
    v7 = 0;
    goto LABEL_9;
  }
  v7 = value;
  if (xpc_get_type(value) == (xpc_type_t)OS_xpc_dictionary)
    v7 = xpc_retain(v7);
  else
    xpc_release(v7);
  xpc_release(xdict);
LABEL_9:
  xpc_release(v4);
  return v7;
}

void xpc_set_event_with_flags(const char *a1, const char *a2, void *a3, uint64_t a4)
{
  xpc_object_t v8;
  int v9;
  int v10;
  char *v11;
  xpc_object_t object;

  v8 = xpc_dictionary_create(0, 0, 0);
  object = 0;
  xpc_dictionary_set_string(v8, "stream", a1);
  xpc_dictionary_set_string(v8, "name", a2);
  xpc_dictionary_set_uint64(v8, "flags", a4);
  if (a3)
    xpc_dictionary_set_value(v8, "descriptor", a3);
  v9 = _xpc_bootstrap_routine(400, v8, &object);
  if (v9)
  {
    v10 = v9;
    v11 = xpc_strerror(v9);
    syslog(3, "Could not set XPC event for stream/key: %s/%s: %d: %s", a1, a2, v10, v11);
  }
  else
  {
    xpc_release(object);
  }
  xpc_release(v8);
}

void xpc_set_event(const char *a1, const char *a2, void *a3)
{
  xpc_set_event_with_flags(a1, a2, a3, 0);
}

xpc_object_t xpc_copy_event(const char *a1, const char *a2)
{
  xpc_object_t v4;
  void *v5;
  int v6;
  int v7;
  xpc_object_t v8;
  xpc_object_t value;
  char *v10;
  xpc_object_t xdict;

  v4 = xpc_dictionary_create(0, 0, 0);
  v5 = v4;
  xdict = 0;
  if (a1)
  {
    xpc_dictionary_set_string(v4, "stream", a1);
    if (a2)
      xpc_dictionary_set_string(v5, "name", a2);
  }
  v6 = _xpc_bootstrap_routine(401, v5, &xdict);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
LABEL_11:
    if (v7 != 3)
    {
      v10 = xpc_strerror(v7);
      syslog(3, "Could not copy XPC event for stream/key: %s/%s: %d: %s", a1, a2, v7, v10);
    }
    goto LABEL_13;
  }
  value = xpc_dictionary_get_value(xdict, "event");
  v8 = value;
  if (value && xpc_get_type(value) == (xpc_type_t)OS_xpc_dictionary)
  {
    v8 = xpc_retain(v8);
    v7 = 0;
  }
  else
  {
    v7 = 118;
  }
  xpc_release(xdict);
  if (v7)
    goto LABEL_11;
LABEL_13:
  xpc_release(v5);
  return v8;
}

uint64_t xpc_event_stream_check_in2()
{
  return 0;
}

uint64_t xpc_event_stream_check_in()
{
  return 0;
}

void xpc_set_event_state(const char *a1, uint64_t a2, BOOL a3)
{
  int v4;
  int v5;
  char *v6;

  v4 = _xpc_set_event_state_impl(a1, a2, a3);
  if (v4)
  {
    v5 = v4;
    v6 = xpc_strerror(v4);
    syslog(3, "Could not set event state: %s: %d: %s", a1, v5, v6);
  }
}

int64_t _xpc_set_event_state_impl(const char *a1, uint64_t a2, BOOL a3)
{
  xpc_object_t v6;
  int64_t v7;
  xpc_object_t object;

  v6 = xpc_dictionary_create(0, 0, 0);
  object = 0;
  xpc_dictionary_set_string(v6, "stream", a1);
  xpc_dictionary_set_uint64(v6, "token", a2);
  xpc_dictionary_set_BOOL(v6, "state", a3);
  v7 = _xpc_bootstrap_routine(404, v6, &object);
  if (!(_DWORD)v7)
    xpc_release(object);
  xpc_release(v6);
  return v7;
}

uint64_t xpc_get_service_identifier_for_token(uint64_t a1, char *a2)
{
  xpc_object_t v4;
  int v5;
  char *v6;
  uint64_t v7;
  const char *string;
  xpc_object_t xdict;

  v4 = xpc_dictionary_create(0, 0, 0);
  xdict = 0;
  xpc_dictionary_set_uint64(v4, "token", a1);
  v5 = _xpc_bootstrap_routine(410, v4, &xdict);
  if (!v5)
  {
    string = xpc_dictionary_get_string(xdict, "identifier");
    if (string)
    {
      strlcpy(a2, string, 0x80uLL);
      xpc_release(xdict);
      v7 = 1;
      goto LABEL_5;
    }
    xpc_release(xdict);
    v5 = 118;
  }
  v6 = xpc_strerror(v5);
  syslog(3, "Could not get service identifier for token: %llu: %d: %s", a1, v5, v6);
  v7 = 0;
LABEL_5:
  xpc_release(v4);
  return v7;
}

uint64_t xpc_get_service_uid_for_token(uint64_t a1)
{
  xpc_object_t v2;
  int v3;
  int v4;
  char *v5;
  uint64_t uint64;
  xpc_object_t xdict;

  v2 = xpc_dictionary_create(0, 0, 0);
  xdict = 0;
  xpc_dictionary_set_uint64(v2, "token", a1);
  v3 = _xpc_bootstrap_routine(411, v2, &xdict);
  if (v3)
  {
    v4 = v3;
    v5 = xpc_strerror(v3);
    syslog(3, "Could not get uid for token: %llu: %d: %s", a1, v4, v5);
    uint64 = 0xFFFFFFFFLL;
  }
  else
  {
    uint64 = xpc_dictionary_get_uint64(xdict, "uid");
    xpc_release(xdict);
  }
  xpc_release(v2);
  return uint64;
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
  NSObject *global_queue;
  xpc_connection_t mach_service;
  _QWORD *v7;
  xpc_object_t v8;

  global_queue = targetq;
  if (!targetq)
    global_queue = dispatch_get_global_queue(0, 0);
  mach_service = xpc_connection_create_mach_service(stream, 0, 1uLL);
  xpc_connection_set_event_channel((uint64_t)mach_service, 0);
  v7 = _xpc_alloc(0x18uLL);
  *v7 = xpc_retain(mach_service);
  v7[1] = global_queue;
  dispatch_retain(global_queue);
  v7[2] = _Block_copy(handler);
  xpc_connection_set_context(mach_service, v7);
  xpc_connection_set_finalizer_f(mach_service, (xpc_finalizer_t)_xpc_events_ctx_finalizer);
  _xpc_connection_set_event_handler_f((uint64_t)mach_service, (unint64_t)_xpc_events_listener_event);
  xpc_connection_activate(mach_service);
  os_unfair_lock_lock_with_options();
  v8 = (xpc_object_t)_event_listeners;
  if (!_event_listeners)
  {
    v8 = xpc_array_create(0, 0);
    _event_listeners = (uint64_t)v8;
  }
  xpc_array_append_value(v8, mach_service);
  os_unfair_lock_unlock((os_unfair_lock_t)&_event_listeners_lock);
}

void _xpc_events_ctx_finalizer(uint64_t a1)
{
  NSObject *v2;
  const void *v3;

  v2 = *(NSObject **)(a1 + 8);
  v3 = *(const void **)(a1 + 16);
  xpc_release(*(xpc_object_t *)a1);
  dispatch_release(v2);
  _Block_release(v3);
  free((void *)a1);
}

void _xpc_events_listener_event(_xpc_connection_s *a1, uint64_t a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  char *v6;
  _QWORD *v7;

  v4 = *(void **)a2;
  v3 = *(NSObject **)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  if (xpc_get_type(a1) == (xpc_type_t)OS_xpc_connection)
  {
    v7 = _xpc_alloc(0x18uLL);
    *v7 = a1;
    v7[1] = 0;
    v7[2] = v5;
    xpc_connection_set_context(a1, v7);
    xpc_connection_set_finalizer_f(a1, (xpc_finalizer_t)MEMORY[0x1E0C88920]);
    xpc_connection_set_target_queue(a1, v3);
    _xpc_connection_set_event_handler_f((uint64_t)a1, (unint64_t)_xpc_events_peer_event);
    xpc_connection_activate(a1);
  }
  else if (a1 != (_xpc_connection_s *)&_xpc_error_termination_imminent)
  {
    v6 = xpc_copy_description(a1);
    syslog(4, "Event stream listener got an error: %s", v6);
    free(v6);
    xpc_release(v4);
  }
}

uint64_t xpc_event_publisher_create(const char *a1, NSObject *a2)
{
  uint64_t v4;

  strlen(a1);
  v4 = _xpc_event_publisher_alloc();
  strcpy((char *)(v4 + 88), a1);
  *(_QWORD *)(v4 + 16) = dispatch_queue_create(a1, 0);
  *(_DWORD *)(v4 + 24) = 0;
  *(_QWORD *)(v4 + 32) = a2;
  dispatch_retain(a2);
  return v4;
}

void xpc_event_publisher_set_handler(uint64_t a1, void *aBlock)
{
  void *v3;
  NSObject *v4;
  _QWORD v5[6];

  v3 = _Block_copy(aBlock);
  v4 = *(NSObject **)(a1 + 16);
  v5[0] = MEMORY[0x1E0C87450];
  v5[1] = 0x40000000;
  v5[2] = __xpc_event_publisher_set_handler_block_invoke;
  v5[3] = &unk_1EA9580A8;
  v5[4] = v3;
  v5[5] = a1;
  dispatch_sync(v4, v5);
}

void __xpc_event_publisher_set_handler_block_invoke(uint64_t a1)
{
  uint64_t v1;
  const void *v3;

  v1 = *(_QWORD *)(a1 + 40);
  if (*(_DWORD *)(v1 + 24))
    _xpc_mach_message_request_handoff_reply_cold_1();
  v3 = *(const void **)(v1 + 40);
  if (v3)
  {
    _Block_release(v3);
    v1 = *(_QWORD *)(a1 + 40);
  }
  *(_QWORD *)(v1 + 40) = *(_QWORD *)(a1 + 32);
}

void xpc_event_publisher_set_error_handler(uint64_t a1, void *aBlock)
{
  void *v3;
  NSObject *v4;
  _QWORD v5[6];

  v3 = _Block_copy(aBlock);
  v4 = *(NSObject **)(a1 + 16);
  v5[0] = MEMORY[0x1E0C87450];
  v5[1] = 0x40000000;
  v5[2] = __xpc_event_publisher_set_error_handler_block_invoke;
  v5[3] = &unk_1EA9580D0;
  v5[4] = v3;
  v5[5] = a1;
  dispatch_sync(v4, v5);
}

void __xpc_event_publisher_set_error_handler_block_invoke(uint64_t a1)
{
  uint64_t v1;
  const void *v3;

  v1 = *(_QWORD *)(a1 + 40);
  if (*(_DWORD *)(v1 + 24))
    _xpc_mach_message_request_handoff_reply_cold_1();
  v3 = *(const void **)(v1 + 48);
  if (v3)
  {
    _Block_release(v3);
    v1 = *(_QWORD *)(a1 + 40);
  }
  *(_QWORD *)(v1 + 48) = *(_QWORD *)(a1 + 32);
}

void xpc_event_publisher_set_initial_load_completed_handler_4remoted(uint64_t a1, void *aBlock)
{
  void *v3;
  NSObject *v4;
  _QWORD v5[6];

  v3 = _Block_copy(aBlock);
  v4 = *(NSObject **)(a1 + 16);
  v5[0] = MEMORY[0x1E0C87450];
  v5[1] = 0x40000000;
  v5[2] = __xpc_event_publisher_set_initial_load_completed_handler_4remoted_block_invoke;
  v5[3] = &unk_1EA9580F8;
  v5[4] = v3;
  v5[5] = a1;
  dispatch_sync(v4, v5);
}

void __xpc_event_publisher_set_initial_load_completed_handler_4remoted_block_invoke(uint64_t a1)
{
  uint64_t v1;
  const void *v3;

  v1 = *(_QWORD *)(a1 + 40);
  if (*(_DWORD *)(v1 + 24))
    _xpc_mach_message_request_handoff_reply_cold_1();
  v3 = *(const void **)(v1 + 56);
  if (v3)
  {
    _Block_release(v3);
    v1 = *(_QWORD *)(a1 + 40);
  }
  *(_QWORD *)(v1 + 56) = *(_QWORD *)(a1 + 32);
}

void _xpc_event_publisher_xref_dispose(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[5];

  v1 = *(NSObject **)(a1 + 16);
  block[0] = MEMORY[0x1E0C87450];
  block[1] = 0x40000000;
  block[2] = ___xpc_event_publisher_xref_dispose_block_invoke;
  block[3] = &__block_descriptor_tmp_20;
  block[4] = a1;
  dispatch_sync(v1, block);
}

void ___xpc_event_publisher_xref_dispose_block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_DWORD *)(v1 + 24);
  if (v2 != 2)
  {
    if (v2)
      ___xpc_event_publisher_xref_dispose_block_invoke_cold_1();
    _xpc_event_publisher_cancel(v1);
  }
}

void _xpc_event_publisher_cancel(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
  if (*(_DWORD *)(a1 + 24) == 1)
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 64));
  else
    _xpc_event_publisher_cancel_complete(a1);
}

void _xpc_event_publisher_dispose(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 24) != 2)
    _xpc_mach_message_request_handoff_reply_cold_1();
  dispatch_release(*(dispatch_object_t *)(a1 + 16));
}

void xpc_event_publisher_activate(mach_port_context_t a1)
{
  unsigned int *v2;
  xpc_object_t v4;
  unsigned int v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD block[5];
  _QWORD handler[5];
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  mach_port_context_t v16;
  unsigned int v17;

  v2 = (unsigned int *)(a1 + 24);
  do
  {
    if (__ldxr(v2))
    {
      __clrex();
      return;
    }
  }
  while (__stxr(1u, v2));
  os_unfair_lock_lock_with_options();
  v4 = (xpc_object_t)_event_publishers;
  if (!_event_publishers)
  {
    v4 = xpc_dictionary_create(0, 0, 0);
    _event_publishers = (uint64_t)v4;
  }
  if (xpc_dictionary_get_pointer(v4, (const char *)(a1 + 88)))
    xpc_event_publisher_activate_cold_1((const char *)(a1 + 88));
  xpc_dictionary_set_pointer((void *)_event_publishers, (const char *)(a1 + 88), a1);
  os_unfair_lock_unlock((os_unfair_lock_t)&_event_publishers_lock);
  v5 = _xpc_mach_port_allocate(0x33u, 6u, a1);
  *(_QWORD *)(a1 + 64) = dispatch_source_create(MEMORY[0x1E0C86F00], v5, 0, *(dispatch_queue_t *)(a1 + 16));
  _os_object_retain_internal();
  v6 = MEMORY[0x1E0C87450];
  v12 = MEMORY[0x1E0C87450];
  v13 = 0x40000000;
  v14 = ___xpc_event_publisher_setup_poll_block_invoke;
  v15 = &__block_descriptor_tmp_42_0;
  v16 = a1;
  v17 = v5;
  dispatch_source_set_mandatory_cancel_handler();
  v7 = *(NSObject **)(a1 + 64);
  handler[0] = v6;
  handler[1] = 0x40000000;
  handler[2] = ___xpc_event_publisher_setup_poll_block_invoke_2;
  handler[3] = &__block_descriptor_tmp_44_0;
  v11 = v5;
  handler[4] = a1;
  dispatch_source_set_event_handler(v7, handler);
  dispatch_activate(*(dispatch_object_t *)(a1 + 64));
  v8 = *(NSObject **)(a1 + 16);
  block[0] = v6;
  block[1] = 0x40000000;
  block[2] = __xpc_event_publisher_activate_block_invoke;
  block[3] = &__block_descriptor_tmp_21;
  block[4] = a1;
  dispatch_async(v8, block);
}

void __xpc_event_publisher_activate_block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v2 + 24) == 1)
  {
    _xpc_event_publisher_fetch_subscriptions(v2);
    _xpc_event_publisher_arm_poll(*(_QWORD *)(a1 + 32));
  }
}

void _xpc_event_publisher_fetch_subscriptions(uint64_t a1)
{
  void *v2;
  xpc_object_t v3;
  int v4;
  xpc_object_t object;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
  v2 = (void *)os_transaction_create((const char *)(a1 + 88));
  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "stream", (const char *)(a1 + 88));
  object = 0;
  v4 = _xpc_bootstrap_routine(403, v3, &object);
  xpc_release(v3);
  if (v4)
  {
    _xpc_event_publisher_error(a1, v4);
  }
  else
  {
    _xpc_event_publisher_set_subscriptions(a1, object, v2);
    xpc_release(object);
  }
  os_release(v2);
}

void _xpc_event_publisher_arm_poll(uint64_t a1)
{
  xpc_object_t v2;
  uintptr_t handle;
  int v4;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
  if (*(_DWORD *)(a1 + 24) == 1)
  {
    v2 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v2, "stream", (const char *)(a1 + 88));
    handle = dispatch_source_get_handle(*(dispatch_source_t *)(a1 + 64));
    v4 = _xpc_event_routine_async(406, v2, handle);
    xpc_release(v2);
    if (v4)
      _xpc_event_publisher_error(a1, v4);
  }
}

uint64_t xpc_event_publisher_fire(uint64_t a1, uint64_t a2, void *a3)
{
  return _xpc_event_publisher_fire_impl(a1, a2, a3, (uint64_t)&__block_literal_global_0);
}

uint64_t _xpc_event_publisher_fire_impl(uint64_t a1, uint64_t a2, xpc_object_t object, uint64_t a4)
{
  xpc_object_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  _QWORD block[8];
  char v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  _OWORD string[8];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C874D8];
  if (object)
  {
    v7 = object;
    xpc_retain(object);
  }
  else
  {
    v7 = xpc_dictionary_create(0, 0, 0);
  }
  v18 = 0;
  v19 = &v18;
  v20 = 0x2000000000;
  v21 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2000000000;
  memset(string, 0, sizeof(string));
  v17 = 0;
  if ((xpc_get_event_name((const char *)(a1 + 88), a2, (char *)string) & 1) != 0)
  {
    v8 = *(NSObject **)(a1 + 16);
    block[0] = MEMORY[0x1E0C87450];
    block[1] = 0x40000000;
    block[2] = ___xpc_event_publisher_fire_impl_block_invoke;
    block[3] = &unk_1EA958320;
    block[6] = a1;
    block[7] = a2;
    block[4] = &v18;
    block[5] = &v14;
    v13 = 0;
    dispatch_sync(v8, block);
    if (!*((_DWORD *)v15 + 6))
    {
      xpc_dictionary_set_string(v7, "XPCEventName", (const char *)string);
      (*(void (**)(uint64_t, uint64_t, xpc_object_t))(a4 + 16))(a4, v19[3], v7);
    }
  }
  else
  {
    *((_DWORD *)v15 + 6) = 132;
  }
  v9 = (void *)v19[3];
  if (v9)
    xpc_release(v9);
  xpc_release(v7);
  v10 = *((unsigned int *)v15 + 6);
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
  return v10;
}

void __xpc_event_publisher_fire_block_invoke(int a1, xpc_connection_t connection, xpc_object_t message)
{
  xpc_connection_send_message(connection, message);
}

uint64_t xpc_event_publisher_fire_noboost(uint64_t a1, uint64_t a2, void *a3)
{
  return _xpc_event_publisher_fire_impl(a1, a2, a3, (uint64_t)&__block_literal_global_25);
}

void __xpc_event_publisher_fire_noboost_block_invoke(int a1, unsigned int *a2, xpc_object_t object)
{
  xpc_connection_send_notification(a2, object);
}

uint64_t xpc_event_publisher_fire_barrier(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C87450];
  v4[1] = 0x40000000;
  v4[2] = __xpc_event_publisher_fire_barrier_block_invoke;
  v4[3] = &unk_1EA9581E0;
  v4[4] = a3;
  return _xpc_event_publisher_fire_impl(a1, a2, 0, (uint64_t)v4);
}

void __xpc_event_publisher_fire_barrier_block_invoke(uint64_t a1, xpc_connection_t connection)
{
  xpc_connection_send_barrier(connection, *(dispatch_block_t *)(a1 + 32));
}

uint64_t xpc_event_publisher_fire_with_reply(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[6];

  v6[0] = MEMORY[0x1E0C87450];
  v6[1] = 0x40000000;
  v6[2] = __xpc_event_publisher_fire_with_reply_block_invoke;
  v6[3] = &unk_1EA958208;
  v6[4] = a5;
  v6[5] = a4;
  return _xpc_event_publisher_fire_impl(a1, a2, a3, (uint64_t)v6);
}

void __xpc_event_publisher_fire_with_reply_block_invoke(uint64_t a1, xpc_connection_t connection, xpc_object_t message)
{
  xpc_connection_send_message_with_reply(connection, message, *(dispatch_queue_t *)(a1 + 40), *(xpc_handler_t *)(a1 + 32));
}

uint64_t xpc_event_publisher_fire_with_reply_sync(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2000000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C87450];
  v5[1] = 0x40000000;
  v5[2] = __xpc_event_publisher_fire_with_reply_sync_block_invoke;
  v5[3] = &unk_1EA958230;
  v5[4] = &v6;
  v3 = 0;
  if (!_xpc_event_publisher_fire_impl(a1, a2, a3, (uint64_t)v5))
    v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

xpc_object_t __xpc_event_publisher_fire_with_reply_sync_block_invoke(uint64_t a1, xpc_connection_t connection, xpc_object_t message)
{
  xpc_object_t result;

  result = xpc_connection_send_message_with_reply_sync(connection, message);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

int64_t xpc_event_publisher_set_subscriber_keepalive(uint64_t a1, uint64_t a2, BOOL a3)
{
  return _xpc_set_event_state_impl((const char *)(a1 + 88), a2, a3);
}

uint64_t xpc_event_publisher_get_subscriber_asid(uint64_t a1, uint64_t a2)
{
  xpc_object_t v4;
  const char *v5;
  int v6;
  char *v7;
  int64_t int64;
  xpc_object_t xdict;

  v4 = xpc_dictionary_create(0, 0, 0);
  xdict = 0;
  v5 = (const char *)(a1 + 88);
  xpc_dictionary_set_string(v4, "stream", v5);
  xpc_dictionary_set_uint64(v4, "token", a2);
  v6 = _xpc_bootstrap_routine(407, v4, &xdict);
  xpc_release(v4);
  if (v6)
  {
    v7 = xpc_strerror(v6);
    syslog(3, "Could not get asid for stream/token: %s/%llu: %d: %s", v5, a2, v6, v7);
    return 0xFFFFFFFFLL;
  }
  else
  {
    int64 = xpc_dictionary_get_int64(xdict, "asid");
    xpc_release(xdict);
  }
  return int64;
}

int64_t xpc_event_publisher_set_event(uint64_t a1, uint64_t a2, void *a3, int a4, uint64_t *a5)
{
  xpc_object_t v10;
  int64_t v11;
  int64_t v12;
  char *v13;
  NSObject *v14;
  _QWORD block[6];
  xpc_object_t v17;

  v10 = xpc_dictionary_create(0, 0, 0);
  v17 = 0;
  xpc_dictionary_set_string(v10, "stream", (const char *)(a1 + 88));
  xpc_dictionary_set_uint64(v10, "token", a2);
  xpc_dictionary_set_uint64(v10, "flags", 0);
  xpc_dictionary_set_int64(v10, "subscriber-pid", a4);
  if (a3)
    xpc_dictionary_set_value(v10, "descriptor", a3);
  v11 = _xpc_bootstrap_routine(408, v10, &v17);
  v12 = v11;
  if ((_DWORD)v11)
  {
    v13 = xpc_strerror(v11);
    syslog(3, "Could not set XPC event for stream/token/subscriber: %s/%llu/%d: %d: %s", (const char *)(a1 + 88), a2, a4, v12, v13);
  }
  else
  {
    *a5 = xpc_dictionary_get_uint64(v17, "token");
    v14 = *(NSObject **)(a1 + 16);
    block[0] = MEMORY[0x1E0C87450];
    block[1] = 0x40000000;
    block[2] = __xpc_event_publisher_set_event_block_invoke;
    block[3] = &__block_descriptor_tmp_33;
    block[4] = a1;
    block[5] = v17;
    dispatch_sync(v14, block);
    xpc_release(v17);
  }
  xpc_release(v10);
  return v12;
}

void __xpc_event_publisher_set_event_block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)os_transaction_create((const char *)(*(_QWORD *)(a1 + 32) + 88));
  _xpc_event_publisher_set_subscriptions(*(_QWORD *)(a1 + 32), *(xpc_object_t *)(a1 + 40), v2);
  os_release(v2);
}

void _xpc_event_publisher_set_subscriptions(uint64_t a1, xpc_object_t xdict, void *a3)
{
  xpc_object_t value;
  _BOOL4 v7;
  size_t count;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unsigned int *v12;
  size_t v13;
  uint64_t uint64;
  unsigned int v15;
  unsigned int *v16;
  unsigned int v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  NSObject *v23;
  uint64_t v24;
  _xpc_connection_s *v25;
  _QWORD *v26;
  _xpc_connection_s *v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  xpc_object_t v33;
  xpc_object_t v34;
  NSObject *v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  const void *v39;
  NSObject *v40;
  _BOOL4 v41;
  _QWORD v42[6];
  _QWORD v43[6];
  _QWORD v44[8];
  _QWORD block[8];

  value = xpc_dictionary_get_value(xdict, "events");
  v7 = xpc_dictionary_get_BOOL(xdict, "initial-load-completed");
  if (xpc_get_type(value) != (xpc_type_t)OS_xpc_array)
    _xpc_mach_message_request_handoff_reply_cold_1();
  count = xpc_array_get_count(value);
  v9 = count;
  if ((count & 1) != 0)
    _xpc_event_publisher_set_subscriptions_cold_3();
  v10 = count >> 1;
  v11 = *(_QWORD *)(a1 + 72);
  v12 = (unsigned int *)_xpc_alloc(24 * (count >> 1) + 8);
  *v12 = v10;
  if (v9 >= 2)
  {
    v13 = 0;
    if (v10 <= 1)
      v10 = 1;
    do
    {
      uint64 = xpc_array_get_uint64(value, v13);
      if (!uint64)
        _xpc_mach_message_request_handoff_reply_cold_1();
      v15 = v12[1];
      if (v15 >= *v12)
        _xpc_mach_message_request_handoff_reply_cold_1();
      v16 = &v12[6 * v15];
      *((_QWORD *)v16 + 2) = 0;
      *((_QWORD *)v16 + 3) = 0;
      *((_QWORD *)v16 + 1) = uint64;
      v12[1] = v15 + 1;
      v13 += 2;
      --v10;
    }
    while (v10);
  }
  v41 = v7;
  if (v11 && *(_DWORD *)(v11 + 4))
  {
    v17 = 0;
    while (1)
    {
      v18 = (_QWORD *)_xpc_token_cache_get_at_index(v11, v17);
      v19 = v18;
      v20 = *v18;
      v21 = v12[1];
      v22 = v12 + 4;
      if ((_DWORD)v21)
        break;
LABEL_15:
      os_retain(a3);
      v23 = *(NSObject **)(a1 + 32);
      v24 = *(_QWORD *)(a1 + 40);
      block[0] = MEMORY[0x1E0C87450];
      block[1] = 0x40000000;
      block[2] = ___xpc_event_publisher_set_subscriptions_block_invoke;
      block[3] = &unk_1EA958388;
      block[4] = v24;
      block[5] = v20;
      block[6] = a3;
      dispatch_async(v23, block);
      v27 = (_xpc_connection_s *)v19[1];
      v26 = v19 + 1;
      v25 = v27;
      if (v27)
      {
        xpc_connection_cancel(v25);
LABEL_18:
        *v26 = 0;
      }
      if (++v17 >= *(_DWORD *)(v11 + 4))
        goto LABEL_20;
    }
    while (*(v22 - 1) != v20)
    {
      v22 += 3;
      if (!--v21)
        goto LABEL_15;
    }
    v26 = v18 + 1;
    *v22 = v18[1];
    goto LABEL_18;
  }
LABEL_20:
  if (v12[1])
  {
    v28 = 0;
    do
    {
      v29 = *(_QWORD *)_xpc_token_cache_get_at_index((uint64_t)v12, v28);
      if (v11 && (v30 = *(unsigned int *)(v11 + 4), v31 = (uint64_t *)(v11 + 8), (_DWORD)v30))
      {
        while (1)
        {
          v32 = *v31;
          v31 += 3;
          if (v32 == v29)
            break;
          if (!--v30)
            goto LABEL_26;
        }
      }
      else
      {
LABEL_26:
        os_retain(a3);
        v33 = xpc_array_get_value(value, (2 * v28) | 1);
        v34 = xpc_copy(v33);
        v35 = *(NSObject **)(a1 + 32);
        v36 = *(_QWORD *)(a1 + 40);
        v44[0] = MEMORY[0x1E0C87450];
        v44[1] = 0x40000000;
        v44[2] = ___xpc_event_publisher_set_subscriptions_block_invoke_2;
        v44[3] = &unk_1EA9583B0;
        v44[4] = v36;
        v44[5] = v29;
        v44[6] = v34;
        v44[7] = a3;
        dispatch_async(v35, v44);
      }
      ++v28;
    }
    while (v28 < v12[1]);
  }
  if (!v11)
  {
    os_retain(a3);
    v37 = *(NSObject **)(a1 + 32);
    v38 = *(_QWORD *)(a1 + 40);
    v43[0] = MEMORY[0x1E0C87450];
    v43[1] = 0x40000000;
    v43[2] = ___xpc_event_publisher_set_subscriptions_block_invoke_3;
    v43[3] = &unk_1EA9583D8;
    v43[4] = v38;
    v43[5] = a3;
    dispatch_async(v37, v43);
  }
  if (v41 && *(_QWORD *)(a1 + 56))
  {
    os_retain(a3);
    v39 = *(const void **)(a1 + 56);
    v40 = *(NSObject **)(a1 + 32);
    v42[0] = MEMORY[0x1E0C87450];
    v42[1] = 0x40000000;
    v42[2] = ___xpc_event_publisher_set_subscriptions_block_invoke_4;
    v42[3] = &unk_1EA958400;
    v42[4] = v39;
    v42[5] = a3;
    dispatch_async(v40, v42);
    _Block_release(v39);
    *(_QWORD *)(a1 + 56) = 0;
  }
  free(*(void **)(a1 + 72));
  *(_QWORD *)(a1 + 72) = v12;
}

xpc_object_t xpc_event_publisher_copy_event(uint64_t a1, uint64_t a2, int a3)
{
  xpc_object_t v6;
  const char *v7;
  int v8;
  int v9;
  xpc_object_t v10;
  xpc_object_t value;
  char *v12;
  xpc_object_t xdict;

  v6 = xpc_dictionary_create(0, 0, 0);
  xdict = 0;
  v7 = (const char *)(a1 + 88);
  xpc_dictionary_set_string(v6, "stream", v7);
  xpc_dictionary_set_uint64(v6, "token", a2);
  xpc_dictionary_set_int64(v6, "subscriber-pid", a3);
  v8 = _xpc_bootstrap_routine(409, v6, &xdict);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
LABEL_8:
    if (v9 != 3)
    {
      v12 = xpc_strerror(v9);
      syslog(3, "Could not copy XPC event for stream/token/subscriber: %s/%llu/%d: %d: %s", v7, a2, a3, v9, v12);
    }
    goto LABEL_10;
  }
  value = xpc_dictionary_get_value(xdict, "event");
  v10 = value;
  if (value && xpc_get_type(value) == (xpc_type_t)OS_xpc_dictionary)
  {
    v10 = xpc_retain(v10);
    v9 = 0;
  }
  else
  {
    v9 = 118;
  }
  xpc_release(xdict);
  if (v9)
    goto LABEL_8;
LABEL_10:
  xpc_release(v6);
  return v10;
}

uint64_t xpc_event_publisher_create_subscription(uint64_t a1, const char *a2, const char *a3, void *a4, int a5, uint64_t *a6)
{
  xpc_object_t v12;
  int64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t uint64;
  NSObject *v17;
  _QWORD block[6];
  xpc_object_t v20;

  v12 = xpc_dictionary_create(0, 0, 0);
  v20 = 0;
  xpc_dictionary_set_string(v12, "stream", a2);
  xpc_dictionary_set_string(v12, "name", a3);
  xpc_dictionary_set_value(v12, "descriptor", a4);
  xpc_dictionary_set_int64(v12, "subscriber-pid", a5);
  v13 = _xpc_bootstrap_routine(412, v12, &v20);
  if ((_DWORD)v13)
  {
    v14 = v13;
    v15 = xpc_strerror(v13);
    syslog(3, "Could not create subscription for stream/event/subscriber: %s/%s/%d: %d: %s", a2, a3, a5, v14, v15);
  }
  else
  {
    uint64 = xpc_dictionary_get_uint64(v20, "token");
    if (uint64)
    {
      *a6 = uint64;
      v17 = *(NSObject **)(a1 + 16);
      block[0] = MEMORY[0x1E0C87450];
      block[1] = 0x40000000;
      block[2] = __xpc_event_publisher_create_subscription_block_invoke;
      block[3] = &__block_descriptor_tmp_36;
      block[4] = a1;
      block[5] = v20;
      dispatch_sync(v17, block);
      v14 = 0;
    }
    else
    {
      v14 = 118;
    }
    xpc_release(v20);
  }
  xpc_release(v12);
  return v14;
}

void __xpc_event_publisher_create_subscription_block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)os_transaction_create((const char *)(*(_QWORD *)(a1 + 32) + 88));
  _xpc_event_publisher_set_subscriptions(*(_QWORD *)(a1 + 32), *(xpc_object_t *)(a1 + 40), v2);
  os_release(v2);
}

void xpc_event_publisher_set_throttling(uint64_t a1, unsigned int a2)
{
  NSObject *v2;
  _QWORD v3[5];
  __int16 v4;

  if (a2 <= 2)
    _xpc_mach_message_request_handoff_reply_cold_1();
  v2 = *(NSObject **)(a1 + 16);
  v3[0] = MEMORY[0x1E0C87450];
  v3[1] = 0x40000000;
  v3[2] = __xpc_event_publisher_set_throttling_block_invoke;
  v3[3] = &__block_descriptor_tmp_37;
  v3[4] = a1;
  v4 = a2;
  dispatch_sync(v2, v3);
}

uint64_t __xpc_event_publisher_set_throttling_block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (*(_DWORD *)(v1 + 24))
    _xpc_mach_message_request_handoff_reply_cold_1();
  *(_WORD *)(v1 + 84) = *(_WORD *)(result + 40) >> 1;
  *(_WORD *)(v1 + 86) = *(_WORD *)(result + 40);
  return result;
}

__objc2_class *_xpc_events_peer_event(void *a1, uint64_t a2)
{
  uint64_t v2;
  __objc2_class *result;

  v2 = *(_QWORD *)(a2 + 16);
  result = (__objc2_class *)xpc_get_type(a1);
  if (result == OS_xpc_dictionary)
    return (__objc2_class *)__XPC_CONNECTION_EVENT_HANDLER_CALLOUT__(v2);
  return result;
}

uint64_t __XPC_CONNECTION_EVENT_HANDLER_CALLOUT__(uint64_t a1)
{
  (*(void (**)(void))(a1 + 16))();
  return _os_avoid_tail_call();
}

void _xpc_event_publisher_cancel_complete(uint64_t a1)
{
  int v2;
  uint64_t v3;
  NSObject *v4;
  const void *v5;
  const void *v6;
  const void *v7;
  _DWORD *v8;
  unsigned int v9;
  _xpc_connection_s *v10;
  _QWORD v11[6];

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
  v2 = *(_DWORD *)(a1 + 24);
  if (v2 != 2)
  {
    if (v2 == 1)
    {
      os_unfair_lock_lock_with_options();
      if (xpc_dictionary_get_pointer((void *)_event_publishers, (const char *)(a1 + 88)) != a1)
        _xpc_mach_message_request_handoff_reply_cold_1();
      xpc_dictionary_set_pointer((void *)_event_publishers, (const char *)(a1 + 88), 0);
      os_unfair_lock_unlock((os_unfair_lock_t)&_event_publishers_lock);
    }
    *(_DWORD *)(a1 + 24) = 2;
    if (*(_DWORD *)(a1 + 80))
    {
      v3 = *(_QWORD *)(a1 + 48);
      if (v3)
      {
        v4 = *(NSObject **)(a1 + 32);
        v11[0] = MEMORY[0x1E0C87450];
        v11[1] = 0x40000000;
        v11[2] = ___xpc_event_publisher_cancel_complete_block_invoke;
        v11[3] = &unk_1EA9582B8;
        v11[4] = v3;
        v11[5] = a1;
        dispatch_async(v4, v11);
      }
    }
    v5 = *(const void **)(a1 + 40);
    if (v5)
    {
      _Block_release(v5);
      *(_QWORD *)(a1 + 40) = 0;
    }
    v6 = *(const void **)(a1 + 48);
    if (v6)
    {
      _Block_release(v6);
      *(_QWORD *)(a1 + 48) = 0;
    }
    v7 = *(const void **)(a1 + 56);
    if (v7)
    {
      _Block_release(v7);
      *(_QWORD *)(a1 + 56) = 0;
    }
    dispatch_release(*(dispatch_object_t *)(a1 + 32));
    *(_QWORD *)(a1 + 32) = 0;
    v8 = *(_DWORD **)(a1 + 72);
    if (v8)
    {
      if (v8[1])
      {
        v9 = 0;
        do
        {
          v10 = *(_xpc_connection_s **)(_xpc_token_cache_get_at_index((uint64_t)v8, v9) + 8);
          if (v10)
            xpc_connection_cancel(v10);
          ++v9;
          v8 = *(_DWORD **)(a1 + 72);
        }
        while (v9 < v8[1]);
      }
      free(v8);
      *(_QWORD *)(a1 + 72) = 0;
    }
  }
}

uint64_t ___xpc_event_publisher_cancel_complete_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned int *)(*(_QWORD *)(a1 + 40) + 80));
}

uint64_t _xpc_token_cache_get_at_index(uint64_t a1, unsigned int a2)
{
  if (*(_DWORD *)(a1 + 4) <= a2)
    _xpc_mach_message_request_handoff_reply_cold_1();
  return a1 + 24 * a2 + 8;
}

uint64_t ___xpc_event_publisher_setup_poll_block_invoke(uint64_t a1)
{
  _xpc_event_publisher_cancel_complete(*(_QWORD *)(a1 + 32));
  if (_xpc_mach_port_close_recv(*(_DWORD *)(a1 + 40), -1, *(_QWORD *)(a1 + 32)))
    _os_assumes_log();
  dispatch_release(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 64));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = 0;
  return _os_object_release_internal();
}

void ___xpc_event_publisher_setup_poll_block_invoke_2(uint64_t a1)
{
  int int64;
  xpc_object_t xdict;

  xdict = 0;
  int64 = xpc_pipe_receive(*(_DWORD *)(a1 + 40), &xdict, 0);
  if (int64 || (int64 = xpc_dictionary_get_int64(xdict, "error")) != 0)
  {
    if (xdict)
      xpc_release(xdict);
    _xpc_event_publisher_error(*(_QWORD *)(a1 + 32), int64);
  }
  else
  {
    xpc_release(xdict);
    _xpc_event_publisher_fetch_subscriptions(*(_QWORD *)(a1 + 32));
    _xpc_event_publisher_arm_poll(*(_QWORD *)(a1 + 32));
  }
}

void _xpc_event_publisher_error(uint64_t a1, int a2)
{
  char *v4;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
  if (!*(_DWORD *)(a1 + 80))
  {
    if (a2 == 5)
    {
      syslog(5, "Publisher %s was unable talk to launchd");
    }
    else if (a2 == 124)
    {
      syslog(5, "Publisher %s is removed by launchd");
    }
    else
    {
      v4 = xpc_strerror(a2);
      syslog(3, "Canceling event publisher for %s because of error: %d - %s", (const char *)(a1 + 88), a2, v4);
      *(_DWORD *)(a1 + 80) = a2;
      _xpc_event_publisher_cancel(a1);
    }
  }
}

void ___xpc_event_publisher_fire_impl_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _xpc_connection_s *mach_service;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  _xpc_connection_s *v12;
  uint64_t v13;
  void *v14;
  uint64_t barrier;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  _xpc_connection_s *v21;

  v3 = *(_QWORD *)(a1 + 48);
  v2 = *(_QWORD *)(a1 + 56);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 16));
  *(_DWORD *)(v4 + 24) = 0;
  if (*(_DWORD *)(v3 + 24) == 2)
  {
    v5 = 0;
    mach_service = 0;
    v7 = 89;
LABEL_9:
    *(_DWORD *)(v4 + 24) = v7;
    goto LABEL_10;
  }
  v8 = *(_QWORD *)(v3 + 72);
  if (!v8)
    _xpc_mach_message_request_handoff_reply_cold_1();
  v9 = *(unsigned int *)(v8 + 4);
  if (!(_DWORD)v9)
  {
LABEL_8:
    v5 = 0;
    mach_service = 0;
    v7 = 132;
    goto LABEL_9;
  }
  v5 = v8 + 8;
  while (*(_QWORD *)v5 != v2)
  {
    v5 += 24;
    if (!--v9)
      goto LABEL_8;
  }
  v14 = *(void **)(v5 + 8);
  if (v14)
  {
    mach_service = (_xpc_connection_s *)xpc_retain(v14);
  }
  else
  {
    mach_service = xpc_connection_create_mach_service((const char *)(v3 + 88), *(dispatch_queue_t *)(v3 + 16), 0);
    xpc_connection_set_event_channel((uint64_t)mach_service, v2);
    _os_object_retain_internal();
    barrier = MEMORY[0x1E0C87450];
    v16 = 0x40000000;
    v17 = ___xpc_event_publisher_create_connection_block_invoke;
    v18 = &__block_descriptor_tmp_50;
    v19 = v3;
    v20 = v2;
    v21 = mach_service;
    xpc_connection_set_event_handler(mach_service, &barrier);
    xpc_connection_activate(mach_service);
    *(_QWORD *)(v5 + 8) = xpc_retain(mach_service);
  }
LABEL_10:
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = mach_service;
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    if (*(_BYTE *)(a1 + 64))
    {
      v10 = *(_QWORD *)(a1 + 48);
      if (*(_WORD *)(v10 + 84))
      {
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(v10 + 16));
        if (!v5)
          _xpc_mach_message_request_handoff_reply_cold_1();
        v11 = *(unsigned __int16 *)(v5 + 16);
        if (v11 >= *(unsigned __int16 *)(v10 + 86))
        {
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 55;
        }
        else
        {
          if (v11 == *(unsigned __int16 *)(v10 + 84))
          {
            v13 = *(_QWORD *)v5;
            v12 = *(_xpc_connection_s **)(v5 + 8);
            barrier = MEMORY[0x1E0C87450];
            v16 = 0x40000000;
            v17 = ___xpc_event_publisher_check_and_update_inflight_count_block_invoke;
            v18 = &__block_descriptor_tmp_51;
            v19 = v10;
            v20 = v13;
            xpc_connection_send_barrier(v12, &barrier);
            LOWORD(v11) = *(_WORD *)(v5 + 16);
          }
          *(_WORD *)(v5 + 16) = v11 + 1;
        }
      }
    }
  }
}

__objc2_class *___xpc_event_publisher_create_connection_block_invoke(uint64_t a1, __objc2_class **object)
{
  __objc2_class *result;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  result = (__objc2_class *)xpc_get_type(object);
  if (result != OS_xpc_error)
    result = (__objc2_class *)_os_assumes_log();
  if (object == &_xpc_error_connection_invalid)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
    if (v5)
    {
      v6 = *(unsigned int *)(v5 + 4);
      if ((_DWORD)v6)
      {
        v7 = (_QWORD *)(v5 + 16);
        while (*(v7 - 1) != *(_QWORD *)(a1 + 40))
        {
          v7 += 3;
          if (!--v6)
            goto LABEL_12;
        }
        if (*v7 == *(_QWORD *)(a1 + 48))
          *v7 = 0;
      }
    }
LABEL_12:
    xpc_release(*(xpc_object_t *)(a1 + 48));
    return (__objc2_class *)_os_object_release_internal();
  }
  return result;
}

uint64_t ___xpc_event_publisher_check_and_update_inflight_count_block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  _WORD *i;
  unsigned int v6;
  BOOL v7;
  __int16 v8;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(_QWORD *)(v1 + 72);
  v3 = *(unsigned int *)(v2 + 4);
  if ((_DWORD)v3)
  {
    v4 = *(unsigned __int16 *)(v1 + 84);
    for (i = (_WORD *)(v2 + 24); *((_QWORD *)i - 2) != *(_QWORD *)(result + 40); i += 12)
    {
      if (!--v3)
        return result;
    }
    v6 = (unsigned __int16)*i;
    v7 = v6 >= v4;
    v8 = v6 - v4;
    if (!v7)
      _xpc_mach_message_request_handoff_reply_cold_1();
    *i = v8;
  }
  return result;
}

void ___xpc_event_publisher_set_subscriptions_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  os_release(*(void **)(a1 + 48));
}

void ___xpc_event_publisher_set_subscriptions_block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  xpc_release(*(xpc_object_t *)(a1 + 48));
  os_release(*(void **)(a1 + 56));
}

void ___xpc_event_publisher_set_subscriptions_block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  os_release(*(void **)(a1 + 40));
}

void ___xpc_event_publisher_set_subscriptions_block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  os_release(*(void **)(a1 + 40));
}

uint64_t _xpc_install_dispatch_hooks()
{
  return dispatch_mach_hooks_install_4libxpc();
}

char *_xpc_connection_pretty_name(uint64_t a1)
{
  int v1;
  char *result;

  v1 = *(_DWORD *)(a1 + 24);
  result = "(anonymous)";
  switch(v1)
  {
    case 0:
      result = *(char **)(a1 + 152);
      if (result)
        goto LABEL_3;
      break;
    case 1:
      return result;
    case 2:
      result = *(char **)(a1 + 152);
      if (result)
LABEL_3:
        result = (char *)dispatch_queue_get_label((dispatch_queue_t)result);
      break;
    case 3:
      result = "(dummy)";
      break;
    default:
      result = "(bogus)";
      break;
  }
  return result;
}

uint64_t _xpc_connection_copy()
{
  return 0;
}

BOOL _xpc_connection_equal(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t _xpc_connection_desc(uint64_t a1, uint64_t a2)
{
  char *v4;
  const char *v5;
  unsigned int v6;
  int v7;
  char __str[16];
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
  __int128 v39;
  __int128 v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C874D8];
  v39 = 0u;
  v40 = 0u;
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
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  *(_OWORD *)__str = 0u;
  v10 = 0u;
  v4 = _xpc_connection_pretty_name(a1);
  if ((*(_WORD *)(a1 + 224) & 8) != 0)
    v5 = "true";
  else
    v5 = "false";
  v6 = snprintf(__str, 0x200uLL, "<%s: %p> { name = %s, listener = %s, pid = %d, euid = %u, egid = %u, asid = %u }", "connection", (const void *)a1, v4, v5, *(_DWORD *)(a1 + 124), *(_DWORD *)(a1 + 108), *(_DWORD *)(a1 + 112), *(_DWORD *)(a1 + 128));
  if (v6 >= 0x1FF)
    v7 = 511;
  else
    v7 = v6;
  return _xpc_serializer_append(a2, __str, (v7 + 1), 0);
}

size_t _xpc_connection_debug(uint64_t a1, char *a2, size_t a3)
{
  unint64_t v6;
  const char *v7;
  int v8;
  const char *v9;
  char *v10;
  NSObject *label;
  __int16 v12;
  const char *v13;
  const char *v14;
  const char *v15;
  int v16;
  size_t v17;

  v6 = atomic_load((unint64_t *)(a1 + 96));
  v7 = "<none>";
  if (v6)
  {
    v8 = *(_DWORD *)v6;
    v9 = *(const char **)(v6 + 8);
    if (v9)
      v7 = v9;
  }
  else
  {
    v8 = 0;
  }
  v10 = _xpc_copy_nsobject_debug_description(*(void **)(a1 + 152));
  if (a3 < 2)
  {
    v17 = 0;
  }
  else
  {
    label = *(NSObject **)(a1 + 152);
    if (label)
      label = dispatch_queue_get_label(label);
    v12 = *(_WORD *)(a1 + 224);
    if ((v12 & 4) != 0)
      v13 = "true";
    else
      v13 = "false";
    if ((v12 & 0x10) != 0)
      v14 = "true";
    else
      v14 = "false";
    v15 = "<no channel>";
    if (v10)
      v15 = v10;
    v16 = snprintf(a2, a3, ", name = %s, type = %s, state = %s, cancelation = (%u, %s), mach = %s, privileged = %s, bssend = 0x%x, recv = 0x%x, send = 0x%x, pid = %d, euid = %u, egid = %u, asid = %u, channel: %s", (const char *)label, type2str[*(int *)(a1 + 24)], state2str[*(int *)(a1 + 64)], v8, v7, v13, v14, *(_DWORD *)(a1 + 72), *(_DWORD *)(a1 + 68), *(_DWORD *)(a1 + 76), *(_DWORD *)(a1 + 124), *(_DWORD *)(a1 + 108), *(_DWORD *)(a1 + 112), *(_DWORD *)(a1 + 128), v15);
    if (v16 >= a3)
      v17 = a3 - 1;
    else
      v17 = v16;
  }
  free(v10);
  return v17;
}

uint64_t _xpc_connection_serialize(uint64_t a1, uint64_t a2)
{
  int __src;

  syslog(3, "Connections cannot be directly embedded in messages. You must create an endpoint from the connection.");
  __src = 69632;
  return _xpc_serializer_append(a2, &__src, 4uLL, 1);
}

uint64_t _xpc_connection_deserialize()
{
  return 0;
}

uint64_t _xpc_connection_wire_length()
{
  return -1;
}

void _xpc_connection_dispose(uint64_t a1)
{
  uint64_t v2;
  xpc_object_t *v3;
  char *v4;

  if (*(_DWORD *)(a1 + 64) != 7)
    _xpc_mach_message_request_handoff_reply_cold_1();
  if (*(_DWORD *)(a1 + 28))
  {
    v4 = _xpc_asprintf("Release of a suspended connection.");
    _xpc_api_misuse(v4);
  }
  _Block_release(*(const void **)(a1 + 176));
  if ((*(_BYTE *)(a1 + 40) & 1) != 0)
  {
    _Block_release(*(const void **)(a1 + 32));
    *(_BYTE *)(a1 + 40) = 0;
  }
  *(_QWORD *)(a1 + 32) = 0;
  if ((*(_WORD *)(a1 + 224) & 8) != 0 && _xpc_mach_port_release(*(_DWORD *)(a1 + 80)))
    _os_assumes_log();
  dispatch_release(*(dispatch_object_t *)(a1 + 152));
  free(*(void **)(a1 + 216));
  *(_QWORD *)(a1 + 216) = 0;
  v2 = *(_QWORD *)(a1 + 96);
  if (v2)
  {
    free(*(void **)(v2 + 8));
    free(*(void **)(a1 + 96));
    *(_QWORD *)(a1 + 96) = 0;
  }
  _Block_release(*(const void **)(a1 + 232));
  v3 = *(xpc_object_t **)(a1 + 200);
  if (v3)
  {
    os_map_128_destroy();
    v3 = *(xpc_object_t **)(a1 + 200);
    if (v3[3])
    {
      xpc_release(v3[3]);
      v3 = *(xpc_object_t **)(a1 + 200);
    }
  }
  free(v3);
  *(_QWORD *)(a1 + 200) = 0;
}

uint64_t _xpc_connection_get_platform(uint64_t a1)
{
  return *(unsigned int *)(a1 + 192);
}

void do_mach_notify_port_deleted()
{
  qword_1F0460B90 = (uint64_t)"Kernel bug: Misfired notification: port-deleted.";
  __break(1u);
}

uint64_t do_mach_notify_port_destroyed(uint64_t a1, mach_port_name_t a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  mach_port_context_t v11;
  __int128 v12;
  NSObject *v13;
  int v15;
  mach_port_context_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C874D8];
  v3 = (uint64_t *)pthread_getspecific(_mig_tsd);
  v11 = *v3;
  if (*(_DWORD *)(*v3 + 76) == a2)
  {
    if ((*(_WORD *)(v11 + 224) & 3) != 0)
    {
      _xpc_connection_bs_cancel(*v3, v4, v5, v6, v7, v8, v9, v10);
    }
    else
    {
      *(_DWORD *)(v11 + 64) = 4;
      _xpc_connection_init(v11);
      if (*(_DWORD *)(v11 + 64) == 5)
      {
        os_unfair_lock_lock_with_options();
        *(_QWORD *)&v12 = -1;
        *((_QWORD *)&v12 + 1) = -1;
        *(_OWORD *)(v11 + 120) = v12;
        *(_OWORD *)(v11 + 104) = v12;
        *(_DWORD *)(v11 + 124) = 0;
        os_unfair_lock_unlock((os_unfair_lock_t)(v11 + 88));
        if (_os_trace_lazy_init_completed_4libxpc() && (*(_WORD *)(v11 + 224) & 0x4000) == 0)
        {
          if (_xpc_connection_log_handle__once != -1)
            dispatch_once(&_xpc_connection_log_handle__once, &__block_literal_global_111);
          v13 = _xpc_connection_log_handle__log;
          if (os_log_type_enabled((os_log_t)_xpc_connection_log_handle__log, OS_LOG_TYPE_DEFAULT))
          {
            v15 = 134217984;
            v16 = v11;
            _os_log_impl(&dword_1DEE85000, v13, OS_LOG_TYPE_DEFAULT, "[%p] Re-initialization successful; calling out to event handler with XPC_ERROR_CONNECTION_INTERRUPTED",
              (uint8_t *)&v15,
              0xCu);
          }
        }
        _xpc_connection_call_event_handler(v11, (uint64_t)&_xpc_error_connection_interrupted);
      }
    }
  }
  if (_xpc_mach_port_close_recv(a2, 0, 0))
    _os_assumes_log();
  return 0;
}

uint64_t _xpc_connection_bs_cancel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  mach_port_name_t v9;
  kern_return_t v10;
  BOOL v11;
  int v12;
  char v14;
  mach_port_type_t ptype;

  v9 = *(_DWORD *)(a1 + 72);
  if (v9 - 1 > 0xFFFFFFFD)
  {
    v12 = 3;
  }
  else
  {
    ptype = 0;
    v10 = mach_port_type(*MEMORY[0x1E0C883F0], v9, &ptype);
    if (v10)
      v11 = v10 == 15;
    else
      v11 = 1;
    if (!v11)
      _os_assumes_log();
    if ((ptype & 0x10000) != 0)
      v12 = 4;
    else
      v12 = 3;
  }
  return _xpc_connection_cancel(a1, v12, "finalizing BS connection", a4, a5, a6, a7, a8, v14);
}

uint64_t do_mach_notify_no_senders()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C874D8];
  v0 = (uint64_t *)pthread_getspecific(_mig_tsd);
  v1 = *v0;
  if (_xpc_connection_cancel(*v0, 3, "client is gone", v2, v3, v4, v5, v6, v10)
    && _os_trace_lazy_init_completed_4libxpc()
    && (*(_WORD *)(v1 + 224) & 0x4000) == 0)
  {
    if (_xpc_connection_log_handle__once != -1)
      dispatch_once(&_xpc_connection_log_handle__once, &__block_literal_global_111);
    v7 = _xpc_connection_log_handle__log;
    if (os_log_type_enabled((os_log_t)_xpc_connection_log_handle__log, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_DWORD *)(v1 + 124);
      v10 = 134218240;
      v11 = v1;
      v12 = 1024;
      v13 = v8;
      _os_log_impl(&dword_1DEE85000, v7, OS_LOG_TYPE_DEFAULT, "[%p] invalidated because the client process (pid %d) either cancelled the connection or exited", (uint8_t *)&v10, 0x12u);
    }
  }
  return 0;
}

uint64_t _xpc_connection_cancel(uint64_t a1, int a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  char **v12;
  unint64_t *v13;
  uint64_t v15;

  v12 = (char **)_xpc_alloc(0x10uLL);
  *(_DWORD *)v12 = a2;
  vasprintf(v12 + 1, a3, &a9);
  v13 = (unint64_t *)(a1 + 96);
  while (!__ldxr(v13))
  {
    if (!__stlxr((unint64_t)v12, v13))
    {
      v15 = 1;
      dispatch_mach_cancel();
      return v15;
    }
  }
  v15 = 0;
  __clrex();
  free(v12[1]);
  free(v12);
  return v15;
}

uint64_t do_mach_notify_send_once(int a1)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t msg;
  mach_port_context_t context;
  _DWORD *v6;
  __objc2_class **v7;

  v2 = (uint64_t *)pthread_getspecific(_mig_tsd);
  if (!a1)
    return 0;
  v3 = *v2;
  msg = dispatch_mach_msg_get_msg();
  context = _xpc_mach_msg_get_context(msg);
  if (*(_DWORD *)(v3 + 68) != a1)
  {
    if (context)
    {
      v6 = (_DWORD *)atomic_load((unint64_t *)(v3 + 96));
      v7 = &_xpc_error_connection_interrupted;
      if (v6 && *v6 != 4)
        v7 = &_xpc_error_connection_invalid;
      _xpc_connection_call_reply_async((void *)v3, context, v7);
    }
    return 0;
  }
  if (v3 == context)
    return 0;
  _dyld_get_image_uuid();
  if ((_dyld_get_shared_cache_uuid() & 1) != 0)
    _dyld_get_shared_cache_range();
  _os_log_simple();
  return 5;
}

void do_mach_notify_dead_name()
{
  qword_1F0460B90 = (uint64_t)"Kernel bug: Misfired notification: dead-name.";
  __break(1u);
}

void _xpc_connection_last_xref_cancel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  NSObject *v9;
  char *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C874D8];
  if (*(_DWORD *)(a1 + 28))
  {
    v10 = _xpc_asprintf("Release of last reference on a suspended connection.");
    _xpc_api_misuse(v10);
  }
  if (_xpc_connection_cancel(a1, 2, "connection was released", a4, a5, a6, a7, a8, v11)
    && _os_trace_lazy_init_completed_4libxpc()
    && (*(_WORD *)(a1 + 224) & 0x4000) == 0)
  {
    if (_xpc_connection_log_handle__once != -1)
      dispatch_once(&_xpc_connection_log_handle__once, &__block_literal_global_111);
    v9 = _xpc_connection_log_handle__log;
    if (os_log_type_enabled((os_log_t)_xpc_connection_log_handle__log, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 134217984;
      v12 = a1;
      _os_log_impl(&dword_1DEE85000, v9, OS_LOG_TYPE_DEFAULT, "[%p] invalidated after the last release of the connection object", (uint8_t *)&v11, 0xCu);
    }
  }
}

uint64_t _xpc_connection_copy_listener_port(uint64_t a1)
{
  uint64_t checkin_port;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  char *v11;
  unsigned int v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  int v16;
  __int16 v17;
  unsigned int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C874D8];
  checkin_port = dispatch_mach_get_checkin_port();
  v12 = checkin_port;
  if ((checkin_port - 1) >= 0xFFFFFFFE)
  {
    if (_os_trace_lazy_init_completed_4libxpc() && (*(_WORD *)(a1 + 224) & 0x4000) == 0)
    {
      if (_xpc_connection_log_handle__once != -1)
        dispatch_once(&_xpc_connection_log_handle__once, &__block_literal_global_111);
      v5 = _xpc_connection_log_handle__log;
      if (os_log_type_enabled((os_log_t)_xpc_connection_log_handle__log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v14 = a1;
        _os_log_impl(&dword_1DEE85000, v5, OS_LOG_TYPE_DEFAULT, "[%p] Channel could not return listener port.", buf, 0xCu);
      }
    }
    v6 = *(_DWORD *)(a1 + 24);
    if (v6 == 1)
    {
      v9 = 68;
      if ((*(_WORD *)(a1 + 224) & 8) == 0)
        v9 = 72;
      return _xpc_mach_port_try_retain_send(*(unsigned int *)(a1 + v9));
    }
    else
    {
      if (v6)
      {
        v11 = _xpc_asprintf("Attempt to create an endpoint out of an unsupported connection type.");
        _xpc_api_misuse(v11);
      }
      v7 = _xpc_connection_bootstrap_look_up_slow(a1, &v12);
      if (_os_trace_lazy_init_completed_4libxpc() && (*(_WORD *)(a1 + 224) & 0x4000) == 0)
      {
        if (_xpc_connection_log_handle__once != -1)
          dispatch_once(&_xpc_connection_log_handle__once, &__block_literal_global_111);
        v8 = _xpc_connection_log_handle__log;
        if (os_log_type_enabled((os_log_t)_xpc_connection_log_handle__log, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218496;
          v14 = a1;
          v15 = 1024;
          v16 = v7;
          v17 = 1024;
          v18 = v12;
          _os_log_impl(&dword_1DEE85000, v8, OS_LOG_TYPE_DEFAULT, "[%p] Falling back to bootstrap_look_up() = %d, lp: 0x%x", buf, 0x18u);
        }
      }
      if (v7)
        return 0xFFFFFFFFLL;
      else
        return v12;
    }
  }
  else
  {
    v3 = _xpc_mach_port_try_retain_send(checkin_port);
    if (_os_trace_lazy_init_completed_4libxpc() && (*(_WORD *)(a1 + 224) & 0x4000) == 0)
    {
      if (_xpc_connection_log_handle__once != -1)
        dispatch_once(&_xpc_connection_log_handle__once, &__block_literal_global_111);
      v4 = _xpc_connection_log_handle__log;
      if (os_log_type_enabled((os_log_t)_xpc_connection_log_handle__log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v14 = a1;
        v15 = 1024;
        v16 = v3;
        _os_log_impl(&dword_1DEE85000, v4, OS_LOG_TYPE_DEFAULT, "[%p] Channel returned listener port: 0x%x", buf, 0x12u);
      }
    }
  }
  return v3;
}

int64_t _xpc_connection_bootstrap_look_up_slow(uint64_t a1, _DWORD *a2)
{
  unint64_t v4;
  pid_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  const void *v13;
  unsigned int v14;
  uint64_t v15;
  NSObject *label;
  int64_t v17;
  __int16 v18;
  __int16 v19;
  NSObject *v20;
  BOOL v22;

  v4 = *(unsigned __int16 *)(a1 + 224);
  if ((v4 & 4) != 0)
  {
    if ((v4 & 0x200) != 0)
    {
      v8 = 0;
      v6 = *(_QWORD *)(a1 + 184);
      v9 = 7;
      v7 = 16;
    }
    else
    {
      v10 = *(_DWORD *)(a1 + 84);
      if (v10 == -2)
        v9 = 7;
      else
        v9 = 2;
      v6 = 0;
      if (v10 == -2)
        v8 = 0;
      else
        v8 = *(unsigned int *)(a1 + 84);
      if (v10 == -2)
        v7 = (v4 >> 1) & 8;
      else
        v7 = 0;
    }
  }
  else
  {
    v5 = getpid();
    v6 = 0;
    v7 = 0;
    v8 = v5;
    LODWORD(v4) = *(unsigned __int16 *)(a1 + 224);
    v9 = 5;
  }
  LODWORD(v11) = (v4 >> 3) & 4;
  if ((v4 & 0x40) != 0)
    v11 = 32;
  else
    v11 = v11;
  v12 = v7 | v11;
  v13 = *(const void **)(a1 + 216);
  if (v13)
    v12 |= 0x400uLL;
  v14 = (v4 >> 7) & 1;
  if ((v4 & 3) == 3)
    v14 = 1;
  if (v14)
    v12 |= 0x80uLL;
  if ((v4 & 3) == 1)
    v15 = v12 | 0x200;
  else
    v15 = v12;
  if ((v4 & 8) != 0 && !*(_DWORD *)(a1 + 24))
    v15 |= 0x100uLL;
  v22 = 0;
  label = *(NSObject **)(a1 + 152);
  if (label)
    label = dispatch_queue_get_label(label);
  v17 = _xpc_look_up_endpoint((char *)label, v9, v8, v6, (const unsigned __int8 *)(a1 + 160), v15, v13, a2, &v22);
  if (!(_DWORD)v17)
  {
    v18 = *(_WORD *)(a1 + 224);
    if ((v18 & 3) == 1)
    {
      if (v22)
        v19 = 3;
      else
        v19 = 2;
      *(_WORD *)(a1 + 224) = v18 & 0xFFFC | v19;
    }
  }
  v20 = *(NSObject **)(a1 + 152);
  if (v20)
    dispatch_queue_get_label(v20);
  return v17;
}

BOOL _xpc_connection_check_in_with_ports(int a1, int a2, int a3)
{
  __objc2_class *v4;
  int v5;
  int v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  int v10;
  int v11;
  int v12;
  int v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C874D8];
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = 0u;
  v7 = 0u;
  v8 = 0u;
  v4 = OS_xpc_connection;
  v5 = 0x7FFFFFFF;
  v6 = 0x7FFFFFFF;
  LODWORD(v7) = 2048;
  DWORD2(v7) = 3;
  v10 = 5;
  v11 = a2;
  v12 = a1;
  v13 = a3;
  LOWORD(v23) = 1024;
  _xpc_connection_check_in((uint64_t)&v4);
  return v10 == 6;
}

void _xpc_connection_check_in(uint64_t a1)
{
  NSObject *v2;
  unsigned __int16 v3;
  int v4;
  unsigned __int16 v5;
  mach_port_name_t name;
  mach_msg_header_t *msg;

  if ((*(_WORD *)(a1 + 224) & 0x400) != 0)
  {
    msg = 0;
    v2 = dispatch_mach_msg_create();
    MEMORY[8] = *(_DWORD *)(a1 + 72);
    MEMORY[0] = 0x3480000013;
    MEMORY[0xC] = xmmword_1DEEBD1E0;
    v3 = MEMORY[0x30];
    MEMORY[0x30] &= 0xFFFFFFu;
    v4 = *(_DWORD *)(a1 + 68);
    MEMORY[0x30] = v3 | 0x140000;
    v5 = MEMORY[0x24];
    MEMORY[0x24] &= 0xFFFFFFu;
    MEMORY[0x28] = v4;
    MEMORY[0x1C] = *(_DWORD *)(a1 + 76);
    MEMORY[0x24] = v5 | 0x100000;
    if ((*(_BYTE *)(a1 + 17) & 8) != 0)
    {
      if (mach_msg(0, 1, 0x34u, 0, 0, 0, 0))
      {
        _os_assumes_log();
        if (_xpc_mach_port_cleanup_right(MEMORY[8], MEMORY[0] & 0x1F))
          _os_assumes_log();
        if (_xpc_mach_port_cleanup_right(MEMORY[0x28], MEMORY[0x32]))
          _os_assumes_log();
      }
      else
      {
        ++*(_DWORD *)(a1 + 64);
      }
    }
    else
    {
      name = 0;
      if (_xpc_mach_port_setup_port_destroyed(*(_DWORD *)(a1 + 76), *(_DWORD *)(a1 + 68), &name)
        || name && (_os_assumes_log(), _xpc_mach_port_release(name)))
      {
        _os_assumes_log();
      }
      if ((*(_WORD *)(a1 + 224) & 0x100) != 0)
      {
        dispatch_mach_reconnect();
      }
      else
      {
        *(_WORD *)(a1 + 224) |= 0x100u;
        dispatch_mach_connect();
      }
    }
    dispatch_release(v2);
  }
  else
  {
    *(_DWORD *)(a1 + 64) = 6;
    dispatch_mach_connect();
  }
}

xpc_object_t _xpc_connection_copy_attrs(uint64_t a1, int a2)
{
  xpc_object_t v4;
  void *v5;
  mach_port_name_t v6;
  int64_t v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  const char *label;
  int v12;
  xpc_object_t v13;
  xpc_object_t value;
  char *v16;
  xpc_object_t xdict;

  v4 = xpc_dictionary_create(0, 0, 0);
  v5 = v4;
  if (!a1)
  {
    if (!a2)
    {
      v16 = _xpc_asprintf("Attempt to get connection property with no connection and no target PID.");
      goto LABEL_23;
    }
    v7 = a2;
    goto LABEL_9;
  }
  v6 = *(_DWORD *)(a1 + 72);
  if (v6 + 1 < 2)
  {
    v7 = *(int *)(a1 + 124);
    if (!(_DWORD)v7)
    {
      if (!*(_DWORD *)(a1 + 24))
      {
        if ((*(_WORD *)(a1 + 224) & 4) != 0)
        {
          v9 = "type";
          v8 = 7;
        }
        else
        {
          xpc_dictionary_set_uint64(v4, "type", 5uLL);
          v8 = getpid();
          v9 = "handle";
          v4 = v5;
        }
        xpc_dictionary_set_uint64(v4, v9, v8);
        v10 = *(NSObject **)(a1 + 152);
        if (v10)
          label = dispatch_queue_get_label(v10);
        else
          label = 0;
        xpc_dictionary_set_string(v5, "name", label);
        goto LABEL_16;
      }
      v16 = _xpc_asprintf("Attempt to get connection property before it was populated.");
LABEL_23:
      _xpc_api_misuse(v16);
    }
LABEL_9:
    xpc_dictionary_set_int64(v4, "pid", v7);
    goto LABEL_16;
  }
  xpc_dictionary_set_mach_send(v4, "service-port", v6);
LABEL_16:
  xdict = 0;
  v12 = _xpc_service_routine(712, v5, &xdict);
  v13 = 0;
  if (v12 != 113)
  {
    if (v12)
    {
      _os_assumes_log();
      v13 = 0;
    }
    else
    {
      value = xpc_dictionary_get_value(xdict, "attrs");
      v13 = xpc_retain(value);
      xpc_release(xdict);
    }
  }
  xpc_release(v5);
  return v13;
}

BOOL _xpc_connection_is_invalid(uint64_t a1)
{
  unint64_t v1;

  v1 = atomic_load((unint64_t *)(a1 + 96));
  return v1 != 0;
}

uint64_t _xpc_connection_create_internal_listener(char *a1)
{
  uint64_t result;

  result = xpc_connection_create_listener(a1);
  *(_WORD *)(result + 224) |= 0x8000u;
  return result;
}

uint64_t xpc_connection_create_listener(char *__s)
{
  uint64_t v1;
  _OWORD *self_audit_token;
  __int128 v3;

  v1 = _xpc_connection_create(0, __s);
  *(_WORD *)(v1 + 224) |= 8u;
  self_audit_token = (_OWORD *)_xpc_get_self_audit_token();
  v3 = self_audit_token[1];
  *(_OWORD *)(v1 + 104) = *self_audit_token;
  *(_OWORD *)(v1 + 120) = v3;
  *(_DWORD *)(v1 + 88) = 0;
  return v1;
}

uint64_t _xpc_connection_activate_internal_listener(_WORD *a1)
{
  char *v3;

  if (xpc_get_type(a1) != (xpc_type_t)OS_xpc_connection)
    _xpc_api_misuse("Given object not of required type.");
  if ((a1[112] & 8) == 0)
  {
    v3 = _xpc_asprintf("connection must be a listener.");
    goto LABEL_8;
  }
  if ((a1[112] & 0x8000) == 0)
  {
    v3 = _xpc_asprintf("connection must be internal lifecycle.");
LABEL_8:
    _xpc_api_misuse(v3);
  }
  return _xpc_connection_activate_if_needed((mach_port_context_t)a1, 1);
}

uint64_t _xpc_connection_activate_if_needed(mach_port_context_t a1, int a2)
{
  unsigned int *v3;
  uint64_t v5;
  unsigned int *v6;
  unsigned int v7;
  NSObject *v8;
  unsigned int v9;
  _BOOL4 v10;
  char *v12;
  int v13;
  mach_port_context_t v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  _BOOL4 v20;
  __int16 v21;
  char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C874D8];
  v3 = (unsigned int *)(a1 + 64);
  do
  {
    if (__ldxr(v3))
    {
      v5 = 0;
      __clrex();
      return v5;
    }
    v5 = 1;
  }
  while (__stxr(1u, v3));
  *(_BYTE *)(a1 + 41) = 1;
  if (!*(_QWORD *)(a1 + 32))
  {
    v12 = _xpc_asprintf("Activation of a connection without an event handler.");
    goto LABEL_21;
  }
  if (a2)
  {
    v6 = (unsigned int *)(a1 + 28);
    do
      v7 = __ldxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      v12 = _xpc_asprintf("Over-resume of a connection.");
LABEL_21:
      _xpc_api_misuse(v12);
    }
  }
  if (_os_trace_lazy_init_completed_4libxpc() && (*(_WORD *)(a1 + 224) & 0x4000) == 0)
  {
    if (_xpc_connection_log_handle__once != -1)
      dispatch_once(&_xpc_connection_log_handle__once, &__block_literal_global_111);
    v8 = _xpc_connection_log_handle__log;
    if (os_log_type_enabled((os_log_t)_xpc_connection_log_handle__log, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(unsigned __int16 *)(a1 + 224);
      v10 = *(_DWORD *)(a1 + 24) == 2;
      v13 = 134219010;
      v14 = a1;
      v15 = 1024;
      v16 = (v9 >> 2) & 1;
      v17 = 1024;
      v18 = (v9 >> 3) & 1;
      v19 = 1024;
      v20 = v10;
      v21 = 2082;
      v22 = _xpc_connection_pretty_name(a1);
      _os_log_impl(&dword_1DEE85000, v8, OS_LOG_TYPE_DEFAULT, "[%p] activating connection: mach=%{BOOL}d listener=%{BOOL}d peer=%{BOOL}d name=%{public}s", (uint8_t *)&v13, 0x28u);
    }
  }
  _xpc_retain(a1);
  _xpc_connection_init(a1);
  _xpc_release(a1);
  return v5;
}

uint64_t _xpc_connection_create(int a1, char *__s)
{
  uint64_t v4;
  int v5;
  unint64_t v6;
  char *v7;
  int v8;
  const void *v9;
  uint64_t _4libxpc;
  char __str[16];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C874D8];
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  *(_OWORD *)__str = 0u;
  v13 = 0u;
  if (a1 == 2)
  {
    v5 = snprintf(__str, 0x80uLL, "%s.%s");
LABEL_8:
    v6 = v5;
    v7 = &__str[v5 - 18];
    goto LABEL_11;
  }
  if (a1 == 1)
  {
    v5 = snprintf(__str, 0x80uLL, "com.apple.xpc.anonymous.%s");
    goto LABEL_8;
  }
  if (a1)
  {
    v7 = 0;
    v6 = 0;
  }
  else
  {
    strlen(__s);
    if (_dyld_is_memory_immutable())
    {
      v4 = _xpc_base_create();
      goto LABEL_15;
    }
    v8 = snprintf(__str, 0x80uLL, "%s", __s);
    v7 = 0;
    v6 = v8;
  }
LABEL_11:
  v9 = (const void *)_xpc_base_create();
  v4 = (uint64_t)v9;
  if (v6 <= 0x80 && v7)
    sprintf(v7, "%p", v9);
  strcpy((char *)(v4 + 240), __str);
LABEL_15:
  _4libxpc = dispatch_mach_create_4libxpc();
  *(_DWORD *)(v4 + 24) = a1;
  *(_DWORD *)(v4 + 28) = 1;
  *(_WORD *)(v4 + 224) &= ~0x4000u;
  *(_DWORD *)(v4 + 84) = -2;
  *(_QWORD *)(v4 + 144) = 0;
  *(_QWORD *)(v4 + 152) = _4libxpc;
  uuid_clear((unsigned __int8 *)(v4 + 160));
  *(_DWORD *)(v4 + 192) = 0;
  return _xpc_retain(v4);
}

void xpc_connection_get_audit_token(uint64_t a1, _OWORD *a2)
{
  os_unfair_lock_s *v4;
  __int128 v5;

  v4 = (os_unfair_lock_s *)(a1 + 88);
  os_unfair_lock_lock_with_options();
  v5 = *(_OWORD *)(a1 + 120);
  *a2 = *(_OWORD *)(a1 + 104);
  a2[1] = v5;
  os_unfair_lock_unlock(v4);
}

void xpc_connection_set_instance(uint64_t a1, const unsigned __int8 *a2)
{
  __int16 v2;
  char *v3;

  if (*(_DWORD *)(a1 + 64))
  {
    v3 = _xpc_asprintf("Attempt to set instance on a live connection.");
    goto LABEL_6;
  }
  v2 = *(_WORD *)(a1 + 224);
  if ((v2 & 8) != 0)
  {
    v3 = _xpc_asprintf("Attempt to set instance on a listening connection.");
LABEL_6:
    _xpc_api_misuse(v3);
  }
  *(_WORD *)(a1 + 224) = v2 | 0x20;
  uuid_copy((unsigned __int8 *)(a1 + 160), a2);
}

void xpc_connection_set_oneshot_instance(uint64_t a1, const unsigned __int8 *a2)
{
  *(_WORD *)(a1 + 224) |= 0x40u;
  xpc_connection_set_instance(a1, a2);
}

uint64_t xpc_connection_set_instance_binpref(uint64_t a1, const void *a2)
{
  __int16 v3;
  void *v4;
  char *v6;

  if (*(_DWORD *)(a1 + 64))
  {
    v6 = _xpc_asprintf("Attempt to set instance binpref on a live connection.");
    goto LABEL_12;
  }
  v3 = *(_WORD *)(a1 + 224);
  if ((v3 & 8) != 0)
  {
    v6 = _xpc_asprintf("Attempt to set instance binpref on a listening connection.");
    goto LABEL_12;
  }
  if ((v3 & 4) != 0)
  {
    v6 = _xpc_asprintf("Attempt to set instance binpref on a MachService connection.");
    goto LABEL_12;
  }
  if ((v3 & 0x20) == 0)
  {
    v6 = _xpc_asprintf("Attempt to set binpref on a connection without instance uuid.");
LABEL_12:
    _xpc_api_misuse(v6);
  }
  v4 = xpc_binprefs_copy(a2);
  *(_QWORD *)(a1 + 216) = v4;
  if (xpc_binprefs_count((uint64_t)v4) >= 4)
    return _os_assumes_log();
  else
    return xpc_binprefs_add(*(_QWORD *)(a1 + 216), -1, -1);
}

void xpc_connection_get_instance(uint64_t a1, uuid_t dst)
{
  uuid_copy(dst, (const unsigned __int8 *)(a1 + 160));
}

uint64_t xpc_connection_get_filter_policy_id_4test(uint64_t a1)
{
  char *v2;

  if (*(_DWORD *)(a1 + 24) != 2)
  {
    v2 = _xpc_asprintf("Only peer connections have a filter policy");
    _xpc_api_misuse(v2);
  }
  return *(_QWORD *)(a1 + 184);
}

uint64_t _xpc_connection_get_recvp_4test(uint64_t a1)
{
  return *(unsigned int *)(a1 + 68);
}

uint64_t _xpc_connection_get_parent_4test(uint64_t a1)
{
  return *(_QWORD *)(a1 + 136);
}

uint64_t xpc_connection_set_legacy(uint64_t result)
{
  char *v1;

  if (*(_DWORD *)(result + 64))
  {
    v1 = _xpc_asprintf("Attempt to set non-bundled on a live connection.");
    _xpc_api_misuse(v1);
  }
  *(_WORD *)(result + 224) |= 4u;
  return result;
}

uint64_t xpc_connection_set_privileged(uint64_t result)
{
  char *v1;

  if (*(_DWORD *)(result + 64))
  {
    v1 = _xpc_asprintf("Attempt to set privileged bit on a live connection.");
    goto LABEL_6;
  }
  if (*(_DWORD *)(result + 84) != -2)
  {
    v1 = _xpc_asprintf("Attempt to set privileged bit on a connection targetting a specific user.");
LABEL_6:
    _xpc_api_misuse(v1);
  }
  *(_WORD *)(result + 224) |= 0x10u;
  return result;
}

void xpc_connection_set_target_uid()
{
  char *v0;

  v0 = _xpc_asprintf("Setting the target UID for a connection is not supported on embedded platforms.");
  _xpc_api_misuse(v0);
}

uint64_t xpc_connection_set_target_user_session_uid(uint64_t a1, int a2)
{
  __int16 v2;
  uint64_t result;
  char *v6;

  v2 = *(_WORD *)(a1 + 224);
  if ((v2 & 4) == 0)
  {
    v6 = _xpc_asprintf("Attempt to set target session UID on a non-MachService connection.");
    goto LABEL_12;
  }
  if (*(_DWORD *)(a1 + 64))
  {
    v6 = _xpc_asprintf("Attempt to set target session UID on a live connection.");
    goto LABEL_12;
  }
  if (a2 == -2)
  {
    v6 = _xpc_asprintf("How does one look up a service owned by nobody?");
    goto LABEL_12;
  }
  if ((v2 & 0x10) != 0)
  {
    v6 = _xpc_asprintf("Attempt to set target session UID on a privileged connection.");
    goto LABEL_12;
  }
  result = xpc_user_sessions_enabled();
  if ((result & 1) == 0)
  {
    v6 = _xpc_asprintf("Attempt to set target session UID, but user sessions are not enabled.");
LABEL_12:
    _xpc_api_misuse(v6);
  }
  *(_DWORD *)(a1 + 84) = a2;
  return result;
}

uint64_t xpc_connection_set_event_channel(uint64_t result, uint64_t a2)
{
  char *v2;

  if (*(_DWORD *)(result + 24) == 2)
  {
    v2 = _xpc_asprintf("Can't set event channel on peer connection");
    _xpc_api_misuse(v2);
  }
  *(_WORD *)(result + 224) |= 0x200u;
  *(_QWORD *)(result + 184) = a2;
  return result;
}

uint64_t xpc_connection_set_non_launching(uint64_t result, int a2)
{
  __int16 v2;
  char *v3;

  if (*(_DWORD *)(result + 64))
  {
    v3 = _xpc_asprintf("Attempt to change the non-launching property on a live connection.");
    _xpc_api_misuse(v3);
  }
  if (a2)
    v2 = 128;
  else
    v2 = 0;
  *(_WORD *)(result + 224) = *(_WORD *)(result + 224) & 0xFF7F | v2;
  return result;
}

xpc_object_t xpc_connection_copy_entitlement_value(os_unfair_lock_s *a1, const char *a2)
{
  os_unfair_lock_s *v4;
  xpc_object_t v5;

  v4 = a1 + 22;
  os_unfair_lock_lock_with_options();
  v5 = _xpc_copy_entitlements_with_key(a1[31]._os_unfair_lock_opaque, (uint64_t)&a1[26], a2);
  os_unfair_lock_unlock(v4);
  return v5;
}

void xpc_connection_send_notification(unsigned int *a1, xpc_object_t object)
{
  void *v4;
  char *v5;

  if (xpc_get_type(object) != (xpc_type_t)OS_xpc_dictionary)
  {
    v5 = _xpc_asprintf("Notification types other than dictionaries are not supported.");
    _xpc_api_misuse(v5);
  }
  v4 = (void *)_xpc_connection_pack_message(a1, object, 0);
  *(_DWORD *)(_xpc_serializer_get_mach_message_header() + 20) = 805306368;
  _xpc_connection_enqueue(a1, 0x40000, (uint64_t)v4);
  xpc_release(v4);
}

uint64_t _xpc_connection_pack_message(unsigned int *a1, void *a2, int a3)
{
  int reply_port;
  xpc_connection_t remote_connection;
  uint64_t v8;
  uint64_t v9;
  int v10;
  _DWORD *v11;
  int v12;
  char *v14;

  reply_port = _xpc_dictionary_extract_reply_port((uint64_t)a2);
  remote_connection = xpc_dictionary_get_remote_connection(a2);
  if (reply_port && remote_connection && remote_connection != (xpc_connection_t)a1)
  {
    v14 = _xpc_asprintf("Attempt to send a message expecting a reply to the wrong connection.");
    _xpc_api_misuse(v14);
  }
  v8 = _xpc_serializer_create();
  v9 = v8;
  if (a3)
  {
    *(_DWORD *)(v8 + 152) = a3;
    v10 = 5376;
  }
  else
  {
    v10 = 0;
  }
  v11 = (_DWORD *)_xpc_serializer_pack(v8, (uint64_t)a2, a1[48], 0);
  if (reply_port)
  {
    v11[5] = 0x20000000;
    v12 = 18;
  }
  else
  {
    v12 = 19;
  }
  *v11 |= v12 | v10;
  v11[2] = reply_port;
  v11[3] = a3;
  return v9;
}

void _xpc_connection_enqueue(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  xpc_retain(a1);
  _xpc_retain(a3);
  v5 = a1[29];
  if (v5)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v5 + 16))(v5, *(_QWORD *)(a3 + 32), *(_QWORD *)(a3 + 40));
  if ((*(_BYTE *)(_xpc_serializer_get_mach_message_header() + 1) & 0x1F) != 0)
  {
    xpc_retain(a1);
    _xpc_retain(a3);
    _xpc_received_message_get_connection(a3);
    dispatch_mach_send_with_result_and_async_reply_4libxpc();
  }
  else
  {
    _xpc_received_message_get_connection(a3);
    dispatch_mach_send_with_result();
  }
  _xpc_connection_enqueue_cold_1(0);
}

void xpc_connection_kill(uint64_t a1, int a2)
{
  xpc_object_t v4;
  NSObject *v5;
  NSObject *v6;
  pid_t v7;
  int v8;
  int v9;
  NSObject *v10;
  const char *label;
  char *v12;
  xpc_object_t object;
  char out[48];
  char __str[16];
  __int128 v16;
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
  uint64_t v47;

  v47 = *MEMORY[0x1E0C874D8];
  v4 = xpc_dictionary_create(0, 0, 0);
  object = 0;
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
  v20 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  *(_OWORD *)__str = 0u;
  if ((*(_WORD *)(a1 + 224) & 0x20) != 0)
  {
    memset(out, 0, 37);
    uuid_unparse_upper((const unsigned __int8 *)(a1 + 160), out);
    v6 = *(NSObject **)(a1 + 152);
    if (v6)
      dispatch_queue_get_label(v6);
    snprintf(__str, 0x200uLL, "%s.%s");
  }
  else
  {
    v5 = *(NSObject **)(a1 + 152);
    if (v5)
      dispatch_queue_get_label(v5);
    snprintf(__str, 0x200uLL, "%s");
  }
  xpc_dictionary_set_uint64(v4, "type", 5uLL);
  v7 = getpid();
  xpc_dictionary_set_uint64(v4, "handle", v7);
  xpc_dictionary_set_string(v4, "name", __str);
  xpc_dictionary_set_int64(v4, "signal", a2);
  v8 = _xpc_domain_routine(812, v4, &object);
  if (v8)
  {
    v9 = v8;
    if (v8 != 3 && v8 != 37)
    {
      v10 = *(NSObject **)(a1 + 152);
      if (v10)
        label = dispatch_queue_get_label(v10);
      else
        label = 0;
      v12 = xpc_strerror(v9);
      syslog(3, "Could not signal service %s: %d: %s", label, v9, v12);
    }
  }
  else
  {
    xpc_release(object);
  }
  xpc_release(v4);
}

uint64_t xpc_connection_set_bootstrap(void *a1, void *a2)
{
  xpc_object_t v3;
  xpc_object_t v4;
  _QWORD *v5;

  v3 = xpc_retain(a1);
  v4 = xpc_retain(a2);
  v5 = _xpc_alloc(0x18uLL);
  *v5 = v3;
  v5[1] = v4;
  v5[2] = 0;
  return dispatch_mach_send_barrier_f();
}

void _xpc_connection_set_bootstrap_impl(_QWORD *a1)
{
  void *v2;
  _QWORD *v3;
  xpc_object_t v4;
  pid_t v5;
  NSObject *v6;
  const char *label;
  xpc_object_t object;

  v3 = (_QWORD *)*a1;
  v2 = (void *)a1[1];
  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v4, "type", 5uLL);
  v5 = getpid();
  xpc_dictionary_set_uint64(v4, "handle", v5);
  v6 = v3[19];
  if (v6)
    label = dispatch_queue_get_label(v6);
  else
    label = 0;
  xpc_dictionary_set_string(v4, "name", label);
  xpc_dictionary_set_value(v4, "bootstrap", v2);
  object = 0;
  if (_xpc_service_routine(710, v4, &object))
    _os_assumes_log();
  else
    xpc_release(object);
  xpc_release(v4);
  xpc_release(v3);
  xpc_release(v2);
  free(a1);
}

xpc_object_t xpc_connection_is_extension(uint64_t a1)
{
  xpc_object_t result;
  void *v2;
  _BOOL8 v3;

  result = _xpc_connection_copy_attrs(a1, -1);
  if (result)
  {
    v2 = result;
    v3 = xpc_dictionary_get_BOOL(result, "extension");
    xpc_release(v2);
    return (xpc_object_t)v3;
  }
  return result;
}

char *xpc_connection_copy_bundle_id(uint64_t a1)
{
  xpc_object_t v1;
  void *v2;
  const char *string;
  char *v4;

  v1 = _xpc_connection_copy_attrs(a1, -1);
  if (!v1)
    return 0;
  v2 = v1;
  string = xpc_dictionary_get_string(v1, "bundle-id");
  if (string)
    v4 = _xpc_strdup(string);
  else
    v4 = 0;
  xpc_release(v2);
  return v4;
}

__objc2_class *xpc_connection_set_bs_type(uint64_t a1, int a2)
{
  __objc2_class *result;
  char *v5;

  result = (__objc2_class *)xpc_get_type((xpc_object_t)a1);
  if (result != OS_xpc_connection)
    _xpc_api_misuse("Given object not of required type.");
  if (*(_DWORD *)(a1 + 64))
  {
    v5 = _xpc_asprintf("Attempt to change the bs_managed propertyon a live connection.");
    goto LABEL_11;
  }
  if (!*(_DWORD *)(a1 + 24))
  {
    if ((a2 & 0xFE) != 2)
      goto LABEL_7;
    v5 = _xpc_asprintf("Cannot set specific when not from endpoint.");
LABEL_11:
    _xpc_api_misuse(v5);
  }
  if (a2 == 1)
  {
    v5 = _xpc_asprintf("Cannot set TBD when from endpoint or anon.");
    goto LABEL_11;
  }
LABEL_7:
  *(_WORD *)(a1 + 224) = *(_WORD *)(a1 + 224) & 0xFFFC | a2 & 3;
  return result;
}

uint64_t xpc_connection_get_bs_type(_WORD *a1)
{
  if (xpc_get_type(a1) != (xpc_type_t)OS_xpc_connection)
    _xpc_api_misuse("Given object not of required type.");
  return a1[112] & 3;
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  __int16 v3;
  xpc_connection_t result;
  __int128 v5;

  v3 = flags;
  if ((flags & 1) != 0)
  {
    result = (xpc_connection_t)xpc_connection_create_listener((char *)name);
  }
  else
  {
    result = (xpc_connection_t)_xpc_connection_create(0, (char *)name);
    *(_QWORD *)&v5 = -1;
    *((_QWORD *)&v5 + 1) = -1;
    *(_OWORD *)((char *)result + 120) = v5;
    *(_OWORD *)((char *)result + 104) = v5;
    *((_DWORD *)result + 31) = 0;
    *((_DWORD *)result + 22) = 0;
    *((_WORD *)result + 112) = *((_WORD *)result + 112) & 0xFFEF | (8 * v3) & 0x10;
  }
  *((_WORD *)result + 112) |= (32 * v3) & 0x80 | 4;
  return result;
}

xpc_connection_t xpc_connection_create_from_endpoint(xpc_endpoint_t endpoint)
{
  _xpc_connection_s *v2;

  if (xpc_get_type(endpoint) != (xpc_type_t)OS_xpc_endpoint)
    _xpc_api_misuse("Given object not of required type.");
  v2 = (_xpc_connection_s *)_xpc_connection_create(1, 0);
  *((_DWORD *)v2 + 18) = _xpc_endpoint_copy_listener_port((uint64_t)endpoint);
  *((_DWORD *)v2 + 4) |= 1u;
  return v2;
}

void xpc_connection_set_qos_class_floor(dispatch_object_t *a1, dispatch_qos_class_t a2, int a3)
{
  if (xpc_get_type(a1) != (xpc_type_t)OS_xpc_connection)
    _xpc_api_misuse("Given object not of required type.");
  dispatch_set_qos_class_floor(a1[19], a2, a3);
}

uint64_t xpc_connection_set_qos_class_fallback(void *a1)
{
  if (xpc_get_type(a1) != (xpc_type_t)OS_xpc_connection)
    _xpc_api_misuse("Given object not of required type.");
  return dispatch_set_qos_class_fallback();
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  if (xpc_get_type(connection) != (xpc_type_t)OS_xpc_connection)
    _xpc_api_misuse("Given object not of required type.");
  dispatch_set_target_queue(*((dispatch_object_t *)connection + 19), targetq);
}

void _xpc_connection_set_event_handler_f(uint64_t a1, unint64_t a2)
{
  unsigned __int128 *v2;
  unsigned __int128 v3;
  char *v4;

  v2 = (unsigned __int128 *)(a1 + 32);
  do
    v3 = __ldxp(v2);
  while (__stxp(a2, v2));
  if ((WORD4(v3) & 0x100) != 0)
  {
    v4 = _xpc_asprintf("_xpc_connection_set_event_handler_f called after connection activation");
    _xpc_api_misuse(v4);
  }
  if ((BYTE8(v3) & 1) != 0)
    _Block_release((const void *)v3);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  void *v3;
  unsigned __int128 *v4;
  unsigned __int128 v5;

  v3 = _xpc_Block_copy_impl(handler);
  if (xpc_get_type(connection) != (xpc_type_t)OS_xpc_connection)
    _xpc_api_misuse("Given object not of required type.");
  v4 = (unsigned __int128 *)((char *)connection + 32);
  do
  {
    v5 = __ldxp(v4);
    if ((WORD4(v5) & 0x100) != 0)
    {
      __clrex();
      _xpc_connection_set_event_handler_slow((unint64_t *)connection, (unint64_t)v3);
      return;
    }
  }
  while (__stlxp(__PAIR128__(1, (unint64_t)v3), v4));
  if ((BYTE8(v5) & 1) != 0)
    _Block_release((const void *)v5);
}

uint64_t _xpc_connection_set_event_handler_slow(unint64_t *a1, unint64_t a2)
{
  unint64_t *v4;
  const void *v5;

  if (xpc_get_type(a1) != (xpc_type_t)OS_xpc_connection)
    _xpc_api_misuse("Given object not of required type.");
  v4 = a1 + 22;
  do
    v5 = (const void *)__ldxr(v4);
  while (__stlxr(a2, v4));
  if (v5)
    _Block_release(v5);
  _xpc_retain((uint64_t)a1);
  return dispatch_mach_receive_barrier_f();
}

void xpc_connection_suspend(xpc_connection_t connection)
{
  unsigned int *v2;
  unsigned int v3;
  char *v4;

  if (xpc_get_type(connection) != (xpc_type_t)OS_xpc_connection)
    _xpc_api_misuse("Given object not of required type.");
  if (*((__int16 *)connection + 112) < 0)
  {
    v4 = _xpc_asprintf("suspend is not allowed on this connection.");
    _xpc_api_misuse(v4);
  }
  dispatch_suspend(*((dispatch_object_t *)connection + 19));
  v2 = (unsigned int *)((char *)connection + 28);
  do
    v3 = __ldxr(v2);
  while (__stxr(v3 + 1, v2));
}

void xpc_connection_activate(xpc_connection_t connection)
{
  char *v2;

  if (xpc_get_type(connection) != (xpc_type_t)OS_xpc_connection)
    _xpc_api_misuse("Given object not of required type.");
  if (*((__int16 *)connection + 112) < 0)
  {
    v2 = _xpc_asprintf("activate is not allowed on this connection.");
    _xpc_api_misuse(v2);
  }
  _xpc_connection_activate_if_needed((mach_port_context_t)connection, 1);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  unsigned int *v2;
  unsigned int v3;
  char *v4;

  if (xpc_get_type(connection) != (xpc_type_t)OS_xpc_connection)
    _xpc_api_misuse("Given object not of required type.");
  if (*((__int16 *)connection + 112) < 0)
  {
    v4 = _xpc_asprintf("resume is not allowed on this connection.");
LABEL_12:
    _xpc_api_misuse(v4);
  }
  v2 = (unsigned int *)((char *)connection + 28);
  do
    v3 = __ldxr(v2);
  while (__stlxr(v3 - 1, v2));
  if (v3 == 1)
  {
    if ((_xpc_connection_activate_if_needed((mach_port_context_t)connection, 0) & 1) != 0)
      return;
  }
  else if (!v3)
  {
    v4 = _xpc_asprintf("Over-resume of a connection.");
    goto LABEL_12;
  }
  dispatch_resume(*((dispatch_object_t *)connection + 19));
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  void *v4;
  char *v5;

  if (xpc_get_type(connection) != (xpc_type_t)OS_xpc_connection)
    _xpc_api_misuse("Given object not of required type.");
  if (xpc_get_type(message) != (xpc_type_t)OS_xpc_dictionary)
  {
    v5 = _xpc_asprintf("Message types other than dictionaries are not supported.");
    _xpc_api_misuse(v5);
  }
  _xpc_ktrace_pid1();
  v4 = (void *)_xpc_connection_pack_message((unsigned int *)connection, message, 0);
  _xpc_connection_enqueue(connection, 0, (uint64_t)v4);
  _xpc_ktrace_pid1();
  xpc_release(v4);
}

void xpc_connection_send_barrier(xpc_connection_t connection, dispatch_block_t barrier)
{
  if (xpc_get_type(connection) != (xpc_type_t)OS_xpc_connection)
    _xpc_api_misuse("Given object not of required type.");
  dispatch_mach_send_barrier();
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  mach_port_name_t v8;
  _QWORD *v9;
  char *v10;

  if (xpc_get_type(connection) != (xpc_type_t)OS_xpc_connection)
    _xpc_api_misuse("Given object not of required type.");
  if (xpc_get_type(message) != (xpc_type_t)OS_xpc_dictionary)
  {
    v10 = _xpc_asprintf("Message types other than dictionaries are not supported.");
    goto LABEL_12;
  }
  if ((*((_WORD *)connection + 112) & 0x80) != 0)
  {
    v10 = _xpc_asprintf("send_message_with_reply is not allowed with a non-launching Mach service");
LABEL_12:
    _xpc_api_misuse(v10);
  }
  if (!replyq)
    replyq = dispatch_get_global_queue(0, 0);
  _xpc_ktrace_pid1();
  v8 = _xpc_mach_port_allocate(0x1002u, 0, 0);
  v9 = (_QWORD *)_xpc_connection_pack_message((unsigned int *)connection, message, v8);
  if (_xpc_mach_port_guard(v8, 0, (mach_port_context_t)v9))
    _os_assumes_log();
  v9[17] = _xpc_Block_copy_impl(handler);
  v9[18] = replyq;
  dispatch_retain(replyq);
  _xpc_connection_enqueue(connection, 0, (uint64_t)v9);
  _xpc_ktrace_pid1();
  xpc_release(v9);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  uint64_t v4;
  _DWORD *mach_message_header;
  uint64_t v6;
  char *v7;

  if (xpc_get_type(connection) == (xpc_type_t)OS_xpc_connection)
  {
    if (xpc_get_type(message) == (xpc_type_t)OS_xpc_dictionary)
    {
      if ((*((_WORD *)connection + 112) & 0x80) == 0)
      {
        _xpc_ktrace_pid1();
        v4 = _xpc_connection_pack_message((unsigned int *)connection, message, 0);
        mach_message_header = (_DWORD *)_xpc_serializer_get_mach_message_header();
        *mach_message_header |= 0x1500u;
        if (!*((_DWORD *)connection + 48))
          mach_message_header[5] = 0x40000000;
        xpc_retain(connection);
        _xpc_retain(v4);
        v6 = *((_QWORD *)connection + 29);
        if (v6)
          (*(void (**)(uint64_t, _QWORD, _QWORD))(v6 + 16))(v6, *(_QWORD *)(v4 + 32), *(_QWORD *)(v4 + 40));
        _xpc_received_message_get_connection(v4);
        dispatch_mach_send_with_result_and_wait_for_reply();
        _xpc_connection_enqueue_cold_1(0);
      }
      v7 = _xpc_asprintf("send_message_with_reply_sync is not allowed with a non-launching Mach service");
    }
    else
    {
      v7 = _xpc_asprintf("Message types other than dictionaries are not supported.");
    }
    _xpc_api_misuse(v7);
  }
  _xpc_api_misuse("Given object not of required type.");
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  char *v8;
  int v9;
  xpc_connection_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C874D8];
  if (xpc_get_type(connection) != (xpc_type_t)OS_xpc_connection)
    _xpc_api_misuse("Given object not of required type.");
  if (*((__int16 *)connection + 112) < 0)
  {
    v8 = _xpc_asprintf("cancel is not allowed on this connection.");
    _xpc_api_misuse(v8);
  }
  if (_xpc_connection_cancel((uint64_t)connection, 1, "xpc_connection_cancel()", v2, v3, v4, v5, v6, v9)
    && _os_trace_lazy_init_completed_4libxpc()
    && (*((_WORD *)connection + 112) & 0x4000) == 0)
  {
    if (_xpc_connection_log_handle__once != -1)
      dispatch_once(&_xpc_connection_log_handle__once, &__block_literal_global_111);
    v7 = _xpc_connection_log_handle__log;
    if (os_log_type_enabled((os_log_t)_xpc_connection_log_handle__log, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 134217984;
      v10 = connection;
      _os_log_impl(&dword_1DEE85000, v7, OS_LOG_TYPE_DEFAULT, "[%p] invalidated because the current process cancelled the connection by calling xpc_connection_cancel()", (uint8_t *)&v9, 0xCu);
    }
  }
}

const char *__cdecl xpc_connection_get_name(xpc_connection_t connection)
{
  NSObject *v3;

  if (xpc_get_type(connection) != (xpc_type_t)OS_xpc_connection)
    _xpc_api_misuse("Given object not of required type.");
  if (*((_DWORD *)connection + 6))
    return 0;
  v3 = *((_QWORD *)connection + 19);
  if (!v3)
    return 0;
  else
    return dispatch_queue_get_label(v3);
}

uid_t xpc_connection_get_euid(xpc_connection_t connection)
{
  if (xpc_get_type(connection) != (xpc_type_t)OS_xpc_connection)
    _xpc_api_misuse("Given object not of required type.");
  return *((_DWORD *)connection + 27);
}

gid_t xpc_connection_get_egid(xpc_connection_t connection)
{
  if (xpc_get_type(connection) != (xpc_type_t)OS_xpc_connection)
    _xpc_api_misuse("Given object not of required type.");
  return *((_DWORD *)connection + 28);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  if (xpc_get_type(connection) != (xpc_type_t)OS_xpc_connection)
    _xpc_api_misuse("Given object not of required type.");
  return *((_DWORD *)connection + 31);
}

au_asid_t xpc_connection_get_asid(xpc_connection_t connection)
{
  if (xpc_get_type(connection) != (xpc_type_t)OS_xpc_connection)
    _xpc_api_misuse("Given object not of required type.");
  return *((_DWORD *)connection + 32);
}

void xpc_connection_set_context(xpc_connection_t connection, void *context)
{
  if (xpc_get_type(connection) != (xpc_type_t)OS_xpc_connection)
    _xpc_api_misuse("Given object not of required type.");
  dispatch_set_context(*((dispatch_object_t *)connection + 19), context);
}

void *__cdecl xpc_connection_get_context(xpc_connection_t connection)
{
  if (xpc_get_type(connection) != (xpc_type_t)OS_xpc_connection)
    _xpc_api_misuse("Given object not of required type.");
  return dispatch_get_context(*((dispatch_object_t *)connection + 19));
}

void xpc_connection_set_finalizer_f(xpc_connection_t connection, xpc_finalizer_t finalizer)
{
  if (xpc_get_type(connection) != (xpc_type_t)OS_xpc_connection)
    _xpc_api_misuse("Given object not of required type.");
  dispatch_set_finalizer_f(*((dispatch_object_t *)connection + 19), finalizer);
}

__objc2_class *xpc_connection_enable_termination_imminent_event(uint64_t a1)
{
  __objc2_class *result;
  char *v3;

  result = (__objc2_class *)xpc_get_type((xpc_object_t)a1);
  if (result != OS_xpc_connection)
    _xpc_api_misuse("Given object not of required type.");
  if (*(_DWORD *)(a1 + 64))
  {
    v3 = _xpc_asprintf("Attempt to enable termination-imminent event on a live connection.");
    _xpc_api_misuse(v3);
  }
  *(_WORD *)(a1 + 224) |= 0x2000u;
  return result;
}

__objc2_class *xpc_connection_enable_sim2host_4sim(_DWORD *a1)
{
  __objc2_class *result;
  char *v3;

  result = (__objc2_class *)xpc_get_type(a1);
  if (result != OS_xpc_connection)
    _xpc_api_misuse("Given object not of required type.");
  if (a1[16])
  {
    v3 = _xpc_asprintf("Attempt to change the sim-to-host mode on a live connection.");
    _xpc_api_misuse(v3);
  }
  a1[48] = 2;
  return result;
}

BOOL xpc_connection_get_peer_instance(_DWORD *a1, unsigned __int8 *a2)
{
  char *v5;

  if (xpc_get_type(a1) != (xpc_type_t)OS_xpc_connection)
    _xpc_api_misuse("Given object not of required type.");
  if (a1[6] != 2)
  {
    v5 = _xpc_asprintf("xpc_connection_get_peer_instance() must be called on a peer connection.");
    _xpc_api_misuse(v5);
  }
  return _xpc_get_service_instance(a1[31], a2);
}

void *xpc_connection_set_distorter(const void **a1, const void *a2)
{
  void *result;

  if (xpc_get_type(a1) != (xpc_type_t)OS_xpc_connection)
    _xpc_api_misuse("Given object not of required type.");
  _Block_release(a1[29]);
  result = _Block_copy(a2);
  a1[29] = result;
  return result;
}

uint64_t _xpc_connection_get_distorter(_QWORD *a1)
{
  if (xpc_get_type(a1) != (xpc_type_t)OS_xpc_connection)
    _xpc_api_misuse("Given object not of required type.");
  return a1[29];
}

int xpc_connection_set_peer_code_signing_requirement(xpc_connection_t connection, const char *requirement)
{
  return 45;
}

uint64_t xpc_connection_set_peer_entitlement_exists_requirement(_xpc_connection_s *a1, const char *a2)
{
  xpc_object_t empty;
  xpc_object_t v5;
  uint64_t v6;

  empty = xpc_array_create_empty();
  v5 = xpc_array_create_empty();
  xpc_array_set_int64(v5, 0xFFFFFFFFFFFFFFFFLL, 1);
  xpc_array_set_string(v5, 0xFFFFFFFFFFFFFFFFLL, a2);
  xpc_array_append_value(empty, v5);
  v6 = _xpc_connection_set_lwcr_entitlement_requirement(a1, empty);
  xpc_release(empty);
  xpc_release(v5);
  return v6;
}

uint64_t _xpc_connection_set_lwcr_entitlement_requirement(_xpc_connection_s *a1, void *a2)
{
  xpc_object_t empty;
  xpc_object_t v5;
  uint64_t v6;

  empty = xpc_dictionary_create_empty();
  v5 = xpc_dictionary_create_empty();
  xpc_dictionary_set_value(v5, "$query", a2);
  xpc_dictionary_set_value(empty, "entitlements", v5);
  v6 = _xpc_connection_set_lwcr_requirements(a1, empty);
  xpc_release(empty);
  xpc_release(v5);
  return v6;
}

uint64_t xpc_connection_set_peer_entitlement_matches_value_requirement(_xpc_connection_s *a1, const char *a2, void *a3)
{
  xpc_object_t empty;
  xpc_object_t v7;
  xpc_object_t v8;
  int64_t v9;
  uint64_t v10;
  const _xpc_type_s *type;
  const char *name;
  char *v14;

  empty = xpc_array_create_empty();
  v7 = xpc_array_create_empty();
  xpc_array_set_int64(v7, 0xFFFFFFFFFFFFFFFFLL, 1);
  xpc_array_set_string(v7, 0xFFFFFFFFFFFFFFFFLL, a2);
  xpc_array_append_value(empty, v7);
  xpc_release(v7);
  v8 = xpc_array_create_empty();
  if (xpc_get_type(a3) == (xpc_type_t)OS_xpc_BOOL)
  {
    v9 = 5;
  }
  else if (xpc_get_type(a3) == (xpc_type_t)OS_xpc_string)
  {
    v9 = 3;
  }
  else
  {
    if (xpc_get_type(a3) != (xpc_type_t)OS_xpc_int64)
    {
      type = xpc_get_type(a3);
      name = xpc_type_get_name(type);
      v14 = _xpc_asprintf("Attempting to set entitlement matching value with unsupported value type: %s", name);
      _xpc_api_misuse(v14);
    }
    v9 = 7;
  }
  xpc_array_set_int64(v8, 0xFFFFFFFFFFFFFFFFLL, v9);
  xpc_array_set_value(v8, 0xFFFFFFFFFFFFFFFFLL, a3);
  xpc_array_append_value(empty, v8);
  v10 = _xpc_connection_set_lwcr_entitlement_requirement(a1, empty);
  xpc_release(v8);
  xpc_release(empty);
  return v10;
}

uint64_t xpc_connection_set_peer_team_identity_requirement(_xpc_connection_s *a1, const char *a2)
{
  xpc_object_t empty;
  xpc_object_t lwcr_query_for_validation_category;
  uint64_t v6;
  __int128 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C874D8];
  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_BOOL(empty, "team-identifier-for-current-process", 1);
  if (a2)
    xpc_dictionary_set_string(empty, "signing-identifier", a2);
  v9 = 6;
  v8 = xmmword_1DEEBD18C;
  lwcr_query_for_validation_category = xpc_create_lwcr_query_for_validation_category((int *)&v8, 5);
  xpc_dictionary_set_value(empty, "validation-category", lwcr_query_for_validation_category);
  xpc_release(lwcr_query_for_validation_category);
  v6 = _xpc_connection_set_lwcr_requirements(a1, empty);
  xpc_release(empty);
  return v6;
}

uint64_t _xpc_connection_set_lwcr_requirements(_xpc_connection_s *a1, xpc_object_t object)
{
  xpc_object_t lwcr_dictionary;
  uint64_t v5;
  char *v6;
  NSObject *v7;
  int v9;
  _xpc_connection_s *v10;
  __int16 v11;
  const char *name;
  __int16 v13;
  char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C874D8];
  lwcr_dictionary = xpc_create_lwcr_dictionary(1, 0, object);
  v5 = _xpc_connection_set_lwcr((uint64_t)a1, lwcr_dictionary);
  if (!(_DWORD)v5)
  {
    v6 = xpc_copy_clean_description((unint64_t *)object);
    if (_os_trace_lazy_init_completed_4libxpc() && (*((_WORD *)a1 + 112) & 0x4000) == 0)
    {
      if (_xpc_connection_log_handle__once != -1)
        dispatch_once(&_xpc_connection_log_handle__once, &__block_literal_global_111);
      v7 = _xpc_connection_log_handle__log;
      if (os_log_type_enabled((os_log_t)_xpc_connection_log_handle__log, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 134218498;
        v10 = a1;
        v11 = 2080;
        name = xpc_connection_get_name(a1);
        v13 = 2080;
        v14 = v6;
        _os_log_impl(&dword_1DEE85000, v7, OS_LOG_TYPE_DEFAULT, "[%p] Set peer lightweight code requirement on connection (%s): %s", (uint8_t *)&v9, 0x20u);
      }
    }
    free(v6);
  }
  xpc_release(lwcr_dictionary);
  return v5;
}

uint64_t xpc_connection_set_peer_platform_identity_requirement(_xpc_connection_s *a1, const char *a2)
{
  xpc_object_t empty;
  void *v5;
  xpc_object_t v6;
  uint64_t v7;
  int v9;

  empty = xpc_dictionary_create_empty();
  v5 = empty;
  if (a2)
    xpc_dictionary_set_string(empty, "signing-identifier", a2);
  v9 = 1;
  v6 = xpc_create_lwcr_query_for_validation_category(&v9, 1);
  xpc_dictionary_set_value(v5, "validation-category", v6);
  xpc_release(v6);
  v7 = _xpc_connection_set_lwcr_requirements(a1, v5);
  xpc_release(v5);
  return v7;
}

uint64_t xpc_connection_set_peer_lightweight_code_requirement(_xpc_connection_s *a1, xpc_object_t object)
{
  uint64_t result;
  NSObject *v5;
  _BOOL4 v6;
  const _xpc_type_s *type;
  const char *name;
  char *v9;
  uint8_t buf[4];
  _xpc_connection_s *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C874D8];
  if (xpc_get_type(object) == (xpc_type_t)OS_xpc_dictionary)
    return _xpc_connection_set_lwcr_requirements(a1, object);
  if (xpc_get_type(object) != (xpc_type_t)OS_xpc_data)
  {
    type = xpc_get_type(object);
    name = xpc_type_get_name(type);
    v9 = _xpc_asprintf("Attempting to set LWCR with invalid type: %s", name);
    _xpc_api_misuse(v9);
  }
  result = _xpc_connection_set_lwcr((uint64_t)a1, object);
  if (!(_DWORD)result)
  {
    result = _os_trace_lazy_init_completed_4libxpc();
    if ((_DWORD)result)
    {
      if ((*((_WORD *)a1 + 112) & 0x4000) != 0)
        return 0;
      if (_xpc_connection_log_handle__once != -1)
        dispatch_once(&_xpc_connection_log_handle__once, &__block_literal_global_111);
      v5 = _xpc_connection_log_handle__log;
      v6 = os_log_type_enabled((os_log_t)_xpc_connection_log_handle__log, OS_LOG_TYPE_DEFAULT);
      result = 0;
      if (v6)
      {
        *(_DWORD *)buf = 134218242;
        v11 = a1;
        v12 = 2080;
        v13 = xpc_connection_get_name(a1);
        _os_log_impl(&dword_1DEE85000, v5, OS_LOG_TYPE_DEFAULT, "[%p] Set peer lightweight code requirement on connection: %s", buf, 0x16u);
        return 0;
      }
    }
  }
  return result;
}

uint64_t _xpc_connection_set_lwcr(uint64_t a1, xpc_object_t object)
{
  _QWORD *data_from_lwcr_dictionary;
  _OWORD *self_audit_token;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  char *v10;
  const _xpc_type_s *type;
  uint64_t v12;
  _BYTE buf[32];
  uint8_t v14[4];
  _DWORD v15[259];

  *(_QWORD *)&v15[257] = *MEMORY[0x1E0C874D8];
  if (*(_QWORD *)(a1 + 200))
  {
    v10 = _xpc_asprintf("xpc_connection_set_peer_* family must be called no more than once");
    goto LABEL_26;
  }
  if (xpc_get_type(object) != (xpc_type_t)OS_xpc_dictionary)
  {
    if (xpc_get_type(object) == (xpc_type_t)OS_xpc_data)
    {
      data_from_lwcr_dictionary = xpc_retain(object);
      goto LABEL_6;
    }
    type = xpc_get_type(object);
    xpc_type_get_name(type);
    v10 = _xpc_asprintf("Attempting to set LWCR with invalid type: %s", v12);
LABEL_26:
    _xpc_api_misuse(v10);
  }
  data_from_lwcr_dictionary = (_QWORD *)xpc_create_data_from_lwcr_dictionary(object);
  if (!data_from_lwcr_dictionary)
  {
    if (_os_trace_lazy_init_completed_4libxpc() && (*(_WORD *)(a1 + 224) & 0x4000) == 0)
    {
      if (_xpc_connection_log_handle__once != -1)
        dispatch_once(&_xpc_connection_log_handle__once, &__block_literal_global_111);
      v8 = _xpc_connection_log_handle__log;
      if (os_log_type_enabled((os_log_t)_xpc_connection_log_handle__log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v14 = 134217984;
        *(_QWORD *)v15 = a1;
        _os_log_impl(&dword_1DEE85000, v8, OS_LOG_TYPE_DEFAULT, "[%p] Unable to convert LWCR dictionary to LWCR data", v14, 0xCu);
      }
    }
    return 22;
  }
LABEL_6:
  if (xpc_get_type(data_from_lwcr_dictionary) != (xpc_type_t)OS_xpc_data)
    _os_assumes_log();
  self_audit_token = (_OWORD *)_xpc_get_self_audit_token();
  *(_OWORD *)buf = *self_audit_token;
  *(_OWORD *)&buf[16] = self_audit_token[1];
  bzero(v14, 0x404uLL);
  _xpc_connection_token_satisfies_lwcr(buf, data_from_lwcr_dictionary, v14);
  if (*(_DWORD *)v14 < 2u)
  {
    *(_QWORD *)(a1 + 200) = _xpc_alloc(0x20uLL);
    os_map_128_init();
    v7 = 0;
    *(_QWORD *)(*(_QWORD *)(a1 + 200) + 24) = data_from_lwcr_dictionary;
    return v7;
  }
  if (!_os_trace_lazy_init_completed_4libxpc() || (*(_WORD *)(a1 + 224) & 0x4000) != 0)
    return 22;
  if (_xpc_connection_log_handle__once != -1)
    dispatch_once(&_xpc_connection_log_handle__once, &__block_literal_global_111);
  v6 = _xpc_connection_log_handle__log;
  if (!os_log_type_enabled((os_log_t)_xpc_connection_log_handle__log, OS_LOG_TYPE_DEFAULT))
    return 22;
  *(_DWORD *)buf = 134218242;
  *(_QWORD *)&buf[4] = a1;
  *(_WORD *)&buf[12] = 2080;
  *(_QWORD *)&buf[14] = v15;
  v7 = 22;
  _os_log_impl(&dword_1DEE85000, v6, OS_LOG_TYPE_DEFAULT, "[%p] LWCR invalid: %s", buf, 0x16u);
  return v7;
}

char *xpc_connection_copy_invalidation_reason(uint64_t a1)
{
  unint64_t v1;
  const char *v2;

  v1 = atomic_load((unint64_t *)(a1 + 96));
  if (v1 && (v2 = *(const char **)(v1 + 8)) != 0)
    return _xpc_strdup(v2);
  else
    return 0;
}

__objc2_class *__xpc_connection_set_logging(_WORD *a1, int a2)
{
  __objc2_class *result;
  __int16 v5;

  result = (__objc2_class *)xpc_get_type(a1);
  if (result != OS_xpc_connection)
    _xpc_api_misuse("Given object not of required type.");
  if (a2)
    v5 = 0;
  else
    v5 = 0x4000;
  a1[112] = a1[112] & 0xBFFF | v5;
  return result;
}

uint64_t _xpc_connection_extract_connection(uint64_t a1, BOOL *a2)
{
  if (a2)
    *a2 = *(_DWORD *)(a1 + 24) == 2;
  if (*(_QWORD *)(a1 + 32))
    _xpc_connection_call_event_handler(a1, (uint64_t)&_xpc_error_connection_invalid);
  if ((*(_BYTE *)(a1 + 40) & 1) != 0)
  {
    _Block_release(*(const void **)(a1 + 32));
    *(_BYTE *)(a1 + 40) = 0;
  }
  *(_QWORD *)(a1 + 32) = 0;
  return a1;
}

uint64_t _xpc_connection_call_event_handler(uint64_t a1, uint64_t a2)
{
  void *context;

  if ((*(_BYTE *)(a1 + 40) & 1) != 0)
  {
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2);
  }
  else
  {
    context = dispatch_get_context(*(dispatch_object_t *)(a1 + 152));
    (*(void (**)(uint64_t, void *))(a1 + 32))(a2, context);
  }
  return _os_avoid_tail_call();
}

uint64_t _xpc_connection_handle_event_inline(void *a1, uint64_t a2, dispatch_object_t object, int a4)
{
  uint64_t result;

  if ((unint64_t)(a2 - 3) >= 2)
  {
    if (a2 != 5)
      return 0;
    a4 = 268435459;
  }
  result = (uint64_t)dispatch_get_context(object);
  if (result)
  {
    _xpc_connection_release_message(a1, (uint64_t)object, result, a4);
    return 1;
  }
  return result;
}

uint64_t _xpc_serializer_reply_queue_from_msg_context(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 144);
  return result;
}

void _xpc_connection_handle_async_reply(_WORD *a1, uint64_t a2, NSObject *a3)
{
  mach_msg_header_t *msg;
  int msgh_id;
  mach_port_context_t context;
  __objc2_class **v11;
  __objc2_class **v12;

  msg = (mach_msg_header_t *)dispatch_mach_msg_get_msg();
  if (a2 != 2)
  {
    if (a2 != 12)
      _xpc_connection_handle_async_reply_cold_1(a2);
    _xpc_connection_handle_disconnect_event((mach_port_context_t)a1, (uint64_t)a3, 12);
    return;
  }
  msgh_id = msg->msgh_id;
  if (msgh_id > 805306367)
  {
    if (msgh_id != 805306368 && msgh_id != 1999646836 && msgh_id != 0x40000000)
      goto LABEL_21;
    goto LABEL_20;
  }
  if (msgh_id == 0x10000000)
    goto LABEL_20;
  if (msgh_id != 0x20000000)
  {
LABEL_21:
    _xpc_connection_pass2mig((uint64_t)a1, (uint64_t)a3);
    return;
  }
  msg = (mach_msg_header_t *)dispatch_mach_msg_get_msg();
  if ((a1[112] & 8) != 0)
  {
LABEL_20:
    mach_msg_destroy(msg);
    return;
  }
  context = _xpc_mach_msg_get_context((uint64_t)msg);
  v11 = _xpc_connection_unpack_message((uint64_t)a1, a3);
  if (v11)
    v12 = v11;
  else
    v12 = &_xpc_error_connection_interrupted;
  _xpc_connection_call_reply_async(a1, context, v12);
}

uint64_t _xpc_connection_wants_sigterm(unsigned __int16 *a1)
{
  if (xpc_get_type(a1) != (xpc_type_t)OS_xpc_connection)
    _xpc_api_misuse("Given object not of required type.");
  return (a1[112] >> 13) & 1;
}

uint64_t _xpc_connection_release_message(xpc_object_t object, uint64_t a2, uint64_t a3, int a4)
{
  unsigned __int16 v7;
  unsigned int v8;

  if (a4 <= 268435458)
  {
    if (a4)
      goto LABEL_18;
    _xpc_serializer_clear_sent_descriptors(a3);
    goto LABEL_7;
  }
  if (a4 > 268435468)
  {
    if (a4 <= 268437507)
    {
      if (a4 == 268435469)
      {
        v8 = *(_DWORD *)(dispatch_mach_msg_get_msg() + 4);
        if (v8 <= 0x40000)
          _xpc_connection_release_message_cold_3(v8);
        _xpc_connection_release_message_cold_4();
      }
      v7 = 1028;
    }
    else
    {
      if (a4 == 268437508 || a4 == 268439556)
        goto LABEL_15;
      v7 = 8196;
    }
    if (a4 != (v7 | 0x10000000))
      goto LABEL_18;
LABEL_15:
    _xpc_connection_release_message_cold_2(a4);
  }
  if (a4 != 268435459)
LABEL_18:
    _xpc_connection_release_message_cold_1(a4);
LABEL_7:
  xpc_release(object);
  return _xpc_release(a3);
}

void _xpc_connection_handle_disconnect_event(mach_port_context_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t msg;
  uint64_t v6;
  mach_port_context_t context;
  _DWORD *v8;
  __objc2_class **v9;
  mach_port_name_t v10;
  kern_return_t v11;
  char *v12;
  kern_return_t v13;
  char *v14;
  mach_port_type_t ptype;

  msg = dispatch_mach_msg_get_msg();
  v6 = *(unsigned int *)(msg + 12);
  if (a3 == 12)
  {
    context = _xpc_mach_port_get_context(*(_DWORD *)(msg + 12));
    v8 = (_DWORD *)atomic_load((unint64_t *)(a1 + 96));
    v9 = &_xpc_error_connection_interrupted;
    if (v8)
    {
      if (*v8 != 4)
        v9 = &_xpc_error_connection_invalid;
    }
    _xpc_connection_call_reply_async((void *)a1, context, v9);
  }
  else
  {
    v10 = *(_DWORD *)(msg + 8);
    if (v10)
    {
      ptype = 0;
      v11 = mach_port_type(*MEMORY[0x1E0C883F0], v10, &ptype);
      if (v11 && (v13 = v11, _os_assumes_log(), v13 == 15))
      {
        v14 = _xpc_copy_nsobject_debug_description((void *)a1);
        v12 = _xpc_asprintf("BUG IN (CLIENT OF?) LIBXPC: invalid disconnect oldsendp 0x%x, conn %s", v10, v14);
        free(v14);
        qword_1F0460B90 = (uint64_t)v12;
      }
      else
      {
        v12 = 0;
      }
      if ((*(_WORD *)(a1 + 224) & 8) != 0)
      {
        *(_DWORD *)(a1 + 80) = v10;
      }
      else if (_xpc_mach_port_release(v10))
      {
        _os_assumes_log();
      }
      if (v10 == *(_DWORD *)(a1 + 76))
        *(_DWORD *)(a1 + 76) = 0;
      if (v12)
      {
        qword_1F0460B90 = 0;
        free(v12);
      }
    }
    else if ((_DWORD)v6)
    {
      if ((_DWORD)v6 != *(_DWORD *)(a1 + 68))
        _xpc_connection_handle_disconnect_event_cold_1((unsigned int *)(a1 + 68), v6);
      if (_xpc_mach_port_close_recv(*(_DWORD *)(msg + 12), 0, a1))
        _os_assumes_log();
      *(_DWORD *)(a1 + 68) = 0;
    }
  }
}

void _xpc_connection_pass2mig(uint64_t a1, uint64_t a2)
{
  mach_msg_header_t *msg;
  _OWORD v5[2];
  int v6;
  _QWORD v7[3];

  if (_mig_tsd_once != -1)
    dispatch_once(&_mig_tsd_once, &__block_literal_global_1);
  msg = (mach_msg_header_t *)dispatch_mach_msg_get_msg();
  if (*(_DWORD *)(_xpc_mach_msg_get_audit_token((uint64_t)msg) + 20))
  {
    mach_msg_destroy(msg);
  }
  else
  {
    v7[0] = a1;
    v7[1] = a2;
    v7[2] = 0;
    if (pthread_setspecific(_mig_tsd, v7))
      _os_assumes_log();
    v6 = 0;
    memset(v5, 0, sizeof(v5));
    if (notify_server(msg, (uint64_t)v5))
    {
      if (v6)
        _os_assumes_log();
    }
    else
    {
      syslog(3, "MIG demux failed. This message ID is invalid: 0x%x", msg->msgh_id);
      mach_msg_destroy(msg);
    }
    if (pthread_setspecific(_mig_tsd, 0))
      _os_assumes_log();
  }
}

__objc2_class **_xpc_connection_unpack_message(uint64_t a1, NSObject *a2)
{
  uint64_t msg;
  int v5;
  int v6;
  NSObject *v7;
  __objc2_class **result;
  void *v9;
  int v10;
  int v12;
  int v13;
  _BYTE buf[12];
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C874D8];
  msg = dispatch_mach_msg_get_msg();
  v5 = _xpc_connection_check_peer_requirement(a1, msg);
  if (v5)
  {
    v6 = v5;
    if (_os_trace_lazy_init_completed_4libxpc() && (*(_WORD *)(a1 + 224) & 0x4000) == 0)
    {
      if (_xpc_connection_log_handle__once != -1)
        dispatch_once(&_xpc_connection_log_handle__once, &__block_literal_global_111);
      v7 = _xpc_connection_log_handle__log;
      if (os_log_type_enabled((os_log_t)_xpc_connection_log_handle__log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = a1;
        v15 = 1024;
        v16 = v6;
        _os_log_impl(&dword_1DEE85000, v7, OS_LOG_TYPE_DEFAULT, "[%p] Received message forbidden due to code signing requirement: %d", buf, 0x12u);
      }
    }
    return &_xpc_error_peer_code_signing_requirement;
  }
  else
  {
    v9 = (void *)voucher_copy();
    v10 = *(_DWORD *)(msg + 20);
    if (v10 == 0x40000000 || v10 == 0x10000000)
    {
      _xpc_transaction_begin();
      v12 = 1;
    }
    else
    {
      v12 = 0;
    }
    *(_QWORD *)buf = 0;
    v13 = xpc_receive_mach_msg(a2, v12, v9, (_QWORD *)a1, (uint64_t *)buf);
    result = 0;
    if (v13 != -1)
    {
      if (v13)
        _xpc_mach_message_request_handoff_reply_cold_1();
      _xpc_connection_set_creds(a1, msg);
      return *(__objc2_class ***)buf;
    }
  }
  return result;
}

void _xpc_connection_call_reply_async(void *a1, mach_port_context_t guard, void *a3)
{
  void *v6;

  if (!a3)
    _xpc_connection_call_reply_async_cold_1();
  if (_xpc_mach_port_close_recv(*(_DWORD *)(guard + 152), 0, guard))
    _os_assumes_log();
  v6 = _xpc_alloc(0x18uLL);
  _xpc_serializer_invoke_reply(guard, a3);
  _Block_release(*(const void **)(guard + 136));
  dispatch_release(*(dispatch_object_t *)(guard + 144));
  xpc_release(a1);
  _xpc_release(guard);
  xpc_release(a3);
  free(v6);
}

uint64_t _xpc_connection_check_peer_requirement(uint64_t a1, uint64_t a2)
{
  uint64_t audit_token;
  int v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD *v16;
  NSObject *v17;
  char v18;
  uint64_t v19;
  __int128 v20;
  int v21;
  _BYTE v22[28];
  int v23;
  uint8_t buf[4];
  _DWORD v25[259];

  *(_QWORD *)&v25[257] = *MEMORY[0x1E0C874D8];
  if (*(_DWORD *)(a1 + 24) != 2)
    goto LABEL_4;
  audit_token = _xpc_mach_msg_get_audit_token(a2);
  os_unfair_lock_lock_with_options();
  if (*(_DWORD *)(a1 + 124) != *(_DWORD *)(audit_token + 20))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
LABEL_8:
    if (_os_trace_lazy_init_completed_4libxpc() && (*(_WORD *)(a1 + 224) & 0x4000) == 0)
    {
      if (_xpc_connection_log_handle__once != -1)
        dispatch_once(&_xpc_connection_log_handle__once, &__block_literal_global_111);
      v15 = _xpc_connection_log_handle__log;
      if (os_log_type_enabled((os_log_t)_xpc_connection_log_handle__log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)v25 = a1;
        _os_log_impl(&dword_1DEE85000, v15, OS_LOG_TYPE_DEFAULT, "[%p] A message is received from other than initial peer.", buf, 0xCu);
      }
    }
    _xpc_connection_cancel(a1, 3, "peer image changed", v10, v11, v12, v13, v14, v18);
    return 153;
  }
  v5 = *(_DWORD *)(a1 + 132);
  v6 = *(_DWORD *)(audit_token + 28);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  if (v5 != v6)
    goto LABEL_8;
LABEL_4:
  if (!*(_QWORD *)(a1 + 200))
    return 0;
  v7 = _xpc_mach_msg_get_audit_token(a2);
  v21 = *(_DWORD *)(v7 + 16);
  v8 = *(_DWORD *)(v7 + 28);
  v19 = *(_QWORD *)(v7 + 20);
  v20 = *(_OWORD *)v7;
  if (os_map_128_find())
    return 0;
  v16 = *(_QWORD **)(*(_QWORD *)(a1 + 200) + 24);
  if (!v16)
    return 45;
  bzero(buf, 0x404uLL);
  *(_OWORD *)v22 = v20;
  *(_DWORD *)&v22[16] = v21;
  *(_QWORD *)&v22[20] = v19;
  v23 = v8;
  _xpc_connection_token_satisfies_lwcr(v22, v16, buf);
  if (!*(_DWORD *)buf)
    goto LABEL_25;
  if (_os_trace_lazy_init_completed_4libxpc() && (*(_WORD *)(a1 + 224) & 0x4000) == 0)
  {
    if (_xpc_connection_log_handle__once != -1)
      dispatch_once(&_xpc_connection_log_handle__once, &__block_literal_global_111);
    v17 = _xpc_connection_log_handle__log;
    if (os_log_type_enabled((os_log_t)_xpc_connection_log_handle__log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v22 = 134218242;
      *(_QWORD *)&v22[4] = a1;
      *(_WORD *)&v22[12] = 2080;
      *(_QWORD *)&v22[14] = v25;
      _os_log_impl(&dword_1DEE85000, v17, OS_LOG_TYPE_DEFAULT, "[%p] LWCR requirement doesn't match: %s", v22, 0x16u);
    }
  }
  result = *(unsigned int *)buf;
  if (!*(_DWORD *)buf)
  {
LABEL_25:
    os_map_128_insert();
    return 0;
  }
  return result;
}

void _xpc_connection_set_creds(uint64_t a1, uint64_t a2)
{
  __int128 *audit_token;
  __int128 v4;

  audit_token = (__int128 *)_xpc_mach_msg_get_audit_token(a2);
  os_unfair_lock_lock_with_options();
  v4 = *audit_token;
  *(_OWORD *)(a1 + 120) = audit_token[1];
  *(_OWORD *)(a1 + 104) = v4;
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
}

uint64_t _xpc_connection_token_satisfies_lwcr@<X0>(_OWORD *a1@<X0>, _QWORD *a2@<X1>, void *a3@<X8>)
{
  __int128 v5;
  _OWORD v7[2];
  unint64_t v8;
  uint64_t v9;

  v9 = 0;
  v8 = 0;
  if (!xpc_data_get_bytes_ptr_and_length(a2, &v9, &v8))
    _xpc_mach_message_request_handoff_reply_cold_1();
  bzero(a3, 0x404uLL);
  v5 = a1[1];
  v7[0] = *a1;
  v7[1] = v5;
  return amfi_launch_constraint_matches_process((uint64_t)v7, v9, v8, (uint64_t)a3);
}

uint64_t ___xpc_connection_pass2mig_block_invoke()
{
  uint64_t result;

  result = pthread_key_create((pthread_key_t *)&_mig_tsd, 0);
  if ((_DWORD)result)
    _xpc_alloc_cold_1();
  return result;
}

void _xpc_connection_init(mach_port_context_t context)
{
  int v2;
  int v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *label;
  unsigned int v12;
  int v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  mach_port_name_t v17;
  int v18;
  uint32_t flags;
  int v20;
  int v21;
  NSObject *v22;
  mach_port_name_t send;
  int v24;
  NSObject *v25;
  mach_port_name_t v26;
  NSObject *v27;
  NSObject *v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int16 v35;
  int inited;
  NSObject *v37;
  const char *v38;
  __int16 v39;
  __int16 v40;
  __int16 v41;
  const char *v42;
  const char *v43;
  mach_port_name_t v44;
  NSObject *v45;
  mach_port_name_t name;
  uint8_t v47[4];
  mach_port_context_t v48;
  __int16 v49;
  int v50;
  mach_port_options_t buf;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C874D8];
  if ((*(_WORD *)(context + 224) & 4) == 0 && !*(_QWORD *)(context + 136) && *(_DWORD *)(context + 24) != 1)
    _xpc_uncork_domain();
  v2 = *(_DWORD *)(context + 64);
  switch(v2)
  {
    case 1:
      v3 = *(_DWORD *)(context + 24);
      if (v3 == 1)
      {
        if ((*(_WORD *)(context + 224) & 8) != 0)
          goto LABEL_41;
        if ((*(_BYTE *)(context + 16) & 1) == 0)
          _xpc_mach_message_request_handoff_reply_cold_1();
        goto LABEL_40;
      }
      if (v3)
        goto LABEL_41;
      v4 = *(unsigned __int16 *)(context + 224);
      if ((v4 & 8) == 0)
      {
LABEL_40:
        *(_DWORD *)(context + 68) = _xpc_mach_port_allocate(0x202Bu, 6u, context);
        goto LABEL_41;
      }
      if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 16) == -1)
      {
        v5 = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 24);
      }
      else
      {
        v5 = _os_alloc_once();
        v4 = *(unsigned __int16 *)(context + 224);
      }
      v6 = (v4 >> 5) & 0x10;
      v7 = (v4 >> 7) & 1;
      v8 = v4 & 3;
      if (v8 == 3)
        v7 = 1;
      if (v7)
        v6 |= 0x100uLL;
      if (v8 == 1)
        v9 = v6 | 0x200;
      else
        v9 = v6;
      v10 = v9 | 1;
      if (_xpc_is_being_debugged())
        v9 |= 1uLL;
      if (*(_BYTE *)(v5 + 40) && os_variant_has_internal_content())
        v9 = v10;
      LOBYTE(buf.flags) = 0;
      label = *(NSObject **)(context + 152);
      if (label)
        label = dispatch_queue_get_label(label);
      v12 = _xpc_activate_endpoint((const char *)label, 6, 0, v9, (_DWORD *)(context + 68), (BOOL *)&buf);
      if (v12)
      {
        v13 = v12;
        if ((v12 > 0x25 || ((1 << v12) & 0x200000000ALL) == 0) && v12 != 124 && v12 != 159)
          _os_assumes_log();
        if (_os_trace_lazy_init_completed_4libxpc() && (*(_WORD *)(context + 224) & 0x4000) == 0)
        {
          if (_xpc_connection_log_handle__once != -1)
            dispatch_once(&_xpc_connection_log_handle__once, &__block_literal_global_111);
          v14 = _xpc_connection_log_handle__log;
          if (os_log_type_enabled((os_log_t)_xpc_connection_log_handle__log, OS_LOG_TYPE_DEFAULT))
          {
            buf.flags = 134218240;
            *(_QWORD *)&buf.mpl.mpl_qlimit = context;
            *((_WORD *)&buf.service_port_name + 2) = 1024;
            *(mach_port_name_t *)((char *)&buf.service_port_name + 6) = v13;
            _os_log_impl(&dword_1DEE85000, v14, OS_LOG_TYPE_DEFAULT, "[%p] listener failed to activate: xpc_error=%{errno}d", (uint8_t *)&buf, 0x12u);
          }
        }
        goto LABEL_141;
      }
      v39 = *(_WORD *)(context + 224);
      if ((v39 & 3) == 1)
      {
        if (LOBYTE(buf.flags))
          v40 = 3;
        else
          v40 = 2;
        *(_WORD *)(context + 224) = v39 & 0xFFFC | v40;
      }
      if (_xpc_mach_port_set_queue_limit(*(unsigned int *)(context + 68), 16))
        _os_assumes_log();
      if (_xpc_mach_port_guard(*(_DWORD *)(context + 68), 1, context))
      {
        _os_assumes_log();
        v13 = 9;
LABEL_141:
        v41 = *(_WORD *)(context + 224);
        v42 = "listener activation";
        v43 = "receive right creation";
        goto LABEL_152;
      }
LABEL_41:
      ++*(_DWORD *)(context + 64);
LABEL_42:
      if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 16) == -1)
        v16 = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 24);
      else
        v16 = _os_alloc_once();
      if (*(_DWORD *)(context + 24) == 2 && *(_BYTE *)(v16 + 168))
      {
        xpc_retain((xpc_object_t)context);
        *(_WORD *)(context + 224) |= 0x1000u;
      }
      v2 = *(_DWORD *)(context + 64) + 1;
      *(_DWORD *)(context + 64) = v2;
LABEL_48:
      if (*(_DWORD *)(context + 24) == 2)
      {
        *(_DWORD *)v47 = 0;
        v17 = _xpc_mach_port_setup_no_more_senders(*(_DWORD *)(context + 68), *(_DWORD *)(context + 68), (mach_port_t *)v47);
        if (v17)
        {
          v26 = v17;
          _os_assumes_log();
          if ((_os_trace_lazy_init_completed_4libxpc() & 1) != 0 && (*(_WORD *)(context + 224) & 0x4000) == 0)
          {
            if (_xpc_connection_log_handle__once != -1)
              dispatch_once(&_xpc_connection_log_handle__once, &__block_literal_global_111);
            v27 = _xpc_connection_log_handle__log;
            if (os_log_type_enabled((os_log_t)_xpc_connection_log_handle__log, OS_LOG_TYPE_DEFAULT))
            {
              buf.flags = 134218240;
              *(_QWORD *)&buf.mpl.mpl_qlimit = context;
              *((_WORD *)&buf.service_port_name + 2) = 1024;
              *(mach_port_name_t *)((char *)&buf.service_port_name + 6) = v26;
              _os_log_impl(&dword_1DEE85000, v27, OS_LOG_TYPE_DEFAULT, "[%p] failed to register a no-senders notification: mach_error=%{mach.errno}x", (uint8_t *)&buf, 0x12u);
            }
          }
          v15 = "no-senders registration";
          v13 = 9;
          goto LABEL_111;
        }
        if (*(_DWORD *)v47)
          _xpc_connection_init_cold_3(*(unsigned int *)v47, (mach_port_name_t *)v47);
        v2 = *(_DWORD *)(context + 64);
      }
      *(_DWORD *)(context + 64) = v2 + 1;
LABEL_54:
      v18 = *(_DWORD *)(context + 24);
      if (v18 == 1)
      {
        if ((*(_WORD *)(context + 224) & 8) != 0)
          goto LABEL_109;
        if ((*(_DWORD *)(context + 72) + 1) >= 2)
          goto LABEL_107;
        *(_DWORD *)(context + 72) = 0;
        if (_os_trace_lazy_init_completed_4libxpc() && (*(_WORD *)(context + 224) & 0x4000) == 0)
        {
          if (_xpc_connection_log_handle__once != -1)
            dispatch_once(&_xpc_connection_log_handle__once, &__block_literal_global_111);
          v22 = _xpc_connection_log_handle__log;
          if (os_log_type_enabled((os_log_t)_xpc_connection_log_handle__log, OS_LOG_TYPE_DEFAULT))
          {
            buf.flags = 134217984;
            *(_QWORD *)&buf.mpl.mpl_qlimit = context;
            _os_log_impl(&dword_1DEE85000, v22, OS_LOG_TYPE_DEFAULT, "[%p] anonymous connection failed to decode send port", (uint8_t *)&buf, 0xCu);
          }
        }
        v13 = 9;
        goto LABEL_151;
      }
      if (!v18)
      {
        if ((*(_WORD *)(context + 224) & 8) != 0)
        {
          send = _xpc_mach_port_make_send(*(_DWORD *)(context + 68));
          if (!send)
          {
            *(_DWORD *)(context + 76) = *(_DWORD *)(context + 68);
            goto LABEL_109;
          }
          v44 = send;
          _os_assumes_log();
          if ((_os_trace_lazy_init_completed_4libxpc() & 1) != 0 && (*(_WORD *)(context + 224) & 0x4000) == 0)
          {
            if (_xpc_connection_log_handle__once != -1)
              dispatch_once(&_xpc_connection_log_handle__once, &__block_literal_global_111);
            v45 = _xpc_connection_log_handle__log;
            if (os_log_type_enabled((os_log_t)_xpc_connection_log_handle__log, OS_LOG_TYPE_DEFAULT))
            {
              buf.flags = 134218240;
              *(_QWORD *)&buf.mpl.mpl_qlimit = context;
              *((_WORD *)&buf.service_port_name + 2) = 1024;
              *(mach_port_name_t *)((char *)&buf.service_port_name + 6) = v44;
              _os_log_impl(&dword_1DEE85000, v45, OS_LOG_TYPE_DEFAULT, "[%p] listener failed to create a send right: mach_error=%{mach.errno}x", (uint8_t *)&buf, 0x12u);
            }
          }
          v13 = 24;
          goto LABEL_151;
        }
        flags = *(_DWORD *)(context + 72);
        if (flags)
          goto LABEL_58;
        buf.flags = 0;
        v24 = _xpc_connection_bootstrap_look_up_slow(context, &buf);
        v13 = v24;
        flags = buf.flags;
        *(_DWORD *)(context + 72) = buf.flags;
        if (v24 > 123)
        {
          if ((v24 - 124) > 0x23 || ((1 << (v24 - 124)) & 0x800200001) == 0)
LABEL_155:
            _os_assumes_log();
        }
        else
        {
          if (!v24)
          {
LABEL_58:
            if (!*(_DWORD *)(context + 192))
            {
              *(_QWORD *)&buf.flags = 0x60000283FLL;
              buf.8 = (mach_port_options::$31A3151A1187B0BDA86934B81E421906)flags;
              name = 0;
              v20 = _xpc_try_mach_port_construct(&buf, context, &name);
              v21 = v20;
              if (v20 > 16)
              {
                if (v20 != 17)
                {
                  if (v20 != 20)
                    goto LABEL_100;
                  goto LABEL_107;
                }
              }
              else
              {
                if (!v20)
                {
                  v29 = name;
                  if (name - 1 >= 0xFFFFFFFE)
                    _xpc_mach_message_request_handoff_reply_cold_1();
                  goto LABEL_108;
                }
                if (v20 != 15)
LABEL_100:
                  _xpc_connection_init_cold_1(v20);
              }
              if (_os_trace_lazy_init_completed_4libxpc() && (*(_WORD *)(context + 224) & 0x4000) == 0)
              {
                if (_xpc_connection_log_handle__once != -1)
                  dispatch_once(&_xpc_connection_log_handle__once, &__block_literal_global_111);
                v28 = _xpc_connection_log_handle__log;
                if (os_log_type_enabled((os_log_t)_xpc_connection_log_handle__log, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)v47 = 134218240;
                  v48 = context;
                  v49 = 1024;
                  v50 = v21;
                  _os_log_impl(&dword_1DEE85000, v28, OS_LOG_TYPE_DEFAULT, "[%p] Failed to derive connection port; error %#x",
                    v47,
                    0x12u);
                }
              }
            }
LABEL_107:
            v29 = _xpc_mach_port_allocate(0x203Fu, 6u, context);
LABEL_108:
            *(_DWORD *)(context + 76) = v29;
            *(_WORD *)(context + 224) |= 0x400u;
            goto LABEL_109;
          }
          if (v24 != 1 && v24 != 3)
            goto LABEL_155;
        }
        if (_os_trace_lazy_init_completed_4libxpc() && (*(_WORD *)(context + 224) & 0x4000) == 0)
        {
          if (_xpc_connection_log_handle__once != -1)
            dispatch_once(&_xpc_connection_log_handle__once, &__block_literal_global_111);
          v25 = _xpc_connection_log_handle__log;
          if (os_log_type_enabled((os_log_t)_xpc_connection_log_handle__log, OS_LOG_TYPE_DEFAULT))
          {
            buf.flags = 134218240;
            *(_QWORD *)&buf.mpl.mpl_qlimit = context;
            *((_WORD *)&buf.service_port_name + 2) = 1024;
            *(mach_port_name_t *)((char *)&buf.service_port_name + 6) = v13;
            _os_log_impl(&dword_1DEE85000, v25, OS_LOG_TYPE_DEFAULT, "[%p] failed to do a bootstrap look-up: xpc_error=%{errno}d", (uint8_t *)&buf, 0x12u);
          }
        }
        *(_WORD *)(context + 224) |= 0x400u;
        if (!v13)
          goto LABEL_109;
LABEL_151:
        v41 = *(_WORD *)(context + 224);
        v42 = "send right creation";
        v43 = "lookup";
LABEL_152:
        if ((v41 & 8) != 0)
          LOBYTE(v15) = (_BYTE)v42;
        else
          LOBYTE(v15) = (_BYTE)v43;
        goto LABEL_111;
      }
      if ((*(_DWORD *)(context + 76) + 1) <= 1)
        *(_DWORD *)(context + 76) = 0;
LABEL_109:
      ++*(_DWORD *)(context + 64);
LABEL_110:
      _xpc_connection_check_in(context);
      v13 = 0;
      LOBYTE(v15) = 0;
LABEL_111:
      v2 = *(_DWORD *)(context + 64);
LABEL_112:
      if (v2 <= 4)
      {
        xpc_strerror(v13);
        if (_xpc_connection_cancel(context, 3, "failed at %s%s with error %d - %s", v30, v31, v32, v33, v34, (char)v15))
        {
          v35 = *(_WORD *)(context + 224);
          inited = _os_trace_lazy_init_completed_4libxpc();
          if ((v35 & 0x100) != 0)
          {
            if (!inited || (*(_WORD *)(context + 224) & 0x4000) != 0)
              goto LABEL_128;
            if (_xpc_connection_log_handle__once != -1)
              dispatch_once(&_xpc_connection_log_handle__once, &__block_literal_global_111);
            v37 = _xpc_connection_log_handle__log;
            if (!os_log_type_enabled((os_log_t)_xpc_connection_log_handle__log, OS_LOG_TYPE_DEFAULT))
              goto LABEL_128;
            buf.flags = 134217984;
            *(_QWORD *)&buf.mpl.mpl_qlimit = context;
            v38 = "[%p] invalidated after a failed reconnect";
          }
          else
          {
            if (!inited || (*(_WORD *)(context + 224) & 0x4000) != 0)
              goto LABEL_128;
            if (_xpc_connection_log_handle__once != -1)
              dispatch_once(&_xpc_connection_log_handle__once, &__block_literal_global_111);
            v37 = _xpc_connection_log_handle__log;
            if (!os_log_type_enabled((os_log_t)_xpc_connection_log_handle__log, OS_LOG_TYPE_DEFAULT))
              goto LABEL_128;
            buf.flags = 134217984;
            *(_QWORD *)&buf.mpl.mpl_qlimit = context;
            v38 = "[%p] invalidated after a failed init";
          }
          _os_log_impl(&dword_1DEE85000, v37, OS_LOG_TYPE_DEFAULT, v38, (uint8_t *)&buf, 0xCu);
        }
LABEL_128:
        if ((*(_WORD *)(context + 224) & 0x100) != 0)
          dispatch_mach_reconnect();
        else
          dispatch_mach_connect();
      }
      return;
    case 2:
      goto LABEL_42;
    case 3:
      goto LABEL_48;
    case 4:
      goto LABEL_54;
    case 5:
      goto LABEL_110;
    default:
      v13 = 0;
      LOBYTE(v15) = 0;
      goto LABEL_112;
  }
}

os_log_t ___xpc_connection_log_handle_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.xpc", "connection");
  _xpc_connection_log_handle__log = (uint64_t)result;
  return result;
}

void _xpc_connection_mach_event(mach_port_context_t a1, uint64_t a2, dispatch_object_t object, int a4)
{
  uint64_t v4;
  mach_msg_header_t *msg;
  int msgh_id;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  NSObject *v14;
  uint64_t v15;
  int v16;
  unsigned int *v17;
  unsigned int v18;
  unsigned int v19;
  mach_port_name_t v20;
  __int16 v21;
  unsigned int *v22;
  unsigned int *v23;
  unsigned int *v24;
  unsigned int v25;
  int *v26;
  int v27;
  __objc2_class **v28;
  uint64_t v29;
  __objc2_class **v30;
  __objc2_class **v31;
  unsigned int *v32;
  unsigned int v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t audit_token;
  NSObject *label;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  const char *v42;
  char *v43;
  int v44;
  int v45;
  NSObject *v46;
  _QWORD v47[2];
  uint64_t v48;
  uint64_t v49;
  uint8_t buf[32];
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C874D8];
  v4 = a2 - 2;
  switch(a2)
  {
    case 2:
    case 8:
    case 11:
    case 15:
      if (*(_QWORD *)(a1 + 176))
        _xpc_connection_update_event_handler(a1);
      break;
    case 3:
    case 4:
      goto LABEL_26;
    case 5:
LABEL_25:
      a4 = 268435459;
LABEL_26:
      _xpc_connection_handle_sent_event(a1, object, a4, 0);
      return;
    case 7:
LABEL_27:
      _xpc_connection_handle_disconnect_event(a1, (uint64_t)object, 7);
      return;
    case 9:
LABEL_114:
      _xpc_connection_mach_event_cold_6();
    default:
      return;
  }
  switch(v4)
  {
    case 0:
      msg = (mach_msg_header_t *)dispatch_mach_msg_get_msg();
      msgh_id = msg->msgh_id;
      if (msgh_id <= 805306367)
      {
        if (msgh_id != 0x10000000)
        {
          if (msgh_id == 0x20000000)
            goto LABEL_74;
LABEL_60:
          _xpc_connection_pass2mig(a1, (uint64_t)object);
          goto LABEL_75;
        }
LABEL_61:
        *(_QWORD *)buf = 0;
        v29 = dispatch_mach_msg_get_msg();
        if ((*(_WORD *)(a1 + 224) & 8) != 0)
        {
          syslog(3, "Normal message received by listener connection. Ignoring.");
        }
        else if (!*(_QWORD *)(a1 + 96))
        {
          v30 = _xpc_connection_unpack_message(a1, object);
          if (v30)
          {
            v31 = v30;
            _xpc_connection_call_event_handler(a1, (uint64_t)v30);
            xpc_release(v31);
          }
          goto LABEL_75;
        }
        msg = (mach_msg_header_t *)v29;
        goto LABEL_74;
      }
      if (msgh_id == 805306368 || msgh_id == 0x40000000)
        goto LABEL_61;
      if (msgh_id != 1999646836)
        goto LABEL_60;
      v47[1] = 0;
      v10 = dispatch_mach_msg_get_msg();
      v11 = v10;
      if (!*(_QWORD *)(a1 + 96))
      {
        v47[0] = 0;
        if ((*(_WORD *)(a1 + 224) & 8) != 0
          && *(_DWORD *)(v10 + 4) == 52
          && (*(_DWORD *)v10 & 0x80000000) != 0
          && *(_DWORD *)(v10 + 24) == 2
          && *(unsigned __int16 *)(v10 + 38) << 16 == 0x100000
          && *(unsigned __int16 *)(v10 + 50) << 16 == 1114112)
        {
          v12 = _xpc_connection_check_peer_requirement(a1, v10);
          if (v12)
          {
            v13 = v12;
            if (_os_trace_lazy_init_completed_4libxpc() && (*(_WORD *)(a1 + 224) & 0x4000) == 0)
            {
              if (_xpc_connection_log_handle__once != -1)
                dispatch_once(&_xpc_connection_log_handle__once, &__block_literal_global_111);
              v14 = _xpc_connection_log_handle__log;
              if (os_log_type_enabled((os_log_t)_xpc_connection_log_handle__log, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134218240;
                *(_QWORD *)&buf[4] = a1;
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = v13;
                _os_log_impl(&dword_1DEE85000, v14, OS_LOG_TYPE_DEFAULT, "[%p] Dropping check-in message due to code signing requirement: %d", buf, 0x12u);
              }
            }
          }
          else
          {
            v47[0] = 0;
            if (*(_DWORD *)(a1 + 24))
              goto LABEL_87;
            if (*(_DWORD *)(a1 + 192))
              goto LABEL_87;
            v44 = MEMORY[0x1DF0F0E9C](*MEMORY[0x1E0C883F0], *(unsigned int *)(v11 + 28), *(unsigned int *)(a1 + 68), v47);
            if (!v44)
              goto LABEL_87;
            v45 = v44;
            if (v44 == 20)
              goto LABEL_87;
            if (_os_trace_lazy_init_completed_4libxpc() && (*(_WORD *)(a1 + 224) & 0x4000) == 0)
            {
              if (_xpc_connection_log_handle__once != -1)
                dispatch_once(&_xpc_connection_log_handle__once, &__block_literal_global_111);
              v46 = _xpc_connection_log_handle__log;
              if (os_log_type_enabled((os_log_t)_xpc_connection_log_handle__log, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134218496;
                *(_QWORD *)&buf[4] = a1;
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = v45;
                *(_WORD *)&buf[18] = 2048;
                *(_QWORD *)&buf[20] = v47[0];
                _os_log_impl(&dword_1DEE85000, v46, OS_LOG_TYPE_DEFAULT, "[%p] Failed to verify check-in connection port was derived from the listener connection port (kr=%d, sandbox_message_filter_id=#%llx)", buf, 0x1Cu);
              }
            }
            if (v45 == 20)
            {
LABEL_87:
              v36 = v47[0];
              audit_token = _xpc_mach_msg_get_audit_token(v11);
              label = *(NSObject **)(a1 + 152);
              if (label)
                label = dispatch_queue_get_label(label);
              v55 = 0u;
              v56 = 0u;
              v53 = 0u;
              v54 = 0u;
              v51 = 0u;
              v52 = 0u;
              memset(buf, 0, sizeof(buf));
              snprintf((char *)buf, 0x80uLL, "%s.peer[%d]", (const char *)label, *(_DWORD *)(audit_token + 20));
              v39 = _xpc_connection_create(2, (char *)buf);
              *(_DWORD *)(v39 + 68) = *(_DWORD *)(v11 + 28);
              *(_DWORD *)(v39 + 76) = *(_DWORD *)(v11 + 40);
              *(_QWORD *)(v39 + 136) = _xpc_retain(a1);
              *(_WORD *)(v39 + 224) = *(_WORD *)(v39 + 224) & 0xD7FF | 0x800;
              *(_QWORD *)(v39 + 184) = v36;
              v40 = *(_QWORD *)(a1 + 144);
              *(_DWORD *)(v39 + 192) = *(_DWORD *)(a1 + 192);
              *(_QWORD *)(v39 + 48) = v40;
              if (v40)
                *(_QWORD *)(v40 + 56) = v39 + 48;
              *(_QWORD *)(a1 + 144) = v39;
              *(_QWORD *)(v39 + 56) = a1 + 144;
              _xpc_connection_set_creds(v39, v11);
              xpc_connection_suspend((xpc_connection_t)v39);
              _xpc_transaction_begin();
              _xpc_connection_call_event_handler(a1, v39);
              if (*(_QWORD *)(v39 + 96))
              {
                v41 = atomic_load((unint64_t *)(v39 + 96));
                if (v41 && (v42 = *(const char **)(v41 + 8)) != 0)
                  v43 = _xpc_strdup(v42);
                else
                  v43 = 0;
                *(_QWORD *)buf = 0;
                *(_QWORD *)&buf[8] = 0;
                v48 = 0;
                v49 = 0;
                if ((_dyld_get_image_uuid() & 1) == 0)
                {
                  *(_QWORD *)buf = 0;
                  *(_QWORD *)&buf[8] = 0;
                }
                if ((_dyld_get_shared_cache_uuid() & 1) != 0)
                {
                  _dyld_get_shared_cache_range();
                }
                else
                {
                  v48 = 0;
                  v49 = 0;
                }
                _os_log_simple();
                free(v43);
                xpc_connection_set_event_handler((xpc_connection_t)v39, &__block_literal_global_119);
                xpc_connection_resume((xpc_connection_t)v39);
                xpc_connection_activate((xpc_connection_t)v39);
              }
              else
              {
                xpc_connection_resume((xpc_connection_t)v39);
              }
              goto LABEL_75;
            }
          }
        }
        syslog(3, "Bogus check-in attempt. Ignoring.");
      }
      msg = (mach_msg_header_t *)v11;
LABEL_74:
      mach_msg_destroy(msg);
LABEL_75:
      if ((*(_WORD *)(a1 + 224) & 0x800) != 0)
      {
        *(_WORD *)(a1 + 224) &= ~0x800u;
        _xpc_transaction_end();
      }
      return;
    case 1:
    case 2:
      goto LABEL_26;
    case 3:
      goto LABEL_25;
    case 5:
      goto LABEL_27;
    case 6:
      v17 = (unsigned int *)(a1 + 64);
      v16 = *(_DWORD *)(a1 + 64);
      if (v16 == 7)
        _xpc_connection_mach_event_cold_5();
      if (!v16)
        _xpc_connection_mach_event_cold_4();
      v18 = *(_DWORD *)(a1 + 68);
      if (v18 + 1 >= 2)
        _xpc_connection_mach_event_cold_2(v18);
      v19 = *(_DWORD *)(a1 + 76);
      if (v19 + 1 >= 2)
        _xpc_connection_mach_event_cold_3(v19);
      v20 = *(_DWORD *)(a1 + 72);
      if (v20 + 1 >= 2 && _xpc_mach_port_release(v20))
        _os_assumes_log();
      *(_DWORD *)(a1 + 72) = 0;
      v21 = *(_WORD *)(a1 + 224);
      if ((v21 & 8) != 0)
      {
        v22 = *(unsigned int **)(a1 + 144);
        if (v22)
        {
          do
          {
            v23 = v22;
            v22 = (unsigned int *)*((_QWORD *)v22 + 6);
            xpc_retain(v23);
            v24 = v23 + 4;
            do
              v25 = __ldxr(v24);
            while (__stxr(v25 | 0x400, v24));
            if ((v25 & 0x400) == 0)
            {
              xpc_retain(v23);
              _xpc_connection_remove_peer_impl(a1, v23);
            }
            xpc_connection_cancel((xpc_connection_t)v23);
            xpc_release(v23);
          }
          while (v22);
          v21 = *(_WORD *)(a1 + 224);
        }
      }
      if ((v21 & 0x800) != 0)
      {
        *(_WORD *)(a1 + 224) = v21 & 0xF7FF;
        _xpc_transaction_end();
      }
      do
        __ldxr(v17);
      while (__stxr(7u, v17));
      v26 = *(int **)(a1 + 96);
      if (v26)
      {
        v27 = *v26;
        if (v27 == 2)
          goto LABEL_67;
        if (v27 == 4)
          v28 = &_xpc_error_connection_interrupted;
        else
          v28 = &_xpc_error_connection_invalid;
      }
      else
      {
        v28 = &_xpc_error_connection_invalid;
      }
      _xpc_connection_call_event_handler(a1, (uint64_t)v28);
LABEL_67:
      if (*(_DWORD *)(a1 + 24) == 2)
      {
        v32 = (unsigned int *)(a1 + 16);
        do
          v33 = __ldxr(v32);
        while (__stxr(v33 | 0x400, v32));
        if ((v33 & 0x400) != 0)
        {
          xpc_release((xpc_object_t)a1);
        }
        else
        {
          v34 = *(_QWORD *)(a1 + 136);
          v35 = _xpc_alloc(0x18uLL);
          *v35 = v34;
          v35[1] = a1;
          v35[2] = 0;
          dispatch_mach_receive_barrier_f();
        }
        if ((*(_WORD *)(a1 + 224) & 0x1000) != 0)
        {
          *(_WORD *)(a1 + 224) &= ~0x1000u;
          xpc_release((xpc_object_t)a1);
        }
      }
      if ((*(_BYTE *)(a1 + 40) & 1) != 0)
      {
        _Block_release(*(const void **)(a1 + 32));
        *(_BYTE *)(a1 + 40) = 0;
      }
      *(_QWORD *)(a1 + 32) = 0;
      _xpc_release(a1);
      return;
    case 7:
      goto LABEL_114;
    case 9:
      if ((*(_WORD *)(a1 + 224) & 0x2000) == 0)
        _xpc_mach_message_request_handoff_reply_cold_1();
      if (!*(_QWORD *)(a1 + 96) && *(_DWORD *)(a1 + 24) == 2)
      {
        v15 = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 16) == -1
            ? *(_QWORD *)(MEMORY[0x1E0C87FA0] + 24)
            : _os_alloc_once();
        if (*(_BYTE *)(v15 + 168))
          _xpc_connection_call_event_handler(a1, (uint64_t)&_xpc_error_termination_imminent);
      }
      return;
    default:
      return;
  }
}

void _xpc_connection_update_event_handler(uint64_t a1)
{
  unint64_t *v2;
  unint64_t v3;

  v2 = (unint64_t *)(a1 + 176);
  do
    v3 = __ldxr(v2);
  while (__stxr(0, v2));
  if (v3)
  {
    if ((*(_BYTE *)(a1 + 40) & 1) != 0)
      _Block_release(*(const void **)(a1 + 32));
    *(_QWORD *)(a1 + 32) = v3;
    *(_BYTE *)(a1 + 40) = 1;
  }
}

void _xpc_connection_handle_sent_event(mach_port_context_t a1, dispatch_object_t object, int a3, int a4)
{
  void *context;
  uint64_t msg;
  uint64_t v10;
  int v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint8_t buf[4];
  mach_port_context_t v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C874D8];
  context = dispatch_get_context(object);
  msg = dispatch_mach_msg_get_msg();
  if (context)
  {
    _xpc_connection_release_message((xpc_object_t)a1, (uint64_t)object, (uint64_t)context, a3);
  }
  else
  {
    v10 = msg;
    v11 = *(_DWORD *)(msg + 20);
    if (v11 != 1999646836 || a4 != 0)
      _xpc_connection_handle_sent_event_cold_1(v11);
    if (a3)
    {
      if (_xpc_mach_port_cleanup_right(*(_DWORD *)(v10 + 8), *(_DWORD *)v10 & 0x1F))
        _os_assumes_log();
      if (_xpc_mach_port_cleanup_right(*(_DWORD *)(v10 + 40), *(unsigned __int8 *)(v10 + 50)))
        _os_assumes_log();
      if (*(unsigned __int8 *)(v10 + 38) << 16 != 0x100000)
        _xpc_mach_message_request_handoff_reply_cold_1();
      if (_xpc_mach_port_close_recv(*(_DWORD *)(v10 + 28), 0, a1))
        _os_assumes_log();
      if (_xpc_connection_cancel(a1, 3, "failed to check-in, peer may have been unloaded: mach_error=%x", v13, v14, v15, v16, v17, a3)&& _os_trace_lazy_init_completed_4libxpc()&& (*(_WORD *)(a1 + 224) & 0x4000) == 0)
      {
        if (_xpc_connection_log_handle__once != -1)
          dispatch_once(&_xpc_connection_log_handle__once, &__block_literal_global_111);
        v18 = _xpc_connection_log_handle__log;
        if (os_log_type_enabled((os_log_t)_xpc_connection_log_handle__log, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          v20 = a1;
          v21 = 1024;
          v22 = a3;
          _os_log_impl(&dword_1DEE85000, v18, OS_LOG_TYPE_DEFAULT, "[%p] invalidated after a failed send of the check-in message: mach_error=%{mach.errno}x", buf, 0x12u);
        }
      }
    }
    else
    {
      *(_DWORD *)(a1 + 64) = 6;
    }
  }
}

uint64_t _xpc_connection_remove_peer_impl(uint64_t a1, _QWORD *object)
{
  uint64_t v3;

  v3 = object[6];
  if (v3)
    *(_QWORD *)(v3 + 56) = object[7];
  *(_QWORD *)object[7] = v3;
  object[6] = -1;
  object[7] = -1;
  object[17] = 0;
  xpc_release(object);
  return _xpc_release(a1);
}

void _xpc_connection_remove_peer(uint64_t a1)
{
  _xpc_connection_remove_peer_impl(*(_QWORD *)a1, *(_QWORD **)(a1 + 8));
  free((void *)a1);
}

uint64_t _xpc_connection_set_event_handler2(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 176))
    _xpc_connection_update_event_handler(a1);
  return _xpc_release(a1);
}

BOOL _xpc_data_equal(size_t a1, size_t a2)
{
  if (*(_QWORD *)(a1 + 40) != *(_QWORD *)(a2 + 40))
    return 0;
  _xpc_data_map(a1);
  _xpc_data_map(a2);
  return memcmp(*(const void **)(a1 + 32), *(const void **)(a2 + 32), *(_QWORD *)(a1 + 40)) == 0;
}

uint64_t _xpc_data_hash()
{
  dispatch_data_apply_f();
  return 0;
}

uint64_t _xpc_data_desc(size_t a1, uint64_t a2)
{
  _xpc_data_map(a1);
  _xpc_data_print_bytes_string(a1, a2, 0x20uLL);
  return _xpc_serializer_append(a2, &unk_1DEEBE00B, 1uLL, 0);
}

uint64_t _xpc_data_debug_desc(_QWORD *a1, uint64_t a2)
{
  unsigned int v4;
  size_t v5;
  char __str[16];
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
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C874D8];
  _xpc_data_map((size_t)a1);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  *(_OWORD *)__str = 0u;
  v8 = 0u;
  v4 = snprintf(__str, 0x100uLL, "<%s: %p>: { length = %lu bytes, contents = ", "data", a1, a1[5]);
  if (v4 >= 0xFF)
    v5 = 255;
  else
    v5 = v4;
  _xpc_serializer_append(a2, __str, v5, 0);
  _xpc_data_print_bytes_string((uint64_t)a1, a2, 0x18uLL);
  return _xpc_serializer_append(a2, " }", 3uLL, 0);
}

uint64_t _xpc_data_debug(uint64_t a1, char *__str, size_t __size)
{
  uint64_t result;

  if (*(_BYTE *)(a1 + 48))
  {
    if (__size >= 2)
    {
      LODWORD(result) = snprintf(__str, __size, ", buff = %p, len = %lu");
      goto LABEL_6;
    }
    return 0;
  }
  if (__size < 2)
    return 0;
  LODWORD(result) = snprintf(__str, __size, ", buff = (unmapped), len = %lu");
LABEL_6:
  if ((int)result >= __size)
    return __size - 1;
  else
    return (int)result;
}

uint64_t _xpc_data_serialize(uint64_t a1, uint64_t a2)
{
  int memory_entry;
  int v5;
  uint64_t result;
  uint64_t v7;
  int v8;
  int __src;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;

  __src = 0x8000;
  _xpc_serializer_append(a2, &__src, 4uLL, 1);
  v8 = *(_QWORD *)(a1 + 40);
  _xpc_serializer_append(a2, &v8, 4uLL, 1);
  if ((*(_BYTE *)(a2 + 156) & 0x40) != 0)
  {
    v7 = *(_QWORD *)(a2 + 104);
    if (v7)
    {
      result = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 16))(v7, a1);
      if ((result & 1) != 0)
        return result;
    }
LABEL_9:
    v13 = 0;
    v10 = a1;
    v11 = a2;
    v12 = &v13;
    return dispatch_data_apply_f();
  }
  if (*(_QWORD *)(a1 + 40) <= 0x4000uLL)
    goto LABEL_9;
  memory_entry = dispatch_data_make_memory_entry();
  if (memory_entry)
    v5 = memory_entry;
  else
    v5 = -1;
  return _xpc_serializer_append_port((_QWORD *)a2, 0, 0, a1, v5, 17);
}

_DWORD *_xpc_data_deserialize(uint64_t *a1)
{
  int transport;
  _DWORD *v3;
  mach_vm_size_t v4;
  const void *v5;
  NSObject *v6;
  _DWORD *v7;
  const void *v9;
  mach_vm_size_t v10;

  v9 = 0;
  v10 = 0;
  transport = _xpc_graph_deserializer_get_transport(a1);
  v3 = 0;
  if (_xpc_data_get_wire_value(a1, (uint64_t *)&v9, &v10))
  {
    v5 = v9;
    v4 = v10;
    if (transport == 1 && v10 > 0x4000)
    {
      v6 = dispatch_data_create(v9, v10, 0, (dispatch_block_t)*MEMORY[0x1E0C86EA8]);
      v3 = xpc_data_create_with_dispatch_data(v6);
      dispatch_release(v6);
      if (v3)
      {
        v3[4] |= 1u;
        *((_QWORD *)v3 + 4) = v5;
        *((_QWORD *)v3 + 5) = v4;
        *((_BYTE *)v3 + 48) = 1;
      }
    }
    else
    {
      v7 = xpc_data_create(v9, v10);
      v3 = v7;
      if (v7)
        v7[4] |= 1u;
    }
  }
  return v3;
}

void _xpc_data_dispose(uint64_t a1)
{
  dispatch_release(*(dispatch_object_t *)(a1 + 24));
}

uint64_t _xpc_data_set_value(uint64_t a1, const void *a2, size_t a3)
{
  uint64_t result;
  int v7;

  dispatch_release(*(dispatch_object_t *)(a1 + 24));
  result = dispatch_data_create_alloc();
  if (result)
  {
    *(_QWORD *)(a1 + 24) = result;
    result = (uint64_t)memcpy(0, a2, a3);
    if (a3 > 0x4000)
    {
      *(_DWORD *)(a1 + 16) |= 2u;
      v7 = 4;
    }
    else
    {
      v7 = ((a3 + 3) & 0xFFFFFFFC) + 4;
    }
    *(_DWORD *)(a1 + 20) = v7;
  }
  else
  {
    *(_QWORD *)(a1 + 24) = MEMORY[0x1E0C86EB0];
  }
  return result;
}

uint64_t _xpc_data_get_wire_value(uint64_t *a1, uint64_t *a2, mach_vm_size_t *a3)
{
  uint64_t result;
  unsigned int *v7;
  int transport;
  mach_vm_size_t v9;
  int v10;
  int v11;
  BOOL v12;
  mem_entry_name_port_t object;
  uint64_t v14;

  result = _xpc_graph_deserializer_read((uint64_t)a1, 4uLL);
  v14 = result;
  if (result)
  {
    v7 = (unsigned int *)result;
    transport = _xpc_graph_deserializer_get_transport(a1);
    v9 = *v7;
    if (transport == 1 && v9 > 0x4000)
    {
      object = 0;
      if ((_xpc_graph_deserializer_read_port(a1, 17, (int *)&object) & 1) == 0)
        return 0;
      v10 = _xpc_vm_map_memory_entry(object, v9, (mach_vm_address_t *)&v14, 0);
      v11 = v10;
      if (v10)
        v12 = v10 == 29;
      else
        v12 = 1;
      if (!v12)
        _os_assumes_log();
      if (_xpc_mach_port_release(object))
        _os_assumes_log();
      if (v11)
        return 0;
    }
    else
    {
      result = _xpc_graph_deserializer_read((uint64_t)a1, v9);
      v14 = result;
      if (!result)
        return result;
    }
    *a2 = v14;
    *a3 = v9;
    return 1;
  }
  return result;
}

uint64_t xpc_data_get_inline_max()
{
  return 0;
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  NSObject *alloc;
  NSObject *v5;
  _BYTE *v6;

  if (length)
  {
    alloc = dispatch_data_create_alloc();
    if (alloc)
    {
      v5 = alloc;
      v6 = xpc_data_create_with_dispatch_data(alloc);
      memcpy(0, bytes, length);
      dispatch_release(v5);
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v6 = xpc_data_create_with_dispatch_data(MEMORY[0x1E0C86EB0]);
    v6[48] = 1;
  }
  return v6;
}

xpc_object_t xpc_data_create_with_dispatch_data(dispatch_data_t ddata)
{
  uint64_t v2;
  size_t size;
  int v4;

  v2 = _xpc_base_create();
  size = dispatch_data_get_size(ddata);
  if (size > 0x4000)
  {
    *(_DWORD *)(v2 + 16) |= 2u;
    v4 = 4;
  }
  else
  {
    v4 = ((size + 3) & 0xFFFFFFFC) + 4;
  }
  *(_DWORD *)(v2 + 20) = v4;
  *(_QWORD *)(v2 + 40) = size;
  *(_QWORD *)(v2 + 24) = ddata;
  dispatch_retain(ddata);
  return (xpc_object_t)v2;
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  if (xpc_get_type(xdata) == (xpc_type_t)OS_xpc_data)
    return *((_QWORD *)xdata + 5);
  else
    return 0;
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  if (xpc_get_type(xdata) != (xpc_type_t)OS_xpc_data)
    return 0;
  _xpc_data_map((size_t)xdata);
  return (const void *)*((_QWORD *)xdata + 4);
}

size_t _xpc_data_map(size_t result)
{
  size_t v1;
  uint64_t flattened_bytes_4libxpc;
  NSObject *v3;

  if (!*(_BYTE *)(result + 48))
  {
    v1 = result;
    flattened_bytes_4libxpc = dispatch_data_get_flattened_bytes_4libxpc();
    v3 = *(NSObject **)(v1 + 24);
    if (!flattened_bytes_4libxpc)
    {
      if (dispatch_data_get_size(*(dispatch_data_t *)(v1 + 24)))
        _xpc_rich_error_serialize_cold_1();
    }
    result = dispatch_data_get_size(v3);
    *(_QWORD *)(v1 + 32) = flattened_bytes_4libxpc;
    *(_QWORD *)(v1 + 40) = result;
    *(_BYTE *)(v1 + 48) = 1;
  }
  return result;
}

size_t xpc_data_get_bytes(xpc_object_t xdata, void *buffer, size_t off, size_t length)
{
  size_t v8;
  BOOL v9;
  size_t v10;

  if (xpc_get_type(xdata) != (xpc_type_t)OS_xpc_data)
    return 0;
  _xpc_data_map((size_t)xdata);
  v8 = *((_QWORD *)xdata + 5);
  v9 = v8 >= off;
  v10 = v8 - off;
  if (!v9)
    return 0;
  if (v10 < length)
    length = v10;
  memcpy(buffer, (const void *)(*((_QWORD *)xdata + 4) + off), length);
  return length;
}

BOOL xpc_data_get_bytes_ptr_and_length(_QWORD *a1, _QWORD *a2, _QWORD *a3)
{
  __objc2_class *type;
  uint64_t v7;

  *a2 = 0;
  *a3 = 0;
  type = (__objc2_class *)xpc_get_type(a1);
  if (type == OS_xpc_data)
  {
    _xpc_data_map((size_t)a1);
    v7 = a1[5];
    *a2 = a1[4];
    *a3 = v7;
  }
  return type == OS_xpc_data;
}

uint64_t _xpc_data_hash_apply(_QWORD **a1, uint64_t a2, uint64_t a3, _BYTE *a4, uint64_t a5)
{
  _QWORD *v5;

  v5 = *a1;
  *v5 += _xpc_hash(a4, a5);
  return 1;
}

uint64_t _xpc_data_print_bytes_string(uint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v4;
  char *v5;
  unsigned __int8 *v8;
  size_t v9;
  size_t v10;
  size_t v11;
  _OWORD __src[6];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C874D8];
  memset(__src, 0, sizeof(__src));
  if (*(_QWORD *)(a1 + 40) >= a3)
    v4 = a3;
  else
    v4 = *(_QWORD *)(a1 + 40);
  strcpy((char *)__src, "0x");
  v5 = (char *)__src + 2;
  if (v4)
  {
    v8 = *(unsigned __int8 **)(a1 + 32);
    v9 = 94;
    do
    {
      if (v9 < 2)
      {
        v10 = 0;
      }
      else
      {
        v10 = snprintf(v5, v9, "%2.2x", *v8);
        if (v9 <= v10)
          v10 = v9 - 1;
      }
      v5 += v10;
      v9 -= v10;
      ++v8;
      --v4;
    }
    while (v4);
    if (*(_QWORD *)(a1 + 40) > a3)
    {
      if (v9 < 2)
      {
        v11 = 0;
      }
      else
      {
        v11 = snprintf(v5, v9, "...");
        if (v9 <= v11)
          v11 = v9 - 1;
      }
      v5 += v11;
    }
  }
  return _xpc_serializer_append(a2, __src, v5 - (char *)__src, 0);
}

uint64_t _xpc_data_serialize_inline_apply(uint64_t *a1, int a2, int a3, void *__src, size_t __n)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  size_t v9;
  size_t v10;
  size_t v11;
  size_t v12;

  v7 = *a1;
  v6 = a1[1];
  v8 = (_QWORD *)a1[2];
  _xpc_serializer_append(v6, __src, __n, 0);
  v9 = *v8 + __n;
  *v8 = v9;
  if (v9 == *(_QWORD *)(v7 + 40))
  {
    v10 = ((v9 + 3) & 0xFFFFFFFFFFFFFFFCLL) - v9;
    v11 = *(_QWORD *)(v6 + 48) + v10;
    v12 = *(_QWORD *)(v6 + 56) - v10;
    *(_QWORD *)(v6 + 48) = v11;
    *(_QWORD *)(v6 + 56) = v12;
  }
  return 1;
}

BOOL _xpc_date_equal(uint64_t a1, uint64_t a2)
{
  int v3;
  double value_absolute;

  v3 = *(_DWORD *)(a2 + 16);
  if ((*(_BYTE *)(a1 + 18) & 1) == 0)
  {
    if ((v3 & 0x10000) == 0)
      return *(_QWORD *)(a1 + 24) == *(_QWORD *)(a2 + 24);
    goto LABEL_5;
  }
  if ((v3 & 0x10000) == 0)
  {
LABEL_5:
    value_absolute = xpc_date_get_value_absolute(a1);
    return value_absolute == xpc_date_get_value_absolute(a2);
  }
  return *(double *)(a1 + 24) == *(double *)(a2 + 24);
}

uint64_t _xpc_date_hash(uint64_t a1)
{
  return _xpc_hash((_BYTE *)(a1 + 24), 8);
}

uint64_t _xpc_date_desc(uint64_t a1, uint64_t a2)
{
  size_t v3;
  tm v5;
  time_t v6;
  char __src[8];
  uint64_t v8;
  _WORD v9[7];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C874D8];
  memset(&v5, 0, sizeof(v5));
  if ((*(_BYTE *)(a1 + 18) & 1) != 0)
  {
    v6 = (uint64_t)(*(double *)(a1 + 24) + 978307200.0);
    gmtime_r(&v6, &v5);
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 24) / 0x3B9ACA00uLL;
    localtime_r(&v6, &v5);
  }
  *(_QWORD *)__src = 0;
  v8 = 0;
  memset(v9, 0, sizeof(v9));
  v3 = strftime(__src, 0x1EuLL, "%a %b %d %T %Y %Z", &v5);
  return _xpc_serializer_append(a2, __src, v3 + 1, 0);
}

uint64_t _xpc_date_debug_desc(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  int v5;
  tm v7;
  time_t v8;
  char __str[16];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  char v17[8];
  uint64_t v18;
  _WORD v19[7];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C874D8];
  memset(&v7, 0, sizeof(v7));
  if ((*(_BYTE *)(a1 + 18) & 1) != 0)
  {
    v8 = (uint64_t)(*(double *)(a1 + 24) + 978307200.0);
    gmtime_r(&v8, &v7);
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 24) / 0x3B9ACA00uLL;
    localtime_r(&v8, &v7);
  }
  *(_QWORD *)v17 = 0;
  v18 = 0;
  memset(v19, 0, sizeof(v19));
  strftime(v17, 0x1EuLL, "%a %b %d %T %Y %Z", &v7);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  *(_OWORD *)__str = 0u;
  v10 = 0u;
  v4 = snprintf(__str, 0x80uLL, "<%s: %p> %s (approx)", "date", (const void *)a1, v17);
  if (v4 >= 0x7F)
    v5 = 127;
  else
    v5 = v4;
  return _xpc_serializer_append(a2, __str, (v5 + 1), 0);
}

uint64_t _xpc_date_debug(uint64_t a1, char *__str, size_t __size)
{
  return snprintf(__str, __size, ", interval = %lli", *(_QWORD *)(a1 + 24));
}

uint64_t _xpc_date_serialize(uint64_t a1, uint64_t a2)
{
  uint64_t v5;
  int __src;

  __src = 28672;
  _xpc_serializer_append(a2, &__src, 4uLL, 1);
  v5 = *(_QWORD *)(a1 + 24);
  return _xpc_serializer_append(a2, &v5, 8uLL, 1);
}

uint64_t _xpc_date_deserialize(uint64_t a1)
{
  uint64_t result;
  uint64_t v2;

  result = _xpc_graph_deserializer_read(a1, 8uLL);
  if (result)
  {
    v2 = *(_QWORD *)result;
    result = _xpc_base_create();
    *(_QWORD *)(result + 24) = v2;
    *(_DWORD *)(result + 16) |= 1u;
    *(_DWORD *)(result + 20) = 8;
  }
  return result;
}

uint64_t _xpc_date_wire_length()
{
  return 8;
}

BOOL _xpc_date_get_wire_value(uint64_t a1, _QWORD *a2)
{
  _QWORD *v3;

  v3 = (_QWORD *)_xpc_graph_deserializer_read(a1, 8uLL);
  if (v3)
    *a2 = *v3;
  return v3 != 0;
}

xpc_object_t xpc_date_create(int64_t interval)
{
  xpc_object_t result;

  result = (xpc_object_t)_xpc_base_create();
  *((_DWORD *)result + 5) = 8;
  *((_QWORD *)result + 3) = interval;
  return result;
}

uint64_t xpc_date_create_absolute(double a1)
{
  uint64_t result;

  result = _xpc_base_create();
  *(_DWORD *)(result + 16) |= 0x10000u;
  *(_DWORD *)(result + 20) = 8;
  *(double *)(result + 24) = a1;
  return result;
}

xpc_object_t xpc_date_create_from_current(void)
{
  int64_t v0;
  int64_t v1;
  xpc_object_t result;

  v0 = clock_gettime_nsec_np(_CLOCK_REALTIME);
  if (v0 <= 0)
    xpc_date_create_from_current_cold_1();
  v1 = v0;
  result = (xpc_object_t)_xpc_base_create();
  *((_DWORD *)result + 5) = 8;
  *((_QWORD *)result + 3) = v1;
  return result;
}

int64_t xpc_date_get_value(xpc_object_t xdate)
{
  double v3;

  if (xpc_get_type(xdate) != (xpc_type_t)OS_xpc_date)
    return 0;
  if ((*((_BYTE *)xdate + 18) & 1) == 0)
    return *((_QWORD *)xdate + 3);
  v3 = (*((double *)xdate + 3) + 978307200.0) * 1000000000.0;
  if (v3 > 9.22337204e18 || v3 < -9.22337204e18)
    return 0;
  else
    return (uint64_t)v3;
}

BOOL xpc_date_is_int64_range(uint64_t a1)
{
  double v3;

  if (xpc_get_type((xpc_object_t)a1) != (xpc_type_t)OS_xpc_date || (*(_BYTE *)(a1 + 18) & 1) == 0)
    return 0;
  v3 = (*(double *)(a1 + 24) + 978307200.0) * 1000000000.0;
  return v3 <= 9.22337204e18 && v3 >= -9.22337204e18;
}

double xpc_date_get_value_absolute(uint64_t a1)
{
  __objc2_class *type;
  double result;

  type = (__objc2_class *)xpc_get_type((xpc_object_t)a1);
  result = 0.0;
  if (type == OS_xpc_date)
  {
    if ((*(_BYTE *)(a1 + 18) & 1) != 0)
      return *(double *)(a1 + 24);
    else
      return (double)*(uint64_t *)(a1 + 24) / 1000000000.0 + -978307200.0;
  }
  return result;
}

uint64_t xpc_get_attachment_endpoint()
{
  uint64_t v0;

  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 16) == -1)
    v0 = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 24);
  else
    v0 = _os_alloc_once();
  return *(_QWORD *)(v0 + 32);
}

xpc_object_t xpc_copy_domain()
{
  xpc_object_t v0;
  pid_t v1;

  v0 = xpc_dictionary_create(0, 0, 0);
  v1 = getpid();
  xpc_dictionary_set_int64(v0, "pid", v1);
  return v0;
}

xpc_object_t xpc_copy_entitlements_for_pid(uint64_t a1)
{
  return _xpc_copy_entitlements_data(a1, 0, 7);
}

xpc_object_t xpc_copy_entitlements_data_for_token(uint64_t a1)
{
  return _xpc_copy_entitlements_data(*(unsigned int *)(a1 + 20), a1, 7);
}

char *xpc_copy_code_signing_identity_for_token(uint64_t a1)
{
  return _xpc_copy_cs_identity(*(unsigned int *)(a1 + 20), a1);
}

uint64_t xpc_copy_bootstrap()
{
  xpc_object_t v0;
  pid_t v1;
  _DWORD *value;
  _OWORD *data;
  uint64_t bootstrap_copy;
  size_t v6;
  xpc_object_t xdict;

  v0 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v0, "type", 5uLL);
  v1 = getpid();
  xpc_dictionary_set_uint64(v0, "handle", v1);
  xpc_dictionary_set_BOOL(v0, "self", 1);
  xdict = 0;
  if (_xpc_service_routine(711, v0, &xdict))
  {
    _os_assumes_log();
    bootstrap_copy = 0;
  }
  else
  {
    value = xpc_dictionary_get_value(xdict, "bootstrap");
    v6 = 0;
    data = xpc_dictionary_get_data(xdict, "creator", &v6);
    if (v6 != 32)
      xpc_copy_bootstrap_cold_1();
    bootstrap_copy = _xpc_dictionary_create_bootstrap_copy(value, data);
    xpc_release(xdict);
  }
  xpc_release(v0);
  return bootstrap_copy;
}

double xpc_generate_audit_token(int a1, uint64_t a2)
{
  double result;

  result = 0.0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_DWORD *)(a2 + 20) = a1;
  *(_DWORD *)(a2 + 28) = 0x7FFFFFFF;
  return result;
}

xpc_object_t xpc_copy_entitlement_for_token(const char *a1, uint64_t a2)
{
  uint64_t v3;
  xpc_object_t v4;
  void *v5;
  xpc_object_t value;
  xpc_object_t v7;

  if (a2)
  {
    v3 = *(unsigned int *)(a2 + 20);
    if (*(_DWORD *)(a2 + 28) == 0x7FFFFFFF)
      a2 = 0;
  }
  else
  {
    v3 = getpid();
    a2 = 0;
  }
  v4 = _xpc_copy_entitlements(v3, a2);
  if (!v4)
    return 0;
  v5 = v4;
  if (a1)
  {
    value = xpc_dictionary_get_value(v4, a1);
    v7 = value;
    if (value)
      xpc_retain(value);
  }
  else
  {
    v7 = xpc_retain(v4);
  }
  xpc_release(v5);
  return v7;
}

xpc_object_t xpc_copy_entitlements_for_self()
{
  uint64_t self_audit_token;
  uint64_t v1;

  self_audit_token = _xpc_get_self_audit_token();
  v1 = getpid();
  return _xpc_copy_entitlements(v1, self_audit_token);
}

xpc_object_t xpc_copy_entitlement_for_self(const char *a1)
{
  uint64_t self_audit_token;
  uint64_t v3;

  self_audit_token = _xpc_get_self_audit_token();
  v3 = getpid();
  if (a1)
    return _xpc_copy_entitlements_with_key(v3, self_audit_token, a1);
  else
    return _xpc_copy_entitlements(v3, self_audit_token);
}

uint64_t xpc_test_symbols_exported()
{
  return 0;
}

uint64_t xpc_install_remote_hooks(_QWORD *a1)
{
  uint64_t result;

  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 16) == -1)
    result = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 24);
  else
    result = _os_alloc_once();
  if (*(_QWORD *)(result + 200))
    _xpc_mach_message_request_handoff_reply_cold_1();
  if (*a1 != 40)
    _xpc_mach_message_request_handoff_reply_cold_1();
  if (!a1[1])
    _xpc_mach_message_request_handoff_reply_cold_1();
  if (!a1[2])
    _xpc_mach_message_request_handoff_reply_cold_1();
  if (!a1[3])
    _xpc_mach_message_request_handoff_reply_cold_1();
  if (!a1[4])
    _xpc_mach_message_request_handoff_reply_cold_1();
  *(_QWORD *)(result + 200) = a1;
  return result;
}

BOOL _xpc_get_service_instance(int a1, unsigned __int8 *a2)
{
  xpc_object_t v4;
  int v5;
  _BOOL8 v6;
  const unsigned __int8 *uuid;
  xpc_object_t xdict;
  _BYTE v10[160];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C874D8];
  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v4, "pid", a1);
  xdict = 0;
  v5 = _xpc_service_routine(720, v4, &xdict);
  xpc_release(v4);
  if (v5)
  {
    if (v5 != 113)
      _xpc_get_service_instance_cold_1(v10, v5);
    return 0;
  }
  else
  {
    uuid = xpc_dictionary_get_uuid(xdict, "instance");
    v6 = uuid != 0;
    if (uuid)
      uuid_copy(a2, uuid);
    xpc_release(xdict);
  }
  return v6;
}

BOOL xpc_get_instance(unsigned __int8 *a1)
{
  pid_t v2;

  v2 = getpid();
  return _xpc_get_service_instance(v2, a1);
}

uint64_t xpc_user_sessions_enabled()
{
  if (xpc_user_sessions_enabled_once != -1)
    dispatch_once(&xpc_user_sessions_enabled_once, &__block_literal_global_2);
  return xpc_user_sessions_enabled_enabled;
}

int64_t __xpc_user_sessions_enabled_block_invoke()
{
  int64_t result;
  BOOL v1;
  char v2;
  uint64_t v3;
  int v4;

  v4 = 0;
  v3 = 0;
  result = _xpc_user_sessions_info_routine((uint64_t)&v3);
  if ((_DWORD)result)
    v1 = 1;
  else
    v1 = v3 == 0;
  v2 = !v1;
  xpc_user_sessions_enabled_enabled = v2;
  return result;
}

int64_t _xpc_user_sessions_info_routine(uint64_t a1)
{
  xpc_object_t empty;
  int64_t v3;
  xpc_object_t xdict;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C874D8];
  empty = xpc_dictionary_create_empty();
  xdict = 0;
  v3 = _xpc_bootstrap_routine(904, empty, &xdict);
  xpc_release(empty);
  if ((_DWORD)v3)
  {
    v8 = 0;
    v9 = 0;
    v6 = 0;
    v7 = 0;
    if ((_dyld_get_image_uuid() & 1) == 0)
    {
      v8 = 0;
      v9 = 0;
    }
    if ((_dyld_get_shared_cache_uuid() & 1) != 0)
    {
      _dyld_get_shared_cache_range();
    }
    else
    {
      v6 = 0;
      v7 = 0;
    }
    xpc_strerror(v3);
    _os_log_simple();
  }
  else
  {
    *(_BYTE *)a1 = xpc_dictionary_get_BOOL(xdict, "enabled");
    *(_DWORD *)(a1 + 4) = xpc_dictionary_get_uint64(xdict, "foreground_uid");
    *(_DWORD *)(a1 + 8) = xpc_dictionary_get_uint64(xdict, "session_uid");
    xpc_release(xdict);
  }
  return v3;
}

uint64_t xpc_user_sessions_get_foreground_uid(int *a1)
{
  int v2;
  uint64_t result;
  char *v4;
  uint64_t v5;
  int v6;

  v6 = 0;
  v5 = 0;
  v2 = _xpc_user_sessions_info_routine((uint64_t)&v5);
  if (v2)
  {
    if (!a1)
      return 4294967195;
    goto LABEL_8;
  }
  if (!(_BYTE)v5)
  {
    v4 = _xpc_asprintf("xpc_user_sessions_get_foreground_uid() must not be called if xpc_user_sessions_enabled() is false");
    _xpc_api_misuse(v4);
  }
  result = HIDWORD(v5);
  if (a1 && HIDWORD(v5) == -101)
  {
    v2 = 112;
LABEL_8:
    *a1 = v2;
    return 4294967195;
  }
  return result;
}

uint64_t xpc_user_sessions_get_session_uid()
{
  if (xpc_user_sessions_get_session_uid_once != -1)
    dispatch_once(&xpc_user_sessions_get_session_uid_once, &__block_literal_global_13);
  return xpc_user_sessions_get_session_uid_session_uid;
}

int64_t __xpc_user_sessions_get_session_uid_block_invoke()
{
  int64_t result;
  int v1;
  char *v2;
  uint64_t v3;
  int v4;

  v4 = 0;
  v3 = 0;
  result = _xpc_user_sessions_info_routine((uint64_t)&v3);
  if ((_DWORD)result)
  {
    v1 = -101;
  }
  else
  {
    if (!(_BYTE)v3)
    {
      v2 = _xpc_asprintf("xpc_user_sessions_get_session_uid() must not be called if xpc_user_sessions_enabled() is false");
      _xpc_api_misuse(v2);
    }
    v1 = v4;
  }
  xpc_user_sessions_get_session_uid_session_uid = v1;
  return result;
}

uint64_t xpc_is_system_session()
{
  uint64_t v0;

  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 16) == -1)
    v0 = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 24);
  else
    v0 = _os_alloc_once();
  return *(unsigned __int8 *)(v0 + 208);
}

void *_xpc_neuter_potential_reentrancy(int a1)
{
  void *result;

  if (a1)
  {
    if (dlopen("/usr/lib/system/libsystem_notify.dylib", 1))
      notify_set_options();
    if (!dlopen("/usr/lib/system/libsystem_info.dylib", 1))
    {
LABEL_8:
      result = dlopen("/usr/lib/system/libsystem_trace.dylib", 1);
      if (!result)
        return result;
      return (void *)os_trace_set_mode();
    }
  }
  else
  {
    notify_set_options();
  }
  si_search_module_set_flags();
  si_search_module_set_flags();
  if (a1)
    goto LABEL_8;
  return (void *)os_trace_set_mode();
}

char *_xpc_copy_cs_identity(uint64_t a1, uint64_t a2)
{
  return _xpc_copy_csops_string(a1, a2, 11);
}

char *_xpc_copy_csops_string(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6;
  char *v7;
  int8x8_t *v8;
  int v9;
  _BYTE v11[4];
  unsigned int size;
  char size_4;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C874D8];
  bzero(v11, 0x408uLL);
  _xpc_get_csops_blob(a1, a2, a3, (int8x8_t *)v11);
  if ((v6 & 0x80000000) == 0)
  {
    if (!v6)
      return _xpc_strndup(&size_4, size - 8);
    return 0;
  }
  if (*__error() != 34)
    return 0;
  v8 = (int8x8_t *)_xpc_alloc(size);
  _xpc_get_csops_blob(a1, a2, a3, v8);
  if (v9)
  {
    if (*__error() != 3 && *__error())
      _os_assumes_log();
    v7 = 0;
  }
  else
  {
    v7 = _xpc_strndup((const char *)&v8[1], v8->u32[1] - 8);
  }
  free(v8);
  return v7;
}

xpc_object_t _xpc_copy_entitlements_data(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6;
  xpc_object_t v7;
  int8x8_t *v8;
  int v9;
  uint64_t v11;
  int v12;
  unsigned int size;
  _QWORD size_4[129];

  size_4[128] = *MEMORY[0x1E0C874D8];
  bzero(&v12, 0x408uLL);
  if ((_DWORD)a3 != 16 && (_DWORD)a3 != 7)
    return 0;
  _xpc_get_csops_blob(a1, a2, a3, (int8x8_t *)&v12);
  if (v6 < 0)
  {
    if (*__error() != 34)
      return 0;
    v8 = (int8x8_t *)_xpc_alloc(size);
    _xpc_get_csops_blob(a1, a2, a3, v8);
    if (v9)
    {
      if (*__error() != 3 && *__error())
        _os_assumes_log();
    }
    else
    {
      v11 = v8->u32[1];
      if ((_DWORD)v11 && v8->i32[0])
      {
        v7 = xpc_data_create(&v8[1], v11 - 8);
LABEL_19:
        free(v8);
        return v7;
      }
    }
    v7 = 0;
    goto LABEL_19;
  }
  if (v6)
    return 0;
  v7 = 0;
  if (size && v12)
    return xpc_data_create(size_4, size - 8);
  return v7;
}

int8x8_t _xpc_get_csops_blob(uint64_t a1, uint64_t a2, uint64_t a3, int8x8_t *a4)
{
  int8x8_t result;

  if (a2)
    csops_audittoken();
  else
    csops();
  result = vrev32_s8(*a4);
  *a4 = result;
  return result;
}

xpc_object_t _xpc_copy_entitlements(uint64_t a1, uint64_t a2)
{
  xpc_object_t result;
  void *v3;
  unsigned __int8 *bytes_ptr;
  size_t length;
  uint64_t v6;

  result = _xpc_copy_entitlements_data(a1, a2, 16);
  if (result)
  {
    v3 = result;
    bytes_ptr = (unsigned __int8 *)xpc_data_get_bytes_ptr(result);
    length = xpc_data_get_length(v3);
    v6 = xpc_create_from_ce_der(bytes_ptr, length);
    xpc_release(v3);
    return (xpc_object_t)v6;
  }
  return result;
}

xpc_object_t _xpc_copy_entitlements_with_key(uint64_t a1, uint64_t a2, const char *a3)
{
  xpc_object_t result;
  void *v5;
  unsigned __int8 *bytes_ptr;
  size_t length;
  uint64_t v8;

  result = _xpc_copy_entitlements_data(a1, a2, 16);
  if (result)
  {
    v5 = result;
    bytes_ptr = (unsigned __int8 *)xpc_data_get_bytes_ptr(result);
    length = xpc_data_get_length(v5);
    v8 = xpc_create_from_ce_der_with_key(bytes_ptr, length, a3);
    xpc_release(v5);
    return (xpc_object_t)v8;
  }
  return result;
}

uint64_t _xpc_proc_bsdinfo(int a1, void *buffer)
{
  if (proc_pidinfo(a1, 13, 1uLL, buffer, 64) == 64)
    return 0;
  else
    return *__error();
}

uint64_t _xpc_vm_map_memory_entry(mem_entry_name_port_t object, mach_vm_size_t size, mach_vm_address_t *a3, int a4)
{
  uint64_t result;
  mach_vm_address_t address;

  address = 0;
  result = mach_vm_map(*MEMORY[0x1E0C883F0], &address, size, 0, 1, object, 0, a4 ^ 1, 67, 67, 2u);
  if (!(_DWORD)result)
    *a3 = address;
  return result;
}

vm_address_t _xpc_allocate_purgable_buffer(uint64_t a1)
{
  vm_address_t address;

  address = 0;
  if (vm_allocate(*MEMORY[0x1E0C883F0], &address, (a1 + *MEMORY[0x1E0C88820] - 1) & -*MEMORY[0x1E0C88820], -268435453))
    _os_assumes_log();
  return address;
}

uint64_t _xpc_deallocate_buffer(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x1DF0F1394](*MEMORY[0x1E0C883F0], a1, a2);
  if ((_DWORD)result)
    _xpc_alloc_cold_1();
  return result;
}

char *xpc_dictionary_copy_basic_description(const void *a1)
{
  unsigned int v2;
  uint64_t v3;
  char __str[16];
  __int128 v6;
  __int128 v7;
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
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C874D8];
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  *(_OWORD *)__str = 0u;
  v6 = 0u;
  v2 = snprintf(__str, 0x100uLL, "<%s: %p>", "dictionary", a1);
  if (v2 >= 0xFF)
    v3 = 255;
  else
    v3 = v2;
  _xpc_dictionary_debug((uint64_t)a1, &__str[v3], 256 - v3);
  return strdup(__str);
}

unint64_t _xpc_dictionary_debug(uint64_t a1, char *__str, size_t __size)
{
  unint64_t v6;
  _QWORD *request;

  v6 = snprintf(__str, __size, ", subtype = %d, count = %u", *(_DWORD *)(a1 + 28) & 3, *(_DWORD *)(a1 + 24));
  if ((*(_DWORD *)(a1 + 28) & 3) == 2)
  {
    request = (_QWORD *)(a1 + 96);
    if (a1 == -96)
      return v6;
  }
  else
  {
    if ((*(_DWORD *)(a1 + 28) & 3) != 1)
      return v6;
    request = (_QWORD *)_xpc_received_message_get_request(a1 + 88);
    if (!request)
      return v6;
  }
  if (__size > v6)
    v6 += _xpc_message_request_debug(request, &__str[v6], __size - v6);
  return v6;
}

uint64_t _xpc_dictionary_copy(_DWORD *a1)
{
  uint64_t v2;

  v2 = _xpc_base_create();
  *(_DWORD *)(v2 + 20) = 8;
  *(_DWORD *)(v2 + 28) &= 0xFFFFFFFC;
  _xpc_dictionary_apply_node_f(a1, v2, (uint64_t (*)(void))_xpc_dictionary_copy_apply);
  return v2;
}

BOOL _xpc_dictionary_equal(_DWORD *a1, uint64_t a2)
{
  _QWORD v3[3];
  char v4;

  if (a1[6] != *(_DWORD *)(a2 + 24))
    return 0;
  v4 = 1;
  v3[0] = a1;
  v3[1] = a2;
  v3[2] = &v4;
  _xpc_dictionary_apply_node_f(a1, (uint64_t)v3, (uint64_t (*)(void))_xpc_dictionary_equal_apply);
  return v4 != 0;
}

uint64_t _xpc_dictionary_hash(_DWORD *a1)
{
  uint64_t v2;

  v2 = 0;
  _xpc_dictionary_apply_node_f(a1, (uint64_t)&v2, (uint64_t (*)(void))_xpc_dictionary_hash_apply);
  return v2;
}

uint64_t _xpc_dictionary_desc(_DWORD *a1, uint64_t a2)
{
  const char *v4;
  const void *importance_voucher;
  unsigned int v6;
  size_t v7;
  const char *v8;
  unsigned int v9;
  size_t v10;
  uint64_t v11;
  uint64_t v12;
  __int16 __src;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _WORD v21[15];
  char __str[16];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C874D8];
  memset(v21, 0, sizeof(v21));
  v20 = 0u;
  v19 = 0u;
  v18 = 0u;
  v17 = 0u;
  v16 = 0u;
  v15 = 0u;
  __src = 123;
  _xpc_serializer_append(a2, &__src, 1uLL, 0);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  *(_OWORD *)__str = 0u;
  v23 = 0u;
  if (_xpc_dictionary_get_transaction((uint64_t)a1))
  {
    strcpy(__str, "<transaction");
    _xpc_serializer_append(a2, __str, 0xCuLL, 0);
    if (!_xpc_dictionary_get_importance_voucher((uint64_t)a1))
    {
LABEL_10:
      v8 = ">";
      goto LABEL_11;
    }
    v4 = ", ";
LABEL_6:
    importance_voucher = (const void *)_xpc_dictionary_get_importance_voucher((uint64_t)a1);
    v6 = snprintf(__str, 0x80uLL, "%svoucher = %p, ", v4, importance_voucher);
    if (v6 >= 0x7F)
      v7 = 127;
    else
      v7 = v6;
    _xpc_serializer_append(a2, __str, v7, 0);
    goto LABEL_10;
  }
  if (_xpc_dictionary_get_importance_voucher((uint64_t)a1))
  {
    v4 = "<";
    goto LABEL_6;
  }
  v8 = (const char *)&unk_1DEEBE00B;
LABEL_11:
  v9 = snprintf(__str, 0x80uLL, "%s\n", v8);
  if (v9 >= 0x7F)
    v10 = 127;
  else
    v10 = v9;
  _xpc_serializer_append(a2, __str, v10, 0);
  *(_QWORD *)&__str[8] = _xpc_serializer_pad(a2);
  *(_QWORD *)&v23 = 0;
  *(_QWORD *)__str = a2;
  _xpc_dictionary_apply_node_f(a1, (uint64_t)__str, (uint64_t (*)(void))_xpc_dictionary_desc_apply);
  _xpc_serializer_unpad(a2);
  v11 = _xpc_object_pad(*(char **)(a2 + 48), *(_QWORD *)(a2 + 56), *(_QWORD *)(a2 + 112));
  v12 = *(_QWORD *)(a2 + 56) - v11;
  *(_QWORD *)(a2 + 48) += v11;
  *(_QWORD *)(a2 + 56) = v12;
  return _xpc_serializer_append(a2, "}", 2uLL, 0);
}

uint64_t _xpc_dictionary_debug_desc(_DWORD *a1, uint64_t a2)
{
  int v4;
  int transaction;
  unsigned int v6;
  size_t v7;
  const void *importance_voucher;
  unsigned int v9;
  size_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[3];
  char __str[16];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C874D8];
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  *(_OWORD *)__str = 0u;
  v16 = 0u;
  v4 = a1[6];
  transaction = _xpc_dictionary_get_transaction((uint64_t)a1);
  v6 = snprintf(__str, 0x80uLL, "<%s: %p> { count = %u, transaction: %d, ", "dictionary", a1, v4, transaction);
  if (v6 >= 0x7F)
    v7 = 127;
  else
    v7 = v6;
  _xpc_serializer_append(a2, __str, v7, 0);
  importance_voucher = (const void *)_xpc_dictionary_get_importance_voucher((uint64_t)a1);
  v9 = snprintf(__str, 0x80uLL, "voucher = %p, ", importance_voucher);
  if (v9 >= 0x7F)
    v10 = 127;
  else
    v10 = v9;
  _xpc_serializer_append(a2, __str, v10, 0);
  strcpy(__str, "contents =\n");
  _xpc_serializer_append(a2, __str, 0xBuLL, 0);
  v14[1] = _xpc_serializer_pad(a2);
  v14[0] = a2;
  v14[2] = 1;
  _xpc_dictionary_apply_node_f(a1, (uint64_t)v14, (uint64_t (*)(void))_xpc_dictionary_desc_apply);
  _xpc_serializer_unpad(a2);
  v11 = _xpc_object_pad(*(char **)(a2 + 48), *(_QWORD *)(a2 + 56), *(_QWORD *)(a2 + 112));
  v12 = *(_QWORD *)(a2 + 56) - v11;
  *(_QWORD *)(a2 + 48) += v11;
  *(_QWORD *)(a2 + 56) = v12;
  return _xpc_serializer_append(a2, "}", 2uLL, 0);
}

_DWORD *_xpc_dictionary_serialize(_DWORD *a1, uint64_t a2)
{
  uint64_t graph_length;
  _DWORD *result;
  unint64_t v6;
  int v7;
  int v8;
  int __src;

  __src = 61440;
  _xpc_serializer_append(a2, &__src, 4uLL, 1);
  v8 = 0;
  graph_length = _xpc_serializer_get_graph_length(a2);
  _xpc_serializer_append(a2, &v8, 4uLL, 1);
  v7 = a1[6];
  _xpc_serializer_append(a2, &v7, 4uLL, 1);
  _xpc_dictionary_apply_node_f(a1, a2, (uint64_t (*)(void))_xpc_dictionary_serialize_apply);
  result = (_DWORD *)_xpc_serializer_get_graph_length(a2);
  v6 = (unint64_t)result - graph_length - 4;
  if (!HIDWORD(v6))
  {
    result = (_DWORD *)_xpc_serializer_get_graph_ptr(a2, graph_length);
    *result = v6;
  }
  return result;
}

_DWORD *_xpc_dictionary_deserialize(_OWORD *a1)
{
  _DWORD *v2;
  _QWORD v4[2];
  char v5;

  v2 = (_DWORD *)_xpc_base_create();
  v2[5] = 8;
  v2[7] &= 0xFFFFFFFC;
  v5 = 1;
  v4[0] = v2;
  v4[1] = &v5;
  _xpc_dictionary_apply_wire_f((uint64_t)v2, a1, (uint64_t)v4, (uint64_t (*)(const char *, _OWORD *, uint64_t))_xpc_dictionary_deserialize_apply);
  if (!v5)
  {
    xpc_release(v2);
    return 0;
  }
  return v2;
}

void _xpc_dictionary_dispose(uint64_t a1)
{
  uint64_t v2;
  _DWORD *v3;
  _DWORD *v4;

  v2 = 0;
  while (1)
  {
    v3 = *(_DWORD **)(a1 + 8 * v2 + 32);
    if (v3)
    {
      do
      {
        v4 = *(_DWORD **)v3;
        _xpc_dictionary_node_free(v3);
        v3 = v4;
      }
      while (v4);
    }
    if (++v2 == 7)
      __asm { BR              X11 }
  }
}

void sub_1DEE99138(char a1@<W8>)
{
  OSQueueHead *v1;
  void *payload;
  xpc_object_t *v3;
  xpc_object_t *v4;

  if ((a1 & 4) != 0)
  {
    payload = (void *)_xpc_graph_deserializer_get_payload((uint64_t)&v1[9].opaque2);
    os_release(payload);
    v3 = (xpc_object_t *)OSAtomicDequeue(v1 + 14, 0);
    if (v3)
    {
      v4 = v3;
      do
      {
        xpc_release(v4[1]);
        free(v4);
        v4 = (xpc_object_t *)OSAtomicDequeue(v1 + 14, 0);
      }
      while (v4);
    }
  }
  _xpc_received_message_destroy(&v1[5].opaque2);
}

void sub_1DEE99198()
{
  uint64_t v0;
  void *v1;

  _xpc_message_request_destroy((uint64_t *)(v0 + 96), *(_QWORD *)(v0 + 88));
  v1 = *(void **)(v0 + 88);
  if (v1)
    xpc_release(v1);
  else
    sub_1DEE99128();
}

uint64_t _xpc_dictionary_create_from_received_message(__int128 *a1, _OWORD *a2)
{
  _DWORD *v4;
  uint64_t payload;
  void *v6;
  int transport;
  uint64_t v8;
  int v9;
  uint64_t (*v10)(_OWORD *);
  int *v11;
  int v12;
  int v13;
  _OWORD v15[4];
  unsigned __int8 v16;

  v4 = (_DWORD *)_xpc_graph_deserializer_read((uint64_t)a2, 4uLL);
  if (!v4 || *v4 != 61440)
    return 0;
  payload = _xpc_graph_deserializer_get_payload((uint64_t)a2);
  if (!payload)
    _xpc_mach_message_request_handoff_reply_cold_1();
  v6 = (void *)payload;
  transport = xpc_payload_get_transport(payload);
  if (!transport)
  {
    if (_xpc_message_request_get_voucher((uint64_t)a2))
      goto LABEL_7;
LABEL_10:
    memset(v15, 0, sizeof(v15));
    _xpc_graph_deserializer_init_clone((uint64_t)v15, (uint64_t)a2);
    v10 = (uint64_t (*)(_OWORD *))_xpc_wire_length_from_wire_id(0xF000u);
    if (v10(v15) == -1)
      return 0;
    v11 = (int *)_xpc_graph_deserializer_read((uint64_t)v15, 4uLL);
    if (!v11)
      return 0;
    v12 = *v11;
    v8 = _xpc_base_create();
    v13 = *(_DWORD *)(v8 + 28);
    *(_DWORD *)(v8 + 20) = 8;
    *(_DWORD *)(v8 + 24) = v12;
    *(_QWORD *)(v8 + 224) = 0;
    *(_QWORD *)(v8 + 232) = 0;
    *(_DWORD *)(v8 + 28) = v13 & 0xFFFFFFF8 | 5;
    _xpc_graph_deserializer_move(v8 + 152, (uint64_t)a2);
    os_retain(v6);
    goto LABEL_13;
  }
  if (transport != 1)
    _xpc_dictionary_create_from_received_message_cold_2();
  if (!xpc_mach_payload_ool_port_count((uint64_t)v6))
    goto LABEL_10;
LABEL_7:
  v8 = _xpc_base_create();
  *(_DWORD *)(v8 + 20) = 8;
  *(_DWORD *)(v8 + 28) = *(_DWORD *)(v8 + 28) & 0xFFFFFFFC | 1;
  _xpc_ktrace_pid0();
  v16 = 1;
  *(_QWORD *)&v15[0] = v8;
  *((_QWORD *)&v15[0] + 1) = &v16;
  _xpc_dictionary_apply_wire_f(v8, a2, (uint64_t)v15, (uint64_t (*)(const char *, _OWORD *, uint64_t))_xpc_dictionary_deserialize_apply);
  v9 = v16;
  _xpc_ktrace_pid0();
  if (!v9)
  {
    xpc_release((xpc_object_t)v8);
    return 0;
  }
LABEL_13:
  _xpc_received_message_move(v8 + 88, a1);
  return v8;
}

uint64_t _xpc_dictionary_create_bootstrap_copy(_DWORD *a1, _OWORD *a2)
{
  uint64_t v4;
  __int128 v5;
  __int128 v6;

  v4 = _xpc_base_create();
  *(_DWORD *)(v4 + 20) = 8;
  *(_QWORD *)&v5 = -1;
  *((_QWORD *)&v5 + 1) = -1;
  *(_OWORD *)(v4 + 104) = v5;
  *(_OWORD *)(v4 + 88) = v5;
  *(_DWORD *)(v4 + 108) = 0;
  *(_DWORD *)(v4 + 28) |= 3u;
  v6 = a2[1];
  *(_OWORD *)(v4 + 88) = *a2;
  *(_OWORD *)(v4 + 104) = v6;
  if (a1)
    _xpc_dictionary_apply_node_f(a1, v4, (uint64_t (*)(void))_xpc_dictionary_copy_apply);
  return v4;
}

uint64_t _xpc_dictionary_create_reply_with_port(int a1)
{
  uint64_t v2;

  v2 = _xpc_base_create();
  *(_DWORD *)(v2 + 20) = 8;
  *(_DWORD *)(v2 + 28) = *(_DWORD *)(v2 + 28) & 0xFFFFFFFC | 2;
  _xpc_mach_message_request_init(v2 + 96, a1, 0, 0, 0);
  return v2;
}

uint64_t _xpc_dictionary_set_remote_connection(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD *request;

  if ((*(_DWORD *)(a1 + 28) & 3) != 1)
    _xpc_mach_message_request_handoff_reply_cold_1();
  v3 = a1 + 88;
  request = (_QWORD *)_xpc_received_message_get_request(a1 + 88);
  if (_xpc_message_request_get_transport((uint64_t)request) != 1)
    _xpc_mach_message_request_handoff_reply_cold_1();
  if (!_xpc_message_request_expects_reply(request))
    _xpc_mach_message_request_handoff_reply_cold_1();
  return _xpc_received_message_set_connection(v3, a2);
}

uint64_t _xpc_dictionary_extract_reply_port(uint64_t a1)
{
  unsigned int *request;

  if ((*(_DWORD *)(a1 + 28) & 3) != 1)
  {
    if ((*(_DWORD *)(a1 + 28) & 3) == 2)
    {
      request = (unsigned int *)(a1 + 96);
      goto LABEL_5;
    }
    return 0;
  }
  request = (unsigned int *)_xpc_received_message_get_request(a1 + 88);
  if (!request)
    return 0;
LABEL_5:
  if (_xpc_message_request_get_transport((uint64_t)request))
    return 0;
  return _xpc_mach_message_request_extract_reply_port(request);
}

uint64_t _xpc_dictionary_set_reply_msg_id(uint64_t a1, uint64_t a2)
{
  uint64_t request;

  if ((*(_DWORD *)(a1 + 28) & 3) == 1)
  {
    request = _xpc_received_message_get_request(a1 + 88);
    if (request)
      return _xpc_remote_message_request_set_reply_msg_id(request, a2);
LABEL_6:
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  if ((*(_DWORD *)(a1 + 28) & 3) != 2)
    goto LABEL_6;
  request = a1 + 96;
  return _xpc_remote_message_request_set_reply_msg_id(request, a2);
}

uint64_t _xpc_dictionary_get_reply_msg_id(uint64_t a1)
{
  _BYTE *request;

  if ((*(_DWORD *)(a1 + 28) & 3) == 1)
  {
    request = (_BYTE *)_xpc_received_message_get_request(a1 + 88);
    if (!request)
      return 0;
  }
  else
  {
    if ((*(_DWORD *)(a1 + 28) & 3) != 2)
      return 0;
    request = (_BYTE *)(a1 + 96);
  }
  if (_xpc_message_request_get_transport((uint64_t)request) == 1)
    return _xpc_remote_message_request_get_reply_msg_id(request);
  return 0;
}

uint64_t _xpc_dictionary_extract_reply_msg_id(uint64_t a1)
{
  uint64_t reply_msg_id;

  reply_msg_id = _xpc_dictionary_get_reply_msg_id(a1);
  if (reply_msg_id)
    _xpc_dictionary_set_reply_msg_id(a1, 0);
  return reply_msg_id;
}

unsigned int *xpc_dictionary_apply_f(_DWORD *a1, uint64_t a2, uint64_t a3)
{
  _QWORD v4[3];
  uint64_t v5;

  v4[0] = a1;
  v4[1] = a3;
  v4[2] = a2;
  v5 = 0;
  LODWORD(v5) = (a1[7] >> 3) & 0xFFFFFFF;
  return _xpc_dictionary_apply_node_f(a1, (uint64_t)v4, (uint64_t (*)(void))_xpc_dictionary_apply_f_apply);
}

unsigned int *_xpc_dictionary_apply_node_f(_DWORD *a1, uint64_t a2, uint64_t (*a3)(void))
{
  __objc2_class *type;
  unint64_t v7;
  unsigned int *result;
  unsigned int *v9;
  _QWORD v11[3];

  if (xpc_get_type(a1) != (xpc_type_t)OS_xpc_dictionary
    && xpc_get_type(a1) != (xpc_type_t)OS_xpc_error)
  {
    _xpc_api_misuse("Given object not of required type.");
  }
  type = (__objc2_class *)xpc_get_type(a1);
  v7 = 0;
  while (1)
  {
    result = *(unsigned int **)&a1[2 * v7 + 8];
    if (result)
      break;
LABEL_8:
    if (type == OS_xpc_error || v7++ >= 6)
    {
      if ((a1[7] & 7) == 5)
      {
        v11[0] = a1;
        v11[1] = a3;
        v11[2] = a2;
        return _xpc_dictionary_apply_wire_f((uint64_t)a1, 0, (uint64_t)v11, (uint64_t (*)(const char *, _OWORD *, uint64_t))_xpc_dictionary_apply_node_f_wire_apply);
      }
      return result;
    }
  }
  while (1)
  {
    v9 = *(unsigned int **)result;
    if (*((__objc2_class ***)result + 2) != &_xpc_dictionary_null_value)
    {
      result = (unsigned int *)a3();
      if (!(_DWORD)result)
        return result;
    }
    result = v9;
    if (!v9)
      goto LABEL_8;
  }
}

uint64_t _xpc_dictionary_apply_f_apply(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  char *v5;

  v3 = (_QWORD *)(a1 + 32);
  if ((*(_DWORD *)(a1 + 24) - 1) <= 1)
    v3 = (_QWORD *)*v3;
  (*(void (**)(_QWORD *, _QWORD, _QWORD))(a2 + 8))(v3, *(_QWORD *)(a1 + 16), *(_QWORD *)(a2 + 16));
  if (((*(_DWORD *)(*(_QWORD *)a2 + 28) >> 3) & 0xFFFFFFF) != *(_DWORD *)(a2 + 24))
  {
    v5 = _xpc_asprintf("Dictionary mutated during iteration");
    _xpc_api_misuse(v5);
  }
  return 1;
}

uint64_t _xpc_dictionary_extract_importance_voucher(uint64_t a1)
{
  uint64_t request;

  if ((*(_DWORD *)(a1 + 28) & 3) != 1)
  {
    if ((*(_DWORD *)(a1 + 28) & 3) == 2)
      return _xpc_message_request_extract_voucher(a1 + 96);
    return 0;
  }
  request = _xpc_received_message_get_request(a1 + 88);
  if (!request)
    return 0;
  return _xpc_message_request_extract_voucher(request);
}

uint64_t _xpc_dictionary_set_transaction(uint64_t a1, int a2)
{
  uint64_t request;

  if ((*(_DWORD *)(a1 + 28) & 3) == 1)
  {
    request = _xpc_received_message_get_request(a1 + 88);
    if (request)
      return _xpc_message_request_set_transaction(request, a2);
LABEL_6:
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
  if ((*(_DWORD *)(a1 + 28) & 3) != 2)
    goto LABEL_6;
  request = a1 + 96;
  return _xpc_message_request_set_transaction(request, a2);
}

uint64_t _xpc_dictionary_get_transaction(uint64_t a1)
{
  uint64_t request;

  if ((*(_DWORD *)(a1 + 28) & 3) != 1)
  {
    if ((*(_DWORD *)(a1 + 28) & 3) == 2)
      return _xpc_message_request_get_transaction(a1 + 96);
    return 0;
  }
  request = _xpc_received_message_get_request(a1 + 88);
  if (!request)
    return 0;
  return _xpc_message_request_get_transaction(request);
}

BOOL xpc_dictionary_expects_reply(uint64_t a1)
{
  _QWORD *request;

  if ((*(_DWORD *)(a1 + 28) & 3) != 1)
  {
    if ((*(_DWORD *)(a1 + 28) & 3) == 2)
      return _xpc_message_request_expects_reply((_QWORD *)(a1 + 96));
    return 0;
  }
  request = (_QWORD *)_xpc_received_message_get_request(a1 + 88);
  if (!request)
    return 0;
  return _xpc_message_request_expects_reply(request);
}

xpc_connection_t xpc_dictionary_get_connection(void *a1)
{
  if (xpc_get_type(a1) == (xpc_type_t)OS_xpc_dictionary)
    return xpc_dictionary_get_remote_connection(a1);
  else
    return 0;
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  if (xpc_get_type(xdict) != (xpc_type_t)OS_xpc_dictionary)
    return 0;
  if ((*((_DWORD *)xdict + 7) & 3) == 2)
    return (xpc_connection_t)*((_QWORD *)xdict + 11);
  if ((*((_DWORD *)xdict + 7) & 3) != 1)
    return 0;
  return (xpc_connection_t)_xpc_received_message_get_connection((uint64_t)xdict + 88);
}

void xpc_dictionary_set_pointer(void *a1, const char *a2, uint64_t a3)
{
  void *v6;

  if (xpc_get_type(a1) != (xpc_type_t)OS_xpc_dictionary)
    _xpc_api_misuse("Given object not of required type.");
  v6 = (void *)xpc_pointer_create(a3);
  xpc_dictionary_set_value(a1, a2, v6);
  xpc_release(v6);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  if (xpc_get_type(xdict) != (xpc_type_t)OS_xpc_dictionary)
    _xpc_api_misuse("Given object not of required type.");
  *((_DWORD *)xdict + 7) = *((_DWORD *)xdict + 7) & 0x80000007 | (8
                                                                * (((*((_DWORD *)xdict + 7) + 8) >> 3) & 0xFFFFFFF));
  _xpc_dictionary_insert(xdict, key, (__objc2_class **)value);
}

uint64_t xpc_dictionary_get_pointer(void *a1, const char *a2)
{
  _QWORD *value;
  _QWORD *v5;

  if ((xpc_get_type(a1) == (xpc_type_t)OS_xpc_error
     || xpc_get_type(a1) == (xpc_type_t)OS_xpc_dictionary)
    && (value = xpc_dictionary_get_value(a1, a2)) != 0
    && (v5 = value, xpc_get_type(value) == (xpc_type_t)OS_xpc_pointer))
  {
    return xpc_pointer_get_value(v5);
  }
  else
  {
    return 0;
  }
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  if (xpc_get_type(xdict) == (xpc_type_t)OS_xpc_error
    || xpc_get_type(xdict) == (xpc_type_t)OS_xpc_dictionary)
  {
    return (xpc_object_t)_xpc_dictionary_look_up((uint64_t)xdict, key, 0);
  }
  else
  {
    return 0;
  }
}

void xpc_dictionary_set_mach_send(void *a1, const char *a2, mach_port_name_t a3)
{
  void *v6;

  if (xpc_get_type(a1) != (xpc_type_t)OS_xpc_dictionary)
    _xpc_api_misuse("Given object not of required type.");
  v6 = (void *)xpc_mach_send_create(a3);
  xpc_dictionary_set_value(a1, a2, v6);
  xpc_release(v6);
}

uint64_t xpc_dictionary_copy_mach_send(void *a1, const char *a2)
{
  unsigned int *value;
  unsigned int *v5;

  if ((xpc_get_type(a1) == (xpc_type_t)OS_xpc_error
     || xpc_get_type(a1) == (xpc_type_t)OS_xpc_dictionary)
    && (value = (unsigned int *)xpc_dictionary_get_value(a1, a2)) != 0
    && (v5 = value, xpc_get_type(value) == (xpc_type_t)OS_xpc_mach_send))
  {
    return xpc_mach_send_copy_right(v5);
  }
  else
  {
    return 0;
  }
}

uint64_t _xpc_dictionary_extract_mach_send(void *a1, const char *a2)
{
  unsigned int *value;
  unsigned int *v5;

  if ((xpc_get_type(a1) == (xpc_type_t)OS_xpc_error
     || xpc_get_type(a1) == (xpc_type_t)OS_xpc_dictionary)
    && (value = (unsigned int *)xpc_dictionary_get_value(a1, a2)) != 0
    && (v5 = value, xpc_get_type(value) == (xpc_type_t)OS_xpc_mach_send))
  {
    return _xpc_mach_send_extract_right(v5);
  }
  else
  {
    return 0;
  }
}

void xpc_dictionary_set_mach_recv(void *a1, const char *a2, int a3)
{
  void *v6;

  if (xpc_get_type(a1) != (xpc_type_t)OS_xpc_dictionary)
    _xpc_api_misuse("Given object not of required type.");
  v6 = (void *)xpc_mach_recv_create(a3);
  xpc_dictionary_set_value(a1, a2, v6);
  xpc_release(v6);
}

uint64_t xpc_dictionary_extract_mach_recv(void *a1, const char *a2)
{
  unsigned int *value;
  unsigned int *v5;

  if ((xpc_get_type(a1) == (xpc_type_t)OS_xpc_error
     || xpc_get_type(a1) == (xpc_type_t)OS_xpc_dictionary)
    && (value = (unsigned int *)xpc_dictionary_get_value(a1, a2)) != 0
    && (v5 = value, xpc_get_type(value) == (xpc_type_t)OS_xpc_mach_recv))
  {
    return xpc_mach_recv_extract_right(v5);
  }
  else
  {
    return 0;
  }
}

void xpc_dictionary_get_audit_token(void *a1)
{
  if (xpc_get_type(a1) == (xpc_type_t)OS_xpc_dictionary)
    __asm { BR              X10 }
  _xpc_api_misuse("Given object not of required type.");
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  _DWORD *v6;
  const char *v7;
  const char *v8;
  __objc2_class **v9;

  v6 = (_DWORD *)_xpc_base_create();
  v6[5] = 8;
  for (v6[7] &= 0xFFFFFFFC; count; --count)
  {
    v8 = *keys++;
    v7 = v8;
    v9 = (__objc2_class **)*values++;
    _xpc_dictionary_insert(v6, v7, v9);
  }
  return v6;
}

void _xpc_dictionary_insert(_DWORD *a1, const char *a2, __objc2_class **a3)
{
  _DWORD *v6;
  char *v7;
  uint64_t *v8;
  char *v9;
  char *v10;
  const char *v11;
  __objc2_class **v12;
  __objc2_class **v13;
  _BOOL4 v14;
  _BOOL4 v16;
  int v17;
  int v18;
  size_t v19;
  size_t v20;
  BOOL v21;
  size_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  void *v26;
  uint64_t v27;
  int v28;
  char v29;
  char *v30;
  _OWORD v31[4];
  _QWORD v32[3];
  char v33;

  if (xpc_get_type(a1) == (xpc_type_t)OS_xpc_error)
  {
    v30 = _xpc_asprintf("Attempt to modify a global dictionary.");
    _xpc_api_misuse(v30);
  }
  v6 = &a1[2 * _hash_bucket(a2)];
  v9 = (char *)*((_QWORD *)v6 + 4);
  v8 = (uint64_t *)(v6 + 8);
  v7 = v9;
  do
  {
    if (!v7)
    {
      v14 = 0;
      v13 = 0;
      v16 = a3 != 0;
      goto LABEL_19;
    }
    v10 = v7;
    v11 = v7 + 32;
    if ((*((_DWORD *)v7 + 6) - 1) <= 1)
      v11 = *(const char **)v11;
    v7 = *(char **)v7;
  }
  while (strcmp(a2, v11));
  v7 = 0;
  v12 = (__objc2_class **)*((_QWORD *)v10 + 2);
  if (v12 == &_xpc_dictionary_null_value)
    v13 = 0;
  else
    v13 = (__objc2_class **)*((_QWORD *)v10 + 2);
  v14 = v13 != 0;
  if (v13 == a3 && v13 != 0)
    v7 = (char *)xpc_retain(a3);
  _xpc_dictionary_node_free(v10);
  v16 = a3 != 0;
  if (a3 && v13)
  {
    LOBYTE(v16) = 1;
    v13 = v12;
    goto LABEL_33;
  }
LABEL_19:
  if ((a1[7] & 7) == 5)
  {
    memset(v31, 0, sizeof(v31));
    v33 = 0;
    v32[0] = a2;
    v32[1] = v31;
    v32[2] = &v33;
    _xpc_dictionary_apply_wire_f((uint64_t)a1, 0, (uint64_t)v32, (uint64_t (*)(const char *, _OWORD *, uint64_t))_xpc_dictionary_look_up_wire_apply);
    if (v33)
      v17 = v14;
    else
      v17 = 1;
    if (v33)
      v18 = v16;
    else
      v18 = 1;
    if (!v17)
      v13 = &_xpc_dictionary_null_value;
    if (v18 != 1)
    {
      a3 = &_xpc_dictionary_null_value;
      goto LABEL_33;
    }
  }
  if (a3)
  {
LABEL_33:
    v19 = strlen(a2);
    v20 = v19 + 40;
    v21 = v19 >= 0xFFFFFFFFFFFFFFD8;
    v22 = v19 + 41;
    v23 = v20 == -1;
    v24 = v23 << 63 >> 63;
    v25 = v24 != v23;
    if (v21 || v25 || v24 < 0)
    {
      __break(1u);
      return;
    }
    v26 = _xpc_alloc(v22);
    *((_DWORD *)v26 + 6) = 0;
    *(_QWORD *)v26 = 0;
    *((_QWORD *)v26 + 1) = 0;
    strcpy((char *)v26 + 32, a2);
    *((_QWORD *)v26 + 2) = xpc_retain(a3);
    v27 = *v8;
    *(_QWORD *)v26 = *v8;
    if (v27)
      *(_QWORD *)(v27 + 8) = v26;
    *v8 = (uint64_t)v26;
    *((_QWORD *)v26 + 1) = v8;
    if (v13)
      goto LABEL_41;
  }
  else if (v13)
  {
    goto LABEL_41;
  }
  if (v16)
  {
    v28 = 1;
LABEL_46:
    a1[6] += v28;
    goto LABEL_47;
  }
LABEL_41:
  if (v13)
    v29 = v16;
  else
    v29 = 1;
  if ((v29 & 1) == 0)
  {
    v28 = -1;
    goto LABEL_46;
  }
LABEL_47:
  if (v7)
    xpc_release(v7);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  xpc_object_t result;

  result = (xpc_object_t)_xpc_base_create();
  *((_DWORD *)result + 5) = 8;
  *((_DWORD *)result + 7) &= 0xFFFFFFFC;
  return result;
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  __n128 *v2;
  void *connection;

  if (xpc_get_type(original) != (xpc_type_t)OS_xpc_dictionary)
    return 0;
  if ((*((_DWORD *)original + 7) & 3) == 1 && _xpc_message_request_expects_reply((_QWORD *)original + 11))
  {
    v2 = (__n128 *)_xpc_base_create();
    v2[1].n128_u32[1] = 8;
    v2[1].n128_u32[3] = v2[1].n128_u32[3] & 0xFFFFFFFC | 2;
    _xpc_received_message_extract_request((__n128 *)((char *)original + 88), v2 + 6);
    connection = (void *)_xpc_received_message_get_connection((uint64_t)original + 88);
    if (connection)
      v2[5].n128_u64[1] = (unint64_t)xpc_retain(connection);
  }
  else
  {
    v2 = 0;
  }
  _xpc_ktrace_pid2();
  return v2;
}

void xpc_dictionary_handoff_reply(_DWORD *a1, NSObject *a2, void *a3)
{
  uint64_t request;
  char *v7;

  if (xpc_get_type(a1) != (xpc_type_t)OS_xpc_dictionary)
    _xpc_api_misuse("Given object not of required type.");
  if ((a1[7] & 3) == 1)
  {
    request = _xpc_received_message_get_request(a1 + 22);
    if (request)
      goto LABEL_6;
LABEL_8:
    v7 = _xpc_asprintf("XPC Dictionary is not a message");
    _xpc_api_misuse(v7);
  }
  if ((a1[7] & 3) != 2)
    goto LABEL_8;
  request = (uint64_t)(a1 + 24);
LABEL_6:
  _xpc_mach_message_request_handoff_reply(request, a2, a3);
}

void xpc_dictionary_handoff_reply_f(_DWORD *a1, NSObject *a2, void *a3, void (__cdecl *a4)(void *))
{
  uint64_t request;
  char *v9;

  if (xpc_get_type(a1) != (xpc_type_t)OS_xpc_dictionary)
    _xpc_api_misuse("Given object not of required type.");
  if ((a1[7] & 3) == 1)
  {
    request = _xpc_received_message_get_request(a1 + 22);
    if (request)
      goto LABEL_6;
LABEL_8:
    v9 = _xpc_asprintf("XPC Dictionary is not a message");
    _xpc_api_misuse(v9);
  }
  if ((a1[7] & 3) != 2)
    goto LABEL_8;
  request = (uint64_t)(a1 + 24);
LABEL_6:
  _xpc_mach_message_request_handoff_reply_f(request, a2, a3, a4);
}

void xpc_dictionary_send_reply(uint64_t a1)
{
  _xpc_connection_s *connection;
  _QWORD *request;
  int transport;
  uint64_t v5;
  char *v6;

  if (xpc_get_type((xpc_object_t)a1) != (xpc_type_t)OS_xpc_dictionary)
    _xpc_api_misuse("Given object not of required type.");
  if ((*(_DWORD *)(a1 + 28) & 3) == 2)
  {
    connection = *(_xpc_connection_s **)(a1 + 88);
    request = (_QWORD *)(a1 + 96);
  }
  else
  {
    if ((*(_DWORD *)(a1 + 28) & 3) != 1)
    {
      v6 = _xpc_asprintf("Attempt to send non-message dictionary as reply");
      goto LABEL_18;
    }
    connection = (_xpc_connection_s *)_xpc_received_message_get_connection(a1 + 88);
    request = (_QWORD *)_xpc_received_message_get_request(a1 + 88);
  }
  if (!_xpc_message_request_expects_reply(request))
    _xpc_mach_message_request_handoff_reply_cold_1();
  transport = _xpc_message_request_get_transport((uint64_t)request);
  if (transport != 1)
  {
    if (!transport)
    {
      xpc_connection_send_message(connection, (xpc_object_t)a1);
      return;
    }
    v6 = _xpc_asprintf("Attempt to send non-reply message as reply");
LABEL_18:
    _xpc_api_misuse(v6);
  }
  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 16) == -1)
    v5 = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 24);
  else
    v5 = _os_alloc_once();
  (*(void (**)(uint64_t))(*(_QWORD *)(v5 + 200) + 16))(a1);
}

void xpc_dictionary_send_reply_4SWIFT(_DWORD *a1, _DWORD *a2)
{
  __n128 *v4;
  __n128 *v5;
  void *connection;
  char *v7;

  if (xpc_get_type(a1) != (xpc_type_t)OS_xpc_dictionary)
    goto LABEL_8;
  if ((a1[7] & 3) != 1)
  {
    v7 = _xpc_asprintf("Attempting to merge reply with non-received dictionary");
    goto LABEL_11;
  }
  if (xpc_get_type(a2) != (xpc_type_t)OS_xpc_dictionary)
LABEL_8:
    _xpc_api_misuse("Given object not of required type.");
  if ((a2[7] & 3) == 2)
  {
    xpc_dictionary_send_reply((uint64_t)a2);
    return;
  }
  v4 = (__n128 *)(a1 + 22);
  if (!_xpc_message_request_expects_reply(v4))
  {
    v7 = _xpc_asprintf("Attempting to send reply dictionary without valid reply port. Did you call xpc_dictionary_create_reply() or XPCDictionary.createReply()?");
LABEL_11:
    _xpc_api_misuse(v7);
  }
  v5 = (__n128 *)_xpc_base_create();
  v5[1].n128_u32[1] = 8;
  v5[1].n128_u32[3] = v5[1].n128_u32[3] & 0xFFFFFFFC | 2;
  _xpc_dictionary_apply_node_f(a2, (uint64_t)v5, (uint64_t (*)(void))_xpc_dictionary_copy_apply);
  _xpc_received_message_extract_request(v4, v5 + 6);
  connection = (void *)_xpc_received_message_get_connection((uint64_t)v4);
  v5[5].n128_u64[1] = (unint64_t)xpc_retain(connection);
  xpc_dictionary_send_reply((uint64_t)v5);
  xpc_release(v5);
}

unint64_t _xpc_dictionary_look_up(uint64_t a1, const char *a2, _OWORD *a3)
{
  unint64_t result;
  _OWORD *v7;
  _OWORD v8[4];
  _QWORD v9[3];
  char v10;

  result = _xpc_dictionary_look_up_table(a1, a2);
  if (result || (*(_DWORD *)(a1 + 28) & 7) != 5)
  {
    if (result)
    {
      if (*(__objc2_class ***)(result + 16) == &_xpc_dictionary_null_value)
        return 0;
      else
        return *(_QWORD *)(result + 16);
    }
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    if (a3)
      v7 = a3;
    else
      v7 = v8;
    v10 = 0;
    v9[0] = a2;
    v9[1] = v7;
    v9[2] = &v10;
    _xpc_dictionary_apply_wire_f(a1, 0, (uint64_t)v9, (uint64_t (*)(const char *, _OWORD *, uint64_t))_xpc_dictionary_look_up_wire_apply);
    if (a3 || !v10)
    {
      if (v10)
        return 3735928559;
      else
        return 0;
    }
    else
    {
      return (unint64_t)_xpc_dictionary_unpack_value_and_vend((OSQueueHead *)a1, (uint64_t)v7);
    }
  }
  return result;
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  if (xpc_get_type(xdict) == (xpc_type_t)OS_xpc_error
    || xpc_get_type(xdict) == (xpc_type_t)OS_xpc_dictionary)
  {
    return *((unsigned int *)xdict + 6);
  }
  else
  {
    return 0;
  }
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  _QWORD v5[3];
  uint64_t v6;
  BOOL v7;

  if (xpc_get_type(xdict) != (xpc_type_t)OS_xpc_error
    && xpc_get_type(xdict) != (xpc_type_t)OS_xpc_dictionary)
  {
    _xpc_api_misuse("Given object not of required type.");
  }
  v7 = 1;
  v5[0] = xdict;
  v5[1] = applier;
  v5[2] = &v7;
  v6 = 0;
  LODWORD(v6) = (*((_DWORD *)xdict + 7) >> 3) & 0xFFFFFFF;
  _xpc_dictionary_apply_node_f(xdict, (uint64_t)v5, (uint64_t (*)(void))_xpc_dictionary_apply_apply);
  return v7;
}

uint64_t _xpc_dictionary_apply_apply(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t result;
  char *v7;

  v4 = *(_QWORD *)(a2 + 8);
  v5 = (_QWORD *)(a1 + 32);
  if ((*(_DWORD *)(a1 + 24) - 1) <= 1)
    v5 = (_QWORD *)*v5;
  result = (*(uint64_t (**)(uint64_t, _QWORD *, _QWORD))(v4 + 16))(v4, v5, *(_QWORD *)(a1 + 16));
  **(_BYTE **)(a2 + 16) = result;
  if (((*(_DWORD *)(*(_QWORD *)a2 + 28) >> 3) & 0xFFFFFFF) != *(_DWORD *)(a2 + 24))
  {
    v7 = _xpc_asprintf("Dictionary mutated during iteration");
    _xpc_api_misuse(v7);
  }
  return result;
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  xpc_object_t v5;

  v5 = xpc_BOOL_create(value);
  xpc_dictionary_set_value(xdict, key, v5);
  xpc_release(v5);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  xpc_object_t v5;

  v5 = xpc_int64_create(value);
  xpc_dictionary_set_value(xdict, key, v5);
  xpc_release(v5);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  xpc_object_t v5;

  v5 = xpc_uint64_create(value);
  xpc_dictionary_set_value(xdict, key, v5);
  xpc_release(v5);
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
  xpc_object_t v5;

  v5 = xpc_double_create(value);
  xpc_dictionary_set_value(xdict, key, v5);
  xpc_release(v5);
}

void xpc_dictionary_set_date(xpc_object_t xdict, const char *key, int64_t value)
{
  xpc_object_t v5;

  v5 = xpc_date_create(value);
  xpc_dictionary_set_value(xdict, key, v5);
  xpc_release(v5);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  xpc_object_t v6;

  v6 = xpc_data_create(bytes, length);
  xpc_dictionary_set_value(xdict, key, v6);
  xpc_release(v6);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  xpc_object_t v5;

  v5 = xpc_string_create(string);
  xpc_dictionary_set_value(xdict, key, v5);
  xpc_release(v5);
}

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
  xpc_object_t v5;

  v5 = xpc_uuid_create(uuid);
  xpc_dictionary_set_value(xdict, key, v5);
  xpc_release(v5);
}

void xpc_dictionary_set_fd(xpc_object_t xdict, const char *key, int fd)
{
  xpc_object_t v5;
  void *v6;

  v5 = xpc_fd_create(fd);
  if (v5)
  {
    v6 = v5;
    xpc_dictionary_set_value(xdict, key, v5);
    xpc_release(v6);
  }
}

void xpc_dictionary_set_connection(xpc_object_t xdict, const char *key, xpc_connection_t connection)
{
  xpc_endpoint_t v5;

  v5 = xpc_endpoint_create(connection);
  xpc_dictionary_set_value(xdict, key, v5);
  xpc_release(v5);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  void *v2;
  _OWORD v4[4];
  char v5;

  v5 = 0;
  memset(v4, 0, sizeof(v4));
  v2 = (void *)_xpc_dictionary_look_up_fast(xdict, key, 0x2000, v4);
  if (v2)
  {
    if (v2 == (void *)3735928559)
    {
      _xpc_BOOL_get_wire_value((uint64_t)v4, &v5);
      LOBYTE(v2) = v5 != 0;
    }
    else
    {
      LOBYTE(v2) = xpc_BOOL_get_value(v2);
    }
  }
  return (char)v2;
}

unint64_t _xpc_dictionary_look_up_fast(void *a1, const char *a2, int a3, _OWORD *a4)
{
  unint64_t result;
  int *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  int v16;
  int *extension_vtable;
  unint64_t v18;
  unint64_t v19;
  char *v20;

  if (xpc_get_type(a1) != (xpc_type_t)OS_xpc_error
    && xpc_get_type(a1) != (xpc_type_t)OS_xpc_dictionary)
  {
    _xpc_api_misuse("Given object not of required type.");
  }
  result = _xpc_dictionary_look_up((uint64_t)a1, a2, a4);
  if (result)
  {
    if (result == 3735928559)
    {
      v9 = (int *)_xpc_graph_deserializer_read((uint64_t)a4, 4uLL);
      if (v9)
        v10 = *v9;
      else
        v10 = 122880;
      if (_xpc_class_id_valid(v10) && v10 == a3)
        return 3735928559;
      else
        return 0;
    }
    else
    {
      if ((result & 0x8000000000000000) != 0)
      {
        v11 = 0;
        v12 = *MEMORY[0x1E0DE7C58];
        if ((~result & 0xC000000000000007) == 0)
          v12 = 0;
        v13 = v12 ^ result;
        do
        {
          if ((v13 & 7) == *(_BYTE *)(MEMORY[0x1E0DE7C48] + v11))
            break;
          ++v11;
        }
        while (v11 != 7);
        v14 = v11 | v13;
        v15 = v11 & 7;
        v16 = (v14 >> 55) + 8;
        if (v15 == 7)
          LODWORD(v15) = v16;
        if ((_DWORD)v15 == 12)
        {
          extension_vtable = &_OS_xpc_type_uint64;
        }
        else
        {
          if ((_DWORD)v15 != 13)
          {
            v20 = _xpc_asprintf("Object is not an XPC object");
            _xpc_api_misuse(v20);
          }
          extension_vtable = &_OS_xpc_type_int64;
        }
      }
      else
      {
        v18 = *(_QWORD *)result;
        if (*(_QWORD *)result < (unint64_t)OS_xpc_object
          || v18 > (unint64_t)OS_xpc_rich_error
          || (v18 & 7) != 0)
        {
          v19 = result;
          extension_vtable = _xpc_get_extension_vtable((id)result);
          result = v19;
        }
        else
        {
          extension_vtable = (int *)((char *)&_xpc_vtables + 2 * (v18 - (_QWORD)OS_xpc_object));
        }
      }
      if (*extension_vtable != a3)
        return 0;
    }
  }
  return result;
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  int64_t result;
  _OWORD v3[4];
  int64_t v4;

  v4 = 0;
  memset(v3, 0, sizeof(v3));
  result = _xpc_dictionary_look_up_fast(xdict, key, 12288, v3);
  if (result)
  {
    if (result == 3735928559)
    {
      _xpc_date_get_wire_value((uint64_t)v3, &v4);
      return v4;
    }
    else
    {
      return xpc_int64_get_value((xpc_object_t)result);
    }
  }
  return result;
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  uint64_t result;
  _OWORD v3[4];
  uint64_t v4;

  v4 = 0;
  memset(v3, 0, sizeof(v3));
  result = _xpc_dictionary_look_up_fast(xdict, key, 0x4000, v3);
  if (result)
  {
    if (result == 3735928559)
    {
      _xpc_date_get_wire_value((uint64_t)v3, &v4);
      return v4;
    }
    else
    {
      return xpc_uint64_get_value((xpc_object_t)result);
    }
  }
  return result;
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  void *v2;
  _OWORD v4[4];
  double v5;

  v5 = NAN;
  memset(v4, 0, sizeof(v4));
  v2 = (void *)_xpc_dictionary_look_up_fast(xdict, key, 20480, v4);
  if (!v2)
    return NAN;
  if (v2 != (void *)3735928559)
    return xpc_double_get_value(v2);
  _xpc_double_get_wire_value((uint64_t)v4, &v5);
  return v5;
}

int64_t xpc_dictionary_get_date(xpc_object_t xdict, const char *key)
{
  int64_t result;
  _OWORD v3[4];
  int64_t v4;

  v4 = 0;
  memset(v3, 0, sizeof(v3));
  result = _xpc_dictionary_look_up_fast(xdict, key, 28672, v3);
  if (result)
  {
    if (result == 3735928559)
    {
      _xpc_date_get_wire_value((uint64_t)v3, &v4);
      return v4;
    }
    else
    {
      return xpc_date_get_value((xpc_object_t)result);
    }
  }
  return result;
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  _QWORD *v4;
  _OWORD v6[4];
  const void *v7;
  mach_vm_size_t v8;
  const void *v9;
  size_t v10;

  v9 = 0;
  v10 = 0;
  v7 = 0;
  v8 = 0;
  memset(v6, 0, sizeof(v6));
  v4 = (_QWORD *)_xpc_dictionary_look_up_fast(xdict, key, 0x8000, v6);
  if (v4)
  {
    if (v4 == (_QWORD *)3735928559)
    {
      _xpc_data_get_wire_value((uint64_t *)v6, (uint64_t *)&v7, &v8);
      v9 = v7;
      v10 = v8;
    }
    else if (!xpc_data_get_bytes_ptr_and_length(v4, &v9, &v10))
    {
      return 0;
    }
  }
  if (length)
    *length = v10;
  return v9;
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  const char *result;
  _OWORD v3[4];
  const char *v4;
  unint64_t v5;

  v4 = 0;
  v5 = 0;
  memset(v3, 0, sizeof(v3));
  result = (const char *)_xpc_dictionary_look_up_fast(xdict, key, 36864, v3);
  if (result)
  {
    if (result == (const char *)3735928559)
    {
      _xpc_string_get_wire_value((uint64_t)v3, (uint64_t *)&v4, &v5);
      return v4;
    }
    else
    {
      return xpc_string_get_string_ptr((xpc_object_t)result);
    }
  }
  return result;
}

const uint8_t *__cdecl xpc_dictionary_get_uuid(xpc_object_t xdict, const char *key)
{
  const uint8_t *result;
  _OWORD v3[4];
  const uint8_t *v4;

  v4 = 0;
  memset(v3, 0, sizeof(v3));
  result = (const uint8_t *)_xpc_dictionary_look_up_fast(xdict, key, 40960, v3);
  if (result)
  {
    if (result == (const uint8_t *)3735928559)
    {
      _xpc_uuid_get_wire_value((uint64_t)v3, (uint64_t *)&v4);
      return v4;
    }
    else
    {
      return xpc_uuid_get_bytes((xpc_object_t)result);
    }
  }
  return result;
}

int xpc_dictionary_dup_fd(xpc_object_t xdict, const char *key)
{
  xpc_object_t value;
  void *v3;

  value = xpc_dictionary_get_value(xdict, key);
  if (value && (v3 = value, xpc_get_type(value) == (xpc_type_t)OS_xpc_fd))
    return xpc_fd_dup(v3);
  else
    return -1;
}

xpc_connection_t xpc_dictionary_create_connection(xpc_object_t xdict, const char *key)
{
  _xpc_endpoint_s *value;
  _xpc_endpoint_s *v3;

  value = (_xpc_endpoint_s *)xpc_dictionary_get_value(xdict, key);
  if (value && (v3 = value, xpc_get_type(value) == (xpc_type_t)OS_xpc_endpoint))
    return xpc_connection_create_from_endpoint(v3);
  else
    return 0;
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  xpc_object_t value;
  void *v3;

  value = xpc_dictionary_get_value(xdict, key);
  if (!value)
    return 0;
  v3 = value;
  if (xpc_get_type(value) != (xpc_type_t)OS_xpc_dictionary)
    return 0;
  return v3;
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  xpc_object_t value;
  void *v3;

  value = xpc_dictionary_get_value(xdict, key);
  if (!value)
    return 0;
  v3 = value;
  if (xpc_get_type(value) != (xpc_type_t)OS_xpc_array)
    return 0;
  return v3;
}

uint64_t _xpc_dictionary_equal_apply(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  const char *v5;
  _BYTE *v6;
  void *v7;
  void *v8;
  uint64_t result;

  v4 = *(_QWORD *)(a2 + 8);
  v5 = (const char *)(a1 + 32);
  if ((*(_DWORD *)(a1 + 24) - 1) <= 1)
    v5 = *(const char **)v5;
  v6 = *(_BYTE **)(a2 + 16);
  v7 = *(void **)(a1 + 16);
  v8 = (void *)_xpc_dictionary_look_up(v4, v5, 0);
  if (v8 && xpc_equal(v7, v8))
    return 1;
  result = 0;
  *v6 = 0;
  return result;
}

uint64_t _xpc_dictionary_hash_apply(uint64_t a1, _QWORD *a2)
{
  *a2 += xpc_hash(*(xpc_object_t *)(a1 + 16));
  return 1;
}

uint64_t _xpc_dictionary_desc_apply(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  size_t v8;
  int v9;
  uint64_t v10;
  unint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  int v17;
  int *v18;
  unint64_t v19;
  BOOL v20;
  BOOL v21;
  void (*v22)(unint64_t *, uint64_t);
  unint64_t *v23;
  unint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  int v30;
  int *extension_vtable;
  unint64_t v32;
  uint64_t v35;
  char *v37;
  char __str[16];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C874D8];
  v5 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  *(_OWORD *)__str = 0u;
  v39 = 0u;
  v6 = _xpc_object_pad(__str, 0x80uLL, v4);
  v7 = &__str[v6];
  v8 = 128 - v6;
  if (*(_BYTE *)(a2 + 16))
  {
    if (v8 >= 2)
    {
      v9 = snprintf(v7, v8, "\"%s\" => ");
      goto LABEL_6;
    }
  }
  else if (v8 >= 2)
  {
    v9 = snprintf(v7, v8, "%s => ");
LABEL_6:
    v10 = v9;
    if (v8 <= v9)
      v10 = 127 - v6;
    goto LABEL_10;
  }
  v10 = 0;
LABEL_10:
  _xpc_serializer_append(v5, __str, &v7[v10] - __str, 0);
  if (!*(_BYTE *)(a2 + 16))
    goto LABEL_34;
  v11 = *(unint64_t **)(a1 + 16);
  if (((unint64_t)v11 & 0x8000000000000000) != 0)
  {
    v12 = 0;
    v13 = *MEMORY[0x1E0DE7C58];
    if ((~(unint64_t)v11 & 0xC000000000000007) == 0)
      v13 = 0;
    v14 = v13 ^ (unint64_t)v11;
    do
    {
      if ((v14 & 7) == *(_BYTE *)(MEMORY[0x1E0DE7C48] + v12))
        break;
      ++v12;
    }
    while (v12 != 7);
    v15 = v12 | v14;
    v16 = v12 & 7;
    v17 = (v15 >> 55) + 8;
    if (v16 == 7)
      LODWORD(v16) = v17;
    if ((_DWORD)v16 == 12)
    {
      v18 = &_OS_xpc_type_uint64;
    }
    else
    {
      if ((_DWORD)v16 != 13)
        goto LABEL_57;
      v18 = &_OS_xpc_type_int64;
    }
  }
  else
  {
    v19 = *v11;
    v20 = *v11 < (unint64_t)OBJC_CLASS___OS_xpc_object || v19 > (unint64_t)OS_xpc_rich_error;
    v21 = !v20 && (*v11 & 7) == 0;
    v18 = v21
        ? (int *)((char *)&_xpc_vtables + 2 * (v19 - (_QWORD)OBJC_CLASS___OS_xpc_object))
        : _xpc_get_extension_vtable(*(id *)(a1 + 16));
  }
  v22 = (void (*)(unint64_t *, uint64_t))*((_QWORD *)v18 + 7);
  if (!v22)
  {
LABEL_34:
    v24 = *(unint64_t **)(a1 + 16);
    if (((unint64_t)v24 & 0x8000000000000000) == 0)
    {
      v32 = *v24;
      if (*v24 >= (unint64_t)OBJC_CLASS___OS_xpc_object
        && v32 <= (unint64_t)OS_xpc_rich_error
        && (*v24 & 7) == 0)
      {
        extension_vtable = (int *)((char *)&_xpc_vtables + 2 * (v32 - (_QWORD)OBJC_CLASS___OS_xpc_object));
      }
      else
      {
        extension_vtable = _xpc_get_extension_vtable(v24);
      }
      goto LABEL_55;
    }
    v25 = 0;
    v26 = *MEMORY[0x1E0DE7C58];
    if ((~(unint64_t)v24 & 0xC000000000000007) == 0)
      v26 = 0;
    v27 = v26 ^ (unint64_t)v24;
    do
    {
      if ((v27 & 7) == *(_BYTE *)(MEMORY[0x1E0DE7C48] + v25))
        break;
      ++v25;
    }
    while (v25 != 7);
    v28 = v25 | v27;
    v29 = v25 & 7;
    v30 = (v28 >> 55) + 8;
    if (v29 == 7)
      LODWORD(v29) = v30;
    if ((_DWORD)v29 == 12)
    {
      extension_vtable = &_OS_xpc_type_uint64;
      goto LABEL_55;
    }
    if ((_DWORD)v29 == 13)
    {
      extension_vtable = &_OS_xpc_type_int64;
LABEL_55:
      v22 = (void (*)(unint64_t *, uint64_t))*((_QWORD *)extension_vtable + 6);
      v23 = v24;
      goto LABEL_56;
    }
LABEL_57:
    v37 = _xpc_asprintf("Object is not an XPC object");
    _xpc_api_misuse(v37);
  }
  v23 = v11;
LABEL_56:
  v22(v23, v5);
  v35 = *(_QWORD *)(v5 + 56) + 1;
  --*(_QWORD *)(v5 + 48);
  *(_QWORD *)(v5 + 56) = v35;
  _xpc_serializer_append(v5, "\n", 1uLL, 0);
  return 1;
}

uint64_t _xpc_dictionary_get_importance_voucher(uint64_t a1)
{
  uint64_t request;

  if ((*(_DWORD *)(a1 + 28) & 3) != 1)
  {
    if ((*(_DWORD *)(a1 + 28) & 3) == 2)
      return _xpc_message_request_get_voucher(a1 + 96);
    return 0;
  }
  request = _xpc_received_message_get_request(a1 + 88);
  if (!request)
    return 0;
  return _xpc_message_request_get_voucher(request);
}

uint64_t _xpc_dictionary_serialize_apply(uint64_t a1, uint64_t a2)
{
  char *v4;
  size_t v5;
  unint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  int v12;
  int *extension_vtable;
  unint64_t v14;
  char *v18;

  v4 = (char *)(a1 + 32);
  if ((*(_DWORD *)(a1 + 24) - 1) <= 1)
    v4 = *(char **)v4;
  v5 = strlen(v4);
  _xpc_serializer_append(a2, v4, v5 + 1, 1);
  v6 = *(unint64_t **)(a1 + 16);
  if (((unint64_t)v6 & 0x8000000000000000) != 0)
  {
    v7 = 0;
    v8 = *MEMORY[0x1E0DE7C58];
    if ((~(unint64_t)v6 & 0xC000000000000007) == 0)
      v8 = 0;
    v9 = v8 ^ (unint64_t)v6;
    do
    {
      if ((v9 & 7) == *(_BYTE *)(MEMORY[0x1E0DE7C48] + v7))
        break;
      ++v7;
    }
    while (v7 != 7);
    v10 = v7 | v9;
    v11 = v7 & 7;
    v12 = (v10 >> 55) + 8;
    if (v11 == 7)
      LODWORD(v11) = v12;
    if ((_DWORD)v11 == 12)
    {
      extension_vtable = &_OS_xpc_type_uint64;
    }
    else
    {
      if ((_DWORD)v11 != 13)
      {
        v18 = _xpc_asprintf("Object is not an XPC object");
        _xpc_api_misuse(v18);
      }
      extension_vtable = &_OS_xpc_type_int64;
    }
  }
  else
  {
    v14 = *v6;
    if (*v6 >= (unint64_t)OBJC_CLASS___OS_xpc_object
      && v14 <= (unint64_t)OS_xpc_rich_error
      && (*v6 & 7) == 0)
    {
      extension_vtable = (int *)((char *)&_xpc_vtables + 2 * (v14 - (_QWORD)OBJC_CLASS___OS_xpc_object));
    }
    else
    {
      extension_vtable = _xpc_get_extension_vtable(v6);
    }
  }
  (*((void (**)(unint64_t *, uint64_t))extension_vtable + 9))(v6, a2);
  return 1;
}

void _xpc_dictionary_node_free(_DWORD *a1)
{
  uint64_t v2;

  if (a1[6] != 2)
  {
    v2 = *(_QWORD *)a1;
    if (*(_QWORD *)a1)
      *(_QWORD *)(v2 + 8) = *((_QWORD *)a1 + 1);
    **((_QWORD **)a1 + 1) = v2;
    *(_QWORD *)a1 = -1;
    *((_QWORD *)a1 + 1) = -1;
    xpc_release(*((xpc_object_t *)a1 + 2));
    free(a1);
  }
}

unsigned int *_xpc_dictionary_apply_wire_f(uint64_t a1, _OWORD *a2, uint64_t a3, uint64_t (*a4)(const char *, _OWORD *, uint64_t))
{
  _OWORD *v6;
  unsigned int *result;
  uint64_t v8;
  uint64_t v9;
  const char *string;
  BOOL v12;
  _OWORD v13[4];

  v6 = a2;
  memset(v13, 0, sizeof(v13));
  if (!a2)
  {
    v6 = v13;
    _xpc_graph_deserializer_init_clone((uint64_t)v13, a1 + 152);
  }
  if (_xpc_wire_length((uint64_t)v6) == (unsigned int *)-1)
    return (unsigned int *)a4(0, 0, a3);
  result = (unsigned int *)_xpc_graph_deserializer_read((uint64_t)v6, 4uLL);
  if (!result)
    return (unsigned int *)a4(0, 0, a3);
  v8 = *result;
  if ((_DWORD)v8)
  {
    v9 = v8 - 1;
    do
    {
      string = _xpc_graph_deserializer_read_string((uint64_t)v6);
      result = (unsigned int *)a4(string, v6, a3);
      v12 = v9-- != 0;
    }
    while ((_DWORD)result && v12);
  }
  return result;
}

uint64_t _xpc_dictionary_deserialize_apply(uint64_t result, uint64_t a2, uint64_t a3)
{
  _BYTE *v3;
  const char *v4;
  _DWORD *v5;
  void *v6;

  v3 = *(_BYTE **)(a3 + 8);
  if (result
    && (v4 = (const char *)result, v5 = *(_DWORD **)a3, (result = (uint64_t)_xpc_dictionary_unpack_value(a2)) != 0))
  {
    v6 = (void *)result;
    _xpc_dictionary_insert(v5, v4, (__objc2_class **)result);
    xpc_release(v6);
    return 1;
  }
  else
  {
    *v3 = 0;
  }
  return result;
}

xpc_object_t _xpc_dictionary_unpack_value(uint64_t a1)
{
  unsigned int *v2;
  unsigned int v3;
  int depth;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  xpc_object_t v7;

  v2 = (unsigned int *)_xpc_graph_deserializer_read(a1, 4uLL);
  if (!v2)
    return 0;
  v3 = *v2;
  depth = _xpc_graph_deserializer_get_depth(a1);
  if (!_xpc_class_id_valid(v3))
  {
    if (_xpc_class_id_from_wire_valid(v3))
    {
      v7 = xpc_null_create();
      if (_xpc_graph_deserializer_skip_value(a1, v3))
        return v7;
      else
        return 0;
    }
    return 0;
  }
  if ((v3 == 57344 || v3 == 0x10000 || v3 == 61440) && !_xpc_graph_deserializer_enter_container(a1))
  {
    v6 = 0;
  }
  else
  {
    v5 = (uint64_t (*)(uint64_t))_xpc_deserialize_from_wire_id(v3);
    v6 = v5(a1);
  }
  _xpc_graph_deserializer_restore_depth(a1, depth);
  return (xpc_object_t)v6;
}

uint64_t _xpc_dictionary_copy_apply(uint64_t a1, _DWORD *a2)
{
  __objc2_class **v4;
  const char *v5;

  v4 = (__objc2_class **)xpc_copy(*(xpc_object_t *)(a1 + 16));
  v5 = (const char *)(a1 + 32);
  if ((*(_DWORD *)(a1 + 24) - 1) <= 1)
    v5 = *(const char **)v5;
  _xpc_dictionary_insert(a2, v5, v4);
  xpc_release(v4);
  return 1;
}

const char *_xpc_dictionary_apply_node_f_wire_apply(const char *result, uint64_t a2, uint64_t *a3)
{
  const char *v4;
  OSQueueHead *v5;
  uint64_t (*v6)(_QWORD *, uint64_t);
  uint64_t v7;
  _QWORD v8[5];

  if (result)
  {
    v4 = result;
    v5 = (OSQueueHead *)*a3;
    v6 = (uint64_t (*)(_QWORD *, uint64_t))a3[1];
    v7 = a3[2];
    if (_xpc_dictionary_look_up_table(*a3, result))
    {
      return (const char *)_skip_id_and_value(a2);
    }
    else
    {
      result = (const char *)_xpc_dictionary_unpack_value_and_vend(v5, a2);
      if (result)
      {
        v8[4] = v4;
        v8[3] = 2;
        v8[0] = 0;
        v8[1] = 0;
        v8[2] = result;
        return (const char *)v6(v8, v7);
      }
    }
  }
  return result;
}

unint64_t _xpc_dictionary_look_up_table(uint64_t a1, const char *a2)
{
  unint64_t v3;
  const char *v4;

  v3 = a1 + 8 * _hash_bucket(a2) + 32;
  do
  {
    v3 = *(_QWORD *)v3;
    if (!v3)
      break;
    v4 = (const char *)(v3 + 32);
    if ((*(_DWORD *)(v3 + 24) - 1) <= 1)
      v4 = *(const char **)v4;
  }
  while (strcmp(a2, v4));
  return v3;
}

xpc_object_t _xpc_dictionary_unpack_value_and_vend(OSQueueHead *a1, uint64_t a2)
{
  xpc_object_t v3;
  _QWORD *v4;

  v3 = _xpc_dictionary_unpack_value(a2);
  if (v3)
  {
    v4 = _xpc_alloc(0x10uLL);
    v4[1] = v3;
    OSAtomicEnqueue(a1 + 14, v4, 0);
  }
  return v3;
}

BOOL _skip_id_and_value(uint64_t a1)
{
  int *v2;
  unsigned int v3;

  v2 = (int *)_xpc_graph_deserializer_read(a1, 4uLL);
  if (v2 && (v3 = *v2, *v2 != 122880) && _xpc_class_id_from_wire_valid(*v2))
    return _xpc_graph_deserializer_skip_value(a1, v3);
  else
    return 0;
}

unint64_t _hash_bucket(const char *a1)
{
  char v2;
  unsigned __int8 *v3;
  unint64_t v4;
  int v5;

  if (!strcmp(a1, "XPCErrorDescription"))
    return 0;
  v2 = *a1;
  if (!*a1)
    return 5;
  v3 = (unsigned __int8 *)(a1 + 1);
  v4 = 5381;
  do
  {
    v4 = 33 * v4 + v2;
    v5 = *v3++;
    v2 = v5;
  }
  while (v5);
  return v4 % 7;
}

BOOL _xpc_dictionary_look_up_wire_apply(char *__s2, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  _BYTE *v5;

  if (__s2)
  {
    v4 = *(_QWORD *)(a3 + 8);
    v5 = *(_BYTE **)(a3 + 16);
    if (strcmp(*(const char **)a3, __s2))
      return _skip_id_and_value(a2);
    _xpc_graph_deserializer_init_clone(v4, a2);
    *v5 = 1;
  }
  return 0;
}

uint64_t vprocmgr_lookup_vproc()
{
  return 0;
}

__objc2_class **vproc_retain()
{
  return &_xpc_BOOL_false;
}

__objc2_class **_vproc_set_global_on_demand(int a1)
{
  xpc_object_t v2;
  uint64_t v3;
  __objc2_class **v4;
  xpc_object_t object;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "type", 7uLL);
  xpc_dictionary_set_uint64(v2, "handle", 0);
  if (a1)
    v3 = 806;
  else
    v3 = 807;
  object = 0;
  if (_xpc_domain_routine(v3, v2, &object))
  {
    v4 = &_xpc_BOOL_false;
  }
  else
  {
    xpc_release(object);
    v4 = 0;
  }
  xpc_release(v2);
  return v4;
}

__objc2_class **_vproc_kickstart_by_label()
{
  return &_xpc_BOOL_false;
}

void _vprocmgr_log_drain()
{
  while (1)
    sleep(0xFFFFFFFF);
}

__objc2_class **_vprocmgr_log_forward()
{
  return &_xpc_BOOL_false;
}

__objc2_class **_vprocmgr_move_subset_to_user()
{
  return &_xpc_BOOL_false;
}

uint64_t _vproc_grab_subset()
{
  return 46;
}

__objc2_class **_vproc_post_fork_ping()
{
  return &_xpc_BOOL_false;
}

__objc2_class **_vprocmgr_switch_to_session()
{
  return &_xpc_BOOL_false;
}

uint64_t _vproc_standby_count()
{
  return 0;
}

uint64_t _vproc_standby_timeout()
{
  return 0;
}

uint64_t _vproc_transaction_count_for_pid()
{
  return 5;
}

uint64_t _vproc_pid_is_managed()
{
  return 0;
}

uint64_t _spawn_via_launchd()
{
  return 0xFFFFFFFFLL;
}

__objc2_class **vproc_swap_integer(uint64_t a1, unsigned int a2, int64_t *a3, int64_t *a4)
{
  uint64_t v7;
  uint64_t (*v8)();
  xpc_object_t request;
  void *v10;
  xpc_object_t xdict;

  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 16) == -1)
    v7 = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 24);
  else
    v7 = _os_alloc_once();
  if (a2 != 2)
  {
    if (a2 == 5)
    {
      v8 = 0;
      *a4 = *(unsigned __int8 *)(v7 + 3);
      return (__objc2_class **)v8;
    }
    request = _vproc_create_request();
    v10 = request;
    if (a3)
    {
      xpc_dictionary_set_uint64(request, "ingsk", a2);
      xpc_dictionary_set_BOOL(v10, "set", 1);
      xpc_dictionary_set_int64(v10, "in", *a3);
    }
    if (a4)
    {
      xpc_dictionary_set_uint64(v10, "outgsk", a2);
      xpc_dictionary_set_BOOL(v10, "get", 1);
      xdict = 0;
      if (!_xpc_bootstrap_routine(301, v10, &xdict))
      {
        *a4 = xpc_dictionary_get_int64(xdict, "out");
LABEL_16:
        xpc_release(xdict);
        v8 = 0;
        goto LABEL_17;
      }
    }
    else
    {
      xdict = 0;
      if (!_xpc_bootstrap_routine(301, v10, &xdict))
        goto LABEL_16;
    }
    v8 = vproc_swap_integer;
LABEL_17:
    xpc_release(v10);
    return (__objc2_class **)v8;
  }
  if (a3)
    return _vproc_set_global_on_demand(*a3 != 0);
  return &_xpc_BOOL_false;
}

xpc_object_t _vproc_create_request()
{
  xpc_object_t v0;

  v0 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v0, "type", 7uLL);
  xpc_dictionary_set_uint64(v0, "handle", 0);
  xpc_dictionary_set_BOOL(v0, "self", 1);
  return v0;
}

uint64_t (*vproc_swap_complex(uint64_t a1, unsigned int a2, void *a3, _QWORD *a4))()
{
  xpc_object_t request;
  void *v8;
  int v9;
  _launch_data *value;
  _launch_data *v11;
  launch_data_type_t type;
  xpc_object_t v13;
  uint64_t (*v14)();
  xpc_object_t xdict;

  request = _vproc_create_request();
  v8 = request;
  if (a3)
  {
    xpc_dictionary_set_uint64(request, "ingsk", a2);
    xpc_dictionary_set_BOOL(v8, "set", 1);
    xpc_dictionary_set_value(v8, "in", a3);
  }
  if (a4)
  {
    xpc_dictionary_set_uint64(v8, "outgsk", a2);
    xpc_dictionary_set_BOOL(v8, "get", 1);
  }
  xdict = 0;
  v9 = _xpc_bootstrap_routine(301, v8, &xdict);
  if (v9 == 135)
    goto LABEL_14;
  if (v9 == 45)
  {
    syslog(3, "Swap operation not supported: %d", a2);
LABEL_14:
    v14 = vproc_swap_complex;
    goto LABEL_18;
  }
  if (v9)
  {
    _os_assumes_log();
    goto LABEL_14;
  }
  if (a4)
  {
    value = (_launch_data *)xpc_dictionary_get_value(xdict, "out");
    if (value
      && ((v11 = value, type = launch_data_get_type(value), type == LAUNCH_DATA_STRING) || type == LAUNCH_DATA_DICTIONARY))
    {
      v13 = xpc_retain(v11);
      v14 = 0;
      *a4 = v13;
    }
    else
    {
      v14 = vproc_swap_complex;
    }
  }
  else
  {
    v14 = 0;
  }
  xpc_release(xdict);
LABEL_18:
  xpc_release(v8);
  return v14;
}

uint64_t (*vproc_swap_string(char *a1, unsigned int a2, char *string, char **a4))()
{
  uint64_t (*result)();
  const char *string_ptr;
  xpc_object_t object;

  if (string)
  {
    a1 = (char *)xpc_string_create(string);
    string = a1;
  }
  object = 0;
  if (!a4)
    return vproc_swap_complex((uint64_t)a1, a2, string, 0);
  result = vproc_swap_complex((uint64_t)a1, a2, string, &object);
  if (!result)
  {
    if (xpc_get_type(object) == (xpc_type_t)OS_xpc_string)
    {
      string_ptr = xpc_string_get_string_ptr(object);
      *a4 = _xpc_strdup(string_ptr);
    }
    xpc_release(object);
    return 0;
  }
  return result;
}

__objc2_class **_vproc_send_signal_by_label(const char *a1, int a2)
{
  xpc_object_t v4;
  int v5;
  int v6;
  char *v7;
  __objc2_class **v8;
  xpc_object_t object;

  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v4, "type", 7uLL);
  xpc_dictionary_set_uint64(v4, "handle", 0);
  xpc_dictionary_set_int64(v4, "signal", a2);
  xpc_dictionary_set_string(v4, "name", a1);
  object = 0;
  v5 = _xpc_domain_routine(812, v4, &object);
  if (v5)
  {
    v6 = v5;
    v7 = xpc_strerror(v5);
    syslog(3, "Could not signal service: %d: %s", v6, v7);
    v8 = &_xpc_BOOL_false;
  }
  else
  {
    xpc_release(object);
    v8 = 0;
  }
  xpc_release(v4);
  return v8;
}

__objc2_class **_vprocmgr_detach_from_console()
{
  return &_xpc_BOOL_false;
}

void _vproc_transaction_try_exit()
{
  os_unfair_lock_s *v0;

  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 16) == -1)
    v0 = *(os_unfair_lock_s **)(MEMORY[0x1E0C87FA0] + 24);
  else
    v0 = (os_unfair_lock_s *)_os_alloc_once();
  os_unfair_lock_lock_with_options();
  if (!v0[43]._os_unfair_lock_opaque)
    _exit(0);
  os_unfair_lock_unlock(v0 + 44);
}

uint64_t _vproc_transaction_count()
{
  return 0;
}

__objc2_class **_vprocmgr_init()
{
  return &_xpc_BOOL_false;
}

__objc2_class **_vproc_get_last_exit_status(_DWORD *a1)
{
  __objc2_class **result;
  int64_t v3;

  v3 = 0;
  result = vproc_swap_integer((uint64_t)a1, 1u, 0, &v3);
  if (!result)
    *a1 = v3;
  return result;
}

vproc_transaction_t vproc_transaction_begin(vproc_t virtual_proc)
{
  _xpc_transaction_begin();
  return vproc_transaction_begin;
}

vproc_standby_t vproc_standby_begin(vproc_t virtual_proc)
{
  return vproc_standby_begin;
}

uint64_t bootstrap_info()
{
  return 46;
}

int64_t bootstrap_register2(int a1, const char *a2, mach_port_name_t name, uint64_t a4)
{
  int64_t v7;
  xpc_object_t request;
  xpc_object_t object;

  if (_xpc_mach_port_make_send(name) && _xpc_mach_port_retain_send(name))
    return 17;
  request = _bootstrap_create_request();
  xpc_dictionary_set_string(request, "name", a2);
  xpc_dictionary_set_mach_send(request, "port", name);
  xpc_dictionary_set_uint64(request, "flags", a4);
  object = 0;
  v7 = _xpc_bootstrap_routine(204, request, &object);
  if (object)
    xpc_release(object);
  if (_xpc_mach_port_release(name))
    _os_assumes_log();
  xpc_release(request);
  return v7;
}

xpc_object_t _bootstrap_create_request()
{
  xpc_object_t v0;

  v0 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v0, "type", 7uLL);
  xpc_dictionary_set_uint64(v0, "handle", 0);
  return v0;
}

uint64_t bootstrap_look_up2(uint64_t a1, char *a2, mach_port_name_t *a3, int a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C874D8];
  v6[0] = 0;
  v6[1] = 0;
  return bootstrap_look_up3(a1, a2, a3, a4, (const unsigned __int8 *)v6, a5);
}

uint64_t bootstrap_look_up3(uint64_t a1, char *a2, mach_port_name_t *a3, int a4, const unsigned __int8 *a5, uint64_t a6)
{
  xpc_object_t request;
  int v12;
  unsigned int *value;
  unsigned int *v14;
  mach_port_name_t right;
  int v16;
  unsigned int v17;
  uint64_t v18;
  xpc_object_t xdict;

  request = _bootstrap_create_request();
  xpc_dictionary_set_string(request, "name", a2);
  xpc_dictionary_set_int64(request, "targetpid", a4);
  xpc_dictionary_set_uuid(request, "instance", a5);
  xpc_dictionary_set_uint64(request, "flags", a6);
  xdict = 0;
  v12 = _xpc_bootstrap_routine_authenticate(207, request, &xdict);
  if (xdict)
  {
    value = (unsigned int *)xpc_dictionary_get_value(xdict, "port");
    if (value)
    {
      v14 = value;
      if (xpc_get_type(value) == (xpc_type_t)OS_xpc_mach_send)
      {
        right = xpc_mach_send_get_right(v14);
        v16 = _xpc_mach_port_retain_send(right);
        if (v16 != 19 && v16)
        {
          _os_assumes_log();
          v12 = 17;
        }
        else
        {
          *a3 = right;
        }
      }
    }
    xpc_release(xdict);
  }
  xpc_release(request);
  if (v12 == 141)
    v17 = 268435459;
  else
    v17 = v12;
  if (v17 == 124)
    v18 = 1102;
  else
    v18 = v17;
  if (!(_DWORD)v18)
    _launch_report_service_lookup(a2);
  return v18;
}

int64_t bootstrap_check_in2(uint64_t a1, const char *a2, _DWORD *a3, uint64_t a4)
{
  __int128 v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C874D8];
  v5 = 0uLL;
  return bootstrap_check_in3(a1, a2, a3, &v5, a4);
}

int64_t bootstrap_check_in3(uint64_t a1, const char *a2, _DWORD *a3, _OWORD *a4, uint64_t a5)
{
  xpc_object_t request;
  int64_t v10;
  const uint8_t *uuid;
  xpc_object_t xdict;

  request = _bootstrap_create_request();
  xpc_dictionary_set_string(request, "name", a2);
  xpc_dictionary_set_uint64(request, "flags", a5);
  xdict = 0;
  v10 = _xpc_bootstrap_routine_check_in(206, request, &xdict);
  if (xdict)
  {
    *a3 = xpc_dictionary_extract_mach_recv(xdict, "port");
    uuid = xpc_dictionary_get_uuid(xdict, "instance");
    if (uuid)
      *a4 = *(_OWORD *)uuid;
    xpc_release(xdict);
  }
  xpc_release(request);
  return v10;
}

uint64_t bootstrap_look_up_per_user(uint64_t a1, const char *a2, unsigned int a3, _DWORD *a4)
{
  xpc_object_t v7;
  void *v8;
  int64_t v9;
  char *v11;
  xpc_object_t object;

  if ((xpc_user_sessions_enabled() & 1) == 0)
  {
    v11 = _xpc_asprintf("Attempt to do a per-user lookup, but user sessions are not enabled.");
    _xpc_api_misuse(v11);
  }
  v7 = xpc_dictionary_create(0, 0, 0);
  if (!a2)
    return 45;
  v8 = v7;
  xpc_dictionary_set_uint64(v7, "type", 2uLL);
  xpc_dictionary_set_uint64(v8, "handle", a3);
  xpc_dictionary_set_string(v8, "name", a2);
  xpc_dictionary_set_uint64(v8, "flags", 0x200uLL);
  object = 0;
  v9 = _xpc_bootstrap_routine(207, v8, &object);
  if (!(_DWORD)v9)
  {
    *a4 = _xpc_dictionary_extract_mach_send(object, "port");
    xpc_release(object);
  }
  xpc_release(v8);
  return v9;
}

void bootstrap_lookup_children()
{
  char __str[160];

  snprintf(__str, 0xA0uLL, "Unimplemented routine: %s", "bootstrap_lookup_children");
  qword_1F0460B90 = (uint64_t)__str;
  __break(1u);
}

int64_t bootstrap_get_root(uint64_t a1, _DWORD *a2)
{
  xpc_object_t request;
  int64_t v4;
  xpc_object_t object;

  request = _bootstrap_create_request();
  object = 0;
  v4 = _xpc_bootstrap_routine(211, request, &object);
  if (object)
  {
    *a2 = _xpc_dictionary_extract_mach_send(object, "rootport");
    xpc_release(object);
  }
  xpc_release(request);
  return v4;
}

kern_return_t bootstrap_create_server(mach_port_t bp, cmd_t server_cmd, uid_t server_uid, BOOLean_t on_demand, mach_port_t *server_port)
{
  xpc_object_t request;
  kern_return_t v10;
  xpc_object_t object;

  request = _bootstrap_create_request();
  xpc_dictionary_set_string(request, "cmd", server_cmd);
  xpc_dictionary_set_uint64(request, "uid", server_uid);
  xpc_dictionary_set_BOOL(request, "ondemand", on_demand != 0);
  object = 0;
  v10 = _xpc_bootstrap_routine(200, request, &object);
  if (object)
  {
    *server_port = _xpc_dictionary_extract_mach_send(object, "serverport");
    xpc_release(object);
  }
  xpc_release(request);
  return v10;
}

kern_return_t bootstrap_subset(mach_port_t bp, mach_port_t requestor_port, mach_port_t *subset_port)
{
  xpc_object_t request;
  kern_return_t v6;
  xpc_object_t object;

  request = _bootstrap_create_request();
  if (_xpc_mach_port_make_send(requestor_port))
    return 17;
  xpc_dictionary_set_mach_send(request, "reqport", requestor_port);
  object = 0;
  v6 = _xpc_bootstrap_routine(201, request, &object);
  if (object)
  {
    *subset_port = _xpc_dictionary_extract_mach_send(object, "subsetport");
    xpc_release(object);
  }
  if (_xpc_mach_port_release(requestor_port))
    _os_assumes_log();
  xpc_release(request);
  return v6;
}

kern_return_t bootstrap_unprivileged(mach_port_t bp, mach_port_t *unpriv_port)
{
  return 46;
}

kern_return_t bootstrap_parent(mach_port_t bp, mach_port_t *parent_port)
{
  xpc_object_t request;
  kern_return_t v5;
  xpc_object_t object;

  request = _bootstrap_create_request();
  xpc_dictionary_set_mach_send(request, "port", bp);
  object = 0;
  v5 = _xpc_bootstrap_routine(203, request, &object);
  if (object)
  {
    *parent_port = _xpc_dictionary_extract_mach_send(object, "parent");
    xpc_release(object);
  }
  xpc_release(request);
  return v5;
}

kern_return_t bootstrap_register(mach_port_t bp, name_t service_name, mach_port_t sp)
{
  return bootstrap_register2(bp, service_name, sp, 0);
}

kern_return_t bootstrap_create_service(mach_port_t bp, name_t service_name, mach_port_t *sp)
{
  xpc_object_t request;
  kern_return_t v6;
  xpc_object_t object;

  request = _bootstrap_create_request();
  xpc_dictionary_set_string(request, "name", service_name);
  object = 0;
  v6 = _xpc_bootstrap_routine(205, request, &object);
  if (object)
  {
    *sp = _xpc_dictionary_extract_mach_send(object, "port");
    xpc_release(object);
  }
  xpc_release(request);
  return v6;
}

kern_return_t bootstrap_check_in(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  __int128 v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C874D8];
  v4 = 0uLL;
  return bootstrap_check_in3(*(uint64_t *)&bp, service_name, sp, &v4, 0);
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C874D8];
  v4[0] = 0;
  v4[1] = 0;
  return bootstrap_look_up3(*(uint64_t *)&bp, (char *)service_name, sp, 0, (const unsigned __int8 *)v4, 0);
}

kern_return_t bootstrap_status(mach_port_t bp, name_t service_name, bootstrap_status_t *service_active)
{
  return 46;
}

const char *__cdecl bootstrap_strerror(kern_return_t r)
{
  const char *result;

  switch(r)
  {
    case 1100:
      result = "Permission denied";
      break;
    case 1101:
      result = "Service name already exists";
      break;
    case 1102:
      result = "Unknown service name";
      break;
    case 1103:
      result = "Service is already active";
      break;
    case 1104:
      result = "Too many lookups were requested in one request";
      break;
    case 1105:
      result = "Out of memory";
      break;
    default:
      if (r)
        result = mach_error_string(r);
      else
        result = "Success";
      break;
  }
  return result;
}

BOOL _xpc_double_equal(uint64_t a1, uint64_t a2)
{
  return *(double *)(a1 + 24) == *(double *)(a2 + 24);
}

uint64_t _xpc_double_hash(uint64_t a1)
{
  return _xpc_hash((_BYTE *)(a1 + 24), 8);
}

uint64_t _xpc_double_desc(uint64_t a1, uint64_t a2)
{
  unsigned int v3;
  int v4;
  char __str[16];
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C874D8];
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  *(_OWORD *)__str = 0u;
  v7 = 0u;
  v3 = snprintf(__str, 0x80uLL, "%f", *(double *)(a1 + 24));
  if (v3 >= 0x7F)
    v4 = 127;
  else
    v4 = v3;
  return _xpc_serializer_append(a2, __str, (v4 + 1), 0);
}

uint64_t _xpc_double_debug_desc(double *a1, uint64_t a2)
{
  unsigned int v3;
  int v4;
  char __str[16];
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C874D8];
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  *(_OWORD *)__str = 0u;
  v7 = 0u;
  v3 = snprintf(__str, 0x80uLL, "<%s: %p>: %f", "double", a1, a1[3]);
  if (v3 >= 0x7F)
    v4 = 127;
  else
    v4 = v3;
  return _xpc_serializer_append(a2, __str, (v4 + 1), 0);
}

uint64_t _xpc_double_debug(uint64_t a1, char *__str, size_t __size)
{
  return snprintf(__str, __size, ", value = %f", *(double *)(a1 + 24));
}

uint64_t _xpc_double_serialize(uint64_t a1, uint64_t a2)
{
  uint64_t v5;
  int __src;

  __src = 20480;
  _xpc_serializer_append(a2, &__src, 4uLL, 1);
  v5 = *(_QWORD *)(a1 + 24);
  return _xpc_serializer_append(a2, &v5, 8uLL, 1);
}

uint64_t _xpc_double_deserialize(uint64_t a1)
{
  uint64_t result;
  uint64_t v2;

  result = _xpc_graph_deserializer_read(a1, 8uLL);
  if (result)
  {
    v2 = *(_QWORD *)result;
    result = _xpc_base_create();
    *(_QWORD *)(result + 24) = v2;
    *(_DWORD *)(result + 16) |= 1u;
    *(_DWORD *)(result + 20) = 8;
  }
  return result;
}

uint64_t _xpc_double_wire_length()
{
  return 8;
}

uint64_t _xpc_double_set_value(uint64_t result, double a2)
{
  *(double *)(result + 24) = a2;
  return result;
}

BOOL _xpc_double_get_wire_value(uint64_t a1, _QWORD *a2)
{
  _QWORD *v3;

  v3 = (_QWORD *)_xpc_graph_deserializer_read(a1, 8uLL);
  if (v3)
    *a2 = *v3;
  return v3 != 0;
}

xpc_object_t xpc_double_create(double value)
{
  xpc_object_t result;

  result = (xpc_object_t)_xpc_base_create();
  *((_DWORD *)result + 5) = 8;
  *((double *)result + 3) = value;
  return result;
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  __objc2_class *type;
  double result;

  type = (__objc2_class *)xpc_get_type(xdouble);
  result = 0.0;
  if (type == OS_xpc_double)
    return *((double *)xdouble + 3);
  return result;
}

BOOL _xpc_int64_equal(void *a1, void *a2)
{
  int64_t value;

  value = xpc_int64_get_value(a1);
  return value == xpc_int64_get_value(a2);
}

uint64_t _xpc_int64_hash(void *a1)
{
  int64_t value;

  value = xpc_int64_get_value(a1);
  return _xpc_hash(&value, 8);
}

uint64_t _xpc_int64_desc(void *a1, uint64_t a2)
{
  int64_t value;
  unsigned int v4;
  int v5;
  char __str[16];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C874D8];
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  *(_OWORD *)__str = 0u;
  v8 = 0u;
  value = xpc_int64_get_value(a1);
  v4 = snprintf(__str, 0x80uLL, "%lli", value);
  if (v4 >= 0x7F)
    v5 = 127;
  else
    v5 = v4;
  return _xpc_serializer_append(a2, __str, (v5 + 1), 0);
}

uint64_t _xpc_int64_debug_desc(void *a1, uint64_t a2)
{
  int64_t value;
  unsigned int v5;
  int v6;
  char __str[16];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C874D8];
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  *(_OWORD *)__str = 0u;
  v9 = 0u;
  value = xpc_int64_get_value(a1);
  v5 = snprintf(__str, 0x80uLL, "<%s: %p>: %lli", "int64", a1, value);
  if (v5 >= 0x7F)
    v6 = 127;
  else
    v6 = v5;
  return _xpc_serializer_append(a2, __str, (v6 + 1), 0);
}

uint64_t _xpc_int64_debug(void *a1, char *a2, size_t a3)
{
  int64_t value;

  value = xpc_int64_get_value(a1);
  return snprintf(a2, a3, ", value = %lli", value);
}

uint64_t _xpc_int64_serialize(void *a1, uint64_t a2)
{
  int64_t value;
  int __src;

  __src = 12288;
  _xpc_serializer_append(a2, &__src, 4uLL, 1);
  value = xpc_int64_get_value(a1);
  return _xpc_serializer_append(a2, &value, 8uLL, 1);
}

unint64_t _xpc_int64_deserialize(uint64_t a1)
{
  unint64_t result;
  uint64_t v2;

  result = _xpc_graph_deserializer_read(a1, 8uLL);
  if (result)
  {
    v2 = *(_QWORD *)result;
    result = _xpc_int64_create_tagged(*(_QWORD *)result);
    if (!result)
    {
      result = _xpc_base_create();
      *(_QWORD *)(result + 24) = v2;
      *(_DWORD *)(result + 16) |= 1u;
      *(_DWORD *)(result + 20) = 8;
    }
  }
  return result;
}

uint64_t _xpc_int64_wire_length()
{
  return 8;
}

void _xpc_int64_set_value()
{
  char *v0;

  v0 = _xpc_asprintf("This function, long deprecated, is no longer supported. Please stop using launch_data (or at least switch to launch_data_new_integer).");
  _xpc_api_misuse(v0);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  xpc_object_t result;

  result = (xpc_object_t)_xpc_int64_create_tagged(value);
  if (!result)
  {
    result = (xpc_object_t)_xpc_base_create();
    *((_DWORD *)result + 5) = 8;
    *((_QWORD *)result + 3) = value;
  }
  return result;
}

unint64_t _xpc_int64_create_tagged(uint64_t a1)
{
  unint64_t result;
  unint64_t v3;

  if ((unint64_t)(a1 + 0x7FFFFFFFFFFFFLL) > 0xFFFFFFFFFFFFELL || *MEMORY[0x1E0DE7C50] == 0)
    return 0;
  result = (8 * (a1 & 0xFFFFFFFFFFFFFLL)) | 0x8280000000000007;
  v3 = *MEMORY[0x1E0DE7C58] ^ result;
  if ((~v3 & 0xC000000000000007) != 0)
    return v3 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E0DE7C48] + (v3 & 7));
  return result;
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  int64_t v6;
  int64_t v7;

  if (((unint64_t)xint & 0x8000000000000000) == 0)
    goto LABEL_12;
  v2 = 0;
  v3 = *MEMORY[0x1E0DE7C58];
  if ((~(unint64_t)xint & 0xC000000000000007) == 0)
    v3 = 0;
  v4 = v3 ^ (unint64_t)xint;
  v5 = v4 & 7;
  do
  {
    if (v5 == *(unsigned __int8 *)(MEMORY[0x1E0DE7C48] + v2))
      break;
    ++v2;
  }
  while (v2 != 7);
  if ((~(_BYTE)v2 & 7) == 0 && ((v2 | v4) & 0x7F80000000000000) == 0x280000000000000)
  {
    v6 = (uint64_t)(v4 << 9) >> 12;
    v7 = (uint64_t)(2 * v4) >> 4;
    if (v5 == 7)
      return v6;
    else
      return v7;
  }
  else
  {
LABEL_12:
    if (xpc_get_type(xint) == (xpc_type_t)OS_xpc_int64)
      return *((_QWORD *)xint + 3);
    else
      return 0;
  }
}

BOOL _xpc_null_equal(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t _xpc_null_hash()
{
  return 0x804201026298;
}

uint64_t _xpc_null_desc(int a1, uint64_t a2)
{
  char __src[5];
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[27];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C874D8];
  memset(v10, 0, sizeof(v10));
  v9 = 0u;
  v8 = 0u;
  v7 = 0u;
  v6 = 0u;
  v5 = 0u;
  v4 = 0u;
  strcpy(__src, "NULL");
  return _xpc_serializer_append(a2, __src, 5uLL, 0);
}

uint64_t _xpc_null_debug_desc(const void *a1, uint64_t a2)
{
  unsigned int v3;
  int v4;
  char __str[16];
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C874D8];
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  *(_OWORD *)__str = 0u;
  v7 = 0u;
  v3 = snprintf(__str, 0x80uLL, "<%s: %p>: null-object", "null", a1);
  if (v3 >= 0x7F)
    v4 = 127;
  else
    v4 = v3;
  return _xpc_serializer_append(a2, __str, (v4 + 1), 0);
}

uint64_t _xpc_null_debug(int a1, char *__str, size_t __size)
{
  return snprintf(__str, __size, ", (null)");
}

uint64_t _xpc_null_serialize(int a1, uint64_t a2)
{
  int __src;

  __src = 4096;
  return _xpc_serializer_append(a2, &__src, 4uLL, 1);
}

__objc2_class **_xpc_null_deserialize()
{
  return &_xpc_null;
}

uint64_t _xpc_null_wire_length()
{
  return 0;
}

xpc_object_t xpc_null_create(void)
{
  return &_xpc_null;
}

BOOL _xpc_string_equal(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 24) == *(_QWORD *)(a2 + 24)
      && strcmp(*(const char **)(a1 + 32), *(const char **)(a2 + 32)) == 0;
}

uint64_t _xpc_string_hash(uint64_t a1)
{
  return _xpc_hash(*(_BYTE **)(a1 + 32), *(_QWORD *)(a1 + 24) + 1);
}

uint64_t _xpc_string_desc(uint64_t a1, uint64_t a2)
{
  return _xpc_serializer_append(a2, *(void **)(a1 + 32), *(_QWORD *)(a1 + 24) + 1, 0);
}

uint64_t _xpc_string_debug_desc(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  size_t v5;
  char __str[16];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C874D8];
  v9 = 0u;
  v10 = 0u;
  *(_OWORD *)__str = 0u;
  v8 = 0u;
  v4 = snprintf(__str, 0x40uLL, "<%s: %p> { length = %lu, contents = \"", "string", (const void *)a1, *(_QWORD *)(a1 + 24));
  if (v4 >= 0x3F)
    v5 = 63;
  else
    v5 = v4;
  _xpc_serializer_append(a2, __str, v5, 0);
  _xpc_serializer_append(a2, *(void **)(a1 + 32), *(_QWORD *)(a1 + 24), 0);
  return _xpc_serializer_append(a2, "\" }", 4uLL, 0);
}

uint64_t _xpc_string_debug(uint64_t a1, char *__str, size_t __size)
{
  return snprintf(__str, __size, ", str = %s, len = %lu", *(const char **)(a1 + 32), *(_QWORD *)(a1 + 24));
}

uint64_t _xpc_string_serialize(uint64_t a1, uint64_t a2)
{
  int v5;
  int __src;

  __src = 36864;
  _xpc_serializer_append(a2, &__src, 4uLL, 1);
  v5 = *(_DWORD *)(a1 + 24) + 1;
  _xpc_serializer_append(a2, &v5, 4uLL, 1);
  return _xpc_serializer_append(a2, *(void **)(a1 + 32), *(_QWORD *)(a1 + 24) + 1, 1);
}

uint64_t _xpc_string_deserialize(uint64_t a1)
{
  int wire_value;
  uint64_t result;
  uint64_t v3;
  size_t v4;
  char *__s1;
  unint64_t v6;

  __s1 = 0;
  wire_value = _xpc_string_get_wire_value(a1, (uint64_t *)&__s1, &v6);
  result = 0;
  if (wire_value)
  {
    result = (uint64_t)_xpc_try_strdup(__s1);
    if (result)
    {
      v3 = result;
      v4 = strlen((const char *)result);
      result = _xpc_string_create(v3, v4);
      *(_DWORD *)(result + 16) |= 1u;
    }
  }
  return result;
}

void _xpc_string_dispose(uint64_t a1)
{
  free(*(void **)(a1 + 32));
}

const char *_xpc_string_set_value(uint64_t a1, const char *a2)
{
  const char *result;
  const char *v5;
  unint64_t v6;
  char *v7;

  free(*(void **)(a1 + 32));
  *(_QWORD *)(a1 + 32) = 0;
  result = _xpc_try_strdup(a2);
  if (result)
  {
    v5 = result;
    result = (const char *)strlen(result);
    *(_QWORD *)(a1 + 24) = result;
    *(_QWORD *)(a1 + 32) = v5;
    v6 = (result & 0xFFFFFFFC) + 8;
    if ((unint64_t)result > v6)
    {
      v7 = _xpc_asprintf("Unreasonably large string");
      _xpc_api_misuse(v7);
    }
    *(_DWORD *)(a1 + 20) = v6;
  }
  return result;
}

uint64_t _xpc_string_get_wire_value(uint64_t a1, uint64_t *a2, unint64_t *a3)
{
  uint64_t result;
  unint64_t v7;

  result = _xpc_graph_deserializer_read(a1, 4uLL);
  if (result)
  {
    v7 = *(unsigned int *)result;
    if (!(_DWORD)v7)
      return 0;
    result = _xpc_graph_deserializer_read(a1, v7);
    if (!result)
      return result;
    if (!*(_BYTE *)(result + (v7 - 1)))
    {
      *a2 = result;
      *a3 = v7;
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t xpc_string_create_no_copy(const char *a1)
{
  size_t v2;

  v2 = strlen(a1);
  return _xpc_string_create((uint64_t)a1, v2);
}

uint64_t _xpc_string_create(uint64_t a1, unint64_t a2)
{
  uint64_t result;
  unint64_t v5;
  char *v6;

  result = _xpc_base_create();
  v5 = (a2 & 0xFFFFFFFC) + 8;
  if (v5 < a2)
  {
    v6 = _xpc_asprintf("Unreasonably large string");
    _xpc_api_misuse(v6);
  }
  *(_DWORD *)(result + 20) = v5;
  *(_QWORD *)(result + 24) = a2;
  *(_QWORD *)(result + 32) = a1;
  return result;
}

xpc_object_t xpc_string_create_with_format(const char *fmt, ...)
{
  int v1;
  char *v3;
  va_list va;

  va_start(va, fmt);
  v3 = 0;
  v1 = vasprintf(&v3, fmt, va);
  return (xpc_object_t)_xpc_string_create((uint64_t)v3, v1);
}

xpc_object_t xpc_string_create_with_format_and_arguments(const char *fmt, va_list ap)
{
  int v2;
  char *v4;

  v4 = 0;
  v2 = vasprintf(&v4, fmt, ap);
  return (xpc_object_t)_xpc_string_create((uint64_t)v4, v2);
}

size_t xpc_string_get_length(xpc_object_t xstring)
{
  if (xpc_get_type(xstring) == (xpc_type_t)OS_xpc_string)
    return *((_QWORD *)xstring + 3);
  else
    return 0;
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  const char *result;

  if (xpc_get_type(xstring) != (xpc_type_t)OS_xpc_string)
    return 0;
  result = (const char *)*((_QWORD *)xstring + 4);
  if (result[*((_QWORD *)xstring + 3)])
  {
    _os_assumes_log();
    return 0;
  }
  return result;
}

xpc_object_t xpc_coalition_copy_info(uint64_t a1)
{
  uint64_t v1;
  xpc_object_t v2;
  xpc_object_t v4;

  if (!a1)
    return xpc_null_create();
  v1 = a1;
  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "type", 1uLL);
  xpc_dictionary_set_uint64(v2, "handle", 0);
  xpc_dictionary_set_uint64(v2, "cid", v1);
  v4 = 0;
  LODWORD(v1) = _xpc_domain_routine(829, v2, &v4);
  xpc_release(v2);
  if ((_DWORD)v1)
    return 0;
  else
    return v4;
}

uint64_t xpc_coalition_history_pipe_async(uint64_t a1)
{
  xpc_object_t v2;
  uint64_t v3;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "type", 1uLL);
  xpc_dictionary_set_uint64(v2, "handle", 0);
  v3 = _xpc_event_routine_async(830, v2, a1);
  xpc_release(v2);
  return v3;
}

BOOL _xpc_uint64_equal(void *a1, void *a2)
{
  uint64_t value;

  value = xpc_uint64_get_value(a1);
  return value == xpc_uint64_get_value(a2);
}

uint64_t _xpc_uint64_hash(void *a1)
{
  uint64_t value;

  value = xpc_uint64_get_value(a1);
  return _xpc_hash(&value, 8);
}

uint64_t _xpc_uint64_desc(void *a1, uint64_t a2)
{
  uint64_t value;
  unsigned int v4;
  int v5;
  char __str[16];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C874D8];
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  *(_OWORD *)__str = 0u;
  v8 = 0u;
  value = xpc_uint64_get_value(a1);
  v4 = snprintf(__str, 0x80uLL, "%llu", value);
  if (v4 >= 0x7F)
    v5 = 127;
  else
    v5 = v4;
  return _xpc_serializer_append(a2, __str, (v5 + 1), 0);
}

uint64_t _xpc_uint64_debug_desc(void *a1, uint64_t a2)
{
  uint64_t value;
  unsigned int v5;
  int v6;
  char __str[16];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C874D8];
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  *(_OWORD *)__str = 0u;
  v9 = 0u;
  value = xpc_uint64_get_value(a1);
  v5 = snprintf(__str, 0x80uLL, "<%s: %p>: %llu", "uint64", a1, value);
  if (v5 >= 0x7F)
    v6 = 127;
  else
    v6 = v5;
  return _xpc_serializer_append(a2, __str, (v6 + 1), 0);
}

uint64_t _xpc_uint64_debug(void *a1, char *a2, size_t a3)
{
  uint64_t value;

  value = xpc_uint64_get_value(a1);
  return snprintf(a2, a3, ", value = %llu", value);
}

uint64_t _xpc_uint64_serialize(void *a1, uint64_t a2)
{
  uint64_t value;
  int __src;

  __src = 0x4000;
  _xpc_serializer_append(a2, &__src, 4uLL, 1);
  value = xpc_uint64_get_value(a1);
  return _xpc_serializer_append(a2, &value, 8uLL, 1);
}

unint64_t _xpc_uint64_deserialize(uint64_t a1)
{
  unint64_t result;
  unint64_t v2;

  result = _xpc_graph_deserializer_read(a1, 8uLL);
  if (result)
  {
    v2 = *(_QWORD *)result;
    result = _xpc_uint64_create_tagged(*(_QWORD *)result);
    if (!result)
    {
      result = _xpc_base_create();
      *(_QWORD *)(result + 24) = v2;
      *(_DWORD *)(result + 16) |= 1u;
      *(_DWORD *)(result + 20) = 8;
    }
  }
  return result;
}

uint64_t _xpc_uint64_wire_length()
{
  return 8;
}

xpc_object_t xpc_uint64_create(uint64_t value)
{
  xpc_object_t result;

  result = (xpc_object_t)_xpc_uint64_create_tagged(value);
  if (!result)
  {
    result = (xpc_object_t)_xpc_base_create();
    *((_DWORD *)result + 5) = 8;
    *((_QWORD *)result + 3) = value;
  }
  return result;
}

unint64_t _xpc_uint64_create_tagged(unint64_t a1)
{
  unint64_t result;
  unint64_t v3;

  result = 0;
  if (!(a1 >> 52) && *MEMORY[0x1E0DE7C50])
  {
    result = (8 * a1) | 0x8200000000000007;
    v3 = *MEMORY[0x1E0DE7C58] ^ result;
    if ((~v3 & 0xC000000000000007) != 0)
      return v3 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E0DE7C48] + (v3 & 7));
  }
  return result;
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  BOOL v6;
  uint64_t v7;

  if (((unint64_t)xuint & 0x8000000000000000) == 0)
    goto LABEL_12;
  v2 = 0;
  v3 = *MEMORY[0x1E0DE7C58];
  if ((~(unint64_t)xuint & 0xC000000000000007) == 0)
    v3 = 0;
  v4 = v3 ^ (unint64_t)xuint;
  v5 = v4 & 7;
  do
  {
    if (v5 == *(unsigned __int8 *)(MEMORY[0x1E0DE7C48] + v2))
      break;
    ++v2;
  }
  while (v2 != 7);
  if ((~(_BYTE)v2 & 7) == 0 && ((v2 | v4) & 0x7F80000000000000) == 0x200000000000000)
  {
    v6 = v5 == 7;
    v7 = 0xFFFFFFFFFFFFFFFLL;
    if (v6)
      v7 = 0xFFFFFFFFFFFFFLL;
    return v7 & (v4 >> 3);
  }
  else
  {
LABEL_12:
    if (xpc_get_type(xuint) == (xpc_type_t)OS_xpc_uint64)
      return *((_QWORD *)xuint + 3);
    else
      return 0;
  }
}

xpc_object_t launch_copy_endpoints_properties_for_pid(int a1)
{
  xpc_object_t v1;
  void *v2;
  xpc_object_t value;
  xpc_object_t v4;

  v1 = _xpc_connection_copy_attrs(0, a1);
  if (!v1)
    return 0;
  v2 = v1;
  value = xpc_dictionary_get_value(v1, "XPCServiceEndpoints");
  if (value)
    v4 = xpc_copy(value);
  else
    v4 = 0;
  xpc_release(v2);
  return v4;
}

void _xpc_objc_main(void *a1)
{
  const char *v1;
  xpc_object_t autorelease_pool;
  const char *string;
  Class Class;
  Class v5;

  autorelease_pool = a1;
  if (xpc_get_type(a1) == (xpc_type_t)OS_xpc_dictionary)
  {
    autorelease_pool = xpc_retain(autorelease_pool);
    string = xpc_dictionary_get_string(autorelease_pool, "RunLoopType");
    if (string)
      v1 = string;
    else
      v1 = "dispatch_main";
    if (!strcmp(v1, "_UIApplicationMain"))
      _xpc_objc_uimain(autorelease_pool);
  }
  else
  {
    qword_1F0460B90 = (uint64_t)"Configuration error: Invalid XPCService dictionary.";
    __break(1u);
  }
  if (!strcmp(v1, "_NSApplicationMain"))
  {
    xpc_release(autorelease_pool);
    qword_1F0460B90 = (uint64_t)"Configuration error: Service specifies NSApplicationMain() for run loop but AppKit is not"
                               " available on this platform.";
    __break(1u);
  }
  if (!strcmp(v1, "NSRunLoop"))
  {
    xpc_release(autorelease_pool);
    autorelease_pool = _get_autorelease_pool();
    Class = objc_getClass("NSRunLoop");
    if (Class)
    {
      v5 = Class;

      objc_msgSend((id)-[objc_class currentRunLoop](v5, "currentRunLoop"), "run");
      qword_1F0460B90 = (uint64_t)"Bug in libxpc: _xpc_objc_main() is not supposed to return";
      __break(1u);
      goto LABEL_16;
    }
    qword_1F0460B90 = (uint64_t)"Configuration error: Service specifies NSRunLoop for run loop but does not have class.";
    __break(1u);
  }
  if (!strcmp(v1, "dispatch_main"))
  {
    xpc_release(autorelease_pool);
    dispatch_main();
  }
LABEL_16:
  qword_1F0460B90 = (uint64_t)"Configuration error: Service specifies unknown RunLoopType.";
  __break(1u);
}

void _xpc_objc_uimain(void *a1)
{
  id autorelease_pool;
  char *nsstring_for_key;
  char *v4;
  void *v5;
  void (*v6)(uint64_t, char **, char *, char *);
  void (*v7)(uint64_t, char **, char *, char *);
  uint64_t v8;
  char ***v9;

  autorelease_pool = _get_autorelease_pool();
  nsstring_for_key = (char *)_create_nsstring_for_key(a1, "_UIApplicationClass");
  v4 = (char *)_create_nsstring_for_key(a1, "_UIApplicationDelegateClass");
  xpc_release(a1);
  objc_msgSend(autorelease_pool, "drain");
  v5 = dlopen("/System/Library/Frameworks/UIKit.framework/UIKit", 1);
  if (!v5)
  {
    qword_1F0460B90 = (uint64_t)"Configuration error: UIKit does not exist.";
    __break(1u);
  }
  v6 = (void (*)(uint64_t, char **, char *, char *))dlsym(v5, "UIApplicationMain");
  if (!v6)
  {
    qword_1F0460B90 = (uint64_t)"Configuration error: Service specifies UIApplicationMain() for run loop but does not have symbol.";
    __break(1u);
  }
  v7 = v6;
  v8 = *_NSGetArgc();
  v9 = _NSGetArgv();
  v7(v8, *v9, nsstring_for_key, v4);

  qword_1F0460B90 = (uint64_t)"Bug in libxpc: _xpc_objc_uimain() is not supposed to return";
  __break(1u);
}

id _get_autorelease_pool()
{
  objc_class *Class;

  Class = objc_getClass("NSAutoreleasePool");
  if (!Class)
    _get_autorelease_pool_cold_1();
  return objc_alloc_init(Class);
}

const char *_create_nsstring_for_key(void *a1, const char *a2)
{
  Class Class;
  objc_class *v5;
  const char *result;

  Class = objc_getClass("NSString");
  if (!Class)
    _create_nsstring_for_key_cold_1();
  v5 = Class;
  result = xpc_dictionary_get_string(a1, a2);
  if (result)
    return (const char *)objc_msgSend([v5 alloc], "initWithUTF8String:", result);
  return result;
}

BOOL _xpc_uuid_equal(uint64_t a1, uint64_t a2)
{
  return uuid_compare((const unsigned __int8 *)(a1 + 24), (const unsigned __int8 *)(a2 + 24)) == 0;
}

uint64_t _xpc_uuid_hash(uint64_t a1)
{
  return _xpc_hash((_BYTE *)(a1 + 24), 16);
}

uint64_t _xpc_uuid_desc(uint64_t a1, uint64_t a2)
{
  unsigned int v3;
  int v4;
  char __str[16];
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  char out[40];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C874D8];
  memset(out, 0, 37);
  uuid_unparse_upper((const unsigned __int8 *)(a1 + 24), out);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  *(_OWORD *)__str = 0u;
  v7 = 0u;
  v3 = snprintf(__str, 0x80uLL, "%s", out);
  if (v3 >= 0x7F)
    v4 = 127;
  else
    v4 = v3;
  return _xpc_serializer_append(a2, __str, (v4 + 1), 0);
}

uint64_t _xpc_uuid_debug_desc(const unsigned __int8 *a1, uint64_t a2)
{
  unsigned int v4;
  int v5;
  char __str[16];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  char out[40];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C874D8];
  memset(out, 0, 37);
  uuid_unparse_upper(a1 + 24, out);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  *(_OWORD *)__str = 0u;
  v8 = 0u;
  v4 = snprintf(__str, 0x80uLL, "<%s: %p> %s", "uuid", a1, out);
  if (v4 >= 0x7F)
    v5 = 127;
  else
    v5 = v4;
  return _xpc_serializer_append(a2, __str, (v5 + 1), 0);
}

size_t _xpc_uuid_debug(uint64_t a1, char *a2, size_t a3)
{
  size_t result;
  char out[40];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C874D8];
  memset(out, 0, 37);
  uuid_unparse_upper((const unsigned __int8 *)(a1 + 24), out);
  result = 0;
  if (a3 >= 2)
  {
    LODWORD(result) = snprintf(a2, a3, ", uuid = %s", out);
    if ((int)result >= a3)
      return a3 - 1;
    else
      return (int)result;
  }
  return result;
}

uint64_t _xpc_uuid_serialize(uint64_t a1, uint64_t a2)
{
  int __src;

  __src = 40960;
  _xpc_serializer_append(a2, &__src, 4uLL, 1);
  return _xpc_serializer_append(a2, (void *)(a1 + 24), 0x10uLL, 1);
}

uint64_t _xpc_uuid_deserialize(uint64_t a1)
{
  uint64_t v1;
  const unsigned __int8 *v2;
  uint64_t v3;

  v1 = _xpc_graph_deserializer_read(a1, 0x10uLL);
  if (!v1)
    return 0;
  v2 = (const unsigned __int8 *)v1;
  v3 = _xpc_base_create();
  *(_DWORD *)(v3 + 20) = 16;
  uuid_copy((unsigned __int8 *)(v3 + 24), v2);
  *(_DWORD *)(v3 + 16) |= 1u;
  return v3;
}

uint64_t _xpc_uuid_wire_length()
{
  return 16;
}

BOOL _xpc_uuid_get_wire_value(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = _xpc_graph_deserializer_read(a1, 0x10uLL);
  if (v3)
    *a2 = v3;
  return v3 != 0;
}

xpc_object_t xpc_uuid_create(const unsigned __int8 *uuid)
{
  uint64_t v2;

  v2 = _xpc_base_create();
  *(_DWORD *)(v2 + 20) = 16;
  uuid_copy((unsigned __int8 *)(v2 + 24), uuid);
  return (xpc_object_t)v2;
}

const uint8_t *__cdecl xpc_uuid_get_bytes(xpc_object_t xuuid)
{
  if (xpc_get_type(xuuid) == (xpc_type_t)OS_xpc_uuid)
    return (const uint8_t *)xuuid + 24;
  else
    return 0;
}

uint64_t _xpc_fd_copy(uint64_t a1)
{
  int v2;
  uint64_t result;

  if (_xpc_mach_port_retain_send(*(_DWORD *)(a1 + 24)))
  {
    _os_assumes_log();
    return 0;
  }
  else
  {
    v2 = *(_DWORD *)(a1 + 24);
    result = _xpc_base_create();
    *(_DWORD *)(result + 16) |= 2u;
    *(_DWORD *)(result + 24) = v2;
  }
  return result;
}

BOOL _xpc_fd_equal(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t _xpc_fd_hash(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

uint64_t _xpc_fd_desc(void *a1, uint64_t a2)
{
  int v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  int v10;
  mode_t st_mode;
  int v12;
  uint64_t v13;
  unint64_t v14;
  size_t v15;
  char *v16;
  size_t v17;
  char *v18;
  size_t v19;
  size_t v20;
  char *v21;
  size_t v22;
  size_t v23;
  char *v24;
  size_t v25;
  size_t v26;
  char *v27;
  size_t v28;
  size_t v29;
  char *v30;
  size_t v31;
  size_t v32;
  size_t v33;
  char *v34;
  size_t v35;
  size_t v36;
  char *v37;
  size_t v38;
  size_t v39;
  uint64_t result;
  stat v41;
  char __str[1152];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C874D8];
  v4 = xpc_fd_dup(a1);
  bzero(__str, 0x480uLL);
  v5 = snprintf(__str, 0x480uLL, "<%s: %p> { type = ", "fd", a1);
  v6 = v5;
  memset(&v41.st_blksize, 0, 32);
  if (v5 >= 0x47F)
    v7 = 1151;
  else
    v7 = v5;
  v8 = &__str[v7];
  v9 = 1152 - v7;
  memset(&v41, 0, 112);
  v10 = fstat(v4, &v41);
  if (v10)
  {
    if (v10 == -1)
      _xpc_fd_desc_cold_1();
    st_mode = v41.st_mode;
    if ((v41.st_mode & 0xF000) == 0x4000)
    {
      if (v6 > 0x47E)
      {
        v13 = 0;
      }
      else
      {
        v12 = snprintf(v8, 1152 - v7, "directory");
        v13 = 1151 - v7;
        if (v9 > v12)
          v13 = v12;
        st_mode = v41.st_mode;
      }
      v16 = &v8[v13];
      v15 = v9 - v13;
    }
    else
    {
      v15 = 1152 - v7;
      v16 = &__str[v7];
    }
    if ((st_mode & 0xF000) == 0x8000)
    {
      if (v16 == v8)
      {
        v18 = v8;
      }
      else
      {
        if (v15 < 2)
        {
          v17 = 0;
        }
        else
        {
          v17 = snprintf(v16, v15, "/");
          if (v15 <= v17)
            v17 = v15 - 1;
        }
        v18 = &v16[v17];
        v15 -= v17;
      }
      if (v15 < 2)
      {
        v19 = 0;
      }
      else
      {
        v19 = snprintf(v18, v15, "file");
        if (v15 <= v19)
          v19 = v15 - 1;
      }
      v16 = &v18[v19];
      v15 -= v19;
      st_mode = v41.st_mode;
    }
    if ((st_mode & 0xF000) == 0x2000)
    {
      if (v16 == v8)
      {
        v21 = v8;
      }
      else
      {
        if (v15 < 2)
        {
          v20 = 0;
        }
        else
        {
          v20 = snprintf(v16, v15, "/");
          if (v15 <= v20)
            v20 = v15 - 1;
        }
        v21 = &v16[v20];
        v15 -= v20;
      }
      if (v15 < 2)
      {
        v22 = 0;
      }
      else
      {
        v22 = snprintf(v21, v15, "character device");
        if (v15 <= v22)
          v22 = v15 - 1;
      }
      v16 = &v21[v22];
      v15 -= v22;
      st_mode = v41.st_mode;
    }
    if ((st_mode & 0xF000) == 0x6000)
    {
      if (v16 == v8)
      {
        v24 = v8;
      }
      else
      {
        if (v15 < 2)
        {
          v23 = 0;
        }
        else
        {
          v23 = snprintf(v16, v15, "/");
          if (v15 <= v23)
            v23 = v15 - 1;
        }
        v24 = &v16[v23];
        v15 -= v23;
      }
      if (v15 < 2)
      {
        v25 = 0;
      }
      else
      {
        v25 = snprintf(v24, v15, "block device");
        if (v15 <= v25)
          v25 = v15 - 1;
      }
      v16 = &v24[v25];
      v15 -= v25;
      st_mode = v41.st_mode;
    }
    if ((st_mode & 0xF000) == 0xC000)
    {
      if (v16 == v8)
      {
        v27 = v8;
      }
      else
      {
        if (v15 < 2)
        {
          v26 = 0;
        }
        else
        {
          v26 = snprintf(v16, v15, "/");
          if (v15 <= v26)
            v26 = v15 - 1;
        }
        v27 = &v16[v26];
        v15 -= v26;
      }
      if (v15 < 2)
      {
        v28 = 0;
      }
      else
      {
        v28 = snprintf(v27, v15, "socket");
        if (v15 <= v28)
          v28 = v15 - 1;
      }
      v16 = &v27[v28];
      v15 -= v28;
      st_mode = v41.st_mode;
    }
    if ((st_mode & 0xF000) == 0x1000)
    {
      if (v16 == v8)
      {
        v30 = v8;
      }
      else
      {
        if (v15 < 2)
        {
          v29 = 0;
        }
        else
        {
          v29 = snprintf(v16, v15, "/");
          if (v15 <= v29)
            v29 = v15 - 1;
        }
        v30 = &v16[v29];
        v15 -= v29;
      }
      if (v15 < 2)
      {
        v31 = 0;
      }
      else
      {
        v31 = snprintf(v30, v15, "fifo");
        if (v15 <= v31)
          v31 = v15 - 1;
      }
      v16 = &v30[v31];
    }
  }
  else
  {
    if (v6 > 0x47E)
    {
      v14 = 0;
    }
    else
    {
      v14 = snprintf(v8, 1152 - v7, "(invalid descriptor)");
      if (v9 <= v14)
        v14 = 1151 - v7;
    }
    v16 = &v8[v14];
  }
  v32 = v9 + v8 - v16;
  if (v32 < 2)
  {
    v33 = 0;
  }
  else
  {
    v33 = snprintf(v16, v32, ", path = ");
    if (v32 <= v33)
      v33 = v32 - 1;
  }
  v34 = &v16[v33];
  v35 = v32 - v33;
  if (fcntl(v4, 50, &v16[v33]) == -1)
  {
    if (v35 < 2)
    {
      v36 = 0;
    }
    else
    {
      LODWORD(v36) = snprintf(v34, v35, "(invalid path)");
      if (v35 <= (int)v36)
        v36 = v35 - 1;
      else
        v36 = (int)v36;
    }
  }
  else
  {
    v36 = strlen(v34);
  }
  v37 = &v34[v36];
  v38 = v35 - v36;
  if (v38 < 2)
  {
    v39 = 0;
  }
  else
  {
    v39 = snprintf(v37, v38, " }");
    if (v38 <= v39)
      v39 = v38 - 1;
  }
  _xpc_serializer_append(a2, __str, &v37[v39] - __str + 1, 0);
  result = close(v4);
  if ((_DWORD)result)
    return _os_assumes_log();
  return result;
}

uint64_t _xpc_fd_debug(uint64_t a1, char *__str, size_t __size)
{
  return snprintf(__str, __size, ", fileport = 0x%x", *(_DWORD *)(a1 + 24));
}

uint64_t _xpc_fd_serialize(uint64_t a1, _QWORD *a2)
{
  int v3;

  v3 = 45056;
  return _xpc_serializer_append_port(a2, &v3, 4uLL, a1, *(_DWORD *)(a1 + 24), 19);
}

uint64_t _xpc_fd_deserialize(uint64_t *a1)
{
  int v1;
  uint64_t result;
  int v3;
  int v4;

  v4 = 0;
  if (!_xpc_graph_deserializer_read_port(a1, 17, &v4))
    return 0;
  v1 = v4;
  result = _xpc_base_create();
  v3 = *(_DWORD *)(result + 16);
  *(_DWORD *)(result + 24) = v1;
  *(_DWORD *)(result + 16) = v3 | 3;
  return result;
}

uint64_t _xpc_fd_wire_length()
{
  return -1;
}

uint64_t _xpc_fd_dispose(uint64_t a1)
{
  uint64_t result;

  result = _xpc_mach_port_release(*(_DWORD *)(a1 + 24));
  if ((_DWORD)result)
    return _os_assumes_log();
  return result;
}

uint64_t _xpc_fd_get_port(unsigned int *a1)
{
  if (xpc_get_type(a1) != (xpc_type_t)OS_xpc_fd)
    _xpc_api_misuse("Given object not of required type.");
  return a1[6];
}

xpc_object_t xpc_fd_create(int fd)
{
  xpc_object_t result;

  if (fd != -1 && _xpc_fileport_makeport())
  {
    _os_assumes_log();
    return 0;
  }
  else
  {
    result = (xpc_object_t)_xpc_base_create();
    *((_DWORD *)result + 4) |= 2u;
    *((_DWORD *)result + 6) = 0;
  }
  return result;
}

int xpc_fd_dup(xpc_object_t xfd)
{
  if (xpc_get_type(xfd) == (xpc_type_t)OS_xpc_fd)
    return _xpc_fileport_makefd(*((unsigned int *)xfd + 6));
  else
    return -1;
}

uint64_t _xpc_shmem_copy(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t result;

  if (_xpc_mach_port_retain_send(*(_DWORD *)(a1 + 24)))
  {
    _os_assumes_log();
    return 0;
  }
  else
  {
    v2 = *(_DWORD *)(a1 + 24);
    v3 = *(_QWORD *)(a1 + 32);
    result = _xpc_base_create();
    *(_DWORD *)(result + 16) |= 2u;
    *(_DWORD *)(result + 20) = 8;
    *(_DWORD *)(result + 24) = v2;
    *(_QWORD *)(result + 32) = v3;
  }
  return result;
}

BOOL _xpc_shmem_equal(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t _xpc_shmem_hash(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

uint64_t _xpc_shmem_desc(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  int v6;
  const char *v7;
  unsigned int v8;
  int v9;
  char __str[16];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C874D8];
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  *(_OWORD *)__str = 0u;
  v12 = 0u;
  v4 = a1[4];
  v5 = (v4 + *MEMORY[0x1E0C88820] - 1) & -*MEMORY[0x1E0C88820];
  v6 = getpagesize();
  v7 = "s";
  if (v5 / v6 == 1)
    v7 = (const char *)&unk_1DEEBE00B;
  v8 = snprintf(__str, 0x80uLL, "<%s: %p>: %llu bytes (%llu page%s)", "shmem", a1, v4, v5 / v6, v7);
  if (v8 >= 0x7F)
    v9 = 127;
  else
    v9 = v8;
  return _xpc_serializer_append(a2, __str, (v9 + 1), 0);
}

uint64_t _xpc_shmem_debug(uint64_t a1, char *a2, size_t a3)
{
  uint64_t v5;
  unint64_t v6;
  int v7;
  int v8;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = (v5 + *MEMORY[0x1E0C88820] - 1) & -*MEMORY[0x1E0C88820];
  v7 = *(_DWORD *)(a1 + 24);
  v8 = getpagesize();
  return snprintf(a2, a3, ", port = 0x%x, len = %llu (%llu pages)", v7, v5, v6 / v8);
}

uint64_t _xpc_shmem_serialize(uint64_t a1, _QWORD *a2)
{
  uint64_t v5;
  int __src;

  __src = 49152;
  _xpc_serializer_append((uint64_t)a2, &__src, 4uLL, 1);
  v5 = *(_QWORD *)(a1 + 32);
  return _xpc_serializer_append_port(a2, &v5, 8uLL, a1, *(_DWORD *)(a1 + 24), 19);
}

uint64_t _xpc_shmem_deserialize(uint64_t *a1)
{
  uint64_t *v2;
  uint64_t v3;
  mach_port_name_t v4;
  uint64_t result;
  int v6;
  mach_port_name_t name;

  name = 0;
  v2 = (uint64_t *)_xpc_graph_deserializer_read((uint64_t)a1, 8uLL);
  if (_xpc_graph_deserializer_read_port(a1, 17, (int *)&name))
  {
    if (v2)
    {
      v3 = *v2;
      v4 = name;
      result = _xpc_base_create();
      v6 = *(_DWORD *)(result + 16);
      *(_DWORD *)(result + 20) = 8;
      *(_DWORD *)(result + 24) = v4;
      *(_QWORD *)(result + 32) = v3;
      *(_DWORD *)(result + 16) = v6 | 3;
      return result;
    }
    if (_xpc_mach_port_release(name))
      _os_assumes_log();
  }
  return 0;
}

uint64_t _xpc_shmem_wire_length()
{
  return -1;
}

uint64_t _xpc_shmem_dispose(uint64_t a1)
{
  uint64_t result;

  result = _xpc_mach_port_release(*(_DWORD *)(a1 + 24));
  if ((_DWORD)result)
    return _os_assumes_log();
  return result;
}

xpc_object_t xpc_shmem_create(void *region, size_t length)
{
  return (xpc_object_t)_xpc_shmem_create_with_prot(region, length, 3);
}

uint64_t _xpc_shmem_create_with_prot(const void *a1, memory_object_size_t a2, int a3)
{
  vm_map_t *v6;
  kern_return_t memory_entry_64;
  memory_object_size_t v8;
  uint64_t result;
  mach_port_t v10;
  char *v11;
  memory_object_size_t size;
  mach_port_t object_handle;

  if (malloc_size(a1))
  {
    v11 = _xpc_asprintf("Attempt to pass a malloc(3)ed region to xpc_shmem_create().");
    _xpc_api_misuse(v11);
  }
  object_handle = 0;
  size = a2;
  v6 = (vm_map_t *)MEMORY[0x1E0C883F0];
  memory_entry_64 = mach_make_memory_entry_64(*MEMORY[0x1E0C883F0], &size, (memory_object_offset_t)a1, a3 | 0x400040, &object_handle, 0);
  if (memory_entry_64)
  {
    if (memory_entry_64 != 18)
      goto LABEL_10;
    if (mach_make_memory_entry_64(*v6, &size, (memory_object_offset_t)a1, a3 & 0xFFBFFFBF | 0x40, &object_handle, 0))
      return 0;
  }
  v8 = size;
  if (size < a2)
  {
    syslog(3, "Shared memory length exceeded size supported by a single memory entry (actual/supported): %llu/%llu", a2, size);
    if (!_xpc_mach_port_release(object_handle))
      return 0;
LABEL_10:
    _os_assumes_log();
    return 0;
  }
  v10 = object_handle;
  result = _xpc_base_create();
  *(_DWORD *)(result + 16) |= 2u;
  *(_DWORD *)(result + 20) = 8;
  *(_DWORD *)(result + 24) = v10;
  *(_QWORD *)(result + 32) = v8;
  *(_DWORD *)(result + 40) = a3;
  return result;
}

uint64_t xpc_shmem_create_readonly(const void *a1, memory_object_size_t a2)
{
  return _xpc_shmem_create_with_prot(a1, a2, 1);
}

uint64_t xpc_shmem_get_length(_QWORD *a1)
{
  if (xpc_get_type(a1) == (xpc_type_t)OS_xpc_shmem)
    return a1[4];
  else
    return 0;
}

uint64_t _xpc_shmem_get_mach_port(unsigned int *a1)
{
  if (xpc_get_type(a1) == (xpc_type_t)OS_xpc_shmem)
    return a1[6];
  else
    return 0;
}

size_t xpc_shmem_map(xpc_object_t xshmem, void **region)
{
  if (xpc_get_type(xshmem) == (xpc_type_t)OS_xpc_shmem
    && !_xpc_vm_map_memory_entry(*((_DWORD *)xshmem + 6), *((_QWORD *)xshmem + 4), (mach_vm_address_t *)region, 1))
  {
    return *((_QWORD *)xshmem + 4);
  }
  else
  {
    return 0;
  }
}

void _xpc_init_pid_domain_process_initial_images(uint64_t a1, void *a2, void *a3)
{
  xpc_object_t empty;
  xpc_object_t v7;
  _QWORD v8[6];

  empty = xpc_dictionary_create_empty();
  v7 = xpc_dictionary_create_empty();
  v8[0] = MEMORY[0x1E0C87450];
  v8[1] = 0x40000000;
  v8[2] = ___xpc_init_pid_domain_process_initial_images_block_invoke;
  v8[3] = &__block_descriptor_tmp_4;
  v8[4] = v7;
  v8[5] = empty;
  xpc_dictionary_apply(a2, v8);
  xpc_dictionary_set_value(a3, "paths", empty);
  xpc_array_set_value(*(xpc_object_t *)(a1 + 112), 0xFFFFFFFFFFFFFFFFLL, v7);
  xpc_release(empty);
  xpc_release(v7);
}

uint64_t ___xpc_init_pid_domain_process_initial_images_block_invoke(uint64_t a1, const char *a2, void *a3)
{
  xpc_object_t *v6;

  if (_xpc_has_prefix(a2, "/System/Library/Frameworks/") || _xpc_has_prefix(a2, "/System/Library/PrivateFrameworks/"))
    v6 = (xpc_object_t *)(a1 + 32);
  else
    v6 = (xpc_object_t *)(a1 + 40);
  xpc_dictionary_set_value(*v6, a2, a3);
  return 1;
}

void _xpc_envdict_putenv(void *a1, char *a2)
{
  char *v4;
  char *v5;
  _OWORD v6[8];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C874D8];
  if (_xpc_has_prefix(a2, "__XPC_"))
  {
    v4 = strchr(a2, 61);
    if (v4)
    {
      v5 = v4;
      memset(v6, 0, sizeof(v6));
      __strlcpy_chk();
      xpc_dictionary_set_string(a1, (const char *)v6, v5 + 1);
    }
  }
}

uint64_t _libxpc_initializer()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  kern_return_t v8;
  uint64_t v9;
  mach_port_array_t v10;
  int v11;
  mach_port_name_t v12;
  uint64_t v13;
  task_t *v14;
  mach_port_name_t v15;
  kern_return_t v16;
  mach_port_array_t v17;
  int v18;
  mach_port_name_t *v19;
  int special_port;
  mach_port_name_t v21;
  char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  mach_msg_type_number_t init_port_setCnt;
  mach_port_array_t init_port_set[4];

  init_port_set[3] = *(mach_port_array_t *)MEMORY[0x1E0C874D8];
  _xpc_ktrace_pid0();
  _xpc_install_dispatch_hooks();
  v0 = MEMORY[0x1E0C87FA0];
  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 16) == -1)
    v1 = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 24);
  else
    v1 = _os_alloc_once();
  if (*MEMORY[0x1E0DE7C50])
  {
    xpc_get_class4NSXPC(OS_xpc_uint64);
    _objc_registerTaggedPointerClass();
    xpc_get_class4NSXPC(OS_xpc_int64);
    _objc_registerTaggedPointerClass();
  }
  *(_DWORD *)(v1 + 176) = 0;
  *(_QWORD *)(v1 + 184) = 0;
  *(_QWORD *)(v1 + 112) = xpc_array_create(0, 0);
  *(_DWORD *)(v1 + 104) = 0;
  *(_BYTE *)(v1 + 41) = 1;
  v2 = getenv("XPC_FLAGS");
  if (!v2)
    v2 = "0x0";
  v3 = strtoll(v2, 0, 16);
  *(_QWORD *)(v1 + 8) = v3;
  v4 = getenv("XPC_NULL_BOOTSTRAP");
  if (v4 && !strcmp(v4, "1"))
  {
    v3 |= 2uLL;
    *(_QWORD *)(v1 + 8) = v3;
    if ((v3 & 0x4000) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  if ((v3 & 0x4000) != 0)
LABEL_10:
    *(_BYTE *)(v1 + 208) = 1;
LABEL_11:
  v5 = getenv("XPC_SERVICES_UNAVAILABLE");
  if (v5 && !strcmp(v5, "1"))
    *(_QWORD *)(v1 + 8) = v3 | 0x80;
  if (getsectbyname("__TEXT", "__launchd"))
  {
    *(_BYTE *)v1 = 1;
  }
  else if (getsectbyname("__TEXT", "__xpcproxy"))
  {
    *(_BYTE *)(v1 + 1) = 1;
  }
  else if (getsectbyname("__TEXT", "__launchctl"))
  {
    *(_BYTE *)(v1 + 2) = 1;
  }
  else if ((*(_BYTE *)(v1 + 8) & 1) != 0)
  {
    *(_BYTE *)(v1 + 3) = 1;
  }
  if (getsectbyname("__TEXT", "__libxpcunittest") && MEMORY[0xFFFFF4084])
    *(_BYTE *)(v1 + 88) = 1;
  v6 = *(_QWORD *)(v1 + 8);
  if ((v6 & 2) != 0)
  {
    *(_BYTE *)(v1 + 4) = 1;
    _xpc_neuter_potential_reentrancy(1);
    v6 = *(_QWORD *)(v1 + 8);
    if ((v6 & 0x2000) == 0)
    {
LABEL_29:
      if ((v6 & 0x10) == 0)
        goto LABEL_30;
LABEL_34:
      xpc_track_activity();
      goto LABEL_35;
    }
  }
  else if ((v6 & 0x2000) == 0)
  {
    goto LABEL_29;
  }
  *(_BYTE *)(v1 + 192) = 1;
  if ((v6 & 0x10) != 0)
    goto LABEL_34;
LABEL_30:
  if ((v6 & 8) != 0)
    xpc_transactions_enable();
LABEL_35:
  if (getenv("XPC_DEBUG_SERVICES"))
    *(_BYTE *)(v1 + 40) = 1;
  if (!*(_BYTE *)v1 && !*(_BYTE *)(v1 + 4))
  {
    if (*(_BYTE *)(v1 + 1))
    {
      if (*(_QWORD *)(v0 + 16) == -1)
        v7 = *(_QWORD *)(v0 + 24);
      else
        v7 = _os_alloc_once();
      init_port_set[0] = 0;
      init_port_setCnt = 0;
      v8 = mach_ports_lookup(*MEMORY[0x1E0C883F0], init_port_set, &init_port_setCnt);
      if (v8)
        _libxpc_initializer_cold_2(v8);
      v9 = init_port_setCnt;
      if (!init_port_setCnt)
        _libxpc_initializer_cold_4();
      v10 = init_port_set[0];
      v11 = *init_port_set[0];
      *(_DWORD *)(v7 + 16) = *init_port_set[0];
      if ((v11 + 1) <= 1)
        _libxpc_initializer_cold_5();
      if (v9 >= 2)
        *(_DWORD *)(v7 + 20) = v10[1];
      mig_deallocate((vm_address_t)v10, 4 * v9);
      if ((*(_BYTE *)(v7 + 9) & 1) != 0)
      {
        v12 = *(_DWORD *)(v7 + 16);
        *MEMORY[0x1E0C87FE0] = v12;
        _xpc_mach_port_retain_send(v12);
      }
      _xpc_create_bootstrap_pipe();
      goto LABEL_71;
    }
    v13 = *(_QWORD *)(v0 + 16);
    if (*(_BYTE *)(v1 + 3))
    {
      if (v13 == -1)
      {
        v27 = *(_QWORD *)(v0 + 24);
        v26 = v27;
      }
      else
      {
        v26 = _os_alloc_once();
        v27 = *(_QWORD *)(v0 + 24);
      }
      v14 = (task_t *)MEMORY[0x1E0C883F0];
      if (!task_get_special_port(*MEMORY[0x1E0C883F0], 4, (mach_port_t *)(v27 + 16)))
      {
        v15 = *(_DWORD *)(v27 + 16);
        *MEMORY[0x1E0C87FE0] = v15;
        _xpc_mach_port_retain_send(v15);
        if ((*(_BYTE *)(v27 + 8) & 4) != 0)
        {
          init_port_set[0] = 0;
          init_port_setCnt = 0;
          v16 = mach_ports_lookup(*v14, init_port_set, &init_port_setCnt);
          if (v16)
            _libxpc_initializer_cold_2(v16);
          v17 = init_port_set[0];
          if (*init_port_set[0] + 1 >= 2)
          {
            *(_QWORD *)(v27 + 32) = _xpc_endpoint_create(*init_port_set[0]);
            v17 = init_port_set[0];
          }
          mig_deallocate((vm_address_t)v17, 4 * init_port_setCnt);
        }
        _xpc_create_bootstrap_pipe();
        _xpc_collect_environment();
        _xpc_collect_images();
        if ((*(_DWORD *)(v26 + 16) + 1) <= 1)
        {
          *(_QWORD *)(v26 + 8) |= 2uLL;
          *(_BYTE *)(v26 + 4) = 1;
        }
        v18 = 0;
LABEL_70:
        _xpc_early_init(v18);
        goto LABEL_71;
      }
      special_port = _libxpc_initializer_cold_3();
    }
    else
    {
      if (v13 == -1)
      {
        v29 = *(_QWORD *)(v0 + 24);
        v28 = v29;
      }
      else
      {
        v28 = _os_alloc_once();
        v29 = *(_QWORD *)(v0 + 24);
      }
      v19 = (mach_port_name_t *)(v29 + 16);
      special_port = task_get_special_port(*MEMORY[0x1E0C883F0], 4, (mach_port_t *)(v29 + 16));
      if (!special_port)
      {
        v21 = *v19;
        *MEMORY[0x1E0C87FE0] = *v19;
        _xpc_mach_port_retain_send(v21);
        _xpc_create_bootstrap_pipe();
        _xpc_collect_environment();
        _xpc_collect_images();
        if ((*(_DWORD *)(v28 + 16) + 1) <= 1)
        {
          *(_QWORD *)(v28 + 8) |= 2uLL;
          *(_BYTE *)(v28 + 4) = 1;
        }
        v18 = 1;
        goto LABEL_70;
      }
    }
    _libxpc_initializer_cold_1(special_port);
  }
LABEL_71:
  v22 = getenv("XPC_FLAGS");
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)(v1 + 8) & 0x82;
    memset(init_port_set, 0, 24);
    snprintf((char *)init_port_set, 0x18uLL, "0x%llx", v24);
    if (strcmp((const char *)init_port_set, v23))
      setenv("XPC_FLAGS", (const char *)init_port_set, 1);
  }
  *(_BYTE *)(v1 + 137) = 1;
  return _xpc_ktrace_pid0();
}

uint64_t xpc_atfork_prepare()
{
  uint64_t result;
  mach_port_t init_port_set;

  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 16) == -1)
    result = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 24);
  else
    result = _os_alloc_once();
  if (!*(_BYTE *)result)
  {
    init_port_set = *(_DWORD *)(result + 16);
    return mach_ports_register(*MEMORY[0x1E0C883F0], &init_port_set, 1u);
  }
  return result;
}

uint64_t xpc_atfork_child()
{
  uint64_t v0;
  task_inspect_t *v1;
  kern_return_t v2;
  uint64_t v3;
  BOOL v4;
  mach_port_array_t v5;
  uint64_t v6;
  mach_msg_type_number_t init_port_setCnt;
  mach_port_array_t init_port_set;

  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 16) == -1)
    v0 = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 24);
  else
    v0 = _os_alloc_once();
  *(_BYTE *)(v0 + 41) = 0;
  init_port_set = 0;
  init_port_setCnt = 0;
  v1 = (task_inspect_t *)MEMORY[0x1E0C883F0];
  v2 = mach_ports_lookup(*MEMORY[0x1E0C883F0], &init_port_set, &init_port_setCnt);
  v3 = init_port_setCnt;
  if (v2)
    v4 = 1;
  else
    v4 = init_port_setCnt == 0;
  if (!v4)
  {
    v5 = init_port_set;
    *(_DWORD *)(v0 + 16) = *init_port_set;
    mig_deallocate((vm_address_t)v5, 4 * v3);
    v6 = *(_QWORD *)(v0 + 24);
    if (v6)
    {
      xpc_pipe_invalidate(v6);
      xpc_release(*(xpc_object_t *)(v0 + 24));
    }
    *(_QWORD *)(v0 + 24) = xpc_pipe_create_from_port(*(_DWORD *)(v0 + 16), 4);
  }
  if (getenv("XPC_SERVICE_NAME"))
    setenv("XPC_SERVICE_NAME", "0", 1);
  return task_get_special_port(*v1, 4, MEMORY[0x1E0C87FE0]);
}

uint64_t _xpc_is_multithreaded()
{
  if (MEMORY[0x1E0C86EE8])
    return _dispatch_is_multithreaded();
  else
    return 0;
}

int64_t _xpc_bootstrap_services(void *a1)
{
  xpc_object_t v2;
  pid_t v3;
  int64_t v4;
  xpc_object_t object;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "type", 5uLL);
  v3 = getpid();
  xpc_dictionary_set_uint64(v2, "handle", v3);
  xpc_dictionary_set_value(v2, "paths", a1);
  object = 0;
  v4 = _xpc_domain_routine(800, v2, &object);
  xpc_release(v2);
  if (object)
    xpc_release(object);
  return v4;
}

void _xpc_uncork_domain()
{
  os_unfair_lock_s *v0;

  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 16) == -1)
    v0 = *(os_unfair_lock_s **)(MEMORY[0x1E0C87FA0] + 24);
  else
    v0 = (os_unfair_lock_s *)_os_alloc_once();
  os_unfair_lock_lock_with_options();
  _xpc_uncork_pid_domain_locked((uint64_t)v0);
  os_unfair_lock_unlock(v0 + 26);
}

void _xpc_uncork_pid_domain_locked(uint64_t a1)
{
  xpc_object_t v2;
  size_t v3;
  uint64_t v4;
  xpc_object_t value;
  xpc_object_t v6;
  pid_t v7;
  xpc_object_t object;
  _QWORD applier[5];

  if (!*(_BYTE *)(a1 + 108) && !*(_BYTE *)(a1 + 4) && !*(_BYTE *)(a1 + 1))
  {
    if (!*(_BYTE *)(a1 + 109))
      _xpc_init_pid_domain((_BYTE *)a1);
    *(_BYTE *)(a1 + 108) = 1;
    if ((_xpc_services_unavailable() & 1) == 0)
    {
      v2 = xpc_dictionary_create(0, 0, 0);
      if (xpc_array_get_count(*(xpc_object_t *)(a1 + 112)))
      {
        v3 = 0;
        v4 = MEMORY[0x1E0C87450];
        do
        {
          value = xpc_array_get_value(*(xpc_object_t *)(a1 + 112), v3);
          applier[0] = v4;
          applier[1] = 0x40000000;
          applier[2] = ___xpc_uncork_pid_domain_locked_block_invoke;
          applier[3] = &__block_descriptor_tmp_55_0;
          applier[4] = v2;
          xpc_dictionary_apply(value, applier);
          ++v3;
        }
        while (v3 < xpc_array_get_count(*(xpc_object_t *)(a1 + 112)));
      }
      if (xpc_dictionary_get_count(v2))
        _xpc_bootstrap_services(v2);
      xpc_release(v2);
      xpc_release(*(xpc_object_t *)(a1 + 112));
      *(_QWORD *)(a1 + 112) = 0;
      v6 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_uint64(v6, "type", 5uLL);
      v7 = getpid();
      xpc_dictionary_set_uint64(v6, "handle", v7);
      object = 0;
      _xpc_domain_routine(803, v6, &object);
      if (object)
        xpc_release(object);
      xpc_release(v6);
    }
  }
}

BOOL xpc_is_xpcservice()
{
  uint64_t v0;

  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 16) == -1)
    v0 = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 24);
  else
    v0 = _os_alloc_once();
  if (!*(_BYTE *)(v0 + 3))
    return 0;
  if (*(_QWORD *)(v0 + 144) != -1)
    dispatch_once_f((dispatch_once_t *)(v0 + 144), 0, (dispatch_function_t)_fetch_xpcservice_info);
  return *(_QWORD *)(v0 + 160) != 0;
}

void _fetch_xpcservice_info()
{
  uint64_t v0;
  xpc_object_t v1;
  const char *string;
  xpc_object_t value;
  xpc_object_t v4;
  xpc_object_t xdict;

  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 16) == -1)
    v0 = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 24);
  else
    v0 = _os_alloc_once();
  v1 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v1, "type", 6uLL);
  xpc_dictionary_set_BOOL(v1, "self", 1);
  xdict = 0;
  if (_xpc_service_routine(718, v1, &xdict))
  {
    _os_assumes_log();
  }
  else
  {
    string = xpc_dictionary_get_string(xdict, "identifier");
    if (string)
      string = _xpc_strdup(string);
    *(_QWORD *)(v0 + 160) = string;
    value = xpc_dictionary_get_value(xdict, "xpcservice-dict");
    v4 = value;
    if (value)
      xpc_retain(value);
    *(_QWORD *)(v0 + 152) = v4;
    xpc_release(xdict);
  }
  xpc_release(v1);
}

_xpc_connection_s *xpc_connection_create_bs_service_listener(const char *a1)
{
  _xpc_connection_s *service_listener;

  service_listener = (_xpc_connection_s *)_xpc_connection_create_service_listener(a1);
  _xpc_register_service_listener_with_handler(service_listener, 0, a1 == 0, 1);
  return service_listener;
}

uint64_t _xpc_connection_create_service_listener(const char *a1)
{
  xpc_object_t v2;
  void *v3;
  uint64_t v4;
  const char *v5;
  char *v6;
  char *v7;
  xpc_object_t value;
  void *v9;
  __objc2_class **v10;
  __objc2_class **v11;
  uint64_t internal_listener;
  char __str[16];
  __int128 v15;
  __int128 v16;
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
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C874D8];
  v2 = _xpc_copy_xpcservice_dictionary();
  if (!v2 || (v3 = v2, xpc_get_type(v2) != (xpc_type_t)OS_xpc_dictionary))
    _xpc_connection_create_service_listener_cold_1();
  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 16) == -1)
    v4 = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 24);
  else
    v4 = _os_alloc_once();
  if (*(_QWORD *)(v4 + 144) != -1)
    dispatch_once_f((dispatch_once_t *)(v4 + 144), 0, (dispatch_function_t)_fetch_xpcservice_info);
  v5 = *(const char **)(v4 + 160);
  if (!v5)
    _xpc_connection_create_service_listener_cold_2();
  v6 = _xpc_strdup(v5);
  if (!v6)
    _xpc_connection_create_service_listener_cold_3();
  v7 = v6;
  if (a1)
  {
    value = xpc_dictionary_get_value(v3, "_AdditionalSubServices");
    if (!value || (v9 = value, xpc_get_type(value) != (xpc_type_t)OS_xpc_dictionary))
      _xpc_connection_create_service_listener_cold_4();
    v10 = (__objc2_class **)xpc_dictionary_get_value(v9, a1);
    if (!v10 || (v11 = v10, xpc_get_type(v10) != (xpc_type_t)OS_xpc_BOOL))
      _xpc_connection_create_service_listener_cold_5();
    if (v11 == &_xpc_BOOL_false)
      _xpc_connection_create_service_listener_cold_6();
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
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
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    *(_OWORD *)__str = 0u;
    v15 = 0u;
    snprintf(__str, 0x200uLL, "%s.%s", v7, a1);
    v6 = __str;
  }
  internal_listener = _xpc_connection_create_internal_listener(v6);
  xpc_release(v3);
  free(v7);
  return internal_listener;
}

void _xpc_register_service_listener_with_handler(xpc_connection_t connection, uint64_t a2, int a3, int a4)
{
  uint64_t v7;
  uint64_t v8;
  xpc_object_t empty;
  char *v10;
  _QWORD block[5];
  _QWORD handler[6];

  v7 = MEMORY[0x1E0C87450];
  if (a2)
  {
    handler[0] = MEMORY[0x1E0C87450];
    handler[1] = 0x40000000;
    handler[2] = ___xpc_register_service_listener_with_handler_block_invoke;
    handler[3] = &__block_descriptor_tmp_71;
    handler[4] = connection;
    handler[5] = a2;
    xpc_connection_set_event_handler(connection, handler);
  }
  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 16) == -1)
    v8 = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 24);
  else
    v8 = _os_alloc_once();
  os_unfair_lock_lock_with_options();
  if (a4 && (*(_BYTE *)(v8 + 136) & 1) != 0)
  {
    v10 = _xpc_asprintf("must be called before _xpc_start_listeners");
    _xpc_api_misuse(v10);
  }
  if (a3)
  {
    if (*(_QWORD *)(v8 + 120))
      _xpc_register_service_listener_with_handler_cold_1();
    *(_QWORD *)(v8 + 120) = xpc_retain(connection);
    if ((a4 & 1) != 0)
      goto LABEL_15;
LABEL_14:
    block[0] = v7;
    block[1] = 0x40000000;
    block[2] = ___xpc_register_service_listener_with_handler_block_invoke_2;
    block[3] = &__block_descriptor_tmp_74;
    block[4] = connection;
    dispatch_async(MEMORY[0x1E0C86EF8], block);
    goto LABEL_15;
  }
  empty = *(xpc_object_t *)(v8 + 128);
  if (!empty)
  {
    empty = xpc_array_create_empty();
    *(_QWORD *)(v8 + 128) = empty;
  }
  xpc_array_append_value(empty, connection);
  if ((a4 & 1) == 0)
    goto LABEL_14;
LABEL_15:
  os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 104));
}

void xpc_bs_main()
{
  _xpc_main();
}

void _xpc_main()
{
  xpc_object_t v0;
  void *v1;

  v0 = _xpc_copy_xpcservice_dictionary();
  v1 = v0;
  if (!v0 || xpc_get_type(v0) == (xpc_type_t)OS_xpc_dictionary)
  {
    _xpc_start_listeners();
    _xpc_objc_main(v1);
  }
  qword_1F0460B90 = (uint64_t)"Configuration error: XPCService is not a dictionary.";
  __break(1u);
}

void xpc_handle_service(char *a1, uint64_t a2, uint64_t a3)
{
  void *main;
  void *info_dictionary;
  xpc_object_t value;
  void *v8;
  xpc_object_t v9;
  void *v10;
  __objc2_class **v11;
  __objc2_class **v12;
  _xpc_connection_s *internal_listener;
  char *v14;

  if (a3)
  {
    v14 = _xpc_asprintf("The evaluator doesn't do anything. Pass NULL.");
    _xpc_api_misuse(v14);
  }
  main = (void *)xpc_bundle_create_main();
  info_dictionary = (void *)xpc_bundle_get_info_dictionary((uint64_t)main);
  if (!info_dictionary)
    xpc_handle_service_cold_1();
  value = xpc_dictionary_get_value(info_dictionary, "XPCService");
  if (!value || (v8 = value, xpc_get_type(value) != (xpc_type_t)OS_xpc_dictionary))
    xpc_handle_service_cold_2();
  v9 = xpc_dictionary_get_value(v8, "_AdditionalServices");
  if (!v9 || (v10 = v9, xpc_get_type(v9) != (xpc_type_t)OS_xpc_dictionary))
    xpc_handle_service_cold_3();
  v11 = (__objc2_class **)xpc_dictionary_get_value(v10, a1);
  if (!v11 || (v12 = v11, xpc_get_type(v11) != (xpc_type_t)OS_xpc_BOOL))
    xpc_handle_service_cold_4();
  if (v12 == &_xpc_BOOL_false)
    xpc_handle_service_cold_5();
  internal_listener = (_xpc_connection_s *)_xpc_connection_create_internal_listener(a1);
  _xpc_register_service_listener_with_handler(internal_listener, a2, 0, 0);
  xpc_release(internal_listener);
  xpc_release(main);
}

void xpc_handle_subservice(const char *a1, uint64_t a2)
{
  _xpc_connection_s *service_listener;

  service_listener = (_xpc_connection_s *)_xpc_connection_create_service_listener(a1);
  _xpc_register_service_listener_with_handler(service_listener, a2, 0, 0);
  xpc_release(service_listener);
}

void xpc_main(xpc_connection_handler_t handler)
{
  _xpc_connection_s *service_listener;

  service_listener = (_xpc_connection_s *)_xpc_connection_create_service_listener(0);
  _xpc_register_service_listener_with_handler(service_listener, (uint64_t)handler, 1, 1);
  xpc_release(service_listener);
  _xpc_main();
}

mach_port_context_t _xpc_create_bootstrap_pipe()
{
  uint64_t v0;
  mach_port_context_t result;

  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 16) == -1)
    v0 = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 24);
  else
    v0 = _os_alloc_once();
  _xpc_mach_port_retain_send(*(_DWORD *)(v0 + 16));
  result = xpc_pipe_create_from_port(*(_DWORD *)(v0 + 16), 4);
  *(_QWORD *)(v0 + 24) = result;
  if (!result)
    _xpc_create_bootstrap_pipe_cold_1();
  return result;
}

void _xpc_collect_environment()
{
  xpc_object_t v0;
  const char *v1;
  uint64_t v2;
  char *v3;
  char ***v4;
  char *v5;
  char **v6;
  char *v7;

  v0 = xpc_dictionary_create(0, 0, 0);
  v1 = "HOME";
  v2 = 1u;
  do
  {
    v3 = getenv(v1);
    if (v3)
      xpc_dictionary_set_string(v0, v1, v3);
    v1 = _xpc_interesting_envvars[v2++];
  }
  while (v2 != 8);
  v4 = _NSGetEnviron();
  v5 = **v4;
  if (v5)
  {
    v6 = *v4 + 1;
    do
    {
      _xpc_envdict_putenv(v0, v5);
      v7 = *v6++;
      v5 = v7;
    }
    while (v7);
  }
  _environment = (uint64_t)xpc_retain(v0);
  xpc_release(v0);
}

uint64_t _xpc_collect_images()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  size_t count;
  xpc_object_t empty;
  const char *path;

  _xpc_ktrace_pid0();
  _dyld_register_for_bulk_image_loads();
  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 16) == -1)
    v0 = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 24);
  else
    v0 = _os_alloc_once();
  v1 = (void *)_xpc_copy_own_bundle();
  v2 = xpc_bundle_copy_services((uint64_t)v1);
  if (v2)
  {
    v3 = v2;
    count = xpc_array_get_count(v2);
    xpc_release(v3);
    if (count)
    {
      empty = xpc_dictionary_create_empty();
      path = (const char *)xpc_bundle_get_path((uint64_t)v1);
      xpc_dictionary_set_uint64(empty, path, 2uLL);
      xpc_array_set_value(*(xpc_object_t *)(v0 + 112), 0xFFFFFFFFFFFFFFFFLL, empty);
      xpc_release(empty);
    }
  }
  xpc_release(v1);
  return _xpc_ktrace_pid0();
}

void _xpc_early_init(int a1)
{
  uint64_t v2;

  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 16) == -1)
    v2 = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 24);
  else
    v2 = _os_alloc_once();
  os_unfair_lock_lock_with_options();
  if (!a1)
    _xpc_init_pid_domain((_BYTE *)v2);
  if (_xpc_is_being_debugged())
    _xpc_uncork_pid_domain_locked(v2);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 104));
}

void _xpc_dyld_image_callback(unsigned int a1, _QWORD *a2, const char **a3)
{
  uint64_t v6;
  xpc_object_t v7;
  xpc_object_t v8;
  char *v9;
  char *v10;
  unint64_t v11;
  unint64_t v12;
  _BOOL4 v13;
  int v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  char *v18;
  size_t v19;
  uint64_t v20;
  uint64_t v21;
  xpc_object_t xdict;

  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 16) == -1)
    v6 = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 24);
  else
    v6 = _os_alloc_once();
  v21 = v6;
  if (*(_BYTE *)(v6 + 137))
  {
    v7 = xpc_dictionary_create(0, 0, 0);
  }
  else
  {
    v8 = (xpc_object_t)_initial_images;
    if (!_initial_images)
    {
      v8 = xpc_dictionary_create(0, 0, 0);
      _initial_images = (uint64_t)v8;
    }
    v7 = xpc_retain(v8);
  }
  xdict = v7;
  v9 = getenv("DYLD_IMAGE_SUFFIX");
  v10 = v9;
  if (v9 && !_xpc_equal_strings(v9, "_asan"))
  {
    v11 = 0;
    do
    {
      v12 = v11;
      if (v11 == 3)
        break;
      v13 = _xpc_equal_strings(v10, off_1EA9589D8[v11 + 1]);
      v11 = v12 + 1;
    }
    while (!v13);
    if (v12 >= 3)
      v10 = 0;
  }
  if (_xpc_dyld_image_callback_pred == -1)
  {
    if (!a1)
      goto LABEL_37;
  }
  else
  {
    dispatch_once(&_xpc_dyld_image_callback_pred, &__block_literal_global_3);
    if (!a1)
      goto LABEL_37;
  }
  v14 = 0;
  v15 = a1;
  do
  {
    if (*a2 != _xpc_dyld_image_callback_executableMH)
    {
      v16 = *a3;
      if (!_xpc_has_prefix(*a3, "/usr/lib")
        && !_xpc_has_prefix(v16, "/usr/local/lib")
        && !_xpc_has_suffix(v16, ".dylib"))
      {
        v17 = *a3;
        if (v10 && _xpc_has_suffix(*a3, v10))
        {
          v18 = _xpc_strdup(v17);
          v19 = strlen(v17);
          v18[v19 - strlen(v10)] = 0;
          v17 = v18;
        }
        else
        {
          v18 = 0;
        }
        xpc_dictionary_set_uint64(xdict, v17, 2uLL);
        ++v14;
        free(v18);
      }
    }
    ++a2;
    ++a3;
    --v15;
  }
  while (v15);
  if (v14 && (_xpc_services_unavailable() & 1) == 0 && *(_BYTE *)(v21 + 137))
  {
    if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 16) == -1)
      v20 = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 24);
    else
      v20 = _os_alloc_once();
    os_unfair_lock_lock_with_options();
    if (*(_BYTE *)(v20 + 108))
      _xpc_bootstrap_services(xdict);
    else
      xpc_array_set_value(*(xpc_object_t *)(v20 + 112), 0xFFFFFFFFFFFFFFFFLL, xdict);
    os_unfair_lock_unlock((os_unfair_lock_t)(v20 + 104));
  }
LABEL_37:
  xpc_release(xdict);
}

uint64_t ___xpc_dyld_image_callback_block_invoke()
{
  uint64_t result;

  result = _dyld_get_prog_image_header();
  _xpc_dyld_image_callback_executableMH = result;
  return result;
}

uint64_t _xpc_copy_own_bundle()
{
  uint32_t bufsize;
  char buf[1024];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C874D8];
  bzero(buf, 0x400uLL);
  bufsize = 1024;
  if (_NSGetExecutablePath(buf, &bufsize) || !bufsize)
    _xpc_rich_error_serialize_cold_1();
  return xpc_bundle_create(buf, 2u);
}

_BYTE *_xpc_init_pid_domain(_BYTE *result)
{
  uint64_t v1;
  xpc_object_t v2;
  pid_t v3;
  void *v4;
  char *property;
  int v6;
  xpc_object_t object;

  if (!result[109])
  {
    v1 = (uint64_t)result;
    if (!result[4] && !result[1])
    {
      result[109] = 1;
      _xpc_ktrace_pid0();
      v2 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_uint64(v2, "type", 5uLL);
      v3 = getpid();
      xpc_dictionary_set_uint64(v2, "handle", v3);
      _xpc_init_pid_domain_process_initial_images(v1, (void *)_initial_images, v2);
      xpc_dictionary_set_value(v2, "environment", (xpc_object_t)_environment);
      v4 = (void *)_xpc_copy_own_bundle();
      property = xpc_bundle_get_property((uint64_t)v4, 2);
      if (property)
        xpc_dictionary_set_string(v2, "origin", property);
      xpc_release(v4);
      object = 0;
      v6 = _xpc_domain_routine(802, v2, &object);
      if (object)
        xpc_release(object);
      if (v6 == 32 && !*(_BYTE *)(v1 + 137))
        _xpc_init_pid_domain_cold_1();
      xpc_release(v2);
      xpc_release((xpc_object_t)_initial_images);
      _initial_images = 0;
      xpc_release((xpc_object_t)_environment);
      _environment = 0;
      return (_BYTE *)_xpc_ktrace_pid0();
    }
  }
  return result;
}

uint64_t ___xpc_uncork_pid_domain_locked_block_invoke(uint64_t a1, const char *a2, void *a3)
{
  xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), a2, a3);
  return 1;
}

xpc_object_t _xpc_copy_xpcservice_dictionary()
{
  uint64_t v0;
  void *v1;

  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 16) == -1)
    v0 = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 24);
  else
    v0 = _os_alloc_once();
  if (*(_QWORD *)(v0 + 144) != -1)
    dispatch_once_f((dispatch_once_t *)(v0 + 144), 0, (dispatch_function_t)_fetch_xpcservice_info);
  v1 = *(void **)(v0 + 152);
  if (!v1)
  {
    if (!*(_BYTE *)(v0 + 3))
      _xpc_copy_xpcservice_dictionary_cold_1();
    _xpc_copy_xpcservice_dictionary_cold_2();
  }
  return xpc_retain(v1);
}

void ___xpc_register_service_listener_with_handler_block_invoke(uint64_t a1, xpc_object_t object)
{
  char *v3;
  void (*v4)(xpc_object_t);

  v4 = *(void (**)(xpc_object_t))(a1 + 40);
  if (xpc_get_type(object) == (xpc_type_t)OS_xpc_connection)
  {
    v4(object);
  }
  else
  {
    v3 = xpc_copy_description(object);
    syslog(3, "Bogus event received by listener connection:\n%s", v3);
    free(v3);
  }
}

uint64_t ___xpc_register_service_listener_with_handler_block_invoke_2(uint64_t a1)
{
  return _xpc_connection_activate_internal_listener(*(_WORD **)(a1 + 32));
}

void _xpc_start_listeners()
{
  uint64_t v0;
  xpc_object_t empty;
  void *v2;
  size_t count;
  size_t v4;
  size_t i;
  xpc_object_t value;
  void *v7;
  char *v8;
  _QWORD block[5];

  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 16) == -1)
    v0 = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 24);
  else
    v0 = _os_alloc_once();
  os_unfair_lock_lock_with_options();
  if ((*(_BYTE *)(v0 + 136) & 1) != 0)
  {
    v8 = _xpc_asprintf("_xpc_start_listeners may only be called once");
    _xpc_api_misuse(v8);
  }
  *(_BYTE *)(v0 + 136) |= 1u;
  empty = xpc_array_create_empty();
  v2 = *(void **)(v0 + 128);
  if (v2)
  {
    count = xpc_array_get_count(*(xpc_object_t *)(v0 + 128));
    if (count)
    {
      v4 = count;
      for (i = 0; i != v4; ++i)
      {
        value = xpc_array_get_value(v2, i);
        xpc_array_append_value(empty, value);
      }
    }
  }
  v7 = *(void **)(v0 + 120);
  if (v7)
    xpc_array_append_value(empty, v7);
  block[0] = MEMORY[0x1E0C87450];
  block[1] = 0x40000000;
  block[2] = ___xpc_start_listeners_block_invoke;
  block[3] = &__block_descriptor_tmp_77;
  block[4] = empty;
  dispatch_async(MEMORY[0x1E0C86EF8], block);
  os_unfair_lock_unlock((os_unfair_lock_t)(v0 + 104));
}

void ___xpc_start_listeners_block_invoke(uint64_t a1)
{
  size_t count;
  size_t v3;
  size_t i;
  _WORD *value;

  count = xpc_array_get_count(*(xpc_object_t *)(a1 + 32));
  if (count)
  {
    v3 = count;
    for (i = 0; i != v3; ++i)
    {
      value = xpc_array_get_value(*(xpc_object_t *)(a1 + 32), i);
      _xpc_connection_activate_internal_listener(value);
    }
  }
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

uint64_t _xpc_serializer_munmap(void *a1, size_t a2)
{
  uint64_t result;

  result = munmap(a1, a2);
  if ((_DWORD)result == -1)
    return _xpc_fd_desc_cold_1();
  return result;
}

uint64_t _xpc_serializer_copy()
{
  return 0;
}

uint64_t _xpc_serializer_hash()
{
  return 0;
}

uint64_t _xpc_serializer_desc(unint64_t *a1, uint64_t a2)
{
  return _xpc_base_desc(a1, a2);
}

size_t _xpc_serializer_debug(uint64_t a1, char *a2, size_t a3)
{
  const void *msg;
  size_t result;
  const char *v8;

  msg = (const void *)dispatch_mach_msg_get_msg();
  dispatch_mach_msg_get_msg();
  result = 0;
  if (a3 >= 2)
  {
    if ((*(_BYTE *)(a1 + 156) & 4) != 0)
      v8 = "true";
    else
      v8 = "false";
    LODWORD(result) = snprintf(a2, a3, ", hdr = %p, hdr size = %lu, graph = %p, graph sz = %lu, out-of-line = %s", msg, 0, *(const void **)(a1 + 32), *(_QWORD *)(a1 + 40), v8);
    if ((int)result >= a3)
      return a3 - 1;
    else
      return (int)result;
  }
  return result;
}

uint64_t _xpc_serializer_deserialize()
{
  return 0;
}

uint64_t _xpc_serializer_wire_length()
{
  return 0;
}

void _xpc_serializer_dispose(uint64_t a1)
{
  NSObject *v2;
  mach_msg_header_t *msg;

  v2 = *(NSObject **)(a1 + 24);
  if (v2)
  {
    if ((*(_BYTE *)(a1 + 156) & 2) == 0)
    {
      msg = (mach_msg_header_t *)dispatch_mach_msg_get_msg();
      _xpc_mach_port_cleanup_right(msg->msgh_local_port, (msg->msgh_bits >> 8) & 0x1F);
      mach_msg_destroy(msg);
      v2 = *(NSObject **)(a1 + 24);
    }
    dispatch_release(v2);
  }
  _xpc_serializer_cleanup(a1);
}

uint64_t _xpc_serializer_create()
{
  return _xpc_base_create();
}

uint64_t _xpc_serializer_create_for_description()
{
  uint64_t v0;
  void *v1;

  v0 = _xpc_base_create();
  v1 = _xpc_alloc(0x400uLL);
  *(_QWORD *)(v0 + 32) = v1;
  *(_QWORD *)(v0 + 40) = 1024;
  *(_QWORD *)(v0 + 48) = v1;
  *(_QWORD *)(v0 + 56) = 1024;
  *(_QWORD *)(v0 + 64) = _xpc_serializer_free;
  *(_BYTE *)(v0 + 156) |= 8u;
  return v0;
}

uint64_t _xpc_serializer_create_for_data()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  int v4;
  int __src;

  __src = 1108555586;
  v4 = 5;
  v0 = _xpc_base_create();
  *(_QWORD *)(v0 + 40) = 1024;
  v1 = _xpc_alloc(0x400uLL);
  *(_QWORD *)(v0 + 32) = v1;
  v2 = *(_QWORD *)(v0 + 40);
  *(_QWORD *)(v0 + 48) = v1;
  *(_QWORD *)(v0 + 56) = v2;
  *(_QWORD *)(v0 + 64) = _xpc_serializer_free;
  *(_BYTE *)(v0 + 156) |= 0x40u;
  _xpc_serializer_append(v0, &__src, 4uLL, 0);
  _xpc_serializer_append(v0, &v4, 4uLL, 0);
  return v0;
}

uint64_t _xpc_serializer_append(uint64_t result, void *__src, size_t __n, int a4)
{
  uint64_t v7;
  size_t v8;
  size_t v9;
  size_t v10;
  uint64_t v11;
  size_t v12;
  size_t v13;
  char *v14;
  size_t v15;
  char *v16;
  char __str[16];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C874D8];
  if ((*(_DWORD *)(result + 16) & 5) == 1)
  {
    v16 = _xpc_asprintf("Attempt to append to a serializer created from the wire.", __src, __n);
    _xpc_api_misuse(v16);
  }
  if (__src)
  {
    v7 = result;
    v8 = (__n + 3) & 0xFFFFFFFFFFFFFFFCLL;
    if (a4)
      v9 = (__n + 3) & 0xFFFFFFFFFFFFFFFCLL;
    else
      v9 = __n;
    v10 = *(_QWORD *)(result + 56);
    if (v10 < v9)
    {
      if ((*(_BYTE *)(result + 156) & 0x48) == 0)
      {
        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        v19 = 0u;
        v20 = 0u;
        *(_OWORD *)__str = 0u;
        v18 = 0u;
        result = snprintf(__str, 0xA0uLL, "full graph sz = %zu, remaining = %zu, needed = %zu", *(_QWORD *)(result + 40), v10, v9);
        qword_1F0460B90 = (uint64_t)__str;
        __break(1u);
        return result;
      }
      v11 = *(_QWORD *)(result + 40);
      v12 = v11 - v10;
      v13 = ((v9 - v10 + 3) & 0xFFFFFFFFFFFFFFFCLL) + 2 * v11;
      v14 = (char *)_xpc_realloc(*(void **)(result + 32), v11, v13);
      *(_QWORD *)(v7 + 32) = v14;
      *(_QWORD *)(v7 + 40) = v13;
      *(_QWORD *)(v7 + 48) = &v14[v12];
      *(_QWORD *)(v7 + 56) = v13 - v12;
    }
    if (a4)
      bzero((void *)(*(_QWORD *)(v7 + 48) + __n), v8 - __n);
    result = (uint64_t)memcpy(*(void **)(v7 + 48), __src, __n);
    v15 = *(_QWORD *)(v7 + 56) - v9;
    *(_QWORD *)(v7 + 48) += v9;
    *(_QWORD *)(v7 + 56) = v15;
  }
  return result;
}

uint64_t _xpc_serializer_pack(uint64_t a1, uint64_t a2, unsigned int a3, char a4)
{
  size_t v8;
  uint64_t v9;
  BOOL v11;
  uint64_t v12;
  _DWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  int v21;
  int *extension_vtable;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t msg;
  int v27;
  unint64_t v28;
  int transaction;
  char v30;
  int v31;
  char *v33;
  size_t v34;
  uint64_t v35;
  _QWORD v36[3];
  uint64_t v37;
  uint64_t v38;

  _xpc_ktrace_pid1();
  v37 = 8;
  v38 = 0;
  v36[0] = a1;
  v36[1] = &v37;
  v36[2] = &v38;
  _xpc_serializer_apply(a2, (uint64_t)v36);
  v8 = v37;
  if (12 * v38)
    v9 = 12 * v38 + 28;
  else
    v9 = 24;
  v35 = 0;
  v11 = (a4 & 1) == 0 && (unint64_t)(v9 + v37) < 0x3FBD;
  if ((a4 & 2) != 0 || v11)
  {
    *(_QWORD *)(a1 + 24) = dispatch_mach_msg_create();
    v13 = (_DWORD *)(v35 + v9);
  }
  else
  {
    v12 = 16;
    if (!v38)
      v12 = 20;
    if ((unint64_t)(v9 + v12) > 0x40000)
      _xpc_serializer_pack_cold_3();
    *(_QWORD *)(a1 + 24) = dispatch_mach_msg_create();
    v34 = v8;
    v13 = _xpc_mmap_anon(&v34);
    *(_QWORD *)(a1 + 64) = _xpc_serializer_munmap;
    *(_BYTE *)(a1 + 156) |= 4u;
  }
  v14 = v38;
  if (v38)
  {
    v15 = v35 + 44;
    if ((*(_BYTE *)(a1 + 156) & 4) == 0)
      v15 = v35 + 28;
    *(_QWORD *)(a1 + 72) = v15;
    *(_QWORD *)(a1 + 88) = v14;
  }
  dispatch_set_context(*(dispatch_object_t *)(a1 + 24), (void *)a1);
  *(_QWORD *)(a1 + 32) = v13;
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v13;
  *(_QWORD *)(a1 + 56) = v8;
  if (a3 >= 4)
    _xpc_serializer_pack_cold_1();
  *v13 = dword_1DEEBD120[a3];
  v13[1] = 5;
  *(_QWORD *)(a1 + 48) = v13 + 2;
  *(_QWORD *)(a1 + 56) = v8 - 8;
  if (a2 < 0)
  {
    v16 = 0;
    v17 = *MEMORY[0x1E0DE7C58];
    if ((~a2 & 0xC000000000000007) == 0)
      v17 = 0;
    v18 = v17 ^ a2;
    do
    {
      if ((v18 & 7) == *(_BYTE *)(MEMORY[0x1E0DE7C48] + v16))
        break;
      ++v16;
    }
    while (v16 != 7);
    v19 = v16 | v18;
    v20 = v16 & 7;
    v21 = (v19 >> 55) + 8;
    if (v20 == 7)
      LODWORD(v20) = v21;
    if ((_DWORD)v20 == 12)
    {
      extension_vtable = &_OS_xpc_type_uint64;
    }
    else
    {
      if ((_DWORD)v20 != 13)
      {
        v33 = _xpc_asprintf("Object is not an XPC object");
        _xpc_api_misuse(v33);
      }
      extension_vtable = &_OS_xpc_type_int64;
    }
  }
  else
  {
    v23 = *(_QWORD *)a2;
    if (*(_QWORD *)a2 < (unint64_t)OS_xpc_object
      || v23 > (unint64_t)OS_xpc_rich_error
      || (v23 & 7) != 0)
    {
      extension_vtable = _xpc_get_extension_vtable((id)a2);
    }
    else
    {
      extension_vtable = (int *)((char *)&_xpc_vtables + 2 * (v23 - (_QWORD)OS_xpc_object));
    }
  }
  (*((void (**)(uint64_t, uint64_t))extension_vtable + 9))(a2, a1);
  v25 = *(_QWORD *)(a1 + 88);
  v24 = *(_QWORD *)(a1 + 96);
  if (v24 != v25)
    _xpc_serializer_pack_cold_2(v24, v25, (void *)a2);
  msg = dispatch_mach_msg_get_msg();
  v36[0] = 0;
  dispatch_mach_msg_get_msg();
  v27 = v36[0];
  v28 = *(_QWORD *)(a1 + 88) + (((unint64_t)*(unsigned __int8 *)(a1 + 156) >> 2) & 1);
  if (xpc_get_type((xpc_object_t)a2) == (xpc_type_t)OS_xpc_dictionary)
  {
    *(_QWORD *)(a1 + 128) = _xpc_dictionary_extract_importance_voucher(a2);
    transaction = _xpc_dictionary_get_transaction(a2);
    v30 = transaction ? 16 : 0;
    *(_BYTE *)(a1 + 156) = *(_BYTE *)(a1 + 156) & 0xEF | v30;
    if (transaction)
      _xpc_dictionary_set_transaction(a2, 0);
  }
  *(_DWORD *)msg = (v28 != 0) << 31;
  *(_DWORD *)(msg + 4) = v27;
  *(_OWORD *)(msg + 8) = xmmword_1DEEBD220;
  if (v28)
  {
    *(_DWORD *)(msg + 24) = v28;
    if ((*(_BYTE *)(a1 + 156) & 4) != 0)
    {
      *(_QWORD *)(a1 + 64) = 0;
      v31 = (*(_DWORD *)(a1 + 40) + *MEMORY[0x1E0C88820] - 1) & -*MEMORY[0x1E0C88820];
      *(_QWORD *)(msg + 28) = *(_QWORD *)(a1 + 32);
      *(_DWORD *)(msg + 36) = 16777473;
      *(_DWORD *)(msg + 40) = v31;
    }
  }
  *(_BYTE *)(a1 + 156) |= 1u;
  dispatch_mach_msg_get_msg();
  _xpc_ktrace_pid2();
  return dispatch_mach_msg_get_msg();
}

uint64_t _xpc_serializer_get_mach_message_header()
{
  return dispatch_mach_msg_get_msg();
}

void _xpc_serializer_clear_sent_descriptors(uint64_t a1)
{
  char v1;
  char *v2;

  if ((*(_BYTE *)(a1 + 16) & 1) != 0)
  {
    v2 = _xpc_asprintf("Attempt to clear sent descriptors on a serializer created from the wire.");
    goto LABEL_8;
  }
  v1 = *(_BYTE *)(a1 + 156);
  if ((v1 & 1) == 0)
  {
    v2 = _xpc_asprintf("Attempt to clear sent descriptors on an unpacked serializer.");
LABEL_8:
    _xpc_api_misuse(v2);
  }
  if ((*(_BYTE *)(a1 + 156) & 4) != 0)
    *(_QWORD *)(a1 + 64) = 0;
  *(_BYTE *)(a1 + 156) = v1 | 2;
  _xpc_serializer_cleanup(a1);
}

void _xpc_serializer_cleanup(uint64_t a1)
{
  void (*v2)(_QWORD, _QWORD);
  void *v3;
  unint64_t v4;
  unint64_t i;
  uint64_t v6;
  void *v7;

  v2 = *(void (**)(_QWORD, _QWORD))(a1 + 64);
  if (v2)
  {
    if ((*(_BYTE *)(a1 + 156) & 0x4C) == 0)
      _xpc_serializer_cleanup_cold_1();
    v2(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    *(_QWORD *)(a1 + 64) = 0;
  }
  v3 = *(void **)(a1 + 80);
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 88);
    if (v4)
    {
      for (i = 0; i < v4; ++i)
      {
        v6 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8 * i);
        if (v6)
        {
          _xpc_release(v6);
          v4 = *(_QWORD *)(a1 + 88);
        }
      }
      v3 = *(void **)(a1 + 80);
    }
    free(v3);
    *(_QWORD *)(a1 + 80) = 0;
  }
  v7 = *(void **)(a1 + 128);
  if (v7)
  {
    os_release(v7);
    *(_QWORD *)(a1 + 128) = 0;
  }
  if ((*(_BYTE *)(a1 + 156) & 0x10) != 0)
  {
    _xpc_transaction_end();
    *(_BYTE *)(a1 + 156) &= ~0x10u;
  }
}

uint64_t _xpc_serializer_reap_combined_send_receive(uint64_t a1)
{
  uint64_t v1;

  if ((*(_BYTE *)(a1 + 156) & 2) == 0)
    _xpc_mach_message_request_handoff_reply_cold_1();
  if (*(_QWORD *)(a1 + 64))
    _xpc_mach_message_request_handoff_reply_cold_1();
  v1 = *(_QWORD *)(a1 + 24);
  if (!v1)
    _xpc_mach_message_request_handoff_reply_cold_1();
  *(_QWORD *)(a1 + 24) = 0;
  return v1;
}

void _xpc_serializer_destroy(_DWORD *a1)
{
  if (a1[3] != 1)
    _xpc_mach_message_request_handoff_reply_cold_1();
  xpc_release(a1);
}

uint64_t _xpc_serializer_append_port(_QWORD *a1, void *a2, size_t a3, uint64_t a4, int a5, int a6)
{
  uint64_t result;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _DWORD *v14;

  result = _xpc_serializer_append((uint64_t)a1, a2, a3, 1);
  if ((a6 - 16) >= 3)
  {
    if (a6 != 19)
      _xpc_serializer_append_port_cold_1();
    if (!a1[10])
    {
      v11 = a1[11];
      if (v11 >> 61)
      {
        __break(1u);
        return result;
      }
      a1[10] = _xpc_alloc(8 * v11);
    }
    result = _xpc_retain(a4);
    *(_QWORD *)(a1[10] + 8 * a1[12]) = result;
  }
  v12 = a1[12];
  if (v12 >= a1[11])
    _xpc_serializer_append_port_cold_2();
  v13 = a1[9];
  a1[12] = v12 + 1;
  v14 = (_DWORD *)(v13 + 12 * v12);
  *v14 = a5;
  v14[1] = 0;
  v14[2] = a6 << 16;
  return result;
}

uint64_t _xpc_serializer_pad(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 112) + 1;
  *(_QWORD *)(a1 + 112) = v1;
  return v1;
}

uint64_t _xpc_serializer_unpad(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 112) - 1;
  *(_QWORD *)(a1 + 112) = v1;
  return v1;
}

uint64_t _xpc_serializer_get_graph_ptr(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 32) + a2;
}

uint64_t _xpc_serializer_get_graph_length(uint64_t a1)
{
  return *(_QWORD *)(a1 + 48) - *(_QWORD *)(a1 + 32);
}

uint64_t _xpc_serializer_get_mach_message_length()
{
  dispatch_mach_msg_get_msg();
  return 0;
}

uint64_t _xpc_serializer_reset_mach_message_header(uint64_t a1)
{
  uint64_t result;

  dispatch_release(*(dispatch_object_t *)(a1 + 24));
  result = dispatch_mach_msg_create();
  *(_QWORD *)(a1 + 24) = result;
  return result;
}

uint64_t _xpc_connection_reply_callout(uint64_t a1)
{
  _xpc_ktrace_pid1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 136) + 16))();
  _xpc_ktrace_pid1();
  return _os_avoid_tail_call();
}

unsigned int *_xpc_serializer_apply(uint64_t object, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  unint64_t v12;
  unsigned int *result;

  v4 = *(_QWORD **)(a2 + 8);
  if (object < 0)
  {
    v5 = 0;
    v6 = *MEMORY[0x1E0DE7C58];
    if ((~object & 0xC000000000000007) == 0)
      v6 = 0;
    v7 = v6 ^ object;
    do
    {
      if ((v7 & 7) == *(_BYTE *)(MEMORY[0x1E0DE7C48] + v5))
        break;
      ++v5;
    }
    while (v5 != 7);
    v8 = v5 | v7;
    v9 = v5 & 7;
    v10 = ((v8 >> 55) & 0xFE) + 8;
    if (v9 == 7)
      LOWORD(v9) = v10;
    v11 = v9 & 0x1FE;
    if (v11 != 12)
      _xpc_serializer_apply_cold_1();
  }
  else
  {
    v12 = *(unsigned int *)(object + 16);
    *v4 += *(unsigned int *)(object + 20) + 4;
    v4 = *(_QWORD **)(a2 + 16);
    v11 = (v12 >> 1) & 1;
  }
  *v4 += v11;
  if (xpc_get_type((xpc_object_t)object) == (xpc_type_t)OS_xpc_array)
    return (unsigned int *)xpc_array_apply_f(object, a2, (uint64_t (*)(unint64_t, _QWORD, uint64_t))_xpc_serializer_array_apply);
  result = (unsigned int *)xpc_get_type((xpc_object_t)object);
  if (result == (unsigned int *)OS_xpc_dictionary)
    return xpc_dictionary_apply_f((_DWORD *)object, a2, (uint64_t)_xpc_serializer_dictionary_apply);
  return result;
}

uint64_t _xpc_serializer_array_apply(int a1, xpc_object_t object)
{
  return _xpc_serializer_apply(object);
}

uint64_t _xpc_serializer_dictionary_apply(const char *a1, void *a2, uint64_t a3)
{
  **(_QWORD **)(a3 + 8) += (strlen(a1) & 0xFFFFFFFFFFFFFFFCLL) + 4;
  return _xpc_serializer_apply(a2);
}

BOOL _xpc_mach_send_equal(uint64_t a1, uint64_t a2)
{
  return *(_DWORD *)(a1 + 24) == *(_DWORD *)(a2 + 24);
}

uint64_t _xpc_mach_send_hash(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

uint64_t _xpc_mach_send_desc(unsigned int *a1, uint64_t a2)
{
  unsigned int *v4;
  int v5;
  int v6;
  const char *v7;
  unsigned int v8;
  int v9;
  int v11;
  char __str[16];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C874D8];
  v11 = 0;
  v4 = (unsigned int *)MEMORY[0x1E0C883F0];
  v5 = MEMORY[0x1DF0F0E78](*MEMORY[0x1E0C883F0], a1[6], 0, &v11);
  if (v5)
  {
    if (v5 == 15)
    {
      v7 = "(none)";
    }
    else if (v5 == 17)
    {
      v6 = MEMORY[0x1DF0F0E78](*v4, a1[6], 4, &v11);
      v7 = "(invalid)";
      if (!v6)
        v7 = "dead-name";
    }
    else
    {
      v7 = "(invalid)";
    }
  }
  else
  {
    v7 = "send";
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  *(_OWORD *)__str = 0u;
  v13 = 0u;
  v8 = snprintf(__str, 0x80uLL, "<%s: %p> { name = %u, right = %s, urefs = %u }", "mach send right", a1, a1[6], v7, v11);
  if (v8 >= 0x7F)
    v9 = 127;
  else
    v9 = v8;
  return _xpc_serializer_append(a2, __str, (v9 + 1), 0);
}

uint64_t _xpc_mach_send_debug(uint64_t a1, char *__str, size_t __size)
{
  return snprintf(__str, __size, ", port = 0x%x", *(_DWORD *)(a1 + 24));
}

uint64_t _xpc_mach_send_serialize(uint64_t a1, _QWORD *a2)
{
  int v2;
  char *v4;
  int v5;

  v2 = *(_DWORD *)(a1 + 24);
  if (v2 == -2)
  {
    v4 = _xpc_asprintf("Cannot serialize an xpc_mach_send object and use _xpc_mach_send_extract_right at the same time");
    _xpc_api_misuse(v4);
  }
  v5 = 53248;
  return _xpc_serializer_append_port(a2, &v5, 4uLL, a1, v2, 19);
}

uint64_t _xpc_mach_send_deserialize(uint64_t *a1)
{
  int v1;
  uint64_t result;
  int v3;
  int v4;

  v4 = 0;
  if (!_xpc_graph_deserializer_read_port(a1, 17, &v4))
    return 0;
  v1 = v4;
  result = _xpc_base_create();
  v3 = *(_DWORD *)(result + 16);
  *(_DWORD *)(result + 24) = v1;
  *(_DWORD *)(result + 16) = v3 | 3;
  return result;
}

uint64_t _xpc_mach_send_wire_length()
{
  return -1;
}

uint64_t _xpc_mach_send_dispose(uint64_t a1)
{
  unsigned int *v1;
  uint64_t result;

  v1 = (unsigned int *)(a1 + 24);
  do
    result = __ldxr(v1);
  while (__stxr(0xFFFFFFFF, v1));
  if ((result - 1) <= 0xFFFFFFFC)
  {
    result = _xpc_mach_port_release(result);
    if ((_DWORD)result)
      return _os_assumes_log();
  }
  return result;
}

uint64_t xpc_mach_send_create(mach_port_name_t a1)
{
  return xpc_mach_send_create_with_disposition(a1, 19);
}

uint64_t xpc_mach_send_create_with_disposition(mach_port_name_t name, int a2)
{
  mach_port_name_t v2;
  int send;
  uint64_t result;
  char *v6;

  v2 = name;
  if (name - 1 > 0xFFFFFFFD || a2 == 17)
    goto LABEL_13;
  if (a2 == 19)
  {
    send = _xpc_mach_port_retain_send(name);
    if (!send)
      goto LABEL_13;
    goto LABEL_10;
  }
  if (a2 != 20)
  {
    v6 = _xpc_asprintf("Invalid disposition");
    _xpc_api_misuse(v6);
  }
  send = _xpc_mach_port_make_send(name);
  if (send)
  {
LABEL_10:
    if (send != 17)
      _os_assumes_log();
    v2 = -1;
  }
LABEL_13:
  result = _xpc_base_create();
  *(_DWORD *)(result + 16) |= 2u;
  *(_DWORD *)(result + 24) = v2;
  return result;
}

uint64_t xpc_mach_send_get_right(unsigned int *a1)
{
  uint64_t result;
  char *v3;

  if (xpc_get_type(a1) != (xpc_type_t)OS_xpc_mach_send)
    return 0;
  result = a1[6];
  if ((_DWORD)result == -2)
  {
    v3 = _xpc_asprintf("Cannot use xpc_mach_send_get_right and _xpc_mach_send_extract_right at the same time");
    _xpc_api_misuse(v3);
  }
  return result;
}

uint64_t _xpc_mach_send_extract_right(unsigned int *a1)
{
  uint64_t result;
  unsigned int *v3;
  char *v4;

  if (xpc_get_type(a1) != (xpc_type_t)OS_xpc_mach_send)
    return 0;
  v3 = a1 + 6;
  do
    result = __ldxr(v3);
  while (__stxr(0xFFFFFFFE, v3));
  if ((_DWORD)result == -2)
  {
    v4 = _xpc_asprintf("Cannot call _xpc_mach_send_extract_right twice");
    _xpc_api_misuse(v4);
  }
  return result;
}

uint64_t xpc_mach_send_copy_right(unsigned int *a1)
{
  uint64_t right;
  uint64_t v2;
  int v3;

  right = xpc_mach_send_get_right(a1);
  v2 = right;
  if ((right - 1) <= 0xFFFFFFFD)
  {
    v3 = _xpc_mach_port_retain_send(right);
    if (v3 <= 16)
    {
      if (!v3)
        return v2;
      if (v3 == 15)
        xpc_mach_send_copy_right_cold_1();
    }
    else
    {
      if (v3 == 17)
        return 0;
      if (v3 == 19)
      {
        _os_assumes_log();
        return v2;
      }
    }
    _os_assumes_log();
    return 0;
  }
  return v2;
}

xpc_object_t xpc_create_reply_with_format(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return _create_with_format_and_arguments(a1, a2, (uint64_t)&a9);
}

xpc_object_t _create_with_format_and_arguments(void *a1, const char *a2, uint64_t a3)
{
  char *v5;
  xpc_object_t reply;
  xpc_object_t v7;
  const char *v8;
  char *v10;
  _QWORD v11[8];
  _QWORD v12[13];
  _QWORD v13[8];
  _QWORD v14[14];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  _QWORD *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  _QWORD *v26;
  _QWORD v27[2];
  uint64_t (*v28)(_QWORD *);
  void *v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t *v32;
  const char *v33;
  _QWORD v34[8];
  _QWORD v35[8];
  _QWORD v36[6];
  _QWORD v37[3];
  int v38;
  _QWORD v39[3];
  char v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD v45[4];
  uint64_t v46;

  v46 = a3;
  v5 = _xpc_strdup(a2);
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x2000000000;
  v41 = 0;
  v42 = &v41;
  v43 = 0x2000000000;
  v44 = 0;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2000000000;
  v40 = 0;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2000000000;
  v38 = 0;
  v45[3] = v46;
  v36[0] = MEMORY[0x1E0C87450];
  v36[1] = 0x40000000;
  v36[2] = ___create_with_format_and_arguments_block_invoke;
  v36[3] = &unk_1EA958A80;
  v36[4] = &v41;
  v36[5] = a2;
  v35[0] = MEMORY[0x1E0C87450];
  v35[1] = 0x40000000;
  v35[2] = ___create_with_format_and_arguments_block_invoke_2;
  v35[3] = &unk_1EA958AA8;
  v35[6] = a2;
  v35[7] = v5;
  v35[5] = &v41;
  v35[4] = v36;
  v33 = a2;
  v34[0] = MEMORY[0x1E0C87450];
  v34[1] = 0x40000000;
  v34[2] = ___create_with_format_and_arguments_block_invoke_3;
  v34[3] = &unk_1EA958AD0;
  v34[6] = v5;
  v34[7] = a2;
  v34[5] = &v41;
  v34[4] = v36;
  v27[0] = MEMORY[0x1E0C87450];
  v27[1] = 0x40000000;
  v28 = ___create_with_format_and_arguments_block_invoke_4;
  v29 = &unk_1EA958AF8;
  v30 = v35;
  v31 = v34;
  v32 = &v41;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3002000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3002000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v14[0] = MEMORY[0x1E0C87450];
  v14[1] = 0x40000000;
  v14[2] = ___create_with_format_and_arguments_block_invoke_8;
  v14[3] = &unk_1EA958CB0;
  v14[8] = &v21;
  v14[9] = &v15;
  v14[4] = v34;
  v14[5] = v36;
  v14[10] = v45;
  v14[11] = v37;
  v14[12] = v39;
  v14[13] = a2;
  v14[6] = v27;
  v14[7] = &v41;
  v13[0] = MEMORY[0x1E0C87450];
  v13[1] = 0x40000000;
  v13[2] = ___create_with_format_and_arguments_block_invoke_12;
  v13[3] = &unk_1EA958CD8;
  v13[6] = &v41;
  v13[7] = a2;
  v13[4] = v36;
  v13[5] = v14;
  v26 = v13;
  v12[0] = MEMORY[0x1E0C87450];
  v12[1] = 0x40000000;
  v12[2] = ___create_with_format_and_arguments_block_invoke_13;
  v12[3] = &unk_1EA958D00;
  v12[4] = v27;
  v12[5] = v36;
  v12[11] = v39;
  v12[12] = a2;
  v12[8] = &v21;
  v12[9] = &v15;
  v12[6] = v34;
  v12[7] = &v41;
  v12[10] = v45;
  v11[0] = MEMORY[0x1E0C87450];
  v11[1] = 0x40000000;
  v11[2] = ___create_with_format_and_arguments_block_invoke_14;
  v11[3] = &unk_1EA958D28;
  v11[6] = &v41;
  v11[7] = a2;
  v11[4] = v36;
  v11[5] = v12;
  v20 = v11;
  ___create_with_format_and_arguments_block_invoke((uint64_t)v36, 0);
  if (a2[v42[3]] == 123)
  {
    if (a1)
      reply = xpc_dictionary_create_reply(a1);
    else
      reply = xpc_dictionary_create(0, 0, 0);
    v7 = reply;
    (*(void (**)(void))(v16[5] + 16))();
  }
  else
  {
    if (a1)
    {
      v10 = _xpc_asprintf("Reply format must specify a dictionary!");
      _xpc_api_misuse(v10);
    }
    v7 = xpc_array_create(0, 0);
    if (a2[v42[3]] != 91)
    {
      v8 = (const char *)v28(v27);
      xpc_array_set_string(v7, 0xFFFFFFFFFFFFFFFFLL, v8);
    }
    (*(void (**)(void))(v22[5] + 16))();
  }
  free(v5);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(v37, 8);
  _Block_object_dispose(v39, 8);
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(v45, 8);
  return v7;
}

xpc_object_t xpc_create_with_format(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return _create_with_format_and_arguments(0, a1, (uint64_t)&a9);
}

xpc_object_t xpc_create_with_format_and_arguments(const char *a1, uint64_t a2)
{
  return _create_with_format_and_arguments(0, a1, a2);
}

uint64_t ___create_with_format_and_arguments_block_invoke(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t result;

  if (a2)
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v4 = *(_QWORD *)(v3 + 24);
    if (*(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + v4) != a2)
      _xpc_mach_message_request_handoff_reply_cold_1();
    *(_QWORD *)(v3 + 24) = v4 + 1;
  }
  v5 = MEMORY[0x1E0C87458];
  while (1)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(_QWORD *)(v6 + 24);
    v8 = *(char *)(*(_QWORD *)(a1 + 40) + v7);
    if ((v8 & 0x80000000) != 0)
      break;
    result = *(_DWORD *)(v5 + 4 * v8 + 60) & 0x4000;
    if (!(_DWORD)result)
      return result;
LABEL_9:
    *(_QWORD *)(v6 + 24) = v7 + 1;
  }
  result = __maskrune(v8, 0x4000uLL);
  if ((_DWORD)result)
    goto LABEL_9;
  return result;
}

uint64_t ___create_with_format_and_arguments_block_invoke_2(_QWORD *a1, unsigned __int8 a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;

  v2 = a1[6];
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(_QWORD *)(v3 + 24);
  if (*(unsigned __int8 *)(v2 + v4) != a2)
    _xpc_mach_message_request_handoff_reply_cold_1();
  *(_QWORD *)(v3 + 24) = v4 + 1;
  v5 = a1[7];
  v6 = *(_QWORD *)(a1[5] + 8);
  v9 = *(_QWORD *)(v6 + 24);
  v8 = (_QWORD *)(v6 + 24);
  v7 = v9;
  v10 = *(unsigned __int8 *)(v2 + v9);
  if (!*(_BYTE *)(v2 + v9) || v10 == a2)
  {
    v11 = v7;
  }
  else
  {
    v11 = v7;
    do
    {
      *v8 = v11 + 1;
      v12 = *(_QWORD *)(a1[5] + 8);
      v13 = *(_QWORD *)(v12 + 24);
      v8 = (_QWORD *)(v12 + 24);
      v11 = v13;
      v14 = *(unsigned __int8 *)(v2 + v13);
    }
    while (*(_BYTE *)(v2 + v13) && v14 != a2);
  }
  v15 = v5 + v7;
  *(_BYTE *)(v5 + v11) = 0;
  (*(void (**)(void))(a1[4] + 16))();
  return v15;
}

uint64_t ___create_with_format_and_arguments_block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  unsigned int v7;

  v2 = a1[6];
  v3 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  v4 = MEMORY[0x1E0C87458];
  for (i = v3; ; i = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    v6 = a1[7];
    v7 = *(char *)(v6 + i);
    if ((v7 & 0x80000000) != 0)
    {
      if (__maskrune(*(char *)(v6 + i), 0x500uLL))
        goto LABEL_8;
    }
    else if ((*(_DWORD *)(v4 + 4 * v7 + 60) & 0x500) != 0)
    {
      goto LABEL_8;
    }
    if (!v7 || !memchr("!-_;./?", v7, 8uLL))
      break;
LABEL_8:
    ++*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  }
  *(_BYTE *)(a1[6] + *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24)) = 0;
  (*(void (**)(void))(a1[4] + 16))();
  return v2 + v3;
}

uint64_t ___create_with_format_and_arguments_block_invoke_4(_QWORD *a1)
{
  char *v2;

  if (v2)
    return (*(uint64_t (**)(_QWORD, _QWORD))(a1[4] + 16))(a1[4], *v2);
  else
    return (*(uint64_t (**)(void))(a1[5] + 16))();
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 135);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 135);
}

void *___create_with_format_and_arguments_block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  xpc_object_t v7;
  const char *v8;
  size_t v9;
  int v10;
  _BYTE *v11;
  unsigned int *v12;
  BOOL v13;
  uint64_t v14;
  _QWORD *v15;
  const char *v16;
  BOOL v17;
  BOOL v18;
  int v19;
  void *result;
  char *v21;
  _QWORD v22[5];
  __int128 v23;
  void *v24;
  _QWORD v25[7];
  BOOL v26;
  _QWORD v27[5];
  __int128 v28;
  void *v29;
  _QWORD v30[7];
  BOOL v31;
  _QWORD v32[7];
  _QWORD v33[7];
  _QWORD v34[7];
  _QWORD v35[5];
  __int128 v36;
  void *v37;
  _QWORD v38[7];
  _QWORD v39[5];
  __int128 v40;
  void *v41;
  BOOL v42;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v5 = *(_QWORD *)(v4 + 24);
  v6 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 104) + v5);
  switch(v6)
  {
    case '%':
      *(_QWORD *)(v4 + 24) = v5 + 1;
      v8 = (const char *)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      v9 = strlen(v8);
      if (!v9)
        _xpc_mach_message_request_handoff_reply_cold_1();
      v10 = v9;
      v11 = memchr("*+", *(char *)(*(_QWORD *)(a1 + 104) + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)), 3uLL);
      if (v11)
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      v12 = xpc_format_specifiers_lookup(v8, v10);
      if (!v12)
      {
        v21 = _xpc_asprintf("Invalid format specifier!");
        goto LABEL_42;
      }
      switch(v12[2])
      {
        case 1u:
          v13 = v12[1] == 1;
          v39[0] = MEMORY[0x1E0C87450];
          v39[1] = 0x40000000;
          v39[2] = ___create_with_format_and_arguments_block_invoke_2_12;
          v39[3] = &unk_1EA958B20;
          v39[4] = *(_QWORD *)(a1 + 80);
          v41 = a2;
          v42 = v13;
          v40 = *(_OWORD *)(a1 + 88);
          v14 = v40;
          v15 = v39;
          goto LABEL_30;
        case 2u:
          if (v11)
          {
            v21 = _xpc_asprintf("Invalid rest suffix for 'BOOL' format specifier!");
            goto LABEL_42;
          }
          v38[0] = MEMORY[0x1E0C87450];
          v38[1] = 0x40000000;
          v38[2] = ___create_with_format_and_arguments_block_invoke_3_16;
          v38[3] = &unk_1EA958B48;
          v14 = *(_QWORD *)(a1 + 88);
          v38[4] = *(_QWORD *)(a1 + 80);
          v38[5] = v14;
          v38[6] = a2;
          v15 = v38;
          goto LABEL_30;
        case 3u:
          v35[0] = MEMORY[0x1E0C87450];
          v35[1] = 0x40000000;
          v35[2] = ___create_with_format_and_arguments_block_invoke_4_18;
          v35[3] = &unk_1EA958B70;
          v35[4] = *(_QWORD *)(a1 + 80);
          v37 = a2;
          v36 = *(_OWORD *)(a1 + 88);
          v14 = v36;
          v15 = v35;
          goto LABEL_30;
        case 4u:
          if (v11)
          {
            v21 = _xpc_asprintf("Invalid rest suffix for 'date' format specifier!");
            goto LABEL_42;
          }
          v34[0] = MEMORY[0x1E0C87450];
          v34[1] = 0x40000000;
          v34[2] = ___create_with_format_and_arguments_block_invoke_5;
          v34[3] = &unk_1EA958B98;
          v14 = *(_QWORD *)(a1 + 88);
          v34[4] = *(_QWORD *)(a1 + 80);
          v34[5] = v14;
          v34[6] = a2;
          v15 = v34;
          goto LABEL_30;
        case 5u:
          if (v11)
          {
            v21 = _xpc_asprintf("Invalid rest suffix for 'double' format specifier!");
            goto LABEL_42;
          }
          v33[0] = MEMORY[0x1E0C87450];
          v33[1] = 0x40000000;
          v33[2] = ___create_with_format_and_arguments_block_invoke_6;
          v33[3] = &unk_1EA958BC0;
          v14 = *(_QWORD *)(a1 + 88);
          v33[4] = *(_QWORD *)(a1 + 80);
          v33[5] = v14;
          v33[6] = a2;
          v15 = v33;
          goto LABEL_30;
        case 6u:
          if (v11)
          {
            v21 = _xpc_asprintf("Invalid rest suffix for 'fd' format specifier!");
            goto LABEL_42;
          }
          v32[0] = MEMORY[0x1E0C87450];
          v32[1] = 0x40000000;
          v32[2] = ___create_with_format_and_arguments_block_invoke_7;
          v32[3] = &unk_1EA958BE8;
          v14 = *(_QWORD *)(a1 + 88);
          v32[4] = *(_QWORD *)(a1 + 80);
          v32[5] = v14;
          v32[6] = a2;
          v15 = v32;
          goto LABEL_30;
        case 7u:
          if (v11)
          {
            v21 = _xpc_asprintf("Invalid rest suffix for 'int{64}' format specifier!");
            goto LABEL_42;
          }
          v17 = v12[1] == 2;
          v30[0] = MEMORY[0x1E0C87450];
          v30[1] = 0x40000000;
          v30[2] = ___create_with_format_and_arguments_block_invoke_8;
          v30[3] = &unk_1EA958C10;
          v31 = v17;
          v14 = *(_QWORD *)(a1 + 88);
          v30[4] = *(_QWORD *)(a1 + 80);
          v30[5] = v14;
          v30[6] = a2;
          v15 = v30;
          goto LABEL_30;
        case 8u:
          v27[0] = MEMORY[0x1E0C87450];
          v27[1] = 0x40000000;
          v27[2] = ___create_with_format_and_arguments_block_invoke_9;
          v27[3] = &unk_1EA958C38;
          v27[4] = *(_QWORD *)(a1 + 80);
          v29 = a2;
          v28 = *(_OWORD *)(a1 + 88);
          v14 = v28;
          v15 = v27;
          goto LABEL_30;
        case 9u:
          if (v11)
          {
            v21 = _xpc_asprintf("Invalid rest suffix for 'uint{64}' format specifier!");
          }
          else
          {
            v18 = v12[1] == 2;
            v25[0] = MEMORY[0x1E0C87450];
            v25[1] = 0x40000000;
            v25[2] = ___create_with_format_and_arguments_block_invoke_10;
            v25[3] = &unk_1EA958C60;
            v26 = v18;
            v14 = *(_QWORD *)(a1 + 88);
            v25[4] = *(_QWORD *)(a1 + 80);
            v25[5] = v14;
            v25[6] = a2;
            v15 = v25;
LABEL_30:
            *(_DWORD *)(*(_QWORD *)(v14 + 8) + 24) = 0;
            do
            {
              ((void (*)(_QWORD *))v15[2])(v15);
              if (!v11)
                goto LABEL_34;
            }
            while (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24));
            if (*v11 != 43)
              goto LABEL_35;
LABEL_34:
            if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
              goto LABEL_35;
            v21 = _xpc_asprintf("Missing required format arg!");
          }
LABEL_42:
          _xpc_api_misuse(v21);
        case 0xAu:
          v22[0] = MEMORY[0x1E0C87450];
          v22[1] = 0x40000000;
          v22[2] = ___create_with_format_and_arguments_block_invoke_11;
          v22[3] = &unk_1EA958C88;
          v22[4] = *(_QWORD *)(a1 + 80);
          v24 = a2;
          v23 = *(_OWORD *)(a1 + 88);
          v14 = v23;
          v15 = v22;
          goto LABEL_30;
        default:
          v15 = 0;
          v14 = *(_QWORD *)(a1 + 88);
          goto LABEL_30;
      }
    case '{':
      v7 = xpc_dictionary_create(0, 0, 0);
      xpc_array_set_value(a2, 0xFFFFFFFFFFFFFFFFLL, v7);
      (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) + 16))();
      goto LABEL_12;
    case '[':
      v7 = xpc_array_create(0, 0);
      xpc_array_set_value(a2, 0xFFFFFFFFFFFFFFFFLL, v7);
      (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) + 16))();
LABEL_12:
      xpc_release(v7);
      goto LABEL_35;
  }
  v16 = (const char *)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  xpc_array_set_string(a2, 0xFFFFFFFFFFFFFFFFLL, v16);
LABEL_35:
  v19 = *(char *)(*(_QWORD *)(a1 + 104) + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  if (v19 == 44)
    return (void *)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  result = memchr("])", v19, 3uLL);
  if (!result)
    _xpc_mach_message_request_handoff_reply_cold_1();
  return result;
}

void ___create_with_format_and_arguments_block_invoke_2_12(uint64_t a1)
{
  uint64_t v2;
  xpc_object_t *v3;
  xpc_object_t v4;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(xpc_object_t **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = v3 + 1;
  v4 = *v3;
  if (*v3)
  {
    xpc_array_set_value(*(xpc_object_t *)(a1 + 56), 0xFFFFFFFFFFFFFFFFLL, *v3);
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    if (*(_BYTE *)(a1 + 64))
      xpc_release(v4);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
}

void ___create_with_format_and_arguments_block_invoke_3_16(uint64_t a1)
{
  uint64_t v2;
  _DWORD *v3;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(_DWORD **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = v3 + 2;
  xpc_array_set_BOOL(*(xpc_object_t *)(a1 + 48), 0xFFFFFFFFFFFFFFFFLL, *v3 != 0);
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

void ___create_with_format_and_arguments_block_invoke_4_18(uint64_t a1)
{
  uint64_t v2;
  const void **v3;
  const void *v4;
  uint64_t v5;
  size_t *v6;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(const void ***)(v2 + 24);
  *(_QWORD *)(v2 + 24) = v3 + 1;
  v4 = *v3;
  if (*v3)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v6 = *(size_t **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v6 + 1;
    xpc_array_set_data(*(xpc_object_t *)(a1 + 56), 0xFFFFFFFFFFFFFFFFLL, v4, *v6);
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
}

void ___create_with_format_and_arguments_block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  int64_t *v3;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(int64_t **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = v3 + 1;
  xpc_array_set_date(*(xpc_object_t *)(a1 + 48), 0xFFFFFFFFFFFFFFFFLL, *v3);
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

void ___create_with_format_and_arguments_block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  double *v3;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(double **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = v3 + 1;
  xpc_array_set_double(*(xpc_object_t *)(a1 + 48), 0xFFFFFFFFFFFFFFFFLL, *v3);
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

void ___create_with_format_and_arguments_block_invoke_7(uint64_t a1)
{
  uint64_t v2;
  int *v3;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(int **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = v3 + 2;
  xpc_array_set_fd(*(xpc_object_t *)(a1 + 48), 0xFFFFFFFFFFFFFFFFLL, *v3);
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

void ___create_with_format_and_arguments_block_invoke_8(uint64_t a1)
{
  int64_t **v2;
  int64_t *v3;
  int64_t v4;

  v2 = (int64_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v3 = *v2;
  if (*(_BYTE *)(a1 + 56))
  {
    ++*v2;
    v4 = *(int *)v3;
  }
  else
  {
    ++*v2;
    v4 = *v3;
  }
  xpc_array_set_int64(*(xpc_object_t *)(a1 + 48), 0xFFFFFFFFFFFFFFFFLL, v4);
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

void ___create_with_format_and_arguments_block_invoke_9(uint64_t a1)
{
  uint64_t v2;
  const char **v3;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(const char ***)(v2 + 24);
  *(_QWORD *)(v2 + 24) = v3 + 1;
  if (*v3)
  {
    xpc_array_set_string(*(xpc_object_t *)(a1 + 56), 0xFFFFFFFFFFFFFFFFLL, *v3);
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
}

void ___create_with_format_and_arguments_block_invoke_10(uint64_t a1)
{
  uint64_t **v2;
  uint64_t *v3;
  uint64_t v4;

  v2 = (uint64_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v3 = *v2;
  if (*(_BYTE *)(a1 + 56))
  {
    ++*v2;
    v4 = *(unsigned int *)v3;
  }
  else
  {
    ++*v2;
    v4 = *v3;
  }
  xpc_array_set_uint64(*(xpc_object_t *)(a1 + 48), 0xFFFFFFFFFFFFFFFFLL, v4);
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

void ___create_with_format_and_arguments_block_invoke_11(uint64_t a1)
{
  uint64_t v2;
  const unsigned __int8 **v3;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(const unsigned __int8 ***)(v2 + 24);
  *(_QWORD *)(v2 + 24) = v3 + 1;
  if (*v3)
  {
    xpc_array_set_uuid(*(xpc_object_t *)(a1 + 56), 0xFFFFFFFFFFFFFFFFLL, *v3);
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
}

uint64_t ___create_with_format_and_arguments_block_invoke_12(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(a1[4] + 16))();
  while (*(unsigned __int8 *)(a1[7] + *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24)) != *(unsigned __int8 *)(a3 + 1))
    (*(void (**)(void))(a1[5] + 16))();
  return (*(uint64_t (**)(void))(a1[4] + 16))();
}

void ___create_with_format_and_arguments_block_invoke_13(_QWORD *a1, void *a2)
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  xpc_object_t v8;
  const char *v9;
  size_t v10;
  int v11;
  char *v12;
  unsigned int *v13;
  unsigned int v14;
  uint64_t v15;
  xpc_object_t *v16;
  xpc_object_t v17;
  const char *v18;
  uint64_t v19;
  _DWORD *v20;
  uint64_t v21;
  const void **v22;
  const void *v23;
  uint64_t v24;
  size_t *v25;
  uint64_t v26;
  int64_t *v27;
  uint64_t v28;
  double *v29;
  uint64_t v30;
  int *v31;
  int64_t **v32;
  int64_t *v33;
  int64_t v34;
  uint64_t v35;
  const char **v36;
  uint64_t **v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  const unsigned __int8 **v41;
  int v42;
  char *v43;

  v4 = (const char *)(*(uint64_t (**)(void))(a1[4] + 16))();
  (*(void (**)(void))(a1[5] + 16))();
  v5 = *(_QWORD *)(a1[7] + 8);
  v6 = *(_QWORD *)(v5 + 24);
  v7 = *(unsigned __int8 *)(a1[12] + v6);
  switch(v7)
  {
    case '%':
      *(_QWORD *)(v5 + 24) = v6 + 1;
      v9 = (const char *)(*(uint64_t (**)(void))(a1[6] + 16))();
      v10 = strlen(v9);
      if (!v10)
        _xpc_mach_message_request_handoff_reply_cold_1();
      v11 = v10;
      v12 = (char *)memchr("*+", *(char *)(a1[12] + *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24)), 3uLL);
      if (v12)
      {
        (*(void (**)(_QWORD, _QWORD))(a1[5] + 16))(a1[5], *v12);
        v43 = _xpc_asprintf("Invalid rest suffix in dictionary element format specifier!");
      }
      else
      {
        v13 = xpc_format_specifiers_lookup(v9, v11);
        if (v13)
        {
          switch(v13[2])
          {
            case 1u:
              v14 = v13[1];
              v15 = *(_QWORD *)(a1[10] + 8);
              v16 = *(xpc_object_t **)(v15 + 24);
              *(_QWORD *)(v15 + 24) = v16 + 1;
              v17 = *v16;
              if (!*v16)
                goto LABEL_29;
              xpc_dictionary_set_value(a2, v4, *v16);
              if (v14 == 1)
                xpc_release(v17);
              break;
            case 2u:
              v19 = *(_QWORD *)(a1[10] + 8);
              v20 = *(_DWORD **)(v19 + 24);
              *(_QWORD *)(v19 + 24) = v20 + 2;
              xpc_dictionary_set_BOOL(a2, v4, *v20 != 0);
              break;
            case 3u:
              v21 = *(_QWORD *)(a1[10] + 8);
              v22 = *(const void ***)(v21 + 24);
              *(_QWORD *)(v21 + 24) = v22 + 1;
              v23 = *v22;
              if (!*v22)
                goto LABEL_29;
              v24 = *(_QWORD *)(a1[10] + 8);
              v25 = *(size_t **)(v24 + 24);
              *(_QWORD *)(v24 + 24) = v25 + 1;
              xpc_dictionary_set_data(a2, v4, v23, *v25);
              break;
            case 4u:
              v26 = *(_QWORD *)(a1[10] + 8);
              v27 = *(int64_t **)(v26 + 24);
              *(_QWORD *)(v26 + 24) = v27 + 1;
              xpc_dictionary_set_date(a2, v4, *v27);
              break;
            case 5u:
              v28 = *(_QWORD *)(a1[10] + 8);
              v29 = *(double **)(v28 + 24);
              *(_QWORD *)(v28 + 24) = v29 + 1;
              xpc_dictionary_set_double(a2, v4, *v29);
              break;
            case 6u:
              v30 = *(_QWORD *)(a1[10] + 8);
              v31 = *(int **)(v30 + 24);
              *(_QWORD *)(v30 + 24) = v31 + 2;
              xpc_dictionary_set_fd(a2, v4, *v31);
              break;
            case 7u:
              v32 = (int64_t **)(*(_QWORD *)(a1[10] + 8) + 24);
              v33 = *v32;
              if (v13[1] == 2)
              {
                ++*v32;
                v34 = *(int *)v33;
              }
              else
              {
                ++*v32;
                v34 = *v33;
              }
              xpc_dictionary_set_int64(a2, v4, v34);
              break;
            case 8u:
              v35 = *(_QWORD *)(a1[10] + 8);
              v36 = *(const char ***)(v35 + 24);
              *(_QWORD *)(v35 + 24) = v36 + 1;
              if (!*v36)
                goto LABEL_29;
              xpc_dictionary_set_string(a2, v4, *v36);
              break;
            case 9u:
              v37 = (uint64_t **)(*(_QWORD *)(a1[10] + 8) + 24);
              v38 = *v37;
              if (v13[1] == 2)
              {
                ++*v37;
                v39 = *(unsigned int *)v38;
              }
              else
              {
                ++*v37;
                v39 = *v38;
              }
              xpc_dictionary_set_uint64(a2, v4, v39);
              break;
            case 0xAu:
              v40 = *(_QWORD *)(a1[10] + 8);
              v41 = *(const unsigned __int8 ***)(v40 + 24);
              *(_QWORD *)(v40 + 24) = v41 + 1;
              if (*v41)
                xpc_dictionary_set_uuid(a2, v4, *v41);
              else
LABEL_29:
                *(_BYTE *)(*(_QWORD *)(a1[11] + 8) + 24) = 1;
              break;
            default:
              break;
          }
          if (!*(_BYTE *)(*(_QWORD *)(a1[11] + 8) + 24))
            goto LABEL_35;
          v43 = _xpc_asprintf("Null required format arg!");
        }
        else
        {
          v43 = _xpc_asprintf("Invalid format specifier!");
        }
      }
      _xpc_api_misuse(v43);
    case '{':
      v8 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_value(a2, v4, v8);
      (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 40) + 16))();
      goto LABEL_13;
    case '[':
      v8 = xpc_array_create(0, 0);
      xpc_dictionary_set_value(a2, v4, v8);
      (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40) + 16))();
LABEL_13:
      xpc_release(v8);
      goto LABEL_35;
  }
  v18 = (const char *)(*(uint64_t (**)(void))(a1[4] + 16))();
  xpc_dictionary_set_string(a2, v4, v18);
LABEL_35:
  v42 = *(unsigned __int8 *)(a1[12] + *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24));
  if (v42 == 44)
  {
    (*(void (**)(void))(a1[5] + 16))();
  }
  else if (v42 != 125)
  {
    _xpc_mach_message_request_handoff_reply_cold_1();
  }
}

uint64_t ___create_with_format_and_arguments_block_invoke_14(_QWORD *a1)
{
  (*(void (**)(void))(a1[4] + 16))();
  while (*(_BYTE *)(a1[7] + *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24)) != 125)
    (*(void (**)(void))(a1[5] + 16))();
  return (*(uint64_t (**)(void))(a1[4] + 16))();
}

int64_t launch_add_external_service(int a1, const char *a2, void *a3)
{
  xpc_object_t v6;
  int64_t v7;
  xpc_object_t object;

  v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v6, "type", 5uLL);
  xpc_dictionary_set_uint64(v6, "handle", a1);
  xpc_dictionary_set_string(v6, "path", a2);
  xpc_dictionary_set_value(v6, "overlay", a3);
  object = 0;
  v7 = _xpc_domain_routine(831, v6, &object);
  if (!(_DWORD)v7)
    xpc_release(object);
  xpc_release(v6);
  return v7;
}

void launch_remove_external_service(const char *a1, const char *a2, NSObject *a3, const void *a4)
{
  xpc_object_t v8;
  uint64_t v9;
  mach_port_name_t v10;
  int v11;
  int v12;
  _DWORD *v13;
  _QWORD *v14;
  NSObject *v15;

  v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v8, "type", 1uLL);
  xpc_dictionary_set_uint64(v8, "handle", 0);
  xpc_dictionary_set_string(v8, "name", a1);
  if (a2)
    xpc_dictionary_set_string(v8, "version", a2);
  v9 = _xpc_mach_port_allocate(1u, 1u, (mach_port_context_t)launch_remove_external_service);
  v10 = v9;
  v11 = _xpc_event_routine_async(832, v8, v9);
  if (v11)
  {
    v12 = v11;
    if (_xpc_mach_port_close_recv(v10, 0, (mach_port_context_t)launch_remove_external_service))
      _os_assumes_log();
    v13 = _xpc_alloc(0x18uLL);
    v13[2] = v12;
    *((_QWORD *)v13 + 2) = _xpc_Block_copy_impl(a4);
    dispatch_async_f(a3, v13, (dispatch_function_t)_deliver_error);
  }
  else
  {
    v14 = _xpc_alloc(0x18uLL);
    v15 = dispatch_source_create(MEMORY[0x1E0C86F00], v10, 0, a3);
    dispatch_set_context(v15, v14);
    *v14 = v15;
    v14[2] = _xpc_Block_copy_impl(a4);
    dispatch_source_set_event_handler_f(v15, (dispatch_function_t)_removal_reply_event);
    dispatch_source_set_mandatory_cancel_handler_f();
    dispatch_activate(v15);
  }
  xpc_release(v8);
}

void _deliver_error(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD);

  v2 = *(void (***)(_QWORD, _QWORD))(a1 + 16);
  v2[2](v2, *(unsigned int *)(a1 + 8));
  _Block_release(v2);
  free((void *)a1);
}

void _removal_reply_event(uint64_t a1)
{
  NSObject *v2;
  void (**v3)(_QWORD, _QWORD);
  mach_port_name_t handle;
  uint64_t int64;
  xpc_object_t xdict;

  v2 = *(NSObject **)a1;
  v3 = *(void (***)(_QWORD, _QWORD))(a1 + 16);
  handle = dispatch_source_get_handle(*(dispatch_source_t *)a1);
  xdict = 0;
  int64 = xpc_pipe_receive(handle, &xdict, 0);
  if (!(_DWORD)int64)
  {
    int64 = xpc_dictionary_get_int64(xdict, "error");
    xpc_release(xdict);
  }
  v3[2](v3, int64);
  dispatch_set_context(v2, v2);
  dispatch_source_cancel(v2);
  _Block_release(v3);
  free((void *)a1);
}

void _removal_reply_cancel(NSObject *a1)
{
  mach_port_name_t handle;

  handle = dispatch_source_get_handle(a1);
  if (_xpc_mach_port_close_recv(handle, 0, (mach_port_context_t)launch_remove_external_service))
    _os_assumes_log();
  dispatch_release(a1);
}

xpc_object_t launch_copy_extension_properties(uint64_t a1)
{
  xpc_object_t v1;
  void *v2;
  xpc_object_t v3;

  v1 = _xpc_connection_copy_attrs(a1, -1);
  if (!v1)
    return 0;
  v2 = v1;
  if (xpc_dictionary_get_BOOL(v1, "extension"))
    v3 = _translate_attrs(v2);
  else
    v3 = 0;
  xpc_release(v2);
  return v3;
}

xpc_object_t _translate_attrs(void *a1)
{
  xpc_object_t v2;
  const char *string;
  const char *v4;
  const char *v5;
  const char *v6;
  int int64;
  int v8;

  v2 = xpc_dictionary_create(0, 0, 0);
  string = xpc_dictionary_get_string(a1, "path");
  if (string)
    xpc_dictionary_set_string(v2, "XPCExtensionPath", string);
  v4 = xpc_dictionary_get_string(a1, "bundle-id");
  if (v4)
    xpc_dictionary_set_string(v2, "XPCExtensionBundleIdentifier", v4);
  v5 = xpc_dictionary_get_string(a1, "version");
  if (v5)
    xpc_dictionary_set_string(v2, "XPCExtensionBundleVersion", v5);
  v6 = xpc_dictionary_get_string(a1, "XPCExtensionHostBundleIdentifier");
  if (v6)
    xpc_dictionary_set_string(v2, "XPCExtensionHostBundleIdentifier", v6);
  int64 = xpc_dictionary_get_int64(a1, "XPCExtensionHostPID");
  if (int64)
    xpc_dictionary_set_int64(v2, "XPCExtensionHostPID", int64);
  v8 = xpc_dictionary_get_int64(a1, "XPCExtensionPID");
  if (v8)
    xpc_dictionary_set_int64(v2, "XPCExtensionPID", v8);
  if (xpc_dictionary_get_BOOL(a1, "XPCExtensionXPCBundle"))
    xpc_dictionary_set_BOOL(v2, "XPCExtensionXPCBundle", 1);
  return v2;
}

xpc_object_t launch_copy_extension_properties_for_pid(int a1)
{
  xpc_object_t v1;
  void *v2;
  xpc_object_t v3;

  v1 = _xpc_connection_copy_attrs(0, a1);
  if (!v1)
    return 0;
  v2 = v1;
  if (xpc_dictionary_get_BOOL(v1, "extension"))
    v3 = _translate_attrs(v2);
  else
    v3 = 0;
  xpc_release(v2);
  return v3;
}

xpc_object_t launch_copy_properties_for_pid_4assertiond(int a1)
{
  xpc_object_t result;
  void *v2;
  xpc_object_t v3;

  result = _xpc_connection_copy_attrs(0, a1);
  if (result)
  {
    v2 = result;
    v3 = _translate_attrs(result);
    xpc_release(v2);
    return v3;
  }
  return result;
}

xpc_object_t launch_copy_busy_extension_instances(const char **a1, uint64_t a2)
{
  xpc_object_t v4;
  xpc_object_t i;
  const char *v6;
  xpc_object_t v7;
  xpc_object_t value;
  size_t v9;
  xpc_object_t v10;
  xpc_object_t v11;
  xpc_object_t xdict;

  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v4, "type", 1uLL);
  xpc_dictionary_set_uint64(v4, "handle", 0);
  for (i = xpc_array_create(0, 0); a2; --a2)
  {
    v6 = *a1++;
    xpc_array_set_string(i, 0xFFFFFFFFFFFFFFFFLL, v6);
  }
  xpc_dictionary_set_value(v4, "names", i);
  xpc_release(i);
  xdict = 0;
  if (_xpc_domain_routine(833, v4, &xdict))
  {
    _os_assumes_log();
    v7 = 0;
  }
  else
  {
    v7 = xpc_array_create(0, 0);
    value = xpc_dictionary_get_value(xdict, "instances");
    if (xpc_array_get_count(value))
    {
      v9 = 0;
      do
      {
        v10 = xpc_array_get_value(value, v9);
        v11 = _translate_attrs(v10);
        xpc_array_append_value(v7, v11);
        xpc_release(v11);
        ++v9;
      }
      while (v9 < xpc_array_get_count(value));
    }
    xpc_release(xdict);
  }
  xpc_release(v4);
  return v7;
}

void launch_extension_check_in_live_4UIKit()
{
  xpc_object_t v0;
  pid_t v1;
  xpc_object_t object;

  v0 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v0, "type", 5uLL);
  v1 = getpid();
  xpc_dictionary_set_uint64(v0, "handle", v1);
  xpc_dictionary_set_BOOL(v0, "self", 1);
  object = 0;
  if (_xpc_service_routine(716, v0, &object))
    _os_assumes_log();
  else
    xpc_release(object);
  xpc_release(v0);
}

uint64_t _xpc_session_get_state(os_unfair_lock_s *a1)
{
  os_unfair_lock_s *v2;
  uint64_t os_unfair_lock_opaque;

  v2 = a1 + 8;
  os_unfair_lock_lock_with_options();
  os_unfair_lock_assert_owner(v2);
  os_unfair_lock_opaque = a1[9]._os_unfair_lock_opaque;
  os_unfair_lock_unlock(v2);
  return os_unfair_lock_opaque;
}

uint64_t _xpc_session_get_state_locked(const os_unfair_lock *a1)
{
  os_unfair_lock_assert_owner(a1 + 8);
  return a1[9]._os_unfair_lock_opaque;
}

const char *_xpc_session_string_for_state(int a1)
{
  if ((a1 - 1) > 4)
    return "Unknown";
  else
    return off_1EA958ED8[a1 - 1];
}

char *_xpc_session_common_copy_concise_identifier(uint64_t a1, const char *a2)
{
  char *v3;

  if (a1)
    v3 = _xpc_connection_pretty_name(a1);
  else
    v3 = "No Connection";
  return _xpc_asprintf("%s<%s>", a2, v3);
}

char *__cdecl xpc_session_copy_description(xpc_session_t session)
{
  unsigned int v2;
  const char *v3;
  char *v4;
  char *v5;

  v2 = _xpc_session_get_state((os_unfair_lock_s *)session) - 1;
  if (v2 > 4)
    v3 = "Unknown";
  else
    v3 = off_1EA958ED8[v2];
  v4 = _xpc_session_common_copy_concise_identifier(*((_QWORD *)session + 7), "Session");
  v5 = _xpc_asprintf("%s(%s)", v4, v3);
  free(v4);
  return v5;
}

uint64_t _xpc_session_xref_dispose(os_unfair_lock_s *a1)
{
  uint64_t result;
  char *v2;

  result = _xpc_session_get_state(a1);
  if ((result - 6) <= 0xFFFFFFFD)
  {
    v2 = _xpc_asprintf("Session must be canceled before it's disposed");
    _xpc_api_misuse(v2);
  }
  return result;
}

void _xpc_session_dispose(uint64_t a1)
{
  NSObject *v2;
  _QWORD *v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C874D8];
  if (_os_trace_lazy_init_completed_4libxpc())
  {
    if (_xpc_session_log_handle__once != -1)
      dispatch_once(&_xpc_session_log_handle__once, &__block_literal_global_4);
    v2 = _xpc_session_log_handle__log;
    if (os_log_type_enabled((os_log_t)_xpc_session_log_handle__log, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 134217984;
      v6 = a1;
      _os_log_impl(&dword_1DEE85000, v2, OS_LOG_TYPE_DEFAULT, "[%p] Disposing of session", (uint8_t *)&v5, 0xCu);
    }
  }
  if (*(_DWORD *)(a1 + 36) != 5)
    _xpc_mach_message_request_handoff_reply_cold_1();
  xpc_release(*(xpc_object_t *)(a1 + 56));
  *(_QWORD *)(a1 + 56) = 0;
  _Block_release(*(const void **)(a1 + 24));
  *(_QWORD *)(a1 + 24) = 0;
  _Block_release(*(const void **)(a1 + 16));
  *(_QWORD *)(a1 + 16) = 0;
  v3 = *(_QWORD **)(a1 + 40);
  if (v3)
    _xpc_session_cancelation_reason_dispose(v3);
  v4 = *(NSObject **)(a1 + 64);
  if (v4)
    dispatch_release(v4);
}

void _xpc_session_cancelation_reason_dispose(_QWORD *a1)
{
  void *v2;

  v2 = (void *)a1[1];
  if (v2)
    xpc_release(v2);
  free(a1);
}

NSObject *_xpc_session_common_create_opq(NSObject *a1, char *label)
{
  NSObject *global_queue;
  NSObject *v5;

  global_queue = a1;
  if (!a1)
    global_queue = dispatch_get_global_queue(0, 0);
  v5 = dispatch_queue_create_with_target_V2(label, 0, global_queue);
  dispatch_set_context(v5, a1);
  return v5;
}

uint64_t _xpc_session_create_with_connection(_xpc_connection_s *a1, NSObject *a2, char a3, char a4, xpc_object_t *a5)
{
  uint64_t v10;
  NSObject *v11;
  __int128 v13;
  void (*v14)(uint64_t, __objc2_class **);
  void *v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C874D8];
  xpc_connection_set_target_queue(a1, a2);
  v10 = _xpc_session_alloc();
  *(_QWORD *)(v10 + 40) = 0;
  *(_DWORD *)(v10 + 48) = 0;
  *(_QWORD *)(v10 + 32) = 0x100000000;
  dispatch_retain(a2);
  *(_QWORD *)(v10 + 64) = a2;
  xpc_retain(a1);
  *(_QWORD *)(v10 + 56) = a1;
  _xpc_retain(v10);
  *(_QWORD *)&v13 = MEMORY[0x1E0C87450];
  *((_QWORD *)&v13 + 1) = 0x40000000;
  v14 = ___xpc_session_setup_connection_handlers_block_invoke;
  v15 = &__block_descriptor_tmp_31_0;
  v16 = v10;
  xpc_connection_set_event_handler(a1, &v13);
  if ((a3 & 1) == 0)
  {
    if (*(_DWORD *)(v10 + 36) != 1)
      _xpc_mach_message_request_handoff_reply_cold_1();
    xpc_connection_activate(*(xpc_connection_t *)(v10 + 56));
    if (_xpc_connection_is_invalid(*(_QWORD *)(v10 + 56)))
    {
      _xpc_session_cancel_with_code(v10, 3);
      if (a5)
        *a5 = xpc_retain(*(xpc_object_t *)(*(_QWORD *)(v10 + 40) + 8));
      xpc_release((xpc_object_t)v10);
      return 0;
    }
    *(_DWORD *)(v10 + 36) = 3;
  }
  if ((a4 & 1) != 0)
  {
    *(_BYTE *)(v10 + 52) |= 1u;
    xpc_retain((xpc_object_t)v10);
  }
  if (_os_trace_lazy_init_completed_4libxpc())
  {
    if (_xpc_session_log_handle__once != -1)
      dispatch_once(&_xpc_session_log_handle__once, &__block_literal_global_4);
    v11 = _xpc_session_log_handle__log;
    if (os_log_type_enabled((os_log_t)_xpc_session_log_handle__log, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v13) = 134217984;
      *(_QWORD *)((char *)&v13 + 4) = v10;
      _os_log_impl(&dword_1DEE85000, v11, OS_LOG_TYPE_DEFAULT, "[%p] Session created.", (uint8_t *)&v13, 0xCu);
    }
  }
  return v10;
}

xpc_session_t xpc_session_create_xpc_service(const char *name, dispatch_queue_t target_queue, xpc_session_create_flags_t flags, xpc_rich_error_t *error_out)
{
  char v4;
  NSObject *opq;
  _xpc_connection_s *v8;
  _xpc_session_s *v9;
  NSObject *v10;
  char *v12;
  int v13;
  _xpc_session_s *v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v4 = flags;
  v17 = *MEMORY[0x1E0C874D8];
  if ((flags & 2) != 0)
  {
    v12 = _xpc_asprintf("Attempting to set privileged flag on connection to XPC Service.", target_queue);
    _xpc_api_misuse(v12);
  }
  opq = _xpc_session_common_create_opq(target_queue, "com.apple.session.queue");
  v8 = xpc_connection_create(name, opq);
  v9 = (_xpc_session_s *)_xpc_session_create_with_connection(v8, opq, v4, 0, (xpc_object_t *)error_out);
  dispatch_release(opq);
  xpc_release(v8);
  if (_os_trace_lazy_init_completed_4libxpc())
  {
    if (_xpc_session_log_handle__once != -1)
      dispatch_once(&_xpc_session_log_handle__once, &__block_literal_global_4);
    v10 = _xpc_session_log_handle__log;
    if (os_log_type_enabled((os_log_t)_xpc_session_log_handle__log, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 134218242;
      v14 = v9;
      v15 = 2080;
      v16 = name;
      _os_log_impl(&dword_1DEE85000, v10, OS_LOG_TYPE_DEFAULT, "[%p] Session created with XPC Service: %s", (uint8_t *)&v13, 0x16u);
    }
  }
  return v9;
}

xpc_session_t xpc_session_create_mach_service(const char *mach_service, dispatch_queue_t target_queue, xpc_session_create_flags_t flags, xpc_rich_error_t *error_out)
{
  char v5;
  NSObject *opq;
  _xpc_connection_s *v8;
  _xpc_session_s *v9;
  NSObject *v10;
  int v12;
  _xpc_session_s *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v5 = flags;
  v16 = *MEMORY[0x1E0C874D8];
  opq = _xpc_session_common_create_opq(target_queue, "com.apple.session.queue");
  v8 = xpc_connection_create_mach_service(mach_service, opq, v5 & 2);
  v9 = (_xpc_session_s *)_xpc_session_create_with_connection(v8, opq, v5, 0, (xpc_object_t *)error_out);
  dispatch_release(opq);
  xpc_release(v8);
  if (_os_trace_lazy_init_completed_4libxpc())
  {
    if (_xpc_session_log_handle__once != -1)
      dispatch_once(&_xpc_session_log_handle__once, &__block_literal_global_4);
    v10 = _xpc_session_log_handle__log;
    if (os_log_type_enabled((os_log_t)_xpc_session_log_handle__log, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 134218242;
      v13 = v9;
      v14 = 2080;
      v15 = mach_service;
      _os_log_impl(&dword_1DEE85000, v10, OS_LOG_TYPE_DEFAULT, "[%p] Session created with Mach Service: %s", (uint8_t *)&v12, 0x16u);
    }
  }
  return v9;
}

uint64_t xpc_session_create_xpc_endpoint(_xpc_endpoint_s *a1, NSObject *a2, char a3, xpc_object_t *a4)
{
  NSObject *opq;
  _xpc_connection_s *v8;
  uint64_t v9;
  NSObject *v10;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C874D8];
  opq = _xpc_session_common_create_opq(a2, "com.apple.session.queue");
  v8 = xpc_connection_create_from_endpoint(a1);
  v9 = _xpc_session_create_with_connection(v8, opq, a3, 0, a4);
  dispatch_release(opq);
  xpc_release(v8);
  if (_os_trace_lazy_init_completed_4libxpc())
  {
    if (_xpc_session_log_handle__once != -1)
      dispatch_once(&_xpc_session_log_handle__once, &__block_literal_global_4);
    v10 = _xpc_session_log_handle__log;
    if (os_log_type_enabled((os_log_t)_xpc_session_log_handle__log, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 134217984;
      v13 = v9;
      _os_log_impl(&dword_1DEE85000, v10, OS_LOG_TYPE_DEFAULT, "[%p] Session created with Endpoint.", (uint8_t *)&v12, 0xCu);
    }
  }
  return v9;
}

uint64_t _xpc_session_create_from_connection_4SWIFT(uint64_t a1, NSObject *a2, unint64_t a3, xpc_object_t *a4)
{
  char v4;
  NSObject *opq;
  _xpc_connection_s *connection;
  uint64_t v9;
  NSObject *v10;
  char *v12;
  char v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  v18 = *MEMORY[0x1E0C874D8];
  if (a3 >= 2)
  {
    v12 = _xpc_asprintf("invalid flags value %llu", a3);
    _xpc_api_misuse(v12);
  }
  v13 = 0;
  opq = _xpc_session_common_create_opq(a2, "com.apple.session.queue");
  connection = (_xpc_connection_s *)_xpc_connection_extract_connection(a1, (BOOL *)&v13);
  v9 = _xpc_session_create_with_connection(connection, opq, v4, v13, a4);
  dispatch_release(opq);
  if (_os_trace_lazy_init_completed_4libxpc())
  {
    if (_xpc_session_log_handle__once != -1)
      dispatch_once(&_xpc_session_log_handle__once, &__block_literal_global_4);
    v10 = _xpc_session_log_handle__log;
    if (os_log_type_enabled((os_log_t)_xpc_session_log_handle__log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v15 = v9;
      v16 = 2048;
      v17 = a1;
      _os_log_impl(&dword_1DEE85000, v10, OS_LOG_TYPE_DEFAULT, "[%p] Session created from connection [%p]", buf, 0x16u);
    }
  }
  return v9;
}

uint64_t _xpc_session_extract_connection_4SWIFT(uint64_t a1)
{
  os_unfair_lock_s *v2;
  int state_locked;
  const char *v5;
  char *v6;

  v2 = (os_unfair_lock_s *)(a1 + 32);
  os_unfair_lock_lock_with_options();
  os_unfair_lock_assert_owner(v2);
  if (*(_DWORD *)(a1 + 36) != 1)
  {
    state_locked = _xpc_session_get_state_locked((const os_unfair_lock *)a1);
    v5 = _xpc_session_string_for_state(state_locked);
    v6 = _xpc_asprintf("Session must be inactive to extract the connection, not %s", v5);
    _xpc_api_misuse(v6);
  }
  os_unfair_lock_assert_owner(v2);
  *(_DWORD *)(a1 + 36) = 2;
  os_unfair_lock_unlock(v2);
  xpc_retain(*(xpc_object_t *)(a1 + 56));
  *(_BYTE *)(a1 + 52) |= 2u;
  return _xpc_connection_extract_connection(*(_QWORD *)(a1 + 56), 0);
}

void xpc_session_set_incoming_message_handler(xpc_session_t session, xpc_session_incoming_message_handler_t handler)
{
  os_unfair_lock_s *v4;
  const void *v5;
  int state_locked;
  const char *v7;
  char *v8;

  v4 = (os_unfair_lock_s *)((char *)session + 32);
  os_unfair_lock_lock_with_options();
  os_unfair_lock_assert_owner(v4);
  if (*((_DWORD *)session + 9) != 1)
  {
    state_locked = _xpc_session_get_state_locked((const os_unfair_lock *)session);
    v7 = _xpc_session_string_for_state(state_locked);
    v8 = _xpc_asprintf("Session must be inactive to set the message handler, not %s", v7);
    _xpc_api_misuse(v8);
  }
  v5 = (const void *)*((_QWORD *)session + 3);
  if (v5)
    _Block_release(v5);
  *((_QWORD *)session + 3) = _xpc_Block_copy_impl(handler);
  os_unfair_lock_unlock(v4);
}

void xpc_session_set_cancel_handler(xpc_session_t session, xpc_session_cancel_handler_t cancel_handler)
{
  os_unfair_lock_s *v4;
  const void *v5;
  int state_locked;
  const char *v7;
  char *v8;

  v4 = (os_unfair_lock_s *)((char *)session + 32);
  os_unfair_lock_lock_with_options();
  os_unfair_lock_assert_owner(v4);
  if (*((_DWORD *)session + 9) != 1)
  {
    state_locked = _xpc_session_get_state_locked((const os_unfair_lock *)session);
    v7 = _xpc_session_string_for_state(state_locked);
    v8 = _xpc_asprintf("Session must be inactive to set the cancel handler, not %s", v7);
    _xpc_api_misuse(v8);
  }
  v5 = (const void *)*((_QWORD *)session + 2);
  if (v5)
    _Block_release(v5);
  *((_QWORD *)session + 2) = _xpc_Block_copy_impl(cancel_handler);
  os_unfair_lock_unlock(v4);
}

void xpc_session_set_target_queue(xpc_session_t session, dispatch_queue_t target_queue)
{
  os_unfair_lock_s *v4;
  NSObject *v5;
  NSObject *opq;
  int state_locked;
  const char *v8;
  char *v9;

  v4 = (os_unfair_lock_s *)((char *)session + 32);
  os_unfair_lock_lock_with_options();
  os_unfair_lock_assert_owner(v4);
  if (*((_DWORD *)session + 9) != 1)
  {
    state_locked = _xpc_session_get_state_locked((const os_unfair_lock *)session);
    v8 = _xpc_session_string_for_state(state_locked);
    v9 = _xpc_asprintf("Session must be inactive to set the cancel handler, not %s", v8);
    _xpc_api_misuse(v9);
  }
  v5 = *((_QWORD *)session + 8);
  if (v5)
    dispatch_release(v5);
  opq = _xpc_session_common_create_opq(target_queue, "com.apple.session.queue");
  *((_QWORD *)session + 8) = opq;
  xpc_connection_set_target_queue(*((xpc_connection_t *)session + 7), opq);
  os_unfair_lock_unlock(v4);
}

uint64_t _xpc_session_activate_if_new(uint64_t a1, xpc_object_t *a2)
{
  os_unfair_lock_s *v4;
  uint64_t v5;
  BOOL v6;

  v4 = (os_unfair_lock_s *)(a1 + 32);
  os_unfair_lock_lock_with_options();
  os_unfair_lock_assert_owner(v4);
  v5 = *(unsigned int *)(a1 + 36);
  if ((_DWORD)v5 == 1)
  {
    v6 = _xpc_session_activate_locked(a1);
    os_unfair_lock_unlock(v4);
    if (!v6)
      _xpc_session_activate_handle_error(a1, a2);
  }
  else
  {
    os_unfair_lock_unlock(v4);
  }
  return v5;
}

BOOL _xpc_session_activate_locked(uint64_t a1)
{
  _BOOL4 is_invalid;
  NSObject *v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C874D8];
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 32));
  *(_DWORD *)(a1 + 36) = 3;
  xpc_connection_activate(*(xpc_connection_t *)(a1 + 56));
  is_invalid = _xpc_connection_is_invalid(*(_QWORD *)(a1 + 56));
  if (!is_invalid && _os_trace_lazy_init_completed_4libxpc())
  {
    if (_xpc_session_log_handle__once != -1)
      dispatch_once(&_xpc_session_log_handle__once, &__block_literal_global_4);
    v3 = _xpc_session_log_handle__log;
    if (os_log_type_enabled((os_log_t)_xpc_session_log_handle__log, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 134217984;
      v6 = a1;
      _os_log_impl(&dword_1DEE85000, v3, OS_LOG_TYPE_DEFAULT, "[%p] Session activated", (uint8_t *)&v5, 0xCu);
    }
  }
  return !is_invalid;
}

void _xpc_session_activate_handle_error(uint64_t a1, xpc_object_t *a2)
{
  os_unfair_lock_s *v4;
  uint64_t v5;

  _xpc_session_cancel_with_code(a1, 3);
  if (a2)
  {
    v4 = (os_unfair_lock_s *)(a1 + 32);
    os_unfair_lock_lock_with_options();
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 32));
    v5 = *(_QWORD *)(a1 + 40);
    os_unfair_lock_unlock(v4);
    *a2 = xpc_retain(*(xpc_object_t *)(v5 + 8));
  }
}

BOOL xpc_session_activate(xpc_session_t session, xpc_rich_error_t *error_out)
{
  os_unfair_lock_s *v4;
  int v5;
  BOOL v6;
  char *v8;

  v4 = (os_unfair_lock_s *)((char *)session + 32);
  os_unfair_lock_lock_with_options();
  os_unfair_lock_assert_owner(v4);
  v5 = *((_DWORD *)session + 9);
  if (v5 != 1)
  {
    switch(v5)
    {
      case 3:
        v8 = _xpc_asprintf("Attempting to activate an already active session");
        break;
      case 4:
        v8 = _xpc_asprintf("Attempting to activate a canceling session");
        break;
      case 5:
        v8 = _xpc_asprintf("Attempting to activate a canceled session");
        break;
      default:
        v8 = _xpc_asprintf("Attempting to activate a session in an unknown state");
        break;
    }
    _xpc_api_misuse(v8);
  }
  v6 = _xpc_session_activate_locked((uint64_t)session);
  os_unfair_lock_unlock(v4);
  if (!v6)
    _xpc_session_activate_handle_error((uint64_t)session, (xpc_object_t *)error_out);
  return v6;
}

void xpc_session_cancel(xpc_session_t session)
{
  char *v2;

  if (_xpc_session_get_state((os_unfair_lock_s *)session) == 1)
  {
    v2 = _xpc_asprintf("Attempting to cancel an inactive session");
    _xpc_api_misuse(v2);
  }
  _xpc_session_cancel_with_code((uint64_t)session, 1);
}

void _xpc_session_cancel_with_code(uint64_t a1, int a2)
{
  uint64_t v4;
  _QWORD *v5;

  v4 = _xpc_session_rich_error_with_cancelation_reason(a1, a2);
  v5 = _xpc_alloc(0x10uLL);
  *(_DWORD *)v5 = a2;
  v5[1] = v4;
  _xpc_session_cancel_with_reason(a1, v5);
}

void _xpc_session_cancel_peer(uint64_t a1, const char *a2)
{
  char *v3;
  uint64_t v4;
  _QWORD *v5;

  v3 = _xpc_asprintf("Peer rejected with reason: %s", a2);
  v4 = xpc_rich_error_create(v3, 0);
  free(v3);
  v5 = _xpc_alloc(0x10uLL);
  *(_DWORD *)v5 = 4;
  v5[1] = v4;
  _xpc_session_cancel_with_reason(a1, v5);
}

xpc_rich_error_t xpc_session_send_message(xpc_session_t session, xpc_object_t message)
{
  signed int state;
  char *v6;

  state = _xpc_session_get_state((os_unfair_lock_s *)session);
  if (state <= 2)
  {
    v6 = _xpc_asprintf("Attempting to send a message using a session that is neither active or canceled.");
    _xpc_api_misuse(v6);
  }
  if ((state & 0xFFFFFFFE) == 4)
    return (xpc_rich_error_t)_xpc_session_message_error_during_cancelation(state);
  xpc_connection_send_message(*((xpc_connection_t *)session + 7), message);
  return 0;
}

uint64_t _xpc_session_message_error_during_cancelation(unsigned int a1)
{
  const char *v1;

  if (a1 == 4)
  {
    v1 = "Attempting to send message using a session that's canceling";
  }
  else
  {
    if (a1 != 5)
      _xpc_session_message_error_during_cancelation_cold_1(a1);
    v1 = "Attempting to send message using a canceled session";
  }
  return xpc_rich_error_create(v1, 0);
}

xpc_object_t xpc_session_send_message_with_reply_sync(xpc_session_t session, xpc_object_t message, xpc_rich_error_t *error_out)
{
  int state;
  unsigned int v7;
  NSObject *context;
  _xpc_rich_error_s *v9;
  xpc_object_t v10;
  char *v12;

  state = _xpc_session_get_state((os_unfair_lock_s *)session);
  if (state <= 2)
  {
    v12 = _xpc_asprintf("Attempting to send a message using a session that is neither active or canceled.");
    _xpc_api_misuse(v12);
  }
  v7 = state;
  context = dispatch_get_context(*((dispatch_object_t *)session + 8));
  if (context)
    dispatch_assert_queue_not_V2(context);
  if ((v7 & 0xFFFFFFFE) == 4)
  {
    if (error_out)
    {
      v9 = (_xpc_rich_error_s *)_xpc_session_message_error_during_cancelation(v7);
LABEL_7:
      v10 = 0;
      *error_out = v9;
      return v10;
    }
    return 0;
  }
  os_unfair_lock_lock_with_options();
  ++*((_DWORD *)session + 12);
  os_unfair_lock_unlock((os_unfair_lock_t)session + 8);
  v10 = xpc_connection_send_message_with_reply_sync(*((xpc_connection_t *)session + 7), message);
  _xpc_session_decrement_inflight_replies((uint64_t)session);
  if (v10 && xpc_get_type(v10) == (xpc_type_t)OS_xpc_error)
  {
    v9 = (_xpc_rich_error_s *)_xpc_session_cancel_after_reply_error((uint64_t)session, (__objc2_class **)v10);
    if (error_out)
      goto LABEL_7;
    return 0;
  }
  return v10;
}

void _xpc_session_decrement_inflight_replies(uint64_t a1)
{
  os_unfair_lock_s *v2;
  int v3;
  int v4;
  _BOOL4 v5;
  int v6;
  NSObject *v7;
  _QWORD block[5];

  v2 = (os_unfair_lock_s *)(a1 + 32);
  os_unfair_lock_lock_with_options();
  v3 = *(_DWORD *)(a1 + 48);
  if (v3)
  {
    v4 = v3 - 1;
    *(_DWORD *)(a1 + 48) = v4;
    v5 = v4 == 0;
  }
  else
  {
    v5 = 1;
  }
  v6 = *(_DWORD *)(a1 + 36);
  v7 = *(NSObject **)(a1 + 64);
  os_unfair_lock_unlock(v2);
  if (v5 && v6 == 4)
  {
    block[0] = MEMORY[0x1E0C87450];
    block[1] = 0x40000000;
    block[2] = ___xpc_session_decrement_inflight_replies_block_invoke;
    block[3] = &__block_descriptor_tmp_52;
    block[4] = a1;
    dispatch_async(v7, block);
  }
}

xpc_object_t _xpc_session_cancel_after_reply_error(uint64_t a1, __objc2_class **a2)
{
  int v3;
  int v4;
  uint64_t v5;
  _QWORD *v6;

  if (a2 == &_xpc_error_peer_code_signing_requirement)
    v3 = 5;
  else
    v3 = 2;
  if (a2 == &_xpc_error_connection_invalid)
    v4 = 3;
  else
    v4 = v3;
  v5 = _xpc_session_rich_error_with_cancelation_reason(a1, v4);
  v6 = _xpc_alloc(0x10uLL);
  *(_DWORD *)v6 = v4;
  v6[1] = v5;
  _xpc_session_cancel_with_reason(a1, v6);
  return xpc_retain(*(xpc_object_t *)(*(_QWORD *)(a1 + 40) + 8));
}

void xpc_session_send_message_with_reply_async(xpc_session_t session, xpc_object_t message, xpc_session_reply_handler_t reply_handler)
{
  signed int state;
  uint64_t v7;
  NSObject *v8;
  _xpc_connection_s *v9;
  NSObject *v10;
  char *v11;
  _QWORD v12[6];
  _QWORD block[6];

  state = _xpc_session_get_state((os_unfair_lock_s *)session);
  if (state <= 2)
  {
    v11 = _xpc_asprintf("Attempting to send a message using a session that is neither active or canceled.");
    _xpc_api_misuse(v11);
  }
  if ((state & 0xFFFFFFFE) == 4)
  {
    v7 = _xpc_session_message_error_during_cancelation(state);
    v8 = *((_QWORD *)session + 8);
    block[0] = MEMORY[0x1E0C87450];
    block[1] = 0x40000000;
    block[2] = __xpc_session_send_message_with_reply_async_block_invoke;
    block[3] = &unk_1EA958D88;
    block[4] = reply_handler;
    block[5] = v7;
    dispatch_async(v8, block);
  }
  else
  {
    _xpc_retain((uint64_t)session);
    os_unfair_lock_lock_with_options();
    ++*((_DWORD *)session + 12);
    os_unfair_lock_unlock((os_unfair_lock_t)session + 8);
    v9 = (_xpc_connection_s *)*((_QWORD *)session + 7);
    v10 = *((_QWORD *)session + 8);
    v12[0] = MEMORY[0x1E0C87450];
    v12[1] = 0x40000000;
    v12[2] = __xpc_session_send_message_with_reply_async_block_invoke_2;
    v12[3] = &unk_1EA958DB0;
    v12[4] = reply_handler;
    v12[5] = session;
    xpc_connection_send_message_with_reply(v9, message, v10, v12);
  }
}

void __xpc_session_send_message_with_reply_async_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  xpc_release(*(xpc_object_t *)(a1 + 40));
}

uint64_t __xpc_session_send_message_with_reply_async_block_invoke_2(uint64_t a1, __objc2_class **a2)
{
  xpc_object_t v4;
  void *v5;

  _xpc_session_decrement_inflight_replies(*(_QWORD *)(a1 + 40));
  if (xpc_get_type(a2) == (xpc_type_t)OS_xpc_error)
  {
    v4 = _xpc_session_cancel_after_reply_error(*(_QWORD *)(a1 + 40), a2);
    if (!v4)
      _xpc_mach_message_request_handoff_reply_cold_1();
    v5 = v4;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    xpc_release(v5);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  return _xpc_release(*(_QWORD *)(a1 + 40));
}

uint64_t xpc_session_set_target_user_session_uid(uint64_t a1, int a2)
{
  _xpc_session_assert_inactive((os_unfair_lock_s *)a1, "set target user session UID");
  return xpc_connection_set_target_user_session_uid(*(_QWORD *)(a1 + 56), a2);
}

uint64_t _xpc_session_assert_inactive(os_unfair_lock_s *a1, const char *a2)
{
  uint64_t result;
  const char *v4;
  char *v5;

  result = _xpc_session_get_state(a1);
  if ((_DWORD)result != 1)
  {
    v4 = _xpc_session_string_for_state(result);
    v5 = _xpc_asprintf("Session must be inactive to %s, not %s", a2, v4);
    _xpc_api_misuse(v5);
  }
  return result;
}

void xpc_session_set_instance(uint64_t a1, const unsigned __int8 *a2)
{
  _xpc_session_assert_inactive((os_unfair_lock_s *)a1, "set instance");
  xpc_connection_set_oneshot_instance(*(_QWORD *)(a1 + 56), a2);
}

void _xpc_session_get_peer_audit_token_4SWIFT(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  *a2 = 0u;
  a2[1] = 0u;
  xpc_connection_get_audit_token(*(_QWORD *)(a1 + 56), a2);
}

uint64_t _xpc_session_is_extracted(uint64_t a1)
{
  return (*(unsigned __int8 *)(a1 + 52) >> 1) & 1;
}

os_log_t ___xpc_session_log_handle_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.xpc", "session");
  _xpc_session_log_handle__log = (uint64_t)result;
  return result;
}

void ___xpc_session_setup_connection_handlers_block_invoke(uint64_t a1, __objc2_class **object)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  NSObject *v7;
  __objc2_class *type;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  char *v18;
  NSObject *v19;
  char *v20;
  NSObject *v21;
  int v22;
  int *v23;
  char *v24;
  uint8_t buf[16];
  __int128 v26;
  uint8_t v27[4];
  uint64_t v28;
  __int16 v29;
  _BYTE v30[14];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C874D8];
  v3 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 36);
  if ((v3 - 4) <= 0xFFFFFFFD)
  {
    if (_os_trace_lazy_init_completed_4libxpc())
    {
      if (_xpc_session_log_handle__once != -1)
        dispatch_once(&_xpc_session_log_handle__once, &__block_literal_global_4);
      v4 = _xpc_session_log_handle__log;
      if (os_log_type_enabled((os_log_t)_xpc_session_log_handle__log, OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v5;
        v6 = "[%p] Received event on inactive Session";
        v7 = v4;
LABEL_7:
        _os_log_impl(&dword_1DEE85000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, 0xCu);
        return;
      }
    }
    return;
  }
  if (v3 == 2 && object != &_xpc_error_connection_invalid)
    _os_assumes_log();
  type = (__objc2_class *)xpc_get_type(object);
  v11 = *(_QWORD *)(a1 + 32);
  if (type != OS_xpc_error)
  {
    v12 = *(_QWORD *)(v11 + 24);
    if (v12)
    {
      (*(void (**)(uint64_t, __objc2_class **))(v12 + 16))(v12, object);
    }
    else
    {
      v18 = _xpc_session_common_copy_concise_identifier(*(_QWORD *)(v11 + 56), "Session");
      *(_OWORD *)buf = 0u;
      v26 = 0u;
      xpc_dictionary_get_audit_token(object);
      if (_os_trace_lazy_init_completed_4libxpc())
      {
        if (_xpc_session_log_handle__once != -1)
          dispatch_once(&_xpc_session_log_handle__once, &__block_literal_global_4);
        v19 = _xpc_session_log_handle__log;
        if (os_log_type_enabled((os_log_t)_xpc_session_log_handle__log, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v27 = 134218498;
          v28 = v11;
          v29 = 2080;
          *(_QWORD *)v30 = v18;
          *(_WORD *)&v30[8] = 1024;
          *(_DWORD *)&v30[10] = DWORD1(v26);
          _os_log_impl(&dword_1DEE85000, v19, OS_LOG_TYPE_ERROR, "[%p] Incoming message to %s from PID %d is dropped because incoming message handler isn't set", v27, 0x1Cu);
        }
      }
      v20 = _xpc_asprintf("Incoming message to %s is dropped because incoming message handler isn't set", v18);
      if (os_fault_with_payload() && _os_trace_lazy_init_completed_4libxpc())
      {
        if (_xpc_session_log_handle__once != -1)
          dispatch_once(&_xpc_session_log_handle__once, &__block_literal_global_4);
        v21 = _xpc_session_log_handle__log;
        if (os_log_type_enabled((os_log_t)_xpc_session_log_handle__log, OS_LOG_TYPE_ERROR))
        {
          v22 = *__error();
          v23 = __error();
          v24 = xpc_strerror(*v23);
          *(_DWORD *)v27 = 134218498;
          v28 = v11;
          v29 = 1024;
          *(_DWORD *)v30 = v22;
          *(_WORD *)&v30[4] = 2080;
          *(_QWORD *)&v30[6] = v24;
          _os_log_impl(&dword_1DEE85000, v21, OS_LOG_TYPE_ERROR, "[%p] Unable to generate a fault: %d - %s", v27, 0x1Cu);
        }
      }
      free(v20);
      free(v18);
    }
    return;
  }
  if (object == &_xpc_error_connection_invalid)
  {
    if (_os_trace_lazy_init_completed_4libxpc())
    {
      if (_xpc_session_log_handle__once != -1)
        dispatch_once(&_xpc_session_log_handle__once, &__block_literal_global_4);
      v15 = _xpc_session_log_handle__log;
      if (os_log_type_enabled((os_log_t)_xpc_session_log_handle__log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v11;
        _os_log_impl(&dword_1DEE85000, v15, OS_LOG_TYPE_DEFAULT, "[%p] Connection invalidation received", buf, 0xCu);
      }
    }
    if (*(_DWORD *)(v11 + 36) == 2)
      v14 = 6;
    else
      v14 = 3;
    goto LABEL_40;
  }
  if (object == &_xpc_error_connection_interrupted)
  {
    if (_os_trace_lazy_init_completed_4libxpc())
    {
      if (_xpc_session_log_handle__once != -1)
        dispatch_once(&_xpc_session_log_handle__once, &__block_literal_global_4);
      v16 = _xpc_session_log_handle__log;
      if (os_log_type_enabled((os_log_t)_xpc_session_log_handle__log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v11;
        _os_log_impl(&dword_1DEE85000, v16, OS_LOG_TYPE_DEFAULT, "[%p] Connection interruption received", buf, 0xCu);
      }
    }
    v14 = 2;
    goto LABEL_40;
  }
  if (object != &_xpc_error_termination_imminent)
  {
    if (object != &_xpc_error_peer_code_signing_requirement)
      ___xpc_session_setup_connection_handlers_block_invoke_cold_1();
    if (_os_trace_lazy_init_completed_4libxpc())
    {
      if (_xpc_session_log_handle__once != -1)
        dispatch_once(&_xpc_session_log_handle__once, &__block_literal_global_4);
      v13 = _xpc_session_log_handle__log;
      if (os_log_type_enabled((os_log_t)_xpc_session_log_handle__log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v11;
        _os_log_impl(&dword_1DEE85000, v13, OS_LOG_TYPE_DEFAULT, "[%p] Peer did not meet the code signing requirement. Cancelling the connection.", buf, 0xCu);
      }
    }
    v14 = 5;
LABEL_40:
    _xpc_session_cancel_with_code(*(_QWORD *)(a1 + 32), v14);
    return;
  }
  if (_os_trace_lazy_init_completed_4libxpc())
  {
    if (_xpc_session_log_handle__once != -1)
      dispatch_once(&_xpc_session_log_handle__once, &__block_literal_global_4);
    v17 = _xpc_session_log_handle__log;
    if (os_log_type_enabled((os_log_t)_xpc_session_log_handle__log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v11;
      v6 = "[%p] Termination imminent. No more messages will be received on this session.";
      v7 = v17;
      goto LABEL_7;
    }
  }
}

uint64_t _xpc_session_rich_error_with_cancelation_reason(uint64_t a1, int a2)
{
  const char *v2;
  char *v3;
  char *v4;
  const char *v5;
  char *v6;
  uint64_t v7;

  if ((a2 & 0xFFFFFFFB) - 1 > 1)
  {
    if (a2 == 3)
    {
      v3 = xpc_connection_copy_invalidation_reason(*(_QWORD *)(a1 + 56));
      v4 = v3;
      v5 = "Unknown";
      if (v3)
        v5 = v3;
      v6 = _xpc_asprintf("%s. Reason: %s", "Underlying connection was invalidated", v5);
      if (v4)
        free(v4);
      v7 = xpc_rich_error_create(v6, 0);
      free(v6);
      return v7;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    if ((a2 - 2) > 4)
      v2 = "Session manually canceled";
    else
      v2 = off_1EA958F00[a2 - 2];
    return xpc_rich_error_create(v2, 0);
  }
}

void _xpc_session_cancel_with_reason(uint64_t a1, _QWORD *a2)
{
  os_unfair_lock_s *v4;
  _xpc_connection_s *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  char v11;
  NSObject *v12;
  __int128 v13;
  void (*v14)(uint64_t);
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C874D8];
  v4 = (os_unfair_lock_s *)(a1 + 32);
  os_unfair_lock_lock_with_options();
  if (a2)
  {
    if (*(_QWORD *)(a1 + 40))
    {
      _xpc_session_cancelation_reason_dispose(a2);
    }
    else
    {
      os_unfair_lock_assert_owner(v4);
      *(_QWORD *)(a1 + 40) = a2;
    }
  }
  if (*(_DWORD *)(a1 + 36) != 5)
  {
    os_unfair_lock_assert_owner(v4);
    if (*(_DWORD *)(a1 + 36) != 4)
    {
      os_unfair_lock_assert_owner(v4);
      *(_DWORD *)(a1 + 36) = 4;
    }
    os_unfair_lock_assert_owner(v4);
    if (!*(_DWORD *)(a1 + 48))
    {
      v5 = *(_xpc_connection_s **)(a1 + 56);
      if (v5 && (*(_BYTE *)(a1 + 52) & 2) == 0)
      {
        xpc_connection_set_event_handler(v5, &__block_literal_global_45);
        xpc_connection_cancel(*(xpc_connection_t *)(a1 + 56));
      }
      os_unfair_lock_assert_owner(v4);
      *(_DWORD *)(a1 + 36) = 5;
      if (_os_trace_lazy_init_completed_4libxpc())
      {
        if (_xpc_session_log_handle__once != -1)
          dispatch_once(&_xpc_session_log_handle__once, &__block_literal_global_4);
        v6 = _xpc_session_log_handle__log;
        if (os_log_type_enabled((os_log_t)_xpc_session_log_handle__log, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(v13) = 134217984;
          *(_QWORD *)((char *)&v13 + 4) = a1;
          _os_log_impl(&dword_1DEE85000, v6, OS_LOG_TYPE_DEFAULT, "[%p] Session canceled.", (uint8_t *)&v13, 0xCu);
        }
      }
      v7 = *(_QWORD *)(a1 + 16);
      v8 = MEMORY[0x1E0C87450];
      if (v7)
      {
        os_unfair_lock_assert_owner(v4);
        v9 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
        xpc_retain(v9);
        v10 = *(NSObject **)(a1 + 64);
        *(_QWORD *)&v13 = v8;
        *((_QWORD *)&v13 + 1) = 0x40000000;
        v14 = ___xpc_session_call_cancel_handler_block_invoke;
        v15 = &unk_1EA958E98;
        v16 = v7;
        v17 = v9;
        dispatch_async(v10, &v13);
      }
      v11 = *(_BYTE *)(a1 + 52) & 1;
      v12 = *(NSObject **)(a1 + 64);
      *(_QWORD *)&v13 = v8;
      *((_QWORD *)&v13 + 1) = 0x40000000;
      v14 = ___xpc_session_complete_cancelation_locked_block_invoke_46;
      v15 = &__block_descriptor_tmp_47;
      v16 = a1;
      LOBYTE(v17) = v11;
      dispatch_async(v12, &v13);
    }
  }
  os_unfair_lock_unlock(v4);
}

void ___xpc_session_complete_cancelation_locked_block_invoke_46(uint64_t a1)
{
  _xpc_release(*(_QWORD *)(a1 + 32));
  if (*(_BYTE *)(a1 + 40))
    xpc_release(*(xpc_object_t *)(a1 + 32));
}

void ___xpc_session_call_cancel_handler_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  xpc_release(*(xpc_object_t *)(a1 + 40));
}

void ___xpc_session_decrement_inflight_replies_block_invoke(uint64_t a1)
{
  _xpc_session_cancel_with_reason(*(_QWORD *)(a1 + 32), 0);
}

BOOL _xpc_endpoint_equal(uint64_t a1, uint64_t a2)
{
  return *(_DWORD *)(a1 + 24) == *(_DWORD *)(a2 + 24);
}

unint64_t _xpc_endpoint_hash(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24) ^ (unint64_t)_xpc_endpoint_hash;
}

uint64_t _xpc_endpoint_desc(unint64_t *a1, uint64_t a2)
{
  return _xpc_base_desc(a1, a2);
}

uint64_t _xpc_endpoint_debug()
{
  return 0;
}

uint64_t _xpc_endpoint_serialize(uint64_t a1, _QWORD *a2)
{
  int v3;

  v3 = 73728;
  return _xpc_serializer_append_port(a2, &v3, 4uLL, a1, *(_DWORD *)(a1 + 24), 19);
}

uint64_t _xpc_endpoint_deserialize(uint64_t *a1)
{
  int v1;
  uint64_t result;
  int v3;
  int v4;

  v4 = 0;
  if (!_xpc_graph_deserializer_read_port(a1, 17, &v4))
    return 0;
  v1 = v4;
  result = _xpc_base_create();
  v3 = *(_DWORD *)(result + 16);
  *(_DWORD *)(result + 24) = v1;
  *(_DWORD *)(result + 16) = v3 | 3;
  return result;
}

uint64_t _xpc_endpoint_wire_length()
{
  return -1;
}

uint64_t _xpc_endpoint_dispose(uint64_t a1)
{
  uint64_t result;

  result = *(unsigned int *)(a1 + 24);
  if ((result + 1) >= 2)
  {
    result = _xpc_mach_port_release(result);
    if ((_DWORD)result)
      return _os_assumes_log();
  }
  return result;
}

uint64_t _xpc_endpoint_create(int a1)
{
  uint64_t result;

  result = _xpc_base_create();
  *(_DWORD *)(result + 16) |= 2u;
  *(_DWORD *)(result + 24) = a1;
  return result;
}

uint64_t _xpc_endpoint_get_listener_port(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

uint64_t _xpc_endpoint_copy_listener_port(uint64_t a1)
{
  uint64_t v1;
  int v2;

  v1 = *(unsigned int *)(a1 + 24);
  if ((v1 - 1) > 0xFFFFFFFD)
    return 0xFFFFFFFFLL;
  v2 = _xpc_mach_port_retain_send(*(_DWORD *)(a1 + 24));
  if (v2)
  {
    if (v2 != 17)
      _os_assumes_log();
    return 0xFFFFFFFFLL;
  }
  return v1;
}

xpc_endpoint_t xpc_endpoint_create(xpc_connection_t connection)
{
  int v2;
  xpc_endpoint_t result;

  if (xpc_get_type(connection) != (xpc_type_t)OS_xpc_connection)
    _xpc_api_misuse("Given object not of required type.");
  v2 = _xpc_connection_copy_listener_port((uint64_t)connection);
  result = (xpc_endpoint_t)_xpc_base_create();
  *((_DWORD *)result + 4) |= 2u;
  *((_DWORD *)result + 6) = v2;
  return result;
}

uint64_t xpc_endpoint_compare(_DWORD *a1, _DWORD *a2)
{
  unsigned int v4;
  unsigned int v5;
  BOOL v6;
  unsigned int v7;

  if (xpc_get_type(a1) != (xpc_type_t)OS_xpc_endpoint
    || xpc_get_type(a2) != (xpc_type_t)OS_xpc_endpoint)
  {
    _xpc_api_misuse("Given object not of required type.");
  }
  v4 = a1[6];
  v5 = a2[6];
  v6 = v4 == v5;
  if (v4 > v5)
    v7 = 1;
  else
    v7 = -1;
  if (v6)
    return 0;
  else
    return v7;
}

uint64_t xpc_endpoint_create_bs_from_port(int a1)
{
  uint64_t result;
  char *v3;

  if ((a1 - 1) >= 0xFFFFFFFE)
  {
    v3 = _xpc_asprintf("Cannot create endpoint from invalid mach port.");
    _xpc_api_misuse(v3);
  }
  result = _xpc_base_create();
  *(_DWORD *)(result + 16) |= 2u;
  *(_DWORD *)(result + 24) = a1;
  return result;
}

uint64_t xpc_endpoint_create_bs_named(char *a1, int a2, char *a3)
{
  uint64_t v3;

  if (a2)
    v3 = 8;
  else
    v3 = 0;
  return _xpc_endpoint_create_bs(a1, 7, 0, 0, v3, a3);
}

uint64_t _xpc_endpoint_create_bs(char *a1, int a2, uint64_t a3, const unsigned __int8 *a4, uint64_t a5, char *a6)
{
  uint64_t v7;
  int v8;
  uint64_t result;
  int v10;
  char v11;
  BOOL v12;
  int v13;

  if (!a1)
    _xpc_mach_message_request_handoff_reply_cold_1();
  if (!a6)
    _xpc_mach_message_request_handoff_reply_cold_1();
  *a6 = 0;
  v7 = 544;
  if (!a4)
    v7 = 512;
  v13 = 0;
  v12 = 0;
  v8 = _xpc_look_up_endpoint(a1, a2, a3, 0, a4, v7 | a5, 0, &v13, &v12);
  result = 0;
  if (v8 > 123)
  {
    if ((v8 - 124) > 0x23 || ((1 << (v8 - 124)) & 0x800200001) == 0)
      goto LABEL_12;
  }
  else if (v8)
  {
    if (v8 != 1 && v8 != 3)
    {
LABEL_12:
      _os_assumes_log();
      return 0;
    }
  }
  else
  {
    v10 = v13;
    result = _xpc_base_create();
    *(_DWORD *)(result + 16) |= 2u;
    *(_DWORD *)(result + 24) = v10;
    if (v12)
      v11 = 3;
    else
      v11 = 2;
    *a6 = v11;
  }
  return result;
}

uint64_t xpc_endpoint_create_bs_service(char *a1, const unsigned __int8 *a2, char *a3)
{
  uint64_t v6;

  _xpc_uncork_domain();
  v6 = getpid();
  return _xpc_endpoint_create_bs(a1, 5, v6, a2, 0, a3);
}

BOOL xpc_endpoint_get_bs_job_handle(uint64_t a1, _OWORD *a2)
{
  mach_port_name_t v2;
  void *v4;
  xpc_object_t v5;
  int v6;
  _BOOL8 v7;
  const uint8_t *uuid;
  xpc_object_t xdict;

  v2 = *(_DWORD *)(a1 + 24);
  if (v2 + 1 < 2)
    return 0;
  v4 = (void *)xpc_mach_send_create(v2);
  if (!xpc_mach_send_get_right((unsigned int *)v4)
    || xpc_mach_send_get_right((unsigned int *)v4) == -1)
  {
    xpc_release(v4);
    return 0;
  }
  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_value(v5, "endpoint", v4);
  xpc_release(v4);
  xdict = 0;
  v6 = _launch_job_routine(1012, v5, &xdict);
  v7 = v6 == 0;
  if (v6)
  {
    if (v6 != 113)
      _os_assumes_log();
  }
  else
  {
    if (!xdict)
      _xpc_mach_message_request_handoff_reply_cold_1();
    uuid = xpc_dictionary_get_uuid(xdict, "job-handle");
    if (!uuid)
      _xpc_mach_message_request_handoff_reply_cold_1();
    *a2 = *(_OWORD *)uuid;
    xpc_release(xdict);
  }
  xpc_release(v5);
  return v7;
}

uint64_t xpc_endpoint_create_mach_port_4sim(int a1)
{
  uint64_t result;
  char *v3;

  if ((a1 - 1) >= 0xFFFFFFFE)
  {
    v3 = _xpc_asprintf("Cannot create endpoint from invalid mach port.");
    _xpc_api_misuse(v3);
  }
  result = _xpc_base_create();
  *(_DWORD *)(result + 16) |= 2u;
  *(_DWORD *)(result + 24) = a1;
  return result;
}

BOOL _xpc_pointer_equal(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 24) == *(_QWORD *)(a2 + 24);
}

uint64_t _xpc_pointer_hash(uint64_t a1)
{
  return _xpc_hash((_BYTE *)(a1 + 24), 8);
}

uint64_t _xpc_pointer_desc(const void **a1, uint64_t a2)
{
  unsigned int v3;
  int v4;
  char __str[16];
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C874D8];
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  *(_OWORD *)__str = 0u;
  v7 = 0u;
  v3 = snprintf(__str, 0x80uLL, "<%s: %p>: %p", "pointer", a1, a1[3]);
  if (v3 >= 0x7F)
    v4 = 127;
  else
    v4 = v3;
  return _xpc_serializer_append(a2, __str, (v4 + 1), 0);
}

uint64_t _xpc_pointer_debug(uint64_t a1, char *__str, size_t __size)
{
  return snprintf(__str, __size, ", value = %p", *(const void **)(a1 + 24));
}

uint64_t _xpc_pointer_deserialize()
{
  return 0;
}

uint64_t _xpc_pointer_wire_length()
{
  return -1;
}

uint64_t xpc_pointer_create(uint64_t a1)
{
  uint64_t result;

  result = _xpc_base_create();
  *(_QWORD *)(result + 24) = a1;
  return result;
}

uint64_t xpc_pointer_get_value(_QWORD *a1)
{
  if (xpc_get_type(a1) == (xpc_type_t)OS_xpc_pointer)
    return a1[3];
  else
    return 0;
}

char *__cdecl xpc_listener_copy_description(xpc_listener_t listener)
{
  unsigned int v2;
  const char *v3;
  char *v4;
  char *v5;

  v2 = _xpc_listener_get_state((os_unfair_lock_s *)listener) - 1;
  if (v2 > 2)
    v3 = "Unknown";
  else
    v3 = off_1EA958FE8[v2];
  v4 = _xpc_session_common_copy_concise_identifier(*((_QWORD *)listener + 4), "Listener");
  v5 = _xpc_asprintf("%s(%s)", v4, v3);
  free(v4);
  return v5;
}

uint64_t _xpc_listener_get_state(os_unfair_lock_s *a1)
{
  os_unfair_lock_s *v2;
  uint64_t os_unfair_lock_opaque;

  v2 = a1 + 6;
  os_unfair_lock_lock_with_options();
  os_unfair_lock_assert_owner(v2);
  os_unfair_lock_opaque = a1[7]._os_unfair_lock_opaque;
  os_unfair_lock_unlock(v2);
  return os_unfair_lock_opaque;
}

uint64_t _xpc_listener_xref_dispose(os_unfair_lock_s *a1)
{
  uint64_t result;
  char *v2;

  result = _xpc_listener_get_state(a1);
  if ((_DWORD)result != 3)
  {
    v2 = _xpc_asprintf("Listener must be canceled before it's disposed");
    _xpc_api_misuse(v2);
  }
  return result;
}

void _xpc_listener_dispose(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C874D8];
  if (_os_trace_lazy_init_completed_4libxpc())
  {
    if (_xpc_listener_log_handle__once != -1)
      dispatch_once(&_xpc_listener_log_handle__once, &__block_literal_global_5);
    v2 = _xpc_listener_log_handle__log;
    if (os_log_type_enabled((os_log_t)_xpc_listener_log_handle__log, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 134217984;
      v5 = a1;
      _os_log_impl(&dword_1DEE85000, v2, OS_LOG_TYPE_DEFAULT, "[%p] Disposing of listener", (uint8_t *)&v4, 0xCu);
    }
  }
  if (*(_DWORD *)(a1 + 28) != 3)
    _xpc_mach_message_request_handoff_reply_cold_1();
  xpc_release(*(xpc_object_t *)(a1 + 32));
  *(_QWORD *)(a1 + 32) = 0;
  _Block_release(*(const void **)(a1 + 16));
  *(_QWORD *)(a1 + 16) = 0;
  v3 = *(NSObject **)(a1 + 40);
  if (v3)
    dispatch_release(v3);
}

xpc_endpoint_t xpc_listener_create_endpoint(uint64_t a1)
{
  return xpc_endpoint_create(*(xpc_connection_t *)(a1 + 32));
}

xpc_listener_t xpc_listener_create(const char *service, dispatch_queue_t target_queue, xpc_listener_create_flags_t flags, xpc_listener_incoming_session_handler_t incoming_session_handler, xpc_rich_error_t *error_out)
{
  int v7;
  NSObject *opq;
  _xpc_connection_s *listener;
  uint64_t v11;
  xpc_listener_s *v12;
  NSObject *v13;
  char *v15;
  int v16;
  xpc_listener_s *v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v7 = flags;
  v20 = *MEMORY[0x1E0C874D8];
  opq = _xpc_session_common_create_opq(target_queue, "com.apple.listener.queue");
  listener = (_xpc_connection_s *)xpc_connection_create_listener((char *)service);
  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 16) == -1)
    v11 = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 24);
  else
    v11 = _os_alloc_once();
  if ((~v7 & 6) == 0)
  {
    v15 = _xpc_asprintf("Cannot force the listener to be both a MachService and a XPCService");
    _xpc_api_misuse(v15);
  }
  if ((v7 & 2) != 0 || !(v7 & 4 | *(_QWORD *)(v11 + 8) & 0x8000))
    xpc_connection_set_legacy((uint64_t)listener);
  v12 = (xpc_listener_s *)_xpc_listener_create_with_connection(listener, (uint64_t)opq, v7, incoming_session_handler, (uint64_t *)error_out);
  if (_os_trace_lazy_init_completed_4libxpc())
  {
    if (_xpc_listener_log_handle__once != -1)
      dispatch_once(&_xpc_listener_log_handle__once, &__block_literal_global_5);
    v13 = _xpc_listener_log_handle__log;
    if (os_log_type_enabled((os_log_t)_xpc_listener_log_handle__log, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 134218242;
      v17 = v12;
      v18 = 2080;
      v19 = service;
      _os_log_impl(&dword_1DEE85000, v13, OS_LOG_TYPE_DEFAULT, "[%p] Listener created with name: %s", (uint8_t *)&v16, 0x16u);
    }
  }
  return v12;
}

_QWORD *_xpc_listener_create_with_connection(_xpc_connection_s *a1, uint64_t a2, char a3, const void *a4, uint64_t *a5)
{
  _QWORD *v10;
  char v11;
  _QWORD handler[5];

  v10 = (_QWORD *)_xpc_listener_alloc();
  v10[3] = 0x100000000;
  v10[4] = a1;
  v10[5] = a2;
  v10[2] = _xpc_Block_copy_impl(a4);
  _xpc_retain((uint64_t)v10);
  handler[0] = MEMORY[0x1E0C87450];
  handler[1] = 0x40000000;
  handler[2] = ___xpc_listener_setup_connection_handlers_block_invoke;
  handler[3] = &__block_descriptor_tmp_15;
  handler[4] = v10;
  xpc_connection_set_event_handler(a1, handler);
  if ((a3 & 1) == 0)
  {
    LODWORD(handler[0]) = 0;
    v11 = _xpc_listener_activate((uint64_t)v10, handler, a5);
    if (LODWORD(handler[0]) != 1)
      _xpc_mach_message_request_handoff_reply_cold_1();
    if ((v11 & 1) == 0)
    {
      xpc_release(v10);
      return 0;
    }
  }
  return v10;
}

_QWORD *xpc_listener_create_anonymous(NSObject *a1, char a2, const void *a3)
{
  NSObject *opq;
  _xpc_connection_s *v6;
  _QWORD *v7;
  NSObject *v8;
  uint64_t v10;
  uint8_t buf[4];
  _QWORD *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C874D8];
  opq = _xpc_session_common_create_opq(a1, "com.apple.listener.queue");
  v6 = xpc_connection_create(0, opq);
  v10 = 0;
  v7 = _xpc_listener_create_with_connection(v6, (uint64_t)opq, a2, a3, &v10);
  if (!v7)
    _os_assumes_log();
  if (v10)
    _os_assumes_log();
  if (_os_trace_lazy_init_completed_4libxpc())
  {
    if (_xpc_listener_log_handle__once != -1)
      dispatch_once(&_xpc_listener_log_handle__once, &__block_literal_global_5);
    v8 = _xpc_listener_log_handle__log;
    if (os_log_type_enabled((os_log_t)_xpc_listener_log_handle__log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v12 = v7;
      _os_log_impl(&dword_1DEE85000, v8, OS_LOG_TYPE_DEFAULT, "[%p] Anonymous listener created", buf, 0xCu);
    }
  }
  return v7;
}

BOOL xpc_listener_activate(xpc_listener_t listener, xpc_rich_error_t *error_out)
{
  BOOL result;
  char *v3;
  int v4;

  v4 = 0;
  result = _xpc_listener_activate((uint64_t)listener, &v4, (uint64_t *)error_out);
  if (v4 != 1)
  {
    if (v4 == 2)
      v3 = _xpc_asprintf("Attempting to activate an already active listener");
    else
      v3 = _xpc_asprintf("Attempting to activate a listener in an unknown state");
    _xpc_api_misuse(v3);
  }
  return result;
}

uint64_t _xpc_listener_activate(uint64_t a1, _DWORD *a2, uint64_t *a3)
{
  os_unfair_lock_s *v6;
  _BOOL4 is_invalid;
  char *v8;
  char *v9;
  char *v10;
  NSObject *v11;
  NSObject *v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C874D8];
  if (!a2)
    _xpc_mach_message_request_handoff_reply_cold_1();
  v6 = (os_unfair_lock_s *)(a1 + 24);
  os_unfair_lock_lock_with_options();
  *a2 = *(_DWORD *)(a1 + 28);
  if (*(_DWORD *)(a1 + 28) != 1)
  {
    os_unfair_lock_unlock(v6);
    return 0;
  }
  xpc_retain((xpc_object_t)a1);
  os_unfair_lock_assert_owner(v6);
  *(_DWORD *)(a1 + 28) = 2;
  xpc_connection_activate(*(xpc_connection_t *)(a1 + 32));
  is_invalid = _xpc_connection_is_invalid(*(_QWORD *)(a1 + 32));
  os_unfair_lock_unlock(v6);
  if (is_invalid)
  {
    v8 = xpc_connection_copy_invalidation_reason(*(_QWORD *)(a1 + 32));
    v9 = v8;
    if (a3)
    {
      v10 = _xpc_asprintf("Unable to activate listener: %s", v8);
      *a3 = xpc_rich_error_create(v10, 0);
      free(v10);
    }
    if (_os_trace_lazy_init_completed_4libxpc())
    {
      if (_xpc_listener_log_handle__once != -1)
        dispatch_once(&_xpc_listener_log_handle__once, &__block_literal_global_5);
      v11 = _xpc_listener_log_handle__log;
      if (os_log_type_enabled((os_log_t)_xpc_listener_log_handle__log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v15 = a1;
        v16 = 2080;
        v17 = v9;
        _os_log_impl(&dword_1DEE85000, v11, OS_LOG_TYPE_DEFAULT, "[%p] Failed listener activation: %s", buf, 0x16u);
      }
    }
    free(v9);
    xpc_listener_cancel((xpc_listener_t)a1);
    return 0;
  }
  if (_os_trace_lazy_init_completed_4libxpc())
  {
    if (_xpc_listener_log_handle__once != -1)
      dispatch_once(&_xpc_listener_log_handle__once, &__block_literal_global_5);
    v13 = _xpc_listener_log_handle__log;
    if (os_log_type_enabled((os_log_t)_xpc_listener_log_handle__log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v15 = a1;
      _os_log_impl(&dword_1DEE85000, v13, OS_LOG_TYPE_DEFAULT, "[%p] Listener activated", buf, 0xCu);
    }
  }
  return 1;
}

void xpc_listener_cancel(xpc_listener_t listener)
{
  os_unfair_lock_s *v2;
  int v3;
  _xpc_connection_s *v4;
  NSObject *v5;
  NSObject *v6;
  __int128 v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  xpc_listener_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C874D8];
  v2 = (os_unfair_lock_s *)((char *)listener + 24);
  os_unfair_lock_lock_with_options();
  v3 = *((_DWORD *)listener + 7);
  if (v3 != 3)
  {
    v4 = (_xpc_connection_s *)*((_QWORD *)listener + 4);
    if (v4)
    {
      xpc_connection_set_event_handler(v4, &__block_literal_global_19);
      xpc_connection_cancel(*((xpc_connection_t *)listener + 4));
    }
    os_unfair_lock_assert_owner(v2);
    *((_DWORD *)listener + 7) = 3;
    if (_os_trace_lazy_init_completed_4libxpc())
    {
      if (_xpc_listener_log_handle__once != -1)
        dispatch_once(&_xpc_listener_log_handle__once, &__block_literal_global_5);
      v5 = _xpc_listener_log_handle__log;
      if (os_log_type_enabled((os_log_t)_xpc_listener_log_handle__log, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v7) = 134217984;
        *(_QWORD *)((char *)&v7 + 4) = listener;
        _os_log_impl(&dword_1DEE85000, v5, OS_LOG_TYPE_DEFAULT, "[%p] Listener canceled.", (uint8_t *)&v7, 0xCu);
      }
    }
    if (v3 == 2)
      xpc_release(listener);
    v6 = *((_QWORD *)listener + 5);
    *(_QWORD *)&v7 = MEMORY[0x1E0C87450];
    *((_QWORD *)&v7 + 1) = 0x40000000;
    v8 = ___xpc_listener_cancel_locked_block_invoke_20;
    v9 = &__block_descriptor_tmp_21_1;
    v10 = listener;
    dispatch_async(v6, &v7);
  }
  os_unfair_lock_unlock(v2);
}

os_log_t ___xpc_listener_log_handle_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.xpc", "listener");
  _xpc_listener_log_handle__log = (uint64_t)result;
  return result;
}

void ___xpc_listener_setup_connection_handlers_block_invoke(uint64_t a1, __objc2_class **a2)
{
  uint64_t v3;
  char *v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  const char *v8;
  void *v9;
  uint64_t v10;
  int v11;
  char *v12;
  NSObject *v13;
  uint64_t v14;
  const char *v15;
  int is_extracted;
  int inited;
  uint64_t v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  xpc_rich_error_t error;
  xpc_rich_error_t v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C874D8];
  v3 = *(_QWORD *)(a1 + 32);
  if (_xpc_listener_get_state((os_unfair_lock_s *)v3) != 2)
  {
    if (!_os_trace_lazy_init_completed_4libxpc())
      return;
    if (_xpc_listener_log_handle__once != -1)
      dispatch_once(&_xpc_listener_log_handle__once, &__block_literal_global_5);
    v7 = _xpc_listener_log_handle__log;
    if (!os_log_type_enabled((os_log_t)_xpc_listener_log_handle__log, OS_LOG_TYPE_DEFAULT))
      return;
    *(_DWORD *)buf = 134217984;
    v25 = v3;
    v8 = "[%p] Received event on inactive Listener";
LABEL_26:
    _os_log_impl(&dword_1DEE85000, v7, OS_LOG_TYPE_DEFAULT, v8, buf, 0xCu);
    return;
  }
  if (a2 == &_xpc_error_connection_invalid)
  {
    if (!_os_trace_lazy_init_completed_4libxpc())
      return;
    if (_xpc_listener_log_handle__once != -1)
      dispatch_once(&_xpc_listener_log_handle__once, &__block_literal_global_5);
    v7 = _xpc_listener_log_handle__log;
    if (!os_log_type_enabled((os_log_t)_xpc_listener_log_handle__log, OS_LOG_TYPE_DEFAULT))
      return;
    *(_DWORD *)buf = 134217984;
    v25 = v3;
    v8 = "[%p] Connection invalidation received";
    goto LABEL_26;
  }
  if (a2 != &_xpc_error_connection_interrupted)
  {
    if (xpc_get_type(a2) != (xpc_type_t)OS_xpc_connection)
    {
      v4 = xpc_copy_description(a2);
      if (!_os_trace_lazy_init_completed_4libxpc())
        goto LABEL_34;
      if (_xpc_listener_log_handle__once != -1)
        dispatch_once(&_xpc_listener_log_handle__once, &__block_literal_global_5);
      v5 = _xpc_listener_log_handle__log;
      if (!os_log_type_enabled((os_log_t)_xpc_listener_log_handle__log, OS_LOG_TYPE_DEFAULT))
        goto LABEL_34;
      *(_DWORD *)buf = 134218242;
      v25 = v3;
      v26 = 2080;
      v27 = v4;
      v6 = "[%p] Received object of unsupported type: %s";
LABEL_10:
      _os_log_impl(&dword_1DEE85000, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 0x16u);
LABEL_34:
      free(v4);
      return;
    }
    if (!a2)
      return;
    error = 0;
    v9 = (void *)_xpc_session_create_with_connection((_xpc_connection_s *)a2, *(NSObject **)(v3 + 40), 1, 1, (xpc_object_t *)&error);
    if (error)
    {
      v4 = xpc_rich_error_copy_description(error);
      if (!_os_trace_lazy_init_completed_4libxpc())
        goto LABEL_34;
      if (_xpc_listener_log_handle__once != -1)
        dispatch_once(&_xpc_listener_log_handle__once, &__block_literal_global_5);
      v5 = _xpc_listener_log_handle__log;
      if (!os_log_type_enabled((os_log_t)_xpc_listener_log_handle__log, OS_LOG_TYPE_DEFAULT))
        goto LABEL_34;
      *(_DWORD *)buf = 134218242;
      v25 = v3;
      v26 = 2080;
      v27 = v4;
      v6 = "[%p] Error creating session for incoming peer: %s";
      goto LABEL_10;
    }
    v10 = *(_QWORD *)(v3 + 16);
    if (!v10)
      ___xpc_listener_setup_connection_handlers_block_invoke_cold_1();
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v9);
    v23 = 0;
    v11 = _xpc_session_activate_if_new((uint64_t)v9, (xpc_object_t *)&v23);
    if (v23)
    {
      v12 = xpc_rich_error_copy_description(v23);
      if (_os_trace_lazy_init_completed_4libxpc())
      {
        if (_xpc_listener_log_handle__once != -1)
          dispatch_once(&_xpc_listener_log_handle__once, &__block_literal_global_5);
        v13 = _xpc_listener_log_handle__log;
        if (os_log_type_enabled((os_log_t)_xpc_listener_log_handle__log, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          v25 = v3;
          v26 = 2080;
          v27 = v12;
          _os_log_impl(&dword_1DEE85000, v13, OS_LOG_TYPE_DEFAULT, "[%p] Error activating session: %s", buf, 0x16u);
        }
      }
      free(v12);
      goto LABEL_44;
    }
    switch(v11)
    {
      case 1:
LABEL_44:
        xpc_release(v9);
        return;
      case 5:
        is_extracted = _xpc_session_is_extracted((uint64_t)v9);
        inited = _os_trace_lazy_init_completed_4libxpc();
        if (is_extracted)
        {
          if (!inited)
            goto LABEL_44;
          if (_xpc_listener_log_handle__once != -1)
            dispatch_once(&_xpc_listener_log_handle__once, &__block_literal_global_5);
          v14 = _xpc_listener_log_handle__log;
          if (!os_log_type_enabled((os_log_t)_xpc_listener_log_handle__log, OS_LOG_TYPE_DEFAULT))
            goto LABEL_44;
          *(_DWORD *)buf = 134217984;
          v25 = v3;
          v15 = "[%p] Peer session extracted";
        }
        else
        {
          if (!inited)
            goto LABEL_44;
          if (_xpc_listener_log_handle__once != -1)
            dispatch_once(&_xpc_listener_log_handle__once, &__block_literal_global_5);
          v14 = _xpc_listener_log_handle__log;
          if (!os_log_type_enabled((os_log_t)_xpc_listener_log_handle__log, OS_LOG_TYPE_DEFAULT))
            goto LABEL_44;
          *(_DWORD *)buf = 134217984;
          v25 = v3;
          v15 = "[%p] Peer session rejected";
        }
        break;
      case 3:
        if (!_os_trace_lazy_init_completed_4libxpc())
          goto LABEL_44;
        if (_xpc_listener_log_handle__once != -1)
          dispatch_once(&_xpc_listener_log_handle__once, &__block_literal_global_5);
        v14 = _xpc_listener_log_handle__log;
        if (!os_log_type_enabled((os_log_t)_xpc_listener_log_handle__log, OS_LOG_TYPE_DEFAULT))
          goto LABEL_44;
        *(_DWORD *)buf = 134217984;
        v25 = v3;
        v15 = "[%p] Peer session explicitly activated";
        break;
      default:
        if (!_os_trace_lazy_init_completed_4libxpc())
          goto LABEL_44;
        if (_xpc_listener_log_handle__once != -1)
          dispatch_once(&_xpc_listener_log_handle__once, &__block_literal_global_5);
        v18 = _xpc_listener_log_handle__log;
        if (!os_log_type_enabled((os_log_t)_xpc_listener_log_handle__log, OS_LOG_TYPE_DEFAULT))
          goto LABEL_44;
        v19 = _xpc_session_string_for_state(v11);
        *(_DWORD *)buf = 134218242;
        v25 = v3;
        v26 = 2080;
        v27 = (void *)v19;
        v15 = "[%p] Unexpected peer session state: %s";
        v20 = v18;
        v21 = 22;
        goto LABEL_70;
    }
    v20 = v14;
    v21 = 12;
LABEL_70:
    _os_log_impl(&dword_1DEE85000, v20, OS_LOG_TYPE_DEFAULT, v15, buf, v21);
    goto LABEL_44;
  }
  if (_os_trace_lazy_init_completed_4libxpc())
  {
    if (_xpc_listener_log_handle__once != -1)
      dispatch_once(&_xpc_listener_log_handle__once, &__block_literal_global_5);
    v7 = _xpc_listener_log_handle__log;
    if (os_log_type_enabled((os_log_t)_xpc_listener_log_handle__log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v25 = v3;
      v8 = "[%p] Connection interruption received";
      goto LABEL_26;
    }
  }
}

uint64_t ___xpc_listener_cancel_locked_block_invoke_20(uint64_t a1)
{
  return _xpc_release(*(_QWORD *)(a1 + 32));
}

uint64_t _xpc_try_mach_port_construct(mach_port_options_ptr_t options, mach_port_context_t context, mach_port_name_t *name)
{
  ipc_space_t *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;

  v6 = (ipc_space_t *)MEMORY[0x1E0C883F0];
  do
  {
    v7 = mach_port_construct(*v6, options, context, name);
    v8 = v7;
    v9 = (_DWORD)v7 == 6 || (_DWORD)v7 == 3;
  }
  while (v9 && _waiting4memory());
  return v8;
}

uint64_t _xpc_mach_port_construct(mach_port_options_t *a1, mach_port_context_t a2)
{
  int v2;
  mach_port_name_t name;

  name = 0;
  v2 = _xpc_try_mach_port_construct(a1, a2, &name);
  if (v2)
    _xpc_mach_port_construct_cold_1(v2);
  return name;
}

uint64_t _xpc_mach_port_allocate(uint32_t a1, mach_port_msgcount_t a2, mach_port_context_t a3)
{
  mach_port_options_t v4;

  v4.flags = a1;
  v4.mpl.mpl_qlimit = a2;
  v4.8 = 0uLL;
  return _xpc_mach_port_construct(&v4, a3);
}

uint64_t _xpc_mach_port_guard(mach_port_name_t name, BOOLean_t strict, mach_port_context_t a3)
{
  return mach_port_guard(*MEMORY[0x1E0C883F0], name, a3, strict);
}

uint64_t _xpc_mach_port_make_send(mach_port_name_t name)
{
  return mach_port_insert_right(*MEMORY[0x1E0C883F0], name, name, 0x14u);
}

uint64_t _xpc_mach_port_retain_send(mach_port_name_t name)
{
  return mach_port_mod_refs(*MEMORY[0x1E0C883F0], name, 0, 1);
}

uint64_t _xpc_mach_port_try_retain_send(uint64_t name)
{
  uint64_t v1;
  kern_return_t v2;

  v1 = name;
  v2 = mach_port_mod_refs(*MEMORY[0x1E0C883F0], name, 0, 1);
  if (v2)
  {
    if (v2 != 15 && v2 != 17)
      _os_assumes_log();
    return 0xFFFFFFFFLL;
  }
  return v1;
}

uint64_t _xpc_mach_port_release(mach_port_name_t name)
{
  return mach_port_deallocate(*MEMORY[0x1E0C883F0], name);
}

uint64_t _xpc_mach_port_close_recv(mach_port_name_t name, mach_port_delta_t srdelta, mach_port_context_t guard)
{
  return mach_port_destruct(*MEMORY[0x1E0C883F0], name, srdelta, guard);
}

uint64_t _xpc_mach_port_cleanup_right(mach_port_name_t name, int a2)
{
  if (name - 1 > 0xFFFFFFFD)
    return 0;
  if ((a2 - 17) < 2)
    return mach_port_deallocate(*MEMORY[0x1E0C883F0], name);
  if (a2 == 16)
    return mach_port_destruct(*MEMORY[0x1E0C883F0], name, 0, 0);
  else
    return 0;
}

mach_port_context_t _xpc_mach_port_get_context(mach_port_name_t name)
{
  mach_port_context_t context;

  context = 0;
  if (mach_port_get_context(*MEMORY[0x1E0C883F0], name, &context))
    _xpc_mach_port_get_context_cold_1();
  return context;
}

uint64_t _xpc_mach_port_set_queue_limit(uint64_t a1, int a2)
{
  int v3;

  v3 = a2;
  return MEMORY[0x1DF0F0EC0](*MEMORY[0x1E0C883F0], a1, 1, &v3, 1);
}

uint64_t _xpc_mach_port_setup_port_destroyed(mach_port_name_t name, mach_port_t notify, mach_port_t *previous)
{
  mach_msg_type_name_t v3;

  if (notify)
    v3 = 21;
  else
    v3 = 18;
  return mach_port_request_notification(*MEMORY[0x1E0C883F0], name, 69, 0, notify, v3, previous);
}

uint64_t _xpc_mach_port_setup_no_more_senders(mach_port_name_t name, mach_port_t notify, mach_port_t *previous)
{
  mach_msg_type_name_t v3;

  if (notify)
    v3 = 21;
  else
    v3 = 18;
  return mach_port_request_notification(*MEMORY[0x1E0C883F0], name, 70, 0, notify, v3, previous);
}

uint64_t _xpc_mach_msg_get_context(uint64_t a1)
{
  return *(_QWORD *)(a1 + ((*(unsigned int *)(a1 + 4) + 3) & 0x1FFFFFFFCLL) + 52);
}

uint64_t _xpc_mach_msg_get_audit_token(uint64_t a1)
{
  return a1 + ((*(unsigned int *)(a1 + 4) + 3) & 0x1FFFFFFFCLL) + 20;
}

uint64_t _xpc_get_self_audit_token()
{
  uint64_t v0;

  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 16) == -1)
    v0 = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 24);
  else
    v0 = _os_alloc_once();
  if (*(_BYTE *)(v0 + 41))
  {
    if (*(_QWORD *)(v0 + 48) != -1)
      dispatch_once_f((dispatch_once_t *)(v0 + 48), (void *)(v0 + 56), (dispatch_function_t)_fetch_self_token);
  }
  else
  {
    _fetch_self_token((task_info_t)(v0 + 56));
  }
  return v0 + 56;
}

uint64_t _fetch_self_token(task_info_t task_info_out)
{
  integer_t v2;
  uint64_t result;
  mach_msg_type_number_t task_info_outCnt;

  task_info_outCnt = 8;
  if (task_info(*MEMORY[0x1E0C883F0], 0xFu, task_info_out, &task_info_outCnt))
    _fetch_self_token_cold_1();
  v2 = task_info_out[5];
  result = getpid();
  if (v2 != (_DWORD)result || !task_info_out[7])
    _fetch_self_token_cold_1();
  return result;
}

uint64_t _xpc_fileport_makeport()
{
  uint64_t result;

  LODWORD(result) = fileport_makeport();
  if ((_DWORD)result == -1)
    LODWORD(result) = *__error();
  if ((_DWORD)result == 35)
    return 12;
  else
    return result;
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  return _os_assert_log();
}

uint64_t _xpc_dict_copy_sorted_keys(void *a1)
{
  size_t count;
  size_t v3;
  size_t i;
  xpc_object_t value;
  xpc_object_t v6;
  const char *string_ptr;
  const char *v8;
  uint64_t v9;
  _QWORD applier[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  xpc_object_t empty;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2000000000;
  empty = 0;
  empty = xpc_array_create_empty();
  applier[0] = MEMORY[0x1E0C87450];
  applier[1] = 0x40000000;
  applier[2] = ___xpc_dict_copy_sorted_keys_block_invoke;
  applier[3] = &unk_1EA959008;
  applier[4] = &v12;
  xpc_dictionary_apply(a1, applier);
  count = xpc_array_get_count((xpc_object_t)v13[3]);
  do
  {
    if (count < 2)
      break;
    v3 = 0;
    for (i = 1; i != count; ++i)
    {
      value = xpc_array_get_value((xpc_object_t)v13[3], i - 1);
      v6 = xpc_array_get_value((xpc_object_t)v13[3], i);
      string_ptr = xpc_string_get_string_ptr(value);
      v8 = xpc_string_get_string_ptr(v6);
      if (strcmp(string_ptr, v8) >= 1)
      {
        xpc_retain(value);
        xpc_array_set_value((xpc_object_t)v13[3], i - 1, v6);
        xpc_array_set_value((xpc_object_t)v13[3], i, value);
        xpc_release(value);
        v3 = i;
      }
    }
    count = v3;
  }
  while (v3);
  v9 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v9;
}

uint64_t ___xpc_dict_copy_sorted_keys_block_invoke(uint64_t a1, char *string)
{
  xpc_array_set_string(*(xpc_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), 0xFFFFFFFFFFFFFFFFLL, string);
  return 1;
}

xpc_object_t xpc_create_lwcr_dictionary(int64_t a1, int64_t a2, xpc_object_t object)
{
  xpc_object_t empty;

  if (object && xpc_get_type(object) != (xpc_type_t)OS_xpc_dictionary)
    return 0;
  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_int64(empty, "vers", a1);
  xpc_dictionary_set_int64(empty, "comp", 1);
  xpc_dictionary_set_int64(empty, "ccat", a2);
  if (object)
    xpc_dictionary_set_value(empty, "reqs", object);
  return empty;
}

size_t xpc_create_data_from_lwcr_dictionary(void *a1)
{
  xpc_object_t empty;
  xpc_object_t v3;
  size_t result;
  void **v5;
  size_t count;
  void *v7;
  size_t v8;
  size_t v9;
  void **v10;
  size_t length[5];
  char v12;

  if (xpc_get_type(a1) != (xpc_type_t)OS_xpc_dictionary)
    return 0;
  empty = xpc_array_create_empty();
  if (serialize_xpc_dict(a1, empty))
  {
    xpc_release(empty);
    return 0;
  }
  if (!empty)
    return 0;
  result = xpc_array_get_count(empty);
  if (!(result >> 59))
  {
    v5 = (void **)_xpc_alloc(32 * result);
    length[0] = MEMORY[0x1E0C87450];
    length[1] = 0x40000000;
    length[2] = (size_t)__convert_xpc_array_to_ce_elem_array_block_invoke;
    length[3] = (size_t)&__block_descriptor_tmp_12_0;
    length[4] = (size_t)v5;
    xpc_array_apply(empty, length);
    count = xpc_array_get_count(empty);
    length[0] = 0;
    v3 = 0;
    if (CESizeSerialization(v5, count, (uint64_t *)length) == (_QWORD *)&Errors)
    {
      v7 = _xpc_alloc(length[0]);
      v12 = 1;
      if ((_UNKNOWN *)CESerializeWithOptions((uint64_t)&_CERuntimeImpl, &v12, (unint64_t)v5, count, (unsigned __int8 *)v7, (unsigned __int8 *)v7 + length[0]) == &Errors)v3 = xpc_data_create(v7, length[0]);
      else
        v3 = 0;
      free(v7);
    }
    v8 = xpc_array_get_count(empty);
    if (v8)
    {
      v9 = v8;
      v10 = v5 + 1;
      do
      {
        if (*(v10 - 1) == (void *)3)
          free(*v10);
        v10 += 4;
        --v9;
      }
      while (v9);
    }
    free(v5);
    xpc_release(empty);
    return (size_t)v3;
  }
  __break(1u);
  return result;
}

xpc_object_t xpc_create_lwcr_query_for_validation_category(int *a1, uint64_t a2)
{
  xpc_object_t empty;
  xpc_object_t i;
  int64_t v6;

  empty = xpc_array_create_empty();
  for (i = xpc_dictionary_create_empty(); a2; --a2)
  {
    v6 = *a1++;
    xpc_array_set_int64(empty, 0xFFFFFFFFFFFFFFFFLL, v6);
  }
  xpc_dictionary_set_value(i, "$in", empty);
  xpc_release(empty);
  return i;
}

uint64_t serialize_xpc_dict(void *a1, void *a2)
{
  void *v4;
  uint64_t v5;
  _QWORD applier[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  int v11;
  uint64_t bytes;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2000000000;
  v11 = 4;
  v4 = (void *)_xpc_dict_copy_sorted_keys(a1);
  v14 = 0;
  v15 = 0;
  bytes = 7;
  v13 = 0;
  xpc_array_set_data(a2, 0xFFFFFFFFFFFFFFFFLL, &bytes, 0x20uLL);
  applier[0] = MEMORY[0x1E0C87450];
  applier[1] = 0x40000000;
  applier[2] = __serialize_xpc_dict_block_invoke;
  applier[3] = &unk_1EA959030;
  applier[5] = a2;
  applier[6] = a1;
  applier[4] = &v8;
  xpc_array_apply(v4, applier);
  xpc_release(v4);
  v5 = *((unsigned int *)v9 + 6);
  if (!(_DWORD)v5)
  {
    v14 = 0;
    v15 = 0;
    bytes = 8;
    v13 = 0;
    xpc_array_set_data(a2, 0xFFFFFFFFFFFFFFFFLL, &bytes, 0x20uLL);
    v5 = *((unsigned int *)v9 + 6);
  }
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __serialize_xpc_dict_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  const char *string_ptr;
  void *v7;
  const char *v8;
  xpc_object_t value;
  void *v10;
  uint64_t result;
  _QWORD v12[4];
  uint64_t v13;
  uint64_t v14;
  uint64_t bytes;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C874D8];
  v5 = *(void **)(a1 + 40);
  v17 = 0;
  v18 = 0;
  bytes = 5;
  v16 = 0;
  xpc_array_set_data(v5, 0xFFFFFFFFFFFFFFFFLL, &bytes, 0x20uLL);
  string_ptr = xpc_string_get_string_ptr(a3);
  v12[3] = 0;
  v12[0] = 3;
  v12[1] = _xpc_strdup(string_ptr);
  v12[2] = xpc_string_get_length(a3);
  xpc_array_set_data(*(xpc_object_t *)(a1 + 40), 0xFFFFFFFFFFFFFFFFLL, v12, 0x20uLL);
  v7 = *(void **)(a1 + 48);
  v8 = xpc_string_get_string_ptr(a3);
  value = xpc_dictionary_get_value(v7, v8);
  if (value)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = serialize_xpc_object(value, *(void **)(a1 + 40));
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    {
      bytes = 0;
      v16 = 0;
      v13 = 0;
      v14 = 0;
      if ((_dyld_get_image_uuid() & 1) == 0)
      {
        bytes = 0;
        v16 = 0;
      }
      if ((_dyld_get_shared_cache_uuid() & 1) != 0)
      {
        _dyld_get_shared_cache_range();
      }
      else
      {
        v13 = 0;
        v14 = 0;
      }
      xpc_string_get_string_ptr(a3);
      _os_log_simple();
      return 0;
    }
    else
    {
      v10 = *(void **)(a1 + 40);
      v17 = 0;
      v18 = 0;
      bytes = 6;
      v16 = 0;
      xpc_array_set_data(v10, 0xFFFFFFFFFFFFFFFFLL, &bytes, 0x20uLL);
      return 1;
    }
  }
  else
  {
    bytes = 0;
    v16 = 0;
    v13 = 0;
    v14 = 0;
    if ((_dyld_get_image_uuid() & 1) == 0)
    {
      bytes = 0;
      v16 = 0;
    }
    if ((_dyld_get_shared_cache_uuid() & 1) != 0)
    {
      _dyld_get_shared_cache_range();
    }
    else
    {
      v13 = 0;
      v14 = 0;
    }
    xpc_string_get_string_ptr(a3);
    _os_log_simple();
    result = 0;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 2;
  }
  return result;
}

uint64_t serialize_xpc_object(void *a1, void *a2)
{
  __objc2_class *type;
  const _xpc_type_s *v5;
  size_t length;
  uint64_t v7;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  int v12;
  uint64_t bytes;
  int64_t string_ptr;
  BOOL (*v15)(uint64_t, uint64_t, uint64_t);
  void *v16;
  uint64_t *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C874D8];
  type = (__objc2_class *)xpc_get_type(a1);
  if (type == OS_xpc_string)
  {
    v16 = 0;
    bytes = 2;
    string_ptr = (int64_t)xpc_string_get_string_ptr(a1);
    length = xpc_string_get_length(a1);
LABEL_12:
    v15 = (BOOL (*)(uint64_t, uint64_t, uint64_t))length;
LABEL_16:
    LOBYTE(v16) = 0;
    xpc_array_set_data(a2, 0xFFFFFFFFFFFFFFFFLL, &bytes, 0x20uLL);
    return 0;
  }
  v5 = (const _xpc_type_s *)type;
  if (type == OS_xpc_int64)
  {
    bytes = 4;
    v16 = 0;
    string_ptr = xpc_int64_get_value(a1);
LABEL_15:
    v15 = 0;
    goto LABEL_16;
  }
  if (type == OS_xpc_BOOL)
  {
    bytes = 1;
    v16 = 0;
    string_ptr = xpc_BOOL_get_value(a1);
    goto LABEL_15;
  }
  if (type == OS_xpc_data)
  {
    v16 = 0;
    bytes = 9;
    string_ptr = (int64_t)xpc_data_get_bytes_ptr(a1);
    length = xpc_data_get_length(a1);
    goto LABEL_12;
  }
  if (type != OS_xpc_dictionary)
  {
    if (type == OS_xpc_array)
    {
      v9 = 0;
      v10 = &v9;
      v11 = 0x2000000000;
      v12 = 4;
      v15 = 0;
      v16 = 0;
      bytes = 5;
      string_ptr = 0;
      xpc_array_set_data(a2, 0xFFFFFFFFFFFFFFFFLL, &bytes, 0x20uLL);
      bytes = MEMORY[0x1E0C87450];
      string_ptr = 0x40000000;
      v15 = __serialize_xpc_array_block_invoke;
      v16 = &unk_1EA959058;
      v17 = &v9;
      v18 = a2;
      xpc_array_apply(a1, &bytes);
      v7 = *((unsigned int *)v10 + 6);
      if (!(_DWORD)v7)
      {
        v21 = 0;
        v22 = 0;
        v19 = 6;
        v20 = 0;
        xpc_array_set_data(a2, 0xFFFFFFFFFFFFFFFFLL, &v19, 0x20uLL);
        v7 = *((unsigned int *)v10 + 6);
      }
      _Block_object_dispose(&v9, 8);
    }
    else
    {
      bytes = 0;
      string_ptr = 0;
      v19 = 0;
      v20 = 0;
      if ((_dyld_get_image_uuid() & 1) == 0)
      {
        bytes = 0;
        string_ptr = 0;
      }
      if ((_dyld_get_shared_cache_uuid() & 1) != 0)
      {
        v9 = 0;
        _dyld_get_shared_cache_range();
      }
      else
      {
        v19 = 0;
        v20 = 0;
      }
      xpc_type_get_name(v5);
      _os_log_simple();
      return 1;
    }
    return v7;
  }
  return serialize_xpc_dict(a1, a2);
}

BOOL __serialize_xpc_array_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = serialize_xpc_object(a3, *(_QWORD *)(a1 + 40));
  return *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == 0;
}

uint64_t __convert_xpc_array_to_ce_elem_array_block_invoke(uint64_t a1, uint64_t a2, xpc_object_t xdata)
{
  _OWORD *v3;
  _OWORD *bytes_ptr;
  __int128 v5;

  v3 = (_OWORD *)(*(_QWORD *)(a1 + 32) + 32 * a2);
  bytes_ptr = xpc_data_get_bytes_ptr(xdata);
  v5 = bytes_ptr[1];
  *v3 = *bytes_ptr;
  v3[1] = v5;
  return 1;
}

char *os_transaction_copy_description(uint64_t a1)
{
  char v1;
  const char *v2;

  v1 = *(_BYTE *)(a1 + 48);
  v2 = (const char *)(a1 + 56);
  if ((v1 & 2) != 0)
    v2 = *(const char **)v2;
  return strdup(v2);
}

uint64_t os_transaction_get_description(uint64_t a1)
{
  char v1;
  uint64_t result;

  v1 = *(_BYTE *)(a1 + 48);
  result = a1 + 56;
  if ((v1 & 2) != 0)
    return *(_QWORD *)result;
  return result;
}

uint64_t os_transaction_get_timestamp(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

uint64_t os_transaction_get_ra(uint64_t a1)
{
  return *(_QWORD *)(a1 + 40);
}

void _xpc_os_transaction_dispose(uint64_t a1)
{
  os_unfair_lock_s *v2;
  uint64_t v3;
  char *v4;

  if ((*(_BYTE *)(a1 + 48) & 1) == 0)
  {
    v4 = _xpc_asprintf("Over-release of a transaction object.");
    _xpc_api_misuse(v4);
  }
  *(_BYTE *)(a1 + 48) &= ~1u;
  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 16) == -1)
    v2 = *(os_unfair_lock_s **)(MEMORY[0x1E0C87FA0] + 24);
  else
    v2 = (os_unfair_lock_s *)_os_alloc_once();
  os_unfair_lock_lock_with_options();
  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
    *(_QWORD *)(v3 + 24) = *(_QWORD *)(a1 + 24);
  **(_QWORD **)(a1 + 24) = v3;
  *(_QWORD *)(a1 + 16) = -1;
  *(_QWORD *)(a1 + 24) = -1;
  _xpc_transaction_end_impl((uint64_t)v2);
  os_unfair_lock_unlock(v2 + 44);
}

uint64_t _xpc_transaction_end_impl(uint64_t a1)
{
  int v1;
  uint64_t result;
  pid_t v4;
  char *v5;

  v1 = *(_DWORD *)(a1 + 172);
  *(_DWORD *)(a1 + 172) = v1 - 1;
  if (v1 <= 0)
  {
    v5 = _xpc_asprintf("Underflow of transaction count.");
    _xpc_api_misuse(v5);
  }
  _xpc_ktrace_pid1();
  result = *(unsigned int *)(a1 + 172);
  if (v1 == 1 && *(_BYTE *)(a1 + 168))
  {
    v4 = getpid();
    proc_set_dirty(v4, 0);
    result = _xpc_ktrace_pid0();
    if (*(_BYTE *)(a1 + 170))
      _exit(0);
  }
  return result;
}

uint64_t os_transaction_create(const char *a1)
{
  uint64_t v1;
  size_t v3;
  char is_memory_immutable;
  size_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;

  v3 = strlen(a1);
  is_memory_immutable = _dyld_is_memory_immutable();
  if (v3 + 1 < 0x1C8)
    v5 = v3 + 1;
  else
    v5 = 456;
  v6 = _xpc_os_transaction_alloc();
  v7 = v6;
  if ((is_memory_immutable & 1) != 0 || !v5)
  {
    v8 = *(_BYTE *)(v6 + 48) | 2;
    *(_QWORD *)(v6 + 56) = a1;
  }
  else
  {
    strlcpy((char *)(v6 + 56), a1, v5);
    v8 = *(_BYTE *)(v7 + 48);
  }
  *(_BYTE *)(v7 + 48) = v8 | 1;
  *(_QWORD *)(v7 + 40) = v1;
  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 16) == -1)
    v9 = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 24);
  else
    v9 = _os_alloc_once();
  os_unfair_lock_lock_with_options();
  v10 = *(_QWORD *)(v9 + 184);
  *(_QWORD *)(v7 + 16) = v10;
  if (v10)
    *(_QWORD *)(v10 + 24) = v7 + 16;
  *(_QWORD *)(v9 + 184) = v7;
  *(_QWORD *)(v7 + 24) = v9 + 184;
  _xpc_transaction_begin_impl(v9);
  os_unfair_lock_unlock((os_unfair_lock_t)(v9 + 176));
  *(_QWORD *)(v7 + 32) = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW_APPROX);
  return v7;
}

void _xpc_transaction_begin_impl(uint64_t a1)
{
  int v1;
  pid_t v3;
  char *v4;

  v1 = *(_DWORD *)(a1 + 172);
  *(_DWORD *)(a1 + 172) = v1 + 1;
  if (v1 == -1)
  {
    v4 = _xpc_asprintf("Underflow of transaction count.");
    _xpc_api_misuse(v4);
  }
  _xpc_ktrace_pid1();
  if (_sigterm_deferred_initialization == 1 && _xpc_is_multithreaded())
  {
    _sigterm_deferred_initialization = 0;
    _sigterm_queue = (uint64_t)dispatch_queue_create("com.apple.xpc.transaction.sigterm", 0);
    _sigterm_source = (uint64_t)dispatch_source_create(MEMORY[0x1E0C86F20], 0xFuLL, 0, (dispatch_queue_t)_sigterm_queue);
    dispatch_source_set_event_handler_f((dispatch_source_t)_sigterm_source, (dispatch_function_t)_xpc_transaction_sigterm_handler);
    dispatch_resume((dispatch_object_t)_sigterm_source);
  }
  if (v1 <= 0)
  {
    if (*(_BYTE *)(a1 + 168))
    {
      v3 = getpid();
      proc_set_dirty(v3, 1);
      _xpc_ktrace_pid0();
    }
  }
}

void _xpc_transaction_begin()
{
  os_unfair_lock_s *v0;

  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 16) == -1)
    v0 = *(os_unfair_lock_s **)(MEMORY[0x1E0C87FA0] + 24);
  else
    v0 = (os_unfair_lock_s *)_os_alloc_once();
  os_unfair_lock_lock_with_options();
  _xpc_transaction_begin_impl((uint64_t)v0);
  os_unfair_lock_unlock(v0 + 44);
}

void _xpc_transaction_end()
{
  os_unfair_lock_s *v0;

  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 16) == -1)
    v0 = *(os_unfair_lock_s **)(MEMORY[0x1E0C87FA0] + 24);
  else
    v0 = (os_unfair_lock_s *)_os_alloc_once();
  os_unfair_lock_lock_with_options();
  _xpc_transaction_end_impl((uint64_t)v0);
  os_unfair_lock_unlock(v0 + 44);
}

void xpc_track_activity()
{
  uint64_t v0;
  uint32_t v1;
  pid_t v2;

  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 16) == -1)
    v0 = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 24);
  else
    v0 = _os_alloc_once();
  os_unfair_lock_lock_with_options();
  if (*(_BYTE *)(v0 + 169))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v0 + 176));
  }
  else
  {
    *(_BYTE *)(v0 + 169) = 1;
    os_unfair_lock_unlock((os_unfair_lock_t)(v0 + 176));
    if (*(_BYTE *)(v0 + 192))
      v1 = 19;
    else
      v1 = 7;
    v2 = getpid();
    if ((proc_track_dirty(v2, v1) | 0x10) != 0x10)
      _xpc_alloc_cold_1();
    xpc_transactions_enable();
    if (signal(15, (void (__cdecl *)(int))1) == (void (__cdecl *)(int))-1)
      _xpc_fd_desc_cold_1();
  }
}

void xpc_transactions_enable()
{
  uint64_t v0;
  pid_t v1;
  pid_t v2;

  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 16) == -1)
    v0 = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 24);
  else
    v0 = _os_alloc_once();
  os_unfair_lock_lock_with_options();
  if (!*(_BYTE *)(v0 + 168))
  {
    if (!*(_BYTE *)(v0 + 169))
    {
      v1 = getpid();
      proc_track_dirty(v1, 1u);
    }
    *(_BYTE *)(v0 + 168) = 1;
    if (*(_DWORD *)(v0 + 172))
    {
      v2 = getpid();
      proc_set_dirty(v2, 1);
    }
    _sigterm_deferred_initialization = 1;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v0 + 176));
}

uint64_t xpc_transaction_try_exit_clean()
{
  os_unfair_lock_s *v0;

  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 16) == -1)
    v0 = *(os_unfair_lock_s **)(MEMORY[0x1E0C87FA0] + 24);
  else
    v0 = (os_unfair_lock_s *)_os_alloc_once();
  os_unfair_lock_lock_with_options();
  if (!v0[43]._os_unfair_lock_opaque)
    _exit(0);
  os_unfair_lock_unlock(v0 + 44);
  _os_transaction_log_active("while trying to exit cleanly");
  return 0;
}

void _os_transaction_log_active(_QWORD *a1)
{
  NSObject *v2;
  __uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  int v8;
  const char *v9;
  _QWORD *v10;
  __uint64_t v11;
  uint8_t buf[4];
  _QWORD *v13;
  __int16 v14;
  _BYTE v15[10];
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C874D8];
  if (_xpc_transaction_log_pred != -1)
    dispatch_once(&_xpc_transaction_log_pred, &__block_literal_global_6);
  v2 = _xpc_transaction_log__log;
  v3 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW_APPROX);
  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 16) == -1)
    v4 = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 24);
  else
    v4 = _os_alloc_once();
  os_unfair_lock_lock_with_options();
  v5 = *(_QWORD *)(v4 + 184);
  if (v5)
  {
    v6 = 0;
    v7 = *(_QWORD *)(v4 + 184);
    do
    {
      ++v6;
      v7 = *(_QWORD *)(v7 + 16);
    }
    while (v7);
  }
  else
  {
    v6 = 0;
  }
  v8 = *(_DWORD *)(v4 + 172);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    v9 = ", list follows";
    v13 = a1;
    v14 = 1024;
    if (!v6)
      v9 = (const char *)&unk_1DEEBE00B;
    *(_DWORD *)v15 = v8;
    *(_WORD *)&v15[4] = 1024;
    *(_DWORD *)&v15[6] = v6;
    v16 = 1024;
    v17 = v8 - v6;
    v18 = 2080;
    v19 = v9;
    _os_log_impl(&dword_1DEE85000, v2, OS_LOG_TYPE_DEFAULT, "Remaining transactions %s: %d (%d os_transaction + %d xpc_transaction_begin)%s", buf, 0x28u);
    v5 = *(_QWORD *)(v4 + 184);
  }
  for (; v5; v5 = *(_QWORD *)(v5 + 16))
  {
    v10 = (_QWORD *)(v5 + 56);
    if ((*(_BYTE *)(v5 + 48) & 2) != 0)
      v10 = (_QWORD *)*v10;
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v3 - *(_QWORD *)(v5 + 32);
      *(_DWORD *)buf = 136446466;
      v13 = v10;
      v14 = 2048;
      *(_QWORD *)v15 = v11 / 0x3B9ACA00;
      _os_log_impl(&dword_1DEE85000, v2, OS_LOG_TYPE_DEFAULT, "os_transaction: '%{public}s', created %llu sec ago", buf, 0x16u);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 176));
}

void xpc_transaction_exit_clean()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  xpc_object_t request;
  int v3;
  xpc_object_t object;

  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 16) == -1)
    v0 = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 24);
  else
    v0 = _os_alloc_once();
  v1 = (os_unfair_lock_s *)(v0 + 176);
  os_unfair_lock_lock_with_options();
  *(_BYTE *)(v0 + 170) = 1;
  if (!*(_DWORD *)(v0 + 172))
    _exit(0);
  if ((*(_BYTE *)(v0 + 9) & 4) != 0)
  {
    request = _service_create_request();
    xpc_dictionary_set_BOOL(request, "yesno", 1);
    object = 0;
    v3 = _xpc_service_routine(715, request, &object);
    if (v3 != 124)
    {
      if (v3)
        _os_assumes_log();
      else
        xpc_release(object);
    }
    xpc_release(request);
  }
  os_unfair_lock_unlock(v1);
}

xpc_object_t _service_create_request()
{
  xpc_object_t v0;

  v0 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v0, "type", 6uLL);
  xpc_dictionary_set_uint64(v0, "handle", 0);
  xpc_dictionary_set_BOOL(v0, "self", 1);
  return v0;
}

void xpc_transaction_interrupt_clean_exit()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  xpc_object_t request;
  int v3;
  xpc_object_t object;

  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 16) == -1)
    v0 = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 24);
  else
    v0 = _os_alloc_once();
  v1 = (os_unfair_lock_s *)(v0 + 176);
  os_unfair_lock_lock_with_options();
  *(_BYTE *)(v0 + 170) = 0;
  if ((*(_BYTE *)(v0 + 9) & 4) != 0)
  {
    request = _service_create_request();
    xpc_dictionary_set_BOOL(request, "yesno", 0);
    object = 0;
    v3 = _xpc_service_routine(715, request, &object);
    if (v3 != 124 && v3 != 37)
    {
      if (v3)
        _os_assumes_log();
      else
        xpc_release(object);
    }
    xpc_release(request);
  }
  os_unfair_lock_unlock(v1);
}

uint64_t os_transaction_needs_more_time()
{
  return 0;
}

void _xpc_transaction_sigterm_handler()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  NSObject *v2;
  __uint64_t v3;
  dispatch_time_t v4;
  _QWORD v5[6];

  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 16) == -1)
    v0 = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 24);
  else
    v0 = _os_alloc_once();
  v1 = (os_unfair_lock_s *)(v0 + 176);
  os_unfair_lock_lock_with_options();
  dispatch_source_cancel((dispatch_source_t)_sigterm_source);
  dispatch_release((dispatch_object_t)_sigterm_source);
  v2 = dispatch_source_create(MEMORY[0x1E0C86F28], 0, 0, (dispatch_queue_t)_sigterm_queue);
  dispatch_release((dispatch_object_t)_sigterm_queue);
  os_unfair_lock_unlock(v1);
  v3 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW_APPROX) + 30000000000;
  v4 = dispatch_time(0, 500000000);
  dispatch_source_set_timer(v2, v4, 0x1DCD6500uLL, 0xEE6B280uLL);
  v5[0] = MEMORY[0x1E0C87450];
  v5[1] = 0x40000000;
  v5[2] = ___xpc_transaction_sigterm_handler_block_invoke;
  v5[3] = &__block_descriptor_tmp_9;
  v5[4] = v3;
  v5[5] = v2;
  dispatch_source_set_event_handler(v2, v5);
  dispatch_resume(v2);
}

void ___xpc_transaction_sigterm_handler_block_invoke(uint64_t a1)
{
  _os_transaction_log_active("after SIGTERM");
  if (clock_gettime_nsec_np(_CLOCK_UPTIME_RAW_APPROX) >= *(_QWORD *)(a1 + 32))
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
    dispatch_release(*(dispatch_object_t *)(a1 + 40));
  }
}

os_log_t ___xpc_transaction_log_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.xpc.transaction", "all");
  _xpc_transaction_log__log = (uint64_t)result;
  return result;
}

uint64_t _xpc_bundle_resolve_path_variant(const char *a1)
{
  uint64_t v2;
  int v3;
  int v4;
  uint64_t v5;
  _QWORD v7[2];
  BOOL (*v8)(uint64_t, const char *);
  void *v9;
  int v10;

  if (access(a1, 5))
    return 3;
  v3 = open(a1, 0);
  if (v3 == -1)
  {
    v2 = 3;
    goto LABEL_13;
  }
  v4 = v3;
  if (v3 < 0)
    return 3;
  v5 = 0;
  v7[0] = MEMORY[0x1E0C87450];
  v7[1] = 0x40000000;
  v8 = ___xpc_bundle_resolve_path_variant_block_invoke;
  v9 = &__block_descriptor_tmp_10;
  v10 = v3;
  while (!((unsigned int (*)(_QWORD *, char *))v8)(v7, (&off_1EA959158)[v5]))
  {
    v5 += 2;
    if (v5 == 6)
    {
      v2 = 3;
      goto LABEL_10;
    }
  }
  v2 = LODWORD((&off_1EA959158)[v5 + 1]);
LABEL_10:
  if (close(v4) == -1)
  {
LABEL_13:
    __error();
    _os_assumes_log();
  }
  return v2;
}

BOOL ___xpc_bundle_resolve_path_variant_block_invoke(uint64_t a1, const char *a2)
{
  int v2;
  int v3;
  stat v6;

  memset(&v6, 0, sizeof(v6));
  v2 = fstatat(*(_DWORD *)(a1 + 32), a2, &v6, 0);
  if (v2)
  {
    v3 = *__error();
    if (v2 == -1 && v3 != 2)
      _xpc_fd_desc_cold_1();
  }
  return v2 == 0;
}

uint64_t _xpc_bundle_resolve_executable_variant(const char *a1)
{
  char *v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;

  v1 = _xpc_strdup(a1);
  v2 = strrchr(v1, 47);
  if (v2)
    *v2 = 0;
  v3 = 0;
  while (!_xpc_has_suffix(v1, (&off_1EA959118)[v3]))
  {
    v3 += 2;
    if (v3 == 8)
      goto LABEL_8;
  }
  v4 = LODWORD((&off_1EA959118)[v3 + 1]);
  if ((_DWORD)v4 != 2)
    goto LABEL_13;
LABEL_8:
  v5 = strrchr(v1, 47);
  if (v5)
    *v5 = 0;
  if (_xpc_has_suffix(v1, "Versions"))
    v4 = 1;
  else
    v4 = 2;
LABEL_13:
  free(v1);
  return v4;
}

char *_xpc_bundle_copy_container(unsigned int a1, const char *a2)
{
  char *v3;
  unint64_t i;
  unint64_t v5;
  char *v6;

  if (a1 == 3)
    _xpc_rich_error_serialize_cold_1();
  v3 = _xpc_strdup(a2);
  for (i = 0; ; ++i)
  {
    v5 = a1 > 2 ? 0 : qword_1DEEBD270[a1];
    if (i >= v5)
      break;
    v6 = strrchr(v3, 47);
    if (v6)
      *v6 = 0;
  }
  return v3;
}

char *_xpc_bundle_variant_create_subpath(_BYTE *a1, unsigned int a2, int a3, uint64_t a4)
{
  char **v4;
  char *v5;

  if (a2 == 3)
    _xpc_rich_error_serialize_cold_1();
  switch(a3)
  {
    case 0:
      v4 = &off_1EA959188[8 * (unint64_t)a2];
      goto LABEL_13;
    case 1:
      v4 = &off_1EA959188[8 * (unint64_t)a2 + 1];
      goto LABEL_13;
    case 2:
      v4 = &off_1EA959188[8 * (unint64_t)a2 + 2];
      goto LABEL_13;
    case 3:
      v4 = &off_1EA959188[8 * (unint64_t)a2 + 3];
      goto LABEL_13;
    case 4:
      v4 = &off_1EA959188[8 * (unint64_t)a2 + 4];
      goto LABEL_13;
    case 5:
      v4 = &off_1EA959188[8 * (unint64_t)a2 + 7];
      goto LABEL_13;
    case 6:
      v4 = &off_1EA959188[8 * (unint64_t)a2 + 5];
      goto LABEL_13;
    case 7:
      v4 = &off_1EA959188[8 * (unint64_t)a2 + 6];
LABEL_13:
      v5 = *v4;
      if (a1)
        goto LABEL_14;
      goto LABEL_17;
    default:
      v5 = 0;
      if (!a1)
        goto LABEL_17;
LABEL_14:
      if (*a1)
      {
        if (!v5)
        {
LABEL_21:
          if (a4)
            return _xpc_asprintf("%s%s%s%s%s");
          return _xpc_asprintf("%s%s%s");
        }
      }
      else
      {
LABEL_17:
        if (!v5)
          goto LABEL_21;
      }
      if (!*v5)
        goto LABEL_21;
      if (!a4)
        return _xpc_asprintf("%s%s%s");
      return _xpc_asprintf("%s%s%s%s%s");
  }
}

char *_xpc_bundle_resolve_executable_name(const char *a1, xpc_object_t xdict)
{
  const char *string;
  char *v6;
  char *v7;
  char *v8;
  _BYTE *v9;
  int v10;
  char *v11;
  char *v12;

  string = xpc_dictionary_get_string(xdict, "CFBundleExecutable");
  if (string)
    return _xpc_strdup(string);
  string = xpc_dictionary_get_string(xdict, "NSExecutable");
  if (string)
    return _xpc_strdup(string);
  v6 = _xpc_strdup(a1);
  v7 = strrchr(v6, 47);
  if (v7 == v6)
  {
    free(v6);
    v8 = _xpc_strdup(a1 + 1);
  }
  else
  {
    if (v7[1])
    {
      v8 = _xpc_strdup(v7 + 1);
    }
    else
    {
      v9 = v7 + 2;
      do
      {
        v10 = *(v9 - 2);
        --v9;
      }
      while (v10 == 47);
      *v9 = 0;
      v11 = strrchr(v6, 47);
      v8 = strdup(v11 + 1);
      *v9 = 47;
    }
    free(v6);
  }
  if (v8)
  {
    v12 = strrchr(v8, 46);
    if (v12)
      *v12 = 0;
  }
  return v8;
}

BOOL _xpc_bundle_is_valid_variant(unsigned int a1)
{
  return a1 < 3;
}

uint64_t _xpc_is_being_debugged()
{
  if (_xpc_is_being_debugged_pred != -1)
    dispatch_once(&_xpc_is_being_debugged_pred, &__block_literal_global_7);
  return _xpc_is_being_debugged_is_being_debugged;
}

uint64_t ___xpc_is_being_debugged_block_invoke()
{
  pid_t v0;
  uint64_t result;

  v0 = getpid();
  result = _xpc_pid_is_being_debugged(v0);
  _xpc_is_being_debugged_is_being_debugged = result;
  return result;
}

uint64_t _xpc_pid_is_being_debugged(int a1)
{
  _OWORD v2[2];
  __int128 v3;
  __int128 v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C874D8];
  v3 = 0u;
  v4 = 0u;
  memset(v2, 0, sizeof(v2));
  if (!_xpc_proc_bsdinfo(a1, v2))
    return (v3 >> 1) & 1;
  _os_assumes_log();
  return 0;
}

const char *_xpc_get_embedded_crash_message(void)
{
  return (const char *)qword_1F0460B90;
}

void _xpc_api_misuse(const char *a1)
{
  char __str[16];
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v5 = 0u;
  v6 = 0u;
  v3 = 0u;
  v4 = 0u;
  *(_OWORD *)__str = 0u;
  v2 = 0u;
  snprintf(__str, 0xA0uLL, "XPC API Misuse: %s", a1);
  qword_1F0460B90 = (uint64_t)__str;
  __break(1u);
}

_QWORD *string_builder_new(size_t a1)
{
  _QWORD *v2;
  _BYTE *v3;

  if (!a1)
    _xpc_mach_message_request_handoff_reply_cold_1();
  v2 = _xpc_alloc(0x18uLL);
  v3 = _xpc_alloc(a1);
  *v3 = 0;
  *v2 = v3;
  v2[1] = a1;
  v2[2] = 0;
  return v2;
}

char *string_builder_copy_string(const char **a1)
{
  return _xpc_strdup(*a1);
}

void string_builder_destroy(void **a1)
{
  free(*a1);
  free(a1);
}

void string_builder_appendf(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int v10;
  uint64_t v11;
  BOOL v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  size_t v18;
  size_t v19;
  char *__source[2];

  __source[0] = 0;
  __source[1] = &a9;
  v10 = vasprintf(__source, a2, &a9);
  if (v10 == -1)
  {
    _xpc_fd_desc_cold_1();
    return;
  }
  v11 = *(_QWORD *)(a1 + 16);
  v12 = __CFADD__(v11, v10);
  v13 = v11 + v10;
  if (v12)
    v14 = ((uint64_t)v10 >> 63) + 1;
  else
    v14 = (uint64_t)v10 >> 63;
  v15 = v14 << 63 >> 63;
  if (v15 != v14 || v15 < 0)
    goto LABEL_20;
  v16 = *(_QWORD *)(a1 + 8);
  if (v16 <= v13)
  {
    if ((v13 & 0x8000000000000000) == 0)
    {
      v18 = 2 * v13;
      if (2 * v13 < 2 * v16)
        _xpc_mach_message_request_handoff_reply_cold_1();
      v17 = (char *)_xpc_alloc(2 * v13);
      if (strlcpy(v17, *(const char **)a1, v18) >= v18)
        _xpc_mach_message_request_handoff_reply_cold_1();
      free(*(void **)a1);
      *(_QWORD *)a1 = v17;
      *(_QWORD *)(a1 + 8) = v18;
      goto LABEL_13;
    }
LABEL_20:
    __break(1u);
    return;
  }
  v17 = *(char **)a1;
  v18 = *(_QWORD *)(a1 + 8);
LABEL_13:
  v19 = strlcat(v17, __source[0], v18);
  *(_QWORD *)(a1 + 16) = v19;
  if (v19 >= *(_QWORD *)(a1 + 8))
    _xpc_mach_message_request_handoff_reply_cold_1();
  free(__source[0]);
}

uint64_t _xpc_services_unavailable()
{
  uint64_t v0;
  unint64_t v2;

  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 16) == -1)
    v0 = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 24);
  else
    v0 = _os_alloc_once();
  if (*(_BYTE *)v0)
    return 1;
  if (!*(_BYTE *)(v0 + 41))
    return 1;
  v2 = *(_QWORD *)(v0 + 8);
  if ((v2 & 0x80) != 0)
    return 1;
  else
    return (v2 >> 1) & 1;
}

uint64_t _xpc_runtime_get_entitlements_data()
{
  if (_xpc_runtime_get_entitlements_data_pred != -1)
    dispatch_once(&_xpc_runtime_get_entitlements_data_pred, &__block_literal_global_8);
  return _xpc_runtime_get_entitlements_data_entitlements_data;
}

xpc_object_t ___xpc_runtime_get_entitlements_data_block_invoke()
{
  uint64_t v0;
  xpc_object_t result;

  v0 = getpid();
  result = _xpc_copy_entitlements_data(v0, 0, 16);
  _xpc_runtime_get_entitlements_data_entitlements_data = (uint64_t)result;
  return result;
}

uint64_t _xpc_runtime_get_self_entitlements()
{
  if (_xpc_runtime_get_self_entitlements_pred != -1)
    dispatch_once(&_xpc_runtime_get_self_entitlements_pred, &__block_literal_global_2);
  return _xpc_runtime_get_self_entitlements_entitlements;
}

uint64_t ___xpc_runtime_get_self_entitlements_block_invoke()
{
  uint64_t result;
  unsigned __int8 *v1;
  uint64_t v2;

  if (_xpc_runtime_get_entitlements_data_pred != -1)
    dispatch_once(&_xpc_runtime_get_entitlements_data_pred, &__block_literal_global_8);
  if (_xpc_runtime_get_entitlements_data_entitlements_data)
  {
    v1 = 0;
    v2 = 0;
    xpc_data_get_bytes_ptr_and_length((_QWORD *)_xpc_runtime_get_entitlements_data_entitlements_data, &v1, &v2);
    result = xpc_create_from_ce_der(v1, v2);
  }
  else
  {
    result = (uint64_t)xpc_dictionary_create(0, 0, 0);
  }
  _xpc_runtime_get_self_entitlements_entitlements = result;
  return result;
}

uint64_t _xpc_runtime_is_app_sandboxed()
{
  if (_xpc_runtime_is_app_sandboxed_pred != -1)
    dispatch_once(&_xpc_runtime_is_app_sandboxed_pred, &__block_literal_global_4);
  return _xpc_runtime_is_app_sandboxed_containerized;
}

uint64_t ___xpc_runtime_is_app_sandboxed_block_invoke()
{
  uint64_t result;
  _BYTE v1[1024];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C874D8];
  bzero(v1, 0x400uLL);
  getpid();
  result = sandbox_container_path_for_pid();
  if (!(_DWORD)result)
  {
    if (v1[0])
      _xpc_runtime_is_app_sandboxed_containerized = 1;
  }
  return result;
}

void xpc_add_bundle(const char *a1, char a2)
{
  uint64_t v4;
  xpc_object_t v5;
  int v6;

  _xpc_uncork_domain();
  if ((a2 & 2) != 0)
    v4 = 4097;
  else
    v4 = 1;
  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v5, a1, v4);
  v6 = _xpc_bootstrap_services(v5);
  if (v6 != 36 && v6 != 124 && v6)
    _xpc_alloc_cold_1();
  xpc_release(v5);
}

void xpc_add_bundles_for_domain(void *a1, void *a2)
{
  int64_t int64;
  uint64_t v5;
  xpc_object_t v6;
  int v7;
  int v8;
  char *v9;
  char *v10;
  xpc_object_t object;

  _xpc_uncork_domain();
  int64 = xpc_dictionary_get_int64(a1, "pid");
  if (!int64)
  {
    v10 = _xpc_asprintf("Bogus domain object.");
    _xpc_api_misuse(v10);
  }
  v5 = int64;
  v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v6, "type", 5uLL);
  xpc_dictionary_set_uint64(v6, "handle", v5);
  xpc_dictionary_set_value(v6, "paths", a2);
  object = 0;
  v7 = _xpc_domain_routine(800, v6, &object);
  if (v7)
  {
    v8 = v7;
    v9 = xpc_strerror(v7);
    syslog(3, "Failed to extend PID domain: %d: %s", v8, v9);
  }
  else
  {
    xpc_release(object);
  }
  xpc_release(v6);
}

size_t _xpc_spawnattr_pack_string_fragment(uint64_t a1, _DWORD *a2, _QWORD *a3, char *__src)
{
  size_t result;

  strcpy((char *)(a1 + *a2 + 240), __src);
  result = strlen(__src);
  *a2 += result;
  *a3 -= result;
  return result;
}

size_t _xpc_spawnattr_pack_string(uint64_t a1, _DWORD *a2, _QWORD *a3, char *__src)
{
  size_t result;

  strcpy((char *)(a1 + *a2 + 240), __src);
  result = strlen(__src);
  *a2 += result + 1;
  *a3 -= result + 1;
  return result;
}

const char *_xpc_spawnattr_unpack_string(uint64_t a1, unint64_t a2, unsigned int a3)
{
  const char *v3;

  if (a2 <= a3)
    return 0;
  v3 = (const char *)(a1 + a3 + 240);
  if (strnlen(v3, a2 - a3) + 1 <= a2 - a3)
    return v3;
  else
    return 0;
}

void *_xpc_spawnattr_pack_bytes(uint64_t a1, _DWORD *a2, _QWORD *a3, void *__src, size_t __n)
{
  unsigned int v5;
  void *result;

  v5 = __n;
  result = memcpy((void *)(a1 + *a2 + 240), __src, __n);
  *a2 += v5;
  *a3 -= v5;
  return result;
}

uint64_t _xpc_spawnattr_unpack_bytes(uint64_t a1, unint64_t a2, unsigned int a3, unsigned int a4)
{
  uint64_t v4;

  if (a2 - a3 >= a4)
    v4 = a1 + a3 + 240;
  else
    v4 = 0;
  if (a2 <= a3)
    return 0;
  else
    return v4;
}

const char *_xpc_spawnattr_unpack_strings(uint64_t a1, unint64_t a2, unsigned int a3, const char **a4, uint64_t a5)
{
  uint64_t v5;
  unsigned int v7;
  uint64_t v9;
  const char **i;
  const char *v11;
  size_t v12;

  if (a3 >= a2)
    return 0;
  v5 = a5;
  if (!a5)
    return *a4;
  v7 = a3;
  v9 = a1 + 240;
  for (i = a4; ; ++i)
  {
    v11 = (const char *)(v9 + v7);
    v12 = strnlen(v11, a2 - v7);
    if (v12 + 1 > a2 - v7)
      break;
    v7 += v12 + 1;
    *i = v11;
    if (!--v5)
      return *a4;
  }
  return 0;
}

uint64_t _xpc_spawnattr_binprefs_size(uint64_t a1)
{
  return 8 * xpc_binprefs_count(a1);
}

uint64_t _xpc_spawnattr_binprefs_pack(uint64_t a1, uint64_t a2, _DWORD *a3, _QWORD *a4)
{
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _DWORD *v12;
  uint64_t result;

  v8 = xpc_binprefs_count(a2);
  *(_DWORD *)(a1 + 32) = v8;
  v9 = 0;
  if (v8)
  {
    *(_DWORD *)(a1 + 36) = *a3;
    v10 = 8 * (v8 - 1);
    v11 = v8;
    v12 = (_DWORD *)(*a3 + a1 + 244);
    do
    {
      *(v12 - 1) = xpc_binprefs_cpu_type(a2, v9);
      *v12 = xpc_binprefs_cpu_subtype(a2, v9);
      v12 += 2;
      ++v9;
    }
    while (v11 != v9);
    v9 = v10 + 8;
  }
  else
  {
    *(_DWORD *)(a1 + 36) = 0;
  }
  result = xpc_binprefs_count(a2);
  if (v9 != 8 * result)
    _xpc_rich_error_serialize_cold_1();
  *a3 += v9;
  *a4 -= v9;
  return result;
}

uint64_t _xpc_spawnattr_binprefs_unpack(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int *v7;

  v2 = *(unsigned int *)(a1 + 32);
  if (!(_DWORD)v2 || a2 - (unint64_t)*(unsigned int *)(a1 + 36) < 8 * v2)
    return 0;
  xpc_binprefs_alloc();
  v4 = v5;
  if (*(_DWORD *)(a1 + 32))
  {
    v6 = 0;
    v7 = (int *)(*(unsigned int *)(a1 + 36) + a1 + 244);
    do
    {
      xpc_binprefs_add(v4, *(v7 - 1), *v7);
      ++v6;
      v7 += 2;
    }
    while (v6 < *(unsigned int *)(a1 + 32));
  }
  return v4;
}

uint64_t _xpc_pipe_copy()
{
  return 0;
}

uint64_t _xpc_pipe_hash()
{
  return 0;
}

uint64_t _xpc_pipe_desc(const char *a1, uint64_t a2)
{
  unsigned int v3;
  int v4;
  char __str[16];
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C874D8];
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  *(_OWORD *)__str = 0u;
  v7 = 0u;
  v3 = snprintf(__str, 0x80uLL, "<%s: %p> { name = %s }", "pipe", a1, a1 + 49);
  if (v3 >= 0x7F)
    v4 = 127;
  else
    v4 = v3;
  return _xpc_serializer_append(a2, __str, (v4 + 1), 0);
}

uint64_t _xpc_pipe_debug(uint64_t a1, char *__str, size_t __size)
{
  uint64_t result;

  if (__size < 2)
    return 0;
  LODWORD(result) = snprintf(__str, __size, ", name = %s", (const char *)(a1 + 49));
  if ((int)result >= __size)
    return __size - 1;
  else
    return (int)result;
}

uint64_t _xpc_pipe_deserialize()
{
  return 0;
}

uint64_t _xpc_pipe_wire_length()
{
  return -1;
}

uint64_t _xpc_pipe_dispose(mach_port_context_t a1)
{
  uint64_t result;
  mach_port_name_t v3;

  result = *(unsigned int *)(a1 + 32);
  if ((_DWORD)result)
  {
    if (_xpc_mach_port_release(result))
      _os_assumes_log();
    v3 = *(_DWORD *)(a1 + 40);
    if (v3)
    {
      if (*(int *)(a1 + 28) <= 0 && _xpc_mach_port_close_recv(v3, 0, a1))
        _os_assumes_log();
      if (_xpc_mach_port_release(*(_DWORD *)(a1 + 40)))
        _os_assumes_log();
    }
    result = *(unsigned int *)(a1 + 36);
    if ((_DWORD)result)
    {
      result = _xpc_mach_port_close_recv(result, 0, a1);
      if ((_DWORD)result)
        return _os_assumes_log();
    }
  }
  return result;
}

uint64_t _xpc_pipe_handle_mig(mach_msg_header_t *a1, mach_msg_header_t *a2, unsigned int (*a3)(void))
{
  mach_port_t msgh_remote_port;
  uint64_t result;

  if (!a3())
  {
    mach_msg_destroy(a2);
    return 22;
  }
  if ((a2->msgh_bits & 0x80000000) == 0)
  {
    msgh_remote_port = a2[1].msgh_remote_port;
    if (msgh_remote_port == -305)
    {
      a2->msgh_remote_port = 0;
    }
    else if (msgh_remote_port)
    {
      if ((a1->msgh_bits & 0x80000000) != 0)
      {
        a1->msgh_remote_port = 0;
        mach_msg_destroy(a1);
      }
    }
  }
  if (a2->msgh_remote_port)
  {
    result = mach_msg(a2, 1, a2->msgh_size, 0, 0, 0, 0);
    if (!(_DWORD)result)
      return result;
    if ((_DWORD)result != 268435459)
    {
      _os_assumes_log();
      mach_msg_destroy(a2);
      return 5;
    }
    mach_msg_destroy(a2);
  }
  return 0;
}

mach_port_context_t xpc_pipe_create(char *a1, int a2)
{
  int v4;
  mach_port_name_t v5;
  mach_port_name_t v6;
  mach_port_context_t v7;

  if ((a2 & 2) != 0)
    v4 = 2;
  else
    v4 = 1;
  v5 = _xpc_pipe_bootstrap_look_up(a1, v4, 0);
  if (v5 - 1 > 0xFFFFFFFD)
    return 0;
  v6 = v5;
  v7 = _xpc_pipe_create(a1, v5, a2);
  if (_xpc_mach_port_release(v6))
    _os_assumes_log();
  return v7;
}

uint64_t _xpc_pipe_bootstrap_look_up(char *a1, int a2, uint64_t a3)
{
  uint64_t v3;
  BOOL v4;
  int v5;
  uint64_t v6;
  unsigned int v8;

  v8 = 0;
  v3 = 8;
  if (a2 != 2)
    v3 = 0;
  v4 = a2 == 3;
  if (a2 == 3)
    v5 = 2;
  else
    v5 = 7;
  if (v4)
    a3 = a3;
  else
    a3 = 0;
  if (v4)
    v6 = 0;
  else
    v6 = v3;
  if (_xpc_look_up_endpoint(a1, v5, a3, 0, 0, v6, 0, &v8, 0))
    return 0;
  else
    return v8;
}

mach_port_context_t _xpc_pipe_create(char *__s, mach_port_name_t a2, int a3)
{
  size_t v6;
  mach_port_context_t v7;
  char v8;

  if (__s)
    v6 = strlen(__s) + 1;
  else
    v6 = 0;
  v7 = _xpc_base_create();
  if (_xpc_mach_port_retain_send(a2))
  {
    _os_assumes_log();
    xpc_release((xpc_object_t)v7);
    return 0;
  }
  else
  {
    *(_DWORD *)(v7 + 32) = a2;
    if (__s || (a3 & 0x10000) != 0)
    {
      *(_DWORD *)(v7 + 40) = _xpc_mach_port_allocate(0x37u, 6u, v7);
      *(_DWORD *)(v7 + 36) = _xpc_mach_port_allocate(0x23u, 6u, v7);
      *(_DWORD *)(v7 + 44) = *(_DWORD *)(v7 + 40);
      *(_BYTE *)(v7 + 48) |= 1u;
      if (__s)
        strlcpy((char *)(v7 + 49), __s, v6);
    }
    else
    {
      *(_DWORD *)(v7 + 44) = a2;
    }
    if ((a3 & 8) != 0)
      v8 = 6;
    else
      v8 = 4;
    *(_BYTE *)(v7 + 48) |= v8;
    *(_DWORD *)(v7 + 24) = 0;
  }
  return v7;
}

mach_port_context_t xpc_pipe_create_with_user_session_uid(char *a1, unsigned int a2, int a3)
{
  int v6;
  mach_port_context_t v7;
  mach_port_name_t v8;
  char *v10;
  mach_port_name_t v11;

  if ((xpc_user_sessions_enabled() & 1) == 0)
  {
    v10 = _xpc_asprintf("xpc_pipe_create_with_user_session_uid() can only be used if xpc_user_sessions_enabled() returns true.");
    goto LABEL_12;
  }
  if ((a3 & 2) != 0)
  {
    v10 = _xpc_asprintf("xpc_pipe_create_with_user_session_uid() cannot be used with the privileged flag.");
LABEL_12:
    _xpc_api_misuse(v10);
  }
  v11 = 0;
  v6 = _xpc_look_up_endpoint(a1, 2, a2, 0, 0, 0, 0, &v11, 0);
  v7 = 0;
  if (v6)
    v8 = 0;
  else
    v8 = v11;
  if (v8 - 1 <= 0xFFFFFFFD)
  {
    v7 = _xpc_pipe_create(a1, v8, a3);
    if (_xpc_mach_port_release(v8))
      _os_assumes_log();
  }
  return v7;
}

mach_port_context_t xpc_pipe_create_from_port(mach_port_name_t a1, int a2)
{
  return _xpc_pipe_create(0, a1, a2);
}

uint64_t _xpc_pipe_routine(uint64_t a1, int a2, void *a3, _QWORD *a4, char a5)
{
  unsigned int reply_port;
  uint64_t v11;
  unint64_t StatusReg;
  _DWORD *v13;
  _DWORD *v14;
  mach_msg_header_t *mach_message_header;
  mach_msg_header_t *v16;
  mach_port_name_t msgh_local_port;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  mach_msg_option_t v24;
  size_t mach_message_length;
  char v26;
  mach_msg_header_t *v27;
  unsigned int v28;
  mach_msg_header_t *v29;
  char v30;
  size_t v31;
  int v32;
  size_t v33;
  NSObject *v34;
  _DWORD *msg;
  uint64_t audit_token;
  int v37;
  int v38;
  uint64_t v39;
  char *v41;
  _QWORD *v42;
  BOOLean_t v43;
  char v44;
  unsigned int v45;
  _OWORD v46[5];

  _xpc_pipe_check_in_once(a1);
  if (*(_DWORD *)(a1 + 28) != 1)
    return 32;
  if (xpc_get_type(a3) != (xpc_type_t)OS_xpc_dictionary)
  {
    v41 = _xpc_asprintf("Messages must be dictionaries.");
    goto LABEL_54;
  }
  if ((*(_BYTE *)(a1 + 48) & 4) == 0)
  {
    reply_port = mig_get_reply_port();
    goto LABEL_8;
  }
  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  reply_port = *(_DWORD *)(StatusReg + 64);
  if (!reply_port)
  {
    reply_port = thread_get_special_reply_port();
    *(_QWORD *)(StatusReg + 64) = reply_port;
    if (!reply_port)
    {
      v41 = _xpc_asprintf("Unable to allocate reply port, possible port leak");
LABEL_54:
      _xpc_api_misuse(v41);
    }
  }
LABEL_8:
  v13 = _xpc_pipe_pack_message(a1, a2, (uint64_t)a3, reply_port, 21, 1);
  if (!v13)
    return 22;
  v14 = v13;
  v42 = a4;
  mach_message_header = (mach_msg_header_t *)_xpc_serializer_get_mach_message_header();
  v16 = mach_message_header;
  msgh_local_port = mach_message_header->msgh_local_port;
  v18 = *(unsigned __int8 *)(a1 + 48);
  if ((v18 & 2) != 0)
    v19 = 52428807;
  else
    v19 = 50331655;
  v20 = v18 << 29;
  if ((a5 & 1) != 0)
    v21 = 9453568;
  else
    v21 = 1064960;
  v22 = v21 & (v20 >> 31);
  v44 = a5;
  if ((a5 & 2) != 0)
    v23 = 66048;
  else
    v23 = 512;
  v24 = v22 | v23 | v19;
  v43 = voucher_mach_msg_set(mach_message_header);
  mach_message_length = _xpc_serializer_get_mach_message_length();
  v26 = 0;
  LODWORD(v11) = 35;
  memset(v46, 0, 76);
  while (2)
  {
    v45 = v11;
    v27 = 0;
    v28 = v24 & 0xFFFFBFFA;
    v29 = v16;
    v30 = v26;
    v31 = mach_message_length;
    while (1)
    {
      mach_message_length = v31;
      v16 = v29;
      v32 = _xpc_pipe_mach_msg((uint64_t)v14, v29, v24, v31, msgh_local_port);
      if (v27)
        _xpc_serializer_reset_mach_message_header((uint64_t)v14);
      if (v32 != 268451844)
        break;
      if ((v24 & 4) == 0)
      {
        _xpc_serializer_clear_sent_descriptors((uint64_t)v14);
        v11 = 12;
        goto LABEL_34;
      }
      v33 = v16->msgh_size + 52;
      v27 = (mach_msg_header_t *)malloc_type_malloc(v33, 0x5CA6221CuLL);
      v31 = 0;
      v30 = 1;
      v29 = (mach_msg_header_t *)v46;
      v24 = v28;
      if (v27)
      {
        memcpy(v27, v16, mach_message_length);
        v29 = v27;
        v24 = v28;
        v31 = v33;
      }
    }
    v11 = v45;
    switch(v32)
    {
      case 0:
        break;
      case 268435459:
        v11 = 32;
        break;
      case 268435479:
        _xpc_consume_send_once_notification_on_reply_port(v16->msgh_local_port);
        v11 = 1;
        v26 = 1;
        if ((v30 & 1) != 0)
          continue;
        break;
      default:
        v11 = 5;
        break;
    }
    break;
  }
LABEL_34:
  if (v43)
    voucher_mach_msg_clear(v16);
  if (v32)
  {
    if ((v32 & 0xFFFFC1FF) == 0x1000400C)
      mach_msg_destroy(v16);
    _xpc_serializer_destroy(v14);
    if ((_DWORD)v11 == 32)
      *(_DWORD *)(a1 + 28) = 2;
    return v11;
  }
  if (v16->msgh_id != 0x20000000)
  {
    _xpc_serializer_destroy(v14);
    return 5;
  }
  v34 = _xpc_serializer_reap_combined_send_receive((uint64_t)v14);
  _xpc_serializer_destroy(v14);
  if ((v44 & 4) != 0)
  {
    msg = (_DWORD *)dispatch_mach_msg_get_msg();
    if ((xpc_receive_mach_msg_validate_hdr(msg) & 1) != 0)
    {
      audit_token = _xpc_mach_msg_get_audit_token((uint64_t)msg);
      v37 = *(_DWORD *)(audit_token + 20);
      if (v37 != 1)
        _xpc_pipe_routine_cold_2(v37);
      if (*(_DWORD *)(audit_token + 4))
        _xpc_interface_routine_cold_5();
      goto LABEL_46;
    }
    dispatch_release(v34);
    return 22;
  }
LABEL_46:
  *(_QWORD *)&v46[0] = 0;
  v38 = xpc_receive_mach_msg(v34, 0, 0, 0, (uint64_t *)v46);
  v39 = *(_QWORD *)&v46[0];
  dispatch_release(v34);
  v11 = 5;
  if (!v38 && v39)
  {
    v11 = 0;
    *v42 = v39;
  }
  return v11;
}

uint64_t xpc_pipe_routine(uint64_t a1, void *a2, _QWORD *a3)
{
  return _xpc_pipe_routine(a1, 0, a2, a3, 0);
}

uint64_t xpc_pipe_routine_with_flags(uint64_t a1, void *a2, _QWORD *a3, char a4)
{
  return _xpc_pipe_routine(a1, 0, a2, a3, a4);
}

uint64_t xpc_pipe_routine_async(uint64_t a1, void *a2, int a3)
{
  return _xpc_pipe_simpleroutine(a1, 0, a2, a3, 0);
}

uint64_t _xpc_pipe_simpleroutine(uint64_t a1, int a2, void *a3, int a4, char a5)
{
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  char *v15;

  _xpc_pipe_check_in_once(a1);
  if (*(_DWORD *)(a1 + 28) != 1)
    return 32;
  if (xpc_get_type(a3) != (xpc_type_t)OS_xpc_dictionary)
  {
    v15 = _xpc_asprintf("Messages must be dictionaries.");
    _xpc_api_misuse(v15);
  }
  if (a4)
    v10 = 21;
  else
    v10 = 0;
  v11 = _xpc_pipe_pack_message(a1, a2, (uint64_t)a3, a4, v10, 0);
  if (!v11)
    return 22;
  v12 = v11;
  v13 = _xpc_send_serializer((uint64_t)v11, 1, a5);
  xpc_release(v12);
  if ((_DWORD)v13 == 32)
    *(_DWORD *)(a1 + 28) = 2;
  return v13;
}

uint64_t xpc_pipe_routine_reply(void *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  char *v6;

  if (xpc_get_type(a1) != (xpc_type_t)OS_xpc_dictionary)
  {
    v6 = _xpc_asprintf("Messages must be dictionaries.");
    _xpc_api_misuse(v6);
  }
  v2 = _xpc_pipe_pack_message(0, 0, (uint64_t)a1, 0, 0, 0);
  if (!v2)
    return 22;
  v3 = v2;
  v4 = _xpc_send_serializer((uint64_t)v2, 0, 0);
  xpc_release(v3);
  return v4;
}

void *_xpc_pipe_pack_message(uint64_t a1, int a2, uint64_t a3, int a4, int a5, char a6)
{
  void *v12;
  int v13;
  int v14;
  int reply_port;
  int v16;
  int v17;
  int v18;
  _DWORD *v19;

  v12 = (void *)_xpc_serializer_create();
  if (a4)
    v13 = a5 << 8;
  else
    v13 = 0;
  if ((a2 & 0xFF000000) != 0)
    _xpc_pipe_pack_message_cold_1();
  if ((a6 & 1) != 0)
    v14 = 0x40000000;
  else
    v14 = 0x10000000;
  reply_port = _xpc_dictionary_extract_reply_port(a3);
  if (reply_port)
  {
    v16 = reply_port;
    v17 = 0x20000000;
    v18 = 18;
  }
  else
  {
    v17 = v14 | a2;
    if (a1)
      v16 = *(_DWORD *)(a1 + 44);
    else
      v16 = 0;
    v18 = 19;
  }
  v19 = (_DWORD *)_xpc_serializer_pack((uint64_t)v12, a3, 0, 0);
  if (v19)
  {
    v19[5] = v17;
    *v19 |= v18 | v13;
    v19[2] = v16;
    v19[3] = a4;
  }
  else
  {
    xpc_release(v12);
    return 0;
  }
  return v12;
}

uint64_t _xpc_send_serializer(uint64_t a1, _BOOL4 a2, char a3)
{
  mach_msg_header_t *mach_message_header;
  mach_msg_size_t mach_message_length;
  mach_msg_option_t v8;
  uint64_t v9;

  mach_message_header = (mach_msg_header_t *)_xpc_serializer_get_mach_message_header();
  mach_message_length = _xpc_serializer_get_mach_message_length();
  if (a2)
    a2 = voucher_mach_msg_set(mach_message_header) != 0;
  if ((a3 & 2) != 0)
    v8 = 65537;
  else
    v8 = 1;
  v9 = _xpc_pipe_mach_msg(a1, mach_message_header, v8, mach_message_length, 0);
  if (a2)
    voucher_mach_msg_clear(mach_message_header);
  if ((_DWORD)v9)
  {
    if ((_DWORD)v9 == 268435479)
    {
      _xpc_consume_send_once_notification_on_reply_port(mach_message_header->msgh_local_port);
      return 1;
    }
    else if ((_DWORD)v9 == 268435459)
    {
      return 32;
    }
    else
    {
      return 5;
    }
  }
  return v9;
}

uint64_t xpc_pipe_create_reply_from_port(int a1)
{
  if ((a1 - 1) > 0xFFFFFFFD)
    return 0;
  else
    return _xpc_dictionary_create_reply_with_port(a1);
}

uint64_t xpc_pipe_routine_forward(uint64_t a1, void *a2)
{
  int reply_port;
  void *v5;
  void *v6;
  uint64_t v7;
  char *v9;

  _xpc_pipe_check_in_once(a1);
  if (*(_DWORD *)(a1 + 28) != 1)
    return 32;
  if (xpc_get_type(a2) != (xpc_type_t)OS_xpc_dictionary)
  {
    v9 = _xpc_asprintf("Messages must be dictionaries.");
    _xpc_api_misuse(v9);
  }
  reply_port = _xpc_dictionary_extract_reply_port((uint64_t)a2);
  v5 = _xpc_pipe_pack_message(a1, 0, (uint64_t)a2, reply_port, 18, 0);
  if (!v5)
    return 22;
  v6 = v5;
  v7 = _xpc_send_serializer((uint64_t)v5, 1, 0);
  xpc_release(v6);
  if ((_DWORD)v7 == 32)
    *(_DWORD *)(a1 + 28) = 2;
  return v7;
}

void _xpc_pipe_check_in_once(uint64_t a1)
{
  os_unfair_lock_s *v3;
  unsigned int v4;

  if (!atomic_load((unsigned int *)(a1 + 28)))
  {
    v3 = (os_unfair_lock_s *)(a1 + 24);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
    if (!*(_DWORD *)(a1 + 28))
    {
      v4 = 1;
      if ((*(_BYTE *)(a1 + 48) & 1) != 0)
      {
        if (_xpc_connection_check_in_with_ports(*(_DWORD *)(a1 + 32), *(_DWORD *)(a1 + 36), *(_DWORD *)(a1 + 40)))
          v4 = 1;
        else
          v4 = 2;
      }
      atomic_store(v4, (unsigned int *)(a1 + 28));
    }
    os_unfair_lock_unlock(v3);
  }
}

uint64_t _xpc_pipe_interface_simpleroutine(uint64_t a1, int a2, void *a3, char a4)
{
  return _xpc_pipe_simpleroutine(a1, a2, a3, 0, a4);
}

uint64_t xpc_pipe_receive(mach_port_name_t a1, _QWORD *a2, char a3)
{
  uint64_t v6;
  NSObject *v7;
  BOOL v8;
  dispatch_object_t object[2];
  uint64_t v11;

  object[1] = 0;
  object[0] = (dispatch_object_t)dispatch_mach_msg_create();
  v6 = _xpc_pipe_receive(a1, object, a3);
  v7 = object[0];
  if (!(_DWORD)v6)
  {
    v11 = 0;
    if (xpc_receive_mach_msg(object[0], 0, 0, 0, &v11))
      v8 = 1;
    else
      v8 = v11 == 0;
    if (!v8)
    {
      v6 = 0;
      *a2 = v11;
      if (!v7)
        return v6;
      goto LABEL_9;
    }
    v6 = 5;
  }
  if (v7)
LABEL_9:
    dispatch_release(v7);
  return v6;
}

uint64_t _xpc_pipe_receive(mach_port_name_t a1, NSObject **a2, char a3)
{
  mach_msg_option_t v5;
  NSObject *v6;
  mach_msg_header_t *msg;
  mach_msg_header_t *v8;
  int v9;
  uint64_t v10;
  mach_msg_return_t v11;
  mach_msg_header_t *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _OWORD v17[5];
  mach_msg_size_t rcv_size[2];

  if ((a3 & 1) != 0)
    v5 = 50334470;
  else
    v5 = 50334214;
  v6 = *a2;
  *(_QWORD *)rcv_size = 0;
  msg = (mach_msg_header_t *)dispatch_mach_msg_get_msg();
  v8 = 0;
  memset(v17, 0, 76);
  v9 = v5 & 0x3000B02;
  LODWORD(v10) = 0;
  while (1)
  {
    v11 = mach_msg(msg, v5, 0, v10, a1, 0, 0);
    if (v11 != 268451844)
      break;
    if ((v5 & 4) == 0)
    {
      v13 = 12;
      if (v8)
        goto LABEL_18;
      goto LABEL_19;
    }
    v10 = msg->msgh_size + 52;
    v12 = (mach_msg_header_t *)malloc_type_malloc(v10, 0xCED4F094uLL);
    v8 = v12;
    if (v12)
    {
      memcpy(v12, msg, *(size_t *)rcv_size);
      msg = v8;
    }
    else
    {
      v10 = 0;
      msg = (mach_msg_header_t *)v17;
    }
    *(_QWORD *)rcv_size = v10;
    v5 = v9;
  }
  if (v11)
  {
    if (v11 == 268451843)
    {
      v13 = 35;
      if (v8)
        goto LABEL_18;
    }
    else
    {
      _os_assumes_log();
      v13 = 5;
      if (v8)
LABEL_18:
        free(v8);
    }
LABEL_19:
    dispatch_release(v6);
    v15 = 0;
LABEL_20:
    *a2 = v15;
    return v13;
  }
  voucher_create_with_mach_msg();
  v14 = (void *)voucher_adopt();
  os_release(v14);
  if (v8)
  {
    dispatch_release(v6);
    v15 = dispatch_mach_msg_create();
    v13 = 0;
    goto LABEL_20;
  }
  return 0;
}

uint64_t xpc_pipe_invalidate(uint64_t result)
{
  *(_DWORD *)(result + 40) = 0;
  *(_QWORD *)(result + 32) = 0;
  return result;
}

uint64_t xpc_pipe_try_receive(mach_port_name_t a1, uint64_t *a2, _DWORD *a3, unsigned int (*a4)(void), size_t a5, char a6)
{
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t msg;
  mach_msg_header_t *v17;
  int v18;
  int v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24[2];

  v24[1] = *MEMORY[0x1E0C874D8];
  v23 = 0;
  v22 = dispatch_mach_msg_create();
  v12 = _xpc_pipe_receive(a1, &v22, a6);
  if ((_DWORD)v12)
  {
    v13 = v12;
    v14 = v22;
  }
  else
  {
    v24[0] = 0;
    v14 = v22;
    msg = dispatch_mach_msg_get_msg();
    v23 = msg;
    if (v24[0] <= 0x17uLL)
      xpc_pipe_try_receive_cold_1();
    v17 = (mach_msg_header_t *)msg;
    v18 = *(_DWORD *)(msg + 20);
    if (v18 == 0x40000000 || v18 == 0x10000000)
    {
      v20 = *(_DWORD *)(msg + 12);
      v24[0] = 0;
      v13 = 22;
      if (!xpc_receive_mach_msg(v14, 0, 0, 0, v24))
      {
        v21 = v24[0];
        if (v24[0])
        {
          v13 = 0;
          *a3 = v20;
          *a2 = v21;
        }
      }
    }
    else
    {
      MEMORY[0x1E0C86820]();
      bzero((char *)&v22 - ((a5 + 15) & 0xFFFFFFFFFFFFFFF0), a5);
      bzero((char *)&v22 - ((a5 + 15) & 0xFFFFFFFFFFFFFFF0), a5);
      v13 = _xpc_pipe_handle_mig(v17, (mach_msg_header_t *)((char *)&v22 - ((a5 + 15) & 0xFFFFFFFFFFFFFFF0)), a4);
    }
  }
  if (v14)
    dispatch_release(v14);
  return v13;
}

uint64_t _xpc_pipe_mach_msg(uint64_t a1, mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t a4, mach_port_name_t a5)
{
  mach_msg_bits_t msgh_bits;
  uint64_t v8;
  uint64_t v9;

  msgh_bits = msg->msgh_bits;
  v8 = mach_msg(msg, option, msg->msgh_size, a4, a5, 0, 0);
  v9 = v8;
  if ((int)v8 > 268435465)
  {
    if ((_DWORD)v8 == 268451844)
      return v9;
    if ((_DWORD)v8 == 268435466)
      _xpc_pipe_mach_msg_cold_1();
  }
  else
  {
    if (!(_DWORD)v8)
    {
LABEL_13:
      _xpc_serializer_clear_sent_descriptors(a1);
      return v9;
    }
    if ((_DWORD)v8 == 268435459)
      goto LABEL_4;
  }
  _os_assumes_log();
  if ((v9 & 0x3FFC000) != 0)
    goto LABEL_13;
LABEL_4:
  if (((msg->msgh_bits ^ msgh_bits) & 0x1F) != 0 && _xpc_mach_port_release(msg->msgh_remote_port))
    _os_assumes_log();
  if (((msg->msgh_bits ^ msgh_bits) & 0x1F00) != 0 && _xpc_mach_port_release(msg->msgh_local_port))
    _os_assumes_log();
  return v9;
}

uint64_t _xpc_consume_send_once_notification_on_reply_port(int a1)
{
  uint64_t result;
  int v2;
  int v3;
  _BYTE v4[32];

  memset(v4, 0, sizeof(v4));
  *(_DWORD *)&v4[4] = 32;
  *(_DWORD *)&v4[12] = a1;
  result = mach_msg_receive((mach_msg_header_t *)v4);
  if ((_DWORD)result)
  {
    if ((_DWORD)result == 268435479)
      v3 = 1;
    else
      v3 = 5;
    if ((_DWORD)result == 268435459)
      v3 = 32;
    v2 = *(_DWORD *)&v4[20];
    goto LABEL_11;
  }
  v2 = *(_DWORD *)&v4[20];
  if (*(_DWORD *)&v4[20] != 71)
  {
    v3 = 0;
LABEL_11:
    _xpc_asprintf("Unable to consume send-once notification, error = %d, msgh_id = %x", v3, v2);
    result = _os_crash();
    __break(1u);
  }
  return result;
}

uint64_t _waiting4memory()
{
  sleep(1u);
  return 1;
}

void *_xpc_memdup(const void *a1, size_t size)
{
  void *v4;

  v4 = _xpc_alloc(size);
  return memcpy(v4, a1, size);
}

void *_xpc_mmap_anon(size_t *a1)
{
  size_t v2;
  void *result;

  v2 = ~*MEMORY[0x1E0C88810] & (*MEMORY[0x1E0C88810] + *a1);
  for (*a1 = v2; ; v2 = *a1)
  {
    result = mmap(0, v2, 3, 4098, -1, 0);
    if (result != (void *)-1)
      break;
    if (*__error() != 12)
    {
      if (*__error())
        _xpc_mach_port_get_context_cold_1();
    }
    _waiting4memory();
  }
  return result;
}

char *_xpc_strdup(const char *a1)
{
  const char *i;
  char *result;

  for (i = a1; ; a1 = i)
  {
    result = strdup(a1);
    if (result)
      break;
    if (*__error() != 12)
    {
      if (*__error())
        _xpc_mach_port_get_context_cold_1();
    }
    _waiting4memory();
  }
  return result;
}

char *_xpc_strndup(const char *a1, size_t a2)
{
  size_t v2;
  const char *v3;
  char *result;

  v2 = a2;
  v3 = a1;
  while (1)
  {
    result = strndup(a1, a2);
    if (result)
      break;
    if (*__error() != 12)
    {
      if (*__error())
        _xpc_mach_port_get_context_cold_1();
    }
    _waiting4memory();
    a1 = v3;
    a2 = v2;
  }
  return result;
}

uint64_t _xpc_memcmp(const void *a1, size_t __n, void *__s2, uint64_t a4)
{
  if (__n == a4)
    return memcmp(a1, __s2, __n);
  else
    return 0xFFFFFFFFLL;
}

char *_xpc_asprintf(char *a1, ...)
{
  char *result;
  char *v3;
  va_list va;

  va_start(va, a1);
  v3 = 0;
  while (1)
  {
    vasprintf(&v3, a1, va);
    result = v3;
    if (v3)
      break;
    if (*__error() != 12)
    {
      if (*__error())
        _xpc_mach_port_get_context_cold_1();
    }
    _waiting4memory();
  }
  return result;
}

void *_xpc_Block_copy_impl(const void *a1)
{
  const void *i;
  void *result;

  for (i = a1; ; a1 = i)
  {
    result = _Block_copy(a1);
    if (result)
      break;
    if (*__error() != 12)
    {
      if (*__error())
        _xpc_mach_port_get_context_cold_1();
    }
    _waiting4memory();
  }
  return result;
}

BOOL _xpc_has_prefix(const char *a1, char *__s)
{
  size_t v4;

  v4 = strlen(__s);
  return strncmp(a1, __s, v4) == 0;
}

BOOL _xpc_has_suffix(const char *a1, const char *a2)
{
  const char *v4;
  const char *v5;

  v4 = &a1[strlen(a1)];
  v5 = &v4[-strlen(a2)];
  return v5 >= a1 && strcmp(v5, a2) == 0;
}

BOOL _xpc_equal_strings(char *__s1, const char *a2)
{
  _BOOL8 result;

  result = ((unint64_t)__s1 | (unint64_t)a2) == 0;
  if (__s1)
  {
    if (a2)
      return strcmp(__s1, a2) == 0;
  }
  return result;
}

uint64_t _xpc_hash(_BYTE *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;

  if (!a2)
    return 5381;
  result = 5381;
  do
  {
    v4 = *a1;
    if (!*a1)
      break;
    ++a1;
    result = 33 * result + v4;
    --a2;
  }
  while (a2);
  return result;
}

uint64_t __xpc_enum2label(int a1, uint64_t a2, uint64_t a3)
{
  uint64_t i;

  if (!a3)
    return 0;
  for (i = a2 + 8; *(_DWORD *)(i - 8) != a1; i += 16)
  {
    if (!--a3)
      return 0;
  }
  return *(_QWORD *)i;
}

xpc_object_t xpc_create_from_plist(char *buffer, uint64_t size)
{
  xpc_object_t v2;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  char *v12;
  __int128 v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  BOOL v18;
  unsigned int *v19;
  unsigned int *v20;
  unint64_t v21;
  int v22;
  xpc_object_t v23;
  uint64_t v24;
  uint64_t *v25;
  void *v26;
  uint64_t *v27;
  char *v28;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  char *v33;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  char *v41;
  char *v43;
  char *v44;
  unsigned int v45;
  unint64_t v46;
  char *v47;
  unint64_t v49;
  int v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  char *v55;
  uint64_t *v57;
  uint64_t *v58;
  char *v59;
  char v60;
  char v61;
  char *v62;
  size_t v63;
  size_t v64;
  char *v65;
  NSObject *v67;
  NSObject *v68;
  size_t v69;
  const char *v70;
  const char *v71;
  unint64_t v72;
  int v73;
  unint64_t v74;
  size_t v75;
  uint64_t *v77;
  uint64_t *v78;
  xpc_object_t v79;
  uint64_t v80;
  size_t v81;
  uint64_t *v83;
  uint64_t no_copy;
  uint64_t v85;
  unint64_t *v86;
  unint64_t v87;
  int v88;
  double v89;
  char v90;
  char *v91;
  char v92;
  char *v93;
  size_t v94;
  unint64_t v95;
  char *v97;
  char *v99;
  BOOL v100;
  unint64_t v101;
  void *v102;
  char *v103;
  int64_t v104;
  __int128 v105;
  unint64_t v106;
  unint64_t v107;
  uint64_t *v108;
  uint64_t v109;
  size_t size_ptr;
  size_t v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  uint64_t v115;
  size_t v116;
  void *buffer_ptr[2];

  v2 = 0;
  v108 = 0;
  v109 = 0;
  v103 = buffer;
  v104 = size;
  if ((unint64_t)size < 9)
    return v2;
  if (*(_DWORD *)buffer != 1768714338 || *((_WORD *)buffer + 2) != 29811)
  {
    v6 = dispatch_data_create(buffer, size, 0, (dispatch_block_t)*MEMORY[0x1E0C86EA0]);
    v7 = dispatch_data_create_with_transform();
    dispatch_release(v6);
    if (v7)
    {
      size_ptr = 0;
      buffer_ptr[0] = 0;
      v8 = dispatch_data_create_map(v7, (const void **)buffer_ptr, &size_ptr);
      v9 = buffer_ptr[0];
      dispatch_release(v7);
      if (v8)
      {
        v2 = _xpc_plist_parse_xml((unint64_t)v9, size_ptr);
        dispatch_release(v8);
        return v2;
      }
    }
    return 0;
  }
  if ((unint64_t)size < 0x29)
    return 0;
  if (*(_DWORD *)buffer != 1768714338 || *(_DWORD *)(buffer + 3) != 812938089)
    return 0;
  v2 = 0;
  v12 = &buffer[size - 32];
  v13 = *((_OWORD *)v12 + 1);
  v105 = *(_OWORD *)v12;
  v14 = bswap64(*((unint64_t *)&v105 + 1));
  v15 = bswap64(v13);
  *((_QWORD *)&v105 + 1) = v14;
  v106 = v15;
  v16 = bswap64(*((unint64_t *)&v13 + 1));
  v107 = v16;
  if ((uint64_t)v14 < 1)
    return v2;
  if ((v16 & 0x8000000000000000) != 0)
    return v2;
  v2 = 0;
  if (v14 < v15 || v16 < 9 || size - 32 <= v16)
    return v2;
  if (!BYTE6(v105) || !BYTE7(v105))
    return 0;
  v2 = 0;
  if (!is_mul_ok(v14, BYTE6(v105)))
    return v2;
  v2 = 0;
  v17 = v14 * BYTE6(v105);
  v18 = __CFADD__(v17, v16);
  if (!v17)
    return v2;
  if (v18)
    return v2;
  v2 = 0;
  if (v17 + v16 > 0xFFFFFFFFFFFFFFDFLL || v17 + v16 + 32 != size)
    return v2;
  if (BYTE7(v105) <= 7u && v14 >> (8 * BYTE7(v105)))
    return 0;
  if (BYTE6(v105) <= 7u && v16 >> (8 * BYTE6(v105)))
    return 0;
  v113 = 0u;
  v114 = 0u;
  v112 = 0u;
  size_ptr = (size_t)buffer;
  v111 = size;
  if (buffer + 8 < buffer)
    return 0;
  v19 = (unsigned int *)&buffer[size];
  if (buffer + 8 >= &buffer[size])
    return 0;
  v20 = (unsigned int *)&buffer[v16];
  if (&buffer[v16] < buffer)
    return 0;
  if (v20 >= v19)
    return 0;
  v21 = (unint64_t)v20 + v17 - 1;
  if (v21 < (unint64_t)buffer || v21 >= (unint64_t)v19)
    return 0;
  do
  {
    buffer_ptr[0] = 0;
    if (!_xpc_plist_swap_int(&size_ptr, v20, BYTE6(v105), (unint64_t *)buffer_ptr)
      || (void *)(v16 - 1) < buffer_ptr[0])
    {
      return 0;
    }
    v20 = (unsigned int *)((char *)v20 + BYTE6(v105));
    --v14;
  }
  while (v14);
  v115 = 0;
  v22 = _xpc_plist_swap_int((unint64_t *)&v103, (unsigned int *)&buffer[v16 + v15 * BYTE6(v105)], BYTE6(v105), (unint64_t *)&v115);
  v23 = 0;
  if (!v22)
    return v23;
  v23 = 0;
  v24 = v115;
  if (v115 < 0 || v115 >= size)
    return v23;
  v25 = (uint64_t *)malloc_type_calloc(1uLL, 0x38uLL, 0x10A004053EC9CC7uLL);
  v108 = v25;
  if (!v25)
    return 0;
  *((_BYTE *)v25 + 48) |= 1u;
  *v25 = v24;
  v26 = (void *)*MEMORY[0x1E0C86EA0];
LABEL_49:
  v27 = v108;
  if ((v108[6] & 0x10) == 0)
  {
    if ((v108[6] & 1) != 0)
    {
      LODWORD(v31) = 0;
      *((_BYTE *)v108 + 48) |= 0x10u;
      v32 = *v27;
      if (!*v27)
        goto LABEL_83;
      goto LABEL_84;
    }
    if ((v108[6] & 2) != 0)
    {
      v33 = (char *)v108[3];
      if (v33 < v103 || v33 >= &v103[v104])
        goto LABEL_81;
      v35 = v108[1];
      if (v35 >= v108[2])
        goto LABEL_180;
      v36 = _xpc_plist_offset_of_object((uint64_t)&v103, (unsigned int *)&v33[v35 * BYTE7(v105)]);
      if (v36 != -1)
      {
        v32 = v36;
        v31 = (unint64_t)malloc_type_calloc(1uLL, 0x38uLL, 0x10A004053EC9CC7uLL);
        if (!v31)
          goto LABEL_82;
        v37 = v31;
        LODWORD(v31) = 0;
        *(_BYTE *)(v37 + 48) |= 8u;
        *(_QWORD *)(v37 + 40) = v27;
        *(_QWORD *)(v37 + 8) = v27[1];
        v108 = (uint64_t *)v37;
        goto LABEL_71;
      }
    }
    else
    {
      if ((v108[6] & 8) == 0)
      {
        if ((v108[6] & 4) == 0)
          goto LABEL_81;
        v28 = (char *)v108[3];
        if (v28 < v103 || v28 >= &v103[v104])
          goto LABEL_81;
        v30 = v108[1];
        if (v30 >= v108[2])
        {
LABEL_180:
          LODWORD(v31) = _xpc_plist_collapse_stack((uint64_t)&v103);
          goto LABEL_82;
        }
        v31 = _xpc_plist_offset_of_object((uint64_t)&v103, (unsigned int *)&v28[v30 * BYTE7(v105)]);
        if (v31 == -1)
          goto LABEL_81;
        v32 = v31;
        LODWORD(v31) = 0;
LABEL_71:
        ++v27[1];
        if (!v32)
          goto LABEL_83;
        goto LABEL_84;
      }
      v38 = v108[5];
      if (v38)
      {
        if ((*(_BYTE *)(v38 + 48) & 2) != 0)
        {
          v39 = v108[1];
          v40 = *(_QWORD *)(v38 + 16);
          if (v39 <= v40)
          {
            v41 = *(char **)(v38 + 24);
            if (v41 >= v103 && v41 < &v103[v104])
            {
              v101 = _xpc_plist_offset_of_object((uint64_t)&v103, (unsigned int *)&v41[(v40 + v39) * BYTE7(v105)]);
              LODWORD(v31) = 0;
              if (v101 == -1)
                v32 = 0;
              else
                v32 = v101;
              if (!v32)
                goto LABEL_83;
              goto LABEL_84;
            }
          }
        }
      }
    }
  }
LABEL_81:
  while (1)
  {
    LODWORD(v31) = 0;
LABEL_82:
    v32 = 0;
LABEL_83:
    if (!(_DWORD)v31)
      break;
LABEL_84:
    if ((v31 & 1) == 0)
    {
      v43 = v103;
      v44 = &v103[v32];
      v45 = v103[v32];
      if ((v45 & 0xF0) == 0xA0)
      {
        v54 = (unint64_t)(v44 + 1);
        size_ptr = (size_t)(v44 + 1);
        v55 = &v103[v104];
        if (v44 + 1 < v103 || v54 >= (unint64_t)v55)
          goto LABEL_102;
        v72 = *v44 & 0xF;
        buffer_ptr[0] = (void *)v72;
        if ((_DWORD)v72 != 15
          || (v73 = _xpc_plist_read_int((unint64_t *)&v103, v54, (unint64_t *)buffer_ptr, &size_ptr),
              v51 = 0,
              v73)
          && (v72 = (unint64_t)buffer_ptr[0], ((unint64_t)buffer_ptr[0] & 0x8000000000000000) == 0))
        {
          if (v72 && !is_mul_ok(v72, BYTE7(v105)))
            goto LABEL_102;
          v74 = v72 * BYTE7(v105);
          if ((v74 & 0x8000000000000000) != 0)
            goto LABEL_102;
          v75 = size_ptr + v74 - 1;
          if (v75 < (unint64_t)v43 || v75 >= (unint64_t)v55)
            goto LABEL_102;
          v77 = (uint64_t *)malloc_type_calloc(1uLL, 0x38uLL, 0x10A004053EC9CC7uLL);
          if (!v77)
            goto LABEL_102;
          v78 = v77;
          v77[1] = 0;
          v77[2] = v72;
          *((_BYTE *)v77 + 48) |= 4u;
          v77[3] = size_ptr;
          v77[5] = (uint64_t)v108;
          v79 = xpc_array_create(0, 0);
LABEL_143:
          v78[4] = (uint64_t)v79;
          v108 = v78;
          v51 = 1;
        }
      }
      else
      {
        if ((v45 & 0xF0) != 0xD0)
        {
          v57 = v108;
          if ((v108[6] & 8) == 0 || v108[4])
          {
            v58 = (uint64_t *)malloc_type_calloc(1uLL, 0x38uLL, 0x10A004053EC9CC7uLL);
            if (!v58)
              goto LABEL_203;
            v58[5] = (uint64_t)v57;
            v108 = v58;
            v57 = v58;
          }
          switch(v45 >> 4)
          {
            case 0u:
              if (v45 == 9)
              {
                v100 = 1;
LABEL_187:
                no_copy = (uint64_t)xpc_BOOL_create(v100);
                goto LABEL_188;
              }
              if (v45 == 8)
              {
                v100 = 0;
                goto LABEL_187;
              }
              if (v45)
                goto LABEL_203;
              no_copy = (uint64_t)xpc_null_create();
LABEL_188:
              v57[4] = no_copy;
LABEL_189:
              if ((_xpc_plist_collapse_stack((uint64_t)&v103) & 1) == 0)
                goto LABEL_203;
              break;
            case 1u:
              v23 = 0;
              if (v32 < 0 || v104 <= v32)
                goto LABEL_204;
              v85 = 1 << (*v44 & 0xF);
              size_ptr = 0;
              if (!_xpc_plist_swap_int((unint64_t *)&v103, (unsigned int *)(v44 + 1), v85, &size_ptr))goto LABEL_203;
              no_copy = (uint64_t)xpc_int64_create(size_ptr);
              goto LABEL_188;
            case 2u:
              v86 = (unint64_t *)(v44 + 1);
              if (v44 + 1 < v43)
                goto LABEL_203;
              v87 = (unint64_t)&v43[v104];
              if (v86 >= (unint64_t *)&v43[v104])
                goto LABEL_203;
              v88 = *v44 & 0xF;
              if (v88 == 3)
              {
                v23 = 0;
                if (v44 + 8 < v43 || (unint64_t)(v44 + 8) >= v87)
                  goto LABEL_204;
                v89 = COERCE_DOUBLE(bswap64(*v86));
              }
              else
              {
                if (v88 != 2)
                  goto LABEL_203;
                v23 = 0;
                if (v44 + 4 < v43 || (unint64_t)(v44 + 4) >= v87)
                  goto LABEL_204;
                v89 = COERCE_FLOAT(bswap32(*(_DWORD *)v86));
              }
              no_copy = (uint64_t)xpc_double_create(v89);
              goto LABEL_188;
            case 3u:
              if (v45 != 51 || (_xpc_plist_parse_date((unint64_t *)&v103, v32) & 1) == 0)
                goto LABEL_203;
              goto LABEL_189;
            case 4u:
              v92 = *v44;
              v91 = v44 + 1;
              v90 = v92;
              size_ptr = (size_t)v91;
              if (v91 < v43)
                goto LABEL_203;
              v93 = &v43[v104];
              if (v91 >= &v43[v104])
                goto LABEL_203;
              v94 = v90 & 0xF;
              buffer_ptr[0] = (void *)v94;
              if ((v90 & 0xF) != 0xF)
                goto LABEL_168;
              if (!_xpc_plist_read_int((unint64_t *)&v103, (unint64_t)v91, (unint64_t *)buffer_ptr, &size_ptr))goto LABEL_203;
              v94 = (size_t)buffer_ptr[0];
              if (((unint64_t)buffer_ptr[0] & 0x8000000000000000) != 0)
                goto LABEL_203;
              v91 = (char *)size_ptr;
LABEL_168:
              v95 = (unint64_t)&v91[v94 - 1];
              if (v95 < (unint64_t)v43 || v95 >= (unint64_t)v93)
                goto LABEL_203;
              no_copy = (uint64_t)xpc_data_create(v91, v94);
              goto LABEL_188;
            case 5u:
            case 6u:
              v61 = *v44;
              v59 = v44 + 1;
              v60 = v61;
              buffer_ptr[0] = v59;
              if (v59 < v43)
                goto LABEL_203;
              v62 = &v43[v104];
              if (v59 >= &v43[v104])
                goto LABEL_203;
              v63 = v60 & 0xF;
              v116 = v63;
              if ((v60 & 0xF) == 0xF)
              {
                if (!_xpc_plist_read_int((unint64_t *)&v103, (unint64_t)v59, &v116, buffer_ptr))goto LABEL_203;
                v63 = v116;
                if ((v116 & 0x8000000000000000) != 0)
                  goto LABEL_203;
              }
              if ((v60 & 0xF0) == 0x60)
              {
                v64 = 2 * v63;
                if (((2 * v63) & 0x8000000000000000) != 0)
                  goto LABEL_203;
                v65 = (char *)buffer_ptr[0] + v64 - 1;
                if (v65 < v43 || v65 >= v62)
                  goto LABEL_203;
                v67 = dispatch_data_create(buffer_ptr[0], v64, 0, v26);
                v68 = dispatch_data_create_with_transform();
                dispatch_release(v67);
                if (!v68)
                  goto LABEL_203;
                v69 = dispatch_data_get_size(v68);
                v70 = (const char *)malloc_type_malloc(v69 + 1, 0x32E51089uLL);
                if (!v70)
                {
                  dispatch_release(v68);
                  goto LABEL_203;
                }
                v71 = v70;
                size_ptr = MEMORY[0x1E0C87450];
                v111 = 0x40000000;
                *(_QWORD *)&v112 = ___xpc_plist_parse_string_block_invoke;
                *((_QWORD *)&v112 + 1) = &__block_descriptor_tmp_4;
                *(_QWORD *)&v113 = v70;
                dispatch_data_apply(v68, &size_ptr);
                v71[dispatch_data_get_size(v68)] = 0;
                dispatch_release(v68);
              }
              else
              {
                v97 = (char *)buffer_ptr[0] + v63 - 1;
                if (v97 < v43 || v97 >= v62)
                  goto LABEL_203;
                v99 = (char *)malloc_type_malloc(v63 + 1, 0xC815735DuLL);
                if (!v99)
                  goto LABEL_203;
                v71 = v99;
                memcpy(v99, buffer_ptr[0], v63);
                v71[v63] = 0;
              }
              no_copy = xpc_string_create_no_copy(v71);
              goto LABEL_188;
            default:
              goto LABEL_203;
          }
          goto LABEL_190;
        }
        v46 = (unint64_t)(v44 + 1);
        size_ptr = (size_t)(v44 + 1);
        v47 = &v103[v104];
        if (v44 + 1 < v103 || v46 >= (unint64_t)v47)
          goto LABEL_102;
        v49 = *v44 & 0xF;
        buffer_ptr[0] = (void *)v49;
        if ((_DWORD)v49 != 15
          || (v50 = _xpc_plist_read_int((unint64_t *)&v103, v46, (unint64_t *)buffer_ptr, &size_ptr),
              v51 = 0,
              v50)
          && (v49 = (unint64_t)buffer_ptr[0], ((unint64_t)buffer_ptr[0] & 0x8000000000000000) == 0))
        {
          if (v49)
          {
            v52 = 2 * v49;
            v53 = BYTE7(v105);
            if (is_mul_ok(2 * v49, BYTE7(v105)))
              goto LABEL_136;
            goto LABEL_102;
          }
          v52 = 0;
          v53 = BYTE7(v105);
LABEL_136:
          v80 = v52 * v53;
          if ((v80 & 0x8000000000000000) == 0)
          {
            v81 = size_ptr + v80 - 1;
            if (v81 >= (unint64_t)v43 && v81 < (unint64_t)v47)
            {
              v83 = (uint64_t *)malloc_type_calloc(1uLL, 0x38uLL, 0x10A004053EC9CC7uLL);
              if (v83)
              {
                v78 = v83;
                v83[1] = 0;
                v83[2] = v49;
                *((_BYTE *)v83 + 48) |= 2u;
                v83[3] = size_ptr;
                v83[5] = (uint64_t)v108;
                v79 = xpc_dictionary_create(0, 0, 0);
                goto LABEL_143;
              }
            }
          }
LABEL_102:
          v51 = 0;
        }
      }
      LOBYTE(v109) = v51 ^ 1;
    }
LABEL_190:
    if (!(_BYTE)v109)
      goto LABEL_49;
  }
  if (v108 && (v108[6] & 1) != 0 && (v102 = (void *)v108[4]) != 0)
    v23 = xpc_retain(v102);
  else
LABEL_203:
    v23 = 0;
LABEL_204:
  _xpc_plist_unwind_stack((uint64_t)&v103);
  return v23;
}

void xpc_create_from_plist_descriptor(dispatch_fd_t a1, dispatch_queue_t queue, uint64_t a3)
{
  _QWORD handler[5];

  handler[0] = MEMORY[0x1E0C87450];
  handler[1] = 0x40000000;
  handler[2] = __xpc_create_from_plist_descriptor_block_invoke;
  handler[3] = &unk_1EA959350;
  handler[4] = a3;
  dispatch_read(a1, 0xFFFFFFFFFFFFFFFFLL, queue, handler);
}

void __xpc_create_from_plist_descriptor_block_invoke(uint64_t a1, dispatch_data_t data, int a3)
{
  xpc_object_t v4;
  dispatch_data_t map;
  NSObject *v6;
  uint64_t v7;
  void *buffer_ptr;

  if (a3
    || (v7 = 0,
        buffer_ptr = 0,
        (map = dispatch_data_create_map(data, (const void **)&buffer_ptr, (size_t *)&v7)) == 0))
  {
    v4 = 0;
  }
  else
  {
    v6 = map;
    v4 = xpc_create_from_plist((char *)buffer_ptr, v7);
    dispatch_release(v6);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (v4)
    xpc_release(v4);
}

uint64_t _xpc_plist_swap_int(unint64_t *a1, unsigned int *a2, uint64_t a3, unint64_t *a4)
{
  unint64_t v4;
  unint64_t v5;
  unsigned int v7;

  if (a3)
  {
    v4 = (unint64_t)a2 + a3 - 1;
    if (v4 < *a1 || v4 >= *a1 + a1[1])
      return 0;
    switch(a3)
    {
      case 1:
        v5 = *(unsigned __int8 *)a2;
        break;
      case 2:
        v5 = bswap32(*(unsigned __int16 *)a2) >> 16;
        break;
      case 4:
        v5 = bswap32(*a2);
        break;
      case 8:
        v5 = bswap64(*(_QWORD *)a2);
        break;
      default:
        v5 = 0;
        do
        {
          v7 = *(unsigned __int8 *)a2;
          a2 = (unsigned int *)((char *)a2 + 1);
          v5 = v7 | (v5 << 8);
          --a3;
        }
        while (a3);
        break;
    }
  }
  else
  {
    v5 = 0;
  }
  *a4 = v5;
  return 1;
}

void _xpc_plist_unwind_stack(uint64_t a1)
{
  uint64_t i;
  xpc_object_t *v3;

  for (i = *(_QWORD *)(a1 + 48); i; *(_QWORD *)(a1 + 48) = i)
  {
    v3 = (xpc_object_t *)i;
    i = *(_QWORD *)(i + 40);
    if (v3[4])
    {
      xpc_release(v3[4]);
      v3 = *(xpc_object_t **)(a1 + 48);
    }
    free(v3);
  }
}

uint64_t _xpc_plist_parse_date(unint64_t *a1, uint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  unint64_t v6;

  v2 = *a1;
  v3 = *a1 + a2;
  v4 = (unint64_t *)(v3 + 1);
  if (v3 + 1 < *a1)
    return 0;
  v5 = v2 + a1[1];
  if ((unint64_t)v4 >= v5)
    return 0;
  v6 = v3 + 9;
  if (v6 < v2 || v6 >= v5)
    return 0;
  *(_QWORD *)(a1[6] + 32) = xpc_date_create_absolute(COERCE_DOUBLE(bswap64(*v4)));
  return 1;
}

uint64_t _xpc_plist_collapse_stack(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  void *v6;
  const char *string_ptr;
  void *v8;

  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(v2 + 40);
  if (v3)
  {
    if ((*(_BYTE *)(v2 + 48) & 8) != 0)
      return 1;
    if ((*(_BYTE *)(v3 + 48) & 8) != 0)
    {
      if (*(_QWORD *)(v2 + 32))
      {
        result = *(_QWORD *)(v3 + 32);
        if (!result)
          return result;
        v5 = *(_QWORD *)(v3 + 40);
        if (v5)
        {
          if ((*(_BYTE *)(v5 + 48) & 2) != 0
            && xpc_get_type((xpc_object_t)result) == (xpc_type_t)OS_xpc_string)
          {
            v6 = *(void **)(v5 + 32);
            string_ptr = xpc_string_get_string_ptr(*(xpc_object_t *)(v3 + 32));
            xpc_dictionary_set_value(v6, string_ptr, *(xpc_object_t *)(*(_QWORD *)(a1 + 48) + 32));
            xpc_release(*(xpc_object_t *)(v3 + 32));
            xpc_release(*(xpc_object_t *)(*(_QWORD *)(a1 + 48) + 32));
            free(*(void **)(a1 + 48));
            free((void *)v3);
LABEL_17:
            *(_QWORD *)(a1 + 48) = v5;
            return 1;
          }
        }
      }
    }
    else if ((*(_BYTE *)(v3 + 48) & 4) != 0)
    {
      v8 = *(void **)(v2 + 32);
      if (v8)
      {
        result = *(_QWORD *)(v3 + 32);
        if (!result)
          return result;
        xpc_array_append_value((xpc_object_t)result, v8);
        xpc_release(*(xpc_object_t *)(*(_QWORD *)(a1 + 48) + 32));
        v2 = *(_QWORD *)(a1 + 48);
        goto LABEL_16;
      }
    }
    else if ((*(_BYTE *)(v3 + 48) & 1) != 0)
    {
      *(_QWORD *)(v3 + 32) = *(_QWORD *)(v2 + 32);
LABEL_16:
      free((void *)v2);
      v5 = v3;
      goto LABEL_17;
    }
  }
  return 0;
}

unint64_t _xpc_plist_offset_of_object(uint64_t a1, unsigned int *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v7;
  unint64_t v8;

  if (*(_QWORD *)a1 + 8 > (unint64_t)a2)
    return -1;
  v3 = *(_QWORD *)a1 + *(_QWORD *)(a1 + 40);
  v4 = *(unsigned __int8 *)(a1 + 23);
  if (v3 - v4 < (unint64_t)a2)
    return -1;
  v8 = 0;
  if (!_xpc_plist_swap_int((unint64_t *)a1, a2, v4, &v8) || *(_QWORD *)(a1 + 24) <= v8)
    return -1;
  v5 = *(unsigned __int8 *)(a1 + 22);
  v7 = 0;
  if (_xpc_plist_swap_int((unint64_t *)a1, (unsigned int *)(v3 + v8 * v5), v5, &v7))
    return v7;
  else
    return -1;
}

uint64_t _xpc_plist_read_int(unint64_t *a1, unint64_t a2, unint64_t *a3, _QWORD *a4)
{
  unint64_t v4;
  uint64_t v6;
  uint64_t result;

  if (*a1 > a2)
    return 0;
  if (*a1 + a1[1] <= a2)
    return 0;
  v4 = a2 + 1;
  if ((*(_BYTE *)a2 & 0xF0) != 0x10)
    return 0;
  v6 = 1 << (*(_BYTE *)a2 & 0xF);
  result = _xpc_plist_swap_int(a1, (unsigned int *)(a2 + 1), v6, a3);
  if (a4)
  {
    if ((_DWORD)result)
    {
      *a4 = v4 + v6;
      return 1;
    }
  }
  return result;
}

uint64_t ___xpc_plist_parse_string_block_invoke(uint64_t a1, int a2, uint64_t a3, void *__src, size_t __n)
{
  memcpy((void *)(*(_QWORD *)(a1 + 32) + a3), __src, __n);
  return 1;
}

xpc_object_t _xpc_plist_parse_xml(unint64_t a1, uint64_t a2)
{
  xpc_object_t v2;
  _DWORD *v3;
  const char *v4;
  NSObject *v5;
  void *v6;
  xpc_object_t v7;
  void *v8;
  int v9;
  xpc_object_t *v10;
  xpc_object_t v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  void *no_copy;
  size_t v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *concat;
  BOOL v21;
  BOOL v22;
  dispatch_data_t v23;
  size_t v24;
  void *v25;
  char *v26;
  char *v27;
  NSObject *v28;
  xpc_object_t v29;
  NSObject *v30;
  const char *v31;
  dispatch_data_t v32;
  NSObject *v33;
  NSObject *v34;
  char *v35;
  char *v36;
  char *v37;
  int64_t v38;
  double v39;
  uint64_t absolute;
  uint64_t v41;
  double v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  double v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  double v51;
  double v52;
  uint64_t v53;
  double v54;
  _BYTE *v55;
  NSObject *object;
  void *__s2;
  size_t size_ptr;
  void *buffer_ptr;
  __int128 v61;
  __int128 v62;
  _QWORD v63[4];
  __int128 v64;
  xpc_object_t *v65;
  tm v66;

  v65 = 0;
  v63[0] = 0;
  v63[1] = a1;
  v63[2] = a2;
  v63[3] = 1;
  v64 = a1;
  v61 = 0u;
  v62 = 0u;
  v2 = 0;
  if (_xpc_xml_lex((int *)v63, (uint64_t)&v61))
  {
    while ((v61 - 1) < 2)
    {
      if ((_xpc_xml_lex((int *)v63, (uint64_t)&v61) & 1) == 0)
        return 0;
    }
    if ((_DWORD)v61 != 4)
      goto LABEL_118;
    v3 = _xpc_alloc(0x18uLL);
    *(_QWORD *)v3 = 0;
    v3[2] = 4;
    *((_QWORD *)v3 + 2) = 0;
    v65 = (xpc_object_t *)v3;
    v2 = 0;
    if (_xpc_xml_lex((int *)v63, (uint64_t)&v61))
    {
      v2 = 0;
      v4 = (const char *)&unk_1DEEBE00B;
      v5 = MEMORY[0x1E0C86EB0];
      v6 = (void *)*MEMORY[0x1E0C86EA0];
      while (1)
      {
        switch((int)v61)
        {
          case 5:
            if (!v65)
              return 0;
            if (*((_DWORD *)v65 + 2) != 4 || !*v65)
              goto LABEL_118;
            v2 = xpc_retain(*v65);
            _xpc_xml_parser_pop((uint64_t *)&v65);
            goto LABEL_56;
          case 6:
            v7 = xpc_dictionary_create(0, 0, 0);
            v8 = v7;
            v9 = 6;
            goto LABEL_54;
          case 7:
            v10 = v65;
            if (!v65)
              return 0;
            if (*((_DWORD *)v65 + 2) != 6)
              goto LABEL_118;
            goto LABEL_21;
          case 8:
            v11 = xpc_dictionary_create(0, 0, 0);
            goto LABEL_50;
          case 9:
            v7 = xpc_array_create(0, 0);
            v8 = v7;
            v9 = 9;
            goto LABEL_54;
          case 10:
            v10 = v65;
            if (!v65)
              return 0;
            if (*((_DWORD *)v65 + 2) != 9)
              goto LABEL_118;
LABEL_21:
            v7 = xpc_retain(*v10);
            _xpc_xml_parser_pop((uint64_t *)&v65);
            goto LABEL_51;
          case 11:
            v11 = xpc_array_create(0, 0);
            goto LABEL_50;
          case 12:
            if (!v65)
              return 0;
            if (*((_DWORD *)v65 + 2) != 6 || !_xpc_xml_lex((int *)v63, (uint64_t)&v61))
              goto LABEL_118;
            if ((_DWORD)v61 == 13)
            {
              v7 = xpc_string_create(v4);
              v8 = v7;
              v9 = 12;
LABEL_54:
              _xpc_xml_parser_push(&v65, v8, v9);
              goto LABEL_55;
            }
            if ((_DWORD)v61 != 19)
              goto LABEL_118;
            v12 = _xpc_xml_parser_string_terminate((const void *)v62, *((size_t *)&v62 + 1));
            if (!v12)
              goto LABEL_118;
            v13 = v12;
            if (strchr(v12, 38))
            {
              v14 = _xpc_xml_replace_entities(v13);
              if (v14)
              {
                v15 = v14;
                free(v13);
                v13 = v15;
              }
            }
            no_copy = (void *)xpc_string_create_no_copy(v13);
            _xpc_xml_parser_push(&v65, no_copy, 12);
            xpc_release(no_copy);
            if (!_xpc_xml_lex((int *)v63, (uint64_t)&v61) || (_DWORD)v61 != 13)
              goto LABEL_118;
            goto LABEL_56;
          case 14:
            v17 = *((_QWORD *)&v62 + 1);
            __s2 = (void *)v62;
            v18 = v5;
            while (2)
            {
              if (!_xpc_xml_lex((int *)v63, (uint64_t)&v61))
                goto LABEL_118;
              if ((v61 - 19) < 2)
              {
                v19 = dispatch_data_create((const void *)v62, *((size_t *)&v62 + 1), 0, v6);
                concat = dispatch_data_create_concat(v18, v19);
                dispatch_release(v18);
                dispatch_release(v19);
                v18 = concat;
                if ((v61 - 19) >= 2)
                  goto LABEL_59;
                continue;
              }
              break;
            }
            concat = v18;
            if ((_DWORD)v61 != 15)
              goto LABEL_118;
LABEL_59:
            size_ptr = 0;
            buffer_ptr = 0;
            v23 = dispatch_data_create_map(concat, (const void **)&buffer_ptr, &size_ptr);
            dispatch_release(concat);
            if (!v23)
              goto LABEL_118;
            object = v23;
            v24 = size_ptr;
            v25 = buffer_ptr;
            if (!_xpc_memcmp(__s2, v17, "data", 4))
            {
              v30 = v5;
              v31 = v4;
              v32 = dispatch_data_create(v25, v24, 0, v6);
              v33 = dispatch_data_create_with_transform();
              v34 = v32;
              v4 = v31;
              v5 = v30;
              dispatch_release(v34);
              if (v33)
              {
                v29 = xpc_data_create_with_dispatch_data(v33);
                dispatch_release(v33);
                v28 = object;
                goto LABEL_78;
              }
            }
            v26 = _xpc_xml_parser_string_terminate(v25, v24);
            if (!v26)
            {
              dispatch_release(object);
              goto LABEL_118;
            }
            v27 = v26;
            if (_xpc_memcmp(__s2, v17, "string", 6))
            {
              if (!_xpc_memcmp(__s2, v17, "integer", 7))
              {
                v38 = strtoll(v27, 0, 10);
                v29 = xpc_int64_create(v38);
                v28 = object;
                goto LABEL_77;
              }
              v28 = object;
              if (_xpc_memcmp(__s2, v17, "real", 4))
              {
                if (_xpc_memcmp(__s2, v17, "date", 4)
                  || (memset(&v66, 0, sizeof(v66)), !strptime(v27, "%Y-%m-%dT%H:%M:%SZ", &v66)))
                {
                  v29 = 0;
                  goto LABEL_77;
                }
                v41 = v66.tm_year - 101;
                v42 = (double)((int)v41 / 400) * 146097.0 + 0.0;
                v43 = v41 - 400 * ((int)v41 / 400);
                if (v43 < 0)
                {
                  v48 = ~v43;
                  v49 = v43;
                  do
                  {
                    v50 = v48 % 0x190;
                    v51 = 365.0;
                    if (((v48 % 0x190) & 3) == 0)
                    {
                      v51 = 365.0;
                      if (v50 != 100)
                      {
                        v51 = 365.0;
                        if (v50 != 200)
                        {
                          v51 = 365.0;
                          if (v50 != 300)
                            v51 = 366.0;
                        }
                      }
                    }
                    v42 = v42 - v51;
                    --v48;
                    ++v49;
                  }
                  while (v49);
                }
                else if (v43)
                {
                  v44 = 1;
                  v45 = v43;
                  do
                  {
                    v46 = v44 % 0x190;
                    v47 = 365.0;
                    if (((v44 % 0x190) & 3) == 0)
                    {
                      v47 = 365.0;
                      if (v46 != 100)
                      {
                        v47 = 365.0;
                        if (v46 != 200)
                        {
                          v47 = 365.0;
                          if (v46 != 300)
                            v47 = 366.0;
                        }
                      }
                    }
                    v42 = v42 + v47;
                    ++v44;
                    --v45;
                  }
                  while (v45);
                }
                v52 = v42 + (double)_xpc_mktime_days_before[v66.tm_mon];
                v53 = (v43 + 1) % 400;
                if (v53 < 0)
                  v53 = -v53;
                v54 = v52 + 1.0;
                if (v53 == 300)
                  v54 = v52;
                if (v53 == 200)
                  v54 = v52;
                if (v53 == 100)
                  v54 = v52;
                if ((v53 & 3) != 0)
                  v54 = v52;
                if (v66.tm_mon >= 2)
                  v52 = v54;
                absolute = xpc_date_create_absolute((v52 + (double)(v66.tm_mday - 1)) * 86400.0+ (double)v66.tm_min * 60.0+ (double)v66.tm_hour * 3600.0+ (double)v66.tm_sec);
              }
              else
              {
                v39 = strtod(v27, 0);
                absolute = (uint64_t)xpc_double_create(v39);
              }
            }
            else
            {
              v35 = _xpc_xml_parser_string_terminate(v25, v24);
              if (strchr(v35, 38))
              {
                v36 = _xpc_xml_replace_entities(v35);
                v28 = object;
                if (v36)
                {
                  v37 = v36;
                  free(v35);
                  v35 = v37;
                }
              }
              else
              {
                v28 = object;
              }
              absolute = xpc_string_create_no_copy(v35);
            }
            v29 = (xpc_object_t)absolute;
LABEL_77:
            free(v27);
LABEL_78:
            dispatch_release(v28);
            if (!v29)
              goto LABEL_118;
            if (!_xpc_xml_parser_stack_finish_leaf((uint64_t *)&v65, v29))
              goto LABEL_118;
            xpc_release(v29);
            if (memcmp((const void *)v62, __s2, *((size_t *)&v62 + 1)))
              goto LABEL_118;
            goto LABEL_56;
          case 16:
            if (*((_QWORD *)&v62 + 1) < 6uLL
              || (*(_DWORD *)v62 == 1769108595 ? (v21 = *(unsigned __int16 *)(v62 + 4) == 26478) : (v21 = 0), !v21))
            {
              v55 = _xpc_xml_parser_string_terminate((const void *)v62, *((size_t *)&v62 + 1));
              if (v55)
                free(v55);
LABEL_118:
              while (v65)
                _xpc_xml_parser_pop((uint64_t *)&v65);
              return 0;
            }
            v11 = xpc_string_create(v4);
LABEL_50:
            v7 = v11;
LABEL_51:
            if (!_xpc_xml_parser_stack_finish_leaf((uint64_t *)&v65, v7))
              goto LABEL_118;
LABEL_55:
            xpc_release(v7);
LABEL_56:
            if ((_xpc_xml_lex((int *)v63, (uint64_t)&v61) & 1) == 0)
              return v2;
            break;
          case 17:
            v22 = 1;
            goto LABEL_49;
          case 18:
            v22 = 0;
LABEL_49:
            v11 = xpc_BOOL_create(v22);
            goto LABEL_50;
          default:
            goto LABEL_56;
        }
      }
    }
  }
  return v2;
}

uint64_t _xpc_xml_lex(int *a1, uint64_t a2)
{
  uint64_t result;
  char *v4;
  _QWORD *v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int v10;
  int v11;
  const char *v12;
  int v13;
  size_t v14;
  uint64_t v15;
  unint64_t v16;
  const char *v17;
  char *v18;
  BOOL v19;
  size_t v20;
  size_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  size_t v26;
  size_t v27;
  uint64_t v28;
  const char *v30;
  char *v31;
  size_t v32;
  size_t v33;

  result = 0;
  *(_DWORD *)a2 = 0;
  v4 = (char *)*((_QWORD *)a1 + 4);
  v5 = v4 + 1;
  v7 = *((_QWORD *)a1 + 1);
  v6 = *((_QWORD *)a1 + 2);
  v8 = v7 + v6;
  if ((unint64_t)(v4 + 1) >= v7 + v6)
    return result;
  while (1)
  {
    v10 = *v4;
    *((_BYTE *)a1 + 40) = v10;
    *((_QWORD *)a1 + 4) = v5;
    v11 = *a1;
    if (*a1)
    {
      if (v11 == 1)
      {
        if (v10 != 60)
        {
          v24 = (char *)v5 - 1;
          *((_QWORD *)a1 + 4) = (char *)v5 - 1;
          v25 = (char *)v5 - v7 - 1;
          v19 = v6 >= (unint64_t)v25;
          v26 = v6 - (_QWORD)v25;
          if (v19)
            v27 = v26;
          else
            v27 = 0;
          result = (uint64_t)memchr(v24, 60, v27);
          if (result)
          {
            v28 = *((_QWORD *)a1 + 3);
            *(_DWORD *)a2 = 19;
            *(_QWORD *)(a2 + 8) = v28;
            *(_QWORD *)(a2 + 16) = v24;
            *(_QWORD *)(a2 + 24) = result - (_QWORD)v24;
            *((_QWORD *)a1 + 4) = result;
            return 1;
          }
          return result;
        }
        v16 = v6 - ((_QWORD)v5 - v7);
        if (v6 < (unint64_t)v5 - v7)
          v16 = 0;
        if (v16 < 9 || *v5 != 0x5B41544144435B21)
        {
          if (_xpc_xml_lexer_read_tag(a1, a2))
            _xpc_xml_lexer_process_tag((int *)a2);
          if ((*(_DWORD *)a2 | 2) == 0xF)
            *a1 = 0;
          return 1;
        }
        *a1 = 2;
        *((_QWORD *)a1 + 4) = ++v5;
      }
      else if (v11 == 2)
      {
        v17 = (char *)v5 - 1;
        *((_QWORD *)a1 + 4) = (char *)v5 - 1;
        v18 = (char *)v5 - v7 - 1;
        v19 = v6 >= (unint64_t)v18;
        v20 = v6 - (_QWORD)v18;
        if (v19)
          v21 = v20;
        else
          v21 = 0;
        result = (uint64_t)strnstr(v17, "]]>", v21);
        if (!result)
          return result;
        v23 = *((_QWORD *)a1 + 3);
        v22 = *((_QWORD *)a1 + 4);
        *(_DWORD *)a2 = 20;
        *(_QWORD *)(a2 + 8) = v23;
        *(_QWORD *)(a2 + 16) = v22;
        *(_QWORD *)(a2 + 24) = result - v22;
        *((_QWORD *)a1 + 4) = result + 3;
        result = 1;
        goto LABEL_39;
      }
      goto LABEL_25;
    }
    result = 0;
    if (v10 <= 12)
    {
      if (v10 != 9)
      {
        if (v10 != 10)
          return result;
        ++*((_QWORD *)a1 + 3);
      }
      goto LABEL_25;
    }
    if (v10 != 13 && v10 != 32)
    {
      if (v10 != 60)
        return result;
      v12 = (char *)v5 + 1;
      if ((unint64_t)v5 + 1 < v8)
        break;
    }
LABEL_25:
    v4 = (char *)v5;
    v5 = (_QWORD *)((char *)v5 + 1);
    v8 = v7 + v6;
    if ((unint64_t)v5 >= v7 + v6)
      return 0;
  }
  v13 = *(char *)v5;
  *((_BYTE *)a1 + 40) = *(_BYTE *)v5;
  *((_QWORD *)a1 + 4) = v12;
  if (v13 != 33)
  {
    if (v13 == 63)
      return _xpc_xml_lexer_read_header(a1, a2);
    *((_QWORD *)a1 + 4) = v5;
    if (_xpc_xml_lexer_read_tag(a1, a2))
      _xpc_xml_lexer_process_tag((int *)a2);
    result = 1;
    if ((*(_DWORD *)a2 | 2) != 0xE)
      return result;
LABEL_39:
    *a1 = 1;
    return result;
  }
  if (v6 >= (unint64_t)&v12[-v7])
    v14 = v6 - (_QWORD)&v12[-v7];
  else
    v14 = 0;
  if (v14 < 5)
    return 0;
  if (*(_WORD *)v12 == 11565)
  {
    result = (uint64_t)strnstr(v12, "-->", v14);
    if (!result)
      return result;
    *(_DWORD *)a2 = 3;
    v15 = *((_QWORD *)a1 + 4) + 2;
    *(_QWORD *)(a2 + 8) = *((_QWORD *)a1 + 3);
    *(_QWORD *)(a2 + 16) = v15;
    *(_QWORD *)(a2 + 24) = result - v15;
    v5 = (_QWORD *)(result + 3);
    *((_QWORD *)a1 + 4) = result + 3;
    v7 = *((_QWORD *)a1 + 1);
    v6 = *((_QWORD *)a1 + 2);
    goto LABEL_25;
  }
  if (v14 < 0xE)
    return 0;
  if (*(_QWORD *)v12 != 0x2045505954434F44 || *(_QWORD *)((char *)v5 + 6) != 0x7473696C70204550)
    return 0;
  v30 = (char *)v5 + 14;
  *((_QWORD *)a1 + 4) = (char *)v5 + 14;
  v31 = (char *)v5 - v7 + 14;
  v19 = v6 >= (unint64_t)v31;
  v32 = v6 - (_QWORD)v31;
  if (v19)
    v33 = v32;
  else
    v33 = 0;
  result = (uint64_t)strnstr(v30, ">", v33);
  if (result)
  {
    *(_DWORD *)a2 = 2;
    *(_QWORD *)(a2 + 8) = *((_QWORD *)a1 + 3);
    *(_QWORD *)(a2 + 16) = 0;
    *((_QWORD *)a1 + 4) = result + 1;
    return 1;
  }
  return result;
}

_QWORD *_xpc_xml_parser_push(_QWORD *a1, void *a2, int a3)
{
  _QWORD *result;
  _QWORD *v7;

  result = _xpc_alloc(0x18uLL);
  v7 = result;
  *result = 0;
  if (a2)
  {
    result = xpc_retain(a2);
    *v7 = result;
  }
  *((_DWORD *)v7 + 2) = a3;
  v7[2] = *a1;
  *a1 = v7;
  return result;
}

void _xpc_xml_parser_pop(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  if (*a1)
  {
    if (*(_QWORD *)v1)
      xpc_release(*(xpc_object_t *)v1);
    *a1 = *(_QWORD *)(v1 + 16);
    free((void *)v1);
  }
}

uint64_t _xpc_xml_parser_stack_finish_leaf(uint64_t *a1, xpc_object_t value)
{
  uint64_t v2;
  int v5;
  xpc_object_t v6;
  const char *string_ptr;

  v2 = *a1;
  if (!*a1)
    return 0;
  v5 = *(_DWORD *)(v2 + 8);
  if (v5 == 12)
  {
    v6 = xpc_retain(*(xpc_object_t *)v2);
    _xpc_xml_parser_pop(a1);
    if (*a1 && *(_DWORD *)(*a1 + 8) == 6)
    {
      string_ptr = xpc_string_get_string_ptr(v6);
      xpc_dictionary_set_value(*(xpc_object_t *)*a1, string_ptr, value);
      xpc_release(v6);
      return 1;
    }
    return 0;
  }
  if (v5 == 9)
  {
    xpc_array_append_value(*(xpc_object_t *)v2, value);
    return 1;
  }
  if (v5 != 4)
    return 0;
  *(_QWORD *)*a1 = xpc_retain(value);
  return 1;
}

_BYTE *_xpc_xml_parser_string_terminate(const void *a1, size_t a2)
{
  _BYTE *v4;
  _BYTE *v5;

  v4 = malloc_type_malloc(a2 + 1, 0xDB398829uLL);
  v5 = v4;
  if (v4)
  {
    memcpy(v4, a1, a2);
    v5[a2] = 0;
  }
  return v5;
}

char *_xpc_xml_replace_entities(char *a1)
{
  char *v2;
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  unsigned int v7;
  int v8;
  int v9;
  unsigned int v10;
  int v11;
  int v12;
  int v13;
  uint64_t v15;
  size_t v16;

  v2 = strchr(a1, 38);
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    while (1)
    {
      v5 = strchr(v3, 59);
      if (!v5)
        return v4;
      v6 = v5;
      v7 = (_DWORD)v5 - (_DWORD)v3;
      if (v5 - v3 >= 3)
      {
        if (v3[1] != 35)
        {
          v15 = 0;
          while ((char *)(v7 - 1) != (&entity_table)[v15 + 1] || strncmp(v3 + 1, (&entity_table)[v15], v7 - 1))
          {
            v15 += 3;
            if (v15 == 15)
            {
              if (v7 != 1)
                goto LABEL_43;
              v10 = 0;
              goto LABEL_30;
            }
          }
          v10 = (&entity_table)[v15 + 2];
          if (v4)
            goto LABEL_32;
LABEL_31:
          v4 = _xpc_strdup(a1);
          v3 = &v4[v3 - a1];
LABEL_32:
          v16 = strlen(v3);
          if (v10 > 0x7F)
          {
            if (v10 > 0x7FF)
            {
              if (HIWORD(v10))
              {
                v6 = v3;
                if (!(v10 >> 21))
                {
                  *v3 = (v10 >> 18) | 0xF0;
                  v3[1] = (v10 >> 12) & 0x3F | 0x80;
                  v3[2] = (v10 >> 6) & 0x3F | 0x80;
                  v6 = v3 + 4;
                  v3[3] = v10 & 0x3F | 0x80;
                }
              }
              else
              {
                *v3 = (v10 >> 12) | 0xE0;
                v3[1] = (v10 >> 6) & 0x3F | 0x80;
                v6 = v3 + 3;
                v3[2] = v10 & 0x3F | 0x80;
              }
            }
            else
            {
              *v3 = (v10 >> 6) | 0xC0;
              v6 = v3 + 2;
              v3[1] = v10 & 0x3F | 0x80;
            }
          }
          else
          {
            *v3 = v10;
            v6 = v3 + 1;
          }
          memmove(v6, &v3[v7 + 1], v16 - (v7 + 1) + 1);
          goto LABEL_43;
        }
        v8 = v3[2];
        if (v8 == 120)
          v7 = 3;
        else
          v7 = 2;
        v9 = v3[v7];
        if (v9 != 59)
        {
          v10 = 0;
          if (v8 == 120)
            v11 = 16;
          else
            v11 = 10;
          do
          {
            v12 = (char)v9;
            if ((v9 - 48) > 9u)
            {
              if (v8 != 120 || (v13 = (char)v9 - 97, (v12 - 97) > 5u))
              {
                v13 = v12 - 65;
                if ((v12 - 65) >= 6u || v8 != 120)
                  v13 = 0;
              }
            }
            else
            {
              v13 = (char)v9 - 48;
            }
            v10 = v13 + v10 * v11;
            v9 = v3[++v7];
          }
          while (v9 != 59);
LABEL_30:
          if (!v4)
            goto LABEL_31;
          goto LABEL_32;
        }
      }
LABEL_43:
      v3 = strchr(v6, 38);
      if (!v3)
        return v4;
    }
  }
  return 0;
}

uint64_t _xpc_xml_lexer_read_header(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t result;
  unint64_t v9;
  BOOL v10;
  size_t v11;
  size_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v2 = a1[4];
  v3 = a1[1];
  v4 = a1[2];
  v5 = v4 - (v2 - v3);
  if (v4 < v2 - v3)
    v5 = 0;
  if (v5 < 6 || *(_DWORD *)v2 != 543976824)
    return 0;
  a1[4] = v2 + 4;
  v9 = v2 + 4 - v3;
  v10 = v4 >= v9;
  v11 = v4 - v9;
  if (v10)
    v12 = v11;
  else
    v12 = 0;
  result = (uint64_t)strnstr((const char *)(v2 + 4), "?>", v12);
  if (result)
  {
    v13 = result;
    v15 = a1[3];
    v14 = a1[4];
    v16 = result - v14;
    result = 1;
    *(_DWORD *)a2 = 1;
    *(_QWORD *)(a2 + 8) = v15;
    *(_QWORD *)(a2 + 16) = v14;
    *(_QWORD *)(a2 + 24) = v16;
    a1[4] = v13 + 2;
  }
  return result;
}

BOOL _xpc_xml_lexer_read_tag(_QWORD *a1, uint64_t a2)
{
  const char *v4;
  unint64_t v5;
  const char *v6;
  BOOL v7;
  size_t v8;
  size_t v9;
  char *v10;
  _BYTE *v11;
  uint64_t v12;

  v4 = (const char *)a1[4];
  v5 = a1[2];
  v6 = &v4[-a1[1]];
  v7 = v5 >= (unint64_t)v6;
  v8 = v5 - (_QWORD)v6;
  if (v7)
    v9 = v8;
  else
    v9 = 0;
  v10 = strnstr(v4, ">", v9);
  if (v10)
  {
    v12 = a1[3];
    v11 = (_BYTE *)a1[4];
    *(_DWORD *)a2 = 14;
    *(_QWORD *)(a2 + 8) = v12;
    *(_QWORD *)(a2 + 16) = v11;
    *(_QWORD *)(a2 + 24) = v10 - v11;
    if (*v11 == 47)
    {
      *(_DWORD *)a2 = 15;
      *(_QWORD *)(a2 + 16) = v11 + 1;
    }
    else
    {
      if (*(v10 - 1) != 47)
      {
LABEL_10:
        a1[4] = v10 + 1;
        return v10 != 0;
      }
      *(_DWORD *)a2 = 16;
    }
    *(_QWORD *)(a2 + 24) = v10 - v11 - 1;
    goto LABEL_10;
  }
  return v10 != 0;
}

int *_xpc_xml_lexer_process_tag(int *result)
{
  int v1;
  unint64_t v2;
  int *v3;
  int v5;
  unint64_t v6;
  int *v7;
  int v9;
  int v10;
  unint64_t v12;
  int *v13;
  int v16;
  int v17;
  int v20;
  int v21;
  unsigned __int16 *v23;
  int v24;
  int v25;
  unsigned __int16 *v27;
  int v28;
  int v29;

  v1 = *result;
  if (*result == 16)
  {
    v6 = *((_QWORD *)result + 3);
    if (v6 < 4)
      return result;
    v7 = (int *)*((_QWORD *)result + 2);
    if (*v7 == 1952672100)
    {
      v5 = 8;
      goto LABEL_80;
    }
    if (v6 < 5)
    {
      if (*v7 != 1702195828)
        return result;
    }
    else
    {
      if (*v7 == 1634890337 && *((_BYTE *)v7 + 4) == 121)
      {
        v5 = 11;
        goto LABEL_80;
      }
      if (*v7 != 1702195828)
      {
        v9 = *v7;
        v10 = *((unsigned __int8 *)v7 + 4);
        if (v9 == 1936482662 && v10 == 101)
        {
          v5 = 18;
          goto LABEL_80;
        }
        return result;
      }
    }
    v5 = 17;
    goto LABEL_80;
  }
  if (v1 == 15)
  {
    v12 = *((_QWORD *)result + 3);
    if (v12 < 5)
    {
      if (v12 != 4)
      {
        if (v12 <= 2)
          return result;
        v27 = (unsigned __int16 *)*((_QWORD *)result + 2);
        v28 = *v27;
        v29 = *((unsigned __int8 *)v27 + 2);
        if (v28 != 25963 || v29 != 121)
          return result;
        goto LABEL_73;
      }
      v13 = (int *)*((_QWORD *)result + 2);
    }
    else
    {
      v13 = (int *)*((_QWORD *)result + 2);
      if (*v13 == 1936288880 && *((_BYTE *)v13 + 4) == 116)
      {
        v5 = 5;
        goto LABEL_80;
      }
    }
    if (*v13 == 1952672100)
    {
      v5 = 7;
      goto LABEL_80;
    }
    if (*(_WORD *)v13 != 25963 || *((_BYTE *)v13 + 2) != 121)
    {
      if (v12 >= 5)
      {
        v20 = *v13;
        v21 = *((unsigned __int8 *)v13 + 4);
        if (v20 == 1634890337 && v21 == 121)
        {
          v5 = 10;
          goto LABEL_80;
        }
      }
      return result;
    }
LABEL_73:
    v5 = 13;
    goto LABEL_80;
  }
  if (v1 != 14)
    return result;
  v2 = *((_QWORD *)result + 3);
  if (v2 >= 5)
  {
    v3 = (int *)*((_QWORD *)result + 2);
    if (*v3 == 1936288880 && *((_BYTE *)v3 + 4) == 116)
    {
      v5 = 4;
      goto LABEL_80;
    }
    goto LABEL_34;
  }
  if (v2 == 4)
  {
    v3 = (int *)*((_QWORD *)result + 2);
LABEL_34:
    if (*v3 == 1952672100)
    {
      v5 = 6;
      goto LABEL_80;
    }
    if (*(_WORD *)v3 != 25963 || *((_BYTE *)v3 + 2) != 121)
    {
      if (v2 < 5)
        return result;
      v16 = *v3;
      v17 = *((unsigned __int8 *)v3 + 4);
      if (v16 != 1634890337 || v17 != 121)
        return result;
      v5 = 9;
LABEL_80:
      *result = v5;
      return result;
    }
LABEL_66:
    v5 = 12;
    goto LABEL_80;
  }
  if (v2 > 2)
  {
    v23 = (unsigned __int16 *)*((_QWORD *)result + 2);
    v24 = *v23;
    v25 = *((unsigned __int8 *)v23 + 2);
    if (v24 == 25963 && v25 == 121)
      goto LABEL_66;
  }
  return result;
}

BOOL _xpc_mach_recv_equal(uint64_t a1, uint64_t a2)
{
  return *(_DWORD *)(a1 + 24) == *(_DWORD *)(a2 + 24);
}

uint64_t _xpc_mach_recv_hash(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

uint64_t _xpc_mach_recv_desc(unsigned int *a1, uint64_t a2)
{
  uint64_t v4;
  int v5;
  const char *v6;
  int v7;
  unsigned int v8;
  int v9;
  char __str[16];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C874D8];
  v4 = a1[6];
  if ((_DWORD)v4 == -1)
  {
    v6 = "(consumed)";
    v7 = -1;
  }
  else
  {
    *(_DWORD *)__str = 0;
    v5 = MEMORY[0x1DF0F0E78](*MEMORY[0x1E0C883F0], v4, 1, __str);
    if (v5)
    {
      if (v5 == 15)
      {
        v6 = "(none)";
      }
      else if (v5 == 17)
      {
        v6 = "(consumed)";
      }
      else
      {
        v6 = "(invalid)";
      }
    }
    else
    {
      v6 = "receive";
    }
    v7 = a1[6];
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  *(_OWORD *)__str = 0u;
  v12 = 0u;
  v8 = snprintf(__str, 0x80uLL, "<%s: %p> { name = 0x%x, right = %s }", "mach receive right", a1, v7, v6);
  if (v8 >= 0x7F)
    v9 = 127;
  else
    v9 = v8;
  return _xpc_serializer_append(a2, __str, (v9 + 1), 0);
}

uint64_t _xpc_mach_recv_debug(uint64_t a1, char *__str, size_t __size)
{
  return snprintf(__str, __size, ", port = 0x%x", *(_DWORD *)(a1 + 24));
}

uint64_t _xpc_mach_recv_serialize(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  unsigned int *v3;
  int v4;
  char *v6;
  int v7;

  v3 = (unsigned int *)(a1 + 24);
  do
    v4 = __ldxr(v3);
  while (__stxr(0xFFFFFFFF, v3));
  if (v4 == -1)
  {
    v6 = _xpc_asprintf("Multiple attempts to serialize a receive right.", a2, a3, a1);
    _xpc_api_misuse(v6);
  }
  v7 = 86016;
  return _xpc_serializer_append_port(a2, &v7, 4uLL, a1, v4, 16);
}

uint64_t _xpc_mach_recv_deserialize(uint64_t *a1)
{
  int v1;
  uint64_t result;
  int v3;

  v3 = 0;
  if (!_xpc_graph_deserializer_read_port(a1, 16, &v3))
    return 0;
  v1 = v3;
  result = _xpc_base_create();
  if ((v1 - 1) <= 0xFFFFFFFD)
    *(_DWORD *)(result + 24) = v1;
  *(_DWORD *)(result + 16) |= 3u;
  return result;
}

uint64_t _xpc_mach_recv_wire_length()
{
  return -1;
}

uint64_t _xpc_mach_recv_dispose(uint64_t a1)
{
  unsigned int *v1;
  uint64_t result;

  v1 = (unsigned int *)(a1 + 24);
  do
    result = __ldxr(v1);
  while (__stxr(0, v1));
  if ((result - 1) <= 0xFFFFFFFD)
  {
    result = _xpc_mach_port_close_recv(result, 0, 0);
    if ((_DWORD)result)
      return _os_assumes_log();
  }
  return result;
}

uint64_t xpc_mach_recv_create(int a1)
{
  uint64_t result;

  result = _xpc_base_create();
  if ((a1 - 1) <= 0xFFFFFFFD)
    *(_DWORD *)(result + 24) = a1;
  *(_DWORD *)(result + 16) |= 2u;
  return result;
}

uint64_t xpc_mach_recv_extract_right(unsigned int *a1)
{
  uint64_t result;
  unsigned int *v3;
  char *v4;

  if (xpc_get_type(a1) != (xpc_type_t)OS_xpc_mach_recv)
    return 0;
  v3 = a1 + 6;
  do
    result = __ldxr(v3);
  while (__stxr(0xFFFFFFFF, v3));
  if ((_DWORD)result == -1)
  {
    v4 = _xpc_asprintf("Attempt to extract a receive right multiple times from the same object. This is unsafe.");
    _xpc_api_misuse(v4);
  }
  return result;
}

BOOL _xpc_bundle_equal(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t _xpc_bundle_desc(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  size_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  size_t v9;
  size_t v10;
  uint64_t v11;
  uint64_t v12;
  size_t v13;
  size_t v14;
  uint64_t v15;
  uint64_t v16;
  size_t v17;
  size_t v18;
  uint64_t v19;
  uint64_t v20;
  size_t v21;
  size_t v22;
  uint64_t v23;
  uint64_t v24;
  size_t v25;
  size_t v26;
  uint64_t v27;
  uint64_t v28;
  size_t v29;
  size_t v30;
  uint64_t v31;
  uint64_t v32;
  size_t v33;
  size_t v34;
  uint64_t v35;
  uint64_t v36;
  size_t v37;
  size_t v38;
  uint64_t v39;
  uint64_t v40;
  size_t v41;
  size_t v42;
  uint64_t v43;
  uint64_t v44;
  size_t v45;
  size_t v46;
  unint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  int v53;
  int *extension_vtable;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  size_t v59;
  size_t v60;
  unint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  uint64_t v66;
  int v67;
  int *v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  size_t v72;
  char *v74;
  char __str[16];
  __int128 v76;
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
  __int128 v89;
  __int128 v90;
  uint64_t v91;

  v91 = *MEMORY[0x1E0C874D8];
  _xpc_bundle_resolve(a1);
  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  *(_OWORD *)__str = 0u;
  v76 = 0u;
  v4 = snprintf(__str, 0x100uLL, "<%s: %p> {\n", "bundle", (const void *)a1);
  if (v4 >= 0xFF)
    v5 = 255;
  else
    v5 = v4;
  _xpc_serializer_append(a2, __str, v5, 0);
  v6 = _xpc_serializer_pad(a2);
  v7 = _xpc_object_pad(__str, 0x100uLL, v6);
  v8 = v7;
  v9 = 256 - v7;
  if ((unint64_t)(256 - v7) < 2)
  {
    v10 = 0;
  }
  else
  {
    v10 = snprintf(&__str[v7], v9, "resolved = %d,\n", (*(unsigned __int8 *)(a1 + 296) >> 2) & 1);
    if (v9 <= v10)
      v10 = 255 - v8;
  }
  _xpc_serializer_append(a2, __str, v10 + v8, 0);
  v11 = _xpc_object_pad(__str, 0x100uLL, v6);
  v12 = v11;
  v13 = 256 - v11;
  if ((unint64_t)(256 - v11) < 2)
  {
    v14 = 0;
  }
  else
  {
    v14 = snprintf(&__str[v11], v13, "populated = %d,\n", (*(unsigned __int8 *)(a1 + 296) >> 3) & 1);
    if (v13 <= v14)
      v14 = 255 - v12;
  }
  _xpc_serializer_append(a2, __str, v14 + v12, 0);
  if (*(_QWORD *)(a1 + 288))
  {
    v15 = _xpc_object_pad(__str, 0x100uLL, v6);
    v16 = v15;
    v17 = 256 - v15;
    if ((unint64_t)(256 - v15) < 2)
    {
      v18 = 0;
    }
    else
    {
      v18 = snprintf(&__str[v15], v17, "taint = %s,\n", *(const char **)(a1 + 288));
      if (v17 <= v18)
        v18 = 255 - v16;
    }
    _xpc_serializer_append(a2, __str, v18 + v16, 0);
  }
  v19 = _xpc_object_pad(__str, 0x100uLL, v6);
  v20 = v19;
  v21 = 256 - v19;
  if ((unint64_t)(256 - v19) < 2)
  {
    v22 = 0;
  }
  else
  {
    v22 = snprintf(&__str[v19], v21, "error = %d,\n", *(_DWORD *)(a1 + 36));
    if (v21 <= v22)
      v22 = 255 - v20;
  }
  _xpc_serializer_append(a2, __str, v22 + v20, 0);
  v23 = _xpc_object_pad(__str, 0x100uLL, v6);
  v24 = v23;
  v25 = 256 - v23;
  if ((unint64_t)(256 - v23) < 2)
  {
    v26 = 0;
  }
  else
  {
    v26 = snprintf(&__str[v23], v25, "origin type = %d,\n", *(_DWORD *)(a1 + 40));
    if (v25 <= v26)
      v26 = 255 - v24;
  }
  _xpc_serializer_append(a2, __str, v26 + v24, 0);
  v27 = _xpc_object_pad(__str, 0x100uLL, v6);
  v28 = v27;
  v29 = 256 - v27;
  if ((unint64_t)(256 - v27) < 2)
  {
    v30 = 0;
  }
  else
  {
    v30 = snprintf(&__str[v27], v29, "origin path = \"%s\",\n", *(const char **)(a1 + 48));
    if (v29 <= v30)
      v30 = 255 - v28;
  }
  _xpc_serializer_append(a2, __str, v30 + v28, 0);
  v31 = _xpc_object_pad(__str, 0x100uLL, v6);
  v32 = v31;
  v33 = 256 - v31;
  if ((unint64_t)(256 - v31) < 2)
  {
    v34 = 0;
  }
  else
  {
    v34 = snprintf(&__str[v31], v33, "resolved origin path = \"%s\",\n", *(const char **)(a1 + 56));
    if (v33 <= v34)
      v34 = 255 - v32;
  }
  _xpc_serializer_append(a2, __str, v34 + v32, 0);
  v35 = _xpc_object_pad(__str, 0x100uLL, v6);
  v36 = v35;
  v37 = 256 - v35;
  if ((unint64_t)(256 - v35) < 2)
  {
    v38 = 0;
  }
  else
  {
    v38 = snprintf(&__str[v35], v37, "root path = \"%s\",\n", *(const char **)(a1 + 64));
    if (v37 <= v38)
      v38 = 255 - v36;
  }
  _xpc_serializer_append(a2, __str, v38 + v36, 0);
  v39 = _xpc_object_pad(__str, 0x100uLL, v6);
  v40 = v39;
  v41 = 256 - v39;
  if ((unint64_t)(256 - v39) < 2)
  {
    v42 = 0;
  }
  else
  {
    v42 = snprintf(&__str[v39], v41, "executable path = \"%s\",\n", *(const char **)(a1 + 232));
    if (v41 <= v42)
      v42 = 255 - v40;
  }
  _xpc_serializer_append(a2, __str, v42 + v40, 0);
  v43 = _xpc_object_pad(__str, 0x100uLL, v6);
  v44 = v43;
  v45 = 256 - v43;
  if ((unint64_t)(256 - v43) < 2)
  {
    v46 = 0;
  }
  else
  {
    v46 = snprintf(&__str[v43], v45, "info plist = ");
    if (v45 <= v46)
      v46 = 255 - v44;
  }
  _xpc_serializer_append(a2, __str, v46 + v44, 0);
  v47 = *(unint64_t **)(a1 + 240);
  if (v47)
  {
    if (((unint64_t)v47 & 0x8000000000000000) != 0)
    {
      v48 = 0;
      v49 = *MEMORY[0x1E0DE7C58];
      if ((~(unint64_t)v47 & 0xC000000000000007) == 0)
        v49 = 0;
      v50 = v49 ^ (unint64_t)v47;
      do
      {
        if ((v50 & 7) == *(_BYTE *)(MEMORY[0x1E0DE7C48] + v48))
          break;
        ++v48;
      }
      while (v48 != 7);
      v51 = v48 | v50;
      v52 = v48 & 7;
      v53 = (v51 >> 55) + 8;
      if (v52 == 7)
        LODWORD(v52) = v53;
      if ((_DWORD)v52 == 12)
      {
        extension_vtable = &_OS_xpc_type_uint64;
      }
      else
      {
        if ((_DWORD)v52 != 13)
          goto LABEL_101;
        extension_vtable = &_OS_xpc_type_int64;
      }
    }
    else
    {
      v55 = *v47;
      if (*v47 < (unint64_t)OBJC_CLASS___OS_xpc_object
        || v55 > (unint64_t)OS_xpc_rich_error
        || (v55 & 7) != 0)
      {
        extension_vtable = _xpc_get_extension_vtable(*(id *)(a1 + 240));
      }
      else
      {
        extension_vtable = (int *)((char *)&_xpc_vtables + 2 * (v55 - (_QWORD)OBJC_CLASS___OS_xpc_object));
      }
    }
    (*((void (**)(unint64_t *, uint64_t))extension_vtable + 6))(v47, a2);
    v56 = *(_QWORD *)(a2 + 56) + 1;
    --*(_QWORD *)(a2 + 48);
    *(_QWORD *)(a2 + 56) = v56;
  }
  else
  {
    _xpc_serializer_append(a2, "(null)", 6uLL, 0);
  }
  _xpc_serializer_append(a2, "\n", 1uLL, 0);
  if (*(_QWORD *)(a1 + 248))
  {
    v57 = _xpc_object_pad(__str, 0x100uLL, v6);
    v58 = v57;
    v59 = 256 - v57;
    if ((unint64_t)(256 - v57) < 2)
    {
      v60 = 0;
    }
    else
    {
      v60 = snprintf(&__str[v57], v59, "services = ");
      if (v59 <= v60)
        v60 = 255 - v58;
    }
    _xpc_serializer_append(a2, __str, v60 + v58, 0);
    v61 = *(unint64_t **)(a1 + 248);
    if (((unint64_t)v61 & 0x8000000000000000) == 0)
    {
      v69 = *v61;
      if (*v61 < (unint64_t)OBJC_CLASS___OS_xpc_object
        || v69 > (unint64_t)OS_xpc_rich_error
        || (v69 & 7) != 0)
      {
        v68 = _xpc_get_extension_vtable(v61);
      }
      else
      {
        v68 = (int *)((char *)&_xpc_vtables + 2 * (v69 - (_QWORD)OBJC_CLASS___OS_xpc_object));
      }
      goto LABEL_97;
    }
    v62 = 0;
    v63 = *MEMORY[0x1E0DE7C58];
    if ((~(unint64_t)v61 & 0xC000000000000007) == 0)
      v63 = 0;
    v64 = v63 ^ (unint64_t)v61;
    do
    {
      if ((v64 & 7) == *(_BYTE *)(MEMORY[0x1E0DE7C48] + v62))
        break;
      ++v62;
    }
    while (v62 != 7);
    v65 = v62 | v64;
    v66 = v62 & 7;
    v67 = (v65 >> 55) + 8;
    if (v66 == 7)
      LODWORD(v66) = v67;
    if ((_DWORD)v66 == 12)
    {
      v68 = &_OS_xpc_type_uint64;
      goto LABEL_97;
    }
    if ((_DWORD)v66 == 13)
    {
      v68 = &_OS_xpc_type_int64;
LABEL_97:
      (*((void (**)(unint64_t *, uint64_t))v68 + 6))(v61, a2);
      v70 = *(_QWORD *)(a2 + 56) + 1;
      --*(_QWORD *)(a2 + 48);
      *(_QWORD *)(a2 + 56) = v70;
      _xpc_serializer_append(a2, "\n", 1uLL, 0);
      goto LABEL_98;
    }
LABEL_101:
    v74 = _xpc_asprintf("Object is not an XPC object");
    _xpc_api_misuse(v74);
  }
LABEL_98:
  v71 = _xpc_serializer_unpad(a2);
  v72 = _xpc_object_pad(__str, 0x100uLL, v71);
  _xpc_serializer_append(a2, __str, v72, 0);
  return _xpc_serializer_append(a2, "}", 2uLL, 0);
}

uint64_t _xpc_bundle_debug()
{
  return 0;
}

uint64_t _xpc_bundle_deserialize()
{
  return 0;
}

uint64_t _xpc_bundle_wire_length()
{
  return -1;
}

void _xpc_bundle_dispose(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;

  v2 = *(void **)(a1 + 240);
  if (v2)
    xpc_release(v2);
  v3 = *(void **)(a1 + 248);
  if (v3)
    xpc_release(v3);
  v4 = *(NSObject **)(a1 + 264);
  if (v4)
    dispatch_release(v4);
  v5 = *(NSObject **)(a1 + 256);
  if (v5)
    dispatch_release(v5);
  free(*(void **)(a1 + 48));
  free(*(void **)(a1 + 56));
  free(*(void **)(a1 + 72));
  free(*(void **)(a1 + 64));
  free(*(void **)(a1 + 232));
}

char *xpc_bundle_copy_normalized_cryptex_path(const char *a1)
{
  const char *v2;

  v2 = _normalize_cryptex_path(a1);
  if (!v2)
    v2 = a1;
  return _xpc_strdup(v2);
}

const char *_normalize_cryptex_path(const char *a1)
{
  _BOOL4 has_prefix;
  uint64_t v4;
  const char *v5;

  if (_xpc_has_prefix(a1, "/private/preboot/Cryptexes/OS/"))
    return a1 + 29;
  has_prefix = _xpc_has_prefix(a1, "/System/Cryptexes/OS/");
  v4 = 20;
  if (!has_prefix)
    v4 = 0;
  v5 = &a1[v4];
  if (has_prefix)
    return v5;
  else
    return 0;
}

uint64_t xpc_bundle_create(const char *a1, unsigned int a2)
{
  char v2;
  uint64_t result;
  char *v4;

  v2 = a2;
  result = xpc_bundle_create_from_origin((a2 >> 1) & 1, a1);
  *(_BYTE *)(result + 296) |= 1u;
  if ((v2 & 4) != 0)
  {
    v4 = _xpc_asprintf("This platform does not support bundles in other platforms' formats.");
    _xpc_api_misuse(v4);
  }
  return result;
}

uint64_t xpc_bundle_create_from_origin(int a1, const char *a2)
{
  uint64_t v4;
  char *v5;
  char *v6;
  int v7;

  v4 = _xpc_base_create();
  *(_DWORD *)(v4 + 40) = a1;
  v5 = _xpc_strdup(a2);
  *(_QWORD *)(v4 + 48) = v5;
  if (v5[strlen(v5) - 1] == 47)
  {
    v6 = strrchr(v5, 47) + 2;
    do
    {
      v7 = *(v6 - 2);
      --v6;
    }
    while (v7 == 47);
    *v6 = 0;
  }
  return v4;
}

uint64_t xpc_bundle_create_main()
{
  uint64_t result;
  uint32_t bufsize;
  char buf[1024];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C874D8];
  bzero(buf, 0x400uLL);
  bufsize = 1024;
  _NSGetExecutablePath(buf, &bufsize);
  result = xpc_bundle_create_from_origin(1, buf);
  *(_BYTE *)(result + 296) |= 1u;
  return result;
}

void xpc_bundle_resolve(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4)
{
  NSObject *global_queue;

  global_queue = dispatch_get_global_queue(0, 0);
  xpc_bundle_resolve_on_queue(a1, a2, global_queue, a3, a4);
}

void xpc_bundle_resolve_on_queue(uint64_t a1, NSObject *a2, dispatch_object_t object, uint64_t a4, uint64_t a5)
{
  char *v9;

  if ((*(_BYTE *)(a1 + 296) & 8) != 0)
  {
    v9 = _xpc_asprintf("Attempt to resolve populated bundle.", a2, object);
    _xpc_api_misuse(v9);
  }
  *(_QWORD *)(a1 + 256) = object;
  dispatch_retain(object);
  *(_QWORD *)(a1 + 264) = a2;
  dispatch_retain(a2);
  *(_QWORD *)(a1 + 272) = a5;
  *(_QWORD *)(a1 + 280) = a4;
  _xpc_bundle_resolve(a1);
}

void _xpc_bundle_resolve(uint64_t a1)
{
  dispatch_once_t *v2;
  uint64_t v3;
  _QWORD block[5];

  v3 = *(_QWORD *)(a1 + 24);
  v2 = (dispatch_once_t *)(a1 + 24);
  block[4] = a1;
  block[0] = MEMORY[0x1E0C87450];
  block[1] = 0x40000000;
  block[2] = ___xpc_bundle_resolve_block_invoke;
  block[3] = &__block_descriptor_tmp_26_0;
  if (v3 != -1)
    dispatch_once(v2, block);
}

void xpc_bundle_populate(uint64_t a1, xpc_object_t object, void *a3)
{
  xpc_object_t v5;
  xpc_object_t v6;
  char *v7;

  if (*(_DWORD *)(a1 + 40) == 2)
  {
    v7 = _xpc_asprintf("Attempt to populate an unknown bundle type.", object);
    goto LABEL_12;
  }
  if (*(_QWORD *)(a1 + 256))
  {
    v7 = _xpc_asprintf("Attempt to populate a non-inert bundle.", object);
LABEL_12:
    _xpc_api_misuse(v7);
  }
  if (object)
    v5 = xpc_retain(object);
  else
    v5 = xpc_dictionary_create(0, 0, 0);
  *(_QWORD *)(a1 + 240) = v5;
  if (a3)
    v6 = xpc_retain(a3);
  else
    v6 = xpc_array_create(0, 0);
  *(_QWORD *)(a1 + 248) = v6;
  *(_BYTE *)(a1 + 296) |= 8u;
  _xpc_bundle_resolve(a1);
}

char *xpc_bundle_get_property(uint64_t a1, int a2)
{
  char *result;

  _xpc_bundle_resolve(a1);
  result = 0;
  switch(a2)
  {
    case 0:
      result = (char *)*(int *)(a1 + 40);
      break;
    case 1:
      result = *(char **)(a1 + 48);
      break;
    case 2:
      result = *(char **)(a1 + 64);
      break;
    case 3:
      result = *(char **)(a1 + 232);
      break;
    case 4:
      result = (char *)(a1 + 80);
      break;
    case 6:
      result = *(char **)(a1 + 288);
      break;
    case 7:
      result = *(char **)(a1 + 240);
      break;
    case 9:
      result = _xpc_bundle_variant_create_subpath(*(_BYTE **)(a1 + 64), *(_DWORD *)(a1 + 32), 5, 0);
      break;
    default:
      return result;
  }
  return result;
}

uint64_t xpc_bundle_get_path(uint64_t a1)
{
  return *(_QWORD *)(a1 + 48);
}

uint64_t xpc_bundle_get_executable_path(uint64_t a1)
{
  _xpc_bundle_resolve(a1);
  return *(_QWORD *)(a1 + 232);
}

void *xpc_bundle_copy_info_dictionary(uint64_t a1)
{
  void *result;

  _xpc_bundle_resolve(a1);
  result = *(void **)(a1 + 240);
  if (result)
  {
    xpc_retain(result);
    return *(void **)(a1 + 240);
  }
  return result;
}

uint64_t xpc_bundle_get_info_dictionary(uint64_t a1)
{
  _xpc_bundle_resolve(a1);
  return *(_QWORD *)(a1 + 240);
}

xpc_object_t xpc_bundle_get_xpcservice_dictionary(uint64_t a1)
{
  xpc_object_t result;
  xpc_object_t v3;

  _xpc_bundle_resolve(a1);
  result = *(xpc_object_t *)(a1 + 240);
  if (result)
  {
    result = xpc_dictionary_get_value(result, "XPCService");
    if (result)
    {
      v3 = result;
      if (xpc_get_type(result) == (xpc_type_t)OS_xpc_dictionary)
        return v3;
      else
        return 0;
    }
  }
  return result;
}

void *xpc_bundle_copy_services(uint64_t a1)
{
  void *result;

  _xpc_bundle_resolve(a1);
  result = *(void **)(a1 + 248);
  if (result)
  {
    xpc_retain(result);
    return *(void **)(a1 + 248);
  }
  return result;
}

char *xpc_bundle_copy_resource_path(uint64_t a1, const char *a2, const char *a3)
{
  const char *v6;

  _xpc_bundle_resolve(a1);
  v6 = *(const char **)(a1 + 72);
  if (v6)
    return _xpc_asprintf("%s/%s.%s", v6, a2, a3);
  else
    return 0;
}

void xpc_bundle_resolve_sync(uint64_t a1)
{
  if ((*(_BYTE *)(a1 + 296) & 1) == 0)
    _xpc_rich_error_serialize_cold_1();
  _xpc_bundle_resolve(a1);
}

uint64_t xpc_bundle_get_error(uint64_t a1)
{
  _xpc_bundle_resolve(a1);
  return *(unsigned int *)(a1 + 36);
}

void ___xpc_bundle_resolve_block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  char *v6;
  char *v7;
  unsigned int v8;
  int v9;
  uint64_t v10;
  char *v11;
  char *v12;
  _QWORD block[6];
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C874D8];
  v2 = *(_QWORD *)(a1 + 32);
  if ((*(_BYTE *)(v2 + 296) & 8) != 0)
  {
    *(_QWORD *)(v2 + 56) = _xpc_strdup(*(const char **)(v2 + 48));
    v6 = _xpc_strdup(*(const char **)(v2 + 48));
    v7 = strrchr(v6, 47);
    if (v7)
      *v7 = 0;
    if (*v6)
    {
      if (_xpc_has_suffix(v6, "/Contents/MacOS"))
      {
        v8 = 0;
LABEL_15:
        *(_DWORD *)(v2 + 32) = v8;
        free(v6);
        if (*(_DWORD *)(v2 + 40) == 1)
          v12 = _xpc_bundle_copy_container(v8, *(const char **)(v2 + 48));
        else
          v12 = _xpc_strdup(*(const char **)(v2 + 48));
        *(_QWORD *)(v2 + 64) = v12;
        _xpc_bundle_normalize_cryptex_path((const char **)(v2 + 64));
        if (!**(_BYTE **)(v2 + 64))
        {
          *(_QWORD *)(v2 + 288) = "invalid populated entry";
          v16 = 0;
          v17 = 0;
          v14 = 0;
          v15 = 0;
          if ((_dyld_get_image_uuid() & 1) == 0)
          {
            v16 = 0;
            v17 = 0;
          }
          if ((_dyld_get_shared_cache_uuid() & 1) != 0)
          {
            block[5] = 0;
            _dyld_get_shared_cache_range();
          }
          else
          {
            v14 = 0;
            v15 = 0;
          }
          _os_log_simple();
        }
        _xpc_bundle_resolve_executable(v2);
        v10 = *(_QWORD *)(a1 + 32);
        goto LABEL_26;
      }
      v11 = strrchr(v6, 47);
      if (v11)
        *v11 = 0;
      if (_xpc_has_suffix(v6, "/Versions"))
      {
        v8 = 1;
        goto LABEL_15;
      }
    }
    v8 = 2;
    goto LABEL_15;
  }
  v3 = *(void **)(a1 + 32);
  if ((*(_BYTE *)(v2 + 296) & 1) == 0)
  {
    xpc_retain(v3);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(NSObject **)(v4 + 256);
    block[0] = MEMORY[0x1E0C87450];
    block[1] = 0x40000000;
    block[2] = ___xpc_bundle_resolve_block_invoke_2;
    block[3] = &__block_descriptor_tmp_14;
    block[4] = v4;
    dispatch_async(v5, block);
    return;
  }
  v9 = _xpc_bundle_resolve_sync((uint64_t)v3);
  v10 = *(_QWORD *)(a1 + 32);
  *(_DWORD *)(v10 + 36) = v9;
LABEL_26:
  *(_BYTE *)(v10 + 296) |= 4u;
}

uint64_t _xpc_bundle_resolve_sync(uint64_t a1)
{
  char *v2;
  char **v3;
  uint64_t v4;
  const char *v5;
  char *v6;
  const char *v7;
  unsigned int v8;
  char *subpath;
  int *v10;
  int *v11;
  int *v12;
  void *v13;
  char *v14;
  char *v16;
  ssize_t v17;
  xpc_object_t v18;
  stat v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C874D8];
  v2 = _xpc_realpath(*(const char **)(a1 + 48));
  *(_QWORD *)(a1 + 56) = v2;
  v3 = (char **)(a1 + 56);
  if (v2)
    goto LABEL_2;
  v4 = *__error();
  if (*(_DWORD *)(a1 + 40) == 1)
  {
    v5 = (const char *)_dyld_shared_cache_real_path();
    if (v5)
    {
      v6 = _xpc_strdup(v5);
      *v3 = v6;
      if (v6)
      {
LABEL_2:
        v4 = 0;
LABEL_14:
        _xpc_bundle_normalize_cryptex_path((const char **)(a1 + 56));
        goto LABEL_15;
      }
    }
    else
    {
      *v3 = 0;
    }
    *(_QWORD *)&v19.st_dev = 0;
    v19.st_ino = 0;
    if ((_dyld_get_image_uuid() & 1) == 0)
    {
      *(_QWORD *)&v19.st_dev = 0;
      v19.st_ino = 0;
    }
    if ((_dyld_get_shared_cache_uuid() & 1) != 0)
      _dyld_get_shared_cache_range();
    _os_log_simple();
  }
  if (*v3)
    goto LABEL_14;
LABEL_15:
  if (!(_DWORD)v4)
  {
    if ((*(_BYTE *)(a1 + 296) & 0x10) != 0)
    {
      v8 = 2;
    }
    else
    {
      v7 = *(const char **)(a1 + 56);
      if (*(_DWORD *)(a1 + 40) == 1)
        v8 = _xpc_bundle_resolve_executable_variant(v7);
      else
        v8 = _xpc_bundle_resolve_path_variant(v7);
      if (v8 == 3)
        return 128;
    }
    *(_DWORD *)(a1 + 32) = v8;
    if (!_xpc_bundle_is_valid_variant(v8))
      _xpc_bundle_resolve_sync_cold_2();
    v4 = _xpc_bundle_resolve_root(a1);
    if (!(_DWORD)v4)
    {
      memset(&v19, 0, sizeof(v19));
      subpath = _xpc_bundle_variant_create_subpath(*(_BYTE **)(a1 + 64), *(_DWORD *)(a1 + 32), 1, 0);
      v10 = (int *)open(subpath, 0);
      if ((v10 & 0x80000000) != 0)
      {
        if (*__error() != 2 && *__error())
          _os_assumes_log();
        v4 = *__error();
        free(subpath);
        v14 = 0;
        v13 = 0;
        goto LABEL_34;
      }
      v11 = v10;
      if (!fstat((int)v10, &v19))
      {
        v16 = _xpc_realpath_fd((int)v11);
        if (v16)
        {
          v14 = v16;
          if (!_xpc_has_prefix(v16, *(char **)(a1 + 64)))
            *(_QWORD *)(a1 + 288) = "linked info.plist";
          v13 = malloc_type_malloc(v19.st_size, 0x7B8962CEuLL);
          if (v13)
          {
            v17 = read((int)v11, v13, v19.st_size);
            if (v17 == -1)
              _xpc_fd_desc_cold_1();
            if (v17 == v19.st_size)
            {
              v18 = xpc_create_from_plist((char *)v13, v17);
              *(_QWORD *)(a1 + 240) = v18;
              if (v18)
              {
                if (xpc_get_type(v18) == (xpc_type_t)OS_xpc_dictionary)
                {
                  v4 = 0;
                  goto LABEL_29;
                }
                xpc_release(*(xpc_object_t *)(a1 + 240));
                *(_QWORD *)(a1 + 240) = 0;
              }
              v4 = 109;
LABEL_29:
              free(subpath);
              _xpc_strict_close(v11);
LABEL_34:
              free(v14);
              free(v13);
              if (!(_DWORD)v4)
              {
                v4 = _xpc_bundle_resolve_executable(a1);
                if (!(_DWORD)v4)
                {
                  _xpc_bundle_resolve_services(a1);
                  _xpc_bundle_resolve_resources(a1);
                }
              }
              return v4;
            }
          }
          v12 = __error();
LABEL_28:
          v4 = *v12;
          goto LABEL_29;
        }
        if (*__error() == 2)
        {
          v13 = 0;
          v14 = 0;
          v4 = 128;
          goto LABEL_29;
        }
      }
      v12 = __error();
      v13 = 0;
      v14 = 0;
      goto LABEL_28;
    }
  }
  return v4;
}

void ___xpc_bundle_resolve_block_invoke_2(uint64_t a1)
{
  int v2;
  uint64_t v3;
  _QWORD *v4;
  NSObject *v5;
  _QWORD block[5];

  v2 = _xpc_bundle_resolve_sync(*(_QWORD *)(a1 + 32));
  v3 = *(_QWORD *)(a1 + 32);
  *(_DWORD *)(v3 + 36) = v2;
  *(_BYTE *)(v3 + 296) |= 4u;
  v4 = *(_QWORD **)(a1 + 32);
  xpc_retain(v4);
  v5 = v4[33];
  block[0] = MEMORY[0x1E0C87450];
  block[1] = 0x40000000;
  block[2] = ___xpc_bundle_invoke_callback_async_block_invoke;
  block[3] = &__block_descriptor_tmp_42_1;
  block[4] = v4;
  dispatch_async(v5, block);
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

uint64_t _xpc_bundle_resolve_executable(uint64_t a1)
{
  char *v2;
  char *subpath;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  char *v7;

  if ((*(_BYTE *)(a1 + 296) & 8) == 0)
  {
    v2 = _xpc_bundle_resolve_executable_name(*(const char **)(a1 + 64), *(xpc_object_t *)(a1 + 240));
    subpath = _xpc_bundle_variant_create_subpath(*(_BYTE **)(a1 + 64), *(_DWORD *)(a1 + 32), 0, (uint64_t)v2);
    v4 = _resolve_and_stat_path(subpath, (char **)(a1 + 232), 0, 0);
    if ((_DWORD)v4)
    {
      v5 = v4;
      if ((_DWORD)v4 != 2)
      {
        *(_QWORD *)(a1 + 288) = "failed to resolve executable";
        _dyld_get_image_uuid();
        if ((_dyld_get_shared_cache_uuid() & 1) != 0)
          _dyld_get_shared_cache_range();
        _os_log_simple();
        goto LABEL_19;
      }
      v6 = (const char *)_dyld_shared_cache_real_path();
      if (!v6 || (v7 = _xpc_strdup(v6)) == 0)
      {
        *(_QWORD *)(a1 + 232) = _xpc_strdup(subpath);
        *(_QWORD *)(a1 + 288) = "missing executable";
        _dyld_get_image_uuid();
        if ((_dyld_get_shared_cache_uuid() & 1) != 0)
          _dyld_get_shared_cache_range();
        _os_log_simple();
        v5 = 2;
        goto LABEL_19;
      }
      *(_QWORD *)(a1 + 232) = v7;
    }
    else if (!_xpc_has_prefix(*(const char **)(a1 + 232), *(char **)(a1 + 64)))
    {
      *(_QWORD *)(a1 + 288) = "linked executable";
      _dyld_get_image_uuid();
      if ((_dyld_get_shared_cache_uuid() & 1) != 0)
        _dyld_get_shared_cache_range();
      _os_log_simple();
    }
    _xpc_bundle_normalize_cryptex_path((const char **)(a1 + 232));
    v5 = 0;
LABEL_19:
    free(v2);
    free(subpath);
    return v5;
  }
  *(_QWORD *)(a1 + 232) = _xpc_strdup(*(const char **)(a1 + 48));
  _xpc_bundle_normalize_cryptex_path((const char **)(a1 + 232));
  return 0;
}

void _xpc_bundle_normalize_cryptex_path(const char **a1)
{
  char *v2;
  const char *v3;

  v2 = (char *)*a1;
  v3 = _normalize_cryptex_path(*a1);
  if (v3)
    *a1 = _xpc_strdup(v3);
  else
    v2 = 0;
  free(v2);
}

uint64_t _resolve_and_stat_path(const char *a1, char **a2, stat *a3, _BYTE *a4)
{
  uint64_t v8;
  int *v9;
  int *v10;
  char *v11;

  if (access(a1, 4))
    return *__error();
  v9 = (int *)open(a1, 0);
  if ((v9 & 0x80000000) != 0)
    return *__error();
  v10 = v9;
  if (a3 && fstat((int)v9, a3))
    goto LABEL_10;
  if (a4)
    *a4 = 0;
  v11 = _xpc_realpath_fd((int)v10);
  if (!v11)
  {
LABEL_10:
    v8 = *__error();
  }
  else
  {
    v8 = 0;
    *a2 = v11;
  }
  _xpc_strict_close(v10);
  return v8;
}

uint64_t _xpc_bundle_resolve_root(uint64_t a1)
{
  uint64_t v1;
  int v3;
  uint64_t v4;
  char *v5;
  char *v6;
  int v7;
  int v8;
  stat v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C874D8];
  v1 = *(_QWORD *)(a1 + 56);
  if (*(_BYTE *)v1 != 47 || !*(_BYTE *)(v1 + 1))
    return 22;
  v3 = *(_DWORD *)(a1 + 40);
  if (v3 != 1)
  {
    if (!v3)
    {
      v4 = _resolve_and_stat_path(*(const char **)(a1 + 56), (char **)(a1 + 64), (stat *)(a1 + 80), (_BYTE *)(a1 + 224));
      if ((_DWORD)v4)
      {
        *(_QWORD *)(a1 + 288) = "missing root";
        *(_QWORD *)&v10.st_dev = 0;
        v10.st_ino = 0;
        v11 = 0;
        v12 = 0;
        if ((_dyld_get_image_uuid() & 1) == 0)
        {
          *(_QWORD *)&v10.st_dev = 0;
          v10.st_ino = 0;
        }
        if ((_dyld_get_shared_cache_uuid() & 1) != 0)
        {
          _dyld_get_shared_cache_range();
        }
        else
        {
          v11 = 0;
          v12 = 0;
        }
        _os_log_simple();
      }
      else
      {
        _xpc_bundle_normalize_cryptex_path((const char **)(a1 + 64));
      }
      return v4;
    }
    memset(&v10, 0, sizeof(v10));
    if (stat(*(const char **)(a1 + 48), &v10))
      return *__error();
    *(_BYTE *)(a1 + 296) |= 2u;
    v7 = v10.st_mode & 0xF000;
    if (v7 == 0x8000)
    {
      v8 = 1;
      goto LABEL_32;
    }
    if (v7 == 0x4000)
    {
      v8 = 0;
LABEL_32:
      *(_DWORD *)(a1 + 40) = v8;
      return _xpc_bundle_resolve_root(a1);
    }
    return 22;
  }
  v5 = _xpc_bundle_copy_container(*(_DWORD *)(a1 + 32), (const char *)v1);
  v6 = v5;
  if (*v5)
  {
    v4 = _resolve_and_stat_path(v5, (char **)(a1 + 64), (stat *)(a1 + 80), (_BYTE *)(a1 + 224));
    if ((_DWORD)v4)
    {
      *(_QWORD *)(a1 + 288) = "missing root";
      *(_QWORD *)&v10.st_dev = 0;
      v10.st_ino = 0;
      v11 = 0;
      v12 = 0;
      if ((_dyld_get_image_uuid() & 1) == 0)
      {
        *(_QWORD *)&v10.st_dev = 0;
        v10.st_ino = 0;
      }
      if ((_dyld_get_shared_cache_uuid() & 1) != 0)
      {
        _dyld_get_shared_cache_range();
      }
      else
      {
        v11 = 0;
        v12 = 0;
      }
      _os_log_simple();
    }
    else
    {
      _xpc_bundle_normalize_cryptex_path((const char **)(a1 + 64));
    }
  }
  else
  {
    v4 = 128;
  }
  free(v6);
  return v4;
}

void _xpc_bundle_resolve_services(uint64_t a1)
{
  char *subpath;
  DIR *v3;
  DIR *v4;
  dirent *i;
  uint64_t d_name;
  char *v7;
  char *v8;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  NSObject *v12;

  *(_QWORD *)(a1 + 248) = xpc_array_create(0, 0);
  subpath = _xpc_bundle_variant_create_subpath(*(_BYTE **)(a1 + 64), *(_DWORD *)(a1 + 32), 2, 0);
  v3 = opendir(subpath);
  if (v3)
  {
    v4 = v3;
    for (i = readdir(v3); i; i = readdir(v4))
    {
      d_name = (uint64_t)i->d_name;
      if (_xpc_has_suffix(i->d_name, ".xpc"))
      {
        v7 = _xpc_bundle_variant_create_subpath(*(_BYTE **)(a1 + 64), *(_DWORD *)(a1 + 32), 2, d_name);
        v8 = _xpc_realpath(v7);
        free(v7);
        if (v8)
        {
          if (!_xpc_has_prefix(v8, *(char **)(a1 + 64)))
          {
            *(_QWORD *)(a1 + 288) = "linked xpc services";
            _dyld_get_image_uuid();
            if ((_dyld_get_shared_cache_uuid() & 1) != 0)
              _dyld_get_shared_cache_range();
            _os_log_simple();
          }
          v9 = xpc_bundle_create_from_origin(0, v8);
          if (v9)
          {
            v10 = (_QWORD *)v9;
            *(_BYTE *)(v9 + 296) = *(_BYTE *)(v9 + 296) & 0xFE | *(_BYTE *)(a1 + 296) & 1;
            v12 = *(NSObject **)(a1 + 256);
            v11 = *(NSObject **)(a1 + 264);
            v10[32] = v12;
            v10[33] = v11;
            if (v12)
            {
              dispatch_retain(v12);
              v11 = v10[33];
            }
            if (v11)
              dispatch_retain(v11);
            xpc_array_append_value(*(xpc_object_t *)(a1 + 248), v10);
            xpc_release(v10);
          }
          free(v8);
        }
      }
    }
    free(subpath);
    if (closedir(v4) == -1)
      _xpc_fd_desc_cold_1();
  }
  else
  {
    free(subpath);
  }
}

void _xpc_bundle_resolve_resources(uint64_t a1)
{
  char *subpath;
  char *v3;
  char *v4;

  subpath = _xpc_bundle_variant_create_subpath(*(_BYTE **)(a1 + 64), *(_DWORD *)(a1 + 32), 3, 0);
  v3 = subpath;
  if ((*(_BYTE *)(a1 + 296) & 8) != 0)
  {
    v4 = subpath;
  }
  else
  {
    v4 = _xpc_realpath(subpath);
    free(v3);
    if (!v4)
      return;
    if (!_xpc_has_prefix(v4, v4))
    {
      *(_QWORD *)(a1 + 288) = "linked resources";
      _dyld_get_image_uuid();
      if ((_dyld_get_shared_cache_uuid() & 1) != 0)
        _dyld_get_shared_cache_range();
      _os_log_simple();
    }
  }
  *(_QWORD *)(a1 + 72) = v4;
}

void ___xpc_bundle_invoke_callback_async_block_invoke(uint64_t a1)
{
  (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 272))(*(_QWORD *)(a1 + 32), *(unsigned int *)(*(_QWORD *)(a1 + 32) + 36), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 280));
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

uint64_t xpc_inspect_copy_description_local()
{
  return 0;
}

uint64_t xpc_inspect_copy_short_description_local()
{
  return 0;
}

uint64_t xpc_inspect_copy_description()
{
  return 0;
}

uint64_t xpc_inspect_copy_short_description()
{
  return 0;
}

uint64_t xpc_is_kind_of_xpc_object4NSXPC()
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

char *_xpc_copy_nsobject_debug_description(void *a1)
{
  void *v2;
  const char *v3;
  char *v4;

  v2 = (void *)MEMORY[0x1DF0F0FC8]();
  v3 = (const char *)objc_msgSend((id)objc_msgSend(a1, "debugDescription"), "UTF8String");
  if (v3)
    v4 = _xpc_strdup(v3);
  else
    v4 = 0;
  objc_autoreleasePoolPop(v2);
  return v4;
}

id _xpc_payload_alloc(uint64_t a1)
{
  size_t v1;
  objc_class *v2;

  v1 = a1 - 8;
  v2 = (objc_class *)objc_opt_class();
  return class_createInstance(v2, v1);
}

uint64_t _xpc_os_transaction_alloc()
{
  objc_opt_class();
  return _os_object_alloc();
}

uint64_t _xpc_event_publisher_alloc()
{
  objc_opt_class();
  return _os_object_alloc();
}

uint64_t _xpc_listener_alloc()
{
  objc_opt_class();
  return _os_object_alloc();
}

uint64_t _xpc_session_alloc()
{
  objc_opt_class();
  return _os_object_alloc();
}

BOOL _xpc_file_transfer_equal(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t _xpc_file_transfer_desc(uint64_t a1, uint64_t a2)
{
  const char *v3;
  unsigned int v4;
  int v5;
  char __str[16];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C874D8];
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  *(_OWORD *)__str = 0u;
  v8 = 0u;
  v3 = "YES";
  if (!*(_QWORD *)(a1 + 72))
    v3 = "NO";
  v4 = snprintf(__str, 0x80uLL, "<%s> { id = %lld, state = %d, transaction = %s }", "file transfer", *(_QWORD *)(a1 + 24), *(_DWORD *)(a1 + 88), v3);
  if (v4 >= 0x7F)
    v5 = 127;
  else
    v5 = v4;
  return _xpc_serializer_append(a2, __str, (v5 + 1), 0);
}

uint64_t _xpc_file_transfer_debug_desc(uint64_t a1, uint64_t a2)
{
  const char *v3;
  unsigned int v4;
  int v5;
  char __str[16];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C874D8];
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  *(_OWORD *)__str = 0u;
  v8 = 0u;
  v3 = "YES";
  if (!*(_QWORD *)(a1 + 72))
    v3 = "NO";
  v4 = snprintf(__str, 0x80uLL, "<%s: %p> { id = %lld, state = %d, transaction = %s }", "file transfer", (const void *)a1, *(_QWORD *)(a1 + 24), *(_DWORD *)(a1 + 88), v3);
  if (v4 >= 0x7F)
    v5 = 127;
  else
    v5 = v4;
  return _xpc_serializer_append(a2, __str, (v5 + 1), 0);
}

uint64_t _xpc_file_transfer_debug()
{
  return 0;
}

uint64_t _xpc_file_transfer_serialize(uint64_t a1, uint64_t a2)
{
  unint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  int v10;
  int *extension_vtable;
  unint64_t v12;
  uint64_t v15;
  uint64_t result;
  char *v17;
  uint64_t v18;
  int __src;

  if (*(_DWORD *)(a1 + 88))
    _xpc_mach_message_request_handoff_reply_cold_1();
  *(_DWORD *)(a1 + 88) = 1;
  *(_QWORD *)(a1 + 72) = os_transaction_create("com.apple.xpc.file_transfer.outgoing");
  __src = 106496;
  _xpc_serializer_append(a2, &__src, 4uLL, 1);
  if (!*(_QWORD *)(a1 + 24))
    _xpc_mach_message_request_handoff_reply_cold_1();
  v18 = *(_QWORD *)(a1 + 24);
  _xpc_serializer_append(a2, &v18, 8uLL, 1);
  v4 = *(unint64_t **)(a1 + 32);
  if (((unint64_t)v4 & 0x8000000000000000) != 0)
  {
    v5 = 0;
    v6 = *MEMORY[0x1E0DE7C58];
    if ((~(unint64_t)v4 & 0xC000000000000007) == 0)
      v6 = 0;
    v7 = v6 ^ (unint64_t)v4;
    do
    {
      if ((v7 & 7) == *(_BYTE *)(MEMORY[0x1E0DE7C48] + v5))
        break;
      ++v5;
    }
    while (v5 != 7);
    v8 = v5 | v7;
    v9 = v5 & 7;
    v10 = (v8 >> 55) + 8;
    if (v9 == 7)
      LODWORD(v9) = v10;
    if ((_DWORD)v9 == 12)
    {
      extension_vtable = &_OS_xpc_type_uint64;
    }
    else
    {
      if ((_DWORD)v9 != 13)
      {
        v17 = _xpc_asprintf("Object is not an XPC object");
        _xpc_api_misuse(v17);
      }
      extension_vtable = &_OS_xpc_type_int64;
    }
  }
  else
  {
    v12 = *v4;
    if (*v4 >= (unint64_t)OBJC_CLASS___OS_xpc_object
      && v12 <= (unint64_t)OS_xpc_rich_error
      && (*v4 & 7) == 0)
    {
      extension_vtable = (int *)((char *)&_xpc_vtables + 2 * (v12 - (_QWORD)OBJC_CLASS___OS_xpc_object));
    }
    else
    {
      extension_vtable = _xpc_get_extension_vtable(*(id *)(a1 + 32));
    }
  }
  (*((void (**)(unint64_t *, uint64_t))extension_vtable + 9))(v4, a2);
  v15 = *(_QWORD *)(a2 + 104);
  if (!v15)
    _xpc_mach_message_request_handoff_reply_cold_1();
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 16))(v15, a1);
  if ((result & 1) == 0)
    _xpc_mach_message_request_handoff_reply_cold_1();
  return result;
}

uint64_t _xpc_file_transfer_deserialize(uint64_t a1)
{
  uint64_t voucher;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  int *v7;
  int v8;
  BOOL v9;
  int depth;
  uint64_t (*v11)(uint64_t);
  uint64_t v12;

  voucher = _xpc_message_request_get_voucher(a1);
  if (!voucher)
    return 0;
  v3 = voucher;
  v4 = (uint64_t *)_xpc_graph_deserializer_read(a1, 8uLL);
  if (!v4)
    return 0;
  v5 = *v4;
  if (!*v4)
    return 0;
  v6 = _xpc_file_transfer_create();
  *(_QWORD *)(v6 + 24) = v5;
  v7 = (int *)_xpc_graph_deserializer_read(a1, 4uLL);
  if (!v7
    || (v8 = *v7, v9 = _xpc_class_id_valid(*v7), v8 != 61440)
    || !v9
    || (depth = _xpc_graph_deserializer_get_depth(a1), !_xpc_graph_deserializer_enter_container(a1))
    || (v11 = (uint64_t (*)(uint64_t))_xpc_deserialize_from_wire_id(0xF000u),
        v12 = v11(a1),
        _xpc_graph_deserializer_restore_depth(a1, depth),
        !v12))
  {
    xpc_release((xpc_object_t)v6);
    return 0;
  }
  if (xpc_dictionary_get_count(*(xpc_object_t *)(v6 + 32)))
    _xpc_serializer_pack_cold_3();
  xpc_release(*(xpc_object_t *)(v6 + 32));
  *(_QWORD *)(v6 + 32) = v12;
  (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, v6);
  return v6;
}

uint64_t _xpc_file_transfer_wire_length()
{
  return -1;
}

void _xpc_file_transfer_dispose(uint64_t a1)
{
  const void *v2;
  const void *v3;
  const void *v4;
  void (**v5)(_QWORD, _QWORD);
  NSObject *v6;

  if (*(_DWORD *)(a1 + 88) == 1)
    _xpc_mach_message_request_handoff_reply_cold_1();
  v2 = *(const void **)(a1 + 64);
  if (v2)
    _Block_release(v2);
  v3 = *(const void **)(a1 + 56);
  if (v3)
    _Block_release(v3);
  v4 = *(const void **)(a1 + 40);
  if (v4)
    _Block_release(v4);
  v5 = *(void (***)(_QWORD, _QWORD))(a1 + 48);
  if (v5)
  {
    if (!*(_DWORD *)(a1 + 88))
    {
      v5[2](v5, *(_QWORD *)(a1 + 24));
      v5 = *(void (***)(_QWORD, _QWORD))(a1 + 48);
    }
    _Block_release(v5);
  }
  v6 = *(NSObject **)(a1 + 80);
  if (v6)
  {
    dispatch_io_close(v6, 0);
    dispatch_release(*(dispatch_object_t *)(a1 + 80));
  }
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

uint64_t xpc_file_transfer_create_with_fd(int a1, const void *a2)
{
  int v4;
  stat v6;

  memset(&v6, 0, sizeof(v6));
  if (fstat(a1, &v6) == -1)
    xpc_file_transfer_create_with_fd_cold_1();
  v4 = v6.st_mode & 0xF000;
  if (v4 == 4096 || v4 == 49152 || v4 == 0x8000)
    return _xpc_file_transfer_create_with_fd_impl(a1, (uint64_t)&v6, a2);
  else
    return 0;
}

uint64_t _xpc_file_transfer_create_with_fd_impl(dispatch_fd_t a1, uint64_t a2, const void *a3)
{
  int v6;
  uint64_t v7;
  uint64_t v8;

  v6 = *(_WORD *)(a2 + 4) & 0xF000;
  if (v6 != 4096 && v6 != 0x8000 && v6 != 49152)
    _xpc_file_transfer_create_with_fd_impl_cold_1();
  v7 = _xpc_file_transfer_create();
  *(_QWORD *)(v7 + 56) = _Block_copy(a3);
  *(_DWORD *)(v7 + 16) |= 2u;
  if ((*(_WORD *)(a2 + 4) & 0xF000) == 0x8000)
    v8 = *(_QWORD *)(a2 + 96);
  else
    v8 = -1;
  xpc_dictionary_set_uint64(*(xpc_object_t *)(v7 + 32), "s", v8);
  *(_QWORD *)(v7 + 80) = _xpc_file_transfer_create_io_for_fd(v7, a1);
  return v7;
}

uint64_t xpc_file_transfer_create_with_path(const char *a1, const void *a2)
{
  int *v3;
  int *v4;
  stat v6;

  v3 = (int *)open(a1, 0);
  if ((_DWORD)v3 != -1)
  {
    v4 = v3;
    memset(&v6, 0, sizeof(v6));
    if (fstat((int)v3, &v6) == -1)
      xpc_file_transfer_create_with_fd_cold_1();
    if ((v6.st_mode & 0xF000) == 0x8000)
      return _xpc_file_transfer_create_with_fd_impl((dispatch_fd_t)v4, (uint64_t)&v6, a2);
    _xpc_strict_close(v4);
  }
  return 0;
}

void xpc_file_transfer_cancel(void *a1)
{
  if (xpc_get_type(a1) == (xpc_type_t)OS_xpc_file_transfer)
  {
    _os_crash();
    __break(1u);
  }
  _xpc_api_misuse("Given object not of required type.");
}

uint64_t xpc_file_transfer_get_size(xpc_object_t *a1)
{
  if (xpc_get_type(a1) != (xpc_type_t)OS_xpc_file_transfer)
    _xpc_api_misuse("Given object not of required type.");
  return xpc_dictionary_get_uint64(a1[4], "s");
}

uint64_t xpc_file_transfer_write_to_fd(void *a1, dispatch_fd_t a2, const void *a3)
{
  if (xpc_get_type(a1) != (xpc_type_t)OS_xpc_file_transfer)
    _xpc_api_misuse("Given object not of required type.");
  return _xpc_file_transfer_write_to_fd_impl((uint64_t)a1, a2, a3);
}

uint64_t _xpc_file_transfer_write_to_fd_impl(uint64_t a1, dispatch_fd_t a2, const void *a3)
{
  if (*(_DWORD *)(a1 + 88))
    _xpc_mach_message_request_handoff_reply_cold_1();
  *(_DWORD *)(a1 + 88) = 1;
  *(_QWORD *)(a1 + 72) = os_transaction_create("com.apple.xpc.file_transfer.incoming");
  if (!a3)
    _xpc_mach_message_request_handoff_reply_cold_1();
  *(_QWORD *)(a1 + 64) = _Block_copy(a3);
  *(_QWORD *)(a1 + 80) = _xpc_file_transfer_create_io_for_fd(a1, a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t xpc_file_transfer_write_to_path(void *a1, const char *a2, uint64_t (**a3)(_QWORD, _QWORD))
{
  dispatch_fd_t v6;
  uint64_t v8;

  if (xpc_get_type(a1) != (xpc_type_t)OS_xpc_file_transfer)
    _xpc_api_misuse("Given object not of required type.");
  v6 = open(a2, 2561, 438);
  if (v6 != -1)
    return _xpc_file_transfer_write_to_fd_impl((uint64_t)a1, v6, a3);
  if (!*__error())
    _xpc_mach_message_request_handoff_reply_cold_1();
  v8 = *__error();
  return a3[2](a3, v8);
}

dispatch_object_t xpc_file_transfer_copy_io(dispatch_object_t *a1)
{
  if (xpc_get_type(a1) != (xpc_type_t)OS_xpc_file_transfer)
    _xpc_api_misuse("Given object not of required type.");
  dispatch_retain(a1[10]);
  return a1[10];
}

uint64_t xpc_file_transfer_get_transfer_id(_QWORD *a1)
{
  if (xpc_get_type(a1) != (xpc_type_t)OS_xpc_file_transfer)
    _xpc_api_misuse("Given object not of required type.");
  return a1[3];
}

void *xpc_file_transfer_set_transport_writing_callbacks(uint64_t a1, const void *a2, const void *a3)
{
  void *result;

  if (xpc_get_type((xpc_object_t)a1) != (xpc_type_t)OS_xpc_file_transfer)
    _xpc_api_misuse("Given object not of required type.");
  if (*(_DWORD *)(a1 + 88))
    _xpc_mach_message_request_handoff_reply_cold_1();
  if (*(_QWORD *)(a1 + 40))
    _xpc_mach_message_request_handoff_reply_cold_1();
  if (*(_QWORD *)(a1 + 48))
    _xpc_mach_message_request_handoff_reply_cold_1();
  *(_QWORD *)(a1 + 40) = _Block_copy(a2);
  result = _Block_copy(a3);
  *(_QWORD *)(a1 + 48) = result;
  return result;
}

void xpc_file_transfer_write_finished(uint64_t a1, NSObject *a2, int a3)
{
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  int v9;

  if (xpc_get_type((xpc_object_t)a1) != (xpc_type_t)OS_xpc_file_transfer)
    _xpc_api_misuse("Given object not of required type.");
  if (*(_DWORD *)(a1 + 88) != 1)
    _xpc_mach_message_request_handoff_reply_cold_1();
  *(_DWORD *)(a1 + 88) = 2;
  v6 = *(_QWORD *)(a1 + 64);
  if (v6)
  {
    if (!a2)
      _xpc_mach_message_request_handoff_reply_cold_1();
    v8[0] = MEMORY[0x1E0C87450];
    v8[1] = 0x40000000;
    v8[2] = __xpc_file_transfer_write_finished_block_invoke;
    v8[3] = &unk_1EA959478;
    v8[4] = v6;
    v9 = a3;
    dispatch_async(a2, v8);
    *(_QWORD *)(a1 + 64) = 0;
  }
  v7 = *(void **)(a1 + 72);
  if (!v7)
    _xpc_mach_message_request_handoff_reply_cold_1();
  os_release(v7);
  *(_QWORD *)(a1 + 72) = 0;
}

void __xpc_file_transfer_write_finished_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
}

void xpc_file_transfer_send_finished(uint64_t a1, NSObject *a2, int a3)
{
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  int v9;

  if (xpc_get_type((xpc_object_t)a1) != (xpc_type_t)OS_xpc_file_transfer)
    _xpc_api_misuse("Given object not of required type.");
  if (*(_DWORD *)(a1 + 88) != 1)
    _xpc_mach_message_request_handoff_reply_cold_1();
  *(_DWORD *)(a1 + 88) = 2;
  v6 = *(_QWORD *)(a1 + 56);
  if (v6)
  {
    if (!a2)
      _xpc_mach_message_request_handoff_reply_cold_1();
    v8[0] = MEMORY[0x1E0C87450];
    v8[1] = 0x40000000;
    v8[2] = __xpc_file_transfer_send_finished_block_invoke;
    v8[3] = &unk_1EA9594A0;
    v8[4] = v6;
    v9 = a3;
    dispatch_async(a2, v8);
    *(_QWORD *)(a1 + 56) = 0;
  }
  v7 = *(void **)(a1 + 72);
  if (!v7)
    _xpc_mach_message_request_handoff_reply_cold_1();
  os_release(v7);
  *(_QWORD *)(a1 + 72) = 0;
}

void __xpc_file_transfer_send_finished_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
}

uint64_t _xpc_file_transfer_create()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  v0 = _xpc_base_create();
  v1 = v0;
  do
    v2 = __ldxr(&_file_transfer_id_last);
  while (__stxr(v2 + 1, &_file_transfer_id_last));
  *(_QWORD *)(v0 + 24) = v2 + 1;
  if (v2 == -1)
    _xpc_mach_message_request_handoff_reply_cold_1();
  *(_QWORD *)(v0 + 32) = xpc_dictionary_create(0, 0, 0);
  return v1;
}

dispatch_io_t _xpc_file_transfer_create_io_for_fd(uint64_t a1, dispatch_fd_t a2)
{
  NSObject *global_queue;
  dispatch_io_t result;
  _QWORD cleanup_handler[5];
  dispatch_fd_t v6;
  int v7;
  uint64_t v8;

  v8 = a1;
  v7 = 0;
  if (change_fdguard_np() == -1)
    xpc_file_transfer_create_with_fd_cold_1();
  global_queue = dispatch_get_global_queue(0, 0);
  cleanup_handler[0] = MEMORY[0x1E0C87450];
  cleanup_handler[1] = 0x40000000;
  cleanup_handler[2] = ___xpc_file_transfer_create_io_for_fd_block_invoke;
  cleanup_handler[3] = &__block_descriptor_tmp_14_0;
  v6 = a2;
  cleanup_handler[4] = v8;
  result = dispatch_io_create(0, a2, global_queue, cleanup_handler);
  if (!result)
    _xpc_mach_message_request_handoff_reply_cold_1();
  return result;
}

uint64_t ___xpc_file_transfer_create_io_for_fd_block_invoke()
{
  uint64_t result;

  result = guarded_close_np();
  if ((_DWORD)result == -1)
    xpc_file_transfer_create_with_fd_cold_1();
  return result;
}

uint64_t OUTLINED_FUNCTION_1()
{
  return _os_assert_log();
}

char *xpc_strerror(int a1)
{
  if ((a1 - 107) > 0x38)
    return strerror(a1);
  else
    return (char *)*(&_errors + (a1 - 106));
}

int64_t launch_service_stats_enable(const char *a1, unsigned int a2)
{
  xpc_object_t v4;
  int64_t v5;
  xpc_object_t object;

  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v4, "monitor_id", a1);
  xpc_dictionary_set_uint64(v4, "capacity", a2);
  object = 0;
  v5 = _xpc_bootstrap_routine(905, v4, &object);
  if (object)
    xpc_release(object);
  xpc_release(v4);
  return v5;
}

int64_t launch_service_stats_disable(const char *a1)
{
  xpc_object_t v2;
  int64_t v3;
  xpc_object_t object;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, "monitor_id", a1);
  object = 0;
  v3 = _xpc_bootstrap_routine(906, v2, &object);
  if (object)
    xpc_release(object);
  xpc_release(v2);
  return v3;
}

BOOL launch_service_stats_is_enabled(const char *a1)
{
  xpc_object_t v2;
  _BOOL8 v3;
  xpc_object_t xdict;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, "monitor_id", a1);
  xdict = 0;
  if (_xpc_bootstrap_routine(903, v2, &xdict))
    v3 = 0;
  else
    v3 = xpc_dictionary_get_BOOL(xdict, "enabled");
  if (xdict)
    xpc_release(xdict);
  xpc_release(v2);
  return v3;
}

int64_t _launch_service_stats_copy_impl(const char *a1, unsigned int a2, uint64_t a3, int a4)
{
  size_t v6;
  uint64_t v7;
  char *purgable_buffer;
  xpc_object_t v9;
  xpc_object_t v10;
  int64_t v11;
  xpc_object_t value;
  uint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  char *v18;
  xpc_object_t xdict;

  if (!a3)
    _xpc_rich_error_serialize_cold_1();
  if ((a4 - 2) >= 4)
  {
    v18 = _xpc_asprintf("Unsupported service stats version %d", a4);
    _xpc_api_misuse(v18);
  }
  v6 = qword_1DEEBD340[a4 - 2];
  v7 = (*MEMORY[0x1E0C88820] + 51 * a2 - 1) & -*MEMORY[0x1E0C88820];
  purgable_buffer = (char *)_xpc_allocate_purgable_buffer(v7);
  v9 = xpc_shmem_create(purgable_buffer, v7);
  v10 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v10, "monitor_id", a1);
  xpc_dictionary_set_value(v10, "shmem", v9);
  xpc_release(v9);
  xdict = 0;
  v11 = _xpc_bootstrap_routine(902, v10, &xdict);
  if (!(_DWORD)v11)
  {
    *(_DWORD *)(a3 + 16) = xpc_dictionary_get_uint64(xdict, "count");
    *(_DWORD *)(a3 + 20) = xpc_dictionary_get_uint64(xdict, "dropped-count");
    value = xpc_dictionary_get_value(xdict, "labels");
    *(_QWORD *)a3 = value;
    if (value)
      xpc_retain(value);
    v13 = *(unsigned int *)(a3 + 16);
    if ((_DWORD)v13)
    {
      v14 = (char *)_xpc_alloc(v6 * v13);
      v15 = v14;
      v16 = purgable_buffer;
      do
      {
        memcpy(v15, v16, v6);
        v16 += 51;
        v15 += v6;
        --v13;
      }
      while (v13);
      *(_QWORD *)(a3 + 8) = v14;
    }
  }
  if (xdict)
    xpc_release(xdict);
  xpc_release(v10);
  _xpc_deallocate_purgable_buffer(purgable_buffer, v7);
  return v11;
}

int64_t launch_service_stats_enable_4ppse()
{
  return launch_service_stats_enable("com.apple.launchd.service-stats-default", 0x1000u);
}

int64_t launch_service_stats_disable_4ppse()
{
  return launch_service_stats_disable("com.apple.launchd.service-stats-default");
}

BOOL launch_service_stats_is_enabled_4ppse()
{
  return launch_service_stats_is_enabled("com.apple.launchd.service-stats-default");
}

int64_t _launch_service_stats_copy_4ppse_impl(uint64_t a1, int a2)
{
  return _launch_service_stats_copy_impl("com.apple.launchd.service-stats-default", 0x1000u, a1, a2);
}

BOOL _xpc_service_instance_equal(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t _xpc_service_instance_desc(_DWORD *a1, uint64_t a2)
{
  unsigned int v3;
  int v4;
  char __str[16];
  __int128 v7;
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
  uint64_t v38;

  v38 = *MEMORY[0x1E0C874D8];
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
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
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  *(_OWORD *)__str = 0u;
  v7 = 0u;
  v3 = snprintf(__str, 0x200uLL, "<%s: %p> { pid = %d }", "service", a1, a1[10]);
  if (v3 >= 0x1FF)
    v4 = 511;
  else
    v4 = v3;
  return _xpc_serializer_append(a2, __str, (v4 + 1), 0);
}

uint64_t _xpc_service_instance_debug()
{
  return 0;
}

uint64_t _xpc_service_instance_deserialize()
{
  return 0;
}

uint64_t _xpc_service_instance_wire_length()
{
  return -1;
}

void _xpc_service_instance_dispose(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void (*v8)(_QWORD);

  v2 = *(NSObject **)(a1 + 32);
  if (v2)
    dispatch_release(v2);
  free(*(void **)(a1 + 72));
  v3 = *(void **)(a1 + 80);
  if (v3)
    xpc_release(v3);
  v4 = *(void **)(a1 + 56);
  if (v4)
    xpc_release(v4);
  free(*(void **)(a1 + 88));
  v5 = *(void **)(a1 + 64);
  if (v5)
    xpc_release(v5);
  v6 = *(void **)(a1 + 96);
  if (v6)
    xpc_release(v6);
  v7 = *(void **)(a1 + 120);
  if (v7)
    xpc_release(v7);
  v8 = *(void (**)(_QWORD))(a1 + 136);
  if (v8)
    v8(*(_QWORD *)(a1 + 128));
}

void xpc_service_instance_set_path(uint64_t a1, const char *a2)
{
  unint64_t *v2;
  char *v3;
  void *v4;
  char *v5;

  if (!*(_BYTE *)(a1 + 49))
  {
    v5 = _xpc_asprintf("Attempt to configure non-configurable service instance.");
    goto LABEL_10;
  }
  if (!*(_QWORD *)(a1 + 120))
  {
    v5 = _xpc_asprintf("Attempt to configure a service after it has been run.");
LABEL_10:
    _xpc_api_misuse(v5);
  }
  v2 = (unint64_t *)(a1 + 72);
  v3 = _xpc_strdup(a2);
  do
    v4 = (void *)__ldxr(v2);
  while (__stlxr((unint64_t)v3, v2));
  if (v4)
    free(v4);
}

uint64_t xpc_service_instance_set_start_suspended(uint64_t result)
{
  *(_BYTE *)(result + 48) = 1;
  return result;
}

void xpc_service_instance_set_environment(uint64_t a1, xpc_object_t object)
{
  unint64_t *v2;
  xpc_object_t v3;
  void *v4;
  char *v5;

  if (!*(_BYTE *)(a1 + 49))
  {
    v5 = _xpc_asprintf("Attempt to configure non-configurable service instance.", object);
    goto LABEL_10;
  }
  if (!*(_QWORD *)(a1 + 120))
  {
    v5 = _xpc_asprintf("Attempt to configure a service after it has been run.", object);
LABEL_10:
    _xpc_api_misuse(v5);
  }
  v2 = (unint64_t *)(a1 + 56);
  v3 = xpc_retain(object);
  do
    v4 = (void *)__ldxr(v2);
  while (__stlxr((unint64_t)v3, v2));
  if (v4)
    xpc_release(v4);
}

uint64_t xpc_service_instance_set_binpref(uint64_t result, int a2)
{
  *(_DWORD *)(result + 28) = a2;
  return result;
}

void xpc_service_instance_dup2(uint64_t a1, int a2, int a3)
{
  char *v3;
  uint64_t v4;
  int v5;
  int v6;

  if (!*(_BYTE *)(a1 + 49))
  {
    v3 = _xpc_asprintf("Attempt to configure non-configurable service instance.");
    goto LABEL_6;
  }
  if (!*(_QWORD *)(a1 + 120))
  {
    v3 = _xpc_asprintf("Attempt to configure a service after it has been run.");
LABEL_6:
    _xpc_api_misuse(v3);
  }
  v4 = a1;
  v5 = a2;
  v6 = a3;
  dispatch_sync_f(*(dispatch_queue_t *)(a1 + 32), &v4, (dispatch_function_t)_xpc_service_instance_dup2_insert);
}

void _xpc_service_instance_dup2_insert(_DWORD *a1)
{
  uint64_t v1;
  int v2;
  int64_t v3;
  xpc_object_t v4;

  v1 = *(_QWORD *)a1;
  v2 = a1[2];
  v3 = (int)a1[3];
  v4 = *(xpc_object_t *)(*(_QWORD *)a1 + 64);
  if (!v4)
  {
    v4 = xpc_array_create(0, 0);
    *(_QWORD *)(v1 + 64) = v4;
  }
  xpc_array_set_fd(v4, 0xFFFFFFFFFFFFFFFFLL, v2);
  xpc_array_set_int64(*(xpc_object_t *)(v1 + 64), 0xFFFFFFFFFFFFFFFFLL, v3);
}

void xpc_service_instance_set_cwd(uint64_t a1, const char *a2)
{
  unint64_t *v2;
  char *v3;
  void *v4;
  char *v5;

  if (!*(_BYTE *)(a1 + 49))
  {
    v5 = _xpc_asprintf("Attempt to configure non-configurable service instance.");
    goto LABEL_10;
  }
  if (!*(_QWORD *)(a1 + 120))
  {
    v5 = _xpc_asprintf("Attempt to configure a service after it has been run.");
LABEL_10:
    _xpc_api_misuse(v5);
  }
  v2 = (unint64_t *)(a1 + 88);
  v3 = _xpc_strdup(a2);
  do
    v4 = (void *)__ldxr(v2);
  while (__stlxr((unint64_t)v3, v2));
  if (v4)
    free(v4);
}

void xpc_service_instance_set_endpoint(uint64_t a1, xpc_object_t object)
{
  unint64_t *v3;
  xpc_object_t v4;
  unint64_t v5;
  char *v6;

  if (!*(_BYTE *)(a1 + 49))
  {
    v6 = _xpc_asprintf("Attempt to configure non-configurable service instance.", object);
    goto LABEL_10;
  }
  if (!*(_QWORD *)(a1 + 120))
  {
    v6 = _xpc_asprintf("Attempt to configure a service after it has been run.", object);
LABEL_10:
    _xpc_api_misuse(v6);
  }
  v3 = (unint64_t *)(a1 + 96);
  v4 = xpc_retain(object);
  do
    v5 = __ldxr(v3);
  while (__stlxr((unint64_t)v4, v3));
  if (v5)
    xpc_release(object);
}

_DWORD *xpc_service_instance_set_jetsam_properties(_DWORD *result, int a2, int a3, int a4)
{
  result[26] = a2;
  result[27] = a3;
  if (!a4)
  {
    a4 = -1;
    goto LABEL_5;
  }
  if (a4 >= 1)
LABEL_5:
    result[28] = a4;
  return result;
}

uint64_t xpc_service_instance_set_context(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t (*v4)(uint64_t);

  v3 = result;
  v4 = *(uint64_t (**)(uint64_t))(result + 136);
  if (v4)
    result = v4(a2);
  *(_QWORD *)(v3 + 128) = a2;
  return result;
}

uint64_t xpc_service_instance_set_finalizer_f(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 136) = a2;
  return result;
}

uint64_t xpc_service_instance_get_type(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

uint64_t xpc_service_instance_get_pid(uint64_t a1)
{
  return *(unsigned int *)(a1 + 40);
}

uint64_t xpc_service_instance_get_host_pid(uint64_t a1)
{
  return *(unsigned int *)(a1 + 44);
}

uint64_t xpc_service_instance_get_context(uint64_t a1)
{
  return *(_QWORD *)(a1 + 128);
}

uint64_t xpc_service_instance_is_configurable(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 49);
}

void xpc_service_instance_run(uint64_t a1)
{
  unint64_t *v2;
  char *v3;
  unint64_t *v4;
  void *v5;
  unint64_t *v6;
  char *v7;
  unint64_t *v8;
  void *v9;
  unint64_t *v10;
  uint64_t v11;
  unsigned int *v12;
  signed int v13;
  unsigned int *v14;
  unsigned int v15;
  unsigned int *v16;
  signed int v17;
  uint64_t v18;
  mach_port_name_t listener_port;
  int v20;
  int v21;
  char *v22;
  char *v23;
  xpc_object_t object;

  if (!*(_BYTE *)(a1 + 49))
  {
    v23 = _xpc_asprintf("This SPI may not be called on non-configurable services.");
    _xpc_api_misuse(v23);
  }
  v2 = (unint64_t *)(a1 + 72);
  do
    v3 = (char *)__ldxr(v2);
  while (__stxr(0, v2));
  v4 = (unint64_t *)(a1 + 56);
  do
    v5 = (void *)__ldxr(v4);
  while (__stxr(0, v4));
  v6 = (unint64_t *)(a1 + 88);
  do
    v7 = (char *)__ldxr(v6);
  while (__stxr(0, v6));
  v8 = (unint64_t *)(a1 + 64);
  do
    v9 = (void *)__ldxr(v8);
  while (__stxr(0, v8));
  v10 = (unint64_t *)(a1 + 96);
  do
    v11 = __ldxr(v10);
  while (__stxr(0, v10));
  v12 = (unsigned int *)(a1 + 104);
  do
    v13 = __ldxr(v12);
  while (__stxr(0, v12));
  v14 = (unsigned int *)(a1 + 108);
  do
    v15 = __ldxr(v14);
  while (__stxr(0, v14));
  v16 = (unsigned int *)(a1 + 112);
  do
    v17 = __ldxr(v16);
  while (__stxr(0, v16));
  if (v3)
  {
    xpc_dictionary_set_string(*(xpc_object_t *)(a1 + 120), "program", v3);
    free(v3);
  }
  if (*(_BYTE *)(a1 + 48))
    xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 120), "suspended", 1);
  v18 = *(int *)(a1 + 28);
  if ((_DWORD)v18)
    xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 120), "binpref", v18);
  if (v5)
  {
    xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 120), "environment", v5);
    xpc_release(v5);
  }
  if (v7)
  {
    xpc_dictionary_set_string(*(xpc_object_t *)(a1 + 120), "cwd", v7);
    free(v7);
  }
  if (v9)
  {
    xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 120), "fds", v9);
    xpc_release(v9);
  }
  if (v11)
  {
    listener_port = _xpc_endpoint_get_listener_port(v11);
    xpc_dictionary_set_mach_send(*(void **)(a1 + 120), "endpoint", listener_port);
  }
  if (v13)
    xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 120), "jetsam-flags", v13);
  if ((v15 & 0x80000000) == 0)
    xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 120), "jetsam-priority", v15);
  if (v17)
    xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 120), "jetsam-memlimit", v17);
  object = 0;
  v20 = _xpc_service_routine(705, *(void **)(a1 + 120), &object);
  if (v20)
  {
    v21 = v20;
    v22 = xpc_strerror(v20);
    syslog(3, "Could not configure service: %d: %s", v21, v22);
  }
  else
  {
    xpc_release(object);
  }
  xpc_release(*(xpc_object_t *)(a1 + 120));
  *(_QWORD *)(a1 + 120) = 0;
}

BOOL _xpc_service_equal(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t _xpc_service_desc(const char *a1, uint64_t a2)
{
  unsigned int v3;
  int v4;
  char __str[16];
  __int128 v7;
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
  uint64_t v38;

  v38 = *MEMORY[0x1E0C874D8];
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
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
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  *(_OWORD *)__str = 0u;
  v7 = 0u;
  v3 = snprintf(__str, 0x200uLL, "<%s: %p> { name = %s }", "service", a1, a1 + 76);
  if (v3 >= 0x1FF)
    v4 = 511;
  else
    v4 = v3;
  return _xpc_serializer_append(a2, __str, (v4 + 1), 0);
}

uint64_t _xpc_service_debug()
{
  return 0;
}

uint64_t _xpc_service_deserialize()
{
  return 0;
}

uint64_t _xpc_service_wire_length()
{
  return -1;
}

void _xpc_service_dispose(uint64_t a1)
{
  NSObject *v2;

  v2 = *(NSObject **)(a1 + 64);
  if (v2)
    dispatch_release(v2);
  dispatch_release(*(dispatch_object_t *)(a1 + 24));
  _Block_release(*(const void **)(a1 + 32));
}

void _xpc_service_last_xref_cancel(uint64_t a1)
{
  xpc_object_t request;
  NSObject *v3;
  xpc_object_t object;

  request = _xpc_service_create_request(a1);
  object = 0;
  if (!_xpc_service_routine(706, request, &object))
    xpc_release(object);
  xpc_release(request);
  v3 = *(NSObject **)(a1 + 64);
  if (v3)
    dispatch_source_cancel(v3);
}

uint64_t xpc_service_create(int a1, char *__s, uint64_t a3, NSObject *a4)
{
  uint64_t result;
  int v7;

  result = _xpc_service_create_internal(__s, a4);
  if (a1 == 1)
    v7 = 5;
  else
    v7 = 6;
  *(_DWORD *)(result + 48) = a1;
  *(_DWORD *)(result + 52) = v7;
  *(_QWORD *)(result + 40) = a3;
  return result;
}

uint64_t _xpc_service_create_internal(char *__s, NSObject *global_queue)
{
  uint64_t v4;
  unsigned __int8 uu[8];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C874D8];
  if (__s)
    strlen(__s);
  v4 = _xpc_base_create();
  if (!global_queue)
    global_queue = dispatch_get_global_queue(0, 0);
  *(_QWORD *)(v4 + 24) = global_queue;
  dispatch_retain(global_queue);
  if (__s)
  {
    strcpy((char *)(v4 + 76), __s);
  }
  else
  {
    *(_QWORD *)uu = 0;
    v7 = 0;
    MEMORY[0x1DF0F1358](uu);
    uuid_unparse(uu, (char *)(v4 + 76));
  }
  *(_DWORD *)(v4 + 56) = 0;
  return v4;
}

uint64_t xpc_service_create_from_specifier(const char *a1, NSObject *a2)
{
  uint64_t internal;
  char *v4;
  int v5;
  unint64_t foreground_uid;
  int v8;
  char *v9;
  int v11;
  char *__s;
  unint64_t v13;
  int v14;

  v14 = 0;
  __s = 0;
  v13 = 0;
  internal = 0;
  v11 = _xpc_parse_service_specifier(a1, &v14, &v13, &__s);
  if (!v11)
  {
    v4 = __s;
    if (__s)
    {
      v5 = v14;
      foreground_uid = v13;
      if (v14 == 2 && v13 == 4294967294)
      {
        if (!xpc_user_sessions_enabled())
        {
          syslog(3, "user/foreground/ specifier is not supported on this platform");
          return 0;
        }
        foreground_uid = xpc_user_sessions_get_foreground_uid(&v11);
        v8 = v11;
        if (v11)
        {
          v9 = xpc_strerror(v11);
          syslog(3, "xpc_user_sessions_get_foreground_uid() failed with error: %d - %s", v8, v9);
        }
      }
      internal = _xpc_service_create_internal(v4, a2);
      free(v4);
      *(_DWORD *)(internal + 48) = 3;
      *(_DWORD *)(internal + 52) = v5;
      *(_QWORD *)(internal + 40) = foreground_uid;
    }
  }
  return internal;
}

uint64_t _xpc_parse_service_specifier(const char *a1, int *a2, unint64_t *a3, char **a4)
{
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  int v11;
  int v12;
  uint64_t v13;
  char *v14;
  unint64_t v15;
  uint64_t v16;
  const char *v17;
  char *v18;
  char *v20;
  char *__endptr;
  char *__s1;
  char *__str;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C874D8];
  v7 = _xpc_strdup(a1);
  v8 = 0;
  v20 = v7;
  __s1 = 0;
  __str = 0;
  v24 = 0;
  do
  {
    v9 = strsep(&v20, "/");
    if (!v9)
      break;
    (&__s1)[v8++] = v9;
  }
  while (v8 != 3);
  v10 = __s1;
  if (!__s1)
    goto LABEL_24;
  if (!strcmp(__s1, "system"))
  {
    v15 = 0;
    v16 = 1;
    v12 = 1;
    goto LABEL_21;
  }
  if (strcmp(v10, "user"))
  {
    v11 = strcmp(v10, "pid");
    if (v11)
      v12 = 9;
    else
      v12 = 5;
    v13 = 140;
    if (v11)
      goto LABEL_27;
    v14 = __str;
    if (!__str)
      goto LABEL_27;
    goto LABEL_17;
  }
  v14 = __str;
  if (!__str)
    goto LABEL_24;
  v12 = 2;
  if (!_xpc_equal_strings(__str, "foreground"))
  {
LABEL_17:
    __endptr = 0;
    v15 = strtol(v14, &__endptr, 10);
    if (__endptr && !*__endptr && v15 < 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_20;
LABEL_24:
    v13 = 140;
    goto LABEL_27;
  }
  v15 = 4294967294;
LABEL_20:
  v16 = 2;
LABEL_21:
  v17 = (&__s1)[v16];
  *a2 = v12;
  *a3 = v15;
  if (v17 && *v17)
    v18 = strdup(v17);
  else
    v18 = 0;
  v13 = 0;
  *a4 = v18;
LABEL_27:
  free(v7);
  return v13;
}

void xpc_service_set_attach_handler(mach_port_context_t a1, const void *a2)
{
  unsigned int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  unint64_t *v8;
  xpc_object_t request;
  int v11;
  int v12;
  char *v13;
  char *v14;
  unint64_t *v15;
  const void *v16;
  char *v17;

  if (!a2)
  {
    v15 = (unint64_t *)(a1 + 32);
    do
      v16 = (const void *)__ldxr(v15);
    while (__stlxr(0, v15));
    if (v16)
    {
      _Block_release(v16);
      dispatch_source_cancel(*(dispatch_source_t *)(a1 + 64));
      return;
    }
    v17 = _xpc_asprintf("Attach handler is already NULL.");
LABEL_15:
    _xpc_api_misuse(v17);
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
  if (!*(_DWORD *)(a1 + 72))
  {
    v4 = _xpc_mach_port_allocate(0x33u, 6u, a1);
    *(_DWORD *)(a1 + 72) = v4;
    v5 = dispatch_source_create(MEMORY[0x1E0C86F00], v4, 0, *(dispatch_queue_t *)(a1 + 24));
    *(_QWORD *)(a1 + 64) = v5;
    v6 = (void *)_xpc_retain(a1);
    dispatch_set_context(v5, v6);
    dispatch_source_set_event_handler_f(*(dispatch_source_t *)(a1 + 64), (dispatch_function_t)_xpc_service_attach_event);
    dispatch_source_set_mandatory_cancel_handler_f();
    dispatch_activate(*(dispatch_object_t *)(a1 + 64));
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  v7 = _xpc_Block_copy_impl(a2);
  v8 = (unint64_t *)(a1 + 32);
  do
  {
    if (__ldxr(v8))
    {
      __clrex();
      v17 = _xpc_asprintf("Attempt to reset attach handler.");
      goto LABEL_15;
    }
  }
  while (__stlxr((unint64_t)v7, v8));
  request = _xpc_service_create_request(a1);
  xpc_dictionary_set_mach_send(request, "port", *(_DWORD *)(a1 + 72));
  v11 = _xpc_event_routine_async(704, request, *(unsigned int *)(a1 + 72));
  if (v11)
  {
    v12 = v11;
    v13 = xpc_copy_description((xpc_object_t)a1);
    v14 = xpc_strerror(v12);
    syslog(3, "Could not attach to service: %d: %s:\n%s", v12, v14, v13);
    free(v13);
  }
  xpc_release(request);
}

xpc_object_t _xpc_service_create_request(uint64_t a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "type", *(int *)(a1 + 52));
  xpc_dictionary_set_uint64(v2, "handle", *(_QWORD *)(a1 + 40));
  xpc_dictionary_set_string(v2, "name", (const char *)(a1 + 76));
  xpc_dictionary_set_BOOL(v2, "unidomain", 1);
  return v2;
}

uint64_t xpc_service_get_rendezvous_token(uint64_t a1)
{
  return a1 + 76;
}

int64_t xpc_service_kickstart(uint64_t a1, char a2, int a3)
{
  if (a3)
    a2 |= 2u;
  return xpc_service_kickstart_with_flags(a1, a2);
}

int64_t xpc_service_kickstart_with_flags(uint64_t a1, char a2)
{
  xpc_object_t request;
  int64_t v4;
  int64_t v5;
  char *v6;
  xpc_object_t object;

  request = _xpc_service_create_request(a1);
  xpc_dictionary_set_BOOL(request, "suspended", a2 & 1);
  xpc_dictionary_set_BOOL(request, "kill", (a2 & 2) != 0);
  xpc_dictionary_set_BOOL(request, "unthrottle", 1);
  object = 0;
  v4 = _xpc_service_routine(702, request, &object);
  v5 = v4;
  if ((_DWORD)v4)
  {
    v6 = xpc_strerror(v4);
    syslog(3, "Could not kickstart service: %d: %s", v5, v6);
  }
  else
  {
    xpc_release(object);
  }
  xpc_release(request);
  return v5;
}

int64_t xpc_service_attach(uint64_t a1, char a2, int a3)
{
  if (a3)
    a2 |= 2u;
  return xpc_service_attach_with_flags(a1, a2);
}

int64_t xpc_service_attach_with_flags(uint64_t a1, char a2)
{
  xpc_object_t request;
  int64_t v4;
  int64_t v5;
  char *v6;
  xpc_object_t object;

  request = _xpc_service_create_request(a1);
  xpc_dictionary_set_BOOL(request, "run", a2 & 1);
  xpc_dictionary_set_BOOL(request, "kill", (a2 & 2) != 0);
  object = 0;
  v4 = _xpc_service_routine(703, request, &object);
  v5 = v4;
  if ((_DWORD)v4)
  {
    v6 = xpc_strerror(v4);
    syslog(3, "Could not attach service: %d: %s", v5, v6);
  }
  else
  {
    xpc_release(object);
  }
  xpc_release(request);
  return v5;
}

char *xpc_get_service_name_from_pid(int a1)
{
  xpc_object_t v2;
  int v3;
  char *v4;
  const char *string;
  xpc_object_t xdict;

  if (!a1)
    return 0;
  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, "pid", a1);
  xdict = 0;
  v3 = _xpc_service_routine(725, v2, &xdict);
  xpc_release(v2);
  v4 = 0;
  if (!v3)
  {
    string = xpc_dictionary_get_string(xdict, "service-name");
    if (string)
      v4 = strdup(string);
    else
      v4 = 0;
    xpc_release(xdict);
  }
  return v4;
}

void _xpc_service_attach_event(uint64_t a1)
{
  int int64;
  char *v3;
  int v4;
  int v5;
  _BOOL4 v6;
  xpc_object_t request;
  int v8;
  uint64_t v9;
  xpc_object_t xdict;

  xdict = 0;
  int64 = xpc_pipe_receive(*(_DWORD *)(a1 + 72), &xdict, 0);
  if (int64 || (int64 = xpc_dictionary_get_int64(xdict, "error")) != 0)
  {
    if (xdict)
      xpc_release(xdict);
    v3 = xpc_strerror(int64);
    syslog(3, "Could not attach to service: %d: %s", int64, v3);
    return;
  }
  v4 = xpc_dictionary_get_int64(xdict, "pid");
  v5 = xpc_dictionary_get_int64(xdict, "hostpid");
  v6 = xpc_dictionary_get_BOOL(xdict, "configurable");
  if (*(_QWORD *)(a1 + 40) || *(_DWORD *)(a1 + 48) != 1)
  {
    if (!v6)
    {
      request = 0;
      goto LABEL_14;
    }
  }
  else
  {
    if (!v6)
      return;
    *(_QWORD *)(a1 + 40) = v5;
  }
  request = _xpc_service_create_request(a1);
  xpc_dictionary_set_int64(request, "pid", v4);
LABEL_14:
  v8 = *(_DWORD *)(a1 + 48);
  v9 = _xpc_base_create();
  *(_DWORD *)(v9 + 40) = v4;
  *(_DWORD *)(v9 + 44) = v5;
  *(_DWORD *)(v9 + 24) = v8;
  *(_QWORD *)(v9 + 104) = 0xFFFFFFFF00000000;
  *(_DWORD *)(v9 + 112) = 0;
  if (request)
  {
    *(_QWORD *)(v9 + 120) = xpc_retain(request);
    *(_BYTE *)(v9 + 49) = 1;
    *(_QWORD *)(v9 + 32) = dispatch_queue_create("com.apple.xpc.service-instance", 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    xpc_release((xpc_object_t)v9);
  }
  else
  {
    *(_QWORD *)(v9 + 32) = dispatch_queue_create("com.apple.xpc.service-instance", 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    request = (xpc_object_t)v9;
  }
  xpc_release(request);
  xpc_release(xdict);
}

uint64_t _xpc_service_attach_cancel(mach_port_context_t guard)
{
  if (_xpc_mach_port_close_recv(*(_DWORD *)(guard + 72), -1, guard))
    _os_assumes_log();
  return _xpc_release(guard);
}

uint64_t _xpc_activity_copy()
{
  return 0;
}

BOOL _xpc_activity_equal(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t _xpc_activity_desc(uint64_t a1, uint64_t a2)
{
  unsigned int v3;
  int v4;
  char __str[16];
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C874D8];
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  *(_OWORD *)__str = 0u;
  v7 = 0u;
  v3 = snprintf(__str, 0x80uLL, "<%s: %s>", "activity", *(const char **)(a1 + 24));
  if (v3 >= 0x7F)
    v4 = 127;
  else
    v4 = v3;
  return _xpc_serializer_append(a2, __str, (v4 + 1), 0);
}

uint64_t _xpc_activity_debug_desc(const char **a1, uint64_t a2)
{
  unsigned int v3;
  int v4;
  char __str[16];
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C874D8];
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  *(_OWORD *)__str = 0u;
  v7 = 0u;
  v3 = snprintf(__str, 0x80uLL, "<%s: %p>: %s", "activity", a1, a1[3]);
  if (v3 >= 0x7F)
    v4 = 127;
  else
    v4 = v3;
  return _xpc_serializer_append(a2, __str, (v4 + 1), 0);
}

uint64_t _xpc_activity_debug(uint64_t a1, char *__str, size_t __size)
{
  return snprintf(__str, __size, ", %s", *(const char **)(a1 + 24));
}

uint64_t _xpc_activity_deserialize()
{
  return 0;
}

uint64_t _xpc_activity_wire_length()
{
  return -1;
}

void _xpc_activity_dispose(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  NSObject *v6;
  const void *v7;
  _xpc_connection_s *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C874D8];
  if (_activity_log_pred != -1)
    dispatch_once(&_activity_log_pred, &__block_literal_global_9);
  v2 = _activity_log__log;
  if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 24);
    v4 = *(_QWORD *)(a1 + 96);
    if ((*(_BYTE *)(a1 + 136) & 1) != 0)
      v5 = "(is running)";
    else
      v5 = "(not running)";
    v10 = 136446978;
    v11 = v3;
    v12 = 2048;
    v13 = a1;
    v14 = 2048;
    v15 = v4;
    v16 = 2082;
    v17 = v5;
    _os_log_impl(&dword_1DEE85000, v2, OS_LOG_TYPE_DEFAULT, "_xpc_activity_dispose: %{public}s (%p) seqno: %llu, %{public}s", (uint8_t *)&v10, 0x2Au);
  }
  _xpc_activity_end_running(a1);
  free(*(void **)(a1 + 24));
  v6 = *(NSObject **)(a1 + 40);
  if (v6)
    dispatch_release(v6);
  v7 = *(const void **)(a1 + 48);
  if (v7)
    _Block_release(v7);
  v8 = *(_xpc_connection_s **)(a1 + 80);
  if (v8)
  {
    xpc_connection_cancel(v8);
    xpc_release(*(xpc_object_t *)(a1 + 80));
  }
  v9 = *(void **)(a1 + 32);
  if (v9)
    xpc_release(v9);
  if (*(_QWORD *)(a1 + 56))
    _xpc_mach_message_request_handoff_reply_cold_1();
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
  NSObject *v6;
  const char *v7;
  _xpc_activity_s *v8;
  NSObject *v9;
  _QWORD block[5];
  _BYTE buf[12];
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C874D8];
  if (_activity_log_pred != -1)
    dispatch_once(&_activity_log_pred, &__block_literal_global_9);
  v6 = _activity_log__log;
  if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
  {
    v7 = "dictionary";
    if (criteria == &_xpc_activity_check_in)
      v7 = "check-in";
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)&buf[4] = identifier;
    v12 = 2082;
    v13 = v7;
    _os_log_impl(&dword_1DEE85000, v6, OS_LOG_TYPE_DEFAULT, "xpc_activity_register: %{public}s, criteria: %{public}s", buf, 0x16u);
  }
  if (_xpc_activity_once != -1)
    dispatch_once(&_xpc_activity_once, &__block_literal_global_104);
  *(_QWORD *)buf = 0;
  v8 = (_xpc_activity_s *)_xpc_base_create();
  *((_QWORD *)v8 + 3) = strdup(identifier);
  asprintf((char **)buf, "com.apple.xpc.activity.%s", identifier);
  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  v9 = dispatch_queue_attr_make_with_overcommit();
  *((_QWORD *)v8 + 5) = dispatch_queue_create_with_target_V2(*(const char **)buf, v9, 0);
  free(*(void **)buf);
  *((_QWORD *)v8 + 6) = _Block_copy(handler);
  *((_QWORD *)v8 + 7) = 0;
  if (criteria == &_xpc_activity_check_in)
    *((_QWORD *)v8 + 4) = &_xpc_activity_check_in;
  block[0] = MEMORY[0x1E0C87450];
  block[1] = 0x40000000;
  block[2] = __xpc_activity_register_block_invoke;
  block[3] = &__block_descriptor_tmp_16;
  block[4] = v8;
  dispatch_sync((dispatch_queue_t)_xpc_activity_queue, block);
  xpc_activity_set_criteria(v8, criteria);
  xpc_release(v8);
}

xpc_object_t __xpc_activity_register_block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD *registration;
  _QWORD *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C874D8];
  v2 = *(_QWORD *)(a1 + 32);
  registration = _xpc_activity_find_registration(*(const char **)(v2 + 24));
  v4 = registration;
  if (registration[2] == -1)
    registration[2] = 0;
  if (_activity_log_pred != -1)
    dispatch_once(&_activity_log_pred, &__block_literal_global_9);
  v5 = _activity_log__log;
  if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(v2 + 24);
    v7 = v4[2];
    v12 = 136446722;
    v13 = v6;
    v14 = 2048;
    v15 = v2;
    v16 = 2048;
    v17 = v7;
    _os_log_impl(&dword_1DEE85000, v5, OS_LOG_TYPE_DEFAULT, "_xpc_activity_register: %{public}s (%p), %llu", (uint8_t *)&v12, 0x20u);
  }
  v10 = v4[3];
  v9 = v4 + 3;
  v8 = v10;
  *(_QWORD *)(v2 + 120) = v10;
  if (v10)
    *(_QWORD *)(v8 + 128) = v2 + 120;
  *v9 = v2;
  *(_QWORD *)(v2 + 128) = v9;
  *(_BYTE *)(v2 + 136) |= 8u;
  return xpc_retain(*(xpc_object_t *)(a1 + 32));
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  void *v1;
  _QWORD v3[6];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2000000000;
  v7 = 0;
  v3[0] = MEMORY[0x1E0C87450];
  v3[1] = 0x40000000;
  v3[2] = __xpc_activity_copy_criteria_block_invoke;
  v3[3] = &unk_1EA959908;
  v3[4] = &v4;
  v3[5] = activity;
  dispatch_sync((dispatch_queue_t)_xpc_activity_queue, v3);
  v1 = (void *)v5[3];
  _Block_object_dispose(&v4, 8);
  return v1;
}

void __xpc_activity_copy_criteria_block_invoke(uint64_t a1)
{
  __objc2_class **v2;
  BOOL v3;
  void *v4;

  v2 = *(__objc2_class ***)(*(_QWORD *)(a1 + 40) + 32);
  if (v2)
    v3 = v2 == &_xpc_activity_check_in;
  else
    v3 = 1;
  if (!v3)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = xpc_copy(v2);
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    if (v4)
      xpc_dictionary_set_value(v4, "_SequenceNumber", 0);
  }
}

void _xpc_activity_normalize_critiera(void *a1)
{
  if (a1)
  {
    _xpc_activity_normalize_integer(a1, "Delay");
    _xpc_activity_normalize_integer(a1, "RandomInitialDelay");
    _xpc_activity_normalize_integer(a1, "GracePeriod");
    _xpc_activity_normalize_integer(a1, "Interval");
  }
}

void __xpc_activity_set_criteria_block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  __objc2_class **v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t uint64;
  NSObject *global_queue;
  _QWORD v17[6];
  _QWORD block[8];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t v23[4];
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  _BOOL8 v28;
  _BYTE buf[24];
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C874D8];
  if (_activity_log_pred != -1)
    dispatch_once(&_activity_log_pred, &__block_literal_global_9);
  v2 = _activity_log__log;
  if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(v3 + 24);
    if (*(__objc2_class ***)(a1 + 40) == &_xpc_activity_check_in)
      v5 = "check-in";
    else
      v5 = "dict";
    *(_DWORD *)buf = 136446722;
    *(_QWORD *)&buf[4] = v4;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v3;
    *(_WORD *)&buf[22] = 2082;
    v30 = v5;
    _os_log_impl(&dword_1DEE85000, v2, OS_LOG_TYPE_DEFAULT, "xpc_activity_set_criteria, lower half: %{public}s (%p), %{public}s", buf, 0x20u);
  }
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(__objc2_class ***)(a1 + 40);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2000000000;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2000000000;
  v22 = 0;
  block[2] = __xpc_activity_set_criteria_block_invoke_70;
  block[3] = &unk_1EA959930;
  v8 = MEMORY[0x1E0C87450];
  block[0] = MEMORY[0x1E0C87450];
  block[1] = 0x40000000;
  block[6] = v6;
  block[7] = v7;
  block[4] = buf;
  block[5] = &v19;
  dispatch_sync((dispatch_queue_t)_xpc_activity_queue, block);
  if (_activity_log_pred != -1)
    dispatch_once(&_activity_log_pred, &__block_literal_global_9);
  v9 = _activity_log__log;
  if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(v10 + 24);
    *(_DWORD *)v23 = 136446722;
    v24 = v11;
    v25 = 2048;
    v26 = v10;
    v27 = 2048;
    v28 = v7 != &_xpc_activity_check_in;
    _os_log_impl(&dword_1DEE85000, v9, OS_LOG_TYPE_DEFAULT, "xpc_activity_set_criteria: %{public}s (%p), setting state now to %ld", v23, 0x20u);
  }
  _xpc_activity_set_state_with_completion_status(*(_QWORD *)(a1 + 32), v7 != &_xpc_activity_check_in, 0);
  if (*(_QWORD *)(*(_QWORD *)&buf[8] + 24))
  {
    if (_activity_log_pred != -1)
      dispatch_once(&_activity_log_pred, &__block_literal_global_9);
    v12 = _activity_log__log;
    if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(_QWORD *)(v13 + 24);
      uint64 = xpc_dictionary_get_uint64(*(xpc_object_t *)(*(_QWORD *)&buf[8] + 24), "_SequenceNumber");
      *(_DWORD *)v23 = 136446722;
      v24 = v14;
      v25 = 2048;
      v26 = v13;
      v27 = 2048;
      v28 = uint64;
      _os_log_impl(&dword_1DEE85000, v12, OS_LOG_TYPE_DEFAULT, "xpc_activity_set_criteria: %{public}s (%p), there is a pending event, which contained seqno %llu. If next state is CHECK_IN, it will be dispatched. If next state is WAIT, it will be dropped.", v23, 0x20u);
    }
    if (v7 == &_xpc_activity_check_in)
    {
      global_queue = dispatch_get_global_queue(9, 0);
      xpc_retain(*(xpc_object_t *)(*(_QWORD *)&buf[8] + 24));
      os_retain((void *)v20[3]);
      v17[0] = v8;
      v17[1] = 0x40000000;
      v17[2] = __xpc_activity_set_criteria_block_invoke_72;
      v17[3] = &unk_1EA959958;
      v17[4] = buf;
      v17[5] = &v19;
      dispatch_async(global_queue, v17);
    }
    xpc_release(*(xpc_object_t *)(*(_QWORD *)&buf[8] + 24));
  }
  os_release((void *)v20[3]);
  xpc_release(*(xpc_object_t *)(a1 + 32));
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(buf, 8);
}

void __xpc_activity_set_criteria_block_invoke_70(uint64_t a1)
{
  uint64_t v2;
  __objc2_class **v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  const char **registration;
  const char *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  char *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  char *v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C874D8];
  v2 = *(_QWORD *)(a1 + 48);
  if ((*(_BYTE *)(v2 + 136) & 8) != 0)
  {
    registration = (const char **)_xpc_activity_find_registration(*(const char **)(v2 + 24));
    _xpc_activity_set_criteria((uint64_t)registration, *(_QWORD *)(a1 + 48), *(__objc2_class ***)(a1 + 56));
    v8 = registration[6];
    if (v8 || registration[7])
    {
      if (v8 >= registration[2])
      {
        if (_activity_log_pred != -1)
          dispatch_once(&_activity_log_pred, &__block_literal_global_9);
        v9 = _activity_log__log;
        if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
        {
          v10 = *(_QWORD *)(a1 + 48);
          v11 = *(_QWORD *)(v10 + 24);
          v12 = registration[6];
          v13 = registration[2];
          v20 = 136446978;
          v21 = v11;
          v22 = 2048;
          v23 = v10;
          v24 = 2048;
          v25 = v12;
          v26 = 2048;
          v27 = v13;
          _os_log_impl(&dword_1DEE85000, v9, OS_LOG_TYPE_DEFAULT, "xpc_activity_set_criteria: %{public}s (%p): registration->pending_seqno %llu >= registration->seqno %llu; cr"
            "eating a pending event",
            (uint8_t *)&v20,
            0x2Au);
        }
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_string(*(xpc_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), "XPCEventName", *registration);
        xpc_dictionary_set_uint64(*(xpc_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), "_SequenceNumber", (uint64_t)registration[6]);
        v14 = (char *)registration[7];
        if (v14)
          xpc_dictionary_set_value(*(xpc_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), "_ReplyEndpoint", v14);
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = registration[8];
        registration[8] = 0;
      }
      if (_activity_log_pred != -1)
        dispatch_once(&_activity_log_pred, &__block_literal_global_9);
      v15 = _activity_log__log;
      if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
      {
        v16 = *(_QWORD *)(a1 + 48);
        v17 = *(_QWORD *)(v16 + 24);
        v18 = registration[6];
        v20 = 136446722;
        v21 = v17;
        v22 = 2048;
        v23 = v16;
        v24 = 2048;
        v25 = v18;
        _os_log_impl(&dword_1DEE85000, v15, OS_LOG_TYPE_DEFAULT, "xpc_activity_set_criteria: %{public}s (%p): clearing pending seqno %llu, endpoint, transaction", (uint8_t *)&v20, 0x20u);
      }
      registration[6] = 0;
      v19 = (char *)registration[7];
      if (v19)
      {
        xpc_release(v19);
        registration[7] = 0;
      }
      os_release((void *)registration[8]);
      registration[8] = 0;
    }
  }
  else
  {
    v3 = *(__objc2_class ***)(a1 + 56);
    if (v3 != &_xpc_activity_check_in)
      xpc_release(v3);
    if (_activity_log_pred != -1)
      dispatch_once(&_activity_log_pred, &__block_literal_global_9);
    v4 = _activity_log__log;
    if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 48);
      v6 = *(_QWORD *)(v5 + 24);
      v20 = 136446466;
      v21 = v6;
      v22 = 2048;
      v23 = v5;
      _os_log_impl(&dword_1DEE85000, v4, OS_LOG_TYPE_DEFAULT, "xpc_activity_set_criteria: %{public}s (%p): early return", (uint8_t *)&v20, 0x16u);
    }
  }
}

_QWORD *_xpc_activity_find_registration(const char *a1)
{
  _QWORD *registration;
  uint64_t v3;

  registration = (_QWORD *)__xpc_activity_find_registration(a1);
  if (!registration)
  {
    registration = malloc_type_calloc(1uLL, 0x48uLL, 0x10B0040881EC984uLL);
    *registration = strdup(a1);
    registration[3] = 0;
    v3 = _xpc_activity_list;
    registration[4] = _xpc_activity_list;
    if (v3)
      *(_QWORD *)(v3 + 40) = registration + 4;
    _xpc_activity_list = (uint64_t)registration;
    registration[5] = &_xpc_activity_list;
  }
  return registration;
}

xpc_object_t _xpc_activity_set_criteria(uint64_t a1, uint64_t a2, __objc2_class **a3)
{
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  xpc_object_t v17;
  void *v18;
  uint64_t v19;
  NSObject *global_queue;
  _xpc_connection_s *mach_service;
  uint64_t v22;
  xpc_object_t v23;
  __objc2_class **v24;
  xpc_object_t result;
  xpc_object_t v26;
  char v27;
  char v28;
  _BYTE v29[24];
  const char *v30;
  _xpc_connection_s *v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C874D8];
  if (_activity_log_pred != -1)
    dispatch_once(&_activity_log_pred, &__block_literal_global_9);
  v6 = _activity_log__log;
  if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a2 + 24);
    v8 = "dict";
    *(_DWORD *)v29 = 136446722;
    if (a3 == &_xpc_activity_check_in)
      v8 = "check-in";
    *(_QWORD *)&v29[4] = v7;
    *(_WORD *)&v29[12] = 2048;
    *(_QWORD *)&v29[14] = a2;
    *(_WORD *)&v29[22] = 2082;
    v30 = v8;
    _os_log_impl(&dword_1DEE85000, v6, OS_LOG_TYPE_DEFAULT, "_xpc_activity_set_criteria: %{public}s (%p), %{public}s", v29, 0x20u);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)_xpc_activity_queue);
  v9 = *(void **)(a1 + 8);
  if (v9)
    xpc_release(v9);
  if (a3 == &_xpc_activity_check_in)
  {
    if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 16) == -1)
      v16 = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 24);
    else
      v16 = _os_alloc_once();
    if (*(_BYTE *)(v16 + 3))
    {
      v17 = xpc_copy_event("com.apple.xpc.activity", *(const char **)a1);
      *(_QWORD *)(a1 + 8) = v17;
      if (v17)
      {
        *(_QWORD *)(a1 + 16) = xpc_dictionary_get_uint64(v17, "_SequenceNumber");
        _xpc_activity_normalize_critiera(*(void **)(a1 + 8));
        goto LABEL_30;
      }
    }
    else
    {
      *(_QWORD *)(a1 + 8) = 0;
    }
    *(_QWORD *)(a1 + 16) = 1;
    goto LABEL_30;
  }
  v10 = *(_QWORD *)(a1 + 16) + 1;
  *(_QWORD *)(a1 + 8) = a3;
  *(_QWORD *)(a1 + 16) = v10;
  xpc_dictionary_set_uint64(a3, "_SequenceNumber", v10);
  v11 = MEMORY[0x1E0C87FA0];
  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 16) == -1)
    v12 = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 24);
  else
    v12 = _os_alloc_once();
  if (*(_BYTE *)(v12 + 3))
  {
    if (_activity_log_pred != -1)
      dispatch_once(&_activity_log_pred, &__block_literal_global_9);
    v13 = _activity_log__log;
    if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(const char **)a1;
      v15 = *(_QWORD *)(a1 + 16);
      *(_DWORD *)v29 = 136446466;
      *(_QWORD *)&v29[4] = v14;
      *(_WORD *)&v29[12] = 2048;
      *(_QWORD *)&v29[14] = v15;
      _os_log_impl(&dword_1DEE85000, v13, OS_LOG_TYPE_DEFAULT, "_xpc_activity_set_criteria: xpc_set_event %{public}s, %llu", v29, 0x16u);
    }
    xpc_set_event("com.apple.xpc.activity", *(const char **)a1, *(void **)(a1 + 8));
  }
  else
  {
    v18 = *(void **)(a2 + 80);
    if (v18 && (xpc_release(v18), *(_QWORD *)(v11 + 16) != -1))
      v19 = _os_alloc_once();
    else
      v19 = *(_QWORD *)(v11 + 24);
    if (*(_BYTE *)(v19 + 3))
      _xpc_mach_message_request_handoff_reply_cold_1();
    global_queue = dispatch_get_global_queue(9, 0);
    mach_service = xpc_connection_create_mach_service("com.apple.xpc.activity.unmanaged", global_queue, 0);
    *(_QWORD *)v29 = MEMORY[0x1E0C87450];
    *(_QWORD *)&v29[8] = 0x40000000;
    *(_QWORD *)&v29[16] = ___xpc_activity_new_unmanaged_connection_block_invoke;
    v30 = (const char *)&__block_descriptor_tmp_109;
    v31 = mach_service;
    v32 = a2;
    xpc_connection_set_event_handler(mach_service, v29);
    xpc_connection_activate(mach_service);
    v22 = *(_QWORD *)(a2 + 88) + 1;
    *(_QWORD *)(a2 + 80) = mach_service;
    *(_QWORD *)(a2 + 88) = v22;
    v23 = xpc_copy(*(xpc_object_t *)(a1 + 8));
    xpc_dictionary_set_string(v23, "name", *(const char **)a1);
    xpc_connection_send_message(*(xpc_connection_t *)(a2 + 80), v23);
    xpc_release(v23);
  }
LABEL_30:
  v24 = *(__objc2_class ***)(a2 + 32);
  if (v24 && v24 != &_xpc_activity_check_in)
    xpc_release(v24);
  result = *(xpc_object_t *)(a1 + 8);
  if (!result)
  {
    *(_QWORD *)(a2 + 32) = 0;
    v28 = *(_BYTE *)(a2 + 136) & 0xFB;
LABEL_40:
    *(_BYTE *)(a2 + 136) = v28;
    goto LABEL_41;
  }
  v26 = xpc_retain(result);
  *(_QWORD *)(a2 + 32) = v26;
  *(_BYTE *)(a2 + 136) = *(_BYTE *)(a2 + 136) & 0xFB | (4 * (xpc_dictionary_get_int64(v26, "Interval") != 0));
  result = xpc_dictionary_get_value(*(xpc_object_t *)(a2 + 32), "Repeating");
  if (result)
  {
    result = (xpc_object_t)xpc_BOOL_get_value(result);
    if ((_DWORD)result)
      v27 = 4;
    else
      v27 = 0;
    v28 = *(_BYTE *)(a2 + 136) & 0xFB | v27;
    goto LABEL_40;
  }
LABEL_41:
  *(_QWORD *)(a2 + 96) = *(_QWORD *)(a1 + 16);
  return result;
}

void __xpc_activity_set_criteria_block_invoke_72(uint64_t a1)
{
  _xpc_activity_dispatch(*(xpc_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), 0);
  xpc_release(*(xpc_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  os_release(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

void _xpc_activity_dispatch(xpc_object_t xdict, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  const char *string;
  void *v7;
  uint64_t uint64;
  char v9;
  NSObject *v10;
  xpc_object_t value;
  uint64_t v12;
  __objc2_class **v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  NSObject *v17;
  _QWORD v18[9];
  char v19;
  _QWORD block[10];
  char v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C874D8];
  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 16) == -1)
    v4 = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 24);
  else
    v4 = _os_alloc_once();
  v5 = *(unsigned __int8 *)(v4 + 3);
  if (*(_BYTE *)(v4 + 3))
  {
    string = xpc_dictionary_get_string(xdict, "XPCEventName");
    if (!strcmp(string, "com.apple.xpc.activity.control"))
    {
      _xpc_activity_setup_control_channel(xdict);
      return;
    }
LABEL_7:
    v7 = (void *)os_transaction_create(string);
    uint64 = xpc_dictionary_get_uint64(xdict, "_SequenceNumber");
    if (_activity_log_pred != -1)
      dispatch_once(&_activity_log_pred, &__block_literal_global_9);
    v9 = v5 ^ 1;
    v10 = _activity_log__log;
    if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v27 = string;
      v28 = 2048;
      v29 = uint64;
      _os_log_impl(&dword_1DEE85000, v10, OS_LOG_TYPE_DEFAULT, "_xpc_activity_dispatch: beginning dispatch, activity name %{public}s, seqno %llu", buf, 0x16u);
    }
    if ((_DWORD)v5)
      value = xpc_dictionary_get_value(xdict, "_ReplyEndpoint");
    else
      value = 0;
    v22 = 0;
    v23 = &v22;
    v24 = 0x2000000000;
    v25 = 0;
    v12 = MEMORY[0x1E0C87450];
    block[0] = MEMORY[0x1E0C87450];
    block[1] = 0x40000000;
    block[2] = ___xpc_activity_dispatch_block_invoke;
    block[3] = &unk_1EA959C20;
    v21 = v5 ^ 1;
    block[6] = uint64;
    block[7] = a2;
    block[4] = &v22;
    block[5] = string;
    block[8] = v7;
    block[9] = value;
    dispatch_sync((dispatch_queue_t)_xpc_activity_queue, block);
    if (!v23[3])
      goto LABEL_31;
    if (value)
      xpc_retain(value);
    if (xdict)
      xpc_retain(xdict);
    if (a2)
    {
      if ((_DWORD)v5)
      {
        _os_assert_log();
        _os_crash();
        __break(1u);
      }
      else if (xdict)
      {
        xpc_retain(a2);
        v13 = (__objc2_class **)xpc_dictionary_get_value(xdict, "eligible");
        if (v13)
          _xpc_activity_set_eligible((_BYTE *)v23[3], v13 == &_xpc_BOOL_true);
        goto LABEL_24;
      }
      _os_assert_log();
      _os_crash();
      __break(1u);
      goto LABEL_35;
    }
LABEL_24:
    v5 = v23[3];
    if ((*(_BYTE *)(v5 + 136) & 1) != 0)
    {
LABEL_30:
      v17 = *(NSObject **)(v23[3] + 40);
      v18[0] = v12;
      v18[1] = 0x40000000;
      v18[2] = ___xpc_activity_dispatch_block_invoke_113;
      v18[3] = &unk_1EA959C68;
      v18[4] = &v22;
      v18[5] = uint64;
      v19 = v9;
      v18[6] = value;
      v18[7] = a2;
      v18[8] = xdict;
      dispatch_async(v17, v18);
LABEL_31:
      os_release(v7);
      _Block_object_dispose(&v22, 8);
      return;
    }
    *(_BYTE *)(v5 + 136) |= 1u;
    if (*(_QWORD *)(v5 + 112))
      _os_assumes_log();
    *(_QWORD *)(v5 + 112) = os_retain(v7);
    if (_activity_log_pred == -1)
    {
LABEL_28:
      v14 = _activity_log__log;
      if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
      {
        v15 = *(const char **)(v5 + 24);
        v16 = *(_QWORD *)(v5 + 96);
        *(_DWORD *)buf = 136446722;
        v27 = v15;
        v28 = 2048;
        v29 = v5;
        v30 = 2048;
        v31 = v16;
        _os_log_impl(&dword_1DEE85000, v14, OS_LOG_TYPE_DEFAULT, "_xpc_activity_begin_running: %{public}s (%p) seqno: %llu.", buf, 0x20u);
      }
      goto LABEL_30;
    }
LABEL_35:
    dispatch_once(&_activity_log_pred, &__block_literal_global_9);
    goto LABEL_28;
  }
  string = xpc_dictionary_get_string(xdict, "name");
  if (strcmp(string, "com.apple.xpc.activity.control"))
    goto LABEL_7;
  _os_assert_log();
  _os_crash();
  __break(1u);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  xpc_activity_state_t result;

  result = *((_QWORD *)activity + 9);
  if (!result)
    return *((_QWORD *)activity + 8);
  return result;
}

char *xpc_activity_copy_identifier(uint64_t a1)
{
  char *result;

  result = *(char **)(a1 + 24);
  if (result)
    return strdup(result);
  return result;
}

_QWORD *xpc_activity_add_eligibility_changed_handler(_QWORD *a1, const void *a2)
{
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  _QWORD v10[6];
  _QWORD block[6];

  dispatch_assert_queue_not_V2((dispatch_queue_t)_xpc_activity_queue);
  v4 = malloc_type_calloc(1uLL, 0x20uLL, 0xA004088793A40uLL);
  *v4 = xpc_retain(a1);
  v5 = _Block_copy(a2);
  v4[1] = v5;
  v6 = MEMORY[0x1E0C87450];
  block[0] = MEMORY[0x1E0C87450];
  block[1] = 0x40000000;
  block[2] = __xpc_activity_add_eligibility_changed_handler_block_invoke;
  block[3] = &__block_descriptor_tmp_75;
  block[4] = v4;
  block[5] = a1;
  dispatch_sync((dispatch_queue_t)_xpc_activity_queue, block);
  xpc_retain(a1);
  v7 = _Block_copy(v5);
  v8 = a1[5];
  v10[0] = v6;
  v10[1] = 0x40000000;
  v10[2] = __xpc_activity_add_eligibility_changed_handler_block_invoke_2;
  v10[3] = &unk_1EA9599C0;
  v10[4] = v7;
  v10[5] = a1;
  dispatch_async(v8, v10);
  return v4;
}

uint64_t __xpc_activity_add_eligibility_changed_handler_block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 40) + 56);
  *(_QWORD *)(*(_QWORD *)(result + 32) + 16) = v1;
  if (v1)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 56) + 24) = *(_QWORD *)(result + 32) + 16;
  *(_QWORD *)(*(_QWORD *)(result + 40) + 56) = *(_QWORD *)(result + 32);
  *(_QWORD *)(*(_QWORD *)(result + 32) + 24) = *(_QWORD *)(result + 40) + 56;
  return result;
}

void __xpc_activity_add_eligibility_changed_handler_block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 40));
}

void xpc_activity_remove_eligibility_changed_handler(uint64_t a1)
{
  _QWORD block[5];

  dispatch_assert_queue_not_V2((dispatch_queue_t)_xpc_activity_queue);
  block[0] = MEMORY[0x1E0C87450];
  block[1] = 0x40000000;
  block[2] = __xpc_activity_remove_eligibility_changed_handler_block_invoke;
  block[3] = &__block_descriptor_tmp_77_0;
  block[4] = a1;
  dispatch_sync((dispatch_queue_t)_xpc_activity_queue, block);
  xpc_release(*(xpc_object_t *)a1);
  _Block_release(*(const void **)(a1 + 8));
  free((void *)a1);
}

uint64_t __xpc_activity_remove_eligibility_changed_handler_block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    *(_QWORD *)(v2 + 24) = *(_QWORD *)(v1 + 24);
    v1 = *(_QWORD *)(result + 32);
    v2 = *(_QWORD *)(v1 + 16);
  }
  **(_QWORD **)(v1 + 24) = v2;
  *(_QWORD *)(*(_QWORD *)(result + 32) + 16) = -1;
  *(_QWORD *)(*(_QWORD *)(result + 32) + 24) = -1;
  return result;
}

uint64_t xpc_activity_should_be_data_budgeted(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[6];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2000000000;
  v7 = 0;
  v3[0] = MEMORY[0x1E0C87450];
  v3[1] = 0x40000000;
  v3[2] = __xpc_activity_should_be_data_budgeted_block_invoke;
  v3[3] = &unk_1EA959A08;
  v3[4] = &v4;
  v3[5] = a1;
  dispatch_sync((dispatch_queue_t)_xpc_activity_queue, v3);
  v1 = *((unsigned __int8 *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v1;
}

void *__xpc_activity_should_be_data_budgeted_block_invoke(uint64_t a1)
{
  void *result;

  result = (void *)xpc_dictionary_get_string(*(xpc_object_t *)(*(_QWORD *)(a1 + 40) + 32), "Priority");
  if (result && (result = (void *)strncmp((const char *)result, "Maintenance", 0xBuLL), (_DWORD)result))
  {
    result = xpc_dictionary_get_value(*(xpc_object_t *)(*(_QWORD *)(a1 + 40) + 32), "DataBudgeting");
    if (result)
    {
      result = (void *)xpc_BOOL_get_value(result);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = (_BYTE)result;
    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
  return result;
}

uint64_t xpc_activity_set_state_with_completion_status(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  if (a2 != 5 && a3)
    return 0;
  v4 = *(_QWORD *)(a1 + 72);
  if (!v4)
    v4 = *(_QWORD *)(a1 + 64);
  if (v4 == 4)
  {
    if (a2 != 5 && a2 != 3)
      return 0;
LABEL_12:
    _xpc_activity_set_state_with_completion_status(a1, a2, a3);
    return 1;
  }
  if (v4 == 2 && (unint64_t)(a2 - 3) < 3)
    goto LABEL_12;
  return 0;
}

uint64_t xpc_activity_set_completion_status(uint64_t a1, uint64_t a2)
{
  return xpc_activity_set_state_with_completion_status(a1, 5, a2);
}

uint64_t xpc_activity_defer_until_percentage()
{
  return 0;
}

uint64_t xpc_activity_defer_until_network_change()
{
  return 0;
}

uint64_t xpc_activity_get_percentage()
{
  return 0;
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return (*((_BYTE *)activity + 136) & 2) == 0;
}

void xpc_activity_unregister(const char *identifier)
{
  _QWORD block[5];

  if (_xpc_activity_once != -1)
    dispatch_once(&_xpc_activity_once, &__block_literal_global_104);
  block[0] = MEMORY[0x1E0C87450];
  block[1] = 0x40000000;
  block[2] = __xpc_activity_unregister_block_invoke;
  block[3] = &__block_descriptor_tmp_79;
  block[4] = identifier;
  dispatch_sync((dispatch_queue_t)_xpc_activity_queue, block);
}

BOOL __xpc_activity_unregister_block_invoke(uint64_t a1)
{
  _QWORD *registration;

  registration = _xpc_activity_find_registration(*(const char **)(a1 + 32));
  return _xpc_activity_unregister((uint64_t)registration, 0);
}

BOOL _xpc_activity_unregister(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  _BOOL8 v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v14;
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  _BOOL4 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C874D8];
  if (a2)
  {
    v3 = a2;
    __xpc_activity_unregister(a2);
    v4 = *(_QWORD *)(a1 + 24) == 0;
  }
  else
  {
    while (1)
    {
      v5 = *(_QWORD *)(a1 + 24);
      if (!v5)
        break;
      __xpc_activity_unregister(v5);
    }
    v3 = 0;
    v4 = 1;
  }
  if (_activity_log_pred != -1)
    dispatch_once(&_activity_log_pred, &__block_literal_global_9);
  v6 = _activity_log__log;
  if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(const char **)a1;
    v8 = *(_QWORD *)(a1 + 16);
    v14 = 136446722;
    v15 = v7;
    v16 = 2048;
    v17 = v8;
    v18 = 1024;
    v19 = v4;
    _os_log_impl(&dword_1DEE85000, v6, OS_LOG_TYPE_DEFAULT, "_xpc_activity_unregister: %{public}s %llu, last registration: %{BOOL}d", (uint8_t *)&v14, 0x1Cu);
  }
  if (v4)
  {
    if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 16) == -1)
      v9 = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 24);
    else
      v9 = _os_alloc_once();
    if (*(_BYTE *)(v9 + 3))
      xpc_set_event("com.apple.xpc.activity", *(const char **)a1, 0);
    os_release(*(void **)(a1 + 64));
    *(_QWORD *)(a1 + 64) = 0;
    v10 = *(void **)(a1 + 8);
    if (v10)
    {
      xpc_release(v10);
      *(_QWORD *)(a1 + 8) = 0;
    }
    v11 = *(void **)(a1 + 56);
    if (v11)
    {
      xpc_release(v11);
      *(_QWORD *)(a1 + 56) = 0;
    }
    if (v3)
    {
      v12 = *(_QWORD *)(a1 + 32);
      if (v12)
        *(_QWORD *)(v12 + 40) = *(_QWORD *)(a1 + 40);
      **(_QWORD **)(a1 + 40) = v12;
      *(_QWORD *)(a1 + 32) = -1;
      *(_QWORD *)(a1 + 40) = -1;
      free(*(void **)a1);
      free((void *)a1);
    }
    else
    {
      *(_QWORD *)(a1 + 48) = 0;
      *(_QWORD *)(a1 + 16) = -1;
    }
  }
  return v4;
}

uint64_t xpc_activity_copy_dispatch_queue(uint64_t a1)
{
  dispatch_retain(*(dispatch_object_t *)(a1 + 40));
  return *(_QWORD *)(a1 + 40);
}

void xpc_activity_run(const char *a1, uint64_t a2)
{
  xpc_object_t v4;
  _QWORD v5[6];

  _xpc_activity_create_control_channel();
  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v4, "Command", "Run");
  xpc_dictionary_set_string(v4, "Identifier", a1);
  v5[0] = MEMORY[0x1E0C87450];
  v5[1] = 0x40000000;
  v5[2] = __xpc_activity_run_block_invoke;
  v5[3] = &unk_1EA959A78;
  v5[4] = a2;
  v5[5] = v4;
  dispatch_async((dispatch_queue_t)_control_queue, v5);
}

void _xpc_activity_create_control_channel()
{
  if (_xpc_activity_once != -1)
    dispatch_once(&_xpc_activity_once, &__block_literal_global_104);
  if (_control_once != -1)
    dispatch_once(&_control_once, &__block_literal_global_132);
}

void __xpc_activity_run_block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD handler[5];

  handler[0] = MEMORY[0x1E0C87450];
  handler[1] = 0x40000000;
  handler[2] = __xpc_activity_run_block_invoke_2;
  handler[3] = &unk_1EA959A50;
  v2 = *(void **)(a1 + 40);
  handler[4] = *(_QWORD *)(a1 + 32);
  xpc_connection_send_message_with_reply((xpc_connection_t)_control_connection, v2, (dispatch_queue_t)_xpc_activity_queue, handler);
  xpc_release(*(xpc_object_t *)(a1 + 40));
}

uint64_t __xpc_activity_run_block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
  unsigned int int64;
  uint64_t v5;

  int64 = xpc_dictionary_get_int64(xdict, "Result");
  if (xpc_get_type(xdict) == (xpc_type_t)OS_xpc_error)
    v5 = 5;
  else
    v5 = int64;
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v5);
}

void xpc_activity_list(const char *a1, uint64_t a2)
{
  xpc_object_t v4;
  _QWORD v5[6];

  _xpc_activity_create_control_channel();
  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v4, "Command", "List");
  if (a1)
    xpc_dictionary_set_string(v4, "Identifier", a1);
  v5[0] = MEMORY[0x1E0C87450];
  v5[1] = 0x40000000;
  v5[2] = __xpc_activity_list_block_invoke;
  v5[3] = &unk_1EA959AC8;
  v5[4] = a2;
  v5[5] = v4;
  dispatch_async((dispatch_queue_t)_control_queue, v5);
}

void __xpc_activity_list_block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD handler[5];

  handler[0] = MEMORY[0x1E0C87450];
  handler[1] = 0x40000000;
  handler[2] = __xpc_activity_list_block_invoke_2;
  handler[3] = &unk_1EA959AA0;
  v2 = *(void **)(a1 + 40);
  handler[4] = *(_QWORD *)(a1 + 32);
  xpc_connection_send_message_with_reply((xpc_connection_t)_control_connection, v2, (dispatch_queue_t)_xpc_activity_queue, handler);
  xpc_release(*(xpc_object_t *)(a1 + 40));
}

uint64_t __xpc_activity_list_block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
  uint64_t v2;
  xpc_object_t value;

  v2 = *(_QWORD *)(a1 + 32);
  value = xpc_dictionary_get_value(xdict, "List");
  return (*(uint64_t (**)(uint64_t, xpc_object_t))(v2 + 16))(v2, value);
}

void xpc_activity_debug(const char *a1, uint64_t a2, uint64_t a3)
{
  xpc_object_t v6;
  _QWORD v7[6];

  _xpc_activity_create_control_channel();
  v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v6, "Command", "Debug");
  xpc_dictionary_set_string(v6, "Identifier", a1);
  xpc_dictionary_set_uint64(v6, "Flags", a2);
  v7[0] = MEMORY[0x1E0C87450];
  v7[1] = 0x40000000;
  v7[2] = __xpc_activity_debug_block_invoke;
  v7[3] = &unk_1EA959B18;
  v7[4] = a3;
  v7[5] = v6;
  dispatch_async((dispatch_queue_t)_control_queue, v7);
}

void __xpc_activity_debug_block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD handler[5];

  handler[0] = MEMORY[0x1E0C87450];
  handler[1] = 0x40000000;
  handler[2] = __xpc_activity_debug_block_invoke_2;
  handler[3] = &unk_1EA959AF0;
  v2 = *(void **)(a1 + 40);
  handler[4] = *(_QWORD *)(a1 + 32);
  xpc_connection_send_message_with_reply((xpc_connection_t)_control_connection, v2, (dispatch_queue_t)_xpc_activity_queue, handler);
  xpc_release(*(xpc_object_t *)(a1 + 40));
}

uint64_t __xpc_activity_debug_block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
  unsigned int int64;
  uint64_t v5;

  int64 = xpc_dictionary_get_int64(xdict, "Result");
  if (xpc_get_type(xdict) == (xpc_type_t)OS_xpc_error)
    v5 = 5;
  else
    v5 = int64;
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v5);
}

void _xpc_activity_end_running(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C874D8];
  if ((*(_BYTE *)(a1 + 136) & 1) != 0)
  {
    *(_BYTE *)(a1 + 136) &= ~1u;
    if (!*(_QWORD *)(a1 + 112))
      goto LABEL_10;
    if (_activity_log_pred != -1)
      dispatch_once(&_activity_log_pred, &__block_literal_global_9);
    v2 = _activity_log__log;
    if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 24);
      v4 = *(_QWORD *)(a1 + 96);
      v6 = 136446722;
      v7 = v3;
      v8 = 2048;
      v9 = a1;
      v10 = 2048;
      v11 = v4;
      _os_log_impl(&dword_1DEE85000, v2, OS_LOG_TYPE_DEFAULT, "_xpc_activity_end_running: %{public}s (%p) seqno: %llu.", (uint8_t *)&v6, 0x20u);
    }
    v5 = *(void **)(a1 + 112);
    if (!v5)
    {
LABEL_10:
      _os_assumes_log();
      v5 = *(void **)(a1 + 112);
    }
    os_release(v5);
    *(_QWORD *)(a1 + 112) = 0;
  }
}

os_log_t ___activity_log_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.xpc.activity", "Client");
  _activity_log__log = (uint64_t)result;
  return result;
}

void ___xpc_activity_init_block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  NSObject *global_queue;

  _xpc_activity_list = 0;
  v0 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  _xpc_activity_queue = (uint64_t)dispatch_queue_create("com.apple.xpc.activity", v0);
  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 16) == -1)
    v1 = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 24);
  else
    v1 = _os_alloc_once();
  if (*(_BYTE *)(v1 + 3))
  {
    global_queue = dispatch_get_global_queue(9, 0);
    xpc_set_event_stream_handler("com.apple.xpc.activity", global_queue, &__block_literal_global_106);
  }
}

void ___xpc_activity_init_block_invoke_2(int a1, xpc_object_t xdict)
{
  _xpc_activity_dispatch(xdict, 0);
}

void _xpc_activity_normalize_integer(void *a1, const char *a2)
{
  xpc_object_t value;
  void *v5;
  __objc2_class *type;
  uint64_t v7;
  int64_t v8;

  value = xpc_dictionary_get_value(a1, a2);
  if (value)
  {
    v5 = value;
    type = (__objc2_class *)xpc_get_type(value);
    if (type == OS_xpc_uint64)
    {
      v7 = xpc_uint64_get_value(v5);
      if (v7 >= 0x7FFFFFFFFFFFFFFFLL)
        v8 = 0x7FFFFFFFFFFFFFFFLL;
      else
        v8 = v7;
      xpc_dictionary_set_int64(a1, a2, v8);
    }
    else if (type == OS_xpc_int64 && xpc_int64_get_value(v5) < 0)
    {
      xpc_dictionary_set_value(a1, a2, 0);
    }
  }
}

uint64_t __xpc_activity_find_registration(const char *a1)
{
  uint64_t v2;
  uint64_t v3;

  dispatch_assert_queue_V2((dispatch_queue_t)_xpc_activity_queue);
  v2 = _xpc_activity_list;
  if (!_xpc_activity_list)
    return 0;
  v3 = 0;
  do
  {
    if (!strcmp(*(const char **)v2, a1))
      v3 = v2;
    v2 = *(_QWORD *)(v2 + 32);
  }
  while (v2);
  return v3;
}

void ___xpc_activity_new_unmanaged_connection_block_invoke(uint64_t a1, __objc2_class **object)
{
  if (xpc_get_type(object) == (xpc_type_t)OS_xpc_dictionary)
  {
    _xpc_activity_dispatch(object, *(void **)(a1 + 32));
  }
  else if (object == &_xpc_error_connection_interrupted)
  {
    xpc_activity_set_criteria(*(xpc_activity_t *)(a1 + 40), *(xpc_object_t *)(*(_QWORD *)(a1 + 40) + 32));
  }
}

void _xpc_activity_setup_control_channel(xpc_object_t xdict)
{
  uint64_t v2;
  _xpc_endpoint_s *value;
  _xpc_connection_s *v4;
  _xpc_connection_s *v5;

  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 16) == -1)
    v2 = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 24);
  else
    v2 = _os_alloc_once();
  if (*(_BYTE *)(v2 + 3))
  {
    if (_control_connection)
    {
      xpc_connection_cancel((xpc_connection_t)_control_connection);
      xpc_release((xpc_object_t)_control_connection);
      dispatch_suspend((dispatch_object_t)_control_queue);
    }
    value = (_xpc_endpoint_s *)xpc_dictionary_get_value(xdict, "_ReplyEndpoint");
    if (value && (v4 = xpc_connection_create_from_endpoint(value)) != 0)
    {
      v5 = v4;
      xpc_connection_set_target_queue(v4, (dispatch_queue_t)_control_queue);
      xpc_connection_set_event_handler(v5, &__block_literal_global_119_0);
      xpc_connection_activate(v5);
      _control_connection = (uint64_t)v5;
      dispatch_resume((dispatch_object_t)_control_queue);
    }
    else
    {
      _control_connection = 0;
    }
  }
  else
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
}

void ___xpc_activity_dispatch_block_invoke(uint64_t a1)
{
  _QWORD *registration;
  uint64_t v3;
  char v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C874D8];
  registration = _xpc_activity_find_registration(*(const char **)(a1 + 40));
  v3 = registration[3];
  if (v3)
  {
    v4 = 0;
    while (1)
    {
      while (1)
      {
        v5 = v3;
        v3 = *(_QWORD *)(v3 + 120);
        if (!*(_QWORD *)(v5 + 64) && *(__objc2_class ***)(v5 + 32) == &_xpc_activity_check_in)
        {
          if (_activity_log_pred != -1)
            dispatch_once(&_activity_log_pred, &__block_literal_global_9);
          v6 = _activity_log__log;
          if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
          {
            v7 = *(_QWORD *)(a1 + 40);
            *(_DWORD *)buf = 136446466;
            v33 = v7;
            v34 = 2048;
            v35 = v5;
            _os_log_impl(&dword_1DEE85000, v6, OS_LOG_TYPE_DEFAULT, "_xpc_activity_dispatch: %{public}s (%p): state is checking and criteria is checking. Calling _xpc_activity_set_criteria(...CHECK_IN)", buf, 0x16u);
          }
          _xpc_activity_set_criteria(registration, v5, &_xpc_activity_check_in);
        }
        v8 = *(_QWORD *)(v5 + 96);
        v9 = *(_QWORD *)(a1 + 48);
        if (v8 == v9)
          break;
        if (v8 >= v9)
        {
          if (_activity_log_pred != -1)
            dispatch_once(&_activity_log_pred, &__block_literal_global_9);
          v23 = _activity_log__log;
          if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
          {
            v24 = *(_QWORD *)(v5 + 96);
            v25 = *(_QWORD *)(a1 + 40);
            v26 = *(_QWORD *)(a1 + 48);
            *(_DWORD *)buf = 136446978;
            v33 = v25;
            v34 = 2048;
            v35 = v5;
            v36 = 2048;
            v37 = v24;
            v38 = 2048;
            v39 = v26;
            _os_log_impl(&dword_1DEE85000, v23, OS_LOG_TYPE_DEFAULT, "_xpc_activity_dispatch: %{public}s (%p): found a activity with seqno %llu NEWER THAN than the event's seqno %llu. Doing nothing.", buf, 0x2Au);
          }
          v4 = 1;
          if (!v3)
            goto LABEL_46;
        }
        else
        {
          if (v9 > registration[2])
            goto LABEL_37;
          if (_activity_log_pred != -1)
            dispatch_once(&_activity_log_pred, &__block_literal_global_9);
          v14 = _activity_log__log;
          if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
          {
            v15 = *(_QWORD *)(v5 + 96);
            v16 = *(_QWORD *)(a1 + 40);
            v17 = *(_QWORD *)(a1 + 48);
            *(_DWORD *)buf = 136446978;
            v33 = v16;
            v34 = 2050;
            v35 = v5;
            v36 = 2048;
            v37 = v15;
            v38 = 2048;
            v39 = v17;
            _os_log_impl(&dword_1DEE85000, v14, OS_LOG_TYPE_DEFAULT, "_xpc_activity_dispatch: %{public}s (%{public}p): found an activity with seqno %llu older than the event's seqno %llu. Unregistering it.", buf, 0x2Au);
          }
          if (!_xpc_activity_unregister((uint64_t)registration, v5))
            goto LABEL_37;
          if (_activity_log_pred != -1)
            dispatch_once(&_activity_log_pred, &__block_literal_global_9);
          v18 = _activity_log__log;
          if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
          {
            v19 = *(_QWORD *)(a1 + 40);
            *(_DWORD *)buf = 136446466;
            v33 = v19;
            v34 = 2050;
            v35 = v5;
            _os_log_impl(&dword_1DEE85000, v18, OS_LOG_TYPE_DEFAULT, "_xpc_activity_dispatch: %{public}s (%{public}p): no references remain after unregistering old activity.", buf, 0x16u);
          }
          registration = 0;
          if (!v3)
            goto LABEL_46;
        }
      }
      if (!*(_BYTE *)(a1 + 80))
        break;
      v10 = *(_QWORD *)(a1 + 56);
      if (v10)
      {
        if (*(_QWORD *)(v5 + 80) == v10)
          break;
      }
      if (_activity_log_pred != -1)
        dispatch_once(&_activity_log_pred, &__block_literal_global_9);
      v11 = _activity_log__log;
      if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(_QWORD *)(a1 + 40);
        v13 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 136446722;
        v33 = v12;
        v34 = 2048;
        v35 = v5;
        v36 = 2048;
        v37 = v13;
        _os_log_impl(&dword_1DEE85000, v11, OS_LOG_TYPE_DEFAULT, "_xpc_activity_dispatch: %{public}s (%p): ignoring an activity with matching seqno because of reply connection mismatch %llu", buf, 0x20u);
        if (!v3)
          goto LABEL_46;
      }
      else
      {
LABEL_37:
        if (!v3)
          goto LABEL_46;
      }
    }
    if (_activity_log_pred != -1)
      dispatch_once(&_activity_log_pred, &__block_literal_global_9);
    v20 = _activity_log__log;
    if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
    {
      v21 = *(_QWORD *)(a1 + 40);
      v22 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 136446722;
      v33 = v21;
      v34 = 2048;
      v35 = v5;
      v36 = 2048;
      v37 = v22;
      _os_log_impl(&dword_1DEE85000, v20, OS_LOG_TYPE_DEFAULT, "_xpc_activity_dispatch: %{public}s (%p): found an activity with matching seqno %llu", buf, 0x20u);
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = xpc_retain((xpc_object_t)v5);
    goto LABEL_37;
  }
  v4 = 0;
LABEL_46:
  if ((v4 & 1) == 0
    && registration
    && !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)
    && registration[2] != -1)
  {
    if (_activity_log_pred != -1)
      dispatch_once(&_activity_log_pred, &__block_literal_global_9);
    v27 = _activity_log__log;
    if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
    {
      v28 = *(_QWORD *)(a1 + 40);
      v29 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 136446722;
      v33 = v28;
      v34 = 2048;
      v35 = 0;
      v36 = 2048;
      v37 = v29;
      _os_log_impl(&dword_1DEE85000, v27, OS_LOG_TYPE_DEFAULT, "_xpc_activity_dispatch: %{public}s (%p): An event was delivered before the process has checked in. Stashing pending_seqno %llu, transaction, endpoint", buf, 0x20u);
    }
    registration[6] = *(_QWORD *)(a1 + 48);
    os_release((void *)registration[8]);
    registration[8] = os_retain(*(void **)(a1 + 64));
    v30 = (void *)registration[7];
    if (v30)
    {
      xpc_release(v30);
      registration[7] = 0;
    }
    v31 = *(void **)(a1 + 72);
    if (v31)
    {
      xpc_retain(v31);
      registration[7] = *(_QWORD *)(a1 + 72);
    }
  }
}

void _xpc_activity_set_eligible(_BYTE *a1, int a2)
{
  char v2;
  char v3;
  _QWORD block[5];

  v2 = a1[136];
  if (a2)
    v3 = 2;
  else
    v3 = 0;
  a1[136] = v2 & 0xFD | v3;
  if ((v2 & 2) != 0 && (a2 & 1) == 0)
  {
    xpc_retain(a1);
    block[0] = MEMORY[0x1E0C87450];
    block[1] = 0x40000000;
    block[2] = ___xpc_activity_notify_eligibility_changed_handlers_block_invoke;
    block[3] = &__block_descriptor_tmp_121;
    block[4] = a1;
    dispatch_async((dispatch_queue_t)_xpc_activity_queue, block);
  }
}

void ___xpc_activity_dispatch_block_invoke_113(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  _xpc_connection_s *v5;
  uint64_t v6;
  int listener_port;
  mach_port_name_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _xpc_connection_s *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[7];
  char v25;
  uint8_t buf[4];
  _xpc_connection_s *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C874D8];
  if (_activity_log_pred != -1)
    dispatch_once(&_activity_log_pred, &__block_literal_global_9);
  v2 = _activity_log__log;
  if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    v5 = *(_xpc_connection_s **)(v4 + 24);
    *(_DWORD *)buf = 136446722;
    v27 = v5;
    v28 = 2048;
    v29 = v4;
    v30 = 2048;
    v31 = v3;
    _os_log_impl(&dword_1DEE85000, v2, OS_LOG_TYPE_DEFAULT, "_xpc_activity_dispatch: lower half, activity name %{public}s (%p), seqno from top half was %llu", buf, 0x20u);
  }
  v6 = *(_QWORD *)(a1 + 48);
  if (v6 && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 80))
  {
    if (*(_BYTE *)(a1 + 72))
      _xpc_mach_message_request_handoff_reply_cold_1();
    listener_port = _xpc_endpoint_get_listener_port(v6);
    v8 = _xpc_connection_copy_listener_port(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)
                                                      + 80));
    if (listener_port != v8)
    {
      v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
      xpc_connection_cancel(*(xpc_connection_t *)(v9 + 80));
      xpc_release(*(xpc_object_t *)(v9 + 80));
      *(_QWORD *)(v9 + 80) = 0;
    }
    if (_xpc_mach_port_release(v8))
      _os_assumes_log();
  }
  v10 = *(_QWORD *)(a1 + 56);
  if (v10)
  {
    if (!*(_BYTE *)(a1 + 72))
      _xpc_mach_message_request_handoff_reply_cold_1();
    if (v10 != *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 80))
      _xpc_mach_message_request_handoff_reply_cold_1();
    if (xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 64), "run") == &_xpc_BOOL_true)
    {
      v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
      *(_BYTE *)(v11 + 136) |= 2u;
      _xpc_activity_set_state_with_completion_status(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), 2, 0);
    }
  }
  if (*(_QWORD *)(a1 + 48))
  {
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 80))
    {
      if (*(_BYTE *)(a1 + 72))
        _xpc_mach_message_request_handoff_reply_cold_1();
      v12 = *(void **)(a1 + 64);
      if (!v12)
        _xpc_mach_message_request_handoff_reply_cold_1();
      xpc_retain(v12);
      v13 = xpc_connection_create_from_endpoint(*(xpc_endpoint_t *)(a1 + 48));
      xpc_connection_set_target_queue(v13, (dispatch_queue_t)_xpc_activity_queue);
      v14 = MEMORY[0x1E0C87450];
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 80) = v13;
      v24[0] = v14;
      v24[1] = 0x40000000;
      v24[2] = ___xpc_activity_dispatch_block_invoke_115;
      v24[3] = &__block_descriptor_tmp_116;
      v15 = *(_QWORD *)(a1 + 40);
      v24[4] = *(_QWORD *)(a1 + 64);
      v24[5] = v15;
      v25 = *(_BYTE *)(a1 + 72);
      v24[6] = v13;
      xpc_connection_set_event_handler(v13, v24);
      xpc_connection_activate(v13);
      if (_activity_log_pred != -1)
        dispatch_once(&_activity_log_pred, &__block_literal_global_9);
      v16 = _activity_log__log;
      if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
      {
        v17 = *(_QWORD *)(a1 + 40);
        v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
        v19 = *(_QWORD *)(v18 + 24);
        *(_DWORD *)buf = 134218754;
        v27 = v13;
        v28 = 2082;
        v29 = v19;
        v30 = 2048;
        v31 = v18;
        v32 = 2048;
        v33 = v17;
        _os_log_impl(&dword_1DEE85000, v16, OS_LOG_TYPE_DEFAULT, "_xpc_activity_dispatch: created connection %p for activity name %{public}s (%p), seqno %llu", buf, 0x2Au);
      }
    }
    v20 = *(void **)(a1 + 48);
    if (v20)
      xpc_release(v20);
  }
  v21 = *(void **)(a1 + 56);
  if (v21)
    xpc_release(v21);
  v22 = *(void **)(a1 + 64);
  if (v22)
    xpc_release(v22);
  if (!*(_BYTE *)(a1 + 72))
  {
    v23 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    *(_BYTE *)(v23 + 136) |= 2u;
    _xpc_activity_set_state_with_completion_status(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), 2, 0);
  }
  xpc_release(*(xpc_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
}

void ___xpc_activity_dispatch_block_invoke_115(uint64_t a1, __objc2_class **object)
{
  __objc2_class **value;
  __objc2_class **v5;
  const char *string;
  uint64_t registration;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C874D8];
  if (xpc_get_type(object) == (xpc_type_t)OS_xpc_error)
  {
    if (object == &_xpc_error_connection_invalid)
      xpc_release(*(xpc_object_t *)(a1 + 32));
  }
  else
  {
    value = (__objc2_class **)xpc_dictionary_get_value(object, "eligible");
    if (value)
    {
      v5 = value;
      string = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 32), "XPCEventName");
      registration = __xpc_activity_find_registration(string);
      if (registration)
      {
        v8 = *(_QWORD *)(registration + 24);
        if (v8)
        {
          v9 = 0;
          do
          {
            while (1)
            {
              v10 = v8;
              v8 = *(_QWORD *)(v8 + 120);
              if (*(_QWORD *)(v10 + 96) == *(_QWORD *)(a1 + 40))
              {
                if (!*(_BYTE *)(a1 + 56))
                  break;
                v11 = *(_QWORD *)(a1 + 48);
                if (v11)
                {
                  if (*(_QWORD *)(v10 + 80) == v11)
                    break;
                }
              }
              if (!v8)
                goto LABEL_20;
            }
            if (_activity_log_pred != -1)
              dispatch_once(&_activity_log_pred, &__block_literal_global_9);
            v12 = _activity_log__log;
            if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
            {
              v13 = *(_QWORD *)(a1 + 40);
              *(_DWORD *)buf = 136446722;
              v15 = string;
              v16 = 2048;
              v17 = v10;
              v18 = 2048;
              v19 = v13;
              _os_log_impl(&dword_1DEE85000, v12, OS_LOG_TYPE_DEFAULT, "_xpc_activity_dispatch: xpc_connection_set_event_handler: %{public}s (%p): found an activity with matching seqno %llu", buf, 0x20u);
            }
            v9 = (_BYTE *)v10;
          }
          while (v8);
LABEL_20:
          if (v9)
            _xpc_activity_set_eligible(v9, v5 == &_xpc_BOOL_true);
        }
      }
    }
  }
}

void ___xpc_activity_notify_eligibility_changed_handlers_block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  const void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD v9[6];

  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[7];
  if (v3)
  {
    v4 = MEMORY[0x1E0C87450];
    do
    {
      v5 = *(const void **)(v3 + 8);
      xpc_retain(*(xpc_object_t *)(a1 + 32));
      v6 = _Block_copy(v5);
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(NSObject **)(v7 + 40);
      v9[0] = v4;
      v9[1] = 0x40000000;
      v9[2] = ___xpc_activity_notify_eligibility_changed_handlers_block_invoke_2;
      v9[3] = &unk_1EA959CD0;
      v9[4] = v6;
      v9[5] = v7;
      dispatch_async(v8, v9);
      v3 = *(_QWORD *)(v3 + 16);
    }
    while (v3);
    v2 = *(_QWORD **)(a1 + 32);
  }
  xpc_release(v2);
}

void ___xpc_activity_notify_eligibility_changed_handlers_block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 40));
}

void _xpc_activity_set_state_with_completion_status(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[8];
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C874D8];
  if (_activity_log_pred != -1)
    dispatch_once(&_activity_log_pred, &__block_literal_global_9);
  v6 = _activity_log__log;
  if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 24);
    *(_DWORD *)buf = 136446722;
    v12 = v7;
    v13 = 2048;
    v14 = a1;
    v15 = 2048;
    v16 = a2;
    _os_log_impl(&dword_1DEE85000, v6, OS_LOG_TYPE_DEFAULT, "_xpc_activity_set_state: %{public}s (%p), %ld", buf, 0x20u);
  }
  if (a2)
  {
    if (*(_QWORD *)(a1 + 80))
    {
      if (*(_QWORD *)(a1 + 72) != a2)
      {
        *(_QWORD *)(a1 + 72) = a2;
        xpc_retain((xpc_object_t)a1);
        v8 = *(_QWORD *)(a1 + 88);
        v9 = *(NSObject **)(a1 + 40);
        v10[0] = MEMORY[0x1E0C87450];
        v10[1] = 0x40000000;
        v10[2] = ___xpc_activity_set_state_with_completion_status_block_invoke;
        v10[3] = &__block_descriptor_tmp_127;
        v10[4] = v8;
        v10[5] = a1;
        v10[6] = a2;
        v10[7] = a3;
        dispatch_async(v9, v10);
      }
    }
  }
  else
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    *(_QWORD *)(a1 + 64) = 0;
    __XPC_ACTIVITY_CALLING_HANDLER__(a1);
  }
}

uint64_t __XPC_ACTIVITY_CALLING_HANDLER__(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C874D8];
  if (_activity_log_pred != -1)
    dispatch_once(&_activity_log_pred, &__block_literal_global_9);
  v2 = _activity_log__log;
  if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 24);
    v4 = *(_QWORD *)(a1 + 64);
    v5 = *(_QWORD *)(a1 + 72);
    v14 = 136446978;
    v15 = v3;
    v16 = 2048;
    v17 = a1;
    v18 = 2048;
    v19 = v4;
    v20 = 2048;
    v21 = v5;
    _os_log_impl(&dword_1DEE85000, v2, OS_LOG_TYPE_DEFAULT, "__XPC_ACTIVITY_CALLING_HANDLER__: %{public}s (%p), current state %ld, pending state %ld", (uint8_t *)&v14, 0x2Au);
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, a1);
  if (_activity_log_pred != -1)
    dispatch_once(&_activity_log_pred, &__block_literal_global_9);
  v7 = _activity_log__log;
  if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 24);
    v9 = *(_QWORD *)(a1 + 64);
    v10 = *(_QWORD *)(a1 + 72);
    v14 = 136446978;
    v15 = v8;
    v16 = 2048;
    v17 = a1;
    v18 = 2048;
    v19 = v9;
    v20 = 2048;
    v21 = v10;
    _os_log_impl(&dword_1DEE85000, v7, OS_LOG_TYPE_DEFAULT, "__XPC_ACTIVITY_CALLING_HANDLER__ returned from handler: %{public}s (%p), current state %ld, pending state %ld", (uint8_t *)&v14, 0x2Au);
  }
  v11 = *(_QWORD *)(a1 + 72);
  if (!v11)
    v11 = *(_QWORD *)(a1 + 64);
  if (v11 > 5)
    abort();
  if (((1 << v11) & 0x29) != 0)
  {
    v12 = 1;
LABEL_18:
    _xpc_activity_set_state_with_completion_status(a1, v12, 0);
    return _os_avoid_tail_call();
  }
  if (((1 << v11) & 0x12) == 0)
  {
    v12 = 5;
    goto LABEL_18;
  }
  return _os_avoid_tail_call();
}

void ___xpc_activity_set_state_with_completion_status_block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  xpc_object_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _xpc_connection_s *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD v14[5];
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C874D8];
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD **)(a1 + 40);
  if (v3 == v2[11])
  {
    v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v4, "state", *(_QWORD *)(a1 + 48));
    if (*(_QWORD *)(a1 + 48) == 5)
      xpc_dictionary_set_int64(v4, "completion_status", *(_QWORD *)(a1 + 56));
    xpc_retain(*(xpc_object_t *)(a1 + 40));
    if (_activity_log_pred != -1)
      dispatch_once(&_activity_log_pred, &__block_literal_global_9);
    v5 = _activity_log__log;
    if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 40);
      v7 = *(_QWORD *)(a1 + 48);
      v8 = *(_QWORD *)(v6 + 24);
      *(_DWORD *)buf = 136446722;
      v17 = v8;
      v18 = 2048;
      v19 = v6;
      v20 = 2048;
      v21 = v7;
      _os_log_impl(&dword_1DEE85000, v5, OS_LOG_TYPE_DEFAULT, "_xpc_activity_set_state: send new state to CTS: %{public}s (%p), %ld", buf, 0x20u);
    }
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(_xpc_connection_s **)(v9 + 80);
    v11 = *(NSObject **)(v9 + 40);
    v14[0] = MEMORY[0x1E0C87450];
    v14[1] = 0x40000000;
    v14[2] = ___xpc_activity_set_state_with_completion_status_block_invoke_125;
    v14[3] = &__block_descriptor_tmp_126;
    v14[4] = v9;
    xpc_connection_send_message_with_reply(v10, v4, v11, v14);
    xpc_release(v4);
  }
  else
  {
    xpc_retain(v2);
    v12 = *(_QWORD *)(a1 + 40);
    v13 = *(NSObject **)(v12 + 40);
    block[0] = MEMORY[0x1E0C87450];
    block[1] = 0x40000000;
    block[2] = ___xpc_activity_set_state_with_completion_status_block_invoke_2;
    block[3] = &__block_descriptor_tmp_122;
    block[4] = v12;
    dispatch_async(v13, block);
  }
  xpc_release(*(xpc_object_t *)(a1 + 40));
}

void ___xpc_activity_set_state_with_completion_status_block_invoke_2(uint64_t a1)
{
  _xpc_activity_set_state_fakereply(*(_QWORD *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

void _xpc_activity_set_state_fakereply(uint64_t a1)
{
  xpc_object_t v2;
  void *v3;
  uint64_t v4;
  int64_t v5;

  v2 = xpc_dictionary_create(0, 0, 0);
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 72);
  if (!v4)
    v4 = *(_QWORD *)(a1 + 64);
  if (((v4 - 2) & 0xFFFFFFFFFFFFFFFDLL) != 0)
    v5 = 1;
  else
    v5 = 5;
  xpc_dictionary_set_int64(v2, "state", v5);
  _xpc_activity_set_state_from_cts(a1, v3);
  xpc_release(v3);
}

void ___xpc_activity_set_state_with_completion_status_block_invoke_125(uint64_t a1, xpc_object_t object)
{
  __objc2_class *type;
  uint64_t v5;

  type = (__objc2_class *)xpc_get_type(object);
  v5 = *(_QWORD *)(a1 + 32);
  if (type == OS_xpc_error)
    _xpc_activity_set_state_fakereply(v5);
  else
    _xpc_activity_set_state_from_cts(v5, object);
  xpc_release(*(xpc_object_t *)(a1 + 32));
}

void _xpc_activity_set_state_from_cts(uint64_t a1, void *a2)
{
  int64_t int64;
  NSObject *v5;
  uint64_t v6;
  __objc2_class **value;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  int64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C874D8];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
  int64 = xpc_dictionary_get_int64(a2, "state");
  if (*(_QWORD *)(a1 + 64) != int64 || *(_QWORD *)(a1 + 104) != *(_QWORD *)(a1 + 96))
  {
    if (_activity_log_pred != -1)
      dispatch_once(&_activity_log_pred, &__block_literal_global_9);
    v5 = _activity_log__log;
    if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 24);
      *(_DWORD *)buf = 136446722;
      v10 = v6;
      v11 = 2048;
      v12 = a1;
      v13 = 2048;
      v14 = int64;
      _os_log_impl(&dword_1DEE85000, v5, OS_LOG_TYPE_DEFAULT, "_xpc_activity_set_state_from_cts: %{public}s (%p), set activity state to %ld", buf, 0x20u);
    }
    *(_QWORD *)(a1 + 104) = *(_QWORD *)(a1 + 96);
    *(_QWORD *)(a1 + 64) = int64;
    *(_QWORD *)(a1 + 72) = 0;
    switch(int64)
    {
      case 1:
      case 3:
        goto LABEL_8;
      case 2:
        value = (__objc2_class **)xpc_dictionary_get_value(a2, "eligible");
        if (value)
          _xpc_activity_set_eligible((_BYTE *)a1, value == &_xpc_BOOL_true);
        __XPC_ACTIVITY_CALLING_HANDLER__(a1);
        break;
      case 5:
        if ((*(_BYTE *)(a1 + 136) & 4) == 0)
        {
          block[0] = MEMORY[0x1E0C87450];
          block[1] = 0x40000000;
          block[2] = ___xpc_activity_set_state_from_cts_block_invoke;
          block[3] = &__block_descriptor_tmp_128;
          block[4] = a1;
          dispatch_sync((dispatch_queue_t)_xpc_activity_queue, block);
        }
LABEL_8:
        _xpc_activity_end_running(a1);
        break;
      default:
        return;
    }
  }
}

BOOL ___xpc_activity_set_state_from_cts_block_invoke(uint64_t a1)
{
  _QWORD *registration;

  registration = _xpc_activity_find_registration(*(const char **)(*(_QWORD *)(a1 + 32) + 24));
  return _xpc_activity_unregister((uint64_t)registration, *(_QWORD *)(a1 + 32));
}

void __xpc_activity_unregister(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C874D8];
  if (_activity_log_pred != -1)
    dispatch_once(&_activity_log_pred, &__block_literal_global_9);
  v2 = _activity_log__log;
  if (os_log_type_enabled((os_log_t)_activity_log__log, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 24);
    v4 = *(_QWORD *)(a1 + 96);
    if ((*(_BYTE *)(a1 + 136) & 8) != 0)
      v5 = "(is registered)";
    else
      v5 = "(not registered)";
    v7 = 136446978;
    v8 = v3;
    v9 = 2048;
    v10 = a1;
    v11 = 2048;
    v12 = v4;
    v13 = 2082;
    v14 = v5;
    _os_log_impl(&dword_1DEE85000, v2, OS_LOG_TYPE_DEFAULT, "__xpc_activity_unregister: %{public}s (%p) seqno: %llu, %{public}s", (uint8_t *)&v7, 0x2Au);
  }
  if ((*(_BYTE *)(a1 + 136) & 8) != 0)
  {
    v6 = *(_QWORD *)(a1 + 120);
    *(_BYTE *)(a1 + 136) &= ~8u;
    if (v6)
      *(_QWORD *)(v6 + 128) = *(_QWORD *)(a1 + 128);
    **(_QWORD **)(a1 + 128) = v6;
    *(_QWORD *)(a1 + 120) = -1;
    *(_QWORD *)(a1 + 128) = -1;
    xpc_release((xpc_object_t)a1);
  }
}

void ___xpc_activity_create_control_channel_block_invoke()
{
  _xpc_connection_s *mach_service;

  _control_queue = (uint64_t)dispatch_queue_create_with_target_V2("com.apple.xpc.activity.control", 0, (dispatch_queue_t)_xpc_activity_queue);
  dispatch_suspend((dispatch_object_t)_control_queue);
  mach_service = xpc_connection_create_mach_service("com.apple.xpc.activity.control", (dispatch_queue_t)_control_queue, 0);
  xpc_connection_set_event_handler(mach_service, &__block_literal_global_134);
  _control_connection = (uint64_t)mach_service;
  xpc_connection_activate(mach_service);
  dispatch_resume((dispatch_object_t)_control_queue);
}

uint64_t _der_vm_context_to_xpc(__int128 *a1)
{
  __int128 v2;
  __int128 v3;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;

  v2 = a1[1];
  v5 = *a1;
  v6 = v2;
  v7 = a1[2];
  v8 = *((_QWORD *)a1 + 6);
  if (!der_vm_context_is_valid((uint64_t)&v5))
    return 0;
  v3 = a1[1];
  v5 = *a1;
  v6 = v3;
  v7 = a1[2];
  v8 = *((_QWORD *)a1 + 6);
  return _objectForActiveContext((uint64_t *)&v5);
}

uint64_t _objectForActiveContext(uint64_t *a1)
{
  uint64_t v2;
  __int128 v3;
  xpc_object_t empty;
  uint64_t v5;
  __int128 v6;
  int64_t v7;
  uint64_t no_copy;
  __int128 v9;
  const char *v10;
  __int128 v11;
  char v12;
  __int128 v13;
  unsigned __int8 *v14;
  size_t v15;
  uint64_t result;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v2 = *a1;
  v3 = *((_OWORD *)a1 + 1);
  v22 = *(_OWORD *)a1;
  v23 = v3;
  v24 = *((_OWORD *)a1 + 2);
  v25 = a1[6];
  switch(der_vm_CEType_from_context((uint64_t)&v22, 0))
  {
    case 1u:
      v18 = *(_OWORD *)a1;
      v19 = *((_OWORD *)a1 + 1);
      v20 = *((_OWORD *)a1 + 2);
      v21 = a1[6];
      empty = xpc_dictionary_create_empty();
      goto LABEL_4;
    case 2u:
      v18 = *(_OWORD *)a1;
      v19 = *((_OWORD *)a1 + 1);
      v20 = *((_OWORD *)a1 + 2);
      v21 = a1[6];
      empty = xpc_array_create_empty();
LABEL_4:
      v5 = (uint64_t)empty;
      v22 = v18;
      v23 = v19;
      v24 = v20;
      v25 = v21;
      der_vm_iterate((unint64_t)&v22, (uint64_t)empty, (uint64_t)_manufacturingCallback);
      goto LABEL_10;
    case 3u:
      v6 = *((_OWORD *)a1 + 1);
      v22 = *(_OWORD *)a1;
      v23 = v6;
      v24 = *((_OWORD *)a1 + 2);
      v25 = a1[6];
      v7 = der_vm_integer_from_context((uint64_t)&v22);
      no_copy = (uint64_t)xpc_int64_create(v7);
      goto LABEL_9;
    case 4u:
      v9 = *((_OWORD *)a1 + 1);
      v22 = *(_OWORD *)a1;
      v23 = v9;
      v24 = *((_OWORD *)a1 + 2);
      v25 = a1[6];
      v10 = (const char *)string_for_context((uint64_t)&v22);
      no_copy = xpc_string_create_no_copy(v10);
      goto LABEL_9;
    case 5u:
      v11 = *((_OWORD *)a1 + 1);
      v22 = *(_OWORD *)a1;
      v23 = v11;
      v24 = *((_OWORD *)a1 + 2);
      v25 = a1[6];
      v12 = der_vm_BOOL_from_context((uint64_t)&v22);
      no_copy = (uint64_t)xpc_BOOL_create(v12);
      goto LABEL_9;
    case 6u:
      v13 = *((_OWORD *)a1 + 1);
      v22 = *(_OWORD *)a1;
      v23 = v13;
      v24 = *((_OWORD *)a1 + 2);
      v25 = a1[6];
      v14 = der_vm_data_from_context((uint64_t)&v22);
      no_copy = (uint64_t)xpc_data_create(v14, v15);
LABEL_9:
      v5 = no_copy;
LABEL_10:
      result = v5;
      break;
    default:
      v17 = (*(uint64_t (**)(uint64_t, const char *, ...))(v2 + 32))(v2, "[%s]: %s\n", "_objectForActiveContext", "CoreEntitlements: unknown DER type");
      result = xpc_create_from_ce_der(v17);
      break;
  }
  return result;
}

uint64_t xpc_create_from_ce_der(unsigned __int8 *a1, uint64_t a2)
{
  void *v2;
  uint64_t result;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v12 = 0uLL;
  v13 = 0;
  v2 = (void *)CEValidate((uint64_t)&_CERuntimeImpl, (uint64_t *)&v12, a1, &a1[a2]);
  result = 0;
  if (v2 == &Errors)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v4 = v12;
    *(_QWORD *)&v5 = v13;
    if ((_UNKNOWN *)CEAcquireUnmanagedContext((uint64_t)&_CERuntimeImpl, &v4, (uint64_t)&v8) == &Errors)
    {
      v4 = v8;
      v5 = v9;
      v6 = v10;
      v7 = v11;
      return _der_vm_context_to_xpc(&v4);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t xpc_create_from_ce_der_with_key(unsigned __int8 *a1, uint64_t a2, const char *a3)
{
  void *v4;
  uint64_t result;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  size_t v19;
  __int128 v20;
  size_t v21;
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
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C874D8];
  v18 = 0uLL;
  v19 = 0;
  v4 = (void *)CEValidate((uint64_t)&_CERuntimeImpl, (uint64_t *)&v18, a1, &a1[a2]);
  result = 0;
  if (v4 == &Errors)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v20 = v18;
    v21 = v19;
    if ((_UNKNOWN *)CEAcquireUnmanagedContext((uint64_t)&_CERuntimeImpl, &v20, (uint64_t)&v14) == &Errors)
    {
      v36 = 0;
      v35 = 0u;
      v34 = 0u;
      v33 = 0u;
      v32 = 0u;
      v31 = 0u;
      v30 = 0u;
      v29 = 0u;
      v28 = 0u;
      v27 = 0u;
      v26 = 0u;
      v25 = 0u;
      v24 = 0u;
      v23 = 0u;
      v22 = 0u;
      *(_QWORD *)&v20 = 0x4000000000000001;
      *((_QWORD *)&v20 + 1) = a3;
      v21 = strlen(a3);
      v13 = 0;
      v11 = 0u;
      v12 = 0u;
      v10 = 0u;
      v6 = v14;
      v7 = v15;
      v8 = v16;
      v9 = v17;
      der_vm_execute_nocopy((unint64_t)&v6, (uint64_t)&v20, (uint64_t)&v10);
      v6 = v10;
      v7 = v11;
      v8 = v12;
      v9 = v13;
      return _der_vm_context_to_xpc(&v6);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t _manufacturingCallback(uint64_t *a1)
{
  uint64_t v2;
  int v3;
  __int128 v4;
  void *v5;
  void *v6;
  void *v7;
  __int128 v8;
  char *v9;
  xpc_object_t active;
  __int128 v11;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  _OWORD v18[3];
  uint64_t v19;
  _OWORD v20[3];
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  _OWORD v26[16];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C874D8];
  v2 = *a1;
  v3 = *((_DWORD *)a1 + 29);
  if (v3 == 2)
  {
    if (*((_DWORD *)a1 + 28) == 1)
    {
      v7 = (void *)a1[15];
      v14 = *(_OWORD *)(a1 + 7);
      v15 = *(_OWORD *)(a1 + 9);
      v16 = *(_OWORD *)(a1 + 11);
      v17 = a1[13];
      v25 = 0;
      v23 = 0u;
      v24 = 0u;
      v22 = 0u;
      memset((char *)v26 + 8, 0, 248);
      v8 = *(_OWORD *)(a1 + 9);
      v20[0] = *(_OWORD *)(a1 + 7);
      v20[1] = v8;
      v20[2] = *(_OWORD *)(a1 + 11);
      v21 = a1[13];
      *(_QWORD *)&v26[0] = 2;
      der_vm_execute((unint64_t)v20, (unint64_t)v26, (uint64_t)&v22);
      v26[0] = v22;
      v26[1] = v23;
      v26[2] = v24;
      *(_QWORD *)&v26[3] = v25;
      v9 = (char *)string_for_context((uint64_t)v26);
      v18[0] = v14;
      v18[1] = v15;
      v18[2] = v16;
      v19 = v17;
      v26[0] = xmmword_1DEEBD3D0;
      memset(&v26[1], 0, 240);
      der_vm_execute((unint64_t)v18, (unint64_t)v26, (uint64_t)v20);
      active = (xpc_object_t)_objectForActiveContext(v20);
      xpc_dictionary_set_value(v7, v9, active);
      free(v9);
    }
    else
    {
      active = xpc_array_create_empty();
      v11 = *(_OWORD *)(a1 + 9);
      v26[0] = *(_OWORD *)(a1 + 7);
      v26[1] = v11;
      v26[2] = *(_OWORD *)(a1 + 11);
      *(_QWORD *)&v26[3] = a1[13];
      if ((_UNKNOWN *)der_vm_iterate((unint64_t)v26, (uint64_t)active, (uint64_t)_manufacturingCallback) != &Errors)
      {
        v13 = (*(uint64_t (**)(uint64_t, const char *, ...))(v2 + 32))(v2, "[%s]: %s\n", "_manufacturingCallback", "CoreEntitlements: Couldn't iterate over DER entitlements\n");
        return (uint64_t)string_for_context(v13);
      }
      xpc_array_set_value((xpc_object_t)a1[15], 0xFFFFFFFFFFFFFFFFLL, active);
    }
    v6 = active;
    goto LABEL_10;
  }
  if (v3)
  {
    if (*((_DWORD *)a1 + 28) == 2)
    {
      v4 = *(_OWORD *)(a1 + 9);
      v26[0] = *(_OWORD *)(a1 + 7);
      v26[1] = v4;
      v26[2] = *(_OWORD *)(a1 + 11);
      *(_QWORD *)&v26[3] = a1[13];
      v5 = (void *)_objectForActiveContext(v26);
      xpc_array_set_value((xpc_object_t)a1[15], 0xFFFFFFFFFFFFFFFFLL, v5);
      v6 = v5;
LABEL_10:
      xpc_release(v6);
      return 1;
    }
    v13 = (*(uint64_t (**)(uint64_t, const char *, ...))(v2 + 32))(v2, "[%s]: %s\n", "_manufacturingCallback", "CoreEntitlements: not a sequence");
  }
  else
  {
    v13 = (*(uint64_t (**)(uint64_t, const char *, ...))(v2 + 32))(v2, "[%s]: %s\n", "_manufacturingCallback", "CoreEntitlements: unknown DER type");
  }
  return (uint64_t)string_for_context(v13);
}

void *string_for_context(uint64_t a1)
{
  __int128 v1;
  unsigned __int8 *v2;
  size_t v3;
  size_t v4;
  void *v5;
  _OWORD v7[3];
  uint64_t v8;

  v1 = *(_OWORD *)(a1 + 16);
  v7[0] = *(_OWORD *)a1;
  v7[1] = v1;
  v7[2] = *(_OWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 48);
  v2 = der_vm_string_from_context((uint64_t)v7);
  v4 = v3;
  v5 = _xpc_alloc(v3 + 1);
  memcpy(v5, v2, v4);
  return v5;
}

void *_ce_malloc(int a1, size_t size)
{
  return malloc_type_malloc(size, 0x78220757uLL);
}

void _ce_free(int a1, void *a2)
{
  free(a2);
}

void _ce_log(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  vsyslog(7, a2, &a9);
}

void _ce_abort(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  vsyslog(2, a2, &a9);
  qword_1F0460B90 = (uint64_t)"Data corruption: CoreEntitlements has aborted due to an unrecoverable error";
  __break(1u);
}

unsigned int *xpc_format_specifiers_lookup(const char *a1, int a2)
{
  size_t v3;
  unsigned int v4;
  unsigned int *v5;
  uint64_t v6;
  char *v7;

  if ((a2 - 2) > 0x10)
    return 0;
  v3 = (a2 - 1);
  v4 = specifier_hash_asso_values[a1[v3]] + a2;
  if (v4 > 0x13)
    return 0;
  v5 = (unsigned int *)((char *)&xpc_format_specifiers_lookup_wordlist + 12 * v4);
  v6 = *v5;
  if ((v6 & 0x80000000) != 0)
    return 0;
  v7 = (char *)&stringpool_contents[v6];
  if (*(unsigned __int8 *)a1 != stringpool_contents[v6] || strncmp(a1 + 1, v7 + 1, v3) || v7[a2])
    return 0;
  return v5;
}

uint64_t (*notify_server_routine(uint64_t a1))()
{
  int v1;

  v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 73) >= 0xFFFFFFF7)
    return do_notify_subsystem[5 * (v1 - 64) + 5];
  else
    return 0;
}

_DWORD *_Xmach_notify_port_deleted(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) == 0 && result[1] == 36)
    do_mach_notify_port_deleted();
  *(_DWORD *)(a2 + 32) = -304;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C87D40];
  return result;
}

uint64_t _Xmach_notify_port_destroyed(uint64_t result, uint64_t a2)
{
  int v3;

  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 40)
  {
    if (*(unsigned __int16 *)(result + 38) << 16 == 0x100000)
    {
      result = do_mach_notify_port_destroyed(*(unsigned int *)(result + 12), *(_DWORD *)(result + 28));
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    v3 = -300;
  }
  else
  {
    v3 = -304;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C87D40];
  return result;
}

_DWORD *_Xmach_notify_no_senders(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C87D40];
  }
  else
  {
    result = (_DWORD *)do_mach_notify_no_senders();
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }
  return result;
}

_DWORD *_Xmach_notify_send_once(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C87D40];
  }
  else
  {
    result = (_DWORD *)do_mach_notify_send_once(result[3]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }
  return result;
}

_DWORD *_Xmach_notify_dead_name(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) == 0 && result[1] == 36)
    do_mach_notify_dead_name();
  *(_DWORD *)(a2 + 32) = -304;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C87D40];
  return result;
}

uint64_t notify_server(_DWORD *a1, uint64_t a2)
{
  int v2;
  int v3;
  int v4;
  void (*v5)(void);
  uint64_t result;

  v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  v3 = a1[5] + 100;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  v4 = a1[5];
  if ((v4 - 73) >= 0xFFFFFFF7
    && (v5 = (void (*)(void))do_notify_subsystem[5 * (v4 - 64) + 5]) != 0)
  {
    v5();
    return 1;
  }
  else
  {
    result = 0;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C87D40];
    *(_DWORD *)(a2 + 32) = -303;
  }
  return result;
}

BOOL ccder_blob_encode_body(_QWORD *a1, unint64_t a2, const void *a3)
{
  _BOOL8 v5;
  void *__dst[2];

  if (!a3)
    return a2 == 0;
  __dst[0] = 0;
  __dst[1] = 0;
  v5 = ccder_blob_reserve(a1, a2, __dst);
  if (v5)
    memmove(__dst[0], a3, a2);
  return v5;
}

uint64_t ccder_blob_decode_range(unsigned __int8 **a1, uint64_t a2, unsigned __int8 **a3)
{
  uint64_t result;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  unint64_t v8;

  v8 = 0;
  result = ccder_blob_decode_tl_internal(a1, a2, &v8, 0);
  if ((_DWORD)result)
  {
    v6 = *a1;
    v7 = &(*a1)[v8];
    *a1 = v7;
    *a3 = v6;
    a3[1] = v7;
  }
  else
  {
    *a3 = 0;
    a3[1] = 0;
  }
  return result;
}

uint64_t ccder_blob_decode_len_strict(unsigned __int8 **a1, unint64_t *a2)
{
  return ccder_blob_decode_len_internal(a1, a2, 1);
}

uint64_t ccder_blob_decode_len_internal(unsigned __int8 **a1, unint64_t *a2, int a3)
{
  unint64_t v3;
  unsigned __int8 *v4;
  BOOL v5;
  unsigned __int8 *v7;
  unint64_t v8;
  uint64_t result;
  int v10;

  v4 = *a1;
  v3 = (unint64_t)a1[1];
  if (*a1)
    v5 = v3 == 0;
  else
    v5 = 1;
  if (v5 || (unint64_t)v4 >= v3)
    goto LABEL_10;
  v7 = v4 + 1;
  v8 = *v4;
  if ((char)*v4 < 0)
  {
    switch(*v4)
    {
      case 0x81u:
        if ((uint64_t)(v3 - (_QWORD)v7) >= 1)
        {
          v7 = v4 + 2;
          v10 = (char)v4[1];
          v8 = v10;
          if (!a3 || v10 < 0)
            break;
        }
        goto LABEL_10;
      case 0x82u:
        if ((uint64_t)(v3 - (_QWORD)v7) >= 2)
        {
          v7 = v4 + 3;
          v8 = __rev16(*(unsigned __int16 *)(v4 + 1));
          if (!a3 || v8 >= 0x100)
            break;
        }
        goto LABEL_10;
      case 0x83u:
        if ((uint64_t)(v3 - (_QWORD)v7) >= 3)
        {
          v7 = v4 + 4;
          v8 = ((unint64_t)v4[1] << 16) | ((unint64_t)v4[2] << 8) | v4[3];
          if (!a3 || v8 >= 0x10000)
            break;
        }
        goto LABEL_10;
      case 0x84u:
        if ((uint64_t)(v3 - (_QWORD)v7) >= 4)
        {
          v7 = v4 + 5;
          v8 = bswap32(*(_DWORD *)(v4 + 1));
          if (!a3 || v8 >> 24)
            break;
        }
        goto LABEL_10;
      default:
        goto LABEL_10;
    }
  }
  if (v3 - (unint64_t)v7 < v8)
  {
LABEL_10:
    result = 0;
    *a2 = 0;
  }
  else
  {
    *a2 = v8;
    *a1 = v7;
    return 1;
  }
  return result;
}

uint64_t ccder_blob_decode_len(unsigned __int8 **a1, unint64_t *a2)
{
  return ccder_blob_decode_len_internal(a1, a2, 0);
}

uint64_t ccder_blob_decode_sequence_tl(unsigned __int8 **a1, unsigned __int8 **a2)
{
  return ccder_blob_decode_range(a1, 0x2000000000000010, a2);
}

uint64_t ccder_blob_decode_tag(unsigned __int8 **a1, unint64_t *a2)
{
  unsigned __int8 *v2;
  unint64_t v3;
  BOOL v4;
  uint64_t v5;
  unsigned __int8 *v6;
  unint64_t v7;
  unsigned int v8;
  unint64_t v9;
  unint64_t v10;
  char v11;

  v2 = *a1;
  v3 = (unint64_t)a1[1];
  if (*a1)
    v4 = (unint64_t)v2 >= v3;
  else
    v4 = 1;
  if (v4)
    return 0;
  v8 = *v2;
  v6 = v2 + 1;
  v7 = v8;
  v9 = v8 & 0x1F;
  if (v9 == 31)
  {
    v9 = 0;
    while (1)
    {
      v5 = 0;
      if ((unint64_t)v6 >= v3)
        break;
      v10 = v9;
      if (v9 >> 57)
        break;
      v11 = *v6++;
      v9 = v11 & 0x7F | (v9 << 7);
      if ((v11 & 0x80) == 0)
      {
        if (v10 >> 54)
          return 0;
        goto LABEL_13;
      }
    }
  }
  else
  {
LABEL_13:
    *a2 = v9 | (v7 >> 5 << 61);
    *a1 = v6;
    return 1;
  }
  return v5;
}

uint64_t ccder_blob_decode_tl_internal(unsigned __int8 **a1, uint64_t a2, unint64_t *a3, int a4)
{
  int v8;
  uint64_t result;
  unint64_t v10;

  v10 = 0;
  *a3 = 0;
  v8 = ccder_blob_decode_tag(a1, &v10);
  result = 0;
  if (v8 && v10 == a2)
  {
    if (a4)
      return ccder_blob_decode_len_strict(a1, a3);
    else
      return ccder_blob_decode_len(a1, a3);
  }
  return result;
}

uint64_t ccder_blob_decode_tl(unsigned __int8 **a1, uint64_t a2, unint64_t *a3)
{
  return ccder_blob_decode_tl_internal(a1, a2, a3, 0);
}

BOOL ccder_blob_reserve(_QWORD *a1, unint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  unint64_t v4;

  v3 = a1[1];
  v4 = v3 - *a1;
  if (v4 < a2)
  {
    *a3 = 0;
    a3[1] = 0;
  }
  else
  {
    a1[1] = v3 - a2;
    *a3 = v3 - a2;
    a3[1] = v3;
  }
  return v4 >= a2;
}

uint64_t ccder_blob_reserve_tl(uint64_t *a1, unint64_t a2, unint64_t a3, _QWORD *a4)
{
  uint64_t result;
  __int128 v9;

  v9 = 0uLL;
  *a4 = 0;
  a4[1] = 0;
  result = ccder_blob_reserve(a1, a3, &v9);
  if ((_DWORD)result)
  {
    result = ccder_blob_encode_tl(a1, a2, a3);
    if ((_DWORD)result)
    {
      *(_OWORD *)a4 = v9;
      return 1;
    }
  }
  return result;
}

uint64_t ccder_blob_encode_len(uint64_t *a1, unint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;

  if (HIDWORD(a2))
    return 0;
  v3 = *a1;
  v2 = a1[1];
  if (a2 > 0x7F)
  {
    if (a2 > 0xFF)
    {
      if (a2 >> 16)
      {
        if (a2 >> 24)
        {
          if (v3 + 5 <= v2)
          {
            *(_BYTE *)(v2 - 5) = -124;
            v4 = v2 - 5;
            *(_DWORD *)(v4 + 1) = bswap32(a2);
            goto LABEL_17;
          }
        }
        else if (v3 + 4 <= v2)
        {
          *(_BYTE *)(v2 - 4) = -125;
          v4 = v2 - 4;
          *(_WORD *)(v4 + 2) = bswap32(a2) >> 16;
          *(_BYTE *)(v4 + 1) = BYTE2(a2);
          goto LABEL_17;
        }
      }
      else if (v3 + 3 <= v2)
      {
        *(_BYTE *)(v2 - 3) = -126;
        v4 = v2 - 3;
        *(_WORD *)(v4 + 1) = bswap32(a2) >> 16;
        goto LABEL_17;
      }
    }
    else if (v3 + 2 <= v2)
    {
      *(_BYTE *)(v2 - 2) = -127;
      v4 = v2 - 2;
      *(_BYTE *)(v4 + 1) = a2;
      goto LABEL_17;
    }
    return 0;
  }
  if (v3 + 1 > v2)
    return 0;
  *(_BYTE *)(v2 - 1) = a2;
  v4 = v2 - 1;
LABEL_17:
  *a1 = v3;
  a1[1] = v4;
  return 1;
}

uint64_t ccder_blob_encode_tag(uint64_t *a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  char v7;
  unsigned int v8;
  unint64_t v9;
  uint64x2_t v11;
  int16x8_t v12;

  v3 = *a1;
  v2 = a1[1];
  v4 = a2 & 0x1FFFFFFFFFFFFFFFLL;
  if ((a2 & 0x1FFFFFFFFFFFFFFFLL) > 0x1E)
  {
    if (v4 <= 0x7F)
    {
      if ((unint64_t)(v2 - v3) < 2)
        return 0;
      *(_BYTE *)(v2 - 1) = a2;
      v6 = (_BYTE *)(v2 - 1);
LABEL_18:
      *(v6 - 1) = HIBYTE(a2) | 0x1F;
      v5 = v6 - 1;
      goto LABEL_19;
    }
    if (v4 >> 14)
    {
      if (v4 >> 21)
      {
        v9 = v2 - v3;
        if (v4 >> 28)
        {
          if (v9 < 6)
            return 0;
          v11 = (uint64x2_t)vdupq_n_s64(a2);
          v12 = (int16x8_t)vuzp1q_s32((int32x4_t)vshlq_u64(v11, (uint64x2_t)xmmword_1DEEBD670), (int32x4_t)vshlq_u64(v11, (uint64x2_t)xmmword_1DEEBD660));
          v12.i64[0] = *(_QWORD *)&vmovn_s32((int32x4_t)v12) | 0x80008000800080;
          *(_DWORD *)(v2 - 5) = vmovn_s16(v12).u32[0];
          v6 = (_BYTE *)(v2 - 5);
          v6[4] = a2 & 0x7F;
          goto LABEL_18;
        }
        if (v9 < 5)
          return 0;
        *(_BYTE *)(v2 - 4) = (a2 >> 21) | 0x80;
        v6 = (_BYTE *)(v2 - 4);
        v6[3] = a2 & 0x7F;
        v6[2] = (a2 >> 7) | 0x80;
        v8 = a2 >> 14;
      }
      else
      {
        if ((unint64_t)(v2 - v3) < 4)
          return 0;
        *(_BYTE *)(v2 - 3) = (a2 >> 14) | 0x80;
        v6 = (_BYTE *)(v2 - 3);
        v6[2] = a2 & 0x7F;
        v8 = a2 >> 7;
      }
      v7 = v8 | 0x80;
    }
    else
    {
      if ((unint64_t)(v2 - v3) < 3)
        return 0;
      v7 = a2 & 0x7F;
      *(_BYTE *)(v2 - 2) = (a2 >> 7) | 0x80;
      v6 = (_BYTE *)(v2 - 2);
    }
    v6[1] = v7;
    goto LABEL_18;
  }
  if (v2 != v3)
  {
    *(_BYTE *)(v2 - 1) = HIBYTE(a2) & 0xE0 | a2;
    v5 = (_BYTE *)(v2 - 1);
LABEL_19:
    *a1 = v3;
    a1[1] = (uint64_t)v5;
    return 1;
  }
  return 0;
}

uint64_t ccder_blob_encode_tl(uint64_t *a1, unint64_t a2, unint64_t a3)
{
  uint64_t result;

  result = ccder_blob_encode_len(a1, a3);
  if ((_DWORD)result)
    return ccder_blob_encode_tag(a1, a2);
  return result;
}

uint64_t ccder_sizeof(uint64_t a1, unint64_t a2)
{
  uint64_t v3;

  v3 = ccder_sizeof_tag(a1);
  return v3 + a2 + ccder_sizeof_len(a2);
}

uint64_t ccder_blob_encode_body_tl(uint64_t *a1, unint64_t a2, unint64_t a3, const void *a4)
{
  uint64_t result;

  result = ccder_blob_encode_body(a1, a3, a4);
  if ((_DWORD)result)
    return ccder_blob_encode_tl(a1, a2, a3);
  return result;
}

uint64_t ccder_sizeof_len(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (a1 < 0x80)
    return 1;
  v2 = 3;
  v3 = 4;
  v4 = 5;
  v5 = 6;
  v6 = 7;
  v7 = 8;
  if (HIBYTE(a1))
    v7 = 9;
  if (HIWORD(a1))
    v6 = v7;
  if (a1 >> 40)
    v5 = v6;
  if (HIDWORD(a1))
    v4 = v5;
  if (a1 >> 24)
    v3 = v4;
  if (a1 >= 0x10000)
    v2 = v3;
  if (a1 >= 0x100)
    return v2;
  else
    return 2;
}

uint64_t ccder_sizeof_tag(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = a1 & 0x1FFFFFFFFFFFFFFFLL;
  v2 = 2;
  v3 = 3;
  v4 = 4;
  v5 = 5;
  if ((a1 & 0x1FFFFFFFFFFFFFFFuLL) >> 28)
    v5 = 6;
  if (v1 >= 0x200000)
    v4 = v5;
  if (v1 >= 0x4000)
    v3 = v4;
  if (v1 >= 0x80)
    v2 = v3;
  if (v1 >= 0x1F)
    return v2;
  else
    return 1;
}

uint64_t cc_clear(rsize_t __n, void *__s)
{
  return memset_s(__s, __n, 0, __n);
}

uint64_t amfi_interface_cdhash_in_trustcache(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t result;

  result = 22;
  if (a1 && a2 == 20 && a3)
  {
    *a3 = 0;
    result = __sandbox_ms();
    if ((_DWORD)result)
      return *__error();
    else
      *a3 = 0;
  }
  return result;
}

uint64_t amfi_interface_query_bootarg_state(_QWORD *a1)
{
  uint64_t result;

  if (!a1)
    return 22;
  *a1 = 0;
  result = __sandbox_ms();
  if ((_DWORD)result)
    return *__error();
  *a1 = 0;
  return result;
}

uint64_t amfi_interface_get_local_signing_private_key(_BYTE *a1)
{
  uint64_t result;
  _OWORD __s2[9];
  char v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C874D8];
  v4 = 0;
  memset(__s2, 0, sizeof(__s2));
  if (!a1)
    return 22;
  a1[144] = 0;
  *((_OWORD *)a1 + 7) = 0uLL;
  *((_OWORD *)a1 + 8) = 0uLL;
  *((_OWORD *)a1 + 5) = 0uLL;
  *((_OWORD *)a1 + 6) = 0uLL;
  *((_OWORD *)a1 + 3) = 0uLL;
  *((_OWORD *)a1 + 4) = 0uLL;
  *((_OWORD *)a1 + 1) = 0uLL;
  *((_OWORD *)a1 + 2) = 0uLL;
  *(_OWORD *)a1 = 0uLL;
  result = __sandbox_ms();
  if (!(_DWORD)result)
    return 2 * (memcmp(a1, __s2, 0x91uLL) == 0);
  return result;
}

uint64_t amfi_interface_get_local_signing_public_key(_BYTE *a1)
{
  uint64_t result;
  _OWORD __s2[6];
  char v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C874D8];
  v4 = 0;
  memset(__s2, 0, sizeof(__s2));
  if (!a1)
    return 22;
  a1[96] = 0;
  *((_OWORD *)a1 + 4) = 0uLL;
  *((_OWORD *)a1 + 5) = 0uLL;
  *((_OWORD *)a1 + 2) = 0uLL;
  *((_OWORD *)a1 + 3) = 0uLL;
  *(_OWORD *)a1 = 0uLL;
  *((_OWORD *)a1 + 1) = 0uLL;
  result = __sandbox_ms();
  if (!(_DWORD)result)
    return 2 * (memcmp(a1, __s2, 0x61uLL) == 0);
  return result;
}

uint64_t amfi_interface_set_local_signing_public_key(const void *a1)
{
  _OWORD __s2[6];
  char v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C874D8];
  v3 = 0;
  memset(__s2, 0, sizeof(__s2));
  if (!a1 || !memcmp(a1, __s2, 0x61uLL))
    return 22;
  else
    return __sandbox_ms();
}

uint64_t amfi_interface_authorize_local_signing()
{
  return __sandbox_ms();
}

BOOL amfi_developer_mode_status()
{
  uint64_t v2;
  size_t v3;

  v2 = 0;
  v3 = 8;
  return !sysctlbyname("security.mac.amfi.developer_mode_status", &v2, &v3, 0, 0) && v2 == 1;
}

BOOL amfi_developer_mode_resolved()
{
  uint64_t v2;
  size_t v3;

  v2 = 0;
  v3 = 8;
  return !sysctlbyname("security.mac.amfi.developer_mode_resolved", &v2, &v3, 0, 0) && v2 == 1;
}

uint64_t amfi_launch_constraint_set_spawnattr(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 && a2 && (unint64_t)(a3 - 1) <= 0x3FFE)
    return posix_spawnattr_setmacpolicyinfo_np();
  else
    return 22;
}

uint64_t amfi_launch_constraint_matches_process(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  int *v4;
  uint64_t result;
  int v6;
  _QWORD v7[129];

  v4 = (int *)a4;
  v7[128] = *MEMORY[0x1E0C874D8];
  if (a2 && a3)
  {
    if (a3 <= 0x4000)
    {
      bzero(v7, 0x400uLL);
      v6 = 5;
      if (!v4)
        v4 = &v6;
      if (!__sandbox_ms() && !*v4)
        return 1;
    }
    else if (a4)
    {
      result = 0;
      *(_DWORD *)a4 = 5;
      strcpy((char *)(a4 + 4), "Constraint too large");
      return result;
    }
  }
  else if (a4)
  {
    result = 0;
    *(_DWORD *)a4 = 5;
    strcpy((char *)(a4 + 4), "No Constraint provided");
    return result;
  }
  return 0;
}

uint64_t amfi_restricted_execution_mode_enable()
{
  return __sandbox_ms();
}

BOOL amfi_restricted_execution_mode_status()
{
  return __sandbox_ms() == 0;
}

_QWORD *CESizeSerialization(_QWORD *result, unint64_t a2, uint64_t *a3)
{
  unint64_t v3;
  _QWORD *v4;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;

  *a3 = 0;
  v10 = 0;
  if (a2 <= 1 || *result != 7)
    return &unk_1EA95A020;
  v3 = (unint64_t)&result[4 * a2];
  v4 = (_QWORD *)(v3 - 32);
  if (v3 >= 0x20 && v4 >= result)
  {
    if (*v4 == 8)
    {
      v8 = result + 4;
      v9 = &result[4 * a2];
      v6 = (void *)der_size_dictionary((uint64_t)result, (uint64_t)&v8, &v10);
      if (v6 == &Errors)
      {
        if (v8 == v9)
        {
          v7 = ccder_sizeof(2, 1uLL);
          *a3 = ccder_sizeof(0x6000000000000010, v10 + v7);
        }
        else
        {
          return &unk_1EA95A040;
        }
      }
      return v6;
    }
    return &unk_1EA95A020;
  }
  __break(0x5519u);
  return result;
}

uint64_t CESerializeWithOptions(uint64_t result, _BYTE *a2, unint64_t a3, uint64_t a4, unsigned __int8 *a5, unsigned __int8 *a6)
{
  void *v6;
  unint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  int v14;
  unint64_t v15;
  char *v16;
  char v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  char *v21;
  char *v22;
  unint64_t v23;
  char *v24;
  BOOL v25;
  char *v26;
  uint64_t v28;
  uint64_t v29;
  rsize_t __n;
  uint64_t v31;
  char *v33;
  unint64_t v34;
  uint64_t v35;
  unsigned __int8 *v36;
  unsigned __int8 *v37;

  v31 = result;
  v36 = 0;
  v37 = 0;
  if (a5 <= a6)
  {
    v36 = a5;
    v37 = a6;
    __n = a6 - a5;
    if (a6 > a5)
    {
      v11 = a3 + 32 * a4;
      v12 = (_QWORD *)(v11 - 32);
      v13 = a4;
      while (2)
      {
        if ((--v13 & 0x8000000000000000) == 0)
        {
          if ((unint64_t)(v12 + 4) <= v11 && (unint64_t)v12 >= a3)
          {
            v14 = 4;
            switch(*v12)
            {
              case 1:
                v33 = 0;
                v34 = 0;
                result = ccder_blob_reserve_tl((uint64_t *)&v36, 1uLL, v12[2], &v33);
                if ((result & 1) == 0 || (unint64_t)v33 >= v34)
                {
                  v6 = &unk_1EA95A020;
                  v14 = 1;
                  goto LABEL_6;
                }
                if (v12[1])
                  v17 = -1;
                else
                  v17 = 0;
                *v33 = v17;
                goto LABEL_5;
              case 2:
              case 3:
                if ((unint64_t)v12 >= v11)
                  goto LABEL_50;
                v16 = (char *)v12[1];
                v15 = v12[2];
                if (&v16[v15] < v16)
                  goto LABEL_50;
                result = ccder_blob_encode_body_tl((uint64_t *)&v36, 0xCuLL, v15, v16);
                if ((result & 1) == 0)
                  return (uint64_t)&unk_1EA95A020;
                goto LABEL_5;
              case 4:
                result = der_encode_number((uint64_t *)&v36, v12[1]);
                if ((result & 1) != 0)
                  goto LABEL_5;
                return (uint64_t)&unk_1EA95A020;
              case 5:
                v18 = v12[2];
                v19 = 0x2000000000000010;
                goto LABEL_23;
              case 7:
                v18 = v12[2];
                v19 = 0xA000000000000010;
LABEL_23:
                result = ccder_blob_encode_tl((uint64_t *)&v36, v19, v18);
                if ((result & 1) == 0)
                  return (uint64_t)&unk_1EA95A020;
LABEL_5:
                v14 = 4;
                goto LABEL_6;
              case 9:
                if ((unint64_t)v12 >= v11)
                  goto LABEL_50;
                v21 = (char *)v12[1];
                v20 = v12[2];
                if (&v21[v20] < v21)
                  goto LABEL_50;
                v14 = 4;
                result = ccder_blob_encode_body_tl((uint64_t *)&v36, 4uLL, v20, v21);
                if ((result & 1) != 0)
                  goto LABEL_6;
                return (uint64_t)&unk_1EA95A020;
              default:
LABEL_6:
                v12 -= 4;
                if (v14 == 4)
                  continue;
                return (uint64_t)v6;
            }
          }
          goto LABEL_50;
        }
        break;
      }
    }
    v33 = 0;
    v34 = 0;
    result = ccder_blob_reserve_tl((uint64_t *)&v36, 2uLL, 1uLL, &v33);
    if ((result & 1) == 0)
      return (uint64_t)&unk_1EA95A040;
    v22 = v33;
    v23 = v34;
    if ((char *)v34 != v33)
    {
      v24 = (char *)(v34 - 1);
      if (v34)
        v25 = v24 >= v33;
      else
        v25 = 0;
      if (!v25)
        goto LABEL_50;
      *v24 = 1;
      if (v24 != v33)
      {
        v26 = (char *)(v23 - 2);
        while ((unint64_t)v26 < v23 && v26 >= v22)
        {
          *v26 = 0;
          if (v26-- == v33)
            goto LABEL_43;
        }
        goto LABEL_50;
      }
    }
LABEL_43:
    if (a4)
    {
      v28 = ccder_sizeof(0xA000000000000010, *(_QWORD *)(a3 + 16));
      v29 = ccder_sizeof(2, 1uLL);
      if ((ccder_blob_encode_tl((uint64_t *)&v36, 0x6000000000000010uLL, v29 + v28) & 1) != 0)
      {
        v33 = 0;
        v34 = 0;
        v35 = 0;
        v6 = (void *)CEValidateWithOptions(v31, a2, (uint64_t *)&v33, a5, a6);
        if (v6 != &Errors)
          cc_clear(__n, a5);
        return (uint64_t)v6;
      }
      return (uint64_t)&unk_1EA95A040;
    }
  }
LABEL_50:
  __break(0x5519u);
  return result;
}

unint64_t der_vm_execute_nocopy@<X0>(unint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v3;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(unint64_t, const char *, ...);
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  int v17;
  BOOL v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  _BOOL4 v22;
  uint64_t v23;
  __int128 v25;
  __int128 v26;
  unint64_t v27;
  size_t *v28;
  __int128 v29;
  __int128 v30;
  const void *v31;
  void **v32;
  __int128 v33;
  size_t *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  const void *v39;
  size_t *v40;
  __int128 v41;
  __int128 v42;
  uint64_t (*v43)(unint64_t, const char *, ...);
  const char *v44;
  __int128 v45;
  __int128 v46;
  const void *v47;
  size_t *v48;
  unint64_t v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;
  __int128 v53;
  uint64_t (*v54)(unint64_t, const char *, ...);
  const char *v55;
  const char *v56;
  size_t v57;
  const void *v58;
  uint64_t (*v59)(unint64_t, const char *, ...);
  size_t v60;
  uint64_t v61;
  __int128 v62;
  uint64_t v63;
  unint64_t v64;
  BOOL v65;
  char v66;
  unint64_t v67;
  unint64_t v68;
  const void *v69;
  size_t v70;
  int v71;
  int v73;
  uint64_t (*v74)(unint64_t, const char *, ...);
  const char *v75;
  size_t v76;
  uint64_t v77;
  __int128 v78;
  size_t v79;
  uint64_t v80;
  __int128 v81;
  size_t v82;
  size_t v83;
  uint64_t (*v85)(unint64_t, const char *, ...);
  char *v87;
  char *v88;
  const void *v89;
  char *v90;
  _BYTE *v91;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  unsigned __int8 *v96;
  uint64_t (*v97)(unint64_t, const char *, ...);
  const char *v98;
  __int128 v99;
  uint64_t (*v100)(uint64_t *);
  __int128 v101;
  uint64_t (*v102)(unint64_t, const char *, ...);
  const char *v103;
  size_t v104;
  char v105;
  __int128 v106;
  unint64_t v107;
  unint64_t v108;
  __int128 v110;
  _BYTE *v111;
  size_t *v112;
  size_t v113;
  void (*v114)(unint64_t, const char *, ...);
  void (*v115)(unint64_t, const char *, ...);
  __int128 v116;
  uint64_t v117;
  uint64_t v118;
  unsigned __int8 *v119;
  BOOL v120;
  void (*v121)(unint64_t, const char *, ...);
  uint64_t v122;
  uint64_t v123;
  void *__s1;
  __int128 v125;
  void *__s2;
  size_t v127;
  __int128 v128;
  void *v129[2];
  _BYTE v130[22];
  __int128 v131;
  __int128 v132;
  __int128 v133;
  uint64_t v134;
  uint64_t v135;

  v3 = result;
  v135 = *MEMORY[0x1E0C874D8];
  if (!*(_BYTE *)(result + 33))
  {
LABEL_6:
    v10 = *(_OWORD *)(v3 + 16);
    *(_OWORD *)a3 = *(_OWORD *)v3;
    *(_OWORD *)(a3 + 16) = v10;
    *(_OWORD *)(a3 + 32) = *(_OWORD *)(v3 + 32);
    v11 = *(_QWORD *)(v3 + 48);
LABEL_7:
    *(_QWORD *)(a3 + 48) = v11;
    return result;
  }
  v6 = *(_QWORD *)result;
  v7 = *(_QWORD *)result + 64;
  v8 = *(_QWORD *)a2;
  switch(*(_QWORD *)a2 & 0xBFFFFFFFFFFFFFFFLL)
  {
    case 0uLL:
      v9 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
      if (!v9)
        goto LABEL_6;
      if (v6 >= v7)
        goto LABEL_317;
      result = v9(v6, "[%s]: %s\n", "der_vm_execute_nocopy", "noop");
      goto LABEL_6;
    case 1uLL:
      if (result + 56 < result)
        goto LABEL_317;
      v33 = *(_OWORD *)(result + 16);
      v131 = *(_OWORD *)result;
      v132 = v33;
      LOBYTE(v133) = *(_BYTE *)(result + 32);
      *(_OWORD *)v130 = *(_OWORD *)(result + 34);
      *(_QWORD *)&v130[14] = *(_QWORD *)(result + 48);
      *((_QWORD *)&v131 + 1) = 0;
      *(_QWORD *)&v132 = 0;
      if ((v8 & 0x4000000000000000) != 0)
      {
        __s1 = *(void **)(a2 + 8);
        v34 = (size_t *)(a2 + 16);
      }
      else
      {
        __s1 = (void *)(a2 + 8);
        v34 = (size_t *)(a2 + 248);
      }
      v60 = *v34;
      v61 = *(_QWORD *)(result + 16);
      if (v61)
      {
        v6 = 0;
        v62 = *(_OWORD *)(result + 32);
        *(_OWORD *)(a3 + 16) = *(_OWORD *)(result + 16);
        *(_OWORD *)(a3 + 32) = v62;
        *(_OWORD *)a3 = *(_OWORD *)result;
        v63 = *(_QWORD *)(result + 40);
        *(_QWORD *)(a3 + 48) = *(_QWORD *)(result + 48);
        *(_BYTE *)(a3 + 33) = 0;
        v64 = v61 - 1;
        *(_QWORD *)(a3 + 8) = 0;
        *(_QWORD *)(a3 + 16) = 0;
        if (__s1)
          v65 = v60 == 0;
        else
          v65 = 1;
        v66 = v65;
        v122 = *(_QWORD *)(result + 8);
        v123 = v63;
        while (1)
        {
          v67 = (v6 + v64) >> 1;
          if ((v66 & 1) != 0)
            goto LABEL_325;
          v68 = *(_QWORD *)(v122 + 8 * v67);
          v69 = (const void *)(v123 + v68);
          if (!v69)
            goto LABEL_86;
          if (v60 >= HIDWORD(v68))
            v70 = HIDWORD(v68);
          else
            v70 = v60;
          if (v60 < HIDWORD(v68))
            v71 = -1;
          else
            v71 = 1;
          result = memcmp(__s1, v69, v70);
          if (v60 != HIDWORD(v68) && (_DWORD)result == 0)
            v73 = v71;
          else
            v73 = result;
          if (!v73)
          {
            *(_BYTE *)(a3 + 33) = 1;
            v107 = *(_QWORD *)(a3 + 40);
            v108 = v107 + (HIDWORD(v68) + v68);
            if (v108 <= *(_QWORD *)(a3 + 48) && v107 <= v108)
            {
              *(_QWORD *)(a3 + 40) = v108;
              return result;
            }
            while (1)
            {
              do
              {
LABEL_317:
                __break(0x5519u);
LABEL_318:
                v121 = *(void (**)(unint64_t, const char *, ...))(v6 + 24);
                if (v121)
                  v121(v6, "[%s]: %s\n", "der_decode_string", "Unknown string encoding");
              }
              while (v6 && v6 >= v6 + 64);
              (*(void (**)(unint64_t, const char *, ...))(v6 + 32))(v6, "[%s]: %s\n", "der_vm_string_from_context", "Attempting to select a string value from a non-string DER object");
LABEL_316:
              v129[0] = 0;
              v129[1] = 0;
            }
          }
          if (v73 < 0)
          {
LABEL_325:
            if (v6 + v64 < 2)
              return result;
            v64 = v67 - 1;
            if (v6 > v67 - 1)
              return result;
          }
          else
          {
LABEL_86:
            v6 = v67 + 1;
            if (v67 + 1 > v64)
              return result;
          }
        }
      }
      v129[0] = 0;
      v129[1] = 0;
      v128 = *(_OWORD *)(result + 40);
      result = der_decode_next(v6, 0, 0, (unsigned __int8 **)v129, (uint64_t)&v128);
      if ((result & 1) != 0)
      {
        if (v60)
        {
          if (v129[0] < v129[1])
          {
            if (v6 && v6 >= v7)
              goto LABEL_317;
            while (1)
            {
              __s2 = 0;
              v127 = 0;
              v125 = 0uLL;
              result = der_decode_key_value(v6, &__s2, &v125, (unsigned __int8 **)v129);
              if (!(_DWORD)result)
                break;
              if (__s1 && __s2)
              {
                v82 = v127;
                v83 = v60 >= v127 ? v127 : v60;
                result = memcmp(__s1, __s2, v83);
                if (!(_DWORD)result && v60 == v82)
                {
                  *(_OWORD *)&v130[6] = v125;
                  LOBYTE(v85) = 1;
                  goto LABEL_294;
                }
              }
              if (v129[0] >= v129[1])
                goto LABEL_254;
            }
            v85 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
            if (v85)
            {
              result = v85(v6, "[%s]: %s\n", "der_vm_execute_select_key", "invalid dictionary element");
              LOBYTE(v85) = 0;
            }
LABEL_294:
            v116 = v132;
            *(_OWORD *)a3 = v131;
            *(_OWORD *)(a3 + 16) = v116;
            *(_BYTE *)(a3 + 32) = v133;
            *(_BYTE *)(a3 + 33) = (_BYTE)v85;
            goto LABEL_255;
          }
LABEL_254:
          v110 = v132;
          *(_OWORD *)a3 = v131;
          *(_OWORD *)(a3 + 16) = v110;
          *(_BYTE *)(a3 + 32) = v133;
          *(_BYTE *)(a3 + 33) = 0;
LABEL_255:
          *(_OWORD *)(a3 + 34) = *(_OWORD *)v130;
          v11 = *(_QWORD *)&v130[14];
          goto LABEL_7;
        }
        v102 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
        if (!v102)
          goto LABEL_254;
        if (v6 && v6 >= v7)
          goto LABEL_317;
        v103 = "key length is invalid";
      }
      else
      {
        v102 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
        if (!v102)
          goto LABEL_254;
        if (v6 && v6 >= v7)
          goto LABEL_317;
        v103 = "dictionary decoding failure";
      }
      result = v102(v6, "[%s]: %s\n", "der_vm_execute_select_key", v103);
      goto LABEL_254;
    case 2uLL:
      if (result + 56 < result)
        goto LABEL_317;
      v19 = *(_OWORD *)(result + 32);
      v20 = *(_OWORD *)result;
      *(_OWORD *)(a3 + 16) = *(_OWORD *)(result + 16);
      *(_OWORD *)(a3 + 32) = v19;
      *(_OWORD *)a3 = v20;
      *(_QWORD *)(a3 + 48) = *(_QWORD *)(result + 48);
      *(_BYTE *)(a3 + 33) = 0;
      *(_QWORD *)(a3 + 8) = 0;
      *(_QWORD *)(a3 + 16) = 0;
      v21 = *(_QWORD *)(a2 + 8);
      v131 = 0uLL;
      *(_OWORD *)v130 = *(_OWORD *)(result + 40);
      result = der_decode_next(v6, 0, 0, (unsigned __int8 **)&v131, (uint64_t)v130);
      if (!(_DWORD)result)
      {
        v54 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
        if (!v54)
          return result;
        if (v6 && v6 >= v7)
          goto LABEL_317;
        v55 = "array decoding failure";
        goto LABEL_229;
      }
      v22 = (unint64_t)v131 < *((_QWORD *)&v131 + 1);
      if ((unint64_t)v131 < *((_QWORD *)&v131 + 1) && v21 >= 1)
      {
        while (1)
        {
          result = der_decode_next(v6, 0, 0, 0, (uint64_t)&v131);
          if ((result & 1) == 0)
            break;
          v23 = v21 - 1;
          v22 = (unint64_t)v131 < *((_QWORD *)&v131 + 1);
          if ((unint64_t)v131 >= *((_QWORD *)&v131 + 1) || v21-- <= 1)
            goto LABEL_148;
        }
        v54 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
        if (!v54)
          return result;
        if (v6 && v6 >= v7)
          goto LABEL_317;
        v55 = "encountered invalid element in an array";
LABEL_229:
        v56 = "der_vm_execute_select_index";
        return v54(v6, "[%s]: %s\n", v56, v55);
      }
      v23 = v21;
LABEL_148:
      if (v22 && v23 == 0)
      {
        if (!v6 || v6 < v7)
        {
          result = der_decode_next(v6, 0, (unsigned __int8 **)(a3 + 40), 0, (uint64_t)&v131);
          *(_BYTE *)(a3 + 33) = result;
          return result;
        }
        goto LABEL_317;
      }
      return result;
    case 3uLL:
      if (result + 56 < result)
        goto LABEL_317;
      return der_vm_execute_match_string(a3, (__int128 *)result, a2);
    case 4uLL:
      if (result + 56 < result)
        goto LABEL_317;
      v25 = *(_OWORD *)(result + 32);
      v26 = *(_OWORD *)result;
      *(_OWORD *)(a3 + 16) = *(_OWORD *)(result + 16);
      *(_OWORD *)(a3 + 32) = v25;
      *(_OWORD *)a3 = v26;
      *(_QWORD *)(a3 + 48) = *(_QWORD *)(result + 48);
      *(_BYTE *)(a3 + 33) = 0;
      *(_QWORD *)(a3 + 8) = 0;
      *(_QWORD *)(a3 + 16) = 0;
      if ((v8 & 0x4000000000000000) != 0)
      {
        v27 = *(_QWORD *)(a2 + 8);
        v28 = (size_t *)(a2 + 16);
      }
      else
      {
        v27 = a2 + 8;
        v28 = (size_t *)(a2 + 248);
      }
      v57 = *v28;
      *(_OWORD *)v130 = *(_OWORD *)(result + 40);
      v131 = 0uLL;
      result = ccder_blob_decode_range((unsigned __int8 **)v130, 12, (unsigned __int8 **)&v131);
      if ((result & 1) != 0)
      {
        if (!v57)
          goto LABEL_308;
        v58 = (const void *)v131;
        if (v57 > *((_QWORD *)&v131 + 1) - (_QWORD)v131)
        {
LABEL_63:
          *(_BYTE *)(a3 + 33) = 0;
          return result;
        }
        result = v27;
        v104 = v57;
        goto LABEL_224;
      }
      v59 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
      if (!v59)
        return result;
      result = v59(v6, "[%s]: %s\n", "der_decode_string", "Unknown string encoding");
      v54 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
      if (!v54)
        return result;
      if (v6 && v6 >= v7)
        goto LABEL_317;
      v55 = "string decode failure";
      v56 = "der_vm_execute_match_string_prefix";
      return v54(v6, "[%s]: %s\n", v56, v55);
    case 5uLL:
      if (result + 56 < result)
        goto LABEL_317;
      v35 = *(_OWORD *)(result + 32);
      v36 = *(_OWORD *)result;
      *(_OWORD *)(a3 + 16) = *(_OWORD *)(result + 16);
      *(_OWORD *)(a3 + 32) = v35;
      *(_OWORD *)a3 = v36;
      *(_QWORD *)(a3 + 48) = *(_QWORD *)(result + 48);
      *(_BYTE *)(a3 + 33) = 0;
      *(_QWORD *)(a3 + 8) = 0;
      *(_QWORD *)(a3 + 16) = 0;
      *(_OWORD *)v130 = *(_OWORD *)(result + 40);
      v131 = 0uLL;
      result = ccder_blob_decode_range((unsigned __int8 **)v130, 1, (unsigned __int8 **)&v131);
      if ((result & 1) == 0)
      {
        v74 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
        if (!v74)
          goto LABEL_187;
        v75 = "Unknown BOOLean encoding";
        goto LABEL_186;
      }
      if (*((_QWORD *)&v131 + 1) - (_QWORD)v131 == 1)
      {
        if ((unint64_t)v131 >= *((_QWORD *)&v131 + 1))
          goto LABEL_317;
        v18 = *(_QWORD *)(a2 + 8) == (*(_BYTE *)v131 != 0);
        goto LABEL_235;
      }
      v74 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
      if (v74)
      {
        v75 = "BOOLean should be exactly 1 byte";
LABEL_186:
        result = v74(v6, "[%s]: %s\n", "der_decode_BOOLean", v75);
      }
LABEL_187:
      v54 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
      if (!v54)
        return result;
      if (v6 && v6 >= v7)
        goto LABEL_317;
      v55 = "BOOL decode failure";
      v56 = "der_vm_execute_match_BOOL";
      return v54(v6, "[%s]: %s\n", v56, v55);
    case 6uLL:
      if (result + 56 < result)
        goto LABEL_317;
      v37 = *(_OWORD *)(result + 32);
      v38 = *(_OWORD *)result;
      *(_OWORD *)(a3 + 16) = *(_OWORD *)(result + 16);
      *(_OWORD *)(a3 + 32) = v37;
      *(_OWORD *)a3 = v38;
      *(_QWORD *)(a3 + 48) = *(_QWORD *)(result + 48);
      *(_BYTE *)(a3 + 33) = 0;
      *(_QWORD *)(a3 + 8) = 0;
      *(_QWORD *)(a3 + 16) = 0;
      if ((v8 & 0x4000000000000000) != 0)
      {
        v39 = *(const void **)(a2 + 8);
        v40 = (size_t *)(a2 + 16);
      }
      else
      {
        v39 = (const void *)(a2 + 8);
        v40 = (size_t *)(a2 + 248);
      }
      v76 = *v40;
      v77 = *(_QWORD *)(result + 24);
      v78 = *(_OWORD *)(result + 40);
      *(_QWORD *)v130 = 0;
      v131 = v78;
      result = der_decode_next(v6, v130, 0, 0, (uint64_t)&v131);
      if (!(_DWORD)result || v77 == *(_QWORD *)v130)
        goto LABEL_112;
      if (*(_QWORD *)v130 != 12)
      {
        if (*(_QWORD *)v130 == 0x2000000000000010 || *(_QWORD *)v130 == 0x6000000000000010)
        {
          *(_QWORD *)v130 = a3;
          *(_QWORD *)&v130[8] = a2;
          v99 = *(_OWORD *)(v3 + 16);
          v131 = *(_OWORD *)v3;
          v132 = v99;
          v133 = *(_OWORD *)(v3 + 32);
          v134 = *(_QWORD *)(v3 + 48);
          v100 = string_value_allowed_iterate;
          return der_vm_iterate((unint64_t)&v131, (uint64_t)v130, (uint64_t)v100);
        }
LABEL_112:
        v54 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
        if (v54)
        {
          if (v6 >= v7)
            goto LABEL_317;
          v55 = "Unexpected type to match against";
          v56 = "der_vm_execute_string_value_allowed";
          return v54(v6, "[%s]: %s\n", v56, v55);
        }
        return result;
      }
      result = der_vm_execute_match_string((uint64_t)&v131, (__int128 *)v3, a2);
      if (BYTE1(v133))
        goto LABEL_308;
      v6 = *(_QWORD *)v3;
      *(_OWORD *)v129 = *(_OWORD *)(v3 + 40);
      *(_OWORD *)v130 = 0uLL;
      if ((ccder_blob_decode_range((unsigned __int8 **)v129, 12, (unsigned __int8 **)v130) & 1) == 0)
        goto LABEL_318;
      result = *(_QWORD *)v130;
      if (*(_QWORD *)&v130[8] == *(_QWORD *)v130)
        return result;
      v111 = (_BYTE *)(*(_QWORD *)&v130[8] - 1);
      if (!*(_QWORD *)&v130[8] || (unint64_t)v111 < *(_QWORD *)v130)
        goto LABEL_317;
      if (*v111 != 42)
        return result;
      v104 = ~*(_QWORD *)v130 + *(_QWORD *)&v130[8];
      if (!v104)
        goto LABEL_308;
      if (v104 > v76)
        goto LABEL_63;
      v58 = v39;
      goto LABEL_224;
    case 7uLL:
      if (result + 56 < result)
        goto LABEL_317;
      v41 = *(_OWORD *)(result + 32);
      v42 = *(_OWORD *)result;
      *(_OWORD *)(a3 + 16) = *(_OWORD *)(result + 16);
      *(_OWORD *)(a3 + 32) = v41;
      *(_OWORD *)a3 = v42;
      *(_QWORD *)(a3 + 48) = *(_QWORD *)(result + 48);
      *(_BYTE *)(a3 + 33) = 0;
      *(_QWORD *)(a3 + 8) = 0;
      *(_QWORD *)(a3 + 16) = 0;
      *(_OWORD *)v130 = *(_OWORD *)(result + 40);
      v131 = 0uLL;
      result = ccder_blob_decode_range((unsigned __int8 **)v130, 2, (unsigned __int8 **)&v131);
      if ((result & 1) == 0)
      {
        v43 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
        if (!v43)
          goto LABEL_118;
        v44 = "unknown number encoding";
        goto LABEL_117;
      }
      if (*((_QWORD *)&v131 + 1) - (_QWORD)v131 < 9uLL)
      {
        if ((unint64_t)v131 >= *((_QWORD *)&v131 + 1))
        {
          v95 = 0;
        }
        else
        {
          v94 = 0;
          v95 = 0;
          do
          {
            if (!v94 && *(char *)v131 < 0)
              v95 = -1;
            v96 = (unsigned __int8 *)(v131 + v94);
            if ((unint64_t)(v131 + v94) >= *((_QWORD *)&v131 + 1)
              || (unint64_t)v96 < (unint64_t)v131)
            {
              goto LABEL_317;
            }
            v95 = *v96 | (unint64_t)(v95 << 8);
            ++v94;
          }
          while (*((_QWORD *)&v131 + 1) - (_QWORD)v131 != v94);
        }
        v18 = v95 == *(_QWORD *)(a2 + 8);
        goto LABEL_235;
      }
      v43 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
      if (v43)
      {
        v44 = "number too large";
LABEL_117:
        result = v43(v6, "[%s]: %s\n", "der_decode_number", v44);
      }
LABEL_118:
      v54 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
      if (!v54)
        return result;
      if (v6 && v6 >= v7)
        goto LABEL_317;
LABEL_121:
      v55 = "BOOL decode failure";
      v56 = "der_vm_execute_match_integer";
      return v54(v6, "[%s]: %s\n", v56, v55);
    case 8uLL:
      if (result + 56 < result)
        goto LABEL_317;
      v45 = *(_OWORD *)(result + 32);
      v46 = *(_OWORD *)result;
      *(_OWORD *)(a3 + 16) = *(_OWORD *)(result + 16);
      *(_OWORD *)(a3 + 32) = v45;
      *(_OWORD *)a3 = v46;
      *(_QWORD *)(a3 + 48) = *(_QWORD *)(result + 48);
      *(_BYTE *)(a3 + 33) = 0;
      v47 = (const void *)(a2 + 8);
      *(_QWORD *)(a3 + 8) = 0;
      *(_QWORD *)(a3 + 16) = 0;
      if ((v8 & 0x4000000000000000) != 0)
      {
        v49 = *(_QWORD *)(a2 + 8);
        v48 = (size_t *)(a2 + 16);
      }
      else
      {
        v48 = (size_t *)(a2 + 248);
        v49 = a2 + 8;
      }
      v79 = *v48;
      v80 = *(_QWORD *)(result + 24);
      v81 = *(_OWORD *)(result + 40);
      *(_QWORD *)v130 = 0;
      v131 = v81;
      result = der_decode_next(v6, v130, 0, 0, (uint64_t)&v131);
      if (!(_DWORD)result || v80 == *(_QWORD *)v130)
        goto LABEL_125;
      if (*(_QWORD *)v130 != 12)
      {
        if (*(_QWORD *)v130 == 0x2000000000000010 || *(_QWORD *)v130 == 0x6000000000000010)
        {
          *(_QWORD *)v130 = a3;
          *(_QWORD *)&v130[8] = a2;
          v101 = *(_OWORD *)(v3 + 16);
          v131 = *(_OWORD *)v3;
          v132 = v101;
          v133 = *(_OWORD *)(v3 + 32);
          v134 = *(_QWORD *)(v3 + 48);
          v100 = string_prefix_allowed_iterate;
          return der_vm_iterate((unint64_t)&v131, (uint64_t)v130, (uint64_t)v100);
        }
LABEL_125:
        v54 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
        if (v54)
        {
          if (v6 >= v7)
            goto LABEL_317;
          v55 = "Unexpected type to match against";
          v56 = "der_vm_execute_string_prefix_value_allowed";
          return v54(v6, "[%s]: %s\n", v56, v55);
        }
        return result;
      }
      if ((*(_BYTE *)(a2 + 7) & 0x40) != 0)
      {
        v47 = *(const void **)(a2 + 8);
        v112 = (size_t *)(a2 + 16);
      }
      else
      {
        v112 = (size_t *)(a2 + 248);
      }
      v6 = *(_QWORD *)v3;
      v113 = *v112;
      *(_OWORD *)v130 = *(_OWORD *)(v3 + 40);
      v131 = 0uLL;
      result = ccder_blob_decode_range((unsigned __int8 **)v130, 12, (unsigned __int8 **)&v131);
      if ((result & 1) != 0)
      {
        if (!v113)
          goto LABEL_308;
        if (v113 <= *((_QWORD *)&v131 + 1) - (_QWORD)v131)
        {
          result = memcmp(v47, (const void *)v131, v113);
          if (!(_DWORD)result)
            goto LABEL_308;
        }
      }
      else
      {
        v114 = *(void (**)(unint64_t, const char *, ...))(v6 + 24);
        if (v114)
        {
          v114(v6, "[%s]: %s\n", "der_decode_string", "Unknown string encoding");
          v115 = *(void (**)(unint64_t, const char *, ...))(v6 + 24);
          if (v115)
          {
            if (v6 && v6 >= v6 + 64)
              goto LABEL_317;
            v115(v6, "[%s]: %s\n", "der_vm_execute_match_string_prefix", "string decode failure");
          }
        }
      }
      v6 = *(_QWORD *)v3;
      *(_OWORD *)v130 = *(_OWORD *)(v3 + 40);
      v131 = 0uLL;
      result = ccder_blob_decode_range((unsigned __int8 **)v130, 12, (unsigned __int8 **)&v131);
      if ((result & 1) == 0)
        goto LABEL_318;
      if (v79)
      {
        v58 = (const void *)v131;
        if (v79 > *((_QWORD *)&v131 + 1) - (_QWORD)v131)
          goto LABEL_63;
        result = v49;
        v104 = v79;
LABEL_224:
        result = memcmp((const void *)result, v58, v104);
        v18 = (_DWORD)result == 0;
LABEL_235:
        v105 = v18;
        goto LABEL_309;
      }
      goto LABEL_308;
    case 9uLL:
      if (result + 56 < result)
        goto LABEL_317;
      v29 = *(_OWORD *)(result + 32);
      v30 = *(_OWORD *)result;
      *(_OWORD *)(a3 + 16) = *(_OWORD *)(result + 16);
      *(_OWORD *)(a3 + 32) = v29;
      *(_OWORD *)a3 = v30;
      *(_QWORD *)(a3 + 48) = *(_QWORD *)(result + 48);
      *(_BYTE *)(a3 + 33) = 0;
      *(_QWORD *)(a3 + 8) = 0;
      *(_QWORD *)(a3 + 16) = 0;
      v131 = 0uLL;
      *(_OWORD *)v130 = *(_OWORD *)(result + 40);
      result = der_decode_next(v6, 0, 0, (unsigned __int8 **)&v131, (uint64_t)v130);
      if ((result & 1) == 0)
      {
        v54 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
        if (!v54)
          return result;
        if (v6 && v6 >= v7)
          goto LABEL_317;
        v55 = "dictionary decoding failure";
        goto LABEL_247;
      }
      if ((*(_BYTE *)(a2 + 7) & 0x40) != 0)
      {
        v31 = *(const void **)(a2 + 8);
        v32 = (void **)(a2 + 16);
      }
      else
      {
        v31 = (const void *)(a2 + 8);
        v32 = (void **)(a2 + 248);
      }
      v87 = (char *)*v32;
      if (!*v32)
      {
        v54 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
        if (!v54)
          return result;
        if (v6 && v6 >= v7)
          goto LABEL_317;
        v55 = "key length is invalid";
        goto LABEL_247;
      }
      if ((unint64_t)v131 >= *((_QWORD *)&v131 + 1))
        return result;
      if (v6 && v6 >= v7)
        goto LABEL_316;
      while (2)
      {
        v129[0] = 0;
        v129[1] = 0;
        v128 = 0uLL;
        result = der_decode_key_value(v6, v129, &v128, (unsigned __int8 **)&v131);
        if ((_DWORD)result)
        {
          v88 = (char *)v129[1];
          if (v129[1])
          {
            v89 = v129[0];
            v90 = (char *)v129[1] - 1;
            v91 = (char *)v129[0] + (unint64_t)v129[1] - 1;
            if (v91 < v129[0] || v91 >= (char *)v129[0] + (unint64_t)v129[1])
              goto LABEL_317;
            if (*v91 == 42)
            {
              if (v129[1] == (void *)1 || v90 <= v87 && (result = memcmp(v129[0], v31, (size_t)v90), !(_DWORD)result))
              {
LABEL_162:
                *(_BYTE *)(a3 + 33) = 1;
                *(_OWORD *)(a3 + 40) = v128;
              }
LABEL_163:
              if ((unint64_t)v131 >= *((_QWORD *)&v131 + 1))
                return result;
              continue;
            }
          }
          else
          {
            v89 = v129[0];
          }
          if (v31 && v89)
          {
            v93 = v87 >= v129[1] ? v129[1] : v87;
            result = memcmp(v31, v89, (size_t)v93);
            if (v87 == v88 && !(_DWORD)result)
              goto LABEL_162;
          }
          goto LABEL_163;
        }
        break;
      }
      v54 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
      if (!v54)
        return result;
      v55 = "invalid dictionary element";
LABEL_247:
      v56 = "der_vm_execute_select_longest_matching_key";
      return v54(v6, "[%s]: %s\n", v56, v55);
    case 0xAuLL:
      if (result + 56 < result)
        goto LABEL_317;
      v50 = *(_OWORD *)(result + 32);
      v51 = *(_OWORD *)result;
      *(_OWORD *)(a3 + 16) = *(_OWORD *)(result + 16);
      *(_OWORD *)(a3 + 32) = v50;
      *(_OWORD *)a3 = v51;
      *(_QWORD *)(a3 + 48) = *(_QWORD *)(result + 48);
      *(_BYTE *)(a3 + 33) = 0;
      *(_QWORD *)(a3 + 8) = 0;
      *(_QWORD *)(a3 + 16) = 0;
      v52 = *(_QWORD *)(result + 24);
      v53 = *(_OWORD *)(result + 40);
      *(_QWORD *)v130 = 0;
      v131 = v53;
      result = der_decode_next(v6, v130, 0, 0, (uint64_t)&v131);
      if (!(_DWORD)result || v52 == *(_QWORD *)v130)
        goto LABEL_56;
      if (*(_QWORD *)v130 == 0x6000000000000010 || *(_QWORD *)v130 == 0x2000000000000010)
      {
        *(_QWORD *)v130 = a3;
        *(_QWORD *)&v130[8] = a2;
        v106 = *(_OWORD *)(v3 + 16);
        v131 = *(_OWORD *)v3;
        v132 = v106;
        v133 = *(_OWORD *)(v3 + 32);
        v134 = *(_QWORD *)(v3 + 48);
        v100 = integer_allowed_iterate;
        return der_vm_iterate((unint64_t)&v131, (uint64_t)v130, (uint64_t)v100);
      }
      if (*(_QWORD *)v130 != 2)
      {
LABEL_56:
        v54 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
        if (!v54)
          return result;
        if (v6 >= v7)
          goto LABEL_317;
        v55 = "Unexpected type to match against";
        v56 = "der_vm_execute_integer_value_allowed";
        return v54(v6, "[%s]: %s\n", v56, v55);
      }
      v6 = *(_QWORD *)v3;
      *(_OWORD *)v130 = *(_OWORD *)(v3 + 40);
      v131 = 0uLL;
      result = ccder_blob_decode_range((unsigned __int8 **)v130, 2, (unsigned __int8 **)&v131);
      if ((result & 1) == 0)
      {
        v97 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
        if (v97)
        {
          v98 = "unknown number encoding";
          goto LABEL_272;
        }
LABEL_273:
        v54 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
        if (!v54)
          return result;
        if (v6 && v6 >= v6 + 64)
          goto LABEL_317;
        goto LABEL_121;
      }
      if (*((_QWORD *)&v131 + 1) - (_QWORD)v131 >= 9uLL)
      {
        v97 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
        if (v97)
        {
          v98 = "number too large";
LABEL_272:
          result = v97(v6, "[%s]: %s\n", "der_decode_number", v98);
          goto LABEL_273;
        }
        goto LABEL_273;
      }
      if ((unint64_t)v131 >= *((_QWORD *)&v131 + 1))
      {
        v118 = 0;
      }
      else
      {
        v117 = 0;
        v118 = 0;
        do
        {
          if (!v117 && *(char *)v131 < 0)
            v118 = -1;
          v119 = (unsigned __int8 *)(v131 + v117);
          if ((unint64_t)(v131 + v117) >= *((_QWORD *)&v131 + 1)
            || (unint64_t)v119 < (unint64_t)v131)
          {
            goto LABEL_317;
          }
          v118 = *v119 | (unint64_t)(v118 << 8);
          ++v117;
        }
        while (*((_QWORD *)&v131 + 1) - (_QWORD)v131 != v117);
      }
      if (v118 != *(_QWORD *)(a2 + 8))
        return result;
LABEL_308:
      v105 = 1;
LABEL_309:
      *(_BYTE *)(a3 + 33) = v105;
      return result;
    case 0xBuLL:
      if (result + 56 < result)
        goto LABEL_317;
      v12 = *(_OWORD *)(result + 32);
      v13 = *(_OWORD *)result;
      *(_OWORD *)(a3 + 16) = *(_OWORD *)(result + 16);
      *(_OWORD *)(a3 + 32) = v12;
      *(_OWORD *)a3 = v13;
      *(_QWORD *)(a3 + 48) = *(_QWORD *)(result + 48);
      *(_BYTE *)(a3 + 33) = 0;
      *(_QWORD *)(a3 + 8) = 0;
      *(_QWORD *)(a3 + 16) = 0;
      v14 = *(_QWORD *)(a2 + 8);
      if ((unint64_t)(v14 - 7) < 0xFFFFFFFFFFFFFFFALL)
        return result;
      v15 = *(_QWORD *)(result + 24);
      v16 = *(_OWORD *)(result + 40);
      *(_QWORD *)v130 = 0;
      v131 = v16;
      result = der_decode_next(v6, v130, 0, 0, (uint64_t)&v131);
      if (!(_DWORD)result)
        return result;
      if (v15 == *(_QWORD *)v130)
      {
        v17 = 1;
LABEL_13:
        v18 = v17 == (_DWORD)v14;
        goto LABEL_235;
      }
      if (*(uint64_t *)v130 > 0x200000000000000FLL)
      {
        if (*(_QWORD *)v130 == 0x6000000000000010 || *(_QWORD *)v130 == 0x2000000000000010)
        {
          v17 = 2;
          goto LABEL_13;
        }
      }
      else
      {
        v17 = 5;
        switch(*(_QWORD *)v130)
        {
          case 1:
            goto LABEL_13;
          case 2:
            v17 = 3;
            goto LABEL_13;
          case 4:
            v17 = 6;
            goto LABEL_13;
          case 0xCLL:
            v17 = 4;
            goto LABEL_13;
          default:
            return result;
        }
      }
      return result;
    default:
      if (v6)
        v120 = v6 >= v7;
      else
        v120 = 0;
      if (v120)
        goto LABEL_317;
      (*(void (**)(unint64_t, const char *, ...))(v6 + 32))(v6, "[%s]: %s\n", "der_vm_execute_nocopy", "unhandled opcode");
      goto LABEL_316;
  }
}

unint64_t der_vm_execute@<X0>(unint64_t result@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  __int128 v3;
  _OWORD v4[3];
  uint64_t v5;

  if (a2 && a2 + 256 < a2)
  {
    __break(0x5519u);
  }
  else
  {
    v3 = *(_OWORD *)(result + 16);
    v4[0] = *(_OWORD *)result;
    v4[1] = v3;
    v4[2] = *(_OWORD *)(result + 32);
    v5 = *(_QWORD *)(result + 48);
    return der_vm_execute_nocopy((unint64_t)v4, a2, a3);
  }
  return result;
}

uint64_t der_vm_context_is_valid(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 33);
}

uint64_t der_vm_CEType_from_context(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;

  v8 = 0;
  if (!*(_BYTE *)(a1 + 33))
    return 0;
  v4 = *(_QWORD *)a1;
  v7 = *(_OWORD *)(a1 + 40);
  result = der_decode_next(v4, &v8, 0, 0, (uint64_t)&v7);
  if (!(_DWORD)result)
    return result;
  v6 = v8;
  if (a2)
    *a2 = v8;
  if (*(_QWORD *)(a1 + 24) == v6)
    return 1;
  if (v6 > 0x200000000000000FLL)
  {
    if (v6 == 0x6000000000000010 || v6 == 0x2000000000000010)
      return 2;
    return 0;
  }
  result = 5;
  switch(v6)
  {
    case 1:
      return result;
    case 2:
      result = 3;
      break;
    case 3:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
      return 0;
    case 4:
      result = 6;
      break;
    case 12:
      result = 4;
      break;
    default:
      return v6 == 0xA000000000000010;
  }
  return result;
}

unint64_t der_vm_iterate(unint64_t result, uint64_t a2, uint64_t a3)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  int v6;
  void (*v7)(unint64_t, const char *, ...);
  const char *v8;
  int v9;
  __int128 v10;
  __int128 v11;
  void (*v12)(unint64_t, const char *, ...);
  _QWORD v13[2];
  uint64_t (*v14)(uint64_t, uint64_t);
  void *v15;
  uint64_t v16;
  uint64_t v17;
  _OWORD v18[3];
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  int v24;
  int v25;
  uint64_t v26;
  __int128 v27;
  unsigned __int8 *v28;
  unint64_t v29;
  _QWORD v30[2];

  v3 = result;
  if (result && result + 56 < result)
    goto LABEL_41;
  v13[0] = MEMORY[0x1E0C87450];
  v13[1] = 0x40000000;
  v14 = __der_vm_iterate_block_invoke;
  v15 = &__block_descriptor_tmp_17;
  v16 = a2;
  v17 = a3;
  if (!*(_BYTE *)(result + 33))
    return (unint64_t)&unk_1EA95A020;
  v4 = *(_QWORD *)result;
  v5 = *(_QWORD *)result + 64;
  v29 = 0;
  v30[0] = 0;
  v28 = 0;
  v27 = *(_OWORD *)(result + 40);
  result = der_decode_next(v4, v30, 0, &v28, (uint64_t)&v27);
  if ((result & 1) != 0)
  {
    if (*(_QWORD *)(v3 + 24) == v30[0])
    {
LABEL_6:
      v6 = 1;
      goto LABEL_14;
    }
    v6 = 2;
    if (v30[0] != 0x6000000000000010 && v30[0] != 0x2000000000000010)
    {
      if (v30[0] == 0xA000000000000010)
        goto LABEL_6;
      v12 = *(void (**)(unint64_t, const char *, ...))(v4 + 24);
      if (!v12)
        return (unint64_t)&unk_1EA95A020;
      if (!v4 || v4 < v5)
      {
        v12(v4, "[%s]: %s\n", "der_vm_iterate_b", "iteration over a non-iterable type");
        return (unint64_t)&unk_1EA95A020;
      }
      goto LABEL_41;
    }
    while (1)
    {
LABEL_14:
      if ((unint64_t)v28 >= v29)
        return (unint64_t)&Errors;
      v10 = *(_OWORD *)(v3 + 16);
      v11 = *(_OWORD *)(v3 + 32);
      v18[0] = *(_OWORD *)v3;
      v18[1] = v10;
      v18[2] = v11;
      v19 = *(_QWORD *)(v3 + 48);
      v20 = v18[0];
      v21 = v10;
      v22 = v11;
      v23 = v19;
      v24 = v6;
      v25 = 0;
      v26 = 0;
      result = der_decode_next(*(_QWORD *)v3, v30, (unsigned __int8 **)&v22 + 1, 0, (uint64_t)&v28);
      if ((result & 1) == 0)
        break;
      if (*((_QWORD *)&v21 + 1) == v30[0])
      {
        v9 = 1;
      }
      else if (v30[0] > 0x200000000000000FLL)
      {
        if (v30[0] == 0x6000000000000010 || v30[0] == 0x2000000000000010)
          v9 = 2;
        else
LABEL_23:
          v9 = 0;
      }
      else
      {
        v9 = 5;
        switch(v30[0])
        {
          case 1:
            break;
          case 2:
            v9 = 3;
            break;
          case 4:
            v9 = 6;
            break;
          case 0xCLL:
            v9 = 4;
            break;
          default:
            goto LABEL_23;
        }
      }
      v25 = v9;
      if ((v14((uint64_t)v13, (uint64_t)v18) & 1) == 0)
        return (unint64_t)&Errors;
    }
    v7 = *(void (**)(unint64_t, const char *, ...))(v4 + 24);
    if (v7)
    {
      if (!v4 || v4 < v5)
      {
        v8 = "encountered invalid element in an iterable";
        goto LABEL_39;
      }
      goto LABEL_41;
    }
    return (unint64_t)&unk_1EA95A040;
  }
  v7 = *(void (**)(unint64_t, const char *, ...))(v4 + 24);
  if (!v7)
    return (unint64_t)&unk_1EA95A040;
  if (!v4 || v4 < v5)
  {
    v8 = "iterable decoding failure";
LABEL_39:
    v7(v4, "[%s]: %s\n", "der_vm_iterate_b", v8);
    return (unint64_t)&unk_1EA95A040;
  }
LABEL_41:
  __break(0x5519u);
  return result;
}

uint64_t __der_vm_iterate_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(_OWORD *);
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _OWORD v8[8];

  *(_QWORD *)(a2 + 120) = *(_QWORD *)(a1 + 32);
  v2 = *(uint64_t (**)(_OWORD *))(a1 + 40);
  v3 = *(_OWORD *)(a2 + 80);
  v8[4] = *(_OWORD *)(a2 + 64);
  v8[5] = v3;
  v4 = *(_OWORD *)(a2 + 112);
  v8[6] = *(_OWORD *)(a2 + 96);
  v8[7] = v4;
  v5 = *(_OWORD *)(a2 + 16);
  v8[0] = *(_OWORD *)a2;
  v8[1] = v5;
  v6 = *(_OWORD *)(a2 + 48);
  v8[2] = *(_OWORD *)(a2 + 32);
  v8[3] = v6;
  return v2(v8);
}

uint64_t der_vm_integer_from_context(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t result;
  unsigned __int8 *v4;
  void (*v5)(unint64_t, const char *, ...);
  const char *v6;
  uint64_t v7;
  __int128 v8;
  char *v9;
  unint64_t v10;

  v1 = *(_QWORD *)a1;
  v8 = *(_OWORD *)(a1 + 40);
  v9 = 0;
  v10 = 0;
  if ((ccder_blob_decode_range((unsigned __int8 **)&v8, 2, (unsigned __int8 **)&v9) & 1) == 0)
  {
    v5 = *(void (**)(unint64_t, const char *, ...))(v1 + 24);
    if (v5)
    {
      v6 = "unknown number encoding";
LABEL_18:
      v5(v1, "[%s]: %s\n", "der_decode_number", v6);
    }
LABEL_19:
    if (!v1 || v1 < v1 + 64)
      goto LABEL_22;
    goto LABEL_21;
  }
  if (v10 - (unint64_t)v9 >= 9)
  {
    v5 = *(void (**)(unint64_t, const char *, ...))(v1 + 24);
    if (v5)
    {
      v6 = "number too large";
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  if ((unint64_t)v9 < v10)
  {
    v2 = 0;
    result = 0;
    while (1)
    {
      if (!v2 && *v9 < 0)
        result = -1;
      v4 = (unsigned __int8 *)&v9[v2];
      if ((unint64_t)&v9[v2] >= v10 || v4 < (unsigned __int8 *)v9)
        break;
      result = *v4 | (unint64_t)(result << 8);
      if (v10 - (_QWORD)v9 == ++v2)
        return result;
    }
LABEL_21:
    __break(0x5519u);
LABEL_22:
    v7 = (*(uint64_t (**)(unint64_t, const char *, ...))(v1 + 32))(v1, "[%s]: %s\n", "der_vm_integer_from_context", "Attempting to select an integer value from a non-integer DER object");
    return (uint64_t)der_vm_string_from_context(v7);
  }
  return 0;
}

unsigned __int8 *der_vm_string_from_context(uint64_t a1)
{
  unint64_t v1;
  void (*v3)(unint64_t, const char *, ...);
  uint64_t v4;
  __int128 v5;
  unsigned __int8 *v6[2];

  v1 = *(_QWORD *)a1;
  v5 = *(_OWORD *)(a1 + 40);
  v6[0] = 0;
  v6[1] = 0;
  if ((ccder_blob_decode_range((unsigned __int8 **)&v5, 12, v6) & 1) != 0)
    return v6[0];
  v3 = *(void (**)(unint64_t, const char *, ...))(v1 + 24);
  if (v3)
    v3(v1, "[%s]: %s\n", "der_decode_string", "Unknown string encoding");
  if (v1)
  {
    if (v1 >= v1 + 64)
      __break(0x5519u);
  }
  v4 = (*(uint64_t (**)(unint64_t, const char *, ...))(v1 + 32))(v1, "[%s]: %s\n", "der_vm_string_from_context", "Attempting to select a string value from a non-string DER object");
  return (unsigned __int8 *)der_vm_BOOL_from_context(v4);
}

uint64_t der_vm_BOOL_from_context(uint64_t a1)
{
  unint64_t v1;
  void (*v3)(unint64_t, const char *, ...);
  const char *v4;
  uint64_t v5;
  __int128 v6;
  unsigned __int8 *v7;
  unint64_t v8;

  v1 = *(_QWORD *)a1;
  v6 = *(_OWORD *)(a1 + 40);
  v7 = 0;
  v8 = 0;
  if ((ccder_blob_decode_range((unsigned __int8 **)&v6, 1, &v7) & 1) == 0)
  {
    v3 = *(void (**)(unint64_t, const char *, ...))(v1 + 24);
    if (v3)
    {
      v4 = "Unknown BOOLean encoding";
LABEL_9:
      v3(v1, "[%s]: %s\n", "der_decode_BOOLean", v4);
    }
LABEL_10:
    if (!v1 || v1 < v1 + 64)
      goto LABEL_13;
    goto LABEL_12;
  }
  if (v8 - (_QWORD)v7 != 1)
  {
    v3 = *(void (**)(unint64_t, const char *, ...))(v1 + 24);
    if (v3)
    {
      v4 = "BOOLean should be exactly 1 byte";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  if ((unint64_t)v7 < v8)
    return *v7 != 0;
LABEL_12:
  __break(0x5519u);
LABEL_13:
  v5 = (*(uint64_t (**)(unint64_t, const char *, ...))(v1 + 32))(v1, "[%s]: %s\n", "der_vm_BOOL_from_context", "Attempting to select a BOOLean value from a non-BOOLean DER object");
  return der_vm_data_from_context(v5);
}

unsigned __int8 *der_vm_data_from_context(uint64_t a1)
{
  unint64_t v1;
  void (*v3)(unint64_t, const char *, ...);
  uint64_t v4;
  __int128 v5;
  unsigned __int8 *v6[2];

  v1 = *(_QWORD *)a1;
  v5 = *(_OWORD *)(a1 + 40);
  v6[0] = 0;
  v6[1] = 0;
  if ((ccder_blob_decode_range((unsigned __int8 **)&v5, 4, v6) & 1) != 0)
    return v6[0];
  v3 = *(void (**)(unint64_t, const char *, ...))(v1 + 24);
  if (v3)
    v3(v1, "[%s]: %s\n", "der_decode_data", "Unknown data encoding");
  if (v1)
  {
    if (v1 >= v1 + 64)
      __break(0x5519u);
  }
  v4 = (*(uint64_t (**)(unint64_t, const char *, ...))(v1 + 32))(v1, "[%s]: %s\n", "der_vm_data_from_context", "Attempting to select a data value from a non-data DER object");
  return (unsigned __int8 *)CEValidate(v4);
}

uint64_t CEValidate(uint64_t result, uint64_t *a2, unsigned __int8 *a3, unsigned __int8 *a4)
{
  char v4;

  v4 = 0;
  if (a3 <= a4)
    return CEValidateWithOptions(result, &v4, a2, a3, a4);
  __break(0x5519u);
  return result;
}

uint64_t CEValidateWithOptions(uint64_t result, _BYTE *a2, uint64_t *a3, unsigned __int8 *a4, unsigned __int8 *a5)
{
  uint64_t v5;
  BOOL v10;
  void (*v11)(uint64_t, const char *, ...);
  const char *v12;
  void (*v13)(uint64_t, const char *, ...);
  uint64_t v14;
  _UNKNOWN **v15;
  const char *v16;
  void (*v17)(uint64_t, const char *, ...);
  uint64_t v18;
  uint64_t v19;
  unsigned __int8 *v20;
  void (*v21)(uint64_t, const char *, ...);
  unsigned __int8 *v22[2];
  unsigned __int8 *v23[2];
  unint64_t v24;
  __int128 v25;
  char *v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unsigned __int8 *v30;
  unsigned __int8 *v31;
  __int128 v32;

  v5 = result;
  if (!a3)
    goto LABEL_16;
  *a3 = 0;
  if (a4 > a5)
  {
LABEL_56:
    __break(0x5519u);
    return result;
  }
  a3[1] = (uint64_t)a4;
  a3[2] = (uint64_t)a5;
  if (a4 && a4 < a5)
  {
    if ((unint64_t)(a5 - a4) >= 5 && (*(_DWORD *)a4 == 1836597052 ? (v10 = a4[4] == 108) : (v10 = 0), v10))
    {
      v17 = *(void (**)(uint64_t, const char *, ...))(result + 24);
      if (v17)
        v17(result, "[%s]: %s\n", "CEValidateWithOptions", "xml-looking blob was passed in");
      return 0x1EA95A010;
    }
    else
    {
      v23[1] = a5;
      v24 = 0;
      v22[1] = a5;
      v23[0] = a4;
      v22[0] = a4;
      if (ccder_blob_decode_tl(v22, 0x6000000000000010, &v24))
      {
        v32 = 0uLL;
        if ((ccder_blob_decode_range(v23, 0x6000000000000010, (unsigned __int8 **)&v32) & 1) == 0)
        {
          v11 = *(void (**)(uint64_t, const char *, ...))(v5 + 24);
          if (v11)
          {
            v12 = "entitlements blob does not have CCDER_ENTITLEMENTS coding";
LABEL_25:
            v16 = "validate_VNext";
            goto LABEL_34;
          }
          return (uint64_t)&unk_1EA95A040;
        }
        v26 = 0;
        v27 = 0;
        result = ccder_blob_decode_range((unsigned __int8 **)&v32, 2, (unsigned __int8 **)&v26);
        if ((result & 1) == 0)
        {
          v11 = *(void (**)(uint64_t, const char *, ...))(v5 + 24);
          if (v11)
          {
            v12 = "unknown number encoding";
            goto LABEL_33;
          }
          return (uint64_t)&unk_1EA95A040;
        }
        if (v27 - (unint64_t)v26 >= 9)
        {
          v11 = *(void (**)(uint64_t, const char *, ...))(v5 + 24);
          if (v11)
          {
            v12 = "number too large";
LABEL_33:
            v16 = "der_decode_number";
            goto LABEL_34;
          }
          return (uint64_t)&unk_1EA95A040;
        }
        if ((unint64_t)v26 >= v27)
        {
          v19 = 0;
LABEL_52:
          v21 = *(void (**)(uint64_t, const char *, ...))(v5 + 24);
          if (v21)
            v21(v5, "[%s]: entitlements blob has unexpected version %lld\n", "validate_VNext", v19);
          return (uint64_t)&unk_1EA95A040;
        }
        v18 = 0;
        v19 = 0;
        while (1)
        {
          if (!v18 && *v26 < 0)
            v19 = -1;
          v20 = (unsigned __int8 *)&v26[v18];
          if ((unint64_t)&v26[v18] >= v27 || v20 < (unsigned __int8 *)v26)
            goto LABEL_56;
          v19 = *v20 | (unint64_t)(v19 << 8);
          if (v27 - (_QWORD)v26 == ++v18)
          {
            if (v19 != 1)
              goto LABEL_52;
            v30 = 0;
            v31 = 0;
            v25 = v32;
            if ((ccder_blob_decode_range((unsigned __int8 **)&v25, 0xA000000000000010, &v30) & 1) != 0)
            {
              v29 = 0;
              v26 = (char *)v5;
              v27 = 0xA000000000000010;
              v28 = 1;
              LOBYTE(v29) = *a2;
              if (!recursivelyValidateEntitlements((uint64_t)&v26, (uint64_t)&v32))
                goto LABEL_48;
              v14 = 2;
              goto LABEL_22;
            }
            v11 = *(void (**)(uint64_t, const char *, ...))(v5 + 24);
            if (!v11)
              return (uint64_t)&unk_1EA95A040;
            v12 = "entitlements blob does not have CCDER_ENTITLEMENTS_DICT as the second element";
            goto LABEL_25;
          }
        }
      }
      v32 = 0uLL;
      v30 = a4;
      v31 = a5;
      if ((ccder_blob_decode_range(&v30, 0x2000000000000011, (unsigned __int8 **)&v32) & 1) == 0)
      {
        v11 = *(void (**)(uint64_t, const char *, ...))(v5 + 24);
        if (v11)
        {
          v12 = "entitlements blob does not have CCDER_CONSTRUCTED_SET coding";
          v16 = "validate_V0";
LABEL_34:
          v11(v5, "[%s]: %s\n", v16, v12);
          return (uint64_t)&unk_1EA95A040;
        }
        return (uint64_t)&unk_1EA95A040;
      }
      v28 = 0;
      v29 = 0;
      v26 = (char *)v5;
      v27 = 0x2000000000000011;
      LOBYTE(v29) = *a2;
      if (recursivelyValidateEntitlements((uint64_t)&v26, (uint64_t)v23))
      {
        v14 = 1;
LABEL_22:
        *a3 = v14;
        v15 = &kCENoError;
      }
      else
      {
LABEL_48:
        v15 = &kCEMalformedEntitlements;
      }
      return (uint64_t)*v15;
    }
  }
  else
  {
LABEL_16:
    v13 = *(void (**)(uint64_t, const char *, ...))(result + 24);
    if (v13)
      v13(result, "[%s]: %s\n", "CEValidateWithOptions", "invalid arguments passed in");
    return (uint64_t)&unk_1EA95A020;
  }
}

uint64_t CEAcquireUnmanagedContext(uint64_t result, _QWORD *a2, uint64_t a3)
{
  unint64_t v4;
  unint64_t v5;
  __int128 v6;
  __int128 v7;
  _UNKNOWN **v8;
  _OWORD v9[3];
  unint64_t v10;
  _OWORD v11[3];
  unint64_t v12;

  if (!a3 || !*a2 || !a2[1] || !a2[2])
  {
    v8 = &kCEInvalidArgument;
    return (uint64_t)*v8;
  }
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)(a3 + 48) = 0u;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  v5 = a2[1];
  v4 = a2[2];
  if (*a2 == 2)
  {
    if (v5 <= v4)
    {
      *(_QWORD *)(a3 + 8) = 0;
      *(_QWORD *)(a3 + 16) = 0;
      *(_QWORD *)a3 = result;
      *(_OWORD *)(a3 + 24) = xmmword_1DEEBD800;
      *(_QWORD *)(a3 + 40) = v5;
      *(_QWORD *)(a3 + 48) = v4;
      v6 = *(_OWORD *)(a3 + 16);
      v9[0] = *(_OWORD *)a3;
      v9[1] = v6;
      v9[2] = *(_OWORD *)(a3 + 32);
      v10 = v4;
      der_vm_execute_nocopy((unint64_t)v9, (uint64_t)&_CESelectValueOperation, (uint64_t)v11);
      v7 = v11[1];
      *(_OWORD *)a3 = v11[0];
      *(_OWORD *)(a3 + 16) = v7;
      *(_OWORD *)(a3 + 32) = v11[2];
      v4 = v12;
LABEL_12:
      *(_QWORD *)(a3 + 48) = v4;
      v8 = &kCENoError;
      return (uint64_t)*v8;
    }
  }
  else if (v5 <= v4)
  {
    *(_QWORD *)(a3 + 8) = 0;
    *(_QWORD *)(a3 + 16) = 0;
    *(_QWORD *)a3 = result;
    *(_OWORD *)(a3 + 24) = xmmword_1DEEBD7F0;
    *(_QWORD *)(a3 + 40) = v5;
    goto LABEL_12;
  }
  __break(0x5519u);
  return result;
}

uint64_t der_vm_execute_match_string(uint64_t a1, __int128 *a2, uint64_t a3)
{
  unint64_t v4;
  __int128 v5;
  __int128 v6;
  const void *v7;
  size_t *v8;
  size_t v9;
  uint64_t result;
  BOOL v11;
  unsigned __int8 *v12;
  unsigned __int8 *v13;
  uint64_t v14;
  size_t v15;
  uint64_t (*v16)(unint64_t, const char *, ...);
  uint64_t (*v17)(unint64_t, const char *, ...);
  BOOL v18;
  __int128 v19;
  unsigned __int8 *v20;
  unsigned __int8 *v21;

  v4 = *(_QWORD *)a2;
  v5 = a2[2];
  v6 = *a2;
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v5;
  *(_OWORD *)a1 = v6;
  *(_QWORD *)(a1 + 48) = *((_QWORD *)a2 + 6);
  *(_BYTE *)(a1 + 33) = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  if ((*(_BYTE *)(a3 + 7) & 0x40) != 0)
  {
    v7 = *(const void **)(a3 + 8);
    v8 = (size_t *)(a3 + 16);
  }
  else
  {
    v7 = (const void *)(a3 + 8);
    v8 = (size_t *)(a3 + 248);
  }
  v9 = *v8;
  v19 = *(__int128 *)((char *)a2 + 40);
  v20 = 0;
  v21 = 0;
  result = ccder_blob_decode_range((unsigned __int8 **)&v19, 12, &v20);
  if ((result & 1) != 0)
  {
    v11 = 0;
    v12 = v20;
    v13 = v21;
    if (v7 && v9)
    {
      if (v20)
      {
        v14 = v21 - v20;
        if (v9 >= v21 - v20)
          v15 = v21 - v20;
        else
          v15 = v9;
        result = memcmp(v7, v20, v15);
        v11 = (_DWORD)result == 0;
        if (v9 != v14)
          v11 = 0;
      }
      else
      {
        v11 = 0;
      }
    }
    if (v9)
      v18 = 0;
    else
      v18 = v13 == v12;
    if (v18)
      v11 = 1;
    *(_BYTE *)(a1 + 33) = v11;
  }
  else
  {
    v16 = *(uint64_t (**)(unint64_t, const char *, ...))(v4 + 24);
    if (v16)
    {
      result = v16(v4, "[%s]: %s\n", "der_decode_string", "Unknown string encoding");
      v17 = *(uint64_t (**)(unint64_t, const char *, ...))(v4 + 24);
      if (v17)
      {
        if (v4 && v4 >= v4 + 64)
          __break(0x5519u);
        else
          return v17(v4, "[%s]: %s\n", "der_vm_execute_match_string", "string decode failure");
      }
    }
  }
  return result;
}

uint64_t string_value_allowed_iterate(uint64_t *a1)
{
  _QWORD *v2;
  uint64_t v3;
  const void *v4;
  size_t *v5;
  size_t v6;
  uint64_t result;
  uint64_t v8;
  void (*v9)(uint64_t, const char *, ...);
  unint64_t v10;
  size_t v11;
  unsigned __int8 *v12;
  int v14;
  void (*v15)(unint64_t, const char *, ...);
  uint64_t v16;
  _BYTE v17[56];
  __int128 v18;
  unsigned __int8 *v19;
  unint64_t v20;

  v2 = (_QWORD *)a1[15];
  v3 = v2[1];
  if ((*(_BYTE *)(v3 + 7) & 0x40) != 0)
  {
    v4 = *(const void **)(v3 + 8);
    v5 = (size_t *)(v3 + 16);
  }
  else
  {
    v4 = (const void *)(v3 + 8);
    v5 = (size_t *)(v3 + 248);
  }
  if (*((_DWORD *)a1 + 29) != 4)
  {
    v8 = *a1;
    v9 = *(void (**)(uint64_t, const char *, ...))(*a1 + 24);
    if (v9)
      v9(v8, "[%s]: %s\n", "string_value_allowed_iterate", "Unexpected type to match against during iteration");
    return 1;
  }
  v6 = *v5;
  der_vm_execute_match_string((uint64_t)v17, (__int128 *)(a1 + 7), v3);
  if (v17[33])
  {
    result = 0;
    *(_BYTE *)(*v2 + 33) = 1;
    return result;
  }
  v10 = a1[7];
  v18 = *((_OWORD *)a1 + 6);
  v19 = 0;
  v20 = 0;
  if ((ccder_blob_decode_range((unsigned __int8 **)&v18, 12, &v19) & 1) == 0)
  {
    v15 = *(void (**)(unint64_t, const char *, ...))(v10 + 24);
    if (v15)
      v15(v10, "[%s]: %s\n", "der_decode_string", "Unknown string encoding");
    if (!v10 || v10 < v10 + 64)
      goto LABEL_27;
    goto LABEL_26;
  }
  if (v20 - (unint64_t)v19 < 2)
    return 1;
  v11 = v20 - (_QWORD)v19 - 1;
  v12 = (unsigned __int8 *)(v20 - 1);
  if (v20 - 1 >= v20 || v12 < v19)
  {
LABEL_26:
    __break(0x5519u);
LABEL_27:
    v16 = (*(uint64_t (**)(unint64_t, const char *, ...))(v10 + 32))(v10, "[%s]: %s\n", "der_vm_string_from_context", "Attempting to select a string value from a non-string DER object");
    return string_prefix_allowed_iterate(v16);
  }
  if (*v12 != 42 || v11 > v6)
    return 1;
  v14 = memcmp(v19, v4, v11);
  result = 1;
  if (!v14)
  {
    *(_BYTE *)(*v2 + 33) = 1;
    return 0;
  }
  return result;
}

uint64_t string_prefix_allowed_iterate(uint64_t *a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  int v5;
  const void *v6;
  size_t v7;
  unint64_t v8;
  void (*v9)(uint64_t, const char *, ...);
  void (*v10)(unint64_t, const char *, ...);
  void (*v11)(unint64_t, const char *, ...);
  uint64_t result;
  void (*v13)(unint64_t, const char *, ...);
  uint64_t v14;
  __int128 v15;
  unsigned __int8 *v16;
  uint64_t v17;

  v2 = *a1;
  v3 = (_QWORD *)a1[15];
  v4 = v3[1];
  v5 = *((_DWORD *)a1 + 29);
  if ((*(_BYTE *)(v4 + 7) & 0x40) == 0)
  {
    if (v5 == 4)
    {
      v6 = (const void *)(v4 + 8);
      v7 = *(_QWORD *)(v4 + 248);
      goto LABEL_6;
    }
LABEL_11:
    v9 = *(void (**)(uint64_t, const char *, ...))(v2 + 24);
    if (v9)
      v9(v2, "[%s]: %s\n", "string_prefix_allowed_iterate", "Unexpected type to match against during iteration");
    return 1;
  }
  if (v5 != 4)
    goto LABEL_11;
  v6 = *(const void **)(v4 + 8);
  v7 = *(_QWORD *)(v4 + 16);
LABEL_6:
  v8 = a1[7];
  v15 = *((_OWORD *)a1 + 6);
  v16 = 0;
  v17 = 0;
  if ((ccder_blob_decode_range((unsigned __int8 **)&v15, 12, &v16) & 1) != 0)
  {
    if (!v7 || v7 <= v17 - (uint64_t)v16 && !memcmp(v6, v16, v7))
      goto LABEL_23;
  }
  else
  {
    v10 = *(void (**)(unint64_t, const char *, ...))(v8 + 24);
    if (v10)
    {
      v10(v8, "[%s]: %s\n", "der_decode_string", "Unknown string encoding");
      v11 = *(void (**)(unint64_t, const char *, ...))(v8 + 24);
      if (v11)
      {
        if (v8 && v8 >= v8 + 64)
        {
LABEL_28:
          __break(0x5519u);
          goto LABEL_29;
        }
        v11(v8, "[%s]: %s\n", "der_vm_execute_match_string_prefix", "string decode failure");
      }
    }
  }
  v8 = a1[7];
  v15 = *((_OWORD *)a1 + 6);
  v16 = 0;
  v17 = 0;
  if ((ccder_blob_decode_range((unsigned __int8 **)&v15, 12, &v16) & 1) != 0)
  {
    if (!v7 || v7 <= v17 - (uint64_t)v16 && !memcmp(v6, v16, v7))
    {
LABEL_23:
      result = 0;
      *(_BYTE *)(*v3 + 33) = 1;
      return result;
    }
    return 1;
  }
  v13 = *(void (**)(unint64_t, const char *, ...))(v8 + 24);
  if (v13)
    v13(v8, "[%s]: %s\n", "der_decode_string", "Unknown string encoding");
  if (v8 && v8 >= v8 + 64)
    goto LABEL_28;
LABEL_29:
  v14 = (*(uint64_t (**)(unint64_t, const char *, ...))(v8 + 32))(v8, "[%s]: %s\n", "der_vm_string_from_context", "Attempting to select a string value from a non-string DER object");
  return integer_allowed_iterate(v14);
}

uint64_t integer_allowed_iterate(uint64_t *a1)
{
  _QWORD *v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t result;
  uint64_t (*v5)(unint64_t, const char *, ...);
  const char *v6;
  uint64_t v7;
  void (*v8)(uint64_t, const char *, ...);
  void (*v9)(unint64_t, const char *, ...);
  uint64_t v10;
  uint64_t v11;
  unsigned __int8 *v12;
  __int128 v13;
  char *v14;
  unint64_t v15;

  if (*((_DWORD *)a1 + 29) != 3)
  {
    v7 = *a1;
    v8 = *(void (**)(uint64_t, const char *, ...))(v7 + 24);
    if (v8)
      v8(v7, "[%s]: %s\n", "integer_allowed_iterate", "Unexpected type to match against during iteration");
    return 0;
  }
  v1 = (_QWORD *)a1[15];
  v2 = v1[1];
  v3 = a1[7];
  v13 = *((_OWORD *)a1 + 6);
  v14 = 0;
  v15 = 0;
  result = ccder_blob_decode_range((unsigned __int8 **)&v13, 2, (unsigned __int8 **)&v14);
  if ((result & 1) == 0)
  {
    v5 = *(uint64_t (**)(unint64_t, const char *, ...))(v3 + 24);
    if (v5)
    {
      v6 = "unknown number encoding";
      goto LABEL_11;
    }
LABEL_12:
    v9 = *(void (**)(unint64_t, const char *, ...))(v3 + 24);
    if (!v9)
      return 1;
    if (!v3 || v3 < v3 + 64)
    {
      v9(v3, "[%s]: %s\n", "der_vm_execute_match_integer", "BOOL decode failure");
      return 1;
    }
LABEL_30:
    __break(0x5519u);
    return result;
  }
  if (v15 - (unint64_t)v14 >= 9)
  {
    v5 = *(uint64_t (**)(unint64_t, const char *, ...))(v3 + 24);
    if (v5)
    {
      v6 = "number too large";
LABEL_11:
      result = v5(v3, "[%s]: %s\n", "der_decode_number", v6);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  if ((unint64_t)v14 < v15)
  {
    v10 = 0;
    v11 = 0;
    while (1)
    {
      if (!v10 && *v14 < 0)
        v11 = -1;
      v12 = (unsigned __int8 *)&v14[v10];
      if ((unint64_t)&v14[v10] >= v15 || v12 < (unsigned __int8 *)v14)
        goto LABEL_30;
      v11 = *v12 | (unint64_t)(v11 << 8);
      if (v15 - (_QWORD)v14 == ++v10)
        goto LABEL_28;
    }
  }
  v11 = 0;
LABEL_28:
  result = 1;
  if (v11 == *(_QWORD *)(v2 + 8))
  {
    *(_BYTE *)(*v1 + 33) = 1;
    return 0;
  }
  return result;
}

uint64_t recursivelyValidateEntitlements(uint64_t result, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  void (*v4)(unint64_t, const char *);
  BOOL v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  const void *v9;
  size_t v10;
  size_t v11;
  const void *v12;
  size_t v13;
  BOOL v14;
  int v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unsigned __int8 *v19;
  unsigned __int8 *v20;
  unsigned __int8 *v21;
  uint64_t v22;
  __int128 v23;
  void *v24;
  size_t v25;
  unsigned __int8 *v26;
  unint64_t v27;

  v2 = *(_QWORD *)result;
  v3 = *(_QWORD *)result + 64;
  if (*(int *)(result + 20) > 12)
  {
    v4 = *(void (**)(unint64_t, const char *))(v2 + 24);
    if (v4)
    {
      if (v2 < v3)
        goto LABEL_33;
      goto LABEL_95;
    }
    return 0;
  }
  v21 = 0;
  v22 = 0;
  v20 = 0;
  if (v2)
    v5 = v2 >= v3;
  else
    v5 = 0;
  if (v5)
  {
LABEL_95:
    __break(0x5519u);
    return result;
  }
  v6 = result;
  if ((der_decode_next(v2, &v22, &v20, 0, a2) & 1) == 0)
  {
    v4 = *(void (**)(unint64_t, const char *))(v2 + 24);
    if (v4)
    {
LABEL_33:
      v16 = v2;
LABEL_34:
      v4(v16, "[%s]: %s\n");
      return 0;
    }
    return 0;
  }
  if (v22 != *(_QWORD *)(v6 + 8))
  {
    switch(v22)
    {
      case 1:
        v26 = 0;
        v27 = 0;
        if ((ccder_blob_decode_range(&v20, 1, &v26) & 1) != 0)
        {
          if (v27 - (_QWORD)v26 == 1)
            goto LABEL_89;
          v4 = *(void (**)(unint64_t, const char *))(v2 + 24);
          if (!v4)
            return 0;
        }
        else
        {
          v4 = *(void (**)(unint64_t, const char *))(v2 + 24);
          if (!v4)
            return 0;
        }
        goto LABEL_33;
      case 2:
        v26 = 0;
        v27 = 0;
        result = ccder_blob_decode_range(&v20, 2, &v26);
        if ((result & 1) == 0)
        {
          v4 = *(void (**)(unint64_t, const char *))(v2 + 24);
          if (!v4)
            return 0;
          goto LABEL_33;
        }
        v18 = v27 - (_QWORD)v26;
        if (v27 - (unint64_t)v26 >= 9)
        {
          v4 = *(void (**)(unint64_t, const char *))(v2 + 24);
          if (!v4)
            return 0;
          goto LABEL_33;
        }
        if ((unint64_t)v26 >= v27)
          goto LABEL_89;
        v19 = v26;
        while ((unint64_t)v19 < v27 && v19 >= v26)
        {
          ++v19;
          if (!--v18)
            goto LABEL_89;
        }
        goto LABEL_95;
      case 3:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
        goto LABEL_51;
      case 4:
        if (*(_BYTE *)(v6 + 24))
        {
          v26 = 0;
          v27 = 0;
          if ((der_decode_data(v2, &v26, &v20) & 1) == 0)
            return 0;
          goto LABEL_89;
        }
        v4 = *(void (**)(unint64_t, const char *))(v2 + 24);
        if (!v4)
          return 0;
        goto LABEL_33;
      case 12:
        v26 = 0;
        v27 = 0;
        if ((ccder_blob_decode_range(&v20, 12, &v26) & 1) != 0)
        {
          if (!memchr(v26, 0, v27 - (_QWORD)v26))
            goto LABEL_89;
          v4 = *(void (**)(unint64_t, const char *))(v2 + 24);
          if (!v4)
            return 0;
        }
        else
        {
          v4 = *(void (**)(unint64_t, const char *))(v2 + 24);
          if (!v4)
            return 0;
        }
        goto LABEL_33;
      default:
        if (v22 != 0x2000000000000010)
        {
LABEL_51:
          v4 = *(void (**)(unint64_t, const char *))(v2 + 24);
          if (!v4)
            return 0;
          goto LABEL_33;
        }
        v7 = *(_QWORD *)v6;
        v17 = *(_QWORD *)v6 + 64;
        v26 = 0;
        v27 = 0;
        result = ccder_blob_decode_sequence_tl(&v20, &v26);
        if ((_DWORD)result)
        {
          do
          {
            if ((unint64_t)v26 >= v27)
              goto LABEL_89;
            ++*(_DWORD *)(v6 + 20);
            result = recursivelyValidateEntitlements(v6, &v26);
            --*(_DWORD *)(v6 + 20);
          }
          while ((result & 1) != 0);
          v4 = *(void (**)(unint64_t, const char *))(v7 + 24);
          if (!v4)
            return 0;
          if (v7 >= v17)
            goto LABEL_95;
        }
        else
        {
          v4 = *(void (**)(unint64_t, const char *))(v7 + 24);
          if (!v4)
            return 0;
          if (v7 >= v17)
            goto LABEL_95;
        }
        break;
    }
    goto LABEL_43;
  }
  v7 = *(_QWORD *)v6;
  v8 = *(_QWORD *)v6 + 64;
  v26 = 0;
  v27 = 0;
  result = ccder_blob_decode_range(&v20, v22, &v26);
  if (!(_DWORD)result)
  {
    v4 = *(void (**)(unint64_t, const char *))(v7 + 24);
    if (!v4)
      return 0;
    if (v7 >= v8)
      goto LABEL_95;
LABEL_43:
    v16 = v7;
    goto LABEL_34;
  }
  if ((unint64_t)v26 < v27)
  {
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v24 = 0;
      v25 = 0;
      v23 = 0uLL;
      result = der_decode_key_value(v7, &v24, &v23, &v26);
      if ((result & 1) == 0)
      {
        v4 = *(void (**)(unint64_t, const char *))(v7 + 24);
        if (!v4)
          return 0;
        if (v7 >= v8)
          goto LABEL_95;
        goto LABEL_43;
      }
      v12 = v24;
      v11 = v25;
      result = (uint64_t)memchr(v24, 0, v25);
      if (result)
      {
        v4 = *(void (**)(unint64_t, const char *))(v7 + 24);
        if (!v4)
          return 0;
        if (v7 >= v8)
          goto LABEL_95;
        goto LABEL_43;
      }
      if (*(_BYTE *)(v6 + 16) && v9 && v10)
      {
        if (!v12)
          break;
        v13 = v10 >= v11 ? v11 : v10;
        result = memcmp(v9, v12, v13);
        v14 = v10 != v11 && (_DWORD)result == 0;
        v15 = (v10 < v11) << 31;
        if (!v14)
          v15 = result;
        if ((v15 & 0x80000000) == 0)
          break;
      }
      ++*(_DWORD *)(v6 + 20);
      result = recursivelyValidateEntitlements(v6, &v23);
      --*(_DWORD *)(v6 + 20);
      if ((result & 1) == 0)
      {
        v4 = *(void (**)(unint64_t, const char *))(v7 + 24);
        if (!v4)
          return 0;
        if (v7 >= v8)
          goto LABEL_95;
        goto LABEL_43;
      }
      v9 = v24;
      v10 = v25;
      if ((unint64_t)v26 >= v27)
        goto LABEL_89;
    }
    v4 = *(void (**)(unint64_t, const char *))(v7 + 24);
    if (!v4)
      return 0;
    if (v7 < v8)
      goto LABEL_43;
    goto LABEL_95;
  }
LABEL_89:
  if (v20 != v21)
  {
    v4 = *(void (**)(unint64_t, const char *))(v2 + 24);
    if (!v4)
      return 0;
    goto LABEL_33;
  }
  return 1;
}

uint64_t der_decode_next(uint64_t a1, _QWORD *a2, unsigned __int8 **a3, unsigned __int8 **a4, uint64_t a5)
{
  uint64_t v10;
  unsigned __int8 *v11;
  unsigned __int8 *v12;
  unint64_t v13;
  void (*v14)(uint64_t, const char *, ...);
  const char *v15;
  unsigned __int8 *v17;
  unint64_t v18;
  unint64_t v19;

  v11 = *(unsigned __int8 **)a5;
  v10 = *(_QWORD *)(a5 + 8);
  v18 = 0;
  v19 = 0;
  if ((ccder_blob_decode_tag((unsigned __int8 **)a5, &v19) & 1) == 0)
  {
    v14 = *(void (**)(uint64_t, const char *, ...))(a1 + 24);
    if (v14)
    {
      v15 = "could not decode tag for next DER sub-sequence";
      goto LABEL_10;
    }
    return 0;
  }
  if ((ccder_blob_decode_len((unsigned __int8 **)a5, &v18) & 1) == 0)
  {
    v14 = *(void (**)(uint64_t, const char *, ...))(a1 + 24);
    if (v14)
    {
      v15 = "could not decode size for next DER sub-sequence";
      goto LABEL_10;
    }
    return 0;
  }
  v12 = *(unsigned __int8 **)a5;
  v13 = v18;
  if (*(_QWORD *)(a5 + 8) - *(_QWORD *)a5 < v18)
  {
    v14 = *(void (**)(uint64_t, const char *, ...))(a1 + 24);
    if (v14)
    {
      v15 = "sub-sequence size is larger than sequence size";
LABEL_10:
      v14(a1, "[%s]: %s\n", "der_decode_next", v15);
      return 0;
    }
    return 0;
  }
  if (a2)
    *a2 = v19;
  v17 = &v12[v13];
  if (a3)
  {
    *a3 = v11;
    a3[1] = v17;
  }
  if (a4)
  {
    *a4 = v12;
    a4[1] = v17;
  }
  *(_QWORD *)a5 = v17;
  *(_QWORD *)(a5 + 8) = v10;
  return 1;
}

uint64_t der_decode_data(uint64_t a1, _QWORD *a2, unsigned __int8 **a3)
{
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, const char *, ...);
  unsigned __int8 *v9;
  uint64_t v10;

  v9 = 0;
  v10 = 0;
  v5 = ccder_blob_decode_range(a3, 4, &v9);
  if ((v5 & 1) != 0)
  {
    if (a2)
    {
      v6 = v10 - (_QWORD)v9;
      *a2 = v9;
      a2[1] = v6;
    }
  }
  else
  {
    v7 = *(void (**)(uint64_t, const char *, ...))(a1 + 24);
    if (v7)
      v7(a1, "[%s]: %s\n", "der_decode_data", "Unknown data encoding");
  }
  return v5;
}

uint64_t der_decode_key_value(uint64_t a1, _QWORD *a2, _OWORD *a3, unsigned __int8 **a4)
{
  uint64_t v8;
  void (*v9)(uint64_t, const char *, ...);
  const char *v10;
  void (*v11)(uint64_t, const char *, ...);
  unint64_t v13;
  unint64_t v14;
  __int128 v15;
  __int128 v16;

  v15 = 0uLL;
  v13 = 0;
  v14 = 0;
  if ((ccder_blob_decode_sequence_tl(a4, (unsigned __int8 **)&v15) & 1) == 0)
  {
    v9 = *(void (**)(uint64_t, const char *, ...))(a1 + 24);
    if (v9)
    {
      v10 = "key / value decoding failure";
LABEL_12:
      v9(a1, "[%s]: %s\n", "der_decode_key_value", v10);
    }
    return 0;
  }
  v16 = 0uLL;
  if ((ccder_blob_decode_range((unsigned __int8 **)&v15, 12, (unsigned __int8 **)&v16) & 1) == 0)
  {
    v11 = *(void (**)(uint64_t, const char *, ...))(a1 + 24);
    if (v11)
      v11(a1, "[%s]: %s\n", "der_decode_string", "Unknown string encoding");
LABEL_10:
    v9 = *(void (**)(uint64_t, const char *, ...))(a1 + 24);
    if (v9)
    {
      v10 = "dictionary key is not a valid string";
      goto LABEL_12;
    }
    return 0;
  }
  if (a2)
  {
    v8 = *((_QWORD *)&v16 + 1) - v16;
    *a2 = v16;
    a2[1] = v8;
    if (!v8)
      goto LABEL_10;
  }
  else if (!MEMORY[8])
  {
    goto LABEL_10;
  }
  v16 = v15;
  if ((ccder_blob_decode_tag((unsigned __int8 **)&v16, &v14) & 1) == 0)
  {
    v9 = *(void (**)(uint64_t, const char *, ...))(a1 + 24);
    if (!v9)
      return 0;
    v10 = "unable to decode value tag for key-value pair";
    goto LABEL_12;
  }
  if ((ccder_blob_decode_len((unsigned __int8 **)&v16, &v13) & 1) == 0)
  {
    v9 = *(void (**)(uint64_t, const char *, ...))(a1 + 24);
    if (!v9)
      return 0;
    v10 = "unable to decode value size for key-value pair";
    goto LABEL_12;
  }
  if ((unsigned __int8 *)(v16 + v13) != *a4)
  {
    v9 = *(void (**)(uint64_t, const char *, ...))(a1 + 24);
    if (!v9)
      return 0;
    v10 = "key-value pair contains extra elements";
    goto LABEL_12;
  }
  *a3 = v15;
  return 1;
}

char *der_size_element(_QWORD *a1, char **a2, uint64_t *a3)
{
  uint64_t v6;
  unint64_t v7;
  char *result;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  unint64_t v16;

  if (!a1)
    return (char *)&unk_1EA95A020;
  switch(*a1)
  {
    case 1:
      a1[2] = 1;
      v6 = 1;
      v7 = 1;
      goto LABEL_30;
    case 2:
      v7 = a1[2];
      v6 = 12;
      goto LABEL_30;
    case 4:
      v9 = a1[1];
      v10 = HIBYTE(v9);
      if ((HIBYTE(v9) + 1) > 1u)
      {
        v16 = 8;
      }
      else
      {
        if ((_DWORD)v10 == BYTE6(v9))
        {
          if ((_DWORD)v10 == BYTE5(v9))
          {
            if ((_DWORD)v10 == BYTE4(v9))
            {
              if ((_DWORD)v10 == BYTE3(v9))
              {
                if ((_DWORD)v10 == BYTE2(v9))
                {
                  if (BYTE1(v9) == (_DWORD)v10)
                    v11 = 2;
                  else
                    v11 = 3;
                  v12 = 1;
                  if (BYTE1(v9) != (_DWORD)v10)
                    v12 = 2;
                }
                else
                {
                  v12 = 3;
                  v11 = 4;
                }
              }
              else
              {
                v12 = 4;
                v11 = 5;
              }
            }
            else
            {
              v12 = 5;
              v11 = 6;
            }
          }
          else
          {
            v12 = 6;
            v11 = 7;
          }
        }
        else
        {
          v12 = 7;
          v11 = 8;
        }
        if ((((v9 >> (8 * v12 - 8)) ^ v10) & 0x80) != 0)
          v16 = v11;
        else
          v16 = v12;
      }
      *a3 = ccder_sizeof(2, v16);
      a1[2] = v16;
      return (char *)&Errors;
    case 5:
      goto LABEL_18;
    case 7:
      return (char *)der_size_dictionary(a1, a2, a3);
    case 9:
      v7 = a1[2];
      v6 = 4;
LABEL_30:
      *a3 = ccder_sizeof(v6, v7);
      return (char *)&Errors;
    default:
      return (char *)&unk_1EA95A020;
  }
  while (1)
  {
LABEL_18:
    result = *a2;
    v13 = (unint64_t)a2[1];
    if ((unint64_t)*a2 >= v13)
      return (char *)&unk_1EA95A040;
    v14 = result + 32;
    if ((unint64_t)(result + 32) > v13 || result >= v14)
      break;
    *a2 = v14;
    if (!result)
      return (char *)&unk_1EA95A040;
    if (*(_QWORD *)result == 6)
    {
      *a3 = ccder_sizeof(0x2000000000000010, 0);
      a1[2] = 0;
      return (char *)&Errors;
    }
    if (result >= v14)
      break;
    result = (char *)der_size_element();
    if (result != (char *)&Errors)
      return result;
  }
  __break(0x5519u);
  return result;
}

uint64_t der_size_dictionary(uint64_t result, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;
  unint64_t v6;
  char *v7;
  unint64_t v8;
  char *v9;
  char *v10;
  unint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  unint64_t v16;
  uint64_t v17;

  v5 = result;
  v6 = 0;
  v7 = *(char **)a2;
  v8 = *(_QWORD *)(a2 + 8);
  if (*(_QWORD *)a2 >= v8)
    return (uint64_t)&unk_1EA95A040;
  while (1)
  {
    v9 = v7 + 32;
    if ((unint64_t)(v7 + 32) > v8 || v7 > v9)
    {
LABEL_28:
      __break(0x5519u);
      return result;
    }
    *(_QWORD *)a2 = v9;
    if (!v7)
      return (uint64_t)&unk_1EA95A040;
    if (*(_QWORD *)v7 != 5)
      break;
    v7[24] = 1;
    if ((unint64_t)v9 >= v8)
      return (uint64_t)&unk_1EA95A040;
    v10 = v7 + 64;
    if ((unint64_t)(v7 + 64) > v8 || v9 > v10)
      goto LABEL_28;
    *(_QWORD *)a2 = v10;
    if (v7 == (char *)-32)
      return (uint64_t)&unk_1EA95A040;
    if (*(_QWORD *)v9 != 3)
      return (uint64_t)&unk_1EA95A040;
    v11 = *((_QWORD *)v7 + 6);
    if (!v11)
      return (uint64_t)&unk_1EA95A040;
    v12 = ccder_sizeof(12, v11);
    result = 0;
    v17 = 0;
    if ((unint64_t)v10 < v8)
    {
      v13 = v7 + 96;
      if ((unint64_t)(v7 + 96) > v8 || v10 > v13)
        goto LABEL_28;
      *(_QWORD *)a2 = v13;
      result = (uint64_t)(v7 + 64);
    }
    result = (uint64_t)der_size_element((_QWORD *)result, (char **)a2, &v17);
    if ((_UNKNOWN *)result != &Errors)
      return result;
    v14 = *(char **)a2;
    v8 = *(_QWORD *)(a2 + 8);
    if (*(_QWORD *)a2 >= v8)
      return (uint64_t)&unk_1EA95A040;
    v15 = v14 + 32;
    if ((unint64_t)(v14 + 32) > v8 || v14 > v15)
      goto LABEL_28;
    *(_QWORD *)a2 = v15;
    if (v14)
    {
      if (*(_QWORD *)v14 == 6)
      {
        v14[24] = 1;
        v16 = v17 + v12;
        *((_QWORD *)v7 + 2) = v17 + v12;
        result = ccder_sizeof(0x2000000000000010, v16);
        v6 += result;
        v7 = v15;
        if ((unint64_t)v15 < v8)
          continue;
      }
    }
    return (uint64_t)&unk_1EA95A040;
  }
  if (*(_QWORD *)v7 != 8)
    return (uint64_t)&unk_1EA95A040;
  *a3 = ccder_sizeof(0xA000000000000010, v6);
  *(_QWORD *)(v5 + 16) = v6;
  return (uint64_t)&Errors;
}

uint64_t der_encode_number(uint64_t *a1, unint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t result;
  unint64_t v8;
  unint64_t v9;
  _BYTE *v10;
  _BYTE *v12;
  _BYTE *v13;

  v2 = a2;
  v3 = HIBYTE(a2);
  if ((HIBYTE(a2) + 1) > 1u)
  {
    v6 = 8;
  }
  else
  {
    if ((_DWORD)v3 == BYTE6(a2))
    {
      if ((_DWORD)v3 == BYTE5(a2))
      {
        if ((_DWORD)v3 == BYTE4(a2))
        {
          if ((_DWORD)v3 == BYTE3(a2))
          {
            if ((_DWORD)v3 == BYTE2(a2))
            {
              if (BYTE1(a2) == (_DWORD)v3)
                v4 = 2;
              else
                v4 = 3;
              v5 = 1;
              if (BYTE1(a2) != (_DWORD)v3)
                v5 = 2;
            }
            else
            {
              v5 = 3;
              v4 = 4;
            }
          }
          else
          {
            v5 = 4;
            v4 = 5;
          }
        }
        else
        {
          v5 = 5;
          v4 = 6;
        }
      }
      else
      {
        v5 = 6;
        v4 = 7;
      }
    }
    else
    {
      v5 = 7;
      v4 = 8;
    }
    if ((((a2 >> (8 * v5 - 8)) ^ v3) & 0x80) != 0)
      v6 = v4;
    else
      v6 = v5;
  }
  v12 = 0;
  v13 = 0;
  result = ccder_blob_reserve_tl(a1, 2uLL, v6, &v12);
  if ((_DWORD)result)
  {
    v8 = (unint64_t)v12;
    v9 = (unint64_t)v13;
    if (v13 != v12)
    {
      v10 = v13 - 1;
      while ((unint64_t)v10 < v9 && (unint64_t)v10 >= v8)
      {
        *v10 = v2;
        v2 >>= 8;
        if (v10-- == v12)
          return result;
      }
      __break(0x5519u);
    }
  }
  return result;
}

void _xpc_mach_message_request_handoff_reply_cold_1()
{
  OUTLINED_FUNCTION_0();
  _os_crash();
  __break(1u);
}

void _xpc_graph_deserializer_read_port_cold_1()
{
  _os_crash();
  __break(1u);
}

void _xpc_mach_payload_extract_ool_port_cold_1(unsigned int a1)
{
  qword_1F0460B90 = (uint64_t)"Data corruption: Invalid disposition in payload.";
  qword_1F0460BC0 = a1;
  __break(1u);
}

void _xpc_rich_error_serialize_cold_1()
{
  _os_assert_log();
  _os_crash();
  __break(1u);
}

void _xpc_interface_routine_cold_1()
{
  qword_1F0460B90 = (uint64_t)"Configuration error: unreasonably large PID or execcnt";
  __break(1u);
}

void _xpc_interface_routine_cold_2()
{
  qword_1F0460B90 = (uint64_t)"Configuration error: failed to fetch our own audit token";
  __break(1u);
}

void _xpc_interface_routine_cold_3()
{
  _os_crash();
  __break(1u);
}

void _xpc_interface_routine_cold_4()
{
  _os_crash();
  __break(1u);
}

void _xpc_interface_routine_cold_5()
{
  _os_crash();
  __break(1u);
}

void _xpc_interface_routine_cold_6(int a1)
{
  _xpc_asprintf("bootstrap port must lead to PID 1 [actual pid = %d]", a1);
  _os_crash();
  __break(1u);
}

void _xpc_alloc_cold_1()
{
  _os_assert_log();
  _os_crash();
  __break(1u);
}

void _xpc_type_from_id_cold_1()
{
  qword_1F0460B90 = (uint64_t)"Data corruption: looking up type for a bogus id";
  __break(1u);
}

void _xpc_deserialize_from_wire_id_cold_2(unsigned int a1)
{
  qword_1F0460B90 = (uint64_t)"Data corruption: Attempted to deserialize an unknown type of object (the caller should have"
                             " skipped it with _xpc_wire_length_from_wire_id";
  qword_1F0460BC0 = a1;
  __break(1u);
}

void xpc_array_create_cold_1()
{
  qword_1F0460B90 = (uint64_t)"Data corruption: Too many objects";
  __break(1u);
}

void _xpc_traverse_dictionary_cold_1()
{
  _os_crash();
  __break(1u);
}

void _xpc_traverse_dictionary_cold_2()
{
  _os_crash();
  __break(1u);
}

void _xpc_traverse_array_cold_1()
{
  _os_crash();
  __break(1u);
}

void _xpc_traverse_array_cold_2()
{
  _os_crash();
  __break(1u);
}

void _xpc_traverse_simple_cold_1()
{
  _os_crash();
  __break(1u);
}

void ___xpc_event_publisher_xref_dispose_block_invoke_cold_1()
{
  _os_crash();
  __break(1u);
}

void xpc_event_publisher_activate_cold_1(const char *a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)&_event_publishers_lock);
  _xpc_asprintf("event stream %s is already monitored", a1);
  _os_crash();
  __break(1u);
}

void _xpc_event_publisher_set_subscriptions_cold_3()
{
  _os_assert_log();
  _os_crash();
  __break(1u);
}

void _xpc_connection_enqueue_cold_1(uint64_t a1)
{
  qword_1F0460B90 = (uint64_t)"libdispatch bug: Unexpected send result.";
  qword_1F0460BC0 = a1;
  __break(1u);
}

void _xpc_connection_handle_async_reply_cold_1(uint64_t a1)
{
  qword_1F0460B90 = (uint64_t)"libdispatch bug: Unexpected async reply reason.";
  qword_1F0460BC0 = a1;
  __break(1u);
}

void _xpc_connection_release_message_cold_1(int a1)
{
  uint64_t v1;

  v1 = a1;
  _os_assumes_log();
  qword_1F0460B90 = (uint64_t)"Data corruption: Malformed Mach message or kernel bug.";
  qword_1F0460BC0 = v1;
  __break(1u);
}

void _xpc_connection_release_message_cold_2(unsigned int a1)
{
  qword_1F0460B90 = (uint64_t)"Kernel bug: The kernel cannot allocate memory needed for the pseudo-receive.";
  qword_1F0460BC0 = a1;
  __break(1u);
}

void _xpc_connection_release_message_cold_3(unsigned int a1)
{
  qword_1F0460B90 = (uint64_t)"Kernel bug: MACH_SEND_NO_BUFFER returned for reliable message size.";
  qword_1F0460BC0 = a1;
  __break(1u);
}

void _xpc_connection_release_message_cold_4()
{
  qword_1F0460B90 = (uint64_t)"Bug in libxpc: Message larger than reliable size.";
  __break(1u);
}

void _xpc_connection_handle_disconnect_event_cold_1(unsigned int *a1, uint64_t a2)
{
  uint64_t v4;

  _os_assumes_log();
  v4 = *a1 | (unint64_t)(a2 << 32);
  qword_1F0460B90 = (uint64_t)"libdispatch bug: Disconnect with invalid receive port";
  qword_1F0460BC0 = v4;
  __break(1u);
}

void _xpc_connection_call_reply_async_cold_1()
{
  qword_1F0460B90 = (uint64_t)"Data corruption: Reply handler block scheduled with NULL reply.";
  __break(1u);
}

void _xpc_connection_init_cold_1(int a1)
{
  qword_1F0460B90 = (uint64_t)"Kernel bug: Unexpected error from connection mach_port_construct()";
  qword_1F0460BC0 = a1;
  __break(1u);
}

uint64_t _xpc_connection_init_cold_3(uint64_t a1, mach_port_name_t *a2)
{
  uint64_t result;

  _os_assumes_log();
  result = _xpc_mach_port_release(*a2);
  if ((_DWORD)result)
    return _os_assumes_log();
  return result;
}

void _xpc_connection_mach_event_cold_2(unsigned int a1)
{
  qword_1F0460B90 = (uint64_t)"libdispatch bug: _recvp is still valid";
  qword_1F0460BC0 = a1;
  __break(1u);
}

void _xpc_connection_mach_event_cold_3(unsigned int a1)
{
  qword_1F0460B90 = (uint64_t)"libdispatch bug: _sendp is still valid";
  qword_1F0460BC0 = a1;
  __break(1u);
}

void _xpc_connection_mach_event_cold_4()
{
  qword_1F0460B90 = (uint64_t)"Data corruption: Teardown of an uninitialized connection.";
  __break(1u);
}

void _xpc_connection_mach_event_cold_5()
{
  qword_1F0460B90 = (uint64_t)"libdispatch bug: Multiple cancellation events delivered.";
  __break(1u);
}

void _xpc_connection_mach_event_cold_6()
{
  qword_1F0460B90 = (uint64_t)"libdispatch bug: Invalid reply-received event delivered.";
  __break(1u);
}

void _xpc_connection_handle_sent_event_cold_1(int a1)
{
  qword_1F0460B90 = (uint64_t)"libdispatch bug: Non-check-in message without context.";
  qword_1F0460BC0 = a1;
  __break(1u);
}

void xpc_date_create_from_current_cold_1()
{
  qword_1F0460B90 = (uint64_t)"Data corruption: clock_gettime_nsec_np failed or is unreasonably far in the future";
  __break(1u);
}

void xpc_copy_bootstrap_cold_1()
{
  qword_1F0460B90 = (uint64_t)"Bug in libxpc: Invalid audit token in bootstrap dictionary";
  __break(1u);
}

void _xpc_get_service_instance_cold_1(void *a1, int a2)
{
  char *v4;

  bzero(a1, 0xA0uLL);
  v4 = strerror(a2);
  snprintf((char *)a1, 0xA0uLL, "%s: %d: %s", "_xpc_get_service_instance failed", a2, v4);
  qword_1F0460B90 = (uint64_t)a1;
  __break(1u);
}

void _xpc_dictionary_create_from_received_message_cold_2()
{
  _os_crash();
  __break(1u);
}

void _get_autorelease_pool_cold_1()
{
  qword_1F0460B90 = (uint64_t)"Configuration error: Service does not have NSAutoreleasePool.";
  __break(1u);
}

void _create_nsstring_for_key_cold_1()
{
  qword_1F0460B90 = (uint64_t)"Configuration error: Service does not have NSString.";
  __break(1u);
}

uint64_t _xpc_fd_desc_cold_1()
{
  __error();
  return _os_assumes_log();
}

void _libxpc_initializer_cold_1(int a1)
{
  qword_1F0460B90 = (uint64_t)"Kernel bug: Could not obtain task bootstrap port.";
  qword_1F0460BC0 = a1;
  __break(1u);
}

void _libxpc_initializer_cold_2(int a1)
{
  qword_1F0460B90 = (uint64_t)"Kernel bug: mach_ports_lookup() failed.";
  qword_1F0460BC0 = a1;
  __break(1u);
}

uint64_t _libxpc_initializer_cold_3()
{
  uint64_t result;

  _dyld_get_image_uuid();
  if ((_dyld_get_shared_cache_uuid() & 1) != 0)
    _dyld_get_shared_cache_range();
  result = _os_log_simple();
  qword_1F0460B90 = (uint64_t)"Bug in libxpc: Could not get bootstrap port.";
  __break(1u);
  return result;
}

void _libxpc_initializer_cold_4()
{
  qword_1F0460B90 = (uint64_t)"Bug in libxpc: No port given.";
  __break(1u);
}

void _libxpc_initializer_cold_5()
{
  qword_1F0460B90 = (uint64_t)"Configuration error: Invalid bootstrap port.";
  __break(1u);
}

void _xpc_connection_create_service_listener_cold_1()
{
  qword_1F0460B90 = (uint64_t)"Configuration error: XPCService is not a dictionary.";
  __break(1u);
}

void _xpc_connection_create_service_listener_cold_2()
{
  qword_1F0460B90 = (uint64_t)"Configuration error: Couldn't retrieve XPCService identifier from service bundle.";
  __break(1u);
}

void _xpc_connection_create_service_listener_cold_3()
{
  qword_1F0460B90 = (uint64_t)"Configuration error: Bundle Info.plist has no CFBundleIdentifier.";
  __break(1u);
}

void _xpc_connection_create_service_listener_cold_4()
{
  qword_1F0460B90 = (uint64_t)"Configuration error: Bundle XPCService dictionary does not declare additional subservices.";
  __break(1u);
}

void _xpc_connection_create_service_listener_cold_5()
{
  qword_1F0460B90 = (uint64_t)"Configuration error: Bundle XPCService dictionary does not declare specified subservice.";
  __break(1u);
}

void _xpc_connection_create_service_listener_cold_6()
{
  qword_1F0460B90 = (uint64_t)"Configuration error: Specified subservice is disabled.";
  __break(1u);
}

void _xpc_register_service_listener_with_handler_cold_1()
{
  qword_1F0460B90 = (uint64_t)"Configuration error: Already have a main service listener.";
  __break(1u);
}

void xpc_handle_service_cold_1()
{
  qword_1F0460B90 = (uint64_t)"Configuration error: Bundle has no Info.plist";
  __break(1u);
}

void xpc_handle_service_cold_2()
{
  qword_1F0460B90 = (uint64_t)"Configuration error: Bundle Info.plist has no XPCService dictionary.";
  __break(1u);
}

void xpc_handle_service_cold_3()
{
  qword_1F0460B90 = (uint64_t)"Configuration error: Bundle XPCService dictionary does not declare additional services.";
  __break(1u);
}

void xpc_handle_service_cold_4()
{
  qword_1F0460B90 = (uint64_t)"Configuration error: Bundle XPCService dictionary does not declare specified service name.";
  __break(1u);
}

void xpc_handle_service_cold_5()
{
  qword_1F0460B90 = (uint64_t)"Configuration error: Specified service name is disabled.";
  __break(1u);
}

void _xpc_create_bootstrap_pipe_cold_1()
{
  qword_1F0460B90 = (uint64_t)"Bug in libxpc: Could not create pipe to bootstrap server!";
  __break(1u);
}

void _xpc_init_pid_domain_cold_1()
{
  _os_assert_log();
  _os_crash();
  __break(1u);
}

void _xpc_copy_xpcservice_dictionary_cold_1()
{
  fwrite("An XPC Service cannot be run directly.\n", 0x27uLL, 1uLL, (FILE *)*MEMORY[0x1E0C874E0]);
  abort_with_reason();
  _xpc_copy_xpcservice_dictionary_cold_2();
}

void _xpc_copy_xpcservice_dictionary_cold_2()
{
  qword_1F0460B90 = (uint64_t)"Configuration error: Couldn't retrieve XPCService dictionary from service bundle.";
  __break(1u);
}

void _xpc_serializer_pack_cold_1()
{
  qword_1F0460B90 = (uint64_t)"Bug in libxpc: Unexpected platform";
  __break(1u);
}

void _xpc_serializer_pack_cold_2(uint64_t a1, uint64_t a2, void *a3)
{
  char *v4;

  syslog(3, "Out-of-line descriptor count is out-of-sync. Actual/expected: %lu/%lu", a1, a2);
  v4 = xpc_copy_description(a3);
  syslog(3, "Message:\n%s", v4);
  qword_1F0460B90 = (uint64_t)"Data corruption: Out-of-line descriptor count is out-of-sync.";
  __break(1u);
}

void _xpc_serializer_pack_cold_3()
{
  _os_assert_log();
  _os_crash();
  __break(1u);
}

void _xpc_serializer_cleanup_cold_1()
{
  qword_1F0460B90 = (uint64_t)"Data corruption: Destructor set on inline object graph.";
  __break(1u);
}

void _xpc_serializer_append_port_cold_1()
{
  qword_1F0460B90 = (uint64_t)"Bug in libxpc: Unexpected disposition";
  __break(1u);
}

void _xpc_serializer_append_port_cold_2()
{
  qword_1F0460B90 = (uint64_t)"Data corruption: Out-of-bounds descriptor append attempt.";
  __break(1u);
}

void _xpc_serializer_apply_cold_1()
{
  qword_1F0460B90 = (uint64_t)"Data corruption: Found unexpected non-XPC tagged pointer object";
  __break(1u);
}

void xpc_mach_send_copy_right_cold_1()
{
  qword_1F0460B90 = (uint64_t)"Data corruption: mach_port_destroy() called on send right referenced by an XPC object.";
  __break(1u);
}

void _xpc_session_message_error_during_cancelation_cold_1(unsigned int a1)
{
  qword_1F0460B90 = (uint64_t)"Bug in libxpc: invalid state passed to _xpc_session_message_error_during_cancelation()";
  qword_1F0460BC0 = a1;
  __break(1u);
}

void ___xpc_session_setup_connection_handlers_block_invoke_cold_1()
{
  qword_1F0460B90 = (uint64_t)"Bug in libxpc: unhandled error in session";
  __break(1u);
}

void ___xpc_listener_setup_connection_handlers_block_invoke_cold_1()
{
  qword_1F0460B90 = (uint64_t)"Bug in libxpc: xpc_listener_t configured without session handler";
  __break(1u);
}

void _xpc_mach_port_construct_cold_1(int a1)
{
  qword_1F0460B90 = (uint64_t)"Bug in libxpc: mach_port_construct() failed";
  qword_1F0460BC0 = a1;
  __break(1u);
}

void _xpc_mach_port_get_context_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  _os_crash();
  __break(1u);
}

void _fetch_self_token_cold_1()
{
  qword_1F0460B90 = (uint64_t)"Configuration error: failed to fetch our own audit token";
  __break(1u);
}

void _xpc_pipe_routine_cold_2(int a1)
{
  _xpc_asprintf("reply must be from PID 1 [actual pid = %d]", a1);
  _os_crash();
  __break(1u);
}

void _xpc_pipe_pack_message_cold_1()
{
  _os_assert_log();
  _os_crash();
  __break(1u);
}

void xpc_pipe_try_receive_cold_1()
{
  qword_1F0460B90 = (uint64_t)"Data corruption: Message buffer was shorter than mach_msg_header";
  __break(1u);
}

void _xpc_pipe_mach_msg_cold_1()
{
  qword_1F0460B90 = (uint64_t)"Data corruption: Invalid out-of-line descriptor specified.";
  __break(1u);
}

void _xpc_bundle_resolve_sync_cold_2()
{
  qword_1F0460B90 = (uint64_t)"Configuration error: Nonexistent bundle layout was resolved.";
  __break(1u);
}

void xpc_file_transfer_create_with_fd_cold_1()
{
  __error();
  OUTLINED_FUNCTION_1();
  _os_crash();
  __break(1u);
}

void _xpc_file_transfer_create_with_fd_impl_cold_1()
{
  OSQueueHead *v0;
  size_t v1;

  v0 = (OSQueueHead *)_os_crash();
  __break(1u);
  OSAtomicDequeue(v0, v1);
}

void *__cdecl OSAtomicDequeue(OSQueueHead *__list, size_t a2)
{
  return (void *)MEMORY[0x1E0C88A40](__list, a2);
}

void OSAtomicEnqueue(OSQueueHead *__list, void *__new, size_t a3)
{
  MEMORY[0x1E0C88A48](__list, __new, a3);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C87428](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x1E0C87430](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C87438](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C87440](aBlock);
}

int *_NSGetArgc(void)
{
  return (int *)MEMORY[0x1E0C87460]();
}

char ***_NSGetArgv(void)
{
  return (char ***)MEMORY[0x1E0C87468]();
}

char ***_NSGetEnviron(void)
{
  return (char ***)MEMORY[0x1E0C87470]();
}

int _NSGetExecutablePath(char *buf, uint32_t *bufsize)
{
  return MEMORY[0x1E0C872A8](buf, bufsize);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C87D88]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1E0C874A0](*(_QWORD *)&a1, a2);
}

uint64_t __sandbox_ms()
{
  return MEMORY[0x1E0C87EC0]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1E0C87508]();
}

uint64_t _dispatch_is_multithreaded()
{
  return MEMORY[0x1E0C86EE8]();
}

uint64_t _dyld_get_image_uuid()
{
  return MEMORY[0x1E0C872D8]();
}

uint64_t _dyld_get_prog_image_header()
{
  return MEMORY[0x1E0C872E0]();
}

uint64_t _dyld_get_shared_cache_range()
{
  return MEMORY[0x1E0C872E8]();
}

uint64_t _dyld_get_shared_cache_uuid()
{
  return MEMORY[0x1E0C872F0]();
}

uint64_t _dyld_is_memory_immutable()
{
  return MEMORY[0x1E0C87308]();
}

uint64_t _dyld_register_for_bulk_image_loads()
{
  return MEMORY[0x1E0C87310]();
}

uint64_t _dyld_shared_cache_real_path()
{
  return MEMORY[0x1E0C87328]();
}

void _exit(int a1)
{
  MEMORY[0x1E0C87F90](*(_QWORD *)&a1);
}

uint64_t _objc_registerTaggedPointerClass()
{
  return MEMORY[0x1E0DE79C8]();
}

uint64_t _os_alloc_once()
{
  return MEMORY[0x1E0C88A80]();
}

uint64_t _os_assert_log()
{
  return MEMORY[0x1E0C87528]();
}

uint64_t _os_assumes_log()
{
  return MEMORY[0x1E0C87530]();
}

uint64_t _os_avoid_tail_call()
{
  return MEMORY[0x1E0C87540]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1E0C87548]();
}

uint64_t _os_feature_enabled_simple_impl()
{
  return MEMORY[0x1E0C87CB8]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C88EB8](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _os_log_simple()
{
  return MEMORY[0x1E0C88A88]();
}

uint64_t _os_object_alloc()
{
  return MEMORY[0x1E0C86F30]();
}

uint64_t _os_object_alloc_realized()
{
  return MEMORY[0x1E0C86F38]();
}

uint64_t _os_object_release()
{
  return MEMORY[0x1E0C86F40]();
}

uint64_t _os_object_release_internal()
{
  return MEMORY[0x1E0C86F48]();
}

uint64_t _os_object_release_without_xref_dispose()
{
  return MEMORY[0x1E0C86F50]();
}

uint64_t _os_object_retain()
{
  return MEMORY[0x1E0C86F58]();
}

uint64_t _os_object_retain_internal()
{
  return MEMORY[0x1E0C86F60]();
}

uint64_t _os_object_retain_with_resurrect()
{
  return MEMORY[0x1E0C86F68]();
}

uint64_t _os_once()
{
  return MEMORY[0x1E0C88AA0]();
}

uint64_t _os_signpost_emit_unreliably_with_name_impl()
{
  return MEMORY[0x1E0C88EC8]();
}

uint64_t _os_trace_lazy_init_completed_4libxpc()
{
  return MEMORY[0x1E0C88ED8]();
}

void abort(void)
{
  MEMORY[0x1E0C87558]();
}

uint64_t abort_with_reason()
{
  return MEMORY[0x1E0C87FB8]();
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1E0C87FC8](a1, *(_QWORD *)&a2);
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1E0C87620](a1, a2);
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x1E0C87640](a1, *(_QWORD *)&a2);
}

char **__cdecl backtrace_symbols(void *const *a1, int a2)
{
  return (char **)MEMORY[0x1E0C87658](a1, *(_QWORD *)&a2);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C87668](a1, a2);
}

uint64_t change_fdguard_np()
{
  return MEMORY[0x1E0C87FE8]();
}

id class_createInstance(Class cls, size_t extraBytes)
{
  return (id)MEMORY[0x1E0DE7A90](cls, extraBytes);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x1E0DE7AC8](cls);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x1E0C87678](*(_QWORD *)&__clock_id);
}

int close(int a1)
{
  return MEMORY[0x1E0C88018](*(_QWORD *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1E0C87680](a1);
}

uint64_t csops()
{
  return MEMORY[0x1E0C88038]();
}

uint64_t csops_audittoken()
{
  return MEMORY[0x1E0C88040]();
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C86F70](object);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C86F88](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C86F90](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C86F98](queue, block);
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x1E0C86FA8](queue, context, work);
}

BOOL dispatch_data_apply(dispatch_data_t data, dispatch_data_applier_t applier)
{
  return MEMORY[0x1E0C86FC8](data, applier);
}

uint64_t dispatch_data_apply_f()
{
  return MEMORY[0x1E0C86FD0]();
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x1E0C86FD8](buffer, size, queue, destructor);
}

uint64_t dispatch_data_create_alloc()
{
  return MEMORY[0x1E0C86FE0]();
}

dispatch_data_t dispatch_data_create_concat(dispatch_data_t data1, dispatch_data_t data2)
{
  return (dispatch_data_t)MEMORY[0x1E0C86FE8](data1, data2);
}

dispatch_data_t dispatch_data_create_map(dispatch_data_t data, const void **buffer_ptr, size_t *size_ptr)
{
  return (dispatch_data_t)MEMORY[0x1E0C86FF0](data, buffer_ptr, size_ptr);
}

uint64_t dispatch_data_create_with_transform()
{
  return MEMORY[0x1E0C86FF8]();
}

uint64_t dispatch_data_get_flattened_bytes_4libxpc()
{
  return MEMORY[0x1E0C87000]();
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return MEMORY[0x1E0C87008](data);
}

uint64_t dispatch_data_make_memory_entry()
{
  return MEMORY[0x1E0C87010]();
}

void *__cdecl dispatch_get_context(dispatch_object_t object)
{
  return (void *)MEMORY[0x1E0C87018](object);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C87028](identifier, flags);
}

void dispatch_io_close(dispatch_io_t channel, dispatch_io_close_flags_t flags)
{
  MEMORY[0x1E0C87058](channel, flags);
}

dispatch_io_t dispatch_io_create(dispatch_io_type_t type, dispatch_fd_t fd, dispatch_queue_t queue, void *cleanup_handler)
{
  return (dispatch_io_t)MEMORY[0x1E0C87060](type, *(_QWORD *)&fd, queue, cleanup_handler);
}

uint64_t dispatch_mach_cancel()
{
  return MEMORY[0x1E0C87078]();
}

uint64_t dispatch_mach_connect()
{
  return MEMORY[0x1E0C87080]();
}

uint64_t dispatch_mach_create_4libxpc()
{
  return MEMORY[0x1E0C87088]();
}

uint64_t dispatch_mach_get_checkin_port()
{
  return MEMORY[0x1E0C87090]();
}

uint64_t dispatch_mach_handoff_reply()
{
  return MEMORY[0x1E0C87098]();
}

uint64_t dispatch_mach_handoff_reply_f()
{
  return MEMORY[0x1E0C870A0]();
}

uint64_t dispatch_mach_hooks_install_4libxpc()
{
  return MEMORY[0x1E0C870A8]();
}

uint64_t dispatch_mach_msg_create()
{
  return MEMORY[0x1E0C870B0]();
}

uint64_t dispatch_mach_msg_get_msg()
{
  return MEMORY[0x1E0C870B8]();
}

uint64_t dispatch_mach_receive_barrier_f()
{
  return MEMORY[0x1E0C870C0]();
}

uint64_t dispatch_mach_reconnect()
{
  return MEMORY[0x1E0C870C8]();
}

uint64_t dispatch_mach_send_barrier()
{
  return MEMORY[0x1E0C870D0]();
}

uint64_t dispatch_mach_send_barrier_f()
{
  return MEMORY[0x1E0C870D8]();
}

uint64_t dispatch_mach_send_with_result()
{
  return MEMORY[0x1E0C870E0]();
}

uint64_t dispatch_mach_send_with_result_and_async_reply_4libxpc()
{
  return MEMORY[0x1E0C870E8]();
}

uint64_t dispatch_mach_send_with_result_and_wait_for_reply()
{
  return MEMORY[0x1E0C870F0]();
}

void dispatch_main(void)
{
  MEMORY[0x1E0C870F8]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C87100](predicate, block);
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
  MEMORY[0x1E0C87108](predicate, context, function);
}

uint64_t dispatch_queue_attr_make_with_overcommit()
{
  return MEMORY[0x1E0C87118]();
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C87120](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C87128](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1E0C87130](label, attr, target);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1E0C87138](queue);
}

void dispatch_read(dispatch_fd_t fd, size_t length, dispatch_queue_t queue, void *handler)
{
  MEMORY[0x1E0C87140](*(_QWORD *)&fd, length, queue, handler);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C87148](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C87150](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x1E0C87158](object);
}

void dispatch_set_context(dispatch_object_t object, void *context)
{
  MEMORY[0x1E0C87178](object, context);
}

void dispatch_set_finalizer_f(dispatch_object_t object, dispatch_function_t finalizer)
{
  MEMORY[0x1E0C87180](object, finalizer);
}

uint64_t dispatch_set_qos_class_fallback()
{
  return MEMORY[0x1E0C87188]();
}

void dispatch_set_qos_class_floor(dispatch_object_t object, dispatch_qos_class_t qos_class, int relative_priority)
{
  MEMORY[0x1E0C87190](object, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x1E0C87198](object, queue);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C871A0](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C871A8](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_handle(dispatch_source_t source)
{
  return MEMORY[0x1E0C871B0](source);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C871C8](source, handler);
}

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
  MEMORY[0x1E0C871D0](source, handler);
}

uint64_t dispatch_source_set_mandatory_cancel_handler()
{
  return MEMORY[0x1E0C871D8]();
}

uint64_t dispatch_source_set_mandatory_cancel_handler_f()
{
  return MEMORY[0x1E0C871E0]();
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C871E8](source, start, interval, leeway);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x1E0C871F0](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C871F8](queue, block);
}

void dispatch_sync_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x1E0C87200](queue, context, work);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C87208](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C87350](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C87358](__handle, __symbol);
}

uint64_t dyld_get_active_platform()
{
  return MEMORY[0x1E0C87360]();
}

uint64_t dyld_get_base_platform()
{
  return MEMORY[0x1E0C87368]();
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C88090](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

uint64_t fileport_makefd()
{
  return MEMORY[0x1E0C880B8]();
}

uint64_t fileport_makeport()
{
  return MEMORY[0x1E0C880C0]();
}

void free(void *a1)
{
  MEMORY[0x1E0C88920](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C88108](*(_QWORD *)&a1, a2);
}

int fstatat(int a1, const char *a2, stat *a3, int a4)
{
  return MEMORY[0x1E0C88110](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C87798](__ptr, __size, __nitems, __stream);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1E0C88138](a1, a2, a3, a4, *(_QWORD *)&a5);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C877A8](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1E0C88160]();
}

int getpagesize(void)
{
  return MEMORY[0x1E0C877B8]();
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C88190]();
}

const section_64 *__cdecl getsectbyname(const char *segname, const char *sectname)
{
  return (const section_64 *)MEMORY[0x1E0C873A0](segname, sectname);
}

uid_t getuid(void)
{
  return MEMORY[0x1E0C881C0]();
}

tm *__cdecl gmtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1E0C877D0](a1, a2);
}

uint64_t guarded_close_np()
{
  return MEMORY[0x1E0C881D0]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C88238]();
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1E0C87810](a1, a2);
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1E0C882D8](*(_QWORD *)&error_value);
}

kern_return_t mach_make_memory_entry_64(vm_map_t target_task, memory_object_size_t *size, memory_object_offset_t offset, vm_prot_t permission, mach_port_t *object_handle, mem_entry_name_port_t parent_entry)
{
  return MEMORY[0x1E0C88330](*(_QWORD *)&target_task, size, offset, *(_QWORD *)&permission, object_handle, *(_QWORD *)&parent_entry);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1E0C88338](msg, *(_QWORD *)&option, *(_QWORD *)&send_size, *(_QWORD *)&rcv_size, *(_QWORD *)&rcv_name, *(_QWORD *)&timeout, *(_QWORD *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
  MEMORY[0x1E0C88348](a1);
}

mach_msg_return_t mach_msg_receive(mach_msg_header_t *a1)
{
  return MEMORY[0x1E0C88350](a1);
}

kern_return_t mach_port_construct(ipc_space_t task, mach_port_options_ptr_t options, mach_port_context_t context, mach_port_name_t *name)
{
  return MEMORY[0x1E0C88360](*(_QWORD *)&task, options, context, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1E0C88368](*(_QWORD *)&task, *(_QWORD *)&name);
}

kern_return_t mach_port_destruct(ipc_space_t task, mach_port_name_t name, mach_port_delta_t srdelta, mach_port_context_t guard)
{
  return MEMORY[0x1E0C88370](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&srdelta, guard);
}

kern_return_t mach_port_get_context(ipc_space_read_t task, mach_port_name_t name, mach_port_context_t *context)
{
  return MEMORY[0x1E0C88388](*(_QWORD *)&task, *(_QWORD *)&name, context);
}

kern_return_t mach_port_get_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_urefs_t *refs)
{
  return MEMORY[0x1E0C88390](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&right, refs);
}

kern_return_t mach_port_guard(ipc_space_t task, mach_port_name_t name, mach_port_context_t guard, BOOLean_t strict)
{
  return MEMORY[0x1E0C88398](*(_QWORD *)&task, *(_QWORD *)&name, guard, *(_QWORD *)&strict);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x1E0C883A0](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&poly, *(_QWORD *)&polyPoly);
}

kern_return_t mach_port_is_connection_for_service(ipc_space_t task, mach_port_name_t connection_port, mach_port_name_t service_port, uint64_t *filter_policy_id)
{
  return MEMORY[0x1E0C883A8](*(_QWORD *)&task, *(_QWORD *)&connection_port, *(_QWORD *)&service_port, filter_policy_id);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x1E0C883B8](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&right, *(_QWORD *)&delta);
}

kern_return_t mach_port_request_notification(ipc_space_t task, mach_port_name_t name, mach_msg_id_t msgid, mach_port_mscount_t sync, mach_port_t notify, mach_msg_type_name_t notifyPoly, mach_port_t *previous)
{
  return MEMORY[0x1E0C883C0](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&msgid, *(_QWORD *)&sync, *(_QWORD *)&notify, *(_QWORD *)&notifyPoly, previous);
}

kern_return_t mach_port_set_attributes(ipc_space_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info, mach_msg_type_number_t port_infoCnt)
{
  return MEMORY[0x1E0C883C8](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&flavor, port_info, *(_QWORD *)&port_infoCnt);
}

kern_return_t mach_port_type(ipc_space_t task, mach_port_name_t name, mach_port_type_t *ptype)
{
  return MEMORY[0x1E0C883D0](*(_QWORD *)&task, *(_QWORD *)&name, ptype);
}

kern_return_t mach_ports_lookup(task_t target_task, mach_port_array_t *init_port_set, mach_msg_type_number_t *init_port_setCnt)
{
  return MEMORY[0x1E0C883D8](*(_QWORD *)&target_task, init_port_set, init_port_setCnt);
}

kern_return_t mach_ports_register(task_t target_task, mach_port_array_t init_port_set, mach_msg_type_number_t init_port_setCnt)
{
  return MEMORY[0x1E0C883E0](*(_QWORD *)&target_task, init_port_set, *(_QWORD *)&init_port_setCnt);
}

kern_return_t mach_vm_map(vm_map_t target_task, mach_vm_address_t *address, mach_vm_size_t size, mach_vm_offset_t mask, int flags, mem_entry_name_port_t object, memory_object_offset_t offset, BOOLean_t copy, vm_prot_t cur_protection, vm_prot_t max_protection, vm_inherit_t inheritance)
{
  return MEMORY[0x1E0C88418](*(_QWORD *)&target_task, address, size, mask, *(_QWORD *)&flags, *(_QWORD *)&object, offset, *(_QWORD *)&copy);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C88960](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C88970](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C88978](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C88988](ptr, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C87820](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C87828](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C87830](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C87838](__dst, __src, __len);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x1E0C87848](__s, __smax, *(_QWORD *)&__c, __n);
}

void mig_deallocate(vm_address_t a1, vm_size_t a2)
{
  MEMORY[0x1E0C884C0](a1, a2);
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x1E0C884C8]();
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C88500](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C88518](a1, a2);
}

uint64_t notify_set_options()
{
  return MEMORY[0x1E0C88A20]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

Class objc_lookUpClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7D10](name);
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

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1E0DE7FF8](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C88528](a1, *(_QWORD *)&a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1E0C87878](a1);
}

uint64_t os_fault_with_payload()
{
  return MEMORY[0x1E0C88558]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C88EF8](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C88F18](oslog, type);
}

uint64_t os_map_128_destroy()
{
  return MEMORY[0x1E0C87B58]();
}

uint64_t os_map_128_find()
{
  return MEMORY[0x1E0C87B60]();
}

uint64_t os_map_128_init()
{
  return MEMORY[0x1E0C87B68]();
}

uint64_t os_map_128_insert()
{
  return MEMORY[0x1E0C87B70]();
}

void os_release(void *object)
{
  MEMORY[0x1E0C87210](object);
}

void *__cdecl os_retain(void *object)
{
  return (void *)MEMORY[0x1E0C87218](object);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C88F28](log);
}

uint64_t os_trace_set_mode()
{
  return MEMORY[0x1E0C88F40]();
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C88BC8](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C88BD0](lock);
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x1E0C88BE0]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C88BF0](lock);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1E0C87C58]();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1E0C87C60]();
}

int posix_spawnattr_setarchpref_np(posix_spawnattr_t *a1, size_t a2, cpu_type_t *a3, cpu_subtype_t *a4, size_t *a5)
{
  return MEMORY[0x1E0C885C0](a1, a2, a3, a4, a5);
}

uint64_t posix_spawnattr_setmacpolicyinfo_np()
{
  return MEMORY[0x1E0C885D8]();
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x1E0C88608](*(_QWORD *)&pid, *(_QWORD *)&flavor, arg, buffer, *(_QWORD *)&buffersize);
}

int proc_set_dirty(pid_t pid, BOOL dirty)
{
  return MEMORY[0x1E0C88620](*(_QWORD *)&pid, dirty);
}

int proc_track_dirty(pid_t pid, uint32_t flags)
{
  return MEMORY[0x1E0C88628](*(_QWORD *)&pid, *(_QWORD *)&flags);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1E0C88D28](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1E0C88D40](a1, a2);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1E0C88DC8](a1, a2);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1E0C88640](*(_QWORD *)&a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1E0C878C0](a1);
}

uint64_t sandbox_container_path_for_pid()
{
  return MEMORY[0x1E0C88E28]();
}

int setenv(const char *__name, const char *__value, int __overwrite)
{
  return MEMORY[0x1E0C87918](__name, __value, *(_QWORD *)&__overwrite);
}

uint64_t si_search_module_set_flags()
{
  return MEMORY[0x1E0C87D38]();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x1E0C87930](*(_QWORD *)&a1, a2);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1E0C87940](*(_QWORD *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C87950](__str, __size, __format);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C87958](a1, a2);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C87960](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C88738](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C87988](__s, *(_QWORD *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C87990](__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x1E0C87998](__dst, __src);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C879A8](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C879B0](*(_QWORD *)&__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x1E0C879C0](a1, a2, a3, a4);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1E0C879C8](__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1E0C879D0](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C879D8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C879E8](__s1, __s2, __n);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x1E0C879F8](__s1, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1E0C87A00](__s1, __n);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return (char *)MEMORY[0x1E0C87A08](__big, __little, __len);
}

char *__cdecl strptime(const char *a1, const char *a2, tm *a3)
{
  return (char *)MEMORY[0x1E0C87A10](a1, a2, a3);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C87A18](__s, *(_QWORD *)&__c);
}

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return (char *)MEMORY[0x1E0C87A20](__stringp, __delim);
}

double strtod(const char *a1, char **a2)
{
  double result;

  MEMORY[0x1E0C87A38](a1, a2);
  return result;
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C87A48](__str, __endptr, *(_QWORD *)&__base);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C87A50](__str, __endptr, *(_QWORD *)&__base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C87A98](a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x1E0C87418](*(_QWORD *)&a1, a2);
}

kern_return_t task_get_special_port(task_inspect_t task, int which_port, mach_port_t *special_port)
{
  return MEMORY[0x1E0C88770](*(_QWORD *)&task, *(_QWORD *)&which_port, special_port);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1E0C88778](*(_QWORD *)&target_task, *(_QWORD *)&flavor, task_info_out, task_info_outCnt);
}

uint64_t thread_get_special_reply_port()
{
  return MEMORY[0x1E0C887A8]();
}

void uuid_clear(uuid_t uu)
{
  MEMORY[0x1E0C87AE0](uu);
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x1E0C87AE8](uu1, uu2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
  MEMORY[0x1E0C87AF0](dst, src);
}

void uuid_generate(uuid_t out)
{
  MEMORY[0x1E0C87AF8](out);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x1E0C87B10](uu, out);
}

void uuid_unparse_upper(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x1E0C87B18](uu, out);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x1E0C87B20](a1, a2, a3);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x1E0C887E0](*(_QWORD *)&target_task, address, size, *(_QWORD *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1E0C887F0](*(_QWORD *)&target_task, address, size);
}

uint64_t voucher_adopt()
{
  return MEMORY[0x1E0C87268]();
}

uint64_t voucher_copy()
{
  return MEMORY[0x1E0C87270]();
}

uint64_t voucher_create_with_mach_msg()
{
  return MEMORY[0x1E0C87278]();
}

void voucher_mach_msg_clear(mach_msg_header_t *msg)
{
  MEMORY[0x1E0C88838](msg);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x1E0C88840](msg);
}

void vsyslog(int a1, const char *a2, __darwin_va_list a3)
{
  MEMORY[0x1E0C87420](*(_QWORD *)&a1, a2, a3);
}

