uint64_t _citrus_BIG5_stdenc_init(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v8;
  _QWORD *v9;
  uint64_t i;
  uint64_t j;
  uint64_t k;
  uint64_t result;

  v8 = malloc_type_calloc(1uLL, 0x410uLL, 0x10A0040E7A18792uLL);
  if (v8)
  {
    v9 = v8;
    bzero(v8, 0x410uLL);
    v9[1] = v9;
    if (a2 && a3 && *(_BYTE *)_citrus_bcs_skip_ws_len())
    {
      if (!_citrus_prop_parse_variable())
      {
LABEL_13:
        result = 0;
        *(_QWORD *)(a1 + 8) = v9;
        *(_OWORD *)a4 = xmmword_24B729F50;
        *(_QWORD *)(a4 + 16) = 1;
        return result;
      }
      _citrus_BIG5_encoding_module_uninit((uint64_t)v9);
      bzero(v9, 0x410uLL);
      v9[1] = v9;
    }
    for (i = 0; i != 376; i += 4)
      *(_DWORD *)((char *)v9 + i + 660) |= 1u;
    for (j = 0; j != 252; j += 4)
      *(_DWORD *)((char *)v9 + j + 272) |= 2u;
    for (k = 0; k != 376; k += 4)
      *(_DWORD *)((char *)v9 + k + 660) |= 2u;
    goto LABEL_13;
  }
  return *__error();
}

void _citrus_BIG5_stdenc_uninit(uint64_t a1)
{
  void *v1;

  if (a1)
  {
    v1 = *(void **)(a1 + 8);
    _citrus_BIG5_encoding_module_uninit((uint64_t)v1);
    free(v1);
  }
}

uint64_t _citrus_BIG5_stdenc_mbtocs(uint64_t a1, _DWORD *a2, int *a3, uint64_t *a4, uint64_t a5, int *a6, uint64_t *a7, uint64_t a8)
{
  uint64_t v12;
  int v13;
  int v15;

  v15 = 0;
  v12 = _citrus_BIG5_mbrtowc_priv(*(_QWORD **)(a1 + 8), &v15, a4, a5, a6, a7);
  if (!(_DWORD)v12)
  {
    if (*a7 != -2)
    {
      v13 = v15;
      *a2 = v15 > 255;
      *a3 = v13;
    }
    if (a8 && *(_QWORD *)a8)
      (*(void (**)(_QWORD, _QWORD))a8)(*a3, *(_QWORD *)(a8 + 16));
  }
  return v12;
}

uint64_t _citrus_BIG5_stdenc_cstomb(uint64_t a1, _WORD *a2, unint64_t a3, unsigned int a4, unsigned int a5, uint64_t a6, uint64_t *a7)
{
  if (a4 == -1)
  {
    a5 = 0;
  }
  else if (a4 > 1)
  {
    return 92;
  }
  return _citrus_BIG5_wcrtomb_priv(*(_QWORD **)(a1 + 8), a2, a3, a5, a7);
}

uint64_t _citrus_BIG5_stdenc_mbtowc(uint64_t a1, _DWORD *a2, uint64_t *a3, uint64_t a4, int *a5, uint64_t *a6, uint64_t a7)
{
  uint64_t v9;
  uint64_t v10;
  void (*v11)(_QWORD, _QWORD);

  v9 = _citrus_BIG5_mbrtowc_priv(*(_QWORD **)(a1 + 8), a2, a3, a4, a5, a6);
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

uint64_t _citrus_BIG5_stdenc_wctomb(uint64_t a1, _WORD *a2, unint64_t a3, unsigned int a4, uint64_t a5, uint64_t *a6)
{
  return _citrus_BIG5_wcrtomb_priv(*(_QWORD **)(a1 + 8), a2, a3, a4, a6);
}

uint64_t _citrus_BIG5_stdenc_put_state_reset(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  *a5 = 0;
  return 0;
}

uint64_t _citrus_BIG5_stdenc_get_state_desc(uint64_t a1, _DWORD *a2, int a3, int *a4)
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

uint64_t _citrus_BIG5_stdenc_getops(uint64_t a1)
{
  __int128 v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;

  v1 = *(_OWORD *)algn_2579AEC78;
  *(_OWORD *)a1 = _citrus_BIG5_stdenc_ops;
  *(_OWORD *)(a1 + 16) = v1;
  v2 = xmmword_2579AEC88;
  v3 = *(_OWORD *)&off_2579AEC98;
  v4 = xmmword_2579AECA8;
  *(_QWORD *)(a1 + 80) = qword_2579AECB8;
  *(_OWORD *)(a1 + 48) = v3;
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 32) = v2;
  return 0;
}

uint64_t *_citrus_BIG5_encoding_module_uninit(uint64_t a1)
{
  uint64_t *result;
  uint64_t v3;
  _QWORD *v4;

  result = *(uint64_t **)a1;
  if (result)
  {
    do
    {
      v3 = *result;
      v4 = (_QWORD *)result[1];
      if (*result)
      {
        *(_QWORD *)(v3 + 8) = v4;
        v4 = (_QWORD *)result[1];
      }
      else
      {
        *(_QWORD *)(a1 + 8) = v4;
      }
      *v4 = v3;
      free(result);
      result = *(uint64_t **)a1;
    }
    while (*(_QWORD *)a1);
  }
  return result;
}

uint64_t _citrus_BIG5_fill_rowcol(uint64_t a1, const char *a2, unint64_t a3, unint64_t a4)
{
  unint64_t v5;
  char v7;
  int v8;

  if ((a4 | a3) > 0xFF)
    return 22;
  v5 = a3;
  v7 = strcmp("row", a2) != 0;
  if (v5 <= a4)
  {
    v8 = 1 << v7;
    do
      *(_DWORD *)(a1 + 4 * v5++ + 16) |= v8;
    while (a4 + 1 != v5);
  }
  return 0;
}

uint64_t _citrus_BIG5_fill_excludes(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  int v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  _DWORD *v9;
  _DWORD *v10;
  uint64_t result;

  if ((a4 | a3) >> 16)
    return 22;
  v4 = a4;
  v5 = a3;
  v7 = *(_QWORD *)(a1 + 8);
  v8 = **(_QWORD **)(v7 + 8);
  if (v8 && *(_DWORD *)(v8 + 20) >= (int)a3)
    return 22;
  v9 = malloc_type_malloc(0x18uLL, 0x10A00404E934A1DuLL);
  if (!v9)
    return 12;
  v10 = v9;
  result = 0;
  v10[4] = v5;
  v10[5] = v4;
  *(_QWORD *)v10 = 0;
  *((_QWORD *)v10 + 1) = v7;
  *(_QWORD *)v7 = v10;
  *(_QWORD *)(a1 + 8) = v10;
  return result;
}

uint64_t _citrus_BIG5_mbrtowc_priv(_QWORD *a1, _DWORD *a2, uint64_t *a3, uint64_t a4, int *a5, uint64_t *a6)
{
  uint64_t v6;
  int v7;
  unsigned int v8;
  uint64_t result;
  unsigned int v10;
  int v11;
  int v12;
  int v13;
  uint64_t *v14;
  int v15;
  char v16;
  uint64_t v17;

  v6 = *a3;
  if (!*a3)
  {
    result = 0;
    *(_QWORD *)a5 = 0;
    goto LABEL_29;
  }
  v7 = *a5;
  if (*a5)
  {
    if (v7 != 1)
    {
LABEL_27:
      *a5 = 0;
      result = 92;
      v6 = -1;
      goto LABEL_29;
    }
    v8 = *((unsigned __int8 *)a5 + 4);
  }
  else
  {
    if (!a4)
    {
LABEL_28:
      result = 0;
      *a3 = v6;
      v6 = -2;
      goto LABEL_29;
    }
    v10 = *(unsigned __int8 *)v6++;
    v8 = v10;
    *((_BYTE *)a5 + 4) = v10;
    *a5 = 1;
    --a4;
  }
  v11 = *((_DWORD *)a1 + v8 + 4);
  if ((v11 & 1) != 0)
    v12 = 2;
  else
    v12 = 1;
  if ((v11 & 1) != 0)
  {
    v15 = 1;
    while (a4)
    {
      v16 = *(_BYTE *)v6++;
      *((_BYTE *)a5 + v15 + 4) = v16;
      v15 = *a5 + 1;
      *a5 = v15;
      --a4;
      if (v15 >= v12)
      {
        if ((v11 & 1) == 0)
          goto LABEL_12;
        v17 = *((unsigned __int8 *)a5 + 5);
        if ((*((_DWORD *)a1 + v17 + 4) & 2) != 0)
        {
          v13 = v17 | (*((unsigned __int8 *)a5 + 4) << 8);
          goto LABEL_13;
        }
        goto LABEL_27;
      }
    }
    goto LABEL_28;
  }
LABEL_12:
  v13 = *((unsigned __int8 *)a5 + 4);
LABEL_13:
  v14 = (uint64_t *)*a1;
  if (*a1)
  {
    while (*((_DWORD *)v14 + 4) > v13 || *((_DWORD *)v14 + 5) < v13)
    {
      v14 = (uint64_t *)*v14;
      if (!v14)
        goto LABEL_17;
    }
    goto LABEL_27;
  }
LABEL_17:
  *a3 = v6;
  *a5 = 0;
  if (a2)
    *a2 = v13;
  result = 0;
  LODWORD(v6) = v12 - v7;
  if (!v13)
    LODWORD(v6) = 0;
  v6 = (int)v6;
LABEL_29:
  *a6 = v6;
  return result;
}

uint64_t _citrus_BIG5_wcrtomb_priv(_QWORD *a1, _WORD *a2, unint64_t a3, unsigned int a4, uint64_t *a5)
{
  uint64_t *v5;
  uint64_t result;
  uint64_t v7;

  if (HIWORD(a4))
    goto LABEL_12;
  v5 = (uint64_t *)*a1;
  if (*a1)
  {
    while (*((_DWORD *)v5 + 4) > (signed int)a4 || *((_DWORD *)v5 + 5) < (signed int)a4)
    {
      v5 = (uint64_t *)*v5;
      if (!v5)
        goto LABEL_6;
    }
    goto LABEL_12;
  }
LABEL_6:
  if ((a4 & 0x8000) != 0)
  {
    if ((*((_DWORD *)a1 + BYTE1(a4) + 4) & 1) != 0 && (*((_DWORD *)a1 + a4 + 4) & 2) != 0)
    {
      if (a3 >= 2)
      {
        result = 0;
        *a2 = bswap32(a4) >> 16;
        v7 = 2;
        goto LABEL_14;
      }
      goto LABEL_16;
    }
LABEL_12:
    result = 92;
LABEL_13:
    v7 = -1;
    goto LABEL_14;
  }
  if (a4 > 0xFF)
    goto LABEL_12;
  if (!a3)
  {
LABEL_16:
    result = 7;
    goto LABEL_13;
  }
  result = 0;
  *(_BYTE *)a2 = a4;
  v7 = 1;
LABEL_14:
  *a5 = v7;
  return result;
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t _citrus_bcs_skip_ws_len()
{
  return MEMORY[0x24BEDBE60]();
}

uint64_t _citrus_prop_parse_variable()
{
  return MEMORY[0x24BEDBEF8]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

