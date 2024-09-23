BOOL OUTLINED_FUNCTION_4()
{
  NSObject *v0;

  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

void OUTLINED_FUNCTION_9(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_11(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_0()
{
  return _os_log_send_and_compose_impl();
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

double OUTLINED_FUNCTION_2(_QWORD *a1, _OWORD *a2)
{
  double result;

  *a1 = 0;
  result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 8u);
}

uint64_t OUTLINED_FUNCTION_6()
{
  return _os_crash_msg();
}

void OUTLINED_FUNCTION_8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

int *OUTLINED_FUNCTION_5_0()
{
  return __error();
}

void OUTLINED_FUNCTION_15(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

BOOL bridge_version_parse(const char *a1, uint64_t a2)
{
  return sscanf(a1, "%u.%u.%u.%u.%u,%u", a2, a2 + 4, a2 + 8, a2 + 12, a2 + 16, a2 + 20) == 6;
}

uint64_t bridge_version_parse_components(const char *a1, const char *a2, _DWORD *a3)
{
  _DWORD *v5;
  _DWORD *v6;
  int v7;
  unint64_t v8;
  char *__endptr;

  v5 = a3 + 3;
  v6 = a3 + 4;
  v7 = sscanf(a1, "%u.%u.%u.%u.%u", a3, a3 + 1, a3 + 2, a3 + 3, a3 + 4);
  if (v7 != 5)
  {
    if (v7 != 4)
    {
      if (v7 != 3)
        return 0;
      *v5 = 0;
    }
    *v6 = 0;
  }
  __endptr = 0;
  v8 = strtol(a2, &__endptr, 10);
  if (!__endptr)
    return 0;
  if (*__endptr || HIDWORD(v8) != 0)
    return 0;
  a3[5] = v8;
  return 1;
}

char *bridge_version_unparse(_DWORD *a1)
{
  char *v2;

  v2 = 0;
  asprintf(&v2, "%u.%u.%u.%u.%u,%u", *a1, a1[1], a1[2], a1[3], a1[4], a1[5]);
  return v2;
}

uint64_t bridge_version_serialize(__int128 *a1, _BYTE *a2, uint64_t a3)
{
  __int128 v3;

  *(_BYTE *)a3 = 1;
  *(_BYTE *)(a3 + 1) = *a2;
  *(_BYTE *)(a3 + 2) = a2[1];
  *(_DWORD *)(a3 + 24) = *((_DWORD *)a1 + 5);
  v3 = *a1;
  *(_DWORD *)(a3 + 20) = *((_DWORD *)a1 + 4);
  *(_OWORD *)(a3 + 4) = v3;
  return 1;
}

BOOL bridge_version_deserialize(unsigned __int8 *a1, uint64_t a2, _BYTE *a3)
{
  int v3;
  __int128 v4;

  v3 = *a1;
  if (v3 == 1)
  {
    v4 = *(_OWORD *)(a1 + 4);
    *(_DWORD *)(a2 + 16) = *((_DWORD *)a1 + 5);
    *(_OWORD *)a2 = v4;
    *(_DWORD *)(a2 + 20) = *((_DWORD *)a1 + 6);
    if (a3)
    {
      *a3 = a1[1];
      a3[1] = a1[2];
    }
  }
  return v3 == 1;
}

uint64_t bridge_version_compare(int a1, uint64_t a2, uint64_t a3)
{
  int v3;
  int v4;
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;

  if (a1 == 2)
  {
    v3 = *(_DWORD *)(a2 + 20);
    if (v3 == 1)
      return 0;
    v4 = *(_DWORD *)(a3 + 20);
    if (v4 == 1)
      return 0;
  }
  else if (a1 == 1)
  {
    v3 = *(_DWORD *)(a2 + 20);
    if (v3 == 1)
      return 2;
    v4 = *(_DWORD *)(a3 + 20);
    if (v4 == 1)
      return 2;
  }
  else
  {
    if (a1)
      bridge_version_compare_cold_1();
    v3 = *(_DWORD *)(a2 + 20);
    v4 = *(_DWORD *)(a3 + 20);
  }
  if (v3 != v4)
    return 0;
  v5 = 0;
  while (1)
  {
    v6 = *(_DWORD *)(a2 + v5);
    v7 = *(_DWORD *)(a3 + v5);
    if (v6 > v7)
      break;
    if (v6 < v7)
      return 1;
    v5 += 4;
    if (v5 == 20)
      return 2;
  }
  return 3;
}

uint64_t bridge_version_read_plist(const char *a1, _DWORD *a2, uint64_t a3)
{
  int v5;
  int v6;
  timespec v7;
  void *v8;
  void *v9;
  ssize_t v10;
  uint64_t v11;
  const char *string;
  const char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int64_t int64;
  int64_t v18;
  stat v20;

  v5 = open(a1, 0);
  if (v5 == -1)
  {
    v8 = 0;
LABEL_21:
    v14 = 0;
    goto LABEL_22;
  }
  v6 = v5;
  v7.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v7.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v20.st_blksize = v7;
  *(timespec *)v20.st_qspare = v7;
  v20.st_birthtimespec = v7;
  *(timespec *)&v20.st_size = v7;
  v20.st_mtimespec = v7;
  v20.st_ctimespec = v7;
  *(timespec *)&v20.st_uid = v7;
  v20.st_atimespec = v7;
  *(timespec *)&v20.st_dev = v7;
  if (fstat(v5, &v20))
  {
    v8 = 0;
    goto LABEL_11;
  }
  v9 = malloc_type_malloc(v20.st_size, 0x9F49D29AuLL);
  v10 = read(v6, v9, v20.st_size);
  if (v10 == v20.st_size)
  {
    v11 = xpc_create_from_plist();
    v8 = (void *)v11;
    if (!v11 || MEMORY[0x1D824F93C](v11) == MEMORY[0x1E0C812F8])
      goto LABEL_10;

  }
  v8 = 0;
LABEL_10:
  free(v9);
LABEL_11:
  close(v6);
  if (!v8)
    goto LABEL_21;
  string = xpc_dictionary_get_string(v8, "BridgeVersion");
  v13 = xpc_dictionary_get_string(v8, "BridgeBuildGroup");
  v14 = 0;
  if (string)
  {
    if (v13)
    {
      v14 = bridge_version_parse_components(string, v13, a2);
      if (a3)
      {
        *(_WORD *)a3 = 0;
        xpc_dictionary_get_dictionary(v8, "SEPEpoch");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15)
        {
          int64 = xpc_dictionary_get_int64(v15, "Major");
          v18 = xpc_dictionary_get_int64(v16, "Minor");
          if ((unint64_t)(int64 - 1) <= 0xFE && v18 <= 255 && v18 >= 1)
          {
            *(_BYTE *)a3 = int64;
            *(_BYTE *)(a3 + 1) = v18;
          }
        }

      }
    }
  }
LABEL_22:

  return v14;
}

uint64_t bridge_version_read_current(_DWORD *a1, uint64_t a2)
{
  return bridge_version_read_plist("/System/Library/CoreServices/BridgeVersion.plist", a1, a2);
}

char *bridge_version_copy_current_string()
{
  int plist;
  char *result;
  char *v2[3];
  char *v3;

  memset(v2, 170, sizeof(v2));
  plist = bridge_version_read_plist("/System/Library/CoreServices/BridgeVersion.plist", v2, 0);
  result = 0;
  if (plist)
  {
    v3 = 0;
    asprintf(&v3, "%u.%u.%u.%u.%u,%u", LODWORD(v2[0]), HIDWORD(v2[0]), LODWORD(v2[1]), HIDWORD(v2[1]), LODWORD(v2[2]), HIDWORD(v2[2]));
    return v3;
  }
  return result;
}

const char *remote_device_type_get_description(unsigned int a1)
{
  if (a1 > 0x10)
    return "<unknown>";
  else
    return (const char *)remote_device_type_str[a1];
}

uint64_t remote_device_type_is_trusted(int a1)
{
  uint64_t v2;
  _OWORD v3[5];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if ((a1 - 17) <= 0xFFFFFFEF)
    remote_device_type_is_trusted_cold_1();
  if ((a1 - 1) >= 0x10)
    remote_device_type_is_trusted_cold_2(&v2, v3);
  return (0x500Fu >> (a1 - 1)) & 1;
}

uint64_t remote_device_type_parse(char *__s2)
{
  uint64_t v2;

  v2 = 1;
  while (strcmp((const char *)remote_device_type_str[v2], __s2))
  {
    if (++v2 == 17)
      return 0;
  }
  return v2;
}

const char *remote_device_state_get_description(int a1)
{
  if ((a1 - 1) > 2)
    return "<unknown>";
  else
    return (const char *)remote_device_state_str[a1];
}

uint64_t remote_device_get_type(void *a1)
{
  id v1;
  void *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;

  v1 = a1;
  if (!v1)
    remote_device_get_type_cold_1();
  v2 = v1;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = -1431655766;
  objc_msgSend(v1, "dq");
  v3 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __remote_device_get_type_block_invoke;
  v7[3] = &unk_1E9538A30;
  v8 = v2;
  v9 = &v10;
  v4 = v2;
  dispatch_sync(v3, v7);

  v5 = *((unsigned int *)v11 + 6);
  _Block_object_dispose(&v10, 8);
  return v5;
}

void sub_1D3444344(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id rsd_log()
{
  if (rsd_log_once != -1)
    dispatch_once(&rsd_log_once, &__block_literal_global_336);
  return (id)rsd_log__log;
}

BOOL remote_device_xpc_remote_connection_tls_enabled(void *a1)
{
  id v1;
  NSObject *v2;
  _QWORD *v3;
  NSObject *v4;
  uint64_t v5;
  const char *v6;
  _BOOL8 v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  objc_msgSend(v1, "dq");
  v2 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __remote_device_xpc_remote_connection_tls_enabled_block_invoke;
  v9[3] = &unk_1E9538A30;
  v11 = &v12;
  v3 = v1;
  v10 = v3;
  dispatch_sync(v2, v9);

  v4 = rsd_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = v3[1];
    if (*((_BYTE *)v13 + 24))
      v6 = "";
    else
      v6 = " not";
    *(_DWORD *)buf = 136446466;
    v17 = v5;
    v18 = 2080;
    v19 = v6;
    _os_log_impl(&dword_1D3442000, v4, OS_LOG_TYPE_INFO, "%{public}s> RemoteXPC is%s encrypted", buf, 0x16u);
  }

  v7 = *((_BYTE *)v13 + 24) != 0;
  _Block_object_dispose(&v12, 8);

  return v7;
}

void sub_1D3444510(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

sec_identity_t remote_device_copy_xpc_remote_connection_tls_identity(void *a1)
{
  id v1;
  __SecIdentity *v2;
  sec_identity_t v3;

  v1 = a1;
  v2 = (__SecIdentity *)local_device_copy_identity();
  v3 = sec_identity_create(v2);
  if (v2)
    CFRelease(v2);

  return v3;
}

void sub_1D344457C(_Unwind_Exception *exception_object)
{
  const void *v1;

  if (v1)
    CFRelease(v1);
  _Unwind_Resume(exception_object);
}

void remote_device_authenticate(void *a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  __SecTrust *v9;
  CFArrayRef v10;
  NSObject *v11;
  __SecCertificate *v12;
  NSObject *v13;
  const __CFData *v14;
  xpc_object_t v15;
  const UInt8 *BytePtr;
  size_t Length;
  _xpc_connection_s *v18;
  NSObject *v19;
  void (**v20)(_QWORD, _QWORD);
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  if (!v5)
    remote_device_get_type_cold_1();
  if (!v6)
    remote_device_authenticate_cold_2();
  v8 = (void (**)(_QWORD, _QWORD))v7;
  if (!v7)
    remote_device_authenticate_cold_3();
  _remote_device_crash_if_not_connected(v5);
  v9 = sec_trust_copy_ref(v6);
  v10 = SecTrustCopyCertificateChain(v9);
  if (!v10)
  {
    v11 = rsd_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      remote_device_authenticate_cold_5();

    v8[2](v8, 0);
  }
  -[__CFArray lastObject](v10, "lastObject");
  v12 = (__SecCertificate *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v13 = rsd_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      remote_device_authenticate_cold_4();

    v8[2](v8, 0);
  }
  v14 = SecCertificateCopyData(v12);
  v15 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v15, "cmd", "authenticate_device");
  BytePtr = CFDataGetBytePtr(v14);
  Length = CFDataGetLength(v14);
  xpc_dictionary_set_data(v15, "identity_cert", BytePtr, Length);
  objc_msgSend(v5, "connection");
  v18 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dq");
  v19 = objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __remote_device_authenticate_block_invoke;
  v22[3] = &unk_1E9538AD0;
  v20 = v8;
  v24 = v20;
  v21 = v5;
  v23 = v21;
  xpc_connection_send_message_with_reply(v18, v15, v19, v22);

  if (v14)
    CFRelease(v14);
  if (v12)
    CFRelease(v12);

  if (v9)
    CFRelease(v9);

}

void sub_1D34447EC(_Unwind_Exception *exception_object)
{
  const void *v1;

  if (v1)
    CFRelease(v1);
  _Unwind_Resume(exception_object);
}

void sub_1D3444C9C(_Unwind_Exception *a1)
{
  void *v1;

  free(v1);
  _Unwind_Resume(a1);
}

void sub_1D3445070(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id remoted_queue()
{
  if (remoted_queue_once != -1)
    dispatch_once(&remoted_queue_once, &__block_literal_global_339);
  return (id)remoted_queue_queue;
}

id remote_service_copy_properties(void *a1)
{
  id *v1;
  id *v2;
  id v3;

  v1 = a1;
  if (!v1)
    remote_service_copy_properties_cold_1();
  v2 = v1;
  v3 = v1[2];

  return v3;
}

uint64_t remote_service_copy_property(void *a1, const char *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a1;
  if (!v3)
    remote_service_copy_properties_cold_1();
  v4 = v3;
  v5 = (void *)*((_QWORD *)v3 + 2);
  if (v5)
  {
    xpc_dictionary_get_value(v5, a2);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t remote_service_get_name(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8);
}

int64_t remote_service_get_version(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  int64_t int64;

  v1 = a1;
  if (!v1)
    remote_service_copy_properties_cold_1();
  v2 = v1;
  v3 = (void *)*((_QWORD *)v1 + 2);
  if (v3)
    int64 = xpc_dictionary_get_int64(v3, "ServiceVersion");
  else
    int64 = 0;

  return int64;
}

BOOL remote_service_should_encrypt_socket_data(void *a1)
{
  void **v1;
  void **v2;
  _BOOL8 v3;

  v1 = a1;
  if (!v1)
    remote_service_copy_properties_cold_1();
  v2 = v1;
  v3 = _remote_device_supports_encrypting_socket_data(v1[4])
    && _remote_service_properties_should_encrypt_socket_data(v2[2])
    && remote_device_xpc_remote_connection_tls_enabled(v2[4]);

  return v3;
}

BOOL _remote_device_supports_encrypting_socket_data(void *a1)
{
  id v1;
  _BOOL8 v2;

  v1 = a1;
  v2 = remote_device_xpc_remote_connection_tls_enabled(v1)
    && (unint64_t)objc_msgSend(v1, "messaging_protocol_version") > 4;

  return v2;
}

BOOL _remote_service_properties_should_encrypt_socket_data(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _BOOL8 v8;

  v1 = a1;
  v2 = v1;
  if (!v1)
  {
    v4 = 0;
    v7 = 0;
LABEL_9:
    v8 = 1;
    goto LABEL_10;
  }
  xpc_dictionary_get_value(v1, "EncryptSocketData");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = MEMORY[0x1E0C812D0];
  if (v3 && MEMORY[0x1D824F93C](v3) == v5 && !xpc_BOOL_get_value(v4))
  {
    v8 = 0;
    goto LABEL_11;
  }
  xpc_dictionary_get_value(v2, "UsesRemoteXPC");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (!v6 || MEMORY[0x1D824F93C](v6) != v5)
    goto LABEL_9;
  v8 = !xpc_BOOL_get_value(v7);
LABEL_10:

LABEL_11:
  return v8;
}

BOOL remote_service_xpc_remote_connection_tls_enabled(uint64_t a1)
{
  return remote_device_xpc_remote_connection_tls_enabled(*(void **)(a1 + 32));
}

uint64_t remote_service_get_xpc_remote_connection_version_flags(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t xpc_remote_connection_version_flags;
  uint64_t v6;
  _OWORD v7[5];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (!v1)
    remote_service_copy_properties_cold_1();
  v2 = v1;
  v3 = (void *)*((_QWORD *)v1 + 4);
  if (!v3)
    remote_service_get_xpc_remote_connection_version_flags_cold_2(&v6, v7);
  xpc_remote_connection_version_flags = remote_device_get_xpc_remote_connection_version_flags(v3);

  return xpc_remote_connection_version_flags;
}

uint64_t remote_device_get_xpc_remote_connection_version_flags(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t value;

  v1 = a1;
  if (!v1)
    remote_device_get_type_cold_1();
  v2 = v1;
  v3 = remote_device_copy_property(v1, (uint64_t)"RemoteXPCVersionFlags");
  v4 = v3;
  if (v3 && MEMORY[0x1D824F93C](v3) == MEMORY[0x1E0C81398])
  {
    value = xpc_uint64_get_value(v4);
  }
  else
  {
    v5 = rsd_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      remote_device_get_xpc_remote_connection_version_flags_cold_2();

    value = 0;
  }

  return value;
}

id remote_service_copy_device(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v6;
  _OWORD v7[5];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (!v1)
    remote_service_copy_properties_cold_1();
  v2 = v1;
  v3 = (void *)*((_QWORD *)v1 + 4);
  if (!v3)
    remote_service_get_xpc_remote_connection_version_flags_cold_2(&v6, v7);
  v4 = v3;

  return v4;
}

uint64_t remote_device_get_xpc_remote_connection_mode_flags(void *a1)
{
  id v1;
  void *v2;
  int type;
  uint64_t v5;

  v1 = a1;
  if (!v1)
    remote_device_get_type_cold_1();
  v2 = v1;
  type = remote_device_get_type(v1);
  if (type == 13 || type == 10)
    v5 = 4;
  else
    v5 = 0;

  return v5;
}

BOOL remote_service_supports_feature(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _BOOL8 v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v3 = a1;
  if (!v3)
    remote_service_copy_properties_cold_1();
  v4 = v3;
  v5 = (void *)*((_QWORD *)v3 + 2);
  if (v5)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    xpc_dictionary_get_value(v5, "Features");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6 && MEMORY[0x1D824F93C](v6) == MEMORY[0x1E0C812C8])
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __remote_service_supports_feature_block_invoke;
      v10[3] = &unk_1E95389E0;
      v10[4] = &v11;
      v10[5] = a2;
      xpc_array_apply(v7, v10);
    }
    v8 = *((_BYTE *)v12 + 24) != 0;

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void sub_1D34456FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __remote_service_supports_feature_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  const char *string_ptr;

  v4 = a3;
  if (MEMORY[0x1D824F93C]() == MEMORY[0x1E0C81390])
  {
    string_ptr = xpc_string_get_string_ptr(v4);
    v5 = 1;
    if (!strcmp(string_ptr, *(const char **)(a1 + 40)))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      v5 = 0;
    }
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

uint64_t remote_service_set_connect_timeout(void *a1, int a2)
{
  _DWORD *v3;

  v3 = a1;
  if (!v3)
    remote_service_copy_properties_cold_1();
  v3[10] = a2;

  return 0;
}

uint64_t remote_service_set_keepalive(void *a1, BOOL a2)
{
  _QWORD *v3;
  _QWORD *v4;
  xpc_object_t v5;
  void *v6;

  v3 = a1;
  if (!v3)
    remote_service_copy_properties_cold_1();
  v4 = v3;
  v5 = xpc_BOOL_create(a2);
  v6 = (void *)v4[6];
  v4[6] = v5;

  return 0;
}

uint64_t remote_service_set_keepalive_time(void *a1, int a2)
{
  _DWORD *v3;

  v3 = a1;
  if (!v3)
    remote_service_copy_properties_cold_1();
  v3[14] = a2;

  return 0;
}

uint64_t remote_service_set_keepcount(void *a1, int a2)
{
  _DWORD *v3;

  v3 = a1;
  if (!v3)
    remote_service_copy_properties_cold_1();
  v3[15] = a2;

  return 0;
}

uint64_t remote_service_set_keepinterval(void *a1, int a2)
{
  _DWORD *v3;

  v3 = a1;
  if (!v3)
    remote_service_copy_properties_cold_1();
  v3[16] = a2;

  return 0;
}

uint64_t remote_service_create_connected_socket(void *a1)
{
  _QWORD *v1;
  void *v2;
  uint64_t connected_socket_impl;
  uint64_t v5;
  _OWORD v6[5];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (!v1)
    remote_service_copy_properties_cold_1();
  v2 = v1;
  if (!v1[3])
    remote_service_create_connected_socket_cold_2(&v5, v6);
  connected_socket_impl = _remote_service_create_connected_socket_impl(v1, 1);

  return connected_socket_impl;
}

uint64_t _remote_service_create_connected_socket_impl(void *a1, int a2)
{
  xpc_connection_t *v3;
  NSObject *v4;
  xpc_object_t v5;
  xpc_connection_t v6;
  xpc_object_t v7;
  void *v8;
  int v9;
  int v10;
  id v11;
  int v12;
  uint64_t *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  dispatch_semaphore_t v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  xpc_connection_t v21;
  NSObject *v22;
  uint64_t v23;
  _BOOL4 should_encrypt_socket_data;
  int v25;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[4];
  unsigned int *v30;
  NSObject *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  int v37;
  int v38;
  uint64_t v39;
  uint8_t buf[16];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = -1;
  v4 = remoted_queue();
  dispatch_assert_queue_not_V2(v4);

  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "cmd", "connect");
  xpc_dictionary_set_uint64(v5, "connect_timeout", *((unsigned int *)v3 + 10));
  v6 = v3[6];
  if (v6)
    xpc_dictionary_set_value(v5, "keepalive", v6);
  xpc_dictionary_set_uint64(v5, "keepalive_time", *((unsigned int *)v3 + 14));
  xpc_dictionary_set_uint64(v5, "keepcount", *((unsigned int *)v3 + 15));
  xpc_dictionary_set_uint64(v5, "keepinterval", *((unsigned int *)v3 + 16));
  v7 = xpc_connection_send_message_with_reply_sync(v3[3], v5);
  v8 = v7;
  if (v7 && MEMORY[0x1D824F93C](v7) != MEMORY[0x1E0C81310])
  {
    v9 = xpc_dictionary_dup_fd(v8, "fd");
    *((_DWORD *)v35 + 6) = v9;
  }
  v10 = *((_DWORD *)v35 + 6);
  if (v10 == -1)
  {
    v23 = 0xFFFFFFFFLL;
  }
  else
  {
    v11 = rsd_log();
    v12 = remote_socket_poll_connect_sync(v10, v11);

    if (v12)
    {
      if (close(*((_DWORD *)v35 + 6)) == -1)
      {
        __error();
        _os_assumes_log();
      }
      v13 = v35;
      *((_DWORD *)v35 + 6) = -1;
      if (a2)
      {
        v14 = rsd_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D3442000, v14, OS_LOG_TYPE_DEFAULT, "socket connection failed, heartbeat remote device and try again", buf, 2u);
        }

        v15 = dispatch_queue_create("remote client heartbeat", 0);
        v16 = dispatch_semaphore_create(0);
        v17 = v15;
        if (!v17)
        {
          v33 = 0;
          v43 = 0u;
          v44 = 0u;
          v41 = 0u;
          v42 = 0u;
          *(_OWORD *)buf = 0u;
          os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
          v38 = 134217984;
          v39 = 0;
          _os_log_send_and_compose_impl();
          v27 = _os_crash_msg();
          _remote_service_create_connected_socket_impl_cold_1(v27);
        }
        v18 = v17;

        v19 = v16;
        if (!v19)
        {
          v33 = 0;
          v43 = 0u;
          v44 = 0u;
          v41 = 0u;
          v42 = 0u;
          *(_OWORD *)buf = 0u;
          os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
          v38 = 134217984;
          v39 = 0;
          _os_log_send_and_compose_impl();
          v28 = _os_crash_msg();
          _remote_service_create_connected_socket_impl_cold_1(v28);
        }
        v20 = v19;

        v21 = v3[4];
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = ___remote_service_create_connected_socket_impl_block_invoke;
        v29[3] = &unk_1E9538D78;
        v32 = &v34;
        v30 = v3;
        v22 = v20;
        v31 = v22;
        remote_device_heartbeat(v21, v18, v29);
        dispatch_semaphore_wait(v22, 0xFFFFFFFFFFFFFFFFLL);

        v13 = v35;
      }
    }
    else
    {
      should_encrypt_socket_data = remote_service_should_encrypt_socket_data(v3);
      v13 = v35;
      if (should_encrypt_socket_data)
      {
        v25 = -[xpc_connection_t proxySocketOverRemoteXPC:](v3, "proxySocketOverRemoteXPC:", *((unsigned int *)v35 + 6));
        v13 = v35;
        *((_DWORD *)v35 + 6) = v25;
      }
    }
    v23 = *((unsigned int *)v13 + 6);
  }

  _Block_object_dispose(&v34, 8);
  return v23;
}

void sub_1D3445D70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void remote_service_connect_socket(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *v7;
  uint64_t v8;
  _OWORD v9[5];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v5 = a2;
  v6 = a3;
  if (!v7)
    remote_service_copy_properties_cold_1();
  if (!v7[3])
    remote_service_create_connected_socket_cold_2(&v8, v9);
  _remote_service_connect_socket_impl(v7, v5, v6, 1);

}

void _remote_service_connect_socket_impl(void *a1, void *a2, void *a3, char a4)
{
  _xpc_connection_s **v7;
  id v8;
  id v9;
  xpc_object_t v10;
  _xpc_connection_s *v11;
  NSObject *v12;
  _xpc_connection_s *v13;
  id v14;
  unsigned int *v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  _xpc_connection_s **v19;
  id v20;
  char v21;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v10, "cmd", "connect");
  xpc_dictionary_set_uint64(v10, "connect_timeout", *((unsigned int *)v7 + 10));
  v11 = v7[6];
  if (v11)
    xpc_dictionary_set_value(v10, "keepalive", v11);
  xpc_dictionary_set_uint64(v10, "keepalive_time", *((unsigned int *)v7 + 14));
  xpc_dictionary_set_uint64(v10, "keepcount", *((unsigned int *)v7 + 15));
  xpc_dictionary_set_uint64(v10, "keepinterval", *((unsigned int *)v7 + 16));
  v12 = rsd_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    _remote_service_connect_socket_impl_cold_1();

  v13 = v7[3];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = ___remote_service_connect_socket_impl_block_invoke;
  v17[3] = &unk_1E9538DF0;
  v21 = a4;
  v18 = v8;
  v19 = v7;
  v20 = v9;
  v14 = v9;
  v15 = v7;
  v16 = v8;
  xpc_connection_send_message_with_reply(v13, v10, v16, v17);

}

void remote_device_copy_uuid(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;

  v3 = a1;
  if (!v3)
    remote_device_get_type_cold_1();
  v4 = v3;
  objc_msgSend(v3, "dq");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __remote_device_copy_uuid_block_invoke;
  block[3] = &unk_1E9538A08;
  v8 = v4;
  v9 = a2;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __remote_device_copy_uuid_block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "uuid"))
    uuid_copy(*(unsigned __int8 **)(a1 + 40), (const unsigned __int8 *)objc_msgSend(*(id *)(a1 + 32), "uuid"));
  else
    uuid_clear(*(unsigned __int8 **)(a1 + 40));
}

uint64_t __remote_device_get_type_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "type");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t remote_device_get_name(void *a1)
{
  id v1;
  void *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  unint64_t v13;

  v1 = a1;
  if (!v1)
    remote_device_get_type_cold_1();
  v2 = v1;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0xAAAAAAAAAAAAAAAALL;
  objc_msgSend(v1, "dq");
  v3 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __remote_device_get_name_block_invoke;
  v7[3] = &unk_1E9538A30;
  v8 = v2;
  v9 = &v10;
  v4 = v2;
  dispatch_sync(v3, v7);

  v5 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v5;
}

void sub_1D34464E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __remote_device_get_name_block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

id remote_device_copy_properties(void *a1)
{
  id v1;
  void *v2;
  NSObject *v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v1 = a1;
  if (!v1)
    remote_device_get_type_cold_1();
  v2 = v1;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  v15 = 0;
  objc_msgSend(v1, "dq");
  v3 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __remote_device_copy_properties_block_invoke;
  v7[3] = &unk_1E9538A30;
  v8 = v2;
  v9 = &v10;
  v4 = v2;
  dispatch_sync(v3, v7);

  v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v5;
}

void sub_1D3446600(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void __remote_device_copy_properties_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "properties");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

id remote_device_copy_property(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v3 = a1;
  if (!v3)
    remote_device_get_type_cold_1();
  v4 = v3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  objc_msgSend(v3, "dq");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __remote_device_copy_property_block_invoke;
  block[3] = &unk_1E9538A58;
  v10 = v4;
  v11 = &v13;
  v12 = a2;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

void sub_1D344675C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __remote_device_copy_property_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "properties");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_get_value(v5, *(const char **)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t remote_device_copy_product_type(void *a1)
{
  id v1;
  void *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v1 = a1;
  if (!v1)
    remote_device_get_type_cold_1();
  v2 = v1;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  objc_msgSend(v1, "dq");
  v3 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __remote_device_copy_product_type_block_invoke;
  v7[3] = &unk_1E9538A80;
  v8 = v2;
  v9 = &v10;
  v4 = v2;
  dispatch_sync(v3, v7);

  v5 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v5;
}

void sub_1D3446894(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __remote_device_copy_product_type_block_invoke(uint64_t a1)
{
  void *v2;
  const char *string;

  objc_msgSend(*(id *)(a1 + 32), "properties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  string = xpc_dictionary_get_string(v2, "ProductType");

  if (string)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = strdup(string);
}

uint64_t remote_device_copy_os_version(void *a1)
{
  id v1;
  void *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v1 = a1;
  if (!v1)
    remote_device_get_type_cold_1();
  v2 = v1;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  objc_msgSend(v1, "dq");
  v3 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __remote_device_copy_os_version_block_invoke;
  v7[3] = &unk_1E9538A80;
  v8 = v2;
  v9 = &v10;
  v4 = v2;
  dispatch_sync(v3, v7);

  v5 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v5;
}

void sub_1D34469D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __remote_device_copy_os_version_block_invoke(uint64_t a1)
{
  void *v2;
  const char *string;

  objc_msgSend(*(id *)(a1 + 32), "properties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  string = xpc_dictionary_get_string(v2, "OSVersion");

  if (string)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = strdup(string);
}

uint64_t remote_device_copy_os_build(void *a1)
{
  id v1;
  void *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v1 = a1;
  if (!v1)
    remote_device_get_type_cold_1();
  v2 = v1;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  objc_msgSend(v1, "dq");
  v3 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __remote_device_copy_os_build_block_invoke;
  v7[3] = &unk_1E9538A80;
  v8 = v2;
  v9 = &v10;
  v4 = v2;
  dispatch_sync(v3, v7);

  v5 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v5;
}

void sub_1D3446B14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __remote_device_copy_os_build_block_invoke(uint64_t a1)
{
  void *v2;
  const char *string;

  objc_msgSend(*(id *)(a1 + 32), "properties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  string = xpc_dictionary_get_string(v2, "BuildVersion");

  if (string)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = strdup(string);
}

uint64_t remote_device_copy_bridge_version_string(void *a1)
{
  id v1;
  void *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v1 = a1;
  if (!v1)
    remote_device_get_type_cold_1();
  v2 = v1;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  objc_msgSend(v1, "dq");
  v3 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __remote_device_copy_bridge_version_string_block_invoke;
  v7[3] = &unk_1E9538A80;
  v8 = v2;
  v9 = &v10;
  v4 = v2;
  dispatch_sync(v3, v7);

  v5 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v5;
}

void sub_1D3446C54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __remote_device_copy_bridge_version_string_block_invoke(uint64_t a1)
{
  void *v2;
  const char *string;

  objc_msgSend(*(id *)(a1 + 32), "properties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  string = xpc_dictionary_get_string(v2, "BridgeVersion");

  if (string)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = strdup(string);
}

BOOL remote_device_get_bridge_version(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  const char *v5;
  char *v6;
  _BOOL8 v7;

  v3 = a1;
  if (!v3)
    remote_device_get_type_cold_1();
  v4 = v3;
  v5 = (const char *)remote_device_copy_bridge_version_string(v3);
  if (v5)
  {
    v6 = (char *)v5;
    v7 = bridge_version_parse(v5, a2);
    free(v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t remote_device_copy_boot_session_uuid(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  _QWORD block[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v3 = a1;
  if (!v3)
    remote_device_get_type_cold_1();
  if (!a2)
    remote_device_copy_boot_session_uuid_cold_2();
  v4 = v3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  objc_msgSend(v3, "dq");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __remote_device_copy_boot_session_uuid_block_invoke;
  block[3] = &unk_1E9538AA8;
  v11 = &v13;
  v12 = a2;
  v10 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = *((unsigned __int8 *)v14 + 24);
  _Block_object_dispose(&v13, 8);
  return v7;
}

void sub_1D3446E08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __remote_device_copy_boot_session_uuid_block_invoke(uint64_t a1)
{
  void *v2;
  const unsigned __int8 *uuid;
  unsigned __int8 *v4;

  objc_msgSend(*(id *)(a1 + 32), "properties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  uuid = xpc_dictionary_get_uuid(v2, "BootSessionUUID");

  v4 = *(unsigned __int8 **)(a1 + 48);
  if (uuid)
  {
    uuid_copy(v4, uuid);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    uuid_clear(v4);
  }
}

uint64_t remote_device_copy_build_version(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  if (!v1)
    remote_device_get_type_cold_1();
  v2 = v1;
  v3 = remote_device_copy_os_build(v1);

  return v3;
}

uint64_t remote_device_copy_internal_build(void *a1)
{
  id v1;
  void *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v1 = a1;
  if (!v1)
    remote_device_get_type_cold_1();
  v2 = v1;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = -86;
  objc_msgSend(v1, "dq");
  v3 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __remote_device_copy_internal_build_block_invoke;
  v7[3] = &unk_1E9538A30;
  v8 = v2;
  v9 = &v10;
  v4 = v2;
  dispatch_sync(v3, v7);

  v5 = *((unsigned __int8 *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v5;
}

void sub_1D3446F9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __remote_device_copy_internal_build_block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "properties");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = xpc_dictionary_get_BOOL(v2, "AppleInternal");

}

uint64_t remote_device_get_messaging_protocol_version(void *a1)
{
  id v1;
  NSObject *v2;
  id v3;
  uint64_t v4;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  unint64_t v12;

  v1 = a1;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0xAAAAAAAAAAAAAAAALL;
  objc_msgSend(v1, "dq");
  v2 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __remote_device_get_messaging_protocol_version_block_invoke;
  v6[3] = &unk_1E9538A30;
  v7 = v1;
  v8 = &v9;
  v3 = v1;
  dispatch_sync(v2, v6);

  v4 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v4;
}

void sub_1D34470C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __remote_device_get_messaging_protocol_version_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "messaging_protocol_version");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

BOOL remote_device_get_connectable(void *a1)
{
  id v1;
  void *v2;
  xpc_object_t v3;
  _xpc_connection_s *v4;
  xpc_object_t v5;
  _BOOL8 v6;
  NSObject *v7;

  v1 = a1;
  if (!v1)
    remote_device_get_type_cold_1();
  v2 = v1;
  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "cmd", "get_connectable");
  objc_msgSend(v2, "connection");
  v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v5 = xpc_connection_send_message_with_reply_sync(v4, v3);

  if (MEMORY[0x1D824F93C](v5) == MEMORY[0x1E0C81310])
  {
    v7 = rsd_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      remote_device_get_connectable_cold_2();

    v6 = 0;
  }
  else
  {
    v6 = xpc_dictionary_get_BOOL(v5, "result");
  }

  return v6;
}

int64_t remote_device_get_latest_connect_result(void *a1)
{
  id v1;
  void *v2;
  xpc_object_t v3;
  _xpc_connection_s *v4;
  xpc_object_t v5;
  int64_t int64;
  NSObject *v7;

  v1 = a1;
  if (!v1)
    remote_device_get_type_cold_1();
  v2 = v1;
  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "cmd", "get_latest_connect_error");
  objc_msgSend(v2, "connection");
  v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v5 = xpc_connection_send_message_with_reply_sync(v4, v3);

  if (MEMORY[0x1D824F93C](v5) == MEMORY[0x1E0C81310])
  {
    v7 = rsd_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      remote_device_get_latest_connect_result_cold_2();

    int64 = 0;
  }
  else
  {
    int64 = xpc_dictionary_get_int64(v5, "result");
  }

  return int64;
}

void _remote_device_crash_if_not_connected(void *a1)
{
  id v1;

  v1 = a1;
  if (remote_device_get_state(v1) <= 1)
    _remote_device_crash_if_not_connected_cold_1();

}

void __remote_device_authenticate_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  const char *string;
  NSObject *v5;
  uint64_t v6;
  void (*v7)(void);
  NSObject *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (MEMORY[0x1D824F93C]() == MEMORY[0x1E0C81310])
  {
    v8 = rsd_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __remote_device_authenticate_block_invoke_cold_1();

    *__error() = 83;
    goto LABEL_11;
  }
  string = xpc_dictionary_get_string(v3, "result");
  if (string && strcmp(string, "OK"))
  {
    v5 = rsd_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v9 = 136446210;
      v10 = v6;
      _os_log_impl(&dword_1D3442000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s> remote_device_authenticate failed", (uint8_t *)&v9, 0xCu);
    }

LABEL_11:
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    goto LABEL_12;
  }
  v7 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_12:
  v7();

}

uint64_t remote_device_copy_service_names(void *a1)
{
  id v1;
  void *v2;
  xpc_object_t v3;
  _xpc_connection_s *v4;
  xpc_object_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v9;
  _OWORD v10[5];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (!v1)
    remote_device_get_type_cold_1();
  v2 = v1;
  _remote_device_crash_if_not_connected(v1);
  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "cmd", "list_services");
  objc_msgSend(v2, "connection");
  v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v5 = xpc_connection_send_message_with_reply_sync(v4, v3);

  if (MEMORY[0x1D824F93C](v5) == MEMORY[0x1E0C81310])
  {
    v7 = rsd_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      remote_device_copy_service_names_cold_2();

    v6 = (uint64_t)xpc_array_create(0, 0);
  }
  else
  {
    xpc_dictionary_get_value(v5, "services");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
      remote_device_copy_service_names_cold_3(&v9, v10);
  }

  return v6;
}

uint64_t remote_device_copy_local_service_names(void *a1)
{
  id v1;
  void *v2;
  xpc_object_t v3;
  _xpc_connection_s *v4;
  xpc_object_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v9;
  _OWORD v10[5];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (!v1)
    remote_device_get_type_cold_1();
  v2 = v1;
  _remote_device_crash_if_not_connected(v1);
  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "cmd", "list_local_services");
  objc_msgSend(v2, "connection");
  v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v5 = xpc_connection_send_message_with_reply_sync(v4, v3);

  if (MEMORY[0x1D824F93C](v5) == MEMORY[0x1E0C81310])
  {
    v7 = rsd_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      remote_device_copy_local_service_names_cold_2();

    v6 = (uint64_t)xpc_array_create(0, 0);
  }
  else
  {
    xpc_dictionary_get_value(v5, "services");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
      remote_device_copy_service_names_cold_3(&v9, v10);
  }

  return v6;
}

OS_remote_service *remote_device_copy_service(void *a1, const char *a2)
{
  id v4;
  void *v5;
  xpc_object_t v6;
  _xpc_connection_s *v7;
  xpc_object_t v8;
  const char *string;
  NSObject *v10;
  int *v11;
  OS_remote_service *v12;
  int v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  OS_xpc_object *properties;
  _xpc_endpoint_s *v25;
  _xpc_endpoint_s *v26;
  xpc_connection_t v27;
  _xpc_connection_s *v28;
  NSObject *v29;
  OS_xpc_object *connection;
  _xpc_connection_s *v31;
  NSMutableArray *v32;
  NSMutableArray *proxies;
  NSObject *v34;
  uint64_t v36;
  uint8_t buf[88];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a1;
  if (!v4)
    remote_device_get_type_cold_1();
  if (!a2)
    remote_device_copy_service_cold_2();
  v5 = v4;
  _remote_device_crash_if_not_connected(v4);
  v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v6, "cmd", "get_service");
  xpc_dictionary_set_string(v6, "name", a2);
  objc_msgSend(v5, "connection");
  v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v8 = xpc_connection_send_message_with_reply_sync(v7, v6);

  if (MEMORY[0x1D824F93C](v8) == MEMORY[0x1E0C81310])
  {
    v34 = rsd_log();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      remote_device_copy_service_cold_3();

    v11 = __error();
    v12 = 0;
    v13 = 83;
    goto LABEL_22;
  }
  string = xpc_dictionary_get_string(v8, "result");
  if (string && strcmp(string, "OK"))
  {
    v10 = rsd_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D3442000, v10, OS_LOG_TYPE_DEFAULT, "remote_device_copy_service: service not found", buf, 2u);
    }

    v11 = __error();
    v12 = 0;
    v13 = 3;
LABEL_22:
    *v11 = v13;
    goto LABEL_23;
  }
  xpc_dictionary_get_dictionary(v8, "service");
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
    remote_device_copy_service_cold_4(&v36, buf);
  v15 = (void *)v14;
  v16 = v5;
  v17 = v15;
  if (MEMORY[0x1D824F93C]() != MEMORY[0x1E0C812F8])
    remote_device_copy_service_cold_9(&v36, buf);
  v12 = objc_alloc_init(OS_remote_service);
  v18 = rsd_log();
  v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);

  if (v19)
  {
    v20 = (void *)xpc_copy_clean_description();
    v21 = rsd_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      remote_device_copy_service_cold_8();

    free(v20);
  }
  v22 = xpc_dictionary_get_string(v17, "name");
  if (!v22)
    remote_device_copy_service_cold_5(&v36, buf);
  v12->name = strdup(v22);
  objc_storeStrong((id *)&v12->device, a1);
  xpc_dictionary_get_dictionary(v17, "properties");
  v23 = objc_claimAutoreleasedReturnValue();
  properties = v12->properties;
  v12->properties = (OS_xpc_object *)v23;

  xpc_dictionary_get_value(v17, "endpoint");
  v25 = (_xpc_endpoint_s *)objc_claimAutoreleasedReturnValue();
  if (!v25)
    remote_device_copy_service_cold_6(&v36, buf);
  v26 = v25;
  v27 = xpc_connection_create_from_endpoint(v25);
  if (!v27)
    remote_device_copy_service_cold_7(&v36, buf);
  v28 = v27;
  v29 = remoted_queue();
  xpc_connection_set_target_queue(v28, v29);

  xpc_connection_set_event_handler(v28, &__block_literal_global_358);
  xpc_connection_activate(v28);
  connection = v12->connection;
  v12->connection = v28;
  v31 = v28;

  v32 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  proxies = v12->proxies;
  v12->proxies = v32;

LABEL_23:
  return v12;
}

uint64_t remote_device_check_service(void *a1, const char *a2)
{
  id v3;
  void *v4;
  xpc_object_t v5;
  _xpc_connection_s *v6;
  xpc_object_t v7;
  const char *string;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  if (!v3)
    remote_device_get_type_cold_1();
  if (!a2)
    remote_device_copy_service_cold_2();
  v4 = v3;
  _remote_device_crash_if_not_connected(v3);
  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "cmd", "check_service");
  xpc_dictionary_set_string(v5, "name", a2);
  objc_msgSend(v4, "connection");
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v7 = xpc_connection_send_message_with_reply_sync(v6, v5);

  if (MEMORY[0x1D824F93C](v7) == MEMORY[0x1E0C81310])
  {
    v10 = rsd_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      remote_device_check_service_cold_3();

    v9 = 0;
    *__error() = 83;
  }
  else
  {
    string = xpc_dictionary_get_string(v7, "result");
    if (string && !strcmp(string, "OK"))
    {
      v11 = rsd_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 136446210;
        v14 = a2;
        _os_log_impl(&dword_1D3442000, v11, OS_LOG_TYPE_DEFAULT, "remote_device_check_service: service %{public}s found", (uint8_t *)&v13, 0xCu);
      }

      v9 = 1;
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

uint64_t remote_device_get_state(void *a1)
{
  id v1;
  void *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;

  v1 = a1;
  if (!v1)
    remote_device_get_type_cold_1();
  v2 = v1;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = -1431655766;
  objc_msgSend(v1, "dq");
  v3 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __remote_device_get_state_block_invoke;
  v7[3] = &unk_1E9538A30;
  v8 = v2;
  v9 = &v10;
  v4 = v2;
  dispatch_sync(v3, v7);

  v5 = *((unsigned int *)v11 + 6);
  _Block_object_dispose(&v10, 8);
  return v5;
}

void sub_1D3447CDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __remote_device_get_state_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "state");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void remote_device_set_connected_callback(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  if (!v5)
    remote_device_get_type_cold_1();
  v8 = v7;
  if (!v7)
    remote_device_set_connected_callback_cold_2();
  objc_msgSend(v5, "dq");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __remote_device_set_connected_callback_block_invoke;
  block[3] = &unk_1E9538B20;
  v14 = v5;
  v15 = v6;
  v16 = v8;
  v10 = v8;
  v11 = v6;
  v12 = v5;
  dispatch_sync(v9, block);

}

void __remote_device_set_connected_callback_block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  if (objc_msgSend(*(id *)(a1 + 32), "state") == 2
    || objc_msgSend(*(id *)(a1 + 32), "state") == 3)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __remote_device_set_connected_callback_block_invoke_2;
    v3[3] = &unk_1E9538AF8;
    v2 = *(NSObject **)(a1 + 40);
    v5 = *(id *)(a1 + 48);
    v4 = *(id *)(a1 + 32);
    dispatch_async(v2, v3);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setConnected_callback:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "setConnected_callback_queue:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "setConnected_callback_self_retain:", *(_QWORD *)(a1 + 32));
  }
}

uint64_t __remote_device_set_connected_callback_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void remote_device_set_disconnected_callback(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  if (!v5)
    remote_device_get_type_cold_1();
  v8 = v7;
  if (!v7)
    remote_device_set_connected_callback_cold_2();
  objc_msgSend(v5, "dq");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __remote_device_set_disconnected_callback_block_invoke;
  block[3] = &unk_1E9538B20;
  v14 = v5;
  v15 = v6;
  v16 = v8;
  v10 = v8;
  v11 = v6;
  v12 = v5;
  dispatch_sync(v9, block);

}

void __remote_device_set_disconnected_callback_block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  if (objc_msgSend(*(id *)(a1 + 32), "state") == 3)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __remote_device_set_disconnected_callback_block_invoke_2;
    v3[3] = &unk_1E9538AF8;
    v2 = *(NSObject **)(a1 + 40);
    v5 = *(id *)(a1 + 48);
    v4 = *(id *)(a1 + 32);
    dispatch_async(v2, v3);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setDisconnected_callback:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "setDisconnected_callback_queue:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "setDisconnected_callback_self_retain:", *(_QWORD *)(a1 + 32));
  }
}

uint64_t __remote_device_set_disconnected_callback_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void remote_device_cancel(void *a1)
{
  id v1;
  void *v2;
  NSObject *v3;
  id v4;
  _QWORD block[4];
  id v6;

  v1 = a1;
  if (!v1)
    remote_device_get_type_cold_1();
  v2 = v1;
  objc_msgSend(v1, "dq");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __remote_device_cancel_block_invoke;
  block[3] = &unk_1E9538990;
  v6 = v2;
  v4 = v2;
  dispatch_sync(v3, block);

}

void __remote_device_cancel_block_invoke(uint64_t a1)
{
  _xpc_connection_s *v1;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v1 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_cancel(v1);

}

void remote_device_heartbeat(void *a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  xpc_object_t v9;
  _xpc_connection_s *v10;
  id v11;
  _QWORD handler[4];
  id v13;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  if (!v5)
    remote_device_get_type_cold_1();
  v8 = v7;
  v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v9, "cmd", "heartbeat");
  objc_msgSend(v5, "connection");
  v10 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __remote_device_heartbeat_block_invoke;
  handler[3] = &unk_1E9538B48;
  v13 = v8;
  v11 = v8;
  xpc_connection_send_message_with_reply(v10, v9, v6, handler);

}

void __remote_device_heartbeat_block_invoke(uint64_t a1, void *a2)
{
  const char *string;
  uint64_t v4;
  _BOOL8 v5;
  xpc_object_t xdict;

  xdict = a2;
  if (MEMORY[0x1D824F93C]() == MEMORY[0x1E0C81310])
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0);
  }
  else
  {
    string = xpc_dictionary_get_string(xdict, "result");
    v4 = *(_QWORD *)(a1 + 32);
    if (string)
      v5 = strcmp(string, "OK") == 0;
    else
      v5 = 0;
    (*(void (**)(uint64_t, _BOOL8))(v4 + 16))(v4, v5);
  }

}

uint64_t remote_device_get_heartbeat_stats(void *a1, _OWORD *a2)
{
  id v3;
  void *v4;
  xpc_object_t v5;
  _xpc_connection_s *v6;
  xpc_object_t v7;
  __int128 *data;
  BOOL v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  size_t length;

  v3 = a1;
  if (!v3)
    remote_device_get_type_cold_1();
  v4 = v3;
  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "cmd", "get_heartbeat_stats");
  objc_msgSend(v4, "connection");
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v7 = xpc_connection_send_message_with_reply_sync(v6, v5);

  if (MEMORY[0x1D824F93C](v7) == MEMORY[0x1E0C81310])
  {
    v10 = 0;
  }
  else
  {
    length = 0xAAAAAAAAAAAAAAAALL;
    data = (__int128 *)xpc_dictionary_get_data(v7, "heartbeat_stats", &length);
    if (data)
      v9 = length == 48;
    else
      v9 = 0;
    v10 = v9;
    if (v9)
    {
      v11 = *data;
      v12 = data[2];
      a2[1] = data[1];
      a2[2] = v12;
      *a2 = v11;
    }
  }

  return v10;
}

uint64_t remote_device_timesync(void *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  xpc_object_t v3;
  _xpc_connection_s *v4;
  xpc_object_t v5;
  const char *string;
  int int64;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  int v12;
  uint64_t v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (!v1)
    remote_device_get_type_cold_1();
  v2 = v1;
  _remote_device_crash_if_not_connected(v1);
  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "cmd", "timesync");
  objc_msgSend(v2, "connection");
  v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v5 = xpc_connection_send_message_with_reply_sync(v4, v3);

  if (MEMORY[0x1D824F93C](v5) == MEMORY[0x1E0C81310])
  {
    v8 = rsd_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      remote_device_timesync_cold_2();
    int64 = 35;
    goto LABEL_11;
  }
  string = xpc_dictionary_get_string(v5, "result");
  if (string && strcmp(string, "OK"))
  {
    int64 = xpc_dictionary_get_int64(v5, "error_code");
    v8 = rsd_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v2[1];
      v12 = 136446466;
      v13 = v9;
      v14 = 1024;
      v15 = int64;
      _os_log_impl(&dword_1D3442000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s> remote_device_timesync: %{errno}d", (uint8_t *)&v12, 0x12u);
    }
LABEL_11:

    v10 = 0;
    *__error() = int64;
    goto LABEL_12;
  }
  v10 = 1;
LABEL_12:

  return v10;
}

uint64_t remote_device_reset(void *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  xpc_object_t v3;
  _xpc_connection_s *v4;
  xpc_object_t v5;
  const char *string;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (!v1)
    remote_device_get_type_cold_1();
  v2 = v1;
  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "cmd", "reset");
  objc_msgSend(v2, "connection");
  v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v5 = xpc_connection_send_message_with_reply_sync(v4, v3);

  if (MEMORY[0x1D824F93C](v5) == MEMORY[0x1E0C81310])
  {
    v7 = rsd_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      remote_device_reset_cold_2();
    v9 = 35;
    goto LABEL_12;
  }
  string = xpc_dictionary_get_string(v5, "result");
  if (string && strcmp(string, "OK"))
  {
    v7 = rsd_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v2[1];
      v12 = 136446210;
      v13 = v8;
      _os_log_impl(&dword_1D3442000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s> remote_device_reset: client lacks privilege", (uint8_t *)&v12, 0xCu);
    }
    v9 = 1;
LABEL_12:

    v10 = 0;
    *__error() = v9;
    goto LABEL_13;
  }
  v10 = 1;
LABEL_13:

  return v10;
}

uint64_t remote_device_disconnect(void *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  xpc_object_t v3;
  _xpc_connection_s *v4;
  xpc_object_t v5;
  const char *string;
  int int64;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  int v12;
  uint64_t v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (!v1)
    remote_device_get_type_cold_1();
  v2 = v1;
  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "cmd", "disconnect_device");
  objc_msgSend(v2, "connection");
  v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v5 = xpc_connection_send_message_with_reply_sync(v4, v3);

  if (MEMORY[0x1D824F93C](v5) == MEMORY[0x1E0C81310])
  {
    v8 = rsd_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      remote_device_disconnect_cold_2();
    int64 = 35;
    goto LABEL_11;
  }
  string = xpc_dictionary_get_string(v5, "result");
  if (string && strcmp(string, "OK"))
  {
    int64 = xpc_dictionary_get_int64(v5, "error_code");
    v8 = rsd_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v2[1];
      v12 = 136446466;
      v13 = v9;
      v14 = 1024;
      v15 = int64;
      _os_log_impl(&dword_1D3442000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s> remote_device_disconnect: %{errno}d", (uint8_t *)&v12, 0x12u);
    }
LABEL_11:

    v10 = 0;
    *__error() = int64;
    goto LABEL_12;
  }
  v10 = 1;
LABEL_12:

  return v10;
}

uint64_t remote_device_set_alias(void *a1, const char *a2)
{
  _QWORD *v3;
  _QWORD *v4;
  xpc_object_t v5;
  _xpc_connection_s *v6;
  xpc_object_t v7;
  const char *string;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  if (!v3)
    remote_device_get_type_cold_1();
  if (!a2)
    remote_device_set_alias_cold_2();
  v4 = v3;
  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "cmd", "set_alias");
  xpc_dictionary_set_string(v5, "device_alias", a2);
  objc_msgSend(v4, "connection");
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v7 = xpc_connection_send_message_with_reply_sync(v6, v5);

  if (MEMORY[0x1D824F93C](v7) == MEMORY[0x1E0C81310])
  {
    v11 = 0;
  }
  else
  {
    string = xpc_dictionary_get_string(v7, "result");
    if (!string || !strcmp(string, "OK"))
    {
      v11 = 1;
    }
    else
    {
      v9 = rsd_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = v4[1];
        v13 = 136446210;
        v14 = v10;
        _os_log_impl(&dword_1D3442000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s> remote_device_set_alias: client lacks privilege", (uint8_t *)&v13, 0xCu);
      }

      v11 = 0;
      *__error() = 1;
    }
  }

  return v11;
}

uint64_t remote_device_get_alias(void *a1)
{
  id v1;
  void *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  unint64_t v13;

  v1 = a1;
  if (!v1)
    remote_device_get_type_cold_1();
  v2 = v1;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0xAAAAAAAAAAAAAAAALL;
  objc_msgSend(v1, "dq");
  v3 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __remote_device_get_alias_block_invoke;
  v7[3] = &unk_1E9538A30;
  v8 = v2;
  v9 = &v10;
  v4 = v2;
  dispatch_sync(v3, v7);

  v5 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v5;
}

void sub_1D3448B44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __remote_device_get_alias_block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 16);
  return result;
}

uint64_t local_device_copy_description()
{
  xpc_object_t v0;
  _xpc_connection_s *v1;
  xpc_object_t v2;
  const char *string;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v8;
  uint8_t buf[88];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v0 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v0, "cmd", "get_local_device_description");
  v1 = (_xpc_connection_s *)remoted_conn();
  v2 = xpc_connection_send_message_with_reply_sync(v1, v0);

  if (MEMORY[0x1D824F93C](v2) == MEMORY[0x1E0C81310])
  {
    v6 = rsd_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      local_device_copy_description_cold_1();

    v5 = 0;
    *__error() = 35;
  }
  else
  {
    string = xpc_dictionary_get_string(v2, "result");
    if (!string || !strcmp(string, "OK"))
    {
      xpc_dictionary_get_dictionary(v2, "device");
      v5 = objc_claimAutoreleasedReturnValue();
      if (!v5)
        local_device_copy_description_cold_2(&v8, buf);
    }
    else
    {
      v4 = rsd_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D3442000, v4, OS_LOG_TYPE_DEFAULT, "local_device_copy_description: failed", buf, 2u);
      }

      v5 = 0;
    }
  }

  return v5;
}

id remoted_conn()
{
  if (remoted_conn_once != -1)
    dispatch_once(&remoted_conn_once, &__block_literal_global_360);
  return (id)remoted_conn_conn;
}

uint64_t local_device_copy_identity()
{
  xpc_object_t empty;
  void *v1;
  _xpc_connection_s *v2;
  xpc_object_t v3;
  const char *string;
  NSObject *v5;
  void *v6;
  id v7;
  const void *bytes_ptr;
  SecCertificateRef v9;
  SecCertificateRef v10;
  SecAccessControlRef v11;
  void *v12;
  id v13;
  const void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const __CFDictionary *v20;
  SecKeyRef v21;
  SecCertificateRef v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  SecCertificateRef v27;
  const __CFData *data;
  xpc_object_t xdict;
  xpc_object_t xdata;
  CFErrorRef error;
  _QWORD v32[4];
  _QWORD v33[4];
  int v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  error = 0;
  empty = xpc_dictionary_create_empty();
  v1 = empty;
  if (!empty)
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v36 = 0u;
    os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    v34 = 134217984;
    v35 = 0;
    _os_log_send_and_compose_impl();
    v25 = _os_crash_msg();
    _remote_service_create_connected_socket_impl_cold_1(v25);
  }
  xpc_dictionary_set_string(empty, "cmd", "get_local_device_identity");
  v2 = (_xpc_connection_s *)remoted_conn();
  v3 = xpc_connection_send_message_with_reply_sync(v2, v1);

  if (!v3)
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v36 = 0u;
    os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    v34 = 134217984;
    v35 = 0;
    _os_log_send_and_compose_impl();
    v26 = _os_crash_msg();
    _remote_service_create_connected_socket_impl_cold_1(v26);
  }
  if (MEMORY[0x1D824F93C](v3) == MEMORY[0x1E0C81310])
  {
    v5 = rsd_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      local_device_copy_identity_cold_3();
    goto LABEL_23;
  }
  string = xpc_dictionary_get_string(v3, "result");
  if (string && strcmp(string, "OK"))
  {
    v5 = rsd_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      local_device_copy_identity_cold_13();
LABEL_23:
    v22 = 0;
    v11 = 0;
    v21 = 0;
    v16 = 0;
    v20 = 0;
    data = 0;
    xdict = 0;
LABEL_24:
    v12 = 0;
    xdata = 0;
    goto LABEL_25;
  }
  xpc_dictionary_get_dictionary(v3, "identity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  xdict = v6;
  if (!v6)
  {
    v5 = rsd_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      local_device_copy_identity_cold_4();
    goto LABEL_23;
  }
  xpc_dictionary_get_value(v6, "identity_cert");
  xdata = (xpc_object_t)objc_claimAutoreleasedReturnValue();
  if (!xdata)
  {
    v5 = rsd_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      local_device_copy_identity_cold_5();
    v22 = 0;
    v11 = 0;
    v21 = 0;
    v16 = 0;
    v20 = 0;
    data = 0;
    goto LABEL_24;
  }
  v7 = objc_alloc(MEMORY[0x1E0C99D50]);
  bytes_ptr = xpc_data_get_bytes_ptr(xdata);
  data = (const __CFData *)objc_msgSend(v7, "initWithBytes:length:", bytes_ptr, xpc_data_get_length(xdata));
  if (!data)
  {
    v5 = rsd_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      local_device_copy_identity_cold_6();
    v22 = 0;
    v11 = 0;
    v21 = 0;
    v16 = 0;
    v20 = 0;
    data = 0;
    goto LABEL_48;
  }
  v9 = SecCertificateCreateWithData(0, data);
  if (!v9)
  {
    v5 = rsd_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      local_device_copy_identity_cold_7();
    v22 = 0;
    goto LABEL_46;
  }
  v10 = v9;
  v11 = SecAccessControlCreateWithFlags(0, (CFTypeRef)*MEMORY[0x1E0CD68D0], 0x40000000uLL, &error);
  v27 = v10;
  if (!v11)
  {
    v5 = rsd_log();
    v22 = v10;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      local_device_copy_identity_cold_8();
LABEL_46:
    v11 = 0;
LABEL_47:
    v21 = 0;
    v16 = 0;
    v20 = 0;
LABEL_48:
    v12 = 0;
    goto LABEL_25;
  }
  xpc_dictionary_get_value(xdict, "identity_key");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v5 = rsd_log();
    v22 = v10;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      local_device_copy_identity_cold_9();
    goto LABEL_47;
  }
  v13 = objc_alloc(MEMORY[0x1E0C99D50]);
  v14 = xpc_data_get_bytes_ptr(v12);
  v15 = objc_msgSend(v13, "initWithBytes:length:", v14, xpc_data_get_length(v12));
  v16 = (void *)v15;
  if (v15)
  {
    v17 = *MEMORY[0x1E0CD6890];
    v32[0] = *MEMORY[0x1E0CD6BB8];
    v32[1] = v17;
    v18 = *MEMORY[0x1E0CD6B98];
    v32[2] = *MEMORY[0x1E0CD69D8];
    v32[3] = v18;
    v33[0] = v15;
    v33[1] = v11;
    v19 = *MEMORY[0x1E0CD6BA0];
    v33[2] = MEMORY[0x1E0C9AAA0];
    v33[3] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 4);
    v20 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v21 = SecKeyCreateWithData((CFDataRef)objc_msgSend(MEMORY[0x1E0C99D50], "data"), v20, &error);
    if (v21)
    {
      v22 = v27;
      v23 = SecIdentityCreate();
      if (v23)
        goto LABEL_26;
      v5 = rsd_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        local_device_copy_identity_cold_12();
    }
    else
    {
      v5 = rsd_log();
      v22 = v27;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        local_device_copy_identity_cold_11();
      v21 = 0;
    }
  }
  else
  {
    v5 = rsd_log();
    v22 = v27;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      local_device_copy_identity_cold_10();
    v21 = 0;
    v16 = 0;
    v20 = 0;
  }
LABEL_25:

  v23 = 0;
LABEL_26:

  if (v21)
    CFRelease(v21);
  if (v11)
    CFRelease(v11);
  if (v22)
    CFRelease(v22);
  if (error)
    CFRelease(error);
  return v23;
}

void sub_1D34493F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, CFTypeRef cf, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, CFTypeRef a16)
{
  const void *v16;
  const void *v17;

  CFRelease(v16);
  CFRelease(v17);
  if (cf)
    CFRelease(cf);
  if (a16)
    CFRelease(a16);
  _Unwind_Resume(a1);
}

uint64_t local_device_delete_identity()
{
  xpc_object_t empty;
  void *v1;
  _xpc_connection_s *v2;
  xpc_object_t v3;
  const char *string;
  NSObject *v5;
  uint64_t v6;
  uint64_t v8;
  _OWORD v9[5];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  empty = xpc_dictionary_create_empty();
  if (!empty)
    local_device_delete_identity_cold_1(&v8, v9);
  v1 = empty;
  xpc_dictionary_set_string(empty, "cmd", "delete_local_device_identity");
  v2 = (_xpc_connection_s *)remoted_conn();
  v3 = xpc_connection_send_message_with_reply_sync(v2, v1);

  if (!v3)
    local_device_delete_identity_cold_2(&v8, v9);
  if (MEMORY[0x1D824F93C](v3) == MEMORY[0x1E0C81310])
  {
    v5 = rsd_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      local_device_delete_identity_cold_3();
    goto LABEL_11;
  }
  string = xpc_dictionary_get_string(v3, "result");
  if (string && strcmp(string, "OK"))
  {
    v5 = rsd_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      local_device_delete_identity_cold_4();
LABEL_11:

    v6 = 0;
    goto LABEL_12;
  }
  v6 = 1;
LABEL_12:

  return v6;
}

uint64_t local_device_create_identity()
{
  xpc_object_t empty;
  void *v1;
  _xpc_connection_s *v2;
  xpc_object_t v3;
  const char *string;
  NSObject *v5;
  uint64_t v6;
  uint64_t v8;
  _OWORD v9[5];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  empty = xpc_dictionary_create_empty();
  if (!empty)
    local_device_delete_identity_cold_1(&v8, v9);
  v1 = empty;
  xpc_dictionary_set_string(empty, "cmd", "create_local_device_identity");
  v2 = (_xpc_connection_s *)remoted_conn();
  v3 = xpc_connection_send_message_with_reply_sync(v2, v1);

  if (!v3)
    local_device_delete_identity_cold_2(&v8, v9);
  if (MEMORY[0x1D824F93C](v3) == MEMORY[0x1E0C81310])
  {
    v5 = rsd_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      local_device_create_identity_cold_3();
    goto LABEL_11;
  }
  string = xpc_dictionary_get_string(v3, "result");
  if (string && strcmp(string, "OK"))
  {
    v5 = rsd_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      local_device_create_identity_cold_4();
LABEL_11:

    v6 = 0;
    goto LABEL_12;
  }
  v6 = 1;
LABEL_12:

  return v6;
}

uint64_t local_device_copy_service_names()
{
  xpc_object_t v0;
  _xpc_connection_s *v1;
  xpc_object_t v2;
  const char *string;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v8;
  uint8_t buf[88];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v0 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v0, "cmd", "list_local_device_services");
  v1 = (_xpc_connection_s *)remoted_conn();
  v2 = xpc_connection_send_message_with_reply_sync(v1, v0);

  if (MEMORY[0x1D824F93C](v2) == MEMORY[0x1E0C81310])
  {
    v6 = rsd_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      local_device_copy_service_names_cold_1();

    v5 = 0;
    *__error() = 35;
  }
  else
  {
    string = xpc_dictionary_get_string(v2, "result");
    if (!string || !strcmp(string, "OK"))
    {
      xpc_dictionary_get_array(v2, "services");
      v5 = objc_claimAutoreleasedReturnValue();
      if (!v5)
        local_device_copy_service_names_cold_2(&v8, buf);
    }
    else
    {
      v4 = rsd_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D3442000, v4, OS_LOG_TYPE_DEFAULT, "local_device_copy_service_names: failed", buf, 2u);
      }

      v5 = 0;
    }
  }

  return v5;
}

OS_remote_device *remote_device_copy_unique_of_type(unsigned int a1)
{
  xpc_object_t v2;
  _xpc_connection_s *v3;
  xpc_object_t v4;
  const char *string;
  NSObject *v6;
  int *v7;
  OS_remote_device *v8;
  int v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v14;
  uint8_t buf[88];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a1 - 17 <= 0xFFFFFFEF)
    remote_device_copy_unique_of_type_cold_1();
  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, "cmd", "get_unique_device");
  xpc_dictionary_set_uint64(v2, "device_type", a1);
  v3 = (_xpc_connection_s *)remoted_conn();
  v4 = xpc_connection_send_message_with_reply_sync(v3, v2);

  if (MEMORY[0x1D824F93C](v4) == MEMORY[0x1E0C81310])
  {
    v12 = rsd_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      remote_device_copy_unique_of_type_cold_2();

    v7 = __error();
    v8 = 0;
    v9 = 35;
    goto LABEL_13;
  }
  string = xpc_dictionary_get_string(v4, "result");
  if (string && strcmp(string, "OK"))
  {
    v6 = rsd_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D3442000, v6, OS_LOG_TYPE_DEFAULT, "remote_device_copy_unique_of_type: device not found", buf, 2u);
    }

    v7 = __error();
    v8 = 0;
    v9 = 3;
LABEL_13:
    *v7 = v9;
    goto LABEL_14;
  }
  xpc_dictionary_get_dictionary(v4, "device");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
    remote_device_copy_unique_of_type_cold_3(&v14, buf);
  v11 = v10;
  v8 = remote_device_create_from_client_description(v10);

LABEL_14:
  return v8;
}

OS_remote_device *remote_device_create_from_client_description(void *a1)
{
  id v1;
  NSObject *v2;
  _BOOL4 v3;
  void *v4;
  NSObject *v5;
  OS_remote_device *v6;
  _xpc_endpoint_s *v7;
  _xpc_connection_s *v8;
  NSObject *v9;
  uint64_t v10;
  _xpc_connection_s *v11;
  NSObject *v12;
  id v13;
  OS_remote_device *v14;
  xpc_object_t v15;
  OS_remote_device *v16;
  _QWORD block[4];
  id v19;
  OS_remote_device *v20;
  _QWORD handler[4];
  _xpc_connection_s *v22;
  id v23;
  id location;

  v1 = a1;
  v2 = rsd_log();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG);

  if (v3)
  {
    v4 = (void *)xpc_copy_clean_description();
    v5 = rsd_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      remote_device_create_from_client_description_cold_1();

    free(v4);
  }
  v6 = objc_alloc_init(OS_remote_device);
  remote_device_update_from_client_description(v6, v1);
  xpc_dictionary_get_value(v1, "endpoint");
  v7 = (_xpc_endpoint_s *)objc_claimAutoreleasedReturnValue();
  v8 = xpc_connection_create_from_endpoint(v7);
  -[OS_remote_device dq](v6, "dq");
  v9 = objc_claimAutoreleasedReturnValue();
  xpc_connection_set_target_queue(v8, v9);

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, v6);
  v10 = MEMORY[0x1E0C809B0];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __remote_device_create_from_client_description_block_invoke;
  handler[3] = &unk_1E9538E58;
  objc_copyWeak(&v23, &location);
  v11 = v8;
  v22 = v11;
  xpc_connection_set_event_handler(v11, handler);
  -[OS_remote_device setConnection:](v6, "setConnection:", v11);
  -[OS_remote_device dq](v6, "dq");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = v10;
  block[1] = 3221225472;
  block[2] = __remote_device_create_from_client_description_block_invoke_364;
  block[3] = &unk_1E9538E80;
  v13 = v1;
  v19 = v13;
  v14 = v6;
  v20 = v14;
  dispatch_sync(v12, block);

  xpc_connection_activate(v11);
  v15 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v15, "cmd", "helo_device");
  xpc_dictionary_set_uint64(v15, "device_state", -[OS_remote_device state](v14, "state"));
  xpc_connection_send_message(v11, v15);
  v16 = v14;

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

  return v16;
}

void sub_1D3449CA4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

OS_remote_device *remote_device_copy_device_with_name(const char *a1)
{
  xpc_object_t v2;
  _xpc_connection_s *v3;
  xpc_object_t v4;
  const char *string;
  NSObject *v6;
  int *v7;
  OS_remote_device *v8;
  int v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v14;
  uint8_t buf[88];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, "cmd", "get_device");
  xpc_dictionary_set_string(v2, "device_name", a1);
  v3 = (_xpc_connection_s *)remoted_conn();
  v4 = xpc_connection_send_message_with_reply_sync(v3, v2);

  if (MEMORY[0x1D824F93C](v4) == MEMORY[0x1E0C81310])
  {
    v12 = rsd_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      remote_device_copy_device_with_name_cold_1();

    v7 = __error();
    v8 = 0;
    v9 = 35;
    goto LABEL_12;
  }
  string = xpc_dictionary_get_string(v4, "result");
  if (string && strcmp(string, "OK"))
  {
    v6 = rsd_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D3442000, v6, OS_LOG_TYPE_DEFAULT, "remote_device_copy_device_with_name: device not found", buf, 2u);
    }

    v7 = __error();
    v8 = 0;
    v9 = 3;
LABEL_12:
    *v7 = v9;
    goto LABEL_13;
  }
  xpc_dictionary_get_dictionary(v4, "device");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
    remote_device_copy_unique_of_type_cold_3(&v14, buf);
  v11 = v10;
  v8 = remote_device_create_from_client_description(v10);

LABEL_13:
  return v8;
}

OS_remote_device *remote_device_copy_device_with_uuid(const unsigned __int8 *a1)
{
  xpc_object_t v2;
  _xpc_connection_s *v3;
  xpc_object_t v4;
  const char *string;
  NSObject *v6;
  int *v7;
  OS_remote_device *v8;
  int v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v14;
  uint8_t buf[88];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, "cmd", "get_device");
  xpc_dictionary_set_uuid(v2, "UUID", a1);
  v3 = (_xpc_connection_s *)remoted_conn();
  v4 = xpc_connection_send_message_with_reply_sync(v3, v2);

  if (MEMORY[0x1D824F93C](v4) == MEMORY[0x1E0C81310])
  {
    v12 = rsd_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      remote_device_copy_device_with_name_cold_1();

    v7 = __error();
    v8 = 0;
    v9 = 35;
    goto LABEL_12;
  }
  string = xpc_dictionary_get_string(v4, "result");
  if (string && strcmp(string, "OK"))
  {
    v6 = rsd_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D3442000, v6, OS_LOG_TYPE_DEFAULT, "remote_device_copy_device_with_uuid: device not found", buf, 2u);
    }

    v7 = __error();
    v8 = 0;
    v9 = 3;
LABEL_12:
    *v7 = v9;
    goto LABEL_13;
  }
  xpc_dictionary_get_dictionary(v4, "device");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
    remote_device_copy_unique_of_type_cold_3(&v14, buf);
  v11 = v10;
  v8 = remote_device_create_from_client_description(v10);

LABEL_13:
  return v8;
}

OS_remote_device *remote_device_copy_device_with_uuid_and_trust_level(const unsigned __int8 *a1, int a2)
{
  xpc_object_t v4;
  const char *v5;
  _xpc_connection_s *v6;
  xpc_object_t v7;
  const char *string;
  NSObject *v9;
  int *v10;
  OS_remote_device *v11;
  int v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v17;
  uint8_t buf[88];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v4, "cmd", "get_device");
  xpc_dictionary_set_uuid(v4, "UUID", a1);
  if (a2)
    v5 = "trusted";
  else
    v5 = "untrusted";
  xpc_dictionary_set_string(v4, "trust_level", v5);
  v6 = (_xpc_connection_s *)remoted_conn();
  v7 = xpc_connection_send_message_with_reply_sync(v6, v4);

  if (MEMORY[0x1D824F93C](v7) == MEMORY[0x1E0C81310])
  {
    v15 = rsd_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      remote_device_copy_device_with_name_cold_1();

    v10 = __error();
    v11 = 0;
    v12 = 35;
    goto LABEL_15;
  }
  string = xpc_dictionary_get_string(v7, "result");
  if (string && strcmp(string, "OK"))
  {
    v9 = rsd_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D3442000, v9, OS_LOG_TYPE_DEFAULT, "remote_device_copy_device_with_uuid_and_trust_level: device not found", buf, 2u);
    }

    v10 = __error();
    v11 = 0;
    v12 = 3;
LABEL_15:
    *v10 = v12;
    goto LABEL_16;
  }
  xpc_dictionary_get_dictionary(v7, "device");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
    remote_device_copy_unique_of_type_cold_3(&v17, buf);
  v14 = v13;
  v11 = remote_device_create_from_client_description(v13);

LABEL_16:
  return v11;
}

void remote_device_browse_present(int a1, void *a2, void *a3)
{
  id v5;
  id v6;
  OS_remote_device_browser *v7;

  v5 = a3;
  v6 = a2;
  v7 = objc_alloc_init(OS_remote_device_browser);
  _remote_device_start_browsing(v7, a1, v6, v5, 1);

}

void _remote_device_start_browsing(void *a1, int a2, void *a3, void *a4, int a5)
{
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  dispatch_queue_t v12;
  NSObject *v13;
  xpc_connection_t mach_service;
  _xpc_connection_s *v15;
  id v16;
  _xpc_connection_s *v17;
  xpc_object_t v18;
  void *v19;
  NSObject *v20;
  _xpc_connection_s *v21;
  NSObject *v22;
  _QWORD handler[4];
  id v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  LODWORD(v8) = a2;
  v27 = *MEMORY[0x1E0C80C00];
  v9 = a1;
  if ((_DWORD)v8)
    v8 = v8;
  else
    v8 = 0xFFFFLL;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v9, "setDevice_type:", v8);
  objc_msgSend(v9, "setCallback:", v10);

  v12 = dispatch_queue_create_with_target_V2("remote device browse", 0, v11);
  objc_msgSend(v9, "setCbq:", v12);

  objc_msgSend(v9, "cbq");
  v13 = objc_claimAutoreleasedReturnValue();
  mach_service = remoted_connection_create_mach_service("com.apple.remoted", v13);
  objc_msgSend(v9, "setConnection:", mach_service);

  objc_msgSend(v9, "connection");
  v15 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = ___remote_device_start_browsing_block_invoke;
  handler[3] = &unk_1E9538968;
  v16 = v9;
  v24 = v16;
  xpc_connection_set_event_handler(v15, handler);

  objc_msgSend(v16, "connection");
  v17 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_activate(v17);

  v18 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v18, "cmd", "browse");
  xpc_dictionary_set_uint64(v18, "device_type", v8);
  if (a5)
    xpc_dictionary_set_BOOL(v18, "present_only", 1);
  v19 = (void *)MEMORY[0x1D824F828](v18);
  v20 = rsd_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v26 = v19;
    _os_log_impl(&dword_1D3442000, v20, OS_LOG_TYPE_DEFAULT, "Starting browsing: %s", buf, 0xCu);
  }

  free(v19);
  objc_msgSend(v16, "connection");
  v21 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "cbq");
  v22 = objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message_with_reply(v21, v18, v22, &__block_literal_global_376);

}

OS_remote_device_browser *remote_device_start_browsing(int a1, void *a2, void *a3)
{
  id v5;
  id v6;
  OS_remote_device_browser *v7;

  v5 = a3;
  v6 = a2;
  v7 = objc_alloc_init(OS_remote_device_browser);
  _remote_device_start_browsing(v7, a1, v6, v5, 0);

  return v7;
}

void remote_device_browser_cancel(void *a1)
{
  id v1;
  void *v2;
  NSObject *v3;
  uint8_t v4[16];

  v1 = a1;
  if (!v1)
    remote_device_browser_cancel_cold_1();
  v2 = v1;
  v3 = rsd_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D3442000, v3, OS_LOG_TYPE_DEFAULT, "Browsing stopped by client", v4, 2u);
  }

  _remote_device_browser_cancel(v2);
}

void _remote_device_browser_cancel(void *a1)
{
  id v1;
  _xpc_connection_s *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;

  v1 = a1;
  if ((objc_msgSend(v1, "canceling") & 1) == 0)
  {
    objc_msgSend(v1, "setCanceling:", 1);
    objc_msgSend(v1, "connection");
    v2 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    xpc_connection_cancel(v2);

    objc_msgSend(v1, "cbq");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = ___remote_device_browser_cancel_block_invoke;
    block[3] = &unk_1E9538990;
    v5 = v1;
    dispatch_async(v3, block);

  }
}

OS_remote_device_browser *remote_device_start_browsing_matching(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  OS_remote_device_browser *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  int matching_type;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  if (!v5)
    remote_device_start_browsing_matching_cold_1();
  v8 = v7;
  v9 = objc_alloc_init(OS_remote_device_browser);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __remote_device_start_browsing_matching_block_invoke;
  v16[3] = &unk_1E9538B98;
  v18 = v5;
  v19 = v8;
  v17 = v6;
  v10 = v5;
  v11 = v6;
  v12 = v8;
  v13 = (void *)MEMORY[0x1D824F5DC](v16);
  matching_type = _remote_device_get_matching_type(v10);
  _remote_device_start_browsing(v9, matching_type, v11, v13, 0);

  return v9;
}

void __remote_device_start_browsing_matching_block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  _OWORD v13[5];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (a3)
  {
    if (v5)
      __remote_device_start_browsing_matching_block_invoke_cold_1(&v12, v13);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v7 = rsd_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __remote_device_start_browsing_matching_block_invoke_cold_2();

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __remote_device_start_browsing_matching_block_invoke_253;
    v9[3] = &unk_1E9538B70;
    v8 = *(void **)(a1 + 32);
    v10 = *(id *)(a1 + 40);
    v11 = *(id *)(a1 + 48);
    remote_device_set_connected_callback(v6, v8, v9);

  }
}

void __remote_device_start_browsing_matching_block_invoke_253(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  int matching_type;
  const char *string;
  const char *v9;
  void *v10;
  size_t v11;
  const char *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;

  v3 = a2;
  if (remote_device_get_state(v3) == 2)
  {
    v4 = *(void **)(a1 + 32);
    v5 = v3;
    v6 = v4;
    matching_type = _remote_device_get_matching_type(v6);
    if (!matching_type || matching_type == remote_device_get_type(v5))
    {
      string = xpc_dictionary_get_string(v6, "AvailableService");
      if (!string)
      {
LABEL_17:

        v15 = rsd_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          __remote_device_start_browsing_matching_block_invoke_253_cold_1();

        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        goto LABEL_20;
      }
      v9 = string;
      v10 = (void *)remote_device_copy_service_names(v5);
      if (xpc_array_get_count(v10))
      {
        v11 = 0;
        while (1)
        {
          v12 = xpc_array_get_string(v10, v11);
          if (!strcmp(v9, v12))
            break;
          if (++v11 >= xpc_array_get_count(v10))
            goto LABEL_9;
        }

        goto LABEL_17;
      }
LABEL_9:

    }
    v13 = rsd_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      __remote_device_start_browsing_matching_block_invoke_253_cold_2();

    goto LABEL_20;
  }
  v14 = rsd_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    __remote_device_start_browsing_matching_block_invoke_253_cold_3();

LABEL_20:
}

uint64_t _remote_device_get_matching_type(void *a1)
{
  const char *string;
  const char *v2;
  uint64_t v3;

  string = xpc_dictionary_get_string(a1, "DeviceType");
  if (!string)
    return 0;
  v2 = string;
  v3 = 1;
  while (strcmp((const char *)remote_device_type_str[v3], v2))
  {
    if (++v3 == 17)
      return 0;
  }
  return v3;
}

void remote_service_listen_with_device(const char *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  char *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  char *v14;

  v5 = a2;
  v6 = a3;
  if (_set_stream_handler_once != -1)
    dispatch_once(&_set_stream_handler_once, &__block_literal_global);
  v7 = strdup(a1);
  v8 = _listening_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __remote_service_listen_with_device_block_invoke_3;
  block[3] = &unk_1E9538C48;
  v13 = v6;
  v14 = v7;
  v12 = v5;
  v9 = v5;
  v10 = v6;
  dispatch_async(v8, block);

}

void __remote_service_listen_with_device_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.RemoteServiceDiscovery.listener-demux", 0);
  v1 = (void *)_listening_queue;
  _listening_queue = (uint64_t)v0;

  xpc_set_event_stream_handler("com.apple.remoted.service", (dispatch_queue_t)_listening_queue, &__block_literal_global_272);
}

void __remote_service_listen_with_device_block_invoke_2(uint64_t a1, void *a2)
{
  const char *string;
  void *v4;
  void *v5;
  OS_remote_device *v6;
  uint64_t v7;
  OS_remote_pending_event *v8;
  xpc_object_t xdict;

  xdict = a2;
  string = xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1E0C81298]);
  _listening_service_find(string);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    xpc_dictionary_get_value(xdict, "device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = remote_device_create_from_client_description(v5);
    v7 = xpc_dictionary_dup_fd(xdict, "fd");
    _remote_service_accept(v4, v6, v7);

  }
  else
  {
    v8 = objc_alloc_init(OS_remote_pending_event);
    objc_storeStrong((id *)&v8->event, a2);
    v8->service_name = strdup(string);
    objc_storeStrong((id *)&v8->next, (id)_pending_events);
    v5 = (void *)_pending_events;
    _pending_events = (uint64_t)v8;
  }

}

id _listening_service_find(const char *a1)
{
  id v2;
  id v3;

  dispatch_assert_queue_V2((dispatch_queue_t)_listening_queue);
  v2 = (id)_listening_services;
  if (v2)
  {
    do
    {
      if (!strcmp(*((const char **)v2 + 1), a1))
        break;
      v3 = *((id *)v2 + 6);

      v2 = v3;
    }
    while (v3);
  }
  return v2;
}

void _remote_service_accept(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  int v7;
  uint64_t v8;
  SocketRemoteXpcProxy *v9;
  SocketRemoteXpcProxy *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  int v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id location[11];

  location[10] = *(id *)MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = objc_msgSend(v5, "shouldEncryptSocketData");
  v8 = MEMORY[0x1E0C809B0];
  if (v7 && _remote_device_supports_encrypting_socket_data(v6))
  {
    v9 = [SocketRemoteXpcProxy alloc];
    v10 = -[SocketRemoteXpcProxy initWithSocket:device:queue:server:](v9, "initWithSocket:device:queue:server:", a3, v6, _listening_queue, 1);
    location[0] = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(location, v10);
    LODWORD(a3) = -[SocketRemoteXpcProxy takeOwnershipOfClientSocket](v10, "takeOwnershipOfClientSocket");
    if ((a3 & 0x80000000) != 0)
    {
      v11 = rsd_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[OS_remote_service proxySocketOverRemoteXPC:].cold.2();

    }
    objc_msgSend(*((id *)v5 + 5), "addObject:", v10);
    v20[0] = v8;
    v20[1] = 3221225472;
    v20[2] = ___remote_service_accept_block_invoke;
    v20[3] = &unk_1E95389B8;
    v21 = v5;
    objc_copyWeak(&v22, location);
    -[SocketRemoteXpcProxy setOnCancel:](v10, "setOnCancel:", v20);
    -[SocketRemoteXpcProxy activate](v10, "activate");
    objc_destroyWeak(&v22);

    objc_destroyWeak(location);
  }
  if ((_DWORD)a3 == -1)
    _remote_service_accept_cold_1(&v19, location);
  v12 = *((_QWORD *)v5 + 2);
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = ___remote_service_accept_block_invoke_379;
  block[3] = &unk_1E9538EC8;
  v16 = v5;
  v17 = v6;
  v18 = a3;
  v13 = v6;
  v14 = v5;
  dispatch_async(v12, block);

}

void sub_1D344B150(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  id *v24;

  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __remote_service_listen_with_device_block_invoke_3(uint64_t a1)
{
  const char **v2;
  void *v3;
  NSObject *v4;
  OS_remote_listening_service *v5;
  uint64_t v6;
  id accept_block;
  NSMutableArray *v8;
  NSMutableArray *proxies;
  uint64_t v10;
  OS_xpc_object *properties;
  const char *v12;
  OS_remote_listening_service *v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  id *v17;
  id *v18;
  id *v19;
  _QWORD v20[2];
  void (*v21)(uint64_t, _QWORD *);
  void *v22;
  OS_remote_listening_service *v23;
  uint64_t v24;
  _OWORD v25[5];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = (const char **)(a1 + 48);
  v3 = (void *)xpc_copy_event();
  if (!v3)
  {
    v4 = rsd_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __remote_service_listen_with_device_block_invoke_3_cold_3();

  }
  _listening_service_find(*v2);
  if (objc_claimAutoreleasedReturnValue())
    __remote_service_listen_with_device_block_invoke_3_cold_2(&v24, v25);
  v5 = objc_alloc_init(OS_remote_listening_service);
  v5->service_name = *(const char **)(a1 + 48);
  v6 = MEMORY[0x1D824F5DC](*(_QWORD *)(a1 + 40));
  accept_block = v5->accept_block;
  v5->accept_block = (id)v6;

  objc_storeStrong((id *)&v5->queue, *(id *)(a1 + 32));
  objc_storeStrong((id *)&v5->next, (id)_listening_services);
  v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  proxies = v5->proxies;
  v5->proxies = v8;

  objc_storeStrong((id *)&_listening_services, v5);
  if (v3)
  {
    xpc_dictionary_get_value(v3, "ServiceProperties");
    v10 = objc_claimAutoreleasedReturnValue();
    properties = v5->properties;
    v5->properties = (OS_xpc_object *)v10;

  }
  if (v5->properties && MEMORY[0x1D824F93C]() != MEMORY[0x1E0C812F8])
    __remote_service_listen_with_device_block_invoke_3_cold_1(&v24, v25);
  v12 = *v2;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v21 = __remote_service_listen_with_device_block_invoke_278;
  v22 = &unk_1E9538C20;
  v13 = v5;
  v23 = v13;
  v14 = v20;
  dispatch_assert_queue_V2((dispatch_queue_t)_listening_queue);
  v15 = (id)_pending_events;
  if (v15)
  {
    v16 = v15;
    v17 = 0;
    do
    {
      if (!strcmp((const char *)v16[1], v12))
      {
        v21((uint64_t)v14, v16);
        if (v17)
          v18 = v17 + 3;
        else
          v18 = (id *)&_pending_events;
        objc_storeStrong(v18, (id)v16[3]);
      }
      v19 = v16;

      v16 = v19[3];
      v17 = v19;
    }
    while (v16);

  }
}

void __remote_service_listen_with_device_block_invoke_278(uint64_t a1, _QWORD *a2)
{
  void *v4;
  _QWORD *v5;
  OS_remote_device *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v4 = (void *)a2[2];
  v5 = a2;
  xpc_dictionary_get_value(v4, "device");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v6 = remote_device_create_from_client_description(v9);
  v7 = (void *)a2[2];

  v8 = xpc_dictionary_dup_fd(v7, "fd");
  _remote_service_accept(*(void **)(a1 + 32), v6, v8);

}

void remote_service_listen(const char *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __remote_service_listen_block_invoke;
  v7[3] = &unk_1E9538C70;
  v8 = v5;
  v6 = v5;
  remote_service_listen_with_device(a1, a2, v7);

}

uint64_t __remote_service_listen_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

BOOL remote_control_attach_loopback()
{
  return do_control_channel_request("attach_loopback", 0);
}

BOOL do_control_channel_request(const char *a1, const char *a2)
{
  _xpc_connection_s *mach_service;
  xpc_object_t v5;
  xpc_object_t v6;
  uint64_t v7;
  uint64_t v8;

  mach_service = remoted_connection_create_mach_service("com.apple.remoted.control", 0);
  xpc_connection_set_event_handler(mach_service, &__block_literal_global_381);
  xpc_connection_activate(mach_service);
  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "cmd", a1);
  if (a2)
    xpc_dictionary_set_string(v5, "arg", a2);
  v6 = xpc_connection_send_message_with_reply_sync(mach_service, v5);
  v7 = MEMORY[0x1D824F93C]();
  v8 = MEMORY[0x1E0C81310];
  if (v7 != MEMORY[0x1E0C81310])
    xpc_connection_cancel(mach_service);

  return v7 != v8;
}

BOOL remote_control_connect_loopback()
{
  return do_control_channel_request("connect_loopback", 0);
}

BOOL remote_control_detach_loopback()
{
  return do_control_channel_request("detach_loopback", 0);
}

BOOL remote_control_suspend_loopback()
{
  return do_control_channel_request("suspend_loopback", 0);
}

BOOL remote_control_resume_loopback()
{
  return do_control_channel_request("resume_loopback", 0);
}

BOOL remote_control_reset_loopback()
{
  return do_control_channel_request("reset_loopback", 0);
}

BOOL remote_control_enable_bonjour(const char *a1)
{
  return do_control_channel_request("enable_bonjour", a1);
}

BOOL remote_control_disable_bonjour()
{
  return do_control_channel_request("disable_bonjour", 0);
}

BOOL remote_control_enable_bonjour_loopback(const char *a1)
{
  return do_control_channel_request("enable_bonjour_loopback", a1);
}

BOOL remote_control_enable_network_peer(const char *a1)
{
  return do_control_channel_request("enable_network_peer", a1);
}

BOOL remote_control_disable_network_peer()
{
  return do_control_channel_request("disable_network_peer", 0);
}

BOOL remote_control_connect_network_peer(const char *a1)
{
  return do_control_channel_request("connect_network_peer", a1);
}

int64_t remote_compute_controller_add_node(const char *a1, const char *a2)
{
  _xpc_connection_s *mach_service;
  xpc_object_t v5;
  xpc_object_t v6;
  int64_t v7;
  NSObject *v8;

  if (!a1)
    remote_compute_controller_add_node_cold_1();
  if (!a2)
    remote_compute_controller_add_node_cold_2();
  mach_service = remoted_connection_create_mach_service("com.apple.remoted.compute-platform", 0);
  xpc_connection_set_event_handler(mach_service, &__block_literal_global_296);
  xpc_connection_activate(mach_service);
  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "cmd", "add_device");
  xpc_dictionary_set_string(v5, "address", a2);
  xpc_dictionary_set_string(v5, "interface_name", a1);
  v6 = xpc_connection_send_message_with_reply_sync(mach_service, v5);
  if (MEMORY[0x1D824F93C]() == MEMORY[0x1E0C81310])
  {
    v8 = rsd_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      remote_compute_controller_add_node_cold_3();
    v7 = 54;
    goto LABEL_10;
  }
  v7 = _check_operation_result(v6);
  if ((_DWORD)v7)
  {
    v8 = rsd_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      remote_compute_controller_add_node_cold_4();
LABEL_10:

  }
  xpc_connection_cancel(mach_service);

  return v7;
}

xpc_connection_t remoted_connection_create_mach_service(const char *a1, NSObject *a2)
{
  xpc_connection_t mach_service;
  int v4;

  v4 = 0;
  mach_service = xpc_connection_create_mach_service(a1, a2, 0);
  if (xpc_user_sessions_enabled()
    && xpc_is_system_session()
    && os_variant_is_darwinos())
  {
    xpc_user_sessions_get_foreground_uid();
    xpc_connection_set_target_user_session_uid();
  }
  return mach_service;
}

void __remote_compute_controller_add_node_block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v2;

  if (MEMORY[0x1D824F93C](a2) != MEMORY[0x1E0C81310])
  {
    v2 = rsd_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __remote_compute_controller_add_node_block_invoke_cold_1();

  }
}

int64_t _check_operation_result(void *a1)
{
  id v1;
  const char *string;
  int64_t int64;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = a1;
  string = xpc_dictionary_get_string(v1, "result");
  if (!string)
  {
    v4 = rsd_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      _check_operation_result_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
    goto LABEL_8;
  }
  if (!strcmp(string, "OK"))
  {
    int64 = 0;
    goto LABEL_10;
  }
  int64 = xpc_dictionary_get_int64(v1, "error_code");
  if (!(_DWORD)int64)
  {
    v4 = rsd_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      _check_operation_result_cold_2();
LABEL_8:

    int64 = 94;
  }
LABEL_10:

  return int64;
}

int64_t remote_compute_controller_remove_node(const char *a1)
{
  _xpc_connection_s *mach_service;
  xpc_object_t v3;
  xpc_object_t v4;
  int64_t v5;
  NSObject *v6;

  if (!a1)
    remote_compute_controller_add_node_cold_1();
  mach_service = xpc_connection_create_mach_service("com.apple.remoted.compute-platform", 0, 2uLL);
  xpc_connection_set_event_handler(mach_service, &__block_literal_global_300);
  xpc_connection_activate(mach_service);
  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "cmd", "remove_device");
  xpc_dictionary_set_string(v3, "interface_name", a1);
  v4 = xpc_connection_send_message_with_reply_sync(mach_service, v3);
  if (MEMORY[0x1D824F93C]() == MEMORY[0x1E0C81310])
  {
    v6 = rsd_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      remote_compute_controller_remove_node_cold_2();
    v5 = 54;
    goto LABEL_9;
  }
  v5 = _check_operation_result(v4);
  if ((_DWORD)v5)
  {
    v6 = rsd_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      remote_compute_controller_remove_node_cold_3();
LABEL_9:

  }
  xpc_connection_cancel(mach_service);

  return v5;
}

void __remote_compute_controller_remove_node_block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v2;

  if (MEMORY[0x1D824F93C](a2) != MEMORY[0x1E0C81310])
  {
    v2 = rsd_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __remote_compute_controller_add_node_block_invoke_cold_1();

  }
}

int64_t remote_compute_node_listen(const char *a1)
{
  _xpc_connection_s *mach_service;
  xpc_object_t v3;
  xpc_object_t v4;
  int64_t v5;
  NSObject *v6;

  if (!a1)
    remote_compute_controller_add_node_cold_1();
  mach_service = remoted_connection_create_mach_service("com.apple.remoted.compute-platform", 0);
  xpc_connection_set_event_handler(mach_service, &__block_literal_global_302);
  xpc_connection_activate(mach_service);
  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "cmd", "listen");
  xpc_dictionary_set_string(v3, "interface_name", a1);
  v4 = xpc_connection_send_message_with_reply_sync(mach_service, v3);
  if (MEMORY[0x1D824F93C]() == MEMORY[0x1E0C81310])
  {
    v6 = rsd_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      remote_compute_node_listen_cold_2();
    v5 = 54;
    goto LABEL_9;
  }
  v5 = _check_operation_result(v4);
  if ((_DWORD)v5)
  {
    v6 = rsd_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      remote_compute_node_listen_cold_3();
LABEL_9:

  }
  xpc_connection_cancel(mach_service);

  return v5;
}

void __remote_compute_node_listen_block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v2;

  if (MEMORY[0x1D824F93C](a2) != MEMORY[0x1E0C81310])
  {
    v2 = rsd_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __remote_compute_controller_add_node_block_invoke_cold_1();

  }
}

int64_t remote_compute_node_listen_cancel(const char *a1)
{
  _xpc_connection_s *mach_service;
  xpc_object_t v3;
  xpc_object_t v4;
  int64_t v5;
  NSObject *v6;

  if (!a1)
    remote_compute_controller_add_node_cold_1();
  mach_service = remoted_connection_create_mach_service("com.apple.remoted.compute-platform", 0);
  xpc_connection_set_event_handler(mach_service, &__block_literal_global_304);
  xpc_connection_activate(mach_service);
  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "cmd", "listen_cancel");
  xpc_dictionary_set_string(v3, "interface_name", a1);
  v4 = xpc_connection_send_message_with_reply_sync(mach_service, v3);
  if (MEMORY[0x1D824F93C]() == MEMORY[0x1E0C81310])
  {
    v6 = rsd_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      remote_compute_node_listen_cancel_cold_2();
    v5 = 54;
    goto LABEL_9;
  }
  v5 = _check_operation_result(v4);
  if ((_DWORD)v5)
  {
    v6 = rsd_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      remote_compute_node_listen_cancel_cold_3();
LABEL_9:

  }
  xpc_connection_cancel(mach_service);

  return v5;
}

void __remote_compute_node_listen_cancel_block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v2;

  if (MEMORY[0x1D824F93C](a2) != MEMORY[0x1E0C81310])
  {
    v2 = rsd_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __remote_compute_controller_add_node_block_invoke_cold_1();

  }
}

uint64_t remote_compute_node_disconnect_controller(void *a1)
{
  id v1;
  uint64_t v2;
  NSObject *v3;

  v1 = a1;
  if (objc_msgSend(v1, "type") == 15)
  {
    if ((remote_device_disconnect(v1) & 1) != 0)
      v2 = 0;
    else
      v2 = *__error();
  }
  else
  {
    v3 = rsd_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      remote_compute_node_disconnect_controller_cold_1();

    v2 = 22;
  }

  return v2;
}

int64_t remote_compute_controller_browse(const char *a1)
{
  _xpc_connection_s *mach_service;
  xpc_object_t v3;
  xpc_object_t v4;
  int64_t v5;
  NSObject *v6;

  if (!a1)
    remote_compute_controller_add_node_cold_1();
  mach_service = remoted_connection_create_mach_service("com.apple.remoted.compute-platform", 0);
  xpc_connection_set_event_handler(mach_service, &__block_literal_global_306);
  xpc_connection_activate(mach_service);
  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "cmd", "browse");
  xpc_dictionary_set_string(v3, "interface_name", a1);
  v4 = xpc_connection_send_message_with_reply_sync(mach_service, v3);
  if (MEMORY[0x1D824F93C]() == MEMORY[0x1E0C81310])
  {
    v6 = rsd_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      remote_compute_controller_browse_cold_2();
    v5 = 54;
    goto LABEL_9;
  }
  v5 = _check_operation_result(v4);
  if ((_DWORD)v5)
  {
    v6 = rsd_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      remote_compute_controller_browse_cold_3();
LABEL_9:

  }
  xpc_connection_cancel(mach_service);

  return v5;
}

void __remote_compute_controller_browse_block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v2;

  if (MEMORY[0x1D824F93C](a2) != MEMORY[0x1E0C81310])
  {
    v2 = rsd_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __remote_compute_controller_add_node_block_invoke_cold_1();

  }
}

int64_t remote_compute_controller_browse_cancel(const char *a1)
{
  _xpc_connection_s *mach_service;
  xpc_object_t v3;
  xpc_object_t v4;
  int64_t v5;
  NSObject *v6;

  if (!a1)
    remote_compute_controller_add_node_cold_1();
  mach_service = remoted_connection_create_mach_service("com.apple.remoted.compute-platform", 0);
  xpc_connection_set_event_handler(mach_service, &__block_literal_global_308);
  xpc_connection_activate(mach_service);
  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "cmd", "browse_cancel");
  xpc_dictionary_set_string(v3, "interface_name", a1);
  v4 = xpc_connection_send_message_with_reply_sync(mach_service, v3);
  if (MEMORY[0x1D824F93C]() == MEMORY[0x1E0C81310])
  {
    v6 = rsd_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      remote_compute_controller_browse_cancel_cold_2();
    v5 = 54;
    goto LABEL_9;
  }
  v5 = _check_operation_result(v4);
  if ((_DWORD)v5)
  {
    v6 = rsd_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      remote_compute_controller_browse_cancel_cold_3();
LABEL_9:

  }
  xpc_connection_cancel(mach_service);

  return v5;
}

void __remote_compute_controller_browse_cancel_block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v2;

  if (MEMORY[0x1D824F93C](a2) != MEMORY[0x1E0C81310])
  {
    v2 = rsd_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __remote_compute_controller_add_node_block_invoke_cold_1();

  }
}

int64_t local_device_compute_platform_require_tls(BOOL a1)
{
  _xpc_connection_s *mach_service;
  xpc_object_t v3;
  xpc_object_t v4;
  int64_t v5;
  NSObject *v6;

  mach_service = xpc_connection_create_mach_service("com.apple.remoted.compute-platform", 0, 2uLL);
  xpc_connection_set_event_handler(mach_service, &__block_literal_global_310);
  xpc_connection_activate(mach_service);
  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "cmd", "require_tls");
  xpc_dictionary_set_BOOL(v3, "is_tls_required", a1);
  v4 = xpc_connection_send_message_with_reply_sync(mach_service, v3);
  if (MEMORY[0x1D824F93C]() == MEMORY[0x1E0C81310])
  {
    v6 = rsd_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      local_device_compute_platform_require_tls_cold_1();
    v5 = 54;
    goto LABEL_8;
  }
  v5 = _check_operation_result(v4);
  if ((_DWORD)v5)
  {
    v6 = rsd_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      local_device_compute_platform_require_tls_cold_2();
LABEL_8:

  }
  xpc_connection_cancel(mach_service);

  return v5;
}

void __local_device_compute_platform_require_tls_block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v2;

  if (MEMORY[0x1D824F93C](a2) != MEMORY[0x1E0C81310])
  {
    v2 = rsd_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __local_device_compute_platform_require_tls_block_invoke_cold_1();

  }
}

uint64_t remote_compute_platform_tls_required(BOOL *a1)
{
  _xpc_connection_s *mach_service;
  xpc_object_t v3;
  xpc_object_t v4;
  int64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  mach_service = xpc_connection_create_mach_service("com.apple.remoted.compute-platform", 0, 2uLL);
  xpc_connection_set_event_handler(mach_service, &__block_literal_global_313);
  xpc_connection_activate(mach_service);
  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "cmd", "is_tls_required_cmd");
  v4 = xpc_connection_send_message_with_reply_sync(mach_service, v3);
  if (MEMORY[0x1D824F93C]() == MEMORY[0x1E0C81310])
  {
    v9 = rsd_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      local_device_compute_platform_require_tls_cold_1();

    v8 = 0;
    v6 = 54;
  }
  else
  {
    v5 = _check_operation_result(v4);
    if ((_DWORD)v5)
    {
      v6 = v5;
      v7 = rsd_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        remote_compute_platform_tls_required_cold_3();

      v8 = 0;
    }
    else
    {
      xpc_dictionary_get_value(v4, "is_tls_required");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v8 = v11;
        v6 = 0;
        if (a1)
          *a1 = xpc_BOOL_get_value(v11);
      }
      else
      {
        v12 = rsd_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          remote_compute_platform_tls_required_cold_2(v12, v13, v14, v15, v16, v17, v18, v19);

        v8 = 0;
        v6 = 72;
      }
    }
  }
  xpc_connection_cancel(mach_service);

  return v6;
}

void __remote_compute_platform_tls_required_block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v2;

  if (MEMORY[0x1D824F93C](a2) != MEMORY[0x1E0C81310])
  {
    v2 = rsd_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __local_device_compute_platform_require_tls_block_invoke_cold_1();

  }
}

uint64_t __remote_device_xpc_remote_connection_tls_enabled_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "remotexpc_tls_enabled");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

id remote_device_copy_xpc_remote_connection_tls_verify_block(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  _QWORD v5[4];
  id v6;

  v1 = a1;
  if (remote_device_xpc_remote_connection_tls_enabled(v1))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __remote_device_copy_xpc_remote_connection_tls_verify_block_block_invoke;
    v5[3] = &unk_1E9538940;
    v6 = v1;
    v2 = (void *)MEMORY[0x1D824F5DC](v5);
    v3 = (void *)objc_msgSend(v2, "copy");

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void __remote_device_copy_xpc_remote_connection_tls_verify_block_block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  remote_device_authenticate(*(void **)(a1 + 32), a3, a4);
}

sec_identity_t remote_service_copy_xpc_remote_connection_tls_identity(uint64_t a1)
{
  return remote_device_copy_xpc_remote_connection_tls_identity(*(void **)(a1 + 32));
}

id remote_service_copy_xpc_remote_connection_tls_verify_block(uint64_t a1)
{
  return remote_device_copy_xpc_remote_connection_tls_verify_block(*(void **)(a1 + 32));
}

void __rsd_log_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.RemoteServiceDiscovery", "RemoteServiceDiscovery");
  v1 = (void *)rsd_log__log;
  rsd_log__log = (uint64_t)v0;

}

void __remoted_queue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("remote client queue", 0);
  v1 = (void *)remoted_queue_queue;
  remoted_queue_queue = (uint64_t)v0;

}

intptr_t ___remote_service_create_connected_socket_impl_block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = _remote_service_create_connected_socket_impl(*(_QWORD *)(a1 + 32), 0);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void ___remote_service_connect_socket_impl_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  const char *string;
  const char *v5;
  NSObject *v6;
  int v7;
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  char v16;

  v3 = a2;
  if (MEMORY[0x1D824F93C]() == MEMORY[0x1E0C81310])
  {
    v6 = rsd_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      ___remote_service_connect_socket_impl_block_invoke_cold_1();
    goto LABEL_14;
  }
  string = xpc_dictionary_get_string(v3, "result");
  if (!string)
  {
    v6 = rsd_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      ___remote_service_connect_socket_impl_block_invoke_cold_2();
    goto LABEL_14;
  }
  v5 = string;
  if (!strcmp(string, "ERROR"))
  {
    v6 = rsd_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      ___remote_service_connect_socket_impl_block_invoke_cold_3();
    goto LABEL_14;
  }
  if (!strcmp(v5, "INTERRUPTED"))
  {
    v6 = rsd_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      ___remote_service_connect_socket_impl_block_invoke_cold_4();
    goto LABEL_14;
  }
  if (strcmp(v5, "OK"))
  {
    v6 = rsd_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      ___remote_service_connect_socket_impl_block_invoke_cold_6();
LABEL_14:

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_15;
  }
  v7 = xpc_dictionary_dup_fd(v3, "fd");
  v8 = rsd_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    ___remote_service_connect_socket_impl_block_invoke_cold_5();

  v9 = remoted_queue();
  v10 = rsd_log();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = ___remote_service_connect_socket_impl_block_invoke_353;
  v12[3] = &unk_1E9538DC8;
  v16 = *(_BYTE *)(a1 + 56);
  v11 = *(void **)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  v14 = *(id *)(a1 + 32);
  v15 = *(id *)(a1 + 48);
  remote_socket_poll_connect_async(v7, v9, v10, v11, v12);

LABEL_15:
}

void ___remote_service_connect_socket_impl_block_invoke_353(uint64_t a1, uint64_t a2, int a3)
{
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  uint8_t buf[16];

  if (a3 && *(_BYTE *)(a1 + 56))
  {
    v5 = rsd_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D3442000, v5, OS_LOG_TYPE_DEFAULT, "socket connection failed, heartbeat remote device and try again", buf, 2u);
    }

    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    v7 = remoted_queue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = ___remote_service_connect_socket_impl_block_invoke_354;
    v8[3] = &unk_1E9538DA0;
    v9 = *(id *)(a1 + 32);
    v10 = *(id *)(a1 + 40);
    v11 = *(id *)(a1 + 48);
    remote_device_heartbeat(v6, v7, v8);

  }
  else
  {
    if (remote_service_should_encrypt_socket_data(*(void **)(a1 + 32))
      && remote_device_xpc_remote_connection_tls_enabled(*(void **)(*(_QWORD *)(a1 + 32) + 32)))
    {
      objc_msgSend(*(id *)(a1 + 32), "proxySocketOverRemoteXPC:", a2);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

uint64_t ___remote_service_connect_socket_impl_block_invoke_354(_QWORD *a1)
{
  return _remote_service_connect_socket_impl(a1[4], a1[5], a1[6], 0);
}

void __remote_service_create_from_client_description_block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = rsd_log();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1D3442000, v0, OS_LOG_TYPE_DEFAULT, "Error on service connection", v1, 2u);
  }

}

void __remoted_conn_block_invoke()
{
  NSObject *v0;
  xpc_connection_t mach_service;
  void *v2;

  v0 = remoted_queue();
  mach_service = remoted_connection_create_mach_service("com.apple.remoted", v0);
  v2 = (void *)remoted_conn_conn;
  remoted_conn_conn = (uint64_t)mach_service;

  xpc_connection_set_event_handler((xpc_connection_t)remoted_conn_conn, &__block_literal_global_362);
  xpc_connection_activate((xpc_connection_t)remoted_conn_conn);
}

void __remoted_conn_block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;

  v2 = MEMORY[0x1D824F93C](a2);
  v3 = MEMORY[0x1E0C81310];
  v4 = rsd_log();
  v5 = v4;
  if (v2 == v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __remoted_conn_block_invoke_2_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __remoted_conn_block_invoke_2_cold_2();
  }

}

void remote_device_update_from_client_description(void *a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;
  _QWORD *v6;
  const char *string;
  char *v8;
  const char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _OWORD v13[5];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v11 = a1;
  v3 = a2;
  if (objc_msgSend(v11, "type"))
  {
    v4 = objc_msgSend(v11, "type");
    if (v4 != xpc_dictionary_get_uint64(v3, "device_type"))
      remote_device_update_from_client_description_cold_6(&v12, v13);
  }
  else
  {
    objc_msgSend(v11, "setType:", xpc_dictionary_get_uint64(v3, "device_type"));
    if (!objc_msgSend(v11, "type"))
      remote_device_update_from_client_description_cold_1(&v12, v13);
  }
  if (objc_msgSend(v11, "device_id"))
  {
    v5 = objc_msgSend(v11, "device_id");
    if (v5 != xpc_dictionary_get_uint64(v3, "device_id"))
      remote_device_update_from_client_description_cold_5(&v12, v13);
  }
  else
  {
    objc_msgSend(v11, "setDevice_id:", xpc_dictionary_get_uint64(v3, "device_id"));
    if (!objc_msgSend(v11, "device_id"))
      remote_device_update_from_client_description_cold_2(&v12, v13);
  }
  v6 = v11;
  if (!v11[1])
  {
    string = xpc_dictionary_get_string(v3, "device_name");
    if (!string)
      remote_device_update_from_client_description_cold_3(&v12, v13);
    v8 = strdup(string);
    v6 = v11;
    v11[1] = v8;
    if (!v8)
      remote_device_update_from_client_description_cold_4(&v12, v13);
  }
  if (!v6[2])
  {
    v9 = xpc_dictionary_get_string(v3, "device_alias");
    if (v9)
      v11[2] = strdup(v9);
  }
  objc_msgSend(v11, "setMessaging_protocol_version:", xpc_dictionary_get_uint64(v3, "device_messaging_protocol_version"));
  objc_msgSend(v11, "setRemotexpc_tls_enabled:", xpc_dictionary_get_BOOL(v3, "device_tls_enabled"));
  objc_msgSend(v11, "setUuid:", xpc_dictionary_get_uuid(v3, "UUID"));
  xpc_dictionary_get_dictionary(v3, "properties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setProperties:", v10);

}

void __remote_device_create_from_client_description_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  const char *string;
  const char *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  char *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  NSObject *v22;
  uint64_t uint64;
  uint64_t v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
  {
    v9 = rsd_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __remote_device_create_from_client_description_block_invoke_cold_1();
    goto LABEL_22;
  }
  if (MEMORY[0x1D824F93C](v3) != MEMORY[0x1E0C81310])
  {
    string = xpc_dictionary_get_string(v3, "cmd");
    v6 = string;
    if (!string || strcmp(string, "found_device"))
    {
      v7 = rsd_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = WeakRetained[1];
        *(_DWORD *)buf = 136446466;
        v26 = v8;
        v27 = 2080;
        v28 = v6;
        _os_log_impl(&dword_1D3442000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s> Device connection received unexpected command \"%s\"", buf, 0x16u);
      }

      goto LABEL_23;
    }
    v13 = rsd_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = WeakRetained[1];
      *(_DWORD *)buf = 136446210;
      v26 = v14;
      _os_log_impl(&dword_1D3442000, v13, OS_LOG_TYPE_INFO, "%{public}s> Updated device", buf, 0xCu);
    }

    v9 = WeakRetained;
    v15 = v3;
    -[NSObject dq](v9, "dq");
    v16 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v16);

    xpc_dictionary_get_dictionary(v15, "device");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
      __remote_device_create_from_client_description_block_invoke_cold_2(&v24, buf);
    v18 = (void *)v17;
    v19 = rsd_log();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);

    if (v20)
    {
      v21 = (void *)xpc_copy_clean_description();
      v22 = rsd_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        __remote_device_create_from_client_description_block_invoke_cold_3();

      free(v21);
    }
    remote_device_update_from_client_description(v9, v18);
    uint64 = xpc_dictionary_get_uint64(v18, "device_state");
    remote_device_advance_state(v9, uint64);

LABEL_22:
    goto LABEL_23;
  }
  v10 = (char *)MEMORY[0x1D824F828](v3);
  v11 = rsd_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = WeakRetained[1];
    *(_DWORD *)buf = 136446466;
    v26 = v12;
    v27 = 2080;
    v28 = v10;
    _os_log_impl(&dword_1D3442000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s> Error on device connection: %s", buf, 0x16u);
  }

  free(v10);
  if (v3 == (id)MEMORY[0x1E0C81258])
    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
  else
    remote_device_advance_state(WeakRetained, 3);
LABEL_23:

}

void remote_device_advance_state(void *a1, uint64_t a2)
{
  id v3;
  NSObject *v4;
  int v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  id v22;
  id v23;
  _QWORD block[4];
  id v25;
  id v26;
  uint64_t v27;
  _OWORD v28[5];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(v3, "dq");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  v5 = objc_msgSend(v3, "state");
  if (v5 != (_DWORD)a2)
  {
    v6 = v5;
    v7 = rsd_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      remote_device_advance_state_cold_4();

    switch(v6)
    {
      case 1:
        if ((a2 & 0xFFFFFFFE) != 2)
          remote_device_advance_state_cold_1(&v27, v28);
        break;
      case 2:
        if ((_DWORD)a2 != 3)
          remote_device_advance_state_cold_2(&v27, v28);
        break;
      case 3:
        remote_device_advance_state_cold_3();
    }
    objc_msgSend(v3, "setState:", a2);
    objc_msgSend(v3, "connected_callback");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {

      if ((a2 & 0xFFFFFFFE) == 2)
      {
        objc_msgSend(v3, "connected_callback");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "connected_callback_queue");
        v10 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __remote_device_advance_state_block_invoke;
        block[3] = &unk_1E9538AF8;
        v26 = v9;
        v11 = v3;
        v25 = v11;
        v12 = v9;
        dispatch_async(v10, block);

        objc_msgSend(v11, "setConnected_callback:", 0);
        objc_msgSend(v11, "setConnected_callback_queue:", 0);
        objc_msgSend(v11, "setConnected_callback_self_retain:", 0);

      }
    }
    objc_msgSend(v3, "disconnected_callback");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if ((_DWORD)a2 == 3 && v13)
    {
      objc_msgSend(v3, "disconnected_callback");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "disconnected_callback_queue");
      v15 = objc_claimAutoreleasedReturnValue();
      v18 = MEMORY[0x1E0C809B0];
      v19 = 3221225472;
      v20 = __remote_device_advance_state_block_invoke_2;
      v21 = &unk_1E9538AF8;
      v23 = v14;
      v16 = v3;
      v22 = v16;
      v17 = v14;
      dispatch_async(v15, &v18);

      objc_msgSend(v16, "setDisconnected_callback:", 0, v18, v19, v20, v21);
      objc_msgSend(v16, "setDisconnected_callback_queue:", 0);
      objc_msgSend(v16, "setDisconnected_callback_self_retain:", 0);

    }
  }

}

void __remote_device_create_from_client_description_block_invoke_364(uint64_t a1)
{
  uint64_t uint64;

  uint64 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 32), "device_state");
  remote_device_advance_state(*(void **)(a1 + 40), uint64);
}

uint64_t __remote_device_advance_state_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __remote_device_advance_state_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void ___remote_device_start_browsing_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  const char *string;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  OS_remote_device *v12;
  NSObject *v13;
  OS_remote_device *v14;
  uint64_t v15;
  __int128 buf;
  void (*v17)(uint64_t);
  void *v18;
  NSObject *v19;
  OS_remote_device *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (MEMORY[0x1D824F93C]() == MEMORY[0x1E0C81310])
  {
    v6 = rsd_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1D3442000, v6, OS_LOG_TYPE_INFO, "Connection invalidated", (uint8_t *)&buf, 2u);
    }

    _remote_device_browser_cancel(*(void **)(a1 + 32));
  }
  else
  {
    string = xpc_dictionary_get_string(v3, "cmd");
    if (string && !strcmp(string, "found_device"))
    {
      v7 = rsd_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1D3442000, v7, OS_LOG_TYPE_INFO, "Got new device", (uint8_t *)&buf, 2u);
      }

      v5 = *(id *)(a1 + 32);
      v8 = v3;
      if ((-[NSObject canceling](v5, "canceling") & 1) != 0)
      {
        v9 = rsd_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1D3442000, v9, OS_LOG_TYPE_INFO, "Not delivering the device because client is canceling the browser", (uint8_t *)&buf, 2u);
        }
      }
      else
      {
        -[NSObject cbq](v5, "cbq");
        v10 = objc_claimAutoreleasedReturnValue();
        dispatch_assert_queue_V2(v10);

        xpc_dictionary_get_dictionary(v8, "device");
        v11 = objc_claimAutoreleasedReturnValue();
        if (!v11)
          __remote_device_create_from_client_description_block_invoke_cold_2(&v15, &buf);
        v9 = v11;
        v12 = remote_device_create_from_client_description(v11);
        -[NSObject cbq](v5, "cbq");
        v13 = objc_claimAutoreleasedReturnValue();
        *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
        *((_QWORD *)&buf + 1) = 3221225472;
        v17 = ___remote_device_new_device_note_block_invoke;
        v18 = &unk_1E9538E80;
        v19 = v5;
        v20 = v12;
        v14 = v12;
        dispatch_async(v13, &buf);

      }
    }
    else
    {
      v5 = rsd_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __remoted_conn_block_invoke_2_cold_2();
    }

  }
}

void ___remote_device_start_browsing_block_invoke_375(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  v2 = a2;
  if (MEMORY[0x1D824F93C]() == MEMORY[0x1E0C81310])
  {
    v4 = (void *)MEMORY[0x1D824F828](v2);
    v5 = rsd_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      ___remote_device_start_browsing_block_invoke_375_cold_1();

    free(v4);
  }
  else
  {
    v3 = rsd_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1D3442000, v3, OS_LOG_TYPE_INFO, "Started browsing.", v6, 2u);
    }

  }
}

void ___remote_device_new_device_note_block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "callback");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "callback");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD))v3 + 2))(v3, *(_QWORD *)(a1 + 40), 0);

  }
}

uint64_t ___remote_device_browser_cancel_block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "callback");
  v2 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, 0, 1);

  objc_msgSend(*(id *)(a1 + 32), "setCallback:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setCanceled:", 1);
}

void ___remote_service_accept_block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v1, "removeObject:", WeakRetained);

}

uint64_t ___remote_service_accept_block_invoke_379(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 16))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48));
}

void __do_control_channel_request_block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v2;

  if (MEMORY[0x1D824F93C](a2) != MEMORY[0x1E0C81310])
  {
    v2 = rsd_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __do_control_channel_request_block_invoke_cold_1();

  }
}

uint64_t OUTLINED_FUNCTION_16()
{
  return _os_log_send_and_compose_impl();
}

void OUTLINED_FUNCTION_17(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

uint64_t OUTLINED_FUNCTION_18()
{
  return _os_crash_msg();
}

BOOL OUTLINED_FUNCTION_19()
{
  NSObject *v0;

  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

void remote_socket_poll_connect_async(int a1, void *a2, void *a3, void *a4, void *a5)
{
  NSObject *v9;
  NSObject *v10;
  id v11;
  id v12;
  dispatch_source_t v13;
  uint64_t v14;
  id v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  _QWORD v19[4];
  NSObject *v20;
  dispatch_source_t v21;
  _QWORD *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  id v28;
  id v29;
  _QWORD *v30;
  int v31;
  _QWORD v32[3];
  int v33;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v33 = 0;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    remote_socket_poll_connect_async_cold_1();
  v13 = dispatch_source_create(MEMORY[0x1E0C80DF0], a1, 0, v9);
  v14 = MEMORY[0x1E0C809B0];
  v24 = MEMORY[0x1E0C809B0];
  v25 = 3221225472;
  v26 = __remote_socket_poll_connect_async_block_invoke;
  v27 = &unk_1E9538F60;
  v29 = v12;
  v30 = v32;
  v28 = v11;
  v31 = a1;
  v15 = v12;
  v16 = v11;
  dispatch_source_set_mandatory_cancel_handler();
  v19[0] = v14;
  v19[1] = 3221225472;
  v19[2] = __remote_socket_poll_connect_async_block_invoke_4;
  v19[3] = &unk_1E9538F88;
  v23 = a1;
  v21 = v13;
  v22 = v32;
  v20 = v10;
  v17 = v13;
  v18 = v10;
  dispatch_source_set_event_handler(v17, v19);
  dispatch_activate(v17);

  _Block_object_dispose(v32, 8);
}

void __remote_socket_poll_connect_async_block_invoke(uint64_t a1)
{
  id *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD v7[4];
  _QWORD v8[2];
  _QWORD block[4];
  id v10;
  int v11;

  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    if (close(*(_DWORD *)(a1 + 56)) == -1)
      __remote_socket_poll_connect_async_block_invoke_cold_1();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __remote_socket_poll_connect_async_block_invoke_3;
    v7[3] = &unk_1E9538F38;
    v2 = (id *)v8;
    v3 = *(NSObject **)(a1 + 32);
    v4 = *(id *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v8[0] = v4;
    v8[1] = v5;
    v6 = v7;
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __remote_socket_poll_connect_async_block_invoke_2;
    block[3] = &unk_1E9538F10;
    v2 = &v10;
    v3 = *(NSObject **)(a1 + 32);
    v10 = *(id *)(a1 + 40);
    v11 = *(_DWORD *)(a1 + 56);
    v6 = block;
  }
  dispatch_async(v3, v6);

}

uint64_t __remote_socket_poll_connect_async_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40), 0);
}

uint64_t __remote_socket_poll_connect_async_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0xFFFFFFFFLL, *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

void __remote_socket_poll_connect_async_block_invoke_4(uint64_t a1)
{
  _BOOL4 v2;
  int v3;
  uint64_t v4;
  _OWORD v5[5];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = _remote_socket_expect_connected(*(_DWORD *)(a1 + 56), *(void **)(a1 + 32), (int *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  v3 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (v2)
  {
    if (v3)
      __remote_socket_poll_connect_async_block_invoke_4_cold_1(&v4, v5);
  }
  else if (!v3)
  {
    __remote_socket_poll_connect_async_block_invoke_4_cold_2(&v4, v5);
  }
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
}

BOOL _remote_socket_expect_connected(int a1, void *a2, int *a3)
{
  NSObject *v5;
  int v6;
  uint64_t v8;
  socklen_t v9;
  int v10;
  _OWORD v11[5];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a3)
    a3 = &v10;
  v9 = 4;
  v10 = 0;
  if (getsockopt(a1, 0xFFFF, 4103, a3, &v9) == -1)
    _remote_socket_expect_connected_cold_1(&v8, v11);
  v6 = *a3;
  if (*a3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      _remote_socket_expect_connected_cold_3();
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    _remote_socket_expect_connected_cold_2();
  }

  return v6 == 0;
}

uint64_t remote_socket_poll_connect_sync(int a1, void *a2)
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  pollfd v8;

  v3 = a2;
  v8.fd = a1;
  *(_DWORD *)&v8.events = 4;
  v4 = poll(&v8, 1u, -1);
  if (!v4)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      remote_socket_poll_connect_sync_cold_3();
    goto LABEL_12;
  }
  if (v4 == -1)
  {
    if (*__error() == 4)
    {
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        remote_socket_poll_connect_sync_cold_1();
    }
    else
    {
      v6 = v3;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        remote_socket_poll_connect_sync_cold_2();

    }
LABEL_12:
    v5 = 0xFFFFFFFFLL;
    goto LABEL_13;
  }
  v5 = (_remote_socket_expect_connected(a1, v3, 0) - 1);
LABEL_13:

  return v5;
}

uint64_t remote_socket_create_connected_ipv6_pair(int *a1, int *a2, void *a3)
{
  NSObject *v5;
  int v6;
  int v7;
  __int16 sae_srcif_high;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  NSObject *v17;
  __int128 v18;
  sa_endpoints_t v19;
  socklen_t v20[2];
  __int128 v21;
  int v22;

  v5 = a3;
  v6 = socket(30, 1, 0);
  if (v6 == -1)
  {
    v13 = v5;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      remote_socket_create_connected_ipv6_pair_cold_1();

    goto LABEL_29;
  }
  v7 = v6;
  *(_QWORD *)&v19.sae_srcif = 7708;
  v18 = *MEMORY[0x1E0C83938];
  *(_OWORD *)&v19.sae_srcaddr = *MEMORY[0x1E0C83938];
  LODWORD(v19.sae_dstaddr) = 0;
  if (bind(v6, (const sockaddr *)&v19, 0x1Cu) == -1)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      remote_socket_create_connected_ipv6_pair_cold_2();
    goto LABEL_19;
  }
  if (listen(v7, 128) == -1)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      remote_socket_create_connected_ipv6_pair_cold_3();
LABEL_19:

LABEL_27:
    v15 = v7;
LABEL_28:
    close(v15);
LABEL_29:
    v12 = 0xFFFFFFFFLL;
    goto LABEL_30;
  }
  v20[0] = 28;
  if (getsockname(v7, (sockaddr *)&v19, v20) == -1)
  {
    v14 = v5;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      remote_socket_create_connected_ipv6_pair_cold_4();
    goto LABEL_26;
  }
  sae_srcif_high = HIWORD(v19.sae_srcif);
  if (!HIWORD(v19.sae_srcif))
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      remote_socket_create_connected_ipv6_pair_cold_5();
    goto LABEL_27;
  }
  v9 = socket(30, 1, 0);
  if (v9 == -1)
  {
    v14 = v5;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      remote_socket_create_connected_ipv6_pair_cold_1();
LABEL_26:

    goto LABEL_27;
  }
  v10 = v9;
  if (fcntl(v9, 4, 4) == -1)
  {
    v17 = v5;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      remote_socket_create_connected_ipv6_pair_cold_7();
    goto LABEL_37;
  }
  LOWORD(v20[0]) = 7708;
  HIWORD(v20[0]) = sae_srcif_high;
  v20[1] = 0;
  v21 = v18;
  v22 = 0;
  *(&v19.sae_srcif + 1) = -1431655766;
  v19.sae_srcif = 0;
  v19.sae_srcaddr = 0;
  *(_QWORD *)&v19.sae_srcaddrlen = 0xAAAAAAAA00000000;
  v19.sae_dstaddr = (const sockaddr *)v20;
  *(_QWORD *)&v19.sae_dstaddrlen = 0xAAAAAAAA0000001CLL;
  if (connectx(v10, &v19, 0, 0, 0, 0, 0, 0) == -1 && *__error() != 36)
  {
    v17 = v5;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      remote_socket_create_connected_ipv6_pair_cold_9();
    goto LABEL_37;
  }
  memset(&v19, 170, 28);
  v20[0] = 0;
  v11 = accept(v7, (sockaddr *)&v19, v20);
  if (v11 == -1)
  {
    v17 = v5;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      remote_socket_create_connected_ipv6_pair_cold_8();
LABEL_37:

    close(v7);
    v15 = v10;
    goto LABEL_28;
  }
  *a1 = v10;
  *a2 = v11;
  close(v7);
  v12 = 0;
LABEL_30:

  return v12;
}

void bridge_version_compare_cold_1()
{
  _os_crash();
  __break(1u);
}

void remote_device_type_is_trusted_cold_1()
{
  _os_crash();
  __break(1u);
}

void remote_device_type_is_trusted_cold_2(_QWORD *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_18();
  __break(1u);
}

void remote_device_get_type_cold_1()
{
  _os_crash();
  __break(1u);
}

void remote_device_authenticate_cold_2()
{
  _os_crash();
  __break(1u);
}

void remote_device_authenticate_cold_3()
{
  _os_crash();
  __break(1u);
}

void remote_device_authenticate_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1D3442000, v0, v1, "Failed to get cert chain's leaf certificate.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void remote_device_authenticate_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1D3442000, v0, v1, "Failed to copy certificate chain.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void remote_service_copy_properties_cold_1()
{
  _os_crash();
  __break(1u);
}

void remote_service_get_xpc_remote_connection_version_flags_cold_2(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_2(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  __break(1u);
}

void remote_device_get_xpc_remote_connection_version_flags_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1D3442000, v0, v1, "Invalid or missing remote device connection version flags", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void remote_service_create_connected_socket_cold_2(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_2(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  __break(1u);
}

void _remote_service_connect_socket_impl_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_15(&dword_1D3442000, v0, v1, "Sending CONNECT command", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void remote_device_copy_boot_session_uuid_cold_2()
{
  _os_crash();
  __break(1u);
}

void remote_device_get_connectable_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1D3442000, v0, v1, "Received error sending GET CONNECTABLE command", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void remote_device_get_latest_connect_result_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1D3442000, v0, v1, "Received error sending GET LATEST CONNECT ERROR command", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _remote_device_crash_if_not_connected_cold_1()
{
  _os_crash();
  __break(1u);
}

void __remote_device_authenticate_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1D3442000, v0, v1, "Received xpc error sending AUTHENTICATE command", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void remote_device_copy_service_names_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1D3442000, v0, v1, "Received error sending LIST SERVICES command", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void remote_device_copy_service_names_cold_3(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_2(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  __break(1u);
}

void remote_device_copy_local_service_names_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1D3442000, v0, v1, "Received error sending LIST LOCAL SERVICES command", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void remote_device_copy_service_cold_2()
{
  _os_crash();
  __break(1u);
}

void remote_device_copy_service_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1D3442000, v0, v1, "Received error sending GET SERVICE command", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void remote_device_copy_service_cold_4(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_2(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  __break(1u);
}

void remote_device_copy_service_cold_5(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_2(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  __break(1u);
}

void remote_device_copy_service_cold_6(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_2(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  __break(1u);
}

void remote_device_copy_service_cold_7(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_2(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  __break(1u);
}

void remote_device_copy_service_cold_8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_11(&dword_1D3442000, v0, v1, "Creating service from: %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

void remote_device_copy_service_cold_9(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_2(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  __break(1u);
}

void remote_device_check_service_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1D3442000, v0, v1, "Received error sending CHECK SERVICE command", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void remote_device_set_connected_callback_cold_2()
{
  _os_crash();
  __break(1u);
}

void remote_device_timesync_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_8(&dword_1D3442000, v0, v1, "%{public}s> Received error sending TIMESYNC command", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

void remote_device_reset_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_8(&dword_1D3442000, v0, v1, "%{public}s> Received error sending RESET DEVICE command", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

void remote_device_disconnect_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_8(&dword_1D3442000, v0, v1, "%{public}s> Received error sending DISCONNECT DEVICE command", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

void remote_device_set_alias_cold_2()
{
  _os_crash();
  __break(1u);
}

void local_device_copy_description_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1D3442000, v0, v1, "Received error sending GET LOCAL DEVICE DESCRIPTION command", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void local_device_copy_description_cold_2(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_2(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  __break(1u);
}

void local_device_copy_identity_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_8(&dword_1D3442000, v0, v1, "Received error sending GET LOCAL DEVICE IDENTITY command: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

void local_device_copy_identity_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1D3442000, v0, v1, "No identity in reply.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void local_device_copy_identity_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1D3442000, v0, v1, "No cert data in reply.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void local_device_copy_identity_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1D3442000, v0, v1, "Failed to initialize certificate data.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void local_device_copy_identity_cold_7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1D3442000, v0, v1, "Failed to create certificate from data.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void local_device_copy_identity_cold_8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_8(&dword_1D3442000, v0, v1, "Failed to create key ACL: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

void local_device_copy_identity_cold_9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1D3442000, v0, v1, "No key data in reply.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void local_device_copy_identity_cold_10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1D3442000, v0, v1, "Failed to initialize key data.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void local_device_copy_identity_cold_11()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_8(&dword_1D3442000, v0, v1, "Failed to create key from data: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

void local_device_copy_identity_cold_12()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1D3442000, v0, v1, "Failed to create identity.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void local_device_copy_identity_cold_13()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1D3442000, v0, v1, "local_device_copy_identity: failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void local_device_delete_identity_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_2(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  __break(1u);
}

void local_device_delete_identity_cold_2(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_2(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  __break(1u);
}

void local_device_delete_identity_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_8(&dword_1D3442000, v0, v1, "Received error sending DELETE LOCAL DEVICE IDENTITY command: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

void local_device_delete_identity_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1D3442000, v0, v1, "local_device_delete_identity: failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void local_device_create_identity_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_8(&dword_1D3442000, v0, v1, "Received error sending CREATE LOCAL DEVICE IDENTITY command: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

void local_device_create_identity_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1D3442000, v0, v1, "local_device_create_identity: failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void local_device_copy_service_names_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1D3442000, v0, v1, "Received error sending LIST LOCAL DEVICE SERVICES command", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void local_device_copy_service_names_cold_2(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_2(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  __break(1u);
}

void remote_device_copy_unique_of_type_cold_1()
{
  _os_crash();
  __break(1u);
}

void remote_device_copy_unique_of_type_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1D3442000, v0, v1, "Received error sending GET UNIQUE DEVICE command", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void remote_device_copy_unique_of_type_cold_3(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_2(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  __break(1u);
}

void remote_device_create_from_client_description_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_11(&dword_1D3442000, v0, v1, "Creating device from: %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

void remote_device_copy_device_with_name_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1D3442000, v0, v1, "Received error sending GET DEVICE command", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void remote_device_browser_cancel_cold_1()
{
  _os_crash();
  __break(1u);
}

void remote_device_start_browsing_matching_cold_1()
{
  _os_crash();
  __break(1u);
}

void __remote_device_start_browsing_matching_block_invoke_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_2(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  __break(1u);
}

void __remote_device_start_browsing_matching_block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_11(&dword_1D3442000, v0, v1, "%{public}s> browsing_matching: Found a candidate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

void __remote_device_start_browsing_matching_block_invoke_253_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_11(&dword_1D3442000, v0, v1, "%{public}s> browsing_matching: Found a match", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

void __remote_device_start_browsing_matching_block_invoke_253_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_11(&dword_1D3442000, v0, v1, "%{public}s> browsing_matching: Device didn't match", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

void __remote_device_start_browsing_matching_block_invoke_253_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_11(&dword_1D3442000, v0, v1, "%{public}s> browsing_matching: Device isn't connected", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

void _remote_service_accept_cold_1(_QWORD *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  _os_crash_msg();
  __break(1u);
}

void __remote_service_listen_with_device_block_invoke_3_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_2(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  __break(1u);
}

void __remote_service_listen_with_device_block_invoke_3_cold_2(_QWORD *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_18();
  __break(1u);
}

void __remote_service_listen_with_device_block_invoke_3_cold_3()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_13();
  _os_log_fault_impl(&dword_1D3442000, v0, OS_LOG_TYPE_FAULT, "BUG IN CLIENT OF RemoteServiceDiscovery: Tried to listen for unknown service '%{public}s'.", v1, 0xCu);
  OUTLINED_FUNCTION_10();
}

void remote_compute_controller_add_node_cold_1()
{
  _os_crash();
  __break(1u);
}

void remote_compute_controller_add_node_cold_2()
{
  _os_crash();
  __break(1u);
}

void remote_compute_controller_add_node_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1D3442000, v0, v1, "Received error sending ADD DEVICE command", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void remote_compute_controller_add_node_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_9(&dword_1D3442000, v0, v1, "remote_compute_controller_add_node: %{darwin.errno}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void remoted_connection_create_mach_service_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_9(&dword_1D3442000, a2, a3, "Cannot set target user session for remoted connection because we failed to get the foreground user's uid: %{darwin.errno}d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void __remote_compute_controller_add_node_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1D3442000, v0, v1, "Unexpected mesage on compute platfrom channel", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _check_operation_result_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8(&dword_1D3442000, a1, a3, "Bogus response: result doesn't have mandatory key: %{public}s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_10();
}

void _check_operation_result_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1D3442000, v0, v1, "Bogus response: operation failed without error code", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void remote_compute_controller_remove_node_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1D3442000, v0, v1, "Received error sending REMOVE DEVICE command", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void remote_compute_controller_remove_node_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_9(&dword_1D3442000, v0, v1, "remote_compute_controller_remove_node: %{darwin.errno}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void remote_compute_node_listen_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1D3442000, v0, v1, "Received error sending LISTEN command", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void remote_compute_node_listen_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_9(&dword_1D3442000, v0, v1, "remote_compute_node_listen: %{darwin.errno}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void remote_compute_node_listen_cancel_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1D3442000, v0, v1, "Received error sending LISTEN CANCEL command", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void remote_compute_node_listen_cancel_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_9(&dword_1D3442000, v0, v1, "remote_compute_node_listen_cancel: %{darwin.errno}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void remote_compute_node_disconnect_controller_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1D3442000, v0, v1, "device is not of type compute-controller", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void remote_compute_controller_browse_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1D3442000, v0, v1, "Received error sending BROWSE command", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void remote_compute_controller_browse_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_9(&dword_1D3442000, v0, v1, "remote_compute_controller_browse: %{darwin.errno}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void remote_compute_controller_browse_cancel_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1D3442000, v0, v1, "Received error sending BROWSE CANCEL command", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void remote_compute_controller_browse_cancel_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_9(&dword_1D3442000, v0, v1, "remote_compute_controller_browse_cancel: %{darwin.errno}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void local_device_compute_platform_require_tls_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1D3442000, v0, v1, "Received error sending REQUIRE TLS command", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void local_device_compute_platform_require_tls_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_9(&dword_1D3442000, v0, v1, "local_device_compute_platform_require_tls: %{darwin.errno}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __local_device_compute_platform_require_tls_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1D3442000, v0, v1, "Unexpected mesage on compute platform channel", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void remote_compute_platform_tls_required_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8(&dword_1D3442000, a1, a3, "remote_compute_platform_tls_required: missing key %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_10();
}

void remote_compute_platform_tls_required_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_9(&dword_1D3442000, v0, v1, "remote_compute_platform_tls_required: %{darwin.errno}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void ___remote_service_connect_socket_impl_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1D3442000, v0, v1, "CONNECT command finished with an XPC error", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void ___remote_service_connect_socket_impl_block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1D3442000, v0, v1, "CONNECT command failed - bogus reply", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void ___remote_service_connect_socket_impl_block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1D3442000, v0, v1, "CONNECT command failed with unrecoverable error", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void ___remote_service_connect_socket_impl_block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1D3442000, v0, v1, "CONNECT command failed with INTERRUPTED", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void ___remote_service_connect_socket_impl_block_invoke_cold_5()
{
  os_log_t v0;
  uint8_t v1[8];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_12();
  _os_log_debug_impl(&dword_1D3442000, v0, OS_LOG_TYPE_DEBUG, "connect socket has succceeded - fd %d", v1, 8u);
  OUTLINED_FUNCTION_5();
}

void ___remote_service_connect_socket_impl_block_invoke_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_8(&dword_1D3442000, v0, v1, "CONNECT command failed with unknown result: %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

void __remoted_conn_block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_15(&dword_1D3442000, v0, v1, "Error received on client connection:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __remoted_conn_block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1D3442000, v0, v1, "Unexpected message from remoted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void remote_device_update_from_client_description_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_2(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  __break(1u);
}

void remote_device_update_from_client_description_cold_2(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_2(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  __break(1u);
}

void remote_device_update_from_client_description_cold_3(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_2(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  __break(1u);
}

void remote_device_update_from_client_description_cold_4(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_2(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  __break(1u);
}

void remote_device_update_from_client_description_cold_5(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_2(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  __break(1u);
}

void remote_device_update_from_client_description_cold_6(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_2(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  __break(1u);
}

void __remote_device_create_from_client_description_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_15(&dword_1D3442000, v0, v1, "Event fired on deallocated device", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __remote_device_create_from_client_description_block_invoke_cold_2(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_2(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  __break(1u);
}

void __remote_device_create_from_client_description_block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_11(&dword_1D3442000, v0, v1, "Updating device from: %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

void remote_device_advance_state_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_2(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  __break(1u);
}

void remote_device_advance_state_cold_2(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_2(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  __break(1u);
}

void remote_device_advance_state_cold_3()
{
  _os_crash();
  __break(1u);
}

void remote_device_advance_state_cold_4()
{
  int v0;
  os_log_t v1;
  uint8_t v2[8];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_12();
  v3 = 1024;
  v4 = v0;
  _os_log_debug_impl(&dword_1D3442000, v1, OS_LOG_TYPE_DEBUG, "device advancing from %d to %d", v2, 0xEu);
  OUTLINED_FUNCTION_10();
}

void ___remote_device_start_browsing_block_invoke_375_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_8(&dword_1D3442000, v0, v1, "Unable to start browsing: %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

void __do_control_channel_request_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1D3442000, v0, v1, "Unexpected mesage on control channel", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void remote_socket_poll_connect_async_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_15(&dword_1D3442000, v0, v1, "asynchronously waiting for connect(2) to complete", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

uint64_t __remote_socket_poll_connect_async_block_invoke_cold_1()
{
  __error();
  return _os_assumes_log();
}

void __remote_socket_poll_connect_async_block_invoke_4_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_2(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  __break(1u);
}

void __remote_socket_poll_connect_async_block_invoke_4_cold_2(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_2(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  __break(1u);
}

void _remote_socket_expect_connected_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_2(a1, a2);
  OUTLINED_FUNCTION_4();
  __error();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6();
  __break(1u);
}

void _remote_socket_expect_connected_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_15(&dword_1D3442000, v0, v1, "connect(2) completed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void _remote_socket_expect_connected_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[8];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3442000, v0, v1, "connect(2) failed with error: %{errno}d", v2);
  OUTLINED_FUNCTION_5();
}

void remote_socket_poll_connect_sync_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1D3442000, v0, v1, "poll(2) was interrupted while connecting to a service", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void remote_socket_poll_connect_sync_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_0(&dword_1D3442000, v0, v1, "poll(2) failed while connecting to a service: %{errno}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void remote_socket_poll_connect_sync_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[8];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3442000, v0, v1, "poll(2) timed out; events: 0x%x", v2);
  OUTLINED_FUNCTION_5();
}

void remote_socket_create_connected_ipv6_pair_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_0(&dword_1D3442000, v0, v1, "socket(2): %{errno}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void remote_socket_create_connected_ipv6_pair_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_0(&dword_1D3442000, v0, v1, "bind(2): %{errno}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void remote_socket_create_connected_ipv6_pair_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_0(&dword_1D3442000, v0, v1, "listen(2): %{errno}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void remote_socket_create_connected_ipv6_pair_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_0(&dword_1D3442000, v0, v1, "getsockname(2): %{errno}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void remote_socket_create_connected_ipv6_pair_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1D3442000, v0, v1, "getsockname(2) did not populate sin6_port", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void remote_socket_create_connected_ipv6_pair_cold_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_0(&dword_1D3442000, v0, v1, "fcntl(2): %{errno}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void remote_socket_create_connected_ipv6_pair_cold_8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_0(&dword_1D3442000, v0, v1, "accept(2): %{errno}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void remote_socket_create_connected_ipv6_pair_cold_9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_0(&dword_1D3442000, v0, v1, "connectx(2): %{errno}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80368](data, *(_QWORD *)&len, md);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

SecAccessControlRef SecAccessControlCreateWithFlags(CFAllocatorRef allocator, CFTypeRef protection, SecAccessControlCreateFlags flags, CFErrorRef *error)
{
  return (SecAccessControlRef)MEMORY[0x1E0CD5EA8](allocator, protection, flags, error);
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x1E0CD5F60](certificate);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x1E0CD6010](allocator, data);
}

uint64_t SecIdentityCreate()
{
  return MEMORY[0x1E0CD6280]();
}

SecKeyRef SecKeyCreateWithData(CFDataRef keyData, CFDictionaryRef attributes, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x1E0CD63A0](keyData, attributes, error);
}

CFArrayRef SecTrustCopyCertificateChain(SecTrustRef trust)
{
  return (CFArrayRef)MEMORY[0x1E0CD6648](trust);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t _os_assumes_log()
{
  return MEMORY[0x1E0C80FF8]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1E0C81000]();
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x1E0C81008]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x1E0C81068]();
}

int accept(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x1E0C813C8](*(_QWORD *)&a1, a2, a3);
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1E0C81608](a1, a2);
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x1E0C816F0](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

int connectx(int a1, const sa_endpoints_t *a2, sae_associd_t a3, unsigned int a4, const iovec *a5, unsigned int a6, size_t *a7, sae_connid_t *a8)
{
  return MEMORY[0x1E0C826E0](*(_QWORD *)&a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, a5, *(_QWORD *)&a6, a7, a8);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BF8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E50](label, attr, target);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x1E0C82F28](source);
}

uintptr_t dispatch_source_get_handle(dispatch_source_t source)
{
  return MEMORY[0x1E0C82F30](source);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F48](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

uint64_t dispatch_source_set_mandatory_cancel_handler()
{
  return MEMORY[0x1E0C82F68]();
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C83300](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

int getsockname(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x1E0C83810](*(_QWORD *)&a1, a2, a3);
}

int getsockopt(int a1, int a2, int a3, void *a4, socklen_t *a5)
{
  return MEMORY[0x1E0C83818](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4, a5);
}

int listen(int a1, int a2)
{
  return MEMORY[0x1E0C83B80](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_variant_is_darwinos()
{
  return MEMORY[0x1E0C84A08]();
}

int poll(pollfd *a1, nfds_t a2, int a3)
{
  return MEMORY[0x1E0C84B20](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1E0C85000](*(_QWORD *)&a1, a2, a3);
}

sec_identity_t sec_identity_create(SecIdentityRef identity)
{
  return (sec_identity_t)MEMORY[0x1E0CD7148](identity);
}

SecTrustRef sec_trust_copy_ref(sec_trust_t trust)
{
  return (SecTrustRef)MEMORY[0x1E0CD7368](trust);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x1E0C85450](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C85498](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85658](__str, __endptr, *(_QWORD *)&__base);
}

void uuid_clear(uuid_t uu)
{
  MEMORY[0x1E0C85A00](uu);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
  MEMORY[0x1E0C85A10](dst, src);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1E0C85D40](*(_QWORD *)&__fd, __buf, __nbyte);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1E0C85DF8](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C85E00](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1E0C85E30](xarray);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return (const char *)MEMORY[0x1E0C85E70](xarray, index);
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return (xpc_object_t)MEMORY[0x1E0C85EF0](value);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x1E0C85F00](xBOOL);
}

void xpc_connection_activate(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F50](connection);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F68](connection);
}

xpc_connection_t xpc_connection_create_from_endpoint(xpc_endpoint_t endpoint)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FA0](endpoint);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x1E0C86030](connection, message);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x1E0C86038](connection, message, replyq, handler);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1E0C86048](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  MEMORY[0x1E0C860C8](connection, targetq);
}

uint64_t xpc_connection_set_target_user_session_uid()
{
  return MEMORY[0x1E0C860D8]();
}

uint64_t xpc_copy_clean_description()
{
  return MEMORY[0x1E0C860F8]();
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1E0C86108](object);
}

uint64_t xpc_copy_event()
{
  return MEMORY[0x1E0C86140]();
}

uint64_t xpc_create_from_plist()
{
  return MEMORY[0x1E0C86150]();
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1E0C86198](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1E0C861A8](xdata);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1E0C86218]();
}

int xpc_dictionary_dup_fd(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86230](xdict, key);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C86248](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86260](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1E0C86278](xdict, key, length);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C86288](xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862A0](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862D0](xdict, key);
}

const uint8_t *__cdecl xpc_dictionary_get_uuid(xpc_object_t xdict, const char *key)
{
  return (const uint8_t *)MEMORY[0x1E0C862D8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x1E0C86330](xdict, key, bytes, length);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C86398](xdict, key, value);
}

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
  MEMORY[0x1E0C863B0](xdict, key, uuid);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

uint64_t xpc_is_system_session()
{
  return MEMORY[0x1E0C86588]();
}

uint64_t xpc_remote_connection_activate()
{
  return MEMORY[0x1E0D87358]();
}

uint64_t xpc_remote_connection_cancel()
{
  return MEMORY[0x1E0D87368]();
}

uint64_t xpc_remote_connection_create_with_connected_fd()
{
  return MEMORY[0x1E0D87390]();
}

uint64_t xpc_remote_connection_get_version_flags()
{
  return MEMORY[0x1E0D873B8]();
}

uint64_t xpc_remote_connection_send_barrier()
{
  return MEMORY[0x1E0D873C0]();
}

uint64_t xpc_remote_connection_send_message()
{
  return MEMORY[0x1E0D873D0]();
}

uint64_t xpc_remote_connection_set_event_handler()
{
  return MEMORY[0x1E0D873F0]();
}

uint64_t xpc_remote_connection_set_target_queue()
{
  return MEMORY[0x1E0D87400]();
}

uint64_t xpc_remote_connection_set_tls()
{
  return MEMORY[0x1E0D87410]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
  MEMORY[0x1E0C866E8](stream, targetq, handler);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1E0C86758](xstring);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1E0C867B8](xuint);
}

uint64_t xpc_user_sessions_enabled()
{
  return MEMORY[0x1E0C867C8]();
}

uint64_t xpc_user_sessions_get_foreground_uid()
{
  return MEMORY[0x1E0C867D0]();
}

