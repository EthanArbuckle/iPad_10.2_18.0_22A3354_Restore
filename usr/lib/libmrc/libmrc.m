void *_mdns_address_copy_description(uint64_t a1, int a2, int a3)
{
  _QWORD *v6;
  _QWORD *v7;
  int v8;
  int *v9;
  unsigned int v10;
  int v11;
  void *v12;
  int v13;
  int appended;
  const void *v15;
  int CUSymAddr_SNPrintF_sAddr;
  int v17;
  unsigned int v19;
  int v21;
  unsigned int v22;
  char v23[64];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = (_QWORD *)mdns_string_builder_create();
  if (v6)
  {
    v7 = v6;
    if (a2
      && mdns_string_builder_append_formatted(v6, "<%s: %p>: ", *(const char **)(*(_QWORD *)(a1 + 16) + 8), (const void *)a1))
    {
      goto LABEL_46;
    }
    v8 = *(unsigned __int8 *)(a1 + 25);
    if (v8 != 30)
    {
      if (v8 != 2)
      {
        appended = mdns_string_builder_append_formatted(v7, "«UNHANDLED ADDRESS FAMILY: %d»");
        goto LABEL_20;
      }
      v9 = (int *)(a1 + 28);
      if (!a3)
      {
        if (!inet_ntop(2, v9, v23, 0x10u) && (!*__error() || *__error()))
          goto LABEL_46;
        v11 = mdns_string_builder_append_formatted(v7, "%s");
LABEL_24:
        if (v11)
          goto LABEL_46;
        if (*(_WORD *)(a1 + 26))
        {
          appended = mdns_string_builder_append_formatted(v7, ":%d");
          goto LABEL_20;
        }
        goto LABEL_59;
      }
      v10 = bswap32(*v9);
      v21 = *v9;
      v22 = v10;
      if (v10 && v10 != 2130706433)
      {
        if ((_DNSMessagePrintObfuscatedIPAddress((uint64_t)v23, (uint64_t)&v21, 4) & 0x80000000) == 0)
          goto LABEL_14;
      }
      else
      {
        if (_GetCUSymAddr_SNPrintF_sOnce != -1)
          dispatch_once(&_GetCUSymAddr_SNPrintF_sOnce, &__block_literal_global_244);
        if (_GetCUSymAddr_SNPrintF_sAddr
          && (_GetCUSymAddr_SNPrintF_sAddr(v23, 64, "%#.4a", COERCE_DOUBLE(&v22)) & 0x80000000) == 0)
        {
          goto LABEL_14;
        }
      }
      v23[0] = 0;
LABEL_14:
      v11 = mdns_string_builder_append_formatted(v7, "<IPv4:%s>");
      goto LABEL_24;
    }
    v13 = *(unsigned __int16 *)(a1 + 26);
    if (*(_WORD *)(a1 + 26) && mdns_string_builder_append_formatted(v7, "["))
      goto LABEL_46;
    v15 = (const void *)(a1 + 32);
    if (!a3)
    {
      if (!inet_ntop(30, v15, v23, 0x2Eu) && (!*__error() || *__error()))
        goto LABEL_46;
      v17 = mdns_string_builder_append_formatted(v7, "%s");
LABEL_45:
      if (v17)
        goto LABEL_46;
      v19 = *(_DWORD *)(a1 + 48);
      if (v19)
      {
        if (if_indextoname(v19, v23)
           ? mdns_string_builder_append_formatted(v7, "%%%s")
           : mdns_string_builder_append_formatted(v7, "%%%u"))
        {
          goto LABEL_46;
        }
      }
      if (v13)
      {
        appended = mdns_string_builder_append_formatted(v7, "]:%d");
LABEL_20:
        if (!appended)
          goto LABEL_59;
LABEL_46:
        v12 = 0;
LABEL_47:
        os_release(v7);
        return v12;
      }
LABEL_59:
      v12 = mdns_string_builder_copy_string((uint64_t)v7);
      goto LABEL_47;
    }
    if (*(_QWORD *)(a1 + 32) | *(_QWORD *)(a1 + 39) || *(unsigned __int8 *)(a1 + 47) >= 2u)
    {
      CUSymAddr_SNPrintF_sAddr = _DNSMessagePrintObfuscatedIPAddress((uint64_t)v23, (uint64_t)v15, 16);
    }
    else
    {
      if (_GetCUSymAddr_SNPrintF_sOnce != -1)
      {
        dispatch_once(&_GetCUSymAddr_SNPrintF_sOnce, &__block_literal_global_244);
        v15 = (const void *)(a1 + 32);
      }
      if (!_GetCUSymAddr_SNPrintF_sAddr)
        goto LABEL_43;
      CUSymAddr_SNPrintF_sAddr = _GetCUSymAddr_SNPrintF_sAddr(v23, 64, "%.16a", *(double *)&v15);
    }
    if ((CUSymAddr_SNPrintF_sAddr & 0x80000000) == 0)
    {
LABEL_44:
      v17 = mdns_string_builder_append_formatted(v7, "<IPv6:%s>");
      goto LABEL_45;
    }
LABEL_43:
    v23[0] = 0;
    goto LABEL_44;
  }
  return 0;
}

BOOL _mdns_address_equal(uint64_t a1, uint64_t a2)
{
  int v2;

  v2 = *(unsigned __int8 *)(a1 + 25);
  if (v2 != *(unsigned __int8 *)(a2 + 25))
    return 0;
  if (v2 == 30)
    return *(unsigned __int16 *)(a1 + 26) == *(unsigned __int16 *)(a2 + 26)
        && *(_QWORD *)(a1 + 32) == *(_QWORD *)(a2 + 32)
        && *(_QWORD *)(a1 + 40) == *(_QWORD *)(a2 + 40);
  return v2 == 2
      && *(unsigned __int16 *)(a1 + 26) == *(unsigned __int16 *)(a2 + 26)
      && *(_DWORD *)(a1 + 28) == *(_DWORD *)(a2 + 28);
}

uint64_t _mdns_address_new()
{
  uint64_t v0;
  uint64_t v1;
  _UNKNOWN **v2;
  void (*v3)(uint64_t);

  v0 = _os_object_alloc();
  v1 = v0;
  if (v0)
  {
    v2 = &_mdns_address_kind;
    *(_QWORD *)(v0 + 16) = &_mdns_address_kind;
    do
    {
      v3 = (void (*)(uint64_t))v2[2];
      if (v3)
        v3(v1);
      v2 = (_UNKNOWN **)*v2;
    }
    while (v2);
  }
  return v1;
}

void *mdns_cf_callback_retain(int a1, void *object)
{
  os_retain(object);
  return object;
}

void mdns_cf_callback_release(int a1, void *object)
{
  os_release(object);
}

const char *mdns_cf_callback_copy_description(uint64_t a1)
{
  return _mdns_obj_copy_description_as_cfstring(a1);
}

uint64_t mdns_cf_callback_equal(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v4)(uint64_t, uint64_t);

  if (a1 == a2)
    return 1;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 == *(_QWORD *)(a2 + 16) && (v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 32)) != 0)
    return v4(a1, a2);
  else
    return 0;
}

BOOL mdns_cfarray_enumerate(const __CFArray *a1, uint64_t a2)
{
  CFIndex Count;
  CFIndex v5;
  BOOL v6;
  CFIndex i;
  const void *ValueAtIndex;

  Count = CFArrayGetCount(a1);
  if (Count < 1)
  {
    return 1;
  }
  else
  {
    v5 = Count;
    v6 = 0;
    for (i = 0; i != v5; v6 = i >= v5)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a1, i);
      if (((*(uint64_t (**)(uint64_t, const void *))(a2 + 16))(a2, ValueAtIndex) & 1) == 0)
        break;
      ++i;
    }
  }
  return v6;
}

void mdns_cfset_enumerate(const __CFSet *a1, uint64_t a2)
{
  CFIndex Count;
  CFIndex v5;
  void **v6;
  uint64_t v7;
  char v8;
  _BYTE v9[7];
  void *values[2];
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
  __int128 v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  Count = CFSetGetCount(a1);
  if (Count >= 1)
  {
    v5 = Count;
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
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    *(_OWORD *)values = 0u;
    v11 = 0u;
    if ((unint64_t)Count > 0x40)
    {
      v7 = a2;
      v8 = 1;
      memset(v9, 0, sizeof(v9));
      CFSetApplyFunction(a1, (CFSetApplierFunction)_mdns_cf_applier_function, &v7);
    }
    else
    {
      v6 = values;
      CFSetGetValues(a1, (const void **)values);
      do
      {
        if (((*(uint64_t (**)(uint64_t, void *))(a2 + 16))(a2, *v6) & 1) == 0)
          break;
        ++v6;
        --v5;
      }
      while (v5);
    }
  }
}

void _mdns_cf_applier_function(uint64_t a1, _BYTE *a2)
{
  if (a2[8])
    a2[8] = (*(uint64_t (**)(void))(*(_QWORD *)a2 + 16))();
}

uint64_t __mdns_dns_push_service_definition_create_xpc_dictionary_block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  uint64_t (*v4)(uint64_t, _QWORD, _QWORD);
  uint64_t result;
  char *v6;
  xpc_object_t array_set_if_absent;

  v3 = (_QWORD *)(a2 + 16);
  do
  {
    v3 = (_QWORD *)*v3;
    if (!v3)
      return 0;
    v4 = (uint64_t (*)(uint64_t, _QWORD, _QWORD))v3[3];
  }
  while (!v4);
  result = v4(a2, 0, 0);
  if (result)
  {
    v6 = (char *)result;
    array_set_if_absent = _mdns_xpc_dictionary_get_array_set_if_absent(*(void **)(a1 + 32), "addresses");
    xpc_array_set_string(array_set_if_absent, 0xFFFFFFFFFFFFFFFFLL, v6);
    free(v6);
    return 1;
  }
  return result;
}

uint64_t __mdns_dns_push_service_definition_create_xpc_dictionary_block_invoke_2(uint64_t a1, uint64_t a2)
{
  const char *v2;
  xpc_object_t array_set_if_absent;

  v2 = *(const char **)(a2 + 40);
  array_set_if_absent = _mdns_xpc_dictionary_get_array_set_if_absent(*(void **)(a1 + 32), "domains");
  xpc_array_set_string(array_set_if_absent, 0xFFFFFFFFFFFFFFFFLL, v2);
  return 1;
}

uint64_t __mdns_dns_service_definition_create_xpc_dictionary_block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  uint64_t (*v4)(uint64_t, _QWORD, _QWORD);
  uint64_t result;
  char *v6;
  xpc_object_t array_set_if_absent;

  v3 = (_QWORD *)(a2 + 16);
  do
  {
    v3 = (_QWORD *)*v3;
    if (!v3)
      return 0;
    v4 = (uint64_t (*)(uint64_t, _QWORD, _QWORD))v3[3];
  }
  while (!v4);
  result = v4(a2, 0, 0);
  if (result)
  {
    v6 = (char *)result;
    array_set_if_absent = _mdns_xpc_dictionary_get_array_set_if_absent(*(void **)(a1 + 32), "addresses");
    xpc_array_set_string(array_set_if_absent, 0xFFFFFFFFFFFFFFFFLL, v6);
    free(v6);
    return 1;
  }
  return result;
}

uint64_t __mdns_dns_service_definition_create_xpc_dictionary_block_invoke_2(uint64_t a1, uint64_t a2)
{
  const char *v2;
  xpc_object_t array_set_if_absent;

  v2 = *(const char **)(a2 + 40);
  array_set_if_absent = _mdns_xpc_dictionary_get_array_set_if_absent(*(void **)(a1 + 32), "domains");
  xpc_array_set_string(array_set_if_absent, 0xFFFFFFFFFFFFFFFFLL, v2);
  return 1;
}

uint64_t DomainNameFromString(_BYTE *a1, char *a2)
{
  uint64_t v2;
  unint64_t v3;
  _BYTE *v4;
  _BYTE *v5;
  _BYTE *v6;
  unsigned __int8 *v7;
  int v8;
  int v9;
  int v10;
  char *v11;

  *a1 = 0;
  v2 = *a2;
  if (*a2)
  {
    if ((_DWORD)v2 == 46)
    {
      v2 = a2[1];
      if (!a2[1])
        return v2;
      LODWORD(v2) = 46;
    }
    v3 = (unint64_t)(a1 + 255);
    while (2)
    {
      if ((unint64_t)(a1 + 64) >= v3)
        v4 = (_BYTE *)v3;
      else
        v4 = a1 + 64;
      v5 = a1 + 1;
      v6 = a1 + 1;
      v7 = (unsigned __int8 *)a2;
      do
      {
        a2 = (char *)(v7 + 1);
        if ((_DWORD)v2 == 92)
        {
          LODWORD(v2) = *a2;
          if (!*a2)
            return 4294960546;
          a2 = (char *)(v7 + 2);
          if (v2 - 48 <= 9)
          {
            v8 = *a2;
            if ((v8 - 48) <= 9)
            {
              v9 = v7[3];
              if ((v9 - 48) <= 9)
              {
                v10 = 100 * v2 + 10 * (char)v8 + (char)v9;
                v11 = (char *)(v7 + 4);
                if (v10 < 5584)
                {
                  a2 = v11;
                  LOBYTE(v2) = v10 + 48;
                }
              }
            }
          }
        }
        else if ((_DWORD)v2 == 46)
        {
          break;
        }
        if (v6 >= v4)
          return 4294960545;
        *v6++ = v2;
        LODWORD(v2) = *a2;
        v7 = (unsigned __int8 *)a2;
      }
      while (*a2);
      if (v6 == v5)
      {
        return 4294960554;
      }
      else
      {
        *a1 = (_BYTE)v6 - (_BYTE)v5;
        *v6 = 0;
        v2 = *a2;
        a1 = v6;
        if (*a2)
          continue;
      }
      break;
    }
  }
  return v2;
}

uint64_t _DNSMessagePrintObfuscatedIPAddress(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  _BYTE v7[33];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (a3 != 16 && a3 != 4)
    return 4294960553;
  if (_GetCUSymAddr_SNPrintF_sOnce != -1)
    dispatch_once(&_GetCUSymAddr_SNPrintF_sOnce, &__block_literal_global_244);
  if (!_GetCUSymAddr_SNPrintF_sAddr)
    return 4294960561;
  result = _GetCUSymAddr_SNPrintF_sAddr(v7, 33, "%.4H", a2, a3, a3);
  if ((result & 0x80000000) == 0)
  {
    if (_GetCUSymAddr_SNPrintF_sOnce != -1)
      dispatch_once(&_GetCUSymAddr_SNPrintF_sOnce, &__block_literal_global_244);
    if (_GetCUSymAddr_SNPrintF_sAddr)
      return _GetCUSymAddr_SNPrintF_sAddr(a1, 64, "%~s", v7);
    return 4294960561;
  }
  return result;
}

void *_mdns_domain_name_copy_description(_QWORD *a1, int a2, int a3)
{
  _QWORD *v6;
  _QWORD *v7;
  const char *v8;
  int v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v14;
  _BYTE v15[64];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = (_QWORD *)mdns_string_builder_create();
  if (v6)
  {
    v7 = v6;
    if (a2 && mdns_string_builder_append_formatted(v6, "<%s: %p>: ", *(const char **)(a1[2] + 8), a1))
      goto LABEL_20;
    v8 = (const char *)a1[5];
    if (!a3)
    {
LABEL_19:
      if (!mdns_string_builder_append_formatted(v7, "%s", v8))
      {
        v12 = mdns_string_builder_copy_string((uint64_t)v7);
        goto LABEL_22;
      }
LABEL_20:
      v12 = 0;
LABEL_22:
      os_release(v7);
      return v12;
    }
    if (!strcasecmp(v8, "."))
    {
      v10 = _GetCUSymAddr_SNPrintF_sOnce;
    }
    else
    {
      v9 = strcasecmp(v8, "ipv4only.arpa.");
      v10 = _GetCUSymAddr_SNPrintF_sOnce;
      if (v9)
      {
        if (_GetCUSymAddr_SNPrintF_sOnce != -1)
          dispatch_once(&_GetCUSymAddr_SNPrintF_sOnce, &__block_literal_global_244);
        if (_GetCUSymAddr_SNPrintF_sAddr)
        {
          v11 = "%~s";
          goto LABEL_17;
        }
        goto LABEL_24;
      }
    }
    if (v10 != -1)
      dispatch_once(&_GetCUSymAddr_SNPrintF_sOnce, &__block_literal_global_244);
    if (_GetCUSymAddr_SNPrintF_sAddr)
    {
      v11 = "%s";
LABEL_17:
      v14 = v8;
      v8 = v15;
      if ((int)_GetCUSymAddr_SNPrintF_sAddr(v15, 64, v11, v14) < 0)
        v8 = "«REDACTED»";
      goto LABEL_19;
    }
LABEL_24:
    v8 = "«REDACTED»";
    goto LABEL_19;
  }
  return 0;
}

BOOL _mdns_domain_name_equal(uint64_t a1, uint64_t a2)
{
  char v2;
  size_t v3;
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  uint64_t v7;
  unsigned __int8 *v8;
  unsigned __int8 *v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;

  if (a1 == a2)
    return 1;
  v3 = *(_QWORD *)(a1 + 32);
  if (v3 != *(_QWORD *)(a2 + 32))
    return 0;
  if (*(_BYTE *)(a1 + 61) && *(_BYTE *)(a2 + 61))
    return memcmp(*(const void **)(a1 + 24), *(const void **)(a2 + 24), v3) == 0;
  v5 = *(unsigned __int8 **)(a1 + 24);
  v6 = *(unsigned __int8 **)(a2 + 24);
  if (v5 != v6)
  {
    do
    {
      v7 = *v5;
      if (v5 != v6)
      {
        if ((_DWORD)v7 != *v6)
          return 0;
        if (!*v5)
          return 1;
        v8 = v5 + 1;
        v9 = v6 + 1;
        v10 = *v5;
        while (1)
        {
          v12 = *v8++;
          v11 = v12;
          v13 = v12 + 32;
          if (v12 - 65 < 0x1A)
            v11 = v13;
          v15 = *v9++;
          v14 = v15;
          v16 = v15 + 32;
          if (v15 - 65 < 0x1A)
            v14 = v16;
          if (v11 > v14)
            v2 = 1;
          if (v11 < v14)
            v2 = -1;
          if (v11 != v14)
            break;
          if (!--v10)
            goto LABEL_24;
        }
        if (v2)
          return 0;
      }
LABEL_24:
      v5 += v7 + 1;
      v6 += v7 + 1;
    }
    while ((_DWORD)v7);
  }
  return 1;
}

void _mdns_domain_name_finalize(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 24);
  if (v2)
  {
    free(v2);
    *(_QWORD *)(a1 + 24) = 0;
  }
  v3 = *(void **)(a1 + 40);
  if (v3)
  {
    free(v3);
    *(_QWORD *)(a1 + 40) = 0;
  }
}

BOOL _mdns_domain_name_cf_callback_equal(uint64_t a1, uint64_t a2)
{
  return _mdns_domain_name_equal(a1, a2);
}

uint64_t _mdns_domain_name_cf_callback_hash(uint64_t a1)
{
  os_unfair_lock_s *v2;
  int v3;
  uint64_t v4;
  unsigned __int8 *v5;
  unsigned __int8 v6;
  int v7;
  unsigned __int8 v8;

  v2 = (os_unfair_lock_s *)(a1 + 52);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 52));
  if (!*(_BYTE *)(a1 + 60))
  {
    v3 = -2128831035;
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
    {
      v5 = *(unsigned __int8 **)(a1 + 24);
      do
      {
        v7 = *v5++;
        v6 = v7;
        v8 = v7 + 32;
        if ((v7 - 65) < 0x1A)
          v6 = v8;
        v3 = 16777619 * (v6 ^ v3);
        --v4;
      }
      while (v4);
    }
    *(_DWORD *)(a1 + 56) = v3;
    *(_BYTE *)(a1 + 60) = 1;
  }
  os_unfair_lock_unlock(v2);
  return *(unsigned int *)(a1 + 56);
}

_QWORD *_mdns_domain_name_create(_BYTE *a1, int *a2)
{
  _QWORD *v4;
  _QWORD *v5;
  _UNKNOWN **v6;
  uint64_t (*v7)(_QWORD *);
  int v8;
  _BYTE *v9;
  _BYTE *v10;
  int v11;
  size_t v12;
  unsigned __int8 *v13;
  uint64_t i;
  char *v15;
  unsigned __int8 *v16;
  unsigned __int8 *v17;
  unsigned __int8 *v18;
  unsigned __int8 v19;
  char v21;
  char v22;
  _BYTE *v23;
  unsigned int v24;
  int v25;
  _BYTE *v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  unsigned int v30;
  unint64_t v31;
  int v32;
  char __s1[1009];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = (_QWORD *)_os_object_alloc();
  v5 = v4;
  if (!v4)
    goto LABEL_65;
  v6 = &_mdns_domain_name_kind;
  v4[2] = &_mdns_domain_name_kind;
  do
  {
    v7 = (uint64_t (*)(_QWORD *))v6[2];
    if (v7)
      v4 = (_QWORD *)v7(v5);
    v6 = (_UNKNOWN **)*v6;
  }
  while (v6);
  v8 = *a1;
  v9 = a1;
  if (*a1)
  {
    v9 = a1;
    do
    {
      v10 = &v9[v8];
      v11 = v10[1];
      v9 = v10 + 1;
      v8 = v11;
    }
    while (v11);
  }
  v12 = v9 - a1 + 1;
  if (v9 - a1 == -1)
    goto LABEL_64;
  v4 = malloc_type_malloc(v9 - a1 + 1, 0xA172743EuLL);
  if (!v4)
    goto LABEL_64;
  v13 = (unsigned __int8 *)v4;
  memcpy(v4, a1, v12);
  v5[3] = v13;
  v5[4] = v12;
  LODWORD(i) = *v13;
  if (!*v13)
  {
    v15 = __s1;
    goto LABEL_37;
  }
  v15 = __s1;
  v16 = v13;
  do
  {
    if (i > 0x3F || (v17 = &v16[i + 1], v17 - v13 > 255))
    {
      v32 = -6742;
      v4 = v5;
      v5 = 0;
      goto LABEL_57;
    }
    v18 = v16 + 1;
    if (v18 < v17)
    {
      for (i = i; i; --i)
      {
        v19 = *v18;
        if (((char)*v18 - 32) > 0x5E)
        {
          if ((*v18 & 0x80) == 0)
          {
            *v15 = 92;
            if (v19 <= 0x63u)
              v21 = 48;
            else
              v21 = 49;
            v15[1] = v21;
            if (v19 >= 0x64u)
              v22 = v19 / 0xAu - 10;
            else
              v22 = v19 / 0xAu;
            v15[2] = v22 + 48;
            v15[3] = (v19 % 0xAu) | 0x30;
            v15 += 4;
            goto LABEL_32;
          }
        }
        else if (*v18 - 32 <= 0x3C && ((1 << (v19 - 32)) & 0x1000000000004001) != 0)
        {
          *v15++ = 92;
        }
        *v15++ = v19;
LABEL_32:
        ++v18;
      }
    }
    *v15++ = 46;
    LODWORD(i) = *v17;
    v16 = v17;
  }
  while (*v17);
  if (v17 == v13)
LABEL_37:
    *v15++ = 46;
  *v15 = 0;
  v4 = strdup(__s1);
  if (!v4)
  {
LABEL_64:
    __break(1u);
LABEL_65:
    v32 = -6728;
    goto LABEL_57;
  }
  v5[5] = v4;
  *((_DWORD *)v5 + 13) = 0;
  v23 = (_BYTE *)v5[3];
  v24 = *v23;
  if (*v23)
  {
    v25 = 0;
    v26 = (_BYTE *)v5[3];
    while (v24 <= 0x3F)
    {
      v26 += v24 + 1;
      if (v26 - v23 > 255)
        break;
      ++v25;
      v24 = *v26;
      if (!*v26)
        goto LABEL_46;
    }
    v25 = -1;
  }
  else
  {
    v25 = 0;
  }
LABEL_46:
  *((_DWORD *)v5 + 12) = v25;
  v27 = v5[4];
  if (v27)
  {
    if (*v23 - 65 >= 0x1A)
    {
      v29 = 1;
      while (v27 != v29)
      {
        v30 = v23[v29++] - 65;
        if (v30 <= 0x19)
        {
          v31 = v29 - 1;
          goto LABEL_55;
        }
      }
      v31 = v5[4];
LABEL_55:
      v28 = v31 >= v27;
    }
    else
    {
      v28 = 0;
    }
  }
  else
  {
    v28 = 1;
  }
  v4 = 0;
  v32 = 0;
  *((_BYTE *)v5 + 61) = v28;
LABEL_57:
  if (a2)
    *a2 = v32;
  if (v4)
    os_release(v4);
  return v5;
}

_QWORD *___mdns_domain_name_get_root_block_invoke()
{
  _QWORD *result;
  char v1;

  v1 = 0;
  result = _mdns_domain_name_create(&v1, 0);
  *((_DWORD *)result + 2) = 0x7FFFFFFF;
  *((_DWORD *)result + 3) = 0x7FFFFFFF;
  _mdns_domain_name_get_root_s_root = (uint64_t)result;
  return result;
}

size_t mdns_snprintf_add(char **a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  char *v10;
  size_t v11;
  size_t v12;
  size_t v13;

  if (a1)
    v10 = *a1;
  else
    v10 = 0;
  if (a1)
    v11 = a2 - (_QWORD)v10;
  else
    v11 = 0;
  v12 = vsnprintf(v10, v11, a3, &a9);
  v13 = v12;
  if (a1 && v11 && (v12 & 0x80000000) == 0)
  {
    if (v11 <= v12)
      v12 = strlen(v10);
    else
      v12 = v12;
    *a1 = &v10[v12];
  }
  return v13;
}

char *_mdns_obj_copy_description(_QWORD *a1)
{
  char *v2;

  v2 = 0;
  asprintf(&v2, "<%s: %p>", *(const char **)(a1[2] + 8), a1);
  return v2;
}

const char *_mdns_obj_copy_description_as_cfstring(uint64_t a1)
{
  _QWORD *v1;
  uint64_t (*v2)(void);
  const char *result;
  char *v4;

  v1 = (_QWORD *)(a1 + 16);
  do
  {
    v1 = (_QWORD *)*v1;
    if (!v1)
      return 0;
    v2 = (uint64_t (*)(void))v1[3];
  }
  while (!v2);
  result = (const char *)v2();
  if (result)
  {
    v4 = (char *)result;
    result = (const char *)CFStringCreateWithCStringNoCopy(0, result, 0x8000100u, (CFAllocatorRef)*MEMORY[0x24BDBD248]);
    if (!result)
    {
      free(v4);
      return 0;
    }
  }
  return result;
}

void *_mrc_session_copy_description(uint64_t a1, int a2)
{
  _QWORD *v4;
  _QWORD *v5;
  void *v6;

  v4 = (_QWORD *)mdns_string_builder_create();
  if (!v4)
    return 0;
  v5 = v4;
  if (a2
    && mdns_string_builder_append_formatted(v4, "<%s: %p>: ", *(const char **)(*(_QWORD *)(a1 + 16) + 8), (const void *)a1)|| mdns_string_builder_append_formatted(v5, "entity: %s", *(const char **)(a1 + 48)))
  {
    v6 = 0;
  }
  else
  {
    v6 = mdns_string_builder_copy_string((uint64_t)v5);
  }
  os_release(v5);
  return v6;
}

void _mrc_session_finalize(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    os_release(v2);
    *(_QWORD *)(a1 + 40) = 0;
  }
}

void _mrc_client_finalize(uint64_t a1)
{
  NSObject *v2;

  v2 = *(NSObject **)(a1 + 32);
  if (v2)
  {
    dispatch_release(v2);
    *(_QWORD *)(a1 + 32) = 0;
  }
}

char *_mrc_dns_proxy_parameters_copy_description(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char *v8;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v17;
  char __s1[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17 = 0;
  if (_mrc_dns_proxy_parameters_print_description(a1, a2, __s1, 128, &v17, a6, a7, a8))
    return 0;
  if (v17 > 0x7F)
  {
    v11 = v17 + 1;
    if (v17 == -1)
      goto LABEL_9;
    v12 = (char *)malloc_type_malloc(v17 + 1, 0xA172743EuLL);
    if (!v12)
      goto LABEL_9;
    v8 = v12;
    if (_mrc_dns_proxy_parameters_print_description(a1, a2, v12, v11, 0, v13, v14, v15))
    {
LABEL_10:
      free(v8);
      return 0;
    }
  }
  else
  {
    v8 = strdup(__s1);
    if (!v8)
    {
LABEL_9:
      __break(1u);
      goto LABEL_10;
    }
  }
  return v8;
}

void _mrc_dns_proxy_parameters_finalize(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 24);
  if (v2)
  {
    xpc_release(v2);
    *(_QWORD *)(a1 + 24) = 0;
  }
}

uint64_t _mrc_dns_proxy_parameters_print_description(uint64_t a1, int a2, char *a3, uint64_t a4, _QWORD *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  char *v16;

  v16 = a3;
  v10 = (uint64_t)&a3[a4];
  if (a2)
  {
    v11 = mdns_snprintf_add(&v16, v10, "<%s: %p>: ", a4, (uint64_t)a5, a6, a7, a8, *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8));
    if ((v11 & 0x80000000) != 0)
      return 4294960596;
    v12 = v11;
    a3 = v16;
  }
  else
  {
    v12 = 0;
  }
  v14 = 0;
  v15 = 0;
  result = _mrc_xpc_dns_proxy_params_print_description(*(void **)(a1 + 24), a3, v10 - (_QWORD)a3, &v15, (uint64_t)&v14, a6, a7, a8);
  if (!(_DWORD)result)
  {
    result = 0;
    if (a5)
      *a5 = v14 + v12;
  }
  return result;
}

uint64_t _mrc_xpc_dns_proxy_params_print_description(void *a1, char *a2, uint64_t a3, _QWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v12;
  int v13;
  uint64_t v14;
  xpc_object_t optional_array;
  void *v16;
  size_t count;
  size_t v18;
  size_t v19;
  char *v20;
  xpc_object_t value;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int v27;
  xpc_object_t v28;
  char uint64_limited;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  xpc_object_t v37;
  uint64_t v38;
  unint64_t v39;
  const char *data;
  const char *v41;
  unint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unsigned int v49;
  uint64_t result;
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
  const char *v61;
  int v62;
  int v63;
  char v64;
  char *v65;
  _QWORD *v66;
  char *v67;
  size_t length[6];
  _QWORD __dst[3];

  v8 = (_QWORD *)a5;
  __dst[2] = *MEMORY[0x24BDAC8D0];
  v67 = a2;
  v12 = (uint64_t)&a2[a3];
  v13 = mdns_snprintf_add(&v67, (uint64_t)&a2[a3], "input interface indexes: {", (uint64_t)a4, a5, a6, a7, a8, v64);
  if (v13 < 0)
    return 4294960596;
  v66 = v8;
  v14 = v13 & ~(v13 >> 31);
  optional_array = mdns_xpc_dictionary_get_optional_array(a1, "input_interfaces", 0);
  v65 = a2;
  if (optional_array)
  {
    v16 = optional_array;
    count = xpc_array_get_count(optional_array);
    if (count)
    {
      v18 = count;
      v19 = 0;
      do
      {
        v20 = v19 ? ", " : "";
        value = xpc_array_get_value(v16, v19);
        _mdns_xpc_object_get_uint64_limited((uint64_t)value, 0xFFFFFFFFuLL, 0);
        v27 = mdns_snprintf_add(&v67, v12, "%s%u", v22, v23, v24, v25, v26, (char)v20);
        if ((v27 & 0x80000000) != 0)
          return 4294960596;
        v14 += v27;
      }
      while (v18 != ++v19);
    }
  }
  LOBYTE(length[0]) = 0;
  v28 = xpc_dictionary_get_value(a1, "output_interface");
  uint64_limited = _mdns_xpc_object_get_uint64_limited((uint64_t)v28, 0xFFFFFFFFuLL, (BOOL *)length);
  v35 = mdns_snprintf_add(&v67, v12, "}, output interface index: %u", v30, v31, v32, v33, v34, uint64_limited);
  if (v35 < 0)
    return 4294960596;
  v36 = v14 + (v35 & ~(v35 >> 31));
  LOBYTE(__dst[0]) = 0;
  v37 = xpc_dictionary_get_value(a1, "nat64_prefix.bit_len");
  v38 = _mdns_xpc_object_get_uint64_limited((uint64_t)v37, 0xFFFFFFFFFFFFFFFFLL, (BOOL *)__dst);
  if (!LOBYTE(__dst[0]))
    goto LABEL_32;
  v39 = v38;
  if (v38 > 0x80)
    goto LABEL_32;
  if (v38)
  {
    length[0] = 0;
    data = (const char *)xpc_dictionary_get_data(a1, "nat64_prefix.bits", length);
    if (!data || length[0] < (v39 + 7) >> 3)
      goto LABEL_32;
    v41 = data;
  }
  else
  {
    v41 = "";
  }
  __dst[0] = 0;
  __dst[1] = 0;
  if (v39 >= 0x80)
    v42 = 128;
  else
    v42 = v39;
  if (v42 >= 8)
    memcpy(__dst, v41, v42 >> 3);
  if ((v42 & 7) != 0)
    *((_BYTE *)__dst + (v42 >> 3)) = *((_BYTE *)__dst + (v42 >> 3)) & ~(-1 << (8 - (v42 & 7))) | v41[v42 >> 3] & (-1 << (8 - (v42 & 7)));
  v43 = inet_ntop(30, __dst, (char *)length, 0x2Eu);
  if (v43)
  {
    v49 = mdns_snprintf_add(&v67, v12, ", nat64 prefix: %s/%zu", v44, v45, v46, v47, v48, (char)v43);
    goto LABEL_30;
  }
  if (!*__error())
    return 4294960596;
  result = *__error();
  if ((_DWORD)result)
    return result;
  v49 = mdns_snprintf_add(&v67, v12, ", nat64 prefix: %s/%zu", v51, v52, v53, v54, v55, 0);
LABEL_30:
  v8 = v66;
  if ((v49 & 0x80000000) != 0)
    return 4294960596;
  v36 += v49;
LABEL_32:
  if (_mdns_xpc_dictionary_get_object(a1, "force_aaaa_synth", MEMORY[0x24BDACF80]) == (xpc_object_t)MEMORY[0x24BDACF20])
    v61 = "yes";
  else
    v61 = "no";
  v62 = mdns_snprintf_add(&v67, v12, ", forces AAAA synthesis: %s", v56, v57, v58, v59, v60, (char)v61);
  if (v62 < 0)
    return 4294960596;
  v63 = v62;
  if (a4)
    *a4 = v67 - v65;
  result = 0;
  if (v8)
    *v8 = v36 + (v63 & ~(v63 >> 31));
  return result;
}

char *_mrc_dns_proxy_state_inquiry_copy_description(_QWORD *a1)
{
  char *v2;

  v2 = 0;
  asprintf(&v2, "<%s: %p>: ", *(const char **)(a1[2] + 8), a1);
  return v2;
}

void _mrc_dns_proxy_state_inquiry_finalize(uint64_t a1)
{
  NSObject *v2;

  v2 = *(NSObject **)(a1 + 32);
  if (v2)
  {
    dispatch_release(v2);
    *(_QWORD *)(a1 + 32) = 0;
  }
}

void *_mrc_discovery_proxy_parameters_copy_description(uint64_t a1, int a2, char a3)
{
  _QWORD *v6;
  _QWORD *v7;
  int v8;
  int appended;
  int v10;
  void *v11;
  const __CFArray *v13;
  uint64_t v14;
  int v15;
  int v16;
  const __CFSet *v17;
  int v18;
  size_t count;
  int v20;
  _QWORD v21[7];
  char v22;
  _QWORD v23[7];
  char v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  int v32;

  v29 = 0;
  v30 = &v29;
  v31 = 0x2000000000;
  v32 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2000000000;
  v28 = 0;
  v6 = (_QWORD *)mdns_string_builder_create();
  if (!v6)
  {
    v11 = 0;
    goto LABEL_9;
  }
  v7 = v6;
  if (!a2
    || (v8 = mdns_string_builder_append_formatted(v6, "<%s: %p>: ", *(const char **)(*(_QWORD *)(a1 + 16) + 8), (const void *)a1), (*((_DWORD *)v30 + 6) = v8) == 0))
  {
    appended = mdns_string_builder_append_formatted(v7, "interface index: %u, ", *(_DWORD *)(a1 + 48));
    *((_DWORD *)v30 + 6) = appended;
    if (!appended)
    {
      v10 = mdns_string_builder_append_formatted(v7, "server addresses: {");
      *((_DWORD *)v30 + 6) = v10;
      if (!v10)
      {
        v26[3] = 0;
        v13 = *(const __CFArray **)(a1 + 24);
        v14 = MEMORY[0x24BDAC760];
        v23[0] = MEMORY[0x24BDAC760];
        v23[1] = 0x40000000;
        v23[2] = ___mrc_discovery_proxy_parameters_copy_description_block_invoke;
        v23[3] = &unk_24F7EBEC8;
        v23[4] = &v29;
        v23[5] = &v25;
        v23[6] = v7;
        v24 = a3;
        mdns_cfarray_enumerate(v13, (uint64_t)v23);
        v11 = 0;
        if (*((_DWORD *)v30 + 6))
          goto LABEL_7;
        v15 = mdns_string_builder_append_formatted(v7, "}");
        *((_DWORD *)v30 + 6) = v15;
        if (!v15)
        {
          v16 = mdns_string_builder_append_formatted(v7, ", domains: {");
          *((_DWORD *)v30 + 6) = v16;
          if (!v16)
          {
            v26[3] = 0;
            v17 = *(const __CFSet **)(a1 + 32);
            v21[0] = v14;
            v21[1] = 0x40000000;
            v21[2] = ___mrc_discovery_proxy_parameters_copy_description_block_invoke_2;
            v21[3] = &unk_24F7EBEF0;
            v21[4] = &v29;
            v21[5] = &v25;
            v21[6] = v7;
            v22 = a3;
            mdns_cfset_enumerate(v17, (uint64_t)v21);
            v11 = 0;
            if (*((_DWORD *)v30 + 6))
              goto LABEL_7;
            v18 = mdns_string_builder_append_formatted(v7, "}");
            *((_DWORD *)v30 + 6) = v18;
            if (!v18)
            {
              count = xpc_array_get_count(*(xpc_object_t *)(a1 + 40));
              v20 = mdns_string_builder_append_formatted(v7, ", certificate count: %zu", count);
              *((_DWORD *)v30 + 6) = v20;
              if (!v20)
              {
                v11 = mdns_string_builder_copy_string((uint64_t)v7);
                goto LABEL_7;
              }
            }
          }
        }
      }
    }
  }
  v11 = 0;
LABEL_7:
  os_release(v7);
LABEL_9:
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  return v11;
}

void _mrc_discovery_proxy_parameters_finalize(_QWORD *a1)
{
  const void *v2;
  const void *v3;
  void *v4;

  v2 = (const void *)a1[3];
  if (v2)
  {
    CFRelease(v2);
    a1[3] = 0;
  }
  v3 = (const void *)a1[4];
  if (v3)
  {
    CFRelease(v3);
    a1[4] = 0;
  }
  v4 = (void *)a1[5];
  if (v4)
  {
    xpc_release(v4);
    a1[5] = 0;
  }
}

BOOL ___mrc_discovery_proxy_parameters_copy_description_block_invoke(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = mdns_string_builder_append_description_with_prefix(*(_QWORD **)(a1 + 48), *(const char **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)+ 24), a2, *(_BYTE *)(a1 + 56));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = ", ";
  return *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == 0;
}

BOOL ___mrc_discovery_proxy_parameters_copy_description_block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = mdns_string_builder_append_description_with_prefix(*(_QWORD **)(a1 + 48), *(const char **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)+ 24), a2, *(_BYTE *)(a1 + 56));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = ", ";
  return *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == 0;
}

_QWORD *mrc_dns_proxy_create(uint64_t a1, int *a2)
{
  _QWORD *v4;
  _QWORD *v5;
  _UNKNOWN **v6;
  void (*v7)(_QWORD *);
  xpc_object_t v8;
  BOOL v9;
  _QWORD *v10;
  int v11;

  v4 = (_QWORD *)_os_object_alloc();
  if (v4)
  {
    v5 = v4;
    v6 = &_mrc_dns_proxy_kind;
    v4[2] = &_mrc_dns_proxy_kind;
    do
    {
      v7 = (void (*)(_QWORD *))v6[2];
      if (v7)
        v7(v5);
      v6 = (_UNKNOWN **)*v6;
    }
    while (v6);
    v8 = xpc_copy(*(xpc_object_t *)(a1 + 24));
    v5[6] = v8;
    v9 = v8 == 0;
    if (v8)
      v10 = v5;
    else
      v10 = 0;
    if (v8)
      v4 = 0;
    else
      v4 = v5;
    if (v9)
      v11 = -6729;
    else
      v11 = 0;
    if (a2)
      goto LABEL_16;
  }
  else
  {
    v10 = 0;
    v11 = -6728;
    if (a2)
LABEL_16:
      *a2 = v11;
  }
  if (v4)
    os_release(v4);
  return v10;
}

char *_mrc_dns_proxy_copy_description(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char *v8;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v17;
  char __s1[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17 = 0;
  if (_mrc_dns_proxy_print_description(a1, a2, __s1, 128, &v17, a6, a7, a8))
    return 0;
  if (v17 > 0x7F)
  {
    v11 = v17 + 1;
    if (v17 == -1)
      goto LABEL_9;
    v12 = (char *)malloc_type_malloc(v17 + 1, 0xA172743EuLL);
    if (!v12)
      goto LABEL_9;
    v8 = v12;
    if (_mrc_dns_proxy_print_description(a1, a2, v12, v11, 0, v13, v14, v15))
    {
LABEL_10:
      free(v8);
      return 0;
    }
  }
  else
  {
    v8 = strdup(__s1);
    if (!v8)
    {
LABEL_9:
      __break(1u);
      goto LABEL_10;
    }
  }
  return v8;
}

void _mrc_dns_proxy_finalize(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    xpc_release(v2);
    *(_QWORD *)(a1 + 48) = 0;
  }
}

xpc_object_t _mrc_dns_proxy_create_start_message(uint64_t a1, uint64_t a2)
{
  return _mrc_xpc_create_command_message(a2, "dns_proxy.start", *(void **)(a1 + 48));
}

xpc_object_t _mrc_dns_proxy_create_stop_message(uint64_t a1, uint64_t a2)
{
  return _mrc_xpc_create_command_message(a2, "dns_proxy.stop", 0);
}

void _mrc_dns_proxy_handle_start(uint64_t a1)
{
  _mrc_dns_proxy_generate_event_with_error(a1, 1, 0);
}

void _mrc_dns_proxy_handle_interruption(uint64_t a1)
{
  _mrc_dns_proxy_generate_event_with_error(a1, 2, 0);
}

void _mrc_dns_proxy_handle_invalidation(uint64_t a1, int a2)
{
  _mrc_dns_proxy_generate_event_with_error(a1, -1, a2);
}

void _mrc_dns_proxy_generate_event_with_error(uint64_t a1, int a2, int a3)
{
  NSObject *v5;
  uint64_t v6;
  BOOL v7;
  const void *v8;
  _QWORD v9[5];
  int v10;
  int v11;

  v5 = *(NSObject **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 56);
  if (v5)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 0x40000000;
    v9[2] = ___mrc_dns_proxy_generate_event_with_error_block_invoke;
    v9[3] = &unk_24F7EBC88;
    v9[4] = v6;
    v10 = a2;
    v11 = a3;
    dispatch_async(v5, v9);
  }
  if (a2 == -1)
  {
    v8 = *(const void **)(a1 + 56);
    if (v8)
    {
      _Block_release(v8);
      *(_QWORD *)(a1 + 56) = 0;
    }
  }
}

uint64_t ___mrc_dns_proxy_generate_event_with_error_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 44));
}

uint64_t _mrc_dns_proxy_print_description(uint64_t a1, int a2, char *a3, uint64_t a4, _QWORD *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  char *v16;

  v16 = a3;
  v10 = (uint64_t)&a3[a4];
  if (a2)
  {
    v11 = mdns_snprintf_add(&v16, v10, "<%s: %p>: ", a4, (uint64_t)a5, a6, a7, a8, *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8));
    if ((v11 & 0x80000000) != 0)
      return 4294960596;
    v12 = v11;
    a3 = v16;
  }
  else
  {
    v12 = 0;
  }
  v14 = 0;
  v15 = 0;
  result = _mrc_xpc_dns_proxy_params_print_description(*(void **)(a1 + 48), a3, v10 - (_QWORD)a3, &v15, (uint64_t)&v14, a6, a7, a8);
  if (!(_DWORD)result)
  {
    result = 0;
    if (a5)
      *a5 = v14 + v12;
  }
  return result;
}

void _mrc_client_set_queue(uint64_t a1, dispatch_object_t object)
{
  NSObject *v4;

  if (!*(_BYTE *)(a1 + 41))
  {
    if (object)
      dispatch_retain(object);
    v4 = *(NSObject **)(a1 + 32);
    if (v4)
      dispatch_release(v4);
    *(_QWORD *)(a1 + 32) = object;
  }
}

void mrc_dns_proxy_set_event_handler(uint64_t a1, void *aBlock)
{
  void *v3;
  const void *v4;

  if (!*(_BYTE *)(a1 + 41))
  {
    if (aBlock)
      v3 = _Block_copy(aBlock);
    else
      v3 = 0;
    v4 = *(const void **)(a1 + 56);
    if (v4)
      _Block_release(v4);
    *(_QWORD *)(a1 + 56) = v3;
  }
}

void _mrc_client_activate_async(_BYTE *a1)
{
  _QWORD block[5];

  a1[41] = 1;
  os_retain(a1);
  if (_mrc_client_queue_s_once != -1)
    dispatch_once(&_mrc_client_queue_s_once, &__block_literal_global_74);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = ___mrc_client_activate_async_block_invoke;
  block[3] = &__block_descriptor_tmp_25;
  block[4] = a1;
  dispatch_async((dispatch_queue_t)_mrc_client_queue_s_queue, block);
}

void ___mrc_client_activate_async_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _UNKNOWN **v5;
  void (*v6)(_QWORD *);
  _QWORD block[5];

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 40))
  {
    *(_BYTE *)(v2 + 40) = 1;
    v3 = _os_object_alloc();
    if (v3)
    {
      v4 = (_QWORD *)v3;
      v5 = &_mrc_session_kind;
      *(_QWORD *)(v3 + 16) = &_mrc_session_kind;
      do
      {
        v6 = (void (*)(_QWORD *))v5[2];
        if (v6)
          v6(v4);
        v5 = (_UNKNOWN **)*v5;
      }
      while (v5);
      v4[5] = v2;
      os_retain((void *)v2);
      v4[6] = *(_QWORD *)(*(_QWORD *)(v4[5] + 16) + 96);
      *(_QWORD *)(v2 + 24) = v4;
      os_retain(v4);
      if (_mrc_client_queue_s_once != -1)
        dispatch_once(&_mrc_client_queue_s_once, &__block_literal_global_74);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 0x40000000;
      block[2] = ___mrc_session_activate_async_block_invoke;
      block[3] = &__block_descriptor_tmp_26;
      block[4] = v4;
      dispatch_async((dispatch_queue_t)_mrc_client_queue_s_queue, block);
    }
    else
    {
      *(_QWORD *)(v2 + 24) = 0;
      _mrc_client_invalidate_async((void *)v2, -6729);
    }
  }
  os_release(*(void **)(a1 + 32));
}

void ___mrc_session_activate_async_block_invoke(uint64_t a1)
{
  _BYTE *v1;
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v5;

  v1 = *(_BYTE **)(a1 + 32);
  if (!v1[56])
  {
    v3 = &g_session_list;
    do
    {
      v4 = v3;
      v5 = *v3;
      v3 = (uint64_t *)(*v3 + 32);
    }
    while (v5);
    *v4 = (uint64_t)v1;
    os_retain(v1);
    _mrc_session_send_start_message((uint64_t)v1);
    v1 = *(_BYTE **)(a1 + 32);
  }
  os_release(v1);
}

void _mrc_client_invalidate_async(void *a1, int a2)
{
  _QWORD v4[5];
  int v5;

  os_retain(a1);
  if (_mrc_client_queue_s_once != -1)
    dispatch_once(&_mrc_client_queue_s_once, &__block_literal_global_74);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 0x40000000;
  v4[2] = ___mrc_client_invalidate_async_block_invoke;
  v4[3] = &__block_descriptor_tmp_36;
  v4[4] = a1;
  v5 = a2;
  dispatch_async((dispatch_queue_t)_mrc_client_queue_s_queue, v4);
}

void ___mrc_client_invalidate_async_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 40) != 2)
  {
    v3 = *(unsigned int *)(a1 + 40);
    v4 = *(_QWORD *)(v1 + 24);
    if (v4)
    {
      _mrc_session_invalidate_async(v4, 0);
      v5 = *(void **)(v1 + 24);
      if (v5)
      {
        os_release(v5);
        *(_QWORD *)(v1 + 24) = 0;
      }
    }
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 + 16) + 80))(v1, v3);
    *(_BYTE *)(v1 + 40) = 2;
    v1 = *(_QWORD *)(a1 + 32);
  }
  os_release((void *)v1);
}

void _mrc_session_invalidate_async(void *a1, int a2)
{
  _QWORD v4[5];
  int v5;

  os_retain(a1);
  if (_mrc_client_queue_s_once != -1)
    dispatch_once(&_mrc_client_queue_s_once, &__block_literal_global_74);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 0x40000000;
  v4[2] = ___mrc_session_invalidate_async_block_invoke;
  v4[3] = &__block_descriptor_tmp_34;
  v4[4] = a1;
  v5 = a2;
  dispatch_async((dispatch_queue_t)_mrc_client_queue_s_queue, v4);
}

void ___mrc_session_invalidate_async_block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void **v4;
  void **v5;
  void *v6;
  BOOL v7;
  uint64_t (*v8)(void);
  uint64_t v9;
  void *v10;
  _xpc_connection_s *v11;
  _QWORD *v12;
  _xpc_connection_s *v13;
  _QWORD handler[5];

  v2 = *(_QWORD *)(a1 + 32);
  if (*(unsigned __int8 *)(v2 + 56) != 255)
  {
    v3 = *(_DWORD *)(a1 + 40);
    v4 = (void **)&g_session_list;
    do
    {
      v5 = v4;
      v6 = *v4;
      v4 = (void **)((char *)*v4 + 32);
      if (v6)
        v7 = v6 == (void *)v2;
      else
        v7 = 1;
    }
    while (!v7);
    if (v6)
    {
      os_release(v6);
      *v5 = *(void **)(v2 + 32);
      *(_QWORD *)(v2 + 32) = 0;
      if ((*(char *)(v2 + 56) - 1) <= 1)
      {
        v8 = *(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(v2 + 40) + 16) + 56);
        if (v8)
        {
          v9 = v8();
          if (v9)
          {
            v10 = (void *)v9;
            os_retain((void *)v2);
            v11 = (_xpc_connection_s *)_mrc_client_connection();
            if (_mrc_client_queue_s_once != -1)
            {
              v13 = v11;
              dispatch_once(&_mrc_client_queue_s_once, &__block_literal_global_74);
              v11 = v13;
            }
            handler[0] = MEMORY[0x24BDAC760];
            handler[1] = 0x40000000;
            handler[2] = ___mrc_session_send_stop_message_block_invoke;
            handler[3] = &__block_descriptor_tmp_35;
            handler[4] = v2;
            xpc_connection_send_message_with_reply(v11, v10, (dispatch_queue_t)_mrc_client_queue_s_queue, handler);
            xpc_release(v10);
          }
        }
      }
      *(_BYTE *)(v2 + 56) = -1;
      v12 = *(_QWORD **)(v2 + 40);
      if (!v12[3] || (_mrc_client_invalidate_async(v12, v3), (v12 = *(_QWORD **)(v2 + 40)) != 0))
      {
        os_release(v12);
        *(_QWORD *)(v2 + 40) = 0;
      }
    }
  }
  os_release(*(void **)(a1 + 32));
}

uint64_t _mrc_client_connection()
{
  uint64_t result;

  result = _mrc_client_connection_s_connection;
  if (!_mrc_client_connection_s_connection)
  {
    if (_mrc_client_queue_s_once != -1)
      dispatch_once(&_mrc_client_queue_s_once, &__block_literal_global_74);
    _mrc_client_connection_s_connection = (uint64_t)xpc_connection_create_mach_service("com.apple.mDNSResponder.control", (dispatch_queue_t)_mrc_client_queue_s_queue, 2uLL);
    xpc_connection_set_event_handler((xpc_connection_t)_mrc_client_connection_s_connection, &__block_literal_global_328);
    xpc_connection_activate((xpc_connection_t)_mrc_client_connection_s_connection);
    return _mrc_client_connection_s_connection;
  }
  return result;
}

void ___mrc_session_send_stop_message_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  NSObject *v6;
  int int32;
  int v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 32);
  if (MEMORY[0x22E309EDC](a2) == MEMORY[0x24BDACFA0])
  {
    v15 = 0;
    int32 = mdns_xpc_dictionary_get_int32(a2, "error", &v15);
    if (v15)
      v8 = int32;
    else
      v8 = -6712;
    if (_mrc_client_log_s_once != -1)
      dispatch_once(&_mrc_client_log_s_once, &__block_literal_global_31);
    v9 = _mrc_client_log_s_log;
    if (v8)
      v10 = OS_LOG_TYPE_ERROR;
    else
      v10 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled((os_log_t)_mrc_client_log_s_log, v10))
    {
      v11 = *(_QWORD *)(v4 + 24);
      v12 = *(_QWORD *)(v4 + 48);
      *(_DWORD *)buf = 134218498;
      v17 = v11;
      v18 = 2082;
      v19 = v12;
      v20 = 2048;
      v21 = (void *)v8;
      _os_log_impl(&dword_22CF08000, v9, v10, "[S%llu] %{public}s stop reply -- error: %{mdns:err}ld", buf, 0x20u);
    }
  }
  else
  {
    v5 = (void *)MEMORY[0x22E309E40](a2);
    if (_mrc_client_log_s_once != -1)
      dispatch_once(&_mrc_client_log_s_once, &__block_literal_global_31);
    v6 = _mrc_client_log_s_log;
    if (os_log_type_enabled((os_log_t)_mrc_client_log_s_log, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(v4 + 24);
      v14 = *(_QWORD *)(v4 + 48);
      *(_DWORD *)buf = 134218498;
      v17 = v13;
      v18 = 2082;
      v19 = v14;
      v20 = 2082;
      v21 = v5;
      _os_log_error_impl(&dword_22CF08000, v6, OS_LOG_TYPE_ERROR, "[S%llu] Abnormal %{public}s stop reply: %{public}s", buf, 0x20u);
      if (!v5)
        goto LABEL_17;
      goto LABEL_6;
    }
    if (v5)
LABEL_6:
      free(v5);
  }
LABEL_17:
  os_release(*(void **)(a1 + 32));
}

os_log_t ___mrc_client_log_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.mdns", "mrc");
  _mrc_client_log_s_log = (uint64_t)result;
  return result;
}

void ___mrc_client_connection_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t uint64;
  uint64_t v7;
  _QWORD *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t i;
  uint64_t v12;
  void (*v13)(void);
  uint64_t j;
  xpc_object_t dictionary;
  void (*v16)(void);
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  const char *string;
  int v24;
  const char *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = MEMORY[0x22E309EDC](a2);
  if (v3 == MEMORY[0x24BDACFA0])
  {
    uint64 = xpc_dictionary_get_uint64(a2, "id");
    v7 = uint64;
    v8 = (_QWORD *)g_session_list;
    if (g_session_list)
    {
      while (v8[3] != uint64)
      {
        v8 = (_QWORD *)v8[4];
        if (!v8)
          goto LABEL_12;
      }
      dictionary = xpc_dictionary_get_dictionary(a2, "body");
      if (dictionary)
      {
        v16 = *(void (**)(void))(*(_QWORD *)(v8[5] + 16) + 88);
        if (v16)
        {
          v16();
          goto LABEL_20;
        }
        v4 = (void *)MEMORY[0x22E309E40](dictionary);
        if (_mrc_client_log_s_once != -1)
          dispatch_once(&_mrc_client_log_s_once, &__block_literal_global_31);
        v17 = _mrc_client_log_s_log;
        if (!os_log_type_enabled((os_log_t)_mrc_client_log_s_log, OS_LOG_TYPE_FAULT))
          goto LABEL_7;
        v21 = (const char *)v8[3];
        v22 = v8[6];
        v24 = 134218499;
        v25 = v21;
        v26 = 2082;
        v27 = v22;
        v28 = 2081;
        v29 = v4;
        v20 = "[S%llu] Notification for %{public}s was unhandled: %{private}s";
      }
      else
      {
        v4 = (void *)MEMORY[0x22E309E40](a2);
        if (_mrc_client_log_s_once != -1)
          dispatch_once(&_mrc_client_log_s_once, &__block_literal_global_31);
        v17 = _mrc_client_log_s_log;
        if (!os_log_type_enabled((os_log_t)_mrc_client_log_s_log, OS_LOG_TYPE_FAULT))
          goto LABEL_7;
        v18 = (const char *)v8[3];
        v19 = v8[6];
        v24 = 134218499;
        v25 = v18;
        v26 = 2082;
        v27 = v19;
        v28 = 2081;
        v29 = v4;
        v20 = "[S%llu] Notification for %{public}s is missing body: %{private}s";
      }
      _os_log_fault_impl(&dword_22CF08000, v17, OS_LOG_TYPE_FAULT, v20, (uint8_t *)&v24, 0x20u);
LABEL_7:
      if (v4)
        free(v4);
      goto LABEL_20;
    }
LABEL_12:
    if (_mrc_client_log_s_once != -1)
      dispatch_once(&_mrc_client_log_s_once, &__block_literal_global_31);
    v9 = _mrc_client_log_s_log;
    if (os_log_type_enabled((os_log_t)_mrc_client_log_s_log, OS_LOG_TYPE_FAULT))
    {
      v24 = 134217984;
      v25 = (const char *)v7;
      _os_log_fault_impl(&dword_22CF08000, v9, OS_LOG_TYPE_FAULT, "Unrecognized notification ID: %llu", (uint8_t *)&v24, 0xCu);
    }
  }
  else
  {
    if (v3 != MEMORY[0x24BDACFB8])
    {
      v4 = (void *)MEMORY[0x22E309E40](a2);
      if (_mrc_client_log_s_once != -1)
        dispatch_once(&_mrc_client_log_s_once, &__block_literal_global_31);
      v5 = _mrc_client_log_s_log;
      if (os_log_type_enabled((os_log_t)_mrc_client_log_s_log, OS_LOG_TYPE_DEFAULT))
      {
        v24 = 136315138;
        v25 = (const char *)v4;
        _os_log_impl(&dword_22CF08000, v5, OS_LOG_TYPE_DEFAULT, "Unexpected connection event: %s", (uint8_t *)&v24, 0xCu);
      }
      goto LABEL_7;
    }
    if (_mrc_client_log_s_once != -1)
      dispatch_once(&_mrc_client_log_s_once, &__block_literal_global_31);
    v10 = _mrc_client_log_s_log;
    if (os_log_type_enabled((os_log_t)_mrc_client_log_s_log, OS_LOG_TYPE_ERROR))
    {
      string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x24BDACF40]);
      v24 = 136446210;
      v25 = string;
      _os_log_error_impl(&dword_22CF08000, v10, OS_LOG_TYPE_ERROR, "Connection error: %{public}s", (uint8_t *)&v24, 0xCu);
    }
  }
LABEL_20:
  if (a2 == (void *)MEMORY[0x24BDACF30])
  {
    for (i = g_session_list; i; i = *(_QWORD *)(i + 32))
    {
      if ((*(char *)(i + 56) - 1) <= 1)
      {
        if (*(_BYTE *)(i + 56) == 2)
        {
          v12 = *(_QWORD *)(i + 40);
          if (*(_QWORD *)(v12 + 24))
          {
            v13 = *(void (**)(void))(*(_QWORD *)(v12 + 16) + 72);
            if (v13)
              v13();
          }
        }
        _mrc_session_send_start_message(i);
      }
    }
    for (j = g_dns_proxy_state_inquiry_list; j; j = *(_QWORD *)(j + 24))
    {
      if (*(_BYTE *)(j + 56) == 2)
        _mrc_dns_proxy_state_inquiry_send_command(j);
    }
  }
}

void _mrc_session_send_start_message(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _xpc_connection_s *v5;
  _QWORD v6[6];

  *(_BYTE *)(a1 + 56) = 1;
  *(_QWORD *)(a1 + 24) = ++_mrc_client_get_new_command_id_last_command_id;
  v2 = (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) + 48))();
  if (v2)
  {
    v3 = (void *)v2;
    os_retain((void *)a1);
    v4 = *(_QWORD *)(a1 + 24);
    v5 = (_xpc_connection_s *)_mrc_client_connection();
    if (_mrc_client_queue_s_once != -1)
      dispatch_once(&_mrc_client_queue_s_once, &__block_literal_global_74);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 0x40000000;
    v6[2] = ___mrc_session_send_start_message_block_invoke;
    v6[3] = &__block_descriptor_tmp_28;
    v6[4] = a1;
    v6[5] = v4;
    xpc_connection_send_message_with_reply(v5, v3, (dispatch_queue_t)_mrc_client_queue_s_queue, v6);
    xpc_release(v3);
  }
}

void _mrc_dns_proxy_state_inquiry_send_command(uint64_t a1)
{
  uint64_t v2;
  xpc_object_t command_message;
  _xpc_connection_s *v4;
  _QWORD v5[6];

  if (*(unsigned __int8 *)(a1 + 56) - 3 >= 0xFFFFFFFE)
  {
    *(_BYTE *)(a1 + 56) = 2;
    v2 = ++_mrc_client_get_new_command_id_last_command_id;
    *(_QWORD *)(a1 + 48) = _mrc_client_get_new_command_id_last_command_id;
    command_message = _mrc_xpc_create_command_message(v2, "dns_proxy.get_state", 0);
    os_retain((void *)a1);
    v4 = (_xpc_connection_s *)_mrc_client_connection();
    if (_mrc_client_queue_s_once != -1)
      dispatch_once(&_mrc_client_queue_s_once, &__block_literal_global_74);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 0x40000000;
    v5[2] = ___mrc_dns_proxy_state_inquiry_send_command_block_invoke;
    v5[3] = &__block_descriptor_tmp_37;
    v5[4] = a1;
    v5[5] = v2;
    xpc_connection_send_message_with_reply(v4, command_message, (dispatch_queue_t)_mrc_client_queue_s_queue, v5);
    if (command_message)
      xpc_release(command_message);
  }
}

void ___mrc_dns_proxy_state_inquiry_send_command_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  void *v9;
  int int32;
  int v11;
  xpc_object_t v12;
  xpc_object_t object;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v3 + 48) != *(_QWORD *)(a1 + 40) || *(_BYTE *)(v3 + 56) != 2)
    goto LABEL_36;
  if (MEMORY[0x22E309EDC](a2) == MEMORY[0x24BDACFA0])
  {
    v18 = 0;
    int32 = mdns_xpc_dictionary_get_int32(a2, "error", &v18);
    if (v18)
      v11 = int32;
    else
      v11 = -6712;
    if (v11)
    {
      v12 = 0;
    }
    else
    {
      object = _mdns_xpc_dictionary_get_object(a2, "result", MEMORY[0x24BDACFA0]);
      if (object)
        v12 = _mdns_xpc_dictionary_get_object(object, "description", MEMORY[0x24BDACFF0]);
      else
        v12 = 0;
      if (v12)
        v11 = 0;
      else
        v11 = -6712;
    }
    if (_mrc_client_log_s_once != -1)
      dispatch_once(&_mrc_client_log_s_once, &__block_literal_global_31);
    v14 = _mrc_client_log_s_log;
    if (v11)
      v15 = OS_LOG_TYPE_ERROR;
    else
      v15 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled((os_log_t)_mrc_client_log_s_log, v15))
    {
      v16 = *(_QWORD *)(v3 + 48);
      *(_DWORD *)buf = 134218240;
      v20 = v16;
      v21 = 2048;
      v22 = (void *)v11;
      _os_log_impl(&dword_22CF08000, v14, v15, "[DP%llu] DNS proxy state reply -- error: %{mdns:err}ld", buf, 0x16u);
    }
    v8 = v3;
    if (v11)
    {
      v9 = 0;
      v7 = v11;
    }
    else
    {
      v9 = v12;
      v7 = 0;
    }
    goto LABEL_35;
  }
  v5 = (void *)MEMORY[0x22E309E40](a2);
  if (_mrc_client_log_s_once != -1)
    dispatch_once(&_mrc_client_log_s_once, &__block_literal_global_31);
  v6 = _mrc_client_log_s_log;
  if (!os_log_type_enabled((os_log_t)_mrc_client_log_s_log, OS_LOG_TYPE_ERROR))
  {
    if (!v5)
      goto LABEL_9;
    goto LABEL_8;
  }
  v17 = *(_QWORD *)(v3 + 48);
  *(_DWORD *)buf = 134218242;
  v20 = v17;
  v21 = 2082;
  v22 = v5;
  _os_log_error_impl(&dword_22CF08000, v6, OS_LOG_TYPE_ERROR, "[DP%llu] Abnormal DNS proxy state reply: %{public}s", buf, 0x16u);
  if (v5)
LABEL_8:
    free(v5);
LABEL_9:
  if (a2 != (void *)MEMORY[0x24BDACF30])
  {
    if (a2 == (void *)MEMORY[0x24BDACF38])
      v7 = -6753;
    else
      v7 = -6712;
    v8 = v3;
    v9 = 0;
LABEL_35:
    _mrc_dns_proxy_state_inquiry_terminate_imp(v8, v9, v7);
  }
LABEL_36:
  os_release(*(void **)(a1 + 32));
}

void _mrc_dns_proxy_state_inquiry_terminate_imp(uint64_t a1, xpc_object_t object, int a3)
{
  void **v6;
  void **v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  uint64_t v11;
  const void *v12;
  _QWORD block[6];
  int v14;

  if (*(_BYTE *)(a1 + 56) != 3)
  {
    v6 = (void **)&g_dns_proxy_state_inquiry_list;
    do
    {
      v7 = v6;
      v8 = *v6;
      v6 = (void **)((char *)*v6 + 24);
      if (v8)
        v9 = v8 == (void *)a1;
      else
        v9 = 1;
    }
    while (!v9);
    if (v8)
    {
      os_release(v8);
      *v7 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = 0;
    }
    *(_BYTE *)(a1 + 56) = 3;
    v10 = *(NSObject **)(a1 + 32);
    if (v10)
    {
      v11 = *(_QWORD *)(a1 + 40);
      if (v11)
      {
        *(_QWORD *)(a1 + 40) = 0;
        if (object)
        {
          xpc_retain(object);
          v10 = *(NSObject **)(a1 + 32);
        }
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 0x40000000;
        block[2] = ___mrc_dns_proxy_state_inquiry_terminate_imp_block_invoke;
        block[3] = &unk_24F7EBE10;
        block[4] = v11;
        block[5] = object;
        v14 = a3;
        dispatch_async(v10, block);
      }
    }
    v12 = *(const void **)(a1 + 40);
    if (v12)
    {
      _Block_release(v12);
      *(_QWORD *)(a1 + 40) = 0;
    }
  }
}

void ___mrc_dns_proxy_state_inquiry_terminate_imp_block_invoke(uint64_t a1)
{
  void *v2;
  const void *v3;
  void *v4;

  v2 = *(void **)(a1 + 40);
  if (v2)
    xpc_string_get_string_ptr(v2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v3 = *(const void **)(a1 + 32);
  if (v3)
    _Block_release(v3);
  v4 = *(void **)(a1 + 40);
  if (v4)
    xpc_release(v4);
}

void ___mrc_session_send_start_message_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  int int32;
  int v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  xpc_object_t object;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v3 + 56) != 1 || *(_QWORD *)(v3 + 24) != *(_QWORD *)(a1 + 40))
    goto LABEL_31;
  if (MEMORY[0x22E309EDC](a2) == MEMORY[0x24BDACFA0])
  {
    v19 = 0;
    int32 = mdns_xpc_dictionary_get_int32(a2, "error", &v19);
    if (v19)
      v10 = int32;
    else
      v10 = -6712;
    if (_mrc_client_log_s_once != -1)
      dispatch_once(&_mrc_client_log_s_once, &__block_literal_global_31);
    v11 = _mrc_client_log_s_log;
    if (v10)
      v12 = OS_LOG_TYPE_ERROR;
    else
      v12 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled((os_log_t)_mrc_client_log_s_log, v12))
    {
      v13 = *(_QWORD *)(v3 + 24);
      v14 = *(_QWORD *)(v3 + 48);
      *(_DWORD *)buf = 134218498;
      v21 = v13;
      v22 = 2082;
      v23 = v14;
      v24 = 2048;
      v25 = (void *)v10;
      _os_log_impl(&dword_22CF08000, v11, v12, "[S%llu] %{public}s start reply -- error: %{mdns:err}ld", buf, 0x20u);
    }
    if (v10)
    {
      *(_BYTE *)(v3 + 56) = 3;
      v8 = (void *)v3;
      v7 = v10;
    }
    else
    {
      v15 = *(_QWORD *)(v3 + 40);
      object = _mdns_xpc_dictionary_get_object(a2, "result", MEMORY[0x24BDACFA0]);
      if (*(_QWORD *)(v15 + 24))
        (*(void (**)(uint64_t, xpc_object_t))(*(_QWORD *)(v15 + 16) + 64))(v15, object);
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v3 + 40) + 16) + 104))
      {
        *(_BYTE *)(v3 + 56) = 2;
        goto LABEL_31;
      }
      *(_BYTE *)(v3 + 56) = 3;
      v8 = (void *)v3;
      v7 = 0;
    }
    goto LABEL_30;
  }
  v5 = (void *)MEMORY[0x22E309E40](a2);
  if (_mrc_client_log_s_once != -1)
    dispatch_once(&_mrc_client_log_s_once, &__block_literal_global_31);
  v6 = _mrc_client_log_s_log;
  if (!os_log_type_enabled((os_log_t)_mrc_client_log_s_log, OS_LOG_TYPE_ERROR))
  {
    if (!v5)
      goto LABEL_9;
    goto LABEL_8;
  }
  v17 = *(_QWORD *)(v3 + 24);
  v18 = *(_QWORD *)(v3 + 48);
  *(_DWORD *)buf = 134218498;
  v21 = v17;
  v22 = 2082;
  v23 = v18;
  v24 = 2082;
  v25 = v5;
  _os_log_error_impl(&dword_22CF08000, v6, OS_LOG_TYPE_ERROR, "[S%llu] Abnormal %{public}s start reply: %{public}s", buf, 0x20u);
  if (v5)
LABEL_8:
    free(v5);
LABEL_9:
  if (a2 != (void *)MEMORY[0x24BDACF30])
  {
    if (a2 == (void *)MEMORY[0x24BDACF38])
      v7 = -6753;
    else
      v7 = -6712;
    *(_BYTE *)(v3 + 56) = 3;
    v8 = (void *)v3;
LABEL_30:
    _mrc_session_invalidate_async(v8, v7);
  }
LABEL_31:
  os_release(*(void **)(a1 + 32));
}

dispatch_queue_t ___mrc_client_queue_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("com.apple.mdns.mrc", 0);
  _mrc_client_queue_s_queue = (uint64_t)result;
  return result;
}

void mrc_dns_proxy_invalidate(void *a1)
{
  _mrc_client_invalidate_async(a1, 0);
}

_QWORD *mrc_dns_proxy_parameters_create(int *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  _UNKNOWN **v4;
  void (*v5)(_QWORD *);
  xpc_object_t v6;
  BOOL v7;
  _QWORD *v8;
  int v9;

  v2 = (_QWORD *)_os_object_alloc();
  if (v2)
  {
    v3 = v2;
    v4 = &_mrc_dns_proxy_parameters_kind;
    v2[2] = &_mrc_dns_proxy_parameters_kind;
    do
    {
      v5 = (void (*)(_QWORD *))v4[2];
      if (v5)
        v5(v3);
      v4 = (_UNKNOWN **)*v4;
    }
    while (v4);
    v6 = xpc_dictionary_create(0, 0, 0);
    v3[3] = v6;
    v7 = v6 == 0;
    if (v6)
      v8 = v3;
    else
      v8 = 0;
    if (v6)
      v2 = 0;
    else
      v2 = v3;
    if (v7)
      v9 = -6729;
    else
      v9 = 0;
    if (a1)
      goto LABEL_16;
  }
  else
  {
    v8 = 0;
    v9 = -6728;
    if (a1)
LABEL_16:
      *a1 = v9;
  }
  if (v2)
    os_release(v2);
  return v8;
}

void mrc_dns_proxy_parameters_add_input_interface(uint64_t a1, unsigned int a2)
{
  void *v3;
  xpc_object_t optional_array;
  xpc_object_t v5;
  size_t count;
  size_t v7;
  size_t v8;
  xpc_object_t value;
  int uint64_limited;
  BOOL v11;
  char v12;
  BOOL v13;

  v3 = *(void **)(a1 + 24);
  optional_array = mdns_xpc_dictionary_get_optional_array(v3, "input_interfaces", 0);
  if (!optional_array)
  {
    v5 = xpc_array_create(0, 0);
    xpc_dictionary_set_value(v3, "input_interfaces", v5);
    if (v5)
      xpc_release(v5);
    goto LABEL_17;
  }
  v5 = optional_array;
  count = xpc_array_get_count(optional_array);
  if (!count)
    goto LABEL_17;
  v7 = 0;
  v8 = count - 1;
  do
  {
    v13 = 0;
    value = xpc_array_get_value(v5, v7);
    uint64_limited = _mdns_xpc_object_get_uint64_limited((uint64_t)value, 0xFFFFFFFFuLL, &v13);
    v11 = v13 && uint64_limited == a2;
    v12 = v11;
    if (v11)
      break;
    v11 = v8 == v7++;
  }
  while (!v11);
  if ((v12 & 1) == 0)
LABEL_17:
    xpc_array_set_uint64(v5, 0xFFFFFFFFFFFFFFFFLL, a2);
}

void mrc_dns_proxy_parameters_set_output_interface(uint64_t a1, uint64_t value)
{
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 24), "output_interface", value);
}

void mrc_dns_proxy_parameters_set_nat64_prefix(uint64_t a1, void *__src, unint64_t a3)
{
  void *v4;
  uint64_t v5;
  _QWORD __dst[3];

  __dst[2] = *MEMORY[0x24BDAC8D0];
  v4 = *(void **)(a1 + 24);
  __dst[0] = 0;
  __dst[1] = 0;
  if (a3 >= 0x80)
    v5 = 128;
  else
    v5 = a3;
  if (v5 >= 8)
    memcpy(__dst, __src, v5 >> 3);
  if ((v5 & 7) != 0)
    *((_BYTE *)__dst + (v5 >> 3)) = *((_BYTE *)__dst + (v5 >> 3)) & ~(-1 << (8 - (v5 & 7))) | *((_BYTE *)__src
                                                                                              + (v5 >> 3)) & (-1 << (8 - (v5 & 7)));
  xpc_dictionary_set_data(v4, "nat64_prefix.bits", __dst, (v5 + 7) >> 3);
  xpc_dictionary_set_uint64(v4, "nat64_prefix.bit_len", v5);
}

void mrc_dns_proxy_parameters_set_force_aaaa_synthesis(uint64_t a1, BOOL value)
{
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 24), "force_aaaa_synth", value);
}

BOOL mrc_dns_proxy_parameters_enumerate_input_interfaces(uint64_t a1, uint64_t a2)
{
  xpc_object_t optional_array;
  void *v4;
  size_t count;
  size_t v6;
  BOOL v7;
  size_t i;
  xpc_object_t value;
  uint64_t uint64_limited;

  optional_array = mdns_xpc_dictionary_get_optional_array(*(void **)(a1 + 24), "input_interfaces", 0);
  if (optional_array && (v4 = optional_array, (count = xpc_array_get_count(optional_array)) != 0))
  {
    v6 = count;
    v7 = 0;
    for (i = 0; i != v6; v7 = i >= v6)
    {
      value = xpc_array_get_value(v4, i);
      uint64_limited = _mdns_xpc_object_get_uint64_limited((uint64_t)value, 0xFFFFFFFFuLL, 0);
      if (((*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, uint64_limited) & 1) == 0)
        break;
      ++i;
    }
  }
  else
  {
    return 1;
  }
  return v7;
}

uint64_t mrc_dns_proxy_parameters_get_output_interface(uint64_t a1)
{
  void *v1;
  xpc_object_t value;
  BOOL v4;

  v1 = *(void **)(a1 + 24);
  v4 = 0;
  value = xpc_dictionary_get_value(v1, "output_interface");
  return _mdns_xpc_object_get_uint64_limited((uint64_t)value, 0xFFFFFFFFuLL, &v4);
}

BOOL mrc_dns_proxy_parameters_get_force_aaaa_synthesis(uint64_t a1)
{
  return _mdns_xpc_dictionary_get_object(*(void **)(a1 + 24), "force_aaaa_synth", MEMORY[0x24BDACF80]) == (xpc_object_t)MEMORY[0x24BDACF20];
}

uint64_t mrc_dns_proxy_state_inquiry_create()
{
  uint64_t v0;
  uint64_t v1;
  _UNKNOWN **v2;
  void (*v3)(uint64_t);

  v0 = _os_object_alloc();
  v1 = v0;
  if (v0)
  {
    v2 = &_mrc_dns_proxy_state_inquiry_kind;
    *(_QWORD *)(v0 + 16) = &_mrc_dns_proxy_state_inquiry_kind;
    do
    {
      v3 = (void (*)(uint64_t))v2[2];
      if (v3)
        v3(v1);
      v2 = (_UNKNOWN **)*v2;
    }
    while (v2);
  }
  return v1;
}

void mrc_dns_proxy_state_inquiry_set_queue(uint64_t a1, dispatch_object_t object)
{
  NSObject *v4;

  if (!*(_BYTE *)(a1 + 57))
  {
    if (object)
      dispatch_retain(object);
    v4 = *(NSObject **)(a1 + 32);
    if (v4)
      dispatch_release(v4);
    *(_QWORD *)(a1 + 32) = object;
  }
}

void mrc_dns_proxy_state_inquiry_set_handler(uint64_t a1, void *aBlock)
{
  void *v3;
  const void *v4;

  if (!*(_BYTE *)(a1 + 57))
  {
    if (aBlock)
      v3 = _Block_copy(aBlock);
    else
      v3 = 0;
    v4 = *(const void **)(a1 + 40);
    if (v4)
      _Block_release(v4);
    *(_QWORD *)(a1 + 40) = v3;
  }
}

void mrc_dns_proxy_state_inquiry_activate(_BYTE *a1)
{
  _QWORD block[5];

  a1[57] = 1;
  os_retain(a1);
  if (_mrc_client_queue_s_once != -1)
    dispatch_once(&_mrc_client_queue_s_once, &__block_literal_global_74);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __mrc_dns_proxy_state_inquiry_activate_block_invoke;
  block[3] = &__block_descriptor_tmp_330;
  block[4] = a1;
  dispatch_async((dispatch_queue_t)_mrc_client_queue_s_queue, block);
}

void __mrc_dns_proxy_state_inquiry_activate_block_invoke(uint64_t a1)
{
  _BYTE *v2;
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v5;

  v2 = *(_BYTE **)(a1 + 32);
  if (!v2[56])
  {
    v2[56] = 1;
    v3 = &g_dns_proxy_state_inquiry_list;
    do
    {
      v4 = v3;
      v5 = *v3;
      v3 = (uint64_t *)(*v3 + 24);
    }
    while (v5);
    *v4 = (uint64_t)v2;
    os_retain(v2);
    v2 = *(_BYTE **)(a1 + 32);
  }
  _mrc_dns_proxy_state_inquiry_send_command((uint64_t)v2);
  os_release(*(void **)(a1 + 32));
}

void mrc_dns_proxy_state_inquiry_invalidate(_BYTE *a1)
{
  _QWORD block[5];

  a1[57] = 1;
  os_retain(a1);
  if (_mrc_client_queue_s_once != -1)
    dispatch_once(&_mrc_client_queue_s_once, &__block_literal_global_74);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __mrc_dns_proxy_state_inquiry_invalidate_block_invoke;
  block[3] = &__block_descriptor_tmp_10;
  block[4] = a1;
  dispatch_async((dispatch_queue_t)_mrc_client_queue_s_queue, block);
}

void __mrc_dns_proxy_state_inquiry_invalidate_block_invoke(uint64_t a1)
{
  _mrc_dns_proxy_state_inquiry_terminate_imp(*(_QWORD *)(a1 + 32), 0, 0);
  os_release(*(void **)(a1 + 32));
}

uint64_t mrc_dns_service_registration_create(uint64_t a1)
{
  uint64_t v2;
  xpc_object_t empty;
  uint64_t v4;
  const __CFArray *v5;
  const __CFSet *v6;
  _QWORD v8[5];
  _QWORD v9[5];

  v2 = _mrc_dns_service_registration_new();
  if (v2)
  {
    empty = xpc_dictionary_create_empty();
    v4 = MEMORY[0x24BDAC760];
    v5 = *(const __CFArray **)(a1 + 24);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 0x40000000;
    v9[2] = __mdns_dns_service_definition_create_xpc_dictionary_block_invoke;
    v9[3] = &__block_descriptor_tmp_31;
    v9[4] = empty;
    if (mdns_cfarray_enumerate(v5, (uint64_t)v9))
    {
      v6 = *(const __CFSet **)(a1 + 32);
      v8[0] = v4;
      v8[1] = 0x40000000;
      v8[2] = __mdns_dns_service_definition_create_xpc_dictionary_block_invoke_2;
      v8[3] = &__block_descriptor_tmp_8;
      v8[4] = empty;
      mdns_cfset_enumerate(v6, (uint64_t)v8);
      xpc_dictionary_set_uint64(empty, "ifindex", *(unsigned int *)(a1 + 48));
      xpc_dictionary_set_uint64(empty, "interface_scope", *(unsigned __int8 *)(a1 + 52));
      xpc_dictionary_set_BOOL(empty, "local_purview", *(_BYTE *)(a1 + 53));
      xpc_dictionary_set_BOOL(empty, "mdns_alternative", *(_BYTE *)(a1 + 54));
      *(_QWORD *)(v2 + 48) = empty;
      if (empty)
      {
        *(_BYTE *)(v2 + 64) = 1;
        return v2;
      }
    }
    else
    {
      if (empty)
        xpc_release(empty);
      *(_QWORD *)(v2 + 48) = 0;
    }
    os_release((void *)v2);
    return 0;
  }
  return v2;
}

uint64_t _mrc_dns_service_registration_new()
{
  uint64_t v0;
  uint64_t v1;
  _UNKNOWN **v2;
  void (*v3)(uint64_t);

  v0 = _os_object_alloc();
  v1 = v0;
  if (v0)
  {
    v2 = &_mrc_dns_service_registration_kind;
    *(_QWORD *)(v0 + 16) = &_mrc_dns_service_registration_kind;
    do
    {
      v3 = (void (*)(uint64_t))v2[2];
      if (v3)
        v3(v1);
      v2 = (_UNKNOWN **)*v2;
    }
    while (v2);
  }
  return v1;
}

void *_mrc_dns_service_registration_copy_description(_QWORD *a1, int a2)
{
  _QWORD *v4;
  void *v5;
  void *v6;

  v4 = (_QWORD *)mdns_string_builder_create();
  if (!v4)
    return 0;
  v5 = v4;
  if (a2 && mdns_string_builder_append_formatted(v4, "<%s: %p>: ", *(const char **)(a1[2] + 8), a1))
    v6 = 0;
  else
    v6 = mdns_string_builder_copy_string((uint64_t)v5);
  os_release(v5);
  return v6;
}

void _mrc_dns_service_registration_finalize(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    xpc_release(v2);
    *(_QWORD *)(a1 + 48) = 0;
  }
}

xpc_object_t _mrc_dns_service_registration_create_start_message(uint64_t a1, uint64_t a2)
{
  xpc_object_t empty;
  xpc_object_t command_message;

  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_value(empty, "definition", *(xpc_object_t *)(a1 + 48));
  xpc_dictionary_set_uint64(empty, "definition_type", *(unsigned __int8 *)(a1 + 64));
  xpc_dictionary_set_BOOL(empty, "reports_connection_errors", *(_BYTE *)(a1 + 65));
  command_message = _mrc_xpc_create_command_message(a2, "dns_service_registration.start", empty);
  if (empty)
    xpc_release(empty);
  return command_message;
}

xpc_object_t _mrc_dns_service_registration_create_stop_message(uint64_t a1, uint64_t a2)
{
  return _mrc_xpc_create_command_message(a2, "dns_service_registration.stop", 0);
}

void _mrc_dns_service_registration_handle_start(uint64_t a1)
{
  _mrc_dns_service_registration_generate_event_with_error(a1, 1, 0);
}

void _mrc_dns_service_registration_handle_interruption(uint64_t a1)
{
  _mrc_dns_service_registration_generate_event_with_error(a1, 2, 0);
}

void _mrc_dns_service_registration_handle_invalidation(uint64_t a1, int a2)
{
  _mrc_dns_service_registration_generate_event_with_error(a1, -1, a2);
}

void _mrc_dns_service_registration_handle_notification(uint64_t a1, void *a2)
{
  int int32;
  void *v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 65))
  {
    LOBYTE(v6) = 0;
    int32 = mdns_xpc_dictionary_get_int32(a2, "connection_error", (BOOL *)&v6);
    if ((_BYTE)v6)
      _mrc_dns_service_registration_generate_event_with_error(a1, 3, int32);
  }
  else
  {
    v4 = (void *)MEMORY[0x22E309E40](a2);
    if (_mrc_client_log_s_once != -1)
      dispatch_once(&_mrc_client_log_s_once, &__block_literal_global_31);
    v5 = _mrc_client_log_s_log;
    if (os_log_type_enabled((os_log_t)_mrc_client_log_s_log, OS_LOG_TYPE_FAULT))
    {
      v6 = 138412547;
      v7 = a1;
      v8 = 2081;
      v9 = v4;
      _os_log_fault_impl(&dword_22CF08000, v5, OS_LOG_TYPE_FAULT, "Current DNS service registration didn't require error reporting, ignoring -- registration: %@, notification: %{private}s", (uint8_t *)&v6, 0x16u);
      if (!v4)
        return;
    }
    else if (!v4)
    {
      return;
    }
    free(v4);
  }
}

void _mrc_dns_service_registration_generate_event_with_error(uint64_t a1, int a2, int a3)
{
  NSObject *v5;
  uint64_t v6;
  BOOL v7;
  const void *v8;
  _QWORD v9[5];
  int v10;
  int v11;

  v5 = *(NSObject **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 56);
  if (v5)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 0x40000000;
    v9[2] = ___mrc_dns_service_registration_generate_event_with_error_block_invoke;
    v9[3] = &unk_24F7EBE38;
    v9[4] = v6;
    v10 = a2;
    v11 = a3;
    dispatch_async(v5, v9);
  }
  if (a2 == -1)
  {
    v8 = *(const void **)(a1 + 56);
    if (v8)
    {
      _Block_release(v8);
      *(_QWORD *)(a1 + 56) = 0;
    }
  }
}

uint64_t ___mrc_dns_service_registration_generate_event_with_error_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 44));
}

uint64_t mrc_dns_service_registration_create_push(uint64_t a1)
{
  uint64_t v2;
  xpc_object_t empty;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  const __CFArray *v7;
  const __CFSet *v8;
  CFIndex Count;
  CFIndex v10;
  CFIndex i;
  const __CFData *ValueAtIndex;
  int64_t Length;
  const UInt8 *BytePtr;
  BOOL v15;
  const UInt8 *v16;
  xpc_object_t array_set_if_absent;
  _QWORD v19[5];
  _QWORD v20[5];

  v2 = _mrc_dns_service_registration_new();
  if (v2)
  {
    empty = xpc_dictionary_create_empty();
    v4 = empty;
    v5 = *(_QWORD *)(a1 + 24);
    if (v5)
      xpc_dictionary_set_string(empty, "srv_name", *(const char **)(v5 + 40));
    v6 = MEMORY[0x24BDAC760];
    v7 = *(const __CFArray **)(a1 + 40);
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 0x40000000;
    v20[2] = __mdns_dns_push_service_definition_create_xpc_dictionary_block_invoke;
    v20[3] = &__block_descriptor_tmp;
    v20[4] = v4;
    if (mdns_cfarray_enumerate(v7, (uint64_t)v20))
    {
      v8 = *(const __CFSet **)(a1 + 48);
      v19[0] = v6;
      v19[1] = 0x40000000;
      v19[2] = __mdns_dns_push_service_definition_create_xpc_dictionary_block_invoke_2;
      v19[3] = &__block_descriptor_tmp_11;
      v19[4] = v4;
      mdns_cfset_enumerate(v8, (uint64_t)v19);
      Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 56));
      if (Count >= 1)
      {
        v10 = Count;
        for (i = 0; i != v10; ++i)
        {
          ValueAtIndex = (const __CFData *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 56), i);
          Length = CFDataGetLength(ValueAtIndex);
          BytePtr = CFDataGetBytePtr(ValueAtIndex);
          if (BytePtr)
            v15 = Length < 1;
          else
            v15 = 1;
          if (!v15)
          {
            v16 = BytePtr;
            array_set_if_absent = _mdns_xpc_dictionary_get_array_set_if_absent(v4, "certificates");
            xpc_array_set_data(array_set_if_absent, 0xFFFFFFFFFFFFFFFFLL, v16, Length);
          }
        }
      }
      xpc_dictionary_set_uint64(v4, "ifindex", *(unsigned int *)(a1 + 72));
      xpc_dictionary_set_uint64(v4, "interface_scope", *(unsigned __int8 *)(a1 + 78));
      xpc_dictionary_set_uint64(v4, "port", *(unsigned __int16 *)(a1 + 76));
      xpc_dictionary_set_BOOL(v4, "local_purview", *(_BYTE *)(a1 + 79));
      xpc_dictionary_set_BOOL(v4, "mdns_alternative", *(_BYTE *)(a1 + 80));
      *(_QWORD *)(v2 + 48) = v4;
      if (v4)
      {
        *(_BYTE *)(v2 + 64) = 2;
        return v2;
      }
    }
    else
    {
      if (v4)
        xpc_release(v4);
      *(_QWORD *)(v2 + 48) = 0;
    }
    os_release((void *)v2);
    return 0;
  }
  return v2;
}

uint64_t mrc_dns_service_registration_set_reports_connection_errors(uint64_t result, char a2)
{
  if (!*(_BYTE *)(result + 41))
    *(_BYTE *)(result + 65) = a2;
  return result;
}

void mrc_dns_service_registration_set_event_handler(uint64_t a1, void *aBlock)
{
  void *v3;
  const void *v4;

  if (!*(_BYTE *)(a1 + 41))
  {
    if (aBlock)
      v3 = _Block_copy(aBlock);
    else
      v3 = 0;
    v4 = *(const void **)(a1 + 56);
    if (v4)
      _Block_release(v4);
    *(_QWORD *)(a1 + 56) = v3;
  }
}

void mrc_dns_service_registration_invalidate(void *a1)
{
  _mrc_client_invalidate_async(a1, 0);
}

_QWORD *mrc_discovery_proxy_create(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  _UNKNOWN **v4;
  void (*v5)(_QWORD *);
  uint64_t v6;

  v2 = _os_object_alloc();
  v3 = (_QWORD *)v2;
  if (v2)
  {
    v4 = &_mrc_discovery_proxy_kind;
    *(_QWORD *)(v2 + 16) = &_mrc_discovery_proxy_kind;
    do
    {
      v5 = (void (*)(_QWORD *))v4[2];
      if (v5)
        v5(v3);
      v4 = (_UNKNOWN **)*v4;
    }
    while (v4);
    v6 = _mrc_discovery_proxy_parameters_create_or_copy(a1);
    v3[6] = v6;
    if (!v6)
    {
      os_release(v3);
      return 0;
    }
  }
  return v3;
}

uint64_t _mrc_discovery_proxy_parameters_create_or_copy(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _UNKNOWN **v4;
  void (*v5)(uint64_t);
  const __CFAllocator *v6;
  CFMutableArrayRef MutableCopy;
  CFMutableSetRef v8;
  xpc_object_t empty;
  const __CFAllocator *v10;
  CFMutableArrayRef Mutable;
  CFMutableSetRef v12;

  v2 = _os_object_alloc();
  v3 = v2;
  if (v2)
  {
    v4 = &_mrc_discovery_proxy_parameters_kind;
    *(_QWORD *)(v2 + 16) = &_mrc_discovery_proxy_parameters_kind;
    do
    {
      v5 = (void (*)(uint64_t))v4[2];
      if (v5)
        v5(v3);
      v4 = (_UNKNOWN **)*v4;
    }
    while (v4);
    if (a1)
    {
      *(_DWORD *)(v3 + 48) = *(_DWORD *)(a1 + 48);
      v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      MutableCopy = CFArrayCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, *(CFArrayRef *)(a1 + 24));
      *(_QWORD *)(v3 + 24) = MutableCopy;
      if (!MutableCopy)
        goto LABEL_14;
      v8 = CFSetCreateMutableCopy(v6, 0, *(CFSetRef *)(a1 + 32));
      *(_QWORD *)(v3 + 32) = v8;
      if (!v8)
        goto LABEL_14;
      empty = xpc_copy(*(xpc_object_t *)(a1 + 40));
    }
    else
    {
      v10 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, &mdns_cfarray_callbacks);
      *(_QWORD *)(v3 + 24) = Mutable;
      if (!Mutable)
        goto LABEL_14;
      v12 = CFSetCreateMutable(v10, 0, &mdns_domain_name_cf_set_callbacks);
      *(_QWORD *)(v3 + 32) = v12;
      if (!v12)
        goto LABEL_14;
      empty = xpc_array_create_empty();
    }
    *(_QWORD *)(v3 + 40) = empty;
    if (!empty)
    {
LABEL_14:
      os_release((void *)v3);
      return 0;
    }
  }
  return v3;
}

void *_mrc_discovery_proxy_copy_description(_QWORD *a1, int a2, char a3)
{
  _QWORD *v6;
  _QWORD *v7;
  const char *v8;
  char *v9;
  void *v10;

  v6 = (_QWORD *)mdns_string_builder_create();
  if (!v6)
    return 0;
  v7 = v6;
  if (a2 && mdns_string_builder_append_formatted(v6, "<%s: %p>: ", *(const char **)(a1[2] + 8), a1)
    || (v8 = (const char *)_mrc_discovery_proxy_parameters_copy_description(a1[6], 0, a3)) == 0)
  {
    v10 = 0;
  }
  else
  {
    v9 = (char *)v8;
    if (mdns_string_builder_append_formatted(v7, "%s", v8))
      v10 = 0;
    else
      v10 = mdns_string_builder_copy_string((uint64_t)v7);
    free(v9);
  }
  os_release(v7);
  return v10;
}

void _mrc_discovery_proxy_finalize(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    os_release(v2);
    *(_QWORD *)(a1 + 48) = 0;
  }
}

xpc_object_t _mrc_discovery_proxy_create_start_message(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  xpc_object_t empty;
  void *v5;
  uint64_t v6;
  const __CFArray *v7;
  const __CFSet *v8;
  size_t count;
  size_t v10;
  size_t i;
  const void *data;
  size_t v13;
  BOOL v14;
  const void *v15;
  xpc_object_t optional_array;
  xpc_object_t command_message;
  size_t length;
  _QWORD v20[5];
  _QWORD v21[5];

  v3 = *(_QWORD *)(a1 + 48);
  empty = xpc_dictionary_create_empty();
  if (!empty)
    return 0;
  v5 = empty;
  xpc_dictionary_set_uint64(empty, "interface", *(unsigned int *)(v3 + 48));
  v6 = MEMORY[0x24BDAC760];
  v7 = *(const __CFArray **)(v3 + 24);
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 0x40000000;
  v21[2] = ___mrc_discovery_proxy_parameters_create_xpc_dictionary_block_invoke;
  v21[3] = &__block_descriptor_tmp_46;
  v21[4] = v5;
  if (!mdns_cfarray_enumerate(v7, (uint64_t)v21))
  {
    xpc_release(v5);
    return 0;
  }
  v8 = *(const __CFSet **)(v3 + 32);
  v20[0] = v6;
  v20[1] = 0x40000000;
  v20[2] = ___mrc_discovery_proxy_parameters_create_xpc_dictionary_block_invoke_2;
  v20[3] = &__block_descriptor_tmp_48;
  v20[4] = v5;
  mdns_cfset_enumerate(v8, (uint64_t)v20);
  count = xpc_array_get_count(*(xpc_object_t *)(v3 + 40));
  if (count)
  {
    v10 = count;
    for (i = 0; i != v10; ++i)
    {
      length = 0;
      data = xpc_array_get_data(*(xpc_object_t *)(v3 + 40), i, &length);
      v13 = length;
      if (data)
        v14 = length == 0;
      else
        v14 = 1;
      if (!v14)
      {
        v15 = data;
        optional_array = mdns_xpc_dictionary_get_optional_array(v5, "server_certificates", 0);
        if (!optional_array)
        {
          optional_array = xpc_array_create_empty();
          xpc_dictionary_set_value(v5, "server_certificates", optional_array);
          if (optional_array)
            xpc_release(optional_array);
        }
        xpc_array_set_data(optional_array, 0xFFFFFFFFFFFFFFFFLL, v15, v13);
      }
    }
  }
  command_message = _mrc_xpc_create_command_message(a2, "discovery_proxy.start", v5);
  xpc_release(v5);
  return command_message;
}

xpc_object_t _mrc_discovery_proxy_create_stop_message(uint64_t a1, uint64_t a2)
{
  return _mrc_xpc_create_command_message(a2, "discovery_proxy.stop", 0);
}

void _mrc_discovery_proxy_handle_start(uint64_t a1)
{
  _mrc_discovery_proxy_generate_event_with_error(a1, 1, 0);
}

void _mrc_discovery_proxy_handle_interruption(uint64_t a1)
{
  _mrc_discovery_proxy_generate_event_with_error(a1, 2, 0);
}

void _mrc_discovery_proxy_handle_invalidation(uint64_t a1, int a2)
{
  _mrc_discovery_proxy_generate_event_with_error(a1, -1, a2);
}

void _mrc_discovery_proxy_generate_event_with_error(uint64_t a1, int a2, int a3)
{
  NSObject *v5;
  uint64_t v6;
  BOOL v7;
  const void *v8;
  _QWORD v9[5];
  int v10;
  int v11;

  v5 = *(NSObject **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 56);
  if (v5)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 0x40000000;
    v9[2] = ___mrc_discovery_proxy_generate_event_with_error_block_invoke;
    v9[3] = &unk_24F7EBEA0;
    v9[4] = v6;
    v10 = a2;
    v11 = a3;
    dispatch_async(v5, v9);
  }
  if (a2 == -1)
  {
    v8 = *(const void **)(a1 + 56);
    if (v8)
    {
      _Block_release(v8);
      *(_QWORD *)(a1 + 56) = 0;
    }
  }
}

uint64_t ___mrc_discovery_proxy_generate_event_with_error_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 44));
}

uint64_t ___mrc_discovery_proxy_parameters_create_xpc_dictionary_block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  uint64_t (*v4)(uint64_t, _QWORD, _QWORD);
  uint64_t result;
  char *v6;
  void *v7;
  xpc_object_t optional_array;

  v3 = (_QWORD *)(a2 + 16);
  do
  {
    v3 = (_QWORD *)*v3;
    if (!v3)
      return 0;
    v4 = (uint64_t (*)(uint64_t, _QWORD, _QWORD))v3[3];
  }
  while (!v4);
  result = v4(a2, 0, 0);
  if (result)
  {
    v6 = (char *)result;
    v7 = *(void **)(a1 + 32);
    optional_array = mdns_xpc_dictionary_get_optional_array(v7, "addresses", 0);
    if (!optional_array)
    {
      optional_array = xpc_array_create_empty();
      xpc_dictionary_set_value(v7, "addresses", optional_array);
      if (optional_array)
        xpc_release(optional_array);
    }
    xpc_array_set_string(optional_array, 0xFFFFFFFFFFFFFFFFLL, v6);
    free(v6);
    return 1;
  }
  return result;
}

uint64_t ___mrc_discovery_proxy_parameters_create_xpc_dictionary_block_invoke_2(uint64_t a1, uint64_t a2)
{
  const char *v2;
  void *v3;
  xpc_object_t optional_array;

  v2 = *(const char **)(a2 + 40);
  v3 = *(void **)(a1 + 32);
  optional_array = mdns_xpc_dictionary_get_optional_array(v3, "match_domains", 0);
  if (!optional_array)
  {
    optional_array = xpc_array_create_empty();
    xpc_dictionary_set_value(v3, "match_domains", optional_array);
    if (optional_array)
      xpc_release(optional_array);
  }
  xpc_array_set_string(optional_array, 0xFFFFFFFFFFFFFFFFLL, v2);
  return 1;
}

void mrc_discovery_proxy_set_event_handler(uint64_t a1, void *aBlock)
{
  void *v3;
  const void *v4;

  if (!*(_BYTE *)(a1 + 41))
  {
    if (aBlock)
      v3 = _Block_copy(aBlock);
    else
      v3 = 0;
    v4 = *(const void **)(a1 + 56);
    if (v4)
      _Block_release(v4);
    *(_QWORD *)(a1 + 56) = v3;
  }
}

void mrc_discovery_proxy_invalidate(void *a1)
{
  _mrc_client_invalidate_async(a1, 0);
}

uint64_t mrc_discovery_proxy_parameters_create()
{
  return _mrc_discovery_proxy_parameters_create_or_copy(0);
}

uint64_t mrc_discovery_proxy_parameters_set_interface(uint64_t result, int a2)
{
  *(_DWORD *)(result + 48) = a2;
  return result;
}

uint64_t mrc_discovery_proxy_parameters_add_server_ipv4_address(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t v6;
  void *v7;

  v6 = _mdns_address_new();
  if (!v6)
    return 4294960567;
  v7 = (void *)v6;
  *(_WORD *)(v6 + 24) = 528;
  *(_WORD *)(v6 + 26) = __rev16(a3);
  *(_DWORD *)(v6 + 28) = bswap32(a2);
  CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 24), (const void *)v6);
  os_release(v7);
  return 0;
}

uint64_t mrc_discovery_proxy_parameters_add_server_ipv6_address(uint64_t a1, _OWORD *a2, unsigned int a3, int a4)
{
  uint64_t v8;
  void *v9;

  v8 = _mdns_address_new();
  if (!v8)
    return 4294960567;
  v9 = (void *)v8;
  *(_WORD *)(v8 + 24) = 7708;
  *(_WORD *)(v8 + 26) = __rev16(a3);
  *(_OWORD *)(v8 + 32) = *a2;
  *(_DWORD *)(v8 + 48) = a4;
  CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 24), (const void *)v8);
  os_release(v9);
  return 0;
}

uint64_t mrc_discovery_proxy_parameters_add_match_domain(uint64_t a1, char *a2)
{
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  unsigned int v8;
  _BYTE v9[256];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = DomainNameFromString(v9, a2);
  if ((_DWORD)v3)
    return v3;
  v8 = 0;
  if (!v9[0])
  {
    if (_mdns_domain_name_get_root_s_once != -1)
      dispatch_once(&_mdns_domain_name_get_root_s_once, &__block_literal_global_225);
    v5 = (void *)_mdns_domain_name_get_root_s_root;
    if (_mdns_domain_name_get_root_s_root)
    {
      CFSetAddValue(*(CFMutableSetRef *)(a1 + 32), (const void *)_mdns_domain_name_get_root_s_root);
LABEL_10:
      os_release(v5);
      return 0;
    }
  }
  v4 = _mdns_domain_name_create(v9, (int *)&v8);
  v5 = v4;
  v6 = v8;
  if (!v8)
  {
    CFSetAddValue(*(CFMutableSetRef *)(a1 + 32), v4);
    if (!v5)
      return 0;
    goto LABEL_10;
  }
  if (v4)
    os_release(v4);
  return v6;
}

void mrc_discovery_proxy_parameters_add_server_certificate(uint64_t a1, void *bytes, size_t length)
{
  xpc_array_set_data(*(xpc_object_t *)(a1 + 40), 0xFFFFFFFFFFFFFFFFLL, bytes, length);
}

uint64_t mrc_cached_local_records_inquiry_create()
{
  uint64_t v0;
  uint64_t v1;
  _UNKNOWN **v2;
  void (*v3)(uint64_t);

  v0 = _os_object_alloc();
  v1 = v0;
  if (v0)
  {
    v2 = &_mrc_cached_local_records_inquiry_kind;
    *(_QWORD *)(v0 + 16) = &_mrc_cached_local_records_inquiry_kind;
    do
    {
      v3 = (void (*)(uint64_t))v2[2];
      if (v3)
        v3(v1);
      v2 = (_UNKNOWN **)*v2;
    }
    while (v2);
  }
  return v1;
}

void *_mrc_cached_local_records_inquiry_copy_description(_QWORD *a1, int a2)
{
  _QWORD *v4;
  void *v5;
  void *v6;

  v4 = (_QWORD *)mdns_string_builder_create();
  if (!v4)
    return 0;
  v5 = v4;
  if (a2 && mdns_string_builder_append_formatted(v4, "<%s: %p>: ", *(const char **)(a1[2] + 8), a1))
    v6 = 0;
  else
    v6 = mdns_string_builder_copy_string((uint64_t)v5);
  os_release(v5);
  return v6;
}

xpc_object_t _mrc_cached_local_records_inquiry_create_start_message(uint64_t a1, uint64_t a2)
{
  return _mrc_xpc_create_command_message(a2, "record_cache.local_record_inquiry", 0);
}

void _mrc_cached_local_records_inquiry_handle_start(uint64_t a1, void *a2)
{
  xpc_object_t optional_array;
  void *v4;
  uint64_t v5;
  int v6;
  char v7;

  v7 = 0;
  if (a2 && (optional_array = mdns_xpc_dictionary_get_optional_array(a2, "record_info", &v7), v7))
  {
    v4 = optional_array;
    v5 = a1;
    v6 = 0;
  }
  else
  {
    v5 = a1;
    v4 = 0;
    v6 = -6712;
  }
  _mrc_cached_local_records_inquiry_invoke_user_handler(v5, v4, v6);
}

void _mrc_cached_local_records_inquiry_handle_invalidation(uint64_t a1, int a2)
{
  _mrc_cached_local_records_inquiry_invoke_user_handler(a1, 0, a2);
}

void _mrc_cached_local_records_inquiry_invoke_user_handler(uint64_t a1, xpc_object_t object, int a3)
{
  NSObject *v4;
  xpc_object_t v6;
  xpc_object_t v7;
  xpc_object_t v8;
  uint64_t v9;
  const void *v10;
  _QWORD block[6];
  int v12;

  v4 = *(NSObject **)(a1 + 32);
  if (v4 && *(_QWORD *)(a1 + 48))
  {
    v6 = object;
    if (object)
    {
      v7 = xpc_copy(object);
      if (v7)
      {
        v8 = v7;
        xpc_array_apply(v7, &__block_literal_global_62);
        v6 = v8;
      }
      else
      {
        xpc_retain(v6);
      }
    }
    v9 = *(_QWORD *)(a1 + 48);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = ___mrc_cached_local_records_inquiry_invoke_user_handler_block_invoke;
    block[3] = &unk_24F7EBF18;
    block[4] = v9;
    block[5] = v6;
    v12 = a3;
    dispatch_async(v4, block);
  }
  v10 = *(const void **)(a1 + 48);
  if (v10)
  {
    _Block_release(v10);
    *(_QWORD *)(a1 + 48) = 0;
  }
}

void ___mrc_cached_local_records_inquiry_invoke_user_handler_block_invoke(uint64_t a1)
{
  void *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(void **)(a1 + 40);
  if (v2)
    xpc_release(v2);
}

uint64_t ___mrc_cached_local_records_inquiry_process_create_enhanced_record_info_copy_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  char *string;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  const char *v9;
  const char *v10;
  unint64_t v11;
  int v12;
  int appended;
  unint64_t v14;
  unint64_t v15;
  char *v16;
  int v17;
  NSObject *v18;
  uint8_t buf[4];
  uint64_t v20;
  unsigned __int8 v21;
  _BYTE v22[255];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (MEMORY[0x22E309EDC](a3) != MEMORY[0x24BDACFA0])
    return 1;
  string = (char *)xpc_dictionary_get_string(a3, "name");
  if (!string)
    return 1;
  if (DomainNameFromString(&v21, string))
    return 1;
  v6 = v21;
  if (!v21)
    return 1;
  v7 = mdns_string_builder_create();
  if (!v7)
  {
    v17 = -6729;
    goto LABEL_54;
  }
  v8 = (_QWORD *)v7;
  v9 = v22;
  v10 = &v22[v6];
  while (v9 < v10)
  {
    v11 = v10 - v9;
    v12 = *(unsigned __int8 *)v9;
    if (*v9 < 0)
    {
      if (v10 != v9 && v11 >= 2)
      {
        if ((v12 + 62) <= 0x1Du && v9[1] < -64)
        {
          v14 = 2;
          goto LABEL_34;
        }
        if (v11 >= 3 && v9[2] <= -65)
        {
          if (v12 == 224)
          {
            if ((v9[1] & 0xE0) == 0xA0)
              goto LABEL_33;
          }
          else if ((v12 + 31) < 0xCu || (v12 & 0xFE) == 0xEE)
          {
            if (v9[1] < -64)
              goto LABEL_33;
          }
          else if (v12 == 237 && v9[1] < -96)
          {
LABEL_33:
            v14 = 3;
            goto LABEL_34;
          }
          if (v11 >= 4 && v9[3] <= -65)
          {
            if (v12 == 240)
            {
              if ((v9[1] + 112) < 0x30u)
                goto LABEL_41;
            }
            else if ((v12 + 15) > 2u)
            {
              if (v12 == 244 && v9[1] <= -113)
              {
LABEL_41:
                v14 = 4;
LABEL_34:
                appended = mdns_string_builder_append_formatted(v8, "%.*s", v14, v9);
                if (appended)
                  goto LABEL_53;
                goto LABEL_45;
              }
            }
            else if (v9[1] < -64)
            {
              goto LABEL_41;
            }
          }
        }
      }
    }
    else if ((v12 - 32) <= 0x5E)
    {
      if (v12 == 92)
      {
        appended = mdns_string_builder_append_formatted(v8, "\\");
        if (appended)
        {
LABEL_53:
          v17 = appended;
          os_release(v8);
LABEL_54:
          if (_mrc_client_log_s_once != -1)
            dispatch_once(&_mrc_client_log_s_once, &__block_literal_global_31);
          v18 = _mrc_client_log_s_log;
          if (os_log_type_enabled((os_log_t)_mrc_client_log_s_log, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 134217984;
            v20 = v17;
            _os_log_fault_impl(&dword_22CF08000, v18, OS_LOG_TYPE_FAULT, "Failed to convert first label to UTF-8 string: %{mdns:err}ld", buf, 0xCu);
          }
          return 1;
        }
      }
      appended = mdns_string_builder_append_formatted(v8, "%c");
      goto LABEL_43;
    }
    appended = mdns_string_builder_append_formatted(v8, "\\x%02X");
LABEL_43:
    if (appended)
      goto LABEL_53;
    v14 = 1;
LABEL_45:
    if (v14 >= v11)
      v15 = v10 - v9;
    else
      v15 = v14;
    v9 += v15;
  }
  v16 = (char *)mdns_string_builder_copy_string((uint64_t)v8);
  os_release(v8);
  if (!v16)
  {
    v17 = -6728;
    goto LABEL_54;
  }
  xpc_dictionary_set_string(a3, "first_label", v16);
  free(v16);
  return 1;
}

void mrc_cached_local_records_inquiry_set_result_handler(uint64_t a1, void *aBlock)
{
  void *v3;
  const void *v4;

  if (!*(_BYTE *)(a1 + 41))
  {
    if (aBlock)
      v3 = _Block_copy(aBlock);
    else
      v3 = 0;
    v4 = *(const void **)(a1 + 48);
    if (v4)
      _Block_release(v4);
    *(_QWORD *)(a1 + 48) = v3;
  }
}

void mrc_cached_local_records_inquiry_invalidate(void *a1)
{
  _mrc_client_invalidate_async(a1, 0);
}

uint64_t mrc_record_cache_flush_create()
{
  uint64_t v0;
  uint64_t v1;
  _UNKNOWN **v2;
  void (*v3)(uint64_t);

  v0 = _os_object_alloc();
  v1 = v0;
  if (v0)
  {
    v2 = &_mrc_record_cache_flush_kind;
    *(_QWORD *)(v0 + 16) = &_mrc_record_cache_flush_kind;
    do
    {
      v3 = (void (*)(uint64_t))v2[2];
      if (v3)
        v3(v1);
      v2 = (_UNKNOWN **)*v2;
    }
    while (v2);
  }
  return v1;
}

void *_mrc_record_cache_flush_copy_description(uint64_t a1, int a2, char a3)
{
  _QWORD *v6;
  _QWORD *v7;
  void *v8;
  uint64_t v10;

  v6 = (_QWORD *)mdns_string_builder_create();
  if (!v6)
    return 0;
  v7 = v6;
  if (a2
    && mdns_string_builder_append_formatted(v6, "<%s: %p>: ", *(const char **)(*(_QWORD *)(a1 + 16) + 8), (const void *)a1)|| mdns_string_builder_append_formatted(v7, "record name: "))
  {
    goto LABEL_5;
  }
  v10 = *(_QWORD *)(a1 + 48);
  if (v10)
  {
    if (mdns_string_builder_append_description(v7, v10, a3))
      goto LABEL_5;
  }
  else if (mdns_string_builder_append_formatted(v7, "«NO NAME»"))
  {
    goto LABEL_5;
  }
  if (!*(_BYTE *)(a1 + 66)
    || !mdns_string_builder_append_formatted(v7, ", key tag: %u", *(unsigned __int16 *)(a1 + 64)))
  {
    v8 = mdns_string_builder_copy_string((uint64_t)v7);
    goto LABEL_6;
  }
LABEL_5:
  v8 = 0;
LABEL_6:
  os_release(v7);
  return v8;
}

void _mrc_record_cache_flush_finalize(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    os_release(v2);
    *(_QWORD *)(a1 + 48) = 0;
  }
}

xpc_object_t _mrc_record_cache_flush_create_start_message(uint64_t a1, uint64_t a2)
{
  xpc_object_t empty;
  void *v5;
  uint64_t v6;
  xpc_object_t command_message;

  empty = xpc_dictionary_create_empty();
  v5 = empty;
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
    xpc_dictionary_set_string(empty, "record_name", *(const char **)(v6 + 40));
  if (*(_BYTE *)(a1 + 66))
    xpc_dictionary_set_uint64(v5, "key_tag", *(unsigned __int16 *)(a1 + 64));
  command_message = _mrc_xpc_create_command_message(a2, "record_cache.flush", v5);
  if (v5)
    xpc_release(v5);
  return command_message;
}

void _mrc_record_cache_flush_handle_start(uint64_t a1)
{
  _mrc_record_cache_flush_invoke_user_handler(a1, 1, 0);
}

void _mrc_record_cache_flush_handle_invalidation(uint64_t a1, int a2)
{
  _mrc_record_cache_flush_invoke_user_handler(a1, 2, a2);
}

void _mrc_record_cache_flush_invoke_user_handler(uint64_t a1, int a2, int a3)
{
  NSObject *v4;
  uint64_t v5;
  const void *v6;
  _QWORD v7[5];
  int v8;
  int v9;

  v4 = *(NSObject **)(a1 + 32);
  if (v4)
  {
    v5 = *(_QWORD *)(a1 + 56);
    if (v5)
    {
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 0x40000000;
      v7[2] = ___mrc_record_cache_flush_invoke_user_handler_block_invoke;
      v7[3] = &unk_24F7EBF80;
      v7[4] = v5;
      v8 = a2;
      v9 = a3;
      dispatch_async(v4, v7);
    }
  }
  v6 = *(const void **)(a1 + 56);
  if (v6)
  {
    _Block_release(v6);
    *(_QWORD *)(a1 + 56) = 0;
  }
}

uint64_t ___mrc_record_cache_flush_invoke_user_handler_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 44));
}

void mrc_record_cache_flush_set_record_name(uint64_t a1, void *object)
{
  void *v4;

  if (!*(_BYTE *)(a1 + 41))
  {
    if (object)
      os_retain(object);
    v4 = *(void **)(a1 + 48);
    if (v4)
      os_release(v4);
    *(_QWORD *)(a1 + 48) = object;
  }
}

uint64_t mrc_record_cache_flush_set_key_tag(uint64_t result, __int16 a2)
{
  if (!*(_BYTE *)(result + 41))
  {
    *(_WORD *)(result + 64) = a2;
    *(_BYTE *)(result + 66) = 1;
  }
  return result;
}

void mrc_record_cache_flush_set_result_handler(uint64_t a1, void *aBlock)
{
  void *v3;
  const void *v4;

  if (!*(_BYTE *)(a1 + 41))
  {
    if (aBlock)
      v3 = _Block_copy(aBlock);
    else
      v3 = 0;
    v4 = *(const void **)(a1 + 56);
    if (v4)
      _Block_release(v4);
    *(_QWORD *)(a1 + 56) = v3;
  }
}

void mrc_record_cache_flush_invalidate(void *a1)
{
  _mrc_client_invalidate_async(a1, 0);
}

xpc_object_t _mrc_xpc_create_command_message(uint64_t a1, const char *a2, void *a3)
{
  xpc_object_t v6;

  v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v6, "id", a1);
  xpc_dictionary_set_string(v6, "command", a2);
  if (a3)
    xpc_dictionary_set_value(v6, "params", a3);
  return v6;
}

void *_mdns_string_builder_copy_description(_QWORD *a1, int a2)
{
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  size_t v9;
  void *result;

  v4 = (_QWORD *)mdns_string_builder_create();
  if (!v4)
    return 0;
  v5 = v4;
  if (a2 && mdns_string_builder_append_formatted(v4, "<%s: %p>: ", *(const char **)(a1[2] + 8), a1)
    || mdns_string_builder_append_formatted(v5, "capacity: %zu, string length: %zu", a1[4], a1[5]))
  {
    goto LABEL_4;
  }
  v7 = (const char *)v5[3];
  if (v7)
  {
    v8 = v5[5];
    v9 = v8 + 1;
    if (v8 == -1)
    {
LABEL_4:
      v6 = 0;
LABEL_12:
      os_release(v5);
      return v6;
    }
  }
  else
  {
    v7 = "";
    v9 = 1;
  }
  result = malloc_type_malloc(v9, 0xA172743EuLL);
  if (result)
  {
    v6 = result;
    memcpy(result, v7, v9);
    goto LABEL_12;
  }
  __break(1u);
  return result;
}

void _mdns_string_builder_finalize(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 24);
  if (v2)
  {
    free(v2);
    *(_QWORD *)(a1 + 24) = 0;
  }
}

uint64_t mdns_string_builder_create()
{
  uint64_t v0;
  uint64_t v1;
  _UNKNOWN **v2;
  void (*v3)(uint64_t);

  v0 = _os_object_alloc();
  v1 = v0;
  if (v0)
  {
    v2 = &_mdns_string_builder_kind;
    *(_QWORD *)(v0 + 16) = &_mdns_string_builder_kind;
    do
    {
      v3 = (void (*)(uint64_t))v2[2];
      if (v3)
        v3(v1);
      v2 = (_UNKNOWN **)*v2;
    }
    while (v2);
    *(_QWORD *)(v1 + 32) = 0;
  }
  return v1;
}

uint64_t mdns_string_builder_append_formatted(_QWORD *a1, char *__format, ...)
{
  uint64_t result;
  char i;
  size_t v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  va_list va;

  va_start(va, __format);
  if (a1[3] || (result = _mdns_string_builder_grow_buffer(a1, a1[4]), !(_DWORD)result))
  {
    for (i = 1; ; i = 0)
    {
      v6 = a1[4] - a1[5];
      v7 = vsnprintf((char *)(a1[3] + a1[5]), v6, __format, va);
      if ((v7 & 0x80000000) != 0)
      {
        *(_BYTE *)(a1[3] + a1[5]) = 0;
        return 4294960596;
      }
      v8 = v7;
      if (v6 > v7)
      {
        result = 0;
        a1[5] += v8;
        return result;
      }
      if ((i & 1) == 0)
        break;
      v9 = a1[5];
      v10 = v7 + 1;
      v11 = __CFADD__(v9, v10);
      v12 = v9 + v10;
      if (v11)
        return 4294960567;
      v13 = a1[4];
      if (v13 < 0)
        return 4294960567;
      if (v12 <= 2 * v13)
        v14 = 2 * v13;
      else
        v14 = v12;
      result = _mdns_string_builder_grow_buffer(a1, v14);
      if ((_DWORD)result)
        return result;
    }
    return 4294960534;
  }
  return result;
}

uint64_t _mdns_string_builder_grow_buffer(_QWORD *a1, unint64_t a2)
{
  size_t v3;
  size_t v4;
  size_t v5;
  void *v6;
  void *v7;
  const void *v8;
  void *v9;
  uint64_t result;

  if (a1[3] && a1[4] >= a2)
    return 0;
  if (a2 <= 0x40)
    v3 = 64;
  else
    v3 = a2;
  v4 = malloc_good_size(v3);
  if (v4 < v3)
    return 4294960534;
  v5 = v4;
  v6 = malloc_type_calloc(v4, 1uLL, 0xF1748037uLL);
  if (!v6)
  {
    __break(1u);
    return 0;
  }
  v7 = v6;
  v8 = (const void *)a1[3];
  if (v8)
  {
    memcpy(v6, v8, a1[5] + 1);
    v9 = (void *)a1[3];
    if (v9)
      free(v9);
  }
  result = 0;
  a1[3] = v7;
  a1[4] = v5;
  return result;
}

uint64_t mdns_string_builder_append_description(_QWORD *a1, uint64_t a2, char a3)
{
  _QWORD *v4;
  uint64_t (*v5)(uint64_t, _QWORD, _QWORD);
  const char *v6;
  char *v7;
  uint64_t appended;

  v4 = (_QWORD *)(a2 + 16);
  while (1)
  {
    v4 = (_QWORD *)*v4;
    if (!v4)
      break;
    v5 = (uint64_t (*)(uint64_t, _QWORD, _QWORD))v4[3];
    if (v5)
    {
      v6 = (const char *)v5(a2, 0, a3 & 1);
      if (v6)
      {
        v7 = (char *)v6;
        appended = mdns_string_builder_append_formatted(a1, "%s", v6);
        free(v7);
        return appended;
      }
      return 4294960567;
    }
  }
  return 4294960567;
}

uint64_t mdns_string_builder_append_description_with_prefix(_QWORD *a1, const char *a2, uint64_t a3, char a4)
{
  uint64_t result;

  if (!a2)
    return mdns_string_builder_append_description(a1, a3, a4);
  result = mdns_string_builder_append_formatted(a1, "%s", a2);
  if (!(_DWORD)result)
    return mdns_string_builder_append_description(a1, a3, a4);
  return result;
}

void *mdns_string_builder_copy_string(uint64_t a1)
{
  const char *v1;
  uint64_t v2;
  size_t v3;
  void *v4;
  void *result;

  v1 = *(const char **)(a1 + 24);
  if (v1)
  {
    v2 = *(_QWORD *)(a1 + 40);
    v3 = v2 + 1;
    if (v2 == -1)
      return 0;
  }
  else
  {
    v1 = "";
    v3 = 1;
  }
  result = malloc_type_malloc(v3, 0xA172743EuLL);
  if (result)
  {
    v4 = result;
    memcpy(result, v1, v3);
    return v4;
  }
  __break(1u);
  return result;
}

xpc_object_t _mdns_xpc_dictionary_get_object(void *a1, const char *a2, uint64_t a3)
{
  xpc_object_t value;
  xpc_object_t v5;

  value = xpc_dictionary_get_value(a1, a2);
  v5 = value;
  if (value && MEMORY[0x22E309EDC](value) != a3)
    return 0;
  return v5;
}

int64_t mdns_xpc_dictionary_get_int32(void *a1, const char *a2, BOOL *a3)
{
  int64_t result;
  BOOL v5;

  result = (int64_t)_mdns_xpc_dictionary_get_object(a1, a2, MEMORY[0x24BDACFD0]);
  if (!result)
  {
    v5 = 0;
    if (!a3)
      return result;
    goto LABEL_6;
  }
  result = xpc_int64_get_value((xpc_object_t)result);
  v5 = (int)result == result;
  if ((int)result == result)
    result = result;
  else
    result = 0;
  if (a3)
LABEL_6:
    *a3 = v5;
  return result;
}

uint64_t _mdns_xpc_object_get_uint64_limited(uint64_t result, uint64_t a2, BOOL *a3)
{
  void *v5;
  BOOL v6;

  if (!result)
  {
LABEL_9:
    v6 = 0;
    if (!a3)
      return result;
    goto LABEL_6;
  }
  v5 = (void *)result;
  if (MEMORY[0x22E309EDC]() != MEMORY[0x24BDACFF8])
  {
    result = 0;
    goto LABEL_9;
  }
  result = xpc_uint64_get_value(v5);
  v6 = result <= a2;
  if (result > a2)
    result = 0;
  if (a3)
LABEL_6:
    *a3 = v6;
  return result;
}

xpc_object_t mdns_xpc_dictionary_get_optional_array(void *a1, const char *a2, char *a3)
{
  xpc_object_t value;
  xpc_object_t v5;
  char v6;

  value = xpc_dictionary_get_value(a1, a2);
  v5 = value;
  if (value && MEMORY[0x22E309EDC](value) != MEMORY[0x24BDACF78])
  {
    v5 = 0;
    v6 = 0;
    if (!a3)
      return v5;
    goto LABEL_6;
  }
  v6 = 1;
  if (a3)
LABEL_6:
    *a3 = v6;
  return v5;
}

xpc_object_t _mdns_xpc_dictionary_get_array_set_if_absent(void *a1, const char *a2)
{
  xpc_object_t optional_array;

  optional_array = mdns_xpc_dictionary_get_optional_array(a1, a2, 0);
  if (!optional_array)
  {
    optional_array = xpc_array_create_empty();
    xpc_dictionary_set_value(a1, a2, optional_array);
    if (optional_array)
      xpc_release(optional_array);
  }
  return optional_array;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB810](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x24BDBC3C0](theSet, value);
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
  MEMORY[0x24BDBC3C8](theSet, applier, context);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x24BDBC3E8](allocator, capacity, callBacks);
}

CFMutableSetRef CFSetCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFSetRef theSet)
{
  return (CFMutableSetRef)MEMORY[0x24BDBC3F0](allocator, capacity, theSet);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x24BDBC3F8](theSet);
}

void CFSetGetValues(CFSetRef theSet, const void **values)
{
  MEMORY[0x24BDBC418](theSet, values);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x24BDBC578](alloc, cStr, *(_QWORD *)&encoding, contentsDeallocator);
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

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
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

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x24BDAD200](a1, a2);
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

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x24BDADF20](object);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

char *__cdecl if_indextoname(unsigned int a1, char *a2)
{
  return (char *)MEMORY[0x24BDAE850](*(_QWORD *)&a1, a2);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x24BDAE8B0](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

size_t malloc_good_size(size_t size)
{
  return MEMORY[0x24BDAED38](size);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_release(void *object)
{
  MEMORY[0x24BDAF3F0](object);
}

void *__cdecl os_retain(void *object)
{
  return (void *)MEMORY[0x24BDAF3F8](object);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x24BDAFED0](a1, a2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x24BDAFF10](__s1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x24BDB0448](__str, __size, __format, a4);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x24BDB0638](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB0640](objects, count);
}

xpc_object_t xpc_array_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x24BDB0648]();
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x24BDB0660](xarray);
}

const void *__cdecl xpc_array_get_data(xpc_object_t xarray, size_t index, size_t *length)
{
  return (const void *)MEMORY[0x24BDB0668](xarray, index, length);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x24BDB06A0](xarray, index);
}

void xpc_array_set_data(xpc_object_t xarray, size_t index, const void *bytes, size_t length)
{
  MEMORY[0x24BDB06A8](xarray, index, bytes, length);
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
  MEMORY[0x24BDB06C0](xarray, index, string);
}

void xpc_array_set_uint64(xpc_object_t xarray, size_t index, uint64_t value)
{
  MEMORY[0x24BDB06C8](xarray, index, value);
}

void xpc_connection_activate(xpc_connection_t connection)
{
  MEMORY[0x24BDB0710](connection);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x24BDB0740](name, targetq, flags);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x24BDB07B0](connection, message, replyq, handler);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x24BDB07C8](connection, handler);
}

xpc_object_t xpc_copy(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x24BDB0800](object);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x24BDB0820](object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x24BDB08D0]();
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x24BDB0918](xdict, key, length);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0928](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0958](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x24BDB0978](xdict, key, value);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x24BDB0988](xdict, key, bytes, length);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x24BDB09D0](xdict, key, value);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x24BDB09E0](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x24BDB0A88](xint);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x24BDB0AE0](object);
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x24BDB0AE8](object);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x24BDB0BA8](xstring);
}

