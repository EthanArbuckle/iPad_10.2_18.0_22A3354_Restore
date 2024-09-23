void _bsd_log_spd(uint64_t a1, char *a2, ...)
{
  va_list va;

  va_start(va, a2);
  if (_bsd_log_spd_once != -1)
    dispatch_once(&_bsd_log_spd_once, &__block_literal_global);
  if (_bsd_log_spd_alt_logger)
    _bsd_log_spd_alt_logger(a1, a2, va);
  else
    vsyslog(a1, a2, va);
}

void *___bsd_log_spd_block_invoke()
{
  void *result;

  result = dlsym((void *)0xFFFFFFFFFFFFFFFELL, "_bsd_alt_log");
  _bsd_log_spd_alt_logger = (uint64_t (*)(_QWORD, _QWORD, _QWORD))result;
  return result;
}

uint64_t _spd_os_log()
{
  if (_spd_os_log_onceToken != -1)
    dispatch_once(&_spd_os_log_onceToken, &__block_literal_global_3);
  return _spd_os_log_gOSLog;
}

os_log_t ___spd_os_log_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.network.spd", (const char *)&unk_21323E9ED);
  _spd_os_log_gOSLog = (uint64_t)result;
  return result;
}

uint64_t spd_client_session_queue()
{
  if (spd_client_session_queue_once != -1)
    dispatch_once(&spd_client_session_queue_once, &__block_literal_global_0);
  return spd_client_session_queue_queue;
}

dispatch_queue_t __spd_client_session_queue_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("com.apple.libspd.client-sessions", 0);
  spd_client_session_queue_queue = (uint64_t)result;
  return result;
}

uint64_t spd_register_for_notifications(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t result;

  if (!a1)
    return 4;
  if (_spd_helper_send_async(10, 0, 0xFFFFFFFF))
  {
    v2 = _spd_os_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      spd_register_for_notifications_cold_1();
  }
  v3 = _s_spd_notification_client_sessions;
  *a1 = _s_spd_notification_client_sessions;
  if (v3)
    *(_QWORD *)(v3 + 8) = a1;
  result = 0;
  _s_spd_notification_client_sessions = (uint64_t)a1;
  a1[1] = &_s_spd_notification_client_sessions;
  return result;
}

uint64_t _spd_helper_send_async(int64_t a1, const unsigned __int8 *a2, unsigned int a3)
{
  void *message;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  const void *v10;
  uint64_t v11;
  _QWORD aBlock[2];
  void (*v14)(uint64_t);
  void *v15;
  uint64_t *v16;
  void *v17;
  int64_t v18;
  const unsigned __int8 *v19;
  int v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  int v25;
  uint8_t buf[8];
  uint64_t v27;
  uint64_t (*v28)(uint64_t);
  void *v29;
  uint64_t v30;
  _QWORD *v31;

  v22 = 0;
  v23 = &v22;
  v24 = 0x2000000000;
  v25 = 0;
  message = _spd_helper_create_message(a1, -1, a2, a3);
  if (message)
  {
    v7 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 0x40000000;
    v14 = ___spd_helper_send_async_block_invoke;
    v15 = &unk_24CF70380;
    v18 = a1;
    v19 = a2;
    v20 = -1;
    v21 = a3;
    v16 = &v22;
    v17 = message;
    pthread_mutex_lock(&_spd_connection_mutex);
    _spd_xpc_init_locked();
    if (_spd_connection)
    {
      pthread_mutex_unlock(&_spd_connection_mutex);
      v8 = _spd_os_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21323C000, v8, OS_LOG_TYPE_INFO, "Executing when_connected block immediately.", buf, 2u);
      }
      v14((uint64_t)aBlock);
    }
    else
    {
      v9 = _spd_os_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21323C000, v9, OS_LOG_TYPE_INFO, "Enqueuing when_connected block.", buf, 2u);
      }
      v10 = (const void *)_spd_pending;
      if (_spd_pending)
      {
        *(_QWORD *)buf = v7;
        v27 = 0x40000000;
        v28 = ___spd_when_connected_block_invoke;
        v29 = &unk_24CF703A8;
        v30 = _spd_pending;
        v31 = aBlock;
        _spd_pending = (uint64_t)_Block_copy(buf);
        _Block_release(v10);
      }
      else
      {
        _spd_pending = (uint64_t)_Block_copy(aBlock);
      }
      pthread_mutex_unlock(&_spd_connection_mutex);
    }
  }
  v11 = *((unsigned int *)v23 + 6);
  _Block_object_dispose(&v22, 8);
  return v11;
}

uint64_t spd_deregister_for_notifications(uint64_t *a1)
{
  uint64_t v2;
  const void *v3;
  const void *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;

  if (a1)
  {
    v2 = *a1;
    if (*a1)
      *(_QWORD *)(v2 + 8) = a1[1];
    *(_QWORD *)a1[1] = v2;
    v3 = (const void *)a1[3];
    if (v3)
      _Block_release(v3);
    v4 = (const void *)a1[4];
    if (v4)
      _Block_release(v4);
    free(a1);
    v5 = _spd_helper_send_async(11, 0, 0xFFFFFFFF);
    if ((_DWORD)v5)
    {
      v6 = _spd_os_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        spd_deregister_for_notifications_cold_2();
    }
  }
  else
  {
    v7 = _spd_os_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      spd_deregister_for_notifications_cold_1();
    return 4;
  }
  return v5;
}

uint64_t spd_checkin_socket(int a1, unsigned __int8 *a2)
{
  int64_t int64;
  void *message;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  xpc_object_t v10;
  int v11;
  char v12;
  char v13;
  _xpc_connection_s *v14;
  NSObject *v15;
  xpc_object_t v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  const unsigned __int8 *uuid;
  const unsigned __int8 *v22;
  unsigned __int8 *v23;
  char v24;
  _BYTE v25[15];
  char v26;
  _BYTE v27[15];
  timespec v28;
  char v29;
  _BYTE v30[15];
  sockaddr v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  if (dyld_program_sdk_at_least())
    spd_checkin_socket_cold_1();
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = (sockaddr)0;
  v32 = 0u;
  LODWORD(v28.tv_sec) = 128;
  if (getsockname(a1, &v31, (socklen_t *)&v28))
    return 5;
  LODWORD(v28.tv_sec) = 128;
  if (getpeername(a1, &v31, (socklen_t *)&v28))
    return 5;
  message = _spd_helper_create_message(40, a1, 0, 0xFFFFFFFF);
  if (!message)
    return 5;
  v7 = message;
  v8 = MEMORY[0x2199AE8E4]();
  v9 = MEMORY[0x24BDACFA0];
  if (v8 == MEMORY[0x24BDACFA0])
  {
    v23 = a2;
    v11 = 0;
    v12 = 1;
LABEL_10:
    v13 = v12;
    pthread_mutex_lock(&_spd_connection_mutex);
    while (1)
    {
      v14 = (_xpc_connection_s *)_spd_connection;
      if (_spd_connection)
        break;
      if ((_spd_xpc_init_locked() & 1) == 0)
      {
        v19 = _spd_os_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          spd_checkin_socket_cold_4(&v29, v30);
LABEL_22:
        pthread_mutex_unlock(&_spd_connection_mutex);
        v20 = _spd_os_log();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          spd_checkin_socket_cold_2(&v24, v25);
LABEL_24:
        v12 = 0;
        v11 = 1;
        if ((v13 & 1) != 0)
          goto LABEL_10;
        goto LABEL_29;
      }
      *(_QWORD *)&v31.sa_len = 0;
      *(_QWORD *)&v31.sa_data[6] = 0;
      v28.tv_sec = 0;
      v28.tv_nsec = 0;
      gettimeofday((timeval *)&v31, 0);
      v28.tv_sec = *(_QWORD *)&v31.sa_len + 2;
      v28.tv_nsec = 0;
      if (pthread_cond_timedwait(&_spd_connection_cond, &_spd_connection_mutex, &v28) == 60)
      {
        v15 = _spd_os_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          spd_checkin_socket_cold_3(&v26, v27);
        goto LABEL_22;
      }
    }
    xpc_retain((xpc_object_t)_spd_connection);
    pthread_mutex_unlock(&_spd_connection_mutex);
    v16 = xpc_connection_send_message_with_reply_sync(v14, v7);
    if (MEMORY[0x2199AE8E4]() != v9)
    {
      v17 = v9;
      v18 = _spd_os_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)&v31.sa_len = 67109120;
        *(_DWORD *)&v31.sa_data[2] = v11;
        _os_log_error_impl(&dword_21323C000, v18, OS_LOG_TYPE_ERROR, "Attempt #%d: got error when sending message!", &v31.sa_len, 8u);
      }
      xpc_release(v16);
      xpc_release(v14);
      v9 = v17;
      goto LABEL_24;
    }
    xpc_release(v14);
    if (!v16)
    {
LABEL_29:
      v10 = 0;
      int64 = 5;
      a2 = v23;
      goto LABEL_32;
    }
    a2 = v23;
    if (xpc_dictionary_get_value(v16, "result"))
      int64 = xpc_dictionary_get_int64(v16, "result");
    else
      int64 = 5;
    v10 = xpc_retain(v16);
    xpc_release(v16);
  }
  else
  {
    v10 = 0;
    int64 = 5;
  }
LABEL_32:
  xpc_release(v7);
  if ((_DWORD)int64 || !v10)
  {
    if (!v10)
      return int64;
  }
  else
  {
    uuid = xpc_dictionary_get_uuid(v10, "uuid");
    if (uuid && (v22 = uuid, !uuid_is_null(uuid)))
    {
      uuid_copy(a2, v22);
      int64 = 0;
    }
    else
    {
      int64 = 5;
    }
  }
  xpc_release(v10);
  return int64;
}

uint64_t spd_checkout_socket(const unsigned __int8 *a1)
{
  return _spd_helper_send_async(41, a1, 0xFFFFFFFF);
}

uint64_t spd_checkout_all_sockets()
{
  return _spd_helper_send_async(42, 0, 0xFFFFFFFF);
}

uint64_t spd_start_monitoring_socket(const unsigned __int8 *a1)
{
  return _spd_helper_send_async(30, a1, 0xFFFFFFFF);
}

uint64_t spd_stop_monitoring_socket(const unsigned __int8 *a1)
{
  return _spd_helper_send_async(31, a1, 0xFFFFFFFF);
}

uint64_t spd_start_monitoring_all_sockets()
{
  pid_t v0;

  v0 = getpid();
  return _spd_helper_send_async(20, 0, v0);
}

uint64_t spd_start_monitoring_all_sockets_for_pid(unsigned int a1)
{
  return _spd_helper_send_async(20, 0, a1);
}

uint64_t spd_stop_monitoring_all_sockets()
{
  pid_t v0;

  v0 = getpid();
  return _spd_helper_send_async(21, 0, v0);
}

uint64_t spd_stop_monitoring_all_sockets_for_pid(unsigned int a1)
{
  return _spd_helper_send_async(21, 0, a1);
}

void *_spd_helper_create_message(int64_t a1, int a2, const unsigned __int8 *a3, unsigned int a4)
{
  xpc_object_t v8;
  void *v9;
  char v10;
  char v11;

  v8 = xpc_dictionary_create(0, 0, 0);
  v9 = v8;
  if (v8)
  {
    xpc_dictionary_set_int64(v8, "msg_type", a1);
    v10 = dyld_program_sdk_at_least();
    xpc_dictionary_set_BOOL(v9, "legacy", v10 != 1);
    v11 = dyld_program_sdk_at_least();
    xpc_dictionary_set_BOOL(v9, "modern", v11);
    if (a2 != -1)
      xpc_dictionary_set_fd(v9, "socket", a2);
    if (a3)
      xpc_dictionary_set_uuid(v9, "uuid", a3);
    if ((a4 & 0x80000000) == 0)
      xpc_dictionary_set_int64(v9, "pid", a4);
  }
  return v9;
}

void ___spd_helper_send_async_block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  NSObject *v4;
  void *v5;

  if (_spd_connection)
  {
    xpc_connection_send_message((xpc_connection_t)_spd_connection, *(xpc_object_t *)(a1 + 40));
    v2 = _spd_os_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      ___spd_helper_send_async_block_invoke_cold_2(a1, v2);
    v3 = 0;
  }
  else
  {
    v4 = _spd_os_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      ___spd_helper_send_async_block_invoke_cold_1();
    v3 = 5;
  }
  v5 = *(void **)(a1 + 40);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3;
  xpc_release(v5);
}

uint64_t _spd_xpc_init_locked()
{
  uint64_t v0;
  xpc_object_t v1;
  void *v2;
  pid_t v3;

  if (_spd_xpc_init_locked_once != -1)
    dispatch_once(&_spd_xpc_init_locked_once, &__block_literal_global_6);
  v0 = 1;
  if ((_spd_connection_in_progress & 1) == 0 && !_spd_connection)
  {
    _spd_connection_in_progress = 1;
    v1 = xpc_dictionary_create(0, 0, 0);
    if (v1)
    {
      v2 = v1;
      v0 = 1;
      xpc_dictionary_set_int64(v1, "msg_type", 1);
      v3 = getpid();
      xpc_dictionary_set_int64(v2, "pid", v3);
      xpc_set_event();
      xpc_release(v2);
    }
    else
    {
      return 0;
    }
  }
  return v0;
}

uint64_t ___spd_when_connected_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void ___spd_xpc_init_locked_block_invoke()
{
  NSObject *v0;

  v0 = _spd_os_log();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    ___spd_xpc_init_locked_block_invoke_cold_1();
  if (_spd_helper_queue_once != -1)
    dispatch_once(&_spd_helper_queue_once, &__block_literal_global_8);
  xpc_set_event_stream_handler("com.apple.spd.matching", (dispatch_queue_t)_spd_helper_queue_queue, &__block_literal_global_12);
}

dispatch_queue_t ___spd_helper_queue_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("com.apple.libspd.internal-queue", 0);
  _spd_helper_queue_queue = (uint64_t)result;
  return result;
}

void spd_xpc_event_stream_handler_block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  _xpc_connection_s *connection;
  _xpc_connection_s *v5;
  void (**v6)(_QWORD);
  NSObject *v7;
  NSObject *v8;
  uint8_t v9[8];
  _QWORD handler[5];

  v3 = _spd_os_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    spd_xpc_event_stream_handler_block_invoke_cold_2();
  connection = xpc_dictionary_create_connection(a2, "connection");
  if (connection)
  {
    v5 = connection;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 0x40000000;
    handler[2] = spd_xpc_event_stream_handler_block_invoke_2;
    handler[3] = &__block_descriptor_tmp_15;
    handler[4] = connection;
    xpc_connection_set_event_handler(connection, handler);
    if (_spd_helper_queue_once != -1)
      dispatch_once(&_spd_helper_queue_once, &__block_literal_global_8);
    xpc_connection_set_target_queue(v5, (dispatch_queue_t)_spd_helper_queue_queue);
    pthread_mutex_lock(&_spd_connection_mutex);
    if (_spd_connection)
      _spd_xpc_cleanup_locked();
    _spd_connection_in_progress = 0;
    _spd_connection = (uint64_t)v5;
    xpc_connection_resume(v5);
    v6 = (void (**)(_QWORD))_spd_pending;
    _spd_pending = 0;
    pthread_cond_broadcast(&_spd_connection_cond);
    pthread_mutex_unlock(&_spd_connection_mutex);
    if (v6)
    {
      v7 = _spd_os_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_21323C000, v7, OS_LOG_TYPE_INFO, "Executing pending block(s).", v9, 2u);
      }
      v6[2](v6);
      _Block_release(v6);
    }
  }
  else
  {
    v8 = _spd_os_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      spd_xpc_event_stream_handler_block_invoke_cold_1();
  }
}

void spd_xpc_event_stream_handler_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4;
  int64_t int64;
  int v6;
  const char *string;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD block[4];
  int v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = MEMORY[0x2199AE8E4](a2);
  if (v4 == MEMORY[0x24BDACFB8])
  {
    pthread_mutex_lock(&_spd_connection_mutex);
    if (_spd_connection == *(_QWORD *)(a1 + 32))
    {
      string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x24BDACF40]);
      v8 = _spd_os_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = "???";
        if (string)
          v9 = string;
        *(_DWORD *)buf = 136315138;
        v15 = v9;
        _os_log_impl(&dword_21323C000, v8, OS_LOG_TYPE_DEFAULT, "XPC connection is gone, reason: %s", buf, 0xCu);
      }
      _spd_xpc_cleanup_locked();
    }
    pthread_mutex_unlock(&_spd_connection_mutex);
  }
  else if (v4 == MEMORY[0x24BDACFA0])
  {
    int64 = xpc_dictionary_get_int64(a2, "msg_type");
    if (int64 == 50)
    {
      v6 = xpc_dictionary_get_int64(a2, "pid");
      if (spd_client_session_queue_once != -1)
        dispatch_once(&spd_client_session_queue_once, &__block_literal_global_0);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 0x40000000;
      block[2] = spd_xpc_event_stream_handler_block_invoke_3;
      block[3] = &__block_descriptor_tmp_14;
      v13 = v6;
      dispatch_async((dispatch_queue_t)spd_client_session_queue_queue, block);
    }
    else
    {
      v10 = int64;
      v11 = _spd_os_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        spd_xpc_event_stream_handler_block_invoke_2_cold_1(v10, v11);
    }
  }
}

void _spd_xpc_cleanup_locked()
{
  if (_spd_connection)
  {
    xpc_connection_cancel((xpc_connection_t)_spd_connection);
    xpc_release((xpc_object_t)_spd_connection);
    _spd_connection = 0;
    _spd_connection_in_progress = 0;
    if (spd_client_session_queue_once != -1)
      dispatch_once(&spd_client_session_queue_once, &__block_literal_global_0);
    dispatch_async((dispatch_queue_t)spd_client_session_queue_queue, &__block_literal_global_17);
  }
  else
  {
    _spd_connection_in_progress = 0;
  }
}

void spd_xpc_event_stream_handler_block_invoke_3(uint64_t a1)
{
  _QWORD *v1;
  int v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD block[5];
  int v8;
  uint8_t buf[4];
  _QWORD *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v1 = (_QWORD *)_s_spd_notification_client_sessions;
  if (_s_spd_notification_client_sessions)
  {
    v2 = *(_DWORD *)(a1 + 32);
    v3 = MEMORY[0x24BDAC760];
    do
    {
      if (v1[2] && v1[3])
      {
        v4 = _spd_os_log();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v10) = v2;
          _os_log_impl(&dword_21323C000, v4, OS_LOG_TYPE_INFO, "Calling session client's callback on their queue for client [PID=%d]", buf, 8u);
        }
        v5 = v1[2];
        block[0] = v3;
        block[1] = 0x40000000;
        block[2] = __spd_notification_socket_activity_block_invoke;
        block[3] = &__block_descriptor_tmp_18;
        block[4] = v1;
        v8 = v2;
        dispatch_async(v5, block);
      }
      else
      {
        v6 = _spd_os_log();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          v10 = v1;
          _os_log_error_impl(&dword_21323C000, v6, OS_LOG_TYPE_ERROR, "Unable to dispatch session client's handler [ADDR=%p]", buf, 0xCu);
        }
      }
      v1 = (_QWORD *)*v1;
    }
    while (v1);
  }
}

void ___spd_xpc_cleanup_locked_block_invoke()
{
  NSObject *v0;
  NSObject *v1;
  uint8_t v2[16];

  if (_s_spd_notification_client_sessions)
  {
    v0 = _spd_os_log();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v2 = 0;
      _os_log_impl(&dword_21323C000, v0, OS_LOG_TYPE_INFO, "Old connection went away. Registering again with spd", v2, 2u);
    }
    if (_spd_helper_send_async(10, 0, 0xFFFFFFFF))
    {
      v1 = _spd_os_log();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
        ___spd_xpc_cleanup_locked_block_invoke_cold_1();
    }
  }
}

uint64_t __spd_notification_socket_activity_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) + 16))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), *(unsigned int *)(a1 + 40));
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

_BYTE *OUTLINED_FUNCTION_3(_BYTE *result, _BYTE *a2)
{
  *result = 0;
  *a2 = 0;
  return result;
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

uint64_t spd_client_session_create(_QWORD *a1)
{
  void *v2;

  _s_pub_session = spd_client_session_queue();
  if (!a1)
    return 4;
  v2 = malloc_type_calloc(1uLL, 0x28uLL, 0xA004015616432uLL);
  *a1 = v2;
  if (v2)
    return 0;
  else
    return 6;
}

uint64_t spd_client_session_destroy(uint64_t a1)
{
  _QWORD block[5];

  if (!a1)
    return 4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __spd_client_session_destroy_block_invoke;
  block[3] = &__block_descriptor_tmp_1;
  block[4] = a1;
  dispatch_async((dispatch_queue_t)_s_pub_session, block);
  return 0;
}

void __spd_client_session_destroy_block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD block[5];

  if (spd_deregister_for_notifications(*(uint64_t **)(a1 + 32)))
  {
    v2 = *(_QWORD *)(a1 + 32);
    if (v2)
    {
      if (*(_QWORD *)(v2 + 32))
      {
        v3 = *(NSObject **)(v2 + 16);
        if (v3)
        {
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 0x40000000;
          block[2] = __spd_client_session_destroy_block_invoke_2;
          block[3] = &__block_descriptor_tmp_1;
          block[4] = v2;
          dispatch_async(v3, block);
        }
      }
    }
  }
}

uint64_t __spd_client_session_destroy_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 16))();
}

uint64_t spd_client_session_set_callbacks(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  void *v9;
  _QWORD v10[7];
  _QWORD aBlock[7];

  result = 4;
  if (a1 && a2)
  {
    v8 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 0x40000000;
    aBlock[2] = __spd_client_session_set_callbacks_block_invoke;
    aBlock[3] = &__block_descriptor_tmp_3_0;
    aBlock[4] = a2;
    aBlock[5] = a1;
    aBlock[6] = a4;
    *(_QWORD *)(a1 + 24) = _Block_copy(aBlock);
    if (a3)
    {
      v10[0] = v8;
      v10[1] = 0x40000000;
      v10[2] = __spd_client_session_set_callbacks_block_invoke_2;
      v10[3] = &__block_descriptor_tmp_4_0;
      v10[4] = a3;
      v10[5] = a1;
      v10[6] = a4;
      v9 = _Block_copy(v10);
      result = 0;
      *(_QWORD *)(a1 + 32) = v9;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t __spd_client_session_set_callbacks_block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(a1 + 32))(*(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 48));
}

uint64_t __spd_client_session_set_callbacks_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(a1 + 32))(*(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 48));
}

uint64_t spd_client_session_set_dispatch_queue(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD block[5];

  v2 = 4;
  if (a1 && a2)
  {
    if (*(_QWORD *)(a1 + 24))
    {
      *(_QWORD *)(a1 + 16) = a2;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 0x40000000;
      block[2] = __spd_client_session_set_dispatch_queue_block_invoke;
      block[3] = &__block_descriptor_tmp_6;
      block[4] = a1;
      dispatch_async((dispatch_queue_t)_s_pub_session, block);
      return 0;
    }
    else
    {
      return 29;
    }
  }
  return v2;
}

void __spd_client_session_set_dispatch_queue_block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD block[5];

  if (spd_register_for_notifications(*(_QWORD **)(a1 + 32)))
  {
    v2 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v2 + 32))
    {
      v3 = *(NSObject **)(v2 + 16);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 0x40000000;
      block[2] = __spd_client_session_set_dispatch_queue_block_invoke_2;
      block[3] = &__block_descriptor_tmp_5_0;
      block[4] = v2;
      dispatch_async(v3, block);
    }
  }
}

uint64_t __spd_client_session_set_dispatch_queue_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 16))();
}

uint64_t spd_client_create(_QWORD *a1)
{
  _DWORD *v2;
  _DWORD *v3;
  uint64_t result;

  if (!a1)
    return 4;
  v2 = malloc_type_calloc(1uLL, 0x14uLL, 0x1000040A86A77D5uLL);
  *a1 = v2;
  if (!v2)
    return 6;
  v3 = v2;
  result = 0;
  *v3 = -1;
  return result;
}

uint64_t spd_client_destroy(void *a1)
{
  if (!a1)
    return 4;
  free(a1);
  return 0;
}

uint64_t spd_client_checkin_socket(uint64_t a1, int a2)
{
  if (!a1)
    return 4;
  *(_DWORD *)a1 = a2;
  return spd_checkin_socket(a2, (unsigned __int8 *)(a1 + 4));
}

uint64_t spd_client_checkout_socket(uint64_t a1)
{
  const unsigned __int8 *v1;

  if (a1 && (v1 = (const unsigned __int8 *)(a1 + 4), !uuid_is_null((const unsigned __int8 *)(a1 + 4))))
    return spd_checkout_socket(v1);
  else
    return 4;
}

uint64_t spd_client_start_monitoring_socket(uint64_t a1)
{
  const unsigned __int8 *v1;

  if (a1 && (v1 = (const unsigned __int8 *)(a1 + 4), !uuid_is_null((const unsigned __int8 *)(a1 + 4))))
    return spd_start_monitoring_socket(v1);
  else
    return 4;
}

uint64_t spd_client_stop_monitoring_socket(uint64_t a1)
{
  const unsigned __int8 *v1;

  if (a1 && (v1 = (const unsigned __int8 *)(a1 + 4), !uuid_is_null((const unsigned __int8 *)(a1 + 4))))
    return spd_stop_monitoring_socket(v1);
  else
    return 4;
}

void spd_register_for_notifications_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21323C000, v0, v1, "Failure to register for notifications", v2);
  OUTLINED_FUNCTION_1();
}

void spd_deregister_for_notifications_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21323C000, v0, v1, "Deregistering notification port has NULL reference", v2);
  OUTLINED_FUNCTION_1();
}

void spd_deregister_for_notifications_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21323C000, v0, v1, "Failure to de-register for notifications", v2);
  OUTLINED_FUNCTION_1();
}

void spd_checkin_socket_cold_1()
{
  qword_254B8B638 = (uint64_t)"Linked against modern SDK, VOIP socket will not wake. Use Local Push Connectivity instead";
  __break(1u);
}

void spd_checkin_socket_cold_2(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_3(a1, a2);
  OUTLINED_FUNCTION_0(&dword_21323C000, v2, (uint64_t)v2, "No existing connection... Try again...", v3);
}

void spd_checkin_socket_cold_3(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_3(a1, a2);
  OUTLINED_FUNCTION_0(&dword_21323C000, v2, (uint64_t)v2, "Failing to get xpc connection in time!", v3);
}

void spd_checkin_socket_cold_4(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_3(a1, a2);
  OUTLINED_FUNCTION_0(&dword_21323C000, v2, (uint64_t)v2, "_spd_xpc_init_locked failed", v3);
}

void ___spd_helper_send_async_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21323C000, v0, v1, "_spd_get_xpc_connection_retained failed", v2);
  OUTLINED_FUNCTION_1();
}

void ___spd_helper_send_async_block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(_DWORD *)(a1 + 64);
  v4 = *(_DWORD *)(a1 + 68);
  v5 = 136316674;
  v6 = "_spd_helper_send_async_block_invoke";
  v7 = 1024;
  v8 = 415;
  v9 = 2048;
  v10 = v2;
  v11 = 1024;
  v12 = v3;
  v13 = 1040;
  v14 = 16;
  v15 = 2096;
  v16 = a1 + 56;
  v17 = 1024;
  v18 = v4;
  _os_log_debug_impl(&dword_21323C000, a2, OS_LOG_TYPE_DEBUG, "%s:%d sent type: %llu, sfd: %d, %{uuid_t}.16P, pid: %u", (uint8_t *)&v5, 0x38u);
}

void ___spd_xpc_init_locked_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_21323C000, v0, v1, "%s:%d calling xpc_set_event_stream_handler", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void spd_xpc_event_stream_handler_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21323C000, v0, v1, "No connection from spd!", v2);
  OUTLINED_FUNCTION_1();
}

void spd_xpc_event_stream_handler_block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_21323C000, v0, v1, "%s:%d spd_xpc_event_stream_handler", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void spd_xpc_event_stream_handler_block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_21323C000, a2, OS_LOG_TYPE_ERROR, "unknown msg type %lld", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_5();
}

void ___spd_xpc_cleanup_locked_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21323C000, v0, v1, "_spd_helper_send_async failed", v2);
  OUTLINED_FUNCTION_1();
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

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x24BDAE148]();
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int getpeername(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x24BDAE6C0](*(_QWORD *)&a1, a2, a3);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

int getsockname(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x24BDAE770](*(_QWORD *)&a1, a2, a3);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x24BDAE780](a1, a2);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x24BDAF7C8](a1);
}

int pthread_cond_timedwait(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return MEMORY[0x24BDAF7F0](a1, a2, a3);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
  MEMORY[0x24BDB0310](dst, src);
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x24BDB0328](uu);
}

void vsyslog(int a1, const char *a2, __darwin_va_list a3)
{
  MEMORY[0x24BDB0460](*(_QWORD *)&a1, a2, a3);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x24BDB0718](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x24BDB0798](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x24BDB07A8](connection, message);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x24BDB07B8](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x24BDB07C8](connection, handler);
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  MEMORY[0x24BDB07E8](connection, targetq);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

xpc_connection_t xpc_dictionary_create_connection(xpc_object_t xdict, const char *key)
{
  return (xpc_connection_t)MEMORY[0x24BDB08C8](xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0938](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

const uint8_t *__cdecl xpc_dictionary_get_uuid(xpc_object_t xdict, const char *key)
{
  return (const uint8_t *)MEMORY[0x24BDB0960](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x24BDB0978](xdict, key, value);
}

void xpc_dictionary_set_fd(xpc_object_t xdict, const char *key, int fd)
{
  MEMORY[0x24BDB09A0](xdict, key, *(_QWORD *)&fd);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x24BDB09A8](xdict, key, value);
}

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
  MEMORY[0x24BDB09D8](xdict, key, uuid);
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

uint64_t xpc_set_event()
{
  return MEMORY[0x24BDB0B50]();
}

