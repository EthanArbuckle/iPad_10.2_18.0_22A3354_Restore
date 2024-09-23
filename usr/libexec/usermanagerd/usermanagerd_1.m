uint64_t sub_1000A62E0(int a1, char *a2)
{
  uint64_t v3;
  mach_port_t v4;
  uint64_t v5;
  rsize_t v6;
  rsize_t __n;
  _BYTE __s[4096];
  uint64_t input;

  v3 = 3758097090;
  input = a1;
  bzero(__s, 0x1000uLL);
  __n = 4096;
  v4 = sub_10009957C();
  if (!v4)
  {
    fprintf(__stdoutp, "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_get_internal_state", ":", 3405, "", 0, "", "");
    v3 = 3758097084;
    goto LABEL_11;
  }
  if (!a2)
  {
LABEL_11:
    v6 = 4096;
    goto LABEL_9;
  }
  v5 = IOConnectCallMethod(v4, 0x8Eu, &input, 1u, 0, 0, 0, 0, __s, &__n);
  v6 = __n;
  if ((_DWORD)v5)
  {
    v3 = v5;
  }
  else if (__n - 4097 >= 0xFFFFFFFFFFFFF000)
  {
    if (sub_1000AAF90((uint64_t)__s, __n, a2))
      v3 = 3758097090;
    else
      v3 = 0;
    v6 = __n;
  }
LABEL_9:
  memset_s(__s, v6, 0, v6);
  return v3;
}

uint64_t sub_1000A6458(const void *a1, size_t a2, void *a3, size_t *a4)
{
  uint64_t result;
  mach_port_t v9;
  size_t v10;
  uint64_t input;

  input = 266;
  result = 3758097090;
  if (a3 && a4)
  {
    v9 = sub_10009957C();
    if (v9)
    {
      v10 = *a4;
      result = IOConnectCallMethod(v9, 0x68u, &input, 1u, a1, a2, 0, 0, a3, &v10);
      if (!(_DWORD)result)
        *a4 = (int)v10;
    }
    else
    {
      fprintf(__stdoutp, "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_fairplay_wrap", ":", 3431, "", 0, "", "");
      return 3758097084;
    }
  }
  return result;
}

uint64_t sub_1000A657C(unsigned int a1, const void *a2, size_t a3, void *a4, size_t *a5)
{
  uint64_t result;
  mach_port_t v10;
  size_t v11;
  uint64_t input;

  input = ((unint64_t)a1 << 8) | 1;
  result = 3758097090;
  if (a4 && a5)
  {
    v10 = sub_10009957C();
    if (v10)
    {
      v11 = *a5;
      result = IOConnectCallMethod(v10, 0x68u, &input, 1u, a2, a3, 0, 0, a4, &v11);
      if (!(_DWORD)result)
        *a5 = (int)v11;
    }
    else
    {
      fprintf(__stdoutp, "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "_fairplay_generate_csk_internal", ":", 3455, "", 0, "", "");
      return 3758097084;
    }
  }
  return result;
}

uint64_t sub_1000A66A8(const void *a1, size_t a2, void *a3, size_t *a4)
{
  return sub_1000A657C(0, a1, a2, a3, a4);
}

uint64_t sub_1000A66C0(const void *a1, size_t a2, void *a3, size_t *a4)
{
  return sub_1000A657C(1u, a1, a2, a3, a4);
}

uint64_t sub_1000A66D8(uint64_t a1, const void *a2, size_t a3, _QWORD *a4, _QWORD *a5)
{
  mach_port_t v10;
  uint64_t v11;
  size_t v12;
  void *v13;
  uint64_t v14;
  size_t v16;
  uint64_t input[2];
  _BYTE __s[16384];
  _OWORD v19[3];

  memset(v19, 0, 44);
  bzero(__s, 0x4000uLL);
  v16 = 0x4000;
  input[0] = 1;
  input[1] = a1;
  v10 = sub_10009957C();
  if (v10)
  {
    v11 = IOConnectCallMethod(v10, 0x87u, input, 2u, a2, a3, 0, 0, __s, &v16);
    if ((_DWORD)v11)
    {
      v14 = v11;
    }
    else
    {
      if (v16 >= 0x2C)
        v12 = 44;
      else
        v12 = v16;
      __memcpy_chk(v19, __s, v12, 44);
      *a5 = 44;
      v13 = calloc(0x2CuLL, 1uLL);
      *a4 = v13;
      if (v13)
      {
        __memcpy_chk(v13, v19, *a5, 44);
        v14 = 0;
      }
      else
      {
        v14 = 3758097085;
      }
    }
  }
  else
  {
    v14 = 3758097084;
    fprintf(__stdoutp, "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_bak_get_beacon_internal", ":", 3491, "", 0, "", "");
  }
  memset_s(__s, 0x4000uLL, 0, 0x4000uLL);
  return v14;
}

uint64_t sub_1000A68A8(int a1, unsigned int a2, const void *a3, size_t a4, _QWORD *a5, _QWORD *a6, _QWORD *a7)
{
  uint64_t v10;
  void *v11;
  __int128 v12;
  uint64_t v13;
  _OWORD *v14;
  uint64_t v15;
  _OWORD *v17;
  rsize_t __n[6];

  v17 = 0;
  memset(__n, 0, 44);
  v10 = sub_1000A66D8(a1 ^ 1u | ((unint64_t)a2 << 16), a3, a4, &v17, __n);
  if ((_DWORD)v10)
  {
    v15 = v10;
    v11 = v17;
    goto LABEL_10;
  }
  v11 = v17;
  if (__n[0] != 44)
  {
    v15 = 3758604312;
LABEL_10:
    if (!v11)
      return v15;
    goto LABEL_6;
  }
  v12 = v17[1];
  *(_OWORD *)&__n[1] = *v17;
  *(_OWORD *)&__n[3] = v12;
  LODWORD(__n[5]) = *((_DWORD *)v17 + 8);
  v13 = *(_QWORD *)((char *)v17 + 36);
  v14 = calloc(0x1CuLL, 1uLL);
  *a5 = v14;
  if (v14)
  {
    *a6 = 28;
    *v14 = *(_OWORD *)&__n[2];
    *(_OWORD *)((char *)v14 + 12) = *(_OWORD *)((char *)&__n[3] + 4);
    v15 = 0;
    if (a7)
      *a7 = v13;
  }
  else
  {
    v15 = 3758097085;
  }
LABEL_6:
  memset_s(v11, __n[0], 0, __n[0]);
  free(v11);
  return v15;
}

uint64_t sub_1000A69E8(uint64_t a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5)
{
  mach_port_t v9;
  uint64_t v10;
  uint64_t v11;
  size_t v12;
  _QWORD *v13;
  __int128 v14;
  __int128 v15;
  _OWORD *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  size_t v25;
  _BYTE __s[16384];
  _QWORD v27[6];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  int v37;
  uint64_t input[2];

  input[0] = 2;
  input[1] = a1;
  v37 = 0;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v28 = 0u;
  memset(v27, 0, sizeof(v27));
  bzero(__s, 0x4000uLL);
  v25 = 0x4000;
  v9 = sub_10009957C();
  if (v9)
  {
    v10 = IOConnectCallMethod(v9, 0x87u, input, 2u, 0, 0, 0, 0, __s, &v25);
    if ((_DWORD)v10)
    {
      v11 = v10;
    }
    else
    {
      v11 = 3758097085;
      if (v25 >= 0xC4)
        v12 = 196;
      else
        v12 = v25;
      __memcpy_chk(v27, __s, v12, 196);
      v13 = calloc(0x28uLL, 1uLL);
      *a2 = v13;
      if (v13)
      {
        *a3 = 40;
        v14 = *(_OWORD *)&v27[1];
        v15 = *(_OWORD *)&v27[3];
        v13[4] = v27[5];
        *(_OWORD *)v13 = v14;
        *((_OWORD *)v13 + 1) = v15;
        v16 = calloc(0x91uLL, 1uLL);
        *a4 = v16;
        if (v16)
        {
          v11 = 0;
          *a5 = 145;
          v17 = v29;
          *v16 = v28;
          v16[1] = v17;
          v18 = v30;
          v19 = v31;
          v20 = v33;
          v16[4] = v32;
          v16[5] = v20;
          v16[2] = v18;
          v16[3] = v19;
          v21 = v34;
          v22 = v35;
          v23 = v36;
          *((_BYTE *)v16 + 144) = v37;
          v16[7] = v22;
          v16[8] = v23;
          v16[6] = v21;
        }
      }
    }
  }
  else
  {
    fprintf(__stdoutp, "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_bak_get_swizzler_internal", ":", 3551, "", 0, "", "");
    v11 = 3758097084;
  }
  memset_s(__s, 0x4000uLL, 0, 0x4000uLL);
  memset_s(v27, 0xC4uLL, 0, 0xC4uLL);
  return v11;
}

uint64_t sub_1000A6C38(_QWORD *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4)
{
  return sub_1000A69E8(0, a1, a2, a3, a4);
}

uint64_t sub_1000A6C50(uint64_t a1)
{
  mach_port_t v2;

  v2 = sub_10009B514();
  if (v2)
    return IOConnectCallMethod(v2, 0xCu, 0, 0, *(const void **)a1, *(_QWORD *)(a1 + 8), 0, 0, 0, 0);
  else
    return 3758097084;
}

uint64_t sub_1000A6CA8(_QWORD *a1, size_t *a2)
{
  mach_port_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  size_t v8;
  size_t __count;
  _BYTE __src[16384];

  bzero(__src, 0x4000uLL);
  __count = 0x4000;
  v4 = sub_10009957C();
  if (v4)
  {
    v5 = 3758097090;
    if (a1 && a2)
    {
      v6 = IOConnectCallMethod(v4, 0x96u, 0, 0, 0, 0, 0, 0, __src, &__count);
      if ((_DWORD)v6)
      {
        v5 = v6;
      }
      else
      {
        v7 = calloc(__count, 1uLL);
        *a1 = v7;
        if (v7)
        {
          v8 = __count;
          *a2 = __count;
          memcpy(v7, __src, v8);
          v5 = 0;
        }
        else
        {
          v5 = 3758097085;
        }
      }
    }
  }
  else
  {
    fprintf(__stdoutp, "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_get_dsme_key", ":", 3600, "", 0, "", "");
    v5 = 3758097084;
  }
  memset_s(__src, 0x4000uLL, 0, 0x4000uLL);
  return v5;
}

BOOL sub_1000A6E34(uint64_t a1, uint64_t a2)
{
  return a2 == 4 || a2 == 32;
}

uint64_t sub_1000A6E48()
{
  mach_port_t v0;

  v0 = sub_10009957C();
  if (v0)
    return IOConnectCallMethod(v0, 0x73u, 0, 0, 0, 0, 0, 0, 0, 0);
  fprintf(__stdoutp, "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_prewarm_sps", ":", 3627, "", 0, "", "");
  return 3758097084;
}

uint64_t sub_1000A6EEC(uint64_t a1, unsigned int a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
  mach_port_t v9;
  mach_port_t v10;
  int v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  int v16;
  size_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;

  v4 = 4294967285;
  if (a3 && a4 <= 0x30)
  {
    v4 = 3758097084;
    v9 = sub_10009957C();
    if (v9)
    {
      v10 = v9;
      v11 = ccder_sizeof_raw_octet_string(16);
      v12 = a2;
      v13 = ccder_sizeof_uint64(a2);
      v14 = ccder_sizeof_raw_octet_string(a4);
      v15 = ccder_sizeof(0x2000000000000010, (v13 + v11 + v14));
      v16 = v15;
      v17 = v15;
      __chkstk_darwin(v15);
      v19 = (char *)&v25 - v18;
      bzero((char *)&v25 - v18, v17);
      v20 = &v19[v16];
      v21 = ccder_encode_raw_octet_string(a4, a3, v19, v20);
      v22 = ccder_encode_uint64(v12, v19, v21);
      v23 = ccder_encode_raw_octet_string(16, a1, v19, v22);
      if ((char *)ccder_encode_constructed_tl(0x2000000000000010, v20, v19, v23) == v19)
        return IOConnectCallMethod(v10, 0x72u, 0, 0, v19, v17, 0, 0, 0, 0);
      else
        return 3758097090;
    }
    else
    {
      fprintf(__stdoutp, "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_sealed_hashes_set", ":", 3644, "", 0, "", "");
    }
  }
  return v4;
}

uint64_t sub_1000A70FC(const void *a1, size_t a2)
{
  mach_port_t v4;

  v4 = sub_10009957C();
  if (v4)
    return IOConnectCallMethod(v4, 0x90u, 0, 0, a1, a2, 0, 0, 0, 0);
  fprintf(__stdoutp, "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_measure_and_seal_cryptex_manifest", ":", 3674, "", 0, "", "");
  return 3758097084;
}

uint64_t sub_1000A71B0()
{
  mach_port_t v0;

  v0 = sub_10009957C();
  if (v0)
    return IOConnectCallMethod(v0, 0x95u, 0, 0, 0, 0, 0, 0, 0, 0);
  fprintf(__stdoutp, "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_seal_cryptex_manifest_lock", ":", 3688, "", 0, "", "");
  return 3758097084;
}

uint64_t sub_1000A7254(int a1, uint64_t a2, uint64_t a3)
{
  mach_port_t v3;
  uint64_t input[3];

  input[0] = a1;
  input[1] = a2;
  input[2] = a3;
  v3 = sub_10009957C();
  if (v3)
    return IOConnectCallMethod(v3, 0x85u, input, 3u, 0, 0, 0, 0, 0, 0);
  fprintf(__stdoutp, "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_lkgp_recover", ":", 3704, "", 0, "", "");
  return 3758097084;
}

uint64_t sub_1000A7330(int a1)
{
  mach_port_t v1;
  uint64_t input;

  input = a1;
  v1 = sub_10009957C();
  if (v1)
    return IOConnectCallMethod(v1, 0x8Au, &input, 1u, 0, 0, 0, 0, 0, 0);
  fprintf(__stdoutp, "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_memento_efface_blob", ":", 3720, "", 0, "", "");
  return 3758097084;
}

uint64_t sub_1000A7408(int a1, _BYTE *a2)
{
  mach_port_t v3;
  uint64_t v4;
  rsize_t v5;
  uint64_t v6;
  rsize_t __n;
  _BYTE __s[4096];
  uint64_t input;

  input = a1;
  bzero(__s, 0x1000uLL);
  __n = 4096;
  v3 = sub_10009957C();
  if (v3)
  {
    v4 = IOConnectCallMethod(v3, 0x8Bu, &input, 1u, 0, 0, 0, 0, __s, &__n);
    v5 = __n;
    if ((_DWORD)v4)
    {
      v6 = v4;
    }
    else
    {
      v6 = 3758097090;
      if (__n - 4097 >= 0xFFFFFFFFFFFFF000)
      {
        if (sub_1000AB1F4((uint64_t)__s, __n, a2))
          v6 = 3758097090;
        else
          v6 = 0;
        v5 = __n;
      }
    }
  }
  else
  {
    fprintf(__stdoutp, "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_memento_get_state", ":", 3738, "", 0, "", "");
    v6 = 3758097084;
    v5 = 4096;
  }
  memset_s(__s, v5, 0, v5);
  return v6;
}

uint64_t sub_1000A7584()
{
  mach_port_t v0;
  uint64_t input;

  v0 = sub_10009957C();
  if (v0)
    return IOConnectCallMethod(v0, 0x89u, &input, 0, 0, 0, 0, 0, 0, 0);
  fprintf(__stdoutp, "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_set_jcop_supports_updated_kud_policy", ":", 3758, "", 0, "", "");
  return 3758097084;
}

uint64_t sub_1000A7628(uint64_t a1)
{
  mach_port_t v1;
  uint64_t input;

  input = a1;
  v1 = sub_10009957C();
  if (v1)
    return IOConnectCallMethod(v1, 0x97u, &input, 1u, 0, 0, 0, 0, 0, 0);
  fprintf(__stdoutp, "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_set_cx_window", ":", 3774, "", 0, "", "");
  return 3758097084;
}

uint64_t sub_1000A76FC(_QWORD *a1)
{
  mach_port_t v2;
  mach_port_t v3;
  uint64_t result;
  size_t v5;
  _QWORD outputStruct[512];

  v5 = 4096;
  if (!a1)
    return 4294967285;
  v2 = sub_10009957C();
  if (v2)
  {
    v3 = v2;
    bzero(outputStruct, 0x1000uLL);
    result = IOConnectCallMethod(v3, 0x98u, 0, 0, 0, 0, 0, 0, outputStruct, &v5);
    if (!(_DWORD)result)
    {
      if (v5 == 8)
      {
        result = 0;
        *a1 = outputStruct[0];
      }
      else
      {
        return 3758604298;
      }
    }
  }
  else
  {
    fprintf(__stdoutp, "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n", "aks", "", "", "", "aks_get_cx_window", ":", 3791, "", 0, "", "");
    return 3758097084;
  }
  return result;
}

uint64_t sub_1000A7850()
{
  return 0;
}

uint64_t sub_1000A785C(uint64_t a1)
{
  uint64_t v2;
  _OWORD v4[2];

  memset(v4, 0, sizeof(v4));
  v2 = ccsha256_di(a1);
  ccdigest(v2, 16, a1, v4);
  return LODWORD(v4[0]);
}

unint64_t sub_1000A78CC(unsigned int a1)
{
  mach_timebase_info info;

  info = 0;
  mach_timebase_info(&info);
  return 1000000000 * info.denom * (unint64_t)a1 / info.numer;
}

unint64_t sub_1000A7914(uint64_t a1)
{
  mach_timebase_info info;

  info = 0;
  mach_timebase_info(&info);
  return (unint64_t)info.numer * a1 / info.denom;
}

uint64_t sub_1000A7950()
{
  mach_timebase_info info;

  info = 0;
  mach_timebase_info(&info);
  return mach_continuous_time() * info.numer / info.denom / 0x3E8;
}

__darwin_time_t sub_1000A79A0()
{
  timeval v1;

  v1.tv_sec = 0;
  *(_QWORD *)&v1.tv_usec = 0;
  gettimeofday(&v1, 0);
  return v1.tv_sec;
}

uint64_t sub_1000A79CC(uint64_t a1)
{
  return 1000000 * a1;
}

unint64_t sub_1000A79DC(uint64_t a1)
{
  return (a1 + 999999) / 0xF4240uLL;
}

_QWORD *sub_1000A79F4(unsigned int a1, unsigned int a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v5;
  _QWORD *v6;
  size_t v7;
  void *v8;

  v2 = a1 + 1;
  v3 = v2 << 31 >> 31;
  if (v3 != v2 || v3 < 0)
  {
    fprintf(__stdoutp, "%s%s:%s%s%s%s%u:%s%u:%s overflow%s\n", "aks", "", "", "", "circular_queue_init", ":", 341, "", 0, "", "");
    return 0;
  }
  else
  {
    v5 = calloc(0x20uLL, 1uLL);
    v6 = v5;
    if (v5)
    {
      v5[1] = 0;
      v7 = (v3 & 0x1FFFFFFFFLL) * a2;
      *(_DWORD *)v5 = a2;
      *((_DWORD *)v5 + 1) = v2;
      v8 = calloc(v7, 1uLL);
      v6[2] = v7;
      v6[3] = v8;
    }
  }
  return v6;
}

uint64_t sub_1000A7AD0(_DWORD *a1)
{
  unsigned int v2;
  unsigned int v3;
  uint64_t result;

  v3 = a1[2];
  v2 = a1[3];
  result = v2 - v3;
  if (v2 < v3)
    return (result + a1[1]);
  return result;
}

uint64_t sub_1000A7AEC(unsigned int *a1, const void *a2)
{
  unsigned int v3;
  unsigned int v4;

  v3 = a1[3];
  v4 = (v3 + 1) % a1[1];
  memcpy((void *)(*((_QWORD *)a1 + 3) + *a1 * v3), a2, *a1);
  a1[3] = v4;
  if (v4 == a1[2])
    a1[2] = (v4 + 1) % a1[1];
  return 0;
}

uint64_t sub_1000A7B54(unsigned int *a1, void *__dst)
{
  unsigned int v2;
  uint64_t result;

  v2 = a1[2];
  if (v2 == a1[3])
    return 0xFFFFFFFFLL;
  if (__dst)
  {
    memcpy(__dst, (const void *)(*((_QWORD *)a1 + 3) + *a1 * v2), *a1);
    v2 = a1[2];
  }
  memset_s((void *)(*((_QWORD *)a1 + 3) + *a1 * v2), *a1, 0, *a1);
  result = 0;
  a1[2] = (a1[2] + 1) % a1[1];
  return result;
}

uint64_t sub_1000A7BDC(unsigned int *a1, void *__dst)
{
  unsigned int v2;

  v2 = a1[2];
  if (v2 == a1[3])
    return 0xFFFFFFFFLL;
  memcpy(__dst, (const void *)(*((_QWORD *)a1 + 3) + *a1 * v2), *a1);
  return 0;
}

uint64_t sub_1000A7C20(int *a1, _QWORD *a2, unsigned int *a3)
{
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  char *v10;
  char *v11;
  unsigned int v12;
  unsigned int v13;
  const void *v14;
  size_t v15;
  uint64_t result;
  unsigned int v17;
  unsigned int v18;
  int v19;

  v7 = a1[2];
  v6 = a1[3];
  v8 = v6 - v7;
  if (v6 < v7)
    v8 += a1[1];
  if (!v8)
    return 0;
  v9 = *a1 * v8;
  v10 = (char *)calloc(v9, 1uLL);
  if (!v10)
    return 0xFFFFFFFFLL;
  v11 = v10;
  v12 = a1[2];
  v13 = a1[3];
  if (v13 <= v12)
  {
    if (v12 <= v13)
      goto LABEL_13;
    v17 = a1[1] - v12;
    memcpy(v10, (const void *)(*((_QWORD *)a1 + 3) + *a1 * v12), *a1 * v17);
    if (v8 <= v17)
      goto LABEL_13;
    v10 = &v11[*a1 * v17];
    v14 = (const void *)*((_QWORD *)a1 + 3);
    v15 = *a1 * (v8 - v17);
  }
  else
  {
    v14 = (const void *)(*((_QWORD *)a1 + 3) + *a1 * v12);
    v15 = *a1 * v8;
  }
  memcpy(v10, v14, v15);
LABEL_13:
  v18 = a1[1];
  v19 = *a1;
  a1[2] = (a1[2] + v8) % v18;
  memset_s(*((void **)a1 + 3), v19 * v18, 0, v19 * v18);
  result = 0;
  *a2 = v11;
  *a3 = v9;
  return result;
}

uint64_t sub_1000A7D48(uint64_t a1)
{
  rsize_t v1;

  *(_QWORD *)(a1 + 8) = 0;
  v1 = (*(_DWORD *)a1 * *(_DWORD *)(a1 + 4));
  return memset_s(*(void **)(a1 + 24), v1, 0, v1);
}

void sub_1000A7D68(void *a1)
{
  rsize_t v2;

  *((_QWORD *)a1 + 1) = 0;
  v2 = (*(_DWORD *)a1 * *((_DWORD *)a1 + 1));
  memset_s(*((void **)a1 + 3), v2, 0, v2);
  memset_s(*((void **)a1 + 3), *((_QWORD *)a1 + 2), 0, *((_QWORD *)a1 + 2));
  free(*((void **)a1 + 3));
  memset_s(a1, 0x20uLL, 0, 0x20uLL);
  free(a1);
}

uint64_t sub_1000A7DD0(unsigned int a1)
{
  return (a1 >> 5) & 1;
}

BOOL sub_1000A7DD8(uint8x16_t *a1)
{
  int8x16_t v1;
  int8x16_t v2;
  int8x16_t v3;

  v1 = (int8x16_t)vmovl_high_u8(*a1);
  v2 = (int8x16_t)vmovl_u8(*(uint8x8_t *)a1->i8);
  v3 = (int8x16_t)vmovl_u16((uint16x4_t)vorr_s8(vorr_s8(*(int8x8_t *)v2.i8, *(int8x8_t *)v1.i8), vorr_s8((int8x8_t)*(_OWORD *)&vextq_s8(v2, v2, 8uLL), (int8x8_t)*(_OWORD *)&vextq_s8(v1, v1, 8uLL))));
  return vorr_s8(*(int8x8_t *)v3.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v3, v3, 8uLL)) != 0;
}

BOOL sub_1000A7E1C(unsigned __int8 *a1, uint64_t a2)
{
  int v2;
  int v3;

  if (!a2)
    return 0;
  v2 = 0;
  do
  {
    v3 = *a1++;
    v2 |= v3;
    --a2;
  }
  while (a2);
  return v2 != 0;
}

_DWORD *sub_1000A7E48(_DWORD *result)
{
  if (result)
    return (_DWORD *)(*result != 0);
  return result;
}

uint64_t sub_1000A7E5C(char a1, int a2)
{
  return a1 & 0x1F | (32 * a2);
}

uint64_t sub_1000A7E64(unsigned int a1)
{
  return (a1 >> 6) & 1;
}

uint64_t sub_1000A7E6C(int a1)
{
  return a1 & 0xFFFFFFBF;
}

uint64_t sub_1000A7E74(int a1)
{
  return a1 | 0x40u;
}

uint64_t sub_1000A7E7C(char a1)
{
  char v1;

  v1 = a1 & 0x1F;
  if ((a1 & 0x1Fu) >= 0x14)
    v1 = -1;
  return ((a1 & 0x1Fu) < 0x14) & (0xC3FC0u >> v1);
}

uint64_t sub_1000A7EA4(char a1)
{
  if ((a1 & 0x1Fu) > 0x13)
    return 0xFFFFFFFFLL;
  else
    return a1 & 0x1F;
}

uint64_t sub_1000A7EB4(char a1)
{
  unsigned int v1;

  v1 = a1 & 0x1F;
  if (v1 > 0x13)
    v1 = -1;
  return (v1 < 0x12) & (0x2E03Eu >> v1);
}

uint64_t sub_1000A7EDC(char a1)
{
  return a1 & 0xF;
}

BOOL sub_1000A7EE4(int a1, int a2)
{
  return ((a2 ^ a1) & 0xF) == 0;
}

uint64_t sub_1000A7EF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return cc_cmp_safe(a3, a1, a2);
}

uint64_t sub_1000A7F08(const char *a1, uint64_t a2, unint64_t a3)
{
  unint64_t v3;
  const char *v4;
  FILE **v5;
  unint64_t v6;
  FILE **v7;
  uint64_t v8;
  unsigned __int8 *v9;
  char *v10;
  uint64_t v11;
  int v12;
  unint64_t v15;
  char __str[16];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  char v24;

  v3 = a3;
  v4 = a1;
  v24 = 0;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  *(_OWORD *)__str = 0u;
  v17 = 0u;
  v5 = &__stdoutp;
  if (a3 >= 0x41)
  {
    fprintf(__stdoutp, "%s%s:%s%s%s%s%u:%s%u:%s %sdump %s (len = %zd)%s%s\n", "aks", "", "", "", "dump_bytes_internal", ":", 786, "", 0, "", "", a1, a3, "", "");
    v4 = "";
  }
  else if (!a3)
  {
    return memset_s(__str, 0x81uLL, 0, 0x81uLL);
  }
  v6 = 0;
  v15 = v3;
  do
  {
    v7 = v5;
    if (v3 - v6 >= 0x40)
      v8 = 64;
    else
      v8 = v3 - v6;
    if (v8)
    {
      v9 = (unsigned __int8 *)(a2 + v6);
      v10 = __str;
      v11 = v8;
      do
      {
        v12 = *v9++;
        snprintf(v10, 3uLL, "%02x", v12);
        v10 += 2;
        --v11;
      }
      while (v11);
    }
    v5 = v7;
    fprintf(*v7, "%s%s:%s%s%s%s%u:%s%u:%s %s%s%s[%04zu,%04zu): %s%s%s%s\n", "aks", "", "", "", "dump_bytes_internal", ":", 796, "", 0, "", "", v4, "", v6, v8 + v6, "", __str,
      "",
      "");
    v6 += v8;
    v3 = v15;
  }
  while (v6 < v15);
  return memset_s(__str, 0x81uLL, 0, 0x81uLL);
}

_BYTE *sub_1000A80E4(unsigned __int8 *a1, unint64_t a2)
{
  uint64_t v2;
  char *v4;
  uint64_t v5;
  int v6;

  if (a2 >= 0x10)
    v2 = 16;
  else
    v2 = a2;
  if (v2)
  {
    v4 = byte_1000E0288;
    v5 = v2;
    do
    {
      v6 = *a1++;
      snprintf(v4, 3uLL, "%02x", v6);
      v4 += 2;
      --v5;
    }
    while (v5);
  }
  byte_1000E0288[2 * v2] = 0;
  return byte_1000E0288;
}

uint64_t sub_1000A8174(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[2];
  _OWORD __s[2];

  memset(__s, 0, sizeof(__s));
  v10[0] = 0x101010101010101;
  v10[1] = 0x101010101010101;
  if (a4 == 3)
  {
    v7 = ccsha256_di(a1);
    cchmac(v7, a2 >> 1, a1, 16, v10, __s);
    v8 = 0;
    *(_WORD *)a3 = __s[0];
    *(_BYTE *)(a3 + 2) = BYTE2(__s[0]);
  }
  else
  {
    v8 = 0xFFFFFFFFLL;
  }
  memset_s(__s, 0x20uLL, 0, 0x20uLL);
  return v8;
}

uint64_t sub_1000A823C(const char *a1, uint64_t a2, unint64_t a3)
{
  __int16 v5;
  char v6;

  v6 = 0;
  v5 = 0;
  sub_1000A8174(a2, a3, (uint64_t)&v5, 3);
  return sub_1000A7F08(a1, (uint64_t)&v5, 3uLL);
}

char *sub_1000A8290(char *result, unint64_t a2)
{
  unint64_t v2;
  char *v3;
  char v4;

  if (a2 >= 2)
  {
    v2 = a2 >> 1;
    v3 = &result[a2 - 1];
    do
    {
      v4 = *result;
      *result++ = *v3;
      *v3-- = v4;
      --v2;
    }
    while (v2);
  }
  return result;
}

uint64_t sub_1000A82C0(unsigned __int8 *a1, unint64_t a2, _QWORD *a3, unint64_t *a4)
{
  uint64_t v5;
  unsigned __int8 *v6;
  unint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  int v13;
  unsigned int v14;
  unsigned int v15;
  char v16;
  char v17;
  char v18;
  int v19;
  unsigned int v20;
  unsigned int v21;
  char v22;
  char v23;

  v5 = 0xFFFFFFFFLL;
  if ((a2 & 1) == 0)
  {
    v6 = a1;
    if (a1)
    {
      if (a3 && a4)
      {
        v9 = a2 >> 1;
        v10 = calloc(a2 >> 1, 1uLL);
        if (v10)
        {
          if (a2 >= 2)
          {
            if (v9 <= 1)
              v11 = 1;
            else
              v11 = a2 >> 1;
            v12 = v10;
            do
            {
              v13 = *v6;
              v14 = v13 - 48;
              v15 = v13 - 97;
              if ((v13 - 65) >= 6)
                v16 = -1;
              else
                v16 = v13 - 55;
              v17 = v13 - 87;
              if (v15 > 5)
                v17 = v16;
              if (v14 < 0xA)
                v17 = v14;
              v18 = 16 * v17;
              v19 = v6[1];
              v20 = v19 - 48;
              v21 = v19 - 97;
              if ((v19 - 65) >= 6)
                v22 = -1;
              else
                v22 = v19 - 55;
              v23 = v19 - 87;
              if (v21 > 5)
                v23 = v22;
              if (v20 < 0xA)
                v23 = v20;
              *v12++ = v23 | v18;
              v6 += 2;
              --v11;
            }
            while (v11);
          }
          v5 = 0;
          *a3 = v10;
          *a4 = v9;
        }
        else
        {
          return 4294967279;
        }
      }
    }
  }
  return v5;
}

uint64_t sub_1000A83C4(uint64_t result)
{
  if ((_DWORD)result == 0 || result >= 0xFFFFFFDA)
    return dword_1000B24F0[(int)result + 38];
  return result;
}

uint64_t sub_1000A83E0(_QWORD *a1, uint64_t a2, char a3)
{
  uint64_t result;
  size_t v7;
  void *v8;
  const void *v9;

  memset_s(a1, 0x10uLL, 0, 0x10uLL);
  if ((a3 & 1) != 0)
    return 4294967285;
  if (a2 && *(_QWORD *)a2 && (v7 = *(_QWORD *)(a2 + 8)) != 0)
  {
    v8 = calloc(v7, 1uLL);
    if (v8)
    {
      *a1 = v8;
      v9 = *(const void **)a2;
      a1[1] = *(_QWORD *)(a2 + 8);
      memcpy(v8, v9, *(_QWORD *)(a2 + 8));
      return 0;
    }
    else
    {
      return 4294967279;
    }
  }
  else
  {
    result = 0;
    *a1 = 0;
    a1[1] = 0;
  }
  return result;
}

uint64_t sub_1000A8474(uint64_t result, int a2, const char *a3)
{
  if ((result & 1) == 0)
  {
    fprintf(__stdoutp, "%s%s:%s%s%s%s%u:%s%u:%s failed REQUIRE condition (%s:%d)\n%s\n", "aks", "", "", "", "REQUIRE_func", ":", 1047, "", 0, "", a3, a2, "");
    abort();
  }
  return result;
}

uint64_t sub_1000A84E4(_OWORD *a1, _OWORD *a2)
{
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  int __s;
  _OWORD v10[6];
  _OWORD v11[2];

  memset(v11, 0, sizeof(v11));
  sub_1000AC32C((uint64_t)v11, 0x20u);
  cccurve25519_make_pub(a2, v11);
  memset(v10, 0, 32);
  __s = 0x1000000;
  v4 = a2[1];
  v10[2] = *a2;
  v10[3] = v4;
  v5 = a1[1];
  v10[4] = *a1;
  v10[5] = v5;
  v6 = cccurve25519(v10, v11, a1);
  v7 = ccsha256_di(v6);
  ccdigest(v7, 100, &__s, a2 + 2);
  memset_s(&__s, 0x64uLL, 0, 0x64uLL);
  memset_s(v11, 0x20uLL, 0, 0x20uLL);
  return 0;
}

uint64_t sub_1000A85CC(uint64_t a1, uint64_t (*a2)(uint64_t, void *, uint64_t *, uint64_t *, uint64_t), char a3, uint64_t *a4, unsigned int a5, uint64_t a6, unsigned int *a7)
{
  uint64_t v8;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  int v16;
  unsigned int v17;
  _OWORD *v20;
  unsigned int v21;
  uint64_t (*v22)(uint64_t, void *, uint64_t *, uint64_t *, uint64_t);
  uint64_t *v23;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 *v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v36;
  int v37;
  unsigned int v38;
  _OWORD __s[2];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;

  v38 = 0;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  memset(__s, 0, sizeof(__s));
  v8 = 0xFFFFFFFFLL;
  if (!a6 || !a7)
    goto LABEL_46;
  v13 = a1;
  if ((a3 & 0x10) != 0)
    v14 = "SEP derived_key";
  else
    v14 = "derived_key";
  if ((a3 & 0x10) != 0)
    v15 = 16;
  else
    v15 = 12;
  if (!a1)
  {
LABEL_20:
    if (a2)
    {
      if (sub_100099298(a5, &v38))
      {
        if (*a7 < v38)
          goto LABEL_46;
        v20 = 0;
        v21 = 0;
        v22 = a2;
        v23 = a4;
        goto LABEL_44;
      }
    }
    else
    {
      if ((a3 & 4) != 0)
      {
        if ((a5 & 0xF) != 0 || *a7 < a5)
          goto LABEL_46;
        v38 = a5;
        v32 = ccaes_cbc_encrypt_mode(a1);
        sub_1000A8E44(v32, 32, v13 + 8, (uint64_t)&unk_1000E0358, a5 & 0xFFFFFFF0);
LABEL_45:
        v8 = 0;
        *a7 = v38;
        goto LABEL_46;
      }
      v25 = sub_100099298(a5, &v38);
      if ((_DWORD)v25)
      {
        if (*a7 < v38)
          goto LABEL_46;
        if ((a3 & 8) != 0)
        {
          v34 = ccsha256_di(v25);
          cchkdf(v34, 32, v13 + 8, 0, 0, v15, v14, 32, __s);
          v20 = __s;
        }
        else
        {
          v20 = (_OWORD *)(v13 + 8);
        }
        v21 = 32;
        v22 = 0;
        v23 = a4;
LABEL_44:
        if (sub_100098E6C((uint64_t)v20, v21, 0xA6A6A6A6A6A6A6A6, v22, v23, a5, (_QWORD *)a6, &v38))
          goto LABEL_46;
        goto LABEL_45;
      }
    }
    v8 = 4294967285;
    if ((a3 & 8) == 0)
      goto LABEL_48;
    goto LABEL_47;
  }
  v16 = *(_DWORD *)a1;
  if ((*(_DWORD *)a1 - 1) >= 2)
  {
    if (v16)
      goto LABEL_46;
    goto LABEL_20;
  }
  v36 = v14;
  if ((a3 & 4) != 0)
    v17 = 64;
  else
    v17 = 72;
  v38 = v17;
  if (!a2 && a5 == 32 && *a7 >= v17)
  {
    if (v16 == 1)
    {
      a1 = sub_1000A84E4((_OWORD *)(a1 + 36), &v40);
    }
    else
    {
      v26 = *(_OWORD *)(a1 + 20);
      v40 = *(_OWORD *)(a1 + 4);
      v41 = v26;
      v27 = *(_OWORD *)(a1 + 52);
      v42 = *(_OWORD *)(a1 + 36);
      v43 = v27;
    }
    if ((a3 & 0x80) == 0)
    {
      v28 = v41;
      *(_OWORD *)a6 = v40;
      *(_OWORD *)(a6 + 16) = v28;
      if ((a3 & 4) != 0)
      {
        v31 = ccaes_cbc_encrypt_mode(a1);
        sub_1000A8E44(v31, 32, (uint64_t)&v42, (uint64_t)&unk_1000E0358, 0x20uLL);
        goto LABEL_40;
      }
      v37 = 40;
      if ((a3 & 8) != 0)
      {
        v33 = ccsha256_di(a1);
        cchkdf(v33, 32, &v42, 0, 0, v15, v36, 32, __s);
        v30 = (_QWORD *)(a6 + 32);
        v29 = __s;
      }
      else
      {
        v29 = &v42;
        v30 = (_QWORD *)(a6 + 32);
      }
      if (!sub_100098E6C((uint64_t)v29, 0x20u, 0xA6A6A6A6A6A6A6A6, 0, a4, 0x20u, v30, &v37))
      {
LABEL_40:
        v8 = 0;
        *a7 = v17;
        if ((a3 & 8) == 0)
          goto LABEL_48;
        goto LABEL_47;
      }
    }
  }
LABEL_46:
  if ((a3 & 8) != 0)
LABEL_47:
    memset_s(__s, 0x20uLL, 0, 0x20uLL);
LABEL_48:
  memset_s(&v40, 0x40uLL, 0, 0x40uLL);
  return v8;
}

uint64_t sub_1000A8934(_OWORD *a1, uint64_t a2, _OWORD *a3, uint64_t a4)
{
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  int __s;
  _OWORD v11[6];

  memset(v11, 0, 32);
  v5 = a1[1];
  v11[2] = *a1;
  v11[3] = v5;
  v6 = a3[1];
  v11[4] = *a3;
  __s = 0x1000000;
  v11[5] = v6;
  v7 = cccurve25519(v11, a2, a1);
  v8 = ccsha256_di(v7);
  ccdigest(v8, 100, &__s, a4);
  memset_s(&__s, 0x64uLL, 0, 0x64uLL);
  return 0;
}

uint64_t sub_1000A89F0(uint64_t a1, uint64_t (*a2)(_QWORD, void *, unint64_t *, unint64_t *, uint64_t), char a3, _QWORD *a4, unsigned int a5, _QWORD *a6, unsigned int *a7)
{
  uint64_t v8;
  const char *v15;
  uint64_t v16;
  _OWORD *v17;
  unsigned int v18;
  uint64_t (*v19)(_QWORD, void *, unint64_t *, unint64_t *, uint64_t);
  _BOOL8 v20;
  uint64_t v21;
  _QWORD *v22;
  __int128 *p_s;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  __int128 __s;
  __int128 v32;
  _OWORD v33[2];

  HIDWORD(v30) = 0;
  memset(v33, 0, sizeof(v33));
  v8 = 0xFFFFFFFFLL;
  if (a4 && a5)
  {
    if ((a3 & 0x10) != 0)
      v15 = "SEP derived_key";
    else
      v15 = "derived_key";
    if ((a3 & 0x10) != 0)
      v16 = 16;
    else
      v16 = 12;
    if (!a1)
    {
LABEL_12:
      if (a5 <= 0x28)
      {
        if (a2)
        {
          if (sub_1000992F4(a5, (unsigned int *)&v30 + 1) && *a7 >= HIDWORD(v30))
          {
            v17 = 0;
            v18 = 0;
            v19 = a2;
            goto LABEL_36;
          }
        }
        else if ((a3 & 4) != 0)
        {
          if ((a5 & 0xF) == 0 && *a7 >= a5)
          {
            HIDWORD(v30) = a5;
            v24 = ccaes_cbc_decrypt_mode(a1);
            sub_1000A8E44(v24, 32, a1 + 8, (uint64_t)&unk_1000E0358, a5 & 0xFFFFFFF0);
LABEL_37:
            v8 = 0;
            *a7 = HIDWORD(v30);
            goto LABEL_41;
          }
        }
        else
        {
          v20 = sub_1000992F4(a5, (unsigned int *)&v30 + 1);
          if (v20 && *a7 >= HIDWORD(v30))
          {
            if ((a3 & 8) != 0)
            {
              v27 = ccsha256_di(v20);
              ((void (*)(uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, const char *, uint64_t, _OWORD *, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))cchkdf)(v27, 32, a1 + 8, 0, 0, v16, v15, 32, v33, v30, __s, *((_QWORD *)&__s + 1), v32, *((_QWORD *)&v32 + 1));
              v17 = v33;
            }
            else
            {
              v17 = (_OWORD *)(a1 + 8);
            }
            v18 = 32;
            v19 = 0;
LABEL_36:
            if (!sub_100099230((uint64_t)v17, v18, 0xA6A6A6A6A6A6A6A6, v19, a4, a5, a6, (_DWORD *)&v30 + 1))goto LABEL_37;
            goto LABEL_46;
          }
        }
      }
LABEL_44:
      v8 = 4294967285;
      goto LABEL_41;
    }
    if (*(_DWORD *)a1 != 1)
    {
      if (!*(_DWORD *)a1)
        goto LABEL_12;
LABEL_28:
      v8 = 0xFFFFFFFFLL;
      goto LABEL_41;
    }
    HIDWORD(v30) = 32;
    if (*a7 < 0x20)
      goto LABEL_44;
    __s = 0uLL;
    v32 = 0uLL;
    if ((a3 & 4) != 0)
    {
      if (a5 != 64)
        goto LABEL_44;
      v25 = sub_1000A8934(a4, a1 + 4, (_OWORD *)(a1 + 36), (uint64_t)&__s);
      v26 = ccaes_cbc_decrypt_mode(v25);
      sub_1000A8E44(v26, 32, (uint64_t)&__s, (uint64_t)&unk_1000E0358, 0x20uLL);
    }
    else
    {
      if (a5 != 72)
        goto LABEL_44;
      v21 = sub_1000A8934(a4, a1 + 4, (_OWORD *)(a1 + 36), (uint64_t)&__s);
      if (a3 < 0)
        goto LABEL_28;
      LODWORD(v30) = 32;
      if ((a3 & 8) != 0)
      {
        v28 = ccsha256_di(v21);
        ((void (*)(uint64_t, uint64_t, __int128 *, _QWORD, _QWORD, uint64_t, const char *, uint64_t, _OWORD *, uint64_t))cchkdf)(v28, 32, &__s, 0, 0, v16, v15, 32, v33, v30);
        v22 = a4 + 4;
        p_s = v33;
      }
      else
      {
        v22 = a4 + 4;
        p_s = &__s;
      }
      if (sub_100099230((uint64_t)p_s, 0x20u, 0xA6A6A6A6A6A6A6A6, 0, v22, 0x28u, a6, &v30))
      {
        memset_s(&__s, 0x20uLL, 0, 0x20uLL);
LABEL_46:
        v8 = 4294967277;
        goto LABEL_41;
      }
    }
    memset_s(&__s, 0x20uLL, 0, 0x20uLL);
    v8 = 0;
    *a7 = 32;
  }
LABEL_41:
  if ((a3 & 8) != 0)
    memset_s(v33, 0x20uLL, 0, 0x20uLL);
  return v8;
}

uint64_t sub_1000A8D40(_QWORD *a1, _QWORD *a2, size_t *a3)
{
  size_t v6;
  void *v7;
  void *v8;
  uint64_t result;

  v6 = ((unint64_t)(cczp_bitlen(*a1) + 7) >> 2) | 1;
  v7 = calloc(v6, 1uLL);
  if (!v7)
    return 4294967279;
  v8 = v7;
  ccec_export_pub(a1, v7);
  result = 0;
  *a2 = v8;
  *a3 = v6;
  return result;
}

unint64_t sub_1000A8DBC(uint64_t a1)
{
  return (unint64_t)(cczp_bitlen(a1) + 7) >> 3;
}

unint64_t sub_1000A8DDC(uint64_t a1)
{
  return (((unint64_t)(cczp_bitlen(a1) + 7) >> 2) & 0x3FFFFFFFFFFFFFFELL) + 9;
}

unint64_t sub_1000A8E00(_QWORD *a1)
{
  return ((unint64_t)(cczp_bitlen(*a1) + 7) >> 2) | 1;
}

unint64_t sub_1000A8E24(_QWORD *a1)
{
  return (unint64_t)(cczp_bitlen(*a1) + 7) >> 3;
}

uint64_t sub_1000A8E44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  return cccbc_one_shot(a1, a2, a3, a4, a5 >> 4);
}

uint64_t sub_1000A8E4C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  return ccecb_one_shot(a1, a2, a3, a4 >> 4);
}

uint64_t sub_1000A8E54(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  return cccbc_update(a1, a2, a3, a4 >> 4);
}

BOOL sub_1000A8E5C(_QWORD *a1, _QWORD **a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return !ccec_import_pub(a1, a3, a4, a2)
      && ccn_read_uint(*a1, &a2[3 * **a2 + 2], a5, a6) == 0;
}

uint64_t sub_1000A8ED4(_QWORD *a1, _QWORD **a2)
{
  ccn_write_uint_padded(*a1, &a2[3 * **a2 + 2]);
  return 1;
}

uint64_t sub_1000A8F08(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL4 v12;
  char v13;
  char v14;
  _QWORD *v15;

  if (*(_QWORD *)(a5 + 8) >= *(_QWORD *)a5)
  {
    v14 = 0;
  }
  else
  {
    v9 = 0;
    v10 = 0;
    v11 = (uint64_t)a1 + a2;
    while (1)
    {
      v12 = sub_1000A9004(*(const void **)(*(_QWORD *)(a5 + 24) + v9), *(_QWORD *)(*(_QWORD *)(a5 + 24) + v9)+ *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a5 + 24) + v9) + 1)+ 2, a1, v11);
      if (v12)
        break;
      ++v10;
      v9 += 40;
      if (v10 >= *(_QWORD *)a5)
        goto LABEL_10;
    }
    v15 = (_QWORD *)(*(_QWORD *)(a5 + 24) + v9);
    if (v15[1])
    {
      v13 = 0;
      *(_BYTE *)(a5 + 16) = 1;
    }
    else
    {
      ++*(_QWORD *)(a5 + 8);
      v15[1] = a3;
      v15[2] = a3 + a4;
      v15[3] = a3;
      v15[4] = a3 + a4;
      v13 = 1;
    }
LABEL_10:
    v14 = v13 | !v12;
  }
  return v14 & 1;
}

BOOL sub_1000A8FEC(unsigned __int8 *a1, const void *a2, uint64_t a3)
{
  return sub_1000A9004(a1, (uint64_t)&a1[a1[1] + 2], a2, a3);
}

BOOL sub_1000A9004(const void *a1, uint64_t a2, const void *a3, uint64_t a4)
{
  size_t v7;

  v7 = sub_1000A906C((uint64_t)a1, a2);
  return v7 == sub_1000A906C((uint64_t)a3, a4) && memcmp(a1, a3, v7) == 0;
}

uint64_t sub_1000A906C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[0] = a1;
  v6[1] = a2;
  v4 = 0;
  v5 = 0;
  if (ccder_blob_decode_tag(v6, &v5) && ccder_blob_decode_len(v6, &v4))
    return v6[0] + v4 - a1;
  else
    return 0;
}

uint64_t sub_1000A90D0(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[0] = a1;
  v11[1] = a2;
  v9 = 0;
  v10 = 0;
  v8 = 0;
  result = ccder_blob_decode_range(v11, 0x2000000000000011, v11);
  if ((_DWORD)result)
  {
    if (ccder_blob_decode_sequence_tl(v11, &v9))
    {
      while (1)
      {
        v7 = v9;
        result = ccder_blob_decode_tl(&v9, 12, &v8);
        if (!(_DWORD)result)
          break;
        if (v9 - v7 != 2)
          return 0;
        result = a3(v7, v10 - v7, v9 + v8, v10 - (v9 + v8), a4);
        if (!(_DWORD)result)
          return result;
        v11[0] = v10;
        if ((ccder_blob_decode_sequence_tl(v11, &v9) & 1) == 0)
          return 1;
      }
    }
    else
    {
      return 1;
    }
  }
  return result;
}

uint64_t sub_1000A91A4(uint64_t a1, _QWORD *a2, _QWORD *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v12 = 0;
  v13 = 0;
  v10 = a1;
  v11 = 0;
  if (a1)
  {
    sub_1000A90D0(a4, a5, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1000A9210, (uint64_t)&v10);
    if (a2)
    {
      if (a3)
      {
        v7 = v11;
        v8 = v12;
        *a2 = v11;
        *a3 = v8 - v7;
      }
    }
  }
  return v13;
}

BOOL sub_1000A9210(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _BOOL4 v8;

  v8 = sub_1000A9004(*(const void **)a5, *(_QWORD *)a5 + *(unsigned __int8 *)(*(_QWORD *)a5 + 1) + 2, a1, (uint64_t)a1 + a2);
  if (v8)
  {
    *(_BYTE *)(a5 + 24) = 1;
    *(_QWORD *)(a5 + 8) = a3;
    *(_QWORD *)(a5 + 16) = a3 + a4;
  }
  return !v8;
}

uint64_t sub_1000A9270(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (!a4)
    return 0;
  v7 = 0;
  v8 = 0;
  v5 = result;
  v6 = 0;
  if (result)
  {
    sub_1000A90D0(a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1000A9210, (uint64_t)&v5);
    if ((_BYTE)v8)
    {
      *a4 = sub_1000A92E8(v6, v7);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t sub_1000A92E8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unsigned __int8 *v3;
  uint64_t result;
  unsigned int v5;
  _QWORD v6[2];
  uint64_t v7;

  v7 = 0;
  v6[0] = a1;
  v6[1] = a2;
  if (!ccder_blob_decode_tl(v6, 2, &v7))
    return 0;
  v2 = v7;
  if ((unint64_t)(v7 - 9) < 0xFFFFFFFFFFFFFFF8)
    return 0;
  v3 = (unsigned __int8 *)v6[0];
  result = (uint64_t)*(char *)v6[0] >> 7;
  do
  {
    v5 = *v3++;
    result = v5 | (unint64_t)(result << 8);
    --v2;
  }
  while (v2);
  return result;
}

uint64_t sub_1000A9350(uint64_t result, uint64_t a2, uint64_t a3, _QWORD *a4, _QWORD *a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = 0;
  v8 = result;
  v9 = 0;
  if (result)
  {
    sub_1000A90D0(a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1000A9210, (uint64_t)&v8);
    if ((_BYTE)v11 && (v8 = v9, v9 = v10, v12 = 0, v13 = 0, (ccder_blob_decode_range(&v8, 4, &v12) & 1) != 0))
    {
      result = 1;
      if (a4)
      {
        if (a5)
        {
          v7 = (v13 - v12);
          *a4 = v12;
          *a5 = v7;
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

double sub_1000A93EC(__int128 *a1, uint64_t a2, _DWORD *a3, _QWORD *a4)
{
  double result;
  int v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;

  v11 = *a1;
  v9 = 0;
  v10 = 0;
  if (ccder_blob_decode_range(&v11, a2, &v9))
  {
    v8 = v9;
    *a4 = v9;
    *a3 = v10 - v8;
    result = *(double *)&v11;
    *a1 = v11;
  }
  return result;
}

uint64_t sub_1000A9458(uint64_t a1, uint64_t a2, unsigned int (*a3)(uint64_t, _QWORD, uint64_t), uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;

  *(_QWORD *)&v12 = a1;
  *((_QWORD *)&v12 + 1) = a2;
  v6 = ccder_blob_decode_range(&v12, 0x2000000000000010, &v12);
  if ((_DWORD)v6)
  {
    v11 = 0;
    v7 = v12;
    if (sub_1000A9508(&v12, &v10, &v11))
    {
      do
      {
        v8 = v12 + v11;
        if (!a3(v7, v12 + v11 - v7, a4))
          break;
        *(_QWORD *)&v12 = v8;
        v7 = v8;
      }
      while ((sub_1000A9508(&v12, &v10, &v11) & 1) != 0);
    }
  }
  return v6;
}

uint64_t sub_1000A9508(__int128 *a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t result;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;

  v8 = 0;
  v9 = 0;
  v7 = *a1;
  result = ccder_blob_decode_tag(&v7, &v9);
  if ((_DWORD)result)
  {
    result = ccder_blob_decode_len(&v7, &v8);
    if ((_DWORD)result)
    {
      *a1 = v7;
      *a2 = v9;
      *a3 = v8;
      return 1;
    }
  }
  return result;
}

BOOL sub_1000A9584(uint64_t a1, uint64_t a2)
{
  int v2;
  _BOOL8 result;
  _QWORD v4[2];
  uint64_t v5;

  v5 = 0;
  v4[0] = a1;
  v4[1] = a2;
  v2 = ccder_blob_decode_tl(v4, 1, &v5);
  result = 0;
  if (v2)
  {
    if (v5 == 1)
      return *(_BYTE *)v4[0] != 0;
  }
  return result;
}

uint64_t sub_1000A95DC(void **a1)
{
  void *v2;
  void *v3;

  if (!a1)
    return 0xFFFFFFFFLL;
  while (1)
  {
    v2 = *a1;
    if (!*a1)
      break;
    v3 = (void *)*((_QWORD *)v2 + 1);
    *a1 = *(void **)v2;
    if (v3)
    {
      memset_s(v3, *((_QWORD *)v2 + 2), 0, *((_QWORD *)v2 + 2));
      free(*((void **)v2 + 1));
    }
    memset_s(v2, 0x18uLL, 0, 0x18uLL);
    free(v2);
  }
  return 0;
}

uint64_t sub_1000A9654(_QWORD *a1, unsigned __int8 *a2)
{
  _QWORD **v2;
  uint64_t result;
  uint64_t v4;
  _QWORD *i;
  void *v6;

  if (!a1)
    return 0xFFFFFFFFLL;
  v2 = (_QWORD **)a1;
  result = (uint64_t)sub_1000A96E8(a1, a2);
  if (result)
  {
    v4 = result;
    for (i = *v2; i != (_QWORD *)result; i = (_QWORD *)*i)
      v2 = (_QWORD **)i;
    *v2 = *(_QWORD **)result;
    v6 = *(void **)(result + 8);
    if (v6)
    {
      memset_s(v6, *(_QWORD *)(v4 + 16), 0, *(_QWORD *)(v4 + 16));
      free(*(void **)(v4 + 8));
    }
    memset_s((void *)v4, 0x18uLL, 0, 0x18uLL);
    free((void *)v4);
    return 0;
  }
  return result;
}

_QWORD *sub_1000A96E8(_QWORD *a1, unsigned __int8 *a2)
{
  _QWORD *v2;
  uint64_t v4;
  const void *v6;
  uint64_t v7;

  if (!a1)
    return 0;
  v6 = 0;
  v7 = 0;
  v2 = (_QWORD *)*a1;
  if (*a1)
  {
    do
    {
      v4 = v2[1] + v2[2];
      v6 = (const void *)v2[1];
      v7 = v4;
      if (ccder_blob_decode_sequence_tl(&v6, &v6) && sub_1000A9004(a2, (uint64_t)&a2[a2[1] + 2], v6, v7))
        break;
      v2 = (_QWORD *)*v2;
    }
    while (v2);
  }
  return v2;
}

uint64_t sub_1000A9768(_QWORD *a1, unsigned __int8 *a2, int a3, _QWORD *a4, _QWORD *a5)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  v8 = sub_1000A96E8(a1, a2);
  if (!v8)
    return 0;
  v9 = 1;
  if (a4)
  {
    if (a5)
    {
      v10 = v8[1] + v8[2];
      *(_QWORD *)&v17 = v8[1];
      *((_QWORD *)&v17 + 1) = v10;
      v9 = ccder_blob_decode_sequence_tl(&v17, &v17);
      if ((_DWORD)v9)
      {
        if (sub_1000A9844(&v17, 12, 0, 0))
        {
          v11 = v17;
          v15 = 0;
          v16 = 0;
          if (ccder_blob_decode_tag(&v17, &v15))
          {
            if (ccder_blob_decode_len(&v17, &v16))
            {
              v13 = v16;
              v12 = v17;
              if (a3)
              {
                v13 = (v17 + v16 - v11);
                v12 = v11;
              }
              *a4 = v12;
              *a5 = v13;
            }
          }
        }
      }
    }
  }
  return v9;
}

uint64_t sub_1000A9844(__int128 *a1, uint64_t a2, void *a3, int a4)
{
  __int128 v8;
  const void *v9;
  uint64_t v10;
  __int128 v11;

  v11 = *a1;
  v9 = 0;
  v10 = 0;
  if ((ccder_blob_decode_range(&v11, a2, &v9) & 1) == 0)
    return 0;
  v8 = v11;
  if (a3)
  {
    if ((_DWORD)v10 - (_DWORD)v9 == a4)
    {
      memcpy(a3, v9, (v10 - (_DWORD)v9));
      goto LABEL_5;
    }
    return 0;
  }
LABEL_5:
  *a1 = v8;
  return 1;
}

uint64_t sub_1000A98D0(_QWORD *a1, char *__s, void *a3, size_t a4)
{
  unsigned __int8 *v8;
  uint64_t result;
  void *__src;
  uint64_t v11;
  _BYTE v12[2];
  _BYTE v13[127];
  uint64_t v14;

  memset(v13, 0, sizeof(v13));
  v12[0] = 12;
  v12[1] = strlen(__s);
  v8 = (unsigned __int8 *)sub_1000A99F8((uint64_t)v12, (uint64_t)&v14);
  result = 0xFFFFFFFFLL;
  if (a3 && v8)
  {
    __memcpy_chk(v13, __s, v8[1], 127);
    __src = 0;
    v11 = 0;
    if (sub_1000A9768(a1, v8, 0, &__src, &v11))
    {
      if (v11 == a4)
      {
        memcpy(a3, __src, a4);
        return 0;
      }
      else
      {
        return 4294967277;
      }
    }
    else
    {
      return 4294967293;
    }
  }
  return result;
}

uint64_t sub_1000A99F8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD v4[2];
  unint64_t v5;

  v2 = a1;
  v4[1] = a2;
  v5 = 0;
  v4[0] = a1;
  if ((ccder_blob_decode_tl(v4, 12, &v5) & 1) == 0)
  {
    fprintf(__stdoutp, "%s%s:%s%s%s%s%u:%s%u:%s bad 1%s\n", "aks", "", "", "", "der_key_validate");
    return 0;
  }
  if (v5 >= 0x11)
  {
    fprintf(__stdoutp, "%s%s:%s%s%s%s%u:%s%u:%s bad 2%s\n", "aks", "", "", "", "der_key_validate");
    return 0;
  }
  return v2;
}

uint64_t sub_1000A9AF4(_QWORD *a1, unsigned __int8 *a2, uint64_t *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;

  v7 = 0;
  v8 = 0;
  v4 = sub_1000A9768(a1, a2, 1, &v7, &v8);
  v5 = v4;
  if (a3 && (_DWORD)v4)
    *a3 = sub_1000A92E8(v7, v7 + v8);
  return v5;
}

uint64_t sub_1000A9B4C(_QWORD *a1, unsigned __int8 *a2, BOOL *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;

  v7 = 0;
  v8 = 0;
  v4 = sub_1000A9768(a1, a2, 1, &v7, &v8);
  v5 = v4;
  if (a3 && (_DWORD)v4)
    *a3 = sub_1000A9584(v7, v7 + v8);
  return v5;
}

uint64_t sub_1000A9BA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1)
    return sub_1000A90D0(a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1000A9BE0, a1)- 1;
  else
    return 4294967285;
}

uint64_t sub_1000A9BE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  unsigned __int8 *v8;
  uint64_t v9;

  v8 = (unsigned __int8 *)sub_1000A99F8(a1, a1 + a2);
  if (v8)
  {
    v9 = (uint64_t)v8;
    if (!sub_1000A9654(a5, v8) && !sub_1000A9E70(a5, v9, a3, a3 + a4))
      return 1;
  }
  fprintf(__stdoutp, "%s%s:%s%s%s%s%u:%s%u:%s fail%s\n", "aks", "", "", "", "_merge_dict_cb", ":", 647, "", 0, "", "");
  return 0;
}

uint64_t sub_1000A9CAC(_QWORD *a1, _QWORD *a2, size_t *a3)
{
  uint64_t v3;
  _QWORD *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  rsize_t v11;
  char *v12;
  char *v13;
  _QWORD *v14;
  char *v15;
  size_t v16;
  char *v17;
  void *v18;
  unint64_t v19;
  char *v20;
  char *v22;
  char v23;
  char *v25;
  char *v26;

  v3 = 0xFFFFFFFFLL;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        v7 = (_QWORD *)*a1;
        if (*a1)
        {
          v8 = 0;
          v9 = 0;
          v10 = 0;
          do
          {
            v10 += v7[2];
            v7 = (_QWORD *)*v7;
            v9 -= 16;
            --v8;
          }
          while (v7);
          if (v8 >= 0xF000000000000001 && (v11 = -v9, (v12 = (char *)calloc(-v9, 1uLL)) != 0))
          {
            v13 = v12;
            v14 = (_QWORD *)*a1;
            if (*a1)
            {
              v15 = v12;
              do
              {
                *(_OWORD *)v15 = *(_OWORD *)(v14 + 1);
                v15 += 16;
                v14 = (_QWORD *)*v14;
              }
              while (v14);
            }
            qsort(v12, -(uint64_t)v8, 0x10uLL, (int (__cdecl *)(const void *, const void *))sub_1000AC09C);
            v16 = ccder_sizeof(0x2000000000000011, v10);
            v17 = (char *)calloc(v16, 1uLL);
            v18 = v17;
            if (v17)
            {
              v25 = v17;
              v26 = &v17[v16];
              v19 = v8 - 1;
              v20 = &v13[-v9 - 8];
              while (!__CFADD__(v19++, 1))
              {
                v22 = v20 - 16;
                v23 = ccder_blob_encode_body(&v25, *(_QWORD *)v20, *((_QWORD *)v20 - 1));
                v20 = v22;
                if ((v23 & 1) == 0)
                  goto LABEL_16;
              }
              if (!ccder_blob_encode_tl(&v25, 0x2000000000000011, v10) || v25 != v26)
              {
LABEL_16:
                v3 = 0xFFFFFFFFLL;
                goto LABEL_20;
              }
              v3 = 0;
              *a2 = v18;
              *a3 = v16;
              v18 = 0;
            }
            else
            {
              v3 = 4294967279;
            }
LABEL_20:
            memset_s(v13, v11, 0, v11);
            free(v13);
            if (v18)
            {
              memset_s(v18, v16, 0, v16);
              free(v18);
            }
          }
          else
          {
            return 0xFFFFFFFFLL;
          }
        }
      }
    }
  }
  return v3;
}

uint64_t sub_1000A9E70(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  unint64_t v9;
  unint64_t v10;
  size_t v11;
  char *v12;
  char *v13;
  char *v14;
  int v15;
  char *v16;
  int v17;
  char *v18;
  _QWORD *v20;
  _QWORD *v21;
  char *v22;
  char *v23;
  char *v24;
  char *v25;

  result = 0xFFFFFFFFLL;
  if (a1 && a2 && a3 && a4)
  {
    v9 = sub_1000A906C(a3, a4);
    if (v9 <= a4 - a3)
    {
      v10 = v9;
      v11 = ccder_sizeof(0x2000000000000010, v9 + *(unsigned __int8 *)(a2 + 1) + 2);
      v12 = (char *)calloc(v11, 1uLL);
      if (!v12)
        return 4294967279;
      v13 = v12;
      v14 = &v12[v11];
      v22 = v12;
      v23 = &v12[v11];
      if (ccder_blob_encode_body(&v22, v10, a3))
      {
        v24 = v13;
        v25 = v23;
        v15 = ccder_blob_encode_body(&v24, *(unsigned __int8 *)(a2 + 1) + 2, a2);
        v16 = v25;
        if (!v15)
          v16 = 0;
        v24 = v13;
        v25 = v16;
        v17 = ccder_blob_encode_tl(&v24, 0x2000000000000010, v14 - v16);
        v18 = v25;
        if (!v17)
          v18 = 0;
        if (v18 && v18 == v13)
        {
          v20 = calloc(0x18uLL, 1uLL);
          if (v20)
          {
            v21 = v20;
            result = 0;
            v21[1] = v13;
            v21[2] = v11;
            *v21 = *a1;
            *a1 = v21;
            return result;
          }
        }
      }
      memset_s(v13, v11, 0, v11);
      free(v13);
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t sub_1000A9FDC(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  return sub_1000A9E70(a1, a2, a3, a3 + *(unsigned __int8 *)(a3 + 1) + 2);
}

uint64_t sub_1000A9FEC(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  size_t v11;
  char *v12;
  char *v13;
  char *v14;
  int v15;
  char *v16;
  int v17;
  char *v18;
  BOOL v19;
  _QWORD *v20;
  _QWORD *v21;
  char *v22;
  char *v23;
  char *v24;
  char *v25;

  result = 0xFFFFFFFFLL;
  if (a1 && a2 && a3)
  {
    v9 = *(unsigned __int8 *)(a2 + 1);
    v10 = ccder_sizeof(4, a4);
    v11 = ccder_sizeof(0x2000000000000010, v9 + v10 + 2);
    v12 = (char *)calloc(v11, 1uLL);
    if (v12)
    {
      v13 = v12;
      v14 = &v12[v11];
      v22 = v12;
      v23 = &v12[v11];
      if (!ccder_blob_encode_body(&v22, a4, a3) || !ccder_blob_encode_tl(&v22, 4, a4))
        goto LABEL_19;
      v24 = v13;
      v25 = v23;
      v15 = ccder_blob_encode_body(&v24, *(unsigned __int8 *)(a2 + 1) + 2, a2);
      v16 = v25;
      if (!v15)
        v16 = 0;
      v24 = v13;
      v25 = v16;
      v17 = ccder_blob_encode_tl(&v24, 0x2000000000000010, v14 - v16);
      v18 = v25;
      if (!v17)
        v18 = 0;
      v19 = v18 && v18 == v13;
      if (v19 && (v20 = calloc(0x18uLL, 1uLL)) != 0)
      {
        v21 = v20;
        result = 0;
        v21[1] = v13;
        v21[2] = v11;
        *v21 = *a1;
        *a1 = v21;
      }
      else
      {
LABEL_19:
        memset_s(v13, v11, 0, v11);
        free(v13);
        return 0xFFFFFFFFLL;
      }
    }
    else
    {
      return 4294967279;
    }
  }
  return result;
}

uint64_t sub_1000AA158(_QWORD *a1, char *__s, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t result;
  _BYTE v10[2];
  _BYTE v11[127];
  uint64_t v12;

  memset(v11, 0, sizeof(v11));
  v10[0] = 12;
  v10[1] = strlen(__s);
  v8 = sub_1000A99F8((uint64_t)v10, (uint64_t)&v12);
  result = 4294967285;
  if (a3)
  {
    if (v8)
    {
      __memcpy_chk(v11, __s, *(unsigned __int8 *)(v8 + 1), 127);
      return sub_1000A9FEC(a1, v8, a3, a4);
    }
  }
  return result;
}

uint64_t sub_1000AA244(_QWORD *a1, uint64_t a2, int a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  size_t v9;
  char *v10;
  char *v11;
  char *v12;
  int v13;
  char *v14;
  int v15;
  char *v16;
  BOOL v17;
  _QWORD *v18;
  _QWORD *v19;
  char v20;
  char *v21;
  char *v22;
  char *v23;
  char *v24;

  result = 0xFFFFFFFFLL;
  if (a1 && a2)
  {
    v7 = *(unsigned __int8 *)(a2 + 1);
    v8 = ccder_sizeof(1, 1);
    v9 = ccder_sizeof(0x2000000000000010, v7 + v8 + 2);
    v10 = (char *)calloc(v9, 1uLL);
    if (v10)
    {
      v11 = v10;
      v12 = &v10[v9];
      v21 = v10;
      v22 = &v10[v9];
      v20 = a3 << 31 >> 31;
      if (!ccder_blob_encode_body(&v21, 1, &v20) || !ccder_blob_encode_tl(&v21, 1, 1))
        goto LABEL_18;
      v23 = v11;
      v24 = v22;
      v13 = ccder_blob_encode_body(&v23, *(unsigned __int8 *)(a2 + 1) + 2, a2);
      v14 = v24;
      if (!v13)
        v14 = 0;
      v23 = v11;
      v24 = v14;
      v15 = ccder_blob_encode_tl(&v23, 0x2000000000000010, v12 - v14);
      v16 = v24;
      if (!v15)
        v16 = 0;
      v17 = v16 && v16 == v11;
      if (v17 && (v18 = calloc(0x18uLL, 1uLL)) != 0)
      {
        v19 = v18;
        result = 0;
        v19[1] = v11;
        v19[2] = v9;
        *v19 = *a1;
        *a1 = v19;
      }
      else
      {
LABEL_18:
        memset_s(v11, v9, 0, v9);
        free(v11);
        return 0xFFFFFFFFLL;
      }
    }
    else
    {
      return 4294967279;
    }
  }
  return result;
}

uint64_t sub_1000AA3A8(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  size_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  int v19;
  char *v20;
  int v21;
  char *v22;
  BOOL v23;
  _QWORD *v24;
  _QWORD *v25;
  char *v26;
  char *v27;
  char *v28;
  char *v29;
  uint64_t v30;

  v3 = a3;
  v6 = HIBYTE(a3);
  if ((HIBYTE(a3) + 1) > 1u)
  {
    v11 = 8;
  }
  else
  {
    v7 = 9;
    v8 = 48;
    v9 = 1;
    while ((unint64_t)(v7 - 2) >= 2)
    {
      v10 = a3 >> v8;
      --v7;
      v8 -= 8;
      if ((_DWORD)v6 != v10)
      {
        v9 = v7 - 1;
        goto LABEL_8;
      }
    }
    v7 = 2;
LABEL_8:
    if ((((a3 >> (8 * v9 - 8)) ^ v6) & 0x80) != 0)
      v11 = v7;
    else
      v11 = v9;
  }
  v30 = 0;
  result = 0xFFFFFFFFLL;
  if (a1 && a2)
  {
    v13 = *(unsigned __int8 *)(a2 + 1);
    v14 = ccder_sizeof(2, v11);
    v15 = ccder_sizeof(0x2000000000000010, v13 + v14 + 2);
    v16 = (char *)calloc(v15, 1uLL);
    if (v16)
    {
      v17 = v16;
      v18 = v11;
      do
      {
        *((_BYTE *)&v30 + v18 - 1) = v3;
        v3 >>= 8;
        --v18;
      }
      while (v18);
      v26 = v16;
      v27 = &v16[v15];
      if ((ccder_blob_encode_body(&v26, v11, &v30) & 1) == 0 || !ccder_blob_encode_tl(&v26, 2, v11))
        goto LABEL_30;
      v28 = v17;
      v29 = v27;
      v19 = ccder_blob_encode_body(&v28, *(unsigned __int8 *)(a2 + 1) + 2, a2);
      v20 = v29;
      if (!v19)
        v20 = 0;
      v28 = v17;
      v29 = v20;
      v21 = ccder_blob_encode_tl(&v28, 0x2000000000000010, &v17[v15] - v20);
      v22 = v29;
      if (!v21)
        v22 = 0;
      v23 = v22 && v22 == v17;
      if (v23 && (v24 = calloc(0x18uLL, 1uLL)) != 0)
      {
        v25 = v24;
        result = 0;
        v25[1] = v17;
        v25[2] = v15;
        *v25 = *a1;
        *a1 = v25;
      }
      else
      {
LABEL_30:
        memset_s(v17, v15, 0, v15);
        free(v17);
        return 0xFFFFFFFFLL;
      }
    }
    else
    {
      return 4294967279;
    }
  }
  return result;
}

uint64_t sub_1000AA5BC(_QWORD *a1, uint64_t a2, char *__s)
{
  uint64_t result;
  size_t v7;
  uint64_t v8;
  uint64_t v9;
  size_t v10;
  char *v11;
  char *v12;
  char *v13;
  int v14;
  char *v15;
  int v16;
  char *v17;
  BOOL v18;
  _QWORD *v19;
  _QWORD *v20;
  char *v21;
  char *v22;
  char *v23;
  char *v24;

  result = 0xFFFFFFFFLL;
  if (a1 && a2 && __s)
  {
    v7 = strlen(__s);
    v8 = *(unsigned __int8 *)(a2 + 1);
    v9 = ccder_sizeof(12, v7);
    v10 = ccder_sizeof(0x2000000000000010, v8 + v9 + 2);
    v11 = (char *)calloc(v10, 1uLL);
    if (v11)
    {
      v12 = v11;
      v13 = &v11[v10];
      v21 = v11;
      v22 = &v11[v10];
      if (!ccder_blob_encode_body(&v21, v7, __s) || !ccder_blob_encode_tl(&v21, 12, v7))
        goto LABEL_19;
      v23 = v12;
      v24 = v22;
      v14 = ccder_blob_encode_body(&v23, *(unsigned __int8 *)(a2 + 1) + 2, a2);
      v15 = v24;
      if (!v14)
        v15 = 0;
      v23 = v12;
      v24 = v15;
      v16 = ccder_blob_encode_tl(&v23, 0x2000000000000010, v13 - v15);
      v17 = v24;
      if (!v16)
        v17 = 0;
      v18 = v17 && v17 == v12;
      if (v18 && (v19 = calloc(0x18uLL, 1uLL)) != 0)
      {
        v20 = v19;
        result = 0;
        v20[1] = v12;
        v20[2] = v10;
        *v20 = *a1;
        *a1 = v20;
      }
      else
      {
LABEL_19:
        memset_s(v12, v10, 0, v10);
        free(v12);
        return 0xFFFFFFFFLL;
      }
    }
    else
    {
      return 4294967279;
    }
  }
  return result;
}

uint64_t sub_1000AA730(_QWORD *a1, uint64_t a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  size_t v6;
  char *v8;
  int v9;
  char *v10;
  int v11;
  char *v12;
  BOOL v13;
  _QWORD *v14;
  char *v16;
  char *v17;
  void *__s;
  rsize_t __n;
  char *v20;
  char *v21;

  v3 = 0;
  __s = 0;
  __n = 0;
  v4 = 0xFFFFFFFFLL;
  if (a1 && a2)
  {
    v6 = 0;
    if (a3)
    {
      if (sub_1000A9CAC(a3, &__s, &__n))
      {
        v3 = 0;
        v6 = 0;
      }
      else
      {
        v6 = ccder_sizeof(0x2000000000000010, *(unsigned __int8 *)(a2 + 1) + __n + 2);
        v8 = (char *)calloc(v6, 1uLL);
        v3 = v8;
        if (v8)
        {
          v16 = v8;
          v17 = &v8[v6];
          if (!ccder_blob_encode_body(&v16, __n, __s))
            goto LABEL_23;
          v20 = v3;
          v21 = v17;
          v9 = ccder_blob_encode_body(&v20, *(unsigned __int8 *)(a2 + 1) + 2, a2);
          v10 = v21;
          if (!v9)
            v10 = 0;
          v20 = v3;
          v21 = v10;
          v11 = ccder_blob_encode_tl(&v20, 0x2000000000000010, &v3[v6] - v10);
          v12 = v21;
          if (!v11)
            v12 = 0;
          v13 = v12 && v12 == v3;
          if (v13 && (v14 = calloc(0x18uLL, 1uLL)) != 0)
          {
            v4 = 0;
            v14[1] = v3;
            v14[2] = v6;
            *v14 = *a1;
            *a1 = v14;
            v3 = 0;
          }
          else
          {
LABEL_23:
            v4 = 0xFFFFFFFFLL;
          }
        }
        else
        {
          v4 = 4294967279;
        }
      }
    }
  }
  else
  {
    v6 = 0;
  }
  if (__s)
  {
    memset_s(__s, __n, 0, __n);
    free(__s);
  }
  if (v3)
  {
    memset_s(v3, v6, 0, v6);
    free(v3);
  }
  return v4;
}

BOOL sub_1000AA8CC(_QWORD *a1)
{
  return *a1 == 0;
}

uint64_t sub_1000AA8DC(uint64_t a1)
{
  uint64_t v1;

  if (a1)
    v1 = *(_QWORD *)(a1 + 8);
  else
    v1 = 0;
  return ccder_sizeof(4, v1);
}

uint64_t sub_1000AA8F4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  if (a1)
    v1 = *(_QWORD *)(a1 + 8);
  else
    v1 = 0;
  v2 = ccder_sizeof(4, v1);
  return ccder_sizeof(4, 4) + v2;
}

uint64_t sub_1000AA938(__int128 *a1, _QWORD *a2)
{
  uint64_t result;
  int v5;
  __int128 v6;

  v6 = *a1;
  if (a2)
  {
    result = ccder_blob_encode_body_tl(&v6, 4, 4, a2 + 2);
    if (!(_DWORD)result)
      return result;
    if ((ccder_blob_encode_body_tl(&v6, 4, a2[1], *a2) & 1) == 0)
      return 0;
  }
  else
  {
    v5 = 0;
    if (!ccder_blob_encode_body_tl(&v6, 4, 4, &v5) || (ccder_blob_encode_tl(&v6, 4, 0) & 1) == 0)
      return 0;
  }
  *a1 = v6;
  return 1;
}

uint64_t sub_1000AA9E0(__int128 *a1, int a2, uint64_t a3)
{
  uint64_t v5;
  int *v6;
  int v7;
  unsigned int v8;
  uint64_t result;
  int v10;
  __int128 v11;
  int *v12;
  uint64_t v13;
  __int128 v14;

  v6 = *(int **)a3;
  v5 = *(_QWORD *)(a3 + 8);
  v7 = *(_DWORD *)(a3 + 20);
  v11 = *a1;
  if (a2)
  {
    v14 = *a1;
    v12 = 0;
    v13 = 0;
    if ((ccder_blob_decode_range(&v14, 4, &v12) & 1) == 0)
      return 0;
    v6 = v12;
    v8 = v13 - (_DWORD)v12;
    v11 = v14;
  }
  else
  {
    LODWORD(v14) = v5;
    result = sub_1000AAAE4(&v11, 4, v6, &v14);
    if (!(_DWORD)result)
      return result;
    v8 = v14;
  }
  v14 = v11;
  v12 = 0;
  v13 = 0;
  if ((ccder_blob_decode_range(&v14, 4, &v12) & 1) == 0)
    return 0;
  v11 = v14;
  if ((v13 - (_DWORD)v12) > 4)
    return 0;
  v10 = *v12;
  *(_QWORD *)a3 = v6;
  *(_QWORD *)(a3 + 8) = v8;
  *(_DWORD *)(a3 + 16) = v10;
  *(_DWORD *)(a3 + 20) = v7;
  *a1 = v11;
  return 1;
}

uint64_t sub_1000AAAE4(__int128 *a1, uint64_t a2, void *a3, _DWORD *a4)
{
  int v7;
  __int128 v9;
  const void *v10;
  uint64_t v11;
  __int128 v12;

  v12 = *a1;
  v10 = 0;
  v11 = 0;
  if ((ccder_blob_decode_range(&v12, a2, &v10) & 1) == 0)
    return 0;
  v9 = v12;
  if (!a3 || !a4)
    goto LABEL_6;
  v7 = v11 - (_DWORD)v10;
  if (*a4 < (v11 - (_DWORD)v10))
    return 0;
  memcpy(a3, v10, (v11 - (_DWORD)v10));
  *a4 = v7;
LABEL_6:
  *a1 = v9;
  return 1;
}

uint64_t sub_1000AAB7C(__int128 *a1, _QWORD *a2)
{
  uint64_t result;
  __int128 v4;

  v4 = *a1;
  if (a2)
  {
    if ((ccder_blob_encode_body_tl(&v4, 4, a2[1], *a2) & 1) == 0)
      return 0;
  }
  else
  {
    result = ccder_blob_encode_tl(&v4, 4, 0);
    if (!(_DWORD)result)
      return result;
  }
  *a1 = v4;
  return 1;
}

uint64_t sub_1000AABE8(__int128 *a1, int a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  uint64_t result;
  unsigned int v8;
  __int128 v9;
  void *v10;
  uint64_t v11;
  __int128 v12;

  v6 = *(void **)a3;
  v5 = *(_QWORD *)(a3 + 8);
  v9 = *a1;
  if (a2)
  {
    v12 = *a1;
    v10 = 0;
    v11 = 0;
    result = ccder_blob_decode_range(&v12, 4, &v10);
    if (!(_DWORD)result)
      return result;
    v6 = v10;
    v8 = v11 - (_DWORD)v10;
    v9 = v12;
  }
  else
  {
    LODWORD(v12) = v5;
    result = sub_1000AAAE4(&v9, 4, v6, &v12);
    if (!(_DWORD)result)
      return result;
    v8 = v12;
  }
  *(_QWORD *)a3 = v6;
  *(_QWORD *)(a3 + 8) = v8;
  *a1 = v9;
  return 1;
}

uint64_t sub_1000AAC94(__int128 *a1, uint64_t a2)
{
  uint64_t result;
  __int128 v4;

  v4 = *a1;
  if (a2)
  {
    if ((ccder_blob_encode_body_tl(&v4, 4, 24, a2) & 1) == 0)
      return 0;
  }
  else
  {
    result = ccder_blob_encode_tl(&v4, 4, 0);
    if (!(_DWORD)result)
      return result;
  }
  *a1 = v4;
  return 1;
}

uint64_t sub_1000AAD04(__int128 *a1, void *a2)
{
  __int128 v5;
  const void *v6;
  uint64_t v7;
  __int128 v8;

  v8 = *a1;
  v6 = 0;
  v7 = 0;
  if ((ccder_blob_decode_range(&v8, 4, &v6) & 1) == 0)
    return 0;
  v5 = v8;
  if ((v7 - (_DWORD)v6) > 0x18)
    return 0;
  memcpy(a2, v6, (v7 - (_DWORD)v6));
  *a1 = v5;
  return 1;
}

uint64_t sub_1000AAD84(unsigned int *a1, int a2, _QWORD *a3, _DWORD *a4)
{
  uint64_t v8;
  uint64_t v10;
  size_t v11;
  void *v12;

  v12 = 0;
  if (sub_1000AA3A8(&v12, (uint64_t)off_1000DFA20, *a1)
    || sub_1000AA3A8(&v12, (uint64_t)off_1000DFA28, a1[1])
    || sub_1000AA3A8(&v12, (uint64_t)off_1000DFA30, *((_QWORD *)a1 + 1))
    || sub_1000AA3A8(&v12, (uint64_t)off_1000DFA40, a1[4])
    || sub_1000AA3A8(&v12, (uint64_t)off_1000DFA50, a1[5])
    || sub_1000AA3A8(&v12, (uint64_t)off_1000DFA68, *(_QWORD *)((char *)a1 + 26))
    || sub_1000AA3A8(&v12, (uint64_t)off_1000DFA70, *(_QWORD *)((char *)a1 + 34))
    || sub_1000AA3A8(&v12, (uint64_t)off_1000DF778, *(int *)((char *)a1 + 42))
    || sub_1000AA3A8(&v12, (uint64_t)off_1000DF940, *(unsigned int *)((char *)a1 + 46))
    || sub_1000A9FEC(&v12, (uint64_t)off_1000DFB38, (uint64_t)a1 + 50, 16)
    || a2
    && (sub_1000AA3A8(&v12, (uint64_t)off_1000DFA58, *((char *)a1 + 66))
     || sub_1000AA3A8(&v12, (uint64_t)off_1000DFA60, *((char *)a1 + 67))
     || sub_1000AA3A8(&v12, (uint64_t)off_1000DFD38, *(_QWORD *)(a1 + 17))
     || sub_1000AA3A8(&v12, (uint64_t)off_1000DFD80, *(_QWORD *)(a1 + 19)))
    || (v10 = 0, v11 = 0, sub_1000A9CAC(&v12, &v10, &v11)))
  {
    v8 = 0xFFFFFFFFLL;
  }
  else
  {
    v8 = 0;
    *a3 = v10;
    *a4 = v11;
  }
  sub_1000A95DC(&v12);
  return v8;
}

uint64_t sub_1000AAF90(uint64_t a1, unsigned int a2, char *__s)
{
  uint64_t result;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  void **v10;
  void *v11;
  uint64_t v12[57];
  __int128 v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;

  result = 0xFFFFFFFFLL;
  if (a2 && a1)
  {
    if (__s)
    {
      memset_s(__s, 0x54uLL, 0, 0x54uLL);
      bzero(v12, 0x228uLL);
      v11 = off_1000DFA20;
      v12[4] = (uint64_t)off_1000DFA28;
      v12[9] = (uint64_t)off_1000DFA30;
      v12[14] = (uint64_t)off_1000DFA40;
      v12[19] = (uint64_t)off_1000DFA50;
      v12[24] = (uint64_t)off_1000DFA58;
      v12[29] = (uint64_t)off_1000DFA60;
      v12[34] = (uint64_t)off_1000DFA68;
      v12[39] = (uint64_t)off_1000DFA70;
      v12[44] = (uint64_t)off_1000DF778;
      v12[49] = (uint64_t)off_1000DF940;
      v12[54] = (uint64_t)off_1000DFB38;
      v14 = off_1000DFD38;
      v17 = off_1000DFD80;
      v8 = xmmword_1000B25B0;
      v9 = 0;
      v10 = &v11;
      sub_1000A90D0(a1, a1 + a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1000A8F08, (uint64_t)&v8);
      *(_DWORD *)__s = sub_1000A92E8(v12[0], v12[1]);
      *((_DWORD *)__s + 1) = sub_1000A92E8(v12[5], v12[6]);
      *((_QWORD *)__s + 1) = sub_1000A92E8(v12[10], v12[11]);
      *((_DWORD *)__s + 4) = sub_1000A92E8(v12[15], v12[16]);
      *((_DWORD *)__s + 5) = sub_1000A92E8(v12[20], v12[21]);
      *(_QWORD *)(__s + 26) = sub_1000A92E8(v12[35], v12[36]);
      *(_QWORD *)(__s + 34) = sub_1000A92E8(v12[40], v12[41]);
      *(_DWORD *)(__s + 42) = sub_1000A92E8(v12[45], v12[46]);
      *(_DWORD *)(__s + 46) = sub_1000A92E8(v12[50], v12[51]);
      sub_1000A9844(&v13, 4, __s + 50, 16);
      __s[66] = sub_1000A92E8(v12[25], v12[26]);
      __s[67] = sub_1000A92E8(v12[30], v12[31]);
      *(_QWORD *)(__s + 68) = sub_1000A92E8(v15, v16);
      v7 = sub_1000A92E8(v18, v19);
      result = 0;
      *(_QWORD *)(__s + 76) = v7;
    }
  }
  return result;
}

uint64_t sub_1000AB1F4(uint64_t a1, unsigned int a2, _BYTE *__s)
{
  uint64_t result;
  int v7;
  __int128 v8;
  uint64_t v9;
  void **v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  result = 0xFFFFFFFFLL;
  if (a2 && a1 && __s)
  {
    memset_s(__s, 0x10uLL, 0, 0x10uLL);
    v13 = 0u;
    v15 = 0u;
    v16 = 0;
    v20 = 0u;
    v12 = 0u;
    v18 = 0u;
    v19 = 0u;
    v21 = 0u;
    v22 = 0;
    v11 = off_1000DFB30;
    v14 = (unint64_t)off_1000DFA40;
    v17 = off_1000DF940;
    *(_QWORD *)&v20 = off_1000DFA20;
    v8 = xmmword_1000B24A0;
    v9 = 0;
    v10 = &v11;
    if (sub_1000A90D0(a1, a1 + a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1000A8F08, (uint64_t)&v8))
    {
      *__s = sub_1000A92E8(v12, *((uint64_t *)&v12 + 1));
      *((_DWORD *)__s + 1) = sub_1000A92E8(*((uint64_t *)&v14 + 1), v15);
      *((_DWORD *)__s + 2) = sub_1000A92E8(v18, *((uint64_t *)&v18 + 1));
      v7 = sub_1000A92E8(*((uint64_t *)&v20 + 1), v21);
      result = 0;
      *((_DWORD *)__s + 3) = v7;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t sub_1000AB358(uint64_t a1, unsigned int a2, void *__s, void *a4, void *a5)
{
  uint64_t result;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  void **v13;
  void *v14;
  __int128 v15;
  __int128 v16[2];
  __int128 v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;

  result = 0xFFFFFFFFLL;
  if (a2 && a1 && __s && a4)
  {
    v10 = a1 + a2;
    memset_s(__s, 0x10uLL, 0, 0x10uLL);
    memset_s(a4, 0x10uLL, 0, 0x10uLL);
    v18 = 0;
    v15 = 0u;
    v16[0] = 0u;
    v17 = 0u;
    v20 = 0u;
    v21 = 0u;
    v14 = off_1000DFCD8;
    v16[1] = (unint64_t)off_1000DFCE0;
    v19 = off_1000DF818;
    v11 = xmmword_1000B2480;
    v12 = 0;
    v13 = &v14;
    sub_1000A90D0(a1, v10, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1000A8F08, (uint64_t)&v11);
    if (sub_1000A9844(v16, 4, __s, 16)
      && sub_1000A9844((__int128 *)((char *)&v17 + 8), 4, a4, 16))
    {
      return sub_1000A9844(&v21, 4, a5, 16) - 1;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t sub_1000AB4D4(uint64_t a1, uint64_t a2, char *__s)
{
  uint64_t result;
  uint64_t v6;
  int v7;
  int v8;
  __int128 v9;
  uint64_t v10;
  void **v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  void *v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  void *v40;
  uint64_t v41;
  __int128 v42;
  uint64_t v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  void *v47;
  uint64_t v48;
  __int128 v49;
  uint64_t v50;
  void *v51;
  __int128 v52;
  __int128 v53;

  result = 0xFFFFFFFFLL;
  if (a2 && a1 && __s)
  {
    v6 = a1 + a2;
    memset_s(__s, 0x58uLL, 0, 0x58uLL);
    v32 = 0u;
    v34 = 0;
    v35 = 0u;
    v36 = 0;
    v38 = 0u;
    v39 = 0u;
    v41 = 0;
    v42 = 0u;
    v43 = 0;
    v45 = 0u;
    v46 = 0u;
    v48 = 0;
    v49 = 0u;
    v50 = 0;
    v52 = 0u;
    v53 = 0u;
    v13 = 0u;
    v14 = 0u;
    v16 = 0u;
    v17 = 0;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0;
    v31 = 0u;
    v12 = off_1000DF808;
    v15 = (unint64_t)off_1000DF818;
    v18 = off_1000DF7F8;
    *(_QWORD *)&v21 = off_1000DF7F0;
    v24 = off_1000DF810;
    *(_QWORD *)&v27 = off_1000DFA98;
    v30 = off_1000DFA40;
    v33 = off_1000DFA48;
    v37 = off_1000DF940;
    v40 = off_1000DFA30;
    v44 = off_1000DFA38;
    v47 = off_1000DFBF8;
    v51 = off_1000DFC60;
    v9 = xmmword_1000B25C0;
    v10 = 0;
    v11 = &v12;
    sub_1000A90D0(a1, v6, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1000A8F08, (uint64_t)&v9);
    *(_DWORD *)__s = sub_1000A92E8(v13, *((uint64_t *)&v13 + 1));
    if (sub_1000A9844((__int128 *)((char *)&v16 + 8), 4, __s + 4, 16)
      && sub_1000A9844(&v20, 4, __s + 20, 16)
      && (*((_DWORD *)__s + 9) = sub_1000A92E8(*((uint64_t *)&v21 + 1), v22),
          *((_DWORD *)__s + 10) = sub_1000A92E8(v25, *((uint64_t *)&v25 + 1)),
          *((_DWORD *)__s + 11) = sub_1000A92E8(v31, *((uint64_t *)&v31 + 1)),
          *((_DWORD *)__s + 12) = sub_1000A92E8(v34, v35),
          *((_DWORD *)__s + 15) = sub_1000A92E8(v38, *((uint64_t *)&v38 + 1)),
          *((_DWORD *)__s + 13) = sub_1000A92E8(v41, v42),
          *((_DWORD *)__s + 14) = sub_1000A92E8(v45, *((uint64_t *)&v45 + 1)),
          sub_1000AB7B8((__int128 *)((char *)&v28 + 8), 4, __s + 64, 8u)))
    {
      v7 = *((_DWORD *)__s + 9);
      if ((v7 & 0x400) != 0)
      {
        *((_QWORD *)__s + 9) = sub_1000A92E8(v48, v49);
        v7 = *((_DWORD *)__s + 9);
      }
      if ((v7 & 0x800) != 0)
      {
        v8 = sub_1000A92E8(v52, *((uint64_t *)&v52 + 1));
        result = 0;
        *((_DWORD *)__s + 20) = v8;
      }
      else
      {
        return 0;
      }
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t sub_1000AB7B8(__int128 *a1, uint64_t a2, void *a3, unsigned int a4)
{
  uint64_t v7;
  size_t v8;
  __int128 v10;
  const void *v11;
  uint64_t v12;
  __int128 v13;

  v13 = *a1;
  v11 = 0;
  v12 = 0;
  v7 = ccder_blob_decode_range(&v13, a2, &v11);
  if ((v7 & 1) != 0)
  {
    v10 = v13;
    if (a3)
    {
      if ((int)v12 - (int)v11 >= a4)
        v8 = a4;
      else
        v8 = (v12 - (_DWORD)v11);
      memcpy(a3, v11, v8);
    }
    *a1 = v10;
  }
  return v7;
}

uint64_t sub_1000AB83C(int *a1, _QWORD *a2, _DWORD *a3)
{
  uint64_t v3;
  int v7;
  uint64_t v9;
  size_t v10;
  void *v11;

  v11 = 0;
  v3 = 4294967273;
  if (a2 && a3)
  {
    if (a1 && (v7 = *a1) != 0)
    {
      if ((v7 & 1) != 0)
      {
        sub_1000AA158(&v11, "persona_uuid", (uint64_t)(a1 + 1), 16);
        v7 = *a1;
      }
      if ((v7 & 2) != 0)
        sub_1000AA158(&v11, "volume_uuid", (uint64_t)(a1 + 5), 16);
      v9 = 0;
      v10 = 0;
      if (!sub_1000A9CAC(&v11, &v9, &v10))
      {
        v3 = 0;
        *a2 = v9;
        *a3 = v10;
      }
    }
    else
    {
      v3 = 0;
      *a2 = 0;
      *a3 = 0;
    }
  }
  sub_1000A95DC(&v11);
  return v3;
}

uint64_t sub_1000AB910(uint64_t a1, uint64_t a2, char *__s)
{
  uint64_t v3;
  uint64_t v6;
  void *v8;

  v8 = 0;
  v3 = 0xFFFFFFFFLL;
  if (a2 && a1 && __s)
  {
    v6 = a1 + a2;
    memset_s(__s, 0x24uLL, 0, 0x24uLL);
    if (sub_1000A90D0(a1, v6, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1000A9BE0, (uint64_t)&v8))
    {
      if (!sub_1000A98D0(&v8, "volume_uuid", __s + 20, 0x10uLL))
        *(_DWORD *)__s |= 2u;
      v3 = 0;
      if (!sub_1000A98D0(&v8, "persona_uuid", __s + 4, 0x10uLL))
        *(_DWORD *)__s |= 1u;
    }
    else
    {
      v3 = 0xFFFFFFFFLL;
    }
  }
  sub_1000A95DC(&v8);
  return v3;
}

uint64_t sub_1000AB9F0(uint64_t a1, _QWORD *a2, _DWORD *a3)
{
  uint64_t v3;
  uint64_t v8;
  size_t v9;
  void *v10;

  v10 = 0;
  v3 = 4294967273;
  if (a2 && a3)
  {
    if (a1)
    {
      if (!sub_1000AA158(&v10, "options", a1, 8)
        && !sub_1000AA158(&v10, "kc", a1 + 8, 4))
      {
        v8 = 0;
        v9 = 0;
        if (!sub_1000A9CAC(&v10, &v8, &v9))
        {
          v3 = 0;
          *a2 = v8;
          *a3 = v9;
        }
      }
    }
    else
    {
      v3 = 0;
      *a2 = 0;
      *a3 = 0;
    }
  }
  sub_1000A95DC(&v10);
  return v3;
}

uint64_t sub_1000ABAB8(uint64_t a1, uint64_t a2, char *__s)
{
  uint64_t v3;
  uint64_t v6;
  void *v8;

  v8 = 0;
  v3 = 0xFFFFFFFFLL;
  if (a2 && a1 && __s)
  {
    v6 = a1 + a2;
    memset_s(__s, 0x10uLL, 0, 0x10uLL);
    if (sub_1000A90D0(a1, v6, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1000A9BE0, (uint64_t)&v8))
    {
      sub_1000A98D0(&v8, "options", __s, 8uLL);
      sub_1000A98D0(&v8, "kc", __s + 8, 4uLL);
      v3 = 0;
    }
    else
    {
      v3 = 0xFFFFFFFFLL;
    }
  }
  sub_1000A95DC(&v8);
  return v3;
}

uint64_t sub_1000ABB78(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  const void *v5;
  uint64_t v6;
  void *v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[59];

  result = 0;
  if (a1 && a2)
  {
    v9 = 0;
    v10 = 0;
    v7 = off_1000DF770;
    v8 = 0;
    if (off_1000DF770
      && (sub_1000A90D0(a1, a1 + a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1000A9210, (uint64_t)&v7), (_BYTE)v10))
    {
      v4 = 0;
      v11[0] = 6;
      v11[1] = off_1000DF8C8;
      v11[2] = 10;
      v11[3] = off_1000DF8E8;
      v11[4] = 17;
      v11[5] = off_1000DF900;
      v11[6] = 1;
      v11[7] = off_1000DF890;
      v11[8] = 2;
      v11[9] = off_1000DF8A8;
      v11[10] = 3;
      v11[11] = off_1000DF8B8;
      v11[12] = 4;
      v11[13] = off_1000DF8C0;
      v11[14] = 5;
      v11[15] = off_1000DF8A0;
      v11[16] = 7;
      v11[17] = off_1000DF8D0;
      v11[18] = 8;
      v11[19] = off_1000DF8D8;
      v11[20] = 9;
      v11[21] = off_1000DF8E0;
      v11[22] = 11;
      v11[23] = off_1000DF8F0;
      v11[24] = 12;
      v11[25] = off_1000DF968;
      v11[26] = 13;
      v11[27] = off_1000DF960;
      v11[28] = 14;
      v11[29] = off_1000DF970;
      v11[30] = 15;
      v11[31] = off_1000DF978;
      v11[32] = 16;
      v11[33] = off_1000DF8F8;
      v11[34] = 18;
      v11[35] = off_1000DF980;
      v11[36] = 19;
      v11[37] = off_1000DF988;
      v11[38] = 20;
      v11[39] = off_1000DF990;
      v11[40] = 21;
      v11[41] = off_1000DF998;
      v11[42] = 22;
      v11[43] = off_1000DF9A0;
      v11[44] = 23;
      v11[45] = off_1000DF908;
      v11[46] = 24;
      v11[47] = off_1000DF910;
      v11[48] = 25;
      v11[49] = off_1000DF918;
      v11[50] = 26;
      v11[51] = off_1000DF920;
      v11[52] = 27;
      v11[53] = off_1000DFCC0;
      v11[54] = 28;
      v11[55] = off_1000DFD88;
      v11[56] = 29;
      v11[57] = off_1000DFD90;
      v5 = v8;
      v6 = v9;
      while (!sub_1000A9004((const void *)v11[v4 + 1], v11[v4 + 1] + *(unsigned __int8 *)(v11[v4 + 1] + 1) + 2, v5, v6))
      {
        v4 += 2;
        if (v4 == 58)
          return 0;
      }
      return LODWORD(v11[v4]);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t sub_1000ABF5C(__int128 *a1, uint64_t a2, uint64_t *a3, _DWORD *a4)
{
  const void *v7;
  int v8;
  size_t v9;
  uint64_t result;
  uint64_t v11;
  __int128 v12;
  const void *v13;
  uint64_t v14;
  __int128 v15;

  v15 = *a1;
  v13 = 0;
  v14 = 0;
  if ((ccder_blob_decode_range(&v15, a2, &v13) & 1) == 0)
    return 0;
  v7 = v13;
  v12 = v15;
  if (a3 && a4)
  {
    v8 = v14 - (_DWORD)v13;
    v9 = (v14 - (_DWORD)v13);
    result = (uint64_t)calloc(v9, 1uLL);
    if (!result)
      return result;
    v11 = result;
    memcpy((void *)result, v7, v9);
    *a3 = v11;
    *a4 = v8;
  }
  *a1 = v12;
  return 1;
}

uint64_t sub_1000AC014(__int128 *a1, uint64_t a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;

  v9 = 0;
  if (a3)
    *a3 = 0;
  v8 = *a1;
  v6 = 0;
  v7 = 0;
  result = ccder_blob_decode_range(&v8, a2, &v6);
  if ((_DWORD)result)
  {
    if (ccn_read_uint(1, &v9, v7 - v6, v6))
    {
      return 0;
    }
    else
    {
      *a1 = v8;
      if (a3)
        *a3 = v9;
      return 1;
    }
  }
  return result;
}

uint64_t sub_1000AC09C(_QWORD *a1, void **a2)
{
  uint64_t v2;
  char *v3;
  const void *v4;
  unint64_t v6;
  unint64_t v7;
  size_t v8;
  int v9;
  int v11;
  void *__s2[2];
  _QWORD v13[2];
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;

  v2 = *a1 + a1[1];
  v13[0] = *a1;
  v13[1] = v2;
  v3 = (char *)a2[1] + (_QWORD)*a2;
  __s2[0] = *a2;
  __s2[1] = v3;
  if (!ccder_blob_decode_sequence_tl(v13, v13))
    return 4294967293;
  if (!ccder_blob_decode_sequence_tl(__s2, __s2))
    return 4294967293;
  v17 = 0;
  v15 = 0;
  v16 = 0;
  v14 = 0;
  if (!ccder_blob_decode_tag(v13, &v17))
    return 4294967293;
  if (!ccder_blob_decode_len(v13, &v16))
    return 4294967293;
  v4 = (const void *)v13[0];
  if (!v13[0]
    || !ccder_blob_decode_tag(__s2, &v15)
    || !ccder_blob_decode_len(__s2, &v14)
    || !__s2[0])
  {
    return 4294967293;
  }
  if (v17 > v15)
    return 1;
  if (v15 > v17)
    return 0xFFFFFFFFLL;
  v6 = v16;
  v7 = v14;
  v8 = v16 >= v14 ? v14 : v16;
  v9 = memcmp(v4, __s2[0], v8);
  if (v9 > 0 || !v9 && v6 > v7)
    return 1;
  v11 = v9 < 0 || v6 < v7;
  return (v11 << 31 >> 31);
}

uint64_t sub_1000AC1C4()
{
  sub_1000A8474(&off_1000D1DA8 != 0, 36, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return 4294967284;
}

uint64_t sub_1000AC2D0()
{
  sub_1000A8474(&off_1000D1DA8 != 0, 62, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_1000A8474(sub_100098AA0 != 0, 63, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return sub_100098AA0();
}

uint64_t sub_1000AC32C(uint64_t a1, unsigned int a2)
{
  sub_1000A8474(&off_1000D1DA8 != 0, 70, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_1000A8474(sub_100098B0C != 0, 71, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return sub_100098B0C(a1, a2);
}

uint64_t sub_1000AC3A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000A8474(&off_1000D1DA8 != 0, 78, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_1000A8474(0, 79, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1000AC45C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  sub_1000A8474(&off_1000D1DA8 != 0, 86, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_1000A8474(0, 87, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
}

uint64_t sub_1000AC520(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  sub_1000A8474(&off_1000D1DA8 != 0, 94, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_1000A8474(0, 95, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
}

uint64_t sub_1000AC5E4(unsigned int a1, unsigned int a2, uint64_t a3, uint64_t a4, unsigned int a5, unsigned int a6, unsigned int a7, unsigned int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  sub_1000A8474(&off_1000D1DA8 != 0, 106, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_1000A8474(0, 107, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15);
}

uint64_t sub_1000AC6B0(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  sub_1000A8474(&off_1000D1DA8 != 0, 115, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_1000A8474(0, 116, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);
}

uint64_t sub_1000AC77C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_1000A8474(&off_1000D1DA8 != 0, 123, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_1000A8474(0, 124, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1, a2, a3, a4, a5);
}

uint64_t sub_1000AC818()
{
  sub_1000A8474(&off_1000D1DA8 != 0, 131, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_1000A8474(0, 132, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0]();
}

uint64_t sub_1000AC874(uint64_t a1, uint64_t a2)
{
  sub_1000A8474(&off_1000D1DA8 != 0, 139, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_1000A8474(0, 140, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1, a2);
}

uint64_t sub_1000AC8E8(uint64_t a1)
{
  sub_1000A8474(&off_1000D1DA8 != 0, 147, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_1000A8474(0, 148, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1);
}

uint64_t sub_1000AC954(uint64_t a1)
{
  sub_1000A8474(&off_1000D1DA8 != 0, 155, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_1000A8474(0, 156, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1);
}

uint64_t sub_1000AC9C0(uint64_t a1)
{
  sub_1000A8474(&off_1000D1DA8 != 0, 163, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_1000A8474(0, 164, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1);
}

uint64_t sub_1000ACA2C(uint64_t a1)
{
  sub_1000A8474(&off_1000D1DA8 != 0, 171, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_1000A8474(0, 172, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1);
}

uint64_t sub_1000ACA98(uint64_t a1)
{
  sub_1000A8474(&off_1000D1DA8 != 0, 179, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_1000A8474(0, 180, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1);
}

uint64_t sub_1000ACB04(uint64_t a1)
{
  sub_1000A8474(&off_1000D1DA8 != 0, 187, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_1000A8474(0, 188, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1);
}

uint64_t sub_1000ACB70(uint64_t a1)
{
  sub_1000A8474(&off_1000D1DA8 != 0, 195, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_1000A8474(0, 196, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1);
}

uint64_t sub_1000ACBDC(int a1)
{
  return -a1 & 3;
}

char *sub_1000ACBE8(_DWORD *a1, const void *a2, int a3)
{
  char *v3;
  int v5;
  size_t v6;
  int __s;

  v3 = (char *)(a1 + 1);
  if (a2)
  {
    *a1 = a3;
    memcpy(a1 + 1, a2, a3);
    v3 += a3;
    v5 = -a3;
    v6 = -a3 & 3;
    if ((v5 & 3) != 0)
    {
      __s = 0;
      memset_s(&__s, 4uLL, 0, 4uLL);
      memcpy(v3, &__s, v6);
      v3 += v6;
    }
  }
  else
  {
    *a1 = 0;
  }
  return v3;
}

char *sub_1000ACC6C(char **a1, unsigned int *a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  unsigned int v12;
  int v13;
  uint64_t *v14;
  char *result;
  char *v16;
  int v17;
  uint64_t v18;
  const void **v19;
  const void *v20;
  uint64_t *v21;
  const void **v22;

  v21 = &a9;
  v12 = 4;
  if (a3)
  {
    v13 = a3;
    do
    {
      v14 = v21;
      v21 += 2;
      v12 += *((_DWORD *)v14 + 2) + (-*((_DWORD *)v14 + 2) & 3) + 4;
      --v13;
    }
    while (v13);
  }
  result = (char *)calloc(1uLL, v12);
  v16 = result;
  v22 = (const void **)&a9;
  v17 = 0;
  if (a3)
  {
    v18 = 4;
    do
    {
      v19 = v22;
      v20 = *v22;
      v22 += 2;
      result = sub_1000ACBE8(&v16[v18], v20, *((_DWORD *)v19 + 2));
      v18 = result - v16;
      ++v17;
    }
    while (a3 != v17);
  }
  *(_DWORD *)v16 = v17;
  *a1 = v16;
  *a2 = v12;
  return result;
}

uint64_t sub_1000ACD48(unsigned int *a1, unint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  unsigned int v9;
  char *v11;
  void **v12;
  void *v13;
  char *v14;
  size_t v15;
  unsigned int v16;
  size_t *v17;
  void **v19;

  if (a2 < 4)
    return 0xFFFFFFFFLL;
  v9 = a3;
  if (*a1 >= a3)
  {
    v19 = (void **)&a9;
    if (!a3)
      return 0;
    v11 = (char *)(a1 + 1);
    while (1)
    {
      v12 = v19;
      v13 = *v19;
      v19 += 2;
      v16 = *(_DWORD *)v11;
      v14 = v11 + 4;
      v15 = v16;
      if (v16 > a2)
        break;
      if (v13)
      {
        v17 = (size_t *)v12[1];
        if (*v17 < v15)
          return 0xFFFFFFFFLL;
        memcpy(v13, v14, v15);
        *v17 = v15;
      }
      v11 = &v14[v15];
      if (!--v9)
        return 0;
    }
  }
  return 0xFFFFFFFFLL;
}

void sub_1000ACE0C()
{
  uint64_t v0;

  v0 = _os_assert_log(0);
  _os_crash(v0);
  __break(1u);
}

void sub_1000ACE24(char a1, const char *a2)
{
  NSObject *v3;
  unsigned int v4;
  _BOOL4 v5;
  char *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;

  if ((a1 & 1) == 0)
    goto LABEL_11;
  while (1)
  {
    v3 = (id)qword_1000E0080;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v12 = 0;
      v4 = sub_100007750(0);
      v5 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
      v6 = 0;
      if (v5)
        v7 = v4;
      else
        v7 = v4 & 0xFFFFFFFE;
      if ((_DWORD)v7)
      {
        v8 = *(_DWORD *)a2;
        v13 = 67109120;
        v14 = v8;
        v9 = (const char *)_os_log_send_and_compose_impl(v7, &v12, 0, 0);
        v6 = 0;
        if (v9)
        {
          a2 = v9;
          sub_100007780(v9);
          v6 = (char *)a2;
        }
      }
      free(v6);
    }

    sub_1000561EC(v10, v11, (uint64_t)"Daemon failed to load persona manifest.");
LABEL_11:
    dispatch_once(&qword_1000E0088, &stru_1000D1590);
  }
}

void sub_1000ACF2C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = sub_1000561EC(a1, a2, (uint64_t)"usermanagerd failed assertion: _gPersonaManager == nil");
  sub_1000ACF40(v2);
}

void sub_1000ACF40(uint64_t a1, uint64_t a2)
{
  sub_1000561EC(a1, a2, (uint64_t)"usermanagerd failed assertion: newSession != NULL");
  sub_1000ACF54();
}

void sub_1000ACF54()
{
  uint64_t v0;
  uint64_t v1;

  v0 = sub_10005A834();
  v1 = _os_crash(v0);
  __break(1u);
  AKSGetLastUser(v1);
}

id objc_msgSend_LogoutToUser_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "LogoutToUser:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDString");
}

id objc_msgSend__allowlistedPreferencesKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_allowlistedPreferencesKeys");
}

id objc_msgSend__broadcastBubbleDidPop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_broadcastBubbleDidPop");
}

id objc_msgSend__broadcastDeviceLoginSessionStateDidUpdate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_broadcastDeviceLoginSessionStateDidUpdate");
}

id objc_msgSend__broadcastPersonaUpdates_withAuid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_broadcastPersonaUpdates:withAuid:");
}

id objc_msgSend__broadcastUserSwitchTaskListDidUpdate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_broadcastUserSwitchTaskListDidUpdate");
}

id objc_msgSend__checkIfWeShouldSwitchUser_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_checkIfWeShouldSwitchUser:");
}

id objc_msgSend__clientForPID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_clientForPID:");
}

id objc_msgSend__enumerateClientsWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_enumerateClientsWithBlock:");
}

id objc_msgSend__reallySwitchUser_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_reallySwitchUser:");
}

id objc_msgSend__xpcConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcConnection");
}

id objc_msgSend_addBubbleClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addBubbleClient:");
}

id objc_msgSend_addClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addClient:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addPersonaWithUUID_toSession_passcode_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addPersonaWithUUID:toSession:passcode:error:");
}

id objc_msgSend_addUserSwitchTask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addUserSwitchTask:");
}

id objc_msgSend_addUserSyncTask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addUserSyncTask:");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allObjects");
}

id objc_msgSend_allocatePersonaWithInfo_andPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allocatePersonaWithInfo:andPath:error:");
}

id objc_msgSend_anyBubblePopClients(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "anyBubblePopClients");
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "anyObject");
}

id objc_msgSend_appendData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendData:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_asidForClient_withAuid_withPid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "asidForClient:withAuid:withPid:");
}

id objc_msgSend_asidMap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "asidMap");
}

id objc_msgSend_atomicallyWriteData_toPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "atomicallyWriteData:toPath:error:");
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "auditToken");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bootstrapVolumeWithMountPoint_user_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bootstrapVolumeWithMountPoint:user:error:");
}

id objc_msgSend_bubbleDidPop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bubbleDidPop");
}

id objc_msgSend_bubblePopstakeholderIsRegistered(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bubblePopstakeholderIsRegistered");
}

id objc_msgSend_bubbleShouldPop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bubbleShouldPop");
}

id objc_msgSend_bubbleStakeHolder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bubbleStakeHolder");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_cancelMonitor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelMonitor");
}

id objc_msgSend_chmodPath_withMode_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "chmodPath:withMode:error:");
}

id objc_msgSend_clientWithXPCConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientWithXPCConnection:");
}

id objc_msgSend_closeFileWithDescriptor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "closeFileWithDescriptor:");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_copyJobWithLabel_domain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyJobWithLabel:domain:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createIdentityWithUUID_passcode_existingSession_existingSessionPasscode_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createIdentityWithUUID:passcode:existingSession:existingSessionPasscode:error:");
}

id objc_msgSend_createPersonaKeyForUser_personaUUID_passcode_homeDir_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createPersonaKeyForUser:personaUUID:passcode:homeDir:");
}

id objc_msgSend_createUserLayoutForUserwithUserID_withAKSSetup_onUserVolumePath_fromSystemVolumePath_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createUserLayoutForUserwithUserID:withAKSSetup:onUserVolumePath:fromSystemVolumePath:withError:");
}

id objc_msgSend_createVolumeMountsDir_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createVolumeMountsDir:");
}

id objc_msgSend_createVolumeWithSession_size_userName_error_forPersona_userDataVolume_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createVolumeWithSession:size:userName:error:forPersona:userDataVolume:");
}

id objc_msgSend_criticalStakeHolder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "criticalStakeHolder");
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentConnection");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentHandler");
}

id objc_msgSend_currentPID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentPID");
}

id objc_msgSend_currentVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentVersion");
}

id objc_msgSend_dataForPersonaSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataForPersonaSet:");
}

id objc_msgSend_dataUnwrappingDataWithDeviceClassF_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUnwrappingDataWithDeviceClassF:error:");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataValue");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithContentsOfFile_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithContentsOfFile:error:");
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithPropertyList:format:options:error:");
}

id objc_msgSend_dataWrappingDataWithDeviceClassF_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWrappingDataWithDeviceClassF:error:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_deallocatePersonaWithID_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deallocatePersonaWithID:error:");
}

id objc_msgSend_decodeXPCObjectOfType_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeXPCObjectOfType:forKey:");
}

id objc_msgSend_deleteIdentity_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteIdentity:error:");
}

id objc_msgSend_deleteKeychainItemsForPersonaWithUUID_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteKeychainItemsForPersonaWithUUID:error:");
}

id objc_msgSend_deletePersonaWithUUID_fromSession_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deletePersonaWithUUID:fromSession:error:");
}

id objc_msgSend_deleteVolumeWithSession_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteVolumeWithSession:error:");
}

id objc_msgSend_deviceLoginSessionStateDidUpdate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceLoginSessionStateDidUpdate");
}

id objc_msgSend_dictForUserSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictForUserSet:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_domainForUser_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domainForUser:");
}

id objc_msgSend_encodeXPCObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeXPCObject:forKey:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_externalizeUserDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "externalizeUserDictionary:");
}

id objc_msgSend_failWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "failWithError:");
}

id objc_msgSend_fastLogoutTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fastLogoutTimer");
}

id objc_msgSend_fetchUserBlockTaskList(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchUserBlockTaskList");
}

id objc_msgSend_fetchUserSyncTaskList(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchUserSyncTaskList");
}

id objc_msgSend_fileDescriptor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileDescriptor");
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:isDirectory:");
}

id objc_msgSend_fixupPath_withMode_toUser_group_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fixupPath:withMode:toUser:group:error:");
}

id objc_msgSend_fullName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fullName");
}

id objc_msgSend_generation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generation");
}

id objc_msgSend_getCString_maxLength_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCString:maxLength:encoding:");
}

id objc_msgSend_gid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "gid");
}

id objc_msgSend_groupWithUUID_gid_name_fullName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "groupWithUUID:gid:name:fullName:");
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_hasEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasEntitlement:");
}

id objc_msgSend_hasUserSwitchTasks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasUserSwitchTasks");
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hash");
}

id objc_msgSend_homeDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "homeDirectory");
}

id objc_msgSend_ignoreIdentityMethods(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ignoreIdentityMethods");
}

id objc_msgSend_inLoginSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inLoginSession");
}

id objc_msgSend_inLogoutProcess(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inLogoutProcess");
}

id objc_msgSend_infoForPersonaWithID_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "infoForPersonaWithID:error:");
}

id objc_msgSend_infoForProcessWithPID_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "infoForProcessWithPID:error:");
}

id objc_msgSend_initWithMachPort_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachPort:options:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithMachServiceName_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:options:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_initializeLocalUsersAndGroups_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initializeLocalUsersAndGroups:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isIdentityLoadedIntoSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isIdentityLoadedIntoSession:");
}

id objc_msgSend_isVolumeMountedWithSession_fsid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isVolumeMountedWithSession:fsid:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_loadIdentity_intoSession_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadIdentity:intoSession:error:");
}

id objc_msgSend_loginIdentity_intoSession_passcode_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loginIdentity:intoSession:passcode:error:");
}

id objc_msgSend_logoutTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logoutTimer");
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longLongValue");
}

id objc_msgSend_machPort(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "machPort");
}

id objc_msgSend_machServiceName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "machServiceName");
}

id objc_msgSend_makePath_mode_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makePath:mode:error:");
}

id objc_msgSend_manifest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "manifest");
}

id objc_msgSend_manifestFromData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "manifestFromData:");
}

id objc_msgSend_mapVolume_toSession_withPersona_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mapVolume:toSession:withPersona:error:");
}

id objc_msgSend_memberships(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "memberships");
}

id objc_msgSend_monitorOnQueue_withHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "monitorOnQueue:withHandler:");
}

id objc_msgSend_mountVolumeWithSession_mountPath_error_forPersona_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mountVolumeWithSession:mountPath:error:forPersona:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_notifyNextPersonaObserver_withUser_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyNextPersonaObserver:withUser:");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_openFileForAppendingAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openFileForAppendingAtPath:error:");
}

id objc_msgSend_pathForPID_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathForPID:error:");
}

id objc_msgSend_personaListDidUpdateCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "personaListDidUpdateCompletionHandler:");
}

id objc_msgSend_personaSetFromData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "personaSetFromData:");
}

id objc_msgSend_personaUpdateCallbackForMachServiceCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "personaUpdateCallbackForMachServiceCompletionHandler:");
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pid");
}

id objc_msgSend_pidForLaunchdJobWithLabel_forUser_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pidForLaunchdJobWithLabel:forUser:error:");
}

id objc_msgSend_pidsToClients(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pidsToClients");
}

id objc_msgSend_pidsUsingVolumeAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pidsUsingVolumeAtPath:error:");
}

id objc_msgSend_platformClass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "platformClass");
}

id objc_msgSend_post_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "post:");
}

id objc_msgSend_primaryGroupUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "primaryGroupUUID");
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processIdentifier");
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "propertyListWithData:options:format:error:");
}

id objc_msgSend_proxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "proxy");
}

id objc_msgSend_readyToSwitchToLoginSession_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readyToSwitchToLoginSession:completionHandler:");
}

id objc_msgSend_readyToSwitchToUser_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readyToSwitchToUser:completionHandler:");
}

id objc_msgSend_registerPlain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerPlain:");
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_remoteProcessHasBooleanEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteProcessHasBooleanEntitlement:");
}

id objc_msgSend_remoteServiceName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteServiceName");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeClient:");
}

id objc_msgSend_removeFileAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeFileAtPath:error:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectIdenticalTo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectIdenticalTo:");
}

id objc_msgSend_removePath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removePath:error:");
}

id objc_msgSend_removePersonaKeyForUser_personaUUID_volumeUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removePersonaKeyForUser:personaUUID:volumeUUID:");
}

id objc_msgSend_removeUserSwitchTask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeUserSwitchTask:");
}

id objc_msgSend_removeUserSyncTask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeUserSyncTask:");
}

id objc_msgSend_renameFileFromPath_toPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "renameFileFromPath:toPath:error:");
}

id objc_msgSend_resetStateForUserSwitch(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetStateForUserSwitch");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_retrievePasscodeFromFileHandle_ofLength_withbaseaddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "retrievePasscodeFromFileHandle:ofLength:withbaseaddress:");
}

id objc_msgSend_se(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "se");
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceName");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set");
}

id objc_msgSend_setBubblePopstakeholderIsRegistered_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBubblePopstakeholderIsRegistered:");
}

id objc_msgSend_setBubbleStakeHolder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBubbleStakeHolder:");
}

id objc_msgSend_setCriticalStakeHolder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCriticalStakeHolder:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setFastLogoutTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFastLogoutTimer:");
}

id objc_msgSend_setGeneration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGeneration:");
}

id objc_msgSend_setIgnoreIdentityMethods_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIgnoreIdentityMethods:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setLogoutTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLogoutTimer:");
}

id objc_msgSend_setMachServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMachServiceName:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPersonaStakeHolderIsRegistered_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPersonaStakeHolderIsRegistered:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setStakeholderIsRegistered_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStakeholderIsRegistered:");
}

id objc_msgSend_setState_forToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setState:forToken:");
}

id objc_msgSend_setSwitchStakeHolderKind_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSwitchStakeHolderKind:");
}

id objc_msgSend_setSwitchState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSwitchState:");
}

id objc_msgSend_setUserPersonas_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserPersonas:");
}

id objc_msgSend_setUserToSwitchTo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserToSwitchTo:");
}

id objc_msgSend_setUsers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUsers:");
}

id objc_msgSend_setVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVersion:");
}

id objc_msgSend_setVolumePath_forPersona_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVolumePath:forPersona:");
}

id objc_msgSend_setWasToldWillSwitchUser_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWasToldWillSwitchUser:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setXpcConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setXpcConnection:");
}

id objc_msgSend_setXpcListener_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setXpcListener:");
}

id objc_msgSend_sharedBubbleXPCInterface(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedBubbleXPCInterface");
}

id objc_msgSend_sharedListener(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedListener");
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedManager");
}

id objc_msgSend_sharedServer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedServer");
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedService");
}

id objc_msgSend_sharedXPCInterface(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedXPCInterface");
}

id objc_msgSend_shell(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shell");
}

id objc_msgSend_sideEffects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sideEffects");
}

id objc_msgSend_sizeOfFileWithDescriptor_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sizeOfFileWithDescriptor:error:");
}

id objc_msgSend_sortedArrayUsingSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedArrayUsingSelector:");
}

id objc_msgSend_splitUserVolumeEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "splitUserVolumeEnabled");
}

id objc_msgSend_stakeholderIsRegistered(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stakeholderIsRegistered");
}

id objc_msgSend_startListening(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startListening");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "state");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_suspend(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "suspend");
}

id objc_msgSend_switchState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "switchState");
}

id objc_msgSend_switchToUser_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "switchToUser:");
}

id objc_msgSend_switchToUser_passcodeData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "switchToUser:passcodeData:");
}

id objc_msgSend_switchToUser_passcodeData_context_preferences_pid_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "switchToUser:passcodeData:context:preferences:pid:completionHandler:");
}

id objc_msgSend_syncProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "syncProxy");
}

id objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synchronousRemoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_taskDictionaryInArray_withUUIDString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "taskDictionaryInArray:withUUIDString:");
}

id objc_msgSend_terminatePID_withReasonNamespace_reasonCode_reasonString_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "terminatePID:withReasonNamespace:reasonCode:reasonString:error:");
}

id objc_msgSend_uid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uid");
}

id objc_msgSend_uniquePIDForPID_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uniquePIDForPID:error:");
}

id objc_msgSend_unloadIdentityFromSession_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unloadIdentityFromSession:error:");
}

id objc_msgSend_unlockIdentityInSession_passcode_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unlockIdentityInSession:passcode:error:");
}

id objc_msgSend_unmapVolume_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unmapVolume:error:");
}

id objc_msgSend_unmountVolumeWithSession_mountPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unmountVolumeWithSession:mountPath:error:");
}

id objc_msgSend_unmountVolumeWithSession_mountPath_error_force_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unmountVolumeWithSession:mountPath:error:force:");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongLongValue");
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongValue");
}

id objc_msgSend_updateLocalUsersAndGroupsWithError_updater_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateLocalUsersAndGroupsWithError:updater:");
}

id objc_msgSend_uploadContentWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uploadContentWithCompletionHandler:");
}

id objc_msgSend_userPersonas(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userPersonas");
}

id objc_msgSend_userSetFromDict_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userSetFromDict:");
}

id objc_msgSend_userSwitchTaskListDidUpdate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userSwitchTaskListDidUpdate");
}

id objc_msgSend_userSwitchTasks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userSwitchTasks");
}

id objc_msgSend_userSyncTasks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userSyncTasks");
}

id objc_msgSend_userToSwitchTo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userToSwitchTo");
}

id objc_msgSend_userWithUUID_uid_name_primaryGroupUUID_fullName_homeDirectory_shell_memberships_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userWithUUID:uid:name:primaryGroupUUID:fullName:homeDirectory:shell:memberships:");
}

id objc_msgSend_users(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "users");
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uuid");
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "version");
}

id objc_msgSend_wasToldWillSwitchUser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wasToldWillSwitchUser");
}

id objc_msgSend_willSwitchToUser_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willSwitchToUser:completionHandler:");
}

id objc_msgSend_writeToFileWithDescriptor_string_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFileWithDescriptor:string:error:");
}

id objc_msgSend_xpcConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcConnection");
}

id objc_msgSend_xpcListener(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcListener");
}
