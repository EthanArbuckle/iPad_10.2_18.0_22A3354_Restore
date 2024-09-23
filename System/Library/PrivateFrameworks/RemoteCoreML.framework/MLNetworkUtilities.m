@implementation MLNetworkUtilities

void __59___MLNetworkUtilities_setupBonjour_name_useBonjour_useUDP___block_invoke(uint64_t a1, void *a2, int a3)
{
  NSObject *v5;
  NSObject *v6;
  void *v7;
  const char *v8;
  const char *bonjour_service_name;
  const char *v10;
  int v11;
  const char *v12;
  int v13;
  void *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  +[_MLLog common](_MLLog, "common");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3)
      v8 = "added";
    else
      v8 = "removed";
    bonjour_service_name = nw_endpoint_get_bonjour_service_name(v5);
    v10 = nw_endpoint_get_bonjour_service_name(v5);
    v11 = *(unsigned __int8 *)(a1 + 40);
    v13 = 138413570;
    v14 = v7;
    if (v11)
      v12 = "_nwcat._udp";
    else
      v12 = "_nwcat._tcp";
    v15 = 2080;
    v16 = v8;
    v17 = 2080;
    v18 = bonjour_service_name;
    v19 = 2080;
    v20 = v10;
    v21 = 2080;
    v22 = v12;
    v23 = 2080;
    v24 = "local";
    _os_log_debug_impl(&dword_229FCB000, v6, OS_LOG_TYPE_DEBUG, "%@: Listener %s on %s (%s.%s.%s)", (uint8_t *)&v13, 0x3Eu);

  }
}

void __62___MLNetworkUtilities_setupListenerStateChangeHandler_useUDP___block_invoke(uint64_t a1, int a2, void *a3)
{
  NSObject *v5;
  NSObject *v6;
  int error_code;
  NSObject *v8;

  v5 = a3;
  v6 = v5;
  if (v5)
    error_code = nw_error_get_error_code(v5);
  else
    error_code = 0;
  *__error() = error_code;
  switch(a2)
  {
    case 3:
      +[_MLLog common](_MLLog, "common");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        __62___MLNetworkUtilities_setupListenerStateChangeHandler_useUDP___block_invoke_cold_2(a1, v8);
      goto LABEL_13;
    case 2:
      +[_MLLog common](_MLLog, "common");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        __62___MLNetworkUtilities_setupListenerStateChangeHandler_useUDP___block_invoke_cold_3(a1);
      goto LABEL_13;
    case 1:
      +[_MLLog common](_MLLog, "common");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        __62___MLNetworkUtilities_setupListenerStateChangeHandler_useUDP___block_invoke_cold_1(a1);
LABEL_13:

      break;
  }

}

void __36___MLNetworkUtilities_configureTLS___block_invoke(uint64_t a1, id a2)
{
  const void *v3;
  size_t v4;
  NSObject *v5;
  NSObject *options;

  options = a2;
  v3 = (const void *)objc_msgSend(*(id *)(a1 + 32), "psk");
  v4 = strlen((const char *)objc_msgSend(*(id *)(a1 + 32), "psk"));
  v5 = dispatch_data_create(v3, v4, 0, 0);
  sec_protocol_options_add_pre_shared_key(options, v5, v5);
  sec_protocol_options_append_tls_ciphersuite(options, (tls_ciphersuite_t)0xA8u);

}

void __62___MLNetworkUtilities_setupListenerStateChangeHandler_useUDP___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  NSStringFromSelector(*(SEL *)(a1 + 40));
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_229FCB000, v2, v3, "%@: Listener on port %u (%s) waiting", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2();
}

void __62___MLNetworkUtilities_setupListenerStateChangeHandler_useUDP___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4;
  void *v5;
  const char *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  NSStringFromSelector(*(SEL *)(a1 + 40));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = "udp";
  if (!*(_BYTE *)(a1 + 48))
    v6 = "tcp";
  v7 = 138412546;
  v8 = v4;
  v9 = 2080;
  v10 = v6;
  _os_log_debug_impl(&dword_229FCB000, a2, OS_LOG_TYPE_DEBUG, "%@: listener (%s) failed", (uint8_t *)&v7, 0x16u);

}

void __62___MLNetworkUtilities_setupListenerStateChangeHandler_useUDP___block_invoke_cold_3(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  NSStringFromSelector(*(SEL *)(a1 + 40));
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_229FCB000, v2, v3, "%@: Listener on port %u (%s) ready!", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2();
}

@end
