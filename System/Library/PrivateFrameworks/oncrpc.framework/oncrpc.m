uint64_t _newrpclib_callrpc(char *__s2, unsigned int a2, unsigned int a3)
{
  uint64_t v6;
  uint64_t result;
  const char *v8;
  hostent *v9;
  hostent *v10;
  _QWORD *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = callrpc_private;
  if (!callrpc_private)
  {
    result = (uint64_t)calloc(1uLL, 0x20uLL);
    if (!result)
      return result;
    v6 = result;
    callrpc_private = result;
  }
  v13 = 0;
  v14 = 0;
  v8 = *(const char **)(v6 + 24);
  if (!v8)
  {
    v8 = (const char *)malloc(0x100uLL);
    *(_QWORD *)(v6 + 24) = v8;
    *v8 = 0;
    *(_DWORD *)(v6 + 8) = -1;
  }
  v12 = 0;
  if (!*(_DWORD *)(v6 + 20) || *(_DWORD *)(v6 + 12) != a2 || *(_DWORD *)(v6 + 16) != a3 || strcmp(v8, __s2))
  {
    *(_DWORD *)(v6 + 20) = 0;
    *(_DWORD *)(v6 + 8) = -1;
    if (*(_QWORD *)v6)
    {
      (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)v6 + 8) + 32))();
      *(_QWORD *)v6 = 0;
    }
    v9 = getipnodebyname(__s2, 2, 0, &v12);
    if (!v9)
      return 13;
    v10 = v9;
    v13 = 0;
    v14 = 0;
    __memmove_chk();
    freehostent(v10);
    BYTE1(v13) = 2;
    WORD1(v13) = 0;
    v11 = _newrpclib_clntudp_create((unsigned __int8 *)&v13, a2, a3, 5, 0, (int *)(v6 + 8));
    *(_QWORD *)v6 = v11;
    if (!v11)
      return *(unsigned int *)_newrpclib___rpc_createerr();
    *(_DWORD *)(v6 + 16) = a3;
    *(_DWORD *)(v6 + 20) = 1;
    *(_DWORD *)(v6 + 12) = a2;
    strcpy(*(char **)(v6 + 24), __s2);
  }
  result = (**(uint64_t (***)(void))(*(_QWORD *)v6 + 8))();
  if ((_DWORD)result)
    *(_DWORD *)(v6 + 20) = 0;
  return result;
}

uint64_t _newrpclib_authnone_create()
{
  int v0;
  int v1;

  v0 = pthread_once(&authnone_once_init, (void (*)(void))authnone_init);
  if (v0)
  {
    v1 = v0;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      _newrpclib_authnone_create_cold_1(v1);
  }
  return authnone_private;
}

char *authnone_init()
{
  char *result;
  uint64_t v1;
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  uint64_t (*v5)(_OWORD *);
  _OWORD v6[3];

  result = (char *)calloc(1uLL, 0x60uLL);
  if (result)
  {
    v1 = (uint64_t)result;
    memset(v6, 0, sizeof(v6));
    authnone_private = (uint64_t)result;
    v2 = (uint64_t)(result + 24);
    v3 = _newrpclib__null_auth;
    *(_OWORD *)(result + 24) = _newrpclib__null_auth;
    v4 = qword_255D60578;
    *((_QWORD *)result + 5) = qword_255D60578;
    *((_QWORD *)result + 2) = v4;
    *(_OWORD *)result = v3;
    *((_QWORD *)result + 7) = ops;
    _newrpclib_xdrmem_create((uint64_t)v6, (uint64_t)(result + 72), 20, 0);
    _newrpclib_xdr_opaque_auth((uint64_t (***)(void))v6, v1);
    _newrpclib_xdr_opaque_auth((uint64_t (***)(void))v6, v2);
    result = (char *)(*(uint64_t (**)(_OWORD *))(*((_QWORD *)&v6[0] + 1) + 32))(v6);
    *(_DWORD *)(v1 + 92) = (_DWORD)result;
    v5 = *(uint64_t (**)(_OWORD *))(*((_QWORD *)&v6[0] + 1) + 56);
    if (v5)
      return (char *)v5(v6);
  }
  return result;
}

uint64_t authnone_marshal(uint64_t a1, uint64_t a2)
{
  if (authnone_private)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(a2 + 8) + 24))(a2, authnone_private + 72, *(unsigned int *)(authnone_private + 92));
  else
    return 0;
}

uint64_t authnone_validate()
{
  return 1;
}

uint64_t authnone_refresh()
{
  return 0;
}

_OWORD *_newrpclib_authunix_create(uint64_t a1, unsigned int a2, unsigned int a3, int a4, uint64_t a5)
{
  _OWORD *v10;
  _OWORD *v11;
  char *v12;
  _DWORD *v13;
  uint64_t v14;
  __int128 v15;
  unsigned int v16;
  size_t v17;
  void *v18;
  uint64_t v19;
  timeval v21[3];
  timeval v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  _OWORD __src[25];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v23 = 0u;
  v24 = 0u;
  memset(__src, 0, sizeof(__src));
  memset(v21, 0, sizeof(v21));
  v10 = calloc(1uLL, 0x48uLL);
  if (!v10)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      _newrpclib_authunix_create_cold_1();
    return 0;
  }
  v11 = v10;
  v12 = (char *)calloc(1uLL, 0x1C8uLL);
  if (!v12)
  {
    free(v11);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      _newrpclib_authunix_create_cold_2();
    return 0;
  }
  v13 = v12;
  v22.tv_sec = 0;
  *(_QWORD *)&v22.tv_usec = 0;
  *((_QWORD *)v11 + 7) = auth_unix_ops;
  *((_QWORD *)v11 + 8) = v12;
  v14 = qword_255D60578;
  *((_QWORD *)v12 + 5) = qword_255D60578;
  v15 = _newrpclib__null_auth;
  *(_OWORD *)(v12 + 24) = _newrpclib__null_auth;
  *(_OWORD *)((char *)v11 + 24) = v15;
  *((_QWORD *)v11 + 5) = v14;
  *((_DWORD *)v12 + 12) = 0;
  gettimeofday(&v22, 0);
  LODWORD(v23) = v22.tv_sec;
  *((_QWORD *)&v23 + 1) = a1;
  *(_QWORD *)&v24 = __PAIR64__(a3, a2);
  DWORD2(v24) = a4;
  v25 = a5;
  _newrpclib_xdrmem_create((uint64_t)v21, (uint64_t)__src, 400, 0);
  if (!_newrpclib_xdr_authunix_parms((uint64_t (***)(void))v21, (uint64_t)&v23))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      _newrpclib_authunix_create_cold_3();
    goto LABEL_15;
  }
  v16 = (*(uint64_t (**)(timeval *))(*(_QWORD *)&v21[0].tv_usec + 32))(v21);
  v13[4] = v16;
  v17 = v16;
  *v13 = 1;
  v18 = calloc(1uLL, v16);
  *((_QWORD *)v13 + 1) = v18;
  if (!v18)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      _newrpclib_authunix_create_cold_4();
    goto LABEL_15;
  }
  memmove(v18, __src, v17);
  v19 = *((_QWORD *)v13 + 2);
  *v11 = *(_OWORD *)v13;
  *((_QWORD *)v11 + 2) = v19;
  if (!marshal_new_auth((uint64_t)v11))
  {
LABEL_15:
    free(v13);
    free(v11);
    return 0;
  }
  return v11;
}

BOOL marshal_new_auth(uint64_t a1)
{
  uint64_t v2;
  void (*v3)(_OWORD *);
  _BOOL8 result;
  _OWORD v5[3];

  memset(v5, 0, sizeof(v5));
  v2 = *(_QWORD *)(a1 + 64);
  _newrpclib_xdrmem_create((uint64_t)v5, v2 + 52, 400, 0);
  if (_newrpclib_xdr_opaque_auth((uint64_t (***)(void))v5, a1)
    && _newrpclib_xdr_opaque_auth((uint64_t (***)(void))v5, a1 + 24))
  {
    *(_DWORD *)(v2 + 452) = (*(uint64_t (**)(_OWORD *))(*((_QWORD *)&v5[0] + 1) + 32))(v5);
    v3 = *(void (**)(_OWORD *))(*((_QWORD *)&v5[0] + 1) + 56);
    if (v3)
      v3(v5);
    return 1;
  }
  else
  {
    result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (result)
    {
      marshal_new_auth_cold_1();
      return 0;
    }
  }
  return result;
}

uint64_t _newrpclib_set_rpc_maxgrouplist(uint64_t result)
{
  if ((result - 1) <= 0xE)
    maxgrplist = result;
  return result;
}

_OWORD *_newrpclib_authunix_create_default()
{
  uid_t v0;
  gid_t v1;
  int v2;
  int v3;
  _OWORD v5[4];
  char v6[16];
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
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
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
  *(_OWORD *)v6 = 0u;
  v7 = 0u;
  memset(v5, 0, sizeof(v5));
  if (gethostname(v6, 0xFFuLL) == -1)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      _newrpclib_authunix_create_default_cold_1();
    return 0;
  }
  else
  {
    HIBYTE(v21) = 0;
    v0 = geteuid();
    v1 = getegid();
    v2 = getgroups(16, (gid_t *)v5);
    if (v2 < 0)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        _newrpclib_authunix_create_default_cold_2();
      LODWORD(v5[0]) = v1;
      v2 = 1;
    }
    if (v2 >= maxgrplist)
      v3 = maxgrplist;
    else
      v3 = v2;
    return _newrpclib_authunix_create((uint64_t)v6, v0, v1, v3, (uint64_t)v5);
  }
}

uint64_t authunix_marshal(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(a2 + 8) + 24))(a2, *(_QWORD *)(a1 + 64) + 52, *(unsigned int *)(*(_QWORD *)(a1 + 64) + 452));
}

BOOL authunix_validate(uint64_t a1, uint64_t a2)
{
  __int128 *v3;
  void *v4;
  __int128 v6;
  _OWORD v7[3];

  if (*(_DWORD *)a2 != 2)
    return 1;
  memset(v7, 0, sizeof(v7));
  v3 = *(__int128 **)(a1 + 64);
  _newrpclib_xdrmem_create((uint64_t)v7, *(_QWORD *)(a2 + 8), *(_DWORD *)(a2 + 16), 1);
  v4 = (void *)*((_QWORD *)v3 + 4);
  if (v4)
  {
    free(v4);
    *((_QWORD *)v3 + 4) = 0;
  }
  if (_newrpclib_xdr_opaque_auth((uint64_t (***)(void))v7, (uint64_t)v3 + 24))
  {
    v3 = (__int128 *)((char *)v3 + 24);
  }
  else
  {
    LODWORD(v7[0]) = 2;
    _newrpclib_xdr_opaque_auth((uint64_t (***)(void))v7, (uint64_t)v3 + 24);
    *((_QWORD *)v3 + 4) = 0;
  }
  v6 = *v3;
  *(_QWORD *)(a1 + 16) = *((_QWORD *)v3 + 2);
  *(_OWORD *)a1 = v6;
  return marshal_new_auth(a1);
}

BOOL authunix_refresh(uint64_t a1)
{
  __int128 *v1;
  uint64_t v2;
  __int128 v4;
  _BOOL8 v5;
  void (*v6)(timeval *);
  timeval v8[3];
  timeval v9;
  _OWORD v10[2];
  uint64_t v11;

  v1 = *(__int128 **)(a1 + 64);
  memset(v10, 0, sizeof(v10));
  memset(v8, 0, sizeof(v8));
  v2 = *((_QWORD *)v1 + 1);
  if (*(_QWORD *)(a1 + 8) == v2)
    return 0;
  ++*((_DWORD *)v1 + 12);
  *((_QWORD *)&v10[0] + 1) = 0;
  v11 = 0;
  _newrpclib_xdrmem_create((uint64_t)v8, v2, *((_DWORD *)v1 + 4), 1);
  if (_newrpclib_xdr_authunix_parms((uint64_t (***)(void))v8, (uint64_t)v10)
    && (v9.tv_sec = 0,
        *(_QWORD *)&v9.tv_usec = 0,
        gettimeofday(&v9, 0),
        LODWORD(v10[0]) = v9.tv_sec,
        LODWORD(v8[0].tv_sec) = 0,
        (*(void (**)(timeval *, _QWORD))(*(_QWORD *)&v8[0].tv_usec + 40))(v8, 0),
        _newrpclib_xdr_authunix_parms((uint64_t (***)(void))v8, (uint64_t)v10)))
  {
    v4 = *v1;
    *(_QWORD *)(a1 + 16) = *((_QWORD *)v1 + 2);
    *(_OWORD *)a1 = v4;
    v5 = marshal_new_auth(a1);
  }
  else
  {
    v5 = 0;
  }
  LODWORD(v8[0].tv_sec) = 2;
  _newrpclib_xdr_authunix_parms((uint64_t (***)(void))v8, (uint64_t)v10);
  v6 = *(void (**)(timeval *))(*(_QWORD *)&v8[0].tv_usec + 56);
  if (v6)
    v6(v8);
  return v5;
}

void authunix_destroy(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 64);
  free(*(void **)(v2 + 8));
  v3 = *(void **)(v2 + 32);
  if (v3)
    free(v3);
  free(*(void **)(a1 + 64));
  v4 = *(void **)(a1 + 32);
  if (v4)
    free(v4);
  free((void *)a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x2Eu);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x26u);
}

int *OUTLINED_FUNCTION_6@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
  return __error();
}

BOOL _newrpclib_xdr_authunix_parms(uint64_t (***a1)(void), uint64_t a2)
{
  return _newrpclib_xdr_uint32_t(a1, (int *)a2)
      && _newrpclib_xdr_string(a1, (char **)(a2 + 8), 0xFFu)
      && _newrpclib_xdr_uint32_t(a1, (int *)(a2 + 16))
      && _newrpclib_xdr_uint32_t(a1, (int *)(a2 + 20))
      && _newrpclib_xdr_array(a1, (void **)(a2 + 32), (int *)(a2 + 24), 0x10u, 4u, (uint64_t (*)(uint64_t (***)(void), char *))_newrpclib_xdr_uint32_t);
}

_QWORD *_newrpclib_clnt_create_timeout(char *a1, uint64_t a2, unsigned int a3, char *__s2, __int128 *a5)
{
  _DWORD *v9;
  int v10;
  _DWORD *v11;
  _QWORD *result;
  _DWORD *v13;
  uint64_t v14;
  unint64_t v15;
  sockaddr v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  memset(&v16, 0, 128);
  v14 = 0;
  v15 = 0;
  if (_newrpclib_netid2socparms(__s2, &v15, (_DWORD *)&v14 + 1, &v14, 1))
  {
    v9 = _newrpclib___rpc_createerr();
    v10 = 17;
LABEL_3:
    *v9 = v10;
    v11 = _newrpclib___rpc_createerr();
    result = 0;
    v11[2] = 46;
    return result;
  }
  if ((_DWORD)v15 == 1)
  {
    v15 = 0xFFFFFFFF00000001;
    *(_WORD *)&v16.sa_len = 362;
    memset(v16.sa_data, 0, 104);
LABEL_6:
    if (HIDWORD(v14) == 1)
      return clntticotsord_create_timeout(&v16, a2, a3, (int *)&v15 + 1, 0, 0, 0, a5);
LABEL_19:
    v9 = _newrpclib___rpc_createerr();
    v10 = 12;
    goto LABEL_3;
  }
  if (gethostaddr(a1, v15, &v16))
  {
    v13 = _newrpclib___rpc_createerr();
    result = 0;
    *v13 = 13;
  }
  else
  {
    HIDWORD(v15) = -1;
    if ((int)v15 > 1)
    {
      if ((_DWORD)v15 != 30 && (_DWORD)v15 != 2)
        goto LABEL_19;
    }
    else if ((_DWORD)v15)
    {
      if ((_DWORD)v15 != 1)
        goto LABEL_19;
      goto LABEL_6;
    }
    if ((_DWORD)v14 == 6)
    {
      return _newrpclib_clnttcp_create_timeout(&v16, a2, a3, (int *)&v15 + 1, 0, 0, 0, a5);
    }
    else
    {
      if ((_DWORD)v14 != 17)
        goto LABEL_19;
      return _newrpclib_clntudp_bufcreate_timeout(&v16.sa_len, a2, a3, (int *)&v15 + 1, 8800, 8800, 0, a5);
    }
  }
  return result;
}

_QWORD *_newrpclib_clnt_create(char *a1, uint64_t a2, unsigned int a3, char *__s2)
{
  _DWORD *v8;
  int v9;
  _DWORD *v10;
  _QWORD *result;
  __int128 *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v14 = 0;
  v15 = 0;
  v13 = 0;
  if (_newrpclib_netid2socparms(__s2, (_DWORD *)&v15 + 1, 0, &v15, 1))
  {
    v8 = _newrpclib___rpc_createerr();
    v9 = 17;
LABEL_3:
    *v8 = v9;
    v10 = _newrpclib___rpc_createerr();
    result = 0;
    v10[2] = 46;
    return result;
  }
  if ((_DWORD)v15 == 6)
  {
    v12 = 0;
  }
  else
  {
    if ((_DWORD)v15 != 17)
    {
      v8 = _newrpclib___rpc_createerr();
      v9 = 12;
      goto LABEL_3;
    }
    v13 = 5;
    LODWORD(v14) = 0;
    v12 = (__int128 *)&v13;
  }
  return _newrpclib_clnt_create_timeout(a1, a2, a3, __s2, v12);
}

uint64_t clnt_auth_set(uint64_t *a1, uint64_t a2)
{
  uint64_t result;

  result = *a1;
  if (result)
    result = (*(uint64_t (**)(void))(*(_QWORD *)(result + 56) + 32))();
  *a1 = a2;
  return result;
}

_QWORD *reply_addr_cache_create(size_t a1)
{
  size_t v1;
  _QWORD *v2;
  void *v3;

  if (a1)
    v1 = a1;
  else
    v1 = 256;
  v2 = calloc(1uLL, 0x10uLL);
  if (v2)
  {
    v3 = calloc(v1, 0x1CuLL);
    v2[1] = v3;
    if (v3)
    {
      *(_DWORD *)v2 = v1;
    }
    else
    {
      free(v2);
      return 0;
    }
  }
  return v2;
}

void reply_addr_cache_destroy(void **a1)
{
  if (a1)
  {
    free(a1[1]);
    free(a1);
  }
}

uint64_t _newrpclib_clnt_multicasts_buf_timeout(uint64_t a1, size_t __count, unsigned int (*a3)(uint64_t, timeval *, _DWORD *, unint64_t), uint64_t a4, int *a5, size_t a6, _DWORD *a7, size_t a8, int *a9, unsigned int a10, unsigned int a11, int a12)
{
  size_t v16;
  _DWORD *v18;
  char *v19;
  _DWORD *v20;
  size_t v21;
  pollfd *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  ifaddrs *v26;
  char *v27;
  int v28;
  int v29;
  int v30;
  int v31;
  char *v32;
  int *v33;
  _QWORD *v34;
  _QWORD *v35;
  pollfd *v36;
  int v37;
  int v38;
  int tv_sec;
  uint64_t v40;
  char *v41;
  int *v42;
  uint64_t v43;
  _DWORD *v44;
  const sockaddr **v45;
  int v46;
  unsigned __int8 *v47;
  int sa_family;
  int v49;
  socklen_t v50;
  int v51;
  unsigned int v52;
  unint64_t v53;
  pollfd *v54;
  size_t v55;
  __darwin_time_t v56;
  __darwin_suseconds_t tv_usec;
  int v58;
  unint64_t v59;
  BOOL v60;
  unint64_t v61;
  _DWORD *v62;
  uint64_t v63;
  pollfd *v64;
  unint64_t v65;
  ssize_t v66;
  size_t tv_sec_low;
  unsigned int v68;
  int v69;
  timeval *p_s2;
  int v71;
  uint64_t v72;
  unsigned int v73;
  int v74;
  int v75;
  int v76;
  unsigned __int8 *v77;
  int v78;
  unsigned int v79;
  uint64_t v80;
  unint64_t v82;
  int v83;
  unsigned int v84;
  unsigned int (*v85)(uint64_t, timeval *, _DWORD *, unint64_t);
  uint64_t v86;
  size_t v87;
  uint64_t v88;
  char *v89;
  char *v90;
  pollfd *v92;
  __int16 v93;
  char v94;
  int v95;
  ifaddrs *v97;
  socklen_t v98[2];
  timeval v99;
  timeval __s2;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  uint64_t v108;

  v16 = __count;
  v108 = *MEMORY[0x24BDAC8D0];
  v18 = calloc(__count, 0x20uLL);
  if (!v18)
    return 12;
  v19 = (char *)v18;
  v97 = 0;
  if (v16)
  {
    v20 = v18 + 7;
    v21 = v16;
    do
    {
      *v20 = -1;
      v20 += 8;
      --v21;
    }
    while (v21);
  }
  v22 = (pollfd *)calloc(v16, 8uLL);
  if (!v22)
  {
    free(v19);
    return 12;
  }
  v92 = v22;
  if (getifaddrs(&v97))
  {
LABEL_7:
    v23 = 3;
    goto LABEL_119;
  }
  v86 = a4;
  v87 = a8;
  v85 = a3;
  if (!v16)
  {
    v23 = 5;
    goto LABEL_36;
  }
  v24 = 0;
  v88 = a1;
  v89 = v19;
  do
  {
    v25 = *(_QWORD *)(a1 + 8 * v24);
    v26 = v97;
    v27 = &v19[32 * v24];
    LODWORD(__s2.tv_sec) = 1;
    *(_QWORD *)v27 = 0;
    *((_QWORD *)v27 + 1) = v27;
    *((_QWORD *)v27 + 2) = v25;
    v28 = *(unsigned __int8 *)(v25 + 1);
    if (v28 == 30)
    {
      if (*(unsigned __int8 *)(v25 + 8) != 255)
        goto LABEL_117;
      v30 = 0;
      v93 = 0;
      v29 = 32769;
      goto LABEL_20;
    }
    if (v28 != 2)
      goto LABEL_117;
    v93 = *(_WORD *)(v25 + 2);
    if (*(_DWORD *)(v25 + 4) == -1)
    {
      v29 = 32771;
      v30 = 1;
LABEL_20:
      *(_DWORD *)&v19[32 * v24 + 24] = v30;
      goto LABEL_21;
    }
    if ((v25 & 0xF0000000) != 0xE0000000)
      goto LABEL_117;
    v29 = 32769;
LABEL_21:
    v31 = socket(v28, 2, 0);
    v32 = &v19[32 * v24];
    *((_DWORD *)v32 + 7) = v31;
    v33 = (int *)(v32 + 28);
    if (v31 == -1)
    {
LABEL_117:
      v23 = 3;
      goto LABEL_118;
    }
    if (setsockopt(v31, 0xFFFF, 32, &__s2, 4u))
    {
      v23 = 3;
      goto LABEL_116;
    }
    for (; v26; v26 = v26->ifa_next)
    {
      if (*(unsigned __int8 *)(v25 + 1) == v26->ifa_addr->sa_family && (v29 & ~v26->ifa_flags) == 0)
      {
        v34 = calloc(1uLL, 0x98uLL);
        if (!v34)
        {
          v23 = 12;
          goto LABEL_115;
        }
        v35 = v34;
        v34[16] = v34;
        if (*(_DWORD *)&v89[32 * v24 + 24])
        {
          __memcpy_chk();
          *(_WORD *)(v35[16] + 2) = v93;
        }
        else
        {
          __memcpy_chk();
        }
        *((_DWORD *)v35 + 34) = if_nametoindex(v26->ifa_name);
        v35[18] = 0;
        **((_QWORD **)v27 + 1) = v35;
        *((_QWORD *)v27 + 1) = v35 + 18;
      }
    }
    if (!*(_QWORD *)v27)
    {
      v23 = 3;
LABEL_115:
      v19 = v89;
LABEL_116:
      free_interface_list((uint64_t)v27);
LABEL_118:
      MEMORY[0x22E30D0AC](v97);
      goto LABEL_119;
    }
    v36 = &v92[v24];
    v36->fd = *v33;
    *(_DWORD *)&v36->events = 64;
    ++v24;
    a1 = v88;
    v19 = v89;
  }
  while (v24 != v16);
  v23 = 0;
LABEL_36:
  MEMORY[0x22E30D0AC](v97);
  if (!*a5)
  {
    LODWORD(v99.tv_sec) = 0;
    v37 = open("/dev/random", 0, 0);
    v38 = v37;
    if ((v37 & 0x80000000) == 0 && read(v37, &v99, 4uLL) == 4
      || (__s2.tv_sec = 0,
          *(_QWORD *)&__s2.tv_usec = 0,
          gettimeofday(&__s2, 0),
          tv_sec = getpid() ^ LODWORD(__s2.tv_sec) ^ __s2.tv_usec,
          LODWORD(v99.tv_sec) = tv_sec,
          (v38 & 0x80000000) == 0))
    {
      close(v38);
      tv_sec = v99.tv_sec;
    }
    *a5 = tv_sec;
  }
  v84 = a10;
  if (a10 > a11)
    goto LABEL_119;
  while (2)
  {
    if (!v16)
      goto LABEL_63;
    v40 = 0;
    while (2)
    {
      v41 = &v19[32 * v40];
      v42 = (int *)(v41 + 28);
      v43 = *(_QWORD *)v41;
      if (!*(_QWORD *)v41)
        goto LABEL_7;
      v94 = 0;
      v44 = v41 + 24;
      v45 = (const sockaddr **)(v41 + 16);
      v46 = -1;
      v23 = 3;
      while (2)
      {
        while (!*v44)
        {
          v47 = (unsigned __int8 *)(v43 + 136);
          if (*(_DWORD *)(v43 + 136) == v46)
            goto LABEL_57;
          sa_family = (*v45)->sa_family;
          if (sa_family == 30)
          {
            v49 = *v42;
            v51 = 41;
            v50 = 4;
          }
          else
          {
            if (sa_family != 2)
              goto LABEL_56;
            v49 = *v42;
            v47 = *(unsigned __int8 **)(v43 + 128);
            v50 = *v47;
            v51 = 0;
          }
          if (setsockopt(v49, v51, 9, v47, v50))
            goto LABEL_57;
LABEL_56:
          if (sendto(*v42, a5, a6, 0, *v45, (*v45)->sa_len) != a6)
            goto LABEL_57;
          v23 = 0;
          v46 = *(_DWORD *)(v43 + 136);
          v43 = *(_QWORD *)(v43 + 144);
          v94 = 1;
          if (!v43)
            goto LABEL_62;
        }
        if (sendto(*v42, a5, a6, 0, *(const sockaddr **)(v43 + 128), **(unsigned __int8 **)(v43 + 128)) == a6)
          goto LABEL_62;
LABEL_57:
        v43 = *(_QWORD *)(v43 + 144);
        if (v43)
          continue;
        break;
      }
      if ((v94 & 1) == 0)
        goto LABEL_119;
LABEL_62:
      if (++v40 != v16)
        continue;
      break;
    }
LABEL_63:
    v52 = v84;
    if (!v84)
    {
      v95 = 0;
LABEL_110:
      v78 = v95;
      goto LABEL_111;
    }
    v95 = 0;
    v83 = *a5;
    *(_QWORD *)v98 = 0;
    __s2 = (timeval)0;
    v101 = 0u;
    v102 = 0u;
    v103 = 0u;
    v104 = 0u;
    v105 = 0u;
    v106 = 0u;
    v107 = 0u;
    v53 = (int)(1000 * v84);
    v54 = v92;
    v55 = v87;
    while (1)
    {
      v99.tv_sec = 0;
      *(_QWORD *)&v99.tv_usec = 0;
      gettimeofday(&v99, 0);
      v56 = v99.tv_sec;
      tv_usec = v99.tv_usec;
      v58 = poll(v54, v16, v53);
      if (!v58)
        goto LABEL_110;
      if (v58 <= 0)
      {
        while (v58 == -1)
        {
          if (*__error() != 4 && *__error() != 35)
          {
            v23 = 4;
            goto LABEL_119;
          }
          gettimeofday(&v99, 0);
          v56 = v99.tv_sec;
          tv_usec = v99.tv_usec;
          v58 = poll(v54, v16, v53);
          if (!v58)
            goto LABEL_110;
          if (v58 >= 1)
            goto LABEL_67;
        }
      }
      else
      {
LABEL_67:
        gettimeofday(&v99, 0);
        v59 = 1000 * (v99.tv_sec - v56) + v99.tv_usec / 1000 + tv_usec / -1000;
        v60 = v53 >= v59;
        v61 = v53 - v59;
        v53 = v60 ? v61 : 0;
      }
      v82 = v53;
      v62 = a7;
      if ((int)v16 >= 1)
        break;
LABEL_106:
      v53 = v82;
      if (!v82)
        goto LABEL_110;
    }
    v63 = 0;
    v90 = v19;
    while (2)
    {
      v64 = &v54[v63];
      if ((v64->revents & 0x40) == 0)
        goto LABEL_97;
      v106 = 0u;
      v107 = 0u;
      v104 = 0u;
      v105 = 0u;
      v102 = 0u;
      v103 = 0u;
      __s2 = (timeval)0;
      v101 = 0u;
      LOBYTE(__s2.tv_sec) = 0x80;
      *(_QWORD *)v98 = 128;
      v65 = recvfrom(v64->fd, v62, v55, 0, (sockaddr *)&__s2, v98);
      if ((v65 & 0x8000000000000000) == 0)
      {
LABEL_78:
        if (v65 >= 4 && *v62 == v83)
        {
          tv_sec_low = LOBYTE(__s2.tv_sec);
          if (LOBYTE(__s2.tv_sec) >= 4u)
          {
            v68 = 0;
            v69 = LOBYTE(__s2.tv_sec) >> 2;
            p_s2 = &__s2;
            do
            {
              v71 = p_s2->tv_sec;
              p_s2 = (timeval *)((char *)p_s2 + 4);
              v68 = v71 + (v68 << 8);
              --v69;
            }
            while (v69);
          }
          else
          {
            v68 = 0;
          }
          if (a9 && (v72 = *((_QWORD *)a9 + 1)) != 0 && (v73 = *a9) != 0)
          {
            v74 = 0;
            v75 = v68 % v73;
            v76 = *a9;
            while (1)
            {
              v77 = (unsigned __int8 *)(v72 + 28 * ((v74 + v75) % v73));
              if (!v77[1])
              {
                memcpy(v77, &__s2, tv_sec_low);
                goto LABEL_94;
              }
              if (*v77 == (_DWORD)tv_sec_low && !memcmp(v77, &__s2, tv_sec_low))
                break;
              ++v74;
              if (!--v76)
                goto LABEL_94;
            }
            v19 = v90;
            v62 = a7;
            v54 = v92;
            v55 = v87;
          }
          else
          {
LABEL_94:
            v62 = a7;
            v54 = v92;
            v55 = v87;
            if (v85(v86, &__s2, a7, v65))
            {
              v23 = 0;
              v19 = v90;
              goto LABEL_119;
            }
            v95 = 1;
            v19 = v90;
          }
          v52 = v84;
        }
LABEL_97:
        if (++v63 == v16)
          goto LABEL_106;
        continue;
      }
      break;
    }
    while (*__error() == 4 || *__error() == 35)
    {
      v106 = 0u;
      v107 = 0u;
      v104 = 0u;
      v105 = 0u;
      v102 = 0u;
      v103 = 0u;
      __s2 = (timeval)0;
      v101 = 0u;
      LOBYTE(__s2.tv_sec) = 0x80;
      *(_QWORD *)v98 = 128;
      v66 = recvfrom(v64->fd, v62, v55, 0, (sockaddr *)&__s2, v98);
      if ((v66 & 0x8000000000000000) == 0)
      {
        v65 = v66;
        goto LABEL_78;
      }
    }
    v78 = 4;
LABEL_111:
    v79 = v52 + a12;
    v23 = 5;
    if (v79 <= a11)
    {
      v84 = v79;
      if (v78)
        continue;
    }
    break;
  }
LABEL_119:
  if (v16)
  {
    v80 = (uint64_t)v19;
    do
    {
      free_interface_list(v80);
      v80 += 32;
      --v16;
    }
    while (v16);
  }
  free(v19);
  free(v92);
  return v23;
}

uint64_t free_interface_list(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t result;

  v2 = *(_QWORD **)a1;
  if (v2)
  {
    do
    {
      v3 = (_QWORD *)v2[18];
      free(v2);
      v2 = v3;
    }
    while (v3);
  }
  result = *(unsigned int *)(a1 + 28);
  if ((_DWORD)result != -1)
  {
    result = close(result);
    *(_DWORD *)(a1 + 28) = -1;
  }
  return result;
}

void *_newrpclib___rpc_createerr()
{
  void *v0;

  if (pthread_once(&rpc_createerr_once, tsd_init_rpc_createerr))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      _newrpclib___rpc_createerr_cold_2();
    return 0;
  }
  else
  {
    v0 = pthread_getspecific(rpc_createerr_key);
    if (!v0)
    {
      v0 = calloc(1uLL, 0x10uLL);
      if (pthread_setspecific(rpc_createerr_key, v0))
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          _newrpclib___rpc_createerr_cold_1();
      }
    }
  }
  return v0;
}

void tsd_init_rpc_createerr()
{
  if (pthread_key_create((pthread_key_t *)&rpc_createerr_key, (void (__cdecl *)(void *))rpc_createerr_destroy))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      tsd_init_rpc_createerr_cold_1();
  }
}

char *_newrpclib_clnt_sperror(uint64_t a1, _BYTE *a2)
{
  char *v4;

  v4 = (char *)_buf();
  if (v4)
    clnt_sperror_r(a1, a2, v4);
  return v4;
}

void *_buf()
{
  void *v0;

  if (pthread_once(&clnt_perror_once, tsd_init_buf))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      _buf_cold_2();
    return 0;
  }
  else
  {
    v0 = pthread_getspecific(buf);
    if (!v0)
    {
      v0 = malloc(0x100uLL);
      if (pthread_setspecific(buf, v0))
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          _buf_cold_1();
      }
    }
  }
  return v0;
}

char *clnt_sperror_r(uint64_t a1, _BYTE *a2, char *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v20;
  char __strerrbuf[16];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  *(_OWORD *)__strerrbuf = 0u;
  (*(void (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
  *a3 = 0;
  if (a2 && *a2)
    slprintf(a3, v5, "%s: ", v6, v7, v8, v9, v10, (char)a2);
  v11 = 0;
  v12 = "RPC: (unknown error code)";
  while (rpc_errlist[v11])
  {
    v11 += 4;
    if (v11 == 72)
      goto LABEL_9;
  }
  v12 = *(const char **)&rpc_errlist[v11 + 2];
LABEL_9:
  strlcat(a3, v12, 0x100uLL);
  slprintf(a3, v13, "\n", v14, v15, v16, v17, v18, v20);
  return a3;
}

uint64_t _newrpclib_clnt_perror(uint64_t a1, _BYTE *a2)
{
  FILE *v2;
  _OWORD v4[16];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  memset(v4, 0, sizeof(v4));
  v2 = (FILE *)*MEMORY[0x24BDAC8D8];
  clnt_sperror_r(a1, a2, (char *)v4);
  return fputs((const char *)v4, v2);
}

const char *_newrpclib_clnt_sperrno(int a1)
{
  uint64_t v2;
  const char *result;

  v2 = 0;
  result = "RPC: (unknown error code)";
  while (rpc_errlist[v2] != a1)
  {
    v2 += 4;
    if (v2 == 72)
      return result;
  }
  return *(const char **)&rpc_errlist[v2 + 2];
}

uint64_t _newrpclib_clnt_perrno(int a1)
{
  uint64_t v2;
  const char *v3;

  v2 = 0;
  v3 = "RPC: (unknown error code)";
  while (rpc_errlist[v2] != a1)
  {
    v2 += 4;
    if (v2 == 72)
      return fputs(v3, (FILE *)*MEMORY[0x24BDAC8D8]);
  }
  v3 = *(const char **)&rpc_errlist[v2 + 2];
  return fputs(v3, (FILE *)*MEMORY[0x24BDAC8D8]);
}

char *_newrpclib_clnt_spcreateerror(char a1)
{
  _DWORD *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  int v21;
  const char *v22;
  char *v24;
  char __strerrbuf[16];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v2 = _newrpclib___rpc_createerr();
  v3 = (const char *)_buf();
  v10 = 0;
  if (v3 && v2)
  {
    v28 = 0u;
    v29 = 0u;
    v10 = (char *)v3;
    v26 = 0u;
    v27 = 0u;
    *(_OWORD *)__strerrbuf = 0u;
    *v3 = 0;
    slprintf(v3, v4, "%s: ", v5, v6, v7, v8, v9, a1);
    v11 = 0;
    v12 = "RPC: (unknown error code)";
    while (rpc_errlist[v11] != *v2)
    {
      v11 += 4;
      if (v11 == 72)
        goto LABEL_8;
    }
    v12 = *(const char **)&rpc_errlist[v11 + 2];
LABEL_8:
    strlcat(v10, v12, 0x100uLL);
    if (*v2 == 12)
    {
      v21 = v2[2];
      if (v21 < 1 || v21 >= *MEMORY[0x24BDB00D8])
      {
        LODWORD(v24) = v2[2];
        v22 = " - Error %d\n";
        goto LABEL_22;
      }
      strerror_r(v21, __strerrbuf, 0x50uLL);
      v24 = __strerrbuf;
LABEL_20:
      v22 = " - %s\n";
LABEL_22:
      slprintf(v10, v13, v22, v14, v15, v16, v17, v18, (char)v24);
      return v10;
    }
    if (*v2 == 14)
    {
      v19 = 0;
      v20 = "RPC: (unknown error code)";
      while (rpc_errlist[v19] != v2[1])
      {
        v19 += 4;
        if (v19 == 72)
          goto LABEL_19;
      }
      v20 = *(const char **)&rpc_errlist[v19 + 2];
LABEL_19:
      LOBYTE(v24) = (_BYTE)v20;
      goto LABEL_20;
    }
    strlcat(v10, "\n", 0x100uLL);
  }
  return v10;
}

size_t slprintf(const char *a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  size_t result;

  result = strlen(a1);
  if (result <= 0xFF)
    return vsnprintf((char *)&a1[result], 256 - result, a3, &a9);
  return result;
}

uint64_t _newrpclib_clnt_pcreateerror(char a1)
{
  FILE *v1;
  char *v2;

  v1 = (FILE *)*MEMORY[0x24BDAC8D8];
  v2 = _newrpclib_clnt_spcreateerror(a1);
  return fputs(v2, v1);
}

void rpc_createerr_destroy(void *a1)
{
  if (a1)
    free(a1);
}

void tsd_init_buf()
{
  if (pthread_key_create((pthread_key_t *)&buf, (void (__cdecl *)(void *))bufdestroy))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      tsd_init_buf_cold_1();
  }
}

void bufdestroy(void *a1)
{
  if (a1)
    free(a1);
}

uint64_t _newrpclib_clntraw_create(int a1, int a2)
{
  uint64_t v4;
  void *v5;
  void (*v6)(uint64_t);
  int v8;
  uint64_t v9;
  int v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v4 = clntraw_private;
  if (!clntraw_private)
  {
    v5 = calloc(1uLL, 0x2308uLL);
    v4 = (uint64_t)v5;
    if (!v5)
      return v4;
    clntraw_private = (uint64_t)v5;
  }
  v8 = 0;
  v11 = 0u;
  v14 = 0;
  v12 = 0u;
  v13 = 0u;
  v9 = 0x200000000;
  v10 = a1;
  LODWORD(v11) = a2;
  _newrpclib_xdrmem_create(v4 + 88, v4 + 8936, 24, 0);
  if (!_newrpclib_xdr_callhdr((uint64_t (***)(void))(v4 + 88), (uint64_t)&v8)
    && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    _newrpclib_clntraw_create_cold_1();
  }
  *(_DWORD *)(v4 + 8960) = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v4 + 96) + 32))(v4 + 88);
  v6 = *(void (**)(uint64_t))(*(_QWORD *)(v4 + 96) + 56);
  if (v6)
    v6(v4 + 88);
  _newrpclib_xdrmem_create(v4 + 88, v4 + 136, 8800, 2);
  *(_QWORD *)(v4 + 8) = client_ops;
  *(_QWORD *)v4 = _newrpclib_authnone_create();
  return v4;
}

uint64_t clntraw_call(uint64_t a1, int a2, unsigned int (*a3)(uint64_t, uint64_t), uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _DWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v16;
  int v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  int v23;

  v23 = a2;
  v6 = clntraw_private;
  if (!clntraw_private)
    return 16;
  v11 = (_DWORD *)(clntraw_private + 88);
  v22 = 0;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0;
  v17 = 0;
  while (1)
  {
    *(_DWORD *)(v6 + 88) = 0;
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v6 + 96) + 40))(v6 + 88, 0);
    ++*(_DWORD *)(v6 + 8936);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v6 + 96) + 24))(v6 + 88, v6 + 8936, *(unsigned int *)(v6 + 8960))|| !(*(unsigned int (**)(uint64_t, int *))(*(_QWORD *)(v6 + 96) + 8))(v6 + 88, &v23)|| !(*(unsigned int (**)(void))(*(_QWORD *)(*(_QWORD *)a1 + 56) + 8))()|| !a3(v6 + 88, a4))
    {
      return 1;
    }
    (*(void (**)(uint64_t))(*(_QWORD *)(v6 + 96) + 32))(v6 + 88);
    *(_DWORD *)(v6 + 88) = 1;
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v6 + 96) + 40))(v6 + 88, 0);
    v19 = _newrpclib__null_auth;
    *(_QWORD *)&v20 = qword_255D60578;
    *(_QWORD *)&v21 = a6;
    *((_QWORD *)&v21 + 1) = a5;
    if (!_newrpclib_xdr_replymsg((uint64_t (***)(void))(v6 + 88), (uint64_t)&v18))
      return 2;
    _newrpclib__seterr_reply(&v18, (int *)&v16);
    v12 = v16;
    v13 = *(_QWORD *)(*(_QWORD *)a1 + 56);
    if (!(_DWORD)v16)
      break;
    if (!(*(unsigned int (**)(void))(v13 + 24))())
      return v12;
  }
  v12 = 7;
  if ((*(unsigned int (**)(void))(v13 + 16))())
  {
    if ((*(unsigned int (**)(void))(*(_QWORD *)(*(_QWORD *)a1 + 56) + 16))())
      v12 = 0;
    else
      v12 = 7;
    if (*((_QWORD *)&v19 + 1))
    {
      *v11 = 2;
      _newrpclib_xdr_opaque_auth((uint64_t (***)(void))(v6 + 88), (uint64_t)&v19);
    }
  }
  return v12;
}

uint64_t clntraw_freeres(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t), uint64_t a3)
{
  uint64_t v3;

  v3 = clntraw_private;
  if (!clntraw_private)
    return 16;
  *(_DWORD *)(clntraw_private + 88) = 2;
  return a2(v3 + 88, a3);
}

uint64_t clntraw_control()
{
  return 0;
}

_QWORD *clntstrm_create_timeout(const sockaddr *a1, uint64_t a2, unsigned int a3, int *a4, unsigned int a5, unsigned int a6, uint64_t a7, __int128 *a8)
{
  int v16;
  _QWORD *v17;
  int *v18;
  int *v19;
  int v20;
  int v21;
  int v22;
  int *v23;
  int v24;
  int v25;
  int v26;
  unsigned int sa_family;
  int *v28;
  int v29;
  int v30;
  int v32;
  unsigned int v33;
  int v34;
  int v35;
  void (*v36)(int *);
  int v37;
  int v38;
  int v39;
  int v40;
  __darwin_time_t v41;
  int v42;
  unsigned int v43;
  unsigned int v44;
  unsigned int v45;
  pollfd v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  __int128 v52;
  timeval v53;
  timeval v54;
  socklen_t v55;
  socklen_t v56;
  int v57;
  sockaddr v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v54.tv_sec = 0;
  *(_QWORD *)&v54.tv_usec = 0;
  v53.tv_sec = 0;
  *(_QWORD *)&v53.tv_usec = 0;
  v52 = 0uLL;
  v51 = 0;
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v46 = 0;
  v16 = *a4;
  v17 = calloc(1uLL, 0x58uLL);
  if (!v17)
  {
    *(_DWORD *)_newrpclib___rpc_createerr() = 12;
    v21 = *__error();
    *((_DWORD *)_newrpclib___rpc_createerr() + 2) = v21;
    return v17;
  }
  v44 = a5;
  v45 = a3;
  v18 = (int *)calloc(1uLL, 0xF8uLL);
  if (!v18)
  {
    *(_DWORD *)_newrpclib___rpc_createerr() = 12;
    v22 = *__error();
    *((_DWORD *)_newrpclib___rpc_createerr() + 2) = v22;
LABEL_11:
    v23 = (int *)v17;
LABEL_27:
    free(v23);
    return 0;
  }
  v19 = v18;
  v43 = a6;
  v20 = *a4;
  v56 = 4;
  v57 = 1;
  if ((v20 & 0x80000000) == 0)
  {
    v55 = 128;
    if (!getsockopt(v20, 0xFFFF, 4104, &v57, &v56))
    {
      if (v57 != 1)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          clntstrm_create_timeout_cold_7();
        goto LABEL_24;
      }
      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      v58 = (sockaddr)0;
      v59 = 0u;
      if (getsockname(v20, &v58, &v55))
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          clntstrm_create_timeout_cold_6();
        goto LABEL_26;
      }
      if (a1)
      {
        sa_family = v58.sa_family;
        if (a1->sa_family && a1->sa_family != v58.sa_family)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            clntstrm_create_timeout_cold_5();
LABEL_24:
          v28 = __error();
          v29 = 22;
LABEL_25:
          *v28 = v29;
          goto LABEL_26;
        }
      }
      else
      {
        sa_family = v58.sa_family;
      }
      if (sa_family <= 0x1E && ((1 << sa_family) & 0x40000006) != 0)
      {
        setsockopt(v20, 0xFFFF, 4130, &v57, 4u);
        goto LABEL_43;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        clntstrm_create_timeout_cold_4();
LABEL_33:
      v28 = __error();
      v29 = 45;
      goto LABEL_25;
    }
    goto LABEL_26;
  }
  if (!a1)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      clntstrm_create_timeout_cold_1();
    goto LABEL_24;
  }
  v24 = a1->sa_family;
  v25 = 6;
  if (v24 != 30 && v24 != 2)
  {
    if (v24 != 1)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        clntstrm_create_timeout_cold_2();
      goto LABEL_33;
    }
    v25 = 0;
  }
  v26 = socket(a1->sa_family, 1, v25);
  if (v26 == -1)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      clntstrm_create_timeout_cold_3();
    goto LABEL_26;
  }
  v20 = v26;
  sa_family = a1->sa_family;
  setsockopt(v26, 0xFFFF, 4130, &v57, 4u);
  if (v20 < 0)
  {
LABEL_26:
    *(_DWORD *)_newrpclib___rpc_createerr() = 12;
    v30 = *__error();
    *((_DWORD *)_newrpclib___rpc_createerr() + 2) = v30;
    free(v17);
    v23 = v19;
    goto LABEL_27;
  }
LABEL_43:
  if (sa_family == 1)
  {
    if (!a1->sa_data[0])
    {
      *(_QWORD *)&v58.sa_len = 0;
      if (_newrpclib_socparms2netid(a1->sa_family, 1, 0, (const char **)&v58))
        goto LABEL_90;
      if ((_DWORD)a2 == 100000)
      {
        snprintf(a1->sa_data, 0x68uLL, "%s.%s", "/var/run/rpcb", *(const char **)&v58.sa_len);
      }
      else if (!_newrpclib_rpcb_getaddr_timeout(a1, *(_QWORD *)&v58.sa_len, a2, v45, a7, a8))
      {
        goto LABEL_90;
      }
    }
  }
  else if (sa_family == 30 || sa_family == 2)
  {
    if (!*(_WORD *)a1->sa_data)
    {
      *(_QWORD *)&v58.sa_len = 0;
      if ((_DWORD)a2 == 100000)
      {
        *(_WORD *)a1->sa_data = 28416;
      }
      else if (_newrpclib_socparms2netid(a1->sa_family, 1, 6, (const char **)&v58)
             || !_newrpclib_rpcb_getaddr_timeout(a1, *(_QWORD *)&v58.sa_len, a2, v45, a7, a8))
      {
        goto LABEL_90;
      }
    }
    bindresvport_sa(v20, 0);
  }
  if ((v16 & 0x80000000) == 0)
  {
    v32 = 0;
    v33 = v45;
    goto LABEL_53;
  }
  if (a8)
  {
    v52 = *a8;
    fcntl(v20, 4, 4);
    if (connect(v20, a1, a1->sa_len) < 0 && *__error() != 36)
      goto LABEL_74;
    v46.fd = v20;
    *(_DWORD *)&v46.events = 4;
    v37 = *((_DWORD *)a8 + 2) / 1000 + 1000 * *(_DWORD *)a8;
    gettimeofday(&v53, 0);
    v38 = poll(&v46, 1u, v37);
    if (v38 == -1)
      goto LABEL_74;
    if (v38 != 1)
    {
      if (v38)
      {
        *__error() = 5;
LABEL_74:
        *(_DWORD *)_newrpclib___rpc_createerr() = 12;
        v39 = *__error();
        *((_DWORD *)_newrpclib___rpc_createerr() + 2) = v39;
LABEL_90:
        close(v20);
LABEL_91:
        free(v19);
        goto LABEL_11;
      }
LABEL_89:
      *(_DWORD *)_newrpclib___rpc_createerr() = 5;
      *((_DWORD *)_newrpclib___rpc_createerr() + 2) = 60;
      goto LABEL_90;
    }
    gettimeofday(&v54, 0);
    v40 = v54.tv_usec - v53.tv_usec + 1000000;
    if (v54.tv_usec >= v53.tv_usec)
      v40 = v54.tv_usec - v53.tv_usec;
    v41 = *(_QWORD *)a8 - (v54.tv_sec - v53.tv_sec + ((v54.tv_usec - v53.tv_usec) >> 31));
    *(_QWORD *)a8 = v41;
    v42 = *((_DWORD *)a8 + 2) - v40;
    *((_DWORD *)a8 + 2) = v42;
    if (v42 < 0)
    {
      *(_QWORD *)a8 = --v41;
      *((_DWORD *)a8 + 2) = v42 + 1000000;
    }
    v33 = v45;
    if (v41 < 0)
      goto LABEL_89;
  }
  else
  {
    v33 = v45;
    if (connect(v20, a1, a1->sa_len) < 0)
      goto LABEL_74;
    fcntl(v20, 4, 4);
  }
  v32 = 1;
LABEL_53:
  *v19 = v20;
  v19[1] = v32;
  *((_QWORD *)v19 + 1) = 60;
  v19[4] = 0;
  v19[6] = 0;
  if (a8)
  {
    *(_OWORD *)(v19 + 2) = v52;
    v19[6] = 1;
  }
  __memcpy_chk();
  v34 = open("/dev/random", 0, 0);
  v35 = v34;
  if ((v34 & 0x80000000) == 0 && read(v34, &v47, 4uLL) == 4
    || (gettimeofday(&v54, 0), LODWORD(v47) = getpid() ^ LODWORD(v54.tv_sec) ^ v54.tv_usec, (v35 & 0x80000000) == 0))
  {
    close(v35);
  }
  *(_QWORD *)((char *)&v47 + 4) = 0x200000000;
  HIDWORD(v47) = a2;
  LODWORD(v48) = v33;
  _newrpclib_xdrmem_create((uint64_t)(v19 + 50), (uint64_t)(v19 + 43), 24, 0);
  if (!_newrpclib_xdr_callhdr((uint64_t (***)(void))v19 + 25, (uint64_t)&v47))
  {
    if (!v19[1])
      goto LABEL_91;
    goto LABEL_90;
  }
  v19[49] = (*(uint64_t (**)(int *))(*((_QWORD *)v19 + 26) + 32))(v19 + 50);
  v36 = *(void (**)(int *))(*((_QWORD *)v19 + 26) + 56);
  if (v36)
    v36(v19 + 50);
  _newrpclib_xdrrec_create((uint64_t)(v19 + 50), v44, v43, (uint64_t)v19, (uint64_t)readstrm, (uint64_t)writestrm);
  v17[1] = strm_ops;
  v17[2] = v19;
  *v17 = _newrpclib_authnone_create();
  pthread_mutex_init((pthread_mutex_t *)(v17 + 3), 0);
  *a4 = v20;
  return v17;
}

ssize_t readstrm(int *a1, void *a2, size_t a3)
{
  int v6;
  int v7;
  ssize_t result;
  int v9;
  pollfd v10;

  if (!a3)
    return 0;
  v10 = (pollfd)0x4000000000;
  v10.fd = *a1;
  v6 = a1[4] / 1000 + 1000 * a1[2];
  while (1)
  {
    v7 = poll(&v10, 1u, v6);
    if (v7 != -1)
      break;
    if (*__error() != 4)
    {
      a1[40] = 4;
      a1[41] = *__error();
      return -1;
    }
  }
  if (v7)
  {
    result = read(*a1, a2, a3);
    if (result == -1)
    {
      v9 = *__error();
      a1[40] = 4;
      a1[41] = v9;
    }
    else
    {
      if (result)
        return result;
      *((_QWORD *)a1 + 20) = 0x3600000004;
    }
  }
  else
  {
    a1[40] = 5;
  }
  return -1;
}

uint64_t writestrm(int *a1, char *a2, uint64_t a3)
{
  uint64_t v3;
  ssize_t v6;
  int64_t v7;
  int v8;
  BOOL v9;
  int v10;
  pollfd v12;

  v3 = a3;
  v12 = (pollfd)0x400000000;
  v12.fd = *a1;
  if (a3 >= 1)
  {
    v6 = 0;
    v7 = a3;
    while (1)
    {
      v8 = poll(&v12, 1u, -1);
      if (v8)
      {
        if (v8 == -1)
          break;
        v6 = write(*a1, a2, v7);
        if (v6 == -1)
          break;
      }
      a2 += v6;
      v9 = v7 <= v6;
      v7 -= v6;
      if (v9)
        return v3;
    }
    v10 = *__error();
    a1[40] = 3;
    a1[41] = v10;
    return -1;
  }
  return v3;
}

_QWORD *clntticotsord_create(const sockaddr *a1, uint64_t a2, unsigned int a3, int *a4, unsigned int a5, unsigned int a6)
{
  if (!check_raddr((uint64_t)a1, 1))
    return clntstrm_create_timeout(a1, a2, a3, a4, a5, a6, 0, 0);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    clntticotsord_create_cold_1();
  return 0;
}

uint64_t check_raddr(uint64_t a1, int a2)
{
  if (a1 && *(unsigned __int8 *)(a1 + 1) == a2)
    return 0;
  *(_DWORD *)_newrpclib___rpc_createerr() = 12;
  *((_DWORD *)_newrpclib___rpc_createerr() + 2) = 22;
  return 0xFFFFFFFFLL;
}

_QWORD *clntticots_create(const sockaddr *a1, uint64_t a2, unsigned int a3, int *a4, unsigned int a5, unsigned int a6)
{
  if (!check_raddr((uint64_t)a1, 1))
    return clntticotsord_create(a1, a2, a3, a4, a5, a6);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    clntticots_create_cold_1();
  return 0;
}

_QWORD *_newrpclib_clnttcp_create_sa(const sockaddr *a1, uint64_t a2, unsigned int a3, int *a4, unsigned int a5, unsigned int a6)
{
  if (!check_raddr((uint64_t)a1, 2) || !check_raddr((uint64_t)a1, 30))
    return clntstrm_create_timeout(a1, a2, a3, a4, a5, a6, 0, 0);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    _newrpclib_clnttcp_create_sa_cold_1();
  return 0;
}

_QWORD *_newrpclib_clnttcp_create_timeout(const sockaddr *a1, uint64_t a2, unsigned int a3, int *a4, unsigned int a5, unsigned int a6, uint64_t a7, __int128 *a8)
{
  if (!check_raddr((uint64_t)a1, 2) || !check_raddr((uint64_t)a1, 30))
    return clntstrm_create_timeout(a1, a2, a3, a4, a5, a6, a7, a8);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    _newrpclib_clnttcp_create_timeout_cold_1();
  return 0;
}

_QWORD *_newrpclib_clnttcp_create(const sockaddr *a1, uint64_t a2, unsigned int a3, int *a4, unsigned int a5, unsigned int a6)
{
  if (!check_raddr((uint64_t)a1, 2))
    return clntstrm_create_timeout(a1, a2, a3, a4, a5, a6, 0, 0);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    _newrpclib_clnttcp_create_cold_1();
  return 0;
}

_QWORD *clntticotsord_create_timeout(const sockaddr *a1, uint64_t a2, unsigned int a3, int *a4, unsigned int a5, unsigned int a6, uint64_t a7, __int128 *a8)
{
  if (!check_raddr((uint64_t)a1, 1))
    return clntstrm_create_timeout(a1, a2, a3, a4, a5, a6, a7, a8);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    clntticotsord_create_timeout_cold_1();
  return 0;
}

uint64_t clntstrm_call(_QWORD *a1, int a2, unsigned int (*a3)(uint64_t, uint64_t), uint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  _DWORD *v10;
  uint64_t v11;
  _BOOL4 v12;
  unsigned int *v13;
  int v14;
  unsigned int v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t result;
  int v19;
  _BOOL4 v22;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  int v31;

  v31 = a2;
  v8 = a1[2];
  v30 = 0;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v9 = v8 + 172;
  if (!*(_DWORD *)(v8 + 24))
  {
    *(_QWORD *)(v8 + 8) = a7;
    *(_QWORD *)(v8 + 16) = a8;
  }
  v10 = (_DWORD *)(v8 + 200);
  v11 = a7 | a8;
  v12 = (v11 | a5) != 0;
  v13 = (unsigned int *)(v8 + 160);
  v22 = v11 == 0;
  v14 = 2;
  while (1)
  {
    *(_DWORD *)(v8 + 200) = 0;
    *(_DWORD *)(v8 + 160) = 0;
    v15 = *(_DWORD *)(v8 + 172) - 1;
    *(_DWORD *)(v8 + 172) = v15;
    v16 = v9;
    if (!(*(unsigned int (**)(uint64_t))(*(_QWORD *)(v8 + 208) + 24))(v8 + 200)
      || !(*(unsigned int (**)(uint64_t, int *))(*(_QWORD *)(v8 + 208) + 8))(v8 + 200, &v31)
      || !(*(unsigned int (**)(void))(*(_QWORD *)(*a1 + 56) + 8))()
      || !a3(v8 + 200, a4))
    {
      if (!*v13)
        *v13 = 1;
      _newrpclib_xdrrec_endofrecord(v8 + 200, 1);
      return *v13;
    }
    if (!_newrpclib_xdrrec_endofrecord(v8 + 200, v12))
    {
      result = 3;
      goto LABEL_31;
    }
    if (!v12)
      return 0;
    if (v22)
      break;
    *v10 = 1;
    v27 = _newrpclib__null_auth;
    *(_QWORD *)&v28 = qword_255D60578;
    *(_QWORD *)&v29 = 0;
    *((_QWORD *)&v29 + 1) = _newrpclib_xdr_void;
    if (!_newrpclib_xdrrec_skiprecord(v8 + 200))
      return *v13;
    v17 = bswap32(v15);
    while (1)
    {
      if (!_newrpclib_xdr_replymsg((uint64_t (***)(void))(v8 + 200), (uint64_t)&v26))
      {
        result = *v13;
        if ((_DWORD)result)
          return result;
        goto LABEL_17;
      }
      if ((_DWORD)v26 == v17)
        break;
LABEL_17:
      v27 = _newrpclib__null_auth;
      *(_QWORD *)&v28 = qword_255D60578;
      *(_QWORD *)&v29 = 0;
      *((_QWORD *)&v29 + 1) = _newrpclib_xdr_void;
      if (!_newrpclib_xdrrec_skiprecord(v8 + 200))
        return *v13;
    }
    _newrpclib__seterr_reply(&v26, (int *)(v8 + 160));
    if (!*v13)
    {
      if ((*(unsigned int (**)(void))(*(_QWORD *)(*a1 + 56) + 16))())
      {
        if ((!a5 || !((unsigned int (*)(uint64_t, uint64_t))a5)(v8 + 200, a6)) && !*v13)
          *v13 = 2;
      }
      else
      {
        *(_QWORD *)v13 = 0x600000007;
      }
      if (*((_QWORD *)&v27 + 1))
      {
        *v10 = 2;
        _newrpclib_xdr_opaque_auth((uint64_t (***)(void))(v8 + 200), (uint64_t)&v27);
      }
      return *v13;
    }
    if (v14)
    {
      --v14;
      v19 = (*(uint64_t (**)(void))(*(_QWORD *)(*a1 + 56) + 24))();
      v9 = v16;
      if (v19)
        continue;
    }
    return *v13;
  }
  result = 5;
LABEL_31:
  *v13 = result;
  return result;
}

uint64_t clntstrm_geterr(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(result + 16);
  v3 = *(_QWORD *)(v2 + 160);
  *(_DWORD *)(a2 + 8) = *(_DWORD *)(v2 + 168);
  *(_QWORD *)a2 = v3;
  return result;
}

uint64_t clntstrm_freeres(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t), uint64_t a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 16);
  *(_DWORD *)(v3 + 200) = 2;
  return a2(v3 + 200, a3);
}

void clntstrm_destroy(uint64_t a1)
{
  uint64_t v2;
  void (*v3)(uint64_t);

  v2 = *(_QWORD *)(a1 + 16);
  if (*(_DWORD *)(v2 + 4))
    close(*(_DWORD *)v2);
  v3 = *(void (**)(uint64_t))(*(_QWORD *)(v2 + 208) + 56);
  if (v3)
    v3(v2 + 200);
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 24));
  free((void *)v2);
  free((void *)a1);
}

uint64_t clntstrm_control(uint64_t a1, int a2, _OWORD *a3)
{
  uint64_t v3;
  uint64_t result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v3 = *(_QWORD *)(a1 + 16);
  if (a2 == 3)
  {
    v5 = *(_OWORD *)(v3 + 32);
    v6 = *(_OWORD *)(v3 + 48);
    v7 = *(_OWORD *)(v3 + 80);
    a3[2] = *(_OWORD *)(v3 + 64);
    a3[3] = v7;
    *a3 = v5;
    a3[1] = v6;
    v8 = *(_OWORD *)(v3 + 96);
    v9 = *(_OWORD *)(v3 + 112);
    v10 = *(_OWORD *)(v3 + 144);
    a3[6] = *(_OWORD *)(v3 + 128);
    a3[7] = v10;
    a3[4] = v8;
    a3[5] = v9;
    return 1;
  }
  if (a2 == 2)
  {
    *a3 = *(_OWORD *)(v3 + 8);
    return 1;
  }
  if (a2 != 1)
    return 0;
  *(_OWORD *)(v3 + 8) = *a3;
  result = 1;
  *(_DWORD *)(v3 + 24) = 1;
  return result;
}

void OUTLINED_FUNCTION_4_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x22u);
}

_QWORD *_newrpclib_clntudp_bufcreate_timeout(unsigned __int8 *a1, unsigned int a2, unsigned int a3, int *a4, int a5, int a6, _OWORD *a7, __int128 *a8)
{
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v29;
  int v30;
  socklen_t v31[2];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  timeval v37;
  unsigned int v38;

  v36 = 0;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  *(_QWORD *)v31 = 0;
  v16 = calloc(1uLL, 0x58uLL);
  if (!v16)
  {
    *(_DWORD *)_newrpclib___rpc_createerr() = 12;
    v24 = *__error();
    *((_DWORD *)_newrpclib___rpc_createerr() + 2) = v24;
    return v16;
  }
  v17 = (a5 + 3) & 0xFFFFFFFC;
  v18 = (a6 + 3) & 0xFFFFFFFC;
  v38 = (a6 + 3) & 0xFFFFFFFC;
  v19 = (char *)calloc(1uLL, v17 + v18 + 264);
  if (!v19)
  {
    *(_DWORD *)_newrpclib___rpc_createerr() = 12;
    v25 = *__error();
    *((_DWORD *)_newrpclib___rpc_createerr() + 2) = v25;
LABEL_28:
    free(v16);
    return 0;
  }
  v20 = v19;
  *((_QWORD *)v19 + 31) = &v19[v18 + 260];
  if (!*((_WORD *)a1 + 1))
  {
    v37.tv_sec = 0;
    if (a2 == 100000)
    {
      *((_WORD *)a1 + 1) = 28416;
    }
    else if (_newrpclib_socparms2netid(a1[1], 2, 17, (const char **)&v37)
           || !_newrpclib_rpcb_getaddr_timeout(a1, (char *)v37.tv_sec, a2, a3, (uint64_t)a7, a8))
    {
LABEL_27:
      free(v20);
      goto LABEL_28;
    }
  }
  v16[1] = udp_ops;
  v16[2] = v20;
  memcpy(v20 + 8, a1, *a1);
  v21 = v20[8];
  *((_QWORD *)v20 + 18) = 1;
  *((_DWORD *)v20 + 34) = v21;
  *((_DWORD *)v20 + 61) = v17;
  *((_DWORD *)v20 + 64) = v18;
  *((_DWORD *)v20 + 38) = 0;
  if (a7)
    *((_OWORD *)v20 + 9) = *a7;
  *((_QWORD *)v20 + 20) = -1;
  *((_DWORD *)v20 + 42) = -1;
  if (a8)
    *((_OWORD *)v20 + 10) = *a8;
  v22 = open("/dev/random", 0, 0);
  v23 = v22;
  if ((v22 & 0x80000000) == 0 && read(v22, &v32, 4uLL) == 4
    || (v37.tv_sec = 0,
        *(_QWORD *)&v37.tv_usec = 0,
        gettimeofday(&v37, 0),
        LODWORD(v32) = getpid() ^ LODWORD(v37.tv_sec) ^ v37.tv_usec,
        (v23 & 0x80000000) == 0))
  {
    close(v23);
  }
  *(_QWORD *)((char *)&v32 + 4) = 0x200000000;
  HIDWORD(v32) = a2;
  LODWORD(v33) = a3;
  _newrpclib_xdrmem_create((uint64_t)(v20 + 192), *((_QWORD *)v20 + 31), v17, 0);
  if (!_newrpclib_xdr_callhdr((uint64_t (***)(void))v20 + 24, (uint64_t)&v32))
    goto LABEL_27;
  *((_DWORD *)v20 + 60) = (*(uint64_t (**)(char *))(*((_QWORD *)v20 + 25) + 32))(v20 + 192);
  if (*a4 < 0)
  {
    v29 = 1;
    v30 = 1;
    v26 = socket(v20[9], 2, 17);
    *a4 = v26;
    if (v26 < 0)
    {
      *(_DWORD *)_newrpclib___rpc_createerr() = 12;
      v27 = *__error();
      *((_DWORD *)_newrpclib___rpc_createerr() + 2) = v27;
    }
    else
    {
      bindresvport_sa(v26, 0);
      ioctl(*a4, 0x8004667EuLL, &v30);
      setsockopt(*a4, 0xFFFF, 4130, &v29, 4u);
      *((_DWORD *)v20 + 1) = 1;
      v31[0] = 0;
      v31[1] = 4;
      if (!getsockopt(*a4, 0xFFFF, 4098, v31, &v31[1]))
      {
        v31[1] = 4;
        if (v18 <= v31[0] || !setsockopt(*a4, 0xFFFF, 4098, &v38, 4u))
          goto LABEL_17;
      }
      close(*a4);
      *a4 = -1;
    }
    goto LABEL_27;
  }
  *((_DWORD *)v20 + 1) = 0;
LABEL_17:
  *(_DWORD *)v20 = *a4;
  *v16 = _newrpclib_authnone_create();
  return v16;
}

_QWORD *_newrpclib_clntudp_bufcreate(unsigned __int8 *a1, unsigned int a2, unsigned int a3, uint64_t a4, uint64_t a5, int *a6, int a7, int a8)
{
  __int128 v9;

  *(_QWORD *)&v9 = a4;
  *((_QWORD *)&v9 + 1) = a5;
  if (!*a1 && a1[1] == 2)
    *a1 = 16;
  return _newrpclib_clntudp_bufcreate_timeout(a1, a2, a3, a6, a7, a8, &v9, 0);
}

_QWORD *_newrpclib_clntudp_create(unsigned __int8 *a1, unsigned int a2, unsigned int a3, uint64_t a4, uint64_t a5, int *a6)
{
  return _newrpclib_clntudp_bufcreate(a1, a2, a3, a4, a5, a6, 8800, 8800);
}

_QWORD *_newrpclib_clntudp_bufcreate_sa(unsigned __int8 *a1, unsigned int a2, unsigned int a3, uint64_t a4, uint64_t a5, int *a6, int a7, int a8)
{
  __int128 v9;

  *(_QWORD *)&v9 = a4;
  *((_QWORD *)&v9 + 1) = a5;
  return _newrpclib_clntudp_bufcreate_timeout(a1, a2, a3, a6, a7, a8, &v9, 0);
}

_QWORD *_newrpclib_clntudp_create_sa(unsigned __int8 *a1, unsigned int a2, unsigned int a3, uint64_t a4, uint64_t a5, int *a6)
{
  __int128 v7;

  *(_QWORD *)&v7 = a4;
  *((_QWORD *)&v7 + 1) = a5;
  return _newrpclib_clntudp_bufcreate_timeout(a1, a2, a3, a6, 8800, 8800, &v7, 0);
}

uint64_t clntudp_call(uint64_t a1, int a2, unsigned int (*a3)(uint64_t, uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, int a7, int a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  size_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  int v20;
  unint64_t v21;
  int v23;
  uint64_t result;
  int *v26;
  int v27;
  int v30;
  _OWORD v31[3];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  pollfd v37;
  socklen_t v38;
  int v39;
  sockaddr v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;

  v9 = a4;
  v10 = a1;
  v48 = *MEMORY[0x24BDAC8D0];
  v39 = a2;
  v11 = *(_QWORD *)(a1 + 16);
  v12 = *(_QWORD *)(v11 + 160);
  if (v12 == -1)
  {
    v14 = a8 / 1000;
    v13 = 1000 * a7;
  }
  else
  {
    v13 = *(_DWORD *)(v11 + 168) / 1000;
    v14 = 1000 * v12;
  }
  v15 = 0;
  v38 = 0;
  v30 = v13 + v14;
  v37 = 0;
  v40 = (sockaddr)0;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0;
  v26 = (int *)(v11 + 176);
  v27 = 2;
  memset(v31, 0, sizeof(v31));
LABEL_5:
  *(_DWORD *)(v11 + 192) = 0;
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v11 + 200) + 40))(v11 + 192, *(unsigned int *)(v11 + 240));
  ++**(_WORD **)(v11 + 248);
  if (!(*(unsigned int (**)(uint64_t, int *))(*(_QWORD *)(v11 + 200) + 8))(v11 + 192, &v39)
    || !(*(unsigned int (**)(void))(*(_QWORD *)(*(_QWORD *)v10 + 56) + 8))()
    || !a3(v11 + 192, v9))
  {
    result = 1;
LABEL_34:
    *v26 = result;
    return result;
  }
  v16 = (*(int (**)(uint64_t))(*(_QWORD *)(v11 + 200) + 32))(v11 + 192);
  while (1)
  {
    if (sendto(*(_DWORD *)v11, *(const void **)(v11 + 248), v16, 0, (const sockaddr *)(v11 + 8), *(_DWORD *)(v11 + 136)) != v16)
    {
      v23 = *__error();
      result = 3;
      goto LABEL_31;
    }
    if (!v30)
    {
LABEL_33:
      result = 5;
      goto LABEL_34;
    }
    v17 = v10;
    v33 = _newrpclib__null_auth;
    *(_QWORD *)&v34 = qword_255D60578;
    v18 = a6;
    *(_QWORD *)&v35 = a6;
    *((_QWORD *)&v35 + 1) = a5;
    v37.fd = *(_DWORD *)v11;
    *(_DWORD *)&v37.events = 64;
    v19 = *(_DWORD *)(v11 + 152) / 1000 + 1000 * *(_DWORD *)(v11 + 144);
LABEL_12:
    while (1)
    {
      v20 = poll(&v37, 1u, v19);
      if (v20 != -1)
        break;
      if (*__error() != 4)
        goto LABEL_30;
    }
    if (v20)
      break;
    v15 += v19;
    a6 = v18;
    v10 = v17;
    if (v15 >= v30)
      goto LABEL_33;
  }
  do
  {
    v38 = 128;
    v21 = recvfrom(*(_DWORD *)v11, (void *)(v11 + 260), *(unsigned int *)(v11 + 256), 0, &v40, &v38);
    if ((v21 & 0x8000000000000000) == 0)
    {
      if (v21 < 4 || *(_DWORD *)(v11 + 260) != **(_DWORD **)(v11 + 248))
        goto LABEL_12;
      _newrpclib_xdrmem_create((uint64_t)v31, v11 + 260, v21, 1);
      if (!_newrpclib_xdr_replymsg((uint64_t (***)(void))v31, (uint64_t)&v32))
      {
        *v26 = 2;
        return *v26;
      }
      _newrpclib__seterr_reply(&v32, v26);
      if (!*v26)
      {
        if (!(*(unsigned int (**)(void))(*(_QWORD *)(*(_QWORD *)v17 + 56) + 16))())
          *(_QWORD *)v26 = 0x600000007;
        if (*((_QWORD *)&v33 + 1))
        {
          *(_DWORD *)(v11 + 192) = 2;
          _newrpclib_xdr_opaque_auth((uint64_t (***)(void))(v11 + 192), (uint64_t)&v33);
        }
        return *v26;
      }
      v9 = a4;
      if (!v27)
        return *v26;
      a6 = v18;
      v10 = v17;
      --v27;
      if (!(*(unsigned int (**)(void))(*(_QWORD *)(*(_QWORD *)v17 + 56) + 24))())
        return *v26;
      goto LABEL_5;
    }
  }
  while (*__error() == 4);
  if (*__error() == 35)
    goto LABEL_12;
LABEL_30:
  v23 = *__error();
  result = 4;
LABEL_31:
  *(_DWORD *)(v11 + 176) = result;
  *(_DWORD *)(v11 + 180) = v23;
  return result;
}

uint64_t clntudp_geterr(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(result + 16);
  v3 = *(_QWORD *)(v2 + 176);
  *(_DWORD *)(a2 + 8) = *(_DWORD *)(v2 + 184);
  *(_QWORD *)a2 = v3;
  return result;
}

uint64_t clntudp_freeres(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t), uint64_t a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 16);
  *(_DWORD *)(v3 + 192) = 2;
  return a2(v3 + 192, a3);
}

void clntudp_destroy(_QWORD *a1)
{
  uint64_t v2;
  void (*v3)(uint64_t);

  v2 = a1[2];
  if (*(_DWORD *)(v2 + 4))
    close(*(_DWORD *)v2);
  v3 = *(void (**)(uint64_t))(*(_QWORD *)(v2 + 200) + 56);
  if (v3)
    v3(v2 + 192);
  free((void *)v2);
  free(a1);
}

uint64_t clntudp_control(uint64_t a1, int a2, _OWORD *a3)
{
  uint64_t v3;
  uint64_t result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  v3 = *(_QWORD *)(a1 + 16);
  switch(a2)
  {
    case 1:
      *(_OWORD *)(v3 + 160) = *a3;
      goto LABEL_11;
    case 2:
      v5 = *(_OWORD *)(v3 + 160);
      goto LABEL_9;
    case 3:
      v6 = *(_OWORD *)(v3 + 8);
      v7 = *(_OWORD *)(v3 + 24);
      v8 = *(_OWORD *)(v3 + 56);
      a3[2] = *(_OWORD *)(v3 + 40);
      a3[3] = v8;
      *a3 = v6;
      a3[1] = v7;
      v9 = *(_OWORD *)(v3 + 72);
      v10 = *(_OWORD *)(v3 + 88);
      v11 = *(_OWORD *)(v3 + 120);
      a3[6] = *(_OWORD *)(v3 + 104);
      a3[7] = v11;
      a3[4] = v9;
      a3[5] = v10;
      goto LABEL_11;
    case 4:
      *(_OWORD *)(v3 + 144) = *a3;
      goto LABEL_11;
    case 5:
      v5 = *(_OWORD *)(v3 + 144);
      goto LABEL_9;
    case 6:
      v5 = *(_OWORD *)(v3 + 192);
      v12 = *(_OWORD *)(v3 + 224);
      a3[1] = *(_OWORD *)(v3 + 208);
      a3[2] = v12;
LABEL_9:
      *a3 = v5;
      goto LABEL_11;
    case 7:
      *(_DWORD *)a3 = *(_DWORD *)(v3 + 240);
LABEL_11:
      result = 1;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

hostent *_newrpclib_getrpcport(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  hostent *result;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  result = gethostbyname(a1);
  if (result)
  {
    v8[0] = 512;
    v8[1] = 0;
    __memmove_chk();
    return (hostent *)_newrpclib_pmap_getport((uint64_t)v8, a2, a3, a4);
  }
  return result;
}

uint64_t _newrpclib_pmap_getmaps(uint64_t a1)
{
  _QWORD *v2;
  __int128 v4;
  int v5;
  uint64_t v6;

  v6 = 0;
  v5 = -1;
  v4 = xmmword_22D0F9080;
  *(_WORD *)(a1 + 2) = 28416;
  v2 = _newrpclib_clnttcp_create((const sockaddr *)a1, 100000, 2u, &v5, 0x32u, 0x1F4u);
  (*(void (**)(_QWORD *, uint64_t))(v2[1] + 40))(v2, 1);
  if (_newrpclib_pmapproc_dump_2(&v6, (uint64_t)v2))
    _newrpclib_clnt_perror((uint64_t)v2, "pmap_getmaps rpc problem");
  (*(void (**)(_QWORD *))(v2[1] + 32))(v2);
  *(_WORD *)(a1 + 2) = 0;
  return v6;
}

_QWORD *pmap_getport_timeout(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5;
  int v6;
  _QWORD *result;
  _QWORD *v8;
  void (*v9)(_QWORD *, char *);
  char *v10;
  int v11;
  unsigned __int16 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v13 = 0uLL;
  if (a5)
  {
    v5 = *a5;
    a5 = (uint64_t *)a5[1];
  }
  else
  {
    v5 = 5;
  }
  v6 = *(unsigned __int8 *)(a1 + 1);
  if (v6 == 30)
  {
    *(_WORD *)(a1 + 2) = 0;
    cvt6to4(a1, (uint64_t)&v13);
    return 0;
  }
  if (v6 != 2)
    return 0;
  *(_WORD *)(a1 + 2) = 0;
  v13 = *(_OWORD *)a1;
  v12 = 0;
  v11 = -1;
  WORD1(v13) = 28416;
  result = _newrpclib_clntudp_bufcreate((unsigned __int8 *)&v13, 0x186A0u, 2u, v5, (uint64_t)a5, &v11, 400, 400);
  if (result)
  {
    v8 = result;
    if ((*(unsigned int (**)(void))result[1])())
    {
      *(_DWORD *)_newrpclib___rpc_createerr() = 14;
      v9 = *(void (**)(_QWORD *, char *))(v8[1] + 16);
      v10 = (char *)_newrpclib___rpc_createerr();
      v9(v8, v10 + 4);
    }
    else if (!v12)
    {
      *(_DWORD *)_newrpclib___rpc_createerr() = 15;
    }
    (*(void (**)(_QWORD *))(v8[1] + 32))(v8);
    return (_QWORD *)v12;
  }
  return result;
}

_QWORD *_newrpclib_pmap_getport(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return pmap_getport_timeout(a1, a2, a3, a4, 0);
}

_QWORD *_newrpclib_pmap_getport_sa(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return pmap_getport_timeout(a1, a2, a3, a4, 0);
}

uint64_t _newrpclib_pmap_rmtcall(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  int v6;

  v6 = -1;
  *(_WORD *)(a1 + 2) = 28416;
  v2 = _newrpclib_clntudp_create((unsigned __int8 *)a1, 0x186A0u, 2u, 3, 0, &v6);
  if (v2)
  {
    v3 = v2;
    v4 = (*(uint64_t (**)(void))v2[1])();
    (*(void (**)(_QWORD *))(v3[1] + 32))(v3);
  }
  else
  {
    v4 = 16;
  }
  *(_WORD *)(a1 + 2) = 0;
  return v4;
}

uint64_t _newrpclib_xdr_rmtcall_args(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  _DWORD *v6;
  int v7;
  uint64_t v8;

  result = _newrpclib_xdr_u_long((uint64_t (***)(void))a1);
  if ((_DWORD)result)
  {
    result = _newrpclib_xdr_u_long((uint64_t (***)(void))a1);
    if ((_DWORD)result)
    {
      result = _newrpclib_xdr_u_long((uint64_t (***)(void))a1);
      if ((_DWORD)result)
      {
        v5 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a1 + 8) + 32))(a1);
        v6 = (_DWORD *)(a2 + 12);
        result = _newrpclib_xdr_u_long((uint64_t (***)(void))a1);
        if ((_DWORD)result)
        {
          v7 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a1 + 8) + 32))(a1);
          result = (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 24))(a1, *(_QWORD *)(a2 + 16));
          if ((_DWORD)result)
          {
            v8 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a1 + 8) + 32))(a1);
            *v6 = v8 - v7;
            (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 + 8) + 40))(a1, v5);
            result = _newrpclib_xdr_u_long((uint64_t (***)(void))a1);
            if ((_DWORD)result)
            {
              (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 + 8) + 40))(a1, v8);
              return 1;
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t _newrpclib_xdr_rmtcallres(uint64_t (***a1)(void), uint64_t a2)
{
  uint64_t result;
  void *v5;

  v5 = *(void **)a2;
  result = _newrpclib_xdr_reference(a1, &v5, 4uLL, (uint64_t (*)(_DWORD *, void *, size_t))_newrpclib_xdr_u_long);
  if ((_DWORD)result)
  {
    result = _newrpclib_xdr_u_long(a1);
    if ((_DWORD)result)
    {
      *(_QWORD *)a2 = v5;
      return (*(uint64_t (**)(uint64_t (***)(void), _QWORD))(a2 + 24))(a1, *(_QWORD *)(a2 + 16));
    }
  }
  return result;
}

uint64_t _newrpclib_pmap_wakeup()
{
  int v0;
  int v1;
  uint64_t v2;
  char v4;
  sockaddr v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[26];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = 0;
  v5 = (sockaddr)0;
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  memset(v10, 0, sizeof(v10));
  v5.sa_family = 1;
  __strlcpy_chk();
  v0 = socket(1, 1, 0);
  if (v0 == -1)
    return 0xFFFFFFFFLL;
  v1 = v0;
  if (connect(v0, &v5, 0x6Au) == -1)
  {
    v2 = 0xFFFFFFFFLL;
  }
  else
  {
    read(v1, &v4, 1uLL);
    v2 = 0;
  }
  close(v1);
  return v2;
}

uint64_t _newrpclib_rpcb_callit()
{
  int v0;
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
  unsigned int v11;
  unsigned int v12;
  int v13;
  int v14;
  int v15;
  __int128 *v16;
  int *v17;
  uint64_t v18;
  uint64_t v20;
  int v21;
  _QWORD v22[4];
  _DWORD v23[2200];
  int v24[350];
  uint64_t v25;

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = v0;
  v25 = *MEMORY[0x24BDAC8D0];
  v16 = _newrpclib_authunix_create_default();
  bzero(v24, 0x578uLL);
  bzero(v23, 0x2260uLL);
  v21 = 0;
  v22[0] = v6;
  v22[1] = 0;
  v22[2] = v4;
  v22[3] = v2;
  v17 = (int *)reply_addr_cache_create(0);
  if (build_callit_rpc(v15, v14, v12, 3, v10, v8, (uint64_t)v24, v16, &v21))
  {
LABEL_2:
    v18 = 1;
    goto LABEL_3;
  }
  v20 = _newrpclib_clnt_multicasts_buf_timeout((uint64_t)&rpcb_addrs, 2uLL, (unsigned int (*)(uint64_t, timeval *, _DWORD *, unint64_t))rpcb_mcastrecv, (uint64_t)v22, v24, v21, v23, 0x2260uLL, v17, 2u, 0xAu, 2);
  if ((_DWORD)v20 == 5 || (v18 = v20, !(_DWORD)v20))
  {
    if (!build_callit_rpc(v15, v14, v12, 2, v10, v8, (uint64_t)v24, v16, &v21))
    {
      v18 = _newrpclib_clnt_multicasts_buf_timeout((uint64_t)&pmap_addrs, 1uLL, (unsigned int (*)(uint64_t, timeval *, _DWORD *, unint64_t))pmap_mcastrecv, (uint64_t)v22, v24, v21, v23, 0x2260uLL, v17, 2u, 0xAu, 2);
      goto LABEL_3;
    }
    goto LABEL_2;
  }
LABEL_3:
  (*(void (**)(__int128 *))(*((_QWORD *)v16 + 7) + 32))(v16);
  reply_addr_cache_destroy((void **)v17);
  return v18;
}

uint64_t build_callit_rpc(int a1, int a2, unsigned int a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, __int128 *a8, _DWORD *a9)
{
  uint64_t v9;
  void (*v10)(_OWORD *);
  _DWORD v12[2];
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _OWORD v16[3];
  _QWORD v17[2];
  int v18;
  int v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;

  memset(v16, 0, sizeof(v16));
  v17[0] = 0;
  v17[1] = 0x186A000000002;
  v18 = a4;
  v19 = 5;
  v20 = *a8;
  v21 = *((_QWORD *)a8 + 2);
  v22 = *(__int128 *)((char *)a8 + 24);
  v23 = *((_QWORD *)a8 + 5);
  v12[0] = a1;
  v12[1] = a2;
  v14 = a6;
  v13 = a3;
  v15 = a5;
  *a9 = 0;
  _newrpclib_xdrmem_create((uint64_t)v16, a7, 1400, 0);
  if (_newrpclib_xdr_callmsg((uint64_t)v16, (uint64_t)v17)
    && xdr_callit_args((uint64_t (***)(void))v16, (uint64_t)v12))
  {
    v9 = 0;
    *a9 = (*(uint64_t (**)(_OWORD *))(*((_QWORD *)&v16[0] + 1) + 32))(v16);
    v10 = *(void (**)(_OWORD *))(*((_QWORD *)&v16[0] + 1) + 56);
    if (!v10)
      return v9;
    goto LABEL_6;
  }
  v10 = *(void (**)(_OWORD *))(*((_QWORD *)&v16[0] + 1) + 56);
  v9 = 1;
  if (v10)
LABEL_6:
    v10(v16);
  return v9;
}

uint64_t rpcb_mcastrecv(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v8;
  void *v9;
  void (*v10)(_OWORD *);
  unsigned int v12;
  const char *v13;
  _OWORD v14[3];
  void *v15[4];
  _OWORD v16[2];
  __int128 v17;
  void **v18;
  uint64_t (*v19)(uint64_t (***)(void), uint64_t);
  uint64_t v20;
  char *v21;
  _DWORD v22[34];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  memset(v14, 0, sizeof(v14));
  v13 = 0;
  if (_newrpclib_socparms2netid(*(unsigned __int8 *)(a2 + 1), 2, 17, &v13))
    return 0;
  v16[0] = 0u;
  v16[1] = _newrpclib__null_auth;
  v17 = (unint64_t)qword_255D60578;
  v20 = 0;
  v18 = v15;
  v19 = xdr_rmt3callres;
  v15[0] = 0;
  v15[1] = 0;
  v9 = *(void **)a1;
  v15[2] = *(void **)(a1 + 16);
  v15[3] = v9;
  _newrpclib_xdrmem_create((uint64_t)v14, a3, a4, 1);
  if (!_newrpclib_xdr_replymsg((uint64_t (***)(void))v14, (uint64_t)v16) || DWORD2(v16[0]) | DWORD2(v17))
  {
    v8 = 0;
    goto LABEL_8;
  }
  v21 = (char *)v15[0];
  memset(v22, 0, 128);
  LOBYTE(v22[0]) = 0x80;
  if (!_newrpclib_uaddr2sa((const char *)v15[0], "udp", (unsigned __int8 *)v22))
  {
    if (BYTE1(v22[0]) == 2)
    {
      v12 = v22[1];
      if (v22[1] >> 28 == 14)
        goto LABEL_21;
    }
    else
    {
      if (BYTE1(v22[0]) == 30)
      {
        if (LOBYTE(v22[2]) != 255)
          goto LABEL_6;
LABEL_21:
        *(_WORD *)(a2 + 2) = HIWORD(v22[0]);
        if (!_newrpclib_sa2uaddr((char *)a2, &v21))
        {
          free(v15[0]);
          v15[0] = v21;
        }
        goto LABEL_6;
      }
      v12 = v22[1];
    }
    if (BYTE1(v22[0]) != 2 || HIBYTE(v12) != 255)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_6:
  v8 = (*(uint64_t (**)(_QWORD, const char *, void *))(a1 + 24))(*(_QWORD *)(a1 + 16), v13, v15[0]);
LABEL_8:
  v10 = *(void (**)(_OWORD *))(*((_QWORD *)&v14[0] + 1) + 56);
  if (v10)
    v10(v14);
  _newrpclib_xdr_free((uint64_t (*)(_OWORD *))_newrpclib_xdr_replymsg);
  return v8;
}

uint64_t pmap_mcastrecv(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v8;
  uint64_t v9;
  void (*v10)(_OWORD *);
  const char *v12;
  void *v13;
  _OWORD v14[3];
  _QWORD v15[3];
  _OWORD v16[2];
  __int128 v17;
  _QWORD *v18;
  uint64_t (*v19)(uint64_t (***)(void), uint64_t);
  uint64_t v20;

  memset(v14, 0, sizeof(v14));
  v12 = 0;
  v13 = 0;
  if (_newrpclib_socparms2netid(*(unsigned __int8 *)(a2 + 1), 2, 17, &v12))
    return 0;
  v16[0] = 0u;
  v16[1] = _newrpclib__null_auth;
  v17 = (unint64_t)qword_255D60578;
  v20 = 0;
  v18 = v15;
  v19 = xdr_pmapcallres;
  v9 = *(_QWORD *)(a1 + 16);
  v15[0] = 0;
  v15[1] = v9;
  v15[2] = *(_QWORD *)a1;
  _newrpclib_xdrmem_create((uint64_t)v14, a3, a4, 1);
  if (!_newrpclib_xdr_replymsg((uint64_t (***)(void))v14, (uint64_t)v16)
    || DWORD2(v16[0]) | DWORD2(v17)
    || (*(_WORD *)(a2 + 2) = bswap32(LOWORD(v15[0])) >> 16, _newrpclib_sa2uaddr((char *)a2, (char **)&v13)))
  {
    v8 = 0;
  }
  else
  {
    v8 = (*(uint64_t (**)(_QWORD, const char *, void *))(a1 + 24))(*(_QWORD *)(a1 + 16), v12, v13);
    free(v13);
  }
  v10 = *(void (**)(_OWORD *))(*((_QWORD *)&v14[0] + 1) + 56);
  if (v10)
    v10(v14);
  _newrpclib_xdr_free((uint64_t (*)(_OWORD *))_newrpclib_xdr_replymsg);
  return v8;
}

uint64_t _newrpclib_pmap_callit()
{
  int v0;
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
  unsigned int v11;
  unsigned int v12;
  int v13;
  int v14;
  int v15;
  __int128 *v16;
  int *v17;
  uint64_t v18;
  int v20;
  _QWORD v21[3];
  _DWORD v22[2200];
  int v23[350];
  uint64_t v24;

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = v0;
  v24 = *MEMORY[0x24BDAC8D0];
  v16 = _newrpclib_authunix_create_default();
  bzero(v23, 0x578uLL);
  bzero(v22, 0x2260uLL);
  v20 = 0;
  v17 = (int *)reply_addr_cache_create(0);
  v21[0] = v6;
  v21[1] = v4;
  v21[2] = v2;
  if (build_callit_rpc(v15, v14, v12, 2, v10, v8, (uint64_t)v23, v16, &v20))
    v18 = 1;
  else
    v18 = _newrpclib_clnt_multicasts_buf_timeout((uint64_t)&pmap_addrs, 1uLL, (unsigned int (*)(uint64_t, timeval *, _DWORD *, unint64_t))pmap_bcastrecv, (uint64_t)v21, v23, v20, v22, 0x2260uLL, v17, 2u, 0xAu, 2);
  (*(void (**)(__int128 *))(*((_QWORD *)v16 + 7) + 32))(v16);
  reply_addr_cache_destroy((void **)v17);
  return v18;
}

uint64_t pmap_bcastrecv(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v6;
  void (*v7)(_OWORD *);
  _OWORD v9[3];
  uint64_t v10;
  int8x16_t v11;
  _OWORD v12[2];
  __int128 v13;
  uint64_t *v14;
  uint64_t (*v15)(uint64_t (***)(void), uint64_t);
  uint64_t v16;

  memset(v9, 0, sizeof(v9));
  v12[0] = 0u;
  v12[1] = _newrpclib__null_auth;
  v13 = (unint64_t)qword_255D60578;
  v14 = &v10;
  v15 = xdr_pmapcallres;
  v16 = 0;
  v10 = 0;
  v11 = vextq_s8(*(int8x16_t *)a1, *(int8x16_t *)a1, 8uLL);
  _newrpclib_xdrmem_create((uint64_t)v9, a3, a4, 1);
  if (!_newrpclib_xdr_replymsg((uint64_t (***)(void))v9, (uint64_t)v12) || DWORD2(v12[0]) | DWORD2(v13))
  {
    v6 = 0;
  }
  else
  {
    *(_WORD *)(a2 + 2) = bswap32((unsigned __int16)v10) >> 16;
    v6 = (*(uint64_t (**)(_QWORD, uint64_t))(a1 + 16))(*(_QWORD *)(a1 + 8), a2);
  }
  v7 = *(void (**)(_OWORD *))(*((_QWORD *)&v9[0] + 1) + 56);
  if (v7)
    v7(v9);
  _newrpclib_xdr_free((uint64_t (*)(_OWORD *))_newrpclib_xdr_replymsg);
  return v6;
}

uint64_t _newrpclib_rpcb_indirect(char *a1, char *__s2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, __int128 *a10, _QWORD *a11)
{
  _QWORD *timeout;
  _QWORD *v12;
  uint64_t v13;

  timeout = _newrpclib_clnt_create_timeout(a1, 100000, 4u, __s2, a10);
  if (!timeout)
    return 16;
  v12 = timeout;
  v13 = (*(uint64_t (**)(void))timeout[1])();
  *a11 = 0;
  (*(void (**)(_QWORD *))(v12[1] + 32))(v12);
  return v13;
}

uint64_t xdr_callit_args(uint64_t (***a1)(void), uint64_t a2)
{
  uint64_t result;

  result = _newrpclib_xdr_u_long(a1);
  if ((_DWORD)result)
  {
    result = _newrpclib_xdr_u_long(a1);
    if ((_DWORD)result)
    {
      result = _newrpclib_xdr_u_long(a1);
      if ((_DWORD)result)
      {
        *(_DWORD *)(a2 + 12) = _newrpclib_xdr_sizeof(*(uint64_t (**)(_QWORD *))(a2 + 24));
        result = _newrpclib_xdr_u_long(a1);
        if ((_DWORD)result)
          return (*(unsigned int (**)(uint64_t (***)(void), _QWORD))(a2 + 24))(a1, *(_QWORD *)(a2 + 16)) != 0;
      }
    }
  }
  return result;
}

uint64_t xdr_rmt3callres(uint64_t (***a1)(void), uint64_t a2)
{
  if (_newrpclib_xdr_wrapstring(a1, (char **)a2)
    && _newrpclib_xdr_uint32_t(a1, (int *)(a2 + 8)))
  {
    return (*(uint64_t (**)(uint64_t (***)(void), _QWORD))(a2 + 24))(a1, *(_QWORD *)(a2 + 16));
  }
  else
  {
    return 0;
  }
}

uint64_t _newrpclib_pmap_indirect(char *a1, char *__s2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, __int128 *a10, _DWORD *a11)
{
  _QWORD *timeout;
  _QWORD *v12;
  uint64_t v13;

  timeout = _newrpclib_clnt_create_timeout(a1, 100000, 2u, __s2, a10);
  if (!timeout)
    return 16;
  v12 = timeout;
  v13 = (*(uint64_t (**)(void))timeout[1])();
  *a11 = 0;
  (*(void (**)(_QWORD *))(v12[1] + 32))(v12);
  return v13;
}

uint64_t xdr_pmapcallres(uint64_t (***a1)(void), uint64_t a2)
{
  if (_newrpclib_xdr_uint32_t(a1, (int *)a2)
    && _newrpclib_xdr_uint32_t(a1, (int *)(a2 + 4)))
  {
    return (*(uint64_t (**)(uint64_t (***)(void), _QWORD))(a2 + 16))(a1, *(_QWORD *)(a2 + 8));
  }
  else
  {
    return 0;
  }
}

uint64_t _newrpclib_xdr_callmsg(uint64_t a1, uint64_t a2)
{
  int v4;
  unsigned int *v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  const void *v10;
  size_t v11;
  uint64_t result;
  unsigned int v13;
  unsigned int v14;
  _DWORD *v15;
  unsigned int v16;
  _DWORD *v17;
  size_t v18;
  size_t v19;
  void *v20;
  const void *v21;
  unsigned int *v22;
  unsigned int v23;
  uint64_t v24;
  const void *v25;

  v4 = *(_DWORD *)a1;
  if (!*(_DWORD *)a1)
  {
    v13 = *(_DWORD *)(a2 + 40);
    if (v13 > 0x190)
      return 0;
    v14 = *(_DWORD *)(a2 + 64);
    if (v14 > 0x190)
      return 0;
    v15 = (_DWORD *)(*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(a1 + 8) + 48))(a1, ((v13 + 3) & 0xFFFFFFFC) + ((v14 + 3) & 0xFFFFFFFC) + 40);
    if (v15)
    {
      v16 = *(_DWORD *)(a2 + 4);
      *v15 = bswap32(*(_DWORD *)a2);
      v15[1] = bswap32(v16);
      if (v16)
        return 0;
      v15[2] = bswap32(*(_DWORD *)(a2 + 8));
      if (*(_DWORD *)(a2 + 8) != 2)
        return 0;
      v15[3] = bswap32(*(_DWORD *)(a2 + 12));
      v15[4] = bswap32(*(_DWORD *)(a2 + 16));
      v15[5] = bswap32(*(_DWORD *)(a2 + 20));
      v15[6] = bswap32(*(_DWORD *)(a2 + 24));
      v17 = v15 + 8;
      v15[7] = bswap32(*(_DWORD *)(a2 + 40));
      v18 = *(unsigned int *)(a2 + 40);
      if ((_DWORD)v18)
      {
        memmove(v15 + 8, *(const void **)(a2 + 32), v18);
        v17 = (_DWORD *)((char *)v17 + ((*(_DWORD *)(a2 + 40) + 3) & 0xFFFFFFFC));
      }
      *v17 = bswap32(*(_DWORD *)(a2 + 48));
      v17[1] = bswap32(*(_DWORD *)(a2 + 64));
      v19 = *(unsigned int *)(a2 + 64);
      if ((_DWORD)v19)
      {
        v20 = v17 + 2;
        v21 = *(const void **)(a2 + 56);
LABEL_46:
        memmove(v20, v21, v19);
      }
      return 1;
    }
    v4 = *(_DWORD *)a1;
  }
  if (v4 == 1
    && (v5 = (unsigned int *)(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 + 8) + 48))(a1, 32)) != 0)
  {
    *(_DWORD *)a2 = bswap32(*v5);
    v6 = v5[1];
    *(_DWORD *)(a2 + 4) = bswap32(v6);
    if (v6)
      return 0;
    v7 = v5[2];
    *(_DWORD *)(a2 + 8) = bswap32(v7);
    if (v7 != 0x2000000)
      return 0;
    *(_DWORD *)(a2 + 12) = bswap32(v5[3]);
    *(_DWORD *)(a2 + 16) = bswap32(v5[4]);
    *(_DWORD *)(a2 + 20) = bswap32(v5[5]);
    *(_DWORD *)(a2 + 24) = bswap32(v5[6]);
    v8 = v5[7];
    v9 = bswap32(v8);
    *(_DWORD *)(a2 + 40) = v9;
    if (v8)
    {
      if (v9 > 0x190)
        return 0;
      if (!*(_QWORD *)(a2 + 32))
      {
        *(_QWORD *)(a2 + 32) = calloc(1uLL, (v9 + 3) & 0xFFFFFFFC);
        v9 = *(_DWORD *)(a2 + 40);
      }
      v10 = (const void *)(*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(a1 + 8) + 48))(a1, (v9 + 3) & 0xFFFFFFFC);
      v11 = *(unsigned int *)(a2 + 40);
      if (v10)
      {
        memmove(*(void **)(a2 + 32), v10, v11);
      }
      else
      {
        result = _newrpclib_xdr_opaque((int *)a1, *(_QWORD *)(a2 + 32), v11);
        if (!(_DWORD)result)
          return result;
      }
    }
    v22 = (unsigned int *)(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 + 8) + 48))(a1, 8);
    if (v22)
    {
      *(_DWORD *)(a2 + 48) = bswap32(*v22);
      v23 = bswap32(v22[1]);
      *(_DWORD *)(a2 + 64) = v23;
      if (!v23)
        return 1;
      goto LABEL_35;
    }
    result = _newrpclib_xdr_enum(a1, a2 + 48);
    if ((_DWORD)result)
    {
      result = _newrpclib_xdr_u_int((uint64_t (***)(void))a1, (int *)(a2 + 64));
      if ((_DWORD)result)
      {
        v23 = *(_DWORD *)(a2 + 64);
        if (!v23)
          return 1;
LABEL_35:
        if (v23 > 0x190)
          return 0;
        if (!*(_QWORD *)(a2 + 56))
        {
          *(_QWORD *)(a2 + 56) = calloc(1uLL, (v23 + 3) & 0xFFFFFFFC);
          v23 = *(_DWORD *)(a2 + 64);
        }
        v24 = (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(a1 + 8) + 48))(a1, (v23 + 3) & 0xFFFFFFFC);
        v19 = *(unsigned int *)(a2 + 64);
        if (v24)
        {
          v25 = (const void *)v24;
          v20 = *(void **)(a2 + 56);
          v21 = v25;
          goto LABEL_46;
        }
        result = _newrpclib_xdr_opaque((int *)a1, *(_QWORD *)(a2 + 56), v19);
        if (!(_DWORD)result)
          return result;
        return 1;
      }
    }
  }
  else
  {
    result = _newrpclib_xdr_u_long((uint64_t (***)(void))a1);
    if ((_DWORD)result)
    {
      result = _newrpclib_xdr_enum(a1, a2 + 4);
      if ((_DWORD)result)
      {
        if (*(_DWORD *)(a2 + 4))
          return 0;
        result = _newrpclib_xdr_u_long((uint64_t (***)(void))a1);
        if (!(_DWORD)result)
          return result;
        if (*(_DWORD *)(a2 + 8) != 2)
          return 0;
        result = _newrpclib_xdr_u_long((uint64_t (***)(void))a1);
        if ((_DWORD)result)
        {
          result = _newrpclib_xdr_u_long((uint64_t (***)(void))a1);
          if ((_DWORD)result)
          {
            result = _newrpclib_xdr_u_long((uint64_t (***)(void))a1);
            if ((_DWORD)result)
            {
              result = _newrpclib_xdr_opaque_auth((uint64_t (***)(void))a1, a2 + 24);
              if ((_DWORD)result)
                return _newrpclib_xdr_opaque_auth((uint64_t (***)(void))a1, a2 + 48);
            }
          }
        }
      }
    }
  }
  return result;
}

BOOL _newrpclib_rpc_control(int a1, char *__s2)
{
  int v2;
  _BOOL8 result;
  int v5;
  unsigned int v6;
  char *v7;
  int *v8;
  int v9;
  char *v10;
  char *v11;
  int v12;
  int v13;
  int v14;

  v2 = (int)__s2;
  switch(a1)
  {
    case 1:
      if (((_DWORD)__s2 - 2049) < 0xFFFFF800)
        return 0;
      svc_min_threads = (int)__s2;
      if (svc_max_threads < __s2)
        svc_max_threads = (int)__s2;
      return 1;
    case 2:
      v5 = svc_min_threads;
      goto LABEL_43;
    case 3:
      if ((int)__s2 >= 2048)
        v6 = 2048;
      else
        v6 = __s2;
      svc_max_threads = v6;
      if (v6 < svc_min_threads)
        svc_min_threads = v6;
      return 1;
    case 4:
      v5 = svc_max_threads;
      goto LABEL_43;
    case 5:
      if (geteuid())
        return 0;
      if (v2)
      {
        pthread_setugid_np(0xFFFFFF9B, 0xFFFFFF9B);
        result = 1;
        svc_cred_switch = 1;
        return result;
      }
      svc_cred_switch = 0;
      return 1;
    case 6:
      v5 = svc_cred_switch;
      goto LABEL_43;
    case 7:
      if (__s2 > 0x8000)
        return 0;
      svc_listen_backlog = (int)__s2;
      return 1;
    case 8:
      v5 = svc_listen_backlog;
      goto LABEL_43;
    case 9:
      svc_nreq = (int)__s2;
      return 1;
    case 10:
      v5 = svc_nreq;
      goto LABEL_43;
    case 11:
      svc_stack_size = (uint64_t)__s2;
      return 1;
    case 12:
      v7 = (char *)svc_stack_size;
      goto LABEL_35;
    case 13:
      _newrpclib_rpc_ipmode = (int)__s2;
      return 1;
    case 14:
      v8 = &_newrpclib_rpc_ipmode;
      goto LABEL_29;
    case 15:
      _newrpclib_rpc_v4mapped_ok = __s2 != 0;
      return 1;
    case 16:
      v8 = &_newrpclib_rpc_v4mapped_ok;
LABEL_29:
      v5 = *v8;
      goto LABEL_43;
    case 17:
      v14 = 0;
      v12 = 0;
      v13 = 0;
      v11 = 0;
      if (__s2)
      {
        v9 = _newrpclib_netid2socparms(__s2, &v14, &v13, &v12, 0);
        result = 0;
        if (v9)
          return result;
        if (_newrpclib_socparms2netid(v14, v13, v12, (const char **)&v11))
          return 0;
        v10 = v11;
      }
      else
      {
        v10 = 0;
      }
      portmap_netid = v10;
      return 1;
    case 18:
      v7 = portmap_netid;
LABEL_35:
      *(_QWORD *)__s2 = v7;
      return 1;
    case 19:
      result = 0;
      if (__s2 > 0x21 || ((1 << (char)__s2) & 0x202220201) == 0)
        return result;
      svc_thread_qos_class = (int)__s2;
      return 1;
    case 20:
      v5 = svc_thread_qos_class;
      goto LABEL_43;
    case 21:
      if (((_DWORD)__s2 - 1) < 0xFFFFFFF0)
        return 0;
      svc_thread_relative_priority = (int)__s2;
      return 1;
    case 22:
      v5 = svc_thread_relative_priority;
LABEL_43:
      *(_DWORD *)__s2 = v5;
      return 1;
    default:
      result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (!result)
        return result;
      _newrpclib_rpc_control_cold_1(a1);
      return 0;
  }
}

uint64_t _newrpclib_xdr_opaque_auth(uint64_t (***a1)(void), uint64_t a2)
{
  uint64_t result;

  result = _newrpclib_xdr_enum();
  if ((_DWORD)result)
    return _newrpclib_xdr_bytes(a1, (void **)(a2 + 8), (int *)(a2 + 16), 0x190u);
  return result;
}

uint64_t _newrpclib_xdr_des_block(int *a1, uint64_t a2)
{
  return _newrpclib_xdr_opaque(a1, a2, 8);
}

uint64_t _newrpclib_xdr_replymsg(uint64_t (***a1)(void), uint64_t a2)
{
  if (_newrpclib_xdr_u_long(a1)
    && _newrpclib_xdr_enum(a1, a2 + 4)
    && *(_DWORD *)(a2 + 4) == 1)
  {
    return _newrpclib_xdr_union(a1, (_DWORD *)(a2 + 8), a2 + 16, (uint64_t)&reply_dscrm, 0);
  }
  else
  {
    return 0;
  }
}

uint64_t _newrpclib_xdr_callhdr(uint64_t (***a1)(void), uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(a2 + 4) = 0x200000000;
  v2 = a2 + 4;
  if (!*(_DWORD *)a1
    && _newrpclib_xdr_u_long(a1)
    && _newrpclib_xdr_enum(a1, v2)
    && _newrpclib_xdr_u_long(a1)
    && _newrpclib_xdr_u_long(a1))
  {
    return _newrpclib_xdr_u_long(a1);
  }
  else
  {
    return 0;
  }
}

_DWORD *_newrpclib__seterr_reply(_DWORD *result, int *a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;

  v2 = result[2];
  if (v2 == 1)
  {
    v4 = result[4];
    if (v4)
    {
      if (v4 == 1)
      {
        *a2 = 7;
        v5 = result[5];
LABEL_9:
        a2[1] = v5;
        return result;
      }
      *(_QWORD *)a2 = 0x100000010;
    }
    else
    {
      *a2 = 6;
      a2[1] = result[5];
      v4 = result[6];
    }
LABEL_15:
    a2[2] = v4;
    return result;
  }
  if (v2)
  {
    *a2 = 16;
    v5 = result[2];
    goto LABEL_9;
  }
  v3 = result[10];
  switch(v3)
  {
    case 0:
      *a2 = 0;
      return result;
    case 1:
      v6 = 8;
      goto LABEL_19;
    case 2:
      *a2 = 9;
      a2[1] = result[12];
      v4 = result[13];
      goto LABEL_15;
    case 3:
      v6 = 10;
      goto LABEL_19;
    case 4:
      v6 = 11;
      goto LABEL_19;
    case 5:
      v6 = 12;
LABEL_19:
      *a2 = v6;
      break;
    default:
      *(_QWORD *)a2 = 16;
      a2[2] = v3;
      break;
  }
  return result;
}

uint64_t xdr_accepted_reply(uint64_t (***a1)(void), uint64_t a2)
{
  uint64_t result;
  int v5;

  result = _newrpclib_xdr_opaque_auth(a1, a2);
  if ((_DWORD)result)
  {
    result = _newrpclib_xdr_enum(a1, a2 + 24);
    if ((_DWORD)result)
    {
      v5 = *(_DWORD *)(a2 + 24);
      if (v5 == 2)
      {
        result = _newrpclib_xdr_u_long(a1);
        if ((_DWORD)result)
          return _newrpclib_xdr_u_long(a1);
      }
      else if (v5)
      {
        return 1;
      }
      else
      {
        return (*(uint64_t (**)(uint64_t (***)(void), _QWORD))(a2 + 40))(a1, *(_QWORD *)(a2 + 32));
      }
    }
  }
  return result;
}

uint64_t xdr_rejected_reply(uint64_t (***a1)(void), _DWORD *a2)
{
  if (!_newrpclib_xdr_enum(a1, a2))
    return 0;
  if (*a2 != 1)
  {
    if (!*a2 && _newrpclib_xdr_u_long(a1))
      return _newrpclib_xdr_u_long(a1);
    return 0;
  }
  return _newrpclib_xdr_enum(a1, a2 + 1);
}

uint64_t _svcauth_unix(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned int *v5;
  size_t v6;
  unsigned int *v7;
  uint64_t v8;
  unsigned int v9;
  int v10;
  unsigned int *v11;
  _DWORD *v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  void (*v16)(_OWORD *);
  _OWORD v18[3];

  memset(v18, 0, sizeof(v18));
  v3 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(v3 + 8) = v3 + 40;
  *(_QWORD *)(v3 + 32) = v3 + 296;
  v4 = *(unsigned int *)(a2 + 40);
  _newrpclib_xdrmem_create((uint64_t)v18, *(_QWORD *)(a2 + 32), v4, 1);
  v5 = (unsigned int *)(*(uint64_t (**)(_OWORD *, uint64_t))(*((_QWORD *)&v18[0] + 1) + 48))(v18, v4);
  if (v5)
  {
    *(_DWORD *)v3 = bswap32(*v5);
    v6 = bswap32(v5[1]);
    if (v6 > 0xFF)
      goto LABEL_14;
    v7 = v5 + 2;
    memmove(*(void **)(v3 + 8), v5 + 2, v6);
    *(_BYTE *)(*(_QWORD *)(v3 + 8) + v6) = 0;
    v8 = ((_DWORD)v6 + 3) & 0xFFFFFFFC;
    *(_DWORD *)(v3 + 16) = bswap32(*(unsigned int *)((char *)v7 + v8));
    *(_DWORD *)(v3 + 20) = bswap32(*(unsigned int *)((char *)v7 + v8 + 4));
    v9 = *(unsigned int *)((char *)v7 + v8 + 8);
    v10 = bswap32(v9);
    if (v10 > 0x10)
      goto LABEL_14;
    *(_DWORD *)(v3 + 24) = v10;
    if (v9)
    {
      v11 = (unsigned int *)((char *)v7 + v8 + 12);
      v12 = *(_DWORD **)(v3 + 32);
      if (v10 <= 1)
        v13 = 1;
      else
        v13 = v10;
      do
      {
        v14 = *v11++;
        *v12++ = bswap32(v14);
        --v13;
      }
      while (v13);
    }
    if ((int)v8 + 4 * v10 + 20 > v4)
      goto LABEL_14;
LABEL_12:
    v15 = 0;
    *(_DWORD *)(a1 + 720) = 0;
    *(_DWORD *)(a1 + 736) = 0;
    goto LABEL_15;
  }
  if (_newrpclib_xdr_authunix_parms((uint64_t (***)(void))v18, v3))
    goto LABEL_12;
  *(_QWORD *)(v3 + 8) = 0;
  LODWORD(v18[0]) = 2;
  _newrpclib_xdr_authunix_parms((uint64_t (***)(void))v18, v3);
LABEL_14:
  v15 = 1;
LABEL_15:
  v16 = *(void (**)(_OWORD *))(*((_QWORD *)&v18[0] + 1) + 56);
  if (v16)
    v16(v18);
  return v15;
}

uint64_t _svcauth_short()
{
  return 2;
}

uint64_t _newrpclib__authenticate(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v6;
  uid_t v7;
  gid_t v8;
  gid_t v9;
  gid_t v11[2];

  v2 = *(_QWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v2;
  *(_DWORD *)(a1 + 720) = _newrpclib__null_auth;
  *(_DWORD *)(a1 + 736) = 0;
  v3 = *(unsigned int *)(a1 + 16);
  if (v3 > 2)
    return 2;
  result = svcauthsw[v3]();
  if ((_DWORD)result)
    return result;
  if (!svc_cred_switch)
    return 0;
  *(_QWORD *)v11 = 0;
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(_DWORD *)(v6 + 16);
  v8 = *(_DWORD *)(v6 + 20);
  if (pthread_getugid_np(&v11[1], v11))
  {
    if (*__error() != 3)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        _newrpclib__authenticate_cold_3();
      return 7;
    }
    v11[1] = geteuid();
    v9 = getegid();
    v11[0] = v9;
  }
  else
  {
    v9 = v11[0];
  }
  if (!v7)
  {
    v7 = -2;
    v8 = -2;
  }
  if (v11[1] == v7 && v9 == v8)
    return 0;
  if (v11[1])
    pthread_setugid_np(0xFFFFFF9B, 0xFFFFFF9B);
  if (!pthread_setugid_np(v7, v8))
    return 0;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    _newrpclib__authenticate_cold_2();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    _newrpclib__authenticate_cold_1();
  return 7;
}

uint64_t _svcauth_null(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(v1 + 32) = 0;
  *(_OWORD *)v1 = 0u;
  *(_OWORD *)(v1 + 16) = 0u;
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) = 0x100000001;
  return 0;
}

char *_newrpclib_svcraw_create()
{
  _DWORD *v0;
  char *v1;

  v0 = calloc(1uLL, 0x22E0uLL);
  if (!v0)
    return 0;
  v1 = (char *)(v0 + 2200);
  v0[2200] = 0;
  *((_WORD *)v0 + 4402) = 0;
  *((_QWORD *)v0 + 1101) = server_ops;
  _newrpclib_xdrmem_create((uint64_t)(v0 + 2220), (uint64_t)v0, 8800, 2);
  return v1;
}

uint64_t svcraw_recv()
{
  return 0;
}

uint64_t svcraw_stat()
{
  return 2;
}

uint64_t svcraw_getargs()
{
  return 0;
}

uint64_t svcraw_reply()
{
  return 0;
}

uint64_t svcraw_freeargs()
{
  return 0;
}

uint64_t _newrpclib_svc_run()
{
  pthread_mutex_lock(&svc_thread_lock);
  if (svc_active_threads)
  {
    pthread_mutex_unlock(&svc_thread_lock);
    svc_start_threads(0);
    pthread_mutex_lock(&svc_thread_lock);
    while (svc_exit_flag != 1 || svc_active_threads != 0)
      pthread_cond_wait(&svc_exit_cond, &svc_thread_lock);
    return pthread_mutex_unlock(&svc_thread_lock);
  }
  else
  {
    svc_active_threads = 1;
    pthread_mutex_unlock(&svc_thread_lock);
    if (svc_thread_qos_class)
      pthread_set_qos_class_self_np((qos_class_t)svc_thread_qos_class, svc_thread_relative_priority);
    return svc_thread();
  }
}

uint64_t svc_thread()
{
  uint64_t v0;
  uint64_t v1;

  while (!svc_complete())
  {
    v0 = _newrpclib_svc_pollnext(0);
    if (v0)
    {
      v1 = v0;
      if (svc_complete())
        return 0;
      if ((svc_polling & 1) == 0)
        svc_start_threads(1);
      _newrpclib_svc_getsomerequests(v1, svc_nreq);
    }
  }
  return 0;
}

uint64_t svc_start_threads(uint64_t result)
{
  int v1;
  unsigned int v2;
  int v3;
  unsigned int v4;
  NSObject *v6;
  int v7;
  int v8;
  NSObject *v9;
  int v10;
  int v11;
  pthread_t v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  int v22;
  int v23;
  pthread_attr_t __attr;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (svc_max_threads != 1)
  {
    v1 = result;
    v13 = 0;
    memset(&__attr, 0, sizeof(__attr));
    pthread_attr_init(&__attr);
    pthread_attr_setdetachstate(&__attr, 2);
    pthread_attr_setstacksize(&__attr, svc_stack_size);
    if (svc_thread_qos_class)
      pthread_attr_set_qos_class_np(&__attr, (qos_class_t)svc_thread_qos_class, svc_thread_relative_priority);
    pthread_mutex_lock(&svc_thread_lock);
    v2 = svc_active_threads;
    v3 = svc_min_threads - svc_active_threads;
    v4 = svc_max_threads;
    if (svc_min_threads - svc_active_threads >= 1 && svc_active_threads < svc_max_threads)
    {
      v6 = MEMORY[0x24BDACB70];
      v7 = 1;
      do
      {
        if (pthread_create(&v13, &__attr, (void *(__cdecl *)(void *))svc_thread, 0))
        {
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          {
            v8 = *__error();
            *(_DWORD *)buf = 136316418;
            v15 = "/Library/Caches/com.apple.xbs/Sources/oncrpc/Oncrpc/svc_run.c";
            v16 = 1024;
            v17 = 358;
            v18 = 2080;
            v19 = "svc_start_threads";
            v20 = 2080;
            v21 = "Could not create thread";
            v22 = 67108960;
            v23 = v8;
            _os_log_error_impl(&dword_22D0E3000, v6, OS_LOG_TYPE_ERROR, "%s:%d in %s, %s returned with %m (%d)\n", buf, 0x2Eu);
          }
        }
        else
        {
          ++svc_active_threads;
          --v1;
        }
        v2 = svc_active_threads;
        v4 = svc_max_threads;
        if (v7 >= v3)
          break;
        ++v7;
      }
      while (svc_active_threads < svc_max_threads);
    }
    if (v1 >= 1 && v2 < v4 && (svc_polling & 1) == 0)
    {
      v9 = MEMORY[0x24BDACB70];
      v10 = 1;
      do
      {
        if (pthread_create(&v13, &__attr, (void *(__cdecl *)(void *))svc_thread, 0))
        {
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            v11 = *__error();
            *(_DWORD *)buf = 136316418;
            v15 = "/Library/Caches/com.apple.xbs/Sources/oncrpc/Oncrpc/svc_run.c";
            v16 = 1024;
            v17 = 374;
            v18 = 2080;
            v19 = "svc_start_threads";
            v20 = 2080;
            v21 = "Could not create thread";
            v22 = 67108960;
            v23 = v11;
            _os_log_error_impl(&dword_22D0E3000, v9, OS_LOG_TYPE_ERROR, "%s:%d in %s, %s returned with %m (%d)\n", buf, 0x2Eu);
          }
        }
        else
        {
          ++svc_active_threads;
        }
        if (v10 >= v1)
          break;
        ++v10;
      }
      while (svc_active_threads < svc_max_threads && svc_polling == 0);
    }
    return pthread_mutex_unlock(&svc_thread_lock);
  }
  return result;
}

uint64_t add_working_xprt(uint64_t a1)
{
  void **v1;

  v1 = *(void ***)(a1 + 64);
  pthread_mutex_lock(&svc_workq_lock);
  if (v1[122])
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      add_working_xprt_cold_2((uint64_t)v1);
    warnx("xprt %p is already on workq\n", v1);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      add_working_xprt_cold_1();
    abort();
  }
  v1[122] = 0;
  *off_255D60158 = v1;
  off_255D60158 = (_UNKNOWN **)(v1 + 122);
  return pthread_mutex_unlock(&svc_workq_lock);
}

uint64_t _newrpclib_svc_pollnext(const timespec *a1)
{
  int i;
  int v3;
  pthread_mutex_t *v4;
  unsigned int v5;
  NSObject *v6;
  int v7;
  uint64_t udata;
  int v9;
  _QWORD *v10;
  uint64_t ident;
  kevent64_s eventlist;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  pthread_mutex_lock(&svc_poll_lock);
  if (svc_polling == 1)
  {
    for (i = pthread_cond_timedwait_relative_np(&svc_poll_cond, &svc_poll_lock, &poll_timeout);
          (svc_exit_flag & 1) == 0;
          i = pthread_cond_timedwait_relative_np(&svc_poll_cond, &svc_poll_lock, &poll_timeout))
    {
      if (svc_polling == 1 && i == 60)
      {
        pthread_mutex_lock(&svc_thread_lock);
        if (svc_active_threads > svc_min_threads)
        {
          --svc_active_threads;
          pthread_mutex_unlock(&svc_thread_lock);
          v4 = &svc_poll_lock;
          goto LABEL_35;
        }
        pthread_mutex_unlock(&svc_thread_lock);
        if ((svc_polling & 1) == 0)
          goto LABEL_14;
      }
      else if (!svc_polling)
      {
        goto LABEL_14;
      }
    }
    pthread_mutex_unlock(&svc_poll_lock);
    pthread_mutex_lock(&svc_thread_lock);
    v3 = --svc_active_threads;
    if (svc_exit_flag == 1 && !v3)
      pthread_cond_broadcast(&svc_exit_cond);
    v4 = &svc_thread_lock;
LABEL_35:
    pthread_mutex_unlock(v4);
    pthread_exit(0);
  }
LABEL_14:
  v5 = 1;
  svc_polling = 1;
  pthread_mutex_unlock(&svc_poll_lock);
  v6 = MEMORY[0x24BDACB70];
  while (1)
  {
    while (1)
    {
      while (1)
      {
        memset(&eventlist, 0, sizeof(eventlist));
        v7 = kevent64(kq, 0, 0, &eventlist, 1, v5, a1);
        if (v7 != -1)
          break;
        v9 = *__error();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315906;
          v15 = "/Library/Caches/com.apple.xbs/Sources/oncrpc/Oncrpc/svc_run.c";
          v16 = 1024;
          v17 = 206;
          v18 = 2080;
          v19 = "_newrpclib_svc_pollnext";
          v20 = 1024;
          v21 = v9;
          _os_log_error_impl(&dword_22D0E3000, v6, OS_LOG_TYPE_ERROR, "%s:%d in %s, KEVENT ERRNO %d\n", buf, 0x22u);
        }
        warnx("KEVENT ERRNO %d\n", v9);
      }
      if (!v7)
        break;
      udata = eventlist.udata;
      if (eventlist.udata)
      {
        if (eventlist.filter == -1)
        {
          xprt_ref(eventlist.udata);
          svc_unarmxprt(udata);
          goto LABEL_32;
        }
      }
      else
      {
        ident = eventlist.ident;
        if (ident != (int)svc_kq_control())
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            _newrpclib_svc_pollnext_cold_1();
          abort();
        }
        svc_clear_kq_control();
        v5 = 1;
      }
    }
    if (!v5)
      break;
    pthread_mutex_lock(&svc_workq_lock);
    v10 = workq;
    if (workq)
    {
      workq = (_UNKNOWN *)*((_QWORD *)workq + 122);
      if (!workq)
        off_255D60158 = &workq;
      v10[122] = 0;
      pthread_mutex_unlock(&svc_workq_lock);
      v5 = 0;
      udata = v10[123];
      if (udata)
        goto LABEL_32;
    }
    else
    {
      pthread_mutex_unlock(&svc_workq_lock);
      v5 = 0;
    }
  }
  udata = 0;
LABEL_32:
  pthread_mutex_lock(&svc_poll_lock);
  svc_polling = 0;
  pthread_mutex_unlock(&svc_poll_lock);
  pthread_cond_signal(&svc_poll_cond);
  return udata;
}

uint64_t _newrpclib_svc_exit()
{
  pthread_mutex_lock(&svc_thread_lock);
  svc_exit_flag = 1;
  pthread_cond_broadcast(&svc_poll_cond);
  return pthread_mutex_unlock(&svc_thread_lock);
}

uint64_t svc_complete()
{
  int v0;
  uint64_t v1;

  pthread_mutex_lock(&svc_thread_lock);
  v0 = svc_active_threads;
  if ((svc_exit_flag & 1) != 0 || svc_active_threads > svc_max_threads)
  {
    --svc_active_threads;
    if (v0 == 1)
      pthread_cond_broadcast(&svc_exit_cond);
    v1 = 1;
  }
  else
  {
    v1 = 0;
  }
  pthread_mutex_unlock(&svc_thread_lock);
  return v1;
}

uint64_t _newrpclib_registerrpc(unsigned int a1, unsigned int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v12;
  uint64_t v13;
  uint64_t result;

  if (a3)
  {
    if (_newrpclib_registerrpc_transp || (_newrpclib_registerrpc_transp = (uint64_t)_newrpclib_svcudp_create(-1)) != 0)
    {
      _newrpclib_pmap_unset(a1, a2);
      if (_newrpclib_svc_register(_newrpclib_registerrpc_transp, a1, a2, (uint64_t)universal, 17))
      {
        v12 = calloc(1uLL, 0x28uLL);
        if (v12)
        {
          v13 = (uint64_t)v12;
          result = 0;
          *(_QWORD *)v13 = a4;
          *(_DWORD *)(v13 + 8) = a1;
          *(_DWORD *)(v13 + 12) = a3;
          *(_QWORD *)(v13 + 16) = a5;
          *(_QWORD *)(v13 + 24) = a6;
          *(_QWORD *)(v13 + 32) = proglst;
          proglst = v13;
          return result;
        }
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          _newrpclib_registerrpc_cold_4();
      }
      else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        _newrpclib_registerrpc_cold_3(a1, a2);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      _newrpclib_registerrpc_cold_2();
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    _newrpclib_registerrpc_cold_1();
  }
  return 0xFFFFFFFFLL;
}

_DWORD *universal()
{
  _DWORD *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  _DWORD *result;
  uint64_t (*v6)();
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE v14[8800];
  uint64_t v15;

  v0 = (_DWORD *)MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v15 = *MEMORY[0x24BDAC8D0];
  v3 = v0[2];
  if (v3)
  {
    v4 = proglst;
    if (!proglst)
    {
LABEL_6:
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        universal_cold_2();
      goto LABEL_8;
    }
    while (*(_DWORD *)(v4 + 8) != *v0 || *(_DWORD *)(v4 + 12) != v3)
    {
      v4 = *(_QWORD *)(v4 + 32);
      if (!v4)
        goto LABEL_6;
    }
    bzero(v14, 0x2260uLL);
    if ((*(unsigned int (**)(uint64_t, _QWORD, _BYTE *))(*(_QWORD *)(v2 + 8) + 16))(v2, *(_QWORD *)(v4 + 16), v14))
    {
      result = (_DWORD *)(*(uint64_t (**)(_BYTE *))v4)(v14);
      v6 = *(uint64_t (**)())(v4 + 24);
      if (result)
      {
LABEL_11:
        if (_newrpclib_svc_sendreply(v2, (uint64_t)v6, (uint64_t)result))
          return (_DWORD *)(*(uint64_t (**)(uint64_t, _QWORD, _BYTE *))(*(_QWORD *)(v2 + 8) + 32))(v2, *(_QWORD *)(v4 + 16), v14);
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          universal_cold_3(v4 + 8, v7, v8, v9, v10, v11, v12, v13);
LABEL_8:
        exit(1);
      }
      if (v6 == _newrpclib_xdr_void)
      {
        v6 = _newrpclib_xdr_void;
        goto LABEL_11;
      }
    }
    else
    {
      return _newrpclib_svcerr_decode();
    }
  }
  else
  {
    result = _newrpclib_svc_sendreply(v1, (uint64_t)_newrpclib_xdr_void, 0);
    if (!(_DWORD)result)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        universal_cold_1();
      goto LABEL_8;
    }
  }
  return result;
}

int *_newrpclib_svctcp_create(int a1, int a2, int a3)
{
  int v6;
  int v7;
  int *result;
  socklen_t v9;
  int v10;
  socklen_t v11;
  int v12;
  socklen_t v13;
  sockaddr v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v12 = 1;
  v13 = 16;
  v11 = 4;
  v14 = (sockaddr)0;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  if (a1 == -1)
  {
    v6 = open_socket(6);
    if (v6 < 0)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        _newrpclib_svctcp_create_cold_1();
      return 0;
    }
LABEL_6:
    if (bindresvport_sa(v6, &v14))
    {
      *(_WORD *)v14.sa_data = 0;
      if (bind(v6, &v14, v13))
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          _newrpclib_svctcp_create_cold_3();
        return 0;
      }
    }
    goto LABEL_15;
  }
  v9 = 4;
  v10 = 1;
  if (getsockopt(a1, 0xFFFF, 4104, &v10, &v9))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      _newrpclib_svctcp_create_cold_7();
    return 0;
  }
  if (v10 != 1)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      _newrpclib_svctcp_create_cold_6();
    return 0;
  }
  if (getsockname(a1, &v14, &v13) == -1)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      _newrpclib_svctcp_create_cold_4();
    return 0;
  }
  if (v14.sa_family != 2 && v14.sa_family != 30)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      _newrpclib_svctcp_create_cold_5();
    return 0;
  }
  v6 = a1;
  if (!*(_WORD *)v14.sa_data)
    goto LABEL_6;
LABEL_15:
  if (getsockopt(v6, 41, 27, &v12, &v11))
    v7 = 2;
  else
    v7 = 30;
  result = svcstrm_domain_create(v6, v7, 6, a2, a3);
  if (!result)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      _newrpclib_svctcp_create_cold_2();
    if (a1 == -1)
      close(v6);
    return 0;
  }
  return result;
}

int *svcstrm_domain_create(int a1, int a2, int a3, int a4, int a5)
{
  int *v10;
  _DWORD *v12;
  void *v13;
  _DWORD *v14;
  int v15;
  socklen_t v16;
  sockaddr v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = (sockaddr)0;
  v18 = 0u;
  v15 = 0;
  v16 = 128;
  setsockopt(a1, 0xFFFF, 4130, &v15, 4u);
  if (getsockname(a1, &v17, &v16) || listen(a1, svc_listen_backlog))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      svcstrm_domain_create_cold_3();
  }
  else
  {
    v12 = calloc(1uLL, 8uLL);
    if (v12)
    {
      v13 = v12;
      *v12 = a4;
      v12[1] = a5;
      v14 = svc_xprt_create(a1, &v17.sa_len, (uint64_t)svcstrm_rendezvous_op, 0, (uint64_t)v12);
      if (v14)
      {
        v10 = v14;
        _newrpclib_socparms2netid(a2, 1, a3, *((const char ***)v14 + 8));
        _newrpclib_xprt_register(v10);
        return v10;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        svcstrm_domain_create_cold_2();
      free(v13);
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      svcstrm_domain_create_cold_1();
    }
  }
  return 0;
}

int *svcticotsord_create(int a1, int a2, int a3)
{
  int v6;
  int *result;
  socklen_t v8;
  int v9;
  socklen_t v10;
  sockaddr v11[7];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  memset(v11, 0, 106);
  v10 = 106;
  if (a1 == -1)
  {
    *(_QWORD *)v11[6].sa_data = 0;
    *(_OWORD *)v11[5].sa_data = 0uLL;
    *(_OWORD *)v11[4].sa_data = 0uLL;
    *(_OWORD *)v11[3].sa_data = 0uLL;
    *(_OWORD *)v11[2].sa_data = 0uLL;
    *(_OWORD *)v11[1].sa_data = 0uLL;
    *(_OWORD *)v11[0].sa_data = 0uLL;
    *(_WORD *)&v11[0].sa_len = 362;
    v6 = socket(1, 1, 0);
    if (v6 < 0)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        svcticotsord_create_cold_1();
      return 0;
    }
  }
  else
  {
    v8 = 4;
    v9 = 1;
    if (getsockopt(a1, 0xFFFF, 4104, &v9, &v8))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        svcticotsord_create_cold_9();
      return 0;
    }
    if (v9 != 1)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        svcticotsord_create_cold_8();
      return 0;
    }
    memset(v11, 0, 106);
    if (getsockname(a1, v11, &v10) == -1)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        svcticotsord_create_cold_6();
      return 0;
    }
    if (v11[0].sa_family != 1)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        svcticotsord_create_cold_7();
      return 0;
    }
    v6 = a1;
    if (v11[0].sa_data[0])
      goto LABEL_30;
  }
  if (set_local_ephemeral_sockname((uint64_t)v11, "ticotsord"))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      svcticotsord_create_cold_5();
LABEL_19:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      svcticotsord_create_cold_4();
    if (a1 != -1)
      return 0;
    goto LABEL_22;
  }
  if (bind(v6, v11, 0x6Au))
    goto LABEL_19;
  if (chmod(v11[0].sa_data, 0x1FFu) && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    svcticotsord_create_cold_3();
LABEL_30:
  result = svcstrm_domain_create(v6, 1, 0, a2, a3);
  if (result)
    return result;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    svcticotsord_create_cold_2();
  if (a1 == -1)
  {
    unlink(v11[0].sa_data);
LABEL_22:
    close(v6);
  }
  return 0;
}

uint64_t _newrpclib_svcfd_create(int a1, unsigned int a2, unsigned int a3)
{
  return makefd_xprt(a1, a2, a3, 0, 0);
}

uint64_t makefd_xprt(int a1, unsigned int a2, unsigned int a3, unsigned __int8 *a4, int a5)
{
  _QWORD *v10;
  _QWORD *v11;
  _DWORD *v12;
  uint64_t v13;
  int v14;
  int v15;
  int v17;

  v17 = 1;
  setsockopt(a1, 0xFFFF, 4130, &v17, 4u);
  v10 = calloc(1uLL, 0x18uLL);
  if (v10)
  {
    v11 = v10;
    *v10 = 0;
    v10[1] = 0;
    v12 = svc_xprt_create(a1, 0, (uint64_t)svcstrm_op, a5 | 0xAu, (uint64_t)v10);
    if (v12)
    {
      v13 = (uint64_t)v12;
      v11[2] = v12;
      _newrpclib_xdrrec_create(*((_QWORD *)v12 + 8) + 344, 0, a3, (uint64_t)v12, (uint64_t)readstrm_0, 0);
      _newrpclib_xdrrec_create(*(_QWORD *)(v13 + 64) + 456, a2, 0, v13, 0, (uint64_t)writestrm_0);
      if (!a4 || !*a4)
      {
        if (_newrpclib_socparms2netid(1, 1, 0, *(const char ***)(v13 + 64))
          && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          makefd_xprt_cold_3();
        }
        goto LABEL_24;
      }
      memcpy((void *)(*(_QWORD *)(v13 + 64) + 8), a4, *a4);
      v14 = a4[1];
      switch(v14)
      {
        case 1:
          *(_DWORD *)(v13 + 16) = 0;
          memcpy((void *)(*(_QWORD *)(v13 + 64) + 136), a4, *a4);
          v15 = 0;
LABEL_21:
          if (_newrpclib_socparms2netid(a4[1], 1, v15, *(const char ***)(v13 + 64))
            && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            makefd_xprt_cold_5();
          }
LABEL_24:
          _newrpclib_xprt_register((int *)v13);
          return v13;
        case 30:
          *(_QWORD *)(v13 + 20) = 0;
          *(_QWORD *)(v13 + 28) = 0;
          cvt6to4((uint64_t)a4, v13 + 20);
          goto LABEL_20;
        case 2:
          memcpy((void *)(v13 + 20), a4, *a4);
          *(_DWORD *)(v13 + 16) = *(unsigned __int8 *)(v13 + 20);
LABEL_20:
          v15 = 6;
          goto LABEL_21;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        makefd_xprt_cold_4();
      svc_xprt_destroy((void **)v13);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        makefd_xprt_cold_2();
      free(v11);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    makefd_xprt_cold_1();
  }
  return 0;
}

uint64_t rendezvous_request(uint64_t a1)
{
  _DWORD *thread_req;
  uint64_t v3;
  unsigned int *v4;
  int v5;
  uint64_t v6;
  int v7;
  unsigned int v8;
  uint64_t v9;
  socklen_t v11;
  sockaddr v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  thread_req = svc_get_thread_req();
  v3 = *(_QWORD *)(a1 + 64);
  if ((*(_BYTE *)(v3 + 328) & 4) != 0)
    pthread_mutex_lock((pthread_mutex_t *)(v3 + 392));
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = (sockaddr)0;
  v13 = 0u;
  v4 = *(unsigned int **)(a1 + 72);
  while (1)
  {
    v11 = 128;
    v5 = accept(*(_DWORD *)a1, &v12, &v11);
    if ((v5 & 0x80000000) == 0)
      break;
    if (*__error() != 4)
    {
      v6 = *(_QWORD *)(a1 + 64);
      if ((*(_BYTE *)(v6 + 328) & 4) != 0)
        pthread_mutex_unlock((pthread_mutex_t *)(v6 + 392));
      if (*__error() != 35 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        rendezvous_request_cold_1();
      return 0;
    }
  }
  v7 = v5;
  do
    v8 = __ldxr(&conncount);
  while (__stxr(v8 + 1, &conncount));
  v9 = *(_QWORD *)(a1 + 64);
  if ((*(_BYTE *)(v9 + 328) & 4) != 0)
    pthread_mutex_unlock((pthread_mutex_t *)(v9 + 392));
  if (thread_req)
  {
    thread_req[187] |= 1u;
    thread_req[186] = 0;
  }
  svc_rearmxprt((int *)a1, 0);
  makefd_xprt(v7, *v4, v4[1], &v12.sa_len, *(_DWORD *)(*(_QWORD *)(a1 + 64) + 328) & 0x10);
  return 0;
}

uint64_t rendezvous_stat()
{
  return 2;
}

uint64_t rendezvous_abort_getargs()
{
  return 0;
}

uint64_t rendezvous_abort_reply()
{
  return 0;
}

uint64_t rendezvous_abort_freeargs()
{
  return 0;
}

void rendezvous_destroy(uint64_t a1)
{
  uint64_t v2;
  const char *v3;
  int v4;

  v2 = *(_QWORD *)(a1 + 64);
  if (*(_BYTE *)(v2 + 137) == 1)
  {
    v4 = *(unsigned __int8 *)(v2 + 138);
    v3 = (const char *)(v2 + 138);
    if (v4)
      unlink(v3);
  }
  svcstrm_destroy(a1);
}

void svcstrm_destroy(uint64_t a1)
{
  void *v2;
  unsigned int v3;

  v2 = *(void **)(a1 + 72);
  _newrpclib_xprt_unregister();
  free(v2);
  do
    v3 = __ldxr(&conncount);
  while (__stxr(v3 - 1, &conncount));
  if (close(*(_DWORD *)a1) && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    svcstrm_destroy_cold_1();
  svc_xprt_destroy((void **)a1);
}

ssize_t readstrm_0(uint64_t a1, void *a2, size_t a3)
{
  int v6;
  NSObject *v7;
  int v8;
  int v9;
  ssize_t result;
  int v11;
  pollfd v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  int v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = *(_DWORD *)a1;
  *(_DWORD *)&v13.events = 64;
  v7 = MEMORY[0x24BDACB70];
  v13.fd = v6;
  while (1)
  {
    v8 = poll(&v13, 1u, 12000);
    v9 = v8;
    if (v8 < 0)
    {
      if (*__error() != 4 && *__error() != 35)
        goto LABEL_15;
    }
    else if (!v8)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        readstrm_cold_2();
      goto LABEL_19;
    }
    if ((v13.revents & 0x40) != 0)
    {
      result = read(v6, a2, a3);
      if (result > 0)
        return result;
      if ((result & 0x8000000000000000) == 0)
        break;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v11 = *__error();
        *(_DWORD *)buf = 136316418;
        v15 = "/Library/Caches/com.apple.xbs/Sources/oncrpc/Oncrpc/svc_strm.c";
        v16 = 1024;
        v17 = 698;
        v18 = 2080;
        v19 = "readstrm";
        v20 = 2080;
        v21 = "strm read";
        v22 = 67108960;
        v23 = v11;
        _os_log_error_impl(&dword_22D0E3000, v7, OS_LOG_TYPE_ERROR, "%s:%d in %s, %s returned with %m (%d)\n", buf, 0x2Eu);
      }
      if (*__error() != 4 && *__error() != 35)
        break;
    }
  }
  if ((v9 & 0x80000000) == 0)
    goto LABEL_19;
LABEL_15:
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    readstrm_cold_1();
LABEL_19:
  *(_DWORD *)(*(_QWORD *)(a1 + 64) + 336) = 0;
  return -1;
}

size_t writestrm_0(uint64_t a1, char *__buf, size_t __nbyte)
{
  size_t v3;
  NSObject *v6;
  size_t v7;
  ssize_t v8;
  int v9;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  int v20;
  int v21;
  uint64_t v22;

  v3 = __nbyte;
  v22 = *MEMORY[0x24BDAC8D0];
  if (__nbyte)
  {
    v6 = MEMORY[0x24BDACB70];
    v7 = __nbyte;
    do
    {
      while (1)
      {
        v8 = write(*(_DWORD *)a1, __buf, v7);
        if (v8 < 0)
          break;
        __buf += v8;
        v7 -= v8;
        if (!v7)
          return v3;
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v9 = *__error();
        *(_DWORD *)buf = 136316418;
        v13 = "/Library/Caches/com.apple.xbs/Sources/oncrpc/Oncrpc/svc_strm.c";
        v14 = 1024;
        v15 = 729;
        v16 = 2080;
        v17 = "writestrm";
        v18 = 2080;
        v19 = "strm write";
        v20 = 67108960;
        v21 = v9;
        _os_log_error_impl(&dword_22D0E3000, v6, OS_LOG_TYPE_ERROR, "%s:%d in %s, %s returned with %m (%d)\n", buf, 0x2Eu);
      }
    }
    while (*__error() == 35 || *__error() == 4);
    *(_DWORD *)(*(_QWORD *)(a1 + 64) + 336) = 0;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      writestrm_cold_1();
    return -1;
  }
  return v3;
}

uint64_t svcstrm_recv(uint64_t a1, uint64_t a2)
{
  _DWORD *v4;
  _DWORD *thread_req;
  uint64_t v6;
  uint64_t v7;
  sockaddr *v8;
  int v9;
  uint64_t result;
  uint64_t v11;
  socklen_t v12;

  v4 = (_DWORD *)(*(_QWORD *)(a1 + 64) + 344);
  thread_req = svc_get_thread_req();
  v6 = *(_QWORD *)(a1 + 64);
  if ((*(_BYTE *)(v6 + 328) & 4) != 0)
    pthread_mutex_lock((pthread_mutex_t *)(v6 + 392));
  *v4 = 1;
  if (!xdrrec_isrecordstart((uint64_t)v4) && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    svcstrm_recv_cold_3();
  if (_newrpclib_xdrrec_skiprecord((uint64_t)v4))
  {
    if (_newrpclib_xdr_callmsg((uint64_t)v4, a2))
    {
      v7 = *(_QWORD *)(a1 + 64);
      if ((*(_BYTE *)(v7 + 328) & 0x10) != 0)
      {
        v9 = *(unsigned __int8 *)(v7 + 136);
        v8 = (sockaddr *)(v7 + 136);
        if (!v9)
        {
          v12 = 128;
          if (getsockname(*(_DWORD *)a1, v8, &v12))
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              svcstrm_recv_cold_2();
          }
        }
      }
      return 1;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    svcstrm_recv_cold_1();
  }
  v11 = *(_QWORD *)(a1 + 64);
  if ((*(_BYTE *)(v11 + 328) & 4) != 0)
    pthread_mutex_unlock((pthread_mutex_t *)(v11 + 392));
  result = svcstrm_stat(a1);
  if (thread_req)
  {
    thread_req[186] = 0;
    thread_req[187] |= 1u;
  }
  if ((_DWORD)result)
  {
    svc_rearmxprt((int *)a1, result == 1);
    return 0;
  }
  return result;
}

uint64_t svcstrm_stat(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(a1 + 64);
  if (*(_DWORD *)(v1 + 336))
  {
    if (_newrpclib_xdrrec_eof(v1 + 344))
      result = 2;
    else
      result = 1;
    *(_DWORD *)(*(_QWORD *)(a1 + 64) + 336) = result;
  }
  else
  {
    result = 0;
    *(_DWORD *)(v1 + 328) |= 0x8000u;
  }
  return result;
}

uint64_t svcstrm_getargs(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t), uint64_t a3)
{
  _DWORD *thread_req;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t v10;

  thread_req = svc_get_thread_req();
  v7 = a2(*(_QWORD *)(a1 + 64) + 344, a3);
  v8 = svcstrm_stat(a1);
  if (thread_req)
  {
    thread_req[186] = v8;
    v9 = thread_req[187];
    thread_req[187] = v9 | 1;
    if (v8)
    {
      if ((v9 & 2) != 0)
      {
        svc_rearmxprt((int *)a1, v8 == 1);
        thread_req[187] &= ~2u;
      }
    }
  }
  v10 = *(_QWORD *)(a1 + 64);
  if ((*(_BYTE *)(v10 + 328) & 4) != 0)
    pthread_mutex_unlock((pthread_mutex_t *)(v10 + 392));
  return v7;
}

uint64_t svcstrm_reply(uint64_t a1, uint64_t a2)
{
  uint64_t (***v4)(void);
  _DWORD *thread_req;
  int v6;
  uint64_t v7;

  v4 = (uint64_t (***)(void))(*(_QWORD *)(a1 + 64) + 456);
  thread_req = svc_get_thread_req();
  if (!thread_req || (v6 = thread_req[187], (v6 & 1) == 0) && (thread_req[187] = v6 | 1, (v6 & 2) != 0))
    svc_rearmxprt((int *)a1, 0);
  *(_DWORD *)v4 = 0;
  pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 64) + 504));
  v7 = _newrpclib_xdr_replymsg(v4, a2);
  if (!_newrpclib_xdrrec_endofrecord((uint64_t)v4, 1)
    && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    svcstrm_reply_cold_1();
  }
  pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 64) + 504));
  return v7;
}

uint64_t svcstrm_freeargs(uint64_t a1, uint64_t (*a2)(_OWORD *, uint64_t), uint64_t a3)
{
  _OWORD v4[3];

  memset(v4, 0, sizeof(v4));
  LODWORD(v4[0]) = 2;
  return a2(v4, a3);
}

_DWORD *_newrpclib_svcudp_bufcreate(int a1, int a2, int a3)
{
  int v6;
  _DWORD *v7;
  _DWORD *v8;
  size_t v9;
  void *v10;
  size_t v11;
  void *v12;
  _DWORD *v13;
  int v14;
  socklen_t v16;
  int v17;
  int v18;
  socklen_t v19;
  sockaddr v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = (sockaddr)0;
  v21 = 0u;
  v18 = 1;
  v19 = 128;
  v16 = 4;
  v17 = 0;
  v6 = a1;
  if (a1 == -1)
  {
    v6 = open_socket(17);
    if (v6 < 0)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        _newrpclib_svcudp_bufcreate_cold_1();
      return 0;
    }
  }
  ioctl(v6, 0x8004667EuLL, &v18);
  if (getsockname(v6, &v20, &v19))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      _newrpclib_svcudp_bufcreate_cold_6();
LABEL_11:
    if (a1 == -1)
      close(v6);
    return 0;
  }
  if (bindresvport_sa(v6, &v20))
  {
    *(_WORD *)v20.sa_data = 0;
    bind(v6, &v20, v19);
  }
  if (getsockname(v6, &v20, &v19))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      _newrpclib_svcudp_bufcreate_cold_5();
    goto LABEL_11;
  }
  v7 = calloc(1uLL, 0x28uLL);
  if (!v7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      _newrpclib_svcudp_bufcreate_cold_2();
    goto LABEL_11;
  }
  v8 = v7;
  v9 = (a3 + 3) & 0xFFFFFFFC;
  *v7 = v9;
  v10 = calloc(1uLL, v9);
  *((_QWORD *)v8 + 1) = v10;
  if (!v10)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      _newrpclib_svcudp_bufcreate_cold_3();
    if (a1 == -1)
      close(v6);
    goto LABEL_33;
  }
  v11 = (a2 + 3) & 0xFFFFFFFC;
  v8[4] = v11;
  v12 = calloc(1uLL, v11);
  *((_QWORD *)v8 + 3) = v12;
  if (!v12)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      _newrpclib_svcudp_bufcreate_cold_4();
    if (a1 == -1)
      close(v6);
    free(*((void **)v8 + 1));
LABEL_33:
    free(v8);
    return 0;
  }
  v13 = svc_xprt_create(v6, &v20.sa_len, (uint64_t)svcudp_op, 1, (uint64_t)v8);
  _newrpclib_xdrmem_create(*((_QWORD *)v13 + 8) + 344, *((_QWORD *)v8 + 1), *v8, 1);
  _newrpclib_xdrmem_create(*((_QWORD *)v13 + 8) + 456, *((_QWORD *)v8 + 3), v8[4], 0);
  if (getsockopt(v6, 41, 27, &v17, &v16))
    v14 = 2;
  else
    v14 = 30;
  _newrpclib_socparms2netid(v14, 2, 17, *((const char ***)v13 + 8));
  *((_QWORD *)v8 + 4) = 0;
  _newrpclib_xprt_register(v13);
  return v13;
}

_DWORD *_newrpclib_svcudp_create(int a1)
{
  return _newrpclib_svcudp_bufcreate(a1, 8800, 8800);
}

uint64_t svcudp_recv(uint64_t a1, unsigned int *a2)
{
  unsigned int *v4;
  uint64_t v5;
  _DWORD *thread_req;
  uint64_t v7;
  _OWORD *v8;
  uint64_t v9;
  unint64_t v10;
  unsigned __int8 *v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t result;
  uint64_t v24;
  size_t v25;
  socklen_t v26;

  v5 = *(_QWORD *)(a1 + 64);
  v4 = *(unsigned int **)(a1 + 72);
  thread_req = svc_get_thread_req();
  v7 = *(_QWORD *)(a1 + 64);
  if ((*(_BYTE *)(v7 + 328) & 4) != 0)
    pthread_mutex_lock((pthread_mutex_t *)(v7 + 392));
  v8 = (_OWORD *)(a1 + 20);
  while (1)
  {
    v9 = *(_QWORD *)(a1 + 64);
    if ((*(_BYTE *)(v9 + 328) & 0x10) != 0)
    {
      *(_BYTE *)(v9 + 8) = 0x80;
      v11 = (unsigned __int8 *)(v9 + 8);
      v11[128] = 0x80;
      v10 = (int)recvfrom_and_to(*(_DWORD *)a1, *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8), *v4, 0, v11, v11 + 128);
    }
    else
    {
      v26 = 128;
      v10 = recvfrom(*(_DWORD *)a1, *(void **)(*(_QWORD *)(a1 + 72) + 8), *v4, 0, (sockaddr *)(v9 + 8), &v26);
    }
    v12 = *(_QWORD *)(a1 + 64);
    if (*(_BYTE *)(v12 + 9) == 2)
    {
      *v8 = *(_OWORD *)(v12 + 8);
    }
    else
    {
      *(_QWORD *)v8 = 0;
      *(_QWORD *)(a1 + 28) = 0;
      cvt6to4(v12 + 8, a1 + 20);
    }
    *(_DWORD *)(a1 + 16) = *(unsigned __int8 *)(a1 + 20);
    if (v10 != -1)
      break;
    if (*__error() != 4)
      goto LABEL_27;
  }
  if ((v10 & 0x8000000000000000) != 0)
  {
LABEL_27:
    if (*__error() != 35 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      svcudp_recv_cold_1();
      if (!thread_req)
      {
LABEL_31:
        svc_rearmxprt((int *)a1, 0);
        result = 0;
        v24 = *(_QWORD *)(a1 + 64);
        if ((*(_BYTE *)(v24 + 328) & 4) != 0)
        {
          pthread_mutex_unlock((pthread_mutex_t *)(v24 + 392));
          return 0;
        }
        return result;
      }
LABEL_30:
      thread_req[187] |= 1u;
      goto LABEL_31;
    }
LABEL_29:
    if (!thread_req)
      goto LABEL_31;
    goto LABEL_30;
  }
  if (v10 < 0x10)
    goto LABEL_29;
  *(_DWORD *)(v5 + 344) = 1;
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v5 + 352) + 40))(v5 + 344, 0);
  if (!_newrpclib_xdr_callmsg(v5 + 344, (uint64_t)a2))
    goto LABEL_29;
  v13 = *a2;
  v14 = *(_QWORD *)(a1 + 64);
  *(_DWORD *)(v14 + 568) = *a2;
  if (*((_QWORD *)v4 + 4))
  {
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 32);
    v16 = *(_QWORD *)(*(_QWORD *)(v15 + 8) + 8 * (v13 % (4 * *(_DWORD *)v15)));
    if (v16)
    {
      while (*(_DWORD *)v16 != *(_DWORD *)(*(_QWORD *)(a1 + 64) + 568)
           || *(_DWORD *)(v16 + 4) != *(_DWORD *)(v15 + 36)
           || *(_DWORD *)(v16 + 8) != *(_DWORD *)(v15 + 32)
           || *(_DWORD *)(v16 + 12) != *(_DWORD *)(v15 + 28)
           || memcmp((const void *)(v16 + 16), (const void *)(v15 + 40), 0x80uLL))
      {
        v16 = *(_QWORD *)(v16 + 160);
        if (!v16)
        {
          v14 = *(_QWORD *)(a1 + 64);
          goto LABEL_25;
        }
      }
      v25 = *(unsigned int *)(v16 + 152);
      if (sendto(*(_DWORD *)a1, *(const void **)(v16 + 144), v25, 0, (const sockaddr *)(*(_QWORD *)(a1 + 64) + 8), *(unsigned __int8 *)(*(_QWORD *)(a1 + 64) + 8)) != v25&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        svcudp_recv_cold_2();
      }
    }
    else
    {
LABEL_25:
      *(_DWORD *)(v15 + 36) = a2[5];
      *(_DWORD *)(v15 + 32) = a2[4];
      *(_DWORD *)(v15 + 28) = a2[3];
      v17 = *(_OWORD *)(v14 + 8);
      v18 = *(_OWORD *)(v14 + 24);
      v19 = *(_OWORD *)(v14 + 40);
      *(_OWORD *)(v15 + 88) = *(_OWORD *)(v14 + 56);
      *(_OWORD *)(v15 + 72) = v19;
      *(_OWORD *)(v15 + 56) = v18;
      *(_OWORD *)(v15 + 40) = v17;
      v20 = *(_OWORD *)(v14 + 72);
      v21 = *(_OWORD *)(v14 + 88);
      v22 = *(_OWORD *)(v14 + 104);
      *(_OWORD *)(v15 + 152) = *(_OWORD *)(v14 + 120);
      *(_OWORD *)(v15 + 136) = v22;
      *(_OWORD *)(v15 + 120) = v21;
      *(_OWORD *)(v15 + 104) = v20;
    }
  }
  return 1;
}

uint64_t svcudp_stat()
{
  return 2;
}

uint64_t svcudp_getargs(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t), uint64_t a3)
{
  _DWORD *thread_req;
  uint64_t v7;
  int v8;
  uint64_t v9;

  thread_req = svc_get_thread_req();
  v7 = a2(*(_QWORD *)(a1 + 64) + 344, a3);
  if (thread_req)
  {
    v8 = thread_req[187];
    thread_req[187] = v8 | 1;
    if ((v8 & 2) != 0)
    {
      svc_rearmxprt((int *)a1, 0);
      thread_req[187] &= ~2u;
    }
  }
  v9 = *(_QWORD *)(a1 + 64);
  if ((*(_BYTE *)(v9 + 328) & 4) != 0)
    pthread_mutex_unlock((pthread_mutex_t *)(v9 + 392));
  return v7;
}

uint64_t svcudp_reply(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _DWORD *thread_req;
  _DWORD *v7;
  int v8;
  const sockaddr *v9;
  socklen_t sa_len;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  _QWORD *v16;
  _QWORD *v17;
  char *v18;
  BOOL v19;
  uint64_t v20;
  char *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;

  v5 = *(_QWORD *)(a1 + 64);
  v4 = *(_QWORD *)(a1 + 72);
  thread_req = svc_get_thread_req();
  if (thread_req)
  {
    v7 = thread_req;
    v8 = thread_req[187];
    if ((v8 & 1) == 0)
    {
      thread_req[187] = v8 | 1;
      if ((v8 & 2) != 0)
        svc_rearmxprt((int *)a1, 0);
    }
    pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 64) + 504));
    v9 = (const sockaddr *)(v7 + 14);
  }
  else
  {
    svc_rearmxprt((int *)a1, 0);
    pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 64) + 504));
    v9 = (const sockaddr *)(*(_QWORD *)(a1 + 64) + 8);
  }
  sa_len = v9->sa_len;
  *(_DWORD *)(v5 + 456) = 0;
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v5 + 464) + 40))(v5 + 456, 0);
  if (!_newrpclib_xdr_replymsg((uint64_t (***)(void))(v5 + 456), a2))
    goto LABEL_22;
  v11 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v5 + 464) + 32))(v5 + 456);
  if (sendto(*(_DWORD *)a1, *(const void **)(*(_QWORD *)(a1 + 72) + 24), v11, 0, v9, sa_len) != v11)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      svcudp_reply_cold_4();
LABEL_22:
    v12 = 0;
    goto LABEL_23;
  }
  v12 = 1;
  if ((v11 & 0x80000000) == 0 && *(_QWORD *)(v4 + 32))
  {
    v13 = *(_QWORD *)(a1 + 72);
    v14 = *(_QWORD *)(v13 + 32);
    v15 = *(char **)(*(_QWORD *)(v14 + 16) + 8 * *(unsigned int *)(v14 + 24));
    if (v15)
    {
      v16 = (_QWORD *)(*(_QWORD *)(v14 + 8) + 8 * (*(_DWORD *)v15 % (4 * *(_DWORD *)v14)));
      do
      {
        v17 = v16;
        v18 = (char *)*v16;
        v16 = (_QWORD *)(*v16 + 160);
        if (v18)
          v19 = v18 == v15;
        else
          v19 = 1;
      }
      while (!v19);
      if (!v18)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          svcudp_reply_cold_3();
        goto LABEL_34;
      }
      *v17 = *((_QWORD *)v15 + 20);
      v20 = *((_QWORD *)v15 + 18);
    }
    else
    {
      v22 = (char *)calloc(1uLL, 0xA8uLL);
      if (!v22)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          svcudp_reply_cold_1();
        goto LABEL_34;
      }
      v15 = v22;
      v23 = calloc(1uLL, *(unsigned int *)(v13 + 16));
      if (!v23)
      {
        free(v15);
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          svcudp_reply_cold_2();
        goto LABEL_34;
      }
      v20 = (uint64_t)v23;
    }
    *((_DWORD *)v15 + 38) = v11;
    v25 = *(_QWORD *)(a1 + 64);
    v24 = *(_QWORD *)(a1 + 72);
    *((_QWORD *)v15 + 18) = *(_QWORD *)(v24 + 24);
    *(_QWORD *)(v24 + 24) = v20;
    _newrpclib_xdrmem_create(v25 + 456, v20, *(_DWORD *)(v13 + 16), 0);
    v26 = *(_DWORD *)(*(_QWORD *)(a1 + 64) + 568);
    *(_DWORD *)v15 = v26;
    *(int32x2_t *)(v15 + 4) = vrev64_s32(*(int32x2_t *)(v14 + 32));
    *((_DWORD *)v15 + 3) = *(_DWORD *)(v14 + 28);
    v27 = *(_OWORD *)(v14 + 40);
    v28 = *(_OWORD *)(v14 + 56);
    v29 = *(_OWORD *)(v14 + 88);
    *((_OWORD *)v15 + 3) = *(_OWORD *)(v14 + 72);
    *((_OWORD *)v15 + 4) = v29;
    *((_OWORD *)v15 + 1) = v27;
    *((_OWORD *)v15 + 2) = v28;
    v30 = *(_OWORD *)(v14 + 152);
    v31 = *(_OWORD *)(v14 + 120);
    v32 = *(_OWORD *)(v14 + 136);
    *((_OWORD *)v15 + 5) = *(_OWORD *)(v14 + 104);
    *((_OWORD *)v15 + 6) = v31;
    *((_OWORD *)v15 + 7) = v32;
    *((_OWORD *)v15 + 8) = v30;
    v33 = v26 % (4 * **(_DWORD **)(*(_QWORD *)(a1 + 72) + 32));
    v34 = *(_QWORD *)(v14 + 8);
    *((_QWORD *)v15 + 20) = *(_QWORD *)(v34 + 8 * v33);
    *(_QWORD *)(v34 + 8 * v33) = v15;
    v35 = *(unsigned int *)(v14 + 24);
    *(_QWORD *)(*(_QWORD *)(v14 + 16) + 8 * v35) = v15;
    *(_DWORD *)(v14 + 24) = (v35 + 1) % *(_DWORD *)v14;
LABEL_34:
    v12 = 1;
  }
LABEL_23:
  pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 64) + 504));
  return v12;
}

uint64_t svcudp_freeargs(uint64_t a1, uint64_t (*a2)(_OWORD *, uint64_t), uint64_t a3)
{
  _OWORD v4[3];

  memset(v4, 0, sizeof(v4));
  LODWORD(v4[0]) = 2;
  return a2(v4, a3);
}

void svcudp_destroy(uint64_t a1)
{
  _newrpclib_xprt_unregister();
  if (close(*(_DWORD *)a1) && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    svcudp_destroy_cold_1();
  free(*(void **)(*(_QWORD *)(a1 + 72) + 8));
  free(*(void **)(*(_QWORD *)(a1 + 72) + 24));
  svc_xprt_destroy((void **)a1);
}

_DWORD *svc_xprt_create(int a1, unsigned __int8 *a2, uint64_t a3, int a4, uint64_t a5)
{
  _DWORD *v10;
  _DWORD *v11;
  char *v12;
  char *v13;
  uint64_t v14;
  int v15;
  unsigned int v16;
  pthread_mutexattr_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v18.__sig = 0;
  *(_QWORD *)v18.__opaque = 0;
  v10 = calloc(1uLL, 0x50uLL);
  if (!v10)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      svc_xprt_create_cold_1();
    return 0;
  }
  v11 = v10;
  v12 = (char *)calloc(1uLL, 0x3E0uLL);
  if (!v12)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      svc_xprt_create_cold_2();
    free(v11);
    return 0;
  }
  v13 = v12;
  *v11 = a1;
  *((_QWORD *)v11 + 5) = 0;
  *((_QWORD *)v11 + 6) = 0;
  *((_QWORD *)v11 + 2) = 0;
  *((_QWORD *)v11 + 3) = 0;
  *((_QWORD *)v11 + 1) = a3;
  v11[8] = 0;
  *((_QWORD *)v11 + 7) = 0;
  *((_QWORD *)v11 + 8) = v12;
  *((_QWORD *)v11 + 9) = a5;
  *(_OWORD *)(v12 + 120) = 0u;
  *(_OWORD *)(v12 + 104) = 0u;
  *(_OWORD *)(v12 + 88) = 0u;
  *(_OWORD *)(v12 + 72) = 0u;
  *(_OWORD *)(v12 + 56) = 0u;
  *(_OWORD *)(v12 + 40) = 0u;
  *(_OWORD *)(v12 + 24) = 0u;
  *(_OWORD *)(v12 + 8) = 0u;
  v14 = *((_QWORD *)v11 + 8);
  *(_OWORD *)(v14 + 248) = 0u;
  *(_OWORD *)(v14 + 232) = 0u;
  *(_OWORD *)(v14 + 216) = 0u;
  *(_OWORD *)(v14 + 200) = 0u;
  *(_OWORD *)(v14 + 184) = 0u;
  *(_OWORD *)(v14 + 168) = 0u;
  *(_OWORD *)(v14 + 152) = 0u;
  *(_OWORD *)(v14 + 136) = 0u;
  if (a2 && ((memcpy((void *)(*((_QWORD *)v11 + 8) + 136), a2, *a2), v15 = a2[1], v15 == 30) || v15 == 2))
    v16 = bswap32(*((unsigned __int16 *)a2 + 1)) >> 16;
  else
    LOWORD(v16) = 0;
  *((_WORD *)v11 + 2) = v16;
  pthread_mutexattr_init(&v18);
  pthread_mutexattr_settype(&v18, 1);
  pthread_mutex_init((pthread_mutex_t *)(v13 + 264), &v18);
  *((_DWORD *)v13 + 82) = a4;
  atomic_store(0, (unsigned __int8 *)v13 + 572);
  *(_QWORD *)(v13 + 332) = 0x200000000;
  pthread_mutex_init((pthread_mutex_t *)(v13 + 504), &v18);
  pthread_mutex_init((pthread_mutex_t *)(v13 + 392), &v18);
  pthread_mutexattr_destroy(&v18);
  *((_QWORD *)v13 + 44) = 0;
  *((_QWORD *)v13 + 58) = 0;
  *((_DWORD *)v13 + 142) = 0;
  *((_QWORD *)v13 + 122) = 0;
  *((_QWORD *)v13 + 123) = v11;
  return v11;
}

void svc_xprt_destroy(void **a1)
{
  char *v2;
  uint64_t v3;
  void (*v4)(char *);
  uint64_t v5;
  void (*v6)(char *);

  v2 = (char *)a1[8];
  pthread_mutex_destroy((pthread_mutex_t *)(v2 + 264));
  pthread_mutex_destroy((pthread_mutex_t *)(v2 + 504));
  pthread_mutex_destroy((pthread_mutex_t *)(v2 + 392));
  v3 = *((_QWORD *)v2 + 44);
  if (v3)
  {
    v4 = *(void (**)(char *))(v3 + 56);
    if (v4)
      v4(v2 + 344);
  }
  v5 = *((_QWORD *)v2 + 58);
  if (v5)
  {
    v6 = *(void (**)(char *))(v5 + 56);
    if (v6)
      v6(v2 + 456);
  }
  free(a1[8]);
  free(a1);
}

uint64_t xprt_ref(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 64) + 264));
  v2 = *(_QWORD *)(a1 + 64);
  if ((*(_BYTE *)(v2 + 329) & 0x80) != 0)
  {
    v3 = 0;
  }
  else
  {
    ++*(_DWORD *)(v2 + 332);
    v3 = 1;
  }
  pthread_mutex_unlock((pthread_mutex_t *)(v2 + 264));
  return v3;
}

uint64_t xprt_unref(uint64_t a1)
{
  uint64_t v2;
  unsigned int v3;
  int v4;
  BOOL v5;

  pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 64) + 264));
  v2 = *(_QWORD *)(a1 + 64);
  v3 = *(_DWORD *)(v2 + 328) & 0x8000;
  v4 = *(_DWORD *)(v2 + 332) - 1;
  *(_DWORD *)(v2 + 332) = v4;
  pthread_mutex_unlock((pthread_mutex_t *)(v2 + 264));
  if (v4)
    v5 = 1;
  else
    v5 = v3 == 0;
  if (!v5)
    (*(void (**)(uint64_t))(*(_QWORD *)(a1 + 8) + 40))(a1);
  return (v3 >> 15) ^ 1;
}

void _newrpclib_xprt_register(int *a1)
{
  pthread_once(&oncrpc_xprt_init, svc_oncrpc_start);
  svc_armxprt(a1);
}

void svc_oncrpc_start()
{
  kevent64_s changelist;

  kq = kqueue();
  if (kq == -1)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      svc_oncrpc_start_cold_1();
    exit(1);
  }
  if (kq_control_fd == -1)
  {
    if (pipe(&kq_control_fd))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        svc_oncrpc_start_cold_3();
      abort();
    }
    fcntl(kq_control_fd, 4, 4);
    fcntl(dword_255D60294, 4, 4);
    changelist.ident = kq_control_fd;
    *(_DWORD *)&changelist.filter = 0x1FFFF;
    memset(&changelist.fflags, 0, 36);
    while (kevent64(kq, &changelist, 1, 0, 0, 0, 0))
    {
      if (*__error() != 4)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          svc_oncrpc_start_cold_2();
        return;
      }
    }
  }
}

void svc_armxprt(int *a1)
{
  uint64_t v2;
  unsigned __int8 *v3;
  kevent64_s changelist;

  v2 = *((_QWORD *)a1 + 8);
  changelist.ident = *a1;
  *(_QWORD *)&changelist.filter = 0x10081FFFFLL;
  changelist.data = 1;
  changelist.udata = (uint64_t)a1;
  v3 = (unsigned __int8 *)(v2 + 572);
  changelist.ext[0] = 0;
  changelist.ext[1] = 0;
  do
  {
    if (__ldaxr(v3))
    {
      __clrex();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        svc_armxprt_cold_3();
      warnx("** OOPS ** fd = %d, xprt = %p ** ALREADY ARMED **\n", *a1, a1);
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        svc_armxprt_cold_2();
      abort();
    }
  }
  while (__stlxr(1u, v3));
  while (kevent64(kq, &changelist, 1, 0, 0, 0, 0))
  {
    if (*__error() != 4)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        svc_armxprt_cold_1();
      break;
    }
  }
  wakeup_kq();
}

void svc_rmxprt(int *a1)
{
  uint64_t v1;
  kevent64_s v2;

  v1 = *((_QWORD *)a1 + 8);
  v2.ident = *a1;
  *(_QWORD *)&v2.filter = 196607;
  v2.data = 0;
  v2.udata = (uint64_t)a1;
  v2.ext[0] = 0;
  v2.ext[1] = 0;
  atomic_store(0, (unsigned __int8 *)(v1 + 572));
  while (kevent64(kq, &v2, 1, 0, 0, 0, 0))
  {
    if (*__error() != 4)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        svc_rmxprt_cold_1();
      break;
    }
  }
  wakeup_kq();
}

uint64_t svc_kq_control()
{
  return kq_control_fd;
}

ssize_t svc_clear_kq_control()
{
  ssize_t result;
  int v1;

  v1 = 0;
  do
    result = read(kq_control_fd, &v1, 4uLL);
  while ((int)result > 0);
  return result;
}

void wakeup_kq()
{
  int v0;
  int __buf;

  __buf = 0;
  v0 = write(dword_255D60294, &__buf, 4uLL);
  if (v0 != 4 && (v0 != -1 || *__error() != 35) && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    wakeup_kq_cold_1();
}

void svc_rearmxprt(int *a1, int a2)
{
  uint64_t v2;
  unsigned __int8 *v3;
  kevent64_s changelist;

  if (a2)
  {
    add_working_xprt((uint64_t)a1);
    wakeup_kq();
  }
  else
  {
    v2 = *((_QWORD *)a1 + 8);
    memset(&changelist, 0, sizeof(changelist));
    v3 = (unsigned __int8 *)(v2 + 572);
    do
    {
      if (__ldaxr(v3))
      {
        __clrex();
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          svc_rearmxprt_cold_3();
        warnx("** OOPS ** fd = %d, xprt = %p ** ALREADY ARMED **\n");
        return;
      }
    }
    while (__stlxr(1u, v3));
    if (*(_DWORD *)(*((_QWORD *)a1 + 8) + 336))
    {
      changelist.ident = *a1;
      *(_QWORD *)&changelist.filter = 327679;
      changelist.data = 0;
      changelist.udata = (uint64_t)a1;
      changelist.ext[0] = 0;
      changelist.ext[1] = 0;
      while (kevent64(kq, &changelist, 1, 0, 0, 0, 0))
      {
        if (*__error() != 4)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            svc_rearmxprt_cold_2();
          break;
        }
      }
      wakeup_kq();
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        svc_rearmxprt_cold_1();
      warnx("Trying to re-arm a dead export %p (%d)\n");
    }
  }
}

uint64_t svc_unarmxprt(uint64_t result)
{
  _DWORD *v1;
  unsigned __int8 *v2;
  int v3;

  v1 = (_DWORD *)result;
  v2 = (unsigned __int8 *)(*(_QWORD *)(result + 64) + 572);
  do
  {
    v3 = __ldaxr(v2);
    if (v3 != 1)
    {
      __clrex();
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        svc_unarmxprt_cold_2();
      warnx("** OOPS ** fd = %d, xprt = %p ** ALREADY DIS-ARMED **\n", *v1, v1);
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        svc_unarmxprt_cold_1();
      abort();
    }
  }
  while (__stlxr(0, v2));
  return result;
}

uint64_t _newrpclib_svc_register(uint64_t a1, unsigned int a2, unsigned int a3, uint64_t a4, int a5)
{
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;

  pthread_rwlock_wrlock(&svc_register_lock);
  v10 = (_QWORD *)svc_head;
  if (!svc_head)
  {
LABEL_5:
    v11 = calloc(1uLL, 0x18uLL);
    if (!v11)
      goto LABEL_19;
    v10 = v11;
    *((_DWORD *)v11 + 2) = a2;
    *((_DWORD *)v11 + 3) = a3;
    v12 = 1;
    v11[2] = a4;
    if (!a5)
    {
LABEL_8:
      if ((_DWORD)v12)
      {
        *v10 = svc_head;
        svc_head = (uint64_t)v10;
      }
      v12 = 1;
      goto LABEL_20;
    }
LABEL_7:
    if (!_newrpclib_rpcb_set(**(char ***)(a1 + 64), a2, a3, (char *)(*(_QWORD *)(a1 + 64) + 136))
      && (a5 != 17 && a5 != 6 || !_newrpclib_pmap_set(a2, a3, a5, *(unsigned __int16 *)(a1 + 4))))
    {
      if (!(_DWORD)v12)
        goto LABEL_20;
      free(v10);
LABEL_19:
      v12 = 0;
      goto LABEL_20;
    }
    goto LABEL_8;
  }
  while (*((_DWORD *)v10 + 2) != a2 || *((_DWORD *)v10 + 3) != a3)
  {
    v10 = (_QWORD *)*v10;
    if (!v10)
      goto LABEL_5;
  }
  v12 = 0;
  if (v10[2] == a4)
  {
    v12 = 0;
    if (!a5)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_20:
  pthread_rwlock_unlock(&svc_register_lock);
  return v12;
}

uint64_t _newrpclib_svc_unregister(int a1, int a2)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t *v6;

  pthread_rwlock_wrlock(&svc_register_lock);
  v4 = (uint64_t *)svc_head;
  if (svc_head)
  {
    v5 = 0;
    while (1)
    {
      v6 = v4;
      if (*((_DWORD *)v4 + 2) == a1 && *((_DWORD *)v4 + 3) == a2)
        break;
      v4 = (uint64_t *)*v4;
      v5 = v6;
      if (!*v6)
        return pthread_rwlock_unlock(&svc_register_lock);
    }
    if (!v5)
      v5 = &svc_head;
    *v5 = *v4;
    free(v4);
    _newrpclib_pmap_unset(a1, a2);
  }
  return pthread_rwlock_unlock(&svc_register_lock);
}

void *svc_get_thread_req()
{
  pthread_once(&create_key_init, (void (*)(void))create_svc_req_key);
  return pthread_getspecific(SVC_REQ_KEY);
}

uint64_t create_svc_req_key()
{
  return pthread_key_create((pthread_key_t *)&SVC_REQ_KEY, 0);
}

_QWORD *svc_req_clone(_QWORD *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  __int128 *v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  size_t v14;
  void *v15;

  v2 = calloc(1uLL, 0x2F0uLL);
  v3 = v2;
  if (v2)
  {
    memcpy(v2, a1, 0x2F0uLL);
    v4 = calloc(1uLL, 0x28uLL);
    v3[5] = v4;
    if (!v4)
    {
LABEL_15:
      free(v3);
      return 0;
    }
    v5 = (__int128 *)a1[5];
    v6 = *v5;
    v7 = v5[1];
    v4[4] = *((_QWORD *)v5 + 4);
    *(_OWORD *)v4 = v6;
    *((_OWORD *)v4 + 1) = v7;
    v8 = v3[5];
    *(_QWORD *)(v8 + 8) = 0;
    *(_QWORD *)(v8 + 32) = 0;
    v9 = a1[5];
    v10 = *(unsigned int *)(v9 + 24);
    if ((_DWORD)v10)
    {
      v11 = calloc(1uLL, 4 * v10);
      v12 = v3[5];
      *(_QWORD *)(v12 + 32) = v11;
      if (!v11)
      {
LABEL_10:
        if (*(_QWORD *)(v12 + 8))
        {
          free(*(void **)(v12 + 8));
          v12 = v3[5];
        }
        if (*(_DWORD *)(v12 + 24))
        {
          free(*(void **)(v12 + 32));
          v12 = v3[5];
        }
        free((void *)v12);
        goto LABEL_15;
      }
      memcpy(v11, *(const void **)(a1[5] + 32), 4 * *(unsigned int *)(a1[5] + 24));
      v9 = a1[5];
    }
    v13 = *(const char **)(v9 + 8);
    if (!v13)
    {
LABEL_9:
      xprt_ref(v3[6]);
      return v3;
    }
    v14 = strlen(v13) + 1;
    v15 = calloc(1uLL, v14);
    v12 = v3[5];
    *(_QWORD *)(v12 + 8) = v15;
    if (v15)
    {
      memcpy(v15, *(const void **)(a1[5] + 8), v14);
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  return v3;
}

void svc_req_destroy(_QWORD *a1)
{
  uint64_t v2;

  xprt_unref(a1[6]);
  v2 = a1[5];
  if (v2)
  {
    if (*(_QWORD *)(v2 + 8))
    {
      free(*(void **)(v2 + 8));
      v2 = a1[5];
    }
    if (*(_DWORD *)(v2 + 24))
    {
      free(*(void **)(v2 + 32));
      v2 = a1[5];
    }
    free((void *)v2);
  }
  free(a1);
}

_DWORD *_newrpclib_svc_sendreply(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _DWORD *result;
  int v6;
  int v7;
  _OWORD v8[2];
  __int128 v9;
  __int128 v10;

  pthread_once(&create_key_init, (void (*)(void))create_svc_req_key);
  result = pthread_getspecific(SVC_REQ_KEY);
  if (result)
  {
    memset(v8, 0, sizeof(v8));
    v9 = 0u;
    v10 = 0u;
    v6 = result[78];
    v7 = 1;
    *(_OWORD *)((char *)v8 + 8) = *((_OWORD *)result + 45);
    *((_QWORD *)&v8[1] + 1) = *((_QWORD *)result + 92);
    *((_QWORD *)&v9 + 1) = a3;
    *(_QWORD *)&v10 = a2;
    return (_DWORD *)(*(uint64_t (**)(void))(*(_QWORD *)(*((_QWORD *)result + 6) + 8) + 24))();
  }
  return result;
}

uint64_t _newrpclib_svc_reqsendreply(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  int v8;
  int v9;
  _OWORD v10[2];
  __int128 v11;
  __int128 v12;

  pthread_once(&create_key_init, (void (*)(void))create_svc_req_key);
  pthread_setspecific(SVC_REQ_KEY, (const void *)a1);
  memset(v10, 0, sizeof(v10));
  v11 = 0u;
  v12 = 0u;
  v8 = *(_DWORD *)(a1 + 312);
  v9 = 1;
  *(_OWORD *)((char *)v10 + 8) = *(_OWORD *)(a1 + 720);
  *((_QWORD *)&v10[1] + 1) = *(_QWORD *)(a1 + 736);
  *((_QWORD *)&v11 + 1) = a3;
  *(_QWORD *)&v12 = a2;
  v6 = (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))();
  pthread_once(&create_key_init, (void (*)(void))create_svc_req_key);
  pthread_setspecific(SVC_REQ_KEY, 0);
  return v6;
}

_DWORD *_newrpclib_svcerr_noproc()
{
  _DWORD *result;
  int v1;
  int v2;
  _OWORD v3[2];
  __int128 v4;
  __int128 v5;

  pthread_once(&create_key_init, (void (*)(void))create_svc_req_key);
  result = pthread_getspecific(SVC_REQ_KEY);
  if (result)
  {
    memset(v3, 0, sizeof(v3));
    v4 = 0u;
    v5 = 0u;
    v1 = result[78];
    v2 = 1;
    *(_OWORD *)((char *)v3 + 8) = *((_OWORD *)result + 45);
    *((_QWORD *)&v3[1] + 1) = *((_QWORD *)result + 92);
    LODWORD(v4) = 3;
    return (_DWORD *)(*(uint64_t (**)(void))(*(_QWORD *)(*((_QWORD *)result + 6) + 8) + 24))();
  }
  return result;
}

uint64_t _newrpclib_svcerr_reqnoproc(uint64_t a1)
{
  int v3;
  int v4;
  _OWORD v5[2];
  __int128 v6;
  __int128 v7;

  pthread_once(&create_key_init, (void (*)(void))create_svc_req_key);
  pthread_setspecific(SVC_REQ_KEY, (const void *)a1);
  memset(v5, 0, sizeof(v5));
  v6 = 0u;
  v7 = 0u;
  v3 = *(_DWORD *)(a1 + 312);
  v4 = 1;
  *(_OWORD *)((char *)v5 + 8) = *(_OWORD *)(a1 + 720);
  *((_QWORD *)&v5[1] + 1) = *(_QWORD *)(a1 + 736);
  LODWORD(v6) = 3;
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))();
  pthread_once(&create_key_init, (void (*)(void))create_svc_req_key);
  return pthread_setspecific(SVC_REQ_KEY, 0);
}

_DWORD *_newrpclib_svcerr_decode()
{
  _DWORD *result;
  int v1;
  int v2;
  _OWORD v3[2];
  __int128 v4;
  __int128 v5;

  pthread_once(&create_key_init, (void (*)(void))create_svc_req_key);
  result = pthread_getspecific(SVC_REQ_KEY);
  if (result)
  {
    memset(v3, 0, sizeof(v3));
    v4 = 0u;
    v5 = 0u;
    v1 = result[78];
    v2 = 1;
    *(_OWORD *)((char *)v3 + 8) = *((_OWORD *)result + 45);
    *((_QWORD *)&v3[1] + 1) = *((_QWORD *)result + 92);
    LODWORD(v4) = 4;
    return (_DWORD *)(*(uint64_t (**)(void))(*(_QWORD *)(*((_QWORD *)result + 6) + 8) + 24))();
  }
  return result;
}

uint64_t _newrpclib_svcerr_reqdecode(uint64_t a1)
{
  int v3;
  int v4;
  _OWORD v5[2];
  __int128 v6;
  __int128 v7;

  pthread_once(&create_key_init, (void (*)(void))create_svc_req_key);
  pthread_setspecific(SVC_REQ_KEY, (const void *)a1);
  memset(v5, 0, sizeof(v5));
  v6 = 0u;
  v7 = 0u;
  v3 = *(_DWORD *)(a1 + 312);
  v4 = 1;
  *(_OWORD *)((char *)v5 + 8) = *(_OWORD *)(a1 + 720);
  *((_QWORD *)&v5[1] + 1) = *(_QWORD *)(a1 + 736);
  LODWORD(v6) = 4;
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))();
  pthread_once(&create_key_init, (void (*)(void))create_svc_req_key);
  return pthread_setspecific(SVC_REQ_KEY, 0);
}

_DWORD *_newrpclib_svcerr_systemerr()
{
  _DWORD *result;
  int v1;
  int v2;
  _OWORD v3[2];
  __int128 v4;
  __int128 v5;

  pthread_once(&create_key_init, (void (*)(void))create_svc_req_key);
  result = pthread_getspecific(SVC_REQ_KEY);
  if (result)
  {
    memset(v3, 0, sizeof(v3));
    v4 = 0u;
    v5 = 0u;
    v1 = result[78];
    v2 = 1;
    *(_OWORD *)((char *)v3 + 8) = *((_OWORD *)result + 45);
    *((_QWORD *)&v3[1] + 1) = *((_QWORD *)result + 92);
    LODWORD(v4) = 5;
    return (_DWORD *)(*(uint64_t (**)(void))(*(_QWORD *)(*((_QWORD *)result + 6) + 8) + 24))();
  }
  return result;
}

uint64_t _newrpclib_svcerr_reqsystemerr(uint64_t a1)
{
  int v3;
  int v4;
  _OWORD v5[2];
  __int128 v6;
  __int128 v7;

  pthread_once(&create_key_init, (void (*)(void))create_svc_req_key);
  pthread_setspecific(SVC_REQ_KEY, (const void *)a1);
  memset(v5, 0, sizeof(v5));
  v6 = 0u;
  v7 = 0u;
  v3 = *(_DWORD *)(a1 + 312);
  v4 = 1;
  *(_OWORD *)((char *)v5 + 8) = *(_OWORD *)(a1 + 720);
  *((_QWORD *)&v5[1] + 1) = *(_QWORD *)(a1 + 736);
  LODWORD(v6) = 5;
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))();
  pthread_once(&create_key_init, (void (*)(void))create_svc_req_key);
  return pthread_setspecific(SVC_REQ_KEY, 0);
}

_DWORD *_newrpclib_svcerr_auth(uint64_t a1, int a2)
{
  _DWORD *result;
  int v4;
  _BYTE v5[20];
  __int128 v6;
  __int128 v7;
  __int128 v8;

  pthread_once(&create_key_init, (void (*)(void))create_svc_req_key);
  result = pthread_getspecific(SVC_REQ_KEY);
  if (result)
  {
    *(_OWORD *)&v5[4] = 0u;
    v6 = 0u;
    v7 = 0u;
    v8 = 0u;
    v4 = result[78];
    *(_QWORD *)v5 = 0x100000001;
    *(_DWORD *)&v5[12] = 1;
    *(_DWORD *)&v5[16] = a2;
    return (_DWORD *)(*(uint64_t (**)(void))(*(_QWORD *)(*((_QWORD *)result + 6) + 8) + 24))();
  }
  return result;
}

uint64_t _newrpclib_svcerr_reqauth(uint64_t a1, int a2)
{
  int v5;
  _BYTE v6[20];
  __int128 v7;
  __int128 v8;
  __int128 v9;

  pthread_once(&create_key_init, (void (*)(void))create_svc_req_key);
  pthread_setspecific(SVC_REQ_KEY, (const void *)a1);
  *(_OWORD *)&v6[4] = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v5 = *(_DWORD *)(a1 + 312);
  *(_QWORD *)v6 = 0x100000001;
  *(_DWORD *)&v6[12] = 1;
  *(_DWORD *)&v6[16] = a2;
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))();
  pthread_once(&create_key_init, (void (*)(void))create_svc_req_key);
  return pthread_setspecific(SVC_REQ_KEY, 0);
}

_DWORD *_newrpclib_svcerr_weakauth(uint64_t a1)
{
  return _newrpclib_svcerr_auth(a1, 5);
}

uint64_t _newrpclib_svcerr_reqweakauth(uint64_t a1)
{
  return _newrpclib_svcerr_reqauth(a1, 5);
}

_DWORD *_newrpclib_svcerr_noprog()
{
  _DWORD *result;
  int v1;
  int v2;
  _OWORD v3[2];
  __int128 v4;
  __int128 v5;

  pthread_once(&create_key_init, (void (*)(void))create_svc_req_key);
  result = pthread_getspecific(SVC_REQ_KEY);
  if (result)
  {
    memset(v3, 0, sizeof(v3));
    v4 = 0u;
    v5 = 0u;
    v1 = result[78];
    v2 = 1;
    *(_OWORD *)((char *)v3 + 8) = *((_OWORD *)result + 45);
    *((_QWORD *)&v3[1] + 1) = *((_QWORD *)result + 92);
    LODWORD(v4) = 1;
    return (_DWORD *)(*(uint64_t (**)(void))(*(_QWORD *)(*((_QWORD *)result + 6) + 8) + 24))();
  }
  return result;
}

uint64_t _newrpclib_svcerr_reqnoprog(uint64_t a1)
{
  int v3;
  int v4;
  _OWORD v5[2];
  __int128 v6;
  __int128 v7;

  pthread_once(&create_key_init, (void (*)(void))create_svc_req_key);
  pthread_setspecific(SVC_REQ_KEY, (const void *)a1);
  memset(v5, 0, sizeof(v5));
  v6 = 0u;
  v7 = 0u;
  v3 = *(_DWORD *)(a1 + 312);
  v4 = 1;
  *(_OWORD *)((char *)v5 + 8) = *(_OWORD *)(a1 + 720);
  *((_QWORD *)&v5[1] + 1) = *(_QWORD *)(a1 + 736);
  LODWORD(v6) = 3;
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))();
  pthread_once(&create_key_init, (void (*)(void))create_svc_req_key);
  return pthread_setspecific(SVC_REQ_KEY, 0);
}

_DWORD *_newrpclib_svcerr_progvers(uint64_t a1, unsigned int a2, unsigned int a3)
{
  _DWORD *result;
  int v6;
  int v7;
  _OWORD v8[2];
  __int128 v9;
  __int128 v10;

  pthread_once(&create_key_init, (void (*)(void))create_svc_req_key);
  result = pthread_getspecific(SVC_REQ_KEY);
  if (result)
  {
    memset(v8, 0, sizeof(v8));
    v9 = 0u;
    v10 = 0u;
    v6 = result[78];
    v7 = 1;
    *(_OWORD *)((char *)v8 + 8) = *((_OWORD *)result + 45);
    *((_QWORD *)&v8[1] + 1) = *((_QWORD *)result + 92);
    LODWORD(v9) = 2;
    *((_QWORD *)&v9 + 1) = __PAIR64__(a3, a2);
    return (_DWORD *)(*(uint64_t (**)(void))(*(_QWORD *)(*((_QWORD *)result + 6) + 8) + 24))();
  }
  return result;
}

uint64_t _newrpclib_svcerr_reqprogvers(uint64_t a1, unsigned int a2, unsigned int a3)
{
  int v7;
  int v8;
  _OWORD v9[2];
  __int128 v10;
  __int128 v11;

  pthread_once(&create_key_init, (void (*)(void))create_svc_req_key);
  pthread_setspecific(SVC_REQ_KEY, (const void *)a1);
  memset(v9, 0, sizeof(v9));
  v10 = 0u;
  v11 = 0u;
  v7 = *(_DWORD *)(a1 + 312);
  v8 = 1;
  *(_OWORD *)((char *)v9 + 8) = *(_OWORD *)(a1 + 720);
  *((_QWORD *)&v9[1] + 1) = *(_QWORD *)(a1 + 736);
  LODWORD(v10) = 2;
  *((_QWORD *)&v10 + 1) = __PAIR64__(a3, a2);
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))();
  pthread_once(&create_key_init, (void (*)(void))create_svc_req_key);
  return pthread_setspecific(SVC_REQ_KEY, 0);
}

uint64_t _newrpclib_svc_getsomerequests(uint64_t a1, int a2)
{
  _QWORD *v4;
  uint64_t v5;
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
  uint64_t v18;
  int v19;
  uint64_t v20;
  int v21;
  int v22;
  uint64_t v23;
  int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  void (*v31)(uint64_t *, uint64_t);
  uint64_t v32;
  _BYTE v34[48];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  _BYTE v38[400];
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  __int128 v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
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
  int v63;
  unsigned int v64;
  int v65;
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  bzero(v38, 0x4B0uLL);
  v4 = &unk_255D60000;
  while (1)
  {
    bzero(&v41, 0x2F0uLL);
    v35 = 0;
    v36 = &v39;
    v37 = 0;
    memset(v34, 0, 32);
    *(_OWORD *)&v34[32] = (unint64_t)v38;
    v45 = &v40;
    pthread_once(&create_key_init, (void (*)(void))create_svc_req_key);
    pthread_setspecific(v4[140], &v41);
    if (!(**(unsigned int (***)(uint64_t, _BYTE *))(a1 + 8))(a1, v34))
      goto LABEL_26;
    v41 = *(_QWORD *)&v34[12];
    v42 = *(_DWORD *)&v34[20];
    v44 = *(_QWORD *)&v34[40];
    v43 = *(_OWORD *)&v34[24];
    v63 = *(_DWORD *)v34;
    v46 = a1;
    v5 = *(_QWORD *)(a1 + 64);
    v6 = *(_OWORD *)(v5 + 72);
    v7 = *(_OWORD *)(v5 + 88);
    v8 = *(_OWORD *)(v5 + 120);
    v53 = *(_OWORD *)(v5 + 104);
    v54 = v8;
    v52 = v7;
    v9 = *(_OWORD *)(v5 + 24);
    v10 = *(_OWORD *)(v5 + 8);
    v11 = *(_OWORD *)(v5 + 56);
    v49 = *(_OWORD *)(v5 + 40);
    v50 = v11;
    v47 = v10;
    v48 = v9;
    v51 = v6;
    v12 = *(_OWORD *)(v5 + 136);
    v13 = *(_OWORD *)(v5 + 152);
    v14 = *(_OWORD *)(v5 + 184);
    v57 = *(_OWORD *)(v5 + 168);
    v58 = v14;
    v55 = v12;
    v56 = v13;
    v15 = *(_OWORD *)(v5 + 200);
    v16 = *(_OWORD *)(v5 + 216);
    v17 = *(_OWORD *)(v5 + 248);
    v61 = *(_OWORD *)(v5 + 232);
    v62 = v17;
    v59 = v15;
    v60 = v16;
    v64 = 2;
    v65 = 2 * (a2 == 1);
    v18 = _newrpclib__authenticate((uint64_t)&v41, (uint64_t)v34);
    if ((_DWORD)v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)(a1 + 64);
      if ((*(_BYTE *)(v20 + 328) & 4) != 0)
        v18 = pthread_mutex_unlock((pthread_mutex_t *)(v20 + 392));
      _newrpclib_svcerr_auth(v18, v19);
      goto LABEL_26;
    }
    v21 = v41;
    v22 = HIDWORD(v41);
    pthread_rwlock_rdlock(&svc_register_lock);
    v23 = svc_head;
    if (!svc_head)
    {
      v24 = 0;
      v25 = 0;
      v26 = -1;
LABEL_19:
      pthread_rwlock_unlock(&svc_register_lock);
      goto LABEL_20;
    }
    v24 = 0;
    v25 = 0;
    v26 = -1;
    while (*(_DWORD *)(v23 + 8) != v21)
    {
LABEL_16:
      v23 = *(_QWORD *)v23;
      if (!v23)
        goto LABEL_19;
    }
    v27 = *(_DWORD *)(v23 + 12);
    if (v27 != v22)
    {
      if (v27 < v26)
        v26 = *(_DWORD *)(v23 + 12);
      if (v27 > v25)
        v25 = *(_DWORD *)(v23 + 12);
      v24 = 1;
      goto LABEL_16;
    }
    v31 = *(void (**)(uint64_t *, uint64_t))(v23 + 16);
    pthread_rwlock_unlock(&svc_register_lock);
    if (!v31)
    {
      v24 = 1;
LABEL_20:
      v28 = *(_QWORD *)(a1 + 64);
      if ((*(_BYTE *)(v28 + 328) & 4) != 0)
        pthread_mutex_unlock((pthread_mutex_t *)(v28 + 392));
      if (v24)
        _newrpclib_svcerr_reqprogvers((uint64_t)&v41, v26, v25);
      else
        _newrpclib_svcerr_reqnoprog((uint64_t)&v41);
      v4 = &unk_255D60000;
      goto LABEL_26;
    }
    v31(&v41, a1);
    v32 = *(_QWORD *)(a1 + 64);
    v4 = (_QWORD *)&unk_255D60000;
    if ((*(_BYTE *)(v32 + 328) & 4) != 0 && (v65 & 1) == 0)
      pthread_mutex_unlock((pthread_mutex_t *)(v32 + 392));
LABEL_26:
    v29 = v64;
    if (!v64)
      break;
    v30 = v65;
    if ((v65 & 1) == 0)
    {
      v65 |= 1u;
      if ((v30 & 2) != 0)
        svc_rearmxprt((int *)a1, v64 == 1);
    }
    if (!--a2 || (_DWORD)v29 != 1)
    {
      if (a2)
        svc_rearmxprt((int *)a1, v29 == 1);
      break;
    }
  }
  pthread_once(&create_key_init, (void (*)(void))create_svc_req_key);
  pthread_setspecific(v4[140], 0);
  xprt_unref(a1);
  return v29;
}

void _newrpclib_svc_enable_localaddr(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;

  v7 = 0;
  v8 = 1;
  v2 = a1 + 64;
  v3 = **(char ***)(a1 + 64);
  v6 = 0;
  if (_newrpclib_netid2socparms(v3, &v7, 0, &v6, 0))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      _newrpclib_svc_enable_localaddr_cold_3();
    return;
  }
  if (v7 == 2)
  {
    v5 = 0;
    v4 = 26;
    goto LABEL_8;
  }
  if (v7 == 30)
  {
    v4 = 61;
    v5 = 41;
LABEL_8:
    if (v6 == 17 && setsockopt(*(_DWORD *)a1, v5, v4, &v8, 4u))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        _newrpclib_svc_enable_localaddr_cold_2();
    }
    else
    {
      *(_DWORD *)(*(_QWORD *)v2 + 328) |= 0x10u;
    }
    return;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    _newrpclib_svc_enable_localaddr_cold_1();
}

uint64_t _newrpclib_svc_getnetid(uint64_t a1)
{
  return **(_QWORD **)(a1 + 64);
}

uint64_t _newrpclib_svc_getcaller_sa(uint64_t a1)
{
  return *(_QWORD *)(a1 + 64) + 8;
}

uint64_t _newrpclib_svc_getcallee_sa(uint64_t a1)
{
  return *(_QWORD *)(a1 + 64) + 136;
}

void OUTLINED_FUNCTION_4_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x2Cu);
}

void OUTLINED_FUNCTION_12(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

void OUTLINED_FUNCTION_15(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

uint64_t _newrpclib_xdr_array(uint64_t (***a1)(void), void **a2, int *a3, unsigned int a4, unsigned int a5, uint64_t (*a6)(uint64_t (***)(void), char *))
{
  char *v12;
  unsigned int v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;

  v12 = (char *)*a2;
  if (!_newrpclib_xdr_u_int(a1, a3))
    return 0;
  v13 = *a3;
  if ((v13 > a4 || ((a5 * (unint64_t)v13) & 0xFFFFFFFF00000000) != 0) && *(_DWORD *)a1 != 2)
    return 0;
  if (v12)
    goto LABEL_6;
  if (*(_DWORD *)a1 == 2)
    return 1;
  if (*(_DWORD *)a1 == 1)
  {
    if (v13)
    {
      v18 = (char *)calloc(1uLL, v13 * a5);
      *a2 = v18;
      if (v18)
      {
        v12 = v18;
        bzero(v18, v13 * a5);
LABEL_7:
        v14 = a5;
        v15 = 1;
        do
        {
          v16 = a6(a1, v12);
          v17 = v16;
          if (v15 >= v13)
            break;
          v12 += v14;
          ++v15;
        }
        while ((_DWORD)v16);
        goto LABEL_17;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        _newrpclib_xdr_array_cold_1();
      return 0;
    }
    return 1;
  }
LABEL_6:
  if (v13)
    goto LABEL_7;
  v17 = 1;
LABEL_17:
  if (*(_DWORD *)a1 == 2)
  {
    free(*a2);
    *a2 = 0;
  }
  return v17;
}

uint64_t _newrpclib_xdr_vector(uint64_t a1, uint64_t a2, int a3, unsigned int a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  int v6;
  uint64_t v9;
  uint64_t result;

  if (!a3)
    return 1;
  v6 = a3;
  v9 = a4;
  while (1)
  {
    result = a5(a1, a2);
    if (!(_DWORD)result)
      break;
    a2 += v9;
    if (!--v6)
      return 1;
  }
  return result;
}

uint64_t _newrpclib_xdr_float(uint64_t (***a1)(void), int *a2)
{
  int v2;
  uint64_t result;
  int v5;
  int v6;

  v2 = *(_DWORD *)a1;
  if (*(_DWORD *)a1 == 2)
    return 1;
  if (v2 == 1)
  {
    v6 = 0;
    result = (*a1[1])();
    if (!(_DWORD)result)
      return result;
    *a2 = v6;
    return 1;
  }
  if (v2)
    return 0;
  v5 = *a2;
  return a1[1][1]();
}

uint64_t _newrpclib_xdr_double(int *a1, int *a2)
{
  int v2;
  uint64_t result;
  int v6;

  v2 = *a1;
  if (*a1 == 2)
    return 1;
  if (v2 != 1)
  {
    if (v2)
      return 0;
    v6 = a2[1];
    result = (*(uint64_t (**)(int *, int *))(*((_QWORD *)a1 + 1) + 8))(a1, &v6);
    if ((_DWORD)result)
    {
      v6 = *a2;
      return (*(uint64_t (**)(int *, int *))(*((_QWORD *)a1 + 1) + 8))(a1, &v6);
    }
    return result;
  }
  v6 = 0;
  result = (**((uint64_t (***)(int *, int *))a1 + 1))(a1, &v6);
  if ((_DWORD)result)
  {
    a2[1] = v6;
    v6 = 0;
    result = (**((uint64_t (***)(int *, int *))a1 + 1))(a1, &v6);
    if ((_DWORD)result)
    {
      *a2 = v6;
      return 1;
    }
  }
  return result;
}

uint64_t _newrpclib_xdrmem_create(uint64_t result, uint64_t a2, int a3, int a4)
{
  uint64_t (**v4)();

  *(_DWORD *)result = a4;
  v4 = xdrmem_ops_unaligned;
  if ((a2 & 3) == 0)
    v4 = xdrmem_ops_aligned;
  *(_QWORD *)(result + 8) = v4;
  *(_QWORD *)(result + 24) = a2;
  *(_QWORD *)(result + 32) = a2;
  *(_DWORD *)(result + 40) = a3;
  return result;
}

uint64_t xdrmem_getrecord(int *a1, uint64_t *a2, int *a3)
{
  size_t v4;
  uint64_t result;
  int v8;

  *a2 = 0;
  *a3 = 0;
  v4 = a1[10];
  if (!(_DWORD)v4)
    return 1;
  result = (uint64_t)calloc(1uLL, v4);
  *a2 = result;
  if (result)
  {
    v8 = a1[10];
    *a3 = v8;
    return _newrpclib_xdr_opaque(a1, result, v8);
  }
  return result;
}

BOOL xdr_is_memstream(uint64_t a1)
{
  uint64_t (**v1)();

  v1 = *(uint64_t (***)())(a1 + 8);
  return v1 == xdrmem_ops_aligned || v1 == xdrmem_ops_unaligned;
}

uint64_t xdrmem_getlong_unaligned(uint64_t a1, _DWORD *a2)
{
  unsigned int v2;
  BOOL v3;
  unsigned int v4;
  unsigned int *v6;

  v2 = *(_DWORD *)(a1 + 40);
  v3 = v2 >= 4;
  v4 = v2 - 4;
  if (!v3)
    return 0;
  *(_DWORD *)(a1 + 40) = v4;
  v6 = *(unsigned int **)(a1 + 24);
  *a2 = bswap32(*v6);
  *(_QWORD *)(a1 + 24) = v6 + 1;
  return 1;
}

uint64_t xdrmem_putlong_unaligned(uint64_t a1, unsigned int *a2)
{
  unsigned int v2;
  BOOL v3;
  unsigned int v4;

  v2 = *(_DWORD *)(a1 + 40);
  v3 = v2 >= 4;
  v4 = v2 - 4;
  if (!v3)
    return 0;
  *(_DWORD *)(a1 + 40) = v4;
  **(_DWORD **)(a1 + 24) = bswap32(*a2);
  *(_QWORD *)(a1 + 24) += 4;
  return 1;
}

uint64_t xdrmem_getbytes(uint64_t a1, void *__dst, size_t __len)
{
  unsigned int v3;
  BOOL v4;
  int v5;
  unsigned int v7;

  v3 = *(_DWORD *)(a1 + 40);
  v4 = v3 >= __len;
  v5 = v3 - __len;
  if (!v4)
    return 0;
  v7 = __len;
  *(_DWORD *)(a1 + 40) = v5;
  memmove(__dst, *(const void **)(a1 + 24), __len);
  *(_QWORD *)(a1 + 24) += v7;
  return 1;
}

uint64_t xdrmem_putbytes(uint64_t a1, const void *a2, size_t __len)
{
  unsigned int v3;
  BOOL v4;
  int v5;
  unsigned int v7;

  v3 = *(_DWORD *)(a1 + 40);
  v4 = v3 >= __len;
  v5 = v3 - __len;
  if (!v4)
    return 0;
  v7 = __len;
  *(_DWORD *)(a1 + 40) = v5;
  memmove(*(void **)(a1 + 24), a2, __len);
  *(_QWORD *)(a1 + 24) += v7;
  return 1;
}

uint64_t xdrmem_getpos(uint64_t a1)
{
  if ((uint64_t)(*(_QWORD *)(a1 + 24) - *(_QWORD *)(a1 + 32)) >= 0xFFFFFFFFLL)
    return 0xFFFFFFFFLL;
  else
    return *(_QWORD *)(a1 + 24) - *(_QWORD *)(a1 + 32);
}

uint64_t xdrmem_setpos(uint64_t a1, unsigned int a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 32) + a2;
  v3 = *(_QWORD *)(a1 + 24) + *(unsigned int *)(a1 + 40);
  if (v2 > v3)
    return 0;
  *(_QWORD *)(a1 + 24) = v2;
  v4 = v3 - v2;
  if (v4 > 0xFFFFFFFFLL)
    return 0;
  *(_DWORD *)(a1 + 40) = v4;
  return 1;
}

uint64_t xdrmem_inline_unaligned()
{
  return 0;
}

uint64_t xdrmem_getlong_aligned(uint64_t a1, _DWORD *a2)
{
  unsigned int v2;
  BOOL v3;
  unsigned int v4;
  unsigned int *v6;

  v2 = *(_DWORD *)(a1 + 40);
  v3 = v2 >= 4;
  v4 = v2 - 4;
  if (!v3)
    return 0;
  *(_DWORD *)(a1 + 40) = v4;
  v6 = *(unsigned int **)(a1 + 24);
  *a2 = bswap32(*v6);
  *(_QWORD *)(a1 + 24) = v6 + 1;
  return 1;
}

uint64_t xdrmem_putlong_aligned(uint64_t a1, unsigned int *a2)
{
  unsigned int v2;
  BOOL v3;
  unsigned int v4;
  _DWORD *v6;

  v2 = *(_DWORD *)(a1 + 40);
  v3 = v2 >= 4;
  v4 = v2 - 4;
  if (!v3)
    return 0;
  *(_DWORD *)(a1 + 40) = v4;
  v6 = *(_DWORD **)(a1 + 24);
  *v6 = bswap32(*a2);
  *(_QWORD *)(a1 + 24) = v6 + 1;
  return 1;
}

uint64_t xdrmem_inline_aligned(uint64_t a1, unsigned int a2)
{
  unsigned int v2;
  BOOL v3;
  unsigned int v4;
  uint64_t v5;

  v2 = *(_DWORD *)(a1 + 40);
  v3 = v2 >= a2;
  v4 = v2 - a2;
  if (!v3)
    return 0;
  *(_DWORD *)(a1 + 40) = v4;
  v5 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v5 + a2;
  return v5;
}

uint64_t xdrrec_getlong(uint64_t a1, _DWORD *a2)
{
  uint64_t v3;
  unsigned int *v4;
  uint64_t result;
  unsigned int __dst;

  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(unsigned int **)(v3 + 80);
  __dst = 0;
  if (*(_DWORD *)(v3 + 96) < 4u || (uint64_t)(*(_QWORD *)(v3 + 88) - (_QWORD)v4) < 4)
  {
    result = xdrrec_getbytes(a1, (char *)&__dst, 4u);
    if (!(_DWORD)result)
      return result;
    *a2 = bswap32(__dst);
  }
  else
  {
    *a2 = bswap32(*v4);
    *(_DWORD *)(v3 + 96) -= 4;
    *(_QWORD *)(v3 + 80) = v4 + 1;
  }
  return 1;
}

uint64_t xdrrec_putlong(uint64_t a1, unsigned int *a2)
{
  uint64_t v3;
  _DWORD *v4;
  unint64_t v5;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(_DWORD **)(v3 + 24);
  v5 = *(_QWORD *)(v3 + 32);
  *(_QWORD *)(v3 + 24) = v4 + 1;
  if ((unint64_t)(v4 + 1) > v5)
  {
    *(_QWORD *)(v3 + 24) = v4;
    *(_DWORD *)(v3 + 48) = 1;
    result = flush_out(v3, 0);
    if (!(_DWORD)result)
      return result;
    v4 = *(_DWORD **)(v3 + 24);
    *(_QWORD *)(v3 + 24) = v4 + 1;
  }
  *v4 = bswap32(*a2);
  return 1;
}

uint64_t xdrrec_getbytes(uint64_t a1, char *__dst, unsigned int a3)
{
  unsigned int v3;
  _DWORD *v5;
  unsigned int v6;
  uint64_t result;
  size_t v8;

  if (!a3)
    return 1;
  v3 = a3;
  v5 = *(_DWORD **)(a1 + 24);
  while (1)
  {
    while (1)
    {
      v6 = v5[24];
      if (!v6)
        break;
      if (v3 >= v6)
        v8 = v6;
      else
        v8 = v3;
      result = get_input_bytes((uint64_t)v5, __dst, v8);
      if ((_DWORD)result)
      {
        __dst += v8;
        v5[24] -= v8;
        result = 1;
        v3 -= v8;
        if (v3)
          continue;
      }
      return result;
    }
    if (v5[25])
      break;
    result = set_input_fragment(v5);
    if (!(_DWORD)result)
      return result;
  }
  return 0;
}

uint64_t xdrrec_putbytes(uint64_t a1, char *__src, unsigned int a3)
{
  uint64_t v3;
  unsigned int v4;
  uint64_t v6;
  void *v7;
  size_t v8;
  uint64_t v9;
  size_t v10;

  v3 = 1;
  if (a3)
  {
    v4 = a3;
    v6 = *(_QWORD *)(a1 + 24);
    while (1)
    {
      v7 = *(void **)(v6 + 24);
      v8 = *(_QWORD *)(v6 + 32) - (_QWORD)v7 >= (unint64_t)v4 ? v4 : *(_QWORD *)(v6 + 32) - (_QWORD)v7;
      memmove(v7, __src, v8);
      v9 = *(_QWORD *)(v6 + 32);
      v10 = *(_QWORD *)(v6 + 24) + v8;
      *(_QWORD *)(v6 + 24) = v10;
      if (v10 == v9)
      {
        *(_DWORD *)(v6 + 48) = 1;
        if (!flush_out(v6, 0))
          break;
      }
      __src += v8;
      v4 -= v8;
      if (!v4)
        return 1;
    }
    return 0;
  }
  return v3;
}

off_t xdrrec_getpos(uint64_t a1)
{
  uint64_t v2;
  off_t result;

  v2 = *(_QWORD *)(a1 + 24);
  result = lseek(**(_DWORD **)v2, 0, 1);
  if (result != -1)
  {
    if (*(_DWORD *)a1 == 1)
    {
      return result - *(_QWORD *)(v2 + 88) + *(_QWORD *)(v2 + 80);
    }
    else if (*(_DWORD *)a1)
    {
      return -1;
    }
    else
    {
      return result + *(_QWORD *)(v2 + 24) - *(_QWORD *)(v2 + 16);
    }
  }
  return result;
}

uint64_t xdrrec_setpos(uint64_t a1, int a2)
{
  uint64_t v4;
  int v5;
  int v6;
  unint64_t v7;
  int v8;
  BOOL v9;
  int v10;
  unint64_t v11;

  v4 = *(_QWORD *)(a1 + 24);
  v5 = xdrrec_getpos(a1);
  if (v5 == -1)
    return 0;
  v6 = v5 - a2;
  if (*(_DWORD *)a1 == 1)
  {
    v8 = *(_DWORD *)(v4 + 96);
    v9 = __OFSUB__(v8, v6);
    v10 = v8 - v6;
    if (!((v10 < 0) ^ v9 | (v10 == 0)))
    {
      v11 = *(_QWORD *)(v4 + 80) - v6;
      if (v11 <= *(_QWORD *)(v4 + 88) && v11 >= *(_QWORD *)(v4 + 72))
      {
        *(_QWORD *)(v4 + 80) = v11;
        *(_DWORD *)(v4 + 96) = v10;
        return 1;
      }
    }
    return 0;
  }
  if (*(_DWORD *)a1)
    return 0;
  v7 = *(_QWORD *)(v4 + 24) - v6;
  if (v7 <= *(_QWORD *)(v4 + 40) || v7 >= *(_QWORD *)(v4 + 32))
    return 0;
  *(_QWORD *)(v4 + 24) = v7;
  return 1;
}

uint64_t xdrrec_inline(uint64_t a1, unsigned int a2)
{
  uint64_t v2;
  uint64_t result;
  unint64_t v4;
  unsigned int v5;
  BOOL v6;
  unsigned int v7;
  unint64_t v8;

  v2 = *(_QWORD *)(a1 + 24);
  if (*(_DWORD *)a1 != 1)
  {
    if (!*(_DWORD *)a1)
    {
      result = *(_QWORD *)(v2 + 24);
      v4 = result + a2;
      if (v4 <= *(_QWORD *)(v2 + 32))
      {
        *(_QWORD *)(v2 + 24) = v4;
        return result;
      }
    }
    return 0;
  }
  v5 = *(_DWORD *)(v2 + 96);
  v6 = v5 >= a2;
  v7 = v5 - a2;
  if (!v6)
    return 0;
  result = *(_QWORD *)(v2 + 80);
  v8 = result + a2;
  if (v8 > *(_QWORD *)(v2 + 88))
    return 0;
  *(_DWORD *)(v2 + 96) = v7;
  *(_QWORD *)(v2 + 80) = v8;
  return result;
}

void xdrrec_destroy(uint64_t a1)
{
  void **v1;

  v1 = *(void ***)(a1 + 24);
  free(v1[2]);
  free(v1[9]);
  free(v1);
}

void _newrpclib_xdrrec_create(uint64_t a1, unsigned int a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  char *v12;
  char *v13;
  size_t v14;
  void *v15;
  size_t v16;
  char *v17;
  uint64_t v18;

  v12 = (char *)calloc(1uLL, 0x98uLL);
  if (v12)
  {
    v13 = v12;
    if (a2 >= 0x64)
      v14 = (a2 + 3) & 0xFFFFFFFC;
    else
      v14 = 4000;
    *((_DWORD *)v12 + 26) = v14;
    v15 = calloc(1uLL, v14);
    *((_QWORD *)v13 + 2) = v15;
    if (v15)
    {
      if (a3 >= 0x64)
        v16 = (a3 + 3) & 0xFFFFFFFC;
      else
        v16 = 4000;
      *((_DWORD *)v13 + 27) = v16;
      v17 = (char *)calloc(1uLL, v16);
      *((_QWORD *)v13 + 9) = v17;
      if (v17)
      {
        *(_QWORD *)(a1 + 8) = xdrrec_ops;
        *(_QWORD *)(a1 + 24) = v13;
        *(_QWORD *)v13 = a4;
        *((_QWORD *)v13 + 1) = a6;
        v18 = *((_QWORD *)v13 + 2);
        *((_QWORD *)v13 + 5) = v18;
        *((_QWORD *)v13 + 3) = v18 + 4;
        *((_QWORD *)v13 + 4) = v18 + v14;
        *((_DWORD *)v13 + 12) = 0;
        *((_QWORD *)v13 + 7) = a5;
        *((_QWORD *)v13 + 8) = v16;
        *((_QWORD *)v13 + 10) = &v17[v16];
        *((_QWORD *)v13 + 11) = &v17[v16];
        *((_QWORD *)v13 + 12) = 0x100000000;
        *((_QWORD *)v13 + 16) = v13 + 120;
        *((_QWORD *)v13 + 14) = 0;
        *((_QWORD *)v13 + 17) = 0;
        *((_DWORD *)v13 + 36) = 0;
        return;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        _newrpclib_xdrrec_create_cold_3();
      free(*((void **)v13 + 2));
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      _newrpclib_xdrrec_create_cold_2();
    }
    free(v13);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    _newrpclib_xdrrec_create_cold_1();
  }
}

BOOL xdrrec_isrecordstart(uint64_t a1)
{
  uint64_t v1;
  int v2;
  const char *v4;
  const char *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 24);
  v2 = *(_DWORD *)(v1 + 96);
  if (!v2 && *(_DWORD *)(v1 + 100))
    return *(_DWORD *)(v1 + 100) != 0;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    if (*(_DWORD *)(v1 + 100))
      v4 = "true";
    else
      v4 = "false";
    *(_DWORD *)buf = 136316162;
    v7 = "/Library/Caches/com.apple.xbs/Sources/oncrpc/Oncrpc/xdr_rec.c";
    v8 = 1024;
    v9 = 457;
    v10 = 2080;
    v11 = "xdrrec_isrecordstart";
    v12 = 1024;
    v13 = v2;
    v14 = 2080;
    v15 = v4;
    _os_log_error_impl(&dword_22D0E3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d in %s, Exptected to be at record start. Fbtbc = %d last fragment = %s\n\n", buf, 0x2Cu);
    v2 = *(_DWORD *)(v1 + 96);
  }
  v5 = *(_DWORD *)(v1 + 100) ? "true" : "false";
  warnx("Exptected to be at record start. Fbtbc = %d last fragment = %s\n\n", v2, v5);
  return !*(_DWORD *)(v1 + 96) && *(_DWORD *)(v1 + 100) != 0;
}

uint64_t _newrpclib_xdrrec_skiprecord(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  int v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t result;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  size_t v13;

  v1 = *(_QWORD **)(a1 + 24);
  if (!*((_DWORD *)v1 + 28))
  {
    while (1)
    {
      v7 = *((_DWORD *)v1 + 24);
      if (!v7)
      {
        if (*((_DWORD *)v1 + 25))
          break;
      }
      result = skip_input_bytes((uint64_t)v1, v7);
      if ((_DWORD)result)
      {
        *((_DWORD *)v1 + 24) = 0;
        if (*((_DWORD *)v1 + 25))
          continue;
        result = set_input_fragment(v1);
        if ((_DWORD)result)
          continue;
      }
      return result;
    }
    *((_DWORD *)v1 + 25) = 0;
    return 1;
  }
  if (*((_DWORD *)v1 + 29))
    goto LABEL_3;
  v8 = ((uint64_t (*)(_QWORD, _QWORD, uint64_t))v1[7])(*v1, v1[16], 4 - *((unsigned int *)v1 + 34));
  if (v8 < 1)
    return 0;
  v1[16] += v8;
  v9 = *((_DWORD *)v1 + 34) + v8;
  *((_DWORD *)v1 + 34) = v9;
  if (v9 < 4)
    goto LABEL_15;
  v10 = bswap32(*((_DWORD *)v1 + 30));
  *((_DWORD *)v1 + 30) = v10;
  v11 = v10 & 0x7FFFFFFF;
  if ((v10 & 0x7FFFFFFF) == 0)
    return 0;
  v12 = *((_DWORD *)v1 + 37);
  if (v11 > v12)
    return 0;
  v13 = *((_DWORD *)v1 + 35) + v11;
  if (v13 > v12)
    return 0;
  *((_DWORD *)v1 + 35) = v13;
  if (v13 <= *((_DWORD *)v1 + 27))
  {
LABEL_27:
    if ((v10 & 0x80000000) != 0)
    {
      *((_DWORD *)v1 + 30) = v10 & 0x7FFFFFFF;
      *((_DWORD *)v1 + 25) = 1;
    }
LABEL_3:
    v2 = ((uint64_t (*)(_QWORD, _QWORD, _QWORD))v1[7])(*v1, v1[9] + *((unsigned int *)v1 + 36), (*((_DWORD *)v1 + 35) - *((_DWORD *)v1 + 36)));
    if (v2 < 1)
      return 0;
    v3 = *((_DWORD *)v1 + 35);
    v4 = *((_DWORD *)v1 + 36) + v2;
    *((_DWORD *)v1 + 36) = v4;
    if (v4 == v3)
    {
      *((_DWORD *)v1 + 29) = 0;
      v1[16] = v1 + 15;
      *((_DWORD *)v1 + 34) = 0;
      if (*((_DWORD *)v1 + 25))
      {
        v5 = v1[9];
        v1[10] = v5;
        v1[11] = v5 + v4;
        *((_DWORD *)v1 + 35) = 0;
        *((_DWORD *)v1 + 36) = 0;
LABEL_17:
        *((_DWORD *)v1 + 24) = 0;
        return 1;
      }
    }
LABEL_15:
    if (v1[10] == v1[11])
      goto LABEL_17;
    return 0;
  }
  result = realloc_stream((uint64_t)v1, v13);
  if ((_DWORD)result)
  {
    v10 = *((_DWORD *)v1 + 30);
    goto LABEL_27;
  }
  return result;
}

uint64_t skip_input_bytes(uint64_t a1, unsigned int a2)
{
  unsigned int v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  if (!a2)
    return 1;
  v2 = a2;
  do
  {
    while (1)
    {
      v4 = *(_QWORD *)(a1 + 80);
      LODWORD(v5) = *(_DWORD *)(a1 + 88) - v4;
      if ((_DWORD)v5)
        break;
      result = fill_input_buf(a1);
      if (!(_DWORD)result)
        return result;
    }
    if (v2 >= v5)
      v5 = v5;
    else
      v5 = v2;
    *(_QWORD *)(a1 + 80) = v4 + v5;
    v2 -= v5;
  }
  while (v2);
  return 1;
}

uint64_t set_input_fragment(_DWORD *a1)
{
  uint64_t result;
  unsigned int v3;
  unsigned int v4;
  unsigned int __dst;

  if (a1[28])
    return 0;
  __dst = 0;
  result = get_input_bytes((uint64_t)a1, (char *)&__dst, 4uLL);
  if ((_DWORD)result)
  {
    v3 = __dst;
    v4 = bswap32(__dst);
    a1[25] = v4 >> 31;
    if (v3)
    {
      a1[24] = v4 & 0x7FFFFFFF;
      return 1;
    }
    return 0;
  }
  return result;
}

BOOL _newrpclib_xdrrec_eof(uint64_t a1)
{
  uint64_t v1;
  unsigned int v2;

  v1 = *(_QWORD *)(a1 + 24);
  while (1)
  {
    v2 = *(_DWORD *)(v1 + 96);
    if (!v2)
    {
      if (*(_DWORD *)(v1 + 100))
        break;
    }
    if (skip_input_bytes(v1, v2))
    {
      *(_DWORD *)(v1 + 96) = 0;
      if (*(_DWORD *)(v1 + 100) || set_input_fragment((_DWORD *)v1))
        continue;
    }
    return 1;
  }
  return *(_QWORD *)(v1 + 80) == *(_QWORD *)(v1 + 88);
}

uint64_t _newrpclib_xdrrec_endofrecord(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 24);
  if (a2 || *(_DWORD *)(v2 + 48) || (v3 = *(_QWORD *)(v2 + 24), (unint64_t)(v3 + 4) >= *(_QWORD *)(v2 + 32)))
  {
    *(_DWORD *)(v2 + 48) = 0;
    return flush_out(v2, 1);
  }
  else
  {
    **(_DWORD **)(v2 + 40) = bswap32((v3 - *(_QWORD *)(v2 + 40) + 2147483644) | 0x80000000);
    *(_QWORD *)(v2 + 40) = v3;
    *(_QWORD *)(v2 + 24) = v3 + 4;
    return 1;
  }
}

uint64_t flush_out(uint64_t a1, int a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a2 == 1;
  v4 = *(_QWORD *)(a1 + 16);
  v5 = *(_QWORD *)(a1 + 24);
  **(_DWORD **)(a1 + 40) = bswap32((v5 - *(_QWORD *)(a1 + 40) - 4) | (v3 << 31));
  if ((*(uint64_t (**)(_QWORD))(a1 + 8))(*(_QWORD *)a1) != (_DWORD)v5 - (_DWORD)v4)
    return 0;
  v6 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 40) = v6;
  *(_QWORD *)(a1 + 24) = v6 + 4;
  return 1;
}

uint64_t xdrrec_getrecord(uint64_t a1, void **a2, unsigned int *a3)
{
  uint64_t result;
  _DWORD *v5;
  int v8;

  result = 0;
  v5 = *(_DWORD **)(a1 + 24);
  *a2 = 0;
  *a3 = 0;
  if (*(uint64_t (***)())(a1 + 8) == xdrrec_ops)
  {
    while (1)
    {
      while (1)
      {
        v8 = v5[24];
        if (!v8)
          break;
        if (__CFADD__(*a3, v8))
          return 0;
        result = (uint64_t)reallocf(*a2, *a3 + v8);
        *a2 = (void *)result;
        if (!result)
          return result;
        if (!get_input_bytes((uint64_t)v5, (char *)(result + *a3), v5[24]))
        {
          free(*a2);
          result = 0;
          *a2 = 0;
          return result;
        }
        *a3 += v5[24];
        v5[24] = 0;
      }
      if (v5[25])
        break;
      result = set_input_fragment(v5);
      if (!(_DWORD)result)
        return result;
    }
    return 1;
  }
  return result;
}

uint64_t get_input_bytes(uint64_t a1, char *__dst, size_t __n)
{
  unsigned int v3;
  const void *v6;
  uint64_t result;
  const void *v8;
  unint64_t v9;
  size_t v10;
  unsigned int v11;

  v3 = __n;
  if (*(_DWORD *)(a1 + 112))
  {
    v6 = *(const void **)(a1 + 80);
    if (*(_QWORD *)(a1 + 88) - (_QWORD)v6 < (uint64_t)__n)
      return 0;
    v11 = __n;
    memcpy(__dst, v6, __n);
    *(_QWORD *)(a1 + 80) += v11;
    return 1;
  }
  if (!(_DWORD)__n)
    return 1;
  do
  {
    while (1)
    {
      v8 = *(const void **)(a1 + 80);
      v9 = *(_QWORD *)(a1 + 88) - (_QWORD)v8;
      if (v9)
        break;
      result = fill_input_buf(a1);
      if (!(_DWORD)result)
        return result;
    }
    if (v9 >= v3)
      v10 = v3;
    else
      v10 = *(_QWORD *)(a1 + 88) - (_QWORD)v8;
    memmove(__dst, v8, v10);
    *(_QWORD *)(a1 + 80) += v10;
    __dst += v10;
    result = 1;
    v3 -= v10;
  }
  while (v3);
  return result;
}

BOOL xdr_is_recstream(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8) == (_QWORD)xdrrec_ops;
}

uint64_t realloc_stream(uint64_t a1, size_t __size)
{
  int v2;
  uint64_t v4;
  uint64_t result;

  if (*(_DWORD *)(a1 + 108) < __size)
  {
    v2 = __size;
    v4 = __size;
    result = (uint64_t)realloc(*(void **)(a1 + 72), __size);
    if (!result)
      return result;
    *(_QWORD *)(a1 + 80) += result - *(_QWORD *)(a1 + 72);
    *(_QWORD *)(a1 + 88) = result + v4;
    *(_DWORD *)(a1 + 108) = v2;
    *(_QWORD *)(a1 + 64) = v4;
    *(_QWORD *)(a1 + 72) = result;
  }
  return 1;
}

uint64_t fill_input_buf(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;

  if (*(_DWORD *)(a1 + 112))
    return 0;
  v2 = *(_QWORD *)(a1 + 88) & 3;
  v3 = *(_QWORD *)(a1 + 72) + v2;
  v4 = (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(a1 + 56))(*(_QWORD *)a1, v3, *(_DWORD *)(a1 + 64) - (int)v2);
  if (v4 == -1)
    return 0;
  *(_QWORD *)(a1 + 80) = v3;
  *(_QWORD *)(a1 + 88) = v3 + v4;
  return 1;
}

uint64_t _newrpclib_xdr_reference(_DWORD *a1, void **a2, size_t __size, uint64_t (*a4)(_DWORD *, void *, size_t))
{
  void *v7;
  uint64_t v8;
  size_t v9;
  void *v10;

  v7 = *a2;
  if (*a2)
  {
LABEL_2:
    v8 = a4(a1, v7, __size);
    if (*a1 == 2)
    {
      free(v7);
      *a2 = 0;
    }
    return v8;
  }
  if (*a1 == 2)
    return 1;
  if (*a1 != 1)
  {
    v7 = 0;
    goto LABEL_2;
  }
  v9 = __size;
  v10 = calloc(1uLL, __size);
  *a2 = v10;
  if (v10)
  {
    v7 = v10;
    bzero(v10, v9);
    goto LABEL_2;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    _newrpclib_xdr_reference_cold_1();
  return 0;
}

uint64_t _newrpclib_xdr_pointer(uint64_t (***a1)(void), void **a2, size_t a3, uint64_t (*a4)(_DWORD *, void *, size_t))
{
  uint64_t result;
  _BOOL4 v9;

  v9 = *a2 != 0;
  result = _newrpclib_xdr_BOOL(a1, &v9);
  if ((_DWORD)result)
  {
    if (v9)
    {
      return _newrpclib_xdr_reference(a1, a2, a3, a4);
    }
    else
    {
      *a2 = 0;
      return 1;
    }
  }
  return result;
}

uint64_t _newrpclib_xdr_sizeof(uint64_t (*a1)(_QWORD *))
{
  int v1;
  _QWORD v3[9];
  _QWORD v4[2];
  __int128 v5;
  __int128 v6;

  v5 = 0uLL;
  v6 = 0u;
  v4[0] = 0;
  v3[4] = x_getpostn;
  v3[5] = x_setpostn;
  v3[6] = x_inline;
  v3[7] = x_destroy;
  v3[8] = 0;
  v3[0] = harmless;
  v3[1] = x_putlong;
  v3[2] = harmless;
  v3[3] = x_putbytes;
  v4[1] = v3;
  *(_QWORD *)&v6 = 0;
  DWORD2(v6) = 0;
  v1 = a1(v4);
  if (*((_QWORD *)&v5 + 1))
    free(*((void **)&v5 + 1));
  if (v1 == 1)
    return DWORD2(v6);
  else
    return 0;
}

uint64_t x_putlong(uint64_t a1)
{
  *(_DWORD *)(a1 + 40) += 4;
  return 1;
}

uint64_t x_putbytes(uint64_t a1, uint64_t a2, int a3)
{
  *(_DWORD *)(a1 + 40) += a3;
  return 1;
}

void *x_inline(uint64_t a1, size_t __size)
{
  void *result;
  unsigned int v4;
  void *v5;

  if (!(_DWORD)__size)
    return 0;
  if (*(_DWORD *)a1)
    return 0;
  v4 = __size;
  if (*(_DWORD *)(a1 + 32) <= __size)
  {
    v5 = *(void **)(a1 + 24);
    if (v5)
      free(v5);
    result = calloc(1uLL, v4);
    *(_QWORD *)(a1 + 24) = result;
    if (result)
    {
      *(_QWORD *)(a1 + 32) = v4;
      *(_DWORD *)(a1 + 40) += v4;
    }
    else
    {
      *(_QWORD *)(a1 + 32) = 0;
    }
  }
  else
  {
    *(_DWORD *)(a1 + 40) += __size;
    return *(void **)(a1 + 24);
  }
  return result;
}

uint64_t x_getpostn(uint64_t a1)
{
  return *(unsigned int *)(a1 + 40);
}

uint64_t x_setpostn()
{
  return 0;
}

void x_destroy(uint64_t a1)
{
  void *v2;

  *(_DWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  v2 = *(void **)(a1 + 24);
  if (v2)
  {
    free(v2);
    *(_QWORD *)(a1 + 24) = 0;
  }
}

uint64_t harmless()
{
  return 0;
}

uint64_t _newrpclib_xdrstdio_create(uint64_t result, uint64_t a2, int a3)
{
  *(_DWORD *)result = a3;
  *(_QWORD *)(result + 8) = xdrstdio_ops;
  *(_DWORD *)(result + 40) = 0;
  *(_QWORD *)(result + 24) = a2;
  *(_QWORD *)(result + 32) = 0;
  return result;
}

uint64_t xdrstdio_getlong(uint64_t a1, _DWORD *a2)
{
  size_t v3;
  uint64_t result;
  unsigned int __ptr;

  __ptr = 0;
  v3 = fread(&__ptr, 4uLL, 1uLL, *(FILE **)(a1 + 24));
  result = 0;
  if (v3 == 1)
  {
    *a2 = bswap32(__ptr);
    return 1;
  }
  return result;
}

BOOL xdrstdio_putlong(uint64_t a1, unsigned int *a2)
{
  unsigned int __ptr;

  __ptr = bswap32(*a2);
  return fwrite(&__ptr, 4uLL, 1uLL, *(FILE **)(a1 + 24)) == 1;
}

BOOL xdrstdio_getbytes(uint64_t a1, void *__ptr, size_t __size)
{
  return !(_DWORD)__size || fread(__ptr, __size, 1uLL, *(FILE **)(a1 + 24)) == 1;
}

BOOL xdrstdio_putbytes(uint64_t a1, void *__ptr, size_t __size)
{
  return !(_DWORD)__size || fwrite(__ptr, __size, 1uLL, *(FILE **)(a1 + 24)) == 1;
}

uint64_t xdrstdio_getpos(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x22E30D0C4](*(_QWORD *)(a1 + 24));
  if (result >= 0xFFFFFFFFLL)
    return 0xFFFFFFFFLL;
  return result;
}

BOOL xdrstdio_setpos(uint64_t a1, unsigned int a2)
{
  return fseek(*(FILE **)(a1 + 24), a2, 0) >= 0;
}

uint64_t xdrstdio_inline()
{
  return 0;
}

uint64_t xdrstdio_destroy(uint64_t a1)
{
  return fflush(*(FILE **)(a1 + 24));
}

uint64_t _newrpclib_xdr_free(uint64_t (*a1)(_OWORD *))
{
  _OWORD v2[3];

  memset(v2, 0, sizeof(v2));
  LODWORD(v2[0]) = 2;
  return a1(v2);
}

uint64_t _newrpclib_xdr_void()
{
  return 1;
}

uint64_t _newrpclib_xdr_int(uint64_t (***a1)(void), int *a2)
{
  int v2;
  uint64_t result;
  int v5;

  v5 = 0;
  v2 = *(_DWORD *)a1;
  if (*(_DWORD *)a1 == 2)
    return 1;
  if (v2 == 1)
  {
    result = (*a1[1])();
    if (!(_DWORD)result)
      return result;
    *a2 = v5;
    return 1;
  }
  if (v2)
    return 0;
  v5 = *a2;
  return a1[1][1]();
}

uint64_t _newrpclib_xdr_u_int(uint64_t (***a1)(void), int *a2)
{
  int v2;
  uint64_t result;
  int v5;

  v5 = 0;
  v2 = *(_DWORD *)a1;
  if (*(_DWORD *)a1 == 2)
    return 1;
  if (v2 == 1)
  {
    result = (*a1[1])();
    if (!(_DWORD)result)
      return result;
    *a2 = v5;
    return 1;
  }
  if (v2)
    return 0;
  v5 = *a2;
  return a1[1][1]();
}

uint64_t _newrpclib_xdr_long(uint64_t (***a1)(void))
{
  int v1;

  v1 = *(_DWORD *)a1;
  if (*(_DWORD *)a1 == 2)
    return 1;
  if (v1 == 1)
    return (*a1[1])();
  if (v1)
    return 0;
  return a1[1][1]();
}

uint64_t _newrpclib_xdr_u_long(uint64_t (***a1)(void))
{
  int v1;

  v1 = *(_DWORD *)a1;
  if (*(_DWORD *)a1 == 2)
    return 1;
  if (v1 == 1)
    return (*a1[1])();
  if (v1)
    return 0;
  return a1[1][1]();
}

uint64_t _newrpclib_xdr_int32_t(uint64_t (***a1)(void), int *a2)
{
  int v2;
  uint64_t result;
  int v5;

  v5 = 0;
  v2 = *(_DWORD *)a1;
  if (*(_DWORD *)a1 == 2)
    return 1;
  if (v2 == 1)
  {
    result = (*a1[1])();
    if (!(_DWORD)result)
      return result;
    *a2 = v5;
    return 1;
  }
  if (v2)
    return 0;
  v5 = *a2;
  return a1[1][1]();
}

uint64_t _newrpclib_xdr_uint32_t(uint64_t (***a1)(void), int *a2)
{
  int v2;
  uint64_t result;
  int v5;

  v5 = 0;
  v2 = *(_DWORD *)a1;
  if (*(_DWORD *)a1 == 2)
    return 1;
  if (v2 == 1)
  {
    result = (*a1[1])();
    if (!(_DWORD)result)
      return result;
    *a2 = v5;
    return 1;
  }
  if (v2)
    return 0;
  v5 = *a2;
  return a1[1][1]();
}

uint64_t _newrpclib_xdr_short(uint64_t (***a1)(void), __int16 *a2)
{
  int v2;
  uint64_t result;
  int v5;

  v5 = 0;
  v2 = *(_DWORD *)a1;
  if (*(_DWORD *)a1 == 2)
    return 1;
  if (v2 == 1)
  {
    result = (*a1[1])();
    if (!(_DWORD)result)
      return result;
    *a2 = v5;
    return 1;
  }
  if (v2)
    return 0;
  v5 = *a2;
  return a1[1][1]();
}

uint64_t _newrpclib_xdr_u_short(uint64_t (***a1)(void), _WORD *a2)
{
  int v2;
  uint64_t result;
  int v5;

  v5 = 0;
  v2 = *(_DWORD *)a1;
  if (*(_DWORD *)a1 == 2)
    return 1;
  if (v2 == 1)
  {
    result = (*a1[1])();
    if (!(_DWORD)result)
      return result;
    *a2 = v5;
    return 1;
  }
  if (v2)
    return 0;
  v5 = (unsigned __int16)*a2;
  return a1[1][1]();
}

uint64_t _newrpclib_xdr_int16_t(uint64_t (***a1)(void), __int16 *a2)
{
  int v2;
  uint64_t result;
  int v5;

  v5 = 0;
  v2 = *(_DWORD *)a1;
  if (*(_DWORD *)a1 == 2)
    return 1;
  if (v2 == 1)
  {
    result = (*a1[1])();
    if (!(_DWORD)result)
      return result;
    *a2 = v5;
    return 1;
  }
  if (v2)
    return 0;
  v5 = *a2;
  return a1[1][1]();
}

uint64_t _newrpclib_xdr_uint16_t(uint64_t (***a1)(void), _WORD *a2)
{
  int v2;
  uint64_t result;
  int v5;

  v5 = 0;
  v2 = *(_DWORD *)a1;
  if (*(_DWORD *)a1 == 2)
    return 1;
  if (v2 == 1)
  {
    result = (*a1[1])();
    if (!(_DWORD)result)
      return result;
    *a2 = v5;
    return 1;
  }
  if (v2)
    return 0;
  v5 = (unsigned __int16)*a2;
  return a1[1][1]();
}

uint64_t _newrpclib_xdr_char(uint64_t (***a1)(void), _BYTE *a2)
{
  uint64_t result;
  int v4;

  v4 = (char)*a2;
  result = _newrpclib_xdr_int(a1, &v4);
  if ((_DWORD)result)
  {
    *a2 = v4;
    return 1;
  }
  return result;
}

uint64_t _newrpclib_xdr_u_char(uint64_t (***a1)(void), _BYTE *a2)
{
  uint64_t result;
  int v4;

  v4 = *a2;
  result = _newrpclib_xdr_uint32_t(a1, &v4);
  if ((_DWORD)result)
  {
    *a2 = v4;
    return 1;
  }
  return result;
}

uint64_t _newrpclib_xdr_BOOL(uint64_t (***a1)(void), _BOOL4 *a2)
{
  int v2;
  uint64_t result;
  _BOOL4 v5;

  v5 = 0;
  v2 = *(_DWORD *)a1;
  if (*(_DWORD *)a1 == 2)
    return 1;
  if (v2 == 1)
  {
    result = (*a1[1])();
    if (!(_DWORD)result)
      return result;
    *a2 = v5;
    return 1;
  }
  if (v2)
    return 0;
  v5 = *a2;
  return a1[1][1]();
}

uint64_t _newrpclib_xdr_opaque(int *a1, uint64_t a2, int a3)
{
  int v4;
  int v5;
  int v6;
  uint64_t result;
  uint64_t (*v8)(int *, void *, _QWORD);
  void *v9;
  int v10;

  if (!a3)
    return 1;
  v4 = a3 & 3;
  v5 = *a1;
  if (*a1)
  {
    if (v5 != 2)
    {
      if (v5 != 1)
        return 0;
      v6 = (*(uint64_t (**)(int *))(*((_QWORD *)a1 + 1) + 16))(a1);
      result = v6 != 0;
      if (v4 && v6)
      {
        v8 = *(uint64_t (**)(int *, void *, _QWORD))(*((_QWORD *)a1 + 1) + 16);
        v9 = &_newrpclib_xdr_opaque_crud;
        return v8(a1, v9, (4 - v4));
      }
      return result;
    }
    return 1;
  }
  v10 = (*(uint64_t (**)(int *))(*((_QWORD *)a1 + 1) + 24))(a1);
  result = v10 != 0;
  if (v4 && v10)
  {
    v8 = *(uint64_t (**)(int *, void *, _QWORD))(*((_QWORD *)a1 + 1) + 24);
    v9 = &xdr_zero;
    return v8(a1, v9, (4 - v4));
  }
  return result;
}

uint64_t _newrpclib_xdr_bytes(uint64_t (***a1)(void), void **a2, int *a3, unsigned int a4)
{
  void *v8;
  uint64_t result;
  size_t v10;
  int v11;

  v8 = *a2;
  result = _newrpclib_xdr_uint32_t(a1, a3);
  if ((_DWORD)result)
  {
    v10 = *a3;
    v11 = *(_DWORD *)a1;
    if (v10 > a4)
    {
      if (v11 != 2)
        return 0;
      goto LABEL_12;
    }
    if (v11)
    {
      if (v11 == 2)
      {
LABEL_12:
        if (v8)
        {
          free(v8);
          *a2 = 0;
        }
        return 1;
      }
      if (v11 != 1)
        return 0;
      if (!(_DWORD)v10)
        return 1;
      if (!v8)
      {
        v8 = calloc(1uLL, v10);
        *a2 = v8;
        if (!v8)
        {
          result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (!(_DWORD)result)
            return result;
          _newrpclib_xdr_bytes_cold_1();
          return 0;
        }
      }
    }
    return _newrpclib_xdr_opaque((int *)a1, (uint64_t)v8, v10);
  }
  return result;
}

uint64_t xdr_vmbytes(uint64_t (***a1)(void), vm_address_t *a2, int *a3, unsigned int a4)
{
  uint64_t v8;
  uint64_t result;
  vm_size_t v10;
  int v11;
  vm_address_t address;

  v8 = *a2;
  address = *a2;
  result = _newrpclib_xdr_uint32_t(a1, a3);
  if ((_DWORD)result)
  {
    v10 = *a3;
    v11 = *(_DWORD *)a1;
    if (v10 > a4)
    {
      if (v11 != 2)
        return 0;
      goto LABEL_11;
    }
    if (v11)
    {
      if (v11 == 2)
      {
LABEL_11:
        if (v8)
        {
          MEMORY[0x22E30D4A8](*MEMORY[0x24BDAEC58], v8, v10);
          *a2 = 0;
        }
        return 1;
      }
      if (v11 != 1)
        return 0;
      if (!(_DWORD)v10)
        return 1;
      if (!v8)
      {
        if (vm_allocate(*MEMORY[0x24BDAEC58], &address, v10, 1))
        {
          result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (!(_DWORD)result)
            return result;
          xdr_vmbytes_cold_1();
          return 0;
        }
        v8 = address;
        *a2 = address;
      }
    }
    return _newrpclib_xdr_opaque((int *)a1, v8, v10);
  }
  return result;
}

uint64_t _newrpclib_xdr_netobj(uint64_t (***a1)(void), uint64_t a2)
{
  return _newrpclib_xdr_bytes(a1, (void **)(a2 + 8), (int *)a2, 0x400u);
}

uint64_t _newrpclib_xdr_union(uint64_t (***a1)(void), _DWORD *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t (***)(void), uint64_t))
{
  uint64_t (*v10)(uint64_t (***)(void), uint64_t);
  _DWORD *i;
  int v12;

  if (_newrpclib_xdr_long(a1))
  {
    v10 = *(uint64_t (**)(uint64_t (***)(void), uint64_t))(a4 + 8);
    if (v10)
    {
      if (*(_DWORD *)a4 == *a2)
        return v10(a1, a3);
      for (i = (_DWORD *)(a4 + 24); ; i += 4)
      {
        v10 = *(uint64_t (**)(uint64_t (***)(void), uint64_t))i;
        if (!*(_QWORD *)i)
          break;
        v12 = *(i - 2);
        if (v12 == *a2)
          return v10(a1, a3);
      }
    }
    v10 = a5;
    if (a5)
      return v10(a1, a3);
  }
  return 0;
}

uint64_t _newrpclib_xdr_string(uint64_t (***a1)(void), char **a2, unsigned int a3)
{
  char *v6;
  size_t v7;
  uint64_t result;
  uint64_t v9;
  int v10;
  unsigned int v11;

  v6 = *a2;
  v11 = 0;
  if (*(_DWORD *)a1)
  {
    if (*(_DWORD *)a1 != 2)
      goto LABEL_6;
    if (!v6)
      return 1;
  }
  v7 = strlen(v6);
  if (HIDWORD(v7))
    return 0;
  v11 = v7;
LABEL_6:
  result = _newrpclib_xdr_uint32_t(a1, (int *)&v11);
  if (!(_DWORD)result)
    return result;
  v9 = v11;
  if (v11 > a3)
    return 0;
  v10 = *(_DWORD *)a1;
  if (!*(_DWORD *)a1)
    return _newrpclib_xdr_opaque((int *)a1, (uint64_t)v6, v9);
  if (v10 == 2)
  {
    free(v6);
    *a2 = 0;
    return 1;
  }
  if (v10 != 1)
    return 0;
  if (v6 || (v6 = (char *)calloc(1uLL, v11 + 1), (*a2 = v6) != 0))
  {
    v6[v9] = 0;
    return _newrpclib_xdr_opaque((int *)a1, (uint64_t)v6, v9);
  }
  result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  if ((_DWORD)result)
  {
    _newrpclib_xdr_string_cold_1();
    return 0;
  }
  return result;
}

uint64_t _newrpclib_xdr_wrapstring(uint64_t (***a1)(void), char **a2)
{
  return _newrpclib_xdr_string(a1, a2, 0xFFFFFFFF);
}

uint64_t _newrpclib_xdr_int64_t(int *a1, unint64_t *a2)
{
  int v2;
  uint64_t result;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v6[0] = 0;
  v2 = *a1;
  if (*a1 == 2)
    return 1;
  if (v2 != 1)
  {
    if (v2)
      return 0;
    v6[0] = __ROR8__(*a2, 32);
    result = (*(uint64_t (**)(int *, _QWORD *))(*((_QWORD *)a1 + 1) + 8))(a1, v6);
    if ((_DWORD)result)
      return (*(uint64_t (**)(int *, char *))(*((_QWORD *)a1 + 1) + 8))(a1, (char *)v6 + 4);
    return result;
  }
  result = (**((uint64_t (***)(int *, _QWORD *))a1 + 1))(a1, v6);
  if ((_DWORD)result)
  {
    result = (**((uint64_t (***)(int *, char *))a1 + 1))(a1, (char *)v6 + 4);
    if ((_DWORD)result)
    {
      *a2 = HIDWORD(v6[0]) | ((unint64_t)LODWORD(v6[0]) << 32);
      return 1;
    }
  }
  return result;
}

uint64_t _newrpclib_xdr_uint64_t(int *a1, unint64_t *a2)
{
  int v2;
  uint64_t result;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v6[0] = 0;
  v2 = *a1;
  if (*a1 == 2)
    return 1;
  if (v2 != 1)
  {
    if (v2)
      return 0;
    v6[0] = __ROR8__(*a2, 32);
    result = (*(uint64_t (**)(int *, _QWORD *))(*((_QWORD *)a1 + 1) + 8))(a1, v6);
    if ((_DWORD)result)
      return (*(uint64_t (**)(int *, char *))(*((_QWORD *)a1 + 1) + 8))(a1, (char *)v6 + 4);
    return result;
  }
  result = (**((uint64_t (***)(int *, _QWORD *))a1 + 1))(a1, v6);
  if ((_DWORD)result)
  {
    result = (**((uint64_t (***)(int *, char *))a1 + 1))(a1, (char *)v6 + 4);
    if ((_DWORD)result)
    {
      *a2 = HIDWORD(v6[0]) | ((unint64_t)LODWORD(v6[0]) << 32);
      return 1;
    }
  }
  return result;
}

uint64_t _newrpclib_xdr_getrecord(int *a1, uint64_t *a2, int *a3)
{
  if (*a1 != 1)
    return 0;
  if (xdr_is_memstream((uint64_t)a1))
    return xdrmem_getrecord(a1, a2, a3);
  if (xdr_is_recstream((uint64_t)a1))
    return xdrrec_getrecord((uint64_t)a1, (void **)a2, (unsigned int *)a3);
  else
    return 0;
}

uint64_t cvt6to4(uint64_t a1, uint64_t a2)
{
  int v3;

  if (*(_BYTE *)(a1 + 1) != 30)
    return 0;
  if (*(_DWORD *)(a1 + 8))
    return 0;
  if (*(_DWORD *)(a1 + 12))
    return 0;
  v3 = *(_DWORD *)(a1 + 16);
  if (v3 != -65536 && (v3 || (*(_DWORD *)(a1 + 20) | 0x1000000) == 0x1000000))
    return 0;
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_WORD *)a2 = 528;
  *(_WORD *)(a2 + 2) = *(_WORD *)(a1 + 2);
  *(_DWORD *)(a2 + 4) = *(_DWORD *)(a1 + 20);
  return 1;
}

uint64_t cvt4to6(uint64_t a1, uint64_t a2)
{
  if (*(_BYTE *)(a1 + 1) != 2)
    return 0;
  *(_DWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)a2 = 0;
  *(_WORD *)a2 = 7708;
  *(_WORD *)(a2 + 2) = *(_WORD *)(a1 + 2);
  *(_DWORD *)(a2 + 16) = -65536;
  *(_DWORD *)(a2 + 20) = *(_DWORD *)(a1 + 4);
  return 1;
}

uint64_t gethostaddr(char *a1, int a2, void *a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t result;
  BOOL v9;
  addrinfo *v10;
  size_t ai_addrlen;
  sockaddr *ai_addr;
  _QWORD v13[3];
  int v14;
  addrinfo *v15;
  addrinfo v16;

  v15 = 0;
  switch(a2)
  {
    case 30:
      v5 = 3;
      goto LABEL_7;
    case 2:
      v5 = 0;
      while (1)
      {
        while (1)
        {
LABEL_7:
          memset(&v16, 0, sizeof(v16));
          v6 = 2;
          v7 = v5;
          switch((int)v5)
          {
            case 0:
              goto LABEL_14;
            case 1:
              v7 = 3;
              goto LABEL_14;
            case 2:
              v7 = 0;
              goto LABEL_10;
            case 3:
LABEL_10:
              if (_newrpclib_rpc_v4mapped_ok)
              {
                v16.ai_flags = 2048;
                v7 = 4;
              }
              v6 = 30;
              goto LABEL_14;
            case 4:
              v6 = 0;
              v7 = 4;
LABEL_14:
              v16.ai_family = v6;
              break;
            default:
              break;
          }
          result = getaddrinfo(a1, 0, &v16, &v15);
          if ((_DWORD)result != 2)
            break;
          sleep(1u);
        }
        if (!(_DWORD)result)
          break;
        v9 = (_DWORD)v5 == (_DWORD)v7;
        v5 = v7;
        if (v9)
          return result;
      }
      if ((_DWORD)v5 == 4)
      {
        memset(v13, 0, sizeof(v13));
        v14 = 0;
        v10 = v15;
        if (!cvt4to6((uint64_t)v15->ai_addr, (uint64_t)v13))
          return 11;
        ai_addrlen = LOBYTE(v13[0]);
        ai_addr = (sockaddr *)v13;
      }
      else
      {
        v10 = v15;
        ai_addr = v15->ai_addr;
        ai_addrlen = v15->ai_addrlen;
      }
      memcpy(a3, ai_addr, ai_addrlen);
      freeaddrinfo(v10);
      return 0;
    case 0:
      v5 = _newrpclib_rpc_ipmode;
      goto LABEL_7;
  }
  *__error() = 47;
  return 0xFFFFFFFFLL;
}

uint64_t open_socket(int a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  int v5;
  uint64_t result;
  int *v7;

  v2 = _newrpclib_rpc_ipmode;
  if (a1 == 17)
  {
    v3 = 2;
  }
  else
  {
    if (a1 != 6)
    {
      *__error() = 43;
      return 0xFFFFFFFFLL;
    }
    v3 = 1;
  }
  do
  {
    if (v2 > 4)
    {
      v5 = 0;
      v4 = v2;
    }
    else
    {
      v4 = dword_22D0F90F4[(int)v2];
      v5 = 2;
    }
    result = socket(v5, v3, a1);
    if ((_DWORD)result != -1)
      break;
    v7 = __error();
    result = 0xFFFFFFFFLL;
    if ((_DWORD)v4 == (_DWORD)v2)
      break;
    v2 = v4;
  }
  while (*v7 == 47);
  return result;
}

ssize_t recvfrom_and_to(int a1, uint64_t a2, uint64_t a3, int a4, unsigned __int8 *a5, unsigned __int8 *a6)
{
  size_t v10;
  size_t v11;
  ssize_t v12;
  __int16 v14;
  ssize_t v15;
  unsigned int *msg_control;
  unsigned int v17;
  uint64_t v18;
  unsigned int v19;
  unsigned int v21;
  unsigned int v22;
  uint64_t v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  _OWORD v27[2];
  msghdr v28;
  socklen_t v29;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x24BDAC8D0];
  v10 = *a5;
  v11 = *a6;
  v29 = *a6;
  memset(v27, 0, sizeof(v27));
  v30[0] = a2;
  v30[1] = a3;
  bzero(a5, v10);
  memset(&v28.msg_namelen, 0, 40);
  if (getsockname(a1, (sockaddr *)a6, &v29))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      recvfrom_and_to_cold_1();
    return 0xFFFFFFFFLL;
  }
  if (v11 < 0x10)
    v14 = 0;
  else
    v14 = *((_WORD *)a6 + 1);
  v28.msg_name = a5;
  v28.msg_namelen = v10;
  v28.msg_iov = (iovec *)v30;
  v28.msg_iovlen = 1;
  v28.msg_control = v27;
  v28.msg_controllen = 32;
  v15 = recvmsg(a1, &v28, a4);
  if (v15 == -1)
    return 0xFFFFFFFFLL;
  v12 = v15;
  bzero(a6, v11);
  if (v28.msg_controllen < 0xC)
    return v12;
  msg_control = (unsigned int *)v28.msg_control;
  if (!v28.msg_control)
    return v12;
  while (1)
  {
    v17 = msg_control[1];
    if (v17)
    {
      if (v17 == 41)
      {
        v18 = *msg_control;
        if (msg_control[2] == 46 && v18 == 32)
        {
          if (v11 < 0x1C)
            return v12;
          v22 = msg_control[6];
          v21 = msg_control[7];
          v23 = *((_QWORD *)msg_control + 2);
          v24 = msg_control[3];
          *(_WORD *)a6 = 7708;
          *((_WORD *)a6 + 1) = v14;
          *((_DWORD *)a6 + 2) = v24;
          *(_QWORD *)(a6 + 12) = v23;
          *((_DWORD *)a6 + 5) = v22;
LABEL_34:
          search_local_ifaddr_cache(v21, a6, a5);
          return v12;
        }
      }
      else
      {
        v18 = *msg_control;
      }
      goto LABEL_26;
    }
    v19 = msg_control[2];
    v18 = *msg_control;
    if (v19 != 26)
      break;
    if (v18 == 24)
    {
      if (v11 < 0xC)
        return v12;
      v26 = msg_control[5];
      v21 = msg_control[3];
      *(_WORD *)a6 = 528;
      *((_WORD *)a6 + 1) = v14;
      *((_DWORD *)a6 + 1) = v26;
      goto LABEL_34;
    }
LABEL_26:
    msg_control = (unsigned int *)((char *)msg_control + ((v18 + 3) & 0x1FFFFFFFCLL));
    if ((char *)(msg_control + 3) > (char *)v28.msg_control + v28.msg_controllen)
      return v12;
  }
  if (v19 != 7 || v18 != 16)
    goto LABEL_26;
  if (v11 >= 0x10)
  {
    v25 = msg_control[3];
    *(_WORD *)a6 = 528;
    *((_WORD *)a6 + 1) = v14;
    *((_DWORD *)a6 + 1) = v25;
  }
  return v12;
}

unsigned __int8 *search_local_ifaddr_cache(unsigned int a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  int v8;
  uint64_t v9;
  unsigned __int8 *v10;
  int v11;
  unsigned __int8 *v12;
  int v13;
  unsigned int v14;
  unsigned __int8 *v15;
  BOOL v16;
  size_t v17;
  unsigned __int8 *v18;
  const void *v19;
  uint64_t i;
  uint64_t v21;
  unsigned int v22;
  unsigned int v23;
  size_t v25;
  _QWORD *v26;
  uint64_t v27;
  int v28;
  unsigned int v29;
  uint64_t v30;
  unsigned int v31;
  int v32;
  _QWORD *v33;
  uint64_t v34;
  timeval v35;
  int v36;

  if (pthread_once(&cache_control_init, (void (*)(void))cache_init))
    return a2;
  v35.tv_sec = 0;
  *(_QWORD *)&v35.tv_usec = 0;
  gettimeofday(&v35, 0);
  if (v35.tv_sec > (uint64_t)if_addr_cache || qword_255D60498 == 0 || qword_255D60488 <= (unint64_t)a1)
  {
    pthread_rwlock_wrlock(&cache_rwlock);
    gettimeofday(&v35, 0);
    if (v35.tv_sec <= (uint64_t)if_addr_cache && qword_255D60498 && qword_255D60488 > (unint64_t)a1)
      goto LABEL_12;
    reset_if_addr_cache();
    if (getifaddrs((ifaddrs **)&qword_255D60498))
      goto LABEL_54;
    v21 = qword_255D60498;
    if (qword_255D60498)
    {
      v22 = 0;
      do
      {
        v23 = if_nametoindex(*(const char **)(v21 + 8));
        if (v23 > v22)
          v22 = v23;
        v21 = *(_QWORD *)v21;
      }
      while (v21);
    }
    else
    {
      v22 = 0;
    }
    v25 = v22 + 1;
    v26 = calloc(v25, 0x10uLL);
    qword_255D60490 = (uint64_t)v26;
    if (!v26)
    {
LABEL_72:
      reset_if_addr_cache();
      goto LABEL_54;
    }
    qword_255D60488 = v22 + 1;
    if (v22 != -1)
    {
      do
      {
        *v26 = 0;
        v26[1] = v26;
        v26 += 2;
        --v25;
      }
      while (v25);
    }
    v27 = qword_255D60498;
    if (qword_255D60498)
    {
      v28 = 0;
      do
      {
        v29 = if_nametoindex(*(const char **)(v27 + 8));
        if (*(_BYTE *)(*(_QWORD *)(v27 + 24) + 1) == 2)
        {
          v30 = *(_QWORD *)(v27 + 40);
          if (v30)
          {
            if ((~*(_DWORD *)(v27 + 16) & 3) == 0)
            {
              v31 = v29;
              v32 = *(_DWORD *)(v30 + 4);
              v33 = calloc(1uLL, 0x18uLL);
              if (!v33)
                goto LABEL_72;
              if (v32 == -343)
                v28 = 1;
              *v33 = *(_QWORD *)(v27 + 40);
              v33[1] = *(_QWORD *)(v27 + 24);
              v33[2] = 0;
              **(_QWORD **)(qword_255D60490 + 16 * v31 + 8) = v33;
              *(_QWORD *)(qword_255D60490 + 16 * v31 + 8) = v33 + 2;
            }
          }
        }
        v27 = *(_QWORD *)v27;
      }
      while (v27);
      if_addr_cache = (__int128)v35;
      if (v28)
      {
        v34 = 3;
LABEL_75:
        *(_QWORD *)&if_addr_cache = if_addr_cache + v34;
LABEL_12:
        pthread_rwlock_unlock(&cache_rwlock);
        goto LABEL_13;
      }
    }
    else
    {
      if_addr_cache = (__int128)v35;
    }
    v34 = 30;
    goto LABEL_75;
  }
LABEL_13:
  pthread_rwlock_rdlock(&cache_rwlock);
  v8 = a2[1];
  if (v8 == 30)
  {
    if (a2[8] == 255)
    {
LABEL_16:
      v9 = qword_255D60498;
      if (!qword_255D60498)
        goto LABEL_54;
      v10 = 0;
      v11 = 0;
      v36 = 0;
      while (1)
      {
        if (if_nametoindex(*(const char **)(v9 + 8)) == a1)
        {
          v12 = *(unsigned __int8 **)(v9 + 24);
          v13 = v12[1];
          if (v13 == a2[1])
          {
            v14 = *v12;
            if (v14 == *a2)
            {
              if (v13 == 30)
              {
                if (a2[8] != 255)
                  goto LABEL_29;
              }
              else if (v13 != 2 || *((_DWORD *)a2 + 1) >> 28 != 14)
              {
LABEL_29:
                if ((*(_BYTE *)(v9 + 16) & 2) != 0)
                {
                  v15 = *(unsigned __int8 **)(v9 + 40);
                  v16 = v13 != 2 || v15 == 0;
                  if (!v16 && compare_sa(v15, a2, 0, 0))
                    goto LABEL_38;
                }
                goto LABEL_35;
              }
              if (compare_sa(a3, *(unsigned __int8 **)(v9 + 24), *(_QWORD *)(v9 + 32), &v36) && v36 > v11)
              {
                v11 = v36;
                v10 = v12;
              }
            }
          }
        }
LABEL_35:
        v9 = *(_QWORD *)v9;
        if (!v9)
        {
          if (!v10)
            goto LABEL_54;
          v14 = *a2;
          v12 = v10;
LABEL_38:
          v17 = v14;
          v18 = a2;
          v19 = v12;
LABEL_53:
          memcpy(v18, v19, v17);
          goto LABEL_54;
        }
      }
    }
  }
  else if (v8 == 2 && *((_DWORD *)a2 + 1) >> 28 == 14)
  {
    goto LABEL_16;
  }
  if (qword_255D60488 > (unint64_t)a1)
  {
    for (i = *(_QWORD *)(qword_255D60490 + 16 * a1); i; i = *(_QWORD *)(i + 16))
    {
      if (compare_sa(a2, *(unsigned __int8 **)i, 0, 0))
      {
        v19 = *(const void **)(i + 8);
        v17 = *a2;
        v18 = a2;
        goto LABEL_53;
      }
    }
  }
LABEL_54:
  pthread_rwlock_unlock(&cache_rwlock);
  return a2;
}

uint64_t _newrpclib_socparms2netid(int a1, int a2, int a3, const char **a4)
{
  int v4;
  const char *v5;
  int *v6;
  unsigned int v7;
  int *v8;
  int v9;
  uint64_t result;

  v4 = 0;
  *a4 = 0;
  v5 = "udp";
  v6 = &dword_24F83C95C;
  do
  {
    if (*(v6 - 1) == a1)
    {
      if (a1 == 1)
      {
        if (a3)
        {
          v8 = __error();
          goto LABEL_23;
        }
        if (*v6 == a2)
          goto LABEL_21;
      }
      else
      {
        if (a1 != 30 && a1 != 2)
          goto LABEL_20;
        if (!a2 || *v6 == a2)
        {
          if (a3)
          {
            if (v6[1] == a3)
              goto LABEL_21;
          }
          else if (a2)
          {
LABEL_21:
            result = 0;
            *a4 = v5;
            return result;
          }
        }
      }
      v4 = 1;
    }
    v5 = *(const char **)(v6 + 3);
    v6 += 6;
  }
  while (v5);
  if (!v4)
  {
LABEL_20:
    v8 = __error();
    v9 = 46;
    goto LABEL_24;
  }
  v7 = a2 - 3;
  v8 = __error();
  if (v7 <= 0xFFFFFFFD)
  {
    v9 = 41;
    goto LABEL_24;
  }
LABEL_23:
  v9 = 43;
LABEL_24:
  *v8 = v9;
  return 0xFFFFFFFFLL;
}

uint64_t _newrpclib_netid2socparms(char *__s2, _DWORD *a2, _DWORD *a3, _DWORD *a4, int a5)
{
  char **v10;
  const char *v11;
  uint64_t result;
  const char *v13;
  int v14;
  int v15;

  if (!__s2)
  {
    v15 = 22;
LABEL_19:
    *__error() = v15;
    return 0xFFFFFFFFLL;
  }
  v10 = &netids;
  v11 = "udp";
  while (1)
  {
    result = strncmp(v11, __s2, 0x80uLL);
    if (!(_DWORD)result)
      break;
    v13 = v10[3];
    v10 += 3;
    v11 = v13;
    if (!v13)
    {
      v10 = (char **)&unk_24F83CA28;
      break;
    }
  }
  if (a2)
  {
    if (a5 && *((_DWORD *)v10 + 5))
      v14 = 0;
    else
      v14 = *((_DWORD *)v10 + 2);
    *a2 = v14;
  }
  if (a3)
    *a3 = *((_DWORD *)v10 + 3);
  if (a4)
    *a4 = *((_DWORD *)v10 + 4);
  if ((_DWORD)result)
  {
    v15 = 2;
    goto LABEL_19;
  }
  return result;
}

uint64_t _newrpclib_uaddr2sa(const char *a1, char *__s2, unsigned __int8 *a3)
{
  unsigned int v5;
  uint64_t result;
  unsigned int v7;
  unsigned int v8;
  int v9;
  __int16 v10;
  unsigned int v11;
  int v12;
  uint64_t v13;
  char v14[16];
  __int128 v15;
  _BYTE v16[23];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  memset(v16, 0, sizeof(v16));
  *(_OWORD *)v14 = 0u;
  v13 = 0;
  v12 = 0;
  if (!a1)
    goto LABEL_4;
  if (!__s2)
    goto LABEL_4;
  v5 = *a3;
  if (_newrpclib_netid2socparms(__s2, (_DWORD *)&v13 + 1, &v13, &v12, 0))
    goto LABEL_4;
  if (HIDWORD(v13) == 30)
  {
    if (v5 < 0x1C)
      goto LABEL_4;
    if (strlen(a1) > 0x36)
      goto LABEL_4;
    v11 = ugetport(a1, v14);
    if ((v11 & 0x80000000) != 0)
      goto LABEL_4;
    v8 = v11;
    *(_QWORD *)a3 = 0;
    *((_DWORD *)a3 + 6) = 0;
    *((_QWORD *)a3 + 2) = 0;
    *((_QWORD *)a3 + 1) = 0;
    v9 = inet_pton(30, v14, a3 + 8);
    if (v9 == 1)
    {
      result = 0;
      v10 = 7708;
      goto LABEL_22;
    }
LABEL_23:
    if (v9)
      return 0xFFFFFFFFLL;
    goto LABEL_4;
  }
  if (HIDWORD(v13) != 2)
  {
    if (HIDWORD(v13) == 1 && v5 >= 0x6A)
    {
      *(_OWORD *)(a3 + 90) = 0u;
      *((_OWORD *)a3 + 4) = 0u;
      *((_OWORD *)a3 + 5) = 0u;
      *((_OWORD *)a3 + 2) = 0u;
      *((_OWORD *)a3 + 3) = 0u;
      *(_OWORD *)a3 = 0u;
      *((_OWORD *)a3 + 1) = 0u;
      if (strnlen(a1, 0x68uLL) <= 0x67)
      {
        *(_WORD *)a3 = 362;
        strlcpy((char *)a3 + 2, a1, 0x68uLL);
        return 0;
      }
    }
LABEL_4:
    *__error() = 22;
    return 0xFFFFFFFFLL;
  }
  if (v5 < 0x10)
    goto LABEL_4;
  if (strlen(a1) > 0x36)
    goto LABEL_4;
  v7 = ugetport(a1, v14);
  if ((v7 & 0x80000000) != 0)
    goto LABEL_4;
  v8 = v7;
  *(_QWORD *)a3 = 0;
  *((_QWORD *)a3 + 1) = 0;
  v9 = inet_pton(2, v14, a3 + 4);
  if (v9 != 1)
    goto LABEL_23;
  result = 0;
  v10 = 528;
LABEL_22:
  *(_WORD *)a3 = v10;
  *((_WORD *)a3 + 1) = bswap32(v8) >> 16;
  return result;
}

uint64_t ugetport(const char *a1, char *a2)
{
  const char *v4;
  uint64_t v5;
  char v7;
  char v8;
  char v9;
  const char *v10;
  unint64_t v11;
  int v12;
  int v14;
  char *__endptr;

  __endptr = 0;
  v4 = &a1[strnlen(a1, 0x400uLL)];
  if (!*v4)
  {
    v7 = 0;
    LODWORD(v5) = 0;
    v8 = 1;
    while (1)
    {
      if (v4 == a1)
        return 0xFFFFFFFFLL;
      v9 = v8;
      v10 = v4;
      while (*v10 != 46)
      {
        if (--v10 == a1)
          return 0xFFFFFFFFLL;
      }
      v11 = strtol(v10 + 1, &__endptr, 10);
      if (v11 > 0xFF)
        return 0xFFFFFFFFLL;
      v12 = *__endptr;
      if (v12 != 46 && v12 != 0)
        return 0xFFFFFFFFLL;
      if ((v7 & 1) != 0)
        break;
      v8 = 0;
      v14 = *(unsigned __int8 *)v10;
      v4 = &v10[-(v14 == 46)];
      v5 = v5 | v11;
      v7 = 1;
      if ((v9 & 1) == 0)
      {
        v10 -= v14 == 46;
LABEL_20:
        strlcpy(a2, a1, v10 - a1 + 1);
        return v5;
      }
    }
    v5 = v5 | ((_DWORD)v11 << 8);
    goto LABEL_20;
  }
  return 0xFFFFFFFFLL;
}

uint64_t _newrpclib_sa2uaddr(char *__s1, char **a2)
{
  int v4;
  char *v5;
  const char *v6;
  int v7;
  unsigned int v9;
  BOOL v10;
  char *v11;
  char v12[16];
  __int128 v13;
  _BYTE v14[23];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  memset(v14, 0, sizeof(v14));
  *(_OWORD *)v12 = 0u;
  *a2 = 0;
  if (!__s1)
    goto LABEL_8;
  v4 = __s1[1];
  if (v4 != 1)
  {
    if (v4 == 30)
    {
      v5 = __s1 + 8;
LABEL_11:
      if (inet_ntop(v4, v5, v12, 0x2Eu))
      {
        v9 = bswap32(*((unsigned __int16 *)__s1 + 1));
        v10 = asprintf(a2, "%s.%d.%d", v12, HIBYTE(v9), BYTE2(v9)) == -1;
        goto LABEL_13;
      }
      return 0xFFFFFFFFLL;
    }
    if (v4 == 2)
    {
      v5 = __s1 + 4;
      goto LABEL_11;
    }
LABEL_8:
    *__error() = 22;
    return 0xFFFFFFFFLL;
  }
  v7 = __s1[2];
  v6 = __s1 + 2;
  if (!v7 || strnlen(v6, 0x68uLL) == 104)
    goto LABEL_8;
  v11 = strdup(v6);
  *a2 = v11;
  v10 = v11 == 0;
LABEL_13:
  if (v10)
    return 0xFFFFFFFFLL;
  else
    return 0;
}

void freenetconfigent(void **a1)
{
  if (a1)
  {
    free(*a1);
    free(a1[2]);
    free(a1[3]);
    free(a1);
  }
}

_DWORD *getnetconfigent(char *__s2)
{
  const char *v2;
  char **v3;
  _DWORD *v4;
  char *v5;
  char *v6;
  char *v7;

  v2 = "udp";
  v3 = off_24F83CA58;
  while (strncmp(v2, __s2, 0x80uLL))
  {
    v2 = v3[2];
    v3 += 5;
    if (!v2)
    {
      v4 = 0;
      *__error() = 2;
      return v4;
    }
  }
  v4 = calloc(1uLL, 0x20uLL);
  if (v4)
  {
    v5 = strdup(*(v3 - 2));
    *(_QWORD *)v4 = v5;
    v4[2] = *((_DWORD *)v3 - 2);
    v6 = strdup(*v3);
    *((_QWORD *)v4 + 2) = v6;
    v7 = strdup(v3[1]);
    *((_QWORD *)v4 + 3) = v7;
    if (!v5 || !v6 || !v7)
    {
      freenetconfigent((void **)v4);
      return 0;
    }
  }
  return v4;
}

uint64_t set_local_ephemeral_sockname(uint64_t a1, const char *a2)
{
  char *v4;
  int v6;
  int v7;
  char __str[16];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = getenv("TMPDIR");
  v14 = 0;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  *(_OWORD *)__str = 0u;
  v9 = 0u;
  if (!v4 || !*v4)
    v4 = "/tmp";
  if (snprintf(__str, 0x68uLL, "%s/rpc.XXXXXXXX.%s", v4, a2) < 0x69)
  {
    v6 = strlen(a2);
    v7 = mkstemps(__str, v6 + 1);
    unlink(__str);
    close(v7);
    strlcpy((char *)(a1 + 2), __str, 0x68uLL);
    return 0;
  }
  else
  {
    *__error() = 63;
    return 0xFFFFFFFFLL;
  }
}

uint64_t cache_init()
{
  uint64_t result;

  result = pthread_rwlock_init(&cache_rwlock, 0);
  if ((_DWORD)result)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      cache_init_cold_1();
    abort();
  }
  return result;
}

double reset_if_addr_cache()
{
  _QWORD *v0;
  unint64_t v1;
  uint64_t v2;
  unsigned int v3;
  _QWORD **v4;
  _QWORD *v5;
  _QWORD *v6;
  double result;

  v1 = qword_255D60488;
  v0 = (_QWORD *)qword_255D60490;
  if (qword_255D60488)
  {
    v2 = 0;
    v3 = 0;
    do
    {
      v4 = (_QWORD **)&v0[2 * v2];
      v5 = *v4;
      if (*v4)
      {
        do
        {
          v6 = (_QWORD *)v5[2];
          *v4 = v6;
          if (!v6)
            v0[2 * v2 + 1] = v4;
          free(v5);
          v0 = (_QWORD *)qword_255D60490;
          v4 = (_QWORD **)(qword_255D60490 + 16 * v2);
          v5 = *v4;
        }
        while (*v4);
        v1 = qword_255D60488;
      }
      v2 = ++v3;
    }
    while (v1 > v3);
  }
  free(v0);
  if (qword_255D60498)
    MEMORY[0x22E30D0AC]();
  qword_255D60498 = 0;
  result = 0.0;
  if_addr_cache = 0u;
  *(_OWORD *)&qword_255D60488 = 0u;
  return result;
}

BOOL compare_sa(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3, int *a4)
{
  size_t v4;
  int v5;
  int v6;
  int v7;
  unsigned int v8;
  int v9;
  _BOOL8 result;
  _DWORD *v11;
  int v12;
  uint64_t v13;
  unsigned int v14;
  int v15;
  int v16;
  uint64_t v18;
  unsigned __int8 *v19;
  int v20;
  BOOL v21;
  int v22;

  v4 = *a1;
  if ((_DWORD)v4 != *a2)
    return 0;
  v5 = a1[1];
  if (v5 != a2[1])
    return 0;
  if (v5 != 30)
  {
    if (v5 != 2)
    {
      if (a4)
        *a4 = 8 * v4;
      return memcmp(a1, a2, v4) == 0;
    }
    v6 = *((_DWORD *)a1 + 1);
    v7 = *((_DWORD *)a2 + 1);
    if (a3)
    {
      v8 = *(_DWORD *)(a3 + 4);
      if (a4)
      {
        if (v8 != -1)
        {
          v9 = 0;
          while (((v8 >> (v9 + 31)) & 1) != 0)
          {
            if (--v9 == -32)
              goto LABEL_36;
          }
          v22 = -v9;
          goto LABEL_37;
        }
LABEL_36:
        v22 = 32;
LABEL_37:
        *a4 = v22;
      }
    }
    else
    {
      v8 = -1;
      if (a4)
        goto LABEL_36;
    }
    return (v8 & (v7 ^ v6)) == 0;
  }
  v11 = (_DWORD *)(a3 + 8);
  if (!a3)
    v11 = &compare_sa_allones;
  if (a4)
  {
    v12 = 0;
    v13 = 0;
    while (1)
    {
      v14 = v11[v13];
      if (v14 != -1)
        break;
LABEL_21:
      v12 += 32;
      if (++v13 == 4)
      {
        v16 = 128;
        goto LABEL_27;
      }
    }
    v15 = 0;
    while (((v14 >> (v15 + 31)) & 1) != 0)
    {
      if (--v15 == -32)
        goto LABEL_21;
    }
    v16 = v12 - v15;
LABEL_27:
    *a4 = v16;
  }
  v18 = 0;
  v19 = a1 + 8;
  do
  {
    v20 = (*(_DWORD *)&a2[v18 * 4 + 8] ^ *(_DWORD *)&v19[v18 * 4]) & v11[v18];
    result = v20 == 0;
    if (v20)
      v21 = 1;
    else
      v21 = v18 == 3;
    ++v18;
  }
  while (!v21);
  return result;
}

uint64_t _newrpclib_xdr_pmap(uint64_t (***a1)(void), int *a2)
{
  uint64_t result;

  result = _newrpclib_xdr_uint32_t(a1, a2);
  if ((_DWORD)result)
  {
    result = _newrpclib_xdr_uint32_t(a1, a2 + 1);
    if ((_DWORD)result)
    {
      result = _newrpclib_xdr_uint32_t(a1, a2 + 2);
      if ((_DWORD)result)
        return _newrpclib_xdr_uint32_t(a1, a2 + 3) != 0;
    }
  }
  return result;
}

BOOL _newrpclib_xdr_pmaplist_ptr(uint64_t (***a1)(void), void **a2)
{
  return _newrpclib_xdr_pointer(a1, a2, 0x18uLL, (uint64_t (*)(_DWORD *, void *, size_t))_newrpclib_xdr_pmaplist) != 0;
}

BOOL _newrpclib_xdr_pmaplist(uint64_t (***a1)(void), _QWORD *a2)
{
  _QWORD *v2;
  int v4;
  int v5;
  uint64_t v6;
  int v7;
  _QWORD *v8;
  _QWORD *v9;
  _BOOL4 v11;

  v2 = a2;
  v11 = 0;
  v4 = *(_DWORD *)a1;
  if (*(_DWORD *)a1 == 2)
  {
    if (a2)
    {
      LOBYTE(v6) = 0;
      while (_newrpclib_xdr_pmap(a1, (int *)v2))
      {
        v9 = (_QWORD *)v2[2];
        if ((v6 & 1) != 0)
          free(v2);
        v6 = 1;
        v2 = v9;
        if (!v9)
          return v6;
      }
      return 0;
    }
    return 1;
  }
  if (v4 == 1)
  {
    while (_newrpclib_xdr_pmap(a1, (int *)v2) && _newrpclib_xdr_int32_t(a1, (int *)&v11))
    {
      if (!v11)
      {
        v2[2] = 0;
        return 1;
      }
      if (v2[2])
      {
        v7 = 1;
        v2 = (_QWORD *)v2[2];
      }
      else
      {
        v8 = calloc(1uLL, 0x18uLL);
        v2[2] = v8;
        if (!v8)
          return 0;
        v7 = v11;
        v2 = v8;
      }
      if (!v7)
        return 1;
    }
    return 0;
  }
  if (v4)
    return 1;
  while (_newrpclib_xdr_pmap(a1, (int *)v2))
  {
    v2 = (_QWORD *)v2[2];
    v11 = v2 != 0;
    v5 = _newrpclib_xdr_int32_t(a1, (int *)&v11);
    if (!v5 || !v2)
      return v5 != 0;
  }
  return 0;
}

uint64_t _newrpclib_xdr_pmap_call_args(uint64_t (***a1)(void), uint64_t a2)
{
  uint64_t result;

  result = _newrpclib_xdr_uint32_t(a1, (int *)a2);
  if ((_DWORD)result)
  {
    result = _newrpclib_xdr_uint32_t(a1, (int *)(a2 + 4));
    if ((_DWORD)result)
    {
      result = _newrpclib_xdr_uint32_t(a1, (int *)(a2 + 8));
      if ((_DWORD)result)
        return _newrpclib_xdr_bytes(a1, (void **)(a2 + 24), (int *)(a2 + 16), 0x10000u) != 0;
    }
  }
  return result;
}

uint64_t _newrpclib_xdr_pmap_call_result(uint64_t (***a1)(void), uint64_t a2)
{
  uint64_t result;

  result = _newrpclib_xdr_uint32_t(a1, (int *)a2);
  if ((_DWORD)result)
    return _newrpclib_xdr_bytes(a1, (void **)(a2 + 16), (int *)(a2 + 8), 0x10000u) != 0;
  return result;
}

_QWORD *_newrpclib_pmap_set(int a1, int a2, int a3, int a4)
{
  _QWORD *result;
  _QWORD *v9;
  int v10;
  unsigned int v11;
  _DWORD v12[4];
  int v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v13 = -1;
  if (_newrpclib_pmap_wakeup())
    return 0;
  v11 = 0;
  v14[0] = 0x100007F6F000210;
  v14[1] = 0;
  result = _newrpclib_clntudp_bufcreate_timeout((unsigned __int8 *)v14, 0x186A0u, 2u, &v13, 400, 400, &set_retry_timeout, &set_total_timeout);
  if (result)
  {
    v9 = result;
    v12[0] = a1;
    v12[1] = a2;
    v12[2] = a3;
    v12[3] = a4;
    v10 = _newrpclib_pmapproc_set_2((uint64_t)v12, &v11, (uint64_t)result);
    (*(void (**)(_QWORD *))(v9[1] + 32))(v9);
    if (v10)
      return 0;
    else
      return (_QWORD *)v11;
  }
  return result;
}

_QWORD *_newrpclib_pmap_unset(int a1, int a2)
{
  _QWORD *result;
  _QWORD *v5;
  int v6;
  unsigned int v7;
  _DWORD v8[4];
  int v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v9 = -1;
  if (_newrpclib_pmap_wakeup())
    return 0;
  v7 = 0;
  v10[0] = 0x100007F6F000210;
  v10[1] = 0;
  result = _newrpclib_clntudp_bufcreate_timeout((unsigned __int8 *)v10, 0x186A0u, 2u, &v9, 400, 400, &unset_retry_timeout, &unset_total_timeout);
  if (result)
  {
    v5 = result;
    v8[0] = a1;
    v8[1] = a2;
    v8[2] = 0;
    v8[3] = 0;
    v6 = _newrpclib_pmapproc_unset_2((uint64_t)v8, &v7, (uint64_t)result);
    (*(void (**)(_QWORD *))(v5[1] + 32))(v5);
    if (v6)
      return 0;
    else
      return (_QWORD *)v7;
  }
  return result;
}

uint64_t _newrpclib_pmapproc_null_2(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 8))();
}

uint64_t _newrpclib_pmapproc_set_2(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  *a2 = 0;
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t (*)(uint64_t (***)(void), int *), uint64_t, uint64_t (*)(uint64_t (***)(void), _BOOL4 *), _DWORD *, uint64_t, _QWORD))(a3 + 8))(a3, 1, _newrpclib_xdr_pmap, a1, _newrpclib_xdr_BOOL, a2, 25, 0);
}

uint64_t _newrpclib_pmapproc_unset_2(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  *a2 = 0;
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t (*)(uint64_t (***)(void), int *), uint64_t, uint64_t (*)(uint64_t (***)(void), _BOOL4 *), _DWORD *, uint64_t, _QWORD))(a3 + 8))(a3, 2, _newrpclib_xdr_pmap, a1, _newrpclib_xdr_BOOL, a2, 25, 0);
}

uint64_t _newrpclib_pmapproc_getport_2(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  *a2 = 0;
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t (*)(uint64_t (***)(void), int *), uint64_t, uint64_t (*)(uint64_t (***)(void), int *), _DWORD *, uint64_t, _QWORD))(a3 + 8))(a3, 3, _newrpclib_xdr_pmap, a1, _newrpclib_xdr_uint32_t, a2, 25, 0);
}

uint64_t _newrpclib_pmapproc_dump_2(_QWORD *a1, uint64_t a2)
{
  *a1 = 0;
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t (*)(), _QWORD, BOOL (*)(uint64_t (***)(void), void **), _QWORD *, uint64_t, _QWORD))(a2 + 8))(a2, 4, _newrpclib_xdr_void, 0, _newrpclib_xdr_pmaplist_ptr, a1, 25, 0);
}

uint64_t _newrpclib_pmapproc_callit_2(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t (*)(uint64_t (***)(void), uint64_t), uint64_t, uint64_t (*)(uint64_t (***)(void), uint64_t), _QWORD *, uint64_t, _QWORD))(a3 + 8))(a3, 5, _newrpclib_xdr_pmap_call_args, a1, _newrpclib_xdr_pmap_call_result, a2, 25, 0);
}

uint64_t _newrpclib_rpcbproc_set_3(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  *a2 = 0;
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t (*)(uint64_t (***)(void), uint64_t), uint64_t, uint64_t (*)(uint64_t (***)(void), _BOOL4 *), _DWORD *, uint64_t, _QWORD))(a3 + 8))(a3, 1, _newrpclib_xdr_rpcb, a1, _newrpclib_xdr_BOOL, a2, 25, 0);
}

uint64_t _newrpclib_rpcbproc_unset_3(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  *a2 = 0;
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t (*)(uint64_t (***)(void), uint64_t), uint64_t, uint64_t (*)(uint64_t (***)(void), _BOOL4 *), _DWORD *, uint64_t, _QWORD))(a3 + 8))(a3, 2, _newrpclib_xdr_rpcb, a1, _newrpclib_xdr_BOOL, a2, 25, 0);
}

uint64_t _newrpclib_rpcbproc_getaddr_3(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  *a2 = 0;
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t (*)(uint64_t (***)(void), uint64_t), uint64_t, uint64_t (*)(uint64_t (***)(void), char **), _QWORD *, uint64_t, _QWORD))(a3 + 8))(a3, 3, _newrpclib_xdr_rpcb, a1, _newrpclib_xdr_wrapstring, a2, 25, 0);
}

uint64_t _newrpclib_rpcbproc_dump_3(_QWORD *a1, uint64_t a2)
{
  *a1 = 0;
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t (*)(), _QWORD, BOOL (*)(uint64_t (***)(void), void **), _QWORD *, uint64_t, _QWORD))(a2 + 8))(a2, 4, _newrpclib_xdr_void, 0, _newrpclib_xdr_rpcblist_ptr, a1, 25, 0);
}

uint64_t _newrpclib_rpcbproc_callit_3(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t (*)(uint64_t (***)(void), uint64_t), uint64_t, uint64_t (*)(uint64_t (***)(void), uint64_t), _QWORD *, uint64_t, _QWORD))(a3 + 8))(a3, 5, _newrpclib_xdr_rpcb_rmtcallargs, a1, _newrpclib_xdr_rpcb_rmtcallres, a2, 25, 0);
}

uint64_t _newrpclib_rpcbproc_gettime_3(_DWORD *a1, uint64_t a2)
{
  *a1 = 0;
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t (*)(), _QWORD, uint64_t (*)(uint64_t (***)(void), int *), _DWORD *, uint64_t, _QWORD))(a2 + 8))(a2, 6, _newrpclib_xdr_void, 0, _newrpclib_xdr_uint32_t, a1, 25, 0);
}

uint64_t _newrpclib_rpcbproc_uaddr2taddr_3(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;

  v4 = a1;
  a2[1] = 0;
  a2[2] = 0;
  *a2 = 0;
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t (*)(uint64_t (***)(void), char **), uint64_t *, uint64_t (*)(uint64_t (***)(void), uint64_t), _QWORD *, uint64_t, _QWORD))(a3 + 8))(a3, 7, _newrpclib_xdr_wrapstring, &v4, _newrpclib_xdr_netbuf, a2, 25, 0);
}

uint64_t _newrpclib_rpcbproc_taddr2uaddr_3(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  *a2 = 0;
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t (*)(uint64_t (***)(void), uint64_t), uint64_t, uint64_t (*)(uint64_t (***)(void), char **), _QWORD *, uint64_t, _QWORD))(a3 + 8))(a3, 8, _newrpclib_xdr_netbuf, a1, _newrpclib_xdr_wrapstring, a2, 25, 0);
}

uint64_t _newrpclib_rpcbproc_set_4(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  *a2 = 0;
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t (*)(uint64_t (***)(void), uint64_t), uint64_t, uint64_t (*)(uint64_t (***)(void), _BOOL4 *), _DWORD *, uint64_t, _QWORD))(a3 + 8))(a3, 1, _newrpclib_xdr_rpcb, a1, _newrpclib_xdr_BOOL, a2, 25, 0);
}

uint64_t _newrpclib_rpcbproc_unset_4(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  *a2 = 0;
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t (*)(uint64_t (***)(void), uint64_t), uint64_t, uint64_t (*)(uint64_t (***)(void), _BOOL4 *), _DWORD *, uint64_t, _QWORD))(a3 + 8))(a3, 2, _newrpclib_xdr_rpcb, a1, _newrpclib_xdr_BOOL, a2, 25, 0);
}

uint64_t _newrpclib_rpcbproc_getaddr_4(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  *a2 = 0;
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t (*)(uint64_t (***)(void), uint64_t), uint64_t, uint64_t (*)(uint64_t (***)(void), char **), _QWORD *, uint64_t, _QWORD))(a3 + 8))(a3, 3, _newrpclib_xdr_rpcb, a1, _newrpclib_xdr_wrapstring, a2, 25, 0);
}

uint64_t _newrpclib_rpcbproc_dump_4(_QWORD *a1, uint64_t a2)
{
  *a1 = 0;
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t (*)(), _QWORD, BOOL (*)(uint64_t (***)(void), void **), _QWORD *, uint64_t, _QWORD))(a2 + 8))(a2, 4, _newrpclib_xdr_void, 0, _newrpclib_xdr_rpcblist_ptr, a1, 25, 0);
}

uint64_t _newrpclib_rpcbproc_bcast_4(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t (*)(uint64_t (***)(void), uint64_t), uint64_t, uint64_t (*)(uint64_t (***)(void), uint64_t), _QWORD *, uint64_t, _QWORD))(a3 + 8))(a3, 5, _newrpclib_xdr_rpcb_rmtcallargs, a1, _newrpclib_xdr_rpcb_rmtcallres, a2, 25, 0);
}

uint64_t _newrpclib_rpcbproc_gettime_4(_DWORD *a1, uint64_t a2)
{
  *a1 = 0;
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t (*)(), _QWORD, uint64_t (*)(uint64_t (***)(void), int *), _DWORD *, uint64_t, _QWORD))(a2 + 8))(a2, 6, _newrpclib_xdr_void, 0, _newrpclib_xdr_uint32_t, a1, 25, 0);
}

uint64_t _newrpclib_rpcbproc_uaddr2taddr_4(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;

  v4 = a1;
  a2[1] = 0;
  a2[2] = 0;
  *a2 = 0;
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t (*)(uint64_t (***)(void), char **), uint64_t *, uint64_t (*)(uint64_t (***)(void), uint64_t), _QWORD *, uint64_t, _QWORD))(a3 + 8))(a3, 7, _newrpclib_xdr_wrapstring, &v4, _newrpclib_xdr_netbuf, a2, 25, 0);
}

uint64_t _newrpclib_rpcbproc_taddr2uaddr_4(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  *a2 = 0;
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t (*)(uint64_t (***)(void), uint64_t), uint64_t, uint64_t (*)(uint64_t (***)(void), char **), _QWORD *, uint64_t, _QWORD))(a3 + 8))(a3, 8, _newrpclib_xdr_netbuf, a1, _newrpclib_xdr_wrapstring, a2, 25, 0);
}

uint64_t _newrpclib_rpcbproc_getversaddr_4(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  *a2 = 0;
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t (*)(uint64_t (***)(void), uint64_t), uint64_t, uint64_t (*)(uint64_t (***)(void), char **), _QWORD *, uint64_t, _QWORD))(a3 + 8))(a3, 9, _newrpclib_xdr_rpcb, a1, _newrpclib_xdr_wrapstring, a2, 25, 0);
}

uint64_t _newrpclib_rpcbproc_indirect_4(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t (*)(uint64_t (***)(void), uint64_t), uint64_t, uint64_t (*)(uint64_t (***)(void), uint64_t), _QWORD *, uint64_t, _QWORD))(a3 + 8))(a3, 10, _newrpclib_xdr_rpcb_rmtcallargs, a1, _newrpclib_xdr_rpcb_rmtcallres, a2, 25, 0);
}

uint64_t _newrpclib_rpcbproc_getaddrlist_4(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  *a2 = 0;
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t (*)(uint64_t (***)(void), uint64_t), uint64_t, BOOL (*)(uint64_t (***)(void), void **), _QWORD *, uint64_t, _QWORD))(a3 + 8))(a3, 11, _newrpclib_xdr_rpcb, a1, _newrpclib_xdr_rpcb_entry_list_ptr, a2, 25, 0);
}

uint64_t _newrpclib_rpcbproc_getstat_4(_OWORD *a1, uint64_t a2)
{
  a1[13] = 0u;
  a1[14] = 0u;
  a1[11] = 0u;
  a1[12] = 0u;
  a1[9] = 0u;
  a1[10] = 0u;
  a1[7] = 0u;
  a1[8] = 0u;
  a1[5] = 0u;
  a1[6] = 0u;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t (*)(), _QWORD, BOOL (*)(uint64_t, uint64_t), _OWORD *, uint64_t, _QWORD))(a2 + 8))(a2, 12, _newrpclib_xdr_void, 0, _newrpclib_xdr_rpcb_stat_byvers, a1, 25, 0);
}

uint64_t _newrpclib_xdr_rpcb(uint64_t (***a1)(void), uint64_t a2)
{
  uint64_t result;

  result = _newrpclib_xdr_uint32_t(a1, (int *)a2);
  if ((_DWORD)result)
  {
    result = _newrpclib_xdr_uint32_t(a1, (int *)(a2 + 4));
    if ((_DWORD)result)
    {
      result = _newrpclib_xdr_string(a1, (char **)(a2 + 8), 0x10000u);
      if ((_DWORD)result)
      {
        result = _newrpclib_xdr_string(a1, (char **)(a2 + 16), 0x10000u);
        if ((_DWORD)result)
          return _newrpclib_xdr_string(a1, (char **)(a2 + 24), 0x10000u) != 0;
      }
    }
  }
  return result;
}

BOOL _newrpclib_xdr_rp__list(uint64_t (***a1)(void), _QWORD *a2)
{
  _QWORD *v2;
  int v4;
  int v5;
  uint64_t v6;
  int v7;
  _QWORD *v8;
  _QWORD *v9;
  _BOOL4 v11;

  v2 = a2;
  v11 = 0;
  v4 = *(_DWORD *)a1;
  if (*(_DWORD *)a1 == 2)
  {
    if (a2)
    {
      LOBYTE(v6) = 0;
      while (_newrpclib_xdr_rpcb(a1, (uint64_t)v2))
      {
        v9 = (_QWORD *)v2[4];
        if ((v6 & 1) != 0)
          free(v2);
        v6 = 1;
        v2 = v9;
        if (!v9)
          return v6;
      }
      return 0;
    }
    return 1;
  }
  if (v4 == 1)
  {
    while (_newrpclib_xdr_rpcb(a1, (uint64_t)v2) && _newrpclib_xdr_int32_t(a1, (int *)&v11))
    {
      if (!v11)
      {
        v2[4] = 0;
        return 1;
      }
      if (v2[4])
      {
        v7 = 1;
        v2 = (_QWORD *)v2[4];
      }
      else
      {
        v8 = calloc(1uLL, 0x28uLL);
        v2[4] = v8;
        if (!v8)
          return 0;
        v7 = v11;
        v2 = v8;
      }
      if (!v7)
        return 1;
    }
    return 0;
  }
  if (v4)
    return 1;
  while (_newrpclib_xdr_rpcb(a1, (uint64_t)v2))
  {
    v2 = (_QWORD *)v2[4];
    v11 = v2 != 0;
    v5 = _newrpclib_xdr_int32_t(a1, (int *)&v11);
    if (!v5 || !v2)
      return v5 != 0;
  }
  return 0;
}

BOOL _newrpclib_xdr_rpcblist_ptr(uint64_t (***a1)(void), void **a2)
{
  return _newrpclib_xdr_pointer(a1, a2, 0x28uLL, (uint64_t (*)(_DWORD *, void *, size_t))_newrpclib_xdr_rp__list) != 0;
}

uint64_t _newrpclib_xdr_rpcb_rmtcallargs(uint64_t (***a1)(void), uint64_t a2)
{
  uint64_t result;

  result = _newrpclib_xdr_uint32_t(a1, (int *)a2);
  if ((_DWORD)result)
  {
    result = _newrpclib_xdr_uint32_t(a1, (int *)(a2 + 4));
    if ((_DWORD)result)
    {
      result = _newrpclib_xdr_uint32_t(a1, (int *)(a2 + 8));
      if ((_DWORD)result)
        return _newrpclib_xdr_bytes(a1, (void **)(a2 + 24), (int *)(a2 + 16), 0x10000u) != 0;
    }
  }
  return result;
}

uint64_t _newrpclib_xdr_rpcb_rmtcallres(uint64_t (***a1)(void), uint64_t a2)
{
  uint64_t result;

  result = _newrpclib_xdr_string(a1, (char **)a2, 0x10000u);
  if ((_DWORD)result)
    return _newrpclib_xdr_bytes(a1, (void **)(a2 + 16), (int *)(a2 + 8), 0x10000u) != 0;
  return result;
}

uint64_t _newrpclib_xdr_rpcb_entry(uint64_t (***a1)(void), uint64_t a2)
{
  uint64_t result;

  result = _newrpclib_xdr_string(a1, (char **)a2, 0x10000u);
  if ((_DWORD)result)
  {
    result = _newrpclib_xdr_string(a1, (char **)(a2 + 8), 0x10000u);
    if ((_DWORD)result)
    {
      result = _newrpclib_xdr_uint32_t(a1, (int *)(a2 + 16));
      if ((_DWORD)result)
      {
        result = _newrpclib_xdr_string(a1, (char **)(a2 + 24), 0x10000u);
        if ((_DWORD)result)
          return _newrpclib_xdr_string(a1, (char **)(a2 + 32), 0x10000u) != 0;
      }
    }
  }
  return result;
}

BOOL _newrpclib_xdr_rpcb_entry_list(uint64_t (***a1)(void), _QWORD *a2)
{
  _QWORD *v2;
  int v4;
  int v5;
  uint64_t v6;
  int v7;
  _QWORD *v8;
  _QWORD *v9;
  _BOOL4 v11;

  v2 = a2;
  v11 = 0;
  v4 = *(_DWORD *)a1;
  if (*(_DWORD *)a1 == 2)
  {
    if (a2)
    {
      LOBYTE(v6) = 0;
      while (_newrpclib_xdr_rpcb_entry(a1, (uint64_t)v2))
      {
        v9 = (_QWORD *)v2[5];
        if ((v6 & 1) != 0)
          free(v2);
        v6 = 1;
        v2 = v9;
        if (!v9)
          return v6;
      }
      return 0;
    }
    return 1;
  }
  if (v4 == 1)
  {
    while (_newrpclib_xdr_rpcb_entry(a1, (uint64_t)v2)
         && _newrpclib_xdr_int32_t(a1, (int *)&v11))
    {
      if (!v11)
      {
        v2[5] = 0;
        return 1;
      }
      if (v2[5])
      {
        v7 = 1;
        v2 = (_QWORD *)v2[5];
      }
      else
      {
        v8 = calloc(1uLL, 0x30uLL);
        v2[5] = v8;
        if (!v8)
          return 0;
        v7 = v11;
        v2 = v8;
      }
      if (!v7)
        return 1;
    }
    return 0;
  }
  if (v4)
    return 1;
  while (_newrpclib_xdr_rpcb_entry(a1, (uint64_t)v2))
  {
    v2 = (_QWORD *)v2[5];
    v11 = v2 != 0;
    v5 = _newrpclib_xdr_int32_t(a1, (int *)&v11);
    if (!v5 || !v2)
      return v5 != 0;
  }
  return 0;
}

BOOL _newrpclib_xdr_rpcb_entry_list_ptr(uint64_t (***a1)(void), void **a2)
{
  return _newrpclib_xdr_pointer(a1, a2, 0x30uLL, (uint64_t (*)(_DWORD *, void *, size_t))_newrpclib_xdr_rpcb_entry_list) != 0;
}

BOOL _newrpclib_xdr_rpcbs_addrlist(uint64_t (***a1)(void), void *a2)
{
  void *v2;
  int v4;
  int v5;
  uint64_t v6;
  int v7;
  void *v8;
  void *v9;
  _BOOL4 v11;

  v2 = a2;
  v11 = 0;
  v4 = *(_DWORD *)a1;
  if (*(_DWORD *)a1 == 2)
  {
    if (a2)
    {
      LOBYTE(v6) = 0;
      while (_newrpclib_xdr_uint32_t(a1, (int *)v2)
           && _newrpclib_xdr_uint32_t(a1, (int *)v2 + 1)
           && _newrpclib_xdr_int32_t(a1, (int *)v2 + 2)
           && _newrpclib_xdr_int32_t(a1, (int *)v2 + 3)
           && _newrpclib_xdr_string(a1, (char **)v2 + 2, 0x10000u))
      {
        v9 = (void *)*((_QWORD *)v2 + 3);
        if ((v6 & 1) != 0)
          free(v2);
        v6 = 1;
        v2 = v9;
        if (!v9)
          return v6;
      }
      return 0;
    }
    return 1;
  }
  if (v4 == 1)
  {
    while (_newrpclib_xdr_uint32_t(a1, (int *)v2)
         && _newrpclib_xdr_uint32_t(a1, (int *)v2 + 1)
         && _newrpclib_xdr_int32_t(a1, (int *)v2 + 2)
         && _newrpclib_xdr_int32_t(a1, (int *)v2 + 3)
         && _newrpclib_xdr_string(a1, (char **)v2 + 2, 0x10000u)
         && _newrpclib_xdr_int32_t(a1, (int *)&v11))
    {
      if (!v11)
      {
        *((_QWORD *)v2 + 3) = 0;
        return 1;
      }
      if (*((_QWORD *)v2 + 3))
      {
        v7 = 1;
        v2 = (void *)*((_QWORD *)v2 + 3);
      }
      else
      {
        v8 = calloc(1uLL, 0x20uLL);
        *((_QWORD *)v2 + 3) = v8;
        if (!v8)
          return 0;
        v7 = v11;
        v2 = v8;
      }
      if (!v7)
        return 1;
    }
    return 0;
  }
  if (v4)
    return 1;
  while (_newrpclib_xdr_uint32_t(a1, (int *)v2)
       && _newrpclib_xdr_uint32_t(a1, (int *)v2 + 1)
       && _newrpclib_xdr_int32_t(a1, (int *)v2 + 2)
       && _newrpclib_xdr_int32_t(a1, (int *)v2 + 3)
       && _newrpclib_xdr_string(a1, (char **)v2 + 2, 0x10000u))
  {
    v2 = (void *)*((_QWORD *)v2 + 3);
    v11 = v2 != 0;
    v5 = _newrpclib_xdr_int32_t(a1, (int *)&v11);
    if (!v5 || !v2)
      return v5 != 0;
  }
  return 0;
}

BOOL _newrpclib_xdr_rpcbs_rmtcalllist(uint64_t (***a1)(void), void *a2)
{
  void *v2;
  int v4;
  int v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  _BOOL4 v11;

  v2 = a2;
  v11 = 0;
  v4 = *(_DWORD *)a1;
  if (*(_DWORD *)a1 == 2)
  {
    if (a2)
    {
      LOBYTE(v6) = 0;
      while (_newrpclib_xdr_uint32_t(a1, (int *)v2)
           && _newrpclib_xdr_uint32_t(a1, (int *)v2 + 1)
           && _newrpclib_xdr_uint32_t(a1, (int *)v2 + 2)
           && _newrpclib_xdr_int32_t(a1, (int *)v2 + 3)
           && _newrpclib_xdr_int32_t(a1, (int *)v2 + 4)
           && _newrpclib_xdr_int32_t(a1, (int *)v2 + 5)
           && _newrpclib_xdr_string(a1, (char **)v2 + 3, 0x10000u))
      {
        v7 = (void *)*((_QWORD *)v2 + 4);
        if ((v6 & 1) != 0)
          free(v2);
        v6 = 1;
        v2 = v7;
        if (!v7)
          return v6;
      }
      return 0;
    }
    return 1;
  }
  if (v4 == 1)
  {
    v6 = 1;
    while (_newrpclib_xdr_uint32_t(a1, (int *)v2)
         && _newrpclib_xdr_uint32_t(a1, (int *)v2 + 1)
         && _newrpclib_xdr_uint32_t(a1, (int *)v2 + 2)
         && _newrpclib_xdr_int32_t(a1, (int *)v2 + 3)
         && _newrpclib_xdr_int32_t(a1, (int *)v2 + 4)
         && _newrpclib_xdr_int32_t(a1, (int *)v2 + 5)
         && _newrpclib_xdr_string(a1, (char **)v2 + 3, 0x10000u)
         && _newrpclib_xdr_int32_t(a1, (int *)&v11))
    {
      if (!v11)
      {
        *((_QWORD *)v2 + 4) = 0;
        return 1;
      }
      if (*((_QWORD *)v2 + 4))
      {
        v8 = 1;
        v2 = (void *)*((_QWORD *)v2 + 4);
      }
      else
      {
        v9 = calloc(1uLL, 0x28uLL);
        *((_QWORD *)v2 + 4) = v9;
        if (!v9)
          return 0;
        v8 = v11;
        v2 = v9;
      }
      if (!v8)
        return v6;
    }
    return 0;
  }
  if (v4)
    return 1;
  while (_newrpclib_xdr_uint32_t(a1, (int *)v2)
       && _newrpclib_xdr_uint32_t(a1, (int *)v2 + 1)
       && _newrpclib_xdr_uint32_t(a1, (int *)v2 + 2)
       && _newrpclib_xdr_int32_t(a1, (int *)v2 + 3)
       && _newrpclib_xdr_int32_t(a1, (int *)v2 + 4)
       && _newrpclib_xdr_int32_t(a1, (int *)v2 + 5)
       && _newrpclib_xdr_string(a1, (char **)v2 + 3, 0x10000u))
  {
    v2 = (void *)*((_QWORD *)v2 + 4);
    v11 = v2 != 0;
    v5 = _newrpclib_xdr_int32_t(a1, (int *)&v11);
    if (!v5 || !v2)
      return v5 != 0;
  }
  return 0;
}

BOOL _newrpclib_xdr_rpcbs_proc(uint64_t a1, uint64_t a2)
{
  return _newrpclib_xdr_vector(a1, a2, 13, 4u, (uint64_t (*)(uint64_t, uint64_t))_newrpclib_xdr_int32_t) != 0;
}

BOOL _newrpclib_xdr_rpcbs_addrlist_ptr(uint64_t (***a1)(void), void **a2)
{
  return _newrpclib_xdr_pointer(a1, a2, 0x20uLL, (uint64_t (*)(_DWORD *, void *, size_t))_newrpclib_xdr_rpcbs_addrlist) != 0;
}

BOOL _newrpclib_xdr_rpcbs_rmtcalllist_ptr(uint64_t (***a1)(void), void **a2)
{
  return _newrpclib_xdr_pointer(a1, a2, 0x28uLL, (uint64_t (*)(_DWORD *, void *, size_t))_newrpclib_xdr_rpcbs_rmtcalllist) != 0;
}

uint64_t _newrpclib_xdr_rpcb_stat(uint64_t (***a1)(void), uint64_t a2)
{
  uint64_t result;

  result = _newrpclib_xdr_vector((uint64_t)a1, a2, 13, 4u, (uint64_t (*)(uint64_t, uint64_t))_newrpclib_xdr_int32_t);
  if ((_DWORD)result)
  {
    result = _newrpclib_xdr_int32_t(a1, (int *)(a2 + 52));
    if ((_DWORD)result)
    {
      result = _newrpclib_xdr_int32_t(a1, (int *)(a2 + 56));
      if ((_DWORD)result)
      {
        result = _newrpclib_xdr_pointer(a1, (void **)(a2 + 64), 0x20uLL, (uint64_t (*)(_DWORD *, void *, size_t))_newrpclib_xdr_rpcbs_addrlist);
        if ((_DWORD)result)
          return _newrpclib_xdr_pointer(a1, (void **)(a2 + 72), 0x28uLL, (uint64_t (*)(_DWORD *, void *, size_t))_newrpclib_xdr_rpcbs_rmtcalllist) != 0;
      }
    }
  }
  return result;
}

BOOL _newrpclib_xdr_rpcb_stat_byvers(uint64_t a1, uint64_t a2)
{
  return _newrpclib_xdr_vector(a1, a2, 3, 0x50u, (uint64_t (*)(uint64_t, uint64_t))_newrpclib_xdr_rpcb_stat) != 0;
}

uint64_t _newrpclib_xdr_netbuf(uint64_t (***a1)(void), uint64_t a2)
{
  uint64_t result;

  result = _newrpclib_xdr_uint32_t(a1, (int *)a2);
  if ((_DWORD)result)
    return _newrpclib_xdr_bytes(a1, (void **)(a2 + 16), (int *)(a2 + 8), 0x10000u) != 0;
  return result;
}

BOOL _newrpclib_rpcb_getaddr_timeout(unsigned __int8 *a1, char *a2, unsigned int a3, unsigned int a4, uint64_t a5, __int128 *a6)
{
  unsigned int v6;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  int v16;
  uint64_t i;
  _BOOL8 result;
  _QWORD *v19;
  int v20;
  unsigned int v21;
  unsigned int v22;
  _OWORD __src[8];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v21 = 2;
  v22 = 4;
  memset(__src, 0, sizeof(__src));
  v6 = a1[1];
  if (v6 > 0x1E || ((1 << v6) & 0x40000006) == 0)
  {
    result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    _newrpclib_rpcb_getaddr_timeout_cold_1(v6);
    return 0;
  }
  if (v6 == 2)
    v13 = 2;
  else
    v13 = 3;
  __memcpy_chk();
  v14 = getrpcbind_handle(a2, (uint64_t)__src, v13, a5, a6);
  if (!v14)
  {
    i = 4;
    goto LABEL_14;
  }
  v15 = (uint64_t)v14;
  v16 = rpcbind_getaddr_generic((uint64_t)v14, v13, a2, a3, a4, (uint64_t)__src);
  if (!handle_callerror(v15, (int *)&v21, &v22))
  {
    (*(void (**)(uint64_t))(*(_QWORD *)(v15 + 8) + 32))(v15);
    for (i = v22; i >= v21; i = (i - 1))
    {
LABEL_14:
      if ((_DWORD)v13 != (_DWORD)i)
      {
        v19 = getrpcbind_handle(a2, (uint64_t)__src, i, a5, a6);
        if (v19)
        {
          v15 = (uint64_t)v19;
          v16 = rpcbind_getaddr_generic((uint64_t)v19, i, a2, a3, a4, (uint64_t)__src);
          if (handle_callerror(v15, (int *)&v21, &v22))
            goto LABEL_21;
          (*(void (**)(uint64_t))(*(_QWORD *)(v15 + 8) + 32))(v15);
        }
      }
    }
    return 0;
  }
LABEL_21:
  (*(void (**)(uint64_t))(*(_QWORD *)(v15 + 8) + 32))(v15);
  if (!v16 || LOBYTE(__src[0]) > *a1)
    return 0;
  if (a1[1] == 30)
    v20 = *((_DWORD *)a1 + 6);
  else
    v20 = 0;
  memcpy(a1, __src, LOBYTE(__src[0]));
  if (a1[1] == 30 && v20 != *((_DWORD *)a1 + 6))
    *((_DWORD *)a1 + 6) = v20;
  return 1;
}

_QWORD *getrpcbind_handle(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, __int128 *a5)
{
  _QWORD *result;
  _OWORD *v10;
  int v11;
  int v12;
  uint64_t v13;

  v13 = 0;
  v11 = -1;
  v12 = 0;
  if ((_DWORD)a3 == 2 && portmap_netid)
  {
    if (_newrpclib_netid2socparms(portmap_netid, (_DWORD *)&v13 + 1, &v13, &v12, 0))
      v12 = 17;
  }
  else if (_newrpclib_netid2socparms(a1, (_DWORD *)&v13 + 1, &v13, &v12, 0))
  {
    goto LABEL_14;
  }
  if (HIDWORD(v13) == 1)
  {
    if ((_DWORD)v13 == 1)
      return clntstrm_create_timeout((const sockaddr *)a2, 100000, a3, &v11, 0x190u, 0x190u, a4, a5);
    goto LABEL_14;
  }
  if (HIDWORD(v13) != 30 && HIDWORD(v13) != 2)
  {
LABEL_14:
    v10 = _newrpclib___rpc_createerr();
    result = 0;
    *v10 = xmmword_22D0F9110;
    return result;
  }
  if (v12 != 6)
  {
    if (v12 == 17)
    {
      *(_WORD *)(a2 + 2) = 28416;
      return (_QWORD *)((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *, uint64_t, uint64_t, uint64_t, __int128 *))_newrpclib_clntudp_bufcreate_timeout)(a2, 100000, a3, &v11, 400, 400, a4, a5);
    }
    goto LABEL_14;
  }
  *(_WORD *)(a2 + 2) = 28416;
  return _newrpclib_clnttcp_create_timeout((const sockaddr *)a2, 100000, a3, &v11, 0x190u, 0x190u, a4, a5);
}

uint64_t rpcbind_getaddr_generic(uint64_t a1, int a2, char *a3, unsigned int a4, unsigned int a5, uint64_t a6)
{
  int v12;
  _DWORD *v13;
  uint64_t result;
  int v15;
  void (*v16)(uint64_t, char *);
  char *v17;
  int v18;
  _DWORD *v19;
  int v20;
  int v21;
  _DWORD *v22;
  int v23;
  void (*v24)(uint64_t, char *);
  char *v25;
  _DWORD *v26;
  uint64_t v27;
  _DWORD v28[4];
  int v29[2];
  __int128 v30;
  __int128 v31;

  v30 = 0u;
  v31 = 0u;
  *(_QWORD *)v29 = 0;
  *(_DWORD *)_newrpclib___rpc_createerr() = 0;
  if ((a2 - 3) < 2)
  {
    *(_QWORD *)&v30 = __PAIR64__(a5, a4);
    *((_QWORD *)&v30 + 1) = a3;
    *(_QWORD *)&v31 = &unk_22D0FABCD;
    *((_QWORD *)&v31 + 1) = &unk_22D0FABCD;
    if (a2 == 3)
      v12 = _newrpclib_rpcbproc_getaddr_3((uint64_t)&v30, v29, a1);
    else
      v12 = _newrpclib_rpcbproc_getaddr_4((uint64_t)&v30, v29, a1);
    v15 = v12;
    v16 = *(void (**)(uint64_t, char *))(*(_QWORD *)(a1 + 8) + 16);
    v17 = (char *)_newrpclib___rpc_createerr();
    v16(a1, v17 + 4);
    if (v15)
    {
      if ((v15 & 0xFFFFFFFE) != 0xE)
        return 0;
      goto LABEL_18;
    }
    if (!**(_BYTE **)v29)
    {
      v15 = 15;
      goto LABEL_18;
    }
    if (_newrpclib_uaddr2sa(*(const char **)v29, a3, (unsigned __int8 *)a6))
    {
      *((_DWORD *)_newrpclib___rpc_createerr() + 1) = 12;
      v18 = *__error();
      goto LABEL_17;
    }
    return 1;
  }
  if (a2 == 2)
  {
    v27 = 0;
    if (*(_BYTE *)(a6 + 1) == 30)
    {
      if (*(_DWORD *)(a6 + 8)
        || *(_DWORD *)(a6 + 12)
        || (v20 = *(_DWORD *)(a6 + 16), v20 != -65536) && (v20 || (*(_DWORD *)(a6 + 20) | 0x1000000) == 0x1000000))
      {
        *(_DWORD *)_newrpclib___rpc_createerr() = 14;
        *((_DWORD *)_newrpclib___rpc_createerr() + 1) = 12;
        v13 = _newrpclib___rpc_createerr();
        result = 0;
        v13[2] = 22;
        return result;
      }
    }
    if (_newrpclib_netid2socparms(a3, 0, 0, &v27, 1))
    {
      *(_DWORD *)_newrpclib___rpc_createerr() = 14;
      *((_DWORD *)_newrpclib___rpc_createerr() + 1) = 12;
      v21 = *__error();
      v22 = _newrpclib___rpc_createerr();
      result = 0;
      v22[2] = v21;
      return result;
    }
    v28[0] = a4;
    v28[1] = a5;
    v28[2] = v27;
    v28[3] = 0;
    v23 = _newrpclib_pmapproc_getport_2((uint64_t)v28, (_DWORD *)&v27 + 1, a1);
    v24 = *(void (**)(uint64_t, char *))(*(_QWORD *)(a1 + 8) + 16);
    v25 = (char *)_newrpclib___rpc_createerr();
    v24(a1, v25 + 4);
    if (!v23)
    {
      if ((HIDWORD(v27) - 0x10000) <= 0xFFFF0000)
      {
        v26 = _newrpclib___rpc_createerr();
        result = 0;
        *v26 = 15;
        return result;
      }
      *(_WORD *)(a6 + 2) = bswap32(HIDWORD(v27)) >> 16;
    }
    return 1;
  }
  *((_DWORD *)_newrpclib___rpc_createerr() + 1) = 12;
  v18 = 22;
LABEL_17:
  *((_DWORD *)_newrpclib___rpc_createerr() + 2) = v18;
  v15 = 14;
LABEL_18:
  v19 = _newrpclib___rpc_createerr();
  result = 0;
  *v19 = v15;
  return result;
}

uint64_t handle_callerror(uint64_t a1, int *a2, unsigned int *a3)
{
  uint64_t result;
  int v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;

  v10 = 0;
  v9 = 0;
  if (*(_DWORD *)_newrpclib___rpc_createerr())
    return 1;
  (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)(a1 + 8) + 16))(a1, &v9);
  if (!(_DWORD)v9)
    return 1;
  if ((_DWORD)v9 == 10)
    return 0;
  if ((_DWORD)v9 != 9)
  {
    *(_DWORD *)_newrpclib___rpc_createerr() = 14;
    return 1;
  }
  if (a2)
  {
    v7 = *a2;
    if (*a2 <= HIDWORD(v9))
      v7 = HIDWORD(v9);
    *a2 = v7;
  }
  if (!a3)
    return 0;
  result = 0;
  v8 = *a3;
  if (*a3 >= v10)
    v8 = v10;
  *a3 = v8;
  return result;
}

_QWORD *_newrpclib_rpcb_getversaddr_timeout(unsigned __int8 *a1, char *a2, int a3, int a4, uint64_t a5, __int128 *a6)
{
  _QWORD *result;
  _QWORD *v11;
  int v12;
  int v13[2];
  _DWORD v14[2];
  char *v15;
  void *v16;
  void *v17;

  result = getrpcbind_handle(a2, (uint64_t)a1, 4, a5, a6);
  if (result)
  {
    v11 = result;
    *(_QWORD *)v13 = 0;
    v14[0] = a3;
    v14[1] = a4;
    v16 = &unk_22D0FABCD;
    v17 = &unk_22D0FABCD;
    v15 = a2;
    v12 = _newrpclib_rpcbproc_getversaddr_4((uint64_t)v14, v13, (uint64_t)result);
    if (!v12)
    {
      if (_newrpclib_uaddr2sa(*(const char **)v13, a2, a1))
        v12 = 12;
      else
        v12 = 0;
    }
    (*(void (**)(_QWORD *))(v11[1] + 32))(v11);
    return (_QWORD *)(v12 == 0);
  }
  return result;
}

BOOL _newrpclib_rpcb_getaddr(unsigned __int8 *a1, char *a2, unsigned int a3, unsigned int a4)
{
  return _newrpclib_rpcb_getaddr_timeout(a1, a2, a3, a4, 0, 0);
}

_QWORD *_newrpclib_rpcb_getversaddr(unsigned __int8 *a1, char *a2, int a3, int a4)
{
  return _newrpclib_rpcb_getversaddr_timeout(a1, a2, a3, a4, 0, 0);
}

BOOL _newrpclib_rpcb_getaddr_for_host(char *a1, char *__s2, unsigned int a3, unsigned int a4, unsigned __int8 *a5)
{
  int v10;
  _BOOL8 result;
  size_t v12;
  int v13;
  _OWORD __src[8];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v13 = 0;
  v10 = _newrpclib_netid2socparms(__s2, &v13, 0, 0, 0);
  result = 0;
  if (!v10)
  {
    memset(__src, 0, sizeof(__src));
    if (gethostaddr(a1, v13, __src))
    {
      return 0;
    }
    else
    {
      result = _newrpclib_rpcb_getaddr_timeout((unsigned __int8 *)__src, __s2, a3, a4, 0, 0);
      if (result)
      {
        if (*a5 >= LOBYTE(__src[0]))
          v12 = LOBYTE(__src[0]);
        else
          v12 = *a5;
        memcpy(a5, __src, v12);
        return 1;
      }
    }
  }
  return result;
}

_QWORD *_newrpclib_rpcb_set(char *a1, unsigned int a2, unsigned int a3, char *a4)
{
  int v8;
  _QWORD *result;
  uint64_t v10;
  uid_t v11;
  int v12;
  char *pw_name;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  void *v17;
  passwd *v18;
  passwd v19;
  _OWORD v20[8];
  char v21[16];
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
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
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
  *(_OWORD *)v21 = 0u;
  v22 = 0u;
  memset(&v19, 0, sizeof(v19));
  v17 = 0;
  v18 = 0;
  v16 = 0;
  v14 = 0u;
  v15 = 0u;
  v8 = _newrpclib_netid2socparms(a1, &v16, 0, 0, 0);
  result = 0;
  if (!v8)
  {
    memset(v20, 0, sizeof(v20));
    switch((_DWORD)v16)
    {
      case 1:
        LOWORD(v20[0]) = 362;
        break;
      case 0x1E:
        LOWORD(v20[0]) = 7708;
        *(_OWORD *)((char *)v20 + 8) = *MEMORY[0x24BDAE880];
        break;
      case 2:
        LOWORD(v20[0]) = 528;
        DWORD1(v20[0]) = 16777343;
        break;
      default:
        return 0;
    }
    if (_newrpclib_pmap_wakeup())
      return 0;
    result = getrpcbind_handle(a1, (uint64_t)v20, 3, (uint64_t)&set_retry_timeout_0, &set_total_timeout_0);
    if (result)
    {
      v10 = (uint64_t)result;
      if (!_newrpclib_sa2uaddr(a4, (char **)&v17))
      {
        *(_QWORD *)&v14 = __PAIR64__(a3, a2);
        *((_QWORD *)&v14 + 1) = a1;
        *(_QWORD *)&v15 = v17;
        v11 = geteuid();
        v12 = getpwuid_r(v11, &v19, v21, 0x100uLL, &v18);
        pw_name = (char *)&unk_22D0FABCD;
        if (!v12 && v18)
          pw_name = v18->pw_name;
        *((_QWORD *)&v15 + 1) = pw_name;
        if (_newrpclib_rpcbproc_set_3((uint64_t)&v14, (_DWORD *)&v16 + 1, v10))
          HIDWORD(v16) = 0;
      }
      (*(void (**)(uint64_t))(*(_QWORD *)(v10 + 8) + 32))(v10);
      if (v17)
        free(v17);
      return (_QWORD *)HIDWORD(v16);
    }
  }
  return result;
}

_QWORD *_newrpclib_rpcb_unset(char *a1, int a2, int a3)
{
  const char *v6;
  char *v7;
  int v8;
  _QWORD *result;
  uint64_t v10;
  char *pw_name;
  char *v12;
  uid_t v13;
  _DWORD v14[2];
  char *v15;
  void *v16;
  char *v17;
  int v18;
  passwd *v19;
  passwd v20;
  unsigned int v21;
  _OWORD v22[8];
  char v23[16];
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
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v21 = 0;
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
  *(_OWORD *)v23 = 0u;
  v24 = 0u;
  memset(&v20, 0, sizeof(v20));
  v6 = portmap_netid;
  v19 = 0;
  if (!portmap_netid)
    v6 = "udp";
  if (a1)
    v7 = a1;
  else
    v7 = (char *)v6;
  v18 = 0;
  v8 = _newrpclib_netid2socparms(v7, &v18, 0, 0, 0);
  result = 0;
  if (!v8)
  {
    memset(v22, 0, sizeof(v22));
    if (v18 == 30)
    {
      LOWORD(v22[0]) = 7708;
      *(_OWORD *)((char *)v22 + 8) = *MEMORY[0x24BDAE880];
    }
    else
    {
      if (v18 != 2)
        return 0;
      LOWORD(v22[0]) = 528;
      DWORD1(v22[0]) = 16777343;
    }
    if (_newrpclib_pmap_wakeup())
      return 0;
    result = getrpcbind_handle(v7, (uint64_t)v22, 3, (uint64_t)&unset_retry_timeout_0, &unset_total_timeout_0);
    if (result)
    {
      v10 = (uint64_t)result;
      v14[0] = a2;
      v14[1] = a3;
      pw_name = (char *)&unk_22D0FABCD;
      if (a1)
        v12 = a1;
      else
        v12 = (char *)&unk_22D0FABCD;
      v15 = v12;
      v16 = &unk_22D0FABCD;
      v13 = geteuid();
      if (!getpwuid_r(v13, &v20, v23, 0x100uLL, &v19) && v19)
        pw_name = v19->pw_name;
      v17 = pw_name;
      if (_newrpclib_rpcbproc_unset_3((uint64_t)v14, &v21, v10))
        v21 = 0;
      (*(void (**)(uint64_t))(*(_QWORD *)(v10 + 8) + 32))(v10);
      return (_QWORD *)v21;
    }
  }
  return result;
}

void _newrpclib_authnone_create_cold_1(int a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  __int16 v5;
  const char *v6;
  __int16 v7;
  const char *v8;
  int v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v1 = 136316418;
  v2 = "/Library/Caches/com.apple.xbs/Sources/oncrpc/Oncrpc/auth_none.c";
  v3 = 1024;
  v4 = 125;
  v5 = 2080;
  v6 = "_newrpclib_authnone_create";
  v7 = 2080;
  v8 = "pthread_once";
  v9 = 67108960;
  v10 = a1;
  _os_log_error_impl(&dword_22D0E3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d in %s, %s returned with %m (%d)\n", (uint8_t *)&v1, 0x2Eu);
}

void _newrpclib_authunix_create_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void _newrpclib_authunix_create_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void _newrpclib_authunix_create_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_10();
}

void _newrpclib_authunix_create_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_10();
}

void marshal_new_auth_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_10();
}

void _newrpclib_authunix_create_default_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void _newrpclib_authunix_create_default_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void _newrpclib___rpc_createerr_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void _newrpclib___rpc_createerr_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void tsd_init_rpc_createerr_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void _buf_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void _buf_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void tsd_init_buf_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void _newrpclib_clntraw_create_cold_1()
{
  int v0;
  const char *v1;
  __int16 v2;
  int v3;
  __int16 v4;
  const char *v5;
  __int16 v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v0 = 136315906;
  v1 = "/Library/Caches/com.apple.xbs/Sources/oncrpc/Oncrpc/clnt_raw.c";
  v2 = 1024;
  v3 = 144;
  v4 = 2080;
  v5 = "_newrpclib_clntraw_create";
  v6 = 2080;
  v7 = "xdr_callhdr: Fatal header serialization error.";
  _os_log_error_impl(&dword_22D0E3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d in %s, %s\n", (uint8_t *)&v0, 0x26u);
}

void clntstrm_create_timeout_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_10();
}

void clntstrm_create_timeout_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_4_1(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, Unsupported protocol family %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_10();
}

void clntstrm_create_timeout_cold_3()
{
  __int16 v0;
  int v1;
  const char *v2;
  __int16 v3;
  __int16 v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = 136316162;
  v2 = "/Library/Caches/com.apple.xbs/Sources/oncrpc/Oncrpc/clnt_strm.c";
  OUTLINED_FUNCTION_8_0();
  v3 = v0;
  OUTLINED_FUNCTION_7_0();
  v4 = 96;
  _os_log_error_impl(&dword_22D0E3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d in %s, Could not create stream socket for %d protocol family: %m\n", (uint8_t *)&v1, 0x24u);
  OUTLINED_FUNCTION_10();
}

void clntstrm_create_timeout_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_4_1(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, Unsupported protocol family %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_10();
}

void clntstrm_create_timeout_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_10();
}

void clntstrm_create_timeout_cold_6()
{
  int v0;
  _WORD v1[10];
  const char *v2;
  __int16 v3;
  const char *v4;
  int v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  __error();
  *(_DWORD *)v1 = 136316418;
  OUTLINED_FUNCTION_3();
  *(_DWORD *)&v1[7] = 198;
  v1[9] = 2080;
  v2 = "get_socket_and_domain";
  v3 = 2080;
  v4 = "Stream socket could not get name";
  v5 = 67108960;
  v6 = v0;
  _os_log_error_impl(&dword_22D0E3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d in %s, %s returned with %m (%d)\n", (uint8_t *)v1, 0x2Eu);
}

void clntstrm_create_timeout_cold_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_1(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, Socket is of type %d, not SOCK_STREAM\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_10();
}

void clntticotsord_create_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_10();
}

void clntticots_create_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_10();
}

void _newrpclib_clnttcp_create_sa_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_10();
}

void _newrpclib_clnttcp_create_timeout_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_10();
}

void _newrpclib_clnttcp_create_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_10();
}

void clntticotsord_create_timeout_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_4_1(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, Remote address is not an AF_LOCAL domain address, Protocal is %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_10();
}

void _newrpclib_rpc_control_cold_1(int a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  __int16 v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v1 = 136315906;
  v2 = "/Library/Caches/com.apple.xbs/Sources/oncrpc/Oncrpc/rpc_control.c";
  v3 = 1024;
  v4 = 171;
  v5 = 2080;
  v6 = "_newrpclib_rpc_control";
  v7 = 1024;
  v8 = a1;
  _os_log_error_impl(&dword_22D0E3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d in %s, Unknown rpc_control command (%d)\n\n", (uint8_t *)&v1, 0x22u);
}

void _newrpclib__authenticate_cold_1()
{
  __int16 v0;
  int v1;
  int v2;
  int v3;
  const char *v4;
  __int16 v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = 136316162;
  v4 = "/Library/Caches/com.apple.xbs/Sources/oncrpc/Oncrpc/svc_auth.c";
  OUTLINED_FUNCTION_2();
  v5 = v0;
  v6 = "_newrpclib__authenticate";
  v7 = v0;
  v8 = v1;
  v9 = v0;
  v10 = v2;
  _os_log_error_impl(&dword_22D0E3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d in %s, Could not change credentials for uid = %d gid = %d\n", (uint8_t *)&v3, 0x28u);
}

void _newrpclib__authenticate_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  __error();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
}

void _newrpclib__authenticate_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  __error();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
}

void add_working_xprt_cold_1()
{
  int v0;
  const char *v1;
  __int16 v2;
  int v3;
  __int16 v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v0 = 136315650;
  v1 = "/Library/Caches/com.apple.xbs/Sources/oncrpc/Oncrpc/svc_run.c";
  v2 = 1024;
  v3 = 138;
  v4 = 2080;
  v5 = "add_working_xprt";
  _os_log_error_impl(&dword_22D0E3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d in %s aborted.\n", (uint8_t *)&v0, 0x1Cu);
}

void add_working_xprt_cold_2(uint64_t a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  __int16 v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v1 = 136315906;
  v2 = "/Library/Caches/com.apple.xbs/Sources/oncrpc/Oncrpc/svc_run.c";
  v3 = 1024;
  v4 = 137;
  v5 = 2080;
  v6 = "add_working_xprt";
  v7 = 2048;
  v8 = a1;
  _os_log_error_impl(&dword_22D0E3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d in %s, xprt %p is already on workq\n", (uint8_t *)&v1, 0x26u);
}

void _newrpclib_svc_pollnext_cold_1()
{
  int v0;
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  __int16 v5;
  const char *v6;
  __int16 v7;
  const char *v8;
  int v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v0 = *__error();
  v1 = 136316418;
  v2 = "/Library/Caches/com.apple.xbs/Sources/oncrpc/Oncrpc/svc_run.c";
  v3 = 1024;
  v4 = 227;
  v5 = 2080;
  v6 = "_newrpclib_svc_pollnext";
  v7 = 2080;
  v8 = "EXPECTED CONTROL PIPE, BUT DIDN'T GET IT";
  v9 = 67108960;
  v10 = v0;
  _os_log_error_impl(&dword_22D0E3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d in %s, %s returned with %m (%d)\n", (uint8_t *)&v1, 0x2Eu);
}

void _newrpclib_registerrpc_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_10();
}

void _newrpclib_registerrpc_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_10();
}

void _newrpclib_registerrpc_cold_3(int a1, int a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = 136316162;
  v3 = "/Library/Caches/com.apple.xbs/Sources/oncrpc/Oncrpc/svc_simple.c";
  v4 = 1024;
  v5 = 105;
  v6 = 2080;
  v7 = "_newrpclib_registerrpc";
  v8 = 2048;
  v9 = a1;
  v10 = 2048;
  v11 = a2;
  _os_log_error_impl(&dword_22D0E3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d in %s, couldn't register prog %ld vers %ld\n\n", (uint8_t *)&v2, 0x30u);
}

void _newrpclib_registerrpc_cold_4()
{
  int v0;
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  __int16 v5;
  const char *v6;
  __int16 v7;
  const char *v8;
  int v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v0 = *__error();
  v1 = 136316418;
  v2 = "/Library/Caches/com.apple.xbs/Sources/oncrpc/Oncrpc/svc_simple.c";
  v3 = 1024;
  v4 = 110;
  v5 = 2080;
  v6 = "_newrpclib_registerrpc";
  v7 = 2080;
  v8 = "mem_alloc failed";
  v9 = 67108960;
  v10 = v0;
  _os_log_error_impl(&dword_22D0E3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d in %s, %s returned with %m (%d)\n", (uint8_t *)&v1, 0x2Eu);
}

void universal_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_10();
}

void universal_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_1(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, never registered prog %d\n\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_10();
}

void universal_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_1(&dword_22D0E3000, MEMORY[0x24BDACB70], a3, "%s:%d in %s, trouble replying to prog %d\n\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_10();
}

void _newrpclib_svctcp_create_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void _newrpclib_svctcp_create_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_10();
}

void _newrpclib_svctcp_create_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void _newrpclib_svctcp_create_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void _newrpclib_svctcp_create_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_10();
}

void _newrpclib_svctcp_create_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_10();
}

void _newrpclib_svctcp_create_cold_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void svcstrm_domain_create_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void svcstrm_domain_create_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void svcstrm_domain_create_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void svcticotsord_create_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void svcticotsord_create_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void svcticotsord_create_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, Could not change local socket path %s to 0777\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_10();
}

void svcticotsord_create_cold_4()
{
  uint64_t v0;
  _WORD v1[10];
  const char *v2;
  __int16 v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  *(_DWORD *)v1 = 136316162;
  OUTLINED_FUNCTION_3();
  *(_DWORD *)&v1[7] = 430;
  v1[9] = 2080;
  v2 = "svcticotsord_create";
  v3 = 2080;
  v4 = v0;
  v5 = 96;
  _os_log_error_impl(&dword_22D0E3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d in %s, Could not bind stream socket addr %s: %m\n", (uint8_t *)v1, 0x28u);
  OUTLINED_FUNCTION_10();
}

void svcticotsord_create_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_10();
}

void svcticotsord_create_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void svcticotsord_create_cold_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void svcticotsord_create_cold_8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void svcticotsord_create_cold_9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void makefd_xprt_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void makefd_xprt_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void makefd_xprt_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void makefd_xprt_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_10();
}

void makefd_xprt_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void rendezvous_request_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void svcstrm_destroy_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void readstrm_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void readstrm_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_10();
}

void writestrm_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void svcstrm_recv_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_10();
}

void svcstrm_recv_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void svcstrm_recv_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_10();
}

void svcstrm_reply_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void _newrpclib_svcudp_bufcreate_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void _newrpclib_svcudp_bufcreate_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void _newrpclib_svcudp_bufcreate_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void _newrpclib_svcudp_bufcreate_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void _newrpclib_svcudp_bufcreate_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void _newrpclib_svcudp_bufcreate_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void svcudp_recv_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void svcudp_recv_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void svcudp_reply_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_10();
}

void svcudp_reply_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_10();
}

void svcudp_reply_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_10();
}

void svcudp_reply_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void svcudp_destroy_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void svc_xprt_create_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  __error();
  OUTLINED_FUNCTION_0(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
}

void svc_xprt_create_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  __error();
  OUTLINED_FUNCTION_0(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
}

void svc_oncrpc_start_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void svc_oncrpc_start_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void svc_oncrpc_start_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void svc_armxprt_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void svc_armxprt_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_12(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s aborted.\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_10();
}

void svc_armxprt_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_15(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_4_2(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, ** OOPS ** fd = %d, xprt = %p ** ALREADY ARMED **\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void svc_rmxprt_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void wakeup_kq_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void svc_rearmxprt_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_15(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_4_2(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, Trying to re-arm a dead export %p (%d)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void svc_rearmxprt_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void svc_rearmxprt_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_15(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_4_2(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, ** OOPS ** fd = %d, xprt = %p ** ALREADY ARMED **\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void svc_unarmxprt_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_12(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s aborted.\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_10();
}

void svc_unarmxprt_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_15(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_4_2(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, ** OOPS ** fd = %d, xprt = %p ** ALREADY DIS-ARMED **\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void _newrpclib_svc_enable_localaddr_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, Local address extraction not supported for netid \"%s\".\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_10();
}

void _newrpclib_svc_enable_localaddr_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void _newrpclib_svc_enable_localaddr_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, netid %s\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_10();
}

void _newrpclib_xdr_array_cold_1()
{
  int v0;
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  __int16 v5;
  const char *v6;
  __int16 v7;
  const char *v8;
  int v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v0 = *__error();
  v1 = 136316418;
  v2 = "/Library/Caches/com.apple.xbs/Sources/oncrpc/Oncrpc/xdr_array.c";
  v3 = 1024;
  v4 = 122;
  v5 = 2080;
  v6 = "_newrpclib_xdr_array";
  v7 = 2080;
  v8 = "mem_alloc failed";
  v9 = 67108960;
  v10 = v0;
  _os_log_error_impl(&dword_22D0E3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d in %s, %s returned with %m (%d)\n", (uint8_t *)&v1, 0x2Eu);
}

void _newrpclib_xdrrec_create_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void _newrpclib_xdrrec_create_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void _newrpclib_xdrrec_create_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void _newrpclib_xdr_reference_cold_1()
{
  int v0;
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  __int16 v5;
  const char *v6;
  __int16 v7;
  const char *v8;
  int v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v0 = *__error();
  v1 = 136316418;
  v2 = "/Library/Caches/com.apple.xbs/Sources/oncrpc/Oncrpc/xdr_reference.c";
  v3 = 1024;
  v4 = 104;
  v5 = 2080;
  v6 = "_newrpclib_xdr_reference";
  v7 = 2080;
  v8 = "mem_alloc failed";
  v9 = 67108960;
  v10 = v0;
  _os_log_error_impl(&dword_22D0E3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d in %s, %s returned with %m (%d)\n", (uint8_t *)&v1, 0x2Eu);
}

void _newrpclib_xdr_bytes_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void xdr_vmbytes_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void _newrpclib_xdr_string_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22D0E3000, MEMORY[0x24BDACB70], v0, "%s:%d in %s, %s returned with %m (%d)\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4();
}

void recvfrom_and_to_cold_1()
{
  int v0;
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  __int16 v5;
  const char *v6;
  __int16 v7;
  const char *v8;
  int v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v0 = *__error();
  v1 = 136316418;
  v2 = "/Library/Caches/com.apple.xbs/Sources/oncrpc/Oncrpc/rpc_inet.c";
  v3 = 1024;
  v4 = 557;
  v5 = 2080;
  v6 = "recvfrom_and_to";
  v7 = 2080;
  v8 = "Could not get socket name";
  v9 = 67108960;
  v10 = v0;
  _os_log_error_impl(&dword_22D0E3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d in %s, %s returned with %m (%d)\n", (uint8_t *)&v1, 0x2Eu);
}

void cache_init_cold_1()
{
  int v0;
  const char *v1;
  __int16 v2;
  int v3;
  __int16 v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v0 = 136315650;
  v1 = "/Library/Caches/com.apple.xbs/Sources/oncrpc/Oncrpc/rpc_inet.c";
  v2 = 1024;
  v3 = 385;
  v4 = 2080;
  v5 = "cache_init";
  _os_log_error_impl(&dword_22D0E3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d in %s aborted.\n", (uint8_t *)&v0, 0x1Cu);
}

void _newrpclib_rpcb_getaddr_timeout_cold_1(unsigned __int8 a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  __int16 v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v1 = 136315906;
  v2 = "/Library/Caches/com.apple.xbs/Sources/oncrpc/Oncrpc/rpcbind.c";
  v3 = 1024;
  v4 = 291;
  v5 = 2080;
  v6 = "_newrpclib_rpcb_getaddr_timeout";
  v7 = 1024;
  v8 = a1;
  _os_log_error_impl(&dword_22D0E3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d in %s, Unsupported address family %d\n", (uint8_t *)&v1, 0x22u);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x24BDAC848]();
}

uint64_t __memmove_chk()
{
  return MEMORY[0x24BDAC850]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x24BDAC910]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

int accept(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x24BDAD030](*(_QWORD *)&a1, a2, a3);
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x24BDAD200](a1, a2);
}

int bcmp(const void *a1, const void *a2, size_t a3)
{
  return MEMORY[0x24BDAD2C0](a1, a2, a3);
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x24BDAD2C8](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int bindresvport_sa(int a1, sockaddr *a2)
{
  return MEMORY[0x24BDAD2D0](*(_QWORD *)&a1, a2);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x24BDAD328](__count, __size);
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x24BDAD990](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x24BDADA10](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void exit(int a1)
{
  MEMORY[0x24BDAE268](*(_QWORD *)&a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x24BDAE2E8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int fflush(FILE *a1)
{
  return MEMORY[0x24BDAE350](a1);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x24BDAE440](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE448](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void freeaddrinfo(addrinfo *a1)
{
  MEMORY[0x24BDAE458](a1);
}

void freehostent(hostent *a1)
{
  MEMORY[0x24BDAE460](a1);
}

void freeifaddrs(ifaddrs *a1)
{
  MEMORY[0x24BDAE468](a1);
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x24BDAE4D8](a1, a2, *(_QWORD *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x24BDAE530](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

int getaddrinfo(const char *a1, const char *a2, const addrinfo *a3, addrinfo **a4)
{
  return MEMORY[0x24BDAE5A0](a1, a2, a3, a4);
}

gid_t getegid(void)
{
  return MEMORY[0x24BDAE5E8]();
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x24BDAE5F0](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x24BDAE5F8]();
}

int getgroups(int a1, gid_t a2[])
{
  return MEMORY[0x24BDAE638](*(_QWORD *)&a1, a2);
}

hostent *__cdecl gethostbyname(const char *a1)
{
  return (hostent *)MEMORY[0x24BDAE640](a1);
}

int gethostname(char *a1, size_t a2)
{
  return MEMORY[0x24BDAE650](a1, a2);
}

int getifaddrs(ifaddrs **a1)
{
  return MEMORY[0x24BDAE660](a1);
}

hostent *__cdecl getipnodebyname(const char *a1, int a2, int a3, int *a4)
{
  return (hostent *)MEMORY[0x24BDAE670](a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

int getpwuid_r(uid_t a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return MEMORY[0x24BDAE728](*(_QWORD *)&a1, a2, a3, a4, a5);
}

int getsockname(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x24BDAE770](*(_QWORD *)&a1, a2, a3);
}

int getsockopt(int a1, int a2, int a3, void *a4, socklen_t *a5)
{
  return MEMORY[0x24BDAE778](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4, a5);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x24BDAE780](a1, a2);
}

unsigned int if_nametoindex(const char *a1)
{
  return MEMORY[0x24BDAE860](a1);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x24BDAE8B0](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return MEMORY[0x24BDAE8B8](*(_QWORD *)&a1, a2, a3);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x24BDAE8C8](*(_QWORD *)&a1, a2);
}

int kevent64(int kq, const kevent64_s *changelist, int nchanges, kevent64_s *eventlist, int nevents, unsigned int flags, const timespec *timeout)
{
  return MEMORY[0x24BDAE970](*(_QWORD *)&kq, changelist, *(_QWORD *)&nchanges, eventlist, *(_QWORD *)&nevents, *(_QWORD *)&flags, timeout);
}

int kqueue(void)
{
  return MEMORY[0x24BDAE998]();
}

int listen(int a1, int a2)
{
  return MEMORY[0x24BDAEA78](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x24BDAEB20](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

int mkstemps(char *a1, int a2)
{
  return MEMORY[0x24BDAEF80](a1, *(_QWORD *)&a2);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int pipe(int a1[2])
{
  return MEMORY[0x24BDAF5D0](a1);
}

int poll(pollfd *a1, nfds_t a2, int a3)
{
  return MEMORY[0x24BDAF5D8](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x24BDAF790](a1);
}

int pthread_attr_set_qos_class_np(pthread_attr_t *__attr, qos_class_t __qos_class, int __relative_priority)
{
  return MEMORY[0x24BDAF798](__attr, *(_QWORD *)&__qos_class, *(_QWORD *)&__relative_priority);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x24BDAF7A0](a1, *(_QWORD *)&a2);
}

int pthread_attr_setstacksize(pthread_attr_t *a1, size_t a2)
{
  return MEMORY[0x24BDAF7C0](a1, a2);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x24BDAF7C8](a1);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x24BDAF7E0](a1);
}

int pthread_cond_timedwait_relative_np(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return MEMORY[0x24BDAF7F8](a1, a2, a3);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x24BDAF800](a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x24BDAF818](a1, a2, a3, a4);
}

void pthread_exit(void *a1)
{
  MEMORY[0x24BDAF830](a1);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x24BDAF860](a1);
}

int pthread_getugid_np(uid_t *a1, gid_t *a2)
{
  return MEMORY[0x24BDAF868](a1, a2);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x24BDAF888](a1, a2);
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

int pthread_mutexattr_destroy(pthread_mutexattr_t *a1)
{
  return MEMORY[0x24BDAF8E8](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x24BDAF8F0](a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x24BDAF908](a1, *(_QWORD *)&a2);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x24BDAF910](a1, a2);
}

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  return MEMORY[0x24BDAF938](a1, a2);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x24BDAF940](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x24BDAF958](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x24BDAF960](a1);
}

int pthread_set_qos_class_self_np(qos_class_t __qos_class, int __relative_priority)
{
  return MEMORY[0x24BDAF980](*(_QWORD *)&__qos_class, *(_QWORD *)&__relative_priority);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x24BDAF9A8](a1, a2);
}

int pthread_setugid_np(uid_t a1, gid_t a2)
{
  return MEMORY[0x24BDAF9B0](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x24BDAFA80](*(_QWORD *)&a1, a2, a3);
}

void *__cdecl realloc(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x24BDAFAB0](__ptr, __size);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x24BDAFAB8](__ptr, __size);
}

ssize_t recvfrom(int a1, void *a2, size_t a3, int a4, sockaddr *a5, socklen_t *a6)
{
  return MEMORY[0x24BDAFAE8](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4, a5, a6);
}

ssize_t recvmsg(int a1, msghdr *a2, int a3)
{
  return MEMORY[0x24BDAFAF0](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

ssize_t sendto(int a1, const void *a2, size_t a3, int a4, const sockaddr *a5, socklen_t a6)
{
  return MEMORY[0x24BDAFCF8](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4, a5, *(_QWORD *)&a6);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x24BDAFD78](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4, *(_QWORD *)&a5);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x24BDAFE38](*(_QWORD *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x24BDAFE50](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x24BDAFF00](__dst, __src);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x24BDAFF10](__s1);
}

int strerror_r(int __errnum, char *__strerrbuf, size_t __buflen)
{
  return MEMORY[0x24BDAFF20](*(_QWORD *)&__errnum, __strerrbuf, __buflen);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x24BDAFF30](__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x24BDAFF38](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x24BDAFF80](__s1, __n);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0000](__str, __endptr, *(_QWORD *)&__base);
}

int unlink(const char *a1)
{
  return MEMORY[0x24BDB02B0](a1);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x24BDB0380](*(_QWORD *)&target_task, address, size, *(_QWORD *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x24BDB0390](*(_QWORD *)&target_task, address, size);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x24BDB0448](__str, __size, __format, a4);
}

void warnx(const char *a1, ...)
{
  MEMORY[0x24BDB0490](a1);
}

