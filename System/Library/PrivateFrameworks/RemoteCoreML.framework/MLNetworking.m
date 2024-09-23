@implementation MLNetworking

void __32___MLNetworking_startConnection__block_invoke(uint64_t a1, int a2, void *a3)
{
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  int error_code;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  const char *hostname;
  int port;
  void *v14;
  int v15;
  const char *v16;
  const char *v17;
  const char *v18;
  int v19;
  int v20;
  const char *v21;
  const char *v22;
  int v23;
  int v24;
  const char *v25;
  int v26;
  void *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = nw_connection_copy_endpoint(v6);

  if (v5)
  {
    error_code = nw_error_get_error_code(v5);
    *__error() = error_code;
    objc_msgSend(*(id *)(a1 + 32), "logType");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __32___MLNetworking_startConnection__block_invoke_cold_2(a1);

  }
  else
  {
    *__error() = 0;
  }
  switch(a2)
  {
    case 1:
      objc_msgSend(*(id *)(a1 + 32), "logType");
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        goto LABEL_23;
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      hostname = nw_endpoint_get_hostname(v7);
      port = nw_endpoint_get_port(v7);
      objc_msgSend(*(id *)(a1 + 32), "nwOptions");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "useUDP");
      v16 = "tcp";
      v26 = 138413058;
      v27 = v11;
      v28 = 2080;
      if (v15)
        v16 = "udp";
      v29 = hostname;
      v30 = 1024;
      v31 = port;
      v32 = 2080;
      v33 = v16;
      v17 = "%@: connect to %s port %u (%s) failed, is waiting";
      goto LABEL_20;
    case 3:
      objc_msgSend(*(id *)(a1 + 32), "logType");
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        goto LABEL_23;
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = nw_endpoint_get_hostname(v7);
      v19 = nw_endpoint_get_port(v7);
      objc_msgSend(*(id *)(a1 + 32), "nwOptions");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v14, "useUDP");
      v21 = "tcp";
      v26 = 138413058;
      v27 = v11;
      v28 = 2080;
      if (v20)
        v21 = "udp";
      v29 = v18;
      v30 = 1024;
      v31 = v19;
      v32 = 2080;
      v33 = v21;
      _os_log_impl(&dword_229FCB000, v10, OS_LOG_TYPE_INFO, "%@: Connection to %s port %u (%s) succeeded!", (uint8_t *)&v26, 0x26u);
      break;
    case 4:
      objc_msgSend(*(id *)(a1 + 32), "logType");
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        goto LABEL_23;
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = nw_endpoint_get_hostname(v7);
      v23 = nw_endpoint_get_port(v7);
      objc_msgSend(*(id *)(a1 + 32), "nwOptions");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v14, "useUDP");
      v25 = "tcp";
      v26 = 138413058;
      v27 = v11;
      v28 = 2080;
      if (v24)
        v25 = "udp";
      v29 = v22;
      v30 = 1024;
      v31 = v23;
      v32 = 2080;
      v33 = v25;
      v17 = "%@: connect to %s port %u (%s) failed";
LABEL_20:
      _os_log_debug_impl(&dword_229FCB000, v10, OS_LOG_TYPE_DEBUG, v17, (uint8_t *)&v26, 0x26u);
      break;
    case 5:
      objc_msgSend(*(id *)(a1 + 32), "logType");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        __32___MLNetworking_startConnection__block_invoke_cold_1(a1);
      goto LABEL_23;
    default:
      goto LABEL_24;
  }

LABEL_23:
LABEL_24:

}

void __48___MLNetworking_setListenerReceiveDataCallBack___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "logType");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __48___MLNetworking_setListenerReceiveDataCallBack___block_invoke_cold_1(a1);

  objc_msgSend(*(id *)(a1 + 32), "setConnection:", v3);
  objc_msgSend(*(id *)(a1 + 32), "startConnection");
  objc_msgSend(*(id *)(a1 + 32), "receiveLoop:", *(_QWORD *)(a1 + 40));

}

void __26___MLNetworking_sendData___block_invoke(uint64_t a1, nw_error_t error)
{
  int error_code;
  NSObject *v4;

  if (error)
  {
    error_code = nw_error_get_error_code(error);
    *__error() = error_code;
    objc_msgSend(*(id *)(a1 + 32), "logType");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __26___MLNetworking_sendData___block_invoke_cold_2(a1);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "logType");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __26___MLNetworking_sendData___block_invoke_cold_1(a1);
  }

}

void __29___MLNetworking_receiveLoop___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void (**v16)(_QWORD);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  char v26;

  v9 = a2;
  v10 = a3;
  v11 = a5;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __29___MLNetworking_receiveLoop___block_invoke_2;
  v20[3] = &unk_24F357040;
  v26 = a4;
  v12 = v10;
  v13 = *(_QWORD *)(a1 + 32);
  v21 = v12;
  v22 = v13;
  v25 = *(_QWORD *)(a1 + 48);
  v14 = v11;
  v23 = v14;
  v24 = *(id *)(a1 + 40);
  v15 = MEMORY[0x22E2DB7F4](v20);
  v16 = (void (**)(_QWORD))v15;
  if (v9)
  {
    v17 = MEMORY[0x22E2DB7F4](v15);

    (*(void (**)(_QWORD, id, id, uint64_t, id, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v9, v12, a4, v14, v18, v19);
    v16 = (void (**)(_QWORD))v17;
  }
  v16[2](v16);

}

void __29___MLNetworking_receiveLoop___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  int v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 72) && (v2 = *(NSObject **)(a1 + 32)) != 0 && nw_content_context_get_is_final(v2))
  {
    objc_msgSend(*(id *)(a1 + 40), "logType");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = *(unsigned __int8 *)(a1 + 72);
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138412802;
      v8 = v4;
      v9 = 1024;
      v10 = v5;
      v11 = 2048;
      v12 = v6;
      _os_log_debug_impl(&dword_229FCB000, v3, OS_LOG_TYPE_DEBUG, "%@: complete disconnect is_complete=%d ,context=%p", (uint8_t *)&v7, 0x1Cu);

    }
  }
  else if (!*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 40), "receiveLoop:", *(_QWORD *)(a1 + 56));
  }
}

void __32___MLNetworking_startConnection__block_invoke_cold_1(uint64_t a1)
{
  const char *v1;
  void *v2;
  os_log_t v3;
  os_log_type_t v4;
  const char *v5;
  uint8_t *v6;
  void *v7;

  v1 = (const char *)OUTLINED_FUNCTION_5(a1);
  NSStringFromSelector(v1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(v2, v3, v4, v5, v6, 0xCu);

  OUTLINED_FUNCTION_1_0();
}

void __32___MLNetworking_startConnection__block_invoke_cold_2(uint64_t a1)
{
  void *v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v2 = (const char *)OUTLINED_FUNCTION_5(a1);
  NSStringFromSelector(v2);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_229FCB000, v3, v4, "%@: Start connection error code=%d", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

void __48___MLNetworking_setListenerReceiveDataCallBack___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  os_log_t v2;
  os_log_type_t v3;
  const char *v4;
  uint8_t *v5;
  void *v6;

  NSStringFromSelector(*(SEL *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(v1, v2, v3, v4, v5, 0x16u);

}

void __26___MLNetworking_sendData___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  const char *v2;
  void *v3;
  os_log_t v4;
  os_log_type_t v5;
  const char *v6;
  uint8_t *v7;

  v2 = (const char *)OUTLINED_FUNCTION_5(a1);
  NSStringFromSelector(v2);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(v3, v4, v5, v6, v7, 0x12u);

  OUTLINED_FUNCTION_1_0();
}

void __26___MLNetworking_sendData___block_invoke_cold_2(uint64_t a1)
{
  void *v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v2 = (const char *)OUTLINED_FUNCTION_5(a1);
  NSStringFromSelector(v2);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_229FCB000, v3, v4, "%@: send error code=%d.", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

@end
