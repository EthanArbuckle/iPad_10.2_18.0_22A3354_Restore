uint64_t _citrus_GBK2K_stdenc_init(uint64_t a1, char *a2, unint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  int *v9;
  int *v10;
  char v11;
  uint64_t result;

  v8 = 4;
  v9 = (int *)malloc_type_calloc(1uLL, 4uLL, 0x100004052888210uLL);
  if (!v9)
    return *__error();
  v10 = v9;
  *v9 = 4;
  if (a3)
  {
    do
    {
      v11 = *a2;
      if ((*a2 - 91) >= 0xE6u)
        v11 = *a2 + 32;
      if (a3 >= 7 && v11 == 50 && !_citrus_bcs_strncasecmp())
      {
        *v10 = 2;
        a2 += 7;
        a3 -= 7;
      }
      ++a2;
      --a3;
    }
    while (a3);
    v8 = *v10;
  }
  result = 0;
  *(_QWORD *)(a1 + 8) = v10;
  *a4 = 8;
  a4[1] = v8;
  a4[2] = 1;
  return result;
}

void _citrus_GBK2K_stdenc_uninit(uint64_t a1)
{
  if (a1)
    free(*(void **)(a1 + 8));
}

uint64_t _citrus_GBK2K_stdenc_mbtocs(uint64_t a1, int *a2, unsigned int *a3, char **a4, uint64_t a5, int *a6, _QWORD *a7, uint64_t a8)
{
  uint64_t v12;
  unsigned int v14;
  int v15;
  unsigned int v16;

  v16 = 0;
  v12 = _citrus_GBK2K_mbrtowc_priv(*(_DWORD **)(a1 + 8), (int *)&v16, a4, a5, a6, a7);
  if ((_DWORD)v12)
    return v12;
  if (*a7 != -2)
  {
    v14 = v16;
    if (v16 <= 0x7F)
    {
      *a2 = 0;
LABEL_13:
      *a3 = v14;
      goto LABEL_14;
    }
    if (v16 < 0x10000)
    {
      if ((v16 & 0xFF00) > 0xA000 && v16 >= 0xA1u)
      {
        *a2 = 1;
        v14 &= 0x7F7Fu;
        goto LABEL_13;
      }
      v15 = 2;
    }
    else
    {
      v15 = 3;
    }
    *a2 = v15;
    goto LABEL_13;
  }
LABEL_14:
  if (a8 && *(_QWORD *)a8)
    (*(void (**)(_QWORD, _QWORD))a8)(*a3, *(_QWORD *)(a8 + 16));
  return v12;
}

uint64_t _citrus_GBK2K_stdenc_cstomb(uint64_t a1, void *a2, unint64_t a3, int a4, unsigned int a5, uint64_t a6, size_t *a7)
{
  int v7;
  unsigned int v8;
  uint64_t result;

  v7 = a4 + 1;
  v8 = 0;
  switch(v7)
  {
    case 0:
      goto LABEL_7;
    case 1:
    case 3:
      v8 = a5;
      goto LABEL_7;
    case 2:
      v8 = a5 | 0x8080;
      goto LABEL_7;
    case 4:
      v8 = a5;
      if (**(_DWORD **)(a1 + 8) == 4)
LABEL_7:
        result = _citrus_GBK2K_wcrtomb_priv(*(_DWORD **)(a1 + 8), a2, a3, v8, a6, a7);
      else
        result = 22;
      break;
    default:
      result = 92;
      break;
  }
  return result;
}

uint64_t _citrus_GBK2K_stdenc_mbtowc(uint64_t a1, int *a2, char **a3, uint64_t a4, int *a5, _QWORD *a6, uint64_t a7)
{
  uint64_t v9;
  uint64_t v10;
  void (*v11)(_QWORD, _QWORD);

  v9 = _citrus_GBK2K_mbrtowc_priv(*(_DWORD **)(a1 + 8), a2, a3, a4, a5, a6);
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

uint64_t _citrus_GBK2K_stdenc_wctomb(uint64_t a1, void *a2, unint64_t a3, unsigned int a4, uint64_t a5, size_t *a6)
{
  return _citrus_GBK2K_wcrtomb_priv(*(_DWORD **)(a1 + 8), a2, a3, a4, a5, a6);
}

uint64_t _citrus_GBK2K_stdenc_put_state_reset(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  *a5 = 0;
  return 0;
}

uint64_t _citrus_GBK2K_stdenc_get_state_desc(uint64_t a1, _DWORD *a2, int a3, int *a4)
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

uint64_t _citrus_GBK2K_stdenc_getops(uint64_t a1)
{
  __int128 v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;

  v1 = unk_2579AEE30;
  *(_OWORD *)a1 = _citrus_GBK2K_stdenc_ops;
  *(_OWORD *)(a1 + 16) = v1;
  v2 = xmmword_2579AEE40;
  v3 = *(_OWORD *)&off_2579AEE50;
  v4 = xmmword_2579AEE60;
  *(_QWORD *)(a1 + 80) = qword_2579AEE70;
  *(_OWORD *)(a1 + 48) = v3;
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 32) = v2;
  return 0;
}

uint64_t _citrus_GBK2K_mbrtowc_priv(_DWORD *a1, int *a2, char **a3, uint64_t a4, int *a5, _QWORD *a6)
{
  char *v6;
  int v7;
  uint64_t v8;
  int v10;
  char v11;
  int v12;
  int v13;
  uint64_t result;
  int v15;
  unsigned int v16;
  uint64_t v17;
  int v18;

  v6 = *a3;
  if (*a3)
  {
    v7 = *a5;
    v8 = 0;
    switch(*a5)
    {
      case 0:
        goto LABEL_9;
      case 1:
        goto LABEL_8;
      case 2:
        goto LABEL_4;
      case 3:
        if ((*((_BYTE *)a5 + 6) + 127) > 0x7Du)
          goto LABEL_23;
LABEL_4:
        v8 = (v7 - 1);
        if (*((unsigned __int8 *)a5 + v8 + 4) - 58 < 0xFFFFFFF6 || *((char *)a5 + v8 + 4) < -1)
          goto LABEL_23;
LABEL_8:
        if ((*((_BYTE *)a5 + v8 + 4) + 127) > 0x7Du)
        {
LABEL_23:
          result = 22;
        }
        else
        {
LABEL_9:
          if (a4)
          {
            v10 = *a5;
            while (2)
            {
              v11 = *v6++;
              *a5 = v10 + 1;
              *((_BYTE *)a5 + v10 + 4) = v11;
              v10 = *a5;
              switch(*a5)
              {
                case 1:
                  v12 = *((char *)a5 + 4);
                  if ((v12 & 0x80000000) == 0)
                    goto LABEL_26;
                  if ((v12 + 127) <= 0x7D)
                    goto LABEL_21;
                  goto LABEL_33;
                case 2:
                  if (*((char *)a5 + 5) < -1)
                    goto LABEL_26;
                  v13 = *((unsigned __int8 *)a5 + 5);
                  if ((v13 - 64) < 0x3F)
                    goto LABEL_26;
                  if (*a1 != 4 || (v13 - 48) >= 0xA)
                    goto LABEL_33;
                  goto LABEL_21;
                case 3:
                  if ((*((_BYTE *)a5 + 6) + 127) < 0x7Eu)
                    goto LABEL_21;
                  goto LABEL_33;
                case 4:
                  if (*((unsigned __int8 *)a5 + 7) - 48 > 9)
                  {
LABEL_33:
                    *a6 = -1;
                    return 92;
                  }
                  else
                  {
LABEL_26:
                    v15 = 0;
                    v16 = v10 + 1;
                    v17 = 4;
                    do
                    {
                      v15 = *((unsigned __int8 *)a5 + v17) | (v15 << 8);
                      --v16;
                      ++v17;
                    }
                    while (v16 > 1);
                    if (a2)
                      *a2 = v15;
                    result = 0;
                    *a3 = v6;
                    v18 = v10 - v7;
                    if (!v15)
                      v18 = 0;
                    *a6 = v18;
                    *a5 = 0;
                  }
                  return result;
                default:
LABEL_21:
                  if (!--a4)
                    break;
                  continue;
              }
              break;
            }
          }
          result = 0;
          *a3 = v6;
          *a6 = -2;
        }
        break;
      default:
        goto LABEL_23;
    }
  }
  else
  {
    result = 0;
    *a5 = 0;
    *a6 = 0;
  }
  return result;
}

uint64_t _citrus_GBK2K_wcrtomb_priv(_DWORD *a1, void *__dst, unint64_t a3, unsigned int a4, uint64_t a5, size_t *a6)
{
  uint64_t result;
  unint64_t v8;
  size_t v10;

  if (*(_DWORD *)a5)
  {
    result = 22;
LABEL_21:
    *a6 = -1;
    return result;
  }
  v8 = 4;
  if (a4 < 0x10000)
    v8 = 2;
  if (a4 < 0x100)
    v8 = 1;
  if (v8 > a3)
  {
    result = 7;
    goto LABEL_21;
  }
  if (v8 == 4)
  {
    if (*a1 != 4)
      goto LABEL_20;
    *(_DWORD *)a5 = 1;
    *(_BYTE *)(a5 + 4) = HIBYTE(a4);
    if ((a4 + 2130706432) >> 25 > 0x3E)
      goto LABEL_20;
    *(_DWORD *)a5 = 2;
    *(_BYTE *)(a5 + 5) = BYTE2(a4);
    if ((HIWORD(a4) & 0xFE) - 48 > 9u)
      goto LABEL_20;
    *(_DWORD *)a5 = 3;
    *(_BYTE *)(a5 + 6) = BYTE1(a4);
    result = 92;
    if (BYTE1(a4) < 0x81u)
      goto LABEL_21;
    if (BYTE1(a4) == 255)
      goto LABEL_21;
    v10 = 4;
    *(_DWORD *)a5 = 4;
    *(_BYTE *)(a5 + 7) = a4;
    if ((a4 & 0xFE) - 48 > 9)
      goto LABEL_21;
  }
  else
  {
    if (v8 != 2)
    {
      v10 = 1;
      *(_DWORD *)a5 = 1;
      *(_BYTE *)(a5 + 4) = a4;
      if ((a4 & 0x80) == 0)
        goto LABEL_28;
LABEL_20:
      result = 92;
      goto LABEL_21;
    }
    *(_DWORD *)a5 = 1;
    *(_BYTE *)(a5 + 4) = BYTE1(a4);
    result = 92;
    if (BYTE1(a4) < 0x81u || BYTE1(a4) == 255)
      goto LABEL_21;
    v10 = 2;
    *(_DWORD *)a5 = 2;
    *(_BYTE *)(a5 + 5) = a4;
    if (a4 - 64 >= 0x3F)
    {
      if (a4 < 0x80u || a4 == 255)
        goto LABEL_21;
      v10 = 2;
    }
  }
LABEL_28:
  memcpy(__dst, (const void *)(a5 + 4), v10);
  result = 0;
  *a6 = v10;
  *(_DWORD *)a5 = 0;
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

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

