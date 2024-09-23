uint64_t _citrus_DECKanji_stdenc_init(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  void *v7;
  uint64_t result;

  v6 = malloc_type_calloc(1uLL, 4uLL, 0x100004052888210uLL);
  if (!v6)
    return *__error();
  v7 = v6;
  result = 0;
  *(_QWORD *)(a1 + 8) = v7;
  *(_OWORD *)a4 = xmmword_24B72BF70;
  *(_QWORD *)(a4 + 16) = 1;
  return result;
}

void _citrus_DECKanji_stdenc_uninit(uint64_t a1)
{
  if (a1)
    free(*(void **)(a1 + 8));
}

uint64_t _citrus_DECKanji_stdenc_mbtocs(uint64_t a1, int *a2, unsigned int *a3, char **a4, uint64_t a5, unint64_t *a6, _QWORD *a7, uint64_t a8)
{
  uint64_t v12;
  unsigned int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  unsigned int v19;

  v19 = 0;
  v12 = _citrus_DECKanji_mbrtowc_priv(&v19, a4, a5, a6, a7);
  if (!(_DWORD)v12)
  {
    if (*a7 != -2)
    {
      v13 = v19;
      if ((v19 & 0x80) != 0)
        v14 = 2;
      else
        v14 = 3;
      if (v19 >= 0x100)
        v15 = v14;
      else
        v15 = 1;
      if (v19 >= 0x100)
        v16 = 32639;
      else
        v16 = 127;
      if (v19 >= 0x80)
      {
        v17 = v16;
      }
      else
      {
        v15 = 0;
        v17 = 127;
      }
      *a2 = v15;
      *a3 = v17 & v13;
    }
    if (a8 && *(_QWORD *)a8)
      (*(void (**)(_QWORD, _QWORD))a8)(*a3, *(_QWORD *)(a8 + 16));
  }
  return v12;
}

uint64_t _citrus_DECKanji_stdenc_cstomb(uint64_t a1, void *a2, unint64_t a3, int a4, unsigned int a5, uint64_t a6, unint64_t *a7)
{
  unsigned int v7;
  int v8;
  uint64_t result;

  v7 = 0;
  v8 = 0x8000;
  switch(a4)
  {
    case -1:
      goto LABEL_7;
    case 0:
      goto LABEL_3;
    case 1:
      a4 = 128;
LABEL_3:
      v8 = a4;
      if (a5 > 0x7F)
        goto LABEL_4;
      goto LABEL_6;
    case 2:
      v8 = 32896;
      goto LABEL_6;
    case 3:
LABEL_6:
      v7 = v8 | a5;
LABEL_7:
      result = _citrus_DECKanji_wcrtomb_priv(a2, a3, v7, a6, a7);
      break;
    default:
LABEL_4:
      result = 92;
      break;
  }
  return result;
}

uint64_t _citrus_DECKanji_stdenc_mbtowc(uint64_t a1, unsigned int *a2, char **a3, uint64_t a4, unint64_t *a5, _QWORD *a6, uint64_t a7)
{
  uint64_t v9;
  uint64_t v10;
  void (*v11)(_QWORD, _QWORD);

  v9 = _citrus_DECKanji_mbrtowc_priv(a2, a3, a4, a5, a6);
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

uint64_t _citrus_DECKanji_stdenc_wctomb(uint64_t a1, void *a2, unint64_t a3, unsigned int a4, uint64_t a5, unint64_t *a6)
{
  return _citrus_DECKanji_wcrtomb_priv(a2, a3, a4, a5, a6);
}

uint64_t _citrus_DECKanji_stdenc_put_state_reset(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  *a5 = 0;
  return 0;
}

uint64_t _citrus_DECKanji_stdenc_get_state_desc(uint64_t a1, _QWORD *a2, int a3, int *a4)
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

uint64_t _citrus_DECKanji_stdenc_getops(uint64_t a1)
{
  __int128 v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;

  v1 = *(_OWORD *)algn_2579AED28;
  *(_OWORD *)a1 = _citrus_DECKanji_stdenc_ops;
  *(_OWORD *)(a1 + 16) = v1;
  v2 = xmmword_2579AED38;
  v3 = *(_OWORD *)&off_2579AED48;
  v4 = xmmword_2579AED58;
  *(_QWORD *)(a1 + 80) = qword_2579AED68;
  *(_OWORD *)(a1 + 48) = v3;
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 32) = v2;
  return 0;
}

uint64_t _citrus_DECKanji_mbrtowc_priv(unsigned int *a1, char **a2, uint64_t a3, unint64_t *a4, _QWORD *a5)
{
  char *v5;
  unint64_t v6;
  char v7;
  char v8;
  uint64_t result;
  unint64_t v10;
  unsigned int v11;
  int v12;
  uint64_t v13;
  char v14;

  v5 = *a2;
  if (!*a2)
  {
    result = 0;
    *a4 = 0;
    *a5 = 0;
    return result;
  }
  v6 = *a4;
  if (*a4 == 1)
  {
    v7 = *((_BYTE *)a4 + 8);
  }
  else
  {
    if (v6)
      return 22;
    if (!a3)
      goto LABEL_25;
    --a3;
    v8 = *v5++;
    v7 = v8;
    *a4 = 1;
    *((_BYTE *)a4 + 8) = v8;
  }
  if (v7 >= 0)
    v10 = 1;
  else
    v10 = 2;
  if (v7 < 0)
  {
    v13 = 1;
    while (a3)
    {
      --a3;
      v14 = *v5++;
      *a4 = v13 + 1;
      *((_BYTE *)a4 + v13 + 8) = v14;
      v13 = *a4;
      if (*a4 >= v10)
      {
        *a2 = v5;
        if ((v7 & 0x80) == 0)
          goto LABEL_13;
        v11 = __rev16(*((unsigned __int16 *)a4 + 4));
        goto LABEL_14;
      }
    }
LABEL_25:
    result = 0;
    *a5 = -2;
    *a2 = v5;
    return result;
  }
  *a2 = v5;
LABEL_13:
  v11 = *((unsigned __int8 *)a4 + 8);
LABEL_14:
  *a4 = 0;
  if (a1)
    *a1 = v11;
  result = 0;
  v12 = v10 - v6;
  if (!v11)
    v12 = 0;
  *a5 = v12;
  return result;
}

uint64_t _citrus_DECKanji_wcrtomb_priv(void *a1, unint64_t a2, unsigned int a3, uint64_t a4, unint64_t *a5)
{
  uint64_t result;
  unint64_t v8;
  unint64_t v9;

  if (*(_QWORD *)a4)
    return 22;
  if (a3 >= 0x100)
  {
    if ((a3 & 0x8000) == 0)
    {
      *a5 = -1;
      return 92;
    }
    *(_BYTE *)(a4 + 8) = BYTE1(a3);
    v8 = 1;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8 + 1;
  *(_QWORD *)a4 = v8 + 1;
  *(_BYTE *)(a4 + v8 + 8) = a3;
  if (v8 >= a2)
  {
    *a5 = -1;
    return 7;
  }
  else
  {
    memcpy(a1, (const void *)(a4 + 8), v8 + 1);
    result = 0;
    *a5 = v9;
    *(_QWORD *)a4 = 0;
  }
  return result;
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

