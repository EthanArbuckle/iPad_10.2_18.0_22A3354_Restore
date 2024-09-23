uint64_t _citrus_ZW_stdenc_init(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  *(_OWORD *)a4 = xmmword_24B742F50;
  *(_QWORD *)(a4 + 16) = 1;
  return result;
}

void _citrus_ZW_stdenc_uninit(uint64_t a1)
{
  if (a1)
    free(*(void **)(a1 + 8));
}

uint64_t _citrus_ZW_stdenc_mbtocs(uint64_t a1, _DWORD *a2, int *a3, char **a4, uint64_t a5, int *a6, uint64_t *a7, uint64_t a8)
{
  uint64_t v12;
  int v13;
  int v15;

  v15 = 0;
  v12 = _citrus_ZW_mbrtowc_priv(&v15, a4, a5, a6, a7);
  if (!(_DWORD)v12)
  {
    if (*a7 != -2)
    {
      v13 = v15;
      *a2 = v15 > 127;
      *a3 = v13;
    }
    if (a8 && *(_QWORD *)a8)
      (*(void (**)(_QWORD, _QWORD))a8)(*a3, *(_QWORD *)(a8 + 16));
  }
  return v12;
}

uint64_t _citrus_ZW_stdenc_cstomb(uint64_t a1, void *a2, unint64_t a3, unsigned int a4, unsigned int a5, uint64_t a6, size_t *a7)
{
  if (a4 == -1)
  {
    a5 = 0;
  }
  else if (a4 > 1)
  {
    return 22;
  }
  return _citrus_ZW_wcrtomb_priv(a2, a3, a5, a6, a7);
}

uint64_t _citrus_ZW_stdenc_mbtowc(uint64_t a1, int *a2, char **a3, uint64_t a4, int *a5, uint64_t *a6, uint64_t a7)
{
  uint64_t v9;
  uint64_t v10;
  void (*v11)(_QWORD, _QWORD);

  v9 = _citrus_ZW_mbrtowc_priv(a2, a3, a4, a5, a6);
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

uint64_t _citrus_ZW_stdenc_wctomb(uint64_t a1, void *a2, unint64_t a3, unsigned int a4, uint64_t a5, size_t *a6)
{
  return _citrus_ZW_wcrtomb_priv(a2, a3, a4, a5, a6);
}

uint64_t _citrus_ZW_stdenc_put_state_reset(uint64_t a1, _BYTE *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t result;

  if (*(_DWORD *)(a4 + 4))
    return 22;
  if (*(_DWORD *)a4)
  {
    if (*(_DWORD *)a4 != 3)
      return 22;
    if (a3)
    {
      result = 0;
      *(_BYTE *)(a4 + 8) = 10;
      *a5 = 1;
      *a2 = 10;
      *(_QWORD *)a4 = 0;
    }
    else
    {
      return 7;
    }
  }
  else
  {
    result = 0;
    *a5 = 0;
  }
  return result;
}

uint64_t _citrus_ZW_stdenc_get_state_desc(uint64_t a1, int *a2, int a3, int *a4)
{
  uint64_t result;
  int v5;
  int v6;
  int v7;

  if (a3)
    return 102;
  v5 = *a2;
  if ((*a2 - 2) < 2)
  {
    v7 = a2[1];
    if (!v7)
    {
      v6 = 2;
      goto LABEL_17;
    }
    if (v7 == 1)
    {
      if (*((_BYTE *)a2 + 8) == 35)
        v6 = 4;
      else
        v6 = 3;
      goto LABEL_17;
    }
    return 22;
  }
  if (v5 == 1)
  {
    if (!a2[1])
    {
      v6 = 4;
      goto LABEL_17;
    }
    return 22;
  }
  if (v5 || a2[1])
    return 22;
  v6 = 1;
LABEL_17:
  result = 0;
  *a4 = v6;
  return result;
}

uint64_t _citrus_ZW_stdenc_getops(uint64_t a1)
{
  __int128 v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;

  v1 = *(_OWORD *)algn_2579AF1F8;
  *(_OWORD *)a1 = _citrus_ZW_stdenc_ops;
  *(_OWORD *)(a1 + 16) = v1;
  v2 = xmmword_2579AF208;
  v3 = *(_OWORD *)&off_2579AF218;
  v4 = xmmword_2579AF228;
  *(_QWORD *)(a1 + 80) = qword_2579AF238;
  *(_OWORD *)(a1 + 48) = v3;
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 32) = v2;
  return 0;
}

uint64_t _citrus_ZW_mbrtowc_priv(int *a1, char **a2, uint64_t a3, int *a4, uint64_t *a5)
{
  char *v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  char v10;
  int v11;
  int v12;
  int v13;
  int v14;
  char v15;
  uint64_t result;
  unsigned __int8 v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;

  v5 = *a2;
  if (!*a2)
  {
    result = 0;
    a4[2] = 0;
    *(_QWORD *)a4 = 0;
    *a5 = 1;
    return result;
  }
  LODWORD(v6) = 0;
  v7 = *a4;
  while (2)
  {
    switch(v7)
    {
      case 0:
        if (a4[1])
          return 22;
        if (!a3)
          goto LABEL_46;
        if ((int)v6 > 6)
          goto LABEL_61;
        v9 = *v5++;
        v8 = v9;
        v10 = v9;
        if ((char)v9 < 0)
          goto LABEL_61;
        LODWORD(v6) = v6 + 1;
        *((_BYTE *)a4 + 8) = v10;
        if (v8 == 122)
        {
          --a3;
          *(_QWORD *)a4 = 1;
          goto LABEL_11;
        }
        if (v8 && v8 != 10)
          *a4 = 2;
        goto LABEL_54;
      case 1:
        if (a4[1])
          return 22;
LABEL_11:
        if (!a3)
          goto LABEL_46;
        if ((int)v6 > 6)
          goto LABEL_61;
        v12 = *v5++;
        v11 = v12;
        if (v12 < 0)
          goto LABEL_61;
        LODWORD(v6) = v6 + 1;
        a4[1] = 1;
        *((_BYTE *)a4 + 8) = v11;
        if (v11 != 87)
        {
          *a4 = 2;
          v8 = 122;
          goto LABEL_55;
        }
        --a3;
        *(_QWORD *)a4 = 3;
LABEL_17:
        if (!a3)
          goto LABEL_46;
        if ((int)v6 > 6)
          goto LABEL_61;
        v14 = *v5++;
        v8 = v14;
        v15 = v14;
        if ((char)v14 < 0)
          goto LABEL_61;
        --a3;
        LODWORD(v6) = v6 + 1;
        a4[1] = 1;
        *((_BYTE *)a4 + 8) = v15;
        if (v8 == 10)
        {
          v7 = 0;
          *(_QWORD *)a4 = 0;
          continue;
        }
        if (!v8)
          goto LABEL_24;
LABEL_29:
        if (!a3)
        {
LABEL_46:
          result = 0;
          v6 = -2;
          goto LABEL_60;
        }
        if ((int)v6 > 6)
          goto LABEL_61;
        v18 = *v5++;
        v17 = v18;
        if (v18 < 0)
          goto LABEL_61;
        v8 = v17;
        LODWORD(v6) = v6 + 1;
        a4[1] = 2;
        *((_BYTE *)a4 + 9) = v17;
        v19 = *((unsigned __int8 *)a4 + 8);
        if (v19 == 35)
        {
          if (v8 == 32)
            goto LABEL_54;
          if (v8 != 10)
          {
            if ((v8 - 127) <= 0xFFFFFFA1)
              goto LABEL_61;
            goto LABEL_51;
          }
LABEL_24:
          *(_QWORD *)a4 = 0;
        }
        else
        {
          if (v19 != 32)
          {
            if ((v19 - 127) < 0xFFFFFFA2 || (v8 - 127) < 0xFFFFFFA2)
              goto LABEL_61;
LABEL_51:
            v8 |= v19 << 8;
          }
LABEL_54:
          a4[1] = 0;
        }
LABEL_55:
        if (a1)
          *a1 = v8;
        result = 0;
        if (!v8)
          LODWORD(v6) = 0;
        v6 = (int)v6;
LABEL_60:
        *a5 = v6;
        *a2 = v5;
        return result;
      case 2:
        v20 = a4[1];
        if (v20 == 1)
        {
          v23 = *((char *)a4 + 8);
          if (v23 < 0)
            goto LABEL_61;
        }
        else
        {
          if (v20)
            return 22;
          if (!a3)
            goto LABEL_46;
          if ((int)v6 > 6 || (v22 = *v5, ++v5, v21 = v22, LOBYTE(v23) = v22, (char)v22 < 0))
          {
LABEL_61:
            *a5 = -1;
            return 92;
          }
          LODWORD(v6) = v6 + 1;
          *((_BYTE *)a4 + 8) = v23;
          if (v21 == 10 || !v21)
            *a4 = 0;
        }
        v8 = v23;
        goto LABEL_54;
      case 3:
        v13 = a4[1];
        if (!v13)
          goto LABEL_17;
        if (v13 == 1)
          goto LABEL_29;
        return 22;
      default:
        return 22;
    }
  }
}

uint64_t _citrus_ZW_wcrtomb_priv(void *a1, unint64_t a2, unsigned int a3, uint64_t a4, size_t *a5)
{
  uint64_t result;
  size_t v8;
  BOOL v9;
  unsigned int v10;
  __int16 v11;

  if (*(_DWORD *)(a4 + 4))
    return 22;
  if (a3 > 0x7F)
  {
    if (a3 <= 0x7E7E)
    {
      if (*(_DWORD *)a4 == 3)
      {
        v10 = 0;
      }
      else
      {
        if (*(_DWORD *)a4)
          return 22;
        v9 = a2 >= 2;
        a2 -= 2;
        if (!v9)
          return 7;
        *(_WORD *)(a4 + 8) = 22394;
        *(_QWORD *)a4 = 0x200000003;
        v10 = 2;
      }
      if (a2 < 2)
        return 7;
      if (BYTE1(a3) >= 0x21u)
      {
        *(_DWORD *)(a4 + 4) = v10 | 1;
        *(_BYTE *)(a4 + v10 + 8) = BYTE1(a3);
        if (a3 - 127 >= 0xFFFFFFA2)
        {
          v8 = v10 + 2;
          *(_BYTE *)(a4 + (v10 | 1) + 8) = a3;
          goto LABEL_32;
        }
      }
    }
    *a5 = -1;
    return 92;
  }
  if (*(_DWORD *)a4 == 3)
  {
    if (a2 < 2)
      return 7;
    if (a3 == 10)
    {
      v11 = 2595;
    }
    else
    {
      if (a3)
      {
        *(_DWORD *)(a4 + 4) = 1;
        *(_BYTE *)(a4 + 8) = 32;
        *(_BYTE *)(a4 + 9) = a3;
        goto LABEL_29;
      }
      v11 = 10;
    }
    *(_WORD *)(a4 + 8) = v11;
    *(_QWORD *)a4 = 0x100000000;
LABEL_29:
    v8 = 2;
    goto LABEL_32;
  }
  if (*(_DWORD *)a4)
    return 22;
  if (a3 != 10 && a3)
  {
    if (a2 >= 4)
    {
      *(_WORD *)(a4 + 8) = 22394;
      *(_BYTE *)(a4 + 10) = 32;
      *(_BYTE *)(a4 + 11) = a3;
      *(_QWORD *)a4 = 0x200000003;
      v8 = 4;
      goto LABEL_32;
    }
    return 7;
  }
  *(_BYTE *)(a4 + 8) = a3;
  v8 = 1;
LABEL_32:
  memcpy(a1, (const void *)(a4 + 8), v8);
  result = 0;
  *a5 = v8;
  *(_DWORD *)(a4 + 4) = 0;
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

