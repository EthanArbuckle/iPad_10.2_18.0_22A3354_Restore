uint64_t _citrus_HZ_stdenc_init(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t **v6;
  uint64_t **v7;
  uint64_t v8;

  v6 = (uint64_t **)malloc_type_calloc(1uLL, 0x30uLL, 0xA00401628ADDBuLL);
  if (!v6)
    return *__error();
  v7 = v6;
  *(_OWORD *)v6 = 0u;
  *((_OWORD *)v6 + 2) = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  v6[1] = (uint64_t *)v6;
  v6[3] = (uint64_t *)(v6 + 2);
  v8 = _citrus_prop_parse_variable();
  if ((_DWORD)v8)
  {
    _citrus_HZ_encoding_module_uninit(v7);
    free(v7);
  }
  else
  {
    *(_QWORD *)(a1 + 8) = v7;
    *(_OWORD *)a4 = xmmword_24B730F00;
    *(_QWORD *)(a4 + 16) = 1;
  }
  return v8;
}

void _citrus_HZ_stdenc_uninit(uint64_t a1)
{
  uint64_t **v1;

  if (a1)
  {
    v1 = *(uint64_t ***)(a1 + 8);
    _citrus_HZ_encoding_module_uninit(v1);
    free(v1);
  }
}

uint64_t _citrus_HZ_stdenc_init_state(uint64_t a1, _QWORD *a2)
{
  *a2 = **(_QWORD **)(a1 + 8);
  return 0;
}

uint64_t _citrus_HZ_stdenc_mbtocs(uint64_t a1, _DWORD *a2, unsigned int *a3, unsigned __int8 **a4, uint64_t a5, uint64_t *a6, uint64_t *a7, uint64_t a8)
{
  uint64_t v12;
  int v14;
  int v15;
  unsigned int v16;
  int v17;

  v17 = 0;
  v12 = _citrus_HZ_mbrtowc_priv(*(uint64_t **)(a1 + 8), &v17, a4, a5, a6, a7);
  if (!(_DWORD)v12)
  {
    if (*a7 != -2)
    {
      v14 = v17;
      v15 = v17 & 0x80;
      v16 = v17 & 0xFFFFFF7F;
      if ((v17 & 0xFFFFFF7F) > 0x7F)
      {
        if (v16 >> 7 > 0xFE)
        {
          *a2 = v17 & 0xFF000000;
          v16 = v14 & 0xFFFF7F;
        }
        else
        {
          *a2 = v15 | 0x8000;
        }
      }
      else
      {
        *a2 = v15;
      }
      *a3 = v16;
    }
    if (a8 && *(_QWORD *)a8)
      (*(void (**)(_QWORD, _QWORD))a8)(*a3, *(_QWORD *)(a8 + 16));
  }
  return v12;
}

uint64_t _citrus_HZ_stdenc_cstomb(uint64_t a1, void *a2, unint64_t a3, int a4, unsigned int a5, uint64_t a6, size_t *a7)
{
  int v7;

  if (a4 <= 127)
  {
    if (a4 == -1)
    {
      a5 = 0;
      return _citrus_HZ_wcrtomb_priv(*(_QWORD **)(a1 + 8), a2, a3, a5, a6, a7);
    }
    if (a4)
      goto LABEL_8;
  }
  else
  {
    v7 = 128;
    if (a4 == 128)
      goto LABEL_9;
    if (a4 != 0x8000)
    {
      if (a4 != 32896)
LABEL_8:
        v7 = a4;
LABEL_9:
      a5 |= v7;
    }
  }
  return _citrus_HZ_wcrtomb_priv(*(_QWORD **)(a1 + 8), a2, a3, a5, a6, a7);
}

uint64_t _citrus_HZ_stdenc_mbtowc(uint64_t a1, int *a2, unsigned __int8 **a3, uint64_t a4, uint64_t *a5, uint64_t *a6, uint64_t a7)
{
  uint64_t v9;
  uint64_t v10;
  void (*v11)(_QWORD, _QWORD);

  v9 = _citrus_HZ_mbrtowc_priv(*(uint64_t **)(a1 + 8), a2, a3, a4, a5, a6);
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

uint64_t _citrus_HZ_stdenc_wctomb(uint64_t a1, void *a2, unint64_t a3, unsigned int a4, uint64_t a5, size_t *a6)
{
  return _citrus_HZ_wcrtomb_priv(*(_QWORD **)(a1 + 8), a2, a3, a4, a5, a6);
}

uint64_t _citrus_HZ_stdenc_put_state_reset(uint64_t a1, _WORD *a2, unint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t result;
  uint64_t v6;
  int v7;
  uint64_t v8;

  if (*(_DWORD *)(a4 + 8) || !*(_QWORD *)a4)
    return 22;
  v6 = **(_QWORD **)(a1 + 8);
  if (*(_QWORD *)a4 == v6)
  {
    if (a3)
    {
      v8 = 0;
      goto LABEL_10;
    }
  }
  else if (a3 >= 2)
  {
    *(_BYTE *)(a4 + 12) = 126;
    v7 = *(_DWORD *)(v6 + 40);
    *(_DWORD *)(a4 + 8) = 2;
    *(_BYTE *)(a4 + 13) = v7;
    if (a3 != 2)
    {
      *a2 = *(_WORD *)(a4 + 12);
      v8 = 2;
LABEL_10:
      result = 0;
      *a5 = v8;
      *(_QWORD *)a4 = v6;
      return result;
    }
  }
  return 7;
}

uint64_t _citrus_HZ_stdenc_get_state_desc(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t result;
  int v5;
  int v6;

  if (a3)
    return 102;
  v5 = *(_DWORD *)(a2 + 8);
  if (v5 < 0 || !*(_QWORD *)a2)
    return 22;
  if (v5)
  {
    if (*(_BYTE *)(a2 + 12) == 126)
      v6 = 4;
    else
      v6 = 3;
  }
  else if (*(_QWORD *)a2 == **(_QWORD **)(a1 + 8))
  {
    v6 = 1;
  }
  else
  {
    v6 = 2;
  }
  result = 0;
  *a4 = v6;
  return result;
}

uint64_t _citrus_HZ_stdenc_getops(uint64_t a1)
{
  __int128 v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;

  v1 = *(_OWORD *)&off_2579AEE88;
  *(_OWORD *)a1 = _citrus_HZ_stdenc_ops;
  *(_OWORD *)(a1 + 16) = v1;
  v2 = xmmword_2579AEE98;
  v3 = *(_OWORD *)&off_2579AEEA8;
  v4 = xmmword_2579AEEB8;
  *(_QWORD *)(a1 + 80) = qword_2579AEEC8;
  *(_OWORD *)(a1 + 48) = v3;
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 32) = v2;
  return 0;
}

void _citrus_HZ_encoding_module_uninit(uint64_t **a1)
{
  uint64_t *i;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t *v7;

  for (i = *a1; *a1; i = *a1)
  {
    v3 = *i;
    v4 = (uint64_t *)i[1];
    if (*i)
    {
      *(_QWORD *)(v3 + 8) = v4;
      v4 = (uint64_t *)i[1];
    }
    else
    {
      a1[1] = v4;
    }
    *v4 = v3;
    free((void *)i[3]);
    free((void *)i[4]);
    free(i);
  }
  while (1)
  {
    v7 = a1[2];
    if (!v7)
      break;
    v5 = *v7;
    v6 = (uint64_t *)v7[1];
    if (*v7)
    {
      *(_QWORD *)(v5 + 8) = v6;
      v6 = (uint64_t *)v7[1];
    }
    else
    {
      a1[3] = v6;
    }
    *v6 = v5;
    free((void *)v7[3]);
    free((void *)v7[4]);
    free(v7);
  }
}

uint64_t _citrus_HZ_parse_escape(uint64_t a1, const char *a2, const char *a3)
{
  _QWORD *v6;
  _QWORD *v7;
  _QWORD **v9;
  _QWORD *v10;

  v6 = malloc_type_calloc(1uLL, 0x30uLL, 0x10A00405CC47A3DuLL);
  if (!v6)
    return 22;
  v7 = v6;
  if (!strcmp("0", a2))
  {
    v7[2] = a1;
    *v7 = 0;
    v9 = (_QWORD **)(a1 + 8);
  }
  else
  {
    if (strcmp("1", a2))
    {
      free(v7);
      return 22;
    }
    v7[2] = a1 + 16;
    *v7 = 0;
    v9 = (_QWORD **)(a1 + 24);
  }
  v10 = *v9;
  v7[1] = *v9;
  *v10 = v7;
  *v9 = v7;
  strlen(a3);
  return _citrus_prop_parse_variable();
}

uint64_t _citrus_HZ_parse_char(uint64_t a1, uint64_t a2, char *a3)
{
  uint64_t result;
  int v4;

  if (*(_DWORD *)(*(_QWORD *)a1 + 40))
    return 22;
  v4 = *a3;
  *(_DWORD *)(*(_QWORD *)a1 + 40) = v4;
  result = 22;
  if (v4 != 126)
  {
    if (a3[1])
      return 22;
    else
      return 0;
  }
  return result;
}

uint64_t _citrus_HZ_parse_graphic(uint64_t *a1, const char *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  int v10;
  uint64_t result;

  v6 = *a1;
  v5 = a1[1];
  v7 = malloc_type_calloc(1uLL, 0x18uLL, 0x10200409F4E64B8uLL);
  if (!v7)
    return 12;
  v8 = v7;
  if (!strcmp("GL", a2))
  {
    v9 = (_QWORD *)(v6 + 24);
    if (!*(_QWORD *)(v6 + 24))
      goto LABEL_5;
LABEL_16:
    free(v8);
    return 22;
  }
  if (strcmp("GR", a2))
    goto LABEL_16;
  v9 = (_QWORD *)(v6 + 32);
  if (*(_QWORD *)(v6 + 32))
    goto LABEL_16;
LABEL_5:
  *v9 = v8;
  v8[1] = v6;
  if (!_citrus_bcs_strncasecmp())
  {
    if (!*(_BYTE *)(a3 + 5))
    {
      result = 0;
      *(_DWORD *)v8 = 1;
      v8[2] = 1;
      *(_QWORD *)(v5 + 32) = v8;
      return result;
    }
    return 22;
  }
  if (!_citrus_bcs_strncasecmp())
  {
    if (!*(_BYTE *)(a3 + 6))
    {
      result = 0;
      *(_DWORD *)v8 = 2;
      v8[2] = 2;
      *(_QWORD *)(v5 + 40) = v8;
      return result;
    }
    return 22;
  }
  v10 = 3;
  if (!strncmp("94*", (const char *)a3, 3uLL))
    goto LABEL_10;
  if (strncmp("96*", (const char *)a3, 3uLL))
    return 22;
  v10 = 4;
LABEL_10:
  *(_DWORD *)v8 = v10;
  result = 22;
  if ((*(char *)(a3 + 3) - 49) <= 2)
  {
    v8[2] = *(char *)(a3 + 3) - 48;
    if (*(_BYTE *)(a3 + 4))
      return 22;
    else
      return 0;
  }
  return result;
}

uint64_t _citrus_HZ_mbrtowc_priv(uint64_t *a1, int *a2, unsigned __int8 **a3, uint64_t a4, uint64_t *a5, uint64_t *a6)
{
  unsigned __int8 *v6;
  unsigned int *v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;

  v6 = *a3;
  if (!*a3)
  {
    v22 = 0;
    *a5 = *a1;
    a5[1] = 0;
    v23 = 1;
    goto LABEL_66;
  }
  if ((a5[1] & 0x80000000) != 0 || !*a5)
    return 22;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  while (2)
  {
    while (2)
    {
      if (v11 > 6)
      {
LABEL_65:
        v22 = 92;
        v23 = -1;
        goto LABEL_66;
      }
      v13 = *((_DWORD *)a5 + 2);
      while (v13 != v12)
      {
        v14 = *((unsigned __int8 *)a5 + v12 + 12);
        if (!v12)
          goto LABEL_37;
LABEL_12:
        if (++v12 != 2 || *((_BYTE *)a5 + 12) != 126)
        {
          v19 = *a5;
          if ((v14 & 0x80) != 0)
          {
            if (v7 != *(unsigned int **)(v19 + 32))
              goto LABEL_65;
            v14 &= 0x7Fu;
          }
          else if (v7 != *(unsigned int **)(v19 + 24))
          {
            goto LABEL_65;
          }
          goto LABEL_44;
        }
        if (*((int *)a5 + 2) > 2)
          return 22;
        if (v14 == 10)
        {
          if (*a5 != *a1)
            goto LABEL_65;
          goto LABEL_32;
        }
        if (v14 == 126)
        {
          ++v10;
          v12 = 2;
          goto LABEL_44;
        }
        v16 = (_QWORD *)*a1;
        if (*a5 == *a1)
        {
          v18 = (_QWORD *)a1[2];
          v17 = (_QWORD *)v16[2];
          goto LABEL_23;
        }
        v17 = *(_QWORD **)(*a5 + 16);
        if ((_QWORD *)*v17 != v16)
        {
          v18 = (_QWORD *)*a1;
LABEL_23:
          v16 = v17;
          while (1)
          {
            v16 = (_QWORD *)*v16;
            if (!v16)
              break;
            if (*((_DWORD *)v16 + 10) == v14)
              goto LABEL_31;
          }
          if (!v18)
            goto LABEL_65;
          v16 = v18;
          if (*((_DWORD *)v18 + 10) != v14)
            goto LABEL_65;
          goto LABEL_31;
        }
        if (*((_DWORD *)v16 + 10) != v14)
          goto LABEL_65;
LABEL_31:
        *a5 = (uint64_t)v16;
LABEL_32:
        v13 = 0;
        v12 = 0;
        *((_DWORD *)a5 + 2) = 0;
        if (v11 >= 7)
          goto LABEL_65;
      }
      if (!a4)
      {
        v22 = 0;
        *a3 = v6;
        v23 = -2;
        goto LABEL_66;
      }
      v15 = *v6++;
      v14 = v15;
      --a4;
      *((_DWORD *)a5 + 2) = v13 + 1;
      *((_BYTE *)a5 + v13 + 12) = v15;
      ++v11;
      if (v12)
        goto LABEL_12;
LABEL_37:
      if ((v14 & 0x7Fu) <= 0x1F)
      {
        if (*a5 != *a1)
          goto LABEL_65;
        v12 = 1;
        goto LABEL_56;
      }
      v20 = *a5;
      if ((v14 & 0x80) != 0)
      {
        v7 = *(unsigned int **)(v20 + 32);
        v9 = 128;
        v14 &= 0x7Fu;
      }
      else
      {
        v7 = *(unsigned int **)(v20 + 24);
        v12 = 1;
        if (v14 == 126)
          continue;
        v9 = 0;
      }
      break;
    }
    if (!v7)
      goto LABEL_65;
    v12 = 1;
LABEL_44:
    v21 = *v7;
    if (ranges[3 * *v7] > v14 || ranges[3 * v21 + 1] < v14)
      goto LABEL_65;
    v8 = v14 | (v8 << 8);
    if (*((_QWORD *)v7 + 2) != v12 - v10)
      continue;
    break;
  }
  if (v21 >= 3)
    v9 |= *(_DWORD *)(*a5 + 40) << 24;
  v14 = v9 | v8;
LABEL_56:
  if (v12 < *((_DWORD *)a5 + 2))
    return 22;
  *a3 = v6;
  if (a2)
    *a2 = v14;
  v22 = 0;
  *((_DWORD *)a5 + 2) = 0;
  if (v14)
    LODWORD(v23) = v11;
  else
    LODWORD(v23) = 0;
  v23 = (int)v23;
LABEL_66:
  *a6 = v23;
  return v22;
}

uint64_t _citrus_HZ_wcrtomb_priv(_QWORD *a1, void *__dst, unint64_t a3, unsigned int a4, uint64_t a5, size_t *a6)
{
  uint64_t result;
  _QWORD *v8;
  unsigned int v10;
  _QWORD *v11;
  uint64_t v12;
  int *v13;
  unint64_t v14;
  unsigned int *v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  unsigned int v19;
  BOOL v20;
  int v21;
  unsigned int v22;
  int v23;
  int v24;
  char v25;
  uint64_t v26;
  size_t v27;
  unsigned int v28;
  uint64_t v29;

  if (*(_DWORD *)(a5 + 8))
    return 22;
  v8 = *(_QWORD **)a5;
  if (!*(_QWORD *)a5)
    return 22;
  v10 = a4 & 0xFFFFFF7F;
  if ((a4 & 0xFFFFFF7F) <= 0x1F)
  {
    v11 = (_QWORD *)*a1;
    v12 = 4;
    if ((a4 & 0x80) == 0)
      v12 = 3;
    if (!v11[v12])
      goto LABEL_50;
    v13 = ranges;
    v14 = 1;
LABEL_16:
    if (v8 == v11)
    {
LABEL_31:
      if (a3 < v14)
        return 7;
      if (!v14)
      {
LABEL_38:
        v27 = *(int *)(a5 + 8);
        memcpy(__dst, (const void *)(a5 + 12), v27);
        result = 0;
        *a6 = v27;
        *(_DWORD *)(a5 + 8) = 0;
        return result;
      }
      v24 = *v13;
      v25 = 8 * v14 - 8;
      while (v24 <= (v10 >> v25) && v13[1] >= (v10 >> v25))
      {
        v26 = *(int *)(a5 + 8);
        *(_DWORD *)(a5 + 8) = v26 + 1;
        *(_BYTE *)(a5 + v26 + 12) = (v10 >> v25) | a4 & 0x80;
        v25 -= 8;
        if (!--v14)
          goto LABEL_38;
      }
      goto LABEL_50;
    }
    v16 = (_QWORD *)v8[2];
    v17 = (_QWORD *)v11[2];
    if (v16 == v17)
    {
      v19 = 0;
      v18 = (_QWORD *)*a1;
      if (v11 == (_QWORD *)*a1 || v8 == v18 || (_QWORD *)*v16 != v18)
        goto LABEL_28;
    }
    else
    {
      v18 = (_QWORD *)*v17;
      if (v11 == (_QWORD *)*v17)
      {
LABEL_27:
        v19 = 0;
LABEL_28:
        v20 = a3 >= 2;
        a3 -= 2;
        if (!v20)
          return 7;
        v22 = v19 | 1;
        *(_BYTE *)(a5 + 12 + v19) = 126;
        v23 = *((_DWORD *)v11 + 10);
        *(_DWORD *)(a5 + 8) = v22 + 1;
        *(_BYTE *)(a5 + 12 + v22) = v23;
        *(_QWORD *)a5 = v11;
        goto LABEL_31;
      }
    }
    if (v18)
    {
      v20 = a3 >= 2;
      a3 -= 2;
      if (!v20)
        return 7;
      *(_BYTE *)(a5 + 12) = 126;
      v21 = *((_DWORD *)v18 + 10);
      v19 = 2;
      *(_DWORD *)(a5 + 8) = 2;
      *(_BYTE *)(a5 + 13) = v21;
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  if (v10 <= 0x7F)
  {
    v15 = (unsigned int *)a1[4];
    if (!v15)
      goto LABEL_50;
    goto LABEL_14;
  }
  if (v10 >> 7 > 0xFE)
  {
    v28 = HIBYTE(a4);
    v11 = a1;
    do
    {
      v11 = (_QWORD *)*v11;
      if (!v11)
      {
        v11 = a1 + 2;
        while (1)
        {
          v11 = (_QWORD *)*v11;
          if (!v11)
            goto LABEL_50;
          if (*((_DWORD *)v11 + 10) == v28)
            goto LABEL_46;
        }
      }
    }
    while (*((_DWORD *)v11 + 10) != v28);
LABEL_46:
    v29 = 4;
    if ((a4 & 0x80) == 0)
      v29 = 3;
    v15 = (unsigned int *)v11[v29];
    if (v15)
    {
      v10 = a4 & 0xFFFF7F;
      goto LABEL_15;
    }
    goto LABEL_50;
  }
  v15 = (unsigned int *)a1[5];
  if (v15)
  {
LABEL_14:
    v11 = (_QWORD *)*((_QWORD *)v15 + 1);
LABEL_15:
    v13 = &ranges[3 * *v15];
    v14 = *((_QWORD *)v15 + 2);
    goto LABEL_16;
  }
LABEL_50:
  *a6 = -1;
  return 92;
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t _citrus_bcs_strncasecmp()
{
  return MEMORY[0x24BEDBE70]();
}

uint64_t _citrus_prop_parse_variable()
{
  return MEMORY[0x24BEDBEF8]();
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

