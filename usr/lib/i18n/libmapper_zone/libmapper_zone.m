double _citrus_mapper_zone_mapper_init(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  int *v13;
  int *v14;
  _DWORD *v15;
  double result;
  int tok;
  int v18;
  unsigned int v19;
  int v20;
  int v21;
  unsigned int v22;
  unsigned int v23;
  uint64_t v24[3];
  _QWORD v25[10];

  if (a7 >= 0x18)
  {
    v25[8] = v7;
    v25[9] = v8;
    v13 = (int *)malloc_type_malloc(0x1CuLL, 0x100004027586B93uLL);
    if (v13)
    {
      v14 = v13;
      *((_QWORD *)v13 + 1) = 0;
      v15 = v13 + 2;
      *(_QWORD *)v13 = 0;
      v13[6] = 0;
      *((_QWORD *)v13 + 2) = 0;
      v24[0] = a4;
      v24[1] = a5;
      v24[2] = 0;
      v25[0] = 0;
      v25[1] = 0;
      if (parse_zone(v24, v25, (unsigned int *)v13))
      {
LABEL_4:
        free(v14);
        return result;
      }
      tok = get_tok(v24, v25);
      v18 = tok;
      if (tok == 47)
      {
        *((_QWORD *)v14 + 1) = *(_QWORD *)v14;
        if (parse_zone(v24, v25, (unsigned int *)v14))
          goto LABEL_4;
        if (get_tok(v24, v25) != 47)
          goto LABEL_4;
        if (get_tok(v24, v25) != 257)
          goto LABEL_4;
        v19 = HIDWORD(v25[0]);
        v14[6] = HIDWORD(v25[0]);
        if (v19 > 0x20)
          goto LABEL_4;
        tok = get_tok(v24, v25);
      }
      else
      {
        v14[6] = 32;
        *((_QWORD *)v14 + 1) = 0;
      }
      if (tok == 58)
      {
        LODWORD(v25[0]) = 1;
        if (get_tok(v24, v25) != 257)
          goto LABEL_4;
        v20 = HIDWORD(v25[0]);
        v14[4] = HIDWORD(v25[0]);
        if (v18 == 47)
        {
          v14[5] = v20;
          if (get_tok(v24, v25) != 47 || get_tok(v24, v25) != 257)
            goto LABEL_4;
          v14[4] = HIDWORD(v25[0]);
        }
        else
        {
          v14[5] = 0;
        }
        tok = get_tok(v24, v25);
      }
      if (tok != -1)
        goto LABEL_4;
      v21 = v14[6];
      v22 = v21 == 32 ? 0 : 1 << v21;
      if (check_rowcol(v14, v14[4], v22))
        goto LABEL_4;
      v23 = v21 ? 1 << -(char)v21 : 0;
      if (check_rowcol(v15, v14[5], v23))
        goto LABEL_4;
      *(_QWORD *)(a2 + 8) = v14;
      *(_QWORD *)(a6 + 16) = 1;
      result = 0.0;
      *(_OWORD *)a6 = xmmword_24B74DF80;
    }
    else
    {
      __error();
    }
  }
  return result;
}

uint64_t _citrus_mapper_zone_mapper_convert(uint64_t a1, uint64_t *a2)
{
  int *v2;
  uint64_t v3;
  unsigned int *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  unsigned int v8;
  unsigned int v9;
  int v10;
  unsigned int v11;
  unsigned int v12;

  v2 = (int *)a2[2];
  if (*v2 < 1)
    return 0;
  v3 = 0;
  v4 = *(unsigned int **)(a1 + 8);
  v5 = *a2;
  v6 = a2[1];
  v7 = *(_DWORD *)(a1 + 64);
  while (1)
  {
    v8 = v4[6];
    v9 = *(_DWORD *)(v6 + 4 * v3);
    if (v8 != 32)
      break;
    if (v9 < *v4 || v9 > v4[1])
      goto LABEL_14;
    v10 = v4[4] + v9;
LABEL_12:
    *(_DWORD *)(v5 + 4 * v3++) = v10;
    if (v3 >= *v2)
      return 0;
  }
  v11 = v9 >> v8;
  if (v9 >> v8 >= v4[2] && v11 <= v4[3])
  {
    v12 = v9 & ~(-1 << v8);
    if (v12 >= *v4 && v12 <= v4[1])
    {
      v10 = ((v4[5] + v11) << v8) | (v4[4] + v12);
      goto LABEL_12;
    }
  }
LABEL_14:
  *v2 = v3;
  return ((v7 & 3) << 29) | 1u;
}

uint64_t _citrus_mapper_zone_mapper_getops(_OWORD *a1)
{
  __int128 v1;

  v1 = *(_OWORD *)&off_2579AF380;
  *a1 = _citrus_mapper_zone_mapper_ops;
  a1[1] = v1;
  return 0;
}

uint64_t parse_zone(uint64_t *a1, _DWORD *a2, unsigned int *a3)
{
  unsigned int v6;

  if (get_tok(a1, a2) != 257)
    return 0xFFFFFFFFLL;
  *a3 = a2[1];
  if (get_tok(a1, a2) != 45 || get_tok(a1, a2) != 257)
    return 0xFFFFFFFFLL;
  v6 = a2[1];
  a3[1] = v6;
  if (*a3 <= v6)
    return 0;
  else
    return 0xFFFFFFFFLL;
}

uint64_t get_tok(uint64_t *a1, _DWORD *a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;

  v2 = a1[1];
  v3 = a1[2];
  if (v3 >= v2)
  {
    v5 = 0;
    v6 = 0xFFFFFFFFLL;
    goto LABEL_10;
  }
  v4 = *a1;
  v5 = 1;
  while (1)
  {
    v6 = *(unsigned __int8 *)(v4 + v3);
    if ((v6 - 9) >= 5 && (_DWORD)v6 != 32)
      break;
    a1[2] = ++v3;
    v5 = v3 < v2;
    if (v2 == v3)
    {
      v5 = 0;
      v6 = 0xFFFFFFFFLL;
      v3 = v2;
      goto LABEL_10;
    }
  }
  if (*(_BYTE *)(v4 + v3))
  {
LABEL_10:
    if (*a2 == 1)
    {
      if ((v6 - 48) < 0xA || (_DWORD)v6 == 43 || (_DWORD)v6 == 45)
        return get_imm(a1, (uint64_t)a2);
      if ((_DWORD)v6 == 47)
      {
        if (v5)
          a1[2] = v3 + 1;
        return 47;
      }
    }
    else if (!*a2)
    {
      if ((v6 - 48) >= 0xA)
      {
        v7 = 256;
        if (v6 <= 0x3A && ((1 << v6) & 0x400A00000000000) != 0)
        {
          if (v5)
            a1[2] = v3 + 1;
          return v6;
        }
        return v7;
      }
      return get_imm(a1, (uint64_t)a2);
    }
    return 256;
  }
  return 0xFFFFFFFFLL;
}

uint64_t check_rowcol(_DWORD *a1, int a2, unsigned int a3)
{
  unsigned int v3;
  BOOL v4;
  unsigned int v5;
  int v6;

  if (a3)
  {
    v3 = a1[1];
    v4 = a3 >= v3;
    v5 = a3 - v3;
    if (v5 == 0 || !v4)
      return 0xFFFFFFFFLL;
    if (a2 <= 0)
      goto LABEL_12;
  }
  else
  {
    if (a2 <= 0)
    {
LABEL_12:
      if (a2 < 0 && *a1 < -a2)
        return 0xFFFFFFFFLL;
      return 0;
    }
    v6 = a1[1];
    if (v6)
      v5 = -v6;
    else
      v5 = -1;
  }
  if (v5 < a2)
    return 0xFFFFFFFFLL;
  return 0;
}

uint64_t get_imm(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  int v11;
  char *__endptr;
  char __str[21];
  uint64_t v15;

  v3 = 0;
  v4 = 0;
  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a1[1];
  v6 = a1[2];
  while (1)
  {
    v7 = v6;
    v8 = v4;
LABEL_3:
    v9 = v8;
    while (1)
    {
      if (v7 >= v5)
      {
        v8 = 0xFFFFFFFFLL;
        if (v3)
        {
LABEL_15:
          if (v8 - 58 > 0xFFFFFFF5
            || (v8 & 0xDF) - 71 > 0xFFFFFFF9
            || v3 == 1 && (_DWORD)v8 == 120)
          {
            goto LABEL_19;
          }
          goto LABEL_23;
        }
      }
      else
      {
        v8 = *(unsigned __int8 *)(*a1 + v7);
        if (v3)
          goto LABEL_15;
      }
      if ((_DWORD)v9 || (_DWORD)v8 != 45 && (_DWORD)v8 != 43)
        break;
      v9 = v8;
      if (v7 < v5)
      {
        a1[2] = ++v7;
        goto LABEL_3;
      }
    }
    if (v8 - 58 < 0xFFFFFFF6)
      break;
    v6 = v7;
    v4 = v9;
LABEL_19:
    if (v7 >= v5)
    {
      v10 = -1;
    }
    else
    {
      a1[2] = v6 + 1;
      v10 = *(_BYTE *)(*a1 + v6++);
    }
    __str[v3++] = v10;
    if (v3 == 20)
    {
LABEL_23:
      LODWORD(v9) = v4;
      goto LABEL_25;
    }
  }
  LODWORD(v3) = 0;
LABEL_25:
  __endptr = 0;
  __str[v3] = 0;
  v11 = strtoul(__str, &__endptr, 0);
  *(_DWORD *)(a2 + 4) = v11;
  if (__endptr - __str != v3)
    return 256;
  if ((_DWORD)v9 == 45)
    *(_DWORD *)(a2 + 4) = -v11;
  return 257;
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

