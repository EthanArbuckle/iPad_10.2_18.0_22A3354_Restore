uint64_t _citrus_UTF7_stdenc_init(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _OWORD *v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;

  v6 = malloc_type_calloc(1uLL, 0x100uLL, 0x1000040104B78CFuLL);
  if (!v6)
    return *__error();
  v7 = 0;
  v6[14] = 0u;
  v6[15] = 0u;
  v6[12] = 0u;
  v6[13] = 0u;
  v6[10] = 0u;
  v6[11] = 0u;
  v6[8] = 0u;
  v6[9] = 0u;
  v6[6] = 0u;
  v6[7] = 0u;
  v6[4] = 0u;
  v6[5] = 0u;
  v6[2] = 0u;
  v6[3] = 0u;
  v8 = 65;
  *v6 = 0u;
  v6[1] = 0u;
  do
  {
    *((_WORD *)v6 + (v8 & 0x7F)) |= (_WORD)v7 + 1;
    v8 = base64[++v7];
  }
  while (v7 != 64);
  v9 = 65;
  v10 = 1u;
  do
  {
    *((_WORD *)v6 + (v9 & 0x7F)) |= 0x100u;
    v9 = direct[v10++];
  }
  while (v10 != 72);
  v11 = 33;
  v12 = 1u;
  do
  {
    *((_WORD *)v6 + (v11 & 0x7F)) |= 0x200u;
    v11 = option[v12++];
  }
  while (v12 != 21);
  v13 = 0;
  v14 = 32;
  do
  {
    *((_WORD *)v6 + (v14 & 0x7F)) |= 0x400u;
    v14 = spaces[++v13];
  }
  while (v13 != 4);
  v15 = 0;
  *(_QWORD *)(a1 + 8) = v6;
  *(_OWORD *)a4 = xmmword_24B73AEB0;
  *(_QWORD *)(a4 + 16) = 1;
  return v15;
}

void _citrus_UTF7_stdenc_uninit(uint64_t a1)
{
  if (a1)
    free(*(void **)(a1 + 8));
}

uint64_t _citrus_UTF7_stdenc_mbtocs(uint64_t a1, _DWORD *a2, int *a3, unsigned __int8 **a4, uint64_t a5, unsigned int *a6, unint64_t *a7, uint64_t a8)
{
  uint64_t v12;
  int v13;
  int v15;

  v15 = 0;
  v12 = _citrus_UTF7_mbrtowc_priv(*(_QWORD *)(a1 + 8), &v15, a4, a5, a6, a7);
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

uint64_t _citrus_UTF7_stdenc_cstomb(uint64_t a1, char *a2, uint64_t a3, int a4, unsigned int a5, unsigned int *a6, uint64_t *a7)
{
  if (a4 == -1)
  {
    a5 = 0;
  }
  else if (a4)
  {
    return 92;
  }
  return _citrus_UTF7_wcrtomb_priv(*(_QWORD *)(a1 + 8), a2, a5, a6, a7);
}

uint64_t _citrus_UTF7_stdenc_mbtowc(uint64_t a1, int *a2, unsigned __int8 **a3, uint64_t a4, unsigned int *a5, unint64_t *a6, uint64_t a7)
{
  uint64_t v9;
  uint64_t v10;
  void (*v11)(_QWORD, _QWORD);

  v9 = _citrus_UTF7_mbrtowc_priv(*(_QWORD *)(a1 + 8), a2, a3, a4, a5, a6);
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

uint64_t _citrus_UTF7_stdenc_wctomb(uint64_t a1, char *a2, uint64_t a3, unsigned int a4, unsigned int *a5, uint64_t *a6)
{
  return _citrus_UTF7_wcrtomb_priv(*(_QWORD *)(a1 + 8), a2, a4, a5, a6);
}

uint64_t _citrus_UTF7_stdenc_put_state_reset(int a1, void *__dst, uint64_t a3, unsigned int *a4, _QWORD *a5)
{
  unsigned int v6;
  unsigned int v7;
  uint64_t result;

  if (a4[1])
    return 22;
  v6 = *a4;
  v7 = (*a4 >> 1) & 0xF;
  if (v7 > 6)
    return 22;
  if ((v6 & 1) != 0)
  {
    if (v7)
    {
      if (!a3)
        return 7;
      --a3;
      *((_BYTE *)a4 + 8) = base64[(v6 >> 5 << (6 - v7)) & 0x3FLL];
      v7 = 2;
      a4[1] = 2;
      *((_BYTE *)a4 + 9) = 45;
      v6 &= 0xF8000001;
    }
    v6 &= ~1u;
    *a4 = v6;
  }
  else
  {
    v7 = 0;
  }
  if ((v6 & 0x1E) != 0)
    return 22;
  if (!a3)
    return 7;
  *a5 = v7;
  if (!v7)
    return 0;
  memcpy(__dst, a4 + 2, v7);
  result = 0;
  a4[1] = 0;
  return result;
}

uint64_t _citrus_UTF7_stdenc_get_state_desc(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t result;
  int v5;

  if (a3)
    return 102;
  result = 0;
  if (*(_DWORD *)(a2 + 4))
    v5 = 3;
  else
    v5 = 1;
  *a4 = v5;
  return result;
}

uint64_t _citrus_UTF7_stdenc_getops(uint64_t a1)
{
  __int128 v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;

  v1 = *(_OWORD *)algn_2579AF098;
  *(_OWORD *)a1 = _citrus_UTF7_stdenc_ops;
  *(_OWORD *)(a1 + 16) = v1;
  v2 = xmmword_2579AF0A8;
  v3 = *(_OWORD *)&off_2579AF0B8;
  v4 = xmmword_2579AF0C8;
  *(_QWORD *)(a1 + 80) = qword_2579AF0D8;
  *(_OWORD *)(a1 + 48) = v3;
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 32) = v2;
  return 0;
}

uint64_t _citrus_UTF7_mbrtowc_priv(uint64_t a1, int *a2, unsigned __int8 **a3, uint64_t a4, unsigned int *a5, unint64_t *a6)
{
  uint64_t result;
  unint64_t v13;
  unint64_t v14;
  int v15;
  unint64_t v16;
  __int16 v17;
  unsigned __int16 v18;

  if (!*a3)
  {
    result = 0;
    a5[2] = 0;
    *(_QWORD *)a5 = 0;
    v14 = 1;
    goto LABEL_5;
  }
  v18 = 0;
  v16 = 0;
  result = _citrus_UTF7_mbtoutf16(a1, &v18, a3, a4, a5, (uint64_t *)&v16);
  v13 = v16;
  if (v16 >= 0xFFFFFFFFFFFFFFFELL)
  {
    *a6 = v16;
    return result;
  }
  if (!(_DWORD)result)
  {
    v15 = v18;
    if ((unsigned __int16)((unsigned __int16)(v18 + 9216) >> 10) < 0x3Fu)
    {
      if (v18)
        goto LABEL_10;
      a5[2] = 0;
      *(_QWORD *)a5 = 0;
      goto LABEL_18;
    }
    v17 = 0;
    result = _citrus_UTF7_mbtoutf16(a1, &v17, a3, a4 - v16, a5, (uint64_t *)&v16);
    v14 = v16;
    if (v16 < 0xFFFFFFFFFFFFFFFELL)
    {
      if ((_DWORD)result)
        return result;
      if ((unsigned __int16)((unsigned __int16)(v17 + 0x2000) >> 10) > 0x3Eu)
      {
        v15 = ((unsigned __int16)(v17 + 9216) | ((unsigned __int16)(v15 + 10240) << 10)) + 0x10000;
        v13 += v16;
LABEL_10:
        *a6 = v13;
        result = 0;
        if (a2)
          *a2 = v15;
        return result;
      }
LABEL_18:
      *a6 = -1;
      return 92;
    }
    a5[1] = 1;
LABEL_5:
    *a6 = v14;
  }
  return result;
}

uint64_t _citrus_UTF7_mbtoutf16(uint64_t a1, _WORD *a2, unsigned __int8 **a3, uint64_t a4, unsigned int *a5, uint64_t *a6)
{
  int v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  unsigned int v12;
  int v14;
  unsigned int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;

  v6 = 0;
  *a6 = 0;
  v7 = *a3;
  v8 = *a3;
  while (1)
  {
    if (v6 == a5[1])
    {
      if (!a4)
      {
        v17 = 0;
        v18 = -2;
        goto LABEL_37;
      }
      --a4;
      v10 = *v8++;
      LODWORD(v9) = v10;
      a5[1] = v6 + 1;
      v11 = v6;
      *((_BYTE *)a5 + v6 + 8) = v10;
      if ((v10 & 0x80) != 0)
        goto LABEL_34;
    }
    else
    {
      v11 = v6;
      LODWORD(v9) = *((unsigned __int8 *)a5 + v6 + 8);
      if ((v9 & 0x80) != 0)
        goto LABEL_34;
    }
    v12 = *a5;
    if ((*a5 & 1) == 0)
    {
      if ((v12 & 0x7FFFFFE) != 0)
        return 22;
      if ((_DWORD)v9 != 43)
      {
        if ((*(_WORD *)(a1 + 2 * v9) & 0x700) != 0)
          goto LABEL_32;
        goto LABEL_34;
      }
      *a5 = v12 | 1;
      goto LABEL_22;
    }
    if ((_DWORD)v9 == 45 && (v12 & 0x7FFFFE0) == 0)
    {
      *a5 = v12 & 0xFFFFFFFE;
      LOWORD(v9) = 43;
      goto LABEL_32;
    }
    v14 = *(unsigned __int8 *)(a1 + 2 * v9);
    if (v14)
      break;
    if ((*a5 & 0x1C) > 0xA)
      return 22;
    *a5 = v12 & 0xF8000000;
    v9 = *((unsigned __int8 *)a5 + v11 + 8);
    if ((_DWORD)v9 != 45)
    {
      if ((v9 & 0x80) == 0 && ((_DWORD)v9 == 43 || (*(_WORD *)(a1 + 2 * v9) & 0x700) != 0))
        goto LABEL_32;
LABEL_34:
      *a6 = -1;
      return 92;
    }
    --a5[1];
    --v6;
LABEL_22:
    ++v6;
  }
  v15 = (v14 - 1) | (2 * v12) & 0x3FFFC0;
  *a5 = v12 & 0xF800001F | (32 * v15);
  v16 = (v12 >> 1) & 0xF;
  v17 = 22;
  if (v16 == 15)
    return v17;
  if (((1 << v16) & 0x155) != 0)
  {
    *a5 = v12 & 0xF8000001 | (32 * v15) | (2 * (((v12 + 12) >> 1) & 0xF));
    goto LABEL_22;
  }
  if (((1 << v16) & 0x5400) == 0)
    return v17;
  *a5 = v12 & 0xF8000001 | (32 * v15) | (v12 + 12) & 0x1E;
  LODWORD(v9) = v15 >> (((v12 + 12) >> 1) & 0xF);
LABEL_32:
  *a2 = v9;
  if ((int)a5[1] > v6 + 1)
    return 22;
  v17 = 0;
  a5[1] = 0;
  v18 = v8 - v7;
  if (!*a2)
    v18 = 0;
LABEL_37:
  *a6 = v18;
  *a3 = v8;
  return v17;
}

uint64_t _citrus_UTF7_wcrtomb_priv(uint64_t a1, char *__dst, unsigned int a3, unsigned int *a4, uint64_t *a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  char v17;
  int v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  size_t v22;
  uint64_t result;
  uint64_t *v24;
  _WORD v26[2];

  if (HIWORD(a3))
  {
    if (HIWORD(a3) > 0x10u)
    {
      result = 92;
      v9 = -1;
LABEL_33:
      *a5 = v9;
      return result;
    }
    v24 = a5;
    v26[0] = ((a3 + 67043328) >> 10) - 10240;
    v26[1] = a3 & 0x3FF | 0xDC00;
    v7 = 2;
  }
  else
  {
    v24 = a5;
    v26[0] = a3;
    v7 = 1;
  }
  v8 = 0;
  v9 = 0;
  v10 = a4[1] == 0;
  while (v10)
  {
    v11 = *a4;
    v12 = *a4 & 0x1E;
    if (v12 > 0xC)
      break;
    v13 = (unsigned __int16)v26[v8];
    if (v13 <= 0x7F && ((_DWORD)v13 == 43 || (*(_WORD *)(a1 + 2 * v13) & 0x500) != 0))
    {
      if ((v11 & 1) != 0)
      {
        v18 = (v11 >> 1) & 0xF;
        if (v18)
        {
          v19 = base64[(v11 >> 5 << (6 - v18)) & 0x3FLL];
          a4[1] = 1;
          *((_BYTE *)a4 + 8) = v19;
          v11 &= 0xF8000001;
          v14 = 1;
        }
        else
        {
          v14 = 0;
        }
        if ((_DWORD)v13 == 45 || *(_BYTE *)(a1 + 2 * v13))
        {
          v20 = (uint64_t)a4 + v14++;
          a4[1] = v14;
          *(_BYTE *)(v20 + 8) = 45;
        }
        v11 &= ~1u;
        *a4 = v11;
      }
      else
      {
        v14 = 0;
      }
      if ((v11 & 0x1E) != 0)
        return 22;
      a4[1] = v14 + 1;
      *((_BYTE *)a4 + v14 + 8) = v13;
      if ((_DWORD)v13 == 43)
      {
        v21 = (int)a4[1];
        a4[1] = v21 + 1;
        *((_BYTE *)a4 + v21 + 8) = 45;
      }
    }
    else
    {
      if ((v11 & 1) == 0)
      {
        if (v12)
          return 22;
        a4[1] = 1;
        *((_BYTE *)a4 + 8) = 43;
        v11 |= 1u;
      }
      *a4 = v11 & 0xF8000001 | (32 * (v13 & 0xFFC0FFFF | (((v11 >> 5) & 0x3F) << 16))) | (2
                                                                                        * ((((v11 >> 1) & 0xF | 0x10)
                                                                                          - 6
                                                                                          * ((unsigned __int16)(43 * ((v11 >> 1) & 0xF | 0x10)) >> 8)) & 0x7F));
      v15 = ((v11 >> 1) & 0xF) + 22;
      do
      {
        v16 = (int)a4[1];
        v17 = base64[(((*a4 >> 5) & 0x3FFFFF) >> (v15 - 12)) & 0x3FLL];
        a4[1] = v16 + 1;
        *((_BYTE *)a4 + v16 + 8) = v17;
        v15 -= 6;
      }
      while (v15 > 0xB);
    }
    v22 = (int)a4[1];
    memcpy(__dst, a4 + 2, v22);
    a4[1] = 0;
    __dst += v22;
    v9 += v22;
    ++v8;
    v10 = 1;
    if (v8 == v7)
    {
      result = 0;
      a5 = v24;
      goto LABEL_33;
    }
  }
  return 22;
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

