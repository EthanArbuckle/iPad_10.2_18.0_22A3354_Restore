uint64_t _tb_afk_common_transport_construct_message_buffer(size_t a1, uint64_t a2, uint64_t a3)
{
  char *v5;

  v5 = (char *)malloc_type_calloc(a1, 1uLL, 0x100004077774924uLL);
  if (v5 > &v5[a1])
  {
    __break(0x5519u);
LABEL_5:
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  }
  if (!v5)
    goto LABEL_5;
  *(_QWORD *)a3 = v5;
  *(_QWORD *)(a3 + 16) = 0;
  *(_QWORD *)(a3 + 24) = a1;
  *(_QWORD *)(a3 + 32) = 0;
  *(_QWORD *)(a3 + 48) = 0;
  *(_BYTE *)(a3 + 41) = 0;
  return 0;
}

uint64_t _tb_afk_common_transport_message_buffer_reset(uint64_t a1, uint64_t a2, size_t a3)
{
  uint64_t v5;

  free(*(void **)a1);
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  return _tb_afk_common_transport_construct_message_buffer(a3, v5, a1);
}

void _tb_afk_common_transport_destruct_message_buffer(uint64_t a1)
{
  free(*(void **)a1);
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_BYTE *)(a1 + 41) = 1;
}

_QWORD *tb_afk_transport_create(uint64_t a1)
{
  uint64_t value;
  _QWORD *v2;
  _QWORD *v3;
  dispatch_queue_t *v4;
  dispatch_queue_t *v5;
  dispatch_queue_t v6;
  dispatch_queue_t v7;
  uint64_t v8;
  dispatch_queue_t v9;
  dispatch_queue_t v10;
  uint64_t v11;
  dispatch_queue_t v12;
  dispatch_queue_t v13;
  _QWORD v15[5];
  _QWORD v16[5];

  value = tb_endpoint_get_value(a1);
  if (!objc_opt_class())
    return 0;
  v2 = malloc_type_calloc(1uLL, 0xE8uLL, 0x1082040EFE8DF71uLL);
  if (!v2)
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  v3 = v2;
  v4 = (dispatch_queue_t *)malloc_type_calloc(1uLL, 0x10uLL, 0x80040803F642BuLL);
  if (!v4)
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  v5 = v4;
  v3[12] = v4;
  v3[4] = _tb_afk_common_transport_destruct_message_buffer;
  v3[5] = _tb_afk_common_transport_message_buffer_reset;
  *v3 = _tb_afk_user_transport_send_message;
  v3[1] = _tb_afk_user_transport_activate;
  v3[2] = _tb_afk_user_transport_activate;
  v3[3] = _tb_afk_common_transport_construct_message_buffer;
  v6 = dispatch_queue_create("com.apple.tightbeam.afk_transport.q", 0);
  v7 = *v5;
  *v5 = v6;

  objc_msgSend(MEMORY[0x24BDFCA58], "withService:", value);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v5[1];
  v5[1] = (dispatch_queue_t)v8;

  v10 = v5[1];
  if (!v10)
    tb_afk_transport_create_cold_3();
  -[NSObject setDispatchQueue:](v10, "setDispatchQueue:", *v5);
  v11 = MEMORY[0x24BDAC760];
  v12 = v5[1];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __tb_afk_transport_create_block_invoke;
  v16[3] = &__block_descriptor_40_e50_i60__0__AFKEndpointInterface_8_v16I24Q28_v36Q44Q52l;
  v16[4] = v3;
  -[NSObject setCommandHandlerWithReturn:](v12, "setCommandHandlerWithReturn:", v16);
  v13 = v5[1];
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __tb_afk_transport_create_block_invoke_2;
  v15[3] = &__block_descriptor_40_e44_v44__0__AFKEndpointInterface_8I16Q20r_v28Q36l;
  v15[4] = v3;
  -[NSObject setReportHandler:](v13, "setReportHandler:", v15);
  return v3;
}

uint64_t _tb_afk_user_transport_send_message(uint64_t a1, _DWORD *a2, _QWORD *a3, char a4)
{
  uint64_t v7;
  _QWORD *transport_buffer;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v14;
  size_t __n;
  uint64_t v16;

  if (*a2 != 3)
    _tb_afk_user_transport_send_message_cold_3();
  v7 = *(_QWORD *)(a1 + 96);
  transport_buffer = (_QWORD *)tb_message_get_transport_buffer((uint64_t)a2);
  if ((a4 & 2) == 0)
  {
    v9 = objc_msgSend(*(id *)(v7 + 8), "enqueueReport:timestamp:inputBuffer:inputBufferSize:options:", 192, mach_continuous_time(), *transport_buffer, transport_buffer[3], 0);
    goto LABEL_10;
  }
  __n = 0x2000;
  v16 = 0;
  v10 = malloc_type_calloc(0x2000uLL, 1uLL, 0x100004077774924uLL);
  if (!v10)
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  v11 = v10;
  LODWORD(v14) = 0;
  v9 = objc_msgSend(*(id *)(v7 + 8), "enqueueCommandSync:timestamp:inputBuffer:inputBufferSize:responseTimestamp:outputBuffer:inOutBufferSize:options:", 192, mach_continuous_time(), *transport_buffer, transport_buffer[3], &v16, v10, &__n, v14);
  if (!v9)
  {
    tb_message_configure_recieved((uint64_t)a2, 2);
    v12 = tb_message_get_transport_buffer((uint64_t)a2);
    if (_tb_afk_common_transport_message_buffer_reset(v12, 0, __n))
    {
      __break(1u);
    }
    else
    {
      memcpy(*(void **)v12, v11, __n);
      *(_QWORD *)(v12 + 16) = 0;
      if (a3)
      {
        *a3 = a2;
        goto LABEL_9;
      }
    }
    _tb_afk_user_transport_send_message_cold_2();
  }
LABEL_9:
  free(v11);
LABEL_10:
  if (v9)
    return 5;
  else
    return 0;
}

uint64_t _tb_afk_user_transport_activate(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 96) + 8), "activate:", 0);
  return 0;
}

uint64_t __tb_afk_transport_create_block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, const void *a6, size_t a7)
{
  id v11;
  void *v12;
  void *v13;
  void **v14;
  void **v15;
  int v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;

  v11 = a2;
  v12 = malloc_type_calloc(1uLL, 0x58uLL, 0x102004071D150F8uLL);
  if (!v12)
LABEL_15:
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  v13 = v12;
  v14 = (void **)malloc_type_calloc(1uLL, 0x68uLL, 0x1090040B6685729uLL);
  if (!v14)
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  v15 = v14;
  if (_tb_afk_common_transport_construct_message_buffer(a7, 0, (uint64_t)v14)
    || tb_message_construct((uint64_t)v13, (uint64_t)v15, 1))
  {
    __break(1u);
    goto LABEL_15;
  }
  tb_message_configure_recieved((uint64_t)v13, 1);
  memcpy(*v15, a6, a7);
  v26 = 0;
  v16 = tb_transport_call_message_handler(*(_QWORD **)(a1 + 32), (uint64_t)v13, &v26);
  if (v16 || !v26)
  {
    if (v16)
      v24 = v16 | 0xE0C04000;
    else
      v24 = 3758097095;
    v17 = mach_continuous_time();
    v21 = v11;
    v22 = a3;
    v23 = v24;
    v19 = 0;
    v20 = 0;
  }
  else
  {
    if (*(_DWORD *)v26 != 2)
      __tb_afk_transport_create_block_invoke_cold_3();
    v17 = mach_continuous_time();
    v18 = *(uint64_t **)(v26 + 80);
    v19 = *v18;
    v20 = v18[3];
    v21 = v11;
    v22 = a3;
    v23 = 0;
  }
  objc_msgSend(v21, "enqueueResponseForContext:status:timestamp:outputBuffer:outputBufferSize:options:", v22, v23, v17, v19, v20, 0);
  _tb_afk_common_transport_destruct_message_buffer((uint64_t)v15);
  tb_message_destruct((uint64_t)v13);
  free(v15);
  free(v13);

  return 0;
}

void __tb_afk_transport_create_block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, const void *a5, size_t a6)
{
  id v9;
  void *v10;
  void *v11;
  void **v12;
  void **v13;
  uint64_t v14;

  v9 = a2;
  v10 = malloc_type_calloc(1uLL, 0x58uLL, 0x102004071D150F8uLL);
  if (!v10)
LABEL_9:
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  v11 = v10;
  v12 = (void **)malloc_type_calloc(1uLL, 0x68uLL, 0x1090040B6685729uLL);
  if (!v12)
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  v13 = v12;
  if (_tb_afk_common_transport_construct_message_buffer(a6, 0, (uint64_t)v12)
    || tb_message_construct((uint64_t)v11, (uint64_t)v13, 1)
    || (tb_message_configure_recieved((uint64_t)v11, 1),
        memcpy(*v13, a5, a6),
        v14 = 0,
        tb_transport_call_message_handler(*(_QWORD **)(a1 + 32), (uint64_t)v11, &v14))
    || v14)
  {
    __break(1u);
    goto LABEL_9;
  }
  _tb_afk_common_transport_destruct_message_buffer((uint64_t)v13);
  tb_message_destruct((uint64_t)v11);
  free(v13);
  free(v11);

}

uint64_t _tb_null_transport_send_message(uint64_t a1, uint64_t a2, uint64_t *a3, int a4)
{
  uint64_t transport_buffer;
  size_t v9;
  const void *v10;
  char *v11;
  char *v12;
  void **v13;
  void **v14;
  _DWORD *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  size_t v20;
  uint64_t v21;
  size_t v22;
  uint64_t result;

  transport_buffer = tb_message_get_transport_buffer(a2);
  v9 = *(_QWORD *)(transport_buffer + 24);
  v10 = *(const void **)transport_buffer;
  v11 = (char *)malloc_type_calloc(v9, 1uLL, 0x100004077774924uLL);
  if (v11 > &v11[v9])
    goto LABEL_15;
  v12 = v11;
  if (!v11)
    goto LABEL_16;
  memcpy(v11, v10, v9);
  v13 = (void **)malloc_type_calloc(1uLL, 0x68uLL, 0x1090040B6685729uLL);
  if (!v13)
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  v14 = v13;
  *v13 = v12;
  v13[2] = 0;
  v13[3] = (void *)v9;
  v13[4] = 0;
  v13[6] = 0;
  *((_WORD *)v13 + 21) = *(_WORD *)(transport_buffer + 42);
  v15 = malloc_type_calloc(1uLL, 0x58uLL, 0x102004071D150F8uLL);
  if (!v15)
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  v16 = v15;
  *v15 = 4;
  *((_BYTE *)v15 + 4) = 1;
  *((_QWORD *)v15 + 10) = v14;
  *((_QWORD *)v15 + 3) = a1;
  tb_message_configure_recieved((uint64_t)v15, 1);
  v17 = *(_QWORD *)(a1 + 72);
  v18 = (uint64_t)v16;
  if (v17)
  {
    v18 = (*(uint64_t (**)(uint64_t, void *))(v17 + 16))(v17, v16);
    if (!v18)
    {
      free(*v14);
      free(v14);
      free(v16);
      return (2 * a4) & 4;
    }
  }
  v19 = tb_message_get_transport_buffer(v18);
  v20 = *(_QWORD *)(v19 + 24);
  free(*(void **)transport_buffer);
  *(_QWORD *)transport_buffer = 0;
  *(_QWORD *)(transport_buffer + 16) = 0;
  *(_QWORD *)(transport_buffer + 24) = 0;
  if (_tb_null_transport_construct_message_buffer(v20, v21, transport_buffer))
    _tb_null_transport_send_message_cold_4();
  v22 = *(_QWORD *)(v19 + 24);
  if (v22 > *(_QWORD *)(transport_buffer + 24))
  {
LABEL_15:
    __break(0x5519u);
LABEL_16:
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  }
  memcpy(*(void **)transport_buffer, *(const void **)v19, v22);
  *(_WORD *)(transport_buffer + 42) = *(_WORD *)(v19 + 42);
  *(_QWORD *)(a2 + 24) = *(_QWORD *)(v18 + 24);
  tb_message_configure_recieved(a2, 2);
  if (v14 != (void **)v19)
  {
    free(*(void **)v19);
    free((void *)v19);
  }
  free(*v14);
  free(v14);
  free(v16);
  result = 0;
  if (a3)
    *a3 = a2;
  return result;
}

uint64_t _tb_null_client_transport_activate()
{
  return 0;
}

uint64_t _tb_null_service_transport_activate()
{
  return 0;
}

uint64_t _tb_null_transport_construct_message_buffer(size_t a1, uint64_t a2, uint64_t a3)
{
  char *v5;

  v5 = (char *)malloc_type_calloc(a1, 1uLL, 0x100004077774924uLL);
  if (v5 > &v5[a1])
  {
    __break(0x5519u);
LABEL_5:
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  }
  if (!v5)
    goto LABEL_5;
  *(_QWORD *)a3 = v5;
  *(_BYTE *)(a3 + 8) = 0;
  *(_QWORD *)(a3 + 16) = 0;
  *(_QWORD *)(a3 + 24) = a1;
  *(_QWORD *)(a3 + 32) = 0;
  *(_QWORD *)(a3 + 48) = 0;
  *(_BYTE *)(a3 + 41) = 0;
  return 0;
}

void _tb_null_transport_destruct_message_buffer(uint64_t a1)
{
  free(*(void **)a1);
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_BYTE *)(a1 + 41) = 1;
}

uint64_t _tb_null_transport_message_buffer_reset(uint64_t a1, uint64_t a2, size_t a3)
{
  uint64_t v5;

  free(*(void **)a1);
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  return _tb_null_transport_construct_message_buffer(a3, v5, a1);
}

uint64_t _tb_null_transport_supports_multipart_messages()
{
  return 1;
}

uint64_t _tb_null_transport_get_tx_buffer_size()
{
  return tb_null_transport_max_send_size;
}

__n128 tb_null_transport_create_inplace_with_endpoint(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 64) = 0u;
  *(_OWORD *)(a2 + 80) = 0u;
  *(_OWORD *)(a2 + 96) = 0u;
  *(_OWORD *)(a2 + 112) = 0u;
  *(_QWORD *)(a2 + 224) = 0;
  *(_OWORD *)(a2 + 192) = 0u;
  *(_OWORD *)(a2 + 208) = 0u;
  *(_OWORD *)(a2 + 160) = 0u;
  *(_OWORD *)(a2 + 176) = 0u;
  *(_OWORD *)(a2 + 128) = 0u;
  *(_OWORD *)(a2 + 144) = 0u;
  *(_OWORD *)a2 = _tb_null_transport_vtable;
  v3 = xmmword_254461970;
  result = *(__n128 *)&off_254461980;
  v4 = xmmword_254461960;
  *(_QWORD *)(a2 + 64) = off_254461990;
  *(_OWORD *)(a2 + 32) = v3;
  *(__n128 *)(a2 + 48) = result;
  *(_OWORD *)(a2 + 16) = v4;
  *(_QWORD *)(a2 + 96) = 0;
  return result;
}

__n128 tb_null_transport_create()
{
  _OWORD *v0;
  __int128 v1;
  __n128 result;

  v0 = malloc_type_calloc(1uLL, 0xE8uLL, 0x1082040EFE8DF71uLL);
  if (!v0)
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  *(_OWORD *)((char *)v0 + 216) = 0u;
  *(_OWORD *)((char *)v0 + 200) = 0u;
  *(_OWORD *)((char *)v0 + 184) = 0u;
  *(_OWORD *)((char *)v0 + 168) = 0u;
  *(_OWORD *)((char *)v0 + 152) = 0u;
  *(_OWORD *)((char *)v0 + 136) = 0u;
  *(_OWORD *)((char *)v0 + 120) = 0u;
  *(_OWORD *)((char *)v0 + 104) = 0u;
  *(_OWORD *)((char *)v0 + 88) = 0u;
  *(_OWORD *)((char *)v0 + 72) = 0u;
  v1 = *(_OWORD *)&off_254461980;
  v0[2] = xmmword_254461970;
  v0[3] = v1;
  *((_QWORD *)v0 + 8) = off_254461990;
  result = (__n128)xmmword_254461960;
  *v0 = _tb_null_transport_vtable;
  v0[1] = result;
  return result;
}

uint64_t tb_conclave_start()
{
  uint64_t v0;
  _QWORD block[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  int v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2000000000;
  v6 = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __tb_conclave_start_block_invoke;
  block[3] = &unk_2519B2A58;
  block[4] = &v3;
  if (tb_conclave_start_onceToken[0] != -1)
    dispatch_once(tb_conclave_start_onceToken, block);
  v0 = *((unsigned int *)v4 + 6);
  _Block_object_dispose(&v3, 8);
  return v0;
}

uint64_t __tb_conclave_start_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = exclaves_launch_conclave();
  if ((_DWORD)result)
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 3;
  return result;
}

uint64_t tb_conclave_identifier_for_service(uint64_t a1, _QWORD *a2)
{
  uint64_t result;

  result = tb_conclave_start();
  if (!(_DWORD)result)
  {
    result = exclaves_lookup_service();
    if ((_DWORD)result)
      return 10;
    else
      *a2 = 0;
  }
  return result;
}

uint64_t tb_conclave_endpoint_for_service(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v7;

  v7 = 0;
  v3 = tb_conclave_identifier_for_service(a1, &v7);
  if (!(_DWORD)v3)
  {
    v4 = malloc_type_calloc(1uLL, 0x10uLL, 0x1000040451B5BE8uLL);
    if (!v4)
      _tb_afk_common_transport_construct_message_buffer_cold_1();
    v5 = v7;
    *v4 = 0;
    v4[1] = v5;
    *a2 = tb_endpoint_create_with_data(8, (uint64_t)v4, 0, &__block_literal_global);
  }
  return v3;
}

void __tb_conclave_endpoint_for_service_block_invoke(int a1, void *a2)
{
  free(a2);
}

_QWORD *tb_eve_client_transport_create(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;

  v2 = malloc_type_calloc(1uLL, 0xE8uLL, 0x108004074646765uLL);
  if (!v2)
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  v3 = v2;
  v2[12] = _tb_eve_transport_create(a1);
  v3[3] = _tb_eve_transport_construct_message_buffer;
  v3[4] = _tb_eve_transport_destruct_message_buffer;
  v3[5] = _tb_eve_transport_message_buffer_reset;
  *v3 = _tb_eve_transport_send_message;
  v3[1] = _tb_eve_transport_activate;
  v3[8] = _tb_eve_transport_destruct;
  return v3;
}

char *tb_owned_buffer_allocate(size_t a1)
{
  char *result;

  result = (char *)malloc_type_calloc(a1, 1uLL, 0x100004077774924uLL);
  if (result > &result[a1])
    goto LABEL_4;
  if (!result)
    goto LABEL_5;
  if (!a1)
  {
LABEL_4:
    __break(0x5519u);
LABEL_5:
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  }
  return result;
}

double tb_message_initialize(uint64_t a1)
{
  double result;

  *(_DWORD *)a1 = 0;
  *(_BYTE *)(a1 + 4) = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = -1;
  result = 0.0;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_QWORD *)(a1 + 72) = 0;
  *(_QWORD *)(a1 + 80) = 0;
  return result;
}

_DWORD *tb_message_set_state(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

uint64_t tb_message_set_disposition(uint64_t result, char a2)
{
  *(_BYTE *)(result + 4) = a2;
  return result;
}

uint64_t tb_message_construct(uint64_t a1, uint64_t a2, char a3)
{
  if (*(_DWORD *)a1)
    tb_message_construct_cold_1();
  *(_DWORD *)a1 = 1;
  *(_BYTE *)(a1 + 4) = a3;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 32) = -1;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_QWORD *)(a1 + 72) = 0;
  *(_QWORD *)(a1 + 80) = a2;
  return 0;
}

uint64_t tb_message_clear_connection_identifier(uint64_t result)
{
  *(_QWORD *)(result + 8) = 0;
  return result;
}

uint64_t tb_message_set_transport_buffer(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 80) = a2;
  return result;
}

uint64_t tb_message_complete(uint64_t result)
{
  int v1;

  v1 = *(unsigned __int8 *)(result + 4);
  if (v1 == 1)
    goto LABEL_5;
  if (v1 != 2)
  {
    if (!*(_BYTE *)(result + 4))
    {
      do
      {
LABEL_4:
        __break(1u);
LABEL_5:
        ;
      }
      while (*(_DWORD *)result != 1 && *(_DWORD *)result != 4);
    }
LABEL_10:
    *(_DWORD *)result = 2;
    return result;
  }
  if ((*(_DWORD *)result - 3) >= 2)
  {
    if (*(_DWORD *)result != 1)
      goto LABEL_4;
    goto LABEL_10;
  }
  return result;
}

uint64_t tb_message_reset(uint64_t a1, char a2)
{
  *(_DWORD *)a1 = 1;
  *(_BYTE *)(a1 + 4) = a2;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_QWORD *)(a1 + 72) = 0;
  return 0;
}

uint64_t tb_message_destruct(uint64_t result)
{
  *(_BYTE *)(result + 4) = 0;
  *(_QWORD *)(result + 8) = 0;
  *(_QWORD *)(result + 32) = -1;
  *(_QWORD *)(result + 80) = 0;
  *(_DWORD *)result = 5;
  return result;
}

uint64_t tb_message_configure_recieved(uint64_t result, int a2)
{
  if ((a2 - 1) >= 2)
    tb_message_configure_recieved_cold_1();
  *(_DWORD *)result = 4;
  *(_BYTE *)(result + 4) = a2;
  return result;
}

uint64_t tb_message_get_transport_buffer(uint64_t a1)
{
  return *(_QWORD *)(a1 + 80);
}

uint64_t tb_message_get_state(unsigned int *a1)
{
  return *a1;
}

uint64_t tb_message_get_disposition(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 4);
}

uint64_t tb_message_measure_subrange(uint64_t a1, unint64_t *a2, _QWORD *a3, uint64_t a4)
{
  uint64_t result;
  unint64_t v8;
  BOOL v9;

  *a2 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 16);
  result = (*(uint64_t (**)(uint64_t))(a4 + 16))(a4);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 16);
  v9 = v8 >= *a2;
  *a3 = v8 - *a2;
  if (!v9)
    tb_message_measure_subrange_cold_1();
  return result;
}

uint64_t tb_message_subrange(_QWORD *a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  BOOL v11;
  int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  uint64_t *v22;
  unint64_t v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = (unint64_t *)a1[10];
  v5 = v4[3];
  if (v5 < a2)
    tb_message_subrange_cold_1();
  if (__CFADD__(a2, a3))
    tb_message_subrange_cold_2();
  if (a2 + a3 > v5)
    tb_message_subrange_cold_3();
  v26 = 0;
  v25 = 0u;
  v24 = 0u;
  v6 = *v4;
  v7 = *v4 + v5;
  v8 = *v4 + a2;
  v11 = v7 >= v8;
  v9 = v7 - v8;
  v11 = v11 && v6 <= v8 && v9 >= a3;
  if (!v11)
    __break(0x5519u);
  v23 = v8;
  *((_QWORD *)&v24 + 1) = 0;
  v25 = a3;
  LODWORD(v26) = 0;
  v27 = 0uLL;
  v28 = 0uLL;
  v29 = 0uLL;
  v30 = 0;
  v15 = 0;
  v13 = 4;
  v14 = 2;
  v16 = a1[2];
  v17 = 0;
  v18 = a1[4];
  v19 = 0uLL;
  v20 = 0uLL;
  v21 = 0;
  v22 = (uint64_t *)&v23;
  return (*(uint64_t (**)(uint64_t, int *))(a4 + 16))(a4, &v13);
}

uint64_t tb_message_get_client_identifier(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16);
}

uint64_t tb_message_set_client_identifier(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 16) = a2;
  return result;
}

uint64_t tb_message_set_connection_identifier(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 8) = a2;
  return result;
}

BOOL tb_message_check_connection_identifier(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 8) == a2;
}

uint64_t tb_message_get_msg_identifier(uint64_t a1)
{
  return *(_QWORD *)(a1 + 24);
}

uint64_t tb_message_set_msg_identifier(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 24) = a2;
  return result;
}

uint64_t tb_message_get_num_caps(uint64_t a1)
{
  return *(_QWORD *)(a1 + 72);
}

uint64_t tb_message_get_capability(uint64_t result, uint64_t a2)
{
  unint64_t v2;

  v2 = result + 40 + 8 * a2;
  if (v2 < result + 72 && v2 >= result + 40)
    return *(_QWORD *)v2;
  __break(0x5519u);
  return result;
}

uint64_t tb_message_encode_capability(uint64_t result, uint64_t a2)
{
  _QWORD *v2;
  unint64_t v3;
  _QWORD *v4;

  v2 = (_QWORD *)(result + 72);
  v3 = *(_QWORD *)(result + 72);
  if (v3 > 3)
    return 6;
  v4 = (_QWORD *)(result + 40 + 8 * v3);
  if (v4 < v2 && (unint64_t)v4 >= result + 40)
  {
    result = 0;
    *v4 = a2;
    *v2 = v3 + 1;
  }
  else
  {
    __break(0x5519u);
  }
  return result;
}

uint64_t tb_message_decode_capability(uint64_t result, _QWORD *a2)
{
  _QWORD *v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;

  v2 = (_QWORD *)(result + 72);
  v3 = *(_QWORD *)(result + 72);
  if (!v3)
    return 7;
  v4 = result + 40;
  *a2 = *(_QWORD *)(result + 40);
  v5 = v3 - 1;
  if (v5)
  {
    v6 = (_QWORD *)(result + 48);
    v7 = v5;
    while (v6 < v2 && (unint64_t)v6 >= v4 && v6 - 1 < v2)
    {
      *(v6 - 1) = *v6;
      ++v6;
      if (!--v7)
        goto LABEL_8;
    }
  }
  else
  {
LABEL_8:
    v8 = (_QWORD *)(v4 + 8 * v5);
    if (v8 < v2 && (unint64_t)v8 >= v4)
    {
      result = 0;
      *v8 = 0;
      *v2 = v5;
      return result;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t tb_message_size_BOOL()
{
  return 1;
}

uint64_t tb_message_size_u8()
{
  return 1;
}

uint64_t tb_message_size_u16()
{
  return 2;
}

uint64_t tb_message_size_u32()
{
  return 4;
}

uint64_t tb_message_size_u64()
{
  return 8;
}

uint64_t tb_message_size_s8()
{
  return 1;
}

uint64_t tb_message_size_s16()
{
  return 2;
}

uint64_t tb_message_size_s32()
{
  return 4;
}

uint64_t tb_message_size_s64()
{
  return 8;
}

uint64_t tb_message_size_f32()
{
  return 4;
}

uint64_t tb_message_size_f64()
{
  return 8;
}

uint64_t tb_message_size_capability()
{
  return 0;
}

uint64_t tb_message_encode_BOOL(uint64_t result, char a2)
{
  unint64_t *v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  _BYTE *v6;

  if (*(_DWORD *)result != 1)
    tb_message_encode_BOOL_cold_3();
  v2 = *(unint64_t **)(result + 80);
  v3 = v2[2];
  if (v3 == -1)
    tb_message_encode_BOOL_cold_1();
  v4 = v2[3];
  if (v3 + 1 > v4)
    tb_message_encode_BOOL_cold_2();
  v5 = *v2;
  v6 = (_BYTE *)(v5 + v3);
  if (v5 + v4 <= (unint64_t)v6 || v5 > (unint64_t)v6)
  {
    __break(0x5519u);
  }
  else
  {
    *v6 = a2;
    ++*(_QWORD *)(*(_QWORD *)(result + 80) + 16);
  }
  return result;
}

uint64_t tb_message_encode_u8(uint64_t result, char a2)
{
  unint64_t *v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  _BYTE *v6;

  if (*(_DWORD *)result != 1)
    tb_message_encode_BOOL_cold_3();
  v2 = *(unint64_t **)(result + 80);
  v3 = v2[2];
  if (v3 == -1)
    tb_message_encode_u8_cold_1();
  v4 = v2[3];
  if (v3 + 1 > v4)
    tb_message_encode_u8_cold_2();
  v5 = *v2;
  v6 = (_BYTE *)(v5 + v3);
  if (v5 + v4 <= (unint64_t)v6 || v5 > (unint64_t)v6)
  {
    __break(0x5519u);
  }
  else
  {
    *v6 = a2;
    ++*(_QWORD *)(*(_QWORD *)(result + 80) + 16);
  }
  return result;
}

uint64_t tb_message_encode_u16(uint64_t result, __int16 a2)
{
  unint64_t *v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  _WORD *v6;

  if (*(_DWORD *)result != 1)
    tb_message_encode_BOOL_cold_3();
  v2 = *(unint64_t **)(result + 80);
  v3 = v2[2];
  if (v3 >= 0xFFFFFFFFFFFFFFFELL)
    tb_message_encode_u16_cold_1();
  v4 = v2[3];
  if (v3 + 2 > v4)
    tb_message_encode_u16_cold_2();
  v5 = *v2;
  v6 = (_WORD *)(v5 + v3);
  if (v5 + v4 >= (unint64_t)v6 && v5 <= (unint64_t)v6 && v5 + v4 - (unint64_t)v6 > 1)
  {
    *v6 = a2;
    *(_QWORD *)(*(_QWORD *)(result + 80) + 16) += 2;
  }
  else
  {
    __break(0x5519u);
  }
  return result;
}

uint64_t tb_message_encode_u32(uint64_t result, int a2)
{
  unint64_t *v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  _DWORD *v6;

  if (*(_DWORD *)result != 1)
    tb_message_encode_BOOL_cold_3();
  v2 = *(unint64_t **)(result + 80);
  v3 = v2[2];
  if (v3 >= 0xFFFFFFFFFFFFFFFCLL)
    tb_message_encode_u32_cold_1();
  v4 = v2[3];
  if (v3 + 4 > v4)
    tb_message_encode_u32_cold_2();
  v5 = *v2;
  v6 = (_DWORD *)(v5 + v3);
  if (v5 + v4 >= (unint64_t)v6 && v5 <= (unint64_t)v6 && v5 + v4 - (unint64_t)v6 > 3)
  {
    *v6 = a2;
    *(_QWORD *)(*(_QWORD *)(result + 80) + 16) += 4;
  }
  else
  {
    __break(0x5519u);
  }
  return result;
}

uint64_t tb_message_encode_u64(uint64_t result, uint64_t a2)
{
  unint64_t *v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  _QWORD *v6;

  if (*(_DWORD *)result != 1)
    tb_message_encode_BOOL_cold_3();
  v2 = *(unint64_t **)(result + 80);
  v3 = v2[2];
  if (v3 >= 0xFFFFFFFFFFFFFFF8)
    tb_message_encode_u64_cold_1();
  v4 = v2[3];
  if (v3 + 8 > v4)
    tb_message_encode_u64_cold_2();
  v5 = *v2;
  v6 = (_QWORD *)(v5 + v3);
  if (v5 + v4 >= (unint64_t)v6 && v5 <= (unint64_t)v6 && v5 + v4 - (unint64_t)v6 > 7)
  {
    *v6 = a2;
    *(_QWORD *)(*(_QWORD *)(result + 80) + 16) += 8;
  }
  else
  {
    __break(0x5519u);
  }
  return result;
}

uint64_t tb_message_encode_s8(uint64_t result, char a2)
{
  unint64_t *v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  _BYTE *v6;

  if (*(_DWORD *)result != 1)
    tb_message_encode_BOOL_cold_3();
  v2 = *(unint64_t **)(result + 80);
  v3 = v2[2];
  if (v3 == -1)
    tb_message_encode_s8_cold_1();
  v4 = v2[3];
  if (v3 + 1 > v4)
    tb_message_encode_s8_cold_2();
  v5 = *v2;
  v6 = (_BYTE *)(v5 + v3);
  if (v5 + v4 <= (unint64_t)v6 || v5 > (unint64_t)v6)
  {
    __break(0x5519u);
  }
  else
  {
    *v6 = a2;
    ++*(_QWORD *)(*(_QWORD *)(result + 80) + 16);
  }
  return result;
}

uint64_t tb_message_encode_s16(uint64_t result, __int16 a2)
{
  unint64_t *v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  _WORD *v6;

  if (*(_DWORD *)result != 1)
    tb_message_encode_BOOL_cold_3();
  v2 = *(unint64_t **)(result + 80);
  v3 = v2[2];
  if (v3 >= 0xFFFFFFFFFFFFFFFELL)
    tb_message_encode_s16_cold_1();
  v4 = v2[3];
  if (v3 + 2 > v4)
    tb_message_encode_s16_cold_2();
  v5 = *v2;
  v6 = (_WORD *)(v5 + v3);
  if (v5 + v4 >= (unint64_t)v6 && v5 <= (unint64_t)v6 && v5 + v4 - (unint64_t)v6 > 1)
  {
    *v6 = a2;
    *(_QWORD *)(*(_QWORD *)(result + 80) + 16) += 2;
  }
  else
  {
    __break(0x5519u);
  }
  return result;
}

uint64_t tb_message_encode_s32(uint64_t result, int a2)
{
  unint64_t *v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  _DWORD *v6;

  if (*(_DWORD *)result != 1)
    tb_message_encode_BOOL_cold_3();
  v2 = *(unint64_t **)(result + 80);
  v3 = v2[2];
  if (v3 >= 0xFFFFFFFFFFFFFFFCLL)
    tb_message_encode_s32_cold_1();
  v4 = v2[3];
  if (v3 + 4 > v4)
    tb_message_encode_s32_cold_2();
  v5 = *v2;
  v6 = (_DWORD *)(v5 + v3);
  if (v5 + v4 >= (unint64_t)v6 && v5 <= (unint64_t)v6 && v5 + v4 - (unint64_t)v6 > 3)
  {
    *v6 = a2;
    *(_QWORD *)(*(_QWORD *)(result + 80) + 16) += 4;
  }
  else
  {
    __break(0x5519u);
  }
  return result;
}

uint64_t tb_message_encode_s64(uint64_t result, uint64_t a2)
{
  unint64_t *v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  _QWORD *v6;

  if (*(_DWORD *)result != 1)
    tb_message_encode_BOOL_cold_3();
  v2 = *(unint64_t **)(result + 80);
  v3 = v2[2];
  if (v3 >= 0xFFFFFFFFFFFFFFF8)
    tb_message_encode_s64_cold_1();
  v4 = v2[3];
  if (v3 + 8 > v4)
    tb_message_encode_s64_cold_2();
  v5 = *v2;
  v6 = (_QWORD *)(v5 + v3);
  if (v5 + v4 >= (unint64_t)v6 && v5 <= (unint64_t)v6 && v5 + v4 - (unint64_t)v6 > 7)
  {
    *v6 = a2;
    *(_QWORD *)(*(_QWORD *)(result + 80) + 16) += 8;
  }
  else
  {
    __break(0x5519u);
  }
  return result;
}

uint64_t tb_message_encode_f32_v2(uint64_t result, float a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  float *v8;

  v2 = 6;
  if (fabsf(a2) != INFINITY)
  {
    if (*(_DWORD *)result != 1)
      tb_message_encode_BOOL_cold_3();
    v3 = *(unint64_t **)(result + 80);
    v4 = v3[2];
    if (v4 >= 0xFFFFFFFFFFFFFFFCLL)
      tb_message_encode_f32_v2_cold_1();
    v5 = v3[3];
    if (v4 + 4 > v5)
      tb_message_encode_f32_v2_cold_2();
    v6 = *v3;
    v7 = *v3 + v5;
    v8 = (float *)(*v3 + v4);
    if (v7 < (unint64_t)v8 || v6 > (unint64_t)v8 || v7 - (unint64_t)v8 <= 3)
    {
      __break(0x5519u);
      return result;
    }
    v2 = 0;
    *v8 = a2;
    *(_QWORD *)(*(_QWORD *)(result + 80) + 16) += 4;
  }
  return v2;
}

uint64_t tb_message_encode_f64_v2(uint64_t result, double a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  double *v8;

  v2 = 6;
  if (fabs(a2) != INFINITY)
  {
    if (*(_DWORD *)result != 1)
      tb_message_encode_BOOL_cold_3();
    v3 = *(unint64_t **)(result + 80);
    v4 = v3[2];
    if (v4 >= 0xFFFFFFFFFFFFFFF8)
      tb_message_encode_f64_v2_cold_1();
    v5 = v3[3];
    if (v4 + 8 > v5)
      tb_message_encode_f64_v2_cold_2();
    v6 = *v3;
    v7 = *v3 + v5;
    v8 = (double *)(*v3 + v4);
    if (v7 < (unint64_t)v8 || v6 > (unint64_t)v8 || v7 - (unint64_t)v8 <= 7)
    {
      __break(0x5519u);
      return result;
    }
    v2 = 0;
    *v8 = a2;
    *(_QWORD *)(*(_QWORD *)(result + 80) + 16) += 8;
  }
  return v2;
}

uint64_t tb_message_encode_f32(uint64_t a1, float a2)
{
  uint64_t result;

  result = tb_message_encode_f32_v2(a1, a2);
  if ((_DWORD)result)
    tb_message_encode_f32_cold_1(result);
  return result;
}

uint64_t tb_message_encode_f64(uint64_t a1, double a2)
{
  uint64_t result;

  result = tb_message_encode_f64_v2(a1, a2);
  if ((_DWORD)result)
    tb_message_encode_f64_cold_1(result);
  return result;
}

void *tb_message_encode_buffer(uint64_t a1, const void *a2, size_t __n)
{
  _QWORD *v3;
  uint64_t v4;
  size_t v5;
  unint64_t v7;
  void *result;

  v3 = *(_QWORD **)(a1 + 80);
  v4 = v3[2];
  if (__CFADD__(v4, __n))
    tb_message_encode_buffer_cold_1();
  v5 = v3[3];
  if (v4 + __n > v5)
    tb_message_encode_buffer_cold_2();
  v7 = *v3 + v5;
  result = (void *)(*v3 + v4);
  if (v7 >= (unint64_t)result && *v3 <= (unint64_t)result && v7 - (unint64_t)result >= __n)
  {
    result = memcpy(result, a2, __n);
    v3[2] += __n;
  }
  else
  {
    __break(0x5519u);
  }
  return result;
}

uint64_t tb_message_decode_BOOL(uint64_t result, _BYTE *a2)
{
  unint64_t *v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _BYTE *v8;

  if (*(_DWORD *)result != 4)
    tb_message_decode_BOOL_cold_4();
  v2 = *(unint64_t **)(result + 80);
  v3 = v2[2];
  v4 = v3 + 1;
  if (v3 == -1)
    tb_message_decode_BOOL_cold_1();
  v5 = v2[3];
  if (!v5)
    tb_message_decode_BOOL_cold_2();
  if (v4 > v5)
    tb_message_decode_BOOL_cold_3();
  v6 = *v2;
  v7 = *v2 + v5;
  v8 = (_BYTE *)(*v2 + v3);
  v2[2] = v4;
  if (v7 <= (unint64_t)v8 || v6 > (unint64_t)v8)
    __break(0x5519u);
  else
    *a2 = *v8 & 1;
  return result;
}

uint64_t tb_message_decode_u8(uint64_t result, _BYTE *a2)
{
  unint64_t *v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _BYTE *v8;

  if (*(_DWORD *)result != 4)
    tb_message_decode_BOOL_cold_4();
  v2 = *(unint64_t **)(result + 80);
  v3 = v2[2];
  v4 = v3 + 1;
  if (v3 == -1)
    tb_message_decode_u8_cold_1();
  v5 = v2[3];
  if (!v5)
    tb_message_decode_u8_cold_2();
  if (v4 > v5)
    tb_message_decode_u8_cold_3();
  v6 = *v2;
  v7 = *v2 + v5;
  v8 = (_BYTE *)(*v2 + v3);
  v2[2] = v4;
  if (v7 <= (unint64_t)v8 || v6 > (unint64_t)v8)
    __break(0x5519u);
  else
    *a2 = *v8;
  return result;
}

uint64_t tb_message_decode_u16(uint64_t result, _WORD *a2)
{
  unint64_t *v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _WORD *v8;

  if (*(_DWORD *)result != 4)
    tb_message_decode_BOOL_cold_4();
  v2 = *(unint64_t **)(result + 80);
  v3 = v2[2];
  v4 = v3 + 2;
  if (v3 >= 0xFFFFFFFFFFFFFFFELL)
    tb_message_decode_u16_cold_1();
  v5 = v2[3];
  if (!v5)
    tb_message_decode_u16_cold_2();
  if (v4 > v5)
    tb_message_decode_u16_cold_3();
  v6 = *v2;
  v7 = *v2 + v5;
  v8 = (_WORD *)(*v2 + v3);
  v2[2] = v4;
  if (v7 >= (unint64_t)v8 && v6 <= (unint64_t)v8 && v7 - (unint64_t)v8 > 1)
    *a2 = *v8;
  else
    __break(0x5519u);
  return result;
}

uint64_t tb_message_decode_u32(uint64_t result, _DWORD *a2)
{
  _QWORD *v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  _DWORD *v6;
  unint64_t v7;
  _DWORD *v8;
  unint64_t v9;
  BOOL v10;
  BOOL v11;
  BOOL v12;
  BOOL v13;

  if (*(_DWORD *)result != 4)
    tb_message_decode_BOOL_cold_4();
  v2 = *(_QWORD **)(result + 80);
  v3 = v2[2];
  v4 = v3 + 4;
  if (v3 >= 0xFFFFFFFFFFFFFFFCLL)
    tb_message_decode_u32_cold_1();
  v5 = v2[3];
  if (!v5)
    tb_message_decode_u32_cold_2();
  if (v4 > v5)
    tb_message_decode_u32_cold_3();
  v6 = (_DWORD *)*v2;
  v7 = *v2 + v5;
  v8 = (_DWORD *)(*v2 + v3);
  v2[2] = v4;
  v9 = v7 - (_QWORD)v8;
  if (v7 >= (unint64_t)v8)
  {
    v10 = v6 >= v8;
    v11 = v6 == v8;
  }
  else
  {
    v10 = 1;
    v11 = 0;
  }
  if (!v11 && v10)
  {
    v12 = 0;
    v13 = 0;
  }
  else
  {
    v12 = v9 >= 3;
    v13 = v9 == 3;
  }
  if (!v13 && v12)
    *a2 = *v8;
  else
    __break(0x5519u);
  return result;
}

uint64_t tb_message_decode_u64(uint64_t result, _QWORD *a2)
{
  _QWORD *v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  _QWORD *v8;
  unint64_t v9;
  BOOL v10;
  BOOL v11;
  BOOL v12;
  BOOL v13;

  if (*(_DWORD *)result != 4)
    tb_message_decode_BOOL_cold_4();
  v2 = *(_QWORD **)(result + 80);
  v3 = v2[2];
  v4 = v3 + 8;
  if (v3 >= 0xFFFFFFFFFFFFFFF8)
    tb_message_decode_u64_cold_1();
  v5 = v2[3];
  if (!v5)
    tb_message_decode_u64_cold_2();
  if (v4 > v5)
    tb_message_decode_u64_cold_3();
  v6 = (_QWORD *)*v2;
  v7 = *v2 + v5;
  v8 = (_QWORD *)(*v2 + v3);
  v2[2] = v4;
  v9 = v7 - (_QWORD)v8;
  if (v7 >= (unint64_t)v8)
  {
    v10 = v6 >= v8;
    v11 = v6 == v8;
  }
  else
  {
    v10 = 1;
    v11 = 0;
  }
  if (!v11 && v10)
  {
    v12 = 0;
    v13 = 0;
  }
  else
  {
    v12 = v9 >= 7;
    v13 = v9 == 7;
  }
  if (!v13 && v12)
    *a2 = *v8;
  else
    __break(0x5519u);
  return result;
}

uint64_t tb_message_decode_s8(uint64_t result, _BYTE *a2)
{
  unint64_t *v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _BYTE *v8;

  if (*(_DWORD *)result != 4)
    tb_message_decode_BOOL_cold_4();
  v2 = *(unint64_t **)(result + 80);
  v3 = v2[2];
  v4 = v3 + 1;
  if (v3 == -1)
    tb_message_decode_s8_cold_1();
  v5 = v2[3];
  if (!v5)
    tb_message_decode_s8_cold_2();
  if (v4 > v5)
    tb_message_decode_s8_cold_3();
  v6 = *v2;
  v7 = *v2 + v5;
  v8 = (_BYTE *)(*v2 + v3);
  v2[2] = v4;
  if (v7 <= (unint64_t)v8 || v6 > (unint64_t)v8)
    __break(0x5519u);
  else
    *a2 = *v8;
  return result;
}

uint64_t tb_message_decode_s16(uint64_t result, _WORD *a2)
{
  unint64_t *v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _WORD *v8;

  if (*(_DWORD *)result != 4)
    tb_message_decode_BOOL_cold_4();
  v2 = *(unint64_t **)(result + 80);
  v3 = v2[2];
  v4 = v3 + 2;
  if (v3 >= 0xFFFFFFFFFFFFFFFELL)
    tb_message_decode_s16_cold_1();
  v5 = v2[3];
  if (!v5)
    tb_message_decode_s16_cold_2();
  if (v4 > v5)
    tb_message_decode_s16_cold_3();
  v6 = *v2;
  v7 = *v2 + v5;
  v8 = (_WORD *)(*v2 + v3);
  v2[2] = v4;
  if (v7 >= (unint64_t)v8 && v6 <= (unint64_t)v8 && v7 - (unint64_t)v8 > 1)
    *a2 = *v8;
  else
    __break(0x5519u);
  return result;
}

uint64_t tb_message_decode_s32(uint64_t result, _DWORD *a2)
{
  _QWORD *v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  _DWORD *v6;
  unint64_t v7;
  _DWORD *v8;
  unint64_t v9;
  BOOL v10;
  BOOL v11;
  BOOL v12;
  BOOL v13;

  if (*(_DWORD *)result != 4)
    tb_message_decode_BOOL_cold_4();
  v2 = *(_QWORD **)(result + 80);
  v3 = v2[2];
  v4 = v3 + 4;
  if (v3 >= 0xFFFFFFFFFFFFFFFCLL)
    tb_message_decode_s32_cold_1();
  v5 = v2[3];
  if (!v5)
    tb_message_decode_s32_cold_2();
  if (v4 > v5)
    tb_message_decode_s32_cold_3();
  v6 = (_DWORD *)*v2;
  v7 = *v2 + v5;
  v8 = (_DWORD *)(*v2 + v3);
  v2[2] = v4;
  v9 = v7 - (_QWORD)v8;
  if (v7 >= (unint64_t)v8)
  {
    v10 = v6 >= v8;
    v11 = v6 == v8;
  }
  else
  {
    v10 = 1;
    v11 = 0;
  }
  if (!v11 && v10)
  {
    v12 = 0;
    v13 = 0;
  }
  else
  {
    v12 = v9 >= 3;
    v13 = v9 == 3;
  }
  if (!v13 && v12)
    *a2 = *v8;
  else
    __break(0x5519u);
  return result;
}

uint64_t tb_message_decode_s64(uint64_t result, _QWORD *a2)
{
  _QWORD *v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  _QWORD *v8;
  unint64_t v9;
  BOOL v10;
  BOOL v11;
  BOOL v12;
  BOOL v13;

  if (*(_DWORD *)result != 4)
    tb_message_decode_BOOL_cold_4();
  v2 = *(_QWORD **)(result + 80);
  v3 = v2[2];
  v4 = v3 + 8;
  if (v3 >= 0xFFFFFFFFFFFFFFF8)
    tb_message_decode_s64_cold_1();
  v5 = v2[3];
  if (!v5)
    tb_message_decode_s64_cold_2();
  if (v4 > v5)
    tb_message_decode_s64_cold_3();
  v6 = (_QWORD *)*v2;
  v7 = *v2 + v5;
  v8 = (_QWORD *)(*v2 + v3);
  v2[2] = v4;
  v9 = v7 - (_QWORD)v8;
  if (v7 >= (unint64_t)v8)
  {
    v10 = v6 >= v8;
    v11 = v6 == v8;
  }
  else
  {
    v10 = 1;
    v11 = 0;
  }
  if (!v11 && v10)
  {
    v12 = 0;
    v13 = 0;
  }
  else
  {
    v12 = v9 >= 7;
    v13 = v9 == 7;
  }
  if (!v13 && v12)
    *a2 = *v8;
  else
    __break(0x5519u);
  return result;
}

uint64_t tb_message_decode_f32_v2(uint64_t result, _DWORD *a2)
{
  unint64_t *v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  float *v8;
  float v11;
  float v12;
  unsigned int v13;

  if (*(_DWORD *)result != 4)
    tb_message_decode_BOOL_cold_4();
  v2 = *(unint64_t **)(result + 80);
  v3 = v2[2];
  v4 = v3 + 4;
  if (v3 >= 0xFFFFFFFFFFFFFFFCLL)
    tb_message_decode_f32_v2_cold_1();
  v5 = v2[3];
  if (!v5)
    tb_message_decode_f32_v2_cold_2();
  if (v4 > v5)
    tb_message_decode_f32_v2_cold_3();
  v6 = *v2;
  v7 = *v2 + v5;
  v8 = (float *)(*v2 + v3);
  v2[2] = v4;
  if (v7 >= (unint64_t)v8 && v6 <= (unint64_t)v8 && v7 - (unint64_t)v8 > 3)
  {
    v11 = *v8;
    *a2 = *(_DWORD *)v8;
    v12 = fabsf(v11);
    if (v12 >= INFINITY)
      v13 = 7;
    else
      v13 = 0;
    if (v12 <= INFINITY)
      return v13;
    else
      return 0;
  }
  else
  {
    __break(0x5519u);
  }
  return result;
}

uint64_t tb_message_decode_f64_v2(uint64_t result, _QWORD *a2)
{
  unint64_t *v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  double *v8;
  double v11;
  double v12;
  unsigned int v13;

  if (*(_DWORD *)result != 4)
    tb_message_decode_BOOL_cold_4();
  v2 = *(unint64_t **)(result + 80);
  v3 = v2[2];
  v4 = v3 + 8;
  if (v3 >= 0xFFFFFFFFFFFFFFF8)
    tb_message_decode_f64_v2_cold_1();
  v5 = v2[3];
  if (!v5)
    tb_message_decode_f64_v2_cold_2();
  if (v4 > v5)
    tb_message_decode_f64_v2_cold_3();
  v6 = *v2;
  v7 = *v2 + v5;
  v8 = (double *)(*v2 + v3);
  v2[2] = v4;
  if (v7 >= (unint64_t)v8 && v6 <= (unint64_t)v8 && v7 - (unint64_t)v8 > 7)
  {
    v11 = *v8;
    *a2 = *(_QWORD *)v8;
    v12 = fabs(v11);
    if (v12 >= INFINITY)
      v13 = 7;
    else
      v13 = 0;
    if (v12 <= INFINITY)
      return v13;
    else
      return 0;
  }
  else
  {
    __break(0x5519u);
  }
  return result;
}

uint64_t tb_message_decode_f32(uint64_t a1, _DWORD *a2)
{
  uint64_t result;

  result = tb_message_decode_f32_v2(a1, a2);
  if ((_DWORD)result)
    tb_message_decode_f32_cold_1(result);
  return result;
}

uint64_t tb_message_decode_f64(uint64_t a1, _QWORD *a2)
{
  uint64_t result;

  result = tb_message_decode_f64_v2(a1, a2);
  if ((_DWORD)result)
    tb_message_decode_f64_cold_1(result);
  return result;
}

_DWORD *tb_endpoint_create(int a1, int a2)
{
  _DWORD *result;

  result = malloc_type_calloc(1uLL, 0x60uLL, 0x1082040F0CBE349uLL);
  if (!result)
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  *result = a1;
  result[1] = a2;
  return result;
}

_DWORD *tb_endpoint_create_with_data(int a1, uint64_t a2, int a3, const void *a4)
{
  _DWORD *v8;
  _DWORD *v9;

  v8 = malloc_type_calloc(1uLL, 0x60uLL, 0x1082040F0CBE349uLL);
  if (!v8)
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  v9 = v8;
  *v8 = a1;
  v8[1] = a3;
  *((_QWORD *)v8 + 3) = a2;
  if (a4)
  {
    *((_QWORD *)v8 + 1) = _tb_endpoint_block_destructor;
    *((_QWORD *)v8 + 2) = _Block_copy(a4);
  }
  return v9;
}

void _tb_endpoint_block_destructor(void (**a1)(void))
{
  if (a1)
  {
    a1[2]();
    _Block_release(a1);
  }
}

_DWORD *tb_endpoint_create_with_value(int a1, uint64_t a2, int a3)
{
  _DWORD *result;

  result = malloc_type_calloc(1uLL, 0x60uLL, 0x1082040F0CBE349uLL);
  if (!result)
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  *result = a1;
  result[1] = a3;
  *((_QWORD *)result + 3) = a2;
  return result;
}

uint64_t tb_endpoint_create_with_value_static(uint64_t a1, int a2, uint64_t a3, int a4)
{
  *(_DWORD *)a1 = a2;
  *(_DWORD *)(a1 + 4) = a4;
  *(_QWORD *)(a1 + 24) = a3;
  return 0;
}

void tb_endpoint_destruct(_QWORD *a1)
{
  void (*v2)(_QWORD, _QWORD);

  v2 = (void (*)(_QWORD, _QWORD))a1[1];
  if (v2)
    v2(a1[2], a1[3]);
  free(a1);
}

uint64_t tb_endpoint_get_data(uint64_t a1)
{
  return *(_QWORD *)(a1 + 24);
}

uint64_t tb_endpoint_get_value(uint64_t a1)
{
  return *(_QWORD *)(a1 + 24);
}

uint64_t tb_endpoint_get_type(unsigned int *a1)
{
  return *a1;
}

uint64_t tb_endpoint_get_options(uint64_t a1)
{
  return *(unsigned int *)(a1 + 4);
}

uint64_t tb_connection_get_transport(uint64_t a1)
{
  return *(_QWORD *)a1;
}

void _tb_connection_create_transport_for_endpoint(unsigned int *a1, int a2)
{
  int type;
  void *v5;

  type = tb_endpoint_get_type(a1);
  if (type == 1)
  {
    tb_null_transport_create();
    goto LABEL_23;
  }
  if (type == 2)
  {
    if (a2 == 1)
    {
      v5 = tb_mach_service_transport_create((uint64_t)a1);
      goto LABEL_23;
    }
    if (!a2)
    {
      v5 = tb_mach_client_transport_create((uint64_t)a1);
      goto LABEL_23;
    }
  }
  else if (type)
  {
    if (a2 || (type & 0xFFFFFFFE) != 4)
    {
      switch(type)
      {
        case 8:
          v5 = tb_darwin_client_transport_create((uint64_t)a1);
          break;
        case 9:
          if (a2)
          {
            if (a2 != 1)
              goto LABEL_24;
            v5 = tb_unix_service_transport_create_with_endpoint((uint64_t)a1);
          }
          else
          {
            v5 = tb_unix_client_transport_create_with_endpoint((uint64_t)a1);
          }
          break;
        case 10:
          if (a2)
          {
            if (a2 != 1)
              goto LABEL_24;
            v5 = tb_delegated_service_transport_create((uint64_t)a1);
          }
          else
          {
            v5 = tb_delegated_client_transport_create((uint64_t)a1);
          }
          break;
        case 11:
          v5 = tb_afk_transport_create((uint64_t)a1);
          break;
        default:
          goto LABEL_24;
      }
    }
    else
    {
      v5 = tb_eve_client_transport_create((uint64_t)a1);
    }
LABEL_23:
    if (v5)
      return;
  }
LABEL_24:
  __break(1u);
}

_QWORD *_tb_connection_create(uint64_t a1)
{
  _QWORD *result;

  result = malloc_type_calloc(1uLL, 0x20uLL, 0x10820404C9DF37BuLL);
  if (!result)
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  *result = a1;
  return result;
}

void _tb_connection_destruct(uint64_t *a1)
{
  tb_transport_destruct(*a1);
  free(a1);
}

_QWORD *tb_service_connection_create(uint64_t a1, const void *a2)
{
  _QWORD *v4;
  void *v5;
  _QWORD aBlock[9];

  v4 = _tb_connection_create(a1);
  v5 = _Block_copy(a2);
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 0x40000000;
  aBlock[2] = __tb_service_connection_create_block_invoke;
  aBlock[3] = &unk_2519B2AA0;
  aBlock[6] = v4 + 4;
  aBlock[7] = v4;
  aBlock[8] = a1;
  aBlock[4] = v5;
  aBlock[5] = v4;
  tb_transport_set_message_handler(a1, aBlock);
  return v4;
}

unint64_t __tb_service_connection_create_block_invoke(_QWORD *a1, unsigned int *a2)
{
  uint64_t transport_buffer;
  __int16 v5;
  void **v6;
  unint64_t result;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  int message;
  uint64_t v14;
  uint64_t v15;
  unsigned int *v16;

  v16 = a2;
  transport_buffer = tb_message_get_transport_buffer((uint64_t)a2);
  if (tb_message_get_state(a2) != 4)
    __tb_service_connection_create_block_invoke_cold_4();
  if (tb_message_get_disposition((uint64_t)a2) != 1)
    __tb_service_connection_create_block_invoke_cold_3();
  if (!transport_buffer)
    __tb_service_connection_create_block_invoke_cold_1();
  if (!*(_QWORD *)transport_buffer)
    __tb_service_connection_create_block_invoke_cold_2();
  v5 = *(_WORD *)(transport_buffer + 42);
  if ((v5 & 4) != 0)
  {
    result = a1[5];
    if (!result || result < a1[6] && result >= a1[7])
    {
      message = tb_reply_splitter_next_message((uint64_t *)result, (uint64_t)a2, (uint64_t)&v16, a1[8]);
      v14 = (uint64_t)v16;
LABEL_22:
      if (message)
        return 0;
      else
        return v14;
    }
  }
  else
  {
    if ((v5 & 1) != 0)
    {
      v6 = tb_message_accumulator_accumulate((uint64_t)a2);
      if (!v6)
        return 0;
      tb_message_set_transport_buffer((uint64_t)a2, (uint64_t)v6);
    }
    result = a1[4];
    v8 = a1[5];
    if (!v8 || v8 < a1[6] && v8 >= a1[7])
    {
      v9 = (*(uint64_t (**)(void))(result + 16))();
      v10 = v9;
      v15 = v9;
      if (!v9)
        return v10;
      v11 = tb_message_get_transport_buffer(v9);
      result = tb_message_splitter_split_required(a1[8], *(_QWORD *)(v11 + 24));
      if (!(_DWORD)result)
        return v10;
      v12 = (uint64_t *)a1[5];
      if (!v12 || (unint64_t)v12 < a1[6] && (unint64_t)v12 >= a1[7])
      {
        message = tb_reply_splitter_add_reply(v10, &v15, v12);
        v14 = v15;
        goto LABEL_22;
      }
    }
  }
  __break(0x5519u);
  return result;
}

_QWORD *tb_service_connection_create_with_endpoint(unsigned int *a1, const void *a2)
{
  uint64_t v4;
  _QWORD *v5;

  _tb_connection_create_transport_for_endpoint(a1, 1);
  v5 = tb_service_connection_create(v4, a2);
  tb_endpoint_destruct(a1);
  return v5;
}

double _tb_connection_transport_for_endpoint_inplace(unsigned int *a1, uint64_t a2)
{
  int type;
  double result;

  type = tb_endpoint_get_type(a1);
  if (type)
  {
    if (type != 1)
      _tb_connection_transport_for_endpoint_inplace_cold_1();
    *(_QWORD *)&result = tb_null_transport_create_inplace_with_endpoint((uint64_t)a1, a2).n128_u64[0];
  }
  return result;
}

uint64_t tb_service_connection_activate(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  v1 = a1[1];
  if (v1)
  {
    v3 = *(_QWORD *)(v1 + 16);
    if (v3)
      (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, v2);
  }
  return (*(uint64_t (**)(uint64_t))(v2 + 16))(v2);
}

uint64_t _tb_connection_observe_activate_service(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 8);
  if (v1)
  {
    result = *(_QWORD *)(v1 + 16);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void tb_service_connection_destruct(uint64_t *a1)
{
  tb_transport_destruct(*a1);
  free(a1);
}

_QWORD *tb_client_connection_create_with_endpoint(unsigned int *a1)
{
  uint64_t v2;
  _QWORD *v3;

  _tb_connection_create_transport_for_endpoint(a1, 0);
  v3 = _tb_connection_create(v2);
  tb_endpoint_destruct(a1);
  return v3;
}

uint64_t tb_client_connection_create_with_endpoint_static(uint64_t *a1, uint64_t a2, unsigned int *a3)
{
  *(_QWORD *)(a2 + 224) = 0;
  *(_OWORD *)(a2 + 192) = 0u;
  *(_OWORD *)(a2 + 208) = 0u;
  *(_OWORD *)(a2 + 160) = 0u;
  *(_OWORD *)(a2 + 176) = 0u;
  *(_OWORD *)(a2 + 128) = 0u;
  *(_OWORD *)(a2 + 144) = 0u;
  *(_OWORD *)(a2 + 96) = 0u;
  *(_OWORD *)(a2 + 112) = 0u;
  *(_OWORD *)(a2 + 64) = 0u;
  *(_OWORD *)(a2 + 80) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  _tb_connection_transport_for_endpoint_inplace(a3, a2);
  *a1 = a2;
  return 0;
}

uint64_t tb_client_connection_activate(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  v1 = a1[1];
  if (v1)
  {
    v3 = *(_QWORD *)(v1 + 8);
    if (v3)
      (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, v2);
  }
  return (*(uint64_t (**)(uint64_t))(v2 + 8))(v2);
}

uint64_t _tb_connection_observe_activate_client(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 8);
  if (v1)
  {
    result = *(_QWORD *)(v1 + 8);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void tb_client_connection_destruct(uint64_t *a1)
{
  tb_transport_destruct(*a1);
  free(a1);
}

uint64_t tb_connection_send_query(uint64_t *a1, uint64_t a2, uint64_t *a3, unint64_t a4)
{
  uint64_t v8;
  uint64_t transport_buffer;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t msg_identifier;
  void **v16;
  void *v17;
  void *v18;
  _WORD *v19;
  _WORD *v20;
  uint64_t v21;
  void *v22;
  void **v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;

  if (*(_DWORD *)a2 != 2)
    tb_connection_send_query_cold_4();
  if (*(_BYTE *)(a2 + 4) != 1)
    tb_connection_send_query_cold_3();
  if (!tb_message_check_connection_identifier(a2, (uint64_t)a1))
    return 1;
  tb_message_set_state((_DWORD *)a2, 3);
  v8 = *a1;
  transport_buffer = tb_message_get_transport_buffer(a2);
  v10 = transport_buffer;
  if ((a4 & 2) == 0)
    *(_WORD *)(transport_buffer + 42) |= 0x10u;
  if (tb_message_splitter_split_required(v8, *(_QWORD *)(transport_buffer + 24)))
  {
    v11 = tb_message_splitter_send((uint64_t)a1, v8, a2, a3, a4);
  }
  else
  {
    v13 = (_QWORD *)a1[1];
    if (v13 && *v13)
      (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t *, unint64_t))(*v13 + 16))(*v13, v8, a2, a3, a4);
    v11 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t *, unint64_t))v8)(v8, a2, a3, a4);
  }
  v12 = v11;
  if (!(_DWORD)v11)
  {
    v12 = (*(_WORD *)(v10 + 42) & 8) >> 1;
    if ((a4 & 2) != 0 && (*(_WORD *)(v10 + 42) & 8) == 0)
    {
      if (!a3 || !*a3)
        return 4;
      tb_message_set_state((_DWORD *)*a3, 4);
      tb_message_set_disposition(*a3, 2);
      if ((*(_WORD *)(tb_message_get_transport_buffer(*a3) + 42) & 1) != 0)
      {
        msg_identifier = tb_message_get_msg_identifier(*a3);
        if (!msg_identifier)
        {
          msg_identifier = mach_absolute_time();
          tb_message_set_msg_identifier(*a3, msg_identifier);
        }
        v16 = tb_message_accumulator_accumulate(*a3);
        v17 = malloc_type_calloc(1uLL, 0x58uLL, 0x102004071D150F8uLL);
        if (!v17)
          _tb_afk_common_transport_construct_message_buffer_cold_1();
        v18 = v17;
        v28 = v17;
        v19 = malloc_type_calloc(1uLL, 0x68uLL, 0x1090040B6685729uLL);
        if (!v19)
          _tb_afk_common_transport_construct_message_buffer_cold_1();
        v20 = v19;
        v21 = _tb_connection_message_construct(a1, 0, (uint64_t)v18, (uint64_t)v19, 0, 0);
        if ((_DWORD)v21)
        {
          v12 = v21;
          free(v20);
          v22 = v18;
LABEL_26:
          free(v22);
          return v12;
        }
        if (!v16)
        {
          while (1)
          {
            tb_message_complete((uint64_t)v28);
            v20[21] |= 4u;
            tb_message_set_state(v28, 3);
            v24 = (_QWORD *)a1[1];
            if (v24 && *v24)
              (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t *, unint64_t))(*v24 + 16))(*v24, v8, a2, a3, a4);
            v25 = (*(uint64_t (**)(uint64_t, void *, void **, uint64_t))v8)(v8, v28, &v28, 2);
            if ((_DWORD)v25)
            {
              v12 = v25;
              _tb_connection_message_destruct(a1, (uint64_t)v28);
              free(v20);
              v22 = v28;
              goto LABEL_26;
            }
            tb_message_set_msg_identifier((uint64_t)v28, msg_identifier);
            v23 = tb_message_accumulator_accumulate((uint64_t)v28);
            v18 = v28;
            if (v23)
              break;
            _tb_message_reset(a1, v28, 0, 0, 0);
          }
          v16 = v23;
        }
        _tb_connection_message_destruct(a1, (uint64_t)v18);
        free(v20);
        free(v28);
        v26 = tb_message_get_transport_buffer(*a3);
        (*(void (**)(void))(v8 + 32))();
        tb_transport_initialize_message_buffer(v26);
        v27 = v16[3];
        *(_QWORD *)v26 = *v16;
        *(_QWORD *)(v26 + 24) = v27;
        *(_BYTE *)(v26 + 40) = 1;
        *(_WORD *)(v26 + 42) = *((_WORD *)v16 + 21);
        free(v16);
      }
      return 0;
    }
  }
  return v12;
}

uint64_t _tb_connection_observe_send_message(uint64_t result)
{
  uint64_t *v1;

  v1 = *(uint64_t **)(result + 8);
  if (v1)
  {
    result = *v1;
    if (*v1)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t tb_client_connection_message_construct(uint64_t *a1, uint64_t a2, uint64_t a3, size_t a4, uint64_t a5)
{
  return _tb_connection_message_construct(a1, 0, a2, a3, a4, a5);
}

uint64_t tb_client_connection_message_destruct(uint64_t *a1, uint64_t a2)
{
  _tb_connection_message_destruct(a1, a2);
  return 0;
}

uint64_t tb_client_connection_message_reset(uint64_t *a1, _DWORD *a2, unint64_t a3, uint64_t a4)
{
  return _tb_message_reset(a1, a2, 0, a3, a4);
}

uint64_t tb_connection_alloc_init_owned_transport_message_buffer(uint64_t a1, size_t a2)
{
  char *v4;

  tb_transport_initialize_message_buffer(a1);
  v4 = (char *)malloc_type_calloc(a2, 1uLL, 0x100004077774924uLL);
  if (v4 > &v4[a2])
  {
    __break(0x5519u);
LABEL_5:
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  }
  if (!v4)
    goto LABEL_5;
  *(_QWORD *)a1 = v4;
  *(_BYTE *)(a1 + 40) = 1;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = a2;
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  return 0;
}

void tb_connection_dealloc_destruct_owned_transport_message_buffer(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 40))
    tb_connection_dealloc_destruct_owned_transport_message_buffer_cold_1();
  free(*(void **)a1);
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_WORD *)(a1 + 40) = 256;
}

uint64_t _tb_message_buffer_reset(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  _BOOL4 v10;
  BOOL v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;

  if (tb_transport_supports_multipart_messages(a2))
    tb_transport_get_tx_buffer_size(a2);
  v10 = tb_message_splitter_split_required(a2, a4);
  v11 = v10;
  if (*(_BYTE *)(a3 + 40))
  {
    tb_connection_dealloc_destruct_owned_transport_message_buffer(a3);
    if (!v11)
    {
      result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(a2 + 24))(a4, a5, a3);
      goto LABEL_13;
    }
  }
  else
  {
    if (!v10)
    {
      tb_transport_reset_message_buffer(a3);
      v13 = *(_QWORD *)(a1 + 8);
      if (v13)
      {
        v14 = *(_QWORD *)(v13 + 24);
        if (v14)
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, unint64_t))(v14 + 16))(v14, a2, a3, a5, a4);
      }
      result = (*(uint64_t (**)(uint64_t, uint64_t, unint64_t))(a2 + 40))(a3, a5, a4);
LABEL_13:
      if ((_DWORD)result)
        return result;
      return 0;
    }
    (*(void (**)(uint64_t))(a2 + 32))(a3);
  }
  tb_connection_alloc_init_owned_transport_message_buffer(a3, a4);
  return 0;
}

uint64_t _tb_connection_observe_reset_message(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 8);
  if (v1)
  {
    result = *(_QWORD *)(v1 + 24);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t _tb_message_reset(uint64_t *a1, _DWORD *a2, int a3, unint64_t a4, uint64_t a5)
{
  char v10;
  uint64_t transport_buffer;

  tb_message_set_state(a2, 1);
  if (a3 == 1)
    v10 = 2;
  else
    v10 = 1;
  tb_message_set_disposition((uint64_t)a2, v10);
  transport_buffer = tb_message_get_transport_buffer((uint64_t)a2);
  return _tb_message_buffer_reset((uint64_t)a1, *a1, transport_buffer, a4, a5);
}

uint64_t tb_transport_get_context(uint64_t a1)
{
  return *(_QWORD *)(a1 + 96);
}

__n128 tb_transport_message_buffer_copy(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = a2[1];
  a1->n128_u64[0] = a2->n128_u64[0];
  a1[1] = result;
  a1[2].n128_u64[0] = a2[2].n128_u64[0];
  a1[3].n128_u64[0] = a2[3].n128_u64[0];
  return result;
}

uint64_t tb_service_connection_message_construct(uint64_t *a1, uint64_t a2, uint64_t a3, size_t a4, uint64_t a5)
{
  return _tb_connection_message_construct(a1, 1, a2, a3, a4, a5);
}

uint64_t _tb_connection_message_construct(uint64_t *a1, int a2, uint64_t a3, uint64_t a4, size_t a5, uint64_t a6)
{
  uint64_t v12;
  unint64_t tx_buffer_size;
  uint64_t result;
  char v15;

  tb_message_initialize(a3);
  v12 = *a1;
  if (!tb_transport_supports_multipart_messages(*a1))
  {
    if (!*(_BYTE *)(a4 + 8))
    {
LABEL_6:
      result = (*(uint64_t (**)(size_t, uint64_t, uint64_t))(v12 + 24))(a5, a6, a4);
      if ((_DWORD)result)
        return result;
      goto LABEL_7;
    }
LABEL_13:
    _tb_connection_message_construct_cold_1();
  }
  tx_buffer_size = tb_transport_get_tx_buffer_size(v12);
  if (*(_BYTE *)(a4 + 8))
    goto LABEL_13;
  if (tx_buffer_size >= a5)
    goto LABEL_6;
  tb_connection_alloc_init_owned_transport_message_buffer(a4, a5);
LABEL_7:
  if (a2 == 1)
    v15 = 2;
  else
    v15 = 1;
  result = tb_message_construct(a3, a4, v15);
  if (!(_DWORD)result)
  {
    tb_message_set_connection_identifier(a3, (uint64_t)a1);
    return 0;
  }
  return result;
}

uint64_t tb_service_connection_message_destruct(uint64_t *a1, uint64_t a2)
{
  _tb_connection_message_destruct(a1, a2);
  return 0;
}

uint64_t _tb_connection_message_destruct(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t transport_buffer;

  v3 = *a1;
  transport_buffer = tb_message_get_transport_buffer(a2);
  if (*(_BYTE *)(transport_buffer + 8))
    _tb_connection_message_destruct_cold_1();
  if (*(_BYTE *)(transport_buffer + 40))
    tb_connection_dealloc_destruct_owned_transport_message_buffer(transport_buffer);
  else
    (*(void (**)(void))(v3 + 32))();
  return tb_message_destruct(a2);
}

uint64_t tb_service_connection_message_configure_reply(uint64_t *a1, _DWORD *a2, unint64_t a3, uint64_t a4)
{
  return _tb_message_reset(a1, a2, 1, a3, a4);
}

_QWORD *_tb_connection_init_observers(_QWORD *result)
{
  _QWORD *v1;

  if (!result[1])
  {
    v1 = result;
    result = malloc_type_calloc(1uLL, 0x20uLL, 0x8004018A671A6uLL);
    if (!result)
      _tb_afk_common_transport_construct_message_buffer_cold_1();
    v1[1] = result;
  }
  return result;
}

uint64_t _tb_connection_get_observers(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8);
}

double _tb_connection_clear_observers(uint64_t a1)
{
  _OWORD *v1;
  double result;

  v1 = *(_OWORD **)(a1 + 8);
  if (v1)
  {
    result = 0.0;
    *v1 = 0u;
    v1[1] = 0u;
  }
  return result;
}

uint64_t tb_mach_transport_get_tx_buffer_size()
{
  return 15360;
}

uint64_t (**tb_mach_service_transport_create(uint64_t a1))(uint64_t a1)
{
  task_inspect_t *v1;
  const char *data;
  uint64_t (**result)(uint64_t);
  mach_port_t v4;
  mach_port_name_t name;
  char __dst[128];
  uint64_t v7;

  v1 = (task_inspect_t *)a1;
  v7 = *MEMORY[0x24BDAC8D0];
  name = 0;
  switch(tb_endpoint_get_options(a1))
  {
    case 0u:
    case 3u:
      goto LABEL_6;
    case 1u:
      data = (const char *)tb_endpoint_get_data((uint64_t)v1);
      strncpy(__dst, data, 0x7FuLL);
      __dst[127] = 0;
      v1 = (task_inspect_t *)MEMORY[0x24BDAEC58];
      if (!mach_port_allocate(*MEMORY[0x24BDAEC58], 1u, &name) && !mach_port_insert_right(*v1, name, name, 0x14u))
      {
        v4 = 0;
        if (!task_get_special_port(*v1, 4, &v4) && !bootstrap_register(v4, __dst, name))
          goto LABEL_8;
      }
LABEL_6:
      __break(1u);
LABEL_7:
      name = tb_endpoint_get_value((uint64_t)v1);
LABEL_8:
      result = _tb_mach_transport_create();
      *((_DWORD *)result[12] + 4) = name;
      return result;
    case 2u:
      goto LABEL_7;
    default:
      goto LABEL_8;
  }
}

uint64_t (**_tb_mach_transport_create())(uint64_t a1)
{
  uint64_t (**v0)(uint64_t);
  uint64_t (**v1)(uint64_t);
  _QWORD *v2;
  _QWORD *v3;

  v0 = (uint64_t (**)(uint64_t))malloc_type_calloc(1uLL, 0xE8uLL, 0x1082040EFE8DF71uLL);
  if (!v0)
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  v1 = v0;
  v2 = malloc_type_calloc(1uLL, 0x18uLL, 0x102004062D53EE8uLL);
  if (!v2)
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  v3 = v2;
  v1[4] = (uint64_t (*)(uint64_t))_tb_mach_transport_destruct_message_buffer;
  v1[5] = (uint64_t (*)(uint64_t))_tb_mach_transport_message_buffer_reset;
  v1[12] = (uint64_t (*)(uint64_t))v2;
  *v1 = _tb_mach_transport_send_message;
  v1[1] = (uint64_t (*)(uint64_t))_tb_mach_transport_activate;
  v1[2] = (uint64_t (*)(uint64_t))_tb_mach_transport_activate;
  v1[3] = (uint64_t (*)(uint64_t))_tb_mach_transport_construct_message_buffer;
  v1[6] = (uint64_t (*)(uint64_t))_tb_mach_transport_supports_multipart_messages;
  v1[7] = (uint64_t (*)(uint64_t))tb_mach_transport_get_tx_buffer_size;
  v1[8] = (uint64_t (*)(uint64_t))_tb_mach_transport_destruct;
  v2[2] = 0;
  *v2 = dispatch_queue_create("com.apple.tightbeam.mach_transport.q", 0);
  v3[1] = dispatch_mach_create();
  return v1;
}

uint64_t (**tb_mach_client_transport_create(uint64_t a1))(uint64_t a1)
{
  const char *data;
  uint64_t (**result)(uint64_t);
  mach_port_t bp;
  mach_port_t sp;
  char __dst[128];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  sp = 0;
  switch(tb_endpoint_get_options(a1))
  {
    case 0u:
    case 2u:
      goto LABEL_4;
    case 1u:
      data = (const char *)tb_endpoint_get_data(a1);
      strncpy(__dst, data, 0x7FuLL);
      __dst[127] = 0;
      bp = 0;
      if (!task_get_special_port(*MEMORY[0x24BDAEC58], 4, &bp) && !bootstrap_look_up(bp, __dst, &sp))
        goto LABEL_6;
LABEL_4:
      __break(1u);
LABEL_5:
      sp = tb_endpoint_get_value(a1);
LABEL_6:
      result = _tb_mach_transport_create();
      *((_DWORD *)result[12] + 5) = sp;
      return result;
    case 3u:
      goto LABEL_5;
    default:
      goto LABEL_6;
  }
}

uint64_t _tb_mach_transport_construct_message_buffer(size_t a1, uint64_t a2, uint64_t a3)
{
  char *v5;

  v5 = (char *)malloc_type_calloc(a1, 1uLL, 0x100004077774924uLL);
  if (v5 > &v5[a1])
  {
    __break(0x5519u);
LABEL_5:
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  }
  if (!v5)
    goto LABEL_5;
  *(_QWORD *)a3 = v5;
  *(_BYTE *)(a3 + 8) = 0;
  *(_QWORD *)(a3 + 16) = 0;
  *(_QWORD *)(a3 + 24) = a1;
  *(_QWORD *)(a3 + 32) = 0;
  *(_QWORD *)(a3 + 48) = 0;
  return 0;
}

void _tb_mach_transport_destruct_message_buffer(uint64_t a1)
{
  free(*(void **)a1);
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_BYTE *)(a1 + 41) = 1;
}

uint64_t _tb_mach_transport_message_buffer_reset(uint64_t a1, uint64_t a2, size_t a3)
{
  uint64_t v5;

  free(*(void **)a1);
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  return _tb_mach_transport_construct_message_buffer(a3, v5, a1);
}

uint64_t _tb_mach_transport_send_message(uint64_t a1)
{
  _DWORD *v1;
  uint64_t *v2;
  char v3;
  char v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t transport_buffer;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  _DWORD v12[4];
  unint64_t v13;
  uint64_t v14;

  MEMORY[0x24BDAC7A8](a1);
  v14 = *MEMORY[0x24BDAC8D0];
  if (*v1 != 3)
    _tb_afk_user_transport_send_message_cold_3();
  v4 = v3;
  v5 = v2;
  v6 = (uint64_t)v1;
  bzero(v12, 0x3C18uLL);
  transport_buffer = tb_message_get_transport_buffer(v6);
  v12[3] = *(unsigned __int16 *)(transport_buffer + 42);
  v13 = *(_QWORD *)(transport_buffer + 24);
  if (v13 >= 0x3C01)
    __break(0x5519u);
  __memcpy_chk();
  v8 = dispatch_mach_msg_create();
  if ((v4 & 2) != 0)
  {
    v9 = dispatch_mach_send_and_wait_for_reply();
    v10 = v9;
    if (v5 && v9)
    {
      _tb_unpack_dispatch_mach_msg_to_tb_message();
      *v5 = v6;
      dispatch_release(v10);
    }
    else if (v5 && !v9)
    {
      return 4;
    }
  }
  else
  {
    dispatch_mach_send();
  }
  dispatch_release(v8);
  return 0;
}

uint64_t _tb_mach_transport_activate()
{
  dispatch_mach_connect();
  return 0;
}

void _tb_mach_transport_destruct(void *a1)
{
  uint64_t context;
  mach_port_name_t v3;
  ipc_space_t *v4;
  mach_port_name_t v5;

  context = tb_transport_get_context((uint64_t)a1);
  v3 = *(_DWORD *)(context + 16);
  v4 = (ipc_space_t *)MEMORY[0x24BDAEC58];
  if (v3)
  {
    mach_port_deallocate(*MEMORY[0x24BDAEC58], v3);
    *(_DWORD *)(context + 16) = 0;
  }
  v5 = *(_DWORD *)(context + 20);
  if (v5)
  {
    mach_port_deallocate(*v4, v5);
    *(_DWORD *)(context + 20) = 0;
  }
  dispatch_mach_cancel();
  dispatch_release(*(dispatch_object_t *)context);
  free((void *)context);
  free(a1);
}

uint64_t _tb_mach_transport_supports_multipart_messages()
{
  return 1;
}

void ___tb_mach_transport_create_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void **v5;
  void **v6;
  uint64_t msg;
  uint64_t v8;
  uint64_t v9;
  _DWORD *v10;
  _DWORD *v11;
  uint64_t v12;
  uint64_t transport_buffer;
  unint64_t v14;
  uint64_t v15;
  size_t v16;

  if (a2 == 2)
  {
    v3 = malloc_type_calloc(1uLL, 0x58uLL, 0x102004071D150F8uLL);
    if (!v3)
      goto LABEL_18;
    v4 = v3;
    v5 = (void **)malloc_type_calloc(1uLL, 0x68uLL, 0x1090040B6685729uLL);
    if (!v5)
      _tb_afk_common_transport_construct_message_buffer_cold_1();
    v6 = v5;
    msg = dispatch_mach_msg_get_msg();
    if (_tb_mach_transport_construct_message_buffer(*(_QWORD *)(msg + 24), v8, (uint64_t)v6)
      || tb_message_construct((uint64_t)v4, (uint64_t)v6, 1))
    {
LABEL_17:
      __break(1u);
LABEL_18:
      _tb_afk_common_transport_construct_message_buffer_cold_1();
    }
    _tb_unpack_dispatch_mach_msg_to_tb_message();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
    if (!v9)
    {
      tb_message_destruct((uint64_t)v4);
      free(v6);
      free(v4);
      return;
    }
    v10 = (_DWORD *)(*(uint64_t (**)(uint64_t, void *))(v9 + 16))(v9, v4);
    if (v10)
    {
      v11 = v10;
      if (*v10 != 2)
        __tb_afk_transport_create_block_invoke_cold_3();
      v12 = dispatch_mach_msg_get_msg();
      transport_buffer = tb_message_get_transport_buffer((uint64_t)v11);
      v14 = *(_QWORD *)(transport_buffer + 24);
      if (v14 >= 0x3C01)
        goto LABEL_17;
      v15 = transport_buffer;
      *(_DWORD *)v12 = 18;
      *(_DWORD *)(v12 + 12) = 0;
      *(_QWORD *)(v12 + 24) = v14;
      bzero((void *)(v12 + 32), 0x3C00uLL);
      v16 = *(_QWORD *)(v15 + 24);
      if (v16 > 0x3C00)
      {
        __break(0x5519u);
        return;
      }
      memcpy((void *)(v12 + 32), *(const void **)v15, v16);
      *(_DWORD *)(v12 + 20) = *(unsigned __int16 *)(v15 + 42);
      dispatch_mach_send();
      *v11 = 3;
      tb_message_complete((uint64_t)v11);
    }
    free(*v6);
    *v6 = 0;
    v6[6] = 0;
    v6[3] = 0;
    v6[4] = 0;
    v6[2] = 0;
    *((_BYTE *)v6 + 41) = 1;
    tb_message_destruct((uint64_t)v4);
    free(v6);
    free(v4);
  }
  else if (a2 == 4)
  {
    goto LABEL_17;
  }
}

uint64_t _tb_unpack_dispatch_mach_msg_to_tb_message()
{
  uint64_t result;

  result = dispatch_mach_msg_get_msg();
  __break(1u);
  __break(0x5519u);
  return result;
}

_QWORD *tb_darwin_client_transport_create(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  _OWORD *v4;
  _OWORD *v5;
  _OWORD *data;

  v2 = malloc_type_calloc(1uLL, 0xE8uLL, 0x108004074646765uLL);
  if (!v2)
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  v3 = v2;
  v4 = malloc_type_calloc(1uLL, 0x10uLL, 0x1000040451B5BE8uLL);
  if (!v4)
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  v5 = v4;
  v3[4] = _tb_darwin_transport_destruct_message_buffer;
  v3[5] = _tb_darwin_transport_message_buffer_reset;
  *v3 = _tb_darwin_transport_send_message;
  v3[1] = _tb_darwin_client_transport_activate;
  v3[2] = _tb_darwin_service_transport_activate;
  v3[3] = _tb_darwin_transport_construct_message_buffer;
  v3[12] = v4;
  v3[6] = _tb_darwin_transport_supports_multipart_messages;
  v3[7] = _tb_darwin_transport_get_tx_buffer_size;
  v3[8] = _tb_darwin_transport_destruct;
  data = (_OWORD *)tb_endpoint_get_data(a1);
  if (data)
    *v5 = *data;
  return v3;
}

uint64_t _tb_darwin_transport_construct_message_buffer(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  if (a1 > 0x1F0)
    return 12;
  result = (uint64_t)malloc_type_calloc(1uLL, 0x200uLL, 0x10000407EBBDD04uLL);
  if (!result)
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  v6 = result;
  *(_QWORD *)(a3 + 48) = result;
  if (a1 >= 0x1B1)
  {
    __break(0x5519u);
  }
  else
  {
    result = 0;
    *(_QWORD *)a3 = v6 + 16;
    *(_BYTE *)(a3 + 8) = 0;
    *(_QWORD *)(a3 + 16) = 0;
    *(_QWORD *)(a3 + 24) = a1;
    *(_QWORD *)(a3 + 32) = 0;
    *(_BYTE *)(a3 + 41) = 0;
  }
  return result;
}

void _tb_darwin_transport_destruct_message_buffer(uint64_t a1)
{
  free(*(void **)(a1 + 48));
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_BYTE *)(a1 + 41) = 1;
}

uint64_t _tb_darwin_transport_message_buffer_reset(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;

  if (a3 > 0x1F0)
    return 12;
  *(_QWORD *)(result + 16) = 0;
  if (*(_QWORD *)result <= *(_QWORD *)result + a3)
  {
    v3 = 0;
    *(_QWORD *)(result + 24) = a3;
    return v3;
  }
  __break(0x5519u);
  return result;
}

uint64_t _tb_darwin_transport_send_message(uint64_t a1, _DWORD *a2, _QWORD *a3, char a4)
{
  unint64_t v8;
  uint64_t result;
  unint64_t v10;
  unint64_t v11;

  if (*a2 != 3)
    _tb_afk_user_transport_send_message_cold_3();
  v8 = (*(_DWORD *)(tb_message_get_transport_buffer((uint64_t)a2) + 24) + 7);
  v11 = (v8 >> 3) & 0x3F | ((unint64_t)*(unsigned __int16 *)(tb_message_get_transport_buffer((uint64_t)a2) + 42) << 16);
  tb_transport_get_context(a1);
  if (exclaves_endpoint_call())
    return 1;
  if ((a4 & 2) == 0)
    return 0;
  tb_message_configure_recieved((uint64_t)a2, 2);
  result = tb_message_get_transport_buffer((uint64_t)a2);
  if (!result)
    return 4;
  v10 = 8 * (v11 & 0x3F);
  if (v10 > 0x1F0)
    return 4;
  *(_QWORD *)(result + 16) = 0;
  if (*(_QWORD *)result > *(_QWORD *)result + v10)
  {
    __break(0x5519u);
  }
  else
  {
    *(_QWORD *)(result + 24) = v10;
    *(_WORD *)(result + 42) = WORD1(v11);
    if (!a3)
      return 0;
    result = 0;
    *a3 = a2;
  }
  return result;
}

uint64_t _tb_darwin_client_transport_activate()
{
  return 0;
}

uint64_t _tb_darwin_service_transport_activate()
{
  return 0;
}

uint64_t _tb_darwin_transport_supports_multipart_messages()
{
  return _config_supports_multipart;
}

uint64_t _tb_darwin_transport_get_tx_buffer_size()
{
  return 400;
}

void _tb_darwin_transport_destruct(void *a1)
{
  void *context;

  context = (void *)tb_transport_get_context((uint64_t)a1);
  free(context);
  free(a1);
}

uint64_t tb_delegated_transport_construct_message_buffer(size_t a1, uint64_t a2, uint64_t a3)
{
  char *v5;

  v5 = (char *)malloc_type_calloc(a1, 1uLL, 0x100004077774924uLL);
  if (v5 > &v5[a1])
  {
    __break(0x5519u);
LABEL_5:
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  }
  if (!v5)
    goto LABEL_5;
  *(_QWORD *)a3 = v5;
  *(_QWORD *)(a3 + 16) = 0;
  *(_QWORD *)(a3 + 24) = a1;
  *(_QWORD *)(a3 + 32) = 0;
  *(_QWORD *)(a3 + 48) = 0;
  *(_BYTE *)(a3 + 41) = 0;
  return 0;
}

void tb_delegated_transport_destruct_message_buffer(uint64_t a1)
{
  free(*(void **)a1);
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_BYTE *)(a1 + 41) = 1;
}

uint64_t tb_delegated_transport_message_buffer_reset(uint64_t a1, uint64_t a2, size_t a3)
{
  uint64_t v5;

  free(*(void **)a1);
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  return tb_delegated_transport_construct_message_buffer(a3, v5, a1);
}

_OWORD *tb_delegated_service_transport_create(uint64_t a1)
{
  _OWORD *v2;
  _OWORD *v3;
  __int128 v4;
  __int128 v5;

  v2 = malloc_type_calloc(1uLL, 0xE8uLL, 0x1082040EFE8DF71uLL);
  if (!v2)
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  v3 = v2;
  v4 = *(_OWORD *)&off_254461918;
  *v2 = _tb_delegated_transport_vtable;
  v2[1] = v4;
  v5 = unk_254461938;
  v2[2] = xmmword_254461928;
  v2[3] = v5;
  *((_QWORD *)v2 + 8) = _tb_delegated_service_transport_destruct;
  *((_QWORD *)v2 + 12) = _tb_delegated_service_transport_create(a1);
  return v3;
}

_OWORD *tb_delegated_client_transport_create(uint64_t a1)
{
  _OWORD *v2;
  _OWORD *v3;
  __int128 v4;
  __int128 v5;

  v2 = malloc_type_calloc(1uLL, 0xE8uLL, 0x1082040EFE8DF71uLL);
  if (!v2)
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  v3 = v2;
  v4 = *(_OWORD *)&off_254461918;
  *v2 = _tb_delegated_transport_vtable;
  v2[1] = v4;
  v5 = unk_254461938;
  v2[2] = xmmword_254461928;
  v2[3] = v5;
  *((_QWORD *)v2 + 8) = _tb_delegated_client_transport_destruct;
  *((_QWORD *)v2 + 12) = _tb_delegated_client_transport_create(a1);
  return v3;
}

unint64_t tb_exclave_notification_create(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  uint64_t v5;
  unint64_t result;

  if (exclaves_notification_create())
    return 12;
  result = (unint64_t)malloc_type_calloc(1uLL, 0x20uLL, 0x1020040AB73632BuLL);
  if (!result)
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  *(_QWORD *)result = -1;
  *(_QWORD *)(result + 8) = a2;
  if (result < result + 32)
  {
    v5 = 0;
    *a3 = result;
    return v5;
  }
  __break(0x5519u);
  return result;
}

uint64_t tb_exclave_notification_register(uint64_t a1, dispatch_object_t object, void *a3)
{
  NSObject *v6;
  NSObject *v7;

  dispatch_retain(object);
  *(_QWORD *)(a1 + 24) = object;
  v6 = dispatch_source_create(MEMORY[0x24BDAC9D8], *(_QWORD *)a1, *(_QWORD *)(a1 + 8), object);
  if (!v6)
    return 12;
  v7 = v6;
  dispatch_retain(v6);
  *(_QWORD *)(a1 + 16) = v7;
  dispatch_source_set_event_handler(v7, a3);
  dispatch_activate(*(dispatch_object_t *)(a1 + 16));
  return 0;
}

void tb_exclave_notification_unregister(uint64_t a1, void *a2)
{
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 16));
  dispatch_release(*(dispatch_object_t *)(a1 + 16));
  dispatch_async(*(dispatch_queue_t *)(a1 + 24), a2);
  dispatch_release(*(dispatch_object_t *)(a1 + 24));
}

uint64_t _add_accumulator(uint64_t *a1)
{
  pthread_mutex_t *v2;
  uint64_t result;

  v2 = (pthread_mutex_t *)atomic_load(&accumulator_list);
  if (!v2)
  {
    v2 = tb_list_create();
    while (!__ldxr(&accumulator_list))
    {
      if (!__stlxr((unint64_t)v2, &accumulator_list))
        goto LABEL_7;
    }
    __clrex();
    tb_list_free(v2);
    v2 = (pthread_mutex_t *)atomic_load(&accumulator_list);
  }
LABEL_7:
  result = tb_list_add(v2, *a1, (uint64_t)a1, &__block_literal_global_0);
  if ((result & 1) == 0)
    _add_accumulator_cold_1();
  return result;
}

void ___add_accumulator_block_invoke(uint64_t a1, void **a2)
{
  free(a2[3]);
  free(a2);
}

void **tb_message_accumulator_accumulate(uint64_t a1)
{
  uint64_t transport_buffer;
  pthread_mutex_t *v3;
  uint64_t v4;
  uint64_t *v5;
  unint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  size_t v14;
  size_t v15;
  char *v16;
  uint64_t v17;
  size_t v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  BOOL v22;
  size_t v23;
  BOOL v24;
  void **v26;
  void **v27;
  size_t v28;
  pthread_mutex_t *v29;

  transport_buffer = tb_message_get_transport_buffer(a1);
  v3 = (pthread_mutex_t *)atomic_load(&accumulator_list);
  if (v3 && (v4 = tb_list_find(v3, *(_QWORD *)(a1 + 24))) != 0)
  {
    v5 = (uint64_t *)v4;
    v6 = v4 + 32;
  }
  else
  {
    v7 = (uint64_t *)malloc_type_calloc(1uLL, 0x20uLL, 0x1010040313BCFEBuLL);
    if (!v7)
      _tb_afk_common_transport_construct_message_buffer_cold_1();
    v5 = v7;
    *v7 = *(_QWORD *)(a1 + 24);
    v6 = (unint64_t)(v7 + 4);
    v8 = *(_QWORD *)(transport_buffer + 24);
    if (v8 < 0)
      tb_message_accumulator_accumulate_cold_2();
    v9 = 2 * v8;
    v10 = (char *)malloc_type_calloc(2 * v8, 1uLL, 0x100004077774924uLL);
    if (v10 > &v10[v9])
      goto LABEL_34;
    if (!v10)
      _tb_afk_common_transport_construct_message_buffer_cold_1();
    v5[2] = v9;
    v5[3] = (uint64_t)v10;
    if ((unint64_t)v5 >= v6)
      goto LABEL_34;
    _add_accumulator(v5);
  }
  v11 = tb_message_get_transport_buffer(a1);
  v12 = v5[1];
  v13 = *(_QWORD *)(v11 + 24);
  v14 = v12 + v13;
  if (__CFADD__(v12, v13))
    goto LABEL_35;
  v15 = v5[2];
  if (v14 > v15)
  {
    v16 = (char *)malloc_type_realloc((void *)v5[3], v14, 0xD6F6D52BuLL);
    if (v16 <= &v16[v14])
    {
      if (!v16)
        _tb_afk_common_transport_construct_message_buffer_cold_1();
      v5[2] = v14;
      v5[3] = (uint64_t)v16;
      v15 = v14;
      goto LABEL_15;
    }
LABEL_34:
    __break(0x5519u);
LABEL_35:
    tb_message_accumulator_accumulate_cold_4();
  }
LABEL_15:
  if ((unint64_t)(v5 + 4) > v6)
    goto LABEL_34;
  v17 = v5[1];
  v18 = *(_QWORD *)(transport_buffer + 24);
  if (__CFADD__(v17, v18))
    tb_message_accumulator_accumulate_cold_6();
  if (v15 < v17 + v18)
    tb_message_accumulator_accumulate_cold_7();
  v19 = v5[3];
  v20 = v19 + v15;
  v21 = (void *)(v19 + v17);
  v22 = v20 >= v19 + v17;
  v23 = v20 - (v19 + v17);
  v24 = !v22 || v19 > (unint64_t)v21;
  if (v24 || v18 > v23)
    goto LABEL_34;
  memcpy(v21, *(const void **)transport_buffer, v18);
  v5[1] += *(_QWORD *)(transport_buffer + 24);
  if ((*(_BYTE *)(transport_buffer + 42) & 2) == 0)
    return 0;
  v27 = (void **)malloc_type_calloc(1uLL, 0x68uLL, 0x1090040B6685729uLL);
  if (!v27)
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  v26 = v27;
  if (tb_connection_alloc_init_owned_transport_message_buffer((uint64_t)v27, v5[1]))
    tb_message_accumulator_accumulate_cold_9();
  v28 = v5[1];
  if (v28 > v5[2] || v28 > (unint64_t)v26[3])
    goto LABEL_34;
  memcpy(*v26, (const void *)v5[3], v28);
  v29 = (pthread_mutex_t *)atomic_load(&accumulator_list);
  if (v29)
    tb_list_remove(v29, *v5);
  return v26;
}

BOOL tb_message_splitter_split_required(uint64_t a1, unint64_t a2)
{
  return *(_QWORD *)(a1 + 56) && tb_transport_get_tx_buffer_size(a1) < a2;
}

uint64_t tb_message_splitter_send(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, unint64_t a5)
{
  size_t tx_buffer_size;
  _QWORD *transport_buffer;
  size_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  unint64_t v14;
  size_t v15;
  size_t v16;
  uint64_t (*v17)(_QWORD *, _QWORD, size_t);
  uint64_t v18;
  unint64_t v19;
  void *v20;
  unint64_t v21;
  const void *v22;
  BOOL v23;
  size_t v24;
  __int16 v30;
  unint64_t v32;
  uint64_t v33;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v39;

  if (!tb_transport_supports_multipart_messages(a2))
    return 1;
  tx_buffer_size = tb_transport_get_tx_buffer_size(a2);
  transport_buffer = (_QWORD *)tb_message_get_transport_buffer(a3);
  v10 = transport_buffer[3];
  v39 = 0;
  v11 = malloc_type_calloc(1uLL, 0x68uLL, 0x1090040B6685729uLL);
  if (!v11)
    goto LABEL_54;
  v12 = v11;
  v13 = (*(uint64_t (**)(size_t, _QWORD, _QWORD *))(a2 + 24))(tx_buffer_size, 0, v11);
  if (!(_DWORD)v13)
  {
    v36 = a3;
    v35 = a4;
    if (v10)
    {
      v14 = 0;
      do
      {
        v15 = v14 + tx_buffer_size;
        if (__CFADD__(v14, tx_buffer_size))
          tb_message_splitter_send_cold_2();
        v16 = tx_buffer_size;
        if (v15 >= v10)
          tx_buffer_size = v10 - v14;
        v17 = *(uint64_t (**)(_QWORD *, _QWORD, size_t))(a2 + 40);
        if (!v17)
        {
          v13 = 2;
          goto LABEL_50;
        }
        v18 = v17(v12, 0, tx_buffer_size);
        if ((_DWORD)v18)
          goto LABEL_48;
        v19 = *v12 + v12[3];
        v20 = (void *)(*v12 + v12[4]);
        v21 = *transport_buffer + transport_buffer[3];
        v22 = (const void *)(*transport_buffer + transport_buffer[4] + v14);
        v23 = v21 >= (unint64_t)v22;
        v24 = v21 - (_QWORD)v22;
        if (!v23
          || *transport_buffer > (unint64_t)v22
          || tx_buffer_size > v24
          || (unint64_t)v20 > v19
          || *v12 > (unint64_t)v20
          || tx_buffer_size > v19 - (unint64_t)v20)
        {
          __break(0x5519u);
LABEL_54:
          _tb_afk_common_transport_construct_message_buffer_cold_1();
        }
        if (v15 < v10)
          v30 = 1;
        else
          v30 = 3;
        if (v15 >= v10 || (a5 & 2) == 0)
          v32 = a5;
        else
          v32 = a5 & 0xFFFFFFFFFFFFFFFDLL;
        memcpy(v20, v22, tx_buffer_size);
        *((_WORD *)v12 + 21) = v30;
        tb_message_set_transport_buffer(v36, (uint64_t)v12);
        _tb_connection_observe_send_message(a1);
        v18 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t *, unint64_t))a2)(a2, v36, &v39, v32);
        if ((_DWORD)v18)
        {
LABEL_48:
          v13 = v18;
LABEL_50:
          (*(void (**)(_QWORD *))(a2 + 32))(v12);
          free(v12);
          return v13;
        }
        if (v39)
        {
          if (v15 < v10)
            return 4;
          v33 = tb_message_get_transport_buffer(v39);
          v18 = _tb_message_buffer_reset(a1, a2, (uint64_t)transport_buffer, *(_QWORD *)(v33 + 24), 0);
          if ((_DWORD)v18)
            goto LABEL_48;
          tb_transport_message_buffer_deep_copy(transport_buffer, v33);
        }
        v14 += tx_buffer_size;
        tx_buffer_size = v16;
      }
      while (v14 < v10);
    }
    (*(void (**)(_QWORD *))(a2 + 32))(v12);
    free(v12);
    if (v35 && v39)
      *v35 = v36;
    tb_message_set_transport_buffer(v36, (uint64_t)transport_buffer);
    return 0;
  }
  return v13;
}

uint64_t tb_reply_splitter_add_reply(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t transport;
  uint64_t transport_buffer;
  uint64_t v8;
  uint64_t v9;
  pthread_mutex_t *v10;
  pthread_mutex_t *v11;
  uint64_t result;
  void *v14;
  unint64_t v15;
  size_t v16;
  char *v17;
  char *v18;
  unint64_t tx_buffer_size;
  _QWORD *v20;
  _QWORD *v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;

  transport = tb_connection_get_transport((uint64_t)a3);
  if (!tb_transport_supports_multipart_messages(transport))
    return 5;
  transport_buffer = tb_message_get_transport_buffer(a1);
  if (!*(_BYTE *)(transport_buffer + 40))
LABEL_23:
    tb_reply_splitter_add_reply_cold_1();
  v8 = transport_buffer;
  v9 = *(_QWORD *)(a1 + 24);
  v10 = (pthread_mutex_t *)atomic_load(&reply_list);
  if (!v10)
  {
    v11 = tb_list_create();
    v10 = v11;
    while (!__ldxr(&reply_list))
    {
      if (!__stlxr((unint64_t)v11, &reply_list))
        goto LABEL_10;
    }
    __clrex();
    free(v11);
    v10 = (pthread_mutex_t *)atomic_load(&reply_list);
  }
LABEL_10:
  v14 = malloc_type_calloc(1uLL, 0x20uLL, 0x1010040BA4D407CuLL);
  if (!v14)
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  v15 = (unint64_t)v14;
  v16 = *(_QWORD *)(v8 + 24);
  v17 = (char *)malloc_type_calloc(v16, 1uLL, 0x100004077774924uLL);
  if (v17 > &v17[v16])
    goto LABEL_22;
  v18 = v17;
  if (!v17)
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  if (v16 > *(_QWORD *)(v8 + 24))
    goto LABEL_22;
  memcpy(v17, *(const void **)v8, v16);
  *(_QWORD *)(v15 + 16) = v16;
  *(_QWORD *)(v15 + 24) = 0;
  *(_QWORD *)v15 = v9;
  *(_QWORD *)(v15 + 8) = v18;
  if (v15 >= v15 + 32)
    goto LABEL_22;
  tb_list_add(v10, v9, v15, &__block_literal_global_8);
  tx_buffer_size = tb_transport_get_tx_buffer_size(transport);
  result = _tb_message_reset(a3, (_DWORD *)a1, 1, tx_buffer_size, 0);
  if ((_DWORD)result)
    return result;
  v20 = (_QWORD *)tb_message_get_transport_buffer(a1);
  if (tx_buffer_size > *(_QWORD *)(v15 + 16)
    || (v21 = v20, v22 = *v20, v23 = *v20 + v20[3], v24 = (void *)(*v20 + v20[4]), (unint64_t)v24 > v23)
    || v22 > (unint64_t)v24
    || tx_buffer_size > v23 - (unint64_t)v24)
  {
LABEL_22:
    __break(0x5519u);
    goto LABEL_23;
  }
  memcpy(v24, *(const void **)(v15 + 8), tx_buffer_size);
  v21[2] += tx_buffer_size;
  *(_QWORD *)(v15 + 24) += tx_buffer_size;
  *((_WORD *)v21 + 21) |= 1u;
  *a2 = a1;
  tb_message_complete(a1);
  return 0;
}

uint64_t tb_reply_splitter_next_message(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  pthread_mutex_t *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t tx_buffer_size;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  __int16 v17;
  char *v18;

  if (*(_BYTE *)(tb_message_get_transport_buffer(a2) + 40))
    return 2;
  v8 = (pthread_mutex_t *)atomic_load(&reply_list);
  if (!v8)
    return 14;
  v9 = tb_list_find(v8, *(_QWORD *)(a2 + 24));
  if (!v9)
    return 14;
  v10 = (_QWORD *)v9;
  tx_buffer_size = tb_transport_get_tx_buffer_size(a4);
  v12 = v10[3];
  v13 = v12 + tx_buffer_size;
  if (__CFADD__(v12, tx_buffer_size))
    tb_reply_splitter_next_message_cold_1();
  v14 = v10[2];
  v15 = v14 - v12;
  if (v13 >= v14)
    v16 = v15;
  else
    v16 = tx_buffer_size;
  result = _tb_message_reset(a1, (_DWORD *)a2, 1, v16, 0);
  if (!(_DWORD)result)
  {
    result = tb_message_get_transport_buffer(a2);
    if (v13 < v14)
      v17 = 1;
    else
      v17 = 3;
    *(_WORD *)(result + 42) = v17;
    v18 = (char *)(v10[1] + v10[3]);
    if (v18 > &v18[v16] || v16 > *(_QWORD *)(result + 24))
    {
      __break(0x5519u);
    }
    else
    {
      memcpy(*(void **)result, v18, v16);
      v10[3] += v16;
      tb_message_complete(a2);
      if (v13 < v14)
        return 0;
      result = atomic_load(&reply_list);
      if (result)
      {
        tb_list_remove((pthread_mutex_t *)result, *(_QWORD *)(a2 + 24));
        return 0;
      }
    }
  }
  return result;
}

void ___reply_list_add_block_invoke(uint64_t a1, void **a2)
{
  free(a2[1]);
  free(a2);
}

void *tb_transport_set_message_handler(uint64_t a1, void *aBlock)
{
  void *result;

  result = _Block_copy(aBlock);
  *(_QWORD *)(a1 + 72) = result;
  return result;
}

uint64_t tb_transport_set_message_handler_f(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(result + 80) = a2;
  *(_QWORD *)(result + 88) = a3;
  return result;
}

uint64_t tb_transport_call_message_handler(_QWORD *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t (*v4)(uint64_t, _QWORD);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v4 = (uint64_t (*)(uint64_t, _QWORD))a1[10];
  if (v4)
  {
    v5 = v4(a2, a1[11]);
LABEL_5:
    v7 = v5;
    result = 0;
    *a3 = v7;
    return result;
  }
  v6 = a1[9];
  if (v6)
  {
    v5 = (*(uint64_t (**)(void))(v6 + 16))();
    goto LABEL_5;
  }
  return 4;
}

void tb_transport_destruct(uint64_t a1)
{
  const void *v2;
  void (*v3)(uint64_t);

  v2 = *(const void **)(a1 + 72);
  if (v2)
    _Block_release(v2);
  v3 = *(void (**)(uint64_t))(a1 + 64);
  if (v3)
    v3(a1);
}

uint64_t tb_transport_message_buffer_wrap_buffer(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)result = a2;
  *(_BYTE *)(result + 8) = 1;
  *(_QWORD *)(result + 16) = 0;
  *(_QWORD *)(result + 24) = a3;
  *(_QWORD *)(result + 32) = 0;
  *(_QWORD *)(result + 48) = 0;
  return result;
}

uint64_t tb_transport_supports_multipart_messages(uint64_t a1)
{
  uint64_t (*v1)(void);

  v1 = *(uint64_t (**)(void))(a1 + 48);
  if (v1)
    return v1();
  else
    return 0;
}

uint64_t tb_transport_get_tx_buffer_size(uint64_t a1)
{
  uint64_t (*v1)(void);

  v1 = *(uint64_t (**)(void))(a1 + 56);
  if (v1)
    return v1();
  else
    return 0;
}

double tb_transport_initialize_message_buffer(uint64_t a1)
{
  double result;

  *(_BYTE *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  *(_DWORD *)(a1 + 40) = 0;
  result = 0.0;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 16) = 0;
  return result;
}

uint64_t tb_transport_reset_message_buffer(uint64_t result)
{
  *(_BYTE *)(result + 8) = 0;
  *(_QWORD *)(result + 16) = 0;
  *(_QWORD *)(result + 32) = 0;
  *(_WORD *)(result + 42) = 0;
  *(_BYTE *)(result + 40) = 0;
  return result;
}

_QWORD *tb_transport_message_buffer_deep_copy(_QWORD *result, uint64_t a2)
{
  size_t v2;
  _QWORD *v4;
  unint64_t v5;

  v2 = *(_QWORD *)(a2 + 24);
  if (v2 > result[3]
    || (v4 = result, result = memcpy((void *)*result, *(const void **)a2, v2), v5 = *(_QWORD *)(a2 + 24), v5 > v4[3]))
  {
    __break(0x5519u);
  }
  else
  {
    *((_BYTE *)v4 + 8) = *(_BYTE *)(a2 + 8);
    v4[2] = *(_QWORD *)(a2 + 16);
    v4[3] = v5;
    v4[4] = *(_QWORD *)(a2 + 32);
    *((_DWORD *)v4 + 10) = *(_DWORD *)(a2 + 40);
  }
  return result;
}

uint64_t tb_component_capability(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (a3 >= a2 || a1 == 0)
    return 0;
  else
    return a1 + a3;
}

uint64_t tb_component_admission_search_multiple()
{
  return 1;
}

_BYTE *tb_forwarding_connection_create_with_endpoint_options(unsigned int *a1, unsigned int *a2, char a3, const void *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;

  _tb_connection_create_transport_for_endpoint(a1, 1);
  v9 = v8;
  _tb_connection_create_transport_for_endpoint(a2, 0);
  v11 = _tb_forwarding_connection_create(v9, v10, a3, a4);
  tb_endpoint_destruct(a1);
  tb_endpoint_destruct(a2);
  return v11;
}

_BYTE *_tb_forwarding_connection_create(uint64_t a1, uint64_t a2, char a3, const void *a4)
{
  _BYTE *result;
  _BYTE *v9;
  _QWORD *v10;
  void *v11;
  _QWORD v12[6];

  result = malloc_type_calloc(1uLL, 0x18uLL, 0x1020040984C81BBuLL);
  if (!result)
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  v9 = result;
  if ((a3 & 1) != 0)
    *result = 1;
  if (result >= result + 24)
  {
    __break(0x5519u);
  }
  else
  {
    v10 = _tb_connection_create(a1);
    v11 = _Block_copy(a4);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 0x40000000;
    v12[2] = ___tb_service_connection_create_forward_block_invoke;
    v12[3] = &unk_2519B2B48;
    v12[4] = v11;
    v12[5] = v9;
    tb_transport_set_message_handler(a1, v12);
    *((_QWORD *)v9 + 1) = v10;
    *((_QWORD *)v9 + 2) = tb_client_connection_create(a2);
    return v9;
  }
  return result;
}

_BYTE *tb_forwarding_connection_create(uint64_t a1, uint64_t a2, const void *a3)
{
  return _tb_forwarding_connection_create(a1, a2, 0, a3);
}

_BYTE *tb_forwarding_connection_create_with_endpoint(unsigned int *a1, unsigned int *a2, const void *a3)
{
  return tb_forwarding_connection_create_with_endpoint_options(a1, a2, 0, a3);
}

uint64_t tb_forwarding_connection_activate(uint64_t a1)
{
  uint64_t result;

  result = tb_client_connection_activate(*(uint64_t **)(a1 + 16));
  if (!(_DWORD)result)
    return tb_service_connection_activate(*(uint64_t **)(a1 + 8));
  return result;
}

void tb_forwarding_connection_destruct(uint64_t a1)
{
  _tb_connection_destruct(*(uint64_t **)(a1 + 8));
  _tb_connection_destruct(*(uint64_t **)(a1 + 16));
}

_DWORD *___tb_service_connection_create_forward_block_invoke(uint64_t a1, _DWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t transport_buffer;
  uint64_t transport;
  unint64_t *v7;
  unint64_t *v8;
  unint64_t *v9;
  _DWORD *v10;
  uint64_t v11;

  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, _DWORD *, uint64_t))(v4 + 16))(v4, v3, a2, 1))
  {
    tb_message_complete((uint64_t)a2);
    return 0;
  }
  transport_buffer = tb_message_get_transport_buffer((uint64_t)a2);
  *(_QWORD *)(transport_buffer + 16) = *(_QWORD *)(transport_buffer + 24);
  transport = tb_connection_get_transport(*(_QWORD *)(v3 + 16));
  if (transport == tb_connection_get_transport(*(_QWORD *)(v3 + 8)))
  {
    v7 = 0;
    v9 = 0;
  }
  else
  {
    v7 = (unint64_t *)tb_message_get_transport_buffer((uint64_t)a2);
    v8 = (unint64_t *)malloc_type_calloc(1uLL, 0x68uLL, 0x1090040B6685729uLL);
    if (!v8)
      _tb_afk_common_transport_construct_message_buffer_cold_1();
    v9 = v8;
    v10 = 0;
    if ((*(unsigned int (**)(unint64_t, _QWORD, unint64_t *))(transport + 24))(v7[2] - v7[4], 0, v8))
    {
      goto LABEL_18;
    }
  }
  if (_tb_forwarding_connection_message_forward(v3, a2, v9, 1))
    goto LABEL_15;
  if (*(_BYTE *)v3 || !(*(unsigned int (**)(uint64_t, uint64_t, _DWORD *, _QWORD))(v4 + 16))(v4, v3, a2, 0))
  {
    tb_message_set_transport_buffer((uint64_t)a2, (uint64_t)v7);
LABEL_15:
    v10 = 0;
    goto LABEL_16;
  }
  v11 = tb_message_get_transport_buffer((uint64_t)a2);
  *(_QWORD *)(v11 + 16) = *(_QWORD *)(v11 + 24);
  if (_tb_forwarding_connection_message_forward(v3, a2, v7, 0))
    v10 = 0;
  else
    v10 = a2;
LABEL_16:
  if (v9)
  {
    (*(void (**)(unint64_t *))(transport + 32))(v9);
LABEL_18:
    free(v9);
  }
  return v10;
}

unint64_t _tb_forwarding_connection_message_forward(uint64_t a1, _DWORD *a2, unint64_t *a3, int a4)
{
  uint64_t v8;
  uint64_t transport;
  uint64_t v10;
  uint64_t transport_buffer;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  unint64_t result;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  const void *v23;
  unint64_t v24;
  char v25;
  _DWORD *v26;

  v26 = a2;
  v8 = 16;
  if (a4)
    v8 = 8;
  transport = tb_connection_get_transport(*(_QWORD *)(a1 + v8));
  if (*a2 != 4)
    tb_message_decode_BOOL_cold_4();
  v10 = transport;
  transport_buffer = tb_message_get_transport_buffer((uint64_t)a2);
  v12 = (_QWORD *)transport_buffer;
  if (a3 && a3[2] < a3[4])
    _tb_forwarding_connection_message_forward_cold_3();
  v13 = *(_QWORD *)(transport_buffer + 16);
  v14 = *(_QWORD *)(transport_buffer + 32);
  if (a4)
    v15 = (uint64_t *)(a1 + 16);
  else
    v15 = (uint64_t *)(a1 + 8);
  v16 = tb_connection_get_transport(*v15);
  result = 9;
  if (a3)
  {
    if (v10 != v16)
    {
      v18 = v13 - v14;
      if ((a4 & 1) != 0
        || (v19 = tb_connection_get_transport(*(_QWORD *)(a1 + 8)),
            tb_transport_reset_message_buffer((uint64_t)a3),
            result = (*(uint64_t (**)(unint64_t *, _QWORD, uint64_t))(v19 + 40))(a3, 0, v13 - v14),
            !(_DWORD)result))
      {
        v20 = a3[2];
        if (__CFADD__(v20, v18))
          _tb_forwarding_connection_message_forward_cold_1();
        v21 = a3[3];
        if (v20 + v18 > v21)
          _tb_forwarding_connection_message_forward_cold_2();
        v22 = *v12 + v12[3];
        v23 = (const void *)(*v12 + v12[4]);
        if (v22 < (unint64_t)v23
          || *v12 > (unint64_t)v23
          || v18 > v22 - (unint64_t)v23
          || (v24 = *a3 + v21, result = *a3 + v20, result > v24)
          || *a3 > result
          || v18 > v24 - result)
        {
          __break(0x5519u);
        }
        else
        {
          memcpy((void *)result, v23, v13 - v14);
          a3[2] += v18;
          tb_message_set_transport_buffer((uint64_t)a2, (uint64_t)a3);
          tb_message_complete((uint64_t)a2);
          tb_message_set_state(a2, 2);
          if (a4)
            v25 = 1;
          else
            v25 = 2;
          tb_message_set_disposition((uint64_t)a2, v25);
          tb_message_set_connection_identifier((uint64_t)a2, *(_QWORD *)(a1 + 16));
          if (!a4)
            return 0;
          result = tb_connection_send_query(*(uint64_t **)(a1 + 16), (uint64_t)a2, (uint64_t *)&v26, 2 * (*(_BYTE *)a1 == 0));
          if (!(_DWORD)result)
            return 0;
        }
      }
    }
  }
  return result;
}

void *tb_alloc_message()
{
  void *result;

  result = malloc_type_calloc(1uLL, 0x58uLL, 0x102004071D150F8uLL);
  if (!result)
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  return result;
}

void *tb_alloc_transport_message_buffer()
{
  void *result;

  result = malloc_type_calloc(1uLL, 0x68uLL, 0x1090040B6685729uLL);
  if (!result)
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  return result;
}

uint64_t tb_unix_transport_construct_message_buffer(size_t a1, uint64_t a2, uint64_t a3)
{
  char *v5;

  v5 = (char *)malloc_type_calloc(a1, 1uLL, 0x100004077774924uLL);
  if (v5 > &v5[a1])
  {
    __break(0x5519u);
LABEL_5:
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  }
  if (!v5)
    goto LABEL_5;
  *(_QWORD *)a3 = v5;
  *(_BYTE *)(a3 + 8) = 0;
  *(_QWORD *)(a3 + 16) = 0;
  *(_QWORD *)(a3 + 24) = a1;
  *(_QWORD *)(a3 + 32) = 0;
  *(_QWORD *)(a3 + 48) = 0;
  *(_BYTE *)(a3 + 41) = 0;
  return 0;
}

void tb_unix_transport_destruct_message_buffer(uint64_t a1)
{
  free(*(void **)a1);
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_BYTE *)(a1 + 41) = 1;
}

uint64_t tb_unix_transport_message_buffer_reset(uint64_t a1, uint64_t a2, size_t a3)
{
  uint64_t v5;

  free(*(void **)a1);
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  return tb_unix_transport_construct_message_buffer(a3, v5, a1);
}

_OWORD *tb_unix_client_transport_create_with_endpoint(uint64_t a1)
{
  _OWORD *v2;
  _OWORD *v3;
  __int128 v4;
  __int128 v5;

  v2 = malloc_type_calloc(1uLL, 0xE8uLL, 0x1082040EFE8DF71uLL);
  if (!v2)
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  v3 = v2;
  v4 = unk_2544619C8;
  v2[2] = xmmword_2544619B8;
  v2[3] = v4;
  *((_QWORD *)v2 + 8) = off_2544619D8;
  v5 = *(_OWORD *)&off_2544619A8;
  *v2 = _tb_unix_client_transport_vtable;
  v2[1] = v5;
  *((_QWORD *)v2 + 12) = _tb_unix_client_transport_create_with_endpoint(a1);
  return v3;
}

_OWORD *tb_unix_service_transport_create_with_endpoint(uint64_t a1)
{
  _OWORD *v2;
  _OWORD *v3;
  __int128 v4;
  __int128 v5;

  v2 = malloc_type_calloc(1uLL, 0xE8uLL, 0x1082040EFE8DF71uLL);
  if (!v2)
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  v3 = v2;
  v4 = unk_254461A10;
  v2[2] = xmmword_254461A00;
  v2[3] = v4;
  *((_QWORD *)v2 + 8) = off_254461A20;
  v5 = *(_OWORD *)&off_2544619F0;
  *v2 = _tb_unix_service_transport_vtable;
  v2[1] = v5;
  *((_QWORD *)v2 + 12) = _tb_unix_service_transport_create_with_endpoint(a1);
  return v3;
}

char *_make_node(uint64_t a1, uint64_t a2, const void *a3)
{
  char *v6;
  char *v7;
  char *v8;
  char *result;

  v6 = (char *)malloc_type_calloc(1uLL, 0x20uLL, 0x10A004062D90B2CuLL);
  if (!v6)
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  v7 = v6;
  v8 = v6 + 32;
  *((_QWORD *)v6 + 1) = a1;
  *((_QWORD *)v6 + 2) = a2;
  result = (char *)_Block_copy(a3);
  *((_QWORD *)v7 + 3) = result;
  if (v7 < v8)
    return v7;
  __break(0x5519u);
  return result;
}

uint64_t _iterate_list(pthread_mutex_t *a1, uint64_t a2)
{
  _QWORD *sig;
  char v6;

  pthread_mutex_lock(a1);
  sig = (_QWORD *)a1[1].__sig;
  if (sig)
  {
    v6 = 0;
    do
    {
      (*(void (**)(uint64_t, _QWORD *, char *))(a2 + 16))(a2, sig, &v6);
      if (v6)
        break;
      sig = (_QWORD *)*sig;
    }
    while (sig);
  }
  return pthread_mutex_unlock(a1);
}

uint64_t tb_list_clear(pthread_mutex_t *a1)
{
  _QWORD *sig;
  _QWORD *v3;

  pthread_mutex_lock(a1);
  sig = (_QWORD *)a1[1].__sig;
  if (sig)
  {
    do
    {
      v3 = (_QWORD *)*sig;
      (*(void (**)(void))(sig[3] + 16))();
      free(sig);
      sig = v3;
    }
    while (v3);
    a1[1].__sig = 0;
  }
  return pthread_mutex_unlock(a1);
}

pthread_mutex_t *tb_list_create()
{
  pthread_mutex_t *v0;
  pthread_mutex_t *v1;

  v0 = (pthread_mutex_t *)malloc_type_calloc(1uLL, 0x48uLL, 0x1020040C6685353uLL);
  if (!v0)
    _tb_afk_common_transport_construct_message_buffer_cold_1();
  v1 = v0;
  pthread_mutex_init(v0, 0);
  return v1;
}

void tb_list_free(pthread_mutex_t *a1)
{
  pthread_mutex_destroy(a1);
  free(a1);
}

uint64_t tb_list_add(pthread_mutex_t *a1, uint64_t a2, uint64_t a3, const void *a4)
{
  char *node;
  char *sig;
  char **v8;
  uint64_t v9;

  node = _make_node(a2, a3, a4);
  pthread_mutex_lock(a1);
  sig = (char *)a1[1].__sig;
  if (sig)
  {
    while (1)
    {
      v8 = (char **)sig;
      if (*((_QWORD *)sig + 1) == a2)
        break;
      sig = *(char **)sig;
      if (!*v8)
      {
        *v8 = node;
        goto LABEL_6;
      }
    }
    free(node);
    v9 = 0;
  }
  else
  {
    a1[1].__sig = (uint64_t)node;
LABEL_6:
    v9 = 1;
  }
  pthread_mutex_unlock(a1);
  return v9;
}

uint64_t tb_list_remove(pthread_mutex_t *a1, uint64_t a2)
{
  pthread_mutex_t *v4;
  pthread_mutex_t *sig;

  pthread_mutex_lock(a1);
  v4 = a1 + 1;
  sig = (pthread_mutex_t *)a1[1].__sig;
  while (*(_QWORD *)sig->__opaque != a2)
  {
    v4 = sig;
    sig = (pthread_mutex_t *)sig->__sig;
    if (!sig)
      return pthread_mutex_unlock(a1);
  }
  v4->__sig = sig->__sig;
  (*(void (**)(void))(*(_QWORD *)&sig->__opaque[16] + 16))();
  free(sig);
  return pthread_mutex_unlock(a1);
}

uint64_t tb_list_find(pthread_mutex_t *a1, uint64_t a2)
{
  _QWORD *sig;
  _QWORD *v5;
  unint64_t v6;
  _QWORD *v7;
  uint64_t result;

  pthread_mutex_lock(a1);
  sig = (_QWORD *)a1[1].__sig;
  if (!sig)
  {
    pthread_mutex_unlock(a1);
    return 0;
  }
  v5 = 0;
  v6 = 0;
  v7 = 0;
  do
  {
    if (sig[1] == a2)
    {
      v7 = sig;
      v6 = (unint64_t)(sig + 4);
      v5 = sig;
    }
    sig = (_QWORD *)*sig;
  }
  while (sig);
  result = pthread_mutex_unlock(a1);
  if (!v5)
    return 0;
  if ((unint64_t)(v5 + 4) <= v6 && v7 <= v5)
    return v5[2];
  __break(0x5519u);
  return result;
}

uint64_t tb_list_count(pthread_mutex_t *a1)
{
  uint64_t v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2000000000;
  v7 = 0;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 0x40000000;
  v3[2] = __tb_list_count_block_invoke;
  v3[3] = &unk_2519B2B70;
  v3[4] = &v4;
  _iterate_list(a1, (uint64_t)v3);
  v1 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v1;
}

uint64_t __tb_list_count_block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

uint64_t static Conclave.service<A>(for:as:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  int v11;
  _DWORD *v12;
  uint64_t result;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v7 = type metadata accessor for TightbeamEndpoint();
  MEMORY[0x24BDAC7A8](v7);
  v9 = (_QWORD *)((char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v14[0] = 0;
  v10 = sub_2489A822C();
  v11 = tb_conclave_identifier_for_service(v10 + 32, v14);
  swift_release();
  if (v11)
  {
    type metadata accessor for TransportError(0);
    sub_248988A58((unint64_t *)&qword_2577A3A50, (uint64_t (*)(uint64_t))type metadata accessor for TransportError, (uint64_t)&protocol conformance descriptor for tb_error_t);
    swift_allocError();
    *v12 = v11;
    return swift_willThrow();
  }
  else if ((v14[0] & 0x8000000000000000) != 0)
  {
    result = sub_2489A8400();
    __break(1u);
  }
  else
  {
    *v9 = v14[0];
    swift_storeEnumTagMultiPayload();
    return (*(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(a5 + 8))(v9, a4, a5);
  }
  return result;
}

void type metadata accessor for TransportError(uint64_t a1)
{
  sub_2489891D8(a1, &qword_2577A3A88);
}

ValueMetadata *type metadata accessor for Conclave()
{
  return &type metadata for Conclave;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

void type metadata accessor for tb_connection_s(uint64_t a1)
{
  sub_2489891D8(a1, &qword_2577A3A58);
}

uint64_t initializeBufferWithCopyOfBuffer for BumpBuffer(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy88_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __n128 result;
  __int128 v4;
  __int128 v5;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  result = *(__n128 *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t sub_2489884AC(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 88))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_2489884CC(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = (a2 - 1);
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 88) = v3;
  return result;
}

void type metadata accessor for tb_message_s(uint64_t a1)
{
  sub_2489891D8(a1, &qword_2577A3A60);
}

__n128 __swift_memcpy232_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __n128 result;
  __int128 v11;
  __int128 v12;

  v2 = *a2;
  v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  v4 = a2[3];
  v5 = a2[4];
  v6 = a2[6];
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  v7 = a2[7];
  v8 = a2[8];
  v9 = a2[10];
  *(_OWORD *)(a1 + 144) = a2[9];
  *(_OWORD *)(a1 + 160) = v9;
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 128) = v8;
  result = (__n128)a2[11];
  v11 = a2[12];
  v12 = a2[13];
  *(_QWORD *)(a1 + 224) = *((_QWORD *)a2 + 28);
  *(_OWORD *)(a1 + 192) = v11;
  *(_OWORD *)(a1 + 208) = v12;
  *(__n128 *)(a1 + 176) = result;
  return result;
}

void type metadata accessor for tb_transport_s(uint64_t a1)
{
  sub_2489891D8(a1, &qword_2577A3A68);
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t sub_248988594(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && a1[24])
    return (*(_DWORD *)a1 + 255);
  v3 = *a1;
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t sub_2489885E8(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 24) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 1;
  }
  return result;
}

void type metadata accessor for tb_forwarding_connection_s(uint64_t a1)
{
  sub_2489891D8(a1, &qword_2577A3A70);
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
  sub_2489891D8(a1, &qword_2577A3A78);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for EndpointTuple(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for EndpointTuple(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for tb_darwin_transport_endpoint_s(uint64_t a1)
{
  sub_2489891D8(a1, &qword_2577A3A80);
}

_DWORD *sub_2489886BC@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(_BYTE *)(a2 + 4) = 0;
  return result;
}

void sub_2489886CC(_DWORD *a1@<X8>)
{
  _DWORD *v1;

  *a1 = *v1;
}

uint64_t sub_2489886D8(uint64_t a1, uint64_t a2)
{
  return sub_248988820(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_2489886E4(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_2489A81FC();
  *a2 = 0;
  return result;
}

uint64_t sub_248988758(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_2489A8208();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_2489887D4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_2489A8214();
  v2 = sub_2489A81F0();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_248988814(uint64_t a1, uint64_t a2)
{
  return sub_248988820(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_248988820(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_2489A8214();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_24898885C()
{
  sub_2489A8214();
  sub_2489A8250();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24898889C()
{
  uint64_t v0;

  sub_2489A8214();
  sub_2489A84D8();
  sub_2489A8250();
  v0 = sub_2489A84FC();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_24898890C()
{
  sub_2489A84D8();
  sub_2489A81D8();
  return sub_2489A84FC();
}

uint64_t sub_24898896C()
{
  sub_248988A58(&qword_2577A3A98, (uint64_t (*)(uint64_t))type metadata accessor for TransportError, (uint64_t)&protocol conformance descriptor for tb_error_t);
  return sub_2489A7EC0();
}

uint64_t sub_2489889BC()
{
  sub_2489A84D8();
  sub_2489A81D8();
  return sub_2489A84FC();
}

BOOL sub_248988A18(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_248988A2C()
{
  return sub_248988A58(&qword_2577A3A90, (uint64_t (*)(uint64_t))type metadata accessor for TransportError, (uint64_t)&unk_2489A8C60);
}

uint64_t sub_248988A58(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2495A1154](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_248988A98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_2489A8214();
  v2 = v1;
  if (v0 == sub_2489A8214() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_2489A846C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_248988B20@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_2489A81F0();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_248988B64@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_2489A8214();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_248988B8C()
{
  sub_248988A58(&qword_2577A3AF0, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_2489A8F78);
  sub_248988A58(&qword_2577A3AF8, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_2489A8ECC);
  return sub_2489A8454();
}

void type metadata accessor for FileAttributeKey(uint64_t a1)
{
  sub_2489891D8(a1, &qword_2544607A0);
}

uint64_t getEnumTagSinglePayload for ComponentRuntime.Configuration(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for ComponentRuntime.Configuration(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 32) = v3;
  return result;
}

void type metadata accessor for tb_connection_s.__Unnamed_union___Anonymous_field0(uint64_t a1)
{
  sub_2489891D8(a1, &qword_2577A3AA0);
}

void type metadata accessor for MessageDisposition(uint64_t a1)
{
  sub_2489891D8(a1, &qword_2577A3AA8);
}

void type metadata accessor for MessageState(uint64_t a1)
{
  sub_2489891D8(a1, &qword_2577A3AB0);
}

uint64_t sub_248988CAC(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 232))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_248988CCC(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = (a2 - 1);
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 232) = v3;
  return result;
}

void type metadata accessor for tb_transport_s.__Unnamed_union___Anonymous_field0(uint64_t a1)
{
  sub_2489891D8(a1, &qword_2577A3AB8);
}

__n128 __swift_memcpy104_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __n128 result;
  __int128 v5;
  __int128 v6;

  v2 = *a2;
  v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  result = (__n128)a2[3];
  v5 = a2[4];
  v6 = a2[5];
  *(_QWORD *)(a1 + 96) = *((_QWORD *)a2 + 12);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t sub_248988D70(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 104))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 8);
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t sub_248988DC4(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 104) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 104) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = a2 + 1;
  }
  return result;
}

void type metadata accessor for tb_transport_message_buffer_s(uint64_t a1)
{
  sub_2489891D8(a1, &qword_2577A3AC0);
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t sub_248988E48(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_248988E90(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for tb_component_handler_vtable_s(uint64_t a1)
{
  sub_2489891D8(a1, &qword_2577A3AC8);
}

uint64_t sub_248988EEC(uint64_t a1, int a2)
{
  int v3;

  if (!a2)
    return 0;
  if (a2 != 1 && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 2);
  if (*(_QWORD *)a1)
    v3 = -1;
  else
    v3 = 0;
  return (v3 + 1);
}

uint64_t sub_248988F30(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 2;
    if (a3 >= 2)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if (a3 >= 2)
      *(_BYTE *)(result + 24) = 0;
    if (a2)
      *(_QWORD *)result = 0;
  }
  return result;
}

void type metadata accessor for tb_component_admission_table_s(uint64_t a1)
{
  sub_2489891D8(a1, &qword_2577A3AD0);
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t sub_248988F98(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_248988FE0(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 48) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for tb_component_vtable_s(uint64_t a1)
{
  sub_2489891D8(a1, &qword_2577A3AD8);
}

uint64_t sub_248989040()
{
  return sub_248988A58(&qword_2577A3AE0, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_2489A8E90);
}

uint64_t sub_24898906C()
{
  return sub_248988A58(&qword_2577A3AE8, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_2489A8E64);
}

uint64_t sub_248989098()
{
  return sub_248988A58(qword_2544607A8, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_2489A8F00);
}

uint64_t getEnumTagSinglePayload for BumpBuffer(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 48))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for BumpBuffer(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = (a2 - 1);
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 48) = v3;
  return result;
}

void type metadata accessor for tb_transport_message_buffer_opaque_data_s(uint64_t a1)
{
  sub_2489891D8(a1, &qword_2577A3B00);
}

void type metadata accessor for tb_transport_flags_t(uint64_t a1)
{
  sub_2489891D8(a1, &qword_2577A3B08);
}

uint64_t sub_248989144(uint64_t a1, int a2)
{
  int v3;

  if (!a2)
    return 0;
  if (a2 != 1 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 2);
  if (*(_QWORD *)(a1 + 8))
    v3 = -1;
  else
    v3 = 0;
  return (v3 + 1);
}

uint64_t sub_248989188(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(_QWORD *)result = a2 - 2;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 2)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 2)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = 0;
  }
  return result;
}

void type metadata accessor for tb_component_admission_list_s(uint64_t a1)
{
  sub_2489891D8(a1, &qword_2577A3B10);
}

void sub_2489891D8(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

uint64_t dispatch thunk of TightbeamServiceInitProtocol.init(endpoint:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

const mach_header_64 *sub_248989238@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  const mach_header_64 *result;
  int v7;
  uint32_t v8;
  const mach_header_64 *v9;
  unsigned __int8 *v10;
  int v11;
  uint64_t v12;
  unsigned __int8 *v14;
  uint64_t v15;
  unsigned __int8 *v16;
  int v17;
  int v18;
  int v19;
  unint64_t v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  result = (const mach_header_64 *)_dyld_image_count();
  if ((_DWORD)result)
  {
    v7 = (int)result;
    v8 = 0;
    while (1)
    {
      result = (const mach_header_64 *)_dyld_get_image_header(v8);
      if (result)
      {
        v20[0] = 0;
        result = (const mach_header_64 *)getsectiondata(result, "__DATA", "__TIGHTBEAM", v20);
        if (result)
        {
          if ((uint64_t)v20[0] >= 8)
            break;
        }
      }
LABEL_3:
      if (++v8 == v7)
        goto LABEL_25;
    }
    v9 = (const mach_header_64 *)((char *)result + (v20[0] & 0xFFFFFFFFFFFFFFF8));
    while (1)
    {
      v10 = **(unsigned __int8 ***)&result->magic;
      v11 = *v10;
      if (!*v10)
        goto LABEL_8;
      if (v10[1])
        break;
      if (a2 == 1 && v11 == *a1)
      {
LABEL_24:
        *a3 = *(_QWORD *)&result->magic;
        return result;
      }
LABEL_9:
      result = (const mach_header_64 *)((char *)result + 8);
      if (result == v9)
        goto LABEL_3;
    }
    v12 = 0;
    while (v12 != 1022)
    {
      if (!v10[v12++ + 2])
      {
        if (a2 - 1 != v12 || v11 != *a1 || v10[1] != a1[1])
          goto LABEL_9;
        v14 = v10 + 2;
        v15 = a2 - 2;
        v16 = a1 + 2;
        while (v15)
        {
          v18 = *v14++;
          v17 = v18;
          v19 = *v16++;
          --v15;
          if (v17 != v19)
            goto LABEL_9;
        }
        goto LABEL_24;
      }
    }
LABEL_8:
    if (!a2)
      goto LABEL_24;
    goto LABEL_9;
  }
LABEL_25:
  *a3 = 0;
  return result;
}

uint64_t sub_2489893DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_2489895D4(a1, a2, a3, a4, a5, sub_24898CF40, sub_24898CEC4);
}

uint64_t sub_2489893F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24898940C(a1, a2, a3, sub_24898CF40, sub_24898CEC4);
}

uint64_t sub_24898940C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD, uint64_t, uint64_t, uint64_t), uint64_t (*a5)(_QWORD, uint64_t, uint64_t, uint64_t))
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;

  if (a1 < 0)
    goto LABEL_20;
  v9 = a3 - a2;
  if (a2)
    v10 = a3 - a2;
  else
    v10 = 0;
  v11 = a4(0, v10, a2, a3);
  if (a1 && (v11 & 0x8000000000000000) == 0 && v11 < a1)
  {
    result = v9;
    if (!a2)
      return 0;
LABEL_11:
    v13 = v9;
    if (v9 >= result)
      goto LABEL_12;
    goto LABEL_19;
  }
  result = a5(0, a1, a2, a3);
  if (a2)
    goto LABEL_11;
  v13 = 0;
  if (result > 0)
  {
LABEL_19:
    sub_2489A8400();
    __break(1u);
LABEL_20:
    sub_2489A8400();
    __break(1u);
    goto LABEL_21;
  }
LABEL_12:
  if (result < 0)
    goto LABEL_21;
  if (a2)
  {
    if (v9 >= v13)
      return result;
LABEL_21:
    result = sub_2489A8448();
    __break(1u);
    return result;
  }
  if (v13 >= 1)
    goto LABEL_21;
  return result;
}

uint64_t sub_2489895D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t, uint64_t, uint64_t), uint64_t (*a7)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v13;
  uint64_t v14;
  uint64_t result;

  if ((a1 & 0x8000000000000000) == 0)
  {
    v13 = a6(a2, a3, a4, a5);
    if (!a1 || (v14 = v13, v13 < 0) || (result = a3, v14 >= a1))
    {
      result = a7(a2, a1, a4, a5);
      if (result > a3)
        goto LABEL_8;
    }
    if (result >= a2)
      return result;
  }
  sub_2489A8400();
  __break(1u);
LABEL_8:
  result = sub_2489A8400();
  __break(1u);
  return result;
}

uint64_t sub_248989748(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t result;

  if (a1 < 0)
  {
    sub_2489A8400();
    __break(1u);
  }
  else
  {
    v2 = *(_QWORD *)(a2 + 16);
    if ((uint64_t)v2 >= a1)
      v3 = a1;
    else
      v3 = *(_QWORD *)(a2 + 16);
    if (a1)
      v4 = v3;
    else
      v4 = 0;
    if (v2 >= v4)
      return a2;
  }
  result = sub_2489A8400();
  __break(1u);
  return result;
}

uint64_t ComponentRuntime.Configuration.numEndpoints.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t ComponentRuntime.Configuration.numComponents.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t ComponentRuntime.Configuration.numClients.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t ComponentRuntime.Configuration.numTypes.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 24);
}

Tightbeam::ComponentRuntime::Configuration __swiftcall ComponentRuntime.Configuration.init(numEndpoints:numComponents:numClients:numTypes:)(Swift::Int numEndpoints, Swift::Int numComponents, Swift::Int numClients, Swift::Int numTypes)
{
  Swift::Int *v4;
  Tightbeam::ComponentRuntime::Configuration result;

  *v4 = numEndpoints;
  v4[1] = numComponents;
  v4[2] = numClients;
  v4[3] = numTypes;
  result.numTypes = numTypes;
  result.numClients = numClients;
  result.numComponents = numComponents;
  result.numEndpoints = numEndpoints;
  return result;
}

uint64_t sub_248989850(unsigned __int8 *a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  unsigned __int8 *v15;
  unint64_t v16;
  unsigned __int8 *v17;
  uint64_t v18;
  int v19;
  int v20;
  int v21;

  v3 = *(uint64_t **)(*(_QWORD *)(v2 + 32) + 40);
  if (!v3)
    return 0;
  v4 = *v3;
  if (*v3 < 0)
  {
    __break(1u);
LABEL_32:
    result = sub_2489A8448();
    __break(1u);
    return result;
  }
  if (!v4)
    return 0;
  result = 0;
  v7 = v3[1];
  v8 = 3;
  if (a2 > 3)
    v8 = a2;
  v9 = v8 - 3;
  while (1)
  {
    v10 = **(unsigned __int8 ***)(v7 + 8 * result);
    v11 = *v10;
    if (*v10)
    {
      if (!v10[1])
      {
        if (a2 == 1 && v11 == *a1)
          return result;
        goto LABEL_7;
      }
      v12 = 2;
      while (v12 != 1024)
      {
        v13 = v12 + 1;
        if (!v10[v12++])
        {
          if (v13 - 1 != a2)
            goto LABEL_7;
          goto LABEL_16;
        }
      }
    }
    if (a2)
      goto LABEL_7;
LABEL_16:
    if (!a2)
      return result;
    if (v11 == *a1 && v10[1] == a1[1])
    {
      if (a2 == 2)
        return result;
      if (v10[2] == a1[2])
        break;
    }
LABEL_7:
    if (++result == v4)
      return 0;
  }
  v15 = v10 + 3;
  v16 = a2 - 3;
  v17 = a1 + 3;
  v18 = v9;
  while (v16)
  {
    if (!v18)
      goto LABEL_32;
    v20 = *v15++;
    v19 = v20;
    v21 = *v17++;
    --v18;
    --v16;
    if (v19 != v21)
      goto LABEL_7;
  }
  return result;
}

unsigned __int8 **sub_2489899DC(unsigned __int8 *a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 **v8;
  _BYTE *v9;
  int v10;
  uint64_t v11;
  unsigned __int8 *v13;
  uint64_t v14;
  unsigned __int8 *v15;
  int v16;
  int v17;
  int v18;

  v4 = *(_QWORD *)(v3 + 32);
  v5 = *(_QWORD *)(v4 + 24);
  if (v5 < 1)
  {
    while (1)
    {
LABEL_26:
      sub_2489A840C();
      __break(1u);
    }
  }
  v6 = *(_QWORD *)(v4 + 32);
  if ((a3 & 1) != 0)
    return *(unsigned __int8 ***)v6;
  v7 = 0;
  while (1)
  {
    v8 = *(unsigned __int8 ***)(v6 + 8 * v7);
    v9 = *v8;
    v10 = **v8;
    if (!**v8)
    {
LABEL_4:
      if (!a2)
        return v8;
      goto LABEL_5;
    }
    if (!v9[1])
    {
      if (a2 == 1 && v10 == *a1)
        return v8;
      goto LABEL_5;
    }
    v11 = 0;
    do
    {
      if (v11 == 1022)
        goto LABEL_4;
    }
    while (v9[v11++ + 2]);
    if (a2 - 1 == v11 && v10 == *a1 && v9[1] == a1[1])
    {
      if (a2 == 2)
        return v8;
      if (v9[2] == a1[2])
        break;
    }
LABEL_5:
    if (++v7 == v5)
    {
      sub_2489A83B8();
      swift_bridgeObjectRelease();
      sub_2489A8238();
      sub_2489A825C();
      swift_bridgeObjectRelease();
      goto LABEL_26;
    }
  }
  v13 = v9 + 3;
  v14 = a2 - 3;
  v15 = a1 + 3;
  while (v14)
  {
    v17 = *v13++;
    v16 = v17;
    v18 = *v15++;
    --v14;
    if (v16 != v18)
      goto LABEL_5;
  }
  return v8;
}

__n128 ComponentRuntime.init(allocatingFor:)@<Q0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __n128 result;
  uint64_t v13[4];
  __int128 v14;
  __n128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v4 = a1[1];
  v5 = a1[2];
  v6 = a1[3];
  *(_QWORD *)&v14 = *a1;
  v3 = v14;
  *((_QWORD *)&v14 + 1) = v4;
  v15.n128_u64[0] = v5;
  v15.n128_u64[1] = v6;
  v7 = _s9Tightbeam16ComponentRuntimeV4size3forSiAC13ConfigurationV_tFZ_0((uint64_t *)&v14);
  v8 = swift_slowAlloc();
  v13[0] = v3;
  v13[1] = v4;
  v13[2] = v5;
  v13[3] = v6;
  ComponentRuntime.init(for:into:)(v13, v8, (uint64_t)v7 + v8, (uint64_t *)&v14);
  v9 = v21;
  *(_OWORD *)(a2 + 96) = v20;
  *(_OWORD *)(a2 + 112) = v9;
  *(_QWORD *)(a2 + 128) = v22;
  v10 = v17;
  *(_OWORD *)(a2 + 32) = v16;
  *(_OWORD *)(a2 + 48) = v10;
  v11 = v19;
  *(_OWORD *)(a2 + 64) = v18;
  *(_OWORD *)(a2 + 80) = v11;
  result = v15;
  *(_OWORD *)a2 = v14;
  *(__n128 *)(a2 + 16) = result;
  return result;
}

uint64_t ComponentRuntime.init(for:into:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
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
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  _OWORD *v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  _DWORD *v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  _OWORD *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _OWORD *v55;
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
  uint64_t result;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  _QWORD *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;

  v7 = *a1;
  v8 = a1[1];
  v9 = a1[2];
  v10 = sub_24898940C(0, a2, a3, sub_24898CF40, sub_24898CEC4);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  if (sub_24898CF40(v10, v11, v13, v15) < 4)
  {
    sub_2489A83B8();
    sub_2489A825C();
    sub_2489A83D0();
    sub_2489A825C();
    swift_bridgeObjectRelease();
    sub_2489A825C();
    sub_2489A83D0();
    sub_2489A825C();
    swift_bridgeObjectRelease();
    sub_2489A825C();
    sub_24898D158();
    sub_2489A8394();
    sub_2489A825C();
    swift_bridgeObjectRelease();
    sub_2489A825C();
    sub_2489A8394();
    sub_2489A825C();
    swift_bridgeObjectRelease();
    sub_2489A825C();
    v79 = v10;
    v80 = v12;
    v81 = v14;
LABEL_79:
    v82 = v16;
    goto LABEL_81;
  }
  v88 = sub_24898CFD0(v10, v12, v14);
  if (!v88)
    goto LABEL_82;
  if ((unint64_t)(v9 - 0x2000000000000000) >> 62 != 3)
  {
LABEL_67:
    __break(1u);
    goto LABEL_68;
  }
  v87 = a2;
  v17 = sub_2489895D4(4 * v9, v10, v12, v14, v16, sub_24898CF40, sub_24898CEC4);
  if (v9 < 0)
    goto LABEL_82;
  v21 = v17;
  v22 = v18;
  v23 = v19;
  v24 = v20;
  if (v9)
  {
    v25 = v9 - 1;
    if ((unint64_t)(v9 - 1) >= 0x2000000000000000)
      v25 = 0x2000000000000000;
    if (v25 > 7)
    {
      v27 = v25 + 1;
      v28 = v27 & 7;
      if ((v27 & 7) == 0)
        v28 = 8;
      v26 = v27 - v28;
      v29 = (_OWORD *)(v88 + 16);
      v30 = v26;
      do
      {
        *(v29 - 1) = 0uLL;
        *v29 = 0uLL;
        v29 += 2;
        v30 -= 8;
      }
      while (v30);
    }
    else
    {
      v26 = 0;
    }
    v31 = v26 - 0x2000000000000000;
    v32 = v9 - v26;
    v33 = (_DWORD *)(v88 + 4 * v26);
    while (v31)
    {
      *v33++ = 0;
      ++v31;
      if (!--v32)
        goto LABEL_17;
    }
    __break(1u);
    goto LABEL_63;
  }
LABEL_17:
  if (sub_24898CF40(v17, v18, v19, v20) < 1)
  {
    sub_2489A83B8();
    sub_2489A825C();
    sub_2489A83D0();
    sub_2489A825C();
    swift_bridgeObjectRelease();
    sub_2489A825C();
    sub_2489A83D0();
    sub_2489A825C();
    swift_bridgeObjectRelease();
    sub_2489A825C();
    sub_24898D158();
    sub_2489A8394();
    sub_2489A825C();
    swift_bridgeObjectRelease();
    sub_2489A825C();
    sub_2489A8394();
    sub_2489A825C();
    swift_bridgeObjectRelease();
    sub_2489A825C();
    sub_24898CF40(v21, v22, v23, v24);
    sub_2489A8394();
    sub_2489A825C();
    swift_bridgeObjectRelease();
    sub_2489A825C();
    goto LABEL_82;
  }
  v85 = sub_24898CFD0(v21, v22, v23);
  if (!v85)
    goto LABEL_82;
  v34 = v22;
  if (sub_24898CF40(v21, v22, v23, v24))
  {
    v34 = sub_24898CEC4(v21, 1, v23, v24);
    if (v22 < v34)
      goto LABEL_83;
  }
  if (v34 < v21)
  {
    sub_2489A8400();
    __break(1u);
    goto LABEL_77;
  }
  if (sub_24898CF40(v34, v22, v23, v24) < 24)
  {
LABEL_77:
    sub_2489A83B8();
    sub_2489A825C();
    sub_2489A83D0();
    sub_2489A825C();
    swift_bridgeObjectRelease();
    sub_2489A825C();
    sub_2489A83D0();
    sub_2489A825C();
    swift_bridgeObjectRelease();
    sub_2489A825C();
    sub_24898D158();
    sub_2489A8394();
    sub_2489A825C();
    swift_bridgeObjectRelease();
    sub_2489A825C();
    sub_2489A8394();
    sub_2489A825C();
    swift_bridgeObjectRelease();
    sub_2489A825C();
    v79 = v34;
    v80 = v22;
    v81 = v23;
    v82 = v24;
LABEL_81:
    sub_24898CF40(v79, v80, v81, v82);
    sub_2489A8394();
    sub_2489A825C();
    swift_bridgeObjectRelease();
    sub_2489A825C();
    goto LABEL_82;
  }
  v35 = sub_24898CFD0(v34, v22, v23);
  if (!v35)
    goto LABEL_82;
  v36 = (_QWORD *)v35;
  if ((unsigned __int128)(v7 * (__int128)24) >> 64 != (24 * v7) >> 63)
  {
LABEL_68:
    __break(1u);
    goto LABEL_69;
  }
  v86 = a3;
  v37 = sub_2489895D4(24 * v7, v34, v22, v23, v24, sub_24898CF40, sub_24898CEC4);
  if (v7 < 0)
    goto LABEL_82;
  v41 = v37;
  v42 = v38;
  v43 = v39;
  v16 = v40;
  if (v7)
  {
    v44 = 0x555555555555556;
    v45 = v7;
    v46 = v36;
    while (v44)
    {
      *v46 = 0;
      v46[1] = 0;
      v46[2] = 0;
      v46 += 3;
      --v44;
      if (!--v45)
        goto LABEL_30;
    }
LABEL_63:
    __break(1u);
LABEL_64:
    __break(1u);
LABEL_65:
    __break(1u);
LABEL_66:
    __break(1u);
    goto LABEL_67;
  }
LABEL_30:
  if (sub_24898CF40(v37, v38, v39, v40) < 48)
    goto LABEL_78;
  v47 = sub_24898CFD0(v41, v42, v43);
  if (!v47)
    goto LABEL_82;
  v48 = (_OWORD *)v47;
  if ((unsigned __int128)(v8 * (__int128)48) >> 64 != (48 * v8) >> 63)
  {
LABEL_69:
    __break(1u);
    goto LABEL_70;
  }
  v49 = sub_2489895D4(48 * v8, v41, v42, v43, v16, sub_24898CF40, sub_24898CEC4);
  if (v8 < 0)
    goto LABEL_82;
  v41 = v49;
  v42 = v50;
  v43 = v51;
  v16 = v52;
  if (v8)
  {
    v53 = 0x2AAAAAAAAAAAAABLL;
    v54 = v8;
    v55 = v48;
    while (v53)
    {
      v55[1] = 0uLL;
      v55[2] = 0uLL;
      *v55 = 0uLL;
      v55 += 3;
      --v53;
      if (!--v54)
        goto LABEL_38;
    }
    goto LABEL_64;
  }
LABEL_38:
  v84 = v7;
  if (sub_24898CF40(v49, v50, v51, v52) < 64)
  {
LABEL_78:
    sub_2489A83B8();
    sub_2489A825C();
    sub_2489A83D0();
    sub_2489A825C();
    swift_bridgeObjectRelease();
    sub_2489A825C();
    sub_2489A83D0();
    sub_2489A825C();
    swift_bridgeObjectRelease();
    sub_2489A825C();
    sub_24898D158();
    sub_2489A8394();
    sub_2489A825C();
    swift_bridgeObjectRelease();
    sub_2489A825C();
    sub_2489A8394();
    sub_2489A825C();
    swift_bridgeObjectRelease();
    sub_2489A825C();
    v79 = v41;
    v80 = v42;
    v81 = v43;
    goto LABEL_79;
  }
  v56 = sub_24898CFD0(v41, v42, v43);
  if (!v56)
    goto LABEL_82;
  if ((unint64_t)(v9 - 0x200000000000000) >> 58 != 63)
  {
LABEL_70:
    __break(1u);
    goto LABEL_82;
  }
  v57 = v56;
  v58 = sub_2489895D4(v9 << 6, v41, v42, v43, v16, sub_24898CF40, sub_24898CEC4);
  v62 = v58;
  v63 = v59;
  v64 = v60;
  if (v9)
  {
    v65 = v9 - 1;
    if (v9 <= 1)
      v66 = 1;
    else
      v66 = v9;
    v67 = v57 + 8;
    v68 = 0x200000000000000;
    while (v68)
    {
      *(_QWORD *)(v67 - 8) = 0x200000000;
      *(_OWORD *)v67 = 0uLL;
      *(_OWORD *)(v67 + 16) = 0uLL;
      *(_OWORD *)(v67 + 32) = 0uLL;
      *(_QWORD *)(v67 + 48) = 0;
      if (!v65)
        goto LABEL_50;
      --v68;
      --v65;
      v67 += 64;
      if (!--v66)
      {
LABEL_60:
        result = sub_2489A8448();
        __break(1u);
        goto LABEL_61;
      }
    }
    goto LABEL_65;
  }
LABEL_50:
  v43 = v8;
  v83 = v61;
  if (sub_24898CF40(v58, v59, v60, v61) < 16)
  {
    sub_2489A83B8();
    sub_2489A825C();
    sub_2489A83D0();
    sub_2489A825C();
    swift_bridgeObjectRelease();
    sub_2489A825C();
    sub_2489A83D0();
    sub_2489A825C();
    swift_bridgeObjectRelease();
    sub_2489A825C();
    sub_24898D158();
    sub_2489A8394();
    sub_2489A825C();
    swift_bridgeObjectRelease();
    sub_2489A825C();
    sub_2489A8394();
    sub_2489A825C();
    swift_bridgeObjectRelease();
    sub_2489A825C();
    v79 = v62;
    v80 = v63;
    v81 = v64;
    v82 = v83;
    goto LABEL_81;
  }
  v69 = sub_24898CFD0(v62, v63, v64);
  if (v69)
  {
    v8 = v69;
    result = sub_2489895D4(16 * v9, v62, v63, v64, v83, sub_24898CF40, sub_24898CEC4);
    v74 = v86;
    if (!v9)
    {
LABEL_61:
      *a4 = v87;
      a4[1] = v74;
      a4[2] = result;
      a4[3] = v71;
      a4[4] = v72;
      a4[5] = v73;
      a4[6] = v85;
      a4[7] = (uint64_t)v36;
      a4[8] = v84;
      a4[9] = (uint64_t)v48;
      a4[10] = v43;
      a4[11] = v8;
      a4[12] = v9;
      a4[13] = v88;
      a4[14] = v9;
      a4[15] = v57;
      a4[16] = v9;
      return result;
    }
    v75 = v9 - 1;
    if (v9 <= 1)
      v76 = 1;
    else
      v76 = v9;
    v77 = 0x800000000000000;
    v78 = (_QWORD *)v8;
    while (v77)
    {
      *v78 = 0;
      v78[1] = 0;
      if (!v75)
        goto LABEL_61;
      --v77;
      --v75;
      v78 += 2;
      if (!--v76)
        goto LABEL_60;
    }
    goto LABEL_66;
  }
LABEL_82:
  sub_2489A840C();
  __break(1u);
LABEL_83:
  result = sub_2489A8400();
  __break(1u);
  return result;
}

uint64_t ComponentRuntime.initializeComponent(at:from:cnode:)(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD *v5;
  unint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t inited;
  uint64_t v21;
  uint64_t v22;
  unsigned __int8 *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t result;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  _BYTE v35[20];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[28];
  uint64_t v40;

  v5 = v4;
  v40 = *MEMORY[0x24BDAC8D0];
  v9 = a2[1];
  v32 = *a2;
  v11 = (uint64_t *)v5[2];
  v10 = v5[3];
  v13 = v5[4];
  v12 = v5[5];
  if (sub_24898CF40((uint64_t)v11, v10, v13, v12) < 232)
    goto LABEL_23;
  v31 = a4;
  v14 = sub_24898CFD0((uint64_t)v11, v10, v13);
  if (!v14)
    goto LABEL_29;
  v15 = v14;
  v16 = v10;
  if ((unint64_t)sub_24898CF40((uint64_t)v11, v10, v13, v12) >= 0xE8)
  {
    v16 = sub_24898CEC4((uint64_t)v11, 232, v13, v12);
    if (v10 < v16)
      goto LABEL_26;
  }
  if (v16 < (uint64_t)v11)
  {
LABEL_22:
    sub_2489A8400();
    __break(1u);
LABEL_23:
    *(_QWORD *)v35 = 0;
    *(_QWORD *)&v35[8] = 0xE000000000000000;
    sub_2489A83B8();
    sub_2489A825C();
    sub_2489A83D0();
    sub_2489A825C();
    swift_bridgeObjectRelease();
    sub_2489A825C();
    sub_2489A83D0();
    sub_2489A825C();
    swift_bridgeObjectRelease();
    sub_2489A825C();
    sub_24898D158();
    sub_2489A8394();
    sub_2489A825C();
    swift_bridgeObjectRelease();
    sub_2489A825C();
    sub_2489A8394();
    sub_2489A825C();
    swift_bridgeObjectRelease();
    sub_2489A825C();
    v33 = sub_24898CF40((uint64_t)v11, v10, v13, v12);
LABEL_25:
    sub_2489A8394();
    sub_2489A825C();
    swift_bridgeObjectRelease();
    sub_2489A825C();
    goto LABEL_29;
  }
  v5[2] = v16;
  v5[3] = v10;
  v5[4] = v13;
  v5[5] = v12;
  if (sub_24898CF40(v16, v10, v13, v12) < 32)
  {
    *(_QWORD *)v35 = 0;
    *(_QWORD *)&v35[8] = 0xE000000000000000;
    sub_2489A83B8();
    sub_2489A825C();
    sub_2489A83D0();
    sub_2489A825C();
    swift_bridgeObjectRelease();
    sub_2489A825C();
    sub_2489A83D0();
    sub_2489A825C();
    swift_bridgeObjectRelease();
    sub_2489A825C();
    sub_24898D158();
    sub_2489A8394();
    sub_2489A825C();
    swift_bridgeObjectRelease();
    sub_2489A825C();
    sub_2489A8394();
    sub_2489A825C();
    swift_bridgeObjectRelease();
    sub_2489A825C();
    v33 = sub_24898CF40(v16, v10, v13, v12);
    goto LABEL_25;
  }
  v17 = sub_24898CFD0(v16, v10, v13);
  if (!v17)
    goto LABEL_29;
  v11 = (uint64_t *)v17;
  v18 = sub_24898CF40(v16, v10, v13, v12);
  v19 = v10;
  if (v18 >= 0x20)
  {
    v19 = sub_24898CEC4(v16, 32, v13, v12);
    if (v10 < v19)
    {
LABEL_26:
      sub_2489A8400();
      __break(1u);
      goto LABEL_29;
    }
  }
  if (v19 < v16)
    goto LABEL_22;
  v5[2] = v19;
  v5[3] = v10;
  v5[4] = v13;
  v5[5] = v12;
  inited = ComponentInitDataReader.Component.dataBuffer()();
  v22 = v21;
  *(_DWORD *)v35 = 1;
  *(_OWORD *)&v35[4] = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  memset(v39, 0, sizeof(v39));
  if (!tb_client_connection_create_with_endpoint_static(v11, v15, (unsigned int *)v35))
  {
    v33 = v32;
    v34 = v9;
    v23 = (unsigned __int8 *)ComponentInitDataReader.Component.identifier()();
    sub_248989238(v23, v24, &v33);
    v25 = v33;
    if (v33)
    {
      if (inited)
      {
        if (!a3)
          goto LABEL_20;
        v26 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v33 + 8))(a3, v31 - a3, inited, v22 - inited);
        if ((a1 & 0x8000000000000000) == 0 && v5[10] > a1)
        {
          if ((unsigned __int128)(a1 * (__int128)48) >> 64 == (48 * a1) >> 63)
          {
            v27 = v26;
            v28 = (uint64_t *)(v5[9] + 48 * a1);
            v33 = v32;
            v34 = v9;
            result = ComponentInitDataReader.Component.identifier()();
            *v28 = result;
            v28[1] = v30;
            v28[2] = v15;
            v28[3] = (uint64_t)v11;
            v28[4] = v25;
            v28[5] = v27;
            return result;
          }
          __break(1u);
LABEL_20:
          __break(1u);
        }
      }
    }
    else
    {
      v33 = 0;
      v34 = 0xE000000000000000;
      sub_2489A83B8();
      swift_bridgeObjectRelease();
      v33 = 0xD000000000000025;
      v34 = 0x80000002489AB030;
      ComponentInitDataReader.Component.identifier()();
      sub_2489A8238();
      sub_2489A825C();
      swift_bridgeObjectRelease();
      sub_2489A825C();
    }
  }
LABEL_29:
  result = sub_2489A840C();
  __break(1u);
  return result;
}

uint64_t ComponentRuntime.initializeClient(componentIndex:handlerIndex:client:)(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
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
  _QWORD *v27;
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
  unsigned __int8 *v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  char v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unsigned __int8 *inited;
  uint64_t v71;
  char v72;
  int v73;
  unsigned __int8 **v74;
  unsigned __int8 **v75;
  _QWORD *v76;
  uint64_t result;
  uint64_t v78;
  _DWORD *v79;
  _QWORD *v80;
  uint64_t v81;
  unint64_t v82;
  uint64_t v83;
  uint64_t v84;
  _QWORD *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  uint64_t v90;
  uint64_t v91[2];
  unint64_t v92;
  unint64_t v93;
  unint64_t v94;
  unint64_t v95;
  unint64_t v96;
  unint64_t v97;

  if (a1 < 0)
    goto LABEL_47;
  v4 = v3;
  v5 = a1;
  if (v3[10] <= a1)
    goto LABEL_47;
  if ((unsigned __int128)(a1 * (__int128)48) >> 64 != (48 * a1) >> 63)
    goto LABEL_40;
  v6 = (unint64_t *)(v3[9] + 48 * a1);
  v7 = v6[2];
  if (!v7)
  {
    sub_2489A83B8();
    swift_bridgeObjectRelease();
    v92 = 0xD000000000000023;
    v93 = 0x80000002489AB120;
    sub_24898D158();
    sub_2489A8394();
    sub_2489A825C();
    swift_bridgeObjectRelease();
    goto LABEL_47;
  }
  v9 = *a3;
  v8 = a3[1];
  v10 = *v6;
  v11 = v6[1];
  v12 = v6[4];
  v13 = v6[5];
  v14 = v6[3];
  v92 = v10;
  v93 = v11;
  v94 = v7;
  v95 = v14;
  v89 = v12;
  v96 = v12;
  v97 = v13;
  if (!v9 || v8 - v9 <= 36)
    goto LABEL_47;
  v15 = *(_QWORD *)(v9 + 29);
  if ((v15 & 0x8000000000000000) == 0)
  {
    v17 = *(unsigned int *)(v9 + 17);
    v21 = sub_24898940C(37, v9, v8, sub_24898CF40, sub_24898CEC4);
    v22 = *(_QWORD *)(v9 + 21);
    if ((v22 & 0x8000000000000000) == 0)
    {
      v23 = sub_2489895D4(v22, v21, v18, v19, v20, sub_24898CF40, sub_24898CEC4);
      sub_248992F14(v23, v24, v25, v26);
      if (!v15)
      {
        v90 = 0;
        if (a2 < 0)
          goto LABEL_47;
        goto LABEL_29;
      }
      v81 = v17;
      v82 = v13;
      v83 = a2;
      v84 = v5;
      v27 = v4;
      v29 = v4[2];
      v28 = v4[3];
      v30 = v27[4];
      v31 = v27[5];
      v85 = v27;
      v86 = v15;
      if (sub_24898CF40(v29, v28, v30, v31) < 8)
      {
        sub_2489A83B8();
        sub_2489A825C();
        sub_2489A83D0();
        sub_2489A825C();
        swift_bridgeObjectRelease();
        sub_2489A825C();
        sub_2489A83D0();
        sub_2489A825C();
        swift_bridgeObjectRelease();
        sub_2489A825C();
        sub_24898D158();
        sub_2489A8394();
        sub_2489A825C();
        swift_bridgeObjectRelease();
        sub_2489A825C();
        sub_2489A8394();
        sub_2489A825C();
        swift_bridgeObjectRelease();
        sub_2489A825C();
        v91[0] = sub_24898CF40(v29, v28, v30, v31);
        sub_2489A8394();
        sub_2489A825C();
        swift_bridgeObjectRelease();
        sub_2489A825C();
        goto LABEL_47;
      }
      v90 = sub_24898CFD0(v29, v28, v30);
      if (!v90)
        goto LABEL_47;
      if ((unint64_t)(v15 - 0x1000000000000000) >> 61 != 7)
        goto LABEL_43;
      v85[2] = sub_2489895D4(8 * v15, v29, v28, v30, v31, sub_24898CF40, sub_24898CEC4);
      v85[3] = v32;
      v85[4] = v33;
      v85[5] = v34;
      if ((*(_QWORD *)(v9 + 29) & 0x8000000000000000) == 0)
      {
        v88 = v8;
        v38 = sub_24898940C(37, v9, v8, sub_24898CF40, sub_24898CEC4);
        v39 = *(_QWORD *)(v9 + 21);
        if ((v39 & 0x8000000000000000) == 0)
        {
          v40 = v35;
          v41 = v36;
          v42 = v37;
          v43 = 0;
          v87 = v15 - 1;
          while (1)
          {
            v44 = sub_2489895D4(v39, v38, v40, v41, v42, sub_24898CF40, sub_24898CEC4);
            sub_248992F14(v44, v45, v46, v47);
            ComponentInitDataReader.TypeBuffer.subscript.getter(v43, v91);
            v48 = sub_24898940C(16, v91[0], v91[1], sub_24898CF40, sub_24898CEC4);
            v50 = v49;
            v52 = v51;
            v54 = v53;
            v55 = sub_248991050();
            v56 = sub_24898CD54(v55, v48, v50, v52, v54);
            v60 = (unsigned __int8 *)sub_248992F14(v56, v57, v58, v59);
            if (v60)
              v62 = v61 - (_QWORD)v60;
            else
              v62 = 0;
            v63 = sub_248989850(v60, v62);
            if ((v64 & 1) != 0)
              goto LABEL_44;
            v65 = *(uint64_t **)(v89 + 40);
            if (!v65)
            {
              sub_2489A83B8();
              sub_2489A825C();
              sub_2489A8238();
              sub_2489A825C();
              swift_bridgeObjectRelease();
              sub_2489A825C();
              goto LABEL_47;
            }
            if (v63 < 0 || v63 >= *v65)
              goto LABEL_47;
            if (v43 == 0x1000000000000000)
              break;
            *(_QWORD *)(v90 + 8 * v43) = *(_QWORD *)(v65[1] + 8 * v63);
            if (v87 == v43)
              goto LABEL_28;
            if ((*(_QWORD *)(v9 + 29) & 0x8000000000000000) == 0)
            {
              v38 = sub_24898940C(37, v9, v88, sub_24898CF40, sub_24898CEC4);
              v40 = v66;
              v41 = v67;
              v42 = v68;
              v39 = *(_QWORD *)(v9 + 21);
              ++v43;
              if ((v39 & 0x8000000000000000) == 0)
                continue;
            }
            goto LABEL_27;
          }
          __break(1u);
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
LABEL_43:
          __break(1u);
LABEL_44:
          sub_2489A83B8();
          swift_bridgeObjectRelease();
          sub_2489A8238();
          sub_2489A825C();
          swift_bridgeObjectRelease();
          sub_2489A825C();
          sub_2489A8238();
          sub_2489A825C();
          swift_bridgeObjectRelease();
          while (1)
          {
LABEL_47:
            sub_2489A840C();
            __break(1u);
          }
        }
      }
    }
  }
LABEL_27:
  sub_2489A8400();
  __break(1u);
LABEL_28:
  a2 = v83;
  v5 = v84;
  v4 = v85;
  v15 = v86;
  v17 = v81;
  v13 = v82;
  if (v83 < 0)
    goto LABEL_47;
LABEL_29:
  if (v4[14] <= a2)
    goto LABEL_47;
  if ((unint64_t)(a2 - 0x2000000000000000) >> 62 != 3)
    goto LABEL_41;
  v69 = v4[13];
  inited = (unsigned __int8 *)ComponentInitDataReader.Client.propertyName()();
  v73 = v72 & 1;
  if (v73)
  {
    inited = 0;
    v71 = 0;
  }
  v74 = sub_2489899DC(inited, v71, v73);
  if (v4[16] <= a2)
    goto LABEL_47;
  if ((unint64_t)(a2 - 0x200000000000000) >> 58 != 63)
    goto LABEL_42;
  v75 = v74;
  v76 = (_QWORD *)(v4[15] + (a2 << 6));
  result = ((uint64_t (*)(unint64_t))v74[1])(v13);
  *v76 = v17;
  v76[1] = 0;
  v76[2] = v5;
  v76[3] = a2;
  v76[4] = result;
  v76[5] = v90;
  v76[6] = v15;
  v76[7] = v75;
  if (v4[12] <= a2)
    goto LABEL_47;
  v78 = v4[11];
  v79 = (_DWORD *)(v69 + 4 * a2);
  *v79 = 0;
  v80 = (_QWORD *)(v78 + 16 * a2);
  *v80 = v79;
  v80[1] = v76;
  return result;
}

uint64_t ComponentRuntime.handleMessage(_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _BYTE v6[4];
  int v7;
  __int16 v8;
  _BYTE v9[4];
  int v10;
  __int16 v11;

  TightbeamBadge.init(_:)(a3, (uint64_t)v9);
  v6[0] = v9[0];
  v6[1] = v9[1];
  v6[2] = v9[2];
  v7 = v10;
  v8 = v11;
  return ComponentRuntime.handleMessage(_:_:_:)(a1, a2, (uint64_t)v6);
}

{
  __int128 *v3;
  char v4;
  __int16 v5;
  __int16 v6;
  __int16 v7;
  uint64_t v10;
  uint64_t result;
  __int16 v12;
  char v13;
  __int16 v14;
  __int16 v15;
  uint64_t v16;

  if (*(_BYTE *)(a3 + 1) == 1)
  {
    v4 = *(_BYTE *)(a3 + 2);
    v5 = *(_WORD *)(a3 + 4);
    v6 = *(_WORD *)(a3 + 6);
    v7 = *(_WORD *)(a3 + 8);
    if (*(_BYTE *)a3)
    {
      if (*(_BYTE *)a3 == 1)
      {
        v12 = 257;
        v13 = v4;
        v14 = v5;
        v15 = v6;
        LOWORD(v16) = v7;
        sub_24898BFFC((char *)&v12, v3);
      }
      else
      {
        v12 = 258;
        v13 = v4;
        v14 = v5;
        v15 = v6;
        LOWORD(v16) = v7;
        sub_24898C5EC((char *)&v12, v3, (void (*)(uint64_t, _QWORD))sub_24898D3E8);
      }
      return 0;
    }
    else
    {
      v12 = 256;
      v13 = v4;
      v14 = v5;
      v15 = v6;
      LOWORD(v16) = v7;
      sub_24898C304((char *)&v12, v3);
      v12 = 256;
      v13 = v4;
      v14 = v5;
      v15 = v6;
      LOWORD(v16) = v7;
      v10 = sub_24898C8C4((char *)&v12, v3, a1, a2);
      v12 = 256;
      v13 = v4;
      v14 = v5;
      v15 = v6;
      LOWORD(v16) = v7;
      sub_24898C5EC((char *)&v12, v3, (void (*)(uint64_t, _QWORD))sub_24898D52C);
    }
    return v10;
  }
  else
  {
    sub_2489A83B8();
    sub_2489A825C();
    sub_2489A83F4();
    result = sub_2489A840C();
    __break(1u);
  }
  return result;
}

void sub_24898BFFC(char *a1, __int128 *a2)
{
  char v3;
  char v4;
  char v5;
  __int16 v6;
  __int16 v7;
  __int16 v8;
  __int128 v9;
  __int128 v10;
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
  __int16 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;

  v3 = *a1;
  v4 = a1[1];
  v5 = a1[2];
  v6 = *((_WORD *)a1 + 2);
  v7 = *((_WORD *)a1 + 3);
  v8 = *((_WORD *)a1 + 4);
  v9 = a2[3];
  v26 = a2[2];
  v27 = v9;
  v10 = a2[1];
  v24 = *a2;
  v25 = v10;
  v11 = *((_QWORD *)a2 + 8);
  v12 = *((_QWORD *)a2 + 9);
  v13 = *((_QWORD *)a2 + 10);
  v31 = *(__int128 *)((char *)a2 + 88);
  v32 = *(__int128 *)((char *)a2 + 104);
  v33 = *(__int128 *)((char *)a2 + 120);
  v28 = v11;
  v29 = v12;
  v30 = v13;
  LOBYTE(v22) = v3;
  BYTE1(v22) = v4;
  BYTE2(v22) = v5;
  WORD2(v22) = v6;
  HIWORD(v22) = v7;
  v23 = v8;
  v14 = sub_24898CBC4((uint64_t)&v22);
  if (v15 < 0 || v15 >= v13)
    goto LABEL_22;
  if ((unsigned __int128)(v15 * (__int128)48) >> 64 != (48 * v15) >> 63)
  {
    __break(1u);
    goto LABEL_15;
  }
  v16 = v12 + 48 * v15;
  if (*(_QWORD *)(v16 + 16))
  {
    if (v14 < 0 || v14 >= *((_QWORD *)a2 + 12))
      goto LABEL_22;
    if ((unint64_t)(v14 - 0x800000000000000) >> 60 == 15)
    {
      v17 = *((_QWORD *)a2 + 11) + 16 * v14;
      if (*(_QWORD *)v17)
      {
        v18 = *(_QWORD *)(v16 + 40);
        os_unfair_lock_lock(*(os_unfair_lock_t *)v17);
        v19 = *(_QWORD *)(v17 + 8);
        if ((unint64_t)*(unsigned __int8 *)(v19 + 4) << 32 != 0x200000000)
        {
          if (*(_QWORD *)(v19 + 32))
          {
LABEL_13:
            os_unfair_lock_unlock(*(os_unfair_lock_t *)v17);
            return;
          }
          v20 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v19 + 56) + 8))(v18);
          if ((unint64_t)*(unsigned __int8 *)(v19 + 4) << 32 != 0x200000000)
          {
            *(_QWORD *)(v19 + 32) = v20;
            goto LABEL_13;
          }
          goto LABEL_18;
        }
LABEL_17:
        __break(1u);
LABEL_18:
        __break(1u);
        goto LABEL_22;
      }
LABEL_16:
      __break(1u);
      goto LABEL_17;
    }
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  *(_QWORD *)&v24 = 0;
  *((_QWORD *)&v24 + 1) = 0xE000000000000000;
  v21 = v15;
  sub_2489A83B8();
  sub_2489A825C();
  v22 = v21;
  sub_24898D158();
  sub_2489A8394();
  sub_2489A825C();
  swift_bridgeObjectRelease();
  sub_2489A825C();
  LOBYTE(v22) = v3;
  BYTE1(v22) = v4;
  BYTE2(v22) = v5;
  WORD2(v22) = v6;
  HIWORD(v22) = v7;
  v23 = v8;
  sub_2489A83F4();
LABEL_22:
  sub_2489A840C();
  __break(1u);
}

void sub_24898C304(char *a1, __int128 *a2)
{
  char v3;
  char v4;
  char v5;
  __int16 v6;
  __int16 v7;
  __int16 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int16 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;

  v3 = *a1;
  v4 = a1[1];
  v5 = a1[2];
  v6 = *((_WORD *)a1 + 2);
  v7 = *((_WORD *)a1 + 3);
  v8 = *((_WORD *)a1 + 4);
  v9 = a2[3];
  v26 = a2[2];
  v27 = v9;
  v10 = a2[1];
  v24 = *a2;
  v25 = v10;
  v11 = *((_QWORD *)a2 + 8);
  v12 = *((_QWORD *)a2 + 9);
  v13 = *((_QWORD *)a2 + 10);
  v31 = *(__int128 *)((char *)a2 + 88);
  v32 = *(__int128 *)((char *)a2 + 104);
  v33 = *(__int128 *)((char *)a2 + 120);
  v28 = v11;
  v29 = v12;
  v30 = v13;
  LOBYTE(v22) = v3;
  BYTE1(v22) = v4;
  BYTE2(v22) = v5;
  WORD2(v22) = v6;
  HIWORD(v22) = v7;
  v23 = v8;
  v14 = sub_24898CBC4((uint64_t)&v22);
  if (v15 < 0 || v15 >= v13)
    goto LABEL_20;
  if ((unsigned __int128)(v15 * (__int128)48) >> 64 != (48 * v15) >> 63)
  {
    __break(1u);
    goto LABEL_13;
  }
  if (*(_QWORD *)(v12 + 48 * v15 + 16))
  {
    if (v14 < 0 || v14 >= *((_QWORD *)a2 + 12))
      goto LABEL_20;
    if ((unint64_t)(v14 - 0x800000000000000) >> 60 == 15)
    {
      v16 = *((_QWORD *)a2 + 11) + 16 * v14;
      if (!*(_QWORD *)v16)
      {
LABEL_15:
        __break(1u);
        goto LABEL_16;
      }
      os_unfair_lock_lock(*(os_unfair_lock_t *)v16);
      v17 = *(_QWORD *)(v16 + 8);
      if ((unint64_t)*(unsigned __int8 *)(v17 + 4) << 32 == 0x200000000)
      {
LABEL_16:
        __break(1u);
        goto LABEL_20;
      }
      v18 = *(_QWORD *)(v17 + 8);
      v19 = __CFADD__(v18, 1);
      v20 = v18 + 1;
      if (!v19)
      {
        *(_QWORD *)(v17 + 8) = v20;
        os_unfair_lock_unlock(*(os_unfair_lock_t *)v16);
        return;
      }
LABEL_14:
      __break(1u);
      goto LABEL_15;
    }
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  *(_QWORD *)&v24 = 0;
  *((_QWORD *)&v24 + 1) = 0xE000000000000000;
  v21 = v15;
  sub_2489A83B8();
  sub_2489A825C();
  v22 = v21;
  sub_24898D158();
  sub_2489A8394();
  sub_2489A825C();
  swift_bridgeObjectRelease();
  sub_2489A825C();
  LOBYTE(v22) = v3;
  BYTE1(v22) = v4;
  BYTE2(v22) = v5;
  WORD2(v22) = v6;
  HIWORD(v22) = v7;
  v23 = v8;
  sub_2489A83F4();
LABEL_20:
  sub_2489A840C();
  __break(1u);
}

void sub_24898C5EC(char *a1, __int128 *a2, void (*a3)(uint64_t, _QWORD))
{
  char v5;
  char v6;
  char v7;
  __int16 v8;
  __int16 v9;
  __int16 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  __int16 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;

  v5 = *a1;
  v6 = a1[1];
  v7 = a1[2];
  v8 = *((_WORD *)a1 + 2);
  v9 = *((_WORD *)a1 + 3);
  v10 = *((_WORD *)a1 + 4);
  v11 = a2[3];
  v27 = a2[2];
  v28 = v11;
  v12 = a2[1];
  v25 = *a2;
  v26 = v12;
  v13 = *((_QWORD *)a2 + 8);
  v14 = *((_QWORD *)a2 + 9);
  v15 = *((_QWORD *)a2 + 10);
  v32 = *(__int128 *)((char *)a2 + 88);
  v33 = *(__int128 *)((char *)a2 + 104);
  v34 = *(__int128 *)((char *)a2 + 120);
  v29 = v13;
  v30 = v14;
  v31 = v15;
  v22 = v5;
  LOBYTE(v23) = v5;
  BYTE1(v23) = v6;
  BYTE2(v23) = v7;
  WORD2(v23) = v8;
  HIWORD(v23) = v9;
  v24 = v10;
  v16 = sub_24898CBC4((uint64_t)&v23);
  if (v17 < 0 || v17 >= v15)
    goto LABEL_16;
  if ((unsigned __int128)(v17 * (__int128)48) >> 64 != (48 * v17) >> 63)
  {
    __break(1u);
    goto LABEL_11;
  }
  v18 = v14 + 48 * v17;
  if (*(_QWORD *)(v18 + 16))
  {
    if (v16 < 0 || v16 >= *((_QWORD *)a2 + 12))
      goto LABEL_16;
    if ((unint64_t)(v16 - 0x800000000000000) >> 60 == 15)
    {
      v19 = *((_QWORD *)a2 + 11) + 16 * v16;
      if (*(_QWORD *)v19)
      {
        v20 = *(_QWORD *)(v18 + 40);
        os_unfair_lock_lock(*(os_unfair_lock_t *)v19);
        a3(v20, *(_QWORD *)(v19 + 8));
        os_unfair_lock_unlock(*(os_unfair_lock_t *)v19);
        return;
      }
      goto LABEL_12;
    }
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    goto LABEL_16;
  }
  *(_QWORD *)&v25 = 0;
  *((_QWORD *)&v25 + 1) = 0xE000000000000000;
  v21 = v17;
  sub_2489A83B8();
  sub_2489A825C();
  v23 = v21;
  sub_24898D158();
  sub_2489A8394();
  sub_2489A825C();
  swift_bridgeObjectRelease();
  sub_2489A825C();
  LOBYTE(v23) = v22;
  BYTE1(v23) = v6;
  BYTE2(v23) = v7;
  WORD2(v23) = v8;
  HIWORD(v23) = v9;
  v24 = v10;
  sub_2489A83F4();
LABEL_16:
  sub_2489A840C();
  __break(1u);
}

uint64_t sub_24898C8C4(char *a1, __int128 *a2, uint64_t a3, uint64_t a4)
{
  char v7;
  char v8;
  char v9;
  __int16 v10;
  __int16 v11;
  __int16 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t result;
  uint64_t v24;
  char v25;
  char v26;
  uint64_t v27;
  __int16 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;

  v7 = *a1;
  v8 = a1[1];
  v9 = a1[2];
  v10 = *((_WORD *)a1 + 2);
  v11 = *((_WORD *)a1 + 3);
  v12 = *((_WORD *)a1 + 4);
  v13 = a2[3];
  v31 = a2[2];
  v32 = v13;
  v14 = a2[1];
  v29 = *a2;
  v30 = v14;
  v15 = *((_QWORD *)a2 + 8);
  v16 = *((_QWORD *)a2 + 9);
  v17 = *((_QWORD *)a2 + 10);
  v36 = *(__int128 *)((char *)a2 + 88);
  v37 = *(__int128 *)((char *)a2 + 104);
  v38 = *(__int128 *)((char *)a2 + 120);
  v33 = v15;
  v34 = v16;
  v35 = v17;
  v25 = v8;
  v26 = v7;
  LOBYTE(v27) = v7;
  BYTE1(v27) = v8;
  BYTE2(v27) = v9;
  WORD2(v27) = v10;
  HIWORD(v27) = v11;
  v28 = v12;
  v18 = sub_24898CBC4((uint64_t)&v27);
  if (v19 < 0 || v19 >= v17)
    goto LABEL_18;
  if ((unsigned __int128)(v19 * (__int128)48) >> 64 != (48 * v19) >> 63)
  {
    __break(1u);
    goto LABEL_12;
  }
  v20 = v16 + 48 * v19;
  if (*(_QWORD *)(v20 + 16))
  {
    if (v18 < 0 || v18 >= *((_QWORD *)a2 + 12))
      goto LABEL_18;
    if ((unint64_t)(v18 - 0x800000000000000) >> 60 == 15)
    {
      v21 = (_QWORD *)(*((_QWORD *)a2 + 11) + 16 * v18);
      if (*v21)
      {
        v22 = v21[1];
        if ((unint64_t)*(unsigned __int8 *)(v22 + 4) << 32 != 0x200000000)
          return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v22 + 56) + 32))(a3, a4, *(_QWORD *)(v20 + 40), *(_QWORD *)(v22 + 32));
        goto LABEL_14;
      }
LABEL_13:
      __break(1u);
LABEL_14:
      __break(1u);
      goto LABEL_18;
    }
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  *(_QWORD *)&v29 = 0;
  *((_QWORD *)&v29 + 1) = 0xE000000000000000;
  v24 = v19;
  sub_2489A83B8();
  sub_2489A825C();
  v27 = v24;
  sub_24898D158();
  sub_2489A8394();
  sub_2489A825C();
  swift_bridgeObjectRelease();
  sub_2489A825C();
  LOBYTE(v27) = v26;
  BYTE1(v27) = v25;
  BYTE2(v27) = v9;
  WORD2(v27) = v10;
  HIWORD(v27) = v11;
  v28 = v12;
  sub_2489A83F4();
LABEL_18:
  result = sub_2489A840C();
  __break(1u);
  return result;
}

uint64_t sub_24898CBC4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  uint64_t result;
  uint64_t **v6;
  uint64_t v7;

  v2 = *(_QWORD *)(v1 + 96);
  if (v2 < 0)
  {
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v3 = *(unsigned __int16 *)(a1 + 4);
  v4 = *(unsigned __int16 *)(a1 + 6);
  if (v2)
  {
    result = 0;
    v6 = (uint64_t **)(*(_QWORD *)(v1 + 88) + 8);
    while (result != 0x800000000000000)
    {
      if (*(v6 - 1))
      {
        v7 = **v6;
        if ((v7 & 0xFF00000000) == 0x200000000)
          goto LABEL_16;
        if (v3 == (unsigned __int16)v7 && v4 == WORD1(v7))
          return result;
      }
      ++result;
      v6 += 2;
      if (v2 == result)
        goto LABEL_17;
    }
    __break(1u);
    goto LABEL_15;
  }
LABEL_17:
  sub_2489A83B8();
  sub_2489A825C();
  sub_2489A83F4();
  result = sub_2489A840C();
  __break(1u);
  return result;
}

uint64_t sub_24898CD54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t result;

  if ((a1 & 0x8000000000000000) == 0)
  {
    v10 = sub_24898CF40(a2, a3, a4, a5);
    if (!a1 || v10 < 0 || (v11 = a3, v10 >= a1))
      v11 = sub_24898CEC4(a2, a1, a4, a5);
    if (v11 < a2)
    {
      sub_2489A8400();
      __break(1u);
    }
    else if (v11 <= a3)
    {
      return a2;
    }
  }
  result = sub_2489A8400();
  __break(1u);
  return result;
}

uint64_t sub_24898CEC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  BOOL v4;
  uint64_t result;

  v4 = __OFADD__(a1, a2);
  result = a1 + a2;
  if (v4)
    goto LABEL_8;
  if (!a3)
  {
    if (!result)
      return result;
    goto LABEL_7;
  }
  if (result < 0 || a4 - a3 < result)
  {
LABEL_7:
    result = sub_2489A8400();
    __break(1u);
LABEL_8:
    __break(1u);
  }
  return result;
}

uint64_t sub_24898CF40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t result;

  if (a3)
    v4 = a4 - a3;
  else
    v4 = 0;
  if ((a1 & 0x8000000000000000) == 0 && v4 >= a1)
  {
    if (a3)
    {
      if ((a2 & 0x8000000000000000) == 0 && a4 - a3 >= a2)
        return a2 - a1;
    }
    else if (!a2)
    {
      return a2 - a1;
    }
  }
  result = sub_2489A8400();
  __break(1u);
  return result;
}

uint64_t sub_24898CFD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v5;

  if (a3)
    result = a3 + a1;
  else
    result = 0;
  v5 = a2 - a1;
  if (v5 < 0 || v5 && !result)
  {
    result = sub_2489A8448();
    __break(1u);
  }
  return result;
}

uint64_t *_s9Tightbeam16ComponentRuntimeV4size3forSiAC13ConfigurationV_tFZ_0(uint64_t *result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = 288 * *result;
  if ((unsigned __int128)(*result * (__int128)288) >> 64 != v1 >> 63)
  {
    __break(1u);
    goto LABEL_12;
  }
  v2 = result[1];
  v3 = 312 * v2;
  if ((unsigned __int128)(v2 * (__int128)312) >> 64 != (312 * v2) >> 63)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v4 = v1 | 5;
  v5 = __OFADD__(v4, v3);
  v6 = v4 + v3;
  if (v5)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  v7 = result[2];
  v5 = __OFADD__(v6, 16 * v7);
  v8 = v6 + 16 * v7;
  if (v5)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v5 = __OFADD__(v8, 4 * v7);
  v9 = v8 + 4 * v7;
  if (v5)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if ((unint64_t)(v7 - 0x200000000000000) >> 58 != 63)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v5 = __OFADD__(v9, v7 << 6);
  v10 = v9 + (v7 << 6);
  if (v5)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v11 = result[3];
  if ((unint64_t)(v11 - 0x1000000000000000) >> 61 != 7)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  result = (uint64_t *)(v10 + 8 * v11);
  if (__OFADD__(v10, 8 * v11))
LABEL_19:
    __break(1u);
  return result;
}

unint64_t sub_24898D158()
{
  unint64_t result;

  result = qword_2577A3B18;
  if (!qword_2577A3B18)
  {
    result = MEMORY[0x2495A1154](MEMORY[0x24BEE17B0], MEMORY[0x24BEE1768]);
    atomic_store(result, (unint64_t *)&qword_2577A3B18);
  }
  return result;
}

__n128 __swift_memcpy136_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;
  __int128 v7;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v2 = *(_OWORD *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  result = *(__n128 *)(a2 + 80);
  v6 = *(_OWORD *)(a2 + 96);
  v7 = *(_OWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 80) = result;
  return result;
}

uint64_t getEnumTagSinglePayload for ComponentRuntime(uint64_t a1, int a2)
{
  int v3;

  if (!a2)
    return 0;
  if (a2 != 1 && *(_BYTE *)(a1 + 136))
    return (*(_DWORD *)a1 + 2);
  if (*(_QWORD *)(a1 + 48))
    v3 = -1;
  else
    v3 = 0;
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for ComponentRuntime(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_QWORD *)result = a2 - 2;
    if (a3 >= 2)
      *(_BYTE *)(result + 136) = 1;
  }
  else
  {
    if (a3 >= 2)
      *(_BYTE *)(result + 136) = 0;
    if (a2)
      *(_QWORD *)(result + 48) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for ComponentRuntime()
{
  return &type metadata for ComponentRuntime;
}

ValueMetadata *type metadata accessor for ComponentRuntime.Configuration()
{
  return &type metadata for ComponentRuntime.Configuration;
}

uint64_t getEnumTagSinglePayload for ComponentRuntime.ComponentRegistration(uint64_t a1, int a2)
{
  int v3;

  if (!a2)
    return 0;
  if (a2 != 1 && *(_BYTE *)(a1 + 48))
    return (*(_DWORD *)a1 + 2);
  if (*(_QWORD *)(a1 + 16))
    v3 = -1;
  else
    v3 = 0;
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for ComponentRuntime.ComponentRegistration(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 2;
    if (a3 >= 2)
      *(_BYTE *)(result + 48) = 1;
  }
  else
  {
    if (a3 >= 2)
      *(_BYTE *)(result + 48) = 0;
    if (a2)
      *(_QWORD *)(result + 16) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for ComponentRuntime.ComponentRegistration()
{
  return &type metadata for ComponentRuntime.ComponentRegistration;
}

uint64_t getEnumTagSinglePayload for ComponentRuntime.EndpointRegistration(uint64_t a1, int a2)
{
  int v3;

  if (!a2)
    return 0;
  if (a2 != 1 && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 2);
  if (*(_QWORD *)(a1 + 8))
    v3 = -1;
  else
    v3 = 0;
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for ComponentRuntime.EndpointRegistration(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 2;
    if (a3 >= 2)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if (a3 >= 2)
      *(_BYTE *)(result + 24) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for ComponentRuntime.EndpointRegistration()
{
  return &type metadata for ComponentRuntime.EndpointRegistration;
}

ValueMetadata *type metadata accessor for ComponentRuntime.Metadata()
{
  return &type metadata for ComponentRuntime.Metadata;
}

ValueMetadata *type metadata accessor for BumpBuffer()
{
  return &type metadata for BumpBuffer;
}

uint64_t sub_24898D3E8(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  if ((unint64_t)*(unsigned __int8 *)(a2 + 4) << 32 == 0x200000000)
  {
    __break(1u);
    __break(1u);
    goto LABEL_10;
  }
  if (*(_QWORD *)(a2 + 8))
  {
    *(_BYTE *)(a2 + 4) = 1;
    return result;
  }
  *(_BYTE *)(a2 + 4) = 0;
  v3 = *(_QWORD *)(a2 + 32);
  if (v3)
  {
    v4 = result;
    result = (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(a2 + 56) + 24))(result, *(_QWORD *)(a2 + 32));
    if ((unint64_t)*(unsigned __int8 *)(a2 + 4) << 32 != 0x200000000)
    {
      result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 + 56) + 16))(v4, v3);
      if ((unint64_t)*(unsigned __int8 *)(a2 + 4) << 32 != 0x200000000)
      {
        *(_QWORD *)(a2 + 32) = 0;
        return result;
      }
LABEL_11:
      __break(1u);
      return result;
    }
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  return result;
}

uint64_t sub_24898D49C(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  if ((unint64_t)*(unsigned __int8 *)(a2 + 4) << 32 == 0x200000000)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v3 = *(_QWORD *)(a2 + 32);
  if (!v3)
    return result;
  v4 = result;
  result = (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(a2 + 56) + 24))(result, *(_QWORD *)(a2 + 32));
  if ((unint64_t)*(unsigned __int8 *)(a2 + 4) << 32 == 0x200000000)
    goto LABEL_8;
  result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 + 56) + 16))(v4, v3);
  if ((unint64_t)*(unsigned __int8 *)(a2 + 4) << 32 == 0x200000000)
  {
LABEL_9:
    __break(1u);
    return result;
  }
  *(_QWORD *)(a2 + 32) = 0;
  return result;
}

uint64_t sub_24898D52C(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;

  v2 = *(_QWORD *)a2;
  if ((*(_QWORD *)a2 & 0xFF00000000) == 0x200000000)
    goto LABEL_8;
  v3 = *(_QWORD *)(a2 + 8);
  v4 = v3 != 0;
  v5 = v3 - 1;
  if (!v4)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }
  *(_QWORD *)(a2 + 8) = v5;
  if ((v2 & 0x100000000) != 0 && !v5)
  {
    *(_BYTE *)(a2 + 4) = 0;
    return sub_24898D49C(result, a2);
  }
  return result;
}

void sub_24898D56C()
{
  qword_2577A3B20 = MEMORY[0x24BEE4AF8];
}

uint64_t sub_24898D580()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2577A3B30);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_2489A90D0;
  sub_2489A83B8();
  swift_bridgeObjectRelease();
  sub_2489A825C();
  *(_QWORD *)(v0 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v0 + 32) = 0xD00000000000001ALL;
  *(_QWORD *)(v0 + 40) = 0x80000002489AB590;
  sub_2489A84C0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24898D650(uint64_t a1)
{
  return sub_24898D670(a1);
}

uint64_t sub_24898D670(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  void (*v15)(char *, uint64_t, uint64_t);
  uint64_t result;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;

  v2 = v1;
  v4 = sub_2489A8190();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2489A8070();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v24 - v13;
  v15 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v15((char *)&v24 - v13, a1, v8);
  result = (*(uint64_t (**)(char *, uint64_t))(v9 + 88))(v14, v8);
  if ((_DWORD)result == *MEMORY[0x24BDE0308])
  {
    (*(void (**)(char *, uint64_t))(v9 + 96))(v14, v8);
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v14, v4);
    v17 = v2 + 2;
    v19 = v2[5];
    v18 = v2[6];
    __swift_project_boxed_opaque_existential_1(v17, v19);
    (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v7, v19, v18);
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  else if ((_DWORD)result != *MEMORY[0x24BDE0320])
  {
    if ((_DWORD)result == *MEMORY[0x24BDE02F8])
    {
      swift_retain();
      sub_2489A80A0();
      swift_release();
      v20 = v2[5];
      v21 = v2[6];
      __swift_project_boxed_opaque_existential_1(v2 + 2, v20);
      return (*(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v21 + 8))(v2, v20, v21);
    }
    else
    {
      v15(v12, a1, v8);
      sub_2489A8220();
      v24 = 0;
      v25 = 0xE000000000000000;
      sub_2489A83B8();
      v23 = v2[8];
      v22 = v2[9];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v24 = v23;
      v25 = v22;
      sub_2489A825C();
      sub_2489A825C();
      swift_bridgeObjectRelease();
      sub_24898D580();
      swift_bridgeObjectRelease();
      return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v14, v8);
    }
  }
  return result;
}

uint64_t sub_24898D904(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6)
{
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(_QWORD *, uint64_t, unint64_t, uint64_t, uint64_t);

  if (a2 >> 60 == 15)
    v9 = 0;
  else
    v9 = a1;
  if (a2 >> 60 == 15)
    v10 = 0xC000000000000000;
  else
    v10 = a2;
  v11 = a6[5];
  v12 = a6[6];
  __swift_project_boxed_opaque_existential_1(a6 + 2, v11);
  v13 = *(void (**)(_QWORD *, uint64_t, unint64_t, uint64_t, uint64_t))(v12 + 24);
  sub_24898E688(a1, a2);
  v13(a6, v9, v10, v11, v12);
  swift_retain();
  sub_2489A80A0();
  swift_release();
  return sub_24898E6E0(v9, v10);
}

uint64_t sub_24898D9D0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _QWORD v10[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577A3B28);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_2489A8190();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24898DC0C(a1, (uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
    return sub_24898DC54((uint64_t)v4);
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
  v10[0] = 0;
  v10[1] = 0xE000000000000000;
  sub_2489A83B8();
  sub_2489A825C();
  swift_bridgeObjectRetain();
  sub_2489A825C();
  swift_bridgeObjectRelease();
  sub_2489A825C();
  sub_2489A83F4();
  sub_24898D580();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_24898DB78()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for UnixProtocolConnection()
{
  return objc_opt_self();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2495A113C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_24898DC0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577A3B28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24898DC54(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577A3B28);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24898DC94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    v3 = a3;
    v5 = a2;
    v6 = a1;
    v7 = *v4;
    if (!(*v4 >> 62))
    {
      if (*(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10) >= a2)
        goto LABEL_4;
LABEL_31:
      __break(1u);
      goto LABEL_32;
    }
  }
  swift_bridgeObjectRetain();
  v23 = sub_2489A8418();
  swift_bridgeObjectRelease();
  if (v23 < v5)
    goto LABEL_31;
LABEL_4:
  v9 = v5 - v6;
  if (__OFSUB__(v5, v6))
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  v8 = 1 - v9;
  if (__OFSUB__(1, v9))
  {
LABEL_33:
    __break(1u);
LABEL_34:
    swift_bridgeObjectRetain();
    v10 = sub_2489A8418();
    swift_bridgeObjectRelease();
    v11 = v10 + v8;
    if (!__OFADD__(v10, v8))
      goto LABEL_8;
LABEL_36:
    __break(1u);
LABEL_37:
    swift_bridgeObjectRetain();
    v14 = sub_2489A8418();
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  v7 = *v4;
  if (*v4 >> 62)
    goto LABEL_34;
  v10 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
  v11 = v10 + v8;
  if (__OFADD__(v10, v8))
    goto LABEL_36;
LABEL_8:
  v7 = *v4;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v4 = v7;
  v10 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v7 & 0x8000000000000000) == 0 && (v7 & 0x4000000000000000) == 0)
  {
    v13 = v7 & 0xFFFFFFFFFFFFFF8;
    if (v11 <= *(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_18;
    v10 = 1;
  }
  if (v7 >> 62)
    goto LABEL_37;
  v14 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_15:
  if (v14 <= v11)
    v14 = v11;
  swift_bridgeObjectRetain();
  v7 = MEMORY[0x2495A0B84](v10, v14, 1, v7);
  swift_bridgeObjectRelease();
  *v4 = v7;
  v13 = v7 & 0xFFFFFFFFFFFFFF8;
LABEL_18:
  v15 = (_QWORD *)(v13 + 32 + 8 * v6);
  sub_2489A8184();
  swift_arrayDestroy();
  if (!v8)
  {
LABEL_28:
    *v15 = v3;
    return sub_2489A82C8();
  }
  if (!(v7 >> 62))
  {
    v16 = *(_QWORD *)(v13 + 16);
    v17 = v16 - v5;
    if (!__OFSUB__(v16, v5))
      goto LABEL_21;
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  swift_bridgeObjectRetain();
  v24 = sub_2489A8418();
  swift_bridgeObjectRelease();
  v17 = v24 - v5;
  if (__OFSUB__(v24, v5))
    goto LABEL_40;
LABEL_21:
  if ((v17 & 0x8000000000000000) == 0)
  {
    v18 = (char *)(v15 + 1);
    v19 = (char *)(v13 + 32 + 8 * v5);
    if (v15 + 1 != (_QWORD *)v19 || v18 >= &v19[8 * v17])
      memmove(v18, v19, 8 * v17);
    if (!(v7 >> 62))
    {
      v20 = *(_QWORD *)(v13 + 16);
      v21 = v20 + v8;
      if (!__OFADD__(v20, v8))
      {
LABEL_27:
        *(_QWORD *)(v13 + 16) = v21;
        goto LABEL_28;
      }
      goto LABEL_43;
    }
LABEL_41:
    swift_bridgeObjectRetain();
    v25 = sub_2489A8418();
    swift_bridgeObjectRelease();
    v21 = v25 + v8;
    if (!__OFADD__(v25, v8))
      goto LABEL_27;
LABEL_43:
    __break(1u);
  }
  result = sub_2489A8448();
  __break(1u);
  return result;
}

uint64_t sub_24898DF6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  void (*v28)(uint64_t *, _QWORD);
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  uint64_t result;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49[4];
  uint64_t v50[6];

  v48 = sub_2489A831C();
  v46 = *(_QWORD *)(v48 - 8);
  MEMORY[0x24BDAC7A8](v48);
  v47 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = sub_2489A8310();
  MEMORY[0x24BDAC7A8](v44);
  v45 = (char *)&v37 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_2489A81B4();
  MEMORY[0x24BDAC7A8](v16);
  v43 = (char *)&v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = sub_2489A7FC8();
  v18 = *(_QWORD *)(v42 - 8);
  v19 = MEMORY[0x24BDAC7A8](v42);
  v21 = (char *)&v37 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v23 = (uint64_t *)((char *)&v37 - v22);
  v50[3] = a6;
  v50[4] = a7;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v50);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a6 - 8) + 32))(boxed_opaque_existential_1, a3, a6);
  sub_24898E4D0((uint64_t)v50, (uint64_t)(a5 + 2));
  a5[8] = a1;
  a5[9] = a2;
  if (a4)
  {
    a5[7] = a4;
    v25 = v42;
  }
  else
  {
    v40 = 0;
    v41 = v21;
    v39 = a1;
    sub_2489A80F4();
    v38 = a2;
    swift_bridgeObjectRetain();
    sub_2489A80E8();
    if (qword_2577A3A40 != -1)
      swift_once();
    sub_2489A8148();
    swift_allocObject();
    swift_retain();
    v26 = sub_2489A813C();
    sub_2489A80D0();
    swift_retain();
    v28 = (void (*)(uint64_t *, _QWORD))sub_2489A80C4();
    v29 = *v27;
    v30 = v41;
    if ((unint64_t)*v27 >> 62)
    {
      v36 = v29 & 0xFFFFFFFFFFFFFF8;
      if (v29 < 0)
        v36 = *v27;
      v37 = v36;
      swift_bridgeObjectRetain();
      v37 = sub_2489A8418();
      result = swift_bridgeObjectRelease();
      if (v37 < 0)
      {
        __break(1u);
        return result;
      }
    }
    sub_24898DC94(0, 0, v26);
    v28(v49, 0);
    swift_release();
    v31 = v38;
    *v23 = v39;
    v23[1] = v31;
    v25 = v42;
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(v18 + 104))(v23, *MEMORY[0x24BDDFF38], v42);
    (*(void (**)(char *, _QWORD *, uint64_t))(v18 + 16))(v30, v23, v25);
    sub_2489A80B8();
    swift_allocObject();
    v32 = sub_2489A804C();
    swift_release();
    (*(void (**)(_QWORD *, uint64_t))(v18 + 8))(v23, v25);
    a5[7] = v32;
  }
  swift_retain();
  swift_retain();
  swift_retain();
  sub_24898E518((uint64_t)sub_24898E514);
  sub_2489A8040();
  swift_release();
  swift_release();
  sub_24898E528();
  sub_2489A80AC();
  sub_2489A7FA4();
  (*(void (**)(_QWORD *, uint64_t))(v18 + 8))(v23, v25);
  sub_2489A81A8();
  v49[0] = MEMORY[0x24BEE4AF8];
  sub_24898E564();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577A3B48);
  sub_24898E5AC();
  sub_2489A83A0();
  (*(void (**)(char *, _QWORD, uint64_t))(v46 + 104))(v47, *MEMORY[0x24BEE5750], v48);
  v33 = (void *)sub_2489A8334();
  swift_retain();
  sub_2489A807C();
  swift_release();
  if (qword_2577A3A20 != -1)
    swift_once();
  swift_beginAccess();
  v34 = v33;
  MEMORY[0x2495A0A64]();
  if (*(_QWORD *)((qword_2577A3B20 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((qword_2577A3B20 & 0xFFFFFFFFFFFFFF8)
                                                                                + 0x18) >> 1)
    sub_2489A82D4();
  sub_2489A82EC();
  sub_2489A82C8();
  swift_endAccess();

  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v50);
  return (uint64_t)a5;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_24898E4D0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24898E518(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

unint64_t sub_24898E528()
{
  unint64_t result;

  result = qword_2577A3B38;
  if (!qword_2577A3B38)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2577A3B38);
  }
  return result;
}

unint64_t sub_24898E564()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2577A3B40;
  if (!qword_2577A3B40)
  {
    v1 = sub_2489A8310();
    result = MEMORY[0x2495A1154](MEMORY[0x24BEE5698], v1);
    atomic_store(result, (unint64_t *)&qword_2577A3B40);
  }
  return result;
}

unint64_t sub_24898E5AC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2577A3B50;
  if (!qword_2577A3B50)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577A3B48);
    result = MEMORY[0x2495A1154](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_2577A3B50);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2495A1148](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_24898E680(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  return sub_24898D904(a1, a2, a3, a4, a5, v5);
}

uint64_t sub_24898E688(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_24898E69C(a1, a2);
  return a1;
}

uint64_t sub_24898E69C(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_24898E6E0(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release();
  }
  return swift_release();
}

uint64_t ComponentInitDataReader.Component.dataBuffer()()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;

  v1 = *v0;
  if (!*v0)
    goto LABEL_10;
  v2 = v0[1];
  if (v2 - v1 < 48)
    goto LABEL_10;
  v3 = *(_QWORD *)(v1 + 16);
  if ((v3 & 0x8000000000000000) == 0)
  {
    v4 = __OFADD__(v3, 48);
    v5 = v3 + 48;
    if (v4)
    {
      __break(1u);
LABEL_9:
      __break(1u);
LABEL_10:
      sub_2489A840C();
      __break(1u);
      goto LABEL_11;
    }
    v6 = *(_QWORD *)(v1 + 24);
    if ((v6 & 0x8000000000000000) == 0)
    {
      if (!__OFADD__(v5, v6))
      {
        v7 = sub_2489893F0(v5 + v6, v1, v2);
        return sub_248992F14(v7, v8, v9, v10);
      }
      goto LABEL_9;
    }
  }
LABEL_11:
  result = sub_2489A8400();
  __break(1u);
  return result;
}

uint64_t ComponentInitDataReader.Client.badge()@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  char v3;
  int v4;
  uint64_t result;

  v2 = *v1;
  if (*v1 && v1[1] - v2 > 36)
  {
    v3 = *(_BYTE *)(v2 + 16);
    v4 = *(_DWORD *)(v2 + 17);
    *(_WORD *)a1 = 257;
    *(_BYTE *)(a1 + 2) = v3;
    *(_DWORD *)(a1 + 4) = v4;
    *(_WORD *)(a1 + 8) = 0;
  }
  else
  {
    result = sub_2489A840C();
    __break(1u);
  }
  return result;
}

uint64_t ComponentInitDataReader.Client.types.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  v3 = *v1;
  if (*v1 && v1[1] - v3 >= 37)
  {
    v4 = *(_QWORD *)(v3 + 29);
    if ((v4 & 0x8000000000000000) == 0)
    {
      result = sub_2489915E0();
      *a1 = result;
      a1[1] = v6;
      a1[2] = v4;
      return result;
    }
  }
  else
  {
    sub_2489A840C();
    __break(1u);
  }
  result = sub_2489A8400();
  __break(1u);
  return result;
}

uint64_t ComponentInitDataReader.TypeBuffer.subscript.getter@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v2;
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
  BOOL v16;
  uint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  BOOL v20;
  uint64_t v21;
  uint64_t result;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v28;
  unint64_t v29;

  v3 = *v2;
  v4 = v2[1];
  v5 = v2[2];
  v6 = sub_2489893F0(0, v3, v4);
  if (v5 < 1)
  {
LABEL_57:
    v28 = 0;
    v29 = 0xE000000000000000;
    sub_2489A83B8();
    swift_bridgeObjectRelease();
    v28 = 0xD00000000000001FLL;
    v29 = 0x80000002489AB660;
    sub_24898D158();
    sub_2489A8394();
    sub_2489A825C();
    swift_bridgeObjectRelease();
LABEL_58:
    sub_2489A840C();
    __break(1u);
LABEL_59:
    sub_2489A8400();
    __break(1u);
LABEL_60:
    sub_2489A8448();
    __break(1u);
LABEL_61:
    sub_2489A8400();
    __break(1u);
  }
  else
  {
    v10 = v6;
    if ((v6 & 0x8000000000000000) == 0)
    {
      v11 = v7;
      v12 = v8;
      v13 = v9 - v8;
      if (v8)
        v14 = v9 - v8;
      else
        v14 = 0;
      v16 = v7 < 0 || v13 < v7;
      v17 = a1;
      while (1)
      {
        if (v12)
        {
          if (v13 < v11)
            goto LABEL_62;
          v18 = (_QWORD *)(v12 + v10);
        }
        else
        {
          if (v11 > 0)
            goto LABEL_62;
          v18 = 0;
        }
        v19 = v11 - v10;
        v20 = __OFSUB__(v11, v10);
        if ((v19 & 0x8000000000000000) != 0)
          goto LABEL_62;
        if (v19)
          break;
        if (v18)
          goto LABEL_26;
        v21 = 0;
LABEL_27:
        result = sub_248990C7C(v18, v21, &v28);
        v23 = v29;
        if (!v17)
        {
          *a2 = v28;
          a2[1] = v23;
          return result;
        }
        if (!v28 || (uint64_t)(v29 - v28) < 16)
          goto LABEL_58;
        v24 = *(_QWORD *)(v28 + 8);
        if ((v24 & 0x8000000000000000) != 0)
          goto LABEL_59;
        if (v14 < 0)
          goto LABEL_60;
        if (v14 < v10)
          goto LABEL_61;
        if (v12)
        {
          if (v16)
            goto LABEL_61;
        }
        else if (v11)
        {
          goto LABEL_61;
        }
        if (v20)
        {
          __break(1u);
LABEL_52:
          __break(1u);
          goto LABEL_61;
        }
        v25 = v11;
        if (v19 >= v24)
        {
          v25 = v10 + v24;
          if (__OFADD__(v10, v24))
            goto LABEL_52;
          if (v12)
          {
            if (v25 < 0 || v13 < v25)
              goto LABEL_61;
            if (v11 < (unint64_t)v25)
              goto LABEL_63;
          }
          else if (v25)
          {
            goto LABEL_61;
          }
        }
        if (v25 < v10)
          goto LABEL_61;
        --v17;
        v10 = v25;
        if (!--v5)
          goto LABEL_57;
      }
      if (!v18)
        goto LABEL_62;
LABEL_26:
      v21 = (uint64_t)v18 + v19;
      goto LABEL_27;
    }
  }
LABEL_62:
  sub_2489A8448();
  __break(1u);
LABEL_63:
  result = sub_2489A8400();
  __break(1u);
  return result;
}

uint64_t EndpointTuple.identifier.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t EndpointTuple.numHandlers.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t sub_24898EE00(void *a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v8;
  _QWORD *v9;
  size_t v10;
  unint64_t v11;
  unint64_t v12;
  _QWORD v14[2];

  v4 = a4;
  v5 = a3;
  if ((a4 & 0x1000000000000000) == 0)
  {
    if ((a4 & 0x2000000000000000) != 0)
      v8 = HIBYTE(a4) & 0xF;
    else
      v8 = a3 & 0xFFFFFFFFFFFFLL;
    swift_bridgeObjectRetain();
    if ((v4 & 0x2000000000000000) == 0)
      goto LABEL_6;
LABEL_9:
    v10 = HIBYTE(v4) & 0xF;
    v14[0] = v5;
    v14[1] = v4 & 0xFFFFFFFFFFFFFFLL;
    v9 = v14;
    goto LABEL_10;
  }
  v8 = sub_2489A8268();
  swift_bridgeObjectRetain();
  v5 = sub_2489A0F10();
  v12 = v11;
  swift_bridgeObjectRelease();
  v4 = v12;
  if ((v12 & 0x2000000000000000) != 0)
    goto LABEL_9;
LABEL_6:
  if ((v5 & 0x1000000000000000) != 0)
  {
    v9 = (_QWORD *)((v4 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v10 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v9 = (_QWORD *)sub_2489A83E8();
  }
LABEL_10:
  sub_24898EF04(v9, v10, a1, a2, v8);
  swift_bridgeObjectRelease();
  return v8;
}

void *sub_24898EF04(void *__src, size_t __len, void *__dst, uint64_t a4, uint64_t a5)
{
  if (a5 < 0)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (!__dst)
  {
    if (!a5)
      return __src;
LABEL_10:
    sub_2489A8448();
    __break(1u);
LABEL_11:
    __src = (void *)sub_2489A8448();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < a5)
    goto LABEL_10;
  if (__src)
  {
    if ((__len & 0x8000000000000000) == 0)
      return memmove(__dst, __src, __len);
    goto LABEL_11;
  }
  return __src;
}

uint64_t sub_24898EFEC()
{
  return sub_2489A8238();
}

uint64_t sub_24898F014(uint64_t *a1, uint64_t a2)
{
  return sub_248992EB0(*a1, a1[1], *(unsigned __int8 **)a2, *(_QWORD *)(a2 + 8));
}

BOOL static ComponentInitDataBuilder.Error.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t ComponentInitDataBuilder.Error.hash(into:)()
{
  return sub_2489A84E4();
}

uint64_t ComponentInitDataBuilder.Error.hashValue.getter()
{
  sub_2489A84D8();
  sub_2489A84E4();
  return sub_2489A84FC();
}

BOOL sub_24898F0AC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t _s9Tightbeam23ComponentInitDataReaderV0B0V5ErrorO9hashValueSivg_0()
{
  sub_2489A84D8();
  sub_2489A84E4();
  return sub_2489A84FC();
}

uint64_t sub_24898F108()
{
  return sub_2489A84E4();
}

uint64_t sub_24898F130()
{
  sub_2489A84D8();
  sub_2489A84E4();
  return sub_2489A84FC();
}

uint64_t ComponentInitDataBuilder.TypeData.type.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

Tightbeam::ComponentInitDataBuilder::TypeData __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> ComponentInitDataBuilder.TypeData.init(type:)(Tightbeam::ComponentInitDataBuilder::TypeData type)
{
  Tightbeam::ComponentInitDataBuilder::TypeData *v1;
  uint64_t v2;
  _BYTE *v3;

  v2 = HIBYTE(type.type._object) & 0xF;
  if (((uint64_t)type.type._object & 0x2000000000000000) == 0)
    v2 = type.type._countAndFlagsBits & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    *v1 = type;
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_24899303C();
    swift_allocError();
    *v3 = 1;
    type.type._countAndFlagsBits = swift_willThrow();
  }
  return type;
}

void ComponentInitDataBuilder.Client.badge.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;
  char v3;
  int v4;
  __int16 v5;

  v2 = *(_BYTE *)(v1 + 1);
  v3 = *(_BYTE *)(v1 + 2);
  v4 = *(_DWORD *)(v1 + 4);
  v5 = *(_WORD *)(v1 + 8);
  *(_BYTE *)a1 = *(_BYTE *)v1;
  *(_BYTE *)(a1 + 1) = v2;
  *(_BYTE *)(a1 + 2) = v3;
  *(_DWORD *)(a1 + 4) = v4;
  *(_WORD *)(a1 + 8) = v5;
}

uint64_t ComponentInitDataBuilder.Client.property.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ComponentInitDataBuilder.Client.types.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ComponentInitDataBuilder.Client.init(identifier:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  char v4;
  char v5;
  int v6;
  __int16 v7;
  _BYTE v8[4];
  int v9;
  __int16 v10;

  result = TightbeamBadge.init(_:)(a1, (uint64_t)v8);
  v4 = v8[1];
  v5 = v8[2];
  v6 = v9;
  v7 = v10;
  *(_BYTE *)a2 = v8[0];
  *(_BYTE *)(a2 + 1) = v4;
  *(_BYTE *)(a2 + 2) = v5;
  *(_DWORD *)(a2 + 4) = v6;
  *(_WORD *)(a2 + 8) = v7;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = MEMORY[0x24BEE4AF8];
  return result;
}

uint64_t ComponentInitDataBuilder.Client.init(badge:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  char v2;
  char v3;
  int v4;
  __int16 v5;

  v2 = *(_BYTE *)(result + 1);
  v3 = *(_BYTE *)(result + 2);
  v4 = *(_DWORD *)(result + 4);
  v5 = *(_WORD *)(result + 8);
  *(_BYTE *)a2 = *(_BYTE *)result;
  *(_BYTE *)(a2 + 1) = v2;
  *(_BYTE *)(a2 + 2) = v3;
  *(_DWORD *)(a2 + 4) = v4;
  *(_WORD *)(a2 + 8) = v5;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = MEMORY[0x24BEE4AF8];
  return result;
}

uint64_t ComponentInitDataBuilder.Client.init(badge:property:types:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  char v5;
  char v6;
  int v7;
  __int16 v8;

  v5 = *(_BYTE *)(result + 1);
  v6 = *(_BYTE *)(result + 2);
  v7 = *(_DWORD *)(result + 4);
  v8 = *(_WORD *)(result + 8);
  *(_BYTE *)a5 = *(_BYTE *)result;
  *(_BYTE *)(a5 + 1) = v5;
  *(_BYTE *)(a5 + 2) = v6;
  *(_DWORD *)(a5 + 4) = v7;
  *(_WORD *)(a5 + 8) = v8;
  *(_QWORD *)(a5 + 16) = a2;
  *(_QWORD *)(a5 + 24) = a3;
  *(_QWORD *)(a5 + 32) = a4;
  return result;
}

uint64_t sub_24898F354()
{
  _QWORD *v0;
  unint64_t v1;
  unint64_t *v2;
  uint64_t result;
  uint64_t i;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;

  v1 = v0[3];
  v2 = (unint64_t *)v0[4];
  if (!v1)
  {
    i = 37;
    goto LABEL_10;
  }
  if ((v1 & 0x1000000000000000) != 0)
    goto LABEL_28;
  if ((v1 & 0x2000000000000000) != 0)
    result = HIBYTE(v1) & 0xF;
  else
    result = v0[2] & 0xFFFFFFFFFFFFLL;
  for (i = result + 37; !__OFADD__(result, 37); i = result + 37)
  {
LABEL_10:
    v5 = v2[2];
    if (v5)
    {
      v6 = 0;
      v2 += 5;
      while (1)
      {
        v7 = *v2;
        if ((*v2 & 0x1000000000000000) != 0)
        {
          v11 = sub_2489A8268();
          v9 = v11 + 16;
          if (__OFADD__(v11, 16))
            goto LABEL_22;
        }
        else
        {
          if ((v7 & 0x2000000000000000) != 0)
            v8 = HIBYTE(v7) & 0xF;
          else
            v8 = *(v2 - 1) & 0xFFFFFFFFFFFFLL;
          v9 = v8 + 16;
          if (__OFADD__(v8, 16))
          {
LABEL_22:
            __break(1u);
            goto LABEL_23;
          }
        }
        v10 = __OFADD__(v6, v9);
        v6 += v9;
        if (v10)
          break;
        v2 += 2;
        if (!--v5)
          goto LABEL_24;
      }
      __break(1u);
    }
    else
    {
LABEL_23:
      v6 = 0;
LABEL_24:
      result = i + v6;
      if (!__OFADD__(i, v6))
        return result;
    }
    __break(1u);
LABEL_28:
    result = sub_2489A8268();
  }
  __break(1u);
  return result;
}

uint64_t sub_24898F428(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int64_t v28;
  BOOL v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _BYTE *v40;
  uint64_t result;
  unsigned int v42;
  uint64_t v43;
  BOOL v44;
  int64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  v4 = v3;
  LOBYTE(v7) = *(_BYTE *)(v2 + 2);
  LOWORD(v8) = *(_WORD *)(v2 + 4);
  LOWORD(v9) = *(_WORD *)(v2 + 6);
  v10 = *(_QWORD *)(v2 + 16);
  v11 = *(_QWORD *)(v2 + 24);
  v49 = *(_QWORD *)(v2 + 32);
  v12 = sub_24898F354();
  v13 = v12;
  v48 = v12;
  if (a1)
  {
    if ((uint64_t)(a2 - a1) >= v12)
      goto LABEL_3;
LABEL_11:
    sub_24899303C();
    swift_allocError();
    *v15 = 0;
    swift_willThrow();
    return v48;
  }
  if (v12 > 0)
    goto LABEL_11;
LABEL_3:
  if (v11)
  {
    if ((v11 & 0x1000000000000000) != 0)
      goto LABEL_92;
    if ((v11 & 0x2000000000000000) != 0)
    {
      if ((v12 & 0x8000000000000000) == 0)
      {
        v14 = HIBYTE(v11) & 0xF;
        goto LABEL_16;
      }
    }
    else if ((v12 & 0x8000000000000000) == 0)
    {
      v14 = v10 & 0xFFFFFFFFFFFFLL;
      while (1)
      {
        if (v14 < 0)
          goto LABEL_93;
LABEL_16:
        v16 = *(_QWORD *)(v49 + 16);
        *(_QWORD *)a1 = 0x434C4E5444415441;
        *(_QWORD *)(a1 + 8) = v13;
        *(_BYTE *)(a1 + 16) = (_BYTE)v7;
        *(_WORD *)(a1 + 17) = v8;
        *(_WORD *)(a1 + 19) = v9;
        *(_QWORD *)(a1 + 21) = v14;
        *(_QWORD *)(a1 + 29) = v16;
        v8 = a2 - a1;
        v17 = a1;
        a1 = a1 ? a2 - a1 : 0;
        if (a1 > 36)
          break;
LABEL_91:
        __break(1u);
LABEL_92:
        v14 = sub_2489A8268();
        v13 = v48;
        if (v48 < 0)
          goto LABEL_93;
      }
      if (!v11)
      {
        v10 = 37;
        v9 = v4;
        v21 = v49;
        v24 = v17;
        v26 = *(_QWORD *)(v49 + 16);
        if (v26)
        {
LABEL_25:
          v27 = a2 - v24;
          if (v24)
            v28 = a2 - v24;
          else
            v28 = 0;
          v43 = v27;
          v30 = v8 < 0 || v27 < v8;
          v44 = v30;
          swift_bridgeObjectRetain();
          v7 = (unint64_t *)(v21 + 40);
          v46 = v8;
          v47 = v24;
          v45 = v28;
          while (1)
          {
            v11 = v24 + v10;
            if (v24)
              a1 = v24 + v10;
            else
              a1 = 0;
            v31 = v8 - v10;
            v32 = __OFSUB__(v8, v10);
            if ((v31 & 0x8000000000000000) != 0)
              goto LABEL_99;
            v33 = *(v7 - 1);
            a2 = *v7;
            v8 = v9;
            if (v31)
              break;
            if (a1)
              goto LABEL_46;
            v9 = 0;
            v50 = v26;
            if ((a2 & 0x1000000000000000) == 0)
            {
LABEL_47:
              if ((a2 & 0x2000000000000000) != 0)
              {
                v34 = HIBYTE(a2) & 0xF;
                v4 = v34 + 16;
                if (__OFADD__(v34, 16))
                  goto LABEL_83;
              }
              else
              {
                v4 = (v33 & 0xFFFFFFFFFFFFLL) + 16;
                if (__OFADD__(v33 & 0xFFFFFFFFFFFFLL, 16))
                  goto LABEL_83;
              }
              goto LABEL_52;
            }
LABEL_81:
            v42 = v32;
            v38 = *(v7 - 1);
            v39 = sub_2489A8268();
            v33 = v38;
            v32 = v42;
            v4 = v39 + 16;
            if (__OFADD__(v39, 16))
            {
LABEL_83:
              __break(1u);
LABEL_84:
              sub_24899303C();
              swift_allocError();
              *v40 = 0;
              swift_bridgeObjectRetain();
              swift_willThrow();
              swift_bridgeObjectRelease();
LABEL_85:
              swift_bridgeObjectRelease();
              return v48;
            }
LABEL_52:
            if (a1)
            {
              if (v9 - a1 < v4)
                goto LABEL_84;
              if (v4 < 0)
                goto LABEL_93;
            }
            else
            {
              if (v4 >= 1)
                goto LABEL_84;
              v11 = 0;
              if (v4 < 0)
                goto LABEL_93;
            }
            *(_QWORD *)v11 = 0x5459504544415441;
            *(_QWORD *)(v11 + 8) = v4;
            if (!a1 || v9 - a1 < 16)
            {
              __break(1u);
LABEL_89:
              __break(1u);
LABEL_90:
              __break(1u);
              goto LABEL_91;
            }
            v11 = v32;
            v35 = (void *)(a1 + 16);
            a1 = v9;
            v36 = v33;
            swift_bridgeObjectRetain();
            sub_24898EE00(v35, a1, v36, a2);
            v9 = v8;
            swift_bridgeObjectRelease();
            if (v8)
              goto LABEL_85;
            a2 = v45;
            if (v45 < 0)
            {
              sub_2489A8448();
              __break(1u);
LABEL_97:
              sub_2489A8400();
              __break(1u);
              goto LABEL_94;
            }
            v8 = v46;
            v24 = v47;
            if (v10 < 0 || v45 < v10)
              goto LABEL_94;
            if (v47)
            {
              if (v44)
                goto LABEL_94;
            }
            else if (v46)
            {
              goto LABEL_94;
            }
            if ((v11 & 1) != 0)
              goto LABEL_89;
            v37 = v46;
            if (v31 >= v4)
            {
              v37 = v10 + v4;
              if (__OFADD__(v10, v4))
                goto LABEL_90;
              if (v47)
              {
                if ((v37 & 0x8000000000000000) != 0 || v43 < (uint64_t)v37)
                  goto LABEL_94;
              }
              else if (v37)
              {
                goto LABEL_94;
              }
            }
            if (v46 < v37)
              goto LABEL_97;
            if (v37 < v10)
              goto LABEL_94;
            v7 += 2;
            v10 = v37;
            v26 = v50 - 1;
            if (v50 == 1)
              goto LABEL_85;
          }
          if (!a1)
            goto LABEL_99;
LABEL_46:
          v9 = a1 + v31;
          v50 = v26;
          if ((a2 & 0x1000000000000000) == 0)
            goto LABEL_47;
          goto LABEL_81;
        }
        return v13;
      }
      v18 = (void *)sub_24898CFD0(37, a1, v17);
      v20 = sub_24898EE00(v18, v19, v10, v11);
      v9 = v4;
      v21 = v49;
      if (!v4)
      {
        v10 = sub_2489893DC(v20, 37, a1, v17, a2);
        v8 = v22;
        v24 = v23;
        a2 = v25;
        v13 = v48;
        v26 = *(_QWORD *)(v49 + 16);
        if (!v26)
          return v13;
        goto LABEL_25;
      }
      return v48;
    }
  }
  else if ((v12 & 0x8000000000000000) == 0)
  {
    v14 = 0;
    goto LABEL_16;
  }
LABEL_93:
  sub_2489A8400();
  __break(1u);
LABEL_94:
  sub_2489A8400();
  __break(1u);
LABEL_99:
  result = sub_2489A8448();
  __break(1u);
  return result;
}

uint64_t ComponentInitDataBuilder.Component.identifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ComponentInitDataBuilder.Component.clients.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ComponentInitDataBuilder.Component.data.getter()
{
  return swift_bridgeObjectRetain();
}

void ComponentInitDataBuilder.Component.init(identifier:dataSize:clients:)(uint64_t a1@<X0>, uint64_t a2@<X1>, size_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  uint64_t v10;

  if ((a3 & 0x8000000000000000) != 0)
  {
    sub_2489A8400();
    __break(1u);
  }
  else
  {
    if (a3)
    {
      v10 = sub_2489A82E0();
      *(_QWORD *)(v10 + 16) = a3;
      bzero((void *)(v10 + 32), a3);
    }
    else
    {
      v10 = MEMORY[0x24BEE4AF8];
    }
    *a5 = a1;
    a5[1] = a2;
    a5[2] = a4;
    a5[3] = v10;
  }
}

uint64_t ComponentInitDataBuilder.Component.withMutableMessage(_:)(void (*a1)(uint64_t))
{
  uint64_t v1;
  char *v3;
  uint64_t result;

  v3 = *(char **)(v1 + 24);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v3 = sub_248992E9C((uint64_t)v3);
  result = sub_2489A3484(0, (uint64_t)(v3 + 32), *((_QWORD *)v3 + 2), a1);
  *(_QWORD *)(v1 + 24) = v3;
  return result;
}

uint64_t sub_24898FB94(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (!v1)
    return v2;
  v20 = MEMORY[0x24BEE4AF8];
  sub_248992D24(0, v1, 0);
  v4 = 0;
  v2 = v20;
  v5 = a1 + 32;
  while (1)
  {
    v6 = (_QWORD *)(v5 + 40 * v4);
    v7 = v6[3];
    v8 = v6[4];
    if (v7)
    {
      if ((v7 & 0x1000000000000000) != 0)
      {
        result = sub_2489A8268();
        v10 = result + 37;
        if (__OFADD__(result, 37))
          goto LABEL_33;
      }
      else
      {
        if ((v7 & 0x2000000000000000) != 0)
          result = HIBYTE(v7) & 0xF;
        else
          result = v6[2] & 0xFFFFFFFFFFFFLL;
        v10 = result + 37;
        if (__OFADD__(result, 37))
        {
LABEL_33:
          __break(1u);
          return v2;
        }
      }
    }
    else
    {
      result = 0;
      v10 = 37;
    }
    v11 = *(_QWORD *)(v8 + 16);
    if (v11)
      break;
    v12 = 0;
LABEL_26:
    v17 = v10 + v12;
    if (__OFADD__(v10, v12))
      goto LABEL_37;
    v19 = *(_QWORD *)(v20 + 16);
    v18 = *(_QWORD *)(v20 + 24);
    if (v19 >= v18 >> 1)
      sub_248992D24(v18 > 1, v19 + 1, 1);
    ++v4;
    *(_QWORD *)(v20 + 16) = v19 + 1;
    *(_QWORD *)(v20 + 8 * v19 + 32) = v17;
    if (v4 == v1)
      return v2;
  }
  v12 = 0;
  v13 = (unint64_t *)(v8 + 40);
  while (1)
  {
    v14 = *v13;
    if ((*v13 & 0x1000000000000000) != 0)
    {
      result = sub_2489A8268();
      v15 = result + 16;
      if (__OFADD__(result, 16))
        goto LABEL_36;
    }
    else
    {
      if ((v14 & 0x2000000000000000) != 0)
        result = HIBYTE(v14) & 0xF;
      else
        result = *(v13 - 1) & 0xFFFFFFFFFFFFLL;
      v15 = result + 16;
      if (__OFADD__(result, 16))
        goto LABEL_36;
    }
    v16 = __OFADD__(v12, v15);
    v12 += v15;
    if (v16)
      break;
    v13 += 2;
    if (!--v11)
      goto LABEL_26;
  }
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_24898FD28(uint64_t a1)
{
  int64_t v1;
  uint64_t result;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(a1 + 16);
  result = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v5 = MEMORY[0x24BEE4AF8];
    sub_248992D24(0, v1, 0);
    result = v5;
    do
    {
      v6 = result;
      v4 = *(_QWORD *)(result + 16);
      v3 = *(_QWORD *)(result + 24);
      if (v4 >= v3 >> 1)
      {
        sub_248992D24(v3 > 1, v4 + 1, 1);
        result = v6;
      }
      *(_QWORD *)(result + 16) = v4 + 1;
      *(_QWORD *)(result + 8 * v4 + 32) = 24;
      --v1;
    }
    while (v1);
  }
  return result;
}

uint64_t sub_24898FDDC(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t v24;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (!v1)
    return v2;
  v24 = MEMORY[0x24BEE4AF8];
  sub_248992D24(0, v1, 0);
  v4 = 0;
  v2 = v24;
  v22 = v1;
  v23 = a1 + 32;
  while (1)
  {
    v5 = (_QWORD *)(v23 + 32 * v4);
    v6 = v5[1];
    v8 = v5[2];
    v7 = v5[3];
    if ((v6 & 0x1000000000000000) != 0)
    {
      result = sub_2489A8268();
      v10 = result + 48;
      if (__OFADD__(result, 48))
        goto LABEL_27;
    }
    else
    {
      if ((v6 & 0x2000000000000000) != 0)
        result = HIBYTE(v6) & 0xF;
      else
        result = *v5 & 0xFFFFFFFFFFFFLL;
      v10 = result + 48;
      if (__OFADD__(result, 48))
        goto LABEL_27;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    v11 = sub_24898FB94(v8);
    result = swift_bridgeObjectRelease();
    v12 = *(_QWORD *)(v11 + 16);
    if (v12)
      break;
    v13 = 0;
LABEL_14:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    v17 = v10 + v13;
    if (__OFADD__(v10, v13))
      goto LABEL_25;
    v18 = *(_QWORD *)(v7 + 16);
    v19 = v17 + v18;
    if (__OFADD__(v17, v18))
      goto LABEL_26;
    v21 = *(_QWORD *)(v24 + 16);
    v20 = *(_QWORD *)(v24 + 24);
    if (v21 >= v20 >> 1)
      sub_248992D24(v20 > 1, v21 + 1, 1);
    ++v4;
    *(_QWORD *)(v24 + 16) = v21 + 1;
    *(_QWORD *)(v24 + 8 * v21 + 32) = v19;
    if (v4 == v22)
      return v2;
  }
  v13 = 0;
  v14 = (uint64_t *)(v11 + 32);
  while (1)
  {
    v15 = *v14++;
    v16 = __OFADD__(v13, v15);
    v13 += v15;
    if (v16)
      break;
    if (!--v12)
      goto LABEL_14;
  }
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_24898FFA4()
{
  _QWORD *v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;

  v1 = v0[1];
  v3 = v0[2];
  v2 = v0[3];
  if ((v1 & 0x1000000000000000) != 0)
    goto LABEL_16;
  if ((v1 & 0x2000000000000000) != 0)
    result = HIBYTE(v1) & 0xF;
  else
    result = *v0 & 0xFFFFFFFFFFFFLL;
  v5 = result + 48;
  if (__OFADD__(result, 48))
  {
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  while (1)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    v6 = sub_24898FB94(v3);
    swift_bridgeObjectRelease();
    v7 = *(_QWORD *)(v6 + 16);
    if (!v7)
      break;
    v8 = 0;
    v9 = (uint64_t *)(v6 + 32);
    while (1)
    {
      v10 = *v9++;
      v11 = __OFADD__(v8, v10);
      v8 += v10;
      if (v11)
        break;
      if (!--v7)
        goto LABEL_12;
    }
    __break(1u);
LABEL_16:
    result = sub_2489A8268();
    v5 = result + 48;
    if (__OFADD__(result, 48))
      goto LABEL_18;
  }
  v8 = 0;
LABEL_12:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  v12 = v5 + v8;
  if (__OFADD__(v5, v8))
    goto LABEL_19;
  v13 = *(_QWORD *)(v2 + 16);
  result = v12 + v13;
  if (__OFADD__(v12, v13))
LABEL_20:
    __break(1u);
  return result;
}

uint64_t sub_2489900B0(unint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  unint64_t v3;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  _BYTE *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int64_t v32;
  BOOL v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t result;
  uint64_t v41;
  int64_t v42;
  BOOL v43;
  int64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v6 = *v2;
  v7 = v2[1];
  v8 = v2[2];
  v9 = v2[3];
  v10 = sub_24898FFA4();
  v11 = v10;
  if (a1)
  {
    if ((uint64_t)(a2 - a1) >= v10)
      goto LABEL_3;
LABEL_12:
    sub_24899303C();
    swift_allocError();
    *v20 = 0;
    swift_willThrow();
    return v11;
  }
  if (v10 > 0)
    goto LABEL_12;
LABEL_3:
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  v12 = sub_24898FB94(v8);
  v13 = v3;
  swift_bridgeObjectRelease();
  v14 = *(_QWORD *)(v12 + 16);
  v48 = v8;
  if (v14)
  {
    v15 = 0;
    v16 = 0;
    do
    {
      v17 = *(_QWORD *)(v12 + 8 * v15 + 32);
      v18 = __OFADD__(v16, v17);
      v16 += v17;
      if (v18)
      {
        __break(1u);
LABEL_71:
        __break(1u);
LABEL_72:
        __break(1u);
        goto LABEL_73;
      }
      ++v15;
    }
    while (v14 != v15);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v7 & 0x1000000000000000) != 0)
      goto LABEL_73;
    if ((v7 & 0x2000000000000000) == 0)
      goto LABEL_9;
LABEL_15:
    v19 = HIBYTE(v7) & 0xF;
    if ((v11 & 0x8000000000000000) == 0)
      goto LABEL_16;
    goto LABEL_74;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v16 = 0;
  if ((v7 & 0x1000000000000000) != 0)
  {
LABEL_73:
    v19 = sub_2489A8268();
    if ((v11 & 0x8000000000000000) == 0)
      goto LABEL_16;
    goto LABEL_74;
  }
  if ((v7 & 0x2000000000000000) != 0)
    goto LABEL_15;
LABEL_9:
  v19 = v6 & 0xFFFFFFFFFFFFLL;
  if ((v11 & 0x8000000000000000) == 0)
  {
LABEL_16:
    if (v19 < 0 || (v16 & 0x8000000000000000) != 0)
      goto LABEL_74;
    v21 = *(_QWORD *)(v48 + 16);
    v22 = *(_QWORD *)(v9 + 16);
    *(_QWORD *)a1 = 0x434F4D5044415441;
    *(_QWORD *)(a1 + 8) = v11;
    *(_QWORD *)(a1 + 16) = v19;
    *(_QWORD *)(a1 + 24) = v16;
    *(_QWORD *)(a1 + 32) = v21;
    *(_QWORD *)(a1 + 40) = v22;
    if (a1)
      v23 = a2 - a1;
    else
      v23 = 0;
    if (v23 <= 47)
      goto LABEL_75;
    v24 = (void *)sub_24898CFD0(48, v23, a1);
    v26 = sub_24898EE00(v24, v25, v6, v7);
    v16 = v13;
    if (!v13)
    {
      v41 = v11;
      v7 = sub_2489893DC(v26, 48, v23, a1, a2);
      v11 = v27;
      v30 = v28;
      v31 = *(_QWORD *)(v48 + 16);
      if (v31)
      {
        if (v28)
          v32 = v29 - v28;
        else
          v32 = 0;
        v44 = v32;
        v42 = v29 - v28;
        v34 = v27 < 0 || v29 - v28 < v27;
        v43 = v34;
        swift_bridgeObjectRetain();
        a2 = 0;
        v45 = v11;
        v46 = v9;
        v47 = v30;
        while (1)
        {
          if (v30)
            v35 = v30 + v7;
          else
            v35 = 0;
          a1 = v11 - v7;
          v6 = __OFSUB__(v11, v7);
          if ((a1 & 0x8000000000000000) != 0)
            goto LABEL_81;
          v49 = v31;
          if (a1)
            break;
          if (v35)
            goto LABEL_45;
          v36 = 0;
LABEL_46:
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v13 = sub_24898F428(v35, v36);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v13 & 0x8000000000000000) != 0)
            goto LABEL_80;
          v11 = v45;
          v9 = v46;
          v30 = v47;
          if (v44 < 0)
          {
            sub_2489A8448();
            __break(1u);
            goto LABEL_80;
          }
          if ((v7 & 0x8000000000000000) != 0 || v44 < (uint64_t)v7)
            goto LABEL_80;
          if (v47)
          {
            if (v43)
              goto LABEL_80;
          }
          else if (v45)
          {
            goto LABEL_80;
          }
          if ((v6 & 1) != 0)
            goto LABEL_71;
          v37 = v45;
          if (a1 >= v13)
          {
            v37 = v7 + v13;
            if (__OFADD__(v7, v13))
              goto LABEL_72;
            if (v47)
            {
              if ((v37 & 0x8000000000000000) != 0 || v42 < (uint64_t)v37)
                goto LABEL_80;
              if (v45 < v37)
                goto LABEL_82;
            }
            else if (v37)
            {
              goto LABEL_80;
            }
          }
          if (v37 < v7)
            goto LABEL_80;
          a2 += 40;
          v7 = v37;
          v31 = v49 - 1;
          if (v49 == 1)
          {
            swift_bridgeObjectRelease();
            v30 = v47;
            goto LABEL_68;
          }
        }
        if (!v35)
          goto LABEL_81;
LABEL_45:
        v36 = v35 + a1;
        goto LABEL_46;
      }
      v37 = v7;
LABEL_68:
      v38 = v9 + 32 + *(_QWORD *)(v9 + 16);
      v39 = (void *)sub_24898CFD0(v37, v11, v30);
      sub_2489A22B8((void *)(v9 + 32), v38, v39);
      return v41;
    }
    return v11;
  }
LABEL_74:
  sub_2489A8400();
  __break(1u);
LABEL_75:
  __break(1u);
LABEL_80:
  sub_2489A8400();
  __break(1u);
LABEL_81:
  sub_2489A8448();
  __break(1u);
LABEL_82:
  result = sub_2489A8400();
  __break(1u);
  return result;
}

uint64_t ComponentInitDataBuilder.Endpoint.identifier.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t ComponentInitDataBuilder.Endpoint.init(identifier:numHandlers:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

Tightbeam::ComponentInitDataBuilder __swiftcall ComponentInitDataBuilder.init(components:endpoints:)(Swift::OpaquePointer components, Swift::OpaquePointer endpoints)
{
  Swift::OpaquePointer *v2;
  Tightbeam::ComponentInitDataBuilder result;

  v2->_rawValue = components._rawValue;
  v2[1]._rawValue = endpoints._rawValue;
  result.endpoints = endpoints;
  result.components = components;
  return result;
}

uint64_t ComponentInitDataBuilder.encodedByteSize.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;

  v0 = swift_bridgeObjectRetain();
  v1 = sub_24898FD28(v0);
  result = swift_bridgeObjectRelease();
  v3 = *(_QWORD *)(v1 + 16);
  if (v3)
  {
    v4 = 0;
    v5 = (uint64_t *)(v1 + 32);
    while (1)
    {
      v6 = *v5++;
      v7 = __OFADD__(v4, v6);
      v4 += v6;
      if (v7)
        break;
      if (!--v3)
        goto LABEL_7;
    }
    __break(1u);
    goto LABEL_17;
  }
  v4 = 0;
LABEL_7:
  result = swift_bridgeObjectRelease();
  v7 = __OFADD__(v4, 32);
  v8 = v4 + 32;
  if (v7)
    goto LABEL_18;
  v9 = swift_bridgeObjectRetain();
  v10 = sub_24898FDDC(v9);
  result = swift_bridgeObjectRelease();
  v11 = *(_QWORD *)(v10 + 16);
  if (v11)
  {
    v12 = 0;
    v13 = (uint64_t *)(v10 + 32);
    while (1)
    {
      v14 = *v13++;
      v7 = __OFADD__(v12, v14);
      v12 += v14;
      if (v7)
        break;
      if (!--v11)
        goto LABEL_14;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    return result;
  }
  v12 = 0;
LABEL_14:
  swift_bridgeObjectRelease();
  result = v8 + v12;
  if (__OFADD__(v8, v12))
    goto LABEL_19;
  return result;
}

uint64_t ComponentInitDataBuilder.encode(into:)(_QWORD *a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  _QWORD *v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  __int128 *v18;
  unint64_t v19;
  unint64_t v20;
  BOOL v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v4 = v3;
  v8 = *v2;
  v7 = v2[1];
  result = ComponentInitDataBuilder.encodedByteSize.getter();
  v10 = a1;
  if (!a1)
  {
    if (result <= 0)
      goto LABEL_7;
LABEL_5:
    sub_24899303C();
    swift_allocError();
    *v11 = 0;
    return swift_willThrow();
  }
  if (a2 - (uint64_t)a1 < result)
    goto LABEL_5;
LABEL_7:
  if (result < 0)
  {
    result = sub_2489A8400();
    __break(1u);
    return result;
  }
  v12 = *(_QWORD *)(v7 + 16);
  v13 = *(_QWORD *)(v8 + 16);
  *a1 = 0x494E495444415441;
  a1[1] = result;
  a1[2] = v12;
  a1[3] = v13;
  v14 = a2 - (_QWORD)a1;
  if (a1)
    v15 = a2 - (_QWORD)a1;
  else
    v15 = 0;
  if (v15 <= 31)
  {
LABEL_55:
    __break(1u);
    while (1)
    {
LABEL_56:
      sub_2489A8400();
      __break(1u);
LABEL_57:
      sub_2489A8448();
      __break(1u);
LABEL_58:
      sub_2489A8400();
      __break(1u);
    }
  }
  v16 = *(_QWORD *)(v7 + 16);
  if (!v16)
  {
    v24 = 32;
    v25 = *(_QWORD *)(v8 + 16);
    if (!v25)
      return result;
    goto LABEL_31;
  }
  v17 = 0;
  v18 = (__int128 *)(v7 + 32);
  v19 = (v15 - 8) / 0x18uLL;
  do
  {
    v20 = v15 - (v17 + 32);
    v21 = __OFSUB__(v15, v17 + 32);
    if (!v19)
      goto LABEL_57;
    if (!v20)
      goto LABEL_5;
    if (!v10)
      goto LABEL_57;
    if (v20 < 0x18)
      goto LABEL_5;
    v22 = *v18;
    v10[v17 / 8 + 4] = 0x454E445044415441;
    *(_OWORD *)&v10[v17 / 8 + 5] = v22;
    if (v14 < (uint64_t)(v17 + 32))
      goto LABEL_56;
    if (v21)
    {
      __break(1u);
LABEL_53:
      __break(1u);
LABEL_54:
      __break(1u);
      goto LABEL_55;
    }
    if (v17 == 0x7FFFFFFFFFFFFFC8)
      goto LABEL_53;
    v23 = v17 + 56;
    if (((v17 + 56) & 0x8000000000000000) != 0 || v14 < v23)
      goto LABEL_56;
    if (v14 < (unint64_t)v23)
      goto LABEL_58;
    v17 += 24;
    --v19;
    ++v18;
    --v16;
  }
  while (v16);
  v24 = v17 + 32;
  v25 = *(_QWORD *)(v8 + 16);
  if (v25)
  {
LABEL_31:
    swift_bridgeObjectRetain();
    v32 = (uint64_t)v10 + v15;
    v26 = v8 + 56;
    v33 = a2;
    v35 = (uint64_t)v10;
    while (1)
    {
      v34 = v25;
      if (v10)
        v27 = (unint64_t)v10 + v24;
      else
        v27 = 0;
      if (v15 - v24 < 0)
        goto LABEL_57;
      if (v15 != v24)
        break;
      if (v10)
        goto LABEL_40;
      v28 = 0;
LABEL_41:
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v29 = sub_2489900B0(v27, v28);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v4)
        return swift_bridgeObjectRelease();
      if (v29 < 0)
        goto LABEL_56;
      v30 = sub_24898CF40(v24, v15, v35, v33);
      if (!v29 || v30 < 0 || (v31 = v15, v30 >= v29))
      {
        v31 = v24 + v29;
        if (__OFADD__(v24, v29))
          goto LABEL_54;
        if (v31 < 0 || v15 < v31)
          goto LABEL_56;
      }
      if (v31 < v24)
        goto LABEL_56;
      v26 += 32;
      v24 = v31;
      v25 = v34 - 1;
      v10 = (_QWORD *)v35;
      if (v34 == 1)
        return swift_bridgeObjectRelease();
    }
    if (!v10)
      goto LABEL_57;
LABEL_40:
    v28 = v32;
    goto LABEL_41;
  }
  return result;
}

uint64_t sub_248990C7C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  unint64_t v5;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;

  if (a1)
  {
    v5 = a2 - (_QWORD)a1;
    if (a2 - (uint64_t)a1 >= 16)
    {
      if (*a1 == 0x5459504544415441)
      {
        v7 = a1[1];
        if ((v7 & 0x8000000000000000) != 0)
        {
          sub_2489A8400();
          __break(1u);
        }
        else if (v5 >= v7)
        {
          v8 = sub_248990F80(v7, (uint64_t)a1, a2);
          result = sub_248992F14(v8, v9, v10, v11);
          *a3 = result;
          a3[1] = v13;
          return result;
        }
        sub_2489A83B8();
        sub_2489A825C();
        sub_248993108();
        sub_2489A8394();
        sub_2489A825C();
        swift_bridgeObjectRelease();
        sub_2489A825C();
        sub_24898D158();
        sub_2489A8394();
        sub_2489A825C();
        swift_bridgeObjectRelease();
        sub_2489A825C();
      }
      else
      {
        sub_2489A83B8();
        swift_bridgeObjectRelease();
        sub_248993108();
        sub_2489A8394();
        sub_2489A825C();
        swift_bridgeObjectRelease();
        sub_2489A825C();
        sub_2489A8394();
        sub_2489A825C();
        swift_bridgeObjectRelease();
      }
    }
  }
  result = sub_2489A840C();
  __break(1u);
  return result;
}

uint64_t sub_248990F80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  if ((a1 & 0x8000000000000000) == 0)
  {
    if (a2)
    {
      if (a3 - a2 >= a1)
        return 0;
    }
    else if (!a1)
    {
      return 0;
    }
    sub_2489A8448();
    __break(1u);
  }
  result = sub_2489A8400();
  __break(1u);
  return result;
}

uint64_t sub_248991050()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  v1 = *v0;
  if (*v0 && v0[1] - v1 >= 16)
  {
    v2 = *(_QWORD *)(v1 + 8);
    if ((v2 & 0x8000000000000000) == 0)
      return v2 - 16;
  }
  else
  {
    sub_2489A840C();
    __break(1u);
  }
  result = sub_2489A8400();
  __break(1u);
  return result;
}

uint64_t ComponentInitDataReader.TypeData.type()()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
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

  v1 = sub_2489893F0(16, *v0, v0[1]);
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v8 = sub_248991050();
  v9 = sub_24898CD54(v8, v1, v3, v5, v7);
  return sub_248992F14(v9, v10, v11, v12);
}

uint64_t sub_2489911A4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  unint64_t v5;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;

  if (a1)
  {
    v5 = a2 - (_QWORD)a1;
    if (a2 - (uint64_t)a1 >= 37)
    {
      if (*a1 == 0x434C4E5444415441)
      {
        v7 = a1[1];
        if ((v7 & 0x8000000000000000) != 0)
        {
          sub_2489A8400();
          __break(1u);
        }
        else if (v5 >= v7)
        {
          v8 = sub_248990F80(v7, (uint64_t)a1, a2);
          result = sub_248992F14(v8, v9, v10, v11);
          *a3 = result;
          a3[1] = v13;
          return result;
        }
        sub_2489A83B8();
        sub_2489A825C();
        sub_248993108();
        sub_2489A8394();
        sub_2489A825C();
        swift_bridgeObjectRelease();
        sub_2489A825C();
        sub_24898D158();
        sub_2489A8394();
        sub_2489A825C();
        swift_bridgeObjectRelease();
        sub_2489A825C();
      }
      else
      {
        sub_2489A83B8();
        swift_bridgeObjectRelease();
        sub_248993108();
        sub_2489A8394();
        sub_2489A825C();
        swift_bridgeObjectRelease();
        sub_2489A825C();
        sub_2489A8394();
        sub_2489A825C();
        swift_bridgeObjectRelease();
      }
    }
  }
  result = sub_2489A840C();
  __break(1u);
  return result;
}

uint64_t ComponentInitDataReader.Client.propertyName()()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
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
  uint64_t result;

  v1 = *v0;
  if (!*v0 || (v2 = v0[1], v2 - v1 < 37))
  {
    sub_2489A840C();
    __break(1u);
LABEL_11:
    result = sub_2489A8400();
    __break(1u);
    return result;
  }
  v3 = *(_QWORD *)(v1 + 21);
  if (v3 < 0)
    goto LABEL_11;
  if (!v3)
    return 0;
  v7 = sub_2489893F0(37, v1, v2);
  v8 = *(_QWORD *)(v1 + 21);
  if (v8 < 0)
    goto LABEL_11;
  v9 = sub_24898CD54(v8, v7, v4, v5, v6);
  result = sub_248992F14(v9, v10, v11, v12);
  if (!result)
    return 0;
  return result;
}

uint64_t sub_2489915E0()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
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
  uint64_t result;

  v1 = *v0;
  v2 = v0[1];
  v3 = sub_2489893F0(37, v1, v2);
  if (v1 && v2 - v1 >= 37)
  {
    v7 = v3;
    v8 = *(_QWORD *)(v1 + 21);
    if ((v8 & 0x8000000000000000) == 0)
    {
      v9 = sub_2489893DC(v8, v7, v4, v5, v6);
      return sub_248992F14(v9, v10, v11, v12);
    }
  }
  else
  {
    sub_2489A840C();
    __break(1u);
  }
  result = sub_2489A8400();
  __break(1u);
  return result;
}

uint64_t ComponentInitDataReader.ClientBuffer.subscript.getter@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v2;
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
  BOOL v16;
  uint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  BOOL v20;
  uint64_t v21;
  uint64_t result;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v28;
  unint64_t v29;

  v3 = *v2;
  v4 = v2[1];
  v5 = v2[2];
  v6 = sub_2489893F0(0, v3, v4);
  if (v5 < 1)
  {
LABEL_57:
    v28 = 0;
    v29 = 0xE000000000000000;
    sub_2489A83B8();
    swift_bridgeObjectRelease();
    v28 = 0xD00000000000001CLL;
    v29 = 0x80000002489AB7E0;
    sub_24898D158();
    sub_2489A8394();
    sub_2489A825C();
    swift_bridgeObjectRelease();
LABEL_58:
    sub_2489A840C();
    __break(1u);
LABEL_59:
    sub_2489A8400();
    __break(1u);
LABEL_60:
    sub_2489A8448();
    __break(1u);
LABEL_61:
    sub_2489A8400();
    __break(1u);
  }
  else
  {
    v10 = v6;
    if ((v6 & 0x8000000000000000) == 0)
    {
      v11 = v7;
      v12 = v8;
      v13 = v9 - v8;
      if (v8)
        v14 = v9 - v8;
      else
        v14 = 0;
      v16 = v7 < 0 || v13 < v7;
      v17 = a1;
      while (1)
      {
        if (v12)
        {
          if (v13 < v11)
            goto LABEL_62;
          v18 = (_QWORD *)(v12 + v10);
        }
        else
        {
          if (v11 > 0)
            goto LABEL_62;
          v18 = 0;
        }
        v19 = v11 - v10;
        v20 = __OFSUB__(v11, v10);
        if ((v19 & 0x8000000000000000) != 0)
          goto LABEL_62;
        if (v19)
          break;
        if (v18)
          goto LABEL_26;
        v21 = 0;
LABEL_27:
        result = sub_2489911A4(v18, v21, &v28);
        v23 = v29;
        if (!v17)
        {
          *a2 = v28;
          a2[1] = v23;
          return result;
        }
        if (!v28 || (uint64_t)(v29 - v28) < 37)
          goto LABEL_58;
        v24 = *(_QWORD *)(v28 + 8);
        if ((v24 & 0x8000000000000000) != 0)
          goto LABEL_59;
        if (v14 < 0)
          goto LABEL_60;
        if (v14 < v10)
          goto LABEL_61;
        if (v12)
        {
          if (v16)
            goto LABEL_61;
        }
        else if (v11)
        {
          goto LABEL_61;
        }
        if (v20)
        {
          __break(1u);
LABEL_52:
          __break(1u);
          goto LABEL_61;
        }
        v25 = v11;
        if (v19 >= v24)
        {
          v25 = v10 + v24;
          if (__OFADD__(v10, v24))
            goto LABEL_52;
          if (v12)
          {
            if (v25 < 0 || v13 < v25)
              goto LABEL_61;
            if (v11 < (unint64_t)v25)
              goto LABEL_63;
          }
          else if (v25)
          {
            goto LABEL_61;
          }
        }
        if (v25 < v10)
          goto LABEL_61;
        --v17;
        v10 = v25;
        if (!--v5)
          goto LABEL_57;
      }
      if (!v18)
        goto LABEL_62;
LABEL_26:
      v21 = (uint64_t)v18 + v19;
      goto LABEL_27;
    }
  }
LABEL_62:
  sub_2489A8448();
  __break(1u);
LABEL_63:
  result = sub_2489A8400();
  __break(1u);
  return result;
}

BOOL static ComponentInitDataReader.Component.Error.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t ComponentInitDataReader.Component.Error.hash(into:)()
{
  return sub_2489A84E4();
}

BOOL sub_248991B74(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t ComponentInitDataReader.Component.identifier()()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
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
  uint64_t result;

  v1 = *v0;
  v2 = v0[1];
  v3 = sub_2489893F0(48, v1, v2);
  if (v1 && v2 - v1 >= 48)
  {
    v7 = v3;
    v8 = *(_QWORD *)(v1 + 16);
    if ((v8 & 0x8000000000000000) == 0)
    {
      v9 = sub_24898CD54(v8, v7, v4, v5, v6);
      return sub_248992F14(v9, v10, v11, v12);
    }
  }
  else
  {
    sub_2489A840C();
    __break(1u);
  }
  result = sub_2489A8400();
  __break(1u);
  return result;
}

uint64_t sub_248991CA4()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t result;

  v1 = *v0;
  v2 = v0[1];
  v3 = sub_2489893F0(48, v1, v2);
  if (v1 && v2 - v1 >= 48)
  {
    v7 = v3;
    v8 = *(_QWORD *)(v1 + 16);
    if ((v8 & 0x8000000000000000) == 0)
    {
      v12 = sub_2489893DC(v8, v7, v4, v5, v6);
      v13 = *(_QWORD *)(v1 + 24);
      if ((v13 & 0x8000000000000000) == 0)
      {
        v14 = sub_24898CD54(v13, v12, v9, v10, v11);
        return sub_248992F14(v14, v15, v16, v17);
      }
    }
  }
  else
  {
    sub_2489A840C();
    __break(1u);
  }
  result = sub_2489A8400();
  __break(1u);
  return result;
}

uint64_t ComponentInitDataReader.Component.clients.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  v3 = *v1;
  if (*v1 && v1[1] - v3 >= 48)
  {
    v4 = *(_QWORD *)(v3 + 32);
    if ((v4 & 0x8000000000000000) == 0)
    {
      result = sub_248991CA4();
      *a1 = result;
      a1[1] = v6;
      a1[2] = v4;
      return result;
    }
  }
  else
  {
    sub_2489A840C();
    __break(1u);
  }
  result = sub_2489A8400();
  __break(1u);
  return result;
}

uint64_t ComponentInitDataReader.ComponentBuffer.count.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t ComponentInitDataReader.ComponentBuffer.subscript.getter@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v15;
  uint64_t v16;
  _QWORD *v17;
  unint64_t v18;
  BOOL v19;
  unint64_t v20;
  uint64_t v21;
  char v22;
  char *v23;

  v5 = *v2;
  v6 = v2[1];
  v7 = v2[2];
  result = sub_2489893F0(0, v5, v6);
  if (v7 < 1)
  {
LABEL_46:
    sub_2489A83B8();
    sub_24898D158();
    sub_2489A8394();
    swift_bridgeObjectRelease();
    sub_2489A825C();
    while (1)
    {
LABEL_57:
      sub_2489A840C();
      __break(1u);
    }
  }
  if (result < 0)
  {
LABEL_52:
    sub_2489A8448();
    __break(1u);
LABEL_53:
    v22 = 1;
    goto LABEL_56;
  }
  v12 = v11 - v10;
  if (v10)
    v13 = v11 - v10;
  else
    v13 = 0;
  v15 = v9 < 0 || v12 < v9;
  v16 = a1;
  while (1)
  {
    if (v10)
    {
      if (v12 < v9)
        goto LABEL_52;
      v17 = (_QWORD *)(v10 + result);
    }
    else
    {
      if (v9 > 0)
        goto LABEL_52;
      v17 = 0;
    }
    v18 = v9 - result;
    v19 = __OFSUB__(v9, result);
    if ((v18 & 0x8000000000000000) != 0)
      goto LABEL_52;
    if (!v18)
      goto LABEL_51;
    if (!v17)
      goto LABEL_52;
    if (v18 < 0x30)
    {
LABEL_51:
      v22 = 0;
LABEL_56:
      sub_248993080();
      swift_allocError();
      *v23 = v22;
      swift_willThrow();
      sub_2489A83B8();
      sub_2489A825C();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2577A3B68);
      sub_2489A83F4();
      goto LABEL_57;
    }
    if (*v17 != 0x434F4D5044415441)
      goto LABEL_53;
    v20 = v17[1];
    if ((v20 & 0x8000000000000000) != 0)
    {
      sub_2489A8400();
      __break(1u);
LABEL_55:
      v22 = 2;
      goto LABEL_56;
    }
    if (v18 < v20)
      goto LABEL_55;
    if (!v16)
    {
      *a2 = v17;
      a2[1] = (char *)v17 + v20;
      return result;
    }
    if (v20 <= 0x2F)
      goto LABEL_57;
    if (v13 < 0)
      break;
    if (v13 < result)
      goto LABEL_61;
    if (v10)
    {
      if (v15)
        goto LABEL_61;
    }
    else if (v9)
    {
      goto LABEL_61;
    }
    if (v19)
    {
      __break(1u);
LABEL_49:
      __break(1u);
      goto LABEL_61;
    }
    v21 = result + v20;
    if (__OFADD__(result, v20))
      goto LABEL_49;
    if (v10)
    {
      if (v21 < 0 || v12 < v21)
        goto LABEL_61;
    }
    else if (v21)
    {
      goto LABEL_61;
    }
    if (v9 < (unint64_t)v21)
      goto LABEL_60;
    if (v21 < result)
      goto LABEL_61;
    --v16;
    result += v20;
    if (!--v7)
      goto LABEL_46;
  }
  sub_2489A8448();
  __break(1u);
LABEL_60:
  sub_2489A8400();
  __break(1u);
LABEL_61:
  result = sub_2489A8400();
  __break(1u);
  return result;
}

uint64_t ComponentInitDataReader.Error.description.getter()
{
  _BYTE *v0;
  unint64_t v1;

  v1 = 0x64696C61766E692ELL;
  if (*v0 != 1)
    v1 = 0xD000000000000010;
  if (*v0)
    return v1;
  else
    return 0x696146646E69622ELL;
}

uint64_t sub_248992428()
{
  _BYTE *v0;
  unint64_t v1;

  v1 = 0x64696C61766E692ELL;
  if (*v0 != 1)
    v1 = 0xD000000000000010;
  if (*v0)
    return v1;
  else
    return 0x696146646E69622ELL;
}

_QWORD *ComponentInitDataReader.init(start:count:)@<X0>(_QWORD *result@<X0>, unint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  char v3;
  char *v4;

  if ((a2 & 0x8000000000000000) != 0)
  {
    result = (_QWORD *)sub_2489A8448();
    __break(1u);
  }
  else
  {
    if (a2 >= 0x20)
    {
      if (*result == 0x494E495444415441)
      {
        if (result[1] == a2)
        {
          *a3 = result;
          a3[1] = (char *)result + a2;
          return result;
        }
        v3 = 2;
      }
      else
      {
        v3 = 1;
      }
    }
    else
    {
      v3 = 0;
    }
    sub_2489930C4();
    swift_allocError();
    *v4 = v3;
    return (_QWORD *)swift_willThrow();
  }
  return result;
}

uint64_t sub_24899258C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;

  v1 = *v0;
  v2 = v0[1];
  v3 = sub_2489893F0(32, v1, v2);
  if (!v1 || v2 - v1 < 32)
  {
LABEL_7:
    sub_2489A840C();
    __break(1u);
    goto LABEL_8;
  }
  v7 = *(_QWORD *)(v1 + 16);
  if ((v7 & 0x8000000000000000) == 0)
  {
    if ((unsigned __int128)(v7 * (__int128)24) >> 64 == (24 * v7) >> 63)
    {
      v8 = sub_24898CD54(24 * v7, v3, v4, v5, v6);
      return sub_248992F14(v8, v9, v10, v11);
    }
    __break(1u);
    goto LABEL_7;
  }
LABEL_8:
  result = sub_2489A8400();
  __break(1u);
  return result;
}

uint64_t ComponentInitDataReader.endpointCount.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t result;

  v1 = *v0;
  if (!*v0 || v0[1] - v1 < 32)
  {
    sub_2489A840C();
    __break(1u);
    goto LABEL_6;
  }
  result = *(_QWORD *)(v1 + 16);
  if (result < 0)
  {
LABEL_6:
    result = sub_2489A8400();
    __break(1u);
  }
  return result;
}

uint64_t ComponentInitDataReader.totalClientCount.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v1 = *v0;
  v2 = v0[1];
  *(_QWORD *)&v8 = *v0;
  *((_QWORD *)&v8 + 1) = v2;
  result = ComponentInitDataReader.components.getter((uint64_t *)&v11);
  v4 = v12;
  if ((v12 & 0x8000000000000000) == 0)
  {
    v5 = 0;
    if (!v12)
      return v5;
    v6 = 0;
    while (1)
    {
      *(_QWORD *)&v8 = v1;
      *((_QWORD *)&v8 + 1) = v2;
      ComponentInitDataReader.components.getter((uint64_t *)&v11);
      v8 = v11;
      v9 = v12;
      ComponentInitDataReader.ComponentBuffer.subscript.getter(v6, &v10);
      result = ComponentInitDataReader.Component.clients.getter((uint64_t *)&v8);
      v7 = __OFADD__(v5, v9);
      v5 += v9;
      if (v7)
        break;
      if (v4 == ++v6)
        return v5;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t ComponentInitDataReader.components.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  v3 = *v1;
  if (*v1 && v1[1] - v3 >= 32)
  {
    v4 = *(_QWORD *)(v3 + 24);
    if ((v4 & 0x8000000000000000) == 0)
    {
      result = sub_248992C04();
      *a1 = result;
      a1[1] = v6;
      a1[2] = v4;
      return result;
    }
  }
  else
  {
    sub_2489A840C();
    __break(1u);
  }
  result = sub_2489A8400();
  __break(1u);
  return result;
}

uint64_t ComponentInitDataReader.totalTypesCount.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;

  v1 = *v0;
  v2 = v0[1];
  *(_QWORD *)&v14 = *v0;
  *((_QWORD *)&v14 + 1) = v2;
  result = ComponentInitDataReader.components.getter((uint64_t *)&v16);
  v4 = v17;
  if ((v17 & 0x8000000000000000) == 0)
  {
    v5 = 0;
    if (!v17)
      return v5;
    v6 = 0;
    while (1)
    {
      *(_QWORD *)&v14 = v1;
      *((_QWORD *)&v14 + 1) = v2;
      ComponentInitDataReader.components.getter((uint64_t *)&v16);
      v14 = v16;
      v15 = v17;
      ComponentInitDataReader.ComponentBuffer.subscript.getter(v6, &v10);
      v13 = v10;
      result = ComponentInitDataReader.Component.clients.getter((uint64_t *)&v14);
      v7 = v15;
      if (v15 < 0)
        break;
      if (v15)
      {
        v8 = 0;
        while (1)
        {
          *(_QWORD *)&v14 = v1;
          *((_QWORD *)&v14 + 1) = v2;
          ComponentInitDataReader.components.getter((uint64_t *)&v16);
          v14 = v16;
          v15 = v17;
          ComponentInitDataReader.ComponentBuffer.subscript.getter(v6, &v13);
          v10 = v13;
          ComponentInitDataReader.Component.clients.getter((uint64_t *)&v14);
          v10 = v14;
          v11 = v15;
          ComponentInitDataReader.ClientBuffer.subscript.getter(v8, &v12);
          result = ComponentInitDataReader.Client.types.getter((uint64_t *)&v10);
          v9 = __OFADD__(v5, v11);
          v5 += v11;
          if (v9)
            break;
          if (v7 == ++v8)
            goto LABEL_4;
        }
        __break(1u);
        break;
      }
LABEL_4:
      if (++v6 == v4)
        return v5;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t ComponentInitDataReader.endpoint(at:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  if (*(_QWORD *)(sub_24899258C() + 24 * a1) == 0x454E445044415441)
  {
    v4 = 24 * a1;
    v5 = *(_QWORD *)(sub_24899258C() + v4 + 8);
    result = sub_24899258C();
    v7 = *(_QWORD *)(result + v4 + 16);
    *a2 = v5;
    a2[1] = v7;
  }
  else
  {
    sub_2489A83B8();
    swift_bridgeObjectRelease();
    sub_248993108();
    sub_2489A8394();
    sub_2489A825C();
    swift_bridgeObjectRelease();
    result = sub_2489A840C();
    __break(1u);
  }
  return result;
}

uint64_t sub_248992C04()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;

  v1 = *v0;
  v2 = v0[1];
  v3 = sub_2489893F0(32, v1, v2);
  if (!v1 || v2 - v1 < 32)
  {
LABEL_7:
    sub_2489A840C();
    __break(1u);
    goto LABEL_8;
  }
  v7 = *(_QWORD *)(v1 + 16);
  if ((v7 & 0x8000000000000000) == 0)
  {
    if ((unsigned __int128)(v7 * (__int128)24) >> 64 == (24 * v7) >> 63)
    {
      v8 = sub_2489893DC(24 * v7, v3, v4, v5, v6);
      return sub_248992F14(v8, v9, v10, v11);
    }
    __break(1u);
    goto LABEL_7;
  }
LABEL_8:
  result = sub_2489A8400();
  __break(1u);
  return result;
}

uint64_t sub_248992D24(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_248992D40(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_248992D40(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577A3B98);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8])
      memmove(v13, v14, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_2489A8448();
  __break(1u);
  return result;
}

char *sub_248992E9C(uint64_t a1)
{
  return sub_2489983C4(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_248992EB0(uint64_t result, uint64_t a2, unsigned __int8 *a3, uint64_t a4)
{
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;

  if (a2 != a4)
    return 0;
  if (a2 < 0)
  {
    __break(1u);
    return result;
  }
  if (!a2)
    return 1;
  if (*(unsigned __int8 *)result != *a3)
    return 0;
  v4 = (unsigned __int8 *)(result + 1);
  v5 = a3 + 1;
  v6 = a2 - 1;
  do
  {
    result = v6 == 0;
    if (!v6)
      break;
    v8 = *v4++;
    v7 = v8;
    v9 = *v5++;
    --v6;
  }
  while (v7 == v9);
  return result;
}

uint64_t sub_248992F14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;

  if (a1 < 0)
    goto LABEL_12;
  if (a3)
  {
    if (a4 - a3 < a2)
      goto LABEL_12;
    result = a3 + a1;
    v7 = a2 - a1;
    v6 = v7 == 0;
    if (v7 < 0)
      goto LABEL_12;
  }
  else
  {
    if (a2 > 0)
      goto LABEL_12;
    result = 0;
    v8 = a2 - a1;
    v6 = v8 == 0;
    if (v8 < 0)
      goto LABEL_12;
  }
  if (!v6 && !result)
  {
LABEL_12:
    result = sub_2489A8448();
    __break(1u);
  }
  return result;
}

unint64_t sub_24899303C()
{
  unint64_t result;

  result = qword_2577A3B58;
  if (!qword_2577A3B58)
  {
    result = MEMORY[0x2495A1154](&protocol conformance descriptor for ComponentInitDataBuilder.Error, &type metadata for ComponentInitDataBuilder.Error);
    atomic_store(result, (unint64_t *)&qword_2577A3B58);
  }
  return result;
}

unint64_t sub_248993080()
{
  unint64_t result;

  result = qword_2577A3B60;
  if (!qword_2577A3B60)
  {
    result = MEMORY[0x2495A1154](&protocol conformance descriptor for ComponentInitDataReader.Component.Error, &type metadata for ComponentInitDataReader.Component.Error);
    atomic_store(result, (unint64_t *)&qword_2577A3B60);
  }
  return result;
}

unint64_t sub_2489930C4()
{
  unint64_t result;

  result = qword_2577A3B70;
  if (!qword_2577A3B70)
  {
    result = MEMORY[0x2495A1154](&protocol conformance descriptor for ComponentInitDataReader.Error, &type metadata for ComponentInitDataReader.Error);
    atomic_store(result, (unint64_t *)&qword_2577A3B70);
  }
  return result;
}

unint64_t sub_248993108()
{
  unint64_t result;

  result = qword_2577A3B78;
  if (!qword_2577A3B78)
  {
    result = MEMORY[0x2495A1154](MEMORY[0x24BEE45A0], MEMORY[0x24BEE4568]);
    atomic_store(result, (unint64_t *)&qword_2577A3B78);
  }
  return result;
}

unint64_t sub_248993150()
{
  unint64_t result;

  result = qword_2577A3B80;
  if (!qword_2577A3B80)
  {
    result = MEMORY[0x2495A1154](&protocol conformance descriptor for ComponentInitDataBuilder.Error, &type metadata for ComponentInitDataBuilder.Error);
    atomic_store(result, (unint64_t *)&qword_2577A3B80);
  }
  return result;
}

unint64_t sub_248993198()
{
  unint64_t result;

  result = qword_2577A3B88;
  if (!qword_2577A3B88)
  {
    result = MEMORY[0x2495A1154](&protocol conformance descriptor for ComponentInitDataReader.Component.Error, &type metadata for ComponentInitDataReader.Component.Error);
    atomic_store(result, (unint64_t *)&qword_2577A3B88);
  }
  return result;
}

unint64_t sub_2489931E0()
{
  unint64_t result;

  result = qword_2577A3B90;
  if (!qword_2577A3B90)
  {
    result = MEMORY[0x2495A1154](&protocol conformance descriptor for ComponentInitDataReader.Error, &type metadata for ComponentInitDataReader.Error);
    atomic_store(result, (unint64_t *)&qword_2577A3B90);
  }
  return result;
}

ValueMetadata *type metadata accessor for EndpointTuple()
{
  return &type metadata for EndpointTuple;
}

uint64_t destroy for ComponentInitDataBuilder()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s9Tightbeam24ComponentInitDataBuilderVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for ComponentInitDataBuilder(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *assignWithTake for ComponentInitDataBuilder(_OWORD *a1, _OWORD *a2)
{
  swift_bridgeObjectRelease();
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ComponentInitDataBuilder(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ComponentInitDataBuilder(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ComponentInitDataBuilder()
{
  return &type metadata for ComponentInitDataBuilder;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ComponentInitDataBuilder.Error(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
  if (a2 + 1 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ComponentInitDataBuilder.Error(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_2489934A8 + 4 * byte_2489A9145[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2489934DC + 4 * asc_2489A9140[v4]))();
}

uint64_t sub_2489934DC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2489934E4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2489934ECLL);
  return result;
}

uint64_t sub_2489934F8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x248993500);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_248993504(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24899350C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_248993518(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_248993524(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ComponentInitDataBuilder.Error()
{
  return &type metadata for ComponentInitDataBuilder.Error;
}

_QWORD *initializeBufferWithCopyOfBuffer for ComponentInitDataBuilder.TypeData(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for ComponentInitDataBuilder.TypeData()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for ComponentInitDataBuilder.TypeData(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for ComponentInitDataBuilder.TypeData(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ComponentInitDataBuilder.TypeData(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ComponentInitDataBuilder.TypeData(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ComponentInitDataBuilder.TypeData()
{
  return &type metadata for ComponentInitDataBuilder.TypeData;
}

uint64_t destroy for ComponentInitDataBuilder.Client()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ComponentInitDataBuilder.Client(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_WORD *)(a1 + 8) = *(_WORD *)(a2 + 8);
  v3 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v3;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ComponentInitDataBuilder.Client(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  *(_BYTE *)(a1 + 2) = *(_BYTE *)(a2 + 2);
  *(_WORD *)(a1 + 4) = *(_WORD *)(a2 + 4);
  *(_WORD *)(a1 + 6) = *(_WORD *)(a2 + 6);
  *(_WORD *)(a1 + 8) = *(_WORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for ComponentInitDataBuilder.Client(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  *(_BYTE *)(a1 + 2) = *(_BYTE *)(a2 + 2);
  *(_WORD *)(a1 + 4) = *(_WORD *)(a2 + 4);
  *(_DWORD *)(a1 + 6) = *(_DWORD *)(a2 + 6);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ComponentInitDataBuilder.Client(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ComponentInitDataBuilder.Client(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 32) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ComponentInitDataBuilder.Client()
{
  return &type metadata for ComponentInitDataBuilder.Client;
}

uint64_t destroy for ComponentInitDataBuilder.Component()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for ComponentInitDataBuilder.Component(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for ComponentInitDataBuilder.Component(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for ComponentInitDataBuilder.Component(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ComponentInitDataBuilder.Component(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ComponentInitDataBuilder.Component(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ComponentInitDataBuilder.Component()
{
  return &type metadata for ComponentInitDataBuilder.Component;
}

ValueMetadata *type metadata accessor for ComponentInitDataBuilder.Endpoint()
{
  return &type metadata for ComponentInitDataBuilder.Endpoint;
}

ValueMetadata *type metadata accessor for ComponentInitDataReader()
{
  return &type metadata for ComponentInitDataReader;
}

ValueMetadata *type metadata accessor for ComponentInitDataReader.TypeData()
{
  return &type metadata for ComponentInitDataReader.TypeData;
}

ValueMetadata *type metadata accessor for ComponentInitDataReader.TypeBuffer()
{
  return &type metadata for ComponentInitDataReader.TypeBuffer;
}

ValueMetadata *type metadata accessor for ComponentInitDataReader.Client()
{
  return &type metadata for ComponentInitDataReader.Client;
}

ValueMetadata *type metadata accessor for ComponentInitDataReader.ClientBuffer()
{
  return &type metadata for ComponentInitDataReader.ClientBuffer;
}

ValueMetadata *type metadata accessor for ComponentInitDataReader.Component()
{
  return &type metadata for ComponentInitDataReader.Component;
}

_BYTE *sub_248993AD8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ComponentInitDataReader.Component.Error()
{
  return &type metadata for ComponentInitDataReader.Component.Error;
}

uint64_t getEnumTagSinglePayload for ComponentInitDataReader.ComponentBuffer(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for ComponentInitDataReader.ComponentBuffer(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = (a2 - 1);
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 24) = v3;
  return result;
}

ValueMetadata *type metadata accessor for ComponentInitDataReader.ComponentBuffer()
{
  return &type metadata for ComponentInitDataReader.ComponentBuffer;
}

uint64_t _s9Tightbeam23ComponentInitDataReaderV9ComponentV5ErrorOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
  if (a2 + 2 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 2) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s9Tightbeam23ComponentInitDataReaderV9ComponentV5ErrorOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_248993C28 + 4 * byte_2489A914F[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_248993C5C + 4 * byte_2489A914A[v4]))();
}

uint64_t sub_248993C5C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_248993C64(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x248993C6CLL);
  return result;
}

uint64_t sub_248993C78(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x248993C80);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_248993C84(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_248993C8C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ComponentInitDataReader.Error()
{
  return &type metadata for ComponentInitDataReader.Error;
}

ValueMetadata *type metadata accessor for _StaticString()
{
  return &type metadata for _StaticString;
}

ValueMetadata *type metadata accessor for EveIncomingMessageBuffer()
{
  return &type metadata for EveIncomingMessageBuffer;
}

ValueMetadata *type metadata accessor for EveMessageID()
{
  return &type metadata for EveMessageID;
}

uint64_t sub_248993D14()
{
  return 24;
}

uint64_t sub_248993D1C()
{
  sub_2489A84D8();
  sub_2489A84F0();
  sub_2489A84F0();
  return sub_2489A84FC();
}

uint64_t sub_248993D74()
{
  sub_2489A84F0();
  return sub_2489A84F0();
}

uint64_t sub_248993DAC()
{
  sub_2489A84D8();
  sub_2489A84F0();
  sub_2489A84F0();
  return sub_2489A84FC();
}

BOOL sub_248993E00(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2 && a1[1] == a2[1];
}

unint64_t sub_248993E1C()
{
  unint64_t result;

  result = qword_2577A3BA0;
  if (!qword_2577A3BA0)
  {
    result = MEMORY[0x2495A1154](&unk_2489A9528, &type metadata for EveMessageID);
    atomic_store(result, (unint64_t *)&qword_2577A3BA0);
  }
  return result;
}

uint64_t sub_248993E60()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 16);
  if (v3 >= 0x18)
  {
    v4 = *(_QWORD *)(v2 + 32);
    if (v3 >= v4)
    {
      v5 = v4 - 24;
      if (v4 < 0x18)
      {
        __break(1u);
        goto LABEL_22;
      }
      v0 = *(_QWORD *)(v2 + 40);
      v7 = sub_248989748(*(_QWORD *)(v2 + 32), *v1);
      v8 = v6;
      v19 = v9;
      v11 = v10;
      if ((v10 & 1) != 0)
      {
        v18 = v6;
        sub_2489A8478();
        swift_unknownObjectRetain_n();
        swift_bridgeObjectRetain();
        v13 = swift_dynamicCastClass();
        if (!v13)
        {
          swift_unknownObjectRelease();
          v13 = MEMORY[0x24BEE4AF8];
        }
        v14 = *(_QWORD *)(v13 + 16);
        swift_release();
        if (__OFSUB__(v11 >> 1, v19))
        {
          __break(1u);
        }
        else if (v14 == (v11 >> 1) - v19)
        {
          v12 = swift_dynamicCastClass();
          v5 = v4 - 24;
          if (!v12)
          {
            swift_unknownObjectRelease();
            v12 = MEMORY[0x24BEE4AF8];
          }
LABEL_14:
          swift_unknownObjectRelease();
          *v1 = v12;
          sub_2489A8478();
          swift_unknownObjectRetain_n();
          v15 = swift_dynamicCastClass();
          if (!v15)
          {
            swift_bridgeObjectRelease();
            v15 = MEMORY[0x24BEE4AF8];
          }
          v16 = *(_QWORD *)(v15 + 16);
          swift_release();
          if (v16 == v5)
          {
            if (!swift_dynamicCastClass())
              swift_bridgeObjectRelease();
            goto LABEL_19;
          }
LABEL_22:
          swift_bridgeObjectRelease();
          sub_248994074(v2, v2 + 32, 24, (2 * v4) | 1);
LABEL_19:
          swift_bridgeObjectRelease();
          return v0;
        }
        swift_unknownObjectRelease();
        v8 = v18;
        v5 = v4 - 24;
      }
      else
      {
        swift_bridgeObjectRetain();
      }
      v12 = sub_248994074(v7, v8, v19, v11);
      goto LABEL_14;
    }
  }
  return 0;
}

uint64_t sub_248994074(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4;
  int64_t v5;
  _QWORD *v8;
  size_t v9;
  void *v10;
  uint64_t result;

  v4 = a4 >> 1;
  v5 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (!v5)
      return MEMORY[0x24BEE4AF8];
    if (v5 <= 0)
    {
      v8 = (_QWORD *)MEMORY[0x24BEE4AF8];
      if (v4 != a3)
      {
LABEL_5:
        if (v5 < 0)
          goto LABEL_17;
        v10 = v8 + 4;
        if (a2 + a3 < (unint64_t)v8 + v5 + 32 && (unint64_t)v10 < a2 + a3 + v5)
          goto LABEL_17;
        memcpy(v10, (const void *)(a2 + a3), v5);
        return (uint64_t)v8;
      }
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2577A3BA8);
      v8 = (_QWORD *)swift_allocObject();
      v9 = _swift_stdlib_malloc_size(v8);
      v8[2] = v5;
      v8[3] = 2 * v9 - 64;
      if (v4 != a3)
        goto LABEL_5;
    }
    __break(1u);
  }
  __break(1u);
LABEL_17:
  result = sub_2489A8448();
  __break(1u);
  return result;
}

uint64_t sub_2489941CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  _QWORD v7[2];

  v0 = sub_2489A831C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_2489A8310();
  MEMORY[0x24BDAC7A8](v4);
  v5 = sub_2489A81B4();
  MEMORY[0x24BDAC7A8](v5);
  sub_24898E528();
  sub_2489A81A8();
  v7[1] = MEMORY[0x24BEE4AF8];
  sub_24898E564();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577A3B48);
  sub_24898E5AC();
  sub_2489A83A0();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BEE5750], v0);
  result = sub_2489A8334();
  qword_2577A3BB0 = result;
  return result;
}

_QWORD *sub_24899435C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(id *, _QWORD);
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44[2];
  id v45[6];

  v6 = v5;
  v7 = v4;
  v45[5] = *(id *)MEMORY[0x24BDAC8D0];
  v12 = sub_2489A7FBC();
  MEMORY[0x24BDAC7A8](v12);
  v40 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(qword_2577A3BB8);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (uint64_t *)((char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  v17 = MEMORY[0x24BEE4AF8];
  v7[14] = a2;
  v7[15] = v17;
  v7[13] = a1;
  v43 = a3;
  v41 = v7 + 7;
  sub_24898E4D0(a3, (uint64_t)(v7 + 7));
  v42 = a4;
  v37 = v7 + 2;
  sub_24898E4D0(a4, (uint64_t)(v7 + 2));
  v18 = (void *)objc_opt_self();
  swift_bridgeObjectRetain();
  v19 = objc_msgSend(v18, sel_defaultManager);
  v38 = a1;
  v20 = (void *)sub_2489A81F0();
  v45[0] = 0;
  LODWORD(a1) = objc_msgSend(v19, sel_removeItemAtPath_error_, v20, v45);

  if ((_DWORD)a1)
  {
    v21 = v45[0];
  }
  else
  {
    v22 = v45[0];
    v23 = sub_2489A7EE4();

    swift_willThrow();
    MEMORY[0x2495A10D0](v23);
    v6 = 0;
  }
  v39 = v6;
  sub_2489A80F4();
  sub_2489A80E8();
  if (qword_2577A3A40 != -1)
    swift_once();
  sub_2489A8148();
  swift_allocObject();
  swift_retain();
  v24 = sub_2489A813C();
  sub_2489A80D0();
  swift_retain();
  v25 = (void (*)(id *, _QWORD))sub_2489A80C4();
  if (*v26 >> 62)
  {
    swift_bridgeObjectRetain();
    v36 = sub_2489A8418();
    swift_bridgeObjectRelease();
    if (v36 < 0)
    {
      __break(1u);
      goto LABEL_14;
    }
  }
  sub_24898DC94(0, 0, v24);
  v25(v45, 0);
  swift_release();
  *v16 = v38;
  v16[1] = a2;
  v27 = *MEMORY[0x24BDDFF38];
  v28 = sub_2489A7FC8();
  v29 = *(_QWORD *)(v28 - 8);
  (*(void (**)(_QWORD *, uint64_t, uint64_t))(v29 + 104))(v16, v27, v28);
  (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v29 + 56))(v16, 0, 1, v28);
  sub_2489A80DC();
  swift_retain();
  sub_2489A7FB0();
  sub_2489A8010();
  swift_allocObject();
  v30 = v39;
  v31 = sub_2489A8004();
  if (!v30)
  {
    v7[12] = v31;
    v32 = (void *)*__swift_project_boxed_opaque_existential_1(v41, v7[10]);
    v45[3] = (id)type metadata accessor for UnixTransportService();
    v45[4] = &off_2519B1C80;
    v45[0] = v32;
    sub_24898E4D0((uint64_t)v45, (uint64_t)v44);
    v33 = swift_allocObject();
    sub_248994C0C(v44, v33 + 16);
    swift_retain();
    swift_retain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v45);
    sub_24898E518((uint64_t)sub_248994C24);
    sub_2489A7FD4();
    swift_release();
    swift_release();
    swift_retain();
    swift_retain();
    sub_24898E518((uint64_t)sub_248994C2C);
    sub_2489A7FE0();
    swift_release();
    swift_release();
    if (qword_2577A3A28 == -1)
    {
LABEL_10:
      sub_2489A7FF8();
      swift_release();
      swift_release();
      __swift_destroy_boxed_opaque_existential_1(v42);
      __swift_destroy_boxed_opaque_existential_1(v43);
      return v7;
    }
LABEL_14:
    swift_once();
    goto LABEL_10;
  }
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v42);
  __swift_destroy_boxed_opaque_existential_1(v43);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  type metadata accessor for UnixListener();
  swift_deallocPartialClassInstance();
  return v7;
}

uint64_t sub_24899487C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  int v6;
  _QWORD v8[2];

  v2 = sub_2489A7FEC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  v6 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  if (v6 == *MEMORY[0x24BDDFFC0])
  {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
LABEL_4:
    v8[0] = 0;
    v8[1] = 0xE000000000000000;
    sub_2489A83B8();
    sub_2489A825C();
    sub_2489A83F4();
    sub_24898D580();
    return swift_bridgeObjectRelease();
  }
  if (v6 == *MEMORY[0x24BDDFFD0])
    goto LABEL_4;
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_2489949C0(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE v16[24];
  uint64_t v17;
  uint64_t v18;

  v2 = v1;
  v4 = v2[13];
  v5 = v2[14];
  sub_24898E4D0((uint64_t)(v2 + 2), (uint64_t)v16);
  type metadata accessor for UnixProtocolConnection();
  v6 = (_QWORD *)swift_allocObject();
  v7 = v17;
  v8 = v18;
  v9 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v16, v17);
  MEMORY[0x24BDAC7A8](v9);
  v11 = &v16[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  (*(void (**)(_BYTE *))(v12 + 16))(v11);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_24898DF6C(v4, v5, (uint64_t)v11, a1, v6, v7, v8);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  v13 = swift_beginAccess();
  MEMORY[0x2495A0A64](v13);
  if (*(_QWORD *)((v2[15] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v2[15] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_2489A82D4();
  sub_2489A82EC();
  sub_2489A82C8();
  return swift_endAccess();
}

uint64_t UnixListener.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t UnixListener.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for UnixListener()
{
  return objc_opt_self();
}

uint64_t method lookup function for UnixListener()
{
  return swift_lookUpClassMethod();
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_248994BE8()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocObject();
}

uint64_t sub_248994C0C(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_248994C24(uint64_t a1)
{
  return sub_24899487C(a1);
}

uint64_t sub_248994C30()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t getEnumTagSinglePayload for ComponentRuntimeLock(uint64_t a1, int a2)
{
  int v3;

  if (!a2)
    return 0;
  if (a2 != 1 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 2);
  if (*(_QWORD *)a1)
    v3 = -1;
  else
    v3 = 0;
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for ComponentRuntimeLock(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(_QWORD *)result = a2 - 2;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 2)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 2)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)result = 0;
  }
  return result;
}

uint64_t type metadata accessor for _UnsafeMutableBufferPointer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for _UnsafeMutableBufferPointer);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x2495A1100](a1, v6, a5);
}

void sub_248994CF0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = sub_2489A7F68();
  MEMORY[0x24BDAC7A8](v3);
  __asm { BR              X10 }
}

uint64_t sub_248994D74()
{
  uint64_t v0;
  uint64_t v1;
  char **v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int64_t v8;
  int64_t v9;
  char *isUniquelyReferenced_nonNull_native;
  int64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  char v22;

  v7 = *v2;
  v8 = *((_QWORD *)*v2 + 2);
  v9 = v8 + BYTE6(v3);
  if (__OFADD__(v8, BYTE6(v3)))
  {
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  *v2 = v7;
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || (v11 = *((_QWORD *)v7 + 3) >> 1, v11 < v9))
  {
    if (v8 <= v9)
      v12 = v8 + BYTE6(v3);
    else
      v12 = v8;
    v7 = sub_2489983C4(isUniquelyReferenced_nonNull_native, v12, 1, v7);
    *v2 = v7;
    v11 = *((_QWORD *)v7 + 3) >> 1;
  }
  v13 = v11 - *((_QWORD *)v7 + 2);
  sub_24898E69C(v4, v3);
  v14 = sub_2489A7F44();
  sub_24898E6E0(v4, v3);
  sub_24898E6E0(v4, v3);
  if (v14 < BYTE6(v3))
    goto LABEL_15;
  if (v14 >= 1)
  {
    v15 = *((_QWORD *)v7 + 2);
    v16 = __OFADD__(v15, v14);
    v17 = v15 + v14;
    if (v16)
    {
      __break(1u);
      JUMPOUT(0x248994F6CLL);
    }
    *((_QWORD *)v7 + 2) = v17;
  }
  if (v14 == v13)
  {
LABEL_16:
    v19 = *((_QWORD *)v7 + 2);
    sub_248988A58((unint64_t *)&qword_2577A3C70, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDD78], MEMORY[0x24BDCDD80]);
    sub_2489A8364();
    if ((*(_BYTE *)(v6 - 81) & 1) != 0)
      return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v1, v0);
    while (1)
    {
      v20 = *((_QWORD *)v7 + 3);
      v21 = v20 >> 1;
      if ((uint64_t)(v20 >> 1) >= v19 + 1)
        break;
      v7 = sub_2489983C4((char *)(v20 > 1), v19 + 1, 1, v7);
      *v2 = v7;
      v22 = *(_BYTE *)(v6 - 81);
      v21 = *((_QWORD *)v7 + 3) >> 1;
      if ((v22 & 1) == 0)
        goto LABEL_21;
LABEL_18:
      *((_QWORD *)v7 + 2) = v19;
      if ((v22 & 1) != 0)
        return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v1, v0);
    }
    v22 = 0;
    do
    {
LABEL_21:
      if (v19 >= v21)
        break;
      v7[v19++ + 32] = *(_BYTE *)(v6 - 82);
      sub_2489A8364();
      v22 = *(_BYTE *)(v6 - 81);
    }
    while ((v22 & 1) == 0);
    goto LABEL_18;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v1, v0);
}

uint64_t sub_248994F84()
{
  uint64_t v0;

  sub_2489982A8(v0 + OBJC_IVAR____TtC9Tightbeam15EveEndpointData_baseURL);
  return swift_deallocClassInstance();
}

uint64_t sub_248994FB4()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t result;

  type metadata accessor for EveTransportCoordinator();
  v0 = swift_allocObject();
  v1 = sub_24899501C(MEMORY[0x24BEE4AF8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577A3CC0);
  result = swift_allocObject();
  *(_DWORD *)(result + 24) = 0;
  *(_QWORD *)(result + 16) = v1;
  *(_QWORD *)(v0 + 16) = result;
  qword_2577A4D10 = v0;
  return result;
}

unint64_t sub_24899501C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t result;
  char v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  _QWORD v22[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577A3CC8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(a1 + 16))
  {
    v7 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577A3CA0);
  v6 = sub_2489A843C();
  v7 = (_QWORD *)v6;
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  v9 = *(int *)(v2 + 48);
  v10 = v6 + 64;
  v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v22[1] = a1;
  v12 = a1 + v11;
  v13 = *(_QWORD *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_24899AEA0(v12, (uint64_t)v5, &qword_2577A3CC8);
    result = sub_248998A98((uint64_t)v5);
    if ((v15 & 1) != 0)
      break;
    v16 = result;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v17 = v7[6];
    v18 = sub_2489A7F2C();
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v17 + *(_QWORD *)(*(_QWORD *)(v18 - 8) + 72) * v16, v5, v18);
    *(_QWORD *)(v7[7] + 8 * v16) = *(_QWORD *)&v5[v9];
    v19 = v7[2];
    v20 = __OFADD__(v19, 1);
    v21 = v19 + 1;
    if (v20)
      goto LABEL_11;
    v7[2] = v21;
    v12 += v13;
    if (!--v8)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_2489951B0(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577A3C90);
  v2 = sub_2489A843C();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_24899AEA0(v6, (uint64_t)&v13, &qword_2577A3C98);
    v7 = v13;
    result = sub_248998BA0(v13);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v3[6] + 8 * result) = v7;
    result = (unint64_t)sub_24899AE50(&v14, (_OWORD *)(v3[7] + 32 * result));
    v10 = v3[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v3[2] = v12;
    v6 += 40;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_2489952DC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  uint64_t result;
  void (*v14)(char *, uint64_t, uint64_t);
  uint64_t v15;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v17;
  uint64_t v18;

  v6 = sub_2489A7F2C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *a1;
  if (*(_QWORD *)(*a1 + 16) && (v11 = sub_248998A98(a2), (v12 & 1) != 0))
  {
    *a3 = *(_QWORD *)(*(_QWORD *)(v10 + 56) + 8 * v11);
    return swift_retain();
  }
  else
  {
    v14 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
    v14(v9, a2, v6);
    type metadata accessor for EveTransportManager(0);
    v15 = swift_allocObject();
    sub_248996718((uint64_t)v9);
    v14(v9, a2, v6);
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v18 = *a1;
    *a1 = 0x8000000000000000;
    sub_248999B80(v15, (uint64_t)v9, isUniquelyReferenced_nonNull_native);
    *a1 = v18;
    swift_bridgeObjectRelease();
    result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    *a3 = v15;
  }
  return result;
}

uint64_t sub_24899543C()
{
  return sub_248997E28();
}

uint64_t sub_248995444()
{
  uint64_t v0;

  v0 = sub_2489A7F98();
  __swift_allocate_value_buffer(v0, qword_2577A3C40);
  __swift_project_value_buffer(v0, (uint64_t)qword_2577A3C40);
  return sub_2489A7F8C();
}

uint64_t sub_2489954C0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t transport_buffer;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  *(_DWORD *)(v1 + 32) = 0;
  *(_BYTE *)(v1 + 36) = 1;
  *(_QWORD *)(v1 + 16) = dispatch_semaphore_create(0);
  type metadata accessor for TightbeamMessage();
  v3 = (_QWORD *)swift_allocObject();
  v3[3] = 0;
  v3[4] = 0;
  transport_buffer = tb_message_get_transport_buffer(a1);
  if (transport_buffer)
  {
    v5 = transport_buffer;
    type metadata accessor for TransportBuffer();
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 24) = 0;
    *(_QWORD *)(v6 + 32) = 0;
    *(_QWORD *)(v6 + 16) = v5;
    *(_BYTE *)(v6 + 40) = 1;
    v3[3] = a1;
    v3[4] = v6;
    v3[2] = 0xC000000000000000;
    *(_QWORD *)(v1 + 24) = v3;
    *(_DWORD *)(v1 + 32) = 0;
    *(_BYTE *)(v1 + 36) = 1;
    return v1;
  }
  else
  {
    result = sub_2489A840C();
    __break(1u);
  }
  return result;
}

uint64_t sub_2489955C0()
{
  uint64_t v0;

  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_2489955EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int64_t v6;
  uint64_t result;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;

  sub_2489A8094();
  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 24);
  v2 = v1 + 64;
  v3 = 1 << *(_BYTE *)(v1 + 32);
  v4 = -1;
  if (v3 < 64)
    v4 = ~(-1 << v3);
  v5 = v4 & *(_QWORD *)(v1 + 64);
  v6 = (unint64_t)(v3 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v8 = 0;
  while (1)
  {
    if (v5)
    {
      v9 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v10 = v9 | (v8 << 6);
      goto LABEL_5;
    }
    v12 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_23;
    }
    if (v12 >= v6)
      goto LABEL_21;
    v13 = *(_QWORD *)(v2 + 8 * v12);
    ++v8;
    if (!v13)
    {
      v8 = v12 + 1;
      if (v12 + 1 >= v6)
        goto LABEL_21;
      v13 = *(_QWORD *)(v2 + 8 * v8);
      if (!v13)
      {
        v8 = v12 + 2;
        if (v12 + 2 >= v6)
          goto LABEL_21;
        v13 = *(_QWORD *)(v2 + 8 * v8);
        if (!v13)
          break;
      }
    }
LABEL_20:
    v5 = (v13 - 1) & v13;
    v10 = __clz(__rbit64(v13)) + (v8 << 6);
LABEL_5:
    v11 = *(_QWORD *)(*(_QWORD *)(v1 + 56) + 8 * v10);
    *(_DWORD *)(v11 + 32) = 4;
    *(_BYTE *)(v11 + 36) = 0;
    swift_retain();
    sub_2489A834C();
    result = swift_release();
  }
  v14 = v12 + 3;
  if (v14 >= v6)
  {
LABEL_21:
    swift_release();
    *(_QWORD *)(v0 + 24) = sub_24899A744(MEMORY[0x24BEE4AF8]);
    return swift_bridgeObjectRelease();
  }
  v13 = *(_QWORD *)(v2 + 8 * v14);
  if (v13)
  {
    v8 = v14;
    goto LABEL_20;
  }
  while (1)
  {
    v8 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v8 >= v6)
      goto LABEL_21;
    v13 = *(_QWORD *)(v2 + 8 * v8);
    ++v14;
    if (v13)
      goto LABEL_20;
  }
LABEL_23:
  __break(1u);
  return result;
}

uint64_t sub_248995798()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  char v7;
  void (*v8)(char *, uint64_t);
  uint64_t result;
  uint64_t v10;

  v0 = sub_2489A8070();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v10 - v5;
  sub_2489A8088();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v4, *MEMORY[0x24BDE02F8], v0);
  v7 = MEMORY[0x2495A080C](v6, v4);
  v8 = *(void (**)(char *, uint64_t))(v1 + 8);
  v8(v4, v0);
  result = ((uint64_t (*)(char *, uint64_t))v8)(v6, v0);
  if ((v7 & 1) != 0)
  {
    swift_allocObject();
    swift_weakInit();
    swift_retain();
    sub_2489A80A0();
    return swift_release_n();
  }
  return result;
}

uint64_t sub_2489958CC(uint64_t a1, unint64_t a2, uint64_t a3, char a4)
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_24899601C(a1, a2, a4 & 1);
    return swift_release();
  }
  return result;
}

uint64_t sub_248995954(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (**v8)(uint64_t);
  uint64_t v9;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _BYTE *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t result;
  _QWORD v26[2];
  _QWORD v27[5];

  v5 = sub_2489A8034();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (uint64_t (**)(uint64_t))((char *)&v26[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = *(_QWORD *)(v2 + 40);
  if (v9 == -1)
  {
    __break(1u);
    goto LABEL_16;
  }
  *(_QWORD *)(v2 + 40) = v9 + 1;
  if (a1 < 0)
  {
LABEL_20:
    sub_2489A8400();
    __break(1u);
LABEL_21:
    result = sub_2489A840C();
    __break(1u);
    return result;
  }
  swift_beginAccess();
  swift_retain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v26[0] = *(_QWORD *)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0x8000000000000000;
  sub_248999CDC(a2, a1, v9, isUniquelyReferenced_nonNull_native);
  *(_QWORD *)(v2 + 24) = v26[0];
  swift_bridgeObjectRelease();
  swift_endAccess();
  v11 = *(_QWORD *)(*(_QWORD *)(a2 + 24) + 32);
  if (!v11)
    goto LABEL_21;
  if (*(unsigned __int8 *)(v11 + 40) >= 2u)
    goto LABEL_21;
  v12 = *(_QWORD *)(v11 + 16);
  v13 = *(_QWORD *)(v12 + 16);
  if (*(_QWORD *)(v12 + 24) < v13)
    goto LABEL_21;
  if (v13 < 0)
  {
LABEL_19:
    sub_2489A8448();
    __break(1u);
    goto LABEL_20;
  }
  if (*(uint64_t *)(v12 + 32) < 24)
  {
LABEL_16:
    __break(1u);
    goto LABEL_21;
  }
  v14 = *(_QWORD **)v12;
  *v14 = v13;
  v14[1] = a1;
  v14[2] = v9;
  if (*(unsigned __int8 *)(v11 + 40) >= 2u)
    goto LABEL_21;
  v15 = *(uint64_t **)(v11 + 16);
  v16 = v15[2];
  if (v15[3] < v16)
    goto LABEL_21;
  if (v16 < 0)
    goto LABEL_19;
  v17 = *v15;
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = v11;
  *(_QWORD *)(v18 + 24) = v2;
  *v8 = sub_24899ADC8;
  v8[1] = (uint64_t (*)(uint64_t))v18;
  (*(void (**)(uint64_t (**)(uint64_t), _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x24BDE01C8], v5);
  sub_2489A8028();
  swift_retain_n();
  swift_retain();
  sub_2489A801C();
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577A3C78);
  v27[3] = v19;
  v27[4] = sub_24899AE60((unint64_t *)&qword_2577A3C80, &qword_2577A3C78, MEMORY[0x24BDCF860]);
  v27[0] = v17;
  v27[1] = v16;
  v20 = __swift_project_boxed_opaque_existential_1(v27, v19);
  if (*v20)
    v21 = (_BYTE *)(*v20 + v20[1]);
  else
    v21 = 0;
  sub_2489A2E30((_BYTE *)*v20, v21, v26);
  v22 = v26[0];
  v23 = v26[1];
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
  sub_2489A8058();
  sub_24898E6E0(v22, v23);
  swift_release();
  swift_release();
  return (*(uint64_t (**)(uint64_t (**)(uint64_t), uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_248995D6C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t *v13;
  uint64_t result;
  _QWORD v15[2];

  v3 = sub_2489A7F98();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2577A3A38 != -1)
    swift_once();
  v7 = __swift_project_value_buffer(v3, (uint64_t)qword_2577A3C40);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v7, v3);
  swift_retain();
  v8 = sub_2489A7F80();
  v9 = sub_2489A8304();
  if (!os_log_type_enabled(v8, v9))
  {

    swift_release();
    goto LABEL_9;
  }
  v10 = (uint8_t *)swift_slowAlloc();
  *(_DWORD *)v10 = 134217984;
  if (*(unsigned __int8 *)(a2 + 40) >= 2u
    || (v11 = *(_QWORD *)(a2 + 16), v12 = *(_QWORD *)(v11 + 16), *(_QWORD *)(v11 + 24) < v12))
  {
    swift_release();
    sub_2489A840C();
    __break(1u);
  }
  else if ((v12 & 0x8000000000000000) == 0)
  {
    v13 = v10;
    v15[1] = *(_QWORD *)(v11 + 16);
    sub_2489A8370();
    swift_release();
    _os_log_impl(&dword_248981000, v8, v9, "| message sent, %ld bytes", v13, 0xCu);
    MEMORY[0x2495A11FC](v13, -1, -1);

LABEL_9:
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    return sub_248995798();
  }
  swift_release();
  result = sub_2489A8448();
  __break(1u);
  return result;
}

uint64_t sub_24899601C(uint64_t result, unint64_t a2, char a3)
{
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;

  if (a2 >> 60 != 15)
  {
    v5 = result;
    sub_24898E69C(result, a2);
    if (qword_2577A3A38 != -1)
      swift_once();
    v6 = sub_2489A7F98();
    __swift_project_value_buffer(v6, (uint64_t)qword_2577A3C40);
    sub_24898E69C(v5, a2);
    v7 = sub_2489A7F80();
    v8 = sub_2489A8304();
    if (os_log_type_enabled(v7, v8))
    {
      *(_DWORD *)swift_slowAlloc() = 134217984;
      __asm { BR              X11 }
    }
    sub_24899AD88(v5, a2);

    swift_beginAccess();
    sub_24898E69C(v5, a2);
    sub_248994CF0(v5, a2);
    swift_endAccess();
    sub_2489962D4();
    result = sub_24899AD88(v5, a2);
  }
  if ((a3 & 1) != 0)
  {
    if (qword_2577A3A38 != -1)
      swift_once();
    v9 = sub_2489A7F98();
    __swift_project_value_buffer(v9, (uint64_t)qword_2577A3C40);
    v10 = sub_2489A7F80();
    v11 = sub_2489A8304();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_248981000, v10, v11, "| disconnected", v12, 2u);
      MEMORY[0x2495A11FC](v12, -1, -1);
    }

    return sub_2489955EC();
  }
  return result;
}

void sub_2489962D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  swift_beginAccess();
  v0 = sub_248993E60();
  v2 = v1;
  v4 = v3;
  swift_endAccess();
  if (v4)
  {
    swift_beginAccess();
    v5 = sub_248998FEC(v0, v2);
    swift_endAccess();
    if (v5)
    {
      if (qword_2577A3A38 != -1)
        swift_once();
      v6 = sub_2489A7F98();
      __swift_project_value_buffer(v6, (uint64_t)qword_2577A3C40);
      swift_bridgeObjectRetain();
      v7 = sub_2489A7F80();
      v8 = sub_2489A8304();
      if (os_log_type_enabled(v7, v8))
      {
        v9 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v9 = 134217984;
        sub_2489A8370();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_248981000, v7, v8, "| copying out payload of %ld bytes", v9, 0xCu);
        MEMORY[0x2495A11FC](v9, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease();
      }
      v14 = *(_QWORD *)(*(_QWORD *)(v5 + 24) + 32);
      if (!v14)
        goto LABEL_21;
      v15 = sub_248993D14();
      if (*(unsigned __int8 *)(v14 + 40) >= 2u)
        goto LABEL_21;
      v16 = v15;
      v17 = *(_QWORD *)(v14 + 16);
      if (v15 >= *(_QWORD *)(v17 + 24))
        goto LABEL_21;
      *(_QWORD *)(v17 + 16) = v15;
      sub_2489A2450(v4, *(_QWORD *)(v4 + 16));
      swift_retain();
      swift_bridgeObjectRelease();
      if (*(unsigned __int8 *)(v14 + 40) < 2u
        && (v18 = *(_QWORD *)(v14 + 16), v16 < *(_QWORD *)(v18 + 24))
        && (*(_QWORD *)(v18 + 16) = v16, (v19 = *(_QWORD *)(*(_QWORD *)(v5 + 24) + 24)) != 0))
      {
        tb_message_configure_recieved(v19, 2);
        sub_2489A834C();
        swift_release();
        swift_release();
      }
      else
      {
LABEL_21:
        sub_2489A840C();
        __break(1u);
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      if (qword_2577A3A38 != -1)
        swift_once();
      v10 = sub_2489A7F98();
      __swift_project_value_buffer(v10, (uint64_t)qword_2577A3C40);
      v11 = sub_2489A7F80();
      v12 = sub_2489A82F8();
      if (os_log_type_enabled(v11, v12))
      {
        v13 = swift_slowAlloc();
        *(_DWORD *)v13 = 134218240;
        sub_2489A8370();
        *(_WORD *)(v13 + 12) = 2048;
        sub_2489A8370();
        _os_log_impl(&dword_248981000, v11, v12, "| reply message buffer for id %llu:%llu has already vanished!", (uint8_t *)v13, 0x16u);
        MEMORY[0x2495A11FC](v13, -1, -1);
      }

    }
  }
}

uint64_t sub_2489966E4()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_248996718(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  _QWORD v17[2];
  uint64_t v18;
  uint64_t v19;

  v2 = v1;
  v18 = a1;
  v3 = sub_2489A831C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2489A8310();
  v8 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8](v7);
  v9 = sub_2489A81B4();
  MEMORY[0x24BDAC7A8](v9);
  v17[1] = sub_24898E528();
  sub_2489A81A8();
  v19 = MEMORY[0x24BEE4AF8];
  sub_248988A58((unint64_t *)&qword_2577A3B40, v8, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577A3B48);
  sub_24899AE60((unint64_t *)&qword_2577A3B50, &qword_2577A3B48, MEMORY[0x24BEE12C8]);
  sub_2489A83A0();
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BEE5750], v3);
  *(_QWORD *)(v1 + 16) = sub_2489A8334();
  v10 = v1 + OBJC_IVAR____TtC9Tightbeam19EveTransportManager_url;
  v11 = sub_2489A7F2C();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = v18;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v10, v18, v11);
  v14 = sub_24899A648(MEMORY[0x24BEE4AF8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577A3CB0);
  v15 = swift_allocObject();
  *(_DWORD *)(v15 + 40) = 0;
  *(_QWORD *)(v15 + 16) = 0;
  *(_QWORD *)(v15 + 24) = 0;
  *(_QWORD *)(v15 + 32) = v14;
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v13, v11);
  *(_QWORD *)(v2 + OBJC_IVAR____TtC9Tightbeam19EveTransportManager_listener) = v15;
  return v2;
}

uint64_t sub_248996970(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t result;
  uint64_t v17;
  char *v18;
  void (*v19)(char *, uint64_t, uint64_t);
  void (*v20)(char *, uint64_t);
  id v21;
  void *v22;
  void *v23;
  unsigned int v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  _BOOL4 v30;
  void (*v31)(char *, uint64_t);
  uint64_t v32;
  void (*v33)(char *, uint64_t, uint64_t);
  uint8_t *v34;
  id v35;
  void *v36;
  unsigned int v37;
  id v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(char *, uint64_t);
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  uint64_t *v52;
  NSObject *v53;
  os_log_type_t v54;
  int v55;
  uint8_t *v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t (*v60)(char *, uint64_t);
  os_log_t v61;
  uint8_t *v62;
  uint64_t *v63;
  uint8_t *v64;
  uint8_t *v65;
  os_log_t v66;
  char *v67;
  uint64_t *v68;
  void (*v69)(char *, uint64_t);
  uint64_t v70;
  char *v71;
  void (*v72)(char *, uint64_t, uint64_t);
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  id v76[2];

  v76[1] = *(id *)MEMORY[0x24BDAC8D0];
  v5 = sub_2489A7FBC();
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v64 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(qword_2577A3BB8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (uint64_t *)((char *)&v64 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = sub_2489A7F2C();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v64 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)&v64 - v17;
  if (!*a1)
  {
    v70 = a2;
    v71 = v7;
    v68 = a1;
    v19 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
    v73 = a2 + OBJC_IVAR____TtC9Tightbeam19EveTransportManager_url;
    v74 = v2;
    v72 = v19;
    ((void (*)(char *))v19)(v15);
    sub_2489A7F14();
    v20 = *(void (**)(char *, uint64_t))(v12 + 8);
    v20(v15, v11);
    v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1580]), sel_init);
    v22 = (void *)sub_2489A7EFC();
    sub_2489951B0(MEMORY[0x24BEE4AF8]);
    type metadata accessor for FileAttributeKey(0);
    sub_248988A58(&qword_2577A3AF0, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_2489A8F78);
    v23 = (void *)sub_2489A81C0();
    swift_bridgeObjectRelease();
    v76[0] = 0;
    v24 = objc_msgSend(v21, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v22, 1, v23, v76);

    if (v24)
    {
      v67 = v18;
      v69 = v20;
      v25 = qword_2577A3A38;
      v26 = v76[0];
      if (v25 != -1)
        swift_once();
      v27 = sub_2489A7F98();
      v66 = (os_log_t)__swift_project_value_buffer(v27, (uint64_t)qword_2577A3C40);
      v28 = sub_2489A7F80();
      v29 = sub_2489A8304();
      v30 = os_log_type_enabled(v28, v29);
      v31 = v69;
      v33 = v72;
      v32 = v73;
      if (v30)
      {
        v34 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v34 = 0;
        _os_log_impl(&dword_248981000, v28, v29, "| creating new tightbeam listener socket", v34, 2u);
        MEMORY[0x2495A11FC](v34, -1, -1);
      }

      v35 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1580]), sel_init);
      v33(v15, v32, v11);
      v36 = (void *)sub_2489A7EFC();
      v31(v15, v11);
      v76[0] = 0;
      v37 = objc_msgSend(v35, sel_removeItemAtURL_error_, v36, v76);

      v38 = v76[0];
      if (!v37)
      {
        v39 = v38;
        v40 = sub_2489A7EE4();

        swift_willThrow();
        MEMORY[0x2495A10D0](v40);
        v74 = 0;
      }
      sub_2489A80F4();
      sub_2489A80E8();
      v33(v15, v32, v11);
      v41 = sub_2489A7F20();
      v43 = v42;
      v31(v15, v11);
      *v10 = v41;
      v10[1] = v43;
      v44 = *MEMORY[0x24BDDFF38];
      v45 = sub_2489A7FC8();
      v46 = v31;
      v47 = *(_QWORD *)(v45 - 8);
      (*(void (**)(uint64_t *, uint64_t, uint64_t))(v47 + 104))(v10, v44, v45);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v47 + 56))(v10, 0, 1, v45);
      sub_2489A80DC();
      swift_retain();
      sub_2489A7FB0();
      sub_2489A8010();
      swift_allocObject();
      v48 = v74;
      v49 = sub_2489A8004();
      if (v48)
      {
        v46(v67, v11);
        return swift_release();
      }
      else
      {
        v51 = v49;
        v74 = 0;
        v52 = v68;
        swift_retain();
        swift_release();
        *v52 = v51;
        swift_retain();
        sub_2489A7FD4();
        swift_allocObject();
        swift_weakInit();
        swift_retain();
        sub_2489A7FE0();
        swift_release();
        swift_retain_n();
        v53 = sub_2489A7F80();
        v54 = sub_2489A8304();
        v55 = v54;
        if (os_log_type_enabled(v53, v54))
        {
          LODWORD(v71) = v55;
          v56 = (uint8_t *)swift_slowAlloc();
          v68 = (uint64_t *)swift_slowAlloc();
          v76[0] = v68;
          v65 = v56;
          v66 = v53;
          *(_DWORD *)v56 = 136315138;
          v64 = v56 + 4;
          v33(v15, v73, v11);
          sub_248988A58(&qword_2577A3C88, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
          v57 = sub_2489A8460();
          v59 = v58;
          v60 = (uint64_t (*)(char *, uint64_t))v69;
          v69(v15, v11);
          v75 = sub_2489984BC(v57, v59, (uint64_t *)v76);
          sub_2489A8370();
          swift_release_n();
          swift_bridgeObjectRelease();
          v62 = v65;
          v61 = v66;
          _os_log_impl(&dword_248981000, v66, (os_log_type_t)v71, "| opening new listener at: %s", v65, 0xCu);
          v63 = v68;
          swift_arrayDestroy();
          MEMORY[0x2495A11FC](v63, -1, -1);
          MEMORY[0x2495A11FC](v62, -1, -1);

        }
        else
        {

          swift_release_n();
          v60 = (uint64_t (*)(char *, uint64_t))v69;
        }
        sub_2489A7FF8();
        swift_release();
        swift_release();
        return v60(v67, v11);
      }
    }
    else
    {
      v50 = v76[0];
      sub_2489A7EE4();

      swift_willThrow();
      return ((uint64_t (*)(char *, uint64_t))v20)(v18, v11);
    }
  }
  return result;
}

void sub_248997084(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, uint64_t, uint64_t);
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  _QWORD v17[3];
  uint64_t v18;

  v2 = sub_2489A7FEC();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)v17 - v7;
  if (qword_2577A3A38 != -1)
    swift_once();
  v9 = sub_2489A7F98();
  __swift_project_value_buffer(v9, (uint64_t)qword_2577A3C40);
  v10 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v10(v8, a1, v2);
  v11 = sub_2489A7F80();
  v12 = sub_2489A8304();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v18 = v14;
    *(_DWORD *)v13 = 136315138;
    v17[1] = v13 + 4;
    v10(v6, (uint64_t)v8, v2);
    v15 = sub_2489A8220();
    v17[2] = sub_2489984BC(v15, v16, &v18);
    sub_2489A8370();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
    _os_log_impl(&dword_248981000, v11, v12, "| listener did change state, new state: %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2495A11FC](v14, -1, -1);
    MEMORY[0x2495A11FC](v13, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  }

}

uint64_t sub_2489972A4(uint64_t a1)
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_2489973A8(a1);
    return swift_release();
  }
  return result;
}

uint64_t sub_248997300(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;

  if (*(_QWORD *)(a1 + 8))
  {
    swift_retain();
    sub_248995954(a2, a3);
    return swift_release();
  }
  else
  {
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v8 = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0x8000000000000000;
    sub_248999E20(a3, a2, isUniquelyReferenced_nonNull_native);
    *(_QWORD *)(a1 + 16) = v8;
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_2489973A8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  os_unfair_lock_s *v11;
  uint64_t v13;

  v2 = v1;
  if (qword_2577A3A38 != -1)
    swift_once();
  v4 = sub_2489A7F98();
  __swift_project_value_buffer(v4, (uint64_t)qword_2577A3C40);
  swift_retain_n();
  v5 = sub_2489A7F80();
  v6 = sub_2489A8304();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v13 = v8;
    *(_DWORD *)v7 = 136315138;
    sub_2489A80B8();
    swift_retain();
    v9 = sub_2489A8220();
    sub_2489984BC(v9, v10, &v13);
    sub_2489A8370();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_248981000, v5, v6, "| got new connection: %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2495A11FC](v8, -1, -1);
    MEMORY[0x2495A11FC](v7, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  v11 = *(os_unfair_lock_s **)(v2 + OBJC_IVAR____TtC9Tightbeam19EveTransportManager_listener);
  swift_retain();
  os_unfair_lock_lock(v11 + 10);
  sub_2489975B0((uint64_t)&v11[4], a1);
  os_unfair_lock_unlock(v11 + 10);
  return swift_release();
}

uint64_t sub_2489975B0(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  unint64_t v6;

  type metadata accessor for EveTransportManager.Connection();
  v4 = (_QWORD *)swift_allocObject();
  v5 = MEMORY[0x24BEE4AF8];
  v6 = sub_24899A744(MEMORY[0x24BEE4AF8]);
  v4[4] = v5;
  v4[5] = 0;
  v4[2] = a2;
  v4[3] = v6;
  if (*(_QWORD *)(a1 + 8))
  {
    swift_retain();
    sub_2489955EC();
  }
  else
  {
    swift_retain();
  }
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 8) = v4;
  swift_allocObject();
  swift_weakInit();
  sub_2489A8040();
  sub_2489A807C();
  return swift_release();
}

uint64_t sub_248997698(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t result;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v2 = sub_2489A8070();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v7 = result;
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
    v8 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
    if (v8 == *MEMORY[0x24BDE0308])
    {
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }
    else
    {
      if (v8 == *MEMORY[0x24BDE02F8])
      {
        sub_248997814();
        return swift_release();
      }
      if (v8 != *MEMORY[0x24BDE0318])
      {
        swift_release();
        return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      }
    }
    v9 = *(_QWORD *)(v7 + OBJC_IVAR____TtC9Tightbeam19EveTransportManager_listener);
    swift_retain();
    os_unfair_lock_lock((os_unfair_lock_t)(v9 + 40));
    if (*(_QWORD *)(v9 + 24))
      sub_2489955EC();
    os_unfair_lock_unlock((os_unfair_lock_t)(v9 + 40));
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_248997814()
{
  uint64_t v0;
  os_unfair_lock_s *v1;

  v1 = *(os_unfair_lock_s **)(v0 + OBJC_IVAR____TtC9Tightbeam19EveTransportManager_listener);
  swift_retain();
  os_unfair_lock_lock(v1 + 10);
  sub_24899788C((uint64_t)&v1[4], v0);
  os_unfair_lock_unlock(v1 + 10);
  return swift_release();
}

void sub_24899788C(uint64_t a1, uint64_t a2)
{
  int64_t v2;
  int64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  int v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int64_t v26;
  unint64_t v27;
  int64_t v28;
  unint64_t v29;
  _QWORD v30[2];

  v3 = v2;
  v6 = sub_2489A8070();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(a1 + 8))
    return;
  swift_retain();
  sub_2489A8088();
  v10 = (*(uint64_t (**)(char *, uint64_t))(v7 + 88))(v9, v6);
  if (v10 == *MEMORY[0x24BDE0308])
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    goto LABEL_4;
  }
  if (v10 != *MEMORY[0x24BDE02F8])
  {
    if (v10 != *MEMORY[0x24BDE0318])
    {
      swift_release();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      return;
    }
LABEL_4:
    if (qword_2577A3A38 != -1)
      goto LABEL_38;
    goto LABEL_5;
  }
  v30[1] = v2;
  a2 = *(_QWORD *)(a1 + 16);
  v16 = a2 + 64;
  v17 = 1 << *(_BYTE *)(a2 + 32);
  v18 = -1;
  if (v17 < 64)
    v18 = ~(-1 << v17);
  v19 = v18 & *(_QWORD *)(a2 + 64);
  v3 = (unint64_t)(v17 + 63) >> 6;
  swift_bridgeObjectRetain();
  v20 = 0;
  while (1)
  {
    if (v19)
    {
      v21 = __clz(__rbit64(v19));
      v19 &= v19 - 1;
      v22 = v21 | (v20 << 6);
      goto LABEL_16;
    }
    v26 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
      __break(1u);
      goto LABEL_37;
    }
    if (v26 >= v3)
      goto LABEL_34;
    v27 = *(_QWORD *)(v16 + 8 * v26);
    ++v20;
    if (!v27)
    {
      v20 = v26 + 1;
      if (v26 + 1 >= v3)
        goto LABEL_34;
      v27 = *(_QWORD *)(v16 + 8 * v20);
      if (!v27)
      {
        v20 = v26 + 2;
        if (v26 + 2 >= v3)
          goto LABEL_34;
        v27 = *(_QWORD *)(v16 + 8 * v20);
        if (!v27)
          break;
      }
    }
LABEL_31:
    v19 = (v27 - 1) & v27;
    v22 = __clz(__rbit64(v27)) + (v20 << 6);
LABEL_16:
    v23 = 8 * v22;
    v24 = *(_QWORD *)(*(_QWORD *)(a2 + 48) + v23);
    v25 = *(_QWORD *)(*(_QWORD *)(a2 + 56) + v23);
    swift_retain();
    sub_248995954(v24, v25);
    swift_release();
  }
  v28 = v26 + 3;
  if (v28 >= v3)
  {
LABEL_34:
    swift_release();
    v29 = sub_24899A648(MEMORY[0x24BEE4AF8]);
    swift_bridgeObjectRelease();
    *(_QWORD *)(a1 + 16) = v29;
    sub_248995798();
    swift_release();
    return;
  }
  v27 = *(_QWORD *)(v16 + 8 * v28);
  if (v27)
  {
    v20 = v28;
    goto LABEL_31;
  }
  while (1)
  {
    v20 = v28 + 1;
    if (__OFADD__(v28, 1))
      break;
    if (v20 >= v3)
      goto LABEL_34;
    v27 = *(_QWORD *)(v16 + 8 * v20);
    ++v28;
    if (v27)
      goto LABEL_31;
  }
LABEL_37:
  __break(1u);
LABEL_38:
  swift_once();
LABEL_5:
  v11 = sub_2489A7F98();
  __swift_project_value_buffer(v11, (uint64_t)qword_2577A3C40);
  v12 = sub_2489A7F80();
  v13 = sub_2489A8304();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_248981000, v12, v13, "| listener disconnected", v14, 2u);
    MEMORY[0x2495A11FC](v14, -1, -1);
  }

  v15 = *(_QWORD *)(a2 + OBJC_IVAR____TtC9Tightbeam19EveTransportManager_listener);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v15 + 40));
  if (*(_QWORD *)(v15 + 24))
    sub_2489955EC();
  swift_release();
  *(_QWORD *)(v15 + 16) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(v15 + 40));
  if (v3)
  {
    __break(1u);
  }
  else
  {
    swift_release();
    swift_release();
  }
}

uint64_t sub_248997C14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC9Tightbeam19EveTransportManager_url;
  v2 = sub_2489A7F2C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  return swift_deallocClassInstance();
}

void sub_248997C7C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  os_unfair_lock_s *v10;
  int v11;
  _DWORD *v12;

  v3 = v1;
  v5 = *(_QWORD *)(v3 + 16);
  v6 = OBJC_IVAR____TtC9Tightbeam19EveTransportManager_listener;
  v7 = *(_QWORD *)(v5 + OBJC_IVAR____TtC9Tightbeam19EveTransportManager_listener);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v7 + 40));
  sub_248996970((uint64_t *)(v7 + 16), v5);
  os_unfair_lock_unlock((os_unfair_lock_t)(v7 + 40));
  swift_release();
  if (!v2)
  {
    type metadata accessor for EveTransportManager.PendingMessage();
    v8 = swift_allocObject();
    sub_2489954C0(a1);
    v9 = *(_QWORD *)(v3 + 24);
    v10 = *(os_unfair_lock_s **)(v5 + v6);
    swift_retain();
    os_unfair_lock_lock(v10 + 10);
    sub_248997300((uint64_t)&v10[4], v9, v8);
    os_unfair_lock_unlock(v10 + 10);
    swift_release();
    sub_2489A8340();
    if ((*(_BYTE *)(v8 + 36) & 1) != 0)
    {
      swift_retain();
      sub_2489A400C();
      swift_release();
    }
    else
    {
      v11 = *(_DWORD *)(v8 + 32);
      type metadata accessor for TransportError(0);
      sub_248988A58((unint64_t *)&qword_2577A3A50, (uint64_t (*)(uint64_t))type metadata accessor for TransportError, (uint64_t)&protocol conformance descriptor for tb_error_t);
      swift_allocError();
      *v12 = v11;
      swift_willThrow();
    }
    swift_release();
  }
}

uint64_t sub_248997E20()
{
  return sub_248997E28();
}

uint64_t sub_248997E28()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_248997E5C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t data;
  uint64_t v19;
  void (*v20)(char *, char *, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t);
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577A3C58);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_2489A7F2C();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v28 - v11;
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v28 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v28 - v16;
  data = tb_endpoint_get_data(a1);
  LODWORD(a1) = tb_endpoint_get_options(a1);
  sub_2489A7EF0();
  if ((_DWORD)a1 == 1)
  {
    v29 = *(_QWORD *)(data + 16);
    v19 = data + OBJC_IVAR____TtC9Tightbeam15EveEndpointData_baseURL;
    swift_retain();
    sub_24899AEA0(v19, (uint64_t)v4, &qword_2577A3C58);
    swift_release();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
    {
      v20 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
      v20(v15, v17, v5);
      sub_2489982A8((uint64_t)v4);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v6 + 8))(v17, v5);
      v20 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
      v20(v15, v4, v5);
    }
    v20(v17, v15, v5);
  }
  else
  {
    v29 = data;
  }
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v12, v17, v5);
  type metadata accessor for EveTransportClient();
  v21 = swift_allocObject();
  if (qword_2577A3A30 != -1)
    swift_once();
  v22 = qword_2577A4D10;
  sub_2489A7F08();
  v23 = *(_QWORD *)(v22 + 16);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v23 + 24));
  sub_2489952DC((uint64_t *)(v23 + 16), (uint64_t)v9, &v30);
  os_unfair_lock_unlock((os_unfair_lock_t)(v23 + 24));
  v24 = v30;
  swift_release();
  v25 = *(void (**)(char *, uint64_t))(v6 + 8);
  v25(v9, v5);
  v25(v12, v5);
  v26 = v29;
  *(_QWORD *)(v21 + 16) = v24;
  *(_QWORD *)(v21 + 24) = v26;
  v25(v17, v5);
  return v21;
}

uint64_t sub_248998154(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(tb_transport_get_context(a1) + 16);
  v2 = *(_QWORD *)(v1 + OBJC_IVAR____TtC9Tightbeam19EveTransportManager_listener);
  swift_retain();
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 40));
  sub_248996970((uint64_t *)(v2 + 16), v1);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 40));
  swift_release();
  swift_release();
  return 0;
}

uint64_t _tb_eve_transport_destruct(uint64_t a1)
{
  tb_transport_get_context(a1);
  return swift_release();
}

uint64_t type metadata accessor for EveTransportClient()
{
  return objc_opt_self();
}

uint64_t sub_2489982A8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577A3C58);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_QWORD *sub_2489982E8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577A3BA8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24899834C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v3 = a1;
  v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v10 = sub_2489A82A4();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x2495A0A28](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

char *sub_2489983C4(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = *((_QWORD *)a4 + 3);
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = *((_QWORD *)a4 + 2);
    if (v7 <= v8)
      v9 = *((_QWORD *)a4 + 2);
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2577A3BA8);
      v10 = (char *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      *((_QWORD *)v10 + 2) = v8;
      *((_QWORD *)v10 + 3) = 2 * v11 - 64;
      v12 = v10 + 32;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[v8 + 32])
          memmove(v12, a4 + 32, v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (char *)MEMORY[0x24BEE4AF8];
      v12 = (char *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_24899A564(0, v8, v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_2489984BC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_24899858C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_24899ADFC((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_24899ADFC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_24899858C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_2489A8388();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_248998744(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_2489A83E8();
  if (!v8)
  {
    sub_2489A8400();
    __break(1u);
LABEL_17:
    result = sub_2489A8448();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_248998744(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2489987D8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_24899894C(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_24899894C(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2489987D8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_2489982E8(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_2489A83C4();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_2489A8400();
      __break(1u);
LABEL_10:
      v2 = sub_2489A8268();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_2489A8448();
    __break(1u);
LABEL_14:
    result = sub_2489A8400();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

uint64_t sub_24899894C(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577A3BA8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_2489A8448();
  __break(1u);
  return result;
}

unint64_t sub_248998A98(uint64_t a1)
{
  uint64_t v2;

  sub_2489A7F2C();
  sub_248988A58(&qword_2577A3CA8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAF0]);
  v2 = sub_2489A81CC();
  return sub_248998C20(a1, v2);
}

unint64_t sub_248998B04(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2489A84CC();
  return sub_248998D60(a1, v2);
}

unint64_t sub_248998B34(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_2489A84D8();
  sub_2489A84F0();
  sub_2489A84F0();
  v4 = sub_2489A84FC();
  return sub_248998DFC(a1, a2, v4);
}

unint64_t sub_248998BA0(uint64_t a1)
{
  uint64_t v2;

  sub_2489A8214();
  sub_2489A84D8();
  sub_2489A8250();
  v2 = sub_2489A84FC();
  swift_bridgeObjectRelease();
  return sub_248998E78(a1, v2);
}

unint64_t sub_248998C20(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, unint64_t, uint64_t);
  char v14;
  _QWORD v16[2];

  v3 = v2;
  v16[1] = a1;
  v5 = sub_2489A7F2C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = -1 << *(_BYTE *)(v3 + 32);
  v10 = a2 & ~v9;
  if (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = ~v9;
    v12 = *(_QWORD *)(v6 + 72);
    v13 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    do
    {
      v13(v8, *(_QWORD *)(v3 + 48) + v12 * v10, v5);
      sub_248988A58(&qword_2577A3CB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB00]);
      v14 = sub_2489A81E4();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v14 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

unint64_t sub_248998D60(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (*(_QWORD *)(v7 + 8 * result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_QWORD *)(v7 + 8 * result) == a1)
          break;
      }
    }
  }
  return result;
}

unint64_t sub_248998DFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v5 = -1 << *(_BYTE *)(v3 + 32);
  result = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = ~v5;
    do
    {
      v8 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * result);
      v10 = *v8;
      v9 = v8[1];
      if (v10 == a1 && v9 == a2)
        break;
      result = (result + 1) & v7;
    }
    while (((*(_QWORD *)(v3 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0);
  }
  return result;
}

unint64_t sub_248998E78(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v6 = sub_2489A8214();
    v8 = v7;
    if (v6 == sub_2489A8214() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_2489A846C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      v12 = ~v4;
      v5 = (v5 + 1) & v12;
      if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
      {
        while (1)
        {
          v13 = sub_2489A8214();
          v15 = v14;
          if (v13 == sub_2489A8214() && v15 == v16)
            break;
          v18 = sub_2489A846C();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            v5 = (v5 + 1) & v12;
            if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
              continue;
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

uint64_t sub_248998FEC(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v4;
  char v5;
  unint64_t v6;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v3 = v2;
  v4 = sub_248998B34(a1, a2);
  if ((v5 & 1) == 0)
    return 0;
  v6 = v4;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v8 = *v2;
  v11 = *v3;
  *v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_24899A220();
    v8 = v11;
  }
  v9 = *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v6);
  sub_2489999B0(v6, v8);
  *v3 = v8;
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_248999080(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t result;
  int64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  char v32;
  unint64_t v33;
  BOOL v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  int64_t v39;
  _QWORD *v40;
  uint64_t i;
  int v42;

  v3 = v2;
  v5 = sub_2489A7F2C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577A3CA0);
  v42 = a2;
  v10 = sub_2489A8430();
  v11 = v10;
  if (!*(_QWORD *)(v9 + 16))
    goto LABEL_41;
  v12 = 1 << *(_BYTE *)(v9 + 32);
  v13 = *(_QWORD *)(v9 + 64);
  v40 = (_QWORD *)(v9 + 64);
  if (v12 < 64)
    v14 = ~(-1 << v12);
  else
    v14 = -1;
  v15 = v14 & v13;
  v38 = v2;
  v39 = (unint64_t)(v12 + 63) >> 6;
  v16 = v10 + 64;
  result = swift_retain();
  v18 = 0;
  for (i = v9; ; v9 = i)
  {
    if (v15)
    {
      v20 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v21 = v20 | (v18 << 6);
      goto LABEL_22;
    }
    v22 = v18 + 1;
    if (__OFADD__(v18, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v39)
      break;
    v23 = v40;
    v24 = v40[v22];
    ++v18;
    if (!v24)
    {
      v18 = v22 + 1;
      if (v22 + 1 >= v39)
        goto LABEL_34;
      v24 = v40[v18];
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v39)
        {
LABEL_34:
          swift_release();
          v3 = v38;
          if ((v42 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v24 = v40[v25];
        if (!v24)
        {
          while (1)
          {
            v18 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_43;
            if (v18 >= v39)
              goto LABEL_34;
            v24 = v40[v18];
            ++v25;
            if (v24)
              goto LABEL_21;
          }
        }
        v18 = v25;
      }
    }
LABEL_21:
    v15 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v18 << 6);
LABEL_22:
    v26 = *(_QWORD *)(v6 + 72);
    v27 = *(_QWORD *)(v9 + 48) + v26 * v21;
    if ((v42 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 32))(v8, v27, v5);
      v28 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v21);
    }
    else
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v8, v27, v5);
      v28 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v21);
      swift_retain();
    }
    sub_248988A58(&qword_2577A3CA8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAF0]);
    result = sub_2489A81CC();
    v29 = -1 << *(_BYTE *)(v11 + 32);
    v30 = result & ~v29;
    v31 = v30 >> 6;
    if (((-1 << v30) & ~*(_QWORD *)(v16 + 8 * (v30 >> 6))) != 0)
    {
      v19 = __clz(__rbit64((-1 << v30) & ~*(_QWORD *)(v16 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v32 = 0;
      v33 = (unint64_t)(63 - v29) >> 6;
      do
      {
        if (++v31 == v33 && (v32 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v34 = v31 == v33;
        if (v31 == v33)
          v31 = 0;
        v32 |= v34;
        v35 = *(_QWORD *)(v16 + 8 * v31);
      }
      while (v35 == -1);
      v19 = __clz(__rbit64(~v35)) + (v31 << 6);
    }
    *(_QWORD *)(v16 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))(*(_QWORD *)(v11 + 48) + v26 * v19, v8, v5);
    *(_QWORD *)(*(_QWORD *)(v11 + 56) + 8 * v19) = v28;
    ++*(_QWORD *)(v11 + 16);
  }
  swift_release();
  v3 = v38;
  v23 = v40;
  if ((v42 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v36 = 1 << *(_BYTE *)(v9 + 32);
  if (v36 >= 64)
    bzero(v23, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v36;
  *(_QWORD *)(v9 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v11;
  return result;
}

uint64_t sub_248999414(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  __int128 v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  __int128 v31;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577A3C68);
  result = sub_2489A8430();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 0;
    v30 = (_QWORD *)(v5 + 64);
    v9 = 1 << *(_BYTE *)(v5 + 32);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v12 = (unint64_t)(v9 + 63) >> 6;
    v13 = result + 64;
    while (1)
    {
      if (v11)
      {
        v19 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v20 = v19 | (v8 << 6);
      }
      else
      {
        v21 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        result = v5 + 64;
        if (v21 >= v12)
          goto LABEL_33;
        v22 = v30[v21];
        ++v8;
        if (!v22)
        {
          v8 = v21 + 1;
          if (v21 + 1 >= v12)
            goto LABEL_33;
          v22 = v30[v8];
          if (!v22)
          {
            v23 = v21 + 2;
            if (v23 >= v12)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                result = swift_release();
                v3 = v2;
                goto LABEL_40;
              }
              v29 = 1 << *(_BYTE *)(v5 + 32);
              if (v29 >= 64)
                bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v30 = -1 << v29;
              v3 = v2;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v22 = v30[v23];
            if (!v22)
            {
              while (1)
              {
                v8 = v23 + 1;
                if (__OFADD__(v23, 1))
                  goto LABEL_42;
                if (v8 >= v12)
                  goto LABEL_33;
                v22 = v30[v8];
                ++v23;
                if (v22)
                  goto LABEL_30;
              }
            }
            v8 = v23;
          }
        }
LABEL_30:
        v11 = (v22 - 1) & v22;
        v20 = __clz(__rbit64(v22)) + (v8 << 6);
      }
      v31 = *(_OWORD *)(*(_QWORD *)(v5 + 48) + 16 * v20);
      v28 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v20);
      if ((a2 & 1) == 0)
        swift_retain();
      sub_2489A84D8();
      sub_2489A84F0();
      sub_2489A84F0();
      result = sub_2489A84FC();
      v14 = -1 << *(_BYTE *)(v7 + 32);
      v15 = result & ~v14;
      v16 = v15 >> 6;
      if (((-1 << v15) & ~*(_QWORD *)(v13 + 8 * (v15 >> 6))) != 0)
      {
        v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v13 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
        v18 = v31;
      }
      else
      {
        v24 = 0;
        v25 = (unint64_t)(63 - v14) >> 6;
        v18 = v31;
        do
        {
          if (++v16 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v26 = v16 == v25;
          if (v16 == v25)
            v16 = 0;
          v24 |= v26;
          v27 = *(_QWORD *)(v13 + 8 * v16);
        }
        while (v27 == -1);
        v17 = __clz(__rbit64(~v27)) + (v16 << 6);
      }
      *(_QWORD *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      *(_OWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17) = v18;
      *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v28;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_40:
  *v3 = v7;
  return result;
}

uint64_t sub_2489996FC(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577A3C60);
  result = sub_2489A8430();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 0;
    v9 = (uint64_t *)(v5 + 64);
    v10 = 1 << *(_BYTE *)(v5 + 32);
    v31 = -1 << v10;
    v32 = v10;
    if (v10 < 64)
      v11 = ~(-1 << v10);
    else
      v11 = -1;
    v12 = v11 & *(_QWORD *)(v5 + 64);
    v33 = (unint64_t)(v10 + 63) >> 6;
    v13 = result + 64;
    while (1)
    {
      if (v12)
      {
        v19 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        v20 = v19 | (v8 << 6);
      }
      else
      {
        v21 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v21 >= v33)
          goto LABEL_33;
        v22 = v9[v21];
        ++v8;
        if (!v22)
        {
          v8 = v21 + 1;
          if (v21 + 1 >= v33)
            goto LABEL_33;
          v22 = v9[v8];
          if (!v22)
          {
            v23 = v21 + 2;
            if (v23 >= v33)
            {
LABEL_33:
              if ((a2 & 1) != 0)
              {
                if (v32 >= 64)
                  bzero((void *)(v5 + 64), 8 * v33);
                else
                  *v9 = v31;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v22 = v9[v23];
            if (!v22)
            {
              while (1)
              {
                v8 = v23 + 1;
                if (__OFADD__(v23, 1))
                  goto LABEL_41;
                if (v8 >= v33)
                  goto LABEL_33;
                v22 = v9[v8];
                ++v23;
                if (v22)
                  goto LABEL_30;
              }
            }
            v8 = v23;
          }
        }
LABEL_30:
        v12 = (v22 - 1) & v22;
        v20 = __clz(__rbit64(v22)) + (v8 << 6);
      }
      v28 = 8 * v20;
      v29 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + v28);
      v30 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + v28);
      if ((a2 & 1) == 0)
        swift_retain();
      result = sub_2489A84CC();
      v14 = -1 << *(_BYTE *)(v7 + 32);
      v15 = result & ~v14;
      v16 = v15 >> 6;
      if (((-1 << v15) & ~*(_QWORD *)(v13 + 8 * (v15 >> 6))) != 0)
      {
        v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v13 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v24 = 0;
        v25 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v26 = v16 == v25;
          if (v16 == v25)
            v16 = 0;
          v24 |= v26;
          v27 = *(_QWORD *)(v13 + 8 * v16);
        }
        while (v27 == -1);
        v17 = __clz(__rbit64(~v27)) + (v16 << 6);
      }
      *(_QWORD *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      v18 = 8 * v17;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + v18) = v29;
      *(_QWORD *)(*(_QWORD *)(v7 + 56) + v18) = v30;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

unint64_t sub_2489999B0(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _OWORD *v11;
  _OWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_2489A83AC();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_2489A84D8();
        sub_2489A84F0();
        sub_2489A84F0();
        result = sub_2489A84FC();
        v9 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v9 < v8)
            goto LABEL_5;
        }
        else if (v9 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v9)
        {
LABEL_11:
          v10 = *(_QWORD *)(a2 + 48);
          v11 = (_OWORD *)(v10 + 16 * v3);
          v12 = (_OWORD *)(v10 + 16 * v6);
          if (v3 != v6 || v11 >= v12 + 1)
            *v11 = *v12;
          v13 = *(_QWORD *)(a2 + 56);
          v14 = (_QWORD *)(v13 + 8 * v3);
          v15 = (_QWORD *)(v13 + 8 * v6);
          if (v3 != v6 || (v3 = v6, v14 >= v15 + 1))
          {
            *v14 = *v15;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v16 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v17 = *v16;
    v18 = (-1 << v3) - 1;
  }
  else
  {
    v16 = (uint64_t *)(v4 + 8 * (result >> 6));
    v18 = *v16;
    v17 = (-1 << result) - 1;
  }
  *v16 = v18 & v17;
  v19 = *(_QWORD *)(a2 + 16);
  v20 = __OFSUB__(v19, 1);
  v21 = v19 - 1;
  if (v20)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v21;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_248999B80(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t result;
  unint64_t v23;
  char v24;
  uint64_t v25;

  v4 = (_QWORD **)v3;
  v8 = sub_2489A7F2C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (_QWORD *)*v3;
  v14 = sub_248998A98(a2);
  v15 = v12[2];
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_14;
  }
  v18 = v13;
  v19 = v12[3];
  if (v19 >= v17 && (a3 & 1) != 0)
  {
LABEL_7:
    v20 = *v4;
    if ((v18 & 1) != 0)
    {
LABEL_8:
      v21 = v20[7];
      result = swift_release();
      *(_QWORD *)(v21 + 8 * v14) = a1;
      return result;
    }
    goto LABEL_11;
  }
  if (v19 >= v17 && (a3 & 1) == 0)
  {
    sub_248999FF0();
    goto LABEL_7;
  }
  sub_248999080(v17, a3 & 1);
  v23 = sub_248998A98(a2);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_14:
    result = sub_2489A8484();
    __break(1u);
    return result;
  }
  v14 = v23;
  v20 = *v4;
  if ((v18 & 1) != 0)
    goto LABEL_8;
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  return sub_248999F58(v14, (uint64_t)v11, a1, v20);
}

uint64_t sub_248999CDC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t result;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  char v20;
  uint64_t *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v5 = v4;
  v10 = *v4;
  v12 = sub_248998B34(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= result && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= result && (a4 & 1) == 0)
  {
    result = (uint64_t)sub_24899A220();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];
      result = swift_release();
      *(_QWORD *)(v19 + 8 * v12) = a1;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v21 = (uint64_t *)(v18[6] + 16 * v12);
    *v21 = a2;
    v21[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v22 = v18[2];
    v23 = __OFADD__(v22, 1);
    v24 = v22 + 1;
    if (!v23)
    {
      v18[2] = v24;
      return result;
    }
    goto LABEL_14;
  }
  sub_248999414(result, a4 & 1);
  result = sub_248998B34(a2, a3);
  if ((v16 & 1) == (v20 & 1))
  {
    v12 = result;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_2489A8484();
  __break(1u);
  return result;
}

uint64_t sub_248999E20(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t result;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v4 = v3;
  v8 = *v3;
  v10 = sub_248998B04(a2);
  v11 = *(_QWORD *)(v8 + 16);
  v12 = (v9 & 1) == 0;
  result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v14 = v9;
  v15 = *(_QWORD *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0)
    goto LABEL_7;
  if (v15 >= result && (a3 & 1) == 0)
  {
    result = (uint64_t)sub_24899A3C4();
LABEL_7:
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
    {
LABEL_8:
      v17 = v16[7];
      result = swift_release();
      *(_QWORD *)(v17 + 8 * v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    v19 = 8 * v10;
    *(_QWORD *)(v16[6] + v19) = a2;
    *(_QWORD *)(v16[7] + v19) = a1;
    v20 = v16[2];
    v21 = __OFADD__(v20, 1);
    v22 = v20 + 1;
    if (!v21)
    {
      v16[2] = v22;
      return result;
    }
    goto LABEL_14;
  }
  sub_2489996FC(result, a3 & 1);
  result = sub_248998B04(a2);
  if ((v14 & 1) == (v18 & 1))
  {
    v10 = result;
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_2489A8484();
  __break(1u);
  return result;
}

uint64_t sub_248999F58(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v8 = a4[6];
  v9 = sub_2489A7F2C();
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * a1, a2, v9);
  *(_QWORD *)(a4[7] + 8 * a1) = a3;
  v11 = a4[2];
  v12 = __OFADD__(v11, 1);
  v13 = v11 + 1;
  if (v12)
    __break(1u);
  else
    a4[2] = v13;
  return result;
}

void *sub_248999FF0()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *result;
  unint64_t v9;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int64_t v26;

  v1 = sub_2489A7F2C();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577A3CA0);
  v24 = v0;
  v5 = *v0;
  v6 = sub_2489A8424();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v24 = v7;
    return result;
  }
  result = (void *)(v6 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9)
    result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  v25 = v5 + 64;
  v11 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v5 + 16);
  v12 = 1 << *(_BYTE *)(v5 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v5 + 64);
  v26 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v16 = v15 | (v11 << 6);
      goto LABEL_12;
    }
    v20 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v26)
      goto LABEL_26;
    v21 = *(_QWORD *)(v25 + 8 * v20);
    ++v11;
    if (!v21)
    {
      v11 = v20 + 1;
      if (v20 + 1 >= v26)
        goto LABEL_26;
      v21 = *(_QWORD *)(v25 + 8 * v11);
      if (!v21)
        break;
    }
LABEL_25:
    v14 = (v21 - 1) & v21;
    v16 = __clz(__rbit64(v21)) + (v11 << 6);
LABEL_12:
    v17 = *(_QWORD *)(v2 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(_QWORD *)(v5 + 48) + v17, v1);
    v18 = 8 * v16;
    v19 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v16);
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(_QWORD *)(v7 + 48) + v17, v4, v1);
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + v18) = v19;
    result = (void *)swift_retain();
  }
  v22 = v20 + 2;
  if (v22 >= v26)
    goto LABEL_26;
  v21 = *(_QWORD *)(v25 + 8 * v22);
  if (v21)
  {
    v11 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v11 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v11 >= v26)
      goto LABEL_26;
    v21 = *(_QWORD *)(v25 + 8 * v11);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_24899A220()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577A3C68);
  v2 = *v0;
  v3 = sub_2489A8424();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v19 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v13)
      goto LABEL_26;
    v20 = *(_QWORD *)(v6 + 8 * v19);
    ++v9;
    if (!v20)
    {
      v9 = v19 + 1;
      if (v19 + 1 >= v13)
        goto LABEL_26;
      v20 = *(_QWORD *)(v6 + 8 * v9);
      if (!v20)
        break;
    }
LABEL_25:
    v12 = (v20 - 1) & v20;
    v15 = __clz(__rbit64(v20)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = 8 * v15;
    v18 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v17);
    *(_OWORD *)(*(_QWORD *)(v4 + 48) + v16) = *(_OWORD *)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v17) = v18;
    result = (void *)swift_retain();
  }
  v21 = v19 + 2;
  if (v21 >= v13)
    goto LABEL_26;
  v20 = *(_QWORD *)(v6 + 8 * v21);
  if (v20)
  {
    v9 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v20 = *(_QWORD *)(v6 + 8 * v9);
    ++v21;
    if (v20)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_24899A3C4()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577A3C60);
  v2 = *v0;
  v3 = sub_2489A8424();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_26;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
        break;
    }
LABEL_25:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v17;
    result = (void *)swift_retain();
  }
  v20 = v18 + 2;
  if (v20 >= v13)
    goto LABEL_26;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

char *sub_24899A564(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4;
  char *v5;
  char *v6;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + a1 + 32);
    v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      return v6;
    }
  }
  result = (char *)sub_2489A8448();
  __break(1u);
  return result;
}

unint64_t sub_24899A648(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  char v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v1 = a1[2];
  if (!v1)
    return MEMORY[0x24BEE4B00];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577A3C60);
  v3 = (_QWORD *)sub_2489A843C();
  v5 = a1[4];
  v4 = a1[5];
  result = sub_248998B04(v5);
  if ((v7 & 1) != 0)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_retain();
    return (unint64_t)v3;
  }
  v8 = a1 + 7;
  while (1)
  {
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v9 = 8 * result;
    *(_QWORD *)(v3[6] + v9) = v5;
    *(_QWORD *)(v3[7] + v9) = v4;
    v10 = v3[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      break;
    v3[2] = v12;
    if (!--v1)
      goto LABEL_8;
    v13 = v8 + 2;
    v5 = *(v8 - 1);
    v14 = *v8;
    swift_retain();
    result = sub_248998B04(v5);
    v8 = v13;
    v4 = v14;
    if ((v15 & 1) != 0)
      goto LABEL_7;
  }
  __break(1u);
  return result;
}

unint64_t sub_24899A744(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v1 = a1[2];
  if (!v1)
    return MEMORY[0x24BEE4B00];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577A3C68);
  v3 = (_QWORD *)sub_2489A843C();
  v4 = a1[4];
  v5 = a1[5];
  v6 = a1[6];
  result = sub_248998B34(v4, v5);
  if ((v8 & 1) != 0)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_retain();
    return (unint64_t)v3;
  }
  v9 = a1 + 9;
  while (1)
  {
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v3[6] + 16 * result);
    *v10 = v4;
    v10[1] = v5;
    *(_QWORD *)(v3[7] + 8 * result) = v6;
    v11 = v3[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      break;
    v3[2] = v13;
    if (!--v1)
      goto LABEL_8;
    v14 = v9 + 3;
    v4 = *(v9 - 2);
    v5 = *(v9 - 1);
    v15 = *v9;
    swift_retain();
    result = sub_248998B34(v4, v5);
    v9 = v14;
    v6 = v15;
    if ((v16 & 1) != 0)
      goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t _tb_eve_transport_send_message_0(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v5;
  uint64_t v6;

  tb_transport_get_context(a1);
  swift_retain();
  sub_248997C7C(a2);
  v6 = v5;
  swift_release();
  *a3 = v6;
  return 0;
}

uint64_t sub_24899A934()
{
  return type metadata accessor for EveEndpointData(0);
}

uint64_t type metadata accessor for EveEndpointData(uint64_t a1)
{
  return sub_24899AA5C(a1, (uint64_t *)&unk_254460738);
}

void sub_24899A950()
{
  unint64_t v0;

  sub_24899A9CC();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

void sub_24899A9CC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254460730)
  {
    sub_2489A7F2C();
    v0 = sub_2489A8358();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254460730);
  }
}

uint64_t type metadata accessor for EveTransportCoordinator()
{
  return objc_opt_self();
}

uint64_t sub_24899AA40()
{
  return type metadata accessor for EveTransportManager(0);
}

uint64_t type metadata accessor for EveTransportManager(uint64_t a1)
{
  return sub_24899AA5C(a1, (uint64_t *)&unk_254460768);
}

uint64_t sub_24899AA5C(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_24899AA90()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2489A7F2C();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t type metadata accessor for EveTransportManager.PendingMessage()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for EveTransportManager.Connection()
{
  return objc_opt_self();
}

uint64_t destroy for EveTransportManager.Listener()
{
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

_QWORD *_s9Tightbeam19EveTransportManagerC8ListenerVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for EveTransportManager.Listener(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for EveTransportManager.Listener(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for EveTransportManager.Listener(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for EveTransportManager.Listener(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for EveTransportManager.Listener()
{
  return &type metadata for EveTransportManager.Listener;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_24899AD88(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_24898E6E0(a1, a2);
  return a1;
}

uint64_t sub_24899AD9C()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24899ADC8(uint64_t a1)
{
  uint64_t v1;

  return sub_248995D6C(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_24899ADD0()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_24899ADF4(uint64_t a1, unint64_t a2, uint64_t a3, char a4)
{
  return sub_2489958CC(a1, a2, a3, a4);
}

uint64_t sub_24899ADFC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24899AE38(uint64_t a1)
{
  return sub_248997698(a1);
}

void sub_24899AE40(uint64_t a1)
{
  sub_248997084(a1);
}

uint64_t sub_24899AE48(uint64_t a1)
{
  return sub_2489972A4(a1);
}

_OWORD *sub_24899AE50(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_24899AE60(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x2495A1154](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24899AEA0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24899AEE8(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t result;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v10 = a1;
    v11 = 1;
    v12 = 0;
    v13 = a2;
    type metadata accessor for TransportBuffer();
    v14 = 0;
    v15 = 0;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0;
    v4 = swift_allocObject();
    *(_QWORD *)(v4 + 24) = 0;
    *(_QWORD *)(v4 + 32) = 0;
    *(_QWORD *)(v4 + 16) = &v10;
    *(_BYTE *)(v4 + 40) = 1;
    a3();
    v5 = *(_QWORD *)(v4 + 16);
    v6 = *(_QWORD *)(v4 + 24);
    v7 = *(_QWORD *)(v4 + 32);
    *(_QWORD *)(v4 + 24) = 0;
    *(_QWORD *)(v4 + 32) = 0;
    *(_QWORD *)(v4 + 16) = 0;
    v8 = *(_BYTE *)(v4 + 40);
    *(_BYTE *)(v4 + 40) = 2;
    sub_24899B240(v5, v6, v7, v8);
    return swift_release();
  }
  else
  {
    result = sub_2489A840C();
    __break(1u);
  }
  return result;
}

uint64_t TransportBuffer.__allocating_init()()
{
  uint64_t v0;
  uint64_t v1;

  v0 = swift_allocObject();
  v1 = swift_slowAlloc();
  tb_transport_initialize_message_buffer(v1);
  *(_QWORD *)(v0 + 16) = v1;
  *(_QWORD *)(v0 + 24) = nullsub_1;
  *(_QWORD *)(v0 + 32) = 0;
  *(_BYTE *)(v0 + 40) = 0;
  return v0;
}

uint64_t TransportBuffer.init()()
{
  uint64_t v0;
  uint64_t v1;

  v1 = swift_slowAlloc();
  tb_transport_initialize_message_buffer(v1);
  *(_QWORD *)(v0 + 16) = v1;
  *(_QWORD *)(v0 + 24) = nullsub_1;
  *(_QWORD *)(v0 + 32) = 0;
  *(_BYTE *)(v0 + 40) = 0;
  return v0;
}

uint64_t sub_24899B0C8(uint64_t (*a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  int v11;
  int v12;
  _DWORD *v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;

  v7 = v6;
  if (*(_BYTE *)(v6 + 40))
  {
    result = sub_2489A840C();
    __break(1u);
  }
  else
  {
    v10 = *(_QWORD *)(v6 + 16);
    v11 = a1(a5, a6, v10);
    if (v11)
    {
      v12 = v11;
      type metadata accessor for TransportError(0);
      sub_24899B1F8();
      swift_allocError();
      *v13 = v12;
      return swift_willThrow();
    }
    else
    {
      v16 = *(_QWORD *)(v6 + 16);
      v15 = *(_QWORD *)(v6 + 24);
      v17 = *(_QWORD *)(v7 + 32);
      *(_QWORD *)(v7 + 16) = v10;
      *(_QWORD *)(v7 + 24) = a3;
      *(_QWORD *)(v7 + 32) = a4;
      v18 = *(_BYTE *)(v7 + 40);
      *(_BYTE *)(v7 + 40) = 0;
      swift_retain();
      return sub_24899B240(v16, v15, v17, v18);
    }
  }
  return result;
}

unint64_t sub_24899B1F8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2577A3A50;
  if (!qword_2577A3A50)
  {
    type metadata accessor for TransportError(255);
    result = MEMORY[0x2495A1154](&protocol conformance descriptor for tb_error_t, v1);
    atomic_store(result, (unint64_t *)&qword_2577A3A50);
  }
  return result;
}

uint64_t sub_24899B240(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t result;

  if (!a4)
    return swift_release();
  return result;
}

uint64_t sub_24899B254(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;

  if (*(unsigned __int8 *)(v2 + 40) >= 2u)
    goto LABEL_8;
  v4 = *(_QWORD *)(v2 + 16);
  v5 = *(_QWORD *)(v4 + 16);
  if (__OFADD__(v5, a2))
  {
    __break(1u);
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_QWORD *)(v4 + 24) >= v5 + a2)
  {
    result = sub_2489A837C();
    v7 = *(_QWORD *)(v4 + 16);
    v8 = __OFADD__(v7, a2);
    v9 = v7 + a2;
    if (!v8)
    {
      *(_QWORD *)(v4 + 16) = v9;
      return result;
    }
    goto LABEL_7;
  }
LABEL_8:
  result = sub_2489A840C();
  __break(1u);
  return result;
}

uint64_t sub_24899B360(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  if (*(unsigned __int8 *)(v1 + 40) >= 2u || (v2 = *(_QWORD *)(v1 + 16), *(_QWORD *)(v2 + 24) <= result))
  {
    result = sub_2489A840C();
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v2 + 16) = result;
  }
  return result;
}

uint64_t sub_24899B428(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  _QWORD v15[6];
  uint64_t v16;

  if (*(unsigned __int8 *)(v5 + 40) < 2u)
  {
    v7 = *(uint64_t **)(v5 + 16);
    if (v7[4] >= *(_QWORD *)(*(_QWORD *)(a4 - 8) + 64))
    {
      v9 = *v7;
      MEMORY[0x24BDAC7A8](a1);
      v15[2] = a4;
      v15[3] = v10;
      v15[4] = v11;
      v15[5] = v12;
      v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577A3B68);
      return sub_24899B5AC(a4, 1, (uint64_t)sub_24899B57C, (uint64_t)v15, v9, MEMORY[0x24BEE4260], a4, v13, a5, MEMORY[0x24BEE3F20], (uint64_t)&v16);
    }
    __break(1u);
  }
  result = sub_2489A840C();
  __break(1u);
  return result;
}

uint64_t sub_24899B57C(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  result = (*(uint64_t (**)(void))(v2 + 32))();
  if (v3)
    *a2 = v3;
  return result;
}

uint64_t sub_24899B5AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t (*v17)(uint64_t, char *);
  uint64_t result;
  uint64_t v19;

  v13 = *(_QWORD *)(a8 - 8);
  v14 = MEMORY[0x24BDAC7A8](a5);
  v16 = (char *)&v19 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = v17(v14, v16);
  if (v11)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v13 + 32))(a11, v16, a8);
  return result;
}

uint64_t sub_24899B62C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t result;

  if (*(unsigned __int8 *)(v0 + 40) >= 2u || (v1 = *(_QWORD **)(v0 + 16), v2 = v1[4], v1[3] < v2))
  {
    sub_2489A840C();
    __break(1u);
  }
  else if ((v2 & 0x8000000000000000) == 0)
  {
    return *v1;
  }
  result = sub_2489A8448();
  __break(1u);
  return result;
}

uint64_t sub_24899B740()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  if (*(unsigned __int8 *)(v0 + 40) >= 2u)
    goto LABEL_8;
  v1 = *(_QWORD **)(v0 + 16);
  v2 = v1[2];
  v3 = v1[4];
  if (v2 < v3)
    goto LABEL_8;
  v4 = v1[3];
  if (v4 < v2)
    goto LABEL_8;
  if (__OFSUB__(v4, v3))
  {
    __break(1u);
LABEL_8:
    sub_2489A840C();
    __break(1u);
    goto LABEL_9;
  }
  if (((v4 - v3) & 0x8000000000000000) == 0)
    return *v1 + v3;
LABEL_9:
  result = sub_2489A8448();
  __break(1u);
  return result;
}

uint64_t sub_24899B874()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t result;

  if (*(unsigned __int8 *)(v0 + 40) >= 2u || (v1 = *(_QWORD **)(v0 + 16), v2 = v1[2], v1[3] < v2))
  {
    sub_2489A840C();
    __break(1u);
  }
  else if ((v2 & 0x8000000000000000) == 0)
  {
    return *v1;
  }
  result = sub_2489A8448();
  __break(1u);
  return result;
}

uint64_t TransportBuffer.deinit()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  void (*v4)(uint64_t);
  uint64_t v5;

  v1 = v0;
  v2 = *(_BYTE *)(v0 + 40);
  if (!v2)
  {
    v4 = *(void (**)(uint64_t))(v0 + 24);
    v3 = *(_QWORD *)(v0 + 32);
    v5 = *(_QWORD *)(v1 + 16);
    swift_retain();
    v4(v5);
    MEMORY[0x2495A11FC](v5, -1, -1);
    sub_24899B240(v5, (uint64_t)v4, v3, 0);
    v2 = *(_BYTE *)(v1 + 40);
  }
  sub_24899B240(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), v2);
  return v1;
}

uint64_t TransportBuffer.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  void (*v4)(uint64_t);
  uint64_t v5;

  v1 = v0;
  v2 = *(_BYTE *)(v0 + 40);
  if (!v2)
  {
    v4 = *(void (**)(uint64_t))(v0 + 24);
    v3 = *(_QWORD *)(v0 + 32);
    v5 = *(_QWORD *)(v1 + 16);
    swift_retain();
    v4(v5);
    MEMORY[0x2495A11FC](v5, -1, -1);
    sub_24899B240(v5, (uint64_t)v4, v3, 0);
    v2 = *(_BYTE *)(v1 + 40);
  }
  sub_24899B240(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), v2);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for TransportBuffer()
{
  return objc_opt_self();
}

uint64_t method lookup function for TransportBuffer()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TransportBuffer.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of TransportBuffer.construct(with:destructor:size:capabilities:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of TransportBuffer.copyBytes<A>(from:size:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of TransportBuffer.setPosition(pos:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of TransportBuffer.withReservedDataRebound<A, B>(to:closure:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of TransportBuffer.reserved.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of TransportBuffer.data.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of TransportBuffer.rawData.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t sub_24899BB30(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t result;

  if (!a4)
    return swift_retain();
  return result;
}

uint64_t destroy for TransportBuffer.Buffer(uint64_t a1)
{
  return sub_24899B240(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_BYTE *)(a1 + 24));
}

uint64_t initializeWithCopy for TransportBuffer.Buffer(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_BYTE *)(a2 + 24);
  sub_24899BB30(*(_QWORD *)a2, v4, v5, v6);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_BYTE *)(a1 + 24) = v6;
  return a1;
}

uint64_t assignWithCopy for TransportBuffer.Buffer(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_BYTE *)(a2 + 24);
  sub_24899BB30(*(_QWORD *)a2, v4, v5, v6);
  v7 = *(_QWORD *)a1;
  v8 = *(_QWORD *)(a1 + 8);
  v9 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  v10 = *(_BYTE *)(a1 + 24);
  *(_BYTE *)(a1 + 24) = v6;
  sub_24899B240(v7, v8, v9, v10);
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for TransportBuffer.Buffer(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_BYTE *)(a2 + 24);
  v5 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = v3;
  v8 = *(_BYTE *)(a1 + 24);
  *(_BYTE *)(a1 + 24) = v4;
  sub_24899B240(v5, v7, v6, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for TransportBuffer.Buffer(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 25))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 24);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for TransportBuffer.Buffer(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 25) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 25) = 0;
    if (a2)
      *(_BYTE *)(result + 24) = -(char)a2;
  }
  return result;
}

uint64_t sub_24899BD10(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 24) <= 1u)
    return *(unsigned __int8 *)(a1 + 24);
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t sub_24899BD28(uint64_t result, unsigned int a2)
{
  uint64_t v2;

  v2 = a2 - 2;
  if (a2 >= 2)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    LOBYTE(a2) = 2;
    *(_QWORD *)result = v2;
  }
  *(_BYTE *)(result + 24) = a2;
  return result;
}

ValueMetadata *type metadata accessor for TransportBuffer.Buffer()
{
  return &type metadata for TransportBuffer.Buffer;
}

uint64_t sub_24899BD54()
{
  swift_unknownObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_24899BD78(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t ObjectType;

  v3 = *(_QWORD *)(v1 + 24);
  ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(a1, ObjectType, v3) & 1;
}

uint64_t sub_24899BDC4()
{
  uint64_t v0;

  swift_beginAccess();
  return MEMORY[0x2495A1274](v0 + 24);
}

uint64_t sub_24899BE08(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_beginAccess();
  *(_QWORD *)(v2 + 32) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*sub_24899BE68(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[5] = v1;
  swift_beginAccess();
  v4 = MEMORY[0x2495A1274](v1 + 24);
  v5 = *(_QWORD *)(v1 + 32);
  v3[3] = v4;
  v3[4] = v5;
  return sub_24899BED4;
}

void sub_24899BED4(uint64_t a1, char a2)
{
  void *v3;

  v3 = *(void **)a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 40) + 32) = *(_QWORD *)(*(_QWORD *)a1 + 32);
  swift_unknownObjectWeakAssign();
  if ((a2 & 1) != 0)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

uint64_t ForwardingConnection.__allocating_init(service_endpoint:client_endpoint:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  ForwardingConnection.init(service_endpoint:client_endpoint:)(a1, a2);
  return v4;
}

uint64_t ForwardingConnection.init(service_endpoint:client_endpoint:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  unsigned int *v7;
  unsigned int *v8;
  unsigned int *v9;
  unsigned int *v10;
  void *v11;
  _BYTE *v12;
  _QWORD v14[6];

  v3 = v2;
  *(_QWORD *)(v2 + 16) = 0;
  *(_QWORD *)(v2 + 32) = 0;
  swift_unknownObjectWeakInit();
  type metadata accessor for AnyForwardingConnection();
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v2;
  *(_QWORD *)(v6 + 24) = &off_2519B1C68;
  swift_retain();
  TightbeamEndpoint.constructEndpoint()();
  v8 = v7;
  TightbeamEndpoint.constructEndpoint()();
  v10 = v9;
  v14[4] = sub_24899C0DC;
  v14[5] = v6;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 1107296256;
  v14[2] = sub_24899C0E0;
  v14[3] = &block_descriptor;
  v11 = _Block_copy(v14);
  swift_retain();
  swift_release();
  v12 = tb_forwarding_connection_create_with_endpoint(v8, v10, v11);
  _Block_release(v11);
  swift_release();
  sub_24899C15C(a2);
  sub_24899C15C(a1);
  *(_QWORD *)(v3 + 16) = v12;
  return v3;
}

uint64_t type metadata accessor for AnyForwardingConnection()
{
  return objc_opt_self();
}

uint64_t sub_24899C0E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t (*v7)(uint64_t, uint64_t, uint64_t);

  v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  LOBYTE(a4) = v7(a2, a3, a4);
  swift_release();
  return a4 & 1;
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_24899C15C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for TightbeamEndpoint();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t ForwardingConnection.__allocating_init(service_transport:client_transport:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _BYTE *v7;
  _QWORD v9[6];

  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = 0;
  *(_QWORD *)(v4 + 32) = 0;
  swift_unknownObjectWeakInit();
  type metadata accessor for AnyForwardingConnection();
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = &off_2519B1C68;
  v9[4] = sub_24899C0DC;
  v9[5] = v5;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 1107296256;
  v9[2] = sub_24899C0E0;
  v9[3] = &block_descriptor_3;
  v6 = _Block_copy(v9);
  swift_retain();
  swift_retain();
  swift_release();
  v7 = tb_forwarding_connection_create(a1, a2, v6);
  swift_release();
  _Block_release(v6);
  *(_QWORD *)(v4 + 16) = v7;
  return v4;
}

uint64_t ForwardingConnection.init(service_transport:client_transport:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  void *v6;
  _BYTE *v7;
  _QWORD v9[6];

  *(_QWORD *)(v2 + 16) = 0;
  *(_QWORD *)(v2 + 32) = 0;
  swift_unknownObjectWeakInit();
  type metadata accessor for AnyForwardingConnection();
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v2;
  *(_QWORD *)(v5 + 24) = &off_2519B1C68;
  v9[4] = sub_24899C0DC;
  v9[5] = v5;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 1107296256;
  v9[2] = sub_24899C0E0;
  v9[3] = &block_descriptor_7;
  v6 = _Block_copy(v9);
  swift_retain();
  swift_retain();
  swift_release();
  v7 = tb_forwarding_connection_create(a1, a2, v6);
  swift_release();
  _Block_release(v6);
  *(_QWORD *)(v2 + 16) = v7;
  return v2;
}

uint64_t ForwardingConnection.__allocating_init(serviceEndpoint:clientEndpoint:rawConnectionType:)(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v6;

  v6 = swift_allocObject();
  ForwardingConnection.init(serviceEndpoint:clientEndpoint:rawConnectionType:)(a1, a2, a3);
  return v6;
}

uint64_t ForwardingConnection.init(serviceEndpoint:clientEndpoint:rawConnectionType:)(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  unsigned int *v9;
  unsigned int *v10;
  unsigned int *v11;
  unsigned int *v12;
  void *v13;
  _BYTE *v14;
  _QWORD v16[6];

  v4 = v3;
  *(_QWORD *)(v3 + 16) = 0;
  *(_QWORD *)(v3 + 32) = 0;
  swift_unknownObjectWeakInit();
  type metadata accessor for AnyForwardingConnection();
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v3;
  *(_QWORD *)(v8 + 24) = &off_2519B1C68;
  swift_retain();
  TightbeamEndpoint.constructEndpoint()();
  v10 = v9;
  TightbeamEndpoint.constructEndpoint()();
  v12 = v11;
  v16[4] = sub_24899C0DC;
  v16[5] = v8;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 1107296256;
  v16[2] = sub_24899C0E0;
  v16[3] = &block_descriptor_10;
  v13 = _Block_copy(v16);
  swift_retain();
  swift_release();
  v14 = tb_forwarding_connection_create_with_endpoint_options(v10, v12, a3, v13);
  _Block_release(v13);
  swift_release();
  sub_24899C15C(a2);
  sub_24899C15C(a1);
  *(_QWORD *)(v4 + 16) = v14;
  return v4;
}

uint64_t sub_24899C530(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t ObjectType;

  v4 = *(_QWORD *)(v2 + 24);
  ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(a2, ObjectType, v4) & 1;
}

uint64_t sub_24899C57C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t ObjectType;
  uint64_t result;
  uint64_t v8;

  swift_beginAccess();
  if (MEMORY[0x2495A1274](v1 + 24))
  {
    v3 = *(_QWORD *)(v1 + 32);
    type metadata accessor for AnyForwardingConnection();
    v4 = swift_allocObject();
    *(_QWORD *)(v4 + 16) = v1;
    *(_QWORD *)(v4 + 24) = &off_2519B1C68;
    swift_retain();
    v5 = sub_2489A48B8(a1, v4);
    ObjectType = swift_getObjectType();
    v8 = v5;
    LOBYTE(v3) = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t))(v3 + 8))(v1, &v8, ObjectType, v3);
    swift_retain();
    sub_2489A400C();
    swift_unknownObjectRelease();
    swift_release_n();
    return v3 & 1;
  }
  else
  {
    result = sub_2489A840C();
    __break(1u);
  }
  return result;
}

uint64_t sub_24899C6B4()
{
  uint64_t v0;
  uint64_t result;

  result = *(_QWORD *)(v0 + 16);
  if (result)
    return tb_forwarding_connection_activate(result);
  __break(1u);
  return result;
}

uint64_t ForwardingConnection.deinit()
{
  uint64_t v0;
  uint64_t result;

  result = *(_QWORD *)(v0 + 16);
  if (result)
  {
    tb_forwarding_connection_destruct(result);
    sub_24899C6F0(v0 + 24);
    return v0;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_24899C6F0(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t ForwardingConnection.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t result;

  result = *(_QWORD *)(v0 + 16);
  if (result)
  {
    tb_forwarding_connection_destruct(result);
    sub_24899C6F0(v0 + 24);
    return swift_deallocClassInstance();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_24899C74C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  v3 = *a1;
  v4 = *a1 + 24;
  swift_beginAccess();
  result = MEMORY[0x2495A1274](v4);
  v6 = *(_QWORD *)(v3 + 32);
  *a2 = result;
  a2[1] = v6;
  return result;
}

uint64_t sub_24899C7A4(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v3 + 32) = v2;
  return swift_unknownObjectWeakAssign();
}

uint64_t dispatch thunk of ForwardingProtocol.decode(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t type metadata accessor for ForwardingConnection()
{
  return objc_opt_self();
}

uint64_t method lookup function for ForwardingConnection()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ForwardingConnection.forward.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of ForwardingConnection.forward.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of ForwardingConnection.forward.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of ForwardingConnection.__allocating_init(service_endpoint:client_endpoint:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of ForwardingConnection.__allocating_init(service_transport:client_transport:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of ForwardingConnection.__allocating_init(serviceEndpoint:clientEndpoint:rawConnectionType:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of ForwardingConnection.begin()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

unint64_t tb_error_t.description.getter(int a1)
{
  unint64_t result;

  result = 0x73736563637553;
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      result = 0x6F6E20646C756F43;
      break;
    case 2:
      result = 0xD000000000000015;
      break;
    case 3:
    case 5:
      result = 0xD000000000000011;
      break;
    case 4:
      result = 0xD000000000000016;
      break;
    case 7:
      result = 0xD000000000000015;
      break;
    case 8:
      result = 0x6961662072657355;
      break;
    case 9:
      result = 0x2064726177726F46;
      break;
    case 15:
      result = 0xD00000000000001ELL;
      break;
    default:
      result = 0x206E776F6E6B6E55;
      break;
  }
  return result;
}

unint64_t static tb_error_t._nsErrorDomain.getter()
{
  return 0xD000000000000018;
}

uint64_t sub_24899CA04()
{
  sub_24899CBC0(&qword_2577A3A98, (uint64_t)&protocol conformance descriptor for tb_error_t);
  return sub_2489A7ED8();
}

uint64_t sub_24899CA3C()
{
  sub_24899CBC0(&qword_2577A3A98, (uint64_t)&protocol conformance descriptor for tb_error_t);
  return sub_2489A7ECC();
}

unint64_t sub_24899CA74()
{
  int *v0;

  return tb_error_t.description.getter(*v0);
}

uint64_t sub_24899CA7C()
{
  return sub_24899CBC0(&qword_2577A3CD0, (uint64_t)&protocol conformance descriptor for tb_error_t);
}

uint64_t sub_24899CAA0()
{
  return sub_24899CBC0(&qword_2577A3CD8, (uint64_t)&unk_2489A8CC8);
}

uint64_t sub_24899CAC4()
{
  return sub_24899CBC0(&qword_2577A3CE0, (uint64_t)&unk_2489A8C8C);
}

unint64_t sub_24899CAEC()
{
  unint64_t result;

  result = qword_2577A3CE8;
  if (!qword_2577A3CE8)
  {
    result = MEMORY[0x2495A1154](MEMORY[0x24BEE4540], MEMORY[0x24BEE44F0]);
    atomic_store(result, (unint64_t *)&qword_2577A3CE8);
  }
  return result;
}

unint64_t sub_24899CB30()
{
  return 0xD000000000000018;
}

uint64_t sub_24899CB4C()
{
  return sub_24899CBC0((unint64_t *)&qword_2577A3A50, (uint64_t)&protocol conformance descriptor for tb_error_t);
}

uint64_t sub_24899CB70()
{
  sub_24899CBC0(&qword_2577A3A98, (uint64_t)&protocol conformance descriptor for tb_error_t);
  return sub_2489A7EB4();
}

uint64_t sub_24899CBC0(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for TransportError(255);
    result = MEMORY[0x2495A1154](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24899CC00()
{
  uint64_t result;

  type metadata accessor for UnixTransportProtocol();
  sub_24899D200();
  sub_2489A810C();
  swift_allocObject();
  result = sub_2489A8100();
  qword_2577A4D18 = result;
  return result;
}

uint64_t sub_24899CC58(uint64_t *a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;

  v6 = 0;
  if ((a3 & 1) == 0)
  {
    if (a1)
    {
      if (a2 - (uint64_t)a1 >= a5)
      {
LABEL_4:
        *(_QWORD *)a6 = sub_24899CDE4(a1, a2);
        *(_BYTE *)(a6 + 8) = 0;
        return a5;
      }
    }
    else if (a5 <= 0)
    {
      goto LABEL_4;
    }
    return 0;
  }
  return v6;
}

uint64_t sub_24899CD20()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for UnixTransportProtocol()
{
  return objc_opt_self();
}

unint64_t sub_24899CD50()
{
  return 0xD000000000000013;
}

uint64_t sub_24899CD6C()
{
  swift_release();
  return swift_allocObject();
}

uint64_t sub_24899CD8C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *MEMORY[0x24BDE0538];
  v3 = sub_2489A8118();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(a1, v2, v3);
}

uint64_t sub_24899CDD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24899CEAC(a1, a3);
}

uint64_t sub_24899CDDC()
{
  return 1;
}

uint64_t sub_24899CDE4(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  char v5;

  if (!a1)
  {
    v2 = 0;
    goto LABEL_6;
  }
  v2 = a2 - (_QWORD)a1;
  if (a2 - (uint64_t)a1 <= 15)
  {
LABEL_6:
    sub_24899D244();
    swift_allocError();
    *(_QWORD *)v4 = 16;
    v5 = 1;
    goto LABEL_7;
  }
  v2 = *a1;
  if (*a1 == 0x12345678AABBCCDDLL)
    return a1[1];
  sub_24899D244();
  swift_allocError();
  v5 = 0;
  *(_QWORD *)v4 = 0x12345678AABBCCDDLL;
LABEL_7:
  *(_QWORD *)(v4 + 8) = v2;
  *(_BYTE *)(v4 + 16) = v5;
  return swift_willThrow();
}

uint64_t sub_24899CEAC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  uint64_t result;
  uint64_t v11;
  uint64_t __src;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (a2 < 0)
  {
    sub_2489A8400();
    __break(1u);
    result = swift_unexpectedError();
    __break(1u);
  }
  else
  {
    v13 = xmmword_2489A9990;
    __src = 0x12345678AABBCCDDLL;
    v3 = sub_2489A3068(&__src, &v13);
    v5 = v4 & 0xFFFFFFFFFFFFFFLL;
    sub_2489A7F5C();
    sub_24898E6E0(v3, v5);
    v11 = a2;
    v6 = sub_2489A3068(&v11, &__src);
    v8 = v7 & 0xFFFFFFFFFFFFFFLL;
    sub_2489A7F5C();
    sub_24898E6E0(v6, v8);
    v9 = v13;
    sub_2489A8160();
    sub_24898E6E0(v9, *((unint64_t *)&v9 + 1));
    return sub_2489A816C();
  }
  return result;
}

uint64_t sub_24899D030()
{
  sub_2489A8154();
  return 16;
}

uint64_t sub_24899D1F4(uint64_t *a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v4;

  return sub_24899CC58(a1, a2, a3 & 1, a4, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24));
}

unint64_t sub_24899D200()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2577A3CF0;
  if (!qword_2577A3CF0)
  {
    v1 = type metadata accessor for UnixTransportProtocol();
    result = MEMORY[0x2495A1154](&unk_2489A99B8, v1);
    atomic_store(result, (unint64_t *)&qword_2577A3CF0);
  }
  return result;
}

unint64_t sub_24899D244()
{
  unint64_t result;

  result = qword_2577A3CF8;
  if (!qword_2577A3CF8)
  {
    result = MEMORY[0x2495A1154](&unk_2489A9A34, &type metadata for UnixProtocolHeader.Error);
    atomic_store(result, (unint64_t *)&qword_2577A3CF8);
  }
  return result;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for UnixProtocolHeader.Error(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for UnixProtocolHeader.Error(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_24899D328(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_24899D330(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for UnixProtocolHeader.Error()
{
  return &type metadata for UnixProtocolHeader.Error;
}

uint64_t TightbeamBadge.init(_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_BYTE *)a2 = HIBYTE(result);
  *(_BYTE *)(a2 + 1) = 0;
  *(_BYTE *)(a2 + 2) = BYTE6(result);
  *(_WORD *)(a2 + 4) = WORD2(result);
  *(_WORD *)(a2 + 6) = WORD1(result);
  *(_WORD *)(a2 + 8) = result;
  return result;
}

_BYTE *TightbeamBadge.init(usage:variant:component:client:metadata:)@<X0>(_BYTE *result@<X0>, __int16 a2@<W1>, __int16 a3@<W2>, __int16 a4@<W3>, int a5@<W4>, uint64_t a6@<X8>)
{
  char v6;
  char v7;
  __int16 v8;

  v6 = result[1];
  if ((a2 & 0x100) != 0)
    v7 = 0;
  else
    v7 = a2;
  *(_BYTE *)a6 = *result;
  *(_BYTE *)(a6 + 1) = v6;
  *(_BYTE *)(a6 + 2) = v7;
  if ((a5 & 0x10000) != 0)
    v8 = 0;
  else
    v8 = a5;
  *(_WORD *)(a6 + 4) = a3;
  *(_WORD *)(a6 + 6) = a4;
  *(_WORD *)(a6 + 8) = v8;
  return result;
}

void TightbeamBadge.usage.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;
  char v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
}

uint64_t TightbeamBadge.variant.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 2);
}

uint64_t TightbeamBadge.component.getter()
{
  uint64_t v0;

  return *(unsigned __int16 *)(v0 + 4);
}

uint64_t TightbeamBadge.client.getter()
{
  uint64_t v0;

  return *(unsigned __int16 *)(v0 + 6);
}

uint64_t TightbeamBadge.metadata.getter()
{
  uint64_t v0;

  return *(unsigned __int16 *)(v0 + 8);
}

uint64_t TightbeamBadge.Usage.init(_:)@<X0>(uint64_t result@<X0>, _BYTE *a2@<X8>)
{
  *a2 = result;
  a2[1] = 0;
  return result;
}

uint64_t __swift_memcpy10_2(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_WORD *)(result + 8) = *((_WORD *)a2 + 4);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for TightbeamBadge(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 10))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for TightbeamBadge(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_WORD *)(result + 8) = 0;
    *(_QWORD *)result = (a2 - 1);
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 10) = v3;
  return result;
}

ValueMetadata *type metadata accessor for TightbeamBadge()
{
  return &type metadata for TightbeamBadge;
}

_WORD *__swift_memcpy2_1(_WORD *result, _WORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for TightbeamBadge.Usage(uint64_t a1, int a2)
{
  unsigned int v2;
  unsigned int v3;
  uint64_t v4;

  if (!a2)
    return 0;
  v2 = a2 + 0xFFFF;
  if ((a2 + 0xFFFF) <= 0xFFFEFFFF)
    v3 = 2;
  else
    v3 = 4;
  if (v2 < 0xFF0000)
    v3 = 1;
  if (v2 >= 0x10000)
    v4 = v3;
  else
    v4 = 0;
  return ((uint64_t (*)(void))((char *)&loc_24899D4B0 + 4 * byte_2489A9A74[v4]))();
}

uint64_t sub_24899D4C8(unsigned __int16 *a1)
{
  uint64_t v1;

  v1 = a1[1];
  if (a1[1])
    return (*a1 | ((_DWORD)v1 << 16)) - 0xFFFF;
  return v1;
}

void sub_24899D4D4(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 2))
    JUMPOUT(0x24899D4DCLL);
  JUMPOUT(0x24899D4ECLL);
}

uint64_t storeEnumTagSinglePayload for TightbeamBadge.Usage(_WORD *a1, int a2, int a3)
{
  unsigned int v3;
  int v4;
  uint64_t v5;

  v3 = a3 + 0xFFFF;
  if ((a3 + 0xFFFF) <= 0xFFFEFFFF)
    v4 = 2;
  else
    v4 = 4;
  if (v3 < 0xFF0000)
    v4 = 1;
  if (v3 >= 0x10000)
    LODWORD(v5) = v4;
  else
    LODWORD(v5) = 0;
  if (a3)
    v5 = v5;
  else
    v5 = 0;
  if (!a2)
    return ((uint64_t (*)(void))((char *)sub_24899D578 + 4 * byte_2489A9A7E[v5]))();
  *a1 = a2 - 1;
  return ((uint64_t (*)(void))((char *)sub_24899D558 + 4 * byte_2489A9A79[v5]))();
}

uint64_t sub_24899D558(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 2) = v1;
  return result;
}

uint64_t sub_24899D578(uint64_t result)
{
  *(_BYTE *)(result + 2) = 0;
  return result;
}

uint64_t sub_24899D580(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 2) = v1;
  return result;
}

uint64_t sub_24899D588(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 2) = v1;
  return result;
}

uint64_t sub_24899D590(uint64_t result)
{
  *(_WORD *)(result + 2) = 0;
  return result;
}

uint64_t sub_24899D598(uint64_t result)
{
  *(_DWORD *)(result + 2) = 0;
  return result;
}

uint64_t sub_24899D5A4(unsigned __int8 *a1)
{
  if (a1[1])
    return (*a1 | (a1[1] << 8)) - 255;
  else
    return 0;
}

_BYTE *sub_24899D5C4(_BYTE *result, int a2)
{
  if (a2)
  {
    *result = a2 - 1;
    result[1] = ((unsigned __int16)(a2 - 1) >> 8) + 1;
  }
  else
  {
    result[1] = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for TightbeamBadge.Usage()
{
  return &type metadata for TightbeamBadge.Usage;
}

uint64_t TightbeamDecoder.init(message:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t TightbeamDecoder.decode(as:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  unsigned __int8 v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  v1 = *(_QWORD *)(*(_QWORD *)v0 + 24);
  if (v1)
  {
    tb_message_decode_BOOL(v1, &v3);
    return v3;
  }
  else
  {
    result = sub_2489A840C();
    __break(1u);
  }
  return result;
}

{
  return sub_24899D828((void (*)(uint64_t, unsigned __int8 *))tb_message_decode_u8);
}

{
  return sub_24899D948((void (*)(uint64_t, unsigned __int16 *))tb_message_decode_u16);
}

{
  return sub_24899DA68((void (*)(uint64_t, unsigned int *))tb_message_decode_u32);
}

{
  return sub_24899DB88((void (*)(uint64_t, _QWORD *))tb_message_decode_u64);
}

{
  return sub_24899D828((void (*)(uint64_t, unsigned __int8 *))tb_message_decode_s8);
}

{
  return sub_24899D948((void (*)(uint64_t, unsigned __int16 *))tb_message_decode_s16);
}

{
  return sub_24899DA68((void (*)(uint64_t, unsigned int *))tb_message_decode_s32);
}

{
  return sub_24899DB88((void (*)(uint64_t, _QWORD *))tb_message_decode_s64);
}

{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = *v0;
  v4 = 0;
  v2 = *(_QWORD *)(v1 + 24);
  if (v2)
  {
    swift_retain();
    tb_message_decode_f32(v2, &v4);
    return swift_release();
  }
  else
  {
    result = sub_2489A840C();
    __break(1u);
  }
  return result;
}

{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v1 = *v0;
  v4[0] = 0;
  v2 = *(_QWORD *)(v1 + 24);
  if (v2)
  {
    swift_retain();
    tb_message_decode_f64(v2, v4);
    return swift_release();
  }
  else
  {
    result = sub_2489A840C();
    __break(1u);
  }
  return result;
}

uint64_t sub_24899D828(void (*a1)(uint64_t, unsigned __int8 *))
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  unsigned __int8 v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = *v1;
  v6 = 0;
  v3 = *(_QWORD *)(v2 + 24);
  if (v3)
  {
    swift_retain();
    a1(v3, &v6);
    swift_release();
    return v6;
  }
  else
  {
    result = sub_2489A840C();
    __break(1u);
  }
  return result;
}

uint64_t sub_24899D948(void (*a1)(uint64_t, unsigned __int16 *))
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  unsigned __int16 v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = *v1;
  v6 = 0;
  v3 = *(_QWORD *)(v2 + 24);
  if (v3)
  {
    swift_retain();
    a1(v3, &v6);
    swift_release();
    return v6;
  }
  else
  {
    result = sub_2489A840C();
    __break(1u);
  }
  return result;
}

uint64_t sub_24899DA68(void (*a1)(uint64_t, unsigned int *))
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  unsigned int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = *v1;
  v6 = 0;
  v3 = *(_QWORD *)(v2 + 24);
  if (v3)
  {
    swift_retain();
    a1(v3, &v6);
    swift_release();
    return v6;
  }
  else
  {
    result = sub_2489A840C();
    __break(1u);
  }
  return result;
}

uint64_t sub_24899DB88(void (*a1)(uint64_t, _QWORD *))
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v2 = *v1;
  v6[0] = 0;
  v3 = *(_QWORD *)(v2 + 24);
  if (v3)
  {
    swift_retain();
    a1(v3, v6);
    swift_release();
    return v6[0];
  }
  else
  {
    result = sub_2489A840C();
    __break(1u);
  }
  return result;
}

uint64_t TightbeamDecoder.decode(as:)@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v5[0] = 0;
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 24);
  if (v3)
  {
    result = tb_message_decode_capability(v3, v5);
    *a1 = v5[0];
  }
  else
  {
    result = sub_2489A840C();
    __break(1u);
  }
  return result;
}

void TightbeamDecoder.decode(as:)()
{
  sub_2489A840C();
  __break(1u);
}

void TightbeamDecoder.encoder(bytes:capabilities:)(_QWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;

  v4 = *v1;
  sub_2489A3DD8();
  if (!v2)
  {
    *a1 = v4;
    swift_retain();
  }
}

uint64_t TightbeamCapabilityDecoder.init(table:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

Swift::UInt __swiftcall TightbeamCapabilityDecoder.capability(for:)(Swift::Int a1)
{
  uint64_t *v1;
  uint64_t v2;
  Swift::UInt result;

  v2 = *v1;
  if ((a1 & 0x8000000000000000) == 0 && v2 && v1[1] - *v1 > a1)
    return v2 + a1;
  sub_2489A83B8();
  sub_2489A825C();
  sub_24898D158();
  sub_2489A8394();
  sub_2489A825C();
  swift_bridgeObjectRelease();
  sub_2489A825C();
  sub_2489A8394();
  sub_2489A825C();
  swift_bridgeObjectRelease();
  sub_2489A825C();
  result = sub_2489A840C();
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for TightbeamDecoder()
{
  return &type metadata for TightbeamDecoder;
}

ValueMetadata *type metadata accessor for TightbeamCapabilityDecoder()
{
  return &type metadata for TightbeamCapabilityDecoder;
}

uint64_t sub_24899E0B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC9Tightbeam16UnixEndpointData_targetUrl;
  v2 = sub_2489A7F2C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t _tb_unix_client_transport_create_with_endpoint(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  void (*v7)(char *, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v10;

  v2 = sub_2489A7F2C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = tb_endpoint_get_data(a1) + OBJC_IVAR____TtC9Tightbeam16UnixEndpointData_targetUrl;
  v7 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  swift_retain();
  v7(v5, v6, v2);
  swift_release();
  type metadata accessor for UnixTransportClient(0);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + OBJC_IVAR____TtC9Tightbeam19UnixTransportClient_connection) = 0;
  *(_QWORD *)(v8 + OBJC_IVAR____TtC9Tightbeam19UnixTransportClient_pendingMessage) = 0;
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))(v8 + OBJC_IVAR____TtC9Tightbeam19UnixTransportClient_targetURL, v5, v2);
  return v8;
}

uint64_t type metadata accessor for UnixTransportClient(uint64_t a1)
{
  return sub_24899AA5C(a1, (uint64_t *)&unk_254460780);
}

uint64_t __tb_unix_client_transport_destruct(uint64_t a1)
{
  tb_transport_get_context(a1);
  return swift_release();
}

uint64_t _tb_unix_client_transport_activate(uint64_t a1)
{
  uint64_t context;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  context = tb_transport_get_context(a1);
  swift_retain();
  v2 = sub_2489A7F20();
  v4 = v3;
  type metadata accessor for UnixProtocolConnection();
  v5 = (_QWORD *)swift_allocObject();
  swift_retain();
  *(_QWORD *)(context + OBJC_IVAR____TtC9Tightbeam19UnixTransportClient_connection) = sub_24899E72C(v2, v4, context, 0, v5);
  swift_release();
  swift_release();
  return 0;
}

uint64_t sub_24899E2C0(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (**v8)(uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _BYTE *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  _QWORD v29[2];
  _QWORD v30[5];
  uint64_t v31;

  v3 = v1;
  v5 = sub_2489A8034();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (uint64_t (**)(uint64_t))((char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = *(_QWORD *)(v3 + OBJC_IVAR____TtC9Tightbeam19UnixTransportClient_connection);
  if (!v9)
  {
    v11 = 0;
    goto LABEL_5;
  }
  v10 = OBJC_IVAR____TtC9Tightbeam19UnixTransportClient_pendingMessage;
  if (*(_QWORD *)(v3 + OBJC_IVAR____TtC9Tightbeam19UnixTransportClient_pendingMessage))
  {
    v11 = 1;
LABEL_5:
    sub_24899F214();
    swift_allocError();
    *v12 = v11;
    swift_willThrow();
    return v11;
  }
  type metadata accessor for PendingMessage();
  swift_allocObject();
  swift_retain();
  v13 = sub_2489954C0(a1);
  v14 = *(_QWORD *)(*(_QWORD *)(v13 + 24) + 32);
  if (v14 && *(unsigned __int8 *)(v14 + 40) < 2u && (v15 = *(uint64_t **)(v14 + 16), v16 = v15[2], v15[3] >= v16))
  {
    v27 = v2;
    v28 = v13;
    v31 = v10;
    if ((v16 & 0x8000000000000000) == 0)
    {
      v17 = *v15;
      v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577A3C78);
      v30[3] = v18;
      v30[4] = sub_24899AE60((unint64_t *)&qword_2577A3C80, &qword_2577A3C78, MEMORY[0x24BDCF860]);
      v30[0] = v17;
      v30[1] = v16;
      v19 = __swift_project_boxed_opaque_existential_1(v30, v18);
      if (*v19)
        v20 = (_BYTE *)(*v19 + v19[1]);
      else
        v20 = 0;
      sub_2489A2E30((_BYTE *)*v19, v20, v29);
      v25 = v29[0];
      v27 = v29[1];
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
      v26 = *(_QWORD *)(v9 + 56);
      *v8 = sub_24899F258;
      v8[1] = (uint64_t (*)(uint64_t))v9;
      (*(void (**)(uint64_t (**)(uint64_t), _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x24BDE01C8], v5);
      sub_2489A8028();
      swift_retain();
      sub_2489A801C();
      v21 = v27;
      sub_2489A8058();
      swift_release();
      (*(void (**)(uint64_t (**)(uint64_t), uint64_t))(v6 + 8))(v8, v5);
      sub_24898E6E0(v25, v21);
      v22 = v31;
      *(_QWORD *)(v3 + v31) = v28;
      swift_retain();
      swift_release();
      sub_2489A8340();
      *(_QWORD *)(v3 + v22) = 0;
      swift_release();
      swift_retain();
      v11 = sub_2489A400C();
      swift_release();
      swift_release();
      swift_release();
      return v11;
    }
  }
  else
  {
    sub_2489A840C();
    __break(1u);
  }
  result = sub_2489A8448();
  __break(1u);
  return result;
}

uint64_t sub_24899E690()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC9Tightbeam19UnixTransportClient_targetURL;
  v2 = sub_2489A7F2C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_24899E704(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24899ECEC(a2, a3);
}

uint64_t sub_24899E72C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t result;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(_QWORD *, _QWORD);
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[4];
  _QWORD v44[6];

  v41 = sub_2489A831C();
  v39 = *(_QWORD *)(v41 - 8);
  MEMORY[0x24BDAC7A8](v41);
  v40 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = sub_2489A8310();
  MEMORY[0x24BDAC7A8](v37);
  v38 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_2489A81B4();
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_2489A7FC8();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v31 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v21 = (uint64_t *)((char *)&v31 - v20);
  v44[3] = type metadata accessor for UnixTransportClient(0);
  v44[4] = &off_2519B1C30;
  v44[0] = a3;
  sub_24898E4D0((uint64_t)v44, (uint64_t)(a5 + 2));
  a5[8] = a1;
  a5[9] = a2;
  v42 = a4;
  if (a4)
  {
    a5[7] = a4;
  }
  else
  {
    v35 = a1;
    v36 = v14;
    sub_2489A80F4();
    swift_bridgeObjectRetain();
    v22 = sub_2489A80E8();
    if (qword_2577A3A40 != -1)
      swift_once();
    sub_2489A8148();
    swift_allocObject();
    swift_retain();
    v23 = sub_2489A813C();
    sub_2489A80D0();
    v34 = v22;
    swift_retain();
    v33 = (void (*)(_QWORD *, _QWORD))sub_2489A80C4();
    v25 = *v24;
    if ((unint64_t)*v24 >> 62)
    {
      v30 = v25 & 0xFFFFFFFFFFFFFF8;
      if (v25 < 0)
        v30 = *v24;
      v32 = v30;
      swift_bridgeObjectRetain();
      v32 = sub_2489A8418();
      result = swift_bridgeObjectRelease();
      if (v32 < 0)
      {
        __break(1u);
        return result;
      }
    }
    sub_24898DC94(0, 0, v23);
    v33(v43, 0);
    swift_release();
    *v21 = v35;
    v21[1] = a2;
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(v16 + 104))(v21, *MEMORY[0x24BDDFF38], v15);
    (*(void (**)(char *, _QWORD *, uint64_t))(v16 + 16))(v19, v21, v15);
    sub_2489A80B8();
    swift_allocObject();
    v26 = sub_2489A804C();
    swift_release();
    (*(void (**)(_QWORD *, uint64_t))(v16 + 8))(v21, v15);
    a5[7] = v26;
  }
  swift_retain();
  swift_retain();
  swift_retain();
  sub_24898E518((uint64_t)sub_24899F260);
  sub_2489A8040();
  swift_release();
  swift_release();
  sub_24898E528();
  sub_2489A80AC();
  sub_2489A7FA4();
  (*(void (**)(_QWORD *, uint64_t))(v16 + 8))(v21, v15);
  sub_2489A81A8();
  v43[0] = MEMORY[0x24BEE4AF8];
  sub_24898E564();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577A3B48);
  sub_24899AE60((unint64_t *)&qword_2577A3B50, &qword_2577A3B48, MEMORY[0x24BEE12C8]);
  sub_2489A83A0();
  (*(void (**)(char *, _QWORD, uint64_t))(v39 + 104))(v40, *MEMORY[0x24BEE5750], v41);
  v27 = (void *)sub_2489A8334();
  swift_retain();
  sub_2489A807C();
  swift_release();
  if (qword_2577A3A20 != -1)
    swift_once();
  swift_beginAccess();
  v28 = v27;
  MEMORY[0x2495A0A64]();
  if (*(_QWORD *)((qword_2577A3B20 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((qword_2577A3B20 & 0xFFFFFFFFFFFFFF8)
                                                                                + 0x18) >> 1)
    sub_2489A82D4();
  sub_2489A82EC();
  sub_2489A82C8();
  swift_endAccess();

  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v44);
  return (uint64_t)a5;
}

uint64_t sub_24899EC50()
{
  sub_2489A83B8();
  sub_2489A825C();
  sub_2489A8190();
  sub_2489A83F4();
  sub_24898D580();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24899ECEC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(v2 + OBJC_IVAR____TtC9Tightbeam19UnixTransportClient_pendingMessage);
  if (v3)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(v3 + 24) + 32);
    if (v4 && *(unsigned __int8 *)(v4 + 40) < 2u)
      __asm { BR              X9 }
    sub_2489A840C();
    __break(1u);
    JUMPOUT(0x24899EFFCLL);
  }
  sub_2489A83B8();
  swift_bridgeObjectRelease();
  sub_2489A7F38();
  sub_2489A825C();
  swift_bridgeObjectRelease();
  sub_24898D580();
  return swift_bridgeObjectRelease();
}

uint64_t _tb_unix_client_transport_send_message_0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  tb_transport_get_context(a1);
  swift_retain();
  v5 = sub_24899E2C0(a2);
  swift_release();
  if (a3)
    *a3 = v5;
  return 0;
}

uint64_t sub_24899F0EC()
{
  return type metadata accessor for UnixEndpointData(0);
}

uint64_t type metadata accessor for UnixEndpointData(uint64_t a1)
{
  return sub_24899AA5C(a1, (uint64_t *)&unk_254460748);
}

uint64_t sub_24899F108()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2489A7F2C();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t type metadata accessor for PendingMessage()
{
  return objc_opt_self();
}

uint64_t sub_24899F194()
{
  return type metadata accessor for UnixTransportClient(0);
}

uint64_t sub_24899F19C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2489A7F2C();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

unint64_t sub_24899F214()
{
  unint64_t result;

  result = qword_2577A3D00;
  if (!qword_2577A3D00)
  {
    result = MEMORY[0x2495A1154](&unk_2489A9C00, &type metadata for UnixTransportClient.Error);
    atomic_store(result, (unint64_t *)&qword_2577A3D00);
  }
  return result;
}

uint64_t sub_24899F258(uint64_t a1)
{
  return sub_24898D9D0(a1);
}

uint64_t sub_24899F260(uint64_t a1)
{
  return sub_24898D650(a1);
}

uint64_t storeEnumTagSinglePayload for UnixTransportClient.Error(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_24899F2B4 + 4 * byte_2489A9B05[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_24899F2E8 + 4 * asc_2489A9B00[v4]))();
}

uint64_t sub_24899F2E8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24899F2F0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24899F2F8);
  return result;
}

uint64_t sub_24899F304(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24899F30CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_24899F310(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24899F318(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for UnixTransportClient.Error()
{
  return &type metadata for UnixTransportClient.Error;
}

unint64_t sub_24899F338()
{
  unint64_t result;

  result = qword_2577A3D08;
  if (!qword_2577A3D08)
  {
    result = MEMORY[0x2495A1154](&unk_2489A9BD8, &type metadata for UnixTransportClient.Error);
    atomic_store(result, (unint64_t *)&qword_2577A3D08);
  }
  return result;
}

Swift::Void __swiftcall TightbeamEncoder.encode(_:)(Swift::Bool a1)
{
  uint64_t v1;

  if (*(_QWORD *)(*(_QWORD *)v1 + 24))
  {
    tb_message_encode_BOOL(*(_QWORD *)(*(_QWORD *)v1 + 24), a1);
  }
  else
  {
    sub_2489A840C();
    __break(1u);
  }
}

Swift::Void __swiftcall TightbeamEncoder.encode(_:)(Swift::UInt8 a1)
{
  uint64_t v1;

  if (*(_QWORD *)(*(_QWORD *)v1 + 24))
  {
    tb_message_encode_u8(*(_QWORD *)(*(_QWORD *)v1 + 24), a1);
  }
  else
  {
    sub_2489A840C();
    __break(1u);
  }
}

Swift::Void __swiftcall TightbeamEncoder.encode(_:)(Swift::UInt16 a1)
{
  uint64_t v1;

  if (*(_QWORD *)(*(_QWORD *)v1 + 24))
  {
    tb_message_encode_u16(*(_QWORD *)(*(_QWORD *)v1 + 24), a1);
  }
  else
  {
    sub_2489A840C();
    __break(1u);
  }
}

Swift::Void __swiftcall TightbeamEncoder.encode(_:)(Swift::UInt32 a1)
{
  sub_24899F5F8(*(uint64_t *)&a1, (uint64_t (*)(uint64_t, uint64_t))tb_message_encode_u32);
}

Swift::Void __swiftcall TightbeamEncoder.encode(_:)(Swift::UInt64 a1)
{
  sub_24899F5F8(a1, tb_message_encode_u64);
}

Swift::Void __swiftcall TightbeamEncoder.encode(_:)(Swift::Int8 a1)
{
  uint64_t v1;

  if (*(_QWORD *)(*(_QWORD *)v1 + 24))
  {
    tb_message_encode_s8(*(_QWORD *)(*(_QWORD *)v1 + 24), a1);
  }
  else
  {
    sub_2489A840C();
    __break(1u);
  }
}

Swift::Void __swiftcall TightbeamEncoder.encode(_:)(Swift::Int16 a1)
{
  uint64_t v1;

  if (*(_QWORD *)(*(_QWORD *)v1 + 24))
  {
    tb_message_encode_s16(*(_QWORD *)(*(_QWORD *)v1 + 24), a1);
  }
  else
  {
    sub_2489A840C();
    __break(1u);
  }
}

Swift::Void __swiftcall TightbeamEncoder.encode(_:)(Swift::Int32 a1)
{
  sub_24899F5F8(*(uint64_t *)&a1, (uint64_t (*)(uint64_t, uint64_t))tb_message_encode_s32);
}

uint64_t sub_24899F5F8(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v2;
  uint64_t v5;
  uint64_t result;

  v5 = *(_QWORD *)(*(_QWORD *)v2 + 24);
  if (v5)
    return a2(v5, a1);
  result = sub_2489A840C();
  __break(1u);
  return result;
}

Swift::Void __swiftcall TightbeamEncoder.encode(_:)(Swift::Int64 a1)
{
  sub_24899F5F8(a1, tb_message_encode_s64);
}

Swift::Void __swiftcall TightbeamEncoder.encode(_:)(Swift::Float a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 24);
  if (v2)
  {
    tb_message_encode_f32(v2, a1);
  }
  else
  {
    sub_2489A840C();
    __break(1u);
  }
}

Swift::Void __swiftcall TightbeamEncoder.encode(_:)(Swift::Double a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 24);
  if (v2)
  {
    tb_message_encode_f64(v2, a1);
  }
  else
  {
    sub_2489A840C();
    __break(1u);
  }
}

uint64_t TightbeamEncoder.encode(_:)(uint64_t *a1)
{
  uint64_t v1;
  uint64_t result;

  if (*(_QWORD *)(*(_QWORD *)v1 + 24))
    return tb_message_encode_capability(*(_QWORD *)(*(_QWORD *)v1 + 24), *a1);
  result = sub_2489A840C();
  __break(1u);
  return result;
}

void *TightbeamEncoder.encode(_:)(const void *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  void *result;

  if (a1)
  {
    v4 = *(_QWORD *)(*(_QWORD *)v2 + 24);
    if (v4)
      return tb_message_encode_buffer(v4, a1, a2 - (_QWORD)a1);
  }
  result = (void *)sub_2489A840C();
  __break(1u);
  return result;
}

uint64_t TightbeamEncoder.complete()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 24);
  if (v1)
  {
    tb_message_complete(v1);
    return swift_retain();
  }
  else
  {
    result = sub_2489A840C();
    __break(1u);
  }
  return result;
}

uint64_t sub_24899F918(char a1)
{
  uint64_t v1;
  uint64_t result;

  if (*(_QWORD *)(*(_QWORD *)v1 + 24))
    return tb_message_encode_BOOL(*(_QWORD *)(*(_QWORD *)v1 + 24), a1 & 1);
  result = sub_2489A840C();
  __break(1u);
  return result;
}

uint64_t sub_24899F990(char a1)
{
  uint64_t v1;
  uint64_t result;

  if (*(_QWORD *)(*(_QWORD *)v1 + 24))
    return tb_message_encode_u8(*(_QWORD *)(*(_QWORD *)v1 + 24), a1);
  result = sub_2489A840C();
  __break(1u);
  return result;
}

uint64_t sub_24899FA08(__int16 a1)
{
  uint64_t v1;
  uint64_t result;

  if (*(_QWORD *)(*(_QWORD *)v1 + 24))
    return tb_message_encode_u16(*(_QWORD *)(*(_QWORD *)v1 + 24), a1);
  result = sub_2489A840C();
  __break(1u);
  return result;
}

uint64_t sub_24899FA80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24899FB94(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t))tb_message_encode_u32);
}

uint64_t sub_24899FA8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24899FB94(a1, a2, a3, tb_message_encode_u64);
}

uint64_t sub_24899FA98(char a1)
{
  uint64_t v1;
  uint64_t result;

  if (*(_QWORD *)(*(_QWORD *)v1 + 24))
    return tb_message_encode_s8(*(_QWORD *)(*(_QWORD *)v1 + 24), a1);
  result = sub_2489A840C();
  __break(1u);
  return result;
}

uint64_t sub_24899FB10(__int16 a1)
{
  uint64_t v1;
  uint64_t result;

  if (*(_QWORD *)(*(_QWORD *)v1 + 24))
    return tb_message_encode_s16(*(_QWORD *)(*(_QWORD *)v1 + 24), a1);
  result = sub_2489A840C();
  __break(1u);
  return result;
}

uint64_t sub_24899FB88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24899FB94(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t))tb_message_encode_s32);
}

uint64_t sub_24899FB94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v4;
  uint64_t v6;
  uint64_t result;

  v6 = *(_QWORD *)(*(_QWORD *)v4 + 24);
  if (v6)
    return a4(v6, a1);
  result = sub_2489A840C();
  __break(1u);
  return result;
}

uint64_t sub_24899FC08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24899FB94(a1, a2, a3, tb_message_encode_s64);
}

uint64_t sub_24899FC14(float a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 24);
  if (v2)
    return tb_message_encode_f32(v2, a1);
  result = sub_2489A840C();
  __break(1u);
  return result;
}

uint64_t sub_24899FC84(double a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 24);
  if (v2)
    return tb_message_encode_f64(v2, a1);
  result = sub_2489A840C();
  __break(1u);
  return result;
}

uint64_t TightbeamSizingEncoder.size.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

Tightbeam::TightbeamSizingEncoder __swiftcall TightbeamSizingEncoder.init()()
{
  _QWORD *v0;
  Tightbeam::TightbeamSizingEncoder result;

  *v0 = 0;
  return result;
}

Swift::Void __swiftcall TightbeamSizingEncoder.encode(_:)(Swift::Bool a1)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = tb_message_size_BOOL();
  if (__OFADD__(*v1, v2))
    __break(1u);
  else
    *v1 += v2;
}

Swift::Void __swiftcall TightbeamSizingEncoder.encode(_:)(Swift::UInt8 a1)
{
  sub_24899FD68(a1, tb_message_size_u8);
}

Swift::Void __swiftcall TightbeamSizingEncoder.encode(_:)(Swift::UInt16 a1)
{
  sub_24899FD68(a1, tb_message_size_u16);
}

Swift::Void __swiftcall TightbeamSizingEncoder.encode(_:)(Swift::UInt32 a1)
{
  sub_24899FD68(*(uint64_t *)&a1, tb_message_size_u32);
}

Swift::Void __swiftcall TightbeamSizingEncoder.encode(_:)(Swift::UInt64 a1)
{
  sub_24899FD68(a1, tb_message_size_u64);
}

Swift::Void __swiftcall TightbeamSizingEncoder.encode(_:)(Swift::Int8 a1)
{
  sub_24899FD68(a1, tb_message_size_s8);
}

uint64_t sub_24899FD68(uint64_t a1, uint64_t (*a2)(void))
{
  _QWORD *v2;
  uint64_t result;

  result = a2();
  if (__OFADD__(*v2, result))
    __break(1u);
  else
    *v2 += result;
  return result;
}

Swift::Void __swiftcall TightbeamSizingEncoder.encode(_:)(Swift::Int16 a1)
{
  sub_24899FD68(a1, tb_message_size_s16);
}

Swift::Void __swiftcall TightbeamSizingEncoder.encode(_:)(Swift::Int32 a1)
{
  sub_24899FD68(*(uint64_t *)&a1, tb_message_size_s32);
}

Swift::Void __swiftcall TightbeamSizingEncoder.encode(_:)(Swift::Int64 a1)
{
  sub_24899FD68(a1, tb_message_size_s64);
}

Swift::Void __swiftcall TightbeamSizingEncoder.encode(_:)(Swift::Float a1)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = tb_message_size_f32();
  if (__OFADD__(*v1, v2))
    __break(1u);
  else
    *v1 += v2;
}

Swift::Void __swiftcall TightbeamSizingEncoder.encode(_:)(Swift::Double a1)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = tb_message_size_f64();
  if (__OFADD__(*v1, v2))
    __break(1u);
  else
    *v1 += v2;
}

uint64_t TightbeamSizingEncoder.encode(_:)()
{
  _QWORD *v0;
  uint64_t result;

  result = tb_message_size_capability();
  if (__OFADD__(*v0, result))
    __break(1u);
  else
    *v0 += result;
  return result;
}

uint64_t sub_24899FE2C()
{
  _QWORD *v0;
  uint64_t result;

  result = tb_message_size_BOOL();
  if (__OFADD__(*v0, result))
    __break(1u);
  else
    *v0 += result;
  return result;
}

uint64_t sub_24899FE54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24899FE90(a1, a2, a3, tb_message_size_u8);
}

uint64_t sub_24899FE60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24899FE90(a1, a2, a3, tb_message_size_u16);
}

uint64_t sub_24899FE6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24899FE90(a1, a2, a3, tb_message_size_u32);
}

uint64_t sub_24899FE78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24899FE90(a1, a2, a3, tb_message_size_u64);
}

uint64_t sub_24899FE84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24899FE90(a1, a2, a3, tb_message_size_s8);
}

uint64_t sub_24899FE90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  _QWORD *v4;
  uint64_t result;

  result = a4();
  if (__OFADD__(*v4, result))
    __break(1u);
  else
    *v4 += result;
  return result;
}

uint64_t sub_24899FEB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24899FE90(a1, a2, a3, tb_message_size_s16);
}

uint64_t sub_24899FEC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24899FE90(a1, a2, a3, tb_message_size_s32);
}

uint64_t sub_24899FED0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24899FE90(a1, a2, a3, tb_message_size_s64);
}

uint64_t sub_24899FEDC()
{
  _QWORD *v0;
  uint64_t result;

  result = tb_message_size_f32();
  if (__OFADD__(*v0, result))
    __break(1u);
  else
    *v0 += result;
  return result;
}

uint64_t sub_24899FF04()
{
  _QWORD *v0;
  uint64_t result;

  result = tb_message_size_f64();
  if (__OFADD__(*v0, result))
    __break(1u);
  else
    *v0 += result;
  return result;
}

uint64_t dispatch thunk of TightbeamEncoderProtocol.encode(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t dispatch thunk of TightbeamEncoderProtocol.encode(_:)(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

{
  return (*(uint64_t (**)(void))(a2 + 88))();
}

ValueMetadata *type metadata accessor for TightbeamEncoder()
{
  return &type metadata for TightbeamEncoder;
}

ValueMetadata *type metadata accessor for TightbeamSizingEncoder()
{
  return &type metadata for TightbeamSizingEncoder;
}

void TightbeamEndpoint.constructEndpoint()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  v1 = sub_2489A7F2C();
  v2 = MEMORY[0x24BDAC7A8](v1);
  MEMORY[0x24BDAC7A8](v2);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577A3C58);
  v4 = MEMORY[0x24BDAC7A8](v3);
  MEMORY[0x24BDAC7A8](v4);
  v5 = type metadata accessor for TightbeamEndpoint();
  MEMORY[0x24BDAC7A8](v5);
  sub_2489A0A20(v0, (uint64_t)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = (char *)&loc_2489A00C8 + *((int *)qword_2489A09B0 + swift_getEnumCaseMultiPayload());
  __asm { BR              X10 }
}

_DWORD *sub_2489A00D8()
{
  uint64_t *v0;
  uint64_t v1;
  int v2;
  int v3;
  int v4;

  v1 = *v0;
  sub_2489A0A64();
  v3 = v2;
  v4 = sub_2489A0BA0();
  return tb_endpoint_create_with_value(v3, v1, v4);
}

uint64_t type metadata accessor for TightbeamEndpoint()
{
  uint64_t result;

  result = qword_2577A3D18;
  if (!qword_2577A3D18)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2489A0A20(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TightbeamEndpoint();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_2489A0A64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;

  v1 = type metadata accessor for TightbeamEndpoint();
  MEMORY[0x24BDAC7A8](v1);
  sub_2489A0A20(v0, (uint64_t)&v4 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  v3 = (char *)sub_2489A0AE8 + 4 * byte_2489A9CD0[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_2489A0AE8()
{
  return 3;
}

uint64_t sub_2489A0BA0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  int EnumCaseMultiPayload;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = type metadata accessor for TightbeamEndpoint();
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2489A0A20(v0, (uint64_t)v3);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  result = 2;
  switch(EnumCaseMultiPayload)
  {
    case 0:
      swift_bridgeObjectRelease();
      goto LABEL_7;
    case 1:
      return result;
    case 2:
      return 3;
    case 6:
      v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577A3D10);
      sub_2489982A8((uint64_t)&v3[*(int *)(v6 + 48)]);
      goto LABEL_7;
    case 7:
      v7 = sub_2489A7F2C();
      (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v3, v7);
LABEL_7:
      result = 1;
      break;
    default:
      sub_24899C15C((uint64_t)v3);
      result = 0;
      break;
  }
  return result;
}

size_t sub_2489A0CA0(char **a1, char *__src, int64_t a3, char *__dst, int64_t a5)
{
  char *v6;
  size_t v8;
  char *v9;
  size_t result;

  v6 = __src;
  if (!a3 || !a5)
  {
    v8 = 0;
    v9 = &__src[a3];
    if (!__src)
      v9 = 0;
    goto LABEL_12;
  }
  if (a3 >= a5)
    v8 = a5;
  else
    v8 = a3;
  if ((v8 & 0x8000000000000000) == 0 && (&__dst[v8] <= __src || &__src[v8] <= __dst))
  {
    memcpy(__dst, __src, v8);
    v9 = &v6[a3];
    v6 += v8;
LABEL_12:
    *a1 = v6;
    a1[1] = v9;
    return v8;
  }
  result = sub_2489A8448();
  __break(1u);
  return result;
}

uint64_t sub_2489A0DC0(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t sub_2489A0DFC()
{
  return swift_deallocObject();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_2489A0E28()
{
  return swift_deallocObject();
}

uint64_t sub_2489A0E38()
{
  return swift_deallocObject();
}

uint64_t sub_2489A0E48()
{
  return swift_deallocObject();
}

uint64_t sub_2489A0E58(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577A3C58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2489A0EA0()
{
  return swift_deallocObject();
}

uint64_t sub_2489A0EB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577A3C58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2489A0EF8()
{
  return swift_deallocObject();
}

uint64_t sub_2489A0F08()
{
  return swift_release();
}

uint64_t sub_2489A0F10()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = sub_2489A82B0();
  v4 = sub_2489A1AF4(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_2489A0F8C()
{
  return swift_deallocObject();
}

uint64_t sub_2489A0F9C()
{
  uint64_t v0;
  uint64_t result;

  result = *(_QWORD *)(v0 + 16);
  if (result)
    JUMPOUT(0x2495A11FCLL);
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for TightbeamEndpoint(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v8 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        v7 = a2[1];
        *a1 = *a2;
        a1[1] = v7;
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 6u:
        *a1 = *a2;
        v10 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2577A3D10) + 48);
        v11 = (char *)a1 + v10;
        v12 = (char *)a2 + v10;
        v13 = sub_2489A7F2C();
        v14 = *(_QWORD *)(v13 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
        {
          v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577A3C58);
          memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v11, v12, v13);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
        }
        swift_storeEnumTagMultiPayload();
        break;
      case 7u:
      case 8u:
        v16 = sub_2489A7F2C();
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(a1, a2, v16);
        swift_storeEnumTagMultiPayload();
        break;
      case 9u:
        v17 = a2[1];
        *a1 = *a2;
        a1[1] = v17;
        swift_retain();
        swift_storeEnumTagMultiPayload();
        break;
      case 0xAu:
        *a1 = *a2;
        v18 = a2[3];
        *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 1);
        a1[3] = v18;
        swift_retain();
        swift_retain();
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(v5 + 64));
        break;
    }
  }
  return a1;
}

uint64_t destroy for TightbeamEndpoint(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
      result = swift_bridgeObjectRelease();
      break;
    case 6:
      v6 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2577A3D10) + 48);
      v7 = sub_2489A7F2C();
      v8 = *(_QWORD *)(v7 - 8);
      result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7);
      if (!(_DWORD)result)
      {
        v4 = *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8);
        v5 = v6;
        v3 = v7;
        goto LABEL_3;
      }
      break;
    case 7:
    case 8:
      v3 = sub_2489A7F2C();
      v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8);
      v5 = a1;
LABEL_3:
      result = v4(v5, v3);
      break;
    case 9:
      goto LABEL_8;
    case 10:
      swift_release();
LABEL_8:
      result = swift_release();
      break;
    default:
      return result;
  }
  return result;
}

_QWORD *initializeWithCopy for TightbeamEndpoint(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      v6 = a2[1];
      *a1 = *a2;
      a1[1] = v6;
      swift_bridgeObjectRetain();
      goto LABEL_10;
    case 6u:
      *a1 = *a2;
      v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2577A3D10) + 48);
      v8 = (char *)a1 + v7;
      v9 = (char *)a2 + v7;
      v10 = sub_2489A7F2C();
      v11 = *(_QWORD *)(v10 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
      {
        v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577A3C58);
        memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      }
      goto LABEL_10;
    case 7u:
    case 8u:
      v13 = sub_2489A7F2C();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(a1, a2, v13);
      goto LABEL_10;
    case 9u:
      v14 = a2[1];
      *a1 = *a2;
      a1[1] = v14;
      swift_retain();
      goto LABEL_10;
    case 0xAu:
      *a1 = *a2;
      v15 = a2[3];
      *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 1);
      a1[3] = v15;
      swift_retain();
      swift_retain();
LABEL_10:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

_QWORD *assignWithCopy for TightbeamEndpoint(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if (a1 != a2)
  {
    sub_24899C15C((uint64_t)a1);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        *a1 = *a2;
        a1[1] = a2[1];
        swift_bridgeObjectRetain();
        goto LABEL_11;
      case 6u:
        *a1 = *a2;
        v6 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2577A3D10) + 48);
        v7 = (char *)a1 + v6;
        v8 = (char *)a2 + v6;
        v9 = sub_2489A7F2C();
        v10 = *(_QWORD *)(v9 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
        {
          v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577A3C58);
          memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
        }
        goto LABEL_11;
      case 7u:
      case 8u:
        v12 = sub_2489A7F2C();
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(a1, a2, v12);
        goto LABEL_11;
      case 9u:
        v13 = a2[1];
        *a1 = *a2;
        a1[1] = v13;
        swift_retain();
        goto LABEL_11;
      case 0xAu:
        v14 = a2[1];
        *a1 = *a2;
        a1[1] = v14;
        v15 = a2[2];
        v16 = a2[3];
        a1[2] = v15;
        a1[3] = v16;
        swift_retain();
        swift_retain();
LABEL_11:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
        break;
    }
  }
  return a1;
}

_QWORD *initializeWithTake for TightbeamEndpoint(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 8 || EnumCaseMultiPayload == 7)
  {
    v13 = sub_2489A7F2C();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(a1, a2, v13);
LABEL_10:
    swift_storeEnumTagMultiPayload();
    return a1;
  }
  if (EnumCaseMultiPayload == 6)
  {
    *a1 = *a2;
    v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2577A3D10) + 48);
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = sub_2489A7F2C();
    v11 = *(_QWORD *)(v10 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
    {
      v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577A3C58);
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
    }
    goto LABEL_10;
  }
  memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  return a1;
}

_QWORD *assignWithTake for TightbeamEndpoint(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (a1 != a2)
  {
    sub_24899C15C((uint64_t)a1);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 8 || EnumCaseMultiPayload == 7)
    {
      v13 = sub_2489A7F2C();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(a1, a2, v13);
LABEL_11:
      swift_storeEnumTagMultiPayload();
      return a1;
    }
    if (EnumCaseMultiPayload == 6)
    {
      *a1 = *a2;
      v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2577A3D10) + 48);
      v8 = (char *)a1 + v7;
      v9 = (char *)a2 + v7;
      v10 = sub_2489A7F2C();
      v11 = *(_QWORD *)(v10 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
      {
        v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577A3C58);
        memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      }
      goto LABEL_11;
    }
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for TightbeamEndpoint(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for TightbeamEndpoint(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_2489A1A00()
{
  return swift_storeEnumTagMultiPayload();
}

void sub_2489A1A10()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[11];
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v4[4] = &unk_2489A9D38;
  v4[5] = MEMORY[0x24BEE0170] + 64;
  v4[6] = MEMORY[0x24BEE0170] + 64;
  v4[7] = MEMORY[0x24BEE0170] + 64;
  v0 = MEMORY[0x24BEE0178];
  v4[8] = MEMORY[0x24BEE0178] + 64;
  v4[9] = MEMORY[0x24BEE0178] + 64;
  sub_24899A9CC();
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout2();
    v4[10] = v4;
    v2 = sub_2489A7F2C();
    if (v3 <= 0x3F)
    {
      v5 = *(_QWORD *)(v2 - 8) + 64;
      v6 = v5;
      v7 = MEMORY[0x24BEE4AF0] + 64;
      v8 = &unk_2489A9D50;
      v9 = v0 + 64;
      swift_initEnumMetadataMultiPayload();
    }
  }
}

uint64_t sub_2489A1AF4(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v14[3];

  if ((a4 & 0x1000000000000000) != 0)
  {
    v9 = sub_2489A1C38(a1, a2, a3, a4);
    if (v9)
    {
      v10 = v9;
      v11 = sub_2489982E8(v9, 0);
      v12 = sub_2489A1D24((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
        goto LABEL_9;
      }
    }
    else
    {
      v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    v13 = MEMORY[0x2495A09EC](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
LABEL_12:
        JUMPOUT(0x2495A09ECLL);
LABEL_9:
      sub_2489A83E8();
      goto LABEL_12;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x2495A09EC]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_2489A1C38(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v7 = result;
  v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0)
    LOBYTE(v8) = 1;
  v9 = 4 << v8;
  if ((result & 0xC) == 4 << v8)
  {
    result = sub_24899834C(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_24899834C(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000) == 0)
      return (a2 >> 16) - (v7 >> 16);
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }
  v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0)
    v10 = a3 & 0xFFFFFFFFFFFFLL;
  if (v10 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v10 >= a2 >> 16)
  {
    return sub_2489A828C();
  }
  __break(1u);
  return result;
}

unint64_t sub_2489A1D24(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v26;
  unint64_t v27;
  _QWORD v28[2];

  v9 = (_QWORD *)result;
  if (!a2)
    goto LABEL_5;
  if (!a3)
  {
    v12 = a4;
    v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0)
    goto LABEL_36;
  v10 = a5 >> 14;
  v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    v11 = 0;
    v12 = a4;
LABEL_33:
    *v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  v11 = 0;
  v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0)
    LOBYTE(v14) = 1;
  v15 = 4 << v14;
  v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0)
    v16 = a6 & 0xFFFFFFFFFFFFLL;
  v23 = v16;
  v26 = a3 - 1;
  v12 = a4;
  while (1)
  {
    v17 = v12 & 0xC;
    result = v12;
    if (v17 == v15)
      result = sub_24899834C(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = sub_2489A8298();
      v19 = result;
      if (v17 != v15)
        goto LABEL_23;
    }
    else
    {
      v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        v19 = *((_BYTE *)v28 + v18);
        if (v17 != v15)
          goto LABEL_23;
      }
      else
      {
        result = v21;
        if ((a6 & 0x1000000000000000) == 0)
          result = sub_2489A83E8();
        v19 = *(_BYTE *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0)
            goto LABEL_24;
          goto LABEL_27;
        }
      }
    }
    result = sub_24899834C(v12, a6, a7);
    v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16)
      goto LABEL_35;
    v12 = sub_2489A8274();
LABEL_29:
    *(_BYTE *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14)
      goto LABEL_33;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_2489A1F68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t result;
  _BYTE v10[10];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577A3D28);
  result = MEMORY[0x24BDAC7A8](v8);
  v11[0] = a1;
  v11[1] = a2;
  if (a3)
  {
    MEMORY[0x24BDAC7A8](result);
    *(_QWORD *)&v10[-32] = v11;
    *(_QWORD *)&v10[-24] = a3;
    *(_QWORD *)&v10[-16] = a4;
    *(_QWORD *)&v10[-8] = a3;
    __asm { BR              X10 }
  }
  return result;
}

void *sub_2489A22B8(void *__src, uint64_t a2, void *__dst)
{
  if (__dst && __src)
  {
    if (a2 - (uint64_t)__src < 0)
    {
      __src = (void *)sub_2489A8448();
      __break(1u);
    }
    else
    {
      return memmove(__dst, __src, a2 - (_QWORD)__src);
    }
  }
  return __src;
}

uint64_t sub_2489A234C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  if (*(unsigned __int8 *)(v3 + 40) >= 2u)
    goto LABEL_8;
  v5 = *(_QWORD **)(v3 + 16);
  v6 = v5[2];
  if (__OFADD__(v6, a3))
  {
    __break(1u);
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (v5[3] >= v6 + a3)
  {
    result = sub_2489A1F68(a1, a2, *v5 + v6, *v5 + v6 + a3);
    v8 = v5[2];
    v9 = __OFADD__(v8, a3);
    v10 = v8 + a3;
    if (!v9)
    {
      v5[2] = v10;
      return result;
    }
    goto LABEL_7;
  }
LABEL_8:
  result = sub_2489A840C();
  __break(1u);
  return result;
}

uint64_t sub_2489A2450(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;

  if (*(unsigned __int8 *)(v2 + 40) >= 2u)
    goto LABEL_8;
  v4 = *(_QWORD **)(v2 + 16);
  v5 = v4[2];
  if (__OFADD__(v5, a2))
  {
    __break(1u);
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (v4[3] >= v5 + a2)
  {
    result = (uint64_t)memmove((void *)(*v4 + v5), (const void *)(a1 + 32), *(_QWORD *)(a1 + 16));
    v7 = v4[2];
    v8 = __OFADD__(v7, a2);
    v9 = v7 + a2;
    if (!v8)
    {
      v4[2] = v9;
      return result;
    }
    goto LABEL_7;
  }
LABEL_8:
  result = sub_2489A840C();
  __break(1u);
  return result;
}

uint64_t _tb_unix_service_transport_create_with_endpoint(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  void (*v7)(char *, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v10;

  v2 = sub_2489A7F2C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = tb_endpoint_get_data(a1) + OBJC_IVAR____TtC9Tightbeam16UnixEndpointData_targetUrl;
  v7 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  swift_retain();
  v7(v5, v6, v2);
  swift_release();
  type metadata accessor for UnixTransportService();
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + OBJC_IVAR____TtC9Tightbeam20UnixTransportService_listener) = 0;
  *(_QWORD *)(v8 + OBJC_IVAR____TtC9Tightbeam20UnixTransportService_transport) = 0;
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))(v8 + OBJC_IVAR____TtC9Tightbeam20UnixTransportService_targetURL, v5, v2);
  return v8;
}

uint64_t type metadata accessor for UnixTransportService()
{
  uint64_t result;

  result = qword_254460790;
  if (!qword_254460790)
    return swift_getSingletonMetadata();
  return result;
}

void _tb_unix_service_transport_send_message()
{
  sub_2489A840C();
  __break(1u);
}

uint64_t sub_2489A26F0(uint64_t a1)
{
  uint64_t context;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[5];
  uint64_t v8[3];
  uint64_t v9;
  _UNKNOWN **v10;

  context = tb_transport_get_context(a1);
  *(_QWORD *)(context + OBJC_IVAR____TtC9Tightbeam20UnixTransportService_transport) = a1;
  swift_retain();
  v3 = sub_2489A7F20();
  v5 = v4;
  v9 = type metadata accessor for UnixTransportService();
  v10 = &off_2519B1C80;
  v7[4] = &off_2519B1C90;
  v8[0] = context;
  v7[3] = v9;
  v7[0] = context;
  type metadata accessor for UnixListener();
  swift_allocObject();
  swift_retain_n();
  *(_QWORD *)(context + OBJC_IVAR____TtC9Tightbeam20UnixTransportService_listener) = sub_24899435C(v3, v5, (uint64_t)v8, (uint64_t)v7);
  swift_release();
  swift_release();
  return 0;
}

void sub_2489A2858(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;
  uint64_t inited;

  tb_alloc_message();
  v4 = tb_alloc_transport_message_buffer();
  if (v4)
  {
    v5 = v4;
    type metadata accessor for TransportBuffer();
    inited = swift_initStackObject();
    *(_QWORD *)(inited + 24) = 0;
    *(_QWORD *)(inited + 32) = 0;
    *(_QWORD *)(inited + 16) = v5;
    *(_BYTE *)(inited + 40) = 1;
    __asm { BR              X9 }
  }
  __break(1u);
  JUMPOUT(0x2489A2AF4);
}

uint64_t sub_2489A2BAC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC9Tightbeam20UnixTransportService_targetURL;
  v2 = sub_2489A7F2C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_2489A2C0C()
{
  return type metadata accessor for UnixTransportService();
}

uint64_t sub_2489A2C14()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2489A7F2C();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_2489A2C98(uint64_t (*a1)(uint64_t a1), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (**v10)(uint64_t);
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;

  v7 = sub_2489A8034();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (uint64_t (**)(uint64_t))((char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  result = *(_QWORD *)(v3 + OBJC_IVAR____TtC9Tightbeam20UnixTransportService_transport);
  if (result)
  {
    sub_2489A2858(result, a2, a3);
    v13 = v12;
    v15 = v14;
    *v10 = sub_24899F258;
    v10[1] = a1;
    (*(void (**)(uint64_t (**)(uint64_t), _QWORD, uint64_t))(v8 + 104))(v10, *MEMORY[0x24BDE01C8], v7);
    sub_2489A8028();
    swift_retain();
    sub_2489A801C();
    sub_2489A8058();
    swift_release();
    (*(void (**)(uint64_t (**)(uint64_t), uint64_t))(v8 + 8))(v10, v7);
    return sub_24898E6E0(v13, v15);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2489A2DC4(uint64_t (*a1)(uint64_t a1), uint64_t a2, uint64_t a3)
{
  return sub_2489A2C98(a1, a2, a3);
}

unint64_t sub_2489A2DE4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2577A3C80;
  if (!qword_2577A3C80)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577A3C78);
    result = MEMORY[0x2495A1154](MEMORY[0x24BDCF860], v1);
    atomic_store(result, (unint64_t *)&qword_2577A3C80);
  }
  return result;
}

_BYTE *sub_2489A2E30@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (!result)
    goto LABEL_4;
  v4 = a2 - result;
  if (a2 == result)
  {
    result = 0;
LABEL_4:
    v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    result = (_BYTE *)sub_2489A3068(result, a2);
    v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    result = (_BYTE *)sub_2489A3128((uint64_t)result, (uint64_t)a2);
    v5 = v8 | 0x8000000000000000;
  }
  else
  {
    result = (_BYTE *)sub_2489A31A0((uint64_t)result, (uint64_t)a2);
    v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

uint64_t sub_2489A2EA4(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  uint64_t v3;

  if (!a1)
    goto LABEL_4;
  v3 = a2 - a1;
  if (v3 < 0)
  {
    a1 = sub_2489A8448();
    __break(1u);
LABEL_4:
    v3 = 0;
  }
  return a3(a1, v3);
}

uint64_t sub_2489A2F24()
{
  sub_2489A83B8();
  sub_2489A825C();
  sub_2489A8190();
  sub_2489A83F4();
  sub_24898D580();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2489A2FC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  result = sub_2489A7E84();
  v8 = result;
  if (result)
  {
    result = sub_2489A7E9C();
    if (__OFSUB__(a1, result))
    {
LABEL_13:
      __break(1u);
      return result;
    }
    v8 += a1 - result;
  }
  v9 = __OFSUB__(a2, a1);
  v10 = a2 - a1;
  if (v9)
  {
    __break(1u);
    goto LABEL_13;
  }
  v11 = sub_2489A7E90();
  if (v11 >= v10)
    v12 = v10;
  else
    v12 = v11;
  v13 = v8 + v12;
  if (v8)
    v14 = v13;
  else
    v14 = 0;
  sub_2489A2EA4(v8, v14, a4);
  return 0;
}

uint64_t sub_2489A3068(_BYTE *__src, _BYTE *a2)
{
  unint64_t v2;
  _BYTE __dst[14];
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (__src)
    v2 = a2 - __src;
  else
    v2 = 0;
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF)
    goto LABEL_11;
  memset(__dst, 0, sizeof(__dst));
  v5 = v2;
  if (__src && a2 != __src)
    memcpy(__dst, __src, a2 - __src);
  return *(_QWORD *)__dst;
}

uint64_t sub_2489A3128(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  sub_2489A7EA8();
  swift_allocObject();
  result = sub_2489A7E78();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_2489A7F50();
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_2489A31A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  sub_2489A7EA8();
  swift_allocObject();
  result = sub_2489A7E78();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0)
    return v2 << 32;
LABEL_10:
  __break(1u);
  return result;
}

void *sub_2489A3220(void *__src, size_t __len)
{
  uint64_t v2;

  if (__src)
  {
    if ((__len & 0x8000000000000000) != 0)
    {
      __src = (void *)sub_2489A8448();
      __break(1u);
    }
    else
    {
      return memmove(*(void **)(v2 + 40), __src, __len);
    }
  }
  return __src;
}

unint64_t sub_2489A32A0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2577A3C70;
  if (!qword_2577A3C70)
  {
    v1 = sub_2489A7F68();
    result = MEMORY[0x2495A1154](MEMORY[0x24BDCDD80], v1);
    atomic_store(result, (unint64_t *)&qword_2577A3C70);
  }
  return result;
}

uint64_t sub_2489A32E8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577A3D28);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t static TightbeamMessage.size<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t TightbeamEncoder.encode<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v5;

  v5 = *v3;
  return (*(uint64_t (**)(uint64_t *))(a3 + 16))(&v5);
}

uint64_t TightbeamDecoder.decode<A>(as:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t (*v6)(uint64_t *, uint64_t, uint64_t);
  uint64_t v8;

  v8 = *v3;
  v6 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(a3 + 8);
  swift_retain();
  return v6(&v8, a2, a3);
}

uint64_t dispatch thunk of TightbeamEndpointDecodable.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of static TightbeamEncodable.encodedSize(of:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of TightbeamEncodable.encode(to:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of TightbeamDecodable.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t sub_2489A3484(char a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  int v5;
  uint64_t v6;
  uint64_t result;
  int v8;
  char v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v16 = a2;
    v17 = 1;
    v18 = 0;
    v19 = a3;
    v20 = 0;
    v21 = 0;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0;
    if ((a1 & 1) != 0)
      v5 = 4;
    else
      v5 = 1;
    v8 = v5;
    v9 = 0;
    v10 = 0uLL;
    v11 = 0uLL;
    v12 = 0uLL;
    v13 = 0uLL;
    v14 = 0;
    v15 = &v16;
    type metadata accessor for TightbeamMessage();
    v6 = swift_allocObject();
    TightbeamMessage.init(wrapping:)((uint64_t)&v8);
    a4(v6);
    sub_2489A400C();
    swift_release();
    return sub_24899B240((uint64_t)&v16, 0, 0, 1);
  }
  else
  {
    result = sub_2489A840C();
    __break(1u);
  }
  return result;
}

uint64_t static TightbeamMessage.withBufferPointer<A>(for:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for TransportBuffer();
  return sub_24899AEE8(a2, a3, (void (*)(void))sub_2489A3938);
}

uint64_t TightbeamMessage.__allocating_init(wrapping:)(uint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  TightbeamMessage.init(wrapping:)(a1);
  return v2;
}

uint64_t Capability.init(_:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t Capability.value.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

BOOL static TightbeamMessage.BufferUsage.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t TightbeamMessage.BufferUsage.hash(into:)()
{
  return sub_2489A84E4();
}

uint64_t TightbeamMessage.BufferUsage.hashValue.getter()
{
  sub_2489A84D8();
  sub_2489A84E4();
  return sub_2489A84FC();
}

uint64_t static TightbeamMessage.admissionSearchMultiple(table:selector:)()
{
  return tb_component_admission_search_multiple();
}

uint64_t sub_2489A3770(uint64_t a1, char a2, void (*a3)(_QWORD *))
{
  uint64_t v4;
  int v5;
  _QWORD *v6;
  uint64_t transport_buffer;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  int v11;
  char v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (*(unsigned __int8 *)(a1 + 40) >= 2u)
    goto LABEL_7;
  v4 = *(_QWORD *)(a1 + 16);
  v5 = (a2 & 1) != 0 ? 4 : 1;
  v11 = v5;
  v12 = 0;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0;
  v18 = v4;
  type metadata accessor for TightbeamMessage();
  v6 = (_QWORD *)swift_allocObject();
  v6[3] = 0;
  v6[4] = 0;
  transport_buffer = tb_message_get_transport_buffer((uint64_t)&v11);
  if (transport_buffer)
  {
    v8 = transport_buffer;
    type metadata accessor for TransportBuffer();
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 24) = 0;
    *(_QWORD *)(v9 + 32) = 0;
    *(_QWORD *)(v9 + 16) = v8;
    *(_BYTE *)(v9 + 40) = 1;
    v6[3] = &v11;
    v6[4] = v9;
    v6[2] = 0xC000000000000000;
    a3(v6);
    sub_2489A400C();
    return swift_release();
  }
  else
  {
LABEL_7:
    result = sub_2489A840C();
    __break(1u);
  }
  return result;
}

uint64_t sub_2489A3938(uint64_t a1)
{
  uint64_t v1;

  return sub_2489A3770(a1, *(_BYTE *)(v1 + 24), *(void (**)(_QWORD *))(v1 + 32));
}

uint64_t static TightbeamMessage.decode(message:from:for:validating:)(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v6;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;

  v12 = a6 & 1;
  type metadata accessor for UnownedServiceConnection();
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a2;
  type metadata accessor for AnyServiceConnection();
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = v13;
  *(_QWORD *)(v14 + 24) = &off_2519B2188;
  v15 = a3[3];
  v16 = a3[4];
  v17 = __swift_project_boxed_opaque_existential_1(a3, v15);
  swift_retain();
  v18 = sub_2489A434C(a1, v14, (uint64_t)v17, a4, a5, v12, v6, v15, v16);
  swift_release();
  swift_release();
  return v18;
}

uint64_t sub_2489A3A4C(uint64_t a1, size_t a2, uint64_t a3)
{
  _QWORD *v3;
  _DWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;

  v3[3] = 0;
  v3[4] = 0;
  v7 = (_DWORD *)swift_slowAlloc();
  *v7 = 0;
  type metadata accessor for TransportBuffer();
  v8 = swift_allocObject();
  v9 = swift_slowAlloc();
  tb_transport_initialize_message_buffer(v9);
  *(_QWORD *)(v8 + 16) = v9;
  *(_QWORD *)(v8 + 24) = nullsub_1;
  *(_QWORD *)(v8 + 32) = 0;
  *(_BYTE *)(v8 + 40) = 0;
  if (tb_client_connection_message_construct(*(uint64_t **)(a1 + 16), (uint64_t)v7, v9, a2, a3))
  {
    result = sub_2489A840C();
    __break(1u);
  }
  else
  {
    v3[4] = v8;
    swift_release();
    v3[2] = a1;
    v3[3] = v7;
    return (uint64_t)v3;
  }
  return result;
}

uint64_t TightbeamMessage.__allocating_init(buffer:disposition:state:)(uint64_t a1, char a2, unint64_t a3)
{
  uint64_t v6;

  v6 = swift_allocObject();
  TightbeamMessage.init(buffer:disposition:state:)(a1, a2, a3 | ((HIDWORD(a3) & 1) << 32));
  return v6;
}

uint64_t TightbeamMessage.init(buffer:disposition:state:)(uint64_t a1, char a2, uint64_t a3)
{
  _QWORD *v3;
  _DWORD *v7;
  _DWORD *v8;
  uint64_t result;

  v3[3] = 0;
  v3[4] = 0;
  v7 = (_DWORD *)swift_slowAlloc();
  *v7 = 0;
  if (*(unsigned __int8 *)(a1 + 40) >= 2u)
  {
    result = sub_2489A840C();
    __break(1u);
  }
  else
  {
    v8 = v7;
    tb_message_construct((uint64_t)v7, *(_QWORD *)(a1 + 16), a2);
    if ((a3 & 0x100000000) == 0)
      *v8 = a3;
    v3[2] = 0xC000000000000000;
    v3[3] = v8;
    v3[4] = a1;
    swift_release();
    return (uint64_t)v3;
  }
  return result;
}

uint64_t TightbeamMessage.init(wrapping:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t transport_buffer;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v1[3] = 0;
  v1[4] = 0;
  transport_buffer = tb_message_get_transport_buffer(a1);
  if (transport_buffer)
  {
    v4 = transport_buffer;
    type metadata accessor for TransportBuffer();
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 24) = 0;
    *(_QWORD *)(v5 + 32) = 0;
    *(_QWORD *)(v5 + 16) = v4;
    *(_BYTE *)(v5 + 40) = 1;
    v1[3] = a1;
    v1[4] = v5;
    swift_release();
    v1[2] = 0xC000000000000000;
    return (uint64_t)v1;
  }
  else
  {
    result = sub_2489A840C();
    __break(1u);
  }
  return result;
}

uint64_t sub_2489A3D60@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = v1;
  return swift_retain();
}

uint64_t sub_2489A3D6C()
{
  uint64_t v0;
  uint64_t result;

  if (*(_QWORD *)(v0 + 32))
    return swift_retain();
  result = sub_2489A840C();
  __break(1u);
  return result;
}

void sub_2489A3DD8()
{
  __asm { BR              X10 }
}

uint64_t sub_2489A3E28()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _DWORD *v4;
  uint64_t *v5;
  int v6;
  int v7;
  _DWORD *v8;

  v4 = *(_DWORD **)(v3 + 24);
  if (!v4)
  {
    sub_2489A840C();
    __break(1u);
    JUMPOUT(0x2489A3FFCLL);
  }
  v5 = *(uint64_t **)(v0 + 16);
  swift_retain();
  v6 = tb_client_connection_message_reset(v5, v4, v2, v1);
  if (v6)
  {
    v7 = v6;
    type metadata accessor for TransportError(0);
    sub_24899B1F8();
    swift_allocError();
    *v8 = v7;
    swift_willThrow();
  }
  return swift_release();
}

uint64_t sub_2489A400C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t result;

  v1 = *(_QWORD *)(v0 + 32);
  if (v1)
  {
    v2 = *(_QWORD *)(v1 + 16);
    v3 = *(_QWORD *)(v1 + 24);
    v4 = *(_QWORD *)(v1 + 32);
    *(_QWORD *)(v1 + 24) = 0;
    *(_QWORD *)(v1 + 32) = 0;
    *(_QWORD *)(v1 + 16) = 0;
    v5 = *(_BYTE *)(v1 + 40);
    *(_BYTE *)(v1 + 40) = 2;
    sub_24899B240(v2, v3, v4, v5);
  }
  v6 = *(_QWORD *)(v0 + 24);
  if (v6)
  {
    *(_QWORD *)(v0 + 24) = 0;
    *(_QWORD *)(v0 + 32) = 0;
    swift_release();
    return v6;
  }
  else
  {
    result = sub_2489A840C();
    __break(1u);
  }
  return result;
}

uint64_t TightbeamMessage.deinit()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 24))
    __asm { BR              X11 }
  swift_release();
  swift_release();
  return v0;
}

void sub_2489A41A0()
{
  sub_2489A840C();
  __break(1u);
  JUMPOUT(0x2489A41ECLL);
}

uint64_t TightbeamMessage.__deallocating_deinit()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 24))
    __asm { BR              X11 }
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

void sub_2489A42EC()
{
  sub_2489A840C();
  __break(1u);
  JUMPOUT(0x2489A4338);
}

uint64_t sub_2489A434C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;

  v14 = a6 & 1;
  v15 = *(_QWORD *)(a8 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, v18, v19);
  swift_retain();
  v25 = sub_2489A498C(a1, a2);
  v20 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a9 + 8);
  swift_retain();
  v21 = v20(&v25, a4, a5, v14, a8, a9);
  v22 = sub_2489A400C();
  swift_release_n();
  swift_release();
  if (!v21)
    v22 = 0;
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, a8);
  return v22;
}

unint64_t sub_2489A4520()
{
  unint64_t result;

  result = qword_2577A3D30;
  if (!qword_2577A3D30)
  {
    result = MEMORY[0x2495A1154](&protocol conformance descriptor for TightbeamMessage.BufferUsage, &type metadata for TightbeamMessage.BufferUsage);
    atomic_store(result, (unint64_t *)&qword_2577A3D30);
  }
  return result;
}

uint64_t dispatch thunk of MessageDecodeProtocol.decode(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of ValidatingMessageDecodeProtocol.decode(_:validating:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD))(a6 + 8))(a1, a2, a3, a4 & 1);
}

ValueMetadata *type metadata accessor for Capability()
{
  return &type metadata for Capability;
}

uint64_t type metadata accessor for TightbeamMessage()
{
  return objc_opt_self();
}

uint64_t method lookup function for TightbeamMessage()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TightbeamMessage.__allocating_init(buffer:disposition:state:)(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, unint64_t))(v3 + 200))(a1, a2, a3 | ((HIDWORD(a3) & 1) << 32));
}

uint64_t dispatch thunk of TightbeamMessage.__allocating_init(wrapping:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 208))();
}

uint64_t dispatch thunk of TightbeamMessage.encoder()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of TightbeamMessage.transportBuffer.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of TightbeamMessage.unwrap()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t storeEnumTagSinglePayload for TightbeamMessage.BufferUsage(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_2489A4668 + 4 * byte_2489A9E75[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2489A469C + 4 * asc_2489A9E70[v4]))();
}

uint64_t sub_2489A469C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2489A46A4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2489A46ACLL);
  return result;
}

uint64_t sub_2489A46B8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2489A46C0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2489A46C4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2489A46CC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TightbeamMessage.BufferUsage()
{
  return &type metadata for TightbeamMessage.BufferUsage;
}

_QWORD *initializeBufferWithCopyOfBuffer for TightbeamMessage.Connection(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  return a1;
}

uint64_t destroy for TightbeamMessage.Connection()
{
  return swift_release();
}

_QWORD *assignWithCopy for TightbeamMessage.Connection(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

_QWORD *assignWithTake for TightbeamMessage.Connection(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for TightbeamMessage.Connection(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7D && *(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 125);
  v3 = (((*(_QWORD *)a1 >> 57) >> 5) | (4 * ((*(_QWORD *)a1 >> 57) & 0x18 | *(_QWORD *)a1 & 7))) ^ 0x7F;
  if (v3 >= 0x7C)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for TightbeamMessage.Connection(uint64_t result, unsigned int a2, unsigned int a3)
{
  uint64_t v3;

  if (a2 > 0x7C)
  {
    *(_QWORD *)result = a2 - 125;
    if (a3 >= 0x7D)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7D)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
    {
      v3 = (-a2 >> 2) & 0x1F | (32 * (-a2 & 0x7F));
      *(_QWORD *)result = (v3 | (v3 << 57)) & 0xF000000000000007;
    }
  }
  return result;
}

uint64_t sub_2489A4850(_QWORD *a1)
{
  uint64_t v1;

  v1 = *a1 >> 62;
  if ((_DWORD)v1 == 3)
    return (*a1 >> 3) + 3;
  else
    return v1;
}

_QWORD *sub_2489A486C(_QWORD *result)
{
  *result &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

unint64_t *sub_2489A487C(unint64_t *result, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;

  if (a2 < 3)
  {
    v2 = *result & 0xFFFFFFFFFFFFFF8;
    v3 = a2 << 62;
  }
  else
  {
    v2 = 8 * (a2 - 3);
    v3 = 0xC000000000000000;
  }
  *result = v2 | v3;
  return result;
}

ValueMetadata *type metadata accessor for TightbeamMessage.Connection()
{
  return &type metadata for TightbeamMessage.Connection;
}

uint64_t sub_2489A48B8(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t transport_buffer;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  type metadata accessor for TightbeamMessage();
  v4 = (_QWORD *)swift_allocObject();
  transport_buffer = tb_message_get_transport_buffer(a1);
  if (transport_buffer)
  {
    v6 = transport_buffer;
    type metadata accessor for TransportBuffer();
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 24) = 0;
    *(_QWORD *)(v7 + 32) = 0;
    *(_QWORD *)(v7 + 16) = v6;
    *(_BYTE *)(v7 + 40) = 1;
    v4[3] = a1;
    v4[4] = v7;
    v4[2] = a2 | 0x8000000000000000;
    return (uint64_t)v4;
  }
  else
  {
    result = sub_2489A840C();
    __break(1u);
  }
  return result;
}

uint64_t sub_2489A498C(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t transport_buffer;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  type metadata accessor for TightbeamMessage();
  v4 = (_QWORD *)swift_allocObject();
  transport_buffer = tb_message_get_transport_buffer(a1);
  if (transport_buffer)
  {
    v6 = transport_buffer;
    type metadata accessor for TransportBuffer();
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 24) = 0;
    *(_QWORD *)(v7 + 32) = 0;
    *(_QWORD *)(v7 + 16) = v6;
    *(_BYTE *)(v7 + 40) = 1;
    v4[3] = a1;
    v4[4] = v7;
    v4[2] = a2 | 0x4000000000000000;
    return (uint64_t)v4;
  }
  else
  {
    result = sub_2489A840C();
    __break(1u);
  }
  return result;
}

uint64_t ClientConnection.__allocating_init(endpoint:)(uint64_t a1)
{
  uint64_t v2;
  unsigned int *v3;
  uint64_t *v4;

  v2 = swift_allocObject();
  TightbeamEndpoint.constructEndpoint()();
  v4 = tb_client_connection_create_with_endpoint(v3);
  tb_client_connection_activate(v4);
  sub_24899C15C(a1);
  *(_QWORD *)(v2 + 16) = v4;
  return v2;
}

uint64_t ClientConnection.init(endpoint:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unsigned int *v4;
  uint64_t *v5;

  v2 = v1;
  TightbeamEndpoint.constructEndpoint()();
  v5 = tb_client_connection_create_with_endpoint(v4);
  tb_client_connection_activate(v5);
  sub_24899C15C(a1);
  *(_QWORD *)(v2 + 16) = v5;
  return v2;
}

uint64_t ClientConnection.allocateMessage(size:capabilities:)(size_t a1, uint64_t a2)
{
  uint64_t v4;

  type metadata accessor for TightbeamMessage();
  swift_allocObject();
  v4 = swift_retain();
  return sub_2489A3A4C(v4, a1, a2);
}

_QWORD *ClientConnection.send(message:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int v4;
  int *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t transport_buffer;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v12[0] = 0;
  v2 = a1[3];
  if (!v2)
    goto LABEL_12;
  v3 = a1;
  v4 = tb_connection_send_query(*(uint64_t **)(v1 + 16), v2, v12, 2uLL);
  if (!v4)
  {
    v7 = v12[0];
    if (!v12[0])
    {
      v4 = 4;
      goto LABEL_3;
    }
    v8 = v3[3];
    if (v8)
    {
      if (v8 == v12[0])
      {
        swift_retain();
        return v3;
      }
      type metadata accessor for TightbeamMessage();
      v3 = (_QWORD *)swift_allocObject();
      transport_buffer = tb_message_get_transport_buffer(v7);
      if (transport_buffer)
      {
        v10 = transport_buffer;
        type metadata accessor for TransportBuffer();
        v11 = swift_allocObject();
        *(_QWORD *)(v11 + 24) = 0;
        *(_QWORD *)(v11 + 32) = 0;
        *(_QWORD *)(v11 + 16) = v10;
        *(_BYTE *)(v11 + 40) = 1;
        v3[3] = v7;
        v3[4] = v11;
        v3[2] = 0xC000000000000000;
        return v3;
      }
    }
    while (1)
    {
LABEL_12:
      sub_2489A840C();
      __break(1u);
    }
  }
LABEL_3:
  type metadata accessor for TransportError(0);
  sub_24899B1F8();
  swift_allocError();
  *v5 = v4;
  swift_willThrow();
  return v3;
}

uint64_t ClientConnection.sendOneway(message:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  int v4;
  _DWORD *v5;

  v2 = *(_QWORD *)(a1 + 24);
  if (v2)
  {
    result = tb_connection_send_query(*(uint64_t **)(v1 + 16), v2, 0, 0);
    if ((_DWORD)result)
    {
      v4 = result;
      type metadata accessor for TransportError(0);
      sub_24899B1F8();
      swift_allocError();
      *v5 = v4;
      return swift_willThrow();
    }
  }
  else
  {
    result = sub_2489A840C();
    __break(1u);
  }
  return result;
}

uint64_t ClientConnection.deinit()
{
  uint64_t v0;

  tb_client_connection_destruct(*(uint64_t **)(v0 + 16));
  return v0;
}

uint64_t ClientConnection.__deallocating_deinit()
{
  uint64_t v0;

  tb_client_connection_destruct(*(uint64_t **)(v0 + 16));
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ClientConnection()
{
  return objc_opt_self();
}

uint64_t method lookup function for ClientConnection()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ClientConnection.__allocating_init(endpoint:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t _tb_eve_transport_construct_message_buffer(uint64_t result, uint64_t a2, uint64_t a3)
{
  _QWORD *v4;

  if (__OFADD__(result, 24))
  {
    __break(1u);
  }
  else if (result + 24 <= 4096)
  {
    v4 = (_QWORD *)swift_slowAlloc();
    result = 0;
    v4[1] = 0;
    v4[2] = 0;
    *v4 = 0;
    *(_QWORD *)a3 = v4;
    *(_BYTE *)(a3 + 8) = 0;
    *(_OWORD *)(a3 + 16) = xmmword_2489A9FF0;
    *(_QWORD *)(a3 + 32) = 24;
    *(_QWORD *)(a3 + 48) = 0;
  }
  else
  {
    return 2;
  }
  return result;
}

void _tb_eve_transport_destruct_message_buffer()
{
  JUMPOUT(0x2495A11FCLL);
}

uint64_t _tb_eve_transport_message_buffer_reset(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a3 + 24;
  if (__OFADD__(a3, 24))
  {
    __break(1u);
  }
  else if (v3 <= 4096)
  {
    v4 = result;
    result = 0;
    *(_QWORD *)(v4 + 16) = 24;
    *(_QWORD *)(v4 + 24) = v3;
    *(_BYTE *)(v4 + 41) = 1;
  }
  else
  {
    return 2;
  }
  return result;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
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

uint64_t getEnumTagSinglePayload for HandlerRegistration(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 64))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 4);
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for HandlerRegistration(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 64) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 64) = 0;
    if (a2)
      *(_BYTE *)(result + 4) = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for HandlerRegistration()
{
  return &type metadata for HandlerRegistration;
}

ValueMetadata *type metadata accessor for ComponentRuntimeLock()
{
  return &type metadata for ComponentRuntimeLock;
}

uint64_t sub_2489A5010()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjectType;

  v1 = *(_QWORD *)(v0 + 24);
  ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(ObjectType, v1);
}

uint64_t sub_2489A504C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t ObjectType;

  v3 = *(_QWORD *)(v1 + 24);
  ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(a1, ObjectType, v3);
}

uint64_t sub_2489A5094()
{
  return swift_deallocClassInstance();
}

uint64_t sub_2489A50A4()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

void sub_2489A50AC()
{
  sub_2489A840C();
  __break(1u);
}

uint64_t ServiceConnection.__allocating_init(endpoint:)(uint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  ServiceConnection.init(endpoint:)(a1);
  return v2;
}

uint64_t ServiceConnection.init(endpoint:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unsigned int *v5;
  unsigned int *v6;
  void *v7;
  _QWORD *v8;
  _QWORD v10[6];

  v2 = v1;
  *(_QWORD *)(v2 + 16) = 0;
  *(_QWORD *)(v2 + 32) = 0;
  swift_unknownObjectWeakInit();
  type metadata accessor for AnyServiceConnection();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v2;
  *(_QWORD *)(v4 + 24) = &off_2519B1A68;
  swift_retain();
  TightbeamEndpoint.constructEndpoint()();
  v6 = v5;
  v10[4] = sub_2489A5270;
  v10[5] = v4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 1107296256;
  v10[2] = sub_2489A52B8;
  v10[3] = &block_descriptor_1;
  v7 = _Block_copy(v10);
  swift_retain();
  swift_release();
  v8 = tb_service_connection_create_with_endpoint(v6, v7);
  _Block_release(v7);
  sub_2489A5860(0xD00000000000001BLL, 0x80000002489AC910);
  swift_release();
  sub_24899C15C(a1);
  *(_QWORD *)(v2 + 16) = v8;
  return v2;
}

uint64_t type metadata accessor for AnyServiceConnection()
{
  return objc_opt_self();
}

uint64_t sub_2489A5270(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t ObjectType;

  v4 = *(_QWORD *)(v2 + 24);
  ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(a2, ObjectType, v4);
}

uint64_t sub_2489A52B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v5)(uint64_t, uint64_t);
  uint64_t v6;

  v5 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  v6 = v5(a2, a3);
  swift_release();
  return v6;
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_2489A5324(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;

  v2 = v1;
  swift_beginAccess();
  v4 = MEMORY[0x2495A1274](v2 + 24);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)(v2 + 32);
    type metadata accessor for AnyServiceConnection();
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v2;
    *(_QWORD *)(v7 + 24) = &off_2519B1A68;
    swift_retain();
    swift_unknownObjectRetain();
    v8 = sub_2489A55E8(a1, v7, v5, v6, 0, 0, 1);
    swift_release();
    swift_unknownObjectRelease_n();
    return v8;
  }
  else
  {
    result = sub_2489A840C();
    __break(1u);
  }
  return result;
}

uint64_t *sub_2489A5440()
{
  uint64_t v0;
  uint64_t *result;

  result = *(uint64_t **)(v0 + 16);
  if (result)
    return (uint64_t *)tb_service_connection_activate(result);
  __break(1u);
  return result;
}

uint64_t *ServiceConnection.deinit()
{
  uint64_t v0;
  uint64_t *result;

  result = *(uint64_t **)(v0 + 16);
  if (result)
  {
    tb_service_connection_destruct(result);
    sub_24899C6F0(v0 + 24);
    return (uint64_t *)v0;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t *ServiceConnection.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t *result;

  result = *(uint64_t **)(v0 + 16);
  if (result)
  {
    tb_service_connection_destruct(result);
    sub_24899C6F0(v0 + 24);
    return (uint64_t *)swift_deallocClassInstance();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2489A54B4@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  v3 = *a1;
  v4 = *a1 + 24;
  swift_beginAccess();
  result = MEMORY[0x2495A1274](v4);
  v6 = *(_QWORD *)(v3 + 32);
  *a2 = result;
  a2[1] = v6;
  return result;
}

uint64_t sub_2489A550C(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v3 + 32) = v2;
  return swift_unknownObjectWeakAssign();
}

uint64_t type metadata accessor for UnownedServiceConnection()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for ServiceConnection()
{
  return objc_opt_self();
}

uint64_t method lookup function for ServiceConnection()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ServiceConnection.service.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of ServiceConnection.service.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of ServiceConnection.service.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of ServiceConnection.__allocating_init(endpoint:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of ServiceConnection.begin()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t sub_2489A55E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t ObjectType;
  uint64_t v14;
  uint64_t (*v15)(uint64_t *, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t result;
  uint64_t v19;

  swift_unknownObjectRetain();
  swift_retain();
  v11 = sub_2489A498C(a1, a2);
  if ((a7 & 1) != 0)
  {
    v12 = v11;
    ObjectType = swift_getObjectType();
    v19 = v12;
    v14 = *(_QWORD *)(a4 + 8);
    v15 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v14 + 8);
    swift_retain();
    v16 = v15(&v19, ObjectType, v14);
    v17 = sub_2489A400C();
    swift_release_n();
    swift_release();
    swift_unknownObjectRelease();
    if (v16)
      return v17;
    else
      return 0;
  }
  else
  {
    result = sub_2489A840C();
    __break(1u);
  }
  return result;
}

uint64_t sub_2489A57B8(uint64_t result)
{
  int v1;

  if ((_DWORD)result)
  {
    v1 = result;
    sub_2489A83B8();
    swift_bridgeObjectRelease();
    tb_error_t.description.getter(v1);
    sub_2489A825C();
    swift_bridgeObjectRelease();
    result = sub_2489A840C();
    __break(1u);
  }
  return result;
}

void sub_2489A5860(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;

  if (qword_2577A3A48 != -1)
    swift_once();
  v4 = sub_2489A7F98();
  __swift_project_value_buffer(v4, (uint64_t)qword_2577A3D38);
  swift_bridgeObjectRetain_n();
  v5 = sub_2489A7F80();
  v6 = sub_2489A8304();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v9 = v8;
    *(_DWORD *)v7 = 136315138;
    swift_bridgeObjectRetain();
    sub_2489984BC(a1, a2, &v9);
    sub_2489A8370();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_248981000, v5, v6, "%s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2495A11FC](v8, -1, -1);
    MEMORY[0x2495A11FC](v7, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

uint64_t sub_2489A59FC()
{
  uint64_t v0;

  v0 = sub_2489A7F98();
  __swift_allocate_value_buffer(v0, qword_2577A3D38);
  __swift_project_value_buffer(v0, (uint64_t)qword_2577A3D38);
  return sub_2489A7F8C();
}

uint64_t sub_2489A5A64()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t _tb_delegated_client_transport_create(uint64_t a1)
{
  uint64_t data;
  uint64_t v2;

  data = tb_endpoint_get_data(a1);
  type metadata accessor for DelegatedTransportClient();
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = data;
  *(_QWORD *)(v2 + 24) = 0;
  swift_retain();
  return v2;
}

uint64_t type metadata accessor for DelegatedTransportClient()
{
  return objc_opt_self();
}

uint64_t _tb_delegated_client_transport_activate(uint64_t a1)
{
  *(_QWORD *)(tb_transport_get_context(a1) + 24) = a1;
  return 0;
}

void sub_2489A5B18(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *inited;
  uint64_t transport_buffer;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  char *v20;
  _QWORD v21[2];
  _QWORD v22[3];
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;

  v3 = v2;
  type metadata accessor for TightbeamMessage();
  inited = (_QWORD *)swift_initStackObject();
  inited[3] = 0;
  inited[4] = 0;
  transport_buffer = tb_message_get_transport_buffer(a1);
  if (transport_buffer)
  {
    v7 = transport_buffer;
    type metadata accessor for TransportBuffer();
    v8 = swift_allocObject();
    *(_QWORD *)(v8 + 24) = 0;
    *(_QWORD *)(v8 + 32) = 0;
    *(_QWORD *)(v8 + 16) = v7;
    *(_BYTE *)(v8 + 40) = 1;
    inited[3] = a1;
    inited[4] = v8;
    swift_release();
    inited[2] = 0xC000000000000000;
    if (*(unsigned __int8 *)(v8 + 40) < 2u)
    {
      v9 = *(uint64_t **)(v8 + 16);
      v10 = v9[2];
      if (v9[3] >= v10)
      {
        if (v10 < 0)
        {
          sub_2489A8448();
          __break(1u);
        }
        else
        {
          v11 = *v9;
          v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577A3C78);
          v24 = sub_2489A2DE4();
          v22[0] = v11;
          v22[1] = v10;
          v12 = __swift_project_boxed_opaque_existential_1(v22, v23);
          if (*v12)
            v13 = (_BYTE *)(*v12 + v12[1]);
          else
            v13 = 0;
          sub_2489A2E30((_BYTE *)*v12, v13, v21);
          v14 = v21[0];
          v15 = v21[1];
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
          v16 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 + 16) + 16);
          swift_retain();
          v16(v14, v15);
          v18 = v17;
          swift_release();
          v19 = inited[4];
          if (v19 && *(unsigned __int8 *)(v19 + 40) < 2u)
          {
            v20 = (char *)&loc_2489A5C7C + *((int *)qword_2489A5F60 + (v18 >> 62));
            v25 = v3;
            __asm { BR              X9 }
          }
        }
      }
    }
  }
  sub_2489A840C();
  __break(1u);
  JUMPOUT(0x2489A5F60);
}

uint64_t sub_2489A5F70()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t _tb_delegated_client_transport_send_message_0(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v5;
  uint64_t v6;

  tb_transport_get_context(a1);
  swift_retain();
  sub_2489A5B18(a2);
  v6 = v5;
  swift_release();
  if (a3)
    *a3 = v6;
  return 0;
}

uint64_t type metadata accessor for DelegatedClientEndpointData()
{
  return objc_opt_self();
}

uint64_t tb_component_admission_search(uint64_t a1, unint64_t a2)
{
  return admissionSearch(_:_:)(a1, a2) & 1;
}

uint64_t admissionSearch(_:_:)(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t result;
  uint64_t v9;

  if (!a1)
    return 1;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 < 0)
  {
LABEL_25:
    result = sub_2489A8448();
    __break(1u);
    return result;
  }
  v3 = v2 - 1;
  if (v2 >= 1)
    v4 = v2 - 1;
  else
    v4 = *(_QWORD *)(a1 + 8);
  v5 = v4 >> 1;
  if (v2 > (unint64_t)v5)
  {
    v6 = *(_QWORD *)(a1 + 16);
    v7 = *(_QWORD *)(v6 + 8 * v5);
    if (v7 == a2)
      return 1;
    v9 = 0;
    while (1)
    {
      if (v7 <= a2)
        v9 = v5 + 1;
      else
        v3 = v5 - 1;
      v5 = v9 + (v3 - v9) / 2;
      if (__OFADD__(v9, (v3 - v9) / 2))
        break;
      result = v5 >= v9 && v3 >= v5;
      if ((_DWORD)result == 1)
      {
        v7 = *(_QWORD *)(v6 + 8 * v5);
        if (v7 != a2)
          continue;
      }
      return result;
    }
    goto LABEL_25;
  }
  return 0;
}

uint64_t sub_2489A61D0()
{
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t _tb_delegated_service_transport_create(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  tb_endpoint_get_data(a1);
  type metadata accessor for DelegatedTransportService();
  v1 = swift_allocObject();
  v2 = swift_retain();
  sub_2489A62B0(v2);
  return v1;
}

uint64_t type metadata accessor for DelegatedTransportService()
{
  return objc_opt_self();
}

uint64_t sub_2489A6264(uint64_t a1)
{
  tb_transport_get_context(a1);
  swift_retain();
  sub_2489A6484(a1);
  swift_release();
  return 0;
}

_QWORD *sub_2489A62B0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  _QWORD v10[2];
  uint64_t v11;
  uint64_t v12;

  v11 = a1;
  v2 = sub_2489A831C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2489A8310();
  v7 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8](v6);
  v8 = sub_2489A81B4();
  MEMORY[0x24BDAC7A8](v8);
  v10[1] = sub_24898E528();
  sub_2489A81A8();
  v12 = MEMORY[0x24BEE4AF8];
  sub_248988A58((unint64_t *)&qword_2577A3B40, v7, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577A3B48);
  sub_24899AE60((unint64_t *)&qword_2577A3B50, &qword_2577A3B48, MEMORY[0x24BEE12C8]);
  sub_2489A83A0();
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BEE5750], v2);
  v1[3] = sub_2489A8334();
  v1[4] = 0;
  v1[2] = v11;
  return v1;
}

uint64_t sub_2489A6484(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD aBlock[8];

  v2 = v1;
  v4 = sub_2489A819C();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v15 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_2489A81B4();
  v8 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v2 + 32) = a1;
  aBlock[4] = sub_2489A6CCC;
  aBlock[5] = v2;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2489A668C;
  aBlock[3] = &block_descriptor_3_0;
  v11 = _Block_copy(aBlock);
  swift_retain();
  sub_2489A81A8();
  aBlock[7] = MEMORY[0x24BEE4AF8];
  sub_248988A58(&qword_2577A3D50, v5, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577A3D58);
  sub_24899AE60((unint64_t *)&unk_2577A3D60, &qword_2577A3D58, MEMORY[0x24BEE12C8]);
  sub_2489A83A0();
  MEMORY[0x2495A0AD0](0, v10, v7, v11);
  _Block_release(v11);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v7, v4);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v14);
  return swift_release();
}

uint64_t type metadata accessor for DelegatedServiceEndpointData()
{
  return objc_opt_self();
}

uint64_t sub_2489A668C(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_2489A66B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  void (*v17)(uint64_t, unint64_t);
  void *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD aBlock[5];
  uint64_t v27;

  v1 = sub_2489A819C();
  v24 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_2489A81B4();
  v22 = *(_QWORD *)(v4 - 8);
  v23 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(v0 + 16);
  v8 = *(uint64_t (**)(uint64_t))(v7 + 16);
  v9 = swift_retain();
  v10 = v8(v9);
  v21 = v10;
  v12 = v11;
  swift_release();
  sub_2489A6908(v10, v12);
  v14 = v13;
  v16 = v15;
  v17 = *(void (**)(uint64_t, unint64_t))(v7 + 32);
  swift_retain();
  v17(v14, v16);
  swift_release();
  v20 = *(_QWORD *)(v0 + 24);
  aBlock[4] = sub_2489A6CA8;
  v27 = v0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2489A668C;
  aBlock[3] = &block_descriptor_2;
  v18 = _Block_copy(aBlock);
  swift_retain();
  sub_2489A81A8();
  v25 = MEMORY[0x24BEE4AF8];
  sub_248988A58(&qword_2577A3D50, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577A3D58);
  sub_24899AE60((unint64_t *)&unk_2577A3D60, &qword_2577A3D58, MEMORY[0x24BEE12C8]);
  sub_2489A83A0();
  MEMORY[0x2495A0AD0](0, v6, v3, v18);
  _Block_release(v18);
  sub_24898E6E0(v14, v16);
  sub_24898E6E0(v21, v12);
  (*(void (**)(char *, uint64_t))(v24 + 8))(v3, v1);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v6, v23);
  return swift_release();
}

void sub_2489A6908(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t inited;

  tb_alloc_message();
  v3 = tb_alloc_transport_message_buffer();
  if (v3)
  {
    v4 = v3;
    type metadata accessor for TransportBuffer();
    inited = swift_initStackObject();
    *(_QWORD *)(inited + 24) = 0;
    *(_QWORD *)(inited + 32) = 0;
    *(_QWORD *)(inited + 16) = v4;
    *(_BYTE *)(inited + 40) = 1;
    __asm { BR              X9 }
  }
  __break(1u);
  JUMPOUT(0x2489A6BC0);
}

uint64_t sub_2489A6C7C()
{
  uint64_t v0;

  swift_release();

  return swift_deallocClassInstance();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

void _tb_afk_common_transport_construct_message_buffer_cold_1()
{
  _os_crash();
  __break(1u);
}

void tb_afk_transport_create_cold_3()
{
  _os_crash();
  __break(1u);
}

void _tb_afk_user_transport_send_message_cold_2()
{
  _os_crash();
  __break(1u);
}

void _tb_afk_user_transport_send_message_cold_3()
{
  _os_crash();
  __break(1u);
}

void __tb_afk_transport_create_block_invoke_cold_3()
{
  _os_crash();
  __break(1u);
}

void _tb_null_transport_send_message_cold_4()
{
  _os_crash();
  __break(1u);
}

void tb_message_construct_cold_1()
{
  _os_crash();
  __break(1u);
}

void tb_message_configure_recieved_cold_1()
{
  _os_crash();
  __break(1u);
}

void tb_message_measure_subrange_cold_1()
{
  printf("TB_FATAL: overflow detected when subtracting (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 212);
  _os_crash();
  __break(1u);
}

void tb_message_subrange_cold_1()
{
  _os_crash();
  __break(1u);
}

void tb_message_subrange_cold_2()
{
  printf("TB_FATAL: overflow detected when adding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 224);
  _os_crash();
  __break(1u);
}

void tb_message_subrange_cold_3()
{
  _os_crash();
  __break(1u);
}

void tb_message_encode_BOOL_cold_1()
{
  printf("TB_FATAL: overflow detected when adding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 457);
  _os_crash();
  __break(1u);
}

void tb_message_encode_BOOL_cold_2()
{
  printf("TB_FATAL: TB: overflow during encoding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 457);
  _os_crash();
  __break(1u);
}

void tb_message_encode_BOOL_cold_3()
{
  _os_crash();
  __break(1u);
}

void tb_message_encode_u8_cold_1()
{
  printf("TB_FATAL: overflow detected when adding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 463);
  _os_crash();
  __break(1u);
}

void tb_message_encode_u8_cold_2()
{
  printf("TB_FATAL: TB: overflow during encoding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 463);
  _os_crash();
  __break(1u);
}

void tb_message_encode_u16_cold_1()
{
  printf("TB_FATAL: overflow detected when adding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 469);
  _os_crash();
  __break(1u);
}

void tb_message_encode_u16_cold_2()
{
  printf("TB_FATAL: TB: overflow during encoding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 469);
  _os_crash();
  __break(1u);
}

void tb_message_encode_u32_cold_1()
{
  printf("TB_FATAL: overflow detected when adding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 475);
  _os_crash();
  __break(1u);
}

void tb_message_encode_u32_cold_2()
{
  printf("TB_FATAL: TB: overflow during encoding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 475);
  _os_crash();
  __break(1u);
}

void tb_message_encode_u64_cold_1()
{
  printf("TB_FATAL: overflow detected when adding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 481);
  _os_crash();
  __break(1u);
}

void tb_message_encode_u64_cold_2()
{
  printf("TB_FATAL: TB: overflow during encoding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 481);
  _os_crash();
  __break(1u);
}

void tb_message_encode_s8_cold_1()
{
  printf("TB_FATAL: overflow detected when adding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 487);
  _os_crash();
  __break(1u);
}

void tb_message_encode_s8_cold_2()
{
  printf("TB_FATAL: TB: overflow during encoding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 487);
  _os_crash();
  __break(1u);
}

void tb_message_encode_s16_cold_1()
{
  printf("TB_FATAL: overflow detected when adding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 493);
  _os_crash();
  __break(1u);
}

void tb_message_encode_s16_cold_2()
{
  printf("TB_FATAL: TB: overflow during encoding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 493);
  _os_crash();
  __break(1u);
}

void tb_message_encode_s32_cold_1()
{
  printf("TB_FATAL: overflow detected when adding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 499);
  _os_crash();
  __break(1u);
}

void tb_message_encode_s32_cold_2()
{
  printf("TB_FATAL: TB: overflow during encoding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 499);
  _os_crash();
  __break(1u);
}

void tb_message_encode_s64_cold_1()
{
  printf("TB_FATAL: overflow detected when adding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 505);
  _os_crash();
  __break(1u);
}

void tb_message_encode_s64_cold_2()
{
  printf("TB_FATAL: TB: overflow during encoding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 505);
  _os_crash();
  __break(1u);
}

void tb_message_encode_f32_v2_cold_1()
{
  printf("TB_FATAL: overflow detected when adding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 512);
  _os_crash();
  __break(1u);
}

void tb_message_encode_f32_v2_cold_2()
{
  printf("TB_FATAL: TB: overflow during encoding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 512);
  _os_crash();
  __break(1u);
}

void tb_message_encode_f64_v2_cold_1()
{
  printf("TB_FATAL: overflow detected when adding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 522);
  _os_crash();
  __break(1u);
}

void tb_message_encode_f64_v2_cold_2()
{
  printf("TB_FATAL: TB: overflow during encoding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 522);
  _os_crash();
  __break(1u);
}

void tb_message_encode_f32_cold_1(int a1)
{
  printf("TB_FATAL: tb_message_encode_f32_v2: %d (%s:%d)\n", a1, "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 531);
  _os_crash();
  __break(1u);
}

void tb_message_encode_f64_cold_1(int a1)
{
  printf("TB_FATAL: tb_message_encode_f64_v2: %d (%s:%d)\n", a1, "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 537);
  _os_crash();
  __break(1u);
}

void tb_message_encode_buffer_cold_1()
{
  printf("TB_FATAL: overflow detected when adding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 548);
  _os_crash();
  __break(1u);
}

void tb_message_encode_buffer_cold_2()
{
  _os_crash();
  __break(1u);
}

void tb_message_decode_BOOL_cold_1()
{
  printf("TB_FATAL: overflow detected when adding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 560);
  _os_crash();
  __break(1u);
}

void tb_message_decode_BOOL_cold_2()
{
  printf("TB_FATAL: TB: size 0 buffer during decoding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 560);
  _os_crash();
  __break(1u);
}

void tb_message_decode_BOOL_cold_3()
{
  printf("TB_FATAL: TB: overflow during decoding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 560);
  _os_crash();
  __break(1u);
}

void tb_message_decode_BOOL_cold_4()
{
  _os_crash();
  __break(1u);
}

void tb_message_decode_u8_cold_1()
{
  printf("TB_FATAL: overflow detected when adding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 566);
  _os_crash();
  __break(1u);
}

void tb_message_decode_u8_cold_2()
{
  printf("TB_FATAL: TB: size 0 buffer during decoding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 566);
  _os_crash();
  __break(1u);
}

void tb_message_decode_u8_cold_3()
{
  printf("TB_FATAL: TB: overflow during decoding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 566);
  _os_crash();
  __break(1u);
}

void tb_message_decode_u16_cold_1()
{
  printf("TB_FATAL: overflow detected when adding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 572);
  _os_crash();
  __break(1u);
}

void tb_message_decode_u16_cold_2()
{
  printf("TB_FATAL: TB: size 0 buffer during decoding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 572);
  _os_crash();
  __break(1u);
}

void tb_message_decode_u16_cold_3()
{
  printf("TB_FATAL: TB: overflow during decoding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 572);
  _os_crash();
  __break(1u);
}

void tb_message_decode_u32_cold_1()
{
  printf("TB_FATAL: overflow detected when adding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 578);
  _os_crash();
  __break(1u);
}

void tb_message_decode_u32_cold_2()
{
  printf("TB_FATAL: TB: size 0 buffer during decoding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 578);
  _os_crash();
  __break(1u);
}

void tb_message_decode_u32_cold_3()
{
  printf("TB_FATAL: TB: overflow during decoding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 578);
  _os_crash();
  __break(1u);
}

void tb_message_decode_u64_cold_1()
{
  printf("TB_FATAL: overflow detected when adding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 584);
  _os_crash();
  __break(1u);
}

void tb_message_decode_u64_cold_2()
{
  printf("TB_FATAL: TB: size 0 buffer during decoding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 584);
  _os_crash();
  __break(1u);
}

void tb_message_decode_u64_cold_3()
{
  printf("TB_FATAL: TB: overflow during decoding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 584);
  _os_crash();
  __break(1u);
}

void tb_message_decode_s8_cold_1()
{
  printf("TB_FATAL: overflow detected when adding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 590);
  _os_crash();
  __break(1u);
}

void tb_message_decode_s8_cold_2()
{
  printf("TB_FATAL: TB: size 0 buffer during decoding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 590);
  _os_crash();
  __break(1u);
}

void tb_message_decode_s8_cold_3()
{
  printf("TB_FATAL: TB: overflow during decoding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 590);
  _os_crash();
  __break(1u);
}

void tb_message_decode_s16_cold_1()
{
  printf("TB_FATAL: overflow detected when adding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 596);
  _os_crash();
  __break(1u);
}

void tb_message_decode_s16_cold_2()
{
  printf("TB_FATAL: TB: size 0 buffer during decoding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 596);
  _os_crash();
  __break(1u);
}

void tb_message_decode_s16_cold_3()
{
  printf("TB_FATAL: TB: overflow during decoding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 596);
  _os_crash();
  __break(1u);
}

void tb_message_decode_s32_cold_1()
{
  printf("TB_FATAL: overflow detected when adding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 602);
  _os_crash();
  __break(1u);
}

void tb_message_decode_s32_cold_2()
{
  printf("TB_FATAL: TB: size 0 buffer during decoding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 602);
  _os_crash();
  __break(1u);
}

void tb_message_decode_s32_cold_3()
{
  printf("TB_FATAL: TB: overflow during decoding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 602);
  _os_crash();
  __break(1u);
}

void tb_message_decode_s64_cold_1()
{
  printf("TB_FATAL: overflow detected when adding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 608);
  _os_crash();
  __break(1u);
}

void tb_message_decode_s64_cold_2()
{
  printf("TB_FATAL: TB: size 0 buffer during decoding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 608);
  _os_crash();
  __break(1u);
}

void tb_message_decode_s64_cold_3()
{
  printf("TB_FATAL: TB: overflow during decoding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 608);
  _os_crash();
  __break(1u);
}

void tb_message_decode_f32_v2_cold_1()
{
  printf("TB_FATAL: overflow detected when adding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 614);
  _os_crash();
  __break(1u);
}

void tb_message_decode_f32_v2_cold_2()
{
  printf("TB_FATAL: TB: size 0 buffer during decoding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 614);
  _os_crash();
  __break(1u);
}

void tb_message_decode_f32_v2_cold_3()
{
  printf("TB_FATAL: TB: overflow during decoding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 614);
  _os_crash();
  __break(1u);
}

void tb_message_decode_f64_v2_cold_1()
{
  printf("TB_FATAL: overflow detected when adding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 621);
  _os_crash();
  __break(1u);
}

void tb_message_decode_f64_v2_cold_2()
{
  printf("TB_FATAL: TB: size 0 buffer during decoding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 621);
  _os_crash();
  __break(1u);
}

void tb_message_decode_f64_v2_cold_3()
{
  printf("TB_FATAL: TB: overflow during decoding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 621);
  _os_crash();
  __break(1u);
}

void tb_message_decode_f32_cold_1(int a1)
{
  printf("TB_FATAL: tb_message_decode_f32_v2: %d (%s:%d)\n", a1, "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 628);
  _os_crash();
  __break(1u);
}

void tb_message_decode_f64_cold_1(int a1)
{
  printf("TB_FATAL: tb_message_decode_f64_v2: %d (%s:%d)\n", a1, "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_message.c", 634);
  _os_crash();
  __break(1u);
}

void __tb_service_connection_create_block_invoke_cold_1()
{
  _os_crash();
  __break(1u);
}

void __tb_service_connection_create_block_invoke_cold_2()
{
  _os_crash();
  __break(1u);
}

void __tb_service_connection_create_block_invoke_cold_3()
{
  _os_crash();
  __break(1u);
}

void __tb_service_connection_create_block_invoke_cold_4()
{
  _os_crash();
  __break(1u);
}

void _tb_connection_transport_for_endpoint_inplace_cold_1()
{
  _os_crash();
  __break(1u);
}

void tb_connection_send_query_cold_3()
{
  _os_crash();
  __break(1u);
}

void tb_connection_send_query_cold_4()
{
  _os_crash();
  __break(1u);
}

void tb_connection_dealloc_destruct_owned_transport_message_buffer_cold_1()
{
  _os_crash();
  __break(1u);
}

void _tb_connection_message_construct_cold_1()
{
  _os_crash();
  __break(1u);
}

void _tb_connection_message_destruct_cold_1()
{
  _os_crash();
  __break(1u);
}

void _add_accumulator_cold_1()
{
  _os_crash();
  __break(1u);
}

void tb_message_accumulator_accumulate_cold_2()
{
  printf("TB_FATAL: overflow detected when multiplying (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/message_accumulator.c", 149);
  _os_crash();
  __break(1u);
}

void tb_message_accumulator_accumulate_cold_4()
{
  printf("TB_FATAL: overflow detected when adding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/message_accumulator.c", 114);
  _os_crash();
  __break(1u);
}

void tb_message_accumulator_accumulate_cold_6()
{
  printf("TB_FATAL: overflow detected when adding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/message_accumulator.c", 162);
  _os_crash();
  __break(1u);
}

void tb_message_accumulator_accumulate_cold_7()
{
  _os_crash();
  __break(1u);
}

void tb_message_accumulator_accumulate_cold_9()
{
  _os_crash();
  __break(1u);
}

void tb_message_splitter_send_cold_2()
{
  printf("TB_FATAL: overflow detected when adding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/message_splitter.c", 107);
  _os_crash();
  __break(1u);
}

void tb_reply_splitter_add_reply_cold_1()
{
  _os_crash();
  __break(1u);
}

void tb_reply_splitter_next_message_cold_1()
{
  printf("TB_FATAL: overflow detected when adding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/message_splitter.c", 389);
  _os_crash();
  __break(1u);
}

void _tb_forwarding_connection_message_forward_cold_1()
{
  printf("TB_FATAL: overflow detected when adding (%s:%d)\n", "/Library/Caches/com.apple.xbs/Sources/Tightbeam/Runtime/Tightbeam/tb_forwarding_connection.c", 112);
  _os_crash();
  __break(1u);
}

void _tb_forwarding_connection_message_forward_cold_2()
{
  _os_crash();
  __break(1u);
}

void _tb_forwarding_connection_message_forward_cold_3()
{
  _os_crash();
  __break(1u);
  sub_2489A7E78();
}

uint64_t sub_2489A7E78()
{
  return MEMORY[0x24BDCBBB0]();
}

uint64_t sub_2489A7E84()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_2489A7E90()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_2489A7E9C()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_2489A7EA8()
{
  return MEMORY[0x24BDCBC10]();
}

uint64_t sub_2489A7EB4()
{
  return MEMORY[0x24BDCC240]();
}

uint64_t sub_2489A7EC0()
{
  return MEMORY[0x24BDCC248]();
}

uint64_t sub_2489A7ECC()
{
  return MEMORY[0x24BDCC250]();
}

uint64_t sub_2489A7ED8()
{
  return MEMORY[0x24BDCC258]();
}

uint64_t sub_2489A7EE4()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_2489A7EF0()
{
  return MEMORY[0x24BDCD870]();
}

uint64_t sub_2489A7EFC()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_2489A7F08()
{
  return MEMORY[0x24BDCD928]();
}

uint64_t sub_2489A7F14()
{
  return MEMORY[0x24BDCD968]();
}

uint64_t sub_2489A7F20()
{
  return MEMORY[0x24BDCD9F8]();
}

uint64_t sub_2489A7F2C()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_2489A7F38()
{
  return MEMORY[0x24BDCDBE0]();
}

uint64_t sub_2489A7F44()
{
  return MEMORY[0x24BDCDBF8]();
}

uint64_t sub_2489A7F50()
{
  return MEMORY[0x24BDCDC10]();
}

uint64_t sub_2489A7F5C()
{
  return MEMORY[0x24BDCDD40]();
}

uint64_t sub_2489A7F68()
{
  return MEMORY[0x24BDCDD78]();
}

uint64_t sub_2489A7F74()
{
  return MEMORY[0x24BDCDD88]();
}

uint64_t sub_2489A7F80()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2489A7F8C()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_2489A7F98()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2489A7FA4()
{
  return MEMORY[0x24BDDFEB0]();
}

uint64_t sub_2489A7FB0()
{
  return MEMORY[0x24BDDFF08]();
}

uint64_t sub_2489A7FBC()
{
  return MEMORY[0x24BDDFF20]();
}

uint64_t sub_2489A7FC8()
{
  return MEMORY[0x24BDDFF68]();
}

uint64_t sub_2489A7FD4()
{
  return MEMORY[0x24BDDFF90]();
}

uint64_t sub_2489A7FE0()
{
  return MEMORY[0x24BDDFF98]();
}

uint64_t sub_2489A7FEC()
{
  return MEMORY[0x24BDDFFD8]();
}

uint64_t sub_2489A7FF8()
{
  return MEMORY[0x24BDDFFE8]();
}

uint64_t sub_2489A8004()
{
  return MEMORY[0x24BDDFFF0]();
}

uint64_t sub_2489A8010()
{
  return MEMORY[0x24BDE0030]();
}

uint64_t sub_2489A801C()
{
  return MEMORY[0x24BDE0190]();
}

uint64_t sub_2489A8028()
{
  return MEMORY[0x24BDE01B8]();
}

uint64_t sub_2489A8034()
{
  return MEMORY[0x24BDE01D0]();
}

uint64_t sub_2489A8040()
{
  return MEMORY[0x24BDE01F0]();
}

uint64_t sub_2489A804C()
{
  return MEMORY[0x24BDE02E0]();
}

uint64_t sub_2489A8058()
{
  return MEMORY[0x24BDE02E8]();
}

uint64_t sub_2489A8064()
{
  return MEMORY[0x24BDE02F0]();
}

uint64_t sub_2489A8070()
{
  return MEMORY[0x24BDE0328]();
}

uint64_t sub_2489A807C()
{
  return MEMORY[0x24BDE0340]();
}

uint64_t sub_2489A8088()
{
  return MEMORY[0x24BDE0348]();
}

uint64_t sub_2489A8094()
{
  return MEMORY[0x24BDE0350]();
}

uint64_t sub_2489A80A0()
{
  return MEMORY[0x24BDE0358]();
}

uint64_t sub_2489A80AC()
{
  return MEMORY[0x24BDE0360]();
}

uint64_t sub_2489A80B8()
{
  return MEMORY[0x24BDE0378]();
}

uint64_t sub_2489A80C4()
{
  return MEMORY[0x24BDE03B0]();
}

uint64_t sub_2489A80D0()
{
  return MEMORY[0x24BDE03B8]();
}

uint64_t sub_2489A80DC()
{
  return MEMORY[0x24BDE03C0]();
}

uint64_t sub_2489A80E8()
{
  return MEMORY[0x24BDE03D8]();
}

uint64_t sub_2489A80F4()
{
  return MEMORY[0x24BDE03F0]();
}

uint64_t sub_2489A8100()
{
  return MEMORY[0x24BDE0528]();
}

uint64_t sub_2489A810C()
{
  return MEMORY[0x24BDE0530]();
}

uint64_t sub_2489A8118()
{
  return MEMORY[0x24BDE0540]();
}

uint64_t sub_2489A8124()
{
  return MEMORY[0x24BDE0550]();
}

uint64_t sub_2489A8130()
{
  return MEMORY[0x24BDE0558]();
}

uint64_t sub_2489A813C()
{
  return MEMORY[0x24BDE0570]();
}

uint64_t sub_2489A8148()
{
  return MEMORY[0x24BDE0578]();
}

uint64_t sub_2489A8154()
{
  return MEMORY[0x24BDE0580]();
}

uint64_t sub_2489A8160()
{
  return MEMORY[0x24BDE0588]();
}

uint64_t sub_2489A816C()
{
  return MEMORY[0x24BDE0590]();
}

uint64_t sub_2489A8178()
{
  return MEMORY[0x24BDE0598]();
}

uint64_t sub_2489A8184()
{
  return MEMORY[0x24BDE05A0]();
}

uint64_t sub_2489A8190()
{
  return MEMORY[0x24BDE0688]();
}

uint64_t sub_2489A819C()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_2489A81A8()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_2489A81B4()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_2489A81C0()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_2489A81CC()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_2489A81D8()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_2489A81E4()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_2489A81F0()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2489A81FC()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_2489A8208()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_2489A8214()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2489A8220()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_2489A822C()
{
  return MEMORY[0x24BEE0A30]();
}

uint64_t sub_2489A8238()
{
  return MEMORY[0x24BEE0AD0]();
}

uint64_t sub_2489A8244()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_2489A8250()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2489A825C()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_2489A8268()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2489A8274()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_2489A8280()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_2489A828C()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_2489A8298()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_2489A82A4()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_2489A82B0()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_2489A82BC()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_2489A82C8()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_2489A82D4()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_2489A82E0()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_2489A82EC()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_2489A82F8()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2489A8304()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_2489A8310()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_2489A831C()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_2489A8328()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_2489A8334()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_2489A8340()
{
  return MEMORY[0x24BEE5920]();
}

uint64_t sub_2489A834C()
{
  return MEMORY[0x24BEE5928]();
}

uint64_t sub_2489A8358()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_2489A8364()
{
  return MEMORY[0x24BEE1E70]();
}

uint64_t sub_2489A8370()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2489A837C()
{
  return MEMORY[0x24BEE1F28]();
}

uint64_t sub_2489A8388()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2489A8394()
{
  return MEMORY[0x24BEE2090]();
}

uint64_t sub_2489A83A0()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_2489A83AC()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_2489A83B8()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_2489A83C4()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2489A83D0()
{
  return MEMORY[0x24BEE25B8]();
}

uint64_t sub_2489A83DC()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_2489A83E8()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2489A83F4()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_2489A8400()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2489A840C()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_2489A8418()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2489A8424()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_2489A8430()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_2489A843C()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_2489A8448()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2489A8454()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_2489A8460()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_2489A846C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2489A8478()
{
  return MEMORY[0x24BEE3B98]();
}

uint64_t sub_2489A8484()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_2489A8490()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_2489A849C()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_2489A84A8()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_2489A84B4()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_2489A84C0()
{
  return MEMORY[0x24BEE42C0]();
}

uint64_t sub_2489A84CC()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_2489A84D8()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2489A84E4()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2489A84F0()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_2489A84FC()
{
  return MEMORY[0x24BEE4328]();
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

uint64_t __memcpy_chk()
{
  return MEMORY[0x24BDAC848]();
}

const mach_header *__cdecl _dyld_get_image_header(uint32_t image_index)
{
  return (const mach_header *)MEMORY[0x24BDACA38](*(_QWORD *)&image_index);
}

uint32_t _dyld_image_count(void)
{
  return MEMORY[0x24BDACA78]();
}

uint64_t _os_crash()
{
  return MEMORY[0x24BDACB50]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x24BDAD2E0](*(_QWORD *)&bp, service_name, sp);
}

kern_return_t bootstrap_register(mach_port_t bp, name_t service_name, mach_port_t sp)
{
  return MEMORY[0x24BDAD2F8](*(_QWORD *)&bp, service_name, *(_QWORD *)&sp);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

uint64_t dispatch_mach_cancel()
{
  return MEMORY[0x24BDADE40]();
}

uint64_t dispatch_mach_connect()
{
  return MEMORY[0x24BDADE48]();
}

uint64_t dispatch_mach_create()
{
  return MEMORY[0x24BDADE50]();
}

uint64_t dispatch_mach_msg_create()
{
  return MEMORY[0x24BDADE68]();
}

uint64_t dispatch_mach_msg_get_msg()
{
  return MEMORY[0x24BDADE70]();
}

uint64_t dispatch_mach_send()
{
  return MEMORY[0x24BDADE78]();
}

uint64_t dispatch_mach_send_and_wait_for_reply()
{
  return MEMORY[0x24BDADE80]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x24BDADF20](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

uint64_t exclaves_endpoint_call()
{
  return MEMORY[0x24BDAE1F8]();
}

uint64_t exclaves_launch_conclave()
{
  return MEMORY[0x24BDAE210]();
}

uint64_t exclaves_lookup_service()
{
  return MEMORY[0x24BDAE218]();
}

uint64_t exclaves_notification_create()
{
  return MEMORY[0x24BDAE220]();
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint8_t *__cdecl getsectiondata(const mach_header_64 *mhp, const char *segname, const char *sectname, unint64_t *size)
{
  return (uint8_t *)MEMORY[0x24BDAE748](mhp, segname, sectname, size);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x24BDAEB48]();
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x24BDAEBA0](*(_QWORD *)&task, *(_QWORD *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x24BDAEBB0](*(_QWORD *)&task, *(_QWORD *)&name);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x24BDAEBE8](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&poly, *(_QWORD *)&polyPoly);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED88](ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8C0](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x24BDAF8C8](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x24BDAFF70](__dst, __src, __n);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x24BEE4DE0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x24BEE4EB0]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x24BEE4F10]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x24BEE4F30]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x24BEE4F68]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x24BEE4F78]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x24BEE4F88]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x24BEE4FB0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x24BEE4FC8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x24BEE4FD0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x24BEE4FD8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x24BEE5028]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x24BEE5030]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x24BEE5038]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

kern_return_t task_get_special_port(task_inspect_t task, int which_port, mach_port_t *special_port)
{
  return MEMORY[0x24BDB0170](*(_QWORD *)&task, *(_QWORD *)&which_port, special_port);
}

