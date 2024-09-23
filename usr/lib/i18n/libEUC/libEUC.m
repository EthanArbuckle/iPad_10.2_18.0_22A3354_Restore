uint64_t _citrus_EUC_stdenc_init(uint64_t a1, unsigned __int8 *a2)
{
  void *v3;
  void *v4;
  int v5;

  v3 = malloc_type_calloc(1uLL, 0x28uLL, 0x10000400A747E1EuLL);
  if (!v3)
    return *__error();
  v4 = v3;
  if (a2)
  {
    while (1)
    {
      v5 = *a2;
      if (v5 != 32 && v5 != 9)
        break;
      ++a2;
    }
    *((_DWORD *)v3 + 9) = 1;
    *((_DWORD *)v3 + 5) = _citrus_bcs_strtol();
  }
  free(v4);
  return 79;
}

void _citrus_EUC_stdenc_uninit(uint64_t a1)
{
  if (a1)
    free(*(void **)(a1 + 8));
}

uint64_t _citrus_EUC_stdenc_mbtocs(uint64_t a1, int *a2, int *a3, char **a4, uint64_t a5, int *a6, _QWORD *a7, uint64_t a8)
{
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  int v17;

  v17 = 0;
  v12 = *(_QWORD *)(a1 + 8);
  v13 = _citrus_EUC_mbrtowc_priv(v12, &v17, a4, a5, a6, a7);
  if (!(_DWORD)v13)
  {
    if (*a7 != -2)
    {
      v14 = *(_DWORD *)(v12 + 16) & v17;
      v15 = v14 ^ v17;
      *a2 = v14;
      *a3 = v15;
    }
    if (a8 && *(_QWORD *)a8)
      (*(void (**)(_QWORD, _QWORD))a8)(*a3, *(_QWORD *)(a8 + 16));
  }
  return v13;
}

uint64_t _citrus_EUC_stdenc_cstomb(uint64_t a1, char *a2, unint64_t a3, int a4, int a5, uint64_t a6, uint64_t *a7)
{
  uint64_t v7;
  int v9;

  v7 = *(_QWORD *)(a1 + 8);
  if (a4 == -1)
  {
    v9 = 0;
  }
  else
  {
    if (a4 & ~*(_DWORD *)(v7 + 16) | *(_DWORD *)(v7 + 16) & a5)
      return 22;
    v9 = a5 | a4;
  }
  return _citrus_EUC_wcrtomb_priv(v7, a2, a3, v9, a7);
}

uint64_t _citrus_EUC_stdenc_mbtowc(uint64_t a1, int *a2, char **a3, uint64_t a4, int *a5, _QWORD *a6, uint64_t a7)
{
  uint64_t v9;
  uint64_t v10;
  void (*v11)(_QWORD, _QWORD);

  v9 = _citrus_EUC_mbrtowc_priv(*(_QWORD *)(a1 + 8), a2, a3, a4, a5, a6);
  v10 = v9;
  if (a7)
  {
    if (!(_DWORD)v9)
    {
      v11 = *(void (**)(_QWORD, _QWORD))(a7 + 8);
      if (v11)
        v11(*a2, *(_QWORD *)(a7 + 16));
    }
  }
  return v10;
}

uint64_t _citrus_EUC_stdenc_wctomb(uint64_t a1, char *a2, unint64_t a3, int a4, uint64_t a5, uint64_t *a6)
{
  return _citrus_EUC_wcrtomb_priv(*(_QWORD *)(a1 + 8), a2, a3, a4, a6);
}

uint64_t _citrus_EUC_stdenc_put_state_reset(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  *a5 = 0;
  return 0;
}

uint64_t _citrus_EUC_stdenc_get_state_desc(uint64_t a1, _DWORD *a2, int a3, int *a4)
{
  uint64_t result;
  int v5;

  if (a3)
    return 102;
  result = 0;
  if (*a2)
    v5 = 3;
  else
    v5 = 1;
  *a4 = v5;
  return result;
}

uint64_t _citrus_EUC_stdenc_getops(uint64_t a1)
{
  __int128 v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;

  v1 = unk_2579AED80;
  *(_OWORD *)a1 = _citrus_EUC_stdenc_ops;
  *(_OWORD *)(a1 + 16) = v1;
  v2 = xmmword_2579AED90;
  v3 = *(_OWORD *)&off_2579AEDA0;
  v4 = xmmword_2579AEDB0;
  *(_QWORD *)(a1 + 80) = qword_2579AEDC0;
  *(_OWORD *)(a1 + 48) = v3;
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 32) = v2;
  return 0;
}

uint64_t _citrus_EUC_mbrtowc_priv(uint64_t a1, int *a2, char **a3, uint64_t a4, int *a5, _QWORD *a6)
{
  char *v6;
  int v7;
  int v8;
  uint64_t result;
  char v10;
  unsigned __int8 *v11;
  unsigned int v12;
  int v13;
  int v14;
  int v15;
  char v16;
  uint64_t v17;
  _BOOL4 v18;
  int v19;
  int v20;
  unsigned int v21;
  int v22;
  int v23;
  int v24;

  v6 = *a3;
  if (!*a3)
  {
    result = 0;
    *(_QWORD *)a5 = 0;
    *a6 = 0;
    return result;
  }
  v7 = *a5;
  if ((*a5 - 1) >= 2)
  {
    if (v7)
    {
LABEL_20:
      *a5 = 0;
      *a6 = -1;
      return 92;
    }
    if (!a4)
    {
LABEL_30:
      result = 0;
      *a6 = -2;
      *a3 = v6;
      return result;
    }
    v10 = *v6++;
    *((_BYTE *)a5 + 4) = v10;
    v8 = 1;
    *a5 = 1;
    --a4;
  }
  else
  {
    v8 = *a5;
  }
  v11 = (unsigned __int8 *)(a5 + 1);
  if ((char)a5[1] < 0)
  {
    v13 = *((unsigned __int8 *)a5 + 4);
    if (v13 == 142)
      v14 = 2;
    else
      v14 = 1;
    if (v13 == 143)
      v12 = 3;
    else
      v12 = v14;
  }
  else
  {
    v12 = 0;
  }
  v15 = *(_DWORD *)(a1 + 4 * v12 + 20);
  if (!v15)
    goto LABEL_20;
  while (v8 < v15)
  {
    if (!a4)
      goto LABEL_30;
    v16 = *v6++;
    *((_BYTE *)a5 + v8 + 4) = v16;
    v8 = *a5 + 1;
    *a5 = v8;
    --a4;
  }
  v17 = v12;
  *a3 = v6;
  v18 = v12 > 1;
  if (v12 <= 1)
    v19 = 0;
  else
    v19 = -1;
  if (v15 - v18 < 1)
  {
    v20 = 0;
  }
  else
  {
    v20 = 0;
    if (v17 > 1)
      v11 = (unsigned __int8 *)a5 + 5;
    v21 = v15 + v19 + 1;
    do
    {
      v22 = *v11++;
      v20 = v22 | (v20 << 8);
      --v21;
    }
    while (v21 > 1);
  }
  v23 = v20 & ~*(_DWORD *)(a1 + 16) | *(_DWORD *)(a1 + 4 * v17);
  *a5 = 0;
  if (a2)
    *a2 = v23;
  result = 0;
  v24 = v15 - v7;
  if (!v23)
    v24 = 0;
  *a6 = v24;
  return result;
}

uint64_t _citrus_EUC_wcrtomb_priv(uint64_t a1, char *a2, unint64_t a3, int a4, uint64_t *a5)
{
  uint64_t v5;
  int v6;
  int v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int *v10;
  unsigned __int16 v11;
  int v12;
  uint64_t result;
  uint64_t v14;
  char v15;
  char v16;
  unint64_t v17;
  char v18;
  unsigned int v19;
  uint64x2_t v20;
  uint64_t v21;
  int32x2_t v22;
  int32x2_t v23;
  int32x2_t v24;

  v5 = 0;
  v6 = *(_DWORD *)(a1 + 16) & a4;
  v7 = v6 ^ a4;
  while (v6 != *(_DWORD *)(a1 + 4 * v5))
  {
    if (++v5 == 4)
    {
      v8 = 1;
      goto LABEL_8;
    }
  }
  if ((_DWORD)v5 == 4)
    v8 = 1;
  else
    v8 = v5;
LABEL_8:
  v9 = a1 + 4 * v8;
  v12 = *(_DWORD *)(v9 + 20);
  v10 = (unsigned int *)(v9 + 20);
  v11 = v12;
  if ((__int16)v12 > a3)
  {
    result = 7;
    v14 = -1;
    goto LABEL_23;
  }
  v15 = v8 != 0;
  if (v8 == 2)
  {
    v16 = -114;
    goto LABEL_14;
  }
  if (v8 == 3)
  {
    v16 = -113;
LABEL_14:
    *a2++ = v16;
    --v11;
  }
  if ((__int16)v11 >= 1)
  {
    v17 = 0;
    v18 = v15 << 7;
    v19 = v11;
    v20 = (uint64x2_t)vdupq_n_s64((unint64_t)v11 - 1);
    v21 = (v11 + 1) & 0x1FFFE;
    v22 = vadd_s32(vdup_n_s32(v19), (int32x2_t)0xFFFFFFFF00000000);
    do
    {
      v23 = vmovn_s64((int64x2_t)vcgeq_u64(v20, (uint64x2_t)vorrq_s8((int8x16_t)vdupq_n_s64(v17), (int8x16_t)xmmword_24B72CF80)));
      v24 = vadd_s32(v22, (int32x2_t)-1);
      if ((v23.i8[0] & 1) != 0)
        a2[v17] = (v7 >> (8 * v24.i8[0])) | v18;
      if ((v23.i8[4] & 1) != 0)
        a2[v17 + 1] = (v7 >> (8 * v24.i8[4])) | v18;
      v17 += 2;
      v22 = vadd_s32(v22, (int32x2_t)0x100000001);
    }
    while (v21 != v17);
  }
  result = 0;
  v14 = *v10;
LABEL_23:
  *a5 = v14;
  return result;
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t _citrus_bcs_strtol()
{
  return MEMORY[0x24BEDBE78]();
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

