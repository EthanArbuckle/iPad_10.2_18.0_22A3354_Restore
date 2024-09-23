uint64_t _citrus_MSKanji_stdenc_init(uint64_t a1, char *a2, unint64_t a3, uint64_t a4)
{
  _DWORD *v8;
  _DWORD *v9;
  char v10;
  uint64_t result;

  v8 = malloc_type_calloc(1uLL, 4uLL, 0x100004052888210uLL);
  if (!v8)
    return *__error();
  v9 = v8;
  for (*v8 = 0; a3; --a3)
  {
    v10 = *a2;
    if ((*a2 - 123) >= 0xE6u)
      v10 = *a2 - 32;
    if (a3 >= 7 && v10 == 74 && !_citrus_bcs_strncasecmp())
    {
      *v9 |= 1u;
      a2 += 7;
      a3 -= 7;
    }
    ++a2;
  }
  result = 0;
  *(_QWORD *)(a1 + 8) = v9;
  *(_OWORD *)a4 = xmmword_24B735F60;
  *(_QWORD *)(a4 + 16) = 1;
  return result;
}

void _citrus_MSKanji_stdenc_uninit(uint64_t a1)
{
  if (a1)
    free(*(void **)(a1 + 8));
}

uint64_t _citrus_MSKanji_stdenc_mbtocs(uint64_t a1, _DWORD *a2, unsigned int *a3, char **a4, uint64_t a5, int *a6, _QWORD *a7, uint64_t a8)
{
  _DWORD *v12;
  uint64_t result;
  unsigned int v14;
  int v15;
  int v17;
  int v19;
  int v20;
  unsigned int v21;
  int v22;
  unsigned int v23;
  unsigned int v24;
  int v25;
  unsigned int v26;

  v26 = 0;
  v12 = *(_DWORD **)(a1 + 8);
  result = _citrus_MSKanji_mbrtowc_priv((int *)&v26, a4, a5, a6, a7);
  if (!(_DWORD)result)
  {
    if (*a7 != -2)
    {
      v14 = v26;
      if (v26 > 0x7F)
      {
        if (v26 > 0xFF)
        {
          v15 = BYTE1(v26);
          if (BYTE1(v26) - 129 >= 0x1F && BYTE1(v26) - 224 > 0x1C)
            return 92;
          v17 = v26;
          if (v26 - 64 >= 0x3F && v26 - 128 > 0x7C)
            return 92;
          if (BYTE1(v26) >= 0xF0u && (*v12 & 1) != 0)
          {
            *a2 = 3;
            if (v14 - 61599 < 0x5E || v14 > 0xF29E)
              v19 = -237;
            else
              v19 = -240;
            if (v14 <= 0xF49E)
              v20 = v19;
            else
              v20 = -206;
          }
          else
          {
            *a2 = 2;
            v20 = -129;
          }
          v21 = v20 + v15;
          if (v21 <= 0x5E)
            v22 = 2 * v21;
          else
            v22 = 2 * v21 + 16777088;
          v23 = v17 - 31;
          v24 = v17 - 32;
          if (v23 > 0x60)
            v23 = v24;
          if (v23 <= 0x7E)
          {
            v25 = 33;
          }
          else
          {
            v23 -= 94;
            v25 = 34;
          }
          v14 = v23 | ((v22 + v25) << 8);
        }
        else
        {
          *a2 = 1;
          v14 &= 0x7Fu;
        }
      }
      else
      {
        *a2 = 0;
      }
      *a3 = v14;
    }
    if (a8)
    {
      if (*(_QWORD *)a8)
        (*(void (**)(_QWORD, _QWORD))a8)(*a3, *(_QWORD *)(a8 + 16));
    }
    return 0;
  }
  return result;
}

uint64_t _citrus_MSKanji_stdenc_cstomb(uint64_t a1, _BYTE *a2, unint64_t a3, int a4, unsigned int a5, uint64_t a6, uint64_t *a7)
{
  unsigned int v7;
  unsigned int v8;
  int v9;
  unsigned int v12;
  int v13;

  v7 = 0;
  switch(a4)
  {
    case -1:
      return _citrus_MSKanji_wcrtomb_priv(a2, a3, v7, a7);
    case 0:
      v7 = a5;
      if (a5 <= 0x7F)
        return _citrus_MSKanji_wcrtomb_priv(a2, a3, v7, a7);
      return 92;
    case 1:
      if (a5 > 0x7F)
        return 92;
      v7 = a5 + 128;
      return _citrus_MSKanji_wcrtomb_priv(a2, a3, v7, a7);
    case 2:
      if (a5 - 38912 < 0xFFFF8900)
        return 92;
      v8 = a5 >> 8;
      if (a5 >> 8 >= 0x5F)
        v9 = 193;
      else
        v9 = 129;
      goto LABEL_21;
    case 3:
      if ((**(_BYTE **)(a1 + 8) & 1) == 0)
        return 92;
      v8 = a5 >> 8;
      if (a5 >> 8 < 0x21)
        return 92;
      if (a5 >> 12 > 2)
      {
        if ((a5 - 19712) >> 9 >= 0x19)
          return 92;
        v9 = 206;
      }
      else if (v8 == 34 || a5 >> 9 > 0x12)
      {
        v9 = 237;
      }
      else
      {
        v9 = 240;
      }
LABEL_21:
      if (a5 - 127 < 0xFFFFFFA2)
        return 92;
      v12 = v8 - 33;
      if (a5 <= 0x5Fu)
        v13 = 31;
      else
        v13 = 32;
      if ((v12 & 1) != 0)
        v13 = 126;
      v7 = (v13 + a5) | ((v9 + (v12 >> 1)) << 8);
      return _citrus_MSKanji_wcrtomb_priv(a2, a3, v7, a7);
    default:
      return 92;
  }
}

uint64_t _citrus_MSKanji_stdenc_mbtowc(uint64_t a1, int *a2, char **a3, uint64_t a4, int *a5, _QWORD *a6, uint64_t a7)
{
  uint64_t v9;
  uint64_t v10;
  void (*v11)(_QWORD, _QWORD);

  v9 = _citrus_MSKanji_mbrtowc_priv(a2, a3, a4, a5, a6);
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

uint64_t _citrus_MSKanji_stdenc_wctomb(uint64_t a1, _BYTE *a2, unint64_t a3, unsigned int a4, uint64_t a5, uint64_t *a6)
{
  return _citrus_MSKanji_wcrtomb_priv(a2, a3, a4, a6);
}

uint64_t _citrus_MSKanji_stdenc_put_state_reset(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  *a5 = 0;
  return 0;
}

uint64_t _citrus_MSKanji_stdenc_get_state_desc(uint64_t a1, _DWORD *a2, int a3, int *a4)
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

uint64_t _citrus_MSKanji_stdenc_getops(uint64_t a1)
{
  __int128 v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;

  v1 = unk_2579AEF90;
  *(_OWORD *)a1 = _citrus_MSKanji_stdenc_ops;
  *(_OWORD *)(a1 + 16) = v1;
  v2 = xmmword_2579AEFA0;
  v3 = *(_OWORD *)&off_2579AEFB0;
  v4 = xmmword_2579AEFC0;
  *(_QWORD *)(a1 + 80) = qword_2579AEFD0;
  *(_OWORD *)(a1 + 48) = v3;
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 32) = v2;
  return 0;
}

uint64_t _citrus_MSKanji_mbrtowc_priv(int *a1, char **a2, uint64_t a3, int *a4, _QWORD *a5)
{
  char *v5;
  int v6;
  int v7;
  uint64_t result;
  int v9;
  unsigned int v10;
  unsigned int v11;
  _BOOL4 v13;
  int v14;
  int v15;
  char v16;
  int v17;
  int v18;
  int v19;

  v5 = *a2;
  if (!*a2)
  {
    result = 0;
    *(_QWORD *)a4 = 0;
    *a5 = 0;
    return result;
  }
  v6 = *a4;
  if (*a4)
  {
    if (v6 != 1)
    {
LABEL_24:
      *a4 = 0;
      *a5 = -1;
      return 92;
    }
    v7 = *((unsigned __int8 *)a4 + 4);
  }
  else
  {
    if (!a3)
    {
LABEL_32:
      result = 0;
      *a5 = -2;
      *a2 = v5;
      return result;
    }
    v9 = *v5++;
    v7 = v9;
    *((_BYTE *)a4 + 4) = v9;
    *a4 = 1;
    --a3;
  }
  v10 = v7 - 129;
  v11 = v7 - 224;
  v13 = v10 < 0x1F || v11 < 0x1D;
  if (v13)
    v14 = 2;
  else
    v14 = 1;
  if (v13)
  {
    v15 = 1;
    while (a3)
    {
      v16 = *v5++;
      *((_BYTE *)a4 + v15 + 4) = v16;
      v15 = *a4 + 1;
      *a4 = v15;
      --a3;
      if (v15 >= v14)
      {
        *a2 = v5;
        v17 = *((unsigned __int8 *)a4 + 5);
        if ((v17 - 64) < 0x3F || (v17 - 128) <= 0x7C)
        {
          v18 = v17 | (*((unsigned __int8 *)a4 + 4) << 8);
          goto LABEL_27;
        }
        goto LABEL_24;
      }
    }
    goto LABEL_32;
  }
  *a2 = v5;
  v18 = *((unsigned __int8 *)a4 + 4);
LABEL_27:
  *a4 = 0;
  if (a1)
    *a1 = v18;
  result = 0;
  v19 = v14 - v6;
  if (!v18)
    v19 = 0;
  *a5 = v19;
  return result;
}

uint64_t _citrus_MSKanji_wcrtomb_priv(_BYTE *a1, unint64_t a2, unsigned int a3, uint64_t *a4)
{
  uint64_t result;
  uint64_t v5;

  if (HIWORD(a3))
  {
LABEL_8:
    result = 92;
LABEL_14:
    v5 = -1;
    goto LABEL_15;
  }
  if ((a3 & 0xFF00) == 0)
  {
    if (a2)
    {
      *a1 = a3;
      result = 92;
      if (a3 - 129 < 0x1F || a3 - 224 <= 0x1C)
        goto LABEL_14;
      result = 0;
      v5 = 1;
      goto LABEL_15;
    }
LABEL_13:
    result = 7;
    goto LABEL_14;
  }
  if (a2 < 2)
    goto LABEL_13;
  *(_WORD *)a1 = bswap32(a3) >> 16;
  if ((a3 >> 8) - 129 >= 0x1F && (a3 >> 8) - 224 > 0x1C)
    goto LABEL_8;
  result = 0;
  v5 = 2;
  if (a3 - 64 >= 0x3F && a3 - 128 >= 0x7D)
    goto LABEL_8;
LABEL_15:
  *a4 = v5;
  return result;
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t _citrus_bcs_strncasecmp()
{
  return MEMORY[0x24BEDBE70]();
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

