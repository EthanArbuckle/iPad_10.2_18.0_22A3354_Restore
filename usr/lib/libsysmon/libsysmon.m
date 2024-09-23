_QWORD *sysmon_request_create(uint64_t a1, const void *a2)
{
  _QWORD *internal;

  internal = _sysmon_request_create_internal(a1);
  internal[3] = _Block_copy(a2);
  return internal;
}

_QWORD *_sysmon_request_create_internal(uint64_t a1)
{
  _QWORD *v2;
  char __str[64];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = (_QWORD *)sysmon_request_alloc();
  snprintf(__str, 0x40uLL, "com.apple.sysmon.request.%p", v2);
  v2[2] = dispatch_queue_create(__str, 0);
  v2[6] = xpc_dictionary_create(0, 0, 0);
  v2[9] = a1;
  return v2;
}

_QWORD *sysmon_request_create_with_error(uint64_t a1, const void *a2)
{
  _QWORD *internal;

  internal = _sysmon_request_create_internal(a1);
  internal[4] = _Block_copy(a2);
  return internal;
}

void sysmon_request_add_attribute(_QWORD *a1, unsigned int a2)
{
  _BYTE *v4;
  unint64_t v5;
  size_t v6;
  unint64_t v7;
  unint64_t v8;
  _DWORD v9[2];
  __int16 v10;
  int v11;
  __int16 v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = (_BYTE *)a1[10];
  if (!v4)
  {
    v5 = a1[9] - 1;
    if (v5 >= 3)
    {
      __break(1u);
      return;
    }
    v6 = qword_215BBCAA8[v5];
    a1[11] = v6;
    v4 = malloc_type_calloc(v6, 1uLL, 0x100004077774924uLL);
    a1[10] = v4;
  }
  v7 = (unint64_t)a2 >> 3;
  v8 = a1[11];
  if (v8 <= v7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109632;
      v9[1] = a2;
      v10 = 1024;
      v11 = v7;
      v12 = 2048;
      v13 = v8;
      _os_log_impl(&dword_215BBA000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Error: sysmon_request_add_attribute called with attr: %du. Calculated index %du, while attrslen is %lu", (uint8_t *)v9, 0x18u);
    }
  }
  else
  {
    v4[v7] |= 1 << (a2 & 7);
  }
}

void sysmon_request_add_attributes(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned int a9, uint64_t a10)
{
  unsigned int v10;
  unsigned int *v12;
  unsigned int *v13;

  v13 = (unsigned int *)&a10;
  v10 = a9;
  if (a9)
  {
    do
    {
      sysmon_request_add_attribute(a1, v10);
      v12 = v13;
      v13 += 2;
      v10 = *v12;
    }
    while (*v12);
  }
}

uint64_t sysmon_request_set_flags(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 96) = a2;
  return result;
}

uint64_t sysmon_request_set_interval(uint64_t result, unint64_t a2)
{
  unint64_t v2;

  if (a2 <= 0x1F3)
  {
    v2 = 500;
LABEL_4:
    *(_QWORD *)(result + 104) = v2;
    return result;
  }
  v2 = 500 * (a2 / 0x1F4);
  if (a2 % 0x1F4 < v2 + 500 - a2)
    goto LABEL_4;
  *(_QWORD *)(result + 104) = v2 + 500;
  return result;
}

void sysmon_request_execute(uint64_t a1)
{
  const void *v2;
  uint64_t v3;
  _xpc_connection_s *v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD block[5];
  _QWORD handler[6];

  xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 48), (const char *)SYSMON_XPC_KEY_TYPE, *(_QWORD *)(a1 + 72));
  v2 = *(const void **)(a1 + 80);
  if (!v2)
    sysmon_request_execute_cold_1();
  xpc_dictionary_set_data(*(xpc_object_t *)(a1 + 48), (const char *)SYSMON_XPC_KEY_ATTRIBUTES, v2, *(_QWORD *)(a1 + 88));
  v3 = *(_QWORD *)(a1 + 96);
  if (v3)
    xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 48), (const char *)SYSMON_XPC_KEY_FLAGS, v3);
  *(_QWORD *)(a1 + 40) = xpc_connection_create_mach_service((const char *)SYSMON_XPC_SERVICE_NAME, *(dispatch_queue_t *)(a1 + 16), 2uLL);
  _os_object_retain_internal();
  v4 = *(_xpc_connection_s **)(a1 + 40);
  v5 = MEMORY[0x24BDAC760];
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 0x40000000;
  handler[2] = __sysmon_request_execute_block_invoke;
  handler[3] = &__block_descriptor_tmp;
  handler[4] = a1;
  handler[5] = a1;
  xpc_connection_set_event_handler(v4, handler);
  xpc_connection_resume(*(xpc_connection_t *)(a1 + 40));
  v6 = *(NSObject **)(a1 + 16);
  block[0] = v5;
  block[1] = 0x40000000;
  block[2] = __sysmon_request_execute_block_invoke_11;
  block[3] = &__block_descriptor_tmp_13;
  block[4] = a1;
  dispatch_sync(v6, block);
}

void __sysmon_request_execute_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  xpc_object_t v6;
  void *v7;
  _QWORD *v8;
  xpc_object_t value;
  xpc_object_t v10;
  xpc_object_t v11;
  size_t count;
  void *v13;
  uint64_t v14;
  _QWORD applier[5];

  v4 = MEMORY[0x2199ED6F4](a2);
  if (a2 == (void *)MEMORY[0x24BDACF38])
  {
    v5 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v5 + 64))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
        __sysmon_request_execute_block_invoke_cold_1();
    }
    else
    {
      if (!*(_BYTE *)(v5 + 65))
      {
        _sysmon_request_invoke_client_handler(v5, 0);
        v5 = *(_QWORD *)(a1 + 32);
      }
      *(_BYTE *)(v5 + 64) = 1;
      _os_object_release_internal();
    }
  }
  else if (v4 == MEMORY[0x24BDACFA0])
  {
    v6 = _sysmon_build_reply_with_diff(*(void **)(*(_QWORD *)(a1 + 40) + 56), a2, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72));
    v7 = *(void **)(*(_QWORD *)(a1 + 40) + 56);
    if (v7)
      xpc_release(v7);
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56) = xpc_retain(a2);
    v8 = (_QWORD *)sysmon_table_alloc();
    value = xpc_dictionary_get_value(v6, SYSMON_XPC_REPLY_KEY_TIMESTAMP);
    v8[2] = value;
    xpc_retain(value);
    v10 = xpc_dictionary_get_value(v6, SYSMON_XPC_REPLY_KEY_HEADER);
    v8[3] = v10;
    xpc_retain(v10);
    v11 = xpc_dictionary_get_value(v6, SYSMON_XPC_REPLY_KEY_TABLE);
    count = xpc_array_get_count(v11);
    v8[4] = count;
    v13 = malloc_type_malloc(8 * count, 0x2004093837F09uLL);
    v14 = MEMORY[0x24BDAC760];
    v8[5] = v13;
    applier[0] = v14;
    applier[1] = 0x40000000;
    applier[2] = ___sysmon_build_table_from_dict_block_invoke;
    applier[3] = &__block_descriptor_tmp_17;
    applier[4] = v8;
    xpc_array_apply(v11, applier);
    _sysmon_request_invoke_client_handler(*(_QWORD *)(a1 + 32), (uint64_t)v8);
    _os_object_release();
    xpc_release(v6);
  }
  else
  {
    if (a2 != (void *)MEMORY[0x24BDACF30] && v4 == MEMORY[0x24BDACFB8])
      xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x24BDACF40]);
    _sysmon_request_invoke_client_handler(*(_QWORD *)(a1 + 32), 0);
  }
}

void _sysmon_request_invoke_client_handler(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _xpc_connection_s *v7;

  if (*(_BYTE *)(a1 + 64))
    _sysmon_request_invoke_client_handler_cold_1();
  v4 = *(_QWORD *)(a1 + 24);
  if (v4)
  {
    v5 = a2;
    if (!a2)
    {
      v5 = sysmon_table_alloc();
      *(_QWORD *)(v5 + 16) = xpc_date_create_from_current();
      *(_QWORD *)(v5 + 24) = xpc_data_create(0, 0);
      v4 = *(_QWORD *)(a1 + 24);
    }
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, v5);
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 32);
    v5 = a2;
    if (v6)
    {
      (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, a2);
      v5 = a2;
    }
  }
  *(_BYTE *)(a1 + 65) = 1;
  if (!a2 || !*(_QWORD *)(a1 + 104))
  {
    v7 = *(_xpc_connection_s **)(a1 + 40);
    if (v7)
      xpc_connection_cancel(v7);
    if (!a2)
    {
      if (v5)
        _os_object_release();
    }
  }
}

void __sysmon_request_execute_block_invoke_11(uint64_t a1)
{
  _sysmon_send_message_and_schedule_repeat(*(_QWORD *)(a1 + 32));
}

void _sysmon_send_message_and_schedule_repeat(uint64_t a1)
{
  uint64_t v2;
  dispatch_time_t v3;
  NSObject *v4;
  _QWORD block[5];

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
  if (!*(_BYTE *)(a1 + 64))
  {
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 48));
    v2 = *(_QWORD *)(a1 + 104);
    if (v2)
    {
      v3 = dispatch_time(0, 1000000 * v2);
      _os_object_retain_internal();
      v4 = *(NSObject **)(a1 + 16);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 0x40000000;
      block[2] = ___sysmon_send_message_and_schedule_repeat_block_invoke;
      block[3] = &__block_descriptor_tmp_18;
      block[4] = a1;
      dispatch_after(v3, v4, block);
    }
  }
}

void sysmon_request_cancel(uint64_t a1)
{
  _xpc_connection_s *v1;

  v1 = *(_xpc_connection_s **)(a1 + 40);
  if (v1)
    xpc_connection_cancel(v1);
}

uint64_t ___sysmon_build_table_from_dict_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6;

  v6 = sysmon_row_alloc();
  *(_QWORD *)(v6 + 16) = xpc_retain(*(xpc_object_t *)(*(_QWORD *)(a1 + 32) + 24));
  *(_QWORD *)(v6 + 24) = xpc_retain(a3);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 8 * a2) = v6;
  return 1;
}

uint64_t ___sysmon_send_message_and_schedule_repeat_block_invoke(uint64_t a1)
{
  _sysmon_send_message_and_schedule_repeat(*(_QWORD *)(a1 + 32));
  return _os_object_release_internal();
}

uint64_t sysmon_table_get_count(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

uint64_t sysmon_table_get_timestamp(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16);
}

uint64_t sysmon_table_get_row(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * a2);
}

uint64_t sysmon_table_copy_row(uint64_t a1, uint64_t a2)
{
  return sysmon_retain(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * a2));
}

uint64_t sysmon_table_apply(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;

  if (*(_QWORD *)(result + 32))
  {
    v3 = result;
    v4 = 0;
    do
      result = (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)(*(_QWORD *)(v3 + 40) + 8 * v4++));
    while (v4 < *(_QWORD *)(v3 + 32));
  }
  return result;
}

xpc_object_t sysmon_row_get_value(uint64_t a1, unsigned int a2)
{
  void *v3;
  size_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v3 = *(void **)(a1 + 16);
  v7 = 0;
  v8 = &v7;
  v9 = 0x2000000000;
  v10 = -1;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 0x40000000;
  v6[2] = ___bitarray_index_of_bit_block_invoke;
  v6[3] = &unk_24D44E628;
  v6[4] = &v7;
  v6[5] = a2;
  _bitarray_apply(v3, (uint64_t)v6);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  if ((v4 & 0x8000000000000000) != 0)
    return 0;
  else
    return xpc_array_get_value(*(xpc_object_t *)(a1 + 24), v4);
}

size_t sysmon_row_apply(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD v4[6];

  v2 = *(void **)(a1 + 16);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 0x40000000;
  v4[2] = __sysmon_row_apply_block_invoke;
  v4[3] = &unk_24D44E600;
  v4[4] = a2;
  v4[5] = a1;
  return _bitarray_apply(v2, (uint64_t)v4);
}

size_t _bitarray_apply(void *a1, uint64_t a2)
{
  _BYTE *bytes_ptr;
  size_t result;
  size_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;

  bytes_ptr = xpc_data_get_bytes_ptr(a1);
  result = xpc_data_get_length(a1);
  if (result)
  {
    v6 = result;
    v7 = 0;
    v8 = 0;
    do
    {
      v9 = bytes_ptr[v7];
      if (bytes_ptr[v7])
      {
        do
        {
          v9 &= ~(1 << __clz(__rbit32(v9)));
          v10 = v8 + 1;
          result = (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
          v8 = v10;
        }
        while ((_BYTE)v9);
      }
      else
      {
        v10 = v8;
      }
      ++v7;
      v8 = v10;
    }
    while (v7 != v6);
  }
  return result;
}

uint64_t __sysmon_row_apply_block_invoke(uint64_t a1, size_t a2, uint64_t a3)
{
  uint64_t v4;
  xpc_object_t value;

  v4 = *(_QWORD *)(a1 + 32);
  value = xpc_array_get_value(*(xpc_object_t *)(*(_QWORD *)(a1 + 40) + 24), a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, xpc_object_t))(v4 + 16))(v4, a3, value);
}

uint64_t ___bitarray_index_of_bit_block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;

  if (*(_QWORD *)(result + 40) == a3)
  {
    v4 = result;
    v5 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
    if (*(_QWORD *)(v5 + 24) != -1)
    {
      result = _os_assumes_log();
      v5 = *(_QWORD *)(*(_QWORD *)(v4 + 32) + 8);
    }
    *(_QWORD *)(v5 + 24) = a2;
  }
  return result;
}

uint64_t sysmon_request_alloc()
{
  objc_opt_class();
  return _os_object_alloc();
}

uint64_t sysmon_table_alloc()
{
  objc_opt_class();
  return _os_object_alloc();
}

uint64_t sysmon_row_alloc()
{
  objc_opt_class();
  return _os_object_alloc();
}

xpc_object_t _sysmon_build_reply_with_diff(void *a1, xpc_object_t object, uint64_t a3)
{
  xpc_object_t value;
  uint64_t v6;
  uint64_t v7;
  int64_t elapsed_ns;
  int64_t v9;
  xpc_object_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  xpc_object_t v14;
  xpc_object_t v16;
  uint64_t v17;
  uint64_t v18;
  int64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, int, xpc_object_t);
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  if (!a1)
    return xpc_retain(object);
  if (a3 != 1)
  {
    if (a3 == 3)
    {
      value = xpc_dictionary_get_value(object, SYSMON_XPC_REPLY_KEY_HEADER);
      v6 = _sysmon_attr_index(value, 10);
      v7 = _sysmon_attr_index(value, 11);
      elapsed_ns = _get_elapsed_ns(object, a1);
      if (elapsed_ns)
      {
        v9 = elapsed_ns;
        if ((v6 & 0x8000000000000000) == 0 || (v7 & 0x8000000000000000) == 0)
        {
          v10 = xpc_copy(object);
          v11 = _sysmon_attr_index(value, 1);
          v12 = _sysmon_attr_index(value, 5);
          v13 = _sysmon_attr_index(value, 12);
          v14 = xpc_dictionary_get_value(v10, SYSMON_XPC_REPLY_KEY_TABLE);
          v25 = MEMORY[0x24BDAC760];
          v26 = 0x40000000;
          v27 = ___sysmon_build_reply_with_diff_coalition_block_invoke;
          v28 = &__block_descriptor_tmp_1;
          v29 = v11;
          v30 = v6;
          v31 = v12;
          v32 = a1;
          v33 = v9;
          v34 = v7;
          v35 = v13;
LABEL_14:
          xpc_array_apply(v14, &v25);
          return v10;
        }
      }
      return xpc_retain(object);
    }
    return xpc_retain(object);
  }
  v16 = xpc_dictionary_get_value(object, SYSMON_XPC_REPLY_KEY_HEADER);
  v17 = _sysmon_attr_index(v16, 51);
  v18 = _sysmon_attr_index(v16, 52);
  v19 = _get_elapsed_ns(object, a1);
  if (v19)
  {
    v20 = v19;
    if ((v17 & 0x8000000000000000) == 0 || (v18 & 0x8000000000000000) == 0)
    {
      v10 = xpc_copy(object);
      v21 = _sysmon_attr_index(v16, 4);
      v22 = _sysmon_attr_index(v16, 23);
      v23 = _sysmon_attr_index(v16, 24);
      v24 = _sysmon_attr_index(v16, 60);
      v14 = xpc_dictionary_get_value(v10, SYSMON_XPC_REPLY_KEY_TABLE);
      v25 = MEMORY[0x24BDAC760];
      v26 = 0x40000000;
      v27 = ___sysmon_build_reply_with_diff_process_block_invoke;
      v28 = &__block_descriptor_tmp_4;
      v29 = v21;
      v30 = v17;
      v31 = v22;
      v32 = a1;
      v33 = v23;
      v34 = v20;
      v35 = v18;
      v36 = v24;
      goto LABEL_14;
    }
  }
  return xpc_retain(object);
}

uint64_t _sysmon_attr_index(void *a1, int a2)
{
  _BYTE *bytes_ptr;
  size_t length;
  size_t v5;
  uint64_t i;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  _QWORD v11[2];
  uint64_t (*v12)(uint64_t, int);
  void *v13;
  _QWORD *v14;
  uint64_t *v15;
  int v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];

  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2000000000;
  v21[3] = -1;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2000000000;
  v20 = -1;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 0x40000000;
  v12 = ___sysmon_attr_index_block_invoke;
  v13 = &unk_24D44E670;
  v16 = a2;
  v14 = v21;
  v15 = &v17;
  bytes_ptr = xpc_data_get_bytes_ptr(a1);
  length = xpc_data_get_length(a1);
  if (length)
  {
    v5 = length;
    for (i = 0; i != v5; ++i)
    {
      v7 = bytes_ptr[i];
      if (bytes_ptr[i])
      {
        do
        {
          v8 = __clz(__rbit32(v7));
          v7 &= ~(1 << v8);
          v12((uint64_t)v11, (8 * i) | v8);
        }
        while ((_BYTE)v7);
      }
    }
  }
  v9 = v18[3];
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(v21, 8);
  return v9;
}

int64_t _get_elapsed_ns(void *a1, void *a2)
{
  xpc_object_t value;
  xpc_object_t v4;
  int64_t v5;

  value = xpc_dictionary_get_value(a1, SYSMON_XPC_REPLY_KEY_TIMESTAMP);
  v4 = xpc_dictionary_get_value(a2, SYSMON_XPC_REPLY_KEY_TIMESTAMP);
  v5 = xpc_date_get_value(value);
  return v5 - xpc_date_get_value(v4);
}

uint64_t ___sysmon_build_reply_with_diff_coalition_block_invoke(uint64_t a1, int a2, xpc_object_t xarray)
{
  uint64_t uint64;
  uint64_t v6;
  void *value_for_row;
  uint64_t value;
  double v9;
  void *v10;
  double v11;

  uint64 = xpc_array_get_uint64(xarray, *(_QWORD *)(a1 + 32));
  if ((*(_QWORD *)(a1 + 40) & 0x8000000000000000) == 0)
  {
    v6 = xpc_array_get_uint64(xarray, *(_QWORD *)(a1 + 48));
    value_for_row = (void *)_reply_get_value_for_row(*(void **)(a1 + 56), 1, uint64, 5);
    if (value_for_row)
    {
      value = xpc_uint64_get_value(value_for_row);
      if (v6)
      {
        if (value)
          xpc_array_set_double(xarray, *(_QWORD *)(a1 + 40), (double)(v6 - value) * 100.0 / (double)*(unint64_t *)(a1 + 64));
      }
    }
  }
  if ((*(_QWORD *)(a1 + 72) & 0x8000000000000000) == 0)
  {
    v9 = xpc_array_get_double(xarray, *(_QWORD *)(a1 + 80));
    v10 = (void *)_reply_get_value_for_row(*(void **)(a1 + 56), 1, uint64, 12);
    if (v10)
      v11 = xpc_double_get_value(v10);
    else
      v11 = 0.0;
    xpc_array_set_double(xarray, *(_QWORD *)(a1 + 72), (v9 - v11) * 100.0 / (double)(*(_QWORD *)(a1 + 64) / 0x3B9ACA00uLL));
  }
  return 1;
}

uint64_t _reply_get_value_for_row(void *a1, int a2, uint64_t a3, int a4)
{
  xpc_object_t value;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  xpc_object_t v14;
  _QWORD v16[8];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2000000000;
  v20 = 0;
  value = xpc_dictionary_get_value(a1, SYSMON_XPC_REPLY_KEY_HEADER);
  v9 = _sysmon_attr_index(value, a2);
  v10 = _sysmon_attr_index(value, a4);
  v11 = 0;
  if (v9 != -1 && v10 != -1)
  {
    v13 = v10;
    v14 = xpc_dictionary_get_value(a1, SYSMON_XPC_REPLY_KEY_TABLE);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 0x40000000;
    v16[2] = ___reply_get_value_for_row_block_invoke;
    v16[3] = &unk_24D44E698;
    v16[4] = &v17;
    v16[5] = v9;
    v16[6] = a3;
    v16[7] = v13;
    xpc_array_apply(v14, v16);
    v11 = v18[3];
  }
  _Block_object_dispose(&v17, 8);
  return v11;
}

uint64_t ___sysmon_attr_index_block_invoke(uint64_t result, int a2)
{
  uint64_t v2;

  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  if (*(_DWORD *)(result + 48) == a2)
  {
    v2 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
    if (*(_QWORD *)(v2 + 24) != -1)
      sysmon_request_execute_cold_1();
    *(_QWORD *)(v2 + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  }
  return result;
}

BOOL ___reply_get_value_for_row_block_invoke(_QWORD *a1, int a2, xpc_object_t xarray)
{
  uint64_t uint64;
  uint64_t v6;

  uint64 = xpc_array_get_uint64(xarray, a1[5]);
  v6 = a1[6];
  if (uint64 == v6)
    *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = xpc_array_get_value(xarray, a1[7]);
  return uint64 != v6;
}

uint64_t ___sysmon_build_reply_with_diff_process_block_invoke(uint64_t a1, int a2, xpc_object_t xarray)
{
  uint64_t uint64;
  uint64_t v6;
  void *value_for_row;
  uint64_t value;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  uint64 = (int)xpc_array_get_uint64(xarray, *(_QWORD *)(a1 + 32));
  if ((*(_QWORD *)(a1 + 40) & 0x8000000000000000) == 0)
  {
    v6 = xpc_array_get_uint64(xarray, *(_QWORD *)(a1 + 48));
    value_for_row = (void *)_reply_get_value_for_row(*(void **)(a1 + 56), 4, uint64, 23);
    if (value_for_row)
      value = xpc_uint64_get_value(value_for_row);
    else
      value = 0;
    v9 = xpc_array_get_uint64(xarray, *(_QWORD *)(a1 + 64));
    v10 = _reply_get_value_for_row(*(void **)(a1 + 56), 4, uint64, 24);
    if (v10)
      v10 = xpc_uint64_get_value((xpc_object_t)v10);
    if (value | v10)
      xpc_array_set_double(xarray, *(_QWORD *)(a1 + 40), (double)(v6 + v9 - (value + v10)) * 100.0 / (double)*(unint64_t *)(a1 + 72));
  }
  if ((*(_QWORD *)(a1 + 80) & 0x8000000000000000) == 0)
  {
    v11 = xpc_array_get_uint64(xarray, *(_QWORD *)(a1 + 88));
    v12 = (void *)_reply_get_value_for_row(*(void **)(a1 + 56), 4, uint64, 60);
    if (v12)
    {
      v13 = xpc_uint64_get_value(v12);
      if (v11)
      {
        if (v13)
          xpc_array_set_double(xarray, *(_QWORD *)(a1 + 80), (double)(v11 - v13) / (double)*(unint64_t *)(a1 + 72));
      }
    }
  }
  return 1;
}

void sysmon_request_execute_cold_1()
{
  _os_assert_log();
  _os_crash();
  __break(1u);
}

void __sysmon_request_execute_block_invoke_cold_1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_fault_impl(&dword_215BBA000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "Error: libsysmon got XPC_ERROR_CONNECTION_INVALID with self->_done as true", v0, 2u);
}

void _sysmon_request_invoke_client_handler_cold_1()
{
  const void *v0;

  v0 = (const void *)_os_crash();
  __break(1u);
  _Block_copy(v0);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _os_assert_log()
{
  return MEMORY[0x24BDACB40]();
}

uint64_t _os_assumes_log()
{
  return MEMORY[0x24BDACB48]();
}

uint64_t _os_crash()
{
  return MEMORY[0x24BDACB50]();
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _os_object_alloc()
{
  return MEMORY[0x24BDACBD0]();
}

uint64_t _os_object_release()
{
  return MEMORY[0x24BDACBE0]();
}

uint64_t _os_object_release_internal()
{
  return MEMORY[0x24BDACBE8]();
}

uint64_t _os_object_retain()
{
  return MEMORY[0x24BDACBF0]();
}

uint64_t _os_object_retain_internal()
{
  return MEMORY[0x24BDACBF8]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x24BDB0638](xarray, applier);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x24BDB0660](xarray);
}

double xpc_array_get_double(xpc_object_t xarray, size_t index)
{
  double result;

  MEMORY[0x24BDB0678](xarray, index);
  return result;
}

uint64_t xpc_array_get_uint64(xpc_object_t xarray, size_t index)
{
  return MEMORY[0x24BDB0690](xarray, index);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x24BDB06A0](xarray, index);
}

void xpc_array_set_double(xpc_object_t xarray, size_t index, double value)
{
  MEMORY[0x24BDB06B0](xarray, index, value);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x24BDB0718](connection);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x24BDB0740](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x24BDB0798](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x24BDB07A8](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x24BDB07C8](connection, handler);
}

xpc_object_t xpc_copy(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x24BDB0800](object);
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x24BDB0868](bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x24BDB0880](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x24BDB0888](xdata);
}

xpc_object_t xpc_date_create_from_current(void)
{
  return (xpc_object_t)MEMORY[0x24BDB0898]();
}

int64_t xpc_date_get_value(xpc_object_t xdate)
{
  return MEMORY[0x24BDB08A0](xdate);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x24BDB0988](xdict, key, bytes, length);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x24BDB09D0](xdict, key, value);
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  double result;

  MEMORY[0x24BDB09F0](xdouble);
  return result;
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x24BDB0AE0](object);
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x24BDB0AE8](object);
}

