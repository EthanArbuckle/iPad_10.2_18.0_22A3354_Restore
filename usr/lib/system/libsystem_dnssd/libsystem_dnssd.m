DNSServiceErrorType DNSServiceBrowse(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, const char *regtype, const char *domain, DNSServiceBrowseReply callBack, void *context)
{
  return DNSServiceBrowseInternal((uint64_t *)sdRef, flags, interfaceIndex, regtype, domain, 0, (uint64_t)callBack, (uint64_t)context);
}

uint64_t DNSServiceQueryRecordEx(uint64_t *a1, int a2, int a3, const char *a4, int a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return DNSServiceQueryRecordInternal(a1, a2, a3, a4, a5, a6, a7, a8, a9);
}

DNSServiceErrorType DNSServiceRegister(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, const char *name, const char *regtype, const char *domain, const char *host, uint16_t port, uint16_t txtLen, const void *txtRecord, DNSServiceRegisterReply callBack, void *context)
{
  return DNSServiceRegisterInternal((uint64_t *)sdRef, flags, interfaceIndex, name, regtype, domain, host, port, txtLen, (const char *)txtRecord, 0, (uint64_t)callBack, (uint64_t)context);
}

uint64_t DNSServiceRegisterInternal(uint64_t *a1, int a2, int a3, const char *a4, const char *a5, const char *a6, const char *a7, __int16 a8, unsigned __int16 a9, const char *a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v13;
  const char *v16;
  const char *v20;
  const char *v21;
  const char *v22;
  void (*v23)(uint64_t, uint64_t, uint64_t, unint64_t);
  uint64_t v24;
  size_t v26;
  size_t v27;
  size_t v28;
  size_t v29;
  int8x16_t *v30;
  int8x16_t *v31;
  char *v32;
  size_t v33;
  size_t v34;
  char *v35;
  size_t v36;
  char *v37;
  size_t v38;
  char *v39;
  size_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  char *v44;
  const char *__src;
  char *__s;
  size_t v47;
  char *v48;

  v13 = 4294901756;
  if (a1 && a5)
  {
    v16 = a6;
    if (a4)
      v20 = a4;
    else
      v20 = "";
    if (!a6)
      v16 = "";
    __s = (char *)v16;
    if (a7)
      v21 = a7;
    else
      v21 = "";
    if (a10)
      v22 = a10;
    else
      v22 = "";
    if (a12)
    {
      v23 = handle_regservice_response;
      v24 = a12;
    }
    else
    {
      if ((a2 & 8) != 0)
        return v13;
      v23 = 0;
      v24 = 0;
    }
    v13 = ConnectToServer(a1, a2, 5, (uint64_t)v23, v24, a13);
    if (!(_DWORD)v13)
    {
      __src = v22;
      v43 = (char *)v20;
      v26 = strlen(v20);
      v27 = strlen(a5);
      v28 = strlen(__s);
      v44 = (char *)v21;
      v29 = v26 + a9 + v27 + v28 + strlen(v21) + 16;
      v47 = v29;
      if (a11)
      {
        v13 = 4294901756;
        if (*(_BYTE *)(a11 + 13))
        {
          if (!*(_BYTE *)(a11 + 12))
            return v13;
        }
        else if (*(_BYTE *)(a11 + 12))
        {
          return v13;
        }
        v47 = put_attribute_tlvs(a11, 0, 0, 0) + v29;
      }
      v48 = 0;
      v30 = (int8x16_t *)create_hdr(5, &v47, &v48, *(_QWORD *)(*a1 + 8) != 0, *a1);
      v31 = v30;
      if (!a12)
        v30->i32[2] |= 1u;
      v33 = v47;
      v32 = v48;
      *v48 = HIBYTE(a2);
      v32[1] = BYTE2(a2);
      v32[2] = BYTE1(a2);
      v32[3] = a2;
      v32[4] = HIBYTE(a3);
      v32[5] = BYTE2(a3);
      v32[6] = BYTE1(a3);
      v32[7] = a3;
      v34 = strlen(v43) + 1;
      memcpy(v32 + 8, v43, v34);
      v35 = &v32[v34 + 8];
      v36 = strlen(a5) + 1;
      memcpy(v35, a5, v36);
      v37 = &v35[v36];
      v38 = strlen(__s) + 1;
      memcpy(v37, __s, v38);
      v39 = &v37[v38];
      v40 = strlen(v44) + 1;
      memcpy(v39, v44, v40);
      v41 = &v39[v40];
      *(_WORD *)v41 = a8;
      v41[2] = HIBYTE(a9);
      v41[3] = a9;
      memcpy(&v39[v40 + 4], __src, a9);
      v48 = &v39[v40 + 4 + a9];
      if (a11)
        put_attribute_tlvs(a11, (uint64_t)v31, (unint64_t *)&v48, (unint64_t)&v32[v33]);
      v42 = deliver_request(v31, *a1);
      v13 = v42;
      if ((_DWORD)v42)
      {
        if ((_DWORD)v42 != -65555)
          goto LABEL_35;
        if (_should_return_noauth_error_s_once != -1)
          dispatch_once(&_should_return_noauth_error_s_once, &__block_literal_global);
        if (!_should_return_noauth_error_s_should)
        {
          return 0;
        }
        else
        {
LABEL_35:
          DNSServiceRefDeallocate((DNSServiceRef)*a1);
          *a1 = 0;
        }
      }
    }
  }
  return v13;
}

void DNSServiceRefDeallocate(DNSServiceRef sdRef)
{
  DNSServiceRef v1;
  int v2;
  _DWORD *v3;
  DNSServiceRef v4;
  _QWORD *v5;
  BOOL v6;
  int8x16_t *v7;
  NSObject *v8;
  _DNSServiceRef_t *v9;
  _DWORD *v10;
  size_t v11;
  uint64_t v12;

  if (sdRef)
  {
    v1 = sdRef;
    v2 = *((_DWORD *)sdRef + 4);
    if (v2 < 0 || (*((_DWORD *)sdRef + 5) ^ v2) != 0x12345678)
    {
      syslog(4, "dnssd_clientstub DNSServiceRefDeallocate called with invalid DNSServiceRef %p %08X %08X");
    }
    else
    {
      v3 = (_DWORD *)*((_QWORD *)sdRef + 6);
      if (v3)
        *v3 = 0;
      v4 = (DNSServiceRef)*((_QWORD *)sdRef + 1);
      if (v4)
      {
        do
        {
          v5 = v4;
          v4 = *(DNSServiceRef *)v4;
          if (v4)
            v6 = v4 == sdRef;
          else
            v6 = 1;
        }
        while (!v6);
        if (v4)
        {
          v11 = 0;
          v12 = 0;
          v7 = (int8x16_t *)create_hdr(63, &v11, &v12, 0, (uint64_t)sdRef);
          *v7 = vrev32q_s8(*v7);
          v7[1].i32[2] = bswap32(v7[1].u32[2]);
          write_all(*((_DWORD *)v1 + 4), (uint64_t)v7, v11);
          free(v7);
          *v5 = *(_QWORD *)v1;
          FreeDNSServiceOp(v1);
        }
      }
      else
      {
        if (*((_QWORD *)sdRef + 11))
        {
          *((_QWORD *)sdRef + 7) = 0;
          shutdown(*((_DWORD *)sdRef + 4), 1);
          dispatch_source_cancel(*((dispatch_source_t *)v1 + 11));
          v8 = *((_QWORD *)v1 + 11);
          if (v8)
          {
            dispatch_release(v8);
            *((_QWORD *)v1 + 11) = 0;
          }
        }
        else if (!*((_QWORD *)sdRef + 12))
        {
          close_NOCANCEL();
        }
        do
        {
          v9 = *(_DNSServiceRef_t **)v1;
          v10 = (_DWORD *)*((_QWORD *)v1 + 6);
          if (v10)
            *v10 = 0;
          FreeDNSServiceOp(v1);
          v1 = v9;
        }
        while (v9);
      }
    }
  }
  else
  {
    syslog(4, "dnssd_clientstub DNSServiceRefDeallocate called with NULL DNSServiceRef");
  }
}

void FreeDNSServiceOp(_DWORD *a1)
{
  int v2;
  NSObject *v3;
  void *v4;
  _QWORD *v5;
  _QWORD *v6;
  void *v7;
  void *v8;

  v2 = a1[5];
  if ((v2 ^ a1[4]) == 0x12345678)
  {
    *(_QWORD *)a1 = 0;
    *((_QWORD *)a1 + 1) = 0;
    *((_QWORD *)a1 + 2) = 0xDDDDDDDDFFFFFFFFLL;
    *((_QWORD *)a1 + 4) = 0;
    a1[10] = 0;
    *((_OWORD *)a1 + 3) = 0u;
    *((_OWORD *)a1 + 4) = 0u;
    v3 = *((_QWORD *)a1 + 11);
    if (v3)
    {
      dispatch_release(v3);
      *((_QWORD *)a1 + 11) = 0;
    }
    *((_QWORD *)a1 + 12) = 0;
    v4 = (void *)*((_QWORD *)a1 + 15);
    if (v4)
    {
      free(v4);
      *((_QWORD *)a1 + 15) = 0;
    }
    *((_QWORD *)a1 + 16) = 0;
    v5 = (_QWORD *)*((_QWORD *)a1 + 10);
    if (v5)
    {
      do
      {
        v6 = (_QWORD *)*v5;
        v7 = (void *)v5[7];
        if (v7)
          free(v7);
        free(v5);
        v5 = v6;
      }
      while (v6);
    }
    v8 = (void *)*((_QWORD *)a1 + 17);
    if (v8)
      free(v8);
    free(a1);
  }
  else
  {
    syslog(4, "dnssd_clientstub attempt to dispose invalid DNSServiceRef %p %08X %08X", a1, a1[4], v2);
    FreeDNSServiceOp_op_were_not_going_to_free_but_we_need_to_fool_the_analyzer = (uint64_t)a1;
  }
}

DNSServiceErrorType DNSServiceSetDispatchQueue(DNSServiceRef service, dispatch_queue_t queue)
{
  DNSServiceErrorType v4;
  unsigned int v5;
  unsigned int v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD v11[4];
  unsigned int v12;
  _QWORD handler[5];

  v4 = -65540;
  v5 = DNSServiceRefSockFD(service);
  if (v5 != -1)
  {
    if (queue)
    {
      if (*((_QWORD *)service + 12))
      {
        syslog(4, "dnssd_clientstub DNSServiceSetDispatchQueue dispatch queue set already");
      }
      else if (*((_QWORD *)service + 11))
      {
        syslog(4, "dnssd_clientstub DNSServiceSetDispatchQueue dispatch source set already");
      }
      else
      {
        v7 = v5;
        v8 = dispatch_source_create(MEMORY[0x1E0C86F18], v5, 0, queue);
        *((_QWORD *)service + 11) = v8;
        if (v8)
        {
          v9 = MEMORY[0x1E0C87450];
          *((_QWORD *)service + 12) = queue;
          handler[0] = v9;
          handler[1] = 0x40000000;
          handler[2] = __DNSServiceSetDispatchQueue_block_invoke;
          handler[3] = &__block_descriptor_tmp;
          handler[4] = service;
          dispatch_source_set_event_handler(v8, handler);
          v10 = *((_QWORD *)service + 11);
          v11[0] = v9;
          v11[1] = 0x40000000;
          v11[2] = __DNSServiceSetDispatchQueue_block_invoke_2;
          v11[3] = &__block_descriptor_tmp_36;
          v12 = v7;
          dispatch_source_set_cancel_handler(v10, v11);
          dispatch_resume(*((dispatch_object_t *)service + 11));
          return 0;
        }
        else
        {
          syslog(4, "dnssd_clientstub DNSServiceSetDispatchQueue dispatch_source_create failed");
          return -65539;
        }
      }
    }
    else
    {
      syslog(4, "dnssd_clientstub: DNSServiceSetDispatchQueue dispatch queue NULL");
    }
  }
  return v4;
}

dnssd_sock_t DNSServiceRefSockFD(DNSServiceRef sdRef)
{
  dnssd_sock_t result;

  if (sdRef)
  {
    result = *((_DWORD *)sdRef + 4);
    if (result < 0 || (*((_DWORD *)sdRef + 5) ^ result) != 0x12345678)
    {
      syslog(4, "dnssd_clientstub DNSServiceRefSockFD called with invalid DNSServiceRef %p %08X %08X");
    }
    else
    {
      if (!*((_QWORD *)sdRef + 1))
        return result;
      syslog(4, "dnssd_clientstub DNSServiceRefSockFD undefined for kDNSServiceFlagsShareConnection subordinate DNSServiceRef %p");
    }
  }
  else
  {
    syslog(4, "dnssd_clientstub DNSServiceRefSockFD called with NULL DNSServiceRef");
  }
  return -1;
}

uint64_t DNSServiceQueryRecordInternal(uint64_t *a1, int a2, int a3, const char *a4, int a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  __int16 v12;
  __int16 v13;
  int should_save_stacktrace;
  BOOL v19;
  BOOL v20;
  _BOOL4 v21;
  const char *v22;
  size_t v23;
  size_t v24;
  uint64_t v25;
  xpc_object_t RetainedResolverDefaults;
  void *v27;
  const void *data;
  uint64_t v29;
  int8x16_t *v30;
  _BYTE *v31;
  size_t v32;
  char *v33;
  size_t v34;
  char *v35;
  size_t v36;
  uint64_t v37;
  BOOL v38;
  void *v39;
  int v41;
  size_t v42;
  size_t length;

  v9 = 4294901756;
  if (a1 && a8)
  {
    v12 = a6;
    v13 = a5;
    should_save_stacktrace = 0;
    if (MEMORY[0x1E0C889B8])
    {
      v19 = a5 == 1 || a5 == 28;
      v20 = v19 || a5 == 255;
      v21 = v20;
      if (a6 == 1 && v21)
      {
        v9 = 4294901726;
        if (ne_tracker_check_is_hostname_blocked() == 1)
          return v9;
        should_save_stacktrace = ne_tracker_should_save_stacktrace();
      }
    }
    v9 = ConnectToServer(a1, a2, 8, (uint64_t)handle_query_response, a8, a9);
    if (!(_DWORD)v9)
    {
      if (a4)
        v22 = a4;
      else
        v22 = (const char *)&unk_1DED85358;
      v23 = strlen(v22) + 13;
      v42 = v23;
      if (a7)
      {
        v24 = put_attribute_tlvs(a7, 0, 0, 0) + v23;
        v25 = 8;
        if (*(_QWORD *)(a7 + 24))
          v25 = (unsigned __int16)*(_QWORD *)(a7 + 24) + 12;
        v23 = v25 + v24;
        v42 = v25 + v24;
      }
      RetainedResolverDefaults = DNSServiceGetRetainedResolverDefaults();
      v27 = RetainedResolverDefaults;
      if (RetainedResolverDefaults)
      {
        length = 0;
        data = xpc_dictionary_get_data(RetainedResolverDefaults, "resolver_config_plist_data", &length);
        v29 = (unsigned __int16)length + 9;
        if (!data)
          v29 = 5;
        v23 += v29;
        v42 = v23;
      }
      v41 = should_save_stacktrace;
      if (should_save_stacktrace)
        v42 = v23 + 5;
      length = 0;
      v30 = (int8x16_t *)create_hdr(8, &v42, &length, *(_QWORD *)(*a1 + 8) != 0, *a1);
      v31 = (_BYTE *)length;
      v32 = length + v42;
      *(_BYTE *)length = HIBYTE(a2);
      v31[1] = BYTE2(a2);
      v31[2] = BYTE1(a2);
      v31[3] = a2;
      v31[4] = HIBYTE(a3);
      v31[5] = BYTE2(a3);
      v31[6] = BYTE1(a3);
      v33 = v31 + 8;
      v31[7] = a3;
      v34 = strlen(v22) + 1;
      memcpy(v33, v22, v34);
      v35 = &v33[v34];
      *v35 = HIBYTE(v13);
      v35[1] = v13;
      v35[2] = HIBYTE(v12);
      v35[3] = v12;
      length = (size_t)&v33[v34 + 4];
      if (a7)
      {
        put_attribute_tlvs(a7, (uint64_t)v30, &length, v32);
        put_tlvs_for_validation_attr(a7, (uint64_t)v30, &length, v32);
      }
      if (v27)
      {
        put_tlvs_for_defaults(v27, (uint64_t)v30, (_BYTE **)&length, v32);
        xpc_release(v27);
      }
      if (v41)
      {
        v36 = length;
        if (length && v32 >= length && v32 - length >= 5)
        {
          *(_DWORD *)length = 16779264;
          *(_BYTE *)(v36 + 4) = 1;
          v36 += 5;
        }
        length = v36;
        v30->i32[2] |= 2u;
      }
      v37 = deliver_request(v30, *a1);
      v9 = v37;
      if ((_DWORD)v37)
        v38 = 1;
      else
        v38 = MEMORY[0x1E0C889B8] == 0;
      if (v38 || ((v41 ^ 1) & 1) != 0)
      {
        if ((_DWORD)v37)
        {
          if ((_DWORD)v37 != -65555)
            goto LABEL_54;
          if (_should_return_noauth_error_s_once != -1)
            dispatch_once(&_should_return_noauth_error_s_once, &__block_literal_global);
          if (!_should_return_noauth_error_s_should)
          {
            return 0;
          }
          else
          {
LABEL_54:
            DNSServiceRefDeallocate((DNSServiceRef)*a1);
            *a1 = 0;
          }
        }
      }
      else
      {
        v39 = *(void **)(*a1 + 120);
        if (v39)
        {
          free(v39);
          *(_QWORD *)(*a1 + 120) = 0;
        }
        v9 = 0;
        *(_QWORD *)(*a1 + 120) = ne_tracker_copy_current_stacktrace();
      }
    }
  }
  return v9;
}

DNSServiceErrorType DNSServiceCreateConnection(DNSServiceRef *sdRef)
{
  DNSServiceErrorType v2;
  int8x16_t *v3;
  size_t v5;
  uint64_t v6;

  v5 = 0;
  if (!sdRef)
    return -65540;
  v2 = ConnectToServer((uint64_t *)sdRef, 0, 1, (uint64_t)ConnectionResponse, 0, 0);
  if (!v2)
  {
    v6 = 0;
    v3 = (int8x16_t *)create_hdr(1, &v5, &v6, 0, (uint64_t)*sdRef);
    v2 = deliver_request(v3, (uint64_t)*sdRef);
    if (v2)
    {
      DNSServiceRefDeallocate(*sdRef);
      *sdRef = 0;
    }
  }
  return v2;
}

uint64_t DNSServiceBrowseInternal(uint64_t *a1, int a2, int a3, const char *a4, const char *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  const char *v15;
  size_t v16;
  size_t v17;
  uint64_t v18;
  int8x16_t *v19;
  char *v20;
  size_t v21;
  size_t v22;
  char *v23;
  size_t v24;
  uint64_t v25;
  uint64_t v27;
  char *v28;

  v8 = 4294901756;
  if (a1)
  {
    if (a4)
    {
      if (a7)
      {
        v8 = ConnectToServer(a1, a2, 6, (uint64_t)handle_browse_response, a7, a8);
        if (!(_DWORD)v8)
        {
          if (a5)
            v15 = a5;
          else
            v15 = "";
          v16 = strlen(a4);
          v17 = strlen(v15);
          v27 = v16 + v17 + 10;
          if (a6)
          {
            v18 = 8;
            if (*(_QWORD *)(a6 + 24))
              v18 = (unsigned __int16)*(_QWORD *)(a6 + 24) + 12;
            v27 = v18 + v16 + v17 + 10;
          }
          v28 = 0;
          v19 = (int8x16_t *)create_hdr(6, (size_t *)&v27, &v28, *(_QWORD *)(*a1 + 8) != 0, *a1);
          v21 = v27;
          v20 = v28;
          *v28 = HIBYTE(a2);
          v20[1] = BYTE2(a2);
          v20[2] = BYTE1(a2);
          v20[3] = a2;
          v20[4] = HIBYTE(a3);
          v20[5] = BYTE2(a3);
          v20[6] = BYTE1(a3);
          v20[7] = a3;
          v22 = strlen(a4) + 1;
          memcpy(v20 + 8, a4, v22);
          v23 = &v20[v22 + 8];
          v24 = strlen(v15) + 1;
          memcpy(v23, v15, v24);
          v28 = &v23[v24];
          if (a6)
            put_tlvs_for_validation_attr(a6, (uint64_t)v19, (unint64_t *)&v28, (unint64_t)&v20[v21]);
          v25 = deliver_request(v19, *a1);
          v8 = v25;
          if ((_DWORD)v25)
          {
            if ((_DWORD)v25 != -65555)
              goto LABEL_19;
            if (_should_return_noauth_error_s_once != -1)
              dispatch_once(&_should_return_noauth_error_s_once, &__block_literal_global);
            if (!_should_return_noauth_error_s_should)
            {
              return 0;
            }
            else
            {
LABEL_19:
              DNSServiceRefDeallocate((DNSServiceRef)*a1);
              *a1 = 0;
            }
          }
        }
      }
    }
  }
  return v8;
}

_DWORD *create_hdr(int a1, size_t *a2, _QWORD *a3, int a4, uint64_t a5)
{
  uint64_t v6;
  _DWORD *v11;
  _DWORD *v12;
  size_t v13;
  _OWORD v15[4];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C874D8];
  memset(v15, 0, sizeof(v15));
  if (a4)
    v6 = *a2 + 1;
  else
    v6 = *a2;
  *a2 = v6 + 28;
  if (v6 == -28 || (v11 = malloc_type_malloc(v6 + 28, 0xA172743EuLL)) == 0)
    __break(1u);
  v12 = v11;
  bzero(v11, *a2);
  *v12 = 1;
  v12[1] = v6;
  v12[2] = 0;
  v12[3] = a1;
  *((_QWORD *)v12 + 2) = *(_QWORD *)(a5 + 24);
  v12[6] = 0;
  *a3 = v12 + 7;
  if (a4)
  {
    v13 = strlen((const char *)v15) + 1;
    memcpy(v12 + 7, v15, v13);
    *a3 += v13;
  }
  return v12;
}

uint64_t deliver_request(int8x16_t *a1, uint64_t a2)
{
  _BOOL4 v4;
  int v5;
  __int32 v6;
  int v7;
  int v8;
  int v9;
  int *v10;
  char *v11;
  uint64_t v13;
  int v14;
  int v15;
  BOOL v16;
  int all;
  unsigned int v18;
  int v19;
  int *v20;
  char *v21;
  int v22;
  int *v23;
  char *v24;
  _QWORD v25[2];
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  int v29[4];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C874D8];
  v26 = -65537;
  if (*(_QWORD *)(a2 + 8))
    v4 = 1;
  else
    v4 = ((a1->i32[3] - 2) & 0xFFFFFFF6) == 0;
  v5 = *(_DWORD *)(a2 + 16);
  if (v5 < 0 || (*(_DWORD *)(a2 + 20) ^ v5) != 0x12345678)
  {
    free(a1);
    syslog(4, "dnssd_clientstub deliver_request: invalid DNSServiceRef %p %08X %08X", (const void *)a2, *(_DWORD *)(a2 + 16), *(_DWORD *)(a2 + 20));
    return 4294901755;
  }
  v6 = a1->i32[1];
  if (v4)
  {
    if (socketpair(1, 1, 0, v29) < 0)
    {
      v19 = *__error();
      v20 = __error();
      v21 = strerror(*v20);
      syslog(4, "dnssd_clientstub deliver_request: %s failed %d (%s)", "socketpair", v19, v21);
      goto LABEL_34;
    }
    v7 = v29[0];
    v8 = v29[1];
    LODWORD(v27) = 1;
    if (setsockopt(v29[0], 0xFFFF, 4352, &v27, 4u) < 0)
    {
      v9 = *__error();
      v10 = __error();
      v11 = strerror(*v10);
      syslog(4, "dnssd_clientstub deliver_request: SO_DEFUNCTOK failed %d %s", v9, v11);
    }
  }
  else
  {
    v8 = -1;
    v7 = -1;
  }
  v13 = (v6 - v4);
  *a1 = vrev32q_s8(*a1);
  a1[1].i32[2] = bswap32(a1[1].u32[2]);
  v14 = write_all(*(_DWORD *)(a2 + 16), (uint64_t)a1, v13 + 28);
  if (v14 < 0)
  {
    v15 = v14;
    syslog(6, "dnssd_clientstub deliver_request ERROR: write_all(%d, %lu bytes) failed", *(_DWORD *)(a2 + 16), v13 + 28);
    v16 = v15 == -2;
  }
  else
  {
    if (v4)
    {
      v25[0] = (char *)a1 + v13 + 28;
      v25[1] = 1;
      *(_OWORD *)v29 = 0u;
      v29[2] = 0;
      *(_QWORD *)&v30 = v25;
      *((_QWORD *)&v30 + 1) = 1;
      *(_QWORD *)&v31 = &v27;
      *((_QWORD *)&v31 + 1) = 16;
      v27 = 0xFFFF00000010;
      LODWORD(v28) = 1;
      HIDWORD(v28) = v8;
      if (sendmsg_NOCANCEL() < 0)
      {
        v22 = *__error();
        v23 = __error();
        v24 = strerror(*v23);
        syslog(4, "dnssd_clientstub deliver_request ERROR: sendmsg failed read sd=%d write sd=%d errno %d (%s)", v7, v8, v22, v24);
        v26 = -65551;
        if (v8 < 0)
        {
LABEL_32:
          if ((v7 & 0x80000000) == 0)
            close_NOCANCEL();
          goto LABEL_34;
        }
LABEL_31:
        close_NOCANCEL();
        goto LABEL_32;
      }
      close_NOCANCEL();
      v8 = -1;
    }
    else
    {
      v7 = *(_DWORD *)(a2 + 16);
    }
    if (v7 <= 1023)
    {
      v28 = 0;
      v35 = 0u;
      v36 = 0u;
      v34 = 0u;
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      *(_OWORD *)v29 = 0u;
      if (__darwin_check_fd_set_overflow(v7, v29, 0))
        *(int *)((char *)v29 + (((unint64_t)v7 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v7;
      v27 = 60;
      if (!select_NOCANCEL())
      {
        syslog(4, "dnssd_clientstub set_waitlimit:_daemon timed out (%d secs) without any response: Socket %d", 60, v7);
        v18 = -65568;
        goto LABEL_29;
      }
    }
    v26 = 0;
    all = read_all(v7, (uint64_t)&v26, 4uLL);
    if ((all & 0x80000000) == 0)
    {
      v18 = bswap32(v26);
      goto LABEL_29;
    }
    v16 = all == -3;
  }
  if (v16)
    v18 = -65569;
  else
    v18 = -65563;
LABEL_29:
  v26 = v18;
  if (v4)
  {
    if (v8 < 0)
      goto LABEL_32;
    goto LABEL_31;
  }
LABEL_34:
  free(a1);
  return v26;
}

uint64_t write_all(int a1, uint64_t a2, unint64_t a3)
{
  unint64_t v3;
  unint64_t v6;
  unint64_t v7;
  BOOL v8;
  int v10;
  int *v11;
  char *v12;
  int *v13;
  socklen_t v14;
  int v15;

  if (!a3)
    return 0;
  v3 = a3;
  while (1)
  {
    v6 = send_NOCANCEL();
    v7 = v6;
    if ((v6 & 0x8000000000000000) != 0)
      break;
    v8 = v3 == v6;
    if (v3 < v6)
      break;
    a2 += v6;
    v3 -= v6;
    if (v8)
      return 0;
  }
  v15 = 0;
  v14 = 4;
  if (getsockopt(a1, 0xFFFF, 4353, &v15, &v14) < 0)
  {
    v10 = *__error();
    v11 = __error();
    v12 = strerror(*v11);
    syslog(4, "dnssd_clientstub write_all: SO_ISDEFUNCT failed %d %s", v10, v12);
  }
  if (v15)
  {
    syslog(6, "dnssd_clientstub write_all(%d) DEFUNCT");
  }
  else
  {
    if ((v7 & 0x8000000000000000) != 0)
    {
      __error();
      v13 = __error();
      strerror(*v13);
    }
    syslog(4, "dnssd_clientstub write_all(%d) failed %ld/%ld %d %s");
  }
  if (v15)
    return 4294967294;
  else
    return 0xFFFFFFFFLL;
}

uint64_t ConnectToServer(uint64_t *a1, __int16 a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _DWORD *v12;
  _DWORD *v13;
  char *v14;
  const char *v15;
  int v16;
  const char *v17;
  uint64_t v18;
  _QWORD *v19;
  int v20;
  int v21;
  BOOL v22;
  _QWORD *v23;
  _QWORD *v24;
  int v25;
  uint64_t v26;
  int v28;
  int *v29;
  char *v30;
  uint64_t v31;
  int *v32;
  char *v33;
  int v34;
  int *v35;
  char *v36;
  int v37;
  int *v38;
  char *v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int *v44;
  char *v45;
  int v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _WORD v53[13];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C874D8];
  v52 = 0u;
  memset(v53, 0, sizeof(v53));
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  if (a1)
  {
    if ((a2 & 0x4000) != 0)
    {
      v19 = (_QWORD *)*a1;
      if (!*a1)
      {
        v18 = 4294901756;
        syslog(4, "dnssd_clientstub kDNSServiceFlagsShareConnection used with NULL DNSServiceRef");
        return v18;
      }
      if ((v20 = *((_DWORD *)v19 + 4), v21 = *((_DWORD *)v19 + 8), v20 < 0)
        || (*((_DWORD *)v19 + 5) ^ v20) != 0x12345678
        || (v21 != 19 ? (v22 = v21 == 1) : (v22 = 1), !v22 || v19[1]))
      {
        syslog(4, "dnssd_clientstub kDNSServiceFlagsShareConnection used with invalid DNSServiceRef %p %08X %08X op %d", v19, v20, *((_DWORD *)v19 + 5), v21);
        *a1 = 0;
        return 4294901755;
      }
    }
    v12 = malloc_type_malloc(0x90uLL, 0xA172743EuLL);
    if (!v12)
      __break(1u);
    v13 = v12;
    *(_QWORD *)v12 = 0;
    *((_QWORD *)v12 + 1) = 0;
    v12[9] = 0;
    v12[10] = 0;
    v12[8] = a3;
    *((_OWORD *)v12 + 1) = xmmword_1DED853A0;
    *((_QWORD *)v12 + 6) = 0;
    *((_QWORD *)v12 + 7) = a4;
    *((_QWORD *)v12 + 8) = a5;
    *((_QWORD *)v12 + 9) = a6;
    *((_OWORD *)v12 + 5) = 0u;
    *((_OWORD *)v12 + 6) = 0u;
    *((_OWORD *)v12 + 7) = 0u;
    *((_OWORD *)v12 + 8) = 0u;
    if ((a2 & 0x4000) != 0)
    {
      v23 = (_QWORD *)*a1;
      do
      {
        v24 = v23;
        v23 = (_QWORD *)*v23;
      }
      while (v23);
      *v24 = v12;
      v25 = *(_DWORD *)(*a1 + 24);
      *(_DWORD *)(*a1 + 24) = v25 + 1;
      if (v25 == -1)
        ++*(_DWORD *)(*a1 + 28);
      v26 = *a1;
      *((_QWORD *)v12 + 1) = *a1;
      *((_QWORD *)v12 + 2) = *(_QWORD *)(v26 + 16);
      *((_QWORD *)v12 + 3) = *(_QWORD *)(*a1 + 24);
LABEL_29:
      v18 = 0;
      *a1 = (uint64_t)v13;
      return v18;
    }
    v47 = 1;
    v14 = getenv("DNSSD_UDS_PATH");
    if (v14)
    {
      v15 = v14;
      if (strlen(v14) < 0x68)
        goto LABEL_9;
      syslog(4, "dnssd_clientstub ConnectToServer: using default path since env len is invalid");
    }
    v15 = "/var/run/mDNSResponder";
LABEL_9:
    *a1 = 0;
    v16 = socket(1, 1, 0);
    v13[4] = v16;
    v13[5] = v16 ^ 0x12345678;
    if (v16 < 0)
    {
      v28 = *__error();
      v29 = __error();
      v30 = strerror(*v29);
      syslog(4, "dnssd_clientstub ConnectToServer: socket failed %d %s", v28, v30);
      FreeDNSServiceOp(v13);
      return 4294901757;
    }
    if (fcntl_NOCANCEL() == -1)
    {
      v17 = "dnssd_clientstub ConnectToServer: Failed to get the file descriptor flags of socket %d %s";
    }
    else
    {
      if (fcntl_NOCANCEL() != -1)
        goto LABEL_35;
      v17 = "dnssd_clientstub ConnectToServer: Failed to set FD_CLOEXEC on socket %d %s";
    }
    v31 = *__error();
    v32 = __error();
    v33 = strerror(*v32);
    syslog(4, v17, v31, v33);
LABEL_35:
    if (setsockopt(v13[4], 0xFFFF, 4130, &v47, 8u) < 0)
    {
      v34 = *__error();
      v35 = __error();
      v36 = strerror(*v35);
      syslog(4, "dnssd_clientstub ConnectToServer: SO_NOSIGPIPE failed %d %s", v34, v36);
    }
    BYTE1(v48) = 1;
    if (strlen(v15) > 0x67)
      BYTE2(v48) = 0;
    else
      __memcpy_chk();
    v46 = 1;
    if (setsockopt(v13[4], 0xFFFF, 4352, &v46, 4u) < 0)
    {
      v37 = *__error();
      v38 = __error();
      v39 = strerror(*v38);
      syslog(4, "dnssd_clientstub ConnectToServer: SO_DEFUNCTOK failed %d %s", v37, v39);
    }
    v40 = connect_NOCANCEL();
    if (v40)
    {
      v41 = v40;
      v42 = v13[4];
      v43 = *__error();
      v44 = __error();
      v45 = strerror(*v44);
      syslog(4, "dnssd_clientstub ConnectToServer: connect() failed path:%s Socket:%d Err:%d Errno:%d %s", v15, v42, v41, v43, v45);
      close_NOCANCEL();
      FreeDNSServiceOp(v13);
      return 4294901733;
    }
    goto LABEL_29;
  }
  v18 = 4294901756;
  syslog(4, "dnssd_clientstub DNSService operation with NULL DNSServiceRef");
  return v18;
}

DNSServiceErrorType DNSServiceProcessResult(DNSServiceRef sdRef)
{
  int v2;
  uint64_t v3;
  unsigned int *v4;
  int all;
  int8x16_t v6;
  unsigned int *v7;
  int v8;
  unint64_t v9;
  unsigned int *v11;
  unsigned int v12;
  unint64_t v13;
  unsigned int *v14;
  int v15;
  _BOOL4 v16;
  int v18;
  NSObject *v19;
  NSObject *v20;
  unsigned int v21;
  NSObject *v22;
  NSObject *v23;
  int8x16_t v25;
  __int128 v26;
  uint64_t v27;
  _BOOL4 v28;
  _OWORD v29[8];
  uint64_t v30;
  uint64_t v31;

  v28 = 0;
  if (!sdRef)
  {
    syslog(4, "dnssd_clientstub DNSServiceProcessResult called with NULL DNSServiceRef");
    LODWORD(v3) = -65540;
    goto LABEL_8;
  }
  v2 = *((_DWORD *)sdRef + 4);
  if (v2 < 0 || (*((_DWORD *)sdRef + 5) ^ v2) != 0x12345678)
  {
    LODWORD(v3) = -65541;
    syslog(4, "dnssd_clientstub DNSServiceProcessResult called with invalid DNSServiceRef %p %08X %08X");
    goto LABEL_8;
  }
  if (!*((_QWORD *)sdRef + 1))
  {
    if (!*((_QWORD *)sdRef + 7))
    {
      v18 = DNSServiceProcessResult_num_logs;
      if (DNSServiceProcessResult_num_logs <= 9)
      {
        syslog(4, "dnssd_clientstub DNSServiceProcessResult called with DNSServiceRef with no ProcessReply function");
        v18 = DNSServiceProcessResult_num_logs;
      }
      LODWORD(v3) = -65541;
      if (v18 > 999)
        sleep_NOCANCEL();
      else
        DNSServiceProcessResult_num_logs = v18 + 1;
      goto LABEL_8;
    }
    while (1)
    {
      v27 = 0;
      v25 = 0u;
      v26 = 0u;
      all = read_all(*((_DWORD *)sdRef + 4), (uint64_t)&v25, 0x1CuLL);
      switch(all)
      {
        case -1:
LABEL_50:
          if (all == -3)
            v3 = 4294901727;
          else
            v3 = 4294901733;
          *((_QWORD *)sdRef + 7) = 0;
          v19 = *((_QWORD *)sdRef + 11);
          if (v19)
          {
            dispatch_source_cancel(v19);
            v20 = *((_QWORD *)sdRef + 11);
            if (v20)
            {
              dispatch_release(v20);
              *((_QWORD *)sdRef + 11) = 0;
            }
            CallbackWithError((uint64_t *)sdRef, v3);
          }
          goto LABEL_8;
        case -2:
          if (v28)
          {
            v21 = *((_DWORD *)sdRef + 10);
            if (v21 <= 0x63)
            {
              *((_DWORD *)sdRef + 10) = v21 + 1;
              syslog(4, "dnssd_clientstub DNSServiceProcessResult error: select indicated data was waiting but read_all returned EWOULDBLOCK");
            }
          }
          LODWORD(v3) = 0;
          goto LABEL_8;
        case -3:
          goto LABEL_50;
      }
      v6 = vrev32q_s8(v25);
      v25 = v6;
      DWORD2(v26) = bswap32(DWORD2(v26));
      if (v6.i32[0] != 1)
      {
        syslog(4, "dnssd_clientstub DNSServiceProcessResult daemon version %d does not match client version %d", v6.i32[0], 1);
        *((_QWORD *)sdRef + 7) = 0;
        LODWORD(v3) = -65551;
        goto LABEL_8;
      }
      LODWORD(v4) = v6.i32[1];
      if (!v6.i32[1] || (v4 = (unsigned int *)malloc_type_malloc(v6.u32[1], 0xA172743EuLL)) == 0)
      {
LABEL_71:
        __break(1u);
        return (int)v4;
      }
      v7 = v4;
      v8 = read_all(*((_DWORD *)sdRef + 4), (uint64_t)v4, v25.u32[1]);
      if (v8 < 0)
      {
        if (v8 == -3)
          v3 = 4294901727;
        else
          v3 = 4294901733;
        *((_QWORD *)sdRef + 7) = 0;
        v22 = *((_QWORD *)sdRef + 11);
        if (v22)
        {
          dispatch_source_cancel(v22);
          v23 = *((_QWORD *)sdRef + 11);
          if (v23)
          {
            dispatch_release(v23);
            *((_QWORD *)sdRef + 11) = 0;
          }
          CallbackWithError((uint64_t *)sdRef, v3);
        }
        free(v7);
        goto LABEL_8;
      }
      v9 = (unint64_t)v7 + v25.u32[1];
      if ((unint64_t)(v7 + 1) > v9)
        break;
      HIDWORD(v26) = bswap32(*v7);
      if (v7 == (unsigned int *)-4 || (unint64_t)(v7 + 2) > v9)
        goto LABEL_24;
      LODWORD(v27) = bswap32(v7[1]);
      v11 = v7 + 3;
      if (v7 == (unsigned int *)-8 || (unint64_t)v11 > v9)
      {
        v11 = 0;
        v12 = 0;
      }
      else
      {
        v12 = bswap32(v7[2]);
      }
LABEL_25:
      HIDWORD(v27) = v12;
      v13 = *((unsigned int *)sdRef + 4);
      v30 = 0;
      v31 = 0;
      if ((int)v13 >= 1024)
      {
        v4 = (unsigned int *)malloc_type_calloc((v13 >> 5) + 1, 4uLL, 0xF1748037uLL);
        v14 = v4;
        if (!v4)
          goto LABEL_71;
      }
      else
      {
        v14 = (unsigned int *)v29;
      }
      memset(v29, 0, sizeof(v29));
      if (__darwin_check_fd_set_overflow(v13, v14, 0))
        *(unsigned int *)((char *)v14 + (((unint64_t)(int)v13 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v13;
      v15 = select_NOCANCEL();
      if (v14 != (unsigned int *)v29)
        free(v14);
      v16 = v15 > 0;
      v28 = v16;
      if (v15 >= 1)
      {
        HIDWORD(v26) |= 1u;
        *((_QWORD *)sdRef + 6) = &v28;
      }
      if (v11)
      {
        (*((void (**)(DNSServiceRef, int8x16_t *, unsigned int *, char *))sdRef + 7))(sdRef, &v25, v11, (char *)v7 + v25.u32[1]);
        v16 = v28;
      }
      if (v16)
        *((_QWORD *)sdRef + 6) = 0;
      free(v7);
      LODWORD(v3) = 0;
      if (!v28)
        goto LABEL_8;
    }
    HIDWORD(v26) = 0;
LABEL_24:
    v11 = 0;
    v12 = 0;
    LODWORD(v27) = 0;
    goto LABEL_25;
  }
  LODWORD(v3) = -65541;
  syslog(4, "dnssd_clientstub DNSServiceProcessResult undefined for kDNSServiceFlagsShareConnection subordinate DNSServiceRef %p");
LABEL_8:
  LODWORD(v4) = v3;
  return (int)v4;
}

uint64_t read_all(int a1, uint64_t a2, unint64_t a3)
{
  unint64_t v3;
  uint64_t v6;
  uint64_t v7;
  int v9;
  int *v10;
  char *v11;
  int *v12;
  socklen_t v13;
  int v14;

  if (!a3)
    return 0;
  v3 = a3;
  while (1)
  {
    while (1)
    {
      v6 = recv_NOCANCEL();
      v7 = v6;
      if (v6 < 0)
        break;
      if (v6 - 1 >= v3)
        goto LABEL_10;
      a2 += v6;
      v3 -= v6;
      if (!v3)
        return 0;
    }
    if (*__error() != 4)
      break;
    syslog(6, "dnssd_clientstub read_all: EINTR continue");
  }
LABEL_10:
  v13 = 4;
  v14 = 0;
  if (getsockopt(a1, 0xFFFF, 4353, &v14, &v13) < 0)
  {
    v9 = *__error();
    v10 = __error();
    v11 = strerror(*v10);
    syslog(4, "dnssd_clientstub read_all: SO_ISDEFUNCT failed %d %s", v9, v11);
  }
  if (v14)
  {
    syslog(6, "dnssd_clientstub read_all(%d) DEFUNCT");
  }
  else
  {
    if (v7 < 0)
    {
      __error();
      v12 = __error();
      strerror(*v12);
    }
    syslog(4, "dnssd_clientstub read_all(%d) failed %ld/%ld %d %s");
  }
  if (v7 < 0 && *__error() == 35)
    return 4294967294;
  if (v14)
    return 4294967293;
  return 0xFFFFFFFFLL;
}

void handle_query_response(uint64_t a1, uint64_t a2, unsigned __int16 *a3, unint64_t a4)
{
  _BYTE *v8;
  int v9;
  unsigned __int16 *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int *v14;
  BOOL v15;
  unsigned __int16 *v17;
  unsigned __int16 *v18;
  BOOL v19;
  unsigned int v20;
  void *v22;
  _BYTE v23[1009];
  _QWORD v24[2];

  v24[0] = *MEMORY[0x1E0C874D8];
  if (*(_DWORD *)(a2 + 36) != -65570)
    goto LABEL_5;
  if (_should_return_noauth_error_s_once != -1)
    dispatch_once(&_should_return_noauth_error_s_once, &__block_literal_global);
  if (_should_return_noauth_error_s_should)
  {
LABEL_5:
    if (a3)
    {
      v8 = v23;
      do
      {
        if ((unint64_t)a3 >= a4 || v8 >= (_BYTE *)v24)
        {
          v11 = 0;
          v12 = 0;
          v10 = 0;
          v13 = 0;
          v8[-(v8 == (_BYTE *)v24)] = 0;
          goto LABEL_21;
        }
        v9 = *(unsigned __int8 *)a3;
        a3 = (unsigned __int16 *)((char *)a3 + 1);
        *v8++ = v9;
      }
      while (v9);
      v10 = 0;
      v11 = 0;
      if (a3)
      {
        v12 = 0;
        v13 = 0;
        if ((unint64_t)(a3 + 1) > a4)
          goto LABEL_21;
        v10 = 0;
        v11 = 0;
        v12 = bswap32(*a3) >> 16;
        if (a3 != (unsigned __int16 *)-2 && (unint64_t)(a3 + 2) <= a4)
        {
          v13 = 0;
          v10 = 0;
          v11 = bswap32(a3[1]) >> 16;
          if (a3 != (unsigned __int16 *)-4 && (unint64_t)(a3 + 3) <= a4)
          {
            v13 = bswap32(a3[2]) >> 16;
            v10 = a3 + 3;
          }
          goto LABEL_21;
        }
      }
      else
      {
        v12 = 0;
      }
      v13 = 0;
    }
    else
    {
      v11 = 0;
      v12 = 0;
      v10 = 0;
      v13 = 0;
      v23[0] = 0;
    }
LABEL_21:
    v14 = (unsigned int *)((char *)v10 + v13);
    if (v10)
      v15 = (unint64_t)v14 > a4;
    else
      v15 = 1;
    if (v15)
    {
      v14 = 0;
      v17 = 0;
    }
    else
    {
      v17 = v10;
    }
    v18 = (unsigned __int16 *)(v14 + 1);
    if (v14)
      v19 = (unint64_t)v18 > a4;
    else
      v19 = 1;
    if (v19)
    {
      v18 = 0;
      v20 = 0;
    }
    else
    {
      v20 = bswap32(*v14);
    }
    *(_QWORD *)(a1 + 104) = 0;
    *(_QWORD *)(a1 + 112) = 0;
    if ((*(_BYTE *)(a2 + 8) & 2) != 0)
      *(_QWORD *)(a1 + 104) = get_validation_data_from_tlvs(v18, a4, (_QWORD *)(a1 + 112));
    if (MEMORY[0x1E0C889B8])
    {
      if (((_DWORD)v12 == 28 || (_DWORD)v12 == 1) && (_DWORD)v11 == 1)
      {
        v22 = *(void **)(a1 + 120);
        if (v22)
        {
          if ((*(_BYTE *)(a2 + 8) & 2) == 0
            || !get_tracker_hostname_from_tlvs(v18, a4)
            || (ne_tracker_create_xcode_issue(), (v22 = *(void **)(a1 + 120)) != 0))
          {
            free(v22);
            *(_QWORD *)(a1 + 120) = 0;
          }
          *(_QWORD *)(a1 + 128) = 0;
        }
      }
    }
    if (v18)
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _BYTE *, uint64_t, uint64_t, uint64_t, unsigned __int16 *, unsigned int, _QWORD))(a1 + 64))(a1, *(unsigned int *)(a2 + 28), *(unsigned int *)(a2 + 32), *(unsigned int *)(a2 + 36), v23, v12, v11, v13, v17, v20, *(_QWORD *)(a1 + 72));
    else
      syslog(4, "dnssd_clientstub handle_query_response: error reading result from daemon");
  }
}

void ConnectionResponse(uint64_t **a1, _DWORD *a2)
{
  int v4;
  uint64_t *v5;
  uint64_t *v6;
  void (*v7)(void);
  int v8;
  uint64_t **v10;
  uint64_t v11;
  void (*v12)(uint64_t **, uint64_t *, uint64_t, uint64_t, uint64_t);
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a2[3];
  if (v4 == 69 || v4 == 73)
  {
    if (a2[9] != -65570)
      goto LABEL_7;
    if (_should_return_noauth_error_s_once != -1)
      dispatch_once(&_should_return_noauth_error_s_once, &__block_literal_global);
    if (_should_return_noauth_error_s_should)
    {
LABEL_7:
      v5 = a1[10];
      if (v5)
      {
        while (*((_DWORD *)v5 + 9) != a2[4] || *((_DWORD *)v5 + 10) != a2[5])
        {
          v5 = (uint64_t *)*v5;
          if (!v5)
            goto LABEL_11;
        }
        if ((uint64_t **)v5[6] == a1)
        {
          v8 = *((_DWORD *)a1 + 8);
          if (v8 == 19 || v8 == 1)
          {
            v14 = a2[7];
            v15 = a2[9];
            v11 = v5[1];
            v12 = (void (*)(uint64_t **, uint64_t *, uint64_t, uint64_t, uint64_t))v5[2];
            v10 = a1;
            v13 = v5;
          }
          else
          {
            syslog(4, "dnssd_clientstub ConnectionResponse: sdr->op != connection_request");
            v10 = (uint64_t **)v5[6];
            v11 = v5[1];
            v12 = (void (*)(uint64_t **, uint64_t *, uint64_t, uint64_t, uint64_t))v5[2];
            v13 = v5;
            v14 = 0;
            v15 = 4294901759;
          }
          v12(v10, v13, v14, v15, v11);
        }
        else
        {
          syslog(4, "dnssd_clientstub ConnectionResponse: Record sdr mismatch: rec %p sdr %p");
        }
      }
      else
      {
LABEL_11:
        syslog(6, "dnssd_clientstub ConnectionResponse: Record not found");
      }
    }
  }
  else
  {
    v6 = *a1;
    if (*a1)
    {
      while (*((_DWORD *)v6 + 6) != a2[4] || *((_DWORD *)v6 + 7) != a2[5])
      {
        v6 = (uint64_t *)*v6;
        if (!v6)
          return;
      }
      v7 = (void (*)(void))v6[7];
      if (v7)
        v7();
    }
  }
}

uint64_t put_tlvs_for_validation_attr(uint64_t a1, uint64_t a2, unint64_t *a3, unint64_t a4)
{
  void *v8;
  uint64_t result;

  v8 = *(void **)(a1 + 32);
  if (v8)
    put_tlv(7, *(unsigned __int16 *)(a1 + 24), v8, (_BYTE **)a3, a4);
  result = put_tlv_uint32(6, *(_DWORD *)(a1 + 20), a3, a4);
  *(_DWORD *)(a2 + 8) |= 2u;
  return result;
}

xpc_object_t DNSServiceGetRetainedResolverDefaults()
{
  xpc_object_t v0;

  os_unfair_lock_lock((os_unfair_lock_t)&g_defaults_lock);
  if (g_defaults_dict)
    v0 = xpc_retain((xpc_object_t)g_defaults_dict);
  else
    v0 = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)&g_defaults_lock);
  return v0;
}

const char *DNSServiceErrorCodeToString(int a1)
{
  const char *result;

  switch(a1)
  {
    case -65571:
      result = "NotPermitted";
      break;
    case -65570:
      result = "PolicyDenied";
      break;
    case -65569:
      result = "DefunctConnection";
      break;
    case -65568:
      result = "Timeout";
      break;
    case -65567:
      result = "PollingMode";
      break;
    case -65566:
      result = "NoRouter";
      break;
    case -65565:
      result = "NATPortMappingDisabled";
      break;
    case -65564:
      result = "NATPortMappingUnsupported";
      break;
    case -65563:
      result = "ServiceNotRunning";
      break;
    case -65562:
      result = "Transient";
      break;
    case -65561:
      result = "BadKey";
      break;
    case -65560:
      result = "BadSig";
      break;
    case -65559:
      result = "BadTime";
      break;
    case -65558:
      result = "DoubleNAT";
      break;
    case -65557:
      result = "NATTraversal";
      break;
    case -65556:
      result = "NoSuchKey";
      break;
    case -65555:
      result = "NoAuth";
      break;
    case -65554:
      result = "NoSuchRecord";
      break;
    case -65553:
      result = "Refused";
      break;
    case -65552:
      result = "BadInterfaceIndex";
      break;
    case -65551:
      result = "Incompatible";
      break;
    case -65550:
      result = "Firewall";
      break;
    case -65549:
      result = "Invalid";
      break;
    case -65548:
      result = "NameConflict";
      break;
    case -65547:
      result = "AlreadyRegistered";
      break;
    case -65546:
      goto LABEL_5;
    case -65545:
      result = "NotInitialized";
      break;
    case -65544:
      result = "Unsupported";
      break;
    case -65543:
      result = "BadFlags";
      break;
    case -65542:
      result = "BadState";
      break;
    case -65541:
      result = "BadReference";
      break;
    case -65540:
      result = "BadParam";
      break;
    case -65539:
      result = "NoMemory";
      break;
    case -65538:
      result = "NoSuchName";
      break;
    case -65537:
      result = "Unknown";
      break;
    default:
      if (a1)
LABEL_5:
        result = "<INVALID ERROR CODE>";
      else
        result = "NoError";
      break;
  }
  return result;
}

void handle_addrinfo_response(uint64_t a1, uint64_t a2, unsigned __int16 *a3, unint64_t a4)
{
  uint64_t *v8;
  int v9;
  unsigned __int16 *v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  unsigned __int16 *v14;
  unsigned int *v15;
  BOOL v16;
  void *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE v27[1009];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C874D8];
  if (*(_DWORD *)(a2 + 36) != -65570)
    goto LABEL_5;
  if (_should_return_noauth_error_s_once != -1)
    dispatch_once(&_should_return_noauth_error_s_once, &__block_literal_global);
  if (_should_return_noauth_error_s_should)
  {
LABEL_5:
    if (a3)
    {
      v8 = (uint64_t *)v27;
      do
      {
        if ((unint64_t)a3 >= a4 || v8 >= &v28)
        {
          v11 = 0;
          v10 = 0;
          v12 = 0;
          *((_BYTE *)v8 - (v8 == &v28)) = 0;
          goto LABEL_20;
        }
        v9 = *(unsigned __int8 *)a3;
        a3 = (unsigned __int16 *)((char *)a3 + 1);
        *(_BYTE *)v8 = v9;
        v8 = (uint64_t *)((char *)v8 + 1);
      }
      while (v9);
      v10 = 0;
      v11 = 0;
      if (!a3)
        goto LABEL_19;
      v12 = 0;
      if ((unint64_t)(a3 + 1) > a4)
        goto LABEL_20;
      v10 = 0;
      v11 = __rev16(*a3);
      if (a3 == (unsigned __int16 *)-2
        || (unint64_t)(a3 + 2) > a4
        || (v10 = 0, a3 == (unsigned __int16 *)-4)
        || (unint64_t)(a3 + 3) > a4)
      {
LABEL_19:
        v12 = 0;
      }
      else
      {
        v12 = __rev16(a3[2]);
        v10 = a3 + 3;
      }
    }
    else
    {
      v11 = 0;
      v10 = 0;
      v12 = 0;
      v27[0] = 0;
    }
LABEL_20:
    v13 = 0;
    v14 = 0;
    v15 = (unsigned int *)((char *)v10 + v12);
    if (v10)
      v16 = (unint64_t)v15 > a4;
    else
      v16 = 1;
    if (v16)
      v15 = 0;
    if (v15 && (unint64_t)(v15 + 1) <= a4)
    {
      v13 = bswap32(*v15);
      v14 = (unsigned __int16 *)(v15 + 1);
    }
    *(_QWORD *)(a1 + 104) = 0;
    *(_QWORD *)(a1 + 112) = 0;
    if ((*(_BYTE *)(a2 + 8) & 2) != 0)
      *(_QWORD *)(a1 + 104) = get_validation_data_from_tlvs(v14, a4, (_QWORD *)(a1 + 112));
    if (!v14)
    {
      syslog(4, "dnssd_clientstub handle_addrinfo_response: error reading result from daemon");
      return;
    }
    if (v11 == 28 || v11 == 1)
    {
      if (MEMORY[0x1E0C889B8])
      {
        v18 = *(void **)(a1 + 120);
        if (v18)
        {
          if ((*(_BYTE *)(a2 + 8) & 2) == 0
            || !get_tracker_hostname_from_tlvs(v14, a4)
            || (ne_tracker_create_xcode_issue(), (v18 = *(void **)(a1 + 120)) != 0))
          {
            free(v18);
            *(_QWORD *)(a1 + 120) = 0;
          }
          *(_QWORD *)(a1 + 128) = 0;
        }
      }
      v25 = 0;
      v26 = 0;
      v21 = 0;
      v22 = 0;
      v24 = 0;
      v23 = 0;
      if (v11 == 1)
        v19 = &v25;
      else
        v19 = &v21;
      if (v11 == 1)
      {
        v26 = 0;
        v25 = 528;
        v20 = *(unsigned int *)(a2 + 36);
        if (!(_DWORD)v20)
        {
          __memcpy_chk();
LABEL_56:
          v20 = 0;
        }
      }
      else
      {
        LOWORD(v21) = 7708;
        v20 = *(unsigned int *)(a2 + 36);
        if (!(_DWORD)v20)
        {
          __memcpy_chk();
          if (v22 != 254 || (BYTE1(v22) & 0xC0) != 0x80)
            goto LABEL_56;
          v20 = 0;
          v24 = *(_DWORD *)(a2 + 32);
        }
      }
      (*(void (**)(uint64_t, _QWORD, _QWORD, uint64_t, _BYTE *, uint64_t *, uint64_t, _QWORD, uint64_t))(a1 + 64))(a1, *(unsigned int *)(a2 + 28), *(unsigned int *)(a2 + 32), v20, v27, v19, v13, *(_QWORD *)(a1 + 72), v21);
      return;
    }
    if (*(_DWORD *)(a2 + 36) == -65570)
      (*(void (**)(uint64_t, _QWORD, _QWORD, uint64_t, _BYTE *, _QWORD, uint64_t, _QWORD, uint64_t))(a1 + 64))(a1, *(unsigned int *)(a2 + 28), *(unsigned int *)(a2 + 32), 4294901726, v27, 0, v13, *(_QWORD *)(a1 + 72), v21);
  }
}

unsigned __int16 *get_validation_data_from_tlvs(unsigned __int16 *a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  unsigned __int16 *v4;
  uint64_t v5;
  unsigned __int16 *v6;
  unsigned int v7;

  while (1)
  {
    if (a2 - (uint64_t)a1 < 4)
    {
      v3 = 0;
      v6 = 0;
LABEL_8:
      if (!a3)
        return v6;
LABEL_9:
      *a3 = v3;
      return v6;
    }
    v3 = 0;
    v4 = a1 + 2;
    if (a1 == (unsigned __int16 *)-4)
      break;
    v5 = __rev16(a1[1]);
    v6 = 0;
    if (a2 - (uint64_t)v4 < v5)
      goto LABEL_8;
    v7 = __rev16(*a1);
    a1 = (unsigned __int16 *)((char *)v4 + v5);
    if (v7 == 7)
    {
      v3 = v5;
      v6 = v4;
      if (!a3)
        return v6;
      goto LABEL_9;
    }
  }
  v6 = 0;
  if (a3)
    goto LABEL_9;
  return v6;
}

uint64_t DNSServiceGetPID(unsigned int a1, uint64_t a2)
{
  uint64_t v4;
  int8x16_t *v5;
  int all;
  size_t v8;
  DNSServiceRef sdRef;
  _WORD *v10;

  v8 = 4;
  sdRef = 0;
  v4 = ConnectToServer((uint64_t *)&sdRef, 0, 17, 0, 0, 0);
  if (!(_DWORD)v4)
  {
    v10 = 0;
    v5 = (int8x16_t *)create_hdr(17, &v8, &v10, 0, (uint64_t)sdRef);
    *v10 = __rev16(a1);
    v4 = deliver_request(v5, (uint64_t)sdRef);
    if ((_DWORD)v4)
    {
      DNSServiceRefDeallocate(sdRef);
    }
    else
    {
      all = read_all(*((_DWORD *)sdRef + 4), a2, 4uLL);
      DNSServiceRefDeallocate(sdRef);
      if (all < 0)
      {
        if (all == -3)
          return 4294901727;
        else
          return 4294901733;
      }
      else
      {
        return 0;
      }
    }
  }
  return v4;
}

unint64_t put_tlv(char a1, size_t __n, void *__src, _BYTE **a4, unint64_t a5)
{
  _BYTE *v6;
  uint64_t v7;
  unint64_t v8;
  _BYTE *v10;

  if (!a4)
    return __n + 4;
  v6 = *a4;
  v7 = __n;
  v8 = __n + 4;
  if (*a4)
  {
    if (a5 >= (unint64_t)v6 && a5 - (unint64_t)v6 >= v8)
    {
      *v6 = 0;
      v6[1] = a1;
      v6[2] = BYTE1(__n);
      v10 = v6 + 4;
      v6[3] = __n;
      if ((_DWORD)__n)
      {
        memcpy(v6 + 4, __src, __n);
        v6 = &v10[v7];
      }
      else
      {
        v6 += 4;
      }
    }
  }
  *a4 = v6;
  return v8;
}

uint64_t put_tlv_uint32(char a1, unsigned int a2, unint64_t *a3, unint64_t a4)
{
  unint64_t v4;

  if (a3)
  {
    v4 = *a3;
    if (*a3)
    {
      if (a4 >= v4 && a4 - v4 >= 8)
      {
        *(_BYTE *)v4 = 0;
        *(_BYTE *)(v4 + 1) = a1;
        *(_WORD *)(v4 + 2) = 1024;
        *(_DWORD *)(v4 + 4) = bswap32(a2);
        v4 += 8;
      }
    }
    *a3 = v4;
  }
  return 8;
}

uint64_t DNSServiceSetResolverDefaults(const void *a1, size_t a2, BOOL a3)
{
  uint64_t v3;
  xpc_object_t v7;
  void *v8;
  void *v9;

  v3 = 4294901747;
  if (a2 <= 0x8000)
  {
    v7 = xpc_dictionary_create(0, 0, 0);
    if (v7)
    {
      v8 = v7;
      xpc_dictionary_set_BOOL(v7, "require_privacy", a3);
      if (a1 && a2)
        xpc_dictionary_set_data(v8, "resolver_config_plist_data", a1, a2);
      os_unfair_lock_lock((os_unfair_lock_t)&g_defaults_lock);
      v9 = (void *)g_defaults_dict;
      g_defaults_dict = (uint64_t)v8;
      os_unfair_lock_unlock((os_unfair_lock_t)&g_defaults_lock);
      if (v9)
        xpc_release(v9);
      return 0;
    }
    else
    {
      return 4294901757;
    }
  }
  return v3;
}

uint64_t DNSServiceResolveEx(uint64_t *a1, int a2, int a3, const char *a4, const char *a5, const char *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return DNSServiceResolveInternal(a1, a2, a3, a4, a5, a6, a7, a8, a9);
}

void *DNSServiceAttrCreate()
{
  void *result;

  result = malloc_type_calloc(1uLL, 0x30uLL, 0xF1748037uLL);
  if (!result)
    __break(1u);
  return result;
}

const char *get_tracker_hostname_from_tlvs(unsigned __int16 *a1, uint64_t a2)
{
  size_t v2;
  const char *v3;
  int64_t v4;
  const char *v5;
  unsigned int v6;

  while (1)
  {
    if (a2 - (uint64_t)a1 < 4)
    {
      v2 = 0;
      v5 = 0;
      goto LABEL_8;
    }
    v2 = 0;
    v3 = (const char *)(a1 + 2);
    if (a1 == (unsigned __int16 *)-4)
      break;
    v4 = __rev16(a1[1]);
    v5 = 0;
    if (a2 - (uint64_t)v3 < v4)
      goto LABEL_8;
    v6 = __rev16(*a1);
    a1 = (unsigned __int16 *)&v3[v4];
    if (v6 == 9)
    {
      v2 = v4;
      v5 = v3;
      goto LABEL_8;
    }
  }
  v5 = 0;
LABEL_8:
  if (strnlen(v5, v2) == v2 - 1)
    return v5;
  else
    return 0;
}

BOOL put_tlvs_for_defaults(void *a1, uint64_t a2, _BYTE **a3, unint64_t a4)
{
  void *data;
  _BOOL8 result;
  _BYTE *v10;
  size_t length;

  length = 0;
  data = (void *)xpc_dictionary_get_data(a1, "resolver_config_plist_data", &length);
  if (data)
    put_tlv(1, (unsigned __int16)length, data, a3, a4);
  result = xpc_dictionary_get_BOOL(a1, "require_privacy");
  if (a3)
  {
    v10 = *a3;
    if (*a3 && a4 >= (unint64_t)v10 && a4 - (unint64_t)v10 >= 5)
    {
      *(_DWORD *)v10 = 16777728;
      v10[4] = result;
      v10 += 5;
    }
    *a3 = v10;
  }
  *(_DWORD *)(a2 + 8) |= 2u;
  return result;
}

DNSServiceErrorType DNSServiceConstructFullName(char *const fullName, const char *const service, const char *const regtype, const char *const domain)
{
  DNSServiceErrorType v4;
  size_t v9;
  _BOOL4 v10;
  unint64_t v11;
  const char *v12;
  char *v13;
  unsigned __int8 v14;
  const char *v15;
  char *v16;
  int v17;
  char v18;
  const char *v19;
  char *v20;
  int v21;
  char v22;
  const char *v23;
  int v24;

  v4 = -65540;
  if (regtype)
  {
    v9 = strlen(regtype);
    v10 = DomainEndsInDot((unsigned __int8 *)regtype);
    if (domain)
    {
      v11 = v9 - v10;
      if (v11 >= 6)
      {
        if (*domain)
        {
          v12 = &regtype[v11 - 4];
          if (!strncasecmp(v12, "_tcp", 4uLL) || !strncasecmp(v12, "_udp", 4uLL))
          {
            v13 = fullName + 1005;
            if (service)
            {
              v14 = *service;
              if (*service)
              {
                v15 = service + 1;
                do
                {
                  if (v14 > 0x20u)
                  {
                    if (v14 == 92 || v14 == 46)
                    {
                      if (fullName + 2 >= v13)
                        goto LABEL_40;
                      *fullName = 92;
                      v16 = fullName + 1;
                    }
                    else
                    {
                      v16 = fullName;
                      if (fullName + 1 >= v13)
                        goto LABEL_40;
                    }
                  }
                  else
                  {
                    if (fullName + 4 >= v13)
                      goto LABEL_40;
                    *(_WORD *)fullName = 12380;
                    v16 = fullName + 3;
                    fullName[2] = (v14 / 0xAu) | 0x30;
                    v14 = (v14 % 0xAu) | 0x30;
                  }
                  *v16 = v14;
                  fullName = v16 + 1;
                  v17 = *(unsigned __int8 *)v15++;
                  v14 = v17;
                }
                while (v17);
                fullName = v16 + 2;
                v16[1] = 46;
              }
            }
            v18 = *regtype;
            if (*regtype)
            {
              v19 = regtype + 1;
              while (1)
              {
                v20 = fullName + 1;
                if (fullName + 1 >= v13)
                  goto LABEL_40;
                *fullName = v18;
                v21 = *(unsigned __int8 *)v19++;
                v18 = v21;
                ++fullName;
                if (!v21)
                  goto LABEL_26;
              }
            }
            v20 = fullName;
LABEL_26:
            if (!DomainEndsInDot((unsigned __int8 *)regtype))
            {
              if (v20 + 1 >= v13)
                goto LABEL_34;
              *v20++ = 46;
            }
            v22 = *domain;
            if (!*domain)
            {
              fullName = v20;
LABEL_36:
              if (DomainEndsInDot((unsigned __int8 *)domain))
              {
                v4 = 0;
              }
              else if (fullName + 1 < v13)
              {
                v4 = 0;
                *fullName++ = 46;
              }
              goto LABEL_40;
            }
            v23 = domain + 1;
            while (1)
            {
              fullName = v20 + 1;
              if (v20 + 1 >= v13)
                break;
              *v20 = v22;
              v24 = *(unsigned __int8 *)v23++;
              v22 = v24;
              ++v20;
              if (!v24)
                goto LABEL_36;
            }
LABEL_34:
            fullName = v20;
LABEL_40:
            *fullName = 0;
          }
        }
      }
    }
  }
  return v4;
}

BOOL DomainEndsInDot(unsigned __int8 *a1)
{
  int v1;
  int v2;
  uint64_t v3;

  v1 = *a1;
  if (*a1)
  {
    while (1)
    {
      v2 = a1[1];
      if (!a1[1])
        break;
      if (v1 == 92)
      {
        if ((v2 - 48) > 9 || a1[2] - 48 > 9 || a1[3] - 48 >= 0xA)
          v3 = 2;
        else
          v3 = 4;
        a1 += v3;
        v1 = *a1;
        if (!*a1)
          return v1 == 46;
      }
      else
      {
        v1 = *++a1;
        if (!v2)
          return v1 == 46;
      }
    }
  }
  return v1 == 46;
}

void TXTRecordCreate(TXTRecordRef *txtRecord, uint16_t bufferLen, void *buffer)
{
  uint16_t v3;

  txtRecord->ForceNaturalAlignment = (char *)buffer;
  if (buffer)
    v3 = bufferLen;
  else
    v3 = 0;
  *((_WORD *)&txtRecord->ForceNaturalAlignment + 4) = v3;
  *(_DWORD *)((char *)&txtRecord->ForceNaturalAlignment + 10) = 0;
}

void TXTRecordDeallocate(TXTRecordRef *txtRecord)
{
  char *ForceNaturalAlignment;

  if (*((_WORD *)&txtRecord->ForceNaturalAlignment + 6))
  {
    ForceNaturalAlignment = txtRecord->ForceNaturalAlignment;
    if (ForceNaturalAlignment)
    {
      free(ForceNaturalAlignment);
      txtRecord->ForceNaturalAlignment = 0;
    }
  }
}

DNSServiceErrorType TXTRecordSetValue(TXTRecordRef *txtRecord, const char *key, uint8_t valueSize, const void *value)
{
  int v7;
  char v8;
  const char *v9;
  char v10;
  size_t v11;
  uint64_t v12;
  size_t v13;
  size_t v14;
  uint64_t v15;
  size_t v16;
  char *v17;
  char *ForceNaturalAlignment;
  char *v19;
  char *v20;
  char *v21;

  v7 = -65549;
  v8 = *key;
  v9 = key;
  if (*key)
  {
    v9 = key;
    while (v8 >= 32 && v8 != 61 && v8 != 127)
    {
      v10 = *++v9;
      v8 = v10;
      if (!v10)
        goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_7:
  v11 = valueSize;
  v12 = valueSize + 2;
  if (!value)
    v12 = 1;
  v13 = v9 - key;
  if (v9 != key)
  {
    v14 = v12 + v13;
    if (v12 + v13 <= 0xFF)
    {
      TXTRecordRemoveValue(txtRecord, key);
      v15 = *((unsigned __int16 *)&txtRecord->ForceNaturalAlignment + 5);
      v16 = v14 + v15;
      if (v16 <= *((unsigned __int16 *)&txtRecord->ForceNaturalAlignment + 4))
      {
        ForceNaturalAlignment = txtRecord->ForceNaturalAlignment;
LABEL_19:
        v19 = &ForceNaturalAlignment[v15];
        v20 = &ForceNaturalAlignment[v15 + 1];
        memcpy(v20, key, v13);
        v21 = &v20[v13];
        if (value)
        {
          *v21++ = 61;
          memcpy(v21, value, v11);
          LOWORD(v21) = (_WORD)v21 + v11;
        }
        v7 = 0;
        *v19 = (_BYTE)v21 - (_BYTE)v19 - 1;
        *((_WORD *)&txtRecord->ForceNaturalAlignment + 5) += (_WORD)v21 - (_WORD)v19;
        goto LABEL_22;
      }
      if (!(v16 >> 16))
      {
        v17 = (char *)malloc_type_malloc(v16, 0xA172743EuLL);
        if (!v17)
        {
          __break(1u);
          return (int)v17;
        }
        ForceNaturalAlignment = v17;
        memcpy(v17, txtRecord->ForceNaturalAlignment, *((unsigned __int16 *)&txtRecord->ForceNaturalAlignment + 5));
        if (*((_WORD *)&txtRecord->ForceNaturalAlignment + 6) && txtRecord->ForceNaturalAlignment)
          free(txtRecord->ForceNaturalAlignment);
        txtRecord->ForceNaturalAlignment = ForceNaturalAlignment;
        *((_WORD *)&txtRecord->ForceNaturalAlignment + 4) = v16;
        *((_WORD *)&txtRecord->ForceNaturalAlignment + 6) = 1;
        v15 = *((unsigned __int16 *)&txtRecord->ForceNaturalAlignment + 5);
        goto LABEL_19;
      }
    }
  }
LABEL_22:
  LODWORD(v17) = v7;
  return (int)v17;
}

DNSServiceErrorType TXTRecordRemoveValue(TXTRecordRef *txtRecord, const char *key)
{
  uint64_t v3;
  char *ForceNaturalAlignment;
  char *v5;
  uint64_t v6;
  DNSServiceErrorType result;
  size_t v8;

  v3 = *((unsigned __int16 *)&txtRecord->ForceNaturalAlignment + 5);
  ForceNaturalAlignment = txtRecord->ForceNaturalAlignment;
  v5 = (char *)InternalTXTRecordSearch(*((unsigned __int16 *)&txtRecord->ForceNaturalAlignment + 5), txtRecord->ForceNaturalAlignment, (char *)key, &v8);
  if (!v5)
    return -65556;
  v6 = *v5 + 1;
  memmove(v5, &v5[v6], &ForceNaturalAlignment[v3] - &v5[v6]);
  result = 0;
  *((_WORD *)&txtRecord->ForceNaturalAlignment + 5) -= v6;
  return result;
}

const char *InternalTXTRecordSearch(int a1, const char *a2, char *__s, size_t *a4)
{
  const char *v6;
  unint64_t v7;
  size_t v8;
  size_t v9;
  size_t v10;
  size_t v11;
  unint64_t v12;
  BOOL v13;

  v6 = a2;
  v7 = (unint64_t)&a2[a1];
  v8 = strlen(__s);
  *a4 = v8;
  if (v7 <= (unint64_t)v6)
    return 0;
  v9 = v8;
  v10 = v8 + 1;
  while (1)
  {
    v11 = *(unsigned __int8 *)v6;
    v12 = (unint64_t)&v6[v11 + 1];
    v13 = v12 > v7 || v9 > v11;
    if (!v13 && !strncasecmp(__s, v6 + 1, v9) && (v9 == v11 || v6[v10] == 61))
      break;
    v6 += v11 + 1;
    if (v12 >= v7)
      return 0;
  }
  return v6;
}

uint16_t TXTRecordGetLength(const TXTRecordRef *txtRecord)
{
  return *((_WORD *)&txtRecord->ForceNaturalAlignment + 5);
}

const void *__cdecl TXTRecordGetBytesPtr(const TXTRecordRef *txtRecord)
{
  return txtRecord->ForceNaturalAlignment;
}

int TXTRecordContainsKey(uint16_t txtLen, const void *txtRecord, const char *key)
{
  size_t v4;

  return InternalTXTRecordSearch(txtLen, (const char *)txtRecord, (char *)key, &v4) != 0;
}

const void *__cdecl TXTRecordGetValuePtr(uint16_t txtLen, const void *txtRecord, const char *key, uint8_t *valueLen)
{
  const void *result;
  size_t v6;
  size_t v7;
  size_t v8;

  v8 = 0;
  result = InternalTXTRecordSearch(txtLen, (const char *)txtRecord, (char *)key, &v8);
  if (result)
  {
    v6 = *(unsigned __int8 *)result;
    v7 = v8;
    if (v8 >= v6)
    {
      return 0;
    }
    else
    {
      *valueLen = v6 + ~(_BYTE)v8;
      return (char *)result + v7 + 2;
    }
  }
  return result;
}

uint16_t TXTRecordGetCount(uint16_t txtLen, const void *txtRecord)
{
  char *v2;
  uint16_t v3;

  v2 = (char *)txtRecord + txtLen;
  if (v2 <= txtRecord)
  {
    v3 = 0;
  }
  else
  {
    v3 = 0;
    do
    {
      txtRecord = (char *)txtRecord + *(unsigned __int8 *)txtRecord + 1;
      ++v3;
    }
    while (txtRecord < v2);
  }
  if (txtRecord <= v2)
    return v3;
  else
    return 0;
}

DNSServiceErrorType TXTRecordGetItemAtIndex(uint16_t txtLen, const void *txtRecord, uint16_t itemIndex, uint16_t keyBufLen, char *key, uint8_t *valueLen, const void **value)
{
  char *v10;
  char *v11;
  _BOOL4 v12;
  unsigned int v14;
  DNSServiceErrorType result;
  char *v17;
  size_t v18;
  char *v19;
  size_t v20;
  char *v21;
  uint8_t v22;

  v10 = (char *)txtRecord;
  v11 = (char *)txtRecord + txtLen;
  v12 = v11 > txtRecord;
  if (v11 > txtRecord && itemIndex != 0)
  {
    v14 = 0;
    do
    {
      v10 += *v10 + 1;
      ++v14;
      v12 = v10 < v11;
    }
    while (v10 < v11 && v14 < itemIndex);
  }
  result = -65549;
  if (v12)
  {
    v17 = v10 + 1;
    v18 = *v10;
    v19 = &v10[v18 + 1];
    if (v19 <= v11)
    {
      if (v17 >= v19)
      {
        v18 = 0;
LABEL_19:
        if (v18 < keyBufLen)
        {
          memcpy(key, v17, v18);
          v22 = 0;
          key[v18] = 0;
          *value = 0;
LABEL_23:
          result = 0;
          *valueLen = v22;
          return result;
        }
      }
      else
      {
        v20 = 0;
        while (1)
        {
          v21 = &v17[v20];
          if (v17[v20] == 61)
            break;
          if (v18 == ++v20)
            goto LABEL_19;
        }
        if (v20 < keyBufLen)
        {
          memcpy(key, v17, v20);
          key[v20] = 0;
          *value = v21 + 1;
          v22 = *v10 + ~(_BYTE)v20;
          goto LABEL_23;
        }
      }
      return -65539;
    }
  }
  return result;
}

DNSServiceErrorType DNSServiceQueryRecordWithAttribute(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t ifindex, const char *name, uint16_t rrtype, uint16_t rrclass, const DNSServiceAttribute *attr, DNSServiceQueryRecordReply callback, void *context)
{
  return DNSServiceQueryRecordInternal((uint64_t *)sdRef, flags, ifindex, name, rrtype, rrclass, (uint64_t)attr, (uint64_t)callback, (uint64_t)context);
}

uint64_t put_attribute_tlvs(uint64_t a1, uint64_t a2, unint64_t *a3, unint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  _OWORD *v10;
  unint64_t v11;

  v8 = put_tlv_uint32(3, *(_DWORD *)a1, a3, a4);
  v9 = put_tlv_uint32(4, *(_DWORD *)(a1 + 16), a3, a4) + v8;
  v10 = *(_OWORD **)(a1 + 40);
  if (v10)
  {
    if (a3)
    {
      v11 = *a3;
      if (*a3 && a4 >= v11 && a4 - v11 >= 0x14)
      {
        *(_DWORD *)v11 = 268438016;
        *(_OWORD *)(v11 + 4) = *v10;
        v11 += 20;
      }
      *a3 = v11;
    }
    v9 += 20;
  }
  if (*(_BYTE *)(a1 + 13))
    v9 += put_tlv_uint32(5, *(_DWORD *)(a1 + 8), a3, a4);
  if (*(_BYTE *)(a1 + 12))
    v9 += put_tlv_uint32(11, *(_DWORD *)(a1 + 4), a3, a4);
  if (a2)
    *(_DWORD *)(a2 + 8) |= 2u;
  return v9;
}

uint64_t ___should_return_noauth_error_block_invoke()
{
  uint64_t result;

  result = dyld_program_sdk_at_least();
  _should_return_noauth_error_s_should = result;
  return result;
}

DNSServiceErrorType DNSServiceSendQueuedRequests(DNSServiceRef sdRef)
{
  _QWORD *v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  _QWORD *v8;
  int v9;
  int8x16_t *v10;
  uint64_t v11;
  int8x16_t **v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t v16;
  int v17;
  int *v18;
  char *v19;
  _QWORD *i;
  void *v21;

  if (sdRef)
  {
    v2 = (_QWORD *)*((_QWORD *)sdRef + 10);
    if (!v2)
      goto LABEL_16;
    v3 = 0;
    v4 = 0;
    do
    {
      v5 = v2[7];
      if (v5)
      {
        ++v3;
        v4 += *(unsigned int *)(v5 + 4) + 28;
      }
      v2 = (_QWORD *)*v2;
    }
    while (v2);
    if (v3)
    {
      v6 = (char *)malloc_type_malloc(16 * v3, 0xA172743EuLL);
      if (!v6)
      {
        __break(1u);
        return (int)v6;
      }
      v7 = v6;
      v8 = (_QWORD *)*((_QWORD *)sdRef + 10);
      if (v8)
      {
        v9 = 0;
        do
        {
          v10 = (int8x16_t *)v8[7];
          if (v10)
          {
            v11 = v10->u32[1];
            *v10 = vrev32q_s8(*v10);
            v10[1].i32[2] = bswap32(v10[1].u32[2]);
            v12 = (int8x16_t **)&v6[16 * v9];
            *v12 = v10;
            v12[1] = (int8x16_t *)(v11 + 28);
            ++v9;
          }
          v8 = (_QWORD *)*v8;
        }
        while (v8);
      }
      v13 = writev_NOCANCEL();
      v14 = *((_DWORD *)sdRef + 4);
      if (v13 == v4)
      {
        syslog(6, "DNSServiceSendQueuedRequestsInternal: writev(fd:%d, numMsg:%d, %zu bytes) succeed", v14, v3, v4);
        v15 = 0;
      }
      else
      {
        v16 = v13;
        v17 = *__error();
        v18 = __error();
        v19 = strerror(*v18);
        syslog(4, "DNSServiceSendQueuedRequestsInternal ERROR: writev(fd:%d, written:%zu, total:%zu bytes) failed, errno[%d]:%s", v14, v16, v4, v17, v19);
        v15 = -65537;
      }
      for (i = (_QWORD *)*((_QWORD *)sdRef + 10); i; i = (_QWORD *)*i)
      {
        v21 = (void *)i[7];
        if (v21)
        {
          free(v21);
          i[7] = 0;
        }
      }
      free(v7);
    }
    else
    {
LABEL_16:
      v15 = -65549;
      syslog(6, "DNSServiceSendQueuedRequestsInternal: numMsg is 0");
    }
  }
  else
  {
    syslog(4, "DNSServiceSendQueuedRequestsInternal: !sdr");
    v15 = -65540;
  }
  LODWORD(v6) = v15;
  return (int)v6;
}

DNSServiceAttributeRef DNSServiceAttributeCreate(void)
{
  DNSServiceAttributeRef result;

  result = (DNSServiceAttributeRef)malloc_type_calloc(1uLL, 0x30uLL, 0xF1748037uLL);
  if (!result)
    __break(1u);
  return result;
}

DNSServiceErrorType DNSServiceAttributeSetAAAAPolicy(DNSServiceAttributeRef attr, DNSServiceAAAAPolicy policy)
{
  *(_DWORD *)attr = policy;
  return 0;
}

uint64_t DNSServiceAttrSetFailoverPolicy(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 16) = a2;
  return 0;
}

uint64_t DNSServiceAttrSetValidationPolicy(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 20) = a2;
  return 0;
}

uint64_t DNSServiceGetValidationData(uint64_t a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v3;

  if (a1 && a2)
  {
    v3 = a1 + 104;
    result = *(_QWORD *)(a1 + 104);
    *a2 = *(_QWORD *)(v3 + 8);
  }
  else
  {
    result = 0;
    if (a2)
      *a2 = 0;
  }
  return result;
}

uint64_t DNSServiceAttrSetValidationData(uint64_t a1, const void *a2, size_t size)
{
  uint64_t result;
  void *v7;

  if (size >> 16)
    return 4294901747;
  v7 = *(void **)(a1 + 32);
  if (v7)
  {
    free(v7);
    *(_QWORD *)(a1 + 32) = 0;
  }
  *(_QWORD *)(a1 + 24) = 0;
  if (!a2 || !size)
    goto LABEL_9;
  result = (uint64_t)malloc_type_malloc(size, 0xA172743EuLL);
  if (result)
  {
    *(_QWORD *)(a1 + 32) = result;
    memcpy((void *)result, a2, size);
    *(_QWORD *)(a1 + 24) = size;
LABEL_9:
    result = 0;
    *(_DWORD *)(a1 + 20) = 1;
    return result;
  }
  __break(1u);
  return result;
}

unsigned __int8 *DNSServiceAttributeSetResolverOverride(uint64_t a1, const unsigned __int8 *a2)
{
  void *v4;
  unsigned __int8 *result;

  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    free(v4);
    *(_QWORD *)(a1 + 40) = 0;
  }
  if (!a2)
    return 0;
  result = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x10uLL, 0xF1748037uLL);
  if (result)
  {
    *(_QWORD *)(a1 + 40) = result;
    uuid_copy(result, a2);
    return 0;
  }
  __break(1u);
  return result;
}

uint64_t DNSServiceAttributeSetHostKeyHash(uint64_t a1, int a2)
{
  *(_BYTE *)(a1 + 12) = 1;
  *(_DWORD *)(a1 + 4) = a2;
  return 0;
}

DNSServiceErrorType DNSServiceAttributeSetTimestamp(DNSServiceAttributeRef attr, uint32_t timestamp)
{
  *((_BYTE *)attr + 13) = 1;
  *((_DWORD *)attr + 2) = timestamp;
  return 0;
}

void DNSServiceAttributeDeallocate(DNSServiceAttributeRef attr)
{
  void *v2;
  void *v3;

  v2 = (void *)*((_QWORD *)attr + 4);
  if (v2)
  {
    free(v2);
    *((_QWORD *)attr + 4) = 0;
  }
  v3 = (void *)*((_QWORD *)attr + 5);
  if (v3)
    free(v3);
  free(attr);
}

void CallbackWithError(uint64_t *a1, uint64_t a2)
{
  uint64_t *v4;
  _QWORD *v5;
  int v6;
  _QWORD *v7;
  void (*v8)(uint64_t *, _QWORD, _QWORD, uint64_t, _QWORD);
  void (*v9)(uint64_t *, _QWORD, _QWORD, uint64_t, _QWORD, uint64_t);
  void (*v10)(uint64_t *, _QWORD, uint64_t, _QWORD, _QWORD, _QWORD, uint64_t);
  void (*v11)(uint64_t *, _QWORD, _QWORD, uint64_t, _QWORD, _QWORD, _QWORD, uint64_t);
  void (*v12)(uint64_t *, _QWORD, _QWORD, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t);
  void (*v13)(uint64_t *, _QWORD, _QWORD, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t, uint64_t);
  void (*v14)(uint64_t *, _QWORD, _QWORD, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _DWORD, uint64_t);
  uint64_t v15;
  int v16;

  while (1)
  {
    v4 = (uint64_t *)*a1;
    v16 = 1;
    a1[6] = (uint64_t)&v16;
    switch(*((_DWORD *)a1 + 8))
    {
      case 1:
      case 0x13:
        v5 = (_QWORD *)a1[10];
        v6 = 1;
        do
        {
          if (!v5)
            goto LABEL_23;
          v7 = (_QWORD *)*v5;
          v8 = (void (*)(uint64_t *, _QWORD, _QWORD, uint64_t, _QWORD))v5[2];
          if (v8)
          {
            v8(a1, 0, 0, a2, v5[1]);
            v6 = v16;
          }
          v5 = v7;
        }
        while (v6);
        syslog(4, "dnssd_clientstub:Record: CallbackwithError morebytes zero");
        return;
      case 4:
        v9 = (void (*)(uint64_t *, _QWORD, _QWORD, uint64_t, _QWORD, uint64_t))a1[8];
        if (v9)
          v9(a1, 0, 0, a2, 0, a1[9]);
        break;
      case 5:
        v10 = (void (*)(uint64_t *, _QWORD, uint64_t, _QWORD, _QWORD, _QWORD, uint64_t))a1[8];
        if (v10)
          v10(a1, 0, a2, 0, 0, 0, a1[9]);
        break;
      case 6:
        v11 = (void (*)(uint64_t *, _QWORD, _QWORD, uint64_t, _QWORD, _QWORD, _QWORD, uint64_t))a1[8];
        if (v11)
          goto LABEL_22;
        break;
      case 7:
        v12 = (void (*)(uint64_t *, _QWORD, _QWORD, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t))a1[8];
        if (v12)
          v12(a1, 0, 0, a2, 0, 0, 0, 0, 0, a1[9]);
        break;
      case 8:
        v13 = (void (*)(uint64_t *, _QWORD, _QWORD, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t, uint64_t))a1[8];
        if (v13)
        {
          LODWORD(v15) = 0;
          v13(a1, 0, 0, a2, 0, 0, 0, 0, 0, v15, a1[9]);
        }
        break;
      case 0xE:
        v14 = (void (*)(uint64_t *, _QWORD, _QWORD, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _DWORD, uint64_t))a1[8];
        if (v14)
          v14(a1, 0, 0, a2, 0, 0, 0, 0, 0, a1[9]);
        break;
      case 0xF:
        v11 = (void (*)(uint64_t *, _QWORD, _QWORD, uint64_t, _QWORD, _QWORD, _QWORD, uint64_t))a1[8];
        if (v11)
LABEL_22:
          v11(a1, 0, 0, a2, 0, 0, 0, a1[9]);
        break;
      default:
        syslog(4, "dnssd_clientstub CallbackWithError called with bad op %d", *((_DWORD *)a1 + 8));
        break;
    }
LABEL_23:
    if (!v16)
      break;
    a1[6] = 0;
    a1 = v4;
    if (!v4)
      return;
  }
  syslog(4, "dnssd_clientstub:sdRef: CallbackwithError morebytes zero sdr %p");
}

DNSServiceErrorType DNSServiceGetProperty(const char *property, void *result, uint32_t *size)
{
  DNSServiceErrorType v3;
  int8x16_t *v7;
  size_t v8;
  int all;
  uint32_t v10;
  unint64_t v11;
  int v12;
  uint32_t v14;
  DNSServiceRef sdRef;
  size_t v16;
  void *__dst;

  v3 = -65540;
  if (!property)
    return v3;
  if (!result)
    return v3;
  if (!size)
    return v3;
  __dst = 0;
  sdRef = 0;
  v14 = 0;
  v16 = strlen(property) + 1;
  v3 = ConnectToServer((uint64_t *)&sdRef, 0, 13, 0, 0, 0);
  if (v3)
    return v3;
  v7 = (int8x16_t *)create_hdr(13, &v16, &__dst, 0, (uint64_t)sdRef);
  v8 = strlen(property);
  memcpy(__dst, property, v8 + 1);
  v3 = deliver_request(v7, (uint64_t)sdRef);
  if (v3)
  {
    DNSServiceRefDeallocate(sdRef);
    return v3;
  }
  all = read_all(*((_DWORD *)sdRef + 4), (uint64_t)&v14, 4uLL);
  if (all < 0)
  {
    v12 = all;
    DNSServiceRefDeallocate(sdRef);
LABEL_17:
    if (v12 == -3)
      return -65569;
    else
      return -65563;
  }
  v10 = bswap32(v14);
  v14 = v10;
  if (v10 >= *size)
    v11 = *size;
  else
    v11 = v10;
  v12 = read_all(*((_DWORD *)sdRef + 4), (uint64_t)result, v11);
  DNSServiceRefDeallocate(sdRef);
  if (v12 < 0)
    goto LABEL_17;
  if (!strcmp(property, "DaemonVersion") && *size >= 4)
    *(_DWORD *)result = bswap32(*(_DWORD *)result);
  v3 = 0;
  *size = v14;
  return v3;
}

DNSServiceErrorType DNSServiceResolve(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, const char *name, const char *regtype, const char *domain, DNSServiceResolveReply callBack, void *context)
{
  return DNSServiceResolveInternal((uint64_t *)sdRef, flags, interfaceIndex, name, regtype, domain, 0, (uint64_t)callBack, (uint64_t)context);
}

uint64_t DNSServiceResolveInternal(uint64_t *a1, int a2, int a3, const char *a4, const char *a5, const char *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  size_t v17;
  size_t v18;
  size_t v19;
  uint64_t v20;
  int8x16_t *v21;
  char *v22;
  size_t v23;
  size_t v24;
  char *v25;
  size_t v26;
  char *v27;
  size_t v28;
  uint64_t v29;
  uint64_t v31;
  char *v32;

  v9 = 4294901756;
  if (a1 && a4 && a5 && a6 && a8 && ((a2 & 0x40000) == 0 || (a3 + 4) >= 5))
  {
    v9 = ConnectToServer(a1, a2, 7, (uint64_t)handle_resolve_response, a8, a9);
    if (!(_DWORD)v9)
    {
      v17 = strlen(a4);
      v18 = v17 + strlen(a5);
      v19 = strlen(a6);
      v31 = v18 + v19 + 11;
      if (a7)
      {
        v20 = 8;
        if (*(_QWORD *)(a7 + 24))
          v20 = (unsigned __int16)*(_QWORD *)(a7 + 24) + 12;
        v31 = v20 + v18 + v19 + 11;
      }
      v32 = 0;
      v21 = (int8x16_t *)create_hdr(7, (size_t *)&v31, &v32, *(_QWORD *)(*a1 + 8) != 0, *a1);
      v23 = v31;
      v22 = v32;
      *v32 = HIBYTE(a2);
      v22[1] = BYTE2(a2);
      v22[2] = BYTE1(a2);
      v22[3] = a2;
      v22[4] = HIBYTE(a3);
      v22[5] = BYTE2(a3);
      v22[6] = BYTE1(a3);
      v22[7] = a3;
      v24 = strlen(a4) + 1;
      memcpy(v22 + 8, a4, v24);
      v25 = &v22[v24 + 8];
      v26 = strlen(a5) + 1;
      memcpy(v25, a5, v26);
      v27 = &v25[v26];
      v28 = strlen(a6) + 1;
      memcpy(v27, a6, v28);
      v32 = &v27[v28];
      if (a7)
        put_tlvs_for_validation_attr(a7, (uint64_t)v21, (unint64_t *)&v32, (unint64_t)&v22[v23]);
      v29 = deliver_request(v21, *a1);
      v9 = v29;
      if ((_DWORD)v29)
      {
        if ((_DWORD)v29 != -65555)
          goto LABEL_20;
        if (_should_return_noauth_error_s_once != -1)
          dispatch_once(&_should_return_noauth_error_s_once, &__block_literal_global);
        if (!_should_return_noauth_error_s_should)
        {
          return 0;
        }
        else
        {
LABEL_20:
          DNSServiceRefDeallocate((DNSServiceRef)*a1);
          *a1 = 0;
        }
      }
    }
  }
  return v9;
}

void handle_resolve_response(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v6;
  uint64_t *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  int v12;
  unsigned __int8 *v13;
  uint64_t v14;
  unsigned __int8 *v15;
  int v16;
  int v17;
  BOOL v18;
  _BOOL4 v19;
  unsigned __int16 *v20;
  unsigned __int8 *v21;
  _BYTE v22[1009];
  _BYTE v23[1009];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C874D8];
  if (a3)
  {
    v6 = 0;
    do
    {
      v7 = (uint64_t *)&v23[v6];
      if (a3 + v6 >= a4 || v7 >= &v24)
      {
        *((_BYTE *)v7 - (v7 == &v24)) = 0;
        goto LABEL_34;
      }
      v8 = *(unsigned __int8 *)(a3 + v6);
      v23[v6++] = v8;
    }
    while (v8);
    if (!(a3 + v6))
      goto LABEL_34;
    v9 = 0;
    v10 = a3 + v6;
    do
    {
      v11 = &v22[v9];
      if (v10 + v9 >= a4 || v11 >= v23)
      {
        v11[-(v11 == v23)] = 0;
        goto LABEL_35;
      }
      v12 = *(unsigned __int8 *)(a3 + v9 + v6);
      v22[v9++] = v12;
    }
    while (v12);
    v13 = (unsigned __int8 *)(v10 + v9);
    if (v10 + v9 && (unint64_t)(v13 + 2) <= a4)
    {
      v14 = 0;
      v15 = 0;
      if (v13 != (unsigned __int8 *)-2 && (unint64_t)(v13 + 4) <= a4)
      {
        v14 = bswap32(*((unsigned __int16 *)v13 + 1)) >> 16;
        v15 = v13 + 4;
      }
      v16 = *v13;
      v17 = v13[1];
      v18 = !v15 || (unint64_t)&v15[v14] > a4;
      v19 = v18;
      v20 = v19 ? 0 : (unsigned __int16 *)&v15[v14];
      v21 = v19 ? 0 : v15;
      *(_QWORD *)(a1 + 104) = 0;
      *(_QWORD *)(a1 + 112) = 0;
      if ((*(_BYTE *)(a2 + 8) & 2) != 0)
        *(_QWORD *)(a1 + 104) = get_validation_data_from_tlvs(v20, a4, (_QWORD *)(a1 + 112));
      if (v20)
      {
        (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _BYTE *, _BYTE *, _QWORD, uint64_t, unsigned __int8 *, _QWORD))(a1 + 64))(a1, *(unsigned int *)(a2 + 28), *(unsigned int *)(a2 + 32), *(unsigned int *)(a2 + 36), v23, v22, v16 | (v17 << 8), v14, v21, *(_QWORD *)(a1 + 72));
        return;
      }
    }
  }
  else
  {
    v23[0] = 0;
LABEL_34:
    v22[0] = 0;
  }
LABEL_35:
  syslog(4, "dnssd_clientstub handle_resolve_response: error reading result from daemon");
}

DNSServiceErrorType DNSServiceQueryRecord(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, const char *fullname, uint16_t rrtype, uint16_t rrclass, DNSServiceQueryRecordReply callBack, void *context)
{
  return DNSServiceQueryRecordInternal((uint64_t *)sdRef, flags, interfaceIndex, fullname, rrtype, rrclass, 0, (uint64_t)callBack, (uint64_t)context);
}

DNSServiceErrorType DNSServiceGetAddrInfo(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, DNSServiceProtocol protocol, const char *hostname, DNSServiceGetAddrInfoReply callBack, void *context)
{
  return DNSServiceGetAddrInfoInternal((uint64_t *)sdRef, flags, interfaceIndex, protocol, hostname, 0, (uint64_t)callBack, (uint64_t)context);
}

uint64_t DNSServiceGetAddrInfoInternal(uint64_t *a1, int a2, int a3, int a4, const char *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  int should_save_stacktrace;
  size_t v18;
  uint64_t v19;
  xpc_object_t RetainedResolverDefaults;
  void *v21;
  const void *data;
  uint64_t v23;
  int8x16_t *v24;
  _BYTE *v25;
  size_t v26;
  void *v27;
  size_t v28;
  size_t v29;
  uint64_t v30;
  BOOL v31;
  void *v32;
  size_t v34;
  size_t length;

  v8 = 4294901756;
  if (a1 && a5 && a7)
  {
    if (MEMORY[0x1E0C889B8])
    {
      v8 = 4294901726;
      if (ne_tracker_check_is_hostname_blocked() == 1)
        return v8;
      should_save_stacktrace = ne_tracker_should_save_stacktrace();
    }
    else
    {
      should_save_stacktrace = 0;
    }
    v8 = ConnectToServer(a1, a2, 15, (uint64_t)handle_addrinfo_response, a7, a8);
    if (!(_DWORD)v8)
    {
      v18 = strlen(a5) + 13;
      v34 = v18;
      if (a6)
      {
        v19 = 8;
        if (*(_QWORD *)(a6 + 24))
          v19 = (unsigned __int16)*(_QWORD *)(a6 + 24) + 12;
        v18 += v19;
        v34 = v18;
      }
      RetainedResolverDefaults = DNSServiceGetRetainedResolverDefaults();
      v21 = RetainedResolverDefaults;
      if (RetainedResolverDefaults)
      {
        length = 0;
        data = xpc_dictionary_get_data(RetainedResolverDefaults, "resolver_config_plist_data", &length);
        v23 = (unsigned __int16)length + 9;
        if (!data)
          v23 = 5;
        v18 += v23;
        v34 = v18;
      }
      if (should_save_stacktrace)
        v34 = v18 + 5;
      length = 0;
      v24 = (int8x16_t *)create_hdr(15, &v34, &length, *(_QWORD *)(*a1 + 8) != 0, *a1);
      v25 = (_BYTE *)length;
      v26 = length + v34;
      *(_BYTE *)length = HIBYTE(a2);
      v25[1] = BYTE2(a2);
      v25[2] = BYTE1(a2);
      v25[3] = a2;
      v25[4] = HIBYTE(a3);
      v25[5] = BYTE2(a3);
      v25[6] = BYTE1(a3);
      v25[7] = a3;
      v25[8] = HIBYTE(a4);
      v25[9] = BYTE2(a4);
      v25[10] = BYTE1(a4);
      v27 = v25 + 12;
      v25[11] = a4;
      v28 = strlen(a5) + 1;
      memcpy(v27, a5, v28);
      length = (size_t)v27 + v28;
      if (a6)
        put_tlvs_for_validation_attr(a6, (uint64_t)v24, &length, v26);
      if (v21)
      {
        put_tlvs_for_defaults(v21, (uint64_t)v24, (_BYTE **)&length, v26);
        xpc_release(v21);
      }
      if (should_save_stacktrace)
      {
        v29 = length;
        if (length && v26 >= length && v26 - length >= 5)
        {
          *(_DWORD *)length = 16779264;
          *(_BYTE *)(v29 + 4) = 1;
          v29 += 5;
        }
        length = v29;
        v24->i32[2] |= 2u;
      }
      v30 = deliver_request(v24, *a1);
      v8 = v30;
      if ((_DWORD)v30)
        v31 = 1;
      else
        v31 = MEMORY[0x1E0C889B8] == 0;
      if (v31 || ((should_save_stacktrace ^ 1) & 1) != 0)
      {
        if ((_DWORD)v30)
        {
          if ((_DWORD)v30 != -65555)
            goto LABEL_42;
          if (_should_return_noauth_error_s_once != -1)
            dispatch_once(&_should_return_noauth_error_s_once, &__block_literal_global);
          if (!_should_return_noauth_error_s_should)
          {
            return 0;
          }
          else
          {
LABEL_42:
            DNSServiceRefDeallocate((DNSServiceRef)*a1);
            *a1 = 0;
          }
        }
      }
      else
      {
        v32 = *(void **)(*a1 + 120);
        if (v32)
        {
          free(v32);
          *(_QWORD *)(*a1 + 120) = 0;
        }
        v8 = 0;
        *(_QWORD *)(*a1 + 120) = ne_tracker_copy_current_stacktrace();
      }
    }
  }
  return v8;
}

void handle_browse_response(uint64_t a1, uint64_t a2, unsigned __int8 *a3, unint64_t a4)
{
  uint64_t *v8;
  int v9;
  uint64_t v10;
  _BYTE *v11;
  int v12;
  unsigned __int16 *v13;
  _BYTE *v14;
  int v15;
  _BYTE v16[1009];
  _BYTE v17[1009];
  _BYTE v18[256];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C874D8];
  if (*(_DWORD *)(a2 + 36) != -65570)
    goto LABEL_5;
  if (_should_return_noauth_error_s_once != -1)
    dispatch_once(&_should_return_noauth_error_s_once, &__block_literal_global);
  if (_should_return_noauth_error_s_should)
  {
LABEL_5:
    if (a3)
    {
      v8 = (uint64_t *)v18;
      do
      {
        if ((unint64_t)a3 >= a4 || v8 >= &v19)
        {
          *((_BYTE *)v8 - (v8 == &v19)) = 0;
          goto LABEL_23;
        }
        v9 = *a3++;
        *(_BYTE *)v8 = v9;
        v8 = (uint64_t *)((char *)v8 + 1);
      }
      while (v9);
      if (!a3)
        goto LABEL_23;
      v10 = 0;
      do
      {
        v11 = &v17[v10];
        if ((unint64_t)&a3[v10] >= a4 || v11 >= v18)
        {
          v11[-(v11 == v18)] = 0;
          goto LABEL_24;
        }
        v12 = a3[v10];
        v17[v10++] = v12;
      }
      while (v12);
      v13 = (unsigned __int16 *)&a3[v10];
      if (!v13)
        goto LABEL_24;
      v14 = v16;
      while ((unint64_t)v13 < a4 && v14 < v17)
      {
        v15 = *(unsigned __int8 *)v13;
        v13 = (unsigned __int16 *)((char *)v13 + 1);
        *v14++ = v15;
        if (!v15)
          goto LABEL_25;
      }
      v13 = 0;
      v14[-(v14 == v17)] = 0;
    }
    else
    {
      v18[0] = 0;
LABEL_23:
      v17[0] = 0;
LABEL_24:
      v13 = 0;
      v16[0] = 0;
    }
LABEL_25:
    *(_QWORD *)(a1 + 104) = 0;
    *(_QWORD *)(a1 + 112) = 0;
    if ((*(_BYTE *)(a2 + 8) & 2) != 0)
      *(_QWORD *)(a1 + 104) = get_validation_data_from_tlvs(v13, a4, (_QWORD *)(a1 + 112));
    if (v13)
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _BYTE *, _BYTE *, _BYTE *, _QWORD))(a1 + 64))(a1, *(unsigned int *)(a2 + 28), *(unsigned int *)(a2 + 32), *(unsigned int *)(a2 + 36), v18, v17, v16, *(_QWORD *)(a1 + 72));
    else
      syslog(4, "dnssd_clientstub handle_browse_response: error reading result from daemon");
  }
}

uint64_t DNSServiceSetDefaultDomainForUser(unsigned int a1, char *__s)
{
  uint64_t v4;
  int8x16_t *v5;
  _DWORD *v6;
  size_t v7;
  size_t v9;
  _DWORD *v10;
  DNSServiceRef sdRef;

  if (!__s)
    return 4294901756;
  v10 = 0;
  sdRef = 0;
  v9 = strlen(__s) + 5;
  v4 = ConnectToServer((uint64_t *)&sdRef, 0, 12, 0, 0, 0);
  if (!(_DWORD)v4)
  {
    v5 = (int8x16_t *)create_hdr(12, &v9, &v10, 0, (uint64_t)sdRef);
    v6 = v10;
    *v10 = bswap32(a1);
    v7 = strlen(__s);
    memcpy(v6 + 1, __s, v7 + 1);
    v4 = deliver_request(v5, (uint64_t)sdRef);
    DNSServiceRefDeallocate(sdRef);
  }
  return v4;
}

void handle_regservice_response(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8;
  uint64_t *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  int v14;
  unsigned __int8 *v15;
  _BYTE *v16;
  int v17;
  _BYTE v18[1009];
  _BYTE v19[1009];
  _BYTE v20[256];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C874D8];
  if (*(_DWORD *)(a2 + 36) != -65570)
    goto LABEL_5;
  if (_should_return_noauth_error_s_once != -1)
    dispatch_once(&_should_return_noauth_error_s_once, &__block_literal_global);
  if (_should_return_noauth_error_s_should)
  {
LABEL_5:
    if (a3)
    {
      v8 = 0;
      do
      {
        v9 = (uint64_t *)&v20[v8];
        if (a3 + v8 >= a4 || v9 >= &v21)
        {
          *((_BYTE *)v9 - (v9 == &v21)) = 0;
          goto LABEL_24;
        }
        v10 = *(unsigned __int8 *)(a3 + v8);
        v20[v8++] = v10;
      }
      while (v10);
      if (!(a3 + v8))
        goto LABEL_24;
      v11 = 0;
      v12 = a3 + v8;
      do
      {
        v13 = &v19[v11];
        if (v12 + v11 >= a4 || v13 >= v20)
        {
          v13[-(v13 == v20)] = 0;
          goto LABEL_25;
        }
        v14 = *(unsigned __int8 *)(a3 + v11 + v8);
        v19[v11++] = v14;
      }
      while (v14);
      v15 = (unsigned __int8 *)(v12 + v11);
      if (!(v12 + v11))
        goto LABEL_25;
      v16 = v18;
      do
      {
        if ((unint64_t)v15 >= a4 || v16 >= v19)
        {
          v16[-(v16 == v19)] = 0;
          goto LABEL_26;
        }
        v17 = *v15++;
        *v16++ = v17;
      }
      while (v17);
      if (!v15)
        goto LABEL_26;
      (*(void (**)(uint64_t, _QWORD, _QWORD, _BYTE *, _BYTE *, _BYTE *, _QWORD))(a1 + 64))(a1, *(unsigned int *)(a2 + 28), *(unsigned int *)(a2 + 36), v20, v19, v18, *(_QWORD *)(a1 + 72));
    }
    else
    {
      v20[0] = 0;
LABEL_24:
      v19[0] = 0;
LABEL_25:
      v18[0] = 0;
LABEL_26:
      syslog(4, "dnssd_clientstub handle_regservice_response: error reading result from daemon");
    }
  }
}

DNSServiceErrorType DNSServiceRegisterWithAttribute(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, const char *name, const char *regtype, const char *domain, const char *host, uint16_t portInNetworkByteOrder, uint16_t txtLen, const void *txtRecord, DNSServiceAttributeRef attr, DNSServiceRegisterReply callBack, void *context)
{
  return DNSServiceRegisterInternal((uint64_t *)sdRef, flags, interfaceIndex, name, regtype, domain, host, portInNetworkByteOrder, txtLen, (const char *)txtRecord, (uint64_t)attr, (uint64_t)callBack, (uint64_t)context);
}

DNSServiceErrorType DNSServiceEnumerateDomains(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, DNSServiceDomainEnumReply callBack, void *context)
{
  DNSServiceErrorType v5;
  int8x16_t *v9;
  _BYTE *v10;
  size_t v12;
  _BYTE *v13;

  v5 = -65540;
  if (sdRef)
  {
    if (callBack)
    {
      if (((flags >> 6) & 1) + ((flags >> 7) & 1) == 1)
      {
        v5 = ConnectToServer((uint64_t *)sdRef, flags, 4, (uint64_t)handle_enumeration_response, (uint64_t)callBack, (uint64_t)context);
        if (!v5)
        {
          v12 = 8;
          v13 = 0;
          v9 = (int8x16_t *)create_hdr(4, &v12, &v13, *((_QWORD *)*sdRef + 1) != 0, (uint64_t)*sdRef);
          v10 = v13;
          *v13 = HIBYTE(flags);
          v10[1] = BYTE2(flags);
          v10[2] = BYTE1(flags);
          v10[3] = flags;
          v10[4] = HIBYTE(interfaceIndex);
          v10[5] = BYTE2(interfaceIndex);
          v10[6] = BYTE1(interfaceIndex);
          v10[7] = interfaceIndex;
          v5 = deliver_request(v9, (uint64_t)*sdRef);
          if (v5)
          {
            DNSServiceRefDeallocate(*sdRef);
            *sdRef = 0;
          }
        }
      }
    }
  }
  return v5;
}

void handle_enumeration_response(uint64_t a1, unsigned int *a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
  uint64_t *v5;
  int v6;
  _BYTE v7[1009];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C874D8];
  if (a3)
  {
    v4 = 0;
    do
    {
      v5 = (uint64_t *)&v7[v4];
      if (a3 + v4 >= a4 || v5 >= &v8)
      {
        *((_BYTE *)v5 - (v5 == &v8)) = 0;
        goto LABEL_10;
      }
      v6 = *(unsigned __int8 *)(a3 + v4);
      v7[v4++] = v6;
    }
    while (v6);
    if (!(a3 + v4))
      goto LABEL_10;
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _BYTE *, _QWORD))(a1 + 64))(a1, a2[7], a2[8], a2[9], v7, *(_QWORD *)(a1 + 72));
  }
  else
  {
    v7[0] = 0;
LABEL_10:
    syslog(4, "dnssd_clientstub handle_enumeration_response: error reading result from daemon");
  }
}

uint64_t DNSServiceCreateDelegateConnection(uint64_t *a1, unsigned int a2, const void *a3)
{
  uint64_t v3;
  uint64_t result;
  int8x16_t *v8;
  int v9;
  unsigned int v10;
  int *v11;
  int *v12;
  size_t v13;
  _DWORD *v14;
  unsigned int v15;

  v3 = 4294901741;
  v15 = a2;
  if (!a1)
    return 4294901756;
  result = ConnectToServer(a1, 0, 19, (uint64_t)ConnectionResponse, 0, 0);
  if ((_DWORD)result)
    return result;
  v13 = 4;
  v14 = 0;
  v8 = (int8x16_t *)create_hdr(19, &v13, &v14, 0, *a1);
  if (a2)
  {
    v9 = setsockopt(*(_DWORD *)(*a1 + 16), 0xFFFF, 4359, &v15, 4u);
    v10 = v15;
    if (v9 == -1)
    {
      __error();
      v11 = __error();
      strerror(*v11);
      syslog(4, "dnssd_clientstub DNSServiceCreateDelegateConnection: Could not setsockopt() for PID[%d], no entitlements or process(pid) invalid errno:%d (%s)");
LABEL_13:
      free(v8);
      goto LABEL_14;
    }
    if (v15)
      goto LABEL_8;
  }
  if (setsockopt(*(_DWORD *)(*a1 + 16), 0xFFFF, 4360, a3, 0x10u) == -1)
  {
    __error();
    v12 = __error();
    strerror(*v12);
    syslog(4, "dnssd_clientstub DNSServiceCreateDelegateConnection: Could not setsockopt() for UUID, no entitlements or process(uuid) invalid errno:%d (%s) ");
    goto LABEL_13;
  }
  v10 = v15;
LABEL_8:
  *v14 = bswap32(v10);
  result = deliver_request(v8, *a1);
  v3 = result;
  if ((_DWORD)result)
  {
LABEL_14:
    DNSServiceRefDeallocate((DNSServiceRef)*a1);
    *a1 = 0;
    return v3;
  }
  return result;
}

DNSServiceErrorType DNSServiceRegisterRecord(DNSServiceRef sdRef, DNSRecordRef *RecordRef, DNSServiceFlags flags, uint32_t interfaceIndex, const char *fullname, uint16_t rrtype, uint16_t rrclass, uint16_t rdlen, const void *rdata, uint32_t ttl, DNSServiceRegisterRecordReply callBack, void *context)
{
  return DNSServiceRegisterRecordInternal(sdRef, RecordRef, flags, interfaceIndex, (char *)fullname, rrtype, rrclass, rdlen, rdata, ttl, 0, (uint64_t)callBack, (uint64_t)context);
}

uint64_t DNSServiceRegisterRecordInternal(_DWORD *a1, _QWORD *a2, unsigned int a3, int a4, char *__s, __int16 a6, __int16 a7, unsigned int a8, const void *a9, unsigned int a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v13;
  _DWORD *v14;
  BOOL v18;
  BOOL v19;
  int v21;
  int v26;
  size_t v27;
  int v28;
  int8x16_t *v29;
  _BYTE *v30;
  size_t v31;
  _BYTE *v32;
  _DWORD *v33;
  _QWORD *v34;
  __int32 v35;
  _QWORD *v36;
  _QWORD *v37;
  uint64_t v38;
  size_t v39;
  int8x16_t *v40;
  size_t v41;
  _BYTE *v42;

  v13 = 4294901756;
  if (((a3 >> 4) & 1) + ((a3 >> 5) & 1) + ((a3 >> 11) & 1) != 1)
    return v13;
  v14 = a1;
  v42 = 0;
  if (!a1 || !a2 || !__s || (!a9 ? (v18 = a8 == 0) : (v18 = 1), v18 ? (v19 = a12 == 0) : (v19 = 1), v19))
  {
    syslog(4, "dnssd_clientstub DNSServiceRegisterRecord called with NULL parameter");
    return v13;
  }
  v21 = a1[4];
  if (v21 < 0 || (a1[5] ^ v21) != 0x12345678)
  {
    syslog(4, "dnssd_clientstub DNSServiceRegisterRecord called with invalid DNSServiceRef %p %08X %08X");
    return 4294901755;
  }
  v26 = a1[8];
  if (v26 != 1 && v26 != 19)
  {
    syslog(4, "dnssd_clientstub DNSServiceRegisterRecord called with non-DNSServiceCreateConnection DNSServiceRef %p %d");
    return 4294901755;
  }
  *a2 = 0;
  v27 = strlen(__s) + a8 + 19;
  v41 = v27;
  if (a11)
  {
    if (*(_BYTE *)(a11 + 13))
    {
      if (!*(_BYTE *)(a11 + 12))
        return v13;
    }
    else if (*(_BYTE *)(a11 + 12))
    {
      return v13;
    }
    v41 = put_attribute_tlvs(a11, 0, 0, 0) + v27;
  }
  v28 = v14[6];
  v14[6] = v28 + 1;
  if (v28 == -1)
    ++v14[7];
  v29 = (int8x16_t *)create_hdr(2, &v41, &v42, !(a3 & 1), (uint64_t)v14);
  v30 = v42;
  v39 = v41;
  v40 = v29;
  *v42 = HIBYTE(a3);
  v30[1] = BYTE2(a3);
  v30[2] = BYTE1(a3);
  v30[3] = a3;
  v30[4] = HIBYTE(a4);
  v30[5] = BYTE2(a4);
  v30[6] = BYTE1(a4);
  v30[7] = a4;
  v31 = strlen(__s) + 1;
  memcpy(v30 + 8, __s, v31);
  v32 = &v30[v31 + 8];
  *v32 = HIBYTE(a6);
  v32[1] = a6;
  v32[2] = HIBYTE(a7);
  v32[3] = a7;
  v32[4] = BYTE1(a8);
  v32[5] = a8;
  memcpy(v32 + 6, a9, a8);
  v33 = &v30[v31 + 14 + a8];
  *v33 = bswap32(a10);
  v42 = v33 + 1;
  if (a11)
    put_attribute_tlvs(a11, (uint64_t)v40, (unint64_t *)&v42, (unint64_t)&v30[v39]);
  if ((a3 & 1) != 0)
    v40->i32[2] |= 4u;
  v34 = malloc_type_calloc(1uLL, 0x40uLL, 0xF1748037uLL);
  if (!v34)
  {
    __break(1u);
LABEL_45:
    dispatch_once(&_should_return_noauth_error_s_once, &__block_literal_global);
LABEL_40:
    if (_should_return_noauth_error_s_should)
      return v14;
    else
      return 0;
  }
  v34[1] = a13;
  v34[2] = a12;
  v35 = v14[9];
  v14[9] = v35 + 1;
  *((_DWORD *)v34 + 8) = v35;
  v34[6] = v14;
  *a2 = v34;
  *(_QWORD *)((char *)v34 + 36) = *((_QWORD *)v14 + 3);
  v40[1].i32[2] = v35;
  v36 = v14 + 20;
  do
  {
    v37 = v36;
    v36 = (_QWORD *)*v36;
  }
  while (v36);
  *v37 = v34;
  if ((a3 & 1) != 0)
  {
    v13 = 0;
    v34[7] = v40;
    return v13;
  }
  v38 = deliver_request(v40, (uint64_t)v14);
  LODWORD(v14) = -65555;
  v13 = v38;
  if ((_DWORD)v38 == -65555)
  {
    if (_should_return_noauth_error_s_once == -1)
      goto LABEL_40;
    goto LABEL_45;
  }
  return v13;
}

DNSServiceErrorType DNSServiceRegisterRecordWithAttribute(DNSServiceRef sdRef, DNSRecordRef *recordRef, DNSServiceFlags flags, uint32_t interfaceIndex, const char *fullname, uint16_t rrtype, uint16_t rrclass, uint16_t rdlen, const void *rdata, uint32_t ttl, DNSServiceAttributeRef attr, DNSServiceRegisterRecordReply callBack, void *context)
{
  return DNSServiceRegisterRecordInternal(sdRef, recordRef, flags, interfaceIndex, (char *)fullname, rrtype, rrclass, rdlen, rdata, ttl, (uint64_t)attr, (uint64_t)callBack, (uint64_t)context);
}

DNSServiceErrorType DNSServiceAddRecord(DNSServiceRef sdRef, DNSRecordRef *RecordRef, DNSServiceFlags flags, uint16_t rrtype, uint16_t rdlen, const void *rdata, uint32_t ttl)
{
  unsigned int v10;
  int v14;
  int v15;
  int8x16_t *v16;
  _BYTE *v17;
  _BYTE *v18;
  _DWORD *v19;
  __int32 v20;
  _QWORD *v21;
  _QWORD *v22;
  _BYTE *v24;
  uint64_t v25;

  if (!sdRef || !RecordRef || (v10 = rdlen) != 0 && !rdata)
  {
    syslog(4, "dnssd_clientstub DNSServiceAddRecord called with NULL parameter", *(_QWORD *)&flags, rrtype, rdlen, rdata, *(_QWORD *)&ttl);
    v14 = -65540;
LABEL_15:
    LODWORD(v19) = v14;
    return (int)v19;
  }
  if (*((_DWORD *)sdRef + 8) != 5)
  {
    v14 = -65541;
    syslog(4, "dnssd_clientstub DNSServiceAddRecord called with non-DNSServiceRegister DNSServiceRef %p %d");
    goto LABEL_15;
  }
  v15 = *((_DWORD *)sdRef + 4);
  if (v15 < 0 || (*((_DWORD *)sdRef + 5) ^ v15) != 0x12345678)
  {
    v14 = -65541;
    syslog(4, "dnssd_clientstub DNSServiceAddRecord called with invalid DNSServiceRef %p %08X %08X");
    goto LABEL_15;
  }
  *RecordRef = 0;
  v24 = 0;
  v25 = rdlen + 12;
  v16 = (int8x16_t *)create_hdr(10, (size_t *)&v25, &v24, 1, (uint64_t)sdRef);
  v17 = v24;
  *v24 = HIBYTE(flags);
  v17[1] = BYTE2(flags);
  v17[2] = BYTE1(flags);
  v17[3] = flags;
  v17[4] = HIBYTE(rrtype);
  v17[5] = rrtype;
  v17[6] = BYTE1(v10);
  v18 = v17 + 8;
  v17[7] = v10;
  memcpy(v17 + 8, rdata, v10);
  *(_DWORD *)&v18[v10] = bswap32(ttl);
  v19 = malloc_type_calloc(1uLL, 0x40uLL, 0xF1748037uLL);
  if (v19)
  {
    v20 = *((_DWORD *)sdRef + 9);
    *((_DWORD *)sdRef + 9) = v20 + 1;
    v19[8] = v20;
    *((_QWORD *)v19 + 6) = sdRef;
    *RecordRef = (DNSRecordRef)v19;
    v16[1].i32[2] = v20;
    v21 = (_QWORD *)((char *)sdRef + 80);
    do
    {
      v22 = v21;
      v21 = (_QWORD *)*v21;
    }
    while (v21);
    *v22 = v19;
    LODWORD(v19) = deliver_request(v16, (uint64_t)sdRef);
  }
  else
  {
    __break(1u);
  }
  return (int)v19;
}

DNSServiceErrorType DNSServiceUpdateRecord(DNSServiceRef sdRef, DNSRecordRef recordRef, DNSServiceFlags flags, uint16_t rdlen, const void *rdata, uint32_t ttl)
{
  return DNSServiceUpdateRecordInternal((uint64_t)sdRef, (uint64_t)recordRef, flags, rdlen, rdata, ttl, 0);
}

uint64_t DNSServiceUpdateRecordInternal(uint64_t a1, uint64_t a2, int a3, unsigned int a4, const void *a5, unsigned int a6, uint64_t a7)
{
  uint64_t v14;
  int v16;
  int v17;
  int8x16_t *v18;
  int8x16_t *v19;
  int v20;
  _BYTE *v21;
  size_t v22;
  _BYTE *v23;
  uint64_t v24;

  v23 = 0;
  if (!a1 || a4 && !a5)
  {
    v14 = 4294901756;
    syslog(4, "dnssd_clientstub DNSServiceUpdateRecord called with NULL parameter");
    return v14;
  }
  v16 = *(_DWORD *)(a1 + 16);
  v17 = *(_DWORD *)(a1 + 20);
  if (v16 < 0 || (v17 ^ v16) != 0x12345678)
  {
    syslog(4, "dnssd_clientstub DNSServiceUpdateRecord called with invalid DNSServiceRef %p %08X %08X", (const void *)a1, *(_DWORD *)(a1 + 16), v17);
    return 4294901755;
  }
  v24 = a4 + 10;
  if (a7)
  {
    v14 = 4294901756;
    if (*(_BYTE *)(a7 + 13))
    {
      if (!*(_BYTE *)(a7 + 12))
        return v14;
    }
    else if (*(_BYTE *)(a7 + 12))
    {
      return v14;
    }
    v24 = put_attribute_tlvs(a7, 0, 0, 0) + a4 + 10;
  }
  v18 = (int8x16_t *)create_hdr(11, (size_t *)&v24, &v23, 1, a1);
  v19 = v18;
  if (!*(_QWORD *)(a1 + 8))
  {
    v18[1].i64[0] = 0;
    if (a2)
      goto LABEL_17;
LABEL_19:
    v20 = -1;
    goto LABEL_20;
  }
  if (!a2)
    goto LABEL_19;
LABEL_17:
  v20 = *(_DWORD *)(a2 + 32);
LABEL_20:
  v18[1].i32[2] = v20;
  v21 = v23;
  v22 = v24;
  *v23 = HIBYTE(a3);
  v21[1] = BYTE2(a3);
  v21[2] = BYTE1(a3);
  v21[3] = a3;
  v21[4] = BYTE1(a4);
  v21[5] = a4;
  memcpy(v21 + 6, a5, a4);
  *(_DWORD *)&v21[a4 + 6] = bswap32(a6);
  v23 = &v21[a4 + 10];
  if (a7)
    put_attribute_tlvs(a7, (uint64_t)v19, (unint64_t *)&v23, (unint64_t)&v21[v22]);
  return deliver_request(v19, a1);
}

DNSServiceErrorType DNSServiceRemoveRecord(DNSServiceRef sdRef, DNSRecordRef RecordRef, DNSServiceFlags flags)
{
  int v5;
  DNSRecordRef v7;
  _QWORD *v8;
  BOOL v9;
  int8x16_t *v10;
  DNSServiceErrorType v11;
  DNSServiceErrorType v12;
  void *v13;
  _DWORD *v15;
  size_t v16;

  if (!sdRef)
  {
    syslog(4, "dnssd_clientstub DNSServiceRemoveRecord called with NULL DNSServiceRef", *(_QWORD *)&flags);
    return -65540;
  }
  if (!RecordRef)
  {
    syslog(4, "dnssd_clientstub DNSServiceRemoveRecord called with NULL DNSRecordRef", *(_QWORD *)&flags);
    return -65540;
  }
  if (*((_DWORD *)sdRef + 9))
  {
    v5 = *((_DWORD *)sdRef + 4);
    if (v5 < 0 || (*((_DWORD *)sdRef + 5) ^ v5) != 0x12345678)
    {
      v12 = -65541;
      syslog(4, "dnssd_clientstub DNSServiceRemoveRecord called with invalid DNSServiceRef %p %08X %08X", *(_QWORD *)&flags);
    }
    else
    {
      v7 = (DNSServiceRef)((char *)sdRef + 80);
      do
      {
        v8 = v7;
        v7 = *(DNSRecordRef *)v7;
        if (v7)
          v9 = v7 == RecordRef;
        else
          v9 = 1;
      }
      while (!v9);
      if (v7)
      {
        v15 = 0;
        v16 = 4;
        v10 = (int8x16_t *)create_hdr(3, &v16, &v15, 1, (uint64_t)sdRef);
        if (!*((_QWORD *)sdRef + 1))
          v10[1].i64[0] = 0;
        v10[1].i32[2] = *((_DWORD *)RecordRef + 8);
        *v15 = bswap32(flags);
        v11 = deliver_request(v10, (uint64_t)sdRef);
        if (!v11 || (v12 = v11, v11 == -65541))
        {
          *v8 = *(_QWORD *)RecordRef;
          v13 = (void *)*((_QWORD *)RecordRef + 7);
          if (v13)
            free(v13);
          free(RecordRef);
          return 0;
        }
      }
      else
      {
        v12 = -65541;
        syslog(4, "dnssd_clientstub DNSServiceRemoveRecord called with invalid DNSRecordRef %p %08X %08X", *(_QWORD *)&flags);
      }
    }
  }
  else
  {
    v12 = -65541;
    syslog(4, "dnssd_clientstub DNSServiceRemoveRecord called with bad DNSServiceRef", *(_QWORD *)&flags);
  }
  return v12;
}

DNSServiceErrorType DNSServiceReconfirmRecord(DNSServiceFlags flags, uint32_t interfaceIndex, const char *fullname, uint16_t rrtype, uint16_t rrclass, uint16_t rdlen, const void *rdata)
{
  DNSServiceErrorType v7;
  unsigned int v9;
  int8x16_t *v15;
  _BYTE *v16;
  char *v17;
  size_t v18;
  char *v19;
  DNSServiceRef sdRef;
  size_t v22;
  _BYTE *v23;

  sdRef = 0;
  v7 = -65540;
  if (fullname)
  {
    v9 = rdlen;
    if (!rdlen || rdata)
    {
      v23 = 0;
      v7 = ConnectToServer((uint64_t *)&sdRef, flags, 9, 0, 0, 0);
      if (!v7)
      {
        v22 = strlen(fullname) + v9 + 15;
        v15 = (int8x16_t *)create_hdr(9, &v22, &v23, 0, (uint64_t)sdRef);
        v16 = v23;
        *v23 = HIBYTE(flags);
        v16[1] = BYTE2(flags);
        v16[2] = BYTE1(flags);
        v16[3] = flags;
        v16[4] = HIBYTE(interfaceIndex);
        v16[5] = BYTE2(interfaceIndex);
        v16[6] = BYTE1(interfaceIndex);
        v17 = v16 + 8;
        v16[7] = interfaceIndex;
        v18 = strlen(fullname) + 1;
        memcpy(v17, fullname, v18);
        v19 = &v17[v18];
        *v19 = HIBYTE(rrtype);
        v19[1] = rrtype;
        v19[2] = HIBYTE(rrclass);
        v19[3] = rrclass;
        v19[4] = BYTE1(v9);
        v19[5] = v9;
        memcpy(&v17[v18 + 6], rdata, v9);
        v7 = deliver_request(v15, (uint64_t)sdRef);
        DNSServiceRefDeallocate(sdRef);
      }
    }
  }
  return v7;
}

DNSServiceErrorType PeerConnectionRelease(DNSServiceFlags flags, const char *name, const char *regtype, const char *domain)
{
  DNSServiceErrorType v4;
  size_t v9;
  size_t v10;
  int8x16_t *v11;
  char *v12;
  size_t v13;
  char *v14;
  size_t v15;
  size_t v16;
  DNSServiceRef sdRef;
  size_t v19;
  char *v20;

  v4 = -65540;
  if (name)
  {
    if (regtype)
    {
      if (domain)
      {
        v20 = 0;
        sdRef = 0;
        v4 = ConnectToServer((uint64_t *)&sdRef, flags, 18, 0, 0, 0);
        if (!v4)
        {
          v9 = strlen(name);
          v10 = strlen(regtype);
          v19 = strlen(domain) + v10 + v9 + 7;
          v11 = (int8x16_t *)create_hdr(18, &v19, &v20, 0, (uint64_t)sdRef);
          v12 = v20;
          *(_DWORD *)v20 = bswap32(flags);
          v12 += 4;
          v13 = strlen(name) + 1;
          memcpy(v12, name, v13);
          v14 = &v12[v13];
          v15 = strlen(regtype) + 1;
          memcpy(v14, regtype, v15);
          v16 = strlen(domain);
          memcpy(&v14[v15], domain, v16 + 1);
          v4 = deliver_request(v11, (uint64_t)sdRef);
          DNSServiceRefDeallocate(sdRef);
        }
      }
    }
  }
  return v4;
}

DNSServiceErrorType DNSServiceNATPortMappingCreate(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, DNSServiceProtocol protocol, uint16_t internalPort, uint16_t externalPort, uint32_t ttl, DNSServiceNATPortMappingReply callBack, void *context)
{
  DNSServiceErrorType v16;
  int8x16_t *v17;
  _BYTE *v18;
  size_t v20;
  _BYTE *v21;

  v16 = ConnectToServer((uint64_t *)sdRef, flags, 14, (uint64_t)handle_port_mapping_response, (uint64_t)callBack, (uint64_t)context);
  if (!v16)
  {
    v20 = 20;
    v21 = 0;
    v17 = (int8x16_t *)create_hdr(14, &v20, &v21, *((_QWORD *)*sdRef + 1) != 0, (uint64_t)*sdRef);
    v18 = v21;
    *v21 = HIBYTE(flags);
    v18[1] = BYTE2(flags);
    v18[2] = BYTE1(flags);
    v18[3] = flags;
    v18[4] = HIBYTE(interfaceIndex);
    v18[5] = BYTE2(interfaceIndex);
    v18[6] = BYTE1(interfaceIndex);
    v18[7] = interfaceIndex;
    v18[8] = HIBYTE(protocol);
    v18[9] = BYTE2(protocol);
    v18[10] = BYTE1(protocol);
    v18[11] = protocol;
    *((_WORD *)v18 + 6) = internalPort;
    *((_WORD *)v18 + 7) = externalPort;
    v18[16] = HIBYTE(ttl);
    v18[17] = BYTE2(ttl);
    v18[18] = BYTE1(ttl);
    v18[19] = ttl;
    v16 = deliver_request(v17, (uint64_t)*sdRef);
    if (v16)
    {
      DNSServiceRefDeallocate(*sdRef);
      *sdRef = 0;
    }
  }
  return v16;
}

void handle_port_mapping_response(uint64_t a1, unsigned int *a2, unsigned int *a3, unint64_t a4)
{
  if (!a3 || (unint64_t)a3 + 13 > a4 || a3 == (unsigned int *)-9 || a3 == (unsigned int *)-13)
    syslog(4, "dnssd_clientstub handle_port_mapping_response: error reading result from daemon");
  else
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, unsigned int, _QWORD))(a1 + 64))(a1, a2[7], a2[8], a2[9], *a3, *((unsigned __int8 *)a3 + 4), *(unsigned __int16 *)((char *)a3 + 5), *(unsigned __int16 *)((char *)a3 + 7), bswap32(*(unsigned int *)((char *)a3 + 9)), *(_QWORD *)(a1 + 72));
}

DNSServiceErrorType DNSServiceSleepKeepalive(DNSServiceRef *sdRef, DNSServiceFlags flags, int fd, unsigned int timeout, DNSServiceSleepKeepaliveReply callBack, void *context)
{
  DNSServiceErrorType v11;
  socklen_t v13;
  socklen_t v14;
  sockaddr v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  sockaddr v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C874D8];
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = (sockaddr)0;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = (sockaddr)0;
  v16 = 0u;
  v14 = 128;
  if (getsockname(fd, &v23, &v14) < 0)
  {
    v11 = -65540;
    __error();
    syslog(4, "dnssd_clientstub DNSServiceSleepKeepalive: getsockname %d\n");
  }
  else
  {
    v13 = 128;
    if (getpeername(fd, &v15, &v13) < 0)
    {
      v11 = -65540;
      __error();
      syslog(4, "dnssd_clientstub DNSServiceSleepKeepalive: getpeername %d\n");
    }
    else if (v14 == v13)
    {
      return _DNSServiceSleepKeepalive_sockaddr(sdRef, (uint64_t)&v23, &v15, timeout, (uint64_t)callBack, (uint64_t)context);
    }
    else
    {
      syslog(4, "dnssd_clientstub DNSServiceSleepKeepalive local/remote info not same");
      return -65537;
    }
  }
  return v11;
}

uint64_t _DNSServiceSleepKeepalive_sockaddr(DNSServiceRef *a1, uint64_t a2, _BYTE *a3, int a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  int v11;
  uint8x8_t v12;
  int v13;
  unsigned int v14;
  uint8x16_t v15;
  uint16x8_t v16;
  uint16x8_t v17;
  __int16 v18;
  _QWORD *v20;
  void *v21;
  uint64_t Connection;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char __s[128];
  char __str[10];
  char v28;
  char v29[255];
  char v30[46];
  char v31[46];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C874D8];
  v6 = 4294901756;
  v25 = 0;
  if (a4)
  {
    v11 = *(unsigned __int8 *)(a2 + 1);
    if (v11 == 30)
    {
      if (a3[1] != 30)
        return v6;
      if (!inet_ntop(30, a3 + 8, v30, 0x2Eu))
      {
        __error();
        syslog(4, "dnssd_clientstub DNSServiceSleepKeepalive remote6 info failed %d");
        return 4294901759;
      }
      if (!inet_ntop(30, (const void *)(a2 + 8), v31, 0x2Eu))
      {
        __error();
        syslog(4, "dnssd_clientstub DNSServiceSleepKeepalive local6 info failed %d");
        return 4294901759;
      }
      v15 = *(uint8x16_t *)(a2 + 8);
      v16 = vmovl_high_u8(v15);
      v17 = vmovl_u8(*(uint8x8_t *)v15.i8);
      v13 = vaddvq_s32(vaddq_s32((int32x4_t)vaddl_u16(*(uint16x4_t *)v17.i8, *(uint16x4_t *)v16.i8), (int32x4_t)vaddl_high_u16(v17, v16)))+ *(unsigned __int16 *)(a2 + 2);
      v14 = snprintf(v29, 0xFFuLL, "t=%u H=%s D=%s l=%u r=%u");
    }
    else
    {
      if (v11 != 2 || a3[1] != 2)
        return v6;
      if (!inet_ntop(2, a3 + 4, v30, 0x2Eu))
      {
        __error();
        syslog(4, "dnssd_clientstub DNSServiceSleepKeepalive remote info failed %d");
        return 4294901759;
      }
      if (!inet_ntop(2, (const void *)(a2 + 4), v31, 0x2Eu))
      {
        __error();
        syslog(4, "dnssd_clientstub DNSServiceSleepKeepalive local info failed %d");
        return 4294901759;
      }
      v12.i32[0] = *(_DWORD *)(a2 + 4);
      v13 = vaddvq_s32((int32x4_t)vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(v12))) + *(unsigned __int16 *)(a2 + 2);
      v14 = snprintf(v29, 0xFFuLL, "t=%u h=%s d=%s l=%u r=%u");
    }
    v18 = v14;
    if (v14 >= 0xFF)
    {
      syslog(4, "dnssd_clientstub DNSServiceSleepKeepalive could not fit local/remote info", v23);
      return 4294901759;
    }
    v28 = v14 + 1;
    if (snprintf(__str, 0xAuLL, "%u", v13) >= 0xA)
    {
      syslog(4, "dnssd_clientstub DNSServiceSleepKeepalive could not fit unique", v24);
      return 4294901759;
    }
    if (snprintf(__s, 0x80uLL, "%s.%s", __str, "_keepalive._dns-sd._udp.local") >= 0x80)
    {
      syslog(4, "dnssd_clientstub DNSServiceSleepKeepalive could not fit name");
      return 4294901759;
    }
    v20 = malloc_type_malloc(0x10uLL, 0xA172743EuLL);
    if (!v20)
      __break(1u);
    v21 = v20;
    *v20 = a5;
    v20[1] = a6;
    Connection = DNSServiceCreateConnection(a1);
    if ((_DWORD)Connection)
    {
      v6 = Connection;
    }
    else
    {
      v6 = DNSServiceRegisterRecordInternal(*a1, &v25, 0x20u, 0, __s, 10, 1, (unsigned __int16)(v18 + 2), &v28, 0, 0, (uint64_t)SleepKeepaliveCallback, (uint64_t)v21);
      if (!(_DWORD)v6)
      {
        *((_QWORD *)*a1 + 17) = v21;
        return v6;
      }
    }
    syslog(4, "dnssd_clientstub DNSServiceSleepKeepalive cannot create connection");
    free(v21);
  }
  return v6;
}

void SleepKeepaliveCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (*(_QWORD *)(a1 + 136) != a5)
    syslog(4, "dnssd_clientstub SleepKeepaliveCallback context mismatch");
  if (*(_QWORD *)a5)
    (*(void (**)(uint64_t, uint64_t, _QWORD))a5)(a1, a4, *(_QWORD *)(a5 + 8));
}

uint64_t DNSServiceSleepKeepalive_sockaddr(DNSServiceRef *a1, uint64_t a2, uint64_t a3, _BYTE *a4, int a5, uint64_t a6, uint64_t a7)
{
  return _DNSServiceSleepKeepalive_sockaddr(a1, a3, a4, a5, a6, a7);
}

int __darwin_check_fd_set_overflow(int a1, const void *a2, int a3)
{
  return MEMORY[0x1E0C87D78](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C87D88]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1E0C874A8]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C87668](a1, a2);
}

uint64_t close_NOCANCEL()
{
  return MEMORY[0x1E0C88020]();
}

uint64_t connect_NOCANCEL()
{
  return MEMORY[0x1E0C88030]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C87100](predicate, block);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C87148](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C87150](object);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C871A0](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C871A8](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C871B8](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C871C8](source, handler);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1E0C87388]();
}

uint64_t fcntl_NOCANCEL()
{
  return MEMORY[0x1E0C88098]();
}

void free(void *a1)
{
  MEMORY[0x1E0C88920](a1);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C877A8](a1);
}

int getpeername(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x1E0C88180](*(_QWORD *)&a1, a2, a3);
}

int getsockname(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x1E0C881B0](*(_QWORD *)&a1, a2, a3);
}

int getsockopt(int a1, int a2, int a3, void *a4, socklen_t *a5)
{
  return MEMORY[0x1E0C881B8](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4, a5);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x1E0C877F0](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
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

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C87838](__dst, __src, __len);
}

uint64_t ne_tracker_check_is_hostname_blocked()
{
  return MEMORY[0x1E0C889B8]();
}

uint64_t ne_tracker_copy_current_stacktrace()
{
  return MEMORY[0x1E0C889C0]();
}

uint64_t ne_tracker_create_xcode_issue()
{
  return MEMORY[0x1E0C889C8]();
}

uint64_t ne_tracker_should_save_stacktrace()
{
  return MEMORY[0x1E0C889D0]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C88BD0](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C88BF0](lock);
}

uint64_t recv_NOCANCEL()
{
  return MEMORY[0x1E0C878D8]();
}

uint64_t select_NOCANCEL()
{
  return MEMORY[0x1E0C88670]();
}

uint64_t send_NOCANCEL()
{
  return MEMORY[0x1E0C87910]();
}

uint64_t sendmsg_NOCANCEL()
{
  return MEMORY[0x1E0C886A0]();
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x1E0C886F8](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4, *(_QWORD *)&a5);
}

int shutdown(int a1, int a2)
{
  return MEMORY[0x1E0C88708](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

uint64_t sleep_NOCANCEL()
{
  return MEMORY[0x1E0C87948]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C87950](__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x1E0C88728](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int socketpair(int a1, int a2, int a3, int *a4)
{
  return MEMORY[0x1E0C88730](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C87990](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C879B0](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C879D8](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x1E0C879E0](a1, a2, a3);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1E0C87A00](__s1, __n);
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x1E0C87418](*(_QWORD *)&a1, a2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
  MEMORY[0x1E0C87AF0](dst, src);
}

uint64_t writev_NOCANCEL()
{
  return MEMORY[0x1E0C888F8]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C891A0](keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C891C0](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1E0C891D0](xdict, key, length);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C89208](xdict, key, value);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x1E0C89210](xdict, key, bytes, length);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x1E0C892C0](object);
}

