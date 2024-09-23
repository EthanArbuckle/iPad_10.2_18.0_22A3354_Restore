uint64_t _citrus_ISO2022_stdenc_init(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v7;
  _QWORD *v8;
  unsigned int v9;
  const char *v10;
  unsigned int v11;
  unint64_t v12;
  int v13;
  char v16;
  uint64_t v17;
  const char *v18;
  char v19;
  int v20;
  BOOL v21;
  BOOL v22;
  char v23;
  char v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  char *v30;
  char *v31;
  char *v32;
  uint64_t result;
  int v34;
  uint64_t v35;
  uint64_t v36;
  _BYTE __str[6];
  __int16 __c_2;
  char v39;
  char v40;
  char v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v7 = malloc_type_calloc(1uLL, 0x58uLL, 0x10200402AC5C75EuLL);
  if (!v7)
    return *__error();
  v8 = v7;
  if (a2)
  {
    v35 = a1;
    v36 = a4;
    v7[10] = 0;
    *(_OWORD *)v7 = 0u;
    *((_OWORD *)v7 + 1) = 0u;
    *((_OWORD *)v7 + 2) = 0u;
    *((_OWORD *)v7 + 3) = 0u;
    v9 = *(unsigned __int8 *)a2;
    if (*a2)
    {
      v34 = 0;
      while (1)
      {
        v10 = a2;
        while (v9 == 9 || v9 == 32)
        {
          v11 = *(unsigned __int8 *)++v10;
          v9 = v11;
          ++a2;
        }
        v12 = 0;
        while (v9 > 0x20 || ((1 << v9) & 0x100000201) == 0)
          v9 = v10[++v12];
        if (!v12)
          goto LABEL_96;
        if (v12 > 0x13)
          goto LABEL_97;
        snprintf(__str, 0x14uLL, "%.*s", v12, v10);
        v13 = __str[0];
        if (memchr("0123", __str[0], 5uLL))
        {
          if (__str[1] == 61)
            break;
        }
        if (*(_DWORD *)__str == 1414090313 && (v20 = __str[4], memchr("0123", __str[4], 5uLL)) && __str[5] == 61)
        {
          v21 = __c_2 == 13369 && v39 == 36;
          if (v21 && (v23 = v40) != 0 && !v41)
          {
            v24 = 2;
          }
          else
          {
            v22 = __c_2 == 13881 && v39 == 36;
            if (v22 && (v23 = v40) != 0 && !v41)
            {
              v24 = 3;
            }
            else if (__c_2 != 13369 || (v23 = v39) == 0 || (v24 = v40) != 0)
            {
              if (__c_2 != 13881 || (v23 = v39) == 0 || v40)
              {
LABEL_97:
                free((void *)*v8);
                free((void *)v8[1]);
                free((void *)v8[2]);
                free((void *)v8[3]);
                goto LABEL_98;
              }
              v24 = 1;
            }
          }
          v32 = (char *)v8 + 4 * v20;
          *(v32 - 128) = v24;
          *(v32 - 127) = v23;
          *((_WORD *)v32 - 63) = 0;
        }
        else
        {
          if (*(_DWORD *)__str ^ 0x3158414D | __str[4])
          {
            if (*(_DWORD *)__str ^ 0x3258414D | __str[4])
            {
              if (*(_DWORD *)__str ^ 0x3358414D | __str[4])
              {
                v17 = 0;
                v18 = "DUMMY";
                while (strcmp(__str, v18))
                {
                  v18 = (&get_flags_tags)[v17 + 2];
                  v17 += 2;
                  if (v17 == 32)
                    goto LABEL_97;
                }
                v34 |= LODWORD((&get_flags_tags)[v17 + 1]);
                *((_DWORD *)v8 + 21) = v34;
                goto LABEL_87;
              }
              v25 = 3;
            }
            else
            {
              v25 = 2;
            }
          }
          else
          {
            v25 = 1;
          }
          *((_DWORD *)v8 + 20) = v25;
        }
LABEL_87:
        a2 = &v10[v12];
        v9 = v10[v12];
        if (!v10[v12])
          goto LABEL_96;
      }
      if (*(unsigned __int16 *)&__str[2] == 13369 && __str[4] == 36)
      {
        v19 = __str[5];
        if (__str[5])
        {
          if (!(_BYTE)__c_2)
          {
            v16 = 2;
LABEL_81:
            v27 = v13 - 48;
            v28 = (void *)v8[v27];
            if (v28)
            {
              v29 = v8[v27 + 4];
              v30 = (char *)malloc_type_realloc(v28, 4 * v29 + 4, 0x100004052888210uLL);
              if (!v30)
                goto LABEL_97;
              v8[v27] = v30;
            }
            else
            {
              v30 = (char *)malloc_type_malloc(4uLL, 0x100004052888210uLL);
              v8[v27] = v30;
              if (!v30)
                goto LABEL_97;
              v29 = v8[v27 + 4];
            }
            v8[v27 + 4] = v29 + 1;
            v31 = &v30[4 * v29];
            v31[1] = v19;
            *((_WORD *)v31 + 1) = 0;
            *v31 = v16;
            goto LABEL_87;
          }
        }
      }
      if (*(unsigned __int16 *)&__str[2] == 13881 && __str[4] == 36)
      {
        v19 = __str[5];
        if (__str[5])
        {
          if (!(_BYTE)__c_2)
          {
            v16 = 3;
            goto LABEL_81;
          }
        }
      }
      if (*(unsigned __int16 *)&__str[2] == 13369)
      {
        v19 = __str[4];
        if (__str[4])
        {
          if (!__str[5])
          {
            v16 = 0;
            goto LABEL_81;
          }
        }
      }
      if (*(unsigned __int16 *)&__str[2] == 13881)
      {
        v19 = __str[4];
        if (__str[4])
        {
          if (!__str[5])
          {
            v16 = 1;
            goto LABEL_81;
          }
        }
      }
      if (*(unsigned __int16 *)&__str[2] ^ 0x3439 | __str[4])
      {
        if (*(unsigned __int16 *)&__str[2] ^ 0x3639 | __str[4])
        {
          if (*(_DWORD *)&__str[2] == 2372665)
          {
            v16 = 2;
          }
          else
          {
            if (*(_DWORD *)&__str[2] != 2373177)
              goto LABEL_97;
            v16 = 3;
          }
          v26 = 5;
          goto LABEL_80;
        }
        v16 = 1;
      }
      else
      {
        v16 = 0;
      }
      v26 = 4;
LABEL_80:
      v19 = __str[v26];
      goto LABEL_81;
    }
LABEL_96:
    result = 0;
    *(_QWORD *)(v35 + 8) = v8;
    *(_OWORD *)v36 = xmmword_24B733A60;
    *(_QWORD *)(v36 + 16) = 1;
  }
  else
  {
LABEL_98:
    free(v8);
    return 79;
  }
  return result;
}

void _citrus_ISO2022_stdenc_uninit(uint64_t a1)
{
  if (a1)
    free(*(void **)(a1 + 8));
}

uint64_t _citrus_ISO2022_stdenc_init_state(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  _BYTE *v6;
  char v7;
  _BYTE *v8;

  v2 = 0;
  v3 = *(_QWORD *)(a1 + 8);
  if ((*(_DWORD *)(v3 + 84) & 1) != 0)
    v4 = 8;
  else
    v4 = 56;
  *(_WORD *)(a2 + 16) = v4 | *(_WORD *)(a2 + 16) & 0xFFC0;
  v5 = v3 + 66;
  do
  {
    v6 = (_BYTE *)(v5 + v2);
    v7 = *(_BYTE *)(v5 + v2 - 1);
    if (v7)
    {
      v8 = (_BYTE *)(a2 + 1 + v2);
      *(v8 - 1) = *(v6 - 2);
      *v8 = v7;
      v8[1] = *v6;
    }
    v2 += 4;
  }
  while (v2 != 16);
  *(_WORD *)(a2 + 16) |= 0xFC0u;
  *(_DWORD *)(a2 + 40) |= 1u;
  return 0;
}

uint64_t _citrus_ISO2022_stdenc_mbtocs(uint64_t a1, int *a2, unsigned int *a3, char **a4, unint64_t a5, uint64_t a6, uint64_t *a7, uint64_t a8)
{
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  unsigned int v16;
  int v17;
  int v18;
  int v20;

  v20 = 0;
  v12 = _citrus_ISO2022_mbrtowc_priv(*(_QWORD *)(a1 + 8), &v20, a4, a5, a6, a7);
  if (!(_DWORD)v12)
  {
    if (*a7 != -2)
    {
      if ((v20 & 0x800000) != 0)
        v13 = 2147451008;
      else
        v13 = 2130739328;
      v14 = v13 & v20;
      if ((v20 & 0x800000) != 0)
        v15 = 32639;
      else
        v15 = 8355711;
      v16 = v15 & v20;
      if ((v20 & 0x7F00) != 0)
        v17 = v14 | 0x7F00;
      else
        v17 = v14;
      v18 = v14 | 0x7F0000;
      if (v16 >= 0x10000)
        v17 = v18;
      *a2 = v17;
      *a3 = v16;
    }
    if (a8 && *(_QWORD *)a8)
      (*(void (**)(_QWORD, _QWORD))a8)(*a3, *(_QWORD *)(a8 + 16));
  }
  return v12;
}

uint64_t _citrus_ISO2022_stdenc_cstomb(uint64_t a1, void *a2, size_t a3, int a4, int a5, uint64_t a6, size_t *a7)
{
  unsigned int v7;

  if (a4 == -1)
    v7 = 0;
  else
    v7 = a4 & 0x7F808080 | a5;
  return _citrus_ISO2022_wcrtomb_priv(*(_QWORD *)(a1 + 8), a2, a3, v7, a6, a7);
}

uint64_t _citrus_ISO2022_stdenc_mbtowc(uint64_t a1, _DWORD *a2, char **a3, unint64_t a4, uint64_t a5, uint64_t *a6, uint64_t a7)
{
  uint64_t v9;
  uint64_t v10;
  void (*v11)(_QWORD, _QWORD);

  v9 = _citrus_ISO2022_mbrtowc_priv(*(_QWORD *)(a1 + 8), a2, a3, a4, a5, a6);
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

uint64_t _citrus_ISO2022_stdenc_wctomb(uint64_t a1, void *a2, size_t a3, unsigned int a4, uint64_t a5, size_t *a6)
{
  return _citrus_ISO2022_wcrtomb_priv(*(_QWORD *)(a1 + 8), a2, a3, a4, a5, a6);
}

uint64_t _citrus_ISO2022_stdenc_put_state_reset(uint64_t a1, void *a2, unint64_t a3, uint64_t a4, size_t *a5)
{
  uint64_t v8;
  uint64_t result;
  size_t v10;
  unint64_t v11;
  char __src[6];
  uint64_t v13;

  v8 = *(_QWORD *)(a1 + 8);
  v13 = 0;
  v11 = 0;
  result = _ISO2022_sputwchar(v8, 0, __src, &v13, a4, (uint64_t *)&v11);
  v10 = v11;
  if (!(_DWORD)result)
  {
    if (v11 <= 6 && (v10 = v11 - 1, v11 - 1 <= a3))
    {
      memcpy(a2, __src, v10);
      result = 0;
    }
    else
    {
      result = 7;
      v10 = -1;
    }
  }
  *a5 = v10;
  return result;
}

uint64_t _citrus_ISO2022_stdenc_get_state_desc(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t result;
  int v5;

  if (a3)
    return 102;
  if (*(_QWORD *)(a2 + 32))
  {
    if (*(_BYTE *)(a2 + 18) == 27)
      v5 = 4;
    else
      v5 = 3;
  }
  else
  {
    v5 = 2;
  }
  result = 0;
  *a4 = v5;
  return result;
}

uint64_t _citrus_ISO2022_stdenc_getops(uint64_t a1)
{
  __int128 v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;

  v1 = *(_OWORD *)&off_2579AEEE0;
  *(_OWORD *)a1 = _citrus_ISO2022_stdenc_ops;
  *(_OWORD *)(a1 + 16) = v1;
  v2 = xmmword_2579AEEF0;
  v3 = *(_OWORD *)&off_2579AEF00;
  v4 = xmmword_2579AEF10;
  *(_QWORD *)(a1 + 80) = qword_2579AEF20;
  *(_OWORD *)(a1 + 48) = v3;
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 32) = v2;
  return 0;
}

uint64_t _citrus_ISO2022_mbrtowc_priv(uint64_t a1, _DWORD *a2, char **a3, unint64_t a4, uint64_t a5, uint64_t *a6)
{
  uint64_t *v6;
  char *v8;
  unint64_t v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  _BYTE *v13;
  char v14;
  _BYTE *v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  _BYTE *v21;
  char v22;
  _BYTE *v23;
  int v27;
  uint64_t v28;
  char *v29;
  unint64_t v30;
  char v31;
  int v32;
  char *v33;
  unint64_t v34;
  char *v35;
  int v36;
  int v37;
  int64_t v38;
  int v39;
  unint64_t v40;
  BOOL v41;
  unint64_t v42;
  uint64_t *v43;
  void *__src;

  v6 = a6;
  v8 = *a3;
  if (*a3)
  {
    v9 = *(_QWORD *)(a5 + 32);
    if (v9 >= 8)
    {
      v43 = a6;
      v10 = 0;
      *(_OWORD *)(a5 + 16) = 0u;
      *(_OWORD *)(a5 + 32) = 0u;
      *(_OWORD *)a5 = 0u;
      if ((*(_DWORD *)(a1 + 84) & 1) != 0)
        v11 = 8;
      else
        v11 = 56;
      *(_WORD *)(a5 + 16) = v11 | *(_WORD *)(a5 + 16) & 0xFFC0;
      v12 = a1 + 66;
      do
      {
        v13 = (_BYTE *)(v12 + v10);
        v14 = *(_BYTE *)(v12 + v10 - 1);
        if (v14)
        {
          v15 = (_BYTE *)(a5 + 1 + v10);
          *(v15 - 1) = *(v13 - 2);
          *v15 = v14;
          v15[1] = *v13;
        }
        v10 += 4;
      }
      while (v10 != 16);
      *(_WORD *)(a5 + 16) |= 0xFC0u;
      *(_DWORD *)(a5 + 40) |= 1u;
LABEL_11:
      *(_QWORD *)(a5 + 32) = 0;
      result = 92;
      v17 = -1;
      v6 = v43;
      goto LABEL_51;
    }
    __src = 0;
    if (v9)
    {
      v43 = a6;
      v27 = 0;
      v28 = a5 + 18;
      v29 = (char *)(a5 + 18);
      while (1)
      {
        v30 = *(_QWORD *)(a5 + 32);
        if (v30 > 6)
          goto LABEL_11;
        if (a4)
        {
          v31 = *v8++;
          *(_QWORD *)(a5 + 32) = v30 + 1;
          *(_BYTE *)(a5 + v30 + 18) = v31;
          --a4;
          v30 = *(_QWORD *)(a5 + 32);
        }
        v32 = _ISO2022_sgetwchar(v29, v28 - (_QWORD)v29 + v30, &__src, a5);
        v33 = (char *)((_BYTE *)__src - v29);
        v27 += (_DWORD)__src - (_DWORD)v29;
        if (v32 != -1)
        {
          v39 = v32;
          v40 = *(_QWORD *)(a5 + 32);
          if (v40 > v27)
          {
            memmove((void *)(a5 + 18), __src, v40 - v27);
            v40 = *(_QWORD *)(a5 + 32);
          }
          v41 = v40 >= v27;
          v42 = v40 - v27;
          if (!v41)
            v42 = 0;
          v6 = v43;
          goto LABEL_40;
        }
        v29 = (char *)__src;
        if (!a4)
        {
          if (v33 == *(char **)(a5 + 32))
          {
            v34 = 0;
            v35 = v8;
            goto LABEL_47;
          }
          v35 = v8;
          goto LABEL_49;
        }
      }
    }
    v36 = 0;
    while (1)
    {
      v37 = _ISO2022_sgetwchar(v8, a4, &__src, a5);
      v35 = (char *)__src;
      if (v37 != -1)
        break;
      v38 = (_BYTE *)__src - v8;
      if (__src <= v8)
      {
        v43 = v6;
        v34 = a4 + v36;
        if (v34 > 6)
          goto LABEL_11;
        memcpy((void *)(a5 + 18), &v8[-v36], a4 + v36);
LABEL_47:
        *(_QWORD *)(a5 + 32) = v34;
LABEL_49:
        v6 = v43;
LABEL_50:
        result = 0;
        *a3 = v35;
        v17 = -2;
        goto LABEL_51;
      }
      v36 += v38;
      v8 = (char *)__src;
      a4 -= v38;
      if (!a4)
        goto LABEL_50;
    }
    v39 = v37;
    v42 = 0;
    v27 = (_DWORD)__src - (_DWORD)v8 + v36;
    v8 = (char *)__src;
LABEL_40:
    *(_QWORD *)(a5 + 32) = v42;
    *a3 = v8;
    if (a2)
      *a2 = v39;
    result = 0;
    v17 = v27 - (int)v9;
    if (!v39)
      v17 = 0;
  }
  else
  {
    v18 = 0;
    *(_OWORD *)(a5 + 16) = 0u;
    *(_OWORD *)(a5 + 32) = 0u;
    *(_OWORD *)a5 = 0u;
    if ((*(_DWORD *)(a1 + 84) & 1) != 0)
      v19 = 8;
    else
      v19 = 56;
    *(_WORD *)(a5 + 16) = v19 | *(_WORD *)(a5 + 16) & 0xFFC0;
    v20 = a1 + 66;
    do
    {
      v21 = (_BYTE *)(v20 + v18);
      v22 = *(_BYTE *)(v20 + v18 - 1);
      if (v22)
      {
        v23 = (_BYTE *)(a5 + 1 + v18);
        *(v23 - 1) = *(v21 - 2);
        *v23 = v22;
        v23[1] = *v21;
      }
      v18 += 4;
    }
    while (v18 != 16);
    result = 0;
    *(_WORD *)(a5 + 16) |= 0xFC0u;
    *(_DWORD *)(a5 + 40) |= 1u;
    v17 = 1;
  }
LABEL_51:
  *v6 = v17;
  return result;
}

uint64_t _ISO2022_sgetwchar(char *a1, unint64_t a2, _QWORD *a3, uint64_t a4)
{
  int v8;
  uint64_t v9;
  __int16 v10;
  int v11;
  int *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  __int16 v18;
  _BYTE *v19;
  _BYTE *v20;
  _BYTE *v21;
  _BYTE *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int *v26;
  int v27;
  int v28;
  int v29;
  char v30;
  int v31;
  char v32;
  int v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  int v37;
  int v38;
  int v40;
  int v41;
  int v42;
  _BYTE *v43;
  unsigned int v44;
  uint64_t v45;
  int v46;
  int v47;
  int v49;

  while (1)
  {
    while (1)
    {
LABEL_1:
      if (!a2)
        goto LABEL_11;
      v8 = *a1;
      if (v8 == 14)
      {
        v10 = *(_WORD *)(a4 + 16) & 0xFFF8 | 1;
        goto LABEL_9;
      }
      v9 = *a1;
      if ((_DWORD)v9 != 15)
        break;
      v10 = *(_WORD *)(a4 + 16) & 0xFFF8;
LABEL_9:
      *(_WORD *)(a4 + 16) = v10;
      ++a1;
      --a2;
    }
    if (!*a1)
      goto LABEL_101;
    if (memchr("\x8F\x8E", v8, 3uLL))
    {
      v10 = *(_WORD *)(a4 + 16) & 0xF03F | ((((_BYTE)v9 + 4) & 7) << 9) | ((((_BYTE)v9 + 4) & 7) << 6);
      goto LABEL_9;
    }
    if ((_DWORD)v9 != 27)
      goto LABEL_47;
LABEL_11:
    v11 = 3;
    v12 = &seqtable;
    while (1)
    {
      v13 = seqmatch(a1, a2, (uint64_t)v12);
      if (a2 >= v11 && v11 == v13)
        break;
      v11 = v12[21];
      v12 += 16;
      if (!v11)
        goto LABEL_38;
    }
    v14 = *v12;
    if ((_DWORD)v14 == -1)
      break;
    v15 = v12[1];
    if ((_DWORD)v15 == -1)
    {
      v16 = 0;
    }
    else
    {
      if (v14 > 3)
        return 0xFFFFFFFFLL;
      v16 = qword_24B733EC0[v14] + a1[v15];
    }
    v19 = (_BYTE *)(a4 + 4 * v16);
    *v19 = v14;
    v20 = v19 + 2;
    *(_WORD *)(v19 + 1) = 0;
    v21 = v19 + 1;
    v19[3] = 0;
    v22 = v19 + 3;
    v23 = v12[2];
    if ((_DWORD)v23 != -1)
      *v21 = a1[v23];
    v24 = v12[3];
    if ((_DWORD)v24 != -1)
      *v20 = a1[v24];
    v25 = v12[4];
    if ((_DWORD)v25 != -1)
      *v22 = a1[v25];
    a1 += v11;
    a2 -= v11;
  }
  if (a2 >= 2 && *a1 == 27)
  {
    v17 = a1[1];
    if (a1[1])
    {
      if (memchr("no", a1[1], 3uLL))
      {
        v18 = *(_WORD *)(a4 + 16) & 0xFFF8 | (v17 + 4) & 7;
LABEL_37:
        *(_WORD *)(a4 + 16) = v18;
        a1 += 2;
        a2 -= 2;
        goto LABEL_1;
      }
      if (memchr("~}|", v17, 4uLL))
      {
        v18 = *(_WORD *)(a4 + 16) & 0xFFC7 | (56 - 8 * (_BYTE)v17) & 0x38;
        goto LABEL_37;
      }
      if (memchr("NO", v17, 3uLL))
      {
        v18 = *(_WORD *)(a4 + 16) & 0xFE3F | ((((_BYTE)v17 + 4) & 7) << 6);
        goto LABEL_37;
      }
    }
  }
LABEL_38:
  v26 = &seqtable;
  v27 = 3;
  do
  {
    v28 = seqmatch(a1, a2, (uint64_t)v26);
    if (v28)
    {
      if (a2 >= v27)
      {
        if (v28 == v27)
          break;
      }
      else if (a2 == v28)
      {
        goto LABEL_74;
      }
    }
    v27 = v26[21];
    v26 += 16;
  }
  while (v27);
  if (!a2)
  {
LABEL_74:
    if (a3)
      *a3 = a1;
    return 0xFFFFFFFFLL;
  }
  v9 = *a1;
LABEL_47:
  if (v9 < 0x20 || (v9 - 127) < 0x21u)
    goto LABEL_101;
  v29 = *(unsigned __int16 *)(a4 + 16);
  v30 = 4;
  if ((v9 & 0x80u) == 0)
    v30 = 7;
  v31 = v29 << v30 << 16 >> 29;
  v32 = 10;
  if ((v9 & 0x80u) == 0)
    v32 = 13;
  v33 = v29 << v32 << 16 >> 29;
  if (v31 == -1)
    v31 = v33;
  if (v31 == -1)
  {
LABEL_101:
    if (a3)
      *a3 = a1 + 1;
    LOWORD(v29) = *(_WORD *)(a4 + 16);
    goto LABEL_104;
  }
  v34 = (__int16)v31;
  v35 = *(unsigned __int8 *)(a4 + 4 * (__int16)v31);
  if ((v35 & 0xFE) != 2)
    goto LABEL_64;
  if ((*(_BYTE *)(a4 + 4 * v34 + 1) & 0xF0) != 0x60)
  {
    if (a2 >= 2 && ((a1[1] ^ v9) & 0x80) == 0)
      goto LABEL_64;
    goto LABEL_74;
  }
  if (a2 < 3 || (v9 & 0x80) != (a1[1] & 0x80) || (v9 & 0x80) != (a1[2] & 0x80))
    goto LABEL_74;
LABEL_64:
  switch(v35)
  {
    case 0:
      if (((v9 & 0x7F) - 33) >= 0x5Eu)
        goto LABEL_101;
      v36 = a4 + 4 * v34;
      v37 = *(unsigned __int8 *)(v36 + 1);
      v38 = *(unsigned __int8 *)(v36 + 2);
      if (v37 == 66 && v38 == 0)
      {
        ++a1;
        v9 &= 0x7Fu;
      }
      else
      {
        if (v38)
          v40 = (v38 << 16) | 0x800000;
        else
          v40 = 0;
        ++a1;
        v9 = v40 | (v37 << 24) | (v9 & 0x7F);
      }
      break;
    case 1:
      if ((v9 & 0x60) == 0)
        goto LABEL_101;
      v45 = a4 + 4 * v34;
      v46 = *(unsigned __int8 *)(v45 + 1);
      v47 = *(unsigned __int8 *)(v45 + 2);
      if (v46 == 65 && v47 == 0)
      {
        ++a1;
        v9 = v9 | 0x80;
      }
      else
      {
        if (v47)
          v49 = (v47 << 16) | 0x800000;
        else
          v49 = 0;
        ++a1;
        v9 = v49 | (v46 << 24) | v9 | 0x80;
      }
      break;
    case 2:
      v41 = v9 & 0x7F;
      if (((v9 & 0x7F) - 33) > 0x5Du || (a1[1] & 0x7Fu) - 33 >= 0x5E)
        goto LABEL_101;
      goto LABEL_83;
    case 3:
      if ((v9 & 0x60) == 0 || (a1[1] & 0x60) == 0)
        goto LABEL_101;
      v41 = v9 & 0x7F;
LABEL_83:
      v42 = *(unsigned __int8 *)(a4 + 4 * v34 + 1);
      if ((v42 & 0xF0) == 0x60)
        v43 = a1 + 1;
      else
        v43 = a1;
      if ((v42 & 0xF0) != 0x60)
        v41 = 0;
      a1 = v43 + 2;
      v44 = (v42 << 24) | (v41 << 16) | ((*v43 & 0x7F) << 8) | v43[1] & 0x7F;
      if (v35 == 3)
        v9 = v44 | 0x80;
      else
        v9 = v44;
      break;
    default:
      v9 = 0;
      break;
  }
  if (a3)
    *a3 = a1;
LABEL_104:
  *(_WORD *)(a4 + 16) = v29 | 0xFC0;
  return v9;
}

uint64_t seqmatch(_BYTE *a1, unint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  char *v11;
  size_t v12;

  if (!a2)
    return 0;
  v6 = 0;
  v7 = 24;
  v8 = *(int *)(a3 + 20);
  while (2)
  {
    if (v6 < v8)
    {
      v9 = *(_DWORD *)(a3 + v7);
      switch(v9)
      {
        case -3:
          v10 = (char)*a1;
          if (*a1)
          {
            v11 = "@AB";
            v12 = 4;
            goto LABEL_18;
          }
          break;
        case -2:
          if ((*a1 & 0xF0) == 0x20)
            goto LABEL_19;
          break;
        case -1:
          if ((char)*a1 > 47)
            goto LABEL_19;
          break;
        case 0:
          v10 = (char)*a1;
          if (*a1)
          {
            v11 = "()*+";
            goto LABEL_17;
          }
          break;
        case 1:
          v10 = (char)*a1;
          if (*a1)
          {
            v11 = ",-./";
LABEL_17:
            v12 = 5;
LABEL_18:
            if (memchr(v11, v10, v12))
              goto LABEL_19;
          }
          break;
        default:
          if (v9 == (char)*a1)
          {
LABEL_19:
            ++a1;
            v6 = (v7 - 20) >> 2;
            v7 += 4;
            if (v6 < a2)
              continue;
          }
          break;
      }
    }
    return v6;
  }
}

uint64_t _citrus_ISO2022_wcrtomb_priv(uint64_t a1, void *a2, size_t a3, unsigned int a4, uint64_t a5, size_t *a6)
{
  uint64_t result;
  size_t v10;
  size_t __n;
  char __src[6];
  uint64_t v14;

  v14 = 0;
  __n = 0;
  result = _ISO2022_sputwchar(a1, a4, __src, &v14, a5, (uint64_t *)&__n);
  v10 = __n;
  if (!(_DWORD)result)
  {
    if (__n > 6 || __n > a3)
    {
      result = 7;
      v10 = -1;
    }
    else
    {
      memcpy(a2, __src, __n);
      result = 0;
    }
  }
  *a6 = v10;
  return result;
}

uint64_t _ISO2022_sputwchar(uint64_t a1, unsigned int a2, char *__dst, _QWORD *a4, uint64_t a5, uint64_t *a6)
{
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  int v10;
  int v11;
  char v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  unsigned __int8 *v16;
  _QWORD *v17;
  uint64_t v18;
  unsigned __int8 *v19;
  int v20;
  uint64_t v21;
  _BYTE *v22;
  uint64_t v23;
  char *p_src;
  char *v25;
  _QWORD *v26;
  char *v27;
  uint64_t *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  unsigned int v32;
  int v33;
  int v34;
  uint64_t result;
  uint64_t v36;
  int v37;
  int v38;
  int v39;
  char v40;
  char v41;
  unsigned int v42;
  unsigned int v43;
  int v44;
  uint64_t *v45;
  char v46;
  unsigned int v48;
  uint64_t v49;
  char __src;
  char v51;
  int v52;

  v7 = a1;
  v8 = a2;
  if (a2 > 0x1Fu)
  {
    if ((char)a2 > -97)
    {
      if (a2 > 0xFF)
      {
        v10 = HIBYTE(a2) & 0x7F;
        v11 = HIWORD(a2) & ((int)(a2 << 8) >> 31) & 0x7F;
        if ((a2 & 0x7F00) != 0)
          v12 = 3;
        else
          v12 = 1;
        if ((a2 & 0x80) != 0)
          LOBYTE(v9) = v12;
        else
          LOBYTE(v9) = 2 * ((a2 & 0x7F00) != 0);
      }
      else
      {
        LOBYTE(v11) = 0;
        v9 = (a2 & 0x80) >> 7;
        if ((a2 & 0x80) != 0)
          LOBYTE(v10) = 65;
        else
          LOBYTE(v10) = 66;
      }
      goto LABEL_20;
    }
    if (!*(_BYTE *)(a1 + 69))
    {
      LOBYTE(v11) = 0;
      LOBYTE(v9) = 1;
      LOBYTE(v10) = 65;
      goto LABEL_20;
    }
    v9 = *(_DWORD *)(a1 + 68);
  }
  else
  {
    if (!*(_BYTE *)(a1 + 65))
    {
      LOBYTE(v11) = 0;
      LOBYTE(v9) = 0;
      LOBYTE(v10) = 66;
      goto LABEL_20;
    }
    v9 = *(_DWORD *)(a1 + 64);
  }
  v10 = v9 >> 8;
  v11 = HIWORD(v9);
LABEL_20:
  v13 = 0;
  while (1)
  {
    v14 = (_QWORD *)(a1 + 8 * v13);
    v15 = v14[4];
    if (v15)
      break;
LABEL_27:
    if (++v13 == 4)
    {
      v13 = 0;
      while (1)
      {
        v17 = (_QWORD *)(a1 + 8 * v13);
        v18 = v17[4];
        if (v18)
          break;
LABEL_37:
        if (++v13 == 4)
        {
          if (*(_DWORD *)(a1 + 80))
            LODWORD(v13) = (((_BYTE)v9 - 1) & 0xFD) == 0;
          else
            LODWORD(v13) = 0;
          goto LABEL_41;
        }
      }
      v19 = (unsigned __int8 *)(*v17 + 2);
      while (*(v19 - 2) != v9
           || (_BYTE)v10 && *(v19 - 1) != v10
           || (_BYTE)v11 && *v19 != v11)
      {
        v19 += 4;
        if (!--v18)
          goto LABEL_37;
      }
      goto LABEL_41;
    }
  }
  v16 = (unsigned __int8 *)(*v14 + 2);
  while (*(v16 - 2) != v9 || *(v16 - 1) != v10 || *v16 != v11)
  {
    v16 += 4;
    if (!--v15)
      goto LABEL_27;
  }
LABEL_41:
  v20 = *(_DWORD *)(a1 + 84);
  v21 = (int)v13;
  v22 = (_BYTE *)(a5 + 4 * (int)v13);
  if (*v22 != v9
    || (v23 = a5 + 4 * (int)v13, *(unsigned __int8 *)(v23 + 1) != v10)
    || *(unsigned __int8 *)(v23 + 2) != v11)
  {
    __src = 27;
    if ((v9 & 0xFE) == 2)
    {
      v25 = (char *)&v52;
      v51 = 36;
      if ((_DWORD)v21)
        goto LABEL_54;
    }
    else
    {
      v25 = &v51;
      if ((_DWORD)v21)
        goto LABEL_54;
    }
    if (v9 == 2)
    {
      v46 = v20;
      v48 = a2;
      v49 = a5;
      v26 = a4;
      v27 = __dst;
      v28 = a6;
      v29 = memchr("@AB", v10, 4uLL);
      v30 = "()*+";
      if (!v29 || (_BYTE)v11)
      {
        a6 = v28;
        __dst = v27;
        a4 = v26;
        a5 = v49;
        v8 = v48;
        v7 = a1;
        LOBYTE(v20) = v46;
      }
      else
      {
        a6 = v28;
        __dst = v27;
        a4 = v26;
        a5 = v49;
        v8 = v48;
        v7 = a1;
        LOBYTE(v20) = v46;
        if ((v46 & 2) == 0)
        {
LABEL_61:
          *v25 = v10;
          p_src = v25 + 1;
          *v22 = v9;
          v31 = a5 + 4 * v21;
          *(_BYTE *)(v31 + 1) = v10;
          *(_BYTE *)(v31 + 2) = v11;
          goto LABEL_62;
        }
      }
LABEL_58:
      *v25 = v30[v21];
      if ((_BYTE)v11)
      {
        v25[1] = v11;
        v25 += 2;
      }
      else
      {
        ++v25;
      }
      goto LABEL_61;
    }
LABEL_54:
    v30 = ",-./";
    if ((v9 & 0xFD) == 0)
      v30 = "()*+";
    goto LABEL_58;
  }
  p_src = &__src;
LABEL_62:
  v32 = *(unsigned __int16 *)(a5 + 16);
  if ((_DWORD)v21 != (int)(v32 << 29) >> 29 && ((v20 & 1) == 0 || (_DWORD)v21 != (__int16)((_WORD)v32 << 10) >> 13))
  {
    switch((int)v21)
    {
      case 0:
        if ((*(_BYTE *)(v7 + 84) & 0x10) == 0)
          goto LABEL_110;
        *p_src++ = 15;
        v32 = *(_WORD *)(a5 + 16) & 0xFFF8;
        goto LABEL_95;
      case 1:
        v34 = *(_DWORD *)(v7 + 84);
        if ((v34 & 0x20) != 0)
        {
          *p_src++ = 14;
          v32 = *(_WORD *)(a5 + 16) & 0xFFF8 | 1;
          goto LABEL_95;
        }
        result = 92;
        v36 = -1;
        if ((v20 & 1) != 0 && (v34 & 0x100) != 0)
        {
          *(_WORD *)p_src = 32283;
          p_src += 2;
          v32 = *(_WORD *)(a5 + 16) & 0xFFC7 | 8;
          goto LABEL_95;
        }
        goto LABEL_122;
      case 2:
        v33 = *(_DWORD *)(v7 + 84);
        if ((v33 & 0x40) != 0)
        {
          *(_WORD *)p_src = 28187;
          p_src += 2;
          v32 = *(_WORD *)(a5 + 16) & 0xFFF8 | 2;
          goto LABEL_95;
        }
        if ((v20 & 1) != 0 && (v33 & 0x200) != 0)
        {
          *(_WORD *)p_src = 32027;
          p_src += 2;
          v32 = *(_WORD *)(a5 + 16) & 0xFFC7 | 0x10;
          goto LABEL_95;
        }
        v38 = *(_DWORD *)(v7 + 84);
        if ((v38 & 0x800) != 0)
        {
          *(_WORD *)p_src = 19995;
          p_src += 2;
          v32 = *(_WORD *)(a5 + 16) & 0xFE3F | 0x80;
          goto LABEL_95;
        }
        result = 92;
        v36 = -1;
        if ((v20 & 1) != 0 && (v38 & 0x2000) != 0)
        {
          *(_WORD *)p_src = 20110;
          p_src += 2;
          v39 = *(unsigned __int16 *)(a5 + 16);
          v40 = 18;
          goto LABEL_91;
        }
        goto LABEL_122;
      case 3:
        v37 = *(_DWORD *)(v7 + 84);
        if ((v37 & 0x80) != 0)
        {
          *(_WORD *)p_src = 28443;
          p_src += 2;
          v32 = *(_WORD *)(a5 + 16) & 0xFFF8 | 3;
          goto LABEL_95;
        }
        if ((v20 & 1) == 0)
        {
          if ((v37 & 0x1000) == 0)
            goto LABEL_110;
          goto LABEL_92;
        }
        if ((v37 & 0x400) != 0)
        {
          *(_WORD *)p_src = 31771;
          p_src += 2;
          v32 = *(_WORD *)(a5 + 16) & 0xFFC7 | 0x18;
        }
        else
        {
          if ((v37 & 0x1000) != 0)
          {
LABEL_92:
            *(_WORD *)p_src = 20251;
            p_src += 2;
            v32 = *(_WORD *)(a5 + 16) & 0xFE3F | 0xC0;
            goto LABEL_95;
          }
          if ((v37 & 0x4000) == 0)
            goto LABEL_110;
          *(_WORD *)p_src = 20367;
          p_src += 2;
          v39 = *(unsigned __int16 *)(a5 + 16);
          v40 = 27;
LABEL_91:
          v32 = v39 & 0xFFFFF03F | ((v40 & 0x3F) << 6);
        }
LABEL_95:
        *(_WORD *)(a5 + 16) = v32;
        break;
      default:
        goto LABEL_110;
    }
  }
  if ((_DWORD)v21 != (__int16)((_WORD)v32 << 7) >> 13)
  {
    if ((_DWORD)v21 == (__int16)(16 * v32) >> 13)
    {
LABEL_98:
      v41 = 0x80;
      goto LABEL_101;
    }
    if ((_DWORD)v21 != (int)(v32 << 29) >> 29)
    {
      if ((*(_BYTE *)(v7 + 84) & 1) == 0 || (_DWORD)v21 != (__int16)((_WORD)v32 << 10) >> 13)
        goto LABEL_110;
      goto LABEL_98;
    }
  }
  v41 = 0;
LABEL_101:
  if (v9 < 2u)
  {
    v42 = 1;
  }
  else
  {
    if (v9 - 2 > 1)
      goto LABEL_114;
    v42 = 1;
    if (v8 >= 0x20 && v8 - 127 >= 0x21)
    {
      if ((v10 & 0xF0) == 0x60)
        v42 = 3;
      else
        v42 = 2;
    }
  }
  if (&__src - p_src + 6 < (unint64_t)v42)
  {
LABEL_110:
    result = 92;
LABEL_118:
    v36 = -1;
    goto LABEL_122;
  }
  v43 = v42 + 1;
  v44 = 8 * v42 - 8;
  do
  {
    *p_src++ = ((int)a2 >> v44) & 0x7F | v41;
    --v43;
    v44 -= 8;
  }
  while (v43 > 1);
  LOWORD(v32) = *(_WORD *)(a5 + 16);
LABEL_114:
  *(_WORD *)(a5 + 16) = v32 | 0xFC0;
  v36 = p_src - &__src;
  if ((unint64_t)(p_src - &__src) >= 7)
  {
    if (a4)
      *a4 = 0;
    result = 7;
    goto LABEL_118;
  }
  v45 = a6;
  if (a4)
    *a4 = &__dst[v36];
  memcpy(__dst, &__src, p_src - &__src);
  result = 0;
  a6 = v45;
LABEL_122:
  *a6 = v36;
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

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED88](ptr, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE70](__s, *(_QWORD *)&__c, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

