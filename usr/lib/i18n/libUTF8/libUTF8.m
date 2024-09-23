uint64_t _citrus_UTF8_stdenc_cstombn(uint64_t a1, _BYTE *a2, unint64_t a3, uint64_t a4, uint64_t a5, _DWORD *a6, uint64_t a7, _QWORD *a8, uint64_t a9, void (*a10)(uint64_t), uint64_t a11)
{
  unint64_t v12;
  unint64_t v17;
  uint64_t v18;
  int v19;
  unsigned int v20;
  uint64_t result;
  _QWORD *v22;
  unint64_t v23;

  v23 = 0;
  v12 = *a6;
  if ((int)v12 < 1)
  {
    v18 = 0;
    LODWORD(v17) = 0;
    result = 0;
    goto LABEL_15;
  }
  v22 = a8;
  v17 = 0;
  v18 = 0;
  while (1)
  {
    a10(a11);
    v19 = *(_DWORD *)(a4 + 4 * v17);
    if (v19 != -1)
      break;
    v20 = 0;
LABEL_7:
    result = _citrus_UTF8_wcrtomb_priv(a2, a3, v20, (uint64_t *)&v23);
    if (!(_DWORD)result)
    {
      if (a3 < v23)
        _citrus_UTF8_stdenc_cstombn_cold_1();
      result = 0;
      ++v17;
      v18 += v23;
      a3 -= v23;
      if (a3)
      {
        a2 += v23;
        if (v17 < v12)
          continue;
      }
    }
    goto LABEL_14;
  }
  if (!v19)
  {
    v20 = *(_DWORD *)(a5 + 4 * v17);
    goto LABEL_7;
  }
  result = 92;
LABEL_14:
  a8 = v22;
LABEL_15:
  *a6 = v17;
  *a8 = v18;
  return result;
}

uint64_t _citrus_UTF8_wcrtomb_priv(_BYTE *a1, unint64_t a2, unsigned int a3, uint64_t *a4)
{
  unint64_t v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  char v11;

  if (a3 >> 11 == 27)
    goto LABEL_8;
  v4 = 0;
  v5 = &dword_24B73BEE8;
  while (*(v5 - 1) > a3 || *v5 <= a3)
  {
    ++v5;
    if (++v4 == 6)
      goto LABEL_8;
  }
  if (v4 >= 6)
  {
LABEL_8:
    v6 = 92;
LABEL_9:
    v7 = -1;
    goto LABEL_10;
  }
  v7 = v4 + 1;
  if (v4 + 1 > a2)
  {
    v6 = 7;
    goto LABEL_9;
  }
  if (a1)
  {
    if ((_DWORD)v4)
    {
      v9 = v4;
      do
      {
        a1[v9] = a3 & 0x3F | 0x80;
        a3 = (int)a3 >> 6;
      }
      while (v9-- > 1);
    }
    v6 = 0;
    v11 = a3 & 0x7F;
    if (v4)
    {
      v11 = a3 & (0x7Fu >> (v4 + 1)) | (0xFF00u >> (v4 + 1));
      v7 = v4 + 1;
    }
    else
    {
      v7 = 1;
    }
    *a1 = v11;
  }
  else
  {
    v6 = 0;
  }
LABEL_10:
  *a4 = v7;
  return v6;
}

uint64_t _citrus_UTF8_stdenc_mbtocsn(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int *a5, char **a6, unint64_t a7, uint64_t a8, _QWORD *a9, void (**a10)(void), void (*a11)(uint64_t), uint64_t a12)
{
  char *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t result;
  unint64_t v19;
  unsigned int v20;
  char *v21;
  char *v22;
  __int16 v24;
  unint64_t v29;
  unsigned int v30;

  v12 = *a6;
  *a9 = 0;
  v29 = 0;
  if (*a5 >= a7)
    v13 = a7;
  else
    v13 = *a5;
  if (v13)
  {
    v14 = a7;
    v16 = 0;
    v17 = 0;
    v24 = (__int16)v12;
    v30 = 0;
    while (1)
    {
      a11(a12);
      result = _citrus_UTF8_mbrtowc_priv(&v30, a6, v14, a8, &v29);
      if ((_DWORD)result)
        break;
      v19 = v29;
      if (v29 == -2)
      {
        result = 0;
        *a9 = -2;
        break;
      }
      v20 = v30;
      *(_DWORD *)(a2 + 4 * v17) = 0;
      *(_DWORD *)(a3 + 4 * v17) = v20;
      if (v19 > v14)
        _citrus_UTF8_stdenc_mbtocsn_cold_1();
      v16 += v19;
      *a9 = v16;
      v21 = *a6;
      if (*a6 < v12)
        _citrus_UTF8_stdenc_mbtocsn_cold_2();
      *(_WORD *)(a4 + 2 * v17) = (_WORD)v21 - v24;
      if (a10 && *a10)
        (*a10)();
      result = 0;
      if (++v17 < v13)
      {
        v22 = &v12[v14];
        v12 = v21;
        v14 = v22 - v21;
        if (v22 != v21)
          continue;
      }
      break;
    }
  }
  else
  {
    LODWORD(v17) = 0;
    result = 0;
  }
  *a5 = v17;
  return result;
}

uint64_t _citrus_UTF8_mbrtowc_priv(unsigned int *a1, char **a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  char *v5;
  int v6;
  unsigned int v7;
  uint64_t result;
  unsigned int v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  char v13;
  char *v14;
  uint64_t v15;
  char v16;
  char v17;
  uint64_t v18;

  v5 = *a2;
  if (!*a2)
  {
    result = 0;
    *(_DWORD *)(a4 + 8) = 0;
    *(_QWORD *)a4 = 0;
    *a5 = 0;
    return result;
  }
  v6 = *(_DWORD *)a4;
  if (*(_DWORD *)a4)
  {
    v7 = *(unsigned __int8 *)(a4 + 4);
  }
  else
  {
    if (!a3)
    {
LABEL_22:
      result = 0;
      *a2 = v5;
      *a5 = -2;
      return result;
    }
    --a3;
    v9 = *v5++;
    v7 = v9;
    v6 = 1;
    *(_DWORD *)a4 = 1;
    *(_BYTE *)(a4 + 4) = v9;
  }
  v10 = _UTF8_count_array[v7];
  if (_UTF8_count_array[v7])
    v11 = v6 <= (int)v10;
  else
    v11 = 0;
  if (!v11)
  {
LABEL_11:
    *a5 = -1;
    return 92;
  }
  if ((_DWORD)v10 != 1)
  {
    if (v6 >= (int)v10)
    {
      v7 &= 0x7Fu >> v10;
LABEL_24:
      v14 = (char *)(a4 + 5);
      v15 = v10 - 1;
      while (1)
      {
        v17 = *v14++;
        v16 = v17;
        if ((v17 & 0xC0) != 0x80)
          goto LABEL_11;
        v7 = v16 & 0x3F | (v7 << 6);
        if (!--v15)
          goto LABEL_27;
      }
    }
    while (a3)
    {
      --a3;
      v13 = *v5++;
      *(_DWORD *)a4 = v6 + 1;
      *(_BYTE *)(a4 + v6 + 4) = v13;
      v6 = *(_DWORD *)a4;
      if (*(_DWORD *)a4 >= (int)v10)
      {
        v7 = (0x7Fu >> v10) & *(unsigned __int8 *)(a4 + 4);
        if (v10 >= 2)
          goto LABEL_24;
LABEL_27:
        if (v7 >> 11 == 27)
          goto LABEL_11;
        v18 = 0;
        while (*(_DWORD *)((char *)&_UTF8_range + v18 + 4) > v7 || *(_DWORD *)((char *)&_UTF8_range + v18 + 8) <= v7)
        {
          v18 += 4;
          if (v18 == 24)
            goto LABEL_11;
        }
        if (4 * v10 - 4 != v18)
          goto LABEL_11;
        goto LABEL_13;
      }
    }
    goto LABEL_22;
  }
LABEL_13:
  if (a1)
    *a1 = v7;
  if (v7)
    v12 = v5 - *a2;
  else
    v12 = 0;
  result = 0;
  *a5 = v12;
  *a2 = v5;
  *(_DWORD *)a4 = 0;
  return result;
}

uint64_t _citrus_UTF8_stdenc_get_state_desc(uint64_t a1, _DWORD *a2, int a3, int *a4)
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

uint64_t _citrus_UTF8_stdenc_init(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  void *v7;
  uint64_t result;

  v6 = malloc_type_calloc(1uLL, 8uLL, 0x80040B8603338uLL);
  if (!v6)
    return *__error();
  v7 = v6;
  result = 0;
  *(_QWORD *)(a1 + 8) = v7;
  *(_OWORD *)a4 = xmmword_24B73BDD0;
  *(_QWORD *)(a4 + 16) = 1;
  return result;
}

uint64_t _citrus_UTF8_stdenc_getops(uint64_t a1)
{
  __int128 v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;

  v1 = unk_2579AF0F0;
  *(_OWORD *)a1 = _citrus_UTF8_stdenc_ops;
  *(_OWORD *)(a1 + 16) = v1;
  v2 = xmmword_2579AF100;
  v3 = *(_OWORD *)&off_2579AF110;
  v4 = xmmword_2579AF120;
  *(_QWORD *)(a1 + 80) = off_2579AF130;
  *(_OWORD *)(a1 + 48) = v3;
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 32) = v2;
  return 0;
}

void _citrus_UTF8_stdenc_uninit(uint64_t a1)
{
  if (a1)
    free(*(void **)(a1 + 8));
}

uint64_t _citrus_UTF8_stdenc_mbtocs(uint64_t a1, _DWORD *a2, unsigned int *a3, char **a4, uint64_t a5, uint64_t a6, _QWORD *a7, uint64_t a8)
{
  uint64_t v12;
  unsigned int v13;
  unsigned int v15;

  v15 = 0;
  v12 = _citrus_UTF8_mbrtowc_priv(&v15, a4, a5, a6, a7);
  if (!(_DWORD)v12)
  {
    if (*a7 != -2)
    {
      v13 = v15;
      *a2 = 0;
      *a3 = v13;
    }
    if (a8 && *(_QWORD *)a8)
      (*(void (**)(_QWORD, _QWORD))a8)(*a3, *(_QWORD *)(a8 + 16));
  }
  return v12;
}

uint64_t _citrus_UTF8_stdenc_cstomb(uint64_t a1, _BYTE *a2, unint64_t a3, int a4, unsigned int a5, uint64_t a6, uint64_t *a7)
{
  if (a4 == -1)
  {
    a5 = 0;
  }
  else if (a4)
  {
    return 92;
  }
  return _citrus_UTF8_wcrtomb_priv(a2, a3, a5, a7);
}

uint64_t _citrus_UTF8_stdenc_mbtowc(uint64_t a1, unsigned int *a2, char **a3, uint64_t a4, uint64_t a5, _QWORD *a6, uint64_t a7)
{
  uint64_t v9;
  uint64_t v10;
  void (*v11)(_QWORD, _QWORD);

  v9 = _citrus_UTF8_mbrtowc_priv(a2, a3, a4, a5, a6);
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

uint64_t _citrus_UTF8_stdenc_wctomb(uint64_t a1, _BYTE *a2, unint64_t a3, unsigned int a4, uint64_t a5, uint64_t *a6)
{
  return _citrus_UTF8_wcrtomb_priv(a2, a3, a4, a6);
}

uint64_t _citrus_UTF8_stdenc_put_state_reset(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  *a5 = 0;
  return 0;
}

void _citrus_UTF8_stdenc_mbtocsn_cold_1()
{
  __assert_rtn("_citrus_UTF8_stdenc_mbtocsn", "citrus_stdenc_template.h", 219, "accum <= n");
}

void _citrus_UTF8_stdenc_mbtocsn_cold_2()
{
  __assert_rtn("_citrus_UTF8_stdenc_mbtocsn", "citrus_stdenc_template.h", 221, "*s >= last");
}

void _citrus_UTF8_stdenc_cstombn_cold_1()
{
  __assert_rtn("_citrus_UTF8_stdenc_cstombn", "citrus_stdenc_template.h", 265, "tmp <= n");
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

